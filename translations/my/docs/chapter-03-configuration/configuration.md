# ပြုပြင်မှု လမ်းညွှန်ချက်

**အခန်း လမ်းညွှန်ချက်:**
- **📚 သင်ခန်းစာ မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း ၃ - ပြုပြင်ခြင်း နှင့် အတည်ပြုခြင်း
- **⬅️ ယခင်**: [Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ နောက်တစ်ခု**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 နောက်အခန်း**: [အခန်း ၄: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## နိဒါန်း

> `azd 1.37.2` နှင့်ဆန့်ကျင်စစ်ဆေးပြီး အတည်ပြုသည် (နိုဝင်ဘာ 2026)။ Bash command များသည် initialized azd project တစ်ခုရှိကြောင်း တွက်ခန့်ထားသည်။ ဖိုင်တစ်ခုတည်းအနေဖြင့် ဖော်ပြမထားပါက YAML/Bicep snippet များမှာ project ဖိုင်နှင့်ကိုက်ညီသောနေရာများထဲသို့ ပေါင်းစပ်ရန် အပိုင်းအသေးစားများဖြစ်ပြီး၊ သီးခြား runnable projects မဟုတ်ပါ။

ဒီကျယ်ပြန့်သော လမ်းညွှန်သည် Azure Developer CLI ကို ထိရောက်သော ဖွံ့ဖြိုးတိုးတက်မှုနှင့် ထုတ်လုပ်မှုလုပ်ငန်းစဉ်များအတွက် အပြည့်ဝစွာ ဖော်ပြထားပါသည်။ သင်သည် configuration hierarchy, environment စီမံခန့်ခွဲမှု, authentication နည်းလမ်းများ နှင့် ထိရောက်ပြီးလုံခြုံသော Azure ထုတ်လုပ်မှုများအတွက် ခက်ခဲသော configuration ပုံစံများကို လေ့လာသိရှိကြမည်ဖြစ်သည်။

## သင်ယူရန်ရည်ရွယ်ချက်များ

ဒီသင်ခန်းစာ၏ အဆုံးသတ်အထိ သင်သည် -
- azd configuration hierarchy ကိုကျွမ်းကျင်မိ၍ စနစ်တက်တာ မှတ်တမ်းအားပေါ်အတိုင်း ဦးစားပေးထားမှုကို နားလည်ခြင်း
- နိုင်ငံတကာနှင့် project-သီးသန့် ဆက်တင်များကို ထိရောက်စွာ ပြင်ဆင်နိုင်ခြင်း
- configuration မျိုးစုံဖြင့် ပတ်ဝန်းကျင်များစွာကို စီမံနိုင်ခြင်း
- လုံခြုံ၍ authentication အခြေခံခြင်းနှင့် authorization ပုံစံများကို အကောင်အထည်ဖော်နိုင်ခြင်း
- ကွဲပြားပြီးခက်ခဲသော အခြေအနေများအတွက် advanced configuration ပုံစံများကို နားလည်ခြင်း

## သင်ယူပြီးရရှိမည့်ရလဒ်များ

ဒီသင်ခန်းစာကိုပြီးမြောက်ပြီးနောက်၊ သင့်မှာအောက်ပါအရာများပြုလုပ်နိုင်ပါလိမ့်မယ်။
- အကောင်းဆုံးဖွံ့ဖြိုးတိုးတက်မှုလုပ်ငန်းစဉ်များအတွက် azd ကိုစီမံခန့်ခွဲရန်
- deployment ပိုင်းဆိုင်ရာပတ်ဝန်းကျင်များစွာကို တပ်ဆင်ပြီးစီမံခန့်ခွဲရန်
- လုံခြုံစိတ်ချရသောစီမံခန့်ခွဲမှုလုပ်ထုံးလုပ်နည်းများကိုအကောင်အထည်ဖော်ရန်
- စီမံခန့်ခွဲမှုဆိုင်ရာပြဿနာများကို ဖြေရှင်းရန်
- အဖွဲ့အစည်းအသီးသီးလိုအပ်ချက်များအတွက် azd ကို စိတ်ကြိုက်ပြင်ဆင်ရန်

ဒီလမ်းညွှန်စာအုပ်အပြည့်အစုံမှာ Azure Developer CLI ကို အကောင်းဆုံးဖွံ့ဖြိုးတိုးတက်မှုနှင့် deployment လုပ်ငန်းစဉ်များအတွက် စီမံခန့်ခွဲခြင်း၏ အပိုင်းအားလုံးကို ဖုံးကွယ်တင်ပြထားသည်။

## azd ပရောဂျက်တွင် AI အေးဂျင့်များကိုနားလည်ခြင်း

သင်သည် AI အေးဂျင့်အသစ်ဖြစ်ပါက၊ azd ကမ္ဘာအတွင်း၌ သူတို့ကို တွေးမိရန် ရိုးရှင်းသောနည်းလမ်းအခုလိုရှိပါတယ်။

### အေးဂျင့် ဆိုတာဘာလဲ?

အေးဂျင့်သည် တောင်းဆိုမှုတစ်ခုကို လက်ခံနိုင်ပြီး၊ အကြောင်းအရာအပေါ်တွင်ဆန်းစစ်တုံ့ပြန်နိုင်ပြီး၊ လုပ်ဆောင်ချက်များကို ဖော်ဆောင်နိုင်သော ဆော့ဖ်ဝဲတစ်ချပ်ဖြစ်သည်။ အများအားဖြင့် AI မော်ဒယ်ကိုခေါ်ဆိုခြင်း၊ ဒေတာရှာဖွေခြင်း သို့မဟုတ် အခြားဝန်ဆောင်မှုများကို ခေါ်ယူခြင်းဖြင့် လုပ်ဆောင်သည်။ azd ပရောဂျက်တွင် အေးဂျင့်သည် သင့်၏ ဝဘ်ဖရန့်အန် သို့မဟုတ် API ဘက်အင်အဖြစ်ရှိသည့် **ဝန်ဆောင်မှု** တစ်ခုဖြစ်သည်။

### အေးဂျင့်များသည် azd ပရောဂျက်ဖွဲ့စည်းမှုပုံစံတွင် မည်သို့ သက်ဆိုင်သည်နည်း

azd ပရောဂျက်တစ်ခုမှာ ၃ ဆိပ်လွှာ ပါဝင်ပါတယ်- **အဆောက်အအုံတည်ဆောက်မှု**, **ကုဒ်**, နှင့် **ဖွဲ့စည်းတည်ဆောက်မှု**။ ကိုယ်စားလှယ်တွေကို အခြားဝန်ဆောင်မှုတွေလိုပဲ ဒီဆိပ်လွှာတွေထဲ ဆက်သွယ်လုပ်ဆောင်ပါတယ်-

| ဆိပ်လွှာ | ယဉ်ကျေးစံအက်ပ်လ်အတွက် ဘာလုပ်ဆောင်လဲ | ကိုယ်စားလှယ်အတွက် ဘာလုပ်ဆောင်လဲ |
|-------|-------------------------------------|---------------------------|
| **အဆောက်အအုံတည်ဆောက်မှု** (`infra/`) | ဝက်ဘ်အက်ပ်နှင့် ဒေတာဘေ့စ် မှာယူပေးတယ် | AI မော်ဒယ်အဆုံးပတ်ချက်၊ ရှာဖွေရေးအညွှန်း၊ ဒါမှမဟုတ် ကိုယ်စားလှယ် ဟုတ်စသည် များစွာမှာယူပေးတယ် |
| **ကုဒ်** (`src/`) | သင့်ရှေ့မျက်နှာနှင့် API ကို ထုတ်ပါသည် | သင့်ကိုယ်စားလှယ်နှင့် prompt မှတ်ကွက်များ ပါဝင်သည်|
| **ဖွဲ့စည်းတည်ဆောက်မှု** (`azure.yaml`) | သင့်ဝန်ဆောင်မှုများနှင့် ၎င်းတို့၏ ဟိုစ်တင် အချက်အလက်များစာရင်း | သင့်ကိုယ်စားလှယ်ကို ဝန်ဆောင်မှုတစ်ခုအဖြစ်ထားပြီး၊ ၎င်း၏ကုဒ်နှင့် ဟိုစ်တင်ဆီကိုညွှန်ပြသည် |

### `azure.yaml` ရဲ့ အခန်းကဏ္ဍ

သင် syntax ကို ယခုအချိန်တွင် မှတ်မိထားရန် မလိုအပ်ပါ။ အတွေးအခေါ်အရ, `azure.yaml` သည် azd ကို ပြောကြားသော ဖိုင်ဖြစ်သည် - *"ဤနေရာတွင် ကျွန်ုပ်၏ အပလီကေးရှင်း ဖွဲ့စည်းထားသော ဝန်ဆောင်မှုများရှိပြီး၊ ၎င်း၏ ကုဒ်များကို ဘယ်နေရာတွင် ရှာတွေ့မည်ဟု ပြောပြသည်။"*

သင်၏ စီမံကိန်းတွင် AI သင်္ချာကို ထည့်သွင်းပါက၊ `azure.yaml` သည် ဝန်ဆောင်မှုတစ်ခုအနေနှင့် ထို သင်္ချာကိုသာ စာရင်းပြုလုပ်သည်။ ထို့နောက် azd သည် မှန်ကန်သော အခြေခံဇုန် (ဥပမာ Microsoft Foundry Models endpoint သို့မဟုတ် Container App တစ်ခု) ကို သတ်မှတ်၍ သင်္ချာကို တင်သွင်းပေးသည် — ၎င်းသည် web app သို့မဟုတ် API အတွက် စီမံခန့်ခွဲသည့်နည်းတူပင် ဖြစ်သည်။

၎င်းသည် အခြေခံ အရာအသစ်တစ်ခု မရှိဟု ဆိုလိုသည်။ azd သည် web service ကို မည်သို့စီမံခန့်ခွဲသည်ကို နားလည်လျင် သင်သည် သင်္ချာကို မည်သို့ စီမံခန့်ခွဲသောကိုလည်း နားလည်ပြီးဖြစ်သည်။

## ဖွဲ့စည်းမှု အဆင့်အတန်း

azd သည် တစ်ခုတည်းသော အသွင်မဟုတ်ဘဲ သီးသန့် စီမံခန့်ခွဲမှု အစိတ်အပိုင်းများရှိသည်။
- **ကမ္ဘာလုံးဆိုင်ရာ အသုံးပြုသူ သဘောကျချက်များ**: `~/.azd/config.json`၊ `azd config` မှ စီမံခန့်ခွဲသည်။  
- **ပရောဂျက်သတ်မှတ်ချက်**: `azure.yaml` သည် ဝန်ဆောင်မှုများ၊ အခြေခံအဆောက်အအုံနှင့် ဟုုတ္များကို သတ်မှတ်သည်။
- **ဒေသဆိုင်ရာ ပတ်ဝန်းကျင်ရွေးချယ်ခြင်း**: `.azure/config.json`။
- **ပတ်ဝန်းကျင်အလိုက်တန်ဖိုးများ**: `.azure/<name>/.env`၊ `azd env` မှ စီမံခန့်ခွဲသည်။ ထပ်တိုးစီမံချက်များ သည် ထိုပတ်ဝန်းကျင်၏ `config.json` တွင်တည်ရှိသည်။
- **အီလက်ထရွန်နစ်အမှတ်ပြများနှင့် လုပ်ငန်းစဉ်အပြောင်းအလဲများ**: သတ်မှတ်ထားသော မှတ်ချက်/ထောက်ပံ့သူ သည်ပဲထောက်ပံ့သည့် စီမံချက်များကိုသာ ပြင်ဆင်နိုင်သည်။

မည်သည့် `azd env set` တန်ဖိုးမဆို အလိုအလျောက် အခြေခံအဆောက်အအုံ ပါရာမီတာ သို့မဟုတ် ထည့်သွင်းထားသော အပလီကေးရှင်း သတ်မှတ်ချက်မဖြစ်ပေ။ ၎င်းကို ထူးခြားစွာ ပါရာမီတာဖိုင်၊ ထောက်ပံ့သော ဝန်ဆောင်မှု ဖွဲ့စည်းမှု သို့မဟုတ် ဟုတ်တစ်ခုတွင် အညွှန်းပြုရမည်။

## ရေကြောင်းသတ်မှတ်ချက် အထွေထွေ

### အထွေထွေအမြဲတမ်း သတ်မှတ်ခြင်း
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# View all global configuration
azd config show

# Remove a configuration
azd config unset defaults.location
```

### ပေါင်းစပ်အထွေထွေဆက်တင်များ
```bash
# Discover supported settings instead of inventing configuration keys
azd config options
azd config list-alpha

# Explicit opt-in only: use Azure CLI credentials rather than azd's default login
azd config set auth.useAzCliAuth true
# Restore azd's default credential behavior
azd config unset auth.useAzCliAuth

# Use per-command flags for supported behavior
azd show --output json
azd deploy --timeout 1800   # seconds; stops waiting, not the Azure-side deployment
```

## 🏗️ ပရောဂျက် ဖွဲ့စည်းမှု

### azure.yaml ဖွဲ့စည်းဆောက်လုပ်မှု
`azure.yaml` ဖိုင်သည် သင့် azd ပရောဂျက်၏ မျိုးရိုးမြစ်ဖြစ်သည်။

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: .
      path: Dockerfile
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

၎င်းသည် **ပရောဂျက်သတ်မှတ်ချက် ဥပမာ** ဖြစ်ပြီး မတူညီသော စတင်သူ မဟုတ်ပါ။ မှတ်ချက်ထားသောရင်းမြစ် ဖိုင်ပေါ်များ၊ ဟုတ်စကရစ်ပ်များ၊ အထုပ်စကရစ်ပ်များနှင့် ကိုက်ညီသော `infra/main.bicep`/`main.parameters.json` များကို ပြင်ဆင်ပြီးမှ စတင်ယခုလုပ်ဆောင်ရမည်။ ဒေတာဘေ့စ်များကို အခြေခံအဆောက်အအုံတွင် ထားရန်ဖြစ်ပြီး `postgres` သည် ဖန်တီးထားသော ဝန်ဆောင်မှု မဟုတ်ပါ။ အခြေခံအဆောက်အအုံ ပါရာမီတာများကို ထောက်ပံ့သူရဲ့ ပါရာမီတာဖိုင်တွင် ထားရမည်၊ `infra.parameters` တွင်မဟုတ်။

### ဝန်ဆောင်မှု ဖွဲ့စည်းမှုရွေးချယ်စရာများ

#### အိမ်ခံအမျိုးအစားများ
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### ဘာသာစကားအလိုက် တည်ဆောက်မှု ဟုတ်များ

အောက်တိုဘာဝန်ဆောင်မှု အစိတ်အပိုင်းများသည် ဟုတ်များကို အထူးပြထားခြင်းဖြစ်ပြီး၊ ၎င်းတို့ကို ဝန်ဆောင်မှုပြုသည့်အစိတ်အပိုင်း၏ တကယ့် `project` နှင့် `host` နှင့် ပေါင်းစပ်ရမည်။ `buildCommand` နှင့် `startCommand` သည် စံနမူနာ azd ဝန်ဆောင်မှု လက္ခဏာများ မဟုတ်ပါ။ စတင်မှုကို အပလီကေးရှင်း၊ Dockerfile သို့မဟုတ် အိမ်ခံ အခြေခံအဆောက်အအုံတွင် အဆင်သင့်လုပ်ဆောင်ပါ။

```yaml
services:
  node-app:
    project: ./src/node
    host: appservice
    language: js
    hooks:
      prepackage:
        shell: sh
        run: npm run build
    
  python-app:
    project: ./src/python
    host: appservice
    language: python
    
  dotnet-app:
    project: ./src/dotnet
    host: appservice
    language: csharp
    
  java-app:
    project: ./src/java
    host: appservice
    language: java
```

## 🌟 ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှု

### ပတ်ဝန်းကျင် ဖန်တီးခြင်း
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ပတ်ဝန်းကျင် ဖွဲ့စည်းမှု
ဦးတည်ချက်ပတ်ဝန်းကျင်တန်ဖိုးများသည် `.azure/<env-name>/.env` တွင် တည်ရှိပြီး၊ `AZURE_ENV_NAME`၊ `AZURE_SUBSCRIPTION_ID`၊ နှင့် `AZURE_LOCATION` ကိုပါ ပါဝင်သည်။ ထပ်တိုးသောပတ်ဝန်းကျင် JSON သတ်မှတ်ချက်များအတွက် `azd env config get/set` ကို အသုံးပြုပါ။ အောက်ပါ JSON သည် **အဆိုအရ အပလီကေးရှင်း အခြေအနေ** ရှိကြောင်းဖော်ပြသည်၊ azd ဖိုင်များတွင် မလုပ်တစား ကူးယူ မထားရန်။

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### ပတ်ဝန်းကျင် အပြောင်းအလဲတန်ဖိုးများ

**ရိုးရိုးပြသချက် ချင်းတစ်ခုသာ။** ပုံမှန် `azd env set` တန်ဖိုးများကို `.azure/<name>/.env` တြင် ရေးဆွဲပြီး အကြောင်းဖတ်သော ကိရိယာများမှ ထုတ်ယူနိုင်သည်။ ဥပမာ API key ကို တကယ့်အဖြစ် အသုံးမပြုပါနှင့်။ လျှို့ဝှက်ချက်များအတွက် `azd env set-secret` နှင့် ထူးခြားသော အချိန်ပြတ်တောင်းအားကြိုးတန်းများကို အသုံးပြုပါ။

```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Expected output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Remove environment variable
azd env unset DEBUG

# Verify removal
azd env get-values | grep DEBUG
# (should return nothing)
```

### ပတ်ဝန်းကျင် အဲလ်တိတ်များ
ပရောဂျက် မူရင်းတွင် **လျှို့ဝှက်မပါ၊ ကိုယ်တိုင်ထိန်းသိမ်းသော** `.env.example` တစ်ခုကို ဖန်တီးပါ။ azd သည် `env.template` ဟု အမည်ပေးထားသော ဖိုင်ကို အလိုအလျောက် ပေါင်းထည့်ခြင်း မရှိပါ။
```bash
# Required variables
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Application settings
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optional development settings
DEBUG=false
LOG_LEVEL=info
```

### အသင်းအမဲစုများအကြား ပတ်ဝန်းကျင်မျှဝေခြင်း

ပရောဂျက်တွင် လူတစ်ဦးထက် ပိုပြီး လုပ်ကိုင်သောအခါတွင်၊ **repo နှင့် အတူ သွားသော အကြောင်းအရာနှင့် ဒေသခံတွင်သာရှိ သင့်သော အကြောင်းအရာများ** ကို သဘောတူညီရမည်။ azd သည် တစ်ခုချင်းစီပတ်ဝန်းကျင်ကို `.azure/` ဖိုလ်ဒါအောက်တွင် ထိန်းသိမ်းပြီး၊ ၎င်းမှ အားလုံးကိုလည်း git သို့မဟုတ် အခြားမွမ်းမံမှုများတွင် မထည့်သင့်ပါ။

**`.azure/` တွင်ရှိသောအရာများ:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**ဘာတွေကို gitignore ပြုလုပ်ရမလဲ။** azd ရဲ့ မူရင်း `.gitignore` ဟာ `.azure/` ကို မကျော်လွန်ထားပါဘူး။ ဒါကို အဲဒီအတိုင်းထားပါ—`.env` ဖိုင်တွေမှာ လျှို့ဝှက်ချက်တွေ ပါနိုင်ပြီး၊ အရင်းအမြစ် IDs တွေက တစ်စိတ်တစ်ပိုင်း provision လုပ်သူအားရည်ညွှန်းထားတာဖြစ်ပါတယ်။ နောက်ထပ်တစ်ဦးချင်းစီသည် သူတို့ **ကိုယ်ပိုင်** ပတ်ဝန်းကျင်ကို ဒေသတွင်းမှ ဖန်တီးပါတယ်။

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**ပတ်ဝန်းကျင်များအကြား ပြောင်းလဲအသုံးပြုခြင်း။** ပတ်ဝန်းကျင် အများကြီးကို စီမံထိန်းချုပ်သူ တစ်ဦးက အမိန့်များ ပြေးရန်မပြုသည့်အရှေ့က ပတ်ဝန်းကျင် တစ်ခုကို ရွေးချယ်သည်။

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**အဖွဲ့ကို လျှို့ဝှက်အချက်အလက်မပါသော မူရင်းအနေဖြင့်ပေးသွင်းခြင်း။** ကော်မစ် `.env.example` ကို ပယ်ဖျက်ထားသော `.azure/` ဖိုလ်ဒါအပြင်မှာ ထည့်ပါ။ အသစ်ဝင်ရောက်သောအဖွဲ့ဝင်များသည် ဒါကို သက်ဆိုင်ရာ ပုဒ်မတွင် မိတ္တူကူးပြီး၊ တန်ဖိုးများဖြည့်စွက်ကာ `azd env set --file <local-file>` ဖြင့် ထည့်သွင်းတင်ပြကြရမည်။ လုပ်ဆောင်နေသောပတ်ဝန်းကျင်အပေါ်တွင် အလွတ်တန်းနေသောနေရာရှိများကို မတင်သွင်းပါရန်။

**CI/CD တွင် ပတ်ဝန်းကျင်များ။** ပိုင်းလိုင်းများသည် သင့်ရဲ့ ဒေသိယ `.azure/` ဖိုလ်ဒါကို မဖတ်ပါ။ ယင်းအစား ပတ်ဝန်းကျင်တန်ဖိုးများကို ပိုင်းလိုင်း မတိုင်မီ များ / လျှို့ဝှက်များအဖြစ်ပေးသွင်းပြီး၊ azd သည် ထိုများကို ပရိုဆက်ဖြတ်ပတ်ဝန်းကျင်မှ ဖတ်ယူသည်။

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **အထွေထွေစည်းမျဉ်း:** အင်ဖရါစတာကွတ်ကုတ် (`infra/`, `azure.yaml`) သည် Git တွင် မျှဝေကြ; ပတ်ဝန်းကျင် *အခြေအနေ နှင့် လျှို့ဝှက်အချက်အလက်များ* (`.azure/`) သည် တစ်ဦးချင်း အထောက်အပံ့သူနဲ့ တစ်ပိုင်းလိုင်းချင်း အပိုင်ဖြစ်ကြသည်။ `azd pipeline config` သည် ပိုင်းလိုင်း မတိုင်မီ အလိုအလျောက် လုပ်ဆောင်ပေးသည်။

## 🔐 အတည်ပြုမှု ဖွဲ့စည်းခြင်း

### Azure CLI ပေါင်းစပ်မှု
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### ဆာဗစ် ပရင်စီပယ်လ် အတည်ပြုမှု
CI/CD ပိုင်းလိုင်းများအတွက်:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### စီမံမှု ရုပ်တည်
Azure အခြေစိုက်ပတ်ဝန်းကျင်များအတွက်:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ အင်ဖရာစထွပ်ချုပ် ဖွဲ့စည်းခြင်း

### Bicep ပါရာမီတာများ
အင်ဖရာစထွပ်ချုပ် ပါရာမီတာများကို `infra/main.parameters.json` တွင် ဖွဲ့စည်းပါ:
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### Terraform ဖွဲ့စည်းခြင်း
Terraform ပရောဂျက်များအတွက်၊ azd သည် `infra/main.tfvars.json` တွင် ဖေါ်ပြထားသောနေရာများကို အစားထိုးပေးသည်။ ဤအမည်များသည် Terraform input အမျိုးအစားများနှင့် ကိုက်ညီရမည်။
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 တင်သွင်းမှု ဖွဲ့စည်းခြင်း

### ဆောက်လုပ်မှု ပြင်ဆင်မှု
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    host: appservice
    language: js
    dist: build
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          NODE_ENV=production REACT_APP_API_URL="$API_URL" npm run build:prod
    
  api:
    project: ./src/api
    host: appservice
    language: python
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          python -m pip install -r requirements.txt
          PYTHONPATH=src python -m pytest tests/
```

### Docker ပြင်ဆင်မှု
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - NODE_ENV=production
        - API_VERSION=v1.0.0
```
လမ်းကြောင်းများသည် ဝန်ဆောင်မှုပရောဂျက်အပေါ် အခြေခံသည်။ Dockerfile သည် ၎င်းသုံးစွဲသည့် `ARG` တန်ဖိုးအား ထုတ်ဖေါ်ကြေညာရမည်။ အဆင့်များစုပြုလုပ်မှုအတွက် မုတ်ဆိတ်ခိုင်ခံမှုရှိသည့်အဆင့်ကို နောက်ဆုံးတွင်ထားပါ၊ ဒါမှမဟုတ် စိတ်ကြိုက်ပက်ကိန်းလုပ်ငန်းစဉ်ကို အသုံးပြုပါ; `docker.target` သည် အဆန်းစစ်ဆေးထားသည့် schema တွင် မပံ့ပိုးသော ပိုင်ဆိုင်မှုဖြစ်သည်။

## 🔧 တိုးတက်သော ပြင်ဆင်မှု

### စိတ်ကြိုက် အရင်းအမြစ် အမည်တွဲ
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Bicep/Terraform တွင် အကောင်အထည်ဖော်မည့် အရင်းအမြစ်အမည်များကို သတ်မှတ်ပြီး resource-group ဖန်တီးမှုကို ဤပြင်ဆင်မှုနှင့် သက်ဆိုင်သော နည်းလမ်းဖြင့် တည်ငြိမ်စေရန် ထိန်းသိမ်းပါ။ အထွေထွေအတွက် `naming.storageAccount` သို့မဟုတ် `naming.keyVault` ပြင်ဆင်မှုခလုတ်များ မရှိပါ။

### ကွန်ယက် ပြင်ဆင်မှု
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

ဤ **အထောက်အထား ပါရာမီတာ အချက်အလက်များ** ကို `infra/main.parameters.json` အောက်က `parameters` ထဲသို့ ပေါင်းစပ်ပြီး Bicep တွင် သတ်မှတ်ကာ သုံးစွဲပါ။ ၎င်းတို့သည် ကိုယ်တိုင်လုပ်ဆောင်ချက် မရှိပါ။

### ကြည့်ရှုမှု ပြင်ဆင်မှု
Application Insights နှင့် Log Analytics ကို Bicep/Terraform ဖြင့် အသုံးပြုပြီး သင်၏ SDK တွင် application telemetry ကို ပြင်ဆင်ပါ။ အထွေထွေပဒေသာ `monitoring` အပိုင်းသည် `azure.yaml` တွင် မရှိပါ။ ဤအရင်းအမြစ်များ ဖန်တီးသည်။ [monitoring infrastructure](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability) ကို ကြည့်ပါ။

## 🎯 ပတ်ဝန်းကျင်အလိုက် ပြင်ဆင်မှု

### ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### အဆင့်တင်ပတ်ဝန်းကျင်
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### ထုတ်လုပ်မှု ပတ်ဝန်းကျင်
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 ဆက်တင် အတည်ပြုခြင်း

### ဆက်တင်ကို အတည်ပြုပါ
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### ဆက်တင် စက္ကူများ
`scripts/` တွင် အတည်ပြုစက္ကူများ ဖန်တီးပါ။

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ask azd to load the project (not full schema or infrastructure validation)
if ! azd show --output json; then
  echo "Error: Could not load the azd project"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 အကောင်းဆုံး လေ့လာမှုနည်းလမ်းများ

### ၁။ ပတ်ဝန်းကျင်အပြောင်းအလဲ အစားထိုးများကို အသုံးပြုပါ
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

စနစ်နဲ့သက်ဆိုင်တဲ့ အရာတွေကို ခိုင်မာသောတန်ဖိုးတွေနဲ့ တွဲဖက်ထားခြင်း (ဥပမာ ဆက်တင်ကို မတူညီအောင် ခွဲထုတ်ထားခြင်း၊ တူညီတဲ့ ဖိုင်ထဲမှာ ဒုတိယ `database` key မဟုတ်ရန်) ရှောင်ရှားပါ။

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### ၂။ ဆက်တင်ဖိုင်များကို စုစည်းခြင်း
```
.azure/
├── config.json              # Global project config
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### ၃။ ဗားရှင်းထိန်းချုပ်မှု စဉ်းစားချက်များ
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### ၄။ ဆက်တင် စာရွက်စာတမ်းရေးခြင်း
`CONFIG.md` တွင် သင့်ဆက်တင်ကို မှတ်တမ်းတင်ပါ။
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## 🎯 လက်တွေ့လေ့ကျင့်ခန်းများ

### လေ့ကျင့်ခန်း ၁: ပတ်ဝန်းကျင် များစွာရှိသော ဆက်တင် (၁၅ မိနစ်)

**ရည်မှန်းချက်**: သုံးခုသော ဒေသဆိုင်ရာ ပတ်ဝန်းကျင်များကို ကွဲပြားတဲ့တန်ဖိုးတွေနဲ့ ဖန်တီးပြီး စီမံခန့်ခွဲပါ။ စတင်မှုမှာ project တစ်ခုဖွင့်ပြီး ရှိပြီးသားနာမည်များရှိလျှင် အသုံးမပြုသေးတဲ့ နာမည်အသစ်များကို သုံးပါ။ ဒီအပ်ပလီကေးရှင်းဆိုင်ရာ တန်ဖိုးတွေက telemetry/runtime ချိန်းချက်တွေကို မပြောင်းလဲပဲ သင့် template မှ သုံးသွားသည်။

```bash
# Create development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Create staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Create production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verify each environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**အောင်မြင်မှု ချက်များ:**
- [ ] ပတ်ဝန်းကျင်သုံးခု ပေါက်ကွဲကြောင်း အောင်မြင်စွာ ဖန်တီးပြီး
- [ ] တစ်ခုချင်းစီမှာ တစ်ခုပြီး တန်ဖိုးခရမ်းခြား
- [ ] အမှားမဖြစ်ဘဲ ပတ်ဝန်းကျင်များအကြား ပြောင်းလဲနိုင်ခြင်း
- [ ] `azd env list` သုံးခုသော ပတ်ဝန်းကျင်အားလုံးကို ပြသသည်

### လေ့ကျင့်ခန်း ၂: Key Vault လျှို့ဝှက်ချက် ရည်ညွှန်းချက်များ (၁၀-၂၀ မိနစ်)

**ရည်မှန်းချက်**: ပုံမှန်ကတိတင်တဲ့အစား Key Vault ရဲ့ ရည်ညွှန်းချက်တစ်ခုကို သိမ်းဆည်းပါ။ **စတင်မှု**: initialized ပတ်ဝန်းကျင်, Azure မှာ လက်မှတ်ထိုးပြီး, Key Vault မှ သွင်း/ဖတ်ခွင့်ရှိသည်။ Vault လုပ်ဆောင်ချက်များမှာ ကုန်ကျစရိတ်ရှိမည်။

```bash
# Follow the interactive prompts; use a dummy training value, not a production key
azd env set-secret TRAINING_API_KEY

# Set non-secret config
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Inspect .azure/<environment>/.env locally: TRAINING_API_KEY should
# contain an azd Key Vault reference, not the dummy secret text.
# Do not print resolved values in CI or shared terminal logs.
```

**အောင်မြင်မှု ချက်များ:**
- [ ] အင်တာက်တက် အမိန့်သည် ရွေးချယ်ထားသော vault နှင့် secret ရည်ညွှန်းချက်ကို တင်ပြသည်
- [ ] ဒေသတွင်း `.env` တွင် dummy secret မဟုတ်ဘဲ ရည်ညွှန်းချက်တစ်ခု ပါရှိသည်
- [ ] runtime identity/RBAC နှင့် စားသုံးမှုကို ထပ်မံ စီမံရန် မလုပ်သေးကြောင်း ရှင်းပြနိုင်သည်

**မြင်ကြုံရသည့် ပြဿနာများ**: 403 မှားစဉ်အတွက် ဝေါက်စ့် ဒေတာပလိန်း အခန်းကဏ္ဍ ခွင့်ပြုချက် နှင့် ပြန်လည် ပြန်လည်ဖြန့်ဝေမှု အချိန်လိုအပ်သည်။ `azd env set ... --secret` သည် မှန်ကန်သော command မဟုတ်ပါ။ ရိုးရိုး `get-values`/`get-value` ထွက်ရှိမှုကို ရှင်းလင်းမှု မရှိသည်ဟု ထင်၍ မရ။ `azd env unset TRAINING_API_KEY` ဖြင့် သင်ကြားမှု ရည်ညွှန်းချက်ကို ဖယ်ရှားပါ။ ဒါက vault ရဲ့ secret ကို ဖျက်မထားပါ၊ ဒါကို သင် ဖန်တီးခဲ့လျှင် သန့်ရှင်းစင်ကြယ်စာ စီစဉ်ဖျက်သိမ်းရမည်။

## နောက်ထပ် ခြေလှမ်းများ

- [Your First Project](../chapter-01-foundation/first-project.md) - အတွေ့အကြုံရယူရန် ဆက်တင် များကို အကောင်အထည်ဖော်ပါ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - ထုတ်လုပ်မှုအတွက် ဆက်တင် အသုံးပြုခြင်း
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - ထုတ်လုပ်ရေး ပြင်ဆင်ထားသော ဆက်တင်များ

## ကိုးကားချက်များ

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Environment Variables](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**အခန်း လမ်းညွှန်:**
- **📚 အတန်းအိမ်**: [AZD အခြေခံများ](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၃ - ဖွဲ့စည်းမှုနှင့် အထောက်အထားစစ်ဆေးခြင်း
- **⬅️ ယခင်**: [သင့်ရဲ့ ပထမဆုံး Project](../chapter-01-foundation/first-project.md)
- **➡️ နောက်အခန်း**: [အခန်း ၄: အင်ဖရာစထရက်ချာကို ကုဒ်အဖြစ်](../chapter-04-infrastructure/deployment-guide.md)
- **နောက်ခြေလှမ်း**: [အထောက်အထားစစ်ဆေးခြင်းနှင့် လုံခြုံမှု](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->