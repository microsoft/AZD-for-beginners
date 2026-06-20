# Command Cheat Sheet - အရေးပါတဲ့ AZD အမိန့်များ

**အခန်းအားလုံးအတွက် အမြန် ရည်ညွှန်းစာရင်း**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Quick Start**: [အခန်း ၁: အခြေခံနှင့် အစပိုင်း လျင်မြန်စတင်ခြင်း](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [အခန်း ၂: AI-ဦးစားပေး ဖွံ့ဖြိုးရေး (AI ဖွံ့ဖြိုးရေးသူများအတွက် အကြံပြု)](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [အခန်း ၄: Infrastructure as Code (တည်ဆောက်မှုကို ကုဒ်ဖြင့် စီမံခြင်း)](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## နိဒါန်း

ဤ ကမ်းမန်သည် Azure Developer CLI အများဆုံး အသုံးပြုသော အမိန့်များကို အမျိုးအစားများအလိုက် ကိရိယာပုံစံဖြင့်၊ အသုံးကျသော ဥပမာများနှင့် အတူ တိတိကျကျ ရရှိရန် ဖန်တီးထားသည်။ azd ပရောဂျက်များနှင့် ဖွံ့ဖြိုးရေး, ပြဿနာရှာဖွေရေး၊ နေ့စဉ် လုပ်ငန်းများအတွက် အမြန် ရှာဖွေရန် အထူးသင့်တော်သည်။

## သင်ယူလိုသည့် ရည်မှန်းချက်များ

ဤ ကမ်းမန်ကို အသုံးပြုခြင်းဖြင့် သင်သည် -
- အရေးပါတဲ့ Azure Developer CLI အမိန့်များနှင့် စိန်ခေါ်ရေးရာ စာလုံးများကို အမြန်ရယူနိုင်မည်
- အမိန့်များကို လုပ်ငန်းဆိုင်ရာ ဌာနခွဲအလိုက်နားလည်နိုင်မည်
- ပုံမှန် ဖွံ့ဖြိုးရေးနှင့် တင်သွင်းမှုအခြေအနေများအတွက် အသုံးဝင် ဥပမာများကို ရည်ညွှန်းနိုင်မည်
- ပြဿနာရှာဖွေရေးအတွက် အမြန် ဖြေရှင်းရန် အမိန့်များကို အသုံးပြုနိုင်မည်
- အဆင့်မြင့် ဆက်တင်များနှင့် စိတ်ကြိုက် ပြင်ဆင်မှုများကို ထိရောက်စွာ ရှာဖွေနိုင်မည်
- ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှုနှင့် မျိုးစုံ ပတ်ဝန်းကျင် လုပ်ငန်းစဉ်များကို တိတိကျကျ စီမံနိုင်မည်

## သင်ယူပြီးရလဒ်များ

ဒီ ကမ်းမန်ကို အနှိပ်အတွဲ အသုံးပြုလျှင် သင်သည် -
- azd အမိန့်များကို အပြည့်အစုံ စာရွက်ကို မကိုးပဲ ယုံကြည်စွာ အကောင်အထည်ဖော်နိုင်မည်
- သင့်တင်သွင်းမှုများနှင့် ပတ်သက်သည့် ပုံမှန်ပြဿနာများကို သင့်တော်သော ရှာဖွေသိရှိရေး အမိန့်များဖြင့် အမြန်ဖြေရှင်းနိုင်မည်
- မျိုးစုံ ပတ်ဝန်းကျင်များနှင့် တင်သွင်းမှု အခြေအနေများကို ထိရောက်စွာ စီမံနိုင်မည်
- လိုအပ်သလို azd ၏ အဆင့်မြင့် ဖျော်ဖြေမှုများနှင့် ဆက်တင်များကို အကောင်အထည်ဖော်နိုင်မည်
- တင်သွင်းမှုပြဿနာများကို စနစ်တကျ အမိန့်စဉ်များဖြင့် ပြန်လည်စစ်ဆေး၍ ဖြေရှင်းနိုင်မည်
- azd ၏ shortcut များနှင့် option များကို အသုံးချကာ လုပ်ငန်းစဉ်များကို ထိရောက်စွာ တိုးတက်စေနိုင်မည်

## စတင်အသုံးပြုရန် အမိန့်များ

### အတည်ပြုခြင်း
```bash
# AZD ဖြင့် Azure သို့ လော့ဂ်အင် ဝင်ပါ
azd auth login

# Azure CLI သို့ လော့ဂ်အင် ဝင်ပါ (AZD သည် အောက်ပိုင်းတွင် ဤကို အသုံးပြုသည်)
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

### ပရောဂျက် စတင်ခြင်း
```bash
# ရနိုင်သော နမူနာများကို ကြည့်ရှုပါ
azd template list

# နမူနာမှ စတင်တည်ဆောက်ပါ
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# လက်ရှိ ဖိုလ်ဒါတွင် စတင်တည်ဆောက်ပါ
azd init .

# စိတ်ကြိုက် အမည်ဖြင့် စတင်တည်ဆောက်ပါ
azd init --template todo-nodejs-mongo my-awesome-app
```

## အဓိက တင်သွင်းခြင်း အမိန့်များ

### အပြည့်အစုံ တင်သွင်း လုပ်ငန်းစဉ်
```bash
# အားလုံးကို အရင်းအမြစ်ထောက်ပံ့ခြင်းနှင့် ဖြန့်ချိခြင်း
azd up

# အတည်ပြုမေးခွန်းများကို ပိတ်ထား၍ ဖြန့်ချိခြင်း
azd up --confirm-with-no-prompt

# တိကျသော ပတ်ဝန်းကျင်သို့ ဖြန့်ချိခြင်း
azd up --environment production

# စိတ်ကြိုက် ပါရာမီတာများဖြင့် ဖြန့်ချိခြင်း
azd up --parameter location=westus2
```

### Infrastructure သီးသန့်
```bash
# Azure အရင်းအမြစ်များကို တည်ဆောက်ခြင်း
azd provision

# 🧪 အဆောက်အအုံပြောင်းလဲမှုများကို ကြိုတင်ကြည့်ရှုခြင်း
azd provision --preview
# အရင်းအမြစ်တွေကို ဘယ်ဟာတွေ ဖန်တီးမယ်/ပြင်မယ်/ဖျက်မယ်ဆိုတာကို မလုပ်မီ (dry-run) ကြည့်မြင်နိုင်သော မြင်ကွင်းကို ပြသသည်
# 'terraform plan' သို့ 'bicep what-if' ကဲ့သို့ ဆင်တူပြီး — လည်ပတ်ရုံဖြင့် ဘေးကင်းကာ ပြောင်းလဲမှုများ မဖြစ်ပျက်ပါ
```

### အက်ပလီကေးရှင်း သီးသန့်
```bash
# အပလီကေးရှင်းကုဒ်ကို ဖြန့်ချိပါ
azd deploy

# သီးသန့် ဝန်ဆောင်မှုတစ်ခုကို ဖြန့်ချိပါ
azd deploy --service web
azd deploy --service api

# ဝန်ဆောင်မှုအားလုံးကို ဖြန့်ချိပါ
azd deploy --all
```

### တည်ဆောက်ခြင်းနှင့် ပက်ကေ့ချ်
```bash
# အက်ပလီကေးရှင်း၏ လိုအပ်ချက်များကို ပြန်လည်ဒေါင်းလုတ်ခြင်း
azd restore

# သတ်မှတ်ထားသော ဆာဗစ်တစ်ခုကို ပြန်လည်ရယူခြင်း
azd restore --service api

# တပ်ဆင်ခြင်း မလုပ်ဘဲ တပ်ဆင်နိုင်သော ဖိုင်တစ်ခုကို တည်ဆောက်ခြင်း
azd package

# သတ်မှတ်ထားသော ဆာဗစ်ကို တည်ဆောက်ခြင်း
azd package --service api
```

> **`azd restore`** သည် သင့်အက်ပလီကေးရှင်း၏ မူလစာရင်းပစ္စည်းများကို (npm, pip, NuGet, Maven, အစရှိသည့်) ဒေါင်းလုတ်ချသည်။ ၎င်းကို `azd package` နှင့် `azd deploy` အတွင်း အလိုအလျောက် ပြုလုပ်သဖြင့် သင့်အား မကြာခဏ တိုက်ရိုက် ခေါ်ယူရန် မလိုပါ—CI cache ကို ကြိုအပူပေးရန် သို့မဟုတ် အော့ဖ်လိုင်းတွင် အလုပ်လုပ်ရန် ကြိုတင် ထပ်မံဒေါင်းလုပ်ချင်သောအခါ အသုံးပြုပါ။

> **`azd package`** သည် Azure သို့ push မလုပ်ဘဲ တင်သွင်းနိုင်သည့် အရာကို (container image သို့မဟုတ် zip) တည်ဆောက်သည်။ တည်ဆောက်မှု အောင်မြင်မည်ကို စစ်ဆေးရန်၊ ထွက်ပစ္စည်းကို ကြည့်ရှုရန် သို့မဟုတ် နောက်တစ်ဆင့်လုပ်ငန်းစဉ်မှ တင်သွင်းရန် artifact တစ်ခု ထုတ်ရန် အသုံးပြုပါ။ `azd deploy` သည် အလိုအလျောက် package လုပ်ပေးသဖြင့်၊ တင်သွင်းခြင်းမပြုဘဲ artifact လိုချင်ပါကသာ `azd package` ကို အသုံးပြုပါ။


## 🌍 ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှု

### ပတ်ဝန်းကျင် လုပ်ငန်းဆောင်တာများ
```bash
# ပတ်ဝန်းကျင်အားလုံးကို စာရင်းပြပါ
azd env list

# ပတ်ဝန်းကျင်အသစ်တစ်ခု ဖန်တီးပါ
azd env new development
azd env new staging --location westus2

# ပတ်ဝန်းကျင်ကို ရွေးချယ်ပါ
azd env select production

# အသုံးပြုနိုင်သော ပတ်ဝန်းကျင်များကို ပြပါ
azd env list

# ပတ်ဝန်းကျင်အခြေအနေကို ပြန်လည်အပ်ဒိတ်လုပ်ပါ
azd env refresh
```

### ပတ်ဝန်းကျင် အပြောင်းအလဲများ
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

## ⚙️ ဖော်ပြချက် အမိန့်များ

### ကမ္ဘာလုံးဆိုင်ရာ ဖော်ပြချက်
```bash
# ဖွဲ့စည်းမှုအားလုံးကို စာရင်းပြပါ
azd config show

# စနစ်လုံးဆိုင်ရာ ပုံမှန်တန်ဖိုးများ သတ်မှတ်ပါ
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# ဖွဲ့စည်းမှုကို ဖယ်ရှားပါ
azd config unset defaults.location

# ဖွဲ့စည်းမှုအားလုံးကို ပြန်စက်တင်ပါ
azd config reset
```

### ပရောဂျက် ဖော်ပြချက်
```bash
# azure.yaml ကို စစ်ဆေးပါ
azd config validate

# ပရောဂျက် အချက်အလက် ပြပါ
azd show

# ဝန်ဆောင်မှု endpoints များကို ရယူပါ
azd show --output json
```

## 📊 အခြေအနေ စောင့်ကြည့်ခြင်းနှင့် တာဝန်စစ်ဆေးမှု

### စောင့်ကြည့် ဒက်ရှ်ဘုတ်
```bash
# Azure portal ၏ မော်နီတာဒက်ရှ်ဘုတ်ကို ဖွင့်ပါ
azd monitor

# Application Insights ၏ Live Metrics ကို ဖွင့်ပါ
azd monitor --live

# Application Insights ၏ Logs ဘလိတ်ကို ဖွင့်ပါ
azd monitor --logs

# Application Insights ၏ အနှစ်ချုပ်ကို ဖွင့်ပါ
azd monitor --overview
```

### ကွန်တိနာ မှတ်တမ်းများ ကြည့်ရှုခြင်း
```bash
# Azure CLI မှတဆင့် Container Apps အတွက် လော့ဂ်များကို ကြည့်ရန်
az containerapp logs show --name <app-name> --resource-group <rg-name>

# လော့ဂ်များကို အချိန်နှင့်တပြေးညီ လိုက်နာကြည့်ရန်
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal မှ လော့ဂ်များကို ကြည့်ရန်
azd monitor --logs
```

### မှတ်တမ်း သုံးသပ်မှု မေးခွန်းများ
```bash
# Azure Portal မှ Log Analytics သို့ ဝင်ရောက်အသုံးပြုပါ
azd monitor --logs

# Azure CLI အသုံးပြုပြီး log များကို မေးမြန်းပါ
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ ထိန်းသိမ်းမှုပြုရန် အမိန့်များ

### သန့်ရှင်းရေး
```bash
# Azure အရင်းအမြစ်အားလုံးကို ဖယ်ရှားပါ
azd down

# အတည်ပြုချက်မမေးဘဲ အကြမ်းဖျက်ပစ်ပါ
azd down --force

# soft-delete ဖြင့် ဖျက်ထားသော အရင်းအမြစ်များကို လုံးဝ ဖျက်ပစ်ပါ
azd down --purge

# သန့်ရှင်းရေး ပြီးစီး
azd down --force --purge
```

### အပ်ဒိတ်များ
```bash
# azd အပ်ဒိတ်များကို စစ်ဆေးပါ
azd version

# လက်ရှိ ဗားရှင်းကို ရယူပါ
azd version

# လက်ရှိ ဖွဲ့စည်းမှုကို ကြည့်ပါ
azd config show
```

## 🔧 အဆင့်မြင့် အမိန့်များ

### Pipeline နှင့် CI/CD
```bash
# GitHub Actions ကို ပြင်ဆင်ပါ
azd pipeline config

# Azure DevOps ကို ပြင်ဆင်ပါ
azd pipeline config --provider azdo

# pipeline ဆက်တင်များကို ပြပါ
azd pipeline show
```

### အင်ဖရာစထ်ရာ စီမံခန့်ခွဲမှု
```bash
# အင်ဖရာစထရပ်ချာ တမ်းပလိတ်များ ဖန်တီးပါ
azd infra generate

# 🧪 အင်ဖရာစထရပ်ချာ ကြိုကြည့်ခြင်းနှင့် စီမံကိန်းရေးဆွဲခြင်း
azd provision --preview
# တပ်ဆင်ခြင်းမရှိဘဲ အင်ဖရာစထရပ်ချာ ပေးပို့မှုကို အတုကဲ့သို့ ပြသသည်
# Bicep/Terraform တမ်းပလိတ်များကို ခွဲခြမ်းစိစစ်ပြီး ပြသည်:
# - ထည့်ရန် အရင်းအမြစ်များ (အစိမ်း +)
# - ပြင်ဆင်ရန် အရင်းအမြစ်များ (အဝါ ~)
# - ဖျက်ရန် အရင်းအမြစ်များ (နီ -)
# လုံခြုံစိတ်ချစွာ လည်ပတ်နိုင်သည် - Azure ပတ်ဝန်းကျင်တွင် တကယ်တမ်း ပြောင်းလဲမှု မဖြစ်ပေါ်ပါ

# azure.yaml မှ အင်ဖရာစထရပ်ချာ ဖန်တီးသည်
azd infra synth
```

### ပရောဂျက် သတင်းအချက်အလက်
```bash
# ပရောဂျက် အခြေအနေ နှင့် endpoint များကို ပြပါ
azd show

# JSON အနေဖြင့် ပရောဂျက် အချက်အလက်အသေးစိတ်ကို ပြပါ
azd show --output json

# ဝန်ဆောင်မှု endpoint များကို ရယူပါ
azd show --output json | jq '.services'
```

## 🤖 AI နှင့် တိုးချဲ့မှု အမိန့်များ

### AZD တိုးချဲ့မှုများ
```bash
# ရနိုင်သော တိုးချဲ့မှုများအားလုံးကို စာရင်းပြပါ (AI အပါအဝင်)
azd extension list

# Foundry agents တိုးချဲ့မှုကို တပ်ဆင်ပါ
azd extension install azure.ai.agents

# Agent skills တိုးချဲ့မှုကို တပ်ဆင်ပါ (ကြိုကြည့်)
azd extension install azure.ai.skills

# Foundry connections တိုးချဲ့မှုကို တပ်ဆင်ပါ (ကြိုကြည့်)
azd extension install azure.ai.connections

# Fine-tuning တိုးချဲ့မှုကို တပ်ဆင်ပါ
azd extension install azure.ai.finetune

# စိတ်ကြိုက် မော်ဒယ်များ တိုးချဲ့မှုကို တပ်ဆင်ပါ
azd extension install azure.ai.models

# တပ်ဆင်ပြီးသား တိုးချဲ့မှုများအားလုံးကို အဆင့်မြှင့်တင်ပါ
azd extension upgrade --all
```

### AI Agent အမိန့်များ
```bash
# manifest ဖိုင်မှ အေဂျင့် ပရောဂျက်ကို စတင်ဖန်တီးပါ
azd ai agent init -m <manifest-path-or-uri>

# တိကျသော Foundry ပရောဂျက်ကို ရည်ညွှန်းပါ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# အေဂျင့် ရင်းမြစ် ဖိုလ်ဒါကို သတ်မှတ်ပါ
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ဟိုစ့်တင်မည့် တည်နေရာကို ရွေးချယ်ပါ
azd ai agent init -m agent-manifest.yaml --host containerapp

# တပ်ဆင်ပြီးသား အေဂျင့်ကို စမ်းသပ်ပါ (latency နှင့် time-to-first-byte ကို ပရင့်ထုတ်ပြပါ)
azd ai agent invoke

# လက်ရှိ live endpoint ၏ ဖန်တီးထားမှုကို ပြပါ
azd ai agent endpoint show

# အကဲဖြတ်ရေး ဒေတာစုတစ်ခုကို ဖန်တီးပြီး ထို့နောက် အေဂျင့်ကို တိုးတက်အောင် မြှင့်တင်ပါ
azd ai agent eval generate
azd ai agent optimize

# ကုဒ်အခြေပြု ဟိုစ့်တင်ထားသော အေဂျင့်၏ တပ်ဆင်ထားသော ရင်းမြစ်ကို ဒေါင်းလုတ်ဆွဲပါ
azd ai agent code download

# ဟိုစ့်တင်ထားသော အေဂျင့်နှင့် ၎င်း၏ ဗားရှင်းအားလုံးကို ဖျက်ပါ (--force သည် လက်ရှိ အလုပ်လုပ်နေသော session များကို ပြီးဆုံးစေသည်)
azd ai agent delete --force
```

### MCP Server (Alpha)
```bash
# သင်၏ပရောဂျက်အတွက် MCP ဆာဗာကို စတင်ပါ
azd mcp start

# MCP လည်ပတ်မှုများအတွက် ကိရိယာ အသုံးပြုခွင့် သဘောတူညီမှုကို စီမံပါ
azd copilot consent list
```

### အင်ဖရာစထ်ရာ ထုတ်လုပ်ခြင်း
```bash
# သင့် ပရောဂျက် သတ်မှတ်ချက်မှ IaC ဖိုင်များ ဖန်တီးပါ
azd infra generate

# azure.yaml မှ အင်ဖရာစထရပ်ချာကို စုပေါင်းဖန်တီးပါ
azd infra synth
```

---

## 🎯 အမြန် လုပ်ငန်းစဉ်များ

### ဖွံ့ဖြိုးရေး လုပ်စဉ်
```bash
# ပရောဂျက်အသစ်စတင်ပါ
azd init --template todo-nodejs-mongo
cd my-project

# ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်သို့ တပ်ဆင်ပါ
azd env new dev
azd up

# ပြင်ဆင်ချက်များပြုလုပ်ပြီး ထပ်မံတပ်ဆင်ပါ
azd deploy

# စောင့်ကြည့် ဒက်ရှ်ဘုတ်ကို ဖွင့်ပါ
azd monitor --live
```

### ပတ်ဝန်းကျင် မျိုးစုံ လုပ်ငန်းစဉ်
```bash
# ပတ်ဝန်းကျင်များကို ပြင်ဆင်ပါ
azd env new dev
azd env new staging  
azd env new production

# dev သို့ ဖြန့်ချိပါ
azd env select dev
azd up

# စမ်းသပ်ပြီး staging သို့ မြှင့်တင်ပါ
azd env select staging
azd up

# production သို့ ဖြန့်ချိပါ
azd env select production
azd up
```

### ပြဿနာဖြေရှင်း လုပ်ငန်းစဉ်
```bash
# debug မုဒ်ကို ဖွင့်ပါ
export AZD_DEBUG=true

# တပ်ဆင်မှု အခြေအနေကို စစ်ဆေးပါ
azd show

# ချိန်ညှိချက်များကို အတည်ပြုပါ
azd config show

# မှတ်တမ်းများအတွက် စောင့်ကြပ်မှု ဒက်ရှ်ဘုတ်ကို ဖွင့်ပါ
azd monitor --logs

# အရင်းအမြစ် အခြေအနေကို စစ်ဆေးပါ
azd show --output json
```

## 🔍 အမှားရှာဖွေရေး အမိန့်များ

### အမှားရှာဖွေရေး အချက်အလက်
```bash
# အမှားရှာဖွေရေး အထွက်ကို ဖွင့်ပါ
export AZD_DEBUG=true
azd <command> --debug

# ပိုသန့်ရှင်းသော အထွက်ရရန် တယ်လီမက်ထရီကို ပိတ်ပါ
export AZD_DISABLE_TELEMETRY=true

# လက်ရှိ ဖွဲ့စည်းမှုကို စစ်ဆေးပါ
azd config show

# အတည်ပြုမှုအခြေအနေကို စစ်ဆေးပါ
az account show
```

### သင်္ချာစမ်း စံနမူနာ အမှားရှာဖွေခြင်း
```bash
# အသေးစိတ်အချက်အလက်များနှင့် အသုံးပြုနိုင်သော တမ်းပလိတ်များကို စာရင်းပြပါ
azd template list --output json

# တမ်းပလိတ်၏ အချက်အလက်များကို ပြပါ
azd template show <template-name>

# init မလုပ်ခင် တမ်းပလိတ်ကို စစ်ဆေးပါ
azd template validate <template-name>
```

## 📁 ဖိုင်နှင့် ဖိုလ်ဒါ အမိန့်များ

### ပရောဂျက် ဖွဲ့စည်းပုံ
```bash
# လက်ရှိ ဖိုလ်ဒါ ဖွဲ့စည်းမှုကို ပြပါ
tree /f  # Windows
find . -type f  # Linux/macOS

# azd ပရောဂျက်၏ မူလ ဖိုလ်ဒါသို့ သွားပါ
cd $(azd root)

# azd သတ်မှတ်ချက် ဖိုလ်ဒါကို ပြပါ
echo $AZD_CONFIG_DIR  # ပုံမှန်အားဖြင့် ~/.azd
```

## 🎨 ထွက်ပေါက် ဖော်မတ်ပုံစံ

### JSON ထွက်ဖော်မတ်
```bash
# စကရစ်များအတွက် JSON အထွက်ရယူပါ
azd show --output json
azd env list --output json
azd config show --output json

# jq ဖြင့် ခွဲထုတ်ပါ
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ဇယား ပုံစံ ထွက်ပေါက်
```bash
# ဇယားအဖြစ် ဖော်စည်းပါ
azd env list --output table

# ဖြန့်ချိထားသော ဝန်ဆောင်မှုများကို ကြည့်ပါ
azd show --output json | jq '.services | keys'
```

## 🔧 ပုံမှန် အမိန့် တွဲဖက်အသုံးပြုမှုများ

### ကျန်းမာရေး စစ်ဆေးရေး Script
```bash
#!/bin/bash
# အမြန် ကျန်းမာရေး စစ်ဆေးခြင်း
azd show
azd env get-values
azd monitor --logs
```

### တင်သွင်းမှု အတည်ပြုခြင်း
```bash
#!/bin/bash
# တပ်ဆင်မပြုမီ အတည်ပြုစစ်ဆေးခြင်း
azd show
azd provision --preview  # တပ်ဆင်မပြုမီ ပြောင်းလဲချက်များကို ကြိုတင်ကြည့်ရှုပါ
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

### အရင်းအမြစ် သန့်ရှင်းရေး Script
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

# အပလီကေးရှင်း ဆက်တင်
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 အရေးပေါ် အမိန့်များ

### အမြန် ပြင်ဆင်မှုများ
```bash
# အတည်ပြုချက်ကို ပြန်လည်သတ်မှတ်ပါ
az account clear
az login

# ပတ်ဝန်းကျင်ကို အတင်းအကျပ်ဖြင့် ပြန်လည်အသစ်လုပ်ပါ
azd env refresh

# ဝန်ဆောင်မှုအားလုံးကို ပြန်လည်တင်သွင်းပါ
azd deploy

# တင်သွင်းမှုအခြေအနေကို စစ်ဆေးပါ
azd show --output json
```

### ပြန်လည်ထူထောင်ရေး အမိန့်များ
```bash
# တပ်ဆင်မှု မအောင်မြင်ခဲ့လျှင် ပြန်လည်နိုင်ရန် - သန့်ရှင်းပြီး ပြန်လည်တပ်ဆင်ပါ
azd down --force --purge
azd up

# အောက်ခံအဆောက်အအုံကိုသာ ပြန်လည်ထောက်ပံ့ပါ
azd provision

# အက်ပလီကေးရှင်းကိုသာ ပြန်လည်တပ်ဆင်ပါ
azd deploy
```

## 💡 ကျွမ်းကျင်သူ အကြံပြုချက်များ

### လျင်မြန်သည့် ကုန်လမ်းအတွက် အတိုကောက်များ
```bash
# သင့် .bashrc သို့မဟုတ် .zshrc တွင် ထည့်ပါ
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### လုပ်ဆောင်ချက် အတိုကောက်များ
```bash
# ပတ်ဝန်းကျင်ကို အမြန်ပြောင်းနိုင်ခြင်း
azd-env() {
    azd env select $1 && azd show
}

# စောင့်ကြည့်မှုပါရှိပြီး အမြန် ဖြန့်ချိခြင်း
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# ပတ်ဝန်းကျင် အခြေအနေ
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 အကူအညီနှင့် စာတမ်းအကြောင်း

### အကူအညီ ရယူခြင်း
```bash
# အထွေထွေ အကူအညီ
azd --help
azd help

# အမိန့်အလိုက် အကူအညီ
azd up --help
azd env --help
azd config --help

# ဗားရှင်းနှင့် တည်ဆောက်မှု အချက်အလတ်များကို ပြပါ
azd version
azd version --output json
```

### စာတမ်း လင့်ခ်များ
```bash
# ဘရောက်ဇာ၌ လက်စွဲစာတမ်းကို ဖွင့်ပါ
azd docs

# ပုံစံ လက်စွဲစာတမ်းကို ပြပါ
azd template show <template-name> --docs
```

---

**အကြံပြုချက်**: ဤ ကမ်းမန်ကို bookmark ထားပြီး `Ctrl+F` ကို အသုံးပြု၍ မလိုအပ်သော အမိန့်များကို မျက်နှာမချင်း သိရှိရှာဖွေနိုင်ပါသည်။

---

**Navigation**
- **Previous Lesson**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Next Lesson**: [ဝေါဟာရ (Glossary)](glossary.md)

---

> **💡 ကိုယ့် editor ထဲမှာ Azure command အကူအညီလိုချင်ပါသလား?** Install [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) with `npx skills add microsoft/github-copilot-for-azure` — AI, Foundry, တင်သွင်းခြင်း, diagnostics နှင့် အခြား အရာများအတွက် 37 ခု의 skills ပါဝင်သည်။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->