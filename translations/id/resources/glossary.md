<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "59cb1c1635512e212da16d50f3259ca4",
  "translation_date": "2025-09-09T22:53:19+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "id"
}
-->
# Glosarium - Terminologi Azure Developer CLI

## Pendahuluan

Glosarium ini menyediakan definisi untuk istilah, konsep, dan akronim yang digunakan dalam Azure Developer CLI dan pengembangan cloud Azure. Referensi penting untuk memahami dokumentasi teknis, menyelesaikan masalah, dan berkomunikasi secara efektif tentang proyek azd dan layanan Azure.

## Tujuan Pembelajaran

Dengan menggunakan glosarium ini, Anda akan:
- Memahami terminologi dan konsep penting Azure Developer CLI
- Menguasai kosakata pengembangan cloud Azure dan istilah teknis
- Merujuk terminologi Infrastructure as Code dan deployment secara efisien
- Memahami nama layanan Azure, akronim, dan tujuannya
- Mengakses definisi untuk terminologi troubleshooting dan debugging
- Mempelajari konsep arsitektur dan pengembangan Azure tingkat lanjut

## Hasil Pembelajaran

Dengan merujuk glosarium ini secara teratur, Anda akan dapat:
- Berkomunikasi secara efektif menggunakan terminologi Azure Developer CLI yang tepat
- Memahami dokumentasi teknis dan pesan error dengan lebih jelas
- Menavigasi layanan dan konsep Azure dengan percaya diri
- Menyelesaikan masalah menggunakan kosakata teknis yang sesuai
- Berkontribusi dalam diskusi tim dengan bahasa teknis yang akurat
- Mengembangkan pengetahuan pengembangan cloud Azure secara sistematis

## A

**ARM Template**  
Template Azure Resource Manager. Format Infrastructure as Code berbasis JSON yang digunakan untuk mendefinisikan dan menerapkan sumber daya Azure secara deklaratif.

**App Service**  
Layanan platform-as-a-service (PaaS) Azure untuk hosting aplikasi web, REST API, dan backend mobile tanpa perlu mengelola infrastruktur.

**Application Insights**  
Layanan pemantauan kinerja aplikasi (APM) Azure yang memberikan wawasan mendalam tentang kinerja, ketersediaan, dan penggunaan aplikasi.

**Azure CLI**  
Antarmuka baris perintah untuk mengelola sumber daya Azure. Digunakan oleh azd untuk autentikasi dan beberapa operasi.

**Azure Developer CLI (azd)**  
Alat baris perintah yang berfokus pada pengembang untuk mempercepat proses membangun dan menerapkan aplikasi ke Azure menggunakan template dan Infrastructure as Code.

**azure.yaml**  
File konfigurasi utama untuk proyek azd yang mendefinisikan layanan, infrastruktur, dan hook deployment.

**Azure Resource Manager (ARM)**  
Layanan penerapan dan pengelolaan Azure yang menyediakan lapisan manajemen untuk membuat, memperbarui, dan menghapus sumber daya.

## B

**Bicep**  
Bahasa domain-specific (DSL) yang dikembangkan oleh Microsoft untuk menerapkan sumber daya Azure. Menyediakan sintaks yang lebih sederhana dibandingkan template ARM sambil tetap dikompilasi ke ARM.

**Build**  
Proses mengompilasi kode sumber, menginstal dependensi, dan mempersiapkan aplikasi untuk deployment.

**Blue-Green Deployment**  
Strategi deployment yang menggunakan dua lingkungan produksi identik (blue dan green) untuk meminimalkan downtime dan risiko.

## C

**Container Apps**  
Layanan container serverless Azure yang memungkinkan menjalankan aplikasi yang dikontainerisasi tanpa mengelola infrastruktur yang kompleks.

**CI/CD**  
Continuous Integration/Continuous Deployment. Praktik otomatis untuk mengintegrasikan perubahan kode dan menerapkan aplikasi.

**Cosmos DB**  
Layanan database multi-model yang didistribusikan secara global dari Azure yang menyediakan SLA komprehensif untuk throughput, latensi, ketersediaan, dan konsistensi.

**Configuration**  
Pengaturan dan parameter yang mengontrol perilaku aplikasi dan opsi deployment.

## D

**Deployment**  
Proses menginstal dan mengonfigurasi aplikasi serta dependensinya pada infrastruktur target.

**Docker**  
Platform untuk mengembangkan, mengirimkan, dan menjalankan aplikasi menggunakan teknologi containerisasi.

**Dockerfile**  
File teks yang berisi instruksi untuk membangun image container Docker.

## E

**Environment**  
Target deployment yang mewakili instance spesifik dari aplikasi Anda (misalnya, pengembangan, staging, produksi).

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
Script atau perintah khusus yang dijalankan pada titik tertentu selama siklus hidup deployment (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Jenis layanan Azure tempat aplikasi akan diterapkan (misalnya, appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktik mendefinisikan dan mengelola infrastruktur melalui kode daripada proses manual.

**Init**  
Proses menginisialisasi proyek azd baru, biasanya dari template.

## J

**JSON**  
JavaScript Object Notation. Format pertukaran data yang umum digunakan untuk file konfigurasi dan respons API.

**JWT**  
JSON Web Token. Standar untuk mentransmisikan informasi secara aman antara pihak-pihak sebagai objek JSON.

## K

**Key Vault**  
Layanan Azure untuk menyimpan dan mengelola rahasia, kunci, dan sertifikat secara aman.

**Kusto Query Language (KQL)**  
Bahasa kueri yang digunakan untuk menganalisis data di Azure Monitor, Application Insights, dan layanan Azure lainnya.

## L

**Load Balancer**  
Layanan yang mendistribusikan lalu lintas jaringan masuk ke beberapa server atau instance.

**Log Analytics**  
Layanan Azure untuk mengumpulkan, menganalisis, dan bertindak berdasarkan data telemetri dari lingkungan cloud dan on-premises.

## M

**Managed Identity**  
Fitur Azure yang menyediakan identitas yang dikelola secara otomatis untuk layanan Azure agar dapat mengautentikasi ke layanan Azure lainnya.

**Microservices**  
Pendekatan arsitektur di mana aplikasi dibangun sebagai kumpulan layanan kecil yang independen.

**Monitor**  
Solusi pemantauan terpadu Azure yang menyediakan observabilitas penuh untuk aplikasi dan infrastruktur.

## N

**Node.js**  
Runtime JavaScript yang dibangun di atas mesin JavaScript V8 Chrome untuk membangun aplikasi sisi server.

**npm**  
Pengelola paket untuk Node.js yang mengelola dependensi dan paket.

## O

**Output**  
Nilai yang dikembalikan dari deployment infrastruktur yang dapat digunakan oleh aplikasi atau sumber daya lainnya.

## P

**Package**  
Proses mempersiapkan kode aplikasi dan dependensi untuk deployment.

**Parameters**  
Nilai input yang diteruskan ke template infrastruktur untuk menyesuaikan deployment.

**PostgreSQL**  
Sistem database relasional open-source yang didukung sebagai layanan terkelola di Azure.

**Provisioning**  
Proses membuat dan mengonfigurasi sumber daya Azure yang didefinisikan dalam template infrastruktur.

## Q

**Quota**  
Batasan jumlah sumber daya yang dapat dibuat dalam langganan atau wilayah Azure.

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
Komponen aplikasi Anda yang didefinisikan dalam azure.yaml (misalnya, frontend web, backend API, database).

**SKU**  
Stock Keeping Unit. Mewakili tingkat layanan atau tingkat kinerja yang berbeda untuk sumber daya Azure.

**SQL Database**  
Layanan database relasional terkelola Azure yang berbasis Microsoft SQL Server.

**Static Web Apps**  
Layanan Azure untuk membangun dan menerapkan aplikasi web full-stack dari repositori kode sumber.

**Storage Account**  
Layanan Azure yang menyediakan penyimpanan cloud untuk objek data termasuk blob, file, antrean, dan tabel.

**Subscription**  
Kontainer akun Azure yang menyimpan grup sumber daya dan sumber daya, dengan manajemen penagihan dan akses terkait.

## T

**Template**  
Struktur proyek yang sudah dibuat sebelumnya yang berisi kode aplikasi, definisi infrastruktur, dan konfigurasi untuk skenario umum.

**Terraform**  
Alat Infrastructure as Code open-source yang mendukung banyak penyedia cloud termasuk Azure.

**Traffic Manager**  
Penyeimbang beban berbasis DNS Azure untuk mendistribusikan lalu lintas di seluruh wilayah Azure global.

## U

**URI**  
Uniform Resource Identifier. String yang mengidentifikasi sumber daya tertentu.

**URL**  
Uniform Resource Locator. Jenis URI yang menentukan lokasi sumber daya dan cara mengambilnya.

## V

**Virtual Network (VNet)**  
Blok bangunan dasar untuk jaringan pribadi di Azure, menyediakan isolasi dan segmentasi.

**VS Code**  
Visual Studio Code. Editor kode populer dengan integrasi Azure dan azd yang sangat baik.

## W

**Webhook**  
Callback HTTP yang dipicu oleh peristiwa tertentu, biasanya digunakan dalam pipeline CI/CD.

**What-if**  
Fitur Azure yang menunjukkan perubahan apa yang akan dilakukan oleh deployment tanpa benar-benar menjalankannya.

## Y

**YAML**  
YAML Ain't Markup Language. Standar serialisasi data yang mudah dibaca manusia yang digunakan untuk file konfigurasi seperti azure.yaml.

## Z

**Zone**  
Lokasi fisik yang terpisah dalam wilayah Azure yang menyediakan redundansi dan ketersediaan tinggi.

---

## Akronim Umum

| Akronim | Bentuk Lengkap | Deskripsi |
|---------|----------------|-----------|
| AAD | Azure Active Directory | Layanan manajemen identitas dan akses |
| ACR | Azure Container Registry | Layanan registri image container |
| AKS | Azure Kubernetes Service | Layanan Kubernetes terkelola |
| API | Application Programming Interface | Protokol untuk membangun perangkat lunak |
| ARM | Azure Resource Manager | Layanan penerapan dan pengelolaan Azure |
| CDN | Content Delivery Network | Jaringan server yang didistribusikan |
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
| SDK | Software Development Kit | Koleksi alat pengembangan |
| SLA | Service Level Agreement | Komitmen terhadap ketersediaan/kinerja layanan |
| SQL | Structured Query Language | Bahasa untuk mengelola database relasional |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protokol kriptografi |
| URI | Uniform Resource Identifier | String yang mengidentifikasi sumber daya |
| URL | Uniform Resource Locator | Jenis URI yang menentukan lokasi sumber daya |
| VM | Virtual Machine | Emulasi sistem komputer |
| VNet | Virtual Network | Jaringan pribadi di Azure |
| YAML | YAML Ain't Markup Language | Standar serialisasi data |

---

## Pemetaan Nama Layanan Azure

| Nama Umum | Nama Layanan Resmi Azure | Tipe Host azd |
|-----------|--------------------------|---------------|
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

## Istilah Konteks-Spesifik

### Istilah Pengembangan
- **Hot Reload**: Memperbarui aplikasi secara otomatis selama pengembangan tanpa restart
- **Build Pipeline**: Proses otomatis untuk membangun dan menguji kode
- **Deployment Slot**: Lingkungan staging dalam App Service
- **Environment Parity**: Menjaga kesamaan antara lingkungan pengembangan, staging, dan produksi

### Istilah Keamanan
- **Managed Identity**: Fitur Azure yang menyediakan pengelolaan kredensial otomatis
- **Key Vault**: Penyimpanan aman untuk rahasia, kunci, dan sertifikat
- **RBAC**: Kontrol akses berbasis peran untuk sumber daya Azure
- **Network Security Group**: Firewall virtual untuk mengontrol lalu lintas jaringan

### Istilah Pemantauan
- **Telemetry**: Pengumpulan otomatis pengukuran dan data
- **Application Performance Monitoring (APM)**: Pemantauan kinerja perangkat lunak
- **Log Analytics**: Layanan untuk mengumpulkan dan menganalisis data log
- **Alert Rules**: Notifikasi otomatis berdasarkan metrik atau kondisi

### Istilah Deployment
- **Blue-Green Deployment**: Strategi deployment tanpa downtime
- **Canary Deployment**: Peluncuran bertahap ke subset pengguna
- **Rolling Update**: Penggantian instance aplikasi secara berurutan
- **Rollback**: Mengembalikan ke versi aplikasi sebelumnya

---

**Tip Penggunaan**: Gunakan `Ctrl+F` untuk mencari istilah tertentu dalam glosarium ini. Istilah saling dirujuk jika relevan.

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Cheat Sheet](cheat-sheet.md)
- **Pelajaran Berikutnya**: [FAQ](faq.md)

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk memberikan hasil yang akurat, harap diingat bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.