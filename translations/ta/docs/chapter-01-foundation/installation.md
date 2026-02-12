# நிறுவல் மற்றும் அமைப்பு வழிகாட்டு

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD புதியவர்களுக்கு](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 1 - அடித்தளம் மற்றும் விரைவு ஆரம்பம்
- **⬅️ முந்தையது**: [AZD அடிப்படைகள்](azd-basics.md)
- **➡️ அடுத்தது**: [உங்கள் முதல் திட்டம்](first-project.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 2: AI-முதன்மை வளர்ச்சி](../chapter-02-ai-development/microsoft-foundry-integration.md)

## அறிமுகம்

இந்த விரிவான கையேடு உங்கள் அமைப்பில் Azure Developer CLI (azd) ஐ நிறுவி மற்றும் தொகுப்பதில் உங்களை வழிநடத்தும். வெவ்வேறு செயல்பாட்டு அமைப்புகளுக்கான பல நிறுவல் முறைகள், அங்கீகார அமைப்பு மற்றும் Azure பயனிலைவிற்கு உங்கள் டெவலப்மெண்ட் சூழலைத் தயாரிப்பதற்கான ஆரம்ப கட்ட வகைகள் ஆகியவை இதில் உள்ளன.

## கற்கும் இலக்குகள்

இந்த பாடம் முடிந்தோரை நீங்கள்:
- உங்கள் செயல்பாட்டு அமைப்பிற்கு பொருத்தமான முறையில் Azure Developer CLI ஐ வெற்றிகரமாக நிறுவ
- பல்வேறு முறைகளில் Azure உடன் அங்கீகாரம்-configure செய்ய
- தேவையான முன்னோக்கிச் சோதனைகள் உடன் உங்கள் டெவலப்மெண்ட் சூழலை அமைக்க
- வெவ்வேறு நிறுவல் விருப்பங்களை மற்றும் எப்போது எந்ததை பயன்படுத்த வேண்டும் என்பதை புரிந்து கொள்
- சாதாரண நிறுவல் மற்றும் அமைப்பு சிக்கல்களை சரிசெய்

## கற்றல் விளைவுகள்

இந்த பாடத்தை முடித்த பிறகு, நீங்கள் செய்யக்கூடியவை:
- உங்கள் தளத்திற்கு பொருத்தமான முறையில் azd ஐ நிறுவ
- azd auth login பயன்படுத்தி Azure உடன் அங்கீகாரம் ஏற்படுத்த
- உங்கள் நிறுவலை சரிபார்த்து அடிப்படை azd கட்டளைகளை சோதனை செய்
- ஆதரவு azd பயன்பாட்டுக்கு உங்கள் டெவலப்மெண்ட் சூழலை வடிவமை
- சாதாரண நிறுவல் பிரச்சனைகளை தன்னிச்சையாக தீர்க்க

இந்த கையேடு உங்கள் இயந்திரத்தில் Azure Developer CLI ஐ எந்த செயல்பாட்டு அமைப்பாக இருந்தாலும் நிறுவி தொகுப்பதில் உதவும்.

## முன்னோட்ட தேவைகள்

azd ஐ நிறுவுமுன், நீங்கள் கிழ்கண்டவற்றைக் கொண்டிருக்க வேண்டும்:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - அங்கீகாரம் மற்றும் வள மேலாண்மை varten
- **Git** - டெம்ப்ளேடுகளை கிளோன் செய்தல் மற்றும் பதிப்புக் கட்டுப்பாடு
- **Docker** (ঐச்சரியம்) - கான்டெயினார் அடிப்படையிலான செயலிகள் জন্য

## நிறுவல் முறைகள்

### Windows

#### விருப்பம் 1: PowerShell (பரிந்துரைக்கப்படுகிறது)
```powershell
# நிர்வாகியாக அல்லது உயர்மட்ட அனுமதிகளுடன் இயக்கவும்
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### விருப்பம் 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### விருப்பம் 3: Chocolatey
```cmd
choco install azd
```

#### விருப்பம் 4: கைமுறை நிறுவல்
1. [GitHub](https://github.com/Azure/azure-dev/releases) இருந்து சமீபத்திய வெளியீட்டை загрузka செய்யவும்
2. `C:\Program Files\azd\` என استخراج செய்க
3. PATH சுற்றுச்சூழல் மாறிலிக்கு சேர்க்கவும்

### macOS

#### விருப்பம் 1: Homebrew (பரிந்துரைக்கப்படுகிறது)
```bash
brew tap azure/azd
brew install azd
```

#### விருப்பம் 2: நிறுவல் ஸ்கிரிப்ட்
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### விருப்பம் 3: கைமுறை நிறுவல்
```bash
# பதிவிறக்கம் செய்து நிறுவவும்
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### விருப்பம் 1: நிறுவல் ஸ்கிரிப்ட் (பரிந்துரைக்கப்படுகிறது)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### விருப்பம் 2: தொகுப்பு மேலாளர்கள்

**Ubuntu/Debian:**
```bash
# Microsoft பேக்கேஜ் களஞ்சியத்தை சேர்க்கவும்
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd ஐ நிறுவவும்
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft பேக்கேஜ் களஞ்சியத்தைச் சேர்க்கவும்
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd GitHub Codespaces இல் முன்னிருக்கை நிறுவப்பட்டளவில் வருகிறது. ஒரு codespace உருவாக்கி உடனே azd ஐ பயன்படுத்த தொடங்கவும்.

### Docker

```bash
# azd ஐ ஒரு கொண்டெய்னரில் இயக்கவும்
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# எளிதாக பயன்படுத்த ஒரு மறுபெயரை உருவாக்கவும்
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ நிறுவல் சரிபார்க்கவும்

நிறுவலுக்குப் பிறகு, azd சரியாக செயல்படுகிறதா என சரிபார்க்கவும்:

```bash
# பதிப்பை சரிபார்க்கவும்
azd version

# உதவியைப் பார்க்கவும்
azd --help

# கிடைக்கும் வார்ப்புருக்களைப் பட்டியலிடவும்
azd template list
```

எதிர்பார்க்கப்படும் வெளியீடு:
```
azd version 1.x.x (commit xxxxxx)
```

**குறிப்பு**: πραγματική பதிப்பு எண் மாறுபடும். சமீபத்திய பதிப்புக்கு [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) ஐ பரிசீலிக்கவும்.

**✅ நிறுவல் வெற்றி சரிபார்ப்பு பட்டியல்:**
- [ ] `azd version` எந்த பிழையுமின்றி பதிப்பு எண்ணை காட்டுகிறது
- [ ] `azd --help` கட்டளைக் குறியீட்டை காட்டுகிறது
- [ ] `azd template list` கிடைக்கக்கூடிய டெம்ப்ளேடுகளை காட்டுகிறது
- [ ] `az account show` உங்கள் Azure subscription ஐ காட்டு
- [ ] நீங்கள் ஒரு சோதனை அடைவை உருவாக்கி `azd init` ஐ வெற்றிகரமாக இயக்க முடிகிறது

**எல்லா சரிபார்ப்புகளும் கடந்தால், நீங்கள் [உங்கள் முதல் திட்டம்](first-project.md) தொடர தயாராக இருக்கிறீர்கள்!**

## அங்கீகாரம் அமைத்தல்

### Azure CLI மூலம் அங்கீகாரம் (பரிந்துரைக்கப்படுகிறது)
```bash
# Azure CLI இன்னும் நிறுவப்படவில்லையெனில் நிறுவவும்
# விண்டோஸ்: winget install Microsoft.AzureCLI
# மேக்ஓஎஸ்: brew install azure-cli
# லினக்ஸ்: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure இல் உள்நுழையவும்
az login

# அங்கீகாரத்தை சரிபார்க்கவும்
az account show
```

### கருவி குறியீட்டு அம்சம் (Device Code Authentication)
நீங்கள் தலை இல்லா அமைப்பில் இருந்தால் அல்லது உலாவியில் பிரச்சனைகள் இருந்தால்:
```bash
az login --use-device-code
```

### சேவை பிரதிநிதி (CI/CD)
தானியங்கி சூழல்களுக்கு:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## அமைப்புகள்

### உலகளாவிய அமைப்புகள்
```bash
# இயல்புநிலை சந்தாவை அமைக்க
azd config set defaults.subscription <subscription-id>

# இயல்புநிலை இடத்தை அமைக்க
azd config set defaults.location eastus2

# அனைத்து கட்டமைப்புகளையும் காண்க
azd config list
```

### சூழல் மாறிலிகள்
உங்கள் ஷெல் پروஃபைலில் (`.bashrc`, `.zshrc`, `.profile`) சேர்க்கவும்:
```bash
# Azure கட்டமைப்பு
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd கட்டமைப்பு
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # டீபக் பதிவுகளை செயல்படுத்தவும்
```

## IDE ஒருங்கிணைப்பு

### Visual Studio Code
Azure Developer CLI நீட்சியை நிறுவவும்:
1. VS Code திறக்கவும்
2. Extension களுக்கு செல்லவும் (Ctrl+Shift+X)
3. "Azure Developer CLI" என்பதை தேடவும்
4. நீட்சியை நிறுவவும்

அம்சங்கள்:
- azure.yaml க்கான IntelliSense
- ஒருங்கிணைந்த டெர்மினலில் கட்டளைகள்
- டெம்ப்ளேட் உலாவல்
- மேம்படுத்தல் கண்காணிப்பு

### GitHub Codespaces
`.devcontainer/devcontainer.json` உருவாக்கவும்:
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
1. Azure பிளகினை நிறுவவும்
2. Azure அங்கீகாரங்களை தொகுக்கவும்
3. azd கட்டளைகளுக்கு ஒருங்கிணைந்த டெர்மினலைப் பயன்படுத்தவும்

## 🐛 நிறுவல் பிழைத்திருத்தம்

### பொதுவான பிரச்சனைகள்

#### அனுமதி நெறிக்கப்பட்டது (Windows)
```powershell
# PowerShell-ஐ நிர்வாகி உரிமையில் இயக்கவும்
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH பிரச்சனைகள்
azd ஐ உங்கள் PATH இல் கைமுறையாகச் சேர்க்கவும்:

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

# SSL சரிபார்ப்பை தவிர்க்கவும் (உற்பத்தி சூழலுக்கு பரிந்துரைக்கப்படவில்லை)
azd config set http.insecure true
```

#### பதிப்பு முரண்பாடுகள்
```bash
# பழைய நிறுவல்களை அகற்று
# விண்டோஸ்: winget uninstall Microsoft.Azd
# மேக்OS: brew uninstall azd
# லினக்ஸ்: sudo apt remove azd

# கட்டமைப்பை சுத்தம் செய்
rm -rf ~/.azd
```

### மேலும் உதவி பெறுவது எப்படி
```bash
# டீபக் பதிவு செயல்படுத்தவும்
export AZD_DEBUG=true
azd <command> --debug

# தற்போதைய கட்டமைப்பை பார்க்கவும்
azd config list

# தற்போதைய வெளியீட்டு நிலையை பார்க்கவும்
azd show
```

## azd புதுப்பித்தல்

### தானியங்கி புதுப்பிப்புகள்
azd புதுப்பிப்புகள் கிடைக்கும் போது உங்களுக்குத் தகவல் தரும்:
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
<summary><strong>azd மற்றும் az CLI இல் என்ன வேறுபாடு?</strong></summary>

**Azure CLI (az)**: தனி Azure வளங்களை நிர்வகிப்பதற்கான குறைந்த-அளவிலான கருவி
- `az webapp create`, `az storage account create`
- ஒரு நேரத்தில் ஒரு வளம்
- உருவாக்க நிர்வாக கவனம்

**Azure Developer CLI (azd)**: முழு பயன்பாட்டு வெளியீடுகளுக்கான உயர்-அளவிலான கருவி
- `azd up` முழுப் பயன்பாட்டையும் அனைத்து வளங்களுடன் deploy செய்கிறது
- டெம்ப்ளேட் அடிப்படையிலான வேலைநடத்தல்கள்
- டெவலப்பர் உற்பத்தித்திறன் கவனம்

**இரண்டும் இரண்டையும் அவசியம்**: azd அங்கீகாரத்திற்காக az CLI ஐப் பயன்படுத்துகிறது
</details>

<details>
<summary><strong>நான் உள்ளமைந்த Azure வளங்களுடன் azd ஐப் பயன்படுத்தலாம嗎?</strong></summary>

ஆம்! நீங்கள் முடியும்:
1. உள்ளமைந்த வளங்களை azd சுற்றுச்சூழல்களில் இறக்குமதி செய்ய
2. உங்கள் Bicep டெம்ப்ளேடுகளில் உள்ளமைந்த வளங்களை குறிப்பிட்டு பயன்படுத்த
3. புதிய வெளியீடுகளுக்கு azd ஐ உள்ளமைந்த அட架ணையுடன் இணைத்து பயன்படுத்த

விவரங்களுக்கு [Configuration Guide](configuration.md) ஐப் பார்க்கவும்.
</details>

<details>
<summary><strong>azd Azure Government அல்லது Azure China உடன் செயல்படுமா?</strong></summary>

ஆம், கிளவுட் ஐ அமைக்கவும்:
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
<summary><strong>azd ஐ CI/CD குழுக்களில் பயன்படுத்தலாமா?</strong></summary>

முழுமையாக! azd தானியக்கத்திற்காக வடிவமைக்கப்பட்டுள்ளது:
- GitHub Actions ஒருங்கிணைப்பு
- Azure DevOps ஆதரவு
- சேவை பிரதிநிதி அங்கீகாரம்
- தொடர்பற்ற (non-interactive) முறை

CI/CD வடிவமைப்புகளுக்கு [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) ஐப் பார்க்கவும்.
</details>

<details>
<summary><strong>azd பயன்படுத்துவதின் செலவு என்ன?</strong></summary>

azd தானாகவே **முழுமையாக இலவசம்** மற்றும் திறந்த மூலத்தைக் கொண்டது. நீங்கள் மட்டுமே செலுத்துவது:
- நீங்கள் deploy செய்த Azure வளங்கள்
- Azure பயனீட்டு செலவுகள் (compute, storage, மற்றும் மற்றவை)

வெளியீட்டுக்கு முன் செலவுகளை மதிப்பிட `azd provision --preview` ஐ பயன்படுத்தவும்.
</details>

## அடுத்த படிகள்

1. **அங்கீகாரம் முடிக்கவும்**: உங்கள் Azure subscription ஐ அணுக முடிகிறதா என்று உறுதிசெய்
2. **உங்கள் முதல் வெளியீட்டை முயற்சி செய்யவும்**: [First Project Guide](first-project.md) ஐ பின்பற்றவும்
3. **டெம்ப்ளேடுகளை ஆராயவும்**: `azd template list` கொண்டு கிடைக்கும் டெம்ப்ளேடுகளை உலாவு
4. **உங்கள் IDE ஐ அமைக்கவும்**: உங்கள் டெவலப்மெண்ட் சூழலை அமைக்கவும்

## ஆதரவு

சிக்கல்களை சந்தித்தால்:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD புதியவர்களுக்கு](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 1 - அடித்தளம் மற்றும் விரைவு ஆரம்பம்
- **⬅️ முந்தையது**: [AZD அடிப்படைகள்](azd-basics.md) 
- **➡️ அடுத்தது**: [உங்கள் முதல் திட்டம்](first-project.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 2: AI-முதன்மை வளர்ச்சி](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ நிறுவல் முடிந்தது!** azd கொண்டு கட்டமைப்பைத் தொடங்க [உங்கள் முதல் திட்டம்](first-project.md) ல் தொடரவும்.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்புரை:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான Co-op Translator (https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்தாலும், தன்னிச்சையான மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அச்சு ஆவணம் அதன் தாய்மொழியில் தான் அதிகாரபூர்வமான ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, ஒரு தொழில்முறை மனித மொழிபெயர்ப்பாளர் மூலம் மொழிபெயர்ப்பு செய்யப்படவேண்டும் என்று பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பினைப் பயன்படுத்தியதால் எழுகின்ற எந்த தவறான புரிதல்களுக்கும் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பேற்க மாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->