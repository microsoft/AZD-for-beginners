# راهنمای پیکربندی

**ناوبری فصل:**
- **📚 صفحهٔ دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۳ - پیکربندی و احراز هویت
- **⬅️ قبلی**: [اولین پروژهٔ شما](first-project.md)
- **➡️ بعدی**: [راهنمای استقرار](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 فصل بعد**: [فصل ۴: زیرساخت به عنوان کد](../chapter-04-infrastructure/deployment-guide.md)

## مقدمه

این راهنمای جامع تمامی جنبه‌های پیکربندی Azure Developer CLI را برای جریان‌های کاری توسعه و استقرار بهینه پوشش می‌دهد. شما دربارهٔ سلسله‌مراتب پیکربندی، مدیریت محیط‌ها، روش‌های احراز هویت و الگوهای پیشرفته پیکربندی که موجب استقرارهای ایمن و کارآمد در Azure می‌شوند، خواهید آموخت.

## اهداف آموزشی

تا پایان این درس، شما:
- بر سلسله‌مراتب پیکربندی azd تسلط خواهید یافت و درک خواهید کرد چگونه تنظیمات اولویت‌بندی می‌شوند
- تنظیمات سراسری و مخصوص پروژه را به‌طور مؤثر پیکربندی خواهید کرد
- چندین محیط با پیکربندی‌های متفاوت را مدیریت خواهید کرد
- الگوهای امن احراز هویت و مجوزدهی را پیاده‌سازی خواهید کرد
- الگوهای پیشرفته پیکربندی برای سناریوهای پیچیده را درک خواهید کرد

## نتایج یادگیری

پس از تکمیل این درس، شما قادر خواهید بود:
- azd را برای جریان‌های کاری توسعه‌ای بهینه پیکربندی کنید
- چندین محیط استقرار را راه‌اندازی و مدیریت کنید
- شیوه‌های مدیریت پیکربندی امن را پیاده‌سازی کنید
- مسائل مرتبط با پیکربندی را عیب‌یابی کنید
- رفتار azd را برای نیازهای خاص سازمانی سفارشی‌سازی کنید

این راهنمای جامع تمامی جنبه‌های پیکربندی Azure Developer CLI را برای جریان‌های کاری توسعه و استقرار بهینه پوشش می‌دهد.

## سلسله‌مراتب پیکربندی

azd از یک سیستم پیکربندی سلسله‌مراتبی استفاده می‌کند:
1. **گزینه‌های خط فرمان** (بالاترین اولویت)
2. **متغیرهای محیطی**
3. **پیکربندی محلی پروژه** (`.azd/config.json`)
4. **پیکربندی سراسری کاربر** (`~/.azd/config.json`)
5. **مقادیر پیش‌فرض** (کمترین اولویت)

## پیکربندی سراسری

### تنظیم مقادیر پیش‌فرض سراسری
```bash
# تنظیم اشتراک پیش‌فرض
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# تنظیم منطقه پیش‌فرض
azd config set defaults.location "eastus2"

# تنظیم الگوی نام‌گذاری پیش‌فرض گروه منابع
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# مشاهده تمام پیکربندی‌های سراسری
azd config list

# حذف یک پیکربندی
azd config unset defaults.location
```

### تنظیمات رایج سراسری
```bash
# ترجیحات توسعه
azd config set alpha.enable true                    # فعال‌سازی ویژگی‌های آلفا
azd config set telemetry.enabled false             # غیرفعال‌سازی تله‌متری
azd config set output.format json                  # تنظیم فرمت خروجی

# تنظیمات امنیتی
azd config set auth.useAzureCliCredential true     # استفاده از Azure CLI برای احراز هویت
azd config set tls.insecure false                  # الزام به تأیید TLS

# بهینه‌سازی عملکرد
azd config set provision.parallelism 5             # ایجاد منابع به‌صورت موازی
azd config set deploy.timeout 30m                  # مهلت استقرار
```

## 🏗️ پیکربندی پروژه

### ساختار azure.yaml
فایل `azure.yaml` هستهٔ پروژهٔ azd شما است:

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

#### تنظیمات اختصاصی زبان
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
# محیط جدید ایجاد کنید
azd env new development

# با مکان مشخص ایجاد کنید
azd env new staging --location "westus2"

# از قالب ایجاد کنید
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
# متغیرهای مخصوص محیط را تنظیم کنید
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# مشاهدهٔ متغیرهای محیط
azd env get-values

# خروجی مورد انتظار:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# حذف متغیر محیطی
azd env unset DEBUG

# تأیید حذف
azd env get-values | grep DEBUG
# (نباید چیزی برگرداند)
```

### قالب‌های محیط
برای راه‌اندازی سازگار محیط‌ها، فایل `.azure/env.template` را ایجاد کنید:
```bash
# متغیرهای مورد نیاز
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# تنظیمات برنامه
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# تنظیمات توسعه‌ای اختیاری
DEBUG=false
LOG_LEVEL=info
```

## 🔐 پیکربندی احراز هویت

### یکپارچه‌سازی Azure CLI
```bash
# از اعتبارنامه‌های Azure CLI استفاده کنید (پیش‌فرض)
azd config set auth.useAzureCliCredential true

# با یک مستاجر مشخص وارد شوید
az login --tenant <tenant-id>

# اشتراک پیش‌فرض را تنظیم کنید
az account set --subscription <subscription-id>
```

### احراز هویت با Service Principal
برای خط‌های لوله CI/CD:
```bash
# متغیرهای محیطی را تنظیم کنید
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# یا مستقیماً پیکربندی کنید
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### هویت مدیریت‌شده
برای محیط‌های میزبانی‌شده در Azure:
```bash
# احراز هویت با هویت مدیریت‌شده را فعال کنید
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

### نام‌گذاری سفارشی منابع
```bash
# تعیین قراردادهای نام‌گذاری
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

### پیکربندی مانیتورینگ
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

## 🎯 پیکربندی‌های خاص هر محیط

### محیط توسعه
```bash
# .azure/توسعه/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### محیط آزمایشی
```bash
# .azure/آماده‌سازی/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### محیط تولید
```bash
# .azure/تولید/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 اعتبارسنجی پیکربندی

### اعتبارسنجی پیکربندی
```bash
# نحو پیکربندی را بررسی کنید
azd config validate

# متغیرهای محیطی را آزمایش کنید
azd env get-values

# زیرساخت را اعتبارسنجی کنید
azd provision --dry-run
```

### اسکریپت‌های پیکربندی
اسکریپت‌های اعتبارسنجی را در `scripts/` ایجاد کنید:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# متغیرهای محیطی موردنیاز را بررسی کنید
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# سینتکس azure.yaml را اعتبارسنجی کنید
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

### 2. سازمان‌دهی فایل‌های پیکربندی
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
.azure/*/.env               # متغیرهای محیطی (ممکن است حاوی اسرار باشند)
.env                        # فایل محیطی محلی
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

### تمرین ۱: پیکربندی چندمحیطی (15 دقیقه)

**هدف**: ایجاد و پیکربندی سه محیط با تنظیمات متفاوت

```bash
# ایجاد محیط توسعه
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# ایجاد محیط پیش‌تولید
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
- [ ] سه محیط با موفقیت ایجاد شوند
- [ ] هر محیط دارای پیکربندی منحصر به فرد باشد
- [ ] بتوان بدون خطا بین محیط‌ها جابجا شد
- [ ] `azd env list` همهٔ سه محیط را نشان دهد

### تمرین ۲: مدیریت اسرار (10 دقیقه)

**هدف**: تمرین پیکربندی امن با داده‌های حساس

```bash
# تنظیم مقادیر محرمانه (در خروجی نمایش داده نمی‌شوند)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# تنظیم پیکربندی غیرمحرمانه
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# مشاهدهٔ محیط (مقادیر محرمانه باید مخفی شوند)
azd env get-values

# تأیید اینکه مقادیر محرمانه ذخیره شده‌اند
azd env get DB_PASSWORD  # باید مقدار واقعی را نمایش دهد
```

**معیارهای موفقیت:**
- [ ] اسرار بدون نمایش در ترمینال ذخیره شده باشند
- [ ] `azd env get-values` اسرار مخفی‌شده را نشان دهد
- [ ] دستور `azd env get <SECRET_NAME>` مقدار واقعی را بازیابی کند

## گام‌های بعدی

- [اولین پروژهٔ شما](first-project.md) - اعمال پیکربندی در عمل
- [راهنمای استقرار](../chapter-04-infrastructure/deployment-guide.md) - استفاده از پیکربندی برای استقرار
- [تأمین منابع](../chapter-04-infrastructure/provisioning.md) - پیکربندی‌های آماده برای تولید

## منابع

- [مرجع پیکربندی azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [طرح‌وارهٔ azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [متغیرهای محیطی](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ناوبری فصل:**
- **📚 صفحهٔ دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۳ - پیکربندی و احراز هویت
- **⬅️ قبلی**: [اولین پروژهٔ شما](first-project.md)
- **➡️ فصل بعد**: [فصل ۴: زیرساخت به عنوان کد](../chapter-04-infrastructure/deployment-guide.md)
- **درس بعدی**: [اولین پروژهٔ شما](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
سلب مسئولیت:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی Co-op Translator (https://github.com/Azure/co-op-translator) ترجمه شده است. اگرچه ما در پی دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است دارای خطا یا نادرستی باشند. نسخهٔ اصلی سند به زبان مبدأ باید به‌عنوان منبع معتبر تلقی شود. برای اطلاعات حیاتی، توصیه می‌شود از ترجمهٔ حرفه‌ای انسانی استفاده کنید. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرستی که از استفاده از این ترجمه ناشی شود، مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->