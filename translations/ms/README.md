# AZD Untuk Pemula: Perjalanan Pembelajaran Berstruktur

![AZD-untuk-pemula](../../translated_images/ms/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Terjemahan Automatik (Sentiasa Dikemaskini)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](./README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Lebih Suka Klon Secara Tempatan?**
>
> Repositori ini mengandungi lebih 50 terjemahan bahasa yang meningkatkan saiz muat turun secara ketara. Untuk klon tanpa terjemahan, gunakan sparse checkout:
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
> Ini memberikan anda segala yang diperlukan untuk menyelesaikan kursus dengan muat turun yang lebih cepat.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Apa Yang Baru Dalam azd Hari Ini

> 📌 Kursus ini disahkan dengan **`azd 1.27.1`** (Julai 2026). Jalankan `azd version` untuk memeriksa binaan anda, dan `azd upgrade` untuk mendapatkan yang terkini.

Azure Developer CLI telah berkembang melebihi aplikasi web tradisional dan API. Hari ini, azd adalah alat tunggal untuk menyebarkan **mana-mana** aplikasi ke Azure—termasuk aplikasi berkuasa AI dan ejen pintar.

Berikut maksudnya untuk anda:

- **Ejen AI kini adalah beban kerja azd kelas pertama.** Anda boleh memulakan, menyebarkan, dan mengurus projek ejen AI menggunakan alur kerja yang sama `azd init` → `azd up` yang sudah anda tahu.
- **Kitaran hayat ejen lengkap dari CLI.** Sambungan `azure.ai.agents` kini merangkumi keseluruhan perjalanan—`azd ai agent init` untuk skafold, `azd ai agent invoke` untuk menguji (dengan output waktu tindak balas), `azd ai agent eval generate` dan `azd ai agent optimize` untuk mengukur dan meningkatkan kualiti, dan `azd ai agent delete` untuk pembersihan.
- **Lebih banyak blok binaan AI.** Sambungan pratonton baru—`azure.ai.skills` dan `azure.ai.connections`—membolehkan anda mengurus kemahiran ejen yang boleh digunakan semula dan sambungan Foundry terus dengan azd.
- **Integrasi Microsoft Foundry** membawa penyebaran model, hosting ejen, dan konfigurasi perkhidmatan AI terus ke ekosistem templat azd.
- **Asas lebih lancar sehari-hari.** Keluaran terkini menjadikan `azd init` idempotent (selamat untuk dijalankan semula), menjadikan `azd auth login` jelas token lama secara automatik, dan menambah prompt persediaan pertama `azd tool` yang mesra pengguna.
- **Alur kerja teras tidak berubah.** Sama ada anda menyebarkan aplikasi todo, perkhidmatan mikro, atau penyelesaian AI multi-ejen, arahan adalah sama.

> **Nota untuk pengguna Aspire:** Microsoft kini merujuk produk dengan nama ringkas **Aspire** (dahulunya ".NET Aspire"). Sokongan azd untuk Aspire tidak berubah—hanya nama yang dikemas kini.

Jika anda pernah menggunakan azd sebelum ini, sokongan AI adalah lanjutan semula jadi—bukan alat berasingan atau trek lanjutan. Jika anda bermula dari awal, anda akan belajar satu alur kerja yang berfungsi untuk semua.

---

## 🚀 Apa itu Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** adalah alat baris perintah mesra pembangun yang memudahkan penyebaran aplikasi ke Azure. Daripada secara manual mencipta dan menyambungkan puluhan sumber Azure, anda boleh menyebarkan keseluruhan aplikasi dengan satu arahan.

### Keajaiban `azd up`

```bash
# Perintah tunggal ini melakukan semuanya:
# ✅ Membuat semua sumber Azure
# ✅ Mengkonfigurasi rangkaian dan keselamatan
# ✅ Membangunkan kod aplikasi anda
# ✅ Melaksanakan ke Azure
# ✅ Memberikan anda URL yang berfungsi
azd up
```

**Itu sahaja!** Tiada klik Azure Portal, tiada templat ARM yang kompleks untuk belajar dahulu, tiada konfigurasi manual - hanya aplikasi berfungsi di Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Apakah Perbezaannya?

Ini adalah soalan paling biasa ditanya pemula. Berikut jawapan ringkas:

| Ciri | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Tujuan** | Mengurus sumber Azure individu | Menyebarkan aplikasi lengkap |
| **Pemikiran** | Fokus pada infrastruktur | Fokus pada aplikasi |
| **Contoh** | `az webapp create --name myapp...` | `azd up` |
| **Lengkung Pembelajaran** | Perlu tahu perkhidmatan Azure | Cuma tahu aplikasi anda |
| **Terbaik Untuk** | DevOps, Infrastruktur | Pembangun, Prototyping |

### Analogi Mudah

- **Azure CLI** seperti mempunyai semua alat untuk bina rumah - tukul, gergaji, paku. Anda boleh membina apa saja, tetapi anda perlu tahu pembinaan.
- **Azure Developer CLI** seperti mengupah kontraktor - anda terangkan apa yang anda mahu, dan mereka uruskan pembinaan.

### Bila Menggunakan Setiap Satu

| Senario | Gunakan Ini |
|----------|----------|
| "Saya mahu deploy web app saya dengan cepat" | `azd up` |
| "Saya perlu buat akaun storan sahaja" | `az storage account create` |
| "Saya membina aplikasi AI lengkap" | `azd init --template azure-search-openai-demo` |
| "Saya perlu debug sumber Azure tertentu" | `az resource show` |
| "Saya mahu penyebaran sedia produksi dalam beberapa minit" | `azd up --environment production` |

### Mereka Bekerja Bersama!

AZD menggunakan Azure CLI secara internal. Anda boleh guna kedua-duanya:
```bash
# Sebarkan aplikasi anda dengan AZD
azd up

# Kemudian laraskan sumber tertentu dengan Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Cari Templat Dalam Awesome AZD

Jangan mula dari kosong! **Awesome AZD** ialah koleksi komuniti templat sedia deploy:

| Sumber | Penerangan |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Semak imbas 200+ templat dengan deploy satu klik |
| 🔗 [**Hantar Templat**](https://github.com/Azure/awesome-azd/issues) | Sumbang templat anda sendiri kepada komuniti |
| 🔗 [**Repositori GitHub**](https://github.com/Azure/awesome-azd) | Bintang dan teroka sumber |

### Templat AI Popular dari Awesome AZD

```bash
# Sembang RAG dengan Model Microsoft Foundry + Carian AI
azd init --template azure-search-openai-demo

# Aplikasi Sembang AI Pantas
azd init --template openai-chat-app-quickstart

# Ejen AI dengan Ejen Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Mula Dalam 3 Langkah

Sebelum anda mula, pastikan mesin anda siap untuk templat yang anda mahu deploy:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jika ada pemeriksaan penting gagal, betulkan dulu dan teruskan dengan permulaan cepat.

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

### Langkah 2: Sahkan Pengesahan untuk AZD

```bash
# Pilihan jika anda merancang untuk menggunakan arahan Azure CLI secara langsung dalam kursus ini
az login

# Diperlukan untuk aliran kerja AZD
azd auth login
```

Jika anda tidak pasti yang mana satu anda perlukan, ikut alur lengkap dalam [Pemasangan & Persediaan](docs/chapter-01-foundation/installation.md#authentication-setup).

### Langkah 3: Deploy Aplikasi Pertama Anda

```bash
# Inisialisasi dari templat
azd init --template todo-nodejs-mongo

# Lancarkan ke Azure (mencipta segala-galanya!)
azd up
```

**🎉 Itu sahaja!** Aplikasi anda kini hidup di Azure.

### Bersihkan (Jangan Lupa!)

```bash
# Keluarkan semua sumber apabila selesai bereksperimen
azd down --force --purge
```

---

## 📚 Cara Menggunakan Kursus Ini

Kursus ini direka untuk **pembelajaran progresif** - mula di mana anda selesa dan teruskan ke atas:

| Pengalaman Anda | Mulakan Di Sini |
|-----------------|------------|
| **Baru dalam Azure** | [Bab 1: Asas](#-chapter-1-foundation--quick-start) |
| **Tahu Azure, baru dengan AZD** | [Bab 1: Asas](#-chapter-1-foundation--quick-start) |
| **Mahukan deploy aplikasi AI** | [Bab 2: Pembangunan AI-Pertama](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Mahukan latihan praktikal** | [🎓 Bengkel Interaktif](workshop/README.md) - makmal panduan 3-4 jam |
| **Perlukan corak produksi** | [Bab 8: Produksi & Perusahaan](#-chapter-8-production--enterprise-patterns) |

### Persediaan Cepat

1. **Fork Repositori Ini**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon Ia**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Dapatkan Bantuan**: [Komuniti Discord Azure](https://discord.com/invite/ByRwuEEgH4)

> **Lebih Suka Klon Secara Tempatan?**

> Repositori ini mengandungi lebih 50 terjemahan bahasa yang meningkatkan saiz muat turun secara ketara. Untuk klon tanpa terjemahan, gunakan sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ini memberikan anda segala yang diperlukan untuk menyelesaikan kursus dengan muat turun yang lebih cepat.


## Gambaran Keseluruhan Kursus

Kuasai Azure Developer CLI (azd) melalui bab berstruktur yang direka untuk pembelajaran progresif. **Fokus istimewa pada penyebaran aplikasi AI dengan integrasi Microsoft Foundry.**


### Mengapa Kursus Ini Penting untuk Pembangun Moden

Berdasarkan pandangan komuniti Microsoft Foundry Discord, **45% pembangun mahu menggunakan AZD untuk beban kerja AI** tetapi menghadapi cabaran dengan:
- Seni bina AI multi-perkhidmatan yang kompleks
- Amalan terbaik pengeluaran AI  
- Integrasi dan konfigurasi perkhidmatan Azure AI
- Pengoptimuman kos untuk beban kerja AI
- Penyelesaian masalah isu pengeluaran khusus AI

### Objektif Pembelajaran

Dengan menyelesaikan kursus berstruktur ini, anda akan:
- **Menguasai Asas AZD**: Konsep teras, pemasangan, dan konfigurasi
- **Melaksanakan Deploy Aplikasi AI**: Gunakan AZD dengan perkhidmatan Microsoft Foundry
- **Melaksanakan Infrastruktur sebagai Kod**: Urus sumber Azure dengan templat Bicep
- **Selesaikan Masalah Deploy**: Menyelesaikan isu biasa dan membaiki masalah
- **Mengoptimumkan untuk Pengeluaran**: Keselamatan, penskalaan, pemantauan, dan pengurusan kos
- **Membangun Penyelesaian Multi-Ejen**: Deploy seni bina AI yang kompleks

## Sebelum Anda Mula: Akaun, Akses, dan Asumsi

Sebelum anda mulakan Bab 1, pastikan anda mempunyai perkara berikut. Langkah pemasangan kemudian dalam panduan ini menganggap perkara asas ini sudah diuruskan.

- **Langganan Azure**: Anda boleh menggunakan langganan sedia ada dari tempat kerja atau akaun anda sendiri, atau buat [percubaan percuma](https://aka.ms/azurefreetrial) untuk bermula.
- **Kebenaran untuk mencipta sumber Azure**: Untuk kebanyakan latihan, anda harus mempunyai sekurang-kurangnya akses **Contributor** pada langganan atau kumpulan sumber sasaran. Sesetengah bab juga menganggap anda boleh mencipta kumpulan sumber, pengenalan terurus, dan penetapan RBAC.
- [**Akaun GitHub**](https://github.com): Ini berguna untuk mem-fork repositori, menjejak perubahan anda sendiri, dan menggunakan GitHub Codespaces untuk bengkel.
- **Prasyarat runtime templat**: Sesetengah templat memerlukan alat tempatan seperti Node.js, Python, Java, atau Docker. Jalankan validator setup sebelum bermula agar dapat mengesan alat yang hilang awal.
- **Kefahaman asas terminal**: Anda tidak perlu jadi pakar, tetapi anda harus selesa menjalankan arahan seperti `git clone`, `azd auth login`, dan `azd up`.

> **Bekerja dalam langganan perusahaan?**
> Jika persekitaran Azure anda diuruskan oleh pentadbir, sahkan lebih awal bahawa anda boleh melaksanakan sumber dalam langganan atau kumpulan sumber yang anda rancang guna. Jika tidak, minta langganan sandbox atau akses Contributor sebelum anda mula.

> **Baru kepada Azure?**
> Mulakan dengan percubaan Azure anda sendiri atau langganan bayar-semasa di https://aka.ms/azurefreetrial supaya anda boleh menyelesaikan latihan dari mula hingga akhir tanpa menunggu kelulusan tenant.

## 🗺️ Peta Kursus: Navigasi Pantas Mengikut Bab

Setiap bab mempunyai README khusus dengan objektif pembelajaran, panduan cepat, dan latihan:

| Bab | Topik | Pelajaran | Tempoh | Kerumitan |
|---------|-------|---------|----------|------------|
| **[Bab 1: Asas](docs/chapter-01-foundation/README.md)** | Memulakan | [Asas AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Pemasangan](docs/chapter-01-foundation/installation.md) &#124; [Projek Pertama](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Bab 2: Pembangunan AI](docs/chapter-02-ai-development/README.md)** | Aplikasi AI-Pertama | [Integrasi Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Ejen AI](docs/chapter-02-ai-development/agents.md) &#124; [Deploy Model AI](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Bengkel](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 jam | ⭐⭐ |
| **[Bab 3: Konfigurasi](docs/chapter-03-configuration/README.md)** | Auth & Keselamatan | [Konfigurasi](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Keselamatan](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Bab 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Deploy | [Panduan Deploy](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Penyediaan](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 jam | ⭐⭐⭐ |
| **[Bab 5: Multi-Ejen](docs/chapter-05-multi-agent/README.md)** | Penyelesaian Ejen AI | [Senario Runcit](examples/retail-scenario.md) &#124; [Corak Koordinasi](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 jam | ⭐⭐⭐⭐ |
| **[Bab 6: Pra-Deploy](docs/chapter-06-pre-deployment/README.md)** | Perancangan & Pengesahan | [Pemeriksaan Pra-Terbang](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Perancangan Kapasiti](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Pemilihan SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 jam | ⭐⭐ |
| **[Bab 7: Penyelesaian Masalah](docs/chapter-07-troubleshooting/README.md)** | Debug & Perbaiki | [Isu Biasa](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [Isu AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 jam | ⭐⭐ |
| **[Bab 8: Pengeluaran](docs/chapter-08-production/README.md)** | Corak Perusahaan | [Amalan Pengeluaran](docs/chapter-08-production/production-ai-practices.md) | 2-3 jam | ⭐⭐⭐⭐ |
| **[🎓 Bengkel](workshop/README.md)** | Makmal Praktikal | [Pengenalan](workshop/docs/instructions/0-Introduction.md) &#124; [Pemilihan](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Pengesahan](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Pembongkaran](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurasi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Penyesuaian](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Pembongkaran Infrastruktur](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Penutup](workshop/docs/instructions/7-Wrap-up.md) | 3-4 jam | ⭐⭐ |

**Jumlah Tempoh Kursus:** ~10-14 jam | **Peningkatan Kemahiran:** Pemula → Sedia Pengeluaran

---

## 📚 Bab Pembelajaran

*Pilih laluan pembelajaran anda berdasarkan tahap pengalaman dan matlamat*

### 🚀 Bab 1: Asas & Permulaan Pantas
**Prasyarat**: Langganan Azure, pengetahuan asas baris perintah  
**Tempoh**: 30-45 minit  
**Kerumitan**: ⭐

#### Apa yang Akan Anda Pelajari
- Memahami asas Azure Developer CLI
- Memasang AZD pada platform anda
- Deploy pertama anda yang berjaya

#### Sumber Pembelajaran
- **🎯 Mula Di Sini**: [Apa itu Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teori**: [Asas AZD](docs/chapter-01-foundation/azd-basics.md) - Konsep teras dan terminologi
- **⚙️ Persediaan**: [Pemasangan & Persediaan](docs/chapter-01-foundation/installation.md) - Panduan khusus platform
- **🛠️ Praktikal**: [Projek Pertama Anda](docs/chapter-01-foundation/first-project.md) - Tutorial langkah demi langkah
- **📋 Rujukan Pantas**: [Lembaran Cheat Perintah](resources/cheat-sheet.md)

#### Latihan Praktikal
```bash
# Semakan pemasangan cepat
azd version

# Lancarkan aplikasi pertama anda
azd init --template todo-nodejs-mongo
azd up
```

**💡 Hasil Bab**: Berjaya deploy aplikasi web mudah ke Azure menggunakan AZD

**✅ Pengesahan Kejayaan:**
```bash
# Selepas menyelesaikan Bab 1, anda sepatutnya boleh:
azd version              # Menunjukkan versi yang dipasang
azd init --template todo-nodejs-mongo  # Memulakan projek
azd up                  # Menyebarkan ke Azure
azd show                # Memaparkan URL aplikasi yang berjalan
# Aplikasi dibuka dalam pelayar dan berfungsi
azd down --force --purge  # Membersihkan sumber-sumber
```

**📊 Masa Pelaburan:** 30-45 minit  
**📈 Tahap Kemahiran Selepas:** Boleh deploy aplikasi asas secara berdikari
**📈 Tahap Kemahiran Selepas:** Boleh deploy aplikasi asas secara berdikari

---

### 🤖 Bab 2: Pembangunan AI-Pertama (Disarankan untuk Pembangun AI)
**Prasyarat**: Bab 1 selesai  
**Tempoh**: 1-2 jam  
**Kerumitan**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Integrasi Microsoft Foundry dengan AZD
- Deploy aplikasi berkuasa AI
- Memahami konfigurasi perkhidmatan AI

#### Sumber Pembelajaran
- **🎯 Mula Di Sini**: [Integrasi Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Ejen AI**: [Panduan Ejen AI](docs/chapter-02-ai-development/agents.md) - Deploy ejen pintar dengan AZD
- **📖 Corak**: [Deploy Model AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Deploy dan urus model AI
- **🛠️ Bengkel**: [Bengkel AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Jadikan penyelesaian AI anda sedia AZD
- **🎥 Panduan Interaktif**: [Bahan Bengkel](workshop/README.md) - Pembelajaran berasaskan pelayar dengan MkDocs * Persekitaran DevContainer
- **📋 Templat**: [Templat Microsoft Foundry](#sumber-bengkel)
- **📝 Contoh**: [Contoh Deploy AZD](examples/README.md)

#### Latihan Praktikal
```bash
# Lancarkan aplikasi AI pertama anda
azd init --template azure-search-openai-demo
azd up

# Cuba templat AI tambahan
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Hasil Bab**: Deploy dan konfigurasi aplikasi chat berkuasa AI dengan kemampuan RAG

**✅ Pengesahan Kejayaan:**
```bash
# Selepas Bab 2, anda sepatutnya boleh:
azd init --template azure-search-openai-demo
azd up
# Uji antara muka sembang AI
# Tanyakan soalan dan dapatkan respons dipacu AI dengan sumber
# Sahkan integrasi carian berfungsi
azd monitor  # Semak Application Insights menunjukkan telemetri
azd down --force --purge
```

**📊 Masa Pelaburan:** 1-2 jam  
**📈 Tahap Kemahiran Selepas:** Boleh deploy dan konfigurasi aplikasi AI sedia pengeluaran  
**💰 Kesedaran Kos:** Faham kos dev $80-150/bulan, kos pengeluaran $300-3500/bulan

#### 💰 Pertimbangan Kos untuk Deploy AI

**Persekitaran Pembangunan (Anggaran $80-150/bulan):**
- Model Microsoft Foundry (Bayar-semasa): $0-50/bulan (berdasarkan penggunaan token)
- AI Search (tier Asas): $75/bulan
- Container Apps (Penggunaan): $0-20/bulan
- Penyimpanan (Standard): $1-5/bulan

**Persekitaran Pengeluaran (Anggaran $300-3,500+/bulan):**
- Model Microsoft Foundry (PTU untuk prestasi konsisten): $3,000+/bulan ATAU Bayar-semasa dengan volum tinggi
- AI Search (tier Standard): $250/bulan
- Container Apps (Dedicated): $50-100/bulan
- Application Insights: $5-50/bulan
- Penyimpanan (Premium): $10-50/bulan

**💡 Tips Pengoptimuman Kos:**
- Gunakan Model Microsoft Foundry **Tier Percuma** untuk pembelajaran (Azure OpenAI termasuk 50,000 token/bulan)
- Jalankan `azd down` untuk membebaskan sumber apabila tidak sedang membangun
- Mula dengan bil berasaskan penggunaan, naik taraf ke PTU hanya untuk pengeluaran
- Gunakan `azd provision --preview` untuk anggar kos sebelum deploy
- Aktifkan auto-scaling: bayar hanya untuk penggunaan sebenar

**Pemantauan Kos:**
```bash
# Semak anggaran kos bulanan
azd provision --preview

# Pantau kos sebenar di Portal Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Bab 3: Konfigurasi & Pengesahan
**Prasyarat**: Bab 1 selesai  
**Tempoh**: 45-60 minit  
**Kerumitan**: ⭐⭐

#### Apa yang Akan Anda Pelajari
- Konfigurasi dan pengurusan persekitaran
- Amalan terbaik pengesahan dan keselamatan
- Penamaan dan pengurusan sumber

#### Sumber Pembelajaran
- **📖 Konfigurasi**: [Panduan Konfigurasi](docs/chapter-03-configuration/configuration.md) - Persediaan persekitaran
- **🔐 Keselamatan**: [Corak Pengesahan dan identiti terurus](docs/chapter-03-configuration/authsecurity.md) - Corak pengesahan
- **📝 Contoh**: [Contoh Aplikasi Pangkalan Data](examples/database-app/README.md) - Contoh Database AZD

#### Latihan Praktikal
- Konfigurasi pelbagai persekitaran (dev, staging, prod)
- Sediakan pengesahan identiti terurus
- Laksanakan konfigurasi khusus persekitaran

**💡 Hasil Bab**: Urus pelbagai persekitaran dengan pengesahan dan keselamatan yang betul

---

### 🏗️ Bab 4: Infrastruktur sebagai Kod & Deploy
**Prasyarat**: Bab 1-3 selesai  
**Tempoh**: 1-1.5 jam  
**Kerumitan**: ⭐⭐⭐

#### Apa yang Akan Anda Pelajari
- Corak deploy lanjutan
- Infrastruktur sebagai Kod dengan Bicep
- Strategi penyediaan sumber

#### Sumber Pembelajaran
- **📖 Deploy**: [Panduan Deploy](docs/chapter-04-infrastructure/deployment-guide.md) - Aliran kerja lengkap
- **🏗️ Penyediaan**: [Penyediaan Sumber](docs/chapter-04-infrastructure/provisioning.md) - Pengurusan sumber Azure
- **📝 Contoh**: [Contoh Aplikasi Kontena](../../examples/container-app) - Deploy berasaskan kontena

#### Latihan Praktikal
- Cipta templat Bicep tersuai
- Deploy aplikasi multi-perkhidmatan
- Laksanakan strategi deploy blue-green

**💡 Hasil Bab**: Deploy aplikasi multi-perkhidmatan kompleks menggunakan templat infrastruktur tersuai

---


### 🎯 Bab 5: Penyelesaian AI Pelbagai Ejen (Lanjutan)
**Prasyarat**: Bab 1-2 selesai  
**Tempoh**: 2-3 jam  
**Kerumitan**: ⭐⭐⭐⭐

#### Apa yang Anda Akan Pelajari
- Corak seni bina berbilang ejen
- Orkestrasi dan penyelarasan ejen
- Penempatan AI sedia produksi

#### Sumber Pembelajaran
- **🤖 Projek Pilihan**: [Penyelesaian Pelbagai Ejen Runcit](examples/retail-scenario.md) - Pelaksanaan lengkap
- **🛠️ Templat ARM**: [Pakej Templat ARM](../../examples/retail-multiagent-arm-template) - Penempatan satu klik
- **📖 Seni Bina**: [Corak penyelarasan pelbagai ejen](docs/chapter-06-pre-deployment/coordination-patterns.md) - Corak

#### Latihan Praktikal
```bash
# Laksanakan penyelesaian agen pelbagai runcit lengkap
cd examples/retail-multiagent-arm-template
./deploy.sh

# Terokai konfigurasi agen
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Hasil Bab**: Menempatkan dan mengurus penyelesaian AI pelbagai ejen sedia produksi dengan ejen Pelanggan dan Inventori

---

### 🔍 Bab 6: Pengesahan & Perancangan Pra-Penempatan
**Prasyarat**: Bab 4 selesai  
**Tempoh**: 1 jam  
**Kerumitan**: ⭐⭐

#### Apa yang Anda Akan Pelajari
- Perancangan kapasiti dan pengesahan sumber
- Strategi pemilihan SKU
- Pemeriksaan pra-penerbangan dan automasi

#### Sumber Pembelajaran
- **📊 Perancangan**: [Perancangan Kapasiti](docs/chapter-06-pre-deployment/capacity-planning.md) - Pengesahan sumber
- **💰 Pemilihan**: [Pemilihan SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Pilihan berpatutan kos
- **✅ Pengesahan**: [Pemeriksaan Pra-penerbangan](docs/chapter-06-pre-deployment/preflight-checks.md) - Skrip automatik

#### Latihan Praktikal
- Jalankan skrip pengesahan kapasiti
- Optimumkan pemilihan SKU untuk kos
- Laksanakan pemeriksaan pra-penempatan automatik

**💡 Hasil Bab**: Mengesahkan dan mengoptimumkan penempatan sebelum pelaksanaan

---

### 🚨 Bab 7: Penyelesaian Masalah & Pengesanan Ralat
**Prasyarat**: Mana-mana bab penempatan selesai  
**Tempoh**: 1-1.5 jam  
**Kerumitan**: ⭐⭐

#### Apa yang Anda Akan Pelajari
- Pendekatan debugging sistematik
- Isu biasa dan penyelesaian
- Penyelesaian masalah khas AI

#### Sumber Pembelajaran
- **🔧 Isu Biasa**: [Isu Biasa](docs/chapter-07-troubleshooting/common-issues.md) - Soalan Lazim dan penyelesaian
- **🕵️ Debugging**: [Panduan Debugging](docs/chapter-07-troubleshooting/debugging.md) - Strategi langkah demi langkah
- **🤖 Isu AI**: [Penyelesaian Masalah AI-Khusus](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Masalah perkhidmatan AI

#### Latihan Praktikal
- Mendiagnosis kegagalan penempatan
- Menyelesaikan isu pengesahan
- Debug sambungan perkhidmatan AI

**💡 Hasil Bab**: Mendiagnosis dan menyelesaikan isu penempatan biasa secara berdikari

---

### 🏢 Bab 8: Corak Produksi & Perusahaan
**Prasyarat**: Bab 1-4 selesai  
**Tempoh**: 2-3 jam  
**Kerumitan**: ⭐⭐⭐⭐

#### Apa yang Anda Akan Pelajari
- Strategi penempatan produksi
- Corak keselamatan perusahaan
- Pemantauan dan pengoptimuman kos

#### Sumber Pembelajaran
- **🏭 Produksi**: [Amalan Terbaik AI Produksi](docs/chapter-08-production/production-ai-practices.md) - Corak perusahaan
- **📝 Contoh**: [Contoh Microservices](../../examples/microservices) - Seni bina kompleks
- **📊 Pemantauan**: [Integrasi Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Pemantauan

#### Latihan Praktikal
- Laksanakan corak keselamatan perusahaan
- Sediakan pemantauan menyeluruh
- Tempatkan ke produksi dengan tadbir urus yang betul

**💡 Hasil Bab**: Menempatkan aplikasi siap perusahaan dengan keupayaan produksi penuh

---

## 🎓 Gambaran Keseluruhan Bengkel: Pengalaman Pembelajaran Amali

> **⚠️ STATUS BENGKEL: Pembangunan Aktif**  
> Bahan bengkel sedang dibangunkan dan diperhalusi. Modul teras berfungsi, tetapi beberapa bahagian lanjutan belum lengkap. Kami sedang berusaha melengkapkan semua kandungan. [Jejak kemajuan →](workshop/README.md)

### Bahan Bengkel Interaktif
**Pembelajaran amali komprehensif dengan alat berasaskan pelayar dan latihan berpanduan**

Bahan bengkel kami menyediakan pengalaman pembelajaran interaktif yang tersusun yang melengkapkan kurikulum berasaskan bab di atas. Bengkel direka untuk pembelajaran kendiri dan sesi dipimpin pengajar.

#### 🛠️ Ciri Bengkel
- **Antara Muka Berasaskan Pelayar**: Bengkel lengkap dijana MkDocs dengan carian, salin dan ciri tema
- **Integrasi GitHub Codespaces**: Persediaan persekitaran pembangunan satu klik
- **Laluan Pembelajaran Berstruktur**: 8 modul latihan berpanduan (3-4 jam keseluruhan)
- **Metodologi Progresif**: Pengenalan → Pemilihan → Pengesahan → Penjelasan → Konfigurasi → Penyesuaian → Pembongkaran → Penutup
- **Persekitaran DevContainer Interaktif**: Alat dan pergantungan telah dikonfigurasikan awal

#### 📚 Struktur Modul Bengkel
Bengkel mengikuti **metodologi progresif 8-modul** yang membawa anda dari penerokaan ke kemahiran penempatan:

| Modul | Topik | Apa yang Anda Akan Lakukan | Tempoh |
|--------|-------|----------------|----------|
| **0. Pengenalan** | Gambaran Bengkel | Memahami objektif pembelajaran, prasyarat, dan struktur bengkel | 15 min |
| **1. Pemilihan** | Penemuan Templat | Terokai templat AZD dan pilih templat AI sesuai untuk senario anda | 20 min |
| **2. Pengesahan** | Penempatan & Pengesahan | Tempatkan templat menggunakan `azd up` dan sahkan infrastruktur berfungsi | 30 min |
| **3. Penjelasan** | Fahami Struktur | Gunakan GitHub Copilot untuk terokai seni bina templat, fail Bicep, dan organisasi kod | 30 min |
| **4. Konfigurasi** | Pendalaman azure.yaml | Kuasai konfigurasi `azure.yaml`, kaitan kitaran hayat, dan pembolehubah persekitaran | 30 min |
| **5. Penyesuaian** | Jadikan Milik Anda | Aktifkan AI Search, penjejakan, penilaian, dan sesuaikan untuk senario anda | 45 min |
| **6. Pembongkaran** | Bersihkan | Nyahbekal sumber dengan selamat menggunakan `azd down --purge` | 15 min |
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
# Pilihan 1: GitHub Codespaces (Disyorkan)
# Klik "Code" → "Create codespace on main" dalam repositori

# Pilihan 2: Pembangunan Tempatan
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Ikuti arahan pemasangan di workshop/README.md
```

#### 🎯 Hasil Pembelajaran Bengkel
Dengan melengkapkan bengkel, peserta akan:
- **Tempatkan Aplikasi AI Produksi**: Gunakan AZD dengan perkhidmatan Microsoft Foundry
- **Kuasai Seni Bina Pelbagai Ejen**: Laksanakan penyelesaian penyelarasan ejen AI
- **Laksanakan Amalan Keselamatan Terbaik**: Konfigurasi pengesahan dan kawalan akses
- **Optimumkan untuk Skala**: Reka bentuk penempatan berprestasi dan kos efektif
- **Selesaikan Masalah Penempatan**: Atasi isu biasa secara berdikari

#### 📖 Sumber Bengkel
- **🎥 Panduan Interaktif**: [Bahan Bengkel](workshop/README.md) - Persekitaran pembelajaran berasaskan pelayar
- **📋 Arahan Modul demi Modul**:
  - [0. Pengenalan](workshop/docs/instructions/0-Introduction.md) - Gambaran bengkel dan objektif
  - [1. Pemilihan](workshop/docs/instructions/1-Select-AI-Template.md) - Cari dan pilih templat AI
  - [2. Pengesahan](workshop/docs/instructions/2-Validate-AI-Template.md) - Tempatkan dan sahkan templat
  - [3. Penjelasan](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Terokai seni bina templat
  - [4. Konfigurasi](workshop/docs/instructions/4-Configure-AI-Template.md) - Kuasai azure.yaml
  - [5. Penyesuaian](workshop/docs/instructions/5-Customize-AI-Template.md) - Sesuaikan untuk senario anda
  - [6. Pembongkaran](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Bersihkan sumber
  - [7. Penutup](workshop/docs/instructions/7-Wrap-up.md) - Semak dan langkah seterusnya
- **🛠️ Makmal Bengkel AI**: [Makmal Bengkel AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Latihan berfokus AI
- **💡 Mula Pantas**: [Panduan Persediaan Bengkel](workshop/README.md#quick-start) - Konfigurasi persekitaran

**Sesuai untuk**: Latihan korporat, kursus universiti, pembelajaran kendiri, dan bootcamp pembangun.

---

## 📖 Pendalaman: Keupayaan AZD

Selain asas, AZD menyediakan ciri berkuasa untuk penempatan produksi:

- **Penempatan berasaskan templat** - Gunakan templat sedia ada untuk corak aplikasi biasa
- **Infrastruktur sebagai Kod** - Urus sumber Azure menggunakan Bicep atau Terraform  
- **Aliran kerja terintegrasi** - Sedia menggunakan, tempatkan, dan pantau aplikasi dengan lancar
- **Mesra Pembangun** - Dioptimumkan untuk produktiviti dan pengalaman pembangun

### **AZD + Microsoft Foundry: Sesuai untuk Penempatan AI**

**Mengapa AZD untuk Penyelesaian AI?** AZD menangani cabaran utama yang dihadapi pembangun AI:

- **Templat Sedia AI** - Templat yang dikonfigurasikan untuk Microsoft Foundry Models, Perkhidmatan Azure AI, dan beban kerja ML
- **Penempatan AI Selamat** - Corak keselamatan terbina dalam untuk perkhidmatan AI, kekunci API, dan titik akhir model  
- **Corak AI Produksi** - Amalan terbaik untuk penempatan aplikasi AI berskala dan kos efektif
- **Aliran Kerja AI End-to-End** - Dari pembangunan model hingga penempatan produksi dengan pemantauan yang betul
- **Pengoptimuman Kos** - Strategi penyaluran dan penskalaan sumber yang pintar untuk beban kerja AI
- **Integrasi Microsoft Foundry** - Sambungan lancar ke katalog model dan titik akhir Microsoft Foundry

---

## 🎯 Perpustakaan Templat & Contoh

### Pilihan: Templat Microsoft Foundry
**Mula di sini jika anda menempatkan aplikasi AI!**

> **Nota:** Templat ini menunjukkan pelbagai corak AI. Ada yang dari Contoh Azure luar, yang lain pelaksanaan tempatan.

| Templat | Bab | Kerumitan | Perkhidmatan | Jenis |
|----------|---------|------------|----------|------|
| [**Mula dengan sembang AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bab 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Luar |
| [**Mula dengan agen AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Bab 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Luar |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bab 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Luar |
| [**Mula cepat Aplikasi Sembang OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bab 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Luar |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bab 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Luar |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Bab 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Luar |
| [**Penyelesaian Pelbagai Ejen Runcit**](examples/retail-scenario.md) | Bab 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Tempatan** |

### Pilihan: Senario Pembelajaran Lengkap
**Templat aplikasi siap produksi yang dipetakan ke bab pembelajaran**

| Templat | Bab Pembelajaran | Kerumitan | Pembelajaran Utama |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bab 2 | ⭐ | Corak penempatan AI asas |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bab 2 | ⭐⭐ | Pelaksanaan RAG dengan Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Bab 4 | ⭐⭐ | Integrasi Kecerdasan Dokumen |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bab 5 | ⭐⭐⭐ | Rangka kerja ejen dan pemanggilan fungsi |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Bab 8 | ⭐⭐⭐ | Orkestrasi AI perusahaan |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Bab 5 | ⭐⭐⭐⭐ | Seni bina pelbagai ejen dengan ejen Pelanggan dan Inventori |

### Pembelajaran Mengikut Jenis Contoh

> **📌 Contoh Tempatan vs. Luar:**  
> **Contoh Tempatan** (dalam repo ini) = Sedia untuk digunakan serta-merta  
> **Contoh Luar** (Contoh Azure) = Klon dari repositori yang dipautkan

#### Contoh Tempatan (Sedia untuk Digunakan)
- [**Penyelesaian Pelbagai Ejen Runcit**](examples/retail-scenario.md) - Pelaksanaan siap produksi lengkap dengan templat ARM
  - Seni bina pelbagai ejen (ejen Pelanggan + Inventori)
  - Pemantauan dan penilaian menyeluruh
  - Penempatan satu klik melalui templat ARM

#### Contoh Tempatan - Aplikasi Kontena (Bab 2-5)
**Contoh penempatan kontena komprehensif dalam repositori ini:**

- [**Contoh Aplikasi Kontena**](examples/container-app/README.md) - Panduan lengkap untuk penyebaran berkontena
  - [API Flask Mudah](../../examples/container-app/simple-flask-api) - API REST asas dengan kemampuan skala hingga sifar
  - [Senibina Mikrosservis](../../examples/container-app/microservices) - Penyebaran multi-perkhidmatan siap produksi
  - Corak penyebaran Mula Pantas, Produksi, dan Lanjutan
  - Panduan pemantauan, keselamatan, dan pengoptimuman kos

#### Contoh Luaran - Aplikasi Ringkas (Bab 1-2)
**Salin repositori Contoh Azure ini untuk mula belajar:**
- [Aplikasi Web Mudah - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Corak penyebaran asas
- [Laman Web Statik - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Penyebaran kandungan statik
- [Aplikasi Kontena - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Penyebaran API REST

#### Contoh Luaran - Integrasi Pangkalan Data (Bab 3-4)  
- [Aplikasi Pangkalan Data - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Corak sambungan pangkalan data
- [Fungsi + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Aliran kerja data tanpa pelayan

#### Contoh Luaran - Corak Lanjutan (Bab 4-8)
- [Mikrosservis Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Senibina multi-perkhidmatan
- [Pekerjaan Aplikasi Kontena](https://github.com/Azure-Samples/container-apps-jobs) - Pemprosesan latar belakang  
- [Rangkaian ML Perusahaan](https://github.com/Azure-Samples/mlops-v2) - Corak ML siap produksi

### Koleksi Templat Luaran
- [**Galeri Templat Rasmi AZD**](https://azure.github.io/awesome-azd/) - Koleksi templat rasmi dan komuniti yang dikurasi
- [**Templat Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasi templat Microsoft Learn
- [**Direktori Contoh**](examples/README.md) - Contoh pembelajaran tempatan dengan penjelasan terperinci

---

## 📚 Sumber Pembelajaran & Rujukan

### Rujukan Pantas
- [**Lembaran Cheat Perintah**](resources/cheat-sheet.md) - Perintah azd penting diatur mengikut bab
- [**Glosari**](resources/glossary.md) - Terminologi Azure dan azd  
- [**Soalan Lazim**](resources/faq.md) - Soalan biasa diatur mengikut bab pembelajaran
- [**Panduan Belajar**](resources/study-guide.md) - Latihan praktikal menyeluruh

### Bengkel Praktikal
- [**Makmal Bengkel AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Menjadikan penyelesaian AI AZD-boleh dikerahkan (2-3 jam)
- [**Bengkel Interaktif**](workshop/README.md) - Latihan berpandu 8 modul dengan MkDocs dan GitHub Codespaces
  - Mengikut perjalanan: Pengenalan → Pemilihan → Pengesahan → Dekonstruksi → Konfigurasi → Penyesuaian → Pembongkaran → Penutup

### Sumber Pembelajaran Luaran
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pusat Senibina Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulator Harga Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status Azure](https://status.azure.com/)

### Kemahiran Ejen AI untuk Penyunting Anda
- [**Kemahiran Microsoft Azure pada skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 kemahiran ejen terbuka untuk Azure AI, Foundry, penyebaran, diagnostik, pengoptimuman kos, dan banyak lagi. Pasang mereka dalam GitHub Copilot, Cursor, Claude Code, atau mana-mana ejen yang disokong:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Panduan Penyelesaian Masalah Pantas

**Isu biasa yang dihadapi oleh pemula dan penyelesaian segera:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Pasang AZD dahulu
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Sahkan pemasangan
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Senaraikan langganan yang tersedia
az account list --output table

# Tetapkan langganan lalai
az account set --subscription "<subscription-id-or-name>"

# Tetapkan untuk persekitaran AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Sahkan
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Cuba rantau Azure yang berbeza
azd env set AZURE_LOCATION "westus2"
azd up

# Atau gunakan SKU yang lebih kecil dalam pembangunan
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Pilihan 1: Bersihkan dan cuba semula
azd down --force --purge
azd up

# Pilihan 2: Betulkan infrastruktur sahaja
azd provision

# Pilihan 3: Semak status terperinci
azd show

# Pilihan 4: Semak log dalam Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Autentikasi semula untuk AZD
azd auth logout
azd auth login

# Pilihan: segarkan Azure CLI juga jika anda menjalankan arahan az
az logout
az login

# Sahkan pengesahan
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD menghasilkan nama unik, tetapi jika berlaku konflik:
azd down --force --purge

# Kemudian cuba semula dengan persekitaran baru
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Masa menunggu biasa:**
- Aplikasi web mudah: 5-10 minit
- Aplikasi dengan pangkalan data: 10-15 minit
- Aplikasi AI: 15-25 minit (Penyediaan OpenAI adalah perlahan)

```bash
# Semak kemajuan
azd show

# Jika tersekat >30 minit, semak Azure Portal:
azd monitor --overview
# Cari penyebaran yang gagal
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Semak peranan Azure anda
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Anda memerlukan sekurang-kurangnya peranan "Contributor"
# Minta pentadbir Azure anda untuk memberikan:
# - Contributor (untuk sumber)
# - User Access Administrator (untuk penugasan peranan)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Papar semua titik akhir perkhidmatan
azd show

# Atau buka Azure Portal
azd monitor

# Semak perkhidmatan tertentu
azd env get-values
# Cari pembolehubah *_URL
```
</details>

### 📚 Sumber Penyelesaian Masalah Penuh

- **Panduan Isu Biasa:** [Penyelesaian Terperinci](docs/chapter-07-troubleshooting/common-issues.md)
- **Isu Spesifik AI:** [Penyelesaian Masalah AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Panduan Debugging:** [Debugging langkah demi langkah](docs/chapter-07-troubleshooting/debugging.md)
- **Dapatkan Bantuan:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Penyempurnaan Kursus & Pensijilan

### Penjejakan Kemajuan
Jejaki kemajuan pembelajaran anda melalui setiap bab:

- [ ] **Bab 1**: Asas & Mula Pantas ✅
- [ ] **Bab 2**: Pembangunan AI-Pertama ✅  
- [ ] **Bab 3**: Konfigurasi & Pengesahan ✅
- [ ] **Bab 4**: Infrastruktur sebagai Kod & Penyebaran ✅
- [ ] **Bab 5**: Penyelesaian AI Multi-Ejen ✅
- [ ] **Bab 6**: Pengesahan & Perancangan Pra-Penyebaran ✅
- [ ] **Bab 7**: Penyelesaian Masalah & Debugging ✅
- [ ] **Bab 8**: Corak Produksi & Perusahaan ✅

### Pengesahan Pembelajaran
Setelah menyelesaikan setiap bab, sahkan pengetahuan anda dengan:
1. **Latihan Praktikal**: Lengkapkan penyebaran praktikal bab tersebut
2. **Ujian Pengetahuan**: Semak bahagian FAQ untuk bab anda
3. **Perbincangan Komuniti**: Berkongsi pengalaman anda di Azure Discord
4. **Bab Seterusnya**: Beralih ke tahap kerumitan berikutnya

### Manfaat Penyempurnaan Kursus
Setelah menamatkan semua bab, anda akan mempunyai:
- **Pengalaman Produksi**: Menerapkan aplikasi AI sebenar ke Azure
- **Kemahiran Profesional**: Keupayaan penyebaran siap perusahaan  
- **Pengiktirafan Komuniti**: Ahli aktif komuniti pembangun Azure
- **Kemajuan Kerjaya**: Kepakaran AZD dan penyebaran AI yang sangat dicari

---

## 🤝 Komuniti & Sokongan

### Dapatkan Bantuan & Sokongan
- **Isu Teknikal**: [Laporkan pepijat dan minta ciri](https://github.com/microsoft/azd-for-beginners/issues)
- **Soalan Pembelajaran**: [Komuniti Discord Microsoft Azure](https://discord.gg/microsoft-azure) dan [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Bantuan Spesifik AI**: Sertai [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasi**: [Dokumentasi rasmi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Pandangan Komuniti dari Microsoft Foundry Discord

**Keputusan Tinjauan Terkini dari Saluran #Azure:**
- **45%** pembangun ingin menggunakan AZD untuk beban kerja AI
- **Cabaran utama**: Penyebaran multi-perkhidmatan, pengurusan kelayakan, kesediaan produksi  
- **Permintaan tertinggi**: Templat khusus AI, panduan penyelesaian masalah, amalan terbaik

**Sertai komuniti kami untuk:**
- Berkongsi pengalaman AZD + AI anda dan dapatkan bantuan
- Akses pratonton awal templat AI baru
- Menyumbang pada amalan terbaik penyebaran AI
- Mempengaruhi pembangunan ciri AI + AZD masa depan

### Menyumbang kepada Kursus
Kami mengalu-alukan sumbangan! Sila baca [Panduan Menyumbang](CONTRIBUTING.md) kami untuk butiran mengenai:
- **Penambahbaikan Kandungan**: Tingkatkan bab dan contoh sedia ada
- **Contoh Baru**: Tambah senario dan templat dunia sebenar  
- **Terjemahan**: Bantu mengekalkan sokongan berbilang bahasa
- **Laporan Pepijat**: Tingkatkan ketepatan dan kejelasan
- **Standard Komuniti**: Patuhi garis panduan komuniti inklusif kami

---

## 📄 Maklumat Kursus

### Lesen
Projek ini dilesenkan di bawah Lesen MIT - lihat fail [LICENSE](../../LICENSE) untuk butiran.

### Sumber Microsoft Learning Berkaitan

Pasukan kami menghasilkan kursus pembelajaran menyeluruh lain:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Ejen
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Siri AI Generatif
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Pembelajaran Teras
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Siri Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigasi Kursus

**🚀 Sedia untuk Mula Belajar?**

**Pemula**: Mula dengan [Bab 1: Asas & Mula Pantas](#-chapter-1-foundation--quick-start)  
**Pembangun AI**: Terus ke [Bab 2: Pembangunan Pertama AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Pembangun Berpengalaman**: Mulakan dengan [Bab 3: Konfigurasi & Pengesahan](#️-chapter-3-configuration--authentication)

**Langkah Seterusnya**: [Mula Bab 1 - Asas AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->