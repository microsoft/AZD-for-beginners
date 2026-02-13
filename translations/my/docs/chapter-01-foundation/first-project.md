# သင့် ပထမဆုံး ပရောဂျက် - လက်တွေ့ လမ်းညွှန်

**အခန်း လမ်းညွှန်:**
- **📚 သင်တန်း မူလ စာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 ယခု အခန်း**: အခန်း 1 - အခြေခံနှင့် အမြန် စတင်ခြင်း
- **⬅️ ယခင်**: [Installation & Setup](installation.md)
- **➡️ နောက်တစ်ခု**: [Configuration](configuration.md)
- **🚀 နောက်အခန်း**: [အခန်း 2: AI-ဦးစားပေး ဖွံ့ဖြိုးရေး](../chapter-02-ai-development/microsoft-foundry-integration.md)

## နိဒါန်း

Azure Developer CLI ပရောဂျက်သို့ ကြိုဆိုပါတယ်! ဒီလက်တွေ့ လေ့ကျင့်ခန်းက azd ကို အသုံးပြုပြီး Azure ပေါ်မှာ full-stack application တစ်ခုကို ဖန်တီး၊ တင်ပို့၊ စီမံခန့်ခွဲခြင်းကို အပြည့်အစုံ လမ်းညွှန်ပေးပါသည်။ သင်သည် React frontend, Node.js API backend နှင့် MongoDB database ပါဝင်သည့် လက်တွေ့ todo application နဲ့ အလုပ်လုပ်မည်ဖြစ်သည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဖြေဆိုပြီးနောက် သင်သည် -
- Template များဖြင့် azd ပရောဂျက် စတင်ဖန်တီးရေး လုပ်ငန်းစဉ်ကို ကျွမ်းကျင်စွာ ပြုလုပ်နိုင်မည်
- Azure Developer CLI ပရောဂျက် ဖွဲ့စည်းပုံနှင့် ဖိုင်ဆက်တင် များကို နားလည်သိရှိမည်
- အင်ဖရာစထရပ်ချာ ဆောက်လုပ်ပေးခြင်းနှင့်အတူ အက်ပလီကေးရှင်းကို Azure သို့ စုံလင်စွာ တင်ပို့နိုင်မည်
- အက်ပလီကေးရှင်း အပ်ဒိတ်များနှင့် ပြန်လည် တင်ပို့ရေး မဟာဗျူဟာများကို အကောင်အထည်ဖော်နိုင်မည်
- ဖွံ့ဖြိုးရေးနှင့် staging အဆင့်များအတွက် ပတ်ဝန်းကျင်များ ကို စီမံခန့်ခွဲနိုင်မည်
- အရင်းအမြစ် ရှင်းလင်းခြင်းနှင့် ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု လေ့ကျင့်နည်းများကို အကောင်အထည်ဖော်နိုင်မည်

## သင်ယူပြီး ရရှိမည့် အကျိုးရလဒ်များ

ပြီးဆုံးသောအခါ သင်သည် -
- Template များမှ azd ပရောဂျက်များကို လွတ်လပ်စွာ စတင်ဖန်တီး၍ ဖော်ပြနိုင်မည်
- azd ပရောဂျက် ဖွဲ့စည်းပုံများကို ထိရောက်စွာ လေ့လာ၊ ပြင်ဆင်နိုင်မည်
- တစ်ချက်ချင်း command များဖြင့် full-stack အက်ပလီကေးရှင်းများကို Azure သို့ တင်ပို့နိုင်မည်
- ဖြစ်လေ့ရှိသော deploy ပြဿနာများနှင့် authentication ပြဿနာများကို ဖြေရှင်းနိုင်မည်
- အမျိုးမျိုးသော deployment အဆင့်များအတွက် Azure ပတ်ဝန်းကျင်များကို စီမံနိုင်မည်
- အက်ပလီကေးရှင်း အပ်ဒိတ်များအတွက် စဉ်ဆက်မပြတ် deployment လုပ်ငန်းစဉ်များကို အကောင်အထည်ဖော်နိုင်မည်

## စတင်ရန်

### မလိုအပ်မီ စစ်ဆေးရန် စာရင်း
- ✅ Azure Developer CLI တပ်ဆင်ပြီးပြီ ([Installation Guide](installation.md))
- ✅ Azure CLI တပ်ဆင်ပြီး authentication ပြုလုပ်ထားပြီ
- ✅ သင့် စက်ပေါ်တွင် Git တပ်ဆင်ထားပြီ
- ✅ Node.js 16+ (ဤသင်ခန်းစာအတွက်)
- ✅ Visual Studio Code (အကြံပြု)

### သင့် စနစ်ကို စစ်ဆေးပါ
```bash
# azd တပ်ဆင်ခြင်းကို စစ်ဆေးပါ
azd version
```
### Azure အတည်ပြုခြင်း စစ်ဆေးပါ

```bash
az account show
```

### Node.js ဗားရှင်း စစ်ဆေးပါ
```bash
node --version
```

## အဆင့် 1: Template ကို ရွေးချယ်ပြီး စတင်ဖွင့်ပါ

ပရိသတ်များကြားကျော်ကြားသော todo application template တစ်ခုဖြင့် စတင်လိုက်ပါ၊ ၎င်းတွင် React frontend နှင့် Node.js API backend ပါဝင်သည်။

```bash
# ရရှိနိုင်သော နမူနာများကို ကြည့်ရှုပါ
azd template list

# Todo အက်ပ် နမူနာကို စတင်ထည့်သွင်းပါ
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# ပြသထားသော အချက်များကို လိုက်နာပါ:
# - ပတ်ဝန်းကျင်အမည် ထည့်ပါ: "dev"
# - စာရင်းသွင်းမှုတစ်ခုကို ရွေးချယ်ပါ (အများပြားရှိပါက)
# - ဒေသတစ်ခုကို ရွေးချယ်ပါ: "East US 2" (သို့မဟုတ် သင်နှစ်သက်သည့် ဒေသ)
```

### ဘာတွေ ဖြစ်သွားပြီးလဲ?
- Template ကုဒ်ကို သင့်ဒိုက်ရက်ထရီသို့ ဒေါင်းလုတ်လုပ်ခဲ့သည်
- ဝန်ဆောင်မှု သတ်မှတ်ချက်များဖြင့် `azure.yaml` ဖိုင်ကို ဖန်တီးခဲ့သည်
- `infra/` ဒိုင်ရက်ထရီ၌ အင်ဖရာစထရပ်ချာ ကုဒ်ကို စတင်ပြင်ဆင်ခဲ့သည်
- ပတ်ဝန်းကျင် ဖော်ပြချက်ကို ဖန်တီးခဲ့သည်

## အဆင့် 2: ပရောဂျက် ဖွဲ့စည်းပုံ လေ့လာပါ

azd က ကျွန်တော်တို့အတွက် ဘာတွေ ဖန်တီးပေးထားသလဲဆိုတာ စစ်ဆေးကြပါစို့။

```bash
# ပရောဂျက်ဖွဲ့စည်းမှုကို ကြည့်ပါ
tree /f   # Windows
# သို့မဟုတ်
find . -type f | head -20   # macOS/Linux
```

သင်မြင်ရမည့်အရာများ:
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

### နားလည်ရန် အဓိက ဖိုင်များ

**azure.yaml** - သင်၏ azd ပရောဂျက်၏ နှလုံးသား:
```bash
# ပရောဂျက်၏ ဖွဲ့စည်းမှုကို ကြည့်ပါ
cat azure.yaml
```

**infra/main.bicep** - အင်ဖရာစထရပ်ချာ ဖော်ပြချက်:
```bash
# အခြေခံအဆောက်အအုံ၏ ကုဒ်ကို ကြည့်ပါ
head -30 infra/main.bicep
```

## အဆင့် 3: သင့် ပရောဂျက်ကို စိတ်ကြိုက် ပြင်ဆင်ပါ (စိတ်ကြိုက်)

deploy မလုပ်ခင် သင့် အက်ပလီကေးရှင်းကို စိတ်ကြိုက် ပြင်ဆင်နိုင်သည်။

### Frontend ကို ပြင်ဆင်ပါ
```bash
# React အက်ပ် ကွန်ပိုနင့်ကို ဖွင့်ပါ
code src/web/src/App.tsx
```

ရိုးရှင်းသော ပြောင်းလဲမှုတစ်ခု ပြုလုပ်ပါ:
```typescript
// ခေါင်းစဉ်ကို ရှာပြီး ပြောင်းပါ
<h1>My Awesome Todo App</h1>
```

### ပတ်ဝန်းကျင် အပြောင်းလဲများ (environment variables) ကို ပြင်ဆင်ပါ
```bash
# စိတ်ကြိုက် ပတ်ဝန်းကျင် တန်ဖိုးများကို သတ်မှတ်ပါ
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# ပတ်ဝန်းကျင် တန်ဖိုးများအားလုံးကို ကြည့်ရှုပါ
azd env get-values
```

## အဆင့် 4: Azure သို့ Deploy ပြုလုပ်ခြင်း

အခုတော့ စိတ်လှုပ်ရှားစရာ အပိုင်း — အားလုံးကို Azure သို့ deploy ပြုလုပ်ကြပါစို့!

```bash
# အခြေခံအဆောက်အအုံနှင့် အက်ပလီကေးရှင်းကို တပ်ဆင်ပါ
azd up

# ဤ အမိန့်သည် အောက်ပါများကို လုပ်ဆောင်မည်။
# 1. Azure အရင်းအမြစ်များ (App Service, Cosmos DB အစရှိသဖြင့်) ကို စီစဉ်ထောက်ပံ့သည်။
# 2. သင့် အက်ပလီကေးရှင်းကို တည်ဆောက်သည်။
# 3. ထောက်ပံ့ထားသော အရင်းအမြစ်များသို့ တပ်ဆင်သည်။
# 4. အက်ပလီကေးရှင်း၏ URL ကို ပြသမည်။
```

### Deploy လုပ်စဉ် အတွင်း ဘာတွေ ဖြစ်နေလဲ?

The `azd up` command သည် အောက်ပါ အဆင့်များကို ဆောင်ရွက်သည်:
1. **Provision** (`azd provision`) - Azure အရင်းအမြစ်များကို ဖန်တီးသည်
2. **Package** - သင့် အက်ပလီကေးရှင်း ကုဒ်ကို ဆောက်တည်သည်
3. **Deploy** (`azd deploy`) - ကုဒ်ကို Azure အရင်းအမြစ်များသို့ တင်ပို့သည်

### မျှော်မှန်းထားသည့် ရလဒ်
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## အဆင့် 5: သင့် အက်ပလီကေးရှင်းကို စမ်းသပ်ပါ

### သင့် အက်ပလီကေးရှင်းကို ဝင်ရောက်ကြည့်ရှုပါ
deployment ထုတ်လွှင့်ချက်၌ ဖေါ်ပြထားသည့် URL ကို နှိပ်ပါ၊ သို့မဟုတ် မည်သည့်အချိန်တွင်မဆို ထပ်မံ ရယူနိုင်သည်။
```bash
# အက်ပလီကေးရှင်း၏ endpoint များ ရယူပါ
azd show

# ဘရောက်ဇာတွင် အက်ပလီကေးရှင်းကို ဖွင့်ပါ
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo အက်ပလီကေးရှင်း စမ်းသပ်ခြင်း
1. **Todo အသစ် ထည့်ပါ** - "Add Todo" ကို နှိပ်ပြီး တာဝန်တစ်ခု ထည့်ပါ
2. **ပြီးဆုံးအဖြစ် သတ်မှတ်ပါ** - ပြီးဆုံးခဲ့သော အရာများကို အမှတ် အသား ပေးပါ
3. **အရာများ ဖျက်ပါ** - မလိုအပ်တော့သော todo များကို ဖယ်ရှားပါ

### သင့် အက်ပလီကေးရှင်းကို ကြည့်ကြပ်ပါ
```bash
# သင့်အရင်းအမြစ်များအတွက် Azure Portal ကို ဖွင့်ပါ
azd monitor

# အက်ပလီကေးရှင်း လော့ဂ်များကို ကြည့်ပါ
azd monitor --logs

# လက်တလော အတိုင်းအတာများကို ကြည့်ပါ
azd monitor --live
```

## အဆင့် 6: ပြင်ဆင်မှုများ လုပ်ပြီး ပြန်လည် Deploy ပြုလုပ်ပါ

တစ်ခုခု ပြင်ဆင်ပြီး အပ်ဒိတ်ပြုလုပ်ရတာ ဘယ်လောက်လွယ်ကူသလဲ ဆိုတာ ကြည့်ပါ။

### API ကို ပြင်ဆင်ပါ
```bash
# API ကုဒ်ကို တည်းဖြတ်ပါ
code src/api/src/routes/lists.js
```

ကိုယ်ပိုင် response header တစ်ခု ထည့်ပါ:
```javascript
// route handler ကို ရှာပြီး အောက်ပါအတိုင်း ထည့်ပါ:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ကုဒ် ပြောင်းလဲမှုများကိုသာ Deploy ပြုလုပ်ပါ
```bash
# အက်ပလီကေးရှင်း ကုဒ်ကိုပဲ တပ်ဆင်ပါ (အင်ဖရာစထရပ်ချာကို ကျော်လွှားပါ)
azd deploy

# အင်ဖရာစထရပ်ချာရှိပြီးသားကြောင့် 'azd up' ထက် အများကြီးပိုလျင်မြန်ပါတယ်
```

## အဆင့် 7: ပတ်ဝန်းကျင် များ အများအပြား ကို စီမံပါ

ထုတ်လုပ်မှုမလုပ်မီ ပြင်ဆင်မှုများကို စမ်းသပ်ရန် staging ပတ်ဝန်းကျင် တစ်ခု ဖန်တီးပါ။
```bash
# staging ပတ်ဝန်းကျင်အသစ် တစ်ခု ဖန်တီးပါ
azd env new staging

# staging သို့ တင်ပါ
azd up

# dev ပတ်ဝန်းကျင်သို့ ပြန်ပြောင်းပါ
azd env select dev

# ပတ်ဝန်းကျင်အားလုံးကို စာရင်းပြပါ
azd env list
```

### ပတ်ဝန်းကျင်များ နှိုင်းယှဉ်ချက်
```bash
# dev ပတ်ဝန်းကျင်ကို ကြည့်ပါ
azd env select dev
azd show

# staging ပတ်ဝန်းကျင်ကို ကြည့်ပါ
azd env select staging
azd show
```

## အဆင့် 8: အရင်းအမြစ်များ ကို ရှင်းလင်းဖျက်သိမ်းခြင်း

စမ်းသပ်မှုများ ပြီးဆုံးသွားပါက ဆက်လက်ကျန်ရှိမည့် ကုန်ကျစရိတ်များ မဖြစ်အောင် အရင်းအမြစ်များကို ရှင်းလင်းပါ။
```bash
# လက်ရှိ ပတ်ဝန်းကျင်အတွက် Azure အရင်းအမြစ်များအားလုံးကို ဖျက်ပါ
azd down

# အတည်ပြုချက်မမေးဘဲ အကြမ်းဖျက်၍ နူးညံ့စွာ ဖျက်ထားသော အရင်းအမြစ်များကို အပြီးအစီး ဖျက်ရှင်းပါ
azd down --force --purge

# သတ်မှတ်ထားသော ပတ်ဝန်းကျင်ကို ဖျက်ပါ
azd env select staging
azd down --force --purge
```

## သင် သင်ယူပြီး ရရှိထားသည့် အရာများ

ဂုဏ်ယူပါသည်! သင် အောင်မြင်စွာ –
- ✅ Template မှ azd ပရောဂျက် စတင် ဖန်တီးခဲ့သည်
- ✅ ပရောဂျက် ဖွဲ့စည်းပုံနှင့် အဓိက ဖိုင်များကို လေ့လာခဲ့သည်
- ✅ full-stack အက်ပလီကေးရှင်းကို Azure သို့ တင်ပို့ခဲ့သည်
- ✅ ကုဒ် ပြင်ဆင်မှုများ ပြုလုပ်ပြီး ပြန်လည် တင်ပို့ခဲ့သည်
- ✅ ပတ်ဝန်းကျင်များ အများအပြားကို စီမံခန့်ခွဲခဲ့သည်
- ✅ အရင်းအမြစ်များကို ရှင်းလင်းဖျက်ခဲ့သည်

## 🎯 ကျွမ်းကျင်မှု စစ်ဆေးခြင်း လေ့ကျင့်ခန်းများ

### လေ့ကျင့်ခန်း 1: မတူညီသော Template တစ်ခု Deploy ပြုလုပ်ပါ (15 မိနစ်)
**ရည်ရွယ်ချက်**: azd init နှင့် deployment အလုပ်ဖြစ်စဉ်တွင် ကျွမ်းကျင်မှုကို ပြသပါ
```bash
# Python + MongoDB စတက်ကို စမ်းကြည့်ပါ
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# ဖြန့်ချိမှုကို စစ်ဆေးပါ
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# ရှင်းလင်းပါ
azd down --force --purge
```

**အောင်မြင်မှု ချက်များ:**
- [ ] အက်ပလီကေးရှင်းသည် အမှားများမရှိဘဲ တင်ပို့နိုင်သည်
- [ ] ဘရောက်ဇာတွင် အက်ပလီကေးရှင်း URL ကို ဝင်ရောက် ကြည့်ရှုနိုင်သည်
- [ ] အက်ပလီကေးရှင်းသည် မှန်ကန်စွာ လုပ်ဆောင်နိုင်သည် (todo များ ထည့်/ဖယ်ရန်)
- [ ] အရင်းအမြစ်များအားလုံးကို အောင်မြင်စွာ ရှင်းလင်းဖျက်ခဲ့သည်

### လေ့ကျင့်ခန်း 2: ဖော်ပြချက် ကို စိတ်ကြိုက် ပြင်ဆင်ပါ (20 မိနစ်)
**ရည်ရွယ်ချက်**: ပတ်ဝန်းကျင် အပြောင်းအလဲ (environment variable) သတ်မှတ်ခြင်း လေ့ကျင့်ပါ
```bash
cd my-first-azd-app

# စိတ်ကြိုက် ပတ်ဝန်းကျင် ဖန်တီးပါ
azd env new custom-config

# စိတ်ကြိုက် ပြောင်းလဲနိုင်သော တန်ဖိုးများ သတ်မှတ်ပါ
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# တန်ဖိုးများကို စစ်ဆေးပါ
azd env get-values | grep APP_TITLE

# စိတ်ကြိုက် ဖွဲ့စည်းချက်ဖြင့် တပ်ဆင်ပါ
azd up
```

**အောင်မြင်မှု ချက်များ:**
- [ ] ကိုယ်ပိုင် ပတ်ဝန်းကျင် ကို အောင်မြင်စွာ ဖန်တီးနိုင်ခဲ့သည်
- [ ] ပတ်ဝန်းကျင် အပြောင်းအလဲများကို သတ်မှတ်ပြီး ပြန်လည် ရယူနိုင်သည်
- [ ] ကိုယ်ပိုင် configuration ဖြင့် အက်ပလီကေးရှင်း ကို တင်ပို့နိုင်သည်
- [ ] တင်ပို့ပြီး အက်ပလီကေးရှင်းတွင် ကိုယ်ပိုင် ဆက်တင်များကို စစ်ဆေးနိုင်သည်

### လေ့ကျင့်ခန်း 3: ပတ်ဝန်းကျင် များစွာအတွက် လုပ်ငန်းစဉ် (25 မိနစ်)
**ရည်ရွယ်ချက်**: ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှုနှင့် deployment မဟာဗျူဟာများတွင် ကျွမ်းကျင်ပါ
```bash
# dev ပတ်ဝန်းကျင် ဖန်တီးပါ
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# dev URL ကို မှတ်ထားပါ
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# staging ပတ်ဝန်းကျင် ဖန်တီးပါ
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# staging URL ကို မှတ်ထားပါ
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# ပတ်ဝန်းကျင်များကို နှိုင်းယှဉ်ပါ
azd env list

# နှစ်ခုလုံး ပတ်ဝန်းကျင်များကို စမ်းသပ်ပါ
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# နှစ်ခုလုံးကို ရှင်းလင်းပါ
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**အောင်မြင်မှု ချက်များ:**
- [ ] ကွာခြားသော configuration များနှင့် ပတ်ဝန်းကျင် နှစ်ခု ဖန်တီးထားသည်
- [ ] နှစ်ခုစလုံးကို အောင်မြင်စွာ တင်ပို့နိုင်ခဲ့သည်
- [ ] `azd env select` ကို အသုံးပြု၍ ပတ်ဝန်းကျင်များအကြား ပြောင်းနိုင်သည်
- [ ] ပတ်ဝန်းကျင်များကြားတွင် environment variables များ ကွာခြားသည်
- [ ] နှစ်ခုစလုံးကို အောင်မြင်စွာ ရှင်းလင်းဖျက်ခဲ့သည်

## 📊 သင့် တိုးတက်မှု

**ကြာမြင့်ချိန်**: ~60-90 မိနစ်  
**သင်ရရှိသည့် ကျွမ်းကျင်မှုများ**:
- ✅ Template အခြေခံ ပရောဂျက် စတင်ဖန်တီးခြင်း
- ✅ Azure အရင်းအမြစ် ပံ့ပိုးပေးခြင်း
- ✅ အက်ပလီကေးရှင်း တင်ပို့ခြင်း အလုပ်ဖြစ်စဉ်များ
- ✅ ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှု
- ✅ ဆက်တင် စီမံခန့်ခွဲမှု
- ✅ အရင်းအမြစ် ရှင်းလင်းခြင်းနှင့် ကုန်ကျစရိတ် စီမံခြင်း

**နောက်တက်အဆင့်**: သင်သည် [Configuration Guide](configuration.md) သို့ သွား၍ အဆင့်မြင့် configuration ပုံစံများကို လေ့လာရန် အဆင်သင့်ဖြစ်ပါပြီ!

## ဖြစ်တတ်သော ပြဿနာများ ဖြေရှင်းနည်း

### အတည်ပြုခြင်း (Authentication) အမှားများ
```bash
# Azure နှင့် ပြန်လည် အတည်ပြုပါ
az login

# Subscription လက်ဝင်ခွင့်ကို စစ်ဆေးပါ
az account show
```

### Deployment မအောင်မြင်ခြင်းများ
```bash
# debug မှတ်တမ်းရေးခြင်းကို ဖွင့်ပါ
export AZD_DEBUG=true
azd up --debug

# Azure တွင် အက်ပလီကေးရှင်းမှတ်တမ်းများကို ကြည့်ရှုပါ
azd monitor --logs

# Container Apps များအတွက် Azure CLI ကို အသုံးပြုပါ:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### အရင်းအမြစ် အမည် တင်းကျပ်မှုများ
```bash
# ထူးခြားသော ပတ်ဝန်းကျင် အမည်ကို အသုံးပြုပါ
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Network ပြဿနာများ
```bash
# ports များ အသုံးပြုနိုင်/ရရှိနိုင်ခြင်းကို စစ်ဆေးပါ
netstat -an | grep :3000
netstat -an | grep :3100
```

## နောက်ဆက်တွဲ အဆင့်များ

သင့် ပထမဆုံး ပရောဂျက်ကို ပြီးမြောက်လိုက်ပြီဖြစ်သောကြောင့် အောက်ပါ အဆင့်မြင့် အကြောင်းအရာများကို ရှာဖွေလိုက်ပါ။

### 1. အင်ဖရာစထရပ်ချာ ကို စိတ်ကြိုက် ပြင်ဆင်ခြင်း
- [အင်ဖရာစထရပ်ချာအား ကုဒ်ဖြင့် ထိန်းချုပ်ခြင်း](../chapter-04-infrastructure/provisioning.md)
- [ဒေတာဘေ့စ်များ၊ storage များနှင့် အခြား ဝန်ဆောင်မှုများ ထည့်ရန်](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD တပ်ဆင်ခြင်း
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - CI/CD လုပ်ငန်းစဉ်များ အပြည့်အစုံ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline ဖော်ပြချက်

### 3. ထုတ်လုပ်ရေး အကောင်းဆုံး လမ်းလည်မှုများ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - လုံခြုံရေး၊ ဆောင်လက်မှုနှင့် မော်နီတာလုပ်ငန်း

### 4. Template များ ပိုမို ရှာဖွေပါ
```bash
# အမျိုးအစားအလိုက် နမူနာများကို ကြည့်ရှုပါ
azd template list --filter web
azd template list --filter api
azd template list --filter database

# အမျိုးမျိုးသော နည်းပညာ စနစ်များကို စမ်းကြည့်ပါ
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## ထပ်ဆင့် အရင်းအမြစ်များ

### သင်ယူရန် ပစ္စည်းများ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### အသိုင်းအဝိုင်း & အထောက်အပံ့
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Template များနှင့် နမူနာများ
- [တရားဝင် Template ပြခန်း](https://azure.github.io/awesome-azd/)
- [အသိုင်းအဝိုင်း Template များ](https://github.com/Azure-Samples/azd-templates)
- [ကုမ္ပဏီ များအတွက် ပုံစံများ](https://github.com/Azure/azure-dev/tree/main/templates)

---

**သင့် ပထမဆုံး azd ပရောဂျက် ကို ပြီးမြောက်လိုက်ရကြောင်း ဂုဏ်ယူပါတယ်!** ယခု သင်သည် ယုံကြည်စိတ်ချစွာဖြင့် Azure ပေါ်တွင် အံ့သြစရာ အက်ပလီကေးရှင်းများ ဆောက်လုပ်ပြီး တင်ပို့နိုင်ရန် ပြင်ဆင်ပြီးဖြစ်ပါသည်။

---

**အခန်း လမ်းညွှန်:**
- **📚 သင်တန်း မူလ စာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 ယခု အခန်း**: အခန်း 1 - အခြေခံနှင့် အမြန် စတင်ခြင်း
- **⬅️ ယခင်**: [Installation & Setup](installation.md)
- **➡️ နောက်တစ်ခု**: [Configuration](configuration.md)
- **🚀 နောက်အခန်း**: [အခန်း 2: AI-ဦးစားပေး ဖွံ့ဖြိုးရေး](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **နောက်သင်ခန်းစာ**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
မှတ်ချက်:
ဤစာရွက်ကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးပမ်းပါသည် သော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် တိကျမှုမရှိမှုများ ရှိနိုင်ကြောင်း သတိထားပါ။ မူလစာရွက်ကို မိမိဘာသာစကားဖြင့် ရှိသည့် အရာကို တရားဝင် အချက်အလက် အရင်းအမြစ်အဖြစ် ထည့်သွင်းစဉ်းစားသင့်သည်။ အရေးပါသော သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူ့ဘာသာပြန်ဆောင်ရွက်မှုကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာနိုင်သည့် နားမလည်မှုများ သို့မဟုတ် မှားယွင်းဖော်ပြမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မရှိပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->