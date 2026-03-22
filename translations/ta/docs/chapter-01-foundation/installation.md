# நிறுவல் மற்றும் அமைப்பு வழிகாட்டி

**அத்தியாயம் வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD தொடக்கத்திற்கான](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 1 - அடித்தளம் மற்றும் விரைவு தொடக்கம்
- **⬅️ முந்தையது**: [AZD அடிப்படைகள்](azd-basics.md)
- **➡️ அடுத்தது**: [உங்கள் முதல் проект](first-project.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 2: AI-முதலாளர் வளர்ச்சி](../chapter-02-ai-development/microsoft-foundry-integration.md)

## அறிமுகம்

இந்த விரிவான வழிகாட்டி உங்கள் கணிணியில் Azure Developer CLI (azd) ஐ நிறுவி கட்டமைக்க வழிகாட்டும். பல оператив் அமைப்புகளுக்கான பல நிறுவல் முறைகளை, அங்கீகாரம் அமைவதை மற்றும் Azure இடங்களில் பிரவசிக்க உங்கள் வளர்ச்சி சூழலைத் தயாரிக்கும் ஆரம்பக் கட்டமைப்புகளை நீங்கள் கற்றுக்கொள்வீர்கள்.

## கற்றல் குறிக்கோள்கள்

இந்த பாடம் முடிந்தவுடன், நீங்கள்:
- உங்கள் இயங்குதளத்தில் Azure Developer CLI வெற்றிகரமாக நிறுவ முடியும்
- பல முறைகளைக் கொண்டு Azure உடன் அங்கீகாரத்தை அமைக்க முடியும்
- தேவையான முன் நிபந்தனைகளுடன் உங்கள் உருவாக்க சூழலை அமைக்க முடியும்
- வெவ்வேறு நிறுவல் விருப்பங்களை மற்றும் ஒவ்வொன்றை பயன்படுத்த வேண்டிய நேரத்தை புரிந்துகொள்ள முடியும்
- பொதுவான நிறுவல் மற்றும் அமைப்பு பிரச்சினைகளை சரி பார்க்கற்ற திறனை பெற்றிருப்பீர்கள்

## கற்றல் வெளியீடுகள்

இந்த பாடத்தை முடித்த பிறகு, நீங்கள் செய்ய முடியும்:
- உங்கள் தளத்திற்கான பொருத்தமான முறையை பயன்படுத்தி azd ஐ நிறுவுதல்
- `azd auth login` பயன்படுத்தி Azure உடன் அங்கீகாரம் செய்யுதல்
- உங்கள் நிறுவலை சரிபார்த்து அடிப்படை azd கட்டளைகளை சோதனை செய்தல்
- azd பயன்பாட்டிற்கு உகந்தவாறு உங்கள் உருவாக்க சூழலை அமைத்தல்
- பொதுவாக உள்ள நிறுவல் பிரச்சினைகளை தனக்குத்தானே தீர்த்தல்

இந்த வழிகாட்டி உங்கள் இயங்குத்தளம் அல்லது உருவாக்க சூழல் எங்கு இருந்தாலும் Azure Developer CLI ஐ நிறுவி கட்டமைக்க உதவும்.

## முன் நிபந்தனைகள்

azd ஐ நிறுவுவதற்கு முன், கீழ்க்கண்டவை உள்ளதா என்று உறுதிசெய்யவும்:
- **Azure சந்தா** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - அங்கீகாரம் மற்றும் வள மேலாண்மைக்காக
- **Git** - வார்ப்புருக்களை கிளோன் செய்வதற்கும் பதிப்புச் கட்டுப்பாட்டிற்கும்
- **Docker** ( விருப்பமானது ) - கன்டெய்னரைப் பயன்படுத்திய பயன்பாடுகளுக்காக

## நிறுவல் முறைகள்

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# நிர்வாகியாக அல்லது உயர்த்தப்பட்ட அனுமதிகளுடன் இயக்கவும்
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. [GitHub](https://github.com/Azure/azure-dev/releases) இருந்து சமீபத்திய வெளியீட்டை பதிவிறக்கவும்
2. `C:\Program Files\azd\` என்ற இடத்திற்கு அகற்றவும்
3. PATH சூழல் மாறிலிக்கு சேர்க்கவும்

### macOS

#### Option 1: Homebrew (Recommended)
```bash
brew tap azure/azd
brew install azd
```

#### Option 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 3: Manual Installation
```bash
# பதிவிறக்கம் செய்து நிறுவவும்
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Ubuntu/Debian:**
```bash
# Microsoft தொகுப்பு களஞ்சியத்தை சேர்க்கவும்
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd ஐ நிறுவவும்
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft தொகுப்பு களஞ்சியத்தைச் சேர்க்கவும்
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd GitHub Codespaces இல் முன்னிறுவப்பட்டு வருகிறது. ஒரு codespace உருவாக்கி உடனே azd ஐ பயன்படுத்தத் தொடங்குங்கள்.

### Docker

```bash
# azd ஐ ஒரு கன்டெய்னரில் இயக்கவும்
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# எளிதாக பயன்படுத்துவதற்காக ஒரு அலியாஸ் உருவாக்கவும்
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ நிறுவலை சரிபார்க்கவும்

நிறுவலை முடித்த பிறகு, azd சரியாக இயங்குகிறதா என்று சரிபார்க்கவும்:

```bash
# பதிப்பை சரிபார்க்கவும்
azd version

# உதவியைப் பார்க்கவும்
azd --help

# கிடைக்கும் வார்ப்புருக்களை பட்டியலிடவும்
azd template list
```

எதிர்பார்க்கப்படும் வெளியீடு:
```
azd version 1.x.x (commit xxxxxx)
```

**குறிப்பு**: உண்மையான பதிப்பு எண் மாறுபடும். சமீபத்திய பதிப்பின் விவரங்களுக்கு [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) பார்க்கவும்.

**✅ நிறுவல் வெற்றி சரிபார்ப்பு பட்டியல்:**
- [ ] `azd version` பிழைகள் இல்லாமல் பதிப்பு எண்ணை காட்டும்
- [ ] `azd --help` கட்டளை ஆவணங்களை காட்டுகிறது
- [ ] `azd template list` கிடைக்கக்கூடிய வார்ப்புருக்களை காட்டுகிறது
- [ ] `az account show` உங்கள் Azure சந்தாவை காட்டுகிறது
- [ ] ஒரு சோதனை கோப்புறையை உருவாக்கி `azd init` வெற்றிகரமாக இயங்குகின்றது

**எல்லா சோதனைகளும் கடந்தால், நீங்கள் [உங்கள் முதல் проект](first-project.md)க்கு தொடர தயாராக இருக்கிறீர்கள்!**

## அங்கீகாரம் அமைப்பு

### Azure CLI அங்கீகாரம் (பரிந்துரைக்கப்படுகிறது)
```bash
# Azure CLI முன்பே நிறுவப்படவில்லையெனில் நிறுவவும்
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure-ல் உள்நுழையவும்
az login

# அங்கீகாரத்தை சரிபார்க்கவும்
az account show
```

### டிவைஸ் கோட் அங்கீகாரம்
நீங்கள் தலைமைமறைந்த (headless) அமைப்பில் இருக்கிறீர்கள் அல்லது உலாவியார் பிரச்சினைகள் இருந்தால்:
```bash
az login --use-device-code
```

### சேவை பிரதிநிதி (CI/CD)
தன்னியக்க சூழல்களுக்கு:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## கட்டமைப்பு

### உலகளாவிய அமைப்பு
```bash
# இயல்புநிலையான சந்தாவை அமைக்க
azd config set defaults.subscription <subscription-id>

# இயல்புநிலையான இடத்தை அமைக்க
azd config set defaults.location eastus2

# அனைத்து கட்டமைப்புகளையும் காண்க
azd config list
```

### சூழல் மாறிலிகள்
உங்கள் ஷெல்ல் ப்ரொஃபைலில் (`.bashrc`, `.zshrc`, `.profile`) சேர்க்கவும்:
```bash
# Azure கட்டமைப்பு
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd கட்டமைப்பு
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # பிழைத்திருத்தப் பதிவை இயக்கு
```

## IDE ஒருங்கிணைப்பு

### Visual Studio Code
Azure Developer CLI விரிவேதனை நிறுவவும்:
1. VS Code ஐ திறக்கவும்
2. விரிவாக்கங்களுக்கு செல் (Ctrl+Shift+X)
3. "Azure Developer CLI" என்று தேடுங்கள்
4. விரிவேதனையை நிறுவுங்கள்

சிறப்பம்சங்கள்:
- azure.yaml க்கான IntelliSense
- ஒருங்கிணைக்கப்பட்ட டெர்மினல் கட்டளைகள்
- வார்ப்புரு உலாவல்
- உருவாக்க படிநிலைகளை கண்காணிப்பு

### GitHub Codespaces
ஒரு `.devcontainer/devcontainer.json` உருவாக்கவும்:
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
1. Azure பிளக்கினை நிறுவவும்
2. Azure அத்தாட்சிப் பதிவுகளை கட்டமைக்கவும்
3. azd கட்டளைகளுக்காக ஒருங்கிணைக்கப்பட்ட டெர்மினலைப் பயன்படுத்தவும்

## 🐛 நிறுவலில் பிழைத்திருத்தம்

### பொதுவான பிரச்சனைகள்

#### அனுமதி மறுக்கப்பட்டது (Windows)
```powershell
# PowerShell ஐ நிர்வாகி உரிமைகளுடன் இயக்கவும்.
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH பிரச்சனைகள்
azd ஐ உங்கள் PATH இல் கைமுறையாக சேர்க்கவும்:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### நெட்வொர்க்/ப்ராக்சி பிரச்சனைகள்
```bash
# ப்ராக்ஸியை அமைக்கவும்
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL சான்றிதழ் சரிபார்ப்பை தவிர்க்கவும் (உற்பத்தி பயன்பாட்டிற்கு பரிந்துரைக்கப்படவில்லை)
azd config set http.insecure true
```

#### பதிப்பு மோதல்கள்
```bash
# பழைய நிறுவல்களை அகற்று
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# கட்டமைப்பை சுத்தம் செய்யவும்
rm -rf ~/.azd
```

### கூடுதல் உதவி பெற
```bash
# பிழைதிருத்தப் பதிவுகளை இயக்கு
export AZD_DEBUG=true
azd <command> --debug

# தற்போதைய கட்டமைப்பை காண்க
azd config list

# தற்போதைய வினியோக நிலையை காண்க
azd show
```

## azd ஐ புதுப்பித்தல்

### தானாக புதுப்பிப்புகள்
azd புதுப்பிப்புகள் கிடைக்கும்போது உங்களுக்கு அறிவிக்கப்படும்:
```bash
azd version --check-for-updates
```

### கைமுறை புதுப்பிப்புகள்

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

## 💡 அடிக்கடி கேட்கப்படும் கேள்விகள்

<details>
<summary><strong>azd மற்றும் az CLI இன் மாறுபாடு என்ன?</strong></summary>

**Azure CLI (az)**: தனிப்பட்ட Azure வளங்களை நிர்வகிப்பதற்கான குறைந்த நிலை கருவி
- `az webapp create`, `az storage account create`
- ஒரு வளம் ஒரே நேரத்தில்
- அடிப்படை கட்டமைப்பு நிர்வாகம் மீது கவனம்

**Azure Developer CLI (azd)**: முழுமையான பயன்பாடுகளை உருவாக்குவதற்கான உயர் நிலை கருவி
- `azd up` அனைத்து வளங்களுடனும் முழு பயன்பாட்டை பிரவசிக்கிறது
- வார்ப்புரு அடிப்படையிலான வேலைநடவடிக்கைகள்
- டெவலப்பர் உற்பத்தித்திறன் மீது கவனம்

**உங்களுக்கு இரண்டுமே தேவை**: azd அங்கீகாரத்திற்கு az CLI யைப் பயன்படுத்துகிறது
</details>

<details>
<summary><strong>இது ஏற்கனவே உள்ள Azure வளங்களுடன் azd ஐப் பயன்படுத்த முடியுமா?</strong></summary>

ஆம்! நீங்கள் செய்யக் கூடியவை:
1. ஏற்கனவே உள்ள வளங்களை azd சூழல்களில் இறக்குமதி செய்யவும்
2. உங்கள் Bicep வார்ப்புருக்களில் ஏற்கனவே உள்ள வளங்களை குறிப்பிட்டு பயன்படுத்தவும்
3. புதிய பிரவசிப்புகளுக்காக azd ஐ ஏற்கனவே உள்ள உட்பொதிகளுடன் இணைத்து பயன்படுத்தவும்

விவரங்களுக்கு [கட்டமைப்பு வழிகாட்டி](configuration.md) பார்க்கவும்.
</details>

<details>
<summary><strong>azd Azure Government அல்லது Azure China உடன் வேலை செய்யுமா?</strong></summary>

ஆம், கிளவுட்டை கட்டமைக்கவும்:
```bash
# Azure அரசு
az cloud set --name AzureUSGovernment
az login

# Azure சீனா
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>azd ஐ CI/CD குழாய்களில் பயன்படுத்த முடியுமா?</strong></summary>

நிச்சயமாக! azd தன்னியக்கத்திற்கு உருவாக்கப்பட்டுள்ளது:
- GitHub Actions ஒருங்கிணைப்பு
- Azure DevOps ஆதரவு
- சேவை பிரதிநிதி அங்கீகாரம்
- இடையீட்டில்லாத (non-interactive) முறை

CI/CD வடிவமைப்புகளுக்காக [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) பார்க்கவும்.
</details>

<details>
<summary><strong>azd பயன்படுத்துவதின் செலவு என்ன?</strong></summary>

azd தானாகவே **முழுமையாக இலவசம்** மற்றும் திறந்த மூலமாக உள்ளது. நீங்கள் செலவு செலுத்துவது:
- நீங்கள் உருவாக்கும் Azure வளங்களுக்கு
- Azure பயனளவு செலவுகள் (compute, storage மற்றும் இதரவை)

பிரவசிக்கும்முன் செலவுகளை மதிப்பிட `azd provision --preview` பயன்படுத்தவும்.
</details>

## அடுத்த படிகள்

1. **அங்கீகாரம் முழுமையாக்கவும்**: உங்கள் Azure சந்தாவை அணுக முடிகிறது என்பதை உறுதிசெய்யவும்
2. **உங்கள் முதல் பிரவசிப்பு முயற்சி செய்க**: [First Project Guide](first-project.md) பின்பற்றவும்
3. **வார்ப்புருக்களை ஆராய்ந்து பழகவும்**: `azd template list` கொண்டு கிடைக்கும் வார்ப்புருக்களை உலாவவும்
4. **IDE ஐ கட்டமைக்கவும்**: உங்கள் உருவாக்க சூழலை அமைக்கவும்

## ஆதரவு

பிரச்சினைகள் வந்தால்:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - `npx skills add microsoft/github-copilot-for-azure` கொண்டு உங்கள் எடிட்டரில் நேரடியாக Azure கட்டளை வழிகாட்டலைப் பெறுங்கள்

---

**அத்தியாயம் வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD தொடக்கத்திற்கான](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 1 - அடித்தளம் மற்றும் விரைவு தொடக்கம்
- **⬅️ முந்தையது**: [AZD அடிப்படைகள்](azd-basics.md) 
- **➡️ அடுத்தது**: [உங்கள் முதல் проект](first-project.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 2: AI-முதலாளர் வளர்ச்சி](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ நிறுவல் முடிந்தது!** azd கொண்டு கட்டமைக்கத் தொடங்க [உங்கள் முதல் проект](first-project.md) தொடரவும்.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு அறிவிப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், தானியங்கித் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது துல்லியமின்மைகள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனிக்கவும். மூல மொழியில் உள்ள அசல் ஆவணத்தையே அதிகாரப்பூர்வமான மூலம் எனக் கருத வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பை பயன்படுத்துவதால் ஏற்படும் எந்தவொரு தவறான புரிதலுக்கும் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பேற்படமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->