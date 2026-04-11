# သင်၏ ပထမ Project - လက်တွေ့ လမ်းညွှန်

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## နိဒါန်း

သင်၏ ပထမ Azure Developer CLI project သို့ ကြိုဆိုပါတယ်! ဒီလက်တွေ့ လမ်းညွှန်မှာ azd ကို အသုံးပြုပြီး React frontend, Node.js API backend, နှင့် MongoDB database ပါဝင်တဲ့ တစ်စုံတစ်ရာ full-stack အက်ပလီကေးရှင်းကို ဖန်တီး၊ တပ်ဆင် နှင့် စီမံခန့်ခွဲမှု အပြည့်အစုံကို လိုက်လံလေ့လာနိုင်မယ်။

## သင်ယူရန် ပြဿနာများ

ဒီလမ်းညွှန်ကိုပြီးမြောက်ပါက သင်သည်:
- azd project initialization workflow ကို template များဖြင့် ကျွမ်းကျင်စွာ အသုံးပြုနိုင်မည်
- Azure Developer CLI project ဖွဲ့စည်းပုံနှင့် configuration ဖိုင်များကို နားလည်မည်
- အက်ပလီကေးရှင်းကို အပြည့်အစုံ Azure သို့ infrastructure provisioning နှင့်အတူ တပ်ဆင်နိုင်မည်
- အက်ပလီကေးရှင်း အချက်အလက်များကို ပြုပြင်ပြီး ပြန်တပ်ဆင်နည်းများကို လက်ခံအသုံးချနိုင်မည်
- development နှင့် staging အတွက် မတူညီသော environment များကို စီမံနိုင်မည်
- resource cleanup နှင့် စရိတ် စီမံခန့်ခွဲမှု နည်းလမ်းများကို အသုံးချနိုင်မည်

## သင်ယူပြီးရရှိမည့် အကျိုးကျေးဇူးများ

ပြီးမြောက်လျှင် သင်သည်:
- azd project များကို template များမှ ဆောက်လုပ်ခြင်းနှင့် ဖွင့်သတ်မှတ်ခြင်းကို သီးခြားလုပ်ဆောင်နိုင်မည်
- azd project ဖွဲ့စည်းပုံများကို ထိန်းသိမ်း ပြင်ဆင်နိုင်မည်
- တစ်ချက် command ဖြင့် full-stack applications ကို Azure သို့ တပ်ဆင်နိုင်မည်
- deployment ပြဿနာများနှင့် authentication ပြဿနာများကို ပြဿနာဖြေရှင်းနိုင်မည်
- မတူညီသော deployment အဆင့်များအတွက် မျိုးစုံ environment များကို စီမံနိုင်မည်
- အက်ပလီကေးရှင်း အချက်အလက် ပြင်ဆင်မှုများအတွက် continuous deployment workflow များကို အကောင်အထည်ဖော်နိုင်မည်

## စတင်ရန်

### လိုအပ်သော အချက်အလက်များ စစ်ဆေးစာရင်း
- ✅ Azure Developer CLI installed ([Installation Guide](installation.md))
- ✅ AZD authentication completed with `azd auth login`
- ✅ Git installed on your system
- ✅ Node.js 16+ (for this tutorial)
- ✅ Visual Studio Code (recommended)

ဆက်လက်မလုပ်ဆောင်မီ repository root ကနေ setup validator ကို chạyပါ။

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### သင့် setup ကို သေချာစစ်ဆေးခြင်း
```bash
# azd ထည့်သွင်းထားမှုကို စစ်ဆေးပါ
azd version

# AZD အတည်ပြုခြင်းကို စစ်ဆေးပါ
azd auth login --check-status
```

### Azure CLI authentication ကို ရွေးချယ်စစ်ဆေးပါ (optional)

```bash
az account show
```

### Node.js version ကို စစ်ဆေးပါ
```bash
node --version
```

## အဆင့် 1: Template ရွေးပြီး Initialize လုပ်ပါ

React frontend နှင့် Node.js API backend ပါဝင်တဲ့ နာမည်ကြီး todo application template တစ်ခုနဲ့ စတင်လိုက်ကြပါစို့။

```bash
# ရရှိနိုင်သည့် နမူနာများကို ကြည့်ရှုပါ
azd template list

# todo အက်ပ် နမူနာကို စတင်ဖန်တီးပါ
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# မေးခွန်းများအတိုင်း လိုက်နာပါ:
# - ပတ်ဝန်းကျင်အမည်ကို ထည့်ပါ: "dev"
# - စာရင်းသွင်းမှုကို ရွေးချယ်ပါ (အများကြီး ရှိပါက)
# - တိုင်းဒေသကို ရွေးချယ်ပါ: "East US 2" (သို့မဟုတ် သင်နှစ်သက်သည့် တိုင်းဒေသ)
```

### ဘာတွေ ဖြစ်သွားတာလဲ?
- template ကုဒ်ကို သင့် local directory ထဲသို့ ဒေါင်းလိုက်ပြီး
- service သတ်မှတ်ချက်များပါရှိသော `azure.yaml` ဖိုင်ကို ဖန်တီးခဲ့ပြီး
- `infra/` directory ထဲမှာ infrastructure ကုဒ်ကို ပြင်ဆင်ထားပြီး
- environment configuration ကို တည်ဆောက်ထားပါသည်

## အဆင့် 2: Project ဖွဲ့စည်းပုံ ကို စုံစမ်းကြည့်ရှုပါ

azd က ကျွန်တော်တို့အတွက် ဘာတွေ ဖန်တီးပေးလိုက်တာတွေကို ကြည့်ကြရအောင်။

```bash
# ပရောဂျက် ဖွဲ့စည်းပုံကို ကြည့်ပါ
tree /f   # Windows
# သို့မဟုတ်
find . -type f | head -20   # macOS/Linux
```

သင့်မြင်ရမယ့် အရာများ:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### နားလည်ရန် အရေးကြီး ဖိုင်များ

**azure.yaml** - သင့် azd project ၏ မျှားစွာသော အနှလုံး:
```bash
# ပရောဂျက် ဖွဲ့စည်းပုံကို ကြည့်ပါ
cat azure.yaml
```

**infra/main.bicep** - Infrastructure သတ်မှတ်ချက်:
```bash
# အခြေခံအဆောက်အအုံကုဒ်ကို ကြည့်ပါ
head -30 infra/main.bicep
```

## အဆင့် 3: သင့် Project ကို ကိုယ့်လိုက် ပြင်ဆင်ပါ (Optional)

deploy မလုပ်ခင် အက်ပလီကေးရှင်းကို တည်းဖြတ်နိုင်ပါတယ်။

### Frontend ကို ပြင်ဆင်ပါ
```bash
# React အက်ပ်၏ ကွန်ပိုနင့်ကို ဖွင့်ပါ
code src/web/src/App.tsx
```

လမ်းလွတ်ပြောင်းလဲမှု တစ်ခု ပြုလုပ်ပါ:
```typescript
// ခေါင်းစဉ်ကို ရှာဖွေပြီး ပြောင်းလဲပါ
<h1>My Awesome Todo App</h1>
```

### Environment Variables ကို ပြင်ဆင်ပါ
```bash
# စိတ်ကြိုက် ပတ်ဝန်းကျင် တန်ဖိုးများ သတ်မှတ်ရန်
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# ပတ်ဝန်းကျင် တန်ဖိုးအားလုံး ကြည့်ရန်
azd env get-values
```

## အဆင့် 4: Azure သို့ Deploy လုပ်ပါ

အခုတော့ စိတ်လှုပ်ရှားဖွယ် အပိုင်း — အားလုံးကို Azure သို့ တပ်ဆင်ကြမယ်!

```bash
# အောက်ခံအဆောက်အအုံနှင့် အက်ပလီကေးရှင်း တပ်ဆင်ခြင်း
azd up

# ဤ အမိန့်သည် အောက်ပါ အရာများကို လုပ်ဆောင်ပါလိမ့်မည်:
# 1. Azure အရင်းအမြစ်များ (App Service, Cosmos DB, စသည်) ကို တည်ဆောက်ပေးသည်။
# 2. သင့် အက်ပလီကေးရှင်းကို ဆောက်လုပ်သည်။
# 3. တည်ဆောက်ထားသော အရင်းအမြစ်များသို့ တပ်ဆင်သည်။
# 4. အက်ပလီကေးရှင်း၏ URL ကို ပြသသည်။
```

### Deployment ဖြစ်စဉ်အတွင်း ဘာတွေ ဖြစ်နေသလဲ?

`azd up` command က အောက်ပါ အဆင့်များကို ဆောင်ရွက်ပါတယ်။
1. **Provision** (`azd provision`) - Azure resources များကို ဖန်တီးခြင်း
2. **Package** - သင့် application ကုဒ်ကို တည်ဆောက်ခြင်း
3. **Deploy** (`azd deploy`) - ကုဒ်ကို Azure resources များသို့ တပ်ဆင်ခြင်း

### မျှော်မှန်းထားသင့်တဲ့ အထွေထွေ output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## အဆင့် 5: သင့် အက်ပလီကေးရှင်းကို စမ်းသပ်ပါ

### သင့် အက်ပလီကေးရှင်းသို့ ဝင်ရောက်ခြင်း
deployment output မှာ ပေးထားတဲ့ URL ကို နှိပ်လိုက်ပါ၊ သို့မဟုတ် အချိန်မရွေး ရယူနိုင်ပါတယ်။
```bash
# အပလီကေးရှင်း၏ endpoints များကို ရယူပါ
azd show

# သင့် ဘရောက်ဇာတွင် အပလီကေးရှင်းကို ဖွင့်ပါ
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo App ကို စမ်းသပ်ပုံ
1. **todo item တစ်ခု ထည့်ပါ** - "Add Todo" ကိုနှိပ်ပြီး တာဝန်တစ်ခုရိုက်ထည့်ပါ
2. **ပြီးဆုံးအဖြစ် သတ်မှတ်ပါ** - ပြီးဆုံးပြီးသော အစိတ်အပိုင်းများကို ကလစ်ပေးကတ်ပါ
3. **အရာများ ဖျက်ပါ** - မလိုအပ်တော့သော todos များကို ဖျက်ပစ်ပါ

### သင့် အက်ပလီကေးရှင်းကို မျှော်လင့် မလိုက်ပါ
```bash
# သင့်ရဲ့ အရင်းအမြစ်များအတွက် Azure portal ကို ဖွင့်ပါ
azd monitor

# အက်ပလီကေးရှင်းလော့ဂ်များကို ကြည့်ရှုပါ
azd monitor --logs

# တိုက်ရိုက် မီထရစ်များကို ကြည့်ရှုပါ
azd monitor --live
```

## အဆင့် 6: ပြင်ဆင်ပြီး ပြန်တပ်ဆင်ပါ

တစ်ချက် ပြင်ဆင်ပြီး အဆင်ပြေပြန်တပ်ဆင်ရမယ်ဆိုတာ ဘယ်လောက်လွယ်ကူလဲ တွေ့ကြရအောင်။

### API ကို ပြင်ဆင်ပါ
```bash
# API ကုဒ်ကို တည်းဖြတ်ပါ
code src/api/src/routes/lists.js
```

custom response header တစ်ခု ထည့်ပါ:
```javascript
// လမ်းကြောင်းကို ကိုင်တွယ်သူကို ရှာ၍ ထည့်ပါ:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ကုဒ်ပြောင်းလဲမှုတွေကိုသာ တပ်ဆင်မယ်
```bash
# အောက်ခံအဆောက်အအုံကို မထည့်ဘဲ အက်ပလီကေးရှင်းကုဒ်ပဲ တင်ပါ။
azd deploy

# အောက်ခံအဆောက်အအုံ ရှိပြီးသားဖြစ်တဲ့အတွက် 'azd up' ထက် ဒါက ပိုမြန်ပါတယ်။
```

## အဆင့် 7: မျိုးစုံ Environment များကို စီမံပါ

production အောင် ထည့်မပို့ခင် changes များကို စမ်းသပ်ဖို့ staging environment တစ်ခု စတင်ဖန်တီးပါ။

```bash
# staging ပတ်ဝန်းကျင် အသစ်တစ်ခု ဖန်တီးပါ
azd env new staging

# staging သို့ တပ်ဆင်ပါ
azd up

# dev ပတ်ဝန်းကျင်သို့ ပြန်ပြောင်းပါ
azd env select dev

# ပတ်ဝန်းကျင် အားလုံးကို စာရင်းပြပါ
azd env list
```

### Environment များကို နှိုင်းယှဉ်ခြင်း
```bash
# ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင် ကြည့်ရန်
azd env select dev
azd show

# အဆင့်စမ်းသပ် ပတ်ဝန်းကျင် ကြည့်ရန်
azd env select staging
azd show
```

## အဆင့် 8: Resources များ ကို စနစ်တကျ ဖျက်ရှင်းပါ

သင်စမ်းသပ်တာ အင်္ဂါရပ်ပြီးသွားရင် မရပ်မနား စရိတ်ဖြစ်ပေါ်မှု မဖြစ်စေရန် resource များကို သန့်ရှင်းပါ။

```bash
# လက်ရှိ ပတ်ဝန်းကျင်အတွက် Azure အရင်းအမြစ်များအားလုံးကို ဖျက်ပါ
azd down

# အတည်မမေးဘဲ အတင်းအဖျက်လုပ်ပြီး soft-delete လုပ်ထားသော အရင်းအမြစ်များကိုလည်း သန့်ရှင်းစွာ ဖျက်ပစ်ပါ
azd down --force --purge

# တိကျသော ပတ်ဝန်းကျင်ကို ဖျက်ပါ
azd env select staging
azd down --force --purge
```

## Classic App vs. AI-Powered App: Workflow တူညီတယ်

သင်ဟာ ရိုးရှင်းတဲ့ web application တစ်ခုကို တပ်ဆင်လိုက်ပြီ။ ဒါပေမယ့် Microsoft Foundry Models နဲ့ ထောက်ပံ့ထားတဲ့ chat application ကဲ့သို့ AI-powered app တစ်ခုကို တပ်ဆင်ချင်တယ်ဆိုရင်ဘယ်လိုလဲ?

ကောင်းသောသတင်းက: **workflow က တူညီနေပါပြီ။**

| Step | ရိုးရာ Todo အက်ပ် | AI Chat အက်ပ် |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

ကွာခြားချက် တစ်ခုတည်းက သင်စတင်ထားသော **template** ဖြစ်ပါတယ်။ AI template က Microsoft Foundry Models resource သို့မဟုတ် AI Search index ကဲ့သို့ အပို infrastructure များကို လည်း ပါရှိနိုင်ပါတယ်၊ ဒါပေမယ့် azd က အဲဒီအချက်အလက်များအားလုံးကို ကိုင်တွယ်ပေးပါတယ်။ သင်နောက်ထပ် command အသစ်တစ်ခု သင်ယူဖို့ မလိုတော့ပါ၊ ကိရိယာအသစ်တစ်ခု အသုံးပြုဖို့ မလိုတော့ပါ၊ deployment အကြောင်းအရာကို ထင်မြင်ပုံကို မပြောင်းလဲရန် လိုမယ်။

azd ၏ မူလ သဘောတရားက: **တစ်ခုတည်းသော workflow, မည်သည့် workload မဆို။** ဤ လမ်းညွှန်တွင် လေ့ကျင့်ခဲ့သော ကျွမ်းကျင်မှုများ — initialization, deployment, monitoring, redeploying, နှင့် cleanup — များသည် AI applications နှင့် agents များအတွက်လည်း တူညီစွာ ကြိုတင်အသုံးချနိုင်ပါသည်။

---

## သင်ဘာတွေ သင်ယူခဲ့လဲ

ကြိုဆိုပါတယ်! သင်လက်မှတ်ရရှိပြီ:
- ✅ Template မှ azd project ကို initialization ပြုလုပ်နိုင်ခဲ့သည်
- ✅ Project ဖွဲ့စည်းပုံနှင့် အရေးကြီးဖိုင်များကို စုံစမ်းကြည့်ရှုနိုင်ခဲ့သည်
- ✅ Full-stack အက်ပလီကေးရှင်းကို Azure သို့ တပ်ဆင်နိုင်ခဲ့သည်
- ✅ ကုဒ်ပြင်ဆင်ပြီး ပြန်တပ်ဆင်နိုင်ခဲ့သည်
- ✅ မျိုးစုံ environment များကို စီမံခန့်ခွဲနိုင်ခဲ့သည်
- ✅ Resources များကို သန့်ရှင်းသွားခဲ့သည်

## 🎯 ကျွမ်းကျင်မှု အတည်ပြု လေ့ကျင့်ခန်းများ

### လေ့ကျင့်ခန်း 1: မတူညီသော Template တစ်ခု Deploy လုပ်ပါ (15 မိနစ်)
**ရည်ရွယ်ချက်**: azd init နှင့် deployment workflow ကို ကျွမ်းကျင်မှု ပြသရန်

```bash
# Python + MongoDB စတက်ကို စမ်းကြည့်ပါ
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# ဖြန့်ချိမှုကို စစ်ဆေး၍ အတည်ပြုပါ
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# ရှင်းလင်းပါ
azd down --force --purge
```

**အောင်မြင်မှု အပေါ်သတ်မှတ်ချက်များ:**
- [ ] Application သည် error များမရှိဘဲ deploy လုပ်နိုင်ရမည်
- [ ] Browser တွင် application URL ကို ဝင်ရောက်ကြည့်ရှုနိုင်ရမည်
- [ ] Application သည် အလုပ်လုပ်ရမည် (todo များ ထည့်/ဖျက်/ပြင်)
- [ ] Resources များအားလုံးကို အောင်မြင်စွာ သန့်ရှင်း ဖျက်ရှင်းနိုင်ခဲ့ရမည်

### လေ့ကျင့်ခန်း 2: Configuration ကို ကိုယ့်လိုက် ပြင်ဆင်ပါ (20 မိနစ်)
**ရည်ရွယ်ချက်**: environment variable configuration ကို လေ့ကျင့်ရန်

```bash
cd my-first-azd-app

# စိတ်ကြိုက် ပတ်ဝန်းကျင် ဖန်တီးပါ
azd env new custom-config

# စိတ်ကြိုက် ပြောင်းလဲနိုင်သော တန်ဖိုးများ သတ်မှတ်ပါ
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# ပြောင်းလဲနိုင်သော တန်ဖိုးများကို အတည်ပြုပါ
azd env get-values | grep APP_TITLE

# စိတ်ကြိုက် ဖွဲ့စည်းချက်ဖြင့် တပ်ဆင်ပါ
azd up
```

**အောင်မြင်မှု အပေါ်သတ်မှတ်ချက်များ:**
- [ ] Custom environment ကို အောင်မြင်စွာ ဖန်တီးနိုင်ခဲ့ရမည်
- [ ] Environment variables များကို တပ်ဆင်ပြီး ရယူနိုင်ရမည်
- [ ] Application ကို custom configuration ဖြင့် deploy လုပ်နိုင်ရမည်
- [ ] Deployed app တွင် custom settings များကို စစ်ဆေးနိုင်ရမည်

### လေ့ကျင့်ခန်း 3: Multi-Environment Workflow (25 မိနစ်)
**ရည်ရွယ်ချက်**: environment management နှင့် deployment များအတွက် ကျွမ်းကျင်မှုရရှိရန်

```bash
# ဖွံ့ဖြိုးရေး (dev) ပတ်ဝန်းကျင်ကို တည်ဆောက်ပါ
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# ဖွံ့ဖြိုးရေး (dev) URL ကို မှတ်ပါ
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# စတေဂျင်း (staging) ပတ်ဝန်းကျင်ကို တည်ဆောက်ပါ
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# စတေဂျင်း (staging) URL ကို မှတ်ပါ
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# ပတ်ဝန်းကျင်များကို နှိုင်းယှဉ်ပါ
azd env list

# နှစ်ဘက် ပတ်ဝန်းကျင်များအား စမ်းသပ်ပါ
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# နှစ်ခုစလုံးကို ရှင်းလင်းပါ
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**အောင်မြင်မှု အပေါ်သတ်မှတ်ချက်များ:**
- [ ] သတ်မှတ်ထားသည့် configuration များဖြင့် environment နှစ်ခု ဖန်တီးနိုင်ရမည်
- [ ] နှစ်ခုစလုံးကို အောင်မြင်စွာ deploy လုပ်နိုင်ရမည်
- [ ] `azd env select` ဖြင့် environment များအကြား ပြောင်းရွှေ့နိုင်ရမည်
- [ ] Environment များအကြား environment variables များ ကွာခြားနိုင်ရမည်
- [ ] နှစ်ခုစလုံးကို အောင်မြင်စွာ သန့်ရှင်း ဖျက်ရှင်းနိုင်ခဲ့ရမည်

## 📊 သင့် တိုးတက်မှု

**Time Invested**: ~60-90 minutes  
**Skills Acquired**:
- ✅ Template-based project initialization
- ✅ Azure resource provisioning
- ✅ Application deployment workflows
- ✅ Environment management
- ✅ Configuration management
- ✅ Resource cleanup and cost management

**Next Level**: You're ready for [Configuration Guide](configuration.md) to learn advanced configuration patterns!

## ပြဿနာဖြေရှင်းခြင်း (Troubleshooting Common Issues)

### Authentication Errors
```bash
# Azure နှင့် ပြန်လည် အတည်ပြုပါ
az login

# Subscription ထံသို့ ဝင်ရောက်ခွင့်ကို စစ်ဆေးပါ
az account show
```

### Deployment Failures
```bash
# ပြဿနာရှာဖွေရေး မှတ်တမ်းများကို ဖွင့်ပါ
export AZD_DEBUG=true
azd up --debug

# Azure တွင် အက်ပလီကေးရှင်း မှတ်တမ်းများကို ကြည့်ပါ
azd monitor --logs

# Container Apps များအတွက်၊ Azure CLI ကို အသုံးပြုပါ:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Resource Name Conflicts
```bash
# ထူးခြားသော ပတ်ဝန်းကျင်အမည်ကို အသုံးပြုပါ
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Network Issues
```bash
# ဆိပ်ကမ်းများ အသုံးပြုနိုင်ကြောင်း စစ်ဆေးပါ
netstat -an | grep :3000
netstat -an | grep :3100
```

## နောက်တိုးတက်စရာများ

ဤပထမ project ကို ပြီးမြောက်လိုက်ပြီးနောက်၊ အောက်ပါ အဆင့်မြင့် ဧရိယာများကို စူးစမ်းပါ။

### 1. Infrastructure ကို ကိုယ့်လိုက် ပြင်ဆင်ပါ
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD ကို အင်စတောချုပ်ထားပါ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Complete CI/CD workflows
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline configuration

### 3. Production အတွက် အကောင်းဆုံး လေ့လာမှုများ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Security, performance, and monitoring

### 4. မျိုးစုံ Templates များကို စူးစမ်းပါ
```bash
# အမျိုးအစားအလိုက် ပုံစံများကို ကြည့်ရှုပါ
azd template list --filter web
azd template list --filter api
azd template list --filter database

# ကွဲပြားသော နည်းပညာစုံတွဲများကို စမ်းကြည့်ပါ
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## ကူညီပေးသော အရင်းအမြစ်များ

### သင်ယူရေး ပစ္စည်းများ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### ကွန်ယက်နှင့် ပံ့ပိုးမှု
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates & ဥပမာများ
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Congratulations on completing your first azd project!** You're now ready to build and deploy amazing applications on Azure with confidence.

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်ရေးအတွက် ကြိုးပမ်းသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် တိကျမှုလျော့ပါးမှုများ ပါဝင်နိုင်ကြောင်း သတိပြုပါ။ မူရင်းဘာသာဖြင့် ရေးသားထားသော မူလစာတမ်းကို တရားဝင် အရင်းအမြစ်အဖြစ် ယူဆသင့်သည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူဘာသာပြန် ဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာသော နားမလည်မှုများ သို့မဟုတ် မမှန်ကန်စွာ ဖော်ပြခြင်းများအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->