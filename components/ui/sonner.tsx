"use client";

import { Toaster as SonnerToaster, type ToasterProps } from "sonner";

/**
 * App-wide toast container. Rendered once in app/layout.tsx.
 * Fire with `import { toast } from "sonner"`:
 *   toast.success("Materi tersimpan."), toast.error("…")
 */
export function Toaster(props: ToasterProps) {
  return (
    <SonnerToaster
      position="top-center"
      richColors
      closeButton
      toastOptions={{
        style: { fontSize: "0.9375rem" },
      }}
      {...props}
    />
  );
}
