-- =============================================================
-- Temp upload garbage collection (60-minute TTL) — monitoring side
-- =============================================================
-- Rule: files under temp/upload/ live at most 60 minutes. They are
-- either promoted to materi/{grade}/{slug}_files/ on save (see
-- saveMaterial in app/app/editor/actions.ts) or deleted by the sweeper.
--
-- IMPORTANT: Supabase blocks direct DELETEs on storage.objects
-- (protect_delete() trigger: "Use the Storage API instead"). So deletion
-- MUST go through the Storage API — i.e. the Vercel cron route
-- app/api/cron/cleanup-temp/route.ts (service-role key) and the
-- best-effort sweep inside saveMaterial. This file only provides
-- read-only observability for that process.
--
-- Same-name temp uploads silently overwrite each other (client uploads
-- with upsert: true to a deterministic temp/upload/<filename> path),
-- so the sweeper only deletes by age — no name arbitration needed.
-- =============================================================

-- Remove the old delete-based function if it was created by an earlier
-- version of this file (it cannot work — direct DELETE is blocked).
drop function if exists public.cleanup_expired_temp_uploads();

-- Expired temp uploads: rows the sweeper should have removed already.
-- Empty result = sweeper is healthy. Non-empty + old created_at =
-- the cron route is not firing (check Vercel Cron Jobs logs).
create or replace view public.temp_uploads_expired as
select name, created_at, updated_at
from storage.objects
where bucket_id = 'materials'
  and name like 'temp/upload/%'
  and created_at < now() - interval '60 minutes'
order by created_at;

-- All temp uploads currently alive (for debugging).
create or replace view public.temp_uploads_pending as
select name, created_at, updated_at
from storage.objects
where bucket_id = 'materials'
  and name like 'temp/upload/%'
order by created_at;
