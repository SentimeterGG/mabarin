# Algoritma Pemrograman

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
