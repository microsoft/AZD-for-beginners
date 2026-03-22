# Mwongozo wa Ufungaji & Usanidi

**Utangamano wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD For Beginners](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 1 - Msingi & Mwanzo wa Haraka
- **⬅️ Iliyotangulia**: [AZD Basics](azd-basics.md)
- **➡️ Ifuatayo**: [Your First Project](first-project.md)
- **🚀 Sura Ifuatayo**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Utangulizi

Mwongozo huu kamili utakutembeza katika hatua za kusanidi na kufunga Azure Developer CLI (azd) kwenye mfumo wako. Utafanya njia mbalimbali za ufungaji kwa mifumo tofauti ya uendeshaji, usanidi wa uthibitishaji, na usanidi wa awali ili kuandaa mazingira yako ya maendeleo kwa upangaji wa Azure.

## Malengo ya Kujifunza

Mwisho wa somo hili, utakuwa umeweza:
- Kufunga Azure Developer CLI kwa mafanikio kwenye mfumo wako wa uendeshaji
- Kusanidi uthibitishaji na Azure kwa kutumia njia mbalimbali
- Kuweka mazingira yako ya maendeleo na mahitaji muhimu
- Kuelewa chaguzi tofauti za ufungaji na wakati wa kutumia kila moja
- Kutatua matatizo ya kawaida ya ufungaji na usanidi

## Matokeo ya Kujifunza

Baada ya kumaliza somo hili, utaweza:
- Kufunga azd kwa kutumia njia inayofaa kwa jukwaa lako
- Kujisajili na Azure kwa kutumia azd auth login
- Kuhakiki ufungaji wako na kupima amri za msingi za azd
- Kusanidi mazingira yako ya maendeleo kwa matumizi bora ya azd
- Kutatua matatizo ya ufungaji bila msaada

Mwongozo huu utakusaidia kufunga na kusanidi Azure Developer CLI kwenye mfumo wako, bila kujali mfumo wa uendeshaji au mazingira yako ya maendeleo.

## Mahitaji

Kabla ya kufunga azd, hakikisha una:
- **Usajili wa Azure** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - Kwa uthibitishaji na usimamizi wa rasilimali
- **Git** - Kwa kunakili templeti na udhibiti wa toleo
- **Docker** (hiari) - Kwa programu zilizo kwenye kontena

## Njia za Ufungaji

### Windows

#### Chaguo 1: PowerShell (Inayopendekezwa)
```powershell
# Endesha kama msimamizi au kwa ruhusa zilizoinuliwa
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Chaguo 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Chaguo 3: Chocolatey
```cmd
choco install azd
```

#### Chaguo 4: Ufungaji wa Mikono
1. Pakua toleo jipya kutoka [GitHub](https://github.com/Azure/azure-dev/releases)
2. Finyaza kwenye `C:\Program Files\azd\`
3. Ongeza kwenye njia ya mazingira (PATH)

### macOS

#### Chaguo 1: Homebrew (Inayopendekezwa)
```bash
brew tap azure/azd
brew install azd
```

#### Chaguo 2: Skripti ya Kufunga
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Chaguo 3: Ufungaji wa Mikono
```bash
# Pakua na sakinisha
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Chaguo 1: Skripti ya Kufunga (Inayopendekezwa)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Chaguo 2: Wasimamizi wa Pakiti

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

## ✅ Hakiki Ufungaji

Baada ya ufungaji, hakikisha azd inafanya kazi vizuri:

```bash
# Angalia toleo
azd version

# Tazama msaada
azd --help

# Orodhesha violezo vinavyopatikana
azd template list
```

Matokeo yanayotarajiwa:
```
azd version 1.x.x (commit xxxxxx)
```

**Kumbuka**: Nambari ya toleo inaweza kutofautiana. Angalia [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) kwa toleo la hivi karibuni.

**✅ Orodha ya Ukaguzi wa Mafanikio ya Ufungaji:**
- [ ] `azd version` inaonyesha nambari ya toleo bila makosa
- [ ] `azd --help` inaonyesha nyaraka za amri
- [ ] `azd template list` inaonyesha templeti zinazopatikana
- [ ] `az account show` inaonyesha usajili wako wa Azure
- [ ] Unaweza kuunda saraka ya majaribio na kuendesha `azd init` kwa mafanikio

**Kama ukaguzi wote unafaulu, uko tayari kuendelea kwa [Your First Project](first-project.md)!**

## Usanidi wa Uthibitishaji

### Uthibitishaji wa Azure CLI (Inayopendekezwa)
```bash
# Sakinisha Azure CLI ikiwa haijawekwa tayari
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Ingia kwenye Azure
az login

# Hakiki uthibitishaji
az account show
```

### Uthibitishaji kwa Kodi ya Kifaa
Ikiwa uko kwenye mfumo usio na kichwa au una matatizo ya kivinjari:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Kwa mazingira ya otomatiki:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Usanidi

### Usanidi wa Ulimwengu
```bash
# Weka usajili wa chaguo-msingi
azd config set defaults.subscription <subscription-id>

# Weka eneo la chaguo-msingi
azd config set defaults.location eastus2

# Tazama usanidi wote
azd config list
```

### Vigezo vya Mazingira
Ongeza kwenye faili la wasifu la shell yako (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Usanidi wa Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Usanidi wa azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Washa kurekodi kwa ajili ya utatuzi
```

## Ujumuishaji wa IDE

### Visual Studio Code
Sakinisha ugani wa Azure Developer CLI:
1. Fungua VS Code
2. Nenda kwenye Extensions (Ctrl+Shift+X)
3. Tafuta "Azure Developer CLI"
4. Sakinisha ugani

Vipengele:
- IntelliSense kwa azure.yaml
- Amri za terminal zilizounganishwa
- Uvinjari templeti
- Ufuatiliaji wa uenezaji

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
1. Sakinisha kirahisi cha Azure
2. Sanidi nyaraka za Azure
3. Tumia terminal iliyojumuishwa kwa amri za azd

## 🐛 Kutafuta na Kusuluhisha Tatizo la Ufungaji

### Masuala ya Kawaida

#### Ruhusa Imepuuzwa (Windows)
```powershell
# Endesha PowerShell kama Msimamizi
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Masuala ya PATH
Ongeza azd kwenye PATH yako kwa mkono:

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

# Ruka uhakiki wa SSL (haipendekezwi kwa uzalishaji)
azd config set http.insecure true
```

#### Migogoro ya Matoleo
```bash
# Ondoa usakinishaji wa zamani
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Safisha usanidi
rm -rf ~/.azd
```

### Kupata Msaada Zaidi
```bash
# Washa uandishi wa kumbukumbu za utatuzi
export AZD_DEBUG=true
azd <command> --debug

# Tazama usanidi wa sasa
azd config list

# Tazama hali ya utekelezaji wa sasa
azd show
```

## Kusasisha azd

### Sasisho Otomatik
azd itakuarifu wakati sasisho zinapopatikana:
```bash
azd version --check-for-updates
```

### Sasisho La Mikono

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

**Azure CLI (az)**: Zana ya ngazi ya chini ya kusimamia rasilimali za Azure binafsi
- `az webapp create`, `az storage account create`
- Rasilimali moja kwa wakati
- Inalenga usimamizi wa miundombinu

**Azure Developer CLI (azd)**: Zana ya ngazi ya juu kwa utekelezaji kamili wa programu
- `azd up` inapanua programu yote pamoja na rasilimali zote
- Mfululizo wa kazi kwa kutumia templeti
- Inalenga ufanisi wa msanidi programu

**Unahitaji zote mbili**: azd hutumia az CLI kwa uthibitishaji
</details>

<details>
<summary><strong>Je, ninaweza kutumia azd na rasilimali za Azure zilizopo?</strong></summary>

Ndiyo! Unaweza:
1. Kuagiza rasilimali zilizopo ndani ya mazingira ya azd
2. Kurejea rasilimali zilizopo katika templeti zako za Bicep
3. Kutumia azd kwa upangaji mpya sambamba na miundombinu iliyopo

Tazama [Configuration Guide](configuration.md) kwa maelezo.
</details>

<details>
<summary><strong>Je, azd inafanya kazi na Azure Government au Azure China?</strong></summary>

Ndiyo, sanidi cloud:
```bash
# Azure Serikali
az cloud set --name AzureUSGovernment
az login

# Azure Uchina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Je, ninaweza kutumia azd katika pipeline za CI/CD?</strong></summary>

Bila shaka! azd imetengenezwa kwa ajili ya utoaji wa otomatiki:
- Ujumuishaji na GitHub Actions
- Msaada wa Azure DevOps
- Uthibitishaji wa service principal
- Mode isiyohitaji mwingiliano

Tazama [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) kwa mifano ya CI/CD.
</details>

<details>
<summary><strong>Je, matumizi ya azd gharama kiasi gani?</strong></summary>

azd yenyewe ni **bure kabisa** na chanzo wazi. Unalipa tu kwa:
- Rasilimali za Azure unazozitumia
- Gharama za matumizi ya Azure (compute, storage, n.k.)

Tumia `azd provision --preview` kukokotoa gharama kabla ya upangaji.
</details>

## Hatua Zifuatazo

1. **Kamilisha uthibitishaji**: Hakikisha unaweza kufikia usajili wako wa Azure
2. **Jaribu upangaji wako wa kwanza**: Fuata [First Project Guide](first-project.md)
3. **Chunguza templeti**: Vinjari templeti zinazopatikana kwa `azd template list`
4. **Sanidi IDE yako**: Weka mazingira yako ya maendeleo

## Msaada

Ikiwa unakutana na matatizo:
- [Nyaraka Rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Ripoti Masuala](https://github.com/Azure/azure-dev/issues)
- [Majadiliano ya Jamii](https://github.com/Azure/azure-dev/discussions)
- [Msaada wa Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Pata mwongozo wa amri za Azure moja kwa moja katika mhariri wako kwa `npx skills add microsoft/github-copilot-for-azure`

---

**Utangamano wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD For Beginners](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 1 - Msingi & Mwanzo wa Haraka
- **⬅️ Iliyotangulia**: [AZD Basics](azd-basics.md) 
- **➡️ Ifuatayo**: [Your First Project](first-project.md)
- **🚀 Sura Ifuatayo**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Ufungaji Umekamilika!** Endelea kwa [Your First Project](first-project.md) ili kuanza kujenga kwa kutumia azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Hati hii imetatifiwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Wakati tunajitahidi kuwa sahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya asili inapaswa kuzingatiwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inashauriwa kupata tafsiri ya kitaalamu ya binadamu. Hatuwajibiki kwa kutokuelewana au tafsiri potofu zitokanazo na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->