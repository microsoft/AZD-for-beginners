<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8747981a94aac0f40d833cc37e9c0001",
  "translation_date": "2025-09-12T22:48:36+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "my"
}
-->
# Configuration Guide

**အရင်:** [AZD Basics](azd-basics.md) | **နောက်တစ်ခု:** [First Project](first-project.md)

## အကျဉ်းချုပ်

ဒီလမ်းညွှန်စာအုပ်မှာ Azure Developer CLI ကို အကောင်းဆုံး ဖွံ့ဖြိုးရေးနှင့် တင်သွင်းမှုလုပ်ငန်းစဉ်များအတွက် စနစ်တကျ ပြင်ဆင်ပုံကို အကျဉ်းချုပ်ဖော်ပြထားပါတယ်။ Configuration hierarchy, ပတ်ဝန်းကျင်စီမံခန့်ခွဲမှု, authentication နည်းလမ်းများနှင့် အဆင့်မြင့် configuration ပုံစံများကို သင်ယူပြီး Azure ကို လုံခြုံစွာ တင်သွင်းနိုင်မည့် နည်းလမ်းများကို သင်လေ့လာနိုင်ပါမည်။

## သင်ယူရမည့်ရည်ရွယ်ချက်များ

ဒီသင်ခန်းစာအဆုံးသတ်ချိန်မှာ သင်သည်:
- azd configuration hierarchy ကို ကျွမ်းကျင်စွာ နားလည်ပြီး settings များကို ဘယ်လို ဦးစားပေးထားသည်ကို သိရှိမည်
- Global နှင့် project-specific settings များကို ထိရောက်စွာ ပြင်ဆင်နိုင်မည်
- အမျိုးမျိုးသော configuration များနှင့် အတူ ပတ်ဝန်းကျင်များစီမံခန့်ခွဲနိုင်မည်
- လုံခြုံသော authentication နှင့် authorization ပုံစံများကို အကောင်အထည်ဖော်နိုင်မည်
- အဆင့်မြင့် configuration ပုံစံများကို နားလည်ပြီး ရှုပ်ထွေးသောအခြေအနေများအတွက် အသုံးပြုနိုင်မည်

## သင်ယူပြီးရရှိမည့်ရလဒ်များ

ဒီသင်ခန်းစာကို ပြီးမြောက်ပြီးနောက် သင်သည်:
- ဖွံ့ဖြိုးရေးလုပ်ငန်းစဉ်များအတွက် azd ကို အကောင်းဆုံး ပြင်ဆင်နိုင်မည်
- Deployment ပတ်ဝန်းကျင်များစီမံခန့်ခွဲနိုင်မည်
- လုံခြုံသော configuration စီမံခန့်ခွဲမှုအလေ့အကျင့်များကို အကောင်အထည်ဖော်နိုင်မည်
- Configuration ဆိုင်ရာပြဿနာများကို ဖြေရှင်းနိုင်မည်
- အဖွဲ့အစည်းအလိုက် azd ကို customize ပြင်ဆင်နိုင်မည်

ဒီလမ်းညွှန်စာအုပ်မှာ Azure Developer CLI ကို အကောင်းဆုံး ဖွံ့ဖြိုးရေးနှင့် တင်သွင်းမှုလုပ်ငန်းစဉ်များအတွက် စနစ်တကျ ပြင်ဆင်ပုံကို အကျဉ်းချုပ်ဖော်ပြထားပါတယ်။

## Configuration Hierarchy

azd သည် hierarchy စနစ်တကျ configuration ကို အသုံးပြုသည်:
1. **Command-line flags** (အမြင့်ဆုံးဦးစားပေး)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (အနိမ့်ဆုံးဦးစားပေး)

## Global Configuration

### Global Defaults ပြင်ဆင်ခြင်း
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

### Global Settings များ
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

## 🏗️ Project Configuration

### azure.yaml ဖိုင်ဖွဲ့စည်းပုံ
`azure.yaml` ဖိုင်သည် azd project ၏ အဓိကဖြစ်သည်:

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

### Service Configuration ရွေးချယ်မှုများ

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

#### ဘာသာစကားအလိုက် Settings
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

## 🌟 Environment Management

### ပတ်ဝန်းကျင်များ ဖန်တီးခြင်း
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ပတ်ဝန်းကျင် Configuration
တစ်ခုချင်းစီသော ပတ်ဝန်းကျင်တွင် `.azure/<env-name>/config.json` တွင် configuration ရှိသည်:

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

### Environment Variables
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

### Environment Templates
ပုံမှန်ပတ်ဝန်းကျင် setup အတွက် `.azure/env.template` ဖန်တီးပါ:
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

## 🔐 Authentication Configuration

### Azure CLI Integration
```bash
# Use Azure CLI credentials (default)
azd config set auth.useAzureCliCredential true

# Login with specific tenant
az login --tenant <tenant-id>

# Set default subscription
az account set --subscription <subscription-id>
```

### Service Principal Authentication
CI/CD pipelines အတွက်:
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

## 🏗️ Infrastructure Configuration

### Bicep Parameters
Infrastructure parameters များကို `infra/main.parameters.json` တွင် ပြင်ဆင်ပါ:
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

### Terraform Configuration
Terraform projects အတွက် `infra/terraform.tfvars` တွင် ပြင်ဆင်ပါ:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Deployment Configuration

### Build Configuration
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

### Docker Configuration
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

## 🔧 Advanced Configuration

### Custom Resource Naming
```bash
# Set naming conventions
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Network Configuration
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Monitoring Configuration
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

## 🎯 Environment-Specific Configurations

### Development Environment
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Staging Environment
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Production Environment
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Configuration Validation

### Configuration Validate လုပ်ခြင်း
```bash
# Check configuration syntax
azd config validate

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --dry-run
```

### Configuration Scripts
Validation scripts များကို `scripts/` တွင် ဖန်တီးပါ:

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

## 🎓 Best Practices

### 1. Environment Variables ကို အသုံးပြုပါ
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Configuration Files များကို စနစ်တကျ စီစဉ်ပါ
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

### 3. Version Control အတွက် စဉ်းစားပါ
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Configuration Documentation
သင့် configuration ကို `CONFIG.md` တွင် documentation ပြုလုပ်ပါ:
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

## Next Steps

- [Your First Project](first-project.md) - Configuration ကို လက်တွေ့အသုံးချခြင်း
- [Deployment Guide](../deployment/deployment-guide.md) - Configuration ကို တင်သွင်းမှုအတွက် အသုံးပြုခြင်း
- [Provisioning Resources](../deployment/provisioning.md) - Production-ready configurations

## References

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**အရင်:** [AZD Basics](azd-basics.md) | **နောက်တစ်ခု:** [First Project](first-project.md)
- **နောက်သင်ခန်းစာ**: [Your First Project](first-project.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းစာရွက်စာတမ်းကို ၎င်း၏ မူရင်းဘာသာစကားဖြင့် အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် ရှုလေ့လာသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။