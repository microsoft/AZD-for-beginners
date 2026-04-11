# کنفیگریشن گائیڈ

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 3 - کنفیگریشن اور تصدیق
- **⬅️ پچھلا**: [آپ کا پہلا پروجیکٹ](first-project.md)
- **➡️ اگلا**: [تعییناتی رہنمائی](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 اگلا باب**: [باب 4: انفراسٹرکچر بطور کوڈ](../chapter-04-infrastructure/deployment-guide.md)

## تعارف

یہ جامع گائیڈ Azure Developer CLI کی تمام پہلوؤں کا احاطہ کرتی ہے تاکہ بہترین ترقی اور تعیناتی کے ورک فلو کو ترتیب دیا جا سکے۔ آپ کنفیگریشن کی درجہ بندی، ماحولیات کے انتظام، تصدیقی طریقے، اور جدید کنفیگریشن پیٹرنز کے بارے میں جانیں گے جو مؤثر اور محفوظ Azure تعیناتیوں کو ممکن بناتے ہیں۔

## سیکھنے کے مقاصد

اس سبق کے آخر تک، آپ یہ کر سکیں گے:
- azd کنفیگریشن کی درجہ بندی پر عبور حاصل کریں اور سمجھیں کہ ترتیبات کو کس طرح ترجیح دی جاتی ہے
- عالمی اور پروجیکٹ مخصوص ترتیبات کو مؤثر طریقے سے ترتیب دیں
- مختلف کنفیگریشن کے ساتھ متعدد ماحولات کو منظم کریں
- محفوظ تصدیق اور اجازت کے پیٹرنز نافذ کریں
- پیچیدہ منظرناموں کے لئے جدید کنفیگریشن پیٹرنز کو سمجھیں

## سیکھنے کے نتائج

اس سبق کو مکمل کرنے کے بعد، آپ قابل ہوں گے:
- azd کو بہترین ترقیاتی ورک فلو کیلئے ترتیب دینا
- متعدد تعیناتی ماحول کی ترتیب اور انتظام کرنا
- محفوظ کنفیگریشن مینجمنٹ کی مشقیں نافذ کرنا
- کنفیگریشن سے متعلق مسائل کو حل کرنا
- مخصوص تنظیمی ضروریات کے مطابق azd کے رویے کو حسب ضرورت بنانا

یہ جامع گائیڈ Azure Developer CLI کی تمام پہلوؤں کا احاطہ کرتی ہے تاکہ بہترین ترقی اور تعیناتی کے ورک فلو کو ترتیب دیا جا سکے۔

## azd پروجیکٹ میں AI ایجنٹس کی تفہیم

اگر آپ AI ایجنٹس کے لئے نئے ہیں، تو azd کی دنیا میں ان کے بارے میں سوچنے کا ایک آسان طریقہ یہ ہے۔

### ایجنٹ کیا ہے؟

ایجنٹ سافٹ ویئر کا ایک حصہ ہے جو درخواست وصول کر سکتا ہے، اس پر غور و فکر کر سکتا ہے، اور اقدامات کر سکتا ہے — اکثر AI ماڈل کو کال کر کے، ڈیٹا دیکھ کر، یا دیگر خدمات کو طلب کر کے۔ azd پروجیکٹ میں، ایک ایجنٹ آپ کے ویب فرنٹ اینڈ یا API بیک اینڈ کے ساتھ ایک اور **سروس** ہوتا ہے۔

### ایجنٹس azd پروجیکٹ کے ڈھانچے میں کیسے فٹ ہوتے ہیں

ایک azd پروجیکٹ تین تہوں پر مشتمل ہوتا ہے: **انفراسٹرکچر**، **کوڈ**، اور **کنفیگریشن**۔ ایجنٹس ان تہوں میں اسی طرح شامل ہوتے ہیں جیسے کوئی دوسری سروس:

| تہہ | روایتی ایپ کے لیے یہ کیا کرتی ہے | ایجنٹ کے لیے یہ کیا کرتی ہے |
|-------|-------------------------------------|---------------------------|
| **انفراسٹرکچر** (`infra/`) | ویب ایپ اور ڈیٹا بیس کا بندوبست کرتی ہے | AI ماڈل اینڈ پوائنٹ، سرچ انڈیکس، یا ایجنٹ ہوسٹ کا بندوبست کرتی ہے |
| **کوڈ** (`src/`) | آپ کے فرنٹ اینڈ اور API کے ماخذ کوڈ پر مشتمل ہے | آپ کی ایجنٹ لاجک اور پرامپٹ کی تعریفات پر مشتمل ہے |
| **کنفیگریشن** (`azure.yaml`) | آپ کی سروسز اور ان کے ہوسٹنگ مقامات کی فہرست دیتا ہے | آپ کے ایجنٹ کو ایک سروس کے طور پر فہرست دیتا ہے، اس کے کوڈ اور ہوسٹ کی طرف اشارہ کرتے ہوئے |

### `azure.yaml` کا کردار

آپ کو فی الحال نحو یاد رکھنے کی ضرورت نہیں ہے۔ تصوراً، `azure.yaml` وہ فائل ہے جہاں آپ azd کو بتاتے ہیں: *"یہ وہ سروسز ہیں جو میری ایپلیکیشن بناتی ہیں، اور یہ ہے کہ ان کے کوڈ کہاں مل سکتے ہیں۔"*

جب آپ کا پروجیکٹ AI ایجنٹ کو شامل کرتا ہے، تو `azure.yaml` محض اس ایجنٹ کو ایک سروس کے طور پر فہرست دیتا ہے۔ azd پھر صحیح انفراسٹرکچر (جیسے Microsoft Foundry Models اینڈ پوائنٹ یا ایجنٹ کو ہوسٹ کرنے کے لیے کنٹینر ایپ) فراہم کرنے اور آپ کا ایجنٹ کوڈ تعینات کرنے کو جانتا ہے — جیسے وہ ویب ایپ یا API کے لیے کرتا ہے۔

اس کا مطلب یہ ہے کہ کچھ بنیادی طور پر نیا سیکھنے کی ضرورت نہیں۔ اگر آپ سمجھتے ہیں کہ azd ویب سروس کو کیسے منظم کرتا ہے، تو آپ پہلے ہی سمجھتے ہیں کہ یہ ایجنٹ کو کیسے منظم کرتا ہے۔

## کنفیگریشن کی درجہ بندی

azd ایک درجہ بندی شدہ کنفیگریشن سسٹم استعمال کرتا ہے:
1. **کمانڈ لائن کے جھنڈے** (سب سے زیادہ ترجیح)
2. **ماحولیاتی متغیرات**
3. **مقامی پروجیکٹ کنفیگریشن** (`.azd/config.json`)
4. **عالمی صارف کنفیگریشن** (`~/.azd/config.json`)
5. **ڈیفالٹ اقدار** (سب سے کم ترجیح)

## عالمی کنفیگریشن

### عالمی ڈیفالٹس سیٹ کرنا
```bash
# ڈیفالٹ سبسکرپشن سیٹ کریں
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ڈیفالٹ مقام سیٹ کریں
azd config set defaults.location "eastus2"

# ڈیفالٹ ریسورس گروپ کا نام رکھنے کا طریقہ کار سیٹ کریں
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# تمام عالمی کنفیگریشن دیکھیں
azd config show

# ایک کنفیگریشن ہٹائیں
azd config unset defaults.location
```

### عام عالمی ترتیبات
```bash
# ترقی کی ترجیحات
azd config set alpha.enable true                    # الفا خصوصیات کو فعال کریں
azd config set telemetry.enabled false             # ٹیلیمیٹری کو غیر فعال کریں
azd config set output.format json                  # آؤٹ پٹ فارمیٹ سیٹ کریں

# حفاظتی ترتیبات
azd config set auth.useAzureCliCredential true     # تصدیق کے لیے ازور CLI استعمال کریں
azd config set tls.insecure false                  # TLS کی تصدیق کو نافذ کریں

# کارکردگی کی بہتری
azd config set provision.parallelism 5             # متوازی وسائل کی تخلیق
azd config set deploy.timeout 30m                  # تعیناتی کا وقت ختم ہونے کا تعین
```

## 🏗️ پروجیکٹ کنفیگریشن

### azure.yaml کا ڈھانچہ
`azure.yaml` فائل آپ کے azd پروجیکٹ کا دل ہے:

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

#### مخصوص زبان کی ترتیبات
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
# نیا ماحول بنائیں
azd env new development

# مخصوص مقام کے ساتھ بنائیں
azd env new staging --location "westus2"

# سانچہ سے بنائیں
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ماحول کی کنفیگریشن
ہر ماحول اپنی کنفیگریشن رکھتا ہے `.azure/<env-name>/config.json` میں:

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
# مخصوص ماحول کے متغیرات سیٹ کریں
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# ماحول کے متغیرات دیکھیں
azd env get-values

# متوقع نتیجہ:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# ماحول کا متغیر ہٹائیں
azd env unset DEBUG

# ہٹانے کی تصدیق کریں
azd env get-values | grep DEBUG
# (کچھ بھی واپس نہیں آنا چاہیے)
```

### ماحول کے سانچے
مسلسل ماحول کی سیٹ اپ کے لیے `.azure/env.template` بنائیں:
```bash
# ضروری متغیرات
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

## 🔐 تصدیق کی کنفیگریشن

### Azure CLI انضمام
```bash
# ازور CLI اسناد استعمال کریں (ڈیفالٹ)
azd config set auth.useAzureCliCredential true

# مخصوص ٹیننٹ کے ساتھ لاگ ان کریں
az login --tenant <tenant-id>

# ڈیفالٹ سبسکرپشن سیٹ کریں
az account set --subscription <subscription-id>
```

### سروس پرنسپل کی تصدیق
CI/CD پائپ لائنز کے لیے:
```bash
# ماحول کے متغیرات مرتب کریں
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# یا براہ راست ترتیب دیں
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### منیجڈ شناخت
Azure ہوسٹ کیے گئے ماحولیات کے لیے:
```bash
# شناختی توثیق کو فعال کریں جو مینج کی گئی ہو
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ انفراسٹرکچر کنفیگریشن

### بائسک پیرامیٹرز
`infra/main.parameters.json` میں انفراسٹرکچر پیرامیٹرز ترتیب دیں:
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

### ٹیرارفارم کنفیگریشن
ٹیرارفارم پروجیکٹس کے لیے، `infra/terraform.tfvars` میں ترتیب دیں:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 تعیناتی کنفیگریشن

### تعمیر کی کنفیگریشن
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

### ڈاکر کنفیگریشن
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

### کسٹم ریسورس نامکاری
```bash
# نام رکھنے کے طریقہ کار مرتب کریں
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

## 🎯 ماحول مخصوص کنفیگریشن

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

### پیداوار کا ماحول
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
# ترتیب کی نحو چیک کریں
azd config validate

# ماحولیاتی متغیرات کا ٹیسٹ کریں
azd env get-values

# انفراسٹرکچر کی تصدیق کریں
azd provision --dry-run
```

### کنفیگریشن اسکرپٹس
`scripts/` میں تصدیقی اسکرپٹس بنائیں:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ضروری ماحول کے متغیرات کی جانچ کریں
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml کی ترکیب کی تصدیق کریں
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 بہترین مشقیں

### 1. ماحولیاتی متغیرات کا استعمال کریں
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
.azure/*/config.json         # ماحول کے ترتیبات (وسائل کے شناختی نمبر شامل ہوسکتے ہیں)
.azure/*/.env               # ماحول کے متغیرات (خفیہ معلومات شامل ہوسکتی ہیں)
.env                        # مقامی ماحول کی فائل
```

### 4. کنفیگریشن کی دستاویزات
اپنی کنفیگریشن کو `CONFIG.md` میں دستاویزی شکل میں رکھیں:
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

**مقصد**: تین مختلف ترتیبات کے ساتھ ماحول بنائیں اور ترتیب دیں

```bash
# ترقیاتی ماحول بنائیں
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# اسٹجنگ ماحول بنائیں
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
- [ ] ماحول کے درمیان بغیر غلطی کے سوئچ کیا جا سکتا ہے
- [ ] `azd env list` تمام تین ماحول دکھاتا ہے

### مشق 2: رازوں کا انتظام (10 منٹ)

**مقصد**: حساس ڈیٹا کے ساتھ محفوظ کنفیگریشن کی مشق کریں

```bash
# خفیہ معلومات سیٹ کریں (آؤٹ پٹ میں نہیں دکھایا جاتا)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# غیر خفیہ ترتیب سیٹ کریں
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ماحول دیکھیں (خفیہ معلومات کو چھپانا چاہیے)
azd env get-values

# تصدیق کریں کہ خفیہ معلومات محفوظ ہیں
azd env get DB_PASSWORD  # اصل قیمت دکھانی چاہیے
```

**کامیابی کے معیارات:**
- [ ] راز ٹرمینل میں دکھائے بغیر محفوظ کیے گئے
- [ ] `azd env get-values` خفیہ راز ظاہر کرتا ہے
- [ ] انفرادی `azd env get <SECRET_NAME>` اصل قیمت حاصل کرتا ہے

## اگلے مراحل

- [آپ کا پہلا پروجیکٹ](first-project.md) - عملی طور پر کنفیگریشن لگائیں
- [تعییناتی رہنمائی](../chapter-04-infrastructure/deployment-guide.md) - تعیناتی کے لیے کنفیگریشن استعمال کریں
- [وسائل کی فراہمی](../chapter-04-infrastructure/provisioning.md) - پیداواری تیار کنفیگریشن

## حوالہ جات

- [azd کنفیگریشن حوالہ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml اسکیمہ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [ماحولیاتی متغیرات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 3 - کنفیگریشن اور تصدیق
- **⬅️ پچھلا**: [آپ کا پہلا پروجیکٹ](first-project.md)
- **➡️ اگلا باب**: [باب 4: انفراسٹرکچر بطور کوڈ](../chapter-04-infrastructure/deployment-guide.md)
- **اگلا سبق**: [آپ کا پہلا پروجیکٹ](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**اعلانِ تنبیہ**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کے لیے کوشش کرتے ہیں، براہِ مہربانی اس بات سے آگاہ رہیں کہ خودکار تراجم میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں ہی معتبر ماخذ سمجھی جانی چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم پر عائد نہیں ہوتی۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->