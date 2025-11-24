<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "dbc3f2f6acbaa09093b21a220e1c2769",
  "translation_date": "2025-11-23T23:00:48+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "my"
}
-->
# တပ်ဆင်ခြင်းနှင့် စတင်အသုံးပြုရန် လမ်းညွှန်

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်တန်းမူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၁ - အခြေခံနှင့် အမြန်စတင်ခြင်း
- **⬅️ ယခင်အခန်း**: [AZD Basics](azd-basics.md)
- **➡️ နောက်အခန်း**: [Your First Project](first-project.md)
- **🚀 နောက်ထပ်အခန်း**: [အခန်း ၂: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)

## နိဒါန်း

ဒီလမ်းညွှန်မှာ Azure Developer CLI (azd) ကို သင့်စနစ်ပေါ်မှာ တပ်ဆင်ပြီး ပြင်ဆင်အသုံးပြုနည်းကို လမ်းညွှန်ပေးမှာဖြစ်ပါတယ်။ အမျိုးမျိုးသော စနစ်များအတွက် တပ်ဆင်နည်းများ၊ အတည်ပြုခြင်းနည်းလမ်းများနှင့် Azure deployments အတွက် သင့် development ပတ်ဝန်းကျင်ကို စတင်ပြင်ဆင်နည်းကို သင်ယူနိုင်ပါမည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဒီသင်ခန်းစာအပြီးမှာ သင်သည်:
- သင့်စနစ်ပေါ်မှာ Azure Developer CLI ကို အောင်မြင်စွာတပ်ဆင်နိုင်မည်
- Azure နှင့် အတည်ပြုခြင်းကို အမျိုးမျိုးသောနည်းလမ်းများဖြင့် ပြုလုပ်နိုင်မည်
- Development ပတ်ဝန်းကျင်ကို လိုအပ်သော အခြေခံလိုအပ်ချက်များဖြင့် ပြင်ဆင်နိုင်မည်
- အမျိုးမျိုးသော တပ်ဆင်နည်းလမ်းများကို နားလည်ပြီး အချိန်နှင့်အခြေအနေအလိုက် အသုံးပြုနိုင်မည်
- အများဆုံးတွေ့ရသော တပ်ဆင်ခြင်းနှင့် ပြင်ဆင်ခြင်းဆိုင်ရာ ပြဿနာများကို ဖြေရှင်းနိုင်မည်

ဒီလမ်းညွှန်က သင့်စနစ်ပေါ်မှာ Azure Developer CLI ကို တပ်ဆင်ပြီး ပြင်ဆင်အသုံးပြုဖို့ အကူအညီပေးပါမည်။

## လိုအပ်ချက်များ

azd ကို တပ်ဆင်မီ သင်မှာ အောက်ပါအရာများရှိရမည်:
- **Azure subscription** - [အခမဲ့အကောင့်ဖွင့်ရန်](https://azure.microsoft.com/free/)
- **Azure CLI** - အတည်ပြုခြင်းနှင့် resource စီမံခန့်ခွဲမှုအတွက်
- **Git** - Template များကို clone လုပ်ရန်နှင့် version control အတွက်
- **Docker** (optional) - Containerized application များအတွက်

## တပ်ဆင်နည်းလမ်းများ

### Windows

#### နည်းလမ်း ၁: PowerShell (အကြံပြုသည်)
```powershell
# အုပ်ချုပ်ရေးအဆင့်ဖြင့် သို့မဟုတ် အဆင့်မြှင့်ထားသော အခွင့်အရေးများဖြင့် အလုပ်လုပ်ပါ
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
1. [GitHub](https://github.com/Azure/azure-dev/releases) မှ နောက်ဆုံးထွက် release ကို download လုပ်ပါ
2. `C:\Program Files\azd\` သို့ extract လုပ်ပါ
3. PATH environment variable ထဲသို့ ထည့်ပါ

### macOS

#### နည်းလမ်း ၁: Homebrew (အကြံပြုသည်)
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
# ဒေါင်းလုဒ်လုပ်ပြီးတပ်ဆင်ပါ
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### နည်းလမ်း ၁: Install Script (အကြံပြုသည်)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### နည်းလမ်း ၂: Package Managers

**Ubuntu/Debian:**
```bash
# Microsoft package repository ကိုထည့်ပါ
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd ကိုထည့်သွင်းပါ
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft package repository ကိုထည့်ပါ
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd သည် GitHub Codespaces တွင် အလိုအလျောက်တပ်ဆင်ထားပြီးဖြစ်သည်။ Codespace တစ်ခုဖန်တီးပြီး azd ကို ချက်ချင်းအသုံးပြုနိုင်ပါသည်။

### Docker

```bash
# ကွန်တိန်နာတွင် azd ကို အလုပ်လုပ်ပါ
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# ပိုမိုလွယ်ကူစေရန်အတွက် အမည်ပြောင်းဖန်တီးပါ
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ တပ်ဆင်မှုအတည်ပြုခြင်း

တပ်ဆင်ပြီးနောက် azd သည် မှန်ကန်စွာ အလုပ်လုပ်နေကြောင်း အတည်ပြုပါ:

```bash
# ဗားရှင်းကိုစစ်ဆေးပါ
azd version

# အကူအညီကိုကြည့်ပါ
azd --help

# ရရှိနိုင်သော template များကိုစာရင်းပြပါ
azd template list
```

မျှော်မှန်းရလဒ်:
```
azd version 1.5.0 (commit abc123)
```

**✅ တပ်ဆင်မှုအောင်မြင်မှု စစ်ဆေးစာရင်း:**
- [ ] `azd version` သည် error မရှိဘဲ version နံပါတ်ကို ပြသသည်
- [ ] `azd --help` သည် command documentation ကို ပြသသည်
- [ ] `azd template list` သည် ရရှိနိုင်သော template များကို ပြသသည်
- [ ] `az account show` သည် သင့် Azure subscription ကို ပြသသည်
- [ ] စမ်းသပ် directory တစ်ခုဖန်တီးပြီး `azd init` ကို အောင်မြင်စွာ run လုပ်နိုင်သည်

**အထက်ပါအချက်အားလုံးအောင်မြင်ပါက [Your First Project](first-project.md) သို့ ဆက်လက်လုပ်ဆောင်နိုင်ပါပြီ!**

## အတည်ပြုခြင်း စတင်ခြင်း

### Azure CLI Authentication (အကြံပြုသည်)
```bash
# Azure CLI ကို မရှိသေးရင် ထည့်သွင်းပါ
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure ကို Login ဝင်ပါ
az login

# အတည်ပြု authentication
az account show
```

### Device Code Authentication
Headless system သို့မဟုတ် browser ပြဿနာများရှိပါက:
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

## ပြင်ဆင်မှု

### Global Configuration
```bash
# ပုံမှန် subscription ကို သတ်မှတ်ပါ
azd config set defaults.subscription <subscription-id>

# ပုံမှန် location ကို သတ်မှတ်ပါ
azd config set defaults.location eastus2

# အားလုံး configuration ကို ကြည့်ရှုပါ
azd config list
```

### Environment Variables
သင့် shell profile (`.bashrc`, `.zshrc`, `.profile`) ထဲသို့ ထည့်ပါ:
```bash
# Azure ဖွဲ့စည်းမှု
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd ဖွဲ့စည်းမှု
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Debug log ကိုဖွင့်ပါ
```

## IDE ပေါင်းစည်းမှု

### Visual Studio Code
Azure Developer CLI extension ကို တပ်ဆင်ပါ:
1. VS Code ကို ဖွင့်ပါ
2. Extensions (Ctrl+Shift+X) သို့သွားပါ
3. "Azure Developer CLI" ကို ရှာပါ
4. Extension ကို တပ်ဆင်ပါ

အင်္ဂါရပ်များ:
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
2. Azure credentials ကို ပြင်ဆင်ပါ
3. azd commands အတွက် integrated terminal ကို အသုံးပြုပါ

## 🐛 တပ်ဆင်မှု ပြဿနာများ ဖြေရှင်းခြင်း

### အများဆုံးတွေ့ရသော ပြဿနာများ

#### Permission Denied (Windows)
```powershell
# PowerShell ကို အက်ဉ်းချုပ်အရာရှိအဖြစ် အလုပ်လည်ပတ်ပါ
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH ပြဿနာများ
azd ကို သင့် PATH ထဲသို့ လက်ဖြင့်ထည့်ပါ:

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
# ပရောက်စီကို ပြင်ဆင်ပါ
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL အတည်ပြုမှုကို ကျော်ပါ (ထုတ်လုပ်မှုအတွက် မသင့်တော်ပါ)
azd config set http.insecure true
```

#### Version အငြင်းပွားမှုများ
```bash
# ရှေးဟောင်းတပ်ဆင်မှုများကို ဖယ်ရှားပါ
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# ဖော်ပြချက်ကို သန့်စင်ပါ
rm -rf ~/.azd
```

### အကူအညီ ပိုမိုရယူရန်
```bash
# ဒေဘတ်လော့ဂ်များကိုဖွင့်ပါ
export AZD_DEBUG=true
azd <command> --debug

# အသေးစိတ်လော့ဂ်များကိုကြည့်ပါ
azd logs

# စနစ်အချက်အလက်ကိုစစ်ဆေးပါ
azd info
```

## azd ကို Update လုပ်ခြင်း

### အလိုအလျောက် Update
azd သည် update ရရှိနိုင်သည်ဟု သတိပေးပါမည်:
```bash
azd version --check-for-updates
```

### လက်ဖြင့် Update

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

## 💡 မကြာခဏမေးလေ့ရှိသော မေးခွန်းများ

<details>
<summary><strong>azd နှင့် az CLI အကြားကွာခြားချက်ကဘာလဲ?</strong></summary>

**Azure CLI (az)**: Azure resources တစ်ခုချင်းစီကို စီမံခန့်ခွဲရန်အတွက် အနိမ့်အဆင့် tool
- `az webapp create`, `az storage account create`
- Resource တစ်ခုချင်းစီအတွက်
- Infrastructure စီမံခန့်ခွဲမှုအာရုံစိုက်မှု

**Azure Developer CLI (azd)**: အပြည့်အစုံ application deployment များအတွက် အမြင့်အဆင့် tool
- `azd up` သည် app အပြည့်အစုံကို deploy လုပ်သည်
- Template-based workflows
- Developer အာရုံစိုက်မှု

**နှစ်ခုလုံးလိုအပ်သည်**: azd သည် authentication အတွက် az CLI ကို အသုံးပြုသည်
</details>

<details>
<summary><strong>azd ကို ရှိပြီးသား Azure resources များနှင့် အသုံးပြုနိုင်မလား?</strong></summary>

နိုင်ပါတယ်! သင်:
1. ရှိပြီးသား resources များကို azd environments ထဲသို့ Import လုပ်နိုင်သည်
2. ရှိပြီးသား resources များကို သင့် Bicep templates တွင် ရည်ညွှန်းနိုင်သည်
3. azd ကို ရှိပြီးသား infrastructure နှင့်အတူ အသစ်သော deployments များအတွက် အသုံးပြုနိုင်သည်

အသေးစိတ်အချက်အလက်များအတွက် [Configuration Guide](configuration.md) ကို ကြည့်ပါ။
</details>

<details>
<summary><strong>azd သည် Azure Government သို့မဟုတ် Azure China နှင့် အလုပ်လုပ်နိုင်မလား?</strong></summary>

နိုင်ပါတယ်၊ cloud ကို configure လုပ်ပါ:
```bash
# Azure အစိုးရ
az cloud set --name AzureUSGovernment
az login

# Azure တရုတ်
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>azd ကို CI/CD pipelines တွင် အသုံးပြုနိုင်မလား?</strong></summary>

အမှန်တကယ်! azd သည် automation အတွက် ဒီဇိုင်းထုတ်ထားသည်:
- GitHub Actions integration
- Azure DevOps support
- Service principal authentication
- Non-interactive mode

CI/CD patterns များအတွက် [Deployment Guide](../deployment/deployment-guide.md) ကို ကြည့်ပါ။
</details>

<details>
<summary><strong>azd ကို အသုံးပြုရတဲ့ ကုန်ကျစရိတ်က ဘယ်လောက်လဲ?</strong></summary>

azd ကို အသုံးပြုခြင်းမှာ **အခမဲ့** ဖြစ်ပြီး open-source ဖြစ်သည်။ သင်ပေးရမည့်အရာများမှာ:
- သင် deploy လုပ်သော Azure resources
- Azure consumption costs (compute, storage, etc.)

Deploy မလုပ်မီ `azd provision --preview` ကို အသုံးပြု၍ ကုန်ကျစရိတ်ကို ခန့်မှန်းနိုင်ပါသည်။
</details>

## နောက်တစ်ဆင့်

1. **အတည်ပြုခြင်း ပြီးစီးပါ**: သင့် Azure subscription ကို ဝင်ရောက်နိုင်ကြောင်း သေချာပါစေ
2. **သင့်ပထမဆုံး deployment ကို စမ်းကြည့်ပါ**: [First Project Guide](first-project.md) ကို လိုက်နာပါ
3. **Template များကို စူးစမ်းပါ**: `azd template list` ဖြင့် ရရှိနိုင်သော template များကို ကြည့်ပါ
4. **သင့် IDE ကို ပြင်ဆင်ပါ**: သင့် development ပတ်ဝန်းကျင်ကို ပြင်ဆင်ပါ

## အထောက်အပံ့

ပြဿနာများကြုံတွေ့ပါက:
- [တရားဝင်စာရွက်စာတမ်းများ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ပြဿနာများรายงาน](https://github.com/Azure/azure-dev/issues)
- [အသိုင်းအဝိုင်းဆွေးနွေးမှုများ](https://github.com/Azure/azure-dev/discussions)
- [Azure အထောက်အပံ့](https://azure.microsoft.com/support/)

---

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်တန်းမူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၁ - အခြေခံနှင့် အမြန်စတင်ခြင်း
- **⬅️ ယခင်အခန်း**: [AZD Basics](azd-basics.md) 
- **➡️ နောက်အခန်း**: [Your First Project](first-project.md)
- **🚀 နောက်ထပ်အခန်း**: [အခန်း ၂: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ တပ်ဆင်မှု ပြီးစီးပါပြီ!** [Your First Project](first-project.md) သို့ ဆက်လက်လုပ်ဆောင်ပြီး azd ဖြင့် စတင်တည်ဆောက်ပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွဲအချော်များ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->