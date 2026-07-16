"use client";

import { cn } from "@/lib/utils";
import { ChevronDown, X } from "lucide-react";
import { Collapsible, CollapsibleTrigger, CollapsibleContent } from "@/components/ui/collapsible";
import { useMobileToc } from "@/components/mobile-toc-context";

interface TocItem {
  title: string;
  level: number;
  children: TocItem[];
}

function slugify(title: string) {
  return title
    .toLowerCase()
    .replace(/[^\w\s-]/g, "")
    .replace(/\s+/g, "-");
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
          {toc.map((section) =>
            section.children.length > 0 ? (
              <Collapsible key={section.title}>
                <CollapsibleTrigger className="group w-full border-b border-border px-4 py-3 cursor-pointer">
                  <div className="grid grid-cols-[1fr_auto] text-left">
                    {section.title}
                    <ChevronDown className="w-5 transition-transform duration-200 group-data-[state=open]:rotate-180" />
                  </div>
                </CollapsibleTrigger>
                <CollapsibleContent className="pt-1">
                  {section.children.map((child) => (
                    <div key={child.title} className="px-8 py-2">
                      <a
                        href={`#${slugify(child.title)}`}
                        onClick={() => setOpen(false)}
                        className="text-base text-muted-foreground hover:text-primary transition"
                      >
                        {child.title}
                      </a>
                    </div>
                  ))}
                </CollapsibleContent>
              </Collapsible>
            ) : (
              <a
                key={section.title}
                href={`#${slugify(section.title)}`}
                onClick={() => setOpen(false)}
                className="block w-full border-b border-border px-4 py-3 text-left transition"
              >
                {section.title}
              </a>
            ),
          )}
        </nav>
      </aside>
    </div>
  );
}
