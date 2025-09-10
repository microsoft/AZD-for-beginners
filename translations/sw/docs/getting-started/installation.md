<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e9fcb9121c8d0b570798d778f8904a22",
  "translation_date": "2025-09-10T06:02:26+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "sw"
}
-->
# Mwongozo wa Usakinishaji na Usanidi

## Utangulizi

Mwongozo huu wa kina utakusaidia kusakinisha na kusanidi Azure Developer CLI (azd) kwenye mfumo wako. Utajifunza mbinu mbalimbali za usakinishaji kwa mifumo tofauti ya uendeshaji, usanidi wa uthibitishaji, na usanidi wa awali ili kuandaa mazingira yako ya maendeleo kwa ajili ya kupeleka miradi kwenye Azure.

## Malengo ya Kujifunza

Mwisho wa somo hili, utaweza:
- Kusakinisha Azure Developer CLI kwenye mfumo wako wa uendeshaji
- Kuseti uthibitishaji na Azure kwa kutumia mbinu mbalimbali
- Kuandaa mazingira yako ya maendeleo na mahitaji muhimu
- Kuelewa chaguo tofauti za usakinishaji na wakati wa kutumia kila moja
- Kutatua matatizo ya kawaida ya usakinishaji na usanidi

## Matokeo ya Kujifunza

Baada ya kukamilisha somo hili, utaweza:
- Kusakinisha azd kwa kutumia mbinu inayofaa kwa jukwaa lako
- Kuthibitisha na Azure kwa kutumia `azd auth login`
- Kuhakikisha usakinishaji wako na kujaribu amri za msingi za azd
- Kuseti mazingira yako ya maendeleo kwa matumizi bora ya azd
- Kutatua matatizo ya kawaida ya usakinishaji kwa kujitegemea

Mwongozo huu utakusaidia kusakinisha na kusanidi Azure Developer CLI kwenye mfumo wako, bila kujali mfumo wa uendeshaji au mazingira yako ya maendeleo.

## Mahitaji ya Awali

Kabla ya kusakinisha azd, hakikisha una:
- **Akaunti ya Azure** - [Fungua akaunti ya bure](https://azure.microsoft.com/free/)
- **Azure CLI** - Kwa uthibitishaji na usimamizi wa rasilimali
- **Git** - Kwa kunakili templeti na udhibiti wa matoleo
- **Docker** (hiari) - Kwa programu zilizo kwenye kontena

## Mbinu za Usakinishaji

### Windows

#### Chaguo 1: PowerShell (Inapendekezwa)
```powershell
# Run as Administrator or with elevated privileges
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
2. Toa faili kwenye `C:\Program Files\azd\`
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
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Chaguo 1: Script ya Usakinishaji (Inapendekezwa)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Chaguo 2: Meneja wa Paketi

**Ubuntu/Debian:**
```bash
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd imewekwa tayari kwenye GitHub Codespaces. Fungua tu codespace na anza kutumia azd mara moja.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Thibitisha Usakinishaji

Baada ya kusakinisha, hakikisha azd inafanya kazi vizuri:

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
azd version 1.5.0 (commit abc123)
```

## 🔐 Usanidi wa Uthibitishaji

### Uthibitishaji wa Azure CLI (Inapendekezwa)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### Uthibitishaji wa Device Code
Ikiwa uko kwenye mfumo usio na skrini au unakumbana na matatizo ya kivinjari:
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

## 🛠️ Usanidi

### Usanidi wa Kawaida
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Vigezo vya Mazingira
Ongeza kwenye profaili ya shell yako (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## 🔧 Ujumuishaji na IDE

### Visual Studio Code
Sakinisha kiendelezi cha Azure Developer CLI:
1. Fungua VS Code
2. Nenda kwenye Extensions (Ctrl+Shift+X)
3. Tafuta "Azure Developer CLI"
4. Sakinisha kiendelezi

Vipengele:
- IntelliSense kwa azure.yaml
- Amri za terminal zilizojumuishwa
- Kutazama templeti
- Ufuatiliaji wa upelekaji

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
1. Sakinisha kiendelezi cha Azure
2. Sanidi hati za Azure
3. Tumia terminal iliyojumuishwa kwa amri za azd

## 🐛 Kutatua Matatizo ya Usakinishaji

### Matatizo ya Kawaida

#### Ruhusa Imekataliwa (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Masuala ya PATH
Ongeza azd kwenye PATH kwa mkono:

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
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Migogoro ya Toleo
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Kupata Msaada Zaidi
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Kusasisha azd

### Sasisho za Kiotomatiki
azd itakujulisha wakati sasisho linapatikana:
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

## Hatua Zifuatazo

1. **Kamilisha uthibitishaji**: Hakikisha unaweza kufikia usajili wako wa Azure
2. **Jaribu upelekaji wako wa kwanza**: Fuata [Mwongozo wa Mradi wa Kwanza](first-project.md)
3. **Chunguza templeti**: Tazama templeti zinazopatikana kwa `azd template list`
4. **Sanidi IDE yako**: Andaa mazingira yako ya maendeleo

## Msaada

Ikiwa unakumbana na matatizo:
- [Nyaraka Rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Ripoti Matatizo](https://github.com/Azure/azure-dev/issues)
- [Majadiliano ya Jamii](https://github.com/Azure/azure-dev/discussions)
- [Msaada wa Azure](https://azure.microsoft.com/support/)

---

**Urambazaji**
- **Somo la Awali**: [Misingi ya AZD](azd-basics.md)
- **Somo Linalofuata**: [Usanidi](configuration.md)

**Usakinishaji Umekamilika!** Endelea na [Mradi Wako wa Kwanza](first-project.md) ili kuanza kujenga kwa azd.

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya kutafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.