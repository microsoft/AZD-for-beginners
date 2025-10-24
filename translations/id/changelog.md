<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T17:41:59+00:00",
  "source_file": "changelog.md",
  "language_code": "id"
}
-->
# Catatan Perubahan - AZD Untuk Pemula

## Pendahuluan

Catatan perubahan ini mendokumentasikan semua perubahan, pembaruan, dan peningkatan penting pada repositori AZD Untuk Pemula. Kami mengikuti prinsip versi semantik dan menjaga log ini untuk membantu pengguna memahami apa saja yang berubah di antara versi.

## Tujuan Pembelajaran

Dengan meninjau catatan perubahan ini, Anda akan:
- Tetap terinformasi tentang fitur baru dan penambahan konten
- Memahami peningkatan yang dilakukan pada dokumentasi yang sudah ada
- Melacak perbaikan bug dan koreksi untuk memastikan akurasi
- Mengikuti evolusi materi pembelajaran dari waktu ke waktu

## Hasil Pembelajaran

Setelah meninjau entri catatan perubahan, Anda akan dapat:
- Mengidentifikasi konten dan sumber daya baru yang tersedia untuk pembelajaran
- Memahami bagian mana yang telah diperbarui atau ditingkatkan
- Merencanakan jalur pembelajaran Anda berdasarkan materi terkini
- Memberikan umpan balik dan saran untuk peningkatan di masa depan

## Riwayat Versi

### [v3.4.0] - 2025-10-24

#### Peningkatan Pratinjau dan Validasi Infrastruktur
**Versi ini memperkenalkan dukungan komprehensif untuk fitur pratinjau baru Azure Developer CLI dan meningkatkan pengalaman pengguna workshop.**

#### Ditambahkan
- **🧪 Dokumentasi Fitur azd provision --preview**: Cakupan lengkap kemampuan pratinjau infrastruktur baru
  - Referensi perintah dan contoh penggunaan dalam cheat sheet
  - Integrasi mendetail dalam panduan penyediaan dengan kasus penggunaan dan manfaat
  - Integrasi pemeriksaan awal untuk validasi penyebaran yang lebih aman
  - Pembaruan panduan memulai dengan praktik penyebaran yang mengutamakan keamanan
- **🚧 Banner Status Workshop**: Banner HTML profesional yang menunjukkan status pengembangan workshop
  - Desain gradasi dengan indikator konstruksi untuk komunikasi yang jelas kepada pengguna
  - Stempel waktu terakhir diperbarui untuk transparansi
  - Desain responsif untuk semua jenis perangkat

#### Ditingkatkan
- **Keamanan Infrastruktur**: Fungsionalitas pratinjau terintegrasi di seluruh dokumentasi penyebaran
- **Validasi Pra-Penyebaran**: Skrip otomatis kini mencakup pengujian pratinjau infrastruktur
- **Alur Kerja Pengembang**: Urutan perintah diperbarui untuk menyertakan pratinjau sebagai praktik terbaik
- **Pengalaman Workshop**: Harapan yang jelas ditetapkan untuk pengguna tentang status pengembangan konten

#### Diubah
- **Praktik Terbaik Penyebaran**: Alur kerja yang mengutamakan pratinjau kini menjadi pendekatan yang direkomendasikan
- **Alur Dokumentasi**: Validasi infrastruktur dipindahkan lebih awal dalam proses pembelajaran
- **Presentasi Workshop**: Komunikasi status profesional dengan garis waktu pengembangan yang jelas

#### Ditingkatkan
- **Pendekatan Mengutamakan Keamanan**: Perubahan infrastruktur kini dapat divalidasi sebelum penyebaran
- **Kolaborasi Tim**: Hasil pratinjau dapat dibagikan untuk ditinjau dan disetujui
- **Kesadaran Biaya**: Pemahaman yang lebih baik tentang biaya sumber daya sebelum penyediaan
- **Mitigasi Risiko**: Mengurangi kegagalan penyebaran melalui validasi sebelumnya

#### Implementasi Teknis
- **Integrasi Multi-Dokumen**: Fitur pratinjau didokumentasikan di 4 file utama
- **Pola Perintah**: Sintaks dan contoh yang konsisten di seluruh dokumentasi
- **Integrasi Praktik Terbaik**: Pratinjau disertakan dalam alur kerja validasi dan skrip
- **Indikator Visual**: Penandaan fitur BARU yang jelas untuk kemudahan penemuan

#### Infrastruktur Workshop
- **Komunikasi Status**: Banner HTML profesional dengan gaya gradasi
- **Pengalaman Pengguna**: Status pengembangan yang jelas mencegah kebingungan
- **Presentasi Profesional**: Menjaga kredibilitas repositori sambil menetapkan ekspektasi
- **Transparansi Garis Waktu**: Stempel waktu terakhir diperbarui Oktober 2025 untuk akuntabilitas

### [v3.3.0] - 2025-09-24

#### Peningkatan Materi Workshop dan Pengalaman Pembelajaran Interaktif
**Versi ini memperkenalkan materi workshop yang komprehensif dengan panduan interaktif berbasis browser dan jalur pembelajaran yang terstruktur.**

#### Ditambahkan
- **🎥 Panduan Workshop Interaktif**: Pengalaman workshop berbasis browser dengan kemampuan pratinjau MkDocs
- **📝 Instruksi Workshop Terstruktur**: Jalur pembelajaran terpandu 7 langkah dari penemuan hingga kustomisasi
  - 0-Pendahuluan: Ikhtisar dan pengaturan workshop
  - 1-Pilih-Template-AI: Proses penemuan dan pemilihan template
  - 2-Validasi-Template-AI: Prosedur penyebaran dan validasi
  - 3-Menguraikan-Template-AI: Memahami arsitektur template
  - 4-Konfigurasi-Template-AI: Konfigurasi dan kustomisasi
  - 5-Kustomisasi-Template-AI: Modifikasi dan iterasi lanjutan
  - 6-Pembersihan-Infrastruktur: Manajemen pembersihan dan sumber daya
  - 7-Penutup: Ringkasan dan langkah berikutnya
- **🛠️ Alat Workshop**: Konfigurasi MkDocs dengan tema Material untuk pengalaman pembelajaran yang ditingkatkan
- **🎯 Jalur Pembelajaran Praktis**: Metodologi 3 langkah (Penemuan → Penyebaran → Kustomisasi)
- **📱 Integrasi GitHub Codespaces**: Pengaturan lingkungan pengembangan yang mulus

#### Ditingkatkan
- **Lab Workshop AI**: Diperluas dengan pengalaman pembelajaran terstruktur selama 2-3 jam
- **Dokumentasi Workshop**: Presentasi profesional dengan navigasi dan bantuan visual
- **Kemajuan Pembelajaran**: Panduan langkah demi langkah yang jelas dari pemilihan template hingga penyebaran produksi
- **Pengalaman Pengembang**: Alat terintegrasi untuk alur kerja pengembangan yang efisien

#### Ditingkatkan
- **Aksesibilitas**: Antarmuka berbasis browser dengan pencarian, fungsi salin, dan pengaturan tema
- **Pembelajaran Mandiri**: Struktur workshop yang fleksibel untuk kecepatan pembelajaran yang berbeda
- **Aplikasi Praktis**: Skenario penyebaran template AI dunia nyata
- **Integrasi Komunitas**: Integrasi Discord untuk dukungan workshop dan kolaborasi

#### Fitur Workshop
- **Pencarian Bawaan**: Penemuan kata kunci dan pelajaran dengan cepat
- **Blok Kode Salin**: Fungsi hover-to-copy untuk semua contoh kode
- **Pengaturan Tema**: Dukungan mode gelap/terang untuk preferensi yang berbeda
- **Aset Visual**: Tangkapan layar dan diagram untuk pemahaman yang lebih baik
- **Integrasi Bantuan**: Akses langsung ke Discord untuk dukungan komunitas

### [v3.2.0] - 2025-09-17

#### Restrukturisasi Navigasi Utama dan Sistem Pembelajaran Berbasis Bab
**Versi ini memperkenalkan struktur pembelajaran berbasis bab yang komprehensif dengan navigasi yang ditingkatkan di seluruh repositori.**

#### Ditambahkan
- **📚 Sistem Pembelajaran Berbasis Bab**: Merestrukturisasi seluruh kursus menjadi 8 bab pembelajaran progresif
  - Bab 1: Dasar & Memulai Cepat (⭐ - 30-45 menit)
  - Bab 2: Pengembangan Berbasis AI (⭐⭐ - 1-2 jam)
  - Bab 3: Konfigurasi & Autentikasi (⭐⭐ - 45-60 menit)
  - Bab 4: Infrastruktur sebagai Kode & Penyebaran (⭐⭐⭐ - 1-1,5 jam)
  - Bab 5: Solusi AI Multi-Agen (⭐⭐⭐⭐ - 2-3 jam)
  - Bab 6: Validasi Pra-Penyebaran & Perencanaan (⭐⭐ - 1 jam)
  - Bab 7: Pemecahan Masalah & Debugging (⭐⭐ - 1-1,5 jam)
  - Bab 8: Pola Produksi & Perusahaan (⭐⭐⭐⭐ - 2-3 jam)
- **📚 Sistem Navigasi Komprehensif**: Header dan footer navigasi yang konsisten di seluruh dokumentasi
- **🎯 Pelacakan Kemajuan**: Daftar periksa penyelesaian kursus dan sistem verifikasi pembelajaran
- **🗺️ Panduan Jalur Pembelajaran**: Titik masuk yang jelas untuk tingkat pengalaman dan tujuan yang berbeda
- **🔗 Navigasi Referensi Silang**: Bab terkait dan prasyarat yang terhubung dengan jelas

#### Ditingkatkan
- **Struktur README**: Diubah menjadi platform pembelajaran terstruktur dengan organisasi berbasis bab
- **Navigasi Dokumentasi**: Setiap halaman kini mencakup konteks bab dan panduan kemajuan
- **Organisasi Template**: Contoh dan template dipetakan ke bab pembelajaran yang sesuai
- **Integrasi Sumber Daya**: Cheat sheet, FAQ, dan panduan studi terhubung ke bab yang relevan
- **Integrasi Workshop**: Lab langsung dipetakan ke beberapa tujuan pembelajaran bab

#### Diubah
- **Kemajuan Pembelajaran**: Beralih dari dokumentasi linear ke pembelajaran berbasis bab yang fleksibel
- **Penempatan Konfigurasi**: Panduan konfigurasi diposisikan ulang sebagai Bab 3 untuk alur pembelajaran yang lebih baik
- **Integrasi Konten AI**: Integrasi yang lebih baik dari konten khusus AI di seluruh perjalanan pembelajaran
- **Konten Produksi**: Pola lanjutan dikonsolidasikan dalam Bab 8 untuk pelajar perusahaan

#### Ditingkatkan
- **Pengalaman Pengguna**: Navigasi breadcrumbs yang jelas dan indikator kemajuan bab
- **Aksesibilitas**: Pola navigasi yang konsisten untuk memudahkan penelusuran kursus
- **Presentasi Profesional**: Struktur kursus gaya universitas yang cocok untuk pelatihan akademik dan korporat
- **Efisiensi Pembelajaran**: Waktu yang lebih singkat untuk menemukan konten yang relevan melalui organisasi yang ditingkatkan

#### Implementasi Teknis
- **Header Navigasi**: Navigasi bab yang distandarisasi di lebih dari 40 file dokumentasi
- **Navigasi Footer**: Panduan kemajuan yang konsisten dan indikator penyelesaian bab
- **Referensi Silang**: Sistem penghubung internal yang komprehensif yang menghubungkan konsep terkait
- **Pemetaan Bab**: Template dan contoh yang jelas terkait dengan tujuan pembelajaran

#### Peningkatan Panduan Studi
- **📚 Tujuan Pembelajaran Komprehensif**: Panduan studi yang direstrukturisasi untuk selaras dengan sistem 8 bab
- **🎯 Penilaian Berbasis Bab**: Setiap bab mencakup tujuan pembelajaran spesifik dan latihan praktis
- **📋 Pelacakan Kemajuan**: Jadwal pembelajaran mingguan dengan hasil yang terukur dan daftar periksa penyelesaian
- **❓ Pertanyaan Penilaian**: Pertanyaan validasi pengetahuan untuk setiap bab dengan hasil profesional
- **🛠️ Latihan Praktis**: Aktivitas langsung dengan skenario penyebaran nyata dan pemecahan masalah
- **📊 Kemajuan Keterampilan**: Kemajuan yang jelas dari konsep dasar hingga pola perusahaan dengan fokus pengembangan karir
- **🎓 Kerangka Sertifikasi**: Hasil pengembangan profesional dan sistem pengakuan komunitas
- **⏱️ Manajemen Garis Waktu**: Rencana pembelajaran 10 minggu yang terstruktur dengan validasi tonggak

### [v3.1.0] - 2025-09-17

#### Peningkatan Solusi AI Multi-Agen
**Versi ini meningkatkan solusi ritel multi-agen dengan penamaan agen yang lebih baik dan dokumentasi yang ditingkatkan.**

#### Diubah
- **Terminologi Multi-Agen**: Mengganti "agen Cora" dengan "agen Pelanggan" di seluruh solusi multi-agen ritel untuk pemahaman yang lebih jelas
- **Arsitektur Agen**: Memperbarui semua dokumentasi, template ARM, dan contoh kode untuk menggunakan penamaan "agen Pelanggan" yang konsisten
- **Contoh Konfigurasi**: Memodernisasi pola konfigurasi agen dengan konvensi penamaan yang diperbarui
- **Konsistensi Dokumentasi**: Memastikan semua referensi menggunakan nama agen yang profesional dan deskriptif

#### Ditingkatkan
- **Paket Template ARM**: Memperbarui template ARM multiagen-ritel dengan referensi agen Pelanggan
- **Diagram Arsitektur**: Memperbarui diagram Mermaid dengan penamaan agen yang diperbarui
- **Contoh Kode**: Kelas Python dan contoh implementasi kini menggunakan penamaan CustomerAgent
- **Variabel Lingkungan**: Memperbarui semua skrip penyebaran untuk menggunakan konvensi CUSTOMER_AGENT_NAME

#### Ditingkatkan
- **Pengalaman Pengembang**: Peran dan tanggung jawab agen yang lebih jelas dalam dokumentasi
- **Kesiapan Produksi**: Penyesuaian yang lebih baik dengan konvensi penamaan perusahaan
- **Materi Pembelajaran**: Penamaan agen yang lebih intuitif untuk tujuan pendidikan
- **Kemudahan Template**: Mempermudah pemahaman fungsi agen dan pola penyebaran

#### Detail Teknis
- Memperbarui diagram arsitektur Mermaid dengan referensi CustomerAgent
- Mengganti nama kelas CoraAgent dengan CustomerAgent dalam contoh Python
- Memodifikasi konfigurasi JSON template ARM untuk menggunakan tipe agen "pelanggan"
- Memperbarui variabel lingkungan dari CORA_AGENT_* ke pola CUSTOMER_AGENT_*
- Memperbarui semua perintah penyebaran dan konfigurasi kontainer

### [v3.0.0] - 2025-09-12

#### Perubahan Besar - Fokus Pengembang AI dan Integrasi Azure AI Foundry
**Versi ini mengubah repositori menjadi sumber pembelajaran yang berfokus pada AI dengan integrasi Azure AI Foundry.**

#### Ditambahkan
- **🤖 Jalur Pembelajaran Berbasis AI**: Restrukturisasi lengkap yang memprioritaskan pengembang dan insinyur AI
- **Panduan Integrasi Azure AI Foundry**: Dokumentasi komprehensif untuk menghubungkan AZD dengan layanan Azure AI Foundry
- **Pola Penyebaran Model AI**: Panduan mendetail yang mencakup pemilihan model, konfigurasi, dan strategi penyebaran produksi
- **Lab Workshop AI**: Workshop langsung selama 2-3 jam untuk mengonversi aplikasi AI menjadi solusi yang dapat disebarkan dengan AZD
- **Praktik Terbaik AI Produksi**: Pola siap perusahaan untuk penskalaan, pemantauan, dan pengamanan beban kerja AI
- **Panduan Pemecahan Masalah Khusus AI**: Pemecahan masalah komprehensif untuk Azure OpenAI, Cognitive Services, dan masalah penyebaran AI
- **Galeri Template AI**: Koleksi unggulan template Azure AI Foundry dengan penilaian kompleksitas
- **Materi Workshop**: Struktur workshop lengkap dengan lab langsung dan materi referensi

#### Ditingkatkan
- **Struktur README**: Berfokus pada pengembang AI dengan data minat komunitas 45% dari Discord Azure AI Foundry
- **Jalur Pembelajaran**: Perjalanan pengembang AI khusus di samping jalur tradisional untuk pelajar dan insinyur DevOps
- **Rekomendasi Template**: Template AI unggulan termasuk azure-search-openai-demo, contoso-chat, dan openai-chat-app-quickstart
- **Integrasi Komunitas**: Dukungan komunitas Discord yang ditingkatkan dengan saluran dan diskusi khusus AI

#### Fokus Keamanan & Produksi
- **Pola Identitas Terkelola**: Konfigurasi autentikasi dan keamanan khusus AI
- **Optimasi Biaya**: Pelacakan penggunaan token dan kontrol anggaran untuk beban kerja AI
- **Penyebaran Multi-Region**: Strategi untuk penyebaran aplikasi AI global
- **Pemantauan Kinerja**: Metrik khusus AI dan integrasi Application Insights

#### Kualitas Dokumentasi
- **Struktur Kursus Linear**: Kemajuan logis dari pola penyebaran AI pemula hingga lanjutan
- **URL yang Divalidasi**: Semua tautan repositori eksternal diverifikasi dan dapat diakses
- **Referensi Lengkap**: Semua tautan dokumentasi internal divalidasi dan berfungsi
- **Siap Produksi**: Pola penyebaran perusahaan dengan contoh dunia nyata

### [v2.0.0] - 2025-09-09

#### Perubahan Besar - Restrukturisasi Repositori dan Peningkatan Profesional
**Versi ini mewakili perombakan signifikan pada struktur repositori dan presentasi konten.**

#### Ditambahkan
- **Kerangka Pembelajaran Terstruktur**: Semua halaman dokumentasi kini mencakup bagian Pendahuluan, Tujuan Pembelajaran, dan Hasil Pembelajaran
- **Sistem Navigasi**: Menambahkan tautan pelajaran Sebelumnya/Berikutnya di seluruh dokumentasi untuk kemajuan pembelajaran yang terpandu
- **Panduan Studi**: study-guide.md yang komprehensif dengan tujuan pembelajaran, latihan praktik, dan materi penilaian
- **Presentasi Profesional**: Menghapus semua ikon emoji untuk meningkatkan aksesibilitas dan tampilan profesional
- **Struktur Konten yang Ditingkatkan**: Organisasi dan alur materi pembelajaran yang lebih baik

#### Diubah
- **Format Dokumentasi**: Menstandarisasi semua dokumentasi dengan struktur pembelajaran yang konsisten
- **Alur Navigasi**: Menerapkan alur logis melalui semua materi pembelajaran
- **Penyajian Konten**: Menghapus elemen dekoratif demi format yang jelas dan profesional
- **Struktur Tautan**: Memperbarui semua tautan internal untuk mendukung sistem navigasi baru

#### Peningkatan
- **Aksesibilitas**: Menghapus ketergantungan pada emoji untuk kompatibilitas yang lebih baik dengan pembaca layar
- **Tampilan Profesional**: Presentasi bergaya akademis yang sesuai untuk pembelajaran di lingkungan perusahaan
- **Pengalaman Belajar**: Pendekatan terstruktur dengan tujuan dan hasil yang jelas untuk setiap pelajaran
- **Organisasi Konten**: Alur logis yang lebih baik dan koneksi antara topik terkait

### [v1.0.0] - 2025-09-09

#### Rilis Awal - Repositori Pembelajaran AZD yang Komprehensif

#### Ditambahkan
- **Struktur Dokumentasi Inti**
  - Seri panduan memulai yang lengkap
  - Dokumentasi penyebaran dan penyediaan yang komprehensif
  - Sumber daya pemecahan masalah dan panduan debugging yang mendetail
  - Alat dan prosedur validasi pra-penyebaran

- **Modul Memulai**
  - Dasar-dasar AZD: Konsep inti dan terminologi
  - Panduan Instalasi: Instruksi pengaturan spesifik platform
  - Panduan Konfigurasi: Pengaturan lingkungan dan autentikasi
  - Tutorial Proyek Pertama: Pembelajaran langsung langkah demi langkah

- **Modul Penyebaran dan Penyediaan**
  - Panduan Penyebaran: Dokumentasi alur kerja yang lengkap
  - Panduan Penyediaan: Infrastruktur sebagai Kode dengan Bicep
  - Praktik terbaik untuk penyebaran produksi
  - Pola arsitektur multi-layanan

- **Modul Validasi Pra-Penyebaran**
  - Perencanaan Kapasitas: Validasi ketersediaan sumber daya Azure
  - Pemilihan SKU: Panduan tingkat layanan yang komprehensif
  - Pemeriksaan Awal: Skrip validasi otomatis (PowerShell dan Bash)
  - Alat estimasi biaya dan perencanaan anggaran

- **Modul Pemecahan Masalah**
  - Masalah Umum: Masalah yang sering terjadi dan solusinya
  - Panduan Debugging: Metodologi pemecahan masalah yang sistematis
  - Teknik diagnostik dan alat canggih
  - Pemantauan kinerja dan optimasi

- **Sumber Daya dan Referensi**
  - Cheat Sheet Perintah: Referensi cepat untuk perintah penting
  - Glosarium: Definisi terminologi dan akronim yang komprehensif
  - FAQ: Jawaban mendetail untuk pertanyaan umum
  - Tautan sumber daya eksternal dan koneksi komunitas

- **Contoh dan Template**
  - Contoh Aplikasi Web Sederhana
  - Template penyebaran Situs Web Statis
  - Konfigurasi Aplikasi Kontainer
  - Pola integrasi basis data
  - Contoh arsitektur mikroservis
  - Implementasi fungsi tanpa server

#### Fitur
- **Dukungan Multi-Platform**: Panduan instalasi dan konfigurasi untuk Windows, macOS, dan Linux
- **Berbagai Tingkat Keahlian**: Konten dirancang untuk pelajar hingga pengembang profesional
- **Fokus Praktis**: Contoh langsung dan skenario dunia nyata
- **Cakupan Komprehensif**: Dari konsep dasar hingga pola perusahaan yang canggih
- **Pendekatan Keamanan**: Praktik terbaik keamanan terintegrasi di seluruh materi
- **Optimasi Biaya**: Panduan untuk penyebaran yang hemat biaya dan pengelolaan sumber daya

#### Kualitas Dokumentasi
- **Contoh Kode yang Mendetail**: Contoh kode yang praktis dan telah diuji
- **Instruksi Langkah-demi-Langkah**: Panduan yang jelas dan dapat dilakukan
- **Penanganan Kesalahan yang Komprehensif**: Pemecahan masalah untuk masalah umum
- **Integrasi Praktik Terbaik**: Standar industri dan rekomendasi
- **Kompatibilitas Versi**: Selalu diperbarui dengan layanan Azure terbaru dan fitur azd

## Rencana Peningkatan di Masa Depan

### Versi 3.1.0 (Direncanakan)
#### Ekspansi Platform AI
- **Dukungan Multi-Model**: Pola integrasi untuk Hugging Face, Azure Machine Learning, dan model kustom
- **Kerangka Kerja Agen AI**: Template untuk penyebaran LangChain, Semantic Kernel, dan AutoGen
- **Pola RAG Lanjutan**: Pilihan database vektor di luar Azure AI Search (Pinecone, Weaviate, dll.)
- **Observabilitas AI**: Pemantauan yang ditingkatkan untuk kinerja model, penggunaan token, dan kualitas respons

#### Pengalaman Pengembang
- **Ekstensi VS Code**: Pengalaman pengembangan AZD + AI Foundry yang terintegrasi
- **Integrasi GitHub Copilot**: Pembuatan template AZD yang dibantu AI
- **Tutorial Interaktif**: Latihan coding langsung dengan validasi otomatis untuk skenario AI
- **Konten Video**: Tutorial video tambahan untuk pembelajar visual yang berfokus pada penyebaran AI

### Versi 4.0.0 (Direncanakan)
#### Pola AI Perusahaan
- **Kerangka Kerja Tata Kelola**: Tata kelola model AI, kepatuhan, dan jejak audit
- **AI Multi-Tenant**: Pola untuk melayani banyak pelanggan dengan layanan AI yang terisolasi
- **Penyebaran AI di Edge**: Integrasi dengan Azure IoT Edge dan instance kontainer
- **AI Cloud Hybrid**: Pola penyebaran multi-cloud dan hybrid untuk beban kerja AI

#### Fitur Lanjutan
- **Otomasi Pipeline AI**: Integrasi MLOps dengan pipeline Azure Machine Learning
- **Keamanan Lanjutan**: Pola zero-trust, endpoint privat, dan perlindungan ancaman tingkat lanjut
- **Optimasi Kinerja**: Strategi tuning dan scaling canggih untuk aplikasi AI dengan throughput tinggi
- **Distribusi Global**: Pola pengiriman konten dan caching di edge untuk aplikasi AI

### Versi 3.0.0 (Direncanakan) - Digantikan oleh Rilis Saat Ini
#### Penambahan yang Diusulkan - Kini Diimplementasikan di v3.0.0
- ✅ **Konten Berfokus AI**: Integrasi komprehensif Azure AI Foundry (Selesai)
- ✅ **Tutorial Interaktif**: Lab workshop AI langsung (Selesai)
- ✅ **Modul Keamanan Lanjutan**: Pola keamanan spesifik AI (Selesai)
- ✅ **Optimasi Kinerja**: Strategi tuning beban kerja AI (Selesai)

### Versi 2.1.0 (Direncanakan) - Sebagian Diimplementasikan di v3.0.0
#### Peningkatan Minor - Sebagian Selesai di Rilis Saat Ini
- ✅ **Contoh Tambahan**: Skenario penyebaran berfokus AI (Selesai)
- ✅ **FAQ yang Diperluas**: Pertanyaan dan pemecahan masalah spesifik AI (Selesai)
- **Integrasi Alat**: Panduan integrasi IDE dan editor yang ditingkatkan
- ✅ **Ekspansi Pemantauan**: Pola pemantauan dan peringatan spesifik AI (Selesai)

#### Masih Direncanakan untuk Rilis Mendatang
- **Dokumentasi Ramah Mobile**: Desain responsif untuk pembelajaran di perangkat seluler
- **Akses Offline**: Paket dokumentasi yang dapat diunduh
- **Integrasi IDE yang Ditingkatkan**: Ekstensi VS Code untuk alur kerja AZD + AI
- **Dashboard Komunitas**: Metrik komunitas real-time dan pelacakan kontribusi

## Berkontribusi pada Changelog

### Melaporkan Perubahan
Saat berkontribusi ke repositori ini, pastikan entri changelog mencakup:

1. **Nomor Versi**: Mengikuti versi semantik (major.minor.patch)
2. **Tanggal**: Tanggal rilis atau pembaruan dalam format YYYY-MM-DD
3. **Kategori**: Ditambahkan, Diubah, Dihapus, Dihentikan, Diperbaiki, Keamanan
4. **Deskripsi Jelas**: Deskripsi singkat tentang perubahan yang dilakukan
5. **Penilaian Dampak**: Bagaimana perubahan memengaruhi pengguna yang ada

### Kategori Perubahan

#### Ditambahkan
- Fitur baru, bagian dokumentasi, atau kemampuan
- Contoh, template, atau sumber daya pembelajaran baru
- Alat, skrip, atau utilitas tambahan

#### Diubah
- Modifikasi pada fungsionalitas atau dokumentasi yang ada
- Pembaruan untuk meningkatkan kejelasan atau akurasi
- Restrukturisasi konten atau organisasi

#### Dihentikan
- Fitur atau pendekatan yang akan dihentikan
- Bagian dokumentasi yang dijadwalkan untuk dihapus
- Metode yang memiliki alternatif yang lebih baik

#### Dihapus
- Fitur, dokumentasi, atau contoh yang tidak lagi relevan
- Informasi usang atau pendekatan yang dihentikan
- Konten yang redundan atau telah dikonsolidasikan

#### Diperbaiki
- Koreksi kesalahan dalam dokumentasi atau kode
- Penyelesaian masalah atau masalah yang dilaporkan
- Peningkatan akurasi atau fungsionalitas

#### Keamanan
- Peningkatan atau perbaikan terkait keamanan
- Pembaruan praktik terbaik keamanan
- Penyelesaian kerentanan keamanan

### Panduan Versi Semantik

#### Versi Utama (X.0.0)
- Perubahan besar yang memerlukan tindakan pengguna
- Restrukturisasi konten atau organisasi yang signifikan
- Perubahan yang mengubah pendekatan atau metodologi mendasar

#### Versi Minor (X.Y.0)
- Fitur baru atau penambahan konten
- Peningkatan yang tetap kompatibel dengan versi sebelumnya
- Contoh, alat, atau sumber daya tambahan

#### Versi Patch (X.Y.Z)
- Perbaikan bug dan koreksi
- Peningkatan kecil pada konten yang ada
- Klarifikasi dan peningkatan kecil

## Umpan Balik dan Saran Komunitas

Kami sangat mendorong umpan balik komunitas untuk meningkatkan sumber pembelajaran ini:

### Cara Memberikan Umpan Balik
- **GitHub Issues**: Laporkan masalah atau sarankan perbaikan (masalah spesifik AI diterima)
- **Diskusi Discord**: Bagikan ide dan berinteraksi dengan komunitas Azure AI Foundry
- **Pull Requests**: Berkontribusi langsung pada perbaikan konten, terutama template dan panduan AI
- **Discord Azure AI Foundry**: Berpartisipasi di saluran #Azure untuk diskusi AZD + AI
- **Forum Komunitas**: Berpartisipasi dalam diskusi pengembang Azure yang lebih luas

### Kategori Umpan Balik
- **Akurasi Konten AI**: Koreksi informasi integrasi dan penyebaran layanan AI
- **Pengalaman Belajar**: Saran untuk alur pembelajaran pengembang AI yang lebih baik
- **Konten AI yang Hilang**: Permintaan untuk template, pola, atau contoh AI tambahan
- **Aksesibilitas**: Peningkatan untuk kebutuhan pembelajaran yang beragam
- **Integrasi Alat AI**: Saran untuk integrasi alur kerja pengembangan AI yang lebih baik
- **Pola AI Produksi**: Permintaan pola penyebaran AI untuk perusahaan

### Komitmen Respons
- **Respons Masalah**: Dalam 48 jam untuk masalah yang dilaporkan
- **Permintaan Fitur**: Evaluasi dalam satu minggu
- **Kontribusi Komunitas**: Tinjauan dalam satu minggu
- **Masalah Keamanan**: Prioritas segera dengan respons yang dipercepat

## Jadwal Pemeliharaan

### Pembaruan Reguler
- **Tinjauan Bulanan**: Akurasi konten dan validasi tautan
- **Pembaruan Triwulanan**: Penambahan dan peningkatan konten utama
- **Tinjauan Semi-Tahunan**: Restrukturisasi dan peningkatan komprehensif
- **Rilis Tahunan**: Pembaruan versi utama dengan peningkatan signifikan

### Pemantauan dan Jaminan Kualitas
- **Pengujian Otomatis**: Validasi reguler untuk contoh kode dan tautan
- **Integrasi Umpan Balik Komunitas**: Incorporasi reguler dari saran pengguna
- **Pembaruan Teknologi**: Penyesuaian dengan layanan Azure terbaru dan rilis azd
- **Audit Aksesibilitas**: Tinjauan reguler untuk prinsip desain inklusif

## Kebijakan Dukungan Versi

### Dukungan Versi Saat Ini
- **Versi Utama Terbaru**: Dukungan penuh dengan pembaruan reguler
- **Versi Utama Sebelumnya**: Pembaruan keamanan dan perbaikan kritis selama 12 bulan
- **Versi Lama**: Dukungan komunitas saja, tanpa pembaruan resmi

### Panduan Migrasi
Ketika versi utama dirilis, kami menyediakan:
- **Panduan Migrasi**: Instruksi transisi langkah demi langkah
- **Catatan Kompatibilitas**: Detail tentang perubahan besar
- **Dukungan Alat**: Skrip atau utilitas untuk membantu migrasi
- **Dukungan Komunitas**: Forum khusus untuk pertanyaan migrasi

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Panduan Belajar](resources/study-guide.md)
- **Pelajaran Berikutnya**: Kembali ke [README Utama](README.md)

**Tetap Terupdate**: Ikuti repositori ini untuk mendapatkan notifikasi tentang rilis baru dan pembaruan penting pada materi pembelajaran.

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk memberikan hasil yang akurat, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang penting, disarankan menggunakan jasa penerjemahan manusia profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau interpretasi yang keliru yang timbul dari penggunaan terjemahan ini.