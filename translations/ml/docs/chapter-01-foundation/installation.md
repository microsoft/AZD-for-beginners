# ഇൻസ്റ്റലേഷൻ & സെറ്റ്‌അപ്പ് ഗൈഡ്

**അദ്ധ്യായം നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലുള്ള അദ്ധ്യായം**: അദ്ധ്യായം 1 - അടിസ്ഥാനവും ക്വിക്ക് സ്റ്റാർട്ടും
- **⬅️ മുമ്പത്തെ**: [AZD Basics](azd-basics.md)
- **➡️ അടുത്തത്**: [Your First Project](first-project.md)
- **🚀 അടുത്ത അദ്ധ്യായം**: [അദ്ധ്യായം 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## പരിചയം

ഈ സമഗ്ര ഗൈഡ് നിങ്ങളുടെ സിസ്റ്റത്തിൽ Azure Developer CLI (azd) ഇൻസ്റ്റാൾ ചെയ്യാനും കോൺഫിഗർ ചെയ്യാനും നിങ്ങളെ സഹായിക്കും. വ്യത്യസ്ത ഓപ്പറേറ്റിംഗ് സിസ്റ്റങ്ങൾക്കായി നിരവധി ഇൻസ്റ്റലേഷൻ മാർഗങ്ങൾ, പ്രാമാണീകരണ സെറ്റപ്പ്, തുടങ്ങിയവ നിങ്ങൾക്ക് പഠിക്കാം, കൂടാതെ Azure ഡിപ്പ്ലോയ്മെന്റുകൾക്കായി നിങ്ങളുടെ ഡെവലപ്പ്മെന്റ് പരിസ്ഥിതി ഒരുക്കാൻ തുടക്കവുമായി കോൺഫിഗറേഷൻ ലഭിക്കും.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ പാഠം പൂർത്തിയാക്കിയ ശേഷം, നിങ്ങൾക്ക്:
- നിങ്ങളുടെ ഓപ്പറേറ്റിംഗ് സിസ്റ്റത്തിൽ വിജയകരമായി Azure Developer CLI ഇൻസ്റ്റാൾ ചെയ്യാൻ കഴിയും
- വ്യത്യസ്ത മാർഗങ്ങൾ ഉപയോഗിച്ച് Azure പ്രാമാണീകരണം കോൺഫിഗർ ചെയ്യാൻ കഴിയും
- ആവശ്യമായ മുൻപുണർവുകൾ ഉൾകൊണ്ടു ഡെവലപ്പ്മെന്റ് പരിസ്ഥിതി സജ്ജമാക്കാം
- വിവിധ ഇൻസ്റ്റലേഷൻ ഓപ്ഷനുകൾ മനസിലാക്കി ഏത് സാഹചര്യത്തിൽ ഏത് ഉപയോഗിക്കുമെന്ന് അറിയാം
- സാധാരണ ഇൻസ്റ്റലേഷൻ, സെറ്റ് അപ് പ്രശ്നങ്ങൾ പരിഹരിക്കാൻ കഴിയും

## പഠന ഫലം

ഈ പാഠം പൂർത്തിയാക്കിയ ശേഷം, നിങ്ങൾക്ക്:
- നിങ്ങളുടെ പ്ലാറ്റ്‌ഫോമിനായി അനുയോജ്യമായ രീതി ഉപയോഗിച്ച് azd ഇൻസ്റ്റാൾ ചെയ്യാൻ കഴിയും
- azd auth login ഉപയോഗിച്ച് Azure പ്രാമാണീകരണം നടത്താൻ കഴിയും
- ഇൻസ്റ്റലേഷൻ ശരിയാണെന്ന് പരിശോധന നടത്തി അടിസ്ഥാന azd കമാൻഡുകൾ ശ്രമിക്കാം
- azd ഉപയോഗത്തിന് അനുയോജ്യമായി ഡെവലപ്പ്മെന്റ് പരിസ്ഥിതി കോൺഫിഗർ ചെയ്യാം
- സാധാരണ ഇൻസ്റ്റലേഷൻ പ്രശ്നങ്ങൾ സ്വതന്ത്രമായി പരിഹരിക്കാൻ കഴിയും

താഴെ ചൊല്ലിയതുപോലെ നിങ്ങളുടെ സിസ്റ്റത്തിൽ Azure Developer CLI ഇൻസ്റ്റാൾ ചെയ്യാനും കോൺഫിഗർ ചെയ്യാനും ഈ ഗൈഡ് സഹായിക്കും, നിങ്ങളുടെ ഓപ്പറേറ്റിംഗ് സിസ്റ്റം അല്ലെങ്കിൽ ഡെവലപ്പ്മെന്റ് എൻവയോൺമെന്റ് എന്തായാലും.

## മുൻപരിചയം

azd ഇൻസ്റ്റാൾ ചെയ്യുന്നതിന് മുമ്പ്, ഉറപ്പാക്കുക നിങ്ങൾക്കുണ്ട്:
- **Azure സബ്‌സ്‌ക്രിപ്ഷൻ** - [ഒരു സൗജന്യ അക്കൗണ്ട് സൃഷ്ടിക്കുക](https://azure.microsoft.com/free/)
- **Azure CLI** - പ്രാമാണീകരണത്തിനും റിസോഴ്‌സ് മാനേജ്മെന്റിനും
- **Git** - ടെംപ്ലേറ്റുകൾ ക്ലോൺ ചെയ്യാനും വേർഷൻ കൺട്രോൾ ചെയ്യാനും
- **Docker** (ഐച്ഛികം) - കണ്ടെയ്‌നറൈസ്ഡ് ആപ്ലിക്കേഷനുകൾക്കായി

## ഇൻസ്റ്റലേഷൻ മാർഗങ്ങൾ

### Windows

#### ഓപ്ഷൻ 1: PowerShell (ശിപാർശചെയ്യപ്പെടുന്നു)
```powershell
# അഡ്മിനിസ്ട്രേറ്ററായി അല്ലെങ്കിൽ ഉയർന്ന അവകാശങ്ങളോടെ പ്രവർത്തിക്കുക
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### ഓപ്ഷൻ 2: Windows പാക്കേജ് മാനേജർ (winget)
```cmd
winget install Microsoft.Azd
```

#### ഓപ്ഷൻ 3: Chocolatey
```cmd
choco install azd
```

#### ഓപ്ഷൻ 4: മാനുവൽ ഇൻസ്റ്റലേഷൻ
1. പുതിയ റിലീസിൻ [GitHub](https://github.com/Azure/azure-dev/releases)ൽ നിന്നും ഡൗൺലോഡ് ചെയ്യുക
2. `C:\Program Files\azd\` എന്ന സ്ഥലത്ത് എക്‌സ്ട്രാക്റ്റ് ചെയ്യുക
3. PATH എൻവയോൺമെന്റ് വേരിയബിളിൽ ചേർക്കുക

### macOS

#### ഓപ്ഷൻ 1: Homebrew (ശിപാർശചെയ്യപ്പെടുന്നു)
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
# ഡൗൺലോഡ് ചെയ്യുക ಮತ್ತು ഇൻസ്റ്റാൾ ചെയ്യുക
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### ഓപ്ഷൻ 1: ഇൻസ്റ്റാൾ സ്ക്രിപ്റ്റ് (ശിപാർശചെയ്യപ്പെടുന്നു)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ഓപ്ഷൻ 2: പാക്കേജ് മാനേജർമാർ

**Ubuntu/Debian:**
```bash
# Microsoft പാക്കേജ് റിപോസിറ്ററി ചേർക്കുക
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd ഇൻസ്റ്റാൾ ചെയ്യുക
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft പാക്കേജ് റപ്പോസിറ്ററി ചേർക്കുക
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd GitHub Codespaces-ൽ പ്രീ-ഇൻസ്റ്റാൾ ചെയ്താണ് വരുന്നത്. ഒരു കോഡ്സ്പേസ് സൃഷ്ടിച്ച് ഉടൻ തന്നെ azd ഉപയോഗിച്ച് തുടങ്ങാം.

### Docker

```bash
# ഒരു കണ്ടെയിനറിൽ azd പ്രവർത്തിപ്പിക്കുക
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# എളുപ്പത്തിൽ ഉപയോഗിക്കാൻ ഒരു അല്യാസ് സൃഷ്ടിക്കുക
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ഇൻസ്റ്റലേഷൻ സ്ഥിരീകരിക്കുക

ഇൻസ്റ്റലേഷൻ കഴിഞ്ഞ്, azd ശരിയാണെന്ന് പരിശോധിക്കുക:

```bash
# വേർഷൻ പരിശോധിക്കുക
azd version

# സഹായം കാണുക
azd --help

# ലഭ്യമായ ടെംപ്ലേറ്റുകൾ ലിസ്റ്റ് ചെയ്യുക
azd template list
```

കാത്തു കിട്ടേണ്ട ഔട്ട്പുട്ട്:
```
azd version 1.x.x (commit xxxxxx)
```

**കുറിപ്പ്**: യഥാർത്ഥ വേർഷൻ നമ്പർ വ്യത്യസ്തമായിരിക്കും. ഏറ്റവും പുതിയ വേർഷൻ അറിയാൻ [Azure Developer CLI റിലീസുകൾ](https://github.com/Azure/azure-dev/releases) പരിശോധിക്കുക.

**✅ ഇൻസ്റ്റലേഷൻ വിജയത്തിന്റെ ചെക്ക്ലിസ്റ്റ്:**
- [ ] `azd version` വേർഷൻ നമ്പർ യാഥാർത്ഥ്യമല്ലാതെ കാണിക്കുന്നു
- [ ] `azd --help` കമാൻഡ് ഡോക്യുമെന്റേഷൻ കാണിക്കുന്നു
- [ ] `azd template list` ലഭ്യമായ ടെംപ്ലേറ്റുകൾ കാണിക്കുന്നു
- [ ] `az account show` നിങ്ങളുടെ Azure സബ്‌സ്‌ക്രിപ്ഷൻ കാണിക്കുന്നു
- [ ] ഒരു ടെസ്റ്റ് ഡയറക്ടറി സൃഷ്ടിച്ച് `azd init` വിജയം കാണിക്കുന്നു

**എല്ലാ പരിശോധനകളും കടന്നു കഴിഞ്ഞാൽ, [Your First Project](first-project.md) ലേക്ക് മുന്നോട്ട് പോവാൻ നിങ്ങൾ തയ്യാറാണ്!**

## പ്രാമാണീകരണ സെറ്റപ്പ്

### Azure CLI പ്രാമാണീകരണം (ശിപാർശചെയ്യപ്പെടുന്നു)
```bash
# ഇതിനകം ഇൻസ്റ്റാൾ ചെയ്തിട്ടില്ലെങ്കിൽ Azure CLI ഇൻസ്റ്റാൾ ചെയ്യുക
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure ലോഗിൻ ചെയ്യുക
az login

# പ്രാമാണീകരണം സ്ഥിരീകരിക്കുക
az account show
```

### ഡിവൈസ് കോഡ് പ്രാമാണീകരണം
നീங்கள் ഹെഡ്‌ലെസ് സിസ്റ്റത്തിൽ ആണെങ്കിൽ അല്ലെങ്കിൽ ബ്രൗസർ പ്രശ്നങ്ങൾ ഉണ്ടെങ്കിൽ:
```bash
az login --use-device-code
```

### സർവീസ് പ്രിൻസിപ്പൽ (CI/CD)
ഓട്ടോമേറ്റഡ് എൻവയോൺമെന്റുകൾക്കായി:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## കോൺഫിഗറേഷൻ

### ഗ്ലോബൽ കോൺഫിഗറേഷൻ
```bash
# ഡീഫോൾട്ട് സബ്സ്ക്രിപ്ഷൻ സജ്ജമാക്കുക
azd config set defaults.subscription <subscription-id>

# ഡീഫോൾട്ട് സ്ഥലം സജ്ജമാക്കുക
azd config set defaults.location eastus2

# എല്ലാ കോൺഫിഗറേഷൻകളും കാണുക
azd config list
```

### എൻവയോൺമെന്റ് വേരിയബിളുകൾ
നിങ്ങളുടെ ഷെൽ പ്രൊഫൈൽ (`.bashrc`, `.zshrc`, `.profile`) ൽ ചേർക്കുക:
```bash
# ആഴൂരു കോൺഫിഗറേഷൻ
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd കോൺഫിഗറേഷൻ
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # ഡീബഗ് ലോഗിംഗ് സജീവമാക്കുക
```

## IDE സംയോജനം

### Visual Studio Code
Azure Developer CLI എക്സ്റ്റെൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക:
1. VS Code തുറക്കുക
2. എക്സ്റ്റെൻഷൻസിലേക്ക് പോകുക (Ctrl+Shift+X)
3. "Azure Developer CLI" തിരയുക
4. എക്സ്റ്റെൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക

സവിശേഷതകൾ:
- azure.yaml നുവേണ്ടി IntelliSense
- ഇന്റഗ്രേറ്റഡ് ടെർമിനൽ കമാൻഡുകൾ
- ടെംപ്ലേറ്റ് ബ്രൗസിംഗ്
- ഡിപ്പ്ലോയ്മെന്റ് നിരീക്ഷണം

### GitHub Codespaces
`.devcontainer/devcontainer.json` സൃഷ്ടിക്കുക:
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
2. Azure ക്രെഡൻഷ്യലുകൾ കോൺഫിഗർ ചെയ്യുക
3. azd കമാൻഡുകൾക്കായി ഇന്റഗ്രേറ്റഡ് ടെർമിനൽ ഉപയോഗിക്കുക

## 🐛 ഇൻസ്റ്റലേഷൻ തകരാറുകൾ പരിഹരിക്കൽ

### സാധാരണ പ്രശ്നങ്ങൾ

#### അനുമതി നിഷേധം (Windows)
```powershell
# അഡ്മിനിസ്ട്രേറ്ററായി PowerShell ഓടിക്കുക
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH പ്രശ്നങ്ങൾ
azd PATH-ൽ മാനualmente ചേർക്കുക:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### നെറ്റ്‌‌വർക്ക്/പ്രോക്സി പ്രശ്നങ്ങൾ
```bash
# പ്രോക്സി ക്രമീകരിക്കുക
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL പരിശോധന ഒഴിവാക്കുക (പ്രൊഡക്ഷന്്‌ക്കു ശുപാർശ ചെയ്യപ്പെടുന്നില്ല)
azd config set http.insecure true
```

#### വേർഷൻ കോൺഫ്ലിക്ക്റ്റുകൾ
```bash
# പഴയ ഇൻസ്റ്റലേഷനുകൾ നീക്കം ചെയ്യുക
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# കോൺഫിഗറേഷൻ ശുദ്ധീകരിക്കുക
rm -rf ~/.azd
```

### കൂടുതൽ സഹായം നേടുന്നത്
```bash
# ഡീബഗ് ലോഗിംഗിനെ പ്രവർത്തനക്ഷമമാക്കുക
export AZD_DEBUG=true
azd <command> --debug

# നിലവിലെ കോൺഫിഗറേഷൻ കാണുക
azd config list

# നിലവിലെ വിന്യസന സ്ഥിതിക്ക് നോക്കുക
azd show
```

## azd അപ്ഡേറ്റിംഗ്

### ഓട്ടോമാറ്റിക് അപ്‌ഡേറ്റുകൾ
azd അപ്‌ഡേറ്റുകൾ ലഭ്യമെങ്കിൽ നിങ്ങൾക്ക് അറിയിക്കും:
```bash
azd version --check-for-updates
```

### മാനുവൽ അപ്‌ഡേറ്റുകൾ

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

## 💡 తరച്ഛ് ചോദ്യങ്ങൾ

<details>
<summary><strong>azd യുടെയും az CLI യുടെയും വ്യത്യാസം എന്താണ്?</strong></summary>

**Azure CLI (az)**: ഓരോ Azure റിസോഴ്‌സും മാനേജുചെയ്യുന്നതിന് താഴ്ന്നതല ഉപകരണം
- `az webapp create`, `az storage account create`
- ഒരൊറ്റ റിസോഴ്‌സ് ഓരോന്നായി
- ഇൻഫ്രാസ്ട്രക്ചർ മാനേജ്മെന്റ് ലക്ഷ്യം

**Azure Developer CLI (azd)**: പൂർണ്ണ ആപ്ലിക്കേഷൻ ഡിപ്പ്ലോയ്മെന്റുകൾക്കുള്ള ഉയർന്ന തല ഉപകരണം
- `azd up` മുഴുവൻ ആപ്പ് എല്ലാ റിസോഴ്‌സുകളുമായും ഡിപ്പ്ലോ ചെയ്യുന്നു
- ടെംപ്ലേറ്റ് അടിസ്ഥാന വർക്ക്‌ഫ്ലോ
- ഡെവലപ്പർ ഉൽപ്പാദകത്വം ലക്ഷ്യം

**നിങ്ങൾക്ക് രണ്ടും വേണം**: azd Azure CLI പ്രാമാണീകരണത്തിന് ഉപയോഗിക്കുന്നു
</details>

<details>
<summary><strong>നിങ്ങൾ നിലവിലുള്ള Azure റിസോഴ്‌സുകളുമായി azd ഉപയോഗിക്കാമോ?</strong></summary>

അതെ! നിങ്ങൾക്ക്:
1. നിലവിലുള്ള റിസോഴ്‌സുകൾ azd എൻവയോൺമെന്റുകളിൽ ഇറക്കുമതി ചെയ്യാം
2. നിങ്ങളുടെ ബൈസിപ്പ് ടെംപ്ലേറ്റുകളിൽ നിലവിലുള്ള റിസോഴ്‌സുകൾ റഫറൻസ് ചെയ്യാം
3. പുതിയ ഡിപ്പ്ലോയ്മെന്റുകൾക്ക് alongside നിലവിലുള്ള ഇൻഫ്രാസ്ട്രക്ചർ ഉപയോഗിച്ചു azd ഉപയോഗിക്കാം

വിവരങ്ങൾക്ക് [കോൺഫിഗറേഷൻ ഗൈഡ്](configuration.md) കാണുക.
</details>

<details>
<summary><strong>azd Azure Government അല്ലെങ്കിൽ Azure China-യുമായി പ്രവർത്തിക്കുമോ?</strong></summary>

അതെ, ക്ലൗഡ് കോൺഫിഗർ ചെയ്യുക:
```bash
# അസ്യൂർ ഗവൺമെന്റ്
az cloud set --name AzureUSGovernment
az login

# അസ്യൂർ ചൈന
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>CI/CD പൈപ്പ്‌ലൈൻസിലും azd ഉപയോഗിക്കാമോ?</strong></summary>

കുറഞ്ഞ സംശയമില്ല! azd ഓട്ടോമേഷൻക്ക് രൂപകൽപ്പന ചെയ്തിരിക്കുന്നു:
- GitHub Actions ഇന്റഗ്രേഷൻ
- Azure DevOps പിന്തുണ
- സർവീസ് പ്രിൻസിപ്പൽ പ്രാമാണീകരണം
- നോൺ-ഇന്ററാക്റ്റീവ് മോഡ്

CI/CD ഫ്‌ളോPatterns-ക്ക് [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) കാണുക.
</details>

<details>
<summary><strong>azd ഉപയോഗിക്കുന്നതിന് ചെലവ് എത്രയാണ്?</strong></summary>

azd സ്വയം **പൂർണമായും സൗജന്യവും ഓപ്പൺ സോഴ്സ് ഉം** ആണ്. നിങ്ങൾക്ക് പണമടക്കേണ്ടത്:
- നിങ്ങൾ ഡിപ്പ്ലോ ചെയ്യുന്ന Azure റിസോഴ്‌സുകൾക്കായി
- Azure ഉപഭോഗച്ചെലവ് (കമ്പ്യൂട്ട്, സ്റ്റോറേജ് തുടങ്ങിയവ)

ഡിപ്പ്ലോയ്മെന്റിനു മുമ്പ് ചെലവ് അറിയാൻ `azd provision --preview` ഉപയോഗിക്കാം.
</details>

## അടുത്ത ചുവടുകൾ

1. **പ്രാമാണീകരണം പൂർത്തിയാക്കുക**: നിങ്ങളുടെ Azure സബ്‌സ്‌ക്രിപ്ഷൻ ആക്സസ് ചെയ്യാൻ കഴിയും-confirm ചെയ്യുക
2. **ആദ്യ ഡിപ്പ്ലോയ്മെന്റ് പരീക്ഷിച്ച് നോക്കുക**: [First Project Guide](first-project.md) പിന്തുടരുക
3. **ടെംപ്ലേറ്റുകൾ എക്സ്‌പ്ലോർ ചെയ്യുക**: `azd template list` ഉപയോഗിച്ച് ലഭ്യമായ ടെംപ്ലേറ്റുകൾ കാണുക
4. **IDE കോൺഫിഗർ ചെയ്യുക**: നിങ്ങളുടെ ഡെവലപ്പ്മെന്റ് പരിസ്ഥിതി സജ്ജമാക്കുക

## പിന്തുണ

പ്രശ്നങ്ങൾ നേരിടുമ്പോൾ:
- [ഓഫിഷ്യൽ ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [പ്രശ്നങ്ങൾ റിപ്പോർട്ട് ചെയ്യുക](https://github.com/Azure/azure-dev/issues)
- [കമ്മ്യൂണിറ്റി ചർച്ചകൾ](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - നിങ്ങളുടെ എഡിറ്ററിൽ നിന്ന് നേരിട്ട് Azure കമാൻഡ് മാർഗ്ഗനിർദ്ദേശം ലഭിക്കാൻ `npx skills add microsoft/github-copilot-for-azure` ഉപയോഗിക്കുക

---

**അദ്ധ്യായം നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലുള്ള അദ്ധ്യായം**: അദ്ധ്യായം 1 - അടിസ്ഥാനവും ക്വിക്ക് സ്റ്റാർട്ടും
- **⬅️ മുമ്പത്തെ**: [AZD Basics](azd-basics.md) 
- **➡️ അടുത്തത്**: [Your First Project](first-project.md)
- **🚀 അടുത്ത അദ്ധ്യായം**: [അദ്ധ്യായം 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ഇൻസ്റ്റലേഷൻ പൂർത്തിയായി!** azd ഉപയോഗിച്ച് പണിയാരംഭിക്കാൻ [Your First Project](first-project.md) ലേക്ക് തുടരുക.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അസൂയാക്കുറിപ്പ്**:  
ഈ രേഖ [Co-op Translator](https://github.com/Azure/co-op-translator) എന്ന AI പരിഭാഷ സੇവീസ് ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. നമുക്ക് വരുത്തുന്ന കൃത്യതയ്‌ക്കായി പരിശ്രമിക്കുമ്പോഴും, ഓട്ടോമാറ്റിക് വിവർത്തനങ്ങളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാമെന്ന് ശ്രദ്ധിക്കുക. അതിനാൽ, അടിസ്ഥാനം ഭാഷയിലെ മൂടർത്തമായ രേഖ ഏറ്റവും വിശ്വസനീയമായ ഉറവിടമായി കണക്കில் എടുക്കണം. നിർണായകമായ വിവരങ്ങൾക്കായി പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷ ഉപയോഗിക്കുമ്പോൾ ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾക്കും തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കും ഞങ്ങൾ ഉത്തരവാദിയല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->