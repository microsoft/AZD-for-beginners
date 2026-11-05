# AZD Untuk Pemula: Perjalanan Pembelajaran Terstruktur

![AZD-for-beginners](../../translated_images/id/azdbeginners.5527441dd9f74068.webp) 

[![Pengamat GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Fork GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Bintang GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Terjemahan Otomatis (Selalu Terbaru)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arab](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgaria](../bg/README.md) | [Myanmar (Burma)](../my/README.md) | [Cina (Sederhana)](../zh-CN/README.md) | [Cina (Tradisional, Hong Kong)](../zh-HK/README.md) | [Cina (Tradisional, Macau)](../zh-MO/README.md) | [Cina (Tradisional, Taiwan)](../zh-TW/README.md) | [Kroasia](../hr/README.md) | [Ceko](../cs/README.md) | [Denmark](../da/README.md) | [Belanda](../nl/README.md) | [Estonia](../et/README.md) | [Finlandia](../fi/README.md) | [Perancis](../fr/README.md) | [Jerman](../de/README.md) | [Yunani](../el/README.md) | [Ibrani](../he/README.md) | [Hindi](../hi/README.md) | [Hungaria](../hu/README.md) | [Indonesia](./README.md) | [Italia](../it/README.md) | [Jepang](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korea](../ko/README.md) | [Lituania](../lt/README.md) | [Melayu](../ms/README.md) | [Malayalam](../ml/README.md) | [Manipuri (Meitei Mayek)](../mni/README.md) | [Marathi](../mr/README.md) | [Nepal](../ne/README.md) | [Pidgin Nigeria](../pcm/README.md) | [Norwegia](../no/README.md) | [Persia (Farsi)](../fa/README.md) | [Polandia](../pl/README.md) | [Portugis (Brasil)](../pt-BR/README.md) | [Portugis (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumania](../ro/README.md) | [Rusia](../ru/README.md) | [Serbia (Sirilik)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenia](../sl/README.md) | [Spanyol](../es/README.md) | [Swahili](../sw/README.md) | [Swedia](../sv/README.md) | [Tagalog (Filipina)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turki](../tr/README.md) | [Ukraina](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnam](../vi/README.md)

> **Lebih Suka Clone Secara Lokal?**
>
> Repositori ini termasuk lebih dari 50 terjemahan bahasa yang secara signifikan meningkatkan ukuran unduhan. Untuk clone tanpa terjemahan, gunakan sparse checkout:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Ini memberi Anda semua yang Anda butuhkan untuk menyelesaikan kursus dengan unduhan yang jauh lebih cepat.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Apa yang Baru di azd Hari Ini

> 📌 Kursus ini divalidasi terhadap **`azd 1.27.1`** (Juli 2026). Jalankan `azd version` untuk memeriksa build Anda, dan `azd upgrade` untuk mendapatkan yang terbaru.

Azure Developer CLI telah berkembang melampaui aplikasi web dan API tradisional. Hari ini, azd adalah alat tunggal untuk menerapkan **aplikasi apa pun** ke Azure—termasuk aplikasi yang didukung AI dan agen cerdas.

Berikut artinya untuk Anda:

- **Agen AI sekarang menjadi beban kerja azd kelas satu.** Anda dapat menginisialisasi, menerapkan, dan mengelola proyek agen AI menggunakan alur kerja `azd init` → `azd up` yang sudah Anda kenal.
- **Siklus hidup agen lengkap dari CLI.** Ekstensi `azure.ai.agents` kini mencakup seluruh perjalanan—`azd ai agent init` untuk scaffold, `azd ai agent invoke` untuk menguji (dengan output waktu respons), `azd ai agent eval generate` dan `azd ai agent optimize` untuk mengukur dan meningkatkan kualitas, dan `azd ai agent delete` untuk membersihkan.
- **Lebih banyak blok bangunan AI.** Ekstensi pratinjau baru—`azure.ai.skills` dan `azure.ai.connections`—memungkinkan Anda mengelola keterampilan agen yang dapat digunakan ulang dan koneksi Foundry langsung dengan azd.
- **Integrasi Microsoft Foundry** menghadirkan penyebaran model, hosting agen, dan konfigurasi layanan AI langsung ke dalam ekosistem template azd.
- **Dasar-dasar sehari-hari yang lebih mulus.** Rilis terbaru membuat `azd init` idempoten (aman untuk dijalankan ulang), membuat `azd auth login` menghapus token lama secara otomatis, dan menambahkan prompt pengaturan pertama kali `azd tool` yang ramah.
- **Alur kerja inti tidak berubah.** Baik Anda menerapkan aplikasi todo, mikroservis, atau solusi AI multi-agen, perintahnya tetap sama.

> **Catatan untuk pengguna Aspire:** Microsoft sekarang menyebut produk ini hanya sebagai **Aspire** (sebelumnya ".NET Aspire"). Dukungan Aspire di azd tidak berubah—hanya namanya yang diperbarui.

Jika Anda sudah menggunakan azd sebelumnya, dukungan AI adalah perpanjangan alami—bukan alat terpisah atau jalur lanjutan. Jika Anda memulai dari awal, Anda akan belajar satu alur kerja yang berlaku untuk semua hal.

---

## 🚀 Apa itu Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** adalah alat baris perintah yang ramah pengembang yang memudahkan penerapan aplikasi ke Azure. Alih-alih membuat dan menghubungkan puluhan sumber daya Azure secara manual, Anda dapat menerapkan seluruh aplikasi dengan satu perintah.

### Keajaiban `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

**Itu dia!** Tidak perlu mengklik Portal Azure, tidak perlu belajar template ARM kompleks terlebih dahulu, tidak ada konfigurasi manual - hanya aplikasi yang berjalan di Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Apa Bedanya?

Ini adalah pertanyaan paling umum yang ditanyakan pemula. Berikut jawaban sederhananya:

| Fitur | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Tujuan** | Mengelola sumber daya Azure individual | Menerapkan aplikasi lengkap |
| **Pola Pikir** | Fokus pada infrastruktur | Fokus pada aplikasi |
| **Contoh** | `az webapp create --name myapp...` | `azd up` |
| **Kurva Pembelajaran** | Harus tahu layanan Azure | Hanya tahu aplikasi Anda |
| **Terbaik Untuk** | DevOps, Infrastruktur | Pengembang, Prototipe |

### Analogi Sederhana

- **Azure CLI** seperti memiliki semua alat untuk membangun rumah - palu, gergaji, paku. Anda bisa membangun apa saja, tapi harus tahu konstruksi.
- **Azure Developer CLI** seperti menyewa kontraktor - Anda menggambarkan apa yang Anda inginkan, dan mereka menangani pembangunannya.

### Kapan Menggunakan Masing-Masing

| Skenario | Gunakan Ini |
|----------|----------|
| "Saya ingin segera menerapkan aplikasi web saya" | `azd up` |
| "Saya perlu membuat akun penyimpanan saja" | `az storage account create` |
| "Saya membangun aplikasi AI penuh" | `azd init --template azure-search-openai-demo` |
| "Saya perlu debug sumber daya Azure spesifik" | `az resource show` |
| "Saya ingin penerapan siap produksi dalam hitungan menit" | `azd up --environment production` |

### Mereka Bekerja Bersama!

AZD menggunakan Azure CLI di balik layar. Anda bisa menggunakan keduanya:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Temukan Template di Awesome AZD

Jangan mulai dari nol! **Awesome AZD** adalah koleksi komunitas dari template siap pakai:

| Sumber Daya | Deskripsi |
|----------|-------------|
| 🔗 [**Galeri Awesome AZD**](https://azure.github.io/awesome-azd/) | Jelajahi 200+ template dengan deploy satu kali klik |
| 🔗 [**Kirim Template**](https://github.com/Azure/awesome-azd/issues) | Berkontribusi template Anda sendiri ke komunitas |
| 🔗 [**Repositori GitHub**](https://github.com/Azure/awesome-azd) | Bintang dan jelajahi sumbernya |

### Template AI Populer dari Awesome AZD

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Memulai dalam 3 Langkah

Sebelum memulai, pastikan mesin Anda siap untuk template yang ingin Anda terapkan:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jika ada pemeriksaan yang gagal, perbaiki terlebih dahulu lalu lanjutkan dengan memulai cepat.

### Langkah 1: Instal AZD (2 menit)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Langkah 2: Autentikasi untuk AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Jika Anda tidak yakin mana yang Anda butuhkan, ikuti seluruh alur pengaturan di [Instalasi & Pengaturan](docs/chapter-01-foundation/installation.md#authentication-setup).

### Langkah 3: Terapkan Aplikasi Pertama Anda

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Selesai!** Aplikasi Anda sekarang online di Azure.

### Bersihkan (Jangan Lupa!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cara Menggunakan Kursus Ini

Kursus ini dirancang untuk **pembelajaran bertahap** - mulai dari yang Anda kuasai dan tingkatkan kemampuan Anda:

| Pengalaman Anda | Mulai Di Sini |
|-----------------|------------|
| **Baru mengenal Azure** | [Bab 1: Dasar](#-chapter-1-foundation--quick-start) |
| **Tahu Azure, baru di AZD** | [Bab 1: Dasar](#-chapter-1-foundation--quick-start) |
| **Ingin menerapkan aplikasi AI** | [Bab 2: Pengembangan AI-Pertama](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Ingin praktik langsung** | [🎓 Workshop Interaktif](workshop/README.md) - lab terpandu 3-4 jam |
| **Butuh pola produksi** | [Bab 8: Produksi & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Pengaturan Cepat

1. **Fork Repositori Ini**: [![Fork GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Dapatkan Bantuan**: [Komunitas Discord Azure](https://discord.com/invite/ByRwuEEgH4)

> **Lebih Suka Clone Secara Lokal?**

> Repositori ini termasuk lebih dari 50 terjemahan bahasa yang secara signifikan meningkatkan ukuran unduhan. Untuk clone tanpa terjemahan, gunakan sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ini memberi Anda semua yang Anda butuhkan untuk menyelesaikan kursus dengan unduhan yang jauh lebih cepat.


## Ikhtisar Kursus

Kuasai Azure Developer CLI (azd) melalui bab-bab terstruktur yang dirancang untuk pembelajaran bertahap. **Fokus khusus pada penerapan aplikasi AI dengan integrasi Microsoft Foundry.**

### Mengapa Kursus Ini Penting untuk Pengembang Modern

Berdasarkan wawasan komunitas Discord Microsoft Foundry, **45% pengembang ingin menggunakan AZD untuk beban kerja AI** namun mengalami tantangan dengan:
- Arsitektur AI multi-layanan yang kompleks
- Praktik terbaik penerapan AI produksi  
- Integrasi dan konfigurasi layanan AI Azure
- Optimasi biaya untuk beban kerja AI
- Pemecahan masalah isu penerapan AI khusus

### Tujuan Pembelajaran

Dengan menyelesaikan kursus terstruktur ini, Anda akan:
- **Menguasai Dasar-Dasar AZD**: Konsep inti, instalasi, dan konfigurasi
- **Menerapkan Aplikasi AI**: Gunakan AZD dengan layanan Microsoft Foundry
- **Implementasikan Infrastructure as Code**: Kelola sumber daya Azure dengan template Bicep
- **Memecahkan Masalah Deployment**: Selesaikan masalah umum dan debug masalah
- **Optimalkan untuk Produksi**: Keamanan, penskalaan, pemantauan, dan manajemen biaya
- **Bangun Solusi Multi-Agent**: Terapkan arsitektur AI yang kompleks

## Sebelum Anda Mulai: Akun, Akses, dan Asumsi

Sebelum Anda memulai Bab 1, pastikan Anda memiliki hal-hal berikut. Langkah instalasi di panduan ini mengasumsikan dasar-dasar tersebut sudah ditangani.

- **Langganan Azure**: Anda dapat menggunakan langganan yang sudah ada dari tempat kerja atau akun Anda sendiri, atau membuat [uji coba gratis](https://aka.ms/azurefreetrial) untuk memulai.
- **Izin untuk membuat sumber daya Azure**: Untuk sebagian besar latihan, Anda harus memiliki akses setidaknya sebagai **Contributor** pada langganan atau grup sumber daya target. Beberapa bab juga mengasumsikan Anda dapat membuat grup sumber daya, managed identities, dan penugasan RBAC.
- [**Akun GitHub**](https://github.com): Ini berguna untuk mem-fork repositori, melacak perubahan Anda sendiri, dan menggunakan GitHub Codespaces untuk workshop.
- **Prasyarat runtime template**: Beberapa template memerlukan alat lokal seperti Node.js, Python, Java, atau Docker. Jalankan validator setup sebelum memulai agar Anda dapat menangkap alat yang hilang lebih awal.
- **Familiaritas dasar terminal**: Anda tidak perlu menjadi ahli, tetapi Anda harus merasa nyaman menjalankan perintah seperti `git clone`, `azd auth login`, dan `azd up`.

> **Bekerja di langganan perusahaan?**
> Jika lingkungan Azure Anda dikelola oleh administrator, pastikan terlebih dahulu bahwa Anda dapat menerapkan sumber daya di langganan atau grup sumber daya yang Anda rencanakan gunakan. Jika tidak, minta langganan sandbox atau akses Contributor sebelum Anda mulai.

> **Baru menggunakan Azure?**
> Mulailah dengan langganan uji coba Azure atau pay-as-you-go Anda di https://aka.ms/azurefreetrial agar Anda dapat menyelesaikan latihan secara menyeluruh tanpa menunggu persetujuan tingkat tenant.

## 🗺️ Peta Kursus: Navigasi Cepat berdasarkan Bab

Setiap bab memiliki README khusus dengan tujuan pembelajaran, quick start, dan latihan:

| Bab | Topik | Pelajaran | Durasi | Kompleksitas |
|---------|-------|---------|----------|------------|
| **[Bab 1: Dasar](docs/chapter-01-foundation/README.md)** | Mulai | [Dasar AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalasi](docs/chapter-01-foundation/installation.md) &#124; [Proyek Pertama](docs/chapter-01-foundation/first-project.md) | 30-45 menit | ⭐ |
| **[Bab 2: Pengembangan AI](docs/chapter-02-ai-development/README.md)** | Aplikasi AI-First | [Integrasi Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agen AI](docs/chapter-02-ai-development/agents.md) &#124; [Deployment Model](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 jam | ⭐⭐ |
| **[Bab 3: Konfigurasi](docs/chapter-03-configuration/README.md)** | Auth & Keamanan | [Konfigurasi](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Keamanan](docs/chapter-03-configuration/authsecurity.md) | 45-60 menit | ⭐⭐ |
| **[Bab 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Panduan Deployment](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 jam | ⭐⭐⭐ |
| **[Bab 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Solusi Agen AI | [Skenario Retail](examples/retail-scenario.md) &#124; [Pola Koordinasi](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 jam | ⭐⭐⭐⭐ |
| **[Bab 6: Pra-Deployment](docs/chapter-06-pre-deployment/README.md)** | Perencanaan & Validasi | [Pemeriksaan Preflight](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Perencanaan Kapasitas](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Pemilihan SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 jam | ⭐⭐ |
| **[Bab 7: Pemecahan Masalah](docs/chapter-07-troubleshooting/README.md)** | Debug & Perbaikan | [Masalah Umum](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [Masalah AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 jam | ⭐⭐ |
| **[Bab 8: Produksi](docs/chapter-08-production/README.md)** | Pola Enterprise | [Praktik Produksi](docs/chapter-08-production/production-ai-practices.md) | 2-3 jam | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Lab Praktis | [Pengantar](workshop/docs/instructions/0-Introduction.md) &#124; [Pemilihan](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validasi](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Dekonstruksi](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurasi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Kustomisasi](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Pembongkaran](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Penutupan](workshop/docs/instructions/7-Wrap-up.md) | 3-4 jam | ⭐⭐ |

**Total Durasi Kursus:** ~10-14 jam | **Progresi Keterampilan:** Pemula → Siap Produksi

---

## 📚 Bab Pembelajaran

*Pilih jalur pembelajaran Anda berdasarkan tingkat pengalaman dan tujuan*

### 🚀 Bab 1: Dasar & Mulai Cepat
**Prasyarat**: Langganan Azure, pengetahuan dasar command line  
**Durasi**: 30-45 menit  
**Kompleksitas**: ⭐

#### Apa yang Akan Anda Pelajari
- Memahami dasar-dasar Azure Developer CLI
- Menginstal AZD di platform Anda
- Deployment pertama Anda yang berhasil

#### Sumber Belajar
- **🎯 Mulai Di sini**: [Apa itu Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teori**: [Dasar AZD](docs/chapter-01-foundation/azd-basics.md) - Konsep inti dan terminologi
- **⚙️ Setup**: [Instalasi & Setup](docs/chapter-01-foundation/installation.md) - Panduan khusus platform
- **🛠️ Praktik**: [Proyek Pertama Anda](docs/chapter-01-foundation/first-project.md) - Tutorial langkah demi langkah
- **📋 Referensi Cepat**: [Cheat Sheet Perintah](resources/cheat-sheet.md)

#### Latihan Praktis
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Hasil Bab**: Berhasil menyebarkan aplikasi web sederhana ke Azure menggunakan AZD

**✅ Validasi Keberhasilan:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Waktu yang Dihabiskan:** 30-45 menit  
**📈 Level Keterampilan Setelah:** Dapat menyebarkan aplikasi dasar secara mandiri
**📈 Level Keterampilan Setelah:** Dapat menyebarkan aplikasi dasar secara mandiri

---

### 🤖 Bab 2: Pengembangan AI-First (Direkomendasikan untuk Pengembang AI)
**Prasyarat**: Bab 1 selesai  
**Durasi**: 1-2 jam  
**Kompleksitas**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Integrasi Microsoft Foundry dengan AZD
- Menyebarkan aplikasi berbasis AI
- Memahami konfigurasi layanan AI

#### Sumber Belajar
- **🎯 Mulai Di sini**: [Integrasi Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agen AI**: [Panduan Agen AI](docs/chapter-02-ai-development/agents.md) - Menyebarkan agen cerdas dengan AZD
- **📖 Pola**: [Deployment Model AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Menyebarkan dan mengelola model AI
- **🛠️ Workshop**: [Lab Workshop AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Membuat solusi AI Anda siap AZD
- **🎥 Panduan Interaktif**: [Materi Workshop](workshop/README.md) - Pembelajaran berbasis browser dengan MkDocs * Lingkungan DevContainer
- **📋 Template**: [Template Microsoft Foundry](#featured-microsoft-foundry-templates)
- **📝 Contoh**: [Contoh Deployment AZD](examples/README.md)

#### Latihan Praktis
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Hasil Bab**: Menyebarkan dan mengonfigurasi aplikasi chat bertenaga AI dengan kemampuan RAG

**✅ Validasi Keberhasilan:**
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```

**📊 Waktu yang Dihabiskan:** 1-2 jam  
**📈 Level Keterampilan Setelah:** Dapat menyebarkan dan mengonfigurasi aplikasi AI siap produksi  
**💰 Kesadaran Biaya:** Pahami biaya pengembangan $80-150/bulan, biaya produksi $300-3500/bulan

#### 💰 Pertimbangan Biaya untuk Deployment AI

**Lingkungan Pengembangan (Perkiraan $80-150/bulan):**
- Model Microsoft Foundry (Pay-as-you-go): $0-50/bulan (berdasarkan penggunaan token)
- AI Search (tingkat Basic): $75/bulan
- Container Apps (Consumption): $0-20/bulan
- Storage (Standar): $1-5/bulan

**Lingkungan Produksi (Perkiraan $300-3,500+/bulan):**
- Model Microsoft Foundry (PTU untuk performa konsisten): $3,000+/bulan ATAU Pay-as-you-go dengan volume tinggi
- AI Search (tingkat Standard): $250/bulan
- Container Apps (Dedicated): $50-100/bulan
- Application Insights: $5-50/bulan
- Storage (Premium): $10-50/bulan

**💡 Tips Optimasi Biaya:**
- Gunakan **Free Tier** Model Microsoft Foundry untuk belajar (Azure OpenAI 50,000 token/bulan sudah termasuk)
- Jalankan `azd down` untuk menonaktifkan sumber daya saat tidak mengembangkan aktif
- Mulai dengan penagihan berbasis konsumsi, tingkatkan ke PTU hanya untuk produksi
- Gunakan `azd provision --preview` untuk memperkirakan biaya sebelum deployment
- Aktifkan auto-scaling: bayar hanya untuk penggunaan sebenarnya

**Pemantauan Biaya:**
```bash
# Check estimated monthly costs
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Bab 3: Konfigurasi & Otentikasi
**Prasyarat**: Bab 1 selesai  
**Durasi**: 45-60 menit  
**Kompleksitas**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Konfigurasi dan manajemen lingkungan
- Praktik terbaik otentikasi dan keamanan
- Penamaan dan organisasi sumber daya

#### Sumber Belajar
- **📖 Konfigurasi**: [Panduan Konfigurasi](docs/chapter-03-configuration/configuration.md) - Pengaturan lingkungan
- **🔐 Keamanan**: [Pola otentikasi dan managed identity](docs/chapter-03-configuration/authsecurity.md) - Pola otentikasi
- **📝 Contoh**: [Contoh Aplikasi Database](examples/database-app/README.md) - Contoh Database AZD

#### Latihan Praktis
- Konfigurasikan beberapa lingkungan (dev, staging, prod)
- Atur otentikasi managed identity
- Terapkan konfigurasi spesifik lingkungan

**💡 Hasil Bab**: Mengelola beberapa lingkungan dengan otentikasi dan keamanan yang tepat

---

### 🏗️ Bab 4: Infrastructure as Code & Deployment
**Prasyarat**: Bab 1-3 selesai  
**Durasi**: 1-1.5 jam  
**Kompleksitas**: ⭐⭐⭐

#### Apa yang Akan Anda Pelajari
- Pola deployment lanjutan
- Infrastructure as Code dengan Bicep
- Strategi provisioning sumber daya

#### Sumber Belajar
- **📖 Deployment**: [Panduan Deployment](docs/chapter-04-infrastructure/deployment-guide.md) - Alur kerja lengkap
- **🏗️ Provisioning**: [Provisioning Sumber Daya](docs/chapter-04-infrastructure/provisioning.md) - Manajemen sumber daya Azure
- **📝 Contoh**: [Contoh Aplikasi Container](../../examples/container-app) - Deployment containerized

#### Latihan Praktis
- Buat template Bicep kustom
- Deployment aplikasi multi-layanan
- Terapkan strategi deployment blue-green

**💡 Hasil Bab**: Menyebarkan aplikasi multi-layanan kompleks menggunakan template infrastruktur kustom

---

### 🎯 Bab 5: Solusi AI Multi-Agent (Lanjutan)
**Prasyarat**: Bab 1-2 selesai  
**Durasi**: 2-3 jam  
**Kompleksitas**: ⭐⭐⭐⭐

#### Apa yang Akan Anda Pelajari
- Pola arsitektur multi-agent
- Orkestrasi dan koordinasi agen
- Deployment AI siap produksi

#### Sumber Belajar
- **🤖 Proyek Unggulan**: [Solusi Multi-Agent Retail](examples/retail-scenario.md) - Implementasi lengkap
- **🛠️ Template ARM**: [Paket Template ARM](../../examples/retail-multiagent-arm-template) - Deployment sekali klik
- **📖 Arsitektur**: [Pola koordinasi multi-agent](docs/chapter-06-pre-deployment/coordination-patterns.md) - Pola

#### Latihan Praktis
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Hasil Bab**: Menyebarkan dan mengelola solusi AI multi-agent siap produksi dengan agen Customer dan Inventory

---

### 🔍 Bab 6: Validasi & Perencanaan Pra-Deployment
**Prasyarat**: Bab 4 selesai  
**Durasi**: 1 jam  
**Kompleksitas**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Perencanaan kapasitas dan validasi sumber daya
- Strategi pemilihan SKU
- Pemeriksaan pre-flight dan otomatisasi

#### Sumber Belajar
- **📊 Perencanaan**: [Perencanaan Kapasitas](docs/chapter-06-pre-deployment/capacity-planning.md) - Validasi sumber daya
- **💰 Seleksi**: [Seleksi SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Pilihan hemat biaya
- **✅ Validasi**: [Pemeriksaan Pra-penerbangan](docs/chapter-06-pre-deployment/preflight-checks.md) - Skrip otomatis

#### Latihan Praktis
- Jalankan skrip validasi kapasitas
- Optimalkan pilihan SKU untuk biaya
- Terapkan pemeriksaan otomatis sebelum penyebaran

**💡 Hasil Bab**: Validasi dan optimalkan penyebaran sebelum eksekusi

---

### 🚨 Bab 7: Pemecahan Masalah & Debugging
**Prasyarat**: Bab penyebaran manapun selesai  
**Durasi**: 1-1.5 jam  
**Kompleksitas**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Pendekatan sistematis debugging
- Masalah umum dan solusi
- Pemecahan masalah khusus AI

#### Sumber Belajar
- **🔧 Masalah Umum**: [Masalah Umum](docs/chapter-07-troubleshooting/common-issues.md) - FAQ dan solusi
- **🕵️ Debugging**: [Panduan Debugging](docs/chapter-07-troubleshooting/debugging.md) - Strategi langkah demi langkah
- **🤖 Masalah AI**: [Pemecahan Masalah Khusus AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Masalah layanan AI

#### Latihan Praktis
- Diagnosa kegagalan penyebaran
- Selesaikan masalah autentikasi
- Debug konektivitas layanan AI

**💡 Hasil Bab**: Diagnosa mandiri dan selesaikan masalah penyebaran umum

---

### 🏢 Bab 8: Pola Produksi & Perusahaan
**Prasyarat**: Bab 1-4 selesai  
**Durasi**: 2-3 jam  
**Kompleksitas**: ⭐⭐⭐⭐

#### Apa yang Akan Anda Pelajari
- Strategi penyebaran produksi
- Pola keamanan perusahaan
- Pemantauan dan optimasi biaya

#### Sumber Belajar
- **🏭 Produksi**: [Praktik Terbaik AI Produksi](docs/chapter-08-production/production-ai-practices.md) - Pola perusahaan
- **📝 Contoh**: [Contoh Microservices](../../examples/microservices) - Arsitektur kompleks
- **📊 Pemantauan**: [Integrasi Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Pemantauan

#### Latihan Praktis
- Terapkan pola keamanan perusahaan
- Atur pemantauan komprehensif
- Sebarkan ke produksi dengan tata kelola yang tepat

**💡 Hasil Bab**: Sebarkan aplikasi siap perusahaan dengan kemampuan produksi penuh

---

## 🎓 Ikhtisar Workshop: Pengalaman Belajar Praktis

> **⚠️ STATUS WORKSHOP: Pengembangan Aktif**  
> Materi workshop saat ini sedang dikembangkan dan disempurnakan. Modul inti sudah berfungsi, namun beberapa bagian lanjutan belum lengkap. Kami aktif bekerja untuk menyelesaikan seluruh konten. [Lacak kemajuan →](workshop/README.md)

### Materi Workshop Interaktif
**Pembelajaran praktis menyeluruh dengan alat berbasis browser dan latihan terpandu**

Materi workshop kami menyediakan pengalaman belajar terstruktur dan interaktif yang melengkapi kurikulum berbasis bab di atas. Workshop ini dirancang untuk pembelajaran mandiri maupun sesi dipandu instruktur.

#### 🛠️ Fitur Workshop
- **Antarmuka Berbasis Browser**: Workshop lengkap dengan MkDocs yang dilengkapi fitur pencarian, salin, dan tema
- **Integrasi GitHub Codespaces**: Penyiapan lingkungan pengembangan dengan satu klik
- **Jalur Pembelajaran Terstruktur**: Latihan terpandu 8 modul (total 3-4 jam)
- **Metodologi Progresif**: Pengenalan → Seleksi → Validasi → Dekonstruksi → Konfigurasi → Kustomisasi → Pembongkaran → Penutup
- **Lingkungan DevContainer Interaktif**: Alat dan dependensi telah dikonfigurasi sebelumnya

#### 📚 Struktur Modul Workshop
Workshop mengikuti **metodologi progresif 8 modul** yang membawa Anda dari penemuan hingga penguasaan penyebaran:

| Modul | Topik | Apa yang Akan Anda Lakukan | Durasi |
|--------|-------|----------------|----------|
| **0. Pengenalan** | Ikhtisar Workshop | Pahami tujuan belajar, prasyarat, dan struktur workshop | 15 menit |
| **1. Seleksi** | Penemuan Template | Jelajahi template AZD dan pilih template AI yang tepat untuk skenario Anda | 20 menit |
| **2. Validasi** | Penyebaran & Verifikasi | Sebarkan template dengan `azd up` dan validasi infrastruktur bekerja | 30 menit |
| **3. Dekonstruksi** | Pahami Struktur | Gunakan GitHub Copilot untuk menjelajahi arsitektur template, file Bicep, dan organisasi kode | 30 menit |
| **4. Konfigurasi** | Pendalaman azure.yaml | Kuasai konfigurasi `azure.yaml`, lifecycle hooks, dan variabel lingkungan | 30 menit |
| **5. Kustomisasi** | Jadikan Milik Anda | Aktifkan Pencarian AI, pelacakan, evaluasi, dan kustomisasi untuk skenario Anda | 45 menit |
| **6. Pembongkaran** | Bersihkan | Lepaskan sumber daya dengan aman menggunakan `azd down --purge` | 15 menit |
| **7. Penutup** | Langkah Selanjutnya | Tinjau capaian, konsep utama, dan lanjutkan perjalanan belajar Anda | 15 menit |

**Alur Workshop:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Memulai Workshop
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Hasil Belajar Workshop
Dengan menyelesaikan workshop, peserta akan:
- **Menyebarkan Aplikasi AI Produksi**: Gunakan AZD dengan layanan Microsoft Foundry
- **Menguasai Arsitektur Multi-Agen**: Terapkan solusi agen AI terkoordinasi
- **Menerapkan Praktik Keamanan Terbaik**: Konfigurasikan autentikasi dan kontrol akses
- **Mengoptimalkan untuk Skala**: Rancang penyebaran hemat biaya dan berkinerja tinggi
- **Memecahkan Masalah Penyebaran**: Selesaikan masalah umum secara mandiri

#### 📖 Sumber Belajar Workshop
- **🎥 Panduan Interaktif**: [Materi Workshop](workshop/README.md) - Lingkungan belajar berbasis browser
- **📋 Petunjuk Per Modul**:
  - [0. Pengenalan](workshop/docs/instructions/0-Introduction.md) - Ikhtisar dan tujuan workshop
  - [1. Seleksi](workshop/docs/instructions/1-Select-AI-Template.md) - Temukan dan pilih template AI
  - [2. Validasi](workshop/docs/instructions/2-Validate-AI-Template.md) - Sebarkan dan verifikasi template
  - [3. Dekonstruksi](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Jelajahi arsitektur template
  - [4. Konfigurasi](workshop/docs/instructions/4-Configure-AI-Template.md) - Kuasai azure.yaml
  - [5. Kustomisasi](workshop/docs/instructions/5-Customize-AI-Template.md) - Kustomisasi untuk skenario Anda
  - [6. Pembongkaran](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Bersihkan sumber daya
  - [7. Penutup](workshop/docs/instructions/7-Wrap-up.md) - Tinjau dan langkah selanjutnya
- **🛠️ Lab Workshop AI**: [Lab Workshop AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Latihan berfokus AI
- **💡 Mulai Cepat**: [Panduan Setup Workshop](workshop/README.md#quick-start) - Konfigurasi lingkungan

**Sangat cocok untuk**: Pelatihan korporat, kursus universitas, pembelajaran mandiri, dan bootcamp pengembang.

---

## 📖 Pendalaman: Kemampuan AZD

Selain dasar-dasar, AZD menyediakan fitur kuat untuk penyebaran produksi:

- **Penyebaran Berbasis Template** - Gunakan template pra-bangun untuk pola aplikasi umum
- **Infrastruktur sebagai Kode** - Kelola sumber daya Azure menggunakan Bicep atau Terraform  
- **Alur Kerja Terintegrasi** - Provisi, sebar, dan pantau aplikasi secara mulus
- **Ramah Pengembang** - Dioptimalkan untuk produktivitas dan pengalaman pengembang

### **AZD + Microsoft Foundry: Sempurna untuk Penyebaran AI**

**Mengapa AZD untuk Solusi AI?** AZD menangani tantangan utama yang dihadapi pengembang AI:

- **Template Siap AI** - Template pra-konfigurasi untuk Microsoft Foundry Models, Azure AI Services, dan beban kerja ML
- **Penyebaran AI Aman** - Pola keamanan bawaan untuk layanan AI, kunci API, dan endpoint model  
- **Pola AI Produksi** - Praktik terbaik untuk penyebaran aplikasi AI yang skalabel dan hemat biaya
- **Alur Kerja AI End-to-End** - Dari pengembangan model hingga penyebaran produksi dengan pemantauan tepat
- **Optimasi Biaya** - Alokasi sumber daya dan strategi penskalaan cerdas untuk beban kerja AI
- **Integrasi Microsoft Foundry** - Koneksi mulus ke katalog model dan endpoint Microsoft Foundry

---

## 🎯 Perpustakaan Template & Contoh

### Unggulan: Template Microsoft Foundry
**Mulai di sini jika Anda menyebarkan aplikasi AI!**

> **Catatan:** Template ini menunjukkan berbagai pola AI. Beberapa adalah Azure Samples eksternal, lainnya implementasi lokal.

| Template | Bab | Kompleksitas | Layanan | Tipe |
|----------|---------|------------|----------|------|
| [**Mulai dengan chat AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bab 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Eksternal |
| [**Mulai dengan agen AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Bab 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Eksternal |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bab 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Eksternal |
| [**Mulai cepat OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bab 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Eksternal |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bab 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Eksternal |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Bab 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Eksternal |
| [**Solusi Multi-Agen Retail**](examples/retail-scenario.md) | Bab 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Unggulan: Skenario Pembelajaran Lengkap
**Template aplikasi siap produksi yang dipetakan ke bab pembelajaran**

| Template | Bab Pembelajaran | Kompleksitas | Pembelajaran Kunci |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bab 2 | ⭐ | Pola penyebaran AI dasar |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bab 2 | ⭐⭐ | Implementasi RAG dengan Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Bab 4 | ⭐⭐ | Integrasi Kecerdasan Dokumen |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bab 5 | ⭐⭐⭐ | Kerangka agen dan pemanggilan fungsi |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Bab 8 | ⭐⭐⭐ | Orkestrasi AI perusahaan |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Bab 5 | ⭐⭐⭐⭐ | Arsitektur multi-agen dengan agen Pelanggan dan Inventaris |

### Pembelajaran Berdasarkan Jenis Contoh

> **📌 Contoh Lokal vs. Eksternal:**  
> **Contoh Lokal** (di repo ini) = Siap digunakan segera  
> **Contoh Eksternal** (Azure Samples) = Clone dari repositori terkait

#### Contoh Lokal (Siap Pakai)
- [**Solusi Multi-Agen Retail**](examples/retail-scenario.md) - Implementasi siap produksi lengkap dengan template ARM
  - Arsitektur multi-agen (agen Pelanggan + Agen Inventaris)
  - Pemantauan dan evaluasi komprehensif
  - Penyebaran satu klik melalui template ARM

#### Contoh Lokal - Aplikasi Kontainer (Bab 2-5)
**Contoh penyebaran kontainer lengkap dalam repositori ini:**
- [**Contoh Aplikasi Kontainer**](examples/container-app/README.md) - Panduan lengkap penyebaran terkontainerisasi
  - [API Flask Sederhana](../../examples/container-app/simple-flask-api) - REST API dasar dengan scale-to-zero
  - [Arsitektur Microservices](../../examples/container-app/microservices) - Penyebaran multi-service siap produksi
  - Pola penyebaran Mulai Cepat, Produksi, dan Lanjutan
  - Panduan pemantauan, keamanan, dan optimasi biaya

#### Contoh Eksternal - Aplikasi Sederhana (Bab 1-2)
**Clone repositori Azure Samples ini untuk memulai:**
- [Aplikasi Web Sederhana - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pola penyebaran dasar
- [Website Statis - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Penyebaran konten statis
- [Aplikasi Kontainer - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Penyebaran REST API

#### Contoh Eksternal - Integrasi Database (Bab 3-4)  
- [Aplikasi Database - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Pola konektivitas database
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Alur kerja data tanpa server

#### Contoh Eksternal - Pola Lanjutan (Bab 4-8)
- [Microservices Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arsitektur multi-service
- [Jobs Aplikasi Kontainer](https://github.com/Azure-Samples/container-apps-jobs) - Pemrosesan latar belakang  
- [Pipeline ML Perusahaan](https://github.com/Azure-Samples/mlops-v2) - Pola ML siap produksi

### Koleksi Template Eksternal
- [**Galeri Template Resmi AZD**](https://azure.github.io/awesome-azd/) - Kumpulan template resmi dan komunitas terkurasi
- [**Template Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasi template Microsoft Learn
- [**Direktori Contoh**](examples/README.md) - Contoh belajar lokal dengan penjelasan rinci

---

## 📚 Sumber Belajar & Referensi

### Referensi Cepat
- [**Daftar Perintah Singkat**](resources/cheat-sheet.md) - Perintah azd penting yang diatur berdasarkan bab
- [**Glosarium**](resources/glossary.md) - Terminologi Azure dan azd  
- [**FAQ**](resources/faq.md) - Pertanyaan umum yang diatur berdasarkan bab pembelajaran
- [**Panduan Studi**](resources/study-guide.md) - Latihan praktik yang komprehensif

### Lokakarya Praktis
- [**Laboratorium Lokakarya AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Buat solusi AI Anda dapat dideploy dengan AZD (2-3 jam)
- [**Lokakarya Interaktif**](workshop/README.md) - Latihan panduan 8 modul dengan MkDocs dan GitHub Codespaces
  - Urutan: Pengenalan → Seleksi → Validasi → Dekonstruksi → Konfigurasi → Kustomisasi → Pembongkaran → Penutup

### Sumber Pembelajaran Eksternal
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pusat Arsitektur Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulator Harga Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status Azure](https://status.azure.com/)

### Keterampilan AI Agent untuk Editor Anda
- [**Keterampilan Microsoft Azure di skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 keterampilan agent terbuka untuk AI Azure, Foundry, deployment, diagnostik, optimisasi biaya, dan lainnya. Instal di GitHub Copilot, Cursor, Claude Code, atau agent yang didukung:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Panduan Pemecahan Masalah Cepat

**Masalah umum yang sering dihadapi pemula dan solusi segera:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" atau "Subscription not set"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" atau "Quota exceeded"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" gagal di tengah jalan</strong></summary>

```bash
# Option 1: Clean and retry
azd down --force --purge
azd up

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" atau "Token expired"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" atau konflik penamaan</strong></summary>

```bash
# AZD generates unique names, but if conflict:
azd down --force --purge

# Then retry with fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Deployment template memakan waktu terlalu lama</strong></summary>

**Waktu tunggu normal:**
- Aplikasi web sederhana: 5-10 menit
- Aplikasi dengan database: 10-15 menit
- Aplikasi AI: 15-25 menit (Provisioning OpenAI lambat)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Permission denied" atau "Forbidden"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ Tidak dapat menemukan URL aplikasi yang telah dideploy</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 Sumber Pemecahan Masalah Lengkap

- **Panduan Masalah Umum:** [Solusi Terperinci](docs/chapter-07-troubleshooting/common-issues.md)
- **Masalah Khusus AI:** [Pemecahan Masalah AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Panduan Debugging:** [Langkah demi Langkah Debugging](docs/chapter-07-troubleshooting/debugging.md)
- **Dapatkan Bantuan:** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Penyelesaian Kursus & Sertifikasi

### Pelacakan Kemajuan
Lacak kemajuan belajar Anda melalui setiap bab:

- [ ] **Bab 1**: Dasar & Mulai Cepat ✅
- [ ] **Bab 2**: Pengembangan Berbasis AI ✅  
- [ ] **Bab 3**: Konfigurasi & Autentikasi ✅
- [ ] **Bab 4**: Infrastruktur sebagai Kode & Deployment ✅
- [ ] **Bab 5**: Solusi AI Multi-Agent ✅
- [ ] **Bab 6**: Validasi & Perencanaan Pra-Deployment ✅
- [ ] **Bab 7**: Pemecahan Masalah & Debugging ✅
- [ ] **Bab 8**: Pola Produksi & Perusahaan ✅

### Verifikasi Pembelajaran
Setelah menyelesaikan masing-masing bab, verifikasi pengetahuan Anda dengan:
1. **Latihan Praktis**: Selesaikan deployment praktis di bab tersebut
2. **Pemeriksaan Pengetahuan**: Tinjau bagian FAQ untuk bab Anda
3. **Diskusi Komunitas**: Bagikan pengalaman Anda di Azure Discord
4. **Bab Selanjutnya**: Lanjut ke tingkat kompleksitas berikutnya

### Manfaat Penyelesaian Kursus
Setelah menyelesaikan semua bab, Anda akan memperoleh:
- **Pengalaman Produksi**: Meluncurkan aplikasi AI nyata ke Azure
- **Keahlian Profesional**: Kemampuan deployment siap perusahaan  
- **Pengakuan Komunitas**: Anggota aktif komunitas pengembang Azure
- **Kemajuan Karir**: Keahlian AZD dan deployment AI yang diminati

---

## 🤝 Komunitas & Dukungan

### Dapatkan Bantuan & Dukungan
- **Masalah Teknis**: [Laporkan bug dan minta fitur](https://github.com/microsoft/azd-for-beginners/issues)
- **Pertanyaan Pembelajaran**: [Komunitas Discord Microsoft Azure](https://discord.gg/microsoft-azure) dan [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Bantuan Khusus AI**: Bergabung dengan [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasi**: [Dokumentasi resmi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Wawasan Komunitas dari Microsoft Foundry Discord

**Hasil Polling Terbaru dari Saluran #Azure:**
- **45%** pengembang ingin menggunakan AZD untuk beban kerja AI
- **Tantangan utama**: Deployment multi-layanan, manajemen kredensial, kesiapan produksi  
- **Permintaan terbanyak**: Template khusus AI, panduan pemecahan masalah, praktik terbaik

**Bergabunglah dengan komunitas kami untuk:**
- Berbagi pengalaman AZD + AI Anda dan dapatkan bantuan
- Mengakses preview awal template AI baru
- Berkontribusi pada praktik terbaik deployment AI
- Mempengaruhi pengembangan fitur AI + AZD masa depan

### Kontribusi untuk Kursus
Kami menyambut kontribusi! Silakan baca [Panduan Kontribusi](CONTRIBUTING.md) untuk detail tentang:
- **Peningkatan Konten**: Memperbaiki bab dan contoh yang ada
- **Contoh Baru**: Tambahkan skenario dan template dunia nyata  
- **Penerjemahan**: Bantu mempertahankan dukungan multi-bahasa
- **Laporan Bug**: Tingkatkan akurasi dan kejelasan
- **Standar Komunitas**: Ikuti pedoman komunitas inklusif kami

---

## 📄 Informasi Kursus

### Lisensi
Proyek ini dilisensikan di bawah Lisensi MIT - lihat berkas [LICENSE](../../LICENSE) untuk detail.

### Sumber Pembelajaran Terkait Microsoft

Tim kami memproduksi kursus pembelajaran komprehensif lainnya:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j untuk Pemula](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js untuk Pemula](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain untuk Pemula](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD untuk Pemula](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI untuk Pemula](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP untuk Pemula](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents untuk Pemula](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Seri Generative AI
[![Generative AI untuk Pemula](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Pembelajaran Inti
[![ML untuk Pemula](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science untuk Pemula](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI untuk Pemula](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Keamanan Siber untuk Pemula](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Pengembangan Web untuk Pemula](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT untuk Pemula](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Pengembangan XR untuk Pemula](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Seri Copilot
[![Copilot untuk AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot untuk C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Petualangan Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigasi Kursus

**🚀 Siap Memulai Belajar?**

**Pemula**: Mulai dengan [Bab 1: Dasar & Mulai Cepat](#-chapter-1-foundation--quick-start)  
**Pengembang AI**: Lompat ke [Bab 2: Pengembangan Berbasis AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Pengembang Berpengalaman**: Mulailah dengan [Bab 3: Konfigurasi & Autentikasi](#️-chapter-3-configuration--authentication)

**Langkah Selanjutnya**: [Mulai Bab 1 - Dasar AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->