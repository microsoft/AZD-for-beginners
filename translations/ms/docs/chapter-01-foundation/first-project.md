# Projek Pertama Anda - Tutorial Praktikal

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Permulaan Pantas
- **⬅️ Sebelumnya**: [Pemasangan & Persediaan](installation.md)
- **➡️ Seterusnya**: [Konfigurasi](configuration.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Pengenalan

Selamat datang ke projek Azure Developer CLI pertama anda! Tutorial praktik menyeluruh ini menyediakan panduan lengkap untuk membuat, menyebarkan, dan mengurus aplikasi sepenuhnya penuh pada Azure menggunakan azd. Anda akan bekerja dengan aplikasi todo nyata yang merangkumi frontend React, backend API Node.js, dan pangkalan data MongoDB.

## Matlamat Pembelajaran

Dengan menyelesaikan tutorial ini, anda akan:
- Menguasai aliran kerja permulaan projek azd menggunakan templat
- Memahami struktur projek Azure Developer CLI dan fail konfigurasi
- Melaksanakan penyebaran aplikasi lengkap ke Azure dengan penyediaan infrastruktur
- Melaksanakan kemaskini aplikasi dan strategi penyebaran semula
- Mengurus pelbagai persekitaran untuk pembangunan dan peringkat ujian
- Mengaplikasi amalan pembersihan sumber dan pengurusan kos

## Hasil Pembelajaran

Setelah selesai, anda akan mampu:
- Memulakan dan mengkonfigurasi projek azd dari templat secara bebas
- Menavigasi dan mengubahsuai struktur projek azd dengan berkesan
- Menyebarkan aplikasi sepenuhnya ke Azure menggunakan satu perintah
- Menyelesaikan masalah biasa dalam penyebaran dan pengesahan
- Mengurus pelbagai persekitaran Azure untuk peringkat penyebaran yang berbeza
- Melaksanakan aliran kerja penyebaran berterusan untuk kemaskini aplikasi

## Memulakan

### Senarai Semak Prasyarat
- ✅ Azure Developer CLI dipasang ([Panduan Pemasangan](installation.md))
- ✅ Autentikasi AZD selesai dengan `azd auth login`
- ✅ Git dipasang pada sistem anda
- ✅ Node.js 16+ (untuk tutorial ini)
- ✅ Visual Studio Code (disyorkan)

Sebelum meneruskan, jalankan validator persediaan dari akar repositori:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Sahkan Persediaan Anda
```bash
# Semak pemasangan azd
azd version

# Semak pengesahan AZD
azd auth login --check-status
```

### Sahkan Autentikasi Azure CLI pilihan

```bash
az account show
```

### Periksa versi Node.js
```bash
node --version
```

## Langkah 1: Pilih dan Mulakan Templat

Mari mulakan dengan templat aplikasi todo popular yang merangkumi frontend React dan backend API Node.js.

```bash
# Layari templat yang tersedia
azd template list

# Mulakan templat aplikasi todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Ikuti arahan:
# - Masukkan nama persekitaran: "dev"
# - Pilih langganan (jika anda mempunyai lebih dari satu)
# - Pilih rantau: "East US 2" (atau rantau pilihan anda)
```

### Apa yang Baru Berlaku?
- Memuat turun kod templat ke direktori tempatan anda
- Mencipta fail `azure.yaml` dengan definisi perkhidmatan
- Menyediakan kod infrastruktur di direktori `infra/`
- Membuat konfigurasi persekitaran

## Langkah 2: Terokai Struktur Projek

Mari lihat apa yang azd cipta untuk kita:

```bash
# Lihat struktur projek
tree /f   # Windows
# atau
find . -type f | head -20   # macOS/Linux
```

Anda harus melihat:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Fail Utama untuk Difahami

**azure.yaml** - Jantung projek azd anda:
```bash
# Lihat konfigurasi projek
cat azure.yaml
```

**infra/main.bicep** - Definisi infrastruktur:
```bash
# Lihat kod infrastruktur
head -30 infra/main.bicep
```

## Langkah 3: Sesuaikan Projek Anda (Pilihan)

Sebelum menyebarkan, anda boleh menyesuaikan aplikasi:

### Ubah Suai Frontend
```bash
# Buka komponen aplikasi React
code src/web/src/App.tsx
```

Buat perubahan mudah:
```typescript
// Cari tajuk dan tukar ia
<h1>My Awesome Todo App</h1>
```

### Konfigurasikan Pembolehubah Persekitaran
```bash
# Tetapkan pembolehubah persekitaran tersuai
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Lihat semua pembolehubah persekitaran
azd env get-values
```

## Langkah 4: Sebarkan ke Azure

Sekarang bahagian yang menarik - sebar semuanya ke Azure!

```bash
# Lancarkan infrastruktur dan aplikasi
azd up

# Arahan ini akan:
# 1. Menyediakan sumber Azure (Perkhidmatan Aplikasi, Cosmos DB, dll.)
# 2. Membina aplikasi anda
# 3. Melancarkan ke sumber yang disediakan
# 4. Memaparkan URL aplikasi
```

### Apa yang Berlaku Semasa Penyebaran?

Perintah `azd up` melaksanakan langkah-langkah ini:
1. **Sediakan** (`azd provision`) - Membuat sumber Azure
2. **Pakej** - Membina kod aplikasi anda
3. **Sebar** (`azd deploy`) - Menyebarkan kod ke sumber Azure

### Output Dijangka
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Langkah 5: Uji Aplikasi Anda

### Akses Aplikasi Anda
Klik pada URL yang disediakan dalam output penyebaran, atau dapatkan bila-bila masa:
```bash
# Dapatkan titik akhir aplikasi
azd show

# Buka aplikasi dalam penyemak imbas anda
azd show --output json | jq -r '.services.web.endpoint'
```

### Uji Aplikasi Todo
1. **Tambah item todo** - Klik "Add Todo" dan masukkan tugasan
2. **Tandakan sebagai lengkap** - Tanda item yang sudah siap
3. **Padam item** - Buang todo yang tidak diperlukan lagi

### Pantau Aplikasi Anda
```bash
# Buka portal Azure untuk sumber anda
azd monitor

# Lihat log aplikasi
azd monitor --logs

# Lihat metrik langsung
azd monitor --live
```

### ✅ Sahkan Penyebaran Anda

Sebelum meneruskan, laksanakan senarai semak cepat ini untuk mengesahkan segala-galanya berfungsi—jangan anggap "penyebaran berjaya" bermaksud "aplikasi berfungsi":

```bash
# 1. Sahkan endpoint wujud dan boleh dicapai
azd show

# 2. Uji ringan endpoint (menjangkakan HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Periksa endpoint kesihatan jika aplikasi anda mendedahkannya
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Penyebaran disahkan apabila:**
- ✅ `azd show` menyenaraikan URL titik hujung yang boleh diakses
- ✅ URL dibuka di pelayar anda tanpa ralat
- ✅ Fungsi utama berfungsi (tambah/selesai/padam todo)
- ✅ `azd monitor --logs` menunjukkan permintaan tiba tanpa ralat tak dijangka

Jika ada yang gagal, pergi ke [Bab 7: Penyelesaian Masalah](../chapter-07-troubleshooting/README.md).

## Langkah 6: Buat Perubahan dan Sebar Semula

Mari buat perubahan dan lihat betapa mudahnya untuk mengemas kini:

### Ubah Suai API
```bash
# Sunting kod API
code src/api/src/routes/lists.js
```

Tambah header respons tersuai:
```javascript
// Cari pengendali laluan dan tambah:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Sebar Hanya Perubahan Kod
```bash
# Hanya laksanakan kod aplikasi (langkau infrastruktur)
azd deploy

# Ini jauh lebih pantas daripada 'azd up' kerana infrastruktur sudah wujud
```

## Langkah 7: Urus Pelbagai Persekitaran

Buat persekitaran persediaan untuk menguji perubahan sebelum produksi:

```bash
# Cipta persekitaran penstagingan baru
azd env new staging

# Sebarkan ke penstagingan
azd up

# Beralih kembali ke persekitaran dev
azd env select dev

# Senaraikan semua persekitaran
azd env list
```

### Perbandingan Persekitaran
```bash
# Lihat persekitaran pembangunan
azd env select dev
azd show

# Lihat persekitaran staging
azd env select staging
azd show
```

## Langkah 8: Bersihkan Sumber

Apabila selesai mencuba, bersihkan untuk mengelakkan caj berterusan:

```bash
# Padam semua sumber Azure untuk persekitaran semasa
azd down

# Paksa padam tanpa pengesahan dan hapus sumber yang dipadamkan secara lembut
azd down --force --purge

# Padam persekitaran tertentu
azd env select staging
azd down --force --purge
```

## Aplikasi Klasik vs. Aplikasi Dipacu AI: Aliran Kerja Sama

Anda baru sahaja menyebarkan aplikasi web tradisional. Tetapi bagaimana jika anda ingin menyebarkan aplikasi dipacu AI – contohnya aplikasi chat yang disokong oleh Microsoft Foundry Models?

Berita baik: **aliran kerja adalah serupa.**

| Langkah | Aplikasi Todo Klasik | Aplikasi Chat AI |
|------|-----------------|-------------|
| Inisialisasi | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentikasi | `azd auth login` | `azd auth login` |
| Sebar | `azd up` | `azd up` |
| Pantau | `azd monitor` | `azd monitor` |
| Bersihkan | `azd down --force --purge` | `azd down --force --purge` |

Perbezaan hanya pada **templat** yang anda mula dengan. Templat AI termasuk infrastruktur tambahan (seperti sumber Microsoft Foundry Models atau indeks AI Search), tetapi azd mengendalikan semua itu untuk anda. Anda tidak perlu belajar arahan baru, menggunakan alat lain, atau mengubah cara fikir tentang penyebaran.

Ini adalah prinsip utama azd: **satu aliran kerja, semua jenis beban kerja.** Kemahiran yang anda latih dalam tutorial ini—inisialisasi, penyebaran, pemantauan, penyebaran semula, dan pembersihan—guna pakai sama rata untuk aplikasi dan agen AI.

---

## Apa yang Anda Pelajari

Tahniah! Anda telah berjaya:
- ✅ Memulakan projek azd dari templat
- ✅ Meneroka struktur projek dan fail penting
- ✅ Menyebarkan aplikasi sepenuhnya ke Azure
- ✅ Membuat perubahan kod dan menyebar semula
- ✅ Mengurus pelbagai persekitaran
- ✅ Membersihkan sumber

## 🎯 Latihan Pengesahan Kemahiran

### Latihan 1: Sebarkan Templat Berbeza (15 minit)
**Matlamat**: Menunjukkan penguasaan azd init dan aliran kerja penyebaran

```bash
# Cuba tumpukan Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Sahkan penyebaran
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Bersihkan
azd down --force --purge
```

**Kriteria Kejayaan:**
- [ ] Aplikasi disebarkan tanpa ralat
- [ ] Boleh akses URL aplikasi dalam pelayar
- [ ] Aplikasi berfungsi dengan betul (tambah/buang todo)
- [ ] Berjaya membersihkan semua sumber

### Latihan 2: Sesuaikan Konfigurasi (20 minit)
**Matlamat**: Latihan konfigurasi pembolehubah persekitaran

```bash
cd my-first-azd-app

# Cipta persekitaran tersuai
azd env new custom-config

# Tetapkan pembolehubah tersuai
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Sahkan pembolehubah
azd env get-values | grep APP_TITLE

# Lancarkan dengan konfigurasi tersuai
azd up
```

**Kriteria Kejayaan:**
- [ ] Persekitaran tersuai berjaya dibuat
- [ ] Pembolehubah persekitaran ditetapkan dan boleh diambil
- [ ] Aplikasi disebarkan dengan konfigurasi tersuai
- [ ] Boleh sahkan tetapan tersuai dalam aplikasi yang disebar

### Latihan 3: Aliran Kerja Multi-Persekitaran (25 minit)
**Matlamat**: Menguasai pengurusan persekitaran dan strategi penyebaran

```bash
# Cipta persekitaran dev
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Nota URL dev
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Cipta persekitaran staging
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Nota URL staging
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Bandingkan persekitaran
azd env list

# Uji kedua-dua persekitaran
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Bersihkan kedua-duanya
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kriteria Kejayaan:**
- [ ] Dua persekitaran dibuat dengan konfigurasi berbeza
- [ ] Kedua-dua persekitaran disebarkan dengan jayanya
- [ ] Boleh bertukar antara persekitaran menggunakan `azd env select`
- [ ] Pembolehubah persekitaran berbeza antara persekitaran
- [ ] Berjaya membersihkan kedua-dua persekitaran

## 📊 Kemajuan Anda

**Masa Dilaburkan**: ~60-90 minit  
**Kemahiran Diperoleh**:
- ✅ Permulaan projek berasaskan templat
- ✅ Penyediaan sumber Azure
- ✅ Aliran kerja penyebaran aplikasi
- ✅ Pengurusan persekitaran
- ✅ Pengurusan konfigurasi
- ✅ Pembersihan sumber dan pengurusan kos

**Tahap Seterusnya**: Anda sudah bersedia untuk [Panduan Konfigurasi](configuration.md) untuk belajar pola konfigurasi lanjutan!

## Penyelesaian Masalah Biasa

### Ralat Pengesahan
```bash
# Sahkan semula dengan Azure
az login

# Sahkan akses langganan
az account show
```

### Kegagalan Penyebaran
```bash
# Aktifkan log debug
export AZD_DEBUG=true
azd up --debug

# Lihat log aplikasi di Azure
azd monitor --logs

# Untuk Aplikasi Kontena, gunakan Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflik Nama Sumber
```bash
# Gunakan nama persekitaran yang unik
azd env new dev-$(whoami)-$(date +%s)
```

### Isu Port/Rangkaian
```bash
# Semak jika pelabuhan tersedia
netstat -an | grep :3000
netstat -an | grep :3100
```

## Langkah Seterusnya

Sekarang anda telah menyelesaikan projek pertama, terokai topik lanjutan ini:

### 1. Sesuaikan Infrastruktur
- [Infrastruktur sebagai Kod](../chapter-04-infrastructure/provisioning.md)
- [Tambah pangkalan data, storan, dan perkhidmatan lain](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Sediakan CI/CD
- [Panduan Penyebaran](../chapter-04-infrastructure/deployment-guide.md) - Aliran kerja CI/CD lengkap
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfigurasi talian paip

### 3. Amalan Terbaik Produksi
- [Panduan Penyebaran](../chapter-04-infrastructure/deployment-guide.md) - Keselamatan, prestasi, dan pemantauan

### 4. Terokai Lebih Banyak Templat
```bash
# Layari templat mengikut kategori
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Cuba susunan teknologi yang berbeza
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Sumber Tambahan

### Bahan Pembelajaran
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pusat Seni Bina Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kerangka Seni Bina Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komuniti & Sokongan
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Komuniti Pembangun Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templat & Contoh
- [Galeri Templat Rasmi](https://azure.github.io/awesome-azd/)
- [Templat Komuniti](https://github.com/Azure-Samples/azd-templates)
- [Corak Perusahaan](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Tahniah kerana menyelesaikan projek azd pertama anda!** Anda kini bersedia untuk membina dan menyebarkan aplikasi hebat di Azure dengan keyakinan.

---

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Permulaan Pantas
- **⬅️ Sebelumnya**: [Pemasangan & Persediaan](installation.md)
- **➡️ Seterusnya**: [Bawa Aplikasi Anda Sendiri](bring-your-own-app.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->