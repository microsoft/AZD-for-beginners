# راهنمای پیکربندی

**راهنمای فصل:**
- **📚 صفحه دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۳ - پیکربندی و احراز هویت
- **⬅️ قبلی**: [پروژه اول شما](first-project.md)
- **➡️ بعدی**: [راهنمای استقرار](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 فصل بعدی**: [فصل ۴: زیرساخت به‌عنوان کد](../chapter-04-infrastructure/deployment-guide.md)

## مقدمه

این راهنمای جامع همه جنبه‌های پیکربندی Azure Developer CLI را برای جریان‌های کاری بهینه توسعه و استقرار پوشش می‌دهد. شما درباره سلسله‌مراتب پیکربندی، مدیریت محیط‌ها، روش‌های احراز هویت و الگوهای پیشرفته پیکربندی که استقرارهای امن و کارآمد Azure را امکان‌پذیر می‌سازند، خواهید آموخت.

## اهداف یادگیری

تا پایان این درس، شما:
- تسلط بر سلسله‌مراتب پیکربندی azd و درک اولویت‌بندی تنظیمات را کسب خواهید کرد
- تنظیمات سراسری و مخصوص پروژه را به‌صورت مؤثر پیکربندی خواهید کرد
- مدیریت چندین محیط با تنظیمات متفاوت را انجام خواهید داد
- الگوهای احراز هویت و اختیارات امن را پیاده‌سازی خواهید کرد
- الگوهای پیکربندی پیشرفته برای سناریوهای پیچیده را درک خواهید کرد

## نتایج یادگیری

پس از تکمیل این درس، شما قادر خواهید بود:
- azd را برای جریان‌های کاری توسعه بهینه پیکربندی کنید
- چندین محیط استقرار را راه‌اندازی و مدیریت کنید
- شیوه‌های مدیریت پیکربندی امن را پیاده‌سازی کنید
- مشکلات مرتبط با پیکربندی را عیب‌یابی کنید
- رفتار azd را برای نیازهای سازمانی خاص سفارشی‌سازی کنید

این راهنمای جامع همه جنبه‌های پیکربندی Azure Developer CLI را برای جریان‌های کاری بهینه توسعه و استقرار پوشش می‌دهد.

## درک عامل‌های هوش مصنوعی در یک پروژه azd

اگر با عامل‌های هوش مصنوعی تازه‌کار هستید، در اینجا یک راه ساده برای تصور آن‌ها در دنیای azd آورده شده است.

### عامل چیست؟

عامل قطعه‌ای نرم‌افزاری است که می‌تواند یک درخواست را دریافت کند، درباره آن استدلال کند، و اقداماتی انجام دهد—اغلب با فراخوانی یک مدل هوش مصنوعی، جستجوی داده‌ها، یا فراخوانی سرویس‌های دیگر. در یک پروژه azd، یک عامل فقط یک **سرویس** دیگر در کنار فرانت‌اند وب یا بک‌اند API شماست.

### عامل‌ها چگونه در ساختار پروژه azd قرار می‌گیرند

یک پروژه azd از سه لایه تشکیل شده است: **زیرساخت**، **کد** و **پیکربندی**. عامل‌ها همان‌طور که هر سرویس دیگری عمل می‌کند به این لایه‌ها متصل می‌شوند:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | منابعی مانند وب اپ و دیتابیس را تأمین می‌کند | نقطه انتهایی مدل AI، شاخص جستجو یا میزبان عامل را تأمین می‌کند |
| **Code** (`src/`) | شامل کد منبع فرانت‌اند و API شماست | شامل منطق عامل و تعاریف پرامپت‌ها است |
| **Configuration** (`azure.yaml`) | سرویس‌ها و اهداف میزبانی آن‌ها را فهرست می‌کند | عامل شما را به‌عنوان یک سرویس فهرست می‌کند و به کد و میزبان آن اشاره می‌کند |

### نقش `azure.yaml`

نیازی به حفظ دستور زبان آن در همین لحظه ندارید. از نظر مفهومی، `azure.yaml` فایلی است که به azd می‌گوید: «در اینجا سرویس‌هایی که برنامه من را تشکیل می‌دهند و محل پیدا کردن کد آن‌ها هستند.»

وقتی پروژه شما شامل یک عامل هوش مصنوعی باشد، `azure.yaml` به سادگی آن عامل را به‌عنوان یکی از سرویس‌ها فهرست می‌کند. azd سپس می‌داند که زیرساخت مناسب را فراهم کند (مانند یک Microsoft Foundry Models endpoint یا یک Container App برای میزبانی عامل) و کد عامل شما را مستقر کند—دقیقاً همان‌طور که برای یک وب اپ یا API انجام می‌دهد.

این بدان معنی است که چیز بنیادی جدیدی برای یادگیری وجود ندارد. اگر بفهمید azd چگونه یک سرویس وب را مدیریت می‌کند، در واقع فهمیده‌اید که چگونه یک عامل را مدیریت می‌کند.

## سلسله‌مراتب پیکربندی

azd از یک سیستم پیکربندی سلسله‌مراتبی استفاده می‌کند:
1. **پرچم‌های خط فرمان** (بالاترین اولویت)
2. **متغیرهای محیطی**
3. **پیکربندی محلی پروژه** (`.azd/config.json`)
4. **پیکربندی کاربر سراسری** (`~/.azd/config.json`)
5. **مقدارهای پیش‌فرض** (پایین‌ترین اولویت)

## پیکربندی سراسری

### تنظیم مقادیر پیش‌فرض سراسری
```bash
# تنظیم اشتراک پیش‌فرض
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# تنظیم مکان پیش‌فرض
azd config set defaults.location "eastus2"

# تنظیم قاعده نام‌گذاری پیش‌فرض گروه منابع
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# مشاهده تمام پیکربندی‌های سراسری
azd config show

# حذف یک پیکربندی
azd config unset defaults.location
```

### تنظیمات سراسری رایج
```bash
# ترجیحات توسعه
azd config set alpha.enable true                    # فعال‌سازی قابلیت‌های آلفا
azd config set telemetry.enabled false             # غیرفعال‌سازی تلِمتری
azd config set output.format json                  # تنظیم فرمت خروجی

# تنظیمات امنیتی
azd config set auth.useAzureCliCredential true     # استفاده از Azure CLI برای احراز هویت
azd config set tls.insecure false                  # الزام به اعتبارسنجی TLS

# بهینه‌سازی عملکرد
azd config set provision.parallelism 5             # ایجاد منابع به‌صورت موازی
azd config set deploy.timeout 30m                  # مهلت استقرار
```

## 🏗️ پیکربندی پروژه

### ساختار azure.yaml
فایل `azure.yaml` هسته پروژه azd شماست:

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

## 🌟 مدیریت محیط

### ایجاد محیط‌ها
```bash
# یک محیط جدید ایجاد کنید
azd env new development

# در مکان مشخص ایجاد کنید
azd env new staging --location "westus2"

# از قالب ایجاد کنید
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
# متغیرهای مخصوص محیط را تنظیم کنید
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# متغیرهای محیط را مشاهده کنید
azd env get-values

# خروجی مورد انتظار:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# متغیر محیطی را حذف کنید
azd env unset DEBUG

# حذف را بررسی کنید
azd env get-values | grep DEBUG
# (نباید چیزی برگرداند)
```

### الگوهای محیط
فایل `.azure/env.template` را برای راه‌اندازی محیط سازگار ایجاد کنید:
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

### به‌اشتراک‌گذاری محیط‌ها در یک تیم

وقتی بیش از یک نفر روی یک پروژه کار می‌کند، باید درباره **چه چیزی با مخزن منتقل می‌شود و چه چیزی محلی می‌ماند** توافق کنید. azd هر محیط را زیر یک پوشه `.azure/` نگه می‌دارد، و همه آن نباید کامیت شود.

**چه چیزی در `.azure/` است:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**چه چیزی را در gitignore قرار دهید.** `.gitignore` پیش‌فرض azd از قبل `.azure/` را مستثنی می‌کند. آن را به همین صورت نگه دارید—فایل‌های `.env` می‌توانند شامل اسرار باشند و شناسه‌های منابع برای کسی که آن‌ها را فراهم کرده خاص هستند. هر هم‌تیمی محیط **خود** را محلی ایجاد می‌کند:

```bash
# هر توسعه‌دهنده یک‌بار این را اجرا می‌کند تا محیط ایزولهٔ خود را به‌دست آورد.
azd env new dev-alice
azd up
```

**جابجایی بین محیط‌ها.** توسعه‌دهنده‌ای که چندین محیط را مدیریت می‌کند، محیط فعال را قبل از اجرای دستورات انتخاب می‌کند:

```bash
azd env list                 # مشاهدهٔ همهٔ محیط‌های محلی و اینکه کدام‌یک پیش‌فرض است
azd env select staging       # محیط 'staging' را به‌عنوان محیط فعال تنظیم کنید
azd env get-values           # اطمینان حاصل کنید که به محیط درست اشاره می‌کنید
```

**ارائه مقادیر پیش‌فرض غیرمحرمانه به تیم.** یک الگو (مثل `.azure/env.template` بالا) را کامیت کنید تا همه بدانند کدام متغیرها باید تنظیم شوند—اما هرگز مقادیر پرشده را کامیت نکنید. هم‌تیمی‌های جدید، قالب را کپی کرده و مقادیر خود را پر می‌کنند.

**محیط‌ها در CI/CD.** پایپلاین‌ها پوشه محلی `.azure/` شما را نمی‌خوانند. در عوض، مقادیر محیط را به‌عنوان متغیرها/اسرار پایپلاین فراهم کنید و azd آن‌ها را از محیط فرایند می‌خواند:

```bash
# در CI، azd این مقادیر را از متغیرهای محیطی می‌خواند، نه از .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **قاعده سرانگشتی:** کد زیرساخت (`infra/`, `azure.yaml`) در Git به‌اشتراک گذاشته می‌شود؛ *وضعیت و اسرار محیط* (`.azure/`) برای هر توسعه‌دهنده و هر پایپلاین جداگانه است. `azd pipeline config` متغیرهای پایپلاین را به‌طور خودکار برای شما تنظیم می‌کند.

## 🔐 پیکربندی احراز هویت

### یکپارچه‌سازی با Azure CLI
```bash
# از اعتبارنامه‌های Azure CLI استفاده کنید (پیش‌فرض)
azd config set auth.useAzureCliCredential true

# با یک مستأجر مشخص وارد شوید
az login --tenant <tenant-id>

# اشتراک پیش‌فرض را تنظیم کنید
az account set --subscription <subscription-id>
```

### احراز هویت Service Principal
برای پایپلاین‌های CI/CD:
```bash
# متغیرهای محیطی را تنظیم کنید
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# یا به‌طور مستقیم پیکربندی کنید
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
برای محیط‌های میزبانی‌شده در Azure:
```bash
# فعال‌سازی احراز هویت با هویت مدیریت‌شده
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
# قواعد نام‌گذاری را تعیین کنید
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

### پیکربندی پایش
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
# .آژور/توسعه/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### محیط staging
```bash
# .azure/مرحله‌بندی/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### محیط production
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
# سینتکس پیکربندی را بررسی کنید
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

# متغیرهای محیطی مورد نیاز را بررسی کنید
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# نحو فایل azure.yaml را اعتبارسنجی کنید
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
.azure/*/config.json         # تنظیمات محیطی (شامل شناسه‌های منابع)
.azure/*/.env               # متغیرهای محیطی (ممکن است حاوی اسرار باشند)
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

### تمرین ۱: پیکربندی چندمحیطی (۱۵ دقیقه)

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
- [ ] سه محیط با موفقیت ایجاد شده‌اند
- [ ] هر محیط پیکربندی منحصربه‌فردی دارد
- [ ] می‌توان بدون خطا بین محیط‌ها جابجا شد
- [ ] `azd env list` هر سه محیط را نشان می‌دهد

### تمرین ۲: مدیریت اسرار (۱۰ دقیقه)

**هدف**: تمرین پیکربندی امن با داده‌های حساس

```bash
# مقادیر محرمانه را تنظیم کنید (در خروجی نمایش داده نمی‌شوند)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# پیکربندی‌های غیرمحرمانه را تنظیم کنید
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# محیط را مشاهده کنید (مقادیر محرمانه باید سانسور شوند)
azd env get-values

# تأیید کنید که مقادیر محرمانه ذخیره شده‌اند
azd env get DB_PASSWORD  # باید مقدار واقعی را نشان دهد
```

**معیارهای موفقیت:**
- [ ] اسرار بدون نمایش در ترمینال ذخیره شده‌اند
- [ ] `azd env get-values` اسرار را بازنشانی‌شده نشان می‌دهد
- [ ] `azd env get <SECRET_NAME>` مقدار واقعی را بازیابی می‌کند

## گام‌های بعدی

- [پروژه اول شما](first-project.md) - اعمال پیکربندی در عمل
- [راهنمای استقرار](../chapter-04-infrastructure/deployment-guide.md) - استفاده از پیکربندی برای استقرار
- [تأمین منابع](../chapter-04-infrastructure/provisioning.md) - پیکربندی‌های آماده برای تولید

## مراجع

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**راهنمای فصل:**
- **📚 صفحه دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۳ - پیکربندی و احراز هویت
- **⬅️ قبلی**: [پروژه اول شما](first-project.md)
- **➡️ فصل بعدی**: [فصل ۴: زیرساخت به‌عنوان کد](../chapter-04-infrastructure/deployment-guide.md)
- **درس بعدی**: [پروژه اول شما](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->