# Materi Presentasi: Aplikasi Menu Makanan Rasa Nusantara

**Perkiraan durasi:** 7–10 menit  
**Audiens:** dosen dan mahasiswa  
**Catatan:** bagian “Narasi” dapat dibacakan atau disampaikan dengan bahasa sendiri.

---

## Slide 1 — Judul

### Rasa Nusantara
**Aplikasi Katalog Menu Makanan Berbasis Flutter**

- Nama penyaji: …
- NIM: …
- Mata kuliah: …
- Dosen pengampu: …

**Narasi:**  
“Selamat pagi/siang. Pada kesempatan ini saya akan mempresentasikan Rasa Nusantara, sebuah aplikasi katalog menu makanan yang dibuat menggunakan Flutter. Aplikasi ini membantu pengguna melihat pilihan makanan, mencari menu, menyimpan menu favorit, dan mengelola keranjang pesanan.”

---

## Slide 2 — Latar Belakang

- Pengguna sering membutuhkan cara yang praktis untuk melihat pilihan makanan.
- Daftar menu yang hanya berupa teks dapat menyulitkan pengguna membayangkan makanan.
- Aplikasi perlu menyajikan gambar, nama, harga, dan informasi menu dalam tampilan yang mudah dijelajahi.

**Narasi:**  
“Latar belakang aplikasi ini adalah kebutuhan untuk melihat menu dengan cara yang lebih menarik dan praktis. Dengan gambar dan informasi singkat, pengguna dapat membandingkan pilihan menu tanpa harus membaca daftar panjang.”

---

## Slide 3 — Tujuan dan Sasaran Pengguna

### Tujuan
- Menampilkan menu makanan dalam bentuk visual dan teratur.
- Memudahkan pengguna menemukan makanan melalui pencarian dan kategori.
- Memberikan contoh alur dasar aplikasi pemesanan makanan.

### Sasaran pengguna
- Orang yang ingin melihat pilihan makanan secara cepat.
- Mahasiswa yang mempelajari dasar pembuatan antarmuka aplikasi Flutter.

**Narasi:**  
“Tujuan utamanya adalah membuat katalog makanan yang mudah digunakan sekaligus menjadi contoh penerapan komponen Flutter, seperti grid, gambar, pencarian, dan navigasi.”

---

## Slide 4 — Fitur Aplikasi

1. **Beranda:** menampilkan sapaan, promosi, kategori, dan menu.
2. **Grid menu:** setiap kartu berisi gambar, nama, kategori, rating, dan harga.
3. **Pencarian:** mencari menu berdasarkan nama atau kategori.
4. **Filter kategori:** memilih Semua, Nusantara, Seafood, Minuman, atau Camilan.
5. **Favorit:** menandai dan melihat menu yang disukai.
6. **Keranjang:** menambah atau mengurangi jumlah menu serta melihat total harga.
7. **Detail menu:** menampilkan gambar, deskripsi, rating, dan tombol tambah ke keranjang.
8. **Profil:** menampilkan pilihan menu profil sederhana.

**Narasi:**  
“Fitur-fitur aplikasi dibagi ke dalam empat bagian utama yang bisa dipilih melalui navigasi bawah. Di beranda, pengguna dapat mencari dan memfilter menu. Pengguna juga bisa membuka detail, memberi tanda favorit, dan memasukkan makanan ke keranjang.”

---

## Slide 5 — Alur Penggunaan

1. Pengguna membuka **Beranda**.
2. Pengguna mencari menu atau memilih kategori.
3. Pengguna memilih salah satu kartu untuk melihat detail.
4. Pengguna menekan ikon hati untuk menyimpan menu sebagai favorit.
5. Pengguna menambahkan menu ke keranjang.
6. Pengguna membuka **Keranjang** untuk mengubah jumlah dan memeriksa total.
7. Pengguna dapat berpindah ke **Favorit** atau **Profil** melalui navigasi bawah.

**Narasi:**  
“Sebagai contoh, pengguna memilih kategori Nusantara, membuka detail Nasi Goreng Spesial, lalu menambahkannya ke keranjang. Jumlah dan total harga akan diperbarui pada halaman keranjang.”

---

## Slide 6 — Tampilan dan Komponen Flutter

- **`MaterialApp`** menjadi wadah utama aplikasi dan mengatur tema.
- **`Scaffold`** menyediakan struktur halaman dan navigasi bawah.
- **`NavigationBar`** digunakan untuk berpindah antarbagian aplikasi.
- **`CustomScrollView` dan `SliverGrid`** menyusun konten beranda dan kartu menu secara bergulir.
- **`TextField` dan `ChoiceChip`** digunakan untuk pencarian dan filter kategori.
- **`Image.network`** menampilkan gambar menu dari internet; jika gagal dimuat, aplikasi menampilkan ikon pengganti.
- **`showModalBottomSheet`** menampilkan detail makanan.

**Narasi:**  
“Antarmuka dibuat dari widget Flutter. Grid digunakan agar kartu menu tertata dalam beberapa kolom dan tetap dapat digulir. Untuk layar dengan lebar berbeda, jumlah kolom menyesuaikan ruang yang tersedia.”

---

## Slide 7 — Pengelolaan Data dan Teknologi

- **Framework:** Flutter.
- **Bahasa pemrograman:** Dart.
- **Tampilan:** Material 3 dengan warna utama oranye.
- **Data menu:** contoh data disimpan langsung dalam kode aplikasi.
- **Status favorit dan keranjang:** dikelola selama aplikasi berjalan.
- **Gambar:** diambil dari URL internet.

**Narasi:**  
“Saat ini aplikasi berfokus pada antarmuka dan interaksi dasar. Data makanan masih berupa data contoh yang ditulis di dalam kode. Favorit dan keranjang disimpan sementara selama aplikasi berjalan, belum menggunakan database atau akun pengguna.”

---

## Slide 8 — Demonstrasi Aplikasi

### Urutan demo yang disarankan
1. Tunjukkan beranda, banner promo, dan grid menu.
2. Cari menu menggunakan kolom pencarian.
3. Pilih kategori **Minuman** atau **Seafood**.
4. Buka detail salah satu makanan.
5. Tandai menu sebagai favorit, lalu buka halaman Favorit.
6. Tambahkan menu ke keranjang dan ubah jumlahnya.
7. Tunjukkan perubahan total harga.
8. Tunjukkan halaman Profil dan navigasi bawah.

**Narasi:**  
“Pada demonstrasi ini saya akan menunjukkan alur utama aplikasi dari menemukan menu sampai memeriksa keranjang. Ini membantu melihat bahwa elemen tampilan juga memiliki interaksi, bukan hanya desain statis.”

---

## Slide 9 — Batasan dan Pengembangan Berikutnya

### Batasan saat ini
- Data menu masih contoh dan belum berasal dari server.
- Favorit serta keranjang belum tersimpan setelah aplikasi ditutup.
- Tombol pemesanan hanya memberi konfirmasi; belum memproses pembayaran atau pesanan sungguhan.
- Beberapa gambar memerlukan koneksi internet.
- Bagian profil masih berupa tampilan contoh.

### Pengembangan berikutnya
- Menambahkan backend dan database untuk menu serta akun.
- Menyimpan favorit dan keranjang secara permanen.
- Mengembangkan proses checkout dan integrasi pembayaran.
- Menambahkan pengelolaan alamat dan riwayat pesanan.
- Menyiapkan aset gambar lokal agar gambar utama dapat ditampilkan tanpa internet.

**Narasi:**  
“Aplikasi ini adalah prototipe katalog dan alur belanja dasar, belum merupakan layanan pemesanan sungguhan. Pengembangan berikutnya dapat berfokus pada penyimpanan data, akun pengguna, dan proses checkout.”

---

## Slide 10 — Kesimpulan

- Rasa Nusantara merupakan aplikasi katalog makanan berbasis Flutter.
- Aplikasi menerapkan grid menu bergambar, pencarian, kategori, detail, favorit, keranjang, dan navigasi bawah.
- Proyek ini menunjukkan bagaimana beberapa widget Flutter dapat digabungkan menjadi alur aplikasi yang mudah dipahami.
- Aplikasi dapat dikembangkan lebih lanjut dengan backend, database, dan layanan pemesanan.

**Narasi:**  
“Kesimpulannya, Rasa Nusantara sudah menyediakan pengalaman dasar untuk menjelajahi menu dan menyusun keranjang. Walaupun masih berupa prototipe, aplikasi ini dapat menjadi fondasi untuk pengembangan aplikasi pemesanan yang lebih lengkap. Terima kasih.”

---

## Pertanyaan yang Mungkin Ditanyakan

### 1. Mengapa menggunakan Flutter?
Flutter memungkinkan antarmuka dibuat dengan widget dan dapat dikembangkan untuk beberapa platform dari satu basis kode.

### 2. Apa fungsi GridView atau grid pada aplikasi?
Grid menyusun kartu makanan dalam beberapa kolom sehingga pengguna dapat melihat beberapa pilihan sekaligus. Pada aplikasi ini grid dibuat dengan `SliverGrid` di dalam `CustomScrollView`.

### 3. Apakah menu dan keranjang sudah tersimpan ke database?
Belum. Menu adalah data contoh di dalam kode, sementara favorit dan keranjang disimpan sementara selama aplikasi berjalan.

### 4. Apa yang terjadi jika gambar tidak dapat dimuat?
Aplikasi menampilkan ikon pengganti sehingga ruang gambar tetap terlihat dan kartu menu tetap dapat digunakan.

### 5. Apakah aplikasi sudah dapat menerima pesanan sungguhan?
Belum. Tombol pesan saat ini hanya menampilkan konfirmasi sederhana. Dibutuhkan backend, sistem pesanan, dan integrasi pembayaran untuk menerima pesanan sungguhan.

### 6. Bagaimana cara menguji aplikasi?
Proyek dapat diperiksa dengan `flutter analyze`, diuji dengan `flutter test`, dan dibangun untuk web dengan `flutter build web`.

---

## Istilah Teknis Singkat

| Istilah | Arti sederhana |
|---|---|
| Widget | Komponen penyusun tampilan Flutter, seperti teks, tombol, dan gambar. |
| Grid | Susunan item dalam beberapa kolom dan baris. |
| State | Data yang dapat berubah saat pengguna berinteraksi, misalnya jumlah keranjang. |
| `setState` | Cara memberi tahu Flutter bahwa data tampilan berubah dan perlu diperbarui. |
| Backend | Bagian sistem di server yang mengelola data dan proses aplikasi. |
| Database | Tempat menyimpan data agar dapat digunakan kembali. |
