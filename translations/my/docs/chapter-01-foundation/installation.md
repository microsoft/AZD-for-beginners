# တပ်ဆင်ခြင်းနှင့် ပြင်ဆင်မှု လမ်းညွှန်

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## နိဒါန်း

ဒီ လမ်းညွှန်လက်စွဲမှာ သင့်စနစ်ပေါ်တွင် Azure Developer CLI (azd) ကို တပ်ဆင်ကာ စီမံခြင်းလုပ်နည်းများကို အပြည့်အစုံ လမ်းပြပေးပါမယ်။ သင်သည် မတူညီသော လုပ်ဆောင်မှုစနစ်များအတွက် တပ်ဆင်နည်းများ၊ အကောင့်အတည်ပြုမှု ဆက်တင်များနှင့် Azure သို့ တင်သွင်းနိုင်ရန် သင့်ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်ကို စတင်ပြင်ဆင်ခြင်းတို့ကို လေ့လာရမည်ဖြစ်သည်။

## သင်ယူရန် ရည်မှန်းချက်များ

ဒီသင်ခန်းစာ ပြီးဆုံးရာတွင် သင်သည်:
- သင့် လုပ်ဆောင်မှုစနစ်ပေါ်တွင် Azure Developer CLI ကို အောင်မြင်စွာ တပ်ဆင်နိုင်မည်
- အမျိုးမျိုးသော နည်းလမ်းများဖြင့် Azure နှင့် အကောင့်အတည်ပြုမှုကို ဖွဲ့စည်းနိုင်မည်
- လိုအပ်သော အတှကျနှင့်အတူ သင်၏ ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်ကို ပြင်ဆင်နိုင်မည်
- တပ်ဆင်နည်းရွေးချယ်စရာများကို နားလည်ပြီး မည်သောအချိန်တွင် ဘာကို အသုံးပြုရမည်ကို သိရှိမည်
- သာမန် တပ်ဆင်ခြင်းနှင့် ပြင်ဆင်မှု ပြဿနာများကို ဖြေရှင်းနိုင်မည်

## သင်ယူပြီးရရှိမည့် အကျိုးရလဒ်များ

ဒီသင်ခန်းစာပြီးရင် သင်သည်:
- သင့်ပလက်ဖောင်းအတွက် သင့်တော်သည့် နည်းလမ်းဖြင့် azd ကို တပ်ဆင်နိုင်မည်
- `azd auth login` ကို အသုံးပြု၍ Azure နှင့် အတည်ပြုနိုင်မည်
- တပ်ဆင်မှုကို စစ်ဆေးပြီး အခြေခံ azd ကော်မန်များကို စမ်းသပ်နိုင်မည်
- azd ကို ထိရောက်စွာ အသုံးပြုရန် သင့် ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်ကို ဖွဲ့စည်းနိုင်မည်
- သာမန် တပ်ဆင်မှုပြဿနာများကို ကိုယ်တိုင် ဖြေရှင်းနိုင်မည်

ဒီ လမ်းညွှန်က သင့် လုပ်ဆောင်မှုစနစ်မည်မျှဖြစ်ဖြစ် သို့မဟုတ် ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်မည်မျှဖြစ်ဖြစ် Azure Developer CLI ကို တပ်ဆင်ကာ ဖွဲ့စည်းရန် ကူညီပါမည်။

## မတိုင်မီ လိုအပ်ချက်များ

azd ကို တပ်ဆင်ရန် မပြုမီ အောက်ပါအရာများ ရှိကြောင်း သေချာပါစေ။
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - အကောင့်အတည်ပြုခြင်းနှင့် အရင်းအမြစ်စီမံခန့်ခွဲမှုအတွက်
- **Git** - တမ်းပလိတ်များကို clone ဆွဲရန်နှင့် ဗားရှင်းထိန်းချုပ်မှုအတွက်
- **Docker** (optional) - ကွန်တိနာအလျောက် အပလီကေးရှင်းများအတွက်

## တပ်ဆင်နည်းလမ်းများ

### Windows

#### ရွေးချယ်စရာ 1: PowerShell (အကြံပြု)
```powershell
# အက်မင် အဖြစ် သို့မဟုတ် အဆင့်မြှင့် ခွင့်ပြုချက်ဖြင့် လည်ပတ်ပါ
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### ရွေးချယ်စရာ 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### ရွေးချယ်စရာ 3: Chocolatey
```cmd
choco install azd
```

#### ရွေးချယ်စရာ 4: ကိုယ်ပိုင်လက်လုပ်တပ်ဆင်ခြင်း
1. နောက်ဆုံးထွက်ထုတ်ဝေမှုကို [GitHub](https://github.com/Azure/azure-dev/releases) မှ ဒေါင်းလုဒ်ဆွဲပါ
2. ဖိုင်ကို ဖွင့်ထုတ်ပြီး `C:\Program Files\azd\` ထဲသို့ ထည့်ပါ
3. PATH environment variable ထဲသို့ ထည့်ပါ

### macOS

#### ရွေးချယ်စရာ 1: Homebrew (အကြံပြု)
```bash
brew tap azure/azd
brew install azd
```

#### ရွေးချယ်စရာ 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ရွေးချယ်စရာ 3: ကိုယ်ပိုင်လက်လုပ်တပ်ဆင်ခြင်း
```bash
# ဒေါင်းလုတ်ဆွဲပြီး တပ်ဆင်ပါ
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### ရွေးချယ်စရာ 1: Install Script (အကြံပြု)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ရွေးချယ်စရာ 2: Package Managers

**Ubuntu/Debian:**
```bash
# Microsoft ပက်ကေ့ချ် ဂိုဒေါင်ကို ထည့်ပါ
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd ကို တပ်ဆင်ပါ
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft ပက်ကေ့ချ်များအတွက် အရင်းအမြစ်ကို ထည့်ပါ။
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

GitHub Codespaces တွင် azd ကို ကြိုတင်တပ်ဆင်ထားပြီးဖြစ်သည်။ Codespace တစ်ခု ဖန်တီးပြီး တိုက်ရိုက် azd ကို အသုံးပြုနိုင်ပါပြီ။

### Docker

```bash
# azd ကို ကွန်တိန်နာထဲမှာ ပြေးပါ
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# အသုံးပြုရ လွယ်ကူစေရန် အစားထိုးနာမည် တစ်ခု ဖန်တီးပါ
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ တပ်ဆင်မှု စစ်ဆေးခြင်း

တပ်ဆင်ပြီးနောက် azd သည် မှန်ကန်စွာ အလုပ်လုပ်နေမနေ စစ်ဆေးပါ။

```bash
# ဗားရှင်းကို စစ်ဆေးပါ
azd version

# အကူအညီကို ကြည့်ပါ
azd --help

# အသုံးပြုနိုင်သော နမူနာများကို စာရင်းပြပါ
azd template list
```

မျှော်မှန်းထားသည့် ထွက်ရှိမှု:
```
azd version 1.x.x (commit xxxxxx)
```

**မှတ်ချက်**: အစစ်အမှန် ဗားရှင်းနံပါတ်သည် ကွဲပြားနိုင်ပါသည်။ နောက်ဆုံးဗားရှင်းအတွက် [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) ကို စစ်ဆေးပါ။

**✅ တပ်ဆင်မှု အောင်မြင်မှု စာရင်း:**
- [ ] `azd version` သည် အမှားမဖြစ်ဘဲ ဗားရှင်းနံပါတ်ကို ပြသည်
- [ ] `azd --help` သည် ကော်မန့် အချက်အလက်များကို ပြသည်
- [ ] `azd template list` သည် ရနိုင်သော templates များကို ပြသည်
- [ ] `az account show` သည် သင့် Azure subscription ကို ပြသည်
- [ ] စမ်းသပ်ရန် directory တစ်ခု ဖန်တီးပြီး `azd init` ကို အောင်မြင်စွာ 실행/run ပြီးစစ်ဆေးနိုင်သည်

**စစ်ဆေးချက်အားလုံး ကျော်လျှင် သင်သည် [Your First Project](first-project.md) သို့ ဆက်လက် ရောက်ရှိနိုင်ပါပြီ။**

## အကောင့်အတည်ပြုမှု ပြင်ဆင်မှု

### Azure CLI ဖြင့် အကောင့်အတည်ပြုခြင်း (အကြံပြု)
```bash
# Azure CLI ကို မတင်ထားသေးပါက ထည့်သွင်းပါ
# Windows တွင်: winget install Microsoft.AzureCLI
# macOS တွင်: brew install azure-cli
# Linux တွင်: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure သို့ လော့ဂ်အင် ဝင်ပါ
az login

# အတည်ပြုခြင်းကို စစ်ဆေးပါ
az account show
```

### Device Code အကောင့်အတည်ပြုခြင်း
သင် headless စနစ်ပေါ်တွင် ရှိနေပါက သို့မဟုတ် ဘရောက်ဇာ ပြဿနာရှိပါက:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
အလိုအလျောက်လုပ်ဆောင်သော ပတ်ဝန်းကျင်များအတွက်:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## ဖွဲ့စည်းမှု

### Global Configuration
```bash
# ပုံမှန် စာရင်း (subscription) ကို သတ်မှတ်ပါ
azd config set defaults.subscription <subscription-id>

# ပုံမှန် တည်နေရာကို သတ်မှတ်ပါ
azd config set defaults.location eastus2

# ဆက်တင်အားလုံးကို ကြည့်ရန်
azd config list
```

### Environment Variables
သင်၏ shell profile (`.bashrc`, `.zshrc`, `.profile`) ထဲသို့ ထည့်ပါ:
```bash
# Azure ဖွဲ့စည်းတပ်ဆင်မှု
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd ဖွဲ့စည်းတပ်ဆင်မှု
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # အမှားရှာဖွေရေး မှတ်တမ်းရေးကို ဖွင့်ပါ
```

## IDE ချိတ်ဆက်မှု

### Visual Studio Code
Azure Developer CLI extension ကို ထည့်သွင်းပါ:
1. VS Code ကို ဖွင့်ပါ
2. Extensions သို့ သွားပါ (Ctrl+Shift+X)
3. "Azure Developer CLI" ကို ရှာဖွေပါ
4. extension ကို ထည့်သွင်းပါ

အင်္ဂါရပ်များ:
- azure.yaml ဖိုင်အတွက် IntelliSense
- ပေါင်းစပ်ထားသော terminal ကော်မန်များ
- Template ရှာဖွေခြင်း
- ထိပ်တန်းတပ်ဆင်မှု စောင့်ကြည့်ခြင်း

### GitHub Codespaces
`.devcontainer/devcontainer.json` ဖိုင်ကို ဖန်တီးပါ:
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
2. Azure အကောင့် အတည်ပြုချက်များကို ဖွဲ့စည်းပါ
3. azd ကော်မန်များအတွက် ပေါင်းစပ် terminal ကို အသုံးပြုပါ

## 🐛 တပ်ဆင်မှု ပြဿနာရှာဖွေခြင်း

### သာမန် ပြဿနာများ

#### Permission Denied (Windows)
```powershell
# PowerShell ကို အုပ်ချုပ်ခွင့်ဖြင့် ဖွင့်ပါ
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH ပြဿနာများ
azd ကို သင်၏ PATH ထဲသို့ လက်ဖြင့် ထည့်ပါ:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### ကွန်ယက်/Proxy ပြဿနာများ
```bash
# Proxy ကို ပြင်ဆင်ပါ
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL အတည်ပြုချက်ကို ကျော်လွှားပါ (ထုတ်လုပ်ရေးပတ်ဝန်းကျင်တွင် အသုံးမပြုရန် အကြံပြုပါသည်)
azd config set http.insecure true
```

#### ဗားရှင်း အညှိနှိုင်းချိန်ပြဿနာများ
```bash
# အဟောင်းထည့်သွင်းထားမှုများကို ဖယ်ရှားပါ
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# ဆက်တင်များကို သန့်ရှင်းပါ
rm -rf ~/.azd
```

### ပိုမို အကူအညီလိုပါက
```bash
# debug မှတ်တမ်းရေးခြင်းကို ဖွင့်ပါ
export AZD_DEBUG=true
azd <command> --debug

# လက်ရှိ ဖွဲ့စည်းပုံကို ကြည့်ပါ
azd config list

# လက်ရှိ တပ်ဆင်မှု အခြေအနေကို ကြည့်ပါ
azd show
```

## azd အပ်ဒိတ်လုပ်ခြင်း

### အလိုအလျောက် အပ်ဒိတ်များ
azd သည် အပ်ဒိတ်များ ရရှိပါက သင်အား သတိပေးပါလိမ့်မည်။
```bash
azd version --check-for-updates
```

### လက်လွတ်အပ်ဒိတ်များ

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

## 💡 မကြာခဏ မေးလေ့ရှိသော မေးခွန်းများ

<details>
<summary><strong>azd နှင့် az CLI အကြား ကွာခြားချက်က ဘာလဲ?</strong></summary>

**Azure CLI (az)**: Azure ရင်းမြစ် တစ်ခုချင်းစီကို စီမံရန် အသုံးပြုသော အခြေခံ ကိရိယာ
- `az webapp create`, `az storage account create`
- တစ်ချိန်လျှင် တစ်ခုချင်းသာ ကိုင်တွယ်သည်
- အင်ဖရာစထရပ်ချာ စီမံခန့်ခွဲမှု အာရုံစိုက်သည်

**Azure Developer CLI (azd)**: အပြည့်အစုံ အပလီကေးရှင်း တပ်ဆင်မှုများအတွက် အဆင့်မြင့် ကိရိယာ
- `azd up` သည် အပလီကေးရှင်းတစ်ခုလုံးနှင့် အစုလိုက် အပစ္စည်းများအားလုံးကို တပ်ဆင်သည်
- Template အခြေပြု လုပ်ထုံးလုပ်နည်းများ
- ဖွံ့ဖြိုးရေးသမား ထုတ်လုပ်နိုင်မှုမြှင့်တင်ရန် အာရုံစိုက်သည်

**နှစ်ခုလုံး လိုအပ်သည်**: azd သည် authentication အတွက် az CLI ကို အသုံးပြုသည်
</details>

<details>
<summary><strong>ရှိပြီးသား Azure ရင်းမြစ်များနှင့် azd ကို အသုံးပြုလို့ ရပါသလား?</strong></summary>

ရပါတယ်! သင်သည် အောက်ပါအတိုင်း ပြုလုပ်နိုင်ပါသည်။
1. ရရှိပြီးသား ရင်းမြစ်များကို azd ပတ်ဝန်းကျင်များသို့ တင်သွင်းနိုင်သည်
2. ရရှိပြီးသား ရင်းမြစ်များကို သင့် Bicep templates များတွင် ကိုးကားနိုင်သည်
3. ရှိပြီးသား အင်ဖရာစထရပ်ချာနှင့် တွဲဖက်၍ azd ကို အသုံးပြု၍ အသစ်တပ်ဆင်မှုများ ပြုလုပ်နိုင်သည်

အသေးစိတ်အချက်အလက်များအတွက် [Configuration Guide](configuration.md) ကို ကြည့်ပါ။
</details>

<details>
<summary><strong>azd သည် Azure Government သို့မဟုတ် Azure China အတွက် လုပ်ဆောင်နိုင်ပါသလား?</strong></summary>

ဟုတ်ကဲ့၊ cloud ကို ပြင်ဆင်ပါ:
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
<summary><strong>CI/CD pipeline များတွင် azd ကို အသုံးပြုနိုင်မလား?</strong></summary>

တကယ်ပါပဲ! azd ကို အလိုအလျောက်လုပ်ငန်းများအတွက် ဒီဇိုင်းထုတ်ထားသည်။
- GitHub Actions ပေါင်းစည်းမှု
- Azure DevOps ပံ့ပိုးမှု
- Service principal အတည်ပြုခြင်း
- မတုံ့ပြန်နည်း (non-interactive) မုဒ်

CI/CD ပုံစံများအတွက် [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) ကို ကြည့်ပါ။
</details>

<details>
<summary><strong>azd ကို အသုံးပြုရန် ကျသင့်ငွေ ဘယ်လောက်လဲ?</strong></summary>

azd ကိုယ်တိုင်မှာ **အပြည့်အစုံ အခမဲ့** နှင့် open-source ဖြစ်သည်။ သင်သည် အောက်ပါအရာများအတွက်သာ ပေးဆောင်ရပါမည်။
- သင် တပ်ဆင်မည့် Azure အရင်းအမြစ်များ
- Azure အသုံးပြုခြင်း ကျသင့်ငွေ (compute, storage, စသည်)
တပ်ဆင်ရန်မပြုမီ ကုန်ကျစရိတ် ခန့်မှန်းရန် `azd provision --preview` ကို အသုံးပြုပါ။
</details>

## နောက်တစ်ဆင့်များ

1. **အကောင့်အတည်ပြုမှု ပြီးဆုံးပါစေ**: သင့် Azure subscription ကို အသုံးပြုနိုင်မှုရှိနေကြောင်း သေချာပါစေ
2. **သင့် ပထမဆုံး တပ်ဆင်မှုကို စမ်းသပ်ပါ**: [First Project Guide](first-project.md) ကို နှစ်ခြိုက်လိုက်နာပါ
3. **Template များကို လေ့လာပါ**: `azd template list` ဖြင့် ရနိုင်သော templates များကို ကြည့်ရှုပါ
4. **IDE ကို ဖွဲ့စည်းပါ**: သင့် ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်ကို ပြင်ဆင်ပါ

## ကူညီဆောင်ရွက်မှု

ပြဿနာများဖြစ်ပေါ်ပါက:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md) 
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation Complete!** Continue to [Your First Project](first-project.md) to start building with azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
အသိပေးချက်:
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု Co-op Translator (https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းသော်လည်း အလိုအလျောက်ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါရှိနိုင်ကြောင်း သတိပြုပါ။ မူရင်းစာရွက်စာတမ်းကို မူရင်းဘာသာစကားဖြင့် ယုံကြည်စိတ်ချရသော အရင်းအမြစ်အဖြစ် စဉ်းစားသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် ကျွမ်းကျင်သော လူ့ဘာသာပြန်မှ အတည်ပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာနိုင်သည့် နားလည်မှုပြဿနာများ သို့မဟုတ် အဓိပ္ပာယ် မမှန်ခြင်းတို့အတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->