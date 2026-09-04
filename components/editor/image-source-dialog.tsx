"use client";

import { useEffect, useRef, useState } from "react";
import { Link2, Upload, X } from "lucide-react";
import { toast } from "sonner";
import { Button } from "@/components/ui/button";
import { captionOfFile, uploadImageToTemp } from "@/lib/upload-temp";
import { cn } from "@/lib/utils";

interface ImageSourceDialogProps {
  onClose: () => void;
  onInsert: (markdown: string) => void;
}

/**
 * Shared popup for inserting an image: upload a file to temp/upload/
 * or paste an external image link. Used by both the toolbar image button
 * and the "Gambar" ingredient so the choice is identical everywhere.
 */
export default function ImageSourceDialog({ onClose, onInsert }: ImageSourceDialogProps) {
  const [mode, setMode] = useState<"upload" | "link">("upload");
  const [url, setUrl] = useState("");
  const [caption, setCaption] = useState("");
  const [isUploading, setIsUploading] = useState(false);
  const [uploadError, setUploadError] = useState<string | null>(null);
  const fileInputRef = useRef<HTMLInputElement>(null);

  // Escape closes the dialog (backdrop click already does too).
  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === "Escape") onClose();
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [onClose]);

  const handleFileChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    e.target.value = "";
    if (!file) return;
    setIsUploading(true);
    setUploadError(null);
    try {
      const uploadedUrl = await uploadImageToTemp(file);
      onInsert(`![${captionOfFile(file.name)}](${uploadedUrl})`);
      onClose();
    } catch (err) {
      const message = err instanceof Error ? err.message : "Upload gagal.";
      setUploadError(message);
      toast.error("Upload gambar gagal.", { description: message });
    } finally {
      setIsUploading(false);
    }
  };

  const isValidUrl = /^https?:\/\/.+/i.test(url.trim());

  const handleInsertLink = () => {
    if (!isValidUrl) return;
    const alt = caption.trim() || "gambar";
    onInsert(`![${alt}](${url.trim()})`);
    onClose();
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center">
      <div className="absolute inset-0 bg-black/50 backdrop-blur-sm" onClick={onClose} />
      <div className="relative bg-card rounded-2xl shadow-xl w-full max-w-md mx-4 p-6 ring-1 ring-border">
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-lg font-semibold">Sisipkan Gambar</h2>
          <button onClick={onClose} className="p-1 rounded-lg hover:bg-muted transition-colors">
            <X className="size-4" />
          </button>
        </div>

        <div className="grid grid-cols-2 gap-2 p-1 rounded-xl bg-muted mb-4">
          <button
            type="button"
            onClick={() => setMode("upload")}
            className={cn(
              "flex items-center justify-center gap-1.5 px-3 py-2 rounded-lg text-base font-medium transition-colors",
              mode === "upload" ? "bg-card shadow-sm" : "text-muted-foreground hover:text-foreground",
            )}
          >
            <Upload className="size-4" />
            Upload File
          </button>
          <button
            type="button"
            onClick={() => setMode("link")}
            className={cn(
              "flex items-center justify-center gap-1.5 px-3 py-2 rounded-lg text-base font-medium transition-colors",
              mode === "link" ? "bg-card shadow-sm" : "text-muted-foreground hover:text-foreground",
            )}
          >
            <Link2 className="size-4" />
            Tautan
          </button>
        </div>

        {mode === "upload" ? (
          <div className="space-y-3">
            <p className="text-base text-muted-foreground">
              File diunggah ke penyimpanan sementara dan dipindahkan permanen saat materi disimpan.
            </p>
            <Button
              type="button"
              variant="outline"
              className="w-full"
              disabled={isUploading}
              onClick={() => fileInputRef.current?.click()}
            >
              <Upload className="size-4" />
              {isUploading ? "Mengunggah…" : "Pilih File Gambar"}
            </Button>
            <input
              ref={fileInputRef}
              type="file"
              accept="image/*"
              onChange={handleFileChange}
              className="hidden"
            />
            {uploadError && <p className="text-base text-destructive">{uploadError}</p>}
          </div>
        ) : (
          <div className="space-y-4">
            <div>
              <label className="block text-base font-medium mb-1.5">URL Gambar</label>
              <input
                type="url"
                value={url}
                onChange={(e) => setUrl(e.target.value)}
                placeholder="https://example.com/gambar.jpg"
                className="w-full px-3 py-2 rounded-lg border border-border bg-background text-foreground text-base focus:outline-none focus:ring-2 focus:ring-ring/50"
              />
            </div>
            <div>
              <label className="block text-base font-medium mb-1.5">Caption (alt)</label>
              <input
                type="text"
                value={caption}
                onChange={(e) => setCaption(e.target.value)}
                placeholder="Deskripsi gambar"
                className="w-full px-3 py-2 rounded-lg border border-border bg-background text-foreground text-base focus:outline-none focus:ring-2 focus:ring-ring/50"
              />
            </div>
          </div>
        )}

        <div className="flex justify-end gap-2 mt-6">
          <Button variant="outline" onClick={onClose}>
            Batal
          </Button>
          {mode === "link" && (
            <Button onClick={handleInsertLink} disabled={!isValidUrl}>
              Sisipkan
            </Button>
          )}
        </div>
      </div>
    </div>
  );
}
