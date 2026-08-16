"use client";

import { cn } from "@/lib/utils";
import { ChevronDown, X } from "lucide-react";
import { Collapsible, CollapsibleTrigger, CollapsibleContent } from "@/components/ui/collapsible";
import { useMobileToc } from "@/components/mobile-toc-context";

interface TocItem {
  title: string;
  id: string;
  level: number;
  children: TocItem[];
}

export default function MobileToc({ toc }: { toc: TocItem[] }) {
  const ctx = useMobileToc();
  if (!ctx) return null;
  const { open, setOpen } = ctx;

  if (!open) return null;

  return (
    <div className="fixed inset-0 z-50 lg:hidden">
      <div
        className="absolute inset-0 bg-black/50 animate-in fade-in-0"
        onClick={() => setOpen(false)}
      />
      <aside
        className={cn(
          "absolute top-0 left-0 h-full w-4/5 max-w-sm border-r border-border bg-background",
          "overflow-y-auto animate-in slide-in-from-left duration-300",
        )}
      >
        <div className="flex items-center justify-between border-b border-border px-4 py-3">
          <p className="font-semibold">SUB BAB</p>
          <button
            type="button"
            onClick={() => setOpen(false)}
            aria-label="Tutup"
            className="cursor-pointer p-1"
          >
            <X className="w-5" />
          </button>
        </div>
        <nav className="flex flex-col">
          <MobileTocItems items={toc} depth={0} onClose={() => setOpen(false)} />
        </nav>
      </aside>
    </div>
  );
}

function MobileTocItems({
  items,
  depth,
  onClose,
}: {
  items: TocItem[];
  depth: number;
  onClose: () => void;
}) {
  const isTop = depth === 0;

  return (
    <>
      {items.map((item) =>
        item.children.length > 0 ? (
          <Collapsible key={item.id}>
            <CollapsibleTrigger
              className={cn(
                "group w-full border-b border-border cursor-pointer",
                isTop ? "px-4 py-3" : "px-8 py-2 text-muted-foreground",
              )}
            >
              <div className="grid grid-cols-[1fr_auto] text-left">
                {item.title}
                <ChevronDown className="w-5 transition-transform duration-200 group-data-[state=open]:rotate-180" />
              </div>
            </CollapsibleTrigger>
            <CollapsibleContent className={cn("pt-1", depth >= 1 && "ml-5")}>
              <MobileTocItems items={item.children} depth={depth + 1} onClose={onClose} />
            </CollapsibleContent>
          </Collapsible>
        ) : (
          <a
            key={item.id}
            href={`#${item.id}`}
            onClick={onClose}
            className={cn(
              "block w-full border-b border-border text-left transition",
              isTop ? "px-4 py-3" : "px-8 py-2 text-muted-foreground hover:text-primary",
            )}
          >
            {item.title}
          </a>
        ),
      )}
    </>
  );
}
