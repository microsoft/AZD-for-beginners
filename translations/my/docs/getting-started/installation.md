<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c58e92a5b56ad73610b95518b0eea386",
  "translation_date": "2025-09-18T13:20:55+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "my"
}
-->
# တပ်ဆင်ခြင်းနှင့် စတင်အသုံးပြုရန် လမ်းညွှန်

**အခန်းအတွင်း လမ်းညွှန်ချက်များ:**
- **📚 သင်ခန်းစာ မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၁ - အခြေခံနှင့် အမြန်စတင်ခြင်း
- **⬅️ ယခင်အခန်း**: [AZD Basics](azd-basics.md)
- **➡️ နောက်အခန်း**: [Your First Project](first-project.md)
- **🚀 နောက်အခန်း**: [အခန်း ၂: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)

## နိဒါန်း

ဒီလမ်းညွှန်စာအုပ်က သင့်စနစ်ပေါ်မှာ Azure Developer CLI (azd) ကို တပ်ဆင်ပြီး ပြင်ဆင်အသုံးပြုဖို့ လမ်းညွှန်ပေးမှာဖြစ်ပါတယ်။ မတူညီတဲ့ Operating System များအတွက် တပ်ဆင်နည်းများ၊ အတည်ပြုခြင်းနည်းလမ်းများ၊ နောက်ဆုံးမှာတော့ Azure တွင် အဆင်ပြေစွာ ဖွံ့ဖြိုးတိုးတက်မှုလုပ်ဆောင်နိုင်ဖို့ သင့် Development Environment ကို ပြင်ဆင်ပေးပါမယ်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဒီသင်ခန်းစာအပြီးမှာ သင်သည်:
- သင့် Operating System ပေါ်မှာ Azure Developer CLI ကို အောင်မြင်စွာ တပ်ဆင်နိုင်မည်
- Azure နှင့် အတည်ပြုခြင်းကို မတူညီတဲ့နည်းလမ်းများဖြင့် ပြုလုပ်နိုင်မည်
- Development Environment ကို လိုအပ်သော အခြေခံလိုအပ်ချက်များဖြင့် ပြင်ဆင်နိုင်မည်
- မတူညီတဲ့ တပ်ဆင်နည်းလမ်းများကို နားလည်ပြီး အချိန်နှင့် အခြေအနေအလိုက် အသုံးပြုနိုင်မည်
- အများဆုံးတွေ့ရတဲ့ တပ်ဆင်ခြင်းနှင့် ပြင်ဆင်မှု ပြဿနာများကို ကိုယ်တိုင် ဖြေရှင်းနိုင်မည်

## သင်ယူပြီးနောက် ရလဒ်များ

ဒီသင်ခန်းစာကို ပြီးဆုံးပြီးနောက်မှာ သင်သည်:
- သင့်စနစ်အတွက် သင့်တော်တဲ့နည်းလမ်းဖြင့် azd ကို တပ်ဆင်နိုင်မည်
- azd auth login ကို အသုံးပြုပြီး Azure နှင့် အတည်ပြုနိုင်မည်
- azd ကို အောင်မြင်စွာ တပ်ဆင်ပြီး စမ်းသပ်နိုင်မည်
- azd ကို အကောင်းဆုံးအသုံးပြုနိုင်ဖို့ သင့် Development Environment ကို ပြင်ဆင်နိုင်မည်
- အများဆုံးတွေ့ရတဲ့ တပ်ဆင်မှုဆိုင်ရာ ပြဿနာများကို ကိုယ်တိုင် ဖြေရှင်းနိုင်မည်

ဒီလမ်းညွှန်စာအုပ်က သင့်စနစ်ပေါ်မှာ Azure Developer CLI ကို တပ်ဆင်ပြီး ပြင်ဆင်အသုံးပြုဖို့ လမ်းညွှန်ပေးမှာဖြစ်ပါတယ်။

## လိုအပ်ချက်များ

azd ကို တပ်ဆင်ရန် မတိုင်မီ သင့်တွင် အောက်ပါအရာများရှိရမည်:
- **Azure subscription** - [အခမဲ့အကောင့်တစ်ခု ဖန်တီးပါ](https://azure.microsoft.com/free/)
- **Azure CLI** - အတည်ပြုခြင်းနှင့် အရင်းအမြစ်စီမံခန့်ခွဲမှုအတွက်
- **Git** - Template များ Clone လုပ်ရန်နှင့် Version Control အတွက်
- **Docker** (optional) - Containerized Application များအတွက်

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
1. [GitHub](https://github.com/Azure/azure-dev/releases) မှ နောက်ဆုံးထွက် Release ကို Download လုပ်ပါ
2. `C:\Program Files\azd\` သို့ Extract လုပ်ပါ
3. PATH Environment Variable ထဲသို့ ထည့်ပါ

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

azd သည် GitHub Codespaces တွင် ကြိုတင်တပ်ဆင်ပြီးသားဖြစ်သည်။ Codespace တစ်ခု ဖန်တီးပြီး azd ကို ချက်ချင်းအသုံးပြုနိုင်ပါသည်။

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ တပ်ဆင်မှု အတည်ပြုခြင်း

တပ်ဆင်ပြီးနောက် azd သည် မှန်ကန်စွာ အလုပ်လုပ်နေကြောင်း အတည်ပြုပါ:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

မျှော်မှန်းရလဒ်:
```
azd version 1.5.0 (commit abc123)
```

## အတည်ပြုခြင်း ပြုလုပ်ခြင်း

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
Browser ပြဿနာများရှိပါက သို့မဟုတ် Headless System များအတွက်:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Automated Environment များအတွက်:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## ပြင်ဆင်မှု

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
သင့် Shell Profile (`.bashrc`, `.zshrc`, `.profile`) ထဲသို့ ထည့်ပါ:
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## IDE တွင် ပေါင်းစည်းအသုံးပြုခြင်း

### Visual Studio Code
Azure Developer CLI Extension ကို တပ်ဆင်ပါ:
1. VS Code ကို ဖွင့်ပါ
2. Extensions (Ctrl+Shift+X) သို့ သွားပါ
3. "Azure Developer CLI" ကို ရှာပါ
4. Extension ကို တပ်ဆင်ပါ

Features:
- azure.yaml အတွက် IntelliSense
- Integrated Terminal Commands
- Template Browsing
- Deployment Monitoring

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
1. Azure Plugin ကို တပ်ဆင်ပါ
2. Azure Credentials ကို ပြင်ဆင်ပါ
3. Integrated Terminal မှ azd Commands များကို အသုံးပြုပါ

## 🐛 တပ်ဆင်မှု ပြဿနာများကို ဖြေရှင်းခြင်း

### အများဆုံးတွေ့ရသော ပြဿနာများ

#### Permission Denied (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH ပြဿနာများ
azd ကို သင့် PATH ထဲသို့ လက်ဖြင့် ထည့်ပါ:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Network/Proxy ပြဿနာများ
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

### အကူအညီ ပိုမိုရယူရန်
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## azd ကို Update ပြုလုပ်ခြင်း

### Automatic Updates
azd သည် Update ရှိသည်ကို သင့်အား အသိပေးပါမည်:
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

1. **Authentication ပြီးစီးပါ**: သင့် Azure Subscription ကို အသုံးပြုနိုင်ကြောင်း သေချာပါစေ
2. **ပထမဆုံး Deployment ကို စမ်းသပ်ပါ**: [First Project Guide](first-project.md) ကို လိုက်နာပါ
3. **Template များကို စူးစမ်းပါ**: `azd template list` ဖြင့် ရရှိနိုင်သော Template များကို ကြည့်ရှုပါ
4. **သင့် IDE ကို ပြင်ဆင်ပါ**: Development Environment ကို ပြင်ဆင်ပါ

## အထောက်အကူများ

ပြဿနာများကြုံတွေ့ပါက:
- [တရားဝင် Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ပြဿနာများ Report ပြုလုပ်ရန်](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**အခန်းအတွင်း လမ်းညွှန်ချက်များ:**
- **📚 သင်ခန်းစာ မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၁ - အခြေခံနှင့် အမြန်စတင်ခြင်း
- **⬅️ ယခင်အခန်း**: [AZD Basics](azd-basics.md) 
- **➡️ နောက်အခန်း**: [Your First Project](first-project.md)
- **🚀 နောက်အခန်း**: [အခန်း ၂: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)

**✅ တပ်ဆင်မှု ပြီးစီးပါပြီ!** [Your First Project](first-project.md) သို့ ဆက်လက်လေ့လာပြီး azd ဖြင့် ဖန်တီးမှုကို စတင်လိုက်ပါ။

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွဲအချော်များ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။