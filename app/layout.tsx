import type { Metadata } from "next";
import localFont from "next/font/local";
import { Raleway, JetBrains_Mono, Inter } from "next/font/google";
import "./globals.css";
import { cn } from "@/lib/utils";

const raleway = Raleway({
  subsets: ["latin"],
  variable: "--font-sans",
});

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-number",
});
const nextArt = localFont({
  src: "./fonts/NEXT ART_Bold.otf",
  variable: "--font-logo",
});

const jetBrainsMono = JetBrains_Mono({
  variable: "--font-jet-mono",
});

export const metadata: Metadata = {
  title: "MaBaRin",
  description: "Tempat untuk belajar Informatika",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="en"
      className={cn(
        "h-full",
        "antialiased",
        jetBrainsMono.variable,
        "font-sans",
        raleway.variable,
        inter.variable,
        nextArt.variable,
      )}
    >
      <body className="min-h-full flex flex-col">
        <main>{children}</main>
      </body>
    </html>
  );
}
