# کنفیگریشن گائیڈ

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD ابتدائیوں کے لیے](../../README.md)
- **📖 موجودہ باب**: باب 3 - کنفیگریشن اور توثیق
- **⬅️ پچھلا**: [آپ کا پہلا پروجیکٹ](first-project.md)
- **➡️ اگلا**: [تنصیب کا گائیڈ](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 اگلا باب**: [باب 4: انفراسٹرکچر بطور کوڈ](../chapter-04-infrastructure/deployment-guide.md)

## تعارف

یہ جامع گائیڈ Azure Developer CLI کو مؤثر ترقیاتی اور ڈیپلائیمنٹ ورک فلو کے لیے کنفیگر کرنے کے تمام پہلوؤں کا احاطہ کرتی ہے۔ آپ کنفیگریشن ہائیرارکی، ماحول کے انتظام، توثیق کے طریقے، اور جدید کنفیگریشن کے نمونوں کے بارے میں جانیں گے جو مؤثر اور محفوظ Azure ڈیپلائیمنٹس کو ممکن بناتے ہیں۔

## تعلیمی مقاصد

اس سبق کے آخر تک، آپ:
- azd کنفیگریشن کی ہائیرارکی پر عبور حاصل کرلیں گے اور سمجھیں گے کہ ترتیبات کو کس طرح ترجیح دی جاتی ہے
- عالمی اور پروجیکٹ مخصوص ترتیبات کو مؤثر طریقے سے کنفیگر کریں گے
- مختلف کنفیگریشن کے ساتھ متعدد ماحول کا انتظام کریں گے
- محفوظ توثیق اور اجازت نامہ کے نمونے نافذ کریں گے
- پیچیدہ صورتوں کے لیے جدید کنفیگریشن کے نمونے سمجھیں گے

## تعلیمی نتائج

اس سبق کو مکمل کرنے کے بعد، آپ قابل ہوں گے:
- azd کو ترقیاتی ورک فلو کے لیے بہتر طریقے سے کنفیگر کرنا
- متعدد تعیناتی ماحول کا قیام اور انتظام کرنا
- محفوظ کنفیگریشن مینجمنٹ کے اصول نافذ کرنا
- کنفیگریشن سے متعلق مسائل کو حل کرنا
- مخصوص تنظیمی ضروریات کے لیے azd کے رویے کو حسب ضرورت بنانا

یہ جامع گائیڈ Azure Developer CLI کو مؤثر ترقیاتی اور ڈیپلائیمنٹ ورک فلو کے لیے کنفیگر کرنے کے تمام پہلوؤں کا احاطہ کرتی ہے۔

## azd پروجیکٹ میں AI ایجنٹس کو سمجھنا

اگر آپ AI ایجنٹس سے نئے ہیں، تو انہیں azd دنیا کے اندر سمجھنے کا ایک آسان طریقہ یہاں ہے۔

### ایجنٹ کیا ہے؟

ایک ایجنٹ ایک ایسا سافٹ ویئر کا ٹکڑا ہے جو درخواست وصول کر سکتا ہے، اس پر غور و فکر کر سکتا ہے، اور اقدامات کر سکتا ہے—اکثر AI ماڈل کو کال کرکے، ڈیٹا کی تلاش کرکے، یا دیگر خدمات کو استعمال کرکے۔ ایک azd پروجیکٹ میں، ایک ایجنٹ آپ کے ویب فرنٹ اینڈ یا API بیک اینڈ کے ساتھ ایک اور **سروس** ہوتا ہے۔

### ایجنٹس azd پروجیکٹ کی ساخت میں کیسے فٹ ہوتے ہیں

azd پروجیکٹ تین تہوں پر مشتمل ہوتا ہے: **انفراسٹرکچر**، **کوڈ**، اور **کنفیگریشن**۔ ایجنٹس ان تہوں میں اسی طرح پلگ ہوتے ہیں جیسے کوئی اور سروس:

| تہہ | روایتی ایپ کے لیے یہ کیا کرتی ہے | ایجنٹ کے لیے یہ کیا کرتی ہے |
|-------|-------------------------------------|---------------------------|
| **انفراسٹرکچر** (`infra/`) | ویب ایپ اور ڈیٹا بیس فراہم کرتا ہے | AI ماڈل اینڈ پوائنٹ، سرچ انڈیکس، یا ایجنٹ ہوسٹ کو فراہم کرتا ہے |
| **کوڈ** (`src/`) | آپ کا فرنٹ اینڈ اور API سورس کوڈ ہوتا ہے | آپ کی ایجنٹ منطق اور پرامپٹ کی تعریفات ہوتی ہیں |
| **کنفیگریشن** (`azure.yaml`) | آپ کی سروسز اور ان کے ہوسٹنگ اہداف کی فہرست دیتا ہے | آپ کے ایجنٹ کو سروس کے طور پر فہرست دیتا ہے، جو اس کے کوڈ اور ہوسٹ کی طرف اشارہ کرتا ہے |

### `azure.yaml` کا کردار

آپ کو ابھی اس کی ترکیب یاد رکھنے کی ضرورت نہیں ہے۔ تصوری طور پر، `azure.yaml` وہ فائل ہے جہاں آپ azd کو بتاتے ہیں: *"یہ وہ سروسز ہیں جو میری ایپلیکیشن بناتی ہیں، اور ان کا کوڈ کہاں ملے گا۔"*

جب آپ کے پروجیکٹ میں AI ایجنٹ شامل ہوتا ہے، تو `azure.yaml` بس اس ایجنٹ کو سروسز میں سے ایک کے طور پر فہرست کرتا ہے۔ پھر azd صحیح انفراسٹرکچر جیسے Microsoft Foundry Models اینڈ پوائنٹ یا ایجنٹ کو ہوسٹ کرنے کے لیے Container App فراہم کرتا ہے، اور آپ کے ایجنٹ کوڈ کو تعینات کرتا ہے—بالکل اسی طرح جیسے وہ ویب ایپ یا API کے لیے کرتا ہے۔

اس کا مطلب ہے کہ سیکھنے کے لیے بالکل نیا کچھ نہیں ہے۔ اگر آپ سمجھتے ہیں کہ azd ویب سروس کو کیسے منظم کرتا ہے، تو آپ پہلے ہی جانتے ہیں کہ وہ ایجنٹ کو کیسے منظم کرتا ہے۔

## کنفیگریشن ہائیرارکی

azd کنفیگریشن کی ایک ہائیرارکل سسٹم استعمال کرتا ہے:
1. **کمانڈ لائن جھنڈے** (سب سے زیادہ ترجیح)
2. **ماحول کے متغیرات**
3. **مقامی پروجیکٹ کنفیگریشن** (`.azd/config.json`)
4. **گلوبل صارف کنفیگریشن** (`~/.azd/config.json`)
5. **ڈیفالٹ ویلیوز** (سب سے کم ترجیح)

## عالمی کنفیگریشن

### عالمی ڈیفالٹس کی ترتیب
```bash
# ڈیفالٹ سبسکرپشن سیٹ کریں
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ڈیفالٹ مقام سیٹ کریں
azd config set defaults.location "eastus2"

# ڈیفالٹ ریسورس گروپ نام رکھنے کا طریقہ کار سیٹ کریں
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# تمام عالمی کنفیگریشن دیکھیں
azd config list

# ایک کنفیگریشن ہٹائیں
azd config unset defaults.location
```

### عام عالمی سیٹنگز
```bash
# ترقی کی ترجیحات
azd config set alpha.enable true                    # الفا خصوصیات کو فعال کریں
azd config set telemetry.enabled false             # ٹیلیمیٹری کو غیر فعال کریں
azd config set output.format json                  # آؤٹ پٹ فارمیٹ سیٹ کریں

# سیکیورٹی کی ترتیبات
azd config set auth.useAzureCliCredential true     # تصدیق کے لیے Azure CLI استعمال کریں
azd config set tls.insecure false                  # TLS تصدیق کو لازمی بنائیں

# کارکردگی کی ترتیب
azd config set provision.parallelism 5             # وسائل کی متوازی تخلیق
azd config set deploy.timeout 30m                  # تعیناتی کا ٹائم آؤٹ
```

## 🏗️ پروجیکٹ کنفیگریشن

### azure.yaml کی ساخت
`azure.yaml` فائل آپ کے azd پروجیکٹ کا مرکزی حصہ ہے:

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

### سروس کنفیگریشن اختیارات

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

#### زبان کے مخصوص ترتیبات
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

### ماحول بنانے کا طریقہ
```bash
# نیا ماحول بنائیں
azd env new development

# مخصوص مقام کے ساتھ بنائیں
azd env new staging --location "westus2"

# ٹیمپلیٹ سے بنائیں
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ماحول کی کنفیگریشن
ہر ماحول کی اپنی کنفیگریشن ہوتی ہے `.azure/<env-name>/config.json` میں:

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
# ماحول کے مخصوص متغیرات سیٹ کریں
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# ماحولیاتی متغیرات دیکھیں
azd env get-values

# متوقع نتیجہ:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# ماحولیاتی متغیر کو ہٹائیں
azd env unset DEBUG

# ہٹانے کی تصدیق کریں
azd env get-values | grep DEBUG
# (کچھ نہیں ہونا چاہیے)
```

### ماحول کے ٹیمپلیٹس
مسلسل ماحول کی ترتیب کے لیے `.azure/env.template` بنائیں:
```bash
# مطلوبہ متغیرات
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# درخواست کی ترتیبات
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# اختیاری ترقی کی ترتیبات
DEBUG=false
LOG_LEVEL=info
```

## 🔐 توثیق کی کنفیگریشن

### Azure CLI انضمام
```bash
# آزور CLI کی اسناد استعمال کریں (ڈیفالٹ)
azd config set auth.useAzureCliCredential true

# مخصوص کرایہ دار کے ساتھ لاگ ان کریں
az login --tenant <tenant-id>

# ڈیفالٹ سبسکرپشن سیٹ کریں
az account set --subscription <subscription-id>
```

### سروس پرنسپل توثیق
CI/CD پائپ لائنز کے لیے:
```bash
# ماحول کے متغیرات سیٹ کریں
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# یا براہ راست ترتیب دیں
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### مینیجڈ شناخت
Azure ہاسٹ کیے ہوئے ماحول کے لیے:
```bash
# منظم شناخت کی توثیق کو فعال کریں
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ انفراسٹرکچر کی کنفیگریشن

### بائسک پیرامیٹرز
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

### ٹیرافارم کنفیگریشن
ٹیرافارم پروجیکٹس کے لیے، `infra/terraform.tfvars` میں کنفیگر کریں:
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
مثال `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml

## 🔧 جدید کنفیگریشن

### اپنی مرضی کے مطابق وسائل کے نام
```bash
# نام رکھنے کے معیارات مقرر کریں
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
# ترتیب کی نحو کی جانچ کریں
azd config validate

# ماحولیاتی متغیرات کا ٹیسٹ کریں
azd env get-values

# بنیادی ڈھانچے کی توثیق کریں
azd provision --dry-run
```

### کنفیگریشن اسکرپٹس
`scripts/` میں توثیقی اسکرپٹس بنائیں:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ضروری ماحول کے متغیرات کو چیک کریں
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml کی نحو کی تصدیق کریں
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

### 3. ورژن کنٹرول کے Considerations
```bash
# .gitignore
.azure/*/config.json         # ماحول کی ترتیبیں (وسائل کے شناختی نمبروں پر مشتمل)
.azure/*/.env               # ماحول کے متغیرات (راز شامل ہو سکتے ہیں)
.env                        # مقامی ماحول کی فائل
```

### 4. کنفیگریشن کی دستاویزات
اپنی کنفیگریشن `CONFIG.md` میں دستاویز کریں:
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

### مشق 1: متعدد ماحول کی کنفیگریشن (15 منٹ)

**مقصد**: تین مختلف ترتیبات کے ساتھ ماحول قائم اور کنفیگر کریں

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

**کامیابی کے معیارات:**
- [ ] تین ماحول کامیابی سے بنائے گئے
- [ ] ہر ماحول کی منفرد کنفیگریشن ہے
- [ ] ماحول کے درمیان بغیر غلطیوں کے سوئچ کیا جا سکتا ہے
- [ ] `azd env list` تمام تین ماحول دکھاتا ہے

### مشق 2: خفیہ مینجمنٹ (10 منٹ)

**مقصد**: حساس ڈیٹا کے ساتھ محفوظ کنفیگریشن کی مشق کریں

```bash
# راز مقرر کریں (آؤٹ پٹ میں ظاہر نہیں کیے جاتے)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# غیر راز کنفیگریشن مقرر کریں
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ماحولیاتی حالات دیکھیں (راز نظر نہ آنے چاہئیں)
azd env get-values

# تصدیق کریں کہ راز محفوظ کیے گئے ہیں
azd env get DB_PASSWORD  # اصل قیمت دکھانی چاہیے
```

**کامیابی کے معیارات:**
- [ ] خفیہ معلومات ٹرمینل میں ظاہر کیے بغیر اسٹور کی گئی ہیں
- [ ] `azd env get-values` خفیہ معلومات چھپاتا ہے
- [ ] انفرادی `azd env get <SECRET_NAME>` اصلی قیمت بازیافت کرتا ہے

## اگلے اقدامات

- [آپ کا پہلا پروجیکٹ](first-project.md) - کنفیگریشن کو عملی جامہ پہنائیں
- [تنصیب کا گائیڈ](../chapter-04-infrastructure/deployment-guide.md) - تعیناتی کے لیے کنفیگریشن استعمال کریں
- [وسائل کی فراہمی](../chapter-04-infrastructure/provisioning.md) - پروڈکشن کے لیے تیار کنفیگریشنز

## مآخذ

- [azd کنفیگریشن حوالہ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml سکیمہ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [ماحول کے متغیرات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD ابتدائیوں کے لیے](../../README.md)
- **📖 موجودہ باب**: باب 3 - کنفیگریشن اور توثیق
- **⬅️ پچھلا**: [آپ کا پہلا پروجیکٹ](first-project.md)
- **➡️ اگلا باب**: [باب 4: انفراسٹرکچر بطور کوڈ](../chapter-04-infrastructure/deployment-guide.md)
- **اگلا سبق**: [آپ کا پہلا پروجیکٹ](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کی کوشش کرتے ہیں، براہ کرم اس بات کا خیال रखें کہ خودکار تراجم میں غلطیاں یا غلط فہمیاں ہو سکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں بنیادی ماخذ سمجھی جانی چاہیے۔ اہم معلومات کے لیے پیشہ ورانہ انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تفسیر کی ذمہ داری ہم پر عائد نہیں ہوتی۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->