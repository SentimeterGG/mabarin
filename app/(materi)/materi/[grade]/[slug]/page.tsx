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

function getMateriBySlug(grade: string, slug: string) {
  const filePath = path.join(process.cwd(), "app/materi", grade, `${slug}.md`);

  if (!fs.existsSync(filePath)) {
    return null;
  }

  const raw = fs.readFileSync(filePath, "utf-8");

  type TocItem = {
    title: string;
    level: number;
    children: TocItem[];
  };

  const toc: TocItem[] = [];

  let currentH2: TocItem | null = null;

  const headingRegex = /^(#{2,3})\s+(.+)$/gm;

  let match;

  while ((match = headingRegex.exec(raw)) !== null) {
    const level = match[1].length;
    const title = match[2];

    if (level === 2) {
      currentH2 = {
        title,
        level,
        children: [],
      };

      toc.push(currentH2);
    } else if (level === 3 && currentH2) {
      currentH2.children.push({
        title,
        level,
        children: [],
      });
    }
  }

  const html = marked
    .use({
      renderer: {
        heading(token: Tokens.Heading) {
          const id = slugify(token.text);
          const text = this.parser.parseInline(token.tokens);
          return `<h${token.depth} id="${id}">${text}</h${token.depth}>\n`;
        },
      },
    })
    .parse(raw) as string;
  const title = toc[0] ?? slug.replace(/-/g, " ");

  return { title, html, toc };
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
            {materi.toc.map((section) =>
              section.children.length > 0 ? (
                <Collapsible key={section.title}>
                  <CollapsibleTrigger className="group w-full border-b border-border px-4 py-3 cursor-pointer">
                    <div className="grid grid-cols-[1fr_auto] text-left">
                      {section.title}
                      <ChevronDown className="w-10 transition-transform duration-200 group-data-[state=open]:rotate-180" />
                    </div>
                  </CollapsibleTrigger>
                  <CollapsibleContent
                    className={cn(
                      "text-popover-foreground outline-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2 pt-3",
                    )}
                  >
                    <div className="min-h-0">
                      {section.children.map((child) => (
                        <div key={child.title} className="px-8 py-2">
                          <a
                            href={`#${slugify(child.title)}`}
                            className="text-base text-muted-foreground hover:text-primary transition"
                          >
                            {child.title}
                          </a>
                        </div>
                      ))}
                    </div>
                  </CollapsibleContent>
                </Collapsible>
              ) : (
                <a
                  key={section.title}
                  href={`#${slugify(section.title)}`}
                  className="block w-full border-b border-border px-4 py-3 text-left transition"
                >
                  {section.title}
                </a>
              ),
            )}
          </nav>
        </aside>

        {/* Center - Content */}
        <main className="flex-1 max-w-3xl mt-25 pl-4">
          <div className="mb-25">
            <Badge variant="secondary" className="mb-3">
              Materi
            </Badge>
            <div
              className="prose max-w-none prose-img:w-full prose-img:aspect-auto"
              dangerouslySetInnerHTML={{ __html: materi.html }}
            />
          </div>
        </main>
      </div>
    </div>
  );
}
