const BUCKET = "materials";

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL ?? "";

export const storageBucket = BUCKET;

/**
 * Resolve a material asset reference to a fully-qualified public URL.
 *
 * Handles three input forms:
 *   - `<slug>_files/foo.png`    (relative — as stored in markdown content)
 *   - `/materi/<grade>/<slug>_files/foo.png`  (site-relative db image path)
 *   - already a full public URL (returned unchanged)
 *
 * If `grade` is provided and the reference is relative, it is rooted under
 * `materi/{grade}/`. Returns the absolute Supabase Storage public URL.
 */
export function resolveImageSrc(ref: string | null | undefined, grade?: number): string {
  if (!ref) return "";
  const base = publicBaseUrl();

  // Already a full URL (absolute http(s)) -> return as-is.
  if (/^https?:\/\//i.test(ref)) return ref;

  // Strip a leading slash, then drop an optional "materi/<grade>/" prefix so we
  // always rebuild a clean bucket-relative path.
  let path = ref.replace(/^\/+/, "");
  path = path.replace(/^materi\/\d+\//, "");

  const folderPrefix = `materi/${grade}/`;
  return `${base}/${folderPrefix}${path}`;
}

/** Public base URL for the storage bucket. */
export function publicBaseUrl(): string {
  return `${supabaseUrl}/storage/v1/object/public/${BUCKET}`;
}

/** Relative (bucket-rooted) path for a permanent material asset. */
export function permanentRelPath(grade: number, slug: string, filename: string): string {
  return `materi/${grade}/${slug}_files/${filename}`;
}

/** Prefix (bucket-relative) for temporary draft uploads. */
export const TEMP_PREFIX = "temp/upload/";

/**
 * TTL for files under temp/upload/, in minutes.
 * Rule: any temp file older than this is considered expired and may be
 * deleted by the cleanup job (see supabase/storage-cleanup.sql and
 * app/api/cron/cleanup-temp/route.ts).
 */
export const TEMP_TTL_MINUTES = 60;

/** Strip directories, whitespace and unsafe chars so the name is storage-safe. */
export function sanitizeFileName(filename: string): string {
  const base =
    filename.split("/").pop()?.split("\\").pop()?.trim() ?? "";
  const dashed = base.replace(/\s+/g, "-");
  const clean = dashed.replace(/[^a-zA-Z0-9._-]/g, "");
  const fallback = clean.replace(/^[.-]+/, "") || "file";
  return fallback.slice(0, 120);
}

/**
 * Relative (bucket-rooted) path for a temporary draft upload.
 *
 * Deterministic on the sanitized filename: uploading the same name twice
 * targets the same object, and callers use `upsert: true` so the second
 * upload silently overwrites the first. Combined with the 60-minute TTL,
 * temp files are either promoted on save or garbage-collected.
 */
export function tempRelPath(filename: string): string {
  return `${TEMP_PREFIX}${sanitizeFileName(filename)}`;
}

/** Turn a bucket-relative path into a public URL. */
export function toPublicUrl(relPath: string): string {
  return `${publicBaseUrl()}/${relPath}`;
}

/** True if the url is a public store URL inside our bucket. */
export function isBucketUrl(url: string): boolean {
  return url.startsWith(toPublicUrl(""));
}

/** Strip the public base URL prefix, returning the bucket-relative path. */
export function relFromPublicUrl(url: string): string {
  return url.replace(toPublicUrl(""), "").replace(/^\//, "");
}

/** True if the url points to a draft file under temp/upload/. */
export function isTempUrl(url: string): boolean {
  return isBucketUrl(url) && relFromPublicUrl(url).startsWith(TEMP_PREFIX);
}

/** True if a temp file with this creation time is older than the TTL. */
export function isTempExpired(
  createdAt: string | Date,
  now: Date = new Date(),
): boolean {
  const created = createdAt instanceof Date ? createdAt : new Date(createdAt);
  if (Number.isNaN(created.getTime())) return false;
  return now.getTime() - created.getTime() > TEMP_TTL_MINUTES * 60 * 1000;
}

/** Extract just the file name from a bucket-relative path. */
export function fileNameFromRel(relPath: string): string {
  return relPath.split("/").pop() ?? relPath;
}
