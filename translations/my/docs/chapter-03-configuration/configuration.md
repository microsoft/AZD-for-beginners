# ဖော်ပြချက်လမ်းညွှန်

**အခန်း လမ်းညွှန်:**
- **📚 Course Home**: [AZD စတင်သူများအတွက်](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း ၃ - ဖော်ပြချက်နှင့် အတည်ပြုခြင်း
- **⬅️ Previous**: [သင်၏ ပထမ ပရောဂျက်](first-project.md)
- **➡️ Next**: [တပ်ဆင်ခြင်း လမ်းညွှန်](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [အခန်း ၄: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## မိတ်ဆက်

ဤလမ်းညွှန်အပြည့်အစုံမှာ Azure Developer CLI ကို ဖော်ပြချက်ဆိုင်ရာနှင့် တပ်ဆင်မှုလုပ်ငန်းစဉ်များအတွက် အကောင်းဆုံး အသုံးပြုနိုင်ရန်လိုအပ်သော အချက်အလက်များအားလုံးကို ဖုံးကွယ်ပေးပါသည်။ သင်သည် ဖော်ပြချက် အဆင့်သတ်မှတ်မှု၊ ပတ်ဝန်းကျင်စီမံခန့်ခွဲမှု၊ အတည်ပြုခြင်းနည်းလမ်းများနှင့် လုံခြုံပြီး ထိရောက်သော Azure တပ်ဆင်မှုများအတွက် အဆင့်မြင့် ဖော်ပြချက်နည်းလမ်းများကို လေ့လာသိရှိနိုင်မည် ဖြစ်သည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဤသင်ခန်းစာ၏ အဆုံးတွင် သင်သည်:
- azd ဖော်ပြချက် အဆင့်သတ်မှတ်မှုကို ကျွမ်းကျင်စွာ သင်ယူကာ အချက်များ ဘယ်လိုဦးစားပေးထားကြောင်း နားလည်နိုင်မည်
- ကမ္ဘာလုံးဆိုင်ရာနှင့် ပရောဂျက်-အထူး ဖော်ပြချက်များကို ထိရောက်စွာ သတ်မှတ်နိုင်မည်
- အမျိုးမျိုးသော ဖော်ပြချက်များနှင့်အတူ မတူကွဲပြားသော ပတ်ဝန်းကျင်များကို စီမံနိုင်မည်
- လုံခြုံသော အတည်ပြုခြင်းနှင့် ခွင့်ပြုချက် နည်းလမ်းများကို အကောင်အထည်ဖော်နိုင်မည်
- ရှုပ်ထွေးသော အခြေအနေများအတွက် အဆင့်မြင့် ဖော်ပြချက် ပုံစံများကို နားလည်နိုင်မည်

## သင်ယူပြီးရရှိမည့် အကျိုးသက်ရောက်မှုများ

ဤသင်ခန်းစာကို ပြီးမြောက်စွာ သင်ယူပြီးနောက် သင်သည်:
- ဖွံ့ဖြိုးရေး လုပ်ငန်းစဉ်များအတွက် azd ကို အကောင်းဆုံး စစ်တမ်းအရ ဖော်ပြချက် ပြုလုပ်နိုင်မည်
- မတူကွဲပြားသည့် တပ်ဆင်မှု ပတ်ဝန်းကျင်များကို စတင်ထိန်းချုပ်၊ စီမံနိုင်မည်
- လုံခြုံသော ဖော်ပြချက် စီမံခန့်ခွဲမှု လမ်းစဉ်များကို အကောင်အထည်ဖော်နိုင်မည်
- ဖော်ပြချက်နှင့် သက်ဆိုင်သည့် ပြဿနာများကို ဖြေရှင်း troubleshooting လုပ်နိုင်မည်
- အဖွဲ့အစည်း အလိုအပ်ချက်များအတွက် azd အပြုအမူကို ကိုယ်ပိုင်ပြင်ဆင်နိုင်မည်

ဤလမ်းညွှန်အပြည့်အစုံမှာ Azure Developer CLI ကို ဖော်ပြချက်ဆိုင်ရာနှင့် တပ်ဆင်မှုလုပ်ငန်းစဉ်များအတွက် အကောင်းဆုံး အသုံးပြုနိုင်ရန်လိုအပ်သော အချက်အလက်များအားလုံးကို ဖုံးကွယ်ပေးပါသည်။

## azd ပရောဂျက်ထဲရှိ AI အေးဂျင့်များကို နားလည်ခြင်း

AI အေးဂျင့်များကို မသိသေးသူများအတွက် azd ကမ္ဘာကြီးထဲ၌ အဲဒီအေးဂျင့်တွေကို သဘောထားရင်း ရိုးရှင်းစွာ ရှင်းပြလိုက်ပါမယ်။

### အေးဂျင့် ဆိုတာဘာလဲ?

အေးဂျင့် ဆိုသည်မှာ တောင်းဆိုချက်တစ်ခုကို လက်ခံနိုင်ပြီး အဲဒီတောင်းဆိုချက်အပေါ် ဇာတ်ဆောင်ချက်တွင် ထောက်ခံချက် ပြု၍ လုပ်ဆောင်ချက်များ ပြုလုပ်နိုင်သည့် ဆော့ဖ်ဝဲအစိတ်အပိုင်းတစ်ခုဖြစ်သည်— မကြာခဏ AI မော်ဒယ်ကို ခေါ်ဆိုခြင်း၊ အချက်အလက် ရှာဖွေရခြင်း သို့မဟုတ် အခြားဝန်ဆောင်မှုများကို ဖိတ်ခေါ်ခြင်းဖြင့် ဖြစ်သည်။ azd ပရောဂျက်တစ်ခုတွင် အေးဂျင့်သည် သင့်ရဲ့ ဝက်ဘ် ရှေ့ဖြစ်ပေါ်မှု (frontend) သို့မဟုတ် API ဘက်အနေဖြင့် တခြား **ဝန်ဆောင်မှု** တစ်ခုအဖြစ် ရှိနေသည်။

### အေးဂျင့်များသည် azd ပရောဂျက် ဖွဲ့စည်းမှုထဲတွင် မည်သို့ ပါဝင်သနည်း

azd ပရောဂျက်တစ်ခုသည် သုံးပိုင်းဖြစ်သည်။ **infrastructure**, **code**, နှင့် **configuration**။ အေးဂျင့်များသည် အခြားဝန်ဆောင်မှုများနှင့်တူပဲ ဤအလွှာများထဲသို့ ဖောင်းထည့်ထည့်လိုက်ပါသည်။

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | ဝက်ဘ် အပ်ပလီကေးရှင်းနှင့် ဒေတာဘေ့စ်ကို ပံ့ပိုးပေးသည် | AI မော်ဒယ် endpoint၊ search index သို့မဟုတ် agent host ကို ပံ့ပိုးပေးသည် |
| **Code** (`src/`) | သင့်ရဲ့ ဖရန့်အင့်နှင့် API ကိုဒ်ကို ပါရှိသည် | သင့် အေးဂျင့် လိုဂစ်နှင့် prompt သတ်မှတ်ချက်များကို ပါရှိသည် |
| **Configuration** (`azure.yaml`) | သင့်ဝန်ဆောင်မှုများနှင့် ၎င်းတို့၏ ဟိုစတင်းရန်ဂိုလ် သတ်မှတ်ချက်များကို စာရင်းပြုစုသည် | အေးဂျင့်ကို ဝန်ဆောင်မှုတစ်ခုအဖြစ် စာရင်းပြုစုပြီး ၎င်း၏ ကိုဒ်နှင့် ဟို့စကို ညွှန်ပြသည် |

### `azure.yaml` ၏ တာဝန်

အခု syntax ကို မွေ့မဖတ်ဖို့ မလိုပါ။ အယူအဆအရ `azure.yaml` ဟာ azd ကို သင်ပြောလိုက်သော ဖိုင်ပါ။ *"ဒီသည်ဖြင့် ငါ့ အက်ပလီကေးရှင်းကို ဖွဲ့စည်းနေသော ဝန်ဆောင်မှုများဖြစ်ကြသည်၊ ၎င်းတို့၏ ကိုဒ်ကို ရှာဖွေနိုင်မည့် နေရာများမှာ ဒီနေရာတွင် ဖြစ်သည်။"* 

သင့်ပရောဂျက်ထဲတွင် AI အေးဂျင့်တစ်ခုပါဝင်လာသည်ဆိုပါက `azure.yaml` သည် အဲဒီအေးဂျင့်ကို ဝန်ဆောင်မှုတစ်ခုအဖြစ် စာရင်းပြုစုသည်။ ထို့နောက် azd သည် အမှန်တကယ်လိုအပ်သော အင်ဖရာကို (ဥပမာ Microsoft Foundry Models endpoint သို့မဟုတ် agent ကို ဟို့စ်ရန် Container App တစ်ခု) provision လုပ်ရန်နှင့် သင့်အေးဂျင့် ကုဒ်ကို deploy လုပ်ရန် သိရှိသွားသည်— ဝက်ဘ်အက်ပလီကေးရှင်း သို့မဟုတ် API အတွက်လုပ်သလိုပင်ဖြစ်သည်။

ဒါက ဘာမှအသစ်မဟုတ်ပါဘူး။ azd က ဝက်ဘ် ဝန်ဆောင်မှုကို မည်သို့ စီမံကြသည်ကို သိထားရင် အေးဂျင့်ကို မည်သို့ စီမံကြသည်ကိုလည်း ရှင်းလင်းစွာ နားလည်ထားပြီး ဖြစ်ပါပြီ။

## ဖော်ပြချက် အဆင့်သတ်မှတ်မှု

azd သည် အဆင့်လိုက် ဖော်ပြချက် စနစ်ကို အသုံးပြုပါသည်။
1. **Command-line flags** (အမြင့်ဆုံး ဦးစားပေး)
2. **Environment variables** (ပတ်ဝန်းကျင် တန်ဖိုးများ)
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (အနိမ့်ဆုံး ဦးစားပေး)

## ကမ္ဘာလုံးဆိုင်ရာ ဖော်ပြချက်

### Global Defaults သတ်မှတ်ခြင်း
```bash
# ပုံမှန် subscription ကို သတ်မှတ်ပါ
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ပုံမှန် တည်နေရာ ကို သတ်မှတ်ပါ
azd config set defaults.location "eastus2"

# resource group အတွက် ပုံမှန် နာမည်ပုံစံကို သတ်မှတ်ပါ
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# ကမ္ဘာလုံးဆိုင်ရာ ဆက်တင်အားလုံးကို ကြည့်ပါ
azd config show

# ဆက်တင်တစ်ခုကို ဖယ်ရှားပါ
azd config unset defaults.location
```

### သာမန် ကမ္ဘာလုံးဆိုင်ရာ ဖော်ပြချက်များ
```bash
# ဖွံ့ဖြိုးရေး နှစ်သက်ချက်များ
azd config set alpha.enable true                    # အယ်လ်ဖာ အင်္ဂါရပ်များကို ဖွင့်ပါ
azd config set telemetry.enabled false             # တယ်လီမက်ထရီကို ပိတ်ပါ
azd config set output.format json                  # ထွက်ပုံစံ သတ်မှတ်ပါ

# လုံခြုံရေး ဆက်တင်များ
azd config set auth.useAzureCliCredential true     # အတည်ပြုခြင်းအတွက် Azure CLI ကို အသုံးပြုပါ
azd config set tls.insecure false                  # TLS စစ်ဆေးမှုကို လိုက်နာစေပါ

# စွမ်းဆောင်ရည် ချိန်ညှိခြင်း
azd config set provision.parallelism 5             # ရင်းမြစ်များကို တပြိုင်နက် ဖန်တီးခြင်း
azd config set deploy.timeout 30m                  # တပ်ဆင်မှု အချိန်ကုန်ဆုံးချိန်
```

## 🏗️ ပရောဂျက် ဖော်ပြချက်

### azure.yaml ဖွဲ့စည်းပုံ
`azure.yaml` ဖိုင်သည် သင့် azd ပရောဂျက်၏ နှလုံးပါးဖြစ်သည်:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0
  templateBranch: main

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
      context: ./src/api
      dockerfile: Dockerfile
    
  # Database service
  database:
    project: ./src/db
    host: postgres
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location
  parameters:
    environmentName: ${AZURE_ENV_NAME}
    location: ${AZURE_LOCATION}

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

### ဝန်ဆောင်မှု ဖော်ပြချက် ရွေးချယ်စရာများ

#### Host အမျိုးအစားများ
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

#### ဘာသာစကား အထူးပြု ဖော်ပြချက်များ
```yaml
services:
  node-app:
    language: js
    buildCommand: npm run build
    startCommand: npm start
    
  python-app:
    language: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    
  dotnet-app:
    language: csharp
    buildCommand: dotnet build
    startCommand: dotnet run
    
  java-app:
    language: java
    buildCommand: mvn clean package
    startCommand: java -jar target/app.jar
```

## 🌟 ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှု

### ပတ်ဝန်းကျင်များ ဖန်တီးခြင်း
```bash
# ပတ်ဝန်းကျင်အသစ် တစ်ခု ဖန်တီးရန်
azd env new development

# တိကျသော တည်နေရာဖြင့် ဖန်တီးရန်
azd env new staging --location "westus2"

# နမူနာမှ ဖန်တီးရန်
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ပတ်ဝန်းကျင် ဖော်ပြချက်
ပတ်ဝန်းကျင်တိုင်းတွင် ၎င်း၏ ကိုယ်ပိုင် ဖော်ပြချက်ကို `.azure/<env-name>/config.json` တွင် ထားရှိသည်။

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

### ပတ်ဝန်းကျင် တန်ဖိုးများ
```bash
# ပတ်ဝန်းကျင်အလိုက် သီးခြား သတ်မှတ်ရန် ပြောင်းလဲနိုင်သော တန်ဖိုးများကို သတ်မှတ်ပါ
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# ပတ်ဝန်းကျင် သတ်မှတ်ထားသော တန်ဖိုးများကို ကြည့်ပါ
azd env get-values

# မျှော်မှန်းထားသော အထွက်:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# ပတ်ဝန်းကျင် အပြောင်းလဲတန်ဖိုးကို ဖယ်ရှားပါ
azd env unset DEBUG

# ဖယ်ရှားမှုကို အတည်ပြုပါ
azd env get-values | grep DEBUG
# (ဘာမှ မပြန်လာသင့်ပါ)
```

### ပတ်ဝန်းကျင် ပုံစံဖိုင်များ
တူညီသော ပတ်ဝန်းကျင် ဖြေရှင်းနိုင်ရန် `.azure/env.template` ဖိုင်ကို ဖန်တီးပါ။
```bash
# လိုအပ်သော ပြောင်းလဲနိုင်သော တန်ဖိုးများ
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# အက်ပလီကေးရှင်း ဆက်တင်များ
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ရွေးချယ်နိုင်သော ဖွံ့ဖြိုးရေး ဆက်တင်များ
DEBUG=false
LOG_LEVEL=info
```

### အသင်းအတွင်း ပတ်ဝန်းကျင်များ မျှဝေခြင်း

တစ်စိတ်တစ်ပိုင်း ပရောဂျက်ပေါ်တွင် လူအများအလုပ်လုပ်သောအခါ၊ **repo နဲ့အတူ သယ်ဆောင်သွားလိမ့်မဲ့ အရာများနှင့် ဒေသတွင်သာရှိသင့်သော အရာများကို** သဘောတူရပါမည်။ azd သည် ပတ်ဝန်းကျင်တစ်ခုချင်းစီကို `.azure/` ဖိုလ်ဒါအောက်သို့ ထားရှိသည်၊ သို့သော် ၎င်းတို့အားလုံးကို commit ပြုလုပ်သင့်သည် မဟုတ်ပါ။

**`.azure/` အတွင်းတွင် ပါသော အရာများ:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**ဘာတွေကို gitignore ထည့်မယ်။** azd ၏ မူလ `.gitignore` သည် `.azure/` ကို ရှောင်ထားပြီး ဖြစ်သည်။ ထိုအတိုင်း ထားပါ—`.env` ဖိုင်များတွင် လျှို့ဝှက်ချက်များ ပါဝင်နိုင်ပြီး resource ID များသည် ထိုအရာများကို provision လုပ်ခဲ့သူ၏ အပိုင်ဖြစ်သည့်အတွက် အခြားသူများအထိ လက်ခံမရနိုင်ပါ။ အသင်းသား တစ်ဦးချင်းစီသည် သူတို့ **ကိုယ်ပိုင်** ပတ်ဝန်းကျင်ကို တည်ဆောက်လိမ့်မည်။

```bash
# ဖွံ့ဖြိုးရေးသူတိုင်း သူတို့အတွက် သီးသန့်ထားသော ပတ်ဝန်းကျင်ကို ရရှိစေရန် ဒီကို တစ်ကြိမ် ပြေးဆောင်ကြသည်။
azd env new dev-alice
azd up
```

**ပတ်ဝန်းကျင်များအကြား အပြောင်းအလဲ ပြုလုပ်ခြင်း။** ပတ်ဝန်းကျင် အများအပြားကို စီမံခန့်ခွဲမယ့် developer တစ်ဦးသည် command မများကို ရိုက်ခလုတ်ခလုတ်မလုပ်ခင် အက်တစ်တက် ပတ်ဝန်းကျင်ကို ရွေးချယ်သည်။

```bash
azd env list                 # ဒေသခံပတ်ဝန်းကျင်အားလုံးနှင့် ဘယ်ဟာ ပုံမှန် (default) ဖြစ်နေသည်ကို ကြည့်ပါ
azd env select staging       # 'staging' ကို လက်ရှိအလုပ်လုပ်နေသော ပတ်ဝန်းကျင်အဖြစ် သတ်မှတ်ပါ
azd env get-values           # သင်သည် မှန်ကန်သည့် ပတ်ဝန်းကျင်ကို ရည်ညွှန်းနေကြောင်း အတည်ပြုပါ
```

**အသင်းအား non-secret default များ ပေးပို့ခြင်း။** အထက်ပါ `.azure/env.template` ကဲ့သို့ တမ်းပလိတ်တစ်ခုကို commit လုပ်၍ လူတိုင်း မည်သည့် အပြောင်းအလဲကို သတ်မှတ်ရမည်ကို သိရှိစေပါ—သို့သော် ပြည့်စုံစွာဖြည့်ထားသော တန်ဖိုးများကို မcommit ပြုလုပ်ပါနှင့်။ အသစ်သည့် အသင်းသားများသည် အဆိုပါ template ကို ကူးယူပြီး သူတို့၏ ကိုယ်ပိုင် အချက်အလက်များဖြင့် ဖြည့်စွက်ပါမည်။

**CI/CD ထဲတွင် ပတ်ဝန်းကျင်များ။** Pipeline များသည် သင့် ဒေသীয় `.azure/` ဖိုလ်ဒါကို မဖတ်ပါ။ အစား၌ ပတ်ဝန်းကျင် တန်ဖိုးများကို pipeline variables/secrets အဖြစ် ပေးပို့ပါ၊ azd သည် ၎င်းတို့ကို process environment မှ ဖတ်ယူပါသည်။

```bash
# CI တွင် azd သည် ဤအရာများကို .azure/ မှမဟုတ်ဘဲ ပတ်ဝန်းကျင်မှ ဖတ်ယူသည်။
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **လမ်းညွှန် စည်းကမ်း:** infrastructure ကုဒ် (`infra/`, `azure.yaml`) များကို Git တွင် မျှဝေပါ; ပတ်ဝန်းကျင် *state နှင့် secrets* (`.azure/`) များသည် developer တစ်ဦးချင်းစီနှင့် pipeline အလိုက် သီးခြားဖြစ်သည်။ `azd pipeline config` သည် pipeline variables များကို အလိုအလျောက် သင့်အတွက် ပြင်ဆင်ပေးပါသည်။

## 🔐 အတည်ပြုခြင်း ဖော်ပြချက်

### Azure CLI ကိို တိုက်ရိုက်ချိတ်ဆက်ခြင်း
```bash
# Azure CLI မှာရှိသည့် အထောက်အထားများကို အသုံးပြုပါ (ပုံမှန်)
azd config set auth.useAzureCliCredential true

# သတ်မှတ်ထားသော tenant ဖြင့် အကောင့်သို့ ဝင်ပါ
az login --tenant <tenant-id>

# ပုံမှန် subscription ကို သတ်မှတ်ပါ
az account set --subscription <subscription-id>
```

### Service Principal အတည်ပြုခြင်း
CI/CD pipeline များအတွက်:
```bash
# ပတ်ဝန်းကျင်ပြောင်းလဲများကို သတ်မှတ်ပါ
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# သို့မဟုတ် တိုက်ရိုက် ချိန်ညှိပါ
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Azure မှ ဧရိယာများတွင် ဟိုစ့်ထားသည့် ပတ်ဝန်းကျင်များအတွက်:
```bash
# စီမံခန့်ခွဲထားသော identity အတည်ပြုမှုကို ဖွင့်ပါ
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ အဆောက်အအုံ ဖော်ပြချက်

### Bicep ပါရာမီတာများ
အင်ဖရာ ပါရာမီတာများကို `infra/main.parameters.json` တွင် သတ်မှတ်ပါ။
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

### Terraform ဖော်ပြချက်
Terraform ပရောဂျက်များအတွက် `infra/terraform.tfvars` တွင် သတ်မှတ်ပါ။
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 တပ်ဆင်ခြင်း ဖော်ပြချက်

### Build ဖော်ပြချက်
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    language: js
    buildCommand: npm run build:prod
    buildEnvironment:
      NODE_ENV: production
      REACT_APP_API_URL: ${API_URL}
    dist: build
    
  api:
    project: ./src/api
    language: python
    buildCommand: |
      pip install -r requirements.txt
      python -m pytest tests/
    buildEnvironment:
      PYTHONPATH: src
```

### Docker ဖော်ပြချက်
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        NODE_ENV: production
        API_VERSION: v1.0.0
```
ဥပမာ `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 အဆင့်မြင့် ဖော်ပြချက်

### အထူး အရင်းအမြစ် အမည်ပေးခြင်း
```bash
# နာမည်ပေးခြင်းဆိုင်ရာ စည်းမျဉ်းများ သတ်မှတ်ပါ
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### ကွန်ယက် ဖော်ပြချက်
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### ဒေတာစောင့်ကြည့်မှု ဖော်ပြချက်
```yaml
# In azure.yaml
monitoring:
  applicationInsights:
    enabled: true
    samplingPercentage: 100
  logAnalytics:
    enabled: true
    retentionDays: 30
```

## 🎯 ပတ်ဝန်းကျင် အလိုက် အထူး ဖော်ပြချက်များ

### ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်
```bash
# .azure/ဖွံ့ဖြိုးရေး/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### စတေးဂ် ပတ်ဝန်းကျင်
```bash
# .azure/စတေ့ဂ်/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### ထုတ်လုပ်ရေး ပတ်ဝန်းကျင်
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 ဖော်ပြချက် တိကျမှု စစ်ဆေးခြင်း

### ဖော်ပြချက် စစ်ဆေးခြင်း
```bash
# ဆက်တင် သဒ္ဒါကို စစ်ဆေးပါ
azd config validate

# ပတ်ဝန်းကျင် တန်ဖိုးများကို စမ်းသပ်ပါ
azd env get-values

# အခြေခံအဆောက်အအုံ၏ မှန်ကန်ခြင်းကို အတည်ပြုပါ
azd provision --dry-run
```

### ဖော်ပြချက် စကရစ်များ
စစ်ဆေးမှု စကရစ်များကို `scripts/` တွင် ဖန်တီးပါ။

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# လိုအပ်သော ပတ်ဝန်းကျင် တန်ဖိုးများကို စစ်ဆေးပါ
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml ဖိုင်၏ သတ်မှတ်ပုံစံကို စစ်ဆေးပါ
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 အကောင်းဆုံး လမ်းစဉ်များ

### 1. ပတ်ဝန်းကျင် တန်ဖိုးများကို အသုံးပြုပါ
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ဖော်ပြချက် ဖိုင်များကို စနစ်တကျ စီစဉ်ပါ
```
.azure/
├── config.json              # Global project config
├── env.template             # Environment template
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

### 3. ဗားရှင်း ထိန်းချုပ်မှု သဘောတရားများ
```bash
# .gitignore
.azure/*/config.json         # ပတ်ဝန်းကျင် ဆက်တင်များ (အရင်းအမြစ် ID များ ပါရှိနိုင်သည်)
.azure/*/.env               # ပတ်ဝန်းကျင် ပြောင်းလဲများ (လျှို့ဝှက်ချက်များ ပါရှိနိုင်သည်)
.env                        # ဒေသීය ပတ်ဝန်းကျင် ဖိုင်
```

### 4. ဖော်ပြချက် စာတမ်းရေးသားခြင်း
သင့်ဖော်ပြချက်ကို `CONFIG.md` တွင် စာတမ်းတင်ပါ။
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

## 🎯 လက်တွေ့ လေ့ကျင့်ခန်းများ

### Exercise 1: မျိုးစုံ ပတ်ဝန်းကျင် ဖော်ပြချက် (15 မိနစ်)

**ရည်ရွယ်ချက်**: မတူကွဲပြားသော သတ်မှတ်ချက်များနှင့် သုံးခုဖြစ်သော ပတ်ဝန်းကျင်များကို ဖန်တီး၍ ဖော်ပြချက်ပြုလုပ်ပါ။

```bash
# ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်ကို ဖန်တီးပါ
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# စမ်းသပ်ရန် ပတ်ဝန်းကျင်ကို ဖန်တီးပါ
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# ထုတ်လုပ်ရေး ပတ်ဝန်းကျင်ကို ဖန်တီးပါ
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ပတ်ဝန်းကျင် တစ်ခုချင်းစီကို စစ်ဆေးပါ
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**အောင်မြင်မှုပမာဏများ:**
- [ ] သုံးခုသော ပတ်ဝန်းကျင်များ ကို အောင်မြင်စွာ ဖန်တီးထားသည်
- [ ] ပတ်ဝန်းကျင်တိုင်းတွင် ထူးခြားသော ဖော်ပြချက်ရှိသည်
- [ ] အမှားမဖြစ်လျှင် ပတ်ဝန်းကျင်များအကြား လွယ်ကူစွာ ပြောင်းလဲနိုင်သည်
- [ ] `azd env list` သည် သုံးခုလုံးကို ပြပါသည်

### Exercise 2: လျှို့ဝှက်ချက် စီမံခန့်ခွဲမှု (10 မိနစ်)

**ရည်ရွယ်ချက်**: ထိခိုက်စရာ အချက်အလက်များနှင့်လုံခြုံစွာ ဖော်ပြချက်ကို အသုံးပြုသင်ယူပါ

```bash
# လျှို့ဝှက်ချက်များ သတ်မှတ်ပါ (အထွက်တွင် မပြပါ)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# လျှို့ဝှက်မရှိသော ဆက်တင်များ သတ်မှတ်ပါ
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ပတ်ဝန်းကျင်ကို ကြည့်ပါ (လျှို့ဝှက်ချက်များကို ဖယ်ရှားထားသင့်သည်)
azd env get-values

# လျှို့ဝှက်ချက်များ သိမ်းဆည်းထားကြောင်း အတည်ပြုပါ
azd env get DB_PASSWORD  # အစစ်တန်ဖိုးကို ပြသသင့်သည်
```

**အောင်မြင်မှုပမာဏများ:**
- [ ] လျှို့ဝှက်ချက်များကို terminal တွင် ဖော်ပြခြင်းမပြုဘဲ သိမ်းဆည်းထားနိုင်သည်
- [ ] `azd env get-values` သည် လျှို့ဝှက်ချက်များကို အလွှာဖုံးထားပြသည်
- [ ] တစ်ကိုယ်တည်း `azd env get <SECRET_NAME>` သည် တကယ့် တန်ဖိုးကို ရယူနိုင်သည်

## နောက်တလှမ်းများ

- [သင်၏ ပထမ ပရောဂျက်](first-project.md) - ဖော်ပြချက်ကို လက်တွေ့အသုံးချပါ
- [တပ်ဆင်ခြင်း လမ်းညွှန်](../chapter-04-infrastructure/deployment-guide.md) - တပ်ဆင်မှုအတွက် ဖော်ပြချက်ကို အသုံးပြုပါ
- [အရင်းအမြစ်များ ပေးသွင်းခြင်း](../chapter-04-infrastructure/provisioning.md) - ထုတ်လုပ်မှုပဲသုံးဖော်ပြချက်များ

## အရင်းအမြစ်များ

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**အခန်း လမ်းညွှန်:**
- **📚 Course Home**: [AZD စတင်သူများအတွက်](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း ၃ - ဖော်ပြချက်နှင့် အတည်ပြုခြင်း
- **⬅️ Previous**: [သင်၏ ပထမ ပရောဂျက်](first-project.md)
- **➡️ Next Chapter**: [အခန်း ၄: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [သင်၏ ပထမ ပရောဂျက်](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->