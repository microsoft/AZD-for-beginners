# AZD For Beginners: A Structured Learning Journey

![AZD-untuk-pemula](../../translated_images/id/azdbeginners.5527441dd9f74068.webp) 

[![Pengamat GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Fork GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Bintang GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Terjemahan Otomatis (Selalu Terbaru)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](./README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Lebih Suka Mengkloning Secara Lokal?**
>
> Repositori ini menyertakan 50+ terjemahan bahasa yang secara signifikan menambah ukuran unduhan. Untuk mengkloning tanpa terjemahan, gunakan sparse checkout:
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
> Ini memberi Anda semua yang diperlukan untuk menyelesaikan kursus dengan unduhan yang jauh lebih cepat.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Apa itu Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** adalah alat baris perintah yang ramah-pengembang yang mempermudah penerapan aplikasi ke Azure. Alih-alih membuat dan menghubungkan puluhan sumber daya Azure secara manual, Anda dapat menerapkan seluruh aplikasi dengan satu perintah.

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

**Itu saja!** Tidak perlu mengklik Azure Portal, tidak perlu mempelajari template ARM yang kompleks terlebih dahulu, tidak ada konfigurasi manual - hanya aplikasi yang berjalan di Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Apa Bedanya?

Ini adalah pertanyaan paling umum yang diajukan pemula. Berikut jawaban sederhananya:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Tujuan** | Mengelola sumber daya Azure individu | Menerapkan aplikasi lengkap |
| **Polanya** | Berfokus pada infrastruktur | Berfokus pada aplikasi |
| **Contoh** | `az webapp create --name myapp...` | `azd up` |
| **Kurva Pembelajaran** | Harus tahu layanan Azure | Cukup tahu aplikasi Anda |
| **Cocok Untuk** | DevOps, Infrastruktur | Pengembang, Prototyping |

### Analogi Sederhana

- **Azure CLI** seperti memiliki semua alat untuk membangun rumah - palu, gergaji, paku. Anda bisa membangun apa saja, tetapi Anda harus tahu konstruksi.
- **Azure Developer CLI** seperti menyewa kontraktor - Anda menjelaskan apa yang Anda inginkan, dan mereka menangani pembangunannya.

### Kapan Menggunakan Masing-Masing

| Scenario | Gunakan Ini |
|----------|----------|
| "Saya ingin menerapkan web app saya dengan cepat" | `azd up` |
| "Saya hanya perlu membuat akun storage" | `az storage account create` |
| "Saya sedang membangun aplikasi AI penuh" | `azd init --template azure-search-openai-demo` |
| "Saya perlu men-debug sumber daya Azure tertentu" | `az resource show` |
| "Saya ingin deployment siap-produksi dalam hitungan menit" | `azd up --environment production` |

### Mereka Bekerja Bersama!

AZD menggunakan Azure CLI di bawahnya. Anda dapat menggunakan keduanya:
```bash
# Deploy aplikasi Anda dengan AZD
azd up

# Lalu sesuaikan sumber daya tertentu dengan Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Temukan Template di Awesome AZD

Jangan mulai dari nol! **Awesome AZD** adalah koleksi komunitas dari template siap-untuk-dideploy:

| Resource | Deskripsi |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Telusuri 200+ template dengan deploy satu-klik |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Kontribusikan template Anda ke komunitas |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Beri bintang dan jelajahi sumbernya |

### Template AI Populer dari Awesome AZD

```bash
# Obrolan RAG dengan Azure OpenAI + Pencarian AI
azd init --template azure-search-openai-demo

# Aplikasi Obrolan AI Cepat
azd init --template openai-chat-app-quickstart

# Agen AI dengan Agen Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Memulai dalam 3 Langkah

### Langkah 1: Install AZD (2 menit)

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

### Langkah 2: Login ke Azure

```bash
azd auth login
```

### Langkah 3: Deploy Aplikasi Pertama Anda

```bash
# Inisialisasi dari templat
azd init --template todo-nodejs-mongo

# Deploy ke Azure (membuat semuanya!)
azd up
```

**🎉 Selesai!** Aplikasi Anda sekarang hidup di Azure.

### Bersihkan (Jangan Lupa!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cara Menggunakan Kursus Ini

Kursus ini dirancang untuk pembelajaran progresif - mulailah dari tempat Anda nyaman dan naikkan tingkat kesulitan:

| Pengalaman Anda | Mulai Di Sini |
|-----------------|------------|
| **Baru di Azure** | [Chapter 1: Foundation](../..) |
| **Tahu Azure, baru dengan AZD** | [Chapter 1: Foundation](../..) |
| **Ingin menerapkan aplikasi AI** | [Chapter 2: AI-First Development](../..) |
| **Ingin praktik langsung** | [🎓 Interactive Workshop](workshop/README.md) - lab berpemandu 3-4 jam |
| **Butuh pola untuk produksi** | [Chapter 8: Production & Enterprise](../..) |

### Persiapan Cepat

1. **Fork Repositori Ini**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Dapatkan Bantuan**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Lebih Suka Mengkloning Secara Lokal?**
>
> Repositori ini menyertakan 50+ terjemahan bahasa yang secara signifikan menambah ukuran unduhan. Untuk mengkloning tanpa terjemahan, gunakan sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ini memberi Anda semua yang diperlukan untuk menyelesaikan kursus dengan unduhan yang jauh lebih cepat.


## Ikhtisar Kursus

Kuasi Azure Developer CLI (azd) melalui bab-bab terstruktur yang dirancang untuk pembelajaran progresif. **Fokus khusus pada penerapan aplikasi AI dengan integrasi Microsoft Foundry.**

### Mengapa Kursus Ini Penting untuk Pengembang Modern

Berdasarkan wawasan komunitas Microsoft Foundry Discord, **45% pengembang ingin menggunakan AZD untuk beban kerja AI** namun menghadapi tantangan dengan:
- Arsitektur AI multi-layanan yang kompleks
- Praktik terbaik deployment AI untuk produksi  
- Integrasi dan konfigurasi layanan Azure AI
- Optimalisasi biaya untuk beban kerja AI
- Pemecahan masalah khusus deployment AI

### Tujuan Pembelajaran

Dengan menyelesaikan kursus terstruktur ini, Anda akan:
- **Menguasai Dasar AZD**: Konsep inti, instalasi, dan konfigurasi
- **Menerapkan Aplikasi AI**: Gunakan AZD dengan layanan Microsoft Foundry
- **Mengimplementasikan Infrastruktur sebagai Kode**: Kelola sumber daya Azure dengan template Bicep
- **Memecahkan Masalah Deployment**: Menyelesaikan isu umum dan melakukan debug
- **Mengoptimalkan untuk Produksi**: Keamanan, penskalaan, pemantauan, dan manajemen biaya
- **Membangun Solusi Multi-Agen**: Menerapkan arsitektur AI yang kompleks

## 🗺️ Peta Kursus: Navigasi Cepat per Bab

Setiap bab memiliki README khusus dengan tujuan pembelajaran, quick start, dan latihan:

| Chapter | Topik | Pelajaran | Durasi | Kompleksitas |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Memulai | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | Aplikasi Berfokus AI | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | Auth & Keamanan | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐
| **[Ch 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Penyebaran | [Panduan Penyebaran](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Penyediaan](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 jam | ⭐⭐⭐ |
| **[Ch 5: Multi-Agen](docs/chapter-05-multi-agent/README.md)** | Solusi Agen AI | [Skenario Ritel](examples/retail-scenario.md) &#124; [Pola Koordinasi](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 jam | ⭐⭐⭐⭐ |
| **[Ch 6: Pra-Penyebaran](docs/chapter-06-pre-deployment/README.md)** | Perencanaan & Validasi | [Pemeriksaan Pra-penerapan](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Perencanaan Kapasitas](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Pemilihan SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 jam | ⭐⭐ |
| **[Ch 7: Pemecahan Masalah](docs/chapter-07-troubleshooting/README.md)** | Debug & Perbaikan | [Masalah Umum](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [Masalah AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 jam | ⭐⭐ |
| **[Ch 8: Produksi](docs/chapter-08-production/README.md)** | Pola Perusahaan | [Praktik Produksi](docs/chapter-08-production/production-ai-practices.md) | 2-3 jam | ⭐⭐⭐⭐ |
| **[🎓 Lokakarya](workshop/README.md)** | Lab Praktik | [Pengenalan](workshop/docs/instructions/0-Introduction.md) &#124; [Pemilihan](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validasi](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Dekonstruksi](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurasi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Kustomisasi](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Pembongkaran](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Penutupan](workshop/docs/instructions/7-Wrap-up.md) | 3-4 jam | ⭐⭐ |

**Total Durasi Kursus:** ~10-14 jam | **Perkembangan Keterampilan:** Pemula → Siap Produksi

---

## 📚 Bab Pembelajaran

*Pilih jalur pembelajaran Anda berdasarkan tingkat pengalaman dan tujuan*

### 🚀 Bab 1: Dasar & Mulai Cepat
**Prasyarat**: langganan Azure, pengetahuan dasar baris perintah  
**Durasi**: 30-45 menit  
**Kompleksitas**: ⭐

#### Apa yang Akan Anda Pelajari
- Memahami dasar-dasar Azure Developer CLI
- Menginstal AZD di platform Anda
- Penerapan sukses pertama Anda

#### Sumber Pembelajaran
- **🎯 Mulai Di Sini**: [Apa itu Azure Developer CLI?](../..)
- **📖 Teori**: [Dasar AZD](docs/chapter-01-foundation/azd-basics.md) - Konsep inti dan terminologi
- **⚙️ Pengaturan**: [Instalasi & Pengaturan](docs/chapter-01-foundation/installation.md) - Panduan spesifik platform
- **🛠️ Praktik**: [Proyek Pertama Anda](docs/chapter-01-foundation/first-project.md) - Tutorial langkah demi langkah
- **📋 Referensi Cepat**: [Cheat Sheet Perintah](resources/cheat-sheet.md)

#### Latihan Praktis
```bash
# Pemeriksaan instalasi cepat
azd version

# Sebarkan aplikasi pertama Anda
azd init --template todo-nodejs-mongo
azd up
```

**💡 Hasil Bab**: Berhasil menyebarkan aplikasi web sederhana ke Azure menggunakan AZD

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

**📊 Estimasi Waktu:** 30-45 menit  
**📈 Tingkat Keterampilan Setelah:** Dapat menyebarkan aplikasi dasar secara mandiri

**✅ Validasi Keberhasilan:**
```bash
# Setelah menyelesaikan Bab 1, Anda seharusnya dapat:
azd version              # Menampilkan versi yang terpasang
azd init --template todo-nodejs-mongo  # Menginisialisasi proyek
azd up                  # Menerapkan ke Azure
azd show                # Menampilkan URL aplikasi yang berjalan
# Aplikasi terbuka di peramban dan berfungsi
azd down --force --purge  # Membersihkan sumber daya
```

**📊 Estimasi Waktu:** 30-45 menit  
**📈 Tingkat Keterampilan Setelah:** Dapat menyebarkan aplikasi dasar secara mandiri

---

### 🤖 Bab 2: Pengembangan Berfokus AI (Direkomendasikan untuk Pengembang AI)
**Prasyarat**: Bab 1 selesai  
**Durasi**: 1-2 jam  
**Kompleksitas**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Integrasi Microsoft Foundry dengan AZD
- Menyebarkan aplikasi bertenaga AI
- Memahami konfigurasi layanan AI

#### Sumber Pembelajaran
- **🎯 Mulai Di Sini**: [Integrasi Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agen AI**: [Panduan Agen AI](docs/chapter-02-ai-development/agents.md) - Menyebarkan agen cerdas dengan AZD
- **📖 Pola**: [Penyebaran Model AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Menyebarkan dan mengelola model AI
- **🛠️ Lokakarya**: [Lab Lokakarya AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Menyiapkan solusi AI Anda agar siap AZD
- **🎥 Panduan Interaktif**: [Materi Lokakarya](workshop/README.md) - Pembelajaran berbasis browser dengan MkDocs * DevContainer Environment
- **📋 Template**: [Template Microsoft Foundry](../..)
- **📝 Contoh**: [Contoh Penyebaran AZD](examples/README.md)

#### Latihan Praktis
```bash
# Terapkan aplikasi AI pertama Anda
azd init --template azure-search-openai-demo
azd up

# Coba template AI tambahan
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Hasil Bab**: Menyebarkan dan mengonfigurasi aplikasi chat bertenaga AI dengan kemampuan RAG

**✅ Validasi Keberhasilan:**
```bash
# Setelah Bab 2, Anda seharusnya dapat:
azd init --template azure-search-openai-demo
azd up
# Menguji antarmuka obrolan AI
# Mengajukan pertanyaan dan mendapatkan respons bertenaga AI beserta sumbernya
# Memverifikasi bahwa integrasi pencarian berfungsi
azd monitor  # Memeriksa bahwa Application Insights menampilkan telemetri
azd down --force --purge
```

**📊 Estimasi Waktu:** 1-2 jam  
**📈 Tingkat Keterampilan Setelah:** Dapat menyebarkan dan mengonfigurasi aplikasi AI siap produksi  
**💰 Kesadaran Biaya:** Pahami biaya pengembangan $80-150/bulan, biaya produksi $300-3500/bulan

#### 💰 Pertimbangan Biaya untuk Penyebaran AI

**Lingkungan Pengembangan (Perkiraan $80-150/bulan):**
- Azure OpenAI (Bayar sesuai pemakaian): $0-50/bulan (berdasarkan penggunaan token)
- AI Search (Basic tier): $75/bulan
- Container Apps (Consumption): $0-20/bulan
- Penyimpanan (Standar): $1-5/bulan

**Lingkungan Produksi (Perkiraan $300-3,500+/bulan):**
- Azure OpenAI (PTU untuk kinerja konsisten): $3,000+/bulan ATAU Bayar sesuai pemakaian dengan volume tinggi
- AI Search (Standard tier): $250/bulan
- Container Apps (Dedicated): $50-100/bulan
- Application Insights: $5-50/bulan
- Penyimpanan (Premium): $10-50/bulan

**💡 Tips Optimisasi Biaya:**
- Gunakan **Free Tier** Azure OpenAI untuk pembelajaran (50,000 tokens/bulan termasuk)
- Jalankan `azd down` untuk melepaskan alokasi sumber daya ketika tidak sedang mengembangkan
- Mulai dengan penagihan berbasis konsumsi, upgrade ke PTU hanya untuk produksi
- Gunakan `azd provision --preview` untuk memperkirakan biaya sebelum penyebaran
- Aktifkan auto-scaling: bayar hanya untuk penggunaan aktual

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
- Konfigurasi dan manajemen lingkungan
- Otentikasi dan praktik terbaik keamanan
- Penamaan dan pengorganisasian sumber daya

#### Sumber Pembelajaran
- **📖 Konfigurasi**: [Panduan Konfigurasi](docs/chapter-03-configuration/configuration.md) - Pengaturan lingkungan
- **🔐 Keamanan**: [Pola otentikasi dan managed identity](docs/chapter-03-configuration/authsecurity.md) - Pola otentikasi
- **📝 Contoh**: [Contoh Aplikasi Database](examples/database-app/README.md) - Contoh Database AZD

#### Latihan Praktis
- Konfigurasikan beberapa lingkungan (dev, staging, prod)
- Siapkan otentikasi managed identity
- Terapkan konfigurasi khusus lingkungan

**💡 Hasil Bab**: Mengelola beberapa lingkungan dengan otentikasi dan keamanan yang tepat

---

### 🏗️ Bab 4: Infrastruktur sebagai Kode & Penyebaran
**Prasyarat**: Bab 1-3 selesai  
**Durasi**: 1-1.5 jam  
**Kompleksitas**: ⭐⭐⭐

#### Apa yang Akan Anda Pelajari
- Pola penyebaran lanjutan
- Infrastruktur sebagai Kode dengan Bicep
- Strategi penyediaan sumber daya

#### Sumber Pembelajaran
- **📖 Penyebaran**: [Panduan Penyebaran](docs/chapter-04-infrastructure/deployment-guide.md) - Alur kerja lengkap
- **🏗️ Penyediaan**: [Penyediaan Sumber Daya](docs/chapter-04-infrastructure/provisioning.md) - Manajemen sumber daya Azure
- **📝 Contoh**: [Contoh Aplikasi Container](../../examples/container-app) - Penyebaran berbasis container

#### Latihan Praktis
- Buat template Bicep kustom
- Sebarkan aplikasi multi-layanan
- Terapkan strategi penyebaran blue-green

**💡 Hasil Bab**: Menyebarkan aplikasi multi-layanan kompleks menggunakan template infrastruktur kustom

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
- **🤖 Proyek Unggulan**: [Solusi Multi-Agen Ritel](examples/retail-scenario.md) - Implementasi lengkap
- **🛠️ Template ARM**: [Paket Template ARM](../../examples/retail-multiagent-arm-template) - Penyebaran satu-klik
- **📖 Arsitektur**: [Pola koordinasi multi-agen](docs/chapter-06-pre-deployment/coordination-patterns.md) - Pola

#### Latihan Praktis
```bash
# Terapkan solusi multi-agen ritel lengkap
cd examples/retail-multiagent-arm-template
./deploy.sh

# Jelajahi konfigurasi agen
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Hasil Bab**: Menyebarkan dan mengelola solusi AI multi-agen siap produksi dengan agen Pelanggan dan Inventaris

---

### 🔍 Bab 6: Validasi & Perencanaan Pra-Penyebaran
**Prasyarat**: Bab 4 selesai  
**Durasi**: 1 jam  
**Kompleksitas**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Perencanaan kapasitas dan validasi sumber daya
- Strategi pemilihan SKU
- Pemeriksaan pra-penerapan dan automasi

#### Sumber Pembelajaran
- **📊 Perencanaan**: [Perencanaan Kapasitas](docs/chapter-06-pre-deployment/capacity-planning.md) - Validasi sumber daya
- **💰 Pemilihan**: [Pemilihan SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Pilihan hemat biaya
- **✅ Validasi**: [Pemeriksaan Pra-penerapan](docs/chapter-06-pre-deployment/preflight-checks.md) - Skrip otomatis

#### Latihan Praktis
- Jalankan skrip validasi kapasitas
- Optimalkan pemilihan SKU untuk biaya
- Terapkan pemeriksaan pra-penyebaran otomatis

**💡 Hasil Bab**: Memvalidasi dan mengoptimalkan penyebaran sebelum eksekusi

---

### 🚨 Bab 7: Pemecahan Masalah & Debugging
**Prasyarat**: Setiap bab penyebaran selesai  
**Durasi**: 1-1.5 jam  
**Kompleksitas**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Pendekatan debugging sistematis
- Masalah umum dan solusinya
- Pemecahan masalah khusus AI

#### Sumber Pembelajaran
- **🔧 Masalah Umum**: [Masalah Umum](docs/chapter-07-troubleshooting/common-issues.md) - FAQ dan solusi
- **🕵️ Debugging**: [Panduan Debugging](docs/chapter-07-troubleshooting/debugging.md) - Strategi langkah demi langkah
- **🤖 Masalah AI**: [Pemecahan Masalah Khusus AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Masalah layanan AI

#### Latihan Praktis
- Diagnosa kegagalan penyebaran
- Selesaikan masalah otentikasi
- Debug konektivitas layanan AI

**💡 Hasil Bab**: Mendiagnosis dan menyelesaikan masalah penyebaran umum secara mandiri

---

### 🏢 Bab 8: Produksi & Pola Perusahaan
**Prasyarat**: Bab 1-4 selesai  
**Durasi**: 2-3 jam  
**Kompleksitas**: ⭐⭐⭐⭐

#### Apa yang Akan Anda Pelajari
- Strategi penyebaran produksi
- Pola keamanan perusahaan
- Pemantauan dan optimisasi biaya

#### Sumber Pembelajaran
- **🏭 Produksi**: [Praktik Terbaik AI Produksi](docs/chapter-08-production/production-ai-practices.md) - Pola perusahaan
- **📝 Contoh**: [Contoh Microservices](../../examples/microservices) - Arsitektur kompleks
- **📊 Pemantauan**: [Integrasi Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Pemantauan

#### Latihan Praktis
- Terapkan pola keamanan perusahaan
- Siapkan pemantauan menyeluruh
- Sebarkan ke produksi dengan tata kelola yang tepat

**💡 Hasil Bab**: Menyebarkan aplikasi siap perusahaan dengan kapabilitas produksi penuh

---

## 🎓 Ikhtisar Lokakarya: Pengalaman Pembelajaran Praktis

> **⚠️ STATUS LOKAKARYA: Sedang Dalam Pengembangan**
> Materi workshop saat ini sedang dikembangkan dan diperbaiki. Modul inti berfungsi, tetapi beberapa bagian lanjutan belum lengkap. Kami sedang aktif bekerja untuk menyelesaikan semua konten. [Lacak kemajuan →](workshop/README.md)

### Bahan Workshop Interaktif
**Pembelajaran praktis yang komprehensif dengan alat berbasis browser dan latihan berpemandu**

Materi workshop kami menyediakan pengalaman pembelajaran interaktif yang terstruktur yang melengkapi kurikulum berbasis bab di atas. Workshop dirancang untuk pembelajaran mandiri maupun sesi yang dipimpin instruktur.

#### 🛠️ Fitur Workshop
- **Antarmuka Berbasis Browser**: Workshop lengkap bertenaga MkDocs dengan fitur pencarian, salin, dan tema
- **Integrasi GitHub Codespaces**: Pengaturan lingkungan pengembangan dengan satu klik
- **Jalur Pembelajaran Terstruktur**: 8 modul latihan berpemandu (3-4 jam total)
- **Metodologi Progresif**: Pengenalan → Seleksi → Validasi → Dekonstruksi → Konfigurasi → Kustomisasi → Pembongkaran → Penutupan
- **Lingkungan DevContainer Interaktif**: Alat dan dependensi yang sudah dikonfigurasi sebelumnya

#### 📚 Struktur Modul Workshop
Workshop mengikuti **metodologi progresif 8-modul** yang membawa Anda dari penemuan hingga penguasaan deployment:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | Understand learning objectives, prerequisites, and workshop structure | 15 min |
| **1. Selection** | Template Discovery | Explore AZD templates and select the right AI template for your scenario | 20 min |
| **2. Validation** | Deploy & Verify | Deploy the template with `azd up` and validate infrastructure works | 30 min |
| **3. Deconstruction** | Understand Structure | Use GitHub Copilot to explore template architecture, Bicep files, and code organization | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | Master `azure.yaml` configuration, lifecycle hooks, and environment variables | 30 min |
| **5. Customization** | Make It Yours | Enable AI Search, tracing, evaluation, and customize for your scenario | 45 min |
| **6. Teardown** | Clean Up | Safely deprovision resources with `azd down --purge` | 15 min |
| **7. Wrap-up** | Next Steps | Review accomplishments, key concepts, and continue your learning journey | 15 min |

**Alur Workshop:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Memulai dengan Workshop
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
- **Menguasai Arsitektur Multi-Agent**: Menerapkan solusi agen AI terkoordinasi
- **Menerapkan Praktik Keamanan Terbaik**: Konfigurasikan otentikasi dan kontrol akses
- **Mengoptimalkan untuk Skalabilitas**: Rancang deployment yang hemat biaya dan berkinerja tinggi
- **Memecahkan Masalah Deployment**: Menyelesaikan masalah umum secara mandiri

#### 📖 Sumber Daya Workshop
- **🎥 Panduan Interaktif**: [Materi Workshop](workshop/README.md) - Lingkungan pembelajaran berbasis browser
- **📋 Instruksi Per Modul**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Ikhtisar workshop dan tujuan
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Temukan dan pilih template AI
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Terapkan dan verifikasi template
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Jelajahi arsitektur template
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Kuasai azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Sesuaikan untuk skenario Anda
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Membersihkan sumber daya
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Tinjauan dan langkah selanjutnya
- **🛠️ Lab Workshop AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Latihan berfokus AI
- **💡 Mulai Cepat**: [Panduan Pengaturan Workshop](workshop/README.md#quick-start) - Konfigurasi lingkungan

**Cocok untuk**: Pelatihan korporat, kursus universitas, pembelajaran mandiri, dan bootcamp pengembang.

---

## 📖 Pendalaman: Kemampuan AZD

Di luar dasar-dasar, AZD menyediakan fitur kuat untuk deployment produksi:

- **Deployment berbasis template** - Gunakan template pra-bangun untuk pola aplikasi umum
- **Infrastruktur sebagai Kode** - Kelola sumber daya Azure menggunakan Bicep atau Terraform  
- **Alur kerja terintegrasi** - Provisi, deploy, dan monitor aplikasi secara mulus
- **Ramah Pengembang** - Dioptimalkan untuk produktivitas dan pengalaman pengembang

### **AZD + Microsoft Foundry: Sempurna untuk Penerapan AI**

**Mengapa AZD untuk Solusi AI?** AZD mengatasi tantangan utama yang dihadapi pengembang AI:

- **Template Siap-AI** - Template yang sudah dikonfigurasi untuk Azure OpenAI, Cognitive Services, dan beban kerja ML
- **Penerapan AI yang Aman** - Pola keamanan bawaan untuk layanan AI, kunci API, dan endpoint model  
- **Pola AI Produksi** - Praktik terbaik untuk deployment aplikasi AI yang skalabel dan hemat biaya
- **Alur Kerja AI Ujung-ke-Ujung** - Dari pengembangan model hingga deployment produksi dengan pemantauan yang tepat
- **Optimisasi Biaya** - Alokasi sumber daya dan strategi penskalaan yang cerdas untuk beban kerja AI
- **Integrasi Microsoft Foundry** - Koneksi mulus ke katalog model dan endpoint Microsoft Foundry

---

## 🎯 Perpustakaan Template & Contoh

### Unggulan: Template Microsoft Foundry
**Mulai di sini jika Anda menerapkan aplikasi AI!**

> **Catatan:** Template ini menunjukkan berbagai pola AI. Beberapa berasal dari Azure Samples eksternal, lainnya adalah implementasi lokal.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Unggulan: Skenario Pembelajaran Lengkap
**Template aplikasi siap produksi yang dipetakan ke bab pembelajaran**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### Pembelajaran Berdasarkan Jenis Contoh

> **📌 Contoh Lokal vs. Eksternal:**  
> **Contoh Lokal** (di repositori ini) = Siap digunakan segera  
> **Contoh Eksternal** (Azure Samples) = Clone dari repositori yang ditautkan

#### Contoh Lokal (Siap Digunakan)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Implementasi siap produksi lengkap dengan template ARM
  - Arsitektur multi-agent (agen Pelanggan + agen Inventaris)
  - Pemantauan dan evaluasi yang komprehensif
  - Deployment satu-klik melalui template ARM

#### Contoh Lokal - Aplikasi Kontainer (Bab 2-5)
**Contoh deployment kontainer lengkap di repositori ini:**
- [**Container App Examples**](examples/container-app/README.md) - Panduan lengkap untuk deployment berbasis kontainer
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API REST dasar dengan scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Deployment multi-layanan siap produksi
  - Pola Mulai Cepat, Produksi, dan Lanjutan untuk deployment
  - Panduan pemantauan, keamanan, dan optimisasi biaya

#### Contoh Eksternal - Aplikasi Sederhana (Bab 1-2)
**Clone repositori Azure Samples ini untuk memulai:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pola deployment dasar
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Deployment konten statis
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Deployment API REST

#### Contoh Eksternal - Integrasi Database (Bab 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Pola konektivitas database
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Alur data serverless

#### Contoh Eksternal - Pola Lanjutan (Bab 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arsitektur multi-layanan
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Pemrosesan latar belakang  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Pola ML siap produksi

### Koleksi Template Eksternal
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kumpulan kurasi template resmi dan komunitas
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasi template Microsoft Learn
- [**Examples Directory**](examples/README.md) - Contoh pembelajaran lokal dengan penjelasan rinci

---

## 📚 Sumber Belajar & Referensi

### Referensi Cepat
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Perintah azd penting diatur berdasarkan bab
- [**Glosarium**](resources/glossary.md) - Terminologi Azure dan azd  
- [**FAQ**](resources/faq.md) - Pertanyaan umum diatur menurut bab pembelajaran
- [**Panduan Belajar**](resources/study-guide.md) - Latihan praktik komprehensif

### Workshop Praktik
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Buat solusi AI Anda siap di-deploy dengan AZD (2-3 jam)
- [**Interactive Workshop**](workshop/README.md) - Latihan berpemandu 8-modul dengan MkDocs dan GitHub Codespaces
  - Mengikuti: Pengenalan → Seleksi → Validasi → Dekonstruksi → Konfigurasi → Kustomisasi → Pembongkaran → Penutupan

### Sumber Belajar Eksternal
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Panduan Pemecahan Masalah Cepat

**Masalah umum yang dihadapi pemula dan solusi cepat:**

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
<summary><strong>❌ "Tidak ditemukan langganan" atau "Langganan belum disetel"</strong></summary>

```bash
# Daftar langganan yang tersedia
az account list --output table

# Tetapkan langganan default
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

# Atau gunakan SKU yang lebih kecil saat pengembangan
# Sunting infra/main.parameters.json:
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

# Opsi 2: Cukup perbaiki infrastruktur
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
# Autentikasi ulang
az logout
az login

azd auth logout
azd auth login

# Verifikasi autentikasi
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
<summary><strong>❌ Penerapan template memakan waktu terlalu lama</strong></summary>

**Waktu tunggu normal:**
- Aplikasi web sederhana: 5-10 menit
- Aplikasi dengan database: 10-15 menit
- Aplikasi AI: 15-25 menit (penyediaan OpenAI lambat)

```bash
# Periksa kemajuan
azd show

# Jika terhenti lebih dari 30 menit, periksa Azure Portal:
azd monitor
# Cari penyebaran yang gagal
```
</details>

<details>
<summary><strong>❌ "Permission denied" atau "Forbidden"</strong></summary>

```bash
# Periksa peran Azure Anda
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Anda memerlukan setidaknya peran "Contributor"
# Minta admin Azure Anda untuk memberikan:
# - Contributor (untuk sumber daya)
# - User Access Administrator (untuk penugasan peran)
```
</details>

<details>
<summary><strong>❌ Tidak dapat menemukan URL aplikasi yang telah dideploy</strong></summary>

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

### 📚 Sumber Daya Pemecahan Masalah Lengkap

- **Panduan Masalah Umum:** [Solusi Terperinci](docs/chapter-07-troubleshooting/common-issues.md)
- **Masalah Spesifik AI:** [Pemecahan Masalah AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Panduan Debugging:** [Debugging Langkah demi Langkah](docs/chapter-07-troubleshooting/debugging.md)
- **Dapatkan Bantuan:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Penyelesaian Kursus & Sertifikasi

### Pelacakan Kemajuan
Lacak kemajuan pembelajaran Anda di setiap bab:

- [ ] **Bab 1**: Dasar & Mulai Cepat ✅
- [ ] **Bab 2**: Pengembangan Berbasis AI ✅  
- [ ] **Bab 3**: Konfigurasi & Otentikasi ✅
- [ ] **Bab 4**: Infrastruktur sebagai Kode & Penerapan ✅
- [ ] **Bab 5**: Solusi AI Multi-Agen ✅
- [ ] **Bab 6**: Validasi & Perencanaan Pra-Penerapan ✅
- [ ] **Bab 7**: Pemecahan Masalah & Debugging ✅
- [ ] **Bab 8**: Pola Produksi & Perusahaan ✅

### Verifikasi Pembelajaran
Setelah menyelesaikan setiap bab, verifikasi pengetahuan Anda dengan:
1. **Latihan Praktis**: Selesaikan penerapan langsung pada bab tersebut
2. **Pemeriksaan Pengetahuan**: Tinjau bagian FAQ untuk bab Anda
3. **Diskusi Komunitas**: Bagikan pengalaman Anda di Azure Discord
4. **Bab Berikutnya**: Lanjut ke tingkat kompleksitas berikutnya

### Manfaat Penyelesaian Kursus
Setelah menyelesaikan semua bab, Anda akan mendapatkan:
- **Pengalaman Produksi**: Menerapkan aplikasi AI nyata ke Azure
- **Keterampilan Profesional**: Kemampuan penerapan yang siap untuk perusahaan  
- **Pengakuan Komunitas**: Menjadi anggota aktif komunitas pengembang Azure
- **Kemajuan Karier**: Keahlian AZD dan penerapan AI yang banyak dicari

---

## 🤝 Komunitas & Dukungan

### Dapatkan Bantuan & Dukungan
- **Masalah Teknis**: [Laporkan bug dan minta fitur](https://github.com/microsoft/azd-for-beginners/issues)
- **Pertanyaan Pembelajaran**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) dan [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Bantuan Spesifik AI**: Bergabung dengan [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasi**: [Dokumentasi resmi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Wawasan Komunitas dari Microsoft Foundry Discord

**Hasil Polling Terbaru dari Channel #Azure:**
- **45%** pengembang ingin menggunakan AZD untuk beban kerja AI
- **Tantangan utama**: Penerapan multi-layanan, manajemen kredensial, kesiapan produksi  
- **Paling banyak diminta**: Template khusus AI, panduan pemecahan masalah, praktik terbaik

**Bergabung dengan komunitas kami untuk:**
- Bagikan pengalaman AZD + AI Anda dan dapatkan bantuan
- Akses pratinjau awal template AI baru
- Berkontribusi pada praktik terbaik penerapan AI
- Mempengaruhi pengembangan fitur AI + AZD di masa depan

### Berkontribusi pada Kursus
Kami menyambut kontribusi! Silakan baca [Panduan Kontribusi](CONTRIBUTING.md) untuk detail tentang:
- **Peningkatan Konten**: Tingkatkan bab dan contoh yang ada
- **Contoh Baru**: Tambahkan skenario dunia nyata dan template  
- **Terjemahan**: Bantu mempertahankan dukungan multi-bahasa
- **Laporan Bug**: Tingkatkan akurasi dan kejelasan
- **Standar Komunitas**: Ikuti pedoman komunitas inklusif kami

---

## 📄 Informasi Kursus

### Lisensi
Proyek ini dilisensikan di bawah Lisensi MIT - lihat berkas [LICENSE](../../LICENSE) untuk detail.

### Sumber Belajar Microsoft Terkait

Tim kami menghasilkan kursus pembelajaran komprehensif lainnya:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---
## 🗺️ Navigasi Kursus

**🚀 Siap untuk Memulai Belajar?**

**Pemula**: Mulai dengan [Bab 1: Fondasi & Mulai Cepat](../..)  
**Pengembang AI**: Langsung ke [Bab 2: Pengembangan Berorientasi AI](../..)  
**Pengembang Berpengalaman**: Mulai dengan [Bab 3: Konfigurasi & Otentikasi](../..)

**Langkah Selanjutnya**: [Mulai Bab 1 - Dasar-dasar AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI Co-op Translator (https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk akurasi, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat penting, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->