<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "babd9fee2001054ecde767c9b1c85394",
  "translation_date": "2025-09-18T07:54:16+00:00",
  "source_file": "course-outline.md",
  "language_code": "id"
}
-->
## Struktur Pembelajaran 8 Bab

### Bab 1: Dasar & Mulai Cepat (30-45 menit) 🌱
**Prasyarat**: Langganan Azure, pengetahuan dasar command line  
**Tingkat Kesulitan**: ⭐

#### Apa yang Akan Anda Pelajari
- Memahami dasar-dasar Azure Developer CLI
- Menginstal AZD di platform Anda  
- Melakukan deployment pertama Anda dengan sukses
- Konsep inti dan terminologi

#### Sumber Belajar
- [Dasar-Dasar AZD](docs/getting-started/azd-basics.md) - Konsep inti
- [Instalasi & Pengaturan](docs/getting-started/installation.md) - Panduan spesifik platform
- [Proyek Pertama Anda](docs/getting-started/first-project.md) - Tutorial langsung
- [Lembar Cheat Command](resources/cheat-sheet.md) - Referensi cepat

#### Hasil Praktis
Berhasil melakukan deployment aplikasi web sederhana ke Azure menggunakan AZD

---

### Bab 2: Pengembangan Berbasis AI (1-2 jam) 🤖
**Prasyarat**: Bab 1 selesai  
**Tingkat Kesulitan**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Integrasi Azure AI Foundry dengan AZD
- Melakukan deployment aplikasi berbasis AI
- Memahami konfigurasi layanan AI
- Pola RAG (Retrieval-Augmented Generation)

#### Sumber Belajar
- [Integrasi Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- [Deployment Model AI](docs/ai-foundry/ai-model-deployment.md)
- [Lab Workshop AI](docs/ai-foundry/ai-workshop-lab.md) - Lab langsung
- [Template Azure AI Foundry](README.md#featured-azure-ai-foundry-templates)

#### Hasil Praktis
Melakukan deployment dan konfigurasi aplikasi chat berbasis AI dengan kemampuan RAG

---

### Bab 3: Konfigurasi & Autentikasi (45-60 menit) ⚙️
**Prasyarat**: Bab 1 selesai  
**Tingkat Kesulitan**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Konfigurasi dan manajemen lingkungan
- Praktik terbaik untuk autentikasi dan keamanan
- Penamaan dan pengorganisasian sumber daya
- Deployment multi-lingkungan

#### Sumber Belajar
- [Panduan Konfigurasi](docs/getting-started/configuration.md) - Pengaturan lingkungan
- Pola keamanan dan identitas terkelola
- Contoh multi-lingkungan

#### Hasil Praktis
Mengelola beberapa lingkungan dengan autentikasi dan keamanan yang tepat

---

### Bab 4: Infrastruktur sebagai Kode & Deployment (1-1,5 jam) 🏗️
**Prasyarat**: Bab 1-3 selesai  
**Tingkat Kesulitan**: ⭐⭐⭐

#### Apa yang Akan Anda Pelajari
- Pola deployment tingkat lanjut
- Infrastruktur sebagai Kode dengan Bicep
- Strategi penyediaan sumber daya
- Pembuatan template kustom

#### Sumber Belajar
- [Panduan Deployment](docs/deployment/deployment-guide.md) - Alur kerja lengkap
- [Penyediaan Sumber Daya](docs/deployment/provisioning.md) - Manajemen sumber daya
- Contoh kontainer dan microservices

#### Hasil Praktis
Melakukan deployment aplikasi multi-layanan yang kompleks menggunakan template infrastruktur kustom

---

### Bab 5: Solusi AI Multi-Agen (2-3 jam) 🤖🤖
**Prasyarat**: Bab 1-2 selesai  
**Tingkat Kesulitan**: ⭐⭐⭐⭐

#### Apa yang Akan Anda Pelajari
- Pola arsitektur multi-agen
- Orkestrasi dan koordinasi agen
- Deployment AI siap produksi
- Implementasi agen Pelanggan dan Inventaris

#### Sumber Belajar
- [Solusi Multi-Agen Ritel](examples/retail-scenario.md) - Implementasi lengkap
- [Paket Template ARM](../../examples/retail-multiagent-arm-template) - Deployment satu klik
- Pola koordinasi multi-agen

#### Hasil Praktis
Melakukan deployment dan mengelola solusi AI multi-agen yang siap produksi

---

### Bab 6: Validasi & Perencanaan Pra-Deployment (1 jam) 🔍
**Prasyarat**: Bab 4 selesai  
**Tingkat Kesulitan**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Perencanaan kapasitas dan validasi sumber daya
- Strategi pemilihan SKU
- Pemeriksaan awal otomatisasi
- Perencanaan optimasi biaya

#### Sumber Belajar
- [Perencanaan Kapasitas](docs/pre-deployment/capacity-planning.md) - Validasi sumber daya
- [Pemilihan SKU](docs/pre-deployment/sku-selection.md) - Pilihan hemat biaya
- [Pemeriksaan Awal](docs/pre-deployment/preflight-checks.md) - Skrip otomatis

#### Hasil Praktis
Memvalidasi dan mengoptimalkan deployment sebelum eksekusi

---

### Bab 7: Pemecahan Masalah & Debugging (1-1,5 jam) 🔧
**Prasyarat**: Bab deployment mana pun selesai  
**Tingkat Kesulitan**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Pendekatan debugging yang sistematis
- Masalah umum dan solusinya
- Pemecahan masalah spesifik AI
- Optimasi kinerja

#### Sumber Belajar
- [Masalah Umum](docs/troubleshooting/common-issues.md) - FAQ dan solusi
- [Panduan Debugging](docs/troubleshooting/debugging.md) - Strategi langkah demi langkah
- [Pemecahan Masalah AI](docs/troubleshooting/ai-troubleshooting.md) - Masalah layanan AI

#### Hasil Praktis
Mendiagnosis dan menyelesaikan masalah deployment secara mandiri

---

### Bab 8: Pola Produksi & Perusahaan (2-3 jam) 🏢
**Prasyarat**: Bab 1-4 selesai  
**Tingkat Kesulitan**: ⭐⭐⭐⭐

#### Apa yang Akan Anda Pelajari
- Strategi deployment produksi
- Pola keamanan perusahaan
- Pemantauan dan optimasi biaya
- Skalabilitas dan tata kelola

#### Sumber Belajar
- [Praktik Terbaik AI Produksi](docs/ai-foundry/production-ai-practices.md) - Pola perusahaan
- Contoh microservices dan perusahaan
- Kerangka kerja pemantauan dan tata kelola

#### Hasil Praktis
Melakukan deployment aplikasi siap perusahaan dengan kemampuan produksi penuh

---

## Progres Pembelajaran dan Tingkat Kesulitan

### Pembangunan Keterampilan Bertahap

- **🌱 Pemula**: Mulai dari Bab 1 (Dasar) → Bab 2 (Pengembangan AI)
- **🔧 Menengah**: Bab 3-4 (Konfigurasi & Infrastruktur) → Bab 6 (Validasi)
- **🚀 Lanjutan**: Bab 5 (Solusi Multi-Agen) → Bab 7 (Pemecahan Masalah)
- **🏢 Perusahaan**: Selesaikan semua bab, fokus pada Bab 8 (Pola Produksi)

### Indikator Tingkat Kesulitan

- **⭐ Dasar**: Konsep tunggal, tutorial terpandu, 30-60 menit
- **⭐⭐ Menengah**: Beberapa konsep, latihan langsung, 1-2 jam  
- **⭐⭐⭐ Lanjutan**: Arsitektur kompleks, solusi kustom, 1-3 jam
- **⭐⭐⭐⭐ Ahli**: Sistem produksi, pola perusahaan, 2-4 jam

### Jalur Pembelajaran Fleksibel

#### 🎯 Jalur Cepat Pengembang AI (4-6 jam)
1. **Bab 1**: Dasar & Mulai Cepat (45 menit)
2. **Bab 2**: Pengembangan Berbasis AI (2 jam)  
3. **Bab 5**: Solusi AI Multi-Agen (3 jam)
4. **Bab 8**: Praktik Terbaik AI Produksi (1 jam)

#### 🛠️ Jalur Spesialis Infrastruktur (5-7 jam)
1. **Bab 1**: Dasar & Mulai Cepat (45 menit)
2. **Bab 3**: Konfigurasi & Autentikasi (1 jam)
3. **Bab 4**: Infrastruktur sebagai Kode & Deployment (1,5 jam)
4. **Bab 6**: Validasi & Perencanaan Pra-Deployment (1 jam)
5. **Bab 7**: Pemecahan Masalah & Debugging (1,5 jam)
6. **Bab 8**: Pola Produksi & Perusahaan (2 jam)

#### 🎓 Perjalanan Belajar Lengkap (8-12 jam)
Penyelesaian semua 8 bab secara berurutan dengan latihan langsung dan validasi

## Kerangka Penyelesaian Kursus

### Validasi Pengetahuan
- **Checkpoint Bab**: Latihan praktis dengan hasil yang terukur
- **Verifikasi Langsung**: Deployment solusi yang berfungsi untuk setiap bab
- **Pelacakan Progres**: Indikator visual dan lencana penyelesaian
- **Validasi Komunitas**: Berbagi pengalaman di saluran Discord Azure

### Penilaian Hasil Pembelajaran

#### Penyelesaian Bab 1-2 (Dasar + AI)
- ✅ Melakukan deployment aplikasi web dasar menggunakan AZD
- ✅ Melakukan deployment aplikasi chat berbasis AI dengan RAG
- ✅ Memahami konsep inti AZD dan integrasi AI

#### Penyelesaian Bab 3-4 (Konfigurasi + Infrastruktur)  
- ✅ Mengelola deployment multi-lingkungan
- ✅ Membuat template infrastruktur Bicep kustom
- ✅ Menerapkan pola autentikasi yang aman

#### Penyelesaian Bab 5-6 (Multi-Agen + Validasi)
- ✅ Melakukan deployment solusi AI multi-agen yang kompleks
- ✅ Melakukan perencanaan kapasitas dan optimasi biaya
- ✅ Menerapkan validasi pra-deployment otomatis

#### Penyelesaian Bab 7-8 (Pemecahan Masalah + Produksi)
- ✅ Memecahkan masalah deployment secara mandiri  
- ✅ Menerapkan pemantauan dan keamanan tingkat perusahaan
- ✅ Melakukan deployment aplikasi siap produksi dengan tata kelola

### Sertifikasi dan Pengakuan
- **Lencana Penyelesaian Kursus**: Selesaikan semua 8 bab dengan validasi praktis
- **Pengakuan Komunitas**: Partisipasi aktif di Discord Azure AI Foundry
- **Pengembangan Profesional**: Keterampilan deployment AZD dan AI yang relevan dengan industri
- **Kemajuan Karier**: Kemampuan deployment cloud siap perusahaan

## Kesesuaian Konten untuk Pengembang Modern

### Kedalaman dan Cakupan Teknis
- **Integrasi Azure OpenAI**: Cakupan lengkap GPT-4o, embeddings, dan deployment multi-model
- **Pola Arsitektur AI**: Implementasi RAG, orkestrasi multi-agen, dan alur kerja AI produksi
- **Infrastruktur sebagai Kode**: Template Bicep, deployment ARM, dan penyediaan otomatis
- **Kesiapan Produksi**: Keamanan, skalabilitas, pemantauan, optimasi biaya, dan tata kelola
- **Pola Perusahaan**: Deployment multi-lingkungan, integrasi CI/CD, dan kerangka kerja kepatuhan

### Fokus Pembelajaran Praktis
- **Otomasi Deployment**: Penekanan pada alur kerja AZD langsung, bukan konsep teoretis
- **Skenario Dunia Nyata**: Solusi multi-agen ritel lengkap dengan agen Pelanggan dan Inventaris
- **Contoh Produksi**: Paket template ARM, deployment satu klik, dan pola perusahaan
- **Keterampilan Pemecahan Masalah**: Debugging spesifik AI, diagnostik multi-layanan, dan optimasi kinerja
- **Relevansi Industri**: Berdasarkan umpan balik komunitas Azure AI Foundry dan kebutuhan perusahaan

### Integrasi Komunitas dan Dukungan
- **Integrasi Discord**: Partisipasi aktif di komunitas Azure AI Foundry dan Microsoft Azure
- **Diskusi GitHub**: Pembelajaran kolaboratif dan pemecahan masalah dengan rekan dan ahli
- **Akses ke Ahli**: Koneksi langsung dengan insinyur Microsoft dan spesialis deployment AI
- **Pembaruan Berkelanjutan**: Konten kursus berkembang sesuai pembaruan platform Azure dan umpan balik komunitas
- **Pengembangan Karier**: Keterampilan yang langsung dapat diterapkan pada peran pengembangan cloud dan AI modern

### Validasi Hasil Pembelajaran
- **Keterampilan Terukur**: Setiap bab mencakup latihan deployment praktis dengan hasil yang dapat diverifikasi
- **Pengembangan Portofolio**: Proyek lengkap yang cocok untuk portofolio profesional dan wawancara kerja
- **Pengakuan Industri**: Keterampilan selaras dengan permintaan pasar kerja saat ini untuk AZD dan keahlian deployment AI
- **Jaringan Profesional**: Akses ke komunitas pengembang Azure untuk kemajuan karier dan kolaborasi

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk memberikan hasil yang akurat, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.