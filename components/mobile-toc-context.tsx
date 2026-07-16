"use client";

import { createContext, useContext, useState, useEffect, ReactNode } from "react";

interface MobileTocContextValue {
  open: boolean;
  setOpen: (v: boolean) => void;
}

const MobileTocContext = createContext<MobileTocContextValue | null>(null);

export function MobileTocProvider({ children }: { children: ReactNode }) {
  const [open, setOpen] = useState(false);

  useEffect(() => {
    document.body.style.overflow = open ? "hidden" : "";
    return () => {
      document.body.style.overflow = "";
    };
  }, [open]);

  return (
    <MobileTocContext.Provider value={{ open, setOpen }}>
      {children}
    </MobileTocContext.Provider>
  );
}

export function useMobileToc() {
  return useContext(MobileTocContext);
}
