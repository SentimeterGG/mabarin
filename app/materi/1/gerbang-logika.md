# Sistem Komputer

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
