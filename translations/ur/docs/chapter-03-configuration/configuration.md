# ترتیب کا رہنما

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 3 - ترتیب اور تصدیق
- **⬅️ پچھلا**: [آپ کا پہلا پروجیکٹ](../chapter-01-foundation/first-project.md)
- **➡️ اگلا**: [تنصیب کا رہنما](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 اگلا باب**: [باب 4: انفراسٹرکچر ایز کوڈ](../chapter-04-infrastructure/deployment-guide.md)

## تعارف

> کا جائزہ لیا گیا `azd 1.37.2` (نومبر 2026) کے مطابق۔ باش کمانڈز یہ فرض کرتی ہیں کہ azd پروجیکٹ پہلے سے مرتب شدہ ہے۔ جب تک کہ مکمل فائل کی واضح طور پر وضاحت نہ کی گئی ہو، YAML/Bicep کے کوڈ کے ٹکڑے ایسے حصے ہیں جو متعلقہ پروجیکٹ فائلوں میں ضم کیے جانے کے لیے ہیں، نہ کہ خود مختار چلانے کے قابل منصوبے۔

یہ جامع رہنما Azure Developer CLI کی ترتیب کے تمام پہلوؤں کو شامل کرتا ہے تاکہ بہترین ترقی اور تعیناتی کے ورک فلو کو یقینی بنایا جا سکے۔ آپ ترتیب کے درجات، ماحول کے انتظام، توثیقی طریقے، اور جدید ترتیب کے نمونوں کے بارے میں سیکھیں گے جو موثر اور محفوظ Azure تعیناتیاں ممکن بناتے ہیں۔

## سیکھنے کے مقاصد

اس سبق کے آخر تک، آپ:
- azd کنفیگریشن کی ہائیرارکی میں مہارت حاصل کریں گے اور سمجھیں گے کہ ترتیبات کو کس طرح درجہ بندی دی جاتی ہے
- عالمی اور پروجیکٹ مخصوص ترتیبات کو مؤثر طریقے سے ترتیب دیں گے
- مختلف کنفیگریشنز کے ساتھ متعدد ماحول کا انتظام کریں گے
- محفوظ تصدیق اور اجازت کے نظم و نسق کو نافذ کریں گے
- پیچیدہ حالات کیلئے اعلی درجے کی کنفیگریشن پیٹرنز کو سمجھیں گے

## تعلیمی نتائج

اس سبق کو مکمل کرنے کے بعد، آپ قابل ہو جائیں گے:
- azd کو مثالی ترقیاتی ورک فلو کے لیے ترتیب دینا
- متعدد تعیناتی کے ماحول قائم کرنا اور ان کا انتظام کرنا
- محفوظ ترتیب مینجمنٹ کی مشقیں نافذ کرنا
- ترتیب سے متعلق مسائل کو حل کرنا
- مخصوص تنظیمی ضروریات کے لیے azd کے رویے کو حسب ضرورت بنانا

یہ جامع گائیڈ Azure Developer CLI کو مثالی ترقی اور تعیناتی کے ورک فلو کے لیے ترتیب دینے کے تمام پہلوؤں کا احاطہ کرتی ہے۔

## azd پروجیکٹ میں AI ایجنٹس کو سمجھنا

اگر آپ AI ایجنٹس کے نئے ہیں، تو یہاں azd کی دنیا میں ان کے بارے میں سوچنے کا ایک سادہ طریقہ ہے۔

### ایجنٹ کیا ہے؟

ایک ایجنٹ ایک سافٹ ویئر کا ٹکڑا ہوتا ہے جو درخواست وصول کر سکتا ہے، اس کے بارے میں سوچ سکتا ہے، اور کارروائیاں کر سکتا ہے—اکثر ایک AI ماڈل کو کال کر کے، ڈیٹا تلاش کر کے، یا دیگر خدمات کو کال کر کے۔ azd پروجیکٹ میں، ایک ایجنٹ آپ کے ویب فرنٹ اینڈ یا API بیک اینڈ کے ساتھ ایک اضافی **سروس** ہوتا ہے۔

### ایجنٹس azd پروجیکٹ کے ڈھانچے میں کیسے فٹ ہوتے ہیں

azd پروجیکٹ تین تہوں پر مشتمل ہوتا ہے: **انفراسٹرکچر**، **کوڈ**، اور **تشکیل**۔ ایجنٹس ان تہوں میں وہی طریقہ سے شامل ہوتے ہیں جیسے کوئی اور سروس کرتی ہے:

| تہہ | روایتی ایپ کے لیے کام | ایجنٹ کے لیے کام |
|-------|-------------------------------------|---------------------------|
| **انفراسٹرکچر** (`infra/`) | ایک ویب ایپ اور ڈیٹا بیس کی فراہمی کرتا ہے | ایک AI ماڈل اینڈ پوائنٹ، سرچ انڈیکس، یا ایجنٹ ہوسٹ کی فراہمی کرتا ہے |
| **کوڈ** (`src/`) | آپ کے فرنٹ اینڈ اور API کا سورس کوڈ رکھتا ہے | آپ کی ایجنٹ لاجک اور پرامپٹ تعریفات رکھتا ہے |
| **تشکیل** (`azure.yaml`) | آپ کی سروسز اور ان کے ہوسٹنگ ٹارگیٹس کی فہرست بناتا ہے | آپ کی ایجنٹ کو بطور سروس فہرست کرتا ہے، اس کے کوڈ اور ہوسٹ کی طرف اشارہ کرتا ہے |

### `azure.yaml` کا کردار

آپ کو ابھی نحو یاد رکھنے کی ضرورت نہیں ہے۔ تصوراً، `azure.yaml` وہ فائل ہے جہاں آپ azd کو بتاتے ہیں: *"یہ ہیں وہ سروسز جو میری ایپلیکیشن پر مشتمل ہیں، اور یہاں ان کا کوڈ ملے گا۔"*

جب آپ کے پروجیکٹ میں ایک AI ایجنٹ شامل ہوتا ہے، تو `azure.yaml` صرف اس ایجنٹ کو سروسز میں سے ایک کے طور پر فہرست کرتا ہے۔ اس کے بعد azd درست انفراسٹرکچر (جیسے Microsoft Foundry Models کا اینڈپوائنٹ یا ایجنٹ کی میزبانی کے لیے کنٹینر ایپ) فراہم کرتا ہے اور آپ کے ایجنٹ کا کوڈ ڈپلائے کرتا ہے—بالکل ویسے ہی جیسے یہ ویب ایپ یا API کے لیے کرتا ہے۔

اس کا مطلب ہے کہ سیکھنے کے لیے کوئی بنیادی نیا حکم نہیں ہے۔ اگر آپ سمجھتے ہیں کہ azd ویب سروس کو کیسے منظم کرتا ہے، تو آپ پہلے ہی سمجھتے ہیں کہ یہ ایجنٹ کو کیسے منظم کرتا ہے۔

## تشکیلی درجہ بندی

azd کے پاس مختلف تشکیلی سطحیں ہیں، ایک یونیورسل اوورلے نہیں:
- **عالمی صارف کی ترجیحات**: `~/.azd/config.json`، جس کا انتظام `azd config` کے ذریعے ہے۔
- **پروجیکٹ کی تعریف**: `azure.yaml` خدمات، انفراسٹرکچر، اور ہکس کی وضاحت کرتا ہے۔
- **مقامی ماحول کا انتخاب**: `.azure/config.json`۔
- **ماحول کے مطابق قدریں**: `.azure/<name>/.env`، جسے `azd env` کے ذریعے منظم کیا جاتا ہے؛ اضافی ترتیبات اس ماحول کے `config.json` میں موجود ہیں۔
- **فلیگز اور پراسیس متغیرات**: مخصوص کمانڈ/پرووائیڈر کی حمایت یافتہ ترتیبات کو ہی اوور رائڈ کریں۔

ایک فرضی `azd env set` قدر خود بخود انفراسٹرکچر پیرا میٹر یا تعینات شدہ ایپلیکیشن سیٹنگ نہیں بن جاتی۔ اسے پیرا میٹر فائل، سپورٹڈ سروس کنفیگریشن، یا ہک میں واضح طور پر حوالہ دیں۔

## عالمی ترتیب

### عالمی ڈیفالٹس کی ترتیب
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# View all global configuration
azd config show

# Remove a configuration
azd config unset defaults.location
```

### عمومی عالمی ترتیبات
```bash
# Discover supported settings instead of inventing configuration keys
azd config options
azd config list-alpha

# Explicit opt-in only: use Azure CLI credentials rather than azd's default login
azd config set auth.useAzCliAuth true
# Restore azd's default credential behavior
azd config unset auth.useAzCliAuth

# Use per-command flags for supported behavior
azd show --output json
azd deploy --timeout 1800   # seconds; stops waiting, not the Azure-side deployment
```

## 🏗️ پروجیکٹ کی ترتیب

### azure.yaml ساخت
`azure.yaml` فائل آپ کے azd پروجیکٹ کا مرکز ہے:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0

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
      context: .
      path: Dockerfile
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location

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

یہ ایک **پروجیکٹ کی تعریف کی مثال** ہے، فراہم کردہ سٹارٹر نہیں۔ حوالہ دی گئی ماخذ ڈائریکٹریز، ہک اسکرپٹس، پیکج اسکرپٹس، اور مطابقت رکھنے والے `infra/main.bicep`/`main.parameters.json` تخلیق کریں اس کو چلانے سے پہلے۔ ڈیٹا بیس انفراسٹرکچر میں آتے ہیں؛ `postgres` ایک بلٹ ان سروس ہوسٹ نہیں ہے۔ انفراسٹرکچر پیرا میٹرز فراہم کنندہ کی پیرا میٹر فائل میں جائیں، نہ کہ `infra.parameters` میں۔

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

#### زبان مخصوص بلڈ ہکس

درج ذیل سروس کے ٹکڑے ہکس کی وضاحت کرتے ہیں؛ انہیں ہر سروس کے حقیقی `project` اور `host` کے ساتھ ملائیں۔ `buildCommand` اور `startCommand` عام azd سروس خصوصیات نہیں ہیں۔ اسٹارٹ اپ کی ترتیب ایپلیکیشن، Dockerfile، یا ہوسٹ انفراسٹرکچر میں کریں۔

```yaml
services:
  node-app:
    project: ./src/node
    host: appservice
    language: js
    hooks:
      prepackage:
        shell: sh
        run: npm run build
    
  python-app:
    project: ./src/python
    host: appservice
    language: python
    
  dotnet-app:
    project: ./src/dotnet
    host: appservice
    language: csharp
    
  java-app:
    project: ./src/java
    host: appservice
    language: java
```

## 🌟 ماحول کا انتظام

### ماحول بنانا
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ماحول کی ترتیب
مرکزی ماحول کی قدریں `.azure/<env-name>/.env` میں موجود ہیں، جن میں `AZURE_ENV_NAME`، `AZURE_SUBSCRIPTION_ID`، اور `AZURE_LOCATION` شامل ہیں۔ اضافی ماحول JSON ترتیبات کے لیے `azd env config get/set` استعمال کریں۔ درج ذیل JSON **تصوری ایپلیکیشن اسٹیٹ** ہے، azd کنفیگریشن اسکیمہ نہیں؛ اسے azd کی فائلوں میں کاپی نہ کریں:

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

**صرف سادہ متن کی نمائش۔** عام `azd env set` قدریں `.azure/<name>/.env` میں لکھ دی جاتی ہیں اور read کمانڈز کے ذریعے پرنٹ کی جا سکتی ہیں۔ مثال کے API کلید کو حقیقی شناختی معلومات کے طور پر استعمال نہ کریں۔ رازوں کے لیے، `azd env set-secret` اور واضح رن ٹائم وائرنگ استعمال کریں۔

```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Expected output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Remove environment variable
azd env unset DEBUG

# Verify removal
azd env get-values | grep DEBUG
# (should return nothing)
```

### ماحول کے ٹیمپلیٹس
پراجیکٹ روٹ میں مستقل سیٹ اپ کے لیے ایک **غیر رازدار، دستی طور پر برقرار رکھے جانے والا** `.env.example` بنائیں۔ azd خودکار طور پر `env.template` نامی فائل لوڈ نہیں کرتا:
```bash
# Required variables
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Application settings
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optional development settings
DEBUG=false
LOG_LEVEL=info
```

### ٹیم کے درمیان ماحول کا اشتراک

جب ایک سے زیادہ لوگ کسی پروجیکٹ پر کام کرتے ہیں، تو آپ کو اس بات پر متفق ہونا ہوتا ہے کہ **کیا ریپو کے ساتھ منتقل ہوتا ہے اور کیا مقامی رہتا ہے**۔ azd ہر ماحول کو `.azure/` فولڈر کے تحت رکھتا ہے، اور اس کا ہر حصہ کمٹ نہیں ہونا چاہیئے۔

**کیا `.azure/` میں ہوتا ہے:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**کیا gitignore کرنا ہے۔** azd کا ڈیفالٹ `.gitignore` پہلے ہی `.azure/` کو خارج کر دیتا ہے۔ اسے اسی طرح رکھیں—`.env` فائلوں میں راز ہو سکتے ہیں، اور resource IDs مخصوص ہوتے ہیں جو انہیں تیار کرنے والے کے لیے مخصوص ہوتے ہیں۔ ہر ساتھی اپنا **ذاتی** ماحول مقامی طور پر بناتا ہے:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**ماحول کے درمیان سوئچ کرنا۔** ایک ڈیولپر جو کئی ماحول کا انتظام کرتا ہے، احکامات چلانے سے پہلے فعال ماحول منتخب کرتا ہے:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**ٹیم کو غیر رازدارہ ڈیفالٹس فراہم کرنا۔** کام کو `.env.example` میں commit کریں جو کہ ignored `.azure/` ڈائریکٹری سے باہر ہو۔ نئے ساتھی اسے ایک مقامی ignored فائل میں کاپی کرتے ہیں، اقدار بھر کر، اور واضح طور پر `azd env set --file <local-file>` کے ساتھ امپورٹ کرتے ہیں۔ کبھی بھی خالی placeholders کو ایک کام کرنے والے ماحول پر امپورٹ نہ کریں۔

**CI/CD میں ماحول۔** پائپ لائنز آپ کے مقامی `.azure/` فولڈر کو نہیں پڑھتی ہیں۔ اس کے بجائے، ماحول کی اقدار کو pipeline variables/secrets کے طور پر فراہم کریں، اور azd انہیں process environment سے پڑھتا ہے:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **اصولی قاعدہ:** infrastructure code (`infra/`، `azure.yaml`) Git میں شیئر کیا جاتا ہے؛ ماحول کی *حالت اور راز* (`.azure/`) ہر ڈیولپر اور ہر پائپ لائن کے لیے مخصوص ہوتے ہیں۔ `azd pipeline config` آپ کے لیے پائپ لائن متغیرات خود بخود سیٹ کر دیتا ہے۔

## 🔐 توثیق کی ترتیب

### Azure CLI انٹیگریشن
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### سروس پرنسپل توثیق
CI/CD پائپ لائنز کے لیے:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### منیجڈ آئیڈینٹیٹی
Azure میں ہوسٹ کیے گئے ماحول کے لیے:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ بنیادی ترتیب

### Bicep پیرامیٹرز
بنیادی ڈھانچے کے پیرامیٹرز کو `infra/main.parameters.json` میں ترتیب دیں:
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
Terraform پروجیکٹس کے لیے، azd `infra/main.tfvars.json` میں placeholders کو تبدیل کرتا ہے۔ یہ نام Terraform کے ان پٹ ویریبلز سے میل کھانے چاہئیں:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 تعیناتی کی ترتیب

### تعمیر کی ترتیب
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    host: appservice
    language: js
    dist: build
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          NODE_ENV=production REACT_APP_API_URL="$API_URL" npm run build:prod
    
  api:
    project: ./src/api
    host: appservice
    language: python
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          python -m pip install -r requirements.txt
          PYTHONPATH=src python -m pytest tests/
```

### Docker ترتیب
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - NODE_ENV=production
        - API_VERSION=v1.0.0
```
راستے سروس پروجیکٹ کے لحاظ سے نسبتاً ہوتے ہیں۔ Dockerfile کو کسی بھی `ARG` اقدار کا اعلان کرنا ضروری ہے جو یہ استعمال کرتا ہے۔ ملٹی اسٹیج تعمیر کے لیے، آخری مرحلے کو deployable رکھیں یا ایک اپنی مرضی کی پیکیجنگ ورک فلو استعمال کریں؛ `docker.target` جائزہ شدہ schema میں ایک حمایت یافتہ پراپرٹی نہیں ہے۔

## 🔧 جدید ترتیب

### اپنی مرضی کے وسائل کے نام
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

حقیقی وسائل کے نام Bicep/Terraform میں طے کریں اور resource-group کی تخلیق کو اس ترتیب سے ہم آہنگ رکھیں۔ کوئی عمومی `naming.storageAccount` یا `naming.keyVault` ترتیب کیز موجود نہیں ہیں۔

### نیٹ ورک کی ترتیب
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

ان **مثالی پیرامیٹر اندراجات** کو `infra/main.parameters.json` میں `parameters` کے تحت ضم کریں، اور Bicep میں ملتے جلتے پیرامیٹرز کا اعلان اور استعمال کریں۔ یہ خود سے کوئی عمل نہیں کرتے۔

### مانیٹرنگ کی ترتیب
Application Insights اور Log Analytics کو Bicep/Terraform میں تیار کریں اور اپنی SDK میں ایپلیکیشن ٹیلی میٹری کو ترتیب دیں۔ کوئی عمومی اعلیٰ سطحی `monitoring` بلاک `azure.yaml` میں نہیں جو یہ وسائل بناتا ہو۔ دیکھیں [مانیٹرنگ infrastructure](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability)۔

## 🎯 ماحول کے مخصوص ترتیبات

### ترقیاتی ماحول
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### سٹیجنگ ماحول
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

## 🔍 تشکیل کی تصدیق

### تشکیل کی تصدیق کریں
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### تشکیل کے اسکرپٹس
ایک تشکیل کی تصدیق کے اسکرپٹس بنائیں `scripts/` میں:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ask azd to load the project (not full schema or infrastructure validation)
if ! azd show --output json; then
  echo "Error: Could not load the azd project"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 بہترین عمل

### 1. ماحولیاتی متغیرات کا استعمال کریں
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

حساس قدروں کو ہارڈ کوڈ کرنے سے بچیں (تصویری تشکیل کو علیحدہ رکھیں، جو ایک دوسرا `database` کلید نہیں ہے اسی فائل میں):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. تشکیل کی فائلوں کو منظم کریں
```
.azure/
├── config.json              # Global project config
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
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. تشکیل کی دستاویزات
اپنے تشکیل کو وثیقہ کریں `CONFIG.md` میں:
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

### مشق 1: کثیر ماحولیاتی تشکیل (15 منٹ)

**مقصد**: تین مقامی ماحولیات بنائیں اور تشکیل دیں جن کی مختلف قدریں ہوں۔ ایک شروع شدہ منصوبے میں شروع کریں؛ اگر یہ پہلے سے موجود ہیں تو غیر استعمال شدہ نام استعمال کریں۔ یہ ایپلیکیشن-خصوصی قدریں ٹیلی میٹری/رَن ٹائم کی ترتیبات کو تبدیل نہیں کریں گی جب تک کہ آپ کا ٹیمپلیٹ انہیں استعمال نہ کرے۔

```bash
# Create development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Create staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Create production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verify each environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**کامیابی کے معیار:**
- [ ] تین ماحولیات کامیابی سے بنائی گئی ہیں
- [ ] ہر ماحول کی منفرد تشکیل ہے
- [ ] بغیر غلطیوں کے ماحولیات کے درمیان سوئچ کر سکتے ہیں
- [ ] `azd env list` تینوں ماحولیات کو دکھاتا ہے

### مشق 2: کی والٹ سیکریٹ حوالہ جات (10-20 منٹ)

**مقصد**: صاف متن کے بجائے کی والٹ کا حوالہ محفوظ کریں۔ **شروع کا مقام:** ایک شروع شدہ ماحول، Azure میں دستخط، اور ایک کی والٹ تک رسائی جس میں ڈمی سیکریٹ بنانے/پڑھنے کی اجازت ہو۔ والٹ کے عملیات پر چارجز لگ سکتے ہیں۔

```bash
# Follow the interactive prompts; use a dummy training value, not a production key
azd env set-secret TRAINING_API_KEY

# Set non-secret config
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Inspect .azure/<environment>/.env locally: TRAINING_API_KEY should
# contain an azd Key Vault reference, not the dummy secret text.
# Do not print resolved values in CI or shared terminal logs.
```

**کامیابی کے معیار:**
- [ ] انٹرایکٹو کمانڈ منتخب شدہ والٹ اور سیکریٹ حوالہ رپورٹ کرتا ہے
- [ ] مقامی `.env` میں ڈمی سیکریٹ کے بجائے ایک حوالہ شامل ہے
- [ ] وضاحت کر سکتے ہیں کہ رن ٹائم شناخت/RBAC اور استعمال ابھی بھی ترتیب دینی ہے

**عام مسائل:** ایک 403 کے لیے درست والٹ ڈیٹا-پلیٹ فارم رول اور وقت درکار ہوتا ہے؛ `azd env set ... --secret` ایک درست کمانڈ نہیں ہے۔ عام `get-values`/`get-value` آؤٹ پٹ کو ریڈیکٹڈ نہیں سمجھنا چاہیے۔ تربیتی حوالہ کو `azd env unset TRAINING_API_KEY` سے ہٹائیں؛ یہ والٹ سیکریٹ کو حذف نہیں کرتا، جسے آپ کو الگ سے صاف کرنا ہوگا اگر آپ نے اسے بنایا تھا۔

## اگلے اقدامات

- [آپ کا پہلا پروجیکٹ](../chapter-01-foundation/first-project.md) - عملی طور پر تشکیل کا اطلاق کریں
- [تجھیز رہنمائی](../chapter-04-infrastructure/deployment-guide.md) - تعیناتی کے لیے تشکیل استعمال کریں
- [وسائل کی فراہمی](../chapter-04-infrastructure/provisioning.md) - پیداواری-تیار تشکیلیں

## حوالہ جات

- [azd تشکیل حوالہ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml اسکیمہ](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [ماحولیاتی متغیرات](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD برائے ابتدائی](../../README.md)
- **📖 موجودہ باب**: باب 3 - کنفیگریشن اور تصدیق
- **⬅️ پچھلا**: [آپ کا پہلا منصوبہ](../chapter-01-foundation/first-project.md)
- **➡️ اگلا باب**: [باب 4: کوڈ کی حیثیت سے انفراسٹرکچر](../chapter-04-infrastructure/deployment-guide.md)
- **اگائی سبق**: [تصدیق اور سیکیورٹی](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->