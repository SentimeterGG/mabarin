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
import IngredientSidebar from "@/components/editor/ingredient-sidebar";
import SaveModal, { type SaveData } from "@/components/editor/save-modal";

marked.use({ gfm: true });

export default function EditorPage() {
  const [content, setContent] = useState("");
  const [showPreview, setShowPreview] = useState(false);
  const [showSaveModal, setShowSaveModal] = useState(false);
  const textareaRef = useRef<HTMLTextAreaElement>(null);

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

  const wrapSelection = useCallback(
    (before: string, after: string) => {
      const textarea = textareaRef.current;
      if (!textarea) return;

      const start = textarea.selectionStart;
      const end = textarea.selectionEnd;
      const selected = content.substring(start, end);
      const newContent =
        content.substring(0, start) +
        before +
        selected +
        after +
        content.substring(end);

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
      const newContent =
        content.substring(0, lineStart) + prefix + content.substring(lineStart);

      setContent(newContent);

      setTimeout(() => {
        textarea.selectionStart = textarea.selectionEnd =
          start + prefix.length;
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

  const handleSave = (data: SaveData) => {
    console.log("=== SAVE PAYLOAD ===");
    console.log(JSON.stringify(data, null, 2));
    console.log("====================");
    setShowSaveModal(false);
  };

  const previewHtml = useMemo(() => {
    try {
      return marked.parse(content) as string;
    } catch {
      return '<p style="color:var(--destructive)">Error rendering preview</p>';
    }
  }, [content]);

  const wordCount = content.trim() ? content.trim().split(/\s+/).length : 0;
  const charCount = content.length;

  return (
    <div className="flex h-screen overflow-hidden">
      <IngredientSidebar onInsert={insertAtCursor} />

      <main className="flex-1 flex flex-col min-w-0">
        {/* Toolbar */}
        <div className="flex items-center justify-between px-3 py-2 border-b border-border bg-card shrink-0">
          <div className="flex items-center gap-2">
            <Badge variant="secondary">Editor</Badge>
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
              onClick={() =>
                insertAtCursor("\n```\n// kode di sini\n```\n")
              }
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
              onClick={() => insertAtCursor("![Caption](URL_Gambar)")}
              className="p-1.5 rounded-md hover:bg-muted transition-colors"
              title="Image"
            >
              <ImageIcon className="size-4" />
            </button>

            <div className="w-px h-5 bg-border mx-1" />

            {/* Preview toggle */}
            <Button
              variant="ghost"
              size="sm"
              onClick={() => setShowPreview(!showPreview)}
            >
              {showPreview ? (
                <EyeOff className="size-4" />
              ) : (
                <Eye className="size-4" />
              )}
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

      {showSaveModal && (
        <SaveModal
          onClose={() => setShowSaveModal(false)}
          onSave={handleSave}
          content={content}
        />
      )}
    </div>
  );
}
