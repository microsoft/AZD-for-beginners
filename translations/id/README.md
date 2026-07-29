# AZD Untuk Pemula: Perjalanan Pembelajaran Terstruktur

![AZD-for-beginners](../../translated_images/id/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Terjemahan Otomatis (Selalu Terbaru)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](./README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Lebih suka Clone Lokal?**
>
> Repositori ini menyertakan lebih dari 50 terjemahan bahasa yang secara signifikan meningkatkan ukuran unduhan. Untuk meng-clone tanpa terjemahan, gunakan sparse checkout:
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

> 📌 Kursus ini divalidasi menggunakan **`azd 1.27.1`** (Juli 2026). Jalankan `azd version` untuk memeriksa versi, dan `azd upgrade` untuk mendapatkan versi terbaru.

Azure Developer CLI telah berkembang melampaui aplikasi web dan API tradisional. Kini, azd adalah alat tunggal untuk menerapkan **aplikasi apa saja** ke Azure—termasuk aplikasi AI dan agen cerdas.

Berikut artinya untuk Anda:

- **Agen AI sekarang adalah beban kerja azd kelas satu.** Anda dapat menginisialisasi, menerapkan, dan mengelola proyek agen AI menggunakan workflow `azd init` → `azd up` yang sudah Anda ketahui.
- **Siklus hidup agen lengkap dari CLI.** Ekstensi `azure.ai.agents` kini mencakup seluruh perjalanan—`azd ai agent init` untuk pembuatan awal, `azd ai agent invoke` untuk pengujian (dengan output waktu respons), `azd ai agent eval generate` dan `azd ai agent optimize` untuk mengukur dan meningkatkan kualitas, serta `azd ai agent delete` untuk pembersihan.
- **Lebih banyak blok bangunan AI.** Ekstensi pratinjau baru—`azure.ai.skills` dan `azure.ai.connections`—memungkinkan Anda mengelola keterampilan agen yang dapat digunakan ulang dan koneksi Foundry langsung dengan azd.
- **Integrasi Microsoft Foundry** menghadirkan penerapan model, hosting agen, dan konfigurasi layanan AI langsung ke dalam ekosistem template azd.
- **Dasar-dasar harian yang lebih mulus.** Rilis terbaru membuat `azd init` idempoten (aman untuk dijalankan ulang), membuat `azd auth login` menghapus token usang secara otomatis, dan menambahkan prompt pengaturan pertama `azd tool` yang ramah.
- **Alur kerja inti tidak berubah.** Baik Anda menerapkan aplikasi todo, microservice, atau solusi AI multi-agen, perintahnya tetap sama.

> **Catatan untuk pengguna Aspire:** Microsoft sekarang menyebut produk ini cukup sebagai **Aspire** (sebelumnya ".NET Aspire"). Dukungan azd untuk Aspire tidak berubah—hanya namanya yang diperbarui.

Jika Anda sudah menggunakan azd sebelumnya, dukungan AI adalah perluasan alami—bukan alat terpisah atau jalur lanjutan. Jika Anda memulai dari awal, Anda akan belajar satu workflow yang bekerja untuk segalanya.

---

## 🚀 Apa itu Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** adalah alat baris perintah yang ramah pengembang yang memudahkan penerapan aplikasi ke Azure. Alih-alih membuat dan menghubungkan puluhan sumber daya Azure secara manual, Anda dapat menerapkan seluruh aplikasi dengan satu perintah.

### Keajaiban `azd up`

```bash
# Perintah tunggal ini melakukan semuanya:
# ✅ Membuat semua sumber daya Azure
# ✅ Mengonfigurasi jaringan dan keamanan
# ✅ Membangun kode aplikasi Anda
# ✅ Menerapkan ke Azure
# ✅ Memberikan Anda URL yang berfungsi
azd up
```

**Itu saja!** Tidak perlu mengklik Portal Azure, tidak ada template ARM yang rumit untuk dipelajari dulu, tidak ada konfigurasi manual - hanya aplikasi yang berfungsi di Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Apa Perbedaannya?

Ini adalah pertanyaan paling umum yang diajukan pemula. Berikut jawaban sederhananya:

| Fitur | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Tujuan** | Mengelola sumber daya Azure individu | Menerapkan aplikasi lengkap |
| **Pola Pikir** | Fokus pada infrastruktur | Fokus pada aplikasi |
| **Contoh** | `az webapp create --name myapp...` | `azd up` |
| **Kurva Pembelajaran** | Harus tahu layanan Azure | Cukup tahu aplikasi Anda |
| **Terbaik Untuk** | DevOps, Infrastruktur | Pengembang, Prototyping |

### Analogi Sederhana

- **Azure CLI** seperti memiliki semua alat untuk membangun rumah - palu, gergaji, paku. Anda bisa membangun apa saja, tapi harus tahu konstruksi.
- **Azure Developer CLI** seperti menyewa kontraktor - Anda jelaskan apa yang Anda inginkan, dan mereka menangani pembangunannya.

### Kapan Menggunakan Masing-Masing

| Skenario | Gunakan Ini |
|----------|----------|
| "Saya ingin menerapkan aplikasi web saya dengan cepat" | `azd up` |
| "Saya hanya perlu membuat akun penyimpanan" | `az storage account create` |
| "Saya membangun aplikasi AI penuh" | `azd init --template azure-search-openai-demo` |
| "Saya perlu debug sumber daya Azure tertentu" | `az resource show` |
| "Saya ingin penerapan siap produksi dalam beberapa menit" | `azd up --environment production` |

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

Jangan mulai dari nol! **Awesome AZD** adalah koleksi komunitas dari template siap-pakai:

| Sumber Daya | Deskripsi |
|----------|-------------|
| 🔗 [**Galeri Awesome AZD**](https://azure.github.io/awesome-azd/) | Jelajahi 200+ template dengan sekali klik deploy |
| 🔗 [**Kirim Template**](https://github.com/Azure/awesome-azd/issues) | Kontribusikan template Anda ke komunitas |
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

Sebelum memulai, pastikan mesin Anda siap untuk template yang ingin Anda terapkan:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jika ada pemeriksaan yang gagal, perbaiki dulu baru lanjut ke langkah cepat.

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

Jika Anda tidak yakin mana yang Anda butuhkan, ikuti alur pengaturan lengkap di [Instalasi & Pengaturan](docs/chapter-01-foundation/installation.md#authentication-setup).

### Langkah 3: Terapkan Aplikasi Pertama Anda

```bash
# Inisialisasi dari template
azd init --template todo-nodejs-mongo

# Terapkan ke Azure (membuat semuanya!)
azd up
```

**🎉 Selesai!** Aplikasi Anda sekarang telah live di Azure.

### Bersihkan (Jangan Lupa!)

```bash
# Hapus semua sumber daya setelah selesai bereksperimen
azd down --force --purge
```

---

## 📚 Cara Menggunakan Kursus Ini

Kursus ini dirancang untuk **pembelajaran bertahap** - mulai dari yang Anda kuasai dan tingkatkan kemampuan Anda:

| Pengalaman Anda | Mulai Dari Sini |
|-----------------|-----------------|
| **Baru mengenal Azure** | [Bab 1: Pondasi](#-chapter-1-foundation--quick-start) |
| **Tahu Azure, baru di AZD** | [Bab 1: Pondasi](#-chapter-1-foundation--quick-start) |
| **Ingin menerapkan aplikasi AI** | [Bab 2: Pengembangan Berbasis AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Ingin praktek langsung** | [🎓 Workshop Interaktif](workshop/README.md) - lab terpandu 3-4 jam |
| **Butuh pola produksi** | [Bab 8: Produksi & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Pengaturan Cepat

1. **Fork Repositori Ini**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Dapatkan Bantuan**: [Komunitas Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Lebih suka Clone Lokal?**

> Repositori ini menyertakan lebih dari 50 terjemahan bahasa yang secara signifikan meningkatkan ukuran unduhan. Untuk meng-clone tanpa terjemahan, gunakan sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ini memberi Anda semua yang Anda butuhkan untuk menyelesaikan kursus dengan unduhan yang jauh lebih cepat.


## Ikhtisar Kursus

Kuasai Azure Developer CLI (azd) melalui bab-bab terstruktur yang dirancang untuk pembelajaran bertahap. **Fokus khusus pada penerapan aplikasi AI dengan integrasi Microsoft Foundry.**


### Mengapa Kursus Ini Penting untuk Pengembang Modern

Berdasarkan wawasan dari komunitas Microsoft Foundry Discord, **45% pengembang ingin menggunakan AZD untuk beban kerja AI** tetapi menghadapi tantangan dengan:
- Arsitektur AI multi-layanan yang kompleks
- Praktik terbaik penerapan AI di produksi  
- Integrasi dan konfigurasi layanan Azure AI
- Optimasi biaya untuk beban kerja AI
- Pemecahan masalah isu penerapan spesifik AI

### Tujuan Pembelajaran

Dengan menyelesaikan kursus terstruktur ini, Anda akan:
- **Menguasai Dasar-dasar AZD**: Konsep inti, instalasi, dan konfigurasi
- **Menerapkan Aplikasi AI**: Menggunakan AZD dengan layanan Microsoft Foundry
- **Mengimplementasikan Infrastruktur sebagai Kode**: Mengelola sumber daya Azure dengan template Bicep
- **Memecahkan Masalah Penerapan**: Menyelesaikan isu umum dan debugging masalah
- **Mengoptimalkan untuk Produksi**: Keamanan, penskalaan, pemantauan, dan pengelolaan biaya
- **Membangun Solusi Multi-Agen**: Menerapkan arsitektur AI yang kompleks

## Sebelum Memulai: Akun, Akses, dan Asumsi

Sebelum Anda memulai Bab 1, pastikan Anda sudah memiliki hal-hal berikut. Langkah instalasi selanjutnya dalam panduan ini mengasumsikan hal-hal dasar ini sudah ditangani.

- **Langganan Azure**: Anda dapat menggunakan langganan yang sudah ada dari tempat kerja atau akun pribadi Anda, atau membuat [trial gratis](https://aka.ms/azurefreetrial) untuk memulai.
- **Izin untuk membuat sumber daya Azure**: Untuk sebagian besar latihan, Anda harus memiliki akses setidaknya sebagai **Kontributor** pada langganan atau grup sumber daya target. Beberapa bab juga mengasumsikan Anda dapat membuat grup sumber daya, identitas terkelola, dan penugasan RBAC.
- [**Akun GitHub**](https://github.com): Ini berguna untuk memfork repositori, melacak perubahan sendiri, dan menggunakan GitHub Codespaces untuk lokakarya.
- **Prasyarat runtime template**: Beberapa template membutuhkan alat lokal seperti Node.js, Python, Java, atau Docker. Jalankan validator setup sebelum mulai agar Anda tahu alat apa yang kurang sejak awal.
- **Pemahaman dasar terminal**: Anda tidak perlu ahli, tetapi harus nyaman menjalankan perintah seperti `git clone`, `azd auth login`, dan `azd up`.

> **Bekerja di langganan perusahaan?**
> Jika lingkungan Azure Anda dikelola oleh administrator, pastikan sebelumnya bahwa Anda dapat menerapkan sumber daya dalam langganan atau grup sumber daya yang akan Anda gunakan. Jika tidak, mintalah langganan sandbox atau akses Kontributor sebelum mulai.

> **Baru di Azure?**
> Mulailah dengan trial Azure sendiri atau langganan bayar sesuai penggunaan di https://aka.ms/azurefreetrial agar Anda dapat menyelesaikan latihan dari awal hingga akhir tanpa menunggu persetujuan tingkat tenant.

## 🗺️ Peta Kursus: Navigasi Cepat per Bab

Setiap bab memiliki README khusus dengan tujuan pembelajaran, panduan cepat, dan latihan:

| Bab | Topik | Pelajaran | Durasi | Kompleksitas |
|---------|-------|---------|----------|------------|
| **[Bab 1: Dasar](docs/chapter-01-foundation/README.md)** | Memulai | [Dasar AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalasi](docs/chapter-01-foundation/installation.md) &#124; [Proyek Pertama](docs/chapter-01-foundation/first-project.md) | 30-45 menit | ⭐ |
| **[Bab 2: Pengembangan AI](docs/chapter-02-ai-development/README.md)** | Aplikasi AI-Pertama | [Integrasi Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agen AI](docs/chapter-02-ai-development/agents.md) &#124; [Penerapan Model AI](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Lokakarya](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 jam | ⭐⭐ |
| **[Bab 3: Konfigurasi](docs/chapter-03-configuration/README.md)** | Otentikasi & Keamanan | [Konfigurasi](docs/chapter-03-configuration/configuration.md) &#124; [Otentikasi & Keamanan](docs/chapter-03-configuration/authsecurity.md) | 45-60 menit | ⭐⭐ |
| **[Bab 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Penerapan | [Panduan Penerapan](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Penyediaan](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 jam | ⭐⭐⭐ |
| **[Bab 5: Multi-Agen](docs/chapter-05-multi-agent/README.md)** | Solusi Agen AI | [Skenario Ritel](examples/retail-scenario.md) &#124; [Pola Koordinasi](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 jam | ⭐⭐⭐⭐ |
| **[Bab 6: Pra-Penerapan](docs/chapter-06-pre-deployment/README.md)** | Perencanaan & Validasi | [Pemeriksaan Pra-Kembali](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Perencanaan Kapasitas](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Pemilihan SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 jam | ⭐⭐ |
| **[Bab 7: Pemecahan Masalah](docs/chapter-07-troubleshooting/README.md)** | Debug & Perbaikan | [Masalah Umum](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [Masalah AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 jam | ⭐⭐ |
| **[Bab 8: Produksi](docs/chapter-08-production/README.md)** | Pola Perusahaan | [Praktik Produksi](docs/chapter-08-production/production-ai-practices.md) | 2-3 jam | ⭐⭐⭐⭐ |
| **[🎓 Lokakarya](workshop/README.md)** | Lab Praktik | [Pendahuluan](workshop/docs/instructions/0-Introduction.md) &#124; [Pemilihan](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validasi](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Dekonstruksi](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurasi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Kustomisasi](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Pembongkaran](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Penutupan](workshop/docs/instructions/7-Wrap-up.md) | 3-4 jam | ⭐⭐ |

**Total Durasi Kursus:** ~10-14 jam | **Kemajuan Keterampilan:** Pemula → Siap Produksi

---

## 📚 Bab Pembelajaran

*Pilih jalur pembelajaran Anda berdasarkan tingkat pengalaman dan tujuan*

### 🚀 Bab 1: Dasar & Memulai Cepat
**Prasyarat**: Langganan Azure, pengetahuan dasar baris perintah  
**Durasi**: 30-45 menit  
**Kompleksitas**: ⭐

#### Apa yang Akan Anda Pelajari
- Memahami dasar-dasar Azure Developer CLI
- Menginstal AZD di platform Anda
- Penerapan sukses pertama Anda

#### Sumber Belajar
- **🎯 Mulai Di Sini**: [Apa itu Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teori**: [Dasar AZD](docs/chapter-01-foundation/azd-basics.md) - Konsep inti dan terminologi
- **⚙️ Setup**: [Instalasi & Setup](docs/chapter-01-foundation/installation.md) - Panduan khusus platform
- **🛠️ Praktik**: [Proyek Pertama Anda](docs/chapter-01-foundation/first-project.md) - Tutorial langkah demi langkah
- **📋 Referensi Cepat**: [Lembar Cheat Perintah](resources/cheat-sheet.md)

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
# Setelah menyelesaikan Bab 1, Anda harus dapat:
azd version              # Menampilkan versi yang terpasang
azd init --template todo-nodejs-mongo  # Menginisialisasi proyek
azd up                  # Men-deploy ke Azure
azd show                # Menampilkan URL aplikasi yang berjalan
# Aplikasi terbuka di browser dan berfungsi
azd down --force --purge  # Membersihkan sumber daya
```

**📊 Waktu yang Dibutuhkan:** 30-45 menit  
**📈 Tingkat Keterampilan Setelah:** Bisa menerapkan aplikasi dasar secara mandiri
**📈 Tingkat Keterampilan Setelah:** Bisa menerapkan aplikasi dasar secara mandiri

---

### 🤖 Bab 2: Pengembangan AI-Pertama (Direkomendasikan untuk Pengembang AI)
**Prasyarat**: Bab 1 selesai  
**Durasi**: 1-2 jam  
**Kompleksitas**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Integrasi Microsoft Foundry dengan AZD
- Menerapkan aplikasi bertenaga AI
- Memahami konfigurasi layanan AI

#### Sumber Belajar
- **🎯 Mulai Di Sini**: [Integrasi Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agen AI**: [Panduan Agen AI](docs/chapter-02-ai-development/agents.md) - Terapkan agen cerdas dengan AZD
- **📖 Pola**: [Penerapan Model AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Terapkan dan kelola model AI
- **🛠️ Lokakarya**: [Lab Lokakarya AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Jadikan solusi AI Anda siap AZD
- **🎥 Panduan Interaktif**: [Materi Lokakarya](workshop/README.md) - Pembelajaran berbasis browser dengan MkDocs * DevContainer Environment
- **📋 Template**: [Template Microsoft Foundry](#sumber-daya-workshop)
- **📝 Contoh**: [Contoh Penerapan AZD](examples/README.md)

#### Latihan Praktis
```bash
# Deploy aplikasi AI pertama Anda
azd init --template azure-search-openai-demo
azd up

# Coba template AI tambahan
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Hasil Bab**: Menerapkan dan mengonfigurasi aplikasi chat bertenaga AI dengan kemampuan RAG

**✅ Validasi Keberhasilan:**
```bash
# Setelah Bab 2, Anda harus bisa:
azd init --template azure-search-openai-demo
azd up
# Menguji antarmuka obrolan AI
# Mengajukan pertanyaan dan mendapatkan jawaban bertenaga AI dengan sumber
# Memverifikasi integrasi pencarian berfungsi
azd monitor  # Memeriksa Application Insights menampilkan telemetri
azd down --force --purge
```

**📊 Waktu yang Dibutuhkan:** 1-2 jam  
**📈 Tingkat Keterampilan Setelah:** Bisa menerapkan dan mengonfigurasi aplikasi AI siap produksi  
**💰 Kesadaran Biaya:** Memahami biaya pengembangan $80-150/bulan, biaya produksi $300-3500/bulan

#### 💰 Pertimbangan Biaya untuk Penerapan AI

**Lingkungan Pengembangan (Perkiraan $80-150/bulan):**
- Model Microsoft Foundry (Bayar sesuai penggunaan): $0-50/bulan (berdasarkan penggunaan token)
- AI Search (tier Dasar): $75/bulan
- Container Apps (Konsumsi): $0-20/bulan
- Penyimpanan (Standar): $1-5/bulan

**Lingkungan Produksi (Perkiraan $300-3,500+/bulan):**
- Model Microsoft Foundry (PTU untuk kinerja konsisten): $3,000+/bulan ATAU Bayar sesuai penggunaan dengan volume tinggi
- AI Search (tier Standar): $250/bulan
- Container Apps (Dedikasi): $50-100/bulan
- Application Insights: $5-50/bulan
- Penyimpanan (Premium): $10-50/bulan

**💡 Tips Optimasi Biaya:**
- Gunakan **Tier Gratis** Model Microsoft Foundry untuk belajar (Azure OpenAI 50.000 token/bulan termasuk)
- Jalankan `azd down` untuk menghapus alokasi sumber daya saat tidak sedang mengembangkan aktif
- Mulai dengan penagihan berbasis konsumsi, naikkan ke PTU hanya untuk produksi
- Gunakan `azd provision --preview` untuk memperkirakan biaya sebelum penerapan
- Aktifkan auto-scaling: bayar hanya untuk penggunaan nyata

**Pemantauan Biaya:**
```bash
# Periksa perkiraan biaya bulanan
azd provision --preview

# Pantau biaya aktual di Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Bab 3: Konfigurasi & Otentikasi
**Prasyarat**: Bab 1 selesai  
**Durasi**: 45-60 menit  
**Kompleksitas**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Konfigurasi dan pengelolaan lingkungan
- Praktik terbaik otentikasi dan keamanan
- Penamaan sumber daya dan organisasi

#### Sumber Belajar
- **📖 Konfigurasi**: [Panduan Konfigurasi](docs/chapter-03-configuration/configuration.md) - Setup lingkungan
- **🔐 Keamanan**: [Pola Otentikasi dan Identitas Terkelola](docs/chapter-03-configuration/authsecurity.md) - Pola otentikasi
- **📝 Contoh**: [Contoh Aplikasi Database](examples/database-app/README.md) - Contoh Database AZD

#### Latihan Praktis
- Konfigurasikan beberapa lingkungan (dev, staging, prod)
- Atur otentikasi identitas terkelola
- Terapkan konfigurasi spesifik lingkungan

**💡 Hasil Bab**: Mengelola banyak lingkungan dengan otentikasi dan keamanan yang tepat

---

### 🏗️ Bab 4: Infrastruktur sebagai Kode & Penerapan
**Prasyarat**: Bab 1-3 selesai  
**Durasi**: 1-1.5 jam  
**Kompleksitas**: ⭐⭐⭐

#### Apa yang Akan Anda Pelajari
- Pola penerapan lanjutan
- Infrastruktur sebagai Kode dengan Bicep
- Strategi penyediaan sumber daya

#### Sumber Belajar
- **📖 Penerapan**: [Panduan Penerapan](docs/chapter-04-infrastructure/deployment-guide.md) - Alur kerja lengkap
- **🏗️ Penyediaan**: [Penyediaan Sumber Daya](docs/chapter-04-infrastructure/provisioning.md) - Pengelolaan sumber daya Azure
- **📝 Contoh**: [Contoh Container App](../../examples/container-app) - Penerapan containerized

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
- Penerapan AI siap produksi

#### Sumber Belajar
- **🤖 Proyek Unggulan**: [Solusi Multi-Agen Retail](examples/retail-scenario.md) - Implementasi lengkap
- **🛠️ Template ARM**: [Paket Template ARM](../../examples/retail-multiagent-arm-template) - Deployment satu klik
- **📖 Arsitektur**: [Pola koordinasi multi-agen](docs/chapter-06-pre-deployment/coordination-patterns.md) - Pola-pola

#### Latihan Praktis
```bash
# Terapkan solusi multi-agen ritel lengkap
cd examples/retail-multiagent-arm-template
./deploy.sh

# Jelajahi konfigurasi agen
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Hasil Bab**: Deploy dan kelola solusi AI multi-agen siap produksi dengan agen Customer dan Inventory

---

### 🔍 Bab 6: Validasi & Perencanaan Pra-Deployment
**Prasyarat**: Bab 4 selesai  
**Durasi**: 1 jam  
**Kompleksitas**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Perencanaan kapasitas dan validasi sumber daya
- Strategi pemilihan SKU
- Pemeriksaan pra-penerbangan dan otomasi

#### Sumber Belajar
- **📊 Perencanaan**: [Perencanaan Kapasitas](docs/chapter-06-pre-deployment/capacity-planning.md) - Validasi sumber daya
- **💰 Seleksi**: [Pemilihan SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Pilihan biaya efektif
- **✅ Validasi**: [Pemeriksaan Pra-penerbangan](docs/chapter-06-pre-deployment/preflight-checks.md) - Skrip otomatis

#### Latihan Praktis
- Jalankan skrip validasi kapasitas
- Optimalkan pilihan SKU untuk biaya
- Implementasikan pemeriksaan otomatis pra-deployment

**💡 Hasil Bab**: Validasi dan optimalkan deployment sebelum eksekusi

---

### 🚨 Bab 7: Pemecahan Masalah & Debugging
**Prasyarat**: Bab deployment mana saja telah selesai  
**Durasi**: 1-1,5 jam  
**Kompleksitas**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Pendekatan debugging sistematis
- Masalah umum dan solusi
- Pemecahan masalah khusus AI

#### Sumber Belajar
- **🔧 Masalah Umum**: [Masalah Umum](docs/chapter-07-troubleshooting/common-issues.md) - FAQ dan solusi
- **🕵️ Debugging**: [Panduan Debugging](docs/chapter-07-troubleshooting/debugging.md) - Strategi langkah demi langkah
- **🤖 Masalah AI**: [Pemecahan Masalah Khusus AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Masalah layanan AI

#### Latihan Praktis
- Diagnosa kegagalan deployment
- Selesaikan masalah otentikasi
- Debug konektivitas layanan AI

**💡 Hasil Bab**: Diagnosa mandiri dan selesaikan masalah deployment umum

---

### 🏢 Bab 8: Pola Produksi & Enterprise
**Prasyarat**: Bab 1-4 selesai  
**Durasi**: 2-3 jam  
**Kompleksitas**: ⭐⭐⭐⭐

#### Apa yang Akan Anda Pelajari
- Strategi deployment produksi
- Pola keamanan enterprise
- Pemantauan dan optimasi biaya

#### Sumber Belajar
- **🏭 Produksi**: [Praktik Terbaik AI Produksi](docs/chapter-08-production/production-ai-practices.md) - Pola enterprise
- **📝 Contoh**: [Contoh Microservices](../../examples/microservices) - Arsitektur kompleks
- **📊 Pemantauan**: [Integrasi Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Pemantauan

#### Latihan Praktis
- Implementasikan pola keamanan enterprise
- Siapkan pemantauan menyeluruh
- Deploy ke produksi dengan tata kelola yang tepat

**💡 Hasil Bab**: Deploy aplikasi siap enterprise dengan kemampuan produksi penuh

---

## 🎓 Ikhtisar Workshop: Pengalaman Belajar Praktis

> **⚠️ STATUS WORKSHOP: Pengembangan Aktif**  
> Materi workshop saat ini sedang dikembangkan dan disempurnakan. Modul inti berfungsi, tapi beberapa bagian lanjutan belum lengkap. Kami aktif bekerja menyelesaikan semua konten. [Lacak perkembangan →](workshop/README.md)

### Materi Workshop Interaktif
**Pembelajaran langsung komprehensif dengan alat berbasis browser dan latihan terpandu**

Materi workshop kami menyediakan pengalaman belajar interaktif terstruktur yang melengkapi kurikulum berbasis bab di atas. Workshop ini dirancang untuk pembelajaran mandiri maupun sesi yang dipandu instruktur.

#### 🛠️ Fitur Workshop
- **Antarmuka Berbasis Browser**: Workshop lengkap bertenaga MkDocs dengan fitur pencarian, salin, dan tema
- **Integrasi GitHub Codespaces**: Pengaturan lingkungan pengembangan dengan satu klik
- **Jalur Pembelajaran Terstruktur**: 8 modul latihan terpandu (total 3-4 jam)
- **Metode Progresif**: Pengantar → Seleksi → Validasi → Dekonstruksi → Konfigurasi → Kustomisasi → Pembongkaran → Penutup
- **Lingkungan DevContainer Interaktif**: Alat dan ketergantungan yang sudah dikonfigurasi sebelumnya

#### 📚 Struktur Modul Workshop
Workshop mengikuti **metode progresif 8 modul** yang membawa Anda dari penemuan hingga penguasaan deployment:

| Modul | Topik | Apa yang Akan Anda Lakukan | Durasi |
|--------|-------|----------------|----------|
| **0. Pengantar** | Ikhtisar Workshop | Memahami tujuan belajar, prasyarat, dan struktur workshop | 15 menit |
| **1. Seleksi** | Penemuan Template | Jelajahi template AZD dan pilih template AI yang sesuai untuk skenario Anda | 20 menit |
| **2. Validasi** | Deploy & Verifikasi | Deploy template dengan `azd up` dan verifikasi infrastruktur berfungsi | 30 menit |
| **3. Dekonstruksi** | Memahami Struktur | Gunakan GitHub Copilot untuk mengeksplorasi arsitektur template, file Bicep, dan organisasi kode | 30 menit |
| **4. Konfigurasi** | Pendalaman azure.yaml | Kuasai konfigurasi `azure.yaml`, lifecycle hooks, dan variabel lingkungan | 30 menit |
| **5. Kustomisasi** | Jadikan Milik Anda | Aktifkan AI Search, pelacakan, evaluasi, dan sesuaikan untuk skenario Anda | 45 menit |
| **6. Pembongkaran** | Bersihkan | Deprovision sumber daya dengan aman menggunakan `azd down --purge` | 15 menit |
| **7. Penutup** | Langkah Selanjutnya | Tinjau pencapaian, konsep utama, dan lanjutkan perjalanan belajar Anda | 15 menit |

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
# Ikuti instruksi pengaturan di workshop/README.md
```

#### 🎯 Hasil Belajar Workshop
Dengan menyelesaikan workshop, peserta akan:
- **Deploy Aplikasi AI Produksi**: Gunakan AZD dengan layanan Microsoft Foundry
- **Menguasai Arsitektur Multi-Agen**: Implementasi solusi AI agen terkoordinasi
- **Terapkan Praktik Keamanan Terbaik**: Konfigurasi otentikasi dan kontrol akses
- **Optimalkan untuk Skala**: Rancang deployment hemat biaya dan berkinerja tinggi
- **Pemecahan Masalah Deployment**: Selesaikan masalah umum secara mandiri

#### 📖 Sumber Daya Workshop
- **🎥 Panduan Interaktif**: [Materi Workshop](workshop/README.md) - Lingkungan belajar berbasis browser
- **📋 Instruksi per Modul**:
  - [0. Pengantar](workshop/docs/instructions/0-Introduction.md) - Ikhtisar dan tujuan workshop
  - [1. Seleksi](workshop/docs/instructions/1-Select-AI-Template.md) - Temukan dan pilih template AI
  - [2. Validasi](workshop/docs/instructions/2-Validate-AI-Template.md) - Deploy dan verifikasi template
  - [3. Dekonstruksi](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Eksplorasi arsitektur template
  - [4. Konfigurasi](workshop/docs/instructions/4-Configure-AI-Template.md) - Kuasai azure.yaml
  - [5. Kustomisasi](workshop/docs/instructions/5-Customize-AI-Template.md) - Sesuaikan untuk skenario Anda
  - [6. Pembongkaran](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Bersihkan sumber daya
  - [7. Penutup](workshop/docs/instructions/7-Wrap-up.md) - Tinjauan dan langkah selanjutnya
- **🛠️ Lab Workshop AI**: [Lab Workshop AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Latihan berfokus AI
- **💡 Mulai Cepat**: [Panduan Setup Workshop](workshop/README.md#quick-start) - Konfigurasi lingkungan

**Cocok untuk**: Pelatihan korporat, kursus universitas, pembelajaran mandiri, dan bootcamp pengembang.

---

## 📖 Pendalaman: Kapabilitas AZD

Lebih dari dasar, AZD menyediakan fitur kuat untuk deployment produksi:

- **Deployment berbasis template** - Gunakan template pra-bangun untuk pola aplikasi umum
- **Infrastructure as Code** - Kelola sumber daya Azure menggunakan Bicep atau Terraform  
- **Alur kerja terintegrasi** - Penyediaan, deployment, dan pemantauan aplikasi secara mulus
- **Ramah pengembang** - Dioptimalkan untuk produktivitas dan pengalaman pengembang

### **AZD + Microsoft Foundry: Sempurna untuk Deployment AI**

**Mengapa AZD untuk Solusi AI?** AZD mengatasi tantangan utama yang dihadapi pengembang AI:

- **Template Siap AI** - Template yang sudah dikonfigurasi untuk Microsoft Foundry Models, Layanan Azure AI, dan beban kerja ML
- **Deployment AI Aman** - Pola keamanan bawaan untuk layanan AI, kunci API, dan endpoint model  
- **Pola AI Produksi** - Praktik terbaik untuk deployment aplikasi AI yang skalabel dan hemat biaya
- **Alur Kerja AI End-to-End** - Dari pengembangan model hingga deployment produksi dengan pemantauan tepat
- **Optimasi Biaya** - Alokasi sumber daya dan strategi skala cerdas untuk beban kerja AI
- **Integrasi Microsoft Foundry** - Koneksi mulus ke katalog dan endpoint model Microsoft Foundry

---

## 🎯 Perpustakaan Template & Contoh

### Unggulan: Template Microsoft Foundry
**Mulai di sini jika Anda melakukan deployment aplikasi AI!**

> **Catatan:** Template ini menunjukkan berbagai pola AI. Beberapa adalah contoh Azure eksternal, lainnya implementasi lokal.

| Template | Bab | Kompleksitas | Layanan | Jenis |
|----------|---------|------------|----------|------|
| [**Mulai dengan obrolan AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bab 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Eksternal |
| [**Mulai dengan agen AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Bab 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Eksternal |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bab 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Eksternal |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bab 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Eksternal |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bab 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Eksternal |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Bab 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Eksternal |
| [**Solusi Multi-Agen Retail**](examples/retail-scenario.md) | Bab 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Unggulan: Skenario Pembelajaran Lengkap
**Template aplikasi siap produksi yang dipetakan ke bab pembelajaran**

| Template | Bab Pembelajaran | Kompleksitas | Pembelajaran Kunci |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bab 2 | ⭐ | Pola deployment AI dasar |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bab 2 | ⭐⭐ | Implementasi RAG dengan Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Bab 4 | ⭐⭐ | Integrasi Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bab 5 | ⭐⭐⭐ | Framework agen dan pemanggilan fungsi |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Bab 8 | ⭐⭐⭐ | Orkestrasi AI enterprise |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Bab 5 | ⭐⭐⭐⭐ | Arsitektur multi-agen dengan agen Customer dan Inventory |

### Pembelajaran Berdasarkan Jenis Contoh

> **📌 Contoh Lokal vs. Eksternal:**  
> **Contoh Lokal** (di repo ini) = Siap digunakan segera  
> **Contoh Eksternal** (Azure Samples) = Clone dari repositori terkait

#### Contoh Lokal (Siap Pakai)
- [**Solusi Multi-Agen Retail**](examples/retail-scenario.md) - Implementasi lengkap siap produksi dengan template ARM
  - Arsitektur multi-agen (agen Customer + Inventory)
  - Pemantauan dan evaluasi komprehensif
  - Deployment satu klik via template ARM

#### Contoh Lokal - Aplikasi Kontainer (Bab 2-5)
**Contoh deployment kontainer komprehensif dalam repositori ini:**

- [**Contoh Aplikasi Kontainer**](examples/container-app/README.md) - Panduan lengkap untuk deployment terkontainerisasi
  - [API Flask Sederhana](../../examples/container-app/simple-flask-api) - REST API dasar dengan scale-to-zero
  - [Arsitektur Mikroservis](../../examples/container-app/microservices) - Deployment multi-layanan siap produksi
  - Pola deployment Mulai Cepat, Produksi, dan Lanjutan
  - Panduan pemantauan, keamanan, dan optimisasi biaya

#### Contoh Eksternal - Aplikasi Sederhana (Bab 1-2)
**Clone repositori Contoh Azure ini untuk memulai:**
- [Aplikasi Web Sederhana - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pola deployment dasar
- [Website Statis - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Deployment konten statis
- [Aplikasi Kontainer - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Deployment REST API

#### Contoh Eksternal - Integrasi Database (Bab 3-4)  
- [Aplikasi Database - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Pola konektivitas database
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Alur kerja data tanpa server

#### Contoh Eksternal - Pola Lanjutan (Bab 4-8)
- [Mikroservis Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arsitektur multi-layanan
- [Jobs Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Pemrosesan latar belakang  
- [Pipeline ML Enterprise](https://github.com/Azure-Samples/mlops-v2) - Pola ML siap produksi

### Koleksi Template Eksternal
- [**Galeri Template Resmi AZD**](https://azure.github.io/awesome-azd/) - Koleksi kurasi template resmi dan komunitas
- [**Template Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasi template Microsoft Learn
- [**Direktori Contoh**](examples/README.md) - Contoh pembelajaran lokal dengan penjelasan rinci

---

## 📚 Sumber Belajar & Referensi

### Referensi Cepat
- [**Daftar Perintah Cheat Sheet**](resources/cheat-sheet.md) - Perintah azd penting diatur per bab
- [**Glosarium**](resources/glossary.md) - Terminologi Azure dan azd  
- [**FAQ**](resources/faq.md) - Pertanyaan umum diatur per bab pembelajaran
- [**Panduan Studi**](resources/study-guide.md) - Latihan praktik komprehensif

### Workshop Praktik Langsung
- [**Lab Workshop AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Buat solusi AI Anda dapat dideploy dengan AZD (2-3 jam)
- [**Workshop Interaktif**](workshop/README.md) - Latihan terpandu 8 modul dengan MkDocs dan GitHub Codespaces
  - Mengikuti: Pengenalan → Pemilihan → Validasi → Dekonstruksi → Konfigurasi → Kustomisasi → Pembongkaran → Penutup

### Sumber Belajar Eksternal
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulator Harga Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status Azure](https://status.azure.com/)

### Keterampilan Agen AI untuk Editor Anda
- [**Keterampilan Microsoft Azure di skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 keterampilan agen terbuka untuk Azure AI, Foundry, deployment, diagnostik, optimasi biaya, dan lainnya. Pasang di GitHub Copilot, Cursor, Claude Code, atau agen yang didukung:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Panduan Pemecahan Masalah Cepat

**Masalah umum yang dihadapi pemula dan solusi segera:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

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
<summary><strong>❌ "No subscription found" atau "Subscription not set"</strong></summary>

```bash
# Daftar langganan yang tersedia
az account list --output table

# Atur langganan default
az account set --subscription "<subscription-id-or-name>"

# Atur untuk lingkungan AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verifikasi
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" atau "Quota exceeded"</strong></summary>

```bash
# Coba wilayah Azure yang berbeda
azd env set AZURE_LOCATION "westus2"
azd up

# Atau gunakan SKU yang lebih kecil dalam pengembangan
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" gagal di tengah jalan</strong></summary>

```bash
# Opsi 1: Bersihkan dan coba lagi
azd down --force --purge
azd up

# Opsi 2: Hanya perbaiki infrastruktur
azd provision

# Opsi 3: Periksa status rinci
azd show

# Opsi 4: Periksa log di Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" atau "Token expired"</strong></summary>

```bash
# Autentikasi ulang untuk AZD
azd auth logout
azd auth login

# Opsional: segarkan Azure CLI juga jika Anda menjalankan perintah az
az logout
az login

# Verifikasi otentikasi
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" atau konflik penamaan</strong></summary>

```bash
# AZD menghasilkan nama unik, tetapi jika terjadi konflik:
azd down --force --purge

# Kemudian coba lagi dengan lingkungan baru
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Deployment template terlalu lama</strong></summary>

**Waktu tunggu normal:**
- Aplikasi web sederhana: 5-10 menit
- Aplikasi dengan database: 10-15 menit
- Aplikasi AI: 15-25 menit (OpenAI provisioning lambat)

```bash
# Periksa kemajuan
azd show

# Jika terhenti >30 menit, periksa Portal Azure:
azd monitor --overview
# Cari deployment yang gagal
```
</details>

<details>
<summary><strong>❌ "Permission denied" atau "Forbidden"</strong></summary>

```bash
# Periksa peran Azure Anda
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Anda membutuhkan peran minimal "Kontributor"
# Minta admin Azure Anda untuk memberikan:
# - Kontributor (untuk sumber daya)
# - Administrator Akses Pengguna (untuk penugasan peran)
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

### 📚 Sumber Daya Lengkap Pemecahan Masalah

- **Panduan Masalah Umum:** [Solusi Lengkap](docs/chapter-07-troubleshooting/common-issues.md)
- **Masalah Khusus AI:** [Pemecahan Masalah AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Panduan Debugging:** [Debugging Langkah demi Langkah](docs/chapter-07-troubleshooting/debugging.md)
- **Dapatkan Bantuan:** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Penyelesaian Kursus & Sertifikasi

### Pelacakan Progres
Lacak kemajuan belajar Anda melalui setiap bab:

- [ ] **Bab 1**: Dasar & Mulai Cepat ✅
- [ ] **Bab 2**: Pengembangan AI-Utama ✅  
- [ ] **Bab 3**: Konfigurasi & Otentikasi ✅
- [ ] **Bab 4**: Infrastruktur sebagai Kode & Deployment ✅
- [ ] **Bab 5**: Solusi AI Multi-Agen ✅
- [ ] **Bab 6**: Validasi & Perencanaan Pra-Deployment ✅
- [ ] **Bab 7**: Pemecahan Masalah & Debugging ✅
- [ ] **Bab 8**: Pola Produksi & Enterprise ✅

### Verifikasi Pembelajaran
Setelah menyelesaikan setiap bab, verifikasi pengetahuan Anda dengan:
1. **Latihan Praktis**: Selesaikan deployment langsung dari bab tersebut
2. **Pengecekan Pengetahuan**: Tinjau bagian FAQ untuk bab Anda
3. **Diskusi Komunitas**: Bagikan pengalaman Anda di Discord Azure
4. **Bab Berikutnya**: Lanjutkan ke tingkat kompleksitas berikutnya

### Manfaat Penyelesaian Kursus
Setelah menyelesaikan semua bab, Anda akan memiliki:
- **Pengalaman Produksi**: Mendeploy aplikasi AI nyata ke Azure
- **Keahlian Profesional**: Kemampuan deployment siap enterprise  
- **Pengakuan Komunitas**: Anggota aktif komunitas developer Azure
- **Kemajuan Karir**: Keahlian AZD dan deployment AI yang dicari

---

## 🤝 Komunitas & Dukungan

### Dapatkan Bantuan & Dukungan
- **Masalah Teknis**: [Laporkan bug dan minta fitur](https://github.com/microsoft/azd-for-beginners/issues)
- **Pertanyaan Pembelajaran**: [Komunitas Discord Microsoft Azure](https://discord.gg/microsoft-azure) dan [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Bantuan Khusus AI**: Bergabung dengan [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasi**: [Dokumentasi resmi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Wawasan Komunitas dari Microsoft Foundry Discord

**Hasil Polling Terbaru dari Saluran #Azure:**
- **45%** developer ingin menggunakan AZD untuk beban kerja AI
- **Tantangan utama**: Deployment multi-layanan, manajemen kredensial, kesiapan produksi  
- **Paling diminta**: Template khusus AI, panduan pemecahan masalah, praktik terbaik

**Bergabung dengan komunitas kami untuk:**
- Bagikan pengalaman AZD + AI dan dapatkan bantuan
- Akses preview awal template AI baru
- Kontribusi terhadap praktik terbaik deployment AI
- Pengaruh pengembangan fitur AI + AZD di masa depan

### Kontribusi pada Kursus
Kami menyambut kontribusi! Silakan baca [Panduan Kontribusi](CONTRIBUTING.md) untuk detail tentang:
- **Peningkatan Konten**: Perbaiki bab dan contoh yang ada
- **Contoh Baru**: Tambahkan skenario dan template dunia nyata  
- **Terjemahan**: Bantu pertahankan dukungan multi-bahasa
- **Laporan Bug**: Tingkatkan akurasi dan kejelasan
- **Standar Komunitas**: Ikuti panduan komunitas inklusif kami

---

## 📄 Informasi Kursus

### Lisensi
Proyek ini dilisensikan di bawah Lisensi MIT - lihat file [LICENSE](../../LICENSE) untuk detail.

### Sumber Pembelajaran Microsoft Terkait

Tim kami menghasilkan kursus pembelajaran komprehensif lainnya:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j untuk Pemula](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js untuk Pemula](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain untuk Pemula](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agen
[![AZD untuk Pemula](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI untuk Pemula](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP untuk Pemula](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Agen AI untuk Pemula](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Seri AI Generatif
[![AI Generatif untuk Pemula](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Generatif (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI Generatif (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Pembelajaran Inti
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Seri Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigasi Kursus

**🚀 Siap untuk Memulai Pembelajaran?**

**Pemula**: Mulai dengan [Bab 1: Dasar & Mulai Cepat](#-chapter-1-foundation--quick-start)  
**Pengembang AI**: Langsung ke [Bab 2: Pengembangan AI-Pertama](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Pengembang Berpengalaman**: Mulai dengan [Bab 3: Konfigurasi & Otentikasi](#️-chapter-3-configuration--authentication)

**Langkah Selanjutnya**: [Mulai Bab 1 - Dasar AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->