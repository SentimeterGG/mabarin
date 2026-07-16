import MobileTocTrigger from "@/components/mobile-toc-trigger";

export default function Navbar() {
  return (
    <nav className="w-full bg-background border-b border-border fixed z-50 flex justify-center">
      <div className="container flex px-5 justify-between items-center">
        {/* <Image src="" alt="Logo"></Image> */}
        <div className="flex items-center">
          <MobileTocTrigger />
          <a href="/"><p className="font-logo italic text-lg py-3">MABARIN</p></a>
        </div>
        <ul className="flex gap-5 *:hover:text-primary *:text-muted-foreground *:cursor-pointer *:transition-colors">
          <li>
            <a href="/">Home</a>
          </li>
          <li>
            <a href="/materi/">Materi</a>
          </li>
          <li>
            <a href="/about/">About</a>
          </li>
        </ul>
      </div>
    </nav>
  );
}
