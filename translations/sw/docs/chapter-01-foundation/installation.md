# Mwongozo wa Usakinishaji na Usanidi

**Urambazaji wa Sura:**
- **📚 Kuu ya Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Hali ya Sasa**: Sura 1 - Msingi & Anza Haraka
- **⬅️ Iliyopita**: [Msingi wa AZD](azd-basics.md)
- **➡️ Inayofuata**: [Mradi Wako wa Kwanza](first-project.md)
- **🚀 Sura Inayofuata**: [Sura 2: Maendeleo ya AI-Kwanza](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Utangulizi

Mwongozo huu kamili utakuelekeza jinsi ya kusakinisha na kusanidi Azure Developer CLI (azd) kwenye mfumo wako. Utajifunza mbinu mbalimbali za usakinishaji kwa mifumo tofauti ya uendeshaji, usanidi wa uthibitishaji, na usanidi wa awali kuandaa mazingira yako ya maendeleo kwa ajili ya utoaji wa Azure.

## Malengo ya Kujifunza

Mwisho wa somo hili, utakweza:
- Kusakinisha Azure Developer CLI kwenye mfumo wako wa uendeshaji kwa mafanikio
- Kusanidi uthibitishaji na Azure kwa kutumia mbinu mbalimbali
- Kuandaa mazingira yako ya maendeleo na mahitaji muhimu
- Kuelewa chaguzi tofauti za usakinishaji na wakati wa kutumia kila moja
- Kutatua matatizo ya kawaida ya usakinishaji na usanidi

## Matokeo ya Kujifunza

Baada ya kumaliza somo hili, utaweza:
- Kusakinisha azd kwa kutumia njia inayofaa kwa jukwaa lako
- Kufanya uthibitishaji na Azure kwa kutumia azd auth login
- Kuhakiki usakinishaji wako na kujaribu amri za msingi za azd
- Kusanidi mazingira yako ya maendeleo kwa matumizi bora ya azd
- Kutatua matatizo ya kawaida ya usakinishaji kwa weledi

Mwongozo huu utakusaidia kusakinisha na kusanidi Azure Developer CLI kwenye mfumo wako, bila kujali mfumo wako wa uendeshaji au mazingira ya maendeleo.

## Mahitaji ya Awali

Kabla ya kusakinisha azd, hakikisha una:
- **Usajili wa Azure** - [Tengeneza akaunti bure](https://azure.microsoft.com/free/)
- **Azure CLI** (hiari) - Kwa mifano inayotekelezwa wazi `az`; azd inathibitisha kwa kujitegemea
- **Git** - Kwa kunakili templeti na udhibiti wa toleo
- **Docker** (hiari) - Kwa programu zilizomo ndani ya kontena

**Njia ya Foundry GA ya Sura 2:** Tumia AZD **1.37.0 au baadaye**, sakinisha kifurushi kwa kutumia `azd ext install microsoft.foundry`, na tumia Python **3.13+** pamoja na **uv** ya sasa kwa sampuli ya wakala aliyehifadhiwa. Hali yake ya usambazaji wa msimbo hutengenezwa mbali, hivyo haina hitaji la kujenga Docker mahali pa karibu. Ruhusa za Foundry, upatikanaji wa modeli za kanda, na kiwango bado vinahitajika; angalia [usanidi wa wakala aliyehifadhiwa](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Njia za Usakinishaji

### Windows

#### Chaguo 1: Meneja wa Pakiti wa Windows (Inayopendekezwa)
```cmd
winget install microsoft.azd
```

#### Chaguo 2: Skripti ya Usakinishaji ya PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Chaguo 3: Chocolatey
```cmd
choco install azd
```

#### Chaguo 4: Usakinishaji wa Mikono
1. Pakua toleo la hivi karibuni kutoka [GitHub](https://github.com/Azure/azure-dev/releases)
2. Toa kwenye `C:\Program Files\azd\`
3. Ongeza kwenye kigezo cha PATH cha mazingira

### macOS

#### Chaguo 1: Homebrew (Inayopendekezwa)
```bash
brew tap azure/azd
brew install azd
```

#### Chaguo 2: Skripti ya Usakinishaji
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Chaguo 3: Usakinishaji wa Mikono
Pakua faili ya kumbukumbu kwa usanifu wa macOS kutoka [mali za toleo](https://github.com/Azure/azure-dev/releases), toa, na ongeza faili binafsi ya `azd` kwenye `PATH` yako.

### Linux

#### Chaguo 1: Skripti ya Usakinishaji (Inayopendekezwa)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Chaguo 2: Wakuu wa Pakiti

**Usakinishaji wa mikono kutoka mali za toleo:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Baadhi ya mazingira ya Codespaces na kontena za maendeleo tayari zinajumuisha `azd`, lakini unapaswa kuthibitisha badala ya kudhani hivyo:

```bash
azd version
```

Ikiwa `azd` haipo, sakinisha kwa skripti ya kawaida ya mazingira.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Kontena huu wa muda mfupi hauhifadhi hali ya kuingia kati ya mara za utekelezaji. Kwa utoaji wa mara nyingi, tumia [usanidi wa kontena ya maendeleo](dev-containers.md); ujenzi wa kontena pia unahitaji demon wa Docker inayoweza kupatikana kutoka ndani ya kontena.

## ✅ Thibitisha Usakinishaji

Baada ya usakinishaji, thibitisha azd inafanya kazi ipasavyo:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Matokeo yanayotarajiwa:
```
azd version 1.x.x (commit xxxxxx)
```

**Kumbuka**: Nambari ya toleo halisi itatofautiana. Angalia [matoleo ya Azure Developer CLI](https://github.com/Azure/azure-dev/releases) kwa toleo jipya zaidi.

**✅ Orodha ya Mafanikio ya Usakinishaji:**
- [ ] `azd version` inaonyesha nambari ya toleo bila makosa
- [ ] `azd --help` inaonyesha nyaraka za amri
- [ ] `azd template list` inaonyesha templeti zilizopo
- [ ] Unaweza kuunda sehemu ya mtihani na kuendesha `azd init` kwa mafanikio

**Ikiwa kila kitu kimekidhi, uko tayari kuendelea na [Mradi Wako wa Kwanza](first-project.md)!**

## Usanidi wa Uthibitishaji

### Usanidi wa Kuanza Ulio Pendekezwa

Kwa michakato ya AZD-kwanza, ingia kwa kutumia `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Tumia kuingia kwa Azure CLI tu wakati unapopanga kuendesha amri za `az` mwenyewe wakati wa kozi.

### Uthibitishaji wa Azure CLI (Hiari)
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

### Mtiririko Gani wa Kuingia Unapaswa Kutumika?

- Tumia `azd auth login` kama unafuata njia ya mwanzo ya AZD hasa na kuendesha amri za `azd`.
- Tumia `az login` pia unapotaka kuendesha amri za Azure CLI kama `az account show` au kukagua rasilimali moja kwa moja.
- Ikiwa mazoezi yanajumuisha amri za `azd` na `az`, fanya amri zote za kuingia mara moja mwanzoni.

### Uthibitishaji wa Kifaa kwa Msimbo
Ikiwa uko kwenye mfumo usio na kichwa au una matatizo ya kivinjari:
```bash
azd auth login --use-device-code
```

### Msimamizi wa Huduma (CI/CD)
Kwa mazingira yaliyo otomatiki:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Thibitisha Usanidi Wako Kamili

Ikiwa unataka ukaguzi wa haraka wa utayari kabla ya kuanza Sura 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Usanidi

### Usanidi wa Ulimwengu
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Vigezo vya Mazingira
Ongeza kwa wasifu wa shell yako (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Muunganiko wa IDE

### Visual Studio Code
Sakinisha upanuzi wa Azure Developer CLI:
1. Fungua VS Code
2. Nenda kwenye Upanuzi (Ctrl+Shift+X)
3. Tafuta "Azure Developer CLI"
4. Sakinisha upanuzi

Sifa:
- IntelliSense kwa azure.yaml
- Amri za terminal iliyounganishwa
- Kuvinjari templeti
- Ufuatiliaji wa utoaji

### GitHub Codespaces
Unda `.devcontainer/devcontainer.json`:
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
1. Sakinisha programu-jalizi ya Azure
2. Sanidi sifa za Azure
3. Tumia terminal iliyounganishwa kwa amri za azd

## 🐛 Kutatua Matatizo ya Usakinishaji

### Masuala ya Kawaida

#### Ruhusa Imepuuzwa (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Masuala ya PATH
Ongeza azd kwa PATH yako kwa mikono:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Masuala ya Mtandao/Proxy
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Migongano ya Toleo
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Kupata Msaada Zaidi
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Kusasisha azd

### Ukaguzi wa Sasisho
azd inatilia maanani wakati toleo jipya linapatikana, na unaweza kuthibitisha toleo lako la sasa kwa:
```bash
azd version
```

### Sasisho la Mikono

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

## 💡 Maswali Yanayoulizwa Mara kwa Mara

<details>
<summary><strong>Tofauti gani kati ya azd na az CLI?</strong></summary>

**Azure CLI (az)**: Chombo cha ngazi ya chini kwa kusimamia rasilimali za Azure binafsi
- `az webapp create`, `az storage account create`
- Rasilimali moja kwa wakati
- Lengo la usimamizi wa miundombinu

**Azure Developer CLI (azd)**: Chombo cha ngazi ya juu kwa utoaji wa programu kamili
- `azd up` hutengeneza programu nzima na rasilimali zote
- Michakato inayotumia templeti
- Lengo la uzalishaji wa msanidi programu

**Ni huru**: azd hutumia uthibitishaji wake kwa default. Sakinisha na ingia kwa Azure CLI tu kwa amri za `az`, au uchague wazi kwa `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strongJe, naweza kutumia azd na rasilimali za Azure zilizopo?</strong></summary>

Ndiyo! Unaweza:
1. Kuingiza rasilimali zilizopo kwenye mazingira ya azd
2. Kurejelea rasilimali zilizopo katika templeti zako za Bicep
3. Kutumia azd kwa utoaji mpya sambamba na miundombinu iliyopo

Angalia [Mwongozo wa Usanidi](../chapter-03-configuration/configuration.md) kwa maelezo.
</details>

<details>
<summary><strongJe, azd ina kazi na Serikali ya Azure au Azure China?</strong></summary>

Ndiyo, sanidi wingu:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Ikiwa pia unatumia Azure CLI, sanidi `az cloud set --name ...` tofauti. Huduma za templeti na upatikanaji wa modeli hutofautiana kwa wingu.
</details>

<details>
<summary><strong>Je, naweza kutumia azd katika mitiririko ya CI/CD?</strong></summary>

Kabisa! azd imeundwa kwa ajili ya kiotomatiki:
- Muunganiko wa Vitendo vya GitHub
- Msaada wa Azure DevOps
- Uthibitishaji kwa msimamizi wa huduma
- Hali isiyo ya mwingiliano

Angalia [Mwongozo wa Utoaji](../chapter-04-infrastructure/deployment-guide.md) kwa mifano ya CI/CD.
</details>

<details>
<summary><strong>Gharama ya kutumia azd ni gani?</strong></summary>

azd yenyewe ni **bure kabisa** na chanzo huru. Unalipa tu kwa:
- Rasilimali za Azure unazotoa
- Gharama za matumizi ya Azure (kompyuta, hifadhi, n.k.)

Tumia `azd provision --preview` kukagua rasilimali zilizopendekezwa, kisha makadiria gharama zao kwa [Kalkuleta ya Bei ya Azure](https://azure.microsoft.com/pricing/calculator/). Toa awali hihesabi bei.
</details>

## Hatua Zinazofuata

1. **Kamilisha uthibitishaji**: Hakikisha unaweza kufikia usajili wako wa Azure
2. **Jaribu utoaji wako wa kwanza**: Fuata [Mwongozo wa Mradi wa Kwanza](first-project.md)
3. **Chunguza templeti**: Vinjari templeti zilizopo kwa kutumia `azd template list`
4. **Sakinisha IDE yako**: Andaa mazingira yako ya maendeleo

## Msaada

Ikiwa unakumbana na matatizo:
- [Nyaraka Rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Ripoti Masuala](https://github.com/Azure/azure-dev/issues)
- [Majadiliano ya Jumuiya](https://github.com/Azure/azure-dev/discussions)
- [Msaada wa Azure](https://azure.microsoft.com/support/)
- [**Ujuzi wa Wakala wa Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - Pata mwongozo wa amri za Azure moja kwa moja katika mhariri wako kwa kutumia `npx skills add microsoft/github-copilot-for-azure`

---

**Urambazaji wa Sura:**
- **📚 Kuu ya Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Hali ya Sasa**: Sura 1 - Msingi & Anza Haraka
- **⬅️ Iliyopita**: [Msingi wa AZD](azd-basics.md) 
- **➡️ Inayofuata**: [Mradi Wako wa Kwanza](first-project.md)
- **🚀 Sura Inayofuata**: [Sura 2: Maendeleo ya AI-Kwanza](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Usakinishaji Umekamilika!** Endelea na [Mradi Wako wa Kwanza](first-project.md) kuanza kujenga na azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->