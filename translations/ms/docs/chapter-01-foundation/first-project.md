# Projek Pertama Anda - Tutorial Praktikal

**Chapter Navigation:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Mula Pantas
- **⬅️ Sebelumnya**: [Pemasangan & Persediaan](installation.md)
- **➡️ Seterusnya**: [Konfigurasi](configuration.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan Berfokus AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Pengenalan

Selamat datang ke projek Azure Developer CLI pertama anda! Tutorial praktikal komprehensif ini menyediakan panduan lengkap untuk mencipta, menerapkan, dan mengurus aplikasi penuh pada Azure menggunakan azd. Anda akan bekerja dengan aplikasi todo sebenar yang merangkumi frontend React, backend API Node.js, dan pangkalan data MongoDB.

## Matlamat Pembelajaran

Dengan menyelesaikan tutorial ini, anda akan:
- Menguasai aliran kerja inisialisasi projek azd menggunakan templat
- Memahami struktur projek Azure Developer CLI dan fail konfigurasi
- Melaksanakan penerapan aplikasi penuh ke Azure dengan penyediaan infrastruktur
- Melaksanakan kemas kini aplikasi dan strategi penerapan semula
- Menguruskan berbilang persekitaran untuk pembangunan dan staging
- Mengaplikasikan amalan pembersihan sumber dan pengurusan kos

## Hasil Pembelajaran

Selepas selesai, anda akan dapat:
- Inisialisasi dan konfigurasikan projek azd dari templat secara berdikari
- Menavigasi dan mengubah suai struktur projek azd dengan berkesan
- Menerapkan aplikasi penuh ke Azure menggunakan arahan tunggal
- Menyahpepijat isu penerapan biasa dan masalah pengesahan
- Menguruskan berbilang persekitaran Azure untuk peringkat penerapan yang berbeza
- Melaksanakan aliran kerja penerapan berterusan untuk kemas kini aplikasi

## Mula

### Senarai Semak Prasyarat
- ✅ Azure Developer CLI dipasang ([Panduan Pemasangan](installation.md))
- ✅ Azure CLI dipasang dan diautentikasi
- ✅ Git dipasang pada sistem anda
- ✅ Node.js 16+ (untuk tutorial ini)
- ✅ Visual Studio Code (disyorkan)

### Sahkan Persediaan Anda
```bash
# Semak pemasangan azd
azd version
```
### Sahkan pengesahan Azure

```bash
az account show
```

### Semak versi Node.js
```bash
node --version
```

## Langkah 1: Pilih dan Inisialisasi Templat

Mari kita mulakan dengan templat aplikasi todo yang popular yang merangkumi frontend React dan backend API Node.js.

```bash
# Layari templat yang tersedia
azd template list

# Mulakan templat aplikasi todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Ikuti arahan:
# - Masukkan nama persekitaran: "dev"
# - Pilih langganan (jika anda mempunyai beberapa)
# - Pilih wilayah: "East US 2" (atau wilayah pilihan anda)
```

### Apa yang Baru Berlaku?
- Dimuat turun kod templat ke direktori tempatan anda
- Mencipta sebuah `azure.yaml` fail dengan definisi perkhidmatan
- Menyediakan kod infrastruktur dalam direktori `infra/`
- Mencipta konfigurasi persekitaran

## Langkah 2: Terokai Struktur Projek

Mari periksa apa yang azd cipta untuk kita:

```bash
# Lihat struktur projek
tree /f   # Windows
# atau
find . -type f | head -20   # macOS/Linux
```

Anda sepatutnya melihat:
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

**azure.yaml** - Nadi projek azd anda:
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

Sebelum menerapkan, anda boleh menyesuaikan aplikasi:

### Ubahsuai Frontend
```bash
# Buka komponen aplikasi React
code src/web/src/App.tsx
```

Buat perubahan ringkas:
```typescript
// Cari tajuk dan ubahnya
<h1>My Awesome Todo App</h1>
```

### Sediakan Pembolehubah Persekitaran
```bash
# Tetapkan pembolehubah persekitaran tersuai
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Lihat semua pembolehubah persekitaran
azd env get-values
```

## Langkah 4: Terapkan ke Azure

Sekarang bahagian yang menarik - terapkan semuanya ke Azure!

```bash
# Sebarkan infrastruktur dan aplikasi
azd up

# Perintah ini akan:
# 1. Menyediakan sumber Azure (App Service, Cosmos DB, dan lain-lain)
# 2. Bina aplikasi anda
# 3. Sebarkan ke sumber yang disediakan
# 4. Paparkan URL aplikasi
```

### Apa yang Berlaku Semasa Penerapan?

Perintah `azd up` melakukan langkah-langkah ini:
1. **Provision** (`azd provision`) - Mencipta sumber Azure
2. **Package** - Membina kod aplikasi anda
3. **Deploy** (`azd deploy`) - Menerapkan kod ke sumber Azure

### Keluaran Yang Dijangkakan
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
Klik pada URL yang disediakan dalam keluaran penerapan, atau dapatkannya bila-bila masa:
```bash
# Dapatkan titik akhir aplikasi
azd show

# Buka aplikasi dalam pelayar anda
azd show --output json | jq -r '.services.web.endpoint'
```

### Uji Aplikasi Todo
1. **Tambah item todo** - Klik "Add Todo" dan masukkan tugasan
2. **Tandakan sebagai selesai** - Tandakan item yang telah lengkap
3. **Padam item** - Alih keluar todo yang anda tidak perlukan lagi

### Pantau Aplikasi Anda
```bash
# Buka portal Azure untuk sumber anda
azd monitor

# Lihat log aplikasi
azd monitor --logs

# Lihat metrik masa nyata
azd monitor --live
```

## Langkah 6: Buat Perubahan dan Terapkan Semula

Mari buat perubahan dan lihat betapa mudahnya untuk mengemas kini:

### Ubahsuai API
```bash
# Sunting kod API
code src/api/src/routes/lists.js
```

Tambahkan pengepala respons tersuai:
```javascript
// Cari pengendali laluan dan tambah:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Terapkan Hanya Perubahan Kod
```bash
# Hanya terapkan kod aplikasi (langkau infrastruktur)
azd deploy

# Ini jauh lebih pantas daripada 'azd up' kerana infrastruktur sudah sedia ada
```

## Langkah 7: Uruskan Berbilang Persekitaran

Cipta persekitaran panggung untuk menguji perubahan sebelum produksi:

```bash
# Cipta persekitaran pementasan baru
azd env new staging

# Sebarkan ke persekitaran pementasan
azd up

# Beralih kembali ke persekitaran pembangunan
azd env select dev

# Senaraikan semua persekitaran
azd env list
```

### Perbandingan Persekitaran
```bash
# Lihat persekitaran pembangunan
azd env select dev
azd show

# Lihat persekitaran pementasan
azd env select staging
azd show
```

## Langkah 8: Bersihkan Sumber

Apabila anda selesai mencuba, bersihkan untuk mengelakkan caj berterusan:

```bash
# Padam semua sumber Azure untuk persekitaran semasa
azd down

# Padam secara paksa tanpa pengesahan dan buang sumber yang dipadamkan sementara
azd down --force --purge

# Padam persekitaran tertentu
azd env select staging
azd down --force --purge
```

## Apa Yang Anda Pelajari

Tahniah! Anda telah berjaya:
- ✅ Inisialisasi projek azd dari templat
- ✅ Meneroka struktur projek dan fail utama
- ✅ Menerapkan aplikasi penuh ke Azure
- ✅ Membuat perubahan kod dan menerapkan semula
- ✅ Menguruskan berbilang persekitaran
- ✅ Membersihkan sumber

## 🎯 Latihan Pengesahan Kemahiran

### Latihan 1: Terapkan Templat Berbeza (15 minit)
**Matlamat**: Tunjukkan penguasaan azd init dan aliran kerja penerapan

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
- [ ] Aplikasi diterapkan tanpa ralat
- [ ] Boleh mengakses URL aplikasi dalam pelayar
- [ ] Aplikasi berfungsi dengan betul (tambah/padam todo)
- [ ] Berjaya membersihkan semua sumber

### Latihan 2: Sesuaikan Konfigurasi (20 minit)
**Matlamat**: Amalkan konfigurasi pembolehubah persekitaran

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

# Sebarkan dengan konfigurasi tersuai
azd up
```

**Kriteria Kejayaan:**
- [ ] Persekitaran tersuai berjaya dicipta
- [ ] Pembolehubah persekitaran ditetapkan dan boleh diambil semula
- [ ] Aplikasi diterapkan dengan konfigurasi tersuai
- [ ] Boleh mengesahkan tetapan tersuai dalam aplikasi yang diterapkan

### Latihan 3: Aliran Kerja Berbilang Persekitaran (25 minit)
**Matlamat**: Kuasai pengurusan persekitaran dan strategi penerapan

```bash
# Cipta persekitaran pembangunan
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Catat URL pembangunan
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Cipta persekitaran staging
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Catat URL staging
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Bandingkan persekitaran
azd env list

# Uji kedua-dua persekitaran
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Bersihkan kedua-dua persekitaran
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kriteria Kejayaan:**
- [ ] Dua persekitaran dicipta dengan konfigurasi berbeza
- [ ] Kedua-dua persekitaran berjaya diterapkan
- [ ] Boleh bertukar antara persekitaran menggunakan `azd env select`
- [ ] Pembolehubah persekitaran berbeza antara persekitaran
- [ ] Berjaya membersihkan kedua-dua persekitaran

## 📊 Kemajuan Anda

**Masa Dilaburkan**: ~60-90 minit  
**Kemahiran Diperoleh**:
- ✅ Inisialisasi projek berasaskan templat
- ✅ Penyediaan sumber Azure
- ✅ Aliran kerja penerapan aplikasi
- ✅ Pengurusan persekitaran
- ✅ Pengurusan konfigurasi
- ✅ Pembersihan sumber dan pengurusan kos

**Tahap Seterusnya**: Anda bersedia untuk [Panduan Konfigurasi](configuration.md) untuk mempelajari corak konfigurasi lanjutan!

## Menyelesaikan Masalah Biasa

### Ralat Pengesahan
```bash
# Log masuk semula ke Azure
az login

# Sahkan akses langganan
az account show
```

### Kegagalan Penerapan
```bash
# Aktifkan pencatatan debug
export AZD_DEBUG=true
azd up --debug

# Lihat log aplikasi di Azure
azd monitor --logs

# Untuk Container Apps, gunakan Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflik Nama Sumber
```bash
# Gunakan nama persekitaran yang unik
azd env new dev-$(whoami)-$(date +%s)
```

### Isu Port/Rangkaian
```bash
# Periksa sama ada port tersedia
netstat -an | grep :3000
netstat -an | grep :3100
```

## Langkah Seterusnya

Sekarang anda telah menyelesaikan projek pertama anda, terokai topik lanjutan ini:

### 1. Sesuaikan Infrastruktur
- [Infrastruktur sebagai Kod](../chapter-04-infrastructure/provisioning.md)
- [Tambah pangkalan data, storan, dan perkhidmatan lain](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Sediakan CI/CD
- [Panduan Penerapan](../chapter-04-infrastructure/deployment-guide.md) - Aliran kerja CI/CD lengkap
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfigurasi saluran paip

### 3. Amalan Terbaik Produksi
- [Panduan Penerapan](../chapter-04-infrastructure/deployment-guide.md) - Keselamatan, prestasi, dan pemantauan

### 4. Terokai Lebih Banyak Templat
```bash
# Layari templat mengikut kategori
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Cuba pelbagai tumpukan teknologi
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Sumber Tambahan

### Bahan Pembelajaran
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pusat Seni Bina Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kerangka Kerja Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komuniti & Sokongan
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Komuniti Pembangun Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templat & Contoh
- [Galeri Templat Rasmi](https://azure.github.io/awesome-azd/)
- [Templat Komuniti](https://github.com/Azure-Samples/azd-templates)
- [Corak Perusahaan](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Tahniah kerana menyelesaikan projek azd pertama anda!** Anda kini bersedia untuk membina dan menerapkan aplikasi menakjubkan di Azure dengan penuh keyakinan.

---

**Chapter Navigation:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Mula Pantas
- **⬅️ Sebelumnya**: [Pemasangan & Persediaan](installation.md)
- **➡️ Seterusnya**: [Konfigurasi](configuration.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan Berfokus AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Panduan Penerapan](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha sedaya upaya untuk memastikan ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi ralat atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber rujukan yang muktamad. Untuk maklumat yang kritikal, disarankan mendapatkan terjemahan profesional oleh penterjemah manusia. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->