# Glosarium - Terminologi Azure dan AZD

**Referensi untuk Semua Bab**
- **📚 Course Home**: [AZD Untuk Pemula](../README.md)
- **📖 Learn Basics**: [Bab 1: Dasar-dasar AZD](../docs/getting-started/azd-basics.md)
- **🤖 AI Terms**: [Bab 2: Pengembangan Berfokus AI](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Pendahuluan

Glosarium komprehensif ini menyediakan definisi untuk istilah, konsep, dan akronim yang digunakan dalam Azure Developer CLI dan pengembangan cloud Azure. Referensi penting untuk memahami dokumentasi teknis, memecahkan masalah, dan berkomunikasi secara efektif tentang proyek azd dan layanan Azure.

## Tujuan Pembelajaran

Dengan menggunakan glosarium ini, Anda akan:
- Memahami istilah dan konsep penting Azure Developer CLI
- Menguasai kosakata pengembangan cloud Azure dan istilah teknis
- Merujuk terminologi Infrastruktur sebagai Kode dan penyebaran dengan efisien
- Memahami nama layanan Azure, akronim, dan tujuannya
- Mengakses definisi untuk terminologi pemecahan masalah dan debugging
- Mempelajari konsep arsitektur dan pengembangan Azure yang lebih maju

## Hasil Pembelajaran

Dengan merujuk glosarium ini secara teratur, Anda akan mampu:
- Berkomunikasi secara efektif menggunakan terminologi Azure Developer CLI yang tepat
- Memahami dokumentasi teknis dan pesan kesalahan dengan lebih jelas
- Menavigasi layanan dan konsep Azure dengan percaya diri
- Memecahkan masalah menggunakan kosakata teknis yang sesuai
- Berkontribusi dalam diskusi tim dengan bahasa teknis yang akurat
- Mengembangkan pengetahuan pengembangan cloud Azure secara sistematis

## A

**ARM Template**  
Template Azure Resource Manager. Format Infrastructure as Code berbasis JSON yang digunakan untuk mendefinisikan dan menyebarkan sumber daya Azure secara deklaratif.

**App Service**  
Penawaran platform-sebagai-layanan (PaaS) Azure untuk menghosting aplikasi web, REST API, dan backend mobile tanpa mengelola infrastruktur.

**Application Insights**  
Layanan pemantauan kinerja aplikasi (APM) Azure yang memberikan wawasan mendalam mengenai kinerja aplikasi, ketersediaan, dan penggunaan.

**Azure CLI**  
Antarmuka baris perintah untuk mengelola sumber daya Azure. Digunakan oleh azd untuk otentikasi dan beberapa operasi.

**Azure Developer CLI (azd)**  
Alat baris perintah berfokus pengembang yang mempercepat proses membangun dan menyebarkan aplikasi ke Azure menggunakan template dan Infrastructure as Code.

**azure.yaml**  
File konfigurasi utama untuk proyek azd yang mendefinisikan layanan, infrastruktur, dan hook penyebaran.

**Azure Resource Manager (ARM)**  
Layanan penyebaran dan manajemen Azure yang menyediakan lapisan manajemen untuk membuat, memperbarui, dan menghapus sumber daya.

## B

**Bicep**  
Bahasa khusus domain (DSL) yang dikembangkan oleh Microsoft untuk menyebarkan sumber daya Azure. Menyediakan sintaks yang lebih sederhana daripada template ARM sekaligus dikompilasi ke ARM.

**Build**  
Proses mengompilasi kode sumber, menginstal dependensi, dan menyiapkan aplikasi untuk penyebaran.

**Blue-Green Deployment**  
Strategi penyebaran yang menggunakan dua lingkungan produksi identik (biru dan hijau) untuk meminimalkan waktu henti dan risiko.

## C

**Container Apps**  
Layanan kontainer serverless Azure yang memungkinkan menjalankan aplikasi terkontainer tanpa mengelola infrastruktur kompleks.

**CI/CD**  
Continuous Integration/Continuous Deployment. Praktik otomatis untuk mengintegrasikan perubahan kode dan menyebarkan aplikasi.

**Cosmos DB**  
Layanan database multi-model yang didistribusikan secara global dari Azure yang menyediakan SLA komprehensif untuk throughput, latensi, ketersediaan, dan konsistensi.

**Configuration**  
Pengaturan dan parameter yang mengontrol perilaku aplikasi dan opsi penyebaran.

## D

**Deployment**  
Proses menginstal dan mengonfigurasi aplikasi serta dependensinya pada infrastruktur target.

**Docker**  
Platform untuk mengembangkan, mengirim, dan menjalankan aplikasi menggunakan teknologi kontainerisasi.

**Dockerfile**  
File teks yang berisi instruksi untuk membangun image kontainer Docker.

## E

**Environment**  
Target penyebaran yang mewakili instance spesifik dari aplikasi Anda (mis. development, staging, production).

**Environment Variables**  
Nilai konfigurasi yang disimpan sebagai pasangan kunci-nilai yang dapat diakses aplikasi saat runtime.

**Endpoint**  
URL atau alamat jaringan tempat aplikasi atau layanan dapat diakses.

## F

**Function App**  
Layanan komputasi serverless Azure yang memungkinkan menjalankan kode berbasis event tanpa mengelola infrastruktur.

## G

**GitHub Actions**  
Platform CI/CD yang terintegrasi dengan repositori GitHub untuk mengotomatisasi alur kerja.

**Git**  
Sistem kontrol versi terdistribusi yang digunakan untuk melacak perubahan dalam kode sumber.

## H

**Hooks**  
Skrip atau perintah kustom yang dijalankan pada titik-titik tertentu selama siklus hidup penyebaran (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Tipe layanan Azure tempat aplikasi akan disebarkan (mis. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktik mendefinisikan dan mengelola infrastruktur melalui kode daripada proses manual.

**Init**  
Proses menginisialisasi proyek azd baru, biasanya dari template.

## J

**JSON**  
JavaScript Object Notation. Format pertukaran data yang umum digunakan untuk file konfigurasi dan respons API.

**JWT**  
JSON Web Token. Standar untuk mengirimkan informasi dengan aman antar pihak sebagai objek JSON.

## K

**Key Vault**  
Layanan Azure untuk menyimpan dan mengelola rahasia, kunci, dan sertifikat dengan aman.

**Kusto Query Language (KQL)**  
Bahasa kueri yang digunakan untuk menganalisis data di Azure Monitor, Application Insights, dan layanan Azure lainnya.

## L

**Load Balancer**  
Layanan yang mendistribusikan lalu lintas jaringan masuk ke beberapa server atau instance.

**Log Analytics**  
Layanan Azure untuk mengumpulkan, menganalisis, dan menindaklanjuti data telemetri dari lingkungan cloud dan on-premises.

## M

**Managed Identity**  
Fitur Azure yang menyediakan identitas yang dikelola secara otomatis untuk layanan Azure untuk otentikasi ke layanan Azure lainnya.

**Microservices**  
Pendekatan arsitektur di mana aplikasi dibangun sebagai kumpulan layanan kecil dan independen.

**Monitor**  
Solusi pemantauan terpadu Azure yang menyediakan observabilitas full-stack di seluruh aplikasi dan infrastruktur.

## N

**Node.js**  
Runtime JavaScript yang dibangun di atas mesin V8 Chrome untuk membangun aplikasi sisi server.

**npm**  
Manajer paket untuk Node.js yang mengelola dependensi dan paket.

## O

**Output**  
Nilai yang dikembalikan dari penyebaran infrastruktur yang dapat digunakan oleh aplikasi atau sumber daya lain.

## P

**Package**  
Proses menyiapkan kode aplikasi dan dependensi untuk penyebaran.

**Parameters**  
Nilai input yang diteruskan ke template infrastruktur untuk menyesuaikan penyebaran.

**PostgreSQL**  
Sistem basis data relasional open-source yang didukung sebagai layanan terkelola di Azure.

**Provisioning**  
Proses membuat dan mengonfigurasi sumber daya Azure yang didefinisikan dalam template infrastruktur.

## Q

**Quota**  
Batas jumlah sumber daya yang dapat dibuat dalam sebuah langganan atau wilayah Azure.

## R

**Resource Group**  
Kontainer logis untuk sumber daya Azure yang berbagi siklus hidup, izin, dan kebijakan yang sama.

**Resource Token**  
String unik yang dihasilkan oleh azd untuk memastikan nama sumber daya unik di seluruh penyebaran.

**REST API**  
Gaya arsitektur untuk merancang aplikasi jaringan menggunakan metode HTTP.

**Rollback**  
Proses mengembalikan ke versi sebelumnya dari aplikasi atau konfigurasi infrastruktur.

## S

**Service**  
Komponen dari aplikasi Anda yang didefinisikan di azure.yaml (mis. frontend web, backend API, database).

**SKU**  
Stock Keeping Unit. Mewakili tingkat layanan atau level kinerja yang berbeda untuk sumber daya Azure.

**SQL Database**  
Layanan basis data relasional terkelola Azure berbasis Microsoft SQL Server.

**Static Web Apps**  
Layanan Azure untuk membangun dan menyebarkan aplikasi web full-stack dari repositori kode sumber.

**Storage Account**  
Layanan Azure yang menyediakan penyimpanan cloud untuk objek data termasuk blob, file, antrean, dan tabel.

**Subscription**  
Kontainer akun Azure yang memuat resource group dan sumber daya, dengan penagihan dan manajemen akses terkait.

## T

**Template**  
Struktur proyek pra-bangun yang berisi kode aplikasi, definisi infrastruktur, dan konfigurasi untuk skenario umum.

**Terraform**  
Alat Infrastructure as Code open-source yang mendukung beberapa penyedia cloud termasuk Azure.

**Traffic Manager**  
Load balancer berbasis DNS Azure untuk mendistribusikan lalu lintas di seluruh wilayah Azure global.

## U

**URI**  
Uniform Resource Identifier. String yang mengidentifikasi sumber daya tertentu.

**URL**  
Uniform Resource Locator. Jenis URI yang menentukan lokasi sumber daya dan cara mengambilnya.

## V

**Virtual Network (VNet)**  
Blok bangunan fundamental untuk jaringan pribadi di Azure, menyediakan isolasi dan segmentasi.

**VS Code**  
Visual Studio Code. Editor kode populer dengan integrasi Azure dan azd yang baik.

## W

**Webhook**  
Callback HTTP yang dipicu oleh peristiwa tertentu, umum digunakan dalam pipeline CI/CD.

**What-if**  
Fitur Azure yang menunjukkan perubahan yang akan dilakukan oleh penyebaran tanpa benar-benar mengeksekusinya.

## Y

**YAML**  
YAML Ain't Markup Language. Standar serialisasi data yang mudah dibaca manusia yang digunakan untuk file konfigurasi seperti azure.yaml.

## Z

**Zone**  
Lokasi yang terpisah secara fisik di dalam sebuah wilayah Azure yang menyediakan redundansi dan ketersediaan tinggi.

---

## Akronim Umum

| Acronym | Full Form | Description |
|---------|-----------|-------------|
| AAD | Azure Active Directory (now Microsoft Entra ID) | Layanan manajemen identitas dan akses |
| ACR | Azure Container Registry | Layanan registry image kontainer |
| AKS | Azure Kubernetes Service | Layanan Kubernetes terkelola |
| API | Application Programming Interface | Sekumpulan protokol untuk membangun perangkat lunak |
| ARM | Azure Resource Manager | Layanan penyebaran dan manajemen Azure |
| CDN | Content Delivery Network | Jaringan server terdistribusi |
| CI/CD | Continuous Integration/Continuous Deployment | Praktik pengembangan yang terotomatisasi |
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
| SLA | Service Level Agreement | Komitmen untuk ketersediaan/kinerja layanan |
| SQL | Structured Query Language | Bahasa untuk mengelola basis data relasional |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protokol kriptografi |
| URI | Uniform Resource Identifier | String yang mengidentifikasi sumber daya |
| URL | Uniform Resource Locator | Jenis URI yang menentukan lokasi sumber daya |
| VM | Virtual Machine | Emulasi sistem komputer |
| VNet | Virtual Network | Jaringan pribadi di Azure |
| YAML | YAML Ain't Markup Language | Standar serialisasi data |

---

## Pemetaan Nama Layanan Azure

| Common Name | Official Azure Service Name | azd Host Type |
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
| Search | Azure AI Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Istilah Khusus Konteks

### Istilah Pengembangan
- **Hot Reload**: Memperbarui aplikasi secara otomatis selama pengembangan tanpa perlu memulai ulang
- **Build Pipeline**: Proses otomatis untuk membangun dan menguji kode
- **Deployment Slot**: Lingkungan staging di dalam App Service
- **Environment Parity**: Menjaga kesamaan antara lingkungan development, staging, dan production

### Istilah Keamanan
- **Managed Identity**: Fitur Azure yang menyediakan manajemen kredensial otomatis
- **Key Vault**: Penyimpanan aman untuk rahasia, kunci, dan sertifikat
- **RBAC**: Kontrol akses berbasis peran untuk sumber daya Azure
- **Network Security Group**: Firewall virtual untuk mengontrol lalu lintas jaringan

### Istilah Pemantauan
- **Telemetry**: Pengumpulan otomatis pengukuran dan data
- **Application Performance Monitoring (APM)**: Pemantauan kinerja perangkat lunak
- **Log Analytics**: Layanan untuk mengumpulkan dan menganalisis data log
- **Alert Rules**: Notifikasi otomatis berdasarkan metrik atau kondisi

### Istilah Penyebaran
- **Blue-Green Deployment**: Strategi penyebaran tanpa waktu henti
- **Canary Deployment**: Peluncuran bertahap ke subset pengguna
- **Rolling Update**: Penggantian instance aplikasi secara berurutan
- **Rollback**: Mengembalikan ke versi aplikasi sebelumnya

---

**Usage Tip**: Gunakan `Ctrl+F` untuk mencari istilah spesifik dengan cepat dalam glosarium ini. Istilah dirujuk silang bila relevan.

---

**Navigation**
- **Previous Lesson**: [Lembar Cepat](cheat-sheet.md)
- **Next Lesson**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->