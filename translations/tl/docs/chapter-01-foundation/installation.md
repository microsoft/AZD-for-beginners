# Gabay sa Pag-install at Pag-setup

**Pagbaba ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilisang Simula
- **⬅️ Nakaraan**: [Mga Pangunahing Kaalaman sa AZD](azd-basics.md)
- **➡️ Susunod**: [Ang Iyong Unang Proyekto](first-project.md)
- **🚀 Susunod na Kabanata**: [Kabanata 2: AI-Unang Pag-unlad](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Panimula

Ang komprehensibong gabay na ito ay gagabay sa iyo sa pag-install at pagsasaayos ng Azure Developer CLI (azd) sa iyong sistema. Matututuhan mo ang iba't ibang paraan ng pag-install para sa mga iba't ibang operating system, pagsasaayos ng authentication, at paunang setup upang ihanda ang iyong development environment para sa mga deployment sa Azure.

## Mga Layunin ng Pag-aaral

Sa pagtatapos ng araling ito, mayroon kang kakayahan na:
- Matagumpay na mai-install ang Azure Developer CLI sa iyong operating system
- Maisaayos ang authentication sa Azure gamit ang iba't ibang paraan
- Masetup ang iyong development environment na may mga kinakailangang paunang kondisyon
- Maunawaan ang iba't ibang opsyon sa pag-install at kung kailan gagamitin ang bawat isa
- Malutas ang mga karaniwang isyu sa pag-install at setup

## Mga Kinalabasan ng Pag-aaral

Pagkatapos makumpleto ang araling ito, magagawa mo nang:
- Mag-install ng azd gamit ang angkop na paraan para sa iyong platform
- Mag-authenticate sa Azure gamit ang azd auth login
- Beripikahin ang iyong pag-install at subukan ang mga pangunahing utos ng azd
- Isaayos ang iyong development environment para sa pinakamainam na paggamit ng azd
- Malutas ang mga karaniwang problema ng pag-install nang mag-isa

Tinutulungan ka ng gabay na ito na mai-install at maayos ang Azure Developer CLI sa iyong sistema, anuman ang iyong operating system o development environment.

## Mga Kinakailangan

Bago mag-install ng azd, tiyaking mayroon ka:
- **Azure subscription** - [Gumawa ng libreng account](https://azure.microsoft.com/free/)
- **Azure CLI** (opsyonal) - Para sa mga halimbawa na tahasang nagpapatakbo ng `az`; ang azd ay nag-authenticate nang nakapag-isa
- **Git** - Para sa pag-clone ng mga template at version control
- **Docker** (opsyonal) - Para sa mga containerized na aplikasyon

## Paraan sa Pag-install

### Windows

#### Opsyon 1: Windows Package Manager (Inirerekomenda)
```cmd
winget install microsoft.azd
```

#### Opsyon 2: PowerShell Install Script
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opsyon 3: Chocolatey
```cmd
choco install azd
```

#### Opsyon 4: Manwal na Pag-install
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

#### Opsyon 3: Manwal na Pag-install
I-download ang archive para sa iyong macOS architecture mula sa [the release assets](https://github.com/Azure/azure-dev/releases), i-extract ito, at idagdag ang `azd` binary sa iyong `PATH`.

### Linux

#### Opsyon 1: Install Script (Inirerekomenda)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opsyon 2: Package Managers

**Manwal na pag-install mula sa release assets:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Ang ilan sa mga Codespaces at dev container environment ay mayroon nang `azd`, ngunit dapat mo itong tiyaking umiiral kaysa magsagawa ng palagay:

```bash
azd version
```

Kung nawawala ang `azd`, i-install ito gamit ang karaniwang script para sa environment.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Ang ephemeral container na ito ay hindi nagpapanatili ng estado ng pag-login sa pagitan ng mga pagpapatakbo. Para sa paulit-ulit na mga deployment, gamitin ang [dev container setup](dev-containers.md); nangangailangan din ang mga container builds ng Docker daemon na maa-access mula sa loob ng container.

## ✅ Beripikahin ang Pag-install

Pagkatapos ng pag-install, beripikahin na gumagana ng maayos ang azd:

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
azd version 1.x.x (commit xxxxxx)
```

**Tandaan**: Magkakaiba-iba ang aktwal na bersyon. Tingnan ang [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) para sa pinakabagong bersyon.

**✅ Checklist ng Tagumpay sa Pag-install:**
- [ ] Ipinapakita ng `azd version` ang version number nang walang error
- [ ] Nagpapakita ang `azd --help` ng dokumentasyon ng mga utos
- [ ] Ipinapakita ng `azd template list` ang mga available na template
- [ ] Maaari kang gumawa ng test directory at magpatakbo ng `azd init` nang matagumpay

**Kung lahat ng tsek ay pasado, handa ka nang magpatuloy sa [Ang Iyong Unang Proyekto](first-project.md)!**

## Pag-setup ng Authentication

### Inirekomendang Setup para sa mga Baguhan

Para sa AZD-first workflows, mag-sign in gamit ang `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Gamitin ang Azure CLI sign-in lamang kapag plano mong patakbuhin ang mga utos na `az` mismo sa kurso.

### Azure CLI Authentication (Opsyonal)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: see the Azure CLI install docs for your distribution

# Login to Azure
az login

# Verify authentication
az account show
```

### Alin ang Dapat Mong Gamitin na Sign-In Flow?

- Gamitin ang `azd auth login` kung sinusundan mo ang beginner AZD path at pangunahing nagpapatakbo ng `azd` mga utos.
- Gamitin din ang `az login` kapag nais mong magpatakbo ng Azure CLI commands tulad ng `az account show` o direktang inspeksyunin ang mga resources.
- Kung ang isang exercise ay may kasamang parehong `azd` at `az` na mga utos, patakbuhin ang parehong sign-in commands nang isang beses sa simula.

### Device Code Authentication
Kung ikaw ay nasa headless na sistema o may mga problema sa browser:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Para sa automated na mga environment:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Beripikahin ang Iyong Kumpletong Setup

Kung nais mo ng mabilisang readiness check bago simulan ang Kabanata 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Konfigurasyon

### Global Configuration
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Environment Variables
Idagdag sa iyong shell profile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
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
- Pagsusuri ng mga template
- Pagsubaybay ng deployment

### GitHub Codespaces
Gumawa ng isang `.devcontainer/devcontainer.json`:
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
2. Isaayos ang Azure credentials
3. Gamitin ang integrated terminal para sa mga utos ng azd

## 🐛 Pag-troubleshoot ng Pag-install

### Karaniwang mga Isyu

#### Permission Denied (Windows)
```powershell
# Run PowerShell as Administrator
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
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Mga Hindi Pagkakatugma ng Bersyon
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Pagtanggap ng Karagdagang Tulong
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Pag-update ng azd

### Pagsusuri ng Update
Nagbibigay babala ang azd kapag may mas bagong release, at maaari mong tiyakin ang kasalukuyan mong build gamit ang:
```bash
azd version
```

### Manwal na Pag-update

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

## 💡 Mga Madalas Itanong

<details>
<summary><strong>Ano ang pagkakaiba ng azd at az CLI?</strong></summary>

**Azure CLI (az)**: Mababang-antig na kasangkapan para sa pamamahala ng indibidwal na Azure resources
- `az webapp create`, `az storage account create`
- Isang resource lamang sa isang pagkakataon
- Pokus sa pamamahala ng imprastraktura

**Azure Developer CLI (azd)**: Mataas-na-antig na kasangkapan para sa kumpletong deployment ng aplikasyon
- `azd up` nagde-deploy ng buong app kasama ang lahat ng resources
- Nakabatay sa template na workflows
- Pokus sa produktibidad ng developer

**Sila ay hiwalay**: Ang azd ay gumagamit ng sariling authentication bilang default. Mag-install at mag-sign in sa Azure CLI lamang para sa `az` na mga utos, o tahasang piliin ang `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Maaari ko bang gamitin ang azd sa umiiral na Azure resources?</strong></summary>

Oo! Maaari mong:
1. I-import ang umiiral na mga resources sa mga azd environments
2. I-referensya ang mga umiiral na resources sa iyong mga Bicep templates
3. Gamitin ang azd para sa mga bagong deployment kasama ang umiiral na imprastraktura

Tingnan ang [Configuration Guide](../chapter-03-configuration/configuration.md) para sa mga detalye.
</details>

<details>
<summary><strong>Gumagana ba ang azd sa Azure Government o Azure China?</strong></summary>

Oo, i-configure ang cloud:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Kung ginagamit mo rin ang Azure CLI, i-configure ang `az cloud set --name ...` nang hiwalay. Nagkakaiba-iba ang mga serbisyo at availability ng modelo depende sa cloud.
</details>

<details>
<summary><strong>Maaari ko bang gamitin ang azd sa CI/CD pipelines?</strong></summary>

Oo naman! Disenyo ang azd para sa awtomasyon:
- Integrasyon sa GitHub Actions
- Suporta sa Azure DevOps
- Authentication gamit ang service principal
- Non-interactive mode

Tingnan ang [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) para sa mga pattern ng CI/CD.
</details>

<details>
<summary><strong>Ano ang gastos sa paggamit ng azd?</strong></summary>

Ang azd mismo ay **lubos na libre** at open-source. Nagbabayad ka lamang para sa:
- Mga Azure resources na dineploy mo
- Gastos sa paggamit ng Azure (compute, storage, atbp.)

Gamitin ang `azd provision --preview` upang suriin ang mga iminungkahing resources, pagkatapos ay estima ang mga gastos gamit ang [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/). Hindi tinatantiya ng preview ang mga presyo.
</details>

## Mga Susunod na Hakbang

1. **Kumpletuhin ang authentication**: Tiyakin na may access ka sa iyong Azure subscription
2. **Subukan ang iyong unang deployment**: Sundan ang [First Project Guide](first-project.md)
3. **Suriin ang mga template**: I-browse ang mga available na template gamit ang `azd template list`
4. **I-configure ang iyong IDE**: I-set up ang iyong development environment

## Suporta

Kung may makita kang mga isyu:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Kunin ang gabay sa Azure commands direkta sa iyong editor gamit ang `npx skills add microsoft/github-copilot-for-azure`

---

**Paglalakbay sa Kabanata:**
- **📚 Pahina ng Kurso**: [AZD Para sa mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilisang Pagsisimula
- **⬅️ Nakaraan**: [Batayan ng AZD](azd-basics.md) 
- **➡️ Susunod**: [Iyong Unang Proyekto](first-project.md)
- **🚀 Susunod na Kabanata**: [Kabanata 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Kumpletong Instalasyon!** Magpatuloy sa [Iyong Unang Proyekto](first-project.md) upang simulan ang pagbuo gamit ang azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->