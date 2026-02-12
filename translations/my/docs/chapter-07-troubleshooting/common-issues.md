# အထင်ကြီး တွေ့ရသော ပြဿနာများနှင့် ဖြေရှင်းနည်းများ

**အခန်း လမ်းညွှန်:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD အတွက် စတင်သူများ](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 7 - ပြဿနာရှာဖွေခြင်းနှင့် အမှားရှာဖွေရေး
- **⬅️ ယခင် အခန်း**: [အခန်း 6: ကြိုတင် စစ်ဆေးမှုများ](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ နောက်တစ်ခု**: [အမှားရှာဖွေရေး လမ်းညွှန်](debugging.md)
- **🚀 နောက်အခန်း**: [အခန်း 8: ထုတ်လုပ်ရေးနှင့် စီးပွားရေး မော်ဒယ်များ](../chapter-08-production/production-ai-practices.md)

## မိတ်ဆက်

ဤ အထွေထွေပြဿနာရှာဖွေရေး လမ်းညွှန်သည် Azure Developer CLI အသုံးပြုသောအခါ အများဆုံး တွေ့ကြုံရသည့် ပြဿနာများကို ဖော်ပြထားသည်။ အတည်ပြုမှု၊ တပ်ဆင်ခြင်း၊ အင်ဖရာစထက်ချ် ထောက်ပံ့မှုနှင့် အက်ပလิเคရှင်း ဖွဲ့စည်းမှုဆိုင်ရာ ပြဿနာများကို ရှာဖွေ၊ ဖြေရှင်းနှင့် ပြဿနာကင်းရှင်းစေရန် နည်းလမ်းများကို လေ့လာပါ။ ပြဿနာတိုင်းတွင် လက္ခဏာများ၊ မူလအကြောင်းအရင်းများနှင့် အဆင့်လိုက် ဖြေရှင်းနည်းများ ပါဝင်သည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဤလမ်းညွှန်ကို ပြီးမြောက်ပါက သင်သည် -
- Azure Developer CLI ပြဿနာများအတွက် ရှာဖွေစစ်ဆေးနည်းလမ်းများကို ကျွမ်းကျင်စွာ အသုံးပြုနိုင်မည်
- အတည်ပြုမှုနှင့် ခွင့်ပြုချက်ဆိုင်ရာ ပြဿနာများနှင့် ၎င်းတို့၏ ဖြေရှင်းနည်းများကို နားလည်မည်
- တပ်ဆင်မှု မအောင်မြင်မှုများ၊ အင်ဖရာစထက်ချ် provisioning အမှားများနှင့် ဖွဲ့စည်းမှု ပြဿနာများကို ဖြေရှင်းနိုင်မည်
- ကြိုတင် စောင့်ကြည့်ခြင်းနှင့် debugging မဟုတ်သော နည်းဗျူဟာများကို အကောင်အထည်ဖော်နိုင်မည်
- ရှုပ်ထွေးသော ပြဿနာများအတွက် စနစ်တကျ ပြဿနာရှာဖွေရေးနည်းစနစ်များကို သုံးနိုင်မည်
- အနာဂတ် ပြဿနာများမှ ကာကွယ်ရန် သေချာသော logging နှင့် monitoring ကို ဖွဲ့စည်းနိုင်မည်

## သင်ယူပြီးရရှိမည့် ရလဒ်များ

ပြီးမြောက်ချိန်တွင် သင် قادرမည် -
- Azure Developer CLI ပြဿနာများကို built-in diagnostic ကိရိယာများဖြင့် ရှာဖွေစစ်ဆေးနိုင်ရန်
- အတည်ပြုမှု၊ subscription နှင့် ခွင့်ပြုချက်ဆိုင်ရာ ပြဿနာများကို ကိုယ်တိုင် ဖြေရှင်းနိုင်ရန်
- တပ်ဆင်မှု မအောင်မြင်ခြင်းများနှင့် အင်ဖရာစထက်ချ် provisioning အမှားများကို ထိရောက်စွာ ဖြေရှင်းနိုင်ရန်
- အက်ပလิเคရှင်း ဖွဲ့စည်းမှု ပြဿနာများနှင့် ပတ်ဝန်းကျင် အလိုက် ဖြစ်ပေါ်သော ပြဿနာများကို debugging ပြုလုပ်နိုင်ရန်
- ဖြစ်နိုင်ချေရှိသည့် ပြဿနာများကို ကြိုတင် သိရှိစေရန် monitoring နှင့် alerting ကို လက်ခံတပ်ဆင်နိုင်ရန်
- logging၊ debugging နှင့် ပြဿနာ ဖြေရှင်းမှု လုပ်ငန်းစဉ်များအတွက် အကောင်းဆုံး လမ်းညွှန်ချက်များ အောက်မေ့စွာ အသုံးချနိုင်ရန်

## တိုထွာစစ်ဆေးရန် (Quick Diagnostics)

ထူးခြားသော ပြဿနာများဆီ တက်မသွားမီ အောက်ပါ command များကို အသုံးပြု၍ diagnostic အချက်အလက်များကို စုဆောင်းပါ။

```bash
# azd ဗားရှင်းနှင့် အခြေအနေကို စစ်ဆေးပါ
azd version
azd config list

# Azure အတည်ပြုခြင်းကို စစ်ဆေးပါ
az account show
az account list

# လက်ရှိ ပတ်ဝန်းကျင်ကို စစ်ဆေးပါ
azd env show
azd env get-values

# အမှားရှာဖွေရေး မှတ်တမ်းတင်မှုကို ဖွင့်ပါ
export AZD_DEBUG=true
azd <command> --debug
```

## အတည်ပြုမှု ဆိုင်ရာ ပြဿနာများ

### ပြဿနာ: "access token ရယူရန် မအောင်မြင်ခြင်း"
**လက္ခဏာများ:**
- `azd up` သည် အတည်ပြုမှု အမှားများကြောင့် မအောင်မြင်ပါ
- အမိန့်များသည် "unauthorized" သို့မဟုတ် "access denied" ပြန်လာတတ်သည်

**ဖြေရှင်းနည်းများ:**
```bash
# Azure CLI ဖြင့် ထပ်မံ အတည်ပြုပါ
az login
az account show

# ကက်ရှ်ထားသော မှတ်ပုံတင် အချက်အလက်များ ဖယ်ရှားပါ
az account clear
az login

# Device code flow ကို အသုံးပြုပါ (GUI မရှိသော စနစ်များအတွက်)
az login --use-device-code

# subscription ကို တိတိကျကျ သတ်မှတ်ပါ
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### ပြဿနာ: deployment အတွင်း "Insufficient privileges"
**လက္ခဏာများ:**
- Deployment သည် ခွင့်ပြုချက် အမှားများကြောင့် မအောင်မြင်ပါ
- အချို့ Azure အရင်းအမြစ်များကို မဖန်တီးနိုင်ပါ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. သင့် Azure role ခန့်အပ်ချက်များကို စစ်ဆေးပါ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. သင့်တွင် လိုအပ်သော role များ ရှိကြောင်း သေချာပါ
# - Contributor (အရင်းအမြစ် ဖန်တီးခြင်းအတွက်)
# - User Access Administrator (role ခန့်အပ်ချက်များအတွက်)

# 3. လိုအပ်သည့် ခွင့်ပြုချက်များရရှိရန် သင့် Azure စီမံခန့်ခွဲသူထံ ဆက်သွယ်ပါ
```

### ပြဿနာ: Multi-tenant အတည်ပြုမှု ပြဿနာများ
**ဖြေရှင်းနည်းများ:**
```bash
# 1. သတ်မှတ်ထားသော tenant ဖြင့် လော့ဂ်အင်လုပ်ပါ
az login --tenant "your-tenant-id"

# 2. configuration တွင် tenant ကို သတ်မှတ်ပါ
azd config set auth.tenantId "your-tenant-id"

# 3. tenant ကို ပြောင်းလဲနေသောအခါ tenant cache ကို ရှင်းလင်းပါ
az account clear
```

## 🏗️ အဆောက်အအုံ ထောက်ပံ့ရေး (Infrastructure) အမှားများ

### ပြဿနာ: အရင်းအမြစ် အမည် ပဋိပက္ခ
**လက္ခဏာများ:**
- "The resource name already exists" အမှားများ
- အရင်းအမြစ် ဖန်တီးစဉ်တွင် Deployment မအောင်မြင်ပါ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. token များဖြင့် ထူးခြားသော အရင်းအမြစ်အမည်များကို အသုံးပြုပါ
# သင့် Bicep ပုံစံတွင်:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. ပတ်ဝန်းကျင် အမည်ကို ပြောင်းလဲပါ
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. ရှိပြီးသား အရင်းအမြစ်များကို ရှင်းလင်းပါ
azd down --force --purge
```

### ပြဿနာ: တည်နေရာ/ဒေသ မရနိုင်ခြင်း
**လက္ခဏာများ:**
- "The location 'xyz' is not available for resource type"
- ရွေးထားသော ဒေသတွင် အချို့ SKU များ ရရှိနိုင်ခြင်းမရှိ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. အရင်းအမြစ်အမျိုးအစားများအတွက် ရရှိနိုင်သော တည်နေရာများကို စစ်ဆေးပါ
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. အများအားဖြင့် ရရှိနိုင်သော ဒေသများကို အသုံးပြုပါ
azd config set defaults.location eastus2
# သို့မဟုတ်
azd env set AZURE_LOCATION eastus2

# 3. ဒေသအလိုက် ဝန်ဆောင်မှု ရရှိနိုင်မှုကို စစ်ဆေးပါ
# သွားရောက်ကြည့်ရန်: https://azure.microsoft.com/global-infrastructure/services/
```

### ပြဿနာ: Quota လွန်ကဲမှု အမှားများ
**လက္ခဏာများ:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**ဖြေရှင်းနည်းများ:**
```bash
# 1. လက်ရှိ ကွိုတာ အသုံးပြုမှုကို စစ်ဆေးပါ
az vm list-usage --location eastus2 -o table

# 2. Azure ပေါ်တွင် portal မှတဆင့် ကွိုတာ ပမာဏ တိုးမြှင့်ရန် တောင်းဆိုပါ
# သွားရန်: Subscription များ > အသုံးနှင့် ကွိုတာများ

# 3. ဖွံ့ဖြိုးရေးအတွက် အသေးစား SKU များကို အသုံးပြုပါ
# main.parameters.json ဖိုင်တွင်:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. မအသုံးပြုသော အရင်းအမြစ်များကို ဖယ်ရှားပါ
az resource list --query "[?contains(name, 'unused')]" -o table
```

### ပြဿနာ: Bicep template အမှားများ
**လက္ခဏာများ:**
- Template စစ်ဆေးမှု မအောင်မြင်ခြင်း
- Bicep ဖိုင်များတွင် သဒ္ဒါအမှားများ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. Bicep စာရိုက်ပုံစံကို အတည်ပြုပါ
az bicep build --file infra/main.bicep

# 2. Bicep လင်တာကို အသုံးပြုပါ
az bicep lint --file infra/main.bicep

# 3. ပါရာမီတာ ဖိုင်၏ စာရိုက်ပုံစံကို စစ်ဆေးပါ
cat infra/main.parameters.json | jq '.'

# 4. တပ်ဆင်မှု ပြောင်းလဲမှုများကို ကြိုတင်ကြည့်ရှုပါ
azd provision --preview
```

## 🚀 တပ်ဆင်မှု မအောင်မြင်ခြင်းများ

### ပြဿနာ: Build ပျက်ကွက်မှုများ
**လက္ခဏာများ:**
- တပ်ဆင်ရာတွင် အက်ပလิเคရှင်း သည် build မအောင်မြင်သော အခြေအနေ
- package ထည့်သွင်းရာတွင် အမှားများ ဖြစ်ပွားခြင်း

**ဖြေရှင်းနည်းများ:**
```bash
# 1. debug flag ဖြင့် build ထွက်ကို စစ်ဆေးပါ
azd deploy --service web --debug

# 2. ဖြန့်ချိထားသော ဝန်ဆောင်မှု အခြေအနေကို ကြည့်ပါ
azd show

# 3. build ကို ကိုယ်ပိုင်စက်တွင် စမ်းသပ်ပါ
cd src/web
npm install
npm run build

# 3. Node.js/Python ဗားရှင်းများ၏ ကိုက်ညီမှုကို စစ်ဆေးပါ
node --version  # azure.yaml ဖိုင်တွင် သတ်မှတ်ထားသော ဆက်တင်များနှင့် ကိုက်ညီရမည်
python --version

# 4. build cache ကို ရှင်းလင်းပါ
rm -rf node_modules package-lock.json
npm install

# 5. container များကို အသုံးပြုပါက Dockerfile ကို စစ်ဆေးပါ
docker build -t test-image .
docker run --rm test-image
```

### ပြဿနာ: ကွန်တိန်နာ တပ်ဆင်မှု မအောင်မြင်ခြင်း
**လက္ခဏာများ:**
- Container apps မစတင်နိုင်ခြင်း
- Image pull အမှားများ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. Docker build ကို မိမိစက်ပေါ်တွင် ချက်ချင်း စမ်းသပ်ပါ
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI ကို အသုံးပြုပြီး ကွန်တိန်နာလော့ဂ်များကို စစ်ဆေးပါ
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd ဖြင့် အပလီကေးရှင်းကို စောင့်ကြည့်ပါ
azd monitor --logs

# 3. ကွန်တိန်နာ စာရင်း (container registry) သို့ ဝင်ရောက်ခွင့်ရှိမှုကို အတည်ပြုပါ
az acr login --name myregistry

# 4. ကွန်တိန်နာ အက်ပ်၏ ဖွဲ့စည်းပုံ (configuration) ကို စစ်ဆေးပါ
az containerapp show --name my-app --resource-group my-rg
```

### ပြဿနာ: ဒေတာဘေ့စ် ချိတ်ဆက် မအောင်မြင်ခြင်း
**လက္ခဏာများ:**
- အက်ပလิเคရှင်းသည် ဒေတာဘေ့စ်နှင့် ချိတ်ဆက်၍ မရ
- ချိတ်ဆက် အချိန်ကုန် (timeout) အမှားများ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. ဒေတာဘေ့စ်၏ ဖိုင်ဝေါလ် စည်းမျဉ်းများကို စစ်ဆေးပါ
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. အက်ပလီကေးရှင်းမှ ချိတ်ဆက်မှုကို စမ်းသပ်ပါ
# သင့်အက်ပလီကေးရှင်းသို့ ယာယီ ထည့်ပါ:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. ချိတ်ဆက်စာကြောင်းပုံစံကို အတည်ပြုပါ
azd env get-values | grep DATABASE

# 4. ဒေတာဘေ့စ် ဆာဗာ အခြေအနေကို စစ်ဆေးပါ
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 ဖွဲ့စည်းမှုဆိုင်ရာ ပြဿနာများ

### ပြဿနာ: Environment variables မလုပ်ဆောင်ခြင်း
**လက္ခဏာများ:**
- App သည် ဖွဲ့စည်းမှု တန်ဖိုးများကို ဖတ်၍ မရပါ
- Environment variables များသည် ဗလာပုံအဖြစ် ပြတတ်ပါသည်

**ဖြေရှင်းနည်းများ:**
```bash
# 1. ပတ်ဝန်းကျင်တန်ဖိုးများ သတ်မှတ်ထားကြောင်း စစ်ဆေးပါ
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml ဖိုင်ထဲရှိ variable အမည်များကို စစ်ဆေးပါ
cat azure.yaml | grep -A 5 env:

# 3. အပလီကေးရှင်းကို ပြန်စတင်ပါ
azd deploy --service web

# 4. App Service ၏ ဖော်ပြချက် (configuration) ကို စစ်ဆေးပါ
az webapp config appsettings list --name myapp --resource-group myrg
```

### ပြဿနာ: SSL/TLS certificate ပြဿနာများ
**လက္ခဏာများ:**
- HTTPS မလုပ်ဆောင်ပါ
- Certificate စစ်ဆေးမှု အမှားများ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. SSL လက်မှတ်အခြေအနေကို စစ်ဆေးပါ
az webapp config ssl list --resource-group myrg

# 2. HTTPS ကိုသာ အသုံးပြုရန် ဖွင့်ပါ
az webapp update --name myapp --resource-group myrg --https-only true

# 3. လိုအပ်ပါက စိတ်ကြိုက် ဒိုမိန်းကို ထည့်ပါ
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### ပြဿနာ: CORS ဖွဲ့စည်းမှု ပြဿနာများ
**လက္ခဏာများ:**
- Frontend သည် API ကို ခေါ်၍ မရပါ
- Cross-origin request က တားဆီးထားသည်

**ဖြေရှင်းနည်းများ:**
```bash
# 1. App Service အတွက် CORS ကို ပြင်ဆင်ပါ
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. API ကို CORS ကို ကိုင်တွယ်နိုင်စေရန် အပ်ဒိတ်လုပ်ပါ
# Express.js တွင်:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. မှန်ကန်သော URL များပေါ်တွင် လည်ပတ်နေကြောင်း စစ်ဆေးပါ
azd show
```

## 🌍 ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှု ပြဿနာများ

### ပြဿနာ: ပတ်ဝန်းကျင် ပြောင်းလဲမှု ပြဿနာများ
**လက္ခဏာများ:**
- မှားယွင်းသော ပတ်ဝန်းကျင်ကို အသုံးပြုနေသည်
- ဖွဲ့စည်းမှု မမှန်ကန်စွာ ပြောင်းလဲမရ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. ပတ်ဝန်းကျင်အားလုံးကို စာရင်းပြပါ
azd env list

# 2. ပတ်ဝန်းကျင်ကို တိကျစွာ ရွေးပါ
azd env select production

# 3. လက်ရှိပတ်ဝန်းကျင်ကို အတည်ပြုပါ
azd env show

# 4. ပျက်စီးနေပါက ပတ်ဝန်းကျင်အသစ်တစ်ခု ဖန်တီးပါ
azd env new production-new
azd env select production-new
```

### ပြဿနာ: ပတ်ဝန်းကျင် ပျက်စီးခြင်း
**လက္ခဏာများ:**
- ပတ်ဝန်းကျင်တွင် အခြေအနေ မမှန်ကန်ပြသပါသည်
- အရင်းအမြစ်များသည် ဖွဲ့စည်းမှုနှင့် ကိုက်ညီမှု မရှိ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. ပတ်ဝန်းကျင်၏ အခြေအနေကို ပြန်လည်အသစ်ပြုလုပ်ပါ
azd env refresh

# 2. ပတ်ဝန်းကျင် ဖွဲ့စည်းမှုကို ပြန်လည်သတ်မှတ်ပါ
azd env new production-reset
# လိုအပ်သော ပတ်ဝန်းကျင် ပြောင်းလဲနိုင်သော တန်ဖိုးများကို ကူးယူပါ
azd env set DATABASE_URL "your-value"

# 3. ရှိပြီးသား အရင်းအမြစ်များကို သွင်းယူပါ (ဖြစ်နိုင်ပါက)
# .azure/production/config.json ကို အရင်းအမြစ် ID များဖြင့် လက်ဖြင့် ပြင်ဆင်ပါ
```

## 🔍 စွမ်းဆောင်ရည်ဆိုင်ရာ ပြဿနာများ

### ပြဿနာ: Deployment တာဝန် ကာလ နှေးကွေးခြင်း
**လက္ခဏာများ:**
- Deployment များသည် အချိန်ပိုစောင့်ရသည်
- Deployment အတွင်း timeout ဖြစ်ပွားသည်

**ဖြေရှင်းနည်းများ:**
```bash
# 1. ပိုမိုလျင်မြန်စွာ အလုပ်လုပ်နိုင်ရန် သီးသန့် ဝန်ဆောင်မှုများကို တပ်ဆင်ပါ
azd deploy --service web
azd deploy --service api

# 2. အောက်ဆောက်လုပ်ငန်း မပြောင်းလဲပါက ကုဒ်သာ ဖြင့် တပ်ဆင်ပါ
azd deploy  # azd up ထက် ပိုမိုလျင်မြန်သည်

# 3. ဆောက်လုပ်မှုလုပ်ငန်းစဉ်ကို ထိရောက်အောင် ပြုပြင်ပါ
# package.json တွင်:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. အရင်းအမြစ်တည်နေရာများကို စစ်ဆေးပါ (တူညီသော ဒေသကို အသုံးပြုပါ)
azd config set defaults.location eastus2
```

### ပြဿနာ: အက်ပလิเคရှင်း စွမ်းဆောင်ရည် ပြဿနာများ
**လက္ခဏာများ:**
- တုံ့ပြန်ချိန် နှေးကွေးခြင်း
- အရင်းအမြစ် အသုံးပြုမှု မြင့်မားခြင်း

**ဖြေရှင်းနည်းများ:**
```bash
# 1. အရင်းအမြစ်များကို တိုးချဲ့ပါ
# main.parameters.json တွင် SKU ကို အပ်ဒိတ်လုပ်ပါ:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights စောင့်ကြည့်မှုကို ဖွင့်ပါ
azd monitor --overview

# 3. Azure တွင် အက်ပလီကေးရှင်းလော့ဂ်များကို စစ်ဆေးပါ
az webapp log tail --name myapp --resource-group myrg
# သို့မဟုတ် Container Apps အတွက်:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. ကက်ရှ်ကို အကောင်အထည်ဖော်ပါ
# သင့် စနစ်ပေါင်းစည်းမှုတွင် Redis ကို ကက်ရှ်အဖြစ် ထည့်သွင်းပါ
```

## 🛠️ ပြဿနာရှာဖွေရေး ကိရိယာများနှင့် အမိန့်များ

### Debug အမိန့်များ
```bash
# ကျယ်ပြန့်စုံလင်သော အမှားရှာဖွေရေး
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd ဗားရှင်းကို စစ်ဆေးပါ
azd version

# လက်ရှိ ဖွဲ့စည်းမှုကို ကြည့်ပါ
azd config list

# ချိတ်ဆက်မှုကို စမ်းသပ်ပါ
curl -v https://myapp.azurewebsites.net/health
```

### မှတ်တမ်း (Log) စစ်ဆေးခြင်း
```bash
# Azure CLI မှတဆင့် လျှော့ခယ်လ်လျှောက်လွှာ လော့ဂ်များ
az webapp log tail --name myapp --resource-group myrg

# azd ဖြင့် လျှောက်လွှာ စောင့်ကြည့်ခြင်း
azd monitor --logs
azd monitor --live

# Azure အရင်းအမြစ် လော့ဂ်များ
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# ကွန်တိန်နာ အက်ပ်များအတွက် လော့ဂ်များ
az containerapp logs show --name myapp --resource-group myrg --follow
```

### အရင်းအမြစ် စုံစမ်းစစ်ဆေးရန်
```bash
# အားလုံးသော အရင်းအမြစ်များကို စာရင်းပြပါ
az resource list --resource-group myrg -o table

# အရင်းအမြစ်၏ အခြေအနေကို စစ်ဆေးပါ
az webapp show --name myapp --resource-group myrg --query state

# ကွန်ယက် ပြဿနာရှာဖွေခြင်း
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 ထပ်မံ အကူအညီ ရယူခြင်း

### ဘယ်အချိန်တွင် တိုးတက် အကူအညီ တောင်းရမည်နည်း
- အားလုံးသော ဖြေရှင်းနည်းများကို ကြိုးစားပြီးနောက်လည်း အတည်ပြုမှု ပြဿနာများ ဆက်လက်ရှိနေပါက
- Azure ဝန်ဆောင်မှုများနှင့် ပတ်သက်သည့် အင်ဖရာစထက်ချ် ပြဿနာများရှိပါက
- ဘီလ်ချ် သို့မဟုတ် subscription ဆိုင်ရာ ပြဿနာများရှိပါက
- လုံခြုံရေး ကိစ္စများ သို့မဟုတ် ဖြစ်ရပ်အရေးပေါ် များရှိပါက

### အထောက်အပံ့ လမ်းကြောင်း
```bash
# 1. Azure Service Health ကို စစ်ဆေးပါ
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure အတွက် support ticket တစ်ခု ဖန်တီးပါ
# သွားရန်: https://portal.azure.com -> Help + support

# 3. အသိုင်းအဝိုင်း အရင်းအမြစ်များ
# - Stack Overflow: azure-developer-cli တံဆိပ်
# - GitHub ပြဿနာများ: https://github.com/Azure/azure-dev/issues
# - Microsoft မေး-ဖြေ (Q&A): https://learn.microsoft.com/en-us/answers/
```

### စုဆောင်းသင့်သည့် သတင်းအချက်အလက်များ
Support ထံဆက်သွယ်မီ အောက်ပါအချက်အလက်များကို စုဆောင်းပါ -
- `azd version` output
- `azd config list` output
- `azd show` output (လက်ရှိ တပ်ဆင်မှု အခြေအနေ)
- အမှား မက်ဆေ့ချ်များ (အပြည့်အစုံ)
- ပြဿနာကို ထပ်ထုတ်ပေါက်စေသော လုပ်ဆောင်ချက် အဆင့်များ
- ပတ်ဝန်းကျင် အသေးစိတ် (`azd env show`)
- ပြဿနာ စတင်ခဲ့ချိန် အချိန်ဇယား

### မှတ်တမ်း စုဆောင်းရေး စကရစ်ပ့်
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 ပြဿနာ မဖြစ်စေမည့် နည်းလမ်းများ

### ကြိုတင် တပ်ဆင်မှု စစ်ဆေးစာရင်း
```bash
# 1. အတည်ပြုမှုကို စစ်ဆေးပါ
az account show

# 2. ခွဲဝေပမာဏနှင့် ကန့်သတ်ချက်များကို စစ်ဆေးပါ
az vm list-usage --location eastus2

# 3. ပုံစံများကို စစ်ဆေးပါ
az bicep build --file infra/main.bicep

# 4. ပထမဦးစွာ ကိုယ်ပိုင်စက်တွင် စမ်းသပ်ပါ
npm run build
npm run test

# 5. dry-run တင်သွင်းမှုများကို အသုံးပြုပါ
azd provision --preview
```

### စောင့်ကြည့်ရေး သတ်မှတ်ခြင်း
```bash
# Application Insights ကို ဖွင့်ပါ
# main.bicep ထဲသို့ ထည့်ပါ:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# သတိပေးချက်များကို ပြင်ဆင်ပါ
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### ပုံမှန် ပြုပြင်ထိန်းသိမ်းမှု
```bash
# အပတ်စဉ် ကျန်းမာရေး စစ်ဆေးမှုများ
./scripts/health-check.sh

# လစဉ် ကုန်ကျစရိတ် ပြန်လည်သုံးသပ်ခြင်း
az consumption usage list --billing-period-name 202401

# သုံးလတိုင်း လုံခြုံရေး ပြန်လည်သုံးသပ်ခြင်း
az security assessment list --resource-group myrg
```

## ဆက်စပ် အရင်းအမြစ်များ

- [အမှားရှာဖွေရေး လမ်းညွှန်](debugging.md) - တိုးတက်သော debugging နည်းများ
- [အရင်းအမြစ် ထောက်ပံ့ခြင်း](../chapter-04-infrastructure/provisioning.md) - အင်ဖရာစထက် ပြဿနာရှာဖွေခြင်း
- [စွမ်းရည် စီမံကိန်း](../chapter-06-pre-deployment/capacity-planning.md) - အရင်းအမြစ် စီမံကိန်း ညွှန်ပြချက်များ
- [SKU ရွေးချယ်ခြင်း](../chapter-06-pre-deployment/sku-selection.md) - ဝန်ဆောင်မှု အဆင့် အကြံပြုချက်များ

---

**အကြံပြုချက်**: ဤ လမ်းညွှန်ကို bookmark ထားပြီး ပြဿနာတွေ့ခဲ့တိုင်း ပြန်လည်ရည်ညွှန်းပါ။ အများစုသော ပြဿနာများကို ယခင်က ကြုံတွေ့ပြီးဖြေရှင်းနည်းများ ရှိပြီးသားဖြစ်ပါသည်!

---

**လမ်းညွှန်**
- **ယခင် သင်ခန်းစာ**: [အရင်းအမြစ် ထောက်ပံ့ခြင်း](../chapter-04-infrastructure/provisioning.md)
- **နောက်တစ်ခန်း သင်ခန်းစာ**: [အမှားရှာဖွေရေး လမ်းညွှန်](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
အသိပေးချက်:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် မှန်ကန်မှုကို ကြိုးစားသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှန်ကန်မှုလျော့နည်းမှုများ ပါနိုင်ကြောင်း သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာတမ်းကို ယုံကြည်စိတ်ချရသော အရင်းအမြစ်အဖြစ် သတ်မှတ်ပါ။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ကျွမ်းကျင်သူ ဖော်ပြချက်ကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာသော နားမလည်မှုများ သို့မဟုတ် အဓိပ္ပာယ်မှားချက်များအတွက် ကျွန်တော်တို့နှင့်အဖွဲ့အတွက် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->