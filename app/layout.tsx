import type { Metadata } from "next";
import localFont from "next/font/local";
import { JetBrains_Mono, Inter, Manrope } from "next/font/google";
import "./globals.css";
import { cn } from "@/lib/utils";
import { Toaster } from "@/components/ui/sonner";

const raleway = Manrope({
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
        <main className="flex flex-col min-h-screen">{children}</main>
        <Toaster />
      </body>
    </html>
  );
}
// page.tsx
// import { createClient } from '@/utils/supabase/server'
// import { cookies } from 'next/headers'
//
// export default async function Page() {
//   const cookieStore = await cookies()
//   const supabase = createClient(cookieStore)
//
//   const { data: todos } = await supabase.from('todos').select()
//
//   return (
//     <ul>
//       {todos?.map((todo) => (
//         <li key={todo.id}>{todo.name}</li>
//       ))}
//     </ul>
//   )
// }
