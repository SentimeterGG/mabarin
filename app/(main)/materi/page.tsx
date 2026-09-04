import MateriFilter, { MateriItem } from "@/components/materi-filter";
import { createClient } from "@/lib/supabase/server";
import { SupabaseClient } from "@supabase/supabase-js";
import { cookies } from "next/headers";
import { resolveImageSrc } from "@/lib/storage-paths";

const BADGES: Record<number, string> = {
  1: "Kelas X",
  2: "Kelas XI",
  3: "Kelas XII",
};

async function getMaterials(supabase: SupabaseClient): Promise<MateriItem[]> {
  const { data: materials } = await supabase
    .from("materials")
    .select("id, title, short_desc, grade, slug, image")
    .order("title", { ascending: true });

  if (!materials) return [];

  return materials.map((m) => {
    const grade = Number(m.grade);
    return {
      id: Number(m.id),
      image: resolveImageSrc(m.image, grade),
      alt: m.title,
      badge: BADGES[grade] ?? "Kelas X",
      grade: String(grade),
      title: m.title,
      description: m.short_desc,
      href: `materi/${grade}/${m.id}`,
    };
  });
}

export default async function Materi() {
  const cookieStore = await cookies();
  const supabase = createClient(cookieStore);
  const materi = await getMaterials(supabase);
  const { data: claims } = await supabase.auth.getClaims();

  return (
    <div className="mt-25 flex justify-center mb-25">
      <div className="container">
        <h1 className="mb-2 text-2xl">
          <span className="text-primary">Materi</span>
        </h1>
        <p className="text-foreground mb-12">
          Koleksi lengkap sumber daya, catatan, dan panduan teknis yang telah dikurasi untuk <br />
          menemani perjalanan belajarmu di dunia informatika.
        </p>
        <MateriFilter materi={materi} admin={Boolean(claims)} />
      </div>
    </div>
  );
}
