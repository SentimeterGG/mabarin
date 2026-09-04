"use client";

import { useState } from "react";
import {
  MonitorPlay,
  Image,
  Code,
  AlertCircle,
  LayoutGrid,
  Columns,
  Minus,
  Table,
  ChevronDown,
  LogOut,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { Button } from "../ui/button";
import { logout } from "@/app/app/editor/actions";
import ImageSourceDialog from "@/components/editor/image-source-dialog";

interface Ingredient {
  id: string;
  name: string;
  icon: React.ReactNode;
  description: string;
  markdown: string;
}

interface IngredientCategory {
  category: string;
  items: Ingredient[];
}

const ingredients: IngredientCategory[] = [
  {
    category: "Konten",
    items: [
      {
        id: "youtube",
        name: "YouTube Embed",
        icon: <MonitorPlay className="size-4" />,
        description: "Embed video YouTube",
        markdown:
          '<div style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%"><iframe src="https://www.youtube.com/embed/VIDEO_ID" style="position:absolute;top:0;left:0;width:100%;height:100%" frameborder="0" allowfullscreen></iframe></div>',
      },
      {
        id: "image",
        name: "Gambar",
        icon: <Image className="size-4" />,
        description: "Sisipkan gambar",
        markdown: "![Caption](URL_Gambar)",
      },
      {
        id: "code",
        name: "Code Block",
        icon: <Code className="size-4" />,
        description: "Blok kode program",
        markdown: "```javascript\n// kode di sini\n```",
      },
      {
        id: "callout",
        name: "Callout",
        icon: <AlertCircle className="size-4" />,
        description: "Kotak informasi penting",
        markdown: "> **Note:** Teks callout di sini",
      },
    ],
  },
  {
    category: "Layout",
    items: [
      {
        id: "3col",
        name: "3 Kolom",
        icon: <LayoutGrid className="size-4" />,
        description: "Layout 3 kolom",
        markdown:
          "| Kolom 1 | Kolom 2 | Kolom 3 |\n|---------|---------|---------|\n| Konten  | Konten  | Konten  |",
      },
      {
        id: "2col",
        name: "2 Kolom",
        icon: <Columns className="size-4" />,
        description: "Layout 2 kolom",
        markdown: "| Kolom 1 | Kolom 2 |\n|---------|--------|\n| Konten  | Konten  |",
      },
      {
        id: "divider",
        name: "Divider",
        icon: <Minus className="size-4" />,
        description: "Garis pemisah",
        markdown: "\n---\n",
      },
      {
        id: "table",
        name: "Tabel",
        icon: <Table className="size-4" />,
        description: "Tabel data",
        markdown:
          "| Header 1 | Header 2 | Header 3 |\n|----------|----------|----------|\n| Data 1   | Data 2   | Data 3   |",
      },
    ],
  },
];

export default function IngredientSidebar({ onInsert }: { onInsert: (markdown: string) => void }) {
  const [openCategories, setOpenCategories] = useState<Record<string, boolean>>({
    Konten: true,
    Layout: true,
  });
  const [showImageDialog, setShowImageDialog] = useState(false);

  const toggleCategory = (category: string) => {
    setOpenCategories((prev) => ({ ...prev, [category]: !prev[category] }));
  };

  // The "Gambar" ingredient opens the same popup as the toolbar image
  // button: choose upload-a-file or paste-an-image-link.
  const handleItemClick = (item: Ingredient) => {
    if (item.id === "image") {
      setShowImageDialog(true);
      return;
    }
    onInsert(item.markdown);
  };

  const handleInsertImage = (markdown: string) => {
    onInsert(markdown);
    setShowImageDialog(false);
  };

  return (
    <aside className="hidden lg:flex w-72 shrink-0 flex-col border-r border-border h-full bg-card">
      <div className="p-4 border-b border-border">
        <h2 className="font-semibold text-base">Ingredients</h2>
        <p className="text-base text-muted-foreground mt-0.5">Klik untuk menyisipkan ke editor</p>
      </div>

      <div className="flex-1 overflow-y-auto p-3 space-y-1">
        {ingredients.map((cat) => (
          <div key={cat.category}>
            <button
              onClick={() => toggleCategory(cat.category)}
              className="flex items-center justify-between w-full px-2 py-1.5 text-base font-medium text-muted-foreground hover:text-foreground transition-colors rounded-md"
            >
              {cat.category}
              <ChevronDown
                className={cn(
                  "size-3 transition-transform",
                  openCategories[cat.category] && "rotate-180",
                )}
              />
            </button>

            {openCategories[cat.category] && (
              <div className="space-y-0.5">
                {cat.items.map((item) => (
                  <button
                    key={item.id}
                    onClick={() => handleItemClick(item)}
                    className="flex items-center gap-2.5 w-full p-2 rounded-lg text-left hover:bg-muted transition-colors group"
                  >
                    <div className="flex items-center justify-center size-8 rounded-md bg-muted group-hover:bg-primary/10 transition-colors shrink-0">
                      {item.icon}
                    </div>
                    <div className="min-w-0">
                      <p className="text-base font-medium truncate">{item.name}</p>
                      <p className="text-base text-muted-foreground truncate">{item.description}</p>
                    </div>
                  </button>
                ))}
              </div>
            )}
          </div>
        ))}
      </div>
      <form action={logout}>
        <Button type="submit" className="mb-5 mx-5 w-[calc(100%-2.5rem)]" variant="destructive">
          <LogOut className="size-4" />
          Logout
        </Button>
      </form>
      {showImageDialog && (
        <ImageSourceDialog onClose={() => setShowImageDialog(false)} onInsert={handleInsertImage} />
      )}
    </aside>
  );
}
