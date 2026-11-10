# Menyumbang kepada AZD Untuk Pemula

Terima kasih atas minat anda untuk menyumbang kepada kursus AZD Untuk Pemula! Dokumen ini menyediakan panduan dan maklumat untuk penyumbang.

## Cara Menyumbang

### Melaporkan Isu

Jika anda menemui pepijat, kesilapan, atau mempunyai cadangan untuk penambahbaikan:

1. **Periksa Isu Sedia Ada**: Cari [isu sedia ada](https://github.com/microsoft/azd-for-beginners/issues) untuk mengelakkan penduaan
2. **Cipta Isu Baru**: Gunakan templat isu yang sesuai
3. **Berikan Butiran**: Sertakan langkah untuk mengulangi, tingkah laku yang dijangka, dan tangkapan skrin jika berkenaan

### Mencadangkan Perubahan

1. **Fork Repositori**: Buat fork projek anda sendiri
2. **Cipta Cawangan**: Buat cawangan fitur untuk perubahan anda
3. **Buat Perubahan**: Ikuti piawaian pengkodan dan dokumentasi kami
4. **Uji Perubahan Anda**: Sahkan semua pautan berfungsi dan kandungan dipaparkan dengan betul
5. **Hantar Pull Request**: Berikan penerangan jelas tentang perubahan anda

### Jenis-jenis Sumbangan

Kami mengalu-alukan jenis sumbangan berikut:

#### Penambahbaikan Kandungan
- Betulkan kesilapan taip, tatabahasa, dan isu format
- Tingkatkan kejelasan dokumentasi sedia ada
- Kemas kini maklumat yang sudah lapuk
- Tambah penjelasan atau konteks yang hilang

#### Contoh Baru
- Tambah senario penyebaran dunia sebenar
- Cipta templat AZD baru untuk kes penggunaan biasa
- Sediakan contoh kod tambahan dan latihan

#### Sokongan Terjemahan
- Bantu mengekalkan terjemahan sedia ada
- Tingkatkan kualiti terjemahan
- Tambah terjemahan untuk kandungan baru

#### Laporan Pepijat
- Laporkan pautan yang rosak atau contoh kod yang salah
- Kenal pasti ketidakkonsistenan dokumentasi
- Tandakan isu kebolehaksesan

## Garis Panduan Penyumbang

### Piawaian Dokumentasi

- Gunakan bahasa yang jelas dan mesra pemula
- Sertakan objektif dan hasil pembelajaran
- Sediakan arahan langkah demi langkah dengan hasil yang dijangka
- Tambah pautan navigasi ke kandungan berkaitan
- Gunakan format dan gaya markdown yang konsisten

### Contoh Kod

- Pastikan semua contoh kod diuji dan berfungsi
- Sertakan ulasan menerangkan konsep utama
- Ikuti amalan terbaik Azure dan AZD
- Berikan hasil yang dijangka jika berkenaan

### Sahkan Dokumentasi Bahasa Inggeris

Dari akar repositori, pasang keperluan pembangunan sedia ada dan jalankan:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

Pemeriksa pautan luar talian memeriksa laluan Markdown/HTML bahasa Inggeris, tajuk, sauh eksplisit, dan tempat letak pautan kosong. Ia mengecualikan `translations/` dan `translated_images/` yang dijana, termasuk pautan ke direktori tersebut. Ia tidak mengambil laman web luaran atau mengesahkan penyebaran Azure. Gunakan `--json <report-path>` untuk mengeksport kegagalan dan inventori URL luaran untuk pemeriksaan rangkaian berasingan. Sahkan arahan hulu semasa dan prasyarat sampel apabila menukar arahan teknikal; bezakan aplikasi yang diuji dari pelan reka bentuk.

### Mesej Commit

Gunakan mesej commit yang jelas dan deskriptif:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Kod Etika

Sila baca dan ikuti [Kod Etika](CODE_OF_CONDUCT.md) kami untuk mengekalkan komuniti yang mesra dan inklusif.

## Mendapatkan Bantuan

- **Soalan**: Cari atau buka [isu GitHub](https://github.com/microsoft/AZD-for-beginners/issues)
- **Komuniti**: Sertai [Discord Azure](https://discord.gg/microsoft-azure)
- **Dokumentasi**: Semak [dokumen Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Lesen

Dengan menyumbang kepada repositori ini, anda bersetuju bahawa sumbangan anda akan dilesenkan di bawah [Lesen MIT](../../LICENSE).

---

Terima kasih kerana membantu menjadikan AZD Untuk Pemula sumber pembelajaran yang lebih baik untuk komuniti!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->