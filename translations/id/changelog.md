# Catatan Perubahan - AZD Untuk Pemula

## Pendahuluan

Catatan perubahan ini mendokumentasikan semua perubahan, pembaruan, dan peningkatan penting pada repositori AZD Untuk Pemula. Kami mengikuti prinsip versi semantik dan menjaga log ini untuk membantu pengguna memahami apa yang berubah di antara versi.

## Tujuan Pembelajaran

Dengan meninjau catatan perubahan ini, Anda akan:
- Tetap mendapatkan informasi tentang fitur baru dan penambahan konten
- Memahami peningkatan yang dilakukan pada dokumentasi yang ada
- Melacak perbaikan bug dan koreksi untuk memastikan akurasi
- Mengikuti perkembangan materi pembelajaran dari waktu ke waktu

## Hasil Pembelajaran

Setelah meninjau entri catatan perubahan, Anda akan dapat:
- Mengidentifikasi konten dan sumber daya baru yang tersedia untuk pembelajaran
- Memahami bagian mana yang telah diperbarui atau ditingkatkan
- Merencanakan jalur pembelajaran Anda berdasarkan materi terkini
- Memberikan umpan balik dan saran untuk peningkatan di masa depan

## Riwayat Versi

### [v3.8.0] - 2025-11-19

#### Dokumentasi Lanjutan: Pemantauan, Keamanan, dan Pola Multi-Agent
**Versi ini menambahkan pelajaran tingkat A yang komprehensif tentang integrasi Application Insights, pola autentikasi, dan koordinasi multi-agent untuk penerapan produksi.**

#### Ditambahkan
- **📊 Pelajaran Integrasi Application Insights**: di `docs/pre-deployment/application-insights.md`:
  - Penerapan berfokus AZD dengan penyediaan otomatis
  - Template Bicep lengkap untuk Application Insights + Log Analytics
  - Aplikasi Python yang berfungsi dengan telemetri khusus (1.200+ baris)
  - Pola pemantauan AI/LLM (pelacakan token/biaya Azure OpenAI)
  - 6 diagram Mermaid (arsitektur, pelacakan terdistribusi, alur telemetri)
  - 3 latihan langsung (peringatan, dasbor, pemantauan AI)
  - Contoh kueri Kusto dan strategi optimasi biaya
  - Streaming metrik langsung dan debugging real-time
  - Waktu pembelajaran 40-50 menit dengan pola siap produksi

- **🔐 Pelajaran Pola Autentikasi & Keamanan**: di `docs/getting-started/authsecurity.md`:
  - 3 pola autentikasi (connection strings, Key Vault, managed identity)
  - Template infrastruktur Bicep lengkap untuk penerapan yang aman
  - Kode aplikasi Node.js dengan integrasi Azure SDK
  - 3 latihan lengkap (mengaktifkan managed identity, user-assigned identity, rotasi Key Vault)
  - Praktik terbaik keamanan dan konfigurasi RBAC
  - Panduan pemecahan masalah dan analisis biaya
  - Pola autentikasi tanpa kata sandi yang siap produksi

- **🤖 Pelajaran Pola Koordinasi Multi-Agent**: di `docs/pre-deployment/coordination-patterns.md`:
  - 5 pola koordinasi (sekuensial, paralel, hierarkis, berbasis peristiwa, konsensus)
  - Implementasi layanan orkestrator lengkap (Python/Flask, 1.500+ baris)
  - 3 implementasi agen khusus (Penelitian, Penulis, Editor)
  - Integrasi Service Bus untuk antrian pesan
  - Manajemen status Cosmos DB untuk sistem terdistribusi
  - 6 diagram Mermaid yang menunjukkan interaksi agen
  - 3 latihan lanjutan (penanganan timeout, logika retry, circuit breaker)
  - Rincian biaya ($240-565/bulan) dengan strategi optimasi
  - Integrasi Application Insights untuk pemantauan

#### Ditingkatkan
- **Bab Pra-Penerapan**: Sekarang mencakup pola pemantauan dan koordinasi yang komprehensif
- **Bab Memulai**: Ditingkatkan dengan pola autentikasi profesional
- **Kesiapan Produksi**: Cakupan lengkap dari keamanan hingga observabilitas
- **Kerangka Kursus**: Diperbarui untuk merujuk pelajaran baru di Bab 3 dan 6

#### Diubah
- **Progres Pembelajaran**: Integrasi yang lebih baik dari keamanan dan pemantauan di seluruh kursus
- **Kualitas Dokumentasi**: Standar tingkat A yang konsisten (95-97%) di seluruh pelajaran baru
- **Pola Produksi**: Cakupan lengkap dari ujung ke ujung untuk penerapan perusahaan

#### Diperbaiki
- **Pengalaman Pengembang**: Jalur yang jelas dari pengembangan hingga pemantauan produksi
- **Standar Keamanan**: Pola profesional untuk autentikasi dan manajemen rahasia
- **Observabilitas**: Integrasi Application Insights lengkap dengan AZD
- **Beban Kerja AI**: Pemantauan khusus untuk Azure OpenAI dan sistem multi-agent

#### Divalidasi
- ✅ Semua pelajaran mencakup kode yang berfungsi lengkap (bukan potongan)
- ✅ Diagram Mermaid untuk pembelajaran visual (19 total di 3 pelajaran)
- ✅ Latihan langsung dengan langkah verifikasi (9 total)
- ✅ Template Bicep siap produksi dapat diterapkan melalui `azd up`
- ✅ Analisis biaya dan strategi optimasi
- ✅ Panduan pemecahan masalah dan praktik terbaik
- ✅ Poin pengetahuan dengan perintah verifikasi

#### Hasil Penilaian Dokumentasi
- **docs/pre-deployment/application-insights.md**: - Panduan pemantauan yang komprehensif
- **docs/getting-started/authsecurity.md**: - Pola keamanan profesional
- **docs/pre-deployment/coordination-patterns.md**: - Arsitektur multi-agent tingkat lanjut
- **Konten Baru Secara Keseluruhan**: - Standar kualitas tinggi yang konsisten

#### Implementasi Teknis
- **Application Insights**: Log Analytics + telemetri khusus + pelacakan terdistribusi
- **Autentikasi**: Managed Identity + Key Vault + pola RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrasi
- **Pemantauan**: Metrik langsung + kueri Kusto + peringatan + dasbor
- **Manajemen Biaya**: Strategi sampling, kebijakan retensi, kontrol anggaran

### [v3.7.0] - 2025-11-19

#### Peningkatan Kualitas Dokumentasi dan Contoh Azure OpenAI Baru
**Versi ini meningkatkan kualitas dokumentasi di seluruh repositori dan menambahkan contoh penerapan Azure OpenAI lengkap dengan antarmuka obrolan GPT-4.**

#### Ditambahkan
- **🤖 Contoh Obrolan Azure OpenAI**: Penerapan GPT-4 lengkap dengan implementasi yang berfungsi di `examples/azure-openai-chat/`:
  - Infrastruktur Azure OpenAI lengkap (penerapan model GPT-4)
  - Antarmuka obrolan command-line Python dengan riwayat percakapan
  - Integrasi Key Vault untuk penyimpanan kunci API yang aman
  - Pelacakan penggunaan token dan estimasi biaya
  - Pembatasan laju dan penanganan kesalahan
  - README komprehensif dengan panduan penerapan 35-45 menit
  - 11 file siap produksi (template Bicep, aplikasi Python, konfigurasi)
- **📚 Latihan Dokumentasi**: Menambahkan latihan praktik langsung ke panduan konfigurasi:
  - Latihan 1: Konfigurasi multi-lingkungan (15 menit)
  - Latihan 2: Praktik manajemen rahasia (10 menit)
  - Kriteria keberhasilan yang jelas dan langkah verifikasi
- **✅ Verifikasi Penerapan**: Menambahkan bagian verifikasi ke panduan penerapan:
  - Prosedur pemeriksaan kesehatan
  - Daftar kriteria keberhasilan
  - Output yang diharapkan untuk semua perintah penerapan
  - Referensi cepat pemecahan masalah

#### Ditingkatkan
- **examples/README.md**: Diperbarui ke kualitas tingkat A (93%):
  - Menambahkan azure-openai-chat ke semua bagian yang relevan
  - Memperbarui jumlah contoh lokal dari 3 menjadi 4
  - Ditambahkan ke tabel Contoh Aplikasi AI
  - Diintegrasikan ke Quick Start untuk Pengguna Menengah
  - Ditambahkan ke bagian Template Microsoft Foundry Azure AI
  - Memperbarui Matriks Perbandingan dan bagian temuan teknologi
- **Kualitas Dokumentasi**: Ditingkatkan dari B+ (87%) → A- (92%) di seluruh folder docs:
  - Menambahkan output yang diharapkan ke contoh perintah penting
  - Menyertakan langkah verifikasi untuk perubahan konfigurasi
  - Meningkatkan pembelajaran langsung dengan latihan praktis

#### Diubah
- **Progres Pembelajaran**: Integrasi yang lebih baik dari contoh AI untuk pelajar menengah
- **Struktur Dokumentasi**: Latihan yang lebih dapat ditindaklanjuti dengan hasil yang jelas
- **Proses Verifikasi**: Kriteria keberhasilan eksplisit ditambahkan ke alur kerja utama

#### Diperbaiki
- **Pengalaman Pengembang**: Penerapan Azure OpenAI sekarang memakan waktu 35-45 menit (vs 60-90 untuk alternatif kompleks)
- **Transparansi Biaya**: Estimasi biaya yang jelas ($50-200/bulan) untuk contoh Azure OpenAI
- **Jalur Pembelajaran**: Pengembang AI memiliki titik masuk yang jelas dengan azure-openai-chat
- **Standar Dokumentasi**: Output yang diharapkan dan langkah verifikasi yang konsisten

#### Divalidasi
- ✅ Contoh Azure OpenAI sepenuhnya berfungsi dengan `azd up`
- ✅ Semua 11 file implementasi sintaksis benar
- ✅ Instruksi README sesuai dengan pengalaman penerapan aktual
- ✅ Tautan dokumentasi diperbarui di lebih dari 8 lokasi
- ✅ Indeks contoh mencerminkan 4 contoh lokal secara akurat
- ✅ Tidak ada tautan eksternal duplikat di tabel
- ✅ Semua referensi navigasi benar

#### Implementasi Teknis
- **Arsitektur Azure OpenAI**: GPT-4 + Key Vault + pola Container Apps
- **Keamanan**: Siap Managed Identity, rahasia di Key Vault
- **Pemantauan**: Integrasi Application Insights
- **Manajemen Biaya**: Pelacakan token dan optimasi penggunaan
- **Penerapan**: Perintah tunggal `azd up` untuk pengaturan lengkap

### [v3.6.0] - 2025-11-19

#### Pembaruan Besar: Contoh Penerapan Aplikasi Container
**Versi ini memperkenalkan contoh penerapan aplikasi container yang komprehensif dan siap produksi menggunakan Azure Developer CLI (AZD), dengan dokumentasi lengkap dan integrasi ke jalur pembelajaran.**

#### Ditambahkan
- **🚀 Contoh Aplikasi Container**: Contoh lokal baru di `examples/container-app/`:
  - [Panduan Utama](examples/container-app/README.md): Ikhtisar lengkap tentang penerapan container, quick start, produksi, dan pola lanjutan
  - [API Flask Sederhana](../../examples/container-app/simple-flask-api): REST API ramah pemula dengan scale-to-zero, pemeriksaan kesehatan, pemantauan, dan pemecahan masalah
  - [Arsitektur Microservices](../../examples/container-app/microservices): Penerapan multi-layanan siap produksi (API Gateway, Produk, Pesanan, Pengguna, Notifikasi), pesan asinkron, Service Bus, Cosmos DB, Azure SQL, pelacakan terdistribusi, penerapan blue-green/canary
- **Praktik Terbaik**: Panduan keamanan, pemantauan, optimasi biaya, dan CI/CD untuk beban kerja container
- **Contoh Kode**: `azure.yaml` lengkap, template Bicep, dan implementasi layanan multi-bahasa (Python, Node.js, C#, Go)
- **Pengujian & Pemecahan Masalah**: Skenario pengujian end-to-end, perintah pemantauan, panduan pemecahan masalah

#### Diubah
- **README.md**: Diperbarui untuk menampilkan dan menautkan contoh aplikasi container baru di bawah "Contoh Lokal - Aplikasi Container"
- **examples/README.md**: Diperbarui untuk menyoroti contoh aplikasi container, menambahkan entri matriks perbandingan, dan memperbarui referensi teknologi/arsitektur
- **Kerangka Kursus & Panduan Studi**: Diperbarui untuk merujuk contoh aplikasi container baru dan pola penerapan di bab yang relevan

#### Divalidasi
- ✅ Semua contoh baru dapat diterapkan dengan `azd up` dan mengikuti praktik terbaik
- ✅ Tautan silang dokumentasi dan navigasi diperbarui
- ✅ Contoh mencakup skenario pemula hingga lanjutan, termasuk microservices produksi

#### Catatan
- **Lingkup**: Dokumentasi dan contoh dalam bahasa Inggris saja
- **Langkah Selanjutnya**: Perluasan dengan pola container lanjutan tambahan dan otomatisasi CI/CD di rilis mendatang

### [v3.5.0] - 2025-11-19

#### Rebranding Produk: Microsoft Foundry
**Versi ini menerapkan perubahan nama produk secara menyeluruh dari "Azure AI Foundry" menjadi "Microsoft Foundry" di seluruh dokumentasi bahasa Inggris, mencerminkan rebranding resmi Microsoft.**

#### Diubah
- **🔄 Pembaruan Nama Produk**: Rebranding lengkap dari "Azure AI Foundry" menjadi "Microsoft Foundry"
  - Memperbarui semua referensi di seluruh dokumentasi bahasa Inggris di folder `docs/`
  - Mengganti nama folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Mengganti nama file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referensi konten diperbarui di 7 file dokumentasi

- **📁 Perubahan Struktur Folder**:
  - `docs/ai-foundry/` diganti nama menjadi `docs/microsoft-foundry/`
  - Semua referensi silang diperbarui untuk mencerminkan struktur folder baru
  - Tautan navigasi divalidasi di seluruh dokumentasi

- **📄 Penggantian Nama File**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Semua tautan internal diperbarui untuk merujuk nama file baru

#### File yang Diperbarui
- **Dokumentasi Bab** (7 file):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 pembaruan tautan navigasi
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referensi nama produk diperbarui
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Sudah menggunakan Microsoft Foundry (dari pembaruan sebelumnya)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referensi diperbarui (ikhtisar, umpan balik komunitas, dokumentasi)
  - `docs/getting-started/azd-basics.md` - 4 tautan referensi silang diperbarui
  - `docs/getting-started/first-project.md` - 2 tautan navigasi bab diperbarui
  - `docs/getting-started/installation.md` - 2 tautan bab berikutnya diperbarui
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referensi diperbarui (navigasi, komunitas Discord)
  - `docs/troubleshooting/common-issues.md` - 1 tautan navigasi diperbarui
  - `docs/troubleshooting/debugging.md` - 1 tautan navigasi diperbarui

- **File Struktur Kursus** (2 file):
  - `README.md` - 17 referensi diperbarui (ikhtisar kursus, judul bab, bagian template, wawasan komunitas)
  - `course-outline.md` - 14 referensi diperbarui (ikhtisar, tujuan pembelajaran, sumber daya bab)

#### Divalidasi
- ✅ Tidak ada referensi jalur folder "ai-foundry" yang tersisa di dokumentasi bahasa Inggris
- ✅ Tidak ada referensi nama produk "Azure AI Foundry" yang tersisa di dokumentasi bahasa Inggris
- ✅ Semua tautan navigasi berfungsi dengan struktur folder baru
- ✅ Penggantian nama file dan folder selesai dengan sukses
- ✅ Referensi silang antar bab divalidasi

#### Catatan
- **Lingkup**: Perubahan diterapkan pada dokumentasi bahasa Inggris di folder `docs/` saja
- **Terjemahan**: Folder terjemahan (`translations/`) tidak diperbarui dalam versi ini
- **Workshop**: Materi workshop (`workshop/`) tidak diperbarui dalam versi ini
- **Contoh**: File contoh mungkin masih merujuk pada penamaan lama (akan diperbaiki di pembaruan mendatang)
- **Tautan Eksternal**: URL eksternal dan referensi repositori GitHub tetap tidak berubah

#### Panduan Migrasi untuk Kontributor
Jika Anda memiliki cabang lokal atau dokumentasi yang merujuk pada struktur lama:
1. Perbarui referensi folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Perbarui referensi file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ganti nama produk: "Azure AI Foundry" → "Microsoft Foundry"
4. Validasi semua tautan dokumentasi internal agar tetap berfungsi

---

### [v3.4.0] - 2025-10-24

#### Pratinjau Infrastruktur dan Peningkatan Validasi
**Versi ini memperkenalkan dukungan komprehensif untuk fitur pratinjau Azure Developer CLI baru dan meningkatkan pengalaman pengguna workshop.**

#### Ditambahkan
- **🧪 Dokumentasi Fitur azd provision --preview**: Cakupan lengkap kemampuan pratinjau infrastruktur baru
  - Referensi perintah dan contoh penggunaan dalam lembar contekan
  - Integrasi mendetail dalam panduan penyediaan dengan kasus penggunaan dan manfaat
  - Integrasi pemeriksaan awal untuk validasi penyebaran yang lebih aman
  - Pembaruan panduan memulai dengan praktik penyebaran yang mengutamakan keamanan
- **🚧 Banner Status Workshop**: Banner HTML profesional yang menunjukkan status pengembangan workshop
  - Desain gradasi dengan indikator konstruksi untuk komunikasi yang jelas kepada pengguna
  - Stempel waktu pembaruan terakhir untuk transparansi
  - Desain responsif untuk semua jenis perangkat

#### Ditingkatkan
- **Keamanan Infrastruktur**: Fungsionalitas pratinjau terintegrasi di seluruh dokumentasi penyebaran
- **Validasi Pra-Penyebaran**: Skrip otomatis kini mencakup pengujian pratinjau infrastruktur
- **Alur Kerja Pengembang**: Urutan perintah yang diperbarui untuk menyertakan pratinjau sebagai praktik terbaik
- **Pengalaman Workshop**: Harapan yang jelas ditetapkan untuk pengguna tentang status pengembangan konten

#### Diubah
- **Praktik Terbaik Penyebaran**: Alur kerja yang mengutamakan pratinjau kini menjadi pendekatan yang direkomendasikan
- **Alur Dokumentasi**: Validasi infrastruktur dipindahkan lebih awal dalam proses pembelajaran
- **Presentasi Workshop**: Komunikasi status profesional dengan garis waktu pengembangan yang jelas

#### Diperbaiki
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
- **Presentasi Profesional**: Mempertahankan kredibilitas repositori sambil menetapkan ekspektasi
- **Transparansi Garis Waktu**: Stempel waktu pembaruan terakhir Oktober 2025 untuk akuntabilitas

### [v3.3.0] - 2025-09-24

#### Materi Workshop yang Ditingkatkan dan Pengalaman Pembelajaran Interaktif
**Versi ini memperkenalkan materi workshop yang komprehensif dengan panduan interaktif berbasis browser dan jalur pembelajaran yang terstruktur.**

#### Ditambahkan
- **🎥 Panduan Workshop Interaktif**: Pengalaman workshop berbasis browser dengan kemampuan pratinjau MkDocs
- **📝 Instruksi Workshop Terstruktur**: Jalur pembelajaran 7 langkah dari penemuan hingga kustomisasi
  - 0-Pengenalan: Ikhtisar workshop dan pengaturan
  - 1-Pilih-Template-AI: Proses penemuan dan pemilihan template
  - 2-Validasi-Template-AI: Prosedur penyebaran dan validasi
  - 3-Mengurai-Template-AI: Memahami arsitektur template
  - 4-Konfigurasi-Template-AI: Konfigurasi dan kustomisasi
  - 5-Kustomisasi-Template-AI: Modifikasi dan iterasi lanjutan
  - 6-Pembersihan-Infrastruktur: Pembersihan dan pengelolaan sumber daya
  - 7-Penutup: Ringkasan dan langkah berikutnya
- **🛠️ Alat Workshop**: Konfigurasi MkDocs dengan tema Material untuk pengalaman pembelajaran yang ditingkatkan
- **🎯 Jalur Pembelajaran Praktis**: Metodologi 3 langkah (Penemuan → Penyebaran → Kustomisasi)
- **📱 Integrasi GitHub Codespaces**: Pengaturan lingkungan pengembangan yang mulus

#### Ditingkatkan
- **Lab Workshop AI**: Diperluas dengan pengalaman pembelajaran terstruktur selama 2-3 jam
- **Dokumentasi Workshop**: Presentasi profesional dengan navigasi dan alat bantu visual
- **Progres Pembelajaran**: Panduan langkah demi langkah yang jelas dari pemilihan template hingga penyebaran produksi
- **Pengalaman Pengembang**: Alat yang terintegrasi untuk alur kerja pengembangan yang efisien

#### Diperbaiki
- **Aksesibilitas**: Antarmuka berbasis browser dengan pencarian, fungsi salin, dan pengaturan tema
- **Pembelajaran Mandiri**: Struktur workshop yang fleksibel untuk menyesuaikan kecepatan belajar yang berbeda
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
- **🎯 Pelacakan Progres**: Daftar periksa penyelesaian kursus dan sistem verifikasi pembelajaran
- **🗺️ Panduan Jalur Pembelajaran**: Titik masuk yang jelas untuk tingkat pengalaman dan tujuan yang berbeda
- **🔗 Navigasi Referensi Silang**: Bab terkait dan prasyarat yang ditautkan dengan jelas

#### Ditingkatkan
- **Struktur README**: Diubah menjadi platform pembelajaran terstruktur dengan organisasi berbasis bab
- **Navigasi Dokumentasi**: Setiap halaman kini mencakup konteks bab dan panduan progresi
- **Organisasi Template**: Contoh dan template dipetakan ke bab pembelajaran yang sesuai
- **Integrasi Sumber Daya**: Lembar contekan, FAQ, dan panduan studi terhubung ke bab yang relevan
- **Integrasi Workshop**: Lab langsung dipetakan ke beberapa tujuan pembelajaran bab

#### Diubah
- **Progres Pembelajaran**: Beralih dari dokumentasi linear ke pembelajaran berbasis bab yang fleksibel
- **Penempatan Konfigurasi**: Panduan konfigurasi diposisikan ulang sebagai Bab 3 untuk alur pembelajaran yang lebih baik
- **Integrasi Konten AI**: Integrasi yang lebih baik dari konten spesifik AI di seluruh perjalanan pembelajaran
- **Konten Produksi**: Pola lanjutan dikonsolidasikan di Bab 8 untuk pelajar perusahaan

#### Diperbaiki
- **Pengalaman Pengguna**: Navigasi breadcrumbs yang jelas dan indikator progresi bab
- **Aksesibilitas**: Pola navigasi yang konsisten untuk mempermudah penelusuran kursus
- **Presentasi Profesional**: Struktur kursus gaya universitas yang cocok untuk pelatihan akademik dan korporat
- **Efisiensi Pembelajaran**: Waktu yang lebih singkat untuk menemukan konten yang relevan melalui organisasi yang ditingkatkan

#### Implementasi Teknis
- **Header Navigasi**: Navigasi bab yang distandarisasi di lebih dari 40 file dokumentasi
- **Navigasi Footer**: Panduan progresi yang konsisten dan indikator penyelesaian bab
- **Referensi Silang**: Sistem penautan internal yang komprehensif yang menghubungkan konsep terkait
- **Pemetaan Bab**: Template dan contoh yang jelas terkait dengan tujuan pembelajaran

#### Peningkatan Panduan Studi
- **📚 Tujuan Pembelajaran Komprehensif**: Panduan studi yang direstrukturisasi untuk selaras dengan sistem 8 bab
- **🎯 Penilaian Berbasis Bab**: Setiap bab mencakup tujuan pembelajaran spesifik dan latihan praktis
- **📋 Pelacakan Progres**: Jadwal pembelajaran mingguan dengan hasil yang terukur dan daftar periksa penyelesaian
- **❓ Pertanyaan Penilaian**: Pertanyaan validasi pengetahuan untuk setiap bab dengan hasil profesional
- **🛠️ Latihan Praktis**: Aktivitas langsung dengan skenario penyebaran nyata dan pemecahan masalah
- **📊 Progresi Keterampilan**: Kemajuan yang jelas dari konsep dasar hingga pola perusahaan dengan fokus pengembangan karir
- **🎓 Kerangka Sertifikasi**: Hasil pengembangan profesional dan sistem pengakuan komunitas
- **⏱️ Manajemen Garis Waktu**: Rencana pembelajaran terstruktur selama 10 minggu dengan validasi tonggak pencapaian

### [v3.1.0] - 2025-09-17

#### Solusi AI Multi-Agen yang Ditingkatkan
**Versi ini meningkatkan solusi ritel multi-agen dengan penamaan agen yang lebih baik dan dokumentasi yang ditingkatkan.**

#### Diubah
- **Terminologi Multi-Agen**: Mengganti "agen Cora" dengan "agen Pelanggan" di seluruh solusi multi-agen ritel untuk pemahaman yang lebih jelas
- **Arsitektur Agen**: Memperbarui semua dokumentasi, template ARM, dan contoh kode untuk menggunakan penamaan "agen Pelanggan" yang konsisten
- **Contoh Konfigurasi**: Memodernisasi pola konfigurasi agen dengan konvensi penamaan yang diperbarui
- **Konsistensi Dokumentasi**: Memastikan semua referensi menggunakan nama agen yang profesional dan deskriptif

#### Ditingkatkan
- **Paket Template ARM**: Memperbarui retail-multiagent-arm-template dengan referensi agen Pelanggan
- **Diagram Arsitektur**: Menyegarkan diagram Mermaid dengan penamaan agen yang diperbarui
- **Contoh Kode**: Kelas Python dan contoh implementasi kini menggunakan penamaan CustomerAgent
- **Variabel Lingkungan**: Memperbarui semua skrip penyebaran untuk menggunakan konvensi CUSTOMER_AGENT_NAME

#### Diperbaiki
- **Pengalaman Pengembang**: Peran dan tanggung jawab agen yang lebih jelas dalam dokumentasi
- **Kesiapan Produksi**: Penyesuaian yang lebih baik dengan konvensi penamaan perusahaan
- **Materi Pembelajaran**: Penamaan agen yang lebih intuitif untuk tujuan pendidikan
- **Kemudahan Template**: Mempermudah pemahaman fungsi agen dan pola penyebaran

#### Detail Teknis
- Memperbarui diagram arsitektur Mermaid dengan referensi CustomerAgent
- Mengganti nama kelas CoraAgent dengan CustomerAgent dalam contoh Python
- Memodifikasi konfigurasi JSON template ARM untuk menggunakan tipe agen "pelanggan"
- Memperbarui variabel lingkungan dari CORA_AGENT_* ke pola CUSTOMER_AGENT_*
- Menyegarkan semua perintah penyebaran dan konfigurasi kontainer

### [v3.0.0] - 2025-09-12

#### Perubahan Besar - Fokus Pengembang AI dan Integrasi Azure AI Foundry
**Versi ini mengubah repositori menjadi sumber pembelajaran yang komprehensif berfokus pada AI dengan integrasi Azure AI Foundry.**

#### Ditambahkan
- **🤖 Jalur Pembelajaran Berbasis AI**: Restrukturisasi lengkap yang memprioritaskan pengembang dan insinyur AI
- **Panduan Integrasi Azure AI Foundry**: Dokumentasi komprehensif untuk menghubungkan AZD dengan layanan Azure AI Foundry
- **Pola Penyebaran Model AI**: Panduan mendetail yang mencakup pemilihan model, konfigurasi, dan strategi penyebaran produksi
- **Lab Workshop AI**: Workshop langsung selama 2-3 jam untuk mengonversi aplikasi AI menjadi solusi yang dapat disebarkan dengan AZD
- **Praktik Terbaik AI Produksi**: Pola siap perusahaan untuk penskalaan, pemantauan, dan pengamanan beban kerja AI
- **Panduan Pemecahan Masalah AI**: Pemecahan masalah komprehensif untuk Azure OpenAI, Cognitive Services, dan masalah penyebaran AI
- **Galeri Template AI**: Koleksi unggulan template Azure AI Foundry dengan peringkat kompleksitas
- **Materi Workshop**: Struktur workshop lengkap dengan lab langsung dan materi referensi

#### Ditingkatkan
- **Struktur README**: Berfokus pada pengembang AI dengan data minat komunitas 45% dari Discord Azure AI Foundry
- **Jalur Pembelajaran**: Perjalanan pengembang AI khusus di samping jalur tradisional untuk siswa dan insinyur DevOps
- **Rekomendasi Template**: Template AI unggulan termasuk azure-search-openai-demo, contoso-chat, dan openai-chat-app-quickstart
- **Integrasi Komunitas**: Dukungan komunitas Discord yang ditingkatkan dengan saluran dan diskusi khusus AI

#### Fokus Keamanan & Produksi
- **Pola Identitas Terkelola**: Konfigurasi autentikasi dan keamanan khusus AI
- **Optimasi Biaya**: Pelacakan penggunaan token dan kontrol anggaran untuk beban kerja AI
- **Penyebaran Multi-Region**: Strategi untuk penyebaran aplikasi AI global
- **Pemantauan Kinerja**: Metrik khusus AI dan integrasi Application Insights

#### Kualitas Dokumentasi
- **Struktur Kursus Linear**: Progresi logis dari pola penyebaran AI pemula hingga lanjutan
- **URL yang Valid**: Semua tautan repositori eksternal diverifikasi dan dapat diakses
- **Referensi Lengkap**: Semua tautan dokumentasi internal divalidasi dan berfungsi
- **Siap Produksi**: Pola penyebaran perusahaan dengan contoh dunia nyata

### [v2.0.0] - 2025-09-09

#### Perubahan Besar - Restrukturisasi Repositori dan Peningkatan Profesional
**Versi ini mewakili perombakan signifikan pada struktur repositori dan presentasi konten.**

#### Ditambahkan
- **Kerangka Pembelajaran Terstruktur**: Semua halaman dokumentasi kini mencakup bagian Pendahuluan, Tujuan Pembelajaran, dan Hasil Pembelajaran
- **Sistem Navigasi**: Menambahkan tautan pelajaran Sebelumnya/Berikutnya di seluruh dokumentasi untuk progresi pembelajaran yang terarah
- **Panduan Studi**: study-guide.md yang komprehensif dengan tujuan pembelajaran, latihan praktik, dan materi penilaian
- **Presentasi Profesional**: Menghapus semua ikon emoji untuk meningkatkan aksesibilitas dan tampilan profesional
- **Struktur Konten yang Ditingkatkan**: Organisasi dan alur materi pembelajaran yang lebih baik

#### Diubah
- **Format Dokumentasi**: Menstandarisasi semua dokumentasi dengan struktur pembelajaran yang konsisten
- **Alur Navigasi**: Menerapkan progresi logis di seluruh materi pembelajaran
- **Penyajian Konten**: Menghapus elemen dekoratif demi format yang jelas dan profesional
- **Struktur Tautan**: Memperbarui semua tautan internal untuk mendukung sistem navigasi baru

#### Peningkatan
- **Aksesibilitas**: Menghapus ketergantungan emoji untuk kompatibilitas yang lebih baik dengan pembaca layar
- **Tampilan Profesional**: Penyajian bersih dengan gaya akademis yang cocok untuk pembelajaran perusahaan
- **Pengalaman Belajar**: Pendekatan terstruktur dengan tujuan dan hasil yang jelas untuk setiap pelajaran
- **Organisasi Konten**: Alur logis yang lebih baik dan koneksi antara topik terkait

### [v1.0.0] - 2025-09-09

#### Rilis Awal - Repositori Pembelajaran AZD yang Komprehensif

#### Ditambahkan
- **Struktur Dokumentasi Inti**
  - Seri panduan memulai yang lengkap
  - Dokumentasi penyebaran dan penyediaan yang komprehensif
  - Sumber daya pemecahan masalah dan panduan debugging yang terperinci
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

- **Modul Validasi Pra-penyebaran**
  - Perencanaan Kapasitas: Validasi ketersediaan sumber daya Azure
  - Pemilihan SKU: Panduan lengkap untuk tingkat layanan
  - Pemeriksaan Awal: Skrip validasi otomatis (PowerShell dan Bash)
  - Alat estimasi biaya dan perencanaan anggaran

- **Modul Pemecahan Masalah**
  - Masalah Umum: Masalah yang sering ditemui dan solusinya
  - Panduan Debugging: Metodologi pemecahan masalah yang sistematis
  - Teknik dan alat diagnostik tingkat lanjut
  - Pemantauan kinerja dan optimasi

- **Sumber Daya dan Referensi**
  - Lembar Cheat Perintah: Referensi cepat untuk perintah penting
  - Glosarium: Definisi terminologi dan akronim yang komprehensif
  - FAQ: Jawaban terperinci untuk pertanyaan umum
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
- **Cakupan Komprehensif**: Dari konsep dasar hingga pola perusahaan tingkat lanjut
- **Pendekatan Keamanan-First**: Praktik terbaik keamanan terintegrasi di seluruh materi
- **Optimasi Biaya**: Panduan untuk penyebaran hemat biaya dan manajemen sumber daya

#### Kualitas Dokumentasi
- **Contoh Kode Terperinci**: Contoh kode yang praktis dan telah diuji
- **Instruksi Langkah-demi-Langkah**: Panduan yang jelas dan dapat ditindaklanjuti
- **Penanganan Kesalahan yang Komprehensif**: Pemecahan masalah untuk masalah umum
- **Integrasi Praktik Terbaik**: Standar industri dan rekomendasi
- **Kompatibilitas Versi**: Selalu diperbarui dengan layanan Azure terbaru dan fitur azd

## Rencana Peningkatan di Masa Depan

### Versi 3.1.0 (Direncanakan)
#### Ekspansi Platform AI
- **Dukungan Multi-Model**: Pola integrasi untuk Hugging Face, Azure Machine Learning, dan model kustom
- **Kerangka Agen AI**: Template untuk LangChain, Semantic Kernel, dan AutoGen
- **Pola RAG Lanjutan**: Opsi basis data vektor di luar Azure AI Search (Pinecone, Weaviate, dll.)
- **Observabilitas AI**: Pemantauan yang ditingkatkan untuk kinerja model, penggunaan token, dan kualitas respons

#### Pengalaman Pengembang
- **Ekstensi VS Code**: Pengalaman pengembangan AZD + AI Foundry yang terintegrasi
- **Integrasi GitHub Copilot**: Pembuatan template AZD berbasis AI
- **Tutorial Interaktif**: Latihan pengkodean langsung dengan validasi otomatis untuk skenario AI
- **Konten Video**: Tutorial video tambahan untuk pembelajar visual yang berfokus pada penyebaran AI

### Versi 4.0.0 (Direncanakan)
#### Pola AI Perusahaan
- **Kerangka Tata Kelola**: Tata kelola model AI, kepatuhan, dan jejak audit
- **AI Multi-Tenant**: Pola untuk melayani banyak pelanggan dengan layanan AI terisolasi
- **Penyebaran AI di Edge**: Integrasi dengan Azure IoT Edge dan instans kontainer
- **AI Cloud Hybrid**: Pola penyebaran multi-cloud dan hybrid untuk beban kerja AI

#### Fitur Lanjutan
- **Otomatisasi Pipeline AI**: Integrasi MLOps dengan pipeline Azure Machine Learning
- **Keamanan Lanjutan**: Pola zero-trust, endpoint privat, dan perlindungan ancaman tingkat lanjut
- **Optimasi Kinerja**: Strategi penyetelan dan penskalaan tingkat lanjut untuk aplikasi AI dengan throughput tinggi
- **Distribusi Global**: Pola pengiriman konten dan caching di edge untuk aplikasi AI

### Versi 3.0.0 (Direncanakan) - Digantikan oleh Rilis Saat Ini
#### Penambahan yang Diusulkan - Kini Diimplementasikan di v3.0.0
- ✅ **Konten Berfokus pada AI**: Integrasi komprehensif Azure AI Foundry (Selesai)
- ✅ **Tutorial Interaktif**: Laboratorium workshop AI langsung (Selesai)
- ✅ **Modul Keamanan Lanjutan**: Pola keamanan khusus AI (Selesai)
- ✅ **Optimasi Kinerja**: Strategi penyetelan beban kerja AI (Selesai)

### Versi 2.1.0 (Direncanakan) - Sebagian Diimplementasikan di v3.0.0
#### Peningkatan Minor - Beberapa Selesai di Rilis Saat Ini
- ✅ **Contoh Tambahan**: Skenario penyebaran berfokus pada AI (Selesai)
- ✅ **FAQ Diperluas**: Pertanyaan dan pemecahan masalah khusus AI (Selesai)
- **Integrasi Alat**: Panduan integrasi IDE dan editor yang ditingkatkan
- ✅ **Ekspansi Pemantauan**: Pola pemantauan dan peringatan khusus AI (Selesai)

#### Masih Direncanakan untuk Rilis Mendatang
- **Dokumentasi Ramah Seluler**: Desain responsif untuk pembelajaran di perangkat seluler
- **Akses Offline**: Paket dokumentasi yang dapat diunduh
- **Integrasi IDE yang Ditingkatkan**: Ekstensi VS Code untuk alur kerja AZD + AI
- **Dasbor Komunitas**: Metode metrik komunitas real-time dan pelacakan kontribusi

## Berkontribusi pada Changelog

### Melaporkan Perubahan
Saat berkontribusi ke repositori ini, pastikan entri changelog mencakup:

1. **Nomor Versi**: Mengikuti versi semantik (major.minor.patch)
2. **Tanggal**: Tanggal rilis atau pembaruan dalam format YYYY-MM-DD
3. **Kategori**: Ditambahkan, Diubah, Dihapus, Diperbaiki, Keamanan
4. **Deskripsi Jelas**: Deskripsi singkat tentang apa yang berubah
5. **Penilaian Dampak**: Bagaimana perubahan memengaruhi pengguna yang ada

### Kategori Perubahan

#### Ditambahkan
- Fitur baru, bagian dokumentasi, atau kemampuan
- Contoh baru, template, atau sumber daya pembelajaran
- Alat, skrip, atau utilitas tambahan

#### Diubah
- Modifikasi pada fungsionalitas atau dokumentasi yang ada
- Pembaruan untuk meningkatkan kejelasan atau akurasi
- Restrukturisasi konten atau organisasi

#### Dihapus
- Fitur, dokumentasi, atau contoh yang tidak lagi relevan
- Informasi usang atau pendekatan yang sudah tidak digunakan
- Konten yang berlebihan atau telah digabungkan

#### Diperbaiki
- Koreksi kesalahan dalam dokumentasi atau kode
- Penyelesaian masalah atau masalah yang dilaporkan
- Peningkatan akurasi atau fungsionalitas

#### Keamanan
- Peningkatan atau perbaikan terkait keamanan
- Pembaruan praktik terbaik keamanan
- Penyelesaian kerentanan keamanan

### Pedoman Versi Semantik

#### Versi Utama (X.0.0)
- Perubahan besar yang memerlukan tindakan pengguna
- Restrukturisasi konten atau organisasi yang signifikan
- Perubahan yang mengubah pendekatan atau metodologi mendasar

#### Versi Minor (X.Y.0)
- Fitur baru atau penambahan konten
- Peningkatan yang tetap kompatibel ke belakang
- Contoh, alat, atau sumber daya tambahan

#### Versi Patch (X.Y.Z)
- Perbaikan bug dan koreksi
- Peningkatan kecil pada konten yang ada
- Klarifikasi dan peningkatan kecil

## Umpan Balik dan Saran Komunitas

Kami sangat mendorong umpan balik komunitas untuk meningkatkan sumber pembelajaran ini:

### Cara Memberikan Umpan Balik
- **GitHub Issues**: Laporkan masalah atau sarankan perbaikan (masalah khusus AI diterima)
- **Diskusi Discord**: Bagikan ide dan berinteraksi dengan komunitas Azure AI Foundry
- **Pull Requests**: Berkontribusi langsung pada perbaikan konten, terutama template dan panduan AI
- **Discord Azure AI Foundry**: Berpartisipasi di saluran #Azure untuk diskusi AZD + AI
- **Forum Komunitas**: Berpartisipasi dalam diskusi pengembang Azure yang lebih luas

### Kategori Umpan Balik
- **Akurasi Konten AI**: Koreksi untuk integrasi layanan AI dan informasi penyebaran
- **Pengalaman Belajar**: Saran untuk alur pembelajaran pengembang AI yang lebih baik
- **Konten AI yang Hilang**: Permintaan untuk template, pola, atau contoh AI tambahan
- **Aksesibilitas**: Peningkatan untuk kebutuhan pembelajaran yang beragam
- **Integrasi Alat AI**: Saran untuk integrasi alur kerja pengembangan AI yang lebih baik
- **Pola AI Produksi**: Permintaan pola penyebaran AI perusahaan

### Komitmen Respons
- **Respons Masalah**: Dalam 48 jam untuk masalah yang dilaporkan
- **Permintaan Fitur**: Evaluasi dalam satu minggu
- **Kontribusi Komunitas**: Tinjauan dalam satu minggu
- **Masalah Keamanan**: Prioritas langsung dengan respons yang dipercepat

## Jadwal Pemeliharaan

### Pembaruan Reguler
- **Tinjauan Bulanan**: Akurasi konten dan validasi tautan
- **Pembaruan Triwulanan**: Penambahan dan peningkatan konten utama
- **Tinjauan Setengah Tahunan**: Restrukturisasi dan peningkatan komprehensif
- **Rilis Tahunan**: Pembaruan versi utama dengan peningkatan signifikan

### Pemantauan dan Jaminan Kualitas
- **Pengujian Otomatis**: Validasi reguler untuk contoh kode dan tautan
- **Integrasi Umpan Balik Komunitas**: Penggabungan rutin saran pengguna
- **Pembaruan Teknologi**: Penyesuaian dengan layanan Azure terbaru dan rilis azd
- **Audit Aksesibilitas**: Tinjauan rutin untuk prinsip desain inklusif

## Kebijakan Dukungan Versi

### Dukungan Versi Saat Ini
- **Versi Utama Terbaru**: Dukungan penuh dengan pembaruan reguler
- **Versi Utama Sebelumnya**: Pembaruan keamanan dan perbaikan kritis selama 12 bulan
- **Versi Lama**: Hanya dukungan komunitas, tanpa pembaruan resmi

### Panduan Migrasi
Saat versi utama dirilis, kami menyediakan:
- **Panduan Migrasi**: Instruksi transisi langkah demi langkah
- **Catatan Kompatibilitas**: Detail tentang perubahan besar
- **Dukungan Alat**: Skrip atau utilitas untuk membantu migrasi
- **Dukungan Komunitas**: Forum khusus untuk pertanyaan migrasi

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Panduan Belajar](resources/study-guide.md)
- **Pelajaran Selanjutnya**: Kembali ke [README Utama](README.md)

**Tetap Terupdate**: Pantau repositori ini untuk pemberitahuan tentang rilis baru dan pembaruan penting pada materi pembelajaran.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk memberikan terjemahan yang akurat, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemah manusia profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau interpretasi yang salah yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->