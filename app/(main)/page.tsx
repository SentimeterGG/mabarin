import Card from "@/components/card";
import DotGrid from "@/components/DotGrid.jsx";
import { Button } from "@/components/ui/button";
import { ChevronRight } from "lucide-react";

export default function Home() {
  return (
    <div>
      <div
        style={{ width: "100%", height: "100vh", position: "relative" }}
        className="flex justify-center items-center"
      >
        <div
          style={{
            width: "100%",
            height: "100vh",
            position: "absolute",
            top: 0,
            left: 0,
            zIndex: -1,
          }}
        >
          <DotGrid
            dotSize={4}
            gap={10}
            baseColor="#eaeaea"
            activeColor="#dadada"
            darkBaseColor="#151515"
            darkActiveColor="#252525"
            proximity={90}
            speedTrigger={100}
            shockRadius={130}
            shockStrength={6.5}
            maxSpeed={10000}
            resistance={350}
            returnDuration={1.3}
          />
        </div>
        <div className="*:text-center">
          <p className="text-muted-foreground font-semibold">THE INFORMATICS ARCHIVE</p>
          <h1 className="text-center mb-5 font-bold">
            Tempat anda untuk Kualitas
            <br />
            <span className="text-primary">Design & Informatika</span>
          </h1>
          <p className="text-foreground mb-5 px-4 sm:px-0 max-w-3xl mx-auto">
            Platform dokumentasi terpusat dengan akses terbuka yang berkomitmen untuk menyediakan
            aset-aset informatika, materi pembelajaran teknis, dan sumber daya akademik berkualitas
            tinggi.
          </p>
          <div className="flex flex-col sm:flex-row justify-center gap-4 px-4">
            <Button size="lg" className="group w-auto">
              Mulai Belajar
              <ChevronRight className="transition-transform group-hover:translate-x-0.5"></ChevronRight>
            </Button>
            <Button
              size="lg"
              variant="outline"
              className="bg-background hover:bg-muted w-full sm:w-auto"
            >
              Kontak Kami
            </Button>
          </div>
        </div>
      </div>
      <div className="flex flex-col items-center my-12">
        <div className="container flex flex-col gap-12">
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
            <Card
              title="Kelas 10"
              description="Bangun fondasi kuatmu! Pelajari dasar-dasar logika digital, pemrograman pemula, dan cara kerja teknologi di sekitarmu."
              image="/images/cards1.webp"
              href="/materi#1"
            ></Card>
            <Card
              title="Kelas 11"
              description="Siap naik level? Pelajari algoritma yang lebih kompleks, jaringan komputer, dan cara menganalisis data secara mendalam."
              image="/images/cards2.jpg"
              href="/materi#2"
            ></Card>
            <Card
              title="Kelas 12"
              description="Kuasai masa depan! Rancang solusi teknologi kreatif, pelajari keamanan siber, dan persiapkan dirimu untuk dunia kerja atau kuliah."
              image="/images/cards3.jpg"
              href="/materi#3"
            ></Card>
          </div>
        </div>
      </div>
    </div>
  );
}
