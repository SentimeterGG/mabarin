-- =============================================================
-- Table: materials
-- =============================================================

create table materials (
  id bigint primary key generated always as identity,
  title text not null,
  short_desc text not null default '',
  grade int not null check (grade in (1, 2, 3)),
  tags text[] not null default '{}',
  content text not null default '',
  slug text not null default '',
  image text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz default now()
);

-- Enable Row Level Security (RLS)
alter table materials enable row level security;

-- Public read access for exposed schema (if you want the anon role to read)
grant select on public.materials to anon;

-- Table privileges for logged-in users (RLS policies alone are not enough:
-- Postgres also requires GRANTs on the table itself)
grant select, insert, update, delete on public.materials to authenticated;

-- RLS Policies
drop policy if exists "public can read materials" on public.materials;
create policy "public can read materials" on public.materials
  for select to anon using (true);

drop policy if exists "authenticated can read materials" on public.materials;
create policy "authenticated can read materials" on public.materials
  for select to authenticated using (true);

drop policy if exists "authenticated can insert materials" on public.materials;
create policy "authenticated can insert materials" on public.materials
  for insert to authenticated with check (true);

drop policy if exists "authenticated can update materials" on public.materials;
create policy "authenticated can update materials" on public.materials
  for update to authenticated using (true);

drop policy if exists "authenticated can delete materials" on public.materials;
create policy "authenticated can delete materials" on public.materials
  for delete to authenticated using (true);

-- =============================================================
-- Real data (from app/materi/1/*.md and app/(main)/materi/page.tsx)
-- =============================================================

insert into materials (title, short_desc, grade, tags, content)
values
  (
    'Berpikir Komputasional',
    'Pemahaman konsep pola berpikir, teknik memetakan ide, algoritma, dan logika proposisi dalam pemecahan masalah.',
    1,
    array['informatika', 'berpikir komputasional', 'algoritma'],
    $content$# Berpikir Komputasional

---

## 1. Pola Berpikir

![poina](berpikir-komputasional_files/poina.svg)

### A. Konsep Ide atau Gagasan

**Ide atau Gagasan Daya**, respon berpikir yang melahirkan imajinasi berupa rancangan solusi terhadap masalah yang dihadapi sebagai hasil pemikiran, baik yang bersifat spontan maupun melalui proses pemikiran yang lama.

Ide atau gagasan yang dihasilkan dari proses berpikir secara panjang dan matang disebut penalaran. Penalaran dapat memberikan solusi alternatif yang lebih matang. Terkadang ide tidak langsung dituangkan dalam sebuah tindakan nyata, tetapi masih sebatas bayangan yang disimulasikan secara mendalam, berbekal pengetahuan dan keterampilan yang dimiliki. Keberhasilan ide atau gagasan akan diuji setelah dilakukan implementasi.

### B. Teknik Memetakan Ide

![poinb2](berpikir-komputasional_files/poinb2.svg)

**Teknik Memetakan Ide**, Kompleksitas permasalahan harus diimbangi dengan visualisasi penjabaran ide atau gagasan secara detail, jelas dan mudah dibaca. Tahapan mengkategorikan, menjabarkan dan menggambarkan ide ini merupakan sebuah sistem pemetaan ide.

### C. Konsep Algoritma

**Algoritma**, adalah Serangkaian proses atau aturan yang disusun dan diurutkan secara sistematis dan logis untuk menyelesaikan permasalahan.

---

## 2. Pernyataan dan Logika Preposisi

### A. Definisi Proposisi

**Proposisi**, adalah metode untuk menyatakan sesuatu secara utuh sehingga dapat dinilai apakah pernyataan tersebut benar, salah, disetujui, ditolak, diterima, atau disangkal validatasnya.

Logika proposisi dapat diidentifikasi berdasarkan empat elemen, yaitu:

1. **Subjek**, Konsep yang menjadi aktor utama dalam pernyataan.
2. **Kopula**, Kata kerja (verba) yang menjadi penghubung antara subjek dan predikat dalam sebuah pernyataan.
3. **Predikat**, Perlakuan atau tindakan yang dilakukan atau dikenakan pada subjek.
4. **Kuantor**, Bagian dari pernyataan yang penulisannya disesuaikan dengan kebutuhan, dengan tujuan untuk mengubah frasa pernyataan umum menjadi tertutup dalam mempertegas makna yang disampaikan.

![2poina](berpikir-komputasional_files/2poina_b9Zi.svg)

### B. Aspek Penggunaan dalam Proposisi

![2poinb](berpikir-komputasional_files/2poinb_b9Zi.svg)

---

## 3. Logika Matematika

![3poina2](berpikir-komputasional_files/3poina2_b9Zi.svg)

### A. Negasi

Metode membalikan niai sebelumnya, yang semula benar menjadi salah dan salah menjadi benar. Dengan menambahkan negasi (~), dapat membuat penyangkalan atau pengingkaran dari pernyataan yang sebelumnya dibuat.

![3poina1](berpikir-komputasional_files/3poina1_b9Zi.svg)

### B. Konjungsi

Teknik penggabungan beberapa pernyataan (pernyataan majemuk) dengan karakteristik konjungsi kara "dan" yang dinotasikan dengan simbol "∧". Konjungsi akan menghasilkan keluaran benar jika kedua masukan bernilai benar.

![3poinb](berpikir-komputasional_files/3poinb_b9Zi.svg)

### C. Disjungsi

Teknik perbandingan antara dua pernyataan (pernyataan majemuk) yang dihubungkan dengan kata "atau" dinotasikan dengan simbol "∨". Disjungsi ini akan menghasilkan nilai benar selama ada salah satu pernyataan yang bernilai benar.

![3poinc](berpikir-komputasional_files/3poinc_b9Zi.svg)

### D. Implikasi

Penerapan pernyataan majemuk yang menggunakan kata penghubung "jika.. maka" dengan notasi simbol "→".

![3poind](berpikir-komputasional_files/3poind_b9Zi.svg)

### E. Biimplikasi

Penerapan pernyataan majemuk yang dibentuk dengan menggunakan kata penghubung "...jika dan hanya jika", dengan notasi simbol "↔".

![3poine](berpikir-komputasional_files/3poine_b9Zi.svg)

---

## 4. Metode Penalaran

### A. Definisi

Penalaran adalah proses menyimulasikan ide tersebut dalam otak untuk dianalisis, ditimbang, dan diuji secara mendalam. Metode penalaran manusia dapat dikategorikan menjadi tiga jenis, yaitu: **Deduktif**, **Induktif**, dan **Abduktif**.

![4poinb2](berpikir-komputasional_files/4poinb2_b9Zi.svg)

### B. Deduktif

Metode penalaran yang difokuskan untuk menggali informasi-informasi umum, kemudian dirangkum menjadi simpulan secara khusus. Berikut macam deduktif:

![4poinb1](berpikir-komputasional_files/4poinb1_b9Zi.svg)

### C. Induktif

![4poinc](berpikir-komputasional_files/4poinc_b9Zi.svg)

Metode induktif dilakukan dengan mempelajarai dan menganalisis pernyataan-pernyataan secara khusus atau spesifik menjadi bersifat umum.

Aktivitas yang sering dikerjakan dalam proses penalaran induktif, yaitu:

1. Analogi, aktivitas pengambilan simpulan dengan mempertimbangkan keseragaman data atau proses.
2. Generalisasi, teknik penetapan simpulan berdasarkan kumpulan data yang telah dianalisis terlebih dulu.
3. Transduktif, metode penarikan poin simpulan terhadap kasus yang bersifat khusus, yang diimplementasikan pada kasus lainnya.
4. Memprediksi kebenaran jawaban terhadap persoalan, solusi pemecahan masalah, ekstrapolasi, dan interpolasi.
5. Menggambarkan model, sifat, kenyataan, fakta, korelasi atau hubungan, dan pattern atau pola.
6. Menerapkan teknik analisis terhadap pola hubungan situasi, kemudian disusun menjadi konjektur.

Metode penalaran yang dilakukan dengan mengambil salah satu opsi argumentasi atau alasan yang dianggap mendekati kebenaran dari beberapa pilihan argumentasi. Terdapat 4 solusi yang dapat dilakukan:

### D. Abduktif

![4poind](berpikir-komputasional_files/4poind_b9Zi.svg)

---

## 5. Logika Penalaran Interfensi

### A. Konsep Inferensi

Inferensi atau Inference (dalam Bahasa inggris) = Penyimpulan. Kata kerja penyimpulan memiliki makna tindakan membuat simpulan atau konklusi. Dalam arti luas, inferensi adalah mekanisme pembuatan simpulan atau konklusi berdasarkan satu atau lebih proposisi. Dalam pelaksanaannya, metode inferensi harus mempertimbangkan faktor implikatur atau makna yang tersirat, baik secara langsung maupun tidak langsung.

### B. Kebenaran Argumen

Argumen merupakan kumpulan pernyataan dengan bagian akhir dari pernyataan tersebut dapat dikategorikan sebagai konklusi. Sedangkan pernyataan-pernyataan yang ditulis sebelumnya dikenal dengan istilah premis atau hipotesis.

### C. Jenis Inferensi Berdasarkan Jumlah Premis

![5poinc](berpikir-komputasional_files/5poinc_b9Zi.svg)

### D. Metode Inferensi

![5poind](berpikir-komputasional_files/5poind_b9Zi.svg)

1. **Modus Ponens**
   Modus ponens dapat dilihat pada contoh penerapan logika implikasi, yaitu agar p "→" q menghasilkan simpulan bernilai benar, maka q harus bernilai benar.

2. **Modus Tollens**
   Proses pengambilan simpulan dengan tollens sebenernya mirip dengan modus ponens. Perbedaannya adalaah premis kedua dan simpulan merupakan negasi dari setiap proposisi pada premis awal.

3. **Modus Penambahan Disjungtif**
   Dengan penghubung "V" pada aturan disjungtif, jika salah satu pernyataan bernilai benar, disjungsi akan bernilai benar.

   Notasi dalam modus penambahan disjungtif:

   ![disjungtif](berpikir-komputasional_files/disjungtif_b9Zi.svg)

4. **Modus Penyederhanaan Konjungtif**
   Dalam modus ini, jika beberapa pernyataan dihubungkan dengan pengubung "∧", maka dapat diambil salah satu pernyataan secara khusus.

   Notasi dalam modus penambahan konjungtif:

   ![konjungtif](berpikir-komputasional_files/konjungtif_b9Zi.svg)

---

## 6. Logika Konversi Bilangan

### A. Jenis dan Format Bilangan

Pada umumnya, bilangan yang dikenal adalah kombinasi dari 0 dan 9. Angka-angka tersebut dapat dikelompokan lagi menjadi beberapa jenis bilangan, mulai dari bilangan biner, ternary, desimal hingga heksadesimal. Dari banyak jenis bilangan tersebut ada empat format bilangan yang sering digunakan yaitu biner, oktal, desimal, dan heksadesimal.

![6poina1](berpikir-komputasional_files/6poina1_b9Zi.svg)

![6poina2](berpikir-komputasional_files/6poina2_b9Zi.svg)

### B. Teknik Konversi Bilangan

Konversi adalah mengubah bentuk atau dapat dikatakan teknik mengubah suatu bentuk lainnya, dengan tetap memiliki arti dan nilai yang sama.

![6poinb](berpikir-komputasional_files/6poinb_b9Zi.svg)

### C. Sistem Penyandi Bilangan

Ketika seorang user mengetikkan angka 8 dengan dengan keyboard, tombol akan mengubah kode desimal menjadi sebuah angka biner yang dikirim menuju CPU atau processor. Proses tersebut merupakan tahap encoding, yaitu tahap mengubah nilai bilangan desimal 8 menjadi biner sebelum dikirimkan ke CPU. Nilai biner 〖1000〗_2 pada CPU kemudial diolah dan dikirimkan menuju rangkaian decoder untuk mengubah nilai biner 〖1000〗_2 menjadi nilai desimal 8, yang kemudian ditampilkan dalam layar monitor.

![6poinc](berpikir-komputasional_files/6poinc_b9Zi.svg)

---

## 7. Berpikir Algoritmik

### A. Jenis data dalam bilangan

Berpikir komputasional atau computational thinking merupakan metode menyelesaikan masalah-masalah dengan cara menerapkan model ilmu komputer (informatika) yang menuntut berpola pikir runtut, teratur, detail, jelas, memiliki nilai input dan output yang dihasilkan. Nilai yang diinputkan, diolah dan dihasilkan merupakan sebuah data yang dibaca, dihitung dan dianalisis.

### B. Teknologi Computational Thinking

Konsep CT atau Computational Thinking pertama kali diperkenalkan oleh Jeannette Wing pada Maret 2006 sebagai bentuk model dan mekanisme penyelesaian masalah melalui tahapan analisis masalah, desain sistem, dan implementasi menggunakan pendekatan ilmu komputer dengan tujuan efektivitas dan kecepatan pengambilan keputusan.

![7poinc](berpikir-komputasional_files/7poinc_b9Zi.svg)
$content$
  ),
  (
    'Microsoft Office 365',
    'Panduan penggunaan Microsoft Word, Excel, dan PowerPoint 365 untuk keperluan perkantoran dan akademik.',
    1,
    array['informatika', 'word', 'excel', 'powerpoint'],
    $content$# Microsoft Office 365

---

## 1. Mahir Microsoft Word 365

![1poina](msoffice_files/1poina_z2kQ.svg)

### A. Mengenal Microsoft Office 365

**Aplikasi perkantoran (office)**, adalah aplikasi yang digunakan untuk memudahkan pekerjaan perkantoran, seperti membuat dokumen, mengelola data, presentasi, dll. Aplikasi yang paling banyak digunakan yaitu: pengolah kata, pengolah angka, dan presentasi. Microsoft Word adalah Aplikasi pengolah kata memiliki fitur utama untuk membuat dan mengolah dokumen.

### B. Lisensi Microsoft Office 365

Teknik Memetakan Ide Kompleksitas permasalahan harus diimbangi dengan visualisasi penjabaran ide atau gagasan secara detail, jelas dan mudah dibaca. Tahapan mengkategorikan, menjabarkan dan menggambarkan ide ini merupakan sebuah sistem pemetaan ide. Terdapat tiga kategori untuk user ms office:

1. **Kategori Pelajar dan Pengajar**, Dengan syarat melakukan sign-in menggunakan e-mail resmi sekolah.
2. **Kategori Home**, Untuk user dengan penggunaan di rumah (home)
3. **Kategori Bisnis**, User dengan penggunaan di lingkungan bisnis atau kerja yang memiliki fitur dan kapasitas penyimpanan lebih besar.

### C. Bekerja dengan Menggunakan Microsoft Word 365

1. Login ke dalam sistem dengan menggunakan username yang dibuat sebelumnya.
2. Klik ikon Word, kemudian anda akan dibawa ke dalam interface Word.
3. Tampilan interface Microsoft Word 365 mirip dengan versi sebelumnya dengan beberapa fitur tambahan.
4. Klik New – Blank Document.

### D. Menulis Paragraf dengan Word

1. Login dengan akun yang telah didaftarkan.
2. Atur Dokumen dengan ketentuan :
   - Ukuran kertas = A4
   - Ukuran font = 12 pt
   - Jenis font = Arial
   - Spasi paragraf = 1,5 lines
   - Alignment = Justify
   - Margin kiri = 3 cm
   - Margin kanan = 2 cm
   - Margin atas = 3 cm
   - Margin bawah = 2 cm

![1poind](msoffice_files/1poind_z2kQ.svg)

3. Selanjutnya ketik paragraf berikut:

> **Mengenal Memori (RAM) Pada Komputer.**
>
> Memori (RAM), keluaran distro linux yang menggunakan kernel terbaru versinya tidak mengalami masalah pada pemakaian jenis RAM dengan model dan merk apapun. Akan tetapi pada beberapa kasus, jika kita melakukan pemindahan kartu memori pada slot berbeda atau menambahkan kartu memori dengan merk atau chip berbeda, biasanya sistem akan mengalami kernel panic. Yang sering menjadi perhatian adalah biasanya minimum RAM yang harus kita sediakan pada saat akan menginstal sistem operasi linux berbasis teks atau menggunakan desktop sebagai GUInya. Menurut pengalaman, distro Fedora minimum RAM harus tersedia adalah 256 MB, dan ketika akan menjadikan Fedora sebagai desktop PC makan minimum RAM adalah sisa 512 MB.

4. Selamat Anda telah berhasil membuat dokumen untuk pertama kali.

### E. Bekerja dengan Teks

Berikut adalah beberapa shortcut yang dapat digunakan di Microsoft Office :

| Shortcut               | Fungsi                                                      |
| ---------------------- | ----------------------------------------------------------- |
| `Ctrl` + `A`           | Memblok semua teks dalam Dokumen                            |
| `Ctrl` + `B`           | Menebalkan teks                                             |
| `Ctrl` + `C`           | Menyalin teks (copy)                                        |
| `Ctrl` + `D`           | Membuka jendela Font Formatting                             |
| `Ctrl` + `E`           | Mengatur tulisan berada di tengah Dokumen                   |
| `Ctrl` + `F`           | Mencari kata tertentu                                       |
| `Ctrl` + `G`           | Menuju halaman tertentu                                     |
| `Ctrl` + `H`           | Mengganti kata/kalimat dengan kata/kalimat lain             |
| `Ctrl` + `I`           | Membuat tulisan miring                                      |
| `Ctrl` + `J`           | Justify atau membuat tulisan rata kiri dan kanan            |
| `Ctrl` + `K`           | Menambah hyperlink pada teks                                |
| `Ctrl` + `M`           | Membuat paragraph dari kiri                                 |
| `Ctrl` + `P`           | Mencetak Dokumen                                            |
| `Ctrl` + `Q`           | Menghapus editing                                           |
| `Ctrl` + `R`           | Membuat tulisan rata kanan (align right)                    |
| `Ctrl` + `S`           | Menyimpan perubahan Dokumen                                 |
| `Ctrl` + `T`           | Membuat paragraph dalam posisi menggantung                  |
| `Ctrl` + `U`           | Menambahkan garis bawah (Underline) pada teks               |
| `Ctrl` + `V`           | Menempelkan (Paste) hasil copy atau cut                     |
| `Ctrl` + `W`           | Menutup jendela Word                                        |
| `Ctrl` + `X`           | Memindahkan objek ke tempat lain (Cut)                      |
| `Ctrl` + `Y`           | Mengulang perintah yang sudah dibatalkan sebelumnya (Redo)  |
| `Ctrl` + `Z`           | Membatalkan perintah yang sudah dilakukan sebelumnya (Undo) |
| `Ctrl` + `]`           | Memperbesar ukuran huruf dalam teks                         |
| `Ctrl` + `[`           | Memperkecil ukuran huruf dalam teks                         |
| `Ctrl` + `Home`        | Menggeser kursor menuju halaman utama                       |
| `Ctrl` + `End`         | Menggeser kursor menuju halaman akhir                       |
| `Ctrl` + `Delete`      | Menghapus satu huruf ke kanan                               |
| `Ctrl` + `Backspace`   | Menghapus satu huruf ke kiri                                |
| `Ctrl` + `Left arrow`  | Menggeser kursor kata per kata dari kiri                    |
| `Ctrl` + `Right arrow` | Menggeser kursor kata per kata dari kanan                   |
| `Ctrl` + `Up arrow`    | Menggeser kursor ke paragraph atas                          |
| `Ctrl` + `Down arrow`  | Menggeser kursor ke paragraph bawah                         |
| `Ctrl` + `Alt` + `R`   | Membuat symbol trademark registered (®)                     |
| `Ctrl` + `Alt` + `T`   | Membuat symbol trademark (™)                                |
| `Ctrl` + `Alt` + `M`   | Menambah komentar dalam dokumen                             |

### F. Menambahkan Tabel dan Gambar ke dalam Dokumen

1. Tambahkan table di bawah paragraph utama, klik Insert – Table, kemudian tentukan format table dengan 3 kolom dan 3 baris.
2. Selanjutnya, buat desain dan konten dalam table seperti pada gambar berikut.

![1poinf2](msoffice_files/1poinf2_z2kQ.svg)

3. Untuk menambahkan gambar, dapat dilakukan dengan mengunggah gambar dari computer (online) atau mencari gambar dari internet (offline). Klik Insert – Picture.

![1poinf3](msoffice_files/1poinf3_z2kQ.svg)

4. Untuk gambar online, klik Insert – Online Picture, lalu cari nama file yang dicari, cth: SDRAM
5. Pilih satu file kemudian klik Insert. Berikan penjelas gambar pada bagian bawahnya dengan pengaturan rata tengah.

![1poinf5](msoffice_files/1poinf5_z2kQ.svg)

---

## 2. Terampil Microsoft Word 365

### A. Mengatur Dimensi Baris dan Kolom Excel

1. Masukan data tersebut ke dalam lembar kerja Excel.
2. Atur lebar kolom, lebar kolom yang masih standar membuat beberapa item tidak dapat ditampilkan dengan baik.
3. Cara pertama, tempatkan kursor di garis batas kolom hingga menjadi tanda dua panah, lalu geser lebar kolom sesuai ukuran.
4. Cara kedua, klik kanan kolom yang ingin diubah, setelah itu pilih Column Width dan atur lebar kolom.
5. Untuk mengatur beberapa kolom dengan lebar yang sama, lakukan block beberapa kolom yang ingin diatur kemudian atur lebar kolom yang diinginkan. Hal ini juga berlaku untuk mengatur tinggi baris juga.
6. AutoFit Column Width digunakan untuk menyesuaikan lebar secara otomatis dengan konten yang ada di dalam cell.
7. Klik dan drag semua kolom yang akan diatur dengan AutoFit Column Width.
8. Pilih tab Home – grup Format – klik AutoFit Column Width.
9. Gunakan Select All Row and Column untuk memblok semua cell yang ada di worksheet jika ingin mengubah ukuran semua baris dan kolom.

![2poina](msoffice_files/2poina_z2kQ.svg)

10. Untuk mengatur tinggi baris dalam Excel, dapat dilakukan dengan cara yang sama seperti mengatur ukuran lebar kolom.
11. Untuk menambahkan border atau garis pemisah tabel, klik kanan – pilih Format Cells – klik tab Border.
12. Pengaturan letak isi cell dalam table Excel dapat dilakukan dengan mengatur alignment yang terdapat pada grup Allignment dalam tab Home.

### B. Membuat Formula pada Laporan Penilaian (Ledger) Peserta Didik

1. Buat lembar Excel baru dengan nama file Ledger Siswa. Buat tabel dan masukan data berikut.
2. Buat tabel dan masukan data berikut.

![2poinb2](msoffice_files/2poinb2_z2kQ.svg)

3. Pada cell F8, tertulis NA yang berarti adalah nilai akhir. Masukan formula untuk menghitung NA, yaitu (60%*K)+(40%*P) dengan K adalah nilai keterampilan dan P adalah nilai pengetahuan.
4. Buatlah formula untuk menghitung cell F8 yaitu = (60%*ED)+(40%*D8).
5. Tekan Enter, hasil perhitungan dapat langsung dilihat pada sel tersebut.

![2poin5](msoffice_files/2poin5_z2kQ.svg)

6. Untuk menyalin formula yang ditetapkan pada cell F8 ke cell F9 sampai F17, klik cell F8 kemudian tahan dan geser hingga F17. Dengan kemudian, semua formula akan tersalin secara otomatis sampai F17.
7. Lakukan hal yang serupa pada cell J8 sampai J17, N8 sampai N17, R8 sampai R17, dan V8 sampai V17.
8. Setelah itu, hitung nilai rata-rata dari setiap Nilai Pengetahuan, Nilai Keterampilan, dan Nilai Akhir yang berada pada kolom X, Y, dan Z.
9. Terlebih dahulu cari Nilai Pengetahuan. Pada cell X8, masukkan formula =(D8+H8+L8+P8+T8)/5
10. Salin formula yang diterapkan pada cell X8 ke X9 sampai X17.
11. Selanjutnya, hitung rata-rata Nilai Keterampilan. Pada cell Y8 masukkan rumus =(E8+I8+M8+Q8+U8)/5
12. Salin formula yang diterapkan pada cell Y8 ke Y9 sampai Y17.
13. Terakhir cari Nilai Akhir, dengan memasukan rumus =(F8+J8+N8+R8+V8)/5 pada cell Z8
14. Salin formula yang diterapkan pada cell Z8 ke Z9 sampai Z17. Hasilnya sebagai berikut.

![2poin14](msoffice_files/2poin14_z2kQ.svg)

### C. Fungsi Logika

True / False Adalah nilai default yang menjadi tolak ukur dan standar logika sebuah kondisi apakah akan dikerjakan atau tidak. Jika True akan mengeksekusi X dan jika False akan mengerjakan Y.

**Macam-Macam Operator aritmetika dalam Excel :**

1. "+" : Menjumlahkan dua bilangan atau lebih
2. "-" : Melakukan pengurangan sebuah bilangan dengan bilangan lainnya
3. "/" : Melakukan pembagian
4. "*" : Melakukan proses perkalian
5. "%" : Persen
6. "^" : Pangkat

Untuk mengecek suatu kondisi bernilai true atau false, dapat menggunakan beberapa operator logika sebagai berikut :

1. "=" : Sama dengan
2. "<" : Kurang dari
3. "<=" : Kurang dari atau sama dengan
4. ">" : Lebih besar dari
5. ">=" : Lebih besar dari atau sama dengan
6. "<>" : Tidak sama dengan

### D. Menggunakan Fungsi SUM, AVERAGE, COUNT, MAX, dan MIN

1. Sum, fungsinya untuk menghitung nilai total dari cell yang dihitung
2. Average, fungsinya untuk menghitung nilai rata-rata range cell yang dipilih
3. Count, fungsinya untuk menghitung banyak cell data.
4. Max, fungsinya untuk mencari nilai tertinggi.
5. Min, fungsinya untuk mencari nilai terendah

### E. Bekerja Dengan Grafik Dalam Excel

Grafik merupakan salah satu teknik menyajikan data detail yang terdiri atas angka atau numerik dalam bentuk visualisasi objek ruang, seperti batang, kolom, lingkaran, garis, dan lainnya. Untuk memilih jenis grafik yang akan digunakan, klik menu ribbon Insert – Charts.

---

## 3. Menyajikan Presentasi dengan Microsoft Office 365

### A. Mengenal Microsoft PowerPoint

Microsoft PowerPoint adalah salah satu produk keluaran Microsoft yang dibuat untuk membantu user dalam menyajikan informasi berbasis multimedia, seperti gambar, teks, suara, ataupun video dan animasi.

**Kelebihan :**

1. Menyediakan fitur multimedia dalam presentasi seperti penggunaan warna, teks, gambar, animasi, suara dan video.
2. Dapat memotivasi para audiensnya dalam mencerna dan berkonsentrasi dalam mengikuti sajian informasi yang disampaikan.
3. Informasi yang disampaikan lebih cepat dipahami dan dicermati oleh audiens.
4. Dapat memberikan visualisasi yang lebih baik dengan tampilan gambar dan simulasi data.

### B. Membuat Presentasi dengan PowerPoint

> **Latihan membuat presentasi tentang materi simulasi digital.**

a. Buka aplikasi Microsoft PowerPoint 365.
b. Pilih template yang diinginkan dengan mengklik More Themes, misalnya template Berlin.
c. Pilih warna background yang diinginkan, misalkan warna coklat, kemudian klik Create.
d. Simpan file presentasi dengan nama Biodataku.pptx
e. Pada halaman pertama buatlah judul yang menggambarkan tema yang disampaikan, lengkapi dengan nama pemateri dan logonya.
f. Untuk menambahkan halaman slide baru, dapat memilih menu Insert – New Slide atau menggunakan tombol kombinasi Ctrl + M.
g. Pada slide kedua, dapat ditampilkan data pribadi pemateri.
h. Untuk melengkapi biodata, dapat menyisipkan foto dengan mengeklik menu Insert – Pictures (pilih lokasi file gambar).

![3poinb1](msoffice_files/3poinb1_z2kQ.svg)

i. Selanjutnya, pilih tema desain penempatan gambar pada fitur Design Ideas di sebelah kiri. Untuk konten biodata disesuaikan dengan profil Anda sendiri.
j. Tambahkan halaman slide baru untuk menampilkan riwayat pendidikan. Sebagai contoh praktik menggunakan kombinasi kartun anak TK – SD – SMP (bisa didesain sendiri atau mengunduh dari internet).
k. Tambahkan slide baru yang akan menjelaskan tentang simulasi digital. Untuk menambahkan video, klik menu Insert – Video atau dengan mengklik ikon Video pada slide baru tersebut.
l. Tentukan lokasi penyimpanan video tersebut.
m. Tambahkan slide baru yang akan memuat daftar referensi seperti Wikipedia dan situs lainnya.
n. Buatlah link dari masing-masing referensi tersebut, dengan cara blok teks Wikipedia, kemudian klik kanan – pilih Link – Insert Link.
o. Masukan link https://id.Wikipedia.org/wiki/Digital tersebut pada kotak isian Address, kemudian klik OK.
p. Lakukan hal yang serupa pada teks YouTube yang akan diarahkan ke link https://youtube.com
q. Secara visual, yang memiliki link ke arah halaman URL tertentu akan ditandai dengan garis bawah.
r. Jalankan presentasi tersebut dengan menekan tombol F5 atau klik menu Slide Show – From Beginning.
s. Ketika anda menjalankan fitur Slide Show, pada bagian bawah kiri terdapat ikon yang memudahkan dalam mengelola model presentasi.

![3poinb2](msoffice_files/3poinb2_z2kQ.svg)

### C. Menambahkan Efek Suara dan Animasi Antar-slide

1. Buka kembali file presentasi sebelumnya.
2. Pada slide pertama, untuk menambahkan animasi pada slide klik menu Animations – kemudian pilih komponen teks judul presentasi (blok komponen tersebut) baru klik menu Add Animation – Swivel.
3. Untuk melihat efeknya, jalankan animasi dengan mengklik ikon Animation Pane dan muncul jendela Animation Pane di sebelah kiri – pilih tombol Play.

![3poinc1](msoffice_files/3poinc1_z2kQ.svg)

4. Lakukan hal serupa pada slide-slide berikutnya dengan corak animasi yang berbeda-beda.
5. Untuk menambahkan suara dalam presentasi, persiapkan dahulu file .mp3 yang akan disisipkan. Klik Insert – Audio – Audio on My PC.
6. Tentukan lokasi file audio yang akan disisipkan.
7. Hasilnya adalah sebagai berikut.

![3poinc2](msoffice_files/3poinc2_z2kQ.svg)

---

## 4. Komunikasi Daring

### A. Jenis Komunikasi Daring

Komunikasi adalah Metode menyampaikan ide atau gagasan kepada orang lain melalui media tertentu. Salah satu teknologi yang memiliki peran penting dalam komunikasi adalah internet.

**Model Komunikasi Daring :**

1. **Komunikasi daring secara sinkron (serempak)**, Jenis komunikasi digital yang dilakukan dalam waktu yang bersamaan oleh pengirim data dan penerima data (real-time). Contoh: chatting, teleconference, video conference
2. **Komunikasi daring secara asinkron (tidak serempak)**, Jenis komunikasi digital yang dilakukan secara tidak langsung atau mengalami masa jeda (tunda). Contoh: Diskusi pada forum

### B. E-mail

Email atau electronic mail merupakan salah satu media komunikasi yang memungkinkan user dapat melampirkan beberapa file, seperti teks, file audio, video dan jenis file lainnya secara cepat melalui internet.

![4poinb](msoffice_files/4poinb_z2kQ.svg)

### C. Aplikasi Chat

Aplikasi chat dapat melakukan komunikasi jarak yang jauh. Dengan tulisan ataupun audio dapat dikomunikasikan pada aplikasi ini. Berikut adalah beberapa aplikasi chat:

![4poinc](msoffice_files/4poinc_z2kQ.svg)

### D. Membuat Blog dengan Wordpress

Teknologi blog diperkenalkan oleh John Barger sekitar tahun 1997 yang dikenal dengan nama "web blog". Dengan web blog, anda dapat menulis ide, cerita, tutorial dan pengalaman pribadi secara berkelanjutan agar dapat diakses dan dibaca oleh pengguna lainnya di internet.

---

## 5. Teknologi Cloud

![5thumb](msoffice_files/5thumb_z2kQ.svg)

### A. Media Penyimpanan Cloud

Penyimpanan cloud adalah adalah model penyimpanan data komputer di mana data digital dan juga dapat diakses oleh beberapa orang. Penyimpanan ini juga dapat diakses di berbagai device (tergantung dari optional).

### B. Membuat Vlog di Youtube

Vlog merupakan perpaduan dua istilah, yaitu video dan blog. Vlog dapat dikatakan sebagai aktivitas blogging menggunakan media video yang didistribusikan dan selalu diperbarui secara berkala untuk memperoleh rating pengunjung.

### C. Google Form

Google form merupakan layanan yang memungkinkan user membuat form berisi sejumlah pertanyaan dan kolom isian secara online. Tujuannya adalah memudahkan pengisian data yang dibutuhkan oleh suatu institusi atau organisasi pada setiap pelanggan atau anggotanya melalui sambungan internet.

### D. Menerapkan e-learning dengan Google Classroom

**Ada dua persepsi dasar e-learning, yaitu sebagai berikut.**

1. **Electronic based e-learning**, Metode pembelajaran berbasis IT dengan memanfaatkan media digital, baik secara online maupun offline. Misal, video file, presentasi dengan proyektor LCD, animasi, pembelajaran berbasis multimedia, dll.
2. **Internet based e-learning**, Metode pembelajaran yang memanfaatkan jaringan internet sebagai media utamanya. Dengan sistem ini, peserta didik dapat mengakses dan menggunakannya sebagai sarana belajar selama terkoneksi dengan internet.

### E. Teknologi yang diterapkan dalam metode e-learning

1. **LMS (Learning Management System)**, menyediakan fitur pengelolaan pembelajaran, content delivery system, dokumentasi presensi peserta e-learning, pengiriman soal, pemeriksaan jawaban serta pengumuman, berita dan materi belajar.
2. **LCMS (Learning Content Management System)**, merupakan lanjutan dari LMS, yang dilengkapi fitur tambahan untuk membuat dan mengelola konten pembelajaran serta dilengkapi dengan fitur monitoring, penyediaan data, dan laporan yang lebih rinci.
3. **SLN (Social Learning Network)**, merupakan lanjutan dari teknologi LCMS. Teknologi ini telah ditambahkan fitur kolaborasi, diskusi, dan analisis hubungan sosial yang diharapkan akan menstimulasi peserta didik untuk berkolaborasi secara lebih aktif.

---

## 6. Teknik Grafis dan Video Editing

### A. Definisi dan Konsep Grafis

**Penerapan desain grafis pada jenis media :**

1. Media digital/elektronik, seperti smartphone, computer, laptop, televisi, film, dan lainnya.
2. Media cetak, seperti sampul buku, brosur, stiker, majalah, dan koran.
3. Media eksternal, seperti spanduk, baliho, papan nama, banner.
4. Showroom, atau ruang pameran
5. Benda yang sering dipakai atau dilihat orang, seperti kaus, tas dan topi.
6. Menampilkan atau menambahkan objek grafis pada beberapa benda, seperti kaus, gelang, topi dan payung.

**Perbedaan desain grafis cetak dan multimedia :**

![6poina1](msoffice_files/6poina1_z2kQ.svg)

Terdapat dua jenis gambar yang dihasilkan dalam desain grafis, yaitu gambar raster dan gambar vector.

1. **Raster**, Struktur gambar tersusun atas kumpulan titik atau piksel yang berdiri sendiri membentuk pola gambar dan kombinasi warna tertentu sehingga memberikan kesan perbedaan bentuk dan kontras warna yang memunculkan sebuah gambar.
2. **Vektor**, Kumpulan garis dan kurva yang membentuk pola dengan ukuran dimensi (panjang, lebar, tebal dan tinggi) berdasarkan perhitungan sistematis.

**Perbandingan gambar raster dan vector :**

![6poina2](msoffice_files/6poina2_z2kQ.svg)

### B. Teknologi Scanning dan Printing

1. **Scanning**, Scanning memiliki arti membaca atau memindai secara seksama fisik, wujud, dan tampilan sebuah benda. Penerapannya dapat dilihat dalam bidang kesehatan, otomotif, teknologi informasi, sistem penjualan dan lainnya.
2. **Printing**, Printing memiliki arti mencetak atau menampilkan data berupa teks, gambar, atau grafik dalam bentuk cetakan pada kertas atau media lainnnya.

### C. Fotografi

Fotografi berasal dari gabungan istilah bahasa Yunani, yaitu Photos atau cahaya dan Grafo atau menulis/melukis. Secara harfiah, fotografi adalah mekanisme melukis atau menghasilkan karya seni yang dapat dinikmati orang lain.

### D. Video Editing

Video adalah teknologi digital yang merupakan gabungan atau kombinasi dari satu atau lebih gambar digital (mati) yang ditata ulang, diproses dan ditransmisikan sehingga membentuk gerakan atau motion dalam waktu dan frekuensi kecepatan tertentu, yang dilengkapi dengan efek audio dan suara. Proses dalam pembuatan video tersebut disebut video editing.

---

## Video Materi

_(Video materi tersedia di platform YouTube)_

---

© 2024 | WhatsApp: +62 821-4332-2393
$content$
  ),
  (
    'Algoritma Pemrograman',
    'Pengenalan konsep bahasa pemrograman Java, tipe data, operator, dan struktur kontrol.',
    1,
    array['informatika', 'algoritma', 'pemrograman', 'java'],
    $content$# Algoritma Pemrograman

---

## 1. Mengenal Bahasa Pemrograman Java

### A. Konsep Bahasa Pemrograman

Bahasa pemrograman merupakan sarana komunikasi programmer dalam bentuk struktur penulisan susunan perintah atau instruksi, yang dikenal oleh mesin computer dalam mengerjakan suatu proses.

Ciri khusus:

- Aturan penulisan baku
- Dukungan interrupt library (file penyerta)

Interpreter atau compiler sebagai penerjemah kode (syntax) pemrograman ke dalam bahasa mesin.

![1poina](algoritma_files/1poina.svg)

Berdasarkan kemampuan mesin dalam menerjemahkan perintah, bahasa pemrograman dibagi menjadi dua level:

1. **Bahasa Tingkat Rendah atau Low Level Language** — Bahasa yang hanya dimengerti oleh mesin, yang terdiri atas bilangan 0 dan 1 atau on dan off. Mesin akan langsung mengeksekusi perintah yang diinstruksikan oleh pengguna tanpa memerlukan media translator.
2. **Bahasa Tingkat Tinggi atau High Level Language** — Bahasa yang dirancang mendekati bahasa pergaulan manusia dalam kesehariannya dengan bantuan compiler agar dapat dieksekusi oleh mesin.

![1poina2](algoritma_files/1poina2.svg)

Agar hasil kompilasi kode sumber bahasa tingkat tinggi dapat dimengerti oleh mesin, dibutuhkan language translator yang dibedakan menjadi dua, yaitu:

1. **Compiler** — Compiler akan melakukan pemeriksaan semua baris syntax sampai tidak muncul eror. Jika ditemukan eror, proses kompilasi akan dihentikan dan ditampilkan informasi letak kesalahan.
2. **Interpreter** — Interpreter akan menerjemahkan kode program atau instruksi secara baris per baris. Meskipun ditemukan eror pada baris kode program tertentu, baris kode program sebelumnya akan tetap dieksekusi.

### B. Bahasa Pemrograman Java

Java adalah Bahasa pemrograman berorientasi objek yang kompatibel terhadap berbagai platform mesin dan OS, seperti Linux, Windows, dan Mac OS. Untuk menjalankan hasil kompilasi program, Java yang dirilis oleh Sun Microsystem pada tahun 1995, didukung oleh Java Interpreter dan Java Virtual Machine.

![1poinb1](algoritma_files/1poinb1.svg)

---

## 2. Struktur Penulisan Java

Java merupakan salah satu jenis high level language yang bersifat open source, keunggulannya mampu mengeksekusi binary code hasil kompilasi file program dengan JRE (Java Runtime Environment), mendukung konsep OOP (Object Oriented Programming) dan telah menyediakan ratusan API (Application Programming Interface). Untuk menulis dan mengedit kode sumber Java dapat menggunakan editor seperti Notepad++, Sublime Text, atau editor lainnya. Dapat menggunakan juga Java Development IDE untuk mengintegrasikan secara langsung kode sumber dengan hasil kompilasi dan output program.

Konsep objek dalam Java dapat dilihat pada benda-benda yang ditemukan dalam kehidupan sehari-hari, seperti mobil, motor, dan pesawat. Sebagai contoh, objek sepeda motor memiliki ciri-ciri, seperti warna hitam, kapasitas mesin 200 cc, transmisi manual dan dapat bergerak maju. Karakteristik atau keadaan objek tersebut jika diterapkan dalam penulisan program dideklarasikan sebagai field, sedangkan perilaku atau pekerjaan yang dilakukan dinyatakan dalam bentuk method-method.

Untuk membentuk objek class, ada tiga aspek yang wajib diperhatikan, yaitu:

1. **Deklarasi** — Penulisan atau pendefinisian jenis variabel dan objek yang akan digunakan.
2. **Instansiasi** — Dilakukan dengan menambahkan syntax `new`.
3. **Inisialisasi** — Dilakukan dengan menambahkan syntax `new` diikuti dengan nama constructor.

![2poin1](algoritma_files/2poin1.svg)

Proses Deklarasi Terbagi Menjadi 2 Macam:

1. **Deklarasi Package** — keyword `package` dapat disertakan untuk program berskala kompleks, yang berguna untuk mengelompokkan class-class dalam satu library. Package biasanya mereferensikan lokasi penyimpanan class. Pada bagian bawah baris tersebut, biasanya dideklarasikan import file library yang nanti digunakan.
2. **Deklarasi Class** — class mempresentasikan karakteristik objek lengkap dengan komponen variabel (data) dan method (perilaku), yang nantinya dieksekusi oleh Java dan diubah ke dalam bentuk biner yang dimengerti mesin komputer.

![2poin2](algoritma_files/2poin2.svg)

---

## 3. Tipe Data dan Variabel

### A. Tipe Data Primitive

Tipe data merupakan ketentuan alokasi nilai berdasarkan jangkauan atau range yang telah dideklarasikan sebelumnya. Tipe data sering kali disertakan dalam deklarasi variabel dan konstanta.

Tipe data primitive merupakan tipe data yang hanya menyimpan satu jenis tipe data dalam variabel:

- **Boolean** — mempunyai dua nilai, yaitu `true` (1) dan `false` (0). Secara default, nilai boolean dalam variabel akan diatur dengan nilai `false`.
- **Numeric** — adalah tipe data berupa bilangan dalam bentuk bulat (integer) atau pecahan (float).
- **Char** — mengandung nilai berupa karakter yang terdiri atas a…z, A…Z, dan beberapa symbol khusus. Tipe char merupakan karakter Unicode 16 bit dengan nilai minimum `'\u0000'` dan maksimum `'\uFFFF'`.

### B. Tipe Data Reference

Tipe data reference merupakan tipe data bentukan yang dapat mengalokasikan banyak nilai dalam tiap variabelnya. Tipe data bentukan didefinisi sendiri oleh programmer. Contoh tipe data ini adalah string, array, class, dan interface.

![3poinb1](algoritma_files/3poinb1.svg)

### C. Variabel dan Konstanta dalam Java

Variabel dan konstanta merupakan perintah dalam Java untuk menyimpan nilai data tertentu. Akan tetapi, konstanta hanya memiliki nilai data tetap dan tidak berubah, sedangkan variabel bisa menyimpan nilai yang bervariasi. Selain itu variabel bisa diinisialisasikan dulu, sedangkan konstanta harus diinisialisasikan di awal dan tidak dapat diubah dalam badan program.

Deklarasi variabel lokal dapat dilakukan dalam method, konstruktor dan blok program. Blok program lain tidak akan mengenali jenis variabel ini, kecuali telah dideklarasikan atau diinisiasi terlebih dahulu.

![3poinc1](algoritma_files/3poinc1.svg)

Variabel instance dideklarasikan dalam class, sebelum atau sesudah blok utama program (method main). Instance akan dikenali dan dapat digunakan dalam method, konstruktor dan blok utama program. Variabel instance memiliki ciri utama tipe data numerik memiliki nilai default adalah 0, Boolean adalah `false` dan referensi tipe objek adalah `null`.

![3poinc2](algoritma_files/3poinc2.svg)

Variabel static dideklarasikan dalam class dengan diawali keyword `static`. Nilai dalam variabel bersifat tetap atau dikenal juga sebagai konstanta, dengan ciri khas penggunaan keyword `final`. Variabel ini dideklarasikan di luar method, konstruktor atau blok program.

![3poinc3](algoritma_files/3poinc3.svg)

---

## 4. Mengolah Input Data Sederhana Melalui Keyboard

Dalam pemrograman Java, pengguna dapat menginputkan nilai ke dalam variabel melalui keyboard. Metode input ini biasa disebut user entry. Java menyediakan beberapa fitur untuk mengelola input, seperti class Scanner dan BufferedReader. Untuk menampilkan output-nya, dapat menggunakan fungsi `print()`, `println()`, dan `format()`.

Metode paling sederhana untuk membuat program yang dapat menerima input user adalah menggunakan class Scanner. Untuk menggunakannya, Anda perlu meng-import library terlebih dahulu:

![4poin1](algoritma_files/4poin1.svg)

Selanjutnya, buat objek yang akan menampung input:

![4poin2](algoritma_files/4poin2.svg)

Lalu, simpan data input tersebut ke dalam variabel:

#### 1. Data Input String

Ada dua perintah untuk mengambil data input dengan tipe data String:

![4poin3](algoritma_files/4poin3.svg)

Perintah tersebut akan memasukkan input yang muncul sebelum pembatas (secara default pembatasnya spasi).

![4poin4](algoritma_files/4poin4.svg)

Perintah tersebut akan memasukkan input sampai akhir baris.

#### 2. Data Input Int

![4poin5](algoritma_files/4poin5.svg)

Perintah tersebut akan memasukkan input dengan tipe data int. Untuk tipe data lain dapat menyesuaikan, seperti `nextDouble()`, `nextFloat()`, dan `nextBoolean()`.

![4poin6](algoritma_files/4poin6.svg)

---

## 5. Jenis Operasi Dalam Java

### A. Operasi Aritmetika

Operasi dasar ini dilakukan pada nilai bertipe data numerik. Contoh operasi aritmetika adalah penjumlahan, pengurangan, perkalian, dan pembagian.

![5poina1](algoritma_files/5poina1.svg)

### B. Operasi Relational

Operasi relasional merupakan operasi pembandingan antara dua nilai yang menghasilkan nilai data boolean (true atau false). Operasi ini sering digunakan untuk menyeleksi kondisi dalam struktur percabangan seperti if...else.

![5poinb1](algoritma_files/5poinb1.svg)

### C. Operasi Logika

Operator logika digunakan untuk membandingkan dua kondisi atau lebih dengan output nilai data bertipe boolean (true atau false).

![5poinc1](algoritma_files/5poinc1.svg)

### D. Operasi Penugasan

Operator penugasan dibuat untuk menyatakan hasil output operasi aritmetika ke dalam variabel dengan bentuk sederhana. Contohnya, `A += C` merupakan bentuk sederhana dari penulisan aritmetika `A = A + C`.

![5poind1](algoritma_files/5poind1.svg)

![5poind2](algoritma_files/5poind2.svg)

### E. Operasi Kondisional

Untuk menjalankan operator kondisional atau ternary, dibutuhkan tiga operan untuk memeriksa nilai data boolean dalam sebuah ekspresi, disertai penggunaan operator `?:`.

![5poine](algoritma_files/5poine.svg)

### F. Operasi Instanceof

Operator `instanceof` digunakan pada variabel dengan referensi objek untuk memeriksa tipe dari objek tersebut.

![5poinf1](algoritma_files/5poinf1.svg)

Nilai keluaran `true` akan dihasilkan jika objek yang direferensikan oleh variabel yang berada di sebelah kiri operator, termasuk kategori dari tipe data atau class yang berada di bagian kanan.

Java akan melakukan proses dalam rangkaian operasi aritmetika berdasarkan prioritas utama yang disebut preseden operator.

![5poinf3](algoritma_files/5poinf3.svg)

---

## 6. Struktur Kontrol Percabangan

### A. Percabangan if, if else, else if

#### a. Percabangan if

Untuk menyelesaikan sebuah kondisi apakah bernilai true atau false dapat menggunakan fungsi if. Jika kondisi benar, perintah dalam blok seleksi akan dieksekusi. Namun, jika kondisi salah, perintah akan dilewatkan.

**Format dalam Java:**

```
if (kondisi)
{
    //Pernyataan1;
    //Pernyataan2;
}
```

![6poina1](algoritma_files/6poina1.svg)

#### b. Percabangan if else

Percabangan if…else memiliki dua kemungkinan pernyataan, penentuan bergantung pada nilai kondisi yang diseleksi. Jika kondisi pernyataan yang dieksekusi bernilai `true`, program akan mengerjakan pernyataan 1. Namun jika kondisi bernilai `false`, program akan langsung mengeksekusi pernyataan 2.

**Format dalam Java:**

```
if (kondisi)
{
    //Pernyataan1;
}
else
{
    //Pernyataan2;
}
```

![6poina2](algoritma_files/6poina2.svg)

#### c. Percabangan dengan if…else if…else

Percabangan if...else if...else memiliki beberapa kondisi yang akan diseleksi. Jika kondisi 1 bernilai `true`, pernyataan 1 akan dieksekusi. Namun, jika kondisi 1 bernilai `false`, akan dilanjutkan memeriksa kondisi 2. Jika bernilai `true`, pernyataan 2 akan dieksekusi dan seterusnya. Jika semua seleksi kondisi bernilai `false`, program secara otomatis akan mengeksekusi pernyataan terakhir.

**Format dalam Java:**

```
if (kondisi)
{
    //Pernyataan1;
}
else if (kondisi)
{
    //Pernyataan2;
}
else
{
    //Pernyataan3;
}
```

![6poina3](algoritma_files/6poina3.svg)

### B. Percabangan Switch

Selain kontrol percabangan dengan if…else, Java juga mengenal metode percabangan dengan perintah `switch`:

```
switch (ekspresi)
{
    case nilai_data_ke_1:
        //perintah 1;
        break;
    case nilai_data_ke_2:
        //perintah 2;
        break;
    default: //optional
        //perintah 3;
}
```

Aturan penulisan Switch perlu memperhatikan hal-hal berikut ini:

1. Tipe data yang digunakan hanya boleh berupa `byte`, `short`, `int`, atau `char`.
2. Penulisan daftar pilihan nilai variabel dalam switch diawali keyword `case` diikuti dengan nilai yang dibandingkan dan diakhiri tanda titik dua (`:`).
3. Daftar nilai data variabel dalam case harus memiliki tipe data yang sama dengan variabel dalam switch.
4. Jika data yang dibandingkan dengan nilai data dalam case, akan dilanjutkan ke baris kode `break;` yang berarti proses eksekusi pembandingan dengan switch akan berhenti.
5. Jika tidak dilengkapi dengan baris kode `break;` pada setiap pilihan case, proses pembandingan data tetap akan dilakukan meski sudah memiliki nilai `true` dan perintah dalam case tersebut dieksekusi.

Statement switch mempunyai nilai case `default` yang ditulis pada akhir baris.

---

## 7. Struktur Kontrol Perulangan

Komputer mempunyai kemampuan dalam melakukan proses yang sama berulang-ulang hingga ratusan bahkan jutaan kali, tanpa kesalahan. Proses perulangan (looping) dapat diciptakan dengan membangun logika program menggunakan ekspresi kontrol perulangan.

**Ekspresi Kondisi** — Pernyataan sebuah kondisi bernilai boolean (true atau false), yang menjadi tolok ukur dimulai atau diakhirinya proses perulangan tersebut.

**Bagian Bodi Perulangan** — Terdiri atas runtunan perintah yang akan diulang hingga mencapai kondisi tertentu.

Dalam mendeskripsikan sebuah perulangan proses, perlu diperhatikan beberapa hal sebagai berikut:

- Pernyataan nilai awal sebuah ekspresi kondisi sebagai syarat berjalannya proses pada badan perulangan (bodi).
- Perintah untuk melakukan proses perulangan seperti `for`, `while`, dan `do…while`.
- Pernyataan terminasi, sebuah pernyataan untuk mengubah nilai awal menjadi nilai baru.

Terdapat dua jenis perulangan yang dikenal, yaitu:

1. **Unconditional looping** — Perulangan yang tidak menyertakan kondisi tertentu sebagai syarat terjadinya perulangan. Contohnya, struktur perulangan dengan `for`.
2. **Conditional looping** — Perulangan dengan syarat sebuah kondisi terpenuhi. Contohnya, struktur perulangan `while` dan `do...while`.

![7sebelumpoin](algoritma_files/7sebelumpoin.svg)

### A. Perulangan For

Perulangan for dilakukan sampai nilai kondisi tertentu terpenuhi, dengan blok inisialisasi awal, ekspresi boolean, dan iterasi berada pada satu baris.

**Format penulisan:**

```
for (inisialisasi_awal; ekspresi_Boolean; iterasi)
{
    //perintah;
}
```

Penjelasan:

1. **Inisialisasi awal** — nilai variabel awal yang akan dieksekusi oleh perulangan for. Sebagai contoh, `int i = 1;`.
2. **Ekspresi boolean** — bagian dalam perulangan yang akan memeriksa apakah variabel yang diinisialisasi telah memenuhi kondisi bernilai true. Sebagai contoh, `i >= 0;`.
3. **Iterasi** — Setelah melakukan perulangan, proses looping akan menambahkan nilai variabel inisialisasi awal pada bagian iterasi. Selanjutnya, nilai itu diperiksa kembali apakah memenuhi kondisi bernilai true atau tidak.

![7poina](algoritma_files/7poina.svg)

### B. Perulangan While

Perulangan while akan mengeksekusi blok perulangan selama kondisi bernilai `true` dan akan berhenti ketika kondisi bernilai `false`.

**Format penulisan:**

```
while (kondisi ekspresi Boolean)
{
    //perintah
    //iterasi variabel++;
}
```

![7poinb1](algoritma_files/7poinb1.svg)

Program tersebut akan mengatur nilai = 1 sebagai inisialisasi awal, kemudian ditambah 1 hingga nilai looping berakhir pada saat nilai = 5. Selama proses looping, program akan menampilkan pesan "Perulangan dengan While ke" serta nilai looping yang dijalankan.

![7poinb3](algoritma_files/7poinb3.svg)

### C. Perulangan do...While

Perulangan do...while akan mengeksekusi blok perulangan selama kondisi bernilai `true` dan akan berhenti ketika kondisi bernilai `false`.

**Format penulisan:**

```
do
{
    //perintah
}
while (kondisi)
```

![7poinc](algoritma_files/7poinc.svg)

---

## 8. Method dalam Java

### A. Definisi Method

Method merupakan sekumpulan perintah dalam badan program kecil yang dapat dipanggil dalam badan program lainnya. Deklarasi method memiliki kegunaan sebagai berikut:

1. Memudahkan programmer untuk membentuk dan memodifikasi fungsi sesuai kebutuhan tanpa mengganggu kerja fungsi lainnya.
2. Menata dan merapikan struktur kode program agar tidak semua dimasukkan dalam badan program utama.
3. Memudahkan distribusi tugas dalam bentuk modul.
4. Mengurangi penulisan kode menjadi panjang, karena hanya memanggil nama method dalam badan program.

### B. Membuat Method di Java

![8poinb](algoritma_files/8poinb.svg)

Contoh:

```java
public static int cekData(int a, int b)
{
    //statement;
}
```

Penjelasan:

1. **public static** — merupakan jenis modifier yang ditetapkan dalam method. Keyword `static` akan memudahkan method atau fungsi dipanggil dalam badan program, tanpa harus menginstansiasi objek terlebih dahulu.
2. **int** — merupakan tipe data yang akan dikembalikan ketika method dipanggil dalam program.
3. **cekData()** — merupakan nama method atau fungsi.
4. **int a, int b** — adalah tipe data parameter method atau fungsi.

Sebuah method dapat dideklarasikan dengan parameter masukan atau tanpa parameter masukan. Method tanpa parameter masukan tidak akan menghasilkan return value.

```java
public static void cetakHalo()
{
    System.out.println("ini contoh method tanpa parameter masukan");
}
```

### C. Memanggil Method

Setelah mendefinisikan method, Anda dapat memanggilnya dalam badan program utama (main) atau dalam fungsi lainnya. Untuk memanggil atau mengeksekusi method dalam badan program, nama method harus dituliskan beserta parameternya jika ada.

![8poinc](algoritma_files/8poinc.svg)

Program utama class tersebut akan memanggil method `tampilkanHello()`. Oleh karena method `tampilkanHello()` tidak memiliki parameter, pemanggilannya di program utama juga tidak perlu disertakan parameternya, cukup nama method-nya saja.

### D. Method dengan Parameter

Parameter merupakan variabel dalam method yang digunakan untuk menampung nilai yang dikirimkan oleh badan program, ketika memanggil method tersebut. Variabel tersebut kemudian akan diproses dalam method.

![8poind](algoritma_files/8poind.svg)

Program utama class tersebut akan memanggil method `tampilkanString()`. Method tersebut menampung nilai yang disimpan pada variabel String kalimat.

Selain String, parameter pada method dapat menampung tipe data lainnya, seperti int, double, float, dan boolean.

### E. Mendeklarasikan dan Memanggil Method non-Static

Pada kasus sebelumnya, setiap method yang didefinisikan menggunakan keyword `static` dapat dieksekusi dengan hanya memanggil nama method-nya saja. Sementara pada method non static (tanpa keyword `static`), ketika memanggilnya diperlukan instansiasi objek dari class tempat program berada.

![8poine](algoritma_files/8poine.svg)

Pada program tersebut, terdapat dua method. Method pertama adalah `sayHello()` yang bertipe static dan method kedua adalah `belajar()` yang bertipe non-static. Untuk memanggil method static `sayHello()`, hanya perlu menuliskan nama method beserta parameter yang ditampungnya. Sementara untuk memanggil method non-static `belajar()`, buat objeknya:

```java
BelajarMethod baru = new BelajarMethod()
```

Selanjutnya, panggil method `belajar()`:

```java
baru.belajar(ekstra);
```

### F. Overload Method

Overload method adalah metode yang dilakukan agar sebuah class dapat memiliki lebih dari satu method dengan nama yang sama, tetapi memiliki parameter dan tipe data yang berbeda.

---

## 9. Array

### A. Array Satu Dimensi

Variabel biasanya hanya menampung sebuah nilai. Dengan demikian, ketika akan mengoperasikan data dalam jumlah banyak, pasti akan membutuhkan variabel yang banyak juga. Untuk mengatasi hal tersebut, disediakan fungsi array atau larik yang mampu menyimpan data dalam urutan indeks.

![9poina](algoritma_files/9poina.svg)

Array menggunakan indeks untuk menentukan urutan elemen elemennya. Elemen pertama pada array dimulai pada indeks 0. Pada gambar sebelumnya, merupakan struktur sebuah array dengan data pada indeks ke-0 bernilai 36, indeks ke-1 bernilai 10, indeks ke-2 bernilai 6, indeks ke-3 bernilai 1, dan indeks ke-4 bernilai 7.

Jika elemen array adalah X, setiap elemen array ditulis dengan notasi:

**`X[0], X[1], X[2], X[3], X[4]`**

#### Format Deklarasi Array

Array mempunyai struktur dengan beragam jumlah elemen yang tetap atau static sehingga harus dideklarasikan pada awal program. Dalam pendeklarasian array, harus memperhatikan banyaknya elemen dalam array dan tipe data tiap elemen dalam array.

Format umum pendeklarasian array:

1. **Cara pertama (lebih dianjurkan):**

   ```java
   tipedata[] variabel_array;
   ```

   Contoh: `int[] iniArray;`

2. **Cara kedua (tidak dianjurkan):**

   ```java
   tipedata variabel_array[];
   ```

   Contoh: `int iniArray[];`

3. **Cara ketiga menggunakan kata kunci `new`:**
   ```java
   String[] user = new String[5];
   ```

#### Inisialisasi dan Akses Indeks Elemen Array

Inisialisasi adalah proses menyatakan atau memasukkan nilai data ke dalam indeks elemen array. Data yang dimasukkan ke dalam array dapat berupa numerik dan karakter.

Format syntax inisialisasi array:

1. **Data Numerik:**

   ```java
   x[0] = 10
   ```

   Syntax tersebut berarti array x dalam indeks ke-0 terdapat int bernilai 10.

2. **Data Karakter:**
   ```java
   x[1] = "andi novianto"
   ```
   Syntax tersebut berarti array x dalam indeks ke-1 terdapat string "andi novianto".

### B. Array Dua Dimensi

Array dua dimensi merupakan teknik penyimpanan data dengan setiap indeks elemen array utama memiliki subindeks lainnya. Dengan demikian, array dua dimensi juga dapat diartikan sebagai array di dalam array.

Format perintah untuk mendeklarasikan struktur array dua dimensi:

```java
tipedata variabel_array[][] = new tipedata[][]{{nilai}{nilai}}
```
$content$
  ),
  (
    'Sistem Komputer',
    'Pembahasan gerbang logika digital seperti OR, AND, NOT, NAND, NOR, XOR, dan XNOR beserta tabel kebenarannya.',
    1,
    array['informatika', 'sistem komputer', 'gerbang logika'],
    $content$# Sistem Komputer

---

## 1. Gerbang Logika

### A. Definisi Gerbang Logika

**Gerbang logika** adalah sebuah blok atau sirkuit (rangkaian dasar digital) yang berfungsi mengolah setiap input dan output data digital yang berupa 0 dan 1 (biner). Umumnya, gerbang logika dalam perencangan dan pembahasannya menggunakan simbol-simbol tertentu. Sebuah gerbang logika dapat menerima satu atau lebih input, tetapi hanya memiliki satu output. Output data yang dihasilkan hanya memiliki dua kemungkinan, yaitu high (1) atau low (0) bergantung pada level digital di terminal masukan.

Jenis output data yang dihasilkan sangat tergantung dari jenis input data dan gerbang logika itu sendiri, yang dapat digambarkan dengan "tabel kebenaran" (truth table). Tiga operasi dasar gerbang logika: OR, AND, NOT. Dapat dikembangkan lagi menjadi beberapa operasi, seperti NOT AND (NAND), NOT OR (NOR), Exclusive OR (XOR), dan Exclusive NOT OR (XNOR).

### B. Gerbang Logika OR

**Gerbang OR** dapat menerima dua atau lebih input data dengan satu output. Operasi logika OR akan menghasilkan potensial output tinggi (high) atau bernilai 1, jika ada salah satu dari input data yang berpotensi tinggi (high) atau bernilai 1. Contohnya, jika terdapat 2 input data A dan B, dengan X sebagai nilai output-nya, dapat dinyatakan sebagai berikut:

> **X = A OR B atau X = A + B**

Persamaan aljabar boolen dari gerbang logika OR dengan 2 input data dapat dilihat pada tabel kebenaran berikut.

![1poinb1](gerbang-logika_files/1poinb1_8Wbs.svg)

Pada pengoperasian gerbang logika OR akan dihasilkan nilai output true jika ada salah satu input data bernilai true atau berpotensial tinggi (high).

Jika pada gerbang logika OR terdapat tiga input data A, B, dan C dengan nilai ouput X, tabel kebenarannya yaitu sebagai berikut.

![1poinb2](gerbang-logika_files/1poinb2_8Wbs.svg)

### C. Gerbang Logika AND

**Gerbang logika AND** dapat menerima dua atau lebih nilai input dengan satu ouput. Nilai output true akan dihasilkan jika kedua nilai input bernilai true. Sebagai contoh, terdapat nilai input A dan B, nilai keluaran (output) X dapat dinyatan dengan rumus berikut.

> **X = A AND B atau X = A ∙ B atau X = AB**

Persamaan aljabar boolen dari gerbang logika AND dengan 2 input data dapat dilihat pada tabel kebenaran berikut. Simbol gerbang logika AND dengan dua nilai input:

![1poinc](gerbang-logika_files/1poinc_8Wbs.svg)

### D. Gerbang Logika NOT

**Gerbang logika NOT** atau inverter merupakan gerbang yang hanya bisa menerima satu nilai input dan menghasilkan satu output dengan nilai berlawanan dari nilai input-nya. Jika terdapat sebuah nilai input data A memasuki gerbang NOT, akan dihasilkan output X yang merupakan kebalikan dari A. Persamaannya dapat ditulis sebagai berikut.

> **X = NOT A atau X = Ā**

Tabel kebenaran dari gerbang logika NOT. Simbol gerbang logika NOT:

![1poind](gerbang-logika_files/1poind_8Wbs.svg)

Lakukan praktik untuk mendesain rangkaian gerbang logika NOT menggunakan aplikasi Logic Circuit Designer. Untuk penjelasan lebih lanjut mengenai operasi-operasi NOT AND (NAND), NOT OR (NOR), Exclusive OR (XOR), dan Exclusive NOT OR (XNOR), pindai QR code berikut.

![1poindqr](gerbang-logika_files/1poindqr_8Wbs.svg)

---

## 2. Mikrokontroler

### A. Definisi Mikrokontroler

**Mikrokontroler** adalah miniatur komputer dengan komponen memori, alat pemroses, dan disk penyimpanan data dalam proses pengolahan datanya. Mikrokontroler berasal dari kata micro yang berarti berukuran kecil dan controller yang merupakan alat pengontrol sebuah sistem. Mikrokontroler dapat didefinisikan sebagai alat pengontrol dengan ukuran kecil dan terintegrasi layaknya sebuah sistem computer dalam sebuah chip. Mikrokontroler dikatakan sebagai minicomputer karena memiliki bagian penting layaknya computer seperti Processor (CPU), RAM (Random Access Memory), ROM (Read Only Memory), dan Port I/O (input output).

**Keuntungan Mikrokontroler :**

1. Bentuknya yang kecil dan praktis memudahkan perancangan dan pemasangan pada rangkaian elektronika
2. Kemudahan mengubah fungsi dan alur logika program mikrokontroler
3. Sistem rangkaian elektronika lebih efisien
4. Tidak membutuhkan daya listrik yang besar
5. Proses pencarian kerusakan atau gangguan fungsi rangkaian akan lebih mudah

**Arsitektur Mikrokontroler :**

1. **Arsitektur CISC** (Complex Instruction Set Computer) memiliki fitur lengkap dan kompleks dalam memberikan set instruksi pada processor. Arsitektur ini menggunakan Bahasa tingkat rendah seperti Assembler.
2. **Arsitektur RISC** (Reduce Instruction Set Computer) mempunyai ragam set instruksi yang lebih sederhana dibandingkan dengan CISC. Arsitektur ini sudah mendukung penggunaan bahasa tingkat tinggi, seperti Bahasa pemrograman C.

### B. Arsitektur ATmega328P

**ATmega328P** merupakan salah satu mikrokontroler keluaran ATMEL yang menggunakan arsitektur RISC (Reduce Instruction Set Computer) dengan kelebihan eksekusi data yang lebih baik dibandingkan dengan arsitektur CISC.

**Spesifikasi ATmega328P :**

1. Berkinerja tinggi dengan kebutuhan tegangan kecil
2. Mendukung 131 set instruksi dalam siklus clock
3. Mampu bekerja dengan speed 20 MIPS pada detak clock 20 MHz
4. Memiliki 32×8 General Purpose Working Registers
5. Menggunakan jenis EEPROM berkapasitas 1 kb, dapat menyimpan data meskipun tidak tersuplai arus listrik
6. Memiliki flash memori 32 KB
7. Mempunyai 28 pin input-output, dengan 6 di antaranya pin bertipe pulse width modulation output
8. Memiliki memori bertipe SRAM berkapasitas 2 KB
9. Memiliki interface master/slave SPI Serial
10. 8 kanal 10 bit ADC dalam paket TQFP dan QFN/MLF
11. 6 kanal 10 bit ADC dalam paket PDIP
12. Memiliki fitur Power-on serta Reset and Programmable Brown-out Detection
13. Bekerja pada tegangan 1,8–5,5 Volt
14. Mampu bertahan pada suhu antara -40 °C sampai 85 °C

**Kelompok Pin ATmega328P :**

1. VCC berfungsi sebagai pin input sumber tegangan
2. GND (Ground) berfungsi sebagai pin grounding atau massa (negative)
3. Port B adalah port-input tipe 8 bit yang bekerja dua arah. Fungsinya bergantung jenis port.
4. Port C (PC5:0) adalah port-input tipe 7 bit yang bekerja dua arah. Port ini dapat digunakan sebagai ADC Input Channel dan 2-wire Serial Bus Data Input/Output Line.
5. Port D (PD7:0) adalah port-input tipe 8 bit dua arah yang sering digunakan untuk analog comparator, external interruption, dan USART communication.
6. AVCC adalah pin sambungan sumber tegangan menuju A/D Converter, port PC3:0, dan ADC7:6
7. AREF adalah pin input sumber tegangan referensi A/D Converter
8. ADC7:6 (TQFP and QFN/MLF Package Only), pada sistem paket TQFP and QFN/MLF, port ini melayani input analog menuju A/D Converter

### C. Arduino

**Arduino** adalah rangkaian elektronika berbasis mikrokontroler Atmega328P keluaran Atmel. Nama lain Arduino adalah development board atau papan pengembangan mikrokontroler yang memudahkan pengguna dalam membangun rangkaian elektronika berbasis mikrokontroler dibandingkan dengan membangun rangkaian mulai dari awal. Arduino Uno R3 adalah jenis Arduino yang bersifat open source hardware yang memungkinkan orang lain mengembangkan sesuai kebutuhan mereka.

**Spesifikasi Hardware Arduino Uno R3 :**

1. Berbasis chip mikrokontroler ATmega328P
2. Beroperasi pada tegangan DC 5 V
3. Input tegangan DC adalah 7–12 V
4. Terdiri atas 14 digital I/O pin, dengan 6 pin di antaranya merupakan sambungan PWM
5. Memiliki 6 pin input analog
6. Besar arus setiap pin I/O adalah 20 mA
7. Kapasitas SRAM adalah 2 KB
8. Ukuran EEPROM adalah 1 KB
9. Mampu bekerja pada clock speed 16 MHz
10. Dijual di pasaran dengan dimensi 68,6 mm × 53,4 mm dengan berat 25 g
11. Besar arus DC pin pada tegangan 3,3 V adalah 50 mA
12. Kapasitas memori flash adalah 32 KB dengan 0,5 KB untuk bootloader program

**Bagian-Bagian Board Arduino :**

1. Port USB, memberikan catu daya dari komputer ke Arduino Ketika me-load atau memasukkan ke mikrokontroler
2. Jack Adaptor tegangan DC, sambungan input sumber tegangan DC berupa jack, biasanya dari adaptor ataupun baterai
3. Tombol Reset, mereset board Arduino sehingga setiap data program yang pernah di-load ke dalam board dan mikrokontroler akan dihapus atau dikosongkan
4. Pin Digital, sebagai port input atau output yang penggunaannya dapat dilakukan oleh program fungsi digitalWrite(), digitalRead(), dan pinMode(). Macam-macam pin digital antara lain Pin 0 (RX); Pin 2 dan 3; Pin 3, 5, 6, 9, 10, dan 11; Pin 10 (SS), 11 (MOSI), 12 (MISO), dan 13 (SCK); serta LED dekat pin 13
5. Ground, sambungan ke ground tegangan
6. AREF, sebagai pin preferensi input tegangan analog yang dapat diatur melalui fungsi program analogReference()
7. Pin Power, terdiri atas Pin VIN sebagai sumber tegangan peralatan yang akan dikontrol, Pin 5V sebagai keluaran tegangan maksimal 5 volt yang otomatis diatur regulator board Arduino, Pin 3v3 sebagai pin sumber tegangan sebesar 3,3 volt yang dikeluarkan regulator board Arduino dengan nilai arus listrik maksimal 50 mA, dan GND sebagai pin untuk jalur sambungan grounding Arduino.
8. Pin Analog, terdiri atas enam pin dengan urutan A0 sampai A5, deretan pin ini digunakan untuk mendeteksi dan mengonversi setiap tegangan yang dihasilkan sensor analog.
9. ICSP atau In-Circuit Serial Programming, deretan pin yang memberikan fasilitas bagi user untuk melakukan pemrograman secara langsung tanpa melalui bootloader Arduino.

### D. Pemrograman Mikrokontroler pada Arduino

Sebelum melakukan pemrograman mikrokontroler, perlu ditinjau kembali mengenai konsep dan cara kerja penulisan kode program Arduino. Bahasa yang digunakan pada Arduino adalah Bahasa C. Anda dapat memindai kode QR di bawah ini.

![2poindqr](gerbang-logika_files/2poindqr_8Wbs.svg)

### E. Aplikasi Arduino Sederhana

Setelah mempelajari karakteristik mikrokontroler ATmega328P dan bagian-bagian Arduino serta bagaimana melakukan pemrogramannya, tahap selanjutnya adalah menerapkan pengontrolan rangkaian elektronika menggunakan mikrokontroler. Anda dapat memindai kode QR di bawah ini.

![2poineqr](gerbang-logika_files/2poineqr_8Wbs.svg)

---

## 3. Organisasi dan Arsitektur Komputer

### A. Konsep Organisasi Komputer

**Organisasi komputer** yaitu sebagai keterkaitan setiap bagian-bagian dalam komputer, baik unit-unit operasional yang mendukung proses compute maupun proses interkoneksi antarkomponen penyusun sistem komputer dalam menjalankan fungsinya. Jadi, konsep cara komponen-komponen hardware dalam komputer itu bekerja secara terintegrasi sebagai kesatuan komputer.

Sebuah sistem komputer dapat bekerja dengan baik jika memiliki tiga komponen penting, yaitu **hardware**, **software**, dan **brainware**. Hardware berfungsi sebagai peranti keras (elektronika) yang melakukan proses digital, software berfungsi sebagai piranti lunak untuk mengatur dan mengelola hardware, sedangkan brainware berperan dalam memberikan dan mengendalikan setiap input dan output dari hardware melalui software yang terpasang.

### B. Fungsi dan Sistem Komputer

**Beberapa dari fungsi komputer :**

1. Melakukan pengolahan data (data processing)
2. Melakukan penyimpanan data (data storage)
3. Melakukan pemindahan data (data movement)
4. Melakukan operasi kontrol

**Hardware komputer dalam melakukan prosesnya terdiri atas beberapa bagian, yaitu :**

a. CPU, berfungsi sebagai pusat pengolah data.
b. Memori, bertugas melakukan penyimpanan data.
c. Perangkat input dan output, berfungsi menjembatani proses masukan dan keluarkan data.

### C. Arsitektur Komputer

![3poinb](gerbang-logika_files/3poinb_8Wbs.svg)

**Arsitektur Komputer**, Ilmu yang membahas atribut sistem yang dirancang oleh programmer untuk mendapatkan hasil kerja yang optimal terhadap kinerja sebuah komputer. Sebagai contoh, dalam melakukan beberapa set instruksi, metode pengalamatan, teknik input-output, dan operasi matematika. Sebagai sebuah mesin multilevel, arsitektur komputer dapat diartikan sebagai sebuah komunikasi antara user (programmer) dan mesin melalui bahasa pemograman dengan mesin komputer.

**Level logika mesin komputer :**

1. Level ke-0, Pada level ke-0, struktur mesin komputer dianggap sebagai dasar yang berhubungan dengan rekayasa digital. Pada level ini digunakan bahasa tingkat mesin yang dapat dijalankan secara langsung tanpa memerlukan penerjemah.
2. Level ke-1, Pada level ke-1, bahasa mesin yang dijalankan oleh pengguna memerlukan interpreter untuk menerjemahkannya ke dalam bahasa yang dimengerti mesin.
3. Level ke-2 hingga ke-n, Pada level ke-2 hingga ke-n, bahasa pemrograman yang dijalankan pada mesin memerlukan interpreter untuk mengubah perintah ke dalam bahasan mesin agar dapat dieksekusi oleh mesin komputer.

**Pembagian arsitektur komputer berdasarkan level diawali pada era tahun 1940 yang dibagi menjadi dua level :**

1. Level ISA (Instruction Set Architecture)
2. Level Digital Logic

**Kemudian diperbaiki menjadi tiga level pada tahun 1951 oleh Maurice Wilkes:**

1. Level ISA (Instruction Set Architecture)
2. Level Interpreter
3. Level Digital Logic

**Tiga level arsitektur yang diuraikan lebih lanjut akan membagi komputer menjadi mesin enam level:**

1. Level 0 atau Level Logika Digital
2. Level 1 atau Level Arsitektur Mikro
3. Level 2 atau Level Arsitektur Perangkat Instruksi
4. Level 3 atau Level Sistem Operasi
5. Level 4 atau Level Bahasa Assembler (bahasa rakitan)
6. Level 5 atau Level Bahasa Tingkat Tinggi

---

## 4. Perangkat Keras Komputer

### A. Definisi Perangkat Keras

**Perangkat keras** adalah semua jenis peranti atau perangkat pada komputer yang dapat dilihat secara fisik oleh pengguna. Perangkat ini berfungsi menghubungkan interaksi pengguna dengan sistem komputer. Perangkat keras terbagi menjadi dua yakni, perangkat keras internal dan perangkat keras eksternal.

### B. Perangkat Keras Internal

![4poinb](gerbang-logika_files/4poinb_8Wbs.svg)

**Perangkat keras internal** adalah perangkat keras yang dipasangkan di dalam koneksi internal mainboard. Berikut adalah contoh dari beberapa perangkat keras internal.

1. **MainBoard**, Mainboard atau papan utama komputer merupakan rangkaian elektronik yang bertugas sebagai penyedia jalur data bagi setiap komponen yang terhubung pada komputer, seperti CPU, hard disk, DVD drive, port USB, dan port VGA.
2. **CPU (Central Processing Unit)**, CPU atau processor adalah komponen inti dalam komputer. Komponen ini merupakan tempat semua proses pengolahan data akan dikerjakan.
3. **Memori**, Memori bertugas untuk menyimpan semua instruksi sebelum dikerjakan dalam CPU dan setiap data yang akan diproses atau yang dihasilkan oleh CPU. Ada dua jenis memori utama, yaitu ROM dan RAM.
4. **Power Supply**, Power supply berfungsi menyuplai aliran listrik ke mainboard dan beberapa perangkat keras lainnya yang terpasang pada mainboard. Komponen ini bekerja dengan cara mengonversi tegangan AC menjadi DC yang sekaligus menjadi pembangkit tegangan dan pengatur kestabilan arus listrik yang dialirkan ke komponen-komponen.

### C. Perangkat Keras Eksternal

**Perangkat keras eksternal** adalah perangkat keras yang dipasangkan di luar koneksi internal mainboard. Perangkat ini terhubung melalui interkoneksi bus sebagai pengolah data keluaran dari CPU. Tipe perangkat eksternal dapat dibagi menjadi tiga, yaitu sebagai berikut.

1. **Machine Readable**, Machine Readable merupakan perangkat eksternal yang berperan sebagai perangkat input/output yang menghubungkan perangkat lain dengan komputer dan sebaliknya.
2. **Human Readable**, Human Readable merupakan perangkat eksternal yang bertugas sebagai interface atau antarmuka yang menghubungkan interaksi antara manusia dan komputer.
3. **Communications**, Communications merupakan perangkat eksternal yang berfungsi sebagai pendukung dan sistem komunikasi jarak jauh.

Perangkat eksternal dapat diklasifikasikan dalam tiga jenis berdasarkan dari cara kerjanya, yaitu perangkat input (input device), perangkat output (output device), dan perangkat input/output (input/output device).

**1. Port Input/Output**, Agar dapat bekerja sesuai fungsinya, perangkat eksternal harus dihubungkan dengan processor. Perangkat eksternal akan dihubungkan melalui port-port input/ouput yang berada pada bagian mainboard.

**Jenis Port :**
a. Port secara fisik
b. Port secara logika sebagai layanan service

**Tipe Port :**
a. Port USB (Universal Serial Bus)
b. Port serial
c. Port Ethernet atau modem

**2. Perangkat Masukan (Input Device)**, Perangkat yang berfungsi menerima masukan atau instruksi dari luar komputer. Instruksi tersebut kemudian diteruskan ke CPU untuk diproses lebih lanjut. Data yang menjadi masukan tersebut berupa karakter, gambar, audio, dan video.

**Jenis Perangkat Masukan :**
a. Perangkat masukan pengetikan, contoh: keyboard.
b. Perangkat masukan penunjuk (pointer), contoh: mouse, trackball, touchpad.

**3. Perangkat Keluaran (Output Device)**, Perangkat keras keluaran adalah perangkat yang berfungsi menampilkan data dalam bentuk audio, tampilan grafis, dan hasil cetak. Beberapa perangkat keluaran yang sering digunakan, antara lain monitor, speaker, printer, dan plotter.

![4poinc1](gerbang-logika_files/4poinc1_8Wbs.svg)

1. **Monitor** adalah perangkat yang berfungsi menampilkan hasil pemrosesan data atau informasi dalam bentuk teks, gambar, dan video. CRT: generasi monitor awal yang memiliki bentuk besar, berat, dan bercirikan tabung besar pada bagian belakangnya. LCD: monitor dengan layar tipis dan bentuk yang ramping.
2. Perangkat yang berfungsi mengubah sinyal digital menjadi sinyal analog dalam bentuk suara.
3. Perangkat yang menghasilkan keluaran berupa cetakan pada media tertentu, seperti kertas, film, dan kain. Berdasarkan teknologi cetaknya, printer dapat dibedakan menjadi printer dot matrix, printer inkjet, dan printer laser jet.
4. Salah satu jenis printer yang dapat mencetak pada media berukuran besar. Perangkat ini banyak digunakan pada bidang periklanan untuk mencetak baliho atau spanduk.

**4. Perangkat Penyimpanan (Storage Device)**, Perangkat penyimpanan adalah perangkat yang digunakan untuk menyimpan data.

![4poinc2](gerbang-logika_files/4poinc2_8Wbs.svg)

1. **Hard disk**, Perangkat penyimpanan yang memanfaatkan piringan magnetis sebagai sarana penyimpanan data. Komponen penyusun hard disk adalah platter, spindle, head, dan logic board.
2. **USB flash disk**, Media penyimpanan data berukuran mini dengan inti memori flash dan port antarmuka USB (Universal Serial Bus). Perangkat ini mampu melakukan proses read and write data hingga ribuan kali dan memiliki kapasitas penyimpanan yang tinggi. Dengan ukurannya yang kecil dan ringan, perangkat ini mudah dibawa. Seiring berkembangnya waktu, flash disk mengalami perkembangannya.
3. **Disk Drive**, Perangkat yang dapat membaca data dalam piringan data (disk), seperti CD dan DVD. Terdapat dua jenis drive yang dapat digunakan, yaitu ROM dan RW. ROM (Read Only Memory) merupakan jenis disk drive yang hanya dapat membaca data yang tersimpan pada piringan disk data. Adapun RW (Read Write) adalah jenis disk drive yang mampu membaca dan menulis data pada disk.

**Perangkat Input/Output**, Perangkat input/output adalah perangkat yang dapat menerima masukan data dari perangkat lain untuk diteruskan ke CPU, serta meneruskan data dari CPU menuju perangkat lain dalam jaringan, yang dilakukan secara bersamaan dalam satu waktu secara dua arah (bolak-balik/full duplex).

**Contoh Perangkat Input/Output :**
a. NIC (Network Interface Card)
b. Modem atau Modulator Demodulator

#### NIC (Network Interface Card)

**NIC** adalah kartu jaringan internal yang dipasang pada slot bus mainboard dengan tip slot tertentu, seperti ISA, PCI, Mini PCI, atau PCI Express. Perangkat ini berfungsi mengkoneksi komputer dengan komputer lainnya yang tersambung dalam jaringan yang sama menggunakan media transmisi tertentu.

![4poinc3](gerbang-logika_files/4poinc3_8Wbs.svg)

#### Modem atau Modulator Demodulator

Berdasarkan model koneksinya, modem dibedakan menjadi dua jenis, yaitu model internal dan modem eksternal. Fungsi utama modem adalah menghubungkan komputer dengan jaringan internet. Modem internal umumnya hanya dapat melayani sambungan internet dengan media kabel, sedangkan modem eksternal lebih bervariasi dalam hal media transmisinya.

![4poinc4](gerbang-logika_files/4poinc4_8Wbs.svg)

---

## 5. Teknik Grafis Video Editing

### A. Teknologi Sistem Operasi

![5poina](gerbang-logika_files/5poina_8Wbs.svg)

**Sistem operasi** atau operating system (OS) berfungsi menginterupsi dan mengontrol perangkat keras komputer berdasarkan input yang diberikan pengguna.

**Bagian utama sistem operasi :**

1. **Kernel**, Core atau inti OS yang bertugas untuk mengelola dan memanajemen hardware. Selain itu, menjadi interface terhadap aplikasi dalam OS untuk memberikan instruksi dan menjalankan proses pada setiap hardware yang terhubung.
2. **Aplikasi**, Aplikasi berperan sebagai interface yang menghubungkan interaksi antara manusia dan mesin. Contoh perintah yang disampaikan manusia melalui aplikasi, seperti mencetak angka dan menampilkan grafik pada layar monitor.

Aplikasi dasar dalam sistem operasi biasanya berbasis perintah tunggal atau command line. Contohnya, shell pada Linux atau Unix dan command prompt pada OS Windows.

![5poina2](gerbang-logika_files/5poina2_8Wbs.svg)

Sistem operasi membutuhkan serangkaian proses sampai akhirnya siap digunakan. Proses ini dimulai sejak komputer dalam keadaan mati, kemudian dilakukan proses booting hingga dapat dioperasikan oleh penggunanya. Tahapan proses booting pada sistem operasi Linux, yaitu sebagai berikut.

![5poina3](gerbang-logika_files/5poina3_8Wbs.svg)

**Jenis proses booting :**

1. **Cold Boot**, Cold boot adalah proses booting yang dimulai dari komputer dalam kondisi mati, kemudian, tombol power ditekan dan aliran listrik mengalir ke sistem komputer.
2. **Warm Boot**, Warm boot adalah proses booting komputer yang dilakukan ketika dalam kondisi hidup. Biasanya dengan menekan tombol reset atau kombinasi tombol keyboard Alt + Del.

### B. Master Boot Record (MBR)

**MBR** atau sektor 0 merupakan lokasi media penyimpanan berukuran 512 Byte yang terdiri atas tiga bagian, yaitu :

1. **Bootstrap Code Area (Bootloader)**, Bagian ini digunakan untuk menyimpan image bootloader yang akan di-load oleh BIOS ke memori utama. Area ini berukuran 446 Byte dan terletak pada alamat offset 0-446.
2. **Partition Information**, Ukuran tabel informasi partisi setiap media penyimpanan MBR adalah 64 Byte. Fungsi utamanya adalah menyimpan informasi tentang jumlah, ukuran, dan format partisinya.
3. **Boot Record Signature (Magic Number)**, Bagian ini berukuran 2 Byte dengan offset 511 sampai 512 dan digunakan untuk menyimpan Boot Record Signature. Boot Record Signature merupakan kode unik sebagai tanda pengenal sebuah file, yang diletakan pada awal file atau akhir file.

**Peran penting MBR dalam berjalannya sistem operasi :**

a. Sebagai penanda sektor 0 dari partisi disk yang aktif guna menentukan boot sector disk.
b. Memberikan informasi tentang skema partisi yang terbentuk dalam sebuah disk.
c. Me-load salinan boot sector sebuah partisi yang aktif ke dalam memori.
d. Menunjukkan lokasi kode bootloader pada sistem agar dapat dieksekusi ketika sistem operasi melakukan proses booting.

Kerusakan pada MBR akan menyebabkan disk tidak dapat menemukan bootloader, yang berakibat sistem operasi tidak dapat booting. Jika kerusakannya permanen, seperti bad sector akan menyebabkan disk tersebut tidak dapat digunakan sebagai partisi aktif tempat menyimpan MBR atau bootloader.

Untuk melakukan eksperimen dan penelitian disk penyimpanan, dapat menggunakan aplikasi WinHex Editor. Untuk mempelajari pengaturan bootloader MBR hard disk dengan WinHex Editor, pindai QR code berikut.

![5poinbqr](gerbang-logika_files/5poinbqr_8Wbs.svg)

### C. Instalasi Windows 10

Windows 10 dirilis pada tahun 2014 dengan pengembangan versi terbarunya, yaitu Windows 11 yang dirilis Oktober 2021. Windows memiliki kemampuan yang tinggi untuk mendukung kinerja hardware dan processor, aplikasi perkantoran, aplikasi permainan hingga bahasa pemrograman.

**Beberapa versi Windows 10 yang dipilih :**

a. Windows 10 Home
b. Windows 10 Pro
c. Windows 10 Enterprise
d. Windows 10 Education
e. Windows 10 Mobile
f. Windows 10 IoT Core

### D. Partisi Hard Disk

**Hard disk** adalah media penyimpanan yang sering digunakan untuk mengorganisasikan dan mengalokasikan data yang harus dapat diakses oleh memori komputer setiap saat. Hard disk dapat dikatakan sebagai cakram atau disk yang dapat menyimpan data magnetik yang sudah terpolarisasi.

![5poind](gerbang-logika_files/5poind_8Wbs.svg)

1. **Track**, merupakan lintasan data magnetik dalam disk yang dimulai track ke-0 hingga ke-n tergantung jenis hard disk.
2. **Sektor**, merupakan area pembentuk track dengan kapasitas tertentu tergantung jenis hard disk, mulai dari kapasitas 512 Byte hingga 5.122 Byte.
3. **Boot area**, merupakan area sektor 0 pada track pertama dalam disk, yang berfungsi sebagai wilayah booting disk yang mengandung bootstrap area.
4. **Cluster**, merupakan kumpulan 1 hingga 128 sektor yang berperan dalam mengatur penyimpanan data sehingga memudahkan sistem operasi dalam mengakses data tersebut.

### E. Mengonfigurasi Driver Hardware

**Driver** merupakan software yang berfungsi menerjemahkan komunikasi data antara perangkat keras (hardware) dengan setiap instruksi yang dikirimkan oleh CPU melalui aplikasi dalam setiap operasi. Contoh driver adalah driver printer yang harus diinstal terlebih dahulu, sebelum dapat mencetak dokumen yang dibuat dengan Microsoft Word.

### F. Software Aplikasi

**Software** atau peranti lunak merupakan kumpulan subrutin yang ditulis berdasarkan aturan penulisan bahasa pemrograman tertentu, agar dapat dimengerti dan mudah dieksekusi oleh processor. File kompilasi tersebut dikemas dalam image dengan bahasa mesin (machine code level) sesuai platform OS yang digunakan. Contohnya, software Microsoft Office yang dibuat berbasis bahasa pemrograman Visual Basic hanya dapat digunakan pada OS Windows.
$content$
  ),
  (
    'Dampak Sosial Informatika',
    'Analisis perkembangan teknologi komputer, kewargaan digital, serta dampak positif dan negatifnya terhadap masyarakat.',
    1,
    array['informatika', 'dampak sosial', 'kewargaan digital'],
    $content$# Dampak Sosial Informatika

---

## 1. Perkembangan Teknologi Komputer

Perkembangan teknologi komputer berawal dari kemunculan mesin kalkulator yang diprogram untuk melakukan perhitungan. Namun dalam perkembangannya, perhitungan sudah menggunakan alat bantu berupa mesin untuk mempercepat prosesnya sehingga lebih efisien, ringkas, dan cepat. Komputer yang awalnya hanya berfungsi sebagai alat hitung kemudian berkembang menjadi suatu mesin yang memiliki beragam fungsi.

![7poina](dampak-sosial_files/7poina.svg)

---

## 2. Kewargaan Digital

Konsep komunikasi dan interaksi secara langsung berkembang dalam ranah digital, yang memungkinkan para pengguna saling berkomunikasi secara tidak langsung tanpa terbatas waktu dan jarak. Dengan melakukan komunikasi dalam sebuah hubungan, diharapkan memberikan manfaat seperti berikut:

1. Sebagai wujud ide atau gagasan yang disampaikan melalui media tertentu kepada orang lain.
2. Membentuk sebuah komunitas dengan kesamaan visi, misi, persepsi, serta tujuan.
3. Terciptanya aliran informasi yang dapat diakses dengan baik.
4. Melalui komunikasi, akan menambah pengetahuan secara baik.

Berdasarkan cara penyampaiannya, model komunikasi dibedakan menjadi tiga:

1. Komunikasi yang dilakukan secara direct atau langsung dengan bertatap muka.
2. Komunikasi yang dilakukan melalui media komunikasi digital.
3. Komunikasi yang dilakukan secara indirect atau tidak langsung melalui media dan perangkat bantuan.

Syarat model komunikasi melalui komunitas digital yang mutlak:

a. Terdapat pengirim data dan penerima data.
b. Memiliki data atau informasi yang ditransmisikan.
c. Para pengguna dalam komunikasi digital tersebut telah mampu menggunakan teknologi komunikasi yang diterapkan.
d. Memiliki perangkat keras digital yang digunakan sebagai sarana dan prasarana melakukan komunikasi tersebut.
e. Adanya sambungan internet yang menghubungkan antara pengguna satu dengan yang lainnya.

Konsep warga digital merujuk pada pengguna teknologi digital yang mampu memanfaatkan teknologi informasi untuk berkomunikasi dalam dunia maya dengan mengedepankan norma dan etika yang baik. Kategori warga digital dari tindakannya dapat dibedakan menjadi dua jenis:

**+ Memberikan dampak positif bagi orang lain:**

Ciri warga digital dalam pergaulannya di dunia komunikasi digital dengan etika yang baik adalah selalu memperhatikan norma perilaku yang tepat dan bertanggung jawab pada saat menggunakan teknologi. Contohnya, menulis tutorial instalasi Linux atau membuat animasi yang dibagikan melalui YouTube.

**- Menimbulkan efek negatif:**

Aktivitas komunikasi digital yang bebas, tidak memandang usia, jenis kelamin, asal daerah, atau negara sangat rentan dimanfaatkan oleh orang-orang yang tidak bertanggung jawab. Kecenderungan utama dari tindakan ini adalah mencari keuntungan pribadi tanpa memikirkan efek dari kegiatan tersebut. Contohnya, membuat virus, menyebarkan spam, serta meretas dan mencuri kartu kredit.

Untuk menjadi bagian sebuah komunitas digital, harus mempelajari komponen kewargaan digital berikut:

a. Digital Right & Responsibility
b. Digital Health & Wellness
c. Digital Security
d. Digital Etiquette
e. Digital Access
f. Digital Commerce
g. Digital Communication
h. Digital Literacy
i. Digital Law

Dari sembilan komponen penting kewargaan digital tersebut, dapat diklasifikasikan menjadi tiga kategori terkait keberadaan peserta didik sebagai representasi warga digital dalam lingkungan digital:

a. **Lingkungan Luar Sekolah**

- Digital Commerce
- Digital Law
- Digital Health & Wellness

b. **Lingkungan Sekolah**

- Digital Security
- Digital Etiquette
- Digital Right & Responsibility

c. **Lingkungan Belajar**

- Digital Literacy
- Digital Communication
- Digital Access

---

## 3. Dampak Positif dan Negatif Teknologi Informasi

**Efek Positif dari Teknologi Informasi:**

- Meningkatkan produktivitas kerja.
- Meningkatkan interaksi sosial antarpengguna tanpa terbatas jarak dan waktu.
- Memengaruhi pola hidup dan pola usaha.
- Menambah potensi lapangan pekerjaan.

**Potensi Ancaman dari Teknologi Informasi:**

- Radiasi gelombang elektromagnetik yang berefek buruk terhadap kesehatan mata, telinga, dan otak.
- Kejahatan siber, seperti pencurian data e-mail, peretasan akun m-banking, akun sosial media dan ransomware.
- Pelecehan (cyberharassment) dan cyberbullying.
- Frauding atau penipuan dan carding.

Beberapa tipe intimidasi yang dapat dijumpai dalam hubungan sosial kemasyarakatan:

- **Intimidasi bersifat fisik** — Tindak represif yang cenderung berupa kontak fisik yang berpotensi menimbulkan luka, seperti menendang dan memukul.
- **Intimidasi bersifat sosial** — Perbuatan yang dilakukan dapat mengakibatkan kredibilitas atau nama baik seseorang tercemar. Dampaknya, moral dan kondisi psikis korban menjadi drop.
- **Intimidasi secara verbal** — Jenis perundungan yang dilakukan melalui pembicaraan, seperti penekanan, penghasutan, atau pengucapan kata tidak pantas kepada orang lain.
- **Cyberbullying** — Intimidasi untuk menjatuhkan moral dan psikis lain melalui media internet dalam bentuk video, suara, teks, dan gambar. Contohnya, penyebaran hoaks.

Langkah preventif yang dapat dipersiapkan untuk mengantisipasi dampak negatif perkembangan digital dapat diklasifikasikan menjadi dua macam:

a. **Bidang Teknologi Informasi:**

- Rutin meng-upgrade OS aplikasi pendukungnya seperti antivirus, antispam, dan web browser.
- Menerapkan kombinasi password yang aman, seperti gabungan karakter, numerik, dan beberapa karakter khusus dengan panjang minimal 8 karakter.
- Aktivasi dan update sistem firewall.
- Tidak sembarangan terhubung dengan wi-fi gratis.
- Tidak mengakses konten situs terlarang yang rentan malware.
- Tidak memberikan informasi data pribadi serta akun sosial media, password perangkat digital, dan waspada phishing melalui e-mail.

b. **Perbaikan Kualitas Sumber Daya Manusia:**

- Memupuk rasa sosial dengan mengedepankan sikap tenggang rasa dan saling menghormati.
- Tidak mengunggah data atau informasi pribadi diri sendiri ataupun orang lain ke media sosial.
- Mengatur setting pertemanan, privasi, dan informasi publik dalam media sosial.
- Menghindari diskusi atau perdebatan yang berpotensi permusuhan.
- Memblokir konten atau pengguna yang berpotensi menimbulkan permusuhan.
- Unfollow grup yang menyebarkan kebencian.
- Meningkatkan pemahaman tentang UU ITE dan menghormati hak cipta.
- Hindari plagiarisme ketika menulis informasi di internet.

Etika dalam melakukan komunikasi dan unggahan data ke ranah publik seperti media sosial sebaiknya berpedoman pada **F.A.K.T.A.**:

- **F** Aktual — Unggahan data sesuai kenyataan, orisinal, dan bukan hoaks.
- **A** sli — Informasi yang disampaikan hendaknya asli, bukan editan yang berpotensi menimbulkan kesalahpahaman.
- **K** esantunan — Informasi yang disampaikan menggunakan tata bahasa yang sopan dan tidak menyinggung orang lain.
- **T** enggang rasa — Saling menghargai dan tidak memaksakan kehendak merupakan penerapan sikap tenggang rasa.
- **A** nalisis — Selalu bersikap waspada dan memeriksa serta memvalidasi setiap informasi yang diterima sebelum di-share ke orang lain.

---

## 4. Lisensi Karya Cipta Digital

![7poind1](dampak-sosial_files/7poind1.svg)

Dalam dunia digital, pengguna diberi kebebasan untuk mengunggah dan mengunduh data, seperti file gambar, video, dan audio. Namun dalam aktivitas tersebut, ada norma, aturan, dan perlindungan hukum hak cipta. Dalam dunia digital, terdapat model lisensi dengan nama creative commons yang dipopulerkan tahun 2001 oleh Profesor Lawrence Lessig dari Stanford University.

Berikut adalah beberapa simbol atribut lisensi creative commons yang terdapat pada situs https://creativecommons.org:

![7poind2](dampak-sosial_files/7poind2.svg)

---

## 5. HKI (Hak Kekayaan Intelektual)

![7poine](dampak-sosial_files/7poine.svg)

Intelektual memiliki pengertian cerdas, memiliki akal, berpikir sehat, berilmu pengetahuan, mampu bernalar secara logis, sistematis, dan cepat. Hal tersebut dapat dilihat dari sikap dan perbuatan seseorang yang selalu bertindak sesuai nalar, dalam arti positif berdasarkan hukum dan norma yang berlaku.

### Kategori Intelektual

a. **Potensi Kecerdasan Manusia**

Kecerdasan manusia terbagi menjadi tiga kategori:

1.  **IQ (Intelligence Quotient) atau Kecerdasan Intelektual** — Merupakan kemampuan seseorang dalam bernalar, memahami, mengetahui, menganalisis, mempelajari, menyimpulkan, dan mengoperasikan masalah sebagai sebab akibat, logika cara berpikir yang matang, representasikan pola pikir dalam bahasa isyarat, serta kecepatan dalam bertindak.

2.  **EQ (Emotional Quotient) atau Kecerdasan Emosional** — Merupakan kemampuan dalam diri pribadi manusia untuk mengenali, memahami, dan memanajemen dirinya sendiri. EQ terbagi menjadi lima jenis, yaitu kesadaran diri, kontrol diri, kemampuan sosial, empati, dan motivasi.

3.  **SQ (Spiritual Quotient) atau Kecerdasan Spiritual** — SQ tidak berhubungan dengan spiritual dalam bidang kerohanian secara umum. Namun, lebih cenderung pada kapasitas manusia dalam spontanitas, visioner, humanisme, keinginan dan kecerdasan untuk mencari jati diri, menerima perbedaan, dan potensi pengembangan diri.

b. **Berdasarkan Ilmu Pengetahuan**

Ilmu pengetahuan merupakan sebuah teori yang bersifat empiris, serta dapat diaplikasikan dan dibuktikan keabsahannya, yang diperoleh dari analisis, pengamatan, percobaan, perhitungan hingga pembuktian yang sudah diakui legalitasnya.

![7poine2](dampak-sosial_files/7poine2.svg)

Kekayaan intelektual adalah kekayaan yang lahir dari setiap aktivitas yang melibatkan kemampuan intelektual manusia, seperti dalam bidang teknologi, IPTEK, Kesenian, kesusastraan, musik, lagu, dan kartun.

Hak Kekayaan Intelektual (HKI) atau Hak atas Kekayaan Intelektual (HaKI) bisa dimiliki seseorang ketika menemukan sesuatu hal yang baru, sebagai hasil kerja keras, percobaan, riset, dan olah pikir menggunakan kecerdasan dan ilmu pengetahuan yang dimilikinya.

Beberapa tujuan dicetuskannya HKI bagi orang yang mengajukannya:

1.  Melindungi hak seseorang berupa kejelasan hukum dan dokumentasi resmi terkait dengan kekayaan intelektual yang dimiliki.
2.  Mencatat dan memberikan reward pada seseorang yang telah berhasil menciptakan suatu hal baru yang berguna secara ekonomi dan mendorong perkembangan pengetahuan.
3.  Membantu mempopulerkan karya cipta tersebut pada publik.
4.  Mendorong transfer knowledge and information bagi orang lain melalui pengakuan dan jaminan hukum HaKI.
5.  Menjamin kekuatan hukum sebagai bentuk perlindungan terhadap karya cipta.

Jenis lisensi untuk melindungi keamanan produk software:

a. **Commercial License** — Tujuan memperoleh keuntungan atau profit bagi vendornya. Dilindungi undang-undang dan telah didaftarkan sebagai hak cipta. Untuk menggunakan produk ini, user harus membeli lisensi secara resmi.
b. **Open Source License** — Lisensi ini khusus diciptakan dengan tujuan berbagi aplikasi secara gratis dan memungkinkan pengguna lain untuk melihat, memodifikasi, dan mengembangkannya lebih baik.
c. **Trial License** — Model lisensi ini memberikan versi demo aplikasi dengan batasan pengoperasian dalam waktu tertentu atau fungsi operasi tidak penuh.

Jaminan dan perlindungan hukum dalam bidang HKI di Indonesia mengalami beberapa kali perubahan. Berikut adalah daftar regulasi peraturan perundangan yang dapat dijadikan pedoman:

a. **Hak Cipta**

      Perundang-undangan:
      - UU Nomor 6 Tahun 1982 Tentang Hak Cipta
      - UU Nomor 7 Tahun 1987 tentang Perubahan atas UU No. 6 Tahun 1982 tentang hak cipta
      - UU Nomor 12 Tahun 1997 tentang Perubahan atas UU No. 6 Tahun 1982 sebagaimana telah diubah dalam UU Nomor 7 Tahun 1987
      - UU Nomor 19 Tahun 2002 tentang Hak Cipta
      - UU Nomor 28 Tahun 2014 tentang Hak Cipta

      Peraturan Pemerintah:
      - PP Nomor 7 Tahun 1989 tentang Perubahan Atas Peraturan Pemerintah Nomor 14 Tahun 1986 tentang Dewan Hak Cipta.
      - PP Nomor 1 Tahun 1989 tentang Penerjemahan dan/atau Perbanyakan Ciptaan untuk Kepentingan Pendidikan, Ilmu Pengetahuan, Penelitian, dan Pengembangan.
      - PP Nomor 14 Tahun 1986 tentang Dewan Hak Cipta.

      Peraturan Menteri:
      - Peraturan Menteri Kehakiman Republik Indonesia Nomor M.01-HV.03.01 Tahun 1987 tentang Pendaftaran Ciptaan.

b. **Hak Paten**

      Perundang-undangan:
      - UU Nomor 6 Tahun 1989 tentang Paten
      - UU Nomor 13 Tahun 1997 tentang Perubahan UU Nomor 6 Tahun 1989
      - UU Nomor 14 Tahun 2001 tentang Paten
      - UU Nomor 13 Tahun 2016 tentang Paten (mencabut UU No. 14 Tahun 2001)

      Peraturan Pemerintah:
      - PP Nomor 31 Tahun 1995 tentang Komisi Banding Paten.
      - PP Nomor 11 Tahun 1993 tentang Bentuk dan Isi Surat Paten.
      - PP Nomor 33 Tahun 1991 tentang Pendaftaran Khusus Konsultan Paten.
      - PP Nomor 34 Tahun 1991 tentang Tata Cara Permintaan Paten.

c. **Hak Desain Industri**

      UU Nomor 31 Tahun 2000 tentang Desain Industri

d. **Hak Merek**

      Perundang-undangan:
      - UU Nomor 19 Tahun 1992 tentang Merek
      - UU Nomor 14 Tahun 1997 tentang Perubahan UU Nomor 19 Tahun 1992
      - UU Nomor 15 Tahun 2001 tentang Merek
      - UU Nomor 20 Tahun 2016 tentang Merek dan Indikasi Geografis

      Peraturan Pemerintah:
      - PP Nomor 32 Tahun 1995 tentang Komisi Banding Merek
      - PP Nomor 23 Tahun 1993 tentang Tata Cara Permintaan Pendaftaran Merek
      - PP Nomor 24 Tahun 1993 tentang Kelas Barang atau Jasa Bagi Pendaftaran Merek

e. **Hak Desain Tata Letak Sirkuit Terpadu**

      UU Nomor 32 Tahun 2000 tentang Desain Tata Letak Sirkuit Terpadu

f. **Hak Rahasia Dagang**

      UU Nomor 30 Tahun 2000 tentang Rahasia Dagang
$content$
  ),
  (
    'Analisis Data',
    'Konsep dasar analisis data, jenis-jenis data, serta metode pengolahan dan penyajian data.',
    1,
    array['informatika', 'analisis data'],
    $content$# Analisis Data

---

## 1. Konsep dan Jenis Analisis Data

![addsithumb](analisi-data_files/addsithumb.svg)

### A. Pengertian Analisis Data

Data merupakan sekumpulan fakta, kejadian, atau objek yang dapat dilihat, diukur, dan disimpan dalam format tertentu. Kajian data yang diolah menurut mekanisme tertentu akan menghasilkan informasi yang dapat diterima akan pikiran dan memberikan gambaran tentang suatu kondisi, yang selanjutnya dapat digunakan untuk mengambil keputusan.

Contoh: Data penjualan PT ABC dalam waktu lima tahun terakhir:

![1poina](analisi-data_files/1poina.svg)

Dari data tersebut, dapat diambil informasi bahwa terjadi peningkatan penjualan yang signifikan pada produk vitamin dan masker, sedangkan obat-obatan kosmetik mengalami penurunan drastis. Dari informasi ini, perusahaan akan melakukan investigasi yang mendalam untuk menentukan strategi produksi dan penjualan di masa yang akan datang. Tahapan pengumpulan, penyusunan, pengolahan, dan penyimpulan data menjadi informasi spesifik yang dapat dimengerti dan dipahami sebagai dasar kajian untuk menentukan kebijakan atau tindakan selanjutnya, disebut analisis data.

### B. Jenis Data

Karakteristik data yang dapat diambil, diukur, dihitung, dan dianalisis diklasifikasikan beberapa tipe, yaitu sebagai berikut:

1. Berdasarkan Sifatnya
2. Berdasarkan Skala Pengukurannya
3. Berdasarkan Sumbernya
4. Berdasarkan Bentuk dan Penyimpanannya

#### Berdasarkan Sifatnya

a. **Data Kualitatif** — Data kualitatif merupakan representasi dari konsep data sebagai penerjemah data mentah (belum diolah) ke dalam format uraian, deskripsi, atau eksplanasi. Pengambilan data kualitatif dapat dilakukan dalam tiga tahapan, yaitu sebagai berikut:

1.  Data reduction — Mekanisme identifikasi data abstrak dengan metode kodefikasi, pengklasifikasian, rangkuman, atau kategorisasi.
2.  Organization — Proses penggabungan data yang telah diperoleh menjadi sebuah informasi utuh.
3.  Interpretation — Sinergi dan kombinasi antara dua tahap sebelumnya yang dapat dinyatakan sebagai interpretasi data.

Untuk memperoleh data kualitatif, dapat menggunakan beberapa metode pendekatan:

- Metode Analisis Tematik (Thematic Analysis)
- Analisis Percakapan (Discourse Analysis)
- Analisis Semiotik (Semiotic Analysis)
- Teori Grounded (Grounded Theory)
- Analisis Isi (Content Analysis)

b. **Data Kuantitatif** — Data kuantitatif merupakan jenis data yang dapat diukur, dinilai, dan dihitung karena memiliki nilai berupa angka yang dapat dibuat statistik. Untuk memperoleh data kuantitatif, dapat menggunakan beberapa metode pendekatan:

1.  **Metode Korelasi** — Dilakukan dengan membandingkan bahwa data memiliki kesamaan atau tidak terhadap objek yang akan diteliti.
2.  **Metode Komparatif** — Teknik pengumpulan data yang dilakukan secara objektif tanpa memodifikasi atau memanipulasi hasil penelitian. Data tersebut kemudian dianalisis untuk mengetahui perbedaan variabel data.
3.  **Metode Deskriptif** — Teknik pengumpulan data yang dilakukan dengan mempelajari kondisi dalam lapangan secara jelas dan teliti, baik dari sisi subjek maupun objek.
4.  **Metode Survei** — Tahapan pengumpulan yang dilakukan dengan mengambil beberapa sampel dari sekian populasi untuk memperoleh hasil yang nyata.
5.  **Metode Ex-post Facto** — Teknik pengambilan data yang dilakukan untuk menghasilkan informasi tentang sebab dan akibat proses manipulasi data hasil penelitian berbasis teori tertentu.
6.  **Metode True Experiment** — Digunakan untuk mengontrol variabel penentu data yang berasal dari lingkaran luar. Mekanisme ini bertujuan untuk menguji apakah terjadi perubahan nilai setelah penelitian dilakukan.

#### Berdasarkan Skala Pengukurannya

a. **Data Nominal** — Data yang dikelompokkan (klaster) berdasarkan kategori tertentu. Contohnya, kode X digunakan untuk menunjukkan populasi laki-laki dan kode Y untuk menunjukkan populasi perempuan.

Karakteristik data nominal:

- Teknik klasterisasi dilakukan tanpa mempertimbangkan urutan data.
- Nilai pengukuran yang diperoleh untuk mewakili sebuah kategori data.
- Tiap jenis kategori data memiliki data yang sama.
- Termasuk tipikal pengukuran data berlevel terendah dalam skema pengukuran data.
- Jarang dioperasikan secara matematika.

b. **Data Ordinal** — Diperoleh dengan mengelompokkan data berdasarkan urutan peringkat dan hubungan antardata. Contohnya, korelasi data peringkat sekolah berdasarkan umur dan data kenaikan trafik jaringan berdasarkan jumlah pengguna.

Karakteristik data ordinal:

- Data dapat diklasifikasikan berdasarkan urutan.
- Pemilihan data berdasarkan tingkatan.
- Tidak dapat diberlakukan pada operasi matematis.
- Memiliki level lebih tinggi dibandingkan data nominal.

c. **Data Interval** — Interval atau range yang berarti jangkauan, dapat diperoleh melalui mekanisme pengukuran. Misalnya pengukuran skor ujian dan tes IQ.

Karakteristik data interval:

- Penggunaan interval atau range tertentu dalam menyatakan nilainya.
- Data disusun berurutan, bertingkat, dan memiliki nilai.
- Memungkinkan untuk dianalisis menggunakan metode statistik parametrik.
- Dilihat dari pengujian data, lebih tinggi dibandingkan data ordinal dari sisi pengukuran.

d. **Data Rasio** — Diperoleh dari hasil pengukuran, seperti jarak, skala, dan panjang.

Karakteristik data rasio:

- Nilai data menggunakan angka sesuai fakta sebenarnya.
- Penggunaan nilai absolut, misalnya angka 0.
- Dapat dibandingkan dan dioperasikan secara sistematis.
- Berada pada level tertinggi dalam pengukuran data.

#### Berdasarkan Sumbernya

1. **Data Primer** — Pengambilan data primer dilakukan secara langsung pada objek penelitian. Misalnya, melalui interviu dan kuesioner pada individu, organisasi, dan konsumen.

   Kelebihan:
   - Lebih lengkap
   - Sesuai fakta di lapangan
   - Informasi lebih update dan relevan dengan perkembangan zaman

   Kekurangan:
   - Membutuhkan waktu lama
   - Membutuhkan biaya besar
   - Terkadang sampel yang diambil kurang valid

2. **Data Sekunder** — Pengambilan data sekunder dilakukan secara tidak langsung pada objek penelitian. Misalnya berdasarkan referensi jurnal data penelitian terdahulu.

   Kelebihan:
   - Lebih murah.
   - Tidak memakan waktu.
   - Terkadang bersifat gratis.

   Kekurangan:
   - Jika referensi yang dirujuk menggunakan pola tahun sebelumnya atau kadaluwarsa dapat mengakibatkan simpulan data kurang valid.

#### Berdasarkan Bentuk dan Penyimpanannya

a. **Data Analog** — Data analog merupakan data yang dibawa dalam bentuk gelombang kontinu berdasarkan frekuensi dan amplitude dengan satuan pengukuran Hertz. Tipe data ini sering digunakan untuk transmisi data jarak jauh.

b. **Data Digital** — Data digital memiliki format dalam pulsa listrik dengan bersaran 0 dan 1 (high voltage dan low voltage) yang dikenal dengan istilah sinyal diskret. Jenis data hanya bisa bekerja dalam jarak dekat dan dapat disimpan dalam media disk ataupun sirkuit digital.

---

## 2. Metode Analisis Data

Metode analisis data dapat dilakukan dengan beberapa tipe, yaitu Analisis Deskriptif, Analisis Diagnostik, Analisis Prediktif, Analisis Preskriptif, dan Analisis Inferensial.

### A. Analisis Deskriptif

Metode analisis deskriptif biasa ditampilkan dalam model visual, seperti gambar, grafik, laporan, dan angka yang sering dimanfaatkan untuk menggambarkan kinerja bisnis atau proses kerja yang dapat digunakan untuk menentukan kebijakan selanjutnya.

### B. Analisis Diagnostik

Metode analisis diagnostik sering digunakan untuk menjelaskan, memberikan pemahaman, dan memodelkan kejadian sehingga mampu memberikan informasi tentang sebab akibat dari suatu peristiwa. Penerapan analisis ini dapat dilihat dalam tahapan pendeteksi gejala penyakit, kerusakan mobil, kerusakan komputer, kesalahan program, dan serangan fiber.

### C. Analisis Prediktif

Metode analisis prediktif dilakukan dengan mengambil nilai data terdahulu (historis) sebagai data awal untuk machine learning dalam rangka menentukan pola atau simpulan masalah. Dengan data historis tersebut, dapat memperkirakan peristiwa, gejala, dan kondisi di masa mendatang. Contohnya, seseorang batuk, pilek, demam tinggi, dan hilang penciuman bisa diidentifikasi sebagai gejala Covid-19.

### D. Analisis Preskriptif

Metode analisis preskriptif mempelajari pola dan tren yang diambil dalam sebuah penelitian untuk memberikan rujukan atau rekomendasi dalam upaya menjelaskan dan menguraikan potensi implikasi setiap permasalahan. Contohnya, tren data pasien yang meningkat 200% saat pandemi akan menjadi rujukan untuk meningkatkan stok obat dan pegawai rumah sakit.

### E. Analisis Inferensial

Metode analisis inferensial dilakukan berdasarkan data statistika yang akan mengambil simpulan secara umum. Analisis ini menggunakan rumus dan metode statistik tertentu sebagai dasar menggeneralisasi sampel populasi.

---

## 3. Analisis Data Statistik

### A. Tahapan Melakukan Analisis

Dengan melakukan analisis data, diharapkan memberikan dampak positif seperti berikut:

1. Memperoleh data yang valid dan dapat dipercaya.
2. Memperoleh hasil sistem pengukuran yang kredibel.
3. Tahapan identifikasi lebih fleksibel dan reliabel.
4. Progres dan output akhir dapat dilihat dan dipantau secara visual.
5. Mampu memberikan pertimbangan dalam pengambilan keputusan.

Prosedur melakukan analisis data dibagi menjadi enam tahap:

1. **Information Gathering** — Tahapan awal, proses dimulai dengan menentukan objek penelitian, menentukan sampel, dan melakukan pengambilan data terkait kebutuhan penelitian.
2. **Editing** — Fase editing digunakan untuk memeriksa serta menguji dokumen dan kelengkapan saat mengisi instrumen data.
3. **Coding** — Merupakan tahap identifikasi, klarifikasi, serta validasi data terkait pernyataan dalam instrumen pengumpulan data sebagai variabel penting penelitian.
4. **Testing** — Merupakan tahap pengujian data yang telah dinyatakan valid dan diklarifikasi kebenarannya dari sisi kualitas dan realitas.
5. **Describing Data** — Mekanisme pendeskripsian data dalam bentuk tabel atau diagram dengan beragam bentuk dan ukuran agar mudah dipahami.
6. **Hypothesis Testing** — Merupakan tahap pengambilan keputusan. Pada tahap ini, visualisasi data yang ditampilkan akan diuji apakah dapat dinyatakan lolos dan diterima atau ditolak.

### B. Tools Analisis Data

![3poinb](analisi-data_files/3poinb.svg)

---

## 4. Metode Pengolahan Data Digital

### A. Konsep Pengolahan Data Digital

Pengolahan data digital dimaknai sebagai mekanisme untuk mengubah dan memanipulasi data digital yang melibatkan dua proses penting:

a. **Data storage processing** — meliputi fase pengumpulan, pencarian, dan pemeliharaan.
b. **Data handling processing** — meliputi proses verifikasi, pembandingan, pengurutan, ekstraksi, dan manipulasi.

Tahapan Pengolahan Data:

1. Input phase — Menginputkan data yang disimpan dalam komputer.
2. Process phase — Data yang diinputkan nantinya akan diproses oleh processor untuk dimodifikasi dan dimanipulasi sesuai instruksi user.
3. Output phase — Hasil dari proses pengolahan data yang ditampilkan ke pengguna.

Jenis-jenis perangkat yang dapat digunakan dalam pengolahan data digital:

1. Peralatan manual, menggunakan tenaga manusia
2. Peralatan mekanik, berbasis gerakan mekanik
3. Peralatan mekanik elektronik, penggerak secara mekanik dan otomatis
4. Perangkat elektronik, menerapkan teknologi digital dalam proses penggerakan mesin dan pengontrolannya

Karakteristik pengolahan data:

1. Berdasarkan standar operasi yang berlaku
2. Mengikuti instruksi dan proses yang diinputkan user
3. Data Collecting, sarana menghimpun dan merekonstruksikan data
4. Menampilkan dan memberikan saran dan solusi pemecahan masalah
5. Menekankan pemecahan masalah yang telah lalu

Mekanisme pengolahan data terdiri atas beberapa tahapan dasar:

1. **Recording** — Dilakukan dengan mencatat, merekam, dan memindahkan data yang terdapat pada dokumen atau formulir sebagai input awal.
2. **Duplicating** — Tahap penggandaan data yang masih tersimpan dalam formulir, baik secara manual maupun dengan mesin komputer.
3. **Verifying** — Tahapan verifikasi dengan memeriksa setiap data dalam berkas dokumen atau formulir.
4. **Classification** — Proses pengelompokan dan pengklasifikasian data dalam beberapa jenis.
5. **Sorting** — Proses pengaturan dan pengurutan data sesuai kategori yang telah ditentukan sebelumnya.
6. **Merging** — Proses penarikan, penggabungan, atau pencampuran beberapa data dengan mekanisme sorting data yang sama.
7. **Calculation** — Proses kalkulasi data berdasarkan kategori yang telah ditetapkan sebelumnya, misalnya data numerik.
8. **Recovery** — Proses pengembalian data yang telah di-sorting dan diverifikasi sebelumnya.

### B. Sistem Pengolahan Data Digital

#### File Processing System

File processing system merupakan kumpulan program yang ditujukan untuk menyimpan dan mengelola file dalam hard disk komputer. Jenis pemrosesan file data digital dapat dibedakan menjadi beberapa jenis:

1. Relative-record-number processing
2. Consecutive processing
3. Sequential-by-key processing
4. Random-by-key processing
5. Sequential-within-limits processing

Kelemahan model file processing system:

1. **Concurrent access** — Saat terjadi pengaksesan data dengan file yang sama secara bersamaan, berpotensi menyebabkan kegagalan dan kesalahan data.
2. **Security** — Sistem kesulitan untuk mengatur pemberian akses dengan beberapa privilege. Misalnya read only atau write beberapa parameter file.
3. **Atomicity** — Jika terjadi kegagalan, kesalahan, modifikasi, atau update data pada file, akan sulit melakukan recovery pada file tersebut.

#### Database Processing System

Database processing system merupakan perangkat lunak yang didesain untuk mengatur, menyimpan, serta melayani permintaan data dari komputer klien terhadap konten data. Contohnya, MySQL, SQL server, PostgreSQL, SQLite, Oracle, dBase, dan FoxPro.

---

## 5. Pengolahan Database

### A. Teknologi Database

Database terdiri atas dua kata, yaitu data dan base yang dapat digambarkan sebagai tempat penyimpanan data dengan standardisasi tertentu dengan tujuan memudahkan penempatan dan pencarian data.

![5poina](analisi-data_files/5poina.svg)

Peran sistem database dalam dunia modern meliputi tujuh aspek berikut:

1. **Accuracy** — Kemudahan dalam akses dan akurasi data yang ditampilkan.
2. **Spaceability** — Ketersediaan ruang penyimpanan data untuk meminimalisasi redudansi data.
3. **Speed** — Peningkatan kecepatan akses data.
4. **Availability** — Pemilihan data sesuai kebutuhan, agar tidak menghabiskan memori. Tindakan yang dilakukan adalah memilih data yang tidak penting, seperti data lama, histori data, redudansi data, serta menghapus data sampah dari sistem database.
5. **Security** — Peningkatan keamanan data.
6. **Completeness** — Kelengkapan data yang memungkinkan untuk menambah dan memodifikasinya.
7. **Shareability** — Kemampuan untuk berbagi data dalam layanan sistem klien-server.

### B. Sistem DBMS

Mekanisme penyimpanan dan pengelolaan database memerlukan aplikasi yang dapat digunakan untuk mengatur, mengelola, dan memanajemen database yang disebut DBMS (Database Management System).

Dalam operasinya, DBMS memiliki sejumlah komponen fungsional:

1. **File manager** — Berperan untuk mengatur alokasi penyimpanan disk pada server.
2. **Database manager** — Bertugas menjembatani komunikasi antara mesin (data pada level terendah) dengan program aplikasi yang dibuat.
3. **Query processor** — Berguna mengonversi kueri yang diinstruksikan user menjadi script low level agar dimengerti oleh database manager.
4. **DML precompiler** — Bermanfaat mengonversi kueri DML atau Data Manipulation Language dari aplikasi menjadi kueri processor.
5. **DDL Compiler** — Bertugas menerjemahkan kueri DDL atau Data Definition Language ke mesin database menjadi bentuk table dalam database.

Script yang digunakan untuk mengelola database menggunakan syntax dalam format khusus, yang dikenal dengan SQL (Structured Query Language). Dalam SQL, ada dua kategori bahasa yang diterapkan:

1. **DDL (Data Definition Language)** — DDL digunakan untuk merancang, mendefinisikan, serta mengelola desain dan struktur basis atau data secara keseluruhan. Contoh kegunaan DDL adalah membuat tabel baru, mengindeks, mengubah tabel, serta menentukan struktur data, tipe data, dan media penyimpanan tabel.
2. **DML (Data Manipulation Language)** — DML digunakan untuk memanipulasi, menghapus, menyisipkan, meng-update, dan melakukan pengambilan data pada tabel. Terdapat dua jenis DML, yaitu non-prosedural dan prosedural.

Jenis Pengguna dalam interaksi dengan mesin database:

1. **End User** — Level pengguna yang berinteraksi dengan aplikasi untuk mengakses dan memanipulasi database yang dibuat programmer.
2. **Specialized User** — Pengguna yang secara khusus mengoperasikan database untuk keperluan tertentu, seperti pencitraan satelit.
3. **Casual User** — Pengguna yang dapat mengakses dan mengoperasikan database secara langsung menggunakan kueri sehingga responsnya lebih cepat.
4. **Programmer** — Pengguna yang bertugas merancang dan mendesain aplikasi agar dapat terhubung dan mampu mengoperasikan data dalam database menggunakan bahasa pemrograman.

### C. Database Server dan Abstraksi Data

Database server adalah mesin yang terinstal pada sistem operasi tertentu, misalnya Windows Server atau Linux, yang telah dikonfigurasi dengan aplikasi database untuk melayani dan menampilkan data pada klien. Dalam mendeskripsikan data, sistem pengolahan database mengenal tiga level abstraksi data:

a. **Physical Level** — Mempresentasikan data secara fisik dalam media penyimpanan lengkap dengan struktur dan konten data itu sendiri.
b. **Conceptual Level** — Menggambarkan struktur secara logis dan konseptual tentang relasi hubungan antardata dalam tabel, misalnya relasi antara tabel siswa, tabel mata pelajaran, dan tabel nilai siswa.
c. **View Level** — Tingkatan interaksi antara user dengan server dalam pengelolaan database menggunakan metode view.

![5poinc](analisi-data_files/5poinc.svg)

---

## 6. Proteksi Data Digital

### A. File Data Digital

Jenis file dapat dibedakan menjadi dua, yaitu bertipe text dan binary. Ukuran file dengan konten text lebih besar karena tidak bisa dikompres layaknya file binary. Untuk memverifikasi keaslian data digital atau file signature, ada dua metode yang dapat digunakan untuk menganalisisnya:

1. **Memeriksa File MD5sum** — MD5 atau Message Digest Algorithm dibuat dengan tujuan sebagai mekanisme pengaman data dengan mengubah nilai plaintext menjadi bentuk cipher secara satu arah. MD5 memiliki lebar 128 bit atau 16 Byte (32 Word).
2. **Memeriksa Magic Number** — Magic number merupakan byte data yang berada di awal konten sebagai penanda untuk identitas file.

### B. Keamanan Data

Keamanan selalu identik dengan mekanisme mempertahankan diri dari segala kemungkinan terjadinya serangan, yang dilakukan dengan menutup celah-celah yang dapat menyebabkan intruder masuk ke dalam sistem. Kebutuhan security tergantung dari aplikasi dan layanan yang dijalankan oleh komputer itu sendiri. Hal tersebut memunculkan dua istilah komputer, yaitu secure server dan vulnerable server.

Serangkaian peraturan yang menetapkan kegiatan apa saja yang boleh dilakukan terhadap layanan server serta siapa saja yang dapat mengakses layanan server disebut sebagai kebijakan keamanan komputer atau lebih dikenal sebagai security policy.

Dalam menetapkan jenis kebijakan keamanan, diperlukan tiga tahap:

1. **Threat Analysis** — Tahapan analisis layanan server dan kapasitas jaringan dalam mendukung sistem bisnis yang sedang atau akan diterapkan organisasi.
2. **Security Policy** — Rangkaian aturan untuk mencegah terjadinya penyerangan atau penyusupan terhadap jaringan dan komputer server.
3. **Security Mechanisms** — Tahapan menerapkan mode keamanan tersebut dengan meningkatkan fitur keamanan data, baik melalui konfigurasi hardware maupun software.

![6poinb](analisi-data_files/6poinb.svg)

Untuk menjaga keamanan sistem dari serangan intruder, diperlukan mode keamanan data yang terbagi menjadi beberapa jenis:

1. **Physical Security** — Sisi paling penting dalam mode keamanan data adalah sisi fisik data. Kelalaian pengawasan sisi ini, dapat menyebabkan orang tidak bertanggung jawab bisa menyentuh, mengoperasikan, dan memodifikasi fungsi data. Oleh karena itu, Data Operation Center biasanya diletakan dalam ruangan yang tidak terjangkau dan memiliki keamanan fisik berlapis.
2. **Network Security** — Metode pengamanan jaringan dengan membangun sistem firewall dan monitoring berbasis hardware ataupun software, yang dioperasikan dalam Network Operations Center.
3. **Account Security** — Rangkaian aturan untuk mencegah terjadinya penyerangan atau penyusupan terhadap jaringan dan komputer server.
4. **File System Security** — Seorang administrator jaringan harus dapat menentukan jenis file sistem yang akan digunakan dan cara mengatur kewenangan setiap user dalam pengaksesannya serta maksimal kuota kapasitas penyimpanannya.

### C. Enkripsi Data

Enkripsi merupakan proses mengamankan data atau informasi dengan melakukan modifikasi bentuk dan formatnya agar tidak mudah terbaca oleh pihak lain. Teknik penyandian ini mulai diperkenalkan dengan model tertua menggunakan algoritme Caesar Cipher.

Teknik penyandian diklasifikasikan menjadi tiga macam, yaitu model klasikal (terbagi atas menjadi model substitusi dan transportasi), model rotor, dan model modern (terbagi atas public key dan private key (stream and block)).

### D. Kejahatan Siber (Cybercrime)

Para penyerang selalu mengawali langkahnya dengan melakukan beberapa testing terhadap layanan atau service yang dijalankan oleh komputer server. Tujuannya untuk menemukan lubang celah keamanan (vulnerable) yang ditandai bug atau error.

Metode penyerangan yang sering dilakukan oleh para intruder:

1. Backdoor
2. Trojan Horse
3. DoS (Denial of Service)
4. Ransomware
5. Malicious Code
6. Virus
7. E-mail Spoofing
$content$
  ),
  (
    'Jaringan Komputer dan Internet',
    'Pengertian, prinsip kerja, manfaat, dan jenis sinyal dalam teknologi jaringan komputer.',
    1,
    array['informatika', 'jaringan komputer', 'internet'],
    $content$# Jaringan Komputer dan Internet

---

## 1. Teknologi Jaringan Komputer

![1poina](jaringan-komputer_files/1poina.svg)

### A. Definisi Komputer

Komputer adalah perangkat digital yang dilengkapi dengan komponen masukan, pemrosesan, dan keluaran. Beberapa perangkat digital yang dapat dikatakan sebagai komputer, antara lain PC, laptop, tablet, dan smartphone. Perangkat-perangkat tersebut memiliki kemampuan melakukan pemrosesan data sendiri (independen), seperti menyimpan dokumen, memutar video, dan melakukan penghitungan sesuai dengan perintah user. Konsep kerja perangkat ini disebut dengan stand alone.

### B. Prinsip Kerja dan Manfaat Jaringan Komputer

Prinsip jaringan komputer dapat dikatakan sebagai proses pengiriman data dari pengirim (sender) ke penerima (receiver) melalui media komunikasi tertentu.

> Sender → (Media Transmisi) → Protocol → (Media Transmisi) → Receiver

Komunikasi data adalah proses pertukaran data antara pengirim dengan penerima atau sebaliknya. Dua jenis data yang ditransmisikan dalam jaringan, yaitu berupa sinyal digital dan sinyal analog.

1. **Sinyal Digital**, Gelombang data yang ditransmisikan dalam bentuk pulsa tegangan yang mereferensikan tinggi rendahnya sinyal. Ada dua jenis pulsa tegangan, yaitu 0 untuk tegangan rendah dan 1 untuk tegangan tinggi. Jenis sinyal ini rentan terhadap gangguan (data loss) jika ditransmisikan pada area yang luas.

   ![1poinb1](jaringan-komputer_files/1poinb1.svg)

2. **Sinyal Analog**, Data yang ditransmisikan dalam bentuk gelombang sinusoidal secara kontinu, yang dipengaruhi oleh faktor amplitudo dan frekuensi. Amplitudo merupakan tinggi rendahnya sebuah gelombang dalam aliran sinyal analog. Adapun frekuensi adalah banyaknya getaran atau gelombang per detik dalam sinyal analog.

   ![1poinb2](jaringan-komputer_files/1poinb2.svg)

Manfaat teknologi jaringan komputer dalam memudahkan pekerjaan manusia:

1. Berbagi pakai informasi dan sumber daya.
2. Memungkinkan pertukaran data dan informasi antarpengguna, seperti chat dan e-mail.
3. Data terintegrasi sehingga dapat diakses dari lokasi yang berbeda-beda.
4. Membagi dan mendistribusikan pekerjaan pada komputer lain sehingga jika terjadi masalah pada salah satu komputer, pekerjaan masih bisa diakses melalui komputer lainnya.
5. Data dan informasi dapat diatur dan diolah sesuai kebutuhan.
6. Meningkatkan dan memperbaiki sistem keamanan data dengan cara membatasi user yang dapat mengakses data.

### C. Transmisi Data

Proses transmisi data dalam jaringan atau disebut juga komunikasi data dapat dibedakan menjadi tiga jenis, yaitu:

1. **Simplex atau Sistem Komunikasi Satu Arah**, Simplex adalah sistem komunikasi yang hanya memungkinkan perangkat yang terlibat berfungsi sebagai peralatan penerima data (receiver device) atau sebaliknya. Contoh perangkat yang menerapkan sistem ini adalah radio dan televisi. Stasiun televisi menyalurkan sistem komunikasi ke televisi.

2. **Half Duplex atau Sistem Komunikasi Setengah Dua Arah**, Half duplex merupakan sistem komunikasi dua arah yang memungkinkan perangkat jaringan untuk mengirim dan menerima data ke perangkat lainnya. Contoh perangkat yang menerapkan sistem ini adalah radiogram dan walkie-talkie.

3. **Full Duplex atau sistem komunikasi dua arah sekaligus**, Full duplex merupakan sistem komunikasi dua arah yang mampu mengirim dan menerima data secara bersamaan. Contoh perangkat yang menerapkan sistem ini adalah telepon, handphone, laptop dan internet.

### D. Metode Transmisi Data

Metode transmisi data dibedakan menjadi dua, yaitu:

1. **Transmisi Paralel**, Pada transmisi paralel, bit-bit data dalam sinyal digital akan ditransmisikan secara bersamaan melalui media yang terbagi dalam 8 bit saluran. Transmisi ini relatif cepat pada media dengan jarak yang dekat, seperti transfer data dari hard disk ke mainboard, DVD drive, dan sinyal data komputer ke printer atau sebaliknya. Akan tetapi, jika ada salah satu saluran yang terputus, data bisa rusak atau tidak dapat terbaca.

   ![1poind1](jaringan-komputer_files/1poind1.svg)

2. **Transmisi Serial**, Pada transmisi serial, bit-bit data dikirimkan secara berurutan dan beruntun dari perangkat pengirim (sender) ke perangkat penerima (receiver). Transmisi serial sangat efektif untuk transmisi dengan jarak jangkauan yang lebih jauh. Contohnya, dalam jaringan komputer, sistem telepon, dan VSAT.

   ![1poind2](jaringan-komputer_files/1poind2.svg)

### E. Teknik Pengiriman Data

Untuk mengirim data, terdapat dua teknik pengiriman yang dilakukan, yaitu baseband dan broadband. Teknik ini dibedakan berdasarkan perlunya konversi data terlebih dahulu atau dapat langsung dikirimkan dari pengirim ke penerima.

1. **Teknik Pengiriman Baseband**, Pada teknik pengiriman baseband, data digital dikirimkan secara langsung dari sender ke receiver tanpa melakukan perubahan apa pun.

   Keuntungan metode baseband:
   - Lebih sederhana topologinya.
   - Murah dalam penerapan dan konfigurasinya karena tidak memerlukan modem.
   - Lebih mudah dalam instalasi dan perawatannya.

   Kekurangan metode baseband:
   - Jangkauan transmisi data menjadi terbatas (butuh perangkat tambahan untuk area yang luas).
   - Instalasi sambungan grounding cukup sulit.
   - Kapasitas transmisi data terbatas.

2. **Teknik Pengiriman Broadband**, Pada teknik pengiriman boardband, data digital dikonversi terlebih dahulu menjadi data analog. Setelah diterima receiver, data tersebut kembali dikonversi menjadi data digital.

   Keuntungan metode broadband:
   - Daya jangkauan yang lebih luas.
   - Kapasitas besar.
   - Instalasi jaringan lebih murah (untuk koneksi wireless).

   Kekurangan metode broadband:
   - Membutuhkan peranti tambahan berupa modem.
   - Delay transmisi relatif lama.
   - Mekanisme instalansi dan perbaikan insfrastruktur jaringan relatif sulit.
   - Membutuhkan biaya yang mahal dalam instalansinya.

Aspek yang memengaruhi kecepatan transfer data dalam jaringan:

1. Jenis Modem
2. Jenis Media
3. Kualitas Sambungan Transmisi
4. Jarak Media yang Ditempuh
5. Banyaknya Jumlah Sambungan

### F. Model Layanan Jaringan

Dalam jaringan, komputer dapat berperan sebagai pusat layanan ataupun sebagai penerima layanan. Perbedaan peran komputer tersebut bergantung pada kebutuhan manusia sebagai penggunanya. Untuk melayani kebutuhan pengguna, terdapat dua model layanan jaringan komputer, yaitu model peer-to-peer dan klien-server.

![1poinf](jaringan-komputer_files/1poinf.svg)

### G. Jenis Jaringan Berdasarkan Area

Berdasarkan jangkauan areanya, jaringan dapat dibedakan menjadi empat, yaitu sebagai berikut.

1. **PAN (Personal Area Network)**, PAN merupakan jaringan dengan daya jangkau area yang terbatas, biasanya terhubung melalui gelombang radio dengan jarak maksimal 10 m. Contoh penerapan tekonologi PAN adalah pada mouse wireless yang menggunakan jaringan bluetooth sebagai perantara input ke komputer.

   Keunggulan penggunaan teknologi PAN dalam jaringan:
   - Konsumsi daya listrik rendah sehingga perangkat lebih awet.
   - Fleksibel karena perangkat tidak membutuhkan media sambungan seperti kabel dan dapat disambungkan di mana saja tanpa terbatas objek seperti dinding.
   - Sederhana dalam instalansi dan kecepatan akses data relatif tinggi untuk data berukuran kecil dalam jarak tertentu.
   - Biaya lebih murah dibandingkan sistem LAN dan WAN.
   - Dapat diterapkan dalam berbagai jenis topologi jaringan.

   ![1poing1](jaringan-komputer_files/1poing1.svg)

2. **LAN (Local Area Network)**, LAN atau jaringan lokal merupakan sekempulan peranti jaringan yang terhubung satu sama lain melalui media transmisi dengan jangkauan 100 m–2 km. LAN memiliki kemampuan transfer data antara 1–100 Mbps. Jaringan ini biasa diimplementasikan dalam ruangan tertutup atau area terbuka dengan jarak tertentu, seperti kantor, gedung, laboratorium, dan sekolah.

   Karakteristik LAN:
   - Kecepatan transfer data tinggi, antara 100 Mbps hingga 1 Gbps.
   - Jangkauan lebih luas dibandingkan PAN.
   - Biaya instalansi lebih murah ketika diterapkan pada banyak perangkat jaringan.
   - Tidak membutuhkan jasa provider untuk menghubungkan perangkat-perangkat dalam jaringan.

   ![1poing2](jaringan-komputer_files/1poing2.svg)

3. **MAN (Metropolitan Area Network)**, MAN merupakan jaringan komputer dengan jarak atau radius media transmisi antara 10 hingga 50 km. Secara struktur, MAN terdiri atas beberapa LAN yang saling terhubung. Teknologi MAN sering digunakan untuk sambungan jarak jauh antarkantor atau organisasi yang masih dalam satu sistem manajemen, dengan tujuan untuk menyinkronkan sistem informasi, memudahkan pengontrolan, dan membuat sistem yang terpusat.

   ![1poing3](jaringan-komputer_files/1poing3.svg)

4. **WAN (Wide Area Network)**, WAN merupakan jaringan dalam skala besar dengan jangkauan mencakup seluruh dunia. Suatu jaringan dikatakan sebagai WAN, jika mempunyai panjang media transmisi lebih dari 100 km.

   ![1poing4](jaringan-komputer_files/1poing4.svg)

Berdasarkan jangkauan areanya, media transmisi yang digunakan dalam jaringan:

| Jenis    | Jarak       | Area                | Media Transmisi                                 |
| -------- | ----------- | ------------------- | ----------------------------------------------- |
| LAN      | 1–10 m      | Ruangan             | Kabel UTP/wireless LAN                          |
| LAN      | 100 m–1 km  | Gedung perkantoran  | Kabel UTP/kabel telepon                         |
| MAN      | 1–10 km     | Kota                | Kabel fiber optic/kabel telepon/gelombang radio |
| MAN      | 10–100 km   | Kebupaten, provinsi | Kabel fiber optic/gelombang radio               |
| WAN      | ≥ 100 km    | Negara              | Kabel fiber optic/satelit                       |
| WAN      | ≥ 1.000 km  | Benua               | Satelit                                         |
| Internet | ≥ 10.000 km | Planet              | Satelit                                         |

### H. Klasifikasi Jaringan Berdasarkan Kecepatan

Jika dilihat dari kecepatannya jaringan komputer dapat dibagi menjadi empat, yaitu sebagai berikut.

1. **Low Speed Network**, Kecepatan transfer data antarperangkat kurang dari 1 Mbps dan biasa diterapkan di rumah atau sarana percobaan di laboratorium.
2. **Medium Speed Network**, Kecepatan transfer data antarperangkat 1–20 Mbps.
3. **High Speed Network**, Kecepatan transfer data antarperangkat mulai dari 20 Mbps bahkan 100 Mbps. Saat ini, umumnya komponen pendukung jaringan yang tersedia di pasaran telah mendukung kecepatan ini.
4. **Super High Speed Network**, Kecepatan transfer data antarperangkat bisa mencapai 1 Gbps atau lebih. Contohnya, perangkat dengan teknologi Giga Ethernet.

---

## 2. Komponen Jaringan

Beberapa komponen yang digunakan dalam jaringan komputer, antara lain Server, NIC (Network Interface Card), Kartu Wi-fi, Hub, Switch, Router, Access Point, Modem, Media transmisi.

### A. Server

Server merupakan komputer berspesifikasi tinggi yang memiliki peran utama memberikan layanan pada klien dalam jaringan. Beberapa layanan yang disediakan server, antara lain sebagai berikut:

a. Berbagi data dengan perangkat klien.
b. Melayani permintaan layanan dari komputer klien.
c. Mengatur pengguna yang memiliki hak akses terhadap server dan jaringan secara umum.
d. Menjaga keamanan data yang tersimpanan dan serangan yang berkaitan dengan pencurian data atau penggunaan secara ilegal.

### B. NIC (Network Interface Card)

NIC atau kartu jaringan atau kartu LAN berfungsi sebagai penghubung satu komputer dengan komputer lain dalam jaringan, yang tersambung media transmisi tertentu, seperti nirkabel atau kabel. Kartu LAN biasanya menggunakan slot PCI, ISA, Mini PCI, dan PCI Express serta ditancapkan pada slot bus mainboard.

![2poinb](jaringan-komputer_files/2poinb.svg)

### C. Kartu Wi-fi

Kartu Wi-fi adalah versi dari NIC yang menghubungkan komputer-komputer yang tersambung dengan media transmisi nirkabel, seperti melalui jaringan wi-fi.

Ada dua tipe kartu wi-fi, yaitu kartu wi-fi internal dan kartu wi-fi eksternal.

1. Kartu wi-fi internal adalah kartu jaringan dengan tipe slot PCI atau PCI Express yang dapat ditancapkan pada bus mainboard.
2. Kartu wi-fi eksternal adalah kartu jaringan yang dapat dipasangkan di luar perangkat komputer menggunakan port USB.

![2poinc](jaringan-komputer_files/2poinc.svg)

### D. Hub

Hub atau Konsentrator adalah perangkat yang berfungsi sebagai pusat sambungan yang menghubungkan beberapa perangkat dalam jaringan yang sama. Hub bersifat distributor pasif yang akan membagikan setiap data yang diterimanya ke semua perangkat yang terkoneksi.

### E. Switch

Switch memiliki fungsi yang sama dengan hub, namun switch bersifat distributor aktif. Selain mendistribusikan data, switch juga menyimpan MAC adress setiap perangkat yang terhubung sehingga setiap data yang ditransfer akan diteruskan ke port yang menjadi tujuannya.

![2poine](jaringan-komputer_files/2poine.svg)

### F. Router

Router adalah perangkat jaringan yang bertugas mengirimkan paket data melalui jaringan internet dari sumber data ke tujuannya. Proses pengiriman paket data tersebut disebut dengan routing.

![2poinf](jaringan-komputer_files/2poinf.svg)

### G. Access Point

Access point merupakan perangkat yang berfungsi menerima dan mendistribusikan data. Berbeda dengan router, access point hanya berperan untuk mengoneksikan perangkat yang ingin terhubung dalam jaringan. Oleh karena itu, perangkat access point dan router saling berhubungan dalam menjalankan fungsinya.

![2poing](jaringan-komputer_files/2poing.svg)

### H. Modem

Modem adalah perangkat yang berfungsi melakukan modulasi dan demodulasi. Modulasi adalah proses pengubahan sinyal informasi ke dalam sinyal pembawa, sedangkan demodulasi adalah proses penyaringan sinyal informasi dari sinyal pembawa.

![2poinh](jaringan-komputer_files/2poinh.svg)

### I. Media Transmisi

Secara umum media transmisi dibedakan menjadi dua, yaitu sebagai berikut:

- **Guided media** merupakan media yang dapat menghantarkan data melalui konduktor fisik, seperti tembaga dan serat kaca. Contohnya, kabel coaxial, UTP, STP, dan fiber optic.
- **Unguided media** adalah jenis media tidak terpandu yang tidak memiliki bentuk secara fisik sehingga dalam pemancarannya membutuhkan gelombang elektromagnetik untuk mentransfer data. Contohnya, gelombang radio, infrared, bluetooth, dan satelit.

1. **Media Transmisi Kabel**, Ketika memilih kabel sebagai media transmisi dalam membangun jaringan, ada tiga aspek yang harus dipertimbangkan, yaitu banyaknya perangkat yang terhubung, jangkauan dan area jaringan, serta kecepatan dan lebar bandwidth yang akan digunakan.

2. **Media Transmisi Nirkabel atau Wireless**, Media transmisi nirkabel dikategorikan sebagai unguided media karena tidak dapat diukur secara visual ataupun dinyatakan dalam satuan metrik sehingga tidak memerlukan konduktor fisik seperti kabel. Media transmisi yang digunakan adalah radiasi elektromagnetik (listrik dan medan magnet yang terinterferensi) yang dipancarkan melalui udara terbuka.

Faktor Yang Perlu Dipahami Dalam Membangun Jaringan Nirkabel:

1. Dalam instalansi dan konfigurasi, perangkat nirkabel membutuhkan antena untuk memperkuat pancaran sinyal dan sistem penerimaan.
2. Berdasarkan jenis frekuensi gelombang, jaringan nirkabel dibedakan menjadi tiga jenis, yaitu gelombang mikro (frekuensi 2–40 Ghz), gelombang dengan frekuensi 30 Mhz–1 Ghz, dan gelombang inframerah.
3. Terdapat dua model koneksi gelombang radio, yaitu poin-to-point dan broadcast.
4. Media transmisi tidak terpadu terdiri atas empat bagian, yaitu gelombang mikro atmosfer Bumi, gelombang mikro pada satelit, radio broadcast, dan inframerah.

---

## 3. Protokol Jaringan

Protokol jaringan adalah sekumpulan aturan baku yang ditetapkan oleh badan standarisasi dunia tentang jaringan dan teknologi informasi yang mengatur mekanisme komunikasi data antarmesin komputer. Ada dua model protokol jaringan yang dapat digunakan, yaitu Model DoD dan Model OSI.

### A. Model DoD

Model layer DoD dikeluarkan oleh Departemen Pertahanan Amerika Serikat atau Departement of Defence (DoD) sebagai upaya meningkatkan strategi pertahanan.

**Layer DoD:**

1. Process/ Application
2. Host-to-Host
3. Internet
4. Network Access

**Layer OSI:**

1. Application Presentation Session
2. Transport
3. Network
4. Data Link Physical

**Contoh Protokol:**

1. Telnet, FTP, Kerberos, SMTP, DNS, TFTP, SNMP, NFS, dan Xwindows
2. UDP dan TCP
3. ARP, IP, ICMP, BOOTP, dan RARP
4. Token ring, Ethernet, dan FDDI

### B. Model OSI

Model OSI (open standard interconnection) yang dikeluarkan oleh ISO (International Standard Organization) membagi proses komunikasi dalam tujuh layer. Prinsip-prinsip yang digunakan bagi ketujuh layer tersebut adalah sebagai berikut:

a. Jenis layer harus diselesaikan dengan tingkat abstraksi dan fungsi yang berbeda-beda dalam servisnya.
b. Layer yang dibentuk harus bermanfaat sesuai kebutuhan serta saling berhubungan dan saling mendukung satu sama lain.
c. Kegunaan setiap layer ditentukan melalui mekanisme yang logis dan rumit dengan ketelitian tinggi sesuai standard protokol internasional.
d. Batasan dan area operasi layer bertujuan meminimalisasi aliran informasi yang melewati interface.
e. Jumlah layer harus cukup banyak disesuaikan spesifikasi, proses kerja, dan kegunaannya sehingga fungsi-fungsi yang berbeda tidak perlu digabung dalam satu layer.

Model OSI memiliki tujuh layer yang dibagi menjadi application, presentation, session, transport, network, data link, dan physical layer.

a. **Application (aplikasi)** — Menyediakan interface yang memberikan pelayanan bagi pengguna dalam berinteraksi dengan sistem jaringan melalui komputer.

Contoh Protokol:

- DHCP (dynamic host configuration protocol) — Protokol untuk distribusi IP pada jaringan dengan jumlah IP terbatas.
- DNS (domain name server) — Basis data berisis nama domain mesin dan IP address.
- FTP (file transfer protocol) — Protokol untuk transfer file.
- HTTP (hypertext transfer protocol) — Protokol untuk transfer file HTML dan Web.
- MIME (multipupose internet mail extention) — Protokol untuk mengirim file biner dalam bentuk teks.
- NNTP (network news transfer protocol) — Protokol untuk menerima dan mengirim newsgroup.
- POP (post office protocol) — Protokol untuk mengambil mail dari server.
- SMB (server message block) — Protokol untuk transfer berbagai server file DOS dan Windows.
- SMTP (simple mail transfer protocol) — Protokol untuk penukaran mail.
- SNMP (simple network management protocol) — Protokol untuk manajemen jaringan.
- Telnet — Protokol untuk akses dari jarak jauh.
- TFTP (Trivial FTP) — Protokol untuk transfer file.

b. **Presentation (presentasi)** — Melakukan enkripsi kompresi, serta deskripsi data.

Contoh Protokol (Bentuk format kompresi paket data):
ASCII, EBCDIC, MIDI, MPEG, TIFF, JPEG, PICT, quick time.

c. **Session** — Mengasosiasikan setiap komunikasi antar-layer sebelum session, dengan layer setelah session.

Contoh Protokol:

- NETBIOS (network basic input output system) — BIOS jaringan standar.
- RPC (remote procedure call) — Prosedur pemanggilan jarak jauh.
- SOCKET — Input output untuk network jenis BSD-UNIX.
- SQL, NETBEUI, dan XWINDOWS — Protokol untuk database, mesin IBM, dan pengaturan GUI OS berbasis Unix.

d. **Transport (transpor)** — Memastikan setiap paket data dikirim tanpa terjadi kesalahan dan tidak terjadi duplikasi.

Contoh Protokol:

- TCP (transmission control protocol) — Protokol pertukaran data berorientasi (connection-oriented).
- UDP (user datagram protocol) — Protokol pertukaran data non-orientasi (connectionless).

e. **Network (jaringan)** — Menentukan letak jalur pengiriman data yang akan ditransmisikan serta meneruskan paket tersebut ke alamat jaringan tertentu.

Contoh Protokol:

- IP (internet protocol) — Protokol untuk menetapkan routing.
- RIP (routing information protocol) — Protokol untuk memilih routing.
- ARP (address resolution protocol) — Protokol untuk mendapatkan informasi hardware dari nomor IP.
- RARP (reverse ARP) — Protokol untuk mendapatkan informasi nomor IP dari hardware.

f. **Data link** — Mengatur nilai data biner (true and false) yang bernilai 0 dan 1 menjadi logical group.

Contoh Protokol:

- PPP (point-to-point) — Protokol untuk akses point-to-point (biasanya dial-up).
- SLIP (serial line internet protocol) — Protokol dengan menggunakan sambungan serial.

g. **Physical (fisik)** — Sebagai interface fisik yang melewatkan transmisi data biner (digital) melalui jalur komunikasi.

Contoh Protokol: Ethernet, FDDI, ISDN, ATM, 10BaseT, 100BaseTX, HSSI, V.35, dan X.21 yang kegunaannya sebagai contoh bentuk standar penggunaan media transmisi yang berpengaruh terhadap besaran data dan kecepatan transmisi data.

Berdasarkan fungsinya, ketujuh layer dalam model OSI dapat dikategorikan menjadi dua lapisan, yaitu lapisan atas dan lapisan bawah.

1. Lapisan atas dari model OSI terkait dengan persoalan aplikasi. Umumnya, lapisan ini hanya diimplementasikan pada aplikasi yang digunakan oleh pengguna komputer. Lapisan paling atas, yaitu lapisan aplikasi adalah lapisan penutup sebelum terhubung ke pengguna.
2. Lapisan bawah dari model OSI mengendalikan persoalan transpor data. Lapisan fisik dan lapisan data link diimplementasikan ke dalam hardware dan software. Lapisan-lapisan bawah yang lain umumnya hanya diimplementasikan dalam software. Lapisan terbawah, yaitu lapisan fisik adalah penutup bagi media jaringan fisik dan sebagai penanggung jawab bagi penempatan informasi pada media jaringan.

---

## 4. IP Address

### A. Definisi IP Address

IP Address merupakan metode pengalamatan yang diterapkan sebagai identitas pengenal mesin dalam jaringan yang terdiri atas bagian angka berbasis desimal atau heksadesimal dengan standar aturan tertentu. Saat ini, terdapat dua versi IP address yang digunakan, yaitu IP address versi 4 dan IP address versi 6.

#### IP Address versi 4

IP address dalam penggunaannya terdiri atas dua bagian, yaitu network ID dan host ID. Network ID memperlihatkan alamat network atau jaringan, sedangkan host ID mengidentifikasikan alamat host dalam satu network. Syarat terbentuknya sebuah jaringan lokal adalah jaringan harus dalam satu kelas IP yang sama, memiliki network IP dan broadcast IP yang sama, dan mempunyai IP host yang berbeda. Untuk menghubungkan dua jaringan dengan network ID yang berbeda, dibutuhkan router sebagai jembatan penghubungnya.

Dalam menentukan network ID dan host ID yang akan digunakan dalam jaringan, terdapat beberapa aturan sebagai berikut:

a. Network ID 127.0.0.1 tidak dapat digunakan untuk pengalamatan IP address. Hal ini karena IP address ini secara default digunakan untuk keperluan loopback.

b. Host ID tidak boleh diset pada bit 1 semua (contoh kelas C: 192.168.11.255) karena akan diartikan sebagai alamat broadcast pada subnet mask 255.255.255.0. Broadcast ID merupakan alamat yang mewakili seluruh anggota jaringan.

c. Sebuah network ID dan host ID tidak boleh dikonfigurasikan pada bit 0 semua (seluruh bit diset 0 seperti 0.0.0.0). Hal ini karena IP address dengan host ID 0 diartikan sebagai alamat network.

### B. Range IP Address

Berikut adalah pembagian range kelas IP address berdasarkan aturan standar internasional.

![4poinb](jaringan-komputer_files/4poinb.svg)

Metode classless addressing atau dalam bahasa tekniknya adalah menyediakan rentang IP address dalam notasi classless inter-domain routing (CIDR), bertujuan untuk mengatur sistem pengalamatan IP address yang merujuk pada jaringan secara lebih spesifik atau disebut juga dengan network prefix.

Pengelompokan subnet mask:

![4poinb2](jaringan-komputer_files/4poinb2.svg)

Menurut penggunaannya, terdapat dua tipe IP address, yaitu sebagai berikut:

1. **IP Publik**, IP publik adalah IP yang digunakan dalam jaringan internet di seluruh dunia.
2. **IP Privat**, IP privat adalah IP address yang tidak digunakan dalam penomoran alamat komputer karena dicadangkan untuk penggunaan jaringan lokal yang mencakup tiga segmen terakhir dari IP address untuk internet.

Daftar IP address yang dicadangkan untuk digunakan sebagai IP privat:

![4poinb3](jaringan-komputer_files/4poinb3.svg)

Diketahui bahwa semua range pengalamatan IP address kelas D dan E juga dapat digunakan untuk IP address jaringan lokal. IP tersebut tidak digunakan sebagai IP publik di internet.

---

## 5. Topologi Jaringan

![5thumb](jaringan-komputer_files/5thumb.svg)

### A. Definisi Topologi

Topologi merupakan pola hubungan antarterminal atau antarkomputer dalam jaringan. Pola ini berhubungan dengan metode akses dan media pengirim yang digunakan. Namun dalam membangun sebuah jaringan, ada beberapa hal yang harus diperhatikan, antara lain ukuran organisasi, tingkat keamanan data, ketersediaan sistem pendukung, beban traffic jaringan, ketersediaan biaya, dan banyaknya pengguna.

Topologi dapat diklasifikasikan menjadi dua jenis ditinjau dari segi keberadaannya:

1. **Physical topology**, Bentuk topologi secara fisik yang menekankan teknik koneksi media transmisi antar-node atau workstation.
2. **Logical topology**, Bentuk topologi secara logika yang menggambarkan model aliran data antar-user dalam jaringan.

Beberapa hal yang perlu dijadikan pertimbangan dalam memilih jenis topologi jaringan, yaitu sebagai berikut:

1. Biaya, besar biaya yang dikeluarkan harus seefisien mungkin sesuai dengan kebutuhan organisasi.
2. Kecepatan, sejauh mana kecepatan yang dibutuhkan dalam sistem.
3. Lingkungan, faktor-faktor lingkungan (listrik, angin, cuaca) yang berpengaruh terhadap perangkat keras yang dibutuhkan.
4. Ukuran, seberapa besar ukuran jaringan, semakin besar jaringan akan memerlukan perangkat tambahan, seperti file server atau sejumlah server khusus.
5. Konektivitas, kemudahan akses jaringan dari berbagai lokasi.

Jenis topologi yang dapat dipilih untuk membangun jaringan komputer yakni Topologi Bus, Topologi Ring, Topologi Star, dan Topologi Lainnya.

### B. Topologi Bus

Pada topologi bus, terminal atau komputer disusun secara serial dalam sebuah media transmisi utama.

Karakteristik topologi bus:

1. Sederhana dan mudah dalam instalansi.
2. Transfer data lebih cepat karena menggunakan satu jalur umum yang terhubung dengan node-node.
3. Potensi terjadi tabrakan data atau collision lebih besar karena sinyal mengalir dalam dua arah.
4. Jika salah satu segmen kabel putus, seluruh jaringan akan terhenti.
5. Penambahan segmen tidak mengubah model jalur.
6. Berupa bentangan satu kabel yang kedua ujungnya ditutup oleh terminator dan terdapat node-node sepanjang kabel.

![5poinb](jaringan-komputer_files/5poinb.svg)

### C. Topologi Ring

Secara fisik, topologi ring mirip dengan topologi bus, tetapi kedua terminal di bagian ujung saling terhubung sehingga membentuk lingkaran. Pada topologi ring, setiap terminal akan memeriksa informasi yang melewatinya.

![5poinc](jaringan-komputer_files/5poinc.svg)

### D. Topologi Star

Pada topologi star, terdapat terminal pusat atau hub sebagai pengatur dan pengendali semua komunikasi data yang terjadi dalam jaringan. Setiap transmisi data akan dilewatkan dan didistribusikan oleh konsentrator.

![5poind](jaringan-komputer_files/5poind.svg)

### E. Topologi Lainnya

Sering dengan perkembangan teknologi dan kebutuhan pengguna, telah banyak digunakan modifikasi pada topologi yang sudah ada. Berikut beberapa topologi yang dihasilkan dari kombinasi topologi bus, ring, dan star.

1. **Topologi Mesh**, Pada topologi mesh, setiap komputer dalam jaringan memiliki media penghubung ke komputer lain secara langsung sehingga membuat kecepatan transfer data lebih baik. Namun, kebutuhan media transmisi kabel dibutuhkan lebih banyak.

2. **Topologi Tree**, Topologi tree merupakan kombinasi topologi star dan bus. Umumnya, hub diletakkan di paling depan dan diikuti beberapa terminal yang dihubungkan secara serial.

3. **Topologi Hybrid**, Topologi hybrid merupakan rangkaian beberapa jenis topologi star, ring, dan bus. Biasanya, topologi ini diterapkan dalam perusahaan yang menggunakan beberapa jenis topologi jaringan.

---

## 6. Menggunakan Layanan Jaringan

### A. Mengonfigurasi IP Address Komputer

Langkah-langkah mengonfigurasi IP address pada kartu jaringan (NIC) komputer yang terhubung dengan switch jaringan lokal:

1. Pastikan kartu jaringan telah terpasang dan driver telah terinstal dengan baik.
2. Sistem operasi yang digunakan adalah Windows 8 (disarankan Windows 10). Pastikan komputer telah tersambung dengan switch atau hub jaringan laboratorium yang telah memiliki akses internet dengan IP address yang telah ditentukan.
3. Klik start → Control Panel → Network and Internet → Network and Sharing Center → Change adapter settings.

![6poina](jaringan-komputer_files/6poina.svg)

4. Klik kanan ikon Ethernet → pilih Properties. Jika ikon tersebut menampilkan tanda silang merah seperti gambar, berarti interface kartu jaringan belum terhubung dengan jaringan.
5. Pilih Internet Protocol Version 4 (TCP/IPv4) → Properties atau dobel klik untuk menampilkan menu konfigurasi IP address versi 4.
6. Selanjutnya, lakukan pengaturan IP address sesuai dengan ketentuan IP dalam laboratorium komputer sekolah. Dalam contoh ini, menggunakan ketentuan sebagai berikut:
   - IP address: 10.10.10.53
   - Subnet Mask: 255.255.255.192
   - Gateway: 10.10.10.62
   - DNS Server: 8.8.8.8
7. Setelah itu, klik OK dan tutup kotak dialog Local Area Connection Properties.
8. Buka command prompt Windows. Periksa bahwa konfigurasi IP address versi 4 sudah benar dengan mengetikkan perintah `ipconfig`.
9. Langkah selanjutnya adalah melakukan uji konektivitas jaringan dengan memasukkan perintah berikut:
   - `ping 127.0.0.1` — Jika ditampilkan pesan "Reply from 127.0.0.1 ....", hal tersebut menunjukkan bahwa loopback adapter dalam kondisi baik.
   - `ping 10.10.10.53` — Jika ditampilkan pesan "Reply from 10.10.10.53 ....", hal tersebut menunjukkan bahwa kartu jaringan lokal dalam kondisi baik.
   - `ping 8.8.8.8` — Jika ditampilkan pesan "Reply from 8.8.8.8 ....", hal tersebut menunjukkan bahwa komputer telah terhubung dengan internet.
   - `ping google.com` — Jika pengujian koneksi dengan host 8.8.8.8 berhasil, seharusnya akan ditampilkan informasi bahwa komputer dapat terkoneksi dengan server.

### B. Mengoneksikan Laptop dengan Hotspot

Hotspot merupakan area atau wilayah tertentu yang terdapat sinyal pemancar gelombang radio yang memungkinkan pengguna dengan perangkat yang mampu menangkap wi-fi, seperti komputer, laptop, PDA, notebook, dan smartphone dapat terhubung dengan internet.

1. Memiliki SSID yang di-broadcast dan dapat dijangkau oleh perangkat klien.
2. Biasanya menggunakan gelombang radio dengan frekuensi 2,4 GHz.
3. Biasanya wi-fi hotspot memiliki autentikasi seperti harus memasukkan password tertentu ketika terkoneksi dengan SSID wi-fi.
4. Terkadang ada beberapa layanan hotspot yang mewajibkan pengguna untuk login melalui web browser untuk mengakses internet.

### C. Mengakses Internet dengan Web Browser

Web browser merupakan aplikasi yang dapat digunakan untuk mengakses konten informasi, seperti gambar, teks, audio, dan video dari berbagai situs yang ada di internet. Contoh browser adalah Google Chrome, Mozilla Firefox, Opera, dan Microsoft Edge. Sebelum dapat mengakses informasi di internet, harus menginstal web browser pada komputer terlebih dahulu.

![6poinc](jaringan-komputer_files/6poinc.svg)

### D. Mengaktifkan Proxy pada Web Browser

Proxy bekerja di antara komputer pengguna dengan server website tujuan. Setiap request komputer akan dirutekan terlebih dahulu menuju proxy server, kemudian akan diarahkan kembali menuju server website tujuan.

Tipe web proxy:

1. **Transparent**, merupakan jenis proxy server yang dilengkapi konfigurasi firewall pengaturan port proxy sehingga klien tidak perlu melakukan konfigurasi proxy pada web browser-nya.
2. **Non-transparent**, merupakan jenis proxy yang hanya mengharuskan pengguna mengatur konfigurasi port proxy secara manual, yang diarahkan ke server proxy tersebut.

### E. Mengonfigurasi VPN Client

Virtual Private Network atau VPN merupakan teknologi yang memberikan akses ke website secara aman dengan cara membungkus paket komunikasi data dari pengirim ke tujuan. Teknologi ini akan membuat jalur rahasia dalam kanal jaringan sehingga paket data lebih aman, terenkripsi, dan tidak dapat dilacak.

![6poine](jaringan-komputer_files/6poine.svg)

### F. Chatting dalam Jaringan Lokal

Dalam komunikasi digital, chatting merupakan komunikasi yang memungkinkan pengguna mengirimkan data, baik teks, gambar, audio maupun video dengan menggunakan perangkat digital, seperti komputer dan gadget. Chatting dapat dilakukan menggunakan aplikasi dan website.

![6poinf](jaringan-komputer_files/6poinf.svg)

### G. Sharing Data

Share merupakan mekanisme membagi resource pada perangkat lain dalam jaringan, baik berupa data, program, proses, maupun sistem percetakan dalam perangkat komputer agar dapat digunakan secara bersama-sama dengan terminal lainnya dalam jaringan.

Langkah-langkah melakukan konfigurasi sharing data dengan Windows 10:

1. Bentuk kelompok minimal lima anggota dan pastikan komputer dalam kelompok telah tersambung dengan LAN. Lakukan konfigurasi IP address dengan network 192.168.100.0/24 kemudian periksa konektivitas jaringan tersebut.
2. Dalam contoh praktik, komputer dengan IP address 192.168.0.9 akan dikonfigurasi sebagai komputer sharing dengan folder D:/Software.
3. Selanjutnya, klik kanan folder Software → pilih Properties → klik tab Sharing → klik tombol Share.
4. Agar folder tersebut dapat diakses oleh semua anggota, tambahkan opsi Everyone → klik Add → klik Share → klik Done.
5. Untuk membuka folder yang telah di-share sebelumnya pada komputer lain, tekan kombinasi tombol keyboard Windows + R sehingga muncul jendela Run. Setelah itu, ketikkan perintah `\\192.168.100.66`.

![6poing](jaringan-komputer_files/6poing.svg)

### H. Upload dan Download File dalam Server FTP

File transfer protocol (FTP) merupakan protokol transfer data yang memungkinkan pengguna dapat meng-upload dan men-download file dari server tanpa memperhatikan platform mesin dan sistem operasi yang digunakan. Layanan ini sering dimanfaatkan dalam jaringan internet, misalnya untuk pengaturan konten website dan blog.

![6poinh](jaringan-komputer_files/6poinh.svg)

### I. ICS/Tethering

ICS atau internet connection sharing merupakan fitur berbagi koneksi jaringan internet dalam komputer Windows melalui interface kartu LAN dan kartu wi-fi. Adapun konsep tethering adalah proses berbagi koneksi internet menggunakan perangkat mobile (smartphone) pada perangkat lain dengan menggunakan wi-fi atau kabel data.

![6poini](jaringan-komputer_files/6poini.svg)

### J. Melakukan Remote dari Smartphone Android ke PC

Mengakses dan mengoperasikan perangkat komputer bisa dilakukan dari jarak jauh selama terhubung jaringan lokal atau internet. Hal tersebut dapat dilakukan dengan fitur RDP (remote desktop protocol) yang berfungsi menjembatani pemberian akses ke perangkat komputer dari jarak jauh untuk bertukar data ataupun mengoperasikannya secara langsung. Salah satu contoh pengaplikasiannya yaitu teknik remote smartphone Android ke PC atau sebaliknya menggunakan aplikasi AnyDesk.

![6poinj](jaringan-komputer_files/6poinj.svg)
$content$
  ),
  (
    'Praktik Lintas Bidang',
    'Praktik pengembangan aplikasi tepat guna berbasis Array dan pemrograman Java dalam kehidupan sehari-hari.',
    1,
    array['informatika', 'praktik', 'array', 'java'],
    $content$# Praktis Lintas Bidang

---

## 1. Array Satu Dimensi

Setelah mempelajari teknik pembuatan program dengan bahasa pemrograman Java, peserta didik diharapkan mampu bekerja sama dalam kelompok untuk mengenali dan mengidentifikasi permasalahan dalam kehidupan masyarakat. Masalah tersebut kemudian dapat diangkat menjadi tema proyek berbasis informatika dalam bentuk aplikasi tepat guna.

![10poina1](praktik-lintas_files/10poina1.svg)

Bagan tahapan pengembangan aplikasi

Contoh proyek aplikasi dalam kehidupan sehari-hari:

![10poina2](praktik-lintas_files/10poina2.svg)
$content$
  ),
  (
    'Literasi Digital',
    'Keterampilan memproduksi, menyebarkan, dan memahami etika konten digital serta pelabelan informasi secara bertanggung jawab.',
    1,
    array['informatika', 'literasi digital'],
    $content$# Literasi Digital

---

### Apa itu Literasi Digital?

Literasi digital adalah kemampuan dan pengetahuan individu untuk secara efektif dan bijaksana menemukan, mengevaluasi, menggunakan, dan menciptakan informasi menggunakan teknologi digital. Di era "Masyarakat Informasi" saat ini, literasi bukan lagi sekadar kemampuan membaca teks cetak, melainkan keterampilan kognitif dan teknis yang canggih untuk berinteraksi dengan konten multimedia dan menavigasi jaringan informasi global yang sangat luas.

---

## A. Produksi Konten Digital

### Apa itu Produksi Konten Digital?

Produksi konten digital adalah proses menciptakan berbagai jenis informasi yang disimpan dalam format digital dan dapat diakses melalui perangkat elektronik. Konten ini mencakup artikel, video, gambar, hingga musik. Kemampuan ini sangat penting karena saat ini setiap individu memiliki peluang untuk menjadi "prosumer" (produsen sekaligus konsumen) yang menyuarakan ide mereka melalui media baru.

![Ilustrasi seseorang membuat konten digital menggunakan perangkat laptop](literasi-digital_files/produksi-konten.jpg)

---

### Elemen-Elemen Multimedia

Dalam produksi konten digital, konsep **multimedia** menjadi landasan utama. Multimedia adalah penggabungan berbagai modalitas yang dimanipulasi secara digital untuk menyampaikan cerita secara interaktif.

#### 1. Teks

Teks digunakan untuk memberikan informasi detail, penjelasan, atau narasi situasi. Contohnya adalah penggunaan takarir (_subtitle_) pada video yang membantu audiens memahami dialog.

#### 2. Gambar

Elemen ini terdiri dari dua jenis: **Foto** (hasil tangkapan kamera dari objek nyata) dan **Grafis** (ilustrasi atau ikon yang dirancang secara digital). Gambar berfungsi membantu audiens memperjelas informasi visual.

![Contoh infografik yang menggabungkan teks dan gambar](literasi-digital_files/contoh-infographic.jpg)

#### 3. Audio

Audio mencakup musik, narasi suara, dan efek suara. Audio yang tepat membuat konten terasa lebih hidup dan emosional bagi pendengarnya.

#### 4. Video

Video adalah elemen paling menarik karena menggabungkan gambar bergerak dan suara. Sifatnya yang visual dan auditif membuat informasi lebih mudah dicerna, seperti dalam konten tutorial atau film.

#### 5. Animasi

Animasi adalah kumpulan grafis yang disusun untuk memberikan ilusi gerak. Animasi sering digunakan untuk menyederhanakan konsep yang kompleks menjadi lebih menyenangkan.

![Contoh animasi edukasi interaktif](literasi-digital_files/animasi-edukasi.jpg)

---

### Proses Pembuatan Konten

Proses produksi melibatkan pemilihan aplikasi yang sesuai, seperti **Canva, CapCut, InShot, atau Adobe Premiere**. Saat ini, teknologi **Kecerdasan Artifisial (KA)** sangat membantu efisiensi produksi melalui fitur seperti:

- **AI Voice:** Mengubah teks menjadi narasi suara secara otomatis.
- **AI Captions:** Menghasilkan takarir otomatis dari suara video.
- **AI Frames/Vector AI:** Menghasilkan gambar atau ilustrasi hanya dari deskripsi teks.

![Diagram alur produksi konten dari ide hingga publikasi](literasi-digital_files/alur-produksi-konten.jpg)

---

### Koding sebagai Bentuk Kreativitas

Pemrograman atau koding kini dipandang sebagai bentuk penulisan multimedia baru. Dengan menggunakan platform seperti **Scratch**, pengguna dapat "menulis" cerita melalui pengkodean blok untuk menciptakan narasi animasi yang dinamis, di mana karakter (sprite) dapat berinteraksi dan merespons perintah.

---

### Ringkasan

Produksi konten digital merupakan perpaduan antara kreativitas dan teknologi dalam mengolah elemen teks, gambar, audio, video, dan animasi. Dengan bantuan aplikasi modern dan alat berbasis KA, proses ini menjadi lebih praktis, namun tetap menuntut tanggung jawab kreator dalam menyampaikan pesan yang bernilai dan relevan.

---

## B. Diseminasi Konten Digital

### Apa itu Diseminasi Konten Digital?

Diseminasi adalah proses penyebaran atau pendistribusian konten digital melalui jaringan global. Teknologi Web 2.0 telah mengubah cara informasi beredar, di mana batas antara penyedia informasi profesional (seperti jurnalis) dan pengguna awam menjadi kabur karena semua orang dapat memublikasikan konten secara instan.

![Ilustrasi penyebaran informasi secara global melalui internet](literasi-digital_files/penyebaran-informasi_.jpg)

---

### Saluran Diseminasi Utama

Informasi digital disebarkan melalui berbagai platform yang memungkinkan interaksi dua arah:

1. **Media Sosial:** Platform seperti Instagram, TikTok, dan Facebook yang memungkinkan berbagi video dan gambar secara luas.
2. **Blog dan Wiki:** Alat kolaborasi daring untuk memublikasikan jurnal pribadi atau pengetahuan kolektif (seperti Wikipedia).
3. **Layanan Cloud:** Digunakan untuk berbagi dokumen dan file secara efisien melalui tautan.

---

### Nilai Tambah Informasi Daring

Diseminasi digital memiliki keunggulan dibandingkan media tradisional (seperti koran cetak), yaitu:

- **Interaktivitas:** Audiens dapat langsung memberikan respon atau komentar.
- **Just-in-Time:** Informasi dapat diperbarui dan diterbitkan secara _real-time_ saat kejadian berlangsung.
- **Persistensi:** Konten dapat diarsipkan dan dicari kembali kapan saja di masa depan.

---

### Teknik Keamanan dalam Berbagi

Agar konten yang disebarkan tidak disalahgunakan, perlu diterapkan beberapa teknik keamanan digital:

- **Pengaturan Privasi:** Membatasi siapa saja yang dapat melihat unggahan.
- **Format Fail yang Tepat:** Menggunakan format **PDF** untuk dokumen agar isinya tidak mudah diubah oleh pihak lain.
- **Manajemen Akses Cloud:** Pastikan pengaturan tautan tidak dibuat "publik untuk semua orang" jika berisi data pribadi.

![Infografik tips berbagi konten dengan aman](literasi-digital_files/safety-tips.jpg)

---

### Ringkasan

Diseminasi konten digital menawarkan kecepatan dan jangkauan luas yang tidak dimiliki media cetak. Namun, kemudahan ini harus dibarengi dengan pemahaman teknik berbagi yang aman guna melindungi integritas konten dan data pribadi pengguna.

---

## C. Etika Konten Digital

### Pentingnya Etika di Dunia Digital

Etika berfungsi sebagai "kompas moral" yang memandu individu tentang apa yang boleh dan tidak boleh dilakukan saat berinteraksi secara daring. Tanpa etika, ruang digital dapat dipenuhi oleh hoaks, ujaran kebencian, dan pelanggaran hak orang lain yang dapat merugikan reputasi serta memicu masalah hukum.

![Ilustrasi etika dan sopan santun dalam berkomunikasi digital](literasi-digital_files/etika.jpg)

---

### Hak Cipta dan Lisensi Digital

Setiap karya digital dilindungi oleh **Undang-Undang Hak Cipta**. Sebagai kreator, kita harus:

- **Menghargai Karya Orang Lain:** Tidak mengambil gambar, musik, atau video tanpa izin.
- **Memberikan Kredit:** Mencantumkan sumber atau nama pemilik asli jika menggunakan materi milik orang lain.
- **Menggunakan Lisensi yang Tepat:** Seperti _**Creative Commons**_ (CC), yang memberikan izin kepada publik untuk menggunakan karya dengan ketentuan tertentu tanpa harus meminta izin secara manual.

---

### Privasi dan Tanggung Jawab Sosial

Menjaga privasi adalah hal krusial dalam literasi digital. Data pribadi (seperti alamat atau identitas) diibaratkan sebagai "kunci rumah" yang tidak boleh diberikan kepada sembarang orang di internet. Selain itu, etika digital mencakup larangan melakukan:

- _**Cyberbullying**_ (perundungan siber).
- Penyebaran **Disinformasi** atau hoaks yang dimanipulasi.

---

### Jejak Digital

Setiap aktivitas di internet (komentar, _like_, atau unggahan) meninggalkan **jejak digital**. Jejak ini membentuk citra diri seseorang di dunia maya yang dapat berdampak pada peluang masa depan, seperti beasiswa atau pekerjaan. Oleh karena itu, penting untuk selalu melakukan pengecekan ulang sebelum mengeklik tombol "bagikan".

![Ilustrasi tentang jejak digital yang permanen di internet](literasi-digital_files/jejak-digital.jpg)

---

### Ringkasan

Etika digital adalah tentang tanggung jawab dan rasa hormat terhadap karya serta privasi orang lain. Memahami hak cipta, menjaga keamanan data, dan membangun jejak digital yang positif adalah kunci untuk menjadi warga digital yang bijak dan berintegritas.

---

## D. Penggunaan Label dalam Etiket Obat

### Peran Anotasi dan Pelabelan Gambar

Dalam komunikasi publik, khususnya mengenai informasi kesehatan, **pelabelan atau anotasi** pada gambar sangat penting untuk meningkatkan kejelasan desain dan kapasitas komunikasi. Label berfungsi untuk mendeskripsikan aktivitas dan memberi nama pada entitas agar informasi yang kompleks dapat dipahami dengan benar oleh audiens.

![Contoh anotasi atau label pada gambar medis/kesehatan](literasi-digital_files/label-kesehatan.jpg)

---

### Akurasi Informasi dalam Konteks Kesehatan

Penggunaan label yang tepat sangat krusial dalam menyampaikan informasi yang berkaitan dengan keselamatan manusia, seperti pada etiket obat atau infografis kesehatan:

- **Kondensasi Makna:** Label membantu merangkum informasi detail menjadi poin-poin visual yang mudah dilihat (seperti "mata sinoptik").
- **Kejelasan Proses:** Dalam materi sains, pelabelan digunakan untuk menunjukkan hubungan sebab-akibat atau urutan kronologis suatu proses medis.

---

### Kepercayaan dan Transparansi (KA)

Jika informasi atau label tersebut dihasilkan dengan bantuan **Kecerdasan Artifisial**, etika digital menuntut adanya tanda atau label yang jelas yang menyatakan bahwa konten tersebut buatan KA. Hal ini bertujuan untuk menjaga **kredibilitas** dan mencegah salah paham yang berisiko pada kesehatan pasien. Keputusan akhir dalam penanganan medis harus tetap berada di bawah pengawasan manusia (tenaga ahli), bukan diserahkan sepenuhnya pada label otomatis KA.

---

### Ringkasan

Pelabelan dan anotasi adalah elemen vital dalam komunikasi informasi kesehatan digital untuk memastikan akurasi dan kemudahan pemahaman. Penggunaan label yang jujur dan jelas—terutama pada konten yang dihasilkan KA—sangat penting untuk membangun kepercayaan publik dan menghindari kesalahan penanganan medis.

---

### Rangkuman Bab

Literasi digital adalah keterampilan komprehensif yang mencakup **produksi konten multimedia** yang kreatif, mekanisme **diseminasi** yang luas dan aman, serta kepatuhan terhadap **etika dan hak cipta**. Di era informasi ini, kemampuan untuk menyajikan data secara akurat melalui **pelabelan dan anotasi** yang benar sangat krusial, terutama dalam bidang kesehatan dan sains. Dengan menguasai aspek-aspek ini, individu dapat memanfaatkan teknologi digital tidak hanya sebagai alat teknis, tetapi sebagai sarana pemberdayaan identitas yang positif di masa depan.
$content$
  ),
  (
    'Sejarah Indonesia X Bab 1',
    'Perjalanan sejarah Indonesia sebelum mengenal tulisan, terbentuknya Kepulauan Indonesia, serta kehidupan manusia purba di Nusantara.',
    1,
    array['sejarah', 'x', 'bab 1', 'manusia purba'],
    $content$# Menelusuri Peradaban Awal di Kepulauan Indonesia

_Indonesia terletak di persimpangan tiga lempeng benua-ketiganya bertemu di sini-menciptakan tekanan sangat besar pada lapisan kulit bumi. Akibatnya, lapisan kulit bumi di wilayah ini terdesak ke atas, membentuk paparan-paparan yang luas dan beberapa pegunungan yang sangat tinggi. Seluruh wilayah ini sangat rentan terhadap gempa bumi hebat dan letusan gunung berapi dahsyat yang kerap mengakibatkan kerusakan parah. Hal ini terlihat dari beberapa catatan geologis. Gempa bumi dan tsunami mengerikan yang dialami Aceh belum lama ini hanyalah episode terakhir dari seluruh rangkaian peristiwa panjang dalam masa prasejarah dan sejarah._ (Arysio Santos, 2010)

## A. Sebelum Mengenal Tulisan

### Mengamati Lingkungan

Kutipan di atas menunjukkan bahwa keberadaan tanah air kita tidak dapat dilepaskan dari rangkaian peristiwa alam yang sudah terjadi sejak zaman dahulu kala. Jadi, dinamika sejarah yang telah bermula sejak manusia ada, jika dirunut hingga sekarang, kita akan menemukan betapa kesinambungan sejarah tidak mudah terputus, betapapun segala macam perubahan telah terjadi. Coba kamu

renungkan, apakah yang terjadi ketika tawuran anak-anak sekolah berlangsung? Bukankah sering kali mereka saling melempar batu? Batu pula senjata yang paling awal digunakan umat manusia dalam mempertahankan hidupnya. Jadi anak sekolah di zaman modern ini—zaman yang bahkan dikatakan “era globalisasi”, ketika tiada lagi batas-batas yang menghambat hubungan kebudayaan—ternyata masih mempraktikkan tradisi manusia purba pada masa praaksara. Untuk mengetahui apa, siapa, dan bagaimana kehidupan manusia zaman praaksara kamu dapat mempelajari bacaan di bawah ini.

Manusia purba tidak mengenal tulisan dalam kebudayaannya. Periode kehidupan ini dikenal dengan zaman praaksara. Masa praaksara berlangsung sangat lama jauh melebihi periode kehidupan manusia yang sudah mengenal tulisan. Oleh karena itu, untuk dapat memahami perkembangan kehidupan manusia pada zaman praaksara kita perlu mengenali tahapan-tahapannya.

### Memahami Teks

Sebelum mengenali tahapan-tahapan atau pembabakan perkembangan kehidupan dan kebudayaan zaman praaksara, perlu kamu ketahui lebih dalam apa yang dimaksud zaman praaksara. Praaksara adalah istilah baru untuk menggantikan istilah prasejarah. Penggunaan istilah prasejarah untuk menggambarkan perkembangan kehidupan dan budaya manusia saat belum mengenal tulisan adalah kurang tepat. _Pra_ berarti sebelum dan _sejarah_ adalah sejarah sehingga prasejarah berarti sebelum ada sejarah. Sebelum ada sejarah berarti sebelum ada aktivitas kehidupan manusia. Dalam kenyataannya sekalipun belum mengenal tulisan, makhluk yang dinamakan manusia sudah memiliki sejarah dan sudah menghasilkan kebudayaan. Oleh karena itu, para ahli mempopulerkan istilah praaksara untuk menggantikan istilah prasejarah.

Praaksara berasal dari dua kata, yakni _pra_ yang berarti sebelum dan _aksara_ yang berarti tulisan. Dengan demikian zaman praaksara adalah masa kehidupan manusia sebelum mengenal tulisan. Ada istilah yang mirip dengan istilah praaksara, yakni istilah _nirleka_ . _Nir_ berarti tanpa dan _leka_ berarti tulisan. Karena belum ada tulisan maka untuk mengetahui sejarah dan hasil-hasil kebudayaan manusia adalah dengan melihat beberapa sisa peninggalan yang dapat kita temukan. Kapan waktu dimulainya zaman praaksara? Kapan zaman praaksara itu berakhir? Zaman praaksara dimulai sudah tentu sejak manusia ada, itulah titik dimulainya masa praaksara. Zaman praaksara berakhir setelah manusianya mulai mengenal tulisan. Pertanyaan yang sulit untuk dijawab adalah kapan tepatnya manusia itu mulai ada di bumi ini sebagai pertanda dimulainya zaman praaksara. Sampai sekarang para ahli belum dapat secara pasti menunjuk waktu kapan mulai ada manusia di muka bumi ini. Tetapi yang jelas untuk menjawab pertanyaan itu kamu perlu memahami kronologi perjalanan kehidupan di permukaan bumi yang rentang waktunya sangat panjang. Bumi yang kita huni sekarang diperkirakan mulai terjadi sekitar 2.500 juta tahun yang lalu.

Untuk memperkaya pengetahuan tentang hal ini, kamu bisa membaca **Koentjaraningrat.** **_Manusia dan Kebudayaan Indonesia_** dan **Habib Mustopo, dkk.** **_Sejarah 1._**

Bagaimana kalau kita ingin melakukan pengetahuan tentang hal ini, kamu bisa membaca kajian tentang kehidupan zaman praaksara? **Koentjaraningrat.** Untuk menyelidiki zaman praaksara, para **_dan Kebudayaan Indonesia_** sejarawan harus menggunakan metode dan penelitian ilmu arkeologi dan sedikit banyak juga **_Sejarah 1._** pada ilmu alam seperti geologi dan biologi. Ilmu arkeologi adalah bidang ilmu yang mengkaji bukti-bukti atau jejak tinggalan fisik, seperti lempeng artefak, monumen, candi dan sebagainya. Berikutnya menggunakan ilmu geologi dan percabangannya, terutama yang berkenaan dengan pengkajian usia lapisan bumi dan biologi berkenaan dengan kajian tentang ragam hayati ( _biodiversitas_ ) makhluk hidup.

Mengingat jauhnya jarak waktu masa praaksara dengan kita sekarang, maka tidak jarang orang mempersoalkan apa perlunya kita belajar tentang zaman praaksara yang sudah lama ditinggalkan oleh manusia modern. Tetapi pandangan seperti ini sungguh menyesatkan, sebab tentu ada hubungannya dengan kekinian kita. Beberapa di antaranya akan dikemukakan berikut ini.

Data etnografi yang menggambarkan kehidupan masyarakat praaksara ternyata masih berlangsung sampai sekarang. Entah itu pola hunian, pola pertanian subsistensi, teknologi tradisional dan konsepsi kepercayaan tentang hubungan harmoni antara manusia dan alam, bahkan kebiasaan memelihara hewan seperti anjing dan kucing di lingkungan manusia modern perkotaan. Demikian pula kebiasaan bertani merambah hutan dengan motede ‘tebang lalu bakar’ ( _slash and burn_ ) untuk memenuhi kebutuhan secukupnya masih ada hingga kini. Namun, kebiasaan merambah hutan dan hidup berpindah-pindah pada masa lampau tidak menimbulkan malapetaka asap yang mengganggu penerbangan domestik. Selain itu, juga mengganggu bandara negara tetangga Singapura dan Malaysia seperti yang sering terjadi akhir-akhir ini. Teknologi manusia modernlah yang mampu melakukan perambahan hutan secara besar-besaran, entah itu untuk perkebunan atau pertambangan, dan permukiman _real estate_ sehingga menimbulkan malapetaka kabut asap dan kerusakan lingkungan.

Arti penting dari pembelajaran tentang sejarah kehidupan zaman praaksara pertama-tama adalah kesadaran akan asal-usul manusia. Tumbuhan memiliki akar. Semakin tinggi tumbuhan itu, semakin dalam pula akarnya menghunjam ke bumi hingga tidak mudah tumbang dari terpaan angin badai atau bencana alam lainnya. Demikian pula halnya dengan manusia. Semakin berbudaya seseorang atau kelompok masyarakat, semakin dalam pula kesadaran kolektifnya tentang asal usul dan penghargaan terhadap tradisi. Jika tidak demikian, manusia yang melupakan budaya bangsanya akan mudah terombang ambing oleh terpaan budaya asing yang lebih kuat, sehingga dengan sendirinya kehilangan identitas diri.

Jadi bangsa yang gampang meninggalkan tradisi nenek moyangnya akan mudah didikte oleh budaya dominan dari luar yang bukan miliknya.

Kita bisa belajar banyak dari keberhasilan dan capaian prestasi terbaik dari pendahulu kita. Sebaliknya kita juga belajar dari kegagalan mereka yang telah menimbulkan malapetaka bagi dirinya atau bagi banyak orang. Untuk memetik pelajaran dari uraian ini, dapat kita katakan bahwa nilai terpenting dalam pembelajaran sejarah tentang zaman praaksara, dan sesudahnya ada dua yaitu sebagai inspirasi untuk pengembangan nalar kehidupan dan sebagai peringatan. Selebihnya kecerdasan dan pikiran-pikiran kritislah yang akan menerangi kehidupan masa kini dan masa depan.

Sekarang muncul pertanyaan, sejak kapan zaman praaksara berakhir? Sudah barang tentu zaman praaksara itu berakhir setelah kehidupan manusia mulai mengenal tulisan. Terkait dengan masa berakhirnya zaman praaksara masing-masing tempat akan berbeda. Penduduk di Kepulauan Indonesia baru memasuki masa aksara sekitar abad ke-4 dan ke-5 M. Hal ini jauh lebih terlambat bila dibandingkan di tempat lain misalnya Mesir dan Mesopotamia yang sudah mengenal tulisan sejak sekitar tahun 3000 S.M. Fakta-fakta masa aksara di Kepulauan Indonesia dihubungkan dengan temuan prasasti peninggalan kerajaan tua seperti Kerajaan Kutai di Muara Kaman, Kalimantan Timur.

### Uji Kompentensi

1. Mengapa istilah praaksara lebih tepat dibandingkan dengan istilah prasejarah untuk menggambarkan kehidupan manusia sebelum mengenal tulisan.

2. Bagaimana secara metodologis kita dapat mengetahui kehidupan manusia sebelum mengenal tulisan.

3. Mesir mengakhiri zaman praaksara sekitar tahun 3000 S.M, tetapi di Indonesia baru abad ke-4 sampai ke-5 M. Mengapa demikian?

4. Apa saja pelajaran yang dapat kita peroleh dari belajar kehidupan pada zaman praaksara?

## B. Terbentuknya Kepulauan Indonesia

### Mengamati lingkungan

Bumi kita yang terhampar luas ini diciptakan Tuhan Yang Maha Pencipta untuk kehidupan dan kepentingan hidup manusia. Di bumi ini hidup berbagai flora dan fauna serta tempat bersemainya manusia dengan keturunannya. Di bumi ini kita bisa menyaksikan keindahan alam, kita bisa beraktivitas dan berikhtiar memenuhi kebutuhan hidup kita. Namun harus dipahami bahwa bumi kita juga sering menimbulkan bencana. Sebagai contoh munculnya aktivitas lempeng bumi yang kemudian melahirkan gempa bumi baik tektonis maupun vulkanis, bahkan sampai menimbulkan tsunami. Sebagai contoh tentu kamu masih ingat bagaimana gempa dan

tsunami yang terjadi di Aceh, gempa bumi di Yogyakarta, di Papua dan beberapa di daerah lain, termasuk beberapa gunung berapi meletus. Bencana tersebut telah mengakibatkan ribuan nyawa hilang dan harta benda melayang.

Fenomena alam yang terjadi itu merupakan bagian tak terpisahkan dari aktivitas panjang bumi kita sejak proses terjadinya alam semesta ratusan bahkan ribuan juta tahun yang lalu. Proses tersebut secara geologis mengalami beberapa tahapan atau pembabakan waktu. Berikut ini kita mencoba menelaah tentang pembabakan waktu alam secara geologis dan bagaimana Kepulauan Indonesia terbentuk.

### Memahami Teks

Ada banyak teori dan penjelasan tentang penciptaan bumi, mulai dari mitos sampai kepada penjelasan agama dan ilmu pengetahuan. Kali ini kamu belajar sejarah sebagai cabang keilmuan, pembahasannya adalah pendekatan ilmu pengetahuan, yakni asumsi-asumsi ilmiah, yang kiranya juga tidak perlu bertentangan dengan ajaran agama. Salah satu di antara teori ilmiah tentang terbentuknya bumi adalah Teori “Dentuman Besar” ( _Big Bang_ ), seperti dikemukaan oleh sejumlah ilmuwan dan yang mutakhir seperti ilmuwan besar Inggris, Stephen Hawking. Teori ini menyatakan bahwa alam semesta mulanya berbentuk gumpalan gas yang mengisi seluruh ruang jagad raya. Jika digunakan teleskop besar Mount Wilson untuk mengamatinya akan terlihat ruang jagad raya itu luasnya mencapai radius 500.000.000 tahun cahaya. Gumpalan gas itu suatu saat meledak dengan satu dentuman yang amat dahsyat. Setelah itu, materi yang terdapat di alam semesta mulai berdesakan satu sama lain dalam kondisi suhu dan kepadatan yang sangat tinggi, sehingga hanya tersisa energi berupa proton, neutron dan elektron, yang bertebaran ke seluruh arah.

Ledakan dahsyat itu menimbulkan gelembung-gelembung alam semesta yang menyebar dan menggembung ke seluruh penjuru, sehingga membentuk galaksi-galaksi bintang-bintang, matahari, planet-planet, bumi, bulan dan meteorit. Bumi kita hanyalah salah satu titik kecil saja di antara tata surya yang mengisi jagad semesta. Di samping itu banyak planet lain termasuk bintang-bintang yang menghiasi langit yang tak terhitung jumlahnya. Boleh jadi ukurannya jauh lebih besar dari planet bumi. Bintang-bintang berkumpul dalam suatu gugusan, meskipun antarbintang berjauhan letaknya di angkasa. Ada juga ilmuwan astronomi yang mengibaratkan galaksi bintang-bintang itu tak ubahnya seperti sekumpulan anak ayam, yang tak mungkin dipisahkan dari induknya. Jadi di mana ada anak ayam di situ pasti ada induknya. Seperti halnya dengan anak-anak ayam, bintang-bintang di angkasa tak mungkin gemerlap sendirian tanpa disandingi dengan bintang lainnya. Sistem alam semesta dengan semua benda langit sudah tersusun secara menakjubkan dan masing-masing beredar secara teratur dan rapi pada sumbunya masing-masing.

Selanjutnya proses evolusi alam semesta itu memakan waktu kosmologis yang sangat lama sampai beribu-ribu juta tahun. Terjadinya evolusi bumi sampai adanya kehidupan memakan waktu yang sangat panjang. Ilmu palaentologi membaginya dalam enam tahap waktu geologis. Masing-masing ditandai oleh peristiwa alam yang menonjol, seperti munculnya gunung-gunung, benua dan makhluk hidup yang paling sederhana. Proses evolusi bumi dibagi menjadi beberapa periode sebagai berikut.

- 1 _. Azoicum_ (Yunani: _a_ = tidak; _zoon_ = hewan), yaitu zaman sebelum adanya kehidupan. Pada saat ini bumi baru terbentuk dengan suhu yang relatif tinggi. Waktunya lebih dari satu milyar tahun lalu.

2. _Palaezoicum_ , yaitu zaman purba tertua. Pada masa ini sudah meninggalkan fosil flora dan fauna. Berlangsung kira-kira 350.000.000 tahun.

3. _Mesozoicum_ , yaitu zaman purba tengah. Pada masa ini hewan _mamalia_ (menyusui), hewan amfibi, burung dan tumbuhan berbunga mulai ada. Lamanya kira-kira 140.000.000 tahun.

4. _Neozoicum_ , yaitu zaman purba baru, yang dimulai sejak 60.000.000 tahun yang lalu. Zaman ini dapat dibagi lagi menjadi dua tahap ( _Tersier_ dan _Quarter_ ), zaman es mulai menyusut dan makhluk-makhluk tingkat tinggi dan manusia mulai hidup.

Merujuk pada tarikh bumi di atas, sejarah di Kepulauan Indonesia terbentuk melalui proses yang panjang dan rumit. Sebelum bumi didiami manusia, kepulauan ini hanya diisi tumbuhan flora dan fauna yang masih sangat kecil dan sederhana. Alam juga harus menjalani evolusi terus menerus untuk menemukan keseimbangan agar mampu menyesuaikan diri dengan perubahan kondisi alam dan iklim, sehingga makhluk hidup dapat bertahan dan berkembang biak mengikuti seleksi alam.

Gugusan kepulauan ataupun wilayah maritim seperti yang kita temukan sekarang ini terletak di antara dua benua dan dua samudera, antara Benua Asia di utara dan Australia di selatan, antara Samudera Hindia di barat dan Samudera Pasifik di belahan timur. Faktor letak ini memainkan peran strategis sejak zaman kuno sampai sekarang. Namun sebelum itu marilah kita sebentar berkenalan dengan kondisi alamnya, terutama unsur-unsur geologi atau unsurunsur geodinamika yang sangat berperan dalam pembentukan Kepulauan Indonesia.

Menurut para ahli bumi, posisi pulau-pulau di Kepulauan Indonesia terletak di atas tungku api yang bersumber dari magma dalam perut bumi. Inti perut bumi tersebut berupa lava cair bersuhu sangat tinggi. Makin ke dalam tekanan dan suhunya semakin tinggi. Pada suhu yang tinggi itu material-material akan meleleh sehingga material di bagian dalam bumi selalu berbentuk cairan panas. Suhu

tinggi ini terus menerus bergejolak mempertahankan cairan sejak jutaan tahun lalu. Ketika ada celah lubang keluar, cairan tersebut keluar berbentuk lava cair. Ketika lava mencapai permukaan bumi, suhu menjadi lebih dingin dari ribuan derajat menjadi hanya bersuhu normal sekitar 30 derajat. Pada suhu ini cairan lava akan membeku membentuk batuan beku atau kerak. Keberadaan kerak benua (daratan) dan kerak samudera selalu bergerak secara dinamis akibat tekanan magma dari perut bumi. Pergerakan unsur-unsur geodinamika ini dikenal sebagai kegiatan tektonis.

<div>
<figure class="float-right w-1/2 ml-6 mb-4">
<img src="sejarah-x-1_assets/Gambar_1.2.png" alt="" class="mb-5"/>
<figcaption class="prose-sumber">Sumber : J. Tuzo Wilson. 1994. “Lempeng Tektonik” dalam Tony S. Rahmadie (terj). <em>Ilmu Pengetahuan Populer.</em> Jilid 2. Grolier International<br /><p class="prose-figure-caption">Gambar 1.2 Lapisan bumi, mulai dari bagian inti dalam sampai bagian kerak bumi</p></figcaption>
</figure>
<p>Sebagian wilayah di Kepulauan Indonesia merupakan titik temu di antara tiga lempeng, yaitu lempeng Indo-Australia di selatan, Lempeng Eurasia di utara dan Lempeng Pasifik di timur. Pergerakan lempeng-lempeng tersebut dapat berupa subduksi (pergerakan lempeng ke atas), obduksi (pergerakan lempeng ke bawah) dan kolisi (tumbukan lempeng). Pergerakan lain dapat berupa pemisahan atau <em>divergensi</em> (tabrakan) lempeng-lempeng. Pergerakan mendatar berupa pergeseran lempeng-lempeng tersebut masih terus berlangsung hingga sekarang. Perbenturan lempeng-lempeng tersebut menimbulkan dampak yang berbeda-beda. Namun semuanya telah menyebabkan wilayah Kepulauan Indonesia secara tektonis merupakan wilayah yang sangat aktif dan labil hingga rawan gempa sepanjang waktu.</p>
    <p>
Pada masa <em>Paleozoikum</em> (masa kehidupan tertua) keadaan geografis Kepulauan Indonesia belum terbentuk seperti sekarang ini. Di kala itu wilayah ini masih merupakan bagian dari samudera yang sangat luas, meliputi hampir seluruh bumi. Pada fase berikutnya, yaitu pada akhir masa <em>Mesozoikum</em> , sekitar 65 juta tahun lalu, kegiatan tektonis itu menjadi sangat aktif menggerakkan lempenglempeng Indo-Australia, Eurasia dan Pasifik. Kegiatan ini dikenal sebagai fase tektonis ( <em>orogenesa laramy</em> ), sehingga menyebabkan daratan terpecah-pecah. Benua Eurasia menjadi pulau-pulau yang terpisah satu dengan lainnya. Sebagian di antaranya bergerak ke selatan membentuk pulau-pulau Sumatra, Jawa, Kalimantan, Sulawesi serta pulau-pulau di Nusa Tenggara Barat dan Kepulauan Banda. Hal yang sama juga terjadi pada Benua Australia. Sebagian pecahannya bergerak ke utara membentuk pulau-pulau Timor, Kepulauan Nusa Tenggara Timur dan sebagian Maluku Tenggara. Pergerakan pulau-pulau hasil pemisahan dari kedua benua tersebut telah mengakibatkan wilayah pertemuan keduanya sangat labil. Kegiatan tektonis yang sangat aktif dan kuat telah membentuk rangkaian Kepulauan Indonesia pada masa <em>Tersier</em> sekitar 65 juta tahun lalu.
    </p>
</div>

Sebagian besar daratan Sumatra, Kalimantan dan Jawa telah tenggelam menjadi laut dangkal sebagai akibat terjadinya proses kenaikan permukaan laut atau _transgresi_ . Sulawesi pada masa itu sudah mulai terbentuk, sementara Papua sudah mulai bergeser ke utara, meski masih didominasi oleh cekungan sedimentasi laut dangkal berupa paparan dengan terbentuknya endapan batu gamping. Pada kala _Pliosen_ sekitar lima juta tahun lalu, terjadi pergerakan tektonis yang sangat kuat, yang mengakibatkan terjadinya proses pengangkatan permukaan bumi dan kegiatan vulkanis. Ini pada gilirannya menimbulkan tumbuhnya (atau mungkin lebih tepat terbentuk) rangkaian perbukitan struktural seperti perbukitan besar (gunung), dan perbukitan lipatan serta rangkaian gunung api aktif sepanjang gugusan perbukitan itu. Kegiatan

![Gambar 1.3 Pada Kala Eosen (sekitar 55 juta tahun yang lalu) sebagian Kepulauan Indonesia (Sumatra, Jawa, dan Kalimantan) masih berada dan menyatu dengan Benua Eurasia di utara, sedangkan sebagian kepulauan lainnya (Papua) masih menyatu dengan Benua Australia di Selatan.](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0020-02.png)

Sumber : Taufik Abdullah dan A.B Lapian (ed). 2012. _Indonesia Dalam Arus Sejarah_ , Jilid I. Jakarta: PT Ichtiar Baru van Hoeve.

Gambar 1.3 Pada Kala Eosen (sekitar 55 juta tahun yang lalu) sebagian Kepulauan Indonesia (Sumatra, Jawa, dan Kalimantan) masih berada dan menyatu dengan Benua Eurasia di utara, sedangkan sebagian kepulauan lainnya (Papua) masih menyatu dengan Benua Australia di Selatan.

tektonis dan vulkanis terus aktif hingga awal masa _Pleistosen_ , yang dikenal sebagai kegiatan tektonis _Plio-Pleistosen_ . Kegiatan tektonis ini berlangsung di seluruh Kepulauan Indonesia.

Gunung api aktif dan rangkaian perbukitan struktural tersebar di sepanjang bagian barat Pulau Sumatra, berlanjut ke sepanjang Pulau Jawa ke arah timur hingga Kepulauan Nusa Tenggara serta Kepulauan Banda. Kemudian terus membentang sepanjang Sulawesi Selatan dan Utara. Pembentukan daratan yang semakin luas itu telah membentuk Kepulauan Indonesia pada kedudukan pulau-pulau seperti sekarang ini. Hal itu telah berlangsung sejak kala _Pliosen_ hingga awal _Pleistosen_ (1,8 juta tahun lalu). Jadi pulau-pulau di kawasan Kepulauan Indonesia ini masih terus bergerak secara dinamis, sehingga tidak heran jika masih sering terjadi gempa, baik vulkanis maupun tektonis.

Letak Kepulauan Indonesia yang berada pada deretan gunung api membuatnya menjadi daerah dengan tingkat keanekaragaman flora dan fauna yang sangat tinggi. Kekayaan alam dan kondisi geografis ini telah mendorong lahirnya penelitian dari bangsabangsa lain. Dari sekian banyak penelitian terhadap flora dan fauna tersebut yang paling terkenal diantaranya adalah peneliti Alfred Russel Wallace yang membagi Indonesia dalam dua wilayah yang berbeda berdasarkan ciri khusus baik fauna maupun floranya. Pembagian itu adalah Paparan Sahul di sebelah timur, Paparan Sunda di sebelah barat. Zona di antara paparan tersebut kemudian dikenal sebagai wilayah Wallacea yang merupakan pembatas fauna yang membentang dari Selat Lombok hingga Selat Makassar ke arah utara. Fauna-fauna Untuk memperkaya pengetahuan tentang hal ini, yang berada di sebelah barat garis pembatas kamu bisa membaca itu disebut dengan _Indo-Malayan region_ . Di **Russel Wallace.** sebelah timur disebut dengan _Australia Malayan_ **_Nusantara._** _region_ . Garis itulah yang kemudian kita kenal dengan Garis Wallacea.

Untuk memperkaya pengetahuan tentang hal ini, kamu bisa membaca **Alfred Russel Wallace.** **_Kepulauan Nusantara._**

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0021-03.png)

Sumber : Storm (2001) diambil dari Taufik Abdullah dan A.B Lapian (ed). 2012. _Indonesia Dalam Arus Sejarah_ . jilid I. Jakarta: PT Ichtiar Baru van Hoeve.

Gambar 1.4 Peta Zoogeografi Kepulauan Indonesia

### Uji Kompentensi

1. Kita wajib bersyukur karena Tuhan Yang Maha Pencipta yang telah menciptakan bumi kita ini dengan arif dan bijaksana serta penuh kasih sayang kepada makhluk ciptaan-Nya. Coba beri penjelasan, kamu dapat berdiskusi dengan anggota kelompokmu!

2. Menurut kamu nilai-nilai apa yang dapat dipetik dari proses terbentuknya pulau-pulau di Kepulauan Indonesia?

3. Hikmah apa yang dapat kita peroleh dengan bertempat tinggal di wilayah yang sering terjadi bencana alam?

4. Di setiap daerah tentu ada cerita rakyat ataupun dongeng yang berkaitan dengan gempa bumi maupun gunung meletus, coba kamu cari dan tuliskan dalam bentuk cerita 3 – 4 halaman, kemudian diskusikan.

5. Sebutkan gunung api yang pernah meletus di daerahmu dan di Indonesia!

| No  | Nama Gunung | Jumlah korban jiwa atau rumah | Tahun Meletus |
| --- | ----------- | ----------------------------- | ------------- |
| 1   |             |                               |               |
| 2   |             |                               |               |
| 3   |             |                               |               |
| 4   |             |                               |               |

6. Sebutkan bencana alam (tektonik) yang pernah terjadi di daerahmu dan di Indonesia

| No  | Nama Gunung | Jumlah korban jiwa atau rumah | Tahun Meletus |
| --- | ----------- | ----------------------------- | ------------- |
| 1   |             |                               |               |
| 2   |             |                               |               |
| 3   |             |                               |               |
| 4   |             |                               |               |

## C. Mengenal Manusia Purba

### Mengamati lingkungan

<div>
<figure class="float-right w-1/2 ml-6 mb-4">
<img src="sejarah-x-1_assets/Gambar_1.5.png" alt="" class="mb-5"/>
<figcaption class="prose-sumber">
Sumber : Direktorat Geografi Sejarah. 2009. <em>Atlas Prasejarah Indonesia Masa Islam,</em> Jakarta: Kementerian Kebudayaan dan Pariwisata.<br /><p class="prose-figure-caption">Gambar 1.5 Litologi, Stratigrafi dan Lingkungan Purba Sangiran</p></figcaption>
</figure>
  <p>
Pernahkah kamu mendengar tentang Situs Manusia Purba Sangiran? Kini Situs Manusia Purba Sangiran telah ditetapkan oleh UNESCO sebagai warisan budaya dunia, tentu ini sangat membanggakan bangsa Indonesia. Pengakuan tersebut tentu didasari berbagai pertimbangan yang kompleks. Satu di antaranya karena di wilayah tersebut tersimpan ribuan peninggalan manusia purba yang menunjukkan proses kehidupan manusia dari masa lalu. Sangiran telah menjadi sentra kehidupan manusia purba. Berbagai penelitian dari para ahli juga dilakukan di sekitar Sangiran. Beberapa temuan fosil di Sangiran telah mendorong para ahli untuk terus melakukan penelitian termasuk di luar Sangiran.
  </p>
</div>

Dari Sangiran kita mengenal beberapa jenis manusia purba di Indonesia. Setelah ditetapkan sebagai warisan dunia, Situs Manusia Purba Sangiran dikembangkan sebagai pusat penelitian dalam negeri dan luar negeri, serta sebagai tempat wisata. Selain itu Sangiran juga memberi manfaat kepada masyarakat di sekitarnya, karena pariwisata di daerah tersebut.

Untuk memahami jenis dan ciri-ciri manusia purba di Indonesia mari kita telaah bacaan berikut ini.

### Memahami Teks

Peninggalan manusia purba untuk sementara ini yang paling banyak ditemukan berada di Pulau Jawa. Meskipun di daerah lain tentu juga ada, tetapi para peneliti belum berhasil menemukan tinggalan tersebut atau masih sedikit yang berhasil ditemukan, misalnya di Flores. Di bawah ini akan dipaparkan beberapa penemuan penting fosil manusia di beberapa tempat.

### 1. Sangiran

Perjalanan kisah perkembangan manusia di dunia tidak dapat kita lepaskan dari keberadaan bentangan luas perbukitan tandus yang berada diperbatasan Kabupaten Sragen dan Kabupaten Karanganyar. Lahan itu dikenal dengan nama Situs Sangiran. Di dalam buku Harry Widianto dan Truman Simanjuntak, _Sangiran Menjawab Dunia_ diterangkan bahwa Sangiran merupakan sebuah kompleks situs manusia purba dari Kala Pleistosen yang paling lengkap dan paling penting di Indonesia, dan bahkan di Asia. Lokasi tersebut merupakan pusat perkembangan manusia dunia,

yang memberikan petunjuk tentang keberadaan manusia sejak 150.000 tahun yang lalu. Situs Sangiran itu mempunyai luas delapan kilometer pada arah utara-selatan dan tujuh kilometer arah timur-barat. Situs Sangiran merupakan suatu kubah raksasa yang berupa cekungan besar di pusat kubah akibat adanya erosi di bagian puncaknya. Kubah raksasa itu diwarnai dengan perbukitan yang bergelombang. Kondisi deformasi geologis itu menyebabkan tersingkapnya berbagai lapisan batuan yang mengandung fosil-fosil manusia purba dan binatang, termasuk artefak. Berdasarkan materi tanahnya, Situs Sangiran berupa endapan lempung hitam dan pasir fluviovolkanik, tanahnya tidak subur dan terkesan gersang pada musim kemarau.

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0024-07.png)

Sumber : Phillip V. Tobias, _Paläontologische Zeitschrift_ , December 1983, Volume 57.

Gambar 1.6 Von Koeningswald.

Sangiran pertama kali ditemukan oleh P.E.C. Schemulling tahun 1864, dengan laporan penemuan fosil vertebrata dari Kalioso, bagian dari wilayah Sangiran. Semenjak dilaporkan Schemulling situs itu seolah-olah terlupakan dalam waktu yang lama. Eugene Dubois juga pernah datang ke Sangiran, akan tetapi ia kurang tertarik dengan temuan-temuan di wilayah Sangiran. Pada 1934, G.H.R von Koenigswald menemukan artefak litik di wilayah Ngebung yang terletak sekitar dua km di barat laut kubah Sangiran. Artefak litik itulah yang kemudian menjadi temuan penting bagi Situs Sangiran. Semenjak penemuan von Koenigswald, Situs Sangiran menjadi sangat terkenal berkaitan dengan penemuan-penemuan fosil _Homo erectus_ secara sporadis dan berkesinambungan. _Homo erectus_ adalah takson paling penting dalam sejarah manusia, sebelum masuk pada tahapan manusia _Homo sapiens_ , manusia modern.

Situs Sangiran tidak hanya memberikan gambaran tentang evolusi fisik manusia saja, akan tetapi juga memberikan gambaran nyata tentang evolusi budaya, binatang, dan juga lingkungan. Beberapa fosil yang ditemukan dalam seri geologis-stratigrafis yang diendapkan tanpa terputus selama lebih dari dua juta tahun, menunjukan tentang hal itu. Situs Sangiran telah diakui sebagai salah satu pusat evolusi manusia di dunia. Situs itu ditetapkan secara resmi sebagai Warisan Dunia pada 1996, yang tercantum dalam nomor 593 Daftar Warisan Dunia ( _World Heritage List_ ) UNESCO.

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0025-05.png)

Sumber : Dok. Harry WIdianto Balai Pelestarian Situs Manusia Purba Saingiran.

Gambar 1.7 Fosil Manusia Purba yang ditemukan di Sangiran

Perhatikan baik-baik gambar fosil manusia purba di samping, fosil itu juga disebut sebagai Sangiran 17 sesuai dengan nomor seri penemuannya. Fosil itu merupakan fosil _Homo erectus_ yang terbaik di Sangiran. Ia ditemukan di endapan pasir fluvio-volkanik di Pucang, bagian wilayah Sangiran. Fosil itu merupakan dua di antara _Homo erectus_ di dunia yang masih lengkap dengan mukanya. Satu ditemukan di Sangiran dan satu lagi di Afrika.

### 2. Trinil, Ngawi, Jawa Timur

Trinil adalah sebuah desa di pinggiran Bengawan Solo, masuk wilayah administrasi Kabupaten Ngawi, Jawa Timur. Tinggalan purbakala telah lebih dulu ditemukan di daerah ini jauh sebelum von Koenigswald menemukan Sangiran pada 1934. Ekskavasi yang dilakukan oleh Eugene Dubois di Trinil telah membawa penemuan sisa-sisa manusia purba yang sangat berharga bagi dunia pengetahuan. Penggalian Dubois dilakukan pada endapan alluvial Bengawan Solo. Dari lapisan ini ditemukan atap tengkorak _Pithecanthropus erectus_ , dan beberapa buah tulang paha (utuh dan fragmen) yang menunjukkan pemiliknya telah berjalan tegak.

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0026-03.png)

Sumber : Harry Widianto dan Truman Simanjuntak. 2011. _Sangiran Menjawab Dunia (Edisi Khusus)._ Jawa Tengah: Balai Pelastarian Situs Manusia Purba Sangiran

Gambar 1.8 Eugene Dubois yang dalam hidupnya banyak diabdikan untuk menggali fosil manusia purba

Tengkorak _Pithecanthropus erectus_ dari Trinil sangat pendek tetapi memanjang ke belakang. Volume otaknya sekitar 900 cc, di antara otak kera (600 cc) dan otak manusia modern (1.200-1.400 cc). Tulang kening sangat menonjol dan di bagian belakang mata, terdapat penyempitan yang sangat jelas, menandakan otak yang belum berkembang. Pada bagian belakang kepala terlihat bentuk yang meruncing yang diduga pemiliknya merupakan perempuan. Berdasarkan kaburnya sambungan perekatan antar tulang kepala, ditafsirkan inividu ini telah mencapai usia dewasa. Selain tempattempat di atas, peninggalan manusia purba tipe ini juga ditemukan di Perning, Mojokerto, Jawa Timur; Ngandong, Blora, Jawa Tengah; Sambungmacan, Sragen, Jawa Tengah.

Berdasarkan beberapa penelitian yang dilakukan oleh para ahli, dapatlah direkonstruksi beberapa jenis manusia purba yang pernah hidup di zaman praaksara.

### 1. Jenis Meganthropus

Jenis manusia purba ini terutama berdasarkan penelitian von Koenigswald di Sangiran tahun 1936 dan 1941 yang menemukan fosil rahang manusia yang berukuran besar. Dari hasil rekonstruksi ini kemudian para ahli menamakan jenis manusia ini dengan sebutan _Meganthropus paleojavanicus_ , artinya manusia raksasa dari Jawa. Jenis manusia purba ini memiliki ciri rahang yang kuat dan badannya tegap. Diperkirakan makanan jenis manusia ini adalah tumbuhtumbuhan. Masa hidupnya diperkirakan pada zaman Pleistosen Awal.

### 2. Jenis Pithecanthropus

<div>
<figure class="float-right w-1/2 ml-6 mb-4">
<img src="sejarah-x-1_assets/Gambar_1.9.png" alt="" class="mb-5"/>
<figcaption class="prose-sumber">
Sumber : Taufik Abdullah dan A.B Lapian (ed). 2012. <em>Indonesia Dalam Arus Sejarah</em> . jilid I. Jakarta: PT Ichtiar Baru van Hoeve.
<br /><p class="prose-figure-caption">
Gambar 1.9 Tengkorak <em>Pithecanthropus erectus</em> yang ditemukan di Trinil</p></figcaption>
</figure>
<p>Jenis manusia ini didasarkan pada penelitian Eugene Dubois tahun 1890 di dekat Trinil, sebuah desa di pinggiran Bengawan Solo, di wilayah Ngawi. Setelah direkonstruksi terbentuk kerangka manusia, tetapi masih terlihat tanda-tanda kera. Oleh karena itu jenis ini dinamakan <em>Pithecanthropus erectus</em> , artinya manusia kera yang berjalan tegak. Jenis ini juga ditemukan di Mojokerto, sehingga disebut <em>Pithecanthropus mojokertensis</em> . Jenis manusia purba yang juga terkenal sebagai rumpun <em>Homo erectus</em> ini paling banyak ditemukan di Indonesia. Diperkirakan jenis manusia purba ini hidup dan berkembang sekitar zaman Pleistosen Tengah.</p>
</div>

### 3. Jenis Homo

Fosil jenis Homo ini pertama diteliti oleh von Reitschoten di Wajak. Penelitian dilanjutkan oleh Eugene Dubois bersama kawan-kawan dan menyimpulkan sebagai jenis Homo. Ciri-ciri jenis manusia Homo ini muka lebar, hidung dan mulutnya menonjol. Dahi juga masih menonjol, sekalipun tidak semenonjol jenis Pithecanthropus. Bentuk fisiknya tidak jauh berbeda dengan manusia sekarang. Hidup dan perkembangan jenis manusia ini sekitar 40.000 – 25.000 tahun yang lalu. Tempat-tempat penyebarannya tidak hanya di Kepulauan Indonesia tetapi juga di Filipina dan Cina Selatan.

Uraian mengenai jenis-jenis manusia ini selengkapnya dapat juga dibaca pada buku **Harry Widianto dan Truman Simanjuntak,** **_Sangiran Menjawab Dunia_**

<div>
<figure class="float-right w-1/2 ml-6 mb-4">
<img src="sejarah-x-1_assets/Gambar_1.10.png" alt="" class="mb-5"/>
<figcaption class="prose-sumber">
Sumber : Taufik Abdullah dan A.B Lapian (ed). 2012. <em>Indonesia Dalam Arus Sejarah</em> . jilid I. Jakarta: PT Ichtiar Baru van Hoeve.
<br /><p class="prose-figure-caption">
Gambar 1.10 <em>Homo erectus</em> , <em>Homonid</em> yang lebih maju</p></figcaption>
</figure>
<p><em>Homo sapiens</em> artinya ‘manusia sempurna’ baik dari segi fisik, volume otak maupun postur badannya yang secara umum tidak jauh berbeda dengan manusia modern. Kadang-kadang <em>Homo sapiens</em> juga diartikan dengan ‘manusia bijak’ karena telah lebih maju dalam berfikir dan menyiasati tantangan alam. Bagaimanakah mereka muncul ke bumi pertama kali dan kemudian menyebar dengan cepat ke berbagai penjuru dunia hingga saat ini? Para ahli paleoanthropologi dapat melukiskan perbedaan morfologis antara <em>Homo sapiens</em> dengan pendahulunya, <em>Homo erectus</em> . Rangka <em>Homo sapiens</em> kurang kekar posturnya dibandingkan <em>Homo erectus</em> . Salah satu alasannya karena tulang belulangnya tidak setebal dan sekompak <em>Homo erectus</em>.</p> Hal ini mengindikasikan bahwa secara fisik _Homo sapiens_ jauh lebih lemah dibanding sang pendahulu tersebut. Di lain pihak, ciri-ciri morfologis maupun biometriks _Homo sapiens_ menunjukkan karakter yang lebih berevolusi dan lebih modern dibandingkan dengan _Homo erectus_ . Sebagai misal, karakter evolutif yang paling signifikan adalah bertambahnya kapasitas otak. _Homo sapiens_ mempunyai kapasitas otak yang jauh lebih besar (rata-rata 1.400 cc), dengan atap tengkorak yang jauh lebih bundar dan lebih tinggi dibandingkan dengan _Homo erectus_ yang mempunyai tengkorak panjang dan rendah, dengan kapasitas otak 1.000 cc. Segi-segi morfologis dan tingkatan kepurbaannya menunjukkan ada perbedaan yang sangat nyata antara kedua spesies dalam genus Homo tersebut. _Homo sapiens_ akhirnya tampil sebagai spesies yang sangat tangguh dalam beradaptasi dengan lingkungannya, dan dengan cepat menghuni berbagai permukaan dunia ini. Berdasarkan bukti-bukti penemuan, sejauh ini manusia modern awal di Kepulauan Indonesia dan Asia Tenggara paling tidak telah hadir sejak 45.000 tahun yang lalu. Dalam perkembangannya, kehidupan manusia modern ini dapat dikelompokkan dalam tiga tahap, yaitu (i) kehidupan manusia modern awal yang kehadirannya hingga akhir zaman es (sekitar 12.000 tahun lalu), kemudian dilanjutkan oleh (ii) kehidupan manusia modern yang lebih belakangan, dan berdasarkan karakter fisiknya dikenal sebagai ras Austromelanesoid. (iii) mulai di sekitar 4000 tahun lalu muncul penghuni baru di Kepulauan Indonesia yang dikenal sebagai penutur bahasa Austronesia. Berdasarkan karakter fisiknya, makhluk manusia ini tergolong dalam ras Mongolid. Ras inilah yang kemudian berkembang hingga menjadi bangsa Indonesia sekarang.
</div>

Beberapa spesimen (penggolongan) manusia _Homo sapiens_ dapat dikelompokkan sebagai berikut,

#### a. Manusia Wajak

Manusia Wajak ( _Homo wajakensis_ ) merupakan satusatunya temuan di Indonesia yang untuk sementara dapat disejajarkan perkembangannya dengan manusia modern awal dari akhir Kala Pleistosen. Pada tahun 1889, manusia Wajak ditemukan oleh B.D. van Rietschoten di sebuah ceruk di lereng pegunungan karst di barat laut Campurdarat, dekat Tulungagung, Jawa Timur.

#### b. Manusia Liang Bua

Pengumuman tentang penemuan manusia _Homo floresiensis_ tahun 2004 menggemparkan dunia ilmu pengetahuan. Sisa-sisa manusia ditemukan di sebuah gua Liang Bua oleh tim peneliti gabungan Indonesia dan Australia. Sebuah gua permukiman prasejarah di Flores. Liang Bua bila diartikan secara harfiah merupakan sebuah gua yang dingin. Sebuah gua yang sangat lebar dan tinggi dengan permukaan tanah yang datar, merupakan tempat bermukim yang nyaman bagi manusia pada masa praaksara. Hal itu bisa dilihat dari kondisi lingkungan sekitar gua yang sangat indah,

<div class="grid sm:grid-cols-2 gap-6">
<div>

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0030-06.png)

Gambar 1.11 Fosil Tengkorak Manusia Purba Flores

Sumber : Direktorat Geografi Sejarah. 2009. _Atlas Prasejarah Indonesia Masa Islam,_ Jakarta: Kementerian Kebudayaan dan Pariwisata.

</div>
<div>

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0030-09.png)

Gambar 1.12 Fosil Geraham Flores

Sumber : Direktorat Geografi Sejarah. 2009. _Atlas Prasejarah Indonesia Masa Islam,_ Jakarta: Kementerian Kebudayaan dan Pariwisata.

</div>
</div>

yang berada di sekitar bukit dengan kondisi tanah yang datar di depannya. Liang Bua merupakan sebuah temuan manusia modern awal dari akhir masa Pleistosen di Indonesia yang menakjubkan yang diharapkan dapat menyibak asal usul manusia di Kepulauan Indonesia.

Manusia Liang Bua ditemukan oleh Peter Brown dan Mike J. Morwood pada bulan September 2003 lalu. Temuan itu dianggap sebagai penemuan spesies baru yang kemudian diberi nama _Homo floresiensis_ , sesuai dengan tempat ditemukannya fosil manusia Liang Bua.

Pada tahun 1950-an, Th. Verhoeven lebih dahulu menemukan beberapa fragmen tulang manusia di Liang Bua. Saat itu ia menemukan tulang iga yang berasosiasi dengan berbagai alat serpih dan gerabah. Tahun 1965, ditemukan tujuh buah rangka manusia beserta beberapa bekal kubur yang antara lain berupa beliung dan barang-barang gerabah. Diperkirakan Liang Bua merupakan sebuah situs neolitik dan paleometalik. Manusia Liang Bua mempunyai ciri kamu juga dapat membaca tengkorak yang panjang dan rendah, buku **Adrian B. Lapian (ed),** berukuran kecil, dengan volume otak **_Indonesia Dalam Arus_** 380 cc. Kapasitas kranial tersebut berada **_Sejarah,_ Jilid I,** jauh di bawah _Homo erectus_ (1.000 cc), manusia modern _Homo sapiens_ (1.400 **Simanjuntak,** **_Setelah Sangiran_** cc), dan bahkan berada di bawah volume **Khusus).** otak simpanse (450 cc).

Untuk memahami lebih lanjut, kamu juga dapat membaca buku **Taufik Abdullah dan Adrian B. Lapian (ed),** **_Indonesia Dalam Arus Sejarah,_ Jilid I,** dan **buku Harry Widianto dan Truman Simanjuntak,** **_Jejak Langkah Setelah Sangiran_ (Edisi Khusus).**

### Uji Kompentensi

1. Mengapa para ahli melakukan penelitian manusia purba banyak di bantaran sungai?

2. Jelaskan ciri dan mengapa hasil penelitian Dubois di Trinil disebut sebagai jenis _Pithecanthropus erectus_ (kera yang berjalan tegak)?

3. Menurut pendapat kamu, bagaimana manusia purba bisa menyebar ke dalam wilayah Kepulauan Indonesia bahkan sampai ke luar wilayah Kepulauan Indonesia?

4. Coba buatlah karya ilmiah (2–3 halaman) dengan tajuk, Sangiran Laboratorium Manusia Purba.

5. Coba kamu inventarisir berbagai situs dan tinggalan manusia purba di daerahmu masing-masing.

| No     | Nama situs | Fungsi pada<br>masa lalu | Fungsi pada masa<br>sekarang | Letak (Kecamatan<br>atau Kabupaten) |
| ------ | ---------- | ------------------------ | ---------------------------- | ----------------------------------- |
| 1<br>2 |            |                          |                              |                                     |
| 3      |            |                          |                              |                                     |
| 4      |            |                          |                              |                                     |
| 5      |            |                          |                              |                                     |

## D. Perkembangan Teknologi

### Mengamati Lingkungan

Coba amati gambar di samping. Gambar apa dan untuk apa kira-kira? Gambar itu merupakan gambar peralatan rumah tangga yang sudah sangat lama dikenal di lingkungan ibu rumah tangga di Indonesia, apalagi di Jawa. Yang jelas peralatan itu terbuat dari batu yang merupakan warisan nenek moyang. Peralatan dari batu ini sampai sekarang masih digunakan oleh masyarakat kita

Berikut ini kita akan membahas tentang teknologi bebatuan yang telah dikembangkan sejak kehidupan manusia purba.

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0033-05.png)

Gambar 1.13 Cobek, peralatan dari batu yang masih digunakan sampai sekarang

Sumber : Florentina Lenny Kristiani dalam http://klubnova.tabloidnova.com/KlubNova/ Artikel/Aneka-Tips/Tips-Rumah/Cara-pilih-cobekbatu diunduh tanggal 19 Mei 2013, pukul 10:09

### Memahami Teks

Perlu kamu ketahui bahwa sekalipun belum mengenal tulisan manusia purba sudah mengembangkan kebudayaan dan teknologi. Teknologi waktu itu bermula dari teknologi bebatuan yang digunakan sebagai alat untuk memenuhi kebutuhan. Dalam praktiknya peralatan atau teknologi bebatuan tersebut dapat berfungsi serba guna. Pada tahap paling awal alat yang digunakan masih bersifat kebetulan dan seadanya serta bersifat _trial and eror._ Mula-mula mereka hanya menggunakan benda-benda dari alam terutama batu. Teknologi bebatuan pada zaman ini berkembang dalam kurun waktu yang begitu panjang. Oleh karena itu, para ahli kemudian membagi kebudayaan zaman batu di era praaksara ini menjadi beberapa zaman atau tahap perkembangan. Dalam buku R. Soekmono, _Pengantar Sejarah Kebudayaan Indonesia I,_ dijelaskan bahwa kebudayaan zaman batu ini dibagi menjadi tiga yaitu, _Paleolitikum, Mesolitikum dan Neolitikum._

### 1. Antara Batu dan Tulang

Peralatan pertama yang digunakan oleh manusia purba adalah alat-alat dari batu yang seadanya dan juga dari tulang. Peralatan ini berkembang pada zaman _paleolitikum_ atau zaman batu tua. Zaman batu tua ini bertepatan dengan zaman _neozoikum_ terutama pada akhir zaman _Tersier_ dan awal zaman _Quartair_ . Zaman ini berlangsung sekitar 600.000 tahun yang lalu. Zaman ini merupakan zaman yang sangat penting karena terkait dengan munculnya kehidupan baru, yakni munculnya jenis manusia purba. Zaman ini dikatakan zaman batu tua karena hasil kebudayaan terbuat dari batu yang relatif masih sederhana dan kasar. Kebudayaan zaman _Paleolitikum_ ini secara umum ini terbagi menjadi Kebudayaan Pacitan dan Kebudayaan Ngandong.

##### a. Kebudayaan Pacitan

<div class="grid sm:grid-cols-2 gap-6">

<div>

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0034-04.png)

Gambar 1.14 _Kapak perimbas (chopper):_ Alat batu inti atau serpih yang dicirikan oleh tajaman monofasial yang membulat, lonjong, atau lurus, dihasilkan melalui pangkasan pada satu bidang dari sisi ujung (distal) ke arah pangkal (proksimal). Ciri yang membedakan kapak perimbas dengan serut adalah ukuran dimana serut yang kasar dan masif digolongkan sebagai kapak perimbas, sementara yang halus dan kecil digolongkan serut.

Sumber: Direktorat Geografi Sejarah. 2009. _Atlas Prasejarah Indonesia_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.

</div>

<div>

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0034-06.png)

Gambar 1.15 _Pahat genggam (hand adze):_ Alat batu inti yang dicirikan oleh bentuk alat yang persegi atau bujur sangkar dengan tajaman yang tegak lurus pada sumbu alat. Selain itu dikenal pula _Kapak genggam awal (proto-hand axe), Kapak genggam (hand axe)._

Sumber: Direktorat Geografi Sejarah. 2009. _Atlas Prasejarah Indonesia_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.

</div>

</div>

Kebudayaan ini berkembang di daerah Pacitan, Jawa Timur. Beberapa alat dari batu ditemukan di daerah ini. Seorang ahli, von Koenigwald dalam penelitiannya pada tahun 1935 telah menemukan beberapa hasil teknologi bebatuan atau alat-alat dari batu di daerah Punung. Alat batu itu masih kasar, dan bentuk ujungnya agak runcing, tergantung kegunaannya. Alat batu ini sering disebut dengan kapak genggam atau kapak perimbas. Kapak ini digunakan untuk menusuk binatang atau menggali tanah saat mencari umbi-umbian. Di samping kapak perimbas, di Pacitan juga ditemukan alat batu yang disebut dengan _chopper_ sebagai alat penetak. Di Pacitan juga ditemukan alat-alat serpih.

#### b. Kebudayaan Ngandong

Kebudayaan Ngandong berkembang di daerah Ngandong dan juga Sidorejo, dekat Ngawi. Di daerah ini banyak ditemukan alat-alat dari batu dan juga alat-alat dari tulang. Alat-alat dari tulang ini berasal dari tulang binatang dan tanduk rusa yang diperkirakan digunakan sebagai penusuk atau belati. Selain itu, ditemukan juga alat-alat seperti tombak yang bergerigi. Di Sangiran juga ditemukan
<div class="grid sm:grid-cols-2 gap-6">
<div>

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0035-04.png)

Gambar 1.16 Artefak dari tulang

Sumber : Taufik Abdullah dan A.B Lapian (ed). 2012. _Indonesia Dalam Arus Sejarah_ . jilid I. Jakarta: PT Ichtiar Baru van Hoeve. Jakarta

</div>
<div>

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0035-07.png)

Gambar 1.17 Artefak jenis flakke

Sumber: Harry Widianto dan Truman Simanjuntak. 2011. _Sangiran Menjawab Dunia (Edisi Khusus)._ Jawa Tengah: Balai Pelastarian Situs Manusia Purba Sangiran

</div>
</div>

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0036-02.png)

Gambar 1.18 Artefak yang ditemukan di situs Ngebung

Sumber: Direktorat Geografi Sejarah. 2009. _Atlas Prasejarah Indonesia_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.

alat-alat dari batu, bentuknya indah seperti _kalsedon_ . Alatalat ini sering disebut dengan _flakke._

Sebaran artefak dan peralatan paleolitik cukup luas sejak dari daerah-daerah di Sumatra, Kalimantan, Sulawesi, Bali, Nusa Tenggara Barat (NTB), Nusa Tenggara Timur (NTT), dan Halmahera.

### 2. Antara Pantai dan Gua

Zaman batu terus berkembang memasuki zaman batu madya atau batu tengah yang dikenal zaman _mesolitikum._ Hasil kebudayaan batu madya ini sudah lebih maju apabila dibandingkan hasil kebudayaan zaman _paleolitikum_ . Sekalipun demikian bentuk dan hasil-hasil kebudayaan zaman _paleolitikum_ (batu tua) tidak serta merta punah tetapi mengalami penyempurnaan. Bentuk

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0037-01.png)

Gambar 1.19 Kjokkenmoddinger yang terdapat di Pulau Bintan, Kep. Riau

Sumber: Direktorat Geografi Sejarah. 2009. _Atlas Prasejarah Indonesia_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.

_flakke_ dan alat-alat dari tulang terus mengalami perkembangan. Secara garis besar kebudayaan _mesolitikum_ ini terbagi menjadi dua kelompok besar yang ditandai lingkungan tempat tinggal, yakni di pantai dan di gua.

##### a. Kebudayaan Kjokkenmoddinger.

_Kjokkenmoddinger_ istilah dari bahasa Denmark, _kjokken_ berarti dapur dan _modding_ dapat diartikan sampah ( _kjokkenmoddinger_ = sampah dapur). Dalam kaitannya dengan budaya manusia, _kjokkenmoddinger_ merupakan tumpukan timbunan kulit siput dan kerang yang menggunung di sepanjang pantai Sumatra Timur antara Langsa di Aceh sampai Medan. Dengan _kjokkenmoddinger_ ini dapat memberi informasi bahwa manusia purba zaman _mesolitikum_ umumnya
<div class="grid sm:grid-cols-2 gap-6">
<div>

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0037-07.png)

Gambar 1.20 Kapak Genggam

Sumber : Taufik Abdullah dan A.B Lapian (ed). 2012. _Indonesia Dalam Arus Sejarah_ . jilid I. Jakarta. PT Ichtiar Baru van Hoeve

</div>
<div>

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0038-01.png)

Gambar 1.21 Batu Pipihan

Sumber : Taufik Abdullah dan A.B Lapian (ed). 2012. _Indonesia Dalam Arus Sejarah_ . jilid I. Jakarta: PT Ichtiar Baru van Hoeve. Jakarta

</div>
</div>

bertempat tinggal di tepi pantai. Pada tahun 1925 Von Stein Callenfals melakukan penelitian di bukit kerang itu dan menemukan jenis kapak genggam ( _chopper_ ) yang berbeda dari _chopper_ yang ada di zaman _paleolitikum_ . Kapak genggam yang ditemukan di bukit kerang di pantai Sumatra Timur ini diberi nama _pebble_ atau lebih dikenal dengan Kapak Sumatra. Kapak jenis _pebble_ ini terbuat dari batu kali yang pecah, sisi luarnya dibiarkan begitu saja dan sisi bagian dalam dikerjakan sesuai dengan keperluannya. Di samping kapak jenis _pebble_ juga ditemukan jenis kapak pendek dan jenis batu pipisan (batu-batu alat penggiling). Di Jawa batu pipisan ini umumnya untuk menumbuk dan menghaluskan jamu.

#### b. Kebudayaan Abris Sous Roche

Kebudayaan _abris sous roche_ merupakan hasil kebudayaan yang ditemukan di gua-gua. Hal ini mengindikasikan bahwa manusia purba pendukung kebudayaan ini tinggal di gua-gua. Kebudayaan ini pertama kali dilakukan penelitian oleh Von Stein Callenfels di Gua Lawa dekat Sampung, Ponorogo. Penelitian dilakukan tahun 1928 sampai 1931. Beberapa hasil teknologi bebatuan yang ditemukan misalnya ujung panah, dan _flakke,_ batu penggilingan. Juga ditemukan alatalat dari tulang dan tanduk rusa. Kebudayaan _abris sous roche_ ini banyak ditemukan misalnya di Besuki, Bojonegoro, juga di daerah Sulawesi Selatan seperti di Lamoncong.

Untuk mengetahui lebih dalam tentang Kebudayaan _Kjokkenmoddinger_ dan Kebudayaan _Abris Sous Roche ini_ kamu dapat membaca buku **R. Soekmono,** **_Pengantar Sejarah Kebudayaan I_**

### 3. Sebuah Revolusi

Perkembangan zaman batu yang dapat dikatakan paling penting dalam kehidupan manusia adalah zaman batu baru atau _neolitikum._ Pada zaman _neolitikum_ yang juga dapat dikatakan sebagai zaman batu muda. Pada zaman ini telah terjadi “revolusi kebudayaan”, yaitu terjadinya perubahan pola hidup manusia. Pola hidup _food gathering_ digantikan dengan pola _food producing._ Hal ini seiring dengan terjadinya perubahan jenis pendukung kebudayaanya. Pada zaman ini telah hidup jenis _Homo sapiens_ sebagai pendukung kebudayaan zaman batu baru. Mereka mulai mengenal bercocok tanam dan beternak sebagai proses untuk menghasilkan atau memproduksi bahan makanan. Hidup bermasyarakat dengan bergotong royong mulai dikembangkan. Hasil kebudayaan yang terkenal di zaman _neolitikum_ ini secara garis besar dibagi menjadi dua tahap perkembangan.

Gambar 1.22 Kapak persegi

Sumber : Taufik Abdullah dan A.B Lapian (ed). 2012. _Indonesia Dalam Arus Sejarah._ jilid I. Jakarta: PT Ichtiar Baru van Hoeve

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0039-06.png)

Gambar 1.23 Batu asahan

Sumber : Taufik Abdullah dan A.B Lapian (ed). 2012. _Indonesia Dalam Arus Sejarah._ jilid I. Jakarta: PT Ichtiar Baru van Hoeve

#### a. Kebudayaan kapak persegi

Nama kapak persegi berasal dari penyebutan oleh von Heine Gelderen. Penamaan ini dikaitkan dengan bentuk alat tersebut. Kapak persegi ini berbentuk persegi panjang dan ada juga yang berbentuk trapesium. Ukuran alat ini juga bermacam-macam. Kapak persegi yang besar sering disebut dengan _beliung_ atau _pacul_ (cangkul), bahkan sudah ada yang diberi tangkai sehingga persis seperti cangkul zaman sekarang. Sementara yang berukuran kecil dinamakan _tarah_ atau

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0039-11.png)

Gambar 1.24 Kapak persegi

Sumber : Direktorat Geografi Sejarah. _Atlas Prasejarah_ . Jakarta: Kementerian Kebudayaan dan Pariwisata. 2009

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0040-01.png)

Gambar 1.25 Gerabah

Sumber: Direktorat Geografi Sejarah. 2009. _Atlas Prasejarah Indonesia_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0040-04.png)

Gambar 1.26 Perhiasan Batu

Sumber: Direktorat Permuseuman. 1997. _Untaian Manik-Manik Nusantara_ . Jakarta: Departemen Pendidikan dan Kebudayaan.

tatah. Penyebaran alat-alat ini terutama di Kepulauan Indonesia bagian barat, seperti Sumatra, Jawa dan Bali. Diperkirakan sentrasentra teknologi kapak persegi ini ada di Lahat (Palembang), Bogor, Sukabumi, Tasikmalaya (Jawa Barat), kemudian Pacitan-Madiun, dan di Lereng Gunung Ijen (Jawa Timur). Yang menarik, di Desa Pasirkuda dekat Bogor juga ditemukan batu asahan. Kapak persegi ini cocok sebagai alat pertanian.

#### b. Kebudayaan kapak lonjong

Nama kapak lonjong ini disesuaikan dengan bentuk penampang alat ini yang berbentuk lonjong. Bentuk keseluruhan alat ini lonjong seperti bulat telur. Pada ujung yang _lancip_ ditempatkan tangkai dan pada bagian ujung yang lain diasah sehingga tajam. Kapak yang ukuran besar sering disebut _walzenbeil_ dan yang kecil dinamakan _kleinbeil._ Penyebaran jenis kapak lonjong ini terutama di Kepulauan Indonesia bagian timur, misalnya di daerah Papua, Seram, dan Minahasa.

Pada zaman _neolitikum,_ di samping berkembangnya jenis kapak batu juga ditemukan barang-barang perhiasan, seperti gelang dari batu, juga alat-alat gerabah atau tembikar.

Perlu kamu ketahui bahwa manusia purba waktu itu sudah memiliki pengetahuan tentang kualitas bebatuan untuk peralatan. Penemuan dari berbagai situs menunjukkan bahan yang paling sering dipergunakan adalah jenis batuan kersikan ( _silicified stones_ ), seperti gamping kersikan, tufa kersikan, kalsedon,

dan jasper. Jenis-jenis batuan ini di samping keras, sifatnya yang retas dengan pecahan yang cenderung tajam dan tipis, sehingga memudahkan pengerjaan. Di beberapa situs yang mengandung fosil-fosil kayu, seperti di Kali Baksoka (Jawa Timur) dan Kali Ogan (Sumatra Selatan) tampak ada upaya pemanfaatan fosil untuk bahan peralatan. Pada saat lingkungan tidak menyediakan bahan yang baik, ada kecenderungan untuk memanfaatkan batuan yang tersedia di sekitar hunian, walaupun kualitasnya kurang baik. Contoh semacam ini dapat diamati pada situs Kedunggamping di sebelah timur Pacitan, Cibaganjing di Cilacap, dan Kali Kering di Sumba yang pada umumnya menggunakan bahan andesit untuk peralatan.

#### c. Perkembangan zaman logam

Mengakhiri zaman batu di masa neolitikum mulailah zaman logam. Sebagai bentuk masa perundagian. Zaman logam di Kepulauan Indonesia ini agak berbeda bila dibandingkan dengan yang ada di Eropa. Di Eropa zaman logam ini mengalami tiga fase, zaman tembaga, perunggu dan besi. Di Kepulauan Indonesia hanya mengalami zaman

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0041-04.png)

Gambar 1.27 Nekara

Sumber : Taufik Abdullah dan A.B Lapian (ed). 2012. Indonesia Dalam Arus Sejarah. jilid I. Jakarta: PT Ichtiar Baru van Hoeve

perunggu dan besi. Zaman perunggu merupakan fase yang sangat penting dalam sejarah. Beberapa contoh benda-benda kebudayaan perunggu itu antara lain: kapak corong, nekara, moko, berbagai barang perhiasan. Beberapa benda hasil kebudayaan zaman logam ini juga terkait dengan praktik keagamaan misalnya nekara.

### Uji Kompentensi

1. Coba kamu diskusikan mengapa manusia purba membuat peralatan dari bebatuan, kayu, dan tulang?

2. Peralatan yang dibuat oleh manusia purba dari batu dapat digunakan sebagai alat serba guna, coba jelaskan dan beri contoh.

3. Coba kamu inventarisir alat-alat manusia purba pada pada zaman batu dan masukkan ke dalam tabel di bawah ini:

| No  | Nama Alat | Kegunaan | Daerah Temuan | Gambar/Lukiskan |
| --- | --------- | -------- | ------------- | --------------- |
| 1   |           |          |               |                 |
| 2   |           |          |               |                 |
| 3   |           |          |               |                 |
| 4   |           |          |               |                 |
| 5   |           |          |               |                 |
| 6   |           |          |               |                 |
| 7   |           |          |               |                 |

4. Setelah selesai mengisi tabel di atas kamu lukiskan dalam bentuk peta persebaran peralatan manusia purba.

## E. Pola Hunian

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0043-02.png)

Gambar 1.28 Song Keplek situs hunian pada akhir Pleistosen – Holosen

Sumber : Taufik Abdullah dan A.B Lapian (ed). _Indonesia Dalam Arus Sejarah_ . jilid 1. PT Ichtiar Baru van Hoeve. Jakarta. 2012

### Mengamati Lingkungan

Coba kamu amati baik-baik gambar di atas. Gambar itu menunjukkan salah satu pola hunian masyarakat pra-akasara. Mengapa memilih tinggal di gua? Untuk memahami pola hunian manusia purba kamu dapat mengkaji uraian berikut.

### Memahami Teks

Dalam buku _Indonesia Dalam Arus Sejarah,_ Jilid I diterangkan tentang pola hunian manusia purba yang memperlihatkan dua karakter khas hunian purba yaitu, (1) kedekatan dengan sumber air dan (2) kehidupan di alam terbuka. Pola hunian itu dapat dilihat dari letak geografis situs-situs serta kondisi lingkungannya. Beberapa contoh yang menunjukkan pola hunian seperti itu adalah situs-situs purba di sepanjang aliran Bengawan Solo (Sangiran, Sambungmacan, Trinil, Ngawi, dan Ngandong) merupakan contohcontoh dari adanya kecenderungan manusia purba menghuni

lingkungan di pinggir sungai. Kondisi itu dapat dipahami mengingat keberadaan air memberikan beragam manfaat. Air merupakan kebutuhan pokok bagi manusia. Air juga diperlukan oleh tumbuhan maupun binatang. Keberadaan air pada suatu lingkungan mengundang hadirnya berbagai binatang untuk hidup di sekitarnya. Begitu pula dengan tumbuh-tumbuhan, air memberikan kesuburan bagi tanaman. Keberadaan air juga dimanfaatkan manusia sebagai sarana penghubung dalam memenuhi kebutuhan hidupnya. Melalui sungai, manusia dapat melakukan mobilitas dari satu tempat ke tempat yang lainnya.

Petunjuk yang dapat memberikan gambaran jelas pada kita tentang kehidupan manusia purba adalah sebaran sisa-sisa peralatan yang digunakan pada saat itu, yang umumnya berada di dasar atau di sekitar sungai. Kehidupan di sekitar sungai itu menunjukkan pola hidup manusia purba di alam terbuka. Manusia purba mempunyai kecenderungan untuk menghuni lingkungan terbuka di sekitar aliran sungai. Manusia purba juga memanfaatkan berbagai sumber daya lingkungan yang tersedia, termasuk tinggal di gua-gua. Mobilitas manusia purba yang tinggi tidak memungkinkan untuk menghuni gua secara menetap. Keberadaan gua-gua yang dekat dengan sumber air dan sumber bahan makanan mungkin saja dimanfaatkan sebagai tempat persinggahan sementara, sehingga tidak meninggalkan jejak pada kita. Kemungkinan lain bahwa guagua di kala itu belum atau baru sebagian terbentuk dan gua-gua yang

Gambar 1.29 Gambaran hunian manusia purba

sudah terbentuk tidak dalam lingkungan yang menyediakan berbagai sumberdaya yang diperlukan manusia. Yang menarik di alam terbuka itu ada juga manusia purba yang yang tinggal sekitar pantai.

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0044-05.png)

Ciri berikutnya ialah transisi permukiman nenek moyang dari _nomaden_ ke tempat tinggal

Sumber : Taufik Abdullah dan A.B Lapian (ed). 2012. _Indonesia Dalam Arus Sejarah_ . jilid I. Jakarta: PT Ichtiar Baru van Hoeve.

menetap. Manusia purba di Indonesia diperkirakan sudah hidup menjelajah _(nomaden)_ untuk jangka waktu yang lama. Mereka mengumpulkan bahan makanan dalam lingkup wilayah tertentu dan berpindah-pindah. Mereka hidup dalam komunitas-komunitas kecil dengan mobilitas yang tinggi. Keterisolasian dalam hutan tropis dan ketiadaan kontak dengan dunia luar menutup kemungkinan untuk mengadopsi budaya luar. Lama hunian di suatu lingkungan eksploitasi dipengaruhi oleh ketersediaan bahan makanan. Manakala lingkungan sekitar sudah tidak menjanjikan bahan makanan, mereka berpindah ke lingkungan baru di tepian Untuk lebih jelasnya kamu sungai untuk membuat persinggahan baru. dapat membaca buku Mulailah berkembang pola hunian bertempat **Abdullah dan Adrian B.** tinggal sementara, misalnya di gua-gua. Inilah **Lapian (ed),** masa transisi sebelum manusia itu bertempat **_Dalam Arus Sejarah,_** tinggal tetap.

Untuk lebih jelasnya kamu dapat membaca buku **Taufik Abdullah dan Adrian B. Lapian (ed),** **_Indonesia Dalam Arus Sejarah,_ Jilid I.**

### Uji Kompentensi

1. Mengapa manusia purba itu banyak yang tinggal di tepi sungai?

2. Jelaskan pola kehidupan nomaden manusia purba

3. Manusia purba juga memasuki fase bertempat tinggal sementara, misalnya di gua mengapa demikian?

4. Apa kira-kira alasan bagi manusia purba memilih tinggal di tepi pantai

## F. Mengenal Api

### Mengamati Lingkungan

Bagi manusia, api merupakan faktor penting dalam kehidupan. Sebelum ditemukan teknologi listrik aktivitas manusia sehari-hari hampir dapat dipastikan tidak dapat terlepas dari api untuk memasak. Pelajaran dan pengetahuan apa yang kamu peroleh melalui uraian tersebut.

### Memahami Teks

Bagi manusia purba, proses penemuan api merupakan bentuk inovasi yang sangat penting. Berdasarkan data arkeologi, penemuan api kira-kira terjadi pada 400.000 tahun yang lalu. Penemuan pada periode manusia _Homo erectus_ . Di samping untuk menghangatkan diri dari cuaca dingin, dengan api kehidupan menjadi lebih bervariasi dan berbagai kemajuan akan dicapai. Teknologi api dapat dimanfaatkan manusia untuk berbagai hal. Di samping itu penemuan api juga memperkenalkan manusia pada teknologi memasak makanan, yaitu memasak dengan cara membakar dan menggunakan bumbu dengan ramuan tertentu. Manusia juga menggunakan api sebagai senjata. Api pada saat itu digunakan manusia untuk menghalau binatang buas yang menyerangnya. Api dapat juga dijadikan sumber penerangan. Melalui pembakaran pula manusia dapat menaklukkan alam, seperti membuka lahan untuk garapan dengan cara membakar hutan. Kebiasaan bertani dengan menebang lalu bakar ( _slash and burn_ ) adalah kebiasaan kuno yang tetap berkembang sampai sekarang.

Pada awalnya pembuatan api dilakukan dengan cara membenturkan dan menggosokkan benda halus yang mudah

terbakar dengan benda padat lain. Sebuah batu Untuk lebih jelasnya kamu yang keras, misalnya batu api, jika dibenturkan dapat membaca buku ke batuan keras lainnya akan menghasilkan **Abdullah dan Adrian B.** percikan api. Percikan tersebut kemudian **Lapian (ed),** **_Dalam Arus Sejarah,_** ditangkap dengan dedaunan kering, lumut atau material lain yang kering hingga menimbulkan api. Pembuatan api juga dapat dilakukan dengan menggosok suatu benda terhadap benda lainnya, baik secara berputar, berulang, atau bolak-balik. Sepotong kayu keras misalnya, jika digosokkan pada kayu lainnya akan menghasilkan panas karena gesekan itu kemudian menimbulkan api.

Untuk lebih jelasnya kamu dapat membaca buku **Taufik Abdullah dan Adrian B. Lapian (ed),** **_Indonesia Dalam Arus Sejarah,_ Jilid I.**

## G. Dari Berburu-Meramu sampai Bercocok Tanam

### Mengamati Lingkungan

Sering kali kita mendengar aktivitas pembukaan lahan di beberapa daerah di Indonesia. Hal ini bertujuan untuk membuka lahan baru untuk pertanian, perumahan atau untuk kegiatan industri dalam rangka meningkatkan kesejahteraan hidup. Sebenarnya nenek moyang kita juga sudah melakukan hal serupa. Pola hidup berpindah-pindah dan melakukan aktivitas bercocok tanam demi kelangsungan hidup mereka. Bagaimana pendapat kamu mengenai kesamaan aktivitas dari dua kehidupan manusia yang terpisah jarak jutaan tahun tersebut? Untuk mendapatkan pemahaman tentang aktivitas bercocok tanam manusia purba di Kepulauan Indonesia silakan telaah bacaan berikut.

### Memahami Teks

Mencermati hasil penelitian baik yang berwujud fosil maupun artefak lainnya, diperkirakan manusia zaman praaksaraa mula-mula hidup dengan cara berburu dan meramu. Hidup mereka umumnya masih tergantung pada alam. Untuk mempertahankan hidupnya mereka menerapkan pola hidup _nomaden_ atau berpindah-pindah tergantung dari bahan makanan yang tersedia. Alat-alat yang digunakan terbuat dari batu yang masih sederhana. Hal ini terutama berkembang pada manusia Meganthropus dan Pithecanthropus. Tempat-tempat yang dituju oleh komunitas itu umumnya lingkungan dekat sungai, danau, atau sumber air lainnya termasuk di daerah pantai. Mereka beristirahat misalnya di bawah pohon besar. Mereka juga membuat atap dan sekat tempat istirahat itu dari daun-daunan.

Masa manusia purba berburu dan meramu itu sering disebut dengan masa _food gathering._ Mereka hanya mengumpulkan dan menyeleksi makanan karena belum dapat mengusahakan jenis tanaman untuk dijadikan bahan makanan. Dalam perkembangannya mulai ada sekelompok manusia purba yang bertempat tinggal sementara, misalnya di gua-gua, atau di tepi pantai. Coba kamu ingat dalam pembahasan sebelumnya, terdapat kebudayaan _kjokkenmoddinger_ dan _abris sous roche_ dan manusia purba mulai mengenal api.

Peralihan Zaman Mesolitikum ke Neolitikum menandakan adanya revolusi kebudayaan dari _food gathering_ menuju _food producing_ dengan _Homo sapien_ sebagai pendukungnya _._ Mereka tidak hanya mengumpulkan makanan tetapi mencoba memproduksi makanan dengan menanam. Kegiatan bercocok tanam dilakukan ketika mereka sudah mulai bertempat tinggal, walaupun masih bersifat sementara. Mereka melihat biji-bijian sisa makanan yang tumbuh di tanah setelah tersiram air hujan. Pelajaran inilah yang kemudian mendorong manusia purba untuk melakukan bercocok tanam. Apa yang mereka lakukan di sekitar tempat tinggalnya, lama kelamaan tanah di sekelilingnya habis, dan mengharuskan pindah

mencari tempat yang dapat ditanami. Ada yang membuka hutan dengan menebang pohon-pohon untuk membuka lahan bercocok tanam. Namun waktu itu juga sudah ada pembukaan lahan dengan cara membakar hutan. Bagaimana pendapat kamu tentang hal ini dan kira-kira apa bedanya dengan pembakaran hutan yang dilakukan oleh manusia modern sekarang ini?

Kegiatan manusia bercocok tanam terus mengalami perkembangan. Peralatan pokoknya adalah jenis kapak persegi dan kapak lonjong. Kemudian berkembang ke alat lain yang lebih baik. Dengan dibukanya lahan dan tersedianya air yang cukup maka terjadilah persawahan untuk bertani. Hal ini berkembang karena saat itu, yakni sekitar tahun 2000 – 1500 S.M ketika mulai terjadi perpindahan orang-orang dari rumpun bangsa Austronesia dari Yunnan ke Kepulauan Indonesia. Begitu juga kegiatan beternak juga mengalami perkembangan. Seiring kedatangan orang-orang dari Yunnan yang kemudian dikenal sebagai nenek moyang kita itu, maka kegiatan pelayaran dan perdagangan mulai dikenal. Dalam waktu singkat kegiatan perdagangan dengan sistem barter mulai berkembang. Kegiatan bertani juga semakin berkembang karena mereka sudah mulai bertempat tinggal menetap.

Untuk lebih lengkapnya kamu bisa membaca buku **Marwati Djoened Poesponegoro,** **_Sejarah Nasional Indonesia I_ , dan Sardiman AM dan Kusriyantinah,** **_Sejarah Nasional dan Sejarah Umum._**

### Uji Kompentensi

1. Pembukaan lahan yang dilakukan oleh nenek moyang kita dengan penebangan pohon sebenarnya termasuk kearifan lokal yang perlu dijadikan pelajaran. Bagaimana pendapat dan sikap kamu tentang pernyataan tersebut? Bagaimana pula pendapat kamu tentang aktivitas pembukaan lahan dengan membakar hutan seperti yang dilakukan sekarang sekarang ini?

2. Buatlah analisis tentang hubungan antara pola tempat tinggal dengan bercocok tanam.

3. Buatlah karya tulis dengan judul, Neolitikum: Sebuah Revolusi Kebudayaan

4. Coba kamu identifikasi alat-alat bercocok tanam pada periode ini!

| No  | Nama Alat | Kegunaan | Gambar |
| --- | --------- | -------- | ------ |
| 1   |           |          |        |
| 2   |           |          |        |
| 3   |           |          |        |
| 4   |           |          |        |
| 5   |           |          |        |
| 6   |           |          |        |
| 7   |           |          |        |

## H. Sistem Kepercayaan

Sebagai manusia yang beragama tentu kamu sering mendengarkan ceramah dari guru maupun tokoh agama. Dalam ceramah-ceramah tersebut sering dikatakan bahwa hidup adalah hanya sebentar sehingga tidak boleh berbuat menentang ajaran agama, misalnya tidak boleh menyakiti orang lain, tidak boleh rakus, bahkan melakukan tindak korupsi yang merugikan negara dan orang lain. Karena itu dalam hidup ini manusia harus bekerja keras dan berbuat sebaik mungkin, saling tolong menolong. Kita semua mestinya takut kepada Tuhan Yang Maha Esa bila berbuat dosa karena melanggar perintah agama, atau menyakiti orang lain.

Nenek moyang kita mengenal kepercayaan kehidupan setelah mati. Mereka percaya pada kekuatan lain yang maha kuat di luar dirinya. Mereka selalu menjaga diri agar setelah mati tetap dihormati. Berikut ini kita akan menelaah bagaimana sistem kepercayaan manusia zaman praaksara, yang menjadi nenek moyang kita. Perwujudan kepercayaannya dituangkan dalam berbagai bentuk diantaranya karya seni. Satu di antaranya berfungsi sebagai bekal untuk orang yang meninggal. Tentu kamu masih ingat tentang perhiasan yang digunakan sebagai bekal kubur. Seiring dengan bekal kubur ini, maka pada zaman purba manusia mengenal penguburan mayat. Pada saat inilah manusia mengenal sistem kepercayaan. Sebelum meninggal manusia menyiapkan dirinya dengan membuat berbagai bekal kubur, dan juga tempat penguburan yang menghasilkan karya seni cukup bagus pada masa sekarang. Untuk itulah _Atlas Prasejarah Indonesia_ kita mengenal dolmen, sarkofagus, menhir dan Kebudayaan dan Pariwisata. lain sebagainya.

Gambar 1.30 Sarkofagus atau kubur batu

Sumber: Direktorat Geografi Sejarah. 2009. _Atlas Prasejarah Indonesia_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.

### Memahami Teks

Masyarakat zaman praaksara terutama periode zaman neolitikum sudah mengenal sistem kepercayaan. Mereka sudah memahami adanya kehidupan setelah mati. Mereka meyakini bahwa roh seseorang yang telah meninggal akan ada kehidupan di alam lain. Oleh karena itu, roh orang yang sudah meninggal akan senantiasa dihormati oleh sanak kerabatnya. Terkait dengan itu maka kegiatan ritual yang paling menonjol adalah upacara penguburan orang meninggal. Dalam tradisi penguburan ini, jenazah orang yang telah meninggal dibekali berbagai benda dan peralatan kebutuhan sehari-hari, misalnya barang-barang perhiasan, periuk dan lain-lain yang dikubur bersama mayatnya. Hal ini dimaksudkan agar perjalanan arwah orang yang meninggal selamat dan terjamin dengan baik. Dalam upacara penguburan ini semakin kaya orang yang meninggal maka upacaranya juga semakin mewah. Barangbarang berharga yang ikut dikubur juga semakin banyak.

Selain upacara-upacara penguburan, juga ada upacaraupacara pesta untuk mendirikan bangunan suci. Mereka percaya manusia yang meninggal akan mendapatkan kebahagiaan jika mayatnya ditempatkan pada susunan batu-batu besar, misalnya pada peti batu atau sarkofagus.

Gambar 1.31 Menhir yang ada di Limapuluh Koto

Batu-batu besar ini menjadi lambang perlindungan bagi manusia yang berbudi luhur juga memberi peringatan bahwa kebaikan kehidupan di akhirat hanya akan dapat dicapai sesuai dengan perbuatan baik selama hidup di dunia. Hal ini sangat tergantung pada kegiatan upacara kematian yang pernah dilakukan untuk menghormati leluhurnya. Oleh karena itu, upacara kematian merupakan manifestasi dari rasa bakti dan hormat seseorang terhadap leluhurnya yang telah _Atlas Prasejarah Indonesia_ . meninggal.

Sumber: Direktorat Geografi Sejarah. 2009. _Atlas Prasejarah Indonesia_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.

Sistem kepercayaan masyarakat praaksara yang demikian itu telah melahirkan tradisi megalitik (zaman megalitikum = zaman batu besar). Mereka mendirikan bangunan batu-batu besar seperti menhir, dolmen, punden berundak, dan sarkofagus.

Sistem kepercayaan dan tradisi batu besar seperti dijelaskan di atas, telah mendorong berkembangnya kepercayaan animisme. Kepercayaan animisme merupakan sebuah sistem kepercayaan yang memuja roh nenek moyang. Di samping animisme, muncul juga kepercayaan dinamisme. Menurut kepercayaan dinamisme ada bendabenda tertentu yang diyakini memiliki kekuatan gaib, sehingga benda itu sangat dihormati dan dikeramatkan.

Seiring dengan perkembangan pelayaran, masyarakat zaman praaksara akhir juga mulai mengenal sedekah laut. Sudah barang tentu kegiatan upacara ini lebih banyak dikembangkan di kalangan para nelayan. Bentuknya mungkin semacam selamatan apabila ingin berlayar jauh, atau mungkin saat memulai pembuatan perahu.

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0053-04.png)

Sumber: Direktorat Geografi Sejarah. 2009. _Atlas Prasejarah Indonesia_ . Jakarta: Kementerian Kebudayaan dan Pariwisata

Gambar 1.32 Menhir Seperti Bentuk Tanduk

### Uji Kompentensi

1. Jelaskan kaitan antara manusia yang sudah bertempat tinggal tetap dengan adanya sistem kepercayaan!

2. Adakah hubungan antara sistem kepercayaan masyarakat dengan pola mata pencaharian? Jelaskan!

3. Buatlah sebuah proyek belajar dengan melakukan penelitian tentang tradisi megalitik dan kepercayaan animisme yang sekarang masih tersisa di daerah kamu.

## I. Kedatangan Deutro dan Protomelayu

### Mengamati Lingkungan

Coba kamu cermati banyaknya suku-suku bangsa di Indonesia memunculkan keberagaman bahasa daerah, dan kebudayaan yang berlaku dalam praktek-praktek kehidupan sehari-hari. Bayangkan saja ada lebih dari 500 suku bangsa Indonesia, sungguh merupakan kekayaan bangsa yang tidak dimiliki oleh negara lain. Namun demikian kekayaan ini akan menjadi masalah jika kita tidak pandai mengelola perbedaan yang ada. Tentu ini berkaitan pula dengan asal mula kedatangan suku bangsa dan kapan mereka datang? Oleh karena itu penting untuk mengetahui bagaimana proses dan dinamika nenek moyang Indonesia sehingga terbentuk keragaman budayanya. Untuk itu kamu harus mempelajarinya, agar kita bisa saling menghargai dan menghormati setiap perbedaan yang ada.

### Memahami Teks

Menurut Sarasin bersaudara, penduduk asli Kepulauan Indonesia adalah ras berkulit gelap dan bertubuh kecil. Mereka mulanya tinggal di Asia bagian tenggara. Ketika zaman es mencair dan air laut naik hingga terbentuk Laut Cina Selatan dan Laut Jawa, sehingga memisahkan pegunungan vulkanik Kepulauan Indonesia dari daratan utama. Beberapa penduduk asli Kepulauan Indonesia tersisa dan menetap di daerah-daerah pedalaman, sedangkan daerah pantai dihuni oleh penduduk pendatang. Penduduk asli itu disebut sebagai suku bangsa Vedda oleh Sarasin. Ras yang masuk dalam kelompok ini adalah suku bangsa Hieng di Kamboja, Miaotse, Yao-Jen di Cina, dan Senoi di Semenanjung Malaya.

Beberapa suku bangsa seperti Kubu, Lubu, Talang Mamak yang tinggal di Sumatra dan Toala di Sulawesi merupakan penduduk tertua di Kepulauan Indonesia. Mereka mempunyai hubungan erat dengan nenek moyang Melanesia masa kini dan orang Vedda yang saat ini masih terdapat di Afrika, Asia Selatan, dan Oceania. Vedda itulah manusia pertama yang datang ke pulau-pulau yang sudah berpenghuni. Mereka membawa budaya perkakas batu. Kedua ras Melanesia dan Vedda hidup dalam budaya _mesolitik_ .

Pendatang berikutnya membawa budaya baru yaitu budaya neolitik. Para pendatang baru itu jumlahnya jauh lebih banyak daripada penduduk asli. Mereka datang dalam dua tahap. Mereka itu oleh Sarasin disebut sebagai Deutero dan Protomelayu. Kedatangan mereka terpisah diperkirakan lebih dari 2.000 tahun yang lalu. Protomelayu diyakini sebagai nenek moyang orang Melayu Polinesia yang tersebar dari Madagaskar sampai pulau-pulau paling timur di Pasifik. Mereka diperkirakan datang dari Cina bagian selatan. Dari Cina bagian selatan itu mereka bermigrasi ke Indocina dan Siam kemudian ke Kepulauan Indonesia. Kedatangan para imigran baru itu kemudian mendesak keberadaan penduduk asli dan pendatang sebelumnya. Mereka pun kemudian berpindah mencari tempat

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0055-03.png)

Gambar 1.33 Peta persebaran Deutro dan Protomelayu

Sumber : Taufik Abdullah dan A.B Lapian (ed). 2012. _Indonesia Dalam Arus Sejarah_ . jilid I. Jakarta: PT Ichtiar Baru van Hoeve.

baru ke hutan-hutan sebagai tempat hunian baru. Penduduk asli dan pendatang sebelumnya itu pun kemudian melebur.

Deutero Melayu merupakan ras yang datang dari Indocina bagian utara. Mereka membawa budaya baru berupa perkakas dan senjata besi di Kepulauan Indonesia. Pada akhirnya Proto dan Deutero Melayu membaur yang selanjutnya menjadi penduduk di Kepulauan Indonesia. Pada masa selanjutnya mereka sulit untuk dibedakan. Proto Melayu meliputi penduduk di Gayo dan Alas di Sumatra bagian utara, serta Toraja di Sulawesi. Sementara itu, semua penduduk di Kepulauan Indonesia, kecuali penduduk Papua dan yang tinggal di sekitar pulau-pulau Papua adalah ras Deutero Melayu.

Periode migrasi itu berlangsung berabad-abad, kemungkinan mereka berasal dalam satu kelompok ras yang sama dan dengan budaya yang sama pula. Mereka itulah nenek moyang orang Indonesia saat ini. Budaya mereka berupa neolitik yang lebih maju dan belum mengenal perkakas dari logam. Budaya logam baru mereka kenal pada masa awal tarikh Masehi.

Sekitar 170 bahasa yang digunakan di Kepulauan Indonesia adalah bahasa Austronesia (Melayu-Polinesia). Bahasa itu kemudian dikelompokan menjadi dua oleh Sarasin, yaitu Bahasa Aceh dan bahasa-bahasa di pedalaman Sumatra, Kalimantan, dan Sulawesi. Kelompok kedua adalah bahasa Batak, Melayu standar, Jawa, dan Bali. Kelompok bahasa kedua itu mempunyai hubungan dengan bahasa Malagi di Madagaskar dan Tagalog di Luzon. Persebaran geografis kedua bahasa itu menunjukkan bahwa penggunanya

adalah pelaut-pelaut pada masa dahulu yang sudah mempunyai peradaban lebih maju. Di Untuk lebih jelasnya kamu samping bahasa-bahasa itu, juga terdapat dapat membaca buku **Bernard H.M. Vlekke,** bahasa Halmahera Utara dan Papua yang **_Nusantara:Sejarah Indonesia._** digunakan di pedalaman Papua dan bagian utara Pulau Halmahera.

### Uji Kompentensi

Coba kamu identifikasikan peninggalan sejarah berupa benda dan karya seni yang dapat dikategorikan sebagai tinggalan masa proto sejarah. Adakah manfaat dari peninggalan tersebut bagi kehidupan manusia sekarang?

Menurut pendapat kamu, bagaimana peninggalan sejarah tersebut bisa menyebar ke berbagai wilayah di Indonesia bahkan sampai ke luar wilayah Indonesia?

Untuk mengerjakan soal di atas maka kamu dapat melakukan beberapa tahapan sebagai berikut:

1. Identifikasi permasalahan yang menurut kamu menarik untuk diteliti, yaitu merumuskan masalah apa yang akan kamu teliti (biasanya dalam bentuk kalimat pertanyaan), seperti dimanakah manusia praaksara biasanya tinggal? Pada masa kapan mereka hidup di Indonesia? Bagaimana mereka bisa mempertahankan kehidupannya dan bagaimana ciri-cirinya? Dan lain-lain sebagainya bisa diskusikan dengan teman-temanmu.

2. Setelah itu carilah sumber-sumber yang menjelaskan tentang permasalahan yang akan diteliti. Caranya dengan mencari sumber dari internet, buku-buku bacaan, kliping koran, fotofoto, ilustrasi dan bisa juga wawancara dengan tokoh masyarakat yang kamu anggap mengetahui permasalahan.

3. Setelah kamu temukan sumber-sumber tersebut, kamu harus melakukan perbandingan antara sumber yang satu dengan yang lain untuk mencari kebenaran. Jika dari bacaan yang kamu baca ada dua atau lebih sumber yang menyatakan hal yang sama maka bisa saja kita anggap sumber tersebut mendekati kebenaran.

4. Apabila di daerah tempat tinggal kamu terdapat peninggalan sejarah yang diduga tinggalan masa praaksara, kamu bersama teman-temanmu dapat mengunjungi situs tersebut untuk meyakinkan pendapat kamu.

Setelah itu barulah kamu rumuskan dalam bentuk tulisan yang runtut sekitar 3 – 5 lembar tulisan.

## J. Kesimpulan

Setelah membaca secara keseluruhan bab ini marilah kita sama-sama menyimpulkan nilai-nilai apa yang dapat dipetik dari kehidupan masa lalu itu untuk kehidupan pada masa kini dan masa mendatang. Untuk mempelajari sejarah awal ini ahli sejarah bergantung pada disiplin arkeologi, geologi dan biologi dan cabangcabang ilmu lainnya. Masa praaksara terbentang dari penemuan manusia pertama di planet bumi ini hingga ditemukannya tulisan. Cerita sejarahnya mulai sejak sekitar 500.000 atau barangkali sekitar 250.000 tahun lalu. Periode ini, karenanya, merupakan suatu tahapan sejarah paling tua dan terpanjang dalam sejarah umat manusia, tidak terkecuali untuk sejarah Indonesia.

Pengetahuan tentang kehidupan manusia praaksara menyediakan jawaban tentang asal-usul manusia dan kemanusiaan, serta keberadaan manusia di dunia dalam mencapai impiannya dan rintangan-rintangan yang dihadapinya. Pertanyaan tentang asal usul dan eksistensi manusia selalu menggelitik benak manusia sepanjang zaman, bahkan juga hari ini. Sebagai sebuah bangsa, pembelajaran mengenai kehidupan manusia praaksara hendaknya menggugah kita untuk memperbarui pertanyaan klasik seperti, dari manakah kita berasal dan bagaimana evolusi perjalanan hidup manusia di masa lalu hingga mencapai suatu tahap sejarah ke tahap berikutnya?

Bagaimana mereka menemukan dirinya dan menjalani pengalaman kolektif dari masa ke masa? Semakin sadar kita tentang asal usul dan evolusi yang dijalani nenek moyang di masa lampau, semakin ingat pula kita hendaknya tentang tugas dan tanggung jawab kita sebagai seorang peserta didik yang akan membangun bangsa hari ini dan ke depan.

Nenek moyang orang Indonesia di masa lampau telah menjalani sejarah yang amat panjang dan berat dengan segala tantangan zaman yang dihadapi pada masanya. Mereka telah mengalami evolusi atau transformasi sedemikian rupa yaitu, dari _nomaden_ ke kehidupan menetap, dari hidup mengumpulkan makanan dan berburu menjadi penghasil bahan makanan, dari ketergantungan total pada alam dan teknologi bersahaja dalam bentuk _manual_ kepada upaya menciptakan alat yang kian lama kian canggih, dan dari hidup berkelompok berdasarkan sistem kepemimpinan _primus interpares_ ke susunan masyarakat yang lebih teratur. Semua itu berlangsung dengan cara yang tak mudah dan memakan waktu yang lama, bahkan ribuan tahun.

Perubahan-perubahan itu tidak mengalir begitu saja, tetapi mulai dari refleksi berpikir, gagasan hasil interaksi mereka dengan alam sekitar. Kondisi lingkungan yang berat mengajarkan bagaimana, misalnya, membuat alat yang tepat untuk memecahkan persoalan yang dihadapi. Entah itu karena faktor alam atau cuaca atau ancaman dari binatang buas. Dalam masyarakat manusia, seperti halnya dengan hewan, generasi yang lebih tua meneruskan tradisi dan pengalaman kolektif lewat contoh kepada yang lebih muda. Dengan akumulasi pengalaman kolektif itu mereka belajar meningkatkan pengetahuan dan keterampilan.

Pencapaian prestasi yang diraih manusia modern dewasa ini telah mengubah dunia dengan cara yang mungkin tak terbayangkan oleh nenek moyang mereka di masa silam, tetapi energi yang telah dihabiskan untuk menunjang kehidupan manusia pun semakin besar. Kehidupan modern yang kini dinikmati manusia pun

sebenarnya telah dibayar dengan harga yang amat mahal dengan besarnya energi yang telah dikuras oleh manusia, baik itu yang tidak terperbaharui (antara lain minyak bumi, gas, dan batubara) maupun yang terperbaharui (kayu dan hutan). Karena itu, seorang ahli ilmu hayat Tim Flannery menyebut manusia _homo sapiens_ zaman modern berbeda dengan nenek moyang mereka, karena mereka tidak lain adalah “pemangsa masa depan”. Julukan ini tidak salah apabila kita menghitung kembali kerusakan lingkungan yang diakibatkan oleh eksploitasi manusia hingga saat ini. Bahkan, sumberdaya alami (antara lain tambang mineral, bahan bakar fosil, keindahan alam, hutan tropis, sumber daya lautan) yang seharusnya bukan menjadi hak manusia saat ini, tetapi warisan bagi anak-cucu di masa mendatang, sudah mulai dimanfaatkan atau malah sudah dimakan habis.

Kekayaan sumber kearifan lokal zaman praaksara menyediakan inspirasi dan sekaligus peringatan bagi generasi kita bagaimana hubungan harmoni antara manusia dan alam tidak perlu menimbulkan malapetaka bagi manusia lain. Kekayaan alam pikir manusia praaksara jelas merupakan kearifan lokal yang harus terus menerus digali lagi dan bukan diremehkan. Mitosmitos tentang awal penciptaan dunia dan asal-usul manusia dengan cerita yang berbeda-beda di berbagai suku bangsa, tidak hanya mengandung nilai pelajaran di dalamnya, tetapi juga, kalau ditelusuri lebih jauh, membawa pesan-pesan rasional yang sering disampaikan secara simbolik. Maka, di saat manusia modern hidup semakin individualistik, semakin terasa pula kebutuhan untuk menegakkan nilai-nilai kearifan lokal. Entah itu yang namanya berupa gotong royong, kekeluargaan dan kebersamaan. Itulah kebiasaan nenek moyang, misalnya, dalam rangka membangun kampung, mendirikan bangunan-bangunan dari batu besar atau megalitik. Kebiasaan semacam ini sampai sekarang masih dapat dirasakan di dalam kehidupan masyarakat tradisional, seperti di Nias, Toraja, dan Ngada. Tidak jarang pula para pemimpin kelompok

sosial mengadakan pestajasa sebagai bukti bahwa mereka dapat memberikan kesejahteraan bag i anggota masyarakatnya. Semua anggota masyarakat ikut terlibat dan secara bersama-sama melaksanakan upacara-upacara. Masyarakat yang telah merasakan kesejahteraan yang diberikan pemimpin akan membalas jasa itu dengan bergotong royong mengangkut dan mendirikan batu tegak (prasasti) bagi pemimpinnya. Di masa lampau, sifat gotong royong itu, tidak saja terlihat dalam mendirikan bangunan megalitik tetapi juga untuk pendirian rumah, upacara syukuran panen, serta upacara kematian. Apa pun bentuknya, pengalaman kolektif manusia praaksara adalah akar tunggang dari budaya Nusantara, yang tentunya dapat memperkuat budaya Indonesia modern dalam mengarungi globalisasi abad ke-21 ini.

![](sejarah-x-1_assets/10_SEJARAH_BUKU_SISWA.pdf-0062-01.png)

Gambar 2.1 Relief yang mengambarkan aktifitas pandai logam

Sumber : Bambang Budi Utomo. 2010 _Atlas Sejarah Indonesia Masa Klasik (Hindu-Buddha)_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.
$content$
  ),
  (
    'Sejarah Indonesia X Bab 2',
    'Lahirnya agama Hindu-Buddha, masuknya pengaruh ke Nusantara, serta kerajaan-kerajaan pada masa klasik seperti Kutai, Tarumanegara, dan Sriwijaya.',
    1,
    array['sejarah', 'x', 'bab 2', 'hindu-buddha'],
    $content$# Bab II: Pedagang, Penguasa dan Pujangga pada Masa Klasik (Hindu-Buddha)

_Masa Hindu-Buddha berlangsung selama kurang lebih 12 abad. Pembabakan masa Hindu-Buddha terbagi menjadi tiga, yaitu periode pertumbuhan, perkembangan, dan keruntuhan. Pada abad ke-16 agama Islam mulai mendominasi Nusantara. Namun, tidak berarti pengaruh kebudayaan Hindu-Buddha hilang tergantikan kebudayaan Islam. Agama Islam mengakomodasi peninggalan Hindu-Buddha, tentunya dengan melakukan modifikasi agar tetap berselang beberapa abad, wujud peradaban Hindu-Buddha masih dapat kita saksikan hingga sekarang, misalnya dalam perwujudan sastra dan arsitektur._

<p class="text-end!">(Taufik Abdullah (ed), 2012b)</p>

Kutipan di atas menunjukkan perkembangan Kebudayaan Hindu-Buddha sudah berlangsung sangat lama dan meluas di seluruh Kepulauan Indonesia. Kebudayaan yang sangat monumental adalah mulai dikenalnya tulisan. Oleh karena itu dalam bab ini kita akan mengenal lebih lanjut tentang penduduk di Kepulauan Indonesia ketika sudah mengenal tulisan dan kebudayaannya mulai berkembang. Terutama sewaktu pengaruh-pengaruh budaya Hindu-Buddha masuk ke Kepulauan Indonesia. Masa ini seringkali disebut juga dengan masa klasik, yaitu awal masuknya unsur-unsur budaya India di Kepulauan Indonesia. Pada tahapan ini pula banyak kemajuan yang dicapai dalam pemikiran dan hasil-hasil budaya baik dalam bentuk benda, maupun budaya tak benda.

## A. Dari Lembah Indus sampai Muarakaman

### Mengamati Lingkungan

Tentu kamu pernah membaca atau bahkan datang untuk melihat kemegahan Candi Borobudur. Candi yang terletak di Kota Magelang, Jawa Tengah. Dari bentuk arsitekturnya candi itu merupakan candi Buddha. Candi yang megah itu merupakan satu di antara tujuh keajaiban dunia. Kamu tentu bangga dengan tinggalan budaya itu dan harus dapat merawat peninggalan yang sangat berharga tersebut. Tidak jauh dari Candi Borobudur, terdapat Candi Prambanan. Candi Hindu itu terletak di perbatasan Kota Daerah Istimewa Yogyakarta dengan Surakarta, Jawa Tengah. Kedua candi yang megah itu merupakan bukti perkembangan agama dan kebudayaan Hindu-Buddha di Indonesia. Tentu kamu pernah membaca cerita rakyat tentang Lara Jonggrang dan Bandung Bondowoso. Cerita yang melatarbelakangi terjadinya Candi Prambanan itu. Benarkah itu suatu kejadian nyata ataukah hanya sebuah mitos belaka? Kamu dapat mendiskusikannya bersama teman-teman.

Dua mahakarya itu merupakan bukti-bukti pencapaian yang luar biasa pada Dinasti Syailendra. Setelah masa dinasti itu surut, pusat kebudayaan dan politik kerajaan pindah ke Jawa bagian timur. Di Jawa bagian timur itu kemudian berdirilah kerajaan yang diperintah oleh keturunan Raja Mataram yang bernama Mpu Sindok. Beberapa sumber sejarah yang berasal dari Cina menyebutkan tentang adanya hubungan perkawinan antara raja Jawa dan Bali pada masa pemerintahannya.

Sementara itu, di Sumatra terdapat Kerajaan yang sangat terkenal, yaitu Sriwijaya. Kerajaan yang handal menjalin hubungan dengan dunia internasional melalui jaringan perdagangan dan kemaritimannya. Dalam masa itulah para pedagang datang dari

India, Cina dan Arab untuk meramaikan Sriwijaya. Saat Sumatra di bawah Dinasti Syailendra, kerajaan itu dapat menguasai kerajaankerajaan lain di sepanjang Laut Malaka. Pada masa itu pula hubungan dengan India dan Cina berkembang pesat. Bahkan hubungan itu sangat berpengaruh dalam perkembangan budaya pada masa itu, bahkan hingga saat ini pengaruh kedua budaya itu masih dapat kita temui. Kehebatan Sriwijaya juga ditunjukkan dengan adanya “dharma” (sumbangan) dari Raja Sriwijaya untuk mendirikan asrama di Nalanda. Sriwijaya pun menjadi pusat belajar agama Buddha pada masa itu. Sumber-sumber Tibet dan Nepal menyebutkan, seorang pendeta Buddha yang bernama Atisa, belajar Agama Buddha di Sriwijaya selama 12 tahun, atas saran I-tsing, seorang musafir dari Cina yang lebih dahulu pernah singgah di Sriwijaya.

Jika mengunjungi Candi Prambanan atau Candi Borobudur, kamu akan melihat kisah dalam dunia wayang. Tentu kamu juga pernah mendengar tentang wayang, atau bahkan ada yang suka melihat wayang. Wayang sudah dikenal oleh nenek moyang kita sejak masa Hindu-Buddha. Melalui wayang kisah _Mahabharata_ dipentaskan. Kisah yang hingga saat ini masih populer adalah Kisah _Bharatayudha_ . Kisah yang menceritakan tentang perang saudara antara Kurawa dan Pandawa, tentang kebaikan yang mengalahkan kejahatan. Cerita itu merupakan saduran dari India. Seorang pujangga Jawa diperintahkan oleh Jabajaya untuk menulis cerita itu dalam versi Jawa. Jayabaya adalah Raja Kediri yang kekuasaannya tidak dapat ditentang oleh kerajaan-kerajaan lain. Raja ini pula

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0103-02.png)

Gambar 2.2 Candi Prambanan

Sumber :Bambang Budi Utomo. 2010. _Atlas Sejarah Indonesia Masa Klasik (HinduBuddha)._ Jakarta: Kementerian Kebudayaan dan Pariwisata.

yang dikenal karena kehebatan ramalannya. Selain Mahabharata juga dikenal cerita tentang Ramayana. Dari kisah Ramayana itulah disebutkan adanya Jawadwipa, pulau yang kaya dengan tambang emas dan perak.

Nama Jawadwipa juga sudah dikenal oleh seorang ahli geografi Yunani, Ptolomeus, pada awal tarikh Masehi dengan nama “Labadiu”. Jadi nama Kepulauan Indonesia sudah ditulis dan dikenal oleh penulis Barat jauh pada masa awal Masehi. Ptolomeus menyebutkan bahwa Pulau Labadiu artinya Pulau Padi atau dikenal pula dengan Jawadwipa.

Nah, bagaimanakah Agama Hindu dan Buddha dapat masuk di Kepulauan Indonesia? Banyak ahli yang berpendapat tentang itu. Pada bab ini kita akan belajar tentang masuk dan berkembangnya pengaruh-pengaruh India dan Cina, serta capaian-capaian yang dilakukan para penguasa pada masa saat itu dan proses masuknya agama Hindu dan Buddha. Pada saat ini pula peranan pedagang, penguasa, dan pujangga sangat terlihat dari bukti-bukti capaian budaya pada saat itu yang hingga saat ini masih dapat kita jumpai.

Untuk memperdalam kajian tentang hal ini kamu dapat membaca buku **Vlekke,** **_Nusantara: Sejarah Indonesia._**

### Memahami Teks

### 1. Lahirnya Agama Hindu

Pertumbuhan dan perkembangan kebudayaan Hindu di India berkaitan dengan sistem kepercayaan bangsa Arya yang masuk ke India pada 1500 S.M. Kebudayaan Arya berkembang di Lembah Sungai Indus India. Bangsa Arya mengembangkan sistem kepercayaan dan sistem kemasyarakatan yang sesuai dengan tradisi yang dimilikinya. Sistem kepercayaan itu berupa penyembahan

terhadap banyak dewa yang dipimpin oleh golongan pendeta atau Brahmana. Keyakinan bangsa Arya terhadap kepemimpinan kaum Brahmana dalam melakukan upacara ini melahirkan kepercayaan terhadap Brahmanisme. Selanjutnya golongan ini juga menulis ajaran mereka dalam kitab-kitab suci yang menjadi standar pelaksanaan upacara-upacara keagamaan. Kitab suci agama Hindu disebut Weda ( _Veda_ ), artinya pengetahuan tentang agama. Sanusi Pane dalam bukunya _Sejarah Indonesia_ menjelaskan tentang Weda terdiri dari 4 buah kitab, yaitu:

#### a. Rigweda

Rigweda adalah kitab yang berisi tentang ajaran-ajaran Hindu. Rigweda merupakan kitab yang tertua dan kemungkinan muncul pada waktu bangsa Arya masih berada di daerah Punjab.

#### b. Samaweda

Samaweda adalah kitab yang berisi nyanyian-nyanyian pujaan yang wajib dilakukan ketika upacara agama.

#### c. Yajurweda

Yajurweda adalah kitab yang berisi dosa-doa yang dibacakan ketika diselenggarakan upacara agama. Munculnya kitab ini diperkirakan ketika bangsa Arya mengusai daerah Gangga Tengah.

#### d. Atharwaweda

Atharwaweda adalah kitab yang berisi doa-doa untuk menyembuhkan penyakit, doa untuk memerangi raksasa. Doa-doa atau mantera pada kitab ini muncul setelah bangsa Arya berhasil menguasai daerah Gangga Hilir.

Agama Hindu bersifat Politheisme, yaitu percaya terhadap banyak dewa yang masing-masing dewa memiliki peranan dalam kehidupan masyarakat. Ada tiga dewa utama dalam agama Hindu yang disebut Trimurti terdiri dari Dewa Brahma (dewa pencipta), Dewa Wisnu (dewa pelindung), dan Dewa Siwa (dewa perusak).

Sistem kemasyarakatan yang dikembangkan oleh bangsa Arya adalah sistem kasta. Sistem kasta mengatur hubungan sosial bangsa Arya dengan bangsa-bangsa yang ditaklukkannya. Sistem ini membedakan masyarakat berdasarkan fungsinya. Golongan _Brahmana_ (pendeta) menduduki golongan pertama. _Ksatria_ (bangsawan, prajurit) menduduki golongan kedua. _Waisya_ (pedagang dan petani) menduduki golongan ketiga, sedangkan _Sudra_ (rakyat biasa) menduduki golongan terendah atau golongan keempat. Sistem kepercayaan dan kasta menjadi dasar terbentuknya kepercayaan terhadap Hinduisme. Penggolongan seperti inilah yang disebut _caturwarna_ .

### 2. Lahirnya Agama Buddha

Agama Buddha lahir sekitar abad ke-5 S.M. Agama ini lahir sebagai reaksi terhadap agama Hindu terutama karena keberadaan kasta. Pembawa agama Buddha adalah Sidharta Gautama (563-486 S.M), seorang putra dari Raja Suddhodana dari Kerajaan Kosala di Kapilawastu. Untuk mencari pencerahan hidup, ia meninggalkan Istana Kapilawastu dan menuju ke tengah hutan di _Bodh Gaya_ . Ia bertapa di bawah pohon (semacam pohon beringin) dan akhirnya mendapatkan _bodhi_ , yaitu semacam penerangan atau kesadaran yang sempurna. Pohon itu kemudian dikenal dengan pohon _bodhi_ . Sejak saat itu, Sidharta Gautama dikenal sebagai _Sang Buddha_ , artinya yang disinari. Peristiwa ini terjadi pada tahun 531 SM. Usia Sidharta waktu itu kurang lebih 35 tahun. Wejangan yang pertama disampaikan di Taman Rusa di Desa Sarnath.

Dalam ajaran Buddha manusia akan lahir berkali-kali ( _reinkarnasi_ ). Hidup adalah _samsara_ , menderita, dan tidak menyenangkan. Menurut ajaran Buddha, hidup manusia adalah menderita, disebabkan karena adanya _tresna_ atau cinta, yaitu cinta (hasrat/nafsu) akan kehidupan. Penderitaan dapat dihentikan, caranya adalah dengan menindas _tresna_ melalui delapan jalan

( _astawida_ ), yakni pemandangan (ajaran) yang benar, niat atau sikap yang benar, perkataan yang benar, tingkah laku yang benar, penghidupan (mata pencaharian) yang benar, usaha yang benar, perhatian yang benar, dan semadi yang benar.

Untuk memperdalam masalah ini, kamu dapat membaca buku **Sanusi Pane,** **_Sejarah Indonesia._**

### 3. Masuknya pengaruh Hindu-Buddha

Agama dan kebudayaan Hindu-Buddha berkembang di Indonesia. Satu bukti adalah ditemukannya arca Buddha terbuat dari perunggu di daerah _Sempaga_ , Sulawesi Selatan. Menurut ciri-cirinya, arca _Sempaga_ memperlihatkan langgam seni arca _Amarawati_ dari India Selatan. Arca sejenis juga ditemukan di daerah Jember, Jawa Timur dan daerah Bukit Siguntang Sumatra Selatan. Di daerah Kota Bangun Kutai, Kalimantan Timur, juga ditemukan arca Buddha. Arca Buddha itu memperlihatkan ciri seni area dari India Utara. Kalau begitu kapan agama dan kebudayaan Hindu-Buddha dari India itu masuk ke Kepulauan Indonesia?

Proses masuknya Hindu-Buddha atau sering disebut _Hindunisasi_ di Kepulauan Indonesia ini masih ada berbagai pendapat. Sampai saat ini masih ada perbedaan pendapat mengenai cara dan jalur proses masuk dan berkembangnya pengaruh Hindu-Buddha di Kepulauan Indonesia. Beberapa pendapat (teori) tersebut dijelaskan pada uraian berikut.

_Pertama,_ sering disebut dengan teori _Ksatria_ . Dalam kaitan ini R.C. Majundar berpendapat, bahwa munculnya kerajaan atau pengaruh Hindu di Kepulauan Indonesia disebabkan oleh peranan kaum ksatria atau para prajurit India. Para prajurit diduga melarikan diri dari India dan mendirikan kerajaan-kerajaan di Kepulauan Indonesia dan Asia Tenggara pada umumnya. Namun, teori Ksatria yang dikemukakan oleh R.C. Majundar ini kurang disertai dengan

bukti-bukti yang mendukung. Selama ini belum ada ahli akelog yang dapat menemukan bukti-bukti yang menunjukkan adanya ekspansi dari prajurit-prajurit India ke Kepulauan Indonesia. Kekuatan teori ini terletak pada semangat untuk petualangan para kaum ksatria.

_Kedua,_ teori _Waisya_ . Teori ini terkait dengan pendapat N.J. Krom yang mengatakan bahwa kelompok yang berperan dalam dalam penyebaran Hindu-Buddha di Asia Tenggara, termasuk Indonesia adalah kaum pedagang. Pada mulanya para pedagang India berlayar untuk berdagang. Pada saat itu jalur perdagangan melalui lautan yang tergantung dengan adanya musim angin yang menyebabkan mereka tergantung pada kondisi alam. Bila musim angin tidak memungkinkan maka mereka akan menetap lebih lama untuk menunggu musim baik. Para pedagang India pun melakukan perkawinan dengan penduduk pribumi dan melalui perkawinan tersebut mereka mengembangkan kebudayaan India. Menurut G. Coedes, yang memotivasi para pedagang India untuk datang ke Asia Tenggara adalah keinginan untuk memperoleh barang tambang terutama emas dan hasil hutan.

_Ketiga,_ teori _Brahmana_ . Teori sesuai dengan pendapat J.C. van Leur bahwa Hinduninasi di Indonesia disebabkan oleh peranan kaum Brahmana. Pendapat van Leur didasarkan atas temuantemuan prasati yang menggunakan bahasa Sanskerta dan huruf _pallawa._ Bahasa dan huruf tersebut hanya dikuasai oleh kaum Brahmana. Selain itu adanya kepentingan dari para penguasa untuk mengundang para Brahmana India. Mereka diundang ke Asia Tenggara untuk keperluan upacara keagamaan. Seperti pelaksanaan upacara inisiasi yang dilakukan oleh para kepala suku agar mereka menjadi golongan ksatria. Pandangan ini sejalan dengan pendapat yang dikemukan oleh Paul Wheatly bahwa para penguasa lokal di Asia Tenggara sangat berkepentingan dengan kebudayaan India guna mengangkat status sosial mereka.

_Keempat_ , teori yang dinamakan teori _Arus Balik._ Teori ini lebih menekankan pada peranan bangsa Indonesia sendiri dalam proses penyebaran kebudayaan Hindu-Buddha di Indonesia. Artinya, orang-orang di Kepulauan Indonesia terutama para tokoh-tokohnya yang pergi ke india. Di India mereka belajar hal ihwal agama dan kebudayaan Hindu-Buddha. Setelah kembali ke Kepulauan Indonesia mereka mengajarkan dan menyebarkan ajaran agama itu kepada masyarakatnya. Pandangan ini dapat dikaitkan dengan pandangan F.D.K. Bosch yang menyatakan bahwa proses Indianisasi di Kepulauan Indonesia dilakukan oleh kelompok tertentu, mereka itu terdiri dari kaum terpelajar yang mempunyai semangat untuk menyebarkan Buddha. Kedatangan mereka disambut baik oleh tokoh masyarakat. Selanjutnya karena tertarik dengan ajaran HinduBuddha mereka pergi ke India untuk memperdalam ajaran itu. Lebih lanjut Bosch mengemukakan bahwa proses Indianisasi adalah suatu pengaruh yang kuat terhadap kebudayaan lokal.

Berdasarkan teori-teori yang dikemukan di atas dapat ditarik suatu kesimpulan bahwa masyarakat di Kepulauan Indonesia telah mencapai tingkatan tertentu sebelum munculnya kerajaan yang bersifat Hindu-Buddha. Melalui proses akulturisasi, budaya yang dianggap sesuai dengan karateristik masyarakat pada saat itu diterima dengan menyesuaikan pada budaya masyarakat setempat saat itu.

Untuk memahami lebih lanjut kamu dapat membaca buku **Taufik Abdullah dan Adrian B. Lapian (ed)** **_Indonesia Dalam Arus Sejarah,_ jilid II.**

Nah, bagaimana selanjutnya dengan persebaran agamaagama itu? Beberapa bukti-bukti arkeologis menunjukkan perkembangan masuknya agama Hindu-Buddha di Kepulauan Indonesia. Pengaruh Hindu ditemukan berasal pada abad ke-4 - ke-5 Masehi. Prasasti yang ditemukan di Kutai dan Tarumanagara yang menyebutkan sapi sebagai hewan persembahan menunjukkan bahwa agama Hindu berkembang di daerah itu. Juga adanya penyebutan Dewa Trimurti yaitu, Brahma, Wisnu, dan Siwa

### Uji Kompetensi

1. Buatlah analisis teori mana yang paling kuat dari beberapa teori masuknya agama dan budaya Hindu-Buddha!

2. Jelaskan kelemahan dan kelebihan masing-masing teori tersebut!

3. Mengapa rakyat Indonesia mudah menerima ajaran HinduBuddha?

4. Mengapa agama dan kebudayaan Hindu masih berkembang di Bali?

### Tugas

Setelah kita memahami kehidupan masyarakat awal HinduBuddha, coba amati dan perhatikanlah daerah di sekitar tempat tinggal kamu. Apakah masih ada pengaruh-pengaruh budaya masa Hindu-Buddha yang masih dilakukan di tempat tinggal sekitar kamu. Buatlah kelompok dengan teman kamu dan buatlah catatan atas permasalahan berikut ini:

1. Coba kamu identifikasi beberapa tinggalan budaya HinduBuddha dalam bentuk budaya benda/fisik maupun budaya tak benda/non fisik di lingkungan sekitarmu!

2. Bagaimana kamu menyikapi perkembangan kebudayaan terdahulu yang berkembang di lingkunganmu?

## B. Kerajaan-Kerajaan pada Masa Hindu-Buddha

### Mengamati lingkungan

Mungkin kamu pernah mendengar atau malah sudah pernah berkunjung di suatu tempat atau yang disebut Trowulan di Mojokerto. Kompleks Trowulan inilah yang diperkirakan dulu menjadi pusat pemerintahan Majapahit. Beberapa situs yang dapat kita temukan sekarang misalnya ada pendhopo, segaran, Candi Bajang Ratu dan sebagainya. Kamu bayangkan Majapahit tempo dulu merupakan kerajaan yang luas dan sudah menjalin kerja sama dengan kerajaankerajaan di luar Kepulauan Indonesia. Bahkan Mohammad Yamin menyebut Kerajaan Majapahit itu sebagai Kerajaan Nasional kedua. Bayangkan pula tokoh besar seperti Patih Gajah Mada dan Raja Hayam Wuruk yang berhasil mempersatukan Nusantara. Bahkan hingga saat ini kebesaran Patih Gajah Mada masih melekat dalam ingatan kita, hingga makam Patih Gajah Mada oleh masyakarat Lombok Timur dipercaya berada di kompleks pemakaman Raja Selaparang. Cerita kebesaran Patih Gajah Mada juga terdapat di daerah lain. Nah, itulah salah satu kisah kecil Kerajaan Majapahit, Satu diantara kerajaan Hindu-Buddha di Nusantara. Berikut ini kita akan mempelajari perkembangan beberapa kerajaan HinduBuddha.

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0073-04.png)

Gambar 2.3 Makam ini dipercaya oleh masyarakat sebagai makam Patih Gajah Mada terletak dalam pemakaman Selaparang, Lombok Timur, Nusa Tenggara Barat.

Sumber: Dok. Amurwani, 2012

### 1. Kerajaan Kutai

Bicara soal perkembangan Kerajaan Kutai, tidak lepas dari sosok Raja Mulawarman. Kamu perlu memahami keberadaan Kerajaan Kutai, karena Kerajaan Kutai ini dipandang sebagai kerajaan Hindu-Buddha yang pertama di Indonesia. Kerajaan Kutai diperkirakan terletak di daerah Muarakaman di tepi Sungai Mahakam, Kalimantan Timur. Sungai Mahakam merupakan sungai yang cukup besar dan memiliki beberapa anak sungai. Daerah di sekitar tempat pertemuan antara Sungai Mahakam dengan anak sungainya diperkirakan merupakan letak Muarakaman dahulu. Sungai Mahakam dapat dilayari dari pantai sampai masuk ke Muarakaman, sehingga baik untuk perdagangan. Inilah posisi yang sangat menguntungkan untuk meningkatkan perekonomian masyarakat. Sungguh Tuhan Yang Maha Esa menciptakan alam semesta dan tanah air Indonesia itu begitu kaya dan strategis. Hal ini perlu kita syukuri.

Untuk memahami perkembangan Kerajaan Kutai itu, tentu memerlukan sumber sejarah yang dapat menjelaskannya. Sumber sejarah Kutai yang utama adalah prasasti yang disebut _yupa_ , yaitu berupa batu bertulis. _Yupa_ juga sebagai tugu peringatan dari upacara kurban. _Yupa_ ini dikeluarkan pada masa pemerintahan raja Mulawarman. Prasasti _yupa_ ditulis dengan huruf _pallawa_ dan bahasa _sanskerta_ . Dengan melihat bentuk hurufnya, para ahli berpendapat bahwa _yupa_ dibuat sekitar abad ke-5 M.

Yang menarik dalam prasasti itu juga disebut nama kakek Mulawarman yang bernama Kudungga. Kudungga berarti penguasa lokal, dan yang setelah terkena pengaruh Hindu-Buddha daerah tersebut berubah menjadi kerajaan. Namanya tetap Kudungga berbeda dengan nama puteranya yang bernama Aswawarman dan

cucunya yang bernama Mulawarman. Oleh karena itu yang terkenal sebagai _wamsakerta_ adalah Aswawarman. Coba pelajaran apa yang dapat kita peroleh dengan persoalan nama di dalam satu keluarga Kudungga itu?

Satu di antara _yupa_ itu memberi informasi penting tentang silsilah Raja Mulawarman. Diterangkan bahwa Kudungga mempunyai putra bernama Aswawarman. Raja Aswawarman dikatakan seperti Dewa Ansuman (Dewa Matahari). Aswawarman mempunyai tiga anak, tetapi yang terkenal adalah Mulawarman. Raja Mulawarman dikatakan sebagai raja yang terbesar di Kutai. Ia pemeluk agama Hindu-Siwa yang setia. Tempat sucinya dinamakan _Waprakeswara_ . Ia juga dikenal sebagai raja yang sangat dekat dengan kaum brahmana dan rakyat. Raja Mulawarman sangat dermawan. Ia mengadakan kurban emas dan 20.000 ekor lembu untuk para brahmana. Oleh karena itu, sebagai rasa terima kasih dan peringatan mengenai upacara kurban, para brahmana mendirikan sebuah _yupa._

Untuk memperdalam masalah ini, kamu dapat membaca buku **Taufik Abdullah dan Adrian B. Lapian.** **_Indonesia dalam Arus Sejarah,_ jilid II** .

Pada masa pemerintahan Mulawarman, Kutai mengalami zaman keemasan. Kehidupan ekonomi pun mengalami perkembangan. Kutai terletak di tepi sungai, sehingga masyarakatnya melakukan pertanian. Selain itu, mereka banyak yang melakukan perdagangan. Bahkan diperkirakan sudah terjadi hubungan dagang dengan luar. Jalur perdagangan internasional dari India melewati Selat Makassar, terus ke Filipina dan sampai di Cina. Dalam pelayarannya dimungkinkan para pedagang itu singgah terlebih dahulu di Kutai. Dengan demikian, Kutai semakin ramai dan rakyat hidup makmur.

#### Uji Kompetensi

Satu di antara _yupa_ di Kerajaan Kutai berisi keterangan yang artinya:

> Sang Mulawarman, raja yang mulia dan terkemuka, telah memberi sedekah 20.000 ekor sapi kepada para brahmana yang seperti api, (bertempat) di dalam tanah yang sangat suci (bernama) Waprakeswara.

1. Bila benar Kudungga adalah penduduk pribumi, bagaimana agama Hindu dapat masuk di Kerajaan Kutai? Hubungkanlah jawabanmu dengan teori tentang proses masuk dan berkembangnya agama dan kebudayaan Hindu di Nusantara.

2. Bacalah dengan cermat keterangan di yupa itu. Bila isi yupa itu diartikan secara harfiah, Raja Mulawarman memberikan hadiah sapi sebanyak 20.000 ekor kepada para brahmana, artinya pada abad ke-5 telah ada suatu peternakan yang sangat maju. Permasalahan yang muncul adalah benarkah pada saat itu peternakan sudah begitu majunya, sehingga dengan mudah memberikan 20.000 ekor sapi. Diskusikan dengan teman-teman sekelas kamu.

Sumber : Taufik Abdullah (ed). 2012. _Indonesia Dalam Arus Sejarah. Jilid II._ Jakarta: PT. Ichtiar Baru van Hoeve.

### 2. Kerajaan Tarumanegara

Sejarah tertua yang berkaitan dengan pengendalian banjir dan sistem pengairan adalah pada masa Kerajaan Tarumanegara. Untuk mengendalikan banjir dan pertanian yang diduga di wilayah Jakarta saat ini, maka Raja Purnawarman menggali sungai Candrabaga. Setelah selesai melakukan penggalian sungai maka raja mempersembahkan 1.000 ekor lembu pada brahmana. Berkat sungai itulah penduduk Tarumanegara menjadi makmur. Siapakah Raja Purnawarman itu?

Purnawarman adalah raja terkenal dari Tarumanegara. Perlu kamu pahami bahwa setelah Kerajaan Kutai berkembang di Kalimantan Timur, di Jawa bagian barat muncul Kerajaan Tarumanegara. Kerajaan ini terletak tidak jauh dari pantai utara Jawa bagian Barat. Berdasarkan prasasti-prasasti yang ditemukan letak pusat Kerajaan Tarumanegara diperkirakan di antara Sungai Citarum dan Cisadane. Kalau mengingat namanya Tarumanegara, dan kata _taruma_ mungkin berkaitan dengan kata _tarum_ yang artinya nila. Kata _tarum_ dipakai sebagai nama sebuah sungai di Jawa Barat, yakni Sungai Citarum. Mungkin juga letak Tarumanegara dekat dengan aliran Sungai Citarum. Kemudian berdasarkan Prasasti Tugu, Purbacaraka memperkirakan pusatnya ada di daerah Bekasi.

Sumber sejarah Tarumanegara yang utama adalah beberapa prasasti yang telah ditemukan. Berkaitan dengan perkembangan Kerajaan Tarumanegara, telah ditemukan tujuh buah prasasti. Prasasti-prasasti itu berhuruf _pallawa_ dan berbahasa _sansekerta_ . Ketujuh prasasti itu adalah :

#### 1. Prasasti Ciareteun

Prasasti ini ditemukan di tepi Sungai Citarum di dekat muaranya yang mengalir ke Sungai Cisadane, di daerah Bogor. Pada prasasti ini dipahatkan sepasang telapak kaki Raja Purnawarman.

#### 2. Prasati Kebon Kopi

Prasasti Kebon Kopi ditemukan di Kampung Muara Hilir, Kecamatan Cibungbulang, Bogor. Pada prasasti ini ada pahatan gambar tapak kaki gajah yang disamakan dengan tapak kaki gajah Airawata (gajah kendaraan Dewa Wisnu).

#### 3. Prasasti Jambu

Prasasti ini ditemukan di perkebunan Jambu, Bukit Koleangkok, kira-kira 30 km sebelah barat Bogor. Dalam prasasti itu diterangkan bahwa Raja Purnawarman itu gagah, pemimpin yang termasyhur, dan baju zirahnya tidak dapat ditembus senjata musuh.

#### 4. Prasasti Tugu

Prasasti Tugu ditemukan di Desa Tugu, Cilincing Jakarta. Prasasti ini menerangkan tentang penggalian saluran Gomati dan Sungai Candrabhaga. Mengenai nama Candrabhaga, Purbacaraka mengartikan candra = bulan = sasi. Candrabhaga menjadi sasibhaga dan kemudian menjadi Bhagasasi - bagasi, akhirnya menjadi Bekasi.

#### 5. Prasasti Pasir Awi

Prasasti Pasir Awi ditemukan di daerah Bogor.

#### 6. Prasasti Muara Cianten

Prasasti Muara Cianten ditemukan di daerah Bogor.

#### 7. Prasasti Lebak

Prasasti Lebak ditemukan di tepi Sungai Cidanghiang, Kecamatan Muncul, Banten Selatan. Prasasti ini menerangkan tentang keperwiraan, keagungan, dan keberanian Purnawarman sebagai raja dunia.

Di samping beberapa prasasti tersebut, berita Cina juga dapat dijadikan sumber sejarah Kerajaan Tarumanegara. Terutama berita yang disampaikan oleh seorang musafir Cina yang bernama Fa-Hien yang berkunjung ke Jawa. Ia telah menyebut adanya Kerajaan To-lomo atau Taruma.

<div class="grid sm:grid-cols-2 gap-6">

<div>

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0079-01.png)

Gambar 2.4 Prasasti Tugu

Sumber : Bambang Budi Utomo. 2010. _Atlas Sejarah Indonesia Masa Klasik (Hindu-Buddha)._ Jakarta: Kementerian Kebudayaan dan Pariwisata.

</div>

<div>

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0079-04.png)

Gambar 2.5 Prasasti Kebon Kopi I

Sumber : Bambang Budi Utomo. 2010. _Atlas Sejarah Indonesia Masa Klasik (Hindu-Buddha)._ Jakarta: Kementerian Kebudayaan dan Pariwisata.

</div>

<div>

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0079-07.png)

Gambar 2.6 Prasasti Ciareteun

Sumber : Bambang Budi Utomo. 2010. _Atlas Sejarah Indonesia Masa Klasik (Hindu-Buddha)._ Jakarta: Kementerian Kebudayaan dan Pariwisata.

</div>

<div>

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0079-10.png)

Gambar 2.7 Prasasti Kebon Kopi II

Sumber : Bambang Budi Utomo. 2010. Atlas Sejarah Indonesia Masa Klasik (Hindu-Buddha). Jakarta: Kementerian Kebudayaan dan Pariwisata.

</div>

</div>

#### Pemerintahan dan Kehidupan Masyarakat

Kerajaan Tarumanegara mulai berkembang pada abad ke-5 M. Raja yang sangat terkenal adalah Purnawarman. Ia dikenal sebagai raja yang gagah berani dan tegas. Ia juga dekat dengan para brahmana, pangeran, dan rakyat. Ia raja yang jujur, adil, dan arif di dalam memerintah. Daerahnya cukup luas sampai ke daerah Banten. Kerajaan Tarumanegara telah menjalin hubungan dengan kerajaan lain, misalnya dengan Cina.

Dalam kehidupan agama, sebagian besar masyarakat Tarumanegara memeluk agama Hindu. Sedikit yang beragama Buddha dan masih ada yang mempertahankan agama nenek moyang (animisme). Berdasarkan berita dan Fa-Hien, di Tolomo ada tiga agama, yakni agama Hindu, agama Buddha dan kepercayaan animisme. Raja memeluk agama Hindu. Sebagai bukti, pada prasasti Ciareteun ada tapak kaki raja yang diibaratkan tapak kaki Dewa Wisnu. Sumber Cina lainnya menyatakan bahwa, pada masa Dinasti T’ang terjadi hubungan perdagangan dengan Jawa. Barang-barang yang diperdagangkan adalah kulit penyu, emas, perak, cula badak, dan gading gajah. Penduduk daerah itu pandai membuat minuman keras yang terbuat dari bunga kelapa.

Rakyat Tarumanegara hidup aman dan tenteram. Pertanian merupakan mata pencaharian pokok. Di samping itu, perdagangan juga berkembang. Kerajaan Tarumanegara mengadakan hubungan dagang dengan Cina dan India.

Untuk memajukan bidang pertanian, raja memerintahkan pembangunan irigasi dengan cara menggali sebuah saluran sepanjang 6112 tumbak (±11 km). Saluran itu disebut dengan Sungai Gomati. Saluran itu selain berfungsi sebagai irigasi juga untuk mencegah bahaya banjir.

#### Uji Kompetensi

Prasasti Jambu ( Pasir Koleangkak) terletak di sebuah bukit, di Desa Parakan Muncang, Nanggung, Bogor. Prasasti ini ditulis dalam dua baris tulisan dengan aksara Pallawa dan bahasa Sanskerta. Isinya sebagainya berikut:

> Gagah, mengagumkan dan jujur terhadap tugasnya, adalah pemimpin manusia yang tiada taranya, yang termasyhur Sri Purnawarman, yang sekali waktu (memerintah) di Tarumanagara dan baju zirahnya yang terkenal tiada dapat ditembus senjata musuh. Ini adalah sepasang telapak kakinya yang senantiasa berhasil menggempur musuh, hormat kepada para pangeran, tetapi merupakan duri dalam daging musuh-musuhnya.

Sumber : Taufik Abdullah (ed). 2012. _Indonesia Dalam Arus Sejarah_ . Jilid II. Jakarta: PT. Ichtiar Baru van Hoeve.

Bagaimana pendapat kamu tentang isi teks di atas? Apakah pola kepemimpinan tokoh yang dijelaskan pada teks tersebut masih sesuai dengan pemimpin ideal saat ini?

### 3. Kerajaan Kalingga

Ratu Sima adalah penguasa di Kerajaan Kalingga. Ia digambarkan sebagai seorang pemimpin wanita yang tegas dan taat terhadap peraturan yang berlaku dalam kerajaan itu. Kerajaan Kalingga atau Holing, diperkirakan terletak di Jawa bagian tengah. Nama Kalingga berasal dari Kalinga, nama sebuah kerajaan di India Selatan. Menurut berita Cina, di sebelah timur Kalingga ada Po-li (Bali sekarang), di sebelah barat Kalingga terdapat To-po-Teng (Sumatra). Sementara di sebelah utara Kalingga terdapat Chen-la (Kamboja) dan sebelah selatan berbatasan dengan samudera. Oleh karena itu, Kalingga diperkirakan terletak di Jawa Tengah, di Kecamatan Keling, sebelah utara Gunung Muria.

Sumber utama mengenai Kerajaan Kalingga adalah berita Cina, misalnya berita dari Dinasti T’ang. Sumber lain adalah Prasasti Tuk Mas di lereng Gunung Merbabu. Melalui berita Cina, banyak hal yang kita ketahui tentang perkembangan Kerajaan Kalingga dan kehidupan masyarakatnya. Kerajaan Kalingga berkembang kira-kira abad ke-7 - ke-9 M.

#### Pemerintahan dan Kehidupan Masyarakat

Raja yang paling terkenal pada masa Kerajaan Kalingga adalah seorang raja wanita yang bernama Ratu Sima. Ia memerintah sekitar tahun 674 M. Ia dikenal sebagai raja yang tegas, jujur, dan sangat bijaksana. Hukum dilaksanakan dengan tegas dan seadil-adilnya. Rakyat patuh terhadap semua peraturan yang berlaku. Untuk mencoba kejujuran rakyatnya, Ratu Sima pernah mencobanya, dengan meletakkan pundipundi di tengah jalan. Ternyata sampai waktu yang lama tidak ada yang mengusik pundi-pundi itu. Akan tetapi, pada suatu hari ada anggota keluarga istana yang sedang jalanjalan, menyentuh kantong pundi-pundi dengan kakinya Hal ini diketahui Ratu Sima. Anggota keluarga istana itu dinilai salah dan harus diberi hukuman mati. Akan tetapi atas usul persidangan para menteri, hukuman itu diperingan dengan hukuman potong kaki. Kisah ini menunjukkan, begitu tegas dan adilnya Ratu Sima. Ia tidak membedakan antara rakyat dan anggota kerabatnya sendiri.

Agama utama yang dianut oleh penduduk Kalingga pada umumnya Buddha. Agama Buddha berkembang pesat. Bahkan pendeta Cina yang bernama Hwi-ning datang di Kaling dan tinggal selama tiga tahun. Selama di Kalingga, ia menerjemahkan kitab suci agama Buddha Hinayana ke dalam bahasa Cina. Dalam usaha menterjemahkan kitab itu Hwining dibantu oleh seorang pendeta bernama Jnanabadra.

Kepemimpinan raja yang adil, menjadikan rakyat hidup teratur, aman,dan tenteram. Mata pencaharian penduduk pada umumnya adalah bertani, karena wilayah Kalingga subur untuk pertanian. Di samping itu, penduduk juga melakukan perdagangan.

Kerajaan Kalingga mengalami kemunduran kemungkinan akibat serangan Sriwijaya yang menguasai perdagangan. Serangan tersebut mengakibatkan pemerintahan Kijen menyingkir ke Jawa bagian timur atau mundur ke pedalaman Jawa bagian tengah antara tahun 742 -755 M.

#### Uji Kompetensi

1. Dari bacaan di atas, bagaimana pendapat kamu tentang kepemimpinan seorang wanita di Indonesia?

2. Bagaimana pendapat kamu dengan hukuman yang diterapkan oleh Ratu Sima pada putra mahkota? Bagaimana dengan pelaksaan hukum di negeri kita saat ini?

3. Coba kamu buat peta letak kerajaan Holing atau Kalingga berada saat itu?

### 4. Kerajaan Sriwijaya

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0084-03.png)

Gambar 2.8 Manapo Tinggi Muara Jambi

Sumber: Dok. Direktorat Geografi Sejarah, Kementerian Kebudayaan dan Pariwisata. 2010

Sejak permulaan tarikh Masehi, hubungan dagang antara, India dengan Kepulauan Indonesia sudah ramai. Daerah pantai timur Sumatra menjadi jalur perdagangan yang ramai dikunjungi para pedagang. Kemudian, muncul pusat-pusat perdagangan yang berkembang menjadi pusat kerajaan. Kerajaan-kerajaan kecil di pantai Sumatra bagian timur sekitar abad ke-7, antara lain Tulangbawang, Melayu, dan Sriwijaya. Dari ketiga kerajaan itu, yang kemudian berhasil berkembang dan mencapai kejayaannya adalah Sriwijaya. Kerajaan Melayu juga sempat berkembang, dengan pusatnya di Jambi.

Pada tahun 692 M, Sriwijaya mengadakan ekspansi ke daerah sekitar Melayu. Melayu dapat ditaklukkan dan berada di bawah kekuasaan Sriwijaya. Letak pusat Kerajaan Sriwijaya ada berbagai pendapat. Ada yang berpendapat bahwa pusat Kerajaan Sriwijaya ada di Palembang, ada yang berpendapat di Jambi, bahkan ada yang berpendapat di luar Indonesia. Akan tetapi, pendapat yang banyak didukung oleh para ahli, pusat Kerajaan Sriwijaya adalah di Palembang, di dekat pantai dan di tepi Sungai Musi. Ketika pusat

Kerajaan Sriwijaya di Palembang mulai menunjukkan kemunduran, Sriwijaya berpindah ke Jambi.

Sumber sejarah Kerajaan Sriwijaya yang penting adalah prasasti. Prasasti-prasasti itu ditulis dengan huruf _Pallawa_ . Bahasa yang dipakai Melayu Kuno. Beberapa prasasti itu antara lain sebagai berikut.

#### 1. Prasasti Kedukan Bukit

Prasasti Kedukan Bukit ditemukan di tepi Sungai Tatang, dekat Palembang. Prasasti ini berangka tahun 605 Saka (683 M). Isinya antara lain menerangkan bahwa seorang bernama Dapunta Hyang mengadakan perjalanan suci ( _siddhayatra_ ) dengan menggunakan perahu. Ia berangkat dari Minangatamwan dengan membawa tentara 20.000 personil.

#### 2. Prasasti Talang Tuo

Prasasti Talang Tuo ditemukan di sebelah barat Kota Palembang di daerah Talang Tuo. Prasasti ini berangka tahun 606 Saka (684 M). Isinya menyebutkan tentang pembangunan sebuah taman yang disebut Sriksetra. Taman ini dibuat oleh Dapunta Hyang Sri Jayanaga.

#### 3. Prasasti Telaga Batu

Prasasti Telaga Batu ditemukan di Palembang. Prasasti ini tidak berangka tahun. Isinya terutama tentang kutukan-

<div class="grid sm:grid-cols-2 gap-6">
<div class="sm:col-start-1 sm:row-start-1">

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0085-10.png)

Gambar 2.9 Prasasti Kedukan Bukit

Sumber : Bambang Budi Utomo. 2010. _Atlas Sejarah Indonesia Masa Klasik (Hindu-Buddha),_ Jakarta: Kementerian Kebudayaan dan Pariwisata.

</div>
<div class="sm:col-start-1 sm:row-start-2">

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0085-13.png)

Gambar 2.10 Prasasti Telaga Batu

Sumber : Bambang Budi Utomo. 2010. _Atlas Sejarah Indonesia Masa Klasik (Hindu-Buddha),_ Jakarta: Kementerian Kebudayaan dan Pariwisata.

</div>
<div class="sm:col-start-2 sm:row-start-1 sm:row-span-2 [&_img]:w-57 [&_img]:mx-auto">

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0086-01.png)

Gambar 2.11 Prasasti Kota Kapur

Sumber : Bambang Budi Utomo. 2010. _Atlas Sejarah Indonesia Masa Klasik (Hindu-Buddha),_ Jakarta: Kementerian Kebudayaan dan Pariwisata.

</div>
</div>

kutukan yang menakutkan bagi mereka yang berbuat kejahatan.

#### 4. Prasasti Kota Kapur

Prasasti Kota Kapur ditemukan di Pulau Bangka, berangka tahun 608 Saka (656 M). Isinya terutama permintaan kepada para dewa untuk menjaga kedatuan Sriwijaya, dan menghukum setiap orang yang bermaksud jahat.

#### 5. Prasasti Karang Berahi

Prasasti Karang Berahi ditemukan di Jambi, berangka tahun 608 saka (686 M). Isinya sama dengan isi Prasasti Kota Kapur.Beberapa prasasti yang lain, yakni Prasasti Ligor berangka tahun 775 M ditemukan di Ligor, Semenanjung Melayu, dan Prasasti Nalanda di India Timur. Di samping prasasti-prasasti tersebut, berita Cina juga merupakan sumber sejarah Sriwijaya yang penting. Misalnya berita dari I-tsing, yang pernah tinggal di Sriwijaya.

#### Perkembangan Kerajaan Sriwijaya

Ada beberapa faktor yang mendorong perkembangan Sriwijaya antara lain :

- a. Letak geografis dari Kota Palembang. Palembang sebagai pusat pemerintahan terletak di tepi Sungai Musi. Di depan muara Sungai Musi terdapat pulau-pulau yang berfungsi sebagai pelindung pelabuhan di Muara Sungai Musi. Keadaan seperti ini sangat tepat untuk kegiatan pemerintahan dan pertahanan. Kondisi itu pula menjadikan Sriwijaya sebagai jalur perdagangan internasional dari India ke Cina, atau sebaliknya. Juga kondisi sungai-sungai yang besar, perairan laut yang cukup tenang, serta penduduknya yang berbakat sebagai pelaut ulung.

- b. Runtuhnya Kerajaan Funan di Vietnam akibat serangan Kamboja. Hal ini telah memberi kesempatan Sriwijaya untuk cepat berkembang sebagai negara maritim.

#### Perkembangan Politik dan Pemerintahan

Kerajaan Sriwijaya mulai berkembang pada abad ke-7. Pada awal perkembangannya, rajanya disebut dengan Dapunta Hyang. Dalam Prasasti Kedukan Bukit dan Talang Tuo telah ditulis sebutan Dapunta Hyang. Pada abad ke-7, Dapunta Hyang banyak melakukan usaha perluasan daerah.

Daerah-daerah yang berhasil dikuasai antara lain sebagai berikut.

- a. Tulang-Bawang yang terletak di daerah Lampung.

- b. Daerah Kedah yang terletak di pantai barat Semenanjung Melayu. Daerah ini sangat panting artinya bagi usaha pengembangan perdagangan dengan India. Menurut I-tsing, penaklukan Sriwijaya atas Kedah berlangsung antara tahun 682-685 M.

- c. Pulau Bangka yang terletak di pertemuan jalan perdagangan internasional, merupakan daerah yang sangat penting. Daerah ini dapat dikuasai Sriwijaya pada tahun 686 M berdasarkan Prasasti Kota Kapur. Sriwijaya juga diceritakan berusaha menaklukkan Bhumi Java yang tidak setia kepada Sriwijaya. Bhumi Java yang dimaksud adalah Jawa, khususnya Jawa bagian barat.

- d. Daerah Jambi terletak di tepi Sungai Batanghari. Daerah ini memiliki kedudukan yang penting, terutama untuk memperlancar perdagangan di pantai timur Sumatra. Penaklukan ini dilaksanakan kira-kira tahun 686 M (Prasasti Karang Berahi).

- e. Tanah Genting Kra merupakan tanah genting bagian utara Semenanjung Melayu. Kedudukan Tanah Genting Kra sangat penting. Jarak antara pantai barat dan pantai timur di tanah genting sangat dekat, sehingga para pedagang dari Cina berlabuh dahulu di pantai timur dan membongkar barang dagangannya untuk diangkut dengan pedati ke pantai barat. Kemudian mereka berlayar

<div class="grid sm:grid-cols-2 gap-6">
<div>

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0088-01.png)

Gambar 2.12 Arca Maitreya

Sumber : Bambang Budi Utomo. 2010. _Atlas Sejarah Indonesia Masa Klasik (Hindu-Buddha)_ , Jakarta: Kementerian Kebudayaan dan Pariwisata.

</div>
<div>

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0088-04.png)

Gambar 2.13 Stupa Mahligai dalam kompleks Stupa Muara Takus merupakan tinggalan Kerajaan Sriwijaya

Sumber : Bambang Budi Utomo. 2010. _Atlas Sejarah Indonesia Masa Klasik (Hindu-Buddha),_ Jakarta: Kementerian Kebudayaan dan Pariwisata.

</div>
</div>

ke India. Penguasaan Sriwijaya atas Tanah Genting Kra dapat diketahui dari Prasasti Ligor yang berangka tahun 775 M.

f. Kerajaan Kaling dan Mataram Kuno. Menurut berita Cina, diterangkan adanya serangan dari barat, sehingga mendesak Kerajaan Kaling pindah ke sebelah timur. Diduga yang melakukan serangan adalah Sriwijaya. Sriwijaya ingin menguasai Jawa bagian tengah karena pantai utara Jawa bagian tengah juga merupakan jalur perdagangan yang penting.

Sriwijaya terus melakukan perluasan daerah, sehingga Sriwijaya menjadi kerajaan yang besar. Untuk lebih memperkuat pertahanannya, pada tahun 775 M dibangunlah sebuah pangkalan di daerah Ligor. Waktu itu yang menjadi raja adalah Darmasetra.

Raja yang terkenal dari Kerajaan Sriwijaya adalah Balaputradewa. Ia memerintah sekitar abad ke-9 M. Pada masa pemerintahannya, Sriwijaya berkembang pesat dan mencapai zaman keemasan. Balaputradewa adalah keturunan dari Dinasti Syailendra, yakni putra dari Raja Samarotungga dengan Dewi Tara dari Sriwijaya. Hal tersebut diterangkan dalam Prasasti Nalanda. Balaputradewa adalah seorang raja yang besar di Sriwijaya. Raja Balaputradewa menjalin hubungan erat dengan Kerajaan Benggala yang saat itu diperintah oleh Raja Dewapala Dewa. Raja ini menghadiahkan sebidang tanah kepada

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0089-01.png)

Gambar 2.14 Salah satu candi di Komplek Muaro Jambi

Sumber: Doc. Direktorat Sejarah dan Nilai Budaya, 2012

Balaputradewa untuk pendirian sebuah asrama bagi para pelajar dan mahapeserta didik yang sedang belajar di Nalanda, yang dibiayai oleh Balaputeradewa, sebagai “dharma”. Hal itu tercatat dengan baik dalam Prasasti Nalanda, yang saat ini berada di Universitas Nawa Nalanda, India. Bahkan bentuk asrama itu mempunyai kesamaan arsitektur dengan Candi Muara Jambi, yang berada di Provinsi Jambi saat ini. Hal tersebut menandakan Sriwijaya memperhatikan ilmu pengetahuan, terutama pengetahuan agama Buddha dan bahasa Sanskerta bagi generasi mudanya.

Pada tahun 990 M yang menjadi Raja Sriwijaya adalah Sri Sudamaniwarmadewa. Pada masa pemerintahan raja itu terjadi serangan Raja Darmawangsa dari Jawa bagian Timur. Akan tetapi, serangan itu berhasil digagalkan oleh tentara Sriwijaya. Sri Sudamaniwarmadewa kemudian digantikan oleh putranya yang bernama Marawijayottunggawarman. Pada masa pemerintahan Marawijayottunggawarman, Sriwijaya membina hubungan dengan Raja Rajaraya I dari Colamandala. Pada masa itu, Sriwijaya terus mempertahankan kebesarannya.

Pada masa kejayaannya, wilayah kekuasaan Sriwijaya cukup Luas. Daerah-daerah kekuasaannya antara lain Sumatra dan pulau-pulau sekitar Jawa bagian barat, sebagian Jawa bagian tengah, sebagian Kalimantan, Semenanjung Melayu, dan hampir seluruh perairan Nusantara. Bahkan Mohammad Yamin menyebutkan Sriwijaya sebagai negara nasional yang pertama.

Untuk mengurus setiap daerah kekuasaan Sriwijaya, dipercayakan kepada seorang Rakryan (wakil raja di daerah). Dalam hal ini Sriwijaya sudah mengenal struktur pemerintahan.

Tentang struktur ini kamu dapat membaca buku **Sardiman AM dan Kusriyantinah,** **_Sejarah Nasional_** dan **_Sejarah Umum_**

#### Perkembangan Ekonomi

Pada mulanya penduduk Sriwijaya hidup dengan bertani. Akan tetapi karena Sriwijaya terletak di tepi Sungai Musi dekat pantai, maka perdagangan menjadi cepat berkembang. Perdagangan kemudian menjadi mata pencaharian pokok. Perkembangan perdagangan didukung oleh keadaan dan letak Sriwijaya yang strategis. Sriwijaya terletak di persimpangan jalan perdagangan internasional. Para pedagang Cina yang akan ke India singgah dahulu di Sriwijaya, begitu juga para pedagang dan India yang akan ke Cina. Di Sriwijaya para pedagang melakukan bongkarmuat barang dagangan. Dengan demikian, Sriwijaya semakin ramai dan berkembang menjadi pusat perdagangan. Sriwijaya mulai menguasai perdagangan nasional maupun internasional di kawasan perairan Asia Tenggara. Perairan di Laut Natuna, Selat Malaka, Selat Sunda, dan Laut Jawa berada di bawah kekuasaan Sriwijaya.

Tampilnya Sriwijaya sebagai pusat perdagangan, memberikan kemakmuran bagi rakyat dan negara Sriwijaya. Kapal-kapal yang singgah dan melakukan bongkarmuat, harus membayar pajak. Dalam kegiatan perdagangan, Sriwijaya mengekspor gading, kulit, dan beberapa jenis binatang liar, sedangkan barang impornya antara lain beras, rempah-rempah, kayu manis, kemenyan, emas, gading, dan binatang.

Perkembangan tersebut telah memperkuat kedudukan Sriwijaya sebagai kerajaan maritim. Kerajaan maritim adalah kerajaan yang mengandalkan perekonomiannya dari kegiatan perdagangan dan hasil-hasil laut. Untuk memperkuat kedudukannya, Sriwijaya membentuk armada angkatan laut yang kuat. Melalui armada angkatan laut yang kuat Sriwijaya mampu mengawasi perairan di Nusantara. Hal ini sekaligus merupakan jaminan keamanan bagi para pedagang yang ingin berdagang dan berlayar di wilayah perairan Sriwijaya.

Kehidupan beragama di Sriwijaya sangat semarak. Bahkan Sriwijaya menjadi pusat agama Buddha Mahayana di seluruh wilayah Asia Tenggara. Diceritakan oleh I-tsing, bahwa di Sriwijaya tinggal ribuan pendeta dan pelajar agama Buddha. Salah seorang pendeta Buddha yang terkenal adalah Sakyakirti. Banyak mahapeserta didik asing yang datang ke Sriwijaya untuk belajar bahasa Sanskerta. Kemudian mereka belajar agama Buddha di Nalanda, India. Antara tahun 1011 - 1023 datang seorang pendeta agama Buddha dari Tibet bernama Atisa untuk lebih memperdalam pengetahuan agama Buddha.

Dalam kaitannya dengan perkembangan agama dan kebudayaan Buddha, di Sriwijaya ditemukan beberapa peninggalan. Misalnya, Candi Muara Takus, yang ditemukan

dekat Sungai Kampar di daerah Riau. Kemudian di daerah Bukit Siguntang ditemukan arca Buddha. Pada tahun 1006 Sriwijaya juga telah membangun wihara sebagai tempat suci agama Buddha di Nagipattana, India Selatan. Hubungan Sriwijaya dengan India Selatan waktu itu sangat erat.

Bangunan lain yang sangat penting adalah Biaro Bahal yang ada di Padang Lawas, Tapanuli Selatan. Di tempat ini pula terdapat bangunan wihara.

- Kerajaan Sriwijaya akhirnya mengalami kemunduran

- karena beberapa hal antara lain :

- a. Keadaan sekitar Sriwijaya berubah, tidak lagi dekat dengan pantai. Hal ini disebabkan aliran Sungai Musi, Ogan, dan Komering banyak membawa lumpur. Akibatnya. Sriwijaya tidak baik untuk perdagangan.

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0092-07.png)

Gambar 2.16 Pemandangan dari salah satu sisi Biaro Bahal III, Padang Lawas

Sumber : Bambang Budi Utomo. 2010. _Atlas Sejarah Indonesia Masa Klasik (Hindu-Buddha_ ), Jakarta: Kementerian Kebudayaan dan Pariwisata.

- b. Banyak daerah kekuasaan Sriwijaya yang melepaskan diri. Hal ini disebabkan terutama karena melemahnya angkatan laut Sriwijaya, sehingga pengawasan semakin sulit.

- c. Dari segi politik, beberapa kali Sriwijaya mendapat serangan dari kerajaan-kerajaan lain. Tahun 1017 M Sriwijaya mendapat serangan dari Raja Rajendracola dari Colamandala, namun Sriwijaya masih dapat bertahan. Tahun 1025 serangan itu diulangi, sehingga Raja Sriwijaya, Sri Sanggramawijayattunggawarman ditahan oleh pihak Kerajaan Colamandala. Tahun 1275, Raja Kertanegara dari Singhasari melakukan Ekspedisi Pamalayu. Hal itu menyebabkan daerah Melayu lepas. Tahun 1377 armada angkatan laut Majapahit menyerang Sriwijaya. Serangan ini mengakhiri riwayat Kerajaan Sriwijaya.

Gambar 2.15 Arca Buddha Kota Cina

Sumber : Bambang Budi Utomo. 2010. _Atlas Sejarah Indonesia Masa Klasik (Hindu-Buddha),_ Jakarta: Kementerian Kebudayaan dan Pariwisata.

#### Uji Kompetensi

1. Mengapa kerajaan Sriwijaya disebut sebagai kerajaan maritim?

2. Mengapa Selat Malaka mempunyai peranan penting pada masa Kerajaan Sriwijaya?

3. Unsur-unsur apa saja yang harus dikuasai, agar sebuah kerajaan mampu menjadi kerajaan maritim?

4. Setujukah kamu dengan sebutan Sriwijaya sebagai kerajaan nasional pertama ? Diskusikan dengan teman-teman.

5. Jika pada abad ke-7 saja Sriwijaya bisa menjadi kerajaan maritim hebat, mengapa sekarang kita belum mampu mengulangi kejayaan di lautan saat ini, apa yang perlu diperbaiki? Diskusikan dan uraikan jawaban kamu

6. Apa yang menyebabkan kerajaan Sriwijaya mengalami kemunduran?

7. Buatlah peta daerah pengaruh kekuasaan Kerajaan Sriwijaya.

### 5. Kerajaan Mataram Kuno

Pada pertengahan abad ke-8 di Jawa bagian tengah berdiri sebuah kerajaan baru. Kerajaan itu kita kenal dengan nama Kerajaan Mataram Kuno. Mengenai letak dan pusat Kerajaan Mataram Kuno tepatnya belum dapat dipastikan. Ada yang menyebutkan pusat kerajaan di Medang dan terletak di Poh Pitu. Sementara itu letak Poh Pitu sampai sekarang belum jelas. Keberadaan lokasi kerajaan itu dapat diterangkan berada di sekeliling pegunungan, dan sungaisungai. Di sebelah utara terdapat Gunung Merapi, Merbabu, Sumbing, dan Sindoro; di sebelah barat terdapat Pegunungan Serayu; di sebelah timur terdapat Gunung Lawu, serta di sebelah selatan berdekatan dengan Laut Selatan dan Pegunungan Seribu. Sungai-sungai yang ada, misalnya Sungai Bogowonto, Elo, Progo, Opak, dan Bengawan Solo. Letak Poh Pitu mungkin di antara Kedu sampai sekitar Prambanan.

Untuk mengetahui perkembangan Kerajaan Mataram Kuno dapat digunakan sumber yang berupa prasasti. Ada beberapa prasasti yang berkaitan dengan Kerajaan Mataram Kuno diantaranya Prasasti Canggal, Prasasti Kalasan, Prasasti Klura, Prasasti Kedu atau Prasasti Balitung. Di samping beberapa prasasti tersebut, sumber sejarah untuk Kerajaan Mataram Kuno juga berasal dari berita Cina.

#### Perkembangan Pemerintahan

Sebelum Sanjaya berkuasa di Mataram Kuno, di Jawa sudah berkuasa seorang raja bernama Sanna. Menurut prasasti Canggal yang berangka tahun 732 M, diterangkan bahwa Raja Sanna telah digantikan oleh Sanjaya. Raja Sanjaya adalah putra Sanaha, saudara perempuan dari Sanna.

Dalam Prasasti Sojomerto yang ditemukan di Desa Sojomerto, Kabupaten Batang, disebut nama Dapunta Syailendra yang beragama Syiwa (Hindu). Diperkirakan Dapunta Syailendra berasal dari Sriwijaya dan menurunkan

Dinasti Syailendra yang berkuasa di Jawa bagian tengah. Dalam hal ini Dapunta Syailendra diperkirakan yang menurunkan Sanna, sebagai raja di Jawa.

Sanjaya tampil memerintah Kerajaan Mataram Kuno pada tahun 717 - 780 M. Ia melanjutkan kekuasaan Sanna. Sanjaya kemudian melakukan penaklukan terhadap raja-raja kecil bekas bawahan Sanna yang melepaskan diri. Setelah itu, pada tahun 732 M Raja Sanjaya mendirikan bangunan suci sebagai tempat pemujaan. Bangunan ini berupa lingga dan berada di atas Gunung Wukir (Bukit Stirangga). Bangunan suci itu merupakan lambang keberhasilan Sanjaya dalam menaklukkan raja-raja lain.

Raja Sanjaya bersikap arif, adil dalam memerintah, dan memiliki pengetahuan luas. Para pujangga dan rakyat hormat kepada rajanya. Oleh karena itu, di bawah pemerintahan Raja Sanjaya, kerajaan menjadi aman dan tenteram. Rakyat hidup makmur. Mata pencaharian penting adalah pertanian dengan hasil utama padi. Sanjaya juga dikenal sebagai raja yang paham akan isi kitab-kitab suci. Bangunan suci dibangun oleh Sanjaya untuk pemujaan lingga di atas Gunung Wukir, sebagai lambang telah ditakhlukkannya raja-raja kecil di sekitarnya yang dulu mengakui kemaharajaan Sanna.

Setelah Raja Sanjaya wafat, ia digantikan oleh putranya bernama Rakai Panangkaran. Panangkaran mendukung adanya perkembangan agama Buddha. Dalam Prasasti Kalasan yang berangka tahun 778, Raja Panangkaran telah memberikan hadiah tanah dan memerintahkan membangun sebuah candi untuk Dewi Tara dan sebuah biara untuk para pendeta agama Buddha. Tanah dan bangunan tersebut terletak di Kalasan. Prasasti Kalasan juga menerangkan bahwa Raja Panangkaran disebut dengan nama Syailendra Sri Maharaja Dyah Pancapana Rakai Panangkaran. Raja Panangkaran kemudian memindahkan pusat pemerintahannya ke arah timur.

Raja Panangkaran dikenal sebagai penakluk yang gagah berani bagi musuhmusuh kerajaan. Daerahnya bertambah luas. Ia juga disebut sebagai permata dari Dinasti Syailendra. Agama Buddha Mahayana waktu itu berkembang pesat. Ia juga memerintahkan didirikannya bangunan-bangunan suci. Misalnya, candi Kalasan dan arca Manjusri.

Setelah kekuasaan Penangkaran berakhir, timbul persoalan dalam keluarga Syailendra, karena adanya perpecahan antara anggota keluarga yang sudah memeluk agama Buddha dengan keluarga yang masih memeluk agama Hindu (Syiwa).Hal ini menimbulkan perpecahan di dalam pemerintahan Kerajaan Mataram Kuno. Satu pemerintahan dipimpin oleh tokoh-tokoh kerabat istana yang menganut agama Hindu berkuasa di daerah Jawa bagian utara. Kemudian keluarga yang terdiri atas tokoh-tokoh yang beragama Buddha berkuasa di daerah Jawa bagian selatan. Keluarga Syailendra yang beragama Hindu meninggalkan bangunan-bangunan candi di Jawa bagian utara. Misalnya, candi-candi kompleks Pegunungan Dieng (Candi Dieng) dan kompleks Candi Gedongsongo. Kompleks Candi Dieng memakai nama-nama tokoh wayang seperti Candi Bima, Puntadewa, Arjuna, dan Semar.

Sumber : Bambang Budi Utomo. 2010. _Atlas Sejarah Indonesia Masa Klasik (Hindu-Buddha)_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.

Gambar 2.17 Candi Kalasan

Sementara yang beragama Buddha meninggalkan candi-candi seperti Candi Ngawen, Mendut, Pawon dan Borobudur. Candi Borobudur diperkirakan mulai dibangun oleh Samaratungga pada tahun 824 M. Pembangunan kemudian dilanjutkan pada zaman Pramudawardani dan Pikatan.

Untuk lebih lengkapnya kamu dapat membaca buku **Sardiman AM dan Kusriyantinah, Sejarah Nasional dan Sejarah Umum**

#### Candi Borobudur Mahakarya Dynasti Syailendra

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0098-03.png)

Gambar 2.18 Candi Borobudur

Sumber : Bambang Budi Utomo. 2010. _Atlas Sejarah Indonesia Masa Klasik (Hindu-Buddha)._ Jakarta: Kementerian Kebudayaan dan Pariwisata.

Pada awal abad ke-21, kita sering mendengarkan dan membicarakan tentang kebudayaan lokal dalam menghadapi globalisasi. Setidaknya hal itu sudah dialami oleh bangsa kita sejak abad ke-8, atau bahkan jauh ke masa lampau. Bukti nyata dari itu adalah Candi Borobudur, yang kemudian dikukuhkan sebagai Warisan Budaya Dunia oleh UNESCO, pada tahun 1991

Candi Borobudur didirikan oleh Raja Samaratungga dari dinasti Syailendra pada abad ke-9. Candi itu terletak di antara dua bukit, tepatnya di Desa Borobudur, Kecamatan Borobudur, Kabupaten Magelang. Candi Borobudur yang terletak pada satu garis lurus dengan Candi Pawon dan Candi Mendut dipandang sebagai satu kesatuan. Letak candi seperti ini sesuai dengan aturan yang disebut dalam kitab-kitab pedoman para seniman agama di India. kitab itu disebut dengan _Vastusastra_ . Suatu kitab yang menjelaskan tentang bangunan suci agama Hindu. Namun demikian, aturan-aturannya juga digunakan sebagai desain bangunan suci agama Buddha.

Borobudur merupakan karya yang unik. Susunan Candi Borobudur berbeda dengan susunan candi di India. Pada umumnya susunan candi di India berdiri di atas fondasi yang tertanam di

dalam tanah. Fondasi tersebut berdenah dengan jari-jari delapan. Di titik tengah terdapat tiang yang dibuat tembus ke atas permukaan tanah, dan diteruskan menjadi tongkat dengan payung. Candi Borobudur didirikan langsung di atas bukit tanpa fondasi yang ditanam di dalam tanah seperti yang terdapat di India. Dilihat dari susunannya, Candi Borobudur merupakan sebuah teras-stupa. Kaki stupa berbentuk undak teras persegi, disusul teras mengalir yang dihiasi stupa. Susunan candi ini memperlihatkan kuatnya pengaruh kebudayaan Jawa pada abad ke-8.

Bangunan ini dinamai _Bhumisambharabhudara_ yang artinya adalah bukit peningkatan kebijakan setelah melampaui sepuluh tingkat Boddhisattwa. Borobudur sendiri terdiri dari sepuluh tingkatan, yang dapat dipahami sebagai lambang ke-10, jalan Boddhisattwa. Candi itu berbentuk bujur sangkar, dengan ukuran 123 m x 123 m di bagian kakinya. Bentuk bangunan seperti itu dapat ditafsirkan sebagai bentuk mandala. Tinggi Candi Borobudur adalah 35,4 m. Secara vertikal Candi Borobudur terdiri dari dua pola, yaitu pola undak-undak persegi dan pola bangun vertikal. Karena bentuknya itulah Candi Borobudur dapat dipahami sebagai sebuah stupa yang besar.

Dalam agama Buddha stupa merupakan perwujudan dari makrokosmos yang terdiri dari tiga tingkatan, yaitu _kamadatu, rupadatu,_ dan _arupadatu. Kamadatu_ merupakan alam bawah, bagian ini berada di bagian bawah Candi Borobudur. Pada _kamadatu_ terdapat relief _karmawibangga_ , yaitu suatu hukum sebab akibat, yang merupakan hasil perbuatan manusia. _Arupadatu_ adalah alam atas, yaitu tempat para dewa. Bagian ini berada pada tingkat ketiga, termasuk stupa induk berada di atas _rupadatu._ Cara membaca relief pada dinding Candi Barobudur searah dengan jarum jam. Sebagai candi pemujaan, Borobudur mempunyai hubungan dengan Candi Mendut dan Candi Pawon. Ketiga candi itu menunjukkan proses suatu ritual keagamaan. Mula-mula ritual keagamaan dilakukan di Candi Mendut. Kemudian dilakukan persiapan di Candi Pawon dan puncak ritual keagamaan dilakukan di Candi Borobudur.

Dari arca dan relief yang terdapat pada dinding dan pagar candi menunjukkan bahwa Candi Borobudur sebagai penganut agama Buddha aliran Mahayana. Dari arca dan relief itu juga dapat dilihat

adanya penyatuan ajaran Mahayana dan Tantrayana, sesuai filsafat Yogacara. Dalam relief itu tergambar tentang kehidupan sehari-hari di Jawa, seperti cara berpakaian, rumah tinggal, candi, alat berburu, alat-alat keperluan sehari-hari, serta jenis-jenis tanaman.

Dalam _Kitab Sang Hyang Kamahayanikan Mantranaya_ , pada abad ke-10, Mpu Sindok dari dinasti Isana menyebarkan ajaran dari India, yaitu agama Buddha. Ajaran itu disebarkan di Jawa dan disesuaikan dengan pengetahuan penduduk pada saat itu. Lebih jauh lagi hasil pengetahuan itu diwujudkan dalam bentuk bangunan candi oleh penduduk Jawa, bukan oleh penduduk India. Candi itu kemudian digunakan sebagai sarana ibadah mereka. Bukti itu ditunjukkan dengan tidak adanya Kampung Keling yang berada di sekitar Candi Borobudur. Bukti lainnya itu ditemukannya tulisan yang memakai huruf Jawa kuno, dengan bahasa _sanskerta,_ dengan tidak menggunakan tata bahasa _sanskerta_ .

<div class="grid sm:grid-cols-2 gap-6">

<div>

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0100-04.png)

Gambar 2.19 _Rupadhatu_

Sumber : Bambang Budi Utomo. 2010. _Atlas Sejarah Indonesia Masa Klasik (Hindu-Buddha)_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.

</div>

<div>

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0100-06.png)

Gambar 2.20 _Kamadhatu_

Sumber : Idham Bachtiar Setiadi (ed). 2011. _100 Tahun Pemugaran Candi Borobudur_ . Jakarta, Direktorat Tinggalan Purbakala, Direktorat Jenderal Sejarah dan Purbalaka, Kementerian Pariwisata dan Ekonomi Kreatif

</div>

<div>

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0101-01.png)

Gambar 2.21 Kelompok Arjuna kompleks Candi Dieng di Dataran Tinggi Dieng, Kabupaten Wonosobo, Jawa

Sumber : _Direktorat Geografi Sejarah. Atlas Sejarah Indonesia Masa Klasik (Hindu-Buddha). Kementerian Kebudayaan dan Pariwisata. 2010_

</div>

<div>

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0101-04.png)

Gambar 2.22 Kompleks Percandian Gedongsongo, terletak di Kabupaten Semarang, Jawa Tengah

Sumber : _Direktorat Geografi Sejarah. Atlas Sejarah Indonesia Masa Klasik (Hindu-Buddha). Kementerian Kebudayaan dan Pariwisata. 2010_

</div>

</div>

Perpecahan di dalam keluarga Syailendra tidak berlangsung lama. Keluarga itu akhirnya bersatu kembali. Hal ini ditandai dengan perkawinan Rakai Pikatan dan keluarga yang beragama Hindu dengan Pramudawardani, putri dari Samaratungga. Perkawinan itu terjadi pada tahun 832 M. Setelah itu, Dinasti Syailendra bersatu kembali di bawah pemerintahan Raja Pikatan.

Setelah Samaratungga wafat, anaknya dengan Dewi Tara yang bernama Balaputradewa menunjukkan sikap menentang terhadap Pikatan. Kemudian terjadi perang perebutan kekuasaan antara Pikatan dengan Balaputradewa. Dalam perang ini Balaputradewa membuat benteng pertahanan di perbukitan di sebelah selatan Prambanan. Benteng ini sekarang kira kenal dengan Candi Boko. Dalam pertempuran, Balaputradewa terdesak dan melarikan diri ke Sumatra. Balaputradewa kemudian menjadi raja di Kerajaan Sriwijaya.

Kerajaan Mataram Kuno daerahnya bertambah luas. Kehidupan agama berkembang pesat tahun 856 Rakai Pikatan turun tahta dan digantikan oleh Kayuwangi atau Dyah Lokapala. Kayuwangi kemudian digantikan oleh Dyah Balitung. Raja Balitung merupakan raja yang terbesar. Ia memerintah pada tahun 898 - 911 M dengan gelar Sri Maharaja Rakai Wafukura Dyah Balitung Sri Dharmadya Mahasambu. Pada pemerintahan Balitung bidangbidang politik, pemerintahan, ekonomi, agama, dan kebudayaan mengalami kemajuan. Ia telah membangun Candi Prambanan sebagai candi yang anggun dan megah. Relief-reliefnya sangat indah.

Sesudah Balitung Kerajaan Mataram mulai mundur. Raja yang berkuasa setelah Balitung adalah Daksa, Tulodong, dan Wawa. Beberapa faktor yang menyebabkan kemunduran Mataram Kuno antara lain adanya bencana alam dan ancaman dari musuh yaitu Kerajaan Sriwijaya.

##### Uji Kompetensi

1. Carilah dari kliping koran atau juga dari internet, peninggalan candi-candi pada masa Sanjaya maupun Syailendra dan ceritakan!

2. Nilai-nilai apa yang dapat kamu peroleh dari kehidupan beragama pada masa Mataram Kuno diskusikan dan tunjukkan bukti-bukti sejarahnya.

#### Pesona Legenda Candi Prambanan

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0103-02.png)

Gambar 2.23 Candi Prambanan

Sumber :Bambang Budi Utomo. 2010. _Atlas Sejarah Indonesia Masa Klasik (Hindu-Buddha)._ Jakarta: Kementerian Kebudayaan dan Pariwisata.

Lara Jonggrang adalah seorang putri semata wayang Raja Boko, Penguasa Kerajaan Medang Kamulan. Karena kecantikannya, seorang pangeran bernama Bandung Bondowoso berniat menyuntingnya sebagai istri. Raja Boko mengabulkan permintaan Bandung Bondowoso, bila pangeran itu dapat mengalahkannya. Bandung Bondowoso ternyata dapat mengalahkan Raja Boko. Namun Lara Jonggrang tidak mau dipersunting oleh pembunuh ayahnya, ia pun tidak berani untuk menolak. Lara Jonggrang pun memberikan syarat pada Bandung untuk membuat seribu candi lengkap dengan arcanya dalam waktu semalam.

Bandung Bandowoso dengan dibantu sepasukan jin, hampir dapat meyelesaikan permintaan Lara Jonggarang. Saat mendengar suara kokok ayam bersautan dan melihat langit di ufuk timur memerah, para jin itu melarikan diri sebelum pekerjaannya selesai. Melihat tipu daya Lara Jonggrong, Bandung Bondowoso mengutuknya menjadi arca batu yang ke seribu untuk melengkapi jumlah keseluruhan arca.

Tentu kamu pernah mendengar cerita rakyat yang menceritakan tentang asal mula Candi Prambanan itu. Cerita itu hingga kini masih berkembang di daerah sekitar Prambanan. Lara Jonggrang seringkali diwujudkan sebagai arca Durga Mahisasuramawardini yang berada di bilik utara Candi Siwa. Lara Jonggrang secara harfiah diartikan sebagai seorang gadis cantik semampai. Pada kompleks percandian,sosok Lara Jonggrang diwujudkan pada bangunan paling tinggi dari keseluruhan Candi Prambanan. Dari kondisi itu kita dapat menafsirkan, bahwa legenda Bandung Bondowo itu muncul sebagai cerita rakyat penduduk Prambanan saat Candi Siwa masih berdiri kokoh. Jadi Candi Prambanan merupakan sebuah karya monumen kejayaan Mataram Kuno yang berdiri tinggi tegak di dataran Prambanan yang subur. Kawasan Candi Prambanan sejak tahun 1991 ditetapkan sebagai situs cagar budaya dunia oleh UNESCO. Bagi bangsa Indonesia pengakuan itu sangat membanggakan.

Candi Prambanan dibangun pada abad ke-9 Masehi atas perintah raja, pada masa puncak kejayaan Dinasti Sanjaya. Pada masa itulah ia mendirikan candi Prambanan menurut model candicandi Syailendra. Candi Prambanan terletak di Desa Prambanan. Candi itu pertama ditemukan oleh Calons pada tahun 1733 M. Bangunan candi itu dibangun untuk sebuah dharma bagi agama Hindu. Candi Prambanan merupakan bangunan suci agama Hindu yang ditujukan untuk memperkuat keberadaan agama itu di wilayah selatan Jawa. Candi itu dibangun atas perintah Raja Rakai Pikatan. Kompleks Prambanan terdiri atas Candi Siwa, Candi Hamsa, Candi Wisnu, Candi Nandi, Candi Garuda dan dua buah Candi Apit yang semuanya berada di halaman pertama. Delapan candi penjaga arah mata angin dan kurang lebih 200 candi perwara yang mengelilingi inti pusat.

Candi utama adalah Candi Siwa dengan empat ruangan. Ruang utama berisi patung Siwa sebagai mahadewa. Di sebelah utara terdapat Lara Jonggrang atau Siwa sebagai Durga Mahesasuramardin. Bagian timur terdapat patung Ganesa. Pada dinding Candi Siwa itu terdapat relief Ramayana, yang berisi tentang titisan Wisnu hingga Rama menyeberang ke lautan. Cara membaca relief pada candi itu searah dengan jarum jam. Candi itu digunakan hanya sebagai tempat pemujaan.

Candi kedua yang terbesar adalah Candi Brahma. Dalam candi ini terdapat patung Brahma. Juga terdapat relief yang menggambarkan epik Ramayana. Pada bagian ini menceritakan tentang Rama menyerang Alengka dan Sinta membakar diri, atau dikenal dengan cerita “pati obong”. Candi ketiga adalah Candi Wisnu yang terdapat arca Wisnu di dalamnya. Dalam dinding candi ini terdapat relief yang menceritakan tentang Kernayana. Candi Prambanan merupakan candi termegah pada saat itu, kemegahannya tersohor hingga sampai ke Asia Tenggara.

Candi Sewu yang berada di sekeliling Candi Prambanan mempunyai latar belakang agama Buddha. Hal itu dilihat dari arsitektur bentuk candi yang bentuk seperti stupa daripada Candi Prambanan. Di samping bentuknya juga dicirikan dengan puncak candi yang berbentuk stupa. Puncak candi itu merupakan satu diantara lambang dari agama Buddha.

Candi itu kurang lebih terdiri dari 240 bangunan. Bangunan candi sendiri dibangun dalam areal seluas kurang lebih 49.284 m. Candi itu diresmikan oleh Rakai Kayuwangi, pada tahun 778 Saka (856 Masehi). Dalam Prasasti Siwagraha tertuliskan tentang pembuatan Candi Prambanan. Candi dan gapuranya dikerjakan oleh beratus-ratus pekerja.

Dari segi arsitektur bangunan, Candi Prambanan dan Candi Sewu masih menampakkan ciri-ciri arsitektur Buddhis. Teknik pembangunan candi itu dengan menggunakan ikatan pada setiap bata-batanya. Keistimewaan bangunan itu terletak pada bentuk candi yang menjulang tinggi pada tanah datar. Candi Prambanan merupakan candi tertinggi dengan bentuk menara. Candi Prambanan berada dalam kawasan yang memiliki kepadatan bangunan candi yang beragam. Khususnya pada bagian sisi timur Kali Opak, terdapat Candi Bubrah, Lumbung, dan Sewu. Keempat candi besar yang berderat itu memiliki kesatuan mandala. Kedekatan letak Candi Prambanan dengan candi-candi agama Buddha menunjukkan adanya toleransi antara penduduk yang beragama Hindu dengan penduduk yang beragama Buddha pada masa Mataram Kuno itu.

Sumber: Inajati Adrisijanti dan Andi Putranto (ed). 2009. _Membangun Kembali Prambanan._ Yogyakarta: Balai Pelestarian Peninggalan Purbakala

#### Kekuasaan Dinasti Isyana

Pertentangan di antara keluarga Mataram, nampaknya terus berlangsung hingga masa pemerintahan Mpu Sindok pada tahun 929 M. Pertikaian yang tidak pernah berhenti itu menyebabkan Mpu Sindok memindahkan ibukota kerajaan dari Medang ke Daha (Jawa Timur) dan mendirikan dinasti baru yaitu Dinasti Isyanawangsa. Disamping karena pertentangan keluarga, pemindahan pusat kerajaan juga dikarenakan kerajaan mengalami kehancuran akibat letusan Gunung Merapi. Berdasarkan prasasti, pusat pemerintahan Keluarga Isyana terletak di Tamwlang. Letak Tamwlang diperkirakan dekat Jombang, sebab di Jombang masih ada desa yang namanya mirip, yakni desa Tambelang. Daerah kekuasaannya meliputi Jawa bagian timur, Jawa bagian tengah, dan Bali.

Setelah Mpu Sindok meninggal, ia digantikan oleh anak perempuannya bernama Sri Isyanatunggawijaya. Ia naik tahta dan kawin dengan Sri Lokapala. Dari perkawinan ini lahirlah putra yang bernama Makutawangsawardana. Makutawangsawardana naik tahta menggantikan ibunya. Kemudian pemerintahan dilanjutkan oleh Dharmawangsa. Dharmawangsa Tguh yang memeluk agama Hindu aliran Waisya. Pada masa pemerintahannya, Dharmawangsa Tguh memerintahkan untuk menyadur kitab Mahabarata dalam bahasa Jawa Kuno. Setelah Dharmawangsa Tguh turun tahtah ia digantikan oleh Raja Airlangga, yang saat itu usianya masih 16 tahun. Hancurnya kerajaan Dharmawangsa menyebabkan Airlangga berkelana ke hutan. Selama di hutan ia hidup bersama pendeta sambil mendalami agama. Airlangga kemudian dinobatkan oleh pendeta agama Hindu dan Buddha sebagai raja. Begitulah kehidupan agama pada masa Mataram Kuno. Meskipun mereka berbeda aliran dan keyakinan, penduduk Mataram Kuno tetap menghargai perbedaan yang ada.

Setelah dinobatkan sebagai raja, Airlangga segera mengadakan pemulihan hubungan baik dengan Sriwijaya, bahkan membantu Sriwijaya ketika diserang Raja Colamandala dari India Selatan. Pada tahun 1037 M, Airlangga berhasil mempersatukan kembali daerah-daerah yang pernah dikuasai oleh Dharmawangsa, meliputi seluruh Jawa Timur. Airlangga kemudian memindahkan ibukota kerajaannya dari Daha ke Kahuripan.

Pada tahun 1042, Airlangga mengundurkan diri dari tahta kerajaan, lalu hidup sebagai pertapa dengan nama Resi Gentayu (Djatinindra). Menjelang akhir pemerintahannya Airlangga menyerahkan kekuasaanya pada putrinya Sangrama Wijaya Tungga-Dewi. Namun, putrinya itu menolak dan memilih untuk menjadi seorang petapa dengan nama Ratu Giriputri.

Airlangga memerintahkan Mpu Bharada untuk membagi dua kerajaan. Kerajaan itu adalah Kediri dan Janggala. Hal itu dilakukan untuk mencegah terjadinya perang saudara di antara kedua putranya yang lahir dari selir. Kerajaan Janggala di sebelah timur diberikan kepada putra sulungnya yang bernama Garasakan (Jayengrana), dengan ibukota di Kahuripan (Jiwana). Wilayahnya meliputi daerah sekitar Surabaya sampai Pasuruan, dan Kerajaan Panjalu (Kediri). Kerajaan Kediri di sebelah barat diberikan kepada putra bungsunya yang bernama Samarawijaya (Jayawarsa) dengan ibukota di Kediri (Daha), meliputi daerah sekitar Kediri dan Madiun.

Kerajaan Kediri adalah kerajaan pertama yang mempunyai sistem administrasi kewilayahan negara berjenjang. Hierarki kewilayahan dibagi atas tiga jenjang. Struktur paling bawah dikenal dengan _thani_ (desa). Desa ini terbagi menjadi bagian-bagian yang lebih kecil lagi yang dipimpin oleh seorang _duwan._ Setingkat lebih tinggi di atasnya disebut _wisaya,_ yaitu sekumpulan dari desa-desa. Tingkatan paling tinggi yaitu negara atau kerajaan yang disebut dengan _bhumi._

##### Uji Kompetensi

1. Berdasarkan bacaan di atas nilai-nilai apa yang dapat kamu petik dari kepemimpinan Airlangga?

2. Setujukah kamu dengan cara Airlangga membagi kerajaan seperti disebutkan di atas? Uraikan alasan pendapat kamu

### Tugas

Sebutkan nama, letak dan fungsi candi yang kamu ketahui. Carilah dari buku atau sumber internet.

| No  | Nama Candi | Letak | Fungsi |
| --- | ---------- | ----- | ------ |
| 1   |            |       |        |
| 2   |            |       |        |
| 3   |            |       |        |
| 4   |            |       |        |

## C. Terbentuknya Jaringan Nusantara Melalui Perdagangan

### Memahami Teks

Pusat-pusat integrasi Nusantara berlangsung melalui penguasaan laut. Pusat-pusat integrasi itu selanjutnya ditentukan oleh keahlian dan kepedulian terhadap laut, sehingga terjadi perkembangan baru, setidaknya dalam dua hal, yaitu (i) pertumbuhan jalur perdagangan yang melewati lokasi-lokasi strategis di pinggir pantai, dan (ii) kemampuan mengendalikan (kontrol) politik dan militer para penguasa tradisional (raja-raja) dalam menguasai jalur utama dan pusat-pusat perdagangan di Nusantara. Jadi, prasyarat untuk dapat menguasai jalur dan pusat perdagangan ditentukan oleh dua hal penting yaitu perhatian atau cara pandang dan kemampuan menguasai lautan.

Jalur-jalur perdagangan yang berkembang di Nusantara sangat ditentukan oleh kepentingan ekonomi pada saat itu dan perkembangan rute perdagangan dalam setiap masa yang berbedabeda. Jika pada masa praaksara hegemoni budaya dominan datang dari pendukung budaya Austronesia dari Asia Tenggara Daratan. Pada masa perkembangan Hindhu-Buddha di Nusantara terdapat dua kekuatan peradaban besar, yaitu Cina di utara dan India di bagian barat daya. Keduanya merupakan dua kekuatan _super power_ pada masanya dan pengaruhnya amat besar terhadap penduduk di Kepulauan Indonesia. Bagaimanapun, peralihan rute perdagangan dunia ini telah membawa berkah tersendiri bagi masyarakat dan suku bangsa di Nusantara. Mereka secara langsung terintegrasikan ke dalam jalinan perdagangan dunia pada masa itu. Selat Malaka menjadi penting sebagai pintu gerbang yang menghubungkan antara pedagang-pedagang Cina dan pedagang-pedagang India.

Pada masa itu Selat Malaka merupakan jalur penting dalam pelayaran dan perdagangan bagi pedagang yang melintasi bandarbandar penting di sekitar Samudera Indonesia dan Teluk Persia. Selat itu merupakan jalan laut yang menghubungkan Arab dan India di sebelah barat laut Nusantara, dan dengan Cina di sebelah timur laut Nusantara. Jalur ini merupakan pintu gerbang pelayaran yang dikenal dengan nama “jalur sutra”. Penamaan ini digunakan sejak abad ke-1 hingga ke-16 M, dengan komoditas kain sutera yang dibawa dari Cina untuk diperdagangkan di wilayah lain. Ramainya rute pelayaran ini mendorong timbulnya bandar-bandar penting di sekitar jalur, antara lain Samudra Pasai, Malaka, dan Kota Cina (Sumatra Utara sekarang).

Kehidupan penduduk di sepanjang Selat Malaka menjadi lebih sejahtera oleh proses integrasi perdagangan dunia yang melalui jalur laut tersebut. Mereka menjadi lebih terbuka secara sosial ekonomi untuk menjalin hubungan niaga dengan pedagangpedagang asing yang melewati jalur itu. Di samping itu, masyarakat setempat juga semakin terbuka oleh pengaruh-pengaruh budaya luar. Kebudayaan India dan Cina ketika itu jelas sangat berpengaruh terhadap masyarakat di sekitar Selat Malaka. Bahkan sampai saat ini pengaruh budaya terutama India masih dapat kita jumpai pada masyarakat sekitar Selat Malaka.

Disamping kian terbukanya jalur niaga Selat Malaka dengan perdagangan dunia internasional, jaringan perdagangan antarbangsa dan penduduk di Kepulauan Indonesia juga berkembang pesat selama masa Hindhu-Buddha. Jaringan dagang dan jaringan budaya antarkepulauan di Indonesia itu terutama terhubungkan oleh jaringan laut Jawa hingga kepulauan Maluku. Mereka secara tidak langsung juga terintegrasikan dengan jaringan ekonomi dunia yang berpusat di sekitar selat Malaka, dan sebagian di pantai barat Sumatra seperti Barus. Komoditas penting yang menjadi barang perdagangan pada saat itu adalah rempah-rempah, seperti kayu manis, cengkih, dan pala.

Pertumbuhan jaringan dagang internasional dan antarpulau telah melahirkan kekuatan politik baru di Nusantara. Peta politik di Jawa dan Sumatra abad ke-7, seperti ditunjukkan oleh D.G.E. Hall, bersumber dari catatan pengunjung Cina yang datang ke Sumatra. Dua negara di Sumatra disebutkan, _Mo-lo-yeu_ (Melayu) di pantai timur, tepatnya di Jambi sekarang di muara Sungai Batanghari. Agak ke selatan dari itu terdapat _Che-li-fo-che_ , pengucapan cara Cina untuk kata bahasa _sanskerta,_ Criwijaya. Di Jawa terdapat tiga kerajaan utama, yaitu di ujung barat Jawa, terdapat Tarumanegara, dengan rajanya yang terkemuka Purnawarman, di Jawa bagian tengah ada _Ho-ling_ (Kalingga), dan di Jawa bagian timur ada Singhasari dan Majapahit.

Selama periode Hindhu-Buddha, kekuatan besar Nusantara yang memiliki kekuatan integrasi secara politik, sejauh ini dihubungkan dengan kebesaran Kerajaan Sriwijaya, Singhasari, dan Majapahit. Kekuatan integrasi secara politik di sini maksudnya adalah kemampuan kerajaan-kerajaan tradisional tersebut dalam menguasai wilayah-wilayah yang luas di Nusantara di bawah kontrol politik secara longgar dan menempatkan wilayah kekuasaannya itu sebagai kesatuan-kesatuan politik di bawah pengawasan dari kerajaan-kerajaan tersebut. Dengan demikian pengintegrasian antarpulau secara lambat laun mulai terbentuk.

Kerajaan utama yang disebutkan di atas berkembang dalam periode yang berbeda-beda. Kekuasaan mereka mampu mengontrol sejumlah wilayah Nusantara melalui berbagai bentuk media. Selain dengan kekuatan dagang, politik, juga kekuatan budayanya, termasuk bahasa. Interelasi antara aspek-aspek kekuatan tersebut yang membuat mereka berhasil mengintegrasikan Nusantara dalam pelukan kekuasaannya. Kerajaan-kerajaan tersebut berkembang menjadi kerajaan besar yang menjadi representasi pusat-pusat kekuasaan yang kuat dan mengontrol kerajaan-kerajaan yang lebih kecil di Nusantara.

Hubungan pusat dan daerah hanya dapat berlangsung dalam bentuk hubungan hak dan kewajiban yang saling menguntungkan ( _mutual benefit_ ). Keuntungan yang diperoleh dari pusat kekuasaan antara lain, berupa pengakuan simbolik seperti kesetiaan dan pembayaran upeti berupa barang-barang yang digunakan untuk kepentingan kerajaan, serta barang-barang yang dapat diperdagangkan dalam jaringan perdagangan internasional. Sebaliknya kerajaan-kerajaan kecil memperoleh perlindungan dan rasa aman, sekaligus kebanggaan atas hubungan tersebut.Jika pusat kekuasaan sudah tidak memiliki kemampuan dalam mengontrol dan melindungi daerah bawahannya, maka sering terjadi pembangkangan dan sejak itu kerajaan besar terancam disintegrasi. Kerajaan-kerajaan kecil lalu melepaskan diri dari ikatan politik dengan kerajaan-kerajaan besar lama dan beralih loyalitasnya dengan kerajaan lain yang memiliki kemampuan mengontrol dan lebih bisa melindungi kepentingan mereka. Sejarah Indonesia masa Hindu-Buddha ditandai oleh proses integrasi dan disintegrasi semacam itu. Namun secara keseluruhan proses integrasi yang lambat laun itu kian mantap dan kuat, sehingga kian mengukuhkan Nusantara sebagai negeri kepulauan yang dipersatukan oleh kekuatan politik dan perdagangan.

Untuk memahami lebih lanjut kamu dapat membaca buku **Sartono Kartodirdjo.** **_Pengantar Sejarah Indonesia Baru 1500-1900: Dari Emporium sampai Empirium._**

### Uji Kompetensi

1. Jelaskan bagaimana peranan Sriwijaya dan Majapahit dalam proses integrasi antarpulau pada masa Hindu-Buddha!

2. Buatlah peta jaringan perdagangan pada masa Sriwijaya dan masa Majapahit!

3. Komoditas apa yang menarik bagi kaum pedagang untuk mendatangi pelabuhan yang ada di Kepulauan Indonesia? Bandingkan dengan perdagangan saat ini, komoditas apakah yang diminati dalam perdagangan internasional?

4. Carilah pelabuhan yang terdekat dengan kota yang ada di sekitar daerah tempat tinggalmu. Bagaimanakah menurut pendapatmu tentang pelabuhan itu?

5. Di atas kita telah membahas tentang peran laut pada masa Hindu-Buddha. Apa pendapatmu tentang peran laut pada saat ini bagi negara Indonesia? Buatlah dalam bentuk esai sekitar 3-4 halaman!

_Kompas_ selama dua hari berturut-turut (30-31 Maret 2013) membuat liputan tentang jelajah kuliner. Mari kita simak artikel itu bersama-sama:

> “Orang India Selatan datang bergelombang ke Sumatra sejak ribuan tahun silam. Jejak migrasi itu antara lain terekam di antara harum bumbu kari dan keagungan Kuil Shri Mariamman di Medan, Sumatra Utara. Kuil itu adalah tapal sejarah gelombang terbesar kedatangan orang India Selatan ke Sumatra demi rempah dan kapur barus, gelombang terbesar orang India pada tahun 1880-an didatangkan Kuypers dan Nienhuys sebagai buruh perkebunan”.

1. Setelah kamu mencermati cuplikan artikel di atas, bagaimana kesan kamu tentang bacaan di atas?

2. Menurut kamu bagaimanakah pengaruh budaya India itu dapat diterima oleh penduduk saat itu?

3. Coba kamu gali jenis kuliner yang terdapat di sekitar kamu yang mendapat pengaruh dari India!

4. Bagaimanakah proses masuk dan berkembangnya kuliner yang mendapat pengaruh India itu di sekitar kamu?

5. Apakah saat ini masih ada pengaruh budaya India yang masih melekat dalam kehidupan kita sehari-hari? Berilah contohnya!

6. Budaya Cina juga membawa pengaruh pada kuliner kita saat ini. Coba kamu identifikasi, pengaruh budaya Cina pada kuliner di sekitar tempat tinggalmu!

## D. Akulturasi Kebudayaan Nusantara dan Hindu-Buddha

Akulturasi kebudayaan yaitu suatu proses percampuran antara unsur-unsur kebudayaan yang satu dengan kebudayaan yang lain, sehingga membentuk kebudayaan baru. Kebudayaan baru yang merupakan hasil percampuran itu masing-masing tidak kehilangan kepribadian/ciri khasnya. Oleh karena itu, untuk dapat berakulturasi, masing-masing kebudayaan harus seimbang. Begitu juga untuk kebudayaan Hindu-Buddha dari India dengan kebudayaan Indonesia asli.

Contoh hasil akulturasi antara kebudayaan Hindu-Buddha dengan kebudayaan Indonesia asli sebagai berikut.

### 1. Seni Bangunan

Bentuk-bentuk bangunan candi di Indonesia pada umumnya merupakan bentuk akulturasi antara unsur-unsur budaya HinduBuddha dengan unsur budaya Indonesia asli. Bangunan yang megah, patung-patung perwujudan dewa atau Buddha, serta bagianbagian candi dan stupa adalah unsur-unsur dari India. Bentuk candicandi di Indonesia pada hakikatnya adalah punden berundak yang merupakan unsur Indonesia asli. Candi Borobudur merupakan salah satu contoh dari bentuk akulturasi tersebut.

### 2. Seni Rupa dan Seni Ukir

Masuknya pengaruh India juga membawa perkembangan dalam bidang seni rupa, seni pahat, dan seni ukir. Hal ini dapat dilihat pada relief atau seni ukir yang dipahatkan pada bagian dindingdinding candi. Misalnya, relief yang dipahatkan pada dindingdinding pagar langkan di Candi Borobudur yang berupa pahatan riwayat Sang Buddha. Di sekitar Sang Buddha terdapat lingkungan alam Indonesia seperti rumah panggung dan burung merpati.

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0139-01.png)

Gambar 2.31 Relief binatang pada Candi Borobudur

Sumber : Bambang Budi Utomo. 2010. _Atlas Sejarah Indonesia Masa Klasik (Hindu-Buddha)._ Jakarta: Kementerian Kebudayaan dan Pariwisata.

Pada relief kala makara pada candi dibuat sangat indah. Hiasan relief kala makara, dasarnya adalah motif binatang dan tumbuh-tumbuhan. Hal semacam ini sudah dikenal sejak masa sebelum Hindu. Binatang-binatang itu dipandang suci, maka sering diabadikan dengan cara di lukis.

### 3. Seni Sastra dan Aksara

Pengaruh India membawa perkembangan seni sastra di Indonesia. Seni sastra waktu itu ada yang berbentuk prosa dan ada yang berbentuk tembang (puisi). Berdasarkan isinya, kesusasteraan dapat dikelompokkan menjadi tiga, yaitu tutur (pitutur kitab keagamaan), kitab hukum, dan wiracarita (kepahlawanan).

Bentuk wiracarita ternyata sangat terkenal di Indonesia, terutama kitab Ramayana dan Mahabarata. Kemudian timbul wiracarita hasil gubahan dari para pujangga Indonesia. Misalnya, Baratayuda yang digubah oleh Mpu Sedah dan Mpu Panuluh. Juga munculnya cerita-cerita Carangan.

Berkembangnya karya sastra terutama yang bersumber dari Mahabarata dan Ramayana, melahirkan seni pertunjukan wayang kulit (wayang purwa). Pertunjukan wayang kulit di Indonesia, khususnya di Jawa sudah begitu mendarah daging. Isi dan cerita pertunjukan wayang banyak mengandung nilai-nilai yang bersifat edukatif (pendidikan). Cerita dalam pertunjukan wayang berasal dari India, tetapi wayangnya asli dari Indonesia. Seni pahat dan ragam luas yang ada pada wayang disesuaikan dengan seni di Indonesia.

Di samping bentuk dan ragam hias wayang, muncul pula tokoh-tokoh pewayangan yang khas Indonesia. Misalnya tokohtokoh punakawan seperti Semar, Gareng, dan Petruk. Tokohtokoh ini tidak ditemukan di India. Perkembangan seni sastra yang sangat cepat didukung oleh penggunaan huruf _pallawa_ , misalnya dalam karya-karya sastra Jawa Kuno. Pada prasasti-prasasti yang ditemukan terdapat unsur India dengan unsur budaya Indonesia. Misalnya, ada prasasti dengan huruf Nagari (India) dan huruf Bali Kuno (Indonesia).

### 4. Sistem Kepercayaan

Sejak masa praaksara, orang-orang di Kepulauan Indonesia sudah mengenal simbol-simbol yang bermakna filosofis. Sebagai contoh, kalau ada orang meninggal, di dalam kuburnya disertakan benda-benda. Di antara benda-benda itu ada lukisan seorang naik perahu, ini memberikan makna bahwa orang yang sudah meninggal rohnya akan melanjutkan perjalanan ke tempat tujuan yang membahagiakan yaitu alam baka. Masyarakat waktu itu sudah percaya adanya kehidupan sesudah mati, yakni sebagai roh halus. Oleh karena itu, roh nenek moyang dipuja oleh orang yang masih hidup (animisme).

Setelah masuknya pengaruh India kepercayaan terhadap roh halus tidak punah. Misalnya dapat dilihat pada fungsi candi. Fungsi candi atau kuil di India adalah sebagai tempat pemujaan. Di Indonesia, disamping sebagai tempat pemujaan, candi juga sebagai makam raja atau untuk menyimpan abu jenazah raja yang telah meninggal. Itulah sebabnya peripih tempat penyimpanan abu jenazah raja didirikan patung raja dalam bentuk mirip dewa yang dipujanya. Ini jelas merupakan perpaduan antara fungsi candi di India dengan tradisi pemakaman dan pemujaan roh nenek moyang di Indonesia.

Bentuk bangunan lingga dan yoni juga merupakan tempat pemujaan terutama bagi orang-orang Hindu penganut Syiwaisme. Lingga adalah lambang Dewa Syiwa. Secara filosofis lingga dan yoni adalah lambang kesuburan dan lambang kemakmuran. Lingga lambang laki-laki dan yoni lambang perempuan.

### 5. Sistem Pemerintahan

Setelah datangnya pengaruh India di Kepulauan Indonesia, dikenal adanya sistem pemerintahan secara sederhana. Pemerintahan yang dimaksud adalah semacam pemerintah di suatu desa atau daerah tertentu. Rakyat mengangkat seorang pemimpin atau semacam kepala suku. Orang yang dipilih sebagai pemimpin biasanya orang yang sudah tua (senior), arif, dapat membimbing, memiliki kelebihan-kelebihan tertentu termasuk dalam bidang ekonomi, berwibawa, serta memiliki semacam kekuatan gaib (kesaktian). Setelah pengaruh India masuk, maka pemimpin tadi diubah menjadi raja dan wilayahnya disebut kerajaan. Hal ini secara jelas terjadi di Kutai.

Salah satu bukti akulturasi dalam bidang pemerintahan, misalnya seorang raja harus berwibawa dan dipandang memiliki kekuatan gaib seperti pada pemimpin masa sebelum Hindu-Buddha. Karena raja memiliki kekuatan gaib, maka oleh rakyat raja dipandang dekat dengan dewa. Raja kemudian disembah, dan kalau sudah meninggal, rohnya dipuja-puja.

### Uji Kompetensi

1. Buatlah ringkasan tulisan tentang bab ini dalam dua format berbeda: (i) dalam bentuk bagan atau skema-skema dengan keterangan singkat dan (ii) narasi tentang bagan pada tugas pertama sekitar satu sampai dua halaman untuk membantu menjelaskan keringkasan dalam tugas pertama (bagan)! Carilah bahan bacaan terkait dengan pembahasan ini!

2. Buatlah pertanyaan kritis mengenai tahap-tahap sejarah HinduBuddha sejak zaman praaksara hingga terbentuknya sistem organisasi kenegaraan (kerajaan) tradisional yang tersebar di Nusantara. Masing-masing peserta didik diminta memilih dan membuat deskripsi profil salah satu kerajaan tersebut dan menyusun pertanyaan-pertanyaan kritis dalam kaitannya dengan kepemimpinannya, ketatanegaraannya dan kisah sukses serta kegagalannya. Bagaimana pendapat kamu tentang hipotesis ahli mengenai hubungan budaya Hindu-Buddha dengan Nusantara? Diskusikan hasil tulisan kamu!

3. Cobalah eksplorasi (jelajah) apakah sisa-sisa kebudayaan material ( _material culture_ ) dan kebudayaan kerohanian ( _spiritual culture_ ) masa Hindu-Buddha masih ada di lingkungan tempat tinggal kamu atau di kampung asal nenek atau orang tua kamu? Deskripsikan bentuk-bentuk peninggalan itu dan adakah sesuatu (gagasan) yang berharga jika dikaitkan dengan masa sekarang?

4. Tulis tugasmu dalam satu esei pendek. Terbitkan dalam koran lokal atau majalah sekolah.

## E. Kesimpulan

Sejak semula tampak bahwa letak geografis Nusantara (yang kemudian menjadi Indonesia) memainkan peran utama sejak zaman praaksara. Faktor geografis ini tampaknya merupakan faktor permanen dalam perjalanan sejarah Indonesia sepanjang masa. Peran itu ditunjukkan di zaman Hindu-Buddha, ketika jalur utama dalam pelayaran samudra semakin pesat dan mengintegrasikan daerah antarpulau. Kondisi demikian didukung dengan keterlibatan nenek moyang kita secara aktif dalam perdagangan laut, dan mengarungi lautan. Ini pada gilirannya telah menumbuhkan kekuatan ekonomi dan politik yang besar di Nusantara sehingga mampu mengintegrasikan wilayah-wilayah di Nusantara terutama era Kerajaan Sriwijaya, Singhasari dan Majapahit.

Silang budaya Nusantara di zaman praaksara terlihat jelas ketika masuknya pengaruh budaya Austronesia. Sebagian besar dimungkinkan berkat posisi silang letak geografis Nusantara (di antara dua benua dan dua samudera). Sekali lagi pola itu diulangi lewat integrasi budaya dominan seperti Hindu-Buddha. Sumbangan terbesar dari zaman Hindu-Buddha ialah membebaskan Nusantara dari zaman praaksara dan memberi jalan bagi kemajuan ilmu pengetahuan dan teknologi untuk zamannya. Budaya tulis tetap merupakan bagian penting dalam perkembangan peradaban sampai hari ini. Meskipun sekarang kita sudah mengenal media _cyber_ (media maya), budaya tulisan tidak akan pernah ditinggalkan dan bahkan akan semakin maju apabila generasi kita semakin menguasai bahasa tulis.

Interaksi antara budaya Nusantara dengan budaya dominan Hindu-Buddha waktu itu, menunjukkan budaya Indonesia bukanlah penerima yang pasif, melainkan aktif. Jadi terjadi upaya seleksi (filter) tanpa perlu merendahkan, apa lagi mengucilkan budaya asli nenek moyang yang sebelumnya. Proses inilah yang dinamakan proses ‘akulturasi budaya’. Bangsa Indonesia juga melahirkan modifikasimodifikasi _local genius_ , yaitu semacam kritik dan mempertanyakan budaya yang lama sambil memperbarui dan memperkuatnya sehingga mampu menghasilkan peradaban tinggi ( _great tradition_ ) hasil modifikasi dari interaksi budaya asli Kepulauan Indonesia dengan budaya Hindu-Buddha.

Tumbuhnya negara-negara tradisional (kerajaan) yang bercorak Hindhu-Buddha tidak hanya mewariskan peninggalan-peninggalan sejarah dengan peradaban yang lebih tinggi dari masa nenek moyang sebelumnya, tetapi juga semacam mahakarya yang abadi seperti Borobudur. Lebih dari itu kekayaan pemikiran mengenai konsep kekuasaan, bahasa, dan sastra serta kosmologi alam makro dan mikro. Kesemuanya terekspresikan dalam perilaku sehari-hari dan sebagian besar masih hidup dalam masyarakat sampai sekarang.

![](sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0144-01.png)

Gambar 3.1 Masjid Baiturrahman, Aceh

Sumber : Bambang Budi Utomo. 2011. _Atlas Sejarah Indonesia Masa Islam_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.
$content$
  ),
  (
    'Sejarah Indonesia X Bab 3',
    'Kedatangan Islam ke Nusantara, jaringan perdagangan antarpulau, kerajaan-kerajaan Islam, serta akulturasi dan perkembangan budaya Islam.',
    1,
    array['sejarah', 'x', 'bab 3', 'islam'],
    $content$# Islamisasi dan Silang Budaya di Nusantara

_Islamisasi adalah proses sejarah yang panjang yang bahkan sampai kini masih terus berlanjut… Kalau para ahli sejarah mempersoalkan tentang asal usul nasionalisme Indonesia, atau integrasi bangsa, mereka menyebutkan Islam sebagai salah satu faktor utama maka hal itu bisa diartikan pada sifat Islam yang universal dan pada jaringan ingatan kolektif yaitu keterkaitan para ulama di Nusantara dalam berbagai corak jaringan sosial guru-murid, murid sesama murid; penulis-dan-pembaca, dan tak kurang pentingnya ulama-umara serta ulama dan umat. (Taufik Abdullah, 1996)_

## A. Kedatangan Islam ke Nusantara

### Mengamati Lingkungan

Kedatangan Islam ke Nusantara mempunyai sejarah yang panjang. Satu di antaranya adalah tentang interaksi ajaran Islam dengan masyarakat di Nusantara yang kemudian memeluk Islam. Wujud dari keberlangsungan interaksi yang hingga kini masih terlihat adalah banyaknya umat Muslim Indonesia yang

menjalankan ibadah haji dan umrah. Di samping itu tidak sedikit para ulama dari Timur Tengah yang berkunjung ke Indonesia dalam rangka berdakwah. Bagi umat Islam di Indonesia, berbagai bentuk interaksi tersebut akan semakin memantapkan keimanan dan ketakwaan terhadap ajaran agamanya. Kemudian yang menjadi pertanyaan adalah kapan dan dari mana kira-kira pertama kali Islam masuk ke Kepulauan Indonesia serta bagaimana prosesnya? Untuk mendapatkan informasi dan bahan diskusi tentang proses masuknya Islam ke Indonesia, mari kita kaji uraian berikut.

### Memahami Teks

Terdapat berbagai pendapat mengenai proses masuknya Islam ke Kepulauan Indonesia, terutama perihal waktu dan tempat asalnya. _Pertama_ , sarjana-sarjana Barat—kebanyakan dari Negeri Belanda—mengatakan bahwa Islam yang masuk ke Kepulauan Indonesia berasal dari Gujarat sekitar abad ke-13 M atau abad ke-7 H. Pendapat ini mengasumsikan bahwa Gujarat terletak di India bagian barat, berdekatan dengan Laut Arab. Letaknya sangat strategis berada di jalur perdagangan antara timur dan barat. Pedagang Arab yang bermahzab Syafi’i telah bermukim di Gujarat dan Malabar sejak awal tahun Hijriyah (abad ke-7 M). Orang yang menyebarkan Islam ke Indonesia menurut Pijnapel bukanlah dari

orang Arab langsung, melainkan para pedagang Gujarat yang telah memeluk Islam dan berdagang ke dunia Timur. Pendapat J. Pijnapel kemudian didukung oleh C. Snouck Hurgronye, dan J.P. Moquetta (1912). Argumentasinya didasarkan pada batu nisan Sultan Malik Al-Saleh yang wafat pada 17 Dzulhijjah 831 H atau 1297 M di Pasai, Aceh. Menurutnya, batu nisan di Pasai dan makam Maulana Malik Ibrahim yang wafat tahun 1419 di Gresik, Jawa Timur, memiliki bentuk yang sama dengan batu nisan yang terdapat di Kambay, Gujarat. Moquetta kemudian berkesimpulan bahwa batu nisan tersebut

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0146-06.png)

Gambar 3.2 Christiaan Snouck Hurgronje

Sumber : Von Koeningveld. 1989. _Snouck Hugronje dan Islam_ . Jakarta: Girimukti Pasaka.

diimpor dari Gujarat, atau setidaknya dibuat oleh orang Gujarat atau orang Indonesia yang telah belajar kaligrafi khas Gujarat.

_Kedua_ , Hoesein Djajadiningrat mengatakan bahwa Islam yang masuk ke Indonesia berasal Persia (Iran sekarang). Pendapatnya didasarkan pada kesamaan budaya dan tradisi yang berkembang antara masyarakat Parsi dan Indonesia. Tradisi tersebut antara lain: tradisi merayakan 10 Muharram atau Asyuro sebagai hari suci kaum Syiah atas kematian Husein bin Ali, seperti yang berkembang dalam tradisi _tabot_ di Pariaman di Sumatra Barat dan Bengkulu.

_Ketiga_ , Buya Hamka (Haji Abdul Malik Karim Amrullah) mengatakan bahwa Islam berasal dari tanah kelahirannya, yaitu Arab atau Mesir. Proses ini berlangsung pada abad-abad pertama Hijriah atau abad ke-7 M. Senada dengan pendapat Hamka, teori yang mengatakan bahwa Islam berasal dari Mekkah dikemukakan Anthony H. Johns. Menurutnya, proses Islamisasi dilakukan oleh para musafir (kaum pengembara) yang datang ke Kepulauan Indonesia. Kaum ini biasanya mengembara dari satu tempat ke tempat lainnya dengan motivasi hanya pengembangan agama Islam.

Semua teori di atas bukan mengadaada, tetapi mungkin bisa saling melengkapi. Islamisasi di Kepulauan Indonesia merupakan hal yang kompleks dan hingga kini prosesnya masih terus berjalan. Pasai dan Malaka, adalah tempat dimana tongkat estafet Islamisasi dimulai. Pengaruh Pasai kemudian diwarisi Aceh Darussalam. Sedangkan Johor tidak pernah bisa melupakan jasa dinasti Palembang yang pernah berjaya dan mengislamkan Malaka. Demikian pula Sulu dan Mangindanao akan selalu mengingat Johor sebagai pengirim Islam ke wilayahnya.

Sementara itu Minangkabau akan selalu mengingat Malaka sebagai pengirim Islam dan tak pernah melupakan Aceh sebagai peletak dasar tradisi surau di Ulakan. Sebaliknya Pahang akan selalu

Untuk memperdalam masalah ini kamu bisa membaca buku **Taufik Abdullah,** **_Islam dan Pluralisme di Asia Tenggara._**

mengingat pendatang dari Minangkabau yang telah membawa Islam. Peranan para perantau dan penyiar agama Islam dari Minangkabau juga selalu diingat dalam tradisi Luwu dan Gowa Tallo.

Nah, marilah kita pelajari awal masuknya Islam di Nusantara.Pada pertengahan abad ke-15, ibukota Campa, Wijaya jatuh ke tangan Vietnam yang datang dari Utara. Dalam kenangan historis Jawa, Campa selalu diingat dalam kaitannya dengan Islamisasi. Dari sinilah Raden Rahmat anak seorang putri Campa dengan seorang Arab, datang ke Majapahit untuk menemui bibinya yang telah kawin dengan raja Majapahit. Ia kemudian dikenal sebagai Sunan Ampel salah seorang wali tertua.

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0148-06.png)

Gambar 3.4 Peta jejak masuknya Islam ke Nusantara berdasarkan nomor urut

Sumber :Taufik Abdullah dan A.B Lapian (ed). 2012. _Indonesia Dalam Arus Sejarah. jilid II_ I. Jakarta: PT Ichtiar Baru van Hoeve

Sunan Giri yang biasa disebut sebagai ‘paus’ dalam sumber Belanda bukan saja berpengaruh di kalangan para wali tetapi juga dikenang sebagai penyebar agama Islam di Kepulauan Indonesia bagian Timur. Raja Ternate Sultan Zainal Abidin pergi ke Giri (1495) untuk memperdalam pengetahuan agama. Tak lama setelah kembali ke Ternate, Sultan Zainal Abidin mangkat, tetapi beliau telah menjadikan Ternate sebagai kekuatan Islam. Di bagian lain, Demak telah berhasil mengislamkan Banjarmasin. Mata rantai proses Islamisasi di Kepulauan Indonesia masih terus berlangsung. Jaringan kolektif keislaman di Kepulauan Indonesia inilah nantinya yang mempercepat proses terbentuknya nasionalisme Indonesia.

### Uji Kompetensi

### Tugas Individu

1. Bagaimana pendapat kamu tentang adanya berbagai teori tentang masuknya Islam ke Indonesia? Jelaskan pendapat kamu!

2. Proses Islamisasi di Indonesia berlangsung dalam waktu yang panjang bahkan masih terus berlangsung. Berikan penjelasan!

3. Sebutkan beberapa peran tokoh pengembang agama Islam di Indonesia!

4. Mengapa Islam bisa cepat diterima oleh masyarakat di Indonesia?

5. Coba kamu diskusikan tentang upacara tabot di Bengkulu atau tabuik di Pariaman.

### Tugas Kelompok

Setelah kamu memahami proses masuk dan berkembangnya Islam di Indonesia, coba amati dan perhatikan beberapa fenomena sosial yang terkait dengan Islam di sekitar tempat tinggal kamu. Buatlah kelompok dan catatan atas permasalahan berikut ini:

1. Buatlah denah dan peta tentang proses kedatangan Islam di Indonesia!

2. Di lingkungan masyarakat di Indonesia terutama di pedesaan masih sering ada kegiatan kenduri atau selamatan untuk suatu kegiatan, peristiwa atau peringatan kejadian tertentu yang disertai dengan doa-doa secara Islam, sementara kalau dilihat asal usulnya di ajaran Islam tidak ada. Mengapa dan bagaimana pendapat anda?

## B. Islam dan Jaringan Perdagangan Antarpulau

### Mengamati Lingkungan

Kepulauan Indonesia memiliki laut dan daratan yang luas. Para nelayan pergi melaut dan pulang dengan membawa hasil tangkapannya. Begitu juga di pelabuhan terlihat lalu lalang kapal yang membongkar dan memuat barang. Sungguh menakjubkan hamparan laut yang sangat luas ciptaan Tuhan. Coba kamu renungkan alam semesta, lautan dan daratan semua diciptakanNya untuk kepentingan hidup kita. Marilah kita syukuri semua itu dengan menjaga lingkungan laut dan daratan sebaik-baiknya.

Sejak lama laut telah berfungsi sebagai jalur pelayaran dan perdagangan antar sukubangsa di Kepulauan Indonesia dan bangsa-bangsa di dunia. Pelaut tradisional Indonesia telah memiliki keterampilan berlayar yang dipelajari dari nenek moyang secara turun-temurun. Bagi para pelaut, samudera bukan sekadar suatu bentangan air yang sangat luas. Setiap perubahan warna, pola gerak air, bentuk gelombang, jenis burung, dan ikan yang mengitarinya dapat membantu pelaut dalam mengambil keputusan atau tindakan untuk menentukan arah perjalanan. Sejak dulu mereka sudah mengenal teknologi arah angin dan musim untuk menentukan perjalanan pelayaran dan perdagangan. Kapal pedagang yang berlayar ke selatan menggunakan musim utara dalam Januari atau Februari dan kembali lagi pulang jika angin bertiup dari selatan dalam Juni, Juli, atau Agustus. Angin musim barat daya di Samudera Hindia adalah antara April sampai Agustus, cara yang paling diandalkan untuk berlayar ke timur. Mereka dapat kembali pada musim yang sama setelah tinggal sebentar—tapi kebanyakan tinggal untuk berdagang—untuk menghindari musim perubahan yang rawan badai dalam Oktober dan kembali dengan musim timur laut.

Bacaan berikut akan memaparkan tentang aktivitas perdagangan antarpulau pada masa awal perkembangan Islam di Indonesia. Memahami aktivitas pelayaran dan perdagangan antarpulau yang membawa serta pesan-pesan agama ini dapat menjadi pelajaran dan menambah rasa syukur terhadap Tuhan Yang Maha Esa.

### Memahami Teks

Berdasarkan data arkeologis seperti prasasti-prasasti maupun data historis berupa berita-berita asing, kegiatan perdagangan di Kepulauan Indonesia sudah dimulai sejak abad pertama Masehi. Jalurjalur pelayaran dan jaringan perdagangan Kerajaan Sriwijaya dengan negeri-negeri di Asia Tenggara, India, dan Cina terutama berdasarkan berita-berita Cina telah dikaji, antara lain oleh W. Wolters (1967). Demikian pula dari catatan-catatan sejarah Indonesia dan Malaya yang dihimpun dari sumber-sumber Cina oleh W.P Groeneveldt, telah menunjukkan adanya jaringan–jaringan perdagangan antara kerajaan-kerajaan di Kepulauan Indonesia dengan berbagai negeri terutama dengan Cina. Kontak dagang ini sudah berlangsung sejak abad-abad pertama Masehi sampai dengan abad ke-16. Kemudian kapal-kapal dagang Arab juga sudah mulai berlayar ke wilayah Asia Tenggara sejak permulaan abad ke-7. Dari literatur Arab banyak sumber berita tentang perjalanan mereka ke Asia Tenggara. Adanya jalur pelayaran tersebut menyebabkan munculnya jaringan perdagangan dan pertumbuhan serta perkembangan kota-kota pusat kesultanan dengan kota-kota bandarnya pada abad ke13 sampai abad ke-18 misalnya, Samudera Pasai, Malaka, Banda Aceh, Jambi, Palembang, Siak Indrapura, Minangakabau, Demak, Cirebon, Banten, Ternate, Tidore, Goa-Tallo, Kutai, Banjar, dan kotakota lainnya.

Dari sumber literatur Cina, Cheng Ho mencatat terdapat kerajaan yang bercorak Islam atau kesultanan, antara lain, Samudera Pasai dan Malaka yang tumbuh dan berkembang sejak abad ke-13 sampai abad ke-15, sedangkan Ma Huan juga memberitakan adanya komunitas- komunitas Muslim di pesisir utara Jawa Timur. Berita Tome Pires dalam _Suma Oriental_ (1512-1515) memberikan gambaran mengenai keberadaan jalur pelayaran jaringan perdagangan, baik regional maupun internasional. Ia menceritakan Sumber : _Ensiklopedi Jakarta_ Jilid I. 2005 tentang lalu lintas dan kehadiran para pedagang di Samudra Pasai yang berasal dari Bengal, Turki, Arab, Persia, Gujarat, Kling, Malayu, Jawa, dan Siam. Selain itu Tome Pires juga mencatat kehadiran para pedagang di Malaka dari Kairo, Mekkah, Aden, Abysinia, Kilwa, Malindi, Ormuz, Persia, Rum, Turki, Kristen Armenia, Gujarat, Chaul, Dabbol, Goa, Keling, Dekkan, Malabar, Orissa, Ceylon, Bengal, Arakan, Pegu, Siam, Kedah, Malayu, Pahang, Patani, Kamboja, Campa, Cossin Cina, Cina, Lequeos, Bruei, Lucus, Tanjung Pura, Lawe, Bangka, Lingga, Maluku, Banda, Bima, Timor, Madura, Jawa, Sunda, Palembang, Jambi, Tongkal, Indragiri, Kapatra, Minangkabau, Siak, Arqua, Aru, Tamjano, Pase, Pedir, dan Maladiva.

Berdasarkan kehadiran sejumlah pedagang dari berbagai negeri dan bangsa di Samudera Pasai, Malaka, dan bandar-bandar di pesisir utara Jawa sebagaimana diceritakan Tome Pires, kita dapat mengambil kesimpulan adanya jalur-jalur pelayaran dan jaringan perdagangan antara beberapa kesultanan di Kepulauan Indonesia baik yang bersifat regional maupun internasional.

Hubungan pelayaran dan perdagangan antara Nusantara dengan Arab meningkat menjadi hubungan langsung dan dalam intensitas tinggi. Dengan demikian aktivitas perdagangan dan pelayaran di Samudera Hindia semakin ramai. Peningkatan pelayaran tersebut berkaitan erat dengan makin majunya perdagangan di masa jaya pemerintahan Dinasti Abbasiyah (750-1258). Dengan ditetapkannya Baghdad menjadi pusat pemerintahan menggantikan Damaskus (Syam), aktivitas pelayaran dan perdagangan di Teluk Persia menjadi lebih ramai. Pedagang Arab yang selama ini hanya berlayar sampai India, sejak abad ke-8 mulai masuk ke Kepulauan Indonesia dalam rangka perjalanan ke Cina. Meskipun hanya transit, tetapi hubungan Arab dengan kerajaan-kerajaan di Kepulauan Indonesia menjadi langsung. Hubungan ini menjadi semakin ramai manakala pedagang Arab dilarang masuk ke Cina dan koloni mereka dihancurkan oleh Huang Chou, menyusul suatu pemberontakan yang terjadi pada 879 H. Orang–orang Islam melarikan diri dari pelabuhan Kanton dan meminta perlindungan Raja Kedah dan Palembang.

Ditaklukkannya Malaka oleh Portugis pada 1511, dan usaha Portugis selanjutnya untuk menguasai lalu lintas di selat tersebut, mendorong para pedagang untuk mengambil jalur alternatif, dengan melintasi Semenanjung atau pantai barat Sumatra ke Selat Sunda. Pergeseran ini melahirkan pelabuhan perantara yang baru, seperti Aceh, Patani, Pahang, Johor, Banten, Makassar dan lain sebagainya. Saat itu, pelayaran di Selat Malaka sering diganggu oleh bajak laut. Perompakan laut sering terjadi pada jalur-jalur perdagangan yang ramai, tetapi kurang mendapat pengawasan oleh penguasa setempat. Perompakan itu sesungguhnya merupakan bentuk kuno kegiatan dagang. Kegiatan tersebut dilakukan karena merosotnya keadaan politik dan mengganggu kewenangan pemerintahan yang berdaulat penuh atau kedaulatannya di bawah penguasa kolonial. Akibat dari aktivitas bajak laut, rute pelayaran perdagangan yang semula melalui Asia Barat ke Jawa lalu berubah melalui pesisir Sumatra dan Sunda. Dari pelabuhan ini pula para pedagang singgah di Pelabuhan Barus, Pariaman, dan Tiku.

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0155-01.png)

Perdagangan pada wilayah timur Kepulauan Indonesia lebih terkonsentrasi pada perdagangan cengkih dan pala. Dari Ternate dan Tidore (Maluku) dibawa barang komoditi ke Somba Opu, ibukota Kerajaan Gowa di Sulawesi Selatan. Somba Opu pada abad ke-16 telah menjalin hubungan perdagangan dengan Patani, Johor, Banjar, Blambangan, dan Maluku. Adapun Hitu (Ambon) menjadi pelabuhan yang menampung komoditi cengkih yang datang dari Huamual (Seram Barat), sedangkan komoditi pala berpusat di Banda. Semua pelabuhan tersebut umumnya didatangi oleh para pedagang Jawa, Cina, Arab, dan Makassar. Kehadiran pedagang itu mempengaruhi corak kehidupan dan budaya setempat, antara lain ditemui bekas koloninya seperti Maspait (Majapahit), Kota Jawa (Jawa) dan Kota Mangkasare (Makassar).

Pada abad ke-15, Sulawesi Selatan telah didatangi pedagang Muslim dari Malaka, Jawa, dan Sumatra. Dalam perjalanan sejarahnya, masyarakat Muslim di Gowa terutama Raja Gowa Muhammad Said (1639-1653) dan putra penggantinya, Hasanuddin (1653-1669) telah menjalin hubungan dagang dengan Portugis. Bahkan Sultan Muhammad Said dan Karaeng Pattingaloang turut memberikan saham dalam perdagangan yang dilakukan Fr. Vieira, meskipun mereka beragama Katolik. Kerjasama ini didorong oleh adanya usaha monopoli perdagangan rempah-rempah yang dilancarkan oleh kompeni Belanda di Maluku.

Hubungan Ternate, Hitu dengan Jawa sangat erat sekali. Ini ditandai dengan adanya seorang raja yang dianggap benar-benar telah memeluk Islam ialah Zainal Abidin (1486-1500) yang pernah belajar di Madrasah Giri. Ia dijuluki sebagai Raja Bulawa, artinya raja cengkeh, karena membawa cengkeh dari Maluku sebagai persembahan. Cengkih, pala, dan bunga pala ( _fuli_ ) hanya terdapat di Kepulauan Indonesia bagian timur, sehingga banyak barang yang sampai ke Eropa harus melewati jalur perdagangan yang panjang dari Maluku sampai ke Laut Tengah. Cengkih yang diperdagangkan adalah putik bunga tumbuhan hijau ( _szygium aromaticum_ atau _caryophullus aromaticus_ ) yang dikeringkan. Satu pohon ini ada yang menghasilkan cengkih sampai 34 kg. Hamparan cengkih ditanam di perbukitan di pulau-pulau kecil Ternate, Tidore, Makian, dan Motir di lepas pantai barat Halmahera dan baru berhasil ditanam di pulau yang relatif besar, yaitu Bacan, Ambon dan Seram.

Meningkatnya ekspor lada dalam kancah perdagangan internasional, membuat pedagang nusantara mengambil alih peranan India sebagai pemasok utama bagi pasaran Eropa yang berkembang dengan cepat. Selama periode (15001530) banyak terjadi gangguan di laut sehingga bandar-bandar Laut Tengah harus mencari pasokan hasil bumi Asia ke Lisabon. Oleh karena itu secara berangsur jalur perdagangan yang ditempuh pedagang muslim bertambah aktif, ditambah dengan adanya perang di laut Eropa, penaklukan Ottoman atas Mesir (1517) dan pantai Laut Merah Arabia (1538) memberikan dukungan yang besar bagi berkembangnya pelayaran Islam di Samudera Hindia.

Meskipun banyak kota bandar, namun yang berfungsi untuk melakukan ekspor dan impor komoditi pada umumnya adalah kota-kota bandar besar yang beribu kota pemerintahan di pesisir, seperti Banten, Jayakarta, Cirebon, Jepara - Demak, Ternate, Tidore,

Goa-Tallo, Banjarmasin, Malaka, Samudera Pasai, Kesultanan Jambi, Palembang dan Jambi. Kesultanan Mataram berdiri dari abad ke16 sampai ke-18. Meskipun kedudukannya sebagai kerajaan pedalaman namun wilayah kekuasaannya meliputi sebahagian besar pulau Jawa yang merupakan hasil ekspansi Sultan Agung. Kesultanan Mataram juga memiliki kota-kota bandar, seperti Jepara, Tegal, Kendal, Semarang, Tuban, Sedayu, Gresik, dan Surabaya.

Dalam proses perdagangan telah terjalin hubungan antar etnis yang sangat erat. Berbagai etnis dari kerajaan-kerajaan tersebut kemudian berkumpul dan membentuk komunitas. Oleh karena itu, muncul nama-nama kampung berdasarkan asal daerah. Misalnya,di Jakarta terdapat perkampungan Keling, Pakojan, dan kampungkampung lainnya yang berasal dari daerah-daerah asal yang jauh dari kota-kota yang dikunjungi, seperti Kampung Melayu, Kampung Bandan, Kampung Ambon, dan Kampung Bali.

Pada zaman pertumbuhan dan perkembangan Islam, sistem jual beli barang masih dilakukan dengan cara barter. Sistem barter dilakukan antara pedagang-pedagang dari daerah pesisir dengan daerah pedalaman, bahkan kadang-kadang langsung kepada petani. Transaksi itu dilakukan di pasar, baik di kota maupun desa. Tradisi jual-beli dengan sistem barter hingga kini masih dilakukan oleh beberapa masyarakat sederhana yang berada jauh di daerah terpencil. Di beberapa kota pada masa pertumbuhan dan perkembangan Islam telah menggunakan mata uang sebagai nilai tukar barang. Mata uang yang dipergunakan tidak mengikat pada mata uang tertentu, kecuali ada ketentuan yang diatur pemerintah daerah setempat.

Kemunduran perdagangan dan kerajaan yang berada di daerah tepi pantai disebabkan karena kemenangan militer dan ekonomi dari Belanda, dan munculnya kerajaan-kerajaan agraris di pedalaman yang tidak menaruh perhatian pada perdagangan.

Untuk memperdalam materi ini kamu dapat membaca buku **Taufik Abdullah dan Adrian B. Lapian,** **_Indonesia Dalam Arus Sejarah,_ jilid III.**

### Uji Kompetensi

1. Berdasarkan berita Tome Pires, buatlah peta jalur perdagangan di bagian timur kepulauan Indonesia!

2. Jelaskan dan buatlah peta jalur perdagangan alternatif setelah Malaka jatuh ke tangan Portugis tahun 1511!

3. Menurut kamu mengapa para pedagang waktu itu memilih jalur perairan atau laut?

## C. Islam Masuk Istana Raja

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0159-02.png)

Gambar 3.8 Keraton Yogyakarta

Sumber :Bambang Budi Utomo. 2011. _Atlas Sejarah Indonesia Masa Islam_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.

### Mengamati Lingkungan

Kamu tahu gambar di atas, bangunan apa dan di mana? Itu adalah salah satu pusat pemerintahan keraton yang bersifat Islam yang sampai sekarang masih berfungsi. Di Indonesia, keraton semacam ini pada perkembangannya memiliki peranan dan posisi yang sangat penting. Selain berfungsi sebagai simbol perkembangan pemerintahan Islam keraton juga menjadi lambang perjuangan kemerdekaan. Di sana para raja atau tokoh-tokohnya mengibarkan panji-panji perlawanan terhadap penjajahan. Islam yang masuk ke istana memang telah menyemai bibit-bibit kemerdekaan dan persamaan.

Pada bagian ini kamu akan mempelajari secara garis besar awal pertumbuhan dan perkembangan kerajaan-kerajaan Islam di Indonesia. Uraian ini terutama dipusatkan pada beberapa pusat kekuasaan Islam yang berada di berbagai daerah, seperti di Sumatra, Jawa, Kalimantan, Sulawesi, dan bahkan di Indonesia bagian timur, seperti Maluku dan Papua. Sedangkan kerajaan-kerajaan yang tidak diuraikan pada bab ini, kamu dapat mencari informasi melalui berbagai buku yang ada.

### Memahami Teks

### 1. Kerajaan Islam di Sumatra

Sejak awal kedatangannya, pulau Sumatra termasuk daerah pertama dan terpenting dalam pengembangan agama Islam di Indonesia. Dikatakan demikian mengingat letak Sumatra yang strategis dan berhadapan langsung dengan jalur perdangan dunia, yakni Selat Malaka. Berdasarkan catatan Tomé Pires dalam _Suma Oriental_ (1512-1515) dikatakan bahwa di Sumatra, terutama di sepanjang pesisir Selat Malaka dan pesisir barat Sumatra terdapat banyak kerajaan Islam, baik yang besar maupun yang kecil. Diantara

kerajaan-kerajaan tersebut antara lain Aceh, Biar dan Lambri, Pedir, Pirada, Pase, Aru, Arcat, Rupat, Siak, Kampar, Tongkal, Indragiri, Jambi, Palembang, Andalas, Pariaman, Minangkabau, Tiku, Panchur, dan Barus. Menurut Tomé Pires, kerajaan-kerajaan tersebut ada yang sedang mengalami pertumbuhan, ada pula yang sedang mengalami perkembangan, dan ada pula yang sedang mengalami keruntuhannya.

<div class="grid sm:grid-cols-2 gap-6">
<div>

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0160-06.png)

Gambar 3.9 Masjid di Pulau Penyengat Riau

Sumber :Bambang Budi Utomo. 2011. _Atlas Sejarah Indonesia Masa Islam_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.

</div>
<div>

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0160-08.png)

Gambar 3.10 Mesjid Agung Palembang yang dibangun pada masa pemerintahan Sultan Mahmud Badaruddin

Sumber : Taufik Abdullah dan A.B Lapian (ed). 2012. _Indonesia Dalam Arus Sejarah_ . Jilid III. Jakarta: PT Ichtiar Baru van Hoeve

</div>
</div>

#### a. Samudera Pasai

Samudera Pasai diperkirakan tumbuh berkembang antara tahun 1270 dan 1275, atau pertengahan abad ke13. Kerajaan ini terletak lebih kurang 15 km di sebelah timur Lhokseumawe, Nangro Aceh Darussalam, dengan sultan pertamanya bernama Sultan Malik as-Shaleh (wafat tahun 696 H atau 1297 M). Dalam kitab _Sejarah Melayu_ dan _Hikayat Raja-Raja Pasai_ diceritakan bahwa Sultan Malik as-Shaleh sebelumnya hanya seorang kepala Gampong Samudera bernama Marah Silu. Setelah menganut agama Islam kemudian berganti nama dengan Malik as-Shaleh.

Berikut ini merupakan urutan para raja-raja yang memerintah di Kesultanan Samudera Pasai:

1. Sultan Malik as-Shaleh (696 H/1297 M);

2. Sultan Muhammad Malik Zahir (1297-1326);

3. Sultan Mahmud Malik Zahir (± 1346-1383);

4. Sultan Zainal Abidin Malik Zahir (1383-1405);

5. Sultanah Nahrisyah (1405-1412);

6. Abu Zain Malik Zahir (1412);

7. Mahmud Malik Zahir (1513-1524).

#### b. Kesultanan Aceh Darussalam

Pada 1520 Aceh berhasil memasukkan Kerajaan Daya ke dalam kekuasaan Aceh Darussalam. Tahun 1524, Pedir dan Samudera Pasai ditaklukkan. Kesultanan Aceh Darussalam di bawah Sultan Ali Mughayat Syah menyerang kapal Portugis di bawah komandan Simao de Souza Galvao di Bandar Aceh.

Pada 1529 Kesultanan Aceh mengadakan persiapan untuk menyerang orang Portugis di Malaka, tetapi tidak jadi karena Sultan Ali Mughayat Syah wafat pada 1530, yang kemudian dimakamkan

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0162-02.png)

Gambar 3.12 Mesjid Indrapuri di Aceh Besar

Sumber :Bambang Budi Utomo. 2011. _Atlas Sejarah Indonesia Masa Islam_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.

di Kandang XII Banda Aceh. Di antara penggantinya yang terkenal adalah Sultan Alauddin Riayat Syah al-Qahhar (15381571). Usaha-usahanya adalah mengembangkan kekuatan angkatan perang, perdagangan, dan mengadakan hubungan internasional dengan kerajaan Islam di Timur Tengah, seperti Turki, Abessinia (Ethiopia), dan Mesir. Pada 1563 ia mengirimkan utusannya ke Constantinopel untuk meminta bantuan dalam usaha melawan kekuasaan Portugis.

Dua tahun kemudian datang bantuan dari Turki berupa teknisi-teknisi, dan dengan kekuatan tentaranya Sultan Alauddin Riayat Syah at-Qahhar menyerang dan menaklukkan banyak kerajaan, seperti Batak, Aru, dan Barus. Untuk menjaga keutuhan Kesultanan Aceh, Sultan Alauddin Riayat Syah al-Qahhar menempatkan suami saudara perempuannya di Barus dengan gelar Sultan Barus, dua orang putra sultan diangkat menjadi Sultan Aru dan Sultan Pariaman dengan gelar resminya Sultan Ghari dan Sultan Mughal, dan di daerahdaerah pengaruh Kesultanan Aceh ditempatkan wakil-wakil dari Aceh.

Kemajuan Kesultanan Aceh Darussalam pada masa pemerintahan Sultan Iskandar Muda mengundang perhatian para ahli sejarah. Di bidang politik Sultan Iskandar Muda telah menundukkan daerah-daerah di sepanjang pesisir timur dan barat. Demikian pula Johor di Semenanjung Malaya telah diserang, dan kemudian rnengakui kekuasaan Kesultanan Aceh Darussalam. Kedudukan Portugis di Malaka terusmenerus mengalami ancaman dan serangan, meskipun keruntuhan Malaka sebagai pusat perdagangan di Asia Tenggara baru terjadi sekitar tahun 1641 oleh VOC ( _Verenigde Oost Indische Compagnie)_ Belanda _._ Perluasan kekuasaan politik VOC sampai Belanda pada dekade abad ke-20 tetap menjadi ancaman Kesultanan Aceh.

Untuk memperdalam masalah ini kamu bisa membaca buku **A. Hasymy.** **_Sejarah Masuk dan Berkembangnya Islam di Indonesia._** dan **Marwati Djoened Poesponegoro.** **_Sejarah Nasional Indonesia Jilid I._**

#### Uji Kompetensi

Buatlah peta Sumatra. Kemudian gambarkan sebaran letak kerajaankerajaan pada peta tersebut! Kerjakan dalam kelompok.

### 2. Kerajaan Islam di Jawa

Tahukah kamu kapan dan bagaimana proses Islamisasi di tanah Jawa? Islam masuk ke Jawa melalui pesisir utara Pulau Jawa. Bukti sejarah tentang awal mula kedatangan Islam di Jawa antara lain ialah makam Fatimah binti Maimun bin Hibatullah yang wafat tahun 475 H atau 1082 M di Desa Leran, Kecamatan Manyar, Gresik. Dilihat dari namanya, diperkirakan Fatimah adalah keturunan Hibatullah, salah satu dinasti di Persia.

Di samping itu, di Gresik juga ditemukan makam Maulana Malik Ibrahim dari Kasyan (satu tempat di Persia) yang meninggal pada tahun 822 H atau 1419 M. Agak ke pedalaman, di Mojokerto juga ditemukan ratusan makam Islam kuno. Makam tertua berangka tahun 1374 . Diperkirakan makam-makam ini ialah makam keluarga istana Majapahit. Berdasarkan informasi ini, tentu kamu dapat mengambil kesimpulan bahwa Islam itu sudah lama masuk ke Pulau Jawa, jauh sebelum bangsa Barat menjejakkan kaki di pulau ini. Untuk lebih jelasnya marilah kita paparkan sekelumit kerajaankerajaan Islam di pulau Jawa.

#### a. Kerajaan Demak

Para ahli memperkirakan Demak berdiri tahun 1500. Sementara Majapahit hancur beberapa waktu sebelumnya. Menurut sumber sejarah lokal di Jawa, keruntuhan Majapahit terjadi sekitar tahun 1478. Hal ini ditandai dengan candrasengkala, _Sirna Hilang Kertaning Bhumi_ yang berarti memiliki angka tahun 1400 Saka. Raja pertama kerajaan Demak adalah Raden Fatah, yang bergelar Sultan Alam Akbar Al-Fatah. Raden Fatah memerintah Demak dari tahun 15001518 M. Menurut cerita rakyat Jawa Timur, Raden Fatah merupakan keturunan raja terakhir dari Kerajaan Majapahit, yaitu Raja Brawijaya V. Di bawah pemerintahan Raden Fatah, kerajaan Demak berkembang dengan pesat karena memiliki daerah pertanian yang luas sebagai penghasil bahan makanan, terutama beras. Selain itu, Demak juga tumbuh menjadi sebuah kerajaan maritim karena letaknya di jalur perdagangan antara Malaka dan Maluku. Oleh karena itu Kerajaan Demak disebut juga sebagai sebuah kerajaan yang agraris-maritim. Barang dagangan yang diekspor Kerajaan Demak antara lain beras, lilin dan madu. Barang-barang itu diekspor ke Malaka, Maluku dan Samudra Pasai.

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0165-01.png)

Pada masa pemerintahan Raden Fatah, wilayah kekuasaan Kerajaan Demak cukup luas, meliputi Jepara, Tuban, Sedayu, Palembang, Jambi dan beberapa daerah di Kalimantan. Daerah-daerah pesisir di Jawa bagian Tengah dan Timur kemudian ikut mengakui kedaulatan Demak dan mengibarkan panji-panjinya. Kemajuan yang dialami Demak ini dipengaruhi oleh jatuhnya Malaka ke tangan Portugis. Karena Malaka sudah dikuasai oleh Portugis, maka para pedagang yang tidak simpatik dengan kehadiran Portugis di Malaka beralih haluan menuju pelabuhan-pelabuhan Demak seperti Jepara, Tuban, Sedayu, Jaratan dan Gresik. Pelabuhanpelabuhan tersebut kemudian berkembang menjadi pelabuhan transit.

Selain tumbuh sebagai pusat perdagangan, Demak juga tumbuh menjadi pusat penyebaran agama Islam. Para wali yang merupakan tokoh penting pada perkembangan Kerajaan Demak ini, memanfaatkan posisinya untuk lebih menyebarkan Islam kepada penduduk Jawa. Para wali juga

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0166-02.png)

berusaha menyebarkan Islam di luar Pulau Jawa. Penyebaran agama Islam di Maluku dilakukan oleh Sunan Giri sedangkan di daerah Kalimantan Timur dilakukan oleh seorang penghulu dari Kerajaan Demak yang bernama Tunggang Parangan. Setelah Kerajaan Demak lemah maka muncul Kerajaan Pajang.

#### b. Kerajaan Mataram

Setelah Kerajaan Demak berakhir, berkembanglah Kerajaan Pajang di bawah pemerintahan Sultan Hadiwijaya. Di bawah kekuasaannya, Pajang berkembang baik. Bahkan berhasil mengalahkan Arya Penangsang yang berusaha merebut kekuasaannya. Tokoh yang membantunya mengalahkan Arya Penangsang diantaranya Ki Ageng Pemanahan (Ki Gede Pemanahan). la diangkat sebagai bupati (adipati) di Mataram. Kemudian puteranya, Raden Bagus (Danang) Sutawijaya diangkat anak oleh Sultan Hadiwijaya dan dibesarkan di istana. Sutawijaya dipersaudarakan dengan putra mahkota, bernama Pangeran Benowo.

Pada tahun 1582, Sultan Hadiwijaya meninggal dunia. Penggantinya, Pangeran Benowo merupakan raja yang lemah. Sementara Sutawijaya yang menggantikan Ki Gede Pemanahan justru semakin menguatkan kekuasaannya sehingga akhirnya Istana Pajang pun jatuh ke tangannya. Sutawijaya segera memindahkan pusaka Kerajaan Pajang ke Mataram. Sutawijaya sebagai raja pertama dengan gelar: _Panembahan Senapati Ing Alaga Sayidin Panatagama_ . Pusat kerajaan ada di Kota Gede, sebelah tenggara Kota Yogyakarta sekarang. Panembahan Senapati digantikan oleh puteranya yang bernama Mas Jolang (1601-1613). Mas Jolang kemudian digantikan oleh puteranya bernama Mas Rangsang atau lebih dikenal dengan nama Sultan Agung (1613-1645). Pada masa pemerintahan Sultan Agung inilah Mataram mencapai zaman keemasan.

Dalam bidang politik pemerintahan, Sultan Agung berhasil memperluas wilayah Mataram ke berbagai daerah yaitu, Surabaya (1615), Lasem, Pasuruhan (1617), dan Tuban (1620). Di samping berusaha menguasai dan mempersatukan berbagai daerah di Jawa, Sultan Agung juga ingin mengusir

<div class="grid sm:grid-cols-2 gap-6">
<div>

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0167-03.png)

Gambar 3.15 Keraton Surakarta

Sumber :Bambang Budi Utomo. 2011. _Atlas Sejarah Indonesia Masa Islam_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.

</div>
<div>

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0168-02.png)

</div>
</div>

VOC dari Kepulauan Indonesia. Kemudian diadakan dua kali serangan tentara Mataram ke Batavia pada tahun 1628 dan 1629.

Mataram mengembangkan birokrasi dan struktur pemerintahan yang teratur. Seluruh wilayah kekuasaan Mataram diatur dan dibagi menjadi beberapa bagian sebagai berikut.

##### 1. Kutagara

Kutagara atau kutanegara, yaitu daerah keraton dan sekitarnya.

##### 2. Negara agung

Negara agung atau negari agung, yaitu daerah-daerah yang ada di sekitar kutagara. Misalnya, daerah Kedu, Magelang, Pajang, dan Sukawati.

##### 3. Mancanegara

Mancanegara yaitu daerah di luar negara agung. Daerah ini meliputi mancanegara wetan (timur), misalnya daerah Ponorogo dan sekitarnya, serta mancanegara won (barat), misalnya daerah Banyumas dan sekitarnya.

##### 4. Pesisiran

Pesisiran yaitu daerah yang ada di pesisir. Daerah ini juga terdapat daerah pesisir kulon (barat), yakni Demak terus ke barat, dan pesisir wetan (timur), yakni Jepara terus ke timur.

Mataram berkembang menjadi kerajaan agraris. Dalam bidang pertanian, Mataram mengembangkan daerah-daerah persawahan yang luas. Seperti yang dilaporkan oleh Dr. de Han, Jan Vos dan Pieter Franssen bahwa Jawa bagian tengah adalah daerah pertanian yang subur dengan hasil utamanya adalah beras. Pada abad ke-17, Jawa benar-benar menjadi lumbung padi. Hasil-hasil yang lain adalah kayu, gula, kelapa, kapas, dan hasil palawija.

Di Mataram dikenal beberapa kelompok dalam masyarakat. Ada golongan raja dan keturunannya, para bangsawan dan rakyat sebagai kawula kerajaan. Kehidupan masyarakat bersifat feodal karena raja adalah pemilik tanah beserta seluruh isinya. Sultan dikenal sebagai _panatagama,_ yaitu pengatur kehidupan keagamaan. Oleh karena itu, Sultan memiliki kedudukan yang sangat tinggi. Rakyat sangat hormat dan patuh, serta hidup mengabdi pada sultan.

Bidang kebudayaan juga maju pesat. Seni bangunan, ukir, lukis, dan patung mengalami perkembangan. Kreasikreasi para seniman, misalnya terlihat pada pembuatan gapura-gapura, serta ukir-ukiran di istana dan tempat ibadah. Seni tari yang terkenal adalah Tari Bedoyo Ketawang. Dalam prakteknya, Sultan Agung memadukan unsur-unsur budaya Islam dengan budaya Hindu-Jawa. Sebagai contoh, di Mataram diselenggarakan perayaan sekaten untuk memperingati hari kelahiran Nabi Muhammad saw, dengan membunyikan gamelan Kyai Nagawilaga dan Kyai Guntur Madu. Kemudian juga diadakan upacara grebeg. Grebeg diadakan tiga kali dalam satu tahun, yaitu setiap tanggal 10 Dzulliijah (Idul

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0170-02.png)

Adha), 1 Syawal (Idul Fitri), dan tanggal 12 Rabiulawal (Maulid Nabi). Bentuk dan kegiatan upacara grebeg adalah mengarak gunungan dari keraton ke depan masjid agung. Gunungan biasanya dibuat dari berbagai makanan, kue, dan hasil bumi yang dibentuk menyerupai gunung. Upacara grebeg merupakan sedekah sebagai rasa syukur dari raja kepada Tuhan Yang Maha Esa dan juga sebagai pembuktian kesetiaan para bupati dan punggawa kerajaan kepada rajanya.

Sultan Agung wafat pada 1645. Ia dimakamkan di Bukit Imogiri. Ia digantikan oleh puteranya yang bergelar Amangkurat I. Akan tetapi, pribadi raja ini sangat berbeda dengan pribadi Sultan Agung. Amangkurat I adalah seorang raja yang lemah, berpandangan sempit, dan sering bertindak

Untuk memperdalam masalah ini kamu bisa membaca buku **J.H. de Graaf & T.H. Pigeud.** **_Kerajaan Islam Pertama di Jawa: Tinjauan Sejarah Politik Abad XV dan XVI._**

kejam. Mataram mengalami kemunduran apalagi adanya pengaruh VOC yang semakin kuat. Dalam perkembangannya Kerajaan Mataram akhirnya dibagi dua berdasarkan Perjanjian Giyanti (1755). Sebelah barat menjadi Kesultanan Yogyakarta dan sebelah timur menjadi Kasunanan Surakarta.

##### Uji Kompetensi

1. Jelaskan tentang latar belakang berdirinya Kerajaan Demak.

2. Bagaimana proses berdirinya Kerajaan Mataram?

3. Gambarkan skema struktur birokrasi pemerintahan Kerajaan Mataram

4. Benarkan Sultan Agung seorang budayawan? Berikan penjelasan!

5. Buatlah peta tentang struktur pemerintahan di Mataram yang meliputi wilayah mancanegara dan pesisiran!

#### c. Kesultanan Banten

Kerajaan Banten berawal sekitar tahun 1526, ketika Kerajaan Demak memperluas pengaruhnya ke kawasan pesisir barat Pulau Jawa, dengan menaklukan beberapa kawasan pelabuhan kemudian menjadikannya sebagai pangkalan militer serta kawasan perdagangan. Maulana Hasanuddin, putera Sunan Gunung Jati berperan dalam penaklukan tersebut. Setelah penaklukan tersebut, Maulana Hasanuddin atau lebih sohor dengan sebutan Fatahillah, mendirikan benteng pertahanan yang dinamakan _Surosowan_ , yang kemudian hari menjadi pusat pemerintahan, yakni Kesultanan Banten.

Pada awalnya kawasan Banten dikenal dengan nama Banten Girang yang merupakan bagian dari Kerajaan Sunda. Kedatangan pasukan Kerajaan di bawah pimpinan Maulana Hasanuddin ke kawasan tersebut selain untuk perluasan wilayah juga sekaligus penyebaran dakwah Islam. Kemudian

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0172-02.png)

dipicu oleh adanya kerjasama Sunda-Portugis dalam bidang ekonomi dan politik, hal ini dianggap dapat membahayakan kedudukan Kerajaan Demak selepas kekalahan mereka mengusir Portugis dari Malaka tahun 1513. Atas perintah Sultan Trenggono, Fatahillah melakukan penyerangan dan penaklukkan Pelabuhan Sunda Kelapa sekitar tahun 1527, yang waktu itu masih merupakan pelabuhan utama dari Kerajaan Sunda.

Selain mulai membangun benteng pertahanan di Banten, Fatahillah juga melanjutkan perluasan kekuasaan ke daerah penghasil lada di Lampung. Ia berperan dalam penyebaran Islam di kawasan tersebut, selain itu ia juga telah melakukan kontak dagang dengan raja _Malangkabu_ (Minangkabau, Kerajaan Inderapura), Sultan Munawar Syah dan dianugerahi keris oleh raja tersebut.

Seiring dengan kemunduran Demak terutama setelah meninggalnya Sultan Trenggono, maka Banten melepaskan diri dan menjadi kerajaan yang mandiri. Pada 1570 Fatahillah wafat. Ia meninggalkan dua orang putra laki-laki, yakni Pangeran Yusuf dan Pangeran Arya (Pangeran Jepara). Dinamakan Pangeran Jepara, karena sejak kecil ia sudah diikutkan kepada bibinya (Ratu Kalinyamat) di Jepara. Ia kemudian berkuasa di Jepara menggantikan Ratu Kalinyamat, sedangkan Pangeran Yusuf menggantikan Fatahillah di Banten.

Pangeran Yusuf melanjutkan usaha-usaha perluasan daerah yang sudah dilakukan ayahandanya. Tahun 1579, daerah-daerah yang masih setia pada Pajajaran ditaklukkan. Untuk kepentingan ini Pangeran Yusuf memerintahkan membangun kubu-kubu pertahanan. Tahun 1580, Pangeran Yusuf meninggal dan digantikan oleh puteranya, yang bernama Maulana Muhammad. Pada 1596, Maulana Muhammad melancarkan serangan ke Palembang. Pada waktu itu Palembang diperintah oleh Ki Gede ing Suro (1572 - 1627). Ki Gede ing Suro adalah seorang penyiar agama Islam dari Surabaya dan perintis perkembangan pemerintahan kerajaan Islam di Palembang. Kala itu Kerajaan Palembang lebih setia kepada Mataram dan sekaligus merupakan saingan Kerajaan Banten. Itulah sebabnya, Maulana Muhammad melancarkan serangan ke Palembang. Kerajaan Palembang dapat dikepung dan hampir saja dapat ditaklukkan. Akan tetapi, Sultan Maulana Muhammad tiba-tiba terkena tembakan musuh dan meninggal. Oleh karena itu, ia dikenal dengan sebutan Prabu Seda ing Palembang. Serangan tentara Banten terpaksa dihentikan, bahkan akhirnya ditarik mundur kembali ke Banten.

Gugurnya Maulana Muhammad menimbulkan berbagai perselisihan di istana. Putra Maulana Muhammad yang bernama Abumufakir Mahmud Abdul Kadir, masih kanak-

kanak. Pemerintahan dipegang oleh sang Mangkubumi. Akan tetapi, Mangkubumi berhasil disingkirkan oleh Pangeran Manggala. Pangeran Manggala berhasil mengendalikan kekuasaan di Banten. Baru setelah Abumufakir dewasa dan Pangeran Manggala meninggal tahun 1624, maka Banten secara penuh diperintah oleh Sultan Abumufakir Mahmud Abdul Kadir.

Pada tahun 1596 orang-orang Belanda datang di pelabuhan Banten untuk yang pertama kali. Terjadilah perkenalan dan pembicaraan dagang yang pertama antara orang-orang Belanda dengan para pedagang Banten. Tetapi dalam perkembangannya, orang-orang Belanda bersikap angkuh dan sombong, bahkan mulai menimbulkan kekacauan di Banten. Oleh karena itu, orang-orang Banten menolak dan mengusir orang-orang Belanda. Akhirnya, orang-orang Belanda kembali ke negerinya. Dua tahun kemudian, orangorang Belanda datang lagi. Mereka menunjukkan sikap yang baik, sehingga dapat berdagang di Banten dan di Jayakarta.

Menginjak abad ke-17 Banten mencapai zaman keemasan. Daerahnya cukup luas. Setelah Sultan Abumufakir meninggal, ia digantikan oleh puteranya bernama Abumaali Achmad. Setelah Abumaali Achmad, tampillah sultan yang terkenal, yakni Sultan Abdulfattah atau yang lebih dikenal dengan nama Sultan Ageng Tirtayasa. Ia memerintah pada tahun 1651 - 1682.

Pada masa pemerintahan Sultan Ageng Tirtayasa, Banten terus mengalami kemajuan. Letak Banten yang strategis mempercepat perkembangan dan kemajuan ekonomi Banten. Kehidupan

sosial budaya juga mengalami kemajuan. Masyarakat umum hidup dengan rambu-rambu budaya Islam.

Secara politik pemerintahan Banten juga semakin kuat. Perluasan wilayah kekuasaan terus dilakukan bahkan sampai ke daerah yang pernah dikuasai Kerajaan Pajajaran. Namun ada sebagian masyarakat yang menyingkir di pedalaman Banten Selatan karena tidak mau memeluk agama Islam. Mereka tetap mempertahankan agama dan adat istiadat nenek moyang. Mereka dikenal dengan masyarakat Badui. Mereka hidup mengisolir diri di tanah yang disebut tanah _Kenekes_ . Mereka menyebut dirinya orang-orang _Kejeroan._

Dalam bidang kebudayaan, seni bangunan mengalami perkembangan. Beberapa jenis bangunan yang masih tersisa, antara lain, Masjid Agung Banten, bangunan keraton dan gapura-gapura.

Pada masa akhir pemerintahan Sultan Ageng Tirtayasa timbul konflik di dalam istana. Sultan Ageng Tirtayasa yang berusaha menentang VOC, kurang disetujui oleh Sultan Haji sebagai raja muda. Keretakan di dalam istana ini dimanfaatkan VOC dengan politik _devide et impera_ . VOC membantu Sultan Haji untuk mengakhiri kekuasaan Sultan Ageng Tirtayasa. Berakhirnya kekuasaan Sultan Ageng Tirtayasa membuat semakin kuatnya kekuasaan VOC di Banten. Raja-raja yang berkuasa berikutnya, bukanlah raja-raja yang kuat. Hal ini membawa kemunduran Kerajaan Banten.

#### Uji Kompetensi

1. Diskusikan dan buat tulisan ringkas tentang kejatuhan kerajaan Banten ke tangan VOC (3-5 halaman)

2. Jelaskan tentang sejarah awal mula kehidupan orang Badui dan bagaimana adat istiadatnya ?

3. Tuliskan biografi singkat dari Sultan Ageng Tirtayasa.

Carilah bahan-bahan terkait dengan hal itu di perpustakaan sekolah, juga kamu dapat menggunakan media internet.

### 3. Kerajaan-Kerajaan Islam di Kalimantan

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0176-08.png)

Gambar 3.20 Kompleks Karaton Sambas yang bercorak Islam

Sumber :Bambang Budi Utomo. 2011. _Atlas Sejarah Indonesia Masa Islam_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.

Disamping Sumatra dan Jawa, ternyata di Kalimantan juga terdapat beberapa kerajaan-kerajaan yang bercorak Islam. Apakah kamu sudah mengetahui nama kerajaan-kerajaan Islam yang tumbuh di Kalimantan? Di antara kerajaan Islam itu adalah Kesultanan Pasir (1516), Kesultanan Banjar (1526-1905), Kesultanan Kotawaringin, Kerajaan Pagatan (1750), Kesultanan Sambas (1671), Kesultanan Kutai Kartanegara, Kesultanan Berau (1400), Kesultanan Sambaliung (1810), Kesultanan Gunung Tabur (1820), Kesultanan Pontianak (1771), Kesultanan Tidung, dan Kesultanan Bulungan (1731).

#### a. Kerajaan Pontianak

Kerajaan-kerajaan yang terletak di daerah Kalimantan Barat antara lain Tanjungpura dan Lawe. Kedua kerajaan tersebut pernah diberitakan Tome Pires (1512-1551). Tanjungpura dan Lawe menurut berita musafir Portugis sudah mempunyai kegiatan dalam perdagangan baik dengan Malaka dan Jawa, bahkan kedua daerah yang diperintah oleh Pate atau mungkin adipati kesemuanya tunduk kepada kerajaan di Jawa yang diperintah Pati Unus. Tanjungpura dan Lawe (daerah Sukadana) menghasilkan komoditi seperti emas, berlian, padi, dan banyak bahan makanan. Banyak barang dagangan dari Malaka yang dimasukkan ke daerah itu, demikian pula jenis pakaian dari Bengal dan Keling yang berwarna merah dan hitam dengan harga yang mahal dan yang murah. Pada abad ke-17 kedua kerajaan itu telah berada di bawah pengaruh kekuasaan Kerajaan Mataram terutama dalam upaya perluasan politik dalam menghadapi ekspansi politik VOC.

Demikian pula Kotawaringin yang kini sudah termasuk wilayah Kalimantan Barat pada masa Kerajaan Banjar juga sudah masuk dalam pengaruh Mataram, sekurang-kurangnya sejak abad ke-16. Meskipun kita tidak mengetahui dengan pasti kehadiran Islam di Pontianak, konon ada pemberitaan bahwa sekitar abad ke-18 atau 1720 ada rombongan pendakwah dari Tarim (Hadramaut) yang di antaranya datang ke daerah Kalimantan Barat untuk mengajarkan membaca alQur’an, ilmu fikih, dan ilmu hadis. Mereka di antaranya Syarif Idrus bersama anak buahnya pergi ke Mampawah, tetapi kemudian menelusuri sungai ke arah laut memasuki Kapuas Kecil sampailah ke suatu tempat yang menjadi cikal bakal kota Pontianak. Syarif Idrus kemudian diangkat menjadi pimpinan utama masyarakat di tempat itu dengan gelar Syarif Idrus ibn Abdurrahman al-Aydrus yang kemudian memindahkan kota dengan pembuatan benteng atau kubu dari kayu-kayuan

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0178-02.png)

untuk pertahanan. Sejak itu Syarif Idrus ibn Abdurrahman al-Aydrus dikenal sebagai Raja Kubu. Daerah itu mengalami kemajuan di bidang perdagangan dan keagamaan, sehingga banyak para pedagang yang berdatangan dari berbagai negeri. Pemerintahan Syarif Idrus (lengkapnya: Syarif Idrus al-Aydrus ibn Abdurrahman ibn Ali ibn Hassan ibn Alwi ibn Abdullah ibn Ahmad ibn Husin ibn Abdullah al-Aydrus) memerintah pada 1199-1209 H atau 1779-1789 M.

Cerita lainnya mengatakan bahwa pendakwah dari Tarim (Hadramaut) yang mengajarkan Islam dan datang ke Kalimantan bagian barat terutama ke Sukadana ialah Habib Husin al-Gadri. Ia semula singgah di Aceh dan kemudian ke Jawa sampai di Semarang dan di tempat itulah ia bertemu dengan pedagang Arab namanya Syaikh, karena itulah maka Habib al-Gadri berlayar ke Sukadana. Dengan kesaktian Habib Husin al-Gadri menyebabkan ia mendapat banyak simpati dari raja, Sultan Matan dan rakyatnya. Kemudian Habib Husin alGadri pindah dari Matan ke Mempawah untuk meneruskan syiar Islam. Setelah wafat ia diganti oleh salah seorang putranya yang bernama Pangeran Sayid Abdurrahman Nurul

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0179-01.png)

Alam. Ia pergi dengan sejumlah rakyatnya ke tempat yang kemudian dinamakan Pontianak dan di tempat inilah ia mendirikan keraton dan masjid agung. Pemerintahan Syarif Abdurrahman Nur Alam ibn Habib Husin al-Gadri pada 17731808, digantikan oleh Syarif Kasim ibn Abdurrahman al-Gadri pada 1808-1828 dan selanjutnya Kesultanan Pontianak di bawah pemerintahan sultan-sultan keluarga Habib Husin alGadri.

Ulasan di atas hanya salah satu dari kerajaan yang ada di Kalimantan, tentu kamu dapat mencari informasi lebih mendalam tentang kerajaan Islam yang ada di Kalimantan

### 4. Kerajaan-Kerajaan Islam di Sulawesi

Di daerah Sulawesi juga tumbuh kerajaan-kerajaan bercorak Islam. Munculnya kerajaan-kerajaan Islam di Sulawesi tidak terlepas dari perdagangan yang berlangsung ketika itu. Berikut ini adalah

beberapa kerajaan Islam di Sulawesi diantaranya Gowa Tallo, Bone, Wajo dan Sopeng, dan Kesultanan Buton. Dari sekian banyak kerajaan-kerajaan itu yang terkenal antara lain Kerajaan Gowa Tallo

#### a. Kerajaan Gowa Tallo

Kerajaan Gowa Tallo sebelum menjadi kerajaan Islam sering berperang dengan kerajaan lainnya di Sulawesi Selatan, seperti dengan Luwu, Bone, Soppeng, dan Wajo. Kerajaan Luwu yang bersekutu dengan Wajo ditaklukan oleh Kerajaan Gowa Tallo. Kemudian Kerajaan Wajo menjadi daerah taklukan Gowa menurut _Hikayat Wajo._ Dalam serangan terhadap Kerajaan Gowa Tallo Karaeng Gowa meninggal dan seorang lagi terbunuh sekitar pada 1565. Ketiga kerajaan Bone, Wajo, dan Soppeng mengadakan persatuan untuk mempertahankan kemerdekaannya yang disebut perjanjian _Tellumpocco,_ sekitar 1582. Sejak Kerajaan Gowa resmi sebagai kerajaan bercorak Islam pada 1605, maka Gowa meluaskan pengaruh politiknya, agar kerajaan-kerajaan lainnya juga memeluk Islam dan tunduk kepada Kerajaan Gowa Tallo. Kerajaan-kerajaan yang unduk kepada kerajaan Gowa Tallo antara lain Wajo pada 10 Mei 1610, dan Bone pada 23 Nopember 1611.

Di daerah Sulawesi Selatan proses Islamisasi makin mantap dengan adanya para mubalig yang disebut _Datto Tallu_ (Tiga Dato), yaitu Dato’ Ri Bandang (Abdul Makmur atau Khatib Tunggal) Dato’ Ri Pattimang (Dato’ Sulaemana atau Khatib Sulung), dan Dato’ Ri Tiro (Abdul Jawad alias Khatib Bungsu), ketiganya bersaudara dan berasal dari Kolo Tengah, Minangkabau. Para mubalig itulah yang mengislamkan Raja Luwu yaitu Datu’ La Patiware’ Daeng Parabung dengan gelar Sultan Muhammad pada 15-16 Ramadhan 1013 H (4-5 Februari 1605 M). Kemudian disusul oleh Raja Gowa dan Tallo yaitu Karaeng Matowaya dari Tallo yang bernama I Mallingkang Daeng Manyonri (Karaeng Tallo) mengucapkan syahadat pada Jumat sore, 9 Jumadil Awal 1014 H atau

22 September 1605 M dengan gelar Sultan Abdullah. Selanjutnya Karaeng Gowa I Manga’ rangi Daeng Manrabbia mengucapkan syahadat pada Jumat, 19 Rajab 1016 H atau 9 November 1607 M. Perkembangan agama Islam di daerah Sulawesi Selatan mendapat tempat Sumber :Bambang Budi Utomo. 2011. Jakarta: Kementerian Kebudayaan dan Pariwisata. sebaik-baiknya bahkan ajaran sufisme Khalwatiyah dari Syaikh Yusuf al-Makassari juga tersebar di Kerajaan Gowa dan kerajaan lainnya pada pertengahan abad ke-17. Karena banyaknya tantangan dari kaum bangsawan Gowa maka ia meninggalkan Sulawesi Selatan dan pergi ke Banten. Di Banten ia terima oleh Sultan Ageng Tirtayasa bahkan dijadikan menantu dan diangkat sebagai mufti di Kesultanan Banten.

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0181-04.png)

Gambar 3.23 Masjid BauBau, Sulawesi Tenggara

Dalam sejarah Kerajaan Gowa perlu dicatat tentang sejarah perjuangan Sultan Hasanuddin dalam mempertahankan kedaulatannya terhadap upaya penjajahan politik dan ekonomi kompeni (VOC) Belanda. Semula VOC tidak menaruh perhatian terhadap Kerajaan Gowa Tallo yang telah mengalami kemajuan dalam bidang perdagangan. Setelah kapal Portugis yang dirampas oleh VOC pada masa Gubernur Jendral J. P. Coen di dekat perairan Malaka ternyata di kapal tersebut ada orang Makassar. Dari orang Makassar itulah ia mendapat berita tentang pentingnya pelabuhan Sombaopu sebagai pelabuhan transit terutama untuk mendatangkan rempah-rempah dari Maluku. Pada 1634 VOC memblokir Kerajaan Gowa tetapi tidak berhasil. Peristiwa peperangan dari waktu ke waktu berjalan terus dan baru berhenti antara 1637-1638. Tetapi perjanjian damai itu tidak kekal karena pada 1638 terjadi perampokan kapal orang Bugis yang bermuatan kayu cendana, dan muatannya tersebut telah dijual kepada orang Portugis. Perang di Sulawesi Selatan ini berhenti setelah terjadi perjanjian Bongaya pada 1667 yang sangat merugikan pihak Gowa Tallo.

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0182-03.png)

Gambar 3.25 Makam Datuk Patimang, salah satu penyebar Islam di Sulawesi Selatan

Sumber :Bambang Budi Utomo. 2011. _Atlas Sejarah Indonesia Masa Islam_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.

#### Uji Kompetensi

1. Buatlah peta tentang letak kerajaan Islam di Kalimantan dan berikan penjelasan tentang peta tersebut!

2. Jelaskan apa makna dan pelajaran yang kita peroleh tentang Perjanjian Bongaya di Sulawesi!

3. Dari nama-nama kerajaan di Sulawesi di atas, kamu pilih satu dan berikan penjelasan secara singkat tentang kerajaan tersebut, misalnya kapan berdiri, siapa rajanya, pernahkah berperang melawan Belanda dan sebagainya!

### 5. Kerajaan-Kerajaan Islam di Maluku

Kepulauan Maluku menduduki posisi penting dalam perdagangan dunia di kawasan timur Nusantara. Mengingat keberadaan daerah Maluku ini maka tidak mengherankan jika sejak abad ke-15 hingga abad ke-19 kawasan ini menjadi wilayah perebutan antara bangsa Spanyol, Portugis dan Belanda.

Sejak awal diketahui bahwa di daerah ini terdapat dua kerajaan besar bercorak Islam, yakni Ternate dan Tidore. Kedua kerajaan ini terletak di sebelah barat pulau Halmahera di Maluku Utara. Kedua kerajaan itu pusatnya masing-masing di Pulau Ternate dan Tidore, tetapi wilayah kekuasaannya mencakup sejumlah pulau di Kepulauan Maluku dan Papua.

Kerajaan Ternate dikenal sebagai pemimpin Uli Lima, yaitu persekutuan lima bersaudara dengan wilayahnya meliputi Ternate, Obi, Bacan, Seram dan Ambon. Sementara Kerajaan Tidore dikenal sebagai pemimpin Uli Siwa, yakni Persekutuan Sembilan (persekutuan Sembilan Saudara) dengan wilayahnya meliputi pulau-

pulau Makyan, Jailolo, atau Halmahera, dan pulau-pulau di daerah tersebut sampai dengan wilayah Papua.

Untuk memperdalam masalah ini kamu bisa membaca buku **Bambang Budi Utomo.** **_Atlas Sejarah Indonesia Masa Islam._**

Dalam bidang kebudayaan, di Maluku berkembang seni pahat, seni bangunan, dan seni patung. Seni bangunan berupa istana raja, bangunan masjid, dan lain-lain, tetap dikembangkan. Agama Islam dan bahasa Melayu juga semakin berkembang di Maluku.

#### Uji Kompetensi

1. Jelaskan proses Islamisasi di Maluku!

2. Ceritakan secara singkat tentang Sultan Baabullah!

3. Ceritakan hubungan antara kerajaan Ternate dan Tidore dengan tokoh-tokoh ulama dari Gresik!

4. Buatlah tulisan 2-3 halaman dengan judul: ”Ternate dan Tidore: Antara Lawan dan Kawan”!

### 6. Kerajaan-Kerajaan Islam di Papua

Sumber-sumber sejarah menunjukkan bahwa penyebaran Islam di Papua sudah berlangsung sejak lama. Bahkan, berdasarkan bukti sejarah terdapat sejumlah kerajaan-kerajaan Islam di Papua, yakni: (1) Kerajaan Waigeo (2) Kerajaan Misool (3) Kerajaan Salawati (4) Kerajaan Sailolof (5) Kerajaan Fatagar (6) Kerajaan Rumbati (terdiri dari Kerajaan Atiati, Sekar, Patipi, Arguni, dan Wertuar) (7) Kerajaan Kowiai (Namatota) (8). Kerajaan Aiduma (9) Kerajaan Kaimana.

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0185-01.png)

Berdasarkan sumber tradisi lisan dari keturunan raja-raja di Raja Ampat-Sorong, Fakfak, Kaimana dan Teluk Bintuni-Manokwari, Islam sudah lebih awal datang ke daerah ini. Ada beberapa pendapat mengenai kedatangan Islam di Papua. _Pertama_ , Islam datang di Papua tahun 1360 yang disebarkan oleh mubaligh asal Aceh, Abdul Ghafar. Pendapat ini juga berasal dari sumber lisan yang disampaikan oleh putra bungsu Raja Rumbati ke-16 (Muhamad Sidik Bauw) dan Raja Rumbati ke-17 (H. Ismail Samali Bauw). Abdul Ghafar berdakwah selama 14 tahun (1360-1374) di Rumbati dan sekitarnya. Ia kemudian wafat dan dimakamkan di belakang masjid kampung Rumbati tahun 1374.

_Kedua_ , pendapat yang menjelaskan bahwa agama Islam pertama kali mulai diperkenalkan di tanah Papua di jazirah Onin (Patimunin-Fakfak) oleh seorang sufi bernama Syarif Muaz al-Qathan dengan gelar Syekh Jubah Biru dari negeri Arab. Pengislaman ini diperkirakan terjadi pada abad pertengahan abad ke-16, dengan bukti adanya Masjid Tunasgain yang berumur sekitar 400 tahun atau di bangun sekitar tahun 1587.

_Ketiga,_ pendapat yang mengatakan bahwa Islamisasi di Papua, khususnya di Fakfak dikembangkan oleh pedagang-pedagang Bugis melalui Banda dan Seram Timur oleh seorang pedagang dari Arab bernama Haweten Attamimi yang telah lama menetap di Ambon. Proses pengislamannya dilakukan dengan cara khitanan. Di bawah ancaman penduduk setempat jika orang yang disunat mati, kedua mubaligh akan dibunuh, namun akhirnya mereka berhasil dalam khitanan tersebut kemudian penduduk setempat berduyun-duyun masuk agama Islam.

_Keempat,_ pendapat yang mengatakan Islam di Papua berasal dari Bacan. Pada masa pemerintahan Sultan Mohammad al-Bakir, Kesultanan Bacan mencanangkan syiar Islam ke seluruh penjuru negeri, seperti Sulawesi, Fiilipina, Kalimantan, Nusa Tenggara, Jawa dan Papua. Menurut Thomas Arnold, Raja Bacan yang pertama kali masuk Islam adalah Zainal Abidin yang memerintah tahun 1521. Pada masa ini Bacan telah menguasai suku-suku di Papua serta pulaupulau di sebelah barat lautnya, seperti Waigeo, Misool, Waigama, dan Salawati. Sultan Bacan kemudian meluaskan kekuasaannya hingga ke semenanjung Onin Fakfak, di barat laut Papua tahun 1606. Melalui pengaruhnya dan para pedagang muslim, para pemuka masyarakat di pulau-pulau kecil itu lalu memeluk agama Islam. Meskipun pesisir menganut agama Islam, sebagian besar penduduk asli di pedalaman masih tetap menganut animisme.

_Kelima_ , pendapat yang mengatakan bahwa Islam di Papua berasal dari Maluku Utara (Ternate-Tidore). Sumber sejarah Kesultanan Tidore menyebutkan bahwa pada tahun 1443 Sultan Ibnu Mansur ( Sultan Tidore X atau Sultan Papua I ) memimpin ekspedisi ke daratan tanah besar (Papua). Setelah tiba di wilayah Pulau Misool dan Raja Ampat, kemudian Sultan Ibnu Mansur mengangkat Kaicil Patrawar putera Sultan Bacan dengan gelar Komalo Gurabesi (Kapita Gurabesi ). Kapita Gurabesi kemudian dikawinkan dengan putri Sultan Ibnu Mansur bernama Boki Tayyibah. Kemudian berdiri empat kerajaan di Kepulauan Raja Ampat tersebut, yakni Kerajaan Salawati, Kerajaan Misool atau Kerajaan Sailolof, Kerajaan Batanta, dan Kerajaan Waigeo.

Berdasarkan penjelasan di atas dapat disimpulkan bahwa proses Islamisasi tanah Papua, terutama di daerah pesisir barat pada pertengahan abad ke-15, dipengaruhi oleh kerajaan-kerajaan Islam di Maluku (Bacan, Ternate dan Tidore). Hal ini didukung karena faktor letaknya yang strategis, yang merupakan jalur perdagangan rempah-rempah _(silk road)_ di dunia.

### 7. Kerajaan-Kerajaan Islam di Nusa Tenggara

Kehadiran Islam ke daerah Nusa Tenggara antara lain ke Lombok diperkirakan sejak abad ke-16 yang diperkenalkan Sunan Perapen, putra Sunan Giri. Islam masuk ke Sumbawa kemungkinan datang lewat Sulawesi, melalui dakwah para mubalig dari Makassar antara 1540-1550. Kemudian berkembang pula kerajaan Islam salah satunya adalah Kerajaan Selaparang di Lombok.

#### a. Kerajaan Lombok dan Sumbawa

Selaparang merupakan pusat kerajaan Islam di Lombok di bawah pemerintahan Prabu Rangkesari. Pada masa itulah Selaparang mengalami zaman keemasan dan memegang hegemoni di seluruh Lombok. Dari Lombok, Islam disebarkan ke Pejanggik, Parwa, Sokong, Bayan, dan tempat-tempat lainnya. Konon Sunan Perapen meneruskan dakwahnya dari Lombok menuju Sumbawa. Hubungan dengan beberapa negeri dikembangkan terutama dengan Demak.

Kerajaan-kerajaan di Sumbawa Barat dapat dimasukkan kepada kekuasaan Kerajaan Gowa pada 1618. Bima ditaklukkan pada 1633 dan kemudian Selaparang pada 1640. Pada abad ke-17 seluruh Kerajaan Islam Lombok berada di bawah pengaruh kekuasaan Kerajaan Gowa. Hubungan antara Kerajaan Gowa dan Lombok dipererat dengan cara perkawinan seperti _Pemban_ Selaparang, _Pemban_ Pejanggik, dan _Pemban_ Parwa. Kerajaan-kerajaan di Nusa Tenggara mengalami

tekanan dari VOC setelah terjadinya perjanjian Bongaya pada 18 November 1667. Oleh karena itu pusat Kerajaan Lombok dipindahkan ke Sumbawa pada 1673 dengan tujuan untuk dapat mempertahankan kedaulatan kerajaan-kerajaan Islam di pulau tersebut dengan dukungan pengaruh kekuasaan Gowa. Sumbawa dipandang lebih strategis daripada pusat pemerintahan di Selaparang mengingat ancaman dan serangan terhadap VOC terus-menerus terjadi.

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0188-03.png)

Gambar 3.27 Masjid Bayan Beleq, Lombok

Sumber: Bambang Budi Utomo. 2011. _Atlas Sejarah Indonesia Masa Islam_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.

Untuk memperdalam masalah ini kamu bisa membaca buku **Bambang Budi Utomo.** **_Atlas Sejarah Indonesia Masa Islam._**

### Uji Kompetensi

1. Buatlah peta dunia (kamu dapat memfotokopi pada atlas) kemudian gambarkan pelabuhan-pelabuhan yang pada masa Islam digunakan sebagai bandar-bandar perdagangan dan berperan dalam penyebaran Islam sampai di Indonesia!

2. Rumuskan nilai-nilai karakter yang dapat diperoleh setelah belajar perkembangan kerajaan-kerajaan Islam di Indonesia! Nilai apa saja yang sekiranya dapat kamu amalkan?

## D. Terbentuknya Jaringan Keilmuan di Nusantara

### Memahami Teks

Pada bagian ini kamu akan memahami hubungan antara Istana sebagai pusat kekuasaan dan pendidikan. Perkembangan lembaga pendidikan dan pengajaran di masjid-masjid kesultanan sangat ditentukan oleh dukungan penguasa. Sultan bukan saja mendanai kegiatan-kegiatan masjid, tetapi juga mendatangkan para ulama, baik dari mancanegara, terutama Timur Tengah, maupun dari kalangan ulama pribumi sendiri. Para ulama yang kemudian juga difungsikan sebagai pejabat-pejabat negara, bukan saja memberikan pengajaran agama Islam di masjid-masjid negara, tetapi juga di istana sultan. Para sultan dan pejabat tinggi rupanya juga menimba ilmu dari para ulama. Seperti halnya yang terjadi di Kerajaan Islam Samudera Pasai dan Kerajaan Malaka.

Ketika Kerajaan Samudera Pasai mengalami kemunduran dalam bidang politik, tradisi keilmuannya tetap berlanjut. Samudera Pasai terus berfungsi sebagai pusat studi Islam di Nusantara. Namun, ketika Kerajaan Malaka telah masuk Islam, pusat studi keislaman tidak lagi hanya dipegang oleh Samudera Pasai. Malaka kemudian juga berkembang sebagai pusat studi Islam di Asia Tenggara, bahkan mungkin dapat dikatakan berhasil menyainginya. Kemajuan ekonomi Kerajaan Malaka telah mengundang banyak ulama dari mancanegara untuk berpartisipasi dengan lebih intensif dalam proses pendidikan dan pembelajaran agama Islam.

Kerajaan Malaka dengan giat melaksanakan pengajian dan pendidikan Islam. Hal itu terbukti dengan berhasilnya kerajaan ini dalam waktu singkat melakukan perubahan sikap dan konsepsi masyarakat terhadap agama, kebudayaan dan ilmu pengetahuan. Proses pendidikan dan pengakaran itu sebagian berlangsung di kerajaan. Perpustakaan sudah tersedia di istana dan difungsikan

sebagai pusat penyalinan kitab-kitab dan penerjemahannya dari bahasa Arab ke bahasa Melayu. Karena perhatian kerajaan yang tinggi terhadap pendidikan Islam, banyak ulama dari mancanegara yang datang ke Malaka, seperti dari Afghanistan, Malabar, Hindustan, dan terutama dari Arab. Banyaknya para ulama besar dari berbagai negara yang mengajar di Malaka telah menarik para penuntut ilmu dari berbagai kerajaan Islam di Asia Tenggara untuk datang. Dari Jawa misalnya, Sunan Bonang dan Sunan Giri pernah menuntut ilmu ke Malaka dan setelah menyelesaikan pendidikannya mereka kembali ke Jawa dan mendirikan lembaga pendidikan Islam di tempat masing-masing.

Hubungan antar kerajaan Islam, misalnya Samudera Pasai, Malaka, dan Aceh Darussalam, sangat bermakna dalam bidang budaya dan keagamaan. Ketiganya tersohor dengan sebutan Serambi Mekkah dan menjadi pusat pendidikan dan pengajaran agama Islam di Indonesia. Untuk mengintensifkan proses Islamisasi, para ulama telah mengarang, menyadur, dan menerjemahkan karyakarya keilmuan Islam. Sultan Iskandar Muda adalah raja yang sangat memperhatikan pengembangan pendidikan dan pengajaran agama Islam. Ia mendirikan Masjid Raya Baiturrahman, dan memanggil Hamzah al Fanzuri dan Syamsuddin as Sumatrani sebagai penasihat. Syekh Yusuf al Makassari ulama dari Kesultanan Goa di Sulawesi Selatan pernah menuntut ilmu di Aceh Darussalam sebelum melanjutkan ke Mekkah. Melalui pengajaran Abdur Rauf as Singkili telah muncul ulama Minangkabau Syekh Burhanuddin Ulakan yang terkenal sebagai pelopor pendidikan Islam di Minangkabau dan Syekh Abdul Muhyi al Garuti yang berjasa menyebarkan pendidikan Islam di Jawa Barat. Karya-karya susastra dan keagamaan dengan segera berkembang di kerajaan-kerajaan Islam. Kerajaan-kerajaan Islam itu telah merintis terwujudnya idiom kultural yang sama, yaitu Islam. Hal itu menjadi pendorong terjadinya interaksi budaya yang makin erat.

Di Banten, fungsi istana sebagai lembaga pendidikan juga sangat mencolok. Bahkan pada abad ke-17, Banten sudah menjadi

pusat ilmu pengetahuan Islam di pulau Jawa. Para ulama dari berbagai negara menjadikan Banten sebagai tempat untuk belajar. Martin van Bruinessen menyatakan, “Pendidikan agama cukup menonjol ketika Belanda datang untuk pertama kalinya pada 1596 dan menyaksikan bahwa orang-orang Banten memiliki guru-guru yang berasal dari Mekkah”.

Di Palembang, istana (keraton) juga difungsikan sebagai pusat sastra dan ilmu agama. Banyak Sultan Palembang yang mendorong perkembangan intelektual keagamaan, seperti Sultan Ahmad Najamuddin I (1757-1774) dan Sultan Muhammad Baha’uddin (1774-1804). Pada masa pemerintahan mereka, telah muncul banyak ilmuwan asal Palembang yang produktif melahirkan karyakarya ilmiah keagamaan: ilmu tauhid, ilmu kalam, tasawuf, tarekat, tarikh, dan al-Qur’an. Perhatian sultan terhadap perkembangan ilmu pengetahuan Islam tercermin pada keberadaan perpustakaan keraton yang memiliki koleksi yang cukup lengkap dan rapi.

Berkembangnya pendidikan dan pengajaran Islam, telah berhasil menyatukan wilayah Nusantara yang sangat luas. Dua hal yang mempercepat proses itu yaitu penggunaan aksara Arab dan bahasa Melayu sebagai bahasa pemersatu ( _lingua franca_ ). Semua ilmu yang diberikan di lembaga pendidikan Islam di Nusantara ditulis dalam aksara Arab, baik dalam bahasa Arab maupun dalam bahasa Melayu atau Jawa. Aksara Arab itu disebut dengan banyak sebutan, seperti huruf _Jawi (_ di Melayu) dan huruf _pegon_ (di Jawa). Luasnya penguasaan aksara Arab ke Nusantara telah membuat para pengunjung asal Eropa ke Asia Tenggara terpukau oleh tingginya tingkat kemampuan baca tulis yang mereka jumpai.

Pada 1579, orang Spanyol merampas sebuah kapal kecil dari Brunei. Orang Spanyol itu menguji apakah orang-orang Melayu yang menyatakan diri sebagai budak-budak sultan itu dapat menulis. Dua dari tujuh orang itu dapat (menulis), dan semuanya mampu membaca surat kabar berbahasa Melayu sendiri-sendiri.

Berkembangnya pendidikan Islam di istana-istana raja seolah menjadi pendorong munculnya pendidikan dan pengajaran di masyarakat. Setelah terbentuknya berbagai ulama hasil didikan dari istana-istana, maka murid-muridnya melakukan pendidikan ke tingkatan yang lebih luas, dengan dilangsungkannya pendidikan di rumah-rumah ulama untuk masyarakat umum, khususnya sebagai tempat pendidikan dasar, layaknya _kuttâb_ di wilayah Arab. Sebagaimana _kuttâb_ (lembaga pendidikan dasar di Arab sejak masa Rasulullah) yang biasa mengambil tempat di rumah-rumah ulama, di Nusantara pendidikan dasar berlangsung di rumah-rumah guru. Pelajaran yang diberikan terutama membaca al-Qur’an, menghafal ayat-ayat pendek, dan belajar bacaan salat lima waktu. Dan ini diperkirakan sama tuanya dengan kehadiran Islam di wilayah ini.

Di Nusantara, masjid-masjid yang berada di permukiman penduduk yang dikelola secara swadaya oleh masyarakat menjalankan fungsi pendidikan dan pengajaran untuk masyarakat umum. Di sinilah terjadi demokratisasi pendidikan dalam sejarah Islam. Demikianlah yang terjadi di wilayah-wilayah Islam di Nusantara, seperti Malaka dan kemudian Johor, Aceh Darussalam, Minangkabau, Palembang, Demak, Cirebon, Banten, Pajang, Mataram, Gowa-Tallo, Bone, Ternate, Tidore, Banjar, Papua dan lain sebagainya. Bahkan mungkin karena memiliki tingkat otonomi dan kebebasan tertentu, di masjid proses pendidikan dan pengajaran mengalami perkembangan. Tidak jarang di antaranya berkembang menjadi sebuah lembaga pendidikan yang cukup kompleks, seperti meunasah di Aceh, surau di Minangkabau, langgar di Kalimantan dan pesantren di Jawa.

Untuk memperdalam tentang jaringan keilmuan ini kamu dapat membaca buku **Taufik Abdullah dan Adrian B. Lapian,** **_Indonesia dalam Arus Sejarah,_ jilid III** dan **Sartono Kartodirdjo.** **_Pengantar Sejarah Indonesia Baru 1500-1900 dari Emporium sampai Empirium._**

## E. Antara Akulturasi dan Perkembangan Budaya Islam

### Mengamati Lingkungan

Coba perhatikan secara cermat gambar menara Masjid Kudus di atas. Bentuknya unik seperti candi langgam Jawa Timur. Di bagian atas ada bedug yang dibunyikan seiring datangnya waktu salat. Itulah bentuk nyata akulturasi dalam kebudayaan di Indonesia. Di Nusantara banyak terdapat bangunan yang akulturatif dan budaya non fisik yang merupakan perpaduan antara budaya Islam dengan budaya lain. Untuk lebih menghayati perkembangan hasil budaya ini, kamu dapat mengkaji uraian berikut

### Memahami Teks

Berkembangnya kebudayaan Islam di Kepulauan Indonesia telah menambah khasanah budaya nasional Indonesia, serta ikut memberikan dan menentukan corak kebudayaan bangsa Indonesia. Akan tetapi karena kebudayaan yang berkembang di Indonesia sudah begitu kuat di lingkungan masyarakat maka berkembangnya kebudayaan Islam tidak menggantikan atau memusnahkan kebudayaan yang sudah ada. Dengan demikian terjadi akulturasi antara kebudayaan Islam dengan kebudayaan yang sudah ada.

Hasil proses akulturasi antara kebudayaan pra-Islam dengan ketika Islam masuk tidak hanya berbentuk fisik kebendaan seperti seni bangunan, seni ukir atau pahat, dan karya sastra tetapi juga menyangkut pola hidup dan kebudayaan non fisik lainnya. Beberapa contoh bentuk akulturasi akan ditunjukkan pada paparan berikut.

### 1. Seni Bangunan

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0194-03.png)

Gambar 3.28 Menara Masjid Kudus

Sumber: Bambang Budi Utomo. 2011. _Atlas Sejarah Indonesia Masa Islam_ . Jakarta: Kementerian Kebudayaan dan Pariwisata

Seni dan arsitektur bangunan Islam di Indonesia sangat unik, menarik dan akulturatif. Seni bangunan yang menonjol di zaman perkembangan Islam ini terutama masjid dan menaranya serta makam.

#### a. Masjid dan Menara

Dalam seni bangunan di zaman perkembangan Islam, nampak ada perpaduan antara unsur Islam dengan kebudayaan praIslam yang telah ada. Seni bangunan Islam yang menonjol adalah masjid. Fungsi utama dari masjid, adalah tempat beribadah bagi orang Islam. Masjid atau mesjid dalam bahasa Arab mungkin berasal dari bahasa Aramik atau bentuk bebas dari perkataan _sajada_ yang artinya _merebahkan diri untuk bersujud._ Dalam bahasa Ethiopia terdapat perkataan _mesgad_ yang dapat diartikan dengan _kuil_ atau _gereja._ Di antara dua pengertian tersebut yang mungkin primair ialah tempat orang merebahkan diri untuk bersujud ketika salat atau sembahyang.

Pengertian tersebut dapat dikaitkan dengan salah satu hadis sahih al-Bukhârî yang menyatakan bahwa “Bumi ini dijadikan bagiku untuk masjid (tempat salat) dan alat pensucian (buat tayamum) dan di tempat mana saja seseorang dari umatku mendapat waktu salat, maka salatlah di situ.” Jika pengertian tersebut dapat dibenarkan dapat pula diambil asumsi bahwa ternyata agama Islam telah memberikan pengertian perkataan masjid atau mesjid itu bersifat universal.

Dengan sifat universal itu, maka orang-orang Muslim diberikan keleluasaan untuk melakukan ibadah salat di tempat manapun asalkan bersih. Karena itu tidak mengherankan apabila ada orang Muslim yang melakukan salat di atas batu di sebuah sungai, di atas batu di tengah sawah atau ladang, di tepi jalan, di lapangan rumput, di atas gubug penjaga sawah atau _ranggon_ (Jawa, Sunda) di atas bangunan gedung dan sebagainya. Meskipun pengertian hadist tersebut memberikan keleluasaan bagi setiap Muslim untuk salat, namun dirasakan perlunya mendirikan bangunan khusus yang disebut masjid sebagai tempat peribadatan umat Islam. Masjid sebenarnya mempunyai fungsi yang luas yaitu sebagai pusat untuk menyelenggarakan keagamaan Islam, pusat untuk mempraktikkan ajaran-ajaran persamaan hak dan persahabatan di kalangan umat Islam. Demikian pula masjid dapat dianggap sebagai pusat kebudayaan bagi orang-orang Muslim.

Di Indonesia sebutan masjid serta bangunan tempat peribadatan lainnya ada bermacam-macam sesuai dan tergantung kepada masyarakat dan bahasa setempat. Sebutan masjid, dalam bahasa Jawa lazim disebut _mesjid,_ dalam bahasa Sunda disebut _masigit,_ dalam bahasa Aceh disebut _meuseugit,_ dalam bahasa Makassar dan Bugis disebut _masigi._

Bangunan masjid-masjid kuno di Indonesia memiliki ciri-ciri sebagai berikut:

- 1. Atapnya berupa atap tumpang, yaitu atap yang bersusun, semakin ke atas semakin kecil dan tingkat yang paling atas berbentuk limas. Jumlah tumpang biasanya selalu gasal/ ganjil, ada yang tiga, ada juga yang lima. Ada pula yang tumpangnya dua, tetapi yang ini dinamakan tumpang satu, jadi angka gasal juga. Atap yang demikian disebut _meru_ . Atap masjid biasanya masih diberi lagi sebuah kemuncak/ puncak yang dinamakan _mustaka._

- 2. Tidak ada menara yang berfungsi sebagai tempat mengumandangkan adzan. Berbeda dengan masjidmasjid di luar Indonesia yang umumnya terdapat menara. Pada masjid-masjid kuno di Indonesia untuk menandai datangnya waktu salat dengan memukul _bedhug_ atau _kenthongan._ Yang istimewa dari Masjid Kudus dan Masjid Banten adalah menaranya yang bentuknya begitu unik. bentuk menara Masjid Kudus merupakan sebuah candi langgam Jawa Timur yang telah diubah dan disesuaikan penggunaannya dengan diberi atap tumpang. Pada Masjid Banten, menara tambahannya dibuat menyerupai mercusuar.

- 3. Masjid umumnya didirikan di ibu kota atau dekat istana kerajaan. Ada juga masjid-masjid yang dipandang keramat yang dibangun di atas bukit atau dekat makam. Masjidmasjid di zaman Wali Sanga umumnya berdekatan dengan makam.

#### b. Makam

Bangunan makam muncul saat perkembangan Islam pada periode perkembangan kerajaan Islam. Bahkan kalau yang meninggal itu orang terhormat wali atau raja, bangunan makamnya nampak begitu megah bahkan ada bangunan

semacam rumah yang disebut cungkup. Kemudian kalau kita perhatikan letak makam orang-orang yang dianggap suci biasanya berada di dekat masjid di dataran rendah dan ada pula di dataran tinggi atau di atas bukit.

Makam-makam yang lokasinya di dataran dekat masjid agung, bekas kota pusat kesultanan antara lain makam sultansultan Demak di samping Masjid Agung Demak, makam rajaraja Mataram-Islam Kota Gede (D.I. Yogyakarta), makam sultan-sultan Palembang, makam sultan-sultan di daerah Nanggroe Aceh, yaitu kompleks makam di Samudera Pasai, makam sultan-sultan Aceh di Kandang XII, Gunongan dan di tempat lainnya di Nanggroe Aceh, makam sultan-sultan SiakIndrapura (Riau), makam sultan-sultan Palembang, makam sultan-sultan Banjar di Kuin (Banjarmasin), makam sultansultan di Martapura (Kalimantan Selatan), makam sultansultan Kutai (Kalimantan Timur), makam sultan Ternate di Ternate, makam sultan-sultan Goa di Tamalate, dan kompleks makam raja-raja di Jeneponto dan kompleks makam di Watan Lamuru (Sulawesi Selatan), makam-makam di berbagai daerah lainnya di Sulawesi Selatan, serta kompleks makam Selaparang di Nusa Tenggara.

Di beberapa tempat terdapat makam-makam yang meski tokoh yang dikubur termasuk wali atau syaikh namun, penempatannya berada di daerah dataran antara lain, yaitu makam Sunan Bonang di Tuban, makam Sunan Derajat (Lamongan), makam Sunan Kalijaga di Kadilangu (Demak), makam Sunan Kudus di Kudus, makam Maulana Malik Ibrahim dan makam Leran di Gresik (Jawa Timur), makam Datuk Ri Bandang di Takalar (Sulawesi Selatan), makam Syaikh Burhanuddin (Pariaman), makam Syaikh Kuala atau Nuruddin ar-Raniri (Aceh) dan masih banyak para dai lainnya di tanah air yang dimakamkan di dataran.

Makam-makam yang terletak di tempat-tempat tinggi atau di atas bukit-bukit sebagaimana telah dikatakan di atas, masih menunjukkan kesinambungan tradisi yang mengandung unsur kepercayaan pada ruh-ruh nenek moyang yang sebenarnya sudah dikenal dalam pengejawantahan pendirian punden-punden berundak Megalitik. Tradisi tersebut dilanjutkan pada masa kebudayaan Indonesia Hindu-Buddha yang diwujudkan dalam bentuk bangunan-bangunan yang disebut candi. Antara lain Candi Dieng yang berketinggian 2.000 meter di atas permukaan laut, Candi Gedongsanga, Candi Borobudur. Percandian Prambanan, Candi Ceto dan Candi Sukuh di daerah Surakarta, Percandian Gunung Penanggungan dan lainnya. Menarik perhatian kita bahwa makam Sultan Iskandar Tsani dimakamkan di Aceh dalam sebuah bangunan berbentuk gunungan yang dikenal pula unsur _meru_ .

Setelah kebudayaan Indonesia Hindu-Buddha mengalami keruntuhan dan tidak lagi ada pendirian bangunan percandian, unsur seni bangunan keagamaan masih

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0198-04.png)

Gambar 3.29 Kompleks makam rajaraja Kesultanan Palembang Kawah Tengkurep

Sumber: Bambang Budi Utomo. 2011. _Atlas Sejarah Indonesia Masa Islam_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.

diteruskan pada masa tumbuh dan berkembangnya Islam di Indonesia melalui proses akulturasi. Makam-makam yang lokasinya di atas bukit, makam yang paling atas adalah yang dianggap paling dihormati misalnya Sunan Gunung Jati atau Syarif Hidayatullah di Gunung Sembung, di bagian teratas kompleks pemakaman Imogiri ialah makam Sultan Agung Hanyokrokusumo. Kompleks makam yang mengambil tempat datar misalnya di Kota Gede, orang yang paling dihormati ditempatkan di bagian tengah. Makam walisongo dan sultansultan pada umumnya ditempatkan dalam bangunan yang disebut _cungkup_ yang masih bergaya kuno dan juga dalam bangunan yang sudah diperbaharui. _Cungkup-cungkup_ yang termasuk kuno antara lain _cungkup_ makam Sunan Giri, Sunan Derajat, dan Sunan Gunung Jati. Demikian juga _cungkup_ makam sultan-sultan yang dapat dikatakan masih menunjukkan kekunoannya walaupun sudah mengalami perbaikan contohnya _cungkup_ makam sultan-sultan Demak, Banten, dan Ratu Kalinyamat (Jepara).

Di samping bangunan makam, terdapat tradisi pemakaman yang sebenarnya bukan berasal dari ajaran Islam. Misalnya, jenazah dimasukkan ke dalam peti. Pada zaman kuno ada peti batu, kubur batu dan lainnya. Sering pula di atas kubur diletakkan bunga-bunga. Pada hari ke-3, ke-7, ke40, ke-100, satu tahun, dua tahun, dan 1000 hari diadakan selamatan. Saji-sajian dan selamatan adalah unsur pengaruh kebudayaan praIslam, tetapi doa-doanya secara Islam. Hal ini jelas menunjukkan perpaduan. Sesudah upacara terakhir (seribu hari) selesai, barulah kuburan diabadikan, artinya diperkuat dengan bangunan dan batu. Bangunan ini disebut _jirat_ atau _kijing._ Nisannya diganti dengan nisan batu. Di atas _jirat_ sering didirikan semacam rumah yang di atas disebut _cungkup_ . Dalam kaitan dengan makam Islam ada juga istilah masjid makam. Apa yang dimaksud masjid makam itu?

### 2. Seni Ukir

Pada masa perkembangan Islam di zaman madya, berkembang ajaran bahwa seni ukir, patung, dan melukis makhluk hidup, apalagi manusia secara nyata, tidak diperbolehkan. Di Indonesia ajaran tersebut ditaati. Hal ini menyebabkan seni patung di Indonesia pada zaman madya, kurang berkembang. Padahal pada masa sebelumnya seni patung sangat berkembang, baik

patung-patung bentuk manusia maupun binatang. Akan tetapi, sesudah zaman madya, seni patung berkembang seperti yang dapat kita saksikan sekarang ini.

Walaupun seni patung untuk menggambarkan makhluk hidup secara nyata tidak diperbolehkan. Akan tetapi, seni pahat atau seni ukir terus berkembang. Para seniman tidak ragu-ragu mengembangkan seni hias dan seni ukir dengan motif daun-daunan dan bunga-bungaan seperti yang telah dikembangkan sebelumnya. Kemudian juga ditambah seni hias dengan huruf Arab (kaligrafi). Bahkan muncul kreasi baru, yaitu kalau terpaksa ingin melukiskan makluk hidup, akan disamar dengan berbagai hiasan, sehingga tidak lagi jelas-jelas berwujud binatang atau manusia.

Banyak sekali bangunan-bangunan Islam yang dihiasi dengan berbagai motif ukir-ukiran. Misalnya, ukir-ukiran pada pintu atau tiang pada bangunan keraton ataupun masjid, pada gapura atau

Untuk lebih mendalami, silakan membaca buku **R. Soekmono,** **_Pengantar Sejarah Kebudayaan Indonesia III._**

pintu gerbang. Dikembangkan juga seni hias atau seni ukir dengan bentuk tulisan Arab yang dicampur dengan ragam hias yang lain. Bahkan ada seni kaligrafi yang membentuk orang, binatang, atau wayang.

### 3. Aksara dan Seni Sastra

Tersebarnya Islam di Indonesia membawa pengaruh dalam bidang aksara atau tulisan. Abjad atau huruf-huruf Arab sebagai abjad yang digunakan untuk menulis bahasa Arab mulai digunakan di Indonesia. Bahkan huruf Arab digunakan di bidang seni ukir. Berkaitan dengan itu berkembang seni kaligrafi.

Di samping pengaruh sastra Islam dan Persia, perkembangan sastra di zaman madya tidak terlepas dari pengaruh unsur sastra sebelumnya. Dengan demikian terjadilah akulturasi antara sastra Islam dengan sastra yang berkembang di zaman praIslam. Seni sastra di zaman Islam terutama berkembang di Melayu dan Jawa. Dilihat dan corak dan isinya, ada beberapa jenis seni sastra seperti berikut.

- **1) Hikayat** adalah karya sastra yang berisi cerita sejarah ataupun dongeng. Dalam hikayat banyak ditulis berbagai peristiwa yang menarik, keajaiban, atau hal-hal yang tidak masuk akal. Hikayat ditulis dalam bentuk gancaran (karangan bebas atau prosa). Hikayat-hikayat yang terkenal, misalnya Hikayat Iskandar Zulkarnain, Hikayat Raja-Raja Pasai, Hikayat Khaidir, Hikayat si Miskin, Hikayat 1001 Malam, Hikayat Bayan Budiman, dan Hikayat Amir Hamzah.

- **2) Babad** mirip dengan hikayat. Penulisan babad seperti tulisan sejarah, tetapi isinya tidak selalu berdasarkan fakta.Jadi, isinya _carapuran_ antara fakta sejarah, mitos, dan kepercayaan.Di tanah Melayu terkenal dengan sebutan _tambo_ atau _salasilah_ . Contoh babad adalah Babad Tanah Jawi, Babad Cirebon, Babad Mataram, dan Babad Surakarta.

- **3) Syair** berasal dari perkataan Arab untuk menamakan karya sastra berupa sajak-sajak yang terdiri atas empat baris setiap baitnya. Contoh syair sangat tua adalah syair yang tertulis pada batu nisan makam putri Pasai di Minye Tujoh.

- **4) Suluk** merupakan karya sastra yang berupa kitab-kitab dan isinya menjelaskan soal-soal tasawufnya. Contoh suluk yaitu Suluk Sukarsa, Suluk Wujil, dan Suluk Malang Sumirang.

### 4. Kesenian

Di Indonesia, Islam menghasilkan kesenian bernapas Islam yang bertujuan untuk menyebarkan ajaran Islam. Kesenian tersebut, misalnya sebagai berikut.

- **1) Permainan debus** , yaitu tarian yang pada puncak acara para penari menusukkan benda tajam ke tubuhnya tanpa meninggalkan luka. Tarian ini diawali dengan pembacaan ayat-ayat dalam Al Quran dan salawat nabi. Tarian ini terdapat di Banten dan Minangkabau.

- **2) Seudati** , sebuah bentuk tarian dari Aceh. Seudati berasal dan kata _syaidati_ yang artinya permainan orang-orang besar. Seudati sering disebut saman artinya delapan. Tarian ini aslinya dimainkan oleh delapan orang penari. Para pemain menyanyikan lagu yang isinya antara lain salawat nabi.

![](sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0202-08.png)

Gambar 3.31 Naskah Hikayat Amir Hamzah

Sumber: Bambang Budi Utomo. 2011. _Atlas Sejarah Indonesia Masa Islam_ . Jakarta: Kementerian Kebudayaan dan Pariwisata.

**3) Wayang** , termasuk wayang kulit, Pertunjukan wayang sudah berkembang sejak zaman Hindu, akan tetapi, pada zaman Islam terus dikembangkan. Kemudian berdasarkan cerita Amir Hamzah dikembangkan pertunjukan wayang golek.

### 5. Kalender

Menjelang tahun ketiga pemerintahan Khalifah Umar bin Khattab, beliau berusaha membenahi kalender Islam. Perhitungan tahun yang dipakai atas dasar peredaran bulan (komariyah). Umar menetapkan tahun 1 H bertepatan dengan tanggal 14 September 622 M, sehingga sekarang kita mengenal tahun Hijriyah.

Sistem kalender itu juga berpengaruh di Nusantara. Bukti perkembangan sistem penanggalan (kalender) yang paling nyata adalah sistem kalender yang diciptakan oleh Sultan Agung. Ia melakukan sedikit perubahan, mengenai nama-nama bulan pada tahun Saka. Misalnya bulan Muharam diganti dengan _Sura_ dan Ramadan diganti dengan _Pasa_ . Kalender tersebut dimulai tanggal 1 Muharam tahun 1043 H. Kalender Sultan Agung dimulai tepat dengan tanggal 1 Sura tahun 1555 Jawa (8 Agustus 1633).

Masih terdapat beberapa bentuk lain dan akulturasi antara kebudayaan pra-Islam dengan kebudayaan Islam. Misalnya upacara kelahiran perkawinan dan kematian. Masyarakat Jawa juga mengenal berbagai kegiatan selamatan dengan bentuk kenduri. Selamatan diadakan pada waktu tertentu. Misalnya, selamatan atau kenduri pada 10 Muharam untuk memperingati Hasan-Husen (putra Ali bin Abu Thalib), Maulid Nabi (untuk memperingati kelahiran Nabi Muhammad), Ruwahan ( _Nyadran_ ) untuk menghormati para leluhur atau sanak keluarga yang sudah meninggal.

### Uji Kompetensi

1.  Jelaskan bagaimana wayang dapat digunakan dalam proses Islamisasi di Pulau Jawa.

2.  Diskusikan bagaimana proses akulturasi antara budaya lama dengan budaya Islam dapat berlangsung secara damai dan saling melengkapi. Uraikan jawaban kamu dan presentasikan

## G. Islam dan Proses Integrasi

### Mengamati Lingkungan

Integrasi suatu bangsa adalah hal yang sangat penting dalam kehidupan berbangsa dan bernegara. Dengan adanya integrasi akan melahirkan satu kekuatan bangsa yang ampuh dan segala persoalan yang timbul dapat dihadapi bersama-sama. Negara Kesatuan Republik Indonesia adalah wujud konkret dari proses integrasi bangsa. Proses integrasi bangsa Indonesia ini ternyata sudah berlangsung cukup lama bahkan sudah dimulai sejak awal tarikh masehi. Pada abad ke-16 proses integrasi bangsa Indonesia mulai menonjol. Masa itu adalah masa-masa pertumbuhan dan perkembangan kerajaan-kerajaan Islam di Indonesia.

### Memahami Teks

### 1. Peranan Para Ulama dalam Proses Integrasi

Agama Islam yang masuk dan berkembang di Nusantara mengajarkan kebersamaan dan mengembangkan toleransi dalam kehidupan beragama. Islam mengajarkan persamaan dan tidak mengenal kasta-kasta dalam kehidupan masyarakat. Konsep ajaran Islam memunculkan perilaku ke arah persatuan dan persamaan derajat. Disisi lain, datangnya pedagang-pedagang Islam di Indonesia mendorong berkembangnya tempat-tempat perdagangan di daerah pantai. Tempat-tempat perdagangan itu kemudian berkembang menjadi pelabuhan dan kota-kota pantai. Bahkan kota-kota pantai yang merupakan bandar dan pusat perdagangan, berkembang menjadi kerajaan. Timbulnya kerajaan-kerajaan Islam menandai awal terjadinya proses integrasi. Meskipun masing-masing kerajaan memiliki cara dan faktor pendukung yang berbeda-beda dalam proses integrasinya.

### 2. Peran Perdagangan Antarpulau

Proses integrasi juga terlihat melalui kegiatan pelayaran dan perdagangan antarpulau. Sejak zaman kuno, kegiatan pelayaran dan perdagangan sudah berlangsung di Kepulauan Indonesia. Pelayaran dan perdagangan itu berlangsung dari daerah yang satu ke daerah yang lain, bahkan antara negara yang satu dengan negara yang lain. Kegiatan pelayaran dan perdagangan pada umumnya berlangsung dalam waktu yang lama. Hal ini, menimbulkan pergaulan dan hubungan kebudayaan antara para pedagang dengan penduduk setempat. Kegiatan semacam ini mendorong terjadinya proses integrasi.

Pada mulanya penduduk di suatu pulau cukup memenuhi kebutuhan hidupnya dengan apa yang ada di pulau tersebut. Dalam perkembangannya, mereka ingin mendapatkan barang-barang yang terdapat di pulau lain. Untuk memenuhi kebutuhan tersebut, terjadilah hubungan dagang antar pulau. Angkutan yang paling murah dan mudah adalah angkutan laut (kapal/perahu), maka berkembanglah pelayaran dan perdagangan. Terjadinya pelayaran dan perdagangan antarpulau di Indonesia yang diikuti pengaruh di bidang budaya turut berperan serta mempercepat perkembangan proses integrasi. Misalnya, para pedagang dari Jawa berdagang ke Palembang, atau para pedagang dari Sumatra berdagang ke Jepara. Hal ini menyebabkan terjadinya proses integrasi antara Sumatra dan Jawa. Para pedagang di Banjarmasin berdagang ke Makassar, atau sebaliknya. Hal ini menyebabkan terjadi proses integrasi antara masyarakat Banjarmasin (Kalimantan) dengan masyarakat Makassar (Sulawesi). Para pedagang Makassar dan Bugis memiliki peranan penting dalam proses integrasi. Mereka berlayar hampir ke seluruh Kepulauan Indonesia bahkan jauh sampai keluar Kepulauan Indonesia.

Pulau-pulau penting di Indonesia, pada umumnya memiliki pusat-pusat perdagangan. Sebagai contoh di Sumatra terdapat Aceh, Pasai, Barus, dan Palembang. Jawa memiliki beberapa pusat

perdagangan misalnya Banten Sunda Kelapa, Jepara, Tuban, Gresik, Surabaya, dan Blambangan. Kemudian di dekat Sumatra ada bandar Malaka. Malaka berkembang sebagai bandar terbesar di Asia Tenggara. Tahun 1511 Malaka jatuh ke tangan Portugis. Akibatnya perdagangan Nusantara berpindah ke Aceh. Dalam waktu singkat Aceh berkembang sebagai bandar dan sebuah kerajaan yang besar. Para pedagang dari pulau-pulau lain di Indonesia juga datang dan berdagang di Aceh.

Sementara itu, sejak awal abad ke-16 di Jawa berkembang Kerajaan Demak dan beberapa bandar sebagai pusat perdagangan. Di Indonesia bagian tengah maupun timur juga berkembang kerajaan dan pusat-pusat perdagangan. Dengan demikian, terjadi hubungan dagang antardaerah dan antarpulau.

Untuk lebih mendalami, silakan membaca buku **Sartono Kartodirdjo.** **_Pengantar Sejarah Indonesia Baru 1500-1900 dari Emporium sampai Empirium._**

Kegiatan perdagangan antarpulau mendorong terjadinya proses integrasi yang terhubung melalui para pedagang. Proses integrasi itu juga diperkuat dengan berkembangnya hubungan kebudayaan. Bahkan juga ada yang diikuti dengan perkawinan.

### 3. Peran Bahasa

Perlu juga kamu pahami bahwa bahasa juga memiliki peran yang strategis dalam proses integrasi. Kamu tahu bahwa Kepulauan Indonesia terdiri atas beribu-ribu pulau yang dihuni oleh aneka ragam suku bangsa. Tiap-tiap suku bangsa memiliki bahasa masingmasing. Untuk mempermudah komunikasi antarsuku bangsa, diperlukan satu bahasa yang menjadi bahasa perantara dan dapat dimengerti oleh semua suku bangsa. Jika tidak memiliki kesamaan bahasa, persatuan tidak terjadi karena di antara suku bangsa timbul kecurigaan dan prasangka lain.

Bahasa merupakan sarana pergaulan. Bahasa Melayu digunakan hampir di semua pelabuhan-pelabuhan di Kepulauan

Nusantara. Bahasa Melayu sejak zaman kuno sudah menjadi bahasa resmi negara Melayu (Jambi). Pada masa kejayaan Kerajaan Sriwijaya, bahasa Melayu dijadikan bahasa resmi dan bahasa ilmu pengetahuan. Hal ini dapat dilihat dalam Prasasti Kedukan Bukit tahun 683 M, Prasasti Talang Tuo tahun 684 M, Prasasti Kota Kapur tahun 685 M, dan Prasasti Karang Berahi tahun 686 M.

Para pedagang di daerah-daerah sebelah timur Nusantara, juga menggunakan bahasa Melayu sebagai bahasa pengantar. Dengan demikian, berkembanglah bahasa Melayu ke seluruh Kepulauan Nusantara. Pada mulanya bahasa Melayu digunakan sebagai bahasa dagang. Akan tetapi lambat laun bahasa Melayu tumbuh menjadi bahasa perantara dan menjadi _lingua franca_ di seluruh Kepulauan Nusantara. Di Semenanjung Malaka (Malaysia seberang), pantai timur Pulau Sumatra, pantai barat Pulau Sumatra, Kepulauan Riau, dan pantai-pantai Kalimantan, penduduk menggunakan bahasa Melayu sebagai bahasa pergaulan.

Masuk dan berkembangnya agama Islam, mendorong perkembangan bahasa Melayu. Buku-buku agama dan tafsir al Qur’an juga mempergunakan bahasa Melayu. Ketika menguasai Malaka, Portugis mendirikan sekolah-sekolah dengan menggunakan bahasa Portugis, namun kurang berhasil. Pada tahun 1641 VOC merebut Malaka dan kemudian mendirikan sekolah-sekolah dengan menggunakan bahasa Melayu. Jadi, secara tidak sengaja, kedatangan VOC mengembangkan bahasa Melayu.

### Uji Kompetensi

1. Diskusikan mengapa bahasa Melayu cepat berkembang di Nusantara?

2. Bagaimana Islam dapat mempercepat proses integrasi bangsa Indonesia? Uraikan jawaban kamu dalam 2 - 3 lembar!

## H. Kesimpulan

Perkembangan Islam di Nusantara tidak pernah terlepas dari dinamika Islam di kawasan-kawasan lain. Karena itu, adalah keliru pandangan yang menganggap seolah-olah Islam Nusantara berkembang secara tersendiri serta terisolasi dari perkembangan dan dinamika Islam di tempat-tempat lain. Peradaban Islam Nusantara juga menampilkan ciri-ciri dan karakter yang khas, relatif berbeda dengan peradaban Islam di wilayah-wilayah perabadan Muslim lainnya, misalnya Arab, Turki, Persia, Afrika Hitam, dan Dunia Barat.

Islam yang datang pertama kali adalah Islam yang umumnya dibawa para guru pengembara Sufi, yang mengembara dari satu tempat ke tempat lain untuk menyebarkan Islam. Islam sufistik yang dibawa para guru pengembara ini jelas memiliki kecenderungan kuat untuk lebih menerima terhadap tradisi dan praktik keagamaan lokal. Bagi guru-guru Sufi pengembara ini, yang paling penting adalah pengucapan dua kalimah syahadat, setelah itu barulah memperkenalkan ketentuan-ketentuan hukum Islam.

Masyarakat Nusantara pada umumnya adalah masyarakat pesisir yang kehidupan mereka tergantung pada perdagangan antarpulau dan antarbenua. Sedangkan mereka yang berada di pedalaman adalah masyarakat agraris, yang kehidupan mereka tergantung kepada pertanian. Karena itu, seperti masyarakat agraris umumnya, masyarakat agraris Nusantara juga banyak dipengaruhi oleh pandangan dunia mistis. Sosiologi masyarakat terakhir ini sedikit banyak mempengaruhi pandangan dunia Islam di kalangan masyarakat Muslim Nusantara.

Dalam bidang kebudayaan, umat Islam mempunyai ciri yang khusus pula dari budaya material ( _material culture_ ) dalam kehidupan sehari-hari, sampai kepada budaya spiritual ( _spiritual culture_ ). Bahkan sampai sekarang kita masih bisa menyaksikan berbagai kesinambungan tertentu antara tradisi Islam dengan tradisi budaya

spiritual pra-Islam yang sedikit banyak diwarnai tradisi Hindu, Buddha, dan bahkan tradisi keagamaan spritual lokal.

Salah satu faktor pemersatu terpenting di antara berbagai suku bangsa Nusantara adalah Islam. Islam mengatasi perbedaanperbedaan yang terdapat di antara berbagai suku bangsa dan menjadi identitas yang mengatasi batas-batas geografis, sentimen etnis, identitas kesukuan, adat istiadat dan tradisi lokal lainnya. Tentu saja, sejauh menyangkut pemahaman dan pengamalan Islam, terdapat pula perbedaan-perbedaan tertentu terhadap doktrin dan ajaran Islam sesuai rumusan para ulama, bukan dengan identitas suku bangsa.

Kenyataan bahwa Islam merupakan faktor pemersatu mendorong kemunculan faktor pemersatu kedua, yaitu bahasa Melayu. Bahasa ini sebelum kedatangan Islam digunakan hanya di lingkungan etnis terbatas, yakni suku bangsa Melayu di Palembang, Riau, Deli (Sumatra Timur), dan Semenanjung Malaya. Terdapat bahasabahasa lain yang digunakan lebih banyak orang suku bangsa lain di Nusantara, seperti bahasa Jawa dan bahasa Sunda. Bahasa Melayu yang lebih egaliter dibanding bahasa Jawa, diadopsi sebagai _lingua franca_ oleh para penyiar Islam, ulama, dan pedagang. Kedudukan bahasa Melayu sebagai _lingua franca_ Islam di Nusantara bertambah kuat ketika bahasa Melayu ditulis dengan aksara Arab. Bersamaan dengan adopsi huruf-huruf Arab, maka dilakukan pula pengenalan dan penyesuaian tanda-tanda pada aksara Arab tertentu untuk kepentingan bahasa-bahasa lokal di Nusantara. Kedudukan bahasa Melayu itu menjadi semakin lebih kuat lagi ketika para ulama menulis banyak karya mereka dengan bahasa Melayu berhuruf _Jawi_ tersebut, sehingga pada gilirannya, tulisan _Jawi_ menjadi alat komunikasi dan dakwah tertulis bagi masyarakat Melayu-Nusantara menggantikan beberapa bentuk tulisan yang berkembang sebelumnya.

Warisan terbaik dari sejarah zaman Islam lainnya ialah adanya pengintegrasian Nusantara lewat nasionalisme keagamaan dan jaringan perdagangan antarpulau.

$content$
  );

-- =============================================================
-- Update slug + image for each material
-- (values from app/(main)/materi/page.tsx)
-- =============================================================

update materials set slug = 'berpikir-komputasional', image = '/materi/1/berpikir-komputasional_files/thumbnail.jpg' where title = 'Berpikir Komputasional';
update materials set slug = 'msoffice', image = '/materi/1/msoffice_files/thumbnail.jpg' where title = 'Microsoft Office 365';
update materials set slug = 'algoritma', image = '/materi/1/algoritma_files/thumbnail.jpg' where title = 'Algoritma Pemrograman';
update materials set slug = 'gerbang-logika', image = '/materi/1/gerbang-logika_files/thumbnail.jpg' where title = 'Sistem Komputer';
update materials set slug = 'dampak-sosial', image = '/materi/1/dampak-sosial_files/thumbnail.jpg' where title = 'Dampak Sosial Informatika';
update materials set slug = 'analisi-data', image = '/materi/1/analisi-data_files/thumbnail.jpg' where title = 'Analisis Data';
update materials set slug = 'jaringan-komputer', image = '/materi/1/jaringan-komputer_files/thumbnail.jpg' where title = 'Jaringan Komputer dan Internet';
update materials set slug = 'praktik-lintas', image = '/materi/1/praktik-lintas_files/thumbnail.jpg' where title = 'Praktik Lintas Bidang';
update materials set slug = 'literasi-digital', image = '/materi/1/literasi-digital_files/thumbnail.jpg' where title = 'Literasi Digital';
update materials set slug = 'sejarah-x-1', image = '/materi/1/sejarah-x-1_assets/Gambar_1.2.png' where title = 'Sejarah Indonesia X Bab 1';
update materials set slug = 'sejarah-x-2', image = '/materi/1/sejarah-x-2_assets/10_SEJARAH_BUKU_SISWA.pdf-0103-02.png' where title = 'Sejarah Indonesia X Bab 2';
update materials set slug = 'sejarah-x-3', image = '/materi/1/sejarah-x-3_assets/10_SEJARAH_BUKU_SISWA.pdf-0146-06.png' where title = 'Sejarah Indonesia X Bab 3';

-- =============================================================
-- MIGRATION: convert grade enum (X/XI/XII) -> int (1/2/3)
-- Run this only if the table already exists with data.
-- =============================================================

-- 1. Add a temporary int column
alter table materials add column if not exists grade_int int;

-- 2. Convert existing enum values to the int counterpart
update materials set grade_int = case grade::text when 'X' then 1 when 'XI' then 2 when 'XII' then 3 else null end;

-- 3. Swap columns
alter table materials drop column grade;
alter table materials rename column grade_int to grade;

-- 4. Add the constraint
alter table materials add constraint materials_grade_check check (grade in (1, 2, 3));
