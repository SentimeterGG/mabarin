"use client";

import { useMobileToc } from "@/components/mobile-toc-context";

export default function MobileTocTrigger() {
  const ctx = useMobileToc();
  if (!ctx) return null;

  return (
    <button
      type="button"
      onClick={() => ctx.setOpen(true)}
      aria-label="Buka daftar sub bab"
      className="lg:hidden cursor-pointer mr-3 flex h-4 w-5 flex-col justify-between"
    >
      <span className="block h-0.5 w-full bg-foreground" />
      <span className="block h-0.5 w-full bg-foreground" />
      <span className="block h-0.5 w-full bg-foreground" />
    </button>
  );
}
