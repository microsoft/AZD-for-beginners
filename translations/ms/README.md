# AZD Untuk Pemula: Perjalanan Pembelajaran Berstruktur

![AZD-for-beginners](../../translated_images/ms/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Terjemahan Automatik (Sentiasa Dikemaskini)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arab](../ar/README.md) | [Benggali](../bn/README.md) | [Bulgaria](../bg/README.md) | [Burma (Myanmar)](../my/README.md) | [Cina (Ringkas)](../zh-CN/README.md) | [Cina (Tradisional, Hong Kong)](../zh-HK/README.md) | [Cina (Tradisional, Macau)](../zh-MO/README.md) | [Cina (Tradisional, Taiwan)](../zh-TW/README.md) | [Croatia](../hr/README.md) | [Czech](../cs/README.md) | [Denmark](../da/README.md) | [Belanda](../nl/README.md) | [Estonia](../et/README.md) | [Finland](../fi/README.md) | [Perancis](../fr/README.md) | [Jerman](../de/README.md) | [Greek](../el/README.md) | [Ibrani](../he/README.md) | [Hindi](../hi/README.md) | [Hungary](../hu/README.md) | [Indonesia](../id/README.md) | [Itali](../it/README.md) | [Jepun](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korea](../ko/README.md) | [Lithuania](../lt/README.md) | [Melayu](./README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Pidgin Nigeria](../pcm/README.md) | [Norway](../no/README.md) | [Parsi (Farsi)](../fa/README.md) | [Poland](../pl/README.md) | [Portugis (Brazil)](../pt-BR/README.md) | [Portugis (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romania](../ro/README.md) | [Rusia](../ru/README.md) | [Serbia (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenia](../sl/README.md) | [Sepanyol](../es/README.md) | [Swahili](../sw/README.md) | [Sweden](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turki](../tr/README.md) | [Ukraine](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnam](../vi/README.md)

> **Lebih Suka Klon Tempatan?**
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
> Ini memberikan semua yang anda perlukan untuk menyelesaikan kursus dengan muat turun yang jauh lebih cepat.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Apa Yang Baru Dalam azd Hari Ini

> 📌 Kursus ini disahkan dengan **`azd 1.25.6`** (Jun 2026). Jalankan `azd version` untuk memeriksa binaan anda, dan `azd upgrade` untuk mendapatkan yang terkini.

Azure Developer CLI telah berkembang melebihi aplikasi web tradisional dan API. Hari ini, azd adalah alat tunggal untuk menyebarkan **mana-mana** aplikasi ke Azure—termasuk aplikasi yang dipacu AI dan ejen pintar.

Ini bermakna untuk anda:

- **Ejen AI kini adalah beban kerja azd kelas pertama.** Anda boleh memulakan, menyebarkan, dan mengurus projek ejen AI menggunakan aliran kerja yang sama `azd init` → `azd up` yang anda sudah tahu.
- **Kitaran hayat ejen penuh dari CLI.** Sambungan `azure.ai.agents` kini merangkumi seluruh perjalanan—`azd ai agent init` untuk membuat struktur, `azd ai agent invoke` untuk ujian (dengan output masa tindak balas), `azd ai agent eval generate` dan `azd ai agent optimize` untuk mengukur dan memperbaiki kualiti, serta `azd ai agent delete` untuk bersihkan.
- **Lebih banyak blok binaan AI.** Sambungan pratonton baru—`azure.ai.skills` dan `azure.ai.connections`—membolehkan anda mengurus kemahiran ejen boleh guna semula dan sambungan Foundry terus dengan azd.
- **Integrasi Microsoft Foundry** membawa penempatan model, pengehosan ejen, dan konfigurasi perkhidmatan AI terus ke dalam ekosistem templat azd.
- **Asas harian yang lebih lancar.** Keluaran terkini menjadikan `azd init` idempotent (selamat dijalankan semula), menjadikan `azd auth login` membersihkan token lama secara automatik, dan menambah arahan mesra `azd tool` semasa kali pertama digunakan.
- **Aliran kerja teras tidak berubah.** Sama ada anda menyebarkan aplikasi todo, perkhidmatan mikro, atau penyelesaian AI banyak ejen, arahan adalah sama.

> **Nota untuk pengguna Aspire:** Microsoft kini merujuk produk ini sebagai **Aspire** sahaja (sebelumnya ".NET Aspire"). Sokongan azd untuk Aspire tidak berubah—hanya nama sahaja yang dikemas kini.

Jika anda pernah menggunakan azd sebelum ini, sokongan AI adalah lanjutan semulajadi—bukan alat berasingan atau laluan lanjutan. Jika anda bermula baru, anda akan belajar satu aliran kerja yang berfungsi untuk semua.

---

## 🚀 Apa Itu Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** adalah alat baris perintah mesra pembangun yang memudahkan penyebaran aplikasi ke Azure. Daripada membuat dan menyambungkan berpuluh-puluh sumber Azure secara manual, anda boleh menyebarkan seluruh aplikasi dengan satu arahan sahaja.

### Keajaiban `azd up`

```bash
# Perintah tunggal ini melakukan segala-galanya:
# ✅ Mencipta semua sumber Azure
# ✅ Mengkonfigurasi rangkaian dan keselamatan
# ✅ Membina kod aplikasi anda
# ✅ Menyebarkan ke Azure
# ✅ Memberi anda URL yang berfungsi
azd up
```

**Itu sahaja!** Tiada klik di Portal Azure, tiada templat ARM yang rumit untuk dipelajari dahulu, tiada konfigurasi manual—hanya aplikasi berfungsi di Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Apa Bezanya?

Ini adalah soalan yang paling biasa ditanya oleh pemula. Inilah jawapan yang mudah:

| Ciri | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Tujuan** | Mengurus sumber Azure individu | Menyebarkan aplikasi lengkap |
| **Pemikiran** | Fokus infrastruktur | Fokus aplikasi |
| **Contoh** | `az webapp create --name myapp...` | `azd up` |
| **Lengkung Pembelajaran** | Perlu tahu perkhidmatan Azure | Cuma tahu aplikasi anda |
| **Terbaik Untuk** | DevOps, Infrastruktur | Pembangun, Prototip |

### Analogi Mudah

- **Azure CLI** seperti mempunyai semua alat untuk membina rumah - tukul, gergaji, paku. Anda boleh bina apa sahaja, tetapi perlu tahu tentang pembinaan.
- **Azure Developer CLI** seperti mengupah kontraktor - anda terangkan apa yang anda mahu, dan mereka urus pembinaan.

### Bila Guna Masing-Masing

| Senario | Gunakan Ini |
|----------|----------|
| "Saya mahu menyebarkan aplikasi web saya dengan cepat" | `azd up` |
| "Saya perlu buat akaun storan sahaja" | `az storage account create` |
| "Saya membina aplikasi AI penuh" | `azd init --template azure-search-openai-demo` |
| "Saya perlu debug sumber Azure tertentu" | `az resource show` |
| "Saya mahu penyebaran sedia produksi dalam beberapa minit" | `azd up --environment production` |

### Mereka Berfungsi Bersama!

AZD menggunakan Azure CLI di bawah. Anda boleh guna kedua-duanya:
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
| 🔗 [**Galeri Awesome AZD**](https://azure.github.io/awesome-azd/) | Layari lebih 200 templat dengan satu klik penyebaran |
| 🔗 [**Hantar Templat**](https://github.com/Azure/awesome-azd/issues) | Sumbangkan templat anda sendiri kepada komuniti |
| 🔗 [**Repositori GitHub**](https://github.com/Azure/awesome-azd) | Beri bintang dan terokai sumber |

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

Sebelum mula, pastikan mesin anda sudah siap untuk templat yang anda mahu sebarkan:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jika mana-mana pemeriksaan diperlukan gagal, baiki dahulu kemudian teruskan dengan permulaan pantas.

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

### Langkah 2: Lakukan Pengesahan untuk AZD

```bash
# Pilihan jika anda bercadang untuk menggunakan arahan Azure CLI secara langsung dalam kursus ini
az login

# Diperlukan untuk aliran kerja AZD
azd auth login
```

Jika anda tidak pasti yang mana perlu, ikuti aliran persediaan penuh dalam [Pemasangan & Persediaan](docs/chapter-01-foundation/installation.md#authentication-setup).

### Langkah 3: Sebarkan Aplikasi Pertama Anda

```bash
# Inisialisasi dari templat
azd init --template todo-nodejs-mongo

# Terapkan ke Azure (mencipta semuanya!)
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

Kursus ini direka untuk **pembelajaran progresif** - mulakan di mana anda selesa dan berkerja naik:

| Pengalaman Anda | Mula Di Sini |
|-----------------|------------|
| **Baru kepada Azure** | [Bab 1: Asas](#-chapter-1-foundation--quick-start) |
| **Tahu Azure, baru kepada AZD** | [Bab 1: Asas](#-chapter-1-foundation--quick-start) |
| **Mahukan penyebaran aplikasi AI** | [Bab 2: Pembangunan AI-Pertama](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Ingin latihan praktikal** | [🎓 Bengkel Interaktif](workshop/README.md) - makmal berpanduan 3-4 jam |
| **Perlu corak produksi** | [Bab 8: Produksi & Perusahaan](#-chapter-8-production--enterprise-patterns) |

### Persediaan Pantas

1. **Fork Repositori Ini**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon Ia**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Dapatkan Bantuan**: [Komuniti Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Lebih Suka Klon Tempatan?**

> Repositori ini termasuk lebih 50 terjemahan bahasa yang secara signifikan meningkatkan saiz muat turun. Untuk klon tanpa terjemahan, gunakan sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ini memberikan semua yang anda perlukan untuk menyelesaikan kursus dengan muat turun yang jauh lebih cepat.


## Gambaran Keseluruhan Kursus

Kuasi Azure Developer CLI (azd) melalui bab berstruktur yang direka untuk pembelajaran progresif. **Penekanan khas pada penyebaran aplikasi AI dengan integrasi Microsoft Foundry.**
### Mengapa Kursus Ini Penting untuk Pembangun Moden

Berdasarkan pandangan komuniti Microsoft Foundry Discord, **45% pembangun mahu menggunakan AZD untuk beban kerja AI** tetapi menghadapi cabaran dengan:
- Seni bina AI multi-perkhidmatan yang kompleks
- Amalan terbaik penyebaran AI dalam produksi  
- Integrasi dan konfigurasi perkhidmatan Azure AI
- Pengoptimuman kos untuk beban kerja AI
- Penyelesaian masalah isu penyebaran khusus AI

### Objektif Pembelajaran

Dengan melengkapkan kursus berstruktur ini, anda akan:
- **Menguasai Asas AZD**: Konsep teras, pemasangan, dan konfigurasi
- **Menyebarkan Aplikasi AI**: Gunakan AZD dengan perkhidmatan Microsoft Foundry
- **Melaksanakan Infrastruktur sebagai Kod**: Mengurus sumber Azure dengan templat Bicep
- **Menyelesaikan Masalah Penyebaran**: Menyelesaikan isu biasa dan debug masalah
- **Mengoptimumkan untuk Produksi**: Keselamatan, skala, pemantauan, dan pengurusan kos
- **Membina Penyelesaian Berbilang Ejen**: Menyebarkan seni bina AI yang kompleks

## Sebelum Anda Mula: Akaun, Akses, dan Andaian

Sebelum anda memulakan Bab 1, pastikan anda mempunyai perkara berikut. Langkah pemasangan dalam panduan ini mengandaikan asas ini sudah tersedia.

- **Langganan Azure**: Anda boleh menggunakan langganan sedia ada dari kerja atau akaun sendiri, atau cipta [percubaan percuma](https://aka.ms/azurefreetrial) untuk bermula.
- **Kebenaran mencipta sumber Azure**: Untuk kebanyakan latihan, anda harus mempunyai sekurang-kurangnya akses **Kontributor** pada langganan atau kumpulan sumber sasaran. Sesetengah bab juga mengandaikan anda boleh mencipta kumpulan sumber, identiti terurus dan penugasan RBAC.
- [**Akaun GitHub**](https://github.com): Ini berguna untuk menggandakan repositori, menjejak perubahan anda sendiri, dan menggunakan GitHub Codespaces untuk bengkel.
- **Prasyarat runtime templat**: Beberapa templat memerlukan alat tempatan seperti Node.js, Python, Java, atau Docker. Jalankan validator persediaan sebelum bermula untuk menangkap alat yang hilang lebih awal.
- **Familiariti terminal asas**: Anda tidak perlu pakar, tetapi anda harus selesa menjalankan arahan seperti `git clone`, `azd auth login`, dan `azd up`.

> **Bekerja dalam langganan perusahaan?**
> Jika persekitaran Azure anda dikendalikan oleh pentadbir, sahkan lebih awal bahawa anda boleh menyebarkan sumber dalam langganan atau kumpulan sumber yang anda rancang guna. Jika tidak, minta langganan sandaran atau akses Kontributor sebelum anda mula.

> **Baru dengan Azure?**
> Mula dengan percubaan Azure anda sendiri atau langganan bayar-semasa-guna di https://aka.ms/azurefreetrial supaya anda boleh lengkapkan latihan dari mula hingga akhir tanpa menunggu kelulusan peringkat tenant.

## 🗺️ Peta Kursus: Navigasi Pantas Mengikut Bab

Setiap bab mempunyai README khusus dengan objektif pembelajaran, permulaan cepat, dan latihan:

| Bab | Topik | Pelajaran | Tempoh | Kerumitan |
|---------|-------|---------|----------|------------|
| **[Bab 1: Asas](docs/chapter-01-foundation/README.md)** | Permulaan | [Asas AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Pemasangan](docs/chapter-01-foundation/installation.md) &#124; [Projek Pertama](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Bab 2: Pembangunan AI](docs/chapter-02-ai-development/README.md)** | Aplikasi AI-Pertama | [Integrasi Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Ejen AI](docs/chapter-02-ai-development/agents.md) &#124; [Penyebaran Model](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Bengkel](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 jam | ⭐⭐ |
| **[Bab 3: Konfigurasi](docs/chapter-03-configuration/README.md)** | Pengesahan & Keselamatan | [Konfigurasi](docs/chapter-03-configuration/configuration.md) &#124; [Pengesahan & Keselamatan](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Bab 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Penyebaran | [Panduan Penyebaran](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Penyediaan](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 jam | ⭐⭐⭐ |
| **[Bab 5: Berbilang Ejen](docs/chapter-05-multi-agent/README.md)** | Penyelesaian Ejen AI | [Senario Runcit](examples/retail-scenario.md) &#124; [Corak Penyelarasan](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 jam | ⭐⭐⭐⭐ |
| **[Bab 6: Pra-Penyebaran](docs/chapter-06-pre-deployment/README.md)** | Perancangan & Pengesahan | [Pemeriksaan Pra-Terbang](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Perancangan Kapasiti](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Pemilihan SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 jam | ⭐⭐ |
| **[Bab 7: Penyelesaian Masalah](docs/chapter-07-troubleshooting/README.md)** | Debug & Pembetulan | [Isu Biasa](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [Isu AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 jam | ⭐⭐ |
| **[Bab 8: Produksi](docs/chapter-08-production/README.md)** | Corak Perusahaan | [Amalan Produksi](docs/chapter-08-production/production-ai-practices.md) | 2-3 jam | ⭐⭐⭐⭐ |
| **[🎓 Bengkel](workshop/README.md)** | Makmal Praktikal | [Pengenalan](workshop/docs/instructions/0-Introduction.md) &#124; [Pemilihan](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Pengesahan](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Pembongkaran](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurasi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Pengubahsuaian](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Pembongkaran Infrastruktur](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Penutup](workshop/docs/instructions/7-Wrap-up.md) | 3-4 jam | ⭐⭐ |

**Jumlah Tempoh Kursus:** ~10-14 jam | **Perkembangan Kemahiran:** Pemula → Sedia Produksi

---

## 📚 Bab Pembelajaran

*Pilih laluan pembelajaran berdasarkan tahap pengalaman dan matlamat*

### 🚀 Bab 1: Asas & Permulaan Pantas
**Prasyarat**: Langganan Azure, pengetahuan asas baris arahan  
**Tempoh**: 30-45 minit  
**Kerumitan**: ⭐

#### Apa yang Anda Akan Pelajari
- Memahami asas Azure Developer CLI
- Memasang AZD di platform anda
- Penyebaran pertama yang berjaya

#### Sumber Pembelajaran
- **🎯 Mula Di Sini**: [Apa itu Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teori**: [Asas AZD](docs/chapter-01-foundation/azd-basics.md) - Konsep dan istilah teras
- **⚙️ Persediaan**: [Pemasangan & Persediaan](docs/chapter-01-foundation/installation.md) - Panduan khusus platform
- **🛠️ Praktikal**: [Projek Pertama Anda](docs/chapter-01-foundation/first-project.md) - Tutorial langkah demi langkah
- **📋 Rujukan Pantas**: [Lembaran Perintah](resources/cheat-sheet.md)

#### Latihan Praktikal
```bash
# Semakan pemasangan pantas
azd version

# Lancarkan aplikasi pertama anda
azd init --template todo-nodejs-mongo
azd up
```

**💡 Hasil Bab**: Berjaya menyebarkan aplikasi web mudah ke Azure menggunakan AZD

**✅ Pengesahan Kejayaan:**
```bash
# Selepas menyiapkan Bab 1, anda sepatutnya boleh:
azd version              # Menunjukkan versi yang dipasang
azd init --template todo-nodejs-mongo  # Memulakan projek
azd up                  # Melaksanakan ke Azure
azd show                # Memaparkan URL aplikasi yang berjalan
# Aplikasi dibuka dalam pelayar dan berfungsi
azd down --force --purge  # Membersihkan sumber
```

**📊 Pelaburan Masa:** 30-45 minit  
**📈 Tahap Kemahiran Selepas:** Boleh menyebarkan aplikasi asas secara berdikari

---

### 🤖 Bab 2: Pembangunan AI-Pertama (Disyorkan untuk Pembangun AI)
**Prasyarat**: Bab 1 selesai  
**Tempoh**: 1-2 jam  
**Kerumitan**: ⭐⭐

#### Apa yang Anda Akan Pelajari
- Integrasi Microsoft Foundry dengan AZD
- Menyebarkan aplikasi berkuasa AI
- Memahami konfigurasi perkhidmatan AI

#### Sumber Pembelajaran
- **🎯 Mula Di Sini**: [Integrasi Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Ejen AI**: [Panduan Ejen AI](docs/chapter-02-ai-development/agents.md) - Menyebarkan ejen pintar dengan AZD
- **📖 Corak**: [Penyebaran Model AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Menyebar dan mengurus model AI
- **🛠️ Bengkel**: [Makmal Bengkel AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Membuat penyelesaian AI anda sedia AZD
- **🎥 Panduan Interaktif**: [Bahan Bengkel](workshop/README.md) - Pembelajaran berasaskan pelayar dengan MkDocs * Persekitaran DevContainer
- **📋 Templat**: [Templat Microsoft Foundry](#sumber-bengkel)
- **📝 Contoh**: [Contoh Penyebaran AZD](examples/README.md)

#### Latihan Praktikal
```bash
# Lancarkan aplikasi AI pertama anda
azd init --template azure-search-openai-demo
azd up

# Cuba templat AI tambahan
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Hasil Bab**: Menyebar dan mengkonfigurasi aplikasi chat berkuasa AI dengan keupayaan RAG

**✅ Pengesahan Kejayaan:**
```bash
# Selepas Bab 2, anda sepatutnya boleh:
azd init --template azure-search-openai-demo
azd up
# Uji antara muka sembang AI
# Tanyakan soalan dan dapatkan respons dikuasakan AI dengan sumber
# Sahkan integrasi carian berfungsi
azd monitor  # Periksa Application Insights menunjukkan telemetri
azd down --force --purge
```

**📊 Pelaburan Masa:** 1-2 jam  
**📈 Tahap Kemahiran Selepas:** Boleh menyebar dan mengkonfigurasi aplikasi AI siap produksi  
**💰 Kesedaran Kos:** Faham kos dev $80-150/bulan, kos produksi $300-3500/bulan

#### 💰 Pertimbangan Kos untuk Penyebaran AI

**Persekitaran Pembangunan (Anggaran $80-150/bulan):**
- Model Microsoft Foundry (Bayar-semasa-guna): $0-50/bulan (berdasarkan penggunaan token)
- Carian AI (peringkat asas): $75/bulan
- Aplikasi Kontena (Penggunaan): $0-20/bulan
- Penyimpanan (Standard): $1-5/bulan

**Persekitaran Produksi (Anggaran $300-3,500+/bulan):**
- Model Microsoft Foundry (PTU untuk prestasi konsisten): $3,000+/bulan ATAU Bayar-semasa-guna untuk volum tinggi
- Carian AI (peringkat standard): $250/bulan
- Aplikasi Kontena (Dedicated): $50-100/bulan
- Application Insights: $5-50/bulan
- Penyimpanan (Premium): $10-50/bulan

**💡 Petua Pengoptimuman Kos:**
- Gunakan **Tahap Percuma** Model Microsoft Foundry untuk pembelajaran (Azure OpenAI 50,000 token/bulan termasuk)
- Jalankan `azd down` untuk membebaskan sumber apabila tidak aktif membangunkan
- Mulakan dengan bil penggunaan, naik taraf ke PTU hanya untuk produksi
- Gunakan `azd provision --preview` untuk anggar kos sebelum penyebaran
- Aktifkan auto-scaling: bayar hanya untuk penggunaan sebenar

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

#### Apa yang Anda Akan Pelajari
- Konfigurasi dan pengurusan persekitaran
- Amalan terbaik pengesahan dan keselamatan
- Penamaan dan organisasi sumber

#### Sumber Pembelajaran
- **📖 Konfigurasi**: [Panduan Konfigurasi](docs/chapter-03-configuration/configuration.md) - Persediaan persekitaran
- **🔐 Keselamatan**: [Corak pengesahan & identiti terurus](docs/chapter-03-configuration/authsecurity.md) - Corak pengesahan
- **📝 Contoh**: [Contoh Aplikasi Pangkalan Data](examples/database-app/README.md) - Contoh Pangkalan Data AZD

#### Latihan Praktikal
- Konfigurasi pelbagai persekitaran (dev, staging, prod)
- Sediakan pengesahan identiti terurus
- Laksanakan konfigurasi khusus persekitaran

**💡 Hasil Bab**: Mengurus pelbagai persekitaran dengan pengesahan dan keselamatan yang betul

---

### 🏗️ Bab 4: Infrastruktur sebagai Kod & Penyebaran
**Prasyarat**: Bab 1-3 selesai  
**Tempoh**: 1-1.5 jam  
**Kerumitan**: ⭐⭐⭐

#### Apa yang Anda Akan Pelajari
- Corak penyebaran lanjutan
- Infrastruktur sebagai Kod dengan Bicep
- Strategi penyediaan sumber

#### Sumber Pembelajaran
- **📖 Penyebaran**: [Panduan Penyebaran](docs/chapter-04-infrastructure/deployment-guide.md) - Aliran kerja lengkap
- **🏗️ Penyediaan**: [Penyediaan Sumber](docs/chapter-04-infrastructure/provisioning.md) - Pengurusan sumber Azure
- **📝 Contoh**: [Contoh Aplikasi Kontena](../../examples/container-app) - Penyebaran berasaskan kontena

#### Latihan Praktikal
- Cipta templat Bicep tersuai
- Menyebarkan aplikasi multi-perkhidmatan
- Melaksanakan strategi penyebaran biru-hijau

**💡 Hasil Bab**: Menyebarkan aplikasi multi-perkhidmatan kompleks menggunakan templat infrastruktur tersuai

---
### 🎯 Bab 5: Penyelesaian AI Berbilang Ejen (Lanjutan)
**Prasyarat**: Bab 1-2 selesai  
**Tempoh**: 2-3 jam  
**Kerumitan**: ⭐⭐⭐⭐

#### Apa Yang Akan Anda Pelajari
- Corak seni bina berbilang ejen
- Orkestrasi dan koordinasi ejen
- Deploy AI yang sedia untuk produksi

#### Sumber Pembelajaran
- **🤖 Projek Terpilih**: [Penyelesaian Berbilang Ejen Runcit](examples/retail-scenario.md) - Pelaksanaan lengkap
- **🛠️ Templat ARM**: [Pakej Templat ARM](../../examples/retail-multiagent-arm-template) - Deploy satu klik
- **📖 Seni Bina**: [Corak koordinasi berbilang ejen](docs/chapter-06-pre-deployment/coordination-patterns.md) - Corak

#### Latihan Praktikal
```bash
# Lancarkan penyelesaian agen pelbagai runcit lengkap
cd examples/retail-multiagent-arm-template
./deploy.sh

# Terokai konfigurasi agen
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Hasil Bab**: Deploy dan urus penyelesaian AI berbilang ejen yang sedia untuk produksi dengan ejen Pelanggan dan Inventori

---

### 🔍 Bab 6: Pengesahan & Perancangan Pra-Penerapan
**Prasyarat**: Bab 4 selesai  
**Tempoh**: 1 jam  
**Kerumitan**: ⭐⭐

#### Apa Yang Akan Anda Pelajari
- Perancangan kapasiti dan pengesahan sumber
- Strategi pemilihan SKU
- Semakan pra-penerapan dan automasi

#### Sumber Pembelajaran
- **📊 Perancangan**: [Perancangan Kapasiti](docs/chapter-06-pre-deployment/capacity-planning.md) - Pengesahan sumber
- **💰 Pemilihan**: [Pemilihan SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Pilihan kos efektif
- **✅ Pengesahan**: [Semakan Pra-Penerbangan](docs/chapter-06-pre-deployment/preflight-checks.md) - Skrip automatik

#### Latihan Praktikal
- Jalankan skrip pengesahan kapasiti
- Optimumkan pemilihan SKU untuk kos
- Laksanakan semakan pra-penerapan automatik

**💡 Hasil Bab**: Sahkan dan optimakan penerapan sebelum pelaksanaan

---

### 🚨 Bab 7: Penyelesaian Masalah & Pengesanan Ralat
**Prasyarat**: Mana-mana bab penerapan selesai  
**Tempoh**: 1-1.5 jam  
**Kerumitan**: ⭐⭐

#### Apa Yang Akan Anda Pelajari
- Pendekatan sistematik pengesanan ralat
- Isu biasa dan penyelesaian
- Penyelesaian masalah khusus AI

#### Sumber Pembelajaran
- **🔧 Isu Biasa**: [Isu Biasa](docs/chapter-07-troubleshooting/common-issues.md) - Soalan Lazim dan penyelesaian
- **🕵️ Panduan Pengesanan Ralat**: [Panduan Pengesanan Ralat](docs/chapter-07-troubleshooting/debugging.md) - Strategi langkah demi langkah
- **🤖 Isu AI**: [Penyelesaian Masalah Khusus AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Masalah perkhidmatan AI

#### Latihan Praktikal
- Diagnosis kegagalan penerapan
- Selesaikan isu pengesahan
- Jejaki ralat sambungan perkhidmatan AI

**💡 Hasil Bab**: Diagnosis dan selesaikan isu penerapan biasa secara berdikari

---

### 🏢 Bab 8: Corak Produksi & Perusahaan
**Prasyarat**: Bab 1-4 selesai  
**Tempoh**: 2-3 jam  
**Kerumitan**: ⭐⭐⭐⭐

#### Apa Yang Akan Anda Pelajari
- Strategi penerapan produksi
- Corak keselamatan perusahaan
- Pemantauan dan pengoptimuman kos

#### Sumber Pembelajaran
- **🏭 Produksi**: [Amalan Terbaik AI Produksi](docs/chapter-08-production/production-ai-practices.md) - Corak perusahaan
- **📝 Contoh**: [Contoh Mikroservis](../../examples/microservices) - Seni bina kompleks
- **📊 Pemantauan**: [Integrasi Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Pemantauan

#### Latihan Praktikal
- Laksanakan corak keselamatan perusahaan
- Sediakan pemantauan menyeluruh
- Deploy ke produksi dengan tadbir urus yang betul

**💡 Hasil Bab**: Deploy aplikasi sedia perusahaan dengan kebolehan produksi penuh

---

## 🎓 Gambaran Keseluruhan Bengkel: Pengalaman Pembelajaran Hands-On

> **⚠️ STATUS BENGKEL: Pembangunan Aktif**  
> Bahan bengkel sedang dibangunkan dan diperhalusi. Modul teras berfungsi, tetapi beberapa bahagian lanjutan belum lengkap. Kami sedang aktif menyelesaikan semua kandungan. [Jejak kemajuan →](workshop/README.md)

### Bahan Bengkel Interaktif
**Pengalaman pembelajaran hands-on menyeluruh dengan alat berasaskan pelayar dan latihan berpandu**

Bahan bengkel kami menyediakan pengalaman pembelajaran interaktif yang berstruktur sebagai pelengkap kurikulum berasaskan bab di atas. Bengkel direka untuk pembelajaran kendiri dan sesi bimbingan pengajar.

#### 🛠️ Ciri-ciri Bengkel
- **Antara Muka Berasaskan Pelayar**: Bengkel lengkap dikuasakan MkDocs dengan ciri carian, salin, dan tema
- **Integrasi GitHub Codespaces**: Satu klik untuk sediakan persekitaran pembangunan
- **Jalan Pembelajaran Berstruktur**: 8 modul latihan berpandu (3-4 jam keseluruhan)
- **Metodologi Progresif**: Pengenalan → Pemilihan → Pengesahan → Pemecahan → Konfigurasi → Penyesuaian → Pembongkaran → Penutup
- **Persekitaran DevContainer Interaktif**: Alat dan kebergantungan telah dikonfigurasikan awal

#### 📚 Struktur Modul Bengkel
Bengkel mengikuti **metodologi progresif 8 modul** yang membawa anda dari penemuan ke kemahiran penerapan:

| Modul | Topik | Apa Yang Anda Akan Lakukan | Tempoh |
|--------|-------|----------------------------|--------|
| **0. Pengenalan** | Gambaran Bengkel | Fahami objektif pembelajaran, prasyarat, dan struktur bengkel | 15 min |
| **1. Pemilihan** | Penemuan Templat | Terokai templat AZD dan pilih templat AI yang sesuai untuk senario anda | 20 min |
| **2. Pengesahan** | Deploy & Sahkan | Deploy templat dengan `azd up` dan sahkan infrastruktur berfungsi | 30 min |
| **3. Pemecahan** | Fahami Struktur | Gunakan GitHub Copilot untuk terokai seni bina templat, fail Bicep, dan pengurusan kod | 30 min |
| **4. Konfigurasi** | Mendalami azure.yaml | Kuasai konfigurasi `azure.yaml`, cangkuk kitaran hayat, dan pembolehubah persekitaran | 30 min |
| **5. Penyesuaian** | Buat Sendiri | Aktifkan Pencarian AI, penjejakan, penilaian, dan sesuaikan untuk senario anda | 45 min |
| **6. Pembongkaran** | Bersihkan | Nyahaktifkan sumber dengan selamat menggunakan `azd down --purge` | 15 min |
| **7. Penutup** | Langkah Seterusnya | Tinjau pencapaian, konsep utama, dan teruskan perjalanan pembelajaran anda | 15 min |

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
Dengan menamatkan bengkel, peserta akan:
- **Deploy Aplikasi AI Produksi**: Gunakan AZD dengan perkhidmatan Microsoft Foundry
- **Kuasa Seni Bina Berbilang Ejen**: Laksanakan penyelesaian AI yang berkoordinasi
- **Laksanakan Amalan Terbaik Keselamatan**: Konfigurasi pengesahan dan kawalan akses
- **Optimumkan Skala**: Reka penerapan yang kos efektif dan berprestasi tinggi
- **Selesaikan Masalah Deploy**: Atasi isu biasa secara berdikari

#### 📖 Sumber Bengkel
- **🎥 Panduan Interaktif**: [Bahan Bengkel](workshop/README.md) - Persekitaran pembelajaran berasaskan pelayar
- **📋 Arahan Modul demi Modul**:
  - [0. Pengenalan](workshop/docs/instructions/0-Introduction.md) - Gambaran dan objektif bengkel
  - [1. Pemilihan](workshop/docs/instructions/1-Select-AI-Template.md) - Cari dan pilih templat AI
  - [2. Pengesahan](workshop/docs/instructions/2-Validate-AI-Template.md) - Deploy dan sahkan templat
  - [3. Pemecahan](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Terokai seni bina templat
  - [4. Konfigurasi](workshop/docs/instructions/4-Configure-AI-Template.md) - Kuasai azure.yaml
  - [5. Penyesuaian](workshop/docs/instructions/5-Customize-AI-Template.md) - Sesuaikan untuk senario anda
  - [6. Pembongkaran](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Bersihkan sumber
  - [7. Penutup](workshop/docs/instructions/7-Wrap-up.md) - Semak dan langkah seterusnya
- **🛠️ Makmal Bengkel AI**: [Makmal Bengkel AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Latihan khusus AI
- **💡 Mula Cepat**: [Panduan Persediaan Bengkel](workshop/README.md#quick-start) - Konfigurasi persekitaran

**Sesuai untuk**: Latihan korporat, kursus universiti, pembelajaran kendiri, dan bootcamp pembangun.

---

## 📖 Mendalami: Keupayaan AZD

Selain asas, AZD menyediakan ciri berkuasa untuk penerapan produksi:

- **Deploy berasaskan templat** - Gunakan templat terbina untuk corak aplikasi biasa
- **Infrastruktur sebagai Kod** - Urus sumber Azure menggunakan Bicep atau Terraform  
- **Aliran kerja terintegrasi** - Lancar menyediakan, menerapkan, dan memantau aplikasi
- **Mesra pembangun** - Dioptimumkan untuk produktiviti dan pengalaman pembangun

### **AZD + Microsoft Foundry: Sempurna untuk Penerapan AI**

**Kenapa AZD untuk Penyelesaian AI?** AZD mengatasi cabaran utama pembangun AI:

- **Templat Sedia AI** - Templat telah dikonfigurasi untuk Model Microsoft Foundry, Perkhidmatan AI Azure, dan beban kerja ML
- **Deploy AI Selamat** - Corak keselamatan terbina untuk perkhidmatan AI, kunci API, dan titik akhir model  
- **Corak AI Produksi** - Amalan terbaik untuk penerapan aplikasi AI yang boleh diskalakan dan kos efektif
- **Aliran Kerja AI Sepanjang Jalan** - Dari pembangunan model ke penerapan produksi dengan pemantauan tepat
- **Pengoptimuman Kos** - Strategi pengagihan sumber dan penskalaan pintar untuk beban kerja AI
- **Integrasi Microsoft Foundry** - Sambungan lancar ke katalog model dan titik akhir Microsoft Foundry

---

## 🎯 Perpustakaan Templat & Contoh

### Terpilih: Templat Microsoft Foundry
**Mulakan di sini jika anda sedang menerapkan aplikasi AI!**

> **Nota:** Templat ini mempamerkan pelbagai corak AI. Sesetengah adalah Azure Samples luar, yang lain pelaksanaan tempatan.

| Templat | Bab | Kerumitan | Perkhidmatan | Jenis |
|----------|-----|-----------|--------------|-------|
| [**Bermula dengan sembang AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bab 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Luaran |
| [**Bermula dengan ejen AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Bab 2 | ⭐⭐ | Ejen Foundry + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Luaran |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bab 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Luaran |
| [**Mulakan Cepat Aplikasi Chat OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bab 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Luaran |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bab 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Luaran |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Bab 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Luaran |
| [**Penyelesaian Berbilang Ejen Runcit**](examples/retail-scenario.md) | Bab 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Tempatan** |

### Terpilih: Senario Pembelajaran Lengkap
**Templat aplikasi sedia produksi dipetakan ke bab pembelajaran**

| Templat | Bab Pembelajaran | Kerumitan | Pembelajaran Utama |
|----------|------------------|-----------|--------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bab 2 | ⭐ | Corak asas deploy AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bab 2 | ⭐⭐ | Pelaksanaan RAG dengan Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Bab 4 | ⭐⭐ | Integrasi Kecerdasan Dokumen |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bab 5 | ⭐⭐⭐ | Rangka kerja ejen dan panggilan fungsi |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Bab 8 | ⭐⭐⭐ | Orkestrasi AI perusahaan |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Bab 5 | ⭐⭐⭐⭐ | Seni bina berbilang ejen dengan ejen Pelanggan dan Inventori |

### Pembelajaran Mengikut Jenis Contoh

> **📌 Contoh Tempatan vs. Luaran:**  
> **Contoh Tempatan** (dalam repo ini) = Sedia digunakan serta-merta  
> **Contoh Luaran** (Azure Samples) = Klon dari repositori yang dipautkan

#### Contoh Tempatan (Sedia Guna)
- [**Penyelesaian Berbilang Ejen Runcit**](examples/retail-scenario.md) - Pelaksanaan lengkap sedia produksi dengan templat ARM
  - Seni bina berbilang ejen (ejen Pelanggan + Inventori)
  - Pemantauan dan penilaian menyeluruh
  - Deploy satu klik melalui templat ARM

#### Contoh Tempatan - Aplikasi Kontena (Bab 2-5)
**Contoh penerapan kontena menyeluruh dalam repositori ini:**
- [**Contoh Aplikasi Kontena**](examples/container-app/README.md) - Panduan lengkap untuk penghantaran berasaskan kontena
  - [API Flask Mudah](../../examples/container-app/simple-flask-api) - API REST asas dengan skala-ke-nol
  - [Seni Bina Mikroservis](../../examples/container-app/microservices) - Penghantaran multi-perkhidmatan sedia untuk produksi
  - Corak Penghantaran Mula Cepat, Produksi, dan Lanjutan
  - Panduan pemantauan, keselamatan, dan pengoptimuman kos

#### Contoh Luar - Aplikasi Mudah (Bab 1-2)
**Klon repositori Contoh Azure ini untuk bermula:**
- [Aplikasi Web Mudah - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Corak penghantaran asas
- [Laman Web Statik - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Penghantaran kandungan statik
- [Aplikasi Kontena - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Penghantaran API REST

#### Contoh Luar - Integrasi Pangkalan Data (Bab 3-4)  
- [Aplikasi Pangkalan Data - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Corak sambungan pangkalan data
- [Fungsi + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Aliran kerja data tanpa pelayan

#### Contoh Luar - Corak Lanjutan (Bab 4-8)
- [Mikroservis Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Seni bina multi-perkhidmatan
- [Tugas Aplikasi Kontena](https://github.com/Azure-Samples/container-apps-jobs) - Pemprosesan latar belakang  
- [Saluran ML Enterprise](https://github.com/Azure-Samples/mlops-v2) - Corak ML sedia produksi

### Koleksi Templat Luar
- [**Galeri Templat AZD Rasmi**](https://azure.github.io/awesome-azd/) - Koleksi templat rasmi dan komuniti yang dikurasi
- [**Templat Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasi templat Microsoft Learn
- [**Direktori Contoh**](examples/README.md) - Contoh pembelajaran tempatan dengan penjelasan terperinci

---

## 📚 Sumber & Rujukan Pembelajaran

### Rujukan Cepat
- [**Lembaran Perintah**](resources/cheat-sheet.md) - Perintah azd penting diatur mengikut bab
- [**Glosari**](resources/glossary.md) - Istilah Azure dan azd  
- [**Soalan Lazim**](resources/faq.md) - Soalan umum diatur mengikut bab pembelajaran
- [**Panduan Belajar**](resources/study-guide.md) - Latihan praktikal komprehensif

### Bengkel Praktikal
- [**Bengkel AI Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Jadikan penyelesaian AI anda boleh dihantar dengan AZD (2-3 jam)
- [**Bengkel Interaktif**](workshop/README.md) - Latihan berpandu 8 modul dengan MkDocs dan GitHub Codespaces
  - Mengikuti: Pengenalan → Pemilihan → Pengesahan → Pecahan → Konfigurasi → Penyesuaian → Perungkai → Penutup

### Sumber Pembelajaran Luar
- Dokumentasi Azure Developer CLI  
- Pusat Seni Bina Azure  
- Kalkulator Harga Azure  
- Status Azure

### Kemahiran Ejen AI untuk Penyunting Anda
- [**Kemahiran Microsoft Azure di skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 kemahiran ejen terbuka untuk AI Azure, Foundry, penghantaran, diagnostik, pengoptimuman kos, dan lagi. Pasangkannya dalam GitHub Copilot, Cursor, Claude Code, atau mana-mana ejen yang disokong:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Panduan Pantas Penyelesaian Masalah

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
# Autentikasi semula untuk AZD
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
# AZD menghasilkan nama unik, tetapi jika berlaku konflik:
azd down --force --purge

# Kemudian cuba semula dengan persekitaran baru
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Penghantaran templat mengambil masa terlalu lama</strong></summary>

**Masa menunggu biasa:**
- Aplikasi web mudah: 5-10 minit
- Aplikasi dengan pangkalan data: 10-15 minit
- Aplikasi AI: 15-25 minit (penyediaan OpenAI perlahan)

```bash
# Semak kemajuan
azd show

# Jika tersekat >30 minit, semak Azure Portal:
azd monitor --overview
# Cari penempatan yang gagal
```
</details>

<details>
<summary><strong>❌ "Permission denied" atau "Forbidden"</strong></summary>

```bash
# Semak peranan Azure anda
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Anda memerlukan peranan sekurang-kurangnya "Penyumbang"
# Minta pentadbir Azure anda memberikan:
# - Penyumbang (untuk sumber)
# - Pentadbir Akses Pengguna (untuk tugasan peranan)
```
</details>

<details>
<summary><strong>❌ Tidak dapat mencari URL aplikasi yang dihantar</strong></summary>

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

### 📚 Sumber Penyelesaian Masalah Lengkap

- **Panduan Isu Umum:** [Penyelesaian Terperinci](docs/chapter-07-troubleshooting/common-issues.md)
- **Isu Khusus AI:** [Penyelesaian Masalah AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Panduan Penggunaan Debug:** [Langkah demi langkah Debugging](docs/chapter-07-troubleshooting/debugging.md)
- **Dapatkan Bantuan:** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Penyelesaian Kursus & Pensijilan

### Penjejakan Kemajuan
Jejaki kemajuan pembelajaran anda melalui setiap bab:

- [ ] **Bab 1**: Asas & Mula Cepat ✅
- [ ] **Bab 2**: Pembangunan AI-Pertama ✅  
- [ ] **Bab 3**: Konfigurasi & Pengesahan ✅
- [ ] **Bab 4**: Infrastruktur sebagai Kod & Penghantaran ✅
- [ ] **Bab 5**: Penyelesaian AI Multi-Ejen ✅
- [ ] **Bab 6**: Pengesahan Pra-Penghantaran & Perancangan ✅
- [ ] **Bab 7**: Penyelesaian Masalah & Debugging ✅
- [ ] **Bab 8**: Corak Produksi & Perusahaan ✅

### Pengesahan Pembelajaran
Selepas menamatkan setiap bab, sahkan pengetahuan anda dengan:
1. **Latihan Praktikal**: Lengkapkan penghantaran hands-on bab tersebut
2. **Semakan Pengetahuan**: Semak seksyen FAQ bab anda
3. **Perbincangan Komuniti**: Kongsi pengalaman anda dalam Azure Discord
4. **Bab Seterusnya**: Beralih ke tahap kerumitan seterusnya

### Faedah Penamat Kursus
Setelah menamatkan semua bab, anda akan mempunyai:
- **Pengalaman Produksi**: Menghantar aplikasi AI sebenar ke Azure  
- **Kemahiran Profesional**: Kebolehan penghantaran sedia perusahaan  
- **Pengiktirafan Komuniti**: Ahli aktif komuniti pembangun Azure  
- **Kemajuan Kerjaya**: Kepakaran AZD dan penghantaran AI yang tinggi permintaan

---

## 🤝 Komuniti & Sokongan

### Dapatkan Bantuan & Sokongan
- **Isu Teknikal**: [Laporkan pepijat dan minta ciri](https://github.com/microsoft/azd-for-beginners/issues)
- **Soalan Pembelajaran**: [Komuniti Discord Microsoft Azure](https://discord.gg/microsoft-azure) dan [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Bantuan Khusus AI**: Sertai [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasi**: [Dokumentasi rasmi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Pandangan Komuniti dari Microsoft Foundry Discord

**Hasil Tinjauan Terkini dari Saluran #Azure:**
- **45%** pembangun mahu menggunakan AZD untuk beban kerja AI  
- **Cabaran utama**: Penghantaran multi-perkhidmatan, pengurusan kelayakan, kesediaan produksi  
- **Permintaan terbanyak**: Templat khusus AI, panduan penyelesaian masalah, amalan terbaik

**Sertai komuniti kami untuk:**
- Berkongsi pengalaman AZD + AI dan dapatkan bantuan  
- Akses pratonton awal templat AI baru  
- Menyumbang kepada amalan terbaik penghantaran AI  
- Mempengaruhi pembangunan ciri AI + AZD akan datang

### Sumbangan ke Kursus
Kami mengalu-alukan sumbangan! Sila baca [Panduan Menyumbang](CONTRIBUTING.md) untuk maklumat mengenai:
- **Penambahbaikan Kandungan**: Tingkatkan bab dan contoh sedia ada
- **Contoh Baru**: Tambah senario dunia nyata dan templat  
- **Terjemahan**: Bantu mengekalkan sokongan pelbagai bahasa
- **Laporan Pepijat**: Perbaiki ketepatan dan kejelasan
- **Standard Komuniti**: Ikuti garis panduan komuniti inklusif kami

---

## 📄 Maklumat Kursus

### Lesen
Projek ini dilesenkan di bawah Lesen MIT - lihat fail [LICENSE](../../LICENSE) untuk perincian.

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

**Pemula**: Mulakan dengan [Bab 1: Asas & Mula Cepat](#-chapter-1-foundation--quick-start)  
**Pembangun AI**: Terus ke [Bab 2: Pembangunan AI-Pertama](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Pembangun Berpengalaman**: Mulakan dengan [Bab 3: Konfigurasi & Pengesahan](#️-chapter-3-configuration--authentication)

**Langkah Seterusnya**: [Mula Bab 1 - Asas AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->