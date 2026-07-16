# Jaringan Komputer dan Internet

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
