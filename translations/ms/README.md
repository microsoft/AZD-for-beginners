# AZD Untuk Pemula: Perjalanan Pembelajaran yang Terstruktur

![AZD-for-beginners](../../translated_images/ms/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Terjemahan Automatik (Sentiasa Dikemas Kini)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](./README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Lebih Suka Klon Secara Tempatan?**
>
> Repositori ini termasuk lebih 50+ terjemahan bahasa yang meningkatkan saiz muat turun dengan ketara. Untuk klon tanpa terjemahan, gunakan sparse checkout:
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
> Ini memberi anda semua yang diperlukan untuk melengkapkan kursus dengan muat turun yang jauh lebih pantas.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Apa itu Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** adalah alat baris perintah mesra pembangun yang memudahkan untuk menggunakan aplikasi ke Azure. Daripada membuat dan menyambung berpuluh-puluh sumber Azure secara manual, anda boleh menyebarkan aplikasi penuh dengan satu perintah sahaja.

### Keajaiban `azd up`

```bash
# Arahan tunggal ini melakukan semuanya:
# ✅ Mencipta semua sumber Azure
# ✅ Mengkonfigurasi rangkaian dan keselamatan
# ✅ Membina kod aplikasi anda
# ✅ Menerapkan ke Azure
# ✅ Memberi anda URL yang berfungsi
azd up
```

**Itu sahaja!** Tiada lagi klik di Azure Portal, tiada templat ARM yang rumit untuk dipelajari terlebih dahulu, tiada konfigurasi manual - hanya aplikasi yang berfungsi di Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Apa Perbezaannya?

Ini soalan paling biasa yang ditanya oleh pemula. Jawapannya mudah:

| Ciri | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Tujuan** | Menguruskan sumber Azure individu | Menyebarkan aplikasi lengkap |
| **Fokus** | Infrastruktur | Aplikasi |
| **Contoh** | `az webapp create --name myapp...` | `azd up` |
| **Lengkung Pembelajaran** | Perlu tahu perkhidmatan Azure | Cukup tahu aplikasi anda |
| **Terbaik Untuk** | DevOps, Infrastruktur | Pembangun, Prototip |

### Analogi Mudah

- **Azure CLI** seperti mempunyai semua alat untuk membina rumah - tukul, gergaji, paku. Anda boleh bina apa sahaja, tetapi perlu tahu mengenai pembinaan.
- **Azure Developer CLI** seperti mengupah kontraktor - anda terangkan apa yang anda mahu, dan mereka urus pembinaannya.

### Bila Menggunakan Setiap Satu

| Senario | Gunakan Ini |
|----------|----------|
| "Saya mahu gunakan web app saya dengan cepat" | `azd up` |
| "Saya perlu cipta akaun simpanan sahaja" | `az storage account create` |
| "Saya bina aplikasi AI penuh" | `azd init --template azure-search-openai-demo` |
| "Saya perlu debug sumber Azure tertentu" | `az resource show` |
| "Saya mahu penyebaran sedia produksi dalam beberapa minit" | `azd up --environment production` |

### Mereka Boleh Digunakan Bersama!

AZD menggunakan Azure CLI sebagai asas. Anda boleh guna kedua-duanya:
```bash
# Sebarkan aplikasi anda dengan AZD
azd up

# Kemudian laraskan sumber tertentu menggunakan Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Cari Templat dalam Awesome AZD

Jangan mulakan dari kosong! **Awesome AZD** adalah koleksi komuniti templat sedia untuk disebarkan:

| Sumber | Penerangan |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Layari 200+ templat dengan satu klik penyebaran |
| 🔗 [**Hantar Templat**](https://github.com/Azure/awesome-azd/issues) | Sumbangkan templat anda sendiri kepada komuniti |
| 🔗 [**Repositori GitHub**](https://github.com/Azure/awesome-azd) | Bintang dan terokai sumber |

### Templat AI Popular dari Awesome AZD

```bash
# Sembang RAG dengan Azure OpenAI + Carian AI
azd init --template azure-search-openai-demo

# Aplikasi Sembang AI Pantas
azd init --template openai-chat-app-quickstart

# Ejen AI dengan Ejen Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Mula Dalam 3 Langkah

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

### Langkah 2: Log masuk ke Azure

```bash
azd auth login
```

### Langkah 3: Sebarkan Aplikasi Pertama Anda

```bash
# Inisialisasi dari templat
azd init --template todo-nodejs-mongo

# Deploy ke Azure (mencipta semuanya!)
azd up
```

**🎉 Itu sahaja!** Aplikasi anda kini berfungsi di Azure.

### Bersihkan (Jangan Lupa!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cara Menggunakan Kursus Ini

Kursus ini direka untuk **pembelajaran progresif** - mulakan di mana anda selesa dan terus maju:

| Pengalaman Anda | Mula Di Sini |
|-----------------|--------------|
| **Baru dalam Azure** | [Bab 1: Asas](../..) |
| **Tahu Azure, baru dalam AZD** | [Bab 1: Asas](../..) |
| **Mahukan penyebaran aplikasi AI** | [Bab 2: Pembangunan AI-First](../..) |
| **Mahukan latihan praktikal** | [🎓 Bengkel Interaktif](workshop/README.md) - makmal panduan 3-4 jam |
| **Perlu corak penyebaran produksi** | [Bab 8: Produksi & Enterprise](../..) |

### Persediaan Pantas

1. **Fork Repositori Ini**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone:** `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Dapatkan Bantuan:** [Komuniti Discord Azure](https://discord.com/invite/ByRwuEEgH4)

> **Lebih Suka Klon Secara Tempatan?**

> Repositori ini termasuk lebih 50+ terjemahan bahasa yang meningkatkan saiz muat turun dengan ketara. Untuk klon tanpa terjemahan, gunakan sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ini memberi anda semua yang diperlukan untuk melengkapkan kursus dengan muat turun yang jauh lebih pantas.


## Gambaran Kursus

Kuasi Azure Developer CLI (azd) melalui bab terstruktur yang direka untuk pembelajaran progresif. **Fokus istimewa pada penyebaran aplikasi AI dengan integrasi Microsoft Foundry.**

### Kenapa Kursus Ini Penting untuk Pembangun Moden

Berdasarkan maklum balas komuniti Microsoft Foundry Discord, **45% pembangun mahu menggunakan AZD untuk beban kerja AI**, tetapi menghadapi cabaran dengan:
- Senibina AI multi-perkhidmatan yang kompleks
- Amalan terbaik penyebaran AI produksi  
- Integrasi dan konfigurasi perkhidmatan Azure AI
- Pengoptimuman kos untuk beban kerja AI
- Penyelesaian masalah penyebaran khusus AI

### Objektif Pembelajaran

Dengan melengkapkan kursus terstruktur ini, anda akan:
- **Kuasi Asas AZD**: Konsep teras, pemasangan, dan konfigurasi
- **Sebarkan Aplikasi AI**: Gunakan AZD dengan perkhidmatan Microsoft Foundry
- **Laksanakan Infrastruktur sebagai Kod**: Urus sumber Azure dengan templat Bicep
- **Selesaikan Masalah Penyebaran**: Atasi isu biasa dan debug masalah
- **Optimakan untuk Produksi**: Keselamatan, penskalaan, pemantauan, dan pengurusan kos
- **Bina Penyelesaian Berbilang Ejen**: Sebarkan senibina AI yang kompleks

## 🗺️ Peta Kursus: Navigasi Pantas Mengikut Bab

Setiap bab mempunyai README khusus dengan objektif pembelajaran, panduan pantas, dan latihan:

| Bab | Topik | Pelajaran | Tempoh | Kerumitan |
|---------|-------|---------|----------|------------|
| **[Bab 1: Asas](docs/chapter-01-foundation/README.md)** | Mula | [Asas AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Pemasangan](docs/chapter-01-foundation/installation.md) &#124; [Projek Pertama](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Bab 2: Pembangunan AI](docs/chapter-02-ai-development/README.md)** | Aplikasi AI-First | [Integrasi Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Ejen AI](docs/chapter-02-ai-development/agents.md) &#124; [Penyebaran Model](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Bengkel](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 jam | ⭐⭐ |
| **[Bab 3: Konfigurasi](docs/chapter-03-configuration/README.md)** | Pengesahan & Keselamatan | [Konfigurasi](docs/chapter-03-configuration/configuration.md) &#124; [Pengesahan & Keselamatan](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Penghantaran | [Panduan Penghantaran](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Penyediaan](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 jam | ⭐⭐⭐ |
| **[Ch 5: Multi-Ejen](docs/chapter-05-multi-agent/README.md)** | Penyelesaian Ejen AI | [Senario Runcit](examples/retail-scenario.md) &#124; [Corak Penyelaras](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 jam | ⭐⭐⭐⭐ |
| **[Ch 6: Pra-Penghantaran](docs/chapter-06-pre-deployment/README.md)** | Perancangan & Pengesahan | [Pemeriksaan Pra-Terbang](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Perancangan Kapasiti](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Pemilihan SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 jam | ⭐⭐ |
| **[Ch 7: Penyelesaian Masalah](docs/chapter-07-troubleshooting/README.md)** | Debug & Betulkan | [Isu Biasa](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Pengdebugan](docs/chapter-07-troubleshooting/debugging.md) &#124; [Isu AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 jam | ⭐⭐ |
| **[Ch 8: Pengeluaran](docs/chapter-08-production/README.md)** | Corak Perusahaan | [Amalan Pengeluaran](docs/chapter-08-production/production-ai-practices.md) | 2-3 jam | ⭐⭐⭐⭐ |
| **[🎓 Bengkel](workshop/README.md)** | Makmal Praktikal | [Pengenalan](workshop/docs/instructions/0-Introduction.md) &#124; [Pemilihan](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Pengesahan](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Penyahpecahan](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurasi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Pemersekalaan](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Pembongkaran](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Penutupan](workshop/docs/instructions/7-Wrap-up.md) | 3-4 jam | ⭐⭐ |

**Jumlah Tempoh Kursus:** ~10-14 jam | **Kebolehan Berkembang:** Pemula → Sedia Pengeluaran

---

## 📚 Bab Pembelajaran

*Pilih laluan pembelajaran anda berdasarkan tahap pengalaman dan matlamat*

### 🚀 Bab 1: Asas & Mula Pantas
**Prasyarat**: Langganan Azure, pengetahuan asas baris arahan  
**Tempoh**: 30-45 minit  
**Kerumitan**: ⭐

#### Apa Yang Akan Anda Pelajari
- Memahami asas Azure Developer CLI
- Memasang AZD pada platform anda
- Penghantaran pertama anda yang berjaya

#### Sumber Pembelajaran
- **🎯 Mula Di Sini**: [Apa itu Azure Developer CLI?](../..)
- **📖 Teori**: [Asas AZD](docs/chapter-01-foundation/azd-basics.md) - Konsep teras dan terminologi
- **⚙️ Persediaan**: [Pemasangan & Persediaan](docs/chapter-01-foundation/installation.md) - Panduan khusus platform
- **🛠️ Praktikal**: [Projek Pertama Anda](docs/chapter-01-foundation/first-project.md) - Tutorial langkah demi langkah
- **📋 Rujukan Pantas**: [Lembaran Cheat Perintah](resources/cheat-sheet.md)

#### Latihan Praktikal
```bash
# Semakan pemasangan pantas
azd version

# Lancarkan aplikasi pertama anda
azd init --template todo-nodejs-mongo
azd up
```

**💡 Hasil Bab**: Berjaya menghantar aplikasi web mudah ke Azure menggunakan AZD

**✅ Sahkan Kejayaan:**
```bash
# Selepas menyelesaikan Bab 1, anda sepatutnya boleh:
azd version              # Menunjukkan versi yang dipasang
azd init --template todo-nodejs-mongo  # Memulakan projek
azd up                  # Melaksanakan ke Azure
azd show                # Memaparkan URL aplikasi yang sedang berjalan
# Aplikasi dibuka dalam pelayar dan berfungsi
azd down --force --purge  # Membersihkan sumber
```

**📊 Masa:** 30-45 minit  
**📈 Tahap Kemahiran Selepas:** Boleh menghantar aplikasi asas secara berdikari

**✅ Sahkan Kejayaan:**
```bash
# Setelah selesai Bab 1, anda sepatutnya dapat:
azd version              # Menunjukkan versi yang dipasang
azd init --template todo-nodejs-mongo  # Memulakan projek
azd up                  # Menghantar ke Azure
azd show                # Memaparkan URL aplikasi yang sedang dijalankan
# Aplikasi dibuka dalam pelayar dan berfungsi
azd down --force --purge  # Membersihkan sumber-sumber
```

**📊 Masa:** 30-45 minit  
**📈 Tahap Kemahiran Selepas:** Boleh menghantar aplikasi asas secara berdikari

---

### 🤖 Bab 2: Pembangunan AI-Pertama (Disyorkan untuk Pembangun AI)
**Prasyarat**: Bab 1 selesai  
**Tempoh**: 1-2 jam  
**Kerumitan**: ⭐⭐

#### Apa Yang Akan Anda Pelajari
- Integrasi Microsoft Foundry dengan AZD
- Menghantar aplikasi berkuasa AI
- Memahami konfigurasi perkhidmatan AI

#### Sumber Pembelajaran
- **🎯 Mula Di Sini**: [Integrasi Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Ejen AI**: [Panduan Ejen AI](docs/chapter-02-ai-development/agents.md) - Hantar ejen pintar dengan AZD
- **📖 Corak**: [Penghantaran Model AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Hantar dan urus model AI
- **🛠️ Bengkel**: [Makmal Bengkel AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Jadikan penyelesaian AI anda siap AZD
- **🎥 Panduan Interaktif**: [Bahan Bengkel](workshop/README.md) - Pembelajaran berasaskan pelayar dengan MkDocs * Persekitaran DevContainer
- **📋 Templat**: [Templat Microsoft Foundry](../..)
- **📝 Contoh**: [Contoh Penghantaran AZD](examples/README.md)

#### Latihan Praktikal
```bash
# Lancarkan aplikasi AI pertama anda
azd init --template azure-search-openai-demo
azd up

# Cuba templat AI tambahan
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Hasil Bab**: Hantar dan konfigurasikan aplikasi chat berkuasa AI dengan keupayaan RAG

**✅ Sahkan Kejayaan:**
```bash
# Selepas Bab 2, anda harus boleh:
azd init --template azure-search-openai-demo
azd up
# Uji antara muka sembang AI
# Tanyakan soalan dan dapatkan respons bertenaga AI dengan sumber
# Sahkan integrasi carian berfungsi
azd monitor  # Semak Application Insights menunjukkan telemetri
azd down --force --purge
```

**📊 Masa:** 1-2 jam  
**📈 Tahap Kemahiran Selepas:** Boleh menghantar dan mengkonfigurasi aplikasi AI yang sedia untuk pengeluaran  
**💰 Kesedaran Kos:** Fahami kos pembangunan $80-150/bulan, kos pengeluaran $300-3500/bulan

#### 💰 Pertimbangan Kos untuk Penghantaran AI

**Persekitaran Pembangunan (Dianggarkan $80-150/bulan):**
- Azure OpenAI (Bayar ikut guna): $0-50/bulan (berdasarkan penggunaan token)
- AI Search (Tahap asas): $75/bulan
- Container Apps (Pembayaran ikut penggunaan): $0-20/bulan
- Penyimpanan (Standard): $1-5/bulan

**Persekitaran Pengeluaran (Dianggarkan $300-3,500+/bulan):**
- Azure OpenAI (PTU untuk prestasi konsisten): $3,000+/bulan ATAU Bayar ikut guna dengan kelantangan tinggi
- AI Search (Tahap standard): $250/bulan
- Container Apps (Khusus): $50-100/bulan
- Application Insights: $5-50/bulan
- Penyimpanan (Premium): $10-50/bulan

**💡 Petua Pengoptimuman Kos:**
- Gunakan **Tahap Percuma** Azure OpenAI untuk pembelajaran (50,000 token/bulan termasuk)
- Jalankan `azd down` untuk membebaskan sumber apabila tidak aktif membangun
- Mulakan dengan pengebilan berasaskan penggunaan, naik taraf ke PTU hanya untuk pengeluaran
- Gunakan `azd provision --preview` untuk anggaran kos sebelum penghantaran
- Dayakan auto-scaling: bayar hanya untuk penggunaan sebenar

**Pemantauan Kos:**
```bash
# Semak anggaran kos bulanan
azd provision --preview

# Pantau kos sebenar dalam Portal Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Bab 3: Konfigurasi & Pengesahan
**Prasyarat**: Bab 1 selesai  
**Tempoh**: 45-60 minit  
**Kerumitan**: ⭐⭐

#### Apa Yang Akan Anda Pelajari
- Konfigurasi dan pengurusan persekitaran
- Pengesahan dan amalan keselamatan terbaik
- Penamaan dan pengurusan sumber

#### Sumber Pembelajaran
- **📖 Konfigurasi**: [Panduan Konfigurasi](docs/chapter-03-configuration/configuration.md) - Persediaan persekitaran
- **🔐 Keselamatan**: [Corak Pengesahan dan Identiti Terurus](docs/chapter-03-configuration/authsecurity.md) - Corak pengesahan
- **📝 Contoh**: [Contoh Aplikasi Pangkalan Data](examples/database-app/README.md) - Contoh Pangkalan Data AZD

#### Latihan Praktikal
- Konfigurasikan pelbagai persekitaran (dev, staging, prod)
- Sediakan pengesahan identiti terurus
- Laksanakan konfigurasi khas persekitaran

**💡 Hasil Bab**: Urus pelbagai persekitaran dengan pengesahan dan keselamatan yang betul

---

### 🏗️ Bab 4: Infrastruktur sebagai Kod & Penghantaran
**Prasyarat**: Bab 1-3 selesai  
**Tempoh**: 1-1.5 jam  
**Kerumitan**: ⭐⭐⭐

#### Apa Yang Akan Anda Pelajari
- Corak penghantaran lanjutan
- Infrastruktur sebagai Kod dengan Bicep
- Strategi penyediaan sumber

#### Sumber Pembelajaran
- **📖 Penghantaran**: [Panduan Penghantaran](docs/chapter-04-infrastructure/deployment-guide.md) - Aliran kerja lengkap
- **🏗️ Penyediaan**: [Penyediaan Sumber](docs/chapter-04-infrastructure/provisioning.md) - Pengurusan sumber Azure
- **📝 Contoh**: [Contoh Aplikasi Kontena](../../examples/container-app) - Penghantaran berasaskan kontena

#### Latihan Praktikal
- Buat templat Bicep tersuai
- Hantar aplikasi pelbagai perkhidmatan
- Laksanakan strategi penghantaran blue-green

**💡 Hasil Bab**: Hantar aplikasi multi-perkhidmatan kompleks menggunakan templat infrastruktur tersuai

---

### 🎯 Bab 5: Penyelesaian AI Multi-Ejen (Lanjutan)
**Prasyarat**: Bab 1-2 selesai  
**Tempoh**: 2-3 jam  
**Kerumitan**: ⭐⭐⭐⭐

#### Apa Yang Akan Anda Pelajari
- Corak seni bina multi-ejen
- Orkestrasi dan penyelarasan ejen
- Penghantaran AI sedia pengeluaran

#### Sumber Pembelajaran
- **🤖 Projek Pilihan**: [Penyelesaian Multi-Ejen Runcit](examples/retail-scenario.md) - Pelaksanaan lengkap
- **🛠️ Templat ARM**: [Pakej Templat ARM](../../examples/retail-multiagent-arm-template) - Penghantaran satu klik
- **📖 Seni Bina**: [Corak penyelarasan multi-ejen](docs/chapter-06-pre-deployment/coordination-patterns.md) - Corak

#### Latihan Praktikal
```bash
# Lancarkan penyelesaian multi-ejen runcit lengkap
cd examples/retail-multiagent-arm-template
./deploy.sh

# Terokai konfigurasi ejen
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Hasil Bab**: Hantar dan urus penyelesaian AI multi-ejen sedia pengeluaran dengan ejen Pelanggan dan Inventori

---

### 🔍 Bab 6: Pengesahan & Perancangan Pra-Penghantaran
**Prasyarat**: Bab 4 selesai  
**Tempoh**: 1 jam  
**Kerumitan**: ⭐⭐

#### Apa Yang Akan Anda Pelajari
- Perancangan kapasiti dan pengesahan sumber
- Strategi pemilihan SKU
- Pemeriksaan pra-terbang dan automasi

#### Sumber Pembelajaran
- **📊 Perancangan**: [Perancangan Kapasiti](docs/chapter-06-pre-deployment/capacity-planning.md) - Pengesahan sumber
- **💰 Pemilihan**: [Pemilihan SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Pilihan berkesan kos
- **✅ Pengesahan**: [Pemeriksaan Pra-Terbang](docs/chapter-06-pre-deployment/preflight-checks.md) - Skrip automatik

#### Latihan Praktikal
- Jalankan skrip pengesahan kapasiti
- Optimumkan pemilihan SKU untuk kos
- Laksanakan pemeriksaan pra-penghantaran automatik

**💡 Hasil Bab**: Sahkan dan optimumkan penghantaran sebelum pelaksanaan

---

### 🚨 Bab 7: Penyelesaian Masalah & Pengdebugan
**Prasyarat**: Mana-mana bab penghantaran selesai  
**Tempoh**: 1-1.5 jam  
**Kerumitan**: ⭐⭐

#### Apa Yang Akan Anda Pelajari
- Pendekatan pengdebugan sistematik
- Isu dan penyelesaian biasa
- Penyelesaian masalah khusus AI

#### Sumber Pembelajaran
- **🔧 Isu Biasa**: [Isu Biasa](docs/chapter-07-troubleshooting/common-issues.md) - Soalan Lazim dan penyelesaian
- **🕵️ Pengdebugan**: [Panduan Pengdebugan](docs/chapter-07-troubleshooting/debugging.md) - Strategi langkah demi langkah
- **🤖 Isu AI**: [Penyelesaian Masalah AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Masalah perkhidmatan AI

#### Latihan Praktikal
- Mendiagnosis kegagalan penghantaran
- Menyelesaikan isu pengesahan
- Debug sambungan perkhidmatan AI

**💡 Hasil Bab**: Mendiagnosis dan menyelesaikan isu penghantaran biasa secara berdikari

---

### 🏢 Bab 8: Pengeluaran & Corak Perusahaan
**Prasyarat**: Bab 1-4 selesai  
**Tempoh**: 2-3 jam  
**Kerumitan**: ⭐⭐⭐⭐

#### Apa Yang Akan Anda Pelajari
- Strategi penghantaran pengeluaran
- Corak keselamatan perusahaan
- Pemantauan dan pengoptimuman kos

#### Sumber Pembelajaran
- **🏭 Pengeluaran**: [Amalan Terbaik AI Pengeluaran](docs/chapter-08-production/production-ai-practices.md) - Corak perusahaan
- **📝 Contoh**: [Contoh Mikroperkhidmatan](../../examples/microservices) - Seni bina kompleks
- **📊 Pemantauan**: [Integrasi Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Pemantauan

#### Latihan Praktikal
- Laksanakan corak keselamatan perusahaan
- Sediakan pemantauan komprehensif
- Hantar ke pengeluaran dengan tadbir urus yang betul

**💡 Hasil Bab**: Hantar aplikasi sedia perusahaan dengan kemampuan pengeluaran penuh

---

## 🎓 Gambaran Bengkel: Pengalaman Pembelajaran Praktikal

> **⚠️ STATUS BENGKEL: Pembangunan Aktif**  

> Bahan bengkel sedang dibangunkan dan diperhalusi. Modul teras berfungsi, tetapi beberapa bahagian lanjutan belum lengkap. Kami sedang berusaha untuk melengkapkan semua kandungan. [Jejak kemajuan →](workshop/README.md)

### Bahan Bengkel Interaktif
**Pembelajaran praktikal menyeluruh dengan alat berasaskan pelayar dan latihan panduan**

Bahan bengkel kami menyediakan pengalaman pembelajaran berstruktur dan interaktif yang melengkapkan kurikulum berasaskan bab di atas. Bengkel ini direka untuk pembelajaran kendiri dan sesi dipimpin oleh pengajar.

#### 🛠️ Ciri-ciri Bengkel
- **Antara Muka Berasaskan Pelayar**: Bengkel lengkap dengan kuasa MkDocs dengan ciri carian, salin, dan tema
- **Integrasi GitHub Codespaces**: Satu klik untuk menyediakan persekitaran pembangunan
- **Laluan Pembelajaran Berstruktur**: Latihan berpandukan 8 modul (3-4 jam keseluruhan)
- **Metodologi Progresif**: Pengenalan → Pemilihan → Pengesahan → Perincian → Pengkonfigurasian → Penyesuaian → Penghentian → Penutup
- **Persekitaran DevContainer Interaktif**: Alat dan kebergantungan yang telah dikonfigurasikan sebelumnya

#### 📚 Struktur Modul Bengkel
Bengkel mengikuti **metodologi progresif 8 modul** yang membawa anda dari penemuan hingga penguasaan penyebaran:

| Modul | Topik | Apa Yang Anda Akan Lakukan | Tempoh |
|--------|-------|----------------|----------|
| **0. Pengenalan** | Gambaran Bengkel | Fahami objektif pembelajaran, prasyarat, dan struktur bengkel | 15 min |
| **1. Pemilihan** | Penemuan Template | Terokai templat AZD dan pilih templat AI yang sesuai untuk senario anda | 20 min |
| **2. Pengesahan** | Sebar & Sahkan | Sebarkan templat dengan `azd up` dan sahkan infrastruktur berfungsi | 30 min |
| **3. Perincian** | Memahami Struktur | Gunakan GitHub Copilot untuk meneroka seni bina templat, fail Bicep, dan organisasi kod | 30 min |
| **4. Pengkonfigurasian** | Mendalami azure.yaml | Kuasai konfigurasi `azure.yaml`, lifecycle hooks, dan pembolehubah persekitaran | 30 min |
| **5. Penyesuaian** | Jadikan Ia Milik Anda | Aktifkan AI Search, penjejakan, penilaian, dan sesuaikan mengikut senario anda | 45 min |
| **6. Penghentian** | Membersihkan | Nyahprovisikan sumber dengan selamat menggunakan `azd down --purge` | 15 min |
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
# Ikuti arahan penyediaan dalam workshop/README.md
```

#### 🎯 Hasil Pembelajaran Bengkel
Dengan menamatkan bengkel, peserta akan:
- **Menyebarkan Aplikasi AI Produksi**: Gunakan AZD dengan perkhidmatan Microsoft Foundry
- **Menguasai Seni Bina Multi-Ejen**: Melaksanakan penyelesaian ejen AI berkoordinasi
- **Melaksanakan Amalan Keselamatan Terbaik**: Mengkonfigurasi pengesahan dan kawalan akses
- **Mengoptimumkan untuk Skala**: Reka bentuk penyebaran kos efektif dan berprestasi
- **Menyelesaikan Masalah Penyebaran**: Menyelesaikan isu biasa secara berdikari

#### 📖 Sumber Bengkel
- **🎥 Panduan Interaktif**: [Bahan Bengkel](workshop/README.md) - Persekitaran pembelajaran berasaskan pelayar
- **📋 Arahan Modul demi Modul**:
  - [0. Pengenalan](workshop/docs/instructions/0-Introduction.md) - Gambaran dan objektif bengkel
  - [1. Pemilihan](workshop/docs/instructions/1-Select-AI-Template.md) - Cari dan pilih templat AI
  - [2. Pengesahan](workshop/docs/instructions/2-Validate-AI-Template.md) - Sebar dan sahkan templat
  - [3. Perincian](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Terokai seni bina templat
  - [4. Pengkonfigurasian](workshop/docs/instructions/4-Configure-AI-Template.md) - Kuasai azure.yaml
  - [5. Penyesuaian](workshop/docs/instructions/5-Customize-AI-Template.md) - Sesuaikan mengikut senario anda
  - [6. Penghentian](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Bersihkan sumber
  - [7. Penutup](workshop/docs/instructions/7-Wrap-up.md) - Semak dan langkah seterusnya
- **🛠️ Makmal Bengkel AI**: [Makmal Bengkel AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Latihan fokus AI
- **💡 Mula Pantas**: [Panduan Setup Bengkel](workshop/README.md#quick-start) - Konfigurasi persekitaran

**Sesuai untuk**: Latihan korporat, kursus universiti, pembelajaran kendiri, dan bootcamp pemaju.

---

## 📖 Pendalaman: Kebolehan AZD

Selain asas, AZD menyediakan ciri kuat untuk penyebaran produksi:

- **Penyebaran berasaskan templat** - Gunakan templat siap untuk corak aplikasi biasa
- **Infrastruktur sebagai Kod** - Urus sumber Azure menggunakan Bicep atau Terraform  
- **Aliran kerja terintegrasi** - Lancar dalam menyediakan, menyebar, dan memantau aplikasi
- **Mesra pemaju** - Dioptimumkan untuk produktiviti dan pengalaman pemaju

### **AZD + Microsoft Foundry: Sempurna untuk Penyebaran AI**

**Mengapa AZD untuk Penyelesaian AI?** AZD menangani cabaran utama yang dihadapi pemaju AI:

- **Templat Bersedia AI** - Templat telah dikonfigurasikan untuk Azure OpenAI, Perkhidmatan Kognitif, dan beban kerja ML
- **Penyebaran AI Selamat** - Corak keselamatan terbina dalam untuk perkhidmatan AI, kekunci API, dan titik hujung model  
- **Corak AI Produksi** - Amalan terbaik untuk penyebaran aplikasi AI yang boleh diskala dan kos efektif
- **Aliran Kerja AI Sepenuhnya** - Dari pembangunan model hingga penyebaran produksi dengan pemantauan betul
- **Pengoptimuman Kos** - Pengagihan sumber pintar dan strategi penskalaan untuk beban kerja AI
- **Integrasi Microsoft Foundry** - Sambungan lancar ke katalog model Microsoft Foundry dan titik hujung

---

## 🎯 Templat & Perpustakaan Contoh

### Pilihan: Templat Microsoft Foundry
**Mula di sini jika anda menyebarkan aplikasi AI!**

> **Nota:** Templat ini menunjukkan pelbagai corak AI. Sesetengahnya adalah Sampel Azure luar, yang lain implementasi tempatan.

| Templat | Bab | Kerumitan | Perkhidmatan | Jenis |
|----------|---------|------------|----------|------|
| [**Mula dengan AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bab 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Luar |
| [**Mula dengan AI agen**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Bab 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Luar |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bab 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Luar |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bab 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Luar |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bab 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Luar |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Bab 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Luar |
| [**Penyelesaian Multi-Ejen Runcit**](examples/retail-scenario.md) | Bab 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Tempatan** |

### Pilihan: Senario Pembelajaran Lengkap
**Templat aplikasi sedia produksi dipadankan dengan bab pembelajaran**

| Templat | Bab Pembelajaran | Kerumitan | Pembelajaran Utama |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bab 2 | ⭐ | Corak asas penyebaran AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bab 2 | ⭐⭐ | Pelaksanaan RAG dengan Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Bab 4 | ⭐⭐ | Integrasi Kecerdasan Dokumen |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bab 5 | ⭐⭐⭐ | Rangka kerja agen dan panggilan fungsi |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Bab 8 | ⭐⭐⭐ | Orkestrasi AI perusahaan |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Bab 5 | ⭐⭐⭐⭐ | Seni bina multi-ejen dengan ejen Pelanggan dan Inventori |

### Pembelajaran Mengikut Jenis Contoh

> **📌 Contoh Tempatan vs. Luar:**  
> **Contoh Tempatan** (dalam repo ini) = Sedia guna serta-merta  
> **Contoh Luar** (Sampel Azure) = Klon dari repositori pautan

#### Contoh Tempatan (Sedia guna)
- [**Penyelesaian Multi-Ejen Runcit**](examples/retail-scenario.md) - Implementasi lengkap sedia produksi dengan templat ARM
  - Seni bina multi-ejen (Ejen Pelanggan + Inventori)
  - Pemantauan dan penilaian menyeluruh
  - Satu klik penyebaran melalui templat ARM

#### Contoh Tempatan - Aplikasi Container (Bab 2-5)
**Contoh penyebaran container menyeluruh dalam repositori ini:**
- [**Contoh Aplikasi Container**](examples/container-app/README.md) - Panduan lengkap ke penyebaran berkontena
  - [API Flask Mudah](../../examples/container-app/simple-flask-api) - REST API asas dengan skala ke sifar
  - [Seni Bina Mikroservis](../../examples/container-app/microservices) - Penyebaran perkhidmatan pelbagai sedia produksi
  - Corak Penyebaran Mula Pantas, Produksi dan Lanjutan
  - Panduan pemantauan, keselamatan, dan pengoptimuman kos

#### Contoh Luar - Aplikasi Mudah (Bab 1-2)
**Klon repositori Sampel Azure berikut untuk bermula:**
- [Aplikasi Web Mudah - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Corak penyebaran asas
- [Laman Web Statik - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Penyebaran kandungan statik
- [Aplikasi Container - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Penyebaran REST API

#### Contoh Luar - Integrasi Pangkalan Data (Bab 3-4)  
- [Aplikasi Pangkalan Data - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Corak sambungan pangkalan data
- [Fungsi + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Aliran kerja data serverless

#### Contoh Luar - Corak Lanjutan (Bab 4-8)
- [Mikroservis Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Seni bina pelbagai perkhidmatan
- [Pekerjaan Aplikasi Container](https://github.com/Azure-Samples/container-apps-jobs) - Pemprosesan latar belakang  
- [Saluran ML Perusahaan](https://github.com/Azure-Samples/mlops-v2) - Corak ML sedia produksi

### Koleksi Templat Luar
- [**Galeri Templat AZD Rasmi**](https://azure.github.io/awesome-azd/) - Koleksi terpilih templat rasmi dan komuniti
- [**Templat Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasi templat Microsoft Learn
- [**Direktori Contoh**](examples/README.md) - Contoh pembelajaran tempatan dengan penjelasan terperinci

---

## 📚 Sumber Pembelajaran & Rujukan

### Rujukan Pantas
- [**Lembaran Perintah**](resources/cheat-sheet.md) - Perintah azd penting disusun mengikut bab
- [**Glosari**](resources/glossary.md) - Terminologi Azure dan azd  
- [**Soalan Lazim**](resources/faq.md) - Soalan biasa disusun mengikut bab pembelajaran
- [**Panduan Kajian**](resources/study-guide.md) - Latihan praktikal menyeluruh

### Bengkel Praktikal
- [**Makmal Bengkel AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Jadikan penyelesaian AI anda boleh disebarkan dengan AZD (2-3 jam)
- [**Bengkel Interaktif**](workshop/README.md) - Latihan berpandukan 8 modul dengan MkDocs dan GitHub Codespaces
  - Mengikuti: Pengenalan → Pemilihan → Pengesahan → Perincian → Pengkonfigurasian → Penyesuaian → Penghentian → Penutup

### Sumber Pembelajaran Luar
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pusat Seni Bina Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulator Harga Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status Azure](https://status.azure.com/)

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
# Cuba wilayah Azure yang berbeza
azd env set AZURE_LOCATION "westus2"
azd up

# Atau gunakan SKU yang lebih kecil dalam pembangunan
# Sunting infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" gagal di tengah jalan</strong></summary>

```bash
# Pilihan 1: Bersihkan dan cuba lagi
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
<summary><strong>❌ "Pengesahan gagal" atau "Token tamat tempoh"</strong></summary>

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
<summary><strong>❌ "Sumber telah wujud" atau konflik nama</strong></summary>

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
- Aplikasi AI: 15-25 minit (penyediaan OpenAI adalah perlahan)

```bash
# Semak kemajuan
azd show

# Jika tersekat >30 minit, semak Azure Portal:
azd monitor
# Cari penyebaran yang gagal
```
</details>

<details>
<summary><strong>❌ "Kebenaran ditolak" atau "Terlarang"</strong></summary>

```bash
# Semak peranan Azure anda
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Anda memerlukan sekurang-kurangnya peranan "Penyumbang"
# Minta pentadbir Azure anda memberikan:
# - Penyumbang (untuk sumber)
# - Pentadbir Akses Pengguna (untuk penugasan peranan)
```
</details>

<details>
<summary><strong>❌ Tidak dapat mencari URL aplikasi yang telah disebarkan</strong></summary>

```bash
# Paparkan semua titik akhir perkhidmatan
azd show

# Atau buka Portal Azure
azd monitor

# Semak perkhidmatan tertentu
azd env get-values
# Cari pembolehubah *_URL
```
</details>

### 📚 Sumber Penyelesaian Masalah Penuh

- **Panduan Isu Biasa:** [Penyelesaian Terperinci](docs/chapter-07-troubleshooting/common-issues.md)
- **Isu Khusus AI:** [Penyelesaian Masalah AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Panduan Pengesanan Ralat:** [Pengesanan Ralat langkah demi langkah](docs/chapter-07-troubleshooting/debugging.md)
- **Dapatkan Bantuan:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Penyelesaian Kursus & Pensijilan

### Penjejakan Kemajuan
Jejaki kemajuan pembelajaran anda melalui setiap bab:

- [ ] **Bab 1**: Asas & Mula Cepat ✅
- [ ] **Bab 2**: Pembangunan Utama AI ✅  
- [ ] **Bab 3**: Konfigurasi & Pengesahan ✅
- [ ] **Bab 4**: Infrastruktur sebagai Kod & Penempatan ✅
- [ ] **Bab 5**: Penyelesaian AI Multi-Ejen ✅
- [ ] **Bab 6**: Pengesahan & Perancangan Pra-Penempatan ✅
- [ ] **Bab 7**: Penyelesaian Masalah & Pengesanan Ralat ✅
- [ ] **Bab 8**: Corak Pengeluaran & Perusahaan ✅

### Pengesahan Pembelajaran
Selepas menyelesaikan setiap bab, sahkan pengetahuan anda dengan:
1. **Latihan Praktikal**: Lengkapkan penempatan tangan bab tersebut
2. **Semakan Pengetahuan**: Semak seksyen Soalan Lazim untuk bab anda
3. **Perbincangan Komuniti**: Kongsi pengalaman anda di Azure Discord
4. **Bab Seterusnya**: Bergerak ke tahap kompleksiti seterusnya

### Manfaat Penyelesaian Kursus
Setelah menamatkan semua bab, anda akan memiliki:
- **Pengalaman Pengeluaran**: Menerapkan aplikasi AI sebenar ke Azure
- **Kemahiran Profesional**: Kebolehan penempatan sedia perusahaan  
- **Pengiktirafan Komuniti**: Ahli aktif komuniti pembangun Azure
- **Kemajuan Kerjaya**: Kepakaran penempatan AZD dan AI yang tinggi permintaan

---

## 🤝 Komuniti & Sokongan

### Dapatkan Bantuan & Sokongan
- **Isu Teknikal**: [Laporkan pepijat dan minta ciri](https://github.com/microsoft/azd-for-beginners/issues)
- **Soalan Pembelajaran**: [Komuniti Discord Microsoft Azure](https://discord.gg/microsoft-azure) dan [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Bantuan Khusus AI**: Sertai [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasi**: [Dokumentasi rasmi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Pandangan Komuniti dari Microsoft Foundry Discord

**Keputusan Tinjauan Terkini dari Saluran #Azure:**
- **45%** pembangun ingin menggunakan AZD untuk beban kerja AI
- **Cabaran utama**: Penempatan multi-perkhidmatan, pengurusan kelayakan, kesiapsiagaan produksi  
- **Permintaan tertinggi**: Templat khusus AI, panduan penyelesaian masalah, amalan terbaik

**Sertai komuniti kami untuk:**
- Berkongsi pengalaman AZD + AI anda dan dapatkan bantuan
- Akses pratonton awal templat AI baharu
- Menyumbang kepada amalan terbaik penempatan AI
- Mempengaruhi pembangunan ciri AI + AZD masa depan

### Menyumbang kepada Kursus
Kami mengalu-alukan sumbangan! Sila baca [Panduan Menyumbang](CONTRIBUTING.md) kami untuk maklumat lanjut mengenai:
- **Penambahbaikan Kandungan**: Mempertingkatkan bab dan contoh sedia ada
- **Contoh Baharu**: Menambah senario dan templat dunia sebenar  
- **Penterjemahan**: Membantu mengekalkan sokongan pelbagai bahasa
- **Laporan Pepijat**: Meningkatkan ketepatan dan kejelasan
- **Standard Komuniti**: Mematuhi garis panduan komuniti inklusif kami

---

## 📄 Maklumat Kursus

### Lesen
Projek ini dilesenkan di bawah Lesen MIT - lihat fail [LICENSE](../../LICENSE) untuk butiran.

### Sumber Pembelajaran Berkaitan Microsoft

Pasukan kami menghasilkan kursus pembelajaran menyeluruh lain:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agen
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

**Pemula**: Mulakan dengan [Bab 1: Asas & Permulaan Pantas](../..)  
**Pembangun AI**: Terus ke [Bab 2: Pembangunan AI-Pertama](../..)  
**Pembangun Berpengalaman**: Mulakan dengan [Bab 3: Konfigurasi & Pengesahan](../..)

**Langkah Seterusnya**: [Mula Bab 1 - Asas AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->