<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c58e92a5b56ad73610b95518b0eea386",
  "translation_date": "2025-09-18T08:29:55+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "tl"
}
-->
# Gabay sa Pag-install at Setup

**Pag-navigate sa Kabanata:**
- **📚 Course Home**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilisang Simula
- **⬅️ Nakaraan**: [Mga Pangunahing Kaalaman ng AZD](azd-basics.md)
- **➡️ Susunod**: [Ang Iyong Unang Proyekto](first-project.md)
- **🚀 Susunod na Kabanata**: [Kabanata 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)

## Panimula

Ang komprehensibong gabay na ito ay magtuturo sa iyo kung paano i-install at i-configure ang Azure Developer CLI (azd) sa iyong sistema. Malalaman mo ang iba't ibang paraan ng pag-install para sa iba't ibang operating system, setup ng authentication, at paunang configuration upang ihanda ang iyong development environment para sa Azure deployments.

## Mga Layunin sa Pag-aaral

Sa pagtatapos ng araling ito, ikaw ay:
- Matagumpay na makakapag-install ng Azure Developer CLI sa iyong operating system
- Makakapag-configure ng authentication sa Azure gamit ang iba't ibang paraan
- Makakapag-setup ng iyong development environment kasama ang mga kinakailangang prerequisites
- Maiintindihan ang iba't ibang opsyon sa pag-install at kailan gagamitin ang bawat isa
- Makakapag-troubleshoot ng mga karaniwang isyu sa pag-install at setup

## Mga Resulta ng Pag-aaral

Pagkatapos makumpleto ang araling ito, magagawa mo ang sumusunod:
- I-install ang azd gamit ang tamang paraan para sa iyong platform
- Mag-authenticate sa Azure gamit ang `azd auth login`
- I-verify ang iyong pag-install at subukan ang mga pangunahing utos ng azd
- I-configure ang iyong development environment para sa optimal na paggamit ng azd
- Malutas ang mga karaniwang problema sa pag-install nang mag-isa

Ang gabay na ito ay tutulong sa iyo na i-install at i-configure ang Azure Developer CLI sa iyong sistema, anuman ang iyong operating system o development environment.

## Mga Kinakailangan

Bago i-install ang azd, tiyakin na mayroon ka ng sumusunod:
- **Azure subscription** - [Gumawa ng libreng account](https://azure.microsoft.com/free/)
- **Azure CLI** - Para sa authentication at pamamahala ng resources
- **Git** - Para sa pag-clone ng mga template at version control
- **Docker** (opsyonal) - Para sa mga containerized na aplikasyon

## Mga Paraan ng Pag-install

### Windows

#### Opsyon 1: PowerShell (Inirerekomenda)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opsyon 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Opsyon 3: Chocolatey
```cmd
choco install azd
```

#### Opsyon 4: Manual na Pag-install
1. I-download ang pinakabagong release mula sa [GitHub](https://github.com/Azure/azure-dev/releases)
2. I-extract sa `C:\Program Files\azd\`
3. Idagdag sa PATH environment variable

### macOS

#### Opsyon 1: Homebrew (Inirerekomenda)
```bash
brew tap azure/azd
brew install azd
```

#### Opsyon 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opsyon 3: Manual na Pag-install
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opsyon 1: Install Script (Inirerekomenda)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opsyon 2: Package Managers

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

Ang azd ay pre-installed na sa GitHub Codespaces. Gumawa lamang ng codespace at simulan ang paggamit ng azd kaagad.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ I-verify ang Pag-install

Pagkatapos ng pag-install, tiyakin na gumagana nang tama ang azd:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Inaasahang output:
```
azd version 1.5.0 (commit abc123)
```

## Setup ng Authentication

### Azure CLI Authentication (Inirerekomenda)
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

### Device Code Authentication
Kung ikaw ay nasa headless system o may problema sa browser:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Para sa mga automated na environment:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Configuration

### Global Configuration
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Environment Variables
Idagdag sa iyong shell profile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## Integrasyon sa IDE

### Visual Studio Code
I-install ang Azure Developer CLI extension:
1. Buksan ang VS Code
2. Pumunta sa Extensions (Ctrl+Shift+X)
3. Hanapin ang "Azure Developer CLI"
4. I-install ang extension

Mga Tampok:
- IntelliSense para sa azure.yaml
- Integrated terminal commands
- Pag-browse ng mga template
- Monitoring ng deployment

### GitHub Codespaces
Gumawa ng `.devcontainer/devcontainer.json`:
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
1. I-install ang Azure plugin
2. I-configure ang Azure credentials
3. Gamitin ang integrated terminal para sa mga utos ng azd

## 🐛 Troubleshooting ng Pag-install

### Mga Karaniwang Isyu

#### Permission Denied (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Issues
Manu-manong idagdag ang azd sa iyong PATH:

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
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Pagkuha ng Karagdagang Tulong
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Pag-update ng azd

### Automatic Updates
Ang azd ay magbibigay ng abiso kapag may available na update:
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

## Mga Susunod na Hakbang

1. **Kumpletuhin ang authentication**: Tiyakin na ma-access mo ang iyong Azure subscription
2. **Subukan ang iyong unang deployment**: Sundan ang [Gabay sa Unang Proyekto](first-project.md)
3. **I-explore ang mga template**: I-browse ang mga available na template gamit ang `azd template list`
4. **I-configure ang iyong IDE**: I-setup ang iyong development environment

## Suporta

Kung makaranas ng mga isyu:
- [Opisyal na Dokumentasyon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Mag-report ng mga Isyu](https://github.com/Azure/azure-dev/issues)
- [Mga Diskusyon ng Komunidad](https://github.com/Azure/azure-dev/discussions)
- [Suporta ng Azure](https://azure.microsoft.com/support/)

---

**Pag-navigate sa Kabanata:**
- **📚 Course Home**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilisang Simula
- **⬅️ Nakaraan**: [Mga Pangunahing Kaalaman ng AZD](azd-basics.md) 
- **➡️ Susunod**: [Ang Iyong Unang Proyekto](first-project.md)
- **🚀 Susunod na Kabanata**: [Kabanata 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)

**✅ Kumpleto na ang Pag-install!** Magpatuloy sa [Ang Iyong Unang Proyekto](first-project.md) upang simulan ang paggawa gamit ang azd.

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.