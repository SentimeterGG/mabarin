export default function About() {
  return (
    <div className="mt-25 flex justify-center mb-25">
      <div className="container">
        <h1 className="mb-2 text-2xl">
          Tentang <span className="text-primary">Website</span>
        </h1>
        <p className="text-foreground mb-12">
          Mengenal lebih dekat tujuan, latar belakang, dan pihak di balik pembuatan
          media pembelajaran informatika ini.
        </p>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 mb-12">
          <section>
            <h2 className="text-xl font-semibold mb-4">Tujuan</h2>
            <p className="text-foreground leading-relaxed mb-6">
              Website ini dibuat untuk lebih memudahkan mempelajari informatika tanpa
              harus melakukan tatap muka. Pembelajaran dapat dilakukan dimana saja dan
              kapan saja. Semakin berkembangnya teknologi, siswa juga diharuskan
              mengetahui perkembangan teknologi. Website ini juga sebagai wadah media
              pembelajaran Informatika agar tetap tersimpan dalam Internet dan dapat
              diakses secara fleksibel.
            </p>
            <img
              src="/images/about1.jpg"
              alt="Latar belakang SinBarTIK"
              className="aspect-video w-full rounded-2xl object-cover"
            />
          </section>

          <section>
            <h2 className="text-xl font-semibold mb-4">Latar Belakang</h2>
            <p className="text-foreground leading-relaxed mb-6">
              Bagaimana dibutuhkannya media pembelajaran yang mudah diakses dan fleksibel
              melalui pengembangan teknologi? jawabannya dengan mempublikasi ke media
              internet salah satunya dengan membuat website. Pak Sasongko atau dikenal
              dengan Pak Sas memutuskan pada media pembelajaran pada kedepannya akan
              disimpan di web. Dengan Bantuan muridnya, Pak Sas membuat web SinBarTIK pada
              Tahun 2023.
            </p>
            <img
              src="/images/about2.jpg"
              alt="Latar belakang SinBarTIK"
              className="aspect-video w-full rounded-2xl object-cover"
            />
          </section>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12">
          <section>
            <h2 className="text-xl font-semibold mb-4">Contact Person</h2>
            <div className="rounded-2xl border border-border p-5">
              <p className="text-foreground">
                Pak Sas:{" "}
                <a
                  href="tel:+6282143322393"
                  className="text-primary hover:underline font-number"
                >
                  +62 821-4332-2393
                </a>
              </p>
            </div>
          </section>

          <section>
            <h2 className="text-xl font-semibold mb-4">Pihak Yang Terlibat</h2>
            <div className="rounded-2xl border border-border p-5">
              <p className="text-foreground">
                XI RPL B : Giovaldo Gibran Mahesa
              </p>
            </div>
          </section>
        </div>
      </div>
    </div>
  );
}
