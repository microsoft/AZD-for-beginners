# Gabay sa Pag-install at Setup

**Pag-navigate ng Kabanata:**
- **📚 Bahay ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Foundation & Quick Start
- **⬅️ Nakaraang**: [AZD Basics](azd-basics.md)
- **➡️ Susunod**: [Ang Iyong Unang Proyekto](first-project.md)
- **🚀 Susunod na Kabanata**: [Kabanata 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Panimula

Ang kumprehensibong gabay na ito ay gagabay sa iyo sa pag-install at pag-configure ng Azure Developer CLI (azd) sa iyong sistema. Malalaman mo ang maraming paraan ng pag-install para sa iba't ibang operating system, pag-setup ng authentication, at paunang konfigurasyon upang ihanda ang iyong development environment para sa mga deployment sa Azure.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng araling ito, ikaw ay:
- Matagumpay na naka-install ng Azure Developer CLI sa iyong operating system
- Nakapag-configure ng authentication sa Azure gamit ang iba't ibang pamamaraan
- Nakatayo ang iyong development environment na may kinakailangang prerequisites
- Naiintindihan ang iba't ibang opsyon sa pag-install at kung kailan gagamitin ang bawat isa
- Nakakapag-troubleshoot ng mga karaniwang isyu sa pag-install at setup

## Mga Kinalabasan ng Pagkatuto

Pagkatapos makumpleto ang araling ito, magagawa mong:
- Mag-install ng azd gamit ang angkop na paraan para sa iyong platform
- Mag-authenticate sa Azure gamit ang azd auth login
- Beripikahin ang iyong pag-install at subukan ang mga pangunahing azd na utos
- I-configure ang iyong development environment para sa pinakamainam na paggamit ng azd
- Lutasin ang mga karaniwang problema sa pag-install nang mag-isa

Tutulungan ka ng gabay na ito na i-install at i-configure ang Azure Developer CLI sa iyong sistema, anuman ang iyong operating system o development environment.

## Mga Kinakailangan

Bago mag-install ng azd, tiyakin na mayroon ka:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - Para sa authentication at pamamahala ng mga resources
- **Git** - Para sa pag-clone ng mga template at version control
- **Docker** (opsyonal) - Para sa mga containerized na aplikasyon

## Mga Paraan ng Pag-install

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# Patakbuhin bilang Administrator o may pinataas na pribilehiyo
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
1. I-download ang pinakabagong release mula sa [GitHub](https://github.com/Azure/azure-dev/releases)
2. I-extract sa `C:\Program Files\azd\`
3. Idagdag sa PATH environment variable

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
# Idagdag ang repositoryo ng package ng Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# I-install ang azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Magdagdag ng repositoryo ng mga pakete ng Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

Ang azd ay naka-pre-install na sa GitHub Codespaces. Lumikha lamang ng codespace at simulan agad ang paggamit ng azd.

### Docker

```bash
# Patakbuhin ang azd sa loob ng isang container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Gumawa ng alias para mas madaling gamitin
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Beripikahin ang Pag-install

Pagkatapos ng pag-install, beripikahin na gumagana nang maayos ang azd:

```bash
# Suriin ang bersyon
azd version

# Tingnan ang tulong
azd --help

# Ilista ang mga magagamit na template
azd template list
```

Inaasahang output:
```
azd version 1.x.x (commit xxxxxx)
```

**Tandaan**: Ang aktwal na numero ng bersyon ay mag-iiba. Tingnan ang [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) para sa pinakabagong bersyon.

**✅ Checklist ng Matagumpay na Pag-install:**
- [ ] `azd version` ay nagpapakita ng numero ng bersyon nang walang error
- [ ] `azd --help` ay nagpapakita ng dokumentasyon ng mga utos
- [ ] `azd template list` ay nagpapakita ng mga magagamit na template
- [ ] `az account show` ay nagpapakita ng iyong Azure subscription
- [ ] Maaari kang lumikha ng test directory at patakbuhin ang `azd init` nang matagumpay

**Kung pumasa ang lahat ng tsek, handa ka nang magpatuloy sa [Ang Iyong Unang Proyekto](first-project.md)!**

## Pag-setup ng Authentication

### Azure CLI Authentication (Recommended)
```bash
# I-install ang Azure CLI kung hindi pa ito naka-install
# Windows: gamitin ang winget install Microsoft.AzureCLI
# macOS: gamitin ang brew install azure-cli
# Linux: gamitin ang curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Mag-login sa Azure
az login

# Suriin ang awtentikasyon
az account show
```

### Device Code Authentication
Kung ikaw ay nasa headless na sistema o nagkakaroon ng mga isyu sa browser:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Para sa mga automated na kapaligiran:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfigurasyon

### Pangkalahatang Konfigurasyon
```bash
# Itakda ang default na subscription
azd config set defaults.subscription <subscription-id>

# Itakda ang default na lokasyon
azd config set defaults.location eastus2

# Tingnan ang lahat ng konfigurasyon
azd config list
```

### Mga Variable ng Kapaligiran
Idagdag sa iyong shell profile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfigurasyon ng Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# konfigurasyon ng azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Paganahin ang pag-log ng debug
```

## Pagsasama sa IDE

### Visual Studio Code
I-install ang Azure Developer CLI extension:
1. Buksan ang VS Code
2. Pumunta sa Extensions (Ctrl+Shift+X)
3. Hanapin ang "Azure Developer CLI"
4. I-install ang extension

Mga Tampok:
- IntelliSense para sa azure.yaml
- Pinagsamang terminal na mga utos
- Pag-browse ng mga template
- Pagmo-monitor ng deployment

### GitHub Codespaces
Lumikha ng `.devcontainer/devcontainer.json`:
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
3. Gamitin ang pinagsamang terminal para sa mga utos ng azd

## 🐛 Pag-troubleshoot ng Pag-install

### Mga Karaniwang Isyu

#### Tinanggihan ang Pahintulot (Windows)
```powershell
# Patakbuhin ang PowerShell bilang Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Mga Isyu sa PATH
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

#### Mga Isyu sa Network/Proxy
```bash
# I-configure ang proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Laktawan ang pag-verify ng SSL (hindi inirerekomenda para sa produksyon)
azd config set http.insecure true
```

#### Mga Salungatan ng Bersyon
```bash
# Alisin ang mga lumang pag-install
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Linisin ang konfigurasyon
rm -rf ~/.azd
```

### Pagkuha ng Karagdagang Tulong
```bash
# Paganahin ang pag-log ng debug
export AZD_DEBUG=true
azd <command> --debug

# Tingnan ang kasalukuyang konfigurasyon
azd config list

# Tingnan ang kasalukuyang katayuan ng pag-deploy
azd show
```

## Pag-update ng azd

### Awtomatikong Mga Pag-update
Ipapaalam sa iyo ng azd kapag may magagamit na mga pag-update:
```bash
azd version --check-for-updates
```

### Manwal na Mga Pag-update

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

## 💡 Mga Madalas na Itanong

<details>
<summary><strong>Ano ang pagkakaiba ng azd at az CLI?</strong></summary>

**Azure CLI (az)**: Tool na mababa ang antas para sa pamamahala ng indibidwal na mga resource ng Azure
- `az webapp create`, `az storage account create`
- Isang resource sa isang pagkakataon
- Nakatuon sa pamamahala ng imprastruktura

**Azure Developer CLI (azd)**: Tool na mataas ang antas para sa kumpletong deployment ng aplikasyon
- `azd up` ay nagde-deploy ng buong app kasama ang lahat ng resources
- Batay sa template na mga workflow
- Nakatuon sa produktibidad ng developer

**Kailangan mo ang pareho**: gumagamit ang azd ng az CLI para sa authentication
</details>

<details>
<summary><strong>Maaari ko bang gamitin ang azd sa umiiral na mga resource ng Azure?</strong></summary>

Oo! Maaari mong:
1. I-import ang umiiral na mga resource sa azd environments
2. I-reference ang umiiral na mga resource sa iyong mga Bicep template
3. Gamitin ang azd para sa mga bagong deployment kasama ng umiiral na imprastruktura

Tingnan ang [Gabay sa Konfigurasyon](configuration.md) para sa mga detalye.
</details>

<details>
<summary><strong>Gumagana ba ang azd sa Azure Government o Azure China?</strong></summary>

Oo, i-configure ang cloud:
```bash
# Azure Pamahalaan
az cloud set --name AzureUSGovernment
az login

# Azure Tsina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Maaari ko bang gamitin ang azd sa CI/CD pipelines?</strong></summary>

Siyempre! Ang azd ay idinisenyo para sa automation:
- Integrasyon sa GitHub Actions
- Suporta sa Azure DevOps
- Service principal authentication
- Non-interactive na mode

Tingnan ang [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) para sa mga pattern ng CI/CD.
</details>

<details>
<summary><strong>Magkano ang gastos sa paggamit ng azd?</strong></summary>

Ang azd mismo ay **ganap na libre** at open-source. Magbabayad ka lamang para sa:
- Mga Azure resources na ide-deploy mo
- Mga gastos sa consumption ng Azure (compute, storage, atbp.)

Gamitin ang `azd provision --preview` upang tantiyahin ang mga gastos bago ang deployment.
</details>

## Mga Susunod na Hakbang

1. **Kumpletuhin ang authentication**: Tiyakin na maa-access mo ang iyong Azure subscription
2. **Subukan ang iyong unang deployment**: Sundan ang [First Project Guide](first-project.md)
3. **Suriin ang mga template**: I-browse ang magagamit na mga template gamit ang `azd template list`
4. **I-configure ang iyong IDE**: I-set up ang iyong development environment

## Suporta

Kung makatagpo ka ng mga isyu:
- [Opisyal na Dokumentasyon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Iulat ang Mga Isyu](https://github.com/Azure/azure-dev/issues)
- [Mga Diskusyon ng Komunidad](https://github.com/Azure/azure-dev/discussions)
- [Suporta ng Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Kumuha ng patnubay sa mga Azure na utos nang direkta sa iyong editor gamit ang `npx skills add microsoft/github-copilot-for-azure`

---

**Pag-navigate ng Kabanata:**
- **📚 Bahay ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Foundation & Quick Start
- **⬅️ Nakaraang**: [AZD Basics](azd-basics.md) 
- **➡️ Susunod**: [Ang Iyong Unang Proyekto](first-project.md)
- **🚀 Susunod na Kabanata**: [Kabanata 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Kumpleto na ang Pag-install!** Magpatuloy sa [Ang Iyong Unang Proyekto](first-project.md) upang magsimulang bumuo gamit ang azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang serbisyong AI na pagsasalin [Co-op Translator](https://github.com/Azure/co-op-translator). Habang nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o di-tumpak na impormasyon. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong pinagkukunan. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang mga hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->