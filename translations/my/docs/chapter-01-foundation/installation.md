# တပ်ဆင်ခြင်းနှင့် စတင်ပြင်ဆင်ခြင်း လမ်းညွှန်

**အခန်းသွားလာရန်:**
- **📚 သင်ရိုးတမ်းသို့**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း 1 - အခြေခံနှင့် အမြန်စတင်မှု
- **⬅️ ယခင်**: [AZD Basics](azd-basics.md)
- **➡️ နောက်ထပ်**: [Your First Project](first-project.md)
- **🚀 နောက်ထပ်အခန်း**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## မိတ်ဆက်

ဤလမ်းညွှန်သည် သင့်စနစ်ပေါ်တွင် Azure Developer CLI (azd) ကို တပ်ဆင်၍ ဖွဲ့စည်းပုံချထားပုံကို အဆင့်ဆင့် ရှင်းလင်းပြသပါမည်။ သင်သည် အမျိုးမျိုးသော လုပ်ငန်းဆောင်ရွက်မှုစနစ်များအတွက် တပ်ဆင်နည်းလမ်းများ၊ အတည်ပြုရေးပုံစနစ်များနှင့် Azure သို့ စီမံအပ်ချရန် ဖွဲ့စည်းထားရန် အစပိုင်း ဖော်ပြချက်များကို သင်ယူမည်ဖြစ်သည်။

## သင်ယူရန် ရည်ရွယ်ချက်များ

ဤသင်ကြားမှု အဆုံးသတ်ပြီးနောက် သင်သည်:
- သင့်အလုပ်ဖြစ်စဉ်စနစ်ပေါ်တွင် Azure Developer CLI ကို အောင်မြင်စွာ တပ်ဆင်နိုင်မည်
- အမျိုးမျိုးသောနည်းလမ်းများဖြင့် Azure နှင့် အတည်ပြုရေးကို ဖော်ဆောင်နိုင်မည်
- ဖော်ထုတ်ရန် လိုအပ်သော အကြိုတင်လိုအပ်ချက်များနှင့်အတူ သင်၏ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်ကို ပြင်ဆင်နိုင်မည်
- တပ်ဆင်သည့်ရွေးချယ်ချက်များကိုနားလည်၍ အခါအားလျော်စွာ အသုံးပြုနိုင်မည်
- ပုံမှန်တပ်ဆင်ခြင်းနှင့် ဖွဲ့စည်းခြင်းပြဿနာများကို ဖြေရှင်းနိုင်မည်

## သင်ယူပြီးရလဒ်များ

ဤသင်ကြားမှု အပြီးသတ်ပါက သင်သည်:
- သင့်ပလက်ဖောင်းအတွက် သင့်တော်သည့်နည်းလမ်းဖြင့် azd ကို တပ်ဆင်နိုင်မည်
- `azd auth login` ဖြင့် Azure တွင် အတည်ပြုလက်မှတ် ထိုးနိုင်မည်
- သင့်တပ်ဆင်မှုကို အတည်ပြု၍ azd အခြေခံ command များကို စမ်းသပ်နိုင်မည်
- azd အသုံးပြုရာတွင် အကောင်းဆုံး ဖွဲ့စည်းတပ်ဆင်မှုများကို ပြင်ဆင်ထားနိုင်မည်
- ပုံမှန်တပ်ဆင်မှု ပြဿနာများကို မိမိဘက်မှ ပြုပြင်ဖြေရှင်းနိုင်မည်

ဤလမ်းညွှန်သည် သင့်လုပ်ငန်းအတွက် အသုံးပြုမည့် အရာအားလုံးကို မည်သည့် operating system သို့မဟုတ် ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်မျှ မမှီဝေဘဲ azd ကို တပ်ဆင်၍ ဖွဲ့စည်းပုံချထားရန် အကူအညီပေးမည်။

## လိုအပ်ချက်များ

azd တပ်ဆင်မည့်မတိုင်မီ သေချာစေပါ:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - အတည်ပြုရေးနှင့် အရင်းအမြစ် စီမံခန့်ခွဲမှုအတွက်
- **Git** - templates ကို clone ပြုလုပ်ရန်နှင့် version control အတွက်
- **Docker** (optional) - containerized application များအတွက်

## တပ်ဆင်ခြင်း နည်းလမ်းများ

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# အက်မင်(Administrator) အဖြစ် သို့မဟုတ် အဆင့်မြင့် ခွင့်များဖြင့် လည်ပတ်ပါ
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
1. Download the latest release from [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extract to `C:\Program Files\azd\`
3. Add to PATH environment variable

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
# ဒေါင်းလုတ်နှင့် တပ်ဆင်ပါ
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
# Microsoft package repository ကို ထည့်သွင်းပါ
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd ကို ထည့်သွင်းပါ
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft ပက်ကေ့ချ် သိမ်းဆည်းရာကို ထည့်ပါ
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd သည် GitHub Codespaces တွင် အရင်မှတင်ထားပြီးဖြစ်သည်။ codespace တစ်ခု ဖန်တီးပြီး တိုက်ရိုက် azd ကို အသုံးပြုကာစတင်နိုင်ပါပြီ။

### Docker

```bash
# container အတွင်း azd ကို ပြေးပါ
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# ပို၍ လွယ်ကူစေရန် alias တစ်ခု ဖန်တီးပါ
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ တပ်ဆင်မှု စစ်ဆေးခြင်း

တပ်ဆင်ပြီးနောက် azd အလုပ်လုပ်နေသည်ဟုတ်မဟုတ် စစ်ဆေးပါ:

```bash
# ဗားရှင်းကို စစ်ဆေးပါ
azd version

# အကူအညီကို ကြည့်ပါ
azd --help

# ရရှိနိုင်သော နမူနာများကို စာရင်းပြပါ
azd template list
```

မျှော်မှန်း ထွက်ရှိမှု:
```
azd version 1.x.x (commit xxxxxx)
```

**မှတ်ချက်**: တကယ်ထွက်ရှိမည့် version နံပါတ်သည် ကွာခြားနိုင်ပါသည်။ အားလပ်သည့် နောက်ဆုံးထွက် version များအတွက် [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) ကို စစ်ဆေးပါ။

**✅ တပ်ဆင်မှု အောင်မြင်မှုပြည့်စုံ စစ်ဆေးစာရင်း:**
- [ ] `azd version` သည် အမှားမရှိဘဲ version နံပါတ်ကို ပြပါစေ
- [ ] `azd --help` သည် command အချက်အလက်များကို ပြပါစေ
- [ ] `azd template list` သည် ရနိုင်သည့် templates များကို ပြပါစေ
- [ ] `az account show` သည် သင့် Azure subscription ကို ပြပါစေ
- [ ] စမ်းသပ်ရန် ဖိုလ်ဒါတစ်ခု ဖန်တီးပြီး `azd init` ကို အောင်မြင်စွာ chạy နိုင်စေ

**အကယ်၍ စစ်ဆေးချက်များအားလုံး အောင်မြင်လျှင်၊ [Your First Project](first-project.md) သို့ ဆက်လက်သွားရောက်နိုင်ပါပြီ!**

## အတည်ပြုရေး ဖွဲ့စည်းပုံ

### Azure CLI ဖြင့် အတည်ပြုခြင်း (အကြံပြု)
```bash
# Azure CLI ကို မထည့်သွင်းထားသေးပါက တပ်ဆင်ပါ
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure သို့ လော့ဂ်အင် ပြုလုပ်ပါ
az login

# အတည်ပြုမှုကို စစ်ဆေးပါ
az account show
```

### Device Code အတည်ပြုရေး
headless စနစ်ပေါ်တွင် ရှိပါက သို့မဟုတ် browser ပြဿနာများ ရင်:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
အလိုအလျောက်လုပ်ငန်းပတ်ဝန်းကျင်များအတွက်:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## ဖွဲ့စည်းမှု

### ကမ္ဘာလုံးဆိုင်ရာ ဖော်ပြချက်
```bash
# ပုံမှန် စာရင်းသွင်းမှုကို သတ်မှတ်ပါ
azd config set defaults.subscription <subscription-id>

# ပုံမှန် တည်နေရာကို သတ်မှတ်ပါ
azd config set defaults.location eastus2

# ဆက်တင်အားလုံးကို ကြည့်ရှုပါ
azd config list
```

### ပတ်ဝန်းကျင် အပြောင်းအလဲများ
သင်၏ shell profile (`.bashrc`, `.zshrc`, `.profile`) ထဲသို့ ပေါင်းထည့်ပါ:
```bash
# Azure ဆက်တင်
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd ဆက်တင်
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # အမှားရှာဖွေရေး မှတ်တမ်းရေးကို ဖွင့်ပါ
```

## IDE ပေါင်းစည်းခြင်း

### Visual Studio Code
Azure Developer CLI extension ကို ထည့်သွင်းပါ:
1. VS Code ကို ဖွင့်ပါ
2. Extensions သို့ သွားပါ (Ctrl+Shift+X)
3. "Azure Developer CLI" ကို ရှာဖွေပါ
4. extension ကို ထည့်သွင်းပါ

လက္ခဏာများ:
- azure.yaml အတွက် IntelliSense
- ပေါင်းစပ်ထားသော terminal command များ
- Template စာရင်း ကြည့်ရှုခြင်း
- ပို့ချပေးမှု မော်နာတာ

### GitHub Codespaces
`.devcontainer/devcontainer.json` တစ်ခု ဖန်တီးပါ:
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
1. Azure plugin ကို ထည့်သွင်းပါ
2. Azure မှ အတည်ပြုရေး စနစ်များကို ဖော်ဆောင်ပါ
3. azd command များအတွက် ပေါင်းစပ်ထားသော terminal ကို အသုံးပြုပါ

## 🐛 တပ်ဆင်မှု ပြဿနာရှာဖွေရေး

### ပုံမှန် ပြဿနာများ

#### Permission Denied (Windows)
```powershell
# PowerShell ကို အုပ်ချုပ်သူ အဖြစ် ဖွင့်ပါ
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH ပြဿနာများ
azd ကို သင့် PATH ထဲသို့ ကိုယ်တိုင်းထည့်ပါ:

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
# Proxy ကို ဖွဲ့စည်းပါ
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL အတည်ပြုမှုကို ဖျတ်ပစ်ပါ (ထုတ်လုပ်ရေးအသုံးအတွက် မအကြံပြုပါ)
azd config set http.insecure true
```

#### Version ဆက်ဆံမှု ယှဉ်တွဲပြဿနာများ
```bash
# အဟောင်းထည့်သွင်းထားသမျှကို ဖယ်ရှားပါ
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# ဆက်တင်များကို ရှင်းလင်းပါ
rm -rf ~/.azd
```

### ကူညီမေးမြန်းလိုပါက
```bash
# အမှားရှာဖွေမှုဆိုင်ရာ မှတ်တမ်းရေးကို ဖွင့်ပါ
export AZD_DEBUG=true
azd <command> --debug

# လက်ရှိ ဖွဲ့စည်းပုံကို ကြည့်ပါ
azd config list

# လက်ရှိ တပ်ဆင်မှု အခြေအနေကို ကြည့်ပါ
azd show
```

## azd ကို 업데이트ခြင်း

### အလိုအလျောက် အပ်ဒိတ်များ
azd သည် အပ်ဒိတ်များ ရရှိပါက သတိပေးပါလိမ့်မည်:
```bash
azd version --check-for-updates
```

### လက်ကိုင် အပ်ဒိတ်များ

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

## 💡 မကြာမီ မေးလေ့ရှိသောမေးခွန်းများ

<details>
<summary><strong>azd နှင့် az CLI တို့အကြား ကွာခြားချက် မည်သို့လဲ?</strong></summary>

**Azure CLI (az)**: တစ်ခုချင်း Azure အရင်းအမြစ်များကို စီမံခန့်ခွဲရန် ကျောင်းသားအဆင့်ကိရိယာ
- `az webapp create`, `az storage account create`
- တစ်ခုချင်း အရင်းအမြစ်များကို ကိုင်တွယ်သည်
- အင်ဖရားစတရပ်ချထားမှု စီမံခန့်ခွဲမှုကို ဦးစားပေး

**Azure Developer CLI (azd)**: အလုံးစုံ အပလီကေးရှင်းများကို ထည့်သွင်းပေးရန် အထက်တန်းကိရိယာ
- `azd up` သည် အပလီကေးရှင်းတစ်ခုလုံးနှင့် ဆက်စပ် အရင်းအမြစ်များကို စုစည်းတင်သွင်းပေးသည်
- Template အခြေခံ လုပ်ငန်းစဉ်များ
- ဖွံ့ဖြိုးရေးသူ စွမ်းအားမြှင့်တင်မှုကို ဦးစားပေး

**နှစ်ခုလုံး လိုအပ်ပါသည်**: azd သည် authentication အတွက် az CLI ကို အသုံးပြုပါသည်
</details>

<details>
<summary><strong>azd ကို ရှိပြီးသား Azure အရင်းအမြစ်များနှင့် အသုံးပြုနိုင်ပါသလား?</strong></summary>

ရပါသည်! သင်သည်:
1. ရှိပြီးသားအရင်းအမြစ်များကို azd environments ထဲသို့ import ပြုလုပ်နိုင်သည်
2. Bicep template များတွင် ရှိပြီးသားအရင်းအမြစ်များကို reference ပြုနိုင်သည်
3. ရှိပြီးသား အင်ဖရာစထက်ချာနှင့် တွဲဖက်အသုံးပြု၍ azd ဖြင့် deployment အသစ်များကို ဆောင်ရွက်နိုင်သည်

အသေးစိတ်အတွက် [Configuration Guide](configuration.md) ကို ကြည့်ပါ။
</details>

<details>
<summary><strong>azd သည် Azure Government သို့မဟုတ် Azure China နှင့် အသုံးပြုနိုင်ပါသလား?</strong></summary>

ရပါသည်၊ cloud ကို ဖော်ပြနိုင်ပါသည်:
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
<summary><strong>azd ကို CI/CD pipeline မျှတွင် အသုံးပြုနိုင်ပါသလား?</strong></summary>

ပို၍လက်ခံနိုင်သည်! azd သည် automation အတွက်ဒီဇိုင်းရေးဆွဲထားပါသည်:
- GitHub Actions ပေါင်းစည်းမှု
- Azure DevOps ကို အထောက်အပံ့ပြု
- Service principal အတည်ပြုရေး
- Non-interactive mode

CI/CD မျိုးစံများအတွက် [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) ကို ကြည့်ပါ။
</details>

<details>
<summary><strong>azd ကို အသုံးပြုရာတွင် ကုန်ကျစရိတ် မည်မျှရှိသလဲ?</strong></summary>

azd ကို ကိုယ်တိုင်သည် **အပြည့်အဝ အခမဲ့** နှင့် open-source ဖြစ်သည်။ သင်ပဲ ငွေပေးချေရမည့် အရာများမှာ:
- သင်တင်သည့် Azure အရင်းအမြစ်များ
- Azure စားသုံးမှု ကုန်ကျစရိတ်များ (compute, storage, စသည့်အရာများ)

deployment မတိုင်မီ ကုန်ကျစရိတ်ခန့်မှန်းရန် `azd provision --preview` ကို အသုံးပြုပါ။
</details>

## နောက်ထပ် ခြေလှမ်းများ

1. **အတည်ပြုရေး ပြီးစီးပါ**: သငျ့ Azure subscription သို့ ဝင်ရောက်နိုင်ကြောင်း သေချာစေပါ
2. **သင့် ပထမဆုံး deployment ကို စမ်းသပ်ပါ**: [First Project Guide](first-project.md) ကို လိုက်နာပါ
3. **Templates များကို ရှာဖွေပါ**: `azd template list` ဖြင့် ရနိုင်သည့် templates များကို ကြည့်ရှုပါ
4. **သင့် IDE ကို ဖွဲ့စည်းပါ**: သင်၏ ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်ကို ပြင်ဆင်ပါ

## ထောက်ခံမှု

ပြဿနာများ ကြုံတွေ့ပါက:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - သင့် editor ထဲတွင် တိုက်ရိုက် Azure command လမ်းညွှန်ချက်ရယူရန် `npx skills add microsoft/github-copilot-for-azure` ကို အသုံးပြုပါ။

---

**အခန်းသွားလာရန်:**
- **📚 သင်ရိုးတမ်းသို့**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း 1 - အခြေခံနှင့် အမြန်စတင်မှု
- **⬅️ ယခင်**: [AZD Basics](azd-basics.md) 
- **➡️ နောက်ထပ်**: [Your First Project](first-project.md)
- **🚀 နောက်ထပ်အခန်း**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ တပ်ဆင်မှု ပြီးစီးပါပြီ!** azd ဖြင့် တည်ဆောက်မှု စတင်ရန် [Your First Project](first-project.md) သို့ ဆက်လက် သွားပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာရွက်ကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးပမ်းပါသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှန်ကန်မှုမရှိခြင်းများ ဖြစ်ပေါ်နိုင်ကြောင်း သတိပြုပါ။ မူလစာရွက်ကို မူလဘာသာဖြင့်သာ အာဏာရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်စဉ်းစားသင့်သည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်ကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာနိုင်သည့် နားမလည်မှုများ သို့မဟုတ် မှားယွင်းဖော်ပြချက်များအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->