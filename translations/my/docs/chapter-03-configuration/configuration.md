# ချိန်ညှိမှု လမ်းညွှန်

**အခန်းလမ်းညွှန်:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိ အခန်း**: Chapter 3 - Configuration & Authentication
- **⬅️ အရင်**: [Your First Project](first-project.md)
- **➡️ နောက်တစ်ခု**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 နောက် အခန်း**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## နိဒါန်း

ဒီ စုံလင်သော လမ်းညွှန်သည် Azure Developer CLI ကို ဖွဲ့စည်းခြင်းနှင့် တပ်ဆင်ခြင်းဆိုင်ရာ အလုပ်လှုပ်ရှားမှုများအတွက် အကောင်းဆုံး ဖော်ပြမှုများနှင့် workflow များကို ပြုလုပ်နိုင်ရန် လိုအပ်သည့် အချက်အလက်များအားလုံးကို ဖော်ပြထားသည်။ သင်သည် ဖော်ပြချက် အဆင့်စဉ်၊ ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှု၊ အတည်ပြုနည်းလမ်းများနှင့် လုံခြုံစိတ်ချရသော နည်းစနစ်များကို လေ့လာသင်ယူမည်ဖြစ်သည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဒီနောက်ဆုံး သင်ခန်းစာရဲ့ အဆုံးတွင် သင်သည်:
- azd ဖော်ပြချက် အဆင့်စဉ်ကို ကျွမ်းကျင်ပြီး ဆက်တင်များ၏ ဦးစားပေးမှုကို နားလည်နိုင်မည်
- ကမ္ဘာလုံးဆိုင်ရာ (global) နှင့် ပရောဂျက်-ပုံစံ အဆင့်များကို ထိရောက်စွာ သတ်မှတ်နိုင်မည်
- ကွဲပြားသော ဖော်ပြချက်များဖြင့် အချက်အလတ်များ အများအပြားကို စီမံနိုင်မည်
- လုံခြုံသော အတည်ပြုခြင်းနှင့် လိုင်စင်ပေးခြင်း နည်းပညာများကို အကောင်အထည်ဖော်နိုင်မည်
- မှန်ကန်လုံခြုံ၍ ထိရောက်သော Azure တင်သွင်းမှုများအတွက် တိုးတက်သော ဖော်ပြချက် ပုံစံများကို နားလည်နိုင်မည်

## သင်ယူပြီးရမည့် ရလဒ်များ

ဒီသင်ခန်းစာကို ပြီးမြောက်စေရင် သင်သည်:
- ဖော်ပြချက်အတွက် azd ကို သင့်ဖွံ့ဖြိုးရေး workflow အတွက် အကောင်းဆုံး သတ်မှတ်နိုင်မည်
- တင်သွင်းရေး ပတ်ဝန်းကျင်များ အများအပြားကို တပ်ဆင်၊ စီမံမည်
- လုံခြုံသော ဖော်ပြချက် စီမံခန့်ခွဲမှု လုပ်ထုံးလုပ်နည်းများကို အကောင်အထည် ဖော်ဆောင်မည်
- ဖော်ပြချက်နှင့် ပတ်သက်သော ပြဿနာများကို ဖြေရှင်းနိုင်မည်
- အဖွဲ့အစည်း၏ တိကျသော လိုအပ်ချက်များအတွက် azd အပြုအမူကို ဖြည့်ဆည်းပြောင်းလဲနိုင်မည်

ဒီ စုံလင်သော လမ်းညွှန်သည် Azure Developer CLI ကို ဖော်ပြချက်နှင့် တပ်ဆင်မှုဆိုင်ရာ အလုပ်လှုပ်ရှားမှုများအတွက် အကောင်းဆုံး ဖော်ပြနိုင်ရန် အချက်အလက်အားလုံးကို ဖော်ပြထားသည်။

## ဖော်ပြချက် အဆင့်လိုက်စနစ်

azd သည် အဆင့်လိုက် ဖော်ပြချက် စနစ်ကို အသုံးပြုသည်:
1. **ကွန်မန်းဒ်လိုင်း အချက်ပြများ** (အမြင့်ဆုံး ဦးစားပေး)
2. **ပတ်ဝန်းကျင် ပြောင်းလဲတန်ဖိုးများ**
3. **Local ပရောဂျက် ဖော်ပြချက်** (`.azd/config.json`)
4. **Global အသုံးပြုသူ ဖော်ပြချက်** (`~/.azd/config.json`)
5. **ပုံမှန် တန်ဖိုးများ** (အနည်းဆုံး ဦးစားပေး)

## Global ဖော်ပြချက်

### ကမ္ဘာလုံးဆိုင်ရာ ဒေဖော်လ್ಟ್ တန်ဖိုးများ သတ်မှတ်ခြင်း
```bash
# ပုံမှန် စာရင်းဝင်မှုကို သတ်မှတ်ပါ
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ပုံမှန် တည်နေရာကို သတ်မှတ်ပါ
azd config set defaults.location "eastus2"

# ပုံမှန် အရင်းအမြစ်အုပ်စု အမည်ပုံစံကို သတ်မှတ်ပါ
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# ကမ္ဘာလုံးဆိုင်ရာ ဆက်တင်များအားလုံးကို ကြည့်ရှုပြပါ
azd config list

# ဆက်တင်တစ်ခုကို ဖျက်ပါ
azd config unset defaults.location
```

### ကမ္ဘာလုံးဆိုင်ရာ အသုံးများ သတ်မှတ်ချက်များ
```bash
# ဖွံ့ဖြိုးရေး စိတ်ကြိုက်ရွေးချယ်ချက်များ
azd config set alpha.enable true                    # အယ်လ်ဖာ အင်္ဂါရပ်များ ဖွင့်ပါ
azd config set telemetry.enabled false             # တယ်လီမက်ထရီ ပိတ်ပါ
azd config set output.format json                  # ထုတ်လွှင့်ပုံစံ သတ်မှတ်ပါ

# လုံခြုံရေး ဆက်တင်များ
azd config set auth.useAzureCliCredential true     # Azure CLI ကို အတည်ပြုရေးအတွက် အသုံးပြုပါ
azd config set tls.insecure false                  # TLS အတည်ပြုမှုကို အကောင်အထည်ဖော်ပါ

# စွမ်းဆောင်ရည် ချိန်ညှိခြင်း
azd config set provision.parallelism 5             # အရင်းအမြစ်များကို တန်းချင်းတူ ဖန်တီးခြင်း
azd config set deploy.timeout 30m                  # ဖြန့်ချိမှု အချိန်ကုန်ဆုံးချိန်
```

## 🏗️ ပရောဂျက် ဖော်ပြချက်

### azure.yaml ဖွဲ့စည်းပုံ
`azure.yaml` ဖိုင်သည် သင့် azd ပရောဂျက်၏ အနှလုံးဖြစ်သည်:

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

#### ဘာသာစကား အထူးသတ်မှတ်ချက်များ
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

### ပတ်ဝန်းကျင် ဖန်တီးခြင်း
```bash
# ပတ်ဝန်းကျင်အသစ် တစ်ခု ဖန်တီးပါ
azd env new development

# သတ်မှတ်ထားသော တည်နေရာဖြင့် ဖန်တီးပါ
azd env new staging --location "westus2"

# နမူနာမှ ဖန်တီးပါ
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ပတ်ဝန်းကျင် ဖော်ပြချက်
ပတ်ဝန်းကျင် တစ်ခုစီသည် သူ့ကိုယ်ပိုင် ဖော်ပြချက်ကို `.azure/<env-name>/config.json` ထဲတွင် ရှိသည်:

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

### ပတ်ဝန်းကျင် ပြောင်းလဲတန်ဖိုးများ
```bash
# ပတ်ဝန်းကျင်အလိုက် အသုံးပြုမည့် ပြောင်းလဲနိုင်သော အချက်အလက်များကို သတ်မှတ်ပါ
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# ပတ်ဝန်းကျင်အချက်အလက်များကို ကြည့်ပါ
azd env get-values

# မျှော်မှန်းထားသော အထွက်:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# ပတ်ဝန်းကျင်အချက်အလက်ကို ဖယ်ရှားပါ
azd env unset DEBUG

# ဖယ်ရှားမှုကို အတည်ပြုပါ
azd env get-values | grep DEBUG
# (ဘာမှ မပြန်လာသင့်ပါ)
```

### ပတ်ဝန်းကျင် နမူနာဖိုင်များ
နည်းတူ ပတ်ဝန်းကျင် တည်ဆောက်မှုများအတွက် `.azure/env.template` ဖိုင်ကို ဖန်တီးပါ:
```bash
# လိုအပ်သော ပြောင်းလဲနိုင်သော တန်ဖိုးများ
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# အက်ပလီကေးရှင်း ဆက်တင်များ
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ရွေးချယ်လို့ရသော ဖွံ့ဖြိုးရေး ဆက်တင်များ
DEBUG=false
LOG_LEVEL=info
```

## 🔐 အတည်ပြုခြင်း ဖော်ပြချက်

### Azure CLI ပေါင်းစည်းခြင်း
```bash
# Azure CLI အကောင့်အချက်အလက်များကို အသုံးပြုပါ (ပုံမှန်)
azd config set auth.useAzureCliCredential true

# သတ်မှတ်ထားသော tenant ဖြင့် အကောင့်ဝင်ပါ
az login --tenant <tenant-id>

# ပုံမှန် subscription ကို သတ်မှတ်ပါ
az account set --subscription <subscription-id>
```

### Service Principal အတည်ပြုခြင်း
CI/CD pipeline များအတွက်:
```bash
# ပတ်ဝန်းကျင် တန်ဖိုးများကို သတ်မှတ်ပါ
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# သို့မဟုတ် တိုက်ရိုက် ဆက်တင်ပြင်ဆင်ပါ
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Azure ပေါ်တွင် တင်ထားသော ပတ်ဝန်းကျင်များအတွက်:
```bash
# စီမံထားသော Identity အတည်ပြုမှုကို ဖွင့်ပါ
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ အောက်ခံ အဆောက်အုံ ဖော်ပြချက်

### Bicep ပါရာမီတာများ
အောက်ခံအဆောက်အအုံ ပါရာမီတာများကို `infra/main.parameters.json` ထဲတွင် သတ်မှတ်ပါ:
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
Terraform ပရောဂျက်များအတွက် `infra/terraform.tfvars` ထဲတွင် သတ်မှတ်ပါ:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 တင်သွင်းမှု ဖော်ပြချက်

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

## 🔧 တိုးတက်သော ဖော်ပြချက်များ

### အရင်းအမြစ် အမည်ထူးခြားခြင်း
```bash
# နာမည်ပေးစည်းမျဉ်းများ သတ်မှတ်ပါ
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### ကွန်ရက် ဖော်ပြချက်
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### ကြည့်ရှု စောင့်ကြပ်ရေး ဖော်ပြချက်
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

## 🎯 ပတ်ဝန်းကျင်အလိုက် သတ်မှတ်ချက်များ

### ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်
```bash
# .azure/ဖွံ့ဖြိုးရေး/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### စတေဂ် (Staging) ပတ်ဝန်းကျင်
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

## 🔍 ဖော်ပြချက် အတည်ပြုချက်

### ဖော်ပြချက် အတည်ပြုခြင်း
```bash
# ဆက်တင်၏ သဒ္ဒါကို စစ်ဆေးပါ
azd config validate

# ပတ်ဝန်းကျင် အပြောင်းအလဲများကို စမ်းသပ်ပါ
azd env get-values

# အောက်ခံအဆောက်အအုံကို အတည်ပြုပါ
azd provision --dry-run
```

### ဖော်ပြချက် စကရစ်များ
စာရင်း `scripts/` ထဲတွင် အတည်ပြု စကရစ်များကို ဖန်တီးပါ:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# လိုအပ်သော ပတ်ဝန်းကျင် အပြောင်းအလဲ (environment variables) များကို စစ်ဆေးပါ
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml ဖိုင်၏ သဒ္ဒါ (syntax) ကို စစ်ဆေးပါ
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ

### 1. ပတ်ဝန်းကျင် ပြောင်းလဲတန်ဖိုးများကို အသုံးပြုပါ
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ဖော်ပြချက် ဖိုင်များကို တိကျစွာ စီစဉ်ပါ
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

### 3. ဗားရှင်း ထိန်းချုပ်မှု စဉ်းစားချက်များ
```bash
# .gitignore
.azure/*/config.json         # ပတ်ဝန်းကျင် ဆက်တင်များ (အရင်းအမြစ် ID များ ပါဝင်သည်)
.azure/*/.env               # ပတ်ဝန်းကျင်ချိန်ညှိ အချက်များ (လျှို့ဝှက်ချက်များ ပါဝင်နိုင်သည်)
.env                        # ဒေသဆိုင်ရာ ပတ်ဝန်းကျင် ဖိုင်
```

### 4. ဖော်ပြချက် စာတမ်းရေးသားခြင်း
သင်၏ ဖော်ပြချက်ကို `CONFIG.md` တွင် စာတမ်းပြုစုပါ:
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

## 🎯 လက်တွေ့ လေ့ကျင့်ရေး လေ့ကျင့်ခန်းများ

### လေ့ကျင့်ခန်း 1: Multi-Environment Configuration (15 minutes)

**ရည်မှန်းချက်**: အပတ်ဝန်းကျင် သုံးမျိုးကို ဖန်တီး၍ မတူညီသော ဖော်ပြချက်များဖြင့် သတ်မှတ်ပါ

```bash
# ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင် ဖန်တီးပါ
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# staging ပတ်ဝန်းကျင် ဖန်တီးပါ
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# ထုတ်လုပ်ရေး ပတ်ဝန်းကျင် ဖန်တီးပါ
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ပတ်ဝန်းကျင် တစ်ခုချင်းစီ စစ်ဆေးပါ
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**အောင်မြင်မှု စံပြ:**
- [ ] အပတ်ဝန်းကျင် သုံးခုကို အောင်မြင်စွာ ဖန်တီးပြီးပါပြီ
- [ ] သတ်မှတ်ထားသော ပတ်ဝန်းကျင်တိုင်းတွင် ထူးခြားသော ဖော်ပြချက်များ ရှိသည်
- [ ] ပတ်ဝန်းကျင်များကို အမှားမရှိ အသီးသီး ပြောင်းလဲနိုင်သည်
- [ ] `azd env list` သည် အပတ်ဝန်းကျင် သုံးခုလုံးကို ပြပါသည်

### လေ့ကျင့်ခန်း 2: Secret Management (10 minutes)

**ရည်မှန်းချက်**: အချက်အလက် အလျှို့ဝှက်များနှင့် ယုံကြည်စိတ်ချရသော ပေါင်းစည်းမှုကို လေ့ကျင့်ပါ

```bash
# လျှို့ဝှက်ချက်များကို သတ်မှတ်ပါ (အထွက်တွင် မပြပါ)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# လျှို့ဝှက်မဟုတ်သော ဆက်တင်ကို သတ်မှတ်ပါ
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ပတ်ဝန်းကျင်ကို ကြည့်ပါ (လျှို့ဝှက်ချက်များကို ဖယ်ရှားထားသင့်သည်)
azd env get-values

# လျှို့ဝှက်ချက်များ သိမ်းဆည်းထားကြောင်း အတည်ပြုပါ
azd env get DB_PASSWORD  # တကယ်တန်ဖိုးကို ပြသသင့်သည်
```

**အောင်မြင်မှု စံပြ:**
- [ ] လျှို့ဝှက်သတင်းအချက်အလက်များကို terminal တွင် ဖော်ပြမထားပဲ သိမ်းဆည်းထားသည်
- [ ] `azd env get-values` သည် လျှို့ဝှက်ချက်များကို ဖျော့ဖျက်ထားသဖြင့် ပြသည်
- [ ] တစ်ခုချင်း `azd env get <SECRET_NAME>` သည် အမှန်တန်ဖိုးကို ပြန်လည်ထုတ်ပေးနိုင်သည်

## နောက်တစ်ဆင့်များ

- [Your First Project](first-project.md) - ဖော်ပြချက်ကို လက်တွေ့အတွက် အသုံးပြုပါ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - တင်သွင်းရေးအတွက် ဖော်ပြချက်ကို အသုံးပြုပါ
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - ထုတ်လုပ်ရေးအသင့် ဖော်ပြချက်များ

## ရင်းမြစ်များ

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**အခန်းလမ်းညွှန်:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိ အခန်း**: Chapter 3 - Configuration & Authentication
- **⬅️ အရင်**: [Your First Project](first-project.md)
- **➡️ နောက် အခန်း**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ကြေညာချက်:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးပမ်းသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် တိကျမှုလျော့နည်းချက်များ ရှိနိုင်ပါကြောင်း သတိပြုပါ။ မူလစာတမ်းကို မူလဘာသာစကားဖြင့် အာဏာပိုင် အရင်းအမြစ်အဖြစ် သတ်မှတ်စဉ်းစားရပါမည်။ အရေးကြီးသော သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာနိုင်သည့် နားလည်မှုမှားယွင်းမှုများ သို့မဟုတ် မှားယွင်းဖော်ပြချက်များအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->