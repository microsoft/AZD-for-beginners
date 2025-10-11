<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c58e92a5b56ad73610b95518b0eea386",
  "translation_date": "2025-10-11T16:08:34+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "ta"
}
-->
# நிறுவல் மற்றும் அமைப்பு வழிகாட்டி

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 நடப்பு அத்தியாயம்**: அத்தியாயம் 1 - அடித்தளம் மற்றும் விரைவான தொடக்கம்
- **⬅️ முந்தையது**: [AZD அடிப்படைகள்](azd-basics.md)
- **➡️ அடுத்தது**: [உங்கள் முதல் திட்டம்](first-project.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 2: AI-முதன்மை மேம்பாடு](../ai-foundry/azure-ai-foundry-integration.md)

## அறிமுகம்

இந்த விரிவான வழிகாட்டி, உங்கள் கணினியில் Azure Developer CLI (azd) ஐ நிறுவுவதற்கும் அமைப்பதற்கும் உங்களை வழிநடத்தும். பல்வேறு இயக்க முறைமைகளுக்கான பல நிறுவல் முறைகளை, அங்கீகார அமைப்பை மற்றும் Azure பிரயோகங்களுக்கு உங்கள் மேம்பாட்டு சூழலைத் தயாரிக்க ஆரம்ப கட்ட அமைப்புகளை நீங்கள் கற்றுக்கொள்வீர்கள்.

## கற்றல் நோக்கங்கள்

இந்த பாடத்தை முடிக்கும்போது, நீங்கள்:
- உங்கள் இயக்க முறைமையில் Azure Developer CLI ஐ வெற்றிகரமாக நிறுவுவீர்கள்
- பல்வேறு முறைகளில் Azure உடன் அங்கீகாரத்தை அமைப்பீர்கள்
- தேவையான முன்னோட்டங்களுடன் உங்கள் மேம்பாட்டு சூழலை அமைப்பீர்கள்
- பல்வேறு நிறுவல் விருப்பங்களை புரிந்து கொண்டு அவற்றை எப்போது பயன்படுத்த வேண்டும் என்பதை அறிந்து கொள்வீர்கள்
- பொதுவான நிறுவல் மற்றும் அமைப்பு பிரச்சினைகளை சரிசெய்வீர்கள்

## கற்றல் முடிவுகள்

இந்த பாடத்தை முடித்த பிறகு, நீங்கள்:
- உங்கள் தளத்திற்கேற்ப சரியான முறையில் azd ஐ நிறுவ முடியும்
- azd auth login மூலம் Azure உடன் அங்கீகாரம் செய்ய முடியும்
- உங்கள் நிறுவலை சரிபார்த்து அடிப்படை azd கட்டளைகளை சோதிக்க முடியும்
- azd ஐ சிறந்த முறையில் பயன்படுத்த உங்கள் மேம்பாட்டு சூழலை அமைக்க முடியும்
- பொதுவான நிறுவல் பிரச்சினைகளை சுயமாக சரிசெய்ய முடியும்

இந்த வழிகாட்டி, உங்கள் இயக்க முறைமையோ அல்லது மேம்பாட்டு சூழலோ எதுவாக இருந்தாலும், Azure Developer CLI ஐ நிறுவவும் அமைக்கவும் உங்களுக்கு உதவும்.

## முன் தேவைகள்

azd ஐ நிறுவுவதற்கு முன், உங்களிடம் பின்வரும் தேவைகள் இருக்க வேண்டும்:
- **Azure சந்தா** - [ஒரு இலவச கணக்கை உருவாக்கவும்](https://azure.microsoft.com/free/)
- **Azure CLI** - அங்கீகாரம் மற்றும் வள மேலாண்மைக்காக
- **Git** - டெம்ப்ளேட்களை கிளோன் செய்யவும் மற்றும் பதிப்பு கட்டுப்பாட்டிற்காக
- **Docker** (விருப்பம்) - கன்டெய்னர் பயன்பாடுகளுக்காக

## நிறுவல் முறைகள்

### விண்டோஸ்

#### விருப்பம் 1: PowerShell (பரிந்துரைக்கப்படுகிறது)
```powershell
# Run as Administrator or with elevated privileges
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

#### விருப்பம் 4: கையேடு நிறுவல்
1. [GitHub](https://github.com/Azure/azure-dev/releases) இல் இருந்து சமீபத்திய வெளியீட்டை பதிவிறக்கவும்
2. `C:\Program Files\azd\` இல் வெளியேற்றவும்
3. PATH சூழல் மாறியில் சேர்க்கவும்

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

#### விருப்பம் 3: கையேடு நிறுவல்
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### லினக்ஸ்

#### விருப்பம் 1: நிறுவல் ஸ்கிரிப்ட் (பரிந்துரைக்கப்படுகிறது)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### விருப்பம் 2: பேக்கேஜ் மேலாளர்கள்

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

azd GitHub Codespaces இல் முன்கூட்டியே நிறுவப்பட்டுள்ளது. ஒரு codespace ஐ உருவாக்கி azd ஐ உடனடியாக பயன்படுத்தத் தொடங்குங்கள்.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ நிறுவலை சரிபார்க்கவும்

நிறுவலுக்குப் பிறகு, azd சரியாக செயல்படுகிறதா என்பதை சரிபார்க்கவும்:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

எதிர்பார்க்கப்படும் வெளியீடு:
```
azd version 1.5.0 (commit abc123)
```

## அங்கீகார அமைப்பு

### Azure CLI அங்கீகாரம் (பரிந்துரைக்கப்படுகிறது)
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

### சாதன குறியீட்டு அங்கீகாரம்
நீங்கள் ஒரு தலைப்பற்ற முறைமையிலோ அல்லது உலாவி பிரச்சினைகளுடன் இருக்கிறீர்களோ:
```bash
az login --use-device-code
```

### சேவை பிரதிநிதி (CI/CD)
தானியங்கி சூழல்களுக்காக:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## அமைப்பு

### உலகளாவிய அமைப்பு
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### சூழல் மாறிகள்
உங்கள் ஷெல் சுயவிவரத்தில் சேர்க்கவும் (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## IDE ஒருங்கிணைவு

### Visual Studio Code
Azure Developer CLI நீட்டிப்பை நிறுவவும்:
1. VS Code ஐ திறக்கவும்
2. Extensions (Ctrl+Shift+X) க்கு செல்லவும்
3. "Azure Developer CLI" ஐ தேடவும்
4. நீட்டிப்பை நிறுவவும்

அம்சங்கள்:
- azure.yaml க்கான IntelliSense
- ஒருங்கிணைந்த டெர்மினல் கட்டளைகள்
- டெம்ப்ளேட் உலாவல்
- பிரயோக கண்காணிப்பு

### GitHub Codespaces
ஒரு `.devcontainer/devcontainer.json` ஐ உருவாக்கவும்:
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
1. Azure செருகுநிரலை நிறுவவும்
2. Azure சான்றுகளை அமைக்கவும்
3. azd கட்டளைகளுக்கு ஒருங்கிணைந்த டெர்மினலைப் பயன்படுத்தவும்

## 🐛 நிறுவல் பிரச்சினைகளை சரிசெய்தல்

### பொதுவான பிரச்சினைகள்

#### அனுமதி மறுக்கப்பட்டது (விண்டோஸ்)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH பிரச்சினைகள்
azd ஐ உங்கள் PATH இல் கையேடாகச் சேர்க்கவும்:

**விண்டோஸ்:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/லினக்ஸ்:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### நெட்வொர்க்/ப்ராக்ஸி பிரச்சினைகள்
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### பதிப்பு முரண்பாடுகள்
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### மேலும் உதவியைப் பெறுதல்
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## azd ஐ புதுப்பித்தல்

### தானியங்கி புதுப்பிப்புகள்
azd புதுப்பிப்புகள் கிடைக்கும்போது உங்களுக்கு அறிவிக்கப்படும்:
```bash
azd version --check-for-updates
```

### கையேடு புதுப்பிப்புகள்

**விண்டோஸ் (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**லினக்ஸ்:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## அடுத்த படிகள்

1. **அங்கீகாரத்தை முடிக்கவும்**: உங்கள் Azure சந்தாவை அணுக முடியும் என்பதை உறுதிப்படுத்தவும்
2. **உங்கள் முதல் பிரயோகத்தை முயற்சிக்கவும்**: [முதல் திட்ட வழிகாட்டி](first-project.md) ஐ பின்பற்றவும்
3. **டெம்ப்ளேட்களை ஆராயவும்**: `azd template list` மூலம் கிடைக்கும் டெம்ப்ளேட்களை உலாவவும்
4. **உங்கள் IDE ஐ அமைக்கவும்**: உங்கள் மேம்பாட்டு சூழலை அமைக்கவும்

## ஆதரவு

உங்களுக்கு பிரச்சினைகள் ஏற்பட்டால்:
- [அதிகாரப்பூர்வ ஆவணங்கள்](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [பிரச்சினைகளை அறிக்கையிடவும்](https://github.com/Azure/azure-dev/issues)
- [சமூக விவாதங்கள்](https://github.com/Azure/azure-dev/discussions)
- [Azure ஆதரவு](https://azure.microsoft.com/support/)

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 நடப்பு அத்தியாயம்**: அத்தியாயம் 1 - அடித்தளம் மற்றும் விரைவான தொடக்கம்
- **⬅️ முந்தையது**: [AZD அடிப்படைகள்](azd-basics.md) 
- **➡️ அடுத்தது**: [உங்கள் முதல் திட்டம்](first-project.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 2: AI-முதன்மை மேம்பாடு](../ai-foundry/azure-ai-foundry-integration.md)

**✅ நிறுவல் முடிந்தது!** azd உடன் கட்டமைக்க [உங்கள் முதல் திட்டம்](first-project.md) தொடரவும்.

---

**குறிப்பு**:  
இந்த ஆவணம் [Co-op Translator](https://github.com/Azure/co-op-translator) என்ற AI மொழிபெயர்ப்பு சேவையை பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. எங்கள் நோக்கம் துல்லியமாக இருக்க வேண்டும் என்பதுதான், ஆனால் தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது துல்லியமின்மைகள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனத்தில் கொள்ளவும். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.