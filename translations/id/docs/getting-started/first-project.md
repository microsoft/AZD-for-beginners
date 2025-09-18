<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "67ffbcceec008228c4d22c1b3585844c",
  "translation_date": "2025-09-18T07:56:42+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "id"
}
-->
# Proyek Pertama Anda - Tutorial Praktis

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 1 - Dasar & Mulai Cepat
- **⬅️ Sebelumnya**: [Instalasi & Pengaturan](installation.md)
- **➡️ Selanjutnya**: [Konfigurasi](configuration.md)
- **🚀 Bab Selanjutnya**: [Bab 2: Pengembangan Berbasis AI](../ai-foundry/azure-ai-foundry-integration.md)

## Pendahuluan

Selamat datang di proyek pertama Anda dengan Azure Developer CLI! Tutorial praktis ini memberikan panduan lengkap untuk membuat, menerapkan, dan mengelola aplikasi full-stack di Azure menggunakan azd. Anda akan bekerja dengan aplikasi todo nyata yang mencakup frontend React, backend API Node.js, dan database MongoDB.

## Tujuan Pembelajaran

Dengan menyelesaikan tutorial ini, Anda akan:
- Menguasai alur kerja inisialisasi proyek azd menggunakan template
- Memahami struktur proyek dan file konfigurasi Azure Developer CLI
- Melakukan penerapan aplikasi lengkap ke Azure dengan penyediaan infrastruktur
- Menerapkan pembaruan aplikasi dan strategi penerapan ulang
- Mengelola beberapa lingkungan untuk pengembangan dan staging
- Menerapkan praktik pembersihan sumber daya dan pengelolaan biaya

## Hasil Pembelajaran

Setelah selesai, Anda akan dapat:
- Menginisialisasi dan mengonfigurasi proyek azd dari template secara mandiri
- Menavigasi dan memodifikasi struktur proyek azd secara efektif
- Menerapkan aplikasi full-stack ke Azure menggunakan perintah tunggal
- Memecahkan masalah umum penerapan dan masalah autentikasi
- Mengelola beberapa lingkungan Azure untuk berbagai tahap penerapan
- Menerapkan alur kerja penerapan berkelanjutan untuk pembaruan aplikasi

## Memulai

### Daftar Prasyarat
- ✅ Azure Developer CLI terinstal ([Panduan Instalasi](installation.md))
- ✅ Azure CLI terinstal dan diautentikasi
- ✅ Git terinstal di sistem Anda
- ✅ Node.js 16+ (untuk tutorial ini)
- ✅ Visual Studio Code (disarankan)

### Verifikasi Pengaturan Anda
```bash
# Check azd installation
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
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Apa yang Baru Saja Terjadi?
- Template kode diunduh ke direktori lokal Anda
- File `azure.yaml` dibuat dengan definisi layanan
- Kode infrastruktur disiapkan di direktori `infra/`
- Konfigurasi lingkungan dibuat

## Langkah 2: Jelajahi Struktur Proyek

Mari kita periksa apa yang telah dibuat oleh azd untuk kita:

```bash
# View the project structure
tree /f   # Windows
# or
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
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Definisi infrastruktur:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Langkah 3: Sesuaikan Proyek Anda (Opsional)

Sebelum menerapkan, Anda dapat menyesuaikan aplikasi:

### Modifikasi Frontend
```bash
# Open the React app component
code src/web/src/App.tsx
```

Lakukan perubahan sederhana:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Konfigurasi Variabel Lingkungan
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Langkah 4: Terapkan ke Azure

Sekarang bagian yang menarik - terapkan semuanya ke Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
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
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Uji Aplikasi Todo
1. **Tambahkan item todo** - Klik "Add Todo" dan masukkan tugas
2. **Tandai sebagai selesai** - Centang item yang telah selesai
3. **Hapus item** - Hapus todo yang tidak lagi Anda perlukan

### Pantau Aplikasi Anda
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Langkah 6: Lakukan Perubahan dan Terapkan Ulang

Mari kita lakukan perubahan dan lihat betapa mudahnya memperbarui:

### Modifikasi API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Tambahkan header respons khusus:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Terapkan Hanya Perubahan Kode
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

Saat Anda selesai bereksperimen, bersihkan untuk menghindari biaya yang terus berjalan:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Apa yang Telah Anda Pelajari

Selamat! Anda telah berhasil:
- Menginisialisasi proyek azd dari template
- Menjelajahi struktur proyek dan file utama
- Menerapkan aplikasi full-stack ke Azure
- Melakukan perubahan kode dan menerapkan ulang
- Mengelola beberapa lingkungan
- Membersihkan sumber daya

## Pemecahan Masalah Umum

### Kesalahan Autentikasi
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Kegagalan Penerapan
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
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

Sekarang setelah Anda menyelesaikan proyek pertama Anda, jelajahi topik lanjutan berikut:

### 1. Sesuaikan Infrastruktur
- [Infrastructure as Code](../deployment/provisioning.md)
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
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
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
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 1 - Dasar & Mulai Cepat
- **⬅️ Sebelumnya**: [Instalasi & Pengaturan](installation.md)
- **➡️ Selanjutnya**: [Konfigurasi](configuration.md)
- **🚀 Bab Selanjutnya**: [Bab 2: Pengembangan Berbasis AI](../ai-foundry/azure-ai-foundry-integration.md)
- **Pelajaran Selanjutnya**: [Panduan Penerapan](../deployment/deployment-guide.md)

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk memberikan hasil yang akurat, harap diingat bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan manusia profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.