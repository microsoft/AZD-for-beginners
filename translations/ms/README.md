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
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](./README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Lebih suka Klon Secara Tempatan?**
>
> Repositori ini termasuk lebih 50 terjemahan bahasa yang secara signifikan meningkatkan saiz muat turun. Untuk klon tanpa terjemahan, gunakan sparse checkout:
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
> Ini memberi anda segala yang diperlukan untuk melengkapkan kursus dengan muat turun yang jauh lebih pantas.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Apa Yang Baru dalam azd Hari Ini

Azure Developer CLI telah berkembang melebihi aplikasi web dan API tradisional. Hari ini, azd adalah alat tunggal untuk menyebarkan **mana-mana** aplikasi ke Azure—termasuk aplikasi berkuasa AI dan ejen pintar.

Ini maksudnya untuk anda:

- **Ejen AI kini merupakan beban kerja azd kelas pertama.** Anda boleh memulakan, menyebarkan, dan mengurus projek ejen AI menggunakan aliran kerja `azd init` → `azd up` yang sudah anda kenali.
- **Integrasi Microsoft Foundry** membawa penyebaran model, pengehosan ejen, dan konfigurasi perkhidmatan AI terus ke ekosistem template azd.
- **Aliran kerja teras tidak berubah.** Sama ada anda menyebarkan aplikasi todo, mikroservis, atau penyelesaian AI multi-ejen, perintahnya sama.

Jika anda pernah menggunakan azd sebelumnya, sokongan AI adalah lanjutan alami—bukan alat berasingan atau trek maju. Jika anda bermula dari awal, anda akan belajar satu aliran kerja yang berfungsi untuk semua.

---

## 🚀 Apakah Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** adalah alat baris perintah mesra pembangun yang memudahkan penyebaran aplikasi ke Azure. Daripada membuat dan menyambungkan puluhan sumber Azure secara manual, anda boleh menyebarkan keseluruhan aplikasi dengan satu arahan.

### Keajaiban `azd up`

```bash
# Perintah tunggal ini melakukan semuanya:
# ✅ Mencipta semua sumber Azure
# ✅ Mengkonfigurasi rangkaian dan keselamatan
# ✅ Membina kod aplikasi anda
# ✅ Menerapkan ke Azure
# ✅ Memberikan anda URL yang berfungsi
azd up
```

**Itu sahaja!** Tiada klik Portal Azure, tiada belajar templat ARM kompleks terlebih dahulu, tiada konfigurasi manual - hanya aplikasi berfungsi di Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Apa Bezanya?

Ini adalah soalan paling biasa ditanya pemula. Berikut jawapan mudahnya:

| Ciri | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Tujuan** | Mengurus sumber Azure individu | Menyebarkan aplikasi lengkap |
| **Pemikiran** | Berfokus infrastruktur | Berfokus aplikasi |
| **Contoh** | `az webapp create --name myapp...` | `azd up` |
| **Lengkung Pembelajaran** | Perlu tahu perkhidmatan Azure | Cuma tahu aplikasi anda |
| **Terbaik Untuk** | DevOps, Infrastruktur | Pembangun, Prototip |

### Analogi Mudah

- **Azure CLI** seperti mempunyai semua alat untuk bina rumah - tukul, gergaji, paku. Anda boleh bina apa-apa, tetapi perlu tahu pembinaan.
- **Azure Developer CLI** seperti mengupah kontraktor - anda terangkan apa yang anda mahu, mereka urus pembinaan.

### Bila Guna Masing-Masing

| Senario | Guna Ini |
|----------|----------|
| "Saya mahu menyebarkan aplikasi web dengan cepat" | `azd up` |
| "Saya perlu buat akaun storan sahaja" | `az storage account create` |
| "Saya sedang bina aplikasi AI lengkap" | `azd init --template azure-search-openai-demo` |
| "Saya mahu debug sumber Azure tertentu" | `az resource show` |
| "Saya mahu penyebaran siap produksi dalam beberapa minit" | `azd up --environment production` |

### Mereka Bekerjasama!

AZD menggunakan Azure CLI di bawahnya. Anda boleh guna kedua-duanya:
```bash
# Sebarkan aplikasi anda menggunakan AZD
azd up

# Kemudian laraskan sumber tertentu dengan Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Cari Template dalam Awesome AZD

Jangan mula dari kosong! **Awesome AZD** adalah koleksi komuniti template sedia untuk disebarkan:

| Sumber | Penerangan |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Semak 200+ template dengan satu klik untuk disebarkan |
| 🔗 [**Hantar Template**](https://github.com/Azure/awesome-azd/issues) | Sumbangkan template anda sendiri ke komuniti |
| 🔗 [**Repositori GitHub**](https://github.com/Azure/awesome-azd) | Beri bintang dan teroka sumbernya |

### Template AI Popular dari Awesome AZD

```bash
# Sembang RAG dengan Model Microsoft Foundry + Carian AI
azd init --template azure-search-openai-demo

# Aplikasi Sembang AI Pantas
azd init --template openai-chat-app-quickstart

# Ejen AI dengan Ejen Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Mula dalam 3 Langkah

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

### Langkah 2: Log Masuk ke Azure

```bash
azd auth login
```

### Langkah 3: Sebarkan Aplikasi Pertama Anda

```bash
# Inisialisasi daripada templat
azd init --template todo-nodejs-mongo

# Sebarkan ke Azure (mencipta segala-galanya!)
azd up
```

**🎉 Itu sahaja!** Aplikasi anda kini berada secara langsung di Azure.

### Bersihkan (Jangan Lupa!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cara Menggunakan Kursus Ini

Kursus ini direka untuk **pembelajaran progresif** - mula di tempat anda selesa dan teruskan ke atas:

| Pengalaman Anda | Mula Di Sini |
|-----------------|------------|
| **Baru dengan Azure** | [Bab 1: Asas](#-chapter-1-foundation--quick-start) |
| **Kenal Azure, baru dengan AZD** | [Bab 1: Asas](#-chapter-1-foundation--quick-start) |
| **Mahukan penyebaran aplikasi AI** | [Bab 2: Pembangunan AI-Pertama](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Mahukan latihan praktikal** | [🎓 Bengkel Interaktif](workshop/README.md) - makmal panduan 3-4 jam |
| **Perlukan corak produksi** | [Bab 8: Produksi & Perusahaan](#-chapter-8-production--enterprise-patterns) |

### Penyediaan Cepat

1. **Fork Repositori Ini**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon Ia**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Dapatkan Bantuan**: [Komuniti Discord Azure](https://discord.com/invite/ByRwuEEgH4)

> **Lebih suka Klon Secara Tempatan?**

> Repositori ini termasuk lebih 50 terjemahan bahasa yang secara signifikan meningkatkan saiz muat turun. Untuk klon tanpa terjemahan, gunakan sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ini memberi anda segala yang diperlukan untuk melengkapkan kursus dengan muat turun yang jauh lebih pantas.


## Gambaran Keseluruhan Kursus

Kuasai Azure Developer CLI (azd) melalui bab berstruktur yang direka untuk pembelajaran progresif. **Fokus khusus pada penyebaran aplikasi AI dengan integrasi Microsoft Foundry.**

### Kenapa Kursus Ini Penting untuk Pembangun Moden

Berdasarkan pandangan komuniti Microsoft Foundry Discord, **45% pembangun mahu guna AZD untuk beban kerja AI** tetapi menghadapi cabaran dengan:
- Seni bina AI berbilang perkhidmatan yang kompleks
- Amalan terbaik penyebaran produksi AI  
- Integrasi dan konfigurasi perkhidmatan AI Azure
- Pengoptimuman kos untuk beban kerja AI
- Penyelesaian masalah isu penyebaran khusus AI

### Objektif Pembelajaran

Dengan menamatkan kursus berstruktur ini, anda akan:
- **Menguasai Asas AZD**: Konsep teras, pemasangan, dan konfigurasi
- **Menyebarkan Aplikasi AI**: Gunakan AZD dengan perkhidmatan Microsoft Foundry
- **Melaksanakan Infrastruktur sebagai Kod**: Urus sumber Azure dengan templat Bicep
- **Menyelesaikan Masalah Penyebaran**: Atasi isu biasa dan debug masalah
- **Mengoptimumkan untuk Produksi**: Keselamatan, penskalaan, pemantauan, dan pengurusan kos
- **Membangun Penyelesaian Multi-Ejen**: Sebar seni bina AI yang kompleks

## 🗺️ Peta Kursus: Navigasi Pantas mengikut Bab

Setiap bab mempunyai README khusus dengan objektif pembelajaran, mula cepat, dan latihan:

| Bab | Topik | Pelajaran | Tempoh | Kerumitan |
|---------|-------|---------|----------|------------|
| **[Bab 1: Asas](docs/chapter-01-foundation/README.md)** | Mula | [Asas AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Pemasangan](docs/chapter-01-foundation/installation.md) &#124; [Projek Pertama](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Bab 2: Pembangunan AI](docs/chapter-02-ai-development/README.md)** | Aplikasi AI-Pertama | [Integrasi Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Ejen AI](docs/chapter-02-ai-development/agents.md) &#124; [Penggunaan Model](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Bengkel](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 jam | ⭐⭐ |
| **[Bab 3: Konfigurasi](docs/chapter-03-configuration/README.md)** | Pengesahan & Keselamatan | [Konfigurasi](docs/chapter-03-configuration/configuration.md) &#124; [Pengesahan & Keselamatan](docs/chapter-03-configuration/authsecurity.md) | 45-60 minit | ⭐⭐ |
| **[Bab 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Penggunaan | [Panduan Penggunaan](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Penyediaan](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 jam | ⭐⭐⭐ |
| **[Bab 5: Multi-Ejen](docs/chapter-05-multi-agent/README.md)** | Penyelesaian Ejen AI | [Senario Runcit](examples/retail-scenario.md) &#124; [Corak Penyelarasan](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 jam | ⭐⭐⭐⭐ |
| **[Bab 6: Pra-Penggunaan](docs/chapter-06-pre-deployment/README.md)** | Perancangan & Pengesahan | [Pemeriksaan Pra-Penerbangan](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Perancangan Kapasiti](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Pemilihan SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 jam | ⭐⭐ |
| **[Bab 7: Penyelesaian Masalah](docs/chapter-07-troubleshooting/README.md)** | Nyahpepijat & Betulkan | [Isu Biasa](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Nyahpepijat](docs/chapter-07-troubleshooting/debugging.md) &#124; [Isu AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 jam | ⭐⭐ |
| **[Bab 8: Pengeluaran](docs/chapter-08-production/README.md)** | Corak Perusahaan | [Amalan Pengeluaran](docs/chapter-08-production/production-ai-practices.md) | 2-3 jam | ⭐⭐⭐⭐ |
| **[🎓 Bengkel](workshop/README.md)** | Makmal Amali | [Pengenalan](workshop/docs/instructions/0-Introduction.md) &#124; [Pemilihan](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Pengesahan](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Pembongkaran](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurasi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Penyesuaian](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Pembongkaran Infrastruktur](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Penutupan](workshop/docs/instructions/7-Wrap-up.md) | 3-4 jam | ⭐⭐ |

**Jumlah Tempoh Kursus:** ~10-14 jam | **Perkembangan Kemahiran:** Pemula → Sedia Pengeluaran

---

## 📚 Bab Pembelajaran

*Pilih laluan pembelajaran anda berdasarkan tahap pengalaman dan matlamat*

### 🚀 Bab 1: Asas & Permulaan Pantas
**Prasyarat**: Langganan Azure, pengetahuan asas baris perintah  
**Tempoh**: 30-45 minit  
**Kesukaran**: ⭐

#### Apa Yang Akan Anda Pelajari
- Memahami asas Azure Developer CLI
- Memasang AZD pada platform anda
- Penggunaan pertama yang berjaya

#### Sumber Pembelajaran
- **🎯 Mula Di Sini**: [Apa itu Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teori**: [Asas AZD](docs/chapter-01-foundation/azd-basics.md) - Konsep teras dan terminologi
- **⚙️ Persediaan**: [Pemasangan & Persediaan](docs/chapter-01-foundation/installation.md) - Panduan platform tertentu
- **🛠️ Amali**: [Projek Pertama Anda](docs/chapter-01-foundation/first-project.md) - Tutorial langkah demi langkah
- **📋 Rujukan Pantas**: [Lembaran Perintah](resources/cheat-sheet.md)

#### Latihan Praktikal
```bash
# Semakan pemasangan pantas
azd version

# Lancarkan aplikasi pertama anda
azd init --template todo-nodejs-mongo
azd up
```

**💡 Hasil Bab**: Berjaya menggunakan aplikasi web mudah ke Azure menggunakan AZD

**✅ Pengesahan Kejayaan:**
```bash
# Selepas menyelesaikan Bab 1, anda harus dapat:
azd version              # Menunjukkan versi yang dipasang
azd init --template todo-nodejs-mongo  # Memulakan projek
azd up                  # Menghantar ke Azure
azd show                # Memaparkan URL aplikasi yang sedang berjalan
# Aplikasi dibuka di pelayar dan berfungsi
azd down --force --purge  # Membersihkan sumber daya
```

**📊 Masa Pelaburan:** 30-45 minit  
**📈 Tahap Kemahiran Selepas:** Mampu menggunakan aplikasi asas secara berdikari

---

### 🤖 Bab 2: Pembangunan AI-Pertama (Disyorkan untuk Pembangun AI)
**Prasyarat**: Bab 1 selesai  
**Tempoh**: 1-2 jam  
**Kesukaran**: ⭐⭐

#### Apa Yang Akan Anda Pelajari
- Integrasi Microsoft Foundry dengan AZD
- Menggunakan aplikasi berkuasa AI
- Memahami konfigurasi perkhidmatan AI

#### Sumber Pembelajaran
- **🎯 Mula Di Sini**: [Integrasi Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Ejen AI**: [Panduan Ejen AI](docs/chapter-02-ai-development/agents.md) - Menggunakan ejen pintar dengan AZD
- **📖 Corak**: [Penggunaan Model AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Menggunakan dan mengurus model AI
- **🛠️ Bengkel**: [Makmal Bengkel AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Jadikan penyelesaian AI anda sedia AZD
- **🎥 Panduan Interaktif**: [Bahan Bengkel](workshop/README.md) - Pembelajaran berasaskan pelayar dengan MkDocs * Persekitaran DevContainer
- **📋 Templat**: [Templat Microsoft Foundry](#sumber-bengkel)
- **📝 Contoh**: [Contoh Penggunaan AZD](examples/README.md)

#### Latihan Praktikal
```bash
# Lancarkan aplikasi AI pertama anda
azd init --template azure-search-openai-demo
azd up

# Cuba templat AI tambahan
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Hasil Bab**: Menggunakan dan mengkonfigurasi aplikasi sembang berkuasa AI dengan keupayaan RAG

**✅ Pengesahan Kejayaan:**
```bash
# Selepas Bab 2, anda sepatutnya boleh:
azd init --template azure-search-openai-demo
azd up
# Uji antara muka sembang AI
# Tanyakan soalan dan dapatkan jawapan dikuasakan AI dengan sumber
# Sahkan integrasi carian berfungsi
azd monitor  # Semak Application Insights menunjukkan telemetri
azd down --force --purge
```

**📊 Masa Pelaburan:** 1-2 jam  
**📈 Tahap Kemahiran Selepas:** Boleh menggunakan dan mengkonfigurasi aplikasi AI sedia pengeluaran  
**💰 Kesedaran Kos:** Fahami kos pembangunan $80-150/sebulan, kos pengeluaran $300-3500/sebulan

#### 💰 Pertimbangan Kos untuk Penggunaan AI

**Persekitaran Pembangunan (Anggaran $80-150/bulan):**
- Model Microsoft Foundry (Bayar-ikut-guna): $0-50/bulan (berdasarkan penggunaan token)
- Carian AI (tahap asas): $75/bulan
- Container Apps (Penggunaan): $0-20/bulan
- Penyimpanan (Standard): $1-5/bulan

**Persekitaran Pengeluaran (Anggaran $300-3,500+/bulan):**
- Model Microsoft Foundry (PTU untuk prestasi konsisten): $3,000+/bulan ATAU Bayar-ikut-guna dengan jumlah tinggi
- Carian AI (tahap standard): $250/bulan
- Container Apps (Dedikasi): $50-100/bulan
- Application Insights: $5-50/bulan
- Penyimpanan (Premium): $10-50/bulan

**💡 Tip Pengoptimuman Kos:**
- Gunakan **Tahap Percuma** Model Microsoft Foundry untuk pembelajaran (Azure OpenAI termasuk 50,000 token/bulan)
- Jalankan `azd down` untuk melepaskan sumber jika tidak sedang membangunkan
- Mulakan dengan pengebilan berdasarkan penggunaan, naik taraf ke PTU hanya untuk pengeluaran
- Gunakan `azd provision --preview` untuk menganggar kos sebelum penggunaan
- Aktifkan skala automatik: bayar hanya untuk penggunaan sebenar

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
**Kesukaran**: ⭐⭐

#### Apa Yang Akan Anda Pelajari
- Konfigurasi dan pengurusan persekitaran
- Amalan terbaik pengesahan dan keselamatan
- Penamaan dan organisasi sumber

#### Sumber Pembelajaran
- **📖 Konfigurasi**: [Panduan Konfigurasi](docs/chapter-03-configuration/configuration.md) - Persediaan persekitaran
- **🔐 Keselamatan**: [Corak pengesahan dan identiti terurus](docs/chapter-03-configuration/authsecurity.md) - Corak pengesahan
- **📝 Contoh**: [Contoh Aplikasi Pangkalan Data](examples/database-app/README.md) - Contoh Pangkalan Data AZD

#### Latihan Praktikal
- Konfigurasikan beberapa persekitaran (dev, staging, prod)
- Sediakan pengesahan identiti terurus
- Laksanakan konfigurasi khusus persekitaran

**💡 Hasil Bab**: Mengurus beberapa persekitaran dengan pengesahan dan keselamatan yang betul

---

### 🏗️ Bab 4: Infrastruktur sebagai Kod & Penggunaan
**Prasyarat**: Bab 1-3 selesai  
**Tempoh**: 1-1.5 jam  
**Kesukaran**: ⭐⭐⭐

#### Apa Yang Akan Anda Pelajari
- Corak penggunaan lanjutan
- Infrastruktur sebagai Kod dengan Bicep
- Strategi penyediaan sumber

#### Sumber Pembelajaran
- **📖 Penggunaan**: [Panduan Penggunaan](docs/chapter-04-infrastructure/deployment-guide.md) - Aliran kerja lengkap
- **🏗️ Penyediaan**: [Penyediaan Sumber](docs/chapter-04-infrastructure/provisioning.md) - Pengurusan sumber Azure
- **📝 Contoh**: [Contoh Container App](../../examples/container-app) - Penggunaan berasaskan kontena

#### Latihan Praktikal
- Cipta templat Bicep khusus
- Gunakan aplikasi multi-perkhidmatan
- Laksanakan strategi penggunaan biru-hijau

**💡 Hasil Bab**: Gunakan aplikasi multi-perkhidmatan kompleks dengan templat infrastruktur khusus

---

### 🎯 Bab 5: Penyelesaian AI Multi-Ejen (Lanjutan)
**Prasyarat**: Bab 1-2 selesai  
**Tempoh**: 2-3 jam  
**Kesukaran**: ⭐⭐⭐⭐

#### Apa Yang Akan Anda Pelajari
- Corak seni bina multi-ejen
- Orkestrasi dan penyelarasan ejen
- Penggunaan AI sedia pengeluaran

#### Sumber Pembelajaran
- **🤖 Projek Unggulan**: [Penyelesaian Multi-Ejen Runcit](examples/retail-scenario.md) - Pelaksanaan lengkap
- **🛠️ Templat ARM**: [Pakej Templat ARM](../../examples/retail-multiagent-arm-template) - Penggunaan satu klik
- **📖 Seni Bina**: [Corak penyelarasan multi-ejen](docs/chapter-06-pre-deployment/coordination-patterns.md) - Corak

#### Latihan Praktikal
```bash
# Lancarkan penyelesaian pelbagai ejen runcit lengkap
cd examples/retail-multiagent-arm-template
./deploy.sh

# Terokai konfigurasi ejen
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Hasil Bab**: Gunakan dan urus penyelesaian AI multi-ejen sedia pengeluaran dengan ejen Pelanggan dan Inventori

---

### 🔍 Bab 6: Pengesahan & Perancangan Pra-Penggunaan
**Prasyarat**: Bab 4 selesai  
**Tempoh**: 1 jam  
**Kesukaran**: ⭐⭐

#### Apa Yang Akan Anda Pelajari
- Perancangan kapasiti dan pengesahan sumber
- Strategi pemilihan SKU
- Pemeriksaan pra-penerbangan dan automasi

#### Sumber Pembelajaran
- **📊 Perancangan**: [Perancangan Kapasiti](docs/chapter-06-pre-deployment/capacity-planning.md) - Pengesahan sumber
- **💰 Pemilihan**: [Pemilihan SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Pilihan kos efektif
- **✅ Pengesahan**: [Pemeriksaan Pra-Penerbangan](docs/chapter-06-pre-deployment/preflight-checks.md) - Skrip automatik

#### Latihan Praktikal
- Jalankan skrip pengesahan kapasiti
- Optimumkan pemilihan SKU untuk kos
- Laksanakan pemeriksaan pra-penggunaan automatik

**💡 Hasil Bab**: Sahkan dan optimakan penggunaan sebelum pelaksanaan

---

### 🚨 Bab 7: Penyelesaian Masalah & Nyahpepijat
**Prasyarat**: Mana-mana bab penggunaan selesai  
**Tempoh**: 1-1.5 jam  
**Kesukaran**: ⭐⭐

#### Apa Yang Akan Anda Pelajari
- Pendekatan nyahpepijat sistematik
- Isu biasa dan penyelesaian
- Penyelesaian masalah spesifik AI

#### Sumber Pembelajaran
- **🔧 Isu Biasa**: [Isu Biasa](docs/chapter-07-troubleshooting/common-issues.md) - Soalan Lazim dan penyelesaian
- **🕵️ Nyahpepijat**: [Panduan Nyahpepijat](docs/chapter-07-troubleshooting/debugging.md) - Strategi langkah demi langkah
- **🤖 Isu AI**: [Penyelesaian Masalah AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Masalah perkhidmatan AI

#### Latihan Praktikal
- Mendiagnosis kegagalan penggunaan
- Menyelesaikan isu pengesahan
- Nyahpepijat sambungan perkhidmatan AI

**💡 Hasil Bab**: Mampu mendiagnosis dan menyelesaikan isu penggunaan biasa secara berdikari

---

### 🏢 Bab 8: Pengeluaran & Corak Perusahaan
**Prasyarat**: Bab 1-4 selesai  
**Tempoh**: 2-3 jam  
**Kesukaran**: ⭐⭐⭐⭐

#### Apa Yang Akan Anda Pelajari
- Strategi penggunaan pengeluaran
- Corak keselamatan perusahaan
- Pemantauan dan pengoptimuman kos

#### Sumber Pembelajaran
- **🏭 Pengeluaran**: [Amalan Terbaik AI Pengeluaran](docs/chapter-08-production/production-ai-practices.md) - Corak perusahaan  
- **📝 Contoh**: [Contoh Perkhidmatan Mikro](../../examples/microservices) - Seni bina kompleks  
- **📊 Pemantauan**: [Integrasi Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Pemantauan  

#### Latihan Praktikal  
- Laksanakan corak keselamatan perusahaan  
- Sediakan pemantauan menyeluruh  
- Lancarkan ke pengeluaran dengan tadbir urus yang betul  

**💡 Hasil Bab**: Lancarkan aplikasi siap perusahaan dengan keupayaan pengeluaran penuh  

---

## 🎓 Gambaran Keseluruhan Bengkel: Pengalaman Pembelajaran Amali  

> **⚠️ STATUS BENGKEL: Pembangunan Aktif**  
> Bahan bengkel kini sedang dibangunkan dan diperhalusi. Modul utama berfungsi, tetapi beberapa bahagian lanjutan belum lengkap. Kami sedang berusaha untuk menyiapkan semua kandungan. [Ikuti kemajuan →](workshop/README.md)  

### Bahan Bengkel Interaktif  
**Pembelajaran amali menyeluruh dengan alat berasaskan pelayar dan latihan berpandu**  

Bahan bengkel kami menyediakan pengalaman pembelajaran interaktif berstruktur yang melengkapkan kurikulum berasaskan bab di atas. Bengkel direka untuk pembelajaran kendiri dan sesi dikendalikan oleh pengajar.  

#### 🛠️ Ciri-ciri Bengkel  
- **Antara Muka Berasaskan Pelayar**: Bengkel lengkap berkuasa MkDocs dengan ciri carian, salin, dan tema  
- **Integrasi GitHub Codespaces**: Satu klik untuk penyediaan persekitaran pembangunan  
- **Jalur Pembelajaran Berstruktur**: 8 modul latihan berpandu (3-4 jam keseluruhan)  
- **Metodologi Progresif**: Pengenalan → Pemilihan → Pengesahan → Pembongkaran → Konfigurasi → Penyesuaian → Pembongkaran → Penutup  
- **Persekitaran DevContainer Interaktif**: Alat dan kebergantungan telah dikonfigurasikan  

#### 📚 Struktur Modul Bengkel  
Bengkel mengikut **metodologi progresif 8 modul** yang membawa anda dari penemuan ke penguasaan pelancaran:  

| Modul | Tajuk | Apa yang Akan Anda Lakukan | Tempoh |  
|-------|--------|----------------------------|--------|  
| **0. Pengenalan** | Gambaran Bengkel | Fahami objektif pembelajaran, prasyarat, dan struktur bengkel | 15 min |  
| **1. Pemilihan** | Penemuan Templat | Terokai templat AZD dan pilih templat AI yang sesuai untuk senario anda | 20 min |  
| **2. Pengesahan** | Lancar & Sahkan | Lancarkan templat dengan `azd up` dan sahkan infrastruktur berfungsi | 30 min |  
| **3. Pembongkaran** | Fahami Struktur | Gunakan GitHub Copilot untuk meneroka seni bina templat, fail Bicep dan organisasi kod | 30 min |  
| **4. Konfigurasi** | Selami azure.yaml | Kuasai konfigurasi `azure.yaml`, kaitan kitaran hayat, dan pembolehubah persekitaran | 30 min |  
| **5. Penyesuaian** | Jadikan Milik Anda | Dayakan Penyiasatan AI, penjejakan, penilaian dan sesuaikan untuk senario anda | 45 min |  
| **6. Pembongkaran** | Bersihkan | Batalkan sumber dengan selamat menggunakan `azd down --purge` | 15 min |  
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
# Ikuti arahan persediaan dalam workshop/README.md
```
  
#### 🎯 Hasil Pembelajaran Bengkel  
Dengan menyelesaikan bengkel, peserta akan:  
- **Lancarkan Aplikasi AI Pengeluaran**: Gunakan AZD dengan perkhidmatan Microsoft Foundry  
- **Kuasa Seni Bina Multi-Ejen**: Laksanakan penyelesaian agen AI berkoordinasi  
- **Laksanakan Amalan Keselamatan Terbaik**: Konfigurasikan pengesahan dan kawalan akses  
- **Optimumkan untuk Skala**: Reka bentuk pelancaran prestasi dan kos efektif  
- **Selesaikan Masalah Pelancaran**: Tangani isu lazim secara berdikari  

#### 📖 Sumber Bengkel  
- **🎥 Panduan Interaktif**: [Bahan Bengkel](workshop/README.md) - Persekitaran pembelajaran berasaskan pelayar  
- **📋 Arahan Modul demi Modul**:  
  - [0. Pengenalan](workshop/docs/instructions/0-Introduction.md) - Gambaran bengkel dan objektif  
  - [1. Pemilihan](workshop/docs/instructions/1-Select-AI-Template.md) - Cari dan pilih templat AI  
  - [2. Pengesahan](workshop/docs/instructions/2-Validate-AI-Template.md) - Lancar dan sahkan templat  
  - [3. Pembongkaran](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Terokai seni bina templat  
  - [4. Konfigurasi](workshop/docs/instructions/4-Configure-AI-Template.md) - Kuasai azure.yaml  
  - [5. Penyesuaian](workshop/docs/instructions/5-Customize-AI-Template.md) - Sesuaikan untuk senario anda  
  - [6. Pembongkaran](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Bersihkan sumber  
  - [7. Penutup](workshop/docs/instructions/7-Wrap-up.md) - Semak dan langkah seterusnya  
- **🛠️ Makmal Bengkel AI**: [Makmal Bengkel AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Latihan terfokus AI  
- **💡 Panduan Mula Cepat**: [Panduan Persediaan Bengkel](workshop/README.md#quick-start) - Konfigurasi persekitaran  

**Sesuai untuk**: Latihan korporat, kursus universiti, pembelajaran kendiri, dan bootcamp pembangun.  

---

## 📖 Selami: Keupayaan AZD  

Selain asas, AZD menyediakan ciri kuat untuk pelancaran pengeluaran:  

- **Pelancaran berasaskan templat** - Gunakan templat sedia ada untuk corak aplikasi biasa  
- **Infrastruktur sebagai Kod** - Urus sumber Azure dengan Bicep atau Terraform  
- **Aliran kerja terintegrasi** - Mudah sediakan, lancar, dan pantau aplikasi  
- **Mesra pembangun** - Dioptimumkan untuk produktiviti dan pengalaman pembangun  

### **AZD + Microsoft Foundry: Sesuai untuk Pelancaran AI**  

**Mengapa AZD untuk Penyelesaian AI?** AZD menangani cabaran utama yang dihadapi pembangun AI:  

- **Templat Sedia AI** - Templat konfigurasi awal untuk Model Microsoft Foundry, Perkhidmatan Kognitif, dan beban kerja ML  
- **Pelancaran AI Selamat** - Corak keselamatan terbina dalam untuk perkhidmatan AI, kekunci API, dan titik hujung model  
- **Corak AI Pengeluaran** - Amalan terbaik untuk pelancaran aplikasi AI yang skala dan kos efektif  
- **Aliran Kerja AI Menyeluruh** - Dari pembangunan model ke pelancaran pengeluaran dengan pemantauan yang betul  
- **Pengoptimuman Kos** - Strategi pengalokasian sumber bijak dan penskalaan untuk beban kerja AI  
- **Integrasi Microsoft Foundry** - Sambungan lancar ke katalog model dan titik hujung Microsoft Foundry  

---

## 🎯 Templat & Perpustakaan Contoh  

### Sorotan: Templat Microsoft Foundry  
**Mulakan di sini jika anda melancarkan aplikasi AI!**  

> **Nota:** Templat ini menunjukkan pelbagai corak AI. Ada yang dari Azure Samples luar, ada yang implementasi tempatan.  

| Templat | Bab | Kerumitan | Perkhidmatan | Jenis |  
|---------|-----|-----------|--------------|-------|  
| [**Mulakan dengan sembang AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bab 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Luar |  
| [**Mulakan dengan ejen AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Bab 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Luar |  
| [**Demo Cari Azure + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bab 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Luar |  
| [**Permulaan Pantas Aplikasi Sembang OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bab 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Luar |  
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bab 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Luar |  
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Bab 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Luar |  
| [**Penyelesaian Multi-Ejen Runcit**](examples/retail-scenario.md) | Bab 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Tempatan** |  

### Sorotan: Senario Pembelajaran Lengkap  
**Templat aplikasi siap pengeluaran dipetakan ke bab pembelajaran**  

| Templat | Bab Pembelajaran | Kerumitan | Pembelajaran Utama |  
|---------|------------------|-----------|--------------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bab 2 | ⭐ | Corak pelancaran AI asas |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bab 2 | ⭐⭐ | Pelaksanaan RAG dengan Azure AI Search |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Bab 4 | ⭐⭐ | Integrasi Kecerdasan Dokumen |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bab 5 | ⭐⭐⭐ | Rangka kerja agen dan panggilan fungsi |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Bab 8 | ⭐⭐⭐ | Orkestrasi AI perusahaan |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Bab 5 | ⭐⭐⭐⭐ | Seni bina multi-ejen dengan agen Pelanggan dan Inventori |  

### Pembelajaran Mengikut Jenis Contoh  

> **📌 Contoh Tempatan vs. Luar:**  
> **Contoh Tempatan** (dalam repositori ini) = Sedia guna segera  
> **Contoh Luar** (Azure Samples) = Klon dari repositori berkaitan  

#### Contoh Tempatan (Sedia Digunakan)  
- [**Penyelesaian Multi-Ejen Runcit**](examples/retail-scenario.md) - Implementasi lengkap siap pengeluaran dengan templat ARM  
  - Seni bina multi-ejen (agen Pelanggan + Inventori)  
  - Pemantauan dan penilaian menyeluruh  
  - Pelancaran satu klik melalui templat ARM  

#### Contoh Tempatan - Aplikasi Bekas (Bab 2-5)  
**Contoh lengkap pelancaran bekas dalam repositori ini:**  
- [**Contoh Aplikasi Bekas**](examples/container-app/README.md) - Panduan lengkap pelancaran berbekas  
  - [API Flask Ringkas](../../examples/container-app/simple-flask-api) - API REST asas dengan skala-ke-nol  
  - [Seni Bina Perkhidmatan Mikro](../../examples/container-app/microservices) - Pelancaran berbilang perkhidmatan siap pengeluaran  
  - Corak Permulaan Cepat, Pengeluaran, dan Lanjutan  
  - Panduan pemantauan, keselamatan, dan pengoptimuman kos  

#### Contoh Luar - Aplikasi Ringkas (Bab 1-2)  
**Klon repositori Azure Samples ini untuk memulakan:**  
- [Aplikasi Web Ringkas - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Corak pelancaran asas  
- [Laman Web Statik - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Pelancaran kandungan statik  
- [Aplikasi Bekas - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Pelancaran API REST  

#### Contoh Luar - Integrasi Pangkalan Data (Bab 3-4)  
- [Aplikasi Pangkalan Data - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Corak sambungan pangkalan data  
- [Fungsi + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Aliran kerja data tanpa server  

#### Contoh Luar - Corak Lanjutan (Bab 4-8)  
- [Perkhidmatan Mikro Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Seni bina berbilang perkhidmatan  
- [Tugas Aplikasi Bekas](https://github.com/Azure-Samples/container-apps-jobs) - Pemprosesan latar belakang  
- [Saluran ML Perusahaan](https://github.com/Azure-Samples/mlops-v2) - Corak ML siap pengeluaran  

### Koleksi Templat Luar  
- [**Galeri Templat AZD Rasmi**](https://azure.github.io/awesome-azd/) - Koleksi terpilih templat rasmi dan komuniti  
- [**Templat Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasi templat Microsoft Learn  
- [**Direktori Contoh**](examples/README.md) - Contoh pembelajaran tempatan dengan penerangan terperinci  

---

## 📚 Sumber Pembelajaran & Rujukan  

### Rujukan Pantas  
- [**Lembaran Perintah**](resources/cheat-sheet.md) - Arahan azd penting disusun mengikut bab  
- [**Glosari**](resources/glossary.md) - Istilah Azure dan azd  
- [**FAQ**](resources/faq.md) - Soalan lazim mengikut bab pembelajaran  
- [**Panduan Kajian**](resources/study-guide.md) - Latihan praktikal menyeluruh  

### Bengkel Amali  
- [**Makmal Bengkel AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Buat penyelesaian AI anda boleh dilancarkan dengan AZD (2-3 jam)  
- [**Bengkel Interaktif**](workshop/README.md) - Latihan berpandu 8 modul dengan MkDocs dan GitHub Codespaces  
  - Mengikut: Pengenalan → Pemilihan → Pengesahan → Pembongkaran → Konfigurasi → Penyesuaian → Pembongkaran → Penutup  

### Sumber Pembelajaran Luar
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pusat Arkitektur Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulator Harga Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status Azure](https://status.azure.com/)

### Kemahiran Ejen AI untuk Penyunting Anda
- [**Kemahiran Microsoft Azure di skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 kemahiran ejen terbuka untuk Azure AI, Foundry, penyebaran, diagnostik, pengoptimuman kos, dan banyak lagi. Pasang mereka dalam GitHub Copilot, Cursor, Claude Code, atau mana-mana ejen yang disokong:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Panduan Penyelesaian Masalah Pantas

**Isu biasa yang dihadapi pemula dan penyelesaian segera:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Pasang AZD terlebih dahulu
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
<summary><strong>❌ "Tiada langganan ditemui" atau "Langganan tidak ditetapkan"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" atau "Kuota melebihi had"</strong></summary>

```bash
# Cuba rantau Azure yang berbeza
azd env set AZURE_LOCATION "westus2"
azd up

# Atau gunakan SKU yang lebih kecil semasa pembangunan
# Sunting infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" gagal di tengah jalan</strong></summary>

```bash
# Pilihan 1: Bersihkan dan cuba semula
azd down --force --purge
azd up

# Pilihan 2: Baiki infrastruktur sahaja
azd provision

# Pilihan 3: Semak status terperinci
azd show

# Pilihan 4: Semak log dalam Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentikasi gagal" atau "Token tamat tempoh"</strong></summary>

```bash
# Sahkan semula
az logout
az login

azd auth logout
azd auth login

# Sahkan pengesahan
az account show
```
</details>

<details>
<summary><strong>❌ "Sumber sudah wujud" atau konflik penamaan</strong></summary>

```bash
# AZD menjana nama unik, tetapi jika berlaku konflik:
azd down --force --purge

# Kemudian cuba semula dengan persekitaran baru
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Penempatan templat mengambil masa terlalu lama</strong></summary>

**Masa menunggu biasa:**
- Aplikasi web mudah: 5-10 minit
- Aplikasi dengan pangkalan data: 10-15 minit
- Aplikasi AI: 15-25 minit (penyediaan OpenAI lambat)

```bash
# Semak kemajuan
azd show

# Jika tersekat >30 minit, semak Portal Azure:
azd monitor
# Cari penyebaran yang gagal
```
</details>

<details>
<summary><strong>❌ "Kebenaran dinafikan" atau "Dilarang"</strong></summary>

```bash
# Semak peranan Azure anda
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Anda memerlukan sekurang-kurangnya peranan "Contributor"
# Minta pentadbir Azure anda untuk memberikan:
# - Contributor (untuk sumber)
# - Pentadbir Akses Pengguna (untuk penugasan peranan)
```
</details>

<details>
<summary><strong>❌ Tidak dapat mencari URL aplikasi yang dikerahkan</strong></summary>

```bash
# Paparkan semua titik akhir perkhidmatan
azd show

# Atau buka Azure Portal
azd monitor

# Semak perkhidmatan tertentu
azd env get-values
# Cari pemboleh ubah *_URL
```
</details>

### 📚 Sumber Penyelesaian Masalah Penuh

- **Panduan Isu Biasa:** [Penyelesaian Terperinci](docs/chapter-07-troubleshooting/common-issues.md)
- **Isu Khusus AI:** [Penyelesaian Masalah AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Panduan Penyahpepijatan:** [Penyahpepijatan langkah demi langkah](docs/chapter-07-troubleshooting/debugging.md)
- **Dapatkan Bantuan:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Penyelesaian Kursus & Sijil

### Penjejakan Kemajuan
Jejaki kemajuan pembelajaran anda melalui setiap bab:

- [ ] **Bab 1**: Asas & Permulaan Pantas ✅
- [ ] **Bab 2**: Pembangunan AI-Pertama ✅  
- [ ] **Bab 3**: Persediaan & Autentikasi ✅
- [ ] **Bab 4**: Infrastruktur sebagai Kod & Penyebaran ✅
- [ ] **Bab 5**: Penyelesaian AI Pelbagai Ejen ✅
- [ ] **Bab 6**: Pengesahan & Perancangan Pra-Penyebaran ✅
- [ ] **Bab 7**: Penyelesaian Masalah & Penyahpepijatan ✅
- [ ] **Bab 8**: Corak Pengeluaran & Perusahaan ✅

### Pengesahan Pembelajaran
Selepas menyiapkan setiap bab, sahkan pengetahuan anda dengan:
1. **Latihan Praktikal**: Lengkapkan penyebaran praktikal bab tersebut
2. **Semakan Pengetahuan**: Semak bahagian FAQ untuk bab anda
3. **Perbincangan Komuniti**: Kongsi pengalaman anda dalam Azure Discord
4. **Bab Seterusnya**: Beralih ke tahap kerumitan seterusnya

### Manfaat Penyelesaian Kursus
Setelah menyiapkan semua bab, anda akan mempunyai:
- **Pengalaman Pengeluaran**: Menyebarkan aplikasi AI sebenar ke Azure
- **Kemahiran Profesional**: Kebolehan penyebaran bersedia perusahaan  
- **Pengiktirafan Komuniti**: Ahli aktif komuniti pembangun Azure
- **Kemajuan Kerjaya**: Kepakaran penyebaran AZD dan AI yang diperlukan

---

## 🤝 Komuniti & Sokongan

### Dapatkan Bantuan & Sokongan
- **Isu Teknikal**: [Laporkan pepijat dan minta ciri baru](https://github.com/microsoft/azd-for-beginners/issues)
- **Soalan Pembelajaran**: [Komuniti Discord Microsoft Azure](https://discord.gg/microsoft-azure) dan [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Bantuan Khusus AI**: Sertai [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasi**: [Dokumentasi rasmi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Wawasan Komuniti dari Microsoft Foundry Discord

**Keputusan Tinjauan Terkini dari Saluran #Azure:**
- **45%** pembangun mahu gunakan AZD untuk beban kerja AI
- **Cabaran utama**: Penyebaran multi-perkhidmatan, pengurusan kelayakan, kesediaan pengeluaran  
- **Permintaan paling banyak**: Templat khusus AI, panduan penyelesaian masalah, amalan terbaik

**Sertai komuniti kami untuk:**
- Kongsi pengalaman AZD + AI anda dan dapatkan bantuan
- Akses pratonton awal templat AI baru
- Menyumbang kepada amalan terbaik penyebaran AI
- Mempengaruhi pembangunan ciri AI + AZD masa depan

### Menyumbang kepada Kursus
Kami mengalu-alukan sumbangan! Sila baca [Panduan Menyumbang](CONTRIBUTING.md) kami untuk butiran tentang:
- **Penambahbaikan Kandungan**: Tingkatkan bab dan contoh sedia ada
- **Contoh Baru**: Tambah senario dunia sebenar dan templat  
- **Terjemahan**: Bantu mengekalkan sokongan pelbagai bahasa
- **Laporan Pepijat**: Perbaiki ketepatan dan kejelasan
- **Standard Komuniti**: Ikuti garis panduan komuniti inklusif kami

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
 
### Siri Generatif AI
[![Generatif AI untuk Pemula](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatif AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatif AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatif AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

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
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigasi Kursus

**🚀 Sedia untuk Mula Belajar?**

**Pemula**: Mulakan dengan [Bab 1: Asas & Permulaan Pantas](#-chapter-1-foundation--quick-start)  
**Pemaju AI**: Teruskan ke [Bab 2: Pembangunan AI-Pertama](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Pemaju Berpengalaman**: Mula dengan [Bab 3: Konfigurasi & Pengesahan](#️-chapter-3-configuration--authentication)

**Langkah Seterusnya**: [Mula Bab 1 - Asas AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan manusia profesional adalah disarankan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->