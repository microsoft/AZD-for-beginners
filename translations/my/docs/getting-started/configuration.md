# ဖွဲ့စည်းမှုလမ်းညွှန်

**အခန်းအတွင်း လမ်းကြောင်း:**
- **📚 သင်ခန်းစာအိမ်**: [AZD အခြေခံများ](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၃ - ဖွဲ့စည်းမှုနှင့် အတည်ပြုမှု
- **⬅️ အရင်**: [သင့်ရဲ့ ပထမဆုံး Project](first-project.md)
- **➡️ နောက်တစ်ခု**: [Deployment လမ်းညွှန်](../deployment/deployment-guide.md)
- **🚀 နောက်အခန်း**: [အခန်း ၄: Infrastructure as Code](../deployment/deployment-guide.md)

## မိတ်ဆက်

ဒီလမ်းညွှန်မှာ Azure Developer CLI ကို အကောင်းဆုံး ဖွဲ့စည်းမှုနှင့် တင်သွင်းမှုလုပ်ငန်းစဉ်များအတွက် ဖွဲ့စည်းပုံအဆင့်ဆင့်၊ ပတ်ဝန်းကျင်စီမံခန့်ခွဲမှု၊ အတည်ပြုမှုနည်းလမ်းများနှင့် အဆင့်မြင့်ဖွဲ့စည်းမှုပုံစံများကို လေ့လာနိုင်ပါမည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဒီသင်ခန်းစာအဆုံးသတ်ချိန်မှာ သင်သည်:
- azd ဖွဲ့စည်းမှုအဆင့်ဆင့်ကို ကျွမ်းကျင်ပြီး အဆင့်များကို ဘယ်လို ဦးစားပေးထားသည်ကို နားလည်နိုင်မည်
- Global နှင့် Project-specific ဖွဲ့စည်းမှုများကို ထိရောက်စွာ ဖွဲ့စည်းနိုင်မည်
- ပုံစံကွဲပြားသော ပတ်ဝန်းကျင်များစီမံနိုင်မည်
- လုံခြုံသော အတည်ပြုမှုနှင့် ခွင့်ပြုမှုပုံစံများကို အကောင်အထည်ဖော်နိုင်မည်
- ရှုပ်ထွေးသောအခြေအနေများအတွက် အဆင့်မြင့်ဖွဲ့စည်းမှုပုံစံများကို နားလည်နိုင်မည်

## သင်ယူပြီးရရှိမည့် ရလဒ်များ

ဒီသင်ခန်းစာပြီးဆုံးချိန်မှာ သင်သည်:
- azd ကို အကောင်းဆုံး ဖွဲ့စည်းမှုလုပ်ငန်းစဉ်များအတွက် ဖွဲ့စည်းနိုင်မည်
- တင်သွင်းမှု ပတ်ဝန်းကျင်များစီမံနိုင်မည်
- လုံခြုံသော ဖွဲ့စည်းမှုစီမံခန့်ခွဲမှု လုပ်ငန်းစဉ်များကို အကောင်အထည်ဖော်နိုင်မည်
- ဖွဲ့စည်းမှုနှင့်ဆိုင်သော ပြဿနာများကို ဖြေရှင်းနိုင်မည်
- အဖွဲ့အစည်းအလိုက် azd ကို စိတ်ကြိုက်ပြင်ဆင်နိုင်မည်

ဒီလမ်းညွှန်မှာ Azure Developer CLI ကို အကောင်းဆုံး ဖွဲ့စည်းမှုနှင့် တင်သွင်းမှုလုပ်ငန်းစဉ်များအတွက် အကျွမ်းတဝင် လေ့လာနိုင်ပါမည်။

## ဖွဲ့စည်းမှုအဆင့်ဆင့်

azd သည် အဆင့်ဆင့်ဖွဲ့စည်းမှုစနစ်ကို အသုံးပြုသည်:
1. **Command-line flags** (အမြင့်ဆုံး ဦးစားပေး)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (အနိမ့်ဆုံး ဦးစားပေး)

## Global ဖွဲ့စည်းမှု

### Global Defaults သတ်မှတ်ခြင်း
```bash
# ပုံမှန် subscription ကို သတ်မှတ်ပါ
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ပုံမှန် location ကို သတ်မှတ်ပါ
azd config set defaults.location "eastus2"

# ပုံမှန် resource group အမည်ပုံစံကို သတ်မှတ်ပါ
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# အားလုံးသော global configuration ကို ကြည့်ရှုပါ
azd config list

# configuration ကို ဖျက်ပါ
azd config unset defaults.location
```

### Global Settings အများဆုံးအသုံးပြုမှု
```bash
# ဖွံ့ဖြိုးတိုးတက်မှုနှစ်သက်မှုများ
azd config set alpha.enable true                    # အယ်ဖာအင်္ဂါရပ်များကိုဖွင့်ပါ
azd config set telemetry.enabled false             # တယ်လီမီတာကိုပိတ်ပါ
azd config set output.format json                  # အထွက်ပုံစံကိုသတ်မှတ်ပါ

# လုံခြုံရေးဆက်တင်များ
azd config set auth.useAzureCliCredential true     # အာဇာ CLI ကိုအသုံးပြု၍ အာသာပေးပါ
azd config set tls.insecure false                  # TLS အတည်ပြုမှုကိုအတိအကျလိုက်နာပါ

# စွမ်းဆောင်ရည်တိုးတက်မှု
azd config set provision.parallelism 5             # အရင်းအမြစ်များကိုမျဉ်းကြားဖန်တီးခြင်း
azd config set deploy.timeout 30m                  # တင်သွင်းမှုအချိန်ကုန်
```

## 🏗️ Project ဖွဲ့စည်းမှု

### azure.yaml ဖွဲ့စည်းမှု
`azure.yaml` ဖိုင်သည် သင့် azd project ၏ အဓိကဖြစ်သည်:

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

### Service ဖွဲ့စည်းမှုရွေးချယ်မှုများ

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

#### ဘာသာစကားအလိုက် ဖွဲ့စည်းမှုများ
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

## 🌟 ပတ်ဝန်းကျင်စီမံခန့်ခွဲမှု

### ပတ်ဝန်းကျင်များ ဖန်တီးခြင်း
```bash
# အခြေခံပတ်ဝန်းကျင်အသစ်တစ်ခုဖန်တီးပါ
azd env new development

# သတ်မှတ်ထားသောနေရာနှင့်ဖန်တီးပါ
azd env new staging --location "westus2"

# Template မှဖန်တီးပါ
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ပတ်ဝန်းကျင်ဖွဲ့စည်းမှု
တစ်ခုချင်းစီ ပတ်ဝန်းကျင်တွင် `.azure/<env-name>/config.json` တွင် ဖွဲ့စည်းမှုရှိသည်:

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

### ပတ်ဝန်းကျင် Variables
```bash
# ပတ်ဝန်းကျင်အထူးပြု အပြောင်းအလဲများကို သတ်မှတ်ပါ
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# ပတ်ဝန်းကျင်အပြောင်းအလဲများကို ကြည့်ရှုပါ
azd env get-values

# မျှော်မှန်းထားသော အထွက်:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# ပတ်ဝန်းကျင်အပြောင်းအလဲကို ဖယ်ရှားပါ
azd env unset DEBUG

# ဖယ်ရှားမှုကို အတည်ပြုပါ
azd env get-values | grep DEBUG
# (ဘာမှ မပြသသင့်ပါ)
```

### ပတ်ဝန်းကျင် Templates
ပုံမှန်ပတ်ဝန်းကျင်ဖွဲ့စည်းမှုအတွက် `.azure/env.template` ဖန်တီးပါ:
```bash
# လိုအပ်သောအပြောင်းအလဲများ
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# အပလီကေးရှင်းဆက်တင်များ
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ရွေးချယ်နိုင်သောဖွံ့ဖြိုးရေးဆက်တင်များ
DEBUG=false
LOG_LEVEL=info
```

## 🔐 အတည်ပြုမှုဖွဲ့စည်းမှု

### Azure CLI Integration
```bash
# Azure CLI အတည်ပြုချက်များ (default) ကို အသုံးပြုပါ။
azd config set auth.useAzureCliCredential true

# သတ်မှတ်ထားသော tenant ဖြင့် Login လုပ်ပါ။
az login --tenant <tenant-id>

# default subscription ကို သတ်မှတ်ပါ။
az account set --subscription <subscription-id>
```

### Service Principal Authentication
CI/CD pipelines အတွက်:
```bash
# ပတ်ဝန်းကျင်အပြောင်းအလဲများကို သတ်မှတ်ပါ
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# သို့မဟုတ် တိုက်ရိုက်ဖွဲ့စည်းပါ
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Azure-hosted ပတ်ဝန်းကျင်များအတွက်:
```bash
# စီမံခန့်ခွဲထားသော အတည်ပြုမှုအိုင်ဒင်တီကို ဖွင့်ပါ
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastructure ဖွဲ့စည်းမှု

### Bicep Parameters
`infra/main.parameters.json` တွင် infrastructure parameters ဖွဲ့စည်းပါ:
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
Terraform projects အတွက် `infra/terraform.tfvars` တွင် ဖွဲ့စည်းပါ:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Deployment ဖွဲ့စည်းမှု

### Build ဖွဲ့စည်းမှု
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
Example `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 အဆင့်မြင့်ဖွဲ့စည်းမှု

### Custom Resource Naming
```bash
# အမည်ပေးမှုစနစ်များကို သတ်မှတ်ပါ
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Network ဖွဲ့စည်းမှု
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Monitoring ဖွဲ့စည်းမှု
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

## 🎯 ပတ်ဝန်းကျင်အလိုက် ဖွဲ့စည်းမှုများ

### Development ပတ်ဝန်းကျင်
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Staging ပတ်ဝန်းကျင်
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Production ပတ်ဝန်းကျင်
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 ဖွဲ့စည်းမှုအတည်ပြုခြင်း

### ဖွဲ့စည်းမှုအတည်ပြုခြင်း
```bash
# ဖွဲ့စည်းမှုသဒ္ဒါကိုစစ်ဆေးပါ
azd config validate

# ပတ်ဝန်းကျင်အပြောင်းအလဲများကိုစမ်းသပ်ပါ
azd env get-values

# အခြေခံအဆောက်အအုံကိုအတည်ပြုပါ
azd provision --dry-run
```

### ဖွဲ့စည်းမှု Scripts
`scripts/` တွင် အတည်ပြုမှု scripts ဖန်တီးပါ:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# လိုအပ်သောပတ်ဝန်းကျင်အပြောင်းအလဲများကိုစစ်ဆေးပါ
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml syntax ကိုအတည်ပြုပါ
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 အကောင်းဆုံး လုပ်နည်းလမ်းများ

### 1. Environment Variables ကို အသုံးပြုပါ
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ဖွဲ့စည်းမှုဖိုင်များကို စနစ်တကျ စီစဉ်ပါ
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

### 3. Version Control အတွက် စဉ်းစားရန်
```bash
# .gitignore
.azure/*/config.json         # ပတ်ဝန်းကျင် configuration များ (resource ID များပါဝင်သည်)
.azure/*/.env               # ပတ်ဝန်းကျင် variable များ (လျှို့ဝှက်ချက်များပါဝင်နိုင်သည်)
.env                        # ဒေသခံပတ်ဝန်းကျင်ဖိုင်
```

### 4. ဖွဲ့စည်းမှု Documentation
`CONFIG.md` တွင် သင့်ဖွဲ့စည်းမှုကို Documentation ပြုလုပ်ပါ:
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

## 🎯 လက်တွေ့လေ့ကျင့်မှု အစီအစဉ်များ

### လေ့ကျင့်မှု ၁: Multi-Environment ဖွဲ့စည်းမှု (၁၅ မိနစ်)

**ရည်မှန်းချက်**: ပတ်ဝန်းကျင် ၃ ခုကို ဖန်တီးပြီး ကွဲပြားသော ဖွဲ့စည်းမှုများကို ဖွဲ့စည်းပါ

```bash
# ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်ကို ဖန်တီးပါ
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# စမ်းသပ်မှုပတ်ဝန်းကျင်ကို ဖန်တီးပါ
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# ထုတ်လုပ်မှုပတ်ဝန်းကျင်ကို ဖန်တီးပါ
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ပတ်ဝန်းကျင်တစ်ခုချင်းစီကို အတည်ပြုပါ
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**အောင်မြင်မှုအချက်များ:**
- [ ] ပတ်ဝန်းကျင် ၃ ခုကို အောင်မြင်စွာ ဖန်တီးနိုင်သည်
- [ ] တစ်ခုချင်းစီ ပတ်ဝန်းကျင်တွင် ကွဲပြားသော ဖွဲ့စည်းမှုရှိသည်
- [ ] ပတ်ဝန်းကျင်များအကြား အမှားမရှိဘဲ ပြောင်းနိုင်သည်
- [ ] `azd env list` တွင် ပတ်ဝန်းကျင် ၃ ခုလုံးကို ပြသနိုင်သည်

### လေ့ကျင့်မှု ၂: Secret Management (၁၀ မိနစ်)

**ရည်မှန်းချက်**: အရေးကြီးသော ဒေတာများကို လုံခြုံစွာ ဖွဲ့စည်းမှု လေ့ကျင့်ပါ

```bash
# လျှို့ဝှက်ချက်များကို သတ်မှတ်ပါ (output တွင် မပြသပါ)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# လျှို့ဝှက်မဟုတ်သော configuration ကို သတ်မှတ်ပါ
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ပတ်ဝန်းကျင်ကို ကြည့်ရှုပါ (လျှို့ဝှက်ချက်များကို ဖျက်ထားသင့်သည်)
azd env get-values

# လျှို့ဝှက်ချက်များ သိမ်းဆည်းထားသည်ကို အတည်ပြုပါ
azd env get DB_PASSWORD  # အမှန်တကယ်တန်ဖိုးကို ပြသသင့်သည်
```

**အောင်မြင်မှုအချက်များ:**
- [ ] Secrets ကို terminal တွင် မပြသဘဲ သိမ်းဆည်းနိုင်သည်
- [ ] `azd env get-values` တွင် redacted secrets ကို ပြသနိုင်သည်
- [ ] တစ်ခုချင်းစီ `azd env get <SECRET_NAME>` မှာ အမှန်တကယ်သော တန်ဖိုးကို ရယူနိုင်သည်

## နောက်တစ်ဆင့်များ

- [သင့်ရဲ့ ပထမဆုံး Project](first-project.md) - လက်တွေ့ဖွဲ့စည်းမှုကို အသုံးချပါ
- [Deployment လမ်းညွှန်](../deployment/deployment-guide.md) - ဖွဲ့စည်းမှုကို တင်သွင်းမှုအတွက် အသုံးချပါ
- [Provisioning Resources](../deployment/provisioning.md) - ထုတ်လုပ်မှုအဆင့် ဖွဲ့စည်းမှုများ

## ရင်းမြစ်များ

- [azd ဖွဲ့စည်းမှု ရင်းမြစ်](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**အခန်းအတွင်း လမ်းကြောင်း:**
- **📚 သင်ခန်းစာအိမ်**: [AZD အခြေခံများ](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၃ - ဖွဲ့စည်းမှုနှင့် အတည်ပြုမှု
- **⬅️ အရင်**: [သင့်ရဲ့ ပထမဆုံး Project](first-project.md)
- **➡️ နောက်အခန်း**: [အခန်း ၄: Infrastructure as Code](../deployment/deployment-guide.md)
- **နောက်သင်ခန်းစာ**: [သင့်ရဲ့ ပထမဆုံး Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->