# သင့် ပထမဆုံး ပရောဂျက် - လက်တွေ့ လေ့ကျင့်ခန်း

**Chapter Navigation:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD များအတွက် စတင်သူများ](../../README.md)
- **📖 လက်ရှိ အခန်း**: Chapter 1 - အခြေခံနှင့် အမြန် စတင်ခြင်း
- **⬅️ ယခင်**: [ထည့်သွင်းခြင်းနှင့် စတင်ပြင်ဆင်ခြင်း](installation.md)
- **➡️ နောက်တစ်ခု**: [ပြင်ဆင်ခြင်း](configuration.md)
- **🚀 နောက် အခန်း**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## အကျဉ်းချုပ်

သင့် ပထမဆုံး Azure Developer CLI ပရောဂျက်ကို ကြိုဆိုပါတယ်! ဤလက်တွေ့ လေ့ကျင့်ခန်းအပိုင်းအစသည် azd ကို အသုံးပြုပြီး React frontend၊ Node.js API backend နှင့် MongoDB ဒေတာဘေ့စ် ပါရှိသည့် အပြည့်အစုံ full-stack အက်ပလိကေးရှင်းတစ်ခုကို ဖန်တီး၊ တင်သွင်း၊ စီမံခန့်ခွဲခြင်းတို့ကို လမ်းပြပေးပါသည်။

## သင်ယူရန် ရည်မှန်းချက်များ

By completing this tutorial, you will:
- azd ပရောဂျက် အစပြု လုပ်ငန်းစဉ်ကို မူဖွားများကို အသုံးပြု၍ ကျွမ်းကျင်စွာ လေ့လာနိုင်ရန်
- Azure Developer CLI ပရောဂျက် ဖွဲ့စည်းပုံနှင့် ပြင်ဆင်မှု ဖိုင်များကို နားလည်ရန်
- အင်ဖရာစွဲတည်မှု ပေးသွင်းခြင်းနှင့်အတူ အက်ပလိကေးရှင်းအား အပြည့်အဝ Azure သို့ တင်ပို့နိုင်ရန်
- အက်ပလိကေးရှင်းအသစ်ပြင်ဆင်မှုများနှင့် ပြန်လည်တင်ပို့ရေး မဟာဗျူဟာများကို တည်ဆောက်နိုင်ရန်
- ဖွံ့ဖြိုးရေးနှင့် စတေးဂျင်းအဆင့်များအတွက် မျိုးစုံပတ်ဝန်းကျင်များကို စီမံရန်
- အရင်းအမြစ် သန့်ရှင်းရေးနှင့် ကုန်ကျစရိတ် စီမံခန့်ခွဲမှုများကို အသုံးချနိုင်ရန်

## သင်ယူပြီးရသည့် ရလဒ်များ

ပြီးဆုံးချိန်တွင် သင်တတ်နိုင်မည့်အရာများမှာ -
- မူဖွားများမှ azd ပရောဂျက်များကို ကိုယ်တိုင် စတင်ပြင်ဆင်နိုင်ရန်
- azd ပရောဂျက် ဖွဲ့စည်းပုံများကို လွယ်ကူစွာ ရှာဖွေပြင်ဆင်နိုင်ရန်
- တမ်းပလိတ်တစ်ခုမှ တပြိုင်နက်မှာ full-stack အက်ပလိကေးရှင်းများကို Azure သို့ တင်ပို့နိုင်ရန်
- ပုံမှန် တင်ပို့ဖြစ်စဉ်များနှင့် အတည်ပြုချက် ပြဿနာများကို ဖြေရှင်းနိုင်ရန်
- အမျိုးမျိုးသော deployment အဆင့်များအတွက် မျိုးစုံ Azure ပတ်ဝန်းကျင်များကို စီမံနိုင်ရန်
- အက်ပလိကေးရှင်း အပ်ဒိတ်များအတွက် သတိပေးမှု အလိုအလျောက်တင်ပို့မှု လုပ်ငန်းစဉ်များကို တည်ဆောက်နိုင်ရန်

## စတင်ရန်

### မူလလိုအပ်ချက်များ စစ်ဆေးရန်
- ✅ Azure Developer CLI ထည့်သွင်းပြီးသား ([ထည့်သွင်းခြင်း လမ်းညွှန်](installation.md))
- ✅ AZD အတည်ပြုခြင်းကို `azd auth login` ဖြင့် ပြီးစီးထားပြီ
- ✅ Git ကို သင့် စက်တွင် ထည့်သွင်းပြီးသား
- ✅ Node.js 16+ (ဤသင်ခန်းစာအတွက်)
- ✅ Visual Studio Code (အကြံပြု)

ရှေ့ဆက်မလုပ်မီ၊ repository ရှေ့ရာထပ်မှ setup validator ကို chạy ဖြစ်ပါစေ။

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### သင့် စက်ဆေးစစ်မှု စစ်ဆေးပါ
```bash
# azd တပ်ဆင်ခြင်းကို စစ်ဆေးပါ
azd version

# AZD အတည်ပြုခြင်းကို စစ်ဆေးပါ
azd auth login --check-status
```

### ရွေးချယ်လျှင် Azure CLI အတည်ပြုချက်ကို စစ်ဆေးရန်

```bash
az account show
```

### Node.js ဗားရှင်းကို စစ်ဆေးပါ
```bash
node --version
```

## အဆင့် 1: တမ်းပလိတ် တစ်ခု ရွေးချယ်ပြီး အစပြုပါ

React frontend နှင့် Node.js API backend ပါသော လူကြိုက်များသော todo အက်ပလစ်ကေးရှင်း တမ်းပလိတ်တစ်ခုဖြင့် စတင်ကြရအောင်။

```bash
# အသုံးပြုနိုင်သော တမ်းပလိတ်များကို ကြည့်ရှုပါ
azd template list

# todo အက်ပ် တမ်းပလိတ်ကို အစပြုပါ
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# ကြားရသော ညွှန်ပြချက်များကို လိုက်နာပါ:
# - ပတ်ဝန်းကျင် အမည် ထည့်ပါ: "dev"
# - များစွာ ရှိပါက subscription တစ်ခုကို ရွေးချယ်ပါ
# - တိုင်းဒေသကို ရွေးချယ်ပါ: "East US 2" (သို့မဟုတ် သင်နှစ်သက်သော ဒေသ)
```

### ဘာတွေ ဖြစ်ပွားခဲ့လဲ?
- တမ်းပလိတ် ကုဒ်ကို သင့် ဒေသတွင် ဒေါင်းလုဒ် ပြီးသား
- ဝန်ဆောင်မှု သတ်မှတ်ချက်များ ပါသည့် `azure.yaml` ဖိုင်ကို ဖန်တီးခဲ့သည်
- `infra/` ဒါရိုက်တာရီအတွင်း အင်ဖရာစထွာ ကုဒ်ကို ပြင်ဆင်ထားသည်
- ပတ်ဝန်းကျင် ဖွဲ့စည်းမှုတစ်ခု ဖန်တီးထားသည်

## အဆင့် 2: ပရောဂျက် ဖွဲ့စည်းပုံကို တူးစူးကြည့်ရှုခြင်း

azd က ကျွန်တော်တို့အတွက် ဘာတွေ ဖန်တီးထားသလဲ ကြည့်ကြပါစို့။

```bash
# ပရောဂျက်၏ ဖွဲ့စည်းပုံကို ကြည့်ရန်
tree /f   # ဝင်းဒိုး
# သို့မဟုတ်
find . -type f | head -20   # macOS/လင်းနက်စ်
```

You should see:
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

### နားလည်ဖို့ အဓိက ဖိုင်များ

**azure.yaml** - သင့် azd ပရောဂျက်၏ မျိုးနွယ်တည်ငြိမ်:
```bash
# ပရောဂျက် ဆက်တင်များကို ကြည့်ရန်
cat azure.yaml
```

**infra/main.bicep** - အင်ဖရာစထွာ သတ်မှတ်ချက်:
```bash
# အင်ဖရာစထရပ်ချာကုဒ်ကို ကြည့်ပါ
head -30 infra/main.bicep
```

## အဆင့် 3: သင့် ပရောဂျက်ကို စိတ်ကြိုက် ပြင်ဆင်ရန် (ရွေးချယ်နိုင်)

တင်သွင်းမလုပ်ခင် သင် အက်ပလိကေးရှင်းကို မိမိလိုချင်သလို ပြင်ဆင်နိုင်ပါသည်။

### Frontend ကို ပြင်ဆင်ပါ
```bash
# React app component ကို ဖွင့်ပါ
code src/web/src/App.tsx
```

ရိုးရှင်းစွာ ပြင်ဆင်ချက် တစ်ခု ပြုလုပ်ပါ:
```typescript
// ခေါင်းစဉ်ကို ရှာပြီး ပြောင်းပါ
<h1>My Awesome Todo App</h1>
```

### ပတ်ဝန်းကျင် အဆက်ပြီးပုံများ ကို ပြင်ဆင်ပါ
```bash
# စိတ်ကြိုက် ပတ်ဝန်းကျင် အပြောင်းအလဲများ သတ်မှတ်ရန်
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# ပတ်ဝန်းကျင် အပြောင်းအလဲများအားလုံး ကြည့်ရန်
azd env get-values
```

## အဆင့် 4: Azure သို့ တင်ပို့ပါ

ယခု စိတ်လှုပ်ရှားစရာ အပိုင်းပါ — အားလုံးကို Azure သို့ တင်ပို့ကြမယ်!

```bash
# အင်ဖရာစထရပ်ချာနှင့် အက်ပလီကေးရှင်းကို တင်သွင်းခြင်း
azd up

# ဤ အမိန့်သည်:
# 1. Azure အရင်းအမြစ်များ (App Service, Cosmos DB, စသည်) ကို ပံ့ပိုးပေးမည်။
# 2. သင့် အက်ပလီကေးရှင်းကို ဆောက်လုပ်မည်။
# 3. ပံ့ပိုးထားသော အရင်းအမြစ်များသို့ တင်သွင်းမည်။
# 4. အက်ပလီကေးရှင်း၏ URL ကို ပြသမည်။
```

### တင်ပို့စဉ် ကျွန်တော်တို့ ဘာတွေ လုပ်နေတာလဲ?

The `azd up` command performs these steps:
1. **Provision** (`azd provision`) - Azure အရင်းအမြစ်များကို ဖန်တီးသည်
2. **Package** - သင့် အက်ပလိကေးရှင်း ကုဒ်ကို တည်ဆောက်သည်
3. **Deploy** (`azd deploy`) - ကုဒ်ကို Azure အရင်းအမြစ်များပေါ်သို့ တင်ပို့သည်

### မျှော်လင့်ရသော အထွက်အပေါက်
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## အဆင့် 5: သင့် အက်ပလိကေးရှင်းကို စမ်းသပ်ပါ

### သင့် အက်ပလိကေးရှင်းကို ဝင်ရောက်ပါ
တင်ပို့မှုအထွက်တွင် ပေးထားသော URL ကို နှိပ်ပါ၊ ဒါမှမဟုတ် အချိန်မရွေး ရယူနိုင်ပါသည်။
```bash
# အပလီကေးရှင်း၏ endpoint များကို ရယူပါ
azd show

# သင့်ဘရောက်ဇာတွင် အပလီကေးရှင်းကို ဖွင့်ပါ
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo အက်ပ်ကို စမ်းသပ်ခြင်း
1. **todo အချက်တစ်ခု ထည့်ပါ** - "Add Todo" ကို နှိပ်ပြီး တာဝန်တစ်ခု ထည့်ပါ
2. **ပြီးဆုံးစရာ အဖြစ် မှတ်သားပါ** - ပြီးဆုံးပြီးသား အချက်များကို မှတ်ချက်ချပါ
3. **အချက်များ ဖျက်ပါ** - မလိုအပ်တော့သော todo များကို ဖယ်ရှားပါ

### သင့် အက်ပလိကေးရှင်းကို စောင့်ကြည့်ပါ
```bash
# သင့်အရင်းအမြစ်များအတွက် Azure Portal ကို ဖွင့်ပါ
azd monitor

# လျှောက်လွှာမှတ်တမ်းများကို ကြည့်ရှုပါ
azd monitor --logs

# တိုက်ရိုက်တိုင်းတာချက်များကို ကြည့်ရှုပါ
azd monitor --live
```

### ✅ သင့် တင်ပို့မှုကို အတည်ပြုပါ

ရှေ့ဆက်မလုပ်မီ အောက်ပါ လျှောက်လွှာ စစ်ဆေးချက်များဖြင့် အရာအားလုံးမှန်ကန်ကြောင်း သေချာစေပါ — "deploy succeeded" ဟု ဆိုလိုသည်မှာ "app အလုပ်လုပ်တယ်" ဟု မယူဆပါနှင့်။

```bash
# 1. endpoint ရှိ/မရှိနှင့် လက်လှမ်းမီနိုင်ခြင်းကို အတည်ပြုပါ
azd show

# 2. endpoint ကို အမြန်စမ်းသပ်ပါ (HTTP 200 ကို မျှော်လင့်သည်)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. သင့်အက်ပ်တွင် health endpoint တစ်ခု ရှိပါက ၎င်းကို စစ်ဆေးပါ
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**တင်ပို့မှု အတည်ပြုထားကြောင်း အခြေအနေများ**
- ✅ `azd show` က ရရှိနိုင်သော endpoint URL တစ်ခုကို ပြရပါမည်
- ✅ URL ကို သင့် browser ဖြင့် ဖွင့်လှစ်ရာတွင် အမှားများ မကြုံတွေ့ရပါ
- ✅ အရေးကြီးသော လုပ်ဆောင်ချက်များ (todo ထည့်/ပြီး/ဖျက်) တင်ဆောင်နိုင်ပါသည်
- ✅ `azd monitor --logs` မှာ မမျှော်လင့်ရသော အမှားများ မပါသော request များကို ပြနိုင်ပါသည်

မည်သည့် စစ်ဆေးချက်မဆို မအောင်မြင်ပါက [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md) သို့ သွားပါ။

## အဆင့် 6: ပြင်ဆင်ချက်များ ပြုလုပ်၍ ပြန်လည်တင်ပို့ခြင်း

ပြင်ဆင်မှုတစ်ခု ပြုလုပ်ကာ ဘယ်လောက်လွယ်ကူသည်ကို ကြည့်ကြပါစို့။

### API ကို ပြင်ဆင်ပါ
```bash
# API ကုဒ်ကို တည်းဖြတ်ပါ
code src/api/src/routes/lists.js
```

custom response header တစ်ခု ထည့်ပါ:
```javascript
// route handler ကို ရှာဖွေပြီး အောက်ပါအတိုင်း ထည့်ပါ:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ကုဒ်ပြင်ဆင်ချက်များကိုသာ တင်ပို့ပါ
```bash
# အက်ပလီကေးရှင်း ကုဒ်ကိုပဲ တင်ပါ (အခြေခံအဆောက်အအုံကို ကျော်ပါ)
azd deploy

# အခြေခံအဆောက်အအုံများ ရှိပြီးသားဖြစ်သောကြောင့် 'azd up' ထက် အလွန်မြန်သည်
```

## အဆင့် 7: မျိုးစုံ ပတ်ဝန်းကျင်များ စီမံခြင်း

ထုတ်လုပ်မှုမတိုင်မီ ပြင်ဆင်ချက်များကို စမ်းသပ်ရန် staging ပတ်ဝန်းကျင်းတစ်ခု ဖန်တီးပါ။

```bash
# staging ပတ်ဝန်းကျင် အသစ်တစ်ခု ဖန်တီးပါ
azd env new staging

# staging သို့ ဖြန့်ချိပါ
azd up

# dev ပတ်ဝန်းကျင်သို့ ပြန်ပြောင်းပါ
azd env select dev

# ပတ်ဝန်းကျင်အားလုံးကို စာရင်းပြပါ
azd env list
```

### ပတ်ဝန်းကျင် နှိုင်းယှဉ်ချက်
```bash
# ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင် ကြည့်ရန်
azd env select dev
azd show

# စတေဂျင်း ပတ်ဝန်းကျင် ကြည့်ရန်
azd env select staging
azd show
```

## အဆင့် 8: အရင်းအမြစ်များ သန့်ရှင်းရေး

သုတေသန ပြုလုပ်ပြီးပါက ဆက်တိုက် ကျသင့်မှုများ မဖြစ်ရအောင် အရင်းအမြစ်များကို သန့်ရှင်းပါ။

```bash
# လက်ရှိ ပတ်ဝန်းကျင်အတွက် Azure အရင်းအမြစ်များအားလုံးကို ဖျက်ပါ
azd down

# အတည်ပြုချက်မမေးဘဲ အတင်းအကြပ် ဖျက်ပြီး soft-delete ဖြစ်နေသော အရင်းအမြစ်များကို ပြီးပြည့်စုံ ဖျက်ပစ်ပါ
azd down --force --purge

# သတ်မှတ်ထားသော ပတ်ဝန်းကျင်ကို ဖျက်ပါ
azd env select staging
azd down --force --purge
```

## ရိုးရာ အက်ပ်နှင့် AI အားဖြင့် စွမ်းဆောင်နိုင်သော အက်ပ်: လုပ်ငန်းစဉ် တူညီသည်

သင်သည် ယခုလက်တွင် ရိုးရာ ဝက်ဘ် အက်ပလိကေးရှင်းတစ်ခုကို တင်ပို့ပြီးပြီ။ သို့သော် Microsoft Foundry Models ထောက်ပံ့ထားသည့် chat အက်ပ် များကဲ့သို့ AI-အခြေစိုက် အက်ပ်တစ်ခု တင်ချင်ပါက ဘယ်လိုလဲ?

ကောင်းသော သတင်းကတော့: **လုပ်ငန်းစဉ်က တိတိကျကျ တူညီပါတယ်။**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

တစ်ချက်သာ ကွဲပြားချက်မှာ သင် စတင်သည့် **template** ဖြစ်သည်။ AI template တစ်ခုတွင် Microsoft Foundry Models အရင်းအမြစ် သို့မဟုတ် AI Search index ကဲ့သို့ အပိုအင်ဖရာအရာများ ပါဝင်နိုင်သော်လည်း azd က အရင်းအမြစ်အားလုံးကို ကိုင်တွယ်ပေးသည်။ သင်အသစ်သော command များ သင်ယူရန်၊ ကိရိယာသစ်တစ်ခုကို အသုံးချရန် သို့မဟုတ် deployment ကိုစဉ်းစားပုံကို မြှင့်တင်ရန် လိုအပ်မည်မဟုတ်ပါ။

azd ၏ အဓိက သဘောတရားမှာ: **တစ်ခုတည်းသော လုပ်ငန်းစဉ်၊ မည်သည့် အလုပ်ခေါင်းစဉ်မဆို။** ဤသင်ခန်းစာတွင် လေ့ကျင့်ခဲ့သည့် ကျွမ်းကျင်မှုများ — စတင်ခြင်း၊ တင်ပို့ခြင်း၊ စောင့်ကြည့်ခြင်း၊ ပြန်လည်တင်ပို့ခြင်းနှင့် သန့်ရှင်းရေး — သည် AI အက်ပလီကေးရှင်းများနှင့် agents များအတွက်လည်း တူညီစွာ ကုသနိုင်ပါသည်။

---

## သင်ဘာတွေ များယူခဲ့ပါသလဲ

ဂုဏ်သိက္ခာပါ! သင်အောင်မြင်စွာလုပ်ဆောင်ပြီးပါပြီ:
- ✅ မူဖွားမှ azd ပရောဂျက်ကို စတင်ထားသည်
- ✅ ပရောဂျက် ဖွဲ့စည်းပုံနှင့် အဓိက ဖိုင်များကို ရှာဖွေခဲ့သည်
- ✅ full-stack အက်ပလိကေးရှင်းတစ်ခုကို Azure သို့ တင်သွင်းခဲ့သည်
- ✅ ကုဒ်ပြင်ဆင်ချက်များ ပြုလုပ်၍ ပြန်လည်တင်ပို့ခဲ့သည်
- ✅ မျိုးစုံ ပတ်ဝန်းကျင်များကို စီမံခဲ့သည်
- ✅ အရင်းအမြစ်များကို သန့်ရှင်းလိုက်သည်

## 🎯 ကျွမ်းကျင်မှု မျှိုးစုံ စိစစ်ခြင်း လေ့ကျင့်ခန်းများ

### လေ့ကျင့်ခန်း 1: မတူညီသည့် တမ်းပလိတ်တစ်ခု တင်ပို့ပါ (၁၅ မိနစ်)
**ရည်ရွယ်ချက်**: azd init နှင့် တင်ပို့လုပ်ငန်းစဉ်ကို ကျွမ်းကျင်မှု ပြသရန်

```bash
# Python နှင့် MongoDB စတက်ကို စမ်းကြည့်ပါ
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# တပ်ဆင်မှုကို စစ်ဆေးပါ
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# ရှင်းလင်းပါ
azd down --force --purge
```

**အောင်မြင်မှု ချမှတ်ချက်များ:**
- [ ] အက်ပလိကေးရှင်းကို အမှားမရှိ စတင်တင်ပို့နိုင်သည်
- [ ] Browser တွင် အက်ပလိကေးရှင်း URL သို့ ဝင်ရောက်နိုင်သည်
- [ ] အက်ပလိကေးရှင်း မှန်ကန်စွာ လုပ်ဆောင်နိုင်သည် (todo ထည့်/ဖယ်ရှား)
- [ ] အရင်းအမြစ်အားလုံးကို အောင်မြင်စွာ သန့်ရှင်း ပြီးဆုံးခဲ့သည်

### လေ့ကျင့်ခန်း 2: ဖော်ပြချက်များကို စိတ်ကြိုက် ပြင်ဆင်ခြင်း (၂၀ မိနစ်)
**ရည်ရွယ်ချက်**: ပတ်ဝန်းကျင် အထူးပြင်ဆင်မှုများကို လေ့ကျင့်ရန်

```bash
cd my-first-azd-app

# စိတ်ကြိုက် ပတ်ဝန်းကျင် တစ်ခု ဖန်တီးပါ
azd env new custom-config

# စိတ်ကြိုက် တန်ဖိုးများ သတ်မှတ်ပါ
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# တန်ဖိုးများကို စစ်ဆေးပါ
azd env get-values | grep APP_TITLE

# စိတ်ကြိုက် ဖွဲ့စည်းတပ်ဆင်ချက်ဖြင့် တပ်ဆင်ပါ
azd up
```

**အောင်မြင်မှု ချမှတ်ချက်များ:**
- [ ] စိတ်ကြိုက် ပတ်ဝန်းကျင် တည်ဆောက်နိုင်သည်
- [ ] ပတ်ဝန်းကျင် အပြင်အဆင်များကို သတ်မှတ်၍ ရယူနိုင်သည်
- [ ] အက်ပလိကေးရှင်းကို စိတ်ကြိုက် ပြင်ဆင်ချက်ဖြင့် တင်ပို့နိုင်သည်
- [ ] တင်ပို့ထားသည့် အက်ပလိကေးရှင်းတွင် စိတ်ကြိုက် ပြင်ဆင်ချက်များကို သက်ဆိုင်စစ်ဆေးနိုင်သည်

### လေ့ကျင့်ခန်း 3: မျိုးစုံ ပတ်ဝန်းကျင် လုပ်ငန်းစဉ် (၂၅ မိနစ်)
**ရည်ရွယ်ချက်**: ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှုနှင့် တင်ပို့ မဟာဗျူဟာများကို ကျွမ်းကျင်ရန်

```bash
# ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင် ဖန်တီးပါ
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# ဖွံ့ဖြိုးရေး URL ကို မှတ်သားပါ
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# စတေဂျင်း ပတ်ဝန်းကျင် ဖန်တီးပါ
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# စတေဂျင်း URL ကို မှတ်သားပါ
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# ပတ်ဝန်းကျင်များကို နှိုင်းယှဉ်ပါ
azd env list

# နှစ်ဖက် ပတ်ဝန်းကျင်များကို စမ်းသပ်ပါ
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# နှစ်ဖက်ကို ရှင်းလင်းပါ
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**အောင်မြင်မှု ချမှတ်ချက်များ:**
- [ ] configuration မတူညီသည့် ပတ်ဝန်းကျင် နှစ်ခု ဖန်တီးနိုင်သည်
- [ ] နှစ်ခုစလုံး အောင်မြင်စွာ တင်ပို့နိုင်သည်
- [ ] `azd env select` အသုံးပြု၍ ပတ်ဝန်းကျင်များအကြား ပြောင်းနိုင်သည်
- [ ] ပတ်ဝန်းကျင်များ အကြား ပတ်ဝန်းကျင် အပြင်အဆင်များ ကွာခြားနေသည်
- [ ] နှစ်ခုစလုံးကို အောင်မြင်စွာ သန့်ရှင်းပြီးဆုံးနိုင်သည်

## 📊 သင့် တိုးတက်မှု

**Time Invested**: ~60-90 minutes  
**Skills Acquired**:
- ✅ Template-based project initialization
- ✅ Azure resource provisioning
- ✅ Application deployment workflows
- ✅ Environment management
- ✅ Configuration management
- ✅ Resource cleanup and cost management

**Next Level**: သင်သည် [ပြင်ဆင်ခြင်း လမ်းညွှန်](configuration.md) ကို လေ့လာ၍ အဆင့်မြင့် ဖော်ပြချက် မော်ဒယ်များကို သင်ယူရန် အသင့်ဖြစ်ပါပြီ။

## ပြဿနာဖြေရှင်းခြင်းတွင် မကြုံရသည့် အထူးပြဿနာများ

### အတည်ပြုမှု အမှားများ
```bash
# Azure နှင့် ထပ်မံ အတည်ပြုရန်
az login

# စာရင်းဝင်ခွင့်ကို စစ်ဆေးရန်
az account show
```

### တင်ပို့မှု မအောင်မြင်ခြင်းများ
```bash
# debug မှတ်တမ်းရေးခြင်းကို ဖွင့်ပါ
export AZD_DEBUG=true
azd up --debug

# Azure တွင် လျှောက်လွှာမှတ်တမ်းများကို ကြည့်ရှုပါ
azd monitor --logs

# Container Apps များအတွက် Azure CLI ကို သုံးပါ:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### အရင်းအမြစ် အမည် အနှောင့်အယှက်များ
```bash
# ထူးခြားသောပတ်ဝန်းကျင်အမည်ကို အသုံးပြုပါ
azd env new dev-$(whoami)-$(date +%s)
```

### ပေါ့(Port)/Network ပြဿနာများ
```bash
# ပေါ့တ်များ အသုံးပြုနိုင်/ရရှိနိုင်ကြောင်း စစ်ဆေးပါ
netstat -an | grep :3000
netstat -an | grep :3100
```

## နောက်တစ်လှမ်းများ

သင့် ပထမဆုံး ပရောဂျက်ကို ပြီးစီးပြီးနောက်၊ ဒီအဆင့်မြင့် ခေါင်းစဉ်များကို စူးစမ်းလေ့လာပါ။

### 1. အင်ဖရာစထွာ ကို စိတ်ကြိုက် ပြင်ဆင်ပါ
- [အင်ဖရာစထွာကို ကုဒ်ဖြင့် ထိန်းချုပ်ခြင်း](../chapter-04-infrastructure/provisioning.md)
- [ဒေတာဘေ့စ်များ၊ သိမ်းဆည်းမှုများနှင့် အခြား ဝန်ဆောင်မှုများ ထည့်ရန်](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD စနစ် တပ်ဆင်ပါ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - အပြည့်အစုံ CI/CD လုပ်ငန်းစဉ်များ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline ပြင်ဆင်မှု

### 3. ထုတ်လုပ်မှု စံချိန်များ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - လုံခြုံရေး၊ စွမ်းဆောင်ရည်နှင့် စောင့်ကြည့်ခြင်း

### 4. မျိုးစုံ တမ်းပလိတ်များကို စူးစမ်းပါ
```bash
# အမျိုးအစားအလိုက် တမ်းပလိတ်များကို ကြည့်ရှုပါ
azd template list --filter web
azd template list --filter api
azd template list --filter database

# နည်းပညာ စနစ်များ အမျိုးမျိုးကို စမ်းသပ်ကြည့်ပါ
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## အပိုရင်းမြစ်များ

### သင်ယူရေး အစီအစဉ်များ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates & Examples
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**သင့် ပထမဆုံး azd ပရောဂျက်ကို အောင်မြင်စွာ ပြီးစီးလိုက်ပါတယ်။** 이제 သင်သည် Azure ပေါ်တွင် အံ့ဩဖွယ် အက်ပလိကေးရှင်းများကို တည်ဆောက်၍ တင်ပို့ရန် ယုံကြည်မှု ရရှိသွားပြီ။

---

**Chapter Navigation:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD များအတွက် စတင်သူများ](../../README.md)
- **📖 လက်ရှိ အခန်း**: Chapter 1 - အခြေခံနှင့် အမြန် စတင်ခြင်း
- **⬅️ ယခင်**: [ထည့်သွင်းခြင်းနှင့် စတင်ပြင်ဆင်ခြင်း](installation.md)
- **➡️ နောက်တစ်ခု**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 နောက် အခန်း**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->