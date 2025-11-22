<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-22T09:53:57+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "ms"
}
-->
# Projek Pertama Anda - Tutorial Praktikal

**Navigasi Bab:**
- **📚 Halaman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Permulaan Pantas
- **⬅️ Sebelumnya**: [Pemasangan & Persediaan](installation.md)
- **➡️ Seterusnya**: [Konfigurasi](configuration.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan Berasaskan AI](../microsoft-foundry/microsoft-foundry-integration.md)

## Pengenalan

Selamat datang ke projek pertama anda menggunakan Azure Developer CLI! Tutorial praktikal ini memberikan panduan lengkap untuk mencipta, melancarkan, dan mengurus aplikasi full-stack di Azure menggunakan azd. Anda akan bekerja dengan aplikasi todo sebenar yang merangkumi frontend React, backend API Node.js, dan pangkalan data MongoDB.

## Matlamat Pembelajaran

Dengan melengkapkan tutorial ini, anda akan:
- Menguasai aliran kerja inisialisasi projek azd menggunakan templat
- Memahami struktur projek dan fail konfigurasi Azure Developer CLI
- Melaksanakan pelancaran aplikasi lengkap ke Azure dengan penyediaan infrastruktur
- Melaksanakan kemas kini aplikasi dan strategi pelancaran semula
- Menguruskan pelbagai persekitaran untuk pembangunan dan pementasan
- Menerapkan amalan pembersihan sumber dan pengurusan kos

## Hasil Pembelajaran

Setelah selesai, anda akan dapat:
- Memulakan dan mengkonfigurasi projek azd daripada templat secara bebas
- Menavigasi dan mengubah struktur projek azd dengan berkesan
- Melancarkan aplikasi full-stack ke Azure menggunakan arahan tunggal
- Menyelesaikan masalah pelancaran biasa dan isu pengesahan
- Menguruskan pelbagai persekitaran Azure untuk peringkat pelancaran yang berbeza
- Melaksanakan aliran kerja pelancaran berterusan untuk kemas kini aplikasi

## Memulakan

### Senarai Semak Prasyarat
- ✅ Azure Developer CLI dipasang ([Panduan Pemasangan](installation.md))
- ✅ Azure CLI dipasang dan disahkan
- ✅ Git dipasang pada sistem anda
- ✅ Node.js 16+ (untuk tutorial ini)
- ✅ Visual Studio Code (disyorkan)

### Sahkan Persediaan Anda
```bash
# Periksa pemasangan azd
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

Mari mulakan dengan templat aplikasi todo popular yang merangkumi frontend React dan backend API Node.js.

```bash
# Semak templat yang tersedia
azd template list

# Mulakan templat aplikasi todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Ikuti arahan:
# - Masukkan nama persekitaran: "dev"
# - Pilih langganan (jika anda mempunyai banyak)
# - Pilih wilayah: "East US 2" (atau wilayah pilihan anda)
```

### Apa yang Baru Berlaku?
- Kod templat dimuat turun ke direktori tempatan anda
- Fail `azure.yaml` dicipta dengan definisi perkhidmatan
- Kod infrastruktur disediakan dalam direktori `infra/`
- Konfigurasi persekitaran dicipta

## Langkah 2: Terokai Struktur Projek

Mari kita periksa apa yang telah dicipta oleh azd untuk kita:

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

Sebelum melancarkan, anda boleh menyesuaikan aplikasi:

### Ubahsuai Frontend
```bash
# Buka komponen aplikasi React
code src/web/src/App.tsx
```

Buat perubahan mudah:
```typescript
// Cari tajuk dan ubahkannya
<h1>My Awesome Todo App</h1>
```

### Konfigurasi Pembolehubah Persekitaran
```bash
# Tetapkan pembolehubah persekitaran tersuai
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Lihat semua pembolehubah persekitaran
azd env get-values
```

## Langkah 4: Lancarkan ke Azure

Sekarang bahagian yang menarik - lancarkan semuanya ke Azure!

```bash
# Sebarkan infrastruktur dan aplikasi
azd up

# Perintah ini akan:
# 1. Menyediakan sumber Azure (App Service, Cosmos DB, dll.)
# 2. Membina aplikasi anda
# 3. Sebarkan ke sumber yang telah disediakan
# 4. Paparkan URL aplikasi
```

### Apa yang Berlaku Semasa Pelancaran?

Arahan `azd up` melaksanakan langkah-langkah ini:
1. **Provision** (`azd provision`) - Mencipta sumber Azure
2. **Package** - Membina kod aplikasi anda
3. **Deploy** (`azd deploy`) - Melancarkan kod ke sumber Azure

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
Klik pada URL yang disediakan dalam output pelancaran, atau dapatkan bila-bila masa:
```bash
# Dapatkan titik akhir aplikasi
azd show

# Buka aplikasi dalam pelayar anda
azd show --output json | jq -r '.services.web.endpoint'
```

### Uji Aplikasi Todo
1. **Tambah item todo** - Klik "Add Todo" dan masukkan tugasan
2. **Tandakan sebagai selesai** - Tandakan item yang telah selesai
3. **Padam item** - Hapuskan todo yang tidak lagi diperlukan

### Pantau Aplikasi Anda
```bash
# Buka portal Azure untuk sumber anda
azd monitor

# Lihat log aplikasi
azd logs
```

## Langkah 6: Buat Perubahan dan Lancarkan Semula

Mari buat perubahan dan lihat betapa mudahnya untuk mengemas kini:

### Ubahsuai API
```bash
# Edit kod API
code src/api/src/routes/lists.js
```

Tambah header respons tersuai:
```javascript
// Cari pengendali laluan dan tambah:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Lancarkan Hanya Perubahan Kod
```bash
# Sebarkan hanya kod aplikasi (langkau infrastruktur)
azd deploy

# Ini jauh lebih pantas daripada 'azd up' kerana infrastruktur sudah wujud
```

## Langkah 7: Urus Pelbagai Persekitaran

Cipta persekitaran pementasan untuk menguji perubahan sebelum pengeluaran:

```bash
# Buat persekitaran pementasan baru
azd env new staging

# Lakukan penyebaran ke pementasan
azd up

# Tukar kembali ke persekitaran pembangunan
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

Apabila anda selesai bereksperimen, bersihkan untuk mengelakkan caj berterusan:

```bash
# Padam semua sumber Azure untuk persekitaran semasa
azd down

# Paksa padam tanpa pengesahan dan hapus sumber yang dipadamkan secara lembut
azd down --force --purge

# Padam persekitaran tertentu
azd env select staging
azd down --force --purge
```

## Apa yang Anda Pelajari

Tahniah! Anda telah berjaya:
- ✅ Memulakan projek azd daripada templat
- ✅ Menerokai struktur projek dan fail utama
- ✅ Melancarkan aplikasi full-stack ke Azure
- ✅ Membuat perubahan kod dan melancarkan semula
- ✅ Menguruskan pelbagai persekitaran
- ✅ Membersihkan sumber

## 🎯 Latihan Pengesahan Kemahiran

### Latihan 1: Lancarkan Templat Berbeza (15 minit)
**Matlamat**: Menunjukkan penguasaan aliran kerja azd init dan pelancaran

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
- [ ] Aplikasi dilancarkan tanpa ralat
- [ ] Boleh mengakses URL aplikasi dalam pelayar
- [ ] Aplikasi berfungsi dengan betul (tambah/padam todo)
- [ ] Berjaya membersihkan semua sumber

### Latihan 2: Sesuaikan Konfigurasi (20 minit)
**Matlamat**: Berlatih konfigurasi pembolehubah persekitaran

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
- [ ] Pembolehubah persekitaran ditetapkan dan boleh diambil
- [ ] Aplikasi dilancarkan dengan konfigurasi tersuai
- [ ] Boleh mengesahkan tetapan tersuai dalam aplikasi yang dilancarkan

### Latihan 3: Aliran Kerja Pelbagai Persekitaran (25 minit)
**Matlamat**: Menguasai pengurusan persekitaran dan strategi pelancaran

```bash
# Cipta persekitaran pembangunan
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Catat URL pembangunan
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Cipta persekitaran pementasan
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Catat URL pementasan
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
- [ ] Dua persekitaran dicipta dengan konfigurasi berbeza
- [ ] Kedua-dua persekitaran berjaya dilancarkan
- [ ] Boleh bertukar antara persekitaran menggunakan `azd env select`
- [ ] Pembolehubah persekitaran berbeza antara persekitaran
- [ ] Berjaya membersihkan kedua-dua persekitaran

## 📊 Kemajuan Anda

**Masa Dilaburkan**: ~60-90 minit  
**Kemahiran Diperoleh**:
- ✅ Inisialisasi projek berasaskan templat
- ✅ Penyediaan sumber Azure
- ✅ Aliran kerja pelancaran aplikasi
- ✅ Pengurusan persekitaran
- ✅ Pengurusan konfigurasi
- ✅ Pembersihan sumber dan pengurusan kos

**Tahap Seterusnya**: Anda bersedia untuk [Panduan Konfigurasi](configuration.md) untuk mempelajari corak konfigurasi lanjutan!

## Menyelesaikan Masalah Biasa

### Ralat Pengesahan
```bash
# Sahkan semula dengan Azure
az login

# Sahkan akses langganan
az account show
```

### Kegagalan Pelancaran
```bash
# Aktifkan log debug
export AZD_DEBUG=true
azd up --debug

# Lihat log terperinci
azd logs --service api
azd logs --service web
```

### Konflik Nama Sumber
```bash
# Gunakan nama persekitaran yang unik
azd env new dev-$(whoami)-$(date +%s)
```

### Isu Port/Rangkaian
```bash
# Periksa jika port tersedia
netstat -an | grep :3000
netstat -an | grep :3100
```

## Langkah Seterusnya

Sekarang setelah anda melengkapkan projek pertama anda, terokai topik lanjutan ini:

### 1. Sesuaikan Infrastruktur
- [Infrastruktur sebagai Kod](../deployment/provisioning.md)
- [Tambah pangkalan data, storan, dan perkhidmatan lain](../deployment/provisioning.md#adding-services)

### 2. Sediakan CI/CD
- [Integrasi GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Amalan Terbaik Pengeluaran
- [Konfigurasi keselamatan](../deployment/best-practices.md#security)
- [Pengoptimuman prestasi](../deployment/best-practices.md#performance)
- [Pemantauan dan log](../deployment/best-practices.md#monitoring)

### 4. Terokai Lebih Banyak Templat
```bash
# Semak templat mengikut kategori
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Cuba timbunan teknologi yang berbeza
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Sumber Tambahan

### Bahan Pembelajaran
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pusat Seni Bina Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kerangka Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komuniti & Sokongan
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Komuniti Pembangun Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templat & Contoh
- [Galeri Templat Rasmi](https://azure.github.io/awesome-azd/)
- [Templat Komuniti](https://github.com/Azure-Samples/azd-templates)
- [Corak Perusahaan](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Tahniah kerana melengkapkan projek azd pertama anda!** Anda kini bersedia untuk membina dan melancarkan aplikasi hebat di Azure dengan yakin.

---

**Navigasi Bab:**
- **📚 Halaman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Permulaan Pantas
- **⬅️ Sebelumnya**: [Pemasangan & Persediaan](installation.md)
- **➡️ Seterusnya**: [Konfigurasi](configuration.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan Berasaskan AI](../microsoft-foundry/microsoft-foundry-integration.md)
- **Pelajaran Seterusnya**: [Panduan Pelancaran](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->