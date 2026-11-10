# Berkontribusi pada AZD Untuk Pemula

Terima kasih atas minat Anda untuk berkontribusi pada kursus AZD Untuk Pemula! Dokumen ini memberikan panduan dan informasi untuk para kontributor.

## Cara Berkontribusi

### Melaporkan Masalah

Jika Anda menemukan bug, kesalahan, atau memiliki saran untuk perbaikan:

1. **Periksa Masalah yang Ada**: Cari [masalah yang sudah ada](https://github.com/microsoft/azd-for-beginners/issues) untuk menghindari duplikasi
2. **Buat Masalah Baru**: Gunakan template masalah yang sesuai
3. **Berikan Detail**: Sertakan langkah-langkah reproduksi, perilaku yang diharapkan, dan tangkapan layar jika memungkinkan

### Mengusulkan Perubahan

1. **Fork Repositori**: Buat fork Anda sendiri dari proyek ini
2. **Buat Cabang**: Buat cabang fitur untuk perubahan Anda
3. **Lakukan Perubahan**: Ikuti standar pengkodean dan dokumentasi kami
4. **Uji Perubahan Anda**: Pastikan semua tautan bekerja dan konten ditampilkan dengan benar
5. **Ajukan Pull Request**: Berikan deskripsi yang jelas tentang perubahan Anda

### Jenis Kontribusi

Kami menyambut jenis kontribusi berikut:

#### Perbaikan Konten
- Perbaiki kesalahan ketik, tata bahasa, dan masalah format
- Tingkatkan kejelasan dokumentasi yang ada
- Perbarui informasi yang sudah kadaluarsa
- Tambahkan penjelasan atau konteks yang hilang

#### Contoh Baru
- Tambahkan skenario penerapan dunia nyata
- Buat template AZD baru untuk kasus penggunaan umum
- Sediakan contoh kode dan latihan tambahan

#### Dukungan Terjemahan
- Bantu memelihara terjemahan yang ada
- Tingkatkan kualitas terjemahan
- Tambahkan terjemahan untuk konten baru

#### Laporan Bug
- Laporkan tautan yang rusak atau contoh kode yang salah
- Identifikasi inkonsistensi dalam dokumentasi
- Tandai masalah aksesibilitas

## Pedoman Kontribusi

### Standar Dokumentasi

- Gunakan bahasa yang jelas dan ramah pemula
- Sertakan tujuan belajar dan hasil yang diharapkan
- Berikan petunjuk langkah demi langkah dengan keluaran yang diharapkan
- Tambahkan tautan navigasi ke konten terkait
- Gunakan format dan gaya markdown yang konsisten

### Contoh Kode

- Pastikan semua contoh kode telah diuji dan berfungsi
- Sertakan komentar yang menjelaskan konsep utama
- Ikuti praktik terbaik Azure dan AZD
- Sediakan keluaran yang diharapkan bila memungkinkan

### Validasi Dokumentasi Bahasa Inggris

Dari akar repositori, instal persyaratan pengembangan yang ada dan jalankan:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

Pemeriksa tautan offline memeriksa jalur Markdown/HTML bahasa Inggris, judul, jangkar eksplisit, dan placeholder tautan kosong. Ia mengecualikan `translations/` dan `translated_images/` yang dihasilkan, termasuk tautan ke direktori tersebut. Ia tidak mengambil situs eksternal atau memvalidasi penerapan Azure. Gunakan `--json <report-path>` untuk mengekspor kegagalan dan inventaris URL eksternal untuk pemeriksaan jaringan terpisah. Verifikasi perintah hulu saat ini dan prasyarat sampel saat mengubah instruksi teknis; bedakan aplikasi yang telah diuji dari cetak biru desain.

### Pesan Commit

Gunakan pesan commit yang jelas dan deskriptif:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Kode Etik

Harap baca dan ikuti [Kode Etik](CODE_OF_CONDUCT.md) kami untuk menjaga komunitas yang ramah dan inklusif.

## Mendapatkan Bantuan

- **Pertanyaan**: Cari atau buka [masalah di GitHub](https://github.com/microsoft/AZD-for-beginners/issues)
- **Komunitas**: Bergabung dengan [Azure Discord](https://discord.gg/microsoft-azure)
- **Dokumentasi**: Tinjau [dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Lisensi

Dengan berkontribusi pada repositori ini, Anda setuju bahwa kontribusi Anda akan dilisensikan di bawah [Lisensi MIT](../../LICENSE).

---

Terima kasih telah membantu membuat AZD Untuk Pemula menjadi sumber belajar yang lebih baik untuk komunitas!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->