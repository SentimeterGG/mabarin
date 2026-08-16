import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";
import { ChevronDown, ChevronsDown } from "lucide-react";
import fs from "fs";
import path from "path";
import { marked, type Tokens } from "marked";
import { Collapsible, CollapsibleTrigger, CollapsibleContent } from "@/components/ui/collapsible";
import MobileToc from "@/components/mobile-toc";

interface PageProps {
  params: Promise<{
    grade: string;
    slug: string;
  }>;
}

function slugify(title: string) {
  return title
    .toLowerCase()
    .replace(/[^\w\s-]/g, "")
    .replace(/\s+/g, "-");
}

type TocItem = {
  title: string;
  id: string;
  level: number;
  children: TocItem[];
};

function createSlugger() {
  const seen = new Map<string, number>();
  return (title: string) => {
    const base = slugify(title);
    const count = seen.get(base) ?? 0;
    seen.set(base, count + 1);
    return count === 0 ? base : `${base}-${count}`;
  };
}

function getMateriBySlug(grade: string, slug: string) {
  const filePath = path.join(process.cwd(), "app/materi", grade, `${slug}.md`);

  if (!fs.existsSync(filePath)) {
    return null;
  }

  const raw = fs.readFileSync(filePath, "utf-8");

  const toc: TocItem[] = [];

  const tocSlugger = createSlugger();

  const headingRegex = /^(#{1,6})\s+(.+)$/gm;

  const stack: { level: number; item: TocItem }[] = [];

  let match;

  while ((match = headingRegex.exec(raw)) !== null) {
    const level = match[1].length;
    const title = match[2];
    const id = tocSlugger(title);

    if (level === 1) continue;

    const item: TocItem = { title, id, level, children: [] };

    while (stack.length > 0 && stack[stack.length - 1].level >= level) {
      stack.pop();
    }

    if (stack.length === 0) {
      toc.push(item);
    } else {
      stack[stack.length - 1].item.children.push(item);
    }

    stack.push({ level, item });
  }

  const renderSlugger = createSlugger();

  const html = marked
    .use({
      renderer: {
        heading(token: Tokens.Heading) {
          const id = renderSlugger(token.text);
          const text = this.parser.parseInline(token.tokens);
          return `<h${token.depth} id="${id}">${text}</h${token.depth}>\n`;
        },
        paragraph(token: Tokens.Paragraph) {
          const text = this.parser.parseInline(token.tokens);
          if (/^Sumber\s*:/i.test(token.text.trim())) {
            return `<p class="prose-sumber">${text}</p>\n`;
          }
          if (/^Gambar\s*\d/i.test(token.text.trim())) {
            return `<p class="prose-figure-caption">${text}</p>\n`;
          }
          return `<p>${text}</p>\n`;
        },
      },
    })
    .parse(raw) as string;
  const title = toc[0] ?? slug.replace(/-/g, " ");

  return { title, html, toc };
}

function SidebarToc({ items, depth }: { items: TocItem[]; depth: number }) {
  const isTop = depth === 0;

  const pad = isTop
    ? "px-4 py-3"
    : cn(
        "py-2 pr-4 text-muted-foreground",
        ["pl-8", "pl-12", "pl-16", "pl-20"][Math.min(depth - 1, 3)],
      );

  return (
    <>
      {items.map((item) =>
        item.children.length > 0 ? (
          <Collapsible key={item.id}>
            <CollapsibleTrigger
              className={cn("group w-full border-b border-border cursor-pointer", pad)}
            >
              <div className="grid grid-cols-[1fr_auto] text-left">
                {item.title}
                <ChevronDown className="w-10 transition-transform duration-200 group-data-[state=open]:rotate-180" />
              </div>
            </CollapsibleTrigger>
            <CollapsibleContent
              className={cn(
                "text-popover-foreground outline-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2",
              )}
            >
              <div className="min-h-0">
                <SidebarToc items={item.children} depth={depth + 1} />
              </div>
            </CollapsibleContent>
          </Collapsible>
        ) : (
          <a
            key={item.id}
            href={`#${item.id}`}
            className={cn(
              "block w-full border-b border-border text-left transition",
              pad,
              !isTop && "hover:text-primary",
            )}
          >
            {item.title}
          </a>
        ),
      )}
    </>
  );
}

export default async function MateriDetail({ params }: PageProps) {
  const { grade, slug } = await params;
  const materi = getMateriBySlug(grade, slug);

  if (!materi) {
    return (
      <div className="mt-25 flex justify-center min-h-screen">
        <h1 className="text-2xl font-bold">Materi tidak ditemukan</h1>
      </div>
    );
  }

  return (
    <div className="flex justify-center min-h-screen">
      <MobileToc toc={materi.toc} />
      <div className="container mx-auto flex gap-6">
        {/* Left Sidebar - Table of content */}
        <aside className="hidden lg:block w-90 shrink-0 sticky top-0 max-h-screen overflow-y-auto border-r border-l border-border">
          <p className="mt-24 font-semibold mb-4 ml-4">SUB BAB</p>
          <nav className="flex flex-col">
            <SidebarToc items={materi.toc} depth={0} />
          </nav>
        </aside>

        {/* Center - Content */}
        <main className="flex-1 max-w-3xl mt-25 pl-4">
          <div className="mb-25">
            <Badge variant="secondary" className="mb-3">
              Materi
            </Badge>
            <div
              className="prose max-w-none prose-img:w-full prose-img:aspect-auto prose-p:text-justify"
              dangerouslySetInnerHTML={{ __html: materi.html }}
            />
          </div>
        </main>
      </div>
    </div>
  );
}
