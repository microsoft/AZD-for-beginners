<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7e50c994df9f71d709906549be362fc5",
  "translation_date": "2025-09-10T12:53:31+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "ur"
}
-->
# کنفیگریشن گائیڈ

## تعارف

یہ جامع گائیڈ Azure Developer CLI کی کنفیگریشن کے تمام پہلوؤں کا احاطہ کرتی ہے تاکہ ترقی اور تعیناتی کے ورک فلو کو بہتر بنایا جا سکے۔ آپ کنفیگریشن کی درجہ بندی، ماحولیات کا انتظام، تصدیق کے طریقے، اور پیچیدہ کنفیگریشن پیٹرنز کے بارے میں سیکھیں گے جو Azure کی مؤثر اور محفوظ تعیناتی کو ممکن بناتے ہیں۔

## سیکھنے کے مقاصد

اس سبق کے اختتام تک، آپ:
- azd کنفیگریشن کی درجہ بندی کو سمجھیں گے اور جانیں گے کہ سیٹنگز کو کیسے ترجیح دی جاتی ہے
- عالمی اور پروجیکٹ کی مخصوص سیٹنگز کو مؤثر طریقے سے ترتیب دیں گے
- مختلف کنفیگریشنز کے ساتھ متعدد ماحولیات کا انتظام کریں گے
- محفوظ تصدیق اور اجازت کے پیٹرنز کو نافذ کریں گے
- پیچیدہ منظرناموں کے لیے جدید کنفیگریشن پیٹرنز کو سمجھیں گے

## سیکھنے کے نتائج

اس سبق کو مکمل کرنے کے بعد، آپ قابل ہوں گے:
- ترقی کے بہترین ورک فلو کے لیے azd کو ترتیب دیں
- متعدد تعیناتی ماحولیات کو ترتیب دیں اور ان کا انتظام کریں
- محفوظ کنفیگریشن مینجمنٹ کے طریقے نافذ کریں
- کنفیگریشن سے متعلق مسائل کو حل کریں
- مخصوص تنظیمی ضروریات کے لیے azd کے رویے کو حسب ضرورت بنائیں

یہ جامع گائیڈ Azure Developer CLI کی کنفیگریشن کے تمام پہلوؤں کا احاطہ کرتی ہے تاکہ ترقی اور تعیناتی کے ورک فلو کو بہتر بنایا جا سکے۔

## کنفیگریشن کی درجہ بندی

azd ایک درجہ بندی والے کنفیگریشن سسٹم کا استعمال کرتا ہے:
1. **کمانڈ لائن فلیگز** (سب سے زیادہ ترجیح)
2. **ماحولیاتی متغیرات**
3. **مقامی پروجیکٹ کنفیگریشن** (`.azd/config.json`)
4. **عالمی صارف کنفیگریشن** (`~/.azd/config.json`)
5. **ڈیفالٹ ویلیوز** (سب سے کم ترجیح)

## عالمی کنفیگریشن

### عالمی ڈیفالٹس سیٹ کرنا
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

### عام عالمی سیٹنگز
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

## 🏗️ پروجیکٹ کنفیگریشن

### azure.yaml کی ساخت
`azure.yaml` فائل آپ کے azd پروجیکٹ کا مرکز ہے:

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

### سروس کنفیگریشن کے اختیارات

#### ہوسٹ کی اقسام
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

#### زبان کے لحاظ سے مخصوص سیٹنگز
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

## 🌟 ماحولیات کا انتظام

### ماحولیات بنانا
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ماحولیات کی کنفیگریشن
ہر ماحول کی اپنی کنفیگریشن `.azure/<env-name>/config.json` میں ہوتی ہے:

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

### ماحولیاتی متغیرات
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

### ماحولیاتی ٹیمپلیٹس
مسلسل ماحولیاتی سیٹ اپ کے لیے `.azure/env.template` بنائیں:
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

## 🔐 تصدیق کی کنفیگریشن

### Azure CLI انضمام
```bash
# Use Azure CLI credentials (default)
azd config set auth.useAzureCliCredential true

# Login with specific tenant
az login --tenant <tenant-id>

# Set default subscription
az account set --subscription <subscription-id>
```

### سروس پرنسپل تصدیق
CI/CD پائپ لائنز کے لیے:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Or configure directly
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### مینیجڈ آئیڈینٹیٹی
Azure ہوسٹڈ ماحولیات کے لیے:
```bash
# Enable managed identity authentication
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ انفراسٹرکچر کنفیگریشن

### Bicep پیرامیٹرز
`infra/main.parameters.json` میں انفراسٹرکچر پیرامیٹرز کو ترتیب دیں:
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

### Terraform کنفیگریشن
Terraform پروجیکٹس کے لیے، `infra/terraform.tfvars` میں ترتیب دیں:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 تعیناتی کی کنفیگریشن

### بلڈ کنفیگریشن
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

### Docker کنفیگریشن
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
مثال `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 جدید کنفیگریشن

### حسب ضرورت وسائل کے نام
```bash
# Set naming conventions
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### نیٹ ورک کنفیگریشن
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### مانیٹرنگ کنفیگریشن
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

## 🎯 ماحولیات کے لحاظ سے مخصوص کنفیگریشنز

### ترقیاتی ماحول
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### اسٹیجنگ ماحول
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### پروڈکشن ماحول
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 کنفیگریشن کی توثیق

### کنفیگریشن کی توثیق کریں
```bash
# Check configuration syntax
azd config validate

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --dry-run
```

### کنفیگریشن اسکرپٹس
`scripts/` میں توثیقی اسکرپٹس بنائیں:

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

## 🎓 بہترین طریقے

### 1. ماحولیاتی متغیرات کا استعمال کریں
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. کنفیگریشن فائلوں کو منظم کریں
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

### 3. ورژن کنٹرول کے تحفظات
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. کنفیگریشن کی دستاویزات
اپنی کنفیگریشن کو `CONFIG.md` میں دستاویز کریں:
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

## اگلے اقدامات

- [آپ کا پہلا پروجیکٹ](first-project.md) - عملی طور پر کنفیگریشن کا اطلاق کریں
- [تعیناتی گائیڈ](../deployment/deployment-guide.md) - تعیناتی کے لیے کنفیگریشن کا استعمال کریں
- [وسائل کی فراہمی](../deployment/provisioning.md) - پروڈکشن کے لیے تیار کنفیگریشنز

## حوالہ جات

- [azd کنفیگریشن حوالہ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml اسکیمہ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [ماحولیاتی متغیرات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**نیویگیشن**
- **پچھلا سبق**: [انسٹالیشن اور سیٹ اپ](installation.md)
- **اگلا سبق**: [آپ کا پہلا پروجیکٹ](first-project.md)

---

**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔