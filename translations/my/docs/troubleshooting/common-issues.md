<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94de06ce1e81ee964b067f118211612f",
  "translation_date": "2025-11-23T22:44:11+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "my"
}
-->
# အများဆုံးတွေ့ရသောပြဿနာများနှင့် ဖြေရှင်းနည်းများ

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်ခန်းစာမူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၇ - ပြဿနာရှာဖွေခြင်းနှင့် အမှားပြင်ခြင်း
- **⬅️ ယခင်အခန်း**: [အခန်း ၆: စစ်ဆေးမှုများ](../pre-deployment/preflight-checks.md)
- **➡️ နောက်တစ်ခု**: [Debugging Guide](debugging.md)
- **🚀 နောက်အခန်း**: [အခန်း ၈: ထုတ်လုပ်မှုနှင့် စီးပွားရေးပုံစံများ](../microsoft-foundry/production-ai-practices.md)

## နိဒါန်း

ဒီပြဿနာရှာဖွေမှုလမ်းညွှန်သည် Azure Developer CLI ကိုအသုံးပြုရာတွင် အများဆုံးတွေ့ရသောပြဿနာများကို ကာဗာလုပ်ထားသည်။ အတည်ပြုခြင်း၊ တင်သွင်းခြင်း၊ အခြေခံအဆောက်အအုံများဖန်တီးခြင်းနှင့် အပလီကေးရှင်းဖွဲ့စည်းမှုဆိုင်ရာ ပြဿနာများကို ရှာဖွေ၊ ပြဿနာရှာဖွေ၊ ဖြေရှင်းနည်းများကို သင်ယူပါ။ ပြဿနာတစ်ခုစီတွင် အသေးစိတ်လက္ခဏာများ၊ အကြောင်းရင်းများနှင့် အဆင့်ဆင့်ဖြေရှင်းနည်းများပါဝင်သည်။

## သင်ယူရည်မှန်းချက်များ

ဒီလမ်းညွှန်ကိုပြီးစီးခြင်းဖြင့် သင်သည်:
- Azure Developer CLI ပြဿနာများအတွက် ရှာဖွေစစ်ဆေးနည်းများကို ကျွမ်းကျင်စွာအသုံးပြုနိုင်မည်
- အတည်ပြုခြင်းနှင့် ခွင့်ပြုချက်ဆိုင်ရာ ပြဿနာများနှင့် ၎င်းတို့၏ ဖြေရှင်းနည်းများကို နားလည်မည်
- တင်သွင်းမှုမအောင်မြင်မှုများ၊ အခြေခံအဆောက်အအုံဖန်တီးမှုအမှားများနှင့် ဖွဲ့စည်းမှုဆိုင်ရာ ပြဿနာများကို ဖြေရှင်းနိုင်မည်
- ကြိုတင်စောင့်ကြည့်မှုနှင့် အမှားရှာဖွေမှုနည်းဗျူဟာများကို အကောင်အထည်ဖော်နိုင်မည်
- ရှုပ်ထွေးသောပြဿနာများအတွက် စနစ်တကျ ပြဿနာရှာဖွေမှုနည်းလမ်းများကို အသုံးပြုနိုင်မည်
- အနာဂတ်ပြဿနာများကို ကာကွယ်ရန် မှန်ကန်သော မှတ်တမ်းတင်ခြင်းနှင့် စောင့်ကြည့်မှုကို ဖွဲ့စည်းနိုင်မည်

## သင်ယူရလဒ်များ

ပြီးစီးချိန်တွင် သင်သည်:
- Azure Developer CLI ပြဿနာများကို တပ်ဆင်ထားသော ရှာဖွေစစ်ဆေးမှုကိရိယာများဖြင့် ရှာဖွေနိုင်မည်
- အတည်ပြုခြင်း၊ subscription နှင့် ခွင့်ပြုချက်ဆိုင်ရာ ပြဿနာများကို ကိုယ်တိုင်ဖြေရှင်းနိုင်မည်
- တင်သွင်းမှုမအောင်မြင်မှုများနှင့် အခြေခံအဆောက်အအုံဖန်တီးမှုအမှားများကို ထိရောက်စွာ ဖြေရှင်းနိုင်မည်
- အပလီကေးရှင်းဖွဲ့စည်းမှုဆိုင်ရာ ပြဿနာများနှင့် ပတ်ဝန်းကျင်အထူးပြဿနာများကို အမှားရှာဖွေနိုင်မည်
- ကြိုတင်စောင့်ကြည့်မှုနှင့် သတိပေးမှုများကို အကောင်အထည်ဖော်ပြီး ဖြစ်နိုင်သောပြဿနာများကို ရှာဖွေနိုင်မည်
- မှတ်တမ်းတင်ခြင်း၊ အမှားရှာဖွေခြင်းနှင့် ပြဿနာဖြေရှင်းမှုလုပ်ငန်းစဉ်များအတွက် အကောင်းဆုံးအလေ့အထများကို အသုံးပြုနိုင်မည်

## အမြန်ရှာဖွေစစ်ဆေးမှု

အထူးပြဿနာများကို စတင်မရှာဖွေမီ၊ ဒီ command များကို အသုံးပြု၍ diagnostic အချက်အလက်များကို စုဆောင်းပါ:

```bash
# azd ဗားရှင်းနှင့် ကျန်းမာရေးကို စစ်ဆေးပါ
azd version
azd config list

# Azure အတည်ပြုခြင်းကို အတည်ပြုပါ
az account show
az account list

# လက်ရှိပတ်ဝန်းကျင်ကို စစ်ဆေးပါ
azd env show
azd env get-values

# debug logging ကို ဖွင့်ပါ
export AZD_DEBUG=true
azd <command> --debug
```

## အတည်ပြုခြင်းဆိုင်ရာ ပြဿနာများ

### ပြဿနာ: "Failed to get access token"
**လက္ခဏာများ:**
- `azd up` သည် အတည်ပြုခြင်းအမှားများဖြင့် မအောင်မြင်
- Command များသည် "unauthorized" သို့မဟုတ် "access denied" ပြန်လာသည်

**ဖြေရှင်းနည်းများ:**
```bash
# 1. Azure CLI ဖြင့် ပြန်လည်အတည်ပြုပါ
az login
az account show

# 2. Cached လက်မှတ်များကို ရှင်းလင်းပါ
az account clear
az login

# 3. Device code flow ကို အသုံးပြုပါ (headless systems အတွက်)
az login --use-device-code

# 4. Explicit subscription ကို သတ်မှတ်ပါ
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### ပြဿနာ: တင်သွင်းမှုအတွင်း "Insufficient privileges"
**လက္ခဏာများ:**
- တင်သွင်းမှုသည် ခွင့်ပြုချက်အမှားများဖြင့် မအောင်မြင်
- Azure resource အချို့ကို ဖန်တီး၍မရ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. သင်၏ Azure အခန်းကဏ္ဍ Assignments များကို စစ်ဆေးပါ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. လိုအပ်သော အခန်းကဏ္ဍများ ရှိကြောင်း သေချာပါ
# - Contributor (အရင်းအမြစ် ဖန်တီးခြင်းအတွက်)
# - User Access Administrator (အခန်းကဏ္ဍ Assignments အတွက်)

# 3. သင့် Azure အုပ်ချုပ်ရေးမှူးကို သင့်လျော်သော ခွင့်ပြုချက်များအတွက် ဆက်သွယ်ပါ
```

### ပြဿနာ: Multi-tenant အတည်ပြုခြင်းပြဿနာများ
**ဖြေရှင်းနည်းများ:**
```bash
# 1. အထူးသတ်မှတ်ထားသော tenant ဖြင့် Login လုပ်ပါ။
az login --tenant "your-tenant-id"

# 2. configuration တွင် tenant ကို သတ်မှတ်ပါ။
azd config set auth.tenantId "your-tenant-id"

# 3. tenant ကို ပြောင်းလဲပါက tenant cache ကို ရှင်းလင်းပါ။
az account clear
```

## 🏗️ အခြေခံအဆောက်အအုံဖန်တီးမှုအမှားများ

### ပြဿနာ: Resource name conflicts
**လက္ခဏာများ:**
- "The resource name already exists" အမှားများ
- Resource ဖန်တီးမှုအတွင်း တင်သွင်းမှုမအောင်မြင်

**ဖြေရှင်းနည်းများ:**
```bash
# ၁။ တိုကင်များနှင့်ထူးခြားသောအရင်းအမြစ်အမည်များကိုအသုံးပြုပါ
# သင့် Bicep template တွင်:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# ၂။ ပတ်ဝန်းကျင်အမည်ကိုပြောင်းပါ
azd env new my-app-dev-$(whoami)-$(date +%s)

# ၃။ ရှိပြီးသားအရင်းအမြစ်များကိုရှင်းလင်းပါ
azd down --force --purge
```

### ပြဿနာ: Location/Region မရရှိနိုင်ခြင်း
**လက္ခဏာများ:**
- "The location 'xyz' is not available for resource type"
- ရွေးချယ်ထားသော region တွင် SKUs အချို့မရရှိနိုင်

**ဖြေရှင်းနည်းများ:**
```bash
# 1. အရင်းအမြစ်အမျိုးအစားများအတွက် ရရှိနိုင်သော တည်နေရာများကို စစ်ဆေးပါ။
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. အများအားဖြင့် ရရှိနိုင်သော ဒေသများကို အသုံးပြုပါ။
azd config set defaults.location eastus2
# သို့မဟုတ်
azd env set AZURE_LOCATION eastus2

# 3. ဒေသအလိုက် ဝန်ဆောင်မှုရရှိနိုင်မှုကို စစ်ဆေးပါ။
# သွားရောက်ကြည့်ရှုပါ: https://azure.microsoft.com/global-infrastructure/services/
```

### ပြဿနာ: Quota ကျော်လွန်မှုအမှားများ
**လက္ခဏာများ:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**ဖြေရှင်းနည်းများ:**
```bash
# 1. လက်ရှိကိုတာအသုံးပြုမှုကို စစ်ဆေးပါ။
az vm list-usage --location eastus2 -o table

# 2. Azure portal မှတဆင့် ကိုတာတိုးမြှင့်မှုကို တောင်းဆိုပါ။
# သွားပါ: Subscriptions > Usage + quotas

# 3. ဖွံ့ဖြိုးတိုးတက်မှုအတွက် သေးငယ်သော SKUs ကို အသုံးပြုပါ။
# main.parameters.json တွင်:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. အသုံးမပြုသော အရင်းအမြစ်များကို ရှင်းလင်းပါ။
az resource list --query "[?contains(name, 'unused')]" -o table
```

### ပြဿနာ: Bicep template အမှားများ
**လက္ခဏာများ:**
- Template အတည်ပြုမှုမအောင်မြင်မှုများ
- Bicep ဖိုင်များတွင် စာလုံးပေါင်းအမှားများ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. Bicep syntax ကိုအတည်ပြုပါ
az bicep build --file infra/main.bicep

# 2. Bicep linter ကိုအသုံးပြုပါ
az bicep lint --file infra/main.bicep

# 3. parameter ဖိုင် syntax ကိုစစ်ဆေးပါ
cat infra/main.parameters.json | jq '.'

# 4. တပ်ဆင်မှုအပြောင်းအလဲများကိုကြိုတင်ကြည့်ရှုပါ
azd provision --preview
```

## 🚀 တင်သွင်းမှုမအောင်မြင်မှုများ

### ပြဿနာ: Build မအောင်မြင်မှုများ
**လက္ခဏာများ:**
- တင်သွင်းမှုအတွင်း အပလီကေးရှင်း build မအောင်မြင်
- Package တင်သွင်းမှုအမှားများ

**ဖြေရှင်းနည်းများ:**
```bash
# ၁။ Build log များကို စစ်ဆေးပါ
azd logs --service web
azd deploy --service web --debug

# ၂။ Build ကို ဒေသတွင်းတွင် စမ်းသပ်ပါ
cd src/web
npm install
npm run build

# ၃။ Node.js/Python ဗားရှင်းလိုက်ဖက်မှုကို စစ်ဆေးပါ
node --version  # azure.yaml အပြင်အဆင်များနှင့် ကိုက်ညီရမည်
python --version

# ၄။ Build cache ကို ရှင်းလင်းပါ
rm -rf node_modules package-lock.json
npm install

# ၅။ Container များကို အသုံးပြုပါက Dockerfile ကို စစ်ဆေးပါ
docker build -t test-image .
docker run --rm test-image
```

### ပြဿနာ: Container တင်သွင်းမှုမအောင်မြင်မှုများ
**လက္ခဏာများ:**
- Container apps မစတင်နိုင်
- Image pull အမှားများ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. Docker build ကို ဒေသတွင်းတွင် စမ်းသပ်ပါ
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Container logs ကို စစ်ဆေးပါ
azd logs --service api --follow

# 3. Container registry access ကို အတည်ပြုပါ
az acr login --name myregistry

# 4. Container app configuration ကို စစ်ဆေးပါ
az containerapp show --name my-app --resource-group my-rg
```

### ပြဿနာ: Database ချိတ်ဆက်မှုမအောင်မြင်မှုများ
**လက္ခဏာများ:**
- အပလီကေးရှင်းသည် database နှင့် ချိတ်ဆက်၍မရ
- Connection timeout အမှားများ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. ဒေတာဘေ့စ်ဖိုင်ဝေါလ်စည်းမျဉ်းများကိုစစ်ဆေးပါ။
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. အက်ပလီကေးရှင်းမှချိတ်ဆက်မှုကိုစမ်းသပ်ပါ။
# သင့်အက်ပလီကေးရှင်းတွင်ယာယီထည့်ပါ။
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. ချိတ်ဆက်မှု string ပုံစံကိုအတည်ပြုပါ။
azd env get-values | grep DATABASE

# 4. ဒေတာဘေ့စ် server အခြေအနေကိုစစ်ဆေးပါ။
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 ဖွဲ့စည်းမှုဆိုင်ရာ ပြဿနာများ

### ပြဿနာ: Environment variables မအလုပ်လုပ်ခြင်း
**လက္ခဏာများ:**
- App သည် ဖွဲ့စည်းမှုတန်ဖိုးများကို မဖတ်နိုင်
- Environment variables သည် အလွတ်ဖြစ်နေသည်

**ဖြေရှင်းနည်းများ:**
```bash
# 1. ပတ်ဝန်းကျင်အပြောင်းအလဲများကို သတ်မှတ်ထားသည်ကို အတည်ပြုပါ
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml ထဲမှာ အပြောင်းအလဲအမည်များကို စစ်ဆေးပါ
cat azure.yaml | grep -A 5 env:

# 3. အက်ပလီကေးရှင်းကို ပြန်လည်စတင်ပါ
azd deploy --service web

# 4. အက်ပလီကေးရှင်းဝန်ဆောင်မှုဖွဲ့စည်းမှုကို စစ်ဆေးပါ
az webapp config appsettings list --name myapp --resource-group myrg
```

### ပြဿနာ: SSL/TLS လက်မှတ်ပြဿနာများ
**လက္ခဏာများ:**
- HTTPS မအလုပ်လုပ်
- လက်မှတ်အတည်ပြုမှုအမှားများ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. SSL လက်မှတ်အခြေအနေကို စစ်ဆေးပါ
az webapp config ssl list --resource-group myrg

# 2. HTTPS သာလျှင် ဖွင့်ပါ
az webapp update --name myapp --resource-group myrg --https-only true

# 3. လိုအပ်ပါက စိတ်ကြိုက် ဒိုမိန်း ထည့်ပါ
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### ပြဿနာ: CORS ဖွဲ့စည်းမှုပြဿနာများ
**လက္ခဏာများ:**
- Frontend သည် API ကို ခေါ်၍မရ
- Cross-origin request ပိတ်ဆို့ခြင်း

**ဖြေရှင်းနည်းများ:**
```bash
# 1. App Service အတွက် CORS ကို Configure လုပ်ပါ
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS ကို ကိုင်တွယ်ရန် API ကို Update လုပ်ပါ
# Express.js တွင်:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. မှန်ကန်သော URL များပေါ်တွင် run နေသည်ကို စစ်ဆေးပါ
azd show
```

## 🌍 ပတ်ဝန်းကျင်စီမံခန့်ခွဲမှုပြဿနာများ

### ပြဿနာ: ပတ်ဝန်းကျင်ပြောင်းလဲမှုပြဿနာများ
**လက္ခဏာများ:**
- မှားသောပတ်ဝန်းကျင်ကို အသုံးပြုနေသည်
- ဖွဲ့စည်းမှုမမှန်ကန်စွာပြောင်းလဲခြင်း

**ဖြေရှင်းနည်းများ:**
```bash
# 1. ပတ်ဝန်းကျင်အားလုံးကို စာရင်းပြုစုပါ။
azd env list

# 2. ပတ်ဝန်းကျင်ကို တိကျစွာ ရွေးချယ်ပါ။
azd env select production

# 3. လက်ရှိပတ်ဝန်းကျင်ကို အတည်ပြုပါ။
azd env show

# 4. ပတ်ဝန်းကျင်ပျက်စီးနေပါက အသစ်တစ်ခု ဖန်တီးပါ။
azd env new production-new
azd env select production-new
```

### ပြဿနာ: ပတ်ဝန်းကျင်ပျက်စီးမှု
**လက္ခဏာများ:**
- ပတ်ဝန်းကျင်သည် မမှန်ကန်သောအခြေအနေကို ပြသနေသည်
- Resource များသည် ဖွဲ့စည်းမှုနှင့် မကိုက်ညီ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. ပတ်ဝန်းကျင်အခြေအနေကို ပြန်လည်အသစ်လုပ်ပါ
azd env refresh

# 2. ပတ်ဝန်းကျင် configuration ကို ပြန်လည်ပြင်ဆင်ပါ
azd env new production-reset
# လိုအပ်သော ပတ်ဝန်းကျင် variables များကို ကူးယူပါ
azd env set DATABASE_URL "your-value"

# 3. ရှိပြီးသား resources များကို (ဖြစ်နိုင်လျှင်) တင်သွင်းပါ
# .azure/production/config.json ကို resource IDs ဖြင့် လက်ဖြင့် ပြင်ဆင်ပါ
```

## 🔍 စွမ်းဆောင်ရည်ပြဿနာများ

### ပြဿနာ: တင်သွင်းမှုအချိန်များနှေးကွေးခြင်း
**လက္ခဏာများ:**
- တင်သွင်းမှုများ အချိန်ကြာနေသည်
- တင်သွင်းမှုအတွင်း timeout ဖြစ်ခြင်း

**ဖြေရှင်းနည်းများ:**
```bash
# 1. အပြိုင်အဆိုင် deployment ကိုဖွင့်ပါ
azd config set deploy.parallelism 5

# 2. တိုးတက်မှု deployment များကိုအသုံးပြုပါ
azd deploy --incremental

# 3. Build လုပ်ငန်းစဉ်ကိုအကောင်းဆုံးဖြစ်အောင်လုပ်ပါ
# package.json တွင်:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. အရင်းအမြစ်တည်နေရာများကိုစစ်ဆေးပါ (တည်နေရာတူညီသောကိုအသုံးပြုပါ)
azd config set defaults.location eastus2
```

### ပြဿနာ: အပလီကေးရှင်းစွမ်းဆောင်ရည်ပြဿနာများ
**လက္ခဏာများ:**
- တုံ့ပြန်မှုအချိန်များနှေးကွေး
- အရင်းအမြစ်အသုံးပြုမှုများမြင့်မား

**ဖြေရှင်းနည်းများ:**
```bash
# 1. အရင်းအမြစ်များကို တိုးချဲ့ပါ
# main.parameters.json တွင် SKU ကို အပ်ဒိတ်လုပ်ပါ
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights monitoring ကို ဖွင့်ပါ
azd monitor

# 3. bottlenecks များအတွက် application logs ကို စစ်ဆေးပါ
azd logs --service api --follow

# 4. caching ကို အကောင်အထည်ဖော်ပါ
# သင့်အခြေခံအဆောက်အအုံတွင် Redis cache ကို ထည့်ပါ
```

## 🛠️ Troubleshooting Tools and Commands

### Debug Commands
```bash
# အကျယ်အဝန်း အမှားရှာဖွေခြင်း
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# စနစ်အချက်အလက်ကို စစ်ဆေးပါ
azd info

# ဖွဲ့စည်းမှုကို အတည်ပြုပါ
azd config validate

# ချိတ်ဆက်မှုကို စမ်းသပ်ပါ
curl -v https://myapp.azurewebsites.net/health
```

### Log Analysis
```bash
# အက်ပ်လီကေးရှင်း မှတ်တမ်းများ
azd logs --service web --follow
azd logs --service api --since 1h

# Azure အရင်းအမြစ် မှတ်တမ်းများ
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# ကွန်တိန်နာ မှတ်တမ်းများ (Container Apps အတွက်)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Resource Investigation
```bash
# အရင်းအမြစ်အားလုံးကို စာရင်းပြုစုပါ
az resource list --resource-group myrg -o table

# အရင်းအမြစ်အခြေအနေကို စစ်ဆေးပါ
az webapp show --name myapp --resource-group myrg --query state

# နက်ဝက်ကွန်ရက် ဒိုင်ယာဂနိုစစ်
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 အပိုဆောင်းအကူအညီရယူခြင်း

### ဘယ်အချိန်မှာ Escalate လုပ်မလဲ
- အတည်ပြုခြင်းပြဿနာများကို ဖြေရှင်းနည်းအားလုံးကို စမ်းသပ်ပြီးနောက်လည်း ဆက်လက်ဖြစ်ပေါ်နေပါက
- Azure ဝန်ဆောင်မှုများနှင့် ပတ်သက်သော အခြေခံအဆောက်အအုံပြဿနာများ
- ငွေတောင်းခံမှု သို့မဟုတ် subscription ဆိုင်ရာ ပြဿနာများ
- လုံခြုံရေးပတ်သက်သော စိုးရိမ်မှုများ သို့မဟုတ် ဖြစ်ရပ်များ

### အကူအညီရယူရန် လမ်းကြောင်းများ
```bash
# ၁။ Azure Service Health ကိုစစ်ဆေးပါ
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# ၂။ Azure အထောက်အပံ့လက်မှတ်တစ်ခုဖန်တီးပါ
# https://portal.azure.com -> Help + support သို့သွားပါ

# ၃။ အသိုင်းအဝိုင်းအရင်းအမြစ်များ
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### အကူအညီမတိုင်မီ စုဆောင်းရန်အချက်အလက်များ
- `azd version` output
- `azd info` output
- အမှားစာသားများ (အပြည့်အစုံ)
- ပြဿနာကို ထပ်မံဖြစ်ပေါ်စေသော အဆင့်များ
- ပတ်ဝန်းကျင်အသေးစိတ် (`azd env show`)
- ပြဿနာစတင်ဖြစ်ပေါ်ချိန်

### Log Collection Script
```bash
#!/bin/bash
# debug အချက်အလက်များစုဆောင်းရန် script။

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 ပြဿနာကာကွယ်ခြင်း

### Pre-deployment Checklist
```bash
# ၁။ အတည်ပြုခြင်းကို အတည်ပြုပါ။
az account show

# ၂။ အပိုင်းနှင့် အကန့်အသတ်များကို စစ်ဆေးပါ။
az vm list-usage --location eastus2

# ၃။ အဆောင်အအုံများကို အတည်ပြုပါ။
az bicep build --file infra/main.bicep

# ၄။ ဒေသတွင်းတွင် ပထမဦးဆုံး စမ်းသပ်ပါ။
npm run build
npm run test

# ၅။ အခြေခံစမ်းသပ်ဖြန့်ဝေမှုများကို အသုံးပြုပါ။
azd provision --preview
```

### Monitoring Setup
```bash
# အက်ပလီကေးရှင်းအိုင်ဆိုက်များကိုဖွင့်ပါ
# main.bicep တွင်ထည့်ပါ:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# အချက်ပေးသတိပေးချက်များကိုစီစဉ်ပါ
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Regular Maintenance
```bash
# အပတ်စဉ် ကျန်းမာရေး စစ်ဆေးမှုများ
./scripts/health-check.sh

# လစဉ် ကုန်ကျစရိတ် ပြန်လည်သုံးသပ်မှု
az consumption usage list --billing-period-name 202401

# သုံးလတစ်ကြိမ် လုံခြုံရေး ပြန်လည်သုံးသပ်မှု
az security assessment list --resource-group myrg
```

## ဆက်စပ်အရင်းအမြစ်များ

- [Debugging Guide](debugging.md) - အဆင့်မြင့် debugging နည်းလမ်းများ
- [Provisioning Resources](../deployment/provisioning.md) - အခြေခံအဆောက်အအုံပြဿနာရှာဖွေမှု
- [Capacity Planning](../pre-deployment/capacity-planning.md) - အရင်းအမြစ်စီမံခန့်ခွဲမှုလမ်းညွှန်
- [SKU Selection](../pre-deployment/sku-selection.md) - ဝန်ဆောင်မှုအဆင့်အတန်းအကြံပြုချက်များ

---

**အကြံပြုချက်**: ဒီလမ်းညွှန်ကို Bookmark ထားပြီး ပြဿနာများကြုံတွေ့သောအခါ အမြဲပြန်လည်ကြည့်ရှုပါ။ အများစုသောပြဿနာများသည် ယခင်ကတွေ့ဖူးပြီးဖြေရှင်းနည်းများရှိပြီးသားဖြစ်သည်။

---

**အခန်းအကြောင်းအရာများ**
- **ယခင်သင်ခန်းစာ**: [Provisioning Resources](../deployment/provisioning.md)
- **နောက်သင်ခန်းစာ**: [Debugging Guide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->