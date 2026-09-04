"use server";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { cookies } from "next/headers";
import {
  permanentRelPath,
  fileNameFromRel,
  relFromPublicUrl,
  toPublicUrl,
  isTempUrl,
  isBucketUrl,
  storageBucket,
  TEMP_PREFIX,
  TEMP_TTL_MINUTES,
} from "@/lib/storage-paths";

export async function logout() {
  const cookieStore = await cookies();
  const supabase = createClient(cookieStore);
  await supabase.auth.signOut();
  redirect("/login");
}

export async function deleteMaterial(id: number) {
  const cookieStore = await cookies();
  const supabase = createClient(cookieStore);

  // Fetch asset references first so the storage folder can be cleaned up.
  const { data: existing } = await supabase
    .from("materials")
    .select("slug, grade, image, content")
    .eq("id", id)
    .maybeSingle();

  const { error } = await supabase.from("materials").delete().eq("id", id);
  if (error) {
    console.error("Delete failed:", error.message);
    return;
  }

  // Best-effort: remove the material's permanent asset folder so deleted
  // materials don't leave orphaned files in storage.
  if (existing) {
    try {
      const storage = supabase.storage.from(storageBucket);
      const folder = permanentRelPath(Number(existing.grade), String(existing.slug), "").slice(
        0,
        -1,
      );
      const { data: files } = await storage.list(folder, { limit: 1000 });
      const rels = (files ?? []).map((f) => `${folder}/${f.name}`);
      // Also cover the thumbnail if it lives outside the folder.
      const image = String(existing.image ?? "");
      if (isBucketUrl(image) && !isTempUrl(image)) {
        const rel = relFromPublicUrl(image);
        if (!rels.includes(rel)) rels.push(rel);
      }
      if (rels.length > 0) {
        const { error: rmError } = await storage.remove(rels);
        if (rmError) console.warn("deleteMaterial: storage cleanup:", rmError.message);
      }
    } catch (err) {
      console.warn("deleteMaterial: storage cleanup skipped:", err);
    }
  }

  redirect("/materi");
}

interface SaveMaterialInput {
  id?: number;
  title: string;
  description: string;
  grade: number;
  tags: string[];
  content: string;
  slug: string;
  image: string;
}

/**
 * Finalize a material on save:
 *  1. Copy any draft files from temp/upload/ to the permanent folder
 *     (same-name temp files silently overwrite each other on upload via
 *     `upsert: true`; here a same-name destination is overwritten too by
 *     removing it before copy, since storage.copy has no upsert flag).
 *  2. Rewrite image references inside the markdown `content`.
 *  3. Resolve the thumbnail (`image`) to its permanent path.
 *  4. Upsert the row (update by id, or insert a new one).
 *  5. Remove the consumed temp files + orphaned permanent files.
 *
 * Temp files not consumed by any save expire after TEMP_TTL_MINUTES and
 * are removed by the cleanup job (see supabase/storage-cleanup.sql and
 * app/api/cron/cleanup-temp/route.ts).
 */
export async function saveMaterial(input: SaveMaterialInput) {
  const cookieStore = await cookies();
  const supabase = createClient(cookieStore);
  const storage = supabase.storage.from(storageBucket);

  const grade = Number(input.grade);
  const folder = permanentRelPath(grade, input.slug, "").slice(0, -1);

  const consumedTemp = new Set<string>();
  // Cache temp rel -> permanent URL so the same temp file referenced twice
  // is copied only once (the second copy would race the temp deletion).
  const copyCache = new Map<string, string>();

  // storage.copy() fails when the destination already exists, so emulate
  // upsert: best-effort remove of the destination, then copy.
  const copyWithOverwrite = async (srcRel: string, destRel: string) => {
    await storage.remove([destRel]);
    const { error } = await storage.copy(srcRel, destRel);
    if (error) {
      throw new Error(`Copy failed for ${srcRel}: ${error.message}`);
    }
  };

  try {
    // Remember the old location so a slug/grade change can orphan-clean it.
    let oldFolder: string | null = null;
    if (input.id) {
      const { data: existing } = await supabase
        .from("materials")
        .select("slug, grade")
        .eq("id", input.id)
        .maybeSingle();
      if (existing) {
        oldFolder = permanentRelPath(Number(existing.grade), String(existing.slug), "").slice(
          0,
          -1,
        );
      }
    }

    // 1+2. Move content images and rewrite markdown.
    const rewrite = async (url: string): Promise<string> => {
      if (!isBucketUrl(url) || !isTempUrl(url)) return url;
      const rel = relFromPublicUrl(url);
      const cached = copyCache.get(rel);
      if (cached) {
        consumedTemp.add(rel);
        return cached;
      }
      const filename = fileNameFromRel(rel);
      const destRel = `${permanentRelPath(grade, input.slug, filename)}`;
      await copyWithOverwrite(rel, destRel);
      const destUrl = toPublicUrl(destRel);
      copyCache.set(rel, destUrl);
      consumedTemp.add(rel);
      return destUrl;
    };

    const content = await rewriteMarkdownImages(input.content, rewrite);

    // 3. Resolve the thumbnail.
    let image = input.image;
    if (isBucketUrl(image) && isTempUrl(image)) {
      const rel = relFromPublicUrl(image);
      const cached = copyCache.get(rel);
      if (cached) {
        image = cached;
      } else {
        const filename = fileNameFromRel(rel);
        const destRel = `${folder}/thumbnail${extensionOf(filename)}`;
        await copyWithOverwrite(rel, destRel);
        const destUrl = toPublicUrl(destRel);
        copyCache.set(rel, destUrl);
        image = destUrl;
      }
      consumedTemp.add(rel);
    }

    // 4. Upsert.
    if (input.id) {
      const { error } = await supabase
        .from("materials")
        .update({
          title: input.title,
          short_desc: input.description,
          grade,
          tags: input.tags,
          content,
          slug: input.slug,
          image,
        })
        .eq("id", input.id);
      if (error) throw new Error(`Update failed: ${error.message}`);
    } else {
      const { error } = await supabase.from("materials").insert({
        title: input.title,
        short_desc: input.description,
        grade,
        tags: input.tags,
        content,
        slug: input.slug,
        image,
      });
      if (error) throw new Error(`Insert failed: ${error.message}`);
    }

    // 5a. Remove consumed temp files (best-effort).
    if (consumedTemp.size > 0) {
      await storage.remove([...consumedTemp]);
    }

    // 5b. Best-effort sweep of expired temp files left behind by
    // abandoned drafts (60-min TTL). Failures must not fail the save.
    try {
      await removeExpiredTempFiles(storage);
    } catch (err) {
      console.warn("saveMaterial: temp sweep skipped:", err);
    }

    // 5c. Orphan cleanup inside the permanent folder (best-effort):
    // delete files no longer referenced by content/thumbnail, and drop the
    // abandoned old folder when slug/grade changed.
    try {
      await removeOrphanedPermanentFiles(storage, {
        folder,
        oldFolder,
        content,
        image,
      });
    } catch (err) {
      console.warn("saveMaterial: orphan cleanup skipped:", err);
    }

    return { ok: true as const, id: input.id ?? undefined };
  } catch (err) {
    console.error("saveMaterial:", err);
    return { ok: false as const, error: err instanceof Error ? err.message : String(err) };
  }
}

type StorageLike = ReturnType<ReturnType<typeof createClient>["storage"]["from"]>;

/** Delete temp/upload/ files older than the TTL. Returns removed count. */
export async function removeExpiredTempFiles(storage: StorageLike): Promise<number> {
  const cutoff = Date.now() - TEMP_TTL_MINUTES * 60 * 1000;
  const { data, error } = await storage.list(TEMP_PREFIX, {
    limit: 1000,
    sortBy: { column: "created_at", order: "asc" },
  });
  if (error) throw new Error(`Temp list failed: ${error.message}`);
  const expired = (data ?? [])
    .filter((f) => {
      if (!f.created_at) return false;
      return new Date(f.created_at).getTime() < cutoff;
    })
    .map((f) => `${TEMP_PREFIX}${f.name}`);
  if (expired.length === 0) return 0;
  // Remove in batches to stay under API limits.
  let removed = 0;
  for (let i = 0; i < expired.length; i += 100) {
    const batch = expired.slice(i, i + 100);
    const { error: rmError } = await storage.remove(batch);
    if (rmError) throw new Error(`Temp remove failed: ${rmError.message}`);
    removed += batch.length;
  }
  return removed;
}

async function removeOrphanedPermanentFiles(
  storage: StorageLike,
  opts: { folder: string; oldFolder: string | null; content: string; image: string },
) {
  const referenced = new Set<string>();
  for (const url of extractBucketRels(opts.content)) {
    referenced.add(url);
  }
  if (isBucketUrl(opts.image) && !isTempUrl(opts.image)) {
    referenced.add(relFromPublicUrl(opts.image));
  }

  const { data, error } = await storage.list(opts.folder, { limit: 1000 });
  if (!error && data) {
    const orphans = data
      .map((f) => `${opts.folder}/${f.name}`)
      .filter((rel) => !referenced.has(rel));
    if (orphans.length > 0) {
      await storage.remove(orphans);
    }
  }

  if (opts.oldFolder && opts.oldFolder !== opts.folder) {
    const { data: oldFiles } = await storage.list(opts.oldFolder, { limit: 1000 });
    if (oldFiles && oldFiles.length > 0) {
      await storage.remove(oldFiles.map((f) => `${opts.oldFolder}/${f.name}`));
    }
  }
}

/** Collect bucket-relative image URLs referenced in markdown content. */
function extractBucketRels(content: string): string[] {
  const out: string[] = [];
  const mdImageRegex = /!\[[^\]]*\]\(([^)\s]+)(?:\s+"[^"]*")?\)/g;
  let m: RegExpExecArray | null;
  while ((m = mdImageRegex.exec(content)) !== null) {
    const url = m[1];
    if (isBucketUrl(url) && !isTempUrl(url)) out.push(relFromPublicUrl(url));
  }
  return out;
}

async function rewriteMarkdownImages(
  content: string,
  rewrite: (url: string) => Promise<string>,
): Promise<string> {
  const mdImageRegex = /!\[[^\]]*\]\(([^)\s]+)(?:\s+"[^"]*")?\)/g;
  const matches: { full: string; url: string; from: number; to: number }[] = [];
  let m: RegExpExecArray | null;
  while ((m = mdImageRegex.exec(content)) !== null) {
    matches.push({ full: m[0], url: m[1], from: m.index, to: m.index + m[0].length });
  }

  let result = content;
  // Rewrite right-to-left so offsets stay valid.
  for (let i = matches.length - 1; i >= 0; i--) {
    const { full, url, from, to } = matches[i];
    const replaced = await rewrite(url);
    if (replaced !== url) {
      result = result.slice(0, from) + full.replace(url, replaced) + result.slice(to);
    }
  }
  return result;
}

function extensionOf(filename: string): string {
  const idx = filename.lastIndexOf(".");
  return idx >= 0 ? filename.slice(idx) : "";
}
