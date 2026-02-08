# کنفیگریشن گائیڈ

**باب نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 3 - کنفیگریشن اور توثیق
- **⬅️ پچھلا**: [Your First Project](first-project.md)
- **➡️ اگلا**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 اگلا باب**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## تعارف

یہ جامع رہنما Azure Developer CLI کی کنفیگریشن کے تمام پہلوؤں کو بہترین ترقی اور تعیناتی ورک فلو کے لیے کور کرتی ہے۔ آپ کنفیگریشن ہائیرارکی، ماحول کا انتظام، تصدیقی طریقے، اور ایڈوانسڈ کنفیگریشن پیٹرنز کے بارے میں سیکھیں گے جو مؤثر اور محفوظ Azure تعیناتیوں کو ممکن بناتے ہیں۔

## سیکھنے کے مقاصد

اس سبق کے آخر تک، آپ:
- azd کنفیگریشن ہائیرارکی میں مہارت حاصل کریں گے اور سمجھیں گے کہ ترتیبات کو کس طرح ترجیح دی جاتی ہے
- عالمی اور پراجیکٹ مخصوص ترتیبات کو مؤثر طریقے سے کنفیگر کریں گے
- مختلف کنفیگریشنز کے ساتھ متعدد ماحول کا انتظام کریں گے
- محفوظ تصدیق اور اجازت کے پیٹرنز نافذ کریں گے
- پیچیدہ منظرناموں کے لیے ایڈوانسڈ کنفیگریشن پیٹرنز کو سمجھیں گے

## سیکھنے کے نتائج

اس سبق کو مکمل کرنے کے بعد، آپ قابل ہوں گے:
- azd کو بہترین ترقیاتی ورک فلو کے لیے کنفیگر کرنا
- متعدد ڈیپلائمنٹ ماحول مرتب اور منظم کرنا
- محفوظ کنفیگریشن مینجمنٹ کے طریقے نافذ کرنا
- کنفیگریشن سے متعلق مسائل کو حل کرنا
- مخصوص تنظیمی ضروریات کے لیے azd کے رویے کو حسبِ ضرورت بنانا

یہ جامع رہنما Azure Developer CLI کی کنفیگریشن کے تمام پہلوؤں کو بہترین ترقی اور تعیناتی ورک فلو کے لیے کور کرتی ہے۔

## کنفیگریشن ہائیرارکی

azd ایک ہائیرارکل کنفیگریشن سسٹم استعمال کرتا ہے:
1. **کمانڈ لائن فلیگز** (سب سے زیادہ ترجیح)
2. **ماحول کے متغیرات**
3. **مقامی پروجیکٹ کنفیگریشن** (`.azd/config.json`)
4. **گلوبل یوزر کنفیگریشن** (`~/.azd/config.json`)
5. **ڈیفالٹ اقدار** (سب سے کم ترجیح)

## گلوبل کنفیگریشن

### عالمی ڈیفالٹس مرتب کرنا
```bash
# ڈیفالٹ سبسکرپشن مقرر کریں
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ڈیفالٹ مقام مقرر کریں
azd config set defaults.location "eastus2"

# ڈیفالٹ ریسورس گروپ کے نام رکھنے کا ضابطہ مقرر کریں
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# تمام عالمی ترتیبات دیکھیں
azd config list

# ایک ترتیب حذف کریں
azd config unset defaults.location
```

### عام عالمی ترتیبات
```bash
# ترقی کی ترجیحات
azd config set alpha.enable true                    # الفا خصوصیات کو فعال کریں
azd config set telemetry.enabled false             # ٹیلی میٹری کو غیر فعال کریں
azd config set output.format json                  # آؤٹ پٹ فارمیٹ مقرر کریں

# سیکیورٹی کی ترتیبات
azd config set auth.useAzureCliCredential true     # توثیق کے لیے Azure CLI استعمال کریں
azd config set tls.insecure false                  # TLS کی توثیق نافذ کریں

# کارکردگی کی بہتری
azd config set provision.parallelism 5             # وسائل کی متوازی تخلیق
azd config set deploy.timeout 30m                  # تعیناتی کا ٹائم آؤٹ
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

#### زبان مخصوص ترتیبات
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

## 🌟 ماحول کا انتظام

### ماحول بنانا
```bash
# ایک نیا ماحول بنائیں
azd env new development

# مخصوص مقام کے ساتھ بنائیں
azd env new staging --location "westus2"

# ٹیمپلیٹ سے بنائیں
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ماحول کی کنفیگریشن
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

### ماحول کے متغیرات
```bash
# ماحول کے مخصوص متغیرات مرتب کریں
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# ماحول کے متغیرات دیکھیں
azd env get-values

# متوقع نتیجہ:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# ماحول کا متغیر حذف کریں
azd env unset DEBUG

# حذف کی تصدیق کریں
azd env get-values | grep DEBUG
# (کچھ واپس نہیں کرنا چاہیے)
```

### ماحول ٹیمپلیٹس
مسلسل ماحول سیٹ اپ کے لیے `.azure/env.template` بنائیں:
```bash
# ضروری متغیرات
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# ایپلیکیشن کی ترتیبات
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# اختیاری ترقیاتی ترتیبات
DEBUG=false
LOG_LEVEL=info
```

## 🔐 تصدیق کی کنفیگریشن

### Azure CLI کا انضمام
```bash
# Azure CLI کی اسناد استعمال کریں (پہلے سے طے شدہ)
azd config set auth.useAzureCliCredential true

# مخصوص ٹیننٹ کے ساتھ لاگ ان کریں
az login --tenant <tenant-id>

# پہلے سے طے شدہ سبسکرپشن مقرر کریں
az account set --subscription <subscription-id>
```

### Service Principal کی توثیق
CI/CD پائپ لائنز کے لیے:
```bash
# ماحولیاتی متغیرات متعین کریں
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# یا براہِ راست ترتیب دیں
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### مینجڈ شناخت
Azure میزبان ماحول کے لیے:
```bash
# منظم شناخت کی تصدیق کو فعال کریں
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ انفراسٹرکچر کنفیگریشن

### Bicep پیرامیٹرز
انفراسٹرکچر پیرامیٹرز کو `infra/main.parameters.json` میں کنفیگر کریں:
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
Terraform پروجیکٹس کے لیے، `infra/terraform.tfvars` میں کنفیگر کریں:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 ڈیپلائمنٹ کنفیگریشن

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

### ڈوکر کنفیگریشن
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

## 🔧 ایڈوانسڈ کنفیگریشن

### حسبِ ضرورت ریسورس نامزدگی
```bash
# ناموں کے قواعد طے کریں
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

## 🎯 ماحول مخصوص کنفیگریشنز

### ڈیولپمنٹ ماحول
```bash
# .azure/ترقی/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### اسٹیجنگ ماحول
```bash
# .ایزور/اسٹیجنگ/.env
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

## 🔍 کنفیگریشن کی تصدیق

### کنفیگریشن کی تصدیق کریں
```bash
# کنفیگریشن کے سنٹیکس کی جانچ کریں
azd config validate

# ماحولیاتی متغیرات کی جانچ کریں
azd env get-values

# انفراسٹرکچر کی توثیق کریں
azd provision --dry-run
```

### کنفیگریشن اسکرپٹس
`scripts/` میں تصدیقی اسکرپٹس بنائیں:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ضروری ماحول کے متغیرات چیک کریں
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml کی نحو کی توثیق کریں
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 بہترین طریقے

### 1. ماحول کے متغیرات استعمال کریں
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. کنفیگریشن فائلز کو منظم کریں
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

### 3. ورژن کنٹرول کے پہلو
```bash
# .gitignore
.azure/*/config.json         # ماحولیاتی کنفیگریشنز (وسائل کے شناختی نمبروں پر مشتمل)
.azure/*/.env               # ماحولیاتی متغیرات (خفیہ معلومات شامل ہو سکتی ہیں)
.env                        # مقامی ماحولیاتی فائل
```

### 4. کنفیگریشن دستاویزی کاری
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

## 🎯 عملی مشقیں

### مشق 1: کثیر ماحولیاتی کنفیگریشن (15 منٹ)

**مقصد**: مختلف ترتیبات کے ساتھ تین ماحول بنائیں اور کنفیگر کریں

```bash
# ترقیاتی ماحول بنائیں
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# اسٹیجنگ ماحول بنائیں
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# پیداواری ماحول بنائیں
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ہر ماحول کی تصدیق کریں
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**کامیابی کے معیار:**
- [ ] تین ماحول کامیابی سے بن گئے
- [ ] ہر ماحول کی منفرد کنفیگریشن ہے
- [ ] بغیر کسی غلطی کے ماحول کے درمیان سوئچ کیا جا سکتا ہے
- [ ] `azd env list` تمام تین ماحول دکھاتا ہے

### مشق 2: سیکریٹس مینجمنٹ (10 منٹ)

**مقصد**: حساس ڈیٹا کے ساتھ محفوظ کنفیگریشن کی مشق

```bash
# خفیہ معلومات سیٹ کریں (آؤٹ پٹ میں ظاہر نہیں کیے جائیں گے)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# غیر خفیہ کنفیگریشن سیٹ کریں
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ماحول دیکھیں (خفیہ معلومات مخفی ہونی چاہئیں)
azd env get-values

# تصدیق کریں کہ خفیہ معلومات محفوظ ہیں
azd env get DB_PASSWORD  # اصل قدر ظاہر ہونی چاہیے
```

**کامیابی کے معیار:**
- [ ] سیکریٹس ٹرمینل میں ظاہر کیے بغیر محفوظ کیے گئے ہوں
- [ ] `azd env get-values` محرّف شدہ سیکریٹس دکھاتا ہے
- [ ] انفرادی `azd env get <SECRET_NAME>` حقیقی قدر حاصل کرتا ہے

## اگلے اقدامات

- [آپ کا پہلا پروجیکٹ](first-project.md) - کنفیگریشن عملی طور پر لگائیں
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - تعیناتی کے لیے کنفیگریشن استعمال کریں
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - پروڈکشن کے قابل کنفیگریشنز

## حوالہ جات

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**باب نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 3 - کنفیگریشن اور توثیق
- **⬅️ پچھلا**: [Your First Project](first-project.md)
- **➡️ اگلا باب**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **اگلا سبق**: [آپ کا پہلا پروجیکٹ](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
دستبرداری:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کی کوشش کرتے ہیں، براہِ کرم نوٹ کریں کہ خودکار تراجم میں غلطیاں یا عدمِ درستی ہو سکتی ہے۔ اصل دستاویز کو اس کی مادری زبان میں ہی مستند ماخذ سمجھا جانا چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمہ تجویز کیا جاتا ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->