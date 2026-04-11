# ဖွဲ့စည်းမှု လမ်းညွှန်

**အခန်း လမ်းကြောင်း:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD အခြေခံများ](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 3 - ဖွဲ့စည်းမှုနှင့် အတည်ပြုခြင်း
- **⬅️ ယခင်**: [သင်၏ ပထမစီမံကိန်း](first-project.md)
- **➡️ နောက်တစ်ခု**: [တပ်ဆင်ခြင်း လမ်းညွှန်](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 နောက်အခန်း**: [အခန်း ၄: အင်ဖရာစထာ ကို ကုဒ်ဖြင့်](../chapter-04-infrastructure/deployment-guide.md)

## နိဒါန်း

ဤ တိကျပြည့်စုံသော လမ်းညွှန်အုပ်စုသည် Azure Developer CLI ကို ဖွဲ့စည်းရေးနှင့် တပ်ဆင်ရေးလုပ်ငန်းစဉ်များအတွက် ထိရောက်စွာ အသုံးပြုနိုင်အောင် ဆက်တင်ဆိုင်ရာ အားလုံးကို ဖုံးလွှမ်းသည်။ သင်သည် ဖွဲ့စည်းမှု အဆင့်စဉ်၊ ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှု၊ အတည်ပြုခြင်း နည်းလမ်းများနှင့် လုံခြုံစိတ်ချစေသော အဆင့်မြင့် ဖွဲ့စည်းမှု ပုံစံများအား လေ့လာသင်ယူမည် ဖြစ်သည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဤသင်ခန်းစာ၏ အဆုံးတွင် သင်သည်:
- azd ဖွဲ့စည်းမှု အဆင့်စဉ်ကို ကျွမ်းကျင်စွာ လေ့လာပြီး ဆက်တင်များ အဓိကတန်ဖိုးအလိုက် ဘယ်လို ဦးစားပေးနေသည်ကို နားလည်နိုင်သည်
- ကမ္ဘာလုံးဆိုင်ရာနှင့် ပရောဂျက်အလိုက် အထူးပြု ဆက်တင်များကို ထိရောက်စွာ ဖွဲ့စည်းနိုင်သည်
- မတူညီသော ဆက်တင်များရှိသည့် ပတ်ဝန်းကျင်များကို စီမံနိုင်သည်
- လုံခြုံစိတ်ချစိတ်ချရသော အတည်ပြုခြင်းနှင့် အခြားအရာများကို အကောင်အထည်ဖော်နိုင်သည်
- စိတ်ရှုပ်ထွေးသော တာဝန်များ အတွက် အဆင့်မြင့် ဖွဲ့စည်းမှု ပုံစံများကို နားလည်နိုင်သည်

## သင်ယူပြီးရလဒ်များ

ဤသင်ခန်းစာပြီးဆုံးချိန်တွင် သင်သည်:
- ဖွံ့ဖြိုးရေးလုပ်ငန်းစဉ်များအတွက် azd ကို ထိရောက်စွာ ဖွဲ့စည်းနိုင်မည်
- အစိတ်အပိုင်းများစွာပါသော တပ်ဆင်ရေး ပတ်ဝန်းကျင်များကို စီမံထိန်းသိမ်းနိုင်မည်
- လုံခြုံစိတ်ချစေသော ဖွဲ့စည်းမှု စီမံခန့်ခွဲမှု အလေ့အထများကို အကောင်အထည်ဖော်နိုင်မည်
- ဖွဲ့စည်းမှု နှင့် ပတ်သက်သည့် ပြဿနာများကို ဖြေရှင်းနိုင်မည်
- အဖွဲ့အစည်း အလိုအပ်ချက်အရ azd အပြုအမူကို ကိုယ်ပိုင်ပြင်ဆင်နိုင်မည်

ဤ တိကျပြည့်စုံသော လမ်းညွှန်အုပ်စုသည် Azure Developer CLI ကို ဖွဲ့စည်းရေးနှင့် တပ်ဆင်ရေးလုပ်ငန်းစဉ်များအတွက် ထိရောက်စွာ အသုံးပြုနိုင်အောင် ဆက်တင်ဆိုင်ရာ အားလုံးကို ဖုံးလွှမ်းသည်။

## azd ပရောဂျက်အတွင်း AI ကိုယ်စားလှယ်များကို နားလည်ခြင်း

AI agent များနှင့် ပတ်သက်ပြီး အသစ်ဖြစ်ပါက azd ဆိုင်ရာ ပတ်ဝန်းကျင်အတွင်း ၎င်းတို့ကို စဉ်းစားရန် ရိုးရှင်းသော နည်းလမ်းကို အောက်တွင် ဖော်ပြထားသည်။

### ကိုယ်စားလှယ် ဆိုတာဘာလဲ?

ကိုယ်စားလှယ်သည် တောင်းဆိုချက်တစ်ခုကို လက်ခံကာ အကြံပြုချက်ပေးနိုင်ပြီး လုပ်ဆောင်ချက်များကို ဆောင်ရွက်သည့် ဆော့ဖ်ဝဲ တစ်စိတ်တစ်ပိုင်းဖြစ်သည်။ ယခုပုံစံတွင် အများအားဖြင့် AI မော်ဒယ်ကို ခေါ်ယူခြင်း၊ ဒေတာရှာဖွေခြင်း သို့မဟုတ် အခြားဝန်ဆောင်မှုများကို ဖိတ်ခေါ်ခြင်းတို့ကို လုပ်ဆောင်တတ်သည်။ azd ပရောဂျက်တစ်ခုတွင်း  ကိုယ်စားလှယ်သည် သင်၏ ဝက်ဘ် ဖရန့်အင် သို့မဟုတ် API နောက်ခံနှင့် အတူတူ **ဝန်ဆောင်မှု** တစ်ခုတည်းသာ ဖြစ်သည်။

### ကိုယ်စားလှယ်များသည် azd ပရောဂျက် ဖွဲ့စည်းပုံတွင် ဘယ်လို တင်ဆက်လဲ

azd ပရောဂျက်သည် သုံးလွှာဖြင့် ဖွဲ့စည်းထားသည် - **အင်ဖရာစထာ**, **ကုဒ်**, နှင့် **ဖွဲ့စည်းမှု**။ ကိုယ်စားလှယ်များသည် အခြား ဝန်ဆောင်မှုများကဲ့သို့ ထိုအထပ်များထဲသို့ ဆက်သွယ်ထည့်သွင်းထားသည်။

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **အင်ဖရာစထာ** (`infra/`) | ဝက်ဘ်အက်ပ်နှင့် ဒေတာဘေ့စ်ကို တည်ဆောက်ပေးသည် | AI မော်ဒယ် endpoint, ရှာဖွေမှု index သို့မဟုတ် ကိုယ်စားလှယ် ကို ဟိုစ့် ပြုလုပ်ရန် host ကို တည်ဆောက်ပေးသည် |
| **ကုဒ်** (`src/`) | ရှေ့ပိုင်း အင်တာဖေ့စ်နှင့် API ရင်းမြစ်ကုဒ်များပါဝင်သည် | သင့် ကိုယ်စားလှယ် လိုဂစ်နှင့် prompt သတ်မှတ်ချက်များ ပါဝင်သည် |
| **ဖွဲ့စည်းမှု** (`azure.yaml`) | သင့် ဝန်ဆောင်မှုများနှင့် ၎င်းတို့ကို မည်နေရာတွင် ဟိုစ့် လုပ်မည်ကို စာရင်းပြုစုထားသည် | သင့် ကိုယ်စားလှယ်ကို ဝန်ဆောင်မှုတစ်ခုအဖြစ် စာရင်းပြုစုပြီး ၎င်း၏ ကုဒ်နှင့် ဟိုစ့်ကို ညွှန်ပြထားသည် |

### `azure.yaml` ၏ အခန်းကဏ္ဍ

ယခုအချိန်တွင် syntax ကို မှတ်မိရန် မလိုအပ်ပါ။ အယူအဆအားဖြင့် `azure.yaml` သည် azd သို့ အောက်ပါအရာများကို ပြောပြသည့် ဖိုင်ဖြစ်သည် - *"ဤမှာ ကျွန်ုပ်၏ အက်ပလီကေးရှင်းကို ဖွဲ့စည်းသည့် ဝန်ဆောင်မှုများ ရှိပြီး ၎င်းတို့၏ ကုဒ်ကို ရှာမည့် နေရာများ ဖြစ်သည်။"*

သင့် ပရောဂျက်တွင် AI ကိုယ်စားလှယ်ပါဝင်ပါက `azure.yaml` သည် ၎င်းကို ဝန်ဆောင်မှုတစ်ခုအဖြစ်သာ စာရင်းပြုစုသည်။ ထို့နောက် azd သည် အမှန်တကယ် အင်ဖရာစထာ (ဥပမာ Microsoft Foundry Models endpoint သို့မဟုတ် ကိုယ်စားလှယ်ကို ဟိုစ့် ဆောင်ရန် Container App) ကို တည်ဆောက်ပေးရန်နှင့် သင့် ကိုယ်စားလှယ် ကုဒ်ကို တပ်ဆင်ပေးရန် သိရှိသွားမည်ဖြစ်သည် — ဝက်ဘ်အက်ပ် သို့မဟုတ် API အတွက် လုပ်သည့် နည်းလမ်းတူပင် ဖြစ်သည်။

ဒီအရာကြောင့် အခြေခံအဆင့်တွင် သင်သင်ယူရန် အသစ်အဆန်း အရာ မရှိပါ။ azd သည် ဝက်ဘ် ဝန်ဆောင်မှုကို ပြုလုပ်သည့်နည်းလမ်းကို နားလည်ပြီးသားဖြစ်လျှင် ကိုယ်စားလှယ်ကို မည်သို့ စီမံကြောင်းလည်း နားလည်ထားပါပြီ။

## ဖွဲ့စည်းမှု အဆင့်စဉ်

azd သည် အဆင့်လိုက် ဖွဲ့စည်းမှု စနစ်ကို အသုံးပြုသည်။
1. **ကွန်မန်ဒ်လိုင်း အလံများ** (အမြင့်ဆုံး ဦးစားပေး)
2. **ပတ်ဝန်းကျင် အပြောင်းအလဲများ (environment variables)**
3. **ဒေသဆိုင်ရာ ပရောဂျက် ဖွဲ့စည်းမှု** (`.azd/config.json`)
4. **ကမ္ဘာလုံးဆိုင်ရာ အသုံးပြုသူ ဖွဲ့စည်းမှု** (`~/.azd/config.json`)
5. **ပုံမှန်တန်ဖိုးများ** (အနိမ့်ဆုံး ဦးစားပေး)

## ကမ္ဘာလုံးဆိုင်ရာ ဖွဲ့စည်းမှု

### ကမ္ဘာလုံးဆိုင်ရာ ပုံမှန်များ သတ်မှတ်ခြင်း
```bash
# ပုံသတ်ထားသော စာရင်းကို သတ်မှတ်ပါ
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ပုံသတ်ထားသော တည်နေရာကို သတ်မှတ်ပါ
azd config set defaults.location "eastus2"

# ပုံသတ်ထားသော ရင်းမြစ်အုပ်စု နာမည်ပုံစံကို သတ်မှတ်ပါ
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# ကမ္ဘာလုံးဆိုင်ရာ ဖွဲ့စည်းပုံအားလုံးကို ကြည့်ရှုပါ
azd config show

# ဖွဲ့စည်းပုံကို ဖျက်ပါ
azd config unset defaults.location
```

### ပုံမှန် ကမ္ဘာလုံးဆိုင်ရာ ဆက်တင်များ
```bash
# ဖွံ့ဖြိုးရေး ကြိုက်နှစ်သက်ချက်များ
azd config set alpha.enable true                    # Alpha အင်္ဂါရပ်များကို ဖွင့်ရန်
azd config set telemetry.enabled false             # Telemetry ကို ပိတ်ရန်
azd config set output.format json                  # အထွက် ပုံစံကို သတ်မှတ်ပါ

# လုံခြုံရေး ဆက်တင်များ
azd config set auth.useAzureCliCredential true     # အတည်ပြုရန် Azure CLI ကို အသုံးပြုပါ
azd config set tls.insecure false                  # TLS အတည်ပြုမှုကို အတင်းအကျပ် အကောင်အထည်ဖော်ပါ

# စွမ်းဆောင်ရည် ချိန်ညှိခြင်း
azd config set provision.parallelism 5             # တပြိုင်နက် အရင်းအမြစ် ဖန်တီးခြင်း
azd config set deploy.timeout 30m                  # တပ်ဆင်ခြင်း အချိန်ကန့်သတ်
```

## 🏗️ ပရောဂျက် ဖွဲ့စည်းမှု

### `azure.yaml` ဖွဲ့စည်းပုံ
`azure.yaml` ဖိုင်သည် azd ပရောဂျက်၏ နှလုံးသားဖြစ်သည်:

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

### ဝန်ဆောင်မှု ဖွဲ့စည်းမှု ရွေးချယ်စရာများ

#### ဟိုစ့် အမျိုးအစားများ
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

#### ဘာသာစကား အထူးဆိုင်ရာ ဆက်တင်များ
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
# ပတ်ဝန်းကျင်အသစ် တစ်ခု ဖန်တီးပါ
azd env new development

# သတ်မှတ်ထားသော တည်နေရာဖြင့် ဖန်တီးပါ
azd env new staging --location "westus2"

# နမူနာမှ ဖန်တီးပါ
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ပတ်ဝန်းကျင် ဖွဲ့စည်းမှု
ပတ်ဝန်းကျင်တိုင်းတွင် ၎င်း၏ ကိုယ်ပိုင် ဖွဲ့စည်းမှုကို `.azure/<env-name>/config.json` တွင် သိမ်းဆည်းထားသည်:

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

### ပတ်ဝန်းကျင် အပြောင်းအလဲများ
```bash
# ပတ်ဝန်းကျင်အလိုက် သတ်မှတ်ရမည့် ဗားရီးယာများကို သတ်မှတ်ပါ
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# ပတ်ဝန်းကျင်ဗားရီးယာများကို ကြည့်ပါ
azd env get-values

# မျှော်လင့်ရသော ထုတ်လွှင့်ချက်:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# ပတ်ဝန်းကျင်ဗားရီးယာကို ဖယ်ရှားပါ
azd env unset DEBUG

# ဖယ်ရှားမှုကို အတည်ပြုပါ
azd env get-values | grep DEBUG
# (ဘာမှ မပြန်လာသင့်ပါ)
```

### ပတ်ဝန်းကျင် တမ်းပလိတ်များ
ပတ်ဝန်းကျင် တူညီမှုရှိစေရန် `.azure/env.template` ကို ဖန်တီးပါ:
```bash
# လိုအပ်သော ပြောင်းလဲနိုင်သော တန်ဖိုးများ
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# အပလီကေးရှင်း ဆက်တင်များ
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ရွေးချယ်နိုင်သည့် ဖွံ့ဖြိုးရေး ဆက်တင်များ
DEBUG=false
LOG_LEVEL=info
```

## 🔐 အတည်ပြုခြင်း ဖွဲ့စည်းမှု

### Azure CLI ပူးပေါင်းမှု
```bash
# Azure CLI လက်မှတ်များကို အသုံးပြုပါ (ပုံမှန်)
azd config set auth.useAzureCliCredential true

# သတ်မှတ်ထားသည့် tenant ဖြင့် အကောင့်ဝင်ပါ
az login --tenant <tenant-id>

# ပုံမှန် subscription ကို သတ်မှတ်ပါ
az account set --subscription <subscription-id>
```

### Service Principal ဖြင့် အတည်ပြုခြင်း
CI/CD လိုင်းများအတွက်:
```bash
# ပတ်ဝန်းကျင် တန်ဖိုးများကို သတ်မှတ်ပါ
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# သို့မဟုတ် တိုက်ရိုက် ဖွဲ့စည်းပြင်ဆင်ပါ
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Azure တွင် ဟိုစ့် ထားသော ပတ်ဝန်းကျင်များအတွက်:
```bash
# စီမံထားသော identity အတည်ပြုမှုကို ဖွင့်ပါ
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ အင်ဖရာစထာ ဖွဲ့စည်းမှု

### Bicep ပါရာမီတာများ
အင်ဖရာစထာ ပါရာမီတာများကို `infra/main.parameters.json` တွင် ပြင်ဆင်ပါ:
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

### Terraform ဖွဲ့စည်းမှု
Terraform ပရောဂျက်များအတွက် `infra/terraform.tfvars` တွင် ပြင်ဆင်ပါ:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 တပ်ဆင်ရေး ဖွဲ့စည်းမှု

### ဆောက်လုပ်မှု ဖွဲ့စည်းမှု
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

### Docker ဖွဲ့စည်းမှု
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

## 🔧 အဆင့်မြင့် ဖွဲ့စည်းမှု

### စိတ်ကြိုက် အရင်းအမြစ် အမည်ပေးခြင်း
```bash
# နာမည်ပေးစည်းမျဉ်းများ သတ်မှတ်ပါ
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### နက်ဝပ် ဖွဲ့စည်းမှု
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### စောင့်ကြည့်မှု ဖွဲ့စည်းမှု
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

## 🎯 ပတ်ဝန်းကျင်အလိုက် အထူး ဖွဲ့စည်းမှုများ

### ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်
```bash
# .azure/ဖွံ့ဖြိုးရေး/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### စမ်းသပ်ပတ်ဝန်းကျင်
```bash
# .azure/staging/.env
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

## 🔍 ဖွဲ့စည်းမှု တိကျမှု စစ်ဆေးရေး

### ဖွဲ့စည်းမှု စစ်ဆေးပါ
```bash
# ဆက်တင်ဖိုင်၏ ပုံစံကို စစ်ဆေးပါ
azd config validate

# ပတ်ဝန်းကျင် မူလတန်ဖိုးများကို စမ်းသပ်ပါ
azd env get-values

# အခြေခံအဆောက်အအုံကို အတည်ပြုပါ
azd provision --dry-run
```

### ဖွဲ့စည်းမှု Script များ
စစ်ဆေးရေး script များကို `scripts/` တွင် ဖန်တီးပါ:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# လိုအပ်သော ပတ်ဝန်းကျင်တန်ဖိုးများကို စစ်ဆေးပါ
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml ရဲ့ စာလုံးပုံစံကို စစ်ဆေးပါ
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ

### 1. ပတ်ဝန်းကျင် အပြောင်းအလဲများကို အသုံးပြုပါ
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ဖွဲ့စည်းရေး ဖိုင်များကို စုပေါင်းစီမံပါ
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

### 3. ဗားရှင်း ထိန်းချုပ်မှု အတွက် စဉ်းစားရန်အချက်များ
```bash
# .gitignore
.azure/*/config.json         # ပတ်ဝန်းကျင် ဆက်တင်များ (ရင်းမြစ် ID များ ပါဝင်သည်)
.azure/*/.env               # ပတ်ဝန်းကျင် ပြောင်းလဲနိုင်သော တန်ဖိုးများ (လျှို့ဝှက်များ ပါဝင်နိုင်သည်)
.env                        # ဒေသခံ ပတ်ဝန်းကျင် ဖိုင်
```

### 4. ဖွဲ့စည်းမှု စာတမ်းများ
သင့် ဖွဲ့စည်းမှုကို `CONFIG.md` တွင် မှတ်တမ်းတင်ပါ:
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

### လေ့ကျင့်ခန်း 1: မျိုးစုံ ပတ်ဝန်းကျင် ဖွဲ့စည်းမှု (15 မိနစ်)

**ရည်ရွယ်ချက်**: အဆင့်မတူသော ဆက်တင်များဖြင့် ပတ်ဝန်းကျင် သုံးခုကို ဖန်တီးပြီး ပြင်ဆင်ပါ

```bash
# ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်ကို ဖန်တီးပါ
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# စတေဂျင်း ပတ်ဝန်းကျင်ကို ဖန်တီးပါ
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# ထုတ်လုပ်မှု ပတ်ဝန်းကျင်ကို ဖန်တီးပါ
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ပတ်ဝန်းကျင်တိုင်းကို စစ်ဆေးပါ
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**အောင်မြင်မှု အခြေခံညွှန်းချက်များ:**
- [ ] ပတ်ဝန်းကျင် သုံးခုကို အောင်မြင်စွာ ဖန်တီးထားသည်
- [ ] ပတ်ဝန်းကျင် များတိုင်းအတွက် ထူးခြားသော ဖွဲ့စည်းမှုရှိသည်
- [ ] အမှားများဖြစ်စေခြင်းမရှိဘဲ ပတ်ဝန်းကျင်များအကြား ပြောင်းလဲနိုင်သည်
- [ ] `azd env list` သည် ပတ်ဝန်းကျင် သုံးခုလုံးကို ပြသသည်

### လေ့ကျင့်ခန်း 2: လျှို့ဝှက်မှု စီမံခန့်ခွဲမှု (10 မိနစ်)

**ရည်ရွယ်ချက်**: ထိခိုက်နိုင်သော ဒေတာများနှင့် လုံခြုံစိတ်ချစေသော ဖွဲ့စည်းမှုကို လေ့ကျင့်ပါ

```bash
# လျှို့ဝှက်ချက်များ သတ်မှတ်ပါ (အထွက်တွင် မပြပါ)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# လျှို့ဝှက်မဟုတ်သော ဆက်တင်ကို သတ်မှတ်ပါ
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ပတ်ဝန်းကျင်ကို ကြည့်ပါ (လျှို့ဝှက်ချက်များကို ဖုံးအုပ်ထားရမည်)
azd env get-values

# လျှို့ဝှက်ချက်များ သိမ်းဆည်းထားကြောင်း အတည်ပြုပါ
azd env get DB_PASSWORD  # အစစ်တန်ဖိုးကို ပြသသင့်သည်
```

**အောင်မြင်မှု အခြေခံညွှန်းချက်များ:**
- [ ] လျှို့ဝှက်ချက်များကို terminal တွင် ပြသခြင်းမရှိဘဲ သိမ်းဆည်းထားသည်
- [ ] `azd env get-values` သည် ဖျောက်ထားသော လျှို့ဝှက်ချက်များကို ပြသသည်
- [ ] တစ်ခုချင်း `azd env get <SECRET_NAME>` သည် အမှန်တကယ် တန်ဖိုးကို ရယူနိုင်သည်

## နောက်တိုးဆက်အရာများ

- [သင်၏ ပထမစီမံကိန်း](first-project.md) - ဖွဲ့စည်းမှုကို လက်တွေ့ အသုံးပြုပါ
- [တပ်ဆင်ခြင်း လမ်းညွှန်](../chapter-04-infrastructure/deployment-guide.md) - တပ်ဆင်ရေးအတွက် ဖွဲ့စည်းမှုကို အသုံးပြုပါ
- [ရင်းမြစ်များ ပံ့ပိုးခြင်း](../chapter-04-infrastructure/provisioning.md) - ထုတ်လုပ်ရေး အသင့် ဖွဲ့စည်းမှုများ

## ကိုးကားချက်များ

- [azd ဖွဲ့စည်းမှု ကိုးကားချက်](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml ပုံစံ (Schema)](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [ပတ်ဝန်းကျင် အပြောင်းအလဲများ (Environment Variables)](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**အခန်း လမ်းကြောင်း:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD အခြေခံများ](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 3 - ဖွဲ့စည်းမှုနှင့် အတည်ပြုခြင်း
- **⬅️ ယခင်**: [သင်၏ ပထမစီမံကိန်း](first-project.md)
- **➡️ နောက်တစ်ခု**: [အခန်း ၄: အင်ဖရာစထာ ကို ကုဒ်ဖြင့်](../chapter-04-infrastructure/deployment-guide.md)
- **နောက်သင်ခန်းစာ**: [သင်၏ ပထမစီမံကိန်း](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန် ဝန်ဆောင်မှုဖြစ်သည့် [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းပါသေးသော်လည်း၊ အလိုအလျှောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါ။ မူလစာရွက်စာတမ်းကို မူလဘာသာဖြင့် အာဏာပိုင် အရင်းမြစ်အဖြစ်ယူဆရမည်။ အရေးကြီးသော သတင်းအချက်အလက်များအတွက် လူ့ပရော်ဖက်ရှင်နယ် ဘာသာပြန်သူ၏ ဘာသာပြန်ချက်ကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုရာတွင် ဖြစ်ပေါ်လာမည့် နားမလည်မှုများ သို့မဟုတ် မှားဖော်ပြချက်များအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->