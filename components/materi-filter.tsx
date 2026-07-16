"use client";

import { useEffect, useState } from "react";
import { cn } from "@/lib/utils";
import MateriCard from "@/components/materi-card";
import {
  Empty,
  EmptyHeader,
  EmptyMedia,
  EmptyContent,
  EmptyTitle,
  EmptyDescription,
} from "@/components/ui/empty";
import { X } from "lucide-react";

export interface MateriItem {
  title: string;
  description: string;
  image: string;
  alt: string;
  badge: string;
  grade: string;
  href: string;
}
const FILTERS = [
  { label: "Semua", grade: "all" },
  { label: "Kelas X", grade: "1" },
  { label: "Kelas XI", grade: "2" },
  { label: "Kelas XII", grade: "3" },
] as const;

const VALID_GRADES: string[] = FILTERS.map((f) => f.grade);

export default function MateriFilter({ materi }: { materi: MateriItem[] }) {
  const [active, setActive] = useState<string>("all");

  useEffect(() => {
    const sync = () => {
      const hash = window.location.hash.replace("#", "");
      setActive(VALID_GRADES.includes(hash) ? hash : "all");
    };

    sync();
    window.addEventListener("hashchange", sync);
    return () => window.removeEventListener("hashchange", sync);
  }, []);

  const handleSelect = (grade: string) => {
    setActive(grade);
    if (grade === "all") {
      history.replaceState(null, "", window.location.pathname + window.location.search);
    } else {
      history.replaceState(null, "", `#${grade}`);
    }
  };

  const filtered = active === "all" ? materi : materi.filter((m) => m.grade === active);

  return (
    <div>
      <div className="mb-12 flex flex-wrap gap-3">
        {FILTERS.map((filter) => (
          <button
            key={filter.grade}
            onClick={() => handleSelect(filter.grade)}
            className={cn(
              "rounded-full border border-border px-4 py-2 text-base font-medium transition",
              active === filter.grade
                ? "bg-primary text-primary-foreground"
                : "bg-transparent text-foreground hover:bg-muted",
            )}
          >
            {filter.label}
          </button>
        ))}
      </div>

      <div
        className={cn(
          "grid gap-8",
          filtered.length > 0
            ? "grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4"
            : "grid-cols-1",
        )}
      >
        {filtered.length > 0 ? (
          filtered.map((item) => (
            <MateriCard
              key={item.href}
              image={item.image}
              alt={item.alt}
              badge={item.badge}
              title={item.title}
              description={item.description}
              href={item.href}
            />
          ))
        ) : (
          <Empty className="col-span-full w-full">
            <EmptyHeader>
              <EmptyMedia variant="icon">
                <X color="#ccc" />
              </EmptyMedia>
              <EmptyTitle className="text-muted-foreground">Materi Belum Tersedia</EmptyTitle>
            </EmptyHeader>
          </Empty>
        )}
      </div>
    </div>
  );
}
