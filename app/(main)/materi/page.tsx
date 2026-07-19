import MateriFilter, { MateriItem } from "@/components/materi-filter";

const materi: MateriItem[] = [
  {
    image: "/materi/1/berpikir-komputasional_files/thumbnail.jpg",
    alt: "Berpikir Komputasional",
    badge: "Kelas X",
    grade: "1",
    title: "Berpikir Komputasional",
    description:
      "Pemahaman konsep pola berpikir, teknik memetakan ide, algoritma, dan logika proposisi dalam pemecahan masalah.",
    href: "materi/1/berpikir-komputasional",
  },
  {
    image: "/materi/1/msoffice_files/thumbnail.jpg",
    alt: "Microsoft Office 365",
    badge: "Kelas X",
    grade: "1",
    title: "Microsoft Office 365",
    description:
      "Panduan penggunaan Microsoft Word, Excel, dan PowerPoint 365 untuk keperluan perkantoran dan akademik.",
    href: "materi/1/msoffice",
  },
  {
    image: "/materi/1/algoritma_files/thumbnail.jpg",
    alt: "Algoritma dan Pemrograman Java",
    badge: "Kelas X",
    grade: "1",
    title: "Algoritma Pemrograman",
    description:
      "Pengenalan konsep bahasa pemrograman Java, tipe data, operator, dan struktur kontrol.",
    href: "materi/1/algoritma",
  },
  {
    image: "/materi/1/gerbang-logika_files/thumbnail.jpg",
    alt: "Gerbang Logika",
    badge: "Kelas X",
    grade: "1",
    title: "Sistem Komputer",
    description:
      "Pembahasan gerbang logika digital seperti OR, AND, NOT, NAND, NOR, XOR, dan XNOR beserta tabel kebenarannya.",
    href: "materi/1/gerbang-logika",
  },
  {
    image: "/materi/1/dampak-sosial_files/thumbnail.jpg",
    alt: "Dampak Sosial Teknologi",
    badge: "Kelas X",
    grade: "1",
    title: "Dampak Sosial Informatika",
    description:
      "Analisis perkembangan teknologi komputer, kewargaan digital, serta dampak positif dan negatifnya terhadap masyarakat.",
    href: "materi/1/dampak-sosial",
  },
  {
    image: "/materi/1/analisi-data_files/thumbnail.jpg",
    alt: "Analisis Data",
    badge: "Kelas X",
    grade: "1",
    title: "Analisis Data",
    description:
      "Konsep dasar analisis data, jenis-jenis data, serta metode pengolahan dan penyajian data.",
    href: "materi/1/analisi-data",
  },
  {
    image: "/materi/1/jaringan-komputer_files/thumbnail.jpg",
    alt: "Jaringan Komputer",
    badge: "Kelas X",
    grade: "1",
    title: "Jaringan Komputer dan Internet",
    description:
      "Pengertian, prinsip kerja, manfaat, dan jenis sinyal dalam teknologi jaringan komputer.",
    href: "materi/1/jaringan-komputer",
  },
  {
    image: "/materi/1/praktik-lintas_files/thumbnail.jpg",
    alt: "Praktik Lintas Aplikasi",
    badge: "Kelas X",
    grade: "1",
    title: "Praktik Lintas Bidang",
    description:
      "Praktik pengembangan aplikasi tepat guna berbasis Array dan pemrograman Java dalam kehidupan sehari-hari.",
    href: "materi/1/praktik-lintas",
  },
  {
    image: "/materi/1/literasi-digital_files/thumbnail.jpg",
    alt: "Literasi Digital",
    badge: "Kelas X",
    grade: "1",
    title: "Literasi Digital",
    description:
      "Keterampilan memproduksi, menyebarkan, dan memahami etika konten digital serta pelabelan informasi secara bertanggung jawab.",
    href: "materi/1/literasi-digital",
  },
];

export default function Materi() {
  return (
    <div className="mt-25 flex justify-center mb-25">
      <div className="container">
        <h1 className="mb-2 text-2xl">
          <span className="text-primary">Materi</span>
        </h1>
        <p className="text-foreground mb-12">
          Koleksi lengkap sumber daya, catatan, dan panduan teknis yang telah dikurasi untuk <br />
          menemani perjalanan belajarmu di dunia informatika.
        </p>
        <MateriFilter materi={materi} />
      </div>
    </div>
  );
}
