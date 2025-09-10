<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7e50c994df9f71d709906549be362fc5",
  "translation_date": "2025-09-10T13:43:58+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "my"
}
-->
# ဖွဲ့စည်းမှုလမ်းညွှန်

## နိဒါန်း

ဒီလမ်းညွှန်စာအုပ်မှာ Azure Developer CLI ကို အကောင်းဆုံး ဖွံ့ဖြိုးတိုးတက်မှုနှင့် တင်သွင်းမှု လုပ်ငန်းစဉ်များအတွက် ဖွဲ့စည်းပုံဆိုင်ရာ အချက်အလက်များကို အပြည့်အစုံ ဖော်ပြထားပါတယ်။ ဖွဲ့စည်းမှုအဆင့်ဆင့်၊ ပတ်ဝန်းကျင်စီမံခန့်ခွဲမှု၊ အတည်ပြုမှုနည်းလမ်းများနှင့် အဆင့်မြင့်ဖွဲ့စည်းမှု ပုံစံများကို သင်လေ့လာပြီး Azure ကို ထိရောက်စွာနှင့် လုံခြုံစွာ တင်သွင်းနိုင်မည့် နည်းလမ်းများကို သိရှိနိုင်ပါမည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဒီသင်ခန်းစာအဆုံးတွင် သင်သည်:
- azd ဖွဲ့စည်းမှုအဆင့်ဆင့်ကို ကျွမ်းကျင်စွာ သိရှိပြီး အဆင့်သတ်မှတ်မှုများကို နားလည်မည်
- အထွေထွေနှင့် ပရောဂျက်အထူးသတ်မှတ်ချက်များကို ထိရောက်စွာ ဖွဲ့စည်းနိုင်မည်
- ပုံစံကွဲပြားသော ပတ်ဝန်းကျင်များကို စီမံခန့်ခွဲနိုင်မည်
- လုံခြုံမှုနှင့် ခွင့်ပြုချက်ပုံစံများကို အကောင်အထည်ဖော်နိုင်မည်
- ရှုပ်ထွေးသော အခြေအနေများအတွက် အဆင့်မြင့်ဖွဲ့စည်းမှု ပုံစံများကို နားလည်နိုင်မည်

## သင်ခန်းစာပြီးဆုံးချိန်တွင် ရရှိမည့် ရလဒ်များ

ဒီသင်ခန်းစာပြီးဆုံးချိန်တွင် သင်သည်:
- ဖွံ့ဖြိုးတိုးတက်မှု လုပ်ငန်းစဉ်များအတွက် azd ကို ထိရောက်စွာ ဖွဲ့စည်းနိုင်မည်
- တင်သွင်းမှု ပတ်ဝန်းကျင်များစွာကို စီမံခန့်ခွဲနိုင်မည်
- လုံခြုံမှုရှိသော ဖွဲ့စည်းမှု စီမံခန့်ခွဲမှု လုပ်ငန်းစဉ်များကို အကောင်အထည်ဖော်နိုင်မည်
- ဖွဲ့စည်းမှုနှင့်ဆိုင်သော ပြဿနာများကို ဖြေရှင်းနိုင်မည်
- အဖွဲ့အစည်းအလိုက် azd အပြုအမူကို စိတ်ကြိုက်ပြင်ဆင်နိုင်မည်

ဒီလမ်းညွှန်စာအုပ်မှာ Azure Developer CLI ကို အကောင်းဆုံး ဖွံ့ဖြိုးတိုးတက်မှုနှင့် တင်သွင်းမှု လုပ်ငန်းစဉ်များအတွက် ဖွဲ့စည်းပုံဆိုင်ရာ အချက်အလက်များကို အပြည့်အစုံ ဖော်ပြထားပါတယ်။

## ဖွဲ့စည်းမှုအဆင့်ဆင့်

azd သည် အဆင့်လိုက် ဖွဲ့စည်းမှုစနစ်ကို အသုံးပြုသည်:
1. **Command-line flags** (အမြင့်ဆုံး ဦးစားပေးမှု)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (အနိမ့်ဆုံး ဦးစားပေးမှု)

## အထွေထွေဖွဲ့စည်းမှု

### အထွေထွေ Default များ သတ်မှတ်ခြင်း
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# Set default resource group naming convention
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# View all global configuration
azd config list

# Remove a configuration
azd config unset defaults.location
```

### အထွေထွေ သုံးစွဲမှုများ
```bash
# Development preferences
azd config set alpha.enable true                    # Enable alpha features
azd config set telemetry.enabled false             # Disable telemetry
azd config set output.format json                  # Set output format

# Security settings
azd config set auth.useAzureCliCredential true     # Use Azure CLI for auth
azd config set tls.insecure false                  # Enforce TLS verification

# Performance tuning
azd config set provision.parallelism 5             # Parallel resource creation
azd config set deploy.timeout 30m                  # Deployment timeout
```

## 🏗️ ပရောဂျက်ဖွဲ့စည်းမှု

### azure.yaml ဖွဲ့စည်းမှု
`azure.yaml` ဖိုင်သည် သင့် azd ပရောဂျက်၏ အဓိကဖြစ်သည်:

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

### ဝန်ဆောင်မှု ဖွဲ့စည်းမှု ရွေးချယ်မှုများ

#### Host Types
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

#### Programming Language အလိုက် သတ်မှတ်ချက်များ
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
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ပတ်ဝန်းကျင် ဖွဲ့စည်းမှု
ပတ်ဝန်းကျင်တစ်ခုစီတွင် `.azure/<env-name>/config.json` တွင် သီးသန့်ဖွဲ့စည်းမှုရှိသည်:

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

### ပတ်ဝန်းကျင် Variable များ
```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

### ပတ်ဝန်းကျင် Template များ
ပုံမှန်ပတ်ဝန်းကျင် ဖွဲ့စည်းမှုအတွက် `.azure/env.template` ဖန်တီးပါ:
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

## 🔐 အတည်ပြုမှု ဖွဲ့စည်းမှု

### Azure CLI ပေါင်းစည်းမှု
```bash
# Use Azure CLI credentials (default)
azd config set auth.useAzureCliCredential true

# Login with specific tenant
az login --tenant <tenant-id>

# Set default subscription
az account set --subscription <subscription-id>
```

### Service Principal Authentication
CI/CD pipeline များအတွက်:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Or configure directly
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Azure-hosted ပတ်ဝန်းကျင်များအတွက်:
```bash
# Enable managed identity authentication
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ အခြေခံဖွဲ့စည်းမှု

### Bicep Parameters
`infra/main.parameters.json` တွင် အခြေခံဖွဲ့စည်းမှု parameter များ သတ်မှတ်ပါ:
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
Terraform ပရောဂျက်များအတွက် `infra/terraform.tfvars` တွင် ဖွဲ့စည်းပါ:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 တင်သွင်းမှု ဖွဲ့စည်းမှု

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
ဥပမာ `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 အဆင့်မြင့်ဖွဲ့စည်းမှု

### စိတ်ကြိုက် အရင်းအမြစ်အမည်ပေးခြင်း
```bash
# Set naming conventions
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

## 🎯 ပတ်ဝန်းကျင်အထူးသတ်မှတ်ချက်များ

### ဖွံ့ဖြိုးတိုးတက်မှု ပတ်ဝန်းကျင်
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### စမ်းသပ်မှု ပတ်ဝန်းကျင်
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

## 🔍 ဖွဲ့စည်းမှု အတည်ပြုခြင်း

### ဖွဲ့စည်းမှု အတည်ပြုခြင်း
```bash
# Check configuration syntax
azd config validate

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --dry-run
```

### ဖွဲ့စည်းမှု Scripts
`scripts/` တွင် အတည်ပြုမှု script များ ဖန်တီးပါ:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Validate azure.yaml syntax
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ

### 1. ပတ်ဝန်းကျင် Variable များ အသုံးပြုပါ
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ဖွဲ့စည်းမှုဖိုင်များ စနစ်တကျ စီစဉ်ပါ
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
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. ဖွဲ့စည်းမှု Documentation
`CONFIG.md` တွင် သင့်ဖွဲ့စည်းမှုကို မှတ်တမ်းတင်ပါ:
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

## နောက်တစ်ဆင့်

- [သင့်ပထမဆုံးပရောဂျက်](first-project.md) - လက်တွေ့ဖွဲ့စည်းမှုကို လေ့ကျင့်ပါ
- [တင်သွင်းမှုလမ်းညွှန်](../deployment/deployment-guide.md) - ဖွဲ့စည်းမှုကို တင်သွင်းမှုအတွက် အသုံးပြုပါ
- [အရင်းအမြစ်များ Provisioning](../deployment/provisioning.md) - ထုတ်လုပ်မှုအဆင့် ဖွဲ့စည်းမှုများ

## ကိုးကားချက်များ

- [azd ဖွဲ့စည်းမှုကိုးကားချက်](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [ပတ်ဝန်းကျင် Variable များ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigation**
- **ယခင်သင်ခန်းစာ**: [Installation & Setup](installation.md)
- **နောက်သင်ခန်းစာ**: [သင့်ပထမဆုံးပရောဂျက်](first-project.md)

---

**ဝက်ဘ်ဆိုက်မှတ်ချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားနေပါသော်လည်း၊ အလိုအလျောက်ဘာသာပြန်ဆိုမှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို ကျေးဇူးပြု၍ သိရှိပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတည်သော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပြန်ဆိုမှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုမှားများ သို့မဟုတ် အဓိပ္ပါယ်မှားများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။