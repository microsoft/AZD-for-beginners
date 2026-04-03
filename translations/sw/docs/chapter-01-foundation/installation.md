# Mwongozo wa Ufungaji na Usanidi

**Uvinjari wa Sura:**
- **📚 Course Home**: [AZD Kwa Waanziaji](../../README.md)
- **📖 Sura ya Sasa**: Sura 1 - Msingi na Kuanzia Haraka
- **⬅️ Iliyopita**: [AZD Basics](azd-basics.md)
- **➡️ Inayofuata**: [Mradi Wako wa Kwanza](first-project.md)
- **🚀 Sura Inayofuata**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Utangulizi

Mwongozo huu wa kina utakuelekeza kupitia hatua za kusakinisha na kusanidi Azure Developer CLI (azd) kwenye mfumo wako. Utajifunza njia mbalimbali za ufungaji kwa mifumo tofauti ya uendeshaji, usanidi wa uthibitisho, na usanidi wa awali kuandaa mazingira yako ya maendeleo kwa ajili ya utekelezaji katika Azure.

## Malengo ya Kujifunza

Mwisho wa somo hili, utakuwa umebaini:
- Kusakinisha kwa mafanikio Azure Developer CLI kwenye mfumo wako wa uendeshaji
- Kusanidi uthibitisho na Azure kwa kutumia njia mbalimbali
- Kuweka mazingira yako ya maendeleo na mahitaji muhimu
- Kuelewa chaguzi tofauti za ufungaji na lini kutumia kila moja
- Kutatua matatizo ya kawaida ya ufungaji na usanidi

## Matokeo ya Kujifunza

Baada ya kumaliza somo hili, utaweza:
- Kusakinisha azd kwa kutumia njia inayofaa kwa jukwaa lako
- Kujisajili na Azure kwa kutumia `azd auth login`
- Kuangalia ufungaji wako na kupima amri za msingi za azd
- Kusanidi mazingira yako ya maendeleo kwa matumizi bora ya azd
- Kutatua matatizo ya kawaida ya ufungaji kwa kujitegemea

Mwongozo huu utakusaidia kusakinisha na kusanidi Azure Developer CLI kwenye mfumo wako, bila kujali mfumo wa uendeshaji au mazingira ya maendeleo unayotumia.

## Mahitaji

Kabla ya kusakinisha azd, hakikisha una:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - Kwa uthibitisho na usimamizi wa rasilimali
- **Git** - Kwa kukopa templeti na udhibiti wa toleo
- **Docker** (optional) - Kwa programu zilizo kwenye kontena

## Njia za Ufungaji

### Windows

#### Chaguo 1: Windows Package Manager (Inayopendekezwa)
```cmd
winget install microsoft.azd
```

#### Chaguo 2: Skripti ya Usakinishaji ya PowerShell
```powershell
# Inafaa wakati winget haipatikani
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Chaguo 3: Chocolatey
```cmd
choco install azd
```

#### Chaguo 4: Ufungaji wa Mkono
1. Pakua toleo la hivi karibuni kutoka [GitHub](https://github.com/Azure/azure-dev/releases)
2. Toka faili hadi `C:\Program Files\azd\`
3. Ongeza kwenye PATH environment variable

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

#### Chaguo 3: Ufungaji wa Mkono
```bash
# Pakua na sakinisha
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Chaguo 1: Skripti ya Usakinishaji (Inayopendekezwa)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Chaguo 2: Meneja wa Pakiti

**Ufungaji wa mkono kutoka kwa mali za release:**
```bash
# Pakua jalada la hivi karibuni kwa usanifu wako wa Linux kutoka:
# https://github.com/Azure/azure-dev/releases
# Kisha uitoe na uongeze binari ya azd kwenye PATH yako.
```

### GitHub Codespaces

Baadhi ya Codespaces na mazingira ya dev container tayari yana jumuisha `azd`, lakini unapaswa kuthibitisha badala ya kudhani:

```bash
azd version
```

If `azd` is missing, install it with the standard script for the environment.

### Docker

```bash
# Endesha azd ndani ya kontena
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Tengeneza jina mbadala kwa matumizi rahisi
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Thibitisha Ufungaji

Baada ya usakinishaji, thibitisha azd inafanya kazi ipasavyo:

```bash
# Angalia toleo
azd version

# Angalia msaada
azd --help

# Orodhesha templeti zinazopatikana
azd template list
```

Matokeo yanayotarajiwa:
```
azd version 1.x.x (commit xxxxxx)
```

**Kumbuka**: Nambari ya toleo halisi itatofautiana. Angalia [Toleo za Azure Developer CLI](https://github.com/Azure/azure-dev/releases) kwa toleo la karibuni.

**✅ Orodha ya Ukaguzi ya Mafanikio ya Ufungaji:**
- [ ] `azd version` inaonyesha nambari ya toleo bila makosa
- [ ] `azd --help` inaonyesha nyaraka za amri
- [ ] `azd template list` inaonyesha templeti zinazopatikana
- [ ] Unaweza kuunda saraka ya majaribio na kuendesha `azd init` kwa mafanikio

**Ikiwa ukaguzi wote unapita, uko tayari kuendelea kwenye [Mradi Wako wa Kwanza](first-project.md)!**

## Usanidi wa Uthibitisho

### Usanidi Unaopendekezwa kwa Waanziaji

Kwa mtiririko wa kazi unaotegemea AZD kwanza, ingia kwa kutumia `azd auth login`.

```bash
# Inahitajika kwa amri za AZD kama azd up
azd auth login

# Thibitisha hali ya uthibitishaji wa AZD
azd auth login --check-status
```

Tumia kuingia kwa Azure CLI tu wakati unapopanga kuendesha amri za `az` mwenyewe wakati wa kozi.

### Uthibitisho wa Azure CLI (Hiari)
```bash
# Sakinisha Azure CLI ikiwa bado haijawekwa
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: angalia nyaraka za ufungaji za Azure CLI kwa ugawaji wako

# Ingia kwenye Azure
az login

# Thibitisha uthibitisho
az account show
```

### Ni Njia Gani ya Kuingia Unapaswa Kutumia?

- Tumia `azd auth login` ikiwa unafuata njia ya waanziaji ya AZD na kwa kawaida unafanya amri za `azd`.
- Tumia `az login` pia wakati unataka kuendesha amri za Azure CLI kama `az account show` au kuchambua rasilimali moja kwa moja.
- Ikiwa zoezi linajumuisha amri za `azd` na `az`, endesha amri zote mbili za kuingia mara moja mwanzoni.

### Device Code Authentication
Ikiwa uko kwenye mfumo usio na kivinjari au una matatizo na kivinjari:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Kwa mazingira ya kiotomatiki:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
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

### Usanidi wa Kimataifa
```bash
# Weka usajili wa chaguo-msingi
azd config set defaults.subscription <subscription-id>

# Weka eneo la chaguo-msingi
azd config set defaults.location eastus2

# Angalia usanidi wote
azd config show
```

### Vigezo vya Mazingira
Ongeza kwenye wasifu wa shell wako (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Usanidi wa Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Usanidi wa azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Wezesha kurekodi kumbukumbu za utambuzi
```

## Uunganishaji wa IDE

### Visual Studio Code
Sakinisha nyongeza ya Azure Developer CLI:
1. Fungua VS Code
2. Nenda kwenye Extensions (Ctrl+Shift+X)
3. Tafuta "Azure Developer CLI"
4. Sakinisha nyongeza

Sifa:
- IntelliSense kwa azure.yaml
- Amri za terminal zilizounganishwa
- Kuvinjari templeti
- Ufuatiliaji wa utekelezaji

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
1. Sakinisha nyongeza ya Azure
2. Sanidi taarifa za uthibitisho za Azure
3. Tumia terminal iliyojumuishwa kwa amri za azd

## 🐛 Kusuluhisha Tatizo la Ufungaji

### Masuala Yanayotokea Mara kwa Mara

#### Permission Denied (Windows)
```powershell
# Endesha PowerShell kama Msimamizi
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Masuala ya PATH
Ongeza azd kwa PATH yako kwa mkono:

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
# Sanidi wakala
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Ruka uthibitishaji wa SSL (haipendekezwi kwa uzalishaji)
azd config set http.insecure true
```

#### Migongano ya Toleo
```bash
# Ondoa usakinishaji wa zamani
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: ondoa bainari ya awali ya azd au symlink kabla ya kusakinisha tena

# Safisha usanidi
rm -rf ~/.azd
```

### Kupata Msaada Zaidi
```bash
# Washa logi za utatuzi
export AZD_DEBUG=true
azd <command> --debug

# Angalia usanidi wa sasa
azd config show

# Angalia hali ya usambazaji wa sasa
azd show
```

## Kusasisha azd

### Ukaguzi wa Sasisho
azd inakuonya wakati toleo jipya linapatikana, na unaweza kuthibitisha kujengwa kwako kwa:
```bash
azd version
```

### Sasisho za Mkono

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
<summary><strong>Nini tofauti kati ya azd na az CLI?</strong></summary>

**Azure CLI (az)**: Zana ya ngazi ya chini kwa kusimamia rasilimali za Azure kwa mtu mmoja
- `az webapp create`, `az storage account create`
- Rasilimali moja kwa wakati
- Lengo la usimamizi wa miundombinu

**Azure Developer CLI (azd)**: Zana ya ngazi ya juu kwa utekelezaji wa programu kamili
- `azd up` inatekeleza programu yote pamoja na rasilimali zote
- Mtiririko wa kazi unaotegemea templeti
- Lengo la kuongeza uzalishaji wa msanidi programu

**Unahitaji zote mbili**: azd hutumia az CLI kwa uthibitisho
</details>

<details>
<summary><strong>Je, ninaweza kutumia azd na rasilimali za Azure zilizopo?</strong></summary>

Ndiyo! Unaweza:
1. Ingiza rasilimali zilizopo kwenye mazingira ya azd
2. Rejea rasilimali zilizopo katika templeti zako za Bicep
3. Tumia azd kwa utekelezaji mpya sambamba na miundombinu iliyopo

Tazama [Mwongozo wa Usanidi](configuration.md) kwa maelezo.
</details>

<details>
<summary><strongJe, azd inafanya kazi na Azure Government au Azure China?</strong></summary>

Ndiyo, sanidi cloud:
```bash
# Azure ya Serikali
az cloud set --name AzureUSGovernment
az login

# Azure ya China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Je, ninaweza kutumia azd katika pipelines za CI/CD?</strong></summary>

Bila shaka! azd imeundwa kwa ajili ya uendeshaji wa moja kwa moja:
- Uunganishwaji na GitHub Actions
- Msaada wa Azure DevOps
- Uthibitisho wa service principal
- Mode isiyo ya mwingiliano

Tazama [Mwongozo wa Utekelezaji](../chapter-04-infrastructure/deployment-guide.md) kwa mifano ya CI/CD.
</details>

<details>
<summary><strong>Gharama ya kutumia azd ni kiasi gani?</strong></summary>

azd yenyewe ni **kabisa bure** na chanzo wazi. Unalipa tu kwa:
- Rasilimali za Azure unazozitekeleza
- Gharama za matumizi ya Azure (compute, storage, n.k.)

Tumia `azd provision --preview` kutathmini gharama kabla ya utekelezaji.
</details>

## Hatua Zinazofuata

1. **Kamilisha uthibitisho**: Hakikisha unaweza kufikia subscription yako ya Azure
2. **Jaribu utekelezaji wako wa kwanza**: Fuata [Mwongozo wa Mradi wa Kwanza](first-project.md)
3. **Vinjari templeti**: Vinjari templeti zinazopatikana kwa `azd template list`
4. **Sanidi IDE yako**: Weka mazingira yako ya maendeleo

## Msaada

Ikiwa unakutana na matatizo:
- [Nyaraka Rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Ripoti Masuala](https://github.com/Azure/azure-dev/issues)
- [Majadiliano ya Jamii](https://github.com/Azure/azure-dev/discussions)
- [Msaada wa Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Pata mwongozo wa amri za Azure moja kwa moja katika mhariri wako kwa kutumia `npx skills add microsoft/github-copilot-for-azure`

---

**Uvinjari wa Sura:**
- **📚 Course Home**: [AZD Kwa Waanziaji](../../README.md)
- **📖 Sura ya Sasa**: Sura 1 - Msingi na Kuanzia Haraka
- **⬅️ Iliyopita**: [AZD Basics](azd-basics.md) 
- **➡️ Inayofuata**: [Mradi Wako wa Kwanza](first-project.md)
- **🚀 Sura Inayofuata**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Ufungaji Umekamilika!** Endelea kwenye [Mradi Wako wa Kwanza](first-project.md) kuanza kujenga kwa kutumia azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tamko la kutokuwajibika**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Nyaraka ya asili katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, tafsiri ya mtaalamu wa kibinadamu inashauriwa. Hatuwajibiki kwa mkanganyiko au tafsiri potofu zozote zitokanazo na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->