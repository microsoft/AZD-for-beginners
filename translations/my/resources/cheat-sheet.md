# Command Cheat Sheet - အရေးပါတဲ့ AZD အမိန့်များ

**အခန်းအားလုံးအတွက် အမြန် ညွှန်ချက်**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Quick Start**: [အခန်း ၁: အခြေခံနှင့် အမြန် စတင်ခြင်း](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [အခန်း ၂: AI-ဦးစားပေး ဖွံ့ဖြိုးရေး](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [အခန်း ၄: အဆောက်အုံကို ကုဒ်ဖြင့် ထိန်းချုပ်ခြင်း (Infrastructure as Code)](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## နိဒါန်း

ဤ အပြည့်အစုံ cheat sheet သည် အများအားဖြင့် အသုံးများသော Azure Developer CLI အမိန့်များကို အမျိုးအစားလိုက် နှင့် ဥပမာများဖြင့် စုစည်းထား၍ လျင်မြန်စွာ ရှာဖွေရန် အဆင်ပြေစေသည်။ azd ပရောဂျက်များနှင့် တွဲဖက်၍ ဖွံ့ဖြိုးရေး၊ ပြဿနာရှာဖွေရေးနှင့် နေ့စဉ် အလုပ်များအတွက် အထူးသင့်တော်သည်။

## သင်ယူရမည့် ရည်ရွယ်ချက်များ

ဤ cheat sheet ကို အသုံးပြုခြင်းအားဖြင့် သင့်အား:
- အရေးပါတဲ့ Azure Developer CLI အမိန့်များနှင့် စာလုံးပေါင်း သတ်မှတ်ချက်များကို ချက်ချင်း ရယူနိုင်မည်
- အမိန့်များကို လုပ်ငန်းဆိုင်ရာ အမျိုးအစားများနှင့် အသုံးပြုမှု ကဏ္ဍများအလိုက် နားလည်နိုင်မည်
- ပုံမှန် ဖွံ့ဖြိုးရေးနှင့် ဖြန့်ချိမှု ကိစ္စများအတွက် အကောင်အထည်ဖော် ဥပမာများကို ကိုးကားနိုင်မည်
- ပြဿနာများကို လျင်မြန် ဖြေရှင်းနိုင်ရန် သက်ဆိုင်ရာ သင်္ချာနည်းများနှင့် ညွှန်ကြားချက်များကို ရရှိနိုင်မည်
- တိုးတက်စေရန် ပြင်ဆင်မှုများနှင့် ပုံစံချနည်းများကို ထိရောက်စွာ အသုံးပြုနိုင်မည်
- ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှုနှင့် မျိုးစုံ ပတ်ဝန်းကျင် လုပ်ငန်းစဉ်များကို ထိန်းသိမ်းနိုင်မည်

## သင်ယူပြီးရရှိမည့် ရလဒ်များ

ဤ cheat sheet ကို ပုံမှန် ကိုးကားလေ့လာခြင်းဖြင့် သင်သည်:
- အပြည့်အစုံစာရွက်ကို ကိုးကားရန် မလိုဘဲ azd အမိန့်များကို ယုံကြည်စွာ ထမ်းဆောင်နိုင်မည်
- သက်ဆိုင်ရာ ကိရိယာများဖြင့် ပုံမှန် ပြဿနာများကို မြန်ဆန်စွာ ဖြေရှင်းနိုင်မည်
- မျိုးစုံ ပတ်ဝန်းကျင်များနှင့် ဖြန့်ချိမှု အခြေအနေများကို ထိရောက်စွာ စီမံနိုင်မည်
- လိုအပ်သလို azd ၏ အဆင့်မြင့် အင်္ဂါရပ်များနှင့် ပြင်ဆင်မှု ရွေးချယ်မှုများကို အသုံးချနိုင်မည်
- ဖြန့်ချိမှု ပြဿနာများကို စနစ်တကျ အဆင့်လိုက် စစ်ဆေးကာ ပြဿနာရှာဖွေ ပြင်ဆင်နိုင်မည်
- azd ရဲ့ များစွာသော shortcuts နှင့် option များကို အသုံးချကာ အလုပ်စဉ်များကို အာ့တိုမိတ်စွာ ထိရောက်အောင် လုပ်ဆောင်နိုင်မည်

## စတင်အသုံးပြုရန် အမိန့်များ

### အတည်ပြုခြင်း
```bash
# AZD ဖြင့် Azure သို့ ဝင်ပါ
azd auth login

# Azure CLI သို့ ဝင်ပါ (AZD သည် အတွင်းပိုင်းတွင် ဤကို အသုံးပြုသည်)
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
# ရရှိနိုင်သည့် နမူနာများကို ကြည့်ရှုပါ
azd template list

# နမူနာမှ စတင်ပါ
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# လက်ရှိ ဖိုလ်ဒါတွင် စတင်ပါ
azd init .

# စိတ်ကြိုက် အမည်ဖြင့် စတင်ပါ
azd init --template todo-nodejs-mongo my-awesome-app
```

## အဓိက ဖြန့်ချိရေး အမိန့်များ

### ပြည့်စုံသော ဖြန့်ချိရေး လုပ်ငန်းစဉ်
```bash
# အရာအားလုံးကို တင်သွင်းပါ (အရင်းအမြစ်များ စီစဉ်ခြင်း + တပ်ဆင်ခြင်း)
azd up

# အတည်ပြုမေးခွန်းများကို ပိတ်ထားပြီး တင်သွင်းပါ
azd up --confirm-with-no-prompt

# သတ်မှတ်ထားသော ပတ်ဝန်းကျင်သို့ တင်သွင်းပါ
azd up --environment production

# စိတ်ကြိုက် ပါရာမီတာများဖြင့် တင်သွင်းပါ
azd up --parameter location=westus2
```

### အင်ဖရာစထာခ် (Infrastructure) သာ
```bash
# Azure အရင်းအမြစ်များကို စီမံပေးခြင်း
azd provision

# 🧪 အောက်ခံအဆောက်အਅုံ (infrastructure) ပြောင်းလဲမှုများကို ကြိုတင်ကြည့်ရှုခြင်း
azd provision --preview
# မည်သည့်အရင်းအမြစ်များကို ဖန်တီး/ပြင်ဆင်/ဖျက်မည်ကို အကြမ်းဖျင်း ကြိုတမ်းမြင်ကွင်းအဖြစ် ပြသသည်
# 'terraform plan' သို့မဟုတ် 'bicep what-if' တို့နှင့် ဆင်တူသည် — လုံခြုံစိတ်ချစွာ လည်ပတ်နိုင်ပြီး ပြောင်းလဲချက်များကို မအကောင်အထည်ဖော်ပါ။
```

### အက်ပလီကေးရှင်း သာ
```bash
# အက်ပလီကေးရှင်းကုဒ်ကို ဖြန့်ချိပါ
azd deploy

# တိကျသော ဝန်ဆောင်မှုကို ဖြန့်ချိပါ
azd deploy --service web
azd deploy --service api

# ဝန်ဆောင်မှုအားလုံးကို ဖြန့်ချိပါ
azd deploy --all
```

### Build နှင့် Package
```bash
# လျှောက်လွှာများ တည်ဆောက်ခြင်း
azd package

# တိကျသော ဝန်ဆောင်မှု တည်ဆောက်ခြင်း
azd package --service api
```

## 🌍 ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှု

### ပတ်ဝန်းကျင် လည်ပတ်မှုများ
```bash
# ပတ်ဝန်းကျင်အားလုံးကို စာရင်းပြပါ
azd env list

# ပတ်ဝန်းကျင်အသစ်ကို ဖန်တီးပါ
azd env new development
azd env new staging --location westus2

# ပတ်ဝန်းကျင်ကို ရွေးချယ်ပါ
azd env select production

# အသုံးပြုနိုင်သော ပတ်ဝန်းကျင်များကို ပြပါ
azd env list

# ပတ်ဝန်းကျင်၏ အခြေအနေကို ပြန်လည်မွမ်းမံပါ
azd env refresh
```

### ပတ်ဝန်းကျင် အတန်ဖိုးများ (Environment Variables)
```bash
# ပတ်ဝန်းကျင်အပြောင်းအလဲကို သတ်မှတ်ပါ
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# ပတ်ဝန်းကျင်အပြောင်းအလဲကို ရယူပါ
azd env get API_KEY

# ပတ်ဝန်းကျင်အပြောင်းအလဲအားလုံးကို စာရင်းပြပါ
azd env get-values

# ပတ်ဝန်းကျင်အပြောင်းအလဲကို ဖယ်ရှားပါ
azd env unset DEBUG
```

## ⚙️ ပြင်ဆင်ချက် အမိန့်များ

### ကမ္ဘာလုံးဆိုင်ရာ ပြင်ဆင်ချက်များ
```bash
# ဆက်တင်များအားလုံးကို ဖော်ပြပါ
azd config show

# ကမ္ဘာလုံးဆိုင်ရာ ပုံသေတန်ဖိုးများကို သတ်မှတ်ပါ
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# ဆက်တင်ကို ဖယ်ရှားပါ
azd config unset defaults.location

# ဆက်တင်များအားလုံးကို မူလအခြေအနေသို့ ပြန်လည်သတ်မှတ်ပါ
azd config reset
```

### ပရောဂျက် ပြင်ဆင်ချက်များ
```bash
# azure.yaml ကို အတည်ပြုပါ
azd config validate

# ပရိုဂျက် အချက်အလက် ဖော်ပြပါ
azd show

# ဝန်ဆောင်မှု endpoint များ ရယူပါ
azd show --output json
```

## 📊 ကြီးကြပ်ခြင်းနှင့် ရှာဖွေရေး (Diagnostics)

### ကြီးကြပ်ရေး ဒက်ရှ်ဘုတ်
```bash
# Azure portal ၏ Monitoring dashboard ကို ဖွင့်ပါ
azd monitor

# Application Insights ၏ Live Metrics ကို ဖွင့်ပါ
azd monitor --live

# Application Insights ၏ Logs blade ကို ဖွင့်ပါ
azd monitor --logs

# Application Insights ၏ Overview ကို ဖွင့်ပါ
azd monitor --overview
```

### ကွန်တိန်နာ မှတ်တမ်းများ ကြည့်ရှုခြင်း
```bash
# Azure CLI ဖြင့် (Container Apps အတွက်) မှတ်တမ်းများ ကြည့်ရန်
az containerapp logs show --name <app-name> --resource-group <rg-name>

# မှတ်တမ်းများကို တိုက်ရိုက် (real-time) လိုက်နာကြည့်ရန်
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal မှ မှတ်တမ်းများ ကြည့်ရန်
azd monitor --logs
```

### Log Analytics မေးခွန်းများ
```bash
# Azure Portal မှတဆင့် Log Analytics သို့ ဝင်ရောက်ခြင်း
azd monitor --logs

# Azure CLI ဖြင့် လော့ဂ်များကို မေးမြန်းခြင်း
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ ထိန်းသိမ်းမှု အမိန့်များ

### သန့်ရှင်းရေး
```bash
# Azure အရင်းအမြစ်အားလုံးကို ဖျက်ပါ
azd down

# အတည်ပြုချက်မရှိဘဲ တိုက်ရိုက် ဖျက်ပစ်ပါ
azd down --force

# soft-delete အခြေအနေရှိသော အရင်းအမြစ်များကို အမြဲတမ်း ဖျက်ပစ်ပါ
azd down --purge

# သန့်ရှင်းရေးကို အပြည့်အစုံ ပြုလုပ်ပါ
azd down --force --purge
```

### အပ်ဒိတ်များ
```bash
# azd အပ်ဒိတ်များကို စစ်ဆေးပါ
azd version

# လက်ရှိဗားရှင်းကို ရယူပါ
azd version

# လက်ရှိဆက်တင်များကို ကြည့်ပါ
azd config show
```

## 🔧 အဆင့်မြင့် အမိန့်များ

### Pipeline နှင့် CI/CD
```bash
# GitHub Actions ကို ဖွဲ့စည်းပါ
azd pipeline config

# Azure DevOps ကို ဖွဲ့စည်းပါ
azd pipeline config --provider azdo

# pipeline ဖွဲ့စည်းမှုကို ပြပါ
azd pipeline show
```

### အင်ဖရာစထာခ် စီမံခန့်ခွဲမှု
```bash
# အခြေခံအဆောက်အအုံပုံစံများ ဖန်တီးပါ
azd infra generate

# 🧪 အင်ဖရာစထရပ်ချာ ကြိုတင်ကြည့်ရှုခြင်းနှင့် စီမံရေးဆွဲခြင်း
azd provision --preview
# တပ်ဆင်ခြင်းမရှိဘဲ အင်ဖရာစထရပ်ချာ ထည့်သွင်းမှုကို အတုလို စမ်းသပ်သည်
# Bicep/Terraform တမ်းပလိတ်များကို စိစစ်ပြီး ဖော်ပြသည်:
# - ထည့်သွင်းမည့် အရင်းအမြစ်များ (အစိမ်း +)
# - ပြင်ဆင်ရန် အရင်းအမြစ်များ (အဝါ ~)
# - ဖျက်ရန် အရင်းအမြစ်များ (နီ -)
# လုံခြုံစိတ်ချစွာ လည်ပတ်နိုင်သည် - Azure ပတ်ဝန်းကျင်တွင် အမှန်တကယ် ပြောင်းလဲမှု မပြုလုပ်ပါ

# azure.yaml မှ အင်ဖရာစထရပ်ချာကို ပေါင်းစည်းဖန်တီးသည်
azd infra synth
```

### ပရောဂျက် အချက်အလက်များ
```bash
# ပရောဂျက်၏ အခြေအနေ နှင့် endpoint များကို ပြပါ
azd show

# အသေးစိတ် ပရောဂျက် အချက်အလက်ကို JSON အဖြစ် ပြပါ
azd show --output json

# ဝန်ဆောင်မှု endpoint များကို ရယူပါ
azd show --output json | jq '.services'
```

## 🤖 AI နှင့် တိုးချဲ့မှု အမိန့်များ

### AZD တိုးချဲ့မှုများ
```bash
# အသုံးပြုနိုင်သည့် extension များအားလုံးကို (AI အပါအဝင်) စာရင်းပြပါ
azd extension list

# Foundry agents extension ကို တပ်ဆင်ပါ
azd extension install azure.ai.agents

# fine-tuning extension ကို တပ်ဆင်ပါ
azd extension install azure.ai.finetune

# custom models extension ကို တပ်ဆင်ပါ
azd extension install azure.ai.models

# တပ်ဆင်ပြီးသား extension များအားလုံးကို မြှင့်တင်ပါ
azd extension upgrade --all
```

### AI Agent အမိန့်များ
```bash
# manifest မှ agent ပရောဂျက်ကို စတင်ဖန်တီးပါ
azd ai agent init -m <manifest-path-or-uri>

# တိကျသော Foundry ပရောဂျက်ကို ရည်ရွယ်ပါ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# agent အရင်းအမြစ် ဖိုလ်ဒါကို သတ်မှတ်ပါ
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ဟော့စတင်ရန် တည်နေရာကို ရွေးချယ်ပါ
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (Alpha)
```bash
# သင့်ပရောဂျက်အတွက် MCP ဆာဗာကို စတင်ပါ
azd mcp start

# MCP လည်ပတ်မှုများအတွက် ကိရိယာခွင့်ပြုချက်ကို စီမံပါ
azd copilot consent list
```

### အင်ဖရာစထာခ် ဖန်တီးခြင်း
```bash
# သင်၏ ပရောဂျက် သတ်မှတ်ချက်မှ IaC ဖိုင်များ ဖန်တီးပါ
azd infra generate

# azure.yaml မှ အခြေခံ၍ အင်ဖရာစထက်ချာကို စုစည်းဖန်တီးပါ
azd infra synth
```

---

## 🎯 အမြန် လုပ်ငန်းစဉ်များ

### ဖွံ့ဖြိုးရေး လုပ်ငန်းစဉ်
```bash
# ပရောဂျက်အသစ် စတင်ရန်
azd init --template todo-nodejs-mongo
cd my-project

# ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်သို့ တပ်ဆင်ရန်
azd env new dev
azd up

# ပြင်ဆင်များ ပြုလုပ်ပြီး ပြန်တပ်ဆင်ရန်
azd deploy

# စောင့်ကြည့်မှု ဒက်ရှ်ဘုတ်ကို ဖွင့်ရန်
azd monitor --live
```

### မျိုးစုံ ပတ်ဝန်းကျင် လုပ်ငန်းစဉ်
```bash
# ပတ်ဝန်းကျင်များကို တပ်ဆင်ခြင်း
azd env new dev
azd env new staging  
azd env new production

# ဖွံ့ဖြိုးရေး (dev) သို့ ဖြန့်ချိခြင်း
azd env select dev
azd up

# စမ်းသပ်ပြီး စတေဂျင်း (staging) သို့ မြှင့်တင်ခြင်း
azd env select staging
azd up

# ထုတ်လုပ်ရေး (production) သို့ ဖြန့်ချိခြင်း
azd env select production
azd up
```

### ပြဿနာရှာဖွေရေး လုပ်ငန်းစဉ်
```bash
# debug mode ကို ဖွင့်ပါ
export AZD_DEBUG=true

# deployment အခြေအနေကို စစ်ဆေးပါ
azd show

# configuration ကို အတည်ပြုပါ
azd config show

# မှတ်တမ်းများကို ကြည့်ရန် စောင့်ကြည့်ရေး ဒက်ရှ်ဘုတ်ကို ဖွင့်ပါ
azd monitor --logs

# အရင်းအမြစ်အခြေအနေကို စစ်ဆေးပါ
azd show --output json
```

## 🔍 အမှားရှာဖွေရေး အမိန့်များ

### အမှားရှာဖွေရေး အချက်အလက်
```bash
# ဒီဘပ် အထွက်ကို ဖွင့်ပါ
export AZD_DEBUG=true
azd <command> --debug

# ပိုသန့်ရှင်းတဲ့ အထွက်အတွက် တယ်လီမက်ထရီကို ပိတ်ပါ
export AZD_DISABLE_TELEMETRY=true

# လက်ရှိ ဖွဲ့စည်းတပ်ဆင်မှုကို စစ်ဆေးပါ
azd config show

# အတည်ပြုခြင်း အခြေအနေကို စစ်ဆေးပါ
az account show
```

### ပုံစံ အမှားရှာဖွေခြင်း
```bash
# အသုံးပြုနိုင်သော နမူနာများကို အသေးစိတ်အချက်အလက်များဖြင့် စာရင်းပြပါ
azd template list --output json

# နမူနာ၏ အချက်အလက်များကို ပြပါ
azd template show <template-name>

# init ဆောင်ရွက်မီ နမူနာကို စစ်ဆေးပါ
azd template validate <template-name>
```

## 📁 ဖိုင်နှင့် ဖိုလ်ဒါ အမိန့်များ

### ပရောဂျက် ဖွဲ့စည်းမှု
```bash
# လက်ရှိ ဖိုလ်ဒါ ဖွဲ့စည်းပုံကို ပြပါ
tree /f  # Windows
find . -type f  # Linux/macOS

# azd ပရောဂျက်၏ မူလ ဖိုလ်ဒါသို့ သွားပါ
cd $(azd root)

# azd ဆက်တင် (configuration) ဒါရက်ထရီကို ပြပါ
echo $AZD_CONFIG_DIR  # ပုံမှန်အားဖြင့် ~/.azd
```

## 🎨 ထွက်ရလဒ် ဖော်မက်

### JSON ထွက်ရလဒ်
```bash
# script များအတွက် JSON အထွက်ကို ရယူပါ
azd show --output json
azd env list --output json
azd config show --output json

# jq ဖြင့် ခွဲခြမ်းပါ
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ဇယား ထွက်ရလဒ်
```bash
# ဇယားပုံစံဖြင့် ဖော်ပြပါ
azd env list --output table

# တပ်ဆင်ထားသော ဝန်ဆောင်မှုများကို ကြည့်ရှုပါ
azd show --output json | jq '.services | keys'
```

## 🔧 ပုံမှန် အမိန့် တွဲဖက်များ

### ကျန်းမာရေး စစ်ဆေးရေး စကရစ်ပ်
```bash
#!/bin/bash
# လျင်မြန်သော ကျန်းမာရေး စစ်ဆေးမှု
azd show
azd env get-values
azd monitor --logs
```

### ဖြန့်ချိမှု အတည်ပြုခြင်း
```bash
#!/bin/bash
# တပ်ဆင်မပြုမီ စစ်ဆေးခြင်း
azd show
azd provision --preview  # တပ်ဆင်မပြုမီ ပြောင်းလဲချက်များကို ကြိုကြည့်ရန်
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

### အရင်းအမြစ် သန့်ရှင်းရေး စကရစ်ပ်
```bash
#!/bin/bash
# အဟောင်းပတ်ဝန်းကျင်များကို ရှင်းလင်းပါ
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 ပတ်ဝန်းကျင် တန်ဖိုးများ

### ပုံမှန် ပတ်ဝန်းကျင် တန်ဖိုးများ
```bash
# Azure ဆက်တင်
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD ဆက်တင်
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# လျှောက်လွှာ ဆက်တင်
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 အရေးပေါ် အမိန့်များ

### အမြန် ပြုပြင်ချက်များ
```bash
# အတည်ပြုရေးကို ပြန်လည်သတ်မှတ်ပါ
az account clear
az login

# ပတ်ဝန်းကျင်ကို အတင်းအကျပ် ပြန်လည်အသစ်ပြုလုပ်ပါ
azd env refresh

# ဝန်ဆောင်မှုများအားလုံးကို ပြန်လည်တပ်ဆင်ပါ
azd deploy

# တပ်ဆင်မှု အခြေအနေကို စစ်ဆေးပါ
azd show --output json
```

### ပြန်လည် ကယ်တင်ရေး အမိန့်များ
```bash
# မအောင်မြင်ခဲ့သော တပ်ဆင်မှုမှ ပြန်လည်ကယ်ဆယ်ရန် - ဖျက်ပြီး ထပ်မံ တပ်ဆင်ပါ
azd down --force --purge
azd up

# အခြေခံအဆောက်အအုံကိုသာ ပြန်လည်ပံ့ပိုးပါ
azd provision

# အက်ပလီကေးရှင်းကိုသာ ထပ်မံ တပ်ဆင်ပါ
azd deploy
```

## 💡 အသုံးဝင် အကြံပြုချက်များ

### အလုပ်မြန်အောင် အတိုကောက်များ (Aliases)
```bash
# သင့် .bashrc သို့မဟုတ် .zshrc ထဲတွင် ထည့်ပါ
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### လုပ်ဆောင်ချက် အတိုကောက်များ
```bash
# ပတ်ဝန်းကျင်များကို လျင်မြန်စွာ ပြောင်းနိုင်ခြင်း
azd-env() {
    azd env select $1 && azd show
}

# စောင့်ကြည့်မှုပါရှိသည့် လျင်မြန်သော တပ်ဆင်ခြင်း
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

## 📖 ကူညီမှုနှင့် စာရွက်စာတမ်းများ

### ကူညီမှု ရယူနည်း
```bash
# အထွေထွေ အကူအညီ
azd --help
azd help

# အမိန့်အလိုက် အထူး အကူအညီ
azd up --help
azd env --help
azd config --help

# ဗားရှင်းနှင့် တည်ဆောက်ရေး အချက်အလက် ပြပါ
azd version
azd version --output json
```

### စာတမ်းလင့်ခ်များ
```bash
# ဘရောက်ဇာတွင် စာရွက်စာတမ်းကို ဖွင့်ပါ
azd docs

# ပုံစံစာရွက်စာတမ်းကို ပြပါ
azd template show <template-name> --docs
```

---

**အကြံပြုချက်**: ဤ cheat sheet ကို စာမျက်နှာသတ်မှတ် ထားပြီး `Ctrl+F` ဖြင့် လိုအပ်သော အမိန့်များကို လျင်မြန်စွာ ရှာဖွေပါ။

---

**သွားလာမှု**
- **ယခင် သင်ခန်းစာ**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **နောက်တစ်ခန်း**: [အဘိဓာန် (Glossary)](glossary.md)

---

> **💡 သင့် အယ်ဒီတာတွင် Azure အမိန့် အကူအညီ လိုပါသလား?** [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) ကို `npx skills add microsoft/github-copilot-for-azure` ဖြင့် တပ်ဆင်ပါ — AI, Foundry, deployment, diagnostics, နှင့် အခြားများအတွက် 37 ကျွမ်းကျင်မှုများ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးပမ်းသော်လည်း အလိုအလျောက်ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါရှိနိုင်သည်ကို ကျေးဇူးပြုပြီး သိရှိပါ။ မူလဘာသာဖြင့် ရေးသားထားသော မူရင်းစာတမ်းကို သက်မှတ်ထားသည့် မှတ်တမ်းတစ်ရပ်အဖြစ် ယူဆရန် အကြံပြုပါသည်။ အရေးပါတဲ့ အချက်အလက်များအတွက် သေချာမှုလိုလျှင် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်ကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုမှုကြောင့် ဖြစ်ပေါ်လာနိုင်သည့် နားမလည်မှုများ သို့မဟုတ် မွတ်မမှန် ဖော်ပြချက်များအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->