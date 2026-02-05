# Glosarium - Istilah Azure dan AZD

**Referensi untuk Semua Bab**  
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../README.md)  
- **📖 Pelajari Dasar-dasar**: [Bab 1: Dasar-dasar AZD](../docs/getting-started/azd-basics.md)  
- **🤖 Istilah AI**: [Bab 2: Pengembangan Berbasis AI](../docs/ai-foundry/azure-ai-foundry-integration.md)  

## Pendahuluan

Glosarium ini menyediakan definisi untuk istilah, konsep, dan akronim yang digunakan dalam Azure Developer CLI dan pengembangan cloud Azure. Referensi penting untuk memahami dokumentasi teknis, memecahkan masalah, dan berkomunikasi secara efektif tentang proyek azd dan layanan Azure.

## Tujuan Pembelajaran

Dengan menggunakan glosarium ini, Anda akan:  
- Memahami istilah dan konsep penting dalam Azure Developer CLI  
- Menguasai kosakata dan istilah teknis pengembangan cloud Azure  
- Merujuk istilah Infrastruktur sebagai Kode dan terminologi penerapan dengan efisien  
- Memahami nama layanan Azure, akronim, dan tujuannya  
- Mengakses definisi untuk istilah pemecahan masalah dan debugging  
- Mempelajari konsep arsitektur dan pengembangan Azure tingkat lanjut  

## Hasil Pembelajaran

Dengan merujuk secara rutin ke glosarium ini, Anda akan dapat:  
- Berkomunikasi secara efektif menggunakan istilah Azure Developer CLI yang tepat  
- Memahami dokumentasi teknis dan pesan kesalahan dengan lebih jelas  
- Menavigasi layanan dan konsep Azure dengan percaya diri  
- Memecahkan masalah menggunakan kosakata teknis yang sesuai  
- Berkontribusi dalam diskusi tim dengan bahasa teknis yang akurat  
- Mengembangkan pengetahuan pengembangan cloud Azure secara sistematis  

## A

**ARM Template**  
Template Azure Resource Manager. Format Infrastruktur sebagai Kode berbasis JSON yang digunakan untuk mendefinisikan dan menerapkan sumber daya Azure secara deklaratif.

**App Service**  
Layanan platform-as-a-service (PaaS) Azure untuk hosting aplikasi web, REST API, dan backend mobile tanpa perlu mengelola infrastruktur.

**Application Insights**  
Layanan pemantauan kinerja aplikasi (APM) Azure yang memberikan wawasan mendalam tentang kinerja, ketersediaan, dan penggunaan aplikasi.

**Azure CLI**  
Antarmuka baris perintah untuk mengelola sumber daya Azure. Digunakan oleh azd untuk autentikasi dan beberapa operasi.

**Azure Developer CLI (azd)**  
Alat baris perintah yang berfokus pada pengembang yang mempercepat proses membangun dan menerapkan aplikasi ke Azure menggunakan template dan Infrastruktur sebagai Kode.

**azure.yaml**  
File konfigurasi utama untuk proyek azd yang mendefinisikan layanan, infrastruktur, dan hook penerapan.

**Azure Resource Manager (ARM)**  
Layanan penerapan dan pengelolaan Azure yang menyediakan lapisan manajemen untuk membuat, memperbarui, dan menghapus sumber daya.

## B

**Bicep**  
Bahasa domain-spesifik (DSL) yang dikembangkan oleh Microsoft untuk menerapkan sumber daya Azure. Menyediakan sintaks yang lebih sederhana dibandingkan template ARM sambil tetap dikompilasi ke ARM.

**Build**  
Proses mengompilasi kode sumber, menginstal dependensi, dan menyiapkan aplikasi untuk penerapan.

**Blue-Green Deployment**  
Strategi penerapan yang menggunakan dua lingkungan produksi identik (biru dan hijau) untuk meminimalkan downtime dan risiko.

## C

**Container Apps**  
Layanan kontainer tanpa server Azure yang memungkinkan menjalankan aplikasi yang dikontainerisasi tanpa mengelola infrastruktur yang kompleks.

**CI/CD**  
Integrasi Berkelanjutan/Penerapan Berkelanjutan. Praktik otomatisasi untuk mengintegrasikan perubahan kode dan menerapkan aplikasi.

**Cosmos DB**  
Layanan database multi-model yang didistribusikan secara global dari Azure yang menyediakan SLA komprehensif untuk throughput, latensi, ketersediaan, dan konsistensi.

**Configuration**  
Pengaturan dan parameter yang mengontrol perilaku aplikasi dan opsi penerapan.

## D

**Deployment**  
Proses menginstal dan mengonfigurasi aplikasi serta dependensinya pada infrastruktur target.

**Docker**  
Platform untuk mengembangkan, mengirimkan, dan menjalankan aplikasi menggunakan teknologi kontainerisasi.

**Dockerfile**  
File teks yang berisi instruksi untuk membangun gambar kontainer Docker.

## E

**Environment**  
Target penerapan yang mewakili instance spesifik dari aplikasi Anda (misalnya, pengembangan, staging, produksi).

**Environment Variables**  
Nilai konfigurasi yang disimpan sebagai pasangan kunci-nilai yang dapat diakses aplikasi saat runtime.

**Endpoint**  
URL atau alamat jaringan tempat aplikasi atau layanan dapat diakses.

## F

**Function App**  
Layanan komputasi tanpa server Azure yang memungkinkan menjalankan kode berbasis peristiwa tanpa mengelola infrastruktur.

## G

**GitHub Actions**  
Platform CI/CD yang terintegrasi dengan repositori GitHub untuk mengotomatisasi alur kerja.

**Git**  
Sistem kontrol versi terdistribusi yang digunakan untuk melacak perubahan dalam kode sumber.

## H

**Hooks**  
Skrip atau perintah khusus yang dijalankan pada titik tertentu selama siklus hidup penerapan (preprovision, postprovision, predeploy, postdeploy).

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
Fitur Azure yang menyediakan identitas yang dikelola secara otomatis untuk layanan Azure untuk mengautentikasi ke layanan Azure lainnya.

**Microservices**  
Pendekatan arsitektur di mana aplikasi dibangun sebagai kumpulan layanan kecil yang independen.

**Monitor**  
Solusi pemantauan terpadu Azure yang menyediakan observabilitas penuh untuk aplikasi dan infrastruktur.

## N

**Node.js**  
Runtime JavaScript yang dibangun di atas mesin JavaScript V8 Chrome untuk membangun aplikasi sisi server.

**npm**  
Manajer paket untuk Node.js yang mengelola dependensi dan paket.

## O

**Output**  
Nilai yang dikembalikan dari penerapan infrastruktur yang dapat digunakan oleh aplikasi atau sumber daya lainnya.

## P

**Package**  
Proses menyiapkan kode aplikasi dan dependensi untuk penerapan.

**Parameters**  
Nilai input yang diteruskan ke template infrastruktur untuk menyesuaikan penerapan.

**PostgreSQL**  
Sistem database relasional sumber terbuka yang didukung sebagai layanan terkelola di Azure.

**Provisioning**  
Proses membuat dan mengonfigurasi sumber daya Azure yang didefinisikan dalam template infrastruktur.

## Q

**Quota**  
Batas pada jumlah sumber daya yang dapat dibuat dalam langganan atau wilayah Azure.

## R

**Resource Group**  
Kontainer logis untuk sumber daya Azure yang berbagi siklus hidup, izin, dan kebijakan yang sama.

**Resource Token**  
String unik yang dihasilkan oleh azd untuk memastikan nama sumber daya unik di seluruh penerapan.

**REST API**  
Gaya arsitektur untuk merancang aplikasi jaringan menggunakan metode HTTP.

**Rollback**  
Proses mengembalikan ke versi sebelumnya dari aplikasi atau konfigurasi infrastruktur.

## S

**Service**  
Komponen aplikasi Anda yang didefinisikan dalam azure.yaml (misalnya, frontend web, backend API, database).

**SKU**  
Stock Keeping Unit. Mewakili tingkatan layanan atau tingkat kinerja yang berbeda untuk sumber daya Azure.

**SQL Database**  
Layanan database relasional terkelola Azure yang berbasis pada Microsoft SQL Server.

**Static Web Apps**  
Layanan Azure untuk membangun dan menerapkan aplikasi web full-stack dari repositori kode sumber.

**Storage Account**  
Layanan Azure yang menyediakan penyimpanan cloud untuk objek data termasuk blob, file, antrean, dan tabel.

**Subscription**  
Kontainer akun Azure yang menampung grup sumber daya dan sumber daya, dengan manajemen penagihan dan akses terkait.

## T

**Template**  
Struktur proyek yang telah dibuat sebelumnya yang berisi kode aplikasi, definisi infrastruktur, dan konfigurasi untuk skenario umum.

**Terraform**  
Alat Infrastruktur sebagai Kode sumber terbuka yang mendukung banyak penyedia cloud termasuk Azure.

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
Fitur Azure yang menunjukkan perubahan apa yang akan dilakukan oleh penerapan tanpa benar-benar mengeksekusinya.

## Y

**YAML**  
YAML Ain't Markup Language. Standar serialisasi data yang mudah dibaca manusia yang digunakan untuk file konfigurasi seperti azure.yaml.

## Z

**Zone**  
Lokasi fisik yang terpisah dalam suatu wilayah Azure yang menyediakan redundansi dan ketersediaan tinggi.

---

## Akronim Umum

| Akronim | Bentuk Lengkap | Deskripsi |
|---------|----------------|-----------|
| AAD | Azure Active Directory | Layanan manajemen identitas dan akses |
| ACR | Azure Container Registry | Layanan registri gambar kontainer |
| AKS | Azure Kubernetes Service | Layanan Kubernetes terkelola |
| API | Application Programming Interface | Kumpulan protokol untuk membangun perangkat lunak |
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
| SDK | Software Development Kit | Kumpulan alat pengembangan |
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

| Nama Umum | Nama Layanan Resmi Azure | Jenis Host azd |
|-----------|--------------------------|----------------|
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
- **Hot Reload**: Memperbarui aplikasi secara otomatis selama pengembangan tanpa memulai ulang  
- **Build Pipeline**: Proses otomatis untuk membangun dan menguji kode  
- **Deployment Slot**: Lingkungan staging dalam App Service  
- **Environment Parity**: Menjaga kesamaan antara lingkungan pengembangan, staging, dan produksi  

### Istilah Keamanan
- **Managed Identity**: Fitur Azure yang menyediakan pengelolaan kredensial otomatis  
- **Key Vault**: Penyimpanan aman untuk rahasia, kunci, dan sertifikat  
- **RBAC**: Kontrol akses berbasis peran untuk sumber daya Azure  
- **Network Security Group**: Firewall virtual untuk mengontrol lalu lintas jaringan  

### Istilah Pemantauan
- **Telemetry**: Pengumpulan data dan pengukuran secara otomatis  
- **Application Performance Monitoring (APM)**: Pemantauan kinerja perangkat lunak  
- **Log Analytics**: Layanan untuk mengumpulkan dan menganalisis data log  
- **Alert Rules**: Notifikasi otomatis berdasarkan metrik atau kondisi  

### Istilah Penerapan
- **Blue-Green Deployment**: Strategi penerapan tanpa downtime  
- **Canary Deployment**: Peluncuran bertahap ke subset pengguna  
- **Rolling Update**: Penggantian bertahap instance aplikasi  
- **Rollback**: Mengembalikan ke versi aplikasi sebelumnya  

---

**Tips Penggunaan**: Gunakan `Ctrl+F` untuk mencari istilah tertentu dalam glosarium ini. Istilah saling dirujuk jika memungkinkan.

---

**Navigasi**  
- **Pelajaran Sebelumnya**: [Cheat Sheet](cheat-sheet.md)  
- **Pelajaran Berikutnya**: [FAQ](faq.md)  

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk memberikan hasil yang akurat, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.