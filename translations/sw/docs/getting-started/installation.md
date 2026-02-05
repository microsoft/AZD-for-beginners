# Mwongozo wa Usakinishaji na Usanidi

**Ukurasa wa Sehemu:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Kompyuta](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 1 - Msingi na Kuanza Haraka
- **⬅️ Iliyopita**: [Misingi ya AZD](azd-basics.md)
- **➡️ Inayofuata**: [Mradi Wako wa Kwanza](first-project.md)
- **🚀 Sura Inayofuata**: [Sura ya 2: Maendeleo ya AI-Kwanza](../microsoft-foundry/microsoft-foundry-integration.md)

## Utangulizi

Mwongozo huu wa kina utakusaidia kusakinisha na kusanidi Azure Developer CLI (azd) kwenye mfumo wako. Utajifunza mbinu mbalimbali za usakinishaji kwa mifumo tofauti ya uendeshaji, usanidi wa uthibitishaji, na usanidi wa awali ili kuandaa mazingira yako ya maendeleo kwa ajili ya usambazaji wa Azure.

## Malengo ya Kujifunza

Mwisho wa somo hili, utaweza:
- Kusakinisha Azure Developer CLI kwenye mfumo wako wa uendeshaji
- Kuseti uthibitishaji na Azure kwa kutumia mbinu mbalimbali
- Kuandaa mazingira yako ya maendeleo na mahitaji muhimu
- Kuelewa chaguo tofauti za usakinishaji na wakati wa kutumia kila moja
- Kutatua masuala ya kawaida ya usakinishaji na usanidi

## Matokeo ya Kujifunza

Baada ya kukamilisha somo hili, utaweza:
- Kusakinisha azd kwa kutumia mbinu sahihi kwa jukwaa lako
- Kuthibitisha na Azure kwa kutumia `azd auth login`
- Kuhakikisha usakinishaji wako na kujaribu amri za msingi za azd
- Kuseti mazingira yako ya maendeleo kwa matumizi bora ya azd
- Kutatua matatizo ya kawaida ya usakinishaji kwa kujitegemea

Mwongozo huu utakusaidia kusakinisha na kusanidi Azure Developer CLI kwenye mfumo wako, bila kujali mfumo wa uendeshaji au mazingira ya maendeleo.

## Mahitaji ya Awali

Kabla ya kusakinisha azd, hakikisha una:
- **Usajili wa Azure** - [Fungua akaunti ya bure](https://azure.microsoft.com/free/)
- **Azure CLI** - Kwa uthibitishaji na usimamizi wa rasilimali
- **Git** - Kwa kunakili templeti na udhibiti wa toleo
- **Docker** (hiari) - Kwa programu zilizo kwenye kontena

## Mbinu za Usakinishaji

### Windows

#### Chaguo 1: PowerShell (Inapendekezwa)
```powershell
# Endesha kama Msimamizi au kwa ruhusa za juu
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

#### Chaguo 4: Usakinishaji wa Mwongozo
1. Pakua toleo la hivi karibuni kutoka [GitHub](https://github.com/Azure/azure-dev/releases)
2. Toa kwenye `C:\Program Files\azd\`
3. Ongeza kwenye PATH ya mazingira

### macOS

#### Chaguo 1: Homebrew (Inapendekezwa)
```bash
brew tap azure/azd
brew install azd
```

#### Chaguo 2: Script ya Usakinishaji
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Chaguo 3: Usakinishaji wa Mwongozo
```bash
# Pakua na weka
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Chaguo 1: Script ya Usakinishaji (Inapendekezwa)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Chaguo 2: Wasimamizi wa Pakiti

**Ubuntu/Debian:**
```bash
# Ongeza hifadhi ya kifurushi cha Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Sakinisha azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Ongeza hifadhi ya kifurushi cha Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd imewekwa tayari kwenye GitHub Codespaces. Unda tu codespace na anza kutumia azd mara moja.

### Docker

```bash
# Endesha azd kwenye kontena
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Unda alias kwa matumizi rahisi
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Hakikisha Usakinishaji

Baada ya usakinishaji, hakikisha azd inafanya kazi vizuri:

```bash
# Angalia toleo
azd version

# Tazama msaada
azd --help

# Orodhesha templeti zinazopatikana
azd template list
```

Matokeo yanayotarajiwa:
```
azd version 1.5.0 (commit abc123)
```

**✅ Orodha ya Mafanikio ya Usakinishaji:**
- [ ] `azd version` inaonyesha namba ya toleo bila makosa
- [ ] `azd --help` inaonyesha nyaraka za amri
- [ ] `azd template list` inaonyesha templeti zinazopatikana
- [ ] `az account show` inaonyesha usajili wako wa Azure
- [ ] Unaweza kuunda saraka ya majaribio na kuendesha `azd init` kwa mafanikio

**Ikiwa ukaguzi wote umepita, uko tayari kuendelea na [Mradi Wako wa Kwanza](first-project.md)!**

## Usanidi wa Uthibitishaji

### Uthibitishaji wa Azure CLI (Inapendekezwa)
```bash
# Sakinisha Azure CLI ikiwa bado haijasakinishwa
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Ingia kwenye Azure
az login

# Thibitisha uthibitisho
az account show
```

### Uthibitishaji wa Nambari ya Kifaa
Ikiwa uko kwenye mfumo usio na kichwa au unakumbana na matatizo ya kivinjari:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Kwa mazingira ya kiotomatiki:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Usanidi

### Usanidi wa Ulimwenguni
```bash
# Weka usajili wa chaguo-msingi
azd config set defaults.subscription <subscription-id>

# Weka eneo la chaguo-msingi
azd config set defaults.location eastus2

# Tazama usanidi wote
azd config list
```

### Vigezo vya Mazingira
Ongeza kwenye wasifu wa shell yako (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Usanidi wa Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Usanidi wa azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Washa kumbukumbu za ufuatiliaji
```

## Muunganisho wa IDE

### Visual Studio Code
Sakinisha kiendelezi cha Azure Developer CLI:
1. Fungua VS Code
2. Nenda kwenye Viendelezi (Ctrl+Shift+X)
3. Tafuta "Azure Developer CLI"
4. Sakinisha kiendelezi

Vipengele:
- IntelliSense kwa azure.yaml
- Amri za terminal zilizounganishwa
- Kuangalia templeti
- Ufuatiliaji wa usambazaji

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
2. Sanidi hati za Azure
3. Tumia terminal iliyounganishwa kwa amri za azd

## 🐛 Kutatua Matatizo ya Usakinishaji

### Masuala ya Kawaida

#### Ruhusa Imekataliwa (Windows)
```powershell
# Endesha PowerShell kama Msimamizi
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
# Sanidi wakala
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Ruka uthibitishaji wa SSL (haipendekezwi kwa uzalishaji)
azd config set http.insecure true
```

#### Migongano ya Toleo
```bash
# Ondoa usakinishaji wa zamani
# Windows: winget ondoa Microsoft.Azd
# macOS: brew ondoa azd
# Linux: sudo apt ondoa azd

# Safisha usanidi
rm -rf ~/.azd
```

### Kupata Msaada Zaidi
```bash
# Washa kumbukumbu za urekebishaji
export AZD_DEBUG=true
azd <command> --debug

# Tazama kumbukumbu za kina
azd logs

# Angalia taarifa za mfumo
azd info
```

## Kusasisha azd

### Sasisho za Kiotomatiki
azd itakujulisha wakati sasisho zinapatikana:
```bash
azd version --check-for-updates
```

### Sasisho za Mwongozo

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
<summary><strong>Tofauti ni ipi kati ya azd na az CLI?</strong></summary>

**Azure CLI (az)**: Zana ya kiwango cha chini kwa usimamizi wa rasilimali za Azure moja moja
- `az webapp create`, `az storage account create`
- Rasilimali moja kwa wakati
- Kuzingatia usimamizi wa miundombinu

**Azure Developer CLI (azd)**: Zana ya kiwango cha juu kwa usambazaji wa programu kamili
- `azd up` inasambaza programu nzima na rasilimali zote
- Mifumo inayotegemea templeti
- Kuzingatia tija ya msanidi programu

**Unahitaji zote mbili**: azd hutumia az CLI kwa uthibitishaji
</details>

<details>
<summary><strong>Je, ninaweza kutumia azd na rasilimali zilizopo za Azure?</strong></summary>

Ndiyo! Unaweza:
1. Kuingiza rasilimali zilizopo kwenye mazingira ya azd
2. Kutaja rasilimali zilizopo kwenye templeti zako za Bicep
3. Kutumia azd kwa usambazaji mpya sambamba na miundombinu iliyopo

Tazama [Mwongozo wa Usanidi](configuration.md) kwa maelezo zaidi.
</details>

<details>
<summary><strong>Je, azd inafanya kazi na Azure Government au Azure China?</strong></summary>

Ndiyo, sanidi wingu:
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
<summary><strong>Je, ninaweza kutumia azd kwenye mabomba ya CI/CD?</strong></summary>

Bila shaka! azd imeundwa kwa ajili ya kiotomatiki:
- Muunganisho wa GitHub Actions
- Msaada wa Azure DevOps
- Uthibitishaji wa service principal
- Hali isiyo ya mwingiliano

Tazama [Mwongozo wa Usambazaji](../deployment/deployment-guide.md) kwa mifumo ya CI/CD.
</details>

<details>
<summary><strong>Gharama ya kutumia azd ni ipi?</strong></summary>

azd yenyewe ni **bure kabisa** na chanzo huria. Unalipia tu:
- Rasilimali za Azure unazosambaza
- Gharama za matumizi ya Azure (kompyuta, uhifadhi, nk.)

Tumia `azd provision --preview` kukadiria gharama kabla ya usambazaji.
</details>

## Hatua Zingine

1. **Kamilisha uthibitishaji**: Hakikisha unaweza kufikia usajili wako wa Azure
2. **Jaribu usambazaji wako wa kwanza**: Fuata [Mwongozo wa Mradi wa Kwanza](first-project.md)
3. **Chunguza templeti**: Angalia templeti zinazopatikana kwa kutumia `azd template list`
4. **Sanidi IDE yako**: Andaa mazingira yako ya maendeleo

## Msaada

Ikiwa unakumbana na matatizo:
- [Nyaraka Rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Ripoti Masuala](https://github.com/Azure/azure-dev/issues)
- [Majadiliano ya Jamii](https://github.com/Azure/azure-dev/discussions)
- [Msaada wa Azure](https://azure.microsoft.com/support/)

---

**Ukurasa wa Sehemu:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Kompyuta](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 1 - Msingi na Kuanza Haraka
- **⬅️ Iliyopita**: [Misingi ya AZD](azd-basics.md) 
- **➡️ Inayofuata**: [Mradi Wako wa Kwanza](first-project.md)
- **🚀 Sura Inayofuata**: [Sura ya 2: Maendeleo ya AI-Kwanza](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Usakinishaji Umekamilika!** Endelea na [Mradi Wako wa Kwanza](first-project.md) kuanza kujenga na azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->