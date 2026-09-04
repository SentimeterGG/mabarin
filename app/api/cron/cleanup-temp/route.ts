import { NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";
import { TEMP_PREFIX, TEMP_TTL_MINUTES } from "@/lib/storage-paths";

// Vercel cron (see vercel.json) hits this daily as a backstop to enforce
// the 60-minute TTL on temp/upload/ drafts (Hobby plans allow daily crons
// only). Prompt cleanup happens on every save via the sweep inside
// saveMaterial, so this route just catches abandoned drafts. This is the
// ONLY deleter — direct SQL DELETEs on storage.objects are blocked by
// Supabase (protect_delete), so pg_cron cannot do this job (see
// supabase/storage-cleanup.sql, which only provides read-only views).
//
// Auth: Vercel's scheduler sends a plain GET it cannot attach a Bearer
// header to, so it is recognized by its `vercel-cron/1.0` user agent
// instead. Any other caller must present CRON_SECRET (Bearer header or
// ?secret=) when it is configured; with no secret configured the route
// is open (dev convenience). Spoofing the UA gains nothing: the route
// only deletes already-expired temp drafts and is fully idempotent.
export async function GET(request: Request) {
  const fromVercelCron = (request.headers.get("user-agent") ?? "").startsWith("vercel-cron/");
  if (!fromVercelCron) {
    const secret = process.env.CRON_SECRET;
    if (secret) {
      const url = new URL(request.url);
      const auth = request.headers.get("authorization");
      if (auth !== `Bearer ${secret}` && url.searchParams.get("secret") !== secret) {
        return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
      }
    }
  }

  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
  if (!url || !serviceKey) {
    return NextResponse.json({ error: "Server misconfigured" }, { status: 500 });
  }

  const supabase = createClient(url, serviceKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  });
  const storage = supabase.storage.from("materials");

  const cutoff = Date.now() - TEMP_TTL_MINUTES * 60 * 1000;
  const { data, error } = await storage.list(TEMP_PREFIX, {
    limit: 1000,
    sortBy: { column: "created_at", order: "asc" },
  });
  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  const expired = (data ?? [])
    .filter((f) => f.created_at && new Date(f.created_at).getTime() < cutoff)
    .map((f) => `${TEMP_PREFIX}${f.name}`);

  let removed = 0;
  for (let i = 0; i < expired.length; i += 100) {
    const batch = expired.slice(i, i + 100);
    const { error: rmError } = await storage.remove(batch);
    if (rmError) {
      return NextResponse.json({ error: rmError.message, removed }, { status: 500 });
    }
    removed += batch.length;
  }

  return NextResponse.json({ removed, ttlMinutes: TEMP_TTL_MINUTES });
}
