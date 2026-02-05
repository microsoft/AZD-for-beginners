# Gabay sa Pag-install at Setup

**Pag-navigate sa Kabanata:**
- **📚 Home ng Kurso**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilisang Simula
- **⬅️ Nakaraan**: [Mga Pangunahing Kaalaman sa AZD](azd-basics.md)
- **➡️ Susunod**: [Ang Iyong Unang Proyekto](first-project.md)
- **🚀 Susunod na Kabanata**: [Kabanata 2: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)

## Panimula

Ang detalyadong gabay na ito ay magtuturo sa iyo kung paano i-install at i-configure ang Azure Developer CLI (azd) sa iyong sistema. Malalaman mo ang iba't ibang paraan ng pag-install para sa iba't ibang operating system, setup ng authentication, at paunang configuration upang ihanda ang iyong development environment para sa Azure deployments.

## Mga Layunin sa Pag-aaral

Sa pagtatapos ng araling ito, ikaw ay:
- Matagumpay na makakapag-install ng Azure Developer CLI sa iyong operating system
- Makakapag-configure ng authentication sa Azure gamit ang iba't ibang paraan
- Makakapag-setup ng iyong development environment na may mga kinakailangang prerequisites
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

Bago i-install ang azd, tiyakin na mayroon ka ng:
- **Azure subscription** - [Gumawa ng libreng account](https://azure.microsoft.com/free/)
- **Azure CLI** - Para sa authentication at pamamahala ng resources
- **Git** - Para sa pag-clone ng mga template at version control
- **Docker** (opsyonal) - Para sa mga containerized na aplikasyon

## Mga Paraan ng Pag-install

### Windows

#### Opsyon 1: PowerShell (Inirerekomenda)
```powershell
# Patakbuhin bilang Administrator o may mataas na pribilehiyo
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
# I-download at i-install
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
# Magdagdag ng Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# I-install ang azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Magdagdag ng Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

Ang azd ay pre-installed na sa GitHub Codespaces. Gumawa lamang ng codespace at simulan ang paggamit ng azd kaagad.

### Docker

```bash
# Patakbuhin ang azd sa isang container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Gumawa ng alias para sa mas madaling paggamit
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ I-verify ang Pag-install

Pagkatapos ng pag-install, tiyakin na gumagana nang maayos ang azd:

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
azd version 1.5.0 (commit abc123)
```

**✅ Checklist ng Tagumpay sa Pag-install:**
- [ ] Ang `azd version` ay nagpapakita ng numero ng bersyon nang walang error
- [ ] Ang `azd --help` ay nagpapakita ng dokumentasyon ng mga utos
- [ ] Ang `azd template list` ay nagpapakita ng mga available na template
- [ ] Ang `az account show` ay nagpapakita ng iyong Azure subscription
- [ ] Makakagawa ka ng test directory at matagumpay na magpatakbo ng `azd init`

**Kapag lahat ng tsek ay pumasa, handa ka nang magpatuloy sa [Ang Iyong Unang Proyekto](first-project.md)!**

## Setup ng Authentication

### Azure CLI Authentication (Inirerekomenda)
```bash
# I-install ang Azure CLI kung hindi pa naka-install
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Mag-login sa Azure
az login

# Tiyakin ang pagpapatunay
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
# Itakda ang default na subscription
azd config set defaults.subscription <subscription-id>

# Itakda ang default na lokasyon
azd config set defaults.location eastus2

# Tingnan ang lahat ng configuration
azd config list
```

### Environment Variables
Idagdag sa iyong shell profile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure na pagsasaayos
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd na pagsasaayos
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Paganahin ang debug na pag-log
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
- Pag-browse ng template
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

## 🐛 Pag-troubleshoot ng Pag-install

### Karaniwang Mga Isyu

#### Permission Denied (Windows)
```powershell
# Patakbuhin ang PowerShell bilang Administrator
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
# I-configure ang proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Laktawan ang SSL verification (hindi inirerekomenda para sa produksyon)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# Alisin ang mga lumang pag-install
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Linisin ang configuration
rm -rf ~/.azd
```

### Pagkuha ng Higit Pang Tulong
```bash
# Paganahin ang debug logging
export AZD_DEBUG=true
azd <command> --debug

# Tingnan ang detalyadong mga log
azd logs

# Suriin ang impormasyon ng sistema
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

## 💡 Mga Madalas Itanong

<details>
<summary><strong>Ano ang pagkakaiba ng azd at az CLI?</strong></summary>

**Azure CLI (az)**: Tool para sa pamamahala ng indibidwal na Azure resources
- `az webapp create`, `az storage account create`
- Isang resource sa bawat pagkakataon
- Nakatuon sa pamamahala ng infrastructure

**Azure Developer CLI (azd)**: Tool para sa kumpletong application deployments
- `azd up` ay nagde-deploy ng buong app kasama ang lahat ng resources
- Template-based workflows
- Nakatuon sa produktibidad ng developer

**Kailangan mo ng pareho**: Ginagamit ng azd ang az CLI para sa authentication
</details>

<details>
<summary><strong>Magagamit ko ba ang azd sa mga umiiral na Azure resources?</strong></summary>

Oo! Maaari mong:
1. I-import ang mga umiiral na resources sa azd environments
2. I-refer ang mga umiiral na resources sa iyong Bicep templates
3. Gamitin ang azd para sa mga bagong deployment kasabay ng umiiral na infrastructure

Tingnan ang [Configuration Guide](configuration.md) para sa mga detalye.
</details>

<details>
<summary><strong>Gumagana ba ang azd sa Azure Government o Azure China?</strong></summary>

Oo, i-configure ang cloud:
```bash
# Azure Gobyerno
az cloud set --name AzureUSGovernment
az login

# Azure Tsina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Magagamit ko ba ang azd sa CI/CD pipelines?</strong></summary>

Oo naman! Ang azd ay dinisenyo para sa automation:
- Integrasyon sa GitHub Actions
- Suporta sa Azure DevOps
- Authentication gamit ang service principal
- Non-interactive mode

Tingnan ang [Deployment Guide](../deployment/deployment-guide.md) para sa mga pattern ng CI/CD.
</details>

<details>
<summary><strong>Magkano ang gastos sa paggamit ng azd?</strong></summary>

Ang azd mismo ay **ganap na libre** at open-source. Magbabayad ka lamang para sa:
- Mga Azure resources na ide-deploy mo
- Mga gastos sa Azure consumption (compute, storage, atbp.)

Gamitin ang `azd provision --preview` upang tantyahin ang mga gastos bago ang deployment.
</details>

## Mga Susunod na Hakbang

1. **Kumpletuhin ang authentication**: Tiyakin na ma-access mo ang iyong Azure subscription
2. **Subukan ang iyong unang deployment**: Sundin ang [First Project Guide](first-project.md)
3. **I-explore ang mga template**: I-browse ang mga available na template gamit ang `azd template list`
4. **I-configure ang iyong IDE**: I-setup ang iyong development environment

## Suporta

Kung makakaranas ng mga isyu:
- [Opisyal na Dokumentasyon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Mag-report ng mga Isyu](https://github.com/Azure/azure-dev/issues)
- [Mga Diskusyon ng Komunidad](https://github.com/Azure/azure-dev/discussions)
- [Suporta ng Azure](https://azure.microsoft.com/support/)

---

**Pag-navigate sa Kabanata:**
- **📚 Home ng Kurso**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilisang Simula
- **⬅️ Nakaraan**: [Mga Pangunahing Kaalaman sa AZD](azd-basics.md) 
- **➡️ Susunod**: [Ang Iyong Unang Proyekto](first-project.md)
- **🚀 Susunod na Kabanata**: [Kabanata 2: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Kumpleto na ang Pag-install!** Magpatuloy sa [Ang Iyong Unang Proyekto](first-project.md) upang simulan ang paggawa gamit ang azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->