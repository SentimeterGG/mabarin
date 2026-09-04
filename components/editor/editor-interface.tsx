"use client";

import { useState, useRef, useCallback, useMemo } from "react";
import {
  Save,
  Eye,
  EyeOff,
  Bold,
  Italic,
  Heading1,
  Heading2,
  Heading3,
  Code,
  Link,
  Quote,
  List,
  Image as ImageIcon,
  FileCode,
  Undo,
  Redo,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { marked } from "marked";
import { toast } from "sonner";
import IngredientSidebar from "@/components/editor/ingredient-sidebar";
import SaveModal, { type SaveData } from "@/components/editor/save-modal";
import ImageSourceDialog from "@/components/editor/image-source-dialog";
import { saveMaterial } from "@/app/app/editor/actions";
import { resolveImageSrc } from "@/lib/storage-paths";
import { markdownImageFigure } from "@/lib/markdown-image";

// Registered once at module level (NOT inside the preview memo —
// marked.use() mutates the global instance, so calling it per-render
// would stack duplicate renderers). In marked v18 the image renderer
// receives a single token object { href, title, text }.
marked.use({
  gfm: true,
  renderer: {
    image({ href, title, text }) {
      return markdownImageFigure(href, text, title);
    },
  },
});

export interface InitialData {
  id: number;
  title: string;
  description: string;
  image: string;
  grade: number;
  tags: string[];
  content: string;
}

export default function EditorInterface({ initial }: { initial: InitialData | null }) {
  const [content, setContent] = useState(initial?.content ?? "");
  const [editedTitle, setEditedTitle] = useState<string | null>(initial?.title ?? null);
  const [showPreview, setShowPreview] = useState(false);
  const [showSaveModal, setShowSaveModal] = useState(false);
  const [showImageDialog, setShowImageDialog] = useState(false);
  const [initialSaveData, setInitialSaveData] = useState<InitialData | null>(initial ?? null);
  const textareaRef = useRef<HTMLTextAreaElement>(null);
  const editId = initial?.id ?? null;

  const insertAtCursor = useCallback(
    (text: string) => {
      const textarea = textareaRef.current;
      if (!textarea) return;

      const start = textarea.selectionStart;
      const end = textarea.selectionEnd;
      const before = content.substring(0, start);
      const after = content.substring(end);
      const newContent = before + text + after;

      setContent(newContent);

      setTimeout(() => {
        textarea.selectionStart = textarea.selectionEnd = start + text.length;
        textarea.focus();
      }, 0);
    },
    [content],
  );

  const handleInsertImage = useCallback(
    (markdown: string) => {
      insertAtCursor(markdown);
      setShowImageDialog(false);
    },
    [insertAtCursor],
  );

  const wrapSelection = useCallback(
    (before: string, after: string) => {
      const textarea = textareaRef.current;
      if (!textarea) return;

      const start = textarea.selectionStart;
      const end = textarea.selectionEnd;
      const selected = content.substring(start, end);
      const newContent =
        content.substring(0, start) + before + selected + after + content.substring(end);

      setContent(newContent);

      setTimeout(() => {
        textarea.selectionStart = start + before.length;
        textarea.selectionEnd = start + before.length + selected.length;
        textarea.focus();
      }, 0);
    },
    [content],
  );

  const insertAtLineStart = useCallback(
    (prefix: string) => {
      const textarea = textareaRef.current;
      if (!textarea) return;

      const start = textarea.selectionStart;
      const lineStart = content.lastIndexOf("\n", start - 1) + 1;
      const newContent = content.substring(0, lineStart) + prefix + content.substring(lineStart);

      setContent(newContent);

      setTimeout(() => {
        textarea.selectionStart = textarea.selectionEnd = start + prefix.length;
        textarea.focus();
      }, 0);
    },
    [content],
  );

  const handleKeyDown = useCallback(
    (e: React.KeyboardEvent<HTMLTextAreaElement>) => {
      if (e.ctrlKey || e.metaKey) {
        switch (e.key) {
          case "b":
            e.preventDefault();
            wrapSelection("**", "**");
            break;
          case "i":
            e.preventDefault();
            wrapSelection("*", "*");
            break;
          case "k":
            e.preventDefault();
            wrapSelection("[", "](url)");
            break;
          case "s":
            e.preventDefault();
            setShowSaveModal(true);
            break;
        }
      }

      if (e.key === "Tab") {
        e.preventDefault();
        insertAtCursor("  ");
      }
    },
    [wrapSelection, insertAtCursor],
  );

  const handleSave = async (data: SaveData) => {
    const saveToast = toast.loading(editId ? "Menyimpan perubahan…" : "Menambahkan materi…");
    const result = await saveMaterial({
      id: editId ?? undefined,
      title: data.title,
      description: data.description,
      grade: Number(data.class),
      tags: data.tags,
      content: data.content,
      slug: data.slug,
      image: data.image,
    });
    if (!result.ok) {
      toast.error("Gagal menyimpan materi.", { id: saveToast, description: result.error });
      return;
    }
    toast.success(editId ? "Perubahan tersimpan." : "Materi baru ditambahkan.", {
      id: saveToast,
    });
    setEditedTitle(data.title);
    setShowSaveModal(false);
  };

  // Grade of the material being edited (present when the page URL has
  // ?id=, i.e. editing an existing material). Needed to resolve the
  // relative (unedited) image refs stored in the DB for preview.
  const previewGrade = initial?.grade;

  // Preview-only rewrite: relative image refs (e.g.
  // `![1poina](algoritma_files/1poina.svg)`) become absolute Supabase URLs
  // so they render. Absolute URLs (edited/newly uploaded images) pass
  // through `resolveImageSrc` unchanged. `content` itself is never mutated,
  // so toggling preview off shows the original relative refs again.
  const previewContent = useMemo(() => {
    if (previewGrade == null) return content;
    return content.replace(
      /!\[([^\]]*)\]\(([^)\s]+)((?:\s+"[^"]*")?)\)/g,
      (full, alt: string, url: string, title: string) => {
        const resolved = resolveImageSrc(url, previewGrade);
        if (resolved === url) return full;
        return `![${alt}](${resolved}${title})`;
      },
    );
  }, [content, previewGrade]);

  const previewHtml = useMemo(() => {
    try {
      return marked.parse(previewContent) as string;
    } catch {
      return '<p style="color:var(--destructive)">Error rendering preview</p>';
    }
  }, [previewContent]);

  const wordCount = content.trim() ? content.trim().split(/\s+/).length : 0;
  const charCount = content.length;

  return (
    <div className="flex h-screen overflow-hidden">
      <IngredientSidebar onInsert={insertAtCursor} />

      <main className="flex-1 flex flex-col min-w-0">
        {/* Toolbar */}
        <div className="flex items-center justify-between px-3 py-2 border-b border-border bg-card shrink-0">
          <div className="flex items-center gap-2">
            <Badge variant="secondary">{editedTitle ? "Edit" : "Editor"}</Badge>
            {editedTitle && (
              <span className="text-base text-muted-foreground truncate max-w-52">
                {editedTitle}
              </span>
            )}
            <span className="text-base text-muted-foreground">
              {wordCount} kata · {charCount} karakter
            </span>
          </div>

          <div className="flex items-center gap-0.5">
            {/* Undo / Redo */}
            <button
              onClick={() => document.execCommand("undo")}
              className="p-1.5 rounded-md hover:bg-muted transition-colors"
              title="Undo"
            >
              <Undo className="size-4" />
            </button>
            <button
              onClick={() => document.execCommand("redo")}
              className="p-1.5 rounded-md hover:bg-muted transition-colors"
              title="Redo"
            >
              <Redo className="size-4" />
            </button>

            <div className="w-px h-5 bg-border mx-1" />

            {/* Formatting */}
            <button
              onClick={() => insertAtLineStart("# ")}
              className="p-1.5 rounded-md hover:bg-muted transition-colors"
              title="Heading 1 (Judul)"
            >
              <Heading1 className="size-4" />
            </button>
            <button
              onClick={() => insertAtLineStart("## ")}
              className="p-1.5 rounded-md hover:bg-muted transition-colors"
              title="Heading 2"
            >
              <Heading2 className="size-4" />
            </button>
            <button
              onClick={() => insertAtLineStart("### ")}
              className="p-1.5 rounded-md hover:bg-muted transition-colors"
              title="Heading 3"
            >
              <Heading3 className="size-4" />
            </button>

            <div className="w-px h-5 bg-border mx-1" />

            <button
              onClick={() => wrapSelection("**", "**")}
              className="p-1.5 rounded-md hover:bg-muted transition-colors"
              title="Bold (Ctrl+B)"
            >
              <Bold className="size-4" />
            </button>
            <button
              onClick={() => wrapSelection("*", "*")}
              className="p-1.5 rounded-md hover:bg-muted transition-colors"
              title="Italic (Ctrl+I)"
            >
              <Italic className="size-4" />
            </button>
            <button
              onClick={() => wrapSelection("`", "`")}
              className="p-1.5 rounded-md hover:bg-muted transition-colors"
              title="Inline Code"
            >
              <Code className="size-4" />
            </button>
            <button
              onClick={() => insertAtCursor("\n```\n// kode di sini\n```\n")}
              className="p-1.5 rounded-md hover:bg-muted transition-colors"
              title="Code Block"
            >
              <FileCode className="size-4" />
            </button>

            <div className="w-px h-5 bg-border mx-1" />

            <button
              onClick={() => insertAtLineStart("> ")}
              className="p-1.5 rounded-md hover:bg-muted transition-colors"
              title="Quote"
            >
              <Quote className="size-4" />
            </button>
            <button
              onClick={() => insertAtLineStart("- ")}
              className="p-1.5 rounded-md hover:bg-muted transition-colors"
              title="List"
            >
              <List className="size-4" />
            </button>
            <button
              onClick={() => wrapSelection("[", "](url)")}
              className="p-1.5 rounded-md hover:bg-muted transition-colors"
              title="Link (Ctrl+K)"
            >
              <Link className="size-4" />
            </button>
            <button
              onClick={() => setShowImageDialog(true)}
              className="p-1.5 rounded-md hover:bg-muted transition-colors"
              title="Sisipkan gambar"
            >
              <ImageIcon className="size-4" />
            </button>

            <div className="w-px h-5 bg-border mx-1" />

            {/* Preview toggle */}
            <Button variant="ghost" size="sm" onClick={() => setShowPreview(!showPreview)}>
              {showPreview ? <EyeOff className="size-4" /> : <Eye className="size-4" />}
              {showPreview ? "Edit" : "Preview"}
            </Button>

            {/* Save */}
            <Button size="sm" onClick={() => setShowSaveModal(true)}>
              <Save className="size-4" />
              Simpan
            </Button>
          </div>
        </div>

        {/* Editor / Preview */}
        <div className="flex-1 overflow-auto">
          {showPreview ? (
            <div className="max-w-3xl mx-auto p-8">
              {content.trim() ? (
                <div
                  className="prose max-w-none prose-img:w-full prose-img:aspect-auto prose-p:text-justify"
                  dangerouslySetInnerHTML={{ __html: previewHtml }}
                />
              ) : (
                <p className="text-muted-foreground text-base">
                  Belum ada konten untuk di-preview.
                </p>
              )}
            </div>
          ) : (
            <textarea
              ref={textareaRef}
              value={content}
              onChange={(e) => setContent(e.target.value)}
              onKeyDown={handleKeyDown}
              placeholder={
                "# Judul Materi\n\n---\n\n## 1. Judul Bagian\n\nTulis konten di sini...\n\n### A. Sub Bagian\n\nDetail konten..."
              }
              className="w-full h-full p-8 bg-transparent text-foreground font-mono text-base leading-relaxed resize-none focus:outline-none placeholder:text-muted-foreground"
              spellCheck={false}
            />
          )}
        </div>
      </main>

      {showImageDialog && (
        <ImageSourceDialog onClose={() => setShowImageDialog(false)} onInsert={handleInsertImage} />
      )}

      {showSaveModal && (
        <SaveModal
          onClose={() => setShowSaveModal(false)}
          onSave={handleSave}
          content={content}
          initialData={initialSaveData ?? undefined}
        />
      )}
    </div>
  );
}
