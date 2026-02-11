# Glossary - Terminologi Azure dan AZD

**Rujukan untuk Semua Bab**
- **📚 Laman Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Pelajari Asas**: [Bab 1: Asas AZD](../docs/getting-started/azd-basics.md)
- **🤖 Istilah AI**: [Bab 2: Pembangunan AI-Pertama](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Pengenalan

Glosari komprehensif ini menyediakan definisi untuk istilah, konsep, dan akronim yang digunakan dalam Azure Developer CLI dan pembangunan awan Azure. Rujukan penting untuk memahami dokumentasi teknikal, menyelesaikan masalah, dan berkomunikasi dengan berkesan tentang projek azd dan perkhidmatan Azure.

## Matlamat Pembelajaran

Dengan menggunakan glosari ini, anda akan:
- Memahami istilah dan konsep penting Azure Developer CLI
- Menguasai kosa kata pembangunan awan Azure dan istilah teknikal
- Merujuk terminologi Infrastruktur sebagai Kod dan penyebaran dengan cekap
- Memahami nama-nama perkhidmatan Azure, akronim, dan tujuannya
- Mendapatkan definisi untuk istilah penyelesaian masalah dan pengesanan ralat
- Mempelajari konsep seni bina dan pembangunan Azure yang lebih maju

## Hasil Pembelajaran

Dengan kerap merujuk glosari ini, anda akan dapat:
- Berkomunikasi dengan berkesan menggunakan istilah Azure Developer CLI yang betul
- Memahami dokumentasi teknikal dan mesej ralat dengan lebih jelas
- Menavigasi perkhidmatan dan konsep Azure dengan yakin
- Menyelesaikan masalah menggunakan kosa kata teknikal yang sesuai
- Menyumbang dalam perbincangan pasukan dengan bahasa teknikal yang tepat
- Mengembangkan pengetahuan pembangunan awan Azure secara sistematik

## A

**Templat ARM**  
Templat Pengurus Sumber Azure. Format Infrastructure as Code berasaskan JSON yang digunakan untuk mentakrifkan dan menyebarkan sumber Azure secara deklaratif.

**App Service**  
Tawaran platform sebagai perkhidmatan (PaaS) Azure untuk menghoskan aplikasi web, API REST, dan backend mudah alih tanpa mengurus infrastruktur.

**Application Insights**  
Perkhidmatan pemantauan prestasi aplikasi (APM) Azure yang menyediakan pandangan mendalam mengenai prestasi aplikasi, kebolehgunaan, dan penggunaan.

**Azure CLI**  
Antara muka baris perintah untuk mengurus sumber Azure. Digunakan oleh azd untuk pengesahan dan sesetengah operasi.

**Azure Developer CLI (azd)**  
Alat baris perintah berpusatkan pembangun yang mempercepat proses membina dan menyebarkan aplikasi ke Azure menggunakan templat dan Infrastruktur sebagai Kod.

**azure.yaml**  
Fail konfigurasi utama untuk projek azd yang mentakrifkan perkhidmatan, infrastruktur, dan hook penyebaran.

**Pengurus Sumber Azure (ARM)**  
Perkhidmatan penyebaran dan pengurusan Azure yang menyediakan lapisan pengurusan untuk mencipta, mengemas kini, dan memadam sumber.

## B

**Bicep**  
Bahasa khusus domain (DSL) yang dibangunkan oleh Microsoft untuk menyebarkan sumber Azure. Menyediakan sintaks yang lebih mudah berbanding templat ARM sambil memampatkan ke ARM.

**Build**  
Proses menyusun kod sumber, memasang kebergantungan, dan menyediakan aplikasi untuk penyebaran.

**Penyebaran Biru-Hijau**  
Strategi penyebaran yang menggunakan dua persekitaran pengeluaran yang seragam (biru dan hijau) untuk meminimakan masa henti dan risiko.

## C

**Container Apps**  
Perkhidmatan kontena tanpa pelayan Azure yang membolehkan menjalankan aplikasi berasaskan kontena tanpa mengurus infrastruktur yang kompleks.

**CI/CD**  
Integrasi Berterusan/Penyebaran Berterusan. Amalan automatik untuk mengintegrasikan perubahan kod dan menyebarkan aplikasi.

**Cosmos DB**  
Perkhidmatan pangkalan data pelbagai model yang diagihkan secara global Azure yang menyediakan SLA komprehensif untuk keluaran, kelewatan, kebolehgunaan dan konsistensi.

**Konfigurasi**  
Tetapan dan parameter yang mengawal tingkah laku aplikasi dan pilihan penyebaran.

## D

**Penyebaran**  
Proses memasang dan mengkonfigurasi aplikasi dan kebergantungannya pada infrastruktur sasaran.

**Docker**  
Platform untuk membangun, menghantar, dan menjalankan aplikasi menggunakan teknologi kontena.

**Dockerfile**  
Fail teks yang mengandungi arahan untuk membina imej kontena Docker.

## E

**Persekitaran**  
Sasaran penyebaran yang mewakili satu contoh tertentu aplikasi anda (contoh: pembangunan, perantaraan, pengeluaran).

**Pembolehubah Persekitaran**  
Nilai konfigurasi yang disimpan sebagai pasangan kunci-nilai yang boleh diakses oleh aplikasi semasa runtime.

**Endpoint**  
URL atau alamat rangkaian di mana aplikasi atau perkhidmatan boleh diakses.

## F

**Function App**  
Perkhidmatan pengkomputeran tanpa pelayan Azure yang membolehkan menjalankan kod berasaskan acara tanpa mengurus infrastruktur.

## G

**GitHub Actions**  
Platform CI/CD yang digabungkan dengan repositori GitHub untuk mengautomasikan aliran kerja.

**Git**  
Sistem kawalan versi diedarkan yang digunakan untuk menjejak perubahan dalam kod sumber.

## H

**Hooks**  
Skrip atau arahan khusus yang dijalankan pada titik tertentu dalam kitar hayat penyebaran (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Jenis perkhidmatan Azure tempat aplikasi akan disebarkan (contoh: appservice, containerapp, function).

## I

**Infrastruktur sebagai Kod (IaC)**  
Amalan mendefinisikan dan mengurus infrastruktur melalui kod berbanding proses manual.

**Init**  
Proses memulakan projek azd baru, biasanya dari templat.

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
Perkhidmatan Azure untuk mengumpul, menganalisis, dan bertindak berdasarkan data telemetri dari awan dan persekitaran di premis.

## M

**Identiti Terurus**  
Ciri Azure yang menyediakan perkhidmatan Azure dengan identiti yang diurus secara automatik untuk pengesahan ke perkhidmatan Azure lain.

**Mikroservis**  
Pendekatan seni bina di mana aplikasi dibina sebagai koleksi perkhidmatan kecil, bebas.

**Monitor**  
Penyelesaian pemantauan bersatu Azure yang menyediakan pemerhatian penuh ke atas aplikasi dan infrastruktur.

## N

**Node.js**  
Runtime JavaScript dibina di atas enjin JavaScript V8 Chrome untuk membina aplikasi sisi pelayan.

**npm**  
Pengurus pakej untuk Node.js yang mengurus kebergantungan dan pakej.

## O

**Output**  
Nilai yang dikembalikan daripada penyebaran infrastruktur yang boleh digunakan oleh aplikasi atau sumber lain.

## P

**Pakej**  
Proses menyediakan kod aplikasi dan kebergantungan untuk penyebaran.

**Parameter**  
Nilai input yang dipassing ke templat infrastruktur untuk mengubah suai penyebaran.

**PostgreSQL**  
Sistem pangkalan data hubungan sumber terbuka yang disokong sebagai perkhidmatan terurus di Azure.

**Penyediaan**  
Proses mencipta dan mengkonfigurasi sumber Azure yang ditakrif dalam templat infrastruktur.

## Q

**Kuota**  
Had ke atas jumlah sumber yang boleh dicipta dalam langganan atau rantau Azure.

## R

**Kumpulan Sumber**  
Kontena logik untuk sumber Azure yang berkongsi kitar hayat, kebenaran, dan dasar yang sama.

**Token Sumber**  
String unik yang dijana oleh azd untuk memastikan nama sumber adalah unik merentas penyebaran.

**REST API**  
Gaya seni bina untuk mereka bentuk aplikasi rangkaian menggunakan kaedah HTTP.

**Kembalikan**  
Proses memulihkan versi terdahulu aplikasi atau konfigurasi infrastruktur.

## S

**Perkhidmatan**  
Komponen aplikasi anda yang ditakrif dalam azure.yaml (contoh: web frontend, API backend, pangkalan data).

**SKU**  
Stock Keeping Unit. Mewakili tahap perkhidmatan atau tahap prestasi yang berbeza untuk sumber Azure.

**Pangkalan Data SQL**  
Perkhidmatan pangkalan data hubungan terurus Azure berasaskan Microsoft SQL Server.

**Static Web Apps**  
Perkhidmatan Azure untuk membina dan menyebarkan aplikasi web penuh dari repositori kod sumber.

**Akaun Penyimpanan**  
Perkhidmatan Azure yang menyediakan storan awan untuk objek data termasuk blobs, fail, antrian, dan jadual.

**Langganan**  
Kontena akaun Azure yang memegang kumpulan sumber dan sumber, dengan pengurusan bil dan akses berkaitan.

## T

**Templat**  
Struktur projek pra-bina yang mengandungi kod aplikasi, definisi infrastruktur, dan konfigurasi untuk senario biasa.

**Terraform**  
Alat Infrastruktur sebagai Kod sumber terbuka yang menyokong pelbagai penyedia awan termasuk Azure.

**Pengurus Trafik**  
Penyeimbang beban trafik berasaskan DNS Azure untuk mengagihkan trafik merentasi rantau Azure global.

## U

**URI**  
Pengecam Sumber Seragam. String yang mengenal pasti sumber tertentu.

**URL**  
Penentu Lokasi Sumber Seragam. Jenis URI yang menentukan lokasi sumber dan cara mengaksesnya.

## V

**Rangkaian Maya (VNet)**  
Blok binaan asas untuk rangkaian peribadi dalam Azure, menyediakan pengasingan dan segmentasi.

**VS Code**  
Visual Studio Code. Penyunting kod popular dengan integrasi Azure dan azd yang cemerlang.

## W

**Webhook**  
Panggilan balik HTTP yang dicetuskan oleh peristiwa tertentu, biasanya digunakan dalam talian CI/CD.

**Apa-jika**  
Ciri Azure yang menunjukkan perubahan yang akan dibuat oleh penyebaran tanpa benar-benar melaksanakannya.

## Y

**YAML**  
YAML Bukan Bahasa Markah. Standard penyiaran data yang boleh dibaca manusia digunakan untuk fail konfigurasi seperti azure.yaml.

## Z

**Zon**  
Lokasi berasingan secara fizikal dalam rantau Azure yang menyediakan redundansi dan kebolehgunaan tinggi.

---

## Akronim Biasa

| Akronim | Bentuk Penuh | Perihal |
|---------|--------------|--------|
| AAD | Azure Active Directory | Perkhidmatan pengurusan identiti dan akses |
| ACR | Azure Container Registry | Perkhidmatan daftar imej kontena |
| AKS | Azure Kubernetes Service | Perkhidmatan Kubernetes terurus |
| API | Application Programming Interface | Set protokol untuk membina perisian |
| ARM | Azure Resource Manager | Perkhidmatan penyebaran dan pengurusan Azure |
| CDN | Content Delivery Network | Rangkaian pengedaran pelayan |
| CI/CD | Continuous Integration/Continuous Deployment | Amalan pembangunan automatik |
| CLI | Command Line Interface | Antara muka pengguna berasaskan teks |
| DNS | Domain Name System | Sistem terjemahan nama domain ke alamat IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versi HTTP yang selamat |
| IaC | Infrastructure as Code | Pengurusan infrastruktur melalui kod |
| JSON | JavaScript Object Notation | Format pertukaran data |
| JWT | JSON Web Token | Format token untuk penghantaran maklumat selamat |
| KQL | Kusto Query Language | Bahasa pertanyaan untuk perkhidmatan data Azure |
| RBAC | Role-Based Access Control | Kaedah kawalan akses berdasarkan peranan pengguna |
| REST | Representational State Transfer | Gaya seni bina untuk perkhidmatan web |
| SDK | Software Development Kit | Koleksi alat pembangunan |
| SLA | Service Level Agreement | Komitmen terhadap kebolehgunaan/prestasi perkhidmatan |
| SQL | Structured Query Language | Bahasa untuk mengurus pangkalan data relasi |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protokol kriptografi |
| URI | Uniform Resource Identifier | String yang mengenal pasti sumber |
| URL | Uniform Resource Locator | Jenis URI yang menentukan lokasi sumber |
| VM | Virtual Machine | Emulasi sistem komputer |
| VNet | Virtual Network | Rangkaian peribadi dalam Azure |
| YAML | YAML Bukan Bahasa Markah | Standard penyiaran data |

---

## Pemetaan Nama Perkhidmatan Azure

| Nama Biasa | Nama Perkhidmatan Azure Rasmi | Jenis Host azd |
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
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Istilah-Konteks Spesifik

### Istilah Pembangunan
- **Pemuatan Semula Panas**: Mengemas kini aplikasi secara automatik semasa pembangunan tanpa perlu mula semula
- **Saluran Pembinaan**: Proses automatik untuk membina dan menguji kod
- **Slot Penyebaran**: Persekitaran perantaraan dalam App Service
- **Pariti Persekitaran**: Menjaga persekitaran pembangunan, perantaraan, dan pengeluaran agar serupa

### Istilah Keselamatan
- **Identiti Terurus**: Ciri Azure yang menyediakan pengurusan kelayakan automatik
- **Key Vault**: Penyimpanan selamat untuk rahsia, kunci, dan sijil
- **RBAC**: Kawalan akses berasaskan peranan untuk sumber Azure
- **Kumpulan Keselamatan Rangkaian**: Firewall maya untuk mengawal trafik rangkaian

### Istilah Pemantauan
- **Telemetri**: Pengumpulan automatik ukuran dan data
- **Pemantauan Prestasi Aplikasi (APM)**: Memantau prestasi perisian
- **Log Analytics**: Perkhidmatan untuk mengumpul dan menganalisis data log
- **Peraturan Amaran**: Notifikasi automatik berdasarkan metrik atau keadaan

### Istilah Penyebaran
- **Penyebaran Biru-Hijau**: Strategi penyebaran tanpa masa henti
- **Penyebaran Canary**: Pelancaran secara beransur kepada subset pengguna
- **Kemas Kini Berperingkat**: Penggantian berurutan instans aplikasi
- **Kembalikan**: Memulihkan versi aplikasi terdahulu

---

**Petua Penggunaan**: Gunakan `Ctrl+F` untuk mencari istilah tertentu dengan cepat dalam glosari ini. Istilah dirujuk silang di mana berkenaan.

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Cheat Sheet](cheat-sheet.md)
- **Pelajaran Seterusnya**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->