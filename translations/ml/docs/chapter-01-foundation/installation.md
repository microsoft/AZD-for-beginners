# ഇൻസ്റ്റലേഷൻ & സജ്ജീകരണ ഗൈഡ്

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD ആരംഭക്കാർക്ക്](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 1 - അടിസ്ഥാനവും ക്വിക്ക് സ്റ്റാർട്ട്
- **⬅️ Previous**: [AZD അടിസ്ഥാനങ്ങൾ](azd-basics.md)
- **➡️ Next**: [നിങ്ങളുടെ ആദ്യ പ്രോജക്ട്](first-project.md)
- **🚀 Next Chapter**: [അധ്യായം 2: AI-പ്രഥമ വികസനം](../chapter-02-ai-development/microsoft-foundry-integration.md)

## പരിചയം

ഈ സംഗ്രഹ ഗൈഡ് നിങ്ങളുടെ സിസ്റ്റത്തിൽ Azure Developer CLI (azd) ഇൻസ്റ്റാൾ ചെയ്യുകയും ക്രമീകരിക്കുകയും ചെയ്യുന്നതിൽ നിങ്ങളെ വഴികാട്ടി നടത്തും. വിവിധ ഓപ്പറേറ്റിംഗ് സിസ്റ്റങ്ങൾക്ക് പല ഇൻസ്റ്റലേഷൻ രീതികളും, പ്രാമാണീകരണ ക്രമീകരണവും, Azure ഡിപ്ലോയ്‌മെന്റുകൾക്കുള്ള നിങ്ങളുടെ ഡെവലപ്പ്മെന്റ് എൻവയോൺമെന്റ് തയ്യാറാക്കുന്നതിനുള്ള പ്രാഥമിക ക്രമീകരണങ്ങളും നിങ്ങൾക്ക് അറിയാം.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ പാഠത്തിന്റെ અંત്യത്തിൽ നിങ്ങൾ:
- നിങ്ങളുടെ ഓപ്പറേറ്റിംഗ് സിസ്റ്റത്തിൽ Azure Developer CLI വിജയകരമായി ഇൻസ്റ്റാൾ ചെയ്യാൻ সক্ষমമാകും
- ബഹുഭൂരി പ്രമാണങ്ങളിൽ Azure-നുമായി പ്രാമാണീകരണം ക്രമീകരിക്കാനുസഹായം
- ആവശ്യമായ മുൻ‌പ്രാത്യക്ഷങ്ങൾ ഉപയോഗിച്ച് നിങ്ങളുടെ ഡെവലപ്പ്മെന്റ് എൻവയോൺമെന്റ് ക്രമീകരിക്കുക
- വ്യത്യസ്ത ഇൻസ്റ്റലേഷൻ ഓപ്ഷനുകൾ അറിഞ്ഞിരിക്കുക, ഏതൊക്കെ സാഹചര്യങ്ങളിൽ ഏത് ഉപയോഗിക്കണം എന്നതിന് അറിവ് നേടുക
- സാധാരണ ഇൻസ്റ്റലേഷൻ மற்றும் ക്രമീകരണ പ്രശ്നങ്ങൾ മറികടക്കാൻ ശേഷിയുണ്ടാവുക

## പഠന ഫലങ്ങൾ

ഈ പാഠം പൂർത്തിയാക്കിയശേഷം, നിങ്ങൾക്ക് കഴിയും:
- പ്ലാറ്റ്ഫോംസുഗ്രഹമായ വിധിയിൽ azd ഇൻസ്റ്റാൾ ചെയ്യുക
- azd auth login ഉപയോഗിച്ച് Azure-യിൽ പ്രാമാണീകരണം ചെയ്യുക
- ഇൻസ്റ്റലേഷൻ പരിശോധിച്ച് അടിസ്ഥാന azd കമാൻഡുകൾ ടെസ്റ്റ് ചെയ്യുക
- azd ഉപയോഗത്തിന് അനുയോജ്യമായി നിങ്ങളുടെ ഡെവലപ്പ്മെന്റ് എൻവയോൺമെന്റ് ക്രമീകരിക്കുക
- സാധാരണ ഇൻസ്റ്റലേഷൻ പ്രശ്നങ്ങൾ സ്വതന്ത്രമായി പരിഹരിക്കുക

ഈ ഗൈഡ് നിങ്ങളുടെ ഓപ്പറേറ്റിംഗ് സിസ്റ്റോയും ഡെവലപ്പ്മെന്റ് എൻവയോൺമെന്റോയും എന്തായിരിക്കുമെങ്കിലും Azure Developer CLI ഇൻസ്റ്റാൾ ചെയ്ത് ക്രമീകരിക്കാൻ സഹായിക്കും.

## മുൻ ആവശ്യകതകൾ

azd ഇൻസ്റ്റാൾ ചെയ്യുന്നതിനു മുമ്പ്, ദയവായി নিশ্চিতമാക്കുക:
- **Azure subscription** - [ഒരു സൗജന്യ അക്കൗണ്ട് സൃഷ്ടിക്കുക](https://azure.microsoft.com/free/)
- **Azure CLI** - പ്രാമാണീകരണത്തിനും റിസോഴ്‌സ് മാനേജ്മെന്റിനും
- **Git** - ടെംപ്ലേറ്റുകൾ ക്ലോൺ ചെയ്യുന്നതിനും വേർഷൻ നിയന്ത്രണത്തിനും
- **Docker** (ഐച്ഛികം) - കണ്ടെയ്‌നറൈസ്ഡ് ആപ്ലിക്കേഷനുകൾക്കായി

## ഇൻസ്റ്റലേഷൻ രീതികൾ

### Windows

#### ഓപ്ഷൻ 1: PowerShell (ശുപാർശ ചെയ്യപെട്ടത്)
```powershell
# അഡ്മിനിസ്ട്രേറ്ററായി അല്ലെങ്കിൽ ഉയർന്ന അവകാശങ്ങളോടെ പ്രവർത്തിപ്പിക്കുക
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### ഓപ്ഷൻ 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### ഓപ്ഷൻ 3: Chocolatey
```cmd
choco install azd
```

#### ഓപ്ഷൻ 4: മാനുവൽ ഇൻസ്റ്റലേഷൻ
1. ഏറ്റവും പുതിയ റിലീസ് [GitHub](https://github.com/Azure/azure-dev/releases) നിന്ന് ഡൗൺലോഡ് ചെയ്യുക
2. ഇത്തരത്തിൽ എക്‌സ്‌ട്രാക്ട് ചെയ്യുക: `C:\Program Files\azd\`
3. PATH environment variable-ലേക്ക് ചേർക്കുക

### macOS

#### ഓപ്ഷൻ 1: Homebrew (ശുപാർശചെയ്തത്)
```bash
brew tap azure/azd
brew install azd
```

#### ഓപ്ഷൻ 2: ഇൻസ്റ്റാൾ സ്ക്രിപ്റ്റ്
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ഓപ്ഷൻ 3: മാനുവൽ ഇൻസ്റ്റലേഷൻ
```bash
# ഡൗൺലോഡ് ചെയ്ത് ഇൻസ്റ്റാൾ ചെയ്യുക
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### ഓപ്ഷൻ 1: ഇൻസ്റ്റാൾ സ്ക്രിപ്റ്റ് (ശുപാർശചെയ്തത്)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ഓപ്ഷൻ 2: പാക്കേജ് മാനേജറുകൾ

**Ubuntu/Debian:**
```bash
# മൈക്രോസോഫ്റ്റ് പാക്കേജ് റിപ്പോസിറ്ററി ചേർക്കുക
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd ഇൻസ്റ്റാൾ ചെയ്യുക
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft പാക്കേജ് റിപ്പോസിറ്ററി ചേർക്കുക
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd GitHub Codespaces-ൽ മുൻകൂട്ടി ഇൻസ്റ്റാൾ ചെയ്യപ്പെട്ടിരിക്കുന്നു. ഒരു codespace സൃഷ്ടിച്ച് ഉടൻ azd ഉപയോ​ഗിക്കാം.

### Docker

```bash
# azd ഒരു കണ്ടെയ്‌നറിൽ ഓടിക്കുക
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# ഉപയോഗം എളുപ്പമാക്കാൻ ഒരു അലിയാസ് സൃഷ്ടിക്കുക
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ഇൻസ്റ്റലേഷൻ xácീകരണം

ഇൻസ്റ്റലേഷൻ കഴിഞ്ഞ്, azd പ്രവർത്തനക്ഷമമാണോ എന്ന് പരിശോധിക്കുക:

```bash
# പതിപ്പ് പരിശോധിക്കുക
azd version

# 도움ം കാണുക
azd --help

# ലഭ്യമായ ടെംപ്ലേറ്റുകൾ പട്ടികപ്പെടുത്തുക
azd template list
```

പ്രതീക്ഷിച്ച ഔട്ട്‌പുട്ട്:
```
azd version 1.x.x (commit xxxxxx)
```

**കുറിപ്പ്**: യഥാർത്ഥ വേർഷൻ നമ്പർ വ്യത്യാസപ്പെട്ടിരിക്കും. ഏറ്റവും പുതിയ വേർഷൻ കാണാൻ [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) പരിശോധിക്കുക.

**✅ ഇൻസ്റ്റലേഷൻ വിജയ ചෙක්ലിസ്റ്റ്:**
- [ ] `azd version` പിശകില്ലാതെ വേർഷൻ നമ്പർ പ്രദർശിപ്പിക്കുന്നു
- [ ] `azd --help` കമാൻഡ് ഡോക്യുമെന്റേഷൻ കാണിക്കുന്നു
- [ ] `azd template list` ലഭ്യമായ ടെംപ്ലേറ്റുകൾ കാണിക്കുന്നു
- [ ] `az account show` നിങ്ങളുടെ Azure subscription പ്രദർശിപ്പിക്കുന്നു
- [ ] നിങ്ങൾ ഒരു ടെസ്റ്റ് ഡയറക്ടറി സൃഷ്ടിച്ച് `azd init` വിജയകരമായി റൺ ചെയ്യുന്നത് കഴിയും

**എല്ലാ പരിശോധനകളും കടന്നുപോയെങ്കിൽ, നിങ്ങൾ [നിങ്ങളുടെ ആദ്യ പ്രോജക്ട്](first-project.md) ലേക്ക് തുടരാൻ തയ്യാറാണ്!**

## പ്രാമാണീകരണ ക്രമീകരണം

### Azure CLI പ്രാമാണീകരണം (ശുപാർശചെയ്തത്)
```bash
# ഇതുവരെ ഇൻസ്റ്റാൾ ചെയ്തിട്ടില്ലെങ്കിൽ Azure CLI ഇൻസ്റ്റാൾ ചെയ്യുക
# വിൻഡോസ്: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# ലിനക്സ്: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure-ൽ ലോഗിൻ ചെയ്യുക
az login

# പ്രാമാണീകരണം സ്ഥിരീകരിക്കുക
az account show
```

### ഡിവൈസ് കോഡ് പ്രാമാണീകരണം
നിങ്ങൾ ഹെഡ്‌ലെസ് സിസ്റ്റത്തിൽ ഇരിക്കുകയാണെങ്കിൽ അല്ലെങ്കിൽ ബ്രൗസർ പ്രശ്നങ്ങൾ ഉണ്ടാകുകയാണെങ്കിൽ:
```bash
az login --use-device-code
```

### സർവീസ് പ്രിൻസിപ്പൽ (CI/CD)
ഓട്ടോമേറ്റഡ് പരിസരങ്ങൾക്ക്:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## ക്രമീകരണം

### ഗ്ലോബൽ ക്രമീകരണം
```bash
# ഡീഫോൾട്ട് സബ്സ്ക്രിപ്ഷൻ സജ്ജമാക്കുക
azd config set defaults.subscription <subscription-id>

# ഡീഫോൾട്ട് സ്ഥലം സജ്ജമാക്കുക
azd config set defaults.location eastus2

# എല്ലാ കോൺഫിഗറേഷനുകളും കാണുക
azd config list
```

### എൻവയോൺമെന്റ് വ്യത്യങ്ങൾ
താങ്കളുടെ ഷെൽ പ്രൊഫൈലിൽ ചേർക്കുക (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure ക്രമീകരണം
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd ക്രമീകരണം
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # ഡീബഗ് ലോഗിംഗ് സജീവമാക്കുക
```

## IDE ഇന്റഗ്രേഷൻ

### Visual Studio Code
Azure Developer CLI എക്സ്റ്റൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക:
1. VS Code തുറക്കുക
2. എക്സ്റ്റൻഷനുകളിലേക്ക് ചെല്ലുക (Ctrl+Shift+X)
3. "Azure Developer CLI" എന്ന് തിരയുക
4. എക്സ്റ്റൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക

ലക്ഷണങ്ങൾ:
- azure.yaml-ക്കുള്ള IntelliSense
- ഇന്റഗ്രേറ്റഡ് ടർമിനൽ കമാൻഡുകൾ
- ടെംപ്ലേറ്റ് ബ്രൗസിംഗ്
- ഡിപ്ലോയ്‌മെന്റ് നിരീക്ഷണം

### GitHub Codespaces
ഒരു `.devcontainer/devcontainer.json` സൃഷ്ടിക്കുക:
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
1. Azure പ്ലഗിൻ ഇൻസ്റ്റാൾ ചെയ്യുക
2. Azure ക്രെഡൻഷ്യലുകൾ ക്രമീകരിക്കുക
3. azd കമാൻഡുകൾക്കായി ഇന്റഗ്രേറ്റഡ് ടർമിനൽ ഉപയോഗിക്കുക

## 🐛 ഇൻസ്റ്റലേഷൻ പ്രശ്‌നപരിഹാരം

### സാധാരണ പ്രശ്നങ്ങൾ

#### അനുമതി നിഷേധിച്ചു (Windows)
```powershell
# PowerShell നെ അഡ്മിനിസ്ട്രേറ്ററായി ഓടിക്കുക
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH പ്രശ്നങ്ങൾ
കൈയോടെ azd നിങ്ങൾയുടെ PATH-ൽ ചേർക്കുക:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### നെറ്റ്‌വർക്/പ്രോക്സി പ്രശ്നങ്ങൾ
```bash
# പ്രോക്സി ക്രമീകരിക്കുക
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL പരിശോധന ഒഴിവാക്കുക (ഉത്പാദനത്തിൽ ശുപാർശ ചെയ്യപ്പെടുന്നില്ല)
azd config set http.insecure true
```

#### വേർഷൻ സംഘർഷങ്ങൾ
```bash
# പഴയ ഇൻസ്റ്റലേഷനുകൾ നീക്കം ചെയ്യുക
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# ക്രമീകരണം ശുദ്ധമാക്കുക
rm -rf ~/.azd
```

### കൂടുതൽ സഹായം നേടുന്നത്
```bash
# ഡീബഗ് ലോഗിംഗ് സജീവമാക്കുക
export AZD_DEBUG=true
azd <command> --debug

# നിലവിലെ ക്രമീകരണം കാണുക
azd config list

# നിലവിലെ വിന്യാസത്തിന്റെ സ്ഥിതി കാണുക
azd show
```

## azd അപ്ഡേറ്റ് ചെയ്യൽ

### സ്വയം അപ്ഡേറ്റുകൾ
പുതുക്കലുകൾ ലഭ്യമായപ്പോൾ azd നിങ്ങളെ അറിയിക്കും:
```bash
azd version --check-for-updates
```

### മാനുവൽ അപ്ഡേറ്റുകൾ

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

## 💡 പലപ്പോഴും ചോദിക്കപ്പെടുന്ന ചോദ്യങ്ങൾ

<details>
<summary><strong>azd ഉം az CLI ഉം തമ്മിലുള്ള വ്യത്യാസം എന്താണ്?</strong></summary>

**Azure CLI (az)**: വ്യക്തിഗത Azure വിഭവങ്ങൾ മാനേജ് ചെയ്യാനുള്ള ലോ-ലവൽ ടൂൾ
- `az webapp create`, `az storage account create`
- ഒരു സമയം ഒരു റിസോഴ്സ് മാത്രം കൈകാര്യം ചെയ്യുന്നു
- ഇൻഫ്രാസ്ട്രക്ചർ മാനേജ്‌മെന്റ് കേന്ദ്രീകരിക്കുന്നു

**Azure Developer CLI (azd)**: പൂര്‍ണ്ണമായ ആപ്ലിക്കേഷൻ ഡിപ്ലോയ്‌മെന്റുകൾക്കുള്ള ഹൈ-ലെവൽ ടൂൾ
- `azd up` എല്ലാ റിസോഴ്‌സുകളും ഉൾപ്പെടുത്തി മുഴുവൻ ആപ്പ് ഡിപ്ലോയുചെയ്യുന്നു
- ടെംപ്ലേറ്റ് അധിഷ്ഠിത വർക്ക്‌ഫ്ലോകൾ
- ഡെവലപ്പർ ഉൽപാദകക്ഷമത കേന്ദ്രീകരിക്കുന്നു

**നിങ്ങൾക്ക് ഇരട്ടും ആവശ്യമുണ്ട്**: azd പ്രാമാണീകരണത്തിനായി az CLI ഉപയോഗിക്കുന്നു
</details>

<details>
<summary><strong>നിലവിലുള്ള Azure വിഭവങ്ങളോടെ azd ഉപയോഗിക്കാമോ?</strong></summary>

ഉണ്ട്! നിങ്ങൾക്ക് കഴിയും:
1. നിലവിലുള്ള വിഭവങ്ങൾ azd എന്വയോൺമെന്റുകളിലേക്ക് ഇറക്കുമതി ചെയ്യുക
2. നിങ്ങളുടെ Bicep ടെംപ്ലേറ്റുകളിൽ നിലവിലുള്ള വിഭവങ്ങൾ റഫറൻസ് ചെയ്യുക
3. നിലവിലുള്ള ഇൻഫ്രാസ്ട്രക്ചർ ഒപ്പം പുതിയ ഡിപ്ലോയ്മെന്റുകൾക്ക് azd ഉപയോഗിക്കുക

വിവരങ്ങൾക്ക് [Configuration Guide](configuration.md) കാണുക.
</details>

<details>
<summary><strong>azd Azure Government അല്ലെങ്കിൽ Azure China-യുമായി പ്രവർത്തിപ്പിക്കാമോ?</strong></summary>

ഉണ്ട്, ക്ലൗഡ് ക്രമീകരിക്കുക:
```bash
# Azure സർക്കാർ
az cloud set --name AzureUSGovernment
az login

# Azure ചൈന
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>azd CI/CD പൈപ്പലൈൻകളിൽ ഉപയോഗിക്കാമോ?</strong></summary>

നിശ്ചയമായും! azd ഓട്ടോമേഷൻക്കായി രൂപകൽപ്പന ചെയ്തിരിക്കുന്നു:
- GitHub Actions ഇന്റഗ്രേഷൻ
- Azure DevOps പിന്തുണ
- സർവീസ് പ്രിൻസിപ്പൽ പ്രാമാണീകരണം
- നോൺ-ഇന്ററാക്ടീവ് മോഡ്

CI/CD മാതൃകകൾക്കായി [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) കാണുക.
</details>

<details>
<summary><strong>azd ഉപയോഗിക്കുന്നതിന്റെ ചെലവ് എത്രയാണ്?</strong></summary>

azd തന്നെ **പൂർണമായും സൗജന്യമാണ്** എന്നതും ഓപ്പൺ-സോഴ്‌സ് ആണെന്നും. നിങ്ങള്‍ക്കു മാത്രം പണം ചെലവാകുന്നത്:
- നിങ്ങൾ ഡിപ്ലോയുചെയ്യുന്ന Azure വിഭവങ്ങൾ
- Azure ഉപയോഗച്ചെലവുകൾ (compute, storage മുതലായവ)

ഡിപ്ലോയ്മെന്റ് നടത്തുന്നതിന് മുൻപ് ചെലവുകൾ കണക്കാക്കാൻ `azd provision --preview` ഉപയോഗിക്കുക.
</details>

## അടുത്ത നടപടികൾ

1. **പ്രാമാണീകരണം പൂർത്തിയാക്കുക**: നിങ്ങളുടെ Azure subscription-ലേക്ക് ആക്‌സസ് ഉറപ്പാക്കുക
2. **നിങ്ങളുടെ ആദ്യ ഡിപ്ലോയ്മെന്റ് ശ്രമിക്കുക**: [First Project Guide](first-project.md) പിന്തുടർന്നു കാണുക
3. **ടെംപ്ലേറ്റുകൾ അന്വേഷിക്കുക**: `azd template list` ഉപയോഗിച്ച് ലഭ്യമായ ടെംപ്ലേറ്റുകൾ ബ്രൗസ് ചെയ്യുക
4. **താങ്കളുടെ IDE ക്രമീകരിക്കുക**: നിങ്ങളുടെ ഡെവലപ്പ്മെന്റ് എൻവയോൺമെന്റ് സജ്ജമാക്കുക

## പിന്തുണ

പ്രശ്നങ്ങൾ വരുകയാണെങ്കിൽ:
- [ഔദ്യോഗിക ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [പ്രശ്നങ്ങൾ റിപ്പോർട്ട് ചെയ്യുക](https://github.com/Azure/azure-dev/issues)
- [community discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD ആരംഭക്കാർക്ക്](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 1 - അടിസ്ഥാനവും ക്വിക്ക് സ്റ്റാർട്ട്
- **⬅️ Previous**: [AZD അടിസ്ഥാനങ്ങൾ](azd-basics.md) 
- **➡️ Next**: [നിങ്ങളുടെ ആദ്യ പ്രോജക്ട്](first-project.md)
- **🚀 Next Chapter**: [അധ്യായം 2: AI-പ്രഥമ വികസനം](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ഇൻസ്റ്റലേഷൻ പൂർത്തിയായി!** azd ഉപയോഗിച്ച് നിർമ്മണം തുടങ്ങാൻ [നിങ്ങളുടെ ആദ്യ പ്രോജക്ട്](first-project.md) ലേക്ക് തുടരുക.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
അസ്വീകരണ കുറിപ്പ്:
ഈ ദസ്താവേജ് AI പരിഭാഷാ സേവനമായ [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷിക്കപ്പെട്ടതാണ്. നാം കൃത്യതയ്ക്കായി ശ്രമിച്ചിരുന്നാലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിശകുകൾ അല്ലെങ്കിൽ കൃത്യതയുടെ അഭാവം ഉണ്ടാകാവുന്നതാണെന്ന് ദയവായി ശ്രദ്ധിക്കുക. ദസ്താവേജിന്റെ യഥാർത്ഥ മാതൃഭാഷയിലുള്ള പതിപ്പായതു തന്നെ പ്രാമാണിക ഉറവിടമായി കരുതണം. നിർണായകമായ വിവരങ്ങൾക്ക് പ്രൊഫഷണൽ മാനവ പരിഭാഷ ശുപാർശ ചെയ്യപ്പെടുന്ന ആദ്യാധ്യാപമാണ്. ഈ പരിഭാഷയുടെ ഉപയോഗത്താല്‍ ഉദ्भവിക്കുന്ന ഏതെങ്കിലും തെറ്റിദ്ധാരണങ്ങളോ വ്യാഖ്യാനഭ്രമങ്ങളോയ്ക്ക്我们 ഉത്തരവാദിത്വം ഉണ്ടായിരിക്കില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->