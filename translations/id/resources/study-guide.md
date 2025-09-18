<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee6549c72fe4271931326578e2379243",
  "translation_date": "2025-09-18T08:04:02+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "id"
}
-->
# Panduan Belajar - Tujuan Pembelajaran Komprehensif

**Navigasi Jalur Belajar**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Mulai Belajar**: [Bab 1: Dasar & Mulai Cepat](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Pelacakan Kemajuan**: [Penyelesaian Kursus](../README.md#-course-completion--certification)

## Pendahuluan

Panduan belajar komprehensif ini menyediakan tujuan pembelajaran yang terstruktur, konsep utama, latihan praktik, dan materi evaluasi untuk membantu Anda menguasai Azure Developer CLI (azd). Gunakan panduan ini untuk melacak kemajuan Anda dan memastikan semua topik penting telah dipelajari.

## Tujuan Pembelajaran

Dengan menyelesaikan panduan belajar ini, Anda akan:
- Menguasai semua konsep dasar dan lanjutan Azure Developer CLI
- Mengembangkan keterampilan praktis dalam menerapkan dan mengelola aplikasi Azure
- Meningkatkan kepercayaan diri dalam memecahkan masalah dan mengoptimalkan penerapan
- Memahami praktik penerapan siap-produksi dan pertimbangan keamanan

## Hasil Pembelajaran

Setelah menyelesaikan semua bagian dari panduan belajar ini, Anda akan dapat:
- Merancang, menerapkan, dan mengelola arsitektur aplikasi lengkap menggunakan azd
- Menerapkan strategi pemantauan, keamanan, dan optimasi biaya yang komprehensif
- Memecahkan masalah penerapan yang kompleks secara mandiri
- Membuat template khusus dan berkontribusi pada komunitas azd

## Struktur Pembelajaran 8 Bab

### Bab 1: Dasar & Mulai Cepat (Minggu 1)
**Durasi**: 30-45 menit | **Kompleksitas**: ⭐

#### Tujuan Pembelajaran
- Memahami konsep inti dan terminologi Azure Developer CLI
- Berhasil menginstal dan mengonfigurasi AZD di platform pengembangan Anda
- Menerapkan aplikasi pertama Anda menggunakan template yang ada
- Menavigasi antarmuka baris perintah AZD dengan efektif

#### Konsep Utama yang Harus Dikuasai
- Struktur proyek AZD dan komponennya (azure.yaml, infra/, src/)
- Alur kerja penerapan berbasis template
- Dasar-dasar konfigurasi lingkungan
- Pengelolaan grup sumber daya dan langganan

#### Latihan Praktik
1. **Verifikasi Instalasi**: Instal AZD dan verifikasi dengan `azd version`
2. **Penerapan Pertama**: Terapkan template todo-nodejs-mongo dengan sukses
3. **Pengaturan Lingkungan**: Konfigurasikan variabel lingkungan pertama Anda
4. **Eksplorasi Sumber Daya**: Jelajahi sumber daya yang diterapkan di Azure Portal

#### Pertanyaan Penilaian
- Apa saja komponen inti dari proyek AZD?
- Bagaimana cara menginisialisasi proyek baru dari template?
- Apa perbedaan antara `azd up` dan `azd deploy`?
- Bagaimana cara mengelola beberapa lingkungan dengan AZD?

---

### Bab 2: Pengembangan Berbasis AI (Minggu 2)
**Durasi**: 1-2 jam | **Kompleksitas**: ⭐⭐

#### Tujuan Pembelajaran
- Mengintegrasikan layanan Azure AI Foundry dengan alur kerja AZD
- Menerapkan dan mengonfigurasi aplikasi berbasis AI
- Memahami pola implementasi RAG (Retrieval-Augmented Generation)
- Mengelola penerapan dan penskalaan model AI

#### Konsep Utama yang Harus Dikuasai
- Integrasi layanan Azure OpenAI dan pengelolaan API
- Konfigurasi AI Search dan pengindeksan vektor
- Strategi penerapan model dan perencanaan kapasitas
- Pemantauan aplikasi AI dan optimasi kinerja

#### Latihan Praktik
1. **Penerapan Chat AI**: Terapkan template azure-search-openai-demo
2. **Implementasi RAG**: Konfigurasikan pengindeksan dan pengambilan dokumen
3. **Konfigurasi Model**: Atur beberapa model AI untuk tujuan yang berbeda
4. **Pemantauan AI**: Terapkan Application Insights untuk beban kerja AI

#### Pertanyaan Penilaian
- Bagaimana cara mengonfigurasi layanan Azure OpenAI dalam template AZD?
- Apa saja komponen utama dari arsitektur RAG?
- Bagaimana cara mengelola kapasitas dan penskalaan model AI?
- Metode pemantauan apa yang penting untuk aplikasi AI?

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
- Pengelolaan parameter khusus lingkungan

#### Latihan Praktik
1. **Pengaturan Multi-Lingkungan**: Konfigurasikan lingkungan dev, staging, dan prod
2. **Konfigurasi Keamanan**: Terapkan autentikasi identitas terkelola
3. **Pengelolaan Rahasia**: Integrasikan Azure Key Vault untuk data sensitif
4. **Pengelolaan Parameter**: Buat konfigurasi khusus lingkungan

#### Pertanyaan Penilaian
- Bagaimana cara mengonfigurasi lingkungan yang berbeda dengan AZD?
- Apa keuntungan menggunakan identitas terkelola dibandingkan service principal?
- Bagaimana cara mengelola rahasia aplikasi dengan aman?
- Apa hierarki konfigurasi dalam AZD?

---

### Bab 4: Infrastruktur sebagai Kode & Penerapan (Minggu 4-5)
**Durasi**: 1-1,5 jam | **Kompleksitas**: ⭐⭐⭐

#### Tujuan Pembelajaran
- Membuat dan menyesuaikan template infrastruktur Bicep
- Menerapkan pola dan alur kerja penerapan lanjutan
- Memahami strategi penyediaan sumber daya
- Merancang arsitektur multi-layanan yang skalabel

#### Konsep Utama yang Harus Dikuasai
- Struktur template Bicep dan praktik terbaik
- Ketergantungan sumber daya dan urutan penerapan
- File parameter dan modularitas template
- Hook khusus dan otomatisasi penerapan

#### Latihan Praktik
1. **Pembuatan Template Khusus**: Bangun template aplikasi multi-layanan
2. **Penguasaan Bicep**: Buat komponen infrastruktur modular dan dapat digunakan kembali
3. **Otomatisasi Penerapan**: Terapkan hook sebelum/sesudah penerapan
4. **Desain Arsitektur**: Terapkan arsitektur microservices yang kompleks

#### Pertanyaan Penilaian
- Bagaimana cara membuat template Bicep khusus untuk AZD?
- Apa praktik terbaik untuk mengorganisasi kode infrastruktur?
- Bagaimana cara menangani ketergantungan sumber daya dalam template?
- Pola penerapan apa yang mendukung pembaruan tanpa downtime?

---

### Bab 5: Solusi AI Multi-Agen (Minggu 6-7)
**Durasi**: 2-3 jam | **Kompleksitas**: ⭐⭐⭐⭐

#### Tujuan Pembelajaran
- Merancang dan menerapkan arsitektur AI multi-agen
- Mengorkestrasi koordinasi dan komunikasi agen
- Menerapkan solusi AI siap-produksi dengan pemantauan
- Memahami spesialisasi agen dan pola alur kerja

#### Konsep Utama yang Harus Dikuasai
- Pola arsitektur multi-agen dan prinsip desain
- Protokol komunikasi agen dan aliran data
- Strategi penskalaan dan penyeimbangan beban untuk agen AI
- Pemantauan produksi untuk sistem multi-agen

#### Latihan Praktik
1. **Penerapan Solusi Ritel**: Terapkan skenario ritel multi-agen lengkap
2. **Kustomisasi Agen**: Modifikasi perilaku agen Pelanggan dan Inventaris
3. **Penskalaan Arsitektur**: Terapkan penyeimbangan beban dan penskalaan otomatis
4. **Pemantauan Produksi**: Atur pemantauan dan peringatan yang komprehensif

#### Pertanyaan Penilaian
- Bagaimana cara merancang pola komunikasi multi-agen yang efektif?
- Apa saja pertimbangan utama untuk penskalaan beban kerja agen AI?
- Bagaimana cara memantau dan memecahkan masalah sistem AI multi-agen?
- Pola produksi apa yang memastikan keandalan agen AI?

---

### Bab 6: Validasi & Perencanaan Pra-Penerapan (Minggu 8)
**Durasi**: 1 jam | **Kompleksitas**: ⭐⭐

#### Tujuan Pembelajaran
- Melakukan perencanaan kapasitas dan validasi sumber daya yang komprehensif
- Memilih SKU Azure yang optimal untuk efisiensi biaya
- Menerapkan pemeriksaan otomatis dan validasi pra-penerapan
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
2. Bagaimana cara memvalidasi ketersediaan sumber daya Azure sebelum melakukan deployment?  
3. Apa saja komponen utama dari sistem pemeriksaan pra-deployment?  
4. Bagaimana cara memperkirakan dan mengontrol biaya deployment?  
5. Monitoring apa yang penting untuk perencanaan kapasitas?

### Modul 5: Pemecahan Masalah dan Debugging (Minggu 6)

#### Tujuan Pembelajaran  
- Kuasai metodologi pemecahan masalah secara sistematis  
- Kembangkan keahlian dalam debugging masalah deployment yang kompleks  
- Terapkan monitoring dan alerting yang komprehensif  
- Bangun prosedur respons insiden dan pemulihan  

#### Konsep Utama yang Harus Dikuasai  
- Pola kegagalan deployment yang umum  
- Teknik analisis dan korelasi log  
- Monitoring kinerja dan optimasi  
- Deteksi dan respons insiden keamanan  
- Pemulihan bencana dan kelangsungan bisnis  

#### Latihan Praktik  

**Latihan 5.1: Skenario Pemecahan Masalah**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```  

**Latihan 5.2: Implementasi Monitoring**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```  

**Latihan 5.3: Respons Insiden**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```  

#### Pertanyaan Penilaian Diri  
1. Apa pendekatan sistematis untuk troubleshooting deployment azd?  
2. Bagaimana cara mengkorelasikan log di berbagai layanan dan sumber daya?  
3. Monitoring metrik apa yang paling penting untuk deteksi masalah dini?  
4. Bagaimana cara menerapkan prosedur pemulihan bencana yang efektif?  
5. Apa saja komponen utama dari rencana respons insiden?  

### Modul 6: Topik Lanjutan dan Praktik Terbaik (Minggu 7-8)

#### Tujuan Pembelajaran  
- Terapkan pola deployment tingkat enterprise  
- Kuasai integrasi dan otomatisasi CI/CD  
- Kembangkan template kustom dan berkontribusi pada komunitas  
- Pahami persyaratan keamanan dan kepatuhan tingkat lanjut  

#### Konsep Utama yang Harus Dikuasai  
- Pola integrasi pipeline CI/CD  
- Pengembangan dan distribusi template kustom  
- Tata kelola dan kepatuhan tingkat enterprise  
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

**Latihan 6.2: Pengembangan Template Kustom**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```  

**Latihan 6.3: Implementasi Enterprise**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```  

#### Pertanyaan Penilaian Diri  
1. Bagaimana cara mengintegrasikan azd ke dalam workflow CI/CD yang ada?  
2. Apa saja pertimbangan utama untuk pengembangan template kustom?  
3. Bagaimana cara menerapkan tata kelola dan kepatuhan dalam deployment azd?  
4. Apa praktik terbaik untuk deployment skala enterprise?  
5. Bagaimana cara berkontribusi secara efektif ke komunitas azd?  

## Proyek Praktis  

### Proyek 1: Website Portofolio Pribadi  
**Kompleksitas**: Pemula  
**Durasi**: 1-2 minggu  

Bangun dan deploy website portofolio pribadi menggunakan:  
- Hosting website statis di Azure Storage  
- Konfigurasi domain kustom  
- Integrasi CDN untuk performa global  
- Pipeline deployment otomatis  

**Deliverables**:  
- Website yang berfungsi dan terdeploy di Azure  
- Template azd kustom untuk deployment portofolio  
- Dokumentasi proses deployment  
- Rekomendasi analisis dan optimasi biaya  

### Proyek 2: Aplikasi Manajemen Tugas  
**Kompleksitas**: Menengah  
**Durasi**: 2-3 minggu  

Buat aplikasi manajemen tugas full-stack dengan:  
- Frontend React yang di-deploy ke App Service  
- Backend API Node.js dengan autentikasi  
- Database PostgreSQL dengan migrasi  
- Monitoring menggunakan Application Insights  

**Deliverables**:  
- Aplikasi lengkap dengan autentikasi pengguna  
- Skrip skema database dan migrasi  
- Dashboard monitoring dan aturan alerting  
- Konfigurasi deployment multi-environment  

### Proyek 3: Platform E-commerce Berbasis Microservices  
**Kompleksitas**: Lanjutan  
**Durasi**: 4-6 minggu  

Desain dan implementasikan platform e-commerce berbasis microservices:  
- Layanan API (katalog, pesanan, pembayaran, pengguna)  
- Integrasi antrian pesan dengan Service Bus  
- Cache Redis untuk optimasi performa  
- Logging dan monitoring yang komprehensif  

**Deliverables**:  
- Arsitektur microservices yang lengkap  
- Pola komunikasi antar layanan  
- Pengujian performa dan optimasi  
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
- Latihan troubleshooting konfigurasi  
- Implementasi konfigurasi keamanan  

**Penilaian Modul 3**: Deployment dan provisioning  
- Tantangan desain infrastruktur  
- Skenario deployment multi-layanan  
- Latihan optimasi performa  

**Penilaian Modul 4**: Validasi pra-deployment  
- Studi kasus perencanaan kapasitas  
- Skenario optimasi biaya  
- Implementasi pipeline validasi  

**Penilaian Modul 5**: Pemecahan masalah dan debugging  
- Latihan diagnosis masalah  
- Tugas implementasi monitoring  
- Simulasi respons insiden  

**Penilaian Modul 6**: Topik lanjutan  
- Desain pipeline CI/CD  
- Pengembangan template kustom  
- Skenario arsitektur tingkat enterprise  

### Proyek Akhir  

Desain dan implementasikan solusi lengkap yang menunjukkan penguasaan semua konsep:  

**Persyaratan**:  
- Arsitektur aplikasi multi-tier  
- Beberapa lingkungan deployment  
- Monitoring dan alerting yang komprehensif  
- Implementasi keamanan dan kepatuhan  
- Optimasi biaya dan tuning performa  
- Dokumentasi lengkap dan runbook  

**Kriteria Evaluasi**:  
- Kualitas implementasi teknis  
- Kelengkapan dokumentasi  
- Kepatuhan terhadap keamanan dan praktik terbaik  
- Optimasi performa dan biaya  
- Efektivitas troubleshooting dan monitoring  

## Sumber Belajar dan Referensi  

### Dokumentasi Resmi  
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Dokumentasi Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

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
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Rekomendasi Jadwal Belajar  

### Belajar Penuh Waktu (8 minggu)  
- **Minggu 1-2**: Modul 1-2 (Memulai, Konfigurasi)  
- **Minggu 3-4**: Modul 3-4 (Deployment, Validasi Pra-deployment)  
- **Minggu 5-6**: Modul 5-6 (Pemecahan Masalah, Topik Lanjutan)  
- **Minggu 7-8**: Proyek Praktis dan Penilaian Akhir  

### Belajar Paruh Waktu (16 minggu)  
- **Minggu 1-4**: Modul 1 (Memulai)  
- **Minggu 5-7**: Modul 2 (Konfigurasi dan Lingkungan)  
- **Minggu 8-10**: Modul 3 (Deployment dan Provisioning)  
- **Minggu 11-12**: Modul 4 (Validasi Pra-deployment)  
- **Minggu 13-14**: Modul 5 (Pemecahan Masalah dan Debugging)  
- **Minggu 15-16**: Modul 6 (Topik Lanjutan dan Penilaian)  

---

## Pelacakan Kemajuan dan Kerangka Penilaian  

### Daftar Periksa Penyelesaian Bab  

Lacak kemajuan Anda melalui setiap bab dengan hasil yang terukur:  

#### 📚 Bab 1: Dasar & Memulai Cepat  
- [ ] **Instalasi Selesai**: AZD terinstal dan diverifikasi di platform Anda  
- [ ] **Deployment Pertama**: Berhasil deploy template todo-nodejs-mongo  
- [ ] **Pengaturan Lingkungan**: Konfigurasi variabel lingkungan pertama  
- [ ] **Navigasi Sumber Daya**: Jelajahi sumber daya yang terdeploy di Azure Portal  
- [ ] **Penguasaan Perintah**: Nyaman dengan perintah dasar AZD  

#### 🤖 Bab 2: Pengembangan Berbasis AI  
- [ ] **Deployment Template AI**: Berhasil deploy azure-search-openai-demo  
- [ ] **Implementasi RAG**: Konfigurasi pengindeksan dan pengambilan dokumen  
- [ ] **Konfigurasi Model**: Mengatur beberapa model AI dengan tujuan berbeda  
- [ ] **Monitoring AI**: Implementasi Application Insights untuk workload AI  
- [ ] **Optimasi Performa**: Tuning performa aplikasi AI  

#### ⚙️ Bab 3: Konfigurasi & Autentikasi  
- [ ] **Pengaturan Multi-Lingkungan**: Konfigurasi lingkungan dev, staging, dan prod  
- [ ] **Implementasi Keamanan**: Mengatur autentikasi identitas terkelola  
- [ ] **Manajemen Rahasia**: Integrasi Azure Key Vault untuk data sensitif  
- [ ] **Manajemen Parameter**: Membuat konfigurasi spesifik lingkungan  
- [ ] **Penguasaan Autentikasi**: Implementasi pola akses yang aman  

#### 🏗️ Bab 4: Infrastruktur sebagai Kode & Deployment  
- [ ] **Pembuatan Template Kustom**: Membangun template aplikasi multi-layanan  
- [ ] **Penguasaan Bicep**: Membuat komponen infrastruktur modular dan dapat digunakan kembali  
- [ ] **Otomasi Deployment**: Implementasi hook pra/pasca deployment  
- [ ] **Desain Arsitektur**: Deploy arsitektur microservices yang kompleks  
- [ ] **Optimasi Template**: Optimasi template untuk performa dan biaya  

#### 🎯 Bab 5: Solusi AI Multi-Agent  
- [ ] **Deployment Solusi Retail**: Berhasil deploy skenario retail multi-agent lengkap  
- [ ] **Kustomisasi Agent**: Modifikasi perilaku agen Customer dan Inventory  
- [ ] **Scaling Arsitektur**: Implementasi load balancing dan auto-scaling  
- [ ] **Monitoring Produksi**: Pengaturan monitoring dan alerting yang komprehensif  
- [ ] **Tuning Performa**: Optimasi performa sistem multi-agent  

#### 🔍 Bab 6: Validasi Pra-Deployment & Perencanaan  
- [ ] **Analisis Kapasitas**: Analisis kebutuhan sumber daya untuk aplikasi  
- [ ] **Optimasi SKU**: Memilih tier layanan yang hemat biaya  
- [ ] **Otomasi Validasi**: Implementasi skrip pemeriksaan pra-deployment  
- [ ] **Perencanaan Biaya**: Membuat estimasi biaya deployment dan anggaran  
- [ ] **Penilaian Risiko**: Identifikasi dan mitigasi risiko deployment  

#### 🚨 Bab 7: Pemecahan Masalah & Debugging  
- [ ] **Kemampuan Diagnostik**: Berhasil debugging deployment yang sengaja rusak  
- [ ] **Analisis Log**: Menggunakan Azure Monitor dan Application Insights secara efektif  
- [ ] **Tuning Performa**: Optimasi aplikasi yang lambat  
- [ ] **Prosedur Pemulihan**: Implementasi backup dan pemulihan bencana  
- [ ] **Pengaturan Monitoring**: Membuat monitoring dan alerting yang proaktif  

#### 🏢 Bab 8: Pola Produksi & Enterprise  
- [ ] **Keamanan Enterprise**: Implementasi pola keamanan yang komprehensif  
- [ ] **Kerangka Tata Kelola**: Pengaturan Azure Policy dan manajemen sumber daya  
- [ ] **Monitoring Tingkat Lanjut**: Membuat dashboard dan alerting otomatis  
- [ ] **Integrasi CI/CD**: Membangun pipeline deployment otomatis  
- [ ] **Implementasi Kepatuhan**: Memenuhi persyaratan kepatuhan tingkat enterprise  

### Garis Waktu Pembelajaran dan Tonggak  

#### Minggu 1-2: Membangun Fondasi  
- **Tonggak**: Deploy aplikasi AI pertama menggunakan AZD  
- **Validasi**: Aplikasi yang berfungsi dapat diakses melalui URL publik  
- **Keterampilan**: Workflow dasar AZD dan integrasi layanan AI  

#### Minggu 3-4: Penguasaan Konfigurasi  
- **Tonggak**: Deployment multi-lingkungan dengan autentikasi yang aman  
- **Validasi**: Aplikasi yang sama terdeploy ke dev/staging/prod  
- **Keterampilan**: Manajemen lingkungan dan implementasi keamanan  

#### Minggu 5-6: Keahlian Infrastruktur  
- **Tonggak**: Template kustom untuk aplikasi multi-layanan yang kompleks  
- **Validasi**: Template yang dapat digunakan kembali terdeploy oleh anggota tim lain  
- **Keterampilan**: Penguasaan Bicep dan otomasi infrastruktur  

#### Minggu 7-8: Implementasi AI Tingkat Lanjut  
- **Tonggak**: Solusi AI multi-agent siap produksi  
- **Validasi**: Sistem menangani beban dunia nyata dengan monitoring  
- **Keterampilan**: Orkestrasi multi-agent dan optimasi performa  

#### Minggu 9-10: Kesiapan Produksi  
- **Tonggak**: Deployment tingkat enterprise dengan kepatuhan penuh  
- **Validasi**: Lolos tinjauan keamanan dan audit optimasi biaya  
- **Keterampilan**: Tata kelola, monitoring, dan integrasi CI/CD  

### Penilaian dan Sertifikasi  

#### Metode Validasi Pengetahuan  
1. **Deployment Praktis**: Aplikasi yang berfungsi untuk setiap bab  
2. **Review Kode**: Penilaian kualitas template dan konfigurasi  
3. **Pemecahan Masalah**: Skenario troubleshooting dan solusi  
4. **Pengajaran Rekan**: Menjelaskan konsep kepada pelajar lain  
5. **Kontribusi Komunitas**: Berbagi template atau perbaikan  

#### Hasil Pengembangan Profesional  
- **Proyek Portofolio**: 8 deployment siap produksi  
- **Keterampilan Teknis**: Keahlian deployment AZD dan AI standar industri  
- **Kemampuan Pemecahan Masalah**: Troubleshooting dan optimasi mandiri  
- **Pengakuan Komunitas**: Partisipasi aktif di komunitas pengembang Azure  
- **Kemajuan Karir**: Keterampilan yang langsung dapat diterapkan pada peran cloud dan AI  

#### Metrik Keberhasilan  
- **Tingkat Keberhasilan Deployment**: >95% deployment berhasil  
- **Waktu Troubleshooting**: <30 menit untuk masalah umum  
- **Optimasi Performa**: Peningkatan yang dapat ditunjukkan dalam biaya dan performa  
- **Kepatuhan Keamanan**: Semua deployment memenuhi standar keamanan enterprise  
- **Transfer Pengetahuan**: Kemampuan untuk membimbing pengembang lain  

### Pembelajaran Berkelanjutan dan Keterlibatan Komunitas  

#### Tetap Terupdate  
- **Pembaruan Azure**: Ikuti catatan rilis Azure Developer CLI  
- **Acara Komunitas**: Berpartisipasi dalam acara pengembang Azure dan AI  
- **Dokumentasi**: Berkontribusi pada dokumentasi komunitas dan contoh-contoh
- **Umpan Balik**: Berikan masukan tentang konten kursus dan layanan Azure

#### Pengembangan Karir
- **Jaringan Profesional**: Terhubung dengan para ahli Azure dan AI
- **Kesempatan Berbicara**: Presentasikan pembelajaran di konferensi atau meetup
- **Kontribusi Open Source**: Berkontribusi pada template dan alat AZD
- **Mentorship**: Membimbing pengembang lain dalam perjalanan belajar AZD mereka

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Mulai Belajar**: [Bab 1: Dasar & Mulai Cepat](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Pelacakan Kemajuan**: Lacak perkembangan Anda melalui sistem pembelajaran 8 bab yang komprehensif
- **🤝 Komunitas**: [Azure Discord](https://discord.gg/microsoft-azure) untuk dukungan dan diskusi

**Pelacakan Kemajuan Studi**: Gunakan panduan terstruktur ini untuk menguasai Azure Developer CLI melalui pembelajaran progresif, praktis, dengan hasil yang terukur dan manfaat pengembangan profesional.

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk memberikan hasil yang akurat, harap diingat bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.