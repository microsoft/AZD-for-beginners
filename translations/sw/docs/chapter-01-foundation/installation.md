# Mwongozo wa Ufungaji na Usanidi

**Utaratibu wa Sura:**
- **📚 Nyumbani ya Kozi**: [AZD kwa Waanzishaji](../../README.md)
- **📖 Sura ya Sasa**: Sura 1 - Misingi & Kuanzisha Haraka
- **⬅️ Iliyopita**: [AZD Basics](azd-basics.md)
- **➡️ Ifuatayo**: [Mradi Wako wa Kwanza](first-project.md)
- **🚀 Sura Ifuatayo**: [Sura 2: Maendeleo ya Kwanza kwa AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Utangulizi

Mwongozo huu kamili utakuelekeza jinsi ya kusakinisha na kusanidi Azure Developer CLI (azd) kwenye mfumo wako. Utahitaji kujifunza njia mbalimbali za ufungaji kwa mifumo tofauti ya uendeshaji, usanidi wa uthibitishaji, na usanidi wa awali ili kuandaa mazingira yako ya maendeleo kwa utoaji kwenye Azure.

## Malengo ya Kujifunza

Mwisho wa somo hili, utakuwa umeweza:
- Kusakinisha kwa mafanikio Azure Developer CLI kwenye mfumo wako wa uendeshaji
- Kusanidi uthibitishaji na Azure kwa kutumia njia mbalimbali
- Kuweka mazingira yako ya maendeleo pamoja na mahitaji muhimu
- Kuelewa chaguzi tofauti za ufungaji na lini kutumia kila moja
- Kutatua matatizo ya kawaida ya ufungaji na usanidi

## Matokeo ya Kujifunza

Baada ya kumaliza somo hili, utaweza:
- Kusakinisha azd kwa kutumia njia inayofaa kwa jukwaa lako
- Kutambua na Azure kwa kutumia azd auth login
- Kuthibitisha ufungaji wako na kujaribu amri za msingi za azd
- Kusanidi mazingira yako ya maendeleo kwa matumizi bora ya azd
- Kutatua matatizo ya kawaida ya ufungaji kwa kujitegemea

Mwongozo huu utakusaidia kusakinisha na kusanidi Azure Developer CLI kwenye mfumo wako, bila kujali mfumo wako wa uendeshaji au mazingira ya maendeleo.

## Mahitaji ya Awali

Kabla ya kusakinisha azd, hakikisha una:
- **Uanachama wa Azure** - [Unda akaunti ya bure](https://azure.microsoft.com/free/)
- **Azure CLI** - Kwa uthibitishaji na usimamizi wa rasilimali
- **Git** - Kwa kukopa templates na udhibiti wa matoleo
- **Docker** (hiari) - Kwa programu zilizo ndani ya kontena

## Njia za Ufungaji

### Windows

#### Chaguo 1: PowerShell (Inayopendekezwa)
```powershell
# Endesha kama msimamizi au kwa ruhusa zilizoongezwa
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Chaguo 2: Meneja wa Pakiti wa Windows (winget)
```cmd
winget install Microsoft.Azd
```

#### Chaguo 3: Chocolatey
```cmd
choco install azd
```

#### Chaguo 4: Ufungaji wa Mkono
1. Pakua toleo la hivi karibuni kutoka [GitHub](https://github.com/Azure/azure-dev/releases)
2. Fukulia hadi `C:\Program Files\azd\`
3. Ongeza kwenye variable ya PATH

### macOS

#### Chaguo 1: Homebrew (Inayopendekezwa)
```bash
brew tap azure/azd
brew install azd
```

#### Chaguo 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Chaguo 3: Ufungaji wa Mkono
```bash
# Pakua na sakinisha
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Chaguo 1: Install Script (Inayopendekezwa)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Chaguo 2: Package Managers

**Ubuntu/Debian:**
```bash
# Ongeza hifadhi ya vifurushi ya Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Sakinisha azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Ongeza hazina ya vifurushi ya Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd imewekwa tayari katika GitHub Codespaces. Unda tu codespace na anza kutumia azd mara moja.

### Docker

```bash
# Endesha azd ndani ya kontena
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Unda jina mbadala kwa matumizi rahisi
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Thibitisha Ufungaji

Baada ya ufungaji, thibitisha kuwa azd inafanya kazi vizuri:

```bash
# Angalia toleo
azd version

# Tazama msaada
azd --help

# Orodhesha templeti zinazopatikana
azd template list
```

Matokeo yanayotegemewa:
```
azd version 1.x.x (commit xxxxxx)
```

**Kumbuka**: Nambari ya toleo halisi itaendelea kutofautiana. Angalia [Matoleo ya Azure Developer CLI](https://github.com/Azure/azure-dev/releases) kwa toleo la hivi karibuni.

**✅ Orodha ya Ukaguzi ya Mafanikio ya Ufungaji:**
- [ ] `azd version` inaonyesha nambari ya toleo bila makosa
- [ ] `azd --help` inaonyesha nyaraka za amri
- [ ] `azd template list` inaonyesha templates zinazopatikana
- [ ] `az account show` inaonyesha uanachama wako wa Azure
- [ ] Unaweza kuunda direktori ya mtihani na kuendesha `azd init` kwa mafanikio

**Ikiwa kila ukaguzi unapitika, uko tayari kuendelea kwa [Mradi Wako wa Kwanza](first-project.md)!**

## Usanidi wa Uthibitishaji

### Uthibitishaji wa Azure CLI (Inayopendekezwa)
```bash
# Sakinisha Azure CLI ikiwa haijawekwa tayari
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Ingia kwenye Azure
az login

# Thibitisha uthibitishaji
az account show
```

### Uthibitishaji kwa Kodi ya Kifaa
Kama uko kwenye mfumo usio na GUI (headless) au una matatizo ya kivinjari:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Kwa mazingira yaliyo otomatiki:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Usanidi

### Usanidi wa Kimataifa
```bash
# Weka usajili wa chaguo-msingi
azd config set defaults.subscription <subscription-id>

# Weka eneo la chaguo-msingi
azd config set defaults.location eastus2

# Tazama usanidi wote
azd config list
```

### Vigezo vya Mazingira
Ongeza kwenye wasifu wako wa shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Usanidi wa Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Usanidi wa azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Washa kumbukumbu za utatuzi
```

## Uunganishaji wa IDE

### Visual Studio Code
Sakinisha ugani wa Azure Developer CLI:
1. Fungua VS Code
2. Nenda kwa Extensions (Ctrl+Shift+X)
3. Tafuta "Azure Developer CLI"
4. Sakinisha ugani

Vipengele:
- IntelliSense kwa azure.yaml
- Amri za terminali zilizounganishwa
- Kivinjari cha templates
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
1. Sakinisha kiendelezi cha Azure
2. Sanidi vyeti vya Azure
3. Tumia terminali iliyounganishwa kwa amri za azd

## 🐛 Utatuzi wa Matatizo ya Ufungaji

### Masuala ya Kawaida

#### Ruhusa Imekataliwa (Windows)
```powershell
# Endesha PowerShell kama msimamizi
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

#### Matatizo ya Mtandao/Proxy
```bash
# Sanidi proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Ruka uthibitisho wa SSL (haipendekezwi kwa uzalishaji)
azd config set http.insecure true
```

#### Migongano ya Toleo
```bash
# Ondoa usakinishaji wa zamani
# Windows: Tumia winget uninstall Microsoft.Azd
# macOS: Tumia brew uninstall azd
# Linux: Tumia sudo apt remove azd

# Safisha usanidi
rm -rf ~/.azd
```

### Kupata Msaada Zaidi
```bash
# Washa kurekodi kumbukumbu za uchunguzi (debug)
export AZD_DEBUG=true
azd <command> --debug

# Tazama usanidi wa sasa
azd config list

# Tazama hali ya uanzishaji wa sasa
azd show
```

## Kusasisha azd

### Sasisho za Moja kwa Moja
azd itakujulisha unapopatikana sasisho:
```bash
azd version --check-for-updates
```

### Sasisho za Mkono

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

## 💡 Maswali Yanayoulizwa Mara kwa Mara

<details>
<summary><strong>Nini tofauti kati ya azd na az CLI?</strong></summary>

**Azure CLI (az)**: Zana ya ngazi ya chini ya kusimamia rasilimali za Azure moja moja
- `az webapp create`, `az storage account create`
- Rasilimali moja kwa wakati
- Inalenga usimamizi wa miundombinu

**Azure Developer CLI (azd)**: Zana ya ngazi ya juu kwa utoaji kamili wa programu
- `azd up` hutoa programu yote pamoja na rasilimali zote
- Mifumo ya kazi inayotegemea templates
- Inalenga uzalishaji wa msanidi programu

**Unahitaji zote mbili**: azd inatumia az CLI kwa uthibitishaji
</details>

<details>
<summary><strong>Je, ninaweza kutumia azd na rasilimali za Azure zilizopo?</strong></summary>

Ndiyo! Unaweza:
1. Kuleta rasilimali zilizopo kwenye mazingira ya azd
2. Kurejea rasilimali zilizopo katika templates zako za Bicep
3. Tumia azd kwa utoaji mpya sambamba na miundombinu iliyopo

Tazama [Mwongozo wa Usanidi](configuration.md) kwa maelezo.
</details>

<details>
<summary><strong>Je, azd inafanya kazi na Azure Government au Azure China?</strong></summary>

Ndiyo, sanidi mazingira ya wingu:
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

Bila shaka! azd imeundwa kwa ajili ya otomatiki:
- Uunganisho na GitHub Actions
- Msaada wa Azure DevOps
- Uthibitishaji wa service principal
- Hali isiyoingiliana

Tazama [Mwongozo wa Utoaji](../chapter-04-infrastructure/deployment-guide.md) kwa mifano ya CI/CD.
</details>

<details>
<summary><strong>Je, gharama ya kutumia azd ni gani?</strong></summary>

azd yenyewe ni **bila malipo kabisa** na ni chanzo wazi. Unalipia tu:
- Rasilimali za Azure unazotoa
- Gharama za matumizi za Azure (compute, storage, n.k.)

Tumia `azd provision --preview` kukadiria gharama kabla ya utoaji.
</details>

## Hatua Zifuatazo

1. **Kamilisha uthibitishaji**: Hakikisha unaweza kufikia uanachama wako wa Azure
2. **Jaribu utoaji wako wa kwanza**: Fuata [Mwongozo wa Mradi wa Kwanza](first-project.md)
3. **Chunguza templates**: Vinjari templates zinazopatikana kwa `azd template list`
4. **Sanidi IDE yako**: Weka mazingira yako ya maendeleo

## Msaada

Ikiwa unakutana na matatizo:
- [Nyaraka Rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Ripoti Matatizo](https://github.com/Azure/azure-dev/issues)
- [Mijadala ya Jamii](https://github.com/Azure/azure-dev/discussions)
- [Msaada wa Azure](https://azure.microsoft.com/support/)

---

**Utaratibu wa Sura:**
- **📚 Nyumbani ya Kozi**: [AZD kwa Waanzishaji](../../README.md)
- **📖 Sura ya Sasa**: Sura 1 - Misingi & Kuanzisha Haraka
- **⬅️ Iliyopita**: [AZD Basics](azd-basics.md) 
- **➡️ Ifuatayo**: [Mradi Wako wa Kwanza](first-project.md)
- **🚀 Sura Ifuatayo**: [Sura 2: Maendeleo ya Kwanza kwa AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Ufungaji Umekamilika!** Endelea kwa [Mradi Wako wa Kwanza](first-project.md) ili kuanza kujenga na azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Tamko la kutokuwajibika:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au zisizokuwa sahihi. Nyaraka ya awali kwa lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inashauriwa kutumia tafsiri ya kitaalamu iliyofanywa na binadamu. Hatuwajibiki kwa kutoelewana au tafsiri potofu zitokanazo na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->