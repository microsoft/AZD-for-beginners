# Proyek Pertamamu - Tutorial Praktis

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 1 - Dasar & Mulai Cepat
- **⬅️ Sebelumnya**: [Instalasi & Pengaturan](installation.md)
- **➡️ Berikutnya**: [Bawa Aplikasimu Sendiri](bring-your-own-app.md)
- **🚀 Bab Berikutnya**: [Bab 2: Pengembangan Berbasis AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Pendahuluan

Selamat datang di proyek Azure Developer CLI pertamamu! Kamu akan menyebarkan aplikasi todo dengan frontend React, API Node.js, dan Azure Cosmos DB. Template ini mempertahankan nama historis `todo-nodejs-mongo`; infrastrukturnya saat ini menggunakan Cosmos DB untuk NoSQL, jadi periksa README dan `infra/` yang diunduh daripada menyimpulkan API database dari nama tersebut.

> Ditinjau terhadap `azd 1.37.2` dan template publik pada November 2026. Contoh di bawah menggunakan Bash; ekstraksi JSON juga memerlukan `jq`. Penyebaran di Azure dikenakan biaya dan tidak dijalankan selama tinjauan ini.

## Tujuan Pembelajaran

Dengan menyelesaikan tutorial ini, kamu akan:
- Menguasai alur kerja inisialisasi proyek azd menggunakan template
- Memahami struktur proyek Azure Developer CLI dan file konfigurasi
- Menjalankan penyebaran aplikasi lengkap ke Azure dengan penyediaan infrastruktur
- Menerapkan pembaruan aplikasi dan strategi penyebaran ulang
- Mengelola beberapa lingkungan untuk pengembangan dan staging
- Menerapkan praktik pembersihan sumber daya dan manajemen biaya

## Hasil Pembelajaran

Setelah selesai, kamu akan mampu:
- Menginisialisasi dan mengkonfigurasi proyek azd dari template secara mandiri
- Menavigasi dan memodifikasi struktur proyek azd secara efektif
- Menyebarkan aplikasi full-stack ke Azure dengan perintah tunggal
- Memecahkan masalah umum penyebaran dan masalah autentikasi
- Mengelola beberapa lingkungan Azure untuk tahap penyebaran berbeda
- Menerapkan alur kerja penyebaran berkelanjutan untuk pembaruan aplikasi

## Memulai

### Daftar Periksa Prasyarat
- ✅ Azure Developer CLI terpasang ([Panduan Instalasi](installation.md))
- ✅ Autentikasi AZD selesai dengan `azd auth login`
- ✅ Git terpasang di sistemmu
- ✅ Node.js 22 LTS (atau versi yang didukung oleh template yang diunduh)
- ✅ Visual Studio Code (disarankan)

Sebelum melanjutkan, jalankan validator pengaturan dari direktori root repositori:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verifikasi Pengaturanmu
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Verifikasi autentikasi Azure CLI opsional

```bash
az account show
```

### Cek versi Node.js
```bash
node --version
```

## Langkah 1: Pilih dan Inisialisasi Template

Mari mulai dengan template aplikasi todo populer yang mencakup frontend React dan backend API Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Apa yang Baru Saja Terjadi?
- Mengunduh kode template ke direktori lokalmu
- Membuat file `azure.yaml` dengan definisi layanan
- Menyiapkan kode infrastruktur di direktori `infra/`
- Membuat konfigurasi lingkungan

## Langkah 2: Jelajahi Struktur Proyek

Mari kita lihat apa yang telah azd buat untuk kita:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Kamu harus melihat:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### File Penting yang Perlu Dipahami

**azure.yaml** - Inti dari proyek azd-mu:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Definisi infrastruktur:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Langkah 3: Sesuaikan Proyekmu (Opsional)

Sebelum menyebarkan, kamu dapat menyesuaikan aplikasi:

### Ubah Frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Lakukan perubahan sederhana:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Konfigurasi Variabel Lingkungan
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Dua nilai kustom ini hanya menunjukkan penyimpanan lokal. Template stok tidak menggunakan `WEBSITE_TITLE` atau `API_VERSION`, jadi mereka tidak mengubah aplikasi. Edit sumber eksplisit di atas mengubah judul yang ditampilkan.

## Langkah 4: Sebarkan ke Azure

Sekarang bagian yang menyenangkan - menyebarkan semuanya ke Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Apa yang Terjadi Saat Penyebaran?

Alur kerja menyediakan infrastruktur dan mengemas/menyebarkan kode. Urutan tepat dapat disesuaikan melalui `workflows.up` dalam `azure.yaml`; template ini menentukan penyediaan diikuti dengan penyebaran. Jangan mengandalkan satu urutan fase universal untuk setiap template.

### Output yang Diharapkan
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Langkah 5: Uji Aplikasimu

### Akses Aplikasimu
Klik pada URL yang diberikan di output penyebaran, atau dapatkan kapan saja:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Uji Aplikasi Todo
1. **Tambah item todo** - Klik "Add Todo" dan masukkan tugas
2. **Tandai selesai** - Centang item yang sudah selesai
3. **Hapus item** - Hapus todo yang tidak kamu butuhkan lagi

### Pantau Aplikasimu
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Verifikasi Penyebaranmu

Sebelum melanjutkan, jalankan daftar periksa cepat ini untuk memastikan semuanya benar-benar berfungsi—jangan mengira "penyebaran berhasil" berarti "aplikasi berfungsi":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Penyebaran terverifikasi ketika:**
- ✅ `azd show` menampilkan URL endpoint yang dapat dijangkau
- ✅ URL terbuka di browser tanpa kesalahan
- ✅ Fitur inti berfungsi (tambah/selesaikan/hapus todo)
- ✅ `azd monitor --logs` menunjukkan permintaan tiba tanpa kesalahan tak terduga

Jika ada pemeriksaan yang gagal, lompat ke [Bab 7: Pemecahan Masalah](../chapter-07-troubleshooting/README.md).

## Langkah 6: Buat Perubahan dan Sebarkan Ulang

Mari buat perubahan dan lihat betapa mudahnya memperbarui:

### Ubah API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Tambahkan header respons kustom:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Sebarkan Hanya Perubahan Kode
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Langkah 7: Kelola Beberapa Lingkungan

Buat lingkungan staging untuk menguji perubahan sebelum produksi:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Perbandingan Lingkungan
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Langkah 8: Bersihkan Sumber Daya

Setelah selesai bereksperimen, bersihkan untuk menghindari biaya berkelanjutan:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Aplikasi Klasik vs. Aplikasi Berbasis AI: Alur Kerja yang Sama

Kamu baru saja menyebarkan aplikasi web tradisional. Tapi bagaimana jika kamu ingin menyebarkan aplikasi berbasis AI—misalnya, aplikasi chat yang didukung oleh Microsoft Foundry Models?

Kabar baik: **alur kerjanya identik.**

| Langkah | Aplikasi Todo Klasik | Aplikasi Chat AI |
|------|-----------------|-------------|
| Inisialisasi (direktori kosong) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Autentikasi | `azd auth login` | `azd auth login` |
| Penyebaran | `azd up` | `azd up` |
| Pantau | `azd monitor` | `azd monitor` |
| Bersihkan | `azd down --force --purge` | `azd down --force --purge` |

Perintah siklus hidupnya sama, tapi prasyaratnya berbeda. Template AI bisa memerlukan akses model, kuota regional, pengambilan data, dan konfigurasi tambahan. Baca README-nya sebelum penyebaran; `azd up` tidak dapat menyediakan izin atau kuota yang hilang.

Ini adalah prinsip inti azd: **satu alur kerja, semua beban kerja.** Keterampilan yang kamu latih di tutorial ini—inisisasi, penyebaran, pemantauan, penyebaran ulang, dan pembersihan—berlaku sama untuk aplikasi dan agen AI.

---

## Apa yang Kamu Pelajari

Selamat! Kamu telah berhasil:
- ✅ Menginisialisasi proyek azd dari template
- ✅ Menjelajahi struktur proyek dan file penting
- ✅ Menyebarkan aplikasi full-stack ke Azure
- ✅ Membuat perubahan kode dan menyebarkan ulang
- ✅ Mengelola beberapa lingkungan
- ✅ Membersihkan sumber daya

## 🎯 Latihan Validasi Keterampilan

### Latihan 1: Sebarkan Template Berbeda (15 menit)
**Tujuan**: Tunjukkan penguasaan azd init dan alur kerja penyebaran

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Kriteria Keberhasilan:**
- [ ] Aplikasi terselesaikan tanpa kesalahan
- [ ] Bisa mengakses URL aplikasi di browser
- [ ] Aplikasi berfungsi dengan benar (tambah/hapus todo)
- [ ] Berhasil membersihkan semua sumber daya

### Latihan 2: Sesuaikan Konfigurasi (20 menit)
**Tujuan**: Latih penyimpanan nilai lingkungan lokal tanpa menganggapnya sebagai konfigurasi runtime

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Kriteria Keberhasilan:**
- [ ] Lingkungan kustom berhasil dibuat
- [ ] Variabel lingkungan disetel dan dapat diambil
- [ ] `azd env get-value APP_TITLE` mencetak `My Custom Todo App`
- [ ] Bisa menjelaskan mengapa nilai ini tidak mengubah aplikasi stok kecuali kode/infrastruktur mengonsumsinya

### Latihan 3: Alur Kerja Multi-Lingkungan (25 menit)
**Tujuan**: Kuasai manajemen lingkungan dan strategi penyebaran

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kriteria Keberhasilan:**
- [ ] Dua lingkungan dibuat dengan konfigurasi berbeda
- [ ] Kedua lingkungan berhasil disebarkan
- [ ] Bisa berganti antar lingkungan menggunakan `azd env select`
- [ ] Variabel lingkungan berbeda antar lingkungan
- [ ] Berhasil membersihkan kedua lingkungan

## 📊 Kemajuanmu

**Waktu yang Diinvestasikan**: ~60-90 menit  
**Keterampilan yang Didapat**:
- ✅ Inisialisasi proyek berbasis template
- ✅ Penyediaan sumber daya Azure
- ✅ Alur kerja penyebaran aplikasi
- ✅ Manajemen lingkungan
- ✅ Manajemen konfigurasi
- ✅ Pembersihan sumber daya dan manajemen biaya

**Tingkat Selanjutnya**: Kamu siap untuk [Panduan Konfigurasi](../chapter-03-configuration/configuration.md) untuk mempelajari pola konfigurasi lanjutan!

## Pemecahan Masalah Umum

### Kesalahan Autentikasi
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Gagal Penyebaran
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflik Nama Sumber Daya
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Masalah Port/Jaringan
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Langkah Selanjutnya

Setelah menyelesaikan proyek pertamamu, jelajahi topik lanjutan berikut:

### 1. Sesuaikan Infrastruktur
- [Infrastruktur sebagai Kode](../chapter-04-infrastructure/provisioning.md)
- [Tambah infrastruktur database](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Siapkan CI/CD
- [Panduan Penyebaran](../chapter-04-infrastructure/deployment-guide.md) - Alur kerja CI/CD lengkap
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfigurasi pipeline

### 3. Praktik Terbaik Produksi
- [Panduan Penyebaran](../chapter-04-infrastructure/deployment-guide.md) - Keamanan, performa, dan pemantauan

### 4. Jelajahi Lebih Banyak Template
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Sumber Daya Tambahan

### Materi Pembelajaran
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pusat Arsitektur Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kerangka Kerja Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunitas & Dukungan
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Komunitas Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Template & Contoh
- [Galeri Template Resmi](https://azure.github.io/awesome-azd/)
- [Kontribusi Template Komunitas](https://github.com/Azure/awesome-azd)
- [Sumber Template Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Selamat telah menyelesaikan proyek azd pertamamu!** Kamu sekarang siap membangun dan menyebarkan aplikasi luar biasa di Azure dengan percaya diri.

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 1 - Dasar & Mulai Cepat
- **⬅️ Sebelumnya**: [Instalasi & Pengaturan](installation.md)
- **➡️ Berikutnya**: [Bawa Aplikasimu Sendiri](bring-your-own-app.md)
- **🚀 Bab Berikutnya**: [Bab 2: Pengembangan Berbasis AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->