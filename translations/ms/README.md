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
[Arab](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgaria](../bg/README.md) | [Bahasa Burma (Myanmar)](../my/README.md) | [Cina (Ringkas)](../zh-CN/README.md) | [Cina (Tradisional, Hong Kong)](../zh-HK/README.md) | [Cina (Tradisional, Macau)](../zh-MO/README.md) | [Cina (Tradisional, Taiwan)](../zh-TW/README.md) | [Croatia](../hr/README.md) | [Czech](../cs/README.md) | [Denmark](../da/README.md) | [Belanda](../nl/README.md) | [Estonia](../et/README.md) | [Finland](../fi/README.md) | [Perancis](../fr/README.md) | [Jerman](../de/README.md) | [Greek](../el/README.md) | [Ibrani](../he/README.md) | [Hindi](../hi/README.md) | [Hungaria](../hu/README.md) | [Indonesia](../id/README.md) | [Itali](../it/README.md) | [Jepun](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korea](../ko/README.md) | [Lithuanian](../lt/README.md) | [Melayu](./README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigeria Pidgin](../pcm/README.md) | [Norway](../no/README.md) | [Parsi (Farsi)](../fa/README.md) | [Poland](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romania](../ro/README.md) | [Rusia](../ru/README.md) | [Serbia (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenia](../sl/README.md) | [Sepanyol](../es/README.md) | [Swahili](../sw/README.md) | [Sweden](../sv/README.md) | [Tagalog (Filipina)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turki](../tr/README.md) | [Ukraine](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnam](../vi/README.md)

> **Lebih Suka Klon Secara Tempatan?**
>
> Repositori ini merangkumi lebih daripada 50 terjemahan bahasa yang secara signifikan meningkatkan saiz muat turun. Untuk klon tanpa terjemahan, gunakan sparse checkout:
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
> Ini memberikan anda segala yang anda perlukan untuk menyelesaikan kursus dengan muat turun yang lebih pantas.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Apa Yang Baru di azd Hari Ini

Azure Developer CLI telah berkembang melebihi aplikasi web dan API tradisional. Hari ini, azd adalah alat tunggal untuk menyebarkan **mana-mana** aplikasi ke Azure—termasuk aplikasi berkuasa AI dan agen pintar.

Ini maksudnya untuk anda:

- **Agen AI kini adalah beban kerja azd kelas pertama.** Anda boleh memulakan, menyebar, dan mengurus projek agen AI menggunakan aliran kerja `azd init` → `azd up` yang anda sudah biasa.
- **Integrasi Microsoft Foundry** membawa penyebaran model, penghosan agen, dan konfigurasi perkhidmatan AI terus ke dalam ekosistem templat azd.
- **Aliran kerja teras tidak berubah.** Sama ada anda menyebarkan aplikasi todo, mikroservis, atau penyelesaian AI multi-agen, arahan adalah sama.

Jika anda pernah menggunakan azd sebelum ini, sokongan AI adalah peluasan semula jadi—bukan alat berasingan atau trek lanjutan. Jika anda baru bermula, anda akan belajar satu aliran kerja yang berfungsi untuk segala-galanya.

---

## 🚀 Apakah Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** adalah alat baris arahan mesra pembangun yang memudahkan penyebaran aplikasi ke Azure. Daripada mencipta dan menyambungkan puluhan sumber Azure secara manual, anda boleh menyebarkan keseluruhan aplikasi dengan satu perintah.

### Keajaiban `azd up`

```bash
# Perintah tunggal ini melakukan semuanya:
# ✅ Mencipta semua sumber Azure
# ✅ Mengkonfigurasi rangkaian dan keselamatan
# ✅ Membina kod aplikasi anda
# ✅ Menerapkan ke Azure
# ✅ Memberi anda URL yang berfungsi
azd up
```

**Itu sahaja!** Tiada klik di Azure Portal, tiada templat ARM yang kompleks untuk belajar terlebih dahulu, tiada konfigurasi manual - hanya aplikasi yang berfungsi di Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Apakah Bezanya?

Ini soalan paling biasa ditanya oleh pemula. Berikut jawapan ringkasnya:

| Ciri | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Tujuan** | Mengurus sumber Azure individu | Menyebarkan aplikasi lengkap |
| **Pemikiran** | Fokus pada infrastruktur | Fokus pada aplikasi |
| **Contoh** | `az webapp create --name myapp...` | `azd up` |
| **Lengkung Pembelajaran** | Perlu tahu perkhidmatan Azure | Cuma tahu aplikasi anda |
| **Terbaik untuk** | DevOps, Infrastruktur | Pembangun, Prototip |

### Analogi Mudah

- **Azure CLI** seperti mempunyai semua alat untuk membina rumah - tukul, gergaji, paku. Anda boleh bina apa saja, tapi anda perlu tahu pembinaan.
- **Azure Developer CLI** seperti mengupah kontraktor - anda terangkan apa yang anda mahu, dan mereka urus pembinaan.

### Bila Guna Setiap Satu

| Senario | Gunakan Ini |
|----------|----------|
| "Saya mahu menyebarkan aplikasi web saya dengan cepat" | `azd up` |
| "Saya perlu buat akaun storan sahaja" | `az storage account create` |
| "Saya sedang membina aplikasi AI penuh" | `azd init --template azure-search-openai-demo` |
| "Saya mahu debug sumber Azure tertentu" | `az resource show` |
| "Saya mahu penyebaran sedia produksi dalam beberapa minit" | `azd up --environment production` |

### Mereka Bekerjasama!

AZD menggunakan Azure CLI di bawahnya. Anda boleh gunakan kedua-duanya:
```bash
# Sebarkan aplikasi anda dengan AZD
azd up

# Kemudian laraskan sumber tertentu dengan Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Cari Templat Dalam Awesome AZD

Jangan mula dari kosong! **Awesome AZD** adalah koleksi komuniti templat sedia untuk disebarkan:

| Sumber | Penerangan |
|----------|-------------|
| 🔗 [**Galeril Awesome AZD**](https://azure.github.io/awesome-azd/) | Layari 200+ templat dengan satu klik penyebaran |
| 🔗 [**Hantar Templat**](https://github.com/Azure/awesome-azd/issues) | Sumbangkan templat anda sendiri kepada komuniti |
| 🔗 [**Repositori GitHub**](https://github.com/Azure/awesome-azd) | Bintang dan terokai sumbernya |

### Templat AI Popular dari Awesome AZD

```bash
# Sembang RAG dengan Model Foundry Microsoft + Carian AI
azd init --template azure-search-openai-demo

# Aplikasi Sembang AI Pantas
azd init --template openai-chat-app-quickstart

# Ejen AI dengan Ejen Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Mula Dalam 3 Langkah

Sebelum anda mula, pastikan mesin anda sudah bersedia untuk templat yang ingin anda sebarkan:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jika terdapat sebarang pemeriksaan yang gagal, perbaiki yang itu dahulu dan kemudian teruskan dengan permulaan cepat.

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

### Langkah 2: Autentikasi untuk AZD

```bash
# Pilihan jika anda merancang untuk menggunakan arahan Azure CLI secara langsung dalam kursus ini
az login

# Diperlukan untuk aliran kerja AZD
azd auth login
```

Jika anda tidak pasti yang mana satu anda perlukan, ikuti aliran tetapan penuh dalam [Pemasangan & Persediaan](docs/chapter-01-foundation/installation.md#authentication-setup).

### Langkah 3: Sebarkan Aplikasi Pertama Anda

```bash
# Inisialisasi daripada templat
azd init --template todo-nodejs-mongo

# Sebarkan ke Azure (mencipta segala-galanya!)
azd up
```

**🎉 Itu sahaja!** Aplikasi anda kini hidup di Azure.

### Bersihkan (Jangan Lupa!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cara Menggunakan Kursus Ini

Kursus ini direka untuk **pembelajaran progresif** - mulakan di tempat yang anda selesa dan teruskan ke tahap seterusnya:

| Pengalaman Anda | Mula Di Sini |
|-----------------|------------|
| **Baru dalam Azure** | [Bab 1: Asas](#-chapter-1-foundation--quick-start) |
| **Tahu Azure, baru dalam AZD** | [Bab 1: Asas](#-chapter-1-foundation--quick-start) |
| **Mahukan penyebaran aplikasi AI** | [Bab 2: Pembangunan AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Mahukan latihan praktikal** | [🎓 Bengkel Interaktif](workshop/README.md) - makmal berpandu 3-4 jam |
| **Perlukan corak produksi** | [Bab 8: Produksi & Perusahaan](#-chapter-8-production--enterprise-patterns) |

### Tetapan Pantas

1. **Fork Repositori Ini**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon Ia**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Dapatkan Bantuan**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Lebih Suka Klon Secara Tempatan?**

> Repositori ini merangkumi lebih daripada 50 terjemahan bahasa yang secara signifikan meningkatkan saiz muat turun. Untuk klon tanpa terjemahan, gunakan sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ini memberikan anda segala yang anda perlukan untuk menyelesaikan kursus dengan muat turun yang lebih pantas.


## Gambaran Keseluruhan Kursus

Kuasi Azure Developer CLI (azd) melalui bab berstruktur yang direka untuk pembelajaran progresif. **Fokus khusus pada penyebaran aplikasi AI dengan integrasi Microsoft Foundry.**

### Mengapa Kursus Ini Penting untuk Pembangun Moden

Berdasarkan pandangan komuniti Microsoft Foundry Discord, **45% pembangun mahu menggunakan AZD untuk beban kerja AI** tetapi menghadapi cabaran dengan:
- Seni bina AI multi-perkhidmatan yang kompleks
- Amalan terbaik penyebaran AI produksi  
- Integrasi dan konfigurasi perkhidmatan Azure AI
- Pengoptimuman kos untuk beban kerja AI
- Menyelesaikan masalah khusus penyebaran AI

### Objektif Pembelajaran

Dengan melengkapkan kursus berstruktur ini, anda akan:
- **Menguasai Asas AZD**: Konsep teras, pemasangan, dan konfigurasi
- **Menyebarkan Aplikasi AI**: Menggunakan AZD dengan perkhidmatan Microsoft Foundry
- **Melaksanakan Infrastruktur sebagai Kod**: Mengurus sumber Azure dengan templat Bicep
- **Menyelesaikan Masalah Penyebaran**: Memperbaiki isu biasa dan debug masalah
- **Mengoptimumkan untuk Produksi**: Keselamatan, penskalaan, pemantauan, dan pengurusan kos
- **Membina Penyelesaian Multi-Agen**: Menyebarkan seni bina AI kompleks

## Sebelum Anda Mula: Akaun, Akses, dan Asumsi

Sebelum anda mula Bab 1, pastikan anda mempunyai perkara berikut. Langkah pemasangan dalam panduan ini mengandaikan asas ini telah diuruskan.
- **Langganan Azure**: Anda boleh menggunakan langganan sedia ada dari kerja atau akaun sendiri, atau buat [percubaan percuma](https://aka.ms/azurefreetrial) untuk bermula.
- **Kebenaran untuk mencipta sumber Azure**: Untuk kebanyakan latihan, anda perlu mempunyai akses sekurang-kurangnya **Contributor** pada langganan atau kumpulan sumber sasaran. Sesetengah bab mungkin juga mengandaikan anda boleh mencipta kumpulan sumber, identiti yang diuruskan, dan tugasan RBAC.
- [**Akaun GitHub**](https://github.com): Ini berguna untuk membuat forking repositori, menjejaki perubahan sendiri, dan menggunakan GitHub Codespaces untuk bengkel.
- **Prasyarat runtime templat**: Sesetengah templat memerlukan alat tempatan seperti Node.js, Python, Java, atau Docker. Jalankan validator persediaan sebelum memulakan supaya anda mengesan alat yang hilang awal.
- **Kemahiran asas terminal**: Anda tidak perlu menjadi pakar, tetapi anda perlu selesa menjalankan arahan seperti `git clone`, `azd auth login`, dan `azd up`.

> **Bekerja dalam langganan perusahaan?**  
> Jika persekitaran Azure anda diuruskan oleh pentadbir, sahkan terlebih dahulu bahawa anda boleh mengedepankan sumber dalam langganan atau kumpulan sumber yang anda rancangkan gunakan. Jika tidak, minta langganan sandbox atau akses Contributor sebelum mula.

> **Baru dengan Azure?**  
> Mulakan dengan percubaan Azure sendiri atau langganan bayar-semasa penggunaan di https://aka.ms/azurefreetrial supaya anda dapat menyiapkan latihan sepenuhnya tanpa menunggu kelulusan tahap tenant.

## 🗺️ Peta Kursus: Navigasi Pantas mengikut Bab

Setiap bab mempunyai README khusus dengan objektif pembelajaran, permulaan pantas, dan latihan:

| Bab | Topik | Pelajaran | Tempoh | Kerumitan |
|---------|-------|---------|----------|------------|
| **[Bab 1: Asas](docs/chapter-01-foundation/README.md)** | Bermula | [Asas AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Pemasangan](docs/chapter-01-foundation/installation.md) &#124; [Projek Pertama](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Bab 2: Pembangunan AI](docs/chapter-02-ai-development/README.md)** | Aplikasi AI-Pertama | [Integrasi Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Ejen AI](docs/chapter-02-ai-development/agents.md) &#124; [Pengedepanan Model](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Bengkel](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 jam | ⭐⭐ |
| **[Bab 3: Konfigurasi](docs/chapter-03-configuration/README.md)** | Auth & Keselamatan | [Konfigurasi](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Keselamatan](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Bab 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Pengedepanan | [Panduan Pengedepanan](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Penyediaan](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 jam | ⭐⭐⭐ |
| **[Bab 5: Multi-Ejen](docs/chapter-05-multi-agent/README.md)** | Penyelesaian Ejen AI | [Senario Runcit](examples/retail-scenario.md) &#124; [Corak Penyelarasan](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 jam | ⭐⭐⭐⭐ |
| **[Bab 6: Pra-Pengedepanan](docs/chapter-06-pre-deployment/README.md)** | Perancangan & Pengesahan | [Pemeriksaan Pra-Pengendalian](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Perancangan Kapasiti](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Pemilihan SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 jam | ⭐⭐ |
| **[Bab 7: Penyelesaian Masalah](docs/chapter-07-troubleshooting/README.md)** | Debug & Betulkan | [Isu Lazim](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Penyahpepijatan](docs/chapter-07-troubleshooting/debugging.md) &#124; [Isu AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 jam | ⭐⭐ |
| **[Bab 8: Pengeluaran](docs/chapter-08-production/README.md)** | Corak Perusahaan | [Amalan Pengeluaran](docs/chapter-08-production/production-ai-practices.md) | 2-3 jam | ⭐⭐⭐⭐ |
| **[🎓 Bengkel](workshop/README.md)** | Bengkel Amali | [Pengenalan](workshop/docs/instructions/0-Introduction.md) &#124; [Pemilihan](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Pengesahan](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Penderaan](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurasi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Pengkhususan](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Pemusnahan](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Penutup](workshop/docs/instructions/7-Wrap-up.md) | 3-4 jam | ⭐⭐ |

**Jumlah Durasi Kursus:** ~10-14 jam | **Kemajuan Kemahiran:** Pemula → Sedia Produksi

---

## 📚 Bab-Bab Pembelajaran

*Pilih laluan pembelajaran berdasarkan tahap pengalaman dan matlamat*

### 🚀 Bab 1: Asas & Permulaan Pantas  
**Prasyarat**: Langganan Azure, pengetahuan asas baris arahan  
**Tempoh**: 30-45 minit  
**Kerumitan**: ⭐

#### Apa yang Akan Anda Pelajari  
- Memahami asas Azure Developer CLI  
- Memasang AZD pada platform anda  
- Pengedepanan pertama anda yang berjaya

#### Sumber Pembelajaran  
- **🎯 Mula di Sini**: [Apa itu Azure Developer CLI?](#what-is-azure-developer-cli)  
- **📖 Teori**: [Asas AZD](docs/chapter-01-foundation/azd-basics.md) - Konsep teras dan terminologi  
- **⚙️ Persediaan**: [Pemasangan & Persediaan](docs/chapter-01-foundation/installation.md) - Panduan khusus platform  
- **🛠️ Amali**: [Projek Pertama Anda](docs/chapter-01-foundation/first-project.md) - Tutorial langkah demi langkah  
- **📋 Rujukan Pantas**: [Senarai Perintah](resources/cheat-sheet.md)

#### Latihan Praktikal  
```bash
# Semakan pemasangan pantas
azd version

# Sebarkan aplikasi pertama anda
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 Hasil Bab**: Berjaya mengedepan aplikasi web mudah ke Azure menggunakan AZD

**✅ Pengesahan Kejayaan:**  
```bash
# Selepas menyiapkan Bab 1, anda harus dapat:
azd version              # Menunjukkan versi yang dipasang
azd init --template todo-nodejs-mongo  # Memulakan projek
azd up                  # Mengeluarkan ke Azure
azd show                # Memaparkan URL aplikasi yang sedang berjalan
# Aplikasi dibuka dalam pelayar dan berfungsi
azd down --force --purge  # Membersihkan sumber
```
  
**📊 Masa Pelaburan:** 30-45 minit  
**📈 Tahap Kemahiran Selepas:** Boleh mengedepan aplikasi asas secara berdikari  

---

### 🤖 Bab 2: Pembangunan AI-Pertama (Disyorkan untuk Pembangun AI)  
**Prasyarat**: Bab 1 selesai  
**Tempoh**: 1-2 jam  
**Kerumitan**: ⭐⭐

#### Apa yang Akan Anda Pelajari  
- Integrasi Microsoft Foundry dengan AZD  
- Pengedepanan aplikasi berasaskan AI  
- Memahami konfigurasi perkhidmatan AI

#### Sumber Pembelajaran  
- **🎯 Mula di Sini**: [Integrasi Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 Ejen AI**: [Panduan Ejen AI](docs/chapter-02-ai-development/agents.md) - Edapkan ejen pintar dengan AZD  
- **📖 Corak**: [Pengedepanan Model AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Edapkan dan urus model AI  
- **🛠️ Bengkel**: [Bengkel AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Sediakan solusi AI anda agar sedia AZD  
- **🎥 Panduan Interaktif**: [Bahan Bengkel](workshop/README.md) - Pembelajaran berasaskan pelayar dengan MkDocs * Persekitaran DevContainer  
- **📋 Templat**: [Templat Microsoft Foundry](#sumber-bengkel)  
- **📝 Contoh**: [Contoh Pengedepanan AZD](examples/README.md)

#### Latihan Praktikal  
```bash
# Lancarkan aplikasi AI pertama anda
azd init --template azure-search-openai-demo
azd up

# Cuba templat AI tambahan
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 Hasil Bab**: Mengedepan dan mengkonfigurasi aplikasi chat AI dengan keupayaan RAG

**✅ Pengesahan Kejayaan:**  
```bash
# Selepas Bab 2, anda sepatutnya boleh:
azd init --template azure-search-openai-demo
azd up
# Uji antara muka sembang AI
# Tanyakan soalan dan dapatkan respons yang dipacu AI dengan sumber
# Sahkan integrasi carian berfungsi
azd monitor  # Semak Application Insights menunjukkan telemetri
azd down --force --purge
```
  
**📊 Masa Pelaburan:** 1-2 jam  
**📈 Tahap Kemahiran Selepas:** Boleh mengedepan dan mengkonfigurasi aplikasi AI sedia produksi  
**💰 Kesedaran Kos:** Faham kos pembangunan $80-150/bulan, kos produksi $300-3500/bulan

#### 💰 Pertimbangan Kos untuk Pengedepanan AI

**Persekitaran Pembangunan (Anggaran $80-150/bulan):**  
- Model Microsoft Foundry (Bayar-semasa penggunaan): $0-50/bulan (berdasarkan penggunaan token)  
- AI Search (Tier asas): $75/bulan  
- Container Apps (Penggunaan): $0-20/bulan  
- Penyimpanan (Standard): $1-5/bulan

**Persekitaran Pengeluaran (Anggaran $300-3,500+/bulan):**  
- Model Microsoft Foundry (PTU untuk prestasi konsisten): $3,000+/bulan ATAU Bayar-semasa dengan volume tinggi  
- AI Search (Tier standard): $250/bulan  
- Container Apps (Didedikasikan): $50-100/bulan  
- Application Insights: $5-50/bulan  
- Penyimpanan (Premium): $10-50/bulan

**💡 Petua Pengoptimuman Kos:**  
- Gunakan Model Microsoft Foundry **Tier Percuma** untuk pembelajaran (Azure OpenAI termasuk 50,000 token/bulan)  
- Jalankan `azd down` untuk melepaskan sumber apabila tidak mengembangkan secara aktif  
- Mula dengan pengebilan berasaskan penggunaan, naik taraf ke PTU hanya untuk produksi  
- Gunakan `azd provision --preview` untuk menganggarkan kos sebelum pengedepanan  
- Aktifkan auto-scaling: bayar hanya untuk penggunaan sebenar

**Pemantauan Kos:**  
```bash
# Semak anggaran kos bulanan
azd provision --preview

# Pantau kos sebenar dalam Azure Portal
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
- Penamaan dan pengorganisasian sumber

#### Sumber Pembelajaran  
- **📖 Konfigurasi**: [Panduan Konfigurasi](docs/chapter-03-configuration/configuration.md) - Persediaan persekitaran  
- **🔐 Keselamatan**: [Corak pengesahan dan identiti yang diuruskan](docs/chapter-03-configuration/authsecurity.md) - Corak pengesahan  
- **📝 Contoh**: [Contoh Aplikasi Pangkalan Data](examples/database-app/README.md) - Contoh Pangkalan Data AZD

#### Latihan Praktikal  
- Konfigurasikan pelbagai persekitaran (dev, staging, prod)  
- Sediakan pengesahan identiti yang diuruskan  
- Laksanakan konfigurasi khusus persekitaran

**💡 Hasil Bab**: Urus pelbagai persekitaran dengan pengesahan dan keselamatan yang betul

---

### 🏗️ Bab 4: Infrastruktur sebagai Kod & Pengedepanan  
**Prasyarat**: Bab 1-3 selesai  
**Tempoh**: 1-1.5 jam  
**Kerumitan**: ⭐⭐⭐

#### Apa yang Akan Anda Pelajari  
- Corak pengedepanan lanjutan  
- Infrastruktur sebagai Kod menggunakan Bicep  
- Strategi penyediaan sumber

#### Sumber Pembelajaran  
- **📖 Pengedepanan**: [Panduan Pengedepanan](docs/chapter-04-infrastructure/deployment-guide.md) - Aliran kerja lengkap  
- **🏗️ Penyediaan**: [Penyediaan Sumber](docs/chapter-04-infrastructure/provisioning.md) - Pengurusan sumber Azure  
- **📝 Contoh**: [Contoh Aplikasi Container](../../examples/container-app) - Pengedepanan berasaskan container

#### Latihan Praktikal  
- Cipta templat Bicep tersuai  
- Edapkan aplikasi pelbagai perkhidmatan  
- Laksanakan strategi pengedepanan blue-green

**💡 Hasil Bab**: Mengedepan aplikasi pelbagai perkhidmatan kompleks menggunakan templat infrastruktur tersuai

---

### 🎯 Bab 5: Penyelesaian AI Multi-Ejen (Lanjutan)  
**Prasyarat**: Bab 1-2 selesai  
**Tempoh**: 2-3 jam  
**Kerumitan**: ⭐⭐⭐⭐

#### Apa yang Akan Anda Pelajari  
- Corak seni bina multi-ejen  
- Orkestrasi dan penyelarasan ejen  
- Pengedepanan AI sedia produksi

#### Sumber Pembelajaran  
- **🤖 Projek Unggulan**: [Penyelesaian Multi-Ejen Runcit](examples/retail-scenario.md) - Pelaksanaan lengkap  
- **🛠️ Templat ARM**: [Pakej Templat ARM](../../examples/retail-multiagent-arm-template) - Pengedepanan satu klik  
- **📖 Seni Bina**: [Corak penyelarasan multi-ejen](docs/chapter-06-pre-deployment/coordination-patterns.md) - Corak

#### Latihan Praktikal  
```bash
# Lancarkan penyelesaian multi-ejen runcit lengkap
cd examples/retail-multiagent-arm-template
./deploy.sh

# Terokai konfigurasi ejen
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Hasil Bab**: Mengedepan dan mengurus penyelesaian AI multi-ejen yang sedia produksi dengan ejen Pelanggan dan Inventori

---

### 🔍 Bab 6: Pengesahan & Perancangan Pra-Pengedepanan  
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
- **✅ Pengesahan**: [Pemeriksaan Pra-penerbangan](docs/chapter-06-pre-deployment/preflight-checks.md) - Skrip automatik

#### Latihan Praktikal
- Jalankan skrip pengesahan kapasiti
- Optimumkan pemilihan SKU untuk kos
- Laksanakan pemeriksaan pra-penerbangan automatik

**💡 Hasil Bab**: Sah dan optimumkan pengeluaran sebelum pelaksanaan

---

### 🚨 Bab 7: Penyelesaian Masalah & Debugging
**Prasyarat**: Bab pengeluaran mana-mana selesai  
**Tempoh**: 1-1.5 jam  
**Kerumitan**: ⭐⭐

#### Apa Yang Anda Akan Pelajari
- Pendekatan sistematik debugging
- Masalah biasa dan penyelesaiannya
- Penyelesaian masalah khusus AI

#### Sumber Pembelajaran
- **🔧 Masalah Biasa**: [Masalah Biasa](docs/chapter-07-troubleshooting/common-issues.md) - Soalan Lazim dan penyelesaian
- **🕵️ Debugging**: [Panduan Debugging](docs/chapter-07-troubleshooting/debugging.md) - Strategi langkah demi langkah
- **🤖 Masalah AI**: [Penyelesaian Masalah Khusus AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Masalah perkhidmatan AI

#### Latihan Praktikal
- Diagnosa kegagalan pengeluaran
- Selesaikan masalah pengesahan
- Debug sambungan perkhidmatan AI

**💡 Hasil Bab**: Diagnosa dan selesaikan sendiri masalah pengeluaran biasa

---

### 🏢 Bab 8: Pola Pengeluaran & Perusahaan
**Prasyarat**: Bab 1-4 selesai  
**Tempoh**: 2-3 jam  
**Kerumitan**: ⭐⭐⭐⭐

#### Apa Yang Anda Akan Pelajari
- Strategi pengeluaran aplikasi
- Pola keselamatan perusahaan
- Pemantauan dan pengoptimuman kos

#### Sumber Pembelajaran
- **🏭 Pengeluaran**: [Amalan Terbaik AI Pengeluaran](docs/chapter-08-production/production-ai-practices.md) - Pola perusahaan
- **📝 Contoh**: [Contoh Mikroservis](../../examples/microservices) - Seni bina kompleks
- **📊 Pemantauan**: [Integrasi Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Pemantauan

#### Latihan Praktikal
- Laksanakan pola keselamatan perusahaan
- Sediakan pemantauan menyeluruh
- Keluarkan ke pengeluaran dengan tadbir urus betul

**💡 Hasil Bab**: Keluarkan aplikasi sedia perusahaan dengan kebolehan pengeluaran penuh

---

## 🎓 Gambaran Keseluruhan Bengkel: Pengalaman Pembelajaran Praktikal

> **⚠️ STATUS BENGKEL: Pembangunan Aktif**  
> Bahan bengkel sedang dibangunkan dan diperbaiki. Modul teras berfungsi, namun beberapa bahagian lanjutan belum lengkap. Kami sedang berusaha menyiapkan semua kandungan. [Jejak kemajuan →](workshop/README.md)

### Bahan Bengkel Interaktif
**Pembelajaran praktikal komprehensif dengan alat berasaskan pelayar dan latihan berpanduan**

Bahan bengkel kami menyediakan pengalaman pembelajaran terstruktur dan interaktif yang melengkapkan kurikulum berasaskan bab di atas. Bengkel direka untuk pembelajaran kendiri dan sesi dikendalikan pengajar.

#### 🛠️ Ciri-ciri Bengkel
- **Antaramuka Berasaskan Pelayar**: Bengkel lengkap menggunakan MkDocs dengan fungsi carian, salin, dan tema
- **Integrasi GitHub Codespaces**: Penyediaan persekitaran pembangunan satu klik
- **Jalur Pembelajaran Terstruktur**: 8 modul latihan berpanduan (3-4 jam keseluruhan)
- **Metodologi Berperingkat**: Pengenalan → Pemilihan → Pengesahan → Penguraian → Konfigurasi → Penyesuaian → Penutupan → Ulasan
- **Persekitaran DevContainer Interaktif**: Alat dan pergantungan pra-konfigurasi

#### 📚 Struktur Modul Bengkel
Bengkel mengikuti **metodologi berperingkat 8 modul** yang membawa anda dari penemuan ke kemahiran pengeluaran:

| Modul | Topik | Apa Yang Anda Akan Lakukan | Tempoh |
|--------|-------|----------------------------|--------|
| **0. Pengenalan** | Gambaran Bengkel | Fahami objektif pembelajaran, prasyarat, dan struktur bengkel | 15 min |
| **1. Pemilihan** | Penemuan Templat | Teroka templat AZD dan pilih templat AI sesuai untuk senario anda | 20 min |
| **2. Pengesahan** | Keluarkan & Sahkan | Keluarkan templat dengan `azd up` dan sahkan infrastruktur berfungsi | 30 min |
| **3. Penguraian** | Fahami Struktur | Gunakan GitHub Copilot untuk teroka seni bina templat, fail Bicep, dan organisasi kod | 30 min |
| **4. Konfigurasi** | Penyelaman azure.yaml | Kuasai konfigurasi `azure.yaml`, lifecycle hooks, dan pembolehubah persekitaran | 30 min |
| **5. Penyesuaian** | Jadikannya Milik Anda | Aktifkan Pencarian AI, penjejakan, penilaian, dan sesuaikan mengikut senario | 45 min |
| **6. Penutupan** | Bersihkan | Nyahperuntukkan sumber dengan selamat menggunakan `azd down --purge` | 15 min |
| **7. Ulasan** | Langkah Seterusnya | Semak pencapaian, konsep utama, dan teruskan perjalanan pembelajaran anda | 15 min |

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
Dengan menyiapkan bengkel, peserta akan:  
- **Keluarkan Aplikasi AI Pengeluaran**: Gunakan AZD dengan perkhidmatan Microsoft Foundry  
- **Kuasa Seni Bina Multi-Ejen**: Laksanakan penyelesaian ejen AI terkoordinasi  
- **Laksanakan Amalan Keselamatan Terbaik**: Konfigurasi pengesahan dan kawalan akses  
- **Optimumkan Skala**: Reka bentuk pengeluaran kos efektif dan berprestasi  
- **Selesaikan Masalah Pengeluaran**: Tetapkan isu biasa secara berdikari  

#### 📖 Sumber Bengkel  
- **🎥 Panduan Interaktif**: [Bahan Bengkel](workshop/README.md) - Persekitaran pembelajaran berasaskan pelayar  
- **📋 Arahan Modul demi Modul**:  
  - [0. Pengenalan](workshop/docs/instructions/0-Introduction.md) - Gambaran bengkel dan objektif  
  - [1. Pemilihan](workshop/docs/instructions/1-Select-AI-Template.md) - Cari dan pilih templat AI  
  - [2. Pengesahan](workshop/docs/instructions/2-Validate-AI-Template.md) - Keluarkan dan sahkan templat  
  - [3. Penguraian](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Teroka seni bina templat  
  - [4. Konfigurasi](workshop/docs/instructions/4-Configure-AI-Template.md) - Kuasai azure.yaml  
  - [5. Penyesuaian](workshop/docs/instructions/5-Customize-AI-Template.md) - Sesuaikan mengikut senario  
  - [6. Penutupan](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Bersihkan sumber  
  - [7. Ulasan](workshop/docs/instructions/7-Wrap-up.md) - Semak dan langkah seterusnya  
- **🛠️ Makmal AI Bengkel**: [Makmal AI Bengkel](docs/chapter-02-ai-development/ai-workshop-lab.md) - Latihan fokus AI  
- **💡 Mula Cepat**: [Panduan Persediaan Bengkel](workshop/README.md#quick-start) - Konfigurasi persekitaran  

**Sesuai untuk**: Latihan korporat, kursus universiti, pembelajaran kendiri, dan bootcamp pembangun.

---

## 📖 Penyelaman Mendalam: Kebolehan AZD

Selain asas, AZD menyediakan ciri-ciri hebat untuk pengeluaran:

- **Pengeluaran berasaskan templat** - Gunakan templat siap untuk pola aplikasi biasa  
- **Infrastruktur sebagai Kod** - Urus sumber Azure menggunakan Bicep atau Terraform  
- **Aliran kerja bersepadu** - Penyediaan, pengeluaran, dan pemantauan aplikasi lancar  
- **Mesra pembangun** - Dioptimumkan untuk produktiviti dan pengalaman pembangun  

### **AZD + Microsoft Foundry: Sempurna untuk Pengeluaran AI**

**Mengapa AZD untuk Penyelesaian AI?** AZD menangani cabaran utama pembangun AI:

- **Templat Sedia AI** - Templat pra-konfigurasi untuk Model Microsoft Foundry, Perkhidmatan Kognitif, dan beban kerja ML  
- **Pengeluaran AI Selamat** - Pola keselamatan terbina dalam untuk perkhidmatan AI, kunci API, dan titik akhir model  
- **Pola AI Pengeluaran** - Amalan terbaik untuk pengeluaran aplikasi AI yang skala dan kos efektif  
- **Aliran Kerja AI Menyeluruh** - Dari pembangunan model ke pengeluaran dengan pemantauan betul  
- **Pengoptimuman Kos** - Strategi alokasi sumber dan penskalaan pintar untuk beban kerja AI  
- **Integrasi Microsoft Foundry** - Sambungan lancar ke katalog model dan titik akhir Microsoft Foundry  

---

## 🎯 Perpustakaan Templat & Contoh

### Sorotan: Templat Microsoft Foundry  
**Mula di sini jika anda mengeluarkan aplikasi AI!**

> **Nota:** Templat ini menunjukkan pelbagai pola AI. Ada yang contoh Azure luaran, ada pula pelaksanaan tempatan.

| Templat | Bab | Kerumitan | Perkhidmatan | Jenis |
|----------|---------|------------|----------|------|
| [**Mulakan dengan AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bab 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Luaran |
| [**Mulakan dengan agen AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Bab 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Luaran |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bab 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Luaran |
| [**Mula cepat Apl Chat OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bab 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Luaran |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bab 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Luaran |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Bab 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Luaran |
| [**Penyelesaian Multi-Ejen Runcit**](examples/retail-scenario.md) | Bab 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Tempatan** |

### Sorotan: Senario Pembelajaran Lengkap  
**Templat aplikasi sedia pengeluaran dipetakan ke bab pembelajaran**

| Templat | Bab Pembelajaran | Kerumitan | Pembelajaran Utama |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bab 2 | ⭐ | Pola pengeluaran AI asas |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bab 2 | ⭐⭐ | Pelaksanaan RAG dengan Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Bab 4 | ⭐⭐ | Integrasi Kecerdasan Dokumen |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bab 5 | ⭐⭐⭐ | Rangka kerja agen dan panggilan fungsi |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Bab 8 | ⭐⭐⭐ | Orkestrasi AI perusahaan |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Bab 5 | ⭐⭐⭐⭐ | Seni bina multi-ejen dengan agen Pelanggan dan Inventori |

### Pembelajaran Mengikut Jenis Contoh

> **📌 Contoh Tempatan vs Luaran:**  
> **Contoh Tempatan** (dalam repo ini) = Sedia guna segera  
> **Contoh Luaran** (Azure Samples) = Klon dari repositori pautan

#### Contoh Tempatan (Sedia guna)  
- [**Penyelesaian Multi-Ejen Runcit**](examples/retail-scenario.md) - Pelaksanaan lengkap sedia pengeluaran dengan templat ARM  
  - Seni bina multi-ejen (agen Pelanggan + Inventori)  
  - Pemantauan dan penilaian menyeluruh  
  - Pengeluaran satu klik menggunakan templat ARM  

#### Contoh Tempatan - Aplikasi Kontena (Bab 2-5)  
**Contoh pengeluaran kontena komprehensif dalam repositori ini:**  
- [**Contoh Aplikasi Kontena**](examples/container-app/README.md) - Panduan lengkap ke pengeluaran berasaskan kontena  
  - [API Flask Mudah](../../examples/container-app/simple-flask-api) - API REST asas dengan skala-ke-nol  
  - [Seni Bina Mikroservis](../../examples/container-app/microservices) - Pengeluaran perkhidmatan pelbagai sedia produksi  
  - Pola pengeluaran Mula Cepat, Pengeluaran, dan Lanjutan  
  - Panduan pemantauan, keselamatan, dan pengoptimuman kos  

#### Contoh Luaran - Aplikasi Mudah (Bab 1-2)  
**Klon repositori Azure Samples berikut untuk mula:**  
- [Apl Web Mudah - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pola pengeluaran asas  
- [Laman Statik - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Pengeluaran kandungan statik  
- [Aplikasi Kontena - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Pengeluaran API REST  

#### Contoh Luaran - Integrasi Pangkalan Data (Bab 3-4)  
- [Aplikasi Pangkalan Data - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Corak sambungan pangkalan data
- [Fungsi + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Aliran kerja data tanpa pelayan

#### Contoh Luaran - Corak Lanjutan (Bab 4-8)
- [Mikroservis Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Seni bina perkhidmatan berganda
- [Tugas Aplikasi Bekas](https://github.com/Azure-Samples/container-apps-jobs) - Pemprosesan latar belakang  
- [Saluran ML Perusahaan](https://github.com/Azure-Samples/mlops-v2) - Corak ML sedia produksi

### Koleksi Templat Luaran
- [**Galeri Templat Rasmi AZD**](https://azure.github.io/awesome-azd/) - Koleksi templat rasmi dan komuniti yang terpilih
- [**Templat Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasi templat Microsoft Learn
- [**Direktori Contoh**](examples/README.md) - Contoh pembelajaran tempatan dengan penjelasan terperinci

---

## 📚 Sumber Pembelajaran & Rujukan

### Rujukan Pantas
- [**Lembaran Panduan Perintah**](resources/cheat-sheet.md) - Perintah azd penting disusun mengikut bab
- [**Glosari**](resources/glossary.md) - Terminologi Azure dan azd  
- [**Soalan Lazim**](resources/faq.md) - Soalan umum disusun mengikut bab pembelajaran
- [**Panduan Kajian**](resources/study-guide.md) - Latihan amali menyeluruh

### Bengkel Praktikal
- [**Makmal Bengkel AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Jadikan penyelesaian AI anda boleh diterapkan dengan AZD (2-3 jam)
- [**Bengkel Interaktif**](workshop/README.md) - Latihan berpandu 8 modul dengan MkDocs dan GitHub Codespaces
  - Mengikuti: Pengenalan → Pemilihan → Pengesahan → Dekonstruksi → Konfigurasi → Penyesuaian → Pembongkaran → Penutup

### Sumber Pembelajaran Luaran
- Dokumentasi Azure Developer CLI
- Pusat Seni Bina Azure
- Kalkulator Harga Azure
- Status Azure

### Kemahiran Ejen AI untuk Penyunting Anda
- [**Kemahiran Microsoft Azure di skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 kemahiran ejen terbuka untuk Azure AI, Foundry, penyebaran, diagnostik, pengoptimuman kos, dan banyak lagi. Pasang dalam GitHub Copilot, Cursor, Claude Code, atau mana-mana ejen yang disokong:
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
<summary><strong>❌ "No subscription found" atau "Subscription not set"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" atau "Quota exceeded"</strong></summary>

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
<summary><strong>❌ "Authentication failed" atau "Token expired"</strong></summary>

```bash
# Sahkan semula untuk AZD
azd auth logout
azd auth login

# Pilihan: segarkan juga Azure CLI jika anda menjalankan arahan az
az logout
az login

# Sahkan pengesahan
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" atau konflik penamaan</strong></summary>

```bash
# AZD menjana nama unik, tetapi jika berlaku konflik:
azd down --force --purge

# Kemudian cuba semula dengan persekitaran baru
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Penyebaran templat mengambil masa terlalu lama</strong></summary>

**Masa menunggu biasa:**
- Aplikasi web mudah: 5-10 minit
- Aplikasi dengan pangkalan data: 10-15 minit
- Aplikasi AI: 15-25 minit (penyediaan OpenAI lambat)

```bash
# Semak kemajuan
azd show

# Jika tersekat >30 minit, semak Portal Azure:
azd monitor --overview
# Cari penempatan yang gagal
```
</details>

<details>
<summary><strong>❌ "Permission denied" atau "Forbidden"</strong></summary>

```bash
# Semak peranan Azure anda
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Anda memerlukan sekurang-kurangnya peranan "Contributor"
# Minta pentadbir Azure anda untuk memberi:
# - Contributor (untuk sumber)
# - User Access Administrator (untuk penugasan peranan)
```
</details>

<details>
<summary><strong>❌ Tidak dapat mencari URL aplikasi yang diterapkan</strong></summary>

```bash
# Tunjukkan semua titik akhir perkhidmatan
azd show

# Atau buka Portal Azure
azd monitor

# Semak perkhidmatan tertentu
azd env get-values
# Cari pembolehubah *_URL
```
</details>

### 📚 Sumber Penyelesaian Masalah Penuh

- **Panduan Isu Umum:** [Penyelesaian Terperinci](docs/chapter-07-troubleshooting/common-issues.md)
- **Isu Khusus AI:** [Penyelesaian Masalah AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Panduan Penyahpepijatan:** [Penyahpepijatan Langkah demi Langkah](docs/chapter-07-troubleshooting/debugging.md)
- **Dapatkan Bantuan:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Penyiapan Kursus & Pensijilan

### Penjejakan Kemajuan
Jejaki kemajuan pembelajaran anda melalui setiap bab:

- [ ] **Bab 1**: Asas & Mula Pantas ✅
- [ ] **Bab 2**: Pembangunan AI-Pertama ✅  
- [ ] **Bab 3**: Konfigurasi & Pengesahan ✅
- [ ] **Bab 4**: Infrastruktur sebagai Kod & Penyebaran ✅
- [ ] **Bab 5**: Penyelesaian AI Ejen Berganda ✅
- [ ] **Bab 6**: Pengesahan & Perancangan Pra-Penyebaran ✅
- [ ] **Bab 7**: Penyelesaian Masalah & Penyahpepijatan ✅
- [ ] **Bab 8**: Corak Produksi & Perusahaan ✅

### Pengesahan Pembelajaran
Selepas menyiapkan setiap bab, sahkan pengetahuan anda dengan:
1. **Latihan Praktikal**: Selesaikan penyebaran praktikal bab tersebut
2. **Semakan Pengetahuan**: Tinjau bahagian FAQ untuk bab anda
3. **Perbincangan Komuniti**: Kongsi pengalaman anda di Azure Discord
4. **Bab Seterusnya**: Beralih ke tahap kerumitan berikutnya

### Faedah Penyiapan Kursus
Apabila menyiapkan semua bab, anda akan mempunyai:
- **Pengalaman Produksi**: Menerapkan aplikasi AI sebenar ke Azure
- **Kemahiran Profesional**: Keupayaan penyebaran sedia perusahaan  
- **Pengiktirafan Komuniti**: Ahli aktif komuniti pemaju Azure
- **Kemajuan Kerjaya**: Kepakaran AZD dan penyebaran AI yang diperlukan

---

## 🤝 Komuniti & Sokongan

### Dapatkan Bantuan & Sokongan
- **Isu Teknikal**: [Laporkan pepijat dan minta ciri](https://github.com/microsoft/azd-for-beginners/issues)
- **Soalan Pembelajaran**: [Komuniti Discord Microsoft Azure](https://discord.gg/microsoft-azure) dan [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Bantuan Khusus AI**: Sertai [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasi**: [Dokumentasi rasmi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Wawasan Komuniti dari Microsoft Foundry Discord

**Hasil Tinjauan Terkini dari Saluran #Azure:**
- **45%** pemaju mahu menggunakan AZD untuk beban kerja AI
- **Cabaran utama**: Penyebaran perkhidmatan berganda, pengurusan kelayakan, kesiapsiagaan produksi  
- **Permintaan tertinggi**: Templat khusus AI, panduan penyelesaian masalah, amalan terbaik

**Sertai komuniti kami untuk:**
- Kongsi pengalaman AZD + AI anda dan dapatkan bantuan
- Akses pratonton awal templat baru AI
- Menyumbang kepada amalan terbaik penyebaran AI
- Mempengaruhi pembangunan ciri AI + AZD masa depan

### Menyumbang kepada Kursus
Kami mengalu-alukan sumbangan! Sila baca [Panduan Menyumbang](CONTRIBUTING.md) kami untuk maklumat mengenai:
- **Penambahbaikan Kandungan**: Memperbaiki bab dan contoh sedia ada
- **Contoh Baru**: Tambah senario dan templat dunia sebenar  
- **Terjemahan**: Bantu mengekalkan sokongan pelbagai bahasa
- **Laporan Pepijat**: Tingkatkan ketepatan dan kejelasan
- **Standard Komuniti**: Ikuti garis panduan komuniti inklusif kami

---

## 📄 Maklumat Kursus

### Lesen
Projek ini dilesenkan di bawah Lesen MIT - lihat fail [LICENSE](../../LICENSE) untuk butiran.

### Sumber Pembelajaran Berkaitan Microsoft

Pasukan kami menghasilkan kursus pembelajaran menyeluruh lain:

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
[![Copilot untuk Pengaturcaraan Berpasangan AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot untuk C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Pengembaraan Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigasi Kursus

**🚀 Sedia untuk Mula Belajar?**

**Pemula**: Mulakan dengan [Bab 1: Asas & Mula Pantas](#-chapter-1-foundation--quick-start)  
**Pembangun AI**: Teruskan ke [Bab 2: Pembangunan AI-Utama](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Pembangun Berpengalaman**: Mulakan dengan [Bab 3: Konfigurasi & Pengesahan](#️-chapter-3-configuration--authentication)

**Langkah Seterusnya**: [Mulakan Bab 1 - Asas AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->