# Panduan Belajar - Tujuan Pembelajaran Komprehensif

**Navigasi Jalur Pembelajaran**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Mulai Belajar**: [Bab 1: Dasar & Panduan Cepat](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Pelacakan Kemajuan**: [Penyelesaian Kursus](../README.md#-course-completion--certification)

## Pendahuluan

Panduan belajar komprehensif ini menyediakan tujuan pembelajaran yang terstruktur, konsep utama, latihan praktik, dan materi penilaian untuk membantu Anda menguasai Azure Developer CLI (azd). Gunakan panduan ini untuk melacak kemajuan Anda dan memastikan Anda telah mencakup semua topik penting.

## Tujuan Pembelajaran

Dengan menyelesaikan panduan belajar ini, Anda akan:
- Menguasai semua konsep dasar dan lanjutan dari Azure Developer CLI
- Mengembangkan keterampilan praktis dalam menerapkan dan mengelola aplikasi Azure
- Membangun kepercayaan diri dalam memecahkan masalah dan mengoptimalkan penerapan
- Memahami praktik penerapan siap produksi dan pertimbangan keamanan

## Hasil Pembelajaran

Setelah menyelesaikan semua bagian dari panduan belajar ini, Anda akan dapat:
- Merancang, menerapkan, dan mengelola arsitektur aplikasi lengkap menggunakan azd
- Menerapkan strategi pemantauan, keamanan, dan optimasi biaya yang komprehensif
- Memecahkan masalah penerapan yang kompleks secara mandiri
- Membuat template khusus dan berkontribusi pada komunitas azd

## Struktur Pembelajaran 8 Bab

### Bab 1: Dasar & Panduan Cepat (Minggu 1)
**Durasi**: 30-45 menit | **Kompleksitas**: ⭐

#### Tujuan Pembelajaran
- Memahami konsep inti dan terminologi Azure Developer CLI
- Berhasil menginstal dan mengonfigurasi AZD di platform pengembangan Anda
- Menerapkan aplikasi pertama Anda menggunakan template yang ada
- Menavigasi antarmuka baris perintah AZD dengan efektif

#### Konsep Utama yang Harus Dikuasai
- Struktur proyek AZD dan komponennya (azure.yaml, infra/, src/)
- Alur kerja penerapan berbasis template
- Dasar konfigurasi lingkungan
- Pengelolaan grup sumber daya dan langganan

#### Latihan Praktik
1. **Verifikasi Instalasi**: Instal AZD dan verifikasi dengan `azd version`
2. **Penerapan Pertama**: Berhasil menerapkan template todo-nodejs-mongo
3. **Pengaturan Lingkungan**: Konfigurasikan variabel lingkungan pertama Anda
4. **Eksplorasi Sumber Daya**: Menavigasi sumber daya yang diterapkan di Azure Portal

#### Pertanyaan Penilaian
- Apa saja komponen inti dari proyek AZD?
- Bagaimana cara menginisialisasi proyek baru dari template?
- Apa perbedaan antara `azd up` dan `azd deploy`?
- Bagaimana cara mengelola beberapa lingkungan dengan AZD?

---

### Bab 2: Pengembangan Berbasis AI (Minggu 2)
**Durasi**: 1-2 jam | **Kompleksitas**: ⭐⭐

#### Tujuan Pembelajaran
- Mengintegrasikan layanan Microsoft Foundry dengan alur kerja AZD
- Menerapkan dan mengonfigurasi aplikasi berbasis AI
- Memahami pola implementasi RAG (Retrieval-Augmented Generation)
- Mengelola penerapan model AI dan skalabilitasnya

#### Konsep Utama yang Harus Dikuasai
- Integrasi layanan Azure OpenAI dan pengelolaan API
- Konfigurasi pencarian AI dan pengindeksan vektor
- Strategi penerapan model dan perencanaan kapasitas
- Pemantauan aplikasi AI dan optimasi kinerja

#### Latihan Praktik
1. **Penerapan Chat AI**: Terapkan template azure-search-openai-demo
2. **Implementasi RAG**: Konfigurasikan pengindeksan dan pengambilan dokumen
3. **Konfigurasi Model**: Atur beberapa model AI dengan tujuan berbeda
4. **Pemantauan AI**: Terapkan Application Insights untuk beban kerja AI

#### Pertanyaan Penilaian
- Bagaimana cara mengonfigurasi layanan Azure OpenAI dalam template AZD?
- Apa saja komponen utama dari arsitektur RAG?
- Bagaimana cara mengelola kapasitas dan skalabilitas model AI?
- Apa metrik pemantauan yang penting untuk aplikasi AI?

---

### Bab 3: Konfigurasi & Autentikasi (Minggu 3)
**Durasi**: 45-60 menit | **Kompleksitas**: ⭐⭐

#### Tujuan Pembelajaran
- Menguasai strategi konfigurasi dan pengelolaan lingkungan
- Menerapkan pola autentikasi yang aman dan identitas terkelola
- Mengorganisasi sumber daya dengan konvensi penamaan yang tepat
- Mengonfigurasi penerapan multi-lingkungan (dev, staging, prod)

#### Konsep Utama yang Harus Dikuasai
- Hierarki lingkungan dan prioritas konfigurasi
- Autentikasi identitas terkelola dan service principal
- Integrasi Key Vault untuk pengelolaan rahasia
- Pengelolaan parameter spesifik lingkungan

#### Latihan Praktik
1. **Pengaturan Multi-Lingkungan**: Konfigurasikan lingkungan dev, staging, dan prod
2. **Konfigurasi Keamanan**: Terapkan autentikasi identitas terkelola
3. **Pengelolaan Rahasia**: Integrasikan Azure Key Vault untuk data sensitif
4. **Pengelolaan Parameter**: Buat konfigurasi spesifik lingkungan

#### Pertanyaan Penilaian
- Bagaimana cara mengonfigurasi lingkungan yang berbeda dengan AZD?
- Apa manfaat menggunakan identitas terkelola dibandingkan service principal?
- Bagaimana cara mengelola rahasia aplikasi dengan aman?
- Apa hierarki konfigurasi dalam AZD?

---

### Bab 4: Infrastruktur sebagai Kode & Penerapan (Minggu 4-5)
**Durasi**: 1-1,5 jam | **Kompleksitas**: ⭐⭐⭐

#### Tujuan Pembelajaran
- Membuat dan menyesuaikan template infrastruktur Bicep
- Menerapkan pola dan alur kerja penerapan yang canggih
- Memahami strategi penyediaan sumber daya
- Merancang arsitektur multi-layanan yang skalabel

- Menerapkan aplikasi berbasis kontainer menggunakan Azure Container Apps dan AZD

#### Konsep Utama yang Harus Dikuasai
- Struktur template Bicep dan praktik terbaik
- Ketergantungan sumber daya dan urutan penerapan
- File parameter dan modularitas template
- Hook khusus dan otomatisasi penerapan
- Pola penerapan aplikasi kontainer (panduan cepat, produksi, mikroservis)

#### Latihan Praktik
1. **Pembuatan Template Khusus**: Bangun template aplikasi multi-layanan
2. **Penguasaan Bicep**: Buat komponen infrastruktur modular yang dapat digunakan kembali
3. **Otomatisasi Penerapan**: Terapkan hook pra/pasca penerapan
4. **Desain Arsitektur**: Terapkan arsitektur mikroservis yang kompleks
5. **Penerapan Aplikasi Kontainer**: Terapkan contoh [Simple Flask API](../../../examples/container-app/simple-flask-api) dan [Microservices Architecture](../../../examples/container-app/microservices) menggunakan AZD

#### Pertanyaan Penilaian
- Bagaimana cara membuat template Bicep khusus untuk AZD?
- Apa praktik terbaik untuk mengorganisasi kode infrastruktur?
- Bagaimana cara menangani ketergantungan sumber daya dalam template?
- Pola penerapan apa yang mendukung pembaruan tanpa downtime?

---

### Bab 5: Solusi AI Multi-Agent (Minggu 6-7)
**Durasi**: 2-3 jam | **Kompleksitas**: ⭐⭐⭐⭐

#### Tujuan Pembelajaran
- Merancang dan menerapkan arsitektur AI multi-agent
- Mengatur koordinasi dan komunikasi antar agen
- Menerapkan solusi AI siap produksi dengan pemantauan
- Memahami spesialisasi agen dan pola alur kerja
- Mengintegrasikan mikroservis berbasis kontainer sebagai bagian dari solusi multi-agent

#### Konsep Utama yang Harus Dikuasai
- Pola arsitektur multi-agent dan prinsip desain
- Protokol komunikasi agen dan aliran data
- Strategi penyeimbangan beban dan skalabilitas untuk agen AI
- Pemantauan produksi untuk sistem multi-agent
- Komunikasi antar layanan dalam lingkungan berbasis kontainer

#### Latihan Praktik
1. **Penerapan Solusi Ritel**: Terapkan skenario ritel multi-agent lengkap
2. **Kustomisasi Agen**: Modifikasi perilaku agen Pelanggan dan Inventaris
3. **Skalabilitas Arsitektur**: Terapkan penyeimbangan beban dan auto-scaling
4. **Pemantauan Produksi**: Atur pemantauan dan peringatan yang komprehensif
5. **Integrasi Mikroservis**: Perluas contoh [Microservices Architecture](../../../examples/container-app/microservices) untuk mendukung alur kerja berbasis agen

#### Pertanyaan Penilaian
- Bagaimana cara merancang pola komunikasi multi-agent yang efektif?
- Apa pertimbangan utama untuk skalabilitas beban kerja agen AI?
- Bagaimana cara memantau dan memperbaiki sistem AI multi-agent?
- Pola produksi apa yang memastikan keandalan untuk agen AI?

---

### Bab 6: Validasi & Perencanaan Pra-Penerapan (Minggu 8)
**Durasi**: 1 jam | **Kompleksitas**: ⭐⭐

#### Tujuan Pembelajaran
- Melakukan perencanaan kapasitas dan validasi sumber daya yang komprehensif
- Memilih SKU Azure yang optimal untuk efektivitas biaya
- Menerapkan pemeriksaan pra-penerapan otomatis dan validasi
- Merencanakan penerapan dengan strategi optimasi biaya

#### Konsep Utama yang Harus Dikuasai
- Kuota sumber daya Azure dan batas kapasitas
- Kriteria pemilihan SKU dan optimasi biaya
- Skrip validasi otomatis dan pengujian
- Perencanaan penerapan dan penilaian risiko

#### Latihan Praktik
1. **Analisis Kapasitas**: Analisis kebutuhan sumber daya untuk aplikasi Anda
2. **Optimasi SKU**: Bandingkan dan pilih tingkat layanan yang hemat biaya
3. **Otomasi Validasi**: Terapkan skrip pemeriksaan pra-penerapan
4. **Perencanaan Biaya**: Buat estimasi biaya penerapan dan anggaran

#### Pertanyaan Penilaian
- Bagaimana cara memvalidasi kapasitas Azure sebelum penerapan?
- Faktor apa yang memengaruhi keputusan pemilihan SKU?
- Bagaimana cara mengotomasi validasi pra-penerapan?
- Strategi apa yang membantu mengoptimalkan biaya penerapan?

---

### Bab 7: Pemecahan Masalah & Debugging (Minggu 9)
**Durasi**: 1-1,5 jam | **Kompleksitas**: ⭐⭐

#### Tujuan Pembelajaran
- Mengembangkan pendekatan debugging yang sistematis untuk penerapan AZD
- Menyelesaikan masalah penerapan dan konfigurasi umum
- Debugging masalah spesifik AI dan masalah kinerja
- Menerapkan pemantauan dan peringatan untuk deteksi masalah secara proaktif

#### Konsep Utama yang Harus Dikuasai
- Teknik diagnostik dan strategi logging
- Pola kegagalan umum dan solusinya
- Pemantauan kinerja dan optimasi
- Prosedur respons insiden dan pemulihan

#### Latihan Praktik
1. **Keterampilan Diagnostik**: Latihan dengan penerapan yang sengaja rusak
2. **Analisis Log**: Gunakan Azure Monitor dan Application Insights secara efektif
3. **Penyetelan Kinerja**: Optimalkan aplikasi yang berkinerja lambat
4. **Prosedur Pemulihan**: Terapkan cadangan dan pemulihan bencana

#### Pertanyaan Penilaian
- Apa saja kegagalan penerapan AZD yang paling umum?
- Bagaimana cara debugging masalah autentikasi dan izin?
- Strategi pemantauan apa yang membantu mencegah masalah produksi?
- Bagaimana cara mengoptimalkan kinerja aplikasi di Azure?

---

### Bab 8: Pola Produksi & Perusahaan (Minggu 10-11)
**Durasi**: 2-3 jam | **Kompleksitas**: ⭐⭐⭐⭐

#### Tujuan Pembelajaran
- Menerapkan strategi penerapan tingkat perusahaan
- Merancang pola keamanan dan kerangka kerja kepatuhan
- Membangun pemantauan, tata kelola, dan pengelolaan biaya
- Membuat pipeline CI/CD yang skalabel dengan integrasi AZD
- Menerapkan praktik terbaik untuk penerapan aplikasi kontainer produksi (keamanan, pemantauan, biaya, CI/CD)

#### Konsep Utama yang Harus Dikuasai
- Persyaratan keamanan dan kepatuhan tingkat perusahaan
- Kerangka kerja tata kelola dan implementasi kebijakan
- Pemantauan lanjutan dan pengelolaan biaya
- Integrasi CI/CD dan pipeline penerapan otomatis
- Strategi penerapan blue-green dan canary untuk beban kerja berbasis kontainer

#### Latihan Praktik
1. **Keamanan Perusahaan**: Terapkan pola keamanan yang komprehensif
2. **Kerangka Kerja Tata Kelola**: Atur Azure Policy dan pengelolaan sumber daya
3. **Pemantauan Lanjutan**: Buat dasbor dan peringatan otomatis
4. **Integrasi CI/CD**: Bangun pipeline penerapan otomatis
5. **Aplikasi Kontainer Produksi**: Terapkan keamanan, pemantauan, dan optimasi biaya pada contoh [Microservices Architecture](../../../examples/container-app/microservices)

#### Pertanyaan Penilaian
- Bagaimana cara menerapkan keamanan tingkat perusahaan dalam penerapan AZD?
- Pola tata kelola apa yang memastikan kepatuhan dan pengendalian biaya?
- Bagaimana cara merancang pemantauan yang skalabel untuk sistem produksi?
- Pola CI/CD apa yang paling cocok dengan alur kerja AZD?

#### Tujuan Pembelajaran
- Memahami dasar-dasar dan konsep inti Azure Developer CLI
- Berhasil menginstal dan mengonfigurasi azd di lingkungan pengembangan Anda
- Menyelesaikan penerapan pertama Anda menggunakan template yang ada
- Menavigasi struktur proyek azd dan memahami komponen utama

#### Konsep Utama yang Harus Dikuasai
- Template, lingkungan, dan layanan
- Struktur konfigurasi azure.yaml
- Perintah dasar azd (init, up, down, deploy)
- Prinsip Infrastruktur sebagai Kode
- Autentikasi dan otorisasi Azure

#### Latihan Praktik

**Latihan 1.1: Instalasi dan Pengaturan**
```bash
# Selesaikan tugas-tugas ini:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Latihan 1.2: Penerapan Pertama**
```bash
# Sebarkan aplikasi web sederhana:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Latihan 1.3: Analisis Struktur Proyek**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Pertanyaan Penilaian Diri
1. Apa saja tiga konsep inti dari arsitektur azd?
2. Apa tujuan dari file azure.yaml?
3. Bagaimana lingkungan membantu mengelola target penerapan yang berbeda?
4. Metode autentikasi apa yang dapat digunakan dengan azd?
5. Apa yang terjadi saat Anda menjalankan `azd up` untuk pertama kalinya?

---

## Pelacakan Kemajuan dan Kerangka Penilaian
```bash
# Buat dan konfigurasikan beberapa lingkungan:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Latihan 2.2: Konfigurasi Lanjutan**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Latihan 2.3: Konfigurasi Keamanan**
```bash
# Terapkan praktik terbaik keamanan:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Pertanyaan Penilaian Diri
1. Bagaimana azd menangani prioritas variabel lingkungan?
2. Apa itu deployment hooks dan kapan sebaiknya digunakan?
3. Bagaimana cara mengonfigurasi SKU yang berbeda untuk lingkungan yang berbeda?
4. Apa implikasi keamanan dari metode autentikasi yang berbeda?
5. Bagaimana cara mengelola rahasia dan data konfigurasi sensitif?

### Modul 3: Penerapan dan Penyediaan (Minggu 4)

#### Tujuan Pembelajaran
- Menguasai alur kerja penerapan dan praktik terbaik
- Memahami Infrastruktur sebagai Kode dengan template Bicep
- Menerapkan arsitektur multi-layanan yang kompleks
- Mengoptimalkan kinerja dan keandalan penerapan

#### Konsep Utama yang Harus Dikuasai
- Struktur template Bicep dan modul
- Ketergantungan sumber daya dan urutan
- Strategi penerapan (blue-green, rolling updates)
- Penerapan multi-region
- Migrasi database dan pengelolaan data

#### Latihan Praktik

**Latihan 3.1: Infrastruktur Khusus**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Latihan 3.2: Aplikasi Multi-Layanan**
```bash
# Terapkan arsitektur mikroservis:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Latihan 3.3: Integrasi Database**
```bash
# Menerapkan pola penerapan basis data:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Pertanyaan Penilaian Diri
1. Apa keuntungan menggunakan Bicep dibandingkan template ARM?
2. Bagaimana cara menangani migrasi database dalam penerapan azd?
3. Strategi apa yang ada untuk penerapan tanpa downtime?
4. Bagaimana cara mengelola ketergantungan antar layanan?
5. Apa saja pertimbangan untuk penerapan multi-region?

### Modul 4: Validasi Pra-Penerapan (Minggu 5)

#### Tujuan Pembelajaran
- Melakukan pemeriksaan pra-penerapan yang komprehensif
- Menguasai perencanaan kapasitas dan validasi sumber daya
- Memahami pemilihan SKU dan optimasi biaya
- Membangun pipeline validasi otomatis

#### Konsep Utama yang Harus Dikuasai
- Kuota dan batas sumber daya Azure
- Kriteria pemilihan SKU dan dampak biaya
- Skrip dan alat validasi otomatis
- Metodologi perencanaan kapasitas
- Pengujian dan optimasi kinerja

#### Latihan Praktik

**Latihan 4.1: Perencanaan Kapasitas**
```bash
# Implementasi validasi kapasitas:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Latihan 4.2: Validasi Pra-Penerbangan**
```powershell
# Bangun pipeline validasi yang komprehensif:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Latihan 4.3: Optimasi SKU**
```bash
# Optimalkan konfigurasi layanan:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Pertanyaan Penilaian Diri
1. Faktor apa saja yang memengaruhi keputusan pemilihan SKU?
2. Bagaimana cara memvalidasi ketersediaan sumber daya Azure sebelum penerapan?
3. Apa saja komponen utama dari sistem pemeriksaan pra-penerbangan?
4. Bagaimana cara memperkirakan dan mengontrol biaya penerapan?
5. Pemantauan apa yang penting untuk perencanaan kapasitas?

### Modul 5: Pemecahan Masalah dan Debugging (Minggu 6)

#### Tujuan Pembelajaran
- Menguasai metodologi pemecahan masalah secara sistematis
- Mengembangkan keahlian dalam debugging masalah penerapan yang kompleks
- Menerapkan pemantauan dan pemberitahuan yang komprehensif
- Membangun prosedur respons dan pemulihan insiden

#### Konsep Utama yang Harus Dikuasai
- Pola kegagalan penerapan yang umum
- Teknik analisis dan korelasi log
- Pemantauan dan optimasi kinerja
- Deteksi dan respons insiden keamanan
- Pemulihan bencana dan kelangsungan bisnis

#### Latihan Praktik

**Latihan 5.1: Skenario Pemecahan Masalah**
```bash
# Latihan menyelesaikan masalah umum:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Latihan 5.2: Implementasi Pemantauan**
```bash
# Siapkan pemantauan yang komprehensif:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Latihan 5.3: Respons Insiden**
```bash
# Bangun prosedur tanggapan insiden:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Pertanyaan Penilaian Diri
1. Apa pendekatan sistematis untuk pemecahan masalah penerapan azd?
2. Bagaimana cara mengkorelasikan log di berbagai layanan dan sumber daya?
3. Metrik pemantauan apa yang paling penting untuk deteksi masalah dini?
4. Bagaimana cara menerapkan prosedur pemulihan bencana yang efektif?
5. Apa saja komponen utama dari rencana respons insiden?

### Modul 6: Topik Lanjutan dan Praktik Terbaik (Minggu 7-8)

#### Tujuan Pembelajaran
- Menerapkan pola penerapan tingkat perusahaan
- Menguasai integrasi dan otomatisasi CI/CD
- Mengembangkan template khusus dan berkontribusi pada komunitas
- Memahami persyaratan keamanan dan kepatuhan tingkat lanjut

#### Konsep Utama yang Harus Dikuasai
- Pola integrasi pipeline CI/CD
- Pengembangan dan distribusi template khusus
- Tata kelola dan kepatuhan perusahaan
- Konfigurasi jaringan dan keamanan tingkat lanjut
- Optimasi kinerja dan manajemen biaya

#### Latihan Praktik

**Latihan 6.1: Integrasi CI/CD**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Latihan 6.2: Pengembangan Template Khusus**
```bash
# Buat dan publikasikan template khusus:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Latihan 6.3: Implementasi Perusahaan**
```bash
# Mengimplementasikan fitur tingkat perusahaan:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Pertanyaan Penilaian Diri
1. Bagaimana cara mengintegrasikan azd ke dalam alur kerja CI/CD yang ada?
2. Apa saja pertimbangan utama untuk pengembangan template khusus?
3. Bagaimana cara menerapkan tata kelola dan kepatuhan dalam penerapan azd?
4. Apa saja praktik terbaik untuk penerapan skala perusahaan?
5. Bagaimana cara berkontribusi secara efektif ke komunitas azd?

## Proyek Praktis

### Proyek 1: Situs Web Portofolio Pribadi
**Kompleksitas**: Pemula  
**Durasi**: 1-2 minggu

Bangun dan terapkan situs web portofolio pribadi menggunakan:
- Hosting situs web statis di Azure Storage
- Konfigurasi domain khusus
- Integrasi CDN untuk kinerja global
- Pipeline penerapan otomatis

**Hasil**:
- Situs web yang berfungsi diterapkan di Azure
- Template azd khusus untuk penerapan portofolio
- Dokumentasi proses penerapan
- Rekomendasi analisis dan optimasi biaya

### Proyek 2: Aplikasi Manajemen Tugas
**Kompleksitas**: Menengah  
**Durasi**: 2-3 minggu

Buat aplikasi manajemen tugas full-stack dengan:
- Frontend React yang diterapkan ke App Service
- Backend API Node.js dengan autentikasi
- Basis data PostgreSQL dengan migrasi
- Pemantauan Application Insights

**Hasil**:
- Aplikasi lengkap dengan autentikasi pengguna
- Skema basis data dan skrip migrasi
- Dasbor pemantauan dan aturan pemberitahuan
- Konfigurasi penerapan multi-lingkungan

### Proyek 3: Platform E-commerce Berbasis Microservices
**Kompleksitas**: Lanjutan  
**Durasi**: 4-6 minggu

Rancang dan terapkan platform e-commerce berbasis microservices:
- Beberapa layanan API (katalog, pesanan, pembayaran, pengguna)
- Integrasi antrian pesan dengan Service Bus
- Cache Redis untuk optimasi kinerja
- Logging dan pemantauan yang komprehensif

**Contoh Referensi**: Lihat [Arsitektur Microservices](../../../examples/container-app/microservices) untuk template siap produksi dan panduan penerapan

**Hasil**:
- Arsitektur microservices lengkap
- Pola komunikasi antar layanan
- Pengujian dan optimasi kinerja
- Implementasi keamanan siap produksi

## Penilaian dan Sertifikasi

### Pemeriksaan Pengetahuan

Selesaikan penilaian ini setelah setiap modul:

**Penilaian Modul 1**: Konsep dasar dan instalasi
- Pertanyaan pilihan ganda tentang konsep inti
- Tugas instalasi dan konfigurasi praktis
- Latihan penerapan sederhana

**Penilaian Modul 2**: Konfigurasi dan lingkungan
- Skenario manajemen lingkungan
- Latihan pemecahan masalah konfigurasi
- Implementasi konfigurasi keamanan

**Penilaian Modul 3**: Penerapan dan penyediaan
- Tantangan desain infrastruktur
- Skenario penerapan multi-layanan
- Latihan optimasi kinerja

**Penilaian Modul 4**: Validasi pra-penerapan
- Studi kasus perencanaan kapasitas
- Skenario optimasi biaya
- Implementasi pipeline validasi

**Penilaian Modul 5**: Pemecahan masalah dan debugging
- Latihan diagnosis masalah
- Tugas implementasi pemantauan
- Simulasi respons insiden

**Penilaian Modul 6**: Topik lanjutan
- Desain pipeline CI/CD
- Pengembangan template khusus
- Skenario arsitektur perusahaan

### Proyek Akhir

Rancang dan terapkan solusi lengkap yang menunjukkan penguasaan semua konsep:

**Persyaratan**:
- Arsitektur aplikasi multi-tier
- Beberapa lingkungan penerapan
- Pemantauan dan pemberitahuan yang komprehensif
- Implementasi keamanan dan kepatuhan
- Optimasi biaya dan penyetelan kinerja
- Dokumentasi lengkap dan runbook

**Kriteria Evaluasi**:
- Kualitas implementasi teknis
- Kelengkapan dokumentasi
- Kepatuhan terhadap keamanan dan praktik terbaik
- Optimasi kinerja dan biaya
- Efektivitas pemecahan masalah dan pemantauan

## Sumber Belajar dan Referensi

### Dokumentasi Resmi
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Dokumentasi Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Pusat Arsitektur Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Sumber Daya Komunitas
- [Galeri Template AZD](https://azure.github.io/awesome-azd/)
- [Organisasi GitHub Azure-Samples](https://github.com/Azure-Samples)
- [Repositori GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)

### Lingkungan Praktik
- [Akun Gratis Azure](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Alat Tambahan
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Paket Ekstensi Alat Azure](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Rekomendasi Jadwal Belajar

### Studi Penuh Waktu (8 minggu)
- **Minggu 1-2**: Modul 1-2 (Memulai, Konfigurasi)
- **Minggu 3-4**: Modul 3-4 (Penerapan, Pra-penerapan)
- **Minggu 5-6**: Modul 5-6 (Pemecahan Masalah, Topik Lanjutan)
- **Minggu 7-8**: Proyek Praktis dan Penilaian Akhir

### Studi Paruh Waktu (16 minggu)
- **Minggu 1-4**: Modul 1 (Memulai)
- **Minggu 5-7**: Modul 2 (Konfigurasi dan Lingkungan)
- **Minggu 8-10**: Modul 3 (Penerapan dan Penyediaan)
- **Minggu 11-12**: Modul 4 (Validasi Pra-penerapan)
- **Minggu 13-14**: Modul 5 (Pemecahan Masalah dan Debugging)
- **Minggu 15-16**: Modul 6 (Topik Lanjutan dan Penilaian)

---

## Pelacakan Kemajuan dan Kerangka Penilaian

### Daftar Periksa Penyelesaian Bab

Lacak kemajuan Anda melalui setiap bab dengan hasil yang terukur ini:

#### 📚 Bab 1: Dasar & Memulai Cepat
- [ ] **Instalasi Selesai**: AZD terinstal dan diverifikasi di platform Anda
- [ ] **Penerapan Pertama**: Berhasil menerapkan template todo-nodejs-mongo
- [ ] **Pengaturan Lingkungan**: Mengonfigurasi variabel lingkungan pertama
- [ ] **Navigasi Sumber Daya**: Menjelajahi sumber daya yang diterapkan di Azure Portal
- [ ] **Penguasaan Perintah**: Nyaman dengan perintah dasar AZD

#### 🤖 Bab 2: Pengembangan Berbasis AI  
- [ ] **Penerapan Template AI**: Berhasil menerapkan azure-search-openai-demo
- [ ] **Implementasi RAG**: Mengonfigurasi pengindeksan dan pengambilan dokumen
- [ ] **Konfigurasi Model**: Menyiapkan beberapa model AI dengan tujuan berbeda
- [ ] **Pemantauan AI**: Menerapkan Application Insights untuk beban kerja AI
- [ ] **Optimasi Kinerja**: Menyetel kinerja aplikasi AI

#### ⚙️ Bab 3: Konfigurasi & Autentikasi
- [ ] **Pengaturan Multi-Lingkungan**: Mengonfigurasi lingkungan dev, staging, dan prod
- [ ] **Implementasi Keamanan**: Menyiapkan autentikasi identitas terkelola
- [ ] **Manajemen Rahasia**: Mengintegrasikan Azure Key Vault untuk data sensitif
- [ ] **Manajemen Parameter**: Membuat konfigurasi khusus lingkungan
- [ ] **Penguasaan Autentikasi**: Menerapkan pola akses yang aman

#### 🏗️ Bab 4: Infrastruktur sebagai Kode & Penerapan
- [ ] **Pembuatan Template Khusus**: Membangun template aplikasi multi-layanan
- [ ] **Penguasaan Bicep**: Membuat komponen infrastruktur modular dan dapat digunakan kembali
- [ ] **Otomasi Penerapan**: Menerapkan hook pra/pasca penerapan
- [ ] **Desain Arsitektur**: Menerapkan arsitektur microservices yang kompleks
- [ ] **Optimasi Template**: Mengoptimalkan template untuk kinerja dan biaya

#### 🎯 Bab 5: Solusi AI Multi-Agen
- [ ] **Penerapan Solusi Ritel**: Menerapkan skenario ritel multi-agen lengkap
- [ ] **Kustomisasi Agen**: Memodifikasi perilaku agen Pelanggan dan Inventaris
- [ ] **Skalabilitas Arsitektur**: Menerapkan load balancing dan auto-scaling
- [ ] **Pemantauan Produksi**: Menyiapkan pemantauan dan pemberitahuan yang komprehensif
- [ ] **Penyetelan Kinerja**: Mengoptimalkan kinerja sistem multi-agen

#### 🔍 Bab 6: Validasi Pra-Penerapan & Perencanaan
- [ ] **Analisis Kapasitas**: Menganalisis kebutuhan sumber daya untuk aplikasi
- [ ] **Optimasi SKU**: Memilih tingkat layanan yang hemat biaya
- [ ] **Otomasi Validasi**: Menerapkan skrip pemeriksaan pra-penerapan
- [ ] **Perencanaan Biaya**: Membuat estimasi biaya penerapan dan anggaran
- [ ] **Penilaian Risiko**: Mengidentifikasi dan mengurangi risiko penerapan

#### 🚨 Bab 7: Pemecahan Masalah & Debugging
- [ ] **Keterampilan Diagnostik**: Berhasil memecahkan penerapan yang sengaja rusak
- [ ] **Analisis Log**: Menggunakan Azure Monitor dan Application Insights secara efektif
- [ ] **Penyetelan Kinerja**: Mengoptimalkan aplikasi yang berkinerja lambat
- [ ] **Prosedur Pemulihan**: Menerapkan cadangan dan pemulihan bencana
- [ ] **Pengaturan Pemantauan**: Membuat pemantauan dan pemberitahuan proaktif

#### 🏢 Bab 8: Pola Produksi & Perusahaan
- [ ] **Keamanan Perusahaan**: Menerapkan pola keamanan yang komprehensif
- [ ] **Kerangka Tata Kelola**: Menyiapkan Azure Policy dan manajemen sumber daya
- [ ] **Pemantauan Lanjutan**: Membuat dasbor dan pemberitahuan otomatis
- [ ] **Integrasi CI/CD**: Membangun pipeline penerapan otomatis
- [ ] **Implementasi Kepatuhan**: Memenuhi persyaratan kepatuhan perusahaan

### Garis Waktu Pembelajaran dan Tonggak

#### Minggu 1-2: Membangun Dasar
- **Tonggak**: Menerapkan aplikasi AI pertama menggunakan AZD
- **Validasi**: Aplikasi yang berfungsi dapat diakses melalui URL publik
- **Keterampilan**: Alur kerja dasar AZD dan integrasi layanan AI

#### Minggu 3-4: Penguasaan Konfigurasi
- **Tonggak**: Penerapan multi-lingkungan dengan autentikasi yang aman
- **Validasi**: Aplikasi yang sama diterapkan ke dev/staging/prod
- **Keterampilan**: Manajemen lingkungan dan implementasi keamanan

#### Minggu 5-6: Keahlian Infrastruktur
- **Tonggak**: Template khusus untuk aplikasi multi-layanan yang kompleks
- **Validasi**: Template yang dapat digunakan kembali diterapkan oleh anggota tim lain
- **Keterampilan**: Penguasaan Bicep dan otomasi infrastruktur

#### Minggu 7-8: Implementasi AI Lanjutan
- **Tonggak**: Solusi AI multi-agen siap produksi
- **Validasi**: Sistem menangani beban dunia nyata dengan pemantauan
- **Keterampilan**: Orkestrasi multi-agen dan optimasi kinerja

#### Minggu 9-10: Kesiapan Produksi
- **Tonggak**: Penerapan tingkat perusahaan dengan kepatuhan penuh
- **Validasi**: Lulus tinjauan keamanan dan audit optimasi biaya
- **Keterampilan**: Tata kelola, pemantauan, dan integrasi CI/CD

### Penilaian dan Sertifikasi

#### Metode Validasi Pengetahuan
1. **Penerapan Praktis**: Aplikasi yang berfungsi untuk setiap bab
2. **Tinjauan Kode**: Penilaian kualitas template dan konfigurasi
3. **Pemecahan Masalah**: Skenario pemecahan masalah dan solusi
4. **Pengajaran Rekan**: Menjelaskan konsep kepada pelajar lain
5. **Kontribusi Komunitas**: Bagikan template atau perbaikan

#### Hasil Pengembangan Profesional
- **Proyek Portofolio**: 8 deployment siap produksi
- **Keterampilan Teknis**: Keahlian AZD dan deployment AI standar industri
- **Kemampuan Pemecahan Masalah**: Pemecahan masalah dan optimalisasi secara mandiri
- **Pengakuan Komunitas**: Partisipasi aktif dalam komunitas pengembang Azure
- **Kemajuan Karir**: Keterampilan yang langsung dapat diterapkan pada peran cloud dan AI

#### Metode Keberhasilan
- **Tingkat Keberhasilan Deployment**: >95% deployment berhasil
- **Waktu Pemecahan Masalah**: <30 menit untuk masalah umum
- **Optimalisasi Performa**: Peningkatan yang dapat dibuktikan dalam biaya dan performa
- **Kepatuhan Keamanan**: Semua deployment memenuhi standar keamanan perusahaan
- **Transfer Pengetahuan**: Kemampuan untuk membimbing pengembang lain

### Pembelajaran Berkelanjutan dan Keterlibatan Komunitas

#### Tetap Terkini
- **Pembaruan Azure**: Ikuti catatan rilis Azure Developer CLI
- **Acara Komunitas**: Berpartisipasi dalam acara pengembang Azure dan AI
- **Dokumentasi**: Berkontribusi pada dokumentasi dan contoh komunitas
- **Umpan Balik**: Berikan umpan balik tentang konten kursus dan layanan Azure

#### Pengembangan Karir
- **Jaringan Profesional**: Terhubung dengan ahli Azure dan AI
- **Kesempatan Berbicara**: Presentasikan pembelajaran di konferensi atau meetup
- **Kontribusi Open Source**: Berkontribusi pada template dan alat AZD
- **Mentorship**: Membimbing pengembang lain dalam perjalanan pembelajaran AZD mereka

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Mulai Belajar**: [Bab 1: Dasar & Mulai Cepat](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Pelacakan Kemajuan**: Lacak kemajuan Anda melalui sistem pembelajaran 8 bab yang komprehensif
- **🤝 Komunitas**: [Azure Discord](https://discord.gg/microsoft-azure) untuk dukungan dan diskusi

**Pelacakan Kemajuan Studi**: Gunakan panduan terstruktur ini untuk menguasai Azure Developer CLI melalui pembelajaran praktis yang progresif dengan hasil yang terukur dan manfaat pengembangan profesional.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk memberikan terjemahan yang akurat, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa terjemahan manusia profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau interpretasi yang salah yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->