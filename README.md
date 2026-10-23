# Al-Qur'an Explorer

Aplikasi mobile berbasis Flutter yang berfungsi untuk menjelajahi 114 surah Al-Qur'an dan membaca detail ayat. Aplikasi ini dibangun untuk memenuhi tugas Ujian Tengah Semester (UTS) mata kuliah Pemrograman Mobile.

## Deskripsi Singkat
Al-Qur'an Explorer mengambil data secara dinamis (real-time) dari API publik EQuran.id v2.0. Pengguna dapat melihat daftar seluruh surah, mencari surah berdasarkan nama atau nomor, serta membaca detail ayat yang dilengkapi dengan teks Arab, teks latin, dan terjemahan bahasa Indonesia.

## Fitur Utama
- **Daftar 114 Surah:** Menampilkan seluruh surah beserta informasi nomor, nama latin, arti, dan jumlah ayat.
- **Pencarian Surah:** Fitur pencarian *real-time* untuk memudahkan pengguna menemukan surah tertentu.
- **Detail Surah:** Menampilkan daftar ayat dengan format teks Arab (rata kanan), teks latin, dan terjemahan bahasa Indonesia.
- **Penanganan Asynchronous:** Menampilkan indikator *loading* saat mengambil data, serta pesan *error* dan tombol "Coba Lagi" jika koneksi internet terputus.

## Teknologi dan Package yang Digunakan
- **Framework:** Flutter (Dart)
- **HTTP Client:** [`http`](https://pub.dev/packages/http) (v1.2.0) - Digunakan untuk melakukan HTTP Request ke API.
- **API:** [EQuran.id API v2.0](https://equran.id/apidev/v2) - Penyedia data Al-Qur'an digital.
- **State Management:** Menggunakan `FutureBuilder` bawaan Flutter untuk menangani state pengambilan data (Loading, Success, Error).

## Langkah Menjalankan Aplikasi
Jika Anda ingin menjalankan aplikasi ini di komputer lokal Anda, ikuti langkah berikut:

1. Pastikan Flutter SDK sudah terinstal di komputer Anda.
2. Clone repositori ini:
   ```bash
   git clone https://github.com/didansehat/quran_explorer
3. Masuk ke direktori project:
    ```bash
    cd quran_explorer2
4. Unduh semua dependensi:
     ```bash
    flutter pub get

5. Jalankan aplikasi (pastikan emulator atau perangkat fisik sudah terhubung):
     ```bash
    flutter run
