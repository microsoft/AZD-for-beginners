# AZD Untuk Pemula: Perjalanan Pembelajaran Berstruktur

![AZD-for-beginners](../../translated_images/ms/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Terjemahan Automatik (Sentiasa Terkini)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](./README.md) | [Malayalam](../ml/README.md) | [Manipuri (Meitei Mayek)](../mni/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Lebih suka untuk Clone Secara Tempatan?**
>
> Repositori ini termasuk lebih 50 terjemahan bahasa yang meningkatkan saiz muat turun dengan ketara. Untuk clone tanpa terjemahan, gunakan sparse checkout:
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
> Ini memberikan anda segala yang anda perlukan untuk menamatkan kursus dengan muat turun yang lebih pantas.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Apa Yang Baru dalam azd Hari Ini

> 📌 Kursus ini disahkan dengan **`azd 1.27.1`** (Julai 2026). Jalankan `azd version` untuk menyemak binaan anda, dan `azd upgrade` untuk mendapatkan terkini.

Azure Developer CLI telah berkembang melepasi aplikasi web dan API tradisional. Hari ini, azd adalah alat tunggal untuk menerapkan **mana-mana** aplikasi ke Azure—termasuk aplikasi berkuasa AI dan ejen pintar.

Berikut maksudnya untuk anda:

- **Ejen AI kini merupakan beban kerja azd kelas pertama.** Anda boleh memulakan, menerapkan, dan mengurus projek ejen AI menggunakan aliran kerja `azd init` → `azd up` yang sama yang anda sudah tahu.
- **Kitaran hayat agen lengkap dari CLI.** Sambungan `azure.ai.agents` kini merangkumi keseluruhan perjalanan—`azd ai agent init` untuk membina asas, `azd ai agent invoke` untuk menguji (dengan output masa tindak balas), `azd ai agent eval generate` dan `azd ai agent optimize` untuk mengukur dan menambah baik kualiti, dan `azd ai agent delete` untuk membersihkan.
- **Lebih banyak blok bina AI.** Sambungan pratonton baru—`azure.ai.skills` dan `azure.ai.connections`—membolehkan anda mengurus kemahiran agen yang boleh digunakan semula dan sambungan Foundry terus dengan azd.
- **Integrasi Microsoft Foundry** membawa penerapan model, pengehosan agen, dan konfigurasi perkhidmatan AI terus ke dalam ekosistem templat azd.
- **Asas harian yang lebih lancar.** Pelepasan terkini menjadikan `azd init` idempoten (selamat dijalankan semula), menjadikan `azd auth login` jelas token usang secara automatik, dan menambah prompt penyiapan pertama yang mesra `azd tool`.
- **Aliran kerja teras tidak berubah.** Sama ada anda menerapkan aplikasi todo, mikroservis, atau penyelesaian AI multi-ejen, arahan adalah sama.

> **Nota untuk pengguna Aspire:** Microsoft kini merujuk produk tersebut secara ringkas sebagai **Aspire** (dahulunya ".NET Aspire"). Sokongan Aspire azd tidak berubah—hanya namanya dikemas kini.

Jika anda pernah menggunakan azd sebelum ini, sokongan AI adalah lanjutan semula jadi—bukan alat berasingan atau laluan lanjutan. Jika anda bermula dari awal, anda akan belajar satu aliran kerja yang sesuai untuk semua.

---

## 🚀 Apakah Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** adalah alat garis perintah mesra pembangun yang memudahkan penerapan aplikasi ke Azure. Daripada mencipta dan menghubungkan berpuluh-puluh sumber Azure secara manual, anda boleh menerapkan keseluruhan aplikasi dengan satu arahan.

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

**Itu sahaja!** Tiada klik Portal Azure, tiada templat ARM yang kompleks untuk dipelajari dahulu, tiada konfigurasi manual - hanya aplikasi yang berfungsi di Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Apakah Perbezaannya?

Ini adalah soalan paling lazim ditanya oleh pemula. Berikut jawapan ringkasnya:

| Ciri | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Tujuan** | Mengurus sumber Azure individu | Menerapkan aplikasi lengkap |
| **Fikiran** | Fokus infrastruktur | Fokus aplikasi |
| **Contoh** | `az webapp create --name myapp...` | `azd up` |
| **Lengkung Pembelajaran** | Perlu tahu perkhidmatan Azure | Cuma tahu aplikasi anda |
| **Terbaik Untuk** | DevOps, Infrastruktur | Pembangun, Praperolehan |

### Analogi Mudah

- **Azure CLI** seperti mempunyai semua alat untuk membina rumah - tukul, gergaji, paku. Anda boleh membina apa sahaja, tetapi anda perlu tahu pembinaan.
- **Azure Developer CLI** seperti mengambil kontraktor - anda nyatakan apa yang anda mahu, dan mereka uruskan pembinaan.

### Bila Menggunakan Setiap Satu

| Senario | Gunakan Ini |
|----------|----------|
| "Saya mahu menerapkan aplikasi web saya dengan cepat" | `azd up` |
| "Saya perlu hanya membuat akaun simpanan" | `az storage account create` |
| "Saya sedang membina aplikasi AI penuh" | `azd init --template azure-search-openai-demo` |
| "Saya perlu debug sumber Azure tertentu" | `az resource show` |
| "Saya mahu penerapan siap produksi dalam beberapa minit" | `azd up --environment production` |

### Mereka Bekerjasama!

AZD menggunakan Azure CLI di belakang tabir. Anda boleh menggunakan kedua-dua:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Cari Templat dalam Awesome AZD

Jangan mulakan dari kosong! **Awesome AZD** adalah koleksi komuniti templat siap guna untuk penerapan:

| Sumber | Penerangan |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Layari lebih 200 templat dengan penerapan satu klik |
| 🔗 [**Hantar Templat**](https://github.com/Azure/awesome-azd/issues) | Sumbangkan templat anda sendiri kepada komuniti |
| 🔗 [**Repositori GitHub**](https://github.com/Azure/awesome-azd) | Bintang dan terokai sumber |

### Templat AI Popular dari Awesome AZD

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Bermula dalam 3 Langkah

Sebelum bermula, pastikan mesin anda bersedia untuk templat yang anda mahu terapkan:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jika ada pemeriksaan diperlukan gagal, baiki dahulu dan kemudian teruskan dengan permulaan cepat.

### Langkah 1: Pasang AZD (2 minit)

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

### Langkah 2: Pengesahan untuk AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Jika anda tidak pasti yang mana anda perlukan, ikut aliran penyiapan penuh di [Pemasangan & Penyiapan](docs/chapter-01-foundation/installation.md#authentication-setup).

### Langkah 3: Terapkan Aplikasi Pertama Anda

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Itu sahaja!** Aplikasi anda kini hidup di Azure.

### Membersihkan (Jangan Lupa!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cara Menggunakan Kursus Ini

Kursus ini direka untuk **pembelajaran progresif** - mulakan di mana anda selesa dan maju ke atas:

| Pengalaman Anda | Mulakan Di Sini |
|-----------------|------------|
| **Baru kepada Azure** | [Bab 1: Asas](#-chapter-1-foundation--quick-start) |
| **Tahu Azure, baru kepada AZD** | [Bab 1: Asas](#-chapter-1-foundation--quick-start) |
| **Mahukan penerapan aplikasi AI** | [Bab 2: Pembangunan Berfokus AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Mahukan latihan praktikal** | [🎓 Bengkel Interaktif](workshop/README.md) - makmal panduan 3-4 jam |
| **Perlu corak produksi** | [Bab 8: Produksi & Perusahaan](#-chapter-8-production--enterprise-patterns) |

### Penyiapan Pantas

1. **Fork Repositori Ini**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone Ia**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Dapatkan Bantuan**: [Komuniti Discord Azure](https://discord.com/invite/ByRwuEEgH4)

> **Lebih suka untuk Clone Secara Tempatan?**

> Repositori ini termasuk lebih 50 terjemahan bahasa yang meningkatkan saiz muat turun dengan ketara. Untuk clone tanpa terjemahan, gunakan sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ini memberikan anda segala yang anda perlukan untuk menamatkan kursus dengan muat turun yang lebih pantas.


## Gambaran Keseluruhan Kursus

Kuasai Azure Developer CLI (azd) melalui bab berstruktur yang direka untuk pembelajaran progresif. **Fokus khas pada penerapan aplikasi AI dengan integrasi Microsoft Foundry.**

### Mengapa Kursus Ini Penting untuk Pembangun Moden

Berdasarkan pandangan komuniti Discord Microsoft Foundry, **45% pembangun ingin menggunakan AZD untuk beban kerja AI** tetapi menghadapi cabaran dengan:
- Seni bina AI pelbagai perkhidmatan yang kompleks
- Amalan terbaik penerapan AI produksi  
- Integrasi dan konfigurasi perkhidmatan Azure AI
- Pengoptimuman kos untuk beban kerja AI
- Penyelesaian masalah isu penerapan khusus AI

### Objektif Pembelajaran

Dengan menamatkan kursus berstruktur ini, anda akan:
- **Menguasai Asas AZD**: Konsep teras, pemasangan, dan konfigurasi
- **Menerapkan Aplikasi AI**: Gunakan AZD dengan perkhidmatan Microsoft Foundry
- **Melaksanakan Infrastruktur sebagai Kod**: Urus sumber Azure dengan templat Bicep
- **Selesaikan Masalah Penyebaran**: Atasi isu biasa dan debug masalah
- **Optimumkan untuk Pengeluaran**: Keselamatan, penyesuaian, pemantauan, dan pengurusan kos
- **Bina Penyelesaian Pelbagai Ejen**: Sebar senibina AI yang kompleks

## Sebelum Anda Mula: Akaun, Akses, dan Andaian

Sebelum anda mulakan Bab 1, pastikan anda mempunyai perkara berikut. Langkah pemasangan kemudian dalam panduan ini menganggap asas ini sudah diuruskan.

- **Langganan Azure**: Anda boleh menggunakan langganan sedia ada daripada kerja atau akaun anda sendiri, atau cipta [percubaan percuma](https://aka.ms/azurefreetrial) untuk bermula.
- **Kebenaran untuk mencipta sumber Azure**: Untuk kebanyakan latihan, anda harus mempunyai akses sekurang-kurangnya **Contributor** pada langganan atau kumpulan sumber yang disasarkan. Sesetengah bab juga mungkin mengandaikan anda boleh mencipta kumpulan sumber, identiti terurus, dan penugasan RBAC.
- [**Akaun GitHub**](https://github.com): Ini berguna untuk memfork repositori, menjejaki perubahan anda sendiri, dan menggunakan GitHub Codespaces untuk bengkel.
- **Prasyarat runtime templat**: Sesetengah templat memerlukan alat tempatan seperti Node.js, Python, Java, atau Docker. Jalankan pengesah seterusnya sebelum bermula supaya anda dapat mengesan alat yang hilang lebih awal.
- **Kemahiran asas terminal**: Anda tidak perlu menjadi pakar, tetapi anda harus selesa menjalankan arahan seperti `git clone`, `azd auth login`, dan `azd up`.

> **Bekerja dalam langganan perusahaan?**
> Jika persekitaran Azure anda dikendalikan oleh pentadbir, sahkan terlebih dahulu bahawa anda boleh menyebarkan sumber dalam langganan atau kumpulan sumber yang anda rancangkan untuk gunakan. Jika tidak, minta langganan sandbox atau akses Contributor sebelum anda mula.

> **Baru dengan Azure?**
> Mulakan dengan percubaan Azure anda sendiri atau langganan bayar-semasa guna di https://aka.ms/azurefreetrial supaya anda boleh menyiapkan latihan dari awal hingga akhir tanpa menunggu kelulusan pada tahap penyewa.

## 🗺️ Peta Kursus: Navigasi Pantas mengikut Bab

Setiap bab mempunyai README khusus dengan objektif pembelajaran, permulaan pantas, dan latihan:

| Bab | Topik | Pelajaran | Tempoh | Kerumitan |
|---------|-------|---------|----------|------------|
| **[Bab 1: Asas](docs/chapter-01-foundation/README.md)** | Memulakan | [Asas AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Pemasangan](docs/chapter-01-foundation/installation.md) &#124; [Projek Pertama](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Bab 2: Pembangunan AI](docs/chapter-02-ai-development/README.md)** | Aplikasi AI-Pertama | [Integrasi Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Ejen AI](docs/chapter-02-ai-development/agents.md) &#124; [Penyebaran Model](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Bengkel](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 jam | ⭐⭐ |
| **[Bab 3: Konfigurasi](docs/chapter-03-configuration/README.md)** | Pengesahan & Keselamatan | [Konfigurasi](docs/chapter-03-configuration/configuration.md) &#124; [Pengesahan & Keselamatan](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Bab 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Penyebaran | [Panduan Penyebaran](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Penyediaan](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 jam | ⭐⭐⭐ |
| **[Bab 5: Multi-Ejen](docs/chapter-05-multi-agent/README.md)** | Penyelesaian Ejen AI | [Senario Runcit](examples/retail-scenario.md) &#124; [Corak Koordinasi](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 jam | ⭐⭐⭐⭐ |
| **[Bab 6: Pra-Penyebaran](docs/chapter-06-pre-deployment/README.md)** | Perancangan & Pengesahan | [Pemeriksaan Preflight](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Perancangan Kapasiti](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Pemilihan SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 jam | ⭐⭐ |
| **[Bab 7: Penyelesaian Masalah](docs/chapter-07-troubleshooting/README.md)** | Debug & Baiki | [Isu Biasa](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [Isu AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 jam | ⭐⭐ |
| **[Bab 8: Pengeluaran](docs/chapter-08-production/README.md)** | Corak Perusahaan | [Amalan Pengeluaran](docs/chapter-08-production/production-ai-practices.md) | 2-3 jam | ⭐⭐⭐⭐ |
| **[🎓 Bengkel](workshop/README.md)** | Makmal Amali | [Pengenalan](workshop/docs/instructions/0-Introduction.md) &#124; [Pemilihan](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Pengesahan](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Pembongkaran](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurasi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Penyesuaian](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Penutupan](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Penamat](workshop/docs/instructions/7-Wrap-up.md) | 3-4 jam | ⭐⭐ |

**Jumlah Tempoh Kursus:** ~10-14 jam | **Kemajuan Kemahiran:** Pemula → Sedia Pengeluaran

---

## 📚 Bab Pembelajaran

*Pilih laluan pembelajaran anda berdasarkan tahap pengalaman dan matlamat*

### 🚀 Bab 1: Asas & Permulaan Pantas
**Prasyarat**: Langganan Azure, pengetahuan asas baris arahan  
**Tempoh**: 30-45 minit  
**Kerumitan**: ⭐

#### Apa Yang Anda Akan Pelajari
- Memahami asas Azure Developer CLI
- Memasang AZD pada platform anda
- Penyebaran pertama anda yang berjaya

#### Sumber Pembelajaran
- **🎯 Mula Di Sini**: [Apa itu Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teori**: [Asas AZD](docs/chapter-01-foundation/azd-basics.md) - Konsep teras dan terminologi
- **⚙️ Pasang**: [Pemasangan & Persediaan](docs/chapter-01-foundation/installation.md) - Panduan khusus platform
- **🛠️ Praktikal**: [Projek Pertama Anda](docs/chapter-01-foundation/first-project.md) - Tutorial langkah demi langkah
- **📋 Rujukan Pantas**: [Senarai Perintah](resources/cheat-sheet.md)

#### Latihan Praktikal
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Hasil Bab**: Berjaya menyebarkan aplikasi web mudah ke Azure menggunakan AZD

**✅ Pengesahan Kejayaan:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Masa Pelaburan:** 30-45 minit  
**📈 Tahap Kemahiran Selepas:** Boleh menyebarkan aplikasi asas secara berdikari
**📈 Tahap Kemahiran Selepas:** Boleh menyebarkan aplikasi asas secara berdikari

---

### 🤖 Bab 2: Pembangunan AI-Pertama (Disyorkan untuk Pembangun AI)
**Prasyarat**: Bab 1 selesai  
**Tempoh**: 1-2 jam  
**Kerumitan**: ⭐⭐

#### Apa Yang Anda Akan Pelajari
- Integrasi Microsoft Foundry dengan AZD
- Menyebarkan aplikasi berkuasa AI
- Memahami konfigurasi perkhidmatan AI

#### Sumber Pembelajaran
- **🎯 Mula Di Sini**: [Integrasi Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Ejen AI**: [Panduan Ejen AI](docs/chapter-02-ai-development/agents.md) - Menyebarkan ejen pintar dengan AZD
- **📖 Corak**: [Penyebaran Model AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Menyebar dan urus model AI
- **🛠️ Bengkel**: [Makmal Bengkel AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Jadikan penyelesaian AI anda sedia AZD
- **🎥 Panduan Interaktif**: [Bahan Bengkel](workshop/README.md) - Pembelajaran berasaskan pelayar dengan MkDocs * Persekitaran DevContainer
- **📋 Templat**: [Templat Microsoft Foundry](#featured-microsoft-foundry-templates)
- **📝 Contoh**: [Contoh Penyebaran AZD](examples/README.md)

#### Latihan Praktikal
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Hasil Bab**: Menyebar dan mengkonfigurasi aplikasi sembang AI berkuasa dengan keupayaan RAG

**✅ Pengesahan Kejayaan:**
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

**📊 Masa Pelaburan:** 1-2 jam  
**📈 Tahap Kemahiran Selepas:** Boleh menyebar dan mengkonfigurasi aplikasi AI sedia pengeluaran  
**💰 Kesedaran Kos:** Fahami kos pembangunan $80-150/bulan, kos pengeluaran $300-3500/bulan

#### 💰 Pertimbangan Kos untuk Penyebaran AI

**Persekitaran Pembangunan (Anggaran $80-150/bulan):**
- Model Microsoft Foundry (Bayar-semasa guna): $0-50/bulan (bergantung penggunaan token)
- Carian AI (peringkat asas): $75/bulan
- Aplikasi Kontena (Penggunaan): $0-20/bulan
- Penyimpanan (Standard): $1-5/bulan

**Persekitaran Pengeluaran (Anggaran $300-3,500+/bulan):**
- Model Microsoft Foundry (PTU untuk prestasi konsisten): $3,000+/bulan ATAU Bayar-semasa guna dengan volum tinggi
- Carian AI (peringkat standard): $250/bulan
- Aplikasi Kontena (Dedicated): $50-100/bulan
- Application Insights: $5-50/bulan
- Penyimpanan (Premium): $10-50/bulan

**💡 Petua Pengoptimuman Kos:**
- Gunakan **Peringkat Percuma** Model Microsoft Foundry untuk pembelajaran (Azure OpenAI termasuk 50,000 token/bulan)
- Jalankan `azd down` untuk membebaskan sumber apabila tidak sedang membangun secara aktif
- Mula dengan pengebilan berdasarkan penggunaan, naik taraf ke PTU hanya untuk pengeluaran
- Gunakan `azd provision --preview` untuk anggar kos sebelum penyebaran
- Aktifkan auto-scaling: bayar hanya untuk penggunaan sebenar

**Pemantauan Kos:**
```bash
# Check estimated monthly costs
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Bab 3: Konfigurasi & Pengesahan
**Prasyarat**: Bab 1 selesai  
**Tempoh**: 45-60 minit  
**Kerumitan**: ⭐⭐

#### Apa Yang Anda Akan Pelajari
- Konfigurasi dan pengurusan persekitaran
- Amalan terbaik pengesahan dan keselamatan
- Penamaan dan organisasi sumber

#### Sumber Pembelajaran
- **📖 Konfigurasi**: [Panduan Konfigurasi](docs/chapter-03-configuration/configuration.md) - Persediaan persekitaran
- **🔐 Keselamatan**: [Corak pengesahan dan identiti terurus](docs/chapter-03-configuration/authsecurity.md) - Corak pengesahan
- **📝 Contoh**: [Contoh Aplikasi Pangkalan Data](examples/database-app/README.md) - Contoh Pangkalan Data AZD

#### Latihan Praktikal
- Konfigurasi pelbagai persekitaran (dev, staging, prod)
- Sediakan pengesahan identiti terurus
- Laksanakan konfigurasi khusus persekitaran

**💡 Hasil Bab**: Urus pelbagai persekitaran dengan pengesahan dan keselamatan yang betul

---

### 🏗️ Bab 4: Infrastruktur sebagai Kod & Penyebaran
**Prasyarat**: Bab 1-3 selesai  
**Tempoh**: 1-1.5 jam  
**Kerumitan**: ⭐⭐⭐

#### Apa Yang Anda Akan Pelajari
- Corak penyebaran lanjutan
- Infrastruktur sebagai Kod menggunakan Bicep
- Strategi penyediaan sumber

#### Sumber Pembelajaran
- **📖 Penyebaran**: [Panduan Penyebaran](docs/chapter-04-infrastructure/deployment-guide.md) - Aliran kerja lengkap
- **🏗️ Penyediaan**: [Penyediaan Sumber](docs/chapter-04-infrastructure/provisioning.md) - Pengurusan sumber Azure
- **📝 Contoh**: [Contoh Aplikasi Kontena](../../examples/container-app) - Penyebaran berkontena

#### Latihan Praktikal
- Cipta templat Bicep khusus
- Sebar aplikasi berbilang perkhidmatan
- Laksanakan strategi penyebaran biru-hijau

**💡 Hasil Bab**: Sebar aplikasi berbilang perkhidmatan yang kompleks menggunakan templat infrastruktur khusus

---

### 🎯 Bab 5: Penyelesaian AI Multi-Ejen (Lanjutan)
**Prasyarat**: Bab 1-2 selesai  
**Tempoh**: 2-3 jam  
**Kerumitan**: ⭐⭐⭐⭐

#### Apa Yang Anda Akan Pelajari
- Corak senibina pelbagai ejen
- Orkestrasikan dan koordinasi ejen
- Penyebaran AI sedia pengeluaran

#### Sumber Pembelajaran
- **🤖 Projek Tumpuan**: [Penyelesaian AI Multi-Ejen Runcit](examples/retail-scenario.md) - Pelaksanaan lengkap
- **🛠️ Templat ARM**: [Pakej Templat ARM](../../examples/retail-multiagent-arm-template) - Penyebaran satu klik
- **📖 Senibina**: [Corak koordinasi multi-ejen](docs/chapter-06-pre-deployment/coordination-patterns.md) - Corak

#### Latihan Praktikal
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Hasil Bab**: Sebar dan urus penyelesaian AI multi-ejen sedia pengeluaran dengan ejen Pelanggan dan Inventori

---

### 🔍 Bab 6: Pengesahan & Perancangan Pra-Penyebaran
**Prasyarat**: Bab 4 selesai  
**Tempoh**: 1 jam  
**Kerumitan**: ⭐⭐

#### Apa Yang Anda Akan Pelajari
- Perancangan kapasiti dan pengesahan sumber
- Strategi pemilihan SKU
- Pemeriksaan pra-penerbangan dan automasi

#### Sumber Pembelajaran
- **📊 Perancangan**: [Perancangan Kapasiti](docs/chapter-06-pre-deployment/capacity-planning.md) - Pengesahan sumber
- **💰 Pemilihan**: [Pemilihan SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Pilihan kos efektif
- **✅ Pengesahan**: [Semakan Pra-penerbangan](docs/chapter-06-pre-deployment/preflight-checks.md) - Skrip automatik

#### Latihan Praktikal
- Jalankan skrip pengesahan kapasiti
- Optimumkan pemilihan SKU untuk kos
- Laksanakan semakan pra-penerapan automatik

**💡 Hasil Bab**: Sah dan optimumkan penerapan sebelum pelaksanaan

---

### 🚨 Bab 7: Penyelesaian Masalah & Debugging
**Prasyarat**: Sebarang bab penerapan telah diselesaikan  
**Tempoh**: 1-1.5 jam  
**Kerumitan**: ⭐⭐

#### Apa yang Anda Akan Pelajari
- Pendekatan debugging sistematik
- Masalah dan penyelesaian biasa
- Penyelesaian masalah khusus AI

#### Sumber Pembelajaran
- **🔧 Masalah Biasa**: [Masalah Biasa](docs/chapter-07-troubleshooting/common-issues.md) - FAQ dan penyelesaian
- **🕵️ Debugging**: [Panduan Debugging](docs/chapter-07-troubleshooting/debugging.md) - Strategi langkah demi langkah
- **🤖 Masalah AI**: [Penyelesaian Masalah Khusus AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Masalah perkhidmatan AI

#### Latihan Praktikal
- Mendiagnos kegagalan penerapan
- Selesaikan isu pengesahan
- Debug sambungan perkhidmatan AI

**💡 Hasil Bab**: Mendiagnos dan menyelesaikan masalah penerapan biasa secara berdikari

---

### 🏢 Bab 8: Corak Pengeluaran & Perusahaan
**Prasyarat**: Bab 1-4 diselesaikan  
**Tempoh**: 2-3 jam  
**Kerumitan**: ⭐⭐⭐⭐

#### Apa yang Anda Akan Pelajari
- Strategi penerapan pengeluaran
- Corak keselamatan perusahaan
- Pemantauan dan pengoptimuman kos

#### Sumber Pembelajaran
- **🏭 Pengeluaran**: [Amalan Terbaik AI Pengeluaran](docs/chapter-08-production/production-ai-practices.md) - Corak perusahaan
- **📝 Contoh**: [Contoh Mikros perkhidmatan](../../examples/microservices) - Seni bina kompleks
- **📊 Pemantauan**: [Integrasi Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Pemantauan

#### Latihan Praktikal
- Laksanakan corak keselamatan perusahaan
- Sediakan pemantauan komprehensif
- Terapkan ke pengeluaran dengan tadbir urus yang betul

**💡 Hasil Bab**: Terapkan aplikasi sedia perusahaan dengan keupayaan pengeluaran penuh

---

## 🎓 Gambaran Keseluruhan Bengkel: Pengalaman Pembelajaran Praktikal

> **⚠️ STATUS BENGKEL: Pembangunan Aktif**  
> Bahan bengkel sedang dibangunkan dan diperbaiki. Modul teras berfungsi, tetapi beberapa seksyen lanjutan belum lengkap. Kami sedang giat berusaha untuk menyelesaikan semua kandungan. [Jejaki kemajuan →](workshop/README.md)

### Bahan Bengkel Interaktif
**Pembelajaran praktikal menyeluruh dengan alat berasaskan pelayar dan latihan berpandu**

Bahan bengkel kami menyediakan pengalaman pembelajaran interaktif yang tersusun yang melengkapi kurikulum berasaskan bab di atas. Bengkel ini direka untuk pembelajaran kendiri dan sesi diajar oleh pengajar.

#### 🛠️ Ciri-ciri Bengkel
- **Antara Muka Berasaskan Pelayar**: Bengkel penuh bertenaga MkDocs dengan ciri carian, salin, dan tema
- **Integrasi GitHub Codespaces**: Satu klik untuk penyediaan persekitaran pembangunan
- **Jalur Pembelajaran Berstruktur**: 8 modul latihan berpandu (3-4 jam keseluruhan)
- **Metodologi Progresif**: Pengenalan → Pemilihan → Pengesahan → Dekonstruksi → Konfigurasi → Penyesuaian → Pembongkaran → Penutup
- **Persekitaran DevContainer Interaktif**: Alat dan pergantungan prakonfigurasi

#### 📚 Struktur Modul Bengkel
Bengkel mengikuti **metodologi progresif 8 modul** yang membawa anda dari penemuan ke penguasaan penerapan:

| Modul | Topik | Apa yang Anda Akan Lakukan | Tempoh |
|--------|-------|----------------|----------|
| **0. Pengenalan** | Gambaran Bengkel | Fahami objektif pembelajaran, prasyarat, dan struktur bengkel | 15 min |
| **1. Pemilihan** | Penemuan Template | Teroka template AZD dan pilih template AI yang tepat untuk senario anda | 20 min |
| **2. Pengesahan** | Terapkan & Sahkan | Terapkan templat dengan `azd up` dan sahkan infrastruktur berfungsi | 30 min |
| **3. Dekonstruksi** | Fahami Struktur | Gunakan GitHub Copilot untuk meneroka seni bina templat, fail Bicep, dan penyusunan kod | 30 min |
| **4. Konfigurasi** | azure.yaml Mendalam | Kuasai konfigurasi `azure.yaml`, kaitan kitaran hayat, dan pembolehubah persekitaran | 30 min |
| **5. Penyesuaian** | Jadikan Milik Anda | Aktifkan Carian AI, penjejakan, penilaian, dan sesuaikan untuk senario anda | 45 min |
| **6. Pembongkaran** | Bersihkan | Nyahperuntukan sumber dengan selamat menggunakan `azd down --purge` | 15 min |
| **7. Penutup** | Langkah Seterusnya | Semak pencapaian, konsep utama, dan teruskan perjalanan pembelajaran anda | 15 min |

**Aliran Bengkel:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Memulakan Bengkel
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Hasil Pembelajaran Bengkel
Dengan menyelesaikan bengkel, peserta akan:
- **Terapkan Aplikasi AI Pengeluaran**: Gunakan AZD dengan perkhidmatan Microsoft Foundry
- **Kuasai Seni Bina Multi-Ejen**: Laksanakan penyelesaian ejen AI berkoordinasi
- **Laksanakan Amalan Keselamatan Terbaik**: Konfigurasi pengesahan dan kawalan akses
- **Optimumkan untuk Skala**: Reka bentuk penerapan kos efektif dan berprestasi tinggi
- **Selesaikan Masalah Penerapan**: Atasi isu biasa secara berdikari

#### 📖 Sumber Bengkel
- **🎥 Panduan Interaktif**: [Bahan Bengkel](workshop/README.md) - Persekitaran pembelajaran berasaskan pelayar
- **📋 Arahan Mengikut Modul**:
  - [0. Pengenalan](workshop/docs/instructions/0-Introduction.md) - Gambaran dan objektif bengkel
  - [1. Pemilihan](workshop/docs/instructions/1-Select-AI-Template.md) - Cari dan pilih template AI
  - [2. Pengesahan](workshop/docs/instructions/2-Validate-AI-Template.md) - Terap dan sahkan template
  - [3. Dekonstruksi](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Terokai seni bina template
  - [4. Konfigurasi](workshop/docs/instructions/4-Configure-AI-Template.md) - Kuasai azure.yaml
  - [5. Penyesuaian](workshop/docs/instructions/5-Customize-AI-Template.md) - Sesuaikan untuk senario anda
  - [6. Pembongkaran](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Bersihkan sumber
  - [7. Penutup](workshop/docs/instructions/7-Wrap-up.md) - Semak dan langkah seterusnya
- **🛠️ Makmal Bengkel AI**: [Makmal Bengkel AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Latihan fokus AI
- **💡 Mula Cepat**: [Panduan Penetapan Bengkel](workshop/README.md#quick-start) - Konfigurasi persekitaran

**Sesuai untuk**: Latihan korporat, kursus universiti, pembelajaran kendiri, dan kem latihan pembangun.

---

## 📖 Pendalaman: Kebolehan AZD

Selain asas, AZD menyediakan ciri-ciri kuat untuk penerapan pengeluaran:

- **Penerapan berasaskan templat** - Gunakan templat siap untuk corak aplikasi biasa
- **Infrastruktur sebagai Kod** - Urus sumber Azure menggunakan Bicep atau Terraform  
- **Aliran kerja terintegrasi** - Provisikan, terapkan, dan pantau aplikasi dengan lancar
- **Mesra Pembangun** - Dioptimumkan untuk produktiviti dan pengalaman pembangun

### **AZD + Microsoft Foundry: Sesuai untuk Penerapan AI**

**Mengapa AZD untuk Penyelesaian AI?** AZD menangani cabaran teratas yang dihadapi pembangun AI:

- **Templat Sedia AI** - Templat pra-konfigurasi untuk Model Microsoft Foundry, Perkhidmatan AI Azure, dan beban kerja ML
- **Penerapan AI Selamat** - Corak keselamatan terbina dalam untuk perkhidmatan AI, kunci API, dan titik akhir model  
- **Corak AI Pengeluaran** - Amalan terbaik untuk penerapan aplikasi AI yang boleh diskala dan kos efektif
- **Aliran Kerja AI Menyeluruh** - Dari pembangunan model hingga penerapan pengeluaran dengan pemantauan yang betul
- **Pengoptimuman Kos** - Pengagihan sumber pintar dan strategi penyesuaian beban kerja AI
- **Integrasi Microsoft Foundry** - Sambungan lancar ke katalog model Microsoft Foundry dan titik akhir

---

## 🎯 Perpustakaan Templat & Contoh

### Terkemuka: Templat Microsoft Foundry
**Mulakan di sini jika anda menerapkan aplikasi AI!**

> **Nota:** Templat ini menunjukkan pelbagai corak AI. Sebahagiannya adalah Sampel Azure luaran, yang lain adalah pelaksanaan tempatan.

| Templat | Bab | Kerumitan | Perkhidmatan | Jenis |
|----------|---------|------------|----------|------|
| [**Mula dengan chat AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bab 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Luaran |
| [**Mula dengan ejen AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Bab 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Luaran |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bab 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Luaran |
| [**Permulaan Pantas App Chat OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bab 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Luaran |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bab 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Luaran |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Bab 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Luaran |
| [**Penyelesaian Multi-Ejen Runcit**](examples/retail-scenario.md) | Bab 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Tempatan** |

### Terkemuka: Senario Pembelajaran Lengkap
**Templat aplikasi sedia pengeluaran dipetakan ke bab pembelajaran**

| Templat | Bab Pembelajaran | Kerumitan | Pembelajaran Utama |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bab 2 | ⭐ | Corak penerapan AI asas |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bab 2 | ⭐⭐ | Pelaksanaan RAG dengan Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Bab 4 | ⭐⭐ | Integrasi Kecerdasan Dokumen |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bab 5 | ⭐⭐⭐ | Rangka kerja ejen dan panggilan fungsi |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Bab 8 | ⭐⭐⭐ | Orkestrasi AI perusahaan |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Bab 5 | ⭐⭐⭐⭐ | Seni bina multi-ejen dengan ejen Pelanggan dan Inventori |

### Pembelajaran Mengikut Jenis Contoh

> **📌 Contoh Tempatan vs. Luaran:**  
> **Contoh Tempatan** (dalam repo ini) = Sedia untuk guna serta-merta  
> **Contoh Luaran** (Sampel Azure) = Clone dari repositori yang dipautkan

#### Contoh Tempatan (Sedia Untuk Guna)
- [**Penyelesaian Multi-Ejen Runcit**](examples/retail-scenario.md) - Pelaksanaan lengkap sedia pengeluaran dengan templat ARM
  - Seni bina multi-ejen (Ejen Pelanggan + Inventori)
  - Pemantauan dan penilaian menyeluruh
  - Penerapan satu klik melalui templat ARM

#### Contoh Tempatan - Aplikasi Kontena (Bab 2-5)
**Contoh penerapan kontena menyeluruh dalam repositori ini:**
- [**Contoh App Kontena**](examples/container-app/README.md) - Panduan lengkap penerapan berkontena
  - [API Flask Mudah](../../examples/container-app/simple-flask-api) - API REST asas dengan skala ke sifar
  - [Seni Bina Mikros Perkhidmatan](../../examples/container-app/microservices) - Penerapan pelbagai perkhidmatan sedia pengeluaran
  - Corak penerapan Permulaan Cepat, Pengeluaran, dan Lanjutan
  - Panduan pemantauan, keselamatan, dan pengoptimuman kos

#### Contoh Luaran - Aplikasi Sederhana (Bab 1-2)
**Clone repositori Sampel Azure ini untuk memulakan:**
- [Aplikasi Web Mudah - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Corak penerapan asas
- [Laman Web Statik - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Penerapan kandungan statik
- [App Kontena - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Penerapan API REST

#### Contoh Luaran - Integrasi Pangkalan Data (Bab 3-4)  
- [App Pangkalan Data - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Corak kesambungan pangkalan data
- [Fungsi + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Aliran kerja data tanpa pelayan

#### Contoh Luaran - Corak Lanjutan (Bab 4-8)
- [Mikros Perkhidmatan Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Seni bina pelbagai perkhidmatan
- [Tugas Aplikasi Kontena](https://github.com/Azure-Samples/container-apps-jobs) - Pemprosesan latar belakang  
- [Saluran ML Perusahaan](https://github.com/Azure-Samples/mlops-v2) - Corak ML sedia pengeluaran

### Koleksi Templat Luaran
- [**Galeri Templat AZD Rasmi**](https://azure.github.io/awesome-azd/) - Koleksi terpilih templat rasmi dan komuniti
- [**Templat Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasi templat Microsoft Learn
- [**Direktori Contoh**](examples/README.md) - Contoh pembelajaran tempatan dengan penjelasan terperinci

---

## 📚 Sumber Pembelajaran & Rujukan

### Rujukan Pantas
- [**Lembaran Cheat Arahan**](resources/cheat-sheet.md) - Arahan azd penting yang disusun mengikut bab
- [**Glosari**](resources/glossary.md) - Istilah Azure dan azd  
- [**Soalan Lazim**](resources/faq.md) - Soalan biasa yang disusun mengikut bab pembelajaran
- [**Panduan Belajar**](resources/study-guide.md) - Latihan praktikal menyeluruh

### Bengkel Praktikal
- [**Makmal Bengkel AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Jadikan penyelesaian AI anda boleh diterapkan dengan AZD (2-3 jam)
- [**Bengkel Interaktif**](workshop/README.md) - 8 modul senaman berpandu dengan MkDocs dan GitHub Codespaces
  - Mengikuti: Pengenalan → Pemilihan → Pengesahan → Pembongkaran → Konfigurasi → Penyesuaian → Penutupan → Penyingkiran

### Sumber Pembelajaran Luar
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pusat Seni Bina Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulator Harga Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status Azure](https://status.azure.com/)

### Kemahiran Ejen AI untuk Penyunting Anda
- [**Kemahiran Microsoft Azure di skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 kemahiran ejen terbuka untuk Azure AI, Foundry, penyebaran, diagnostik, pengoptimuman kos, dan banyak lagi. Pasang dalam GitHub Copilot, Cursor, Claude Code, atau ejen yang disokong:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Panduan Penyelesaian Masalah Pantas

**Masalah biasa yang dihadapi pemula dan penyelesaian segera:**

<details>
<summary><strong>❌ "azd: arahan tidak ditemui"</strong></summary>

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
<summary><strong>❌ "Tiada langganan ditemui" atau "Langganan tidak ditetapkan"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" atau "Kuota terlampau"</strong></summary>

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
<summary><strong>❌ "Pengesahan gagal" atau "Token tamat tempoh"</strong></summary>

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
<summary><strong>❌ "Sumber sudah wujud" atau konflik penamaan</strong></summary>

```bash
# AZD generates unique names, but if conflict:
azd down --force --purge

# Then retry with fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Penyebaran templat mengambil masa terlalu lama</strong></summary>

**Masa menunggu biasa:**
- Apl web mudah: 5-10 minit
- Apl dengan pangkalan data: 10-15 minit
- Apl AI: 15-25 minit (Penyediaan OpenAI lambat)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Kebenaran ditolak" atau "Dilarang"</strong></summary>

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
<summary><strong>❌ Tidak dapat mencari URL aplikasi yang diterapkan</strong></summary>

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

### 📚 Sumber Penyelesaian Masalah Penuh

- **Panduan Masalah Biasa:** [Penyelesaian Terperinci](docs/chapter-07-troubleshooting/common-issues.md)
- **Masalah Khusus AI:** [Penyelesaian Masalah AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Panduan Debugging:** [Debugging Langkah demi Langkah](docs/chapter-07-troubleshooting/debugging.md)
- **Dapatkan Bantuan:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Penyempurnaan Kursus & Sijil

### Jejak Kemajuan
Jejaki kemajuan pembelajaran anda melalui setiap bab:

- [ ] **Bab 1**: Asas & Permulaan Pantas ✅
- [ ] **Bab 2**: Pembangunan AI-Pertama ✅  
- [ ] **Bab 3**: Konfigurasi & Pengesahan ✅
- [ ] **Bab 4**: Infrastruktur sebagai Kod & Penyebaran ✅
- [ ] **Bab 5**: Penyelesaian AI Multi-Ejen ✅
- [ ] **Bab 6**: Pengesahan Pra-Penyebaran & Perancangan ✅
- [ ] **Bab 7**: Penyelesaian Masalah & Debugging ✅
- [ ] **Bab 8**: Pola Pengeluaran & Perusahaan ✅

### Pengesahan Pembelajaran
Selepas menyelesaikan setiap bab, sahkan pengetahuan anda dengan:
1. **Latihan Praktikal**: Lengkapkan penyebaran praktikal bab tersebut
2. **Semakan Pengetahuan**: Tinjau bahagian FAQ bagi bab anda
3. **Perbincangan Komuniti**: Kongsi pengalaman anda di Azure Discord
4. **Bab Seterusnya**: Teruskan ke tahap kerumitan berikutnya

### Manfaat Penyempurnaan Kursus
Setelah menamatkan semua bab, anda akan memiliki:
- **Pengalaman Pengeluaran**: Aplikasi AI sebenar telah diterapkan ke Azure
- **Kemahiran Profesional**: Keupayaan penyebaran sedia perusahaan  
- **Pengiktirafan Komuniti**: Ahli aktif komuniti pembangun Azure
- **Kemajuan Kerjaya**: Kepakaran AZD dan penyebaran AI yang laku

---

## 🤝 Komuniti & Sokongan

### Dapatkan Bantuan & Sokongan
- **Isu Teknikal**: [Laporkan pepijat dan minta ciri](https://github.com/microsoft/azd-for-beginners/issues)
- **Soalan Pembelajaran**: [Komuniti Microsoft Azure Discord](https://discord.gg/microsoft-azure) dan [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Bantuan Khusus AI**: Sertai [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasi**: [Dokumentasi rasmi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Pemahaman Komuniti dari Microsoft Foundry Discord

**Keputusan Undian Terkini dari Saluran #Azure:**
- **45%** pembangun mahu menggunakan AZD untuk beban kerja AI
- **Cabaran utama**: Penyebaran multi-perkhidmatan, pengurusan kelayakan, kesediaan pengeluaran  
- **Permintaan tertinggi**: Templat khusus AI, panduan penyelesaian masalah, amalan terbaik

**Sertai komuniti kami untuk:**
- Kongsi pengalaman AZD + AI anda dan dapatkan bantuan
- Akses pratonton awal templat AI baru
- Menyumbang kepada amalan terbaik penyebaran AI
- Mempengaruhi pembangunan ciri AI + AZD masa depan

### Menyumbang kepada Kursus
Kami alu-alukan sumbangan! Sila baca [Panduan Menyumbang](CONTRIBUTING.md) untuk maklumat lanjut mengenai:
- **Penambahbaikan Kandungan**: Memperbaiki bab dan contoh sedia ada
- **Contoh Baru**: Tambah senario dan templat dunia nyata  
- **Terjemahan**: Bantu mengekalkan sokongan pelbagai bahasa
- **Laporan Pepijat**: Tingkatkan ketepatan dan kejelasan
- **Standard Komuniti**: Ikut garis panduan komuniti inklusif kami

---

## 📄 Maklumat Kursus

### Lesen
Projek ini dilisensikan di bawah Lesen MIT - lihat fail [LICENSE](../../LICENSE) untuk maklumat lanjut.

### Sumber Pembelajaran Microsoft Berkaitan

Pasukan kami menghasilkan kursus pembelajaran komprehensif lain:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j untuk Pemula](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js untuk Pemula](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain untuk Pemula](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Ejen
[![AZD untuk Pemula](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI untuk Pemula](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP untuk Pemula](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Ejen AI untuk Pemula](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Siri AI Generatif
[![AI Generatif untuk Pemula](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Generatif (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI Generatif (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![AI Generatif (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Pembelajaran Teras
[![ML untuk Pemula](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Sains Data untuk Pemula](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI untuk Pemula](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Keselamatan Siber untuk Pemula](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Pembangunan Web untuk Pemula](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT untuk Pemula](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Pembangunan XR untuk Pemula](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Siri Copilot
[![Copilot untuk Pengaturcaraan Pasangan AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot untuk C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Pengembaraan Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigasi Kursus

**🚀 Sedia untuk Mula Belajar?**

**Pemula**: Mula dengan [Bab 1: Asas & Permulaan Pantas](#-chapter-1-foundation--quick-start)  
**Pembangun AI**: Terus ke [Bab 2: Pembangunan AI-Pertama](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Pembangun Berpengalaman**: Mula dengan [Bab 3: Konfigurasi & Pengesahan](#️-chapter-3-configuration--authentication)

**Langkah Seterusnya**: [Mulakan Bab 1 - Asas AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->