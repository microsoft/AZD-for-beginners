<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8747981a94aac0f40d833cc37e9c0001",
  "translation_date": "2025-09-12T17:11:25+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "fa"
}
-->
# راهنمای پیکربندی

**قبلی:** [AZD Basics](azd-basics.md) | **بعدی:** [First Project](first-project.md)

## مقدمه

این راهنمای جامع تمام جنبه‌های پیکربندی Azure Developer CLI را برای جریان‌های کاری توسعه و استقرار بهینه پوشش می‌دهد. شما درباره سلسله‌مراتب پیکربندی، مدیریت محیط‌ها، روش‌های احراز هویت و الگوهای پیشرفته پیکربندی که استقرارهای امن و کارآمد Azure را ممکن می‌سازند، یاد خواهید گرفت.

## اهداف یادگیری

در پایان این درس، شما:
- به سلسله‌مراتب پیکربندی azd مسلط خواهید شد و نحوه اولویت‌بندی تنظیمات را درک خواهید کرد
- تنظیمات جهانی و مخصوص پروژه را به طور مؤثر پیکربندی خواهید کرد
- محیط‌های متعدد با پیکربندی‌های مختلف را مدیریت خواهید کرد
- الگوهای امن احراز هویت و مجوزدهی را پیاده‌سازی خواهید کرد
- الگوهای پیشرفته پیکربندی برای سناریوهای پیچیده را خواهید فهمید

## نتایج یادگیری

پس از تکمیل این درس، شما قادر خواهید بود:
- azd را برای جریان‌های کاری توسعه بهینه پیکربندی کنید
- محیط‌های استقرار متعدد را تنظیم و مدیریت کنید
- شیوه‌های مدیریت پیکربندی امن را پیاده‌سازی کنید
- مشکلات مرتبط با پیکربندی را رفع کنید
- رفتار azd را برای نیازهای خاص سازمانی سفارشی کنید

این راهنمای جامع تمام جنبه‌های پیکربندی Azure Developer CLI را برای جریان‌های کاری توسعه و استقرار بهینه پوشش می‌دهد.

## سلسله‌مراتب پیکربندی

azd از یک سیستم پیکربندی سلسله‌مراتبی استفاده می‌کند:
1. **پرچم‌های خط فرمان** (بالاترین اولویت)
2. **متغیرهای محیطی**
3. **پیکربندی پروژه محلی** (`.azd/config.json`)
4. **پیکربندی کاربر جهانی** (`~/.azd/config.json`)
5. **مقادیر پیش‌فرض** (کمترین اولویت)

## پیکربندی جهانی

### تنظیم مقادیر پیش‌فرض جهانی
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

### تنظیمات عمومی جهانی
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

## 🏗️ پیکربندی پروژه

### ساختار azure.yaml
فایل `azure.yaml` قلب پروژه azd شما است:

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

### گزینه‌های پیکربندی سرویس

#### انواع میزبان
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

#### تنظیمات مخصوص زبان
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

## 🌟 مدیریت محیط‌ها

### ایجاد محیط‌ها
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### پیکربندی محیط
هر محیط پیکربندی مخصوص به خود را در `.azure/<env-name>/config.json` دارد:

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

### متغیرهای محیطی
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

### قالب‌های محیط
فایل `.azure/env.template` را برای تنظیم محیط‌های سازگار ایجاد کنید:
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

## 🔐 پیکربندی احراز هویت

### یکپارچه‌سازی Azure CLI
```bash
# Use Azure CLI credentials (default)
azd config set auth.useAzureCliCredential true

# Login with specific tenant
az login --tenant <tenant-id>

# Set default subscription
az account set --subscription <subscription-id>
```

### احراز هویت Service Principal
برای خطوط لوله CI/CD:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Or configure directly
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### هویت مدیریت‌شده
برای محیط‌های میزبانی‌شده در Azure:
```bash
# Enable managed identity authentication
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ پیکربندی زیرساخت

### پارامترهای Bicep
پارامترهای زیرساخت را در `infra/main.parameters.json` پیکربندی کنید:
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

### پیکربندی Terraform
برای پروژه‌های Terraform، در `infra/terraform.tfvars` پیکربندی کنید:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 پیکربندی استقرار

### پیکربندی ساخت
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

### پیکربندی Docker
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

## 🔧 پیکربندی پیشرفته

### نام‌گذاری منابع سفارشی
```bash
# Set naming conventions
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### پیکربندی شبکه
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### پیکربندی نظارت
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

## 🎯 پیکربندی‌های مخصوص محیط

### محیط توسعه
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### محیط آزمایشی
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### محیط تولید
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 اعتبارسنجی پیکربندی

### اعتبارسنجی پیکربندی
```bash
# Check configuration syntax
azd config validate

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --dry-run
```

### اسکریپت‌های پیکربندی
اسکریپت‌های اعتبارسنجی را در `scripts/` ایجاد کنید:

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

## 🎓 بهترین شیوه‌ها

### 1. استفاده از متغیرهای محیطی
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. سازماندهی فایل‌های پیکربندی
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

### 3. ملاحظات کنترل نسخه
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. مستندسازی پیکربندی
پیکربندی خود را در `CONFIG.md` مستند کنید:
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

## مراحل بعدی

- [پروژه اول شما](first-project.md) - اعمال پیکربندی در عمل
- [راهنمای استقرار](../deployment/deployment-guide.md) - استفاده از پیکربندی برای استقرار
- [تأمین منابع](../deployment/provisioning.md) - پیکربندی‌های آماده تولید

## منابع

- [مرجع پیکربندی azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [طرح azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [متغیرهای محیطی](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**قبلی:** [AZD Basics](azd-basics.md) | **بعدی:** [First Project](first-project.md)
- **درس بعدی**: [پروژه اول شما](first-project.md)

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، توصیه می‌شود از ترجمه حرفه‌ای انسانی استفاده کنید. ما مسئولیتی در قبال سوءتفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.