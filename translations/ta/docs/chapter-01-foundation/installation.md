# நிறுவல் மற்றும் அமைப்பு கையேடு

**அத்தியாய செல்லும் வழி:**
- **📚 பாடநெறி முகப்பு**: [AZD ஆரம்பர்களுக்கான](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 1 - அடிப்படை மற்றும் துவக்கத்திற்கான வழிகாட்டி
- **⬅️ முந்தையது**: [AZD அடிப்படைகள்](azd-basics.md)
- **➡️ அடுத்தது**: [உங்கள் முதல் 프로젝트](first-project.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 2: AI-முதன்மையாக்கப்பட்ட அபிவிருத்தி](../chapter-02-ai-development/microsoft-foundry-integration.md)

## அறிமுகம்

இந்த விரிவான கையேடு உங்கள் கணினியில் Azure Developer CLI (azd) ஐ நிறுவி அமைப்பதைப் பற்றி வழிகாட்டும். வேறு வெவ்வேறு செயலியில் பல நிறுவல் முறைகள், அங்கீகாரம் அமைத்தல் மற்றும் Azure செலுத்தல்களுக்கு உங்கள் அபிவிருத்தி சுற்றுச்சூழலைத் தயாரிப்பதற்கான ஆரம்ப கட்டமைப்புகள் பற்றி கற்று கொள்வீர்கள்.

## கற்றல் இலக்குகள்

இந்த பாடம் முடிந்தவுடன், நீங்கள்:
- உங்கள் செயலியில் Azure Developer CLI வெற்றிகரமாக நிறுவ முடியும்
- பல முறைமைகளைப் பயன்படுத்தி Azure உடன் அங்கீகாரம் அமைக்க முடியும்
- தேவையான முன்னோக்கியங்களை கொண்டு உங்கள் அபிவிருத்தி சுற்றுச்சூழலை அமைக்க முடியும்
- வெவ்வேறு நிறுவல் விருப்பங்களைப் புரிந்து கொண்டு எப்போது எதைப் பயன்படுத்த வேண்டும் என்பதை அறிகிறீர்கள்
- பொதுவான நிறுவல் மற்றும் அமைப்பு சிக்கல்களை தீர்க்கக் கற்றுக்கொள்வீர்கள்

## கற்றல் முடிவுகள்

இந்த பாடத்தை முடித்தபின்னர், நீங்கள் செயல்படுத்தக்கூடியவைகள்:
- உங்கள் தளத்திற்கு பொருத்தமான முறையை பயன்படுத்தி azd ஐ நிறுவ முடியும்
- `azd auth login` பயன்படுத்தி Azure உடன் அங்கீகரிக்க முடியும்
- உங்கள் நிறுவலைச் சரிபார்த்தும் அடிப்படை azd கட்டளைகளைச் சோதிக்க முடியும்
- azd பயனுக்கு உகந்த வகையில் உங்கள் அபிவிருத்தி சுற்றுச்சூழலை அமைக்க முடியும்
- பொதுவான நிறுவல் பிரச்சனைகளை தனக்கே தீர்க்க முடியும்

இந்தக் கையேடு உங்கள் செயலி அல்லது அபிவிருத்தி சூழல் எந்த வகையிலும் இருந்தாலும் Azure Developer CLI ஐ நிறுவி அமைக்க உதவும்.

## முன் நிபந்தனைகள்

azd ஐ நிறுவுவதற்கு முன், உங்களிடம் இருப்பதை உறுதிசெய்யவும்:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - அங்கீகாரம் மற்றும் வள மேலாண்மைக்கானது
- **Git** - வார்ப்புருக்களை கிளோன் செய்தல் மற்றும் பதிப்புக் கட்டுப்பாட்டு
- **Docker** (விருப்பத்தைப்பொறுத்தது) - 컨ெய்னரை பயனுடைய செயலிகளுக்காக

## நிறுவல் முறைகள்

### Windows

#### விருப்பம் 1: Windows Package Manager (பரிந்துரைக்கப்படுகிறது)
```cmd
winget install microsoft.azd
```

#### விருப்பம் 2: PowerShell Install Script
```powershell
# winget கிடைக்காத போது பயனுள்ளது
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### விருப்பம் 3: Chocolatey
```cmd
choco install azd
```

#### விருப்பம் 4: கைமுறை நிறுவல்
1. இறுதி வெளியீட்டை [GitHub](https://github.com/Azure/azure-dev/releases) இலிருந்து பதிவிறக்கவும்
2. `C:\Program Files\azd\` என்ற இடத்தில் பிழுச்செய்தல்
3. PATH சுற்றுப்பாதையில் சேர்க்கவும்

### macOS

#### விருப்பம் 1: Homebrew (பரிந்துரைக்கப்படுகிறது)
```bash
brew tap azure/azd
brew install azd
```

#### விருப்பம் 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### விருப்பம் 3: கைமுறை நிறுவல்
```bash
# பதிவிறக்கவும் நிறுவவும்
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### விருப்பம் 1: Install Script (பரிந்துரைக்கப்படுகிறது)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### விருப்பம் 2: Package Managers

**வெளியீட்டு சொத்துகளிலிருந்து கைமுறை நிறுவல்:**
```bash
# உங்கள் Linux கட்டமைப்புக்கான சமீபத்திய காப்பகக் கோப்பை இங்கே இருந்து பதிவிறக்கவும்:
# https://github.com/Azure/azure-dev/releases
# பின்னர் அதை விரித்து azd பைனரியை உங்கள் PATH-இல் சேர்க்கவும்.
```

### GitHub Codespaces

சில Codespaces மற்றும் dev container சுற்றுச்சூழல்கள் ஏற்கனவே `azd` ஐ அடக்கி இருக்கலாம், ஆனால் அது இருக்கிறதா என்பதைக் கணக்குபடுத்திப் பார்க்க வேண்டும், ஊகிக்க வேண்டாம்:

```bash
azd version
```

`azd` காணாமல் பூட்டப்பட்டிருந்தால், அந்த சுற்றுச்சூழலுக்கு பொருத்தமான ஸ்டாண்டர்டு ஸ்க்ரிப்ட் கொண்டு நிறுவவும்.

### Docker

```bash
# azd ஐ ஒரு கொண்டெய்னரில் இயக்கவும்
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# எளிதாக பயன்படுத்துவதற்காக ஒரு மறைப்பெயர் உருவாக்கவும்
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ நிறுவலை உறுதிசெய்

நிறுவலுக்குப் பிறகு, azd சரியாக வேலை செய்கிறதா என்று உறுதிசெய்யவும்:

```bash
# பதிப்பை சரிபார்க்க
azd version

# உதவியைப் பார்க்க
azd --help

# கிடைக்கும் வார்ப்புருக்கள் பட்டியலிடு
azd template list
```

எதிர்பார்க்கப்படும் வெளியீடு:
```
azd version 1.x.x (commit xxxxxx)
```

**குறிப்பு**: உண்மையான பதிப்பு எண்ணிக்கை மாறுபடும். சமீபத்திய பதிப்புக்காக [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) ஐப் பார்க்கவும்.

**✅ நிறுவல் வெற்றி சரிபார்ப்பு பட்டியல்:**
- [ ] `azd version` பிழைகள் இல்லாமல் பதிப்பு எண்ணிக்கையை காட்டுகிறது
- [ ] `azd --help` கட்டளை ஆவணங்களை காட்டு
- [ ] `azd template list` கிடைக்கக்கூடிய வார்ப்புருக்களை காட்டு
- [ ] ஒரு சோதனை அடைவை உருவாக்கி `azd init` ஐ வெற்றிகரமாக இயக்க முடிகிறது

**எல்லா சரிபார்ப்புகளும் முடிந்தால், [உங்கள் முதல் 프로젝트](first-project.md) க்கு தொடரலாம்!**

## அங்கீகாரம் அமைப்பு

### புதியவருக்கான பரிந்துரைக்கப்பட்ட அமைப்பு

AZD-முதன்மை பணிமுறைகளுக்கு, `azd auth login` மூலம் உள்நுழையவும்.

```bash
# azd up போன்ற AZD கட்டளைகளுக்கு அவசியம்
azd auth login

# AZD அங்கீகார நிலையை சரிபார்க்கவும்
azd auth login --check-status
```

கோர்சின் போது நீங்கள் நேரடியாக `az` கட்டளைகளை இயக்கத் திட்டமிடுகின்றால் மட்டுமே Azure CLI உள்நுழைவைப் பயன்படுத்தவும்.

### Azure CLI அங்கீகாரம் (விருப்பம்)
```bash
# Azure CLI ஏற்கனவே நிறுவப்படாவிட்டால் அதை நிறுவவும்
# விண்டோஸ்: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: உங்கள் டிஸ்ட்ரோவிற்கான Azure CLI நிறுவல் ஆவணங்களைப் பார்க்கவும்

# Azure இல் உள்நுழைக
az login

# அங்கீகாரத்தை சரிபார்க்கவும்
az account show
```

### நீங்கள் எந்த உள்நுழைவு ஓடையைப் பயன்படுத்த வேண்டும்?

- நீங்கள் ஆரம்ப நிலை AZD பாதையை பின்பற்றும் மற்றும் பெரும்பாலும் `azd` கட்டளைகளை இயக்கினால் `azd auth login` ஐப் பயன்படுத்தவும்.
- நீங்கள் `az account show` போன்ற Azure CLI கட்டளைகளைப் பயன்படுத்த விரும்பினால் `az login` ஐவும் பயன்படுத்தவும்.
- ஒரு பயிற்சி இரு `azd` மற்றும் `az` கட்டளைகளையும் கொண்டிருந்தால், தொடக்கத்தில் இரண்டும் ஒருமுறை உள்நுழையவும்.

### சாதனக் குறியீடு அங்கீகாரம்
நீங்கள் தலை இல்லாத (headless) அமைப்பில் இருந்தால் அல்லது உலாவி பிரச்சனை இருந்தால்:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
தானியங்கி சூழல்களுக்காக:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### உங்கள் முழு அமைப்பைச் சரிபார்க்கவும்

அத்தியாயம் 1 தொடங்குவதற்கு முன் ஒரு விரைவு தயார்மைச் சோதனை செய்யவேண்டுமெனில்:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## கட்டமைப்பு

### உலகளாவிய அமைப்பு
```bash
# இயல்புநிலை சந்தாவை அமைக்க
azd config set defaults.subscription <subscription-id>

# இயல்புநிலை இடத்தை அமைக்க
azd config set defaults.location eastus2

# அனைத்து கட்டமைப்புகளையும் காண்க
azd config show
```

### சுற்றுச்சூழல் மாறிகள்
உங்கள் shell profile (`.bashrc`, `.zshrc`, `.profile`) இல் சேர்க்கவும்:
```bash
# Azure கட்டமைப்பு
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd கட்டமைப்பு
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # பிழைப்புலனாய்வு பதிவுகளை செயல்படுத்தவும்
```

## IDE ஒருங்கிணைப்பு

### Visual Studio Code
Azure Developer CLI விரிவுருகை நிறுவுக:
1. VS Code திறக்கவும்
2. நீட்சிகள் (Extensions) (Ctrl+Shift+X) சென்று
3. "Azure Developer CLI" ஐ தேடவும்
4. விரிவுரையை நிறுவவும்

அம்சங்கள்:
- azure.yaml க்கான IntelliSense
- ஒருங்கிணைக்கப்பட்ட டெர்மினல் கட்டளைகள்
- வார்ப்புரு உலாவல்
- deployment கண்காணிப்பு

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
1. Azure பிளகின் நிறுவவும்
2. Azure அங்கீகாரத் தகவல்களை அமைக்கவும்
3. azd கட்டளைகளுக்கு ஒருங்கிணைக்கப்பட்ட டெர்மினலைப் பயன்படுத்தவும்

## 🐛 நிறுவல் பிழை தீர்க்குதல்

### சாதாரண பிரச்சனைகள்

#### அனுமதி மறுக்கப்பட்டது (Windows)
```powershell
# PowerShell-ஐ நிர்வாகி உரிமைகளுடன் இயக்கவும்
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
# ப்ராக்ஸியை கட்டமைக்கவும்
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL சரிபார்ப்பை தவிர்க்கவும் (உற்பத்தி சூழலுக்கு பரிந்துரைக்கப்படவில்லை)
azd config set http.insecure true
```

#### பதிப்பு மோதல்கள்
```bash
# பழைய நிறுவல்களை அகற்று
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: மறுநிறுவல் செய்வதற்கு முன் முந்தைய azd பைனரி அல்லது symlink-ஐ நீக்கவும்

# கட்டமைப்பை சுத்தம் செய்
rm -rf ~/.azd
```

### மேலும் உதவி பெறுதல்
```bash
# டீபக் பதிவு இயக்கவும்
export AZD_DEBUG=true
azd <command> --debug

# தற்போதைய கட்டமைப்பைக் காண்க
azd config show

# தற்போதைய டிப்ளாய்மென்ட் நிலையை காண்க
azd show
```

## azd புதுப்பித்தல்

### புதுப்பிப்பு சரிபார்ப்பு
azd புதிய வெளியீடு கிடைக்கும் போது எச்சரிக்கையடைகிறது, உங்கள் தற்போதைய கட்டமைப்பை உறுதிசெய்ய:
```bash
azd version
```

### கைமுறை புதுப்பிப்புகள்

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

## 💡 அடிக்கடி கேட்கப்படும் கேள்விகள்

<details>
<summary><strong>azd மற்றும் az CLI இடையிலான வித்தியாசம் என்ன?</strong></summary>

**Azure CLI (az)**: தனித்த Azure வளங்களை நிர்வகிப்பதற்கான குறைந்த-அளவிலான கருவி
- `az webapp create`, `az storage account create`
- ஒரு நேரத்தில் ஒரு வளம்
- உள்கட்டமைப்பு மேலாண்மை மையமாக உள்ளது

**Azure Developer CLI (azd)**: முழு பயன்பாட்டு பரிமாற்றங்களுக்கான உயர்-அளவிலான கருவி
- `azd up` அனைத்து வளங்களுடனும் முழு பயன்பாட்டை ஒருங்கிணைத்து விநியோகிக்கிறது
- வார்ப்புரு-அடிப்படையிலான பணிமுறைகள்
- அபிவிருத்தி தரமான உற்பத்தித்திறன் மையம்

**இரண்டும் தேவையானவை**: azd அஙீகாரத்திற்கு az CLI ஐப் பயன்படுத்துகிறது
</details>

<details>
<summary><strong>நான் ஏற்கனவே உள்ள Azure வளங்களுடன் azd ஐப் பயன்படுத்தலாமா?</strong></summary>

ஆம்! நீங்கள் முடியும்:
1. உள்ள வளங்களை azd சூழல்களில் இறக்குமதி செய்தல்
2. உங்கள் Bicep வார்ப்புருக்களில் உள்ள வளங்களை குறிப்பிட்டு பயன்படுத்துதல்
3. உள்ள கட்டமைப்புடன் இணைந்து புதிய விநியோகங்களுக்காக azd பயன்படுத்துதல்

விவரங்களுக்கு [Configuration Guide](configuration.md) ஐப் பார்க்கவும்.
</details>

<details>
<summary><strong>azd Azure Government அல்லது Azure China உடனா வேலை செய்கிறது?</strong></summary>

ஆம், கிளவுடை அமைக்கவும்:
```bash
# Azure அரசாங்கம்
az cloud set --name AzureUSGovernment
az login

# Azure சீனா
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>CI/CD குழாய்களில் azd ஐப் பயன்படுத்தலாமா?</strong></summary>

முழுமையாக! azd தானியக்கத்திற்காக வடிவமைக்கப்பட்டுள்ளது:
- GitHub Actions ஒருங்கிணைப்பு
- Azure DevOps ஆதரவு
- Service principal அங்கீகாரம்
- இல்லாத-இணையமைப்பு (non-interactive) முறையுடன் பயன்படுத்தல்

CI/CD ஒழுங்குகளுக்கான ஓட்டுமுறைக்கான விவரங்களுக்கு [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) ஐப் பார்க்கவும்.
</details>

<details>
<summary><strong>azd பயன்படுத்துவதற்கான செலவு எவ்வளவு?</strong></summary>

azd தானே **முழுமையாக இலவசம்** மற்றும் open-source ஆகும். நீங்கள் மட்டும் செலுத்த வேண்டியது:
- நீங்கள் விநியோகிக்கும் Azure வளங்கள்
- Azure பயன்பாட்டு செலவுகள் (compute, storage, போன்றவை)

விநியோகத்திற்கு முன் செலவுகளை மதிப்பீடு செய்ய `azd provision --preview` ஐப் பயன்படுத்தவும்.
</details>

## அடுத்த படிகள்

1. **அங்கீகரிப்பை முடிக்கவும்**: உங்கள் Azure subscription ஐ அணுகக்கூடியதை உறுதிசெய்து கொள்க
2. **உங்கள் முதல் விநியோகத்தை முயற்சி செய்யவும்**: [First Project Guide](first-project.md) ஐ பின்பற்றவும்
3. **வார்ப்புருக்களை ஆராயவும்**: `azd template list` மூலம் கிடைக்கும் வார்ப்புருக்களை உலாவி பார்க்கவும்
4. **உங்கள் IDE ஐ அமைக்கவும்**: உங்கள் அபிவிருத்தி சூழலை கட்டமைக்கவும்

## ஆதரவு

சிக்கல்களை எதிர்கொள்கிறீர்களா:
- [அதிகாரப்பூர்வ ஆவணங்கள்](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [சிக்கல்கள் அறிக்கை செய்ய](https://github.com/Azure/azure-dev/issues)
- [சமூக விவாதங்கள்](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - உங்கள் தொகுப்பியில் நேரடியாக Azure கட்டளைக் கையேடு பெற `npx skills add microsoft/github-copilot-for-azure` மூலம்

---

**அத்தியாய செல்லும் வழி:**
- **📚 பாடநெறி முகப்பு**: [AZD ஆரம்பர்களுக்கான](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 1 - அடிப்படை மற்றும் துவக்கத்திற்கான வழிகாட்டி
- **⬅️ முந்தையது**: [AZD அடிப்படைகள்](azd-basics.md) 
- **➡️ அடுத்தது**: [உங்கள் முதல் 프로젝트](first-project.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 2: AI-முதன்மையாக்கப்பட்ட அபிவிருத்தி](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ நிறுவல் முடிந்தது!** azd உடன் கட்டமைக்கத் தொடங்க [உங்கள் முதல் திட்டம்](first-project.md) க்கு தொடரவும்.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்புரை**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டது. நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது துல்லியத்திற்ப் பிரச்சினைகள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் சொந்த மொழியில் அதிகாரப்பூர்வ மூலமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, நிபுணர்கள் மூலம் செய்யப்பட்ட மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பின் பயன்பாட்டினால் ஏற்படும் எந்தவொரு தவறான புரிதலுக்கும் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->