# Glosari - Terminologi Azure dan AZD

**Rujukan untuk Semua Bab**  
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../README.md)  
- **📖 Pelajari Asas**: [Bab 1: Asas AZD](../docs/getting-started/azd-basics.md)  
- **🤖 Istilah AI**: [Bab 2: Pembangunan AI-Pertama](../docs/microsoft-foundry/microsoft-foundry-integration.md)  

## Pengenalan

Glosari menyeluruh ini menyediakan definisi untuk istilah, konsep, dan akronim yang digunakan dalam Azure Developer CLI dan pembangunan awan Azure. Rujukan penting untuk memahami dokumentasi teknikal, menyelesaikan isu, dan berkomunikasi dengan berkesan mengenai projek azd dan perkhidmatan Azure.

## Matlamat Pembelajaran

Dengan menggunakan glosari ini, anda akan:  
- Memahami istilah dan konsep penting Azure Developer CLI  
- Menguasai kosa kata pembangunan awan Azure dan istilah teknikal  
- Merujuk istilah Infrastruktur sebagai Kod dan penyebaran dengan cekap  
- Memahami nama perkhidmatan Azure, akronim, dan tujuan mereka  
- Mengakses definisi untuk istilah penyelesaian masalah dan pengesan bug  
- Mempelajari konsep seni bina dan pembangunan Azure yang maju  

## Hasil Pembelajaran

Dengan merujuk glosari ini secara berkala, anda akan dapat:  
- Berkomunikasi dengan berkesan menggunakan istilah Azure Developer CLI yang betul  
- Memahami dokumentasi teknikal dan mesej ralat dengan lebih jelas  
- Menavigasi perkhidmatan dan konsep Azure dengan keyakinan  
- Menyelesaikan isu menggunakan kosa kata teknikal yang sesuai  
- Menyumbang kepada perbincangan pasukan dengan bahasa teknikal yang tepat  
- Mengembangkan pengetahuan pembangunan awan Azure secara sistematik  

## A

**Templat ARM**  
Templat Azure Resource Manager. Format Infrastruktur sebagai Kod berasaskan JSON yang digunakan untuk mentakrif dan menyebarkan sumber Azure secara deklaratif.

**App Service**  
Tawaran platform sebagai perkhidmatan (PaaS) Azure untuk menempatkan aplikasi web, REST API, dan backend mudah alih tanpa mengurus infrastruktur.

**Application Insights**  
Perkhidmatan pemantauan prestasi aplikasi (APM) Azure yang menyediakan pandangan mendalam tentang prestasi, ketersediaan, dan penggunaan aplikasi.

**Azure CLI**  
Antara muka baris perintah untuk mengurus sumber Azure. Digunakan oleh azd untuk pengesahan dan beberapa operasi.

**Azure Developer CLI (azd)**  
Alat baris perintah berorientasikan pembangun yang mempercepatkan proses membina dan menyebarkan aplikasi ke Azure menggunakan templat dan Infrastruktur sebagai Kod.

**azure.yaml**  
Fail konfigurasi utama untuk projek azd yang mentakrifkan perkhidmatan, infrastruktur, dan cangkuk penyebaran.

**Azure Resource Manager (ARM)**  
Perkhidmatan penyebaran dan pengurusan Azure yang menyediakan lapisan pengurusan untuk membuat, mengemas kini, dan memadam sumber.

## B

**Bicep**  
Bahasa khusus domain (DSL) yang dibangunkan oleh Microsoft untuk menyebarkan sumber Azure. Menyediakan sintaks yang lebih mudah daripada templat ARM sambil dikompilasi kepada ARM.

**Build**  
Proses menyusun kod sumber, memasang kebergantungan, dan menyediakan aplikasi untuk penyebaran.

**Blue-Green Deployment**  
Strategi penyebaran yang menggunakan dua persekitaran pengeluaran yang sama (biru dan hijau) untuk mengurangkan masa henti dan risiko.

## C

**Container Apps**  
Perkhidmatan kontena tanpa pelayan Azure yang membolehkan menjalankan aplikasi berkontena tanpa mengurus infrastruktur yang kompleks.

**CI/CD**  
Integrasi Berterusan/Penyebaran Berterusan. Amalan automatik untuk menggabungkan perubahan kod dan menyebarkan aplikasi.

**Cosmos DB**  
Perkhidmatan pangkalan data pelbagai model teragih secara global Azure yang menyediakan SLA komprehensif untuk throughput, latensi, ketersediaan, dan konsistensi.

**Konfigurasi**  
Tetapan dan parameter yang mengawal tingkah laku aplikasi dan pilihan penyebaran.

## D

**Deployment**  
Proses memasang dan mengkonfigurasikan aplikasi serta kebergantungan mereka pada infrastruktur sasaran.

**Docker**  
Platform untuk membangunkan, mengedarkan, dan menjalankan aplikasi menggunakan teknologi kontena.

**Dockerfile**  
Fail teks yang mengandungi arahan untuk membina imej kontena Docker.

## E

**Persekitaran**  
Sasaran penyebaran yang mewakili contoh khusus aplikasi anda (contoh, pembangunan, staging, pengeluaran).

**Pembolehubah Persekitaran**  
Nilai konfigurasi yang disimpan sebagai pasangan kunci-nilai yang boleh diakses oleh aplikasi pada masa jalan.

**Titik Akhir**  
URL atau alamat rangkaian di mana aplikasi atau perkhidmatan boleh diakses.

## F

**Function App**  
Perkhidmatan pengiraan tanpa pelayan Azure yang membolehkan menjalankan kod yang dipacu acara tanpa mengurus infrastruktur.

## G

**GitHub Actions**  
Platform CI/CD yang diintegrasikan dengan repositori GitHub untuk mengautomasi aliran kerja.

**Git**  
Sistem kawalan versi teragih yang digunakan untuk menjejak perubahan dalam kod sumber.

## H

**Hooks**  
Skrip atau arahan khusus yang dijalankan pada titik tertentu sepanjang kitaran hidup penyebaran (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Jenis perkhidmatan Azure di mana aplikasi akan disebarkan (contoh, appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Amalan mentakrif dan mengurus infrastruktur melalui kod daripada proses manual.

**Init**  
Proses menginisialisasi projek azd baru, biasanya dari templat.

## J

**JSON**  
JavaScript Object Notation. Format pertukaran data yang biasa digunakan untuk fail konfigurasi dan respons API.

**JWT**  
JSON Web Token. Standard untuk menghantar maklumat dengan selamat antara pihak sebagai objek JSON.

## K

**Key Vault**  
Perkhidmatan Azure untuk menyimpan dan mengurus rahsia, kunci, dan sijil dengan selamat.

**Kusto Query Language (KQL)**  
Bahasa pertanyaan yang digunakan untuk menganalisis data dalam Azure Monitor, Application Insights, dan perkhidmatan Azure lain.

## L

**Load Balancer**  
Perkhidmatan yang mengagihkan trafik rangkaian masuk ke pelbagai pelayan atau instans.

**Log Analytics**  
Perkhidmatan Azure untuk mengumpul, menganalisis, dan bertindak berdasarkan data telemetri dari persekitaran awan dan on-premises.

## M

**Managed Identity**  
Ciri Azure yang menyediakan identiti yang diurus secara automatik kepada perkhidmatan Azure untuk pengesahan ke perkhidmatan Azure lain.

**Microservices**  
Pendekatan seni bina di mana aplikasi dibina sebagai koleksi perkhidmatan kecil dan berdikari.

**Monitor**  
Penyelesaian pemantauan sehenti Azure yang menyediakan pemerhatian penuh meliputi aplikasi dan infrastruktur.

## N

**Node.js**  
Runtime JavaScript berasaskan enjin JavaScript V8 Chrome untuk membina aplikasi sisi pelayan.

**npm**  
Pengurus pakej untuk Node.js yang mengurus kebergantungan dan pakej.

## O

**Output**  
Nilai yang dikembalikan daripada penyebaran infrastruktur yang boleh digunakan oleh aplikasi atau sumber lain.

## P

**Package**  
Proses menyediakan kod aplikasi dan kebergantungan untuk penyebaran.

**Parameter**  
Nilai input yang dihantar ke templat infrastruktur untuk menyesuaikan penyebaran.

**PostgreSQL**  
Sistem pangkalan data hubungan sumber terbuka yang disokong sebagai perkhidmatan terurus di Azure.

**Provisioning**  
Proses membuat dan mengkonfigurasikan sumber Azure yang ditakrifkan dalam templat infrastruktur.

## Q

**Quota**  
Had ke atas jumlah sumber yang boleh dibuat dalam langganan atau rantau Azure.

## R

**Resource Group**  
Bekas logik untuk sumber Azure yang berkongsi kitaran hidup, kebenaran, dan polisi yang sama.

**Resource Token**  
Rantaian unik yang dijana oleh azd untuk memastikan nama sumber adalah unik merentasi penyebaran.

**REST API**  
Gaya seni bina untuk mereka bentuk aplikasi rangkaian menggunakan kaedah HTTP.

**Rollback**  
Proses mengembalikan kepada versi sebelumnya aplikasi atau konfigurasi infrastruktur.

## S

**Service**  
Komponen aplikasi anda yang ditakrifkan dalam azure.yaml (contoh, front-end web, back-end API, pangkalan data).

**SKU**  
Stock Keeping Unit. Mewakili tahap perkhidmatan atau tahap prestasi berbeza untuk sumber Azure.

**SQL Database**  
Perkhidmatan pangkalan data hubungan terurus Azure berasaskan Microsoft SQL Server.

**Static Web Apps**  
Perkhidmatan Azure untuk membina dan menyebarkan aplikasi web penuh dari repositori kod sumber.

**Storage Account**  
Perkhidmatan Azure yang menyediakan storan awan untuk objek data termasuk blob, fail, barisan, dan jadual.

**Subscription**  
Bekas akaun Azure yang memegang kumpulan sumber dan sumber, dengan pengurusan bil dan akses berkaitan.

## T

**Template**  
Struktur projek pra-bina yang mengandungi kod aplikasi, definisi infrastruktur, dan konfigurasi untuk senario biasa.

**Terraform**  
Alat Infrastruktur sebagai Kod sumber terbuka yang menyokong pelbagai pembekal awan termasuk Azure.

**Traffic Manager**  
Penyeimbang beban trafik berasaskan DNS Azure untuk mengagihkan trafik merentas rantau Azure global.

## U

**URI**  
Penentu Sumber Seragam. Rantaian yang mengenal pasti sumber tertentu.

**URL**  
Penentu Lokasi Seragam. Jenis URI yang menentukan lokasi sumber dan cara mengambilnya.

## V

**Virtual Network (VNet)**  
Blok binaan asas untuk rangkaian peribadi dalam Azure, menyediakan pengasingan dan segmentasi.

**VS Code**  
Visual Studio Code. Penyunting kod popular dengan integrasi Azure dan azd yang cemerlang.

## W

**Webhook**  
Panggilan balik HTTP yang dicetuskan oleh acara tertentu, biasa digunakan dalam pipeline CI/CD.

**What-if**  
Ciri Azure yang menunjukkan perubahan apa yang akan dibuat oleh penyebaran tanpa melaksanakannya.

## Y

**YAML**  
YAML Bukan Bahasa Penanda. Standard serialisasi data yang boleh dibaca manusia digunakan untuk fail konfigurasi seperti azure.yaml.

## Z

**Zone**  
Lokasi fizikal berasingan dalam rantau Azure yang menyediakan redundansi dan ketersediaan tinggi.

---

## Akronim Biasa

| Akronim | Bentuk Penuh | Keterangan |
|---------|--------------|------------|
| AAD | Azure Active Directory (sekarang Microsoft Entra ID) | Perkhidmatan pengurusan identiti dan akses |
| ACR | Azure Container Registry | Perkhidmatan pendaftaran imej kontena |
| AKS | Azure Kubernetes Service | Perkhidmatan Kubernetes terurus |
| API | Application Programming Interface | Set protokol untuk membina perisian |
| ARM | Azure Resource Manager | Perkhidmatan penyebaran dan pengurusan Azure |
| CDN | Content Delivery Network | Rangkaian pelayan diedar |
| CI/CD | Continuous Integration/Continuous Deployment | Amalan pembangunan automatik |
| CLI | Command Line Interface | Antara muka pengguna berasaskan teks |
| DNS | Domain Name System | Sistem untuk menterjemah nama domain kepada alamat IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versi HTTP yang selamat |
| IaC | Infrastructure as Code | Mengurus infrastruktur melalui kod |
| JSON | JavaScript Object Notation | Format pertukaran data |
| JWT | JSON Web Token | Format token untuk penghantaran maklumat selamat |
| KQL | Kusto Query Language | Bahasa pertanyaan untuk perkhidmatan data Azure |
| RBAC | Role-Based Access Control | Kaedah kawalan akses berdasarkan peranan pengguna |
| REST | Representational State Transfer | Gaya seni bina untuk perkhidmatan web |
| SDK | Software Development Kit | Koleksi alat pembangunan |
| SLA | Service Level Agreement | Komitmen terhadap ketersediaan/prestasi perkhidmatan |
| SQL | Structured Query Language | Bahasa untuk mengurus pangkalan data hubungan |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protokol kriptografi |
| URI | Uniform Resource Identifier | Rantaian yang mengenal pasti sumber |
| URL | Uniform Resource Locator | Jenis URI yang menentukan lokasi sumber |
| VM | Virtual Machine | Emulasi sistem komputer |
| VNet | Virtual Network | Rangkaian peribadi dalam Azure |
| YAML | YAML Bukan Bahasa Penanda | Standard serialisasi data |

---

## Pemetaan Nama Perkhidmatan Azure

| Nama Biasa | Nama Rasmi Perkhidmatan Azure | Jenis Host azd |
|------------|-------------------------------|----------------|
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

### Istilah Pembangunan  
- **Hot Reload**: Mengemas kini aplikasi secara automatik semasa pembangunan tanpa perlu mulakan semula  
- **Build Pipeline**: Proses automatik untuk membina dan menguji kod  
- **Deployment Slot**: Persekitaran staging dalam App Service  
- **Environment Parity**: Mengekalkan persekitaran pembangunan, staging, dan pengeluaran yang serupa  

### Istilah Keselamatan  
- **Managed Identity**: Ciri Azure yang menyediakan pengurusan kelayakan automatik  
- **Key Vault**: Storan selamat untuk rahsia, kunci, dan sijil  
- **RBAC**: Kawalan akses berasaskan peranan untuk sumber Azure  
- **Network Security Group**: Firewall maya untuk mengawal trafik rangkaian  

### Istilah Pemantauan  
- **Telemetry**: Pengumpulan automatik ukuran dan data  
- **Application Performance Monitoring (APM)**: Memantau prestasi perisian  
- **Log Analytics**: Perkhidmatan untuk mengumpul dan menganalisis data log  
- **Alert Rules**: Notifikasi automatik berdasarkan metrik atau keadaan  

### Istilah Penyebaran  
- **Blue-Green Deployment**: Strategi penyebaran tanpa masa henti  
- **Canary Deployment**: Pelaksanaan berperingkat kepada subset pengguna  
- **Rolling Update**: Penggantian aplikasi secara berurutan  
- **Rollback**: Mengembalikan kepada versi aplikasi sebelumnya  

---

**Petua Penggunaan**: Gunakan `Ctrl+F` untuk mencari dengan pantas istilah tertentu dalam glosari ini. Istilah disilang rujukan di mana sesuai.

---

**Navigasi**  
- **Pelajaran Sebelumnya**: [Cheat Sheet](cheat-sheet.md)  
- **Pelajaran Seterusnya**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->