import { createClient } from "@supabase/supabase-js";
import { readFile } from "node:fs/promises";
import { constants } from "node:fs";
import { access } from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { createInterface } from "node:readline/promises";
import { stdin, stdout } from "node:process";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

// --- Config -------------------------------------------------------------
// Source directory holding per-material asset folders, e.g.:
//   public/materi/1/algoritma_files/1poina.svg
const SRC_DIR = path.resolve(__dirname, "../public/materi/1");

const BUCKET = "materials";
// Storage root inside the bucket, e.g. "materi/1" -> materi/1/<folder>/<file>
const STORAGE_ROOT = "materi/1";

const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
// ------------------------------------------------------------------------

if (!url || !serviceKey) {
  console.error(
    "Missing env: set NEXT_PUBLIC_SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY in .env.local, then run with:\n" +
      "  node --env-file=.env.local scripts/upload-assets.mjs",
  );
  process.exit(1);
}

const supabase = createClient(url, serviceKey, {
  auth: { persistSession: false, autoRefreshToken: false },
});

function inferContentType(filename) {
  const ext = path.extname(filename).toLowerCase();
  const map = {
    ".svg": "image/svg+xml",
    ".png": "image/png",
    ".jpg": "image/jpeg",
    ".jpeg": "image/jpeg",
    ".gif": "image/gif",
    ".webp": "image/webp",
    ".avif": "image/avif",
  };
  return map[ext] ?? "application/octet-stream";
}

async function listDir(dir) {
  const { readdir } = await import("node:fs/promises");
  return readdir(dir, { withFileTypes: true });
}

async function collectFiles(dir, base = "") {
  const out = [];
  const entries = await listDir(dir);
  for (const entry of entries) {
    const abs = path.join(dir, entry.name);
    const rel = path.posix.join(base, entry.name);
    if (entry.isDirectory()) {
      out.push(...(await collectFiles(abs, rel)));
    } else {
      out.push({ abs, rel });
    }
  }
  return out;
}

async function main() {
  await access(SRC_DIR).catch(() => {
    console.error(`Source dir not found: ${SRC_DIR}`);
    process.exit(1);
  });

  const files = await collectFiles(SRC_DIR);
  console.log(`Found ${files.length} files under ${SRC_DIR}`);
  if (files.length === 0) process.exit(0);

  const rl = createInterface({ input: stdin, output: stdout });
  const ans = await rl.question(`Upload all to ${BUCKET}/${STORAGE_ROOT}? (y/N) `);
  rl.close();
  if (ans.trim().toLowerCase() !== "y") {
    console.log("Aborted.");
    process.exit(0);
  }

  let ok = 0;
  let failed = 0;
  for (const file of files) {
    const destPath = path.posix.join(STORAGE_ROOT, file.rel);
    try {
      const data = await readFile(file.abs);
      const { error } = await supabase.storage.from(BUCKET).upload(destPath, data, {
        upsert: true,
        contentType: inferContentType(file.rel),
      });
      if (error) throw new Error(error.message);
      ok++;
      console.log(`OK  ${destPath}`);
    } catch (err) {
      failed++;
      console.error(`ERR ${destPath}: ${err.message}`);
    }
  }

  console.log(`\nDone. Uploaded ${ok}, failed ${failed}.`);
}

main();
