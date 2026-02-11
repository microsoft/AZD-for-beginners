# Dasar-dasar AZD - Memahami Azure Developer CLI

# Dasar-dasar AZD - Konsep Inti dan Dasar

**Chapter Navigation:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 1 - Dasar & Memulai Cepat
- **⬅️ Sebelumnya**: [Course Overview](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Berikutnya**: [Installation & Setup](installation.md)
- **🚀 Bab Berikutnya**: [Bab 2: Pengembangan Berbasis AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Pendahuluan

Pelajaran ini memperkenalkan Anda pada Azure Developer CLI (azd), alat baris perintah yang kuat yang mempercepat perjalanan Anda dari pengembangan lokal ke penyebaran di Azure. Anda akan mempelajari konsep dasar, fitur inti, dan memahami bagaimana azd menyederhanakan penyebaran aplikasi cloud-native.

## Tujuan Pembelajaran

Di akhir pelajaran ini, Anda akan:
- Memahami apa itu Azure Developer CLI dan tujuan utamanya
- Mempelajari konsep inti template, lingkungan, dan layanan
- Mengeksplorasi fitur utama termasuk pengembangan berbasis template dan Infrastruktur sebagai Kode
- Memahami struktur proyek azd dan alurnya
- Siap menginstal dan mengonfigurasi azd untuk lingkungan pengembangan Anda

## Hasil Pembelajaran

Setelah menyelesaikan pelajaran ini, Anda akan bisa:
- Menjelaskan peran azd dalam alur kerja pengembangan cloud modern
- Mengidentifikasi komponen struktur proyek azd
- Mendeskripsikan bagaimana template, lingkungan, dan layanan bekerja bersama
- Memahami manfaat Infrastruktur sebagai Kode dengan azd
- Mengenali berbagai perintah azd dan tujuannya

## Apa itu Azure Developer CLI (azd)?

Azure Developer CLI (azd) adalah alat baris perintah yang dirancang untuk mempercepat perjalanan Anda dari pengembangan lokal ke penyebaran di Azure. Alat ini menyederhanakan proses membangun, menyebarkan, dan mengelola aplikasi cloud-native di Azure.

### 🎯 Mengapa Menggunakan AZD? Perbandingan Dunia Nyata

Mari bandingkan penyebaran aplikasi web sederhana dengan basis data:

#### ❌ TANPA AZD: Penyebaran Azure Manual (30+ menit)

```bash
# Langkah 1: Buat grup sumber daya
az group create --name myapp-rg --location eastus

# Langkah 2: Buat App Service Plan
az appservice plan create --name myapp-plan \
  --resource-group myapp-rg \
  --sku B1 --is-linux

# Langkah 3: Buat Aplikasi Web
az webapp create --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --plan myapp-plan \
  --runtime "NODE:18-lts"

# Langkah 4: Buat akun Cosmos DB (10-15 menit)
az cosmosdb create --name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --kind MongoDB

# Langkah 5: Buat database
az cosmosdb mongodb database create \
  --account-name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --name tododb

# Langkah 6: Buat koleksi
az cosmosdb mongodb collection create \
  --account-name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --database-name tododb \
  --name todos

# Langkah 7: Dapatkan string koneksi
CONN_STR=$(az cosmosdb keys list \
  --name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --type connection-strings \
  --query "connectionStrings[0].connectionString" -o tsv)

# Langkah 8: Konfigurasikan pengaturan aplikasi
az webapp config appsettings set \
  --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --settings MONGODB_URI="$CONN_STR"

# Langkah 9: Aktifkan pencatatan
az webapp log config --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --application-logging filesystem \
  --detailed-error-messages true

# Langkah 10: Siapkan Application Insights
az monitor app-insights component create \
  --app myapp-insights \
  --location eastus \
  --resource-group myapp-rg

# Langkah 11: Hubungkan App Insights ke Aplikasi Web
INSTRUMENTATION_KEY=$(az monitor app-insights component show \
  --app myapp-insights \
  --resource-group myapp-rg \
  --query "instrumentationKey" -o tsv)

az webapp config appsettings set \
  --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --settings APPINSIGHTS_INSTRUMENTATIONKEY="$INSTRUMENTATION_KEY"

# Langkah 12: Bangun aplikasi secara lokal
npm install
npm run build

# Langkah 13: Buat paket penyebaran
zip -r app.zip . -x "*.git*" "node_modules/*"

# Langkah 14: Terapkan aplikasi
az webapp deployment source config-zip \
  --resource-group myapp-rg \
  --name myapp-web-unique123 \
  --src app.zip

# Langkah 15: Tunggu dan berdoa semoga berhasil 🙏
# (Tidak ada validasi otomatis, pengujian manual diperlukan)
```

**Masalah:**
- ❌ 15+ perintah yang harus diingat dan dijalankan secara berurutan
- ❌ 30-45 menit pekerjaan manual
- ❌ Mudah membuat kesalahan (typo, parameter yang salah)
- ❌ String koneksi terekspos di riwayat terminal
- ❌ Tidak ada rollback otomatis jika terjadi kegagalan
- ❌ Sulit direplikasi oleh anggota tim
- ❌ Berbeda setiap kali (tidak dapat direproduksi)

#### ✅ DENGAN AZD: Penyebaran Terotomatisasi (5 perintah, 10-15 menit)

```bash
# Langkah 1: Inisialisasi dari templat
azd init --template todo-nodejs-mongo

# Langkah 2: Otentikasi
azd auth login

# Langkah 3: Buat lingkungan
azd env new dev

# Langkah 4: Pratinjau perubahan (opsional tetapi disarankan)
azd provision --preview

# Langkah 5: Sebarkan semuanya
azd up

# ✨ Selesai! Semuanya telah disebarkan, dikonfigurasi, dan dipantau
```

**Manfaat:**
- ✅ **5 perintah** vs. 15+ langkah manual
- ✅ **10-15 menit** total waktu (sebagian besar menunggu Azure)
- ✅ **Tanpa kesalahan** - otomatis dan teruji
- ✅ **Rahasia dikelola dengan aman** melalui Key Vault
- ✅ **Rollback otomatis** saat terjadi kegagalan
- ✅ **Sepenuhnya dapat direproduksi** - hasil yang sama setiap kali
- ✅ **Siap untuk tim** - siapa pun bisa menyebarkan dengan perintah yang sama
- ✅ **Infrastruktur sebagai Kode** - template Bicep yang dikontrol versi
- ✅ **Pemantauan bawaan** - Application Insights dikonfigurasi secara otomatis

### 📊 Pengurangan Waktu & Kesalahan

| Metrik | Penyebaran Manual | Penyebaran AZD | Peningkatan |
|:-------|:------------------|:---------------|:------------|
| **Perintah** | 15+ | 5 | 67% lebih sedikit |
| **Waktu** | 30-45 min | 10-15 min | 60% lebih cepat |
| **Tingkat Kesalahan** | ~40% | <5% | pengurangan 88% |
| **Konsistensi** | Rendah (manual) | 100% (terotomatisasi) | Sempurna |
| **Pengenalan Tim** | 2-4 jam | 30 menit | 75% lebih cepat |
| **Waktu Rollback** | 30+ min (manual) | 2 min (terotomatisasi) | 93% lebih cepat |

## Konsep Inti

### Template
Template adalah dasar dari azd. Mereka berisi:
- **Kode aplikasi** - Kode sumber dan dependensi Anda
- **Definisi infrastruktur** - Sumber daya Azure yang didefinisikan dalam Bicep atau Terraform
- **File konfigurasi** - Pengaturan dan variabel lingkungan
- **Skrip penyebaran** - Alur kerja penyebaran otomatis

### Lingkungan
Lingkungan mewakili target penyebaran yang berbeda:
- **Development** - Untuk pengujian dan pengembangan
- **Staging** - Lingkungan pra-produksi
- **Production** - Lingkungan produksi langsung

Setiap lingkungan mempertahankan:
- grup sumber daya Azure
- pengaturan konfigurasi
- status penyebaran

### Layanan
Layanan adalah blok bangunan aplikasi Anda:
- **Frontend** - Aplikasi web, SPA
- **Backend** - API, microservices
- **Database** - Solusi penyimpanan data
- **Storage** - Penyimpanan file dan blob

## Fitur Utama

### 1. Pengembangan Berbasis Template
```bash
# Telusuri template yang tersedia
azd template list

# Inisialisasi dari template
azd init --template <template-name>
```

### 2. Infrastruktur sebagai Kode
- **Bicep** - bahasa domain khusus Azure
- **Terraform** - alat infrastruktur multi-cloud
- **ARM Templates** - template Azure Resource Manager

### 3. Alur Kerja Terintegrasi
```bash
# Alur kerja penyebaran lengkap
azd up            # Penyediaan + Penyebaran ini tanpa intervensi untuk penyiapan pertama kali

# 🧪 BARU: Pratinjau perubahan infrastruktur sebelum penyebaran (AMAN)
azd provision --preview    # Simulasikan penyebaran infrastruktur tanpa melakukan perubahan

azd provision     # Buat sumber daya Azure — jika Anda memperbarui infrastruktur, gunakan ini
azd deploy        # Terapkan kode aplikasi atau terapkan ulang kode aplikasi setelah pembaruan
azd down          # Bersihkan sumber daya
```

#### 🛡️ Perencanaan Infrastruktur Aman dengan Pratinjau
Perintah `azd provision --preview` adalah pengubah permainan untuk penyebaran yang aman:
- **Analisis dry-run** - Menunjukkan apa yang akan dibuat, diubah, atau dihapus
- **Tanpa risiko** - Tidak ada perubahan nyata yang dilakukan ke lingkungan Azure Anda
- **Kolaborasi tim** - Bagikan hasil pratinjau sebelum penyebaran
- **Estimasi biaya** - Pahami biaya sumber daya sebelum komitmen

```bash
# Contoh alur kerja pratinjau
azd provision --preview           # Lihat apa yang akan berubah
# Tinjau keluaran, diskusikan dengan tim
azd provision                     # Terapkan perubahan dengan yakin
```

### 📊 Visual: Alur Pengembangan AZD

```mermaid
graph LR
    A[azd init] -->|Inisialisasi proyek| B[azd auth login]
    B -->|Otentikasi| C[azd env new]
    C -->|Buat lingkungan| D{Penempatan pertama?}
    D -->|Ya| E[azd up]
    D -->|Tidak| F[azd provision --preview]
    F -->|Tinjau perubahan| G[azd provision]
    E -->|Menyediakan & menerapkan| H[Sumber daya berjalan]
    G -->|Memperbarui infrastruktur| H
    H -->|Pantau| I[azd monitor]
    I -->|Lakukan perubahan kode| J[azd deploy]
    J -->|Menerapkan ulang kode saja| H
    H -->|Bersihkan| K[azd down]
    
    style A fill:#e1f5fe
    style E fill:#c8e6c9
    style F fill:#fff9c4
    style H fill:#c5e1a5
    style K fill:#ffcdd2
```
**Penjelasan Alur Kerja:**
1. **Init** - Mulai dengan template atau proyek baru
2. **Auth** - Otentikasi dengan Azure
3. **Environment** - Buat lingkungan penyebaran terisolasi
4. **Preview** - 🆕 Selalu pratinjau perubahan infrastruktur terlebih dahulu (praktek aman)
5. **Provision** - Buat/perbarui sumber daya Azure
6. **Deploy** - Dorong kode aplikasi Anda
7. **Monitor** - Amati performa aplikasi
8. **Iterate** - Lakukan perubahan dan deploy ulang kode
9. **Cleanup** - Hapus sumber daya ketika selesai

### 4. Manajemen Lingkungan
```bash
# Buat dan kelola lingkungan
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Struktur Proyek

Struktur proyek azd tipikal:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 File Konfigurasi

### azure.yaml
File konfigurasi utama proyek:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Konfigurasi spesifik lingkungan:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Alur Kerja Umum dengan Latihan Praktik

> **💡 Tip Pembelajaran:** Ikuti latihan-latihan ini secara berurutan untuk membangun keterampilan AZD Anda secara bertahap.

### 🎯 Latihan 1: Inisialisasi Proyek Pertama Anda

**Tujuan:** Buat proyek AZD dan jelajahi strukturnya

**Langkah-langkah:**
```bash
# Gunakan templat yang terbukti
azd init --template todo-nodejs-mongo

# Jelajahi file yang dihasilkan
ls -la  # Lihat semua file termasuk yang tersembunyi

# File penting yang dibuat:
# - azure.yaml (konfigurasi utama)
# - infra/ (kode infrastruktur)
# - src/ (kode aplikasi)
```

**✅ Sukses:** Anda memiliki azure.yaml, direktori infra/, dan src/

---

### 🎯 Latihan 2: Deploy ke Azure

**Tujuan:** Selesaikan penyebaran ujung-ke-ujung

**Langkah-langkah:**
```bash
# 1. Autentikasi
az login && azd auth login

# 2. Buat lingkungan
azd env new dev
azd env set AZURE_LOCATION eastus

# 3. Pratinjau perubahan (DISARANKAN)
azd provision --preview

# 4. Terapkan semuanya
azd up

# 5. Verifikasi penyebaran
azd show    # 6. Lihat URL aplikasi Anda
```

**Perkiraan Waktu:** 10-15 menit  
**✅ Sukses:** URL aplikasi terbuka di browser

---

### 🎯 Latihan 3: Banyak Lingkungan

**Tujuan:** Deploy ke dev dan staging

**Langkah-langkah:**
```bash
# Sudah ada dev, buat staging
azd env new staging
azd env set AZURE_LOCATION westus2
azd up

# Beralih di antara keduanya
azd env list
azd env select dev
```

**✅ Sukses:** Dua grup sumber daya terpisah di Azure Portal

---

### 🛡️ Mulai Bersih: `azd down --force --purge`

Ketika Anda perlu sepenuhnya mereset:

```bash
azd down --force --purge
```

**Apa yang dilakukannya:**
- `--force`: Tanpa permintaan konfirmasi
- `--purge`: Menghapus semua state lokal dan sumber daya Azure

**Gunakan ketika:**
- Penyebaran gagal di tengah jalan
- Beralih proyek
- Perlu mulai baru

---

## 🎪 Referensi Alur Kerja Asli

### Memulai Proyek Baru
```bash
# Metode 1: Gunakan templat yang ada
azd init --template todo-nodejs-mongo

# Metode 2: Mulai dari awal
azd init

# Metode 3: Gunakan direktori saat ini
azd init .
```

### Siklus Pengembangan
```bash
# Siapkan lingkungan pengembangan
azd auth login
azd env new dev
azd env select dev

# Terapkan semuanya
azd up

# Lakukan perubahan dan terapkan ulang
azd deploy

# Bersihkan setelah selesai
azd down --force --purge # perintah di Azure Developer CLI adalah **reset penuh** untuk lingkungan Anda—terutama berguna saat Anda sedang mengatasi penyebaran yang gagal, membersihkan sumber daya yang terlantar, atau mempersiapkan penyebaran ulang yang bersih.
```

## Memahami `azd down --force --purge`
Perintah `azd down --force --purge` adalah cara yang ampuh untuk benar-benar menghancurkan lingkungan azd Anda dan semua sumber daya terkait. Berikut rincian apa yang dilakukan setiap flag:
```
--force
```
- Melewati permintaan konfirmasi.
- Berguna untuk otomasi atau penulisan skrip di mana input manual tidak memungkinkan.
- Memastikan proses teardown berjalan tanpa gangguan, bahkan jika CLI mendeteksi inkonsistensi.

```
--purge
```
Menghapus **semua metadata terkait**, termasuk:
Status lingkungan
Folder lokal `.azure`
Informasi penyebaran yang di-cache
Mencegah azd dari "mengingat" penyebaran sebelumnya, yang dapat menyebabkan masalah seperti grup sumber daya yang tidak cocok atau referensi registry yang usang.


### Mengapa menggunakan keduanya?
Ketika Anda menemui jalan buntu dengan `azd up` karena state yang tersisa atau penyebaran parsial, kombinasi ini memastikan **mulai dari awal yang bersih**.

Ini sangat membantu setelah penghapusan sumber daya manual di portal Azure atau ketika mengganti template, lingkungan, atau konvensi penamaan grup sumber daya.


### Mengelola Banyak Lingkungan
```bash
# Buat lingkungan staging
azd env new staging
azd env select staging
azd up

# Kembali ke dev
azd env select dev

# Bandingkan lingkungan
azd env list
```

## 🔐 Autentikasi dan Kredensial

Memahami autentikasi sangat penting untuk penyebaran azd yang berhasil. Azure menggunakan beberapa metode autentikasi, dan azd memanfaatkan rantai kredensial yang sama yang digunakan oleh alat Azure lainnya.

### Autentikasi Azure CLI (`az login`)

Sebelum menggunakan azd, Anda perlu mengautentikasi dengan Azure. Metode yang paling umum adalah menggunakan Azure CLI:

```bash
# Masuk interaktif (membuka browser)
az login

# Masuk dengan tenant tertentu
az login --tenant <tenant-id>

# Masuk dengan service principal
az login --service-principal -u <app-id> -p <password> --tenant <tenant-id>

# Periksa status masuk saat ini
az account show

# Daftar langganan yang tersedia
az account list --output table

# Atur langganan default
az account set --subscription <subscription-id>
```

### Alur Autentikasi
1. **Login Interaktif**: Membuka browser default Anda untuk autentikasi
2. **Alur Kode Perangkat**: Untuk lingkungan tanpa akses browser
3. **Service Principal**: Untuk otomasi dan skenario CI/CD
4. **Managed Identity**: Untuk aplikasi yang dihosting di Azure

### Rantai DefaultAzureCredential

`DefaultAzureCredential` adalah tipe kredensial yang menyediakan pengalaman autentikasi yang disederhanakan dengan otomatis mencoba beberapa sumber kredensial dalam urutan tertentu:

#### Urutan Rantai Kredensial
```mermaid
graph TD
    A[Kredensial Default Azure] --> B[Variabel Lingkungan]
    B --> C[Identitas Workload]
    C --> D[Identitas Terkelola]
    D --> E[Visual Studio]
    E --> F[Visual Studio Code]
    F --> G[Azure CLI]
    G --> H[Azure PowerShell]
    H --> I[Peramban Interaktif]
```
#### 1. Variabel Lingkungan
```bash
# Tetapkan variabel lingkungan untuk service principal
export AZURE_CLIENT_ID="<app-id>"
export AZURE_CLIENT_SECRET="<password>"
export AZURE_TENANT_ID="<tenant-id>"
```

#### 2. Workload Identity (Kubernetes/GitHub Actions)
Digunakan secara otomatis di:
- Azure Kubernetes Service (AKS) dengan Workload Identity
- GitHub Actions dengan federasi OIDC
- Skenario identitas terfederasi lainnya

#### 3. Managed Identity
Untuk sumber daya Azure seperti:
- Virtual Machines
- App Service
- Azure Functions
- Container Instances

```bash
# Periksa apakah dijalankan pada sumber daya Azure dengan identitas terkelola
az account show --query "user.type" --output tsv
# Mengembalikan: "servicePrincipal" jika menggunakan identitas terkelola
```

#### 4. Integrasi Alat Pengembang
- **Visual Studio**: Secara otomatis menggunakan akun yang masuk
- **VS Code**: Menggunakan kredensial ekstensi Azure Account
- **Azure CLI**: Menggunakan kredensial `az login` (paling umum untuk pengembangan lokal)

### Pengaturan Autentikasi AZD

```bash
# Metode 1: Gunakan Azure CLI (Direkomendasikan untuk pengembangan)
az login
azd auth login  # Menggunakan kredensial Azure CLI yang ada

# Metode 2: Otentikasi langsung azd
azd auth login --use-device-code  # Untuk lingkungan tanpa antarmuka pengguna (headless)

# Metode 3: Periksa status otentikasi
azd auth login --check-status

# Metode 4: Keluar dan otentikasi ulang
azd auth logout
azd auth login
```

### Praktik Terbaik Autentikasi

#### Untuk Pengembangan Lokal
```bash
# 1. Masuk dengan Azure CLI
az login

# 2. Pastikan langganan yang benar
az account show
az account set --subscription "Your Subscription Name"

# 3. Gunakan azd dengan kredensial yang ada
azd auth login
```

#### Untuk Pipeline CI/CD
```yaml
# GitHub Actions example
- name: Azure Login
  uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}

- name: Deploy with azd
  run: |
    azd auth login --client-id ${{ secrets.AZURE_CLIENT_ID }} \
                    --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
                    --tenant-id ${{ secrets.AZURE_TENANT_ID }}
    azd up --no-prompt
```

#### Untuk Lingkungan Produksi
- Gunakan **Managed Identity** saat berjalan pada sumber daya Azure
- Gunakan **Service Principal** untuk skenario otomasi
- Hindari menyimpan kredensial dalam kode atau file konfigurasi
- Gunakan **Azure Key Vault** untuk konfigurasi sensitif

### Masalah Autentikasi Umum dan Solusinya

#### Masalah: "No subscription found"
```bash
# Solusi: Tetapkan langganan default
az account list --output table
az account set --subscription "<subscription-id>"
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"
```

#### Masalah: "Insufficient permissions"
```bash
# Solusi: Periksa dan tetapkan peran yang diperlukan
az role assignment list --assignee $(az account show --query user.name --output tsv)

# Peran yang umum diperlukan:
# - Kontributor (untuk pengelolaan sumber daya)
# - Administrator Akses Pengguna (untuk penetapan peran)
```

#### Masalah: "Token expired"
```bash
# Solusi: Autentikasi ulang
az logout
az login
azd auth logout
azd auth login
```

### Autentikasi dalam Berbagai Skenario

#### Pengembangan Lokal
```bash
# Akun pengembangan pribadi
az login
azd auth login
```

#### Pengembangan Tim
```bash
# Gunakan tenant tertentu untuk organisasi
az login --tenant contoso.onmicrosoft.com
azd auth login
```

#### Skenario Multi-tenant
```bash
# Beralih antar penyewa
az login --tenant tenant1.onmicrosoft.com
# Terapkan ke penyewa 1
azd up

az login --tenant tenant2.onmicrosoft.com  
# Terapkan ke penyewa 2
azd up
```

### Pertimbangan Keamanan

1. **Penyimpanan Kredensial**: Jangan pernah menyimpan kredensial dalam kode sumber
2. **Pembatasan Ruang Lingkup**: Gunakan prinsip least-privilege untuk service principal
3. **Rotasi Token**: Secara berkala rotasi rahasia service principal
4. **Jejak Audit**: Pantau aktivitas autentikasi dan penyebaran
5. **Keamanan Jaringan**: Gunakan private endpoints bila memungkinkan

### Pemecahan Masalah Autentikasi

```bash
# Menelusuri masalah otentikasi
azd auth login --check-status
az account show
az account get-access-token

# Perintah diagnostik umum
whoami                          # Konteks pengguna saat ini
az ad signed-in-user show      # Rincian pengguna Azure AD
az group list                  # Uji akses sumber daya
```

## Memahami `azd down --force --purge`

### Penemuan
```bash
azd template list              # Telusuri templat
azd template show <template>   # Detail templat
azd init --help               # Opsi inisialisasi
```

### Manajemen Proyek
```bash
azd show                     # Ikhtisar proyek
azd env show                 # Lingkungan saat ini
azd config list             # Pengaturan konfigurasi
```

### Pemantauan
```bash
azd monitor                  # Buka pemantauan di portal Azure
azd monitor --logs           # Lihat log aplikasi
azd monitor --live           # Lihat metrik waktu nyata
azd pipeline config          # Siapkan CI/CD
```

## Praktik Terbaik

### 1. Gunakan Nama yang Bermakna
```bash
# Baik
azd env new production-east
azd init --template web-app-secure

# Hindari
azd env new env1
azd init --template template1
```

### 2. Manfaatkan Template
- Mulai dengan template yang ada
- Sesuaikan sesuai kebutuhan Anda
- Buat template yang dapat digunakan ulang untuk organisasi Anda

### 3. Isolasi Lingkungan
- Gunakan lingkungan terpisah untuk dev/staging/prod
- Jangan pernah menyebarkan langsung ke produksi dari mesin lokal
- Gunakan pipeline CI/CD untuk penyebaran produksi

### 4. Manajemen Konfigurasi
- Gunakan variabel lingkungan untuk data sensitif
- Simpan konfigurasi dalam version control
- Dokumentasikan pengaturan spesifik lingkungan

## Perkembangan Pembelajaran

### Pemula (Minggu 1-2)
1. Instal azd dan autentikasi
2. Deploy template sederhana
3. Memahami struktur proyek
4. Belajar perintah dasar (up, down, deploy)

### Menengah (Minggu 3-4)
1. Sesuaikan template
2. Kelola banyak lingkungan
3. Memahami kode infrastruktur
4. Menyiapkan pipeline CI/CD

### Lanjutan (Minggu 5+)
1. Buat template kustom
2. Pola infrastruktur tingkat lanjut
3. Penyebaran multi-region
4. Konfigurasi tingkat perusahaan

## Langkah Selanjutnya

**📖 Lanjutkan Pembelajaran Bab 1:**
- [Instalasi & Pengaturan](installation.md) - Instal azd dan konfigurasikan
- [Proyek Pertama Anda](first-project.md) - Tutorial praktis lengkap
- [Panduan Konfigurasi](configuration.md) - Opsi konfigurasi lanjutan

**🎯 Siap untuk Bab Berikutnya?**
- [Bab 2: Pengembangan Berfokus pada AI](../chapter-02-ai-development/microsoft-foundry-integration.md) - Mulai membangun aplikasi AI

## Sumber Daya Tambahan

- [Ikhtisar Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Galeri Template](https://azure.github.io/awesome-azd/)
- [Contoh Komunitas](https://github.com/Azure-Samples)

---

## 🙋 Pertanyaan yang Sering Diajukan

### Pertanyaan Umum

**Q: Apa perbedaan antara AZD dan Azure CLI?**

A: Azure CLI (`az`) digunakan untuk mengelola sumber daya Azure individual. AZD (`azd`) digunakan untuk mengelola seluruh aplikasi:

```bash
# Azure CLI - Manajemen sumber daya tingkat rendah
az webapp create --name myapp --resource-group rg
az sql server create --name myserver --resource-group rg
# ...diperlukan banyak perintah lagi

# AZD - Manajemen tingkat aplikasi
azd up  # Menerapkan seluruh aplikasi beserta semua sumber dayanya
```

**Pikirkan seperti ini:**
- `az` = Mengoperasikan bata Lego individual
- `azd` = Bekerja dengan set Lego lengkap

---

**Q: Apakah saya perlu mengetahui Bicep atau Terraform untuk menggunakan AZD?**

A: Tidak! Mulailah dengan template:
```bash
# Gunakan templat yang ada - tidak perlu pengetahuan tentang IaC
azd init --template todo-nodejs-mongo
azd up
```

Anda dapat mempelajari Bicep nanti untuk menyesuaikan infrastruktur. Template menyediakan contoh yang berfungsi untuk dipelajari.

---

**Q: Berapa biaya untuk menjalankan template AZD?**

A: Biaya bervariasi tergantung template. Sebagian besar template pengembangan berbiaya $50-150/bulan:

```bash
# Pratinjau biaya sebelum menerapkan
azd provision --preview

# Selalu bersihkan saat tidak digunakan
azd down --force --purge  # Menghapus semua sumber daya
```

**Tip pro:** Gunakan tier gratis bila tersedia:
- App Service: F1 (tingkat Gratis)
- Azure OpenAI: 50,000 token/bulan gratis
- Cosmos DB: 1000 RU/s tingkat gratis

---

**Q: Bisakah saya menggunakan AZD dengan sumber daya Azure yang sudah ada?**

A: Ya, tetapi lebih mudah memulai dari awal. AZD bekerja terbaik ketika mengelola seluruh siklus hidup. Untuk sumber daya yang sudah ada:

```bash
# Opsi 1: Impor sumber daya yang sudah ada (lanjutan)
azd init
# Kemudian ubah infra/ untuk merujuk sumber daya yang sudah ada

# Opsi 2: Mulai dari awal (direkomendasikan)
azd init --template matching-your-stack
azd up  # Membuat lingkungan baru
```

---

**Q: Bagaimana cara saya membagikan proyek saya dengan rekan tim?**

A: Komit proyek AZD ke Git (tetapi JANGAN folder .azure):

```bash
# Sudah ada di .gitignore secara default
.azure/        # Berisi rahasia dan data lingkungan
*.env          # Variabel lingkungan

# Anggota tim saat itu:
git clone <your-repo>
azd auth login
azd env new <their-name>-dev
azd up
```

Semua orang mendapatkan infrastruktur identik dari template yang sama.

---

### Pertanyaan Pemecahan Masalah

**Q: "azd up" gagal di tengah jalan. Apa yang harus saya lakukan?**

A: Periksa kesalahan, perbaiki, lalu coba lagi:

```bash
# Lihat log terperinci
azd show

# Perbaikan umum:

# 1. Jika kuota terlampaui:
azd env set AZURE_LOCATION "westus2"  # Coba wilayah berbeda

# 2. Jika terjadi konflik nama sumber daya:
azd down --force --purge  # Mulai dari awal
azd up  # Coba lagi

# 3. Jika otentikasi kedaluwarsa:
az login
azd auth login
azd up
```

**Masalah paling umum:** Berlangganan Azure yang dipilih salah
```bash
az account list --output table
az account set --subscription "<correct-subscription>"
```

---

**Q: Bagaimana cara menerapkan hanya perubahan kode tanpa melakukan penyediaan ulang?**

A: Gunakan `azd deploy` bukan `azd up`:

```bash
azd up          # Pertama kali: penyediaan + penyebaran (lambat)

# Lakukan perubahan kode...

azd deploy      # Kali berikutnya: hanya penyebaran (cepat)
```

Perbandingan kecepatan:
- `azd up`: 10-15 menit (menyediakan infrastruktur)
- `azd deploy`: 2-5 menit (hanya kode)

---

**Q: Bisakah saya menyesuaikan template infrastruktur?**

A: Ya! Sunting file Bicep di `infra/`:

```bash
# Setelah azd init
cd infra/
code main.bicep  # Sunting di VS Code

# Pratinjau perubahan
azd provision --preview

# Terapkan perubahan
azd provision
```

**Tip:** Mulai kecil - ubah SKU terlebih dahulu:
```bicep
// infra/main.bicep
sku: {
  name: 'B1'  // Change to 'P1V2' for production
}
```

---

**Q: Bagaimana cara menghapus semua yang dibuat AZD?**

A: Satu perintah menghapus semua sumber daya:

```bash
azd down --force --purge

# Ini menghapus:
# - Semua sumber daya Azure
# - Grup sumber daya
# - Status lingkungan lokal
# - Data penyebaran yang di-cache
```

**Selalu jalankan ini ketika:**
- Selesai menguji sebuah template
- Berpindah ke proyek yang berbeda
- Ingin memulai dari awal

**Penghematan biaya:** Menghapus sumber daya yang tidak terpakai = $0 biaya

---

**Q: Bagaimana jika saya tidak sengaja menghapus sumber daya di Azure Portal?**

A: Status AZD bisa tidak sinkron. Pendekatan bersih:

```bash
# 1. Hapus state lokal
azd down --force --purge

# 2. Mulai dari awal
azd up

# Alternatif: Biarkan AZD mendeteksi dan memperbaiki
azd provision  # Akan membuat sumber daya yang hilang
```

---

### Pertanyaan Lanjutan

**Q: Bisakah saya menggunakan AZD dalam pipeline CI/CD?**

A: Ya! Contoh GitHub Actions:

```yaml
# .github/workflows/deploy.yml
name: Deploy with AZD

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Install azd
        run: curl -fsSL https://aka.ms/install-azd.sh | bash
      
      - name: Azure Login
        run: |
          azd auth login \
            --client-id ${{ secrets.AZURE_CLIENT_ID }} \
            --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
            --tenant-id ${{ secrets.AZURE_TENANT_ID }}
      
      - name: Deploy
        run: azd up --no-prompt
```

---

**Q: Bagaimana cara menangani rahasia dan data sensitif?**

A: AZD terintegrasi dengan Azure Key Vault secara otomatis:

```bash
# Rahasia disimpan di Key Vault, bukan di kode
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)"

# AZD secara otomatis:
# 1. Membuat Key Vault
# 2. Menyimpan rahasia
# 3. Memberikan aplikasi akses melalui Identitas Terkelola
# 4. Menyuntikkan saat runtime
```

**Jangan pernah komit:**
- folder `.azure/` (berisi data lingkungan)
- file `.env` (rahasia lokal)
- String koneksi

---

**Q: Bisakah saya melakukan deploy ke beberapa wilayah?**

A: Ya, buat lingkungan per wilayah:

```bash
# Lingkungan AS Timur
azd env new prod-eastus
azd env set AZURE_LOCATION eastus
azd up

# Lingkungan Eropa Barat
azd env new prod-westeurope
azd env set AZURE_LOCATION westeurope
azd up

# Setiap lingkungan bersifat independen
azd env list
```

Untuk aplikasi multi-wilayah sejati, sesuaikan template Bicep untuk melakukan deploy ke beberapa wilayah secara bersamaan.

---

**Q: Ke mana saya bisa mendapatkan bantuan jika saya terjebak?**

1. **Dokumentasi AZD:** https://learn.microsoft.com/azure/developer/azure-developer-cli/
2. **Isu GitHub:** https://github.com/Azure/azure-dev/issues
3. **Discord:** [Azure Discord](https://discord.gg/microsoft-azure) - saluran #azure-developer-cli
4. **Stack Overflow:** Tag `azure-developer-cli`
5. **Kursus ini:** [Panduan Pemecahan Masalah](../chapter-07-troubleshooting/common-issues.md)

**Tip pro:** Sebelum bertanya, jalankan:
```bash
azd show       # Menampilkan status saat ini
azd version    # Menampilkan versi Anda
```
Sertakan informasi ini dalam pertanyaan Anda untuk bantuan lebih cepat.

---

## 🎓 Apa Selanjutnya?

Sekarang Anda memahami dasar-dasar AZD. Pilih jalur Anda:

### 🎯 Untuk Pemula:
1. **Selanjutnya:** [Instalasi & Pengaturan](installation.md) - Instal AZD di mesin Anda
2. **Kemudian:** [Proyek Pertama Anda](first-project.md) - Terapkan aplikasi pertama Anda
3. **Latihan:** Selesaikan semua 3 latihan dalam pelajaran ini

### 🚀 Untuk Pengembang AI:
1. **Loncat ke:** [Bab 2: Pengembangan Berfokus pada AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
2. **Terapkan:** Mulai dengan `azd init --template get-started-with-ai-chat`
3. **Pelajari:** Bangun sambil Anda menerapkan

### 🏗️ Untuk Pengembang Berpengalaman:
1. **Tinjau:** [Panduan Konfigurasi](configuration.md) - Pengaturan lanjutan
2. **Jelajahi:** [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md) - Pendalaman Bicep
3. **Bangun:** Buat template kustom untuk stack Anda

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 1 - Dasar & Memulai Cepat  
- **⬅️ Sebelumnya**: [Ikhtisar Kursus](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Berikutnya**: [Instalasi & Pengaturan](installation.md)
- **🚀 Bab Berikutnya**: [Bab 2: Pengembangan Berfokus pada AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai ketepatan, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat penting, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->