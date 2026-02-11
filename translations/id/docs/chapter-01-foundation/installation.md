# Installation & Setup Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD Untuk Pemula](../../README.md)
- **📖 Current Chapter**: Bab 1 - Dasar & Memulai Cepat
- **⬅️ Previous**: [Dasar-dasar AZD](azd-basics.md)
- **➡️ Next**: [Proyek Pertama Anda](first-project.md)
- **🚀 Next Chapter**: [Bab 2: Pengembangan Berorientasi AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Pendahuluan

Panduan komprehensif ini akan memandu Anda melalui pemasangan dan konfigurasi Azure Developer CLI (azd) di sistem Anda. Anda akan mempelajari beberapa metode instalasi untuk berbagai sistem operasi, pengaturan otentikasi, dan konfigurasi awal untuk mempersiapkan lingkungan pengembangan Anda untuk penyebaran ke Azure.

## Tujuan Pembelajaran

Di akhir pelajaran ini, Anda akan:
- Berhasil menginstal Azure Developer CLI di sistem operasi Anda
- Mengonfigurasi otentikasi dengan Azure menggunakan beberapa metode
- Menyiapkan lingkungan pengembangan dengan prasyarat yang diperlukan
- Memahami berbagai opsi instalasi dan kapan menggunakan masing-masing
- Memecahkan masalah umum instalasi dan pengaturan

## Hasil Pembelajaran

Setelah menyelesaikan pelajaran ini, Anda akan dapat:
- Menginstal azd menggunakan metode yang sesuai untuk platform Anda
- Mengotentikasi dengan Azure menggunakan azd auth login
- Memverifikasi instalasi dan menguji perintah dasar azd
- Mengonfigurasi lingkungan pengembangan Anda untuk penggunaan azd yang optimal
- Menyelesaikan masalah instalasi umum secara mandiri

Panduan ini akan membantu Anda menginstal dan mengonfigurasi Azure Developer CLI di sistem Anda, terlepas dari sistem operasi atau lingkungan pengembangan Anda.

## Prasyarat

Sebelum menginstal azd, pastikan Anda memiliki:
- **Azure subscription** - [Buat akun gratis](https://azure.microsoft.com/free/)
- **Azure CLI** - Untuk otentikasi dan manajemen sumber daya
- **Git** - Untuk mengkloning template dan kontrol versi
- **Docker** (opsional) - Untuk aplikasi yang dikontainerkan

## Metode Instalasi

### Windows

#### Opsi 1: PowerShell (Disarankan)
```powershell
# Jalankan sebagai Administrator atau dengan hak istimewa yang ditinggikan
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opsi 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Opsi 3: Chocolatey
```cmd
choco install azd
```

#### Opsi 4: Manual Installation
1. Unduh rilis terbaru dari [GitHub](https://github.com/Azure/azure-dev/releases)
2. Ekstrak ke `C:\Program Files\azd\`
3. Tambahkan ke variabel lingkungan PATH

### macOS

#### Opsi 1: Homebrew (Disarankan)
```bash
brew tap azure/azd
brew install azd
```

#### Opsi 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opsi 3: Manual Installation
```bash
# Unduh dan pasang
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opsi 1: Install Script (Disarankan)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opsi 2: Package Managers

**Ubuntu/Debian:**
```bash
# Tambahkan repositori paket Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Instal azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Tambahkan repositori paket Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd sudah terpasang di GitHub Codespaces. Cukup buat codespace dan mulai gunakan azd segera.

### Docker

```bash
# Jalankan azd di dalam kontainer
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Buat alias agar lebih mudah digunakan
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verifikasi Instalasi

Setelah instalasi, verifikasi bahwa azd berfungsi dengan benar:

```bash
# Periksa versi
azd version

# Lihat bantuan
azd --help

# Daftar template yang tersedia
azd template list
```

Keluaran yang diharapkan:
```
azd version 1.x.x (commit xxxxxx)
```

**Catatan**: Nomor versi yang sebenarnya akan bervariasi. Periksa [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) untuk versi terbaru.

**✅ Daftar Periksa Keberhasilan Instalasi:**
- [ ] `azd version` menampilkan nomor versi tanpa kesalahan
- [ ] `azd --help` menampilkan dokumentasi perintah
- [ ] `azd template list` menampilkan template yang tersedia
- [ ] `az account show` menampilkan subscription Azure Anda
- [ ] Anda dapat membuat direktori uji dan menjalankan `azd init` dengan sukses

**Jika semua pemeriksaan lulus, Anda siap melanjutkan ke [Proyek Pertama Anda](first-project.md)!**

## Pengaturan Otentikasi

### Otentikasi Azure CLI (Disarankan)
```bash
# Instal Azure CLI jika belum terpasang
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Masuk ke Azure
az login

# Periksa autentikasi
az account show
```

### Otentikasi Kode Perangkat
Jika Anda berada di sistem headless atau mengalami masalah browser:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Untuk lingkungan otomatis:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfigurasi

### Konfigurasi Global
```bash
# Atur langganan default
azd config set defaults.subscription <subscription-id>

# Atur lokasi default
azd config set defaults.location eastus2

# Lihat semua konfigurasi
azd config list
```

### Variabel Lingkungan
Tambahkan ke profil shell Anda (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfigurasi Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Konfigurasi azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Aktifkan pencatatan debug
```

## Integrasi IDE

### Visual Studio Code
Pasang ekstensi Azure Developer CLI:
1. Buka VS Code
2. Pergi ke Extensions (Ctrl+Shift+X)
3. Cari "Azure Developer CLI"
4. Pasang ekstensi

Fitur:
- IntelliSense untuk azure.yaml
- Perintah terminal terintegrasi
- Penjelajahan template
- Pemantauan penyebaran

### GitHub Codespaces
Buat `.devcontainer/devcontainer.json`:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. Pasang plugin Azure
2. Konfigurasikan kredensial Azure
3. Gunakan terminal terintegrasi untuk perintah azd

## 🐛 Pemecahan Masalah Instalasi

### Masalah Umum

#### Izin Ditolak (Windows)
```powershell
# Jalankan PowerShell sebagai Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Masalah PATH
Tambahkan azd ke PATH Anda secara manual:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Masalah Jaringan/Proxy
```bash
# Konfigurasi proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Lewati verifikasi SSL (tidak disarankan untuk produksi)
azd config set http.insecure true
```

#### Konflik Versi
```bash
# Hapus instalasi lama
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Bersihkan konfigurasi
rm -rf ~/.azd
```

### Mendapatkan Bantuan Lebih Lanjut
```bash
# Aktifkan pencatatan debug
export AZD_DEBUG=true
azd <command> --debug

# Lihat konfigurasi saat ini
azd config list

# Lihat status penerapan saat ini
azd show
```

## Memperbarui azd

### Pembaruan Otomatis
azd akan memberi tahu Anda ketika pembaruan tersedia:
```bash
azd version --check-for-updates
```

### Pembaruan Manual

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 Pertanyaan yang Sering Diajukan

<details>
<summary><strong>Apa perbedaan antara azd dan az CLI?</strong></summary>

**Azure CLI (az)**: Alat tingkat rendah untuk mengelola sumber daya Azure secara individu
- `az webapp create`, `az storage account create`
- Satu sumber daya pada satu waktu
- Fokus pada manajemen infrastruktur

**Azure Developer CLI (azd)**: Alat tingkat tinggi untuk penyebaran aplikasi lengkap
- `azd up` menyebarkan seluruh aplikasi dengan semua sumber daya
- Alur kerja berbasis template
- Fokus pada produktivitas pengembang

**Anda memerlukan keduanya**: azd menggunakan az CLI untuk otentikasi
</details>

<details>
<summary><strong>Bisakah saya menggunakan azd dengan sumber daya Azure yang sudah ada?</strong></summary>

Ya! Anda dapat:
1. Mengimpor sumber daya yang sudah ada ke dalam lingkungan azd
2. Mereferensikan sumber daya yang sudah ada dalam template Bicep Anda
3. Menggunakan azd untuk penyebaran baru di samping infrastruktur yang sudah ada

Lihat [Panduan Konfigurasi](configuration.md) untuk detail.
</details>

<details>
<summary><strong>Apakah azd berfungsi dengan Azure Government atau Azure China?</strong></summary>

Ya, konfigurasikan cloud:
```bash
# Azure Pemerintah
az cloud set --name AzureUSGovernment
az login

# Azure Tiongkok
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Bisakah saya menggunakan azd dalam pipeline CI/CD?</strong></summary>

Tentu! azd dirancang untuk otomatisasi:
- Integrasi GitHub Actions
- Dukungan Azure DevOps
- Otentikasi service principal
- Mode non-interaktif

Lihat [Panduan Penyebaran](../chapter-04-infrastructure/deployment-guide.md) untuk pola CI/CD.
</details>

<details>
<summary><strong>Berapa biaya penggunaan azd?</strong></summary>

azd sendiri **sepenuhnya gratis** dan sumber terbuka. Anda hanya membayar untuk:
- Sumber daya Azure yang Anda sebarkan
- Biaya konsumsi Azure (compute, storage, dll.)

Gunakan `azd provision --preview` untuk memperkirakan biaya sebelum penyebaran.
</details>

## Langkah Selanjutnya

1. **Selesaikan otentikasi**: Pastikan Anda dapat mengakses subscription Azure Anda
2. **Coba penyebaran pertama Anda**: Ikuti [Panduan Proyek Pertama](first-project.md)
3. **Jelajahi template**: Telusuri template yang tersedia dengan `azd template list`
4. **Konfigurasikan IDE Anda**: Siapkan lingkungan pengembangan Anda

## Dukungan

Jika Anda menemukan masalah:
- [Dokumentasi Resmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Laporkan Masalah](https://github.com/Azure/azure-dev/issues)
- [Diskusi Komunitas](https://github.com/Azure/azure-dev/discussions)
- [Dukungan Azure](https://azure.microsoft.com/support/)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD Untuk Pemula](../../README.md)
- **📖 Current Chapter**: Bab 1 - Dasar & Memulai Cepat
- **⬅️ Previous**: [Dasar-dasar AZD](azd-basics.md) 
- **➡️ Next**: [Proyek Pertama Anda](first-project.md)
- **🚀 Next Chapter**: [Bab 2: Pengembangan Berorientasi AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalasi Selesai!** Lanjutkan ke [Proyek Pertama Anda](first-project.md) untuk mulai membangun dengan azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai ketepatan, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidaktepatan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang salah yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->