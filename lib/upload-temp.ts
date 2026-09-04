import { createClient } from "@/lib/supabase/client";
import { storageBucket, tempRelPath, toPublicUrl } from "@/lib/storage-paths";

/**
 * Upload an image to temp/upload/ (60-min TTL, same-name silently
 * overwrites via upsert). Shared by the toolbar image button and the
 * "Gambar" ingredient so both behave identically.
 */
export async function uploadImageToTemp(file: File): Promise<string> {
  const supabase = createClient();
  const rel = tempRelPath(file.name);
  const { error } = await supabase.storage
    .from(storageBucket)
    .upload(rel, file, { upsert: true, contentType: file.type || "image/*" });
  if (error) throw new Error(error.message);
  return toPublicUrl(rel);
}

/** `photo.png` -> `photo` for the markdown caption. */
export function captionOfFile(filename: string): string {
  const base = filename.split("/").pop()?.split("\\").pop() ?? filename;
  return base.replace(/\.[^.]+$/, "").trim() || "gambar";
}
