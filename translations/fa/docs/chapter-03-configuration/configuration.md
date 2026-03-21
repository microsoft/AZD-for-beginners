# راهنمای پیکربندی

**ناوبری فصل:**
- **📚 صفحه دوره**: [AZD For Beginners](../../README.md)
- **📖 فصل جاری**: فصل 3 - پیکربندی و احراز هویت
- **⬅️ قبلی**: [اولین پروژه شما](first-project.md)
- **➡️ بعدی**: [راهنمای استقرار](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 فصل بعدی**: [فصل 4: زیرساخت به‌عنوان کد](../chapter-04-infrastructure/deployment-guide.md)

## مقدمه

این راهنمای جامع همه جنبه‌های پیکربندی Azure Developer CLI را برای جریان‌های کار توسعه و استقرار بهینه پوشش می‌دهد. شما با سلسله‌مراتب پیکربندی، مدیریت محیط‌ها، روش‌های احراز هویت و الگوهای پیشرفته پیکربندی که استقرارهای ایمن و کارآمد در Azure را ممکن می‌سازند، آشنا خواهید شد.

## اهداف یادگیری

تا پایان این درس، شما قادر خواهید بود:
- تسلط بر سلسله‌مراتب پیکربندی azd و درک اولویت‌بندی تنظیمات
- پیکربندی مؤثر تنظیمات سراسری و مخصوص پروژه
- مدیریت چندین محیط با پیکربندی‌های متفاوت
- پیاده‌سازی الگوهای احراز هویت و مجوزدهی امن
- درک الگوهای پیکربندی پیشرفته برای سناریوهای پیچیده

## نتایج یادگیری

پس از تکمیل این درس، شما خواهید توانست:
- azd را برای جریان‌های کاری توسعه بهینه پیکربندی کنید
- چندین محیط استقرار را راه‌اندازی و مدیریت کنید
- رویه‌های مدیریت پیکربندی امن را پیاده‌سازی کنید
- مشکلات مرتبط با پیکربندی را عیب‌یابی کنید
- رفتار azd را برای نیازهای سازمانی خاص سفارشی‌سازی کنید

این راهنمای جامع همه جنبه‌های پیکربندی Azure Developer CLI را برای جریان‌های کار توسعه و استقرار بهینه پوشش می‌دهد.

## درک عامل‌های هوش مصنوعی در یک پروژه azd

اگر با عامل‌های هوش مصنوعی آشنا نیستید، در اینجا یک روش ساده برای تصور آن‌ها در دنیای azd آمده است.

### عامل چیست؟

عامل یک قطعه نرم‌افزاری است که می‌تواند یک درخواست دریافت کند، درباره آن استدلال کند و اقداماتی انجام دهد — اغلب با فراخوانی یک مدل هوش مصنوعی، جستجوی داده، یا فراخوانی سرویس‌های دیگر. در یک پروژه azd، یک عامل فقط یک **سرویس** دیگر در کنار فرانت‌اند وب یا بک‌اند API شما است.

### عامل‌ها چگونه در ساختار پروژه azd جای می‌گیرند

یک پروژه azd از سه لایه تشکیل شده است: **زیرساخت**، **کد** و **پیکربندی**. عامل‌ها همانند هر سرویس دیگری به این لایه‌ها متصل می‌شوند:

| لایه | نقش آن برای یک برنامه سنتی | نقش آن برای یک عامل |
|-------|-------------------------------------|---------------------------|
| **زیرساخت** (`infra/`) | یک برنامه وب و پایگاه‌داده را ایجاد می‌کند | نقطه پایان مدل هوش مصنوعی، نمایه جستجو، یا میزبان عامل را ایجاد می‌کند |
| **کد** (`src/`) | شامل کد منبع فرانت‌اند و API شما است | شامل منطق عامل و تعریف‌های پرامپت آن است |
| **پیکربندی** (`azure.yaml`) | لیست سرویس‌ها و هدف میزبانی آن‌ها را فهرست می‌کند | عامل را به‌عنوان یک سرویس فهرست می‌کند و به کد و میزبان آن اشاره می‌کند |

### نقش `azure.yaml`

نیازی نیست هم‌اکنون نحو را حفظ کنید. به‌صورت مفهومی، `azure.yaml` فایلی است که به azd می‌گوید: *"این‌ها سرویس‌هایی هستند که برنامه من را تشکیل می‌دهند، و اینجا مکان یافتن کد آن‌هاست."*

وقتی پروژه شما شامل یک عامل هوش مصنوعی باشد، `azure.yaml` به سادگی آن عامل را به‌عنوان یکی از سرویس‌ها فهرست می‌کند. سپس azd می‌داند که زیرساخت مناسب را فراهم کند (مثل یک Microsoft Foundry Models endpoint یا یک Container App برای میزبانی عامل) و کد عامل شما را مستقر کند — درست همان‌طور که برای یک برنامه وب یا API انجام می‌دهد.

این بدان معناست که چیز بنیادی جدیدی برای یادگیری وجود ندارد. اگر درک کنید azd چگونه یک سرویس وب را مدیریت می‌کند، قبلاً می‌دانید چگونه یک عامل را مدیریت می‌کند.

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

# تنظیم مکان پیش‌فرض
azd config set defaults.location "eastus2"

# تنظیم قواعد نام‌گذاری پیش‌فرض گروه منابع
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# مشاهده تمامی پیکربندی‌های سراسری
azd config list

# حذف یک پیکربندی
azd config unset defaults.location
```

### تنظیمات رایج سراسری
```bash
# ترجیحات توسعه
azd config set alpha.enable true                    # فعال‌سازی ویژگی‌های آلفا
azd config set telemetry.enabled false             # غیرفعال‌سازی ردیابی
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

#### نوع میزبان
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

# ایجاد در مکان مشخص
azd env new staging --location "westus2"

# ایجاد از قالب
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### پیکربندی محیط
هر محیط پیکربندی خودش را در `.azure/<env-name>/config.json` دارد:

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
# تنظیم متغیرهای مخصوصِ محیط
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
یک `.azure/env.template` برای راه‌اندازی یکنواخت محیط‌ها ایجاد کنید:
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
# استفاده از اعتبارنامه‌های Azure CLI (پیش‌فرض)
azd config set auth.useAzureCliCredential true

# ورود با یک مستأجر مشخص
az login --tenant <tenant-id>

# تنظیم اشتراک پیش‌فرض
az account set --subscription <subscription-id>
```

### احراز هویت Service Principal
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

### Managed Identity
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
نمونه `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

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

## 🎯 پیکربندی‌های خاص محیط

### محیط توسعه
```bash
# .آزور/توسعه/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### محیط مرحله‌بندی
```bash
# .azure/آماده‌سازی/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### محیط تولید
```bash
# .آزور/تولید/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 اعتبارسنجی پیکربندی

### اعتبارسنجی پیکربندی
```bash
# ‎نحو پیکربندی را بررسی کنید
azd config validate

# ‎متغیرهای محیطی را آزمایش کنید
azd env get-values

# ‎زیرساخت را اعتبارسنجی کنید
azd provision --dry-run
```

### اسکریپت‌های پیکربندی
اسکریپت‌های اعتبارسنجی را در `scripts/` ایجاد کنید:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# بررسی متغیرهای محیطی لازم
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

## 🎓 بهترین شیوه‌ها

### 1. از متغیرهای محیطی استفاده کنید
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. فایل‌های پیکربندی را سازمان‌دهی کنید
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
.azure/*/.env               # متغیرهای محیط (ممکن است شامل اسرار باشند)
.env                        # فایل محیط محلی
```

### 4. مستندسازی پیکربندی
پیکربندی خود را در `CONFIG.md` مستندسازی کنید:
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

### تمرین 1: پیکربندی چندمحیطی (15 دقیقه)

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

# بررسی هر محیط
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**معیارهای موفقیت:**
- [ ] سه محیط با موفقیت ایجاد شده‌اند
- [ ] هر محیط پیکربندی یکتایی دارد
- [ ] می‌توان بدون خطا بین محیط‌ها جابه‌جا شد
- [ ] `azd env list` همه سه محیط را نشان می‌دهد

### تمرین 2: مدیریت اسرار (10 دقیقه)

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

# تأیید ذخیره شدن مقادیر محرمانه
azd env get DB_PASSWORD  # باید مقدار واقعی را نشان دهد
```

**معیارهای موفقیت:**
- [ ] اسرار بدون نمایش در ترمینال ذخیره شده‌اند
- [ ] `azd env get-values` اسرار را به‌صورت محرمانه نشان می‌دهد
- [ ] دستور مجزای `azd env get <SECRET_NAME>` مقدار واقعی را بازیابی می‌کند

## گام‌های بعدی

- [اولین پروژه شما](first-project.md) - اعمال پیکربندی در عمل
- [راهنمای استقرار](../chapter-04-infrastructure/deployment-guide.md) - استفاده از پیکربندی برای استقرار
- [تأمین منابع](../chapter-04-infrastructure/provisioning.md) - پیکربندی‌های آماده تولید

## منابع

- [مرجع پیکربندی azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [اسکیما azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [متغیرهای محیطی](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ناوبری فصل:**
- **📚 صفحه دوره**: [AZD For Beginners](../../README.md)
- **📖 فصل جاری**: فصل 3 - پیکربندی و احراز هویت
- **⬅️ قبلی**: [اولین پروژه شما](first-project.md)
- **➡️ فصل بعدی**: [فصل 4: زیرساخت به‌عنوان کد](../chapter-04-infrastructure/deployment-guide.md)
- **درس بعدی**: [اولین پروژه شما](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. نسخهٔ اصلی سند به زبان اصلی‌اش باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای توسط انسان توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا سوءبرداشت ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->