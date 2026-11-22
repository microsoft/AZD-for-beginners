# Gabay sa Pag-install at Pagsasaayos

**Pag-navigate ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilisan na Pagsisimula
- **⬅️ Nakaraan**: [Mga Pangunahing Kaalaman sa AZD](azd-basics.md)
- **➡️ Susunod**: [Ang Iyong Unang Proyekto](first-project.md)
- **🚀 Susunod na Kabanata**: [Kabanata 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Panimula

Ang komprehensibong gabay na ito ay dadalhin ka sa proseso ng pag-install at pagsasaayos ng Azure Developer CLI (azd) sa iyong sistema. Matututuhan mo ang iba't ibang paraan ng pag-install para sa iba't ibang operating system, pagsasaayos ng pagpapatotoo, at paunang pagsasaayos upang ihanda ang iyong kapaligiran sa pag-develop para sa mga deployment sa Azure.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng araling ito, ikaw ay:
- Matagumpay na naka-install ang Azure Developer CLI sa iyong operating system
- Nasetup ang pagpapatotoo sa Azure gamit ang iba't ibang pamamaraan
- Naayos ang iyong kapaligiran sa pag-develop kasama ang mga kinakailangang paunang kahilingan
- Naiintindihan ang iba't ibang opsyon sa pag-install at kung kailan gagamitin ang bawat isa
- Nakakalutas ng karaniwang mga problema sa pag-install at pagsasaayos

## Mga Kinalabasan ng Pagkatuto

Pagkatapos makumpleto ang araling ito, magagawa mong:
- I-install ang azd gamit ang tamang pamamaraan para sa iyong platform
- Magpatotoo sa Azure gamit ang azd auth login
- Siguraduhin ang iyong pag-install at subukan ang mga pangunahing utos ng azd
- Isaayos ang iyong kapaligiran sa pag-develop para sa pinakamainam na paggamit ng azd
- Lutasin nang mag-isa ang mga karaniwang problema sa pag-install

Ang gabay na ito ay tutulong sa iyo na i-install at i-configure ang Azure Developer CLI sa iyong sistema, anuman ang iyong operating system o kapaligiran sa pag-develop.

## Mga Kinakailangan

Bago mag-install ng azd, siguraduhing mayroon kang:
- **Azure subscription** - [Lumikha ng libreng account](https://azure.microsoft.com/free/)
- **Azure CLI** (opsyonal) - Para sa mga halimbawa na tahasang nagpapatakbo ng `az`; ang azd ay nagpapapatotoo nang hiwalay
- **Git** - Para sa pag-clone ng mga template at kontrol sa bersyon
- **Docker** (opsyonal) - Para sa containerized na mga aplikasyon

**Daan ng Foundry GA ng Kabanata 2:** Gamitin ang AZD **1.37.0 o mas bago**, i-install ang bundle gamit ang `azd ext install microsoft.foundry`, at gamitin ang Python **3.13+** at kasalukuyang **uv** para sa hosted-agent na halimbawa. Ang mode ng pag-deploy ng code nito ay nagtatayo nang malayo, kaya hindi kailangan ng lokal na Docker build. Kailangan pa rin ng mga permiso ng Foundry, availability ng regional model, at quota; tingnan ang [hosted-agent setup](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Mga Paraan ng Pag-install

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
I-download ang archive para sa iyong arkitektura ng macOS mula sa [the release assets](https://github.com/Azure/azure-dev/releases), i-extract ito, at idagdag ang `azd` binary sa iyong `PATH`.

### Linux

#### Opsyon 1: Install Script (Inirerekomenda)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opsyon 2: Mga Package Manager

**Manwal na pag-install mula sa release assets:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Ilang Codespaces at dev container environments ay kasama na ang `azd`, ngunit dapat mong siguraduhin iyon sa halip na ipagpalagay:

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

Ang episodikong container na ito ay hindi nag-iingat ng estado ng pag-login sa pagitan ng mga pagtakbo. Para sa paulit-ulit na mga deployment, gamitin ang [dev container setup](dev-containers.md); nangangailangan din ang container builds ng Docker daemon na naa-access mula sa loob ng container.

## ✅ Suriin ang Pag-install

Pagkatapos ng pag-install, tiyaking gumagana nang tama ang azd:

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

**Tandaan**: Ang aktwal na numero ng bersyon ay mag-iiba. Tingnan ang [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) para sa pinakabagong bersyon.

**✅ Checklist ng Tagumpay sa Pag-install:**
- [ ] Ipinapakita ng `azd version` ang numero ng bersyon nang walang mga error
- [ ] Nagpapakita ang `azd --help` ng dokumentasyon ng utos
- [ ] Ipinapakita ng `azd template list` ang mga magagamit na template
- [ ] Makakagawa ka ng test na direktoryo at matagumpay na mapatakbo ang `azd init`

**Kung matagumpay ang lahat ng pagsusuri, handa ka nang magpatuloy sa [Ang Iyong Unang Proyekto](first-project.md)!**

## Pagsasaayos ng Pagpapatotoo

### Inirerekomendang Setup para sa Mga Baguhan

Para sa mga daloy ng trabaho na AZD-first, mag-sign in gamit ang `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Gumamit ng Azure CLI sign-in lamang kapag balak mong patakbuhin ang mga `az` na utos mismo sa kurso.

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

- Gamitin ang `azd auth login` kung sumusunod ka sa beginner AZD path at pangunahin na nagpapatakbo ng mga `azd` na utos.
- Gamitin din ang `az login` kapag nais mong magpatakbo ng Azure CLI commands tulad ng `az account show` o tingnan ang mga resources nang direkta.
- Kung parehong kasama sa isang exercise ang `azd` at `az` na mga utos, isagawa ang parehong sign-in commands isang beses sa simula.

### Device Code Authentication
Kung ikaw ay nasa headless na sistema o may problema sa browser:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Para sa mga automated na environment:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Suriin ang Buong Setup Mo

Kung gusto mo ng mabilisang pagsusuri ng kahandaan bago simulan ang Kabanata 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Pagsasaayos

### Global Configuration
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Mga Variable ng Kapaligiran
Idagdag sa iyong shell profile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## IDE Integration

### Visual Studio Code
I-install ang Azure Developer CLI extension:
1. Buksan ang VS Code
2. Pumunta sa Extensions (Ctrl+Shift+X)
3. Hanapin ang "Azure Developer CLI"
4. I-install ang extension

Mga Tampok:
- IntelliSense para sa azure.yaml
- Pinagsamang mga terminal na utos
- Pag-browse ng mga template
- Pagsubaybay ng deployment

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
2. Isaayos ang Azure credentials
3. Gamitin ang pinagsamang terminal para sa azd commands

## 🐛 Pag-aayos ng Problema sa Pag-install

### Karaniwang Mga Isyu

#### Permission Denied (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Mga Isyu sa PATH
Mano-manong idagdag ang azd sa iyong PATH:

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

#### Mga Salungatan sa Bersyon
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Paghahanap ng Dagdag na Tulong
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
Nagbibigay babala ang azd kapag may bagong release na available, at maaari mong kumpirmahin ang iyong kasalukuyang build gamit ang:
```bash
azd version
```

### Manwal na Mga Update

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

## 💡 Madalas Itanong

<details>
<summary><strong>Ano ang pagkakaiba ng azd at az CLI?</strong></summary>

**Azure CLI (az)**: Mababang lebel na kasangkapan para sa pamamahala ng mga indibidwal na Azure na resources
- `az webapp create`, `az storage account create`
- Isang resource sa bawat pagkakataon
- Pokus sa pamamahala ng imprastraktura

**Azure Developer CLI (azd)**: Mataas na lebel na kasangkapan para sa kumpletong deployment ng aplikasyon
- `azd up` nagpapatupad ng buong app kasama ang lahat ng resources
- Mga daloy na batay sa template
- Pokus sa produktibidad ng developer

**Sila ay independyente**: gumagamit ang azd ng sariling pagpapatotoo sa default. Mag-install at mag-sign in sa Azure CLI lamang para sa mga `az` na utos, o tahasang piliin ang `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Maaari ko bang gamitin ang azd sa mga umiiral nang Azure resources?</strong></summary>

Oo! Maaari mong:
1. I-import ang umiiral nang mga resources sa mga azd environments
2. I-reference ang mga umiiral nang resources sa iyong mga Bicep templates
3. Gamitin ang azd para sa mga bagong deployment kasabay ng umiiral na imprastraktura

Tingnan ang [Configuration Guide](../chapter-03-configuration/configuration.md) para sa mga detalye.
</details>

<details>
<summary><strong>Gumagana ba ang azd sa Azure Government o Azure China?</strong></summary>

Oo, isaayos ang cloud:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Kung gagamit ka rin ng Azure CLI, isaayos nang hiwalay ang `az cloud set --name ...`. Nag-iiba ang mga serbisyo ng template at availability ng modelo ayon sa cloud.
</details>

<details>
<summary><strong>Maaari ko bang gamitin ang azd sa mga CI/CD pipeline?</strong></summary>

Oo! Dinisenyo ang azd para sa automation:
- Integrasyon sa GitHub Actions
- Suporta sa Azure DevOps
- Pagpapatotoo gamit ang service principal
- Non-interactive na mode

Tingnan ang [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) para sa mga pattern ng CI/CD.
</details>

<details>
<summary><strong>Ano ang gastos sa paggamit ng azd?</strong></summary>

Ang azd mismo ay **ganap na libre** at open-source. Nagbabayad ka lamang para sa:
- Mga Azure resources na iyong dina-deploy
- Mga gastos sa pagkonsumo ng Azure (compute, storage, at iba pa)

Gamitin ang `azd provision --preview` para tingnan ang mga iminungkahing resources, pagkatapos ay tantiyahin ang kanilang gastos gamit ang [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/). Hindi kinukuwenta ang mga presyo sa preview.
</details>

## Mga Susunod na Hakbang

1. **Kumpletuhin ang pagpapatotoo**: Siguraduhing maa-access mo ang iyong Azure subscription
2. **Subukan ang unang deployment**: Sundan ang [First Project Guide](first-project.md)
3. **Galugarin ang mga template**: Mag-browse ng mga magagamit na template gamit ang `azd template list`
4. **Ayusin ang iyong IDE**: Isaayos ang iyong kapaligiran sa pag-develop

## Suporta

Kung makaranas ng mga isyu:
- [Opisyal na Dokumentasyon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Mag-ulat ng mga Isyu](https://github.com/Azure/azure-dev/issues)
- [Mga Talakayan ng Komunidad](https://github.com/Azure/azure-dev/discussions)
- [Suporta sa Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Kumuha ng patnubay sa Azure command nang diretso sa iyong editor gamit ang `npx skills add microsoft/github-copilot-for-azure`

---

**Pag-navigate ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilisan na Pagsisimula
- **⬅️ Nakaraan**: [Mga Pangunahing Kaalaman sa AZD](azd-basics.md) 
- **➡️ Susunod**: [Ang Iyong Unang Proyekto](first-project.md)
- **🚀 Susunod na Kabanata**: [Kabanata 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Kumpleto na ang Pag-install!** Magpatuloy sa [Ang Iyong Unang Proyekto](first-project.md) upang simulan ang paggawa gamit ang azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->