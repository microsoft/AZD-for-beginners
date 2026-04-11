# Installation & Setup Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Panduan komprehensif ini akan memandu Anda melalui pemasangan dan konfigurasi Azure Developer CLI (azd) di sistem Anda. Anda akan mempelajari beberapa metode instalasi untuk berbagai sistem operasi, pengaturan autentikasi, dan konfigurasi awal untuk menyiapkan lingkungan pengembangan Anda untuk penyebaran ke Azure.

## Learning Goals

Pada akhir pelajaran ini, Anda akan:
- Berhasil menginstal Azure Developer CLI pada sistem operasi Anda
- Mengonfigurasi autentikasi dengan Azure menggunakan beberapa metode
- Menyiapkan lingkungan pengembangan Anda dengan prasyarat yang diperlukan
- Memahami berbagai opsi instalasi dan kapan harus menggunakan masing-masing
- Memecahkan masalah instalasi dan pengaturan yang umum

## Learning Outcomes

Setelah menyelesaikan pelajaran ini, Anda akan dapat:
- Menginstal azd menggunakan metode yang sesuai untuk platform Anda
- Mengautentikasi dengan Azure menggunakan azd auth login
- Memverifikasi instalasi Anda dan menguji perintah dasar azd
- Mengonfigurasi lingkungan pengembangan Anda untuk penggunaan azd yang optimal
- Menyelesaikan masalah instalasi umum secara mandiri

Panduan ini akan membantu Anda menginstal dan mengonfigurasi Azure Developer CLI di sistem Anda, terlepas dari sistem operasi atau lingkungan pengembangan Anda.

## Prerequisites

Sebelum menginstal azd, pastikan Anda memiliki:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - Untuk autentikasi dan manajemen sumber daya
- **Git** - Untuk mengkloning template dan kontrol versi
- **Docker** (opsional) - Untuk aplikasi tercontainerisasi

## Installation Methods

### Windows

#### Option 1: Windows Package Manager (Recommended)
```cmd
winget install microsoft.azd
```

#### Option 2: PowerShell Install Script
```powershell
# Berguna ketika winget tidak tersedia
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. Download the latest release from [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extract to `C:\Program Files\azd\`
3. Add to PATH environment variable

### macOS

#### Option 1: Homebrew (Recommended)
```bash
brew tap azure/azd
brew install azd
```

#### Option 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 3: Manual Installation
```bash
# Unduh dan pasang
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Manual installation from release assets:**
```bash
# Unduh arsip terbaru untuk arsitektur Linux Anda dari:
# https://github.com/Azure/azure-dev/releases
# Kemudian ekstrak dan tambahkan biner azd ke PATH Anda.
```

### GitHub Codespaces

Some Codespaces and dev container environments already include `azd`, but you should verify that rather than assume it:

```bash
azd version
```

If `azd` is missing, install it with the standard script for the environment.

### Docker

```bash
# Jalankan azd di dalam kontainer
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Buat alias agar lebih mudah digunakan
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verify Installation

After installation, verify azd is working correctly:

```bash
# Periksa versi
azd version

# Lihat bantuan
azd --help

# Daftar templat yang tersedia
azd template list
```

Expected output:
```
azd version 1.x.x (commit xxxxxx)
```

**Note**: The actual version number will vary. Check [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) for the latest version.

**✅ Installation Success Checklist:**
- [ ] `azd version` shows version number without errors
- [ ] `azd --help` displays command documentation
- [ ] `azd template list` shows available templates
- [ ] You can create a test directory and run `azd init` successfully

**If all checks pass, you're ready to proceed to [Your First Project](first-project.md)!**

## Authentication Setup

### Recommended Beginner Setup

For AZD-first workflows, sign in with `azd auth login`.

```bash
# Diperlukan untuk perintah AZD seperti azd up
azd auth login

# Verifikasi status autentikasi AZD
azd auth login --check-status
```

Use Azure CLI sign-in only when you plan to run `az` commands yourself during the course.

### Azure CLI Authentication (Optional)
```bash
# Instal Azure CLI jika belum terpasang
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: lihat dokumentasi instalasi Azure CLI untuk distribusi Anda

# Masuk ke Azure
az login

# Verifikasi autentikasi
az account show
```

### Which Sign-In Flow Should You Use?

- Use `azd auth login` if you are following the beginner AZD path and mainly running `azd` commands.
- Use `az login` as well when you want to run Azure CLI commands such as `az account show` or inspect resources directly.
- If an exercise includes both `azd` and `az` commands, run both sign-in commands once at the start.

### Device Code Authentication
If you're on a headless system or having browser issues:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
For automated environments:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Validate Your Complete Setup

If you want a quick readiness check before starting Chapter 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Configuration

### Global Configuration
```bash
# Tetapkan langganan default
azd config set defaults.subscription <subscription-id>

# Tetapkan lokasi default
azd config set defaults.location eastus2

# Lihat semua konfigurasi
azd config show
```

### Environment Variables
Add to your shell profile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfigurasi Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Konfigurasi azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Aktifkan pencatatan debug
```

## IDE Integration

### Visual Studio Code
Install the Azure Developer CLI extension:
1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Search for "Azure Developer CLI"
4. Install the extension

Features:
- IntelliSense for azure.yaml
- Integrated terminal commands
- Template browsing
- Deployment monitoring

### GitHub Codespaces
Create a `.devcontainer/devcontainer.json`:
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
1. Install the Azure plugin
2. Configure Azure credentials
3. Use integrated terminal for azd commands

## 🐛 Troubleshooting Installation

### Common Issues

#### Permission Denied (Windows)
```powershell
# Jalankan PowerShell sebagai Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Issues
Manually add azd to your PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Network/Proxy Issues
```bash
# Konfigurasikan proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Lewati verifikasi SSL (tidak disarankan untuk lingkungan produksi)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# Hapus instalasi lama
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: Hapus biner azd sebelumnya atau symlink sebelum menginstal ulang

# Bersihkan konfigurasi
rm -rf ~/.azd
```

### Getting More Help
```bash
# Aktifkan pencatatan debug
export AZD_DEBUG=true
azd <command> --debug

# Lihat konfigurasi saat ini
azd config show

# Lihat status penyebaran saat ini
azd show
```

## Updating azd

### Update Check
azd warns when a newer release is available, and you can confirm your current build with:
```bash
azd version
```

### Manual Updates

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 Frequently Asked Questions

<details>
<summary><strong>What's the difference between azd and az CLI?</strong></summary>

**Azure CLI (az)**: Low-level tool for managing individual Azure resources
- `az webapp create`, `az storage account create`
- One resource at a time
- Infrastructure management focus

**Azure Developer CLI (azd)**: High-level tool for complete application deployments
- `azd up` deploys entire app with all resources
- Template-based workflows
- Developer productivity focus

**You need both**: azd uses az CLI for authentication
</details>

<details>
<summary><strong>Can I use azd with existing Azure resources?</strong></summary>

Yes! You can:
1. Import existing resources into azd environments
2. Reference existing resources in your Bicep templates
3. Use azd for new deployments alongside existing infrastructure

See [Configuration Guide](configuration.md) for details.
</details>

<details>
<summary><strong>Does azd work with Azure Government or Azure China?</strong></summary>

Yes, configure the cloud:
```bash
# Azure Pemerintah
az cloud set --name AzureUSGovernment
az login

# Azure Cina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Can I use azd in CI/CD pipelines?</strong></summary>

Absolutely! azd is designed for automation:
- GitHub Actions integration
- Azure DevOps support
- Service principal authentication
- Non-interactive mode

See [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) for CI/CD patterns.
</details>

<details>
<summary><strong>What's the cost of using azd?</strong></summary>

azd itself is **completely free** and open-source. You only pay for:
- Azure resources you deploy
- Azure consumption costs (compute, storage, etc.)

Use `azd provision --preview` to estimate costs before deployment.
</details>

## Next Steps

1. **Complete authentication**: Ensure you can access your Azure subscription
2. **Try your first deployment**: Follow the [First Project Guide](first-project.md)
3. **Explore templates**: Browse available templates with `azd template list`
4. **Configure your IDE**: Set up your development environment

## Support

If you encounter issues:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Get Azure command guidance directly in your editor with `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md) 
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation Complete!** Continue to [Your First Project](first-project.md) to start building with azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk akurat, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->