<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8399160e4ce8c3eb6fd5d831f6602e18",
  "translation_date": "2025-11-19T23:56:42+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "fa"
}
-->
# راهنمای پیکربندی

**فهرست فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۳ - پیکربندی و احراز هویت
- **⬅️ قبلی**: [اولین پروژه شما](first-project.md)
- **➡️ بعدی**: [راهنمای استقرار](../deployment/deployment-guide.md)
- **🚀 فصل بعدی**: [فصل ۴: زیرساخت به عنوان کد](../deployment/deployment-guide.md)

## مقدمه

این راهنمای جامع تمام جنبه‌های پیکربندی Azure Developer CLI را برای بهینه‌سازی فرآیندهای توسعه و استقرار پوشش می‌دهد. شما با سلسله‌مراتب پیکربندی، مدیریت محیط‌ها، روش‌های احراز هویت و الگوهای پیشرفته پیکربندی آشنا خواهید شد که استقرارهای امن و کارآمد در Azure را ممکن می‌سازند.

## اهداف یادگیری

در پایان این درس، شما:
- به سلسله‌مراتب پیکربندی azd مسلط خواهید شد و نحوه اولویت‌بندی تنظیمات را درک خواهید کرد
- تنظیمات جهانی و مخصوص پروژه را به طور مؤثر پیکربندی خواهید کرد
- محیط‌های مختلف با تنظیمات متفاوت را مدیریت خواهید کرد
- الگوهای امن احراز هویت و مجوزدهی را پیاده‌سازی خواهید کرد
- الگوهای پیشرفته پیکربندی برای سناریوهای پیچیده را درک خواهید کرد

## نتایج یادگیری

پس از اتمام این درس، شما قادر خواهید بود:
- azd را برای فرآیندهای توسعه بهینه پیکربندی کنید
- محیط‌های استقرار چندگانه را تنظیم و مدیریت کنید
- شیوه‌های مدیریت پیکربندی امن را پیاده‌سازی کنید
- مشکلات مربوط به پیکربندی را عیب‌یابی کنید
- رفتار azd را برای نیازهای خاص سازمانی سفارشی کنید

این راهنمای جامع تمام جنبه‌های پیکربندی Azure Developer CLI را برای بهینه‌سازی فرآیندهای توسعه و استقرار پوشش می‌دهد.

## سلسله‌مراتب پیکربندی

azd از یک سیستم پیکربندی سلسله‌مراتبی استفاده می‌کند:
1. **پرچم‌های خط فرمان** (بالاترین اولویت)
2. **متغیرهای محیطی**
3. **پیکربندی محلی پروژه** (`.azd/config.json`)
4. **پیکربندی جهانی کاربر** (`~/.azd/config.json`)
5. **مقادیر پیش‌فرض** (کمترین اولویت)

## پیکربندی جهانی

### تنظیم مقادیر پیش‌فرض جهانی
```bash
# تنظیم اشتراک پیش‌فرض
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# تنظیم مکان پیش‌فرض
azd config set defaults.location "eastus2"

# تنظیم نام‌گذاری پیش‌فرض گروه منابع
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# مشاهده تمام تنظیمات جهانی
azd config list

# حذف یک تنظیم
azd config unset defaults.location
```

### تنظیمات عمومی جهانی
```bash
# ترجیحات توسعه
azd config set alpha.enable true                    # فعال کردن ویژگی‌های آلفا
azd config set telemetry.enabled false             # غیرفعال کردن تله‌متری
azd config set output.format json                  # تنظیم قالب خروجی

# تنظیمات امنیتی
azd config set auth.useAzureCliCredential true     # استفاده از CLI آژور برای احراز هویت
azd config set tls.insecure false                  # اعمال تأیید TLS

# تنظیم عملکرد
azd config set provision.parallelism 5             # ایجاد منابع به صورت موازی
azd config set deploy.timeout 30m                  # زمان‌بندی پایان استقرار
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
# ایجاد یک محیط جدید
azd env new development

# ایجاد با مکان خاص
azd env new staging --location "westus2"

# ایجاد از الگو
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### پیکربندی محیط
هر محیط پیکربندی خاص خود را در `.azure/<env-name>/config.json` دارد:

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
# تنظیم متغیرهای خاص محیط
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# مشاهده متغیرهای محیط
azd env get-values

# خروجی مورد انتظار:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# حذف متغیر محیط
azd env unset DEBUG

# تأیید حذف
azd env get-values | grep DEBUG
# (نباید چیزی برگرداند)
```

### قالب‌های محیط
برای تنظیم محیط‌های یکسان، فایل `.azure/env.template` ایجاد کنید:
```bash
# متغیرهای مورد نیاز
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# تنظیمات برنامه
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# تنظیمات اختیاری توسعه
DEBUG=false
LOG_LEVEL=info
```

## 🔐 پیکربندی احراز هویت

### یکپارچه‌سازی با Azure CLI
```bash
# استفاده از اعتبارنامه‌های Azure CLI (پیش‌فرض)
azd config set auth.useAzureCliCredential true

# ورود با مستاجر خاص
az login --tenant <tenant-id>

# تنظیم اشتراک پیش‌فرض
az account set --subscription <subscription-id>
```

### احراز هویت با Service Principal
برای خطوط لوله CI/CD:
```bash
# تنظیم متغیرهای محیطی
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# یا مستقیماً پیکربندی کنید
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### هویت مدیریت‌شده
برای محیط‌های میزبانی شده در Azure:
```bash
# احراز هویت هویت مدیریت‌شده را فعال کنید
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
# تنظیم قراردادهای نام‌گذاری
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
# بررسی نحو پیکربندی
azd config validate

# آزمایش متغیرهای محیطی
azd env get-values

# اعتبارسنجی زیرساخت
azd provision --dry-run
```

### اسکریپت‌های پیکربندی
اسکریپت‌های اعتبارسنجی را در `scripts/` ایجاد کنید:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# بررسی متغیرهای محیطی مورد نیاز
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# اعتبارسنجی نحو azure.yaml
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
.azure/*/config.json         # پیکربندی‌های محیط (شامل شناسه‌های منابع)
.azure/*/.env               # متغیرهای محیطی (ممکن است شامل اطلاعات محرمانه باشد)
.env                        # فایل محیط محلی
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

## 🎯 تمرین‌های عملی

### تمرین ۱: پیکربندی چند محیطی (۱۵ دقیقه)

**هدف**: ایجاد و پیکربندی سه محیط با تنظیمات مختلف

```bash
# ایجاد محیط توسعه
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# ایجاد محیط مرحله‌بندی
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# ایجاد محیط تولید
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# تأیید هر محیط
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**معیارهای موفقیت:**
- [ ] سه محیط با موفقیت ایجاد شده‌اند
- [ ] هر محیط دارای پیکربندی منحصربه‌فرد است
- [ ] امکان جابجایی بین محیط‌ها بدون خطا وجود دارد
- [ ] `azd env list` تمام سه محیط را نشان می‌دهد

### تمرین ۲: مدیریت اسرار (۱۰ دقیقه)

**هدف**: تمرین پیکربندی امن با داده‌های حساس

```bash
# تنظیم اسرار (در خروجی نمایش داده نمی‌شود)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# تنظیم پیکربندی غیر محرمانه
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# مشاهده محیط (اسرار باید مخفی شوند)
azd env get-values

# تأیید کنید که اسرار ذخیره شده‌اند
azd env get DB_PASSWORD  # باید مقدار واقعی را نشان دهد
```

**معیارهای موفقیت:**
- [ ] اسرار بدون نمایش در ترمینال ذخیره شده‌اند
- [ ] `azd env get-values` اسرار را به صورت مخفی نشان می‌دهد
- [ ] `azd env get <SECRET_NAME>` مقدار واقعی را بازیابی می‌کند

## گام‌های بعدی

- [اولین پروژه شما](first-project.md) - اعمال پیکربندی در عمل
- [راهنمای استقرار](../deployment/deployment-guide.md) - استفاده از پیکربندی برای استقرار
- [تأمین منابع](../deployment/provisioning.md) - پیکربندی‌های آماده تولید

## منابع

- [مرجع پیکربندی azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [طرح azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [متغیرهای محیطی](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**فهرست فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۳ - پیکربندی و احراز هویت
- **⬅️ قبلی**: [اولین پروژه شما](first-project.md)
- **➡️ فصل بعدی**: [فصل ۴: زیرساخت به عنوان کد](../deployment/deployment-guide.md)
- **درس بعدی**: [اولین پروژه شما](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما برای دقت تلاش می‌کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما مسئولیتی در قبال هرگونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->