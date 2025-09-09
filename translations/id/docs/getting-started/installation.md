<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e9fcb9121c8d0b570798d778f8904a22",
  "translation_date": "2025-09-09T21:29:13+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "id"
}
-->
# Panduan Instalasi & Pengaturan

## Pendahuluan

Panduan lengkap ini akan memandu Anda melalui proses instalasi dan konfigurasi Azure Developer CLI (azd) di sistem Anda. Anda akan mempelajari berbagai metode instalasi untuk sistem operasi yang berbeda, pengaturan autentikasi, dan konfigurasi awal untuk mempersiapkan lingkungan pengembangan Anda untuk deployment di Azure.

## Tujuan Pembelajaran

Pada akhir pelajaran ini, Anda akan:
- Berhasil menginstal Azure Developer CLI di sistem operasi Anda
- Mengonfigurasi autentikasi dengan Azure menggunakan berbagai metode
- Menyiapkan lingkungan pengembangan Anda dengan prasyarat yang diperlukan
- Memahami berbagai opsi instalasi dan kapan harus menggunakannya
- Memecahkan masalah umum terkait instalasi dan pengaturan

## Hasil Pembelajaran

Setelah menyelesaikan pelajaran ini, Anda akan dapat:
- Menginstal azd menggunakan metode yang sesuai untuk platform Anda
- Melakukan autentikasi dengan Azure menggunakan `azd auth login`
- Memverifikasi instalasi Anda dan menguji perintah dasar azd
- Mengonfigurasi lingkungan pengembangan Anda untuk penggunaan azd yang optimal
- Menyelesaikan masalah instalasi umum secara mandiri

Panduan ini akan membantu Anda menginstal dan mengonfigurasi Azure Developer CLI di sistem Anda, terlepas dari sistem operasi atau lingkungan pengembangan Anda.

## Prasyarat

Sebelum menginstal azd, pastikan Anda memiliki:
- **Langganan Azure** - [Buat akun gratis](https://azure.microsoft.com/free/)
- **Azure CLI** - Untuk autentikasi dan pengelolaan sumber daya
- **Git** - Untuk cloning template dan kontrol versi
- **Docker** (opsional) - Untuk aplikasi berbasis container

## Metode Instalasi

### Windows

#### Opsi 1: PowerShell (Direkomendasikan)
```powershell
# Run as Administrator or with elevated privileges
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

#### Opsi 4: Instalasi Manual
1. Unduh rilis terbaru dari [GitHub](https://github.com/Azure/azure-dev/releases)
2. Ekstrak ke `C:\Program Files\azd\`
3. Tambahkan ke variabel lingkungan PATH

### macOS

#### Opsi 1: Homebrew (Direkomendasikan)
```bash
brew tap azure/azd
brew install azd
```

#### Opsi 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opsi 3: Instalasi Manual
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opsi 1: Install Script (Direkomendasikan)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opsi 2: Package Managers

**Ubuntu/Debian:**
```bash
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd sudah terinstal di GitHub Codespaces. Cukup buat codespace dan mulai gunakan azd secara langsung.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verifikasi Instalasi

Setelah instalasi, verifikasi bahwa azd berfungsi dengan benar:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Output yang diharapkan:
```
azd version 1.5.0 (commit abc123)
```

## 🔐 Pengaturan Autentikasi

### Autentikasi Azure CLI (Direkomendasikan)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### Autentikasi Kode Perangkat
Jika Anda menggunakan sistem tanpa antarmuka atau mengalami masalah dengan browser:
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

## 🛠️ Konfigurasi

### Konfigurasi Global
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Variabel Lingkungan
Tambahkan ke profil shell Anda (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## 🔧 Integrasi IDE

### Visual Studio Code
Pasang ekstensi Azure Developer CLI:
1. Buka VS Code
2. Pergi ke Extensions (Ctrl+Shift+X)
3. Cari "Azure Developer CLI"
4. Pasang ekstensi tersebut

Fitur:
- IntelliSense untuk azure.yaml
- Perintah terminal terintegrasi
- Penjelajahan template
- Pemantauan deployment

### GitHub Codespaces
Buat file `.devcontainer/devcontainer.json`:
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
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Masalah PATH
Tambahkan azd secara manual ke PATH Anda:

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
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Konflik Versi
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Mendapatkan Bantuan Lebih Lanjut
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Memperbarui azd

### Pembaruan Otomatis
azd akan memberi tahu Anda saat pembaruan tersedia:
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

## Langkah Selanjutnya

1. **Selesaikan autentikasi**: Pastikan Anda dapat mengakses langganan Azure Anda
2. **Coba deployment pertama Anda**: Ikuti [Panduan Proyek Pertama](first-project.md)
3. **Jelajahi template**: Telusuri template yang tersedia dengan `azd template list`
4. **Konfigurasikan IDE Anda**: Siapkan lingkungan pengembangan Anda

## Dukungan

Jika Anda mengalami masalah:
- [Dokumentasi Resmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Laporkan Masalah](https://github.com/Azure/azure-dev/issues)
- [Diskusi Komunitas](https://github.com/Azure/azure-dev/discussions)
- [Dukungan Azure](https://azure.microsoft.com/support/)

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Dasar-dasar AZD](azd-basics.md)
- **Pelajaran Selanjutnya**: [Konfigurasi](configuration.md)

**Instalasi Selesai!** Lanjutkan ke [Proyek Pertama Anda](first-project.md) untuk mulai membangun dengan azd.

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk memberikan hasil yang akurat, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.