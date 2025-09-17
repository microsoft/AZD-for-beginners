<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "90202d23bcaf40c8fd99b6a444ddce4a",
  "translation_date": "2025-09-12T22:48:12+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "my"
}
-->
# တပ်ဆင်ခြင်းနှင့် စတင်အသုံးပြုရန် လမ်းညွှန်

**အရင်ဆုံး:** [Main Documentation](../../README.md) | **နောက်တစ်ခု:** [AZD Basics](azd-basics.md)

## မိတ်ဆက်

ဒီလမ်းညွှန်မှာ Azure Developer CLI (azd) ကို သင့်စနစ်မှာ တပ်ဆင်ခြင်းနှင့် ဖွင့်လှစ်ခြင်းအဆင့်ဆင့်ကို ရှင်းလင်းပြသပေးမှာဖြစ်ပါတယ်။ သင့်ရဲ့ ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်ကို Azure deployments အတွက် ပြင်ဆင်နိုင်ဖို့ အခြေခံတပ်ဆင်နည်းများ၊ အတည်ပြုခြင်းနည်းလမ်းများနှင့် စတင်ဖွင့်လှစ်ခြင်းအဆင့်များကို သင်ယူနိုင်ပါမည်။

## သင်ယူရမည့်အချက်များ

ဒီသင်ခန်းစာအဆုံးမှာ သင်:
- သင့်စနစ်မှာ Azure Developer CLI ကို အောင်မြင်စွာ တပ်ဆင်နိုင်မည်
- Azure နှင့် အတည်ပြုခြင်းကို အမျိုးမျိုးသောနည်းလမ်းများဖြင့် ပြုလုပ်နိုင်မည်
- သင့်ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်ကို လိုအပ်သော အခြေခံလိုအပ်ချက်များဖြင့် ပြင်ဆင်နိုင်မည်
- တပ်ဆင်နည်းလမ်းများနှင့် သုံးစွဲရန် အချိန်ကို နားလည်နိုင်မည်
- အများဆုံးတွေ့ရသော တပ်ဆင်ခြင်းနှင့် စတင်ဖွင့်လှစ်ခြင်းပြဿနာများကို ဖြေရှင်းနိုင်မည်

## သင်ယူပြီးရရှိမည့်ရလဒ်များ

ဒီသင်ခန်းစာပြီးဆုံးပြီးနောက်မှာ သင်:
- သင့်ပလက်ဖောင်းအတွက် သင့်တော်သောနည်းလမ်းဖြင့် azd ကို တပ်ဆင်နိုင်မည်
- azd auth login ကို အသုံးပြု၍ Azure နှင့် အတည်ပြုနိုင်မည်
- တပ်ဆင်မှုကို အတည်ပြုပြီး azd အခြေခံ command များကို စမ်းသပ်နိုင်မည်
- azd ကို အကောင်းဆုံးအသုံးပြုနိုင်ရန် သင့်ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်ကို ပြင်ဆင်နိုင်မည်
- အများဆုံးတွေ့ရသော တပ်ဆင်မှုပြဿနာများကို ကိုယ်တိုင်ဖြေရှင်းနိုင်မည်

ဒီလမ်းညွှန်က သင့်စနစ်မှာ Azure Developer CLI ကို တပ်ဆင်ပြီး ဖွင့်လှစ်နိုင်ဖို့ အကူအညီပေးပါမည်၊ သင့်စနစ်နှင့် ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်မရွေး။

## အခြေခံလိုအပ်ချက်များ

azd ကို တပ်ဆင်ရန် မတိုင်မီ သင့်မှာ ရှိထားရမည့်အရာများ:
- **Azure subscription** - [အခမဲ့အကောင့်ဖွင့်ရန်](https://azure.microsoft.com/free/)
- **Azure CLI** - အတည်ပြုခြင်းနှင့် resource စီမံခန့်ခွဲမှုအတွက်
- **Git** - template များကို clone လုပ်ရန်နှင့် version control အတွက်
- **Docker** (optional) - containerized application များအတွက်

## တပ်ဆင်နည်းလမ်းများ

### Windows

#### နည်းလမ်း ၁: PowerShell (အကြံပြု)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### နည်းလမ်း ၂: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### နည်းလမ်း ၃: Chocolatey
```cmd
choco install azd
```

#### နည်းလမ်း ၄: Manual Installation
1. [GitHub](https://github.com/Azure/azure-dev/releases) မှ နောက်ဆုံးထွက်ရှိထားသော release ကို download လုပ်ပါ
2. `C:\Program Files\azd\` သို့ extract လုပ်ပါ
3. PATH environment variable ထဲသို့ ထည့်ပါ

### macOS

#### နည်းလမ်း ၁: Homebrew (အကြံပြု)
```bash
brew tap azure/azd
brew install azd
```

#### နည်းလမ်း ၂: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### နည်းလမ်း ၃: Manual Installation
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### နည်းလမ်း ၁: Install Script (အကြံပြု)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### နည်းလမ်း ၂: Package Managers

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

azd ကို GitHub Codespaces မှာ အလိုအလျောက်တပ်ဆင်ထားပြီးဖြစ်သည်။ Codespace တစ်ခုဖန်တီးပြီး azd ကို ချက်ချင်းအသုံးပြုနိုင်ပါသည်။

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ တပ်ဆင်မှုအတည်ပြုခြင်း

တပ်ဆင်ပြီးနောက် azd သင့်စနစ်မှာ အလုပ်လုပ်နေသည်ကို အတည်ပြုပါ:

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

## အတည်ပြုခြင်းစနစ်

### Azure CLI Authentication (အကြံပြု)
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
သင့်စနစ်မှာ browser ပြဿနာရှိပါက:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
အလိုအလျောက်စနစ်များအတွက်:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## ဖွင့်လှစ်ခြင်း

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
သင့် shell profile (`.bashrc`, `.zshrc`, `.profile`) ထဲသို့ ထည့်ပါ:
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## IDE Integration

### Visual Studio Code
Azure Developer CLI extension ကို တပ်ဆင်ပါ:
1. VS Code ကို ဖွင့်ပါ
2. Extensions (Ctrl+Shift+X) သို့ သွားပါ
3. "Azure Developer CLI" ကို ရှာပါ
4. Extension ကို တပ်ဆင်ပါ

Features:
- azure.yaml အတွက် IntelliSense
- Integrated terminal commands
- Template browsing
- Deployment monitoring

### GitHub Codespaces
`.devcontainer/devcontainer.json` ဖန်တီးပါ:
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
1. Azure plugin ကို တပ်ဆင်ပါ
2. Azure credentials ကို ဖွင့်လှစ်ပါ
3. azd command များအတွက် integrated terminal ကို အသုံးပြုပါ

## 🐛 Troubleshooting Installation

### အများဆုံးတွေ့ရသောပြဿနာများ

#### Permission Denied (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Issues
azd ကို PATH ထဲသို့ manually ထည့်ပါ:

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
azd သည် update ရရှိနိုင်သည်ကို သင့်အား အသိပေးပါမည်:
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

1. **အတည်ပြုခြင်းကို ပြီးစီးပါ**: သင့် Azure subscription ကို access လုပ်နိုင်ရန် သေချာပါစေ
2. **ပထမဆုံး deployment ကို စမ်းသပ်ပါ**: [First Project Guide](first-project.md) ကို လိုက်နာပါ
3. **Template များကို ရှာဖွေပါ**: `azd template list` ဖြင့် ရရှိနိုင်သော template များကို browse လုပ်ပါ
4. **သင့် IDE ကို ပြင်ဆင်ပါ**: သင့်ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်ကို စတင်ပြင်ဆင်ပါ

## အထောက်အပံ့

ပြဿနာများရှိပါက:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**အရင်ဆုံး:** [Main Documentation](../../README.md) | **နောက်တစ်ခု:** [AZD Basics](azd-basics.md)

**တပ်ဆင်မှုပြီးစီးပါပြီ!** [Your First Project](first-project.md) သို့ ဆက်လက်သွားပြီး azd ဖြင့် စတင်ဖန်တီးပါ!

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်ခြင်းတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါရှိနိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရ အရင်းအမြစ်အဖြစ် ရှုလေ့လာသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။