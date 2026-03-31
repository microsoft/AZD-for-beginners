# Gabay sa Pag-install at Pag-setup

**Pag-navigate ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilis na Pag-uumpisa
- **⬅️ Nakaraan**: [Mga Pangunahing Kaalaman ng AZD](azd-basics.md)
- **➡️ Susunod**: [Ang Iyong Unang Proyekto](first-project.md)
- **🚀 Susunod na Kabanata**: [Kabanata 2: AI-Unang Pag-unlad](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Panimula

Ang komprehensibong gabay na ito ay gagabay sa iyo sa pag-install at pag-configure ng Azure Developer CLI (azd) sa iyong sistema. Matututuhan mo ang iba't ibang paraan ng pag-install para sa iba't ibang operating system, pag-setup ng authentication, at paunang konfigurasyon upang ihanda ang iyong development na kapaligiran para sa mga deployment sa Azure.

## Mga Layunin sa Pagkatuto

Sa katapusan ng araling ito, magagawa mong:
- Matagumpay na mai-install ang Azure Developer CLI sa iyong operating system
- I-configure ang authentication sa Azure gamit ang iba't ibang paraan
- I-set up ang iyong development environment kasama ang mga kinakailangang prerequisites
- Maunawaan ang iba't ibang opsyon sa pag-install at kung kailan gagamitin ang bawat isa
- Mag-troubleshoot ng mga karaniwang isyu sa pag-install at setup

## Mga Kinalabasan ng Pagkatuto

Pagkatapos makumpleto ang araling ito, magagawa mong:
- I-install ang azd gamit ang angkop na pamamaraan para sa iyong platform
- Mag-authenticate sa Azure gamit ang `azd auth login`
- Beripikahin ang iyong pag-install at subukan ang mga pangunahing command ng azd
- I-configure ang iyong development environment para sa pinakamainam na paggamit ng azd
- Malutas nang mag-isa ang mga karaniwang problema sa pag-install

Tutulungan ka ng gabay na ito na i-install at i-configure ang Azure Developer CLI sa iyong sistema, anuman ang iyong operating system o development na kapaligiran.

## Mga Kinakailangan Bago Magsimula

Bago i-install ang azd, tiyakin na mayroon ka:
- **Azure subscription** - [Gumawa ng libreng account](https://azure.microsoft.com/free/)
- **Azure CLI** - Para sa authentication at pamamahala ng mga resource
- **Git** - Para sa pag-clone ng mga template at version control
- **Docker** (opsyonal) - Para sa mga containerized na aplikasyon

## Mga Paraan ng Pag-install

### Windows

#### Opsyon 1: Windows Package Manager (Inirerekomenda)
```cmd
winget install microsoft.azd
```

#### Opsyon 2: PowerShell Install Script
```powershell
# Kapaki-pakinabang kapag hindi magagamit ang winget
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
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

**Manual installation from release assets:**
```bash
# I-download ang pinakabagong archive para sa iyong Linux architecture mula sa:
# https://github.com/Azure/azure-dev/releases
# Pagkatapos, i-extract ito at idagdag ang binary na azd sa iyong PATH.
```

### GitHub Codespaces

Ang ilang Codespaces at dev container na kapaligiran ay kasama na ang `azd`, ngunit dapat mong tiyakin iyon kaysa umasa lang:

```bash
azd version
```

Kung wala ang `azd`, i-install ito gamit ang karaniwang script para sa kapaligiran.

### Docker

```bash
# Patakbuhin ang azd sa isang container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Gumawa ng alias para sa mas madaling paggamit
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Suriin ang Pag-install

Pagkatapos ng pag-install, beripikahin na gumagana nang tama ang azd:

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

**Tandaan**: Maaaring mag-iba ang aktwal na numero ng bersyon. Suriin ang [Mga release ng Azure Developer CLI](https://github.com/Azure/azure-dev/releases) para sa pinakabagong bersyon.

**✅ Talaan ng Tagumpay sa Pag-install:**
- [ ] Ipinapakita ng `azd version` ang numero ng bersyon nang walang mga error
- [ ] Ipinapakita ng `azd --help` ang dokumentasyon ng command
- [ ] Ipinapakita ng `azd template list` ang mga magagamit na template
- [ ] Maaari kang gumawa ng test direktoryo at patakbuhin ang `azd init` nang matagumpay

**Kung pumasa ang lahat ng tseke, handa ka nang magpatuloy sa [Ang Iyong Unang Proyekto](first-project.md)!**

## Pag-set up ng Authentication

### Inirerekomendang Setup para sa Nagsisimula

Para sa mga workflow na AZD-unang, mag-sign in gamit ang `azd auth login`.

```bash
# Kinakailangan para sa mga AZD na utos tulad ng azd up
azd auth login

# Suriin ang katayuan ng pagpapatotoo ng AZD
azd auth login --check-status
```

Gamitin ang Azure CLI sign-in lamang kapag balak mong patakbuhin ang mga `az` na command sa iyong sarili habang nasa kurso.

### Azure CLI Authentication (Opsyonal)
```bash
# I-install ang Azure CLI kung hindi pa naka-install
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: tingnan ang dokumentasyon ng pag-install ng Azure CLI para sa iyong distribusyon

# Mag-login sa Azure
az login

# Suriin ang awtentikasyon
az account show
```

### Aling Sign-In Flow ang Dapat Mong Gamitin?

- Gamitin ang `azd auth login` kung sinusundan mo ang beginner AZD path at pangunahing nagpapatakbo ng mga `azd` na command.
- Gamitin din ang `az login` kapag nais mong magpatakbo ng mga Azure CLI command tulad ng `az account show` o direktang inspeksyunin ang mga resource.
- Kung ang isang pagsasanay ay kasama ang parehong `azd` at `az` na mga command, patakbuhin ang parehong sign-in command nang isang beses sa simula.

### Device Code Authentication
Kung ikaw ay nasa headless na sistema o may problema sa browser:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Para sa mga automated na kapaligiran:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### I-validate ang Iyong Kumpletong Setup

Kung gusto mo ng mabilis na tseke ng kahandaan bago simulan ang Kabanata 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Konfigurasyon

### Global na Konfigurasyon
```bash
# Itakda ang default na subscription
azd config set defaults.subscription <subscription-id>

# Itakda ang default na lokasyon
azd config set defaults.location eastus2

# Tingnan ang lahat ng konfigurasyon
azd config show
```

### Mga Environment Variable
Idagdag sa iyong shell profile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfigurasyon ng Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Konfigurasyon ng azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Paganahin ang pag-log ng debug
```

## Integrasyon ng IDE

### Visual Studio Code
I-install ang Azure Developer CLI extension:
1. Buksan ang VS Code
2. Pumunta sa Extensions (Ctrl+Shift+X)
3. Hanapin ang "Azure Developer CLI"
4. I-install ang extension

Mga tampok:
- IntelliSense para sa azure.yaml
- Pinagsamang mga utos sa terminal
- Pag-browse ng mga template
- Pagmamanman ng deployment

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
2. I-configure ang mga kredensyal ng Azure
3. Gamitin ang pinagsamang terminal para sa mga utos ng azd

## 🐛 Pag-troubleshoot ng Pag-install

### Mga Karaniwang Isyu

#### Permission Denied (Windows)
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

# Laktawan ang pag-verify ng SSL (hindi inirerekomenda para sa production)
azd config set http.insecure true
```

#### Mga Salungatan ng Bersyon
```bash
# Alisin ang mga lumang instalasyon
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: Alisin ang naunang azd binary o symlink bago muling i-install

# Linisin ang konfigurasyon
rm -rf ~/.azd
```

### Kung Kailangan ng Karagdagang Tulong
```bash
# Paganahin ang pag-log ng debug
export AZD_DEBUG=true
azd <command> --debug

# Tingnan ang kasalukuyang konfigurasyon
azd config show

# Tingnan ang kasalukuyang katayuan ng deployment
azd show
```

## Pag-update ng azd

### Update Check
Nagbabala ang azd kapag may mas bagong release at maaari mong kumpirmahin ang iyong kasalukuyang build gamit ang:
```bash
azd version
```

### Manu-manong Pag-update

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

## 💡 Madalas na Itinanong

<details>
<summary><strong>Ano ang pagkakaiba ng azd at az CLI?</strong></summary>

**Azure CLI (az)**: Mababa-angkung tool para sa pamamahala ng indibidwal na mga resource ng Azure
- `az webapp create`, `az storage account create`
- Isang resource sa isang pagkakataon
- Pokus sa pamamahala ng infrastructure

**Azure Developer CLI (azd)**: Mataas-angkung tool para sa kumpletong deployment ng aplikasyon
- `azd up` nag-de-deploy ng buong app kasama ang lahat ng resources
- Workflow na nakabase sa template
- Pokus sa produktibidad ng developer

**Kailangan mo ang dalawa**: gumagamit ang azd ng az CLI para sa authentication
</details>

<details>
<summary><strong>Maaari ko bang gamitin ang azd sa umiiral na mga resource ng Azure?</strong></summary>

Oo! Maaari mong:
1. I-import ang umiiral na mga resource sa mga environment ng azd
2. I-reference ang umiiral na mga resource sa iyong mga Bicep template
3. Gamitin ang azd para sa mga bagong deployment kasama ng umiiral na infrastructure

Tingnan ang [Gabay sa Konfigurasyon](configuration.md) para sa detalye.
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

Oo naman! Ang azd ay dinisenyo para sa automation:
- Integrasyon ng GitHub Actions
- Suporta sa Azure DevOps
- Authentication gamit ang service principal
- Mode na hindi interactive

Tingnan ang [Gabay sa Deployment](../chapter-04-infrastructure/deployment-guide.md) para sa mga pattern ng CI/CD.
</details>

<details>
<summary><strong>Magkano ang gastos sa paggamit ng azd?</strong></summary>

ang azd mismo ay **ganap na libre** at open-source. Magbabayad ka lamang para sa:
- Mga Azure resource na ide-deploy mo
- Mga gastusing konsumo ng Azure (compute, storage, atbp.)

Gamitin ang `azd provision --preview` upang tantiyahin ang mga gastos bago ang deployment.
</details>

## Susunod na Hakbang

1. **Kumpletuhin ang authentication**: Tiyakin na may access ka sa iyong Azure subscription
2. **Subukan ang iyong unang deployment**: Sundin ang [First Project Guide](first-project.md)
3. **I-explore ang mga template**: I-browse ang mga magagamit na template gamit ang `azd template list`
4. **I-configure ang iyong IDE**: I-set up ang iyong development environment

## Suporta

Kung makakaranas ka ng mga isyu:
- [Opisyal na Dokumentasyon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [I-report ang mga Isyu](https://github.com/Azure/azure-dev/issues)
- [Pag-uusap ng Komunidad](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Kumuha ng gabay sa mga Azure command nang direkta sa iyong editor gamit ang `npx skills add microsoft/github-copilot-for-azure`

---

**Pag-navigate ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilis na Pag-uumpisa
- **⬅️ Nakaraan**: [Mga Pangunahing Kaalaman ng AZD](azd-basics.md) 
- **➡️ Susunod**: [Ang Iyong Unang Proyekto](first-project.md)
- **🚀 Susunod na Kabanata**: [Kabanata 2: AI-Unang Pag-unlad](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Pag-install Kumpleto!** Magpatuloy sa [Ang Iyong Unang Proyekto](first-project.md) upang simulan ang pagbuo gamit ang azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI na pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong mga pagsasalin ay maaaring maglaman ng mga pagkakamali o di-tumpak na impormasyon. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pinaghuhugot ng awtoridad. Para sa kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang mga hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->