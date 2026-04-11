# راهنمای پیکربندی

**ناوبری فصل:**
- **📚 Course Home**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل 3 - پیکربندی و احراز هویت
- **⬅️ قبلی**: [پروژه اول شما](first-project.md)
- **➡️ بعدی**: [راهنمای استقرار](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 فصل بعد**: [فصل 4: زیرساخت به عنوان کد](../chapter-04-infrastructure/deployment-guide.md)

## مقدمه

این راهنمای جامع تمام جنبه‌های پیکربندی Azure Developer CLI را برای گردش‌کارهای توسعه و استقرار بهینه پوشش می‌دهد. شما درباره سلسله‌مراتب پیکربندی، مدیریت محیط‌ها، روش‌های احراز هویت و الگوهای پیشرفته پیکربندی که امکان استقرار مؤثر و امن در Azure را فراهم می‌کنند، خواهید آموخت.

## اهداف یادگیری

تا پایان این درس، شما:
- بر سلسله‌مراتب پیکربندی azd تسلط پیدا کنید و درک کنید که چگونه تنظیمات اولویت‌بندی می‌شوند
- تنظیمات سراسری و مخصوص پروژه را به‌طور مؤثر پیکربندی کنید
- چند محیط با پیکربندی‌های متفاوت را مدیریت کنید
- الگوهای امن احراز هویت و مجوزدهی را پیاده‌سازی کنید
- الگوهای پیشرفته پیکربندی را برای سناریوهای پیچیده درک کنید

## نتایج یادگیری

پس از تکمیل این درس، شما قادر خواهید بود:
- azd را برای گردش‌کارهای توسعه‌ای بهینه پیکربندی کنید
- چند محیط استقرار را راه‌اندازی و مدیریت کنید
- روش‌های مدیریت پیکربندی امن را پیاده‌سازی کنید
- مشکلات مرتبط با پیکربندی را عیب‌یابی کنید
- رفتار azd را برای نیازهای سازمانی خاص سفارشی کنید

این راهنمای جامع تمام جنبه‌های پیکربندی Azure Developer CLI را برای گردش‌کارهای توسعه و استقرار بهینه پوشش می‌دهد.

## درک عامل‌های هوش مصنوعی در یک پروژه azd

اگر با عامل‌های هوش مصنوعی تازه‌کار هستید، این یک روش ساده برای تفکر درباره آن‌ها در دنیای azd است.

### عامل چیست؟

عامل قطعه‌ای از نرم‌افزار است که می‌تواند یک درخواست را دریافت کند، درباره آن استدلال کند و اقداماتی انجام دهد—اغلب با فراخوانی یک مدل هوش مصنوعی، جستجوی داده‌ها، یا فراخوانی سرویس‌های دیگر. در یک پروژه azd، یک عامل تنها یک **service** دیگر در کنار فرانت‌اند وب یا بک‌اند API شما است.

### جایگاه عامل‌ها در ساختار پروژه azd

یک پروژه azd از سه لایه تشکیل شده است: **infrastructure**، **code**، و **configuration**. عامل‌ها همانند هر سرویس دیگری به این لایه‌ها متصل می‌شوند:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **زیرساخت** (`infra/`) | یک برنامه وب و پایگاه‌داده فراهم می‌کند | یک نقطه پایانی مدل هوش مصنوعی، شاخص جستجو، یا میزبان عامل فراهم می‌کند |
| **کد** (`src/`) | شامل کد منبع فرانت‌اند و API شما است | شامل منطق عامل و تعریف‌های پرامپت آن است |
| **پیکربندی** (`azure.yaml`) | خدمات شما و اهداف میزبانی‌شان را فهرست می‌کند | عامل شما را به‌عنوان یک سرویس فهرست می‌کند که به کد و میزبان آن اشاره می‌کند |

### نقش `azure.yaml`

نیازی به حفظ کردن نحو آن در حال حاضر ندارید. از نظر مفهومی، `azure.yaml` فایلی است که به azd می‌گوید: *"اینجا سرویس‌هایی هستند که برنامه من را تشکیل می‌دهند، و اینجا مکان یافتن کد آن‌ها است."*

وقتی پروژه شما شامل یک عامل هوش مصنوعی باشد، `azure.yaml` به‌سادگی آن عامل را به‌عنوان یکی از سرویس‌ها فهرست می‌کند. سپس azd می‌داند که زیرساخت مناسب را فراهم کند (مانند یک Microsoft Foundry Models endpoint یا یک Container App برای میزبانی عامل) و کد عامل شما را همان‌طور که برای یک برنامه وب یا API انجام می‌دهد، مستقر کند.

این بدان معناست که چیزی اساساً جدیدی برای یادگیری وجود ندارد. اگر درک می‌کنید چگونه azd یک سرویس وب را مدیریت می‌کند، در واقع می‌دانید چگونه یک عامل را مدیریت می‌کند.

## سلسله‌مراتب پیکربندی

azd از یک سیستم پیکربندی سلسله‌مراتبی استفاده می‌کند:
1. **پرچم‌های خط فرمان** (بالاترین اولویت)
2. **متغیرهای محیطی**
3. **پیکربندی محلی پروژه** (`.azd/config.json`)
4. **پیکربندی سراسری کاربر** (`~/.azd/config.json`)
5. **مقادیر پیش‌فرض** (پایین‌ترین اولویت)

## پیکربندی سراسری

### تنظیم مقادیر پیش‌فرض سراسری
```bash
# تنظیم اشتراک پیش‌فرض
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# تنظیم منطقه پیش‌فرض
azd config set defaults.location "eastus2"

# تنظیم قالب نام‌گذاری پیش‌فرض گروه منابع
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# مشاهده تمام پیکربندی‌های سراسری
azd config show

# حذف یک پیکربندی
azd config unset defaults.location
```

### تنظیمات سراسری رایج
```bash
# ترجیحات توسعه
azd config set alpha.enable true                    # فعال‌سازی ویژگی‌های آلفا
azd config set telemetry.enabled false             # غیرفعال‌سازی تله‌متری
azd config set output.format json                  # تنظیم قالب خروجی

# تنظیمات امنیتی
azd config set auth.useAzureCliCredential true     # استفاده از Azure CLI برای احراز هویت
azd config set tls.insecure false                  # الزام به تأیید TLS

# بهینه‌سازی عملکرد
azd config set provision.parallelism 5             # ایجاد منابع به‌صورت موازی
azd config set deploy.timeout 30m                  # مهلت استقرار
```

## 🏗️ پیکربندی پروژه

### ساختار `azure.yaml`
فایل `azure.yaml` هسته پروژه azd شما است:

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

#### تنظیمات خاص زبان
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

# ایجاد در مکان مشخص
azd env new staging --location "westus2"

# ایجاد از الگو
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### پیکربندی محیط
هر محیط دارای پیکربندی مخصوص خود در `.azure/<env-name>/config.json` است:

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
# تنظیم متغیرهای مخصوص محیط
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# مشاهده متغیرهای محیط
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
فایل `.azure/env.template` را برای راه‌اندازی یکسان محیط ایجاد کنید:
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

### یکپارچه‌سازی با Azure CLI
```bash
# از اعتبارنامه‌های Azure CLI استفاده کنید (پیش‌فرض)
azd config set auth.useAzureCliCredential true

# با یک مستأجر مشخص وارد شوید
az login --tenant <tenant-id>

# اشتراک پیش‌فرض را تنظیم کنید
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
برای محیط‌های میزبانی‌شده در Azure:
```bash
# احراز هویت با شناسهٔ مدیریت‌شده را فعال کنید
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

## 🎯 پیکربندی‌های مخصوص هر محیط

### محیط توسعه
```bash
# .azure/توسعه/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### محیط مرحله‌بندی
```bash
# .azure/staging/.env
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
# سینتکس پیکربندی را بررسی کنید
azd config validate

# متغیرهای محیطی را تست کنید
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

# بررسی متغیرهای محیطی مورد نیاز
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# اعتبارسنجی نحو فایل azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 بهترین روش‌ها

### 1. از متغیرهای محیطی استفاده کنید
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

### تمرین 1: پیکربندی چند محیطی (15 minutes)

**هدف**: سه محیط ایجاد و پیکربندی کنید با تنظیمات متفاوت

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

# هر محیط را بررسی و تأیید کنید
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**معیارهای موفقیت:**
- [ ] سه محیط با موفقیت ایجاد شده‌اند
- [ ] هر محیط پیکربندی منحصربه‌فردی دارد
- [ ] قادر به جابجایی بین محیط‌ها بدون خطا باشید
- [ ] `azd env list` هر سه محیط را نشان دهد

### تمرین 2: مدیریت اسرار (10 minutes)

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
azd env get DB_PASSWORD  # باید مقدار واقعی را نشان دهد
```

**معیارهای موفقیت:**
- [ ] اسرار بدون نمایش در ترمینال ذخیره شده‌اند
- [ ] `azd env get-values` اسرار ماسک‌شده را نشان دهد
- [ ] فرمان `azd env get <SECRET_NAME>` مقدار واقعی را بازیابی کند

## گام‌های بعدی

- [پروژه اول شما](first-project.md) - اعمال پیکربندی در عمل
- [راهنمای استقرار](../chapter-04-infrastructure/deployment-guide.md) - استفاده از پیکربندی برای استقرار
- [تهیه منابع](../chapter-04-infrastructure/provisioning.md) - پیکربندی‌های آماده تولید

## منابع

- [مرجع پیکربندی azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [طرح‌واره `azure.yaml`](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [متغیرهای محیطی](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ناوبری فصل:**
- **📚 Course Home**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل 3 - پیکربندی و احراز هویت
- **⬅️ قبلی**: [پروژه اول شما](first-project.md)
- **➡️ فصل بعد**: [فصل 4: زیرساخت به عنوان کد](../chapter-04-infrastructure/deployment-guide.md)
- **درس بعدی**: [پروژه اول شما](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان اصلی خود باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->