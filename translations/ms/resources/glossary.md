# Glosari - Terminologi Azure dan AZD

**Rujukan untuk Semua Bab**
- **📚 Halaman Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Belajar Asas**: [Bab 1: Asas AZD](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 Istilah AI**: [Bab 2: Pembangunan AI-Pertama](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Pengenalan

Glosari menyeluruh ini memberikan definisi untuk istilah, konsep, dan akronim yang digunakan dalam Azure Developer CLI dan pembangunan awan Azure. Rujukan penting untuk memahami dokumentasi teknikal, menyelesaikan masalah, dan berkomunikasi dengan berkesan mengenai projek azd dan perkhidmatan Azure.

## Matlamat Pembelajaran

Dengan menggunakan glosari ini, anda akan:
- Memahami terminologi dan konsep asas Azure Developer CLI
- Menguasai kosa kata pembangunan awan Azure dan istilah teknikal
- Merujuk kepada terminologi Infrastruktur sebagai Kod dan penyebaran dengan cekap
- Memahami nama perkhidmatan Azure, akronim, dan tujuannya
- Mengakses definisi untuk istilah penyelesaian masalah dan debug
- Belajar konsep seni bina dan pembangunan Azure yang lebih maju

## Hasil Pembelajaran

Dengan rujukan berkala kepada glosari ini, anda akan dapat:
- Berkomunikasi dengan berkesan menggunakan terminologi Azure Developer CLI yang betul
- Memahami dokumentasi teknikal dan mesej ralat dengan lebih jelas
- Menavigasi perkhidmatan dan konsep Azure dengan yakin
- Menyelesaikan masalah menggunakan kosa kata teknikal yang sesuai
- Menyumbang kepada perbincangan pasukan dengan bahasa teknikal yang tepat
- Mengembangkan pengetahuan pembangunan awan Azure anda secara sistematik

## A

**Templat ARM**  
Templat Azure Resource Manager. Format Infrastruktur sebagai Kod berasaskan JSON yang digunakan untuk mentakrif dan menyebarkan sumber Azure secara deklaratif.

**Perkhidmatan App**  
Tawaran platform-sebagai-perkhidmatan (PaaS) Azure untuk menghos web aplikasi, REST API, dan backend mudah alih tanpa mengurus infrastruktur.

**Application Insights**  
Perkhidmatan pemantauan prestasi aplikasi Azure yang memberikan pandangan mendalam tentang prestasi aplikasi, ketersediaan, dan penggunaan.

**Azure CLI**  
Antara muka baris perintah untuk mengurus sumber Azure. Ia melengkapkan AZD tetapi mempunyai log masuk berasingan; pengesahan utama AZD menggunakan `azd auth login`.

**Azure Developer CLI (azd)**  
Alat baris perintah berpusat kepada pembangun yang mempercepatkan proses membina dan menyebarkan aplikasi ke Azure menggunakan templat dan Infrastruktur sebagai Kod.

**azure.yaml**  
Fail konfigurasi utama untuk projek azd yang mentakrifkan perkhidmatan, infrastruktur, dan kaitan penyebaran.

**Azure Resource Manager (ARM)**  
Perkhidmatan penyebaran dan pengurusan Azure yang menyediakan lapisan pengurusan untuk membuat, mengemas kini, dan memadam sumber.

## B

**Bicep**  
Bahasa khusus domain (DSL) yang dibangunkan oleh Microsoft untuk menyebarkan sumber Azure. Menyediakan sintaks yang lebih mudah daripada templat ARM sambil diterjemah kepada ARM.

**Bina**  
Proses menyusun kod sumber, memasang kebergantungan, dan menyediakan aplikasi untuk penyebaran.

**Penyebaran Biru-Hijau**  
Strategi penyebaran yang menggunakan dua persekitaran pengeluaran yang sama (biru dan hijau) untuk meminimumkan masa tidak beroperasi dan risiko.

## C

**Container Apps**  
Perkhidmatan kontena tanpa pelayan Azure yang membolehkan menjalankan aplikasi terkonteiner tanpa mengurus infrastruktur yang kompleks.

**CI/CD**  
Integrasi Berterusan/Penyebaran Berterusan. Amalan automatik untuk menggabungkan perubahan kod dan menyebarkan aplikasi.

**Cosmos DB**  
Perkhidmatan pangkalan data multi-model diedarkan secara global Azure yang menyediakan SLA komprehensif untuk throughput, kelewatan, ketersediaan, dan konsistensi.

**Konfigurasi**  
Tetapan dan parameter yang mengawal tingkah laku aplikasi dan pilihan penyebaran.

## D

**Penyebaran**  
Proses memasang dan mengkonfigurasi aplikasi dan kebergantungan mereka pada infrastruktur sasaran.

**Docker**  
Platform untuk membangun, mengangkut, dan menjalankan aplikasi menggunakan teknologi kontena.

**Dockerfile**  
Fail teks yang mengandungi arahan untuk membina imej kontena Docker.

## E

**Persekitaran**  
Sasaran penyebaran yang mewakili instans tertentu aplikasi anda (contoh: pembangunan, pementasan, pengeluaran).

**Pembolehubah Persekitaran**  
Nilai konfigurasi yang disimpan sebagai pasangan kunci-nilai yang boleh diakses aplikasi semasa masa jalan.

**Titik Akhir**  
URL atau alamat rangkaian di mana aplikasi atau perkhidmatan boleh diakses.

## F

**Function App**  
Perkhidmatan pengkomputeran tanpa pelayan Azure yang membolehkan menjalankan kod yang dipacu peristiwa tanpa mengurus infrastruktur.

## G

**GitHub Actions**  
Platform CI/CD yang diintegrasikan dengan repositori GitHub untuk mengautomasi aliran kerja.

**Git**  
Sistem kawalan versi teragih yang digunakan untuk menjejak perubahan dalam kod sumber.

## H

**Hooks**  
Skrip atau arahan khusus yang dijalankan pada titik tertentu semasa kitaran hayat penyebaran (pra-provision, pasca-provision, pra-sebar, pasca-sebar).

**Host**  
Jenis perkhidmatan Azure di mana aplikasi akan disebarkan (contoh: appservice, containerapp, function).

## I

**Infrastruktur sebagai Kod (IaC)**  
Amalan mendefinisikan dan mengurus infrastruktur melalui kod dan bukannya proses manual.

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
Perkhidmatan yang mengagihkan trafik rangkaian masuk merentasi pelbagai pelayan atau instans.

**Log Analytics**  
Perkhidmatan Azure untuk mengumpul, menganalisis, dan bertindak atas data telemetri dari persekitaran awan dan premis.

## M

**Managed Identity**  
Ciri Azure yang menyediakan identiti yang diurus secara automatik kepada perkhidmatan Azure untuk pengesahan ke perkhidmatan Azure lain.

**Microservices**  
Pendekatan seni bina di mana aplikasi dibina sebagai koleksi perkhidmatan kecil dan berdikari.

**Monitor**  
Penyelesaian pemantauan bersatu Azure yang menyediakan pemerhatian penuh tumpukan merentasi aplikasi dan infrastruktur.

## N

**Node.js**  
Masa jalan JavaScript dibina di atas enjin JavaScript Chrome V8 untuk membina aplikasi pelayan.

**npm**  
Pengurus pakej untuk Node.js yang mengurus kebergantungan dan pakej.

## O

**Output**  
Nilai yang dikembalikan dari penyebaran infrastruktur yang boleh digunakan oleh aplikasi atau sumber lain.

## P

**Pakej**  
Proses menyediakan kod aplikasi dan kebergantungannya untuk penyebaran.

**Parameter**  
Nilai input yang dihantar ke templat infrastruktur untuk menyesuaikan penyebaran.

**PostgreSQL**  
Sistem pangkalan data hubungan sumber terbuka yang disokong sebagai perkhidmatan terurus di Azure.

**Provisioning**  
Proses membuat dan mengkonfigurasi sumber Azure yang ditakrifkan dalam templat infrastruktur.

## Q

**Kuota**  
Had pada jumlah sumber yang boleh dibuat dalam langganan atau rantau Azure.

## R

**Kumpulan Sumber**  
Bekas logik untuk sumber Azure yang berkongsi kitar hidup, kebenaran, dan polisi yang sama.

**Token Sumber**  
Rentetan unik yang dijana oleh azd untuk memastikan nama sumber adalah unik merentasi penyebaran.

**REST API**  
Gaya seni bina untuk mereka bentuk aplikasi rangkaian menggunakan kaedah HTTP.

**Rollback**  
Proses memulihkan kepada versi sebelumnya aplikasi atau konfigurasi infrastruktur.

## S

**Perkhidmatan**  
Komponen aplikasi anda yang ditakrifkan dalam azure.yaml (contoh: frontend web, backend API, pangkalan data).

**SKU**  
Unit Penyimpanan Stok. Mewakili tahap perkhidmatan atau prestasi yang berbeza untuk sumber Azure.

**Pangkalan Data SQL**  
Perkhidmatan pangkalan data hubungan yang diurus Azure berdasarkan Microsoft SQL Server.

**Static Web Apps**  
Perkhidmatan Azure untuk membina dan menyebarkan aplikasi web penuh dari repositori kod sumber.

**Akaun Penyimpanan**  
Perkhidmatan Azure yang menyediakan penyimpanan awan untuk objek data termasuk blob, fail, barisan, dan jadual.

**Langganan**  
Bekas akaun Azure yang memegang kumpulan sumber dan sumber, dengan pengebilan dan pengurusan akses berkaitan.

## T

**Templat**  
Struktur projek siap pakai yang mengandungi kod aplikasi, definisi infrastruktur, dan konfigurasi untuk senario biasa.

**Terraform**  
Alat Infrastruktur sebagai Kod sumber terbuka yang menyokong pelbagai penyedia awan termasuk Azure.

**Pengurus Trafik**  
Penyeimbang beban trafik berasaskan DNS Azure untuk mengagihkan trafik merentasi rantau Azure global.

## U

**URI**  
Pengenal Sumber Seragam. Rentetan yang mengenal pasti sumber tertentu.

**URL**  
Penentu Lokasi Sumber Seragam. Jenis URI yang menentukan lokasi sumber dan cara mengambilnya.

## V

**Rangkaian Maya (VNet)**  
Blok binaan asas untuk rangkaian peribadi di Azure, menyediakan pengasingan dan segmentasi.

**VS Code**  
Visual Studio Code. Penyunting kod popular dengan integrasi Azure dan azd yang cemerlang.

## W

**Webhook**  
Panggilan balik HTTP yang dicetuskan oleh peristiwa tertentu, biasanya digunakan dalam saluran CI/CD.

**What-if**  
Ciri Azure yang menunjukkan perubahan yang akan dilakukan oleh penyebaran tanpa benar-benar melaksanakannya.

## Y

**YAML**  
YAML Bukan Bahasa Tanda. Standard penyusunan data yang boleh dibaca manusia digunakan untuk fail konfigurasi seperti azure.yaml.

## Z

**Zon**  
Lokasi yang berasingan secara fizikal dalam rantau Azure yang menyediakan redunansi dan ketersediaan tinggi.

---

## Akronim Biasa

| Akronim | Bentuk Penuh | Penerangan |
|---------|-----------|-------------|
| AAD | Azure Active Directory (kini Microsoft Entra ID) | Perkhidmatan pengurusan identiti dan akses |
| ACR | Azure Container Registry | Perkhidmatan registri imej kontena |
| AKS | Azure Kubernetes Service | Perkhidmatan Kubernetes yang diurus |
| API | Application Programming Interface | Set protokol untuk membina perisian |
| ARM | Azure Resource Manager | Perkhidmatan penyebaran dan pengurusan Azure |
| CDN | Content Delivery Network | Rangkaian teragih pelayan |
| CI/CD | Continuous Integration/Continuous Deployment | Amalan pembangunan automatik |
| CLI | Command Line Interface | Antara muka pengguna berasaskan teks |
| DNS | Domain Name System | Sistem untuk menterjemah nama domain ke alamat IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versi HTTP yang selamat |
| IaC | Infrastructure as Code | Mengurus infrastruktur melalui kod |
| JSON | JavaScript Object Notation | Format pertukaran data |
| JWT | JSON Web Token | Format token untuk pemindahan maklumat selamat |
| KQL | Kusto Query Language | Bahasa pertanyaan untuk perkhidmatan data Azure |
| RBAC | Role-Based Access Control | Kaedah kawalan akses berdasarkan peranan pengguna |
| REST | Representational State Transfer | Gaya seni bina untuk perkhidmatan web |
| SDK | Software Development Kit | Koleksi alat pembangunan |
| SLA | Service Level Agreement | Komitmen terhadap ketersediaan/prestasi perkhidmatan |
| SQL | Structured Query Language | Bahasa untuk mengurus pangkalan data hubungan |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protokol kriptografi |
| URI | Uniform Resource Identifier | Rentetan yang mengenal pasti sumber |
| URL | Uniform Resource Locator | Jenis URI yang menentukan lokasi sumber |
| VM | Virtual Machine | Emulasi sistem komputer |
| VNet | Virtual Network | Rangkaian peribadi di Azure |
| YAML | YAML Bukan Bahasa Tanda | Standard penyusunan data |

---

## Pemetaan Nama Perkhidmatan Azure

| Nama Biasa | Nama Rasmi Perkhidmatan Azure | Jenis Host azd |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Pangkalan Data | Azure Database for PostgreSQL | Sumber infrastruktur, bukan aplikasi `host` |
| Pangkalan Data NoSQL | Azure Cosmos DB | Sumber infrastruktur, bukan aplikasi `host` |
| Penyimpanan | Azure Storage Account | Sumber infrastruktur, bukan aplikasi terbina dalam `host` |
| Cache | Azure Managed Redis | Sumber infrastruktur, bukan aplikasi `host` |
| Carian | Azure AI Search | Sumber infrastruktur, bukan aplikasi `host` |
| Mesej | Azure Service Bus | Sumber infrastruktur, bukan aplikasi `host` |

`services.<name>.host` memilih sasaran penyebaran aplikasi; ia bukan singkatan untuk mana-mana jenis sumber Azure. Pangkalan data, cache, perkhidmatan carian, dan barisan biasanya disediakan melalui pembekal infrastruktur dan disambungkan ke aplikasi melalui output/konfigurasi.

---

## Istilah Khusus Konteks

### Istilah Pembangunan
- **Hot Reload**: Memperbaharui aplikasi secara automatik semasa pembangunan tanpa perlu mulakan semula
- **Saluran Bina**: Proses automatik bagi membina dan menguji kod
- **Slot Penyebaran**: Persekitaran pementasan dalam Perkhidmatan App
- **Kesamaan Persekitaran**: Menjaga persekitaran pembangunan, pementasan, dan pengeluaran supaya serupa

### Istilah Keselamatan
- **Managed Identity**: Ciri Azure menyediakan pengurusan kelayakan automatik
- **Key Vault**: Penyimpanan selamat untuk rahsia, kunci, dan sijil
- **RBAC**: Kawalan akses berasaskan peranan untuk sumber Azure
- **Kumpulan Keselamatan Rangkaian**: Firewall maya untuk mengawal trafik rangkaian

### Istilah Pemantauan
- **Telemetri**: Pengumpulan automatik ukuran dan data
- **Pemantauan Prestasi Aplikasi (APM)**: Memantau prestasi perisian
- **Log Analytics**: Perkhidmatan mengumpul dan menganalisis data log
- **Peraturan Amaran**: Pemberitahuan automatik berdasarkan metrik atau keadaan

### Istilah Penyebaran
- **Penyebaran Biru-Hijau**: Strategi penyebaran tanpa masa henti
- **Penyebaran Canary**: Pelancaran berperingkat kepada subset pengguna
- **Kemas Kini Bergulir**: Penggantian berurutan instans aplikasi
- **Rollback**: Memulihkan versi aplikasi terdahulu

---

**Petua Penggunaan**: Gunakan `Ctrl+F` untuk mencari istilah tertentu dalam glosari ini dengan cepat. Istilah berkait dirujuk silang apabila berkenaan.

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Lembaran Cheat](cheat-sheet.md)
- **Pelajaran Seterusnya**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->