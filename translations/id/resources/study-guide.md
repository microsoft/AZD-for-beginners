# Panduan Belajar - Tujuan Pembelajaran Komprehensif

**Navigasi Jalur Pembelajaran**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Mulai Belajar**: [Bab 1: Dasar & Mulai Cepat](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Pelacakan Kemajuan**: [Penyelesaian Kursus](../README.md#-course-completion--certification)

## Pendahuluan

Panduan belajar komprehensif ini menyediakan tujuan pembelajaran yang terstruktur, konsep kunci, latihan praktik, dan materi penilaian untuk membantu Anda menguasai Azure Developer CLI (azd). Gunakan panduan ini untuk melacak kemajuan Anda dan memastikan Anda telah menutupi semua topik penting.

## Tujuan Pembelajaran

Dengan menyelesaikan panduan belajar ini, Anda akan:
- Menguasai semua konsep dasar dan lanjutan Azure Developer CLI
- Mengembangkan keterampilan praktis dalam menyebarkan dan mengelola aplikasi Azure
- Membangun kepercayaan diri dalam memecahkan masalah dan mengoptimalkan penyebaran
- Memahami praktik penyebaran siap-produksi dan pertimbangan keamanan

## Hasil Pembelajaran

Setelah menyelesaikan semua bagian panduan belajar ini, Anda akan mampu:
- Merancang, menyebarkan, dan mengelola arsitektur aplikasi lengkap menggunakan azd
- Menerapkan strategi pemantauan, keamanan, dan optimisasi biaya yang komprehensif
- Memecahkan masalah penyebaran kompleks secara mandiri
- Membuat template kustom dan berkontribusi pada komunitas azd

## Struktur Pembelajaran 8 Bab

### Bab 1: Dasar & Mulai Cepat (Minggu 1)
**Durasi**: 30-45 menit | **Kompleksitas**: ⭐

#### Tujuan Pembelajaran
- Memahami konsep inti dan terminologi Azure Developer CLI
- Berhasil menginstal dan mengonfigurasi AZD di platform pengembangan Anda
- Menyebarkan aplikasi pertama Anda menggunakan template yang ada
- Menavigasi antarmuka baris perintah AZD secara efektif

#### Konsep Kunci yang Harus Dikuasai
- Struktur proyek AZD dan komponennya (azure.yaml, infra/, src/)
- Alur kerja penyebaran berbasis template
- Dasar-dasar konfigurasi lingkungan
- Pengelolaan grup sumber daya dan langganan

#### Latihan Praktis
1. **Verifikasi Instalasi**: Instal AZD dan verifikasi dengan `azd version`
2. **Penyebaran Pertama**: Sukses menyebarkan template todo-nodejs-mongo
3. **Pengaturan Lingkungan**: Konfigurasikan variabel lingkungan pertama Anda
4. **Eksplorasi Sumber Daya**: Jelajahi sumber daya yang disebarkan di Azure Portal

#### Pertanyaan Penilaian
- Apa saja komponen inti dari proyek AZD?
- Bagaimana Anda menginisialisasi proyek baru dari sebuah template?
- Apa perbedaan antara `azd up` dan `azd deploy`?
- Bagaimana Anda mengelola beberapa lingkungan dengan AZD?

---

### Bab 2: Pengembangan Berfokus AI (Minggu 2)
**Durasi**: 1-2 jam | **Kompleksitas**: ⭐⭐

#### Tujuan Pembelajaran
- Mengintegrasikan layanan Microsoft Foundry dengan alur kerja AZD
- Menyebarkan dan mengonfigurasi aplikasi bertenaga AI
- Memahami pola implementasi RAG (Retrieval-Augmented Generation)
- Mengelola penyebaran model AI dan penskalannya

#### Konsep Kunci yang Harus Dikuasai
- Integrasi layanan Microsoft Foundry Models dan manajemen API
- Konfigurasi AI Search dan pengindeksan vektor
- Strategi penyebaran model dan perencanaan kapasitas
- Pemantauan aplikasi AI dan optimisasi kinerja

#### Latihan Praktis
1. **Penyebaran AI Chat**: Menyebarkan template azure-search-openai-demo
2. **Implementasi RAG**: Konfigurasikan pengindeksan dan pengambilan dokumen
3. **Konfigurasi Model**: Menyiapkan beberapa model AI dengan tujuan berbeda
4. **Pemantauan AI**: Mengimplementasikan Application Insights untuk beban kerja AI

#### Pertanyaan Penilaian
- Bagaimana Anda mengonfigurasi layanan Microsoft Foundry Models dalam template AZD?
- Apa saja komponen kunci dari arsitektur RAG?
- Bagaimana Anda mengelola kapasitas dan penskalaan model AI?
- Metrik pemantauan apa yang penting untuk aplikasi AI?

---

### Bab 3: Konfigurasi & Otentikasi (Minggu 3)
**Durasi**: 45-60 menit | **Kompleksitas**: ⭐⭐

#### Tujuan Pembelajaran
- Menguasai strategi konfigurasi dan pengelolaan lingkungan
- Menerapkan pola otentikasi yang aman dan managed identity
- Mengorganisir sumber daya dengan konvensi penamaan yang tepat
- Mengonfigurasi penyebaran multi-lingkungan (dev, staging, prod)

#### Konsep Kunci yang Harus Dikuasai
- Hirarki lingkungan dan presedensi konfigurasi
- Otentikasi managed identity dan service principal
- Integrasi Key Vault untuk manajemen rahasia
- Manajemen parameter khusus lingkungan

#### Latihan Praktis
1. **Pengaturan Multi-Lingkungan**: Konfigurasikan lingkungan dev, staging, dan prod
2. **Konfigurasi Keamanan**: Terapkan otentikasi managed identity
3. **Manajemen Rahasia**: Integrasikan Azure Key Vault untuk data sensitif
4. **Manajemen Parameter**: Buat konfigurasi khusus lingkungan

#### Pertanyaan Penilaian
- Bagaimana Anda mengonfigurasi lingkungan yang berbeda dengan AZD?
- Apa manfaat menggunakan managed identity dibanding service principal?
- Bagaimana Anda mengelola rahasia aplikasi secara aman?
- Apa hirarki konfigurasi di AZD?

---

### Bab 4: Infrastruktur sebagai Kode & Penyebaran (Minggu 4-5)
**Durasi**: 1-1.5 jam | **Kompleksitas**: ⭐⭐⭐

#### Tujuan Pembelajaran
- Membuat dan menyesuaikan template infrastruktur Bicep
- Menerapkan pola dan alur kerja penyebaran lanjutan
- Memahami strategi penyediaan sumber daya
- Merancang arsitektur multi-layanan yang dapat diskalakan

- Menyebarkan aplikasi ter-containerisasi menggunakan Azure Container Apps dan AZD


#### Konsep Kunci yang Harus Dikuasai
- Struktur template Bicep dan praktik terbaik
- Ketergantungan sumber daya dan urutan penyebaran
- Berkas parameter dan modularitas template
- Hook kustom dan otomatisasi penyebaran
- Pola penyebaran aplikasi kontainer (quick start, production, microservices)

#### Latihan Praktis
1. **Pembuatan Template Kustom**: Bangun template aplikasi multi-layanan
2. **Menguasai Bicep**: Buat komponen infrastruktur modular dan dapat digunakan kembali
3. **Otomatisasi Penyebaran**: Terapkan hook pra/pasca penyebaran
4. **Desain Arsitektur**: Sebarkan arsitektur microservices yang kompleks
5. **Penyebaran Aplikasi Kontainer**: Sebarkan contoh [Simple Flask API](../../../examples/container-app/simple-flask-api) dan [Microservices Architecture](../../../examples/container-app/microservices) menggunakan AZD

#### Pertanyaan Penilaian
- Bagaimana Anda membuat template Bicep kustom untuk AZD?
- Apa praktik terbaik untuk mengatur kode infrastruktur?
- Bagaimana Anda menangani ketergantungan sumber daya dalam template?
- Pola penyebaran apa yang mendukung pembaruan tanpa downtime?

---

### Bab 5: Solusi AI Multi-Agen (Minggu 6-7)
**Durasi**: 2-3 jam | **Kompleksitas**: ⭐⭐⭐⭐

#### Tujuan Pembelajaran
- Merancang dan menerapkan arsitektur AI multi-agen
- Mengorkestrasi koordinasi dan komunikasi antar agen
- Menyebarkan solusi AI siap-produksi dengan pemantauan
- Memahami spesialisasi agen dan pola alur kerja
- Mengintegrasikan microservices ter-containerisasi sebagai bagian dari solusi multi-agen

#### Konsep Kunci yang Harus Dikuasai
- Pola arsitektur multi-agen dan prinsip desain
- Protokol komunikasi agen dan aliran data
- Strategi load balancing dan penskalaan untuk agen AI
- Pemantauan produksi untuk sistem multi-agen
- Komunikasi layanan-ke-layanan dalam lingkungan ter-containerisasi

#### Latihan Praktis
1. **Penyebaran Solusi Ritel**: Menyebarkan skenario ritel multi-agen lengkap
2. **Kustomisasi Agen**: Ubah perilaku agen Customer dan Inventory
3. **Pensakalan Arsitektur**: Terapkan load balancing dan auto-scaling
4. **Pemantauan Produksi**: Siapkan pemantauan dan pengalertan yang komprehensif
5. **Integrasi Microservices**: Perluas contoh [Microservices Architecture](../../../examples/container-app/microservices) untuk mendukung alur kerja berbasis agen

#### Pertanyaan Penilaian
- Bagaimana Anda merancang pola komunikasi multi-agen yang efektif?
- Apa pertimbangan kunci untuk penskalaan beban kerja agen AI?
- Bagaimana Anda memantau dan men-debug sistem AI multi-agen?
- Pola produksi apa yang memastikan keandalan untuk agen AI?

---

### Bab 6: Validasi & Perencanaan Pra-Penyebaran (Minggu 8)
**Durasi**: 1 jam | **Kompleksitas**: ⭐⭐

#### Tujuan Pembelajaran
- Melakukan perencanaan kapasitas dan validasi sumber daya yang komprehensif
- Memilih SKU Azure optimal untuk efektivitas biaya
- Menerapkan pemeriksaan pra-penyebaran otomatis dan validasi
- Merencanakan penyebaran dengan strategi optimisasi biaya

#### Konsep Kunci yang Harus Dikuasai
- Kuota sumber daya Azure dan batasan kapasitas
- Kriteria pemilihan SKU dan optimisasi biaya
- Skrip validasi otomatis dan pengujian
- Perencanaan penyebaran dan penilaian risiko

#### Latihan Praktis
1. **Analisis Kapasitas**: Analisis kebutuhan sumber daya untuk aplikasi Anda
2. **Optimisasi SKU**: Bandingkan dan pilih tingkat layanan yang hemat biaya
3. **Otomatisasi Validasi**: Terapkan skrip pemeriksaan pra-penyebaran
4. **Perencanaan Biaya**: Buat estimasi biaya penyebaran dan anggaran

#### Pertanyaan Penilaian
- Bagaimana Anda memvalidasi kapasitas Azure sebelum penyebaran?
- Faktor apa yang memengaruhi keputusan pemilihan SKU?
- Bagaimana Anda mengotomatisasi validasi pra-penyebaran?
- Strategi apa yang membantu mengoptimalkan biaya penyebaran?

---

### Bab 7: Pemecahan Masalah & Debugging (Minggu 9)
**Durasi**: 1-1.5 jam | **Kompleksitas**: ⭐⭐

#### Tujuan Pembelajaran
- Mengembangkan pendekatan debugging sistematis untuk penyebaran AZD
- Menyelesaikan masalah penyebaran dan konfigurasi yang umum
- Debug masalah spesifik AI dan isu kinerja
- Menerapkan pemantauan dan pengalertan untuk deteksi masalah proaktif

#### Konsep Kunci yang Harus Dikuasai
- Teknik diagnostik dan strategi logging
- Pola kegagalan umum dan solusinya
- Pemantauan kinerja dan optimisasi
- Prosedur respons insiden dan pemulihan

#### Latihan Praktis
1. **Keterampilan Diagnostik**: Latih dengan penyebaran yang sengaja rusak
2. **Analisis Log**: Gunakan Azure Monitor dan Application Insights secara efektif
3. **Tuning Kinerja**: Optimalkan aplikasi yang berjalan lambat
4. **Prosedur Pemulihan**: Terapkan backup dan pemulihan bencana

#### Pertanyaan Penilaian
- Apa kegagalan penyebaran AZD yang paling umum?
- Bagaimana Anda melakukan debugging masalah otentikasi dan izin?
- Strategi pemantauan apa yang membantu mencegah masalah produksi?
- Bagaimana Anda mengoptimalkan kinerja aplikasi di Azure?

---

### Bab 8: Pola Produksi & Perusahaan (Minggu 10-11)
**Durasi**: 2-3 jam | **Kompleksitas**: ⭐⭐⭐⭐

#### Tujuan Pembelajaran
- Menerapkan strategi penyebaran tingkat perusahaan
- Merancang pola keamanan dan kerangka kepatuhan
- Membangun pemantauan, tata kelola, dan manajemen biaya
- Membuat pipeline CI/CD yang dapat diskalakan dengan integrasi AZD
- Menerapkan praktik terbaik untuk penyebaran aplikasi kontainer produksi (keamanan, pemantauan, biaya, CI/CD)

#### Konsep Kunci yang Harus Dikuasai
- Persyaratan keamanan dan kepatuhan perusahaan
- Kerangka tata kelola dan penerapan kebijakan
- Pemantauan lanjutan dan manajemen biaya
- Integrasi CI/CD dan pipeline penyebaran otomatis
- Strategi penyebaran blue-green dan canary untuk beban kerja ter-containerisasi

#### Latihan Praktis
1. **Keamanan Perusahaan**: Terapkan pola keamanan yang komprehensif
2. **Kerangka Tata Kelola**: Siapkan Azure Policy dan manajemen sumber daya
3. **Pemantauan Lanjutan**: Buat dashboard dan pengalertan otomatis
4. **Integrasi CI/CD**: Bangun pipeline penyebaran otomatis
5. **Aplikasi Kontainer Produksi**: Terapkan keamanan, pemantauan, dan optimisasi biaya pada contoh [Microservices Architecture](../../../examples/container-app/microservices)

#### Pertanyaan Penilaian
- Bagaimana Anda menerapkan keamanan tingkat perusahaan dalam penyebaran AZD?
- Pola tata kelola apa yang memastikan kepatuhan dan pengendalian biaya?
- Bagaimana Anda merancang pemantauan yang dapat diskalakan untuk sistem produksi?
- Pola CI/CD apa yang bekerja paling baik dengan alur kerja AZD?

#### Tujuan Pembelajaran
- Memahami dasar-dasar Azure Developer CLI dan konsep inti
- Berhasil menginstal dan mengonfigurasi azd di lingkungan pengembangan Anda
- Menyelesaikan penyebaran pertama Anda menggunakan template yang ada
- Menavigasi struktur proyek azd dan memahami komponen kunci

#### Konsep Kunci yang Harus Dikuasai
- Template, lingkungan, dan layanan
- Struktur konfigurasi azure.yaml
- Perintah dasar azd (init, up, down, deploy)
- Prinsip Infrastruktur sebagai Kode
- Otentikasi dan otorisasi Azure

#### Latihan Praktis

**Latihan 1.1: Instalasi dan Pengaturan**
```bash
# Selesaikan tugas-tugas ini:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Latihan 1.2: Penyebaran Pertama**
```bash
# Menerapkan aplikasi web sederhana:
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
1. Apa tiga konsep inti dari arsitektur azd?
2. Apa tujuan berkas azure.yaml?
3. Bagaimana lingkungan membantu mengelola target penyebaran yang berbeda?
4. Metode otentikasi apa yang dapat digunakan dengan azd?
5. Apa yang terjadi ketika Anda menjalankan `azd up` untuk pertama kali?

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
# Terapkan praktik keamanan terbaik:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Pertanyaan Penilaian Diri
1. Bagaimana azd menangani presedensi variabel lingkungan?
2. Apa itu deployment hooks dan kapan Anda harus menggunakannya?
3. Bagaimana Anda mengonfigurasi SKU yang berbeda untuk lingkungan yang berbeda?
4. Apa implikasi keamanan dari berbagai metode otentikasi?
5. Bagaimana Anda mengelola rahasia dan data konfigurasi sensitif?

### Modul 3: Penyebaran dan Provisioning (Minggu 4)

#### Tujuan Pembelajaran
- Menguasai alur kerja penyebaran dan praktik terbaik
- Memahami Infrastruktur sebagai Kode dengan template Bicep
- Menerapkan arsitektur multi-layanan kompleks
- Mengoptimalkan kinerja dan keandalan penyebaran

#### Konsep Kunci yang Harus Dikuasai
- Struktur template Bicep dan modul
- Ketergantungan sumber daya dan pengurutan
- Strategi penyebaran (blue-green, rolling updates)
- Penyebaran multi-region
- Migrasi basis data dan manajemen data

#### Latihan Praktis

**Latihan 3.1: Infrastruktur Kustom**
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

**Latihan 3.3: Integrasi Basis Data**
```bash
# Terapkan pola penerapan basis data:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Pertanyaan Penilaian Diri
1. Apa keuntungan menggunakan Bicep dibandingkan ARM template?
2. Bagaimana Anda menangani migrasi basis data dalam penyebaran azd?
3. Strategi apa saja yang ada untuk penyebaran tanpa downtime?
4. Bagaimana Anda mengelola ketergantungan antar layanan?
5. Pertimbangan apa saja untuk penyebaran multi-region?

### Modul 4: Validasi Pra-Penyebaran (Minggu 5)

#### Tujuan Pembelajaran
- Laksanakan pemeriksaan pra-deploy yang komprehensif
- Kuasi perencanaan kapasitas dan validasi sumber daya
- Pahami pemilihan SKU dan optimisasi biaya
- Bangun pipeline validasi otomatis

#### Konsep Utama yang Harus Dikuasai
- Kuota dan batasan sumber daya Azure
- Kriteria pemilihan SKU dan implikasi biaya
- Skrip dan alat validasi otomatis
- Metodologi perencanaan kapasitas
- Pengujian kinerja dan optimisasi

#### Latihan Praktik

**Exercise 4.1: Capacity Planning**
```bash
# Implementasikan validasi kapasitas:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Exercise 4.2: Pre-flight Validation**
```powershell
# Membangun pipeline validasi yang komprehensif:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Exercise 4.3: SKU Optimization**
```bash
# Optimalkan konfigurasi layanan:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Pertanyaan Penilaian Diri
1. Faktor apa saja yang harus mempengaruhi keputusan pemilihan SKU?
2. Bagaimana Anda memvalidasi ketersediaan sumber daya Azure sebelum deployment?
3. Apa saja komponen kunci dari sistem pemeriksaan pra-deploy?
4. Bagaimana Anda memperkirakan dan mengendalikan biaya deployment?
5. Pemantauan apa yang penting untuk perencanaan kapasitas?

### Modul 5: Pemecahan Masalah dan Debugging (Minggu 6)

#### Tujuan Pembelajaran
- Kuasi metodologi pemecahan masalah yang sistematis
- Kembangkan keahlian dalam debugging masalah deployment kompleks
- Terapkan pemantauan dan pemberitahuan yang komprehensif
- Bangun prosedur respons insiden dan pemulihan

#### Konsep Utama yang Harus Dikuasai
- Pola kegagalan deployment umum
- Teknik analisis dan korelasi log
- Pemantauan kinerja dan optimisasi
- Deteksi dan respons insiden keamanan
- Pemulihan bencana dan kesinambungan bisnis

#### Latihan Praktik

**Exercise 5.1: Troubleshooting Scenarios**
```bash
# Berlatih menyelesaikan masalah umum:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercise 5.2: Monitoring Implementation**
```bash
# Siapkan pemantauan menyeluruh:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Exercise 5.3: Incident Response**
```bash
# Buat prosedur respons insiden:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Pertanyaan Penilaian Diri
1. Apa pendekatan sistematis untuk memecahkan masalah deployment azd?
2. Bagaimana Anda mengkorelasikan log di berbagai layanan dan sumber daya?
3. Metrik pemantauan apa yang paling kritis untuk deteksi masalah dini?
4. Bagaimana Anda menerapkan prosedur pemulihan bencana yang efektif?
5. Apa saja komponen kunci dari rencana respons insiden?

### Modul 6: Topik Lanjutan dan Praktik Terbaik (Minggu 7-8)

#### Tujuan Pembelajaran
- Terapkan pola deployment kelas enterprise
- Kuasi integrasi dan otomatisasi CI/CD
- Kembangkan template kustom dan berkontribusi ke komunitas
- Pahami persyaratan keamanan dan kepatuhan tingkat lanjut

#### Konsep Utama yang Harus Dikuasai
- Pola integrasi pipeline CI/CD
- Pengembangan dan distribusi template kustom
- Tata kelola enterprise dan kepatuhan
- Konfigurasi jaringan dan keamanan tingkat lanjut
- Optimisasi kinerja dan manajemen biaya

#### Latihan Praktik

**Exercise 6.1: CI/CD Integration**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Exercise 6.2: Custom Template Development**
```bash
# Buat dan publikasikan template kustom:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercise 6.3: Enterprise Implementation**
```bash
# Terapkan fitur kelas perusahaan:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Pertanyaan Penilaian Diri
1. Bagaimana Anda mengintegrasikan azd ke dalam alur kerja CI/CD yang sudah ada?
2. Pertimbangan utama apa saja untuk pengembangan template kustom?
3. Bagaimana Anda menerapkan tata kelola dan kepatuhan dalam deployment azd?
4. Apa praktik terbaik untuk deployment skala enterprise?
5. Bagaimana Anda berkontribusi secara efektif ke komunitas azd?

## Proyek Praktis

### Proyek 1: Situs Web Portofolio Pribadi
**Kompleksitas**: Pemula  
**Durasi**: 1-2 minggu

Bangun dan deploy situs web portofolio pribadi menggunakan:
- Hosting situs statis di Azure Storage
- Konfigurasi domain kustom
- Integrasi CDN untuk performa global
- Pipeline deployment otomatis

**Hasil yang harus diserahkan**:
- Situs web yang berfungsi dan dideploy di Azure
- Template azd kustom untuk deployment portofolio
- Dokumentasi proses deployment
- Analisis biaya dan rekomendasi optimisasi

### Proyek 2: Aplikasi Manajemen Tugas
**Kompleksitas**: Menengah  
**Durasi**: 2-3 minggu

Buat aplikasi manajemen tugas full-stack dengan:
- Frontend React dideploy ke App Service
- Backend API Node.js dengan otentikasi
- Database PostgreSQL dengan migrasi
- Pemantauan Application Insights

**Hasil yang harus diserahkan**:
- Aplikasi lengkap dengan otentikasi pengguna
- Skema database dan skrip migrasi
- Dashboard pemantauan dan aturan pemberitahuan
- Konfigurasi deployment multi-environment

### Proyek 3: Platform E-niaga Berbasis Mikroservis
**Kompleksitas**: Lanjutan  
**Durasi**: 4-6 minggu

Rancang dan terapkan platform e-niaga berbasis mikroservis:
- Beberapa layanan API (katalog, pesanan, pembayaran, pengguna)
- Integrasi antrean pesan dengan Service Bus
- Cache Redis untuk optimisasi kinerja
- Logging dan pemantauan yang komprehensif

**Contoh Referensi**: Lihat [Arsitektur Mikroservis](../../../examples/container-app/microservices) untuk template siap produksi dan panduan deployment

**Hasil yang harus diserahkan**:
- Arsitektur mikroservis lengkap
- Pola komunikasi antar-layanan
- Pengujian kinerja dan optimisasi
- Implementasi keamanan siap produksi

## Penilaian dan Sertifikasi

### Pemeriksaan Pengetahuan

Selesaikan penilaian ini setelah setiap modul:

**Penilaian Modul 1**: Konsep dasar dan instalasi
- Pertanyaan pilihan ganda tentang konsep inti
- Tugas instalasi dan konfigurasi praktis
- Latihan deployment sederhana

**Penilaian Modul 2**: Konfigurasi dan lingkungan
- Skenario manajemen lingkungan
- Latihan pemecahan masalah konfigurasi
- Implementasi konfigurasi keamanan

**Penilaian Modul 3**: Deployment dan penyediaan
- Tantangan desain infrastruktur
- Skenario deployment multi-layanan
- Latihan optimisasi kinerja

**Penilaian Modul 4**: Validasi pra-deploy
- Studi kasus perencanaan kapasitas
- Skenario optimisasi biaya
- Implementasi pipeline validasi

**Penilaian Modul 5**: Pemecahan masalah dan debugging
- Latihan diagnosis masalah
- Tugas implementasi pemantauan
- Simulasi respons insiden

**Penilaian Modul 6**: Topik lanjutan
- Desain pipeline CI/CD
- Pengembangan template kustom
- Skenario arsitektur enterprise

### Proyek Capstone Akhir

Rancang dan terapkan solusi lengkap yang menunjukkan penguasaan semua konsep:

**Persyaratan**:
- Arsitektur aplikasi multi-tier
- Beberapa lingkungan deployment
- Pemantauan dan pemberitahuan yang komprehensif
- Implementasi keamanan dan kepatuhan
- Optimisasi biaya dan penyetelan kinerja
- Dokumentasi lengkap dan runbook

**Kriteria Evaluasi**:
- Kualitas implementasi teknis
- Kelengkapan dokumentasi
- Kepatuhan terhadap keamanan dan praktik terbaik
- Optimisasi kinerja dan biaya
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

### Lingkungan Latihan
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Tier Gratis](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Alat Tambahan
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Rekomendasi Jadwal Belajar

### Studi Penuh Waktu (8 minggu)
- **Minggu 1-2**: Modul 1-2 (Memulai, Konfigurasi)
- **Minggu 3-4**: Modul 3-4 (Deployment, Pra-deploy)
- **Minggu 5-6**: Modul 5-6 (Pemecahan Masalah, Topik Lanjutan)
- **Minggu 7-8**: Proyek Praktis dan Penilaian Akhir

### Studi Paruh Waktu (16 minggu)
- **Minggu 1-4**: Modul 1 (Memulai)
- **Minggu 5-7**: Modul 2 (Konfigurasi dan Lingkungan)
- **Minggu 8-10**: Modul 3 (Deployment dan Penyediaan)
- **Minggu 11-12**: Modul 4 (Validasi Pra-deploy)
- **Minggu 13-14**: Modul 5 (Pemecahan Masalah dan Debugging)
- **Minggu 15-16**: Modul 6 (Topik Lanjutan dan Penilaian)

---

## Kerangka Pelacakan Kemajuan dan Penilaian

### Daftar Periksa Penyelesaian Bab

Lacak kemajuan Anda melalui setiap bab dengan hasil terukur berikut:

#### 📚 Bab 1: Dasar & Memulai Cepat
- [ ] **Instalasi Selesai**: AZD diinstal dan diverifikasi di platform Anda
- [ ] **Deployment Pertama**: Berhasil mendeploy template todo-nodejs-mongo
- [ ] **Pengaturan Lingkungan**: Mengonfigurasi variabel lingkungan pertama
- [ ] **Navigasi Sumber Daya**: Menjelajahi sumber daya yang dideploy di Azure Portal
- [ ] **Penguasaan Perintah**: Nyaman dengan perintah AZD dasar

#### 🤖 Bab 2: Pengembangan Berbasis AI  
- [ ] **Penerapan Template AI**: Berhasil mendeploy azure-search-openai-demo
- [ ] **Implementasi RAG**: Mengonfigurasi pengindeksan dan pengambilan dokumen
- [ ] **Konfigurasi Model**: Menyiapkan beberapa model AI dengan tujuan berbeda
- [ ] **Pemantauan AI**: Menerapkan Application Insights untuk beban kerja AI
- [ ] **Optimisasi Kinerja**: Menyetel kinerja aplikasi AI

#### ⚙️ Bab 3: Konfigurasi & Otentikasi
- [ ] **Pengaturan Multi-Lingkungan**: Mengonfigurasi lingkungan dev, staging, dan prod
- [ ] **Implementasi Keamanan**: Menyiapkan otentikasi managed identity
- [ ] **Manajemen Rahasia**: Mengintegrasikan Azure Key Vault untuk data sensitif
- [ ] **Manajemen Parameter**: Membuat konfigurasi spesifik lingkungan
- [ ] **Penguasaan Otentikasi**: Menerapkan pola akses yang aman

#### 🏗️ Bab 4: Infrastruktur sebagai Kode & Deployment
- [ ] **Pembuatan Template Kustom**: Membangun template aplikasi multi-layanan
- [ ] **Penguasaan Bicep**: Membuat komponen infrastruktur modular yang dapat digunakan ulang
- [ ] **Otomatisasi Deployment**: Menerapkan hook pra/pasca deployment
- [ ] **Desain Arsitektur**: Mendeploy arsitektur mikroservis yang kompleks
- [ ] **Optimisasi Template**: Mengoptimalkan template untuk kinerja dan biaya

#### 🎯 Bab 5: Solusi AI Multi-Agen
- [ ] **Deployment Solusi Ritel**: Mendeploy skenario ritel multi-agen lengkap
- [ ] **Kustomisasi Agen**: Memodifikasi perilaku agen Customer dan Inventory
- [ ] **Skalabilitas Arsitektur**: Menerapkan load balancing dan auto-scaling
- [ ] **Pemantauan Produksi**: Menyiapkan pemantauan dan pemberitahuan yang komprehensif
- [ ] **Penyetelan Kinerja**: Mengoptimalkan kinerja sistem multi-agen

#### 🔍 Bab 6: Validasi & Perencanaan Pra-Deployment
- [ ] **Analisis Kapasitas**: Menganalisis kebutuhan sumber daya untuk aplikasi
- [ ] **Optimisasi SKU**: Memilih tier layanan yang hemat biaya
- [ ] **Otomatisasi Validasi**: Menerapkan skrip pemeriksaan pra-deploy
- [ ] **Perencanaan Biaya**: Membuat perkiraan biaya deployment dan anggaran
- [ ] **Penilaian Risiko**: Mengidentifikasi dan mengurangi risiko deployment

#### 🚨 Bab 7: Pemecahan Masalah & Debugging
- [ ] **Keterampilan Diagnostik**: Berhasil melakukan debugging pada deployment yang sengaja dibuat rusak
- [ ] **Analisis Log**: Menggunakan Azure Monitor dan Application Insights secara efektif
- [ ] **Penyetelan Kinerja**: Mengoptimalkan aplikasi yang lambat
- [ ] **Prosedur Pemulihan**: Menerapkan backup dan pemulihan bencana
- [ ] **Pengaturan Pemantauan**: Membuat pemantauan dan pemberitahuan proaktif

#### 🏢 Bab 8: Pola Produksi & Enterprise
- [ ] **Keamanan Enterprise**: Menerapkan pola keamanan yang komprehensif
- [ ] **Kerangka Tata Kelola**: Menyiapkan Azure Policy dan manajemen sumber daya
- [ ] **Pemantauan Tingkat Lanjut**: Membuat dashboard dan pemberitahuan otomatis
- [ ] **Integrasi CI/CD**: Membangun pipeline deployment otomatis
- [ ] **Implementasi Kepatuhan**: Memenuhi persyaratan kepatuhan enterprise

### Garis Waktu Pembelajaran dan Tonggak

#### Minggu 1-2: Membangun Fondasi
- **Tonggak**: Mendeploy aplikasi AI pertama menggunakan AZD
- **Validasi**: Aplikasi berfungsi dapat diakses melalui URL publik
- **Keterampilan**: Alur kerja AZD dasar dan integrasi layanan AI

#### Minggu 3-4: Penguasaan Konfigurasi
- **Tonggak**: Deployment multi-lingkungan dengan otentikasi aman
- **Validasi**: Aplikasi yang sama dideploy ke dev/staging/prod
- **Keterampilan**: Manajemen lingkungan dan implementasi keamanan

#### Minggu 5-6: Keahlian Infrastruktur
- **Tonggak**: Template kustom untuk aplikasi multi-layanan kompleks
- **Validasi**: Template yang dapat digunakan ulang dideploy oleh anggota tim lain
- **Keterampilan**: Penguasaan Bicep dan otomasi infrastruktur

#### Minggu 7-8: Implementasi AI Tingkat Lanjut
- **Tonggak**: Solusi AI multi-agen siap produksi
- **Validasi**: Sistem menangani beban dunia nyata dengan pemantauan
- **Keterampilan**: Orkestrasi multi-agen dan optimisasi kinerja

#### Minggu 9-10: Kesiapan Produksi
- **Tonggak**: Deployment kelas enterprise dengan kepatuhan penuh
- **Validasi**: Lulus tinjauan keamanan dan audit optimisasi biaya
- **Keterampilan**: Tata kelola, pemantauan, dan integrasi CI/CD

### Penilaian dan Sertifikasi

#### Metode Validasi Pengetahuan
1. **Deployment Praktis**: Aplikasi yang berfungsi untuk setiap bab
2. **Tinjauan Kode**: Penilaian kualitas template dan konfigurasi
3. **Pemecahan Masalah**: Skenario pemecahan masalah dan solusi
4. **Pengajaran Sebaya**: Menjelaskan konsep kepada peserta lain
5. **Kontribusi Komunitas**: Membagikan template atau perbaikan

#### Hasil Pengembangan Profesional
- **Proyek Portofolio**: 8 penyebaran siap produksi
- **Keterampilan Teknis**: Keahlian penerapan AZD dan AI sesuai standar industri
- **Kemampuan Pemecahan Masalah**: Pemecahan masalah dan optimasi secara mandiri
- **Pengakuan Komunitas**: Partisipasi aktif dalam komunitas pengembang Azure
- **Kemajuan Karier**: Keterampilan yang langsung dapat diterapkan pada peran cloud dan AI

#### Metrik Keberhasilan
- **Tingkat Keberhasilan Penyebaran**: >95% penyebaran berhasil
- **Waktu Pemecahan Masalah**: <30 menit untuk masalah umum
- **Optimasi Kinerja**: Peningkatan yang dapat dibuktikan dalam biaya dan kinerja
- **Kepatuhan Keamanan**: Semua penyebaran memenuhi standar keamanan perusahaan
- **Transfer Pengetahuan**: Kemampuan untuk membimbing pengembang lain

### Pembelajaran Berkelanjutan dan Keterlibatan Komunitas

#### Tetap Terkini
- **Pembaruan Azure**: Ikuti catatan rilis Azure Developer CLI
- **Acara Komunitas**: Ikut serta dalam acara pengembang Azure dan AI
- **Dokumentasi**: Berkontribusi pada dokumentasi dan contoh komunitas
- **Umpan Balik**: Berikan masukan pada konten kursus dan layanan Azure

#### Pengembangan Karier
- **Jaringan Profesional**: Terhubung dengan pakar Azure dan AI
- **Peluang Presentasi**: Presentasikan pembelajaran pada konferensi atau meetup
- **Kontribusi Open Source**: Berkontribusi pada template dan alat AZD
- **Bimbingan**: Membimbing pengembang lain dalam perjalanan pembelajaran AZD mereka

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD untuk Pemula](../README.md)
- **📖 Mulai Belajar**: [Bab 1: Dasar & Mulai Cepat](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Pelacakan Kemajuan**: Lacak kemajuan Anda melalui sistem pembelajaran 8-bab yang komprehensif
- **🤝 Komunitas**: [Azure Discord](https://discord.gg/microsoft-azure) untuk dukungan dan diskusi

**Pelacakan Kemajuan Studi**: Gunakan panduan terstruktur ini untuk menguasai Azure Developer CLI melalui pembelajaran progresif dan praktis dengan hasil yang terukur dan manfaat pengembangan profesional.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai akurasi, harap diingat bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidaktepatan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->