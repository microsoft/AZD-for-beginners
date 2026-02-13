# Installation & Setup Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Ang komprehensibong gabay na ito ay gagabay sa iyo sa pag-install at pagsasaayos ng Azure Developer CLI (azd) sa iyong sistema. Matututuhan mo ang iba't ibang paraan ng pag-install para sa iba't ibang operating system, pagsasaayos ng awentikasyon, at paunang konfigurasiyon upang ihanda ang iyong development environment para sa mga deployment sa Azure.

## Learning Goals

Sa pagtatapos ng araling ito, magagawa mo:
- Matagumpay na mai-install ang Azure Developer CLI sa iyong operating system
- Isaayos ang awentikasyon sa Azure gamit ang iba't ibang pamamaraan
- Ihanda ang iyong development environment na may kinakailangang prerequisites
- Maunawaan ang iba't ibang opsyon sa pag-install at kung kailan gagamitin ang bawat isa
- Mag-troubleshoot ng mga karaniwang isyu sa pag-install at pagsasaayos

## Learning Outcomes

Pagkatapos makumpleto ang araling ito, magagawa mo:
- Mag-install ng azd gamit ang angkop na paraan para sa iyong platform
- Mag-awentikasyon sa Azure gamit ang azd auth login
- Beripikahin ang iyong pag-install at subukan ang mga pangunahing utos ng azd
- Isaayos ang iyong development environment para sa pinakamainam na paggamit ng azd
- Lutasin ang mga karaniwang problema sa pag-install nang mag-isa

Tutulungan ka ng gabay na ito na i-install at isaayos ang Azure Developer CLI sa iyong sistema, anuman ang iyong operating system o development environment.

## Prerequisites

Bago i-install ang azd, tiyakin na mayroon ka:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - Para sa awentikasyon at pamamahala ng mga resource
- **Git** - Para sa pag-clone ng mga template at version control
- **Docker** (optional) - Para sa containerized na mga aplikasyon

## Installation Methods

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# Patakbuhin bilang Administrator o gamit ang pinataas na pribilehiyo
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
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
# I-download at i-install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Ubuntu/Debian:**
```bash
# Magdagdag ng repositoryo ng package ng Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Mag-install ng azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Idagdag ang repositoryo ng mga pakete ng Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd comes pre-installed in GitHub Codespaces. Simply create a codespace and start using azd immediately.

### Docker

```bash
# Patakbuhin ang azd sa isang konteyner
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Gumawa ng alias para mas madaling gamitin
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verify Installation

After installation, verify azd is working correctly:

```bash
# Suriin ang bersyon
azd version

# Tingnan ang tulong
azd --help

# Ilista ang mga magagamit na template
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
- [ ] `az account show` displays your Azure subscription
- [ ] You can create a test directory and run `azd init` successfully

**If all checks pass, you're ready to proceed to [Your First Project](first-project.md)!**

## Authentication Setup

### Azure CLI Authentication (Recommended)
```bash
# I-install ang Azure CLI kung hindi pa naka-install
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Mag-login sa Azure
az login

# Suriin ang awtentikasyon
az account show
```

### Device Code Authentication
If you're on a headless system or having browser issues:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
For automated environments:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Configuration

### Global Configuration
```bash
# Itakda ang default na subscription
azd config set defaults.subscription <subscription-id>

# Itakda ang default na lokasyon
azd config set defaults.location eastus2

# Tingnan ang lahat ng konfigurasyon
azd config list
```

### Environment Variables
Add to your shell profile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfigurasyon ng Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Konfigurasyon ng azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Paganahin ang pag-log ng debug
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
# Patakbuhin ang PowerShell bilang Administrator
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
# I-configure ang proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Laktawan ang pag-verify ng SSL (hindi inirerekomenda para sa produksyon)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# Alisin ang mga lumang pag-install
# Windows: patakbuhin ang winget uninstall Microsoft.Azd
# macOS: patakbuhin ang brew uninstall azd
# Linux: patakbuhin ang sudo apt remove azd

# Linisin ang konfigurasyon
rm -rf ~/.azd
```

### Getting More Help
```bash
# Paganahin ang pag-log ng debug
export AZD_DEBUG=true
azd <command> --debug

# Tingnan ang kasalukuyang konfigurasyon
azd config list

# Tingnan ang kasalukuyang katayuan ng deployment
azd show
```

## Updating azd

### Automatic Updates
azd will notify you when updates are available:
```bash
azd version --check-for-updates
```

### Manual Updates

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

## 💡 Frequently Asked Questions

<details>
<summary><strong>Ano ang pagkakaiba ng azd at az CLI?</strong></summary>

**Azure CLI (az)**: Mababang-level na tool para pamahalaan ang mga indibidwal na resource ng Azure
- `az webapp create`, `az storage account create`
- Isang resource sa bawat pagkakataon
- Nakatuon sa pamamahala ng imprastruktura

**Azure Developer CLI (azd)**: Mataas na-level na tool para sa kumpletong deployment ng aplikasyon
- `azd up` deploys entire app with all resources
- Template-based workflows
- Nakatuon sa pagiging produktibo ng developer

**You need both**: azd uses az CLI for authentication
</details>

<details>
<summary><strong>Maaari ko bang gamitin ang azd sa umiiral na mga resource ng Azure?</strong></summary>

Oo! Maaari mong:
1. I-import ang umiiral na mga resource sa azd environments
2. I-referensiya ang umiiral na mga resource sa iyong mga template ng Bicep
3. Gamitin ang azd para sa mga bagong deployment kasabay ng umiiral na imprastruktura

Tingnan ang [Gabay sa Pagsasaayos](configuration.md) para sa mga detalye.
</details>

<details>
<summary><strong>Gumagana ba ang azd sa Azure Government o Azure China?</strong></summary>

Oo, i-configure ang cloud:
```bash
# Azure para sa Pamahalaan
az cloud set --name AzureUSGovernment
az login

# Azure Tsina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Maaari ko bang gamitin ang azd sa mga pipeline ng CI/CD?</strong></summary>

Siyempre! Idinisenyo ang azd para sa automation:
- GitHub Actions integration
- Azure DevOps support
- Service principal authentication
- Non-interactive mode

Tingnan ang [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) para sa mga pattern ng CI/CD.
</details>

<details>
<summary><strong>Magkano ang halaga ng paggamit ng azd?</strong></summary>

Ang azd mismo ay **ganap na libre** at open-source. Babayaran mo lamang para sa:
- Mga resource ng Azure na iyong ide-deploy
- Gastos sa paggamit ng Azure (compute, storage, atbp.)

Gamitin ang `azd provision --preview` para tantiyahin ang mga gastos bago mag-deploy.
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
Paunawa:
Ang dokumentong ito ay naisalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na may awtoridad. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot para sa anumang hindi pagkakaintindihan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->