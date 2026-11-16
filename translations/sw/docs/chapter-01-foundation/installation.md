# Mwongozo wa Ufungaji na Usanidi

**Uelekezaji wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 1 - Msingi na Anza Haraka
- **⬅️ Iliyotangulia**: [Misingi ya AZD](azd-basics.md)
- **➡️ Ifuatayo**: [Mradi Wako wa Kwanza](first-project.md)
- **🚀 Sura Ifuatayo**: [Sura ya 2: Maendeleo ya AI-Kwanza](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Utangulizi

Mwongozo kamili huu utakuelekeza jinsi ya kufunga na kusanidi Azure Developer CLI (azd) kwenye mfumo wako. Utajifunza njia mbalimbali za ufungaji kwa mifumo tofauti ya uendeshaji, usanidi wa uthibitishaji, na usanidi wa awali kuandaa mazingira yako ya maendeleo kwa ajili ya utoaji wa Azure.

## Malengo ya Kujifunza

Mwishoni mwa somo hili, utakuwa umeweza:
- Kufunga Azure Developer CLI kwenye mfumo wako kwa mafanikio
- Kusanidi uthibitishaji na Azure kwa kutumia njia mbalimbali
- Kuandaa mazingira yako ya maendeleo na mahitaji muhimu
- Kuelewa chaguzi tofauti za ufungaji na wakati wa kutumia kila moja
- Kutatua matatizo ya kawaida ya ufungaji na usanidi

## Matokeo ya Kujifunza

Baada ya kukamilisha somo hili, utaweza:
- Kufunga azd kwa kutumia njia bora kwa jukwaa lako
- Kufanya uthibitishaji na Azure kwa kutumia azd auth login
- Kuhakiki ufungaji wako na kujaribu amri za msingi za azd
- Kusanidi mazingira yako ya maendeleo kwa matumizi bora ya azd
- Kutatua matatizo ya kawaida ya ufungaji kwa kujitegemea

Mwongozo huu utakusaidia kufunga na kusanidi Azure Developer CLI kwenye mfumo wako, bila kujali mfumo wa uendeshaji au mazingira ya maendeleo unayotumia.

## Mahitaji ya Awali

Kabla ya kufunga azd, hakikisha una:
- **Usajili wa Azure** - [Tengeneza akaunti bure](https://azure.microsoft.com/free/)
- **Azure CLI** (hiari) - Kwa mifano inayotekelezwa wazi kwa kutumia `az`; azd hufanya uthibitishaji kwa kujitegemea
- **Git** - Kwa kunakili templates na udhibiti wa matoleo
- **Docker** (hiari) - Kwa programu zilizo ndani ya masanduku ya kontena

## Njia za Ufungaji

### Windows

#### Chaguo 1: Meneja wa Paket ya Windows (Inayopendekezwa)
```cmd
winget install microsoft.azd
```

#### Chaguo 2: Skripti ya Ufungaji ya PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Chaguo 3: Chocolatey
```cmd
choco install azd
```

#### Chaguo 4: Ufungaji wa Mikono
1. Pakua toleo la hivi karibuni kutoka [GitHub](https://github.com/Azure/azure-dev/releases)
2. Vuta nje kwenye `C:\Program Files\azd\`
3. Ongeza kwenye mabadiliko ya mazingira ya PATH

### macOS

#### Chaguo 1: Homebrew (Inayopendekezwa)
```bash
brew tap azure/azd
brew install azd
```

#### Chaguo 2: Skripti ya Ufungaji
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Chaguo 3: Ufungaji wa Mikono
Pakua kituo cha kumbukumbu cha usanifu wa macOS kutoka [mali za toleo](https://github.com/Azure/azure-dev/releases), kicha, na ongeza binary ya `azd` kwenye `PATH` yako.

### Linux

#### Chaguo 1: Skripti ya Ufungaji (Inayopendekezwa)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Chaguo 2: Mameneja wa Paket

**Ufungaji wa mikono kutoka kwa mali za toleo:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Baadhi ya Codespaces na mazingira ya kontena za maendeleo tayari zina `azd`, lakini unapaswa kuthibitisha badala ya kubashiri:

```bash
azd version
```

Ikiwa `azd` haipo, ifunge na skripti ya kawaida kwa mazingira hayo.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Kontena hili la muda mfupi halihifadhi hali ya kuingia kati ya makazi. Kwa utoaji wa mara kwa mara, tumia [usanidi wa kontena wa maendeleo](dev-containers.md); ujenzi wa kontena pia unahitaji daemon ya Docker inayopatikana ndani ya kontena.

## ✅ Thibitisha Ufungaji

Baada ya ufungaji, thibitisha azd inafanya kazi ipasavyo:

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

**Kumbuka**: Nambari halisi ya toleo itatofautiana. Angalia [Matoleo ya Azure Developer CLI](https://github.com/Azure/azure-dev/releases) kwa toleo jipya zaidi.

**✅ Orodha ya Ukaguzi wa Mafanikio ya Ufungaji:**
- [ ] `azd version` inaonyesha nambari ya toleo bila makosa
- [ ] `azd --help` inaonyesha maelezo ya amri
- [ ] `azd template list` inaonyesha templates zinazopatikana
- [ ] Unaweza kutengeneza saraka ya majaribio na kuendesha `azd init` kwa mafanikio

**Ikiwa ukaguzi wote unapita, uko tayari kuendelea na [Mradi Wako wa Kwanza](first-project.md)!**

## Usanidi wa Uthibitishaji

### Usanidi Unaopendekezwa kwa Waanzilishi

Kwa mtiririko wa kazi wa AZD kwanza, ingia kwa kutumia `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Tumia kuingia kwa Azure CLI tu unapopanga kuendesha amri za `az` wewe mwenyewe wakati wa kozi.

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

### Mtiririko Gani wa Kuingia Unapaswa Kutumia?

- Tumia `azd auth login` ikiwa unafuata njia ya mwanzo ya AZD na kwa kawaida kuendesha amri za `azd`.
- Tumia `az login` pia unapotaka kuendesha amri za Azure CLI kama `az account show` au kukagua rasilimali moja kwa moja.
- Ikiwa zoezi linahusisha amri za `azd` na `az`, endesha amri zote mbili mara moja mwanzoni.

### Uthibitishaji wa Kifaa kwa Nambari
Ikiwa uko kwenye mfumo usio na kivinjari au una matatizo ya kivinjari:
```bash
azd auth login --use-device-code
```

### Mwakilishi wa Huduma (CI/CD)
Kwa mazingira ya moja kwa moja:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Thibitisha Usanidi Wako Kamili

Ikiwa unataka ukaguzi wa haraka kabla ya kuanza Sura ya 1:

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

### Mabadiliko ya Mazingira
Ongeza kwenye wasifu wako wa shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Uingizaji wa IDE

### Visual Studio Code
Sakinisha upanuzi wa Azure Developer CLI:
1. Fungua VS Code
2. Nenda kwenye Extensions (Ctrl+Shift+X)
3. Tafuta "Azure Developer CLI"
4. Sakinisha upanuzi

Vipengele:
- IntelliSense kwa azure.yaml
- Amri za terminal zilizojumuishwa
- Uvinjari wa matemplate
- Ufuatiliaji wa utoaji

### GitHub Codespaces
Tengeneza `.devcontainer/devcontainer.json`:
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
1. Sakinisha plugin ya Azure
2. Sanidi cheti cha Azure
3. Tumia terminal iliyojumuishwa kwa amri za azd

## 🐛 Kutatua Matatizo ya Ufungaji

### Matatizo ya Kawaida

#### Ruhusa Imelikataliwa (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Matatizo ya PATH
Ongeza azd kwenye PATH yako kwa mikono:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Matatizo ya Mtandao/Wakalimani
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Migogoro ya Toleo
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
azd itanukuu unapo patikana toleo jipya zaidi, na unaweza kuthibitisha toleo lako la sasa na:
```bash
azd version
```

### Sasisho za Mikono

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

**Azure CLI (az)**: Zana ya ngazi ya chini kwa kusimamia rasilimali za Azure binafsi
- `az webapp create`, `az storage account create`
- Rasilimali moja kwa wakati
- Lengo la usimamizi wa miundombinu

**Azure Developer CLI (azd)**: Zana ya ngazi ya juu kwa utoaji kamili wa programu
- `azd up` inatoa programu kamili na rasilimali zote
- Mitiririko ya kazi inayotumia template
- Lengo la uzalishaji wa mwasisi

**Zina uhuru**: azd hutumia uthibitishaji wake kwa chaguo-msingi. Fungua na ingia kwa Azure CLI tu kwa amri za `az`, au chagua wazi kutumia `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strongNaweza kutumia azd na rasilimali zilizopo za Azure?</strong></summary>

Ndiyo! Unaweza:
1. Kuingiza rasilimali zilizopo katika mazingira ya azd
2. Kumtaja rasilimali zilizopo katika templates zako za Bicep
3. Kutumia azd kwa utoaji mpya pamoja na miundombinu iliyopo

Angalia [Mwongozo wa Usanidi](../chapter-03-configuration/configuration.md) kwa maelezo zaidi.
</details>

<details>
<summary><strong>Je, azd hufanya kazi na Azure Government au Azure China?</strong></summary>

Ndiyo, sanidi wingu:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Ikiwa unatumia Azure CLI pia, sanidi `az cloud set --name ...` kando. Huduma za template na upatikanaji wa modeli hutofautiana kwa wingu.
</details>

<details>
<summary><strong>Naweza kutumia azd katika mistari ya CI/CD?</strong></summary>

Kabisa! azd imetengenezwa kwa ajili ya otomatiki:
- Uingizaji wa GitHub Actions
- Msaada wa Azure DevOps
- Uthibitishaji wa mwakilishi wa huduma
- Hali isiyo ya mwingiliano

Angalia [Mwongozo wa Utoaji](../chapter-04-infrastructure/deployment-guide.md) kwa mifano ya CI/CD.
</details>

<details>
<summary><strong>Gharama ya kutumia azd ni gani?</strong></summary>

azd yenyewe ni **bure kabisa** na chanzo huria. Unalipa tu kwa:
- Rasilimali za Azure unazotumia
- Gharama za matumizi ya Azure (hisa, uhifadhi, n.k.)

Tumia `azd provision --preview` kuchunguza rasilimali zinazopendekezwa, kisha pima gharama zao na [Kikokotoo cha Bei cha Azure](https://azure.microsoft.com/pricing/calculator/). Mwoneko awali hauhesabu bei.
</details>

## Hatua Zifuatazo

1. **Kamilisha uthibitishaji**: Hakikisha unaweza kufikia usajili wako wa Azure
2. **Jaribu utoaji wako wa kwanza**: Fuata [Mwongozo wa Mradi wa Kwanza](first-project.md)
3. **Chunguza templates**: Vinjari templates zinazopatikana kwa `azd template list`
4. **Sanidi IDE yako**: Andaa mazingira yako ya maendeleo

## Msaada

Ikiwa unakutana na matatizo:
- [Nyaraka Rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Ripoti Matatizo](https://github.com/Azure/azure-dev/issues)
- [Mijadala ya Jamii](https://github.com/Azure/azure-dev/discussions)
- [Msaada wa Azure](https://azure.microsoft.com/support/)
- [**Ujuzi wa Wakala wa Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - Pata maelekezo ya amri za Azure moja kwa moja katika mhariri wako kwa `npx skills add microsoft/github-copilot-for-azure`

---

**Uelekezaji wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 1 - Msingi na Anza Haraka
- **⬅️ Iliyotangulia**: [Misingi ya AZD](azd-basics.md) 
- **➡️ Ifuatayo**: [Mradi Wako wa Kwanza](first-project.md)
- **🚀 Sura Ifuatayo**: [Sura ya 2: Maendeleo ya AI-Kwanza](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Ufungaji Umekamilika!** Endelea na [Mradi Wako wa Kwanza](first-project.md) kuanza kujenga kwa azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->