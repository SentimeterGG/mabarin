"use client";

import { useEffect, useState, useRef } from "react";
import { X, Plus, Upload } from "lucide-react";
import { toast } from "sonner";
import { Button } from "@/components/ui/button";
import { resolveImageSrc } from "@/lib/storage-paths";
import { uploadImageToTemp } from "@/lib/upload-temp";

export interface SaveData {
  title: string;
  description: string;
  image: string;
  class: string;
  tags: string[];
  content: string;
  slug: string;
}

interface SaveModalProps {
  onClose: () => void;
  onSave: (data: SaveData) => void;
  content: string;
  initialData?: {
    title: string;
    description: string;
    image: string;
    grade: number;
    tags: string[];
  };
}

function slugify(title: string) {
  return title
    .toLowerCase()
    .replace(/[^\w\s-]/g, "")
    .replace(/\s+/g, "-")
    .replace(/-+/g, "-")
    .trim();
}

export default function SaveModal({ onClose, onSave, content, initialData }: SaveModalProps) {
  const [title, setTitle] = useState(initialData?.title ?? "");
  const [description, setDescription] = useState(initialData?.description ?? "");
  const [image, setImage] = useState(initialData?.image ?? "");
  const [cls, setCls] = useState(String(initialData?.grade ?? "1"));
  const [tagInput, setTagInput] = useState("");
  const [tags, setTags] = useState<string[]>(initialData?.tags ?? []);
  const [isUploading, setIsUploading] = useState(false);
  const thumbInputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === "Escape") onClose();
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [onClose]);

  const handleThumbnailUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    e.target.value = "";
    if (!file) return;
    setIsUploading(true);
    try {
      // Same temp/upload/ semantics as content images (60-min TTL,
      // same-name silent overwrite); promoted to thumbnail.* on save.
      setImage(await uploadImageToTemp(file));
    } catch (err) {
      const message = err instanceof Error ? err.message : "Upload gagal.";
      toast.error("Upload thumbnail gagal.", { description: message });
    } finally {
      setIsUploading(false);
    }
  };

  const addTag = () => {
    const tag = tagInput.trim();
    if (tag && !tags.includes(tag)) {
      setTags([...tags, tag]);
      setTagInput("");
    }
  };

  const removeTag = (tag: string) => {
    setTags(tags.filter((t) => t !== tag));
  };

  const handleSave = () => {
    if (!title.trim()) return;

    onSave({
      title: title.trim(),
      description: description.trim(),
      image: image.trim(),
      class: cls,
      tags,
      content,
      slug: slugify(title),
    });
  };

  const slug = title.trim() ? slugify(title) : "...";

  const previewSrc = image.trim() ? resolveImageSrc(image.trim(), Number(cls)) : "";

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center">
      <div className="absolute inset-0 bg-black/50 backdrop-blur-sm" onClick={onClose} />
      <div className="relative bg-card rounded-2xl shadow-xl w-full max-w-md mx-4 p-6 ring-1 ring-border">
        <div className="flex items-center justify-between mb-6">
          <h2 className="text-lg font-semibold">Simpan Materi</h2>
          <button onClick={onClose} className="p-1 rounded-lg hover:bg-muted transition-colors">
            <X className="size-4" />
          </button>
        </div>

        <div className="space-y-4">
          <div>
            <label className="block text-base font-medium mb-1.5">Judul</label>
            <input
              type="text"
              value={title}
              onChange={(e) => setTitle(e.target.value)}
              placeholder="Masukkan judul materi"
              className="w-full px-3 py-2 rounded-lg border border-border bg-background text-foreground text-base focus:outline-none focus:ring-2 focus:ring-ring/50"
            />
            {title.trim() && (
              <p className="text-base text-muted-foreground mt-1">
                Slug: /materi/{cls}/{slug}
              </p>
            )}
          </div>

          <div>
            <label className="block text-base font-medium mb-1.5">Deskripsi</label>
            <textarea
              value={description}
              onChange={(e) => setDescription(e.target.value)}
              placeholder="Deskripsi singkat materi"
              rows={2}
              className="w-full px-3 py-2 rounded-lg border border-border bg-background text-foreground text-base focus:outline-none focus:ring-2 focus:ring-ring/50 resize-none"
            />
          </div>

          <div>
            <label className="block text-base font-medium mb-1.5">
              URL Gambar (thumbnail)
            </label>
            <div className="flex gap-2">
              <input
                type="text"
                value={image}
                onChange={(e) => setImage(e.target.value)}
                placeholder="https://example.com/image.jpg"
                className="w-full px-3 py-2 rounded-lg border border-border bg-background text-foreground text-base focus:outline-none focus:ring-2 focus:ring-ring/50"
              />
              <Button
                type="button"
                variant="outline"
                className="shrink-0"
                disabled={isUploading}
                onClick={() => thumbInputRef.current?.click()}
              >
                <Upload className="size-4" />
                {isUploading ? "…" : "Upload"}
              </Button>
            </div>
            <input
              ref={thumbInputRef}
              type="file"
              accept="image/*"
              onChange={handleThumbnailUpload}
              className="hidden"
            />
            {previewSrc && (
              <div className="relative mt-2">
                <img
                  src={previewSrc}
                  alt="Pratinjau thumbnail"
                  className="aspect-video w-full rounded-lg border border-border object-cover bg-muted"
                />
                <button
                  type="button"
                  onClick={() => setImage("")}
                  aria-label="Hapus gambar"
                  className="absolute top-2 right-2 p-1 rounded-lg bg-black/60 text-white hover:bg-black/80 transition-colors"
                >
                  <X className="size-4" />
                </button>
              </div>
            )}
          </div>

          <div>
            <label className="block text-base font-medium mb-1.5">Kelas</label>
            <select
              value={cls}
              onChange={(e) => setCls(e.target.value)}
              className="w-full px-3 py-2 rounded-lg border border-border bg-background text-foreground text-base focus:outline-none focus:ring-2 focus:ring-ring/50"
            >
              <option value="1">Kelas X</option>
              <option value="2">Kelas XI</option>
              <option value="3">Kelas XII</option>
            </select>
          </div>

          <div>
            <label className="block text-base font-medium mb-1.5">Tags</label>
            <div className="flex gap-2">
              <input
                type="text"
                value={tagInput}
                onChange={(e) => setTagInput(e.target.value)}
                onKeyDown={(e) => {
                  if (e.key === "Enter") {
                    e.preventDefault();
                    addTag();
                  }
                }}
                placeholder="Ketik tag lalu Enter"
                className="flex-1 px-3 py-2 rounded-lg border border-border bg-background text-foreground text-base focus:outline-none focus:ring-2 focus:ring-ring/50"
              />
              <Button type="button" variant="outline" size="icon" onClick={addTag}>
                <Plus className="size-4" />
              </Button>
            </div>
            {tags.length > 0 && (
              <div className="flex flex-wrap gap-1.5 mt-2">
                {tags.map((tag) => (
                  <span
                    key={tag}
                    className="inline-flex items-center gap-1 px-2 py-0.5 rounded-full bg-secondary text-secondary-foreground text-base"
                  >
                    {tag}
                    <button
                      onClick={() => removeTag(tag)}
                      className="hover:text-destructive transition-colors"
                    >
                      <X className="size-3" />
                    </button>
                  </span>
                ))}
              </div>
            )}
          </div>
        </div>

        <div className="flex justify-end gap-2 mt-6">
          <Button variant="outline" onClick={onClose}>
            Batal
          </Button>
          <Button onClick={handleSave} disabled={!title.trim()}>
            Simpan
          </Button>
        </div>
      </div>
    </div>
  );
}
