# တပ်ဆင်ခြင်း နှင့် စတင်ပြင်ဆင်မှု လမ်းညွှန်

**အခန်း သွားလာခြင်း:**
- **📚 Course Home**: [AZD စတင်သူများအတွက်](../../README.md)
- **📖 Current Chapter**: အခန်း 1 - အခြေခံနှင့် အလျင်အမြန် စတင်ခြင်း
- **⬅️ Previous**: [AZD အခြေခံများ](azd-basics.md)
- **➡️ Next**: [သင့် ပထမ ပရောဂျက်](first-project.md)
- **🚀 Next Chapter**: [အခန်း 2: AI ဦးစားပေး ဖွံ့ဖြိုးရေး](../chapter-02-ai-development/microsoft-foundry-integration.md)

## မိတ်ဆက်

ဤ စုံလင်သည့် လမ်းညွှန်စာတမ်းသည် သင့် စနစ်ပေါ်တွင် Azure Developer CLI (azd) ကို တပ်ဆင်နှင့် လိုက်ဖက်အောင် ပြင်ဆင်ပေးစေရန် လမ်းလျှောက်ပေးပါမည်။ လုပ်ငန်းစနစ်အမျိုးမျိုးအတွက် တပ်ဆင်ခြင်းနည်းလမ်းများ၊ အတည်ပြုရေး setup နှင့် Azure သို့ ဖြန့်ချိရန် သင့် ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်ကို ကြိုတင်ပြင်ဆင်ရန် လိုအပ်သော မူပိုင်ဖိုင်များကို သင်ယူသွားရပါမည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

သင်သည် သင်ခန်းစာ အဆုံးတွင်:
- သင့် လုပ်ငန်းစနစ်ပေါ်တွင် Azure Developer CLI ကို အောင်မြင်စွာ တပ်ဆင်နိုင်မည်
- Azure နှင့် ချိတ်ဆက်ရန် အတည်ပြုရေးကို နည်းလမ်းအမျိုးမျိုးဖြင့် ပြင်ဆင်နိုင်မည်
- လိုအပ်သော ကြိုတင်လိုအပ်ချက်များနှင့်အတူ သင့် ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်ကို ပြင်ဆင်တပ်ဆင်နိုင်မည်
- တပ်ဆင်ခြင်းရွေးချယ်စရာ မျိုးစုံကို နားလည်ပြီး မည့်အခါ ဘယ်နည်းကို အသုံးပြုရမည်ကို သိရှိမည်
- ပေါ်တတ်သော တပ်ဆင်ခြင်းနှင့် စတင်ပြင်ဆင်မှုဆိုင်ရာ အခက်အခဲများကို ဖြေရှင်းနိုင်မည်

## သင်ယူပြီးရရှိမည့် ထွက်ရှိချက်များ

ဤ သင်ခန်းစာပြီးဆုံးပါက သင်သည်
- သင့် ပလက်ဖောင်းအတွက် သင့်တော်သည့် နည်းလမ်းဖြင့် azd ကို တပ်ဆင်နိုင်မည်
- azd auth login ကို အသုံးပြု၍ Azure တွင် အတည်ပြုနိုင်မည်
- သင့်တပ်ဆင်မှုကို အတည်ပြု၍ အခြေခံ azd အမိန့်များကို စမ်းသပ်နိုင်မည်
- azd အကောင်းဆုံး အသုံးချမှုအတွက် သင့် ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်ကို ဆက်တင်နိုင်မည်
- ပေါ်တတ်သော တပ်ဆင်မှု ပြဿနာများကို ကိုယ်တိုင် ဖြေရှင်းနိုင်မည်

ဤ လမ်းညွှန်သည် သင့် လုပ်ငန်းစနစ် သို့မဟုတ် ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင် မည်သို့ ဖြစ်ဖြစ် Azure Developer CLI ကို တပ်ဆင်နှင့် ပြင်ဆင်ရန် ကူညီပေးပါမည်။

## ကြိုတင်လိုအပ်ချက်များ

azd ကို တပ်ဆင်မှီ မတိုင်မီ အောက်ပါအရာများ ရှိကြောင်း သေချာပါစေ။
- **Azure subscription** - [အခမဲ့ အကောင့် ဖန်တီးရန်](https://azure.microsoft.com/free/)
- **Azure CLI** - အတည်ပြုရေးနှင့် အရင်းအမြစ် စီမံခန့်ခွဲမှုအတွက်
- **Git** - စံနမူနာများ ကူးယူရန်နှင့် ဗားရှင်း ထိန်းချုပ်မှုအတွက်
- **Docker** (optional) - ကွန်တိန်နာပိုင်ဆိုင်သော အက်ပလီကေးရှင်းများအတွက်

## တပ်ဆင်မှု နည်းလမ်းများ

### Windows

#### Option 1: Windows Package Manager (အကြံပြု)
```cmd
winget install microsoft.azd
```

#### Option 2: PowerShell Install Script
```powershell
# winget မရနိုင်သောအချိန်တွင် အသုံးဝင်သည်
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. [GitHub](https://github.com/Azure/azure-dev/releases) မှ နောက်ဆုံးထုတ်ဝေမှုကို ဒေါင်းလုဒ်ပါ
2. `C:\Program Files\azd\` သို့ ဖွင့်ထုတ်ပါ
3. PATH environment variable ထဲသို့ ထည့်ပါ

### macOS

#### Option 1: Homebrew (အကြံပြု)
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
# ဒေါင်းလုဒ်လုပ်၍ ထည့်သွင်းပါ
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (အကြံပြု)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Manual installation from release assets:**
```bash
# သင့် Linux ဆောက်ပုံ (architecture) အတွက် နောက်ဆုံးထွက် archive ကို အောက်ပါနေရာမှ ဒေါင်းလုတ်ဆွဲပါ:
# https://github.com/Azure/azure-dev/releases
# အဲဒီဖိုင်ကို ရှင်းထုတ်၍ azd ဘိုင်နရီကို သင့် PATH ထဲသို့ ထည့်ပါ။
```

### GitHub Codespaces

Codespaces အချို့နှင့် dev container ပတ်ဝန်းကျင်များတွင် `azd` ကို များပြားစွာ ထည့်သွင်းထားပြီး ဖြစ်နိုင်သော်လည်း ယူဆမထားဘဲ စစ်ဆေးသင့်သည်။

```bash
azd version
```

`azd` မရှိပါက ပတ်ဝန်းကျင်အတွက် စံမှတ်ထားသော စာရင်းကို အသုံးပြုပြီး တပ်ဆင်ပါ။

### Docker

```bash
# azd ကို ကွန်တိနာထဲတွင် ပြေးပါ
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# အသုံးပြုရပိုလွယ်အောင် alias တစ်ခု ဖန်တီးပါ
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ တပ်ဆင်မှု အတည်ပြုခြင်း

တပ်ဆင်ပြီးနောက် azd သည် မှန်ကန်စွာ အလုပ်လုပ်နေသည်ကို အတည်ပြုပါ။

```bash
# ဗားရှင်းကိုစစ်ဆေးပါ
azd version

# အကူအညီကိုကြည့်ပါ
azd --help

# အသုံးပြုနိုင်သည့်ပုံစံများကိုစာရင်းပြပါ
azd template list
```

မျှော်မှန်း ထွက်လာမှု:
```
azd version 1.x.x (commit xxxxxx)
```

**မှတ်ချက်**: ဤနေရာတွင် ကိုင်တွယ်ထားသော ဗားရှင်းနံပါတ်သည် ကွဲပြားနိုင်သည်။ နောက်ဆုံးဗားရှင်းအတွက် [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) ကို စစ်ဆေးပါ။

**✅ တပ်ဆင်မှု အောင်မြင်မှု စစ်တမ်းစာရင်း:**
- [ ] `azd version` တွင် အမှားမရှိပဲ ဗားရှင်းနံပါတ်ကို ပြပါ
- [ ] `azd --help` တွင် အမိန့်စာရွက်စာတမ်းများကို ပြပါ
- [ ] `azd template list` တွင် ရရှိနိုင်သော စံနမူနာများကို ပြပါ
- [ ] စမ်းသပ်ရန် ဖိုလ်ဒါတစ်ခု ဖန်တီးပြီး `azd init` ကို အောင်မြင်စွာ ပြုလုပ်နိုင်ပါသည်

**အားလုံး စစ်ဆေးမှုများ ဖြတ်ကျော်ပါက၊ [သင့် ပထမ ပရောဂျက်](first-project.md) သို့ ဆက်လက် ရောက်ရှိနိုင်ပါပြီ!**

## အတည်ပြုရေး ပြင်ဆင်ခြင်း

### စတင်သူများအတွက် အကြံပြု ပြင်ဆင်ချက်

AZD-ပထမ လုပ်ငန်းစဉ်များအတွက် `azd auth login` ဖြင့် သွားရောက်サိုင်မာင်းပါ။

```bash
# azd up ကဲ့သို့သော AZD အမိန့်များအတွက် လိုအပ်သည်
azd auth login

# AZD အတည်ပြုမှု အခြေအနေကို စစ်ဆေးပါ
azd auth login --check-status
```

သင် သင်တန်းအတွင်း `az` အမိန့်များကို ကိုယ်တိုင် ပြေးရမည့် အစီအစဉ်ရှိပါကသာ Azure CLI ဖြင့် サိုင်င်းလုပ်ပါ။

### Azure CLI Authentication (ရွေးခွင့်)

```bash
# Azure CLI ကို မထည့်ထားသေးလျှင် တပ်ဆင်ပါ
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: သင့် ဖြန့်ချိပုံအတွက် Azure CLI တပ်ဆင်ရန် လမ်းညွှန်စာတမ်းကို ကြည့်ပါ

# Azure သို့ လော့ဂ်အင် ဝင်ပါ
az login

# အကောင့်အတည်ပြုမှုကို စစ်ဆေးပါ
az account show
```

### ဘယ် Sign-In Flow ကို အသုံးပြုသင့်သလဲ?

- သင်သည် AZD စတင်သူ လမ်းကြောင်းအတိုင်း လိုက်နာ၍ အဓိကအားဖြင့် `azd` အမိန့်များကို အသုံးပြုလျှင် `azd auth login` ကို အသုံးပြုပါ။
- `az account show` ကဲ့သို့ Azure CLI အမိန့်များကို ကိုယ်တိုင် ပြေးလိုပါက `az login` ကိုလည်း အသုံးပြုပါ။
- လေ့ကျင့်ခန်းတစ်ခု၌ `azd` နှင့် `az` အမိန့်များ နှစ်သပ်ပါက စတင်ချိန်တွင် နှစ်ခုစလုံး サိုင်င်းလုပ်ပါ။

### Device Code Authentication
headless စနစ်တွင် သို့မဟုတ် ဘရောက်ဇာ ပြဿနာများ ရှိပါက:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
အလိုအလျောက်ပြုလုပ်သော ပတ်ဝန်းကျင်များအတွက်:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### သင့် ပြင်ဆင်မှု အားလုံးကို အတည်ပြုပါ

အခန်း ၁ စတင်ရန်မစတင်မီ တိုက်ရိုက် စစ်ဆေးလိုပါက -

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## ဖွဲ့စည်းမှု

### Global Configuration
```bash
# ပုံမှန် စာရင်းသွင်းမှုကို သတ်မှတ်ပါ
azd config set defaults.subscription <subscription-id>

# ပုံမှန် တည်နေရာကို သတ်မှတ်ပါ
azd config set defaults.location eastus2

# ဆက်တင်များအားလုံးကို ကြည့်ပါ
azd config show
```

### ပတ်ဝန်းကျင် သတ်မှတ်ချက်များ
သင့် shell profile (`.bashrc`, `.zshrc`, `.profile`) ထဲသို့ ထည့်ပါ:
```bash
# Azure ဆက်တင်
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd ဆက်တင်
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # အမှားရှာဖွေရေးမှတ်တမ်းများကို ဖွင့်ပါ
```

## IDE ပေါင်းစည်းမှု

### Visual Studio Code
Azure Developer CLI extension ကို တပ်ဆင်ပါ:
1. VS Code ကို ဖွင့်ပါ
2. Extensions သို့ သွားပါ (Ctrl+Shift+X)
3. "Azure Developer CLI" ကို ရှာဖွေပါ
4. extension ကို ထည့်ပါ

အင်္ဂါရပ်များ:
- azure.yaml အတွက် IntelliSense
- ပေါင်းစည်းထားသော terminal အမိန့်များ
- စံနမူနာ ရှာဖွေရေး
- တင်ပို့မှု စောင့်ကြပ်မှု

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
1. Azure plugin ကို ထည့်ပါ
2. Azure အတည်ပြုချက်များကို ဆက်တင်ပါ
3. azd အမိန့်များအတွက် ပေါင်းစည်းထားသော terminal ကို အသုံးပြုပါ

## 🐛 တပ်ဆင်မှု ပြဿနာ ရှာဖွေ ဖြေရှင်းခြင်း

### အများကြုံ ဖြစ်ပေါ်တတ်သော ပြဿနာများ

#### Permission Denied (Windows)
```powershell
# PowerShell ကို အုပ်ချုပ်သူ အဖြစ် ဖွင့်၍ လည်ပတ်ပါ
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH ပြဿနာများ
လက်ကိုဖြင့် azd ကို PATH ထဲသို့ ထည့်ပါ။

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
# Proxy ကို ပြင်ဆင်ပါ
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL အတည်ပြုမှုကို ကျော်လွှားပါ (ထုတ်လုပ်မှုအတွက် မအကြံပြုပါ)
azd config set http.insecure true
```

#### ဗားရှင်းနှိုင်းယှဉ်မှု ပြဿနာများ
```bash
# အဟောင်း ထည့်သွင်းမှုများကို ဖယ်ရှားပါ
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: ထပ်မံထည့်သွင်းမီ အရင် azd ဘိုင်နရီ သို့မဟုတ် symlink ကို ဖယ်ရှားပါ

# ဆက်တင်များကို သန့်ရှင်းပါ
rm -rf ~/.azd
```

### အထက်ပို အကူအညီ ရယူခြင်း
```bash
# ဒီဘတ် (debug) မှတ်တမ်းရေးခြင်းကို ဖွင့်ပါ
export AZD_DEBUG=true
azd <command> --debug

# လက်ရှိ ဆက်တင်များကို ကြည့်ပါ
azd config show

# လက်ရှိ တပ်ဆင်ထားမှု အခြေအနေကို ကြည့်ပါ
azd show
```

## azd ကို အပ်ဒိတ်လုပ်ခြင်း

### အပ်ဒိတ် စစ်ဆေးခြင်း
azd သည် မကြာခဏ ဗားရှင်းအသစ် ရရှိသည့်အခါ သတိပေးပါသည်၊ သင်၏ လက်ရှိ build ကို စစ်ဆေးရန်:
```bash
azd version
```

### လက်လှမ်းမီ အပ်ဒိတ်များ

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

## 💡 မကြာခဏမေးလေ့ရှိသော မေးခွန်းများ

<details>
<summary><strong>azd နှင့် az CLI တို့ ကြားက မတူညီချက် ဘာလဲ?</strong></summary>

**Azure CLI (az)**: တစ်ခုချင်းစီ Azure အရင်းအမြစ်များကို စီမံခန့်ခွဲရန် နှုန်းကျဉ်းသော ကိရိယာ
- `az webapp create`, `az storage account create`
- တစ်ခုချင်း အရင်းအမြစ်အလိုက်လုပ်ဆောင်သည်
- အဆောက်အအုံ စီမံခန့်ခွဲမှု အာရုံစိုက်မှုရှိသည်

**Azure Developer CLI (azd)**: အက်ပလီကေးရှင်းအပြည့်အစုံ ဖြန့်ချိရန် အဆင့်မြင့်ကိရိယာ
- `azd up` သည် အားလုံးသော အရင်းအမြစ်များနှင့် အက်ပလီကေးရှင်းကို တစ်ပြိုင်နက် ဖြန့်ချိပေးသည်
- စံနမူနာ အခြေခံ လမ်းကြောင်းများကို အသုံးပြုသည်
- ဖွံ့ဖြိုးရေးသူ ထုတ်လုပ်မှုမြှင့်တင်ရေး အာရုံစိုက်သည်

**နှစ်ခုလုံး လိုအပ်သည်**: azd သည် အတည်ပြုရေးအတွက် az CLI ကို အသုံးပြုသည်
</details>

<details>
<summary><strong>ကျွန်ုပ်တို့၏ ရှိပြီးသား Azure အရင်းအမြစ်များနှင့် azd ကို အသုံးပြုနိုင်ပါသလား?</strong></summary>

ဟုတ်ပါသည်! သင့်လက်ရှိ အရင်းအမြစ်များနှင့်အတူ:
1. ရှိပြီးသား အရင်းအမြစ်များကို azd environment များထဲသို့ Import လုပ်နိုင်သည်
2. ရှိပြီးသား အရင်းအမြစ်များကို သင့် Bicep စံနမူနာများတွင် ကိုးကားနိုင်သည်
3. azd ကို အသုံးပြု၍ အသစ်တင်ဆောက်မှုများကို ရှိပြီးသား အဆောက်အအုံနှင့် ပြန်လည်ပေါင်းစည်းနိုင်သည်

အသေးစိတ်အချက်အလက်များအတွက် [Configuration Guide](configuration.md) ကို ကြည့်ပါ။
</details>

<details>
<summary><strong>azd သည် Azure Government သို့မဟုတ် Azure China နှင့် အလုပ်လုပ်နိုင်သလား?</strong></summary>

ဟုတ်ပါတယ်၊ cloud ကို သတ်မှတ် (configure) လုပ်ပါ:
```bash
# အေဇာ အစိုးရ
az cloud set --name AzureUSGovernment
az login

# အေဇာ တရုတ်
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>azd ကို CI/CD pipeline များတွင် အသုံးပြုနိုင်ပါသလား?</strong></summary>

အပြည့်အဝ ရနိုင်ပါသည်! azd သည် အလိုအလျောက်လုပ်ငန်းအတွက် ဒီဇိုင်းပြုလုပ်ထားသည်။
- GitHub Actions ပေါင်းစည်းမှု
- Azure DevOps ထောက်ခံမှု
- Service principal အတည်ပြုရေး
- Non-interactive mode

CI/CD ပုံစံအတွက် အသေးစိတ်ကို ရှာရန် [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) ကို ကြည့်ပါ။
</details>

<details>
<summary><strong>azd အသုံးပြုရန် ကုန်ကျစရိတ် ဘယ်လောက်ပါသလဲ?</strong></summary>

azd ကိုယ်တိုင်မှာ **အပြစ်မရှိ၊ အခမဲ့** ဖြစ်ပြီး open-source ဖြစ်ပါသည်။ သင်ပေးချေရမည့် အရာများမှာ -
- သင် တင်သွင်းသည့် Azure အရင်းအမြစ်များအတွက် ကုန်ကျစရိတ်
- Azure အသုံးပြုမှု ကုန်ကျစရိတ်များ (compute, storage စသည်)

deployment မပြုလုပ်မီ ကုန်ကျစရိတ် ခန့်မှန်းရန် `azd provision --preview` ကို အသုံးပြုပါ။
</details>

## နောက်တစ်ဆင့်များ

1. **အတည်ပြုရေး ပြီးဆောင်ရွက်ပါ**: သင့် Azure subscription သို့ ဝင်ရောက်နိုင်မှု ရှိကြောင်း သေချာပါစေ
2. **သင့် ပထမ ပရောဂျက်ကို စမ်းသပ်ပါ**: [ပထမ ပရောဂျက် လမ်းညွှန်](first-project.md) ကို လိုက်နာပါ
3. **စံနမူနာများကို စူးစမ်းပါ**: `azd template list` ဖြင့် ရှာဖွေကြည့်ပါ
4. **IDE ကို ပြင်ဆင်ပါ**: သင့် ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်ကို ဆက်တင်ပါ

## ထောက်ခံမှု

ပြဿနာများ ကြုံတွေ့ပါက -
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - သင့် အယ်ဒီတာတွင် တိုက်ရိုက် Azure အမိန့်လမ်းညွှန်ချက်များ ရရန် `npx skills add microsoft/github-copilot-for-azure` ကို အသုံးပြုပါ

---

**အခန်း သွားလာခြင်း:**
- **📚 Course Home**: [AZD စတင်သူများအတွက်](../../README.md)
- **📖 Current Chapter**: အခန်း 1 - အခြေခံနှင့် အလျင်အမြန် စတင်ခြင်း
- **⬅️ Previous**: [AZD အခြေခံများ](azd-basics.md) 
- **➡️ Next**: [သင့် ပထမ ပရောဂျက်](first-project.md)
- **🚀 Next Chapter**: [အခန်း 2: AI ဦးစားပေး ဖွံ့ဖြိုးရေး](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ တပ်ဆင်မှု အပြီးမြောက်ပါပြီ!** azd နဲ့ တည်ဆောက်မှု စတင်ရန် [သင့် ပထမ ပရောဂျက်](first-project.md) သို့ ဆက်လက်သွားပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာရွက်ကို AI ဘာသာပြန်မှု ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းပေမယ့် အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါရှိနိုင်ကြောင်း သတိပြုပါ။ မူလစာရွက်ကို မူလဘာသာဖြင့် ဖတ်ရှုခြင်းကို သီးသန့် အာဏာရှိသော အရင်းအမြစ်အဖြစ် ယူဆသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူ့ဘာသာပြန်ကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုသည့်အတွက် ဖြစ်ပေါ်လာသည့် နားမလည်မှုများ သို့မဟုတ် အဓိပ္ပာယ်မှားဖတ်ခြင်းများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မရှိပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->