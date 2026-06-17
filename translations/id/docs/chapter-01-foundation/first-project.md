# Proyek Pertama Anda - Tutorial Praktis

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 1 - Dasar & Mulai Cepat
- **⬅️ Sebelumnya**: [Installation & Setup](installation.md)
- **➡️ Berikutnya**: [Configuration](configuration.md)
- **🚀 Bab Berikutnya**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Pendahuluan

Selamat datang di proyek Azure Developer CLI pertama Anda! Tutorial praktis komprehensif ini memberikan panduan lengkap membuat, menerapkan, dan mengelola aplikasi full-stack di Azure menggunakan azd. Anda akan bekerja dengan aplikasi todo nyata yang mencakup frontend React, backend API Node.js, dan database MongoDB.

## Tujuan Pembelajaran

Dengan menyelesaikan tutorial ini, Anda akan:
- Menguasai alur kerja inisialisasi proyek azd menggunakan template
- Memahami struktur proyek dan file konfigurasi Azure Developer CLI
- Menjalankan penyebaran aplikasi lengkap ke Azure dengan penyediaan infrastruktur
- Menerapkan strategi pembaruan dan penerapan ulang aplikasi
- Mengelola beberapa lingkungan untuk pengembangan dan staging
- Menerapkan praktik pembersihan sumber daya dan pengelolaan biaya

## Hasil Pembelajaran

Setelah menyelesaikan, Anda akan mampu:
- Menginisialisasi dan mengonfigurasi proyek azd dari template secara mandiri
- Menavigasi dan memodifikasi struktur proyek azd secara efektif
- Mendeploy aplikasi full-stack ke Azure dengan perintah tunggal
- Memecahkan masalah penyebaran umum dan masalah autentikasi
- Mengelola beberapa lingkungan Azure untuk berbagai tahap penyebaran
- Menerapkan alur kerja pengiriman berkelanjutan untuk pembaruan aplikasi

## Memulai

### Daftar Periksa Prasyarat
- ✅ Azure Developer CLI terpasang ([Installation Guide](installation.md))
- ✅ Autentikasi AZD selesai dengan `azd auth login`
- ✅ Git terpasang di sistem Anda
- ✅ Node.js 16+ (untuk tutorial ini)
- ✅ Visual Studio Code (direkomendasikan)

Sebelum melanjutkan, jalankan validator pengaturan dari root repositori:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verifikasi Pengaturan Anda
```bash
# Periksa instalasi azd
azd version

# Periksa autentikasi AZD
azd auth login --check-status
```

### Verifikasi autentikasi Azure CLI (opsional)

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
# Jelajahi templat yang tersedia
azd template list

# Inisialisasi templat aplikasi todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Ikuti petunjuk:
# - Masukkan nama lingkungan: "dev"
# - Pilih langganan (jika Anda memiliki beberapa)
# - Pilih wilayah: "East US 2" (atau wilayah pilihan Anda)
```

### Apa yang Baru Saja Terjadi?
- Mengunduh kode template ke direktori lokal Anda
- Membuat file `azure.yaml` dengan definisi layanan
- Menyiapkan kode infrastruktur di direktori `infra/`
- Membuat konfigurasi lingkungan

## Langkah 2: Jelajahi Struktur Proyek

Mari periksa apa yang dibuat azd untuk kita:

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

### File Kunci yang Perlu Dipahami

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

### Ubah Frontend
```bash
# Buka komponen aplikasi React
code src/web/src/App.tsx
```

Lakukan perubahan sederhana:
```typescript
// Temukan judulnya dan ubah
<h1>My Awesome Todo App</h1>
```

### Konfigurasi Variabel Lingkungan
```bash
# Tetapkan variabel lingkungan khusus
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Lihat semua variabel lingkungan
azd env get-values
```

## Langkah 4: Terapkan ke Azure

Sekarang bagian yang menyenangkan - terapkan semuanya ke Azure!

```bash
# Menyebarkan infrastruktur dan aplikasi
azd up

# Perintah ini akan:
# 1. Menyediakan sumber daya Azure (App Service, Cosmos DB, dll.)
# 2. Membangun aplikasi Anda
# 3. Menyebarkan ke sumber daya yang telah disediakan
# 4. Menampilkan URL aplikasi
```

### Apa yang Terjadi Saat Penyebaran?

Perintah `azd up` melakukan langkah-langkah ini:
1. **Penyediaan** (`azd provision`) - Membuat sumber daya Azure
2. **Pengemasan** - Membangun kode aplikasi Anda
3. **Penyebaran** (`azd deploy`) - Menerapkan kode ke sumber daya Azure

### Keluaran yang Diharapkan
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
Klik pada URL yang diberikan di keluaran penyebaran, atau dapatkan kapan saja:
```bash
# Dapatkan endpoint aplikasi
azd show

# Buka aplikasi di browser Anda
azd show --output json | jq -r '.services.web.endpoint'
```

### Uji Aplikasi Todo
1. **Tambahkan item todo** - Klik "Add Todo" dan masukkan tugas
2. **Tandai sebagai selesai** - Centang item yang selesai
3. **Hapus item** - Hapus todo yang tidak lagi Anda perlukan

### Pantau Aplikasi Anda
```bash
# Buka portal Azure untuk sumber daya Anda
azd monitor

# Lihat log aplikasi
azd monitor --logs

# Lihat metrik langsung
azd monitor --live
```

### ✅ Verifikasi Penyebaran Anda

Sebelum melanjutkan, jalankan daftar periksa singkat ini untuk memastikan semuanya benar-benar berfungsi—jangan menganggap "deploy succeeded" berarti "app works":

```bash
# 1. Konfirmasi endpoint ada dan dapat dijangkau
azd show

# 2. Lakukan pengujian cepat pada endpoint (mengharapkan HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Periksa endpoint kesehatan jika aplikasi Anda menyediakan satu
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Penyebaran diverifikasi ketika:**
- ✅ `azd show` menampilkan URL endpoint yang dapat dijangkau
- ✅ URL terbuka di browser Anda tanpa error
- ✅ Fitur inti berfungsi (tambah/tandai/hapus todo)
- ✅ `azd monitor --logs` menampilkan permintaan yang masuk tanpa kesalahan tak terduga

Jika ada pemeriksaan yang gagal, lompat ke [Bab 7: Pemecahan Masalah](../chapter-07-troubleshooting/README.md).

## Langkah 6: Lakukan Perubahan dan Terapkan Ulang

Mari buat perubahan dan lihat betapa mudahnya memperbarui:

### Ubah API
```bash
# Sunting kode API
code src/api/src/routes/lists.js
```

Tambahkan header respons kustom:
```javascript
// Temukan handler rute dan tambahkan:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Terapkan Hanya Perubahan Kode
```bash
# Terapkan hanya kode aplikasi (lewati infrastruktur)
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

# Tampilkan semua lingkungan
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

Setelah selesai bereksperimen, bersihkan untuk menghindari biaya berkelanjutan:

```bash
# Hapus semua sumber daya Azure untuk lingkungan saat ini
azd down

# Paksa hapus tanpa konfirmasi dan hapus secara permanen sumber daya yang dihapus sementara
azd down --force --purge

# Hapus lingkungan tertentu
azd env select staging
azd down --force --purge
```

## Aplikasi Klasik vs. Aplikasi Berbasis AI: Alur Kerja yang Sama

Anda baru saja menerapkan aplikasi web tradisional. Tetapi bagaimana jika Anda ingin menerapkan aplikasi bertenaga AI—misalnya, aplikasi chat yang didukung oleh Microsoft Foundry Models?

Kabar baik: **alur kerjanya identik.**

| Langkah | Aplikasi Todo Klasik | Aplikasi Chat AI |
|------|-----------------|-------------|
| Inisialisasi | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentikasi | `azd auth login` | `azd auth login` |
| Terapkan | `azd up` | `azd up` |
| Pantau | `azd monitor` | `azd monitor` |
| Bersihkan | `azd down --force --purge` | `azd down --force --purge` |

Satu-satunya perbedaan adalah **template** yang Anda mulai. Template AI menyertakan infrastruktur tambahan (seperti sumber daya Microsoft Foundry Models atau indeks Pencarian AI), tetapi azd menangani semua itu untuk Anda. Anda tidak perlu mempelajari perintah baru, mengadopsi alat berbeda, atau mengubah cara berpikir tentang penyebaran.

Inilah prinsip inti azd: **satu alur kerja, untuk segala beban kerja.** Keterampilan yang Anda latih dalam tutorial ini—menginisialisasi, menerapkan, memantau, menerapkan ulang, dan membersihkan—berlaku sama untuk aplikasi dan agen AI.

---

## Apa yang Telah Anda Pelajari

Selamat! Anda telah berhasil:
- ✅ Menginisialisasi proyek azd dari template
- ✅ Menjelajahi struktur proyek dan file kunci
- ✅ Menerapkan aplikasi full-stack ke Azure
- ✅ Membuat perubahan kode dan menerapkan ulang
- ✅ Mengelola beberapa lingkungan
- ✅ Membersihkan sumber daya

## 🎯 Latihan Validasi Keterampilan

### Latihan 1: Terapkan Template Berbeda (15 menit)
**Tujuan**: Mendemonstrasikan penguasaan azd init dan alur kerja penyebaran

```bash
# Coba stack Python + MongoDB
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
- [ ] Aplikasi terdeploy tanpa error
- [ ] Dapat mengakses URL aplikasi di browser
- [ ] Aplikasi berfungsi dengan benar (tambah/hapus todo)
- [ ] Berhasil membersihkan semua sumber daya

### Latihan 2: Sesuaikan Konfigurasi (20 menit)
**Tujuan**: Latihan konfigurasi variabel lingkungan

```bash
cd my-first-azd-app

# Buat lingkungan kustom
azd env new custom-config

# Atur variabel kustom
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verifikasi variabel
azd env get-values | grep APP_TITLE

# Terapkan dengan konfigurasi kustom
azd up
```

**Kriteria Keberhasilan:**
- [ ] Lingkungan kustom berhasil dibuat
- [ ] Variabel lingkungan disetel dan dapat diambil
- [ ] Aplikasi dideploy dengan konfigurasi kustom
- [ ] Dapat memverifikasi pengaturan kustom di aplikasi yang dideploy

### Latihan 3: Alur Kerja Multi-Lingkungan (25 menit)
**Tujuan**: Menguasai manajemen lingkungan dan strategi penyebaran

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

# Bersihkan kedua lingkungan
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kriteria Keberhasilan:**
- [ ] Dua lingkungan dibuat dengan konfigurasi berbeda
- [ ] Kedua lingkungan berhasil dideploy
- [ ] Dapat beralih antar lingkungan menggunakan `azd env select`
- [ ] Variabel lingkungan berbeda antar lingkungan
- [ ] Berhasil membersihkan kedua lingkungan

## 📊 Kemajuan Anda

**Waktu yang Dihabiskan**: ~60-90 menit  
**Keterampilan yang Diperoleh**:
- ✅ Inisialisasi proyek berbasis template
- ✅ Penyediaan sumber daya Azure
- ✅ Alur kerja penyebaran aplikasi
- ✅ Manajemen lingkungan
- ✅ Manajemen konfigurasi
- ✅ Pembersihan sumber daya dan pengelolaan biaya

**Tingkat Berikutnya**: Anda siap untuk [Configuration Guide](configuration.md) untuk mempelajari pola konfigurasi tingkat lanjut!

## Pemecahan Masalah Umum

### Kesalahan Autentikasi
```bash
# Autentikasi ulang dengan Azure
az login

# Verifikasi akses langganan
az account show
```

### Kegagalan Penyebaran
```bash
# Aktifkan pencatatan debug
export AZD_DEBUG=true
azd up --debug

# Lihat log aplikasi di Azure
azd monitor --logs

# Untuk Container Apps, gunakan Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
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

Sekarang setelah Anda menyelesaikan proyek pertama, jelajahi topik tingkat lanjut ini:

### 1. Sesuaikan Infrastruktur
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Tambahkan database, penyimpanan, dan layanan lainnya](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Siapkan CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Alur kerja CI/CD lengkap
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfigurasi pipeline

### 3. Praktik Terbaik Produksi
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Keamanan, performa, dan pemantauan

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
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunitas & Dukungan
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Template & Contoh
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Selamat telah menyelesaikan proyek azd pertama Anda!** Sekarang Anda siap membangun dan menerapkan aplikasi luar biasa di Azure dengan percaya diri.

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 1 - Dasar & Mulai Cepat
- **⬅️ Sebelumnya**: [Installation & Setup](installation.md)
- **➡️ Berikutnya**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Bab Berikutnya**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->