# Command Cheat Sheet - အရေးပါတဲ့ AZD အမိန့်များ

**အခန်းအားလုံးအတွက် လျင်မြန်လမ်းညွှန်**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../README.md)
- **📖 အလျင်စတင်ခြင်း**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI အမိန့်များ**: [Chapter 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 အဆင့်မြင့်**: [Chapter 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## နိဒါန်း

ဒီ စုစုပေါင်း cheat sheet သည် အများဆုံး အသုံးပြုလေ့ရှိသော Azure Developer CLI အမိန့်များအတွက် အလျင်မြန် ရည်ညွှန်းရန် အမျိုးအစားများအလိုက် စနစ်တကျ စီစဉ်ထားပြီး လက်တွေ့ ဥပမာများပါရှိသည်။ azd ပရောဂျက်များဖြင့် ဖွံ့ဖြိုးမှု၊ ပြဿနာရှာဖွေခြင်းနှင့် နေ့စဉ် လုပ်ငန်းများတွင် အမြန်ရယူရန်အတွက် မျိုင်းစားသင့်သည်။

## သင်ယူမှု ရည်မှန်းချက်များ

ဒီ cheat sheet ကို အသုံးပြုခြင်းဖြင့် သင်သည် -
- အရေးပါတဲ့ Azure Developer CLI အမိန့်များနှင့် စာရင်းများကို ချက်ချင်းရယူနိုင်မည်
- အမိန့်များကို လုပ်ဆောင်မှုအလိုက် ကဏ္ဍများနှင့် အသုံးအနှုန်းများအရ စနစ်တကျ နားလည်နိုင်မည်
- ပုံမှန် ဖွံ့ဖြိုးရေးနှင့် တင်သွင်းမှု အခြေအနေများအတွက် လက်တွေ့ ဥပမာများကို ကိုးကားနိုင်မည်
- ပြဿနာများကို အလျင်မြန် ဖြေရှင်းရန် သက်ဆိုင်ရာ troubleshooting အမိန့်များကို ရယူနိုင်မည်
- အဆင့်မြင့် ဖော်ပြချက်နှင့် စိတ်တိုင်းကျ ချိန်ညှိမှု ရွေးချယ်စရာများကို ထိရောက်စွာ ရှာဖွေနိုင်မည်
- ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှုနှင့် မျိုးစုံ ပတ်ဝန်းကျင် လုပ်ငန်းစဉ် အမိန့်များကို ရှာဖွေနိုင်မည်

## သင်ယူပြီးရရှိမည့် ရလဒ်များ

ဒီ cheat sheet ကို သုံးစွဲနေရင်း သင်သည် -
- စာအလုပ်ကြီးကို မကြည့်ဘဲ azd အမိန့်များကို ယုံကြည်စိတ်ချ လက်လွှတ်နိုင်မည်
- သက်ဆိုင်ရာ diagnostic အမိန့်များ ဖြင့် ပုံမှန်ပြဿနာများကို အလျင်မြန် ဖြေရှင်းနိုင်မည်
- ပတ်ဝန်းကျင် အမျိုးမျိုးနှင့် တင်သွင်းမှု အခြေအနေများကို ထိရောက်စွာ စီမံနိုင်မည်
- လိုအပ်သလို azd ၏ အဆင့်မြင့် အင်္ဂါရပ်များနှင့် ဖော်ပြချက် ရွေးချယ်မှုများကို အသုံးပြုနိုင်မည်
- စနစ်တကျ အမိန့် အစဉ်လိုက်များအား အသုံးပြု၍ တင်သွင်းမှု ပြဿနာများကို ရှာဖွေ ဖြေရှင်းနိုင်မည်
- azd shortcuts နှင့် ရွေးချယ်စရာများကို ထိရောက်စွာ အသုံးပြု၍ လုပ်ငန်းစဉ်များကို တိုးတက်အောင် ပြုလုပ်နိုင်မည်

## စတင်အသုံးပြုရန် အမိန့်များ

### အတည်ပြုခြင်း
```bash
# AZD မှတဆင့် Azure သို့ လော့ဂ်အင်
azd auth login

# Azure CLI သို့ လော့ဂ်အင် (AZD သည် အောက်ခံတွင် ဒါကို အသုံးပြုသည်)
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

### ပရောဂျက် စတင် ဖွဲ့စည်းခြင်း
```bash
# ရရှိနိုင်သည့် နမူနာများကို ကြည့်ရှုရန်
azd template list

# နမူနာမှ အစပြုရန်
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# လက်ရှိ ဖိုလ်ဒါတွင် အစပြုရန်
azd init .

# စိတ်ကြိုက် အမည်ဖြင့် အစပြုရန်
azd init --template todo-nodejs-mongo my-awesome-app
```

## အဓိက တင်သွင်းမှု အမိန့်များ

### အပြည့်အစုံ တင်သွင်းမှု လုပ်ငန်းစဉ်
```bash
# အားလုံးကို ပြင်ဆင်ကာ ဖြန့်ချိပါ (အရင်းအမြစ် စီစဉ်ခြင်း + ဖြန့်ချိခြင်း)
azd up

# အတည်ပြုမေးခွန်းများကို ပိတ်ထား၍ ဖြန့်ချိပါ
azd up --confirm-with-no-prompt

# တိကျသော ပတ်ဝန်းကျင်သို့ ဖြန့်ချိပါ
azd up --environment production

# စိတ်ကြိုက် ပါရာမီတာများဖြင့် ဖြန့်ချိပါ
azd up --parameter location=westus2
```

### Infrastructure Only
```bash
# Azure အရင်းအမြစ်များကို ဖန်တီး၍ ပံ့ပိုးခြင်း
azd provision

# 🧪 နည်းပညာ အခြေခံ အဆောက်အအုံ ပြောင်းလဲမှုများကို ကြိုကြည့်ရှုခြင်း
azd provision --preview
# ဘယ်အရင်းအမြစ်တွေကို ဖန်တီးမည်/ပြင်ဆင်မည်/ဖျက်မည် ဆိုတာကို ကြိုစမ်းသပ်နည်းဖြင့် ပြသပေးသည်
# Similar to 'terraform plan' or 'bicep what-if' - လည်ပတ်ရန် ဘေးကင်းပြီး မည်သည့်ပြောင်းလဲမှုမျှ မရှိပါ
```

### Application Only
```bash
# အက်ပလီကေးရှင်းကုဒ်ကို တပ်ဆင်ပါ
azd deploy

# သီးသန့် ဝန်ဆောင်မှုကို တပ်ဆင်ပါ
azd deploy --service web
azd deploy --service api

# ဝန်ဆောင်မှုများအားလုံးကို တပ်ဆင်ပါ
azd deploy --all
```

### တည်ဆောက်နှင့် ထုပ်ပိုးခြင်း
```bash
# အက်ပလီကေးရှင်းများ တည်ဆောက်ခြင်း
azd package

# သတ်မှတ်ထားသော ဝန်ဆောင်မှု တည်ဆောက်ခြင်း
azd package --service api
```

## 🌍 ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှု

### ပတ်ဝန်းကျင် လုပ်ဆောင်ချက်များ
```bash
# ပတ်ဝန်းကျင်များအားလုံးကို စာရင်းပြပါ
azd env list

# ပတ်ဝန်းကျင်အသစ်တစ်ခု ဖန်တီးပါ
azd env new development
azd env new staging --location westus2

# ပတ်ဝန်းကျင်ကို ရွေးချယ်ပါ
azd env select production

# လက်ရှိပတ်ဝန်းကျင်ကို ပြပါ
azd env show

# ပတ်ဝန်းကျင်၏ အခြေအနေကို ပြန်လည်အသစ်ပြုလုပ်ပါ
azd env refresh
```

### ပတ်ဝန်းကျင် သတ်မှတ်ချက်များ (Environment Variables)
```bash
# ပတ်ဝန်းကျင် တန်ဖိုး သတ်မှတ်ပါ
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# ပတ်ဝန်းကျင် တန်ဖိုး ရယူပါ
azd env get API_KEY

# ပတ်ဝန်းကျင်များအားလုံး စာရင်းပြပါ
azd env get-values

# ပတ်ဝန်းကျင် တန်ဖိုး ဖယ်ရှားပါ
azd env unset DEBUG
```

## ⚙️ ဖော်ပြချက် (Configuration) အမိန့်များ

### ကမ္ဘာလုံးဆိုင်ရာ ဖော်ပြချက်များ
```bash
# ဆက်တင်များအားလုံးကို စာရင်းပြပါ
azd config list

# ကမ္ဘာလုံးဆိုင်ရာ ပုံမှန်တန်ဖိုးများကို သတ်မှတ်ပါ
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# ဆက်တင်ကို ဖယ်ရှားပါ
azd config unset defaults.location

# ဆက်တင်များအားလုံးကို ပြန်လည် သတ်မှတ်ပါ
azd config reset
```

### ပရောဂျက် ဖော်ပြချက်များ
```bash
# azure.yaml ကို စစ်ဆေးပါ
azd config validate

# ပရောဂျက် အချက်အလက်များကို ပြပါ
azd show

# ဝန်ဆောင်မှု endpoint များကို ရယူပါ
azd show --output json
```

## 📊 စောင့်ကြည့်နှင့် ရှာဖွေစစ်ဆေးရေး

### စောင့်ကြည့် မျက်နှာပြင် (Dashboard)
```bash
# Azure Portal ၏ စောင့်ကြည့်မှု ဒက်ရှ်ဘုတ်ကို ဖွင့်ပါ
azd monitor

# Application Insights ၏ တိုက်ရိုက် မက်ထရစ်များကို ဖွင့်ပါ
azd monitor --live

# Application Insights ၏ မှတ်တမ်း ဘလိတ်ကို ဖွင့်ပါ
azd monitor --logs

# Application Insights ၏ အနှစ်ချုပ်ကို ဖွင့်ပါ
azd monitor --overview
```

### ကွန်တိနာ မှတ်တမ်းများ ကြည့်ရှုခြင်း
```bash
# Azure CLI ဖြင့် Container Apps အတွက် လော့ဂ်များ ကြည့်ရှုရန်
az containerapp logs show --name <app-name> --resource-group <rg-name>

# လော့ဂ်များကို အချိန်နောက်ကျမှုမရှိဘဲ တိုက်ရိုက် လိုက်နေရန်
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal မှ လော့ဂ်များကို ကြည့်ရှုရန်
azd monitor --logs
```

### မှတ်တမ်း စုံစမ်းရေး မေးခွန်းများ (Log Analytics Queries)
```bash
# Azure Portal မှတဆင့် Log Analytics သို့ ဝင်ရောက်ပါ
azd monitor --logs

# Azure CLI ကို အသုံးပြု၍ လော့ဂ်များကို မေးမြန်းပါ
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ ပြုပြင်ထိန်းသိမ်းရေး အမိန့်များ

### ရှင်းလင်းရေး
```bash
# Azure အရင်းအမြစ်များအားလုံး ဖယ်ရှားပါ
azd down

# အတည်ပြုချက်မရှိဘဲ အတင်း ဖျက်ပစ်ပါ
azd down --force

# နူးညံ့စွာ ဖျက်ထားသော အရင်းအမြစ်များကို အမြဲတမ်း ဖယ်ရှားပါ
azd down --purge

# လုံးဝ သန့်ရှင်းခြင်း
azd down --force --purge
```

### အပ်ဒိတ်များ
```bash
# azd အပ်ဒိတ်များ ရှိမရှိ စစ်ဆေးပါ
azd version

# လက်ရှိ ဗားရှင်းကို ရယူပါ
azd version

# လက်ရှိ ဆက်တင်များကို ကြည့်ပါ
azd config list
```

## 🔧 အဆင့်မြင့် အမိန့်များ

### Pipeline နှင့် CI/CD
```bash
# GitHub Actions ကို ပြင်ဆင်ရန်
azd pipeline config

# Azure DevOps ကို ပြင်ဆင်ရန်
azd pipeline config --provider azdo

# pipeline ဖွဲ့စည်းမှုကို ပြသရန်
azd pipeline show
```

### အင်ဖရာစထရက် စီမံခန့်ခွဲမှု
```bash
# ဖွဲ့စည်းအဆောက်အအုံ အကြမ်းဖျဉ်းပုံစံများ ဖန်တီးသည်
azd infra generate

# 🧪 ဖွဲ့စည်းအဆောက်အအုံ ကြိုတင် ကြည့်ရှုခြင်းနှင့် စီမံရေးဆွဲခြင်း
azd provision --preview
# တပ်ဆင်ခြင်းမပြုဘဲ ဖွဲ့စည်းအဆောက်အအုံ ပေးပို့မှုကို အတုကဲ့သို့ စမ်းသပ်ပြသသည်
# Bicep/Terraform တမ်းပလိတ်များကို ခွဲခြမ်းစစ်ဆေးပြီး အောက်ပါအချက်များကို ပြသသည်:
# - ထည့်သွင်းရမည့် အရင်းအမြစ်များ (အစိမ်း +)
# - ပြင်ဆင်ရမည့် အရင်းအမြစ်များ (အဝါ ~)
# - ဖျက်ထုတ်ရမည့် အရင်းအမြစ်များ (နီ -)
# အလုပ်လုပ်ရန် လုံခြုံသည် - Azure ပတ်ဝန်းကျင်တွင် အမှန်တကယ် ပြောင်းလဲမှု မရှိပါ

# azure.yaml မှ ဖွဲ့စည်းအဆောက်အအုံ စုပေါင်းထုတ်လုပ်သည်
azd infra synth
```

### ပရောဂျက် အချက်အလက်များ
```bash
# ပရောဂျက် အခြေအနေနှင့် endpoint များကို ပြပါ
azd show

# ပရောဂျက် အသေးစိတ် အချက်အလက်ကို JSON အဖြစ် ပြပါ
azd show --output json

# ဝန်ဆောင်မှု endpoint များကို ရယူပါ
azd show --output json | jq '.services'
```

## 🎯 လျင်မြန် လုပ်ငန်းစဉ်များ

### ဖွံ့ဖြိုးရေး လုပ်ငန်းစဉ်
```bash
# ပရောဂျက်အသစ် စတင်ပါ
azd init --template todo-nodejs-mongo
cd my-project

# ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်သို့ တင်ပါ
azd env new dev
azd up

# ပြင်ဆင်ချက်များ ပြုလုပ်၍ ပြန်လည်တင်ပါ
azd deploy

# စောင့်ကြည့်ရေး ဒက်ရှ်ဘုတ်ကို ဖွင့်ပါ
azd monitor --live
```

### မျိုးစုံ ပတ်ဝန်းကျင် လုပ်ငန်းစဉ်
```bash
# ပတ်ဝန်းကျင်များကို တည်ဆောက်ရန်
azd env new dev
azd env new staging  
azd env new production

# dev သို့ ဖြန့်ချိရန်
azd env select dev
azd up

# စမ်းသပ်ပြီး staging သို့ မြှင့်တင်ရန်
azd env select staging
azd up

# production သို့ ဖြန့်ချိရန်
azd env select production
azd up
```

### ပြဿနာဖြေရှင်းခြင်း လုပ်ငန်းစဉ်
```bash
# အမှားရှာဖွေရေး မုဒ်ကို ဖွင့်ပါ
export AZD_DEBUG=true

# တပ်ဆင်မှု အခြေအနေကို စစ်ဆေးပါ
azd show

# ဖွဲ့စည်းမှုကို အတည်ပြုပါ
azd config list

# မှတ်တမ်းများအတွက် စောင့်ကြည့်ရေး ဒက်ရှ်ဘုတ်ကို ဖွင့်ပါ
azd monitor --logs

# အရင်းအမြစ် အခြေအနေကို စစ်ဆေးပါ
azd show --output json
```

## 🔍 ဒေဘာဂ် (Debugging) အမိန့်များ

### ဒေဘာဂ် အချက်အလက်များ
```bash
# အမှားရှာဖွေရေး အထွက်ကို ဖွင့်ပါ
export AZD_DEBUG=true
azd <command> --debug

# ထုတ်လွှင့်ချက်ကို ပိုမိုသန့်ရှင်းစေရန် ဒေတာစုဆောင်းမှုကို ပိတ်ပါ
export AZD_DISABLE_TELEMETRY=true

# လက်ရှိ ဆက်တင်ကို စစ်ဆေးပါ
azd config list

# အတည်ပြုခြင်း အခြေအနေကို စစ်ဆေးပါ
az account show
```

### ပုံစံ (Template) ဒေဘာဂ်
```bash
# အသေးစိတ်အချက်အလက်များပါရှိသည့် အသုံးပြုနိုင်သော ပုံစံများကို စာရင်းပြပါ
azd template list --output json

# ပုံစံ၏ အချက်အလက်များကို ပြပါ
azd template show <template-name>

# init မလုပ်မီ ပုံစံကို စစ်ဆေးပြီး အတည်ပြုပါ
azd template validate <template-name>
```

## 📁 ဖိုင်နှင့် ဖိုဒါ အမိန့်များ

### ပရောဂျက် ဖွဲ့စည်းမှု
```bash
# လက်ရှိ ဖိုလ်ဒါ ဖွဲ့စည်းပုံကို ပြပါ
tree /f  # ဝင်းဒိုး
find . -type f  # လီနပ်စ် နှင့် မက်အိုအက်စ်

# azd ပရောဂျက်၏ မူလ ဖိုလ်ဒါသို့ သွားပါ
cd $(azd root)

# azd ဆက်တင် ဖိုလ်ဒါကို ပြပါ
echo $AZD_CONFIG_DIR  # ပုံမှန်အားဖြင့် ~/.azd
```

## 🎨 ထွက်ရှိမှု ဖော်မတ်တင်း

### JSON ထုတ်လွှင့်ချက်
```bash
# စကရစ်ရေးသားမှုများအတွက် JSON ထွက်ကို ရယူပါ
azd show --output json
azd env list --output json
azd config list --output json

# jq ဖြင့် ဖတ်ခွဲပါ
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ဇယား (Table) ထုတ်လွှင့်ချက်
```bash
# ဇယားအဖြစ် ဖော်မတ်လုပ်ပါ
azd env list --output table

# တပ်ဆင်ပြီးသော ဝန်ဆောင်မှုများကို ကြည့်ပါ
azd show --output json | jq '.services | keys'
```

## 🔧 ယေဘူယျ အမိန့် ပေါင်းစပ်မှုများ

### ကျန်းမာရေး စစ်ဆေးမှု စကရစ်ပ်
```bash
#!/bin/bash
# အမြန် ကျန်းမာရေး စစ်ဆေးခြင်း
azd show
azd env show
azd monitor --logs
```

### တင်သွင်းမှု အတည်ပြုခြင်း
```bash
#!/bin/bash
# ဖြန့်ချိရန်မတိုင်ခင် အတည်ပြုခြင်း
azd show
azd provision --preview  # ဖြန့်ချိရန်မပြုမီ ပြောင်းလဲချက်များကို ကြိုတင် ကြည့်ရှုပါ
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

### အရင်းအမြစ် ရှင်းလင်းရေး စကရစ်ပ်
```bash
#!/bin/bash
# ဟောင်းနေသော ပတ်ဝန်းကျင်များကို ရှင်းလင်းပါ
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 ပတ်ဝန်းကျင် အပြင်အဆင် (Environment Variables)

### ယေဘူယျ ပတ်ဝန်းကျင် အပြောင်းအလဲများ
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

### အလျင်မြန် ဖြေရှင်းချက်များ
```bash
# အတည်ပြုမှုကို ပြန်လည်သတ်မှတ်ရန်
az account clear
az login

# ပတ်ဝန်းကျင်ကို မဖြစ်မနေ ပြန်လည်မွမ်းမံရန်
azd env refresh

# ဝန်ဆောင်မှုအားလုံးကို ပြန်လည်တပ်ဆင်ရန်
azd deploy

# တပ်ဆင်မှု အခြေအနေကို စစ်ဆေးရန်
azd show --output json
```

### ပြန်လည်ရယူရေး အမိန့်များ
```bash
# မအောင်မြင်သော တပ်ဆင်မှုမှ ပြန်လည်ကယ်တင်ရန် - သန့်ရှင်းပြီး ပြန်လည်တပ်ဆင်ခြင်း
azd down --force --purge
azd up

# အခြေခံအဆောက်အဦးကိုသာ ပြန်လည်ပေးအပ်ခြင်း
azd provision

# အပလီကေးရှင်းကိုသာ ပြန်လည်တပ်ဆင်ခြင်း
azd deploy
```

## 💡 အထူး အကြံပြုချက်များ

### လုပ်ငန်းစဉ် မြန်ဆန်စေရန် Alias များ
```bash
# သင့် .bashrc သို့မဟုတ် .zshrc ဖိုင်ထဲတွင် ထည့်ပါ
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Function Shortcut များ
```bash
# ပတ်ဝန်းကျင်ကို လျင်မြန်စွာ ပြောင်းခြင်း
azd-env() {
    azd env select $1 && azd show
}

# စောင့်ကြည့်မှုပါရှိသည့် လျင်မြန် တပ်ဆင်ခြင်း
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

## 📖 အကူအညီ နှင့် စာတမ်းများ

### အကူအညီ ရယူရန်
```bash
# ယေဘုယျ အကူအညီ
azd --help
azd help

# အမိန့်အလိုက် အကူအညီ
azd up --help
azd env --help
azd config --help

# ဗားရှင်းနှင့် တည်ဆောက်မှု အချက်အလက် ပြပါ
azd version
azd version --output json
```

### စာတမ်း လင့်ခ်များ
```bash
# ဘရောက်ဇာတွင် စာရွက်စာတမ်းကို ဖွင့်ပါ
azd docs

# ပုံစံစာရွက်စာတမ်းကို ပြပါ
azd template show <template-name> --docs
```

---

**အကြံပြုချက်**: ဒီ cheat sheet ကို Bookmark လုပ်ထားပြီး `Ctrl+F` ကို အသုံးပြုပြီး လိုအပ်သော အမိန့်များကို အလျင်မြန် ရှာဖွေပါ။

---

**လမ်းကြောင်း**
- **အရင် သင်ခန်းစာ**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **နောက်ထပ် သင်ခန်းစာ**: [Glossary](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
တာဝန်ပယ်ချချက်:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှုပုံစံဖြစ်သော Co-op Translator (https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးပမ်းသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှန်ကန်မှု ကျဆင်းမှုများ ရှိနိုင်ကြောင်း သတိပြုပါ။ မူရင်းစာရွက်ကို မူရင်းဘာသာစကားဖြင့် အခိုင်အမာ အရင်းအမြစ်အဖြစ် ယူဆသင့်သည်။ အရေးကြီးသော အချက်အလက်များအတွက် သင်ကြားပေးနိုင်သော ကျွမ်းကျင်သော လူ့ဘာသာပြန်တစ်ဦး၏ ဘာသာပြန်ချက်ကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုရာမှ ဖြစ်ပေါ်နိုင်သည့် နားမလည်မှုများ သို့မဟုတ် မှားယွင်းဖတ်ရှုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->