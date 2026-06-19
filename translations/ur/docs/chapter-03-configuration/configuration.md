# کنفیگریشن گائیڈ

**باب نیوی گیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 3 - کنفیگریشن اور توثیق
- **⬅️ پچھلا**: [آپ کا پہلا پروجیکٹ](first-project.md)
- **➡️ اگلا**: [ڈپلائمنٹ گائیڈ](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 اگلا باب**: [باب 4: انفراسٹرکچر از کوڈ](../chapter-04-infrastructure/deployment-guide.md)

## تعارف

یہ جامع گائیڈ Azure Developer CLI کی کنفیگریشن کے تمام پہلوؤں کا احاطہ کرتا ہے تاکہ آپ کی ترقی اور تعیناتی کے کاموں کو بہترین بنایا جا سکے۔ آپ کنفیگریشن کی ہائیرارکی، ماحول کا انتظام، توثیقی طریقے، اور پیچیدہ Azure تعیناتیوں کے لیے جدید کنفیگریشن کے نمونے سیکھیں گے۔

## سیکھنے کے اہداف

اس سبق کے آخر میں، آپ:
- azd کنفیگریشن کی ہائیرارکی میں ماہر ہو جائیں گے اور سمجھ سکیں گے کہ ترتیبات کو کس طرح اہمیت دی جاتی ہے
- عالمی اور مخصوص پروجیکٹ کی ترتیبات کو مؤثر طریقے سے ترتیب دیں گے
- مختلف کنفیگریشنز کے ساتھ متعدد ماحول کا انتظام کریں گے
- محفوظ توثیق اور اجازت نمونوں کو نافذ کریں گے
- پیچیدہ حالات کے لیے جدید کنفیگریشن کے نمونے سمجھیں گے

## سیکھنے کے نتائج

سبق مکمل کرنے کے بعد، آپ قابل ہوں گے:
- ترقی کے بہترین ورک فلو کے لیے azd کی کنفیگریشن کریں
- متعدد ڈپلائمنٹ ماحول قائم اور منظم کریں
- محفوظ کنفیگریشن مینجمنٹ کے طریقے نافذ کریں
- کنفیگریشن سے متعلق مسائل کو حل کریں
- مخصوص تنظیمی ضروریات کے لیے azd کے رویے کو حسب ضرورت بنائیں

یہ جامع گائیڈ Azure Developer CLI کی کنفیگریشن کے تمام پہلوؤں کا احاطہ کرتا ہے تاکہ آپ کی ترقی اور تعیناتی کے کاموں کو بہترین بنایا جا سکے۔

## azd پروجیکٹ میں AI ایجنٹس کو سمجھنا

اگر آپ AI ایجنٹس کے لیے نئے ہیں، تو یہاں ایک آسان طریقہ ہے کہ azd کے تناظر میں انہیں سمجھیں۔

### ایجنٹ کیا ہے؟

ایجنٹ ایک ایسا سافٹ ویئر ہوتا ہے جو درخواست وصول کر سکتا ہے، اس پر غور کر سکتا ہے، اور کارروائی کر سکتا ہے—اکثر ایک AI ماڈل کال کر کے، ڈیٹا دیکھ کر، یا دیگر خدمات کو بلا کر۔ azd پروجیکٹ میں، ایجنٹ آپ کی ویب فرنٹ اینڈ یا API بیک اینڈ کے ساتھ ایک اور **سروس** ہوتا ہے۔

### ایجنٹس azd پروجیکٹ کے ڈھانچے میں کیسے فٹ ہوتے ہیں

ایک azd پروجیکٹ تین پرتوں پر مشتمل ہوتا ہے: **انفراسٹرکچر، کوڈ، اور کنفیگریشن**۔ ایجنٹس بھی انہی پرتوں میں اسی طرح شامل ہوتے ہیں جیسے کوئی اور سروس:

| پرت | روایتی ایپ کے لیے کیا کرتی ہے | ایجنٹ کے لیے کیا کرتی ہے |
|-------|------------------------------|--------------------------|
| **انفراسٹرکچر** (`infra/`) | ویب ایپ اور ڈیٹا بیس مہیا کرتی ہے | AI ماڈل اینڈپوائنٹ، سرچ انڈیکس، یا ایجنٹ ہوسٹ مہیا کرتی ہے |
| **کوڈ** (`src/`) | آپ کے فرنٹ اینڈ اور API کا سورس کوڈ | آپ کے ایجنٹ کا لاجک اور پرامپٹ تعریفیں رکھتی ہے |
| **کنفیگریشن** (`azure.yaml`) | آپ کی خدمات اور قائل میزبانی کا تعین کرتی ہے | ایجنٹ کو سروس کے طور پر لسٹ کرتی ہے، اس کے کوڈ اور ہوسٹ کی طرف اشارہ کرتی ہے |

### `azure.yaml` کا کردار

آپ کو ابھی اس کی نحو یاد رکھنے کی ضرورت نہیں۔ تصوراتی طور پر، `azure.yaml` وہ فائل ہے جس میں آپ azd کو بتاتے ہیں: *"یہ خدمات ہیں جو میری ایپلیکیشن پر مشتمل ہیں، اور یہ ان کے کوڈ کہاں ہیں۔"*

جب آپ کے پروجیکٹ میں ایک AI ایجنٹ شامل ہوتا ہے، `azure.yaml` بس اس ایجنٹ کو خدمات میں سے ایک کے طور پر فہرست کرتا ہے۔ پھر azd صحیح انفراسٹرکچر مہیا کرنا جانتا ہے (جیسے Microsoft Foundry Models اینڈپوائنٹ یا ایجنٹ میزبان کرنے کے لیے کنٹینر ایپ) اور آپ کا ایجنٹ کوڈ تعینات کرتا ہے—بالکل اسی طرح جیسے یہ ویب ایپ یا API کے لیے کرتا ہے۔

اس کا مطلب ہے کہ آپ کو بنیادی طور پر کچھ نیا سیکھنے کی ضرورت نہیں ہے۔ اگر آپ سمجھ گئے کہ azd ویب سروس کیسے منظم کرتا ہے، تو آپ پہلے ہی سمجھ چکے ہیں کہ یہ ایجنٹ کو کیسے منظم کرتا ہے۔

## کنفیگریشن کی ہائیرارکی

azd ایک ہائیرارکل کنفیگریشن سسٹم استعمال کرتا ہے:
1. **کمانڈ لائن فلیگز** (سب سے زیادہ اہم)
2. **ماحولیاتی متغیرات**
3. **مقامی پروجیکٹ کنفیگریشن** (`.azd/config.json`)
4. **گلوبل یوزر کنفیگریشن** (`~/.azd/config.json`)
5. **ڈیفالٹ ویلیوز** (سب سے کم اہم)

## عالمی کنفیگریشن

### عالمی ڈیفالٹس کی سیٹنگ
```bash
# ڈیفالٹ سبسکرپشن سیٹ کریں
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ڈیفالٹ مقام سیٹ کریں
azd config set defaults.location "eastus2"

# ڈیفالٹ ریسورس گروپ کے نام رکھنے کا طریقہ کار سیٹ کریں
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# تمام عالمی ترتیب دیکھیں
azd config show

# ایک ترتیب ہٹائیں
azd config unset defaults.location
```

### عام عالمی ترتیبات
```bash
# ترقی کی ترجیحات
azd config set alpha.enable true                    # الفا خصوصیات کو فعال کریں
azd config set telemetry.enabled false             # ٹیلی میٹری کو غیر فعال کریں
azd config set output.format json                  # آؤٹ پٹ فارمیٹ مقرر کریں

# سیکیورٹی سیٹنگز
azd config set auth.useAzureCliCredential true     # تصدیق کے لئے Azure CLI استعمال کریں
azd config set tls.insecure false                  # TLS کی تصدیق کو نافذ کریں

# کارکردگی کی بہتری
azd config set provision.parallelism 5             # متوازی وسائل کی تخلیق
azd config set deploy.timeout 30m                  # تعیناتی کا وقت ختم ہونا
```

## 🏗️ پروجیکٹ کنفیگریشن

### azure.yaml ڈھانچہ
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

### سروس کنفیگریشن آپشنز

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

### ماحول کی تخلیق
```bash
# نیا ماحول بنائیں
azd env new development

# مخصوص جگہ کے ساتھ بنائیں
azd env new staging --location "westus2"

# ٹیمپلیٹ سے بنائیں
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ماحول کنفیگریشن
ہر ماحول کی اپنی کنفیگریشن ہوتی ہے جو `.azure/<env-name>/config.json` میں محفوظ ہوتی ہے:

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
# مخصوص ماحول کے لیے متغیرات سیٹ کریں
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
# (کچھ نہیں لوٹانا چاہیے)
```

### ماحول کے ٹیمپلیٹس
مسلسل ماحول کی ترتیب کے لیے `.azure/env.template` بنائیں:
```bash
# مطلوبہ متغیرات
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# ایپلیکیشن کی ترتیبات
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# اختیاری ترقی کی ترتیبات
DEBUG=false
LOG_LEVEL=info
```

### ٹیم کے درمیان ماحول کی شراکت داری

جب ایک سے زیادہ افراد کسی پروجیکٹ پر کام کرتے ہیں، تو آپ کو اتفاق کرنا ہوتا ہے کہ **کیا چیز رپو کے ساتھ شیئر کی جائے اور کیا مقامی رکھی جائے**۔ azd ہر ماحول کو `.azure/` فولڈر کے تحت رکھتا ہے، اور اس کا سارا مواد کمٹ نہیں ہونا چاہیے۔

**`.azure/` میں کیا ہوتا ہے:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**کیا gitignore کرنا ہے۔** azd کا ڈیفالٹ `.gitignore` پہلے ہی `.azure/` کو خارج کرتا ہے۔ اسے اسی طرح رکھیں — `.env` فائلوں میں راز ہوسکتے ہیں، اور وسائل کے شناختی نمبر اس شخص کے لیے مخصوص ہوتے ہیں جس نے انہیں پروویژن کیا ہے۔ ہر ساتھی اپنی **اپنی** ماحول مقامی طور پر بناتا ہے:

```bash
# ہر ڈویلپر اسے ایک بار چلاتا ہے تاکہ اپنا علیحدہ ماحول حاصل کر سکے
azd env new dev-alice
azd up
```

**ماحول کے درمیان تبدیلی۔** جو ڈویلپر کئی ماحول کا انتظام کرتا ہے، وہ کمانڈز چلانے سے پہلے فعال ماحول منتخب کرتا ہے:

```bash
azd env list                 # تمام مقامی ماحول دیکھیں اور کون سا ڈیفالٹ ہے
azd env select staging       # 'staging' کو فعال ماحول بنائیں
azd env get-values           # تصدیق کریں کہ آپ صحیح ماحول کی طرف اشارہ کر رہے ہیں
```

**ٹیم کو غیر رازدار ڈیفالٹس فراہم کرنا۔** ایک ٹیمپلیٹ (جیسے اوپر `.azure/env.template`) کمٹ کریں تاکہ سب کو معلوم ہو کہ کون سے ویری ایبلز سیٹ کرنے ہیں—لیکن کبھی بھری ہوئی ویلیوز کمٹ نہ کریں۔ نئے ساتھی ٹیمپلیٹ کاپی کرتے ہیں اور اپنی بھرائی کرتے ہیں۔

**CI/CD میں ماحول۔** پائپ لائنز آپ کے مقامی `.azure/` فولڈر کو نہیں پڑھتی، بلکہ ماحول کی قیمتیں پائپ لائن ویری ایبلز/راز کے طور پر فراہم کریں، اور azd انہیں پراسیس ماحول سے پڑھتا ہے:

```bash
# CI میں، azd انہیں ماحولیاتی سے پڑھتا ہے، .azure/ سے نہیں۔
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **اصولی قاعدہ:** انفراسٹرکچر کوڈ (`infra/`, `azure.yaml`) Git میں شیئر کیا جاتا ہے؛ ماحول کی *حالت اور راز* (`.azure/`) ہر ڈویلپر اور ہر پائپ لائن کے لیے مخصوص ہوتی ہے۔ `azd pipeline config` خود بخود پائپ لائن ویری ایبلز سیٹ کر دیتا ہے۔

## 🔐 توثیق کنفیگریشن

### Azure CLI انٹیگریشن
```bash
# Azure CLI اسناد استعمال کریں (پہلے سے طے شدہ)
azd config set auth.useAzureCliCredential true

# مخصوص کرایہ دار کے ساتھ لاگ ان کریں
az login --tenant <tenant-id>

# پہلے سے طے شدہ رکنیت مقرر کریں
az account set --subscription <subscription-id>
```

### سروس پرنسپل توثیق
CI/CD پائپ لائنز کے لیے:
```bash
# ماحول کے متغیرات مقرر کریں
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# یا براہ راست ترتیب دیں
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### مینیجڈ آئیڈینٹیٹی
Azure ہوسٹڈ ماحول کے لیے:
```bash
# شناخت کی خودکار تصدیق کو فعال کریں
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ انفراسٹرکچر کنفیگریشن

### بائسک پیرامیٹرز
`infra/main.parameters.json` میں انفراسٹرکچر پیرامیٹرز مرتب کریں:
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

### ٹیریفارم کنفیگریشن
ٹیریفارم پروجیکٹس کے لیے، `infra/terraform.tfvars` میں کنفیگریشن کریں:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 ڈپلائمنٹ کنفیگریشن

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

### حسب ضرورت ریسورس نام
```bash
# نام رکھنے کے اصول طے کریں
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

## 🔍 کنفیگریشن کی تصدیق

### کنفیگریشن کی تصدیق کریں
```bash
# تشکیل کی نحو کی جانچ کریں
azd config validate

# ماحولیاتی متغیرات کا تجربہ کریں
azd env get-values

# بنیادی ڈھانچے کی تصدیق کریں
azd provision --dry-run
```

### کنفیگریشن اسکرپٹس
`scripts/` میں تصدیقی اسکرپٹس بنائیں:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# مطلوبہ ماحول کے متغیرات کی جانچ کریں
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

### 1. ماحولیاتی متغیرات استعمال کریں
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

### 3. ورژن کنٹرول کے تقاضے
```bash
# .gitignore
.azure/*/config.json         # ماحول کے کنفیگریشن (وسائل کے IDs شامل ہیں)
.azure/*/.env               # ماحول کی متغیرات (خفیہ معلومات شامل ہو سکتی ہیں)
.env                        # مقامی ماحول کی فائل
```

### 4. کنفیگریشن دستاویزات
اپنی کنفیگریشن `CONFIG.md` میں دستاویزی کریں:
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

### مشق 1: متعدد ماحول کی کنفیگریشن (15 منٹس)

**مقصد**: تین مختلف ترتیبات والے ماحول بنائیں اور ترتیب دیں

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
- [ ] ہر ماحول کی جداگانہ کنفیگریشن ہے
- [ ] بغیر غلطی کے ماحول کے درمیان سوئچ کیا جا سکتا ہے
- [ ] `azd env list` تمام تین ماحول دکھاتا ہے

### مشق 2: رازداری کا انتظام (10 منٹس)

**مقصد**: حساس ڈیٹا کے ساتھ محفوظ کنفیگریشن کی مشق کریں

```bash
# خفیہ معلومات مرتب کریں (آؤٹ پٹ میں ظاہر نہیں کی جاتیں)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# غیر خفیہ ترتیب مرتب کریں
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ماحول دیکھیں (خفیہ معلومات چھپائی جانی چاہئیں)
azd env get-values

# تصدیق کریں کہ خفیہ معلومات محفوظ ہیں
azd env get DB_PASSWORD  # حقیقی قدر دکھانی چاہیے
```

**کامیابی کے معیارات:**
- [ ] راز بغیر ٹرمینل میں دکھائے محفوظ کیے گئے
- [ ] `azd env get-values` خفیہ راز ظاہر نہیں کرتا
- [ ] انفرادی `azd env get <SECRET_NAME>` اصل قیمت حاصل کرتا ہے

## اگلے اقدامات

- [آپ کا پہلا پروجیکٹ](first-project.md) - کنفیگریشن کو عملی طور پر استعمال کریں
- [ڈپلائمنٹ گائیڈ](../chapter-04-infrastructure/deployment-guide.md) - تعیناتی کے لیے کنفیگریشن استعمال کریں
- [وسائل کی پروویژننگ](../chapter-04-infrastructure/provisioning.md) - پروڈکشن کے لیے تیار کنفیگریشنز

## حوالہ جات

- [azd کنفیگریشن حوالہ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml اسکیمہ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [ماحولیاتی متغیرات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**باب نیوی گیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 3 - کنفیگریشن اور توثیق
- **⬅️ پچھلا**: [آپ کا پہلا پروجیکٹ](first-project.md)
- **➡️ اگلا باب**: [باب 4: انفراسٹرکچر از کوڈ](../chapter-04-infrastructure/deployment-guide.md)
- **اگلا سبق**: [آپ کا پہلا پروجیکٹ](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->