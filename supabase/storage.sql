-- =============================================================
-- Storage bucket + RLS for material assets
-- =============================================================

-- Public bucket holding all material images.
-- Folder layout:
--   temp/upload/            -> draft uploads (live under /temp/upload/)
--   materi/{grade}/{slug}_files/  -> finalized assets
insert into storage.buckets (id, name, public)
values ('materials', 'materials', true)
on conflict (id) do nothing;

-- Allow authenticated users to manage files in the bucket.
-- Storage policies operate on the bucket owner by default; these
-- grant full object access to the authenticated role.

drop policy if exists "authenticated can read materials bucket"
  on storage.objects;
create policy "authenticated can read materials bucket"
  on storage.objects for select to authenticated
  using (bucket_id = 'materials');

drop policy if exists "authenticated can insert materials bucket"
  on storage.objects;
create policy "authenticated can insert materials bucket"
  on storage.objects for insert to authenticated
  with check (bucket_id = 'materials');

drop policy if exists "authenticated can update materials bucket"
  on storage.objects;
create policy "authenticated can update materials bucket"
  on storage.objects for update to authenticated
  using (bucket_id = 'materials')
  with check (bucket_id = 'materials');

drop policy if exists "authenticated can delete materials bucket"
  on storage.objects;
create policy "authenticated can delete materials bucket"
  on storage.objects for delete to authenticated
  using (bucket_id = 'materials');

-- Anonymous users can read public files (the bucket is public).
drop policy if exists "anon can read materials bucket"
  on storage.objects;
create policy "anon can read materials bucket"
  on storage.objects for select to anon
  using (bucket_id = 'materials');

-- =============================================================
-- updated_at trigger (auto-managed, no app code needed)
-- =============================================================

create or replace function public.set_materials_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists set_materials_updated_at on public.materials;
create trigger set_materials_updated_at
  before update on public.materials
  for each row
  execute function public.set_materials_updated_at();
