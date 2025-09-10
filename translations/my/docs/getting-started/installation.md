<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e9fcb9121c8d0b570798d778f8904a22",
  "translation_date": "2025-09-10T06:05:42+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "my"
}
-->
# တပ်ဆင်ခြင်းနှင့် စတင်အသုံးပြုရန် လမ်းညွှန်

## မိတ်ဆက်

ဒီလမ်းညွှန်က Azure Developer CLI (azd) ကို သင့်စနစ်မှာ တပ်ဆင်ပြီး အဆင်ပြေစွာ အသုံးပြုနိုင်ဖို့ လိုအပ်တဲ့ အဆင့်ဆင့်ကို ရှင်းလင်းပြသပေးမှာဖြစ်ပါတယ်။ အခြားသော operating system များအတွက် တပ်ဆင်ခြင်းနည်းလမ်းများ၊ authentication စနစ်များ၊ နောက်ဆုံး configuration အဆင့်များကို လေ့လာပြီး Azure deployment အတွက် သင့် development environment ကို ပြင်ဆင်နိုင်ပါမည်။

## သင်ယူရမည့် အချက်များ

ဒီသင်ခန်းစာအပြီးမှာ သင်:
- သင့် operating system မှာ Azure Developer CLI ကို အောင်မြင်စွာ တပ်ဆင်နိုင်မည်
- Azure authentication ကို အမျိုးမျိုးသောနည်းလမ်းများဖြင့် ပြုလုပ်နိုင်မည်
- Development environment ကို လိုအပ်သော prerequisites များဖြင့် ပြင်ဆင်နိုင်မည်
- တပ်ဆင်ခြင်းနည်းလမ်းများနှင့် သုံးစွဲရန် အချိန်ကို နားလည်နိုင်မည်
- တပ်ဆင်ခြင်းနှင့် စတင်အသုံးပြုမှုဆိုင်ရာ ပြဿနာများကို ဖြေရှင်းနိုင်မည်

## သင်ယူပြီးရရှိမည့် ရလဒ်များ

ဒီသင်ခန်းစာကို ပြီးမြောက်ပြီးနောက်မှာ သင်:
- သင့် platform အတွက် သင့်တော်သောနည်းလမ်းဖြင့် azd ကို တပ်ဆင်နိုင်မည်
- azd auth login ကို အသုံးပြု၍ Azure နှင့် authentication ပြုလုပ်နိုင်မည်
- azd installation ကို စစ်ဆေးပြီး အခြေခံ command များကို စမ်းသုံးနိုင်မည်
- azd ကို အကောင်းဆုံးအသုံးပြုနိုင်ရန် development environment ကို configure ပြုလုပ်နိုင်မည်
- တပ်ဆင်ခြင်းဆိုင်ရာ ပြဿနာများကို ကိုယ်တိုင်ဖြေရှင်းနိုင်မည်

ဒီလမ်းညွှန်က သင့် operating system သို့မဟုတ် development environment မည်သည့်အခါမဆို Azure Developer CLI ကို တပ်ဆင်ပြီး configure ပြုလုပ်နိုင်ရန် အကူအညီပေးပါမည်။

## လိုအပ်ချက်များ

azd ကို တပ်ဆင်ရန် မတိုင်မီ သင့်မှာ အောက်ပါအရာများရှိရမည်:
- **Azure subscription** - [အခမဲ့ account တစ်ခု ဖန်တီးပါ](https://azure.microsoft.com/free/)
- **Azure CLI** - Authentication နှင့် resource management အတွက်
- **Git** - Template များကို clone လုပ်ရန်နှင့် version control အတွက်
- **Docker** (optional) - Containerized application များအတွက်

## တပ်ဆင်ခြင်းနည်းလမ်းများ

### Windows

#### Option 1: PowerShell (အကြံပြုသည်)
```powershell
# Run as Administrator or with elevated privileges
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
1. [GitHub](https://github.com/Azure/azure-dev/releases) မှ နောက်ဆုံး release ကို download လုပ်ပါ
2. `C:\Program Files\azd\` သို့ extract လုပ်ပါ
3. PATH environment variable တွင် ထည့်ပါ

### macOS

#### Option 1: Homebrew (အကြံပြုသည်)
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
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (အကြံပြုသည်)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

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

azd ကို GitHub Codespaces တွင် အလိုအလျောက် တပ်ဆင်ထားပြီးဖြစ်သည်။ Codespace တစ်ခု ဖန်တီးပြီး azd ကို ချက်ချင်း အသုံးပြုနိုင်ပါသည်။

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Installation ကို စစ်ဆေးခြင်း

တပ်ဆင်ပြီးနောက် azd သင့်စနစ်မှာ အလုပ်လုပ်နေမလုပ်နေ စစ်ဆေးပါ:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

မျှော်မှန်းထားသော output:
```
azd version 1.5.0 (commit abc123)
```

## 🔐 Authentication Setup

### Azure CLI Authentication (အကြံပြုသည်)
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

### Device Code Authentication
Headless system သို့မဟုတ် browser ပြဿနာများရှိပါက:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Automated environment များအတွက်:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## 🛠️ Configuration

### Global Configuration
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Environment Variables
သင့် shell profile (`.bashrc`, `.zshrc`, `.profile`) တွင် ထည့်ပါ:
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## 🔧 IDE Integration

### Visual Studio Code
Azure Developer CLI extension ကို install လုပ်ပါ:
1. VS Code ကို ဖွင့်ပါ
2. Extensions (Ctrl+Shift+X) သို့ သွားပါ
3. "Azure Developer CLI" ကို ရှာပါ
4. Extension ကို install လုပ်ပါ

Features:
- azure.yaml အတွက် IntelliSense
- Integrated terminal commands
- Template browsing
- Deployment monitoring

### GitHub Codespaces
`.devcontainer/devcontainer.json` ဖိုင်တစ်ခု ဖန်တီးပါ:
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
1. Azure plugin ကို install လုပ်ပါ
2. Azure credentials ကို configure ပြုလုပ်ပါ
3. Integrated terminal ကို အသုံးပြု၍ azd commands ကို run လုပ်ပါ

## 🐛 Troubleshooting Installation

### အများဆုံးတွေ့ရသော ပြဿနာများ

#### Permission Denied (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Issues
azd ကို PATH တွင် manually ထည့်ပါ:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Network/Proxy Issues
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### အကူအညီရယူခြင်း
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## azd ကို Update လုပ်ခြင်း

### Automatic Updates
azd သည် update ရရှိနိုင်သည်ဟု သတိပေးပါမည်:
```bash
azd version --check-for-updates
```

### Manual Updates

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

## နောက်တစ်ဆင့်

1. **Authentication ပြီးမြောက်စေပါ**: သင့် Azure subscription ကို access ပြုလုပ်နိုင်ရန် သေချာစေပါ
2. **ပထမဆုံး deployment ကို စမ်းသုံးပါ**: [First Project Guide](first-project.md) ကို လိုက်နာပါ
3. **Template များကို ရှာဖွေပါ**: `azd template list` ဖြင့် ရရှိနိုင်သော template များကို browse လုပ်ပါ
4. **သင့် IDE ကို configure ပြုလုပ်ပါ**: Development environment ကို ပြင်ဆင်ပါ

## အထောက်အပံ့

ပြဿနာများကြုံတွေ့ပါက:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**Navigation**
- **Previous Lesson**: [AZD Basics](azd-basics.md)
- **Next Lesson**: [Configuration](configuration.md)

**Installation ပြီးမြောက်ပါပြီ!** [Your First Project](first-project.md) သို့ ဆက်လက်သွားပြီး azd ဖြင့် စတင်ဖန်တီးပါ!

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါရှိနိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရ အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွဲအမှားအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။