<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T19:10:03+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "ur"
}
-->
# ریٹیل ملٹی ایجنٹ حل - اے آر ایم ٹیمپلیٹ ڈپلائمنٹ

**باب 5: پروڈکشن ڈپلائمنٹ پیکیج**
- **📚 کورس ہوم**: [AZD فار بیگنرز](../../README.md)
- **📖 متعلقہ باب**: [باب 5: ملٹی ایجنٹ اے آئی حل](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 منظرنامہ گائیڈ**: [مکمل عمل درآمد](../retail-scenario.md)
- **🎯 فوری ڈپلائمنٹ**: [ایک کلک میں ڈپلائمنٹ](../../../../examples/retail-multiagent-arm-template)

یہ ڈائریکٹری ریٹیل ملٹی ایجنٹ کسٹمر سپورٹ حل کے لیے مکمل Azure Resource Manager (ARM) ٹیمپلیٹ فراہم کرتی ہے، جو پوری آرکیٹیکچر کے لیے انفراسٹرکچر کوڈ کے طور پر فراہم کرتی ہے۔

## 🎯 کیا ڈپلائمنٹ ہوتا ہے؟

### بنیادی انفراسٹرکچر
- **Azure OpenAI سروسز** (اعلی دستیابی کے لیے ملٹی ریجن)
  - پرائمری ریجن: GPT-4o کسٹمر ایجنٹ کے لیے
  - سیکنڈری ریجن: GPT-4o-mini انوینٹری ایجنٹ کے لیے  
  - ٹرشری ریجن: ٹیکسٹ ایمبیڈنگ ماڈل
  - ایویلیوایشن ریجن: GPT-4o گریڈر ماڈل
- **Azure AI سرچ** ویکٹر سرچ کی صلاحیتوں کے ساتھ
- **Azure اسٹوریج اکاؤنٹ** دستاویزات اور اپلوڈز کے لیے بلاک کنٹینرز کے ساتھ
- **Azure کنٹینر ایپس ماحول** آٹو اسکیلنگ کے ساتھ
- **کنٹینر ایپس** ایجنٹ روٹر اور فرنٹ اینڈ کے لیے
- **Azure Cosmos DB** چیٹ ہسٹری اسٹوریج کے لیے
- **Azure Key Vault** رازوں کے انتظام کے لیے (اختیاری)
- **ایپلیکیشن انسائٹس** اور لاگ اینالیٹکس مانیٹرنگ کے لیے (اختیاری)
- **ڈاکیومنٹ انٹیلیجنس** دستاویزات کی پروسیسنگ کے لیے
- **Bing سرچ API** حقیقی وقت کی معلومات کے لیے

### ڈپلائمنٹ موڈز

| موڈ | تفصیل | استعمال کا کیس | وسائل |
|------|-------------|----------|-----------|
| **کم سے کم** | کم لاگت والا بنیادی ڈپلائمنٹ | ترقی، ٹیسٹنگ | بنیادی SKUs، سنگل ریجن، کم صلاحیت |
| **معیاری** | پروڈکشن ورک لوڈز کے لیے متوازن ڈپلائمنٹ | پروڈکشن، معتدل پیمانہ | معیاری SKUs، ملٹی ریجن، معیاری صلاحیت |
| **پریمیم** | اعلی کارکردگی، انٹرپرائز گریڈ ڈپلائمنٹ | انٹرپرائز، اعلی پیمانہ | پریمیم SKUs، ملٹی ریجن، اعلی صلاحیت |

## 📋 ضروریات

1. **Azure CLI** انسٹال اور کنفیگر کیا ہوا
2. **فعال Azure سبسکرپشن** مناسب کوٹاز کے ساتھ
3. **مناسب اجازتیں** ہدف سبسکرپشن میں وسائل بنانے کے لیے
4. **وسائل کوٹاز**:
   - Azure OpenAI (ریجنل دستیابی چیک کریں)
   - کنٹینر ایپس (ریجن کے لحاظ سے مختلف)
   - AI سرچ (معیاری ٹائر یا اس سے زیادہ تجویز کردہ)

## 🚀 فوری ڈپلائمنٹ

### آپشن 1: Azure CLI استعمال کرتے ہوئے

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### آپشن 2: Azure پورٹل استعمال کرتے ہوئے

[![Azure پر ڈپلائمنٹ کریں](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### آپشن 3: Azure CLI براہ راست استعمال کرتے ہوئے

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ کنفیگریشن کے اختیارات

### ٹیمپلیٹ پیرامیٹرز

| پیرامیٹر | قسم | ڈیفالٹ | تفصیل |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | تمام وسائل کے ناموں کے لیے پیشوند |
| `location` | string | ریسورس گروپ کا مقام | پرائمری ڈپلائمنٹ ریجن |
| `secondaryLocation` | string | "westus2" | ملٹی ریجن ڈپلائمنٹ کے لیے سیکنڈری ریجن |
| `tertiaryLocation` | string | "francecentral" | ایمبیڈنگ ماڈل کے لیے ریجن |
| `environmentName` | string | "dev" | ماحول کی وضاحت (dev/staging/prod) |
| `deploymentMode` | string | "standard" | ڈپلائمنٹ کنفیگریشن (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | ملٹی ریجن ڈپلائمنٹ کو فعال کریں |
| `enableMonitoring` | bool | true | ایپلیکیشن انسائٹس اور لاگنگ کو فعال کریں |
| `enableSecurity` | bool | true | Key Vault اور بہتر سیکیورٹی کو فعال کریں |

### پیرامیٹرز کو حسب ضرورت بنانا

`azuredeploy.parameters.json` میں ترمیم کریں:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ آرکیٹیکچر کا جائزہ

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 ڈپلائمنٹ اسکرپٹ کا استعمال

`deploy.sh` اسکرپٹ ایک انٹرایکٹو ڈپلائمنٹ تجربہ فراہم کرتا ہے:

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### اسکرپٹ کی خصوصیات

- ✅ **ضروریات کی توثیق** (Azure CLI، لاگ ان اسٹیٹس، ٹیمپلیٹ فائلز)
- ✅ **ریسورس گروپ مینجمنٹ** (موجود نہ ہونے پر بناتا ہے)
- ✅ **ٹیمپلیٹ کی توثیق** ڈپلائمنٹ سے پہلے
- ✅ **پروگریس مانیٹرنگ** رنگین آؤٹ پٹ کے ساتھ
- ✅ **ڈپلائمنٹ آؤٹ پٹس** کی نمائش
- ✅ **ڈپلائمنٹ کے بعد رہنمائی**

## 📊 ڈپلائمنٹ کی نگرانی

### ڈپلائمنٹ اسٹیٹس چیک کریں

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### ڈپلائمنٹ آؤٹ پٹس

کامیاب ڈپلائمنٹ کے بعد، درج ذیل آؤٹ پٹس دستیاب ہیں:

- **فرنٹ اینڈ یو آر ایل**: ویب انٹرفیس کے لیے عوامی اینڈ پوائنٹ
- **روٹر یو آر ایل**: ایجنٹ روٹر کے لیے API اینڈ پوائنٹ
- **OpenAI اینڈ پوائنٹس**: پرائمری اور سیکنڈری OpenAI سروس اینڈ پوائنٹس
- **سرچ سروس**: Azure AI سرچ سروس اینڈ پوائنٹ
- **اسٹوریج اکاؤنٹ**: دستاویزات کے لیے اسٹوریج اکاؤنٹ کا نام
- **Key Vault**: Key Vault کا نام (اگر فعال ہے)
- **ایپلیکیشن انسائٹس**: مانیٹرنگ سروس کا نام (اگر فعال ہے)

## 🔧 ڈپلائمنٹ کے بعد کی کنفیگریشن

### 1. سرچ انڈیکس کو کنفیگر کریں

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### 2. ابتدائی ڈیٹا اپلوڈ کریں

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. ایجنٹ اینڈ پوائنٹس کو ٹیسٹ کریں

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. کنٹینر ایپس کو کنفیگر کریں

ARM ٹیمپلیٹ پلیس ہولڈر کنٹینر امیجز کو ڈپلائمنٹ کرتا ہے۔ اصل ایجنٹ کوڈ کو ڈپلائمنٹ کرنے کے لیے:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ مسائل کا حل

### عام مسائل

#### 1. Azure OpenAI کوٹا ختم ہو گیا

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. کنٹینر ایپس ڈپلائمنٹ ناکام ہو گیا

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. سرچ سروس کی ابتدائی ترتیب

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### ڈپلائمنٹ کی توثیق

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 سیکیورٹی کے تحفظات

### کلیدی انتظام
- تمام راز Azure Key Vault میں محفوظ ہیں (جب فعال ہو)
- کنٹینر ایپس مستند ہونے کے لیے مینیجڈ شناخت استعمال کرتی ہیں
- اسٹوریج اکاؤنٹس محفوظ ڈیفالٹس کے ساتھ (صرف HTTPS، کوئی عوامی بلاک رسائی نہیں)

### نیٹ ورک سیکیورٹی
- کنٹینر ایپس ممکنہ حد تک اندرونی نیٹ ورکنگ استعمال کرتی ہیں
- سرچ سروس پرائیویٹ اینڈ پوائنٹس آپشن کے ساتھ کنفیگر کی گئی ہے
- Cosmos DB کم سے کم ضروری اجازتوں کے ساتھ کنفیگر کی گئی ہے

### RBAC کنفیگریشن
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 لاگت کی اصلاح

### لاگت کے تخمینے (ماہانہ، USD)

| موڈ | OpenAI | کنٹینر ایپس | سرچ | اسٹوریج | کل تخمینہ |
|------|--------|----------------|--------|---------|------------|
| کم سے کم | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| معیاری | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| پریمیم | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### لاگت کی نگرانی

```bash
# Set up budget alerts
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 اپڈیٹس اور دیکھ بھال

### ٹیمپلیٹ اپڈیٹس
- ARM ٹیمپلیٹ فائلز کو ورژن کنٹرول کریں
- تبدیلیوں کو پہلے ترقیاتی ماحول میں ٹیسٹ کریں
- اپڈیٹس کے لیے انکریمنٹل ڈپلائمنٹ موڈ استعمال کریں

### وسائل کی اپڈیٹس
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### بیک اپ اور ریکوری
- Cosmos DB خودکار بیک اپ فعال ہے
- Key Vault نرم حذف فعال ہے
- کنٹینر ایپ ریویژنز رول بیک کے لیے برقرار ہیں

## 📞 سپورٹ

- **ٹیمپلیٹ مسائل**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure سپورٹ**: [Azure سپورٹ پورٹل](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **کمیونٹی**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ کیا آپ اپنا ملٹی ایجنٹ حل ڈپلائمنٹ کرنے کے لیے تیار ہیں؟**

شروع کریں: `./deploy.sh -g myResourceGroup`

---

**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔