# Glosarium - Terminologi Azure dan AZD

**Referensi untuk Semua Bab**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Pelajari Dasar**: [Bab 1: Dasar-dasar AZD](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 Istilah AI**: [Bab 2: Pengembangan AI-Pertama](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Pendahuluan

Glosarium komprehensif ini menyediakan definisi untuk istilah, konsep, dan akronim yang digunakan dalam Azure Developer CLI dan pengembangan cloud Azure. Referensi penting untuk memahami dokumentasi teknis, memecahkan masalah, dan berkomunikasi secara efektif tentang proyek azd dan layanan Azure.

## Tujuan Pembelajaran

Dengan menggunakan glosarium ini, Anda akan:
- Memahami terminologi dan konsep penting Azure Developer CLI
- Menguasai kosakata pengembangan cloud Azure dan istilah teknis
- Merujuk terminologi Infrastruktur sebagai Kode dan penerapan dengan efisien
- Memahami nama layanan Azure, akronim, dan tujuannya
- Mengakses definisi istilah pemecahan masalah dan debugging
- Mempelajari konsep arsitektur dan pengembangan Azure tingkat lanjut

## Hasil Pembelajaran

Dengan sering merujuk glosarium ini, Anda akan mampu:
- Berkomunikasi secara efektif menggunakan terminologi Azure Developer CLI yang tepat
- Memahami dokumentasi teknis dan pesan kesalahan dengan lebih jelas
- Menavigasi layanan dan konsep Azure dengan percaya diri
- Memecahkan masalah menggunakan kosakata teknis yang sesuai
- Berkontribusi dalam diskusi tim dengan bahasa teknis yang akurat
- Memperluas pengetahuan pengembangan cloud Azure secara sistematis

## A

**ARM Template**  
Template Azure Resource Manager. Format Infrastruktur sebagai Kode berbasis JSON yang digunakan untuk mendefinisikan dan menerapkan sumber daya Azure secara deklaratif.

**App Service**  
Penawaran platform sebagai layanan (PaaS) Azure untuk hosting aplikasi web, REST API, dan backend seluler tanpa mengelola infrastruktur.

**Application Insights**  
Layanan pemantauan performa aplikasi (APM) Azure yang menyediakan wawasan mendalam tentang performa, ketersediaan, dan penggunaan aplikasi.

**Azure CLI**  
Antarmuka baris perintah untuk mengelola sumber daya Azure. Melengkapi AZD tetapi memiliki login terpisah; otentikasi inti AZD menggunakan `azd auth login`.

**Azure Developer CLI (azd)**  
Alat baris perintah berorientasi pengembang yang mempercepat proses membangun dan menerapkan aplikasi ke Azure menggunakan template dan Infrastruktur sebagai Kode.

**azure.yaml**  
File konfigurasi utama untuk proyek azd yang mendefinisikan layanan, infrastruktur, dan hook penerapan.

**Azure Resource Manager (ARM)**  
Layanan penerapan dan manajemen Azure yang menyediakan lapisan manajemen untuk membuat, memperbarui, dan menghapus sumber daya.

## B

**Bicep**  
Bahasa domain spesifik (DSL) yang dikembangkan Microsoft untuk menerapkan sumber daya Azure. Menyediakan sintaks lebih sederhana daripada template ARM sementara mengompilasi ke ARM.

**Build**  
Proses mengompilasi kode sumber, menginstal dependensi, dan mempersiapkan aplikasi untuk penerapan.

**Blue-Green Deployment**  
Strategi penerapan yang menggunakan dua lingkungan produksi identik (biru dan hijau) untuk meminimalkan waktu henti dan risiko.

## C

**Container Apps**  
Layanan kontainer serverless Azure yang memungkinkan menjalankan aplikasi terkontainerisasi tanpa mengelola infrastruktur kompleks.

**CI/CD**  
Integrasi Kontinu/Penerapan Kontinu. Praktik otomatis untuk mengintegrasikan perubahan kode dan menerapkan aplikasi.

**Cosmos DB**  
Layanan basis data multi-model terdistribusi global Azure yang menyediakan SLA komprehensif untuk throughput, latensi, ketersediaan, dan konsistensi.

**Configuration**  
Pengaturan dan parameter yang mengendalikan perilaku aplikasi dan opsi penerapan.

## D

**Deployment**  
Proses memasang dan mengonfigurasi aplikasi serta dependensinya pada infrastruktur target.

**Docker**  
Platform untuk mengembangkan, mengirim, dan menjalankan aplikasi menggunakan teknologi kontainerisasi.

**Dockerfile**  
File teks yang berisi instruksi untuk membangun gambar kontainer Docker.

## E

**Environment**  
Target penerapan yang mewakili instance spesifik dari aplikasi Anda (misal: pengembangan, staging, produksi).

**Environment Variables**  
Nilai konfigurasi disimpan sebagai pasangan kunci-nilai yang dapat diakses aplikasi saat runtime.

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
Skrip atau perintah kustom yang dijalankan pada titik tertentu selama siklus hidup penerapan (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Jenis layanan Azure tempat aplikasi akan diterapkan (misal: appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktik mendefinisikan dan mengelola infrastruktur melalui kode daripada proses manual.

**Init**  
Proses menginisialisasi proyek azd baru, biasanya dari sebuah template.

## J

**JSON**  
JavaScript Object Notation. Format pertukaran data yang umum digunakan untuk file konfigurasi dan respons API.

**JWT**  
JSON Web Token. Standar untuk mengirimkan informasi antara pihak secara aman sebagai objek JSON.

## K

**Key Vault**  
Layanan Azure untuk menyimpan dan mengelola rahasia, kunci, dan sertifikat secara aman.

**Kusto Query Language (KQL)**  
Bahasa kueri yang digunakan untuk menganalisis data di Azure Monitor, Application Insights, dan layanan Azure lainnya.

## L

**Load Balancer**  
Layanan yang mendistribusikan trafik jaringan masuk ke beberapa server atau instance.

**Log Analytics**  
Layanan Azure untuk mengumpulkan, menganalisis, dan menindaklanjuti data telemetri dari lingkungan cloud dan on-premises.

## M

**Managed Identity**  
Fitur Azure yang menyediakan identitas yang dikelola secara otomatis untuk layanan Azure agar dapat mengautentikasi ke layanan Azure lainnya.

**Microservices**  
Pendekatan arsitektur di mana aplikasi dibangun sebagai kumpulan layanan kecil dan mandiri.

**Monitor**  
Solusi pemantauan terpadu Azure yang menyediakan observabilitas penuh tumpukan lintas aplikasi dan infrastruktur.

## N

**Node.js**  
Runtime JavaScript yang dibangun di atas mesin V8 Chrome untuk membangun aplikasi sisi server.

**npm**  
Pengelola paket untuk Node.js yang mengatur dependensi dan paket.

## O

**Output**  
Nilai yang dikembalikan dari penerapan infrastruktur yang dapat digunakan oleh aplikasi atau sumber daya lain.

## P

**Package**  
Proses mempersiapkan kode aplikasi dan dependensi untuk penerapan.

**Parameters**  
Nilai input yang diserahkan ke template infrastruktur untuk menyesuaikan penerapan.

**PostgreSQL**  
Sistem basis data relasional open-source yang didukung sebagai layanan terkelola di Azure.

**Provisioning**  
Proses membuat dan mengonfigurasi sumber daya Azure yang didefinisikan dalam template infrastruktur.

## Q

**Quota**  
Batas jumlah sumber daya yang dapat dibuat dalam langganan atau wilayah Azure.

## R

**Resource Group**  
Wadah logis untuk sumber daya Azure yang berbagi siklus hidup, izin, dan kebijakan yang sama.

**Resource Token**  
String unik yang dihasilkan oleh azd untuk memastikan nama sumber daya unik di seluruh penerapan.

**REST API**  
Gaya arsitektur untuk merancang aplikasi jaringan menggunakan metode HTTP.

**Rollback**  
Proses mengembalikan ke versi aplikasi atau konfigurasi infrastruktur sebelumnya.

## S

**Service**  
Komponen aplikasi Anda yang didefinisikan dalam azure.yaml (misal: frontend web, backend API, basis data).

**SKU**  
Stock Keeping Unit. Mewakili berbagai tingkat layanan atau performa untuk sumber daya Azure.

**SQL Database**  
Layanan basis data relasional terkelola Azure berdasarkan Microsoft SQL Server.

**Static Web Apps**  
Layanan Azure untuk membangun dan menerapkan aplikasi web full-stack dari repositori kode sumber.

**Storage Account**  
Layanan Azure yang menyediakan penyimpanan cloud untuk objek data termasuk blob, file, antrian, dan tabel.

**Subscription**  
Kontainer akun Azure yang menyimpan grup sumber daya dan sumber daya, dengan manajemen penagihan dan akses terkait.

## T

**Template**  
Struktur proyek pra-bangun yang berisi kode aplikasi, definisi infrastruktur, dan konfigurasi untuk skenario umum.

**Terraform**  
Alat Infrastruktur sebagai Kode sumber terbuka yang mendukung beberapa penyedia cloud termasuk Azure.

**Traffic Manager**  
Penyeimbang beban trafik berbasis DNS Azure untuk mendistribusikan trafik di berbagai wilayah Azure global.

## U

**URI**  
Uniform Resource Identifier. String yang mengidentifikasi sumber daya tertentu.

**URL**  
Uniform Resource Locator. Jenis URI yang menunjukkan lokasi sumber daya dan cara mengambilnya.

## V

**Virtual Network (VNet)**  
Blok bangunan fundamental untuk jaringan pribadi di Azure, menyediakan isolasi dan segmentasi.

**VS Code**  
Visual Studio Code. Editor kode populer dengan integrasi Azure dan azd yang sangat baik.

## W

**Webhook**  
Callback HTTP yang dipicu oleh peristiwa tertentu, biasanya digunakan dalam pipeline CI/CD.

**What-if**  
Fitur Azure yang menunjukkan perubahan apa yang akan dilakukan oleh sebuah penerapan tanpa benar-benar menjalankannya.

## Y

**YAML**  
YAML Ain't Markup Language. Standar serialisasi data yang dapat dibaca manusia yang digunakan untuk file konfigurasi seperti azure.yaml.

## Z

**Zone**  
Lokasi terpisah secara fisik dalam satu wilayah Azure yang menyediakan redundansi dan ketersediaan tinggi.

---

## Akronim Umum

| Akronim | Bentuk Penuh | Deskripsi |
|---------|-----------|-------------|
| AAD | Azure Active Directory (sekarang Microsoft Entra ID) | Layanan manajemen identitas dan akses |
| ACR | Azure Container Registry | Layanan registri gambar kontainer |
| AKS | Azure Kubernetes Service | Layanan Kubernetes terkelola |
| API | Application Programming Interface | Set protokol untuk membangun perangkat lunak |
| ARM | Azure Resource Manager | Layanan penerapan dan manajemen Azure |
| CDN | Content Delivery Network | Jaringan server terdistribusi |
| CI/CD | Continuous Integration/Continuous Deployment | Praktik pengembangan otomatis |
| CLI | Command Line Interface | Antarmuka pengguna berbasis teks |
| DNS | Domain Name System | Sistem untuk menerjemahkan nama domain ke alamat IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versi aman dari HTTP |
| IaC | Infrastructure as Code | Mengelola infrastruktur melalui kode |
| JSON | JavaScript Object Notation | Format pertukaran data |
| JWT | JSON Web Token | Format token untuk transmisi informasi aman |
| KQL | Kusto Query Language | Bahasa kueri untuk layanan data Azure |
| RBAC | Role-Based Access Control | Metode kontrol akses berdasarkan peran pengguna |
| REST | Representational State Transfer | Gaya arsitektur untuk layanan web |
| SDK | Software Development Kit | Kumpulan alat pengembangan |
| SLA | Service Level Agreement | Komitmen ketersediaan/performa layanan |
| SQL | Structured Query Language | Bahasa untuk mengelola basis data relasional |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protokol kriptografi |
| URI | Uniform Resource Identifier | String yang mengidentifikasi sumber daya |
| URL | Uniform Resource Locator | Jenis URI yang menentukan lokasi sumber daya |
| VM | Virtual Machine | Emulasi sistem komputer |
| VNet | Virtual Network | Jaringan privat di Azure |
| YAML | YAML Ain't Markup Language | Standar serialisasi data |

---

## Pemetaan Nama Layanan Azure

| Nama Umum | Nama Resmi Layanan Azure | Jenis Host azd |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | Sumber daya infrastruktur, bukan aplikasi `host` |
| NoSQL DB | Azure Cosmos DB | Sumber daya infrastruktur, bukan aplikasi `host` |
| Storage | Azure Storage Account | Sumber daya infrastruktur, bukan aplikasi bawaan `host` |
| Cache | Azure Managed Redis | Sumber daya infrastruktur, bukan aplikasi `host` |
| Search | Azure AI Search | Sumber daya infrastruktur, bukan aplikasi `host` |
| Messaging | Azure Service Bus | Sumber daya infrastruktur, bukan aplikasi `host` |

`services.<name>.host` memilih target penerapan aplikasi; ini bukan singkatan dari tipe sumber daya Azure manapun. Basis data, cache, layanan pencarian, dan antrian biasanya disediakan melalui penyedia infrastruktur dan dihubungkan ke aplikasi melalui output/konfigurasi.

---

## Istilah Spesifik Konteks

### Istilah Pengembangan
- **Hot Reload**: Memperbarui aplikasi secara otomatis selama pengembangan tanpa restart
- **Build Pipeline**: Proses otomatisasi untuk membangun dan menguji kode
- **Deployment Slot**: Lingkungan staging dalam App Service
- **Environment Parity**: Menjaga kesamaan lingkungan pengembangan, staging, dan produksi

### Istilah Keamanan
- **Managed Identity**: Fitur Azure yang menyediakan manajemen kredensial otomatis
- **Key Vault**: Penyimpanan aman untuk rahasia, kunci, dan sertifikat
- **RBAC**: Kontrol akses berbasis peran untuk sumber daya Azure
- **Network Security Group**: Firewall virtual untuk mengontrol trafik jaringan

### Istilah Pemantauan
- **Telemetry**: Pengumpulan otomatis pengukuran dan data
- **Application Performance Monitoring (APM)**: Pemantauan performa perangkat lunak
- **Log Analytics**: Layanan untuk mengumpulkan dan menganalisis data log
- **Alert Rules**: Notifikasi otomatis berdasarkan metrik atau kondisi

### Istilah Penerapan
- **Blue-Green Deployment**: Strategi penerapan tanpa downtime
- **Canary Deployment**: Peluncuran bertahap ke subset pengguna
- **Rolling Update**: Penggantian bertahap instance aplikasi
- **Rollback**: Mengembalikan ke versi aplikasi sebelumnya

---

**Tip Penggunaan**: Gunakan `Ctrl+F` untuk mencari istilah tertentu dengan cepat dalam glosarium ini. Istilah saling dirujuk bila berlaku.

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Cheat Sheet](cheat-sheet.md)
- **Pelajaran Selanjutnya**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->