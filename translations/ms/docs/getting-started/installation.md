<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c58e92a5b56ad73610b95518b0eea386",
  "translation_date": "2025-09-18T08:12:55+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "ms"
}
-->
# Panduan Pemasangan & Persediaan

**Navigasi Bab:**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Permulaan Pantas
- **⬅️ Sebelumnya**: [Asas AZD](azd-basics.md)
- **➡️ Seterusnya**: [Projek Pertama Anda](first-project.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan AI-First](../ai-foundry/azure-ai-foundry-integration.md)

## Pengenalan

Panduan lengkap ini akan membantu anda memasang dan mengkonfigurasi Azure Developer CLI (azd) pada sistem anda. Anda akan mempelajari pelbagai kaedah pemasangan untuk sistem operasi yang berbeza, persediaan pengesahan, dan konfigurasi awal untuk menyediakan persekitaran pembangunan anda bagi penggunaan Azure.

## Matlamat Pembelajaran

Pada akhir pelajaran ini, anda akan:
- Berjaya memasang Azure Developer CLI pada sistem operasi anda
- Mengkonfigurasi pengesahan dengan Azure menggunakan pelbagai kaedah
- Menyediakan persekitaran pembangunan anda dengan keperluan yang diperlukan
- Memahami pilihan pemasangan yang berbeza dan bila untuk menggunakannya
- Menyelesaikan masalah biasa berkaitan pemasangan dan persediaan

## Hasil Pembelajaran

Selepas melengkapkan pelajaran ini, anda akan dapat:
- Memasang azd menggunakan kaedah yang sesuai untuk platform anda
- Mengesahkan dengan Azure menggunakan `azd auth login`
- Memeriksa pemasangan anda dan menguji arahan asas azd
- Mengkonfigurasi persekitaran pembangunan anda untuk penggunaan azd yang optimum
- Menyelesaikan masalah pemasangan secara berdikari

Panduan ini akan membantu anda memasang dan mengkonfigurasi Azure Developer CLI pada sistem anda, tanpa mengira sistem operasi atau persekitaran pembangunan anda.

## Prasyarat

Sebelum memasang azd, pastikan anda mempunyai:
- **Langganan Azure** - [Buat akaun percuma](https://azure.microsoft.com/free/)
- **Azure CLI** - Untuk pengesahan dan pengurusan sumber
- **Git** - Untuk klon templat dan kawalan versi
- **Docker** (pilihan) - Untuk aplikasi berasaskan kontena

## Kaedah Pemasangan

### Windows

#### Pilihan 1: PowerShell (Disyorkan)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Pilihan 2: Pengurus Pakej Windows (winget)
```cmd
winget install Microsoft.Azd
```

#### Pilihan 3: Chocolatey
```cmd
choco install azd
```

#### Pilihan 4: Pemasangan Manual
1. Muat turun keluaran terkini dari [GitHub](https://github.com/Azure/azure-dev/releases)
2. Ekstrak ke `C:\Program Files\azd\`
3. Tambahkan ke pemboleh ubah PATH

### macOS

#### Pilihan 1: Homebrew (Disyorkan)
```bash
brew tap azure/azd
brew install azd
```

#### Pilihan 2: Skrip Pemasangan
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Pilihan 3: Pemasangan Manual
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Pilihan 1: Skrip Pemasangan (Disyorkan)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Pilihan 2: Pengurus Pakej

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

azd telah dipasang terlebih dahulu dalam GitHub Codespaces. Cipta sahaja codespace dan mula menggunakan azd dengan segera.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Periksa Pemasangan

Selepas pemasangan, periksa azd berfungsi dengan betul:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Output yang dijangkakan:
```
azd version 1.5.0 (commit abc123)
```

## Persediaan Pengesahan

### Pengesahan Azure CLI (Disyorkan)
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

### Pengesahan Kod Peranti
Jika anda menggunakan sistem tanpa kepala atau menghadapi masalah pelayar:
```bash
az login --use-device-code
```

### Prinsipal Perkhidmatan (CI/CD)
Untuk persekitaran automatik:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfigurasi

### Konfigurasi Global
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Pemboleh Ubah Persekitaran
Tambahkan ke profil shell anda (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## Integrasi IDE

### Visual Studio Code
Pasang sambungan Azure Developer CLI:
1. Buka VS Code
2. Pergi ke Extensions (Ctrl+Shift+X)
3. Cari "Azure Developer CLI"
4. Pasang sambungan tersebut

Ciri-ciri:
- IntelliSense untuk azure.yaml
- Arahan terminal bersepadu
- Penjelajahan templat
- Pemantauan penggunaan

### GitHub Codespaces
Cipta `.devcontainer/devcontainer.json`:
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
2. Konfigurasi kelayakan Azure
3. Gunakan terminal bersepadu untuk arahan azd

## 🐛 Penyelesaian Masalah Pemasangan

### Masalah Biasa

#### Kebenaran Ditolak (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Masalah PATH
Tambahkan azd secara manual ke PATH anda:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Masalah Rangkaian/Proksi
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

### Mendapatkan Bantuan Tambahan
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Kemas Kini azd

### Kemas Kini Automatik
azd akan memberitahu anda apabila kemas kini tersedia:
```bash
azd version --check-for-updates
```

### Kemas Kini Manual

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

## Langkah Seterusnya

1. **Lengkapkan pengesahan**: Pastikan anda boleh mengakses langganan Azure anda
2. **Cuba penggunaan pertama anda**: Ikuti [Panduan Projek Pertama](first-project.md)
3. **Terokai templat**: Semak templat yang tersedia dengan `azd template list`
4. **Konfigurasi IDE anda**: Sediakan persekitaran pembangunan anda

## Sokongan

Jika anda menghadapi masalah:
- [Dokumentasi Rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Laporkan Masalah](https://github.com/Azure/azure-dev/issues)
- [Perbincangan Komuniti](https://github.com/Azure/azure-dev/discussions)
- [Sokongan Azure](https://azure.microsoft.com/support/)

---

**Navigasi Bab:**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Permulaan Pantas
- **⬅️ Sebelumnya**: [Asas AZD](azd-basics.md) 
- **➡️ Seterusnya**: [Projek Pertama Anda](first-project.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan AI-First](../ai-foundry/azure-ai-foundry-integration.md)

**✅ Pemasangan Selesai!** Teruskan ke [Projek Pertama Anda](first-project.md) untuk mula membina dengan azd.

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat yang kritikal, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.