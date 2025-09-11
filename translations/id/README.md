<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c0984265b7a9357388f864c19606c80d",
  "translation_date": "2025-09-11T10:08:57+00:00",
  "source_file": "README.md",
  "language_code": "id"
}
-->
# AZD Untuk Pemula

![AZD-untuk-pemula](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.id.png) 

Ikuti langkah-langkah berikut untuk mulai menggunakan sumber daya ini:
1. **Fork Repository**: Klik [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone Repository**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Bergabunglah dengan Komunitas Azure Discord dan temui para ahli serta pengembang lainnya**](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Dukungan Multi-Bahasa

#### Didukung melalui GitHub Action (Otomatis & Selalu Terbaru)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](./README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**Jika Anda ingin menambahkan bahasa terjemahan lainnya, daftar bahasa yang didukung tersedia [di sini](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Pengantar

Selamat datang di panduan lengkap untuk Azure Developer CLI (azd). Repository ini dirancang untuk membantu pengembang dari berbagai tingkat, mulai dari pelajar hingga profesional, mempelajari dan menguasai Azure Developer CLI untuk penerapan cloud yang efisien. Sumber belajar yang terstruktur ini memberikan pengalaman langsung dengan penerapan cloud Azure, pemecahan masalah umum, dan penerapan praktik terbaik untuk keberhasilan penerapan template AZD.

## Tujuan Pembelajaran

Dengan mempelajari repository ini, Anda akan:
- Menguasai dasar-dasar dan konsep inti Azure Developer CLI
- Belajar menerapkan dan menyediakan sumber daya Azure menggunakan Infrastructure as Code
- Mengembangkan keterampilan pemecahan masalah untuk masalah penerapan AZD yang umum
- Memahami validasi pra-penerapan dan perencanaan kapasitas
- Menerapkan praktik terbaik keamanan dan strategi optimasi biaya
- Membangun kepercayaan diri dalam menerapkan aplikasi siap produksi ke Azure

## Hasil Pembelajaran

Setelah menyelesaikan kursus ini, Anda akan dapat:
- Menginstal, mengonfigurasi, dan menggunakan Azure Developer CLI dengan sukses
- Membuat dan menerapkan aplikasi menggunakan template AZD
- Memecahkan masalah autentikasi, infrastruktur, dan penerapan
- Melakukan pemeriksaan pra-penerapan termasuk perencanaan kapasitas dan pemilihan SKU
- Menerapkan praktik terbaik untuk pemantauan, keamanan, dan manajemen biaya
- Mengintegrasikan alur kerja AZD ke dalam pipeline CI/CD

## Daftar Isi

- [Apa itu Azure Developer CLI?](../..)
- [Memulai Cepat](../..)
- [Dokumentasi](../..)
- [Contoh & Template](../..)
- [Sumber Daya](../..)
- [Kontribusi](../..)

## Apa itu Azure Developer CLI?

Azure Developer CLI (azd) adalah antarmuka baris perintah yang berfokus pada pengembang yang mempercepat proses pembangunan dan penerapan aplikasi ke Azure. Fitur yang disediakan meliputi:

- **Penerapan berbasis template** - Gunakan template yang sudah dibuat untuk pola aplikasi umum
- **Infrastructure as Code** - Kelola sumber daya Azure menggunakan Bicep atau Terraform
- **Alur kerja terintegrasi** - Menyediakan, menerapkan, dan memantau aplikasi secara mulus
- **Ramah pengembang** - Dioptimalkan untuk produktivitas dan pengalaman pengembang

## Memulai Cepat

### Prasyarat
- Langganan Azure
- Azure CLI terinstal
- Git (untuk cloning template)

### Instalasi
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Penerapan Pertama Anda
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

## Dokumentasi

### Memulai
- [**Dasar-dasar AZD**](docs/getting-started/azd-basics.md) - Konsep inti dan terminologi
- [**Instalasi & Pengaturan**](docs/getting-started/installation.md) - Panduan instalasi spesifik platform
- [**Konfigurasi**](docs/getting-started/configuration.md) - Pengaturan lingkungan dan autentikasi
- [**Proyek Pertama Anda**](docs/getting-started/first-project.md) - Tutorial langkah demi langkah

### Penerapan & Penyediaan
- [**Panduan Penerapan**](docs/deployment/deployment-guide.md) - Alur kerja penerapan lengkap
- [**Penyediaan Sumber Daya**](docs/deployment/provisioning.md) - Manajemen sumber daya Azure

### Pemeriksaan Pra-Penerapan
- [**Perencanaan Kapasitas**](docs/pre-deployment/capacity-planning.md) - Validasi kapasitas sumber daya Azure
- [**Pemilihan SKU**](docs/pre-deployment/sku-selection.md) - Memilih SKU Azure yang tepat
- [**Pemeriksaan Pra-Penerbangan**](docs/pre-deployment/preflight-checks.md) - Skrip validasi otomatis

### Pemecahan Masalah
- [**Masalah Umum**](docs/troubleshooting/common-issues.md) - Masalah yang sering ditemui dan solusinya
- [**Panduan Debugging**](docs/troubleshooting/debugging.md) - Strategi debugging langkah demi langkah

## Contoh & Template
- [**Contoh**]([examples/README.md) - Contoh praktis, template, dan skenario dunia nyata untuk membantu Anda mempelajari Azure Developer CLI melalui praktik langsung. Setiap contoh menyediakan kode lengkap, template infrastruktur, dan instruksi terperinci untuk berbagai arsitektur aplikasi dan pola penerapan.

### Lab/Workshop Praktis
- [**AZD Untuk Pemula**](workshop/README.md) - Workshop ini akan berfokus pada template AZD Get Started with AI Agents dan memberikan praktik terbaik untuk penerapan layanan Azure AI menggunakan AZD

## Sumber Daya

### Referensi Cepat
- [**Lembar Cheat Perintah**](resources/cheat-sheet.md) - Perintah azd penting
- [**Glosarium**](resources/glossary.md) - Terminologi Azure dan azd
- [**FAQ**](resources/faq.md) - Pertanyaan yang sering diajukan
- [**Panduan Belajar**](resources/study-guide.md) - Tujuan pembelajaran dan latihan komprehensif

### Sumber Daya Eksternal
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pusat Arsitektur Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulator Harga Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status Azure](https://status.azure.com/)

## Jalur Pembelajaran

### Untuk Pelajar & Pemula
1. Mulai dengan [Dasar-dasar AZD](docs/getting-started/azd-basics.md)
2. Ikuti [Panduan Instalasi](docs/getting-started/installation.md)
3. Selesaikan [Proyek Pertama Anda](docs/getting-started/first-project.md)
4. Latihan dengan [Contoh Aplikasi Web Sederhana](../../examples/simple-web-app)

### Untuk Pengembang
1. Tinjau [Panduan Konfigurasi](docs/getting-started/configuration.md)
2. Pelajari [Panduan Penerapan](docs/deployment/deployment-guide.md)
3. Kerjakan [Contoh Aplikasi Database](../../examples/database-app)
4. Jelajahi [Contoh Aplikasi Container](../../examples/container-app)

### Untuk Insinyur DevOps
1. Kuasai [Penyediaan Sumber Daya](docs/deployment/provisioning.md)
2. Terapkan [Pemeriksaan Pra-Penerbangan](docs/pre-deployment/preflight-checks.md)
3. Latihan [Perencanaan Kapasitas](docs/pre-deployment/capacity-planning.md)
4. Contoh Lanjutan [Microservices](../../examples/microservices)

## Kontribusi

Kami menyambut kontribusi! Silakan baca [Panduan Kontribusi](CONTRIBUTING.md) untuk detail tentang:
- Cara mengirimkan masalah dan permintaan fitur
- Panduan kontribusi kode
- Peningkatan dokumentasi
- Standar komunitas

## Dukungan

- **Masalah**: [Laporkan bug dan minta fitur](https://github.com/microsoft/azd-for-beginners/issues)
- **Diskusi**: [Komunitas Microsoft Azure Discord Q&A dan diskusi](https://discord.gg/microsoft-azure)
- **Email**: Untuk pertanyaan pribadi
- **Microsoft Learn**: [Dokumentasi resmi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

## Lisensi

Proyek ini dilisensikan di bawah Lisensi MIT - lihat file [LICENSE](../../LICENSE) untuk detailnya.

## 🎒 Kursus Lainnya

Tim kami juga membuat kursus lainnya! Lihat:

- [**BARU** Model Context Protocol (MCP) Untuk Pemula](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agents untuk Pemula](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI untuk Pemula menggunakan .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generative AI untuk Pemula](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI untuk Pemula menggunakan Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML untuk Pemula](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science untuk Pemula](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI untuk Pemula](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Keamanan Siber untuk Pemula](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Pengembangan Web untuk Pemula](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT untuk Pemula](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [Pengembangan XR untuk Pemula](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Menguasai GitHub Copilot untuk Pemrograman Berpasangan AI](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Menguasai GitHub Copilot untuk Pengembang C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Pilih Petualangan Copilot Anda Sendiri](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**Navigasi**
- **Pelajaran Selanjutnya**: [Dasar-dasar AZD](docs/getting-started/azd-basics.md)

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk memberikan hasil yang akurat, harap diingat bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.