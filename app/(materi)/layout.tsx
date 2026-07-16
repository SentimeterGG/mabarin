import Navbar from "@/components/navbar";
import { MobileTocProvider } from "@/components/mobile-toc-context";

export default function MateriLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <MobileTocProvider>
      <Navbar />
      {children}
    </MobileTocProvider>
  );
}
