# သာမန် ပြဿနာများနှင့် ဖြေရှင်းနည်းများ

**အခန်း သွားကြည့်ခြင်း:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 ယခု အခန်း**: အခန်း ၇ - ပြဿနာရှာဖွေခြင်းနှင့် ဒက်ဘဂ်
- **⬅️ ယခင် အခန်း**: [Chapter 6: Pre-flight Checks](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ နောက်တစ်ခု**: [Debugging Guide](debugging.md)
- **🚀 နောက်ထပ် အခန်း**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## နိဒါန်း

Azure Developer CLI အသုံးပြုစဉ်တွင် တွေ့ကြုံရသော အများဆုံး ပြဿနာများကို ဒီစုံလင်သော ပြဿနာရှာဖွေရေးလမ်းညွှန်တွင် ဖော်ပြထားသည်။ အတည်ပြုရေး၊ တင်သွင်းမှု၊ အခြေခံအဆောက်အအုံ ပံ့ပိုးပေးခြင်းနှင့် အက်ပလီကေးရှင်း ဖော်မြူလာဆိုင်ရာ ပြဿနာများကို ရှာဖွေခြင်း၊ ချို့ယွင်းချက် ရှာဖွေပြီး ဖြေရှင်းနည်းများကို လေ့လာနိုင်မည်ဖြစ်သည်။ အချို့ပြဿနာများအတွက် လက္ခဏာများ၊ အကြောင်းရင်းများနှင့် အဆင့်လိုက် ဖြေရှင်းနည်းများ ပါဝင်သည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဤလမ်းညွှန်ကို ပြီးစီးပါက သင်သည်:
- Azure Developer CLI ပြဿနာများအတွက် ရှာဖွေကောက်ချက် နည်းပညာများကို ကျွမ်းကျင်နိုင်မည်
- အတည်ပြုရေးနှင့် ခွင့်ပြုချက်ဆိုင်ရာ ပုံမှန်ပြဿနာများနှင့် ၎င်းတို့၏ ဖြေရှင်းနည်းများကို နားလည်မည်
- တင်သွင်းမှု မအောင်မြင်မှုများ၊ အဆောက်အအုံ ပံ့ပိုးပေးမှု အမှားများနှင့် ဖော်မြူလာအပြဿနာများကို ဖြေရှင်းနိုင်မည်
- ကြိုတင် ကြည့်ရှုခြင်းနှင့် ဒက်ဘဂ်မင်း များကို အကောင်အထည်ဖော်နိုင်မည်
- စ複雑 ပြဿနာများအတွက် စနစ်တကျ ပြဿနာရှာဖွေရေး များကို အသုံးပြုနိုင်မည်
- အစီအစဉ်အတွက် မှတ်တမ်းရေးခြင်းနှင့် ကြည့်ရႈစစ်ဆေးမှု ကို သတ်မှတ်ပြီး အနာဂတ် ပြဿနာများကို ကာကွယ်နိုင်မည်

## သင်ယူပြီးရလဒ်များ

ပြီးဆုံးတဲ့အချိန်မှာ သင်သည်:
- Azure Developer CLI ပြဿနာများကို တည်ဆောက်ပြီး ထိတွေ့စစ်ဆေးနိုင်မည်
- အတည်ပြုရေး၊ subscription နှင့် ခွင့်ပြုချက်ဆိုင်ရာ ပြဿနာများကို ကိုယ်တိုင် ဖြေရှင်းနိုင်မည်
- တင်သွင်းမှုပျက်ကွက်မှုများနှင့် အဆောက်အအုံ ပံ့ပိုးမှု အမှားများကို ထိရောက်စွာ ရှာဖွေဖြေရှင်းနိုင်မည်
- အက်ပလီကေးရှင်း ဖော်မြူလာဆိုင်ရာ ပြဿနာများနှင့် ပတ်ဝန်းကျင် အထူးပြဿနာများကို ဒက်ဘတ်နိုင်မည်
- ဖြစ်နိုင်ဆိုးမှုများကို ကြိုတင်ဖော်ထုတ်ရန် မှတ်တမ်းရေးနှင့် အချက်ပေးစနစ်များ ထားရှိနိုင်မည်
- မှတ်တမ်းရေး၊ ဒက်ဘတ်နှင့် ပြဿနာဖြေရှင်းခြင်း လေ့ကျင့်ပုံများအတွက် အကောင်းဆုံး ဆောင်ရွက်နည်းများကို အသုံးချနိုင်မည်

## အမြန် စစ်ဆေးရန်

အထူးပြဿနာများသို့ ဝင်မီ မှတ်တမ်းအချက်အလက်စုဆောင်းရန် အောက်ပါ အမိန့်များကို ပြေးပါ:

```bash
# azd ရဲ့ ဗားရှင်းနှင့် စနစ်အခြေနေကို စစ်ဆေးပါ
azd version
azd config show

# Azure အတည်ပြုမှုကို စစ်ဆေးပါ
az account show
az account list

# လက်ရှိ ပတ်ဝန်းကျင်ကို စစ်ဆေးပါ
azd env list
azd env get-values

# debug မှတ်တမ်းရေးကို ဖွင့်ပါ
export AZD_DEBUG=true
azd <command> --debug
```

## အတည်ပြုရေးဆိုင်ရာ ပြဿနာများ

### ပြဿနာ: "Failed to get access token"
**လက္ခဏာများ:**
- `azd up` သည် အတည်ပြုရေး အမှားများဖြင့် မအောင်မြင်နိုင်ပါ
- Commands သည် "unauthorized" သို့မဟုတ် "access denied" ပြန်လာနိုင်သည်

**ဖြေရှင်းနည်းများ:**
```bash
# 1. Azure CLI ဖြင့် ထပ်မံ အတည်ပြုပါ
az login
az account show

# 2. ကက်ရှ်ထဲရှိ အတည်ပြုချက်များ ဖယ်ရှားပါ
az account clear
az login

# 3. device code flow ကို အသုံးပြုပါ (GUI မရှိသော စနစ်များအတွက်)
az login --use-device-code

# 4. အတိအကျ subscription ကို သတ်မှတ်ပါ
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### ပြဿနာ: တင်သွင်းမှု ဆောင်ရွက်ရာတွင် "Insufficient privileges"
**လက္ခဏာများ:**
- တင်သွင်းမှုများသည် ခွင့်ပြုချက် အမှားများကြောင့် မအောင်မြင်ပါ
- အချို့ Azure အရင်းအမြစ်များကို ဖန်တီး၍ မရနိုင်ပါ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. သင့် Azure အခန်းကဏ္ဍ အပ်နှံမှုများကို စစ်ဆေးပါ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. သင့်တွင် လိုအပ်သော အခန်းကဏ္ဍများ ရှိကြောင်း သေချာစေပါ
# - Contributor (အရင်းအမြစ် ဖန်တီးရန်)
# - User Access Administrator (အခန်းကဏ္ဍ အပ်နှံမှုများအတွက်)

# 3. မှန်ကန်သော ခွင့်ပြုခွင့်များ ရရှိရန် သင့် Azure အုပ်ချုပ်သူအား ဆက်သွယ်ပါ
```

### ပြဿနာ: Multi-tenant အတည်ပြုရေး ပြဿနာများ
**ဖြေရှင်းနည်းများ:**
```bash
# 1. သတ်မှတ်ထားသော တီနန်ဖြင့် အကောင့်ဝင်ပါ
az login --tenant "your-tenant-id"

# 2. ဆက်တင်များတွင် တီနန်ကို သတ်မှတ်ပါ
azd config set auth.tenantId "your-tenant-id"

# 3. တီနန်များကို ပြောင်းလဲနေပါက တီနန် ကက်ရှ်ကို ဖျက်ပါ
az account clear
```

## 🏗️ အဆောက်အအုံ ပံ့ပိုးမှုပြဿနာများ

### ပြဿနာ: အရင်းအမြစ် နာမည် ဆန့်ကျင်မှု
**လက္ခဏာများ:**
- "The resource name already exists" အမှားများကို တွေ့ရသည်
- အရင်းအမြစ် ဖန်တီးစဉ် တင်သွင်းမှု မအောင်မြင်ပါ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. token များဖြင့် ထူးခြားသော အရင်းအမြစ်နာမည်များကို အသုံးပြုပါ
# သင်၏ Bicep template တွင်:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. ပတ်ဝန်းကျင် အမည်ကို ပြောင်းပါ
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. ရှိပြီးသား အရင်းအမြစ်များကို ရှင်းလင်းပါ
azd down --force --purge
```

### ပြဿနာ: တည်နေရာ/တည်ဒေသ မရရှိနိုင်ခြင်း
**လက္ခဏာများ:**
- "The location 'xyz' is not available for resource type" ကဲ့သို့ အမှားများ
- ရွေးချယ်ထားသည့် ဒေသ၌ အချို့ SKU များ မရရှိနိုင်ပါ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. အရင်းအမြစ်အမျိုးအစားများအတွက် ရရှိနိုင်သော တည်နေရာများကို စစ်ဆေးပါ
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. ပုံမှန် ရရှိနိုင်သော ဒေသများကို အသုံးပြုပါ
azd config set defaults.location eastus2
# သို့မဟုတ်
azd env set AZURE_LOCATION eastus2

# 3. ဒေသအလိုက် ဝန်ဆောင်မှု ရရှိနိုင်မှုကို စစ်ဆေးပါ
# သွားရောက်ကြည့်ပါ: https://azure.microsoft.com/global-infrastructure/services/
```

### ပြဿနာ: Quota ကျော်လွန်မှု အမှားများ
**လက္ခဏာများ:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**ဖြေရှင်းနည်းများ:**
```bash
# 1. လက်ရှိ ကော်တာ အသုံးပြုမှုကို စစ်ဆေးပါ
az vm list-usage --location eastus2 -o table

# 2. Azure portal မှတဆင့် ကော်တာ တိုးမြှင့်ရန် တောင်းဆိုပါ
# သို့ သွားပါ: Subscriptions > Usage + quotas

# 3. ဖွံ့ဖြိုးရေးအတွက် အသေးသည့် SKU များကို အသုံးပြုပါ
# main.parameters.json တွင်:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. မအသုံးပြုသော အရင်းအမြစ်များကို ရှင်းလင်းပါ
az resource list --query "[?contains(name, 'unused')]" -o table
```

### ပြဿနာ: Bicep ဖိုင် အမှားများ
**လက္ခဏာများ:**
- နမူနာ စစ်ဆေးမှု မအောင်မြင်ခြင်း
- Bicep ဖိုင်များတွင် သင်္ကေတ အမှားများ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. Bicep စာရိုက်ပုံစံကို အတည်ပြုပါ
az bicep build --file infra/main.bicep

# 2. Bicep linter ကို အသုံးပြုပါ
az bicep lint --file infra/main.bicep

# 3. ပါရာမီတာ ဖိုင်၏ စာရိုက်ပုံစံကို စစ်ဆေးပါ
cat infra/main.parameters.json | jq '.'

# 4. တပ်ဆင်မှု၏ ပြောင်းလဲမှုများကို ကြိုတင် ကြည့်ရှုပါ
azd provision --preview
```

## 🚀 တင်သွင်းမှု မအောင်မြင်ခြင်းများ

### ပြဿနာ: Build မအောင်မြင်ခြင်း
**လက္ခဏာများ:**
- တင်သွင်းစဉ် အက်ပလီကေးရှင်း တည်ဆောက်မှု မအောင်မြင်ပါ
- Package 설치 အမှားများ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. debug flag ကို ဖွင့်ပြီး build အထွက်ကို စစ်ဆေးပါ
azd deploy --service web --debug

# 2. တပ်ဆင်ထားသော ဝန်ဆောင်မှု၏ အခြေအနေကို ကြည့်ပါ
azd show

# 3. build ကို ကိုယ်ပိုင်စက်တွင် စမ်းသပ်ပါ
cd src/web
npm install
npm run build

# 3. Node.js/Python ဗားရှင်းလိုက်ဖက်မှုကို စစ်ဆေးပါ
node --version  # azure.yaml ဆက်တင်များနှင့် ကိုက်ညီရမည်
python --version

# 4. build cache ကို ရှင်းလင်းပါ
rm -rf node_modules package-lock.json
npm install

# 5. container များ အသုံးပြုပါက Dockerfile ကို စစ်ဆေးပါ
docker build -t test-image .
docker run --rm test-image
```

### ပြဿနာ: ကွန်တိန်နာ တင်သွင်းမှု မအောင်မြင်ခြင်း
**လက္ခဏာများ:**
- Container apps မစတင်နိုင်ခြင်း
- Image pull အမှားများ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. Docker build ကို ကိုယ်ပိုင်စက်တွင် စမ်းသပ်ပါ
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI ကို အသုံးပြုပြီး ကွန်တိန်နာ မှတ်တမ်းများကို စစ်ဆေးပါ
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd မှတဆင့် အပလီကေးရှင်းကို စောင့်ကြည့်ပါ
azd monitor --logs

# 3. Container registry သို့ ဝင်ရောက်ခွင့်ကို အတည်ပြုပါ
az acr login --name myregistry

# 4. ကွန်တိန်နာ အက်ပ် ဖွဲ့စည်းပုံကို စစ်ဆေးပါ
az containerapp show --name my-app --resource-group my-rg
```

### ပြဿနာ: ဒေတာဘေ့စ် ချိတ်ဆက် မအောင်မြင်ခြင်း
**လက္ခဏာများ:**
- အက်ပလီကေးရှင်းသည် ဒေတာဘေ့စ်နှင့် ချိတ်ဆက်၍ မရနိုင်ခြင်း
- ချိတ်ဆက်ချိန် ကုန်ဆုံးသည့် အချိန်ပြတ် (timeout) အမှားများ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. ဒေတာဘေ့စ်၏ Firewall စည်းမျဉ်းများကို စစ်ဆေးပါ
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. အက်ပလီကေးရှင်းမှ ချိတ်ဆက်နိုင်မှုကို စမ်းသပ်ပါ
# သင့်အက်ပလီကေးရှင်းတွင် ယာယီ ထည့်ပါ:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. connection string ပုံစံကို မှန်ကန်ကြောင်း စစ်ဆေးပါ
azd env get-values | grep DATABASE

# 4. ဒေတာဘေ့စ် ဆာဗာ၏ အခြေအနေကို စစ်ဆေးပါ
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 ဖော်မြူရေးမှု ပြဿနာများ

### ပြဿနာ: ပတ်ဝန်းကျင် တန်ဖိုးများ (Environment variables) မအလုပ်လုပ်ခြင်း
**လက္ခဏာများ:**
- အက်ပလီကေးရှင်းသည် ဖော်မြူရေး တန်ဖိုးများ ဖတ်၍ မရနိုင်ခြင်း
- ပတ်ဝန်းကျင် တန်ဖိုးများ ဗလာ များကြည့်ရသည်

**ဖြေရှင်းနည်းများ:**
```bash
# 1. ပတ်ဝန်းကျင် အမျိုးအစားများ (environment variables) သတ်မှတ်ထားကြောင်း စစ်ဆေးပါ
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml ဖိုင်အတွင်းရှိ ပြောင်းလဲနိုင်သော တန်ဖိုး (variables) များ၏ အမည်များကို စစ်ဆေးပါ
cat azure.yaml | grep -A 5 env:

# 3. အပလီကေးရှင်းကို ပြန်လည် စတင်ပါ
azd deploy --service web

# 4. App Service ၏ ဖွဲ့စည်းပုံ (configuration) ကို စစ်ဆေးပါ
az webapp config appsettings list --name myapp --resource-group myrg
```

### ပြဿနာ: SSL/TLS လက်မှတ်ပြဿနာများ
**လက္ခဏာများ:**
- HTTPS မလုပ်ဆောင်ခြင်း
- လက်မှတ် တရားဝင်စစ်ဆေးမှု အမှားများ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. SSL လက်မှတ်၏ အခြေအနေကို စစ်ဆေးပါ
az webapp config ssl list --resource-group myrg

# 2. HTTPS သာ အသုံးပြုရန် ဖွင့်ပါ
az webapp update --name myapp --resource-group myrg --https-only true

# 3. လိုအပ်ပါက ကိုယ်ပိုင် ဒိုမိန်းကို ထည့်ပါ
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### ပြဿနာ: CORS ဖော်မြူရေး ပြဿနာများ
**လက္ခဏာများ:**
- Frontend သည် API ကို ခေါ်ယူ၍ မရခြင်း
- Cross-origin request ပိတ်ဆိုင်းခံရခြင်း

**ဖြေရှင်းနည်းများ:**
```bash
# 1. App Service အတွက် CORS ကို ဖွဲ့စည်းပါ
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. API ကို CORS ကိုင်တွယ်နိုင်အောင် အပ်ဒိတ်ပြုလုပ်ပါ
# Express.js တွင်:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. မှန်ကန်သော URL များပေါ်တွင် လည်ပတ်နေသည်ကို စစ်ဆေးပါ
azd show
```

## 🌍 ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှုပြဿနာများ

### ပြဿနာ: ပတ်ဝန်းကျင် ပြောင်းရွှေ့ခြင်း ပြဿနာများ
**လက္ခဏာများ:**
- မှားသော ပတ်ဝန်းကျင်ကို အသုံးပြုနေခြင်း
- ဖော်မြူရေး မပြောင်းလဲခြင်း

**ဖြေရှင်းနည်းများ:**
```bash
# 1. ရရှိနိုင်သည့် ပတ်ဝန်းကျင်များအားလုံးကို စာရင်းပြုစုရန်
azd env list

# 2. ပတ်ဝန်းကျင်ကို အတိအကျ ရွေးချယ်ရန်
azd env select production

# 3. လက်ရှိ ပတ်ဝန်းကျင်ကို စစ်ဆေးရန်
azd env list

# 4. ပျက်စီးနေပါက အသစ် ပတ်ဝန်းကျင် တစ်ခု ဖန်တီးရန်
azd env new production-new
azd env select production-new
```

### ပြဿနာ: ပတ်ဝန်းကျင် ပျက်စီးခြင်း
**လက္ခဏာများ:**
- ပတ်ဝန်းကျင် မြင်ကွင်းတွင် အတားအဆီး အခြေအနေပြသခြင်း
- အရင်းအမြစ်များနှင့် ဖော်မြူရေး မကိုက်ညီခြင်း

**ဖြေရှင်းနည်းများ:**
```bash
# 1. ပတ်ဝန်းကျင်၏ အခြေအနေကို ပြန်လည်အသစ်ပြုလုပ်ပါ
azd env refresh

# 2. ပတ်ဝန်းကျင်ဖော်ပြချက်များကို ပြန်လည်ပြင်သတ်မှတ်ပါ
azd env new production-reset
# လိုအပ်သော environment variables များကို ကူးယူထည့်ပါ
azd env set DATABASE_URL "your-value"

# 3. ရနိုင်လျှင် ရှိပြီးသား အရင်းအမြစ်များကို ထည့်သွင်းပါ
# .azure/production/config.json ကို အရင်းအမြစ် ID များဖြင့် လက်ဖြင့် အပ်ဒိတ်လုပ်ပါ
```

## 🔍 စွမ်းဆောင်ရည် ဆိုင်ရာ ပြဿနာများ

### ပြဿနာ: တင်သွင်းမှု ကြာရှည်ချိန်
**လက္ခဏာများ:**
- Deploy များ အချိန် ကြာမြင့်နေခြင်း
- တင်သွင်းစဉ် အချိန်ကုန်ဆုံးခြင်း (timeouts)

**ဖြေရှင်းနည်းများ:**
```bash
# 1. အမြန် အကြိမ်ကြိမ် ပြင်ဆင်မှုများအတွက် ဝန်ဆောင်မှုများကို သီးသန့် တပ်ဆင်ပါ
azd deploy --service web
azd deploy --service api

# 2. အောက်ခံအဆောက်အအုံ မပြောင်းလဲပါက ကုဒ်ပဲ ဖြင့် တပ်ဆင်ပါ
azd deploy  # azd up ထက် ပိုမိုလျင်မြန်သည်

# 3. ဆောက်လုပ်ခြင်း လုပ်ငန်းစဉ်ကို အကောင်းဆုံး တိုးတက်အောင် ပြင်ဆင်ပါ
# package.json တွင်:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. အရင်းအမြစ်တည်နေရာများကို စစ်ဆေးပါ (တူညီသော ဒေသကို အသုံးပြုပါ)
azd config set defaults.location eastus2
```

### ပြဿနာ: အက်ပလီကေးရှင်း စွမ်းဆောင်ရည် ပြဿနာများ
**လက္ခဏာများ:**
- တုံ့ပြန်မှု နှေးကာခြင်း
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

# 3. Azure တွင် အပလီကေးရှင်းလော့ဂ်များကို စစ်ဆေးပါ
az webapp log tail --name myapp --resource-group myrg
# သို့မဟုတ် Container Apps အတွက်:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. ကက်ရှ်ကို အကောင်အထည်ဖော်ပါ
# သင့်အဆောက်အအုံတွင် Redis cache ကို ထည့်ပါ
```

## 🛠️ ပြဿနာရှာဖွေရေး ကိရိယာများနှင့် အမိန့်များ

### ဒက်ဘတ် အမိန့်များ
```bash
# ကျယ်ပြန့်စုံလင်သော အမှားရှာဖွေရေး
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd ဗားရှင်းကို စစ်ဆေးပါ
azd version

# လက်ရှိ ဖွဲ့စည်းမှုကို ကြည့်ပါ
azd config show

# ချိတ်ဆက်နိုင်မှုကို စမ်းသပ်ပါ
curl -v https://myapp.azurewebsites.net/health
```

### လော့ဂ် သုံးသပ်မှု
```bash
# Azure CLI ဖြင့် အက်ပလီကေးရှင်း လော့ဂ်များ
az webapp log tail --name myapp --resource-group myrg

# azd ဖြင့် အက်ပလီကေးရှင်း စောင့်ကြည့်ခြင်း
azd monitor --logs
azd monitor --live

# Azure အရင်းအမြစ် လော့ဂ်များ
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container Apps အတွက် ကွန်တိန်နာ လော့ဂ်များ
az containerapp logs show --name myapp --resource-group myrg --follow
```

### အရင်းအမြစ် စုံစမ်းစစ်ဆေးမှု
```bash
# ရင်းမြစ်အားလုံးကို စာရင်းပြပါ
az resource list --resource-group myrg -o table

# ရင်းမြစ်အခြေအနေကို စစ်ဆေးပါ
az webapp show --name myapp --resource-group myrg --query state

# ကွန်ယက် စစ်ဆေးခြင်း
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 ထပ်မံ အကူအညီ ရယူခြင်း

### ဘယ်အချိန်မှာ မျှတစွာ အထောက်အပံ့ တောင်းရန်
- အတည်ပြုရေး ပြဿနာများသည် စောင့်ကြည့်ပြီးလည်း မဖြေရှင်းနိုင်သေးသော အချိန်
- Azure ဝန်ဆောင်မှုများနှင့် ဆိုင်သော အဆောက်အအုံ ပြဿနာများ
- ဘီလ်နှင့် subscription ဆိုင်ရာ ပြဿနာများ
- လုံခြုံရေး ပူပန်ချက်များ သို့မဟုတ် လုပ်ရပ်မမှန်သော အဖြစ်အပျက်များ

### ထောက်ပံ့ရေး လမ်းကြောင်းများ
```bash
# 1. Azure Service Health ကို စစ်ဆေးပါ
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure အထောက်အပံ့ တောင်းဆိုချက် တစ်ခု ဖန်တီးပါ
# သွားပါ: https://portal.azure.com -> အကူအညီ + အထောက်အပံ့

# 3. အသိုင်းအဝိုင်း အရင်းအမြစ်များ
# - Stack Overflow: azure-developer-cli အတံဆိပ်
# - GitHub ပြဿနာများ: https://github.com/Azure/azure-dev/issues
# - Microsoft မေးမြန်းမှုနှင့် ဖြေကြားချက်များ: https://learn.microsoft.com/en-us/answers/
```

### စုဆောင်းရန် အချက်အလက်များ
Support ဆက်သွယ်မတိုင်ခင် အောက်ပါအချက်အလက်များကို စုရပါ:
- `azd version` output
- `azd config show` output
- `azd show` output (ယခု တင်သွင်းမှု အခြေအနေ)
- အမှားမက်ဆေ့ခ်ျများ (ပြည့်စုံ)
- ပြဿနာကို ထပ်မံ ပြန်လုပ်ဖြည့်စမ်းရန် ခြေလှမ်းများ
- ပတ်ဝန်းကျင် အသေးစိတ် (`azd env get-values`)
- ပြဿနာ စတင်ပေါ်ပေါက်ခဲ့သည့် အချိန်ဇယား

### လော့ဂ် စုဆောင်းရေး စကရစ်ပ်
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 ပြဿနာ ကာကွယ်ရေး

### ကြိုတင် တင်သွင်းမီ စစ်ဆေးစာရင်း
```bash
# 1. အတည်ပြုမှုကို စစ်ဆေးပါ
az account show

# 2. ခွင့်ပမာဏများနှင့် အကန့်အသတ်များကို စစ်ဆေးပါ
az vm list-usage --location eastus2

# 3. စံနမူနာများကို စစ်ဆေးပါ
az bicep build --file infra/main.bicep

# 4. ပထမဦးဆုံး မိမိစက်ပေါ်တွင် စမ်းသပ်ပါ
npm run build
npm run test

# 5. သေချာစမ်းသပ်မှု(dry-run) များကို အသုံးပြုပါ
azd provision --preview
```

### ကြည့်ကြပ်မှု စနစ် တပ်ဆင်ခြင်း
```bash
# Application Insights ကို ဖွင့်ပါ
# main.bicep ထဲသို့ ထည့်ပါ:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# အသိပေးချက်များကို တပ်ဆင်ပါ
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### ပုံမှန် ထိန်းသိမ်းမှု
```bash
# အပတ်စဉ် ကျန်းမာရေးစစ်ဆေးမှုများ
./scripts/health-check.sh

# လစဉ် ကုန်ကျစရိတ် ပြန်လည်သုံးသပ်ခြင်း
az consumption usage list --billing-period-name 202401

# သုံးလတစ်ကြိမ် လုံခြုံရေး ပြန်လည်သုံးသပ်ခြင်း
az security assessment list --resource-group myrg
```

## ဆက်စပ် အရင်းအမြစ်များ

- [Debugging Guide](debugging.md) - မြင့်မားသော ဒက်ဘဂ်နည်းလမ်းများ
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - အဆောက်အအုံ ပြဿနာရှာဖွေရေး
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - အရင်းအမြစ် စီမံကိန်း အကြံပေးချက်များ
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - ဝန်ဆောင်မှု အဆင့် များ အကြံပြုချက်များ

---

**အကြံပြုချက်**: ဤလမ်းညွှန်ကို ဘুকမတ် ထားပြီး ပြဿနာများ ကြုံတွေ့သည့်အချိန်တိုင်း ပြန်လည်ကြည့်ပါ။ များသော ပြဿနာများကို ယခင်က တွေ့ရှိပြီး ဖြစ်ပြီး ထိရောက်သော ဖြေရှင်းနည်းများ ရှိပြီးသားဖြစ်ပါသည်။

---

**သွားရောက်ကြည့်ရန်**
- **ယခင် သင်ခန်းစာ**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **နောက် သင်ခန်းစာ**: [Debugging Guide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာရွက်ကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှန်ကန်မှုမရှိသည့် အချက်များ ပါဝင်နိုင်ကြောင်း သိရှိထားပါ။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့် ရေးသားထားသော စာတမ်းကို အာဏာပိုင် အရင်းအမြစ်အဖြစ် ယူဆသင့်ပါသည်။ အရေးကြီးသော သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသား ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားမလည်မှုများ သို့မဟုတ် မမှန်ကန်စွာ အဓိပ္ပာယ်ဖော်ပြခြင်းများအတွက် ကျွန်ုပ်တို့တွင် တာဝန်မရှိပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->