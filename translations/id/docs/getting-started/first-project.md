<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-22T09:17:50+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "id"
}
-->
# Proyek Pertama Anda - Tutorial Praktis

**Navigasi Bab:**
- **📚 Halaman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 1 - Dasar & Mulai Cepat
- **⬅️ Sebelumnya**: [Instalasi & Pengaturan](installation.md)
- **➡️ Selanjutnya**: [Konfigurasi](configuration.md)
- **🚀 Bab Selanjutnya**: [Bab 2: Pengembangan Berbasis AI](../microsoft-foundry/microsoft-foundry-integration.md)

## Pendahuluan

Selamat datang di proyek pertama Anda dengan Azure Developer CLI! Tutorial praktis ini memberikan panduan lengkap untuk membuat, menerapkan, dan mengelola aplikasi full-stack di Azure menggunakan azd. Anda akan bekerja dengan aplikasi todo nyata yang mencakup frontend React, backend API Node.js, dan database MongoDB.

## Tujuan Pembelajaran

Dengan menyelesaikan tutorial ini, Anda akan:
- Menguasai alur kerja inisialisasi proyek azd menggunakan template
- Memahami struktur proyek dan file konfigurasi Azure Developer CLI
- Melakukan penerapan aplikasi lengkap ke Azure dengan penyediaan infrastruktur
- Menerapkan pembaruan aplikasi dan strategi penerapan ulang
- Mengelola beberapa lingkungan untuk pengembangan dan staging
- Menerapkan praktik pembersihan sumber daya dan manajemen biaya

## Hasil Pembelajaran

Setelah selesai, Anda akan dapat:
- Menginisialisasi dan mengonfigurasi proyek azd dari template secara mandiri
- Menavigasi dan memodifikasi struktur proyek azd dengan efektif
- Menerapkan aplikasi full-stack ke Azure dengan perintah tunggal
- Memecahkan masalah umum penerapan dan autentikasi
- Mengelola beberapa lingkungan Azure untuk berbagai tahap penerapan
- Menerapkan alur kerja penerapan berkelanjutan untuk pembaruan aplikasi

## Memulai

### Daftar Prasyarat
- ✅ Azure Developer CLI terinstal ([Panduan Instalasi](installation.md))
- ✅ Azure CLI terinstal dan terautentikasi
- ✅ Git terinstal di sistem Anda
- ✅ Node.js 16+ (untuk tutorial ini)
- ✅ Visual Studio Code (disarankan)

### Verifikasi Pengaturan Anda
```bash
# Periksa instalasi azd
azd version
```
### Verifikasi autentikasi Azure

```bash
az account show
```

### Periksa versi Node.js
```bash
node --version
```

## Langkah 1: Pilih dan Inisialisasi Template

Mari mulai dengan template aplikasi todo populer yang mencakup frontend React dan backend API Node.js.

```bash
# Jelajahi template yang tersedia
azd template list

# Inisialisasi template aplikasi todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Ikuti petunjuk:
# - Masukkan nama lingkungan: "dev"
# - Pilih langganan (jika Anda memiliki beberapa)
# - Pilih wilayah: "East US 2" (atau wilayah pilihan Anda)
```

### Apa yang Baru Saja Terjadi?
- Template kode diunduh ke direktori lokal Anda
- File `azure.yaml` dibuat dengan definisi layanan
- Kode infrastruktur disiapkan di direktori `infra/`
- Konfigurasi lingkungan dibuat

## Langkah 2: Jelajahi Struktur Proyek

Mari kita periksa apa yang telah dibuat oleh azd untuk kita:

```bash
# Lihat struktur proyek
tree /f   # Windows
# atau
find . -type f | head -20   # macOS/Linux
```

Anda seharusnya melihat:
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

### File Utama yang Perlu Dipahami

**azure.yaml** - Inti dari proyek azd Anda:
```bash
# Lihat konfigurasi proyek
cat azure.yaml
```

**infra/main.bicep** - Definisi infrastruktur:
```bash
# Lihat kode infrastruktur
head -30 infra/main.bicep
```

## Langkah 3: Sesuaikan Proyek Anda (Opsional)

Sebelum menerapkan, Anda dapat menyesuaikan aplikasi:

### Modifikasi Frontend
```bash
# Buka komponen aplikasi React
code src/web/src/App.tsx
```

Lakukan perubahan sederhana:
```typescript
// Temukan judul dan ubah itu
<h1>My Awesome Todo App</h1>
```

### Konfigurasi Variabel Lingkungan
```bash
# Atur variabel lingkungan khusus
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Lihat semua variabel lingkungan
azd env get-values
```

## Langkah 4: Terapkan ke Azure

Sekarang bagian yang menarik - terapkan semuanya ke Azure!

```bash
# Menerapkan infrastruktur dan aplikasi
azd up

# Perintah ini akan:
# 1. Menyediakan sumber daya Azure (App Service, Cosmos DB, dll.)
# 2. Membangun aplikasi Anda
# 3. Menerapkan ke sumber daya yang telah disediakan
# 4. Menampilkan URL aplikasi
```

### Apa yang Terjadi Selama Penerapan?

Perintah `azd up` melakukan langkah-langkah berikut:
1. **Provision** (`azd provision`) - Membuat sumber daya Azure
2. **Package** - Membangun kode aplikasi Anda
3. **Deploy** (`azd deploy`) - Menerapkan kode ke sumber daya Azure

### Output yang Diharapkan
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
Klik URL yang disediakan dalam output penerapan, atau dapatkan kapan saja:
```bash
# Dapatkan endpoint aplikasi
azd show

# Buka aplikasi di browser Anda
azd show --output json | jq -r '.services.web.endpoint'
```

### Uji Aplikasi Todo
1. **Tambahkan item todo** - Klik "Add Todo" dan masukkan tugas
2. **Tandai sebagai selesai** - Centang item yang telah selesai
3. **Hapus item** - Hapus todo yang tidak lagi Anda perlukan

### Pantau Aplikasi Anda
```bash
# Buka portal Azure untuk sumber daya Anda
azd monitor

# Lihat log aplikasi
azd logs
```

## Langkah 6: Lakukan Perubahan dan Terapkan Ulang

Mari lakukan perubahan dan lihat betapa mudahnya memperbarui:

### Modifikasi API
```bash
# Edit kode API
code src/api/src/routes/lists.js
```

Tambahkan header respons khusus:
```javascript
// Temukan pengelola rute dan tambahkan:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Terapkan Hanya Perubahan Kode
```bash
# Hanya terapkan kode aplikasi (lewati infrastruktur)
azd deploy

# Ini jauh lebih cepat daripada 'azd up' karena infrastruktur sudah ada
```

## Langkah 7: Kelola Beberapa Lingkungan

Buat lingkungan staging untuk menguji perubahan sebelum produksi:

```bash
# Buat lingkungan staging baru
azd env new staging

# Deploy ke staging
azd up

# Beralih kembali ke lingkungan dev
azd env select dev

# Daftar semua lingkungan
azd env list
```

### Perbandingan Lingkungan
```bash
# Lihat lingkungan pengembangan
azd env select dev
azd show

# Lihat lingkungan staging
azd env select staging
azd show
```

## Langkah 8: Bersihkan Sumber Daya

Ketika Anda selesai bereksperimen, bersihkan untuk menghindari biaya yang terus berjalan:

```bash
# Hapus semua sumber daya Azure untuk lingkungan saat ini
azd down

# Hapus paksa tanpa konfirmasi dan bersihkan sumber daya yang dihapus sementara
azd down --force --purge

# Hapus lingkungan tertentu
azd env select staging
azd down --force --purge
```

## Apa yang Telah Anda Pelajari

Selamat! Anda telah berhasil:
- ✅ Menginisialisasi proyek azd dari template
- ✅ Menjelajahi struktur proyek dan file utama
- ✅ Menerapkan aplikasi full-stack ke Azure
- ✅ Melakukan perubahan kode dan menerapkan ulang
- ✅ Mengelola beberapa lingkungan
- ✅ Membersihkan sumber daya

## 🎯 Latihan Validasi Keterampilan

### Latihan 1: Terapkan Template Berbeda (15 menit)
**Tujuan**: Menunjukkan penguasaan alur kerja inisialisasi dan penerapan azd

```bash
# Coba tumpukan Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verifikasi penyebaran
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Bersihkan
azd down --force --purge
```

**Kriteria Keberhasilan:**
- [ ] Aplikasi diterapkan tanpa kesalahan
- [ ] Dapat mengakses URL aplikasi di browser
- [ ] Aplikasi berfungsi dengan benar (tambah/hapus todo)
- [ ] Berhasil membersihkan semua sumber daya

### Latihan 2: Sesuaikan Konfigurasi (20 menit)
**Tujuan**: Berlatih konfigurasi variabel lingkungan

```bash
cd my-first-azd-app

# Buat lingkungan khusus
azd env new custom-config

# Atur variabel khusus
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verifikasi variabel
azd env get-values | grep APP_TITLE

# Terapkan dengan konfigurasi khusus
azd up
```

**Kriteria Keberhasilan:**
- [ ] Lingkungan khusus berhasil dibuat
- [ ] Variabel lingkungan diatur dan dapat diambil
- [ ] Aplikasi diterapkan dengan konfigurasi khusus
- [ ] Dapat memverifikasi pengaturan khusus di aplikasi yang diterapkan

### Latihan 3: Alur Kerja Multi-Lingkungan (25 menit)
**Tujuan**: Menguasai manajemen lingkungan dan strategi penerapan

```bash
# Buat lingkungan pengembangan
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Catat URL pengembangan
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Buat lingkungan staging
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Catat URL staging
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Bandingkan lingkungan
azd env list

# Uji kedua lingkungan
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Bersihkan keduanya
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kriteria Keberhasilan:**
- [ ] Dua lingkungan dibuat dengan konfigurasi berbeda
- [ ] Kedua lingkungan berhasil diterapkan
- [ ] Dapat beralih antara lingkungan menggunakan `azd env select`
- [ ] Variabel lingkungan berbeda antara lingkungan
- [ ] Berhasil membersihkan kedua lingkungan

## 📊 Kemajuan Anda

**Waktu yang Diinvestasikan**: ~60-90 menit  
**Keterampilan yang Diperoleh**:
- ✅ Inisialisasi proyek berbasis template
- ✅ Penyediaan sumber daya Azure
- ✅ Alur kerja penerapan aplikasi
- ✅ Manajemen lingkungan
- ✅ Manajemen konfigurasi
- ✅ Pembersihan sumber daya dan manajemen biaya

**Tingkat Selanjutnya**: Anda siap untuk [Panduan Konfigurasi](configuration.md) untuk mempelajari pola konfigurasi lanjutan!

## Memecahkan Masalah Umum

### Kesalahan Autentikasi
```bash
# Autentikasi ulang dengan Azure
az login

# Verifikasi akses langganan
az account show
```

### Kegagalan Penerapan
```bash
# Aktifkan pencatatan debug
export AZD_DEBUG=true
azd up --debug

# Lihat log terperinci
azd logs --service api
azd logs --service web
```

### Konflik Nama Sumber Daya
```bash
# Gunakan nama lingkungan yang unik
azd env new dev-$(whoami)-$(date +%s)
```

### Masalah Port/Jaringan
```bash
# Periksa apakah port tersedia
netstat -an | grep :3000
netstat -an | grep :3100
```

## Langkah Selanjutnya

Sekarang setelah Anda menyelesaikan proyek pertama Anda, jelajahi topik lanjutan berikut:

### 1. Sesuaikan Infrastruktur
- [Infrastruktur sebagai Kode](../deployment/provisioning.md)
- [Tambahkan database, penyimpanan, dan layanan lainnya](../deployment/provisioning.md#adding-services)

### 2. Siapkan CI/CD
- [Integrasi GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Praktik Terbaik Produksi
- [Konfigurasi keamanan](../deployment/best-practices.md#security)
- [Optimasi kinerja](../deployment/best-practices.md#performance)
- [Pemantauan dan logging](../deployment/best-practices.md#monitoring)

### 4. Jelajahi Lebih Banyak Template
```bash
# Jelajahi template berdasarkan kategori
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Coba berbagai tumpukan teknologi
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Sumber Daya Tambahan

### Materi Pembelajaran
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pusat Arsitektur Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kerangka Kerja Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunitas & Dukungan
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Komunitas Pengembang Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Template & Contoh
- [Galeri Template Resmi](https://azure.github.io/awesome-azd/)
- [Template Komunitas](https://github.com/Azure-Samples/azd-templates)
- [Pola Perusahaan](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Selamat atas penyelesaian proyek azd pertama Anda!** Anda sekarang siap untuk membangun dan menerapkan aplikasi luar biasa di Azure dengan percaya diri.

---

**Navigasi Bab:**
- **📚 Halaman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 1 - Dasar & Mulai Cepat
- **⬅️ Sebelumnya**: [Instalasi & Pengaturan](installation.md)
- **➡️ Selanjutnya**: [Konfigurasi](configuration.md)
- **🚀 Bab Selanjutnya**: [Bab 2: Pengembangan Berbasis AI](../microsoft-foundry/microsoft-foundry-integration.md)
- **Pelajaran Selanjutnya**: [Panduan Penerapan](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk memberikan hasil yang akurat, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan manusia profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau interpretasi yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->