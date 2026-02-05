# ترتیب گائیڈ

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD ابتدائیوں کے لیے](../../README.md)
- **📖 موجودہ باب**: باب 3 - ترتیب اور تصدیق
- **⬅️ پچھلا**: [آپ کا پہلا پروجیکٹ](first-project.md)
- **➡️ اگلا**: [تعیناتی گائیڈ](../deployment/deployment-guide.md)
- **🚀 اگلا باب**: [باب 4: کوڈ کے طور پر انفراسٹرکچر](../deployment/deployment-guide.md)

## تعارف

یہ جامع گائیڈ Azure Developer CLI کو بہترین ترقی اور تعیناتی ورک فلو کے لیے ترتیب دینے کے تمام پہلوؤں کا احاطہ کرتی ہے۔ آپ ترتیب کی درجہ بندی، ماحول کے انتظام، تصدیق کے طریقے، اور پیچیدہ ترتیب کے نمونوں کے بارے میں سیکھیں گے جو موثر اور محفوظ Azure تعیناتیوں کو ممکن بناتے ہیں۔

## سیکھنے کے اہداف

اس سبق کے اختتام تک، آپ:
- azd ترتیب کی درجہ بندی میں مہارت حاصل کریں گے اور سمجھیں گے کہ ترتیبات کو کس طرح ترجیح دی جاتی ہے
- عالمی اور پروجیکٹ مخصوص ترتیبات کو مؤثر طریقے سے ترتیب دیں گے
- مختلف ترتیبات کے ساتھ متعدد ماحول کا انتظام کریں گے
- محفوظ تصدیق اور اجازت کے نمونوں کو نافذ کریں گے
- پیچیدہ منظرناموں کے لیے اعلی درجے کی ترتیب کے نمونوں کو سمجھیں گے

## سیکھنے کے نتائج

اس سبق کو مکمل کرنے کے بعد، آپ قابل ہوں گے:
- ترقی کے بہترین ورک فلو کے لیے azd ترتیب دیں
- متعدد تعیناتی ماحول ترتیب دیں اور ان کا انتظام کریں
- محفوظ ترتیب کے انتظام کے طریقے نافذ کریں
- ترتیب سے متعلق مسائل کو حل کریں
- مخصوص تنظیمی ضروریات کے لیے azd کے رویے کو حسب ضرورت بنائیں

یہ جامع گائیڈ Azure Developer CLI کو بہترین ترقی اور تعیناتی ورک فلو کے لیے ترتیب دینے کے تمام پہلوؤں کا احاطہ کرتی ہے۔

## ترتیب کی درجہ بندی

azd ایک درجہ بندی ترتیب کا نظام استعمال کرتا ہے:
1. **کمانڈ لائن فلیگز** (سب سے زیادہ ترجیح)
2. **ماحول کے متغیرات**
3. **مقامی پروجیکٹ ترتیب** (`.azd/config.json`)
4. **عالمی صارف ترتیب** (`~/.azd/config.json`)
5. **پہلے سے طے شدہ اقدار** (سب سے کم ترجیح)

## عالمی ترتیب

### عالمی ڈیفالٹس ترتیب دینا
```bash
# ڈیفالٹ سبسکرپشن سیٹ کریں
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ڈیفالٹ مقام سیٹ کریں
azd config set defaults.location "eastus2"

# ڈیفالٹ وسائل گروپ نام دینے کا طریقہ کار سیٹ کریں
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# تمام عالمی ترتیب دیکھیں
azd config list

# ایک ترتیب کو ہٹائیں
azd config unset defaults.location
```

### عام عالمی ترتیبات
```bash
# ترقی کی ترجیحات
azd config set alpha.enable true                    # الفا خصوصیات کو فعال کریں
azd config set telemetry.enabled false             # ٹیلیمیٹری کو غیر فعال کریں
azd config set output.format json                  # آؤٹ پٹ فارمیٹ سیٹ کریں

# سیکیورٹی کی ترتیبات
azd config set auth.useAzureCliCredential true     # تصدیق کے لیے Azure CLI استعمال کریں
azd config set tls.insecure false                  # TLS تصدیق کو نافذ کریں

# کارکردگی کی ترتیب
azd config set provision.parallelism 5             # وسائل کی متوازی تخلیق
azd config set deploy.timeout 30m                  # تعیناتی کا وقت ختم
```

## 🏗️ پروجیکٹ ترتیب

### azure.yaml ساخت
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

### سروس ترتیب کے اختیارات

#### میزبان کی اقسام
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

# سانچے سے بنائیں
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ماحول کی ترتیب
ہر ماحول کی اپنی ترتیب `.azure/<env-name>/config.json` میں ہوتی ہے:

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

# ماحول کے متغیرات دیکھیں
azd env get-values

# متوقع نتیجہ:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=خفیہ-اے پی آئی-کلید
# DEBUG=true

# ماحول کے متغیر کو ہٹائیں
azd env unset DEBUG

# ہٹانے کی تصدیق کریں
azd env get-values | grep DEBUG
# (کچھ بھی واپس نہیں آنا چاہیے)
```

### ماحول کے سانچے
مسلسل ماحول کی ترتیب کے لیے `.azure/env.template` بنائیں:
```bash
# مطلوبہ متغیرات
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

## 🔐 تصدیق کی ترتیب

### Azure CLI انضمام
```bash
# Azure CLI اسناد استعمال کریں (پہلے سے طے شدہ)
azd config set auth.useAzureCliCredential true

# مخصوص کرایہ دار کے ساتھ لاگ ان کریں
az login --tenant <tenant-id>

# ڈیفالٹ سبسکرپشن سیٹ کریں
az account set --subscription <subscription-id>
```

### سروس پرنسپل تصدیق
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

### منظم شناخت
Azure میزبان ماحول کے لیے:
```bash
# منظم شناخت کی تصدیق کو فعال کریں
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ انفراسٹرکچر ترتیب

### Bicep پیرامیٹرز
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

### Terraform ترتیب
Terraform پروجیکٹس کے لیے، `infra/terraform.tfvars` میں ترتیب دیں:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 تعیناتی ترتیب

### تعمیر کی ترتیب
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

### Docker ترتیب
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

## 🔧 اعلی درجے کی ترتیب

### حسب ضرورت وسائل کے نام
```bash
# نام رکھنے کے اصول مقرر کریں
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### نیٹ ورک ترتیب
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### نگرانی کی ترتیب
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

## 🎯 ماحول مخصوص ترتیبات

### ترقیاتی ماحول
```bash
# .azure/ترقی/.env
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

### پیداواری ماحول
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 ترتیب کی توثیق

### ترتیب کی توثیق کریں
```bash
# ترتیب کی نحو چیک کریں
azd config validate

# ماحول کے متغیرات کی جانچ کریں
azd env get-values

# بنیادی ڈھانچے کی تصدیق کریں
azd provision --dry-run
```

### ترتیب کے اسکرپٹس
`scripts/` میں توثیق کے اسکرپٹس بنائیں:

```bash
#!/bin/bash
# اسکرپٹس/validate-config.sh

echo "Validating configuration..."

# مطلوبہ ماحول متغیرات چیک کریں
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml نحو کی تصدیق کریں
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

### 2. ترتیب کی فائلوں کو منظم کریں
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

### 3. ورژن کنٹرول کے تحفظات
```bash
# .gitignore
.azure/*/config.json         # ماحول کی ترتیبیں (وسائل کے IDs پر مشتمل ہیں)
.azure/*/.env               # ماحول کے متغیرات (رازوں پر مشتمل ہو سکتے ہیں)
.env                        # مقامی ماحول کی فائل
```

### 4. ترتیب کی دستاویزات
اپنی ترتیب کو `CONFIG.md` میں دستاویز کریں:
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

### مشق 1: کثیر ماحول ترتیب (15 منٹ)

**مقصد**: مختلف ترتیبات کے ساتھ تین ماحول بنائیں اور ترتیب دیں

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
- [ ] تین ماحول کامیابی سے بنائے گئے
- [ ] ہر ماحول کی منفرد ترتیب ہے
- [ ] ماحول کے درمیان بغیر کسی غلطی کے سوئچ کر سکتے ہیں
- [ ] `azd env list` تمام تین ماحول دکھاتا ہے

### مشق 2: راز کا انتظام (10 منٹ)

**مقصد**: حساس ڈیٹا کے ساتھ محفوظ ترتیب کی مشق کریں

```bash
# خفیہ معلومات سیٹ کریں (آؤٹ پٹ میں ظاہر نہیں ہوں گی)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# غیر خفیہ ترتیب سیٹ کریں
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ماحول دیکھیں (خفیہ معلومات کو چھپایا جانا چاہیے)
azd env get-values

# تصدیق کریں کہ خفیہ معلومات محفوظ ہیں
azd env get DB_PASSWORD  # اصل قدر دکھانی چاہیے
```

**کامیابی کے معیار:**
- [ ] راز بغیر ٹرمینل میں دکھائے محفوظ کیے گئے
- [ ] `azd env get-values` راز کو چھپائے ہوئے دکھاتا ہے
- [ ] انفرادی `azd env get <SECRET_NAME>` اصل قدر حاصل کرتا ہے

## اگلے مراحل

- [آپ کا پہلا پروجیکٹ](first-project.md) - ترتیب کو عملی طور پر لاگو کریں
- [تعیناتی گائیڈ](../deployment/deployment-guide.md) - تعیناتی کے لیے ترتیب استعمال کریں
- [وسائل کی فراہمی](../deployment/provisioning.md) - پیداواری ترتیب کے لیے تیار

## حوالہ جات

- [azd ترتیب حوالہ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml اسکیمہ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [ماحول کے متغیرات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD ابتدائیوں کے لیے](../../README.md)
- **📖 موجودہ باب**: باب 3 - ترتیب اور تصدیق
- **⬅️ پچھلا**: [آپ کا پہلا پروجیکٹ](first-project.md)
- **➡️ اگلا باب**: [باب 4: کوڈ کے طور پر انفراسٹرکچر](../deployment/deployment-guide.md)
- **اگلا سبق**: [آپ کا پہلا پروجیکٹ](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**اعلانِ لاتعلقی**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->