# AZD Untuk Pemula: Perjalanan Pembelajaran Terstruktur

![AZD untuk Pemula](../../translated_images/id/azdbeginners.5527441dd9f74068.webp) 

[![Pemantau GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Fork GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Bintang GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Terjemahan Otomatis (Selalu Terbaru)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](./README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Lebih Suka Mengkloning Secara Lokal?**
>
> Repository ini mencakup 50+ terjemahan bahasa yang secara signifikan meningkatkan ukuran unduhan. Untuk mengkloning tanpa terjemahan, gunakan sparse checkout:
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

> 📌 Kursus ini divalidasi terhadap **`azd 1.25.6`** (Juni 2026). Jalankan `azd version` untuk memeriksa build Anda, dan `azd upgrade` untuk mendapatkan versi terbaru.

Azure Developer CLI telah berkembang melampaui aplikasi web dan API tradisional. Saat ini, azd adalah alat tunggal untuk menerapkan **aplikasi apa pun** ke Azure—termasuk aplikasi bertenaga AI dan agen cerdas.

Berikut arti perubahan ini bagi Anda:

- **Agen AI sekarang menjadi beban kerja azd kelas utama.** Anda dapat menginisialisasi, menerapkan, dan mengelola proyek agen AI menggunakan alur kerja `azd init` → `azd up` yang sudah Anda kenal.
- **Siklus hidup agen lengkap dari CLI.** Ekstensi `azure.ai.agents` sekarang mencakup keseluruhan perjalanan—`azd ai agent init` untuk membuat kerangka, `azd ai agent invoke` untuk pengujian (dengan keluaran waktu-respons), `azd ai agent eval generate` dan `azd ai agent optimize` untuk mengukur dan meningkatkan kualitas, serta `azd ai agent delete` untuk membersihkan.
- **Lebih banyak blok bangunan AI.** Ekstensi preview baru—`azure.ai.skills` dan `azure.ai.connections`—memungkinkan Anda mengelola keterampilan agen yang dapat digunakan ulang dan koneksi Foundry langsung dengan azd.
- **Integrasi Microsoft Foundry** membawa penerapan model, hosting agen, dan konfigurasi layanan AI langsung ke dalam ekosistem template azd.
- **Dasar-dasar harian yang lebih mulus.** Rilis terbaru membuat `azd init` idempoten (aman untuk dijalankan ulang), membuat `azd auth login` menghapus token kadaluwarsa secara otomatis, dan menambahkan prompt pengaturan pertama-kali yang ramah untuk `azd tool`.
- **Alur kerja inti tidak berubah.** Baik Anda menerapkan aplikasi todo, mikroservis, atau solusi AI multi-agen, perintahnya tetap sama.

> **Catatan untuk pengguna Aspire:** Microsoft sekarang merujuk produk ini cukup sebagai **Aspire** (sebelumnya ".NET Aspire"). Dukungan azd untuk Aspire tidak berubah—hanya namanya yang diperbarui.

Jika Anda pernah menggunakan azd sebelumnya, dukungan AI adalah perpanjangan alami—bukan alat terpisah atau jalur lanjutan. Jika Anda memulai dari awal, Anda akan mempelajari satu alur kerja yang bekerja untuk segala sesuatu.

---

## 🚀 Apa itu Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** adalah alat baris perintah yang ramah-pengembang yang memudahkan penerapan aplikasi ke Azure. Alih-alih membuat dan menghubungkan puluhan sumber daya Azure secara manual, Anda dapat menerapkan seluruh aplikasi dengan satu perintah.

### Keajaiban `azd up`

```bash
# Perintah tunggal ini melakukan semuanya:
# ✅ Membuat semua sumber daya Azure
# ✅ Mengonfigurasi jaringan dan keamanan
# ✅ Membangun kode aplikasi Anda
# ✅ Men-deploy ke Azure
# ✅ Memberikan Anda URL yang berfungsi
azd up
```

**Itu saja!** Tidak perlu mengklik Portal Azure, tidak perlu mempelajari template ARM yang kompleks terlebih dahulu, tidak perlu konfigurasi manual - hanya aplikasi yang berjalan di Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Apa Bedanya?

Ini adalah pertanyaan paling umum yang diajukan pemula. Berikut jawaban singkatnya:

| Fitur | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Tujuan** | Mengelola sumber daya Azure individu | Menerapkan aplikasi lengkap |
| **Pendekatan** | Berfokus pada infrastruktur | Berfokus pada aplikasi |
| **Contoh** | `az webapp create --name myapp...` | `azd up` |
| **Kurva Pembelajaran** | Perlu mengetahui layanan Azure | Cukup mengetahui aplikasi Anda |
| **Cocok Untuk** | DevOps, Infrastruktur | Pengembang, Pembuatan prototipe |

### Analogi Sederhana

- **Azure CLI** seperti memiliki semua alat untuk membangun sebuah rumah - palu, gergaji, paku. Anda bisa membangun apa saja, tetapi Anda perlu tahu konstruksi.
- **Azure Developer CLI** seperti menyewa kontraktor - Anda menjelaskan apa yang Anda inginkan, dan mereka menangani pembangunannya.

### Kapan Menggunakan Masing-Masing

| Skenario | Gunakan Ini |
|----------|----------|
| "Saya ingin menerapkan aplikasi web saya dengan cepat" | `azd up` |
| "Saya perlu membuat hanya sebuah akun penyimpanan" | `az storage account create` |
| "Saya sedang membangun aplikasi AI lengkap" | `azd init --template azure-search-openai-demo` |
| "Saya perlu men-debug sumber daya Azure tertentu" | `az resource show` |
| "Saya ingin penerapan siap-produksi dalam hitungan menit" | `azd up --environment production` |

### Mereka Bekerja Bersama!

AZD menggunakan Azure CLI di balik layar. Anda bisa menggunakan keduanya:
```bash
# Deploy aplikasi Anda dengan AZD
azd up

# Kemudian sesuaikan sumber daya tertentu dengan Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Temukan Template di Awesome AZD

Jangan mulai dari nol! **Awesome AZD** adalah kumpulan komunitas dari template siap-terapkan:

| Sumber Daya | Deskripsi |
|----------|-------------|
| 🔗 [**Galeri Awesome AZD**](https://azure.github.io/awesome-azd/) | Telusuri 200+ template dengan deploy satu-klik |
| 🔗 [**Ajukan Template**](https://github.com/Azure/awesome-azd/issues) | Kontribusikan template Anda ke komunitas |
| 🔗 [**Repositori GitHub**](https://github.com/Azure/awesome-azd) | Beri bintang dan jelajahi sumbernya |

### Template AI Populer dari Awesome AZD

```bash
# Obrolan RAG dengan Model Microsoft Foundry + Pencarian AI
azd init --template azure-search-openai-demo

# Aplikasi Obrolan AI Cepat
azd init --template openai-chat-app-quickstart

# Agen AI dengan Agen Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Memulai dalam 3 Langkah

Sebelum Anda mulai, pastikan mesin Anda siap untuk template yang ingin Anda terapkan:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jika ada pemeriksaan yang diperlukan gagal, perbaiki itu terlebih dahulu lalu lanjutkan dengan panduan cepat.

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
# Opsional jika Anda berencana menggunakan perintah Azure CLI langsung dalam kursus ini
az login

# Diperlukan untuk alur kerja AZD
azd auth login
```

Jika Anda tidak yakin mana yang Anda butuhkan, ikuti alur pengaturan penuh di [Instalasi & Pengaturan](docs/chapter-01-foundation/installation.md#authentication-setup).

### Langkah 3: Terapkan Aplikasi Pertama Anda

```bash
# Inisialisasi dari sebuah template
azd init --template todo-nodejs-mongo

# Deploy ke Azure (membuat semuanya!)
azd up
```

**🎉 Itu dia!** Aplikasi Anda sekarang aktif di Azure.

### Bersihkan (Jangan Lupa!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cara Menggunakan Kursus Ini

Kursus ini dirancang untuk **pembelajaran bertahap** - mulai dari tempat Anda merasa nyaman dan naikkan secara bertahap:

| Pengalaman Anda | Mulai Di Sini |
|-----------------|------------|
| **Baru dengan Azure** | [Bab 1: Dasar](#-chapter-1-foundation--quick-start) |
| **Tahu Azure, baru dengan AZD** | [Bab 1: Dasar](#-chapter-1-foundation--quick-start) |
| **Ingin menerapkan aplikasi AI** | [Bab 2: Pengembangan Berfokus AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Ingin praktik langsung** | [🎓 Lokakarya Interaktif](workshop/README.md) - lab terpandu 3-4 jam |
| **Butuh pola produksi** | [Bab 8: Produksi & Perusahaan](#-chapter-8-production--enterprise-patterns) |

### Pengaturan Cepat

1. **Fork Repositori Ini**: [![Fork GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Kloning Repositori**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Dapatkan Bantuan**: [Komunitas Discord Azure](https://discord.com/invite/ByRwuEEgH4)

> **Lebih Suka Mengkloning Secara Lokal?**

> Repository ini mencakup 50+ terjemahan bahasa yang secara signifikan meningkatkan ukuran unduhan. Untuk mengkloning tanpa terjemahan, gunakan sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ini memberi Anda semua yang Anda butuhkan untuk menyelesaikan kursus dengan unduhan yang jauh lebih cepat.


## Ikhtisar Kursus

Kuasi Azure Developer CLI (azd) melalui bab-bab terstruktur yang dirancang untuk pembelajaran bertahap. **Fokus khusus pada penerapan aplikasi AI dengan integrasi Microsoft Foundry.**
### Mengapa Kursus Ini Penting bagi Pengembang Modern

Berdasarkan wawasan komunitas Microsoft Foundry Discord, **45% pengembang ingin menggunakan AZD untuk beban kerja AI** tetapi menghadapi tantangan dengan:
- Arsitektur AI multi-layanan yang kompleks
- Praktik terbaik penerapan AI ke produksi  
- Integrasi dan konfigurasi layanan Azure AI
- Optimisasi biaya untuk beban kerja AI
- Pemecahan masalah khusus penerapan AI

### Tujuan Pembelajaran

Dengan menyelesaikan kursus terstruktur ini, Anda akan:
- **Menguasai Dasar AZD**: Konsep inti, instalasi, dan konfigurasi
- **Menerapkan Aplikasi AI**: Menggunakan AZD dengan layanan Microsoft Foundry
- **Mengimplementasikan Infrastructure as Code**: Mengelola sumber daya Azure dengan template Bicep
- **Memecahkan Masalah Penerapan**: Menyelesaikan masalah umum dan melakukan debug
- **Mengoptimalkan untuk Produksi**: Keamanan, penskalaan, pemantauan, dan manajemen biaya
- **Membangun Solusi Multi-Agen**: Menerapkan arsitektur AI yang kompleks

## Sebelum Anda Mulai: Akun, Akses, dan Asumsi

Sebelum Anda memulai Bab 1, pastikan Anda memiliki hal-hal berikut. Langkah instalasi di panduan ini mengasumsikan dasar-dasar ini sudah ditangani.

- **Langganan Azure**: Anda dapat menggunakan langganan yang ada dari tempat kerja atau akun pribadi Anda, atau membuat [free trial](https://aka.ms/azurefreetrial) untuk memulai.
- **Izin untuk membuat sumber daya Azure**: Untuk sebagian besar latihan, Anda harus memiliki setidaknya akses **Contributor** pada langganan atau grup sumber daya target. Beberapa bab juga mungkin mengasumsikan Anda dapat membuat grup sumber daya, managed identities, dan penugasan RBAC.
- [**Akun GitHub**](https://github.com): Ini berguna untuk mem-fork repositori, melacak perubahan Anda sendiri, dan menggunakan GitHub Codespaces untuk lokakarya.
- **Prasyarat runtime template**: Beberapa template memerlukan alat lokal seperti Node.js, Python, Java, atau Docker. Jalankan validator pengaturan sebelum memulai agar Anda menemukan alat yang hilang lebih awal.
- **Keterbiasaan dasar dengan terminal**: Anda tidak perlu menjadi ahli, tetapi Anda harus nyaman menjalankan perintah seperti `git clone`, `azd auth login`, dan `azd up`.

> **Bekerja di langganan perusahaan?**
> Jika lingkungan Azure Anda dikelola oleh administrator, konfirmasikan sebelumnya bahwa Anda dapat menerapkan sumber daya di langganan atau grup sumber daya yang Anda rencanakan gunakan. Jika tidak, minta langganan sandbox atau akses Contributor sebelum Anda mulai.

> **Baru di Azure?**
> Mulailah dengan trial Azure Anda sendiri atau langganan pay-as-you-go di https://aka.ms/azurefreetrial sehingga Anda dapat menyelesaikan latihan dari awal hingga akhir tanpa menunggu persetujuan tingkat tenant.

## 🗺️ Peta Kursus: Navigasi Cepat per Bab

Setiap bab memiliki README khusus dengan tujuan pembelajaran, panduan cepat, dan latihan:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Bab 1: Dasar](docs/chapter-01-foundation/README.md)** | Memulai | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Bab 2: Pengembangan AI](docs/chapter-02-ai-development/README.md)** | Aplikasi Berfokus AI | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Bab 3: Konfigurasi](docs/chapter-03-configuration/README.md)** | Auth & Keamanan | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Bab 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Penerapan | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Bab 5: Multi-Agen](docs/chapter-05-multi-agent/README.md)** | Solusi Agen AI | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Bab 6: Pra-Penerapan](docs/chapter-06-pre-deployment/README.md)** | Perencanaan & Validasi | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Bab 7: Pemecahan Masalah](docs/chapter-07-troubleshooting/README.md)** | Debug & Perbaikan | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Bab 8: Produksi](docs/chapter-08-production/README.md)** | Pola Enterprise | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Lab Praktik | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Total Durasi Kursus:** ~10-14 jam | **Perkembangan Keterampilan:** Pemula → Siap Produksi

---

## 📚 Bab Pembelajaran

*Pilih jalur pembelajaran Anda berdasarkan tingkat pengalaman dan tujuan*

### 🚀 Bab 1: Dasar & Quick Start
**Prasyarat**: langganan Azure, pengetahuan dasar baris perintah  
**Durasi**: 30-45 menit  
**Kompleksitas**: ⭐

#### Apa yang Akan Anda Pelajari
- Memahami dasar Azure Developer CLI
- Menginstal AZD di platform Anda
- Penyebaran pertama Anda yang sukses

#### Sumber Pembelajaran
- **🎯 Mulai di Sini**: [Apa itu Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teori**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Konsep inti dan terminologi
- **⚙️ Pengaturan**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - Panduan spesifik platform
- **🛠️ Praktik**: [Your First Project](docs/chapter-01-foundation/first-project.md) - Tutorial langkah demi langkah
- **📋 Referensi Cepat**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Latihan Praktis
```bash
# Pemeriksaan instalasi cepat
azd version

# Terapkan aplikasi pertama Anda
azd init --template todo-nodejs-mongo
azd up
```

**💡 Hasil Bab**: Berhasil menerapkan aplikasi web sederhana ke Azure menggunakan AZD

**✅ Validasi Keberhasilan:**
```bash
# Setelah menyelesaikan Bab 1, Anda seharusnya dapat:
azd version              # Menampilkan versi yang terpasang
azd init --template todo-nodejs-mongo  # Menginisialisasi proyek
azd up                  # Menerapkan ke Azure
azd show                # Menampilkan URL aplikasi yang sedang berjalan
# Aplikasi terbuka di peramban dan berfungsi
azd down --force --purge  # Membersihkan sumber daya
```

**📊 Waktu yang Dibutuhkan:** 30-45 menit  
**📈 Tingkat Keterampilan Setelah:** Dapat menerapkan aplikasi dasar secara mandiri
**📈 Tingkat Keterampilan Setelah:** Dapat menerapkan aplikasi dasar secara mandiri

---

### 🤖 Bab 2: Pengembangan Berfokus AI (Direkomendasikan untuk Pengembang AI)
**Prasyarat**: Bab 1 selesai  
**Durasi**: 1-2 jam  
**Kompleksitas**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Integrasi Microsoft Foundry dengan AZD
- Menerapkan aplikasi bertenaga AI
- Memahami konfigurasi layanan AI

#### Sumber Pembelajaran
- **🎯 Mulai di Sini**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agen AI**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - Menerapkan agen cerdas dengan AZD
- **📖 Pola**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - Menerapkan dan mengelola model AI
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Membuat solusi AI Anda siap AZD
- **🎥 Panduan Interaktif**: [Workshop Materials](workshop/README.md) - Pembelajaran berbasis browser dengan MkDocs * DevContainer Environment
- **📋 Template**: [Microsoft Foundry Templates](#sumber-workshop)
- **📝 Contoh**: [AZD Deployment Examples](examples/README.md)

#### Latihan Praktis
```bash
# Sebarkan aplikasi AI pertama Anda
azd init --template azure-search-openai-demo
azd up

# Coba template AI tambahan
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Hasil Bab**: Menerapkan dan mengonfigurasi aplikasi chat bertenaga AI dengan kemampuan RAG

**✅ Validasi Keberhasilan:**
```bash
# Setelah Bab 2, Anda seharusnya dapat:
azd init --template azure-search-openai-demo
azd up
# Menguji antarmuka obrolan AI
# Mengajukan pertanyaan dan mendapatkan respons yang didukung AI beserta sumber
# Memverifikasi bahwa integrasi pencarian berfungsi
azd monitor  # Memeriksa bahwa Application Insights menampilkan telemetri
azd down --force --purge
```

**📊 Waktu yang Dibutuhkan:** 1-2 jam  
**📈 Tingkat Keterampilan Setelah:** Dapat menerapkan dan mengonfigurasi aplikasi AI siap produksi  
**💰 Kesadaran Biaya:** Memahami biaya dev $80-150/bulan, biaya produksi $300-3500/bulan

#### 💰 Pertimbangan Biaya untuk Penerapan AI

**Lingkungan Pengembangan (Perkiraan $80-150/bulan):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/bulan (berdasarkan penggunaan token)
- AI Search (tier Basic): $75/bulan
- Container Apps (Consumption): $0-20/bulan
- Storage (Standar): $1-5/bulan

**Lingkungan Produksi (Perkiraan $300-3,500+/bulan):**
- Microsoft Foundry Models (PTU untuk kinerja konsisten): $3,000+/bulan ATAU Pay-as-you-go dengan volume tinggi
- AI Search (tier Standard): $250/bulan
- Container Apps (Dedicated): $50-100/bulan
- Application Insights: $5-50/bulan
- Storage (Premium): $10-50/bulan

**💡 Tips Optimisasi Biaya:**
- Gunakan **Free Tier** Microsoft Foundry Models untuk belajar (Azure OpenAI 50,000 tokens/bulan termasuk)
- Jalankan `azd down` untuk melepaskan alokasi sumber daya saat tidak sedang mengembangkan aktif
- Mulailah dengan penagihan berbasis konsumsi, tingkatkan ke PTU hanya untuk produksi
- Gunakan `azd provision --preview` untuk memperkirakan biaya sebelum penerapan
- Aktifkan auto-scaling: bayar hanya untuk penggunaan aktual

**Pemantauan Biaya:**
```bash
# Periksa perkiraan biaya bulanan
azd provision --preview

# Pantau biaya aktual di Portal Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Bab 3: Konfigurasi & Autentikasi
**Prasyarat**: Bab 1 selesai  
**Durasi**: 45-60 menit  
**Kompleksitas**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Konfigurasi dan manajemen lingkungan
- Praktik terbaik autentikasi dan keamanan
- Penamaan dan pengorganisasian sumber daya

#### Sumber Pembelajaran
- **📖 Konfigurasi**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Pengaturan lingkungan
- **🔐 Keamanan**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - Pola autentikasi
- **📝 Contoh**: [Database App Example](examples/database-app/README.md) - Contoh Database AZD

#### Latihan Praktis
- Konfigurasikan beberapa lingkungan (dev, staging, prod)
- Siapkan autentikasi managed identity
- Terapkan konfigurasi spesifik lingkungan

**💡 Hasil Bab**: Mengelola beberapa lingkungan dengan autentikasi dan keamanan yang tepat

---

### 🏗️ Bab 4: Infrastructure as Code & Penerapan
**Prasyarat**: Bab 1-3 selesai  
**Durasi**: 1-1.5 jam  
**Kompleksitas**: ⭐⭐⭐

#### Apa yang Akan Anda Pelajari
- Pola penerapan tingkat lanjut
- Infrastructure as Code dengan Bicep
- Strategi provisioning sumber daya

#### Sumber Pembelajaran
- **📖 Penerapan**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Alur kerja lengkap
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Manajemen sumber daya Azure
- **📝 Contoh**: [Container App Example](../../examples/container-app) - Penerapan tercontainerisasi

#### Latihan Praktis
- Buat template Bicep kustom
- Terapkan aplikasi multi-layanan
- Terapkan strategi penerapan blue-green

**💡 Hasil Bab**: Menerapkan aplikasi multi-layanan kompleks menggunakan template infrastruktur kustom

---
### 🎯 Bab 5: Solusi AI Multi-Agen (Lanjutan)
**Prasyarat**: Bab 1-2 selesai  
**Durasi**: 2-3 jam  
**Kompleksitas**: ⭐⭐⭐⭐

#### Apa yang Akan Anda Pelajari
- Pola arsitektur multi-agen
- Orkestrasi dan koordinasi agen
- Penyebaran AI siap produksi

#### Sumber Pembelajaran
- **🤖 Proyek Unggulan**: [**Solusi Multi-Agen Ritel**](examples/retail-scenario.md) - Implementasi lengkap
- **🛠️ Paket Template ARM**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Penyebaran satu-klik
- **📖 Arsitektur**: [Pola koordinasi multi-agen](docs/chapter-06-pre-deployment/coordination-patterns.md) - Pola

#### Latihan Praktis
```bash
# Terapkan solusi multi-agen ritel lengkap
cd examples/retail-multiagent-arm-template
./deploy.sh

# Jelajahi konfigurasi agen
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Hasil Bab**: Menerapkan dan mengelola solusi AI multi-agen siap produksi dengan agen Pelanggan dan Inventaris

---

### 🔍 Bab 6: Validasi & Perencanaan Pra-Penyebaran
**Prasyarat**: Bab 4 selesai  
**Durasi**: 1 jam  
**Kompleksitas**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Perencanaan kapasitas dan validasi sumber daya
- Strategi pemilihan SKU
- Pemeriksaan pra-penyebaran dan otomatisasi

#### Sumber Pembelajaran
- **📊 Perencanaan**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Validasi sumber daya
- **💰 Pemilihan**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Pilihan hemat biaya
- **✅ Validasi**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Skrip otomatis

#### Latihan Praktis
- Jalankan skrip validasi kapasitas
- Optimalkan pemilihan SKU untuk biaya
- Implementasikan pemeriksaan pra-penyebaran otomatis

**💡 Hasil Bab**: Memvalidasi dan mengoptimalkan penyebaran sebelum pelaksanaan

---

### 🚨 Bab 7: Pemecahan Masalah & Debugging
**Prasyarat**: Salah satu bab penyebaran selesai  
**Durasi**: 1-1.5 jam  
**Kompleksitas**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Pendekatan debugging sistematis
- Masalah umum dan solusinya
- Pemecahan masalah khusus AI

#### Sumber Pembelajaran
- **🔧 Masalah Umum**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ dan solusi
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Strategi langkah demi langkah
- **🤖 Masalah AI**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Masalah layanan AI

#### Latihan Praktis
- Diagnosa kegagalan penyebaran
- Selesaikan masalah otentikasi
- Debug konektivitas layanan AI

**💡 Hasil Bab**: Mendiagnosis dan menyelesaikan masalah penyebaran umum secara mandiri

---

### 🏢 Bab 8: Pola Produksi & Perusahaan
**Prasyarat**: Bab 1-4 selesai  
**Durasi**: 2-3 jam  
**Kompleksitas**: ⭐⭐⭐⭐

#### Apa yang Akan Anda Pelajari
- Strategi penyebaran produksi
- Pola keamanan perusahaan
- Pemantauan dan optimisasi biaya

#### Sumber Pembelajaran
- **🏭 Produksi**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Pola perusahaan
- **📝 Contoh**: [Microservices Example](../../examples/microservices) - Arsitektur kompleks
- **📊 Pemantauan**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Pemantauan

#### Latihan Praktis
- Terapkan pola keamanan perusahaan
- Siapkan pemantauan komprehensif
- Sebarkan ke produksi dengan tata kelola yang tepat

**💡 Hasil Bab**: Menerapkan aplikasi siap perusahaan dengan kapabilitas produksi penuh

---

## 🎓 Ikhtisar Workshop: Pengalaman Pembelajaran Praktis

> **⚠️ STATUS WORKSHOP: Dalam Pengembangan Aktif**  
> Materi workshop saat ini sedang dikembangkan dan disempurnakan. Modul inti berfungsi, tetapi beberapa bagian lanjutan belum lengkap. Kami sedang aktif menyelesaikan semua konten. [Lacak kemajuan →](workshop/README.md)

### Materi Workshop Interaktif
**Pembelajaran praktis komprehensif dengan alat berbasis browser dan latihan terpandu**

Materi workshop kami menyediakan pengalaman pembelajaran terstruktur dan interaktif yang melengkapi kurikulum berbasis bab di atas. Workshop dirancang untuk pembelajaran mandiri maupun sesi yang dipandu instruktur.

#### 🛠️ Fitur Workshop
- **Antarmuka Berbasis Browser**: Workshop lengkap berbasis MkDocs dengan fitur pencarian, salin, dan tema
- **Integrasi GitHub Codespaces**: Satu-klik untuk menyiapkan lingkungan pengembangan
- **Jalur Pembelajaran Terstruktur**: 8 modul latihan terpandu (total 3-4 jam)
- **Metodologi Progresif**: Pengenalan → Pemilihan → Validasi → Dekonstruksi → Konfigurasi → Kustomisasi → Pembongkaran → Penutupan
- **Lingkungan DevContainer Interaktif**: Alat dan dependensi yang telah dikonfigurasi sebelumnya

#### 📚 Struktur Modul Workshop
Workshop mengikuti sebuah **metodologi progresif 8-modul** yang membawa Anda dari penemuan hingga penguasaan penyebaran:

| Modul | Topik | Apa yang Akan Anda Lakukan | Durasi |
|--------|-------|----------------|----------|
| **0. Pengenalan** | Ikhtisar Workshop | Memahami tujuan pembelajaran, prasyarat, dan struktur workshop | 15 menit |
| **1. Pemilihan** | Penemuan Template | Jelajahi template AZD dan pilih template AI yang tepat untuk skenario Anda | 20 menit |
| **2. Validasi** | Terapkan & Verifikasi | Terapkan template dengan `azd up` dan validasi infrastruktur berfungsi | 30 menit |
| **3. Dekonstruksi** | Memahami Struktur | Gunakan GitHub Copilot untuk mengeksplorasi arsitektur template, file Bicep, dan organisasi kode | 30 menit |
| **4. Konfigurasi** | Pendalaman azure.yaml | Kuasai konfigurasi `azure.yaml`, lifecycle hooks, dan variabel lingkungan | 30 menit |
| **5. Kustomisasi** | Sesuaikan Untuk Anda | Aktifkan AI Search, tracing, evaluasi, dan sesuaikan untuk skenario Anda | 45 menit |
| **6. Pembongkaran** | Pembersihan | Hapus sumber daya dengan aman menggunakan `azd down --purge` | 15 menit |
| **7. Penutupan** | Langkah Selanjutnya | Tinjau pencapaian, konsep utama, dan lanjutkan perjalanan pembelajaran Anda | 15 menit |

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
# Opsi 1: GitHub Codespaces (Direkomendasikan)
# Klik "Code" → "Create codespace on main" di repositori

# Opsi 2: Pengembangan Lokal
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Ikuti petunjuk pengaturan di workshop/README.md
```

#### 🎯 Hasil Pembelajaran Workshop
Dengan menyelesaikan workshop, peserta akan:
- **Menerapkan Aplikasi AI Produksi**: Gunakan AZD dengan layanan Microsoft Foundry
- **Menguasai Arsitektur Multi-Agen**: Menerapkan solusi agen AI yang terkoordinasi
- **Menerapkan Praktik Keamanan Terbaik**: Konfigurasi otentikasi dan kontrol akses
- **Mengoptimalkan untuk Skala**: Rancang penyebaran yang hemat biaya dan berkinerja
- **Memecahkan Masalah Penyebaran**: Menyelesaikan masalah umum secara mandiri

#### 📖 Sumber Workshop
- **🎥 Panduan Interaktif**: [Materi Workshop](workshop/README.md) - Lingkungan pembelajaran berbasis browser
- **📋 Instruksi Per Modul**:
  - [0. Pengenalan](workshop/docs/instructions/0-Introduction.md) - Ikhtisar workshop dan tujuan
  - [1. Pemilihan](workshop/docs/instructions/1-Select-AI-Template.md) - Temukan dan pilih template AI
  - [2. Validasi](workshop/docs/instructions/2-Validate-AI-Template.md) - Terapkan dan verifikasi template
  - [3. Dekonstruksi](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Jelajahi arsitektur template
  - [4. Konfigurasi](workshop/docs/instructions/4-Configure-AI-Template.md) - Kuasai azure.yaml
  - [5. Kustomisasi](workshop/docs/instructions/5-Customize-AI-Template.md) - Sesuaikan untuk skenario Anda
  - [6. Pembongkaran](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Bersihkan sumber daya
  - [7. Penutupan](workshop/docs/instructions/7-Wrap-up.md) - Tinjau dan langkah selanjutnya
- **🛠️ Lab Workshop AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Latihan berfokus pada AI
- **💡 Mulai Cepat**: [Panduan Setup Workshop](workshop/README.md#quick-start) - Konfigurasi lingkungan

**Cocok untuk**: Pelatihan korporat, mata kuliah universitas, pembelajaran mandiri, dan bootcamp pengembang.

---

## 📖 Pendalaman: Kapabilitas AZD

Selain dasar, AZD menyediakan fitur kuat untuk penyebaran produksi:

- **Penyebaran berbasis template** - Gunakan template pra-bangun untuk pola aplikasi umum
- **Infrastruktur sebagai Kode** - Kelola sumber daya Azure menggunakan Bicep atau Terraform  
- **Alur kerja terintegrasi** - Menyediakan, menerapkan, dan memantau aplikasi secara mulus
- **Ramah pengembang** - Dioptimalkan untuk produktivitas dan pengalaman pengembang

### **AZD + Microsoft Foundry: Sempurna untuk Penyebaran AI**

**Mengapa AZD untuk Solusi AI?** AZD mengatasi tantangan utama yang dihadapi pengembang AI:

- **Template Siap untuk AI** - Template pra-konfigurasi untuk Microsoft Foundry Models, Azure AI Services, dan beban kerja ML
- **Penyebaran AI Aman** - Pola keamanan bawaan untuk layanan AI, kunci API, dan endpoint model  
- **Pola AI Produksi** - Praktik terbaik untuk penyebaran aplikasi AI yang skalabel dan hemat biaya
- **Alur Kerja AI End-to-End** - Dari pengembangan model hingga penyebaran produksi dengan pemantauan yang tepat
- **Optimisasi Biaya** - Alokasi sumber daya dan strategi penskalaan cerdas untuk beban kerja AI
- **Integrasi Microsoft Foundry** - Koneksi mulus ke katalog model dan endpoint Microsoft Foundry

---

## 🎯 Perpustakaan Template & Contoh

### Unggulan: Template Microsoft Foundry
**Mulai di sini jika Anda menyebarkan aplikasi AI!**

> **Catatan:** Template ini menunjukkan berbagai pola AI. Beberapa adalah Azure Samples eksternal, lainnya adalah implementasi lokal.

| Template | Bab | Kompleksitas | Layanan | Tipe |
|----------|---------|------------|----------|------|
| [**Mulai dengan Chat AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bab 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Eksternal |
| [**Mulai dengan Agen AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Bab 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Eksternal |
| [**Azure Search + Demo OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bab 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Eksternal |
| [**Panduan Cepat Aplikasi Chat OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bab 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Eksternal |
| [**Agen OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bab 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Eksternal |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Bab 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Eksternal |
| [**Solusi Multi-Agen Ritel**](examples/retail-scenario.md) | Bab 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Unggulan: Skenario Pembelajaran Lengkap
**Template aplikasi siap produksi yang dipetakan ke bab pembelajaran**

| Template | Bab Pembelajaran | Kompleksitas | Pembelajaran Utama |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bab 2 | ⭐ | Pola penyebaran AI dasar |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bab 2 | ⭐⭐ | Implementasi RAG dengan Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Bab 4 | ⭐⭐ | Integrasi Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bab 5 | ⭐⭐⭐ | Kerangka agen dan pemanggilan fungsi |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Bab 8 | ⭐⭐⭐ | Orkestrasi AI perusahaan |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Bab 5 | ⭐⭐⭐⭐ | Arsitektur multi-agen dengan agen Pelanggan dan Inventaris |

### Belajar dengan Tipe Contoh

> **📌 Contoh Lokal vs. Eksternal:**  
> **Contoh Lokal** (di repo ini) = Siap digunakan segera  
> **Contoh Eksternal** (Azure Samples) = Clone dari repositori yang ditautkan

#### Contoh Lokal (Siap Digunakan)
- [**Solusi Multi-Agen Ritel**](examples/retail-scenario.md) - Implementasi lengkap siap produksi dengan template ARM
  - Arsitektur multi-agen (agen Pelanggan + Inventaris)
  - Pemantauan dan evaluasi komprehensif
  - Penyebaran satu-klik melalui template ARM

#### Contoh Lokal - Aplikasi Kontainer (Bab 2-5)
**Contoh penyebaran kontainer komprehensif di repositori ini:**
- [**Container App Examples**](examples/container-app/README.md) - Panduan lengkap untuk deployment terkontainerisasi
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - REST API dasar dengan scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Deployment multi-layanan siap produksi
  - Quick Start, Production, and Advanced deployment patterns
  - Monitoring, security, and cost optimization guidance

#### External Examples - Simple Applications (Chapters 1-2)
**Clone these Azure Samples repositories to get started:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pola deployment dasar
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Deployment konten statis
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Deployment REST API

#### External Examples - Database Integration (Chapter 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Pola konektivitas database
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Alur data serverless

#### External Examples - Advanced Patterns (Chapters 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arsitektur multi-layanan
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Pemrosesan latar belakang  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Pola ML siap produksi

### External Template Collections
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Koleksi terkurasi template resmi dan komunitas
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasi template Microsoft Learn
- [**Examples Directory**](examples/README.md) - Contoh pembelajaran lokal dengan penjelasan rinci

---

## 📚 Learning Resources & References

### Quick References
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Perintah azd esensial yang diatur menurut bab
- [**Glossary**](resources/glossary.md) - Terminologi Azure dan azd  
- [**FAQ**](resources/faq.md) - Pertanyaan umum yang diatur berdasarkan bab pembelajaran
- [**Study Guide**](resources/study-guide.md) - Latihan praktis komprehensif

### Hands-On Workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Buat solusi AI Anda dapat dideploy dengan AZD (2-3 jam)
- [**Interactive Workshop**](workshop/README.md) - 8 modul latihan terpandu dengan MkDocs dan GitHub Codespaces
  - Berurutan: Pengenalan → Pemilihan → Validasi → Dekonstruksi → Konfigurasi → Kustomisasi → Pembongkaran → Penutupan

### External Learning Resources
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### AI Agent Skills for Your Editor
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 keterampilan agen terbuka untuk Azure AI, Foundry, deployment, diagnostik, optimisasi biaya, dan lainnya. Instal di GitHub Copilot, Cursor, Claude Code, atau agen yang didukung lainnya:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Quick Troubleshooting Guide

**Masalah umum yang dihadapi pemula dan solusi segera:**

<details>
<summary><strong>❌ "azd: perintah tidak ditemukan"</strong></summary>

```bash
# Instal AZD terlebih dahulu
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verifikasi instalasi
azd version
```
</details>

<details>
<summary><strong>❌ "Tidak ada langganan ditemukan" atau "Langganan tidak disetel"</strong></summary>

```bash
# Daftar langganan yang tersedia
az account list --output table

# Tetapkan langganan default
az account set --subscription "<subscription-id-or-name>"

# Tetapkan untuk lingkungan AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verifikasi
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" atau "Kuota terlampaui"</strong></summary>

```bash
# Coba wilayah Azure yang berbeda
azd env set AZURE_LOCATION "westus2"
azd up

# Atau gunakan SKU yang lebih kecil saat pengembangan
# Sunting infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" gagal di tengah proses</strong></summary>

```bash
# Opsi 1: Bersihkan dan coba lagi
azd down --force --purge
azd up

# Opsi 2: Cukup perbaiki infrastruktur
azd provision

# Opsi 3: Periksa status terperinci
azd show

# Opsi 4: Periksa log di Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentikasi gagal" atau "Token kedaluwarsa"</strong></summary>

```bash
# Autentikasi ulang untuk AZD
azd auth logout
azd auth login

# Opsional: segarkan Azure CLI juga jika Anda menjalankan perintah az
az logout
az login

# Verifikasi autentikasi
az account show
```
</details>

<details>
<summary><strong>❌ "Sumber daya sudah ada" atau konflik penamaan</strong></summary>

```bash
# AZD menghasilkan nama unik, tetapi jika terjadi konflik:
azd down --force --purge

# Kemudian coba lagi dengan lingkungan baru
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Penerapan template memakan waktu terlalu lama</strong></summary>

**Waktu tunggu normal:**
- Aplikasi web sederhana: 5-10 menit
- Aplikasi dengan database: 10-15 menit
- Aplikasi AI: 15-25 menit (penyediaan OpenAI lambat)

```bash
# Periksa kemajuan
azd show

# Jika terjebak lebih dari 30 menit, periksa Azure Portal:
azd monitor --overview
# Cari penyebaran yang gagal
```
</details>

<details>
<summary><strong>❌ "Izin ditolak" atau "Dilarang"</strong></summary>

```bash
# Periksa peran Azure Anda
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Anda membutuhkan setidaknya peran "Contributor"
# Minta admin Azure Anda untuk memberikan:
# - Contributor (untuk sumber daya)
# - User Access Administrator (untuk penugasan peran)
```
</details>

<details>
<summary><strong>❌ Tidak dapat menemukan URL aplikasi yang dideploy</strong></summary>

```bash
# Tampilkan semua titik akhir layanan
azd show

# Atau buka Azure Portal
azd monitor

# Periksa layanan tertentu
azd env get-values
# Cari variabel *_URL
```
</details>

### 📚 Full Troubleshooting Resources

- **Panduan Masalah Umum:** [Solusi Terperinci](docs/chapter-07-troubleshooting/common-issues.md)
- **Masalah Khusus AI:** [Pemecahan Masalah AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Panduan Debugging:** [Debugging Langkah demi Langkah](docs/chapter-07-troubleshooting/debugging.md)
- **Dapatkan Bantuan:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Course Completion & Certification

### Progress Tracking
Lacak kemajuan pembelajaran Anda melalui setiap bab:

- [ ] **Bab 1**: Dasar & Mulai Cepat ✅
- [ ] **Bab 2**: Pengembangan Berbasis AI ✅  
- [ ] **Bab 3**: Konfigurasi & Otentikasi ✅
- [ ] **Bab 4**: Infrastruktur sebagai Kode & Penyebaran ✅
- [ ] **Bab 5**: Solusi AI Multi-Agen ✅
- [ ] **Bab 6**: Validasi & Perencanaan Pra-Penyebaran ✅
- [ ] **Bab 7**: Pemecahan Masalah & Debugging ✅
- [ ] **Bab 8**: Pola Produksi & Perusahaan ✅

### Learning Verification
Setelah menyelesaikan setiap bab, verifikasi pengetahuan Anda dengan:
1. **Practical Exercise**: Selesaikan deployment praktis pada bab tersebut
2. **Knowledge Check**: Tinjau bagian FAQ untuk bab Anda
3. **Community Discussion**: Bagikan pengalaman Anda di Azure Discord
4. **Next Chapter**: Lanjutkan ke tingkat kompleksitas berikutnya

### Course Completion Benefits
Setelah menyelesaikan semua bab, Anda akan memiliki:
- **Production Experience**: Telah mendeploy aplikasi AI nyata ke Azure
- **Professional Skills**: Kemampuan penyebaran siap perusahaan  
- **Community Recognition**: Anggota aktif komunitas pengembang Azure
- **Career Advancement**: Keahlian AZD dan penyebaran AI yang diminati

---

## 🤝 Community & Support

### Get Help & Support
- **Technical Issues**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **Learning Questions**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-Specific Help**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentation**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community Insights from Microsoft Foundry Discord

**Recent Poll Results from #Azure Channel:**
- **45%** of developers want to use AZD for AI workloads
- **Top challenges**: Penyebaran multi-layanan, pengelolaan kredensial, kesiapan produksi  
- **Most requested**: Template khusus AI, panduan pemecahan masalah, praktik terbaik

**Join our community to:**
- Bagikan pengalaman AZD + AI Anda dan dapatkan bantuan
- Akses pratinjau awal template AI baru
- Kontribusi pada praktik terbaik penyebaran AI
- Mempengaruhi pengembangan fitur AI + AZD di masa depan

### Contributing to the Course
Kami menyambut kontribusi! Harap baca [Contributing Guide](CONTRIBUTING.md) untuk detail tentang:
- **Content Improvements**: Tingkatkan bab dan contoh yang ada
- **New Examples**: Tambahkan skenario dunia nyata dan template  
- **Translation**: Bantu pemeliharaan dukungan multi-bahasa
- **Bug Reports**: Tingkatkan akurasi dan kejelasan
- **Community Standards**: Ikuti pedoman komunitas inklusif kami

---

## 📄 Course Information

### License
This project is licensed under the MIT License - see the [LICENSE](../../LICENSE) file for details.

### Related Microsoft Learning Resources

Our team produces other comprehensive learning courses:

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
[![Agen AI untuk Pemula](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI untuk Pemula](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![AI Generatif (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

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
[![Copilot untuk Pemrograman Berpasangan AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot untuk C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Petualangan Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigasi Kursus

**🚀 Siap Memulai Belajar?**

**Pemula**: Mulai dengan [Bab 1: Dasar & Memulai Cepat](#-chapter-1-foundation--quick-start)  
**Pengembang AI**: Pergi ke [Bab 2: Pengembangan Berorientasi AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Pengembang Berpengalaman**: Mulai dengan [Bab 3: Konfigurasi & Otentikasi](#️-chapter-3-configuration--authentication)

**Langkah Selanjutnya**: [Mulai Bab 1 - AZD Basics](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->