# ကွန်မန် လျင်မြန်လမ်းညွှန် - အရေးကြီး AZD ကွန်မန်များ

**အခန်းအားလုံးအတွက် အမြန်ကိုးကားစာရင်း**
- **📚 အသင်းသင်ခန်းမ**: [AZD စတင်ရသောသူများအတွက်](../README.md)
- **📖 လျင်မြန် စတင်ခြင်း**: [အခန်း ၁: အခြေခံနှင့် လျင်မြန် စတင်ခြင်း](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI ကွန်မန်များ**: [အခန်း ၂: AI-ဦးစားပေး ဖွံ့ဖြိုးရေး](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 အဆင့်မြင့်**: [အခန်း ၄: အင်ဖရာစထရာကို ကုဒ်အဖြစ်](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## မိတ်ဆက်

ဒီ အကျဉ်းချုံး လျင်မြန်လမ်းညွှန်ကတော့ အသုံးများဆုံး Azure Developer CLI ကွန်မန်များအတွက် အကောင်းဆုံး အမြန်ကိုးကားစာရင်းတစ်ခုဖြစ်ပြီး အမျိုးအစားအလိုက် စနစ်တကျ စီမံထားပြီး လက်တွေ့ နမူနာများပါရှိပါတယ်။ azd ပရောဂျက်များနှင့် ပတ်သက်၍ ဖွံ့ဖြိုးရေး၊ ပြဿနာရှာဖွေမှု၊ နေ့စဉ် လုပ်ငန်းဆောင်တာများအတွက် အမြန်ရှာဖွေရန် အထူးသင့်လျော်သည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဒီ လျင်မြန်လမ်းညွှန်ကို အသုံးပြုခြင်းဖြင့် သင်သည်-
- အရေးကြီး Azure Developer CLI ကွန်မန်များနှင့် စပ်ဆိုင်သည့် သင်္ကေတများကို အမြန်ရယူနိုင်မည်
- လုပ်ဆောင်ချက်အလိုက်နှင့် သုံးစွဲမှုကိစ္စအလိုက် ကွန်မန်များ၏ စုစည်းမှုကို နားလည်ရမည်
- သာမန် ဖွံ့ဖြိုးရေးနှင့် ဖြန့်ချိမှု အခြေအနေများအတွက် လက်တွေ့နမူနာများကို ကိုးကားနိုင်မည်
- ပြဿနာများကို အမြန်ဖြေရှင်းနိုင်ရန် ရှာဖွေရန် ကွန်မန်များကို အသုံးပြုနိုင်မည်
- အဆင့်မြင့် ဖွဲ့စည်းမှုနှင့် တိုးချဲ့နိုင်စွမ်းများကို ထိရောက်စွာ ရှာဖွေချိန်ယူနိုင်မည်
- ပတ်ဝန်းကျင်စီမံခန့်ခွဲမှုနှင့် မျိုးစုံပတ်ဝန်းကျင် လုပ်ငန်းစဉ်များကို အမှန်တကယ် စီမံနိုင်မည်

## သင်ယူပြီးရရှိမည့် ရလဒ်များ

ဒီ လမ်းညွှန်ကို အကြိမ်ကြိမ် ကိုးကားသုံးစွဲခြင်းဖြင့် သင်သည်-
- azd ကွန်မန်များကို အပြည့်အစုံ ကြည့်ရန် လိုအပ်စဉ် မရှိဘဲ ယုံကြည်စွာ ဆောင်ရွက်နိုင်မည်
- သက်ဆိုင်သော ရှာဖွေမှု ကွန်မန်များကို အသုံးပြုပြီး ယေဘုယျ ပြဿနာများကို အမြန် ဖြေရှင်းနိုင်မည်
- မျိုးစုံ ပတ်ဝန်းကျင်များနှင့် ဖြန့်ချိမှု အခြေအနေများကို ထိရောက်စွာ စီမံနိုင်မည်
- လိုအပ်သလို azd ၏ အဆင့်မြင့် အင်္ဂါရပ်များနှင့် ဖွဲ့စည်းမှုများကို အသုံးချနိုင်မည်
- ဖြန့်ချိမှု ပြဿနာများကို စနစ်တကျ ကွန်မန် စဉ်ဆက်များဖြင့် စစ်ဆေး ရှာဖွေနိုင်မည်
- azd shortcuts နှင့် ရွေးချယ်စရာများ အသုံးပြုပြီး လုပ်ငန်းစဉ်များကို လျင်မြန်အောင် ပြုလုပ်နိုင်မည်

## စတင်အသုံးပြုရန် ကွန်မန်များ

### အတည်ပြုခြင်း
```bash
# AZD ဖြင့် Azure သို့ လော့ဂ်အင် ဝင်ပါ
azd auth login

# Azure CLI သို့ လော့ဂ်အင် ဝင်ပါ (AZD သည် အတွင်းပိုင်းတွင် ဒါကို အသုံးပြုသည်)
az login

# လက်ရှိ အကောင့်ကို စစ်ဆေးပါ
az account show

# ပုံမှန် subscription ကို သတ်မှတ်ပါ
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD မှ ထွက်ပါ
azd auth logout

# Azure CLI မှ ထွက်ပါ
az logout
```

### ပရောဂျက် အစပြုခြင်း
```bash
# ရရှိနိုင်သည့် ပုံစံများကို ကြည့်ရှုပါ
azd template list

# ပုံစံမှ စတင်ပါ
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# လက်ရှိ ဖိုလ်ဒါတွင် စတင်ပါ
azd init .

# စိတ်ကြိုက်နာမည်ဖြင့် စတင်ပါ
azd init --template todo-nodejs-mongo my-awesome-app
```

## အခြေခံ ဖြန့်ချိမှု ကွန်မန်များ

### လုပ်ငန်းစဉ် အပြည့်အစုံ ဖြန့်ချိခြင်း
```bash
# အားလုံးကို တပ်ဆင်ပြီး ဖြန့်ချိမည် (provision နှင့် deploy)
azd up

# အတည်ပြု မေးခွန်းများကို ပိတ်ထားပြီး တပ်ဆင်မည်
azd up --confirm-with-no-prompt

# သတ်မှတ်ထားသော ပတ်ဝန်းကျင်သို့ တပ်ဆင်မည်
azd up --environment production

# စိတ်ကြိုက် ပါရာမီတာများဖြင့် တပ်ဆင်မည်
azd up --parameter location=westus2
```

### အင်ဖရာစထရာသာ
```bash
# Azure အရင်းအမြစ်များကို ထောက်ပံ့ တည်ဆောက်ခြင်း
azd provision

# 🧪 အင်ဖရာပြင်ဆင်မှုများကို ကြိုကြည့်ရှုခြင်း
azd provision --preview
# ဘာအရင်းအမြစ်များကို ဖန်တီး/ပြင်ဆင်/ဖျက်ပစ်မယ်ဆိုတာကို dry-run အနေဖြင့် ပြသပေးသည်
# 'terraform plan' သို့မဟုတ် 'bicep what-if' နှင့် ဆင်တူပြီး - လည်ပတ်ရန် ဘေးကင်းပြီး အပြောင်းအလဲများ မသက်ရောက်ပါ
```

### အက်ပ်လီကေးရှင်းသာ
```bash
# အက်ပလီကေးရှင်း ကုဒ်ကို ဖြန့်ချိပါ
azd deploy

# သတ်မှတ်ထားသော ဝန်ဆောင်မှုတစ်ခုကို ဖြန့်ချိပါ
azd deploy --service web
azd deploy --service api

# ဝန်ဆောင်မှုအားလုံးကို ဖြန့်ချိပါ
azd deploy --all
```

### တည်ဆောက်နှင့် ထုပ်ပိုးခြင်း
```bash
# အက်ပလီကေးရှင်းများ တည်ဆောက်ပါ
azd package

# တိကျသော ဝန်ဆောင်မှုတစ်ခု တည်ဆောက်ပါ
azd package --service api
```

## 🌍 ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှု

### ပတ်ဝန်းကျင် လုပ်ဆောင်ချက်များ
```bash
# ပတ်ဝန်းကျင်များအားလုံးကို စာရင်းပြပါ
azd env list

# ပတ်ဝန်းကျင်အသစ် ဖန်တီးပါ
azd env new development
azd env new staging --location westus2

# ပတ်ဝန်းကျင်ကို ရွေးပါ
azd env select production

# လက်ရှိ ပတ်ဝန်းကျင်ကို ပြပါ
azd env show

# ပတ်ဝန်းကျင်၏ အခြေအနေကို ပြန်လည်အသစ်လုပ်ပါ
azd env refresh
```

### ပတ်ဝန်းကျင် ပြောင်းလဲများ
```bash
# ပတ်ဝန်းကျင်အပြောင်းအလဲကို သတ်မှတ်ပါ
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# ပတ်ဝန်းကျင်အပြောင်းအလဲကို ရယူပါ
azd env get API_KEY

# ပတ်ဝန်းကျင်အပြောင်းအလဲများအားလုံးကို စာရင်းပြပါ
azd env get-values

# ပတ်ဝန်းကျင်အပြောင်းအလဲကို ဖယ်ရှားပါ
azd env unset DEBUG
```

## ⚙️ ဖွဲ့စည်းမှု ကွန်မန်များ

### ကမ္ဘာလုံးဆိုင်ရာ ဖွဲ့စည်းမှု
```bash
# ဆက်တင်များအားလုံးကို စာရင်းပြပါ
azd config list

# ကမ္ဘာလုံးဆိုင်ရာ မူလတန်ဖိုးများကို သတ်မှတ်ပါ
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# ဆက်တင်ကို ဖယ်ရှားပါ
azd config unset defaults.location

# ဆက်တင်အားလုံးကို ပြန်လည်သတ်မှတ်ပါ
azd config reset
```

### ပရောဂျက် ဖွဲ့စည်းမှု
```bash
# azure.yaml ကို စစ်ဆေးပါ
azd config validate

# ပရောဂျက် အချက်အလက် ပြပါ
azd show

# ဝန်ဆောင်မှု အဆုံးချိတ်များ ရယူပါ
azd show --output json
```

## 📊 စောင့်ကြည့်ခြင်းနှင့် ရှာဖွေစစ်ဆေးခြင်း

### စောင့်ကြည့် ဒက်ရှ်ဘုတ်
```bash
# Azure portal ၏ monitoring dashboard ကို ဖွင့်ပါ
azd monitor

# Application Insights ၏ live metrics ကို ဖွင့်ပါ
azd monitor --live

# Application Insights ၏ logs blade ကို ဖွင့်ပါ
azd monitor --logs

# Application Insights ၏ overview ကို ဖွင့်ပါ
azd monitor --overview
```

### ကွန်တိန်နာ မှတ်တမ်း ကြည့်ရှုခြင်း
```bash
# Azure CLI ဖြင့် (Container Apps အတွက်) လော့ဂ်များကို ကြည့်ရန်
az containerapp logs show --name <app-name> --resource-group <rg-name>

# လော့ဂ်များကို အချိန်နှင့်တပြေးညီ လိုက်ကြည့်ရန်
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal မှ လော့ဂ်များကို ကြည့်ရန်
azd monitor --logs
```

### မှတ်တမ်း သုံးသပ်မေးခွန်းများ
```bash
# Azure Portal မှတဆင့် Log Analytics သို့ ဝင်ရောက်ပါ
azd monitor --logs

# Azure CLI ကို အသုံးပြု၍ လော့ဂ်များကို မေးပါ
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ ထိန်းသိမ်းပုံ အမိန့်များ

### ရှင်းလင်းရေး
```bash
# Azure အရင်းအမြစ်များအားလုံး ဖယ်ရှားရန်
azd down

# အတည်ပြုချက်မလိုဘဲ တိုက်ရိုက် ဖျက်ပစ်ရန်
azd down --force

# soft-delete ပြုထားသော အရင်းအမြစ်များအား အမြဲတမ်း ဖျက်ပစ်ရန်
azd down --purge

# သန့်ရှင်းရေး အပြီးအစီး
azd down --force --purge
```

### အသစ်ပြုပြင်ချက်များ
```bash
# azd အပ်ဒိတ်များရှိမရှိ စစ်ဆေးပါ
azd version

# လက်ရှိ ဗားရှင်းကို ရယူပါ
azd version

# လက်ရှိ ဆက်တင်များကို ကြည့်ပါ
azd config list
```

## 🔧 အဆင့်မြင့် ကွန်မန်များ

### Pipeline နှင့် CI/CD
```bash
# GitHub Actions ကို ပြင်ဆင်ရန်
azd pipeline config

# Azure DevOps ကို ပြင်ဆင်ရန်
azd pipeline config --provider azdo

# pipeline ဖွဲ့စည်းမှုကို ပြပါ
azd pipeline show
```

### အင်ဖရာစထရာ စီမံခန့်ခွဲမှု
```bash
# အခြေခံအဆောက်အအုံ ပုံစံများ ဖန်တီးပါ
azd infra generate

# 🧪 အခြေခံအဆောက်အအုံ ကြိုတင်ကြည့်ရှုခြင်းနှင့် စီမံရေးဆွဲခြင်း
azd provision --preview
# တပ်ဆင်ခြင်းမပြုဘဲ အဆောက်အအုံ ပံ့ပိုးမှုကို ရည်မှန်းသရုပ်ပြသည်
# Bicep/Terraform ပုံစံများကို ခွဲခြမ်း၍ ဖော်ပြသည်။
# - ထပ်ထည့်မည့် အရင်းအမြစ်များ (အစိမ်း +)
# - ပြင်ဆင်ရမည့် အရင်းအမြစ်များ (အဝါ ~)
# - ဖျက်ထုတ်မည့် အရင်းအမြစ်များ (နီ -)
# လုံခြုံစွာ လည်ပတ်နိုင်သည် - Azure ပတ်ဝန်းကျင်တွင် အမှန်တကယ် ပြောင်းလဲမှုများမရှိပါ

# azure.yaml မှ အဆောက်အအုံကို ပေါင်းစပ်ဖန်တီးပါ
azd infra synth
```

### ပရောဂျက် အချက်အလက်
```bash
# ပရောဂျက် အခြေအနေနှင့် endpoints များကို ပြပါ
azd show

# ပရောဂျက် အချက်အလက်အသေးစိတ်ကို JSON အဖြစ် ပြပါ
azd show --output json

# ဝန်ဆောင်မှု endpoints များကို ရယူပါ
azd show --output json | jq '.services'
```

## 🤖 AI နှင့် တိုးချဲ့မှု ကွန်မန်များ

### AZD တိုးချဲ့မှုများ
```bash
# အသုံးပြုနိုင်သော extension အားလုံးကို (AI အပါအဝင်) စာရင်းပြပါ
azd extension list

# Foundry agents extension ကို တပ်ဆင်ပါ
azd extension install azure.ai.agents

# fine-tuning extension ကို တပ်ဆင်ပါ
azd extension install azure.ai.finetune

# custom models extension ကို တပ်ဆင်ပါ
azd extension install azure.ai.models

# တပ်ဆင်ထားသော extension အားလုံးကို မြှင့်တင်ပါ
azd extension upgrade --all
```

### AI Agent ကွန်မန်များ
```bash
# manifest မှ အေးဂျင့် ပရောဂျက်ကို စတင်ဖန်တီးပါ
azd ai agent init -m <manifest-path-or-uri>

# တိကျသော Foundry ပရောဂျက်တစ်ခုကို ရည်ရွယ်ပါ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# အေးဂျင့် အရင်းအမြစ် ဖိုလ်ဒါကို သတ်မှတ်ပါ
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ဟိုစ့် အတွက် ရည်ရွယ်ထားသော ပလက်ဖောင်းကို ရွေးချယ်ပါ
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP ဆာဗာ (Alpha)
```bash
# သင့်ပရောဂျက်အတွက် MCP ဆာဗာကို စတင်ပါ
azd mcp start

# MCP လုပ်ဆောင်ချက်များအတွက် ကိရိယာအသုံးပြုခွင့်ကို စီမံပါ
azd mcp consent
```

### အင်ဖရာစထရာ ထုတ်လုပ်ခြင်း
```bash
# သင့်ပရောဂျက်သတ်မှတ်ချက်မှ IaC ဖိုင်များ ဖန်တီးပါ
azd infra generate

# azure.yaml မှ အောက်ခံအဆောက်အအုံကို စုပေါင်းတည်ဆောက်ပါ
azd infra synth
```

---

## 🎯 အမြန်လုပ်ငန်းစဉ်များ

### ဖွံ့ဖြိုးရေး အလုပ်စဉ်
```bash
# ပရောဂျက်အသစ် စတင်ပါ
azd init --template todo-nodejs-mongo
cd my-project

# ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်သို့ တပ်ဆင်ပါ
azd env new dev
azd up

# ပြင်ဆင်ချက်များ ပြုလုပ်ပြီး ပြန်တပ်ဆင်ပါ
azd deploy

# စောင့်ကြည့်ရေး ဒက်ရှ်ဘုတ် ဖွင့်ပါ
azd monitor --live
```

### မျိုးစုံ ပတ်ဝန်းကျင် အလုပ်စဉ်
```bash
# ပတ်ဝန်းကျင်များကို စီစဉ်တပ်ဆင်ပါ
azd env new dev
azd env new staging  
azd env new production

# ဖွံ့ဖြိုးရေး (dev) သို့ တင်ပို့ပါ
azd env select dev
azd up

# စမ်းသပ်ပြီး စတေဂျ် (staging) သို့ မြှင့်တင်ပါ
azd env select staging
azd up

# ထုတ်လုပ်ရေး (production) သို့ တင်ပို့ပါ
azd env select production
azd up
```

### ပြဿနာရှာဖွေ အလုပ်စဉ်
```bash
# debug မုဒ်ကို ဖွင့်ပါ
export AZD_DEBUG=true

# တပ်ဆင်မှု အခြေအနေကို စစ်ဆေးပါ
azd show

# ဆက်တင်များကို အတည်ပြုပါ
azd config list

# လော့ဂ်များအတွက် စောင့်ကြည့်ရေး ဒက်ရှ်ဘုတ်ကို ဖွင့်ပါ
azd monitor --logs

# ရင်းမြစ် အခြေအနေကို စစ်ဆေးပါ
azd show --output json
```

## 🔍 အမှားရှာဖွေရေး ကွန်မန်များ

### အမှား အချက်အလက်
```bash
# ဒီဘတ် (debug) အထွက်ကို ဖွင့်ပါ
export AZD_DEBUG=true
azd <command> --debug

# အထွက်ကို ပိုမိုသန့်ရှင်းစေရန် telemetry ကို ပိတ်ပါ
export AZD_DISABLE_TELEMETRY=true

# လက်ရှိ ဖွဲ့စည်းမှုကို စစ်ဆေးပါ
azd config list

# အတည်ပြုမှု အခြေအနေကို စစ်ဆေးပါ
az account show
```

### စံနမူနာ အမှားရှာဖွေခြင်း
```bash
# အသုံးပြုနိုင်သော ပုံစံများကို အသေးစိတ်အချက်အလက်များနှင့် စာရင်းပြပါ
azd template list --output json

# ပုံစံအချက်အလက် ပြပါ
azd template show <template-name>

# init မလုပ်ခင် ပုံစံကို စစ်ဆေးပါ
azd template validate <template-name>
```

## 📁 ဖိုင်နှင့် ဒိုင်ရေးထရီ ကွန်မန်များ

### ပရောဂျက် ဖွဲ့စည်းပုံ
```bash
# လက်ရှိ ဒိုင်ရက်ထရီ ဖွဲ့စည်းမှုကို ပြပါ
tree /f  # Windows
find . -type f  # Linux/macOS

# azd ပရောဂျက်၏ root ဒိုင်ရက်ထရီသို့ သွားပါ
cd $(azd root)

# azd ဖွဲ့စည်းပုံ (configuration) ဒိုင်ရက်ထရီကို ပြပါ
echo $AZD_CONFIG_DIR  # ပုံမှန်အားဖြင့် ~/.azd
```

## 🎨 ထွက်ရလဒ် ဖော်မက်တင်း

### JSON ထွက်စဉ်
```bash
# စကရစ်ရေးသားခြင်းအတွက် JSON အထွက်ရယူရန်
azd show --output json
azd env list --output json
azd config list --output json

# jq ဖြင့် ခွဲထုတ်ပါ
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ဇယား ထွက်စဉ်
```bash
# ဇယားအဖြစ် ဖော်မတ်ပါ
azd env list --output table

# တပ်ဆင်ထားသော ဝန်ဆောင်မှုများကို ကြည့်ပါ
azd show --output json | jq '.services | keys'
```

## 🔧 ရိုးရိုး ကွန်မန် တွဲဖက်အသုံးပြုမှုများ

### ကျန်းမာရေး စစ်ဆေး စာတမ်း
```bash
#!/bin/bash
# လျင်မြန်သော အခြေအနေ စစ်ဆေးခြင်း
azd show
azd env show
azd monitor --logs
```

### ဖြန့်ချိမှု မှန်ကန်ရေး စိစစ်ခြင်း
```bash
#!/bin/bash
# တပ်ဆင်ခင် အတည်ပြုစစ်ဆေးခြင်း
azd show
azd provision --preview  # တပ်ဆင်ခင် ပြောင်းလဲချက်များကို ကြိုကြည့်ပါ
az account show
```

### ပတ်ဝန်းကျင် နှိုင်းယှဉ်ခြင်း
```bash
#!/bin/bash
# ပတ်ဝန်းကျင်များကို နှိုင်းယှဉ်ပါ
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### အရင်းအမြစ် ရှင်းလင်းရေး စာတမ်း
```bash
#!/bin/bash
# အဟောင်းပတ်ဝန်းကျင်များကို ရှင်းလင်းပါ
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 ပတ်ဝန်းကျင် အပြောင်းအလဲများ

### ပုံမှန် ပတ်ဝန်းကျင် အပြောင်းအလဲများ
```bash
# Azure ဆက်တင်
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD ဆက်တင်
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Application ဆက်တင်
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 အရေးပေါ် ကွန်မန်များ

### အမြန်ပြင်ဆင်နည်းများ
```bash
# အတည်ပြုမှုကို ပြန်လည်စတင်ရန်
az account clear
az login

# ပတ်ဝန်းကျင်ကို အတင်းအကျပ်ဖြင့် ပြန်လှည့်ရန်
azd env refresh

# ဝန်ဆောင်မှုအားလုံးကို ပြန်လည်ဖြန့်ချိရန်
azd deploy

# ဖြန့်ချိမှု အခြေအနေကို စစ်ဆေးရန်
azd show --output json
```

### နောက်ပြန်ထိန်းသိမ်း ကွန်မန်များ
```bash
# တပ်ဆင်မှု မအောင်မြင်သွားသောအခြေအနေမှ ပြန်လည်ကယ်ဆယ်ခြင်း - သန့်ရှင်းပြီး ထပ်မံတပ်ဆင်ခြင်း
azd down --force --purge
azd up

# အခြေခံအဆောက်အအုံကိုသာ ပြန်လည်ပံ့ပိုးခြင်း
azd provision

# အက်ပလီကေးရှင်းကိုသာ ထပ်မံတပ်ဆင်ခြင်း
azd deploy
```

## 💡 ကျွမ်းကျင်သူ အကြံပြုချက်များ

### အလုပ်လျင်မြန်စေရန် အမည်ချိတ် (Aliases)
```bash
# သင့် .bashrc သို့မဟုတ် .zshrc ထဲသို့ ထည့်ပါ
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### လုပ်ဆောင်ချက် အတိုကောက်များ
```bash
# ပတ်ဝန်းကျင် အမြန်ပြောင်းလဲခြင်း
azd-env() {
    azd env select $1 && azd show
}

# စောင့်ကြည့်မှုနှင့်အတူ အမြန် တပ်ဆင်ခြင်း
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# ပတ်ဝန်းကျင် အခြေအနေ
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 အကူအညီနှင့် စာတမ်း

### အကူအညီ ရယူခြင်း
```bash
# အထွေထွေ အကူအညီ
azd --help
azd help

# အမိန့်အလိုက် သီးသန့် အကူအညီ
azd up --help
azd env --help
azd config --help

# ဗားရှင်းနှင့် တည်ဆောက်မှု အချက်အလက် ပြရန်
azd version
azd version --output json
```

### စာတမ်း ချိတ်ဆက်လင့်များ
```bash
# ဘရောက်ဇာတွင် လက်စွဲစာတမ်းကို ဖွင့်ပါ
azd docs

# နမူနာ လက်စွဲစာတမ်းကို ပြပါ
azd template show <template-name> --docs
```

---

**အကြံပြုချက်**: ဒီ လျင်မြန် လက်စွဲကို Bookmark လုပ်ထားပြီး `Ctrl+F` ကို အသုံးပြုပြီး သင့်လိုအပ်သော ကွန်မန်များကို အမြန်ရှာဖွေပါ။

---

**လမ်းညွှန်**
- **ယခင် သင်ခန်းစာ**: [Preflight စစ်ဆေးမှုများ](../docs/pre-deployment/preflight-checks.md)
- **နောက်ထပ် သင်ခန်းစာ**: [အသုံးအနှုန်း](glossary.md)

---

> **💡 သင့် တည်းဖြတ်ရေးကိရိယာတွင် Azure ကွန်မန် အကူအညီလိုပါသလား?** [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) ကို `npx skills add microsoft/github-copilot-for-azure` ဖြင့် တပ်ဆင်ပါ — AI၊ Foundry၊ ဖြန့်ချိခြင်း၊ ရှာဖွေစစ်ဆေးရေးများနှင့် အခြားများအတွက် 37 skills ပါဝင်သည်။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**တာဝန်ပယ်ချချက်**:
ယခုစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးပမ်းသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် တိကျမှုနည်းပါးမှုများ ပါရှိနိုင်ကြောင်း သတိပြုပါ။ မူလစာတမ်းကို ၎င်း၏ မိခင်ဘာသာဖြင့် ရှိသည့် ဗားရှင်းကို တရားဝင် အရင်းအမြစ်အဖြစ် ယူဆသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန် အတတ်ပညာရှင်မှ ဘာသာပြန်ပေးရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်နိုင်သည့် မနားလည်မှုများ သို့မဟုတ် မှားယွင်းသော နားလည်ချက်များအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->