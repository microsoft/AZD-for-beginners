# ഇൻസ്റ്റലേഷൻ & സെറ്റപ് ഗൈഡ്

**അദ്ധ്യായം നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അദ്ധ്യായം**: അദ്ധ്യായം 1 - ഫൗണ്ടേഷൻ & ക്വിക്ക് സ്റ്റാർട്ട്
- **⬅️ മുൻപ്**: [AZD Basics](azd-basics.md)
- **➡️ അടുത്തത്**: [Your First Project](first-project.md)
- **🚀 അടുത്ത അദ്ധ്യായം**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## പരിചയം

ഈ സമഗ്രമായ ഗൈഡ്ിൽ നിങ്ങളുടെ സിസ്റ്റത്തിൽ Azure Developer CLI (azd) ഇൻസ്റ്റാൾ ചെയ്തു കോൺഫിഗർ ചെയ്യുന്നതു സംബന്ധിച്ച് വഴി കാണിക്കും. വ്യത്യസ്ഥ ഓപ്പറേറ്റിംഗ് സിസ്റ്റങ്ങൾക്കായുള്ള പല ഇൻസ്റ്റലേഷൻ മാർഗ്ഗങ്ങളും, പ്രാമാണീകരണ സജ്ജീകരണം, ആൻഡ് ആദിവാരണ കോൺഫിഗറേഷൻ എന്നിവ നിങ്ങൾ പഠിക്കും, Azure ഡിപ്പ്ലോയ്മെന്റുകൾക്കായി നിങ്ങളുടെ ഡെവലപ്മെന്റ് പരിസരം തയ്യാറാക്കാൻ.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ പാഠത്തിന്റെ തീർത്ഥാരണത്തോടെ നിങ്ങൾക്ക് സാധിക്കേണ്ടത്:
- നിങ്ങളുടെ ഓപ്പറേറ്റിംഗ് സിസ്റ്റത്തിൽ വിജയകരമായി Azure Developer CLI ഇൻസ്റ്റാൾ ചെയ്യുക
- Azure-നുമായി പല രീതി ഉപയോഗിച്ച് പ്രാമാണീകരണം കോൺഫിഗർ ചെയ്യുക
- ആവശ്യമായ മുൻഗണനകൾ ഉൾപ്പെടെ നിങ്ങളുടെ ഡെവലപ്മെന്റ് പരിസ്ഥിതി സജ്ജമാക്കുക
- വേരിയസ്ഡ് ഇൻസ്റ്റലേഷൻ ഓപ്ഷനുകൾ മനസ്സിലാക്കി ഒരു ശരിയായ സമയത്ത് യോജിച്ചത് തിരഞ്ഞെടുക്കുക
- തുമ്പ്രസാധാരണ ഇൻസ്റ്റലേഷൻ, സജ്ജീകരണ പ്രശ്നങ്ങൾ പരിഹരിക്കുക

## പഠന ഫലങ്ങൾ

ഈ പാഠം പൂർത്തിയാക്കിയശേഷം, നിങ്ങൾക്ക് കഴിയും:
- നിങ്ങളുടെ പ്ലാറ്റ്ഫോമിനുവേണ്ടിയുള്ള യോജിച്ച മാർഗ്ഗം ഉപയോഗിച്ച് azd ഇൻസ്റ്റാൾ ചെയ്യുക
- azd auth login ഉപയോഗിച്ച് Azure-യിൽ പ്രാമാണീകരണം നേടുക
- നിങ്ങളുടെ ഇൻസ്റ്റലേഷൻ പരിശോധന നടത്തി അടിസ്ഥാന azd കമാൻഡുകൾ ടെസ്റ്റ് ചെയ്യുക
- azd യുടെ മികച്ച ഉപയോഗത്തിനായി നിങ്ങളുടെ ഡെവലപ്മെന്റ് പരിസരം കോൺഫിഗർ ചെയ്യുക
- സാധാരണ ഇൻസ്റ്റലേഷൻ പ്രശ്നങ്ങൾ സ്വതന്ത്രമായി പരിഹരിക്കുക

ഈ ഗൈഡ് നിങ്ങളുടെ ഓപ്പറേറ്റിംഗ് സിസ്റ്റത്തിന്റെയും ഡെവലപ്മെന്റ് പരിസരത്തിന്റെയും വ്യത്യാസംകണ്ട് വ്യത്യസ്തമായതായിരിക്കും, Azure Developer CLI ഇൻസ്റ്റാൾ ചെയ്ത് കോൺഫിഗർ ചെയ്യാൻ സഹായിക്കും.

## മുൻനിര ഇപ്പോഴുള്ളത്

azd ഇൻസ്റ്റാൾ ചെയ്യുന്നതിനു മുമ്പ് ഉറപ്പാക്കുക നിങ്ങൾക്കുണ്ടോ:
- **Azure സബ്സ്ക്രിപ്ഷൻ** - [സ്വതന്ത്ര അക്കൗണ്ട് സൃഷ്ടിക്കുക](https://azure.microsoft.com/free/)
- **Azure CLI** - പ്രാമാണീകരണത്തിനും റിസോഴ്‌സ് മാനേജ്മെന്റിനും
- **Git** - ടെംപ്ലേറ്റുകൾ ക്ലോൺ ചെയ്യാനും വേർഷൻ കണ്ട്രോൾക്കും
- **Docker** (ഐച്ഛികം) - കണ്ടെയ്നറിശ്ചിത അപ്ലിക്കേഷനുകൾക്കായി

## ഇൻസ്റ്റലേഷൻ മാർഗ്ഗങ്ങൾ

### ويندوോസ്

#### ഓപ്ഷൻ 1: Windows പാക്കേജ് മാനേജർ (പരാമർശം നൽകിയതാണ്)
```cmd
winget install microsoft.azd
```

#### ഓപ്ഷൻ 2: PowerShell ഇൻസ്റ്റാൾ സ്ക്രിപ്റ്റ്
```powershell
# winget ലഭ്യമല്ലാത്തപ്പോൾ ഉപകാരപ്രദമാണ്
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### ഓപ്ഷൻ 3: Chocolatey
```cmd
choco install azd
```

#### ഓപ്ഷൻ 4: മാനുവൽ ഇൻസ്റ്റലേഷൻ
1. [GitHub](https://github.com/Azure/azure-dev/releases) നിന്ന് അവസാനത്തെ റിലീസ് ഡൗൺലോഡ് ചെയ്യുക
2. `C:\Program Files\azd\` ലേക്ക് എക്സ്ട്രാക്റ്റ് ചെയ്യുക
3. PATH മൂല്യത്തിൽ ചേർക്കുക

### macOS

#### ഓപ്ഷൻ 1: Homebrew (പരാമർശം നൽകിയതാണ്)
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

### ലിനക്സ്

#### ഓപ്ഷൻ 1: ഇൻസ്റ്റാൾ സ്ക്രിപ്റ്റ് (പരാമർശം നൽകിയമാണ്)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ഓപ്ഷൻ 2: പാക്കേജ് മാനേജർസ്

**റിലീസ് അസറ്റിൽ നിന്ന് മാനുവൽ ഇൻസ്റ്റലേഷൻ:**
```bash
# നിങ്ങളുടെ ലിനക്സ് ആർക്കിടെക്ചറിനുള്ള ഏറ്റവും പുതിയ ആർക്കൈവ് ഇതിൽ നിന്ന് ดาวน์โหลด ചെയ്യുക:
# https://github.com/Azure/azure-dev/releases
# പിന്നീട് അതിനെ എക്സ്ട്രാക്റ്റ് ചെയ്ത് azd ബൈനറി നിങ്ങളുടെ PATH-ഇൽ ചേർക്കുക.
```

### GitHub Codespaces

ചില Codespaces, ഡെവ് കണ്ടെയ്‌നർ പരിസ്ഥിതികളിൽ ഇതിനകം `azd` ഉൾപ്പെടുത്തിയിട്ടുണ്ട്, പക്ഷേ നിങ്ങൾ കരുതാതെ ഉറപ്പാക്കുന്നത് നല്ലത്:

```bash
azd version
```

`azd` കാണാനില്ലെങ്കിൽ, പരിസ്ഥിതിക്കിടയിലെ സാധാരണ സ്ക്രിപ്റ്റ് ഉപയോഗിച്ച് ഇൻസ്റ്റാൾ ചെയ്യുക.

### Docker

```bash
# ഒരു കണ്ടെയ്‌നറിൽ azd പ്ര_run#SBATCH
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# എളുപ്പത്തിലുള്ള ഉപയോഗത്തിനായി ഒരു സന്ദർശകപ്പേർ സൃഷ്ടിക്കുക
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ഇൻസ്റ്റലേഷൻ പരിശോധന

ഇൻസ്റ്റലേഷൻ കഴിഞ്ഞാൽ, azd ശരിയായി പ്രവർത്തിക്കുന്നുണ്ടോ എന്ന് പരിശോധിക്കുക:

```bash
# പതിപ്പ് പരിശോധിക്കുക
azd version

# സഹായം കാണുക
azd --help

# ലഭ്യമായ ടേംപ്ലേറ്റുകൾ പട്ടികപ്പെടുത്തിയിരിക്കുന്നു
azd template list
```

പ്രതീക്ഷിക്കുന്ന ഔട്ട്പുട്ട്:
```
azd version 1.x.x (commit xxxxxx)
```

**കുറിപ്പ്**: യഥാർത്ഥ വേർഷൻ നമ്പർ വ്യത്യാസപ്പെടും. ഏറ്റവും പുതിയ വേർഷൻ ലഭിക്കാൻ [Azure Developer CLI റിലീസുകൾ](https://github.com/Azure/azure-dev/releases) പരിശോധിക്കുക.

**✅ ഇൻസ്റ്റലേഷൻ വിജയത്തിന്റെ ചെക്ക്ലിസ്റ്റ്:**
- [ ] `azd version` യഥാർത്ഥ വേർഷൻ നമ്പർ പിഴവുകളില്ലാതെ കാണിക്കുന്നു
- [ ] `azd --help` കമാൻഡ് ഡോക്യുമെന്റേഷൻ കാട്ടുന്നു
- [ ] `azd template list` ലഭ്യമായ ടെംപ്ലേറ്റുകൾ കാണിക്കുന്നു
- [ ] ഒരു പരീക്ഷണ ഫോൾഡർ സൃഷ്ടിച്ച് `azd init` വിജയകരമായി ഓടിക്കുന്നു

**എല്ലാ പരിശോധനകളും പാസായാൽ, [Your First Project](first-project.md) യിലേക്ക് പോകാൻ അത്യുത്തമം!**

## പ്രാമാണീകരണ സജ്ജീകരണം

### ശുപാർശ ചെയ്യപ്പെട്ട തുടക്കം

AZD-ഫസ്റ്റ് പ്രവൃത്തികളിൽ, `azd auth login` ഉപയോഗിച്ച് സൈൻ ഇൻ ചെയ്യുക.

```bash
# azd up പോലുള്ള AZD കമാൻഡുകൾക്ക് ആവശ്യമാണ്
azd auth login

# AZD प्रमाणीकरण 상태 പരിശോധിക്കുക
azd auth login --check-status
```

നിങ്ങൾ കോഴ്‌സിന്റെ സമയത്ത് സ്വയം `az` കമാൻഡുകൾ നടത്താൻ ഉദ്ദേശിക്കുന്നുവെങ്കിൽ മാത്രമേ Azure CLI സൈൻ-ഇൻ ഉപയോഗിക്കണമെന്ന്.

### Azure CLI പ്രാമാണീകരണം (ഐച്ഛികം)
```bash
# അതിവേഗത്തിൽ ഇൻസ്റ്റാൾ ചെയ്യാത്ത പക്ഷം Azure CLI ഇൻസ്റ്റാൾ ചെയ്യുക
# വിൻഡോവുകൾ: winget install Microsoft.AzureCLI
# മാക്‌ ഒഎസ്: brew install azure-cli
# ലിനക്സ്വിന്: നിങ്ങളുടെ വിതരണത്തിനായി Azure CLI ഇൻസ്റ്റാൾ ഡോക്യുമെന്റേഷൻ കാണുക

# Azure-ലോഗിൻ ചെയ്യുക
az login

# പ്രാമാണീകരണം പരിശോധിക്കുക
az account show
```

### ഏത് സൈൻ-ഇൻ ഫ്ലോ നിങ്ങൾ ഉപയോഗിക്കണം?

- നിങ്ങൾ പുതിയ AZD വഴി പിന്തുടരുന്നുവെങ്കിൽ പ്രതീക്ഷിച്ച് `azd auth login` ഉപയോഗിക്കുക.
- Azure CLI കമാൻഡുകൾ, ഉദാഹരണത്തിന് `az account show` നേരിട്ട് പരിശോധിക്കുകയാണെങ്കിൽ `az login` ഇളക്കം നൽകുക.
- ഒരു പ്രവർത്തനത്തിൽ `azd` ഉം `az` ഉം ഇരുവരും ഉൾപ്പെടുന്നുവെങ്കിൽ, പ്രവർത്തനം ആരംഭിക്കുന്നുമുമ്പ് ഇരു സൈൻ-ഇൻ കമാൻഡുകളും ശേഖരിക്കുക.

### ഡിവൈസ് കോഡ് പ്രാമാണീകരണം
നിങ്ങൾ ഹെഡ്‌ലെസ് സിസ്റ്റത്തിലാണെങ്കിൽ അല്ലെങ്കിൽ ബ്രൗസർ പ്രശ്നങ്ങൾ സംഭവിക്കുന്നുവെങ്കിൽ:
```bash
azd auth login --use-device-code
```

### സർവ്വീസ് പ്രിൻസിപ്പൽ (CI/CD)
ഓട്ടോമേറ്റഡ് പരിസ്ഥിതികൾക്കായി:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### നിങ്ങളുടെ പൂർത്തിയായ സജ്ജീകരണം സ്ഥിരീകരിക്കുക

അദ്ധ്യായം 1 ആരംഭിക്കാനുള്ള ശരിയുള്ള സജ്ജീകരണം ഒരു ഫാസ്റ്റ് ചെക്കിന്:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## കോൺഫിഗറേഷൻ

### ഗ്രോബിൾ കോൺഫിഗറേഷൻ
```bash
# ഡീഫോൾട്ട് സബ്സ്ക്രിപ്ഷൻ സെറ്റ് ചെയ്യുക
azd config set defaults.subscription <subscription-id>

# ഡീഫോൾട്ട് സ്ഥലമുണ്ടാക്കുക
azd config set defaults.location eastus2

# എല്ലാ കോൺഫിഗറേഷനും കാണുക
azd config show
```

### പരിസ്ഥിതി വ്യത്യാസങ്ങൾ
നിങ്ങളുടെ ഷെൽ പ്രൊഫൈൽ (`.bashrc`, `.zshrc`, `.profile`) ൽ ചേർക്കുക:
```bash
# അസ്യൂർ ക്രമീകരണം
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd ക്രമീകരണം
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # ഡീബഗ് ലോഗ് സജീവമാക്കുക
```

## ഐഡിഇ ഇന്റഗ്രേഷൻ

### Visual Studio Code
Azure Developer CLI എക്സ്റ്റൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക:
1. VS Code തുറക്കുക
2. എക്സ്റ്റൻഷനുകളിൽ പോകുക (Ctrl+Shift+X)
3. "Azure Developer CLI" തിരയുക
4. എക്സ്റ്റൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക

ഫീച്ചറുകൾ:
- azure.yaml-ക്കായി IntelliSense
- ഇന്റഗ്രേറ്റഡ് ടെർമിനൽ കമാൻഡുകൾ
- ടെംപ്ലേറ്റുകൾ ബ്രൗസ് ചെയ്യൽ
- ഡിപ്പ്ലോയ്മെന്റ് നിരീക്ഷണം

### GitHub Codespaces
സൃഷ്ടിക്കുക `.devcontainer/devcontainer.json`:
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

## 🐛 ഇൻസ്റ്റലേഷൻ പ്രശ്നപരിഹാരം

### സാധാരണ പ്രശ്നങ്ങൾ

#### പെർമിഷൻ നിഷേധിച്ചു (Windows)
```powershell
# അഡ്മിനിസ്ട്രേറ്ററായി PowerShell ഓടിക്കുക
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH പ്രശ്നങ്ങൾ
മാനുവലായി azd PATH-ൽ ചേർക്കുക:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### നെറ്റ്‌വർക്ക്/പ്രോക്ഷി പ്രശ്നങ്ങൾ
```bash
# പ്രോക്സി ക്രമീകരിക്കുക
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL പരിശോദന ഒഴിവാക്കുക (ഉൽപ്പാദനത്തിനായി ശുപാർശ ചെയ്യുന്നില്ല)
azd config set http.insecure true
```

#### വേർഷൻ എററുകളും പൊരുത്തക്കേടുകളും
```bash
# പഴയ ഇൻസ്റ്റാളേഷനുകൾ നീക്കം ചെയ്യുക
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: വീണ്ടും ഇൻസ്റ്റാൾ ചെയ്യുന്നതിന് മുമ്പ് പൂർവത്തിലെ azd ബൈനറി അല്ലെങ്കിൽ സിമ്ലിങ്ക് നീക്കം ചെയ്യുക

# കോൺഫിഗറേഷൻ ശുദ്ധീകരിക്കുക
rm -rf ~/.azd
```

### കൂടുതൽ സഹായം തേടുക
```bash
# ഡീബഗ് ലോഗിങ് സജ്ജമാക്കുക
export AZD_DEBUG=true
azd <command> --debug

# നിലവിലെ കോൺഫിഗറേഷൻ കാണുക
azd config show

# നിലവിലെ വിന്യാസ നില കാണുക
azd show
```

## azd അപ്ഡേറ്റിങ്ങ്

### അപ്ഡേറ്റ് പരിശോധന
പുതിയത് ലഭ്യമാണ് എങ്കിൽ azd മുന്നറിയിപ്പ് നൽകും, ഇപ്പോഴത്തെ ബിൽഡ് പരിശോധിക്കാൻ:
```bash
azd version
```

### മാനുവൽ അപ്ഡേറ്റുകൾ

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

## 💡 പതിവായി ചോദിക്കുന്ന ചോദ്യങ്ങൾ

<details>
<summary><strong>azd-ഉം az CLI-ഉം തമ്മിലുള്ള വ്യത്യാസം എന്താണ്?</strong></summary>

**Azure CLI (az)**: ഓരോ Azureറിസോഴ്സ് മാനേജ്‌ക്കാനുള്ള ലൊവ-ലെവൽ ടൂൾ
- `az webapp create`, `az storage account create`
- ഓരോ റിസോഴ്‌സും ഓരോ തവണയായി
- ഇൻഫ്രാസ്ട്രക്ചർ മാനേജ്മെന്റ് പ്രാധാന്യം

**Azure Developer CLI (azd)**: ആപ്പ്ലിക്കേഷൻ മുഴുവനായി ഡിപ്പ്ലോയ്മെന്റ് ചെയ്യാനുള്ള ഹൈ-ലെവൽ ടൂൾ
- `azd up` ഉപയോഗിച്ച് എല്ലാ റിസോഴ്‌സുകളും ഉൾപ്പെടെ അപ്ലിക്കേഷൻ ഡിപ്പ്ലോയ് ചെയ്യുക
- ടെംപ്ലേറ്റ് അടിസ്ഥാനത്തിലുള്ള പ്രവൃത്തികൾ
- ഡെവലപ്പർ ഉൽപാദകത്വ ലൈറ്റ്

**ര് രണ്ട് ആവശ്യമാണ്**: azd പ്രാമാണീകരണത്തിന് az CLI ഉപയോഗിക്കുന്നു
</details>

<details>
<summary><strong>സാധനമായ Azure റിസോഴ്‌സുകൾ azd-യുമായി ഉപയോഗിക്കാമോ?</strong></summary>

അതെ! നിങ്ങൾക്ക് ചെയ്യാം:
1. നിലവിലുള്ള റിസോഴ്‌സുകൾ azd പരിസരങ്ങളിൽ ഇമ്പോർട്ട് ചെയ്യുക
2. നിലവിലുള്ള റിസോഴ്‌സുകൾ നിങ്ങളുടെ Bicep ടെംപ്ലേറ്റുകളിൽ റഫറൻസ് ചെയ്യുക
3. പുതിയ ഡിപ്പ്ലോയ്മെന്റ് azd ഉപയോഗിച്ച് നിലവിലുള്ള ഇൻഫ്രാസ്ട്രക്ചർ ഒപ്പം നടത്തുക

വിവരങ്ങൾക്ക് [Configuration Guide](configuration.md) കാണുക.
</details>

<details>
<summary><strong>azd ആസ്വധാന്ത രൂപഭേദങ്ങളിൽ (Azure Government, Azure China) പ്രവർത്തിക്കുന്നുണ്ടോ?</strong></summary>

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
<summary><strong>azd CI/CD പൈപ്പ്ലൈനുകളിൽ ഉപയോഗിക്കാമോ?</strong></summary>

പൂർണമായും! azd ഓട്ടോമേഷനു രൂപകൽപ്പന ചെയ്തിരിക്കുന്നു:
- GitHub Actions ഇന്റഗ്രേഷൻ
- Azure DevOps പിന്തുണ
- സർവീസ് പ്രിൻസിപ്പൽ പ്രാമാണീകരണം
- നോൺ-ഇന്ററാക്ടീവ് മോഡ്

CI/CD മാതൃകകൾക്കായി [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) കാണുക.
</details>

<details>
<summary><strong>azd ഉപയോഗത്തിന്റെ ചിലവ് എത്രയാണ്?</strong></summary>

azd തന്നെ **പൂർണമൈലും സൗജന്യവും** തുറന്ന ഉറവിടം. നിങ്ങൾ മാത്രം ചെലവുവരുത്തുന്നത്:
- നിങ്ങൾ ഡിപ്പ്ലോയ് ചെയ്യുന്ന Azure റിസോഴ്‌സുകൾക്ക് 
- Azure ഉപഭോഗ ചെലവുകൾ (കമ്പ്യൂട്ട്, സ്റ്റോറേജ്, തുടങ്ങിയവ)

ഡിപ്പ്ലോയ്മെന്റിനു മുമ്പ് ചെലവുകൾ കണക്കാക്കാൻ `azd provision --preview` ഉപയോഗിക്കുക.
</details>

## അടുത്ത ഘട്ടങ്ങൾ

1. **പ്രാമാണീകരണം പൂർത്തിയാക്കുക**: നിങ്ങളുടെ Azure സബ്സ്ക്രിപ്ഷൻ ലഭ്യമാണെന്ന് ഉറപ്പ് വരുത്തുക
2. **പിറന്നിടുക ആദ്യ ഡിപ്പ്ലോയ്മെന്റ്**: [First Project Guide](first-project.md) പിന്തുടരുക
3. **ടെംപ്ലേറ്റുകൾ എക്‌സ്പ്ലോർ ചെയ്യുക**: `azd template list` ഉപയോഗിച്ച് ലഭ്യമായ ടെംപ്ലേറ്റുകൾ ബ്രൗസ് ചെയ്യുക
4. **നിങ്ങളുടെ IDE കോൺഫിഗർ ചെയ്യുക**: നിങ്ങളുടെ ഡെവലപ്മെന്റ് പരിസ്ഥിതി സജ്ജമാക്കുക

## പിന്തുണ

പ്രശ്നങ്ങൾ നേരിടുകയാണെങ്കിൽ:
- [അധികൃത ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [സമസ്യ റിപ്പോർട്ട് ചെയ്യുക](https://github.com/Azure/azure-dev/issues)
- [കമ്മ്യൂണിറ്റി ചർച്ചകൾ](https://github.com/Azure/azure-dev/discussions)
- [Azure പിന്തുണ](https://azure.microsoft.com/support/)
- [**Azure ഏജന്റ് സ്കിൽസുകൾ**](https://skills.sh/microsoft/github-copilot-for-azure) - `npx skills add microsoft/github-copilot-for-azure` ഉപയോഗിച്ച് നിങ്ങളുടെ എഡിറ്റർ നേരിട്ട് Azure കമാൻഡ് മാർഗനിർദേശങ്ങൾ നേടുക

---

**അദ്ധ്യായം നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അദ്ധ്യായം**: അദ്ധ്യായം 1 - ഫൗണ്ടേഷൻ & ക്വിക്ക് സ്റ്റാർട്ട്
- **⬅️ മുൻപ്**: [AZD Basics](azd-basics.md)
- **➡️ അടുത്തത്**: [Your First Project](first-project.md)
- **🚀 അടുത്ത അദ്ധ്യായം**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ഇൻസ്റ്റലേഷൻ പൂര്‍ത്തിയായി!** azd ഉപയോഗിച്ച് നിർമ്മാണം തുടങ്ങാൻ [Your First Project](first-project.md) എത്തുക.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അസ്വീകരണം**:  
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. നാം കൃത്യതയ്ക്കായി प्रयासിച്ചിട്ടും, സ്വയമേഖലാ പരിഭാഷകളിൽ പിശകുകൾ അല്ലെങ്കിൽ തെറ്റിദ്ധാരങ്ങൾ ഉണ്ടാകാമെന്ന് ദയവായി മനസിലാക്കുക. матൃഭാഷയിലുള്ള യഥാർത്ഥ രേഖ മാത്രമാണ് അധികാരപരമായ ഉറവിടം എന്ന് പരിഗണിക്കേണ്ടത്. നിർണ്ണായക വിവരങ്ങൾക്കായി, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശിപാർശ ചെയ്യപ്പെടുന്നു. ഈ പരിഭാഷ ഉപയോഗിക്കുന്നതിനാൽ ഉണ്ടാകാവുന്ന സംശയങ്ങളോ തെറ്റിദ്ധാരണകളോ jaoks ہم жоопവാഹികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->