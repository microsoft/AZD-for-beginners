# Glosarium - Terminologi Azure dan AZD

**Referensi untuk Semua Bab**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Pelajari Dasar**: [Bab 1: Dasar-dasar AZD](../docs/getting-started/azd-basics.md)
- **🤖 Istilah AI**: [Bab 2: Pengembangan Berorientasi AI](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introduction

Glosarium komprehensif ini menyediakan definisi untuk istilah, konsep, dan singkatan yang digunakan dalam Azure Developer CLI dan pengembangan cloud Azure. Referensi penting untuk memahami dokumentasi teknis, memecahkan masalah, dan berkomunikasi secara efektif tentang proyek azd dan layanan Azure.

## Tujuan Pembelajaran

Dengan menggunakan glosarium ini, Anda akan:
- Memahami terminologi dan konsep penting Azure Developer CLI
- Menguasai kosakata dan istilah teknis pengembangan cloud Azure
- Menyusun referensi terminologi Infrastructure as Code dan deployment secara efisien
- Memahami nama layanan Azure, singkatan, dan tujuan mereka
- Mengakses definisi untuk terminologi pemecahan masalah dan debugging
- Mempelajari konsep arsitektur dan pengembangan Azure lanjutan

## Hasil Pembelajaran

Dengan merujuk glosarium ini secara rutin, Anda akan mampu:
- Berkomunikasi secara efektif menggunakan terminologi Azure Developer CLI yang tepat
- Memahami dokumentasi teknis dan pesan kesalahan dengan lebih jelas
- Menavigasi layanan dan konsep Azure dengan percaya diri
- Memecahkan masalah menggunakan kosakata teknis yang tepat
- Berkontribusi pada diskusi tim dengan bahasa teknis yang akurat
- Memperluas pengetahuan pengembangan cloud Azure secara sistematis

## A

**Template ARM**  
Template Azure Resource Manager. Format Infrastructure as Code berbasis JSON yang digunakan untuk mendefinisikan dan menyebarkan sumber daya Azure secara deklaratif.

**App Service**  
Penawaran platform-sebagai-layanan (PaaS) Azure untuk hosting aplikasi web, REST API, dan backend mobile tanpa harus mengelola infrastruktur.

**Application Insights**  
Layanan pemantauan performa aplikasi (APM) Azure yang memberikan wawasan mendalam tentang kinerja, ketersediaan, dan penggunaan aplikasi.

**Azure CLI**  
Antarmuka baris perintah untuk mengelola sumber daya Azure. Digunakan oleh azd untuk otentikasi dan beberapa operasi.

**Azure Developer CLI (azd)**  
Alat baris perintah yang berfokus pada pengembang yang mempercepat proses membangun dan menyebarkan aplikasi ke Azure menggunakan template dan Infrastructure as Code.

**azure.yaml**  
File konfigurasi utama untuk proyek azd yang mendefinisikan layanan, infrastruktur, dan hook deployment.

**Azure Resource Manager (ARM)**  
Layanan penerapan dan manajemen Azure yang menyediakan lapisan manajemen untuk membuat, memperbarui, dan menghapus sumber daya.

## B

**Bicep**  
Bahasa domain-specific (DSL) yang dikembangkan oleh Microsoft untuk menyebarkan sumber daya Azure. Menyediakan sintaks yang lebih sederhana dibandingkan template ARM sambil dikompilasi ke ARM.

**Build**  
Proses mengompilasi kode sumber, menginstal dependensi, dan menyiapkan aplikasi untuk deployment.

**Blue-Green Deployment**  
Strategi deployment yang menggunakan dua lingkungan produksi identik (biru dan hijau) untuk meminimalkan downtime dan risiko.

## C

**Container Apps**  
Layanan container serverless Azure yang memungkinkan menjalankan aplikasi ter-container tanpa mengelola infrastruktur yang kompleks.

**CI/CD**  
Continuous Integration/Continuous Deployment. Praktik otomatis untuk mengintegrasikan perubahan kode dan menyebarkan aplikasi.

**Cosmos DB**  
Layanan database multi-model terdistribusi global Azure yang menyediakan SLA komprehensif untuk throughput, latensi, ketersediaan, dan konsistensi.

**Configuration**  
Pengaturan dan parameter yang mengontrol perilaku aplikasi dan opsi deployment.

## D

**Deployment**  
Proses menginstal dan mengonfigurasikan aplikasi serta dependensinya pada infrastruktur target.

**Docker**  
Platform untuk mengembangkan, mengirimkan, dan menjalankan aplikasi menggunakan teknologi containerisasi.

**Dockerfile**  
File teks yang berisi instruksi untuk membangun gambar (image) Docker.

## E

**Environment**  
Target deployment yang merepresentasikan instance spesifik dari aplikasi Anda (misalnya, development, staging, production).

**Environment Variables**  
Nilai konfigurasi yang disimpan sebagai pasangan kunci-nilai yang dapat diakses aplikasi saat runtime.

**Endpoint**  
URL atau alamat jaringan tempat aplikasi atau layanan dapat diakses.

## F

**Function App**  
Layanan komputasi serverless Azure yang memungkinkan menjalankan kode berbasis event tanpa mengelola infrastruktur.

## G

**GitHub Actions**  
Platform CI/CD yang terintegrasi dengan repositori GitHub untuk mengotomatiskan workflow.

**Git**  
Sistem kontrol versi terdistribusi yang digunakan untuk melacak perubahan pada kode sumber.

## H

**Hooks**  
Script atau perintah kustom yang dijalankan pada titik-titik tertentu selama siklus deployment (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Tipe layanan Azure tempat aplikasi akan disebarkan (misalnya, appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktik mendefinisikan dan mengelola infrastruktur melalui kode alih-alih proses manual.

**Init**  
Proses menginisialisasi proyek azd baru, biasanya dari template.

## J

**JSON**  
JavaScript Object Notation. Format pertukaran data yang umum digunakan untuk file konfigurasi dan respons API.

**JWT**  
JSON Web Token. Standar untuk mentransmisikan informasi secara aman antar pihak dalam bentuk objek JSON.

## K

**Key Vault**  
Layanan Azure untuk menyimpan dan mengelola rahasia, kunci, dan sertifikat secara aman.

**Kusto Query Language (KQL)**  
Bahasa kueri yang digunakan untuk menganalisis data di Azure Monitor, Application Insights, dan layanan Azure lainnya.

## L

**Load Balancer**  
Layanan yang mendistribusikan lalu lintas jaringan masuk ke beberapa server atau instance.

**Log Analytics**  
Layanan Azure untuk mengumpulkan, menganalisis, dan menindaklanjuti data telemetri dari lingkungan cloud dan on-premises.

## M

**Managed Identity**  
Fitur Azure yang menyediakan identitas yang dikelola secara otomatis untuk layanan Azure agar dapat melakukan otentikasi ke layanan Azure lainnya.

**Microservices**  
Pendekatan arsitektur di mana aplikasi dibangun sebagai kumpulan layanan kecil dan mandiri.

**Monitor**  
Solusi pemantauan terpadu Azure yang menyediakan observabilitas penuh pada aplikasi dan infrastruktur.

## N

**Node.js**  
Runtime JavaScript yang dibangun di atas mesin V8 Chrome untuk membuat aplikasi sisi server.

**npm**  
Manajer paket untuk Node.js yang mengelola dependensi dan paket.

## O

**Output**  
Nilai yang dikembalikan dari deployment infrastruktur yang dapat digunakan oleh aplikasi atau sumber daya lain.

## P

**Package**  
Proses menyiapkan kode aplikasi dan dependensi untuk deployment.

**Parameters**  
Nilai input yang diberikan ke template infrastruktur untuk menyesuaikan deployment.

**PostgreSQL**  
Sistem basis data relasional sumber terbuka yang didukung sebagai layanan terkelola di Azure.

**Provisioning**  
Proses membuat dan mengonfigurasi sumber daya Azure yang didefinisikan dalam template infrastruktur.

## Q

**Quota**  
Batasan jumlah sumber daya yang dapat dibuat dalam sebuah subscription atau region Azure.

## R

**Resource Group**  
Kontainer logis untuk sumber daya Azure yang berbagi siklus hidup, izin, dan kebijakan yang sama.

**Resource Token**  
String unik yang dihasilkan oleh azd untuk memastikan nama sumber daya unik di seluruh deployment.

**REST API**  
Gaya arsitektur untuk merancang aplikasi jaringan menggunakan metode HTTP.

**Rollback**  
Proses mengembalikan ke versi sebelumnya dari aplikasi atau konfigurasi infrastruktur.

## S

**Service**  
Komponen dari aplikasi Anda yang didefinisikan dalam azure.yaml (misalnya, frontend web, backend API, database).

**SKU**  
Stock Keeping Unit. Mewakili tier layanan atau level performa berbeda untuk sumber daya Azure.

**SQL Database**  
Layanan database relasional terkelola Azure yang berbasis Microsoft SQL Server.

**Static Web Apps**  
Layanan Azure untuk membangun dan menyebarkan aplikasi web full-stack dari repositori kode sumber.

**Storage Account**  
Layanan Azure yang menyediakan penyimpanan cloud untuk objek data termasuk blob, file, queue, dan tabel.

**Subscription**  
Kontainer akun Azure yang memuat resource group dan sumber daya, dengan penagihan dan manajemen akses terkait.

## T

**Template**  
Struktur proyek pra-bangun yang berisi kode aplikasi, definisi infrastruktur, dan konfigurasi untuk skenario umum.

**Terraform**  
Alat Infrastructure as Code open-source yang mendukung banyak penyedia cloud termasuk Azure.

**Traffic Manager**  
Load balancer berbasis DNS Azure untuk mendistribusikan lalu lintas di seluruh region Azure global.

## U

**URI**  
Uniform Resource Identifier. String yang mengidentifikasi sebuah sumber daya tertentu.

**URL**  
Uniform Resource Locator. Tipe URI yang menentukan lokasi sumber daya dan bagaimana mengambilnya.

## V

**Virtual Network (VNet)**  
Komponen dasar untuk jaringan privat di Azure, menyediakan isolasi dan segmentasi.

**VS Code**  
Visual Studio Code. Editor kode populer dengan integrasi Azure dan azd yang baik.

## W

**Webhook**  
Callback HTTP yang dipicu oleh event tertentu, biasanya digunakan dalam pipeline CI/CD.

**What-if**  
Fitur Azure yang menunjukkan perubahan apa yang akan dibuat oleh sebuah deployment tanpa benar-benar mengeksekusinya.

## Y

**YAML**  
YAML Ain't Markup Language. Standar serialisasi data yang mudah dibaca manusia yang digunakan untuk file konfigurasi seperti azure.yaml.

## Z

**Zone**  
Lokasi fisik terpisah di dalam sebuah region Azure yang menyediakan redundansi dan ketersediaan tinggi.

---

## Akronim Umum

| Acronym | Bentuk Penuh | Deskripsi |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Layanan manajemen identitas dan akses |
| ACR | Azure Container Registry | Layanan registri image container |
| AKS | Azure Kubernetes Service | Layanan Kubernetes terkelola |
| API | Application Programming Interface | Sekumpulan protokol untuk membangun perangkat lunak |
| ARM | Azure Resource Manager | Layanan penyebaran dan manajemen Azure |
| CDN | Content Delivery Network | Jaringan server terdistribusi untuk pengiriman konten |
| CI/CD | Continuous Integration/Continuous Deployment | Praktik pengembangan otomatis |
| CLI | Command Line Interface | Antarmuka pengguna berbasis teks |
| DNS | Domain Name System | Sistem untuk menerjemahkan nama domain ke alamat IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versi aman dari HTTP |
| IaC | Infrastructure as Code | Mengelola infrastruktur melalui kode |
| JSON | JavaScript Object Notation | Format pertukaran data |
| JWT | JSON Web Token | Format token untuk transmisi informasi yang aman |
| KQL | Kusto Query Language | Bahasa kueri untuk layanan data Azure |
| RBAC | Role-Based Access Control | Metode kontrol akses berdasarkan peran pengguna |
| REST | Representational State Transfer | Gaya arsitektur untuk layanan web |
| SDK | Software Development Kit | Kumpulan alat pengembangan |
| SLA | Service Level Agreement | Komitmen terhadap ketersediaan/performa layanan |
| SQL | Structured Query Language | Bahasa untuk mengelola basis data relasional |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protokol kriptografi |
| URI | Uniform Resource Identifier | String yang mengidentifikasi sebuah sumber daya |
| URL | Uniform Resource Locator | Tipe URI yang menentukan lokasi sumber daya |
| VM | Virtual Machine | Emulasi sistem komputer |
| VNet | Virtual Network | Jaringan privat di Azure |
| YAML | YAML Ain't Markup Language | Standar serialisasi data |

---

## Pemetaan Nama Layanan Azure

| Nama Umum | Nama Resmi Layanan Azure | Tipe Host azd |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Istilah Konteks Spesifik

### Istilah Pengembangan
- **Hot Reload**: Memperbarui aplikasi secara otomatis selama pengembangan tanpa me-restart
- **Build Pipeline**: Proses otomatis untuk membangun dan menguji kode
- **Deployment Slot**: Lingkungan staging di dalam App Service
- **Environment Parity**: Menjaga kesamaan antara lingkungan development, staging, dan production

### Istilah Keamanan
- **Managed Identity**: Fitur Azure yang menyediakan pengelolaan kredensial otomatis
- **Key Vault**: Penyimpanan aman untuk rahasia, kunci, dan sertifikat
- **RBAC**: Kontrol akses berbasis peran untuk sumber daya Azure
- **Network Security Group**: Firewall virtual untuk mengontrol lalu lintas jaringan

### Istilah Pemantauan
- **Telemetry**: Pengumpulan otomatis ukuran dan data
- **Application Performance Monitoring (APM)**: Pemantauan performa perangkat lunak
- **Log Analytics**: Layanan untuk mengumpulkan dan menganalisis data log
- **Alert Rules**: Notifikasi otomatis berdasarkan metrik atau kondisi

### Istilah Penyebaran
- **Blue-Green Deployment**: Strategi deployment tanpa downtime
- **Canary Deployment**: Peluncuran bertahap ke sebagian pengguna
- **Rolling Update**: Penggantian instance aplikasi secara berurutan
- **Rollback**: Mengembalikan ke versi aplikasi sebelumnya

---

**Tip Penggunaan**: Gunakan `Ctrl+F` untuk mencari istilah tertentu dengan cepat di glosarium ini. Istilah saling direferensikan bila berlaku.

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Ringkasan](cheat-sheet.md)
- **Pelajaran Selanjutnya**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan berbasis AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk akurat, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidaktepatan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang mungkin timbul akibat penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->