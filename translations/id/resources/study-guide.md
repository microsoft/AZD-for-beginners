<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T22:29:25+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "id"
}
-->
# Panduan Belajar - AZD untuk Pemula

## Pendahuluan

Panduan belajar yang komprehensif ini menyediakan tujuan pembelajaran yang terstruktur, konsep utama, latihan praktik, dan materi penilaian untuk membantu Anda menguasai Azure Developer CLI (azd). Gunakan panduan ini untuk melacak kemajuan Anda dan memastikan Anda telah mencakup semua topik penting.

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

## Struktur Kursus

### Modul 1: Memulai (Minggu 1-2)

#### Tujuan Pembelajaran
- Memahami dasar-dasar dan konsep inti Azure Developer CLI
- Berhasil menginstal dan mengonfigurasi azd di lingkungan pengembangan Anda
- Menyelesaikan penerapan pertama Anda menggunakan template yang ada
- Menavigasi struktur proyek azd dan memahami komponen utama

#### Konsep Utama yang Harus Dikuasai
- Template, lingkungan, dan layanan
- Struktur konfigurasi azure.yaml
- Perintah dasar azd (init, up, down, deploy)
- Prinsip Infrastructure as Code
- Autentikasi dan otorisasi Azure

#### Latihan Praktik

**Latihan 1.1: Instalasi dan Pengaturan**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Latihan 1.2: Penerapan Pertama**
```bash
# Deploy a simple web application:
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

#### Pertanyaan Penilaian Mandiri
1. Apa tiga konsep inti dari arsitektur azd?
2. Apa tujuan dari file azure.yaml?
3. Bagaimana lingkungan membantu mengelola target penerapan yang berbeda?
4. Metode autentikasi apa yang dapat digunakan dengan azd?
5. Apa yang terjadi saat Anda menjalankan `azd up` untuk pertama kalinya?

### Modul 2: Konfigurasi dan Lingkungan (Minggu 3)

#### Tujuan Pembelajaran
- Menguasai manajemen dan konfigurasi lingkungan
- Memahami konfigurasi azure.yaml tingkat lanjut
- Menerapkan pengaturan dan variabel khusus lingkungan
- Mengonfigurasi autentikasi untuk berbagai skenario

#### Konsep Utama yang Harus Dikuasai
- Hierarki lingkungan dan prioritas variabel
- Konfigurasi layanan dan parameter
- Hooks dan peristiwa siklus hidup
- Metode autentikasi (user, service principal, managed identity)
- Manajemen file konfigurasi

#### Latihan Praktik

**Latihan 2.1: Pengaturan Multi-Lingkungan**
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Latihan 2.2: Konfigurasi Tingkat Lanjut**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Latihan 2.3: Konfigurasi Keamanan**
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Pertanyaan Penilaian Mandiri
1. Bagaimana azd menangani prioritas variabel lingkungan?
2. Apa itu deployment hooks dan kapan Anda harus menggunakannya?
3. Bagaimana Anda mengonfigurasi SKU yang berbeda untuk lingkungan yang berbeda?
4. Apa implikasi keamanan dari berbagai metode autentikasi?
5. Bagaimana Anda mengelola rahasia dan data konfigurasi sensitif?

### Modul 3: Penerapan dan Penyediaan (Minggu 4)

#### Tujuan Pembelajaran
- Menguasai alur kerja penerapan dan praktik terbaik
- Memahami Infrastructure as Code dengan template Bicep
- Menerapkan arsitektur multi-layanan yang kompleks
- Mengoptimalkan kinerja dan keandalan penerapan

#### Konsep Utama yang Harus Dikuasai
- Struktur template Bicep dan modul
- Ketergantungan sumber daya dan urutan
- Strategi penerapan (blue-green, rolling updates)
- Penerapan multi-region
- Migrasi database dan manajemen data

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
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Latihan 3.3: Integrasi Database**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Pertanyaan Penilaian Mandiri
1. Apa keuntungan menggunakan Bicep dibandingkan ARM templates?
2. Bagaimana Anda menangani migrasi database dalam penerapan azd?
3. Strategi apa yang ada untuk penerapan tanpa downtime?
4. Bagaimana Anda mengelola ketergantungan antar layanan?
5. Apa pertimbangan untuk penerapan multi-region?

### Modul 4: Validasi Pra-Penerapan (Minggu 5)

#### Tujuan Pembelajaran
- Menerapkan pemeriksaan pra-penerapan yang komprehensif
- Menguasai perencanaan kapasitas dan validasi sumber daya
- Memahami pemilihan SKU dan optimasi biaya
- Membangun pipeline validasi otomatis

#### Konsep Utama yang Harus Dikuasai
- Kuota dan batas sumber daya Azure
- Kriteria pemilihan SKU dan implikasi biaya
- Skrip validasi otomatis dan alat
- Metodologi perencanaan kapasitas
- Pengujian kinerja dan optimasi

#### Latihan Praktik

**Latihan 4.1: Perencanaan Kapasitas**
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Latihan 4.2: Validasi Pra-Penerapan**
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Latihan 4.3: Optimasi SKU**
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Pertanyaan Penilaian Mandiri
1. Faktor apa yang harus memengaruhi keputusan pemilihan SKU?
2. Bagaimana Anda memvalidasi ketersediaan sumber daya Azure sebelum penerapan?
3. Apa komponen utama dari sistem pemeriksaan pra-penerapan?
4. Bagaimana Anda memperkirakan dan mengontrol biaya penerapan?
5. Pemantauan apa yang penting untuk perencanaan kapasitas?

### Modul 5: Pemecahan Masalah dan Debugging (Minggu 6)

#### Tujuan Pembelajaran
- Menguasai metodologi pemecahan masalah yang sistematis
- Mengembangkan keahlian dalam debugging masalah penerapan yang kompleks
- Menerapkan pemantauan dan pemberitahuan yang komprehensif
- Membangun prosedur respons dan pemulihan insiden

#### Konsep Utama yang Harus Dikuasai
- Pola kegagalan penerapan umum
- Teknik analisis dan korelasi log
- Pemantauan kinerja dan optimasi
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

**Latihan 5.2: Implementasi Pemantauan**
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

#### Pertanyaan Penilaian Mandiri
1. Apa pendekatan sistematis untuk memecahkan masalah penerapan azd?
2. Bagaimana Anda mengorelasikan log di berbagai layanan dan sumber daya?
3. Metrik pemantauan apa yang paling penting untuk deteksi masalah dini?
4. Bagaimana Anda menerapkan prosedur pemulihan bencana yang efektif?
5. Apa komponen utama dari rencana respons insiden?

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
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Latihan 6.3: Implementasi Perusahaan**
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Pertanyaan Penilaian Mandiri
1. Bagaimana Anda mengintegrasikan azd ke dalam alur kerja CI/CD yang ada?
2. Apa pertimbangan utama untuk pengembangan template khusus?
3. Bagaimana Anda menerapkan tata kelola dan kepatuhan dalam penerapan azd?
4. Apa praktik terbaik untuk penerapan skala perusahaan?
5. Bagaimana Anda berkontribusi secara efektif ke komunitas azd?

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
- Database PostgreSQL dengan migrasi
- Pemantauan Application Insights

**Hasil**:
- Aplikasi lengkap dengan autentikasi pengguna
- Skema database dan skrip migrasi
- Dashboard pemantauan dan aturan pemberitahuan
- Konfigurasi penerapan multi-lingkungan

### Proyek 3: Platform E-commerce Berbasis Microservices
**Kompleksitas**: Lanjutan  
**Durasi**: 4-6 minggu

Rancang dan implementasikan platform e-commerce berbasis microservices:
- Layanan API (katalog, pesanan, pembayaran, pengguna)
- Integrasi antrian pesan dengan Service Bus
- Cache Redis untuk optimasi kinerja
- Logging dan pemantauan yang komprehensif

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

Rancang dan implementasikan solusi lengkap yang menunjukkan penguasaan semua konsep:

**Persyaratan**:
- Arsitektur aplikasi multi-tier
- Beberapa lingkungan penerapan
- Pemantauan dan pemberitahuan yang komprehensif
- Implementasi keamanan dan kepatuhan
- Optimasi biaya dan tuning kinerja
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
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Rekomendasi Jadwal Belajar

### Belajar Penuh Waktu (8 minggu)
- **Minggu 1-2**: Modul 1-2 (Memulai, Konfigurasi)
- **Minggu 3-4**: Modul 3-4 (Penerapan, Validasi Pra-Penerapan)
- **Minggu 5-6**: Modul 5-6 (Pemecahan Masalah, Topik Lanjutan)
- **Minggu 7-8**: Proyek Praktis dan Penilaian Akhir

### Belajar Paruh Waktu (16 minggu)
- **Minggu 1-4**: Modul 1 (Memulai)
- **Minggu 5-7**: Modul 2 (Konfigurasi dan Lingkungan)
- **Minggu 8-10**: Modul 3 (Penerapan dan Penyediaan)
- **Minggu 11-12**: Modul 4 (Validasi Pra-Penerapan)
- **Minggu 13-14**: Modul 5 (Pemecahan Masalah dan Debugging)
- **Minggu 15-16**: Modul 6 (Topik Lanjutan dan Penilaian)

### Belajar Mandiri
- Selesaikan setiap modul sesuai kecepatan Anda sendiri
- Luangkan waktu tambahan untuk konsep yang menantang
- Ulangi latihan hingga Anda mencapai penguasaan
- Bergabunglah dalam diskusi komunitas dan ajukan pertanyaan

## Tips Sukses

### Strategi Belajar yang Efektif
1. **Latihan Secara Teratur**: Terapkan aplikasi secara sering untuk membangun memori otot
2. **Bereksperimen Tanpa Takut**: Gunakan lingkungan pengembangan untuk mencoba konfigurasi baru
3. **Dokumentasikan Pembelajaran Anda**: Catat solusi untuk masalah yang Anda temui
4. **Bergabung dengan Komunitas**: Ikuti diskusi dan berkontribusi pada proyek
5. **Tetap Terupdate**: Ikuti pembaruan Azure dan fitur baru azd

### Kesalahan Umum yang Harus Dihindari
1. **Melewatkan Prasyarat**: Pastikan Anda memiliki pengetahuan dasar yang memadai
2. **Terburu-buru Memahami Konsep**: Luangkan waktu untuk memahami dasar-dasar dengan baik
3. **Mengabaikan Keamanan**: Selalu terapkan praktik keamanan terbaik sejak awal
4. **Tidak Menguji Secara Menyeluruh**: Uji penerapan di berbagai lingkungan
5. **Menghindari Dokumentasi**: Dokumentasi yang baik sangat penting untuk pemeliharaan

### Membangun Pengalaman Praktis
1. **Mulai dari yang Sederhana**: Mulailah dengan aplikasi sederhana dan tingkatkan kompleksitas secara bertahap
2. **Belajar dari Kegagalan**: Gunakan latihan pemecahan masalah sebagai peluang pembelajaran
3. **Berkontribusi pada Open Source**: Bagikan template dan solusi Anda dengan komunitas  
4. **Ajari Orang Lain**: Menjelaskan konsep kepada orang lain memperkuat pemahaman Anda sendiri  
5. **Tetap Penasaran**: Teruslah mengeksplorasi layanan Azure baru dan pola integrasi  

---

**Navigasi**  
- **Pelajaran Sebelumnya**: [FAQ](faq.md)  
- **Pelajaran Selanjutnya**: [Changelog](../changelog.md)  

**Pelacakan Kemajuan Belajar**: Gunakan panduan ini untuk melacak perjalanan belajar Anda dan memastikan cakupan yang komprehensif dari semua konsep dan praktik Azure Developer CLI.  

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk memberikan hasil yang akurat, harap diingat bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.