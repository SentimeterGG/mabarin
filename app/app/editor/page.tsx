import Link from "next/link";
import EditorInterface, { type InitialData } from "@/components/editor/editor-interface";
import { createClient } from "@/lib/supabase/server";
import { cookies } from "next/headers";
import { Button } from "@/components/ui/button";

export default async function EditorPage({
  searchParams,
}: {
  searchParams: Promise<{ id?: string }>;
}) {
  const { id } = await searchParams;

  // No ?id= → blank editor for a new material.
  if (!id) {
    return <EditorInterface initial={null} />;
  }

  const materialId = Number(id);
  if (!Number.isInteger(materialId) || materialId <= 0) {
    return <InvalidIdNotice requested={id} />;
  }

  const cookieStore = await cookies();
  const supabase = createClient(cookieStore);
  const { data } = await supabase
    .from("materials")
    .select("title, short_desc, image, grade, tags, content")
    .eq("id", materialId)
    .maybeSingle();

  if (!data) {
    return <InvalidIdNotice requested={id} />;
  }

  const initial: InitialData = {
    id: materialId,
    title: data.title ?? "",
    description: data.short_desc ?? "",
    image: data.image ?? "",
    grade: Number(data.grade ?? 1),
    tags: data.tags ?? [],
    content: data.content ?? "",
  };

  return <EditorInterface initial={initial} />;
}

function InvalidIdNotice({ requested }: { requested: string }) {
  return (
    <div className="flex h-screen items-center justify-center p-6">
      <div className="max-w-md text-center space-y-4">
        <h1 className="text-xl font-semibold">Materi tidak ditemukan</h1>
        <p className="text-base text-muted-foreground">
          Tidak ada materi dengan id &ldquo;{requested}&rdquo;. Mungkin sudah dihapus atau URL-nya
          salah.
        </p>
        <div className="flex justify-center gap-2">
          <Button asChild>
            <Link href="/app/editor">Buat materi baru</Link>
          </Button>
          <Button asChild variant="outline">
            <Link href="/materi">Kembali ke daftar</Link>
          </Button>
        </div>
      </div>
    </div>
  );
}
