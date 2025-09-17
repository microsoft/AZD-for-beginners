<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T19:09:36+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "ar"
}
-->
# حل البيع بالتجزئة متعدد الوكلاء - نشر قالب ARM

**الفصل الخامس: حزمة نشر الإنتاج**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل ذو الصلة**: [الفصل الخامس: حلول الذكاء الاصطناعي متعددة الوكلاء](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 دليل السيناريو**: [التنفيذ الكامل](../retail-scenario.md)
- **🎯 النشر السريع**: [النشر بنقرة واحدة](../../../../examples/retail-multiagent-arm-template)

يحتوي هذا الدليل على قالب كامل لـ Azure Resource Manager (ARM) لنشر حل دعم العملاء متعدد الوكلاء في البيع بالتجزئة، مما يوفر البنية التحتية كرمز لكامل الهيكلية.

## 🎯 ما الذي يتم نشره

### البنية التحتية الأساسية
- **خدمات Azure OpenAI** (متعددة المناطق لضمان التوافر العالي)
  - المنطقة الأساسية: GPT-4o لوكيل العملاء
  - المنطقة الثانوية: GPT-4o-mini لوكيل المخزون  
  - المنطقة الثالثة: نموذج تضمين النصوص
  - منطقة التقييم: نموذج GPT-4o للتقييم
- **Azure AI Search** مع قدرات البحث المتجه
- **حساب تخزين Azure** مع حاويات blob للوثائق والتحميلات
- **بيئة تطبيقات الحاويات في Azure** مع التوسع التلقائي
- **تطبيقات الحاويات** لتوجيه الوكلاء والواجهة الأمامية
- **Azure Cosmos DB** لتخزين سجل المحادثات
- **Azure Key Vault** لإدارة الأسرار (اختياري)
- **Application Insights** وLog Analytics للمراقبة (اختياري)
- **Document Intelligence** لمعالجة الوثائق
- **Bing Search API** للحصول على المعلومات في الوقت الفعلي

### أوضاع النشر

| الوضع | الوصف | الحالة | الموارد |
|------|-------------|----------|-----------|
| **الحد الأدنى** | نشر أساسي بتكلفة منخفضة | التطوير، الاختبار | SKUs أساسية، منطقة واحدة، سعة منخفضة |
| **القياسي** | نشر متوازن لأعباء العمل الإنتاجية | الإنتاج، نطاق متوسط | SKUs قياسية، متعددة المناطق، سعة قياسية |
| **المتميز** | نشر عالي الأداء على مستوى المؤسسات | المؤسسات، نطاق واسع | SKUs متميزة، متعددة المناطق، سعة عالية |

## 📋 المتطلبات الأساسية

1. **Azure CLI** مثبت ومُعد
2. **اشتراك Azure نشط** مع حصص كافية
3. **أذونات مناسبة** لإنشاء الموارد في الاشتراك المستهدف
4. **حصص الموارد** لـ:
   - Azure OpenAI (تحقق من التوافر الإقليمي)
   - تطبيقات الحاويات (تختلف حسب المنطقة)
   - AI Search (يوصى بالطبقة القياسية أو أعلى)

## 🚀 النشر السريع

### الخيار الأول: باستخدام Azure CLI

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

### الخيار الثاني: باستخدام بوابة Azure

[![النشر إلى Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### الخيار الثالث: باستخدام Azure CLI مباشرة

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ خيارات التكوين

### معلمات القالب

| المعلمة | النوع | الافتراضي | الوصف |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | بادئة لجميع أسماء الموارد |
| `location` | string | موقع مجموعة الموارد | منطقة النشر الأساسية |
| `secondaryLocation` | string | "westus2" | منطقة ثانوية للنشر متعدد المناطق |
| `tertiaryLocation` | string | "francecentral" | منطقة لنموذج التضمين |
| `environmentName` | string | "dev" | تسمية البيئة (dev/staging/prod) |
| `deploymentMode` | string | "standard" | تكوين النشر (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | تمكين النشر متعدد المناطق |
| `enableMonitoring` | bool | true | تمكين Application Insights والتسجيل |
| `enableSecurity` | bool | true | تمكين Key Vault وتعزيز الأمان |

### تخصيص المعلمات

قم بتحرير `azuredeploy.parameters.json`:

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

## 🏗️ نظرة عامة على الهيكلية

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

## 📖 استخدام سكربت النشر

يوفر سكربت `deploy.sh` تجربة نشر تفاعلية:

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

### ميزات السكربت

- ✅ **التحقق من المتطلبات الأساسية** (Azure CLI، حالة تسجيل الدخول، ملفات القالب)
- ✅ **إدارة مجموعة الموارد** (إنشاء إذا لم تكن موجودة)
- ✅ **التحقق من القالب** قبل النشر
- ✅ **مراقبة التقدم** مع إخراج ملون
- ✅ **عرض نتائج النشر**
- ✅ **إرشادات ما بعد النشر**

## 📊 مراقبة النشر

### التحقق من حالة النشر

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

### نتائج النشر

بعد نجاح النشر، تتوفر النتائج التالية:

- **عنوان URL للواجهة الأمامية**: نقطة النهاية العامة للواجهة الويب
- **عنوان URL للتوجيه**: نقطة النهاية API لتوجيه الوكلاء
- **نقاط نهاية OpenAI**: نقاط نهاية خدمة OpenAI الأساسية والثانوية
- **خدمة البحث**: نقطة نهاية خدمة Azure AI Search
- **حساب التخزين**: اسم حساب التخزين للوثائق
- **Key Vault**: اسم Key Vault (إذا تم تمكينه)
- **Application Insights**: اسم خدمة المراقبة (إذا تم تمكينها)

## 🔧 إعدادات ما بعد النشر

### 1. إعداد فهرس البحث

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

### 2. تحميل البيانات الأولية

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. اختبار نقاط نهاية الوكلاء

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. إعداد تطبيقات الحاويات

يقوم قالب ARM بنشر صور الحاويات الافتراضية. لنشر كود الوكلاء الفعلي:

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

## 🛠️ استكشاف الأخطاء وإصلاحها

### المشكلات الشائعة

#### 1. تجاوز حصة Azure OpenAI

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. فشل نشر تطبيقات الحاويات

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

#### 3. تهيئة خدمة البحث

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### التحقق من النشر

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

## 🔐 اعتبارات الأمان

### إدارة المفاتيح
- يتم تخزين جميع الأسرار في Azure Key Vault (عند التمكين)
- تستخدم تطبيقات الحاويات الهوية المُدارة للمصادقة
- حسابات التخزين لديها إعدادات افتراضية آمنة (HTTPS فقط، لا يوجد وصول عام للـ blob)

### أمان الشبكة
- تستخدم تطبيقات الحاويات الشبكات الداخلية قدر الإمكان
- تم إعداد خدمة البحث مع خيار نقاط النهاية الخاصة
- تم إعداد Cosmos DB بأقل الأذونات اللازمة

### إعداد RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 تحسين التكلفة

### تقديرات التكلفة (شهريًا، بالدولار الأمريكي)

| الوضع | OpenAI | تطبيقات الحاويات | البحث | التخزين | الإجمالي |
|------|--------|----------------|--------|---------|------------|
| الحد الأدنى | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| القياسي | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| المتميز | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### مراقبة التكلفة

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

## 🔄 التحديثات والصيانة

### تحديثات القالب
- التحكم في إصدار ملفات قالب ARM
- اختبار التغييرات في بيئة التطوير أولاً
- استخدام وضع النشر التدريجي للتحديثات

### تحديثات الموارد
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### النسخ الاحتياطي والاسترداد
- تم تمكين النسخ الاحتياطي التلقائي لـ Cosmos DB
- تم تمكين الحذف الناعم لـ Key Vault
- يتم الاحتفاظ بمراجعات تطبيقات الحاويات للتراجع

## 📞 الدعم

- **مشكلات القالب**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **دعم Azure**: [بوابة دعم Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **المجتمع**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ جاهز لنشر الحل متعدد الوكلاء الخاص بك؟**

ابدأ بـ: `./deploy.sh -g myResourceGroup`

---

**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو معلومات غير دقيقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الموثوق. للحصول على معلومات حاسمة، يُوصى بالاستعانة بترجمة بشرية احترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة ناتجة عن استخدام هذه الترجمة.