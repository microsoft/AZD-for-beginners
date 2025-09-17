<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "668bc93b35c9249e52245a0b037b6011",
  "translation_date": "2025-09-12T19:17:50+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "ar"
}
-->
# ورشة عمل الذكاء الاصطناعي: جعل حلول الذكاء الاصطناعي قابلة للنشر باستخدام AZD

**السابق:** [نشر نموذج الذكاء الاصطناعي](ai-model-deployment.md) | **التالي:** [ممارسات الذكاء الاصطناعي في الإنتاج](production-ai-practices.md)

## نظرة عامة على الورشة

توجه هذه الورشة العملية المطورين خلال عملية تحويل تطبيق ذكاء اصطناعي موجود إلى تطبيق قابل للنشر باستخدام Azure Developer CLI (AZD). ستتعلم أنماطًا أساسية لنشر الذكاء الاصطناعي في بيئة الإنتاج باستخدام خدمات Azure AI Foundry.

**المدة:** 2-3 ساعات  
**المستوى:** متوسط  
**المتطلبات الأساسية:** معرفة أساسية بـ Azure، الإلمام بمفاهيم الذكاء الاصطناعي/تعلم الآلة

## 🎓 أهداف التعلم

بنهاية هذه الورشة، ستكون قادرًا على:
- ✅ تحويل تطبيق ذكاء اصطناعي موجود لاستخدام قوالب AZD
- ✅ إعداد خدمات Azure AI Foundry باستخدام AZD
- ✅ تنفيذ إدارة آمنة للاعتمادات لخدمات الذكاء الاصطناعي
- ✅ نشر تطبيقات ذكاء اصطناعي جاهزة للإنتاج مع مراقبة
- ✅ حل المشكلات الشائعة في نشر الذكاء الاصطناعي

## المتطلبات الأساسية

### الأدوات المطلوبة
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) مثبت
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) مثبت
- [Git](https://git-scm.com/) مثبت
- محرر أكواد (يوصى بـ VS Code)

### موارد Azure
- اشتراك Azure مع صلاحيات المساهم
- الوصول إلى خدمات Azure OpenAI (أو القدرة على طلب الوصول)
- صلاحيات إنشاء مجموعات الموارد

### المعرفة المطلوبة
- فهم أساسي لخدمات Azure
- الإلمام بواجهات سطر الأوامر
- مفاهيم أساسية في الذكاء الاصطناعي/تعلم الآلة (APIs، النماذج، المطالبات)

## إعداد الورشة

### الخطوة 1: إعداد البيئة

1. **التحقق من تثبيت الأدوات:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **استنساخ مستودع الورشة:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## الوحدة 1: فهم هيكل AZD لتطبيقات الذكاء الاصطناعي

### تشريح قالب AZD جاهز للذكاء الاصطناعي

استكشاف الملفات الرئيسية في قالب AZD جاهز للذكاء الاصطناعي:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **تمرين عملي 1.1: استكشاف التكوين**

1. **فحص ملف azure.yaml:**
```bash
cat azure.yaml
```

**ما يجب البحث عنه:**
- تعريفات الخدمات لمكونات الذكاء الاصطناعي
- تعيين متغيرات البيئة
- إعدادات المضيف

2. **مراجعة البنية التحتية main.bicep:**
```bash
cat infra/main.bicep
```

**أنماط الذكاء الاصطناعي الرئيسية التي يجب تحديدها:**
- توفير خدمة Azure OpenAI
- تكامل البحث المعرفي
- إدارة المفاتيح بشكل آمن
- إعدادات أمان الشبكة

### **نقطة نقاش:** لماذا هذه الأنماط مهمة للذكاء الاصطناعي

- **اعتماد الخدمات**: تطبيقات الذكاء الاصطناعي غالبًا ما تتطلب خدمات متعددة منسقة
- **الأمان**: تحتاج مفاتيح API ونقاط النهاية إلى إدارة آمنة
- **القابلية للتوسع**: أعباء العمل الخاصة بالذكاء الاصطناعي لها متطلبات توسع فريدة
- **إدارة التكلفة**: يمكن أن تكون خدمات الذكاء الاصطناعي مكلفة إذا لم يتم إعدادها بشكل صحيح

## الوحدة 2: نشر أول تطبيق ذكاء اصطناعي

### الخطوة 2.1: تهيئة البيئة

1. **إنشاء بيئة AZD جديدة:**
```bash
azd env new myai-workshop
```

2. **تعيين المعلمات المطلوبة:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### الخطوة 2.2: نشر البنية التحتية والتطبيق

1. **النشر باستخدام AZD:**
```bash
azd up
```

**ما يحدث أثناء `azd up`:**
- ✅ توفير خدمة Azure OpenAI
- ✅ إنشاء خدمة البحث المعرفي
- ✅ إعداد خدمة التطبيقات لتطبيق الويب
- ✅ تكوين الشبكات والأمان
- ✅ نشر كود التطبيق
- ✅ إعداد المراقبة وتسجيل الأحداث

2. **مراقبة تقدم النشر** وتحديد الموارد التي يتم إنشاؤها.

### الخطوة 2.3: التحقق من النشر

1. **التحقق من الموارد المنشورة:**
```bash
azd show
```

2. **فتح التطبيق المنشور:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **اختبار وظائف الذكاء الاصطناعي:**
   - التنقل إلى تطبيق الويب
   - تجربة استفسارات نموذجية
   - التحقق من عمل استجابات الذكاء الاصطناعي

### **تمرين عملي 2.1: ممارسة استكشاف الأخطاء وإصلاحها**

**السيناريو**: نجح النشر ولكن الذكاء الاصطناعي لا يستجيب.

**المشكلات الشائعة التي يجب التحقق منها:**
1. **مفاتيح API الخاصة بـ OpenAI**: التحقق من إعدادها بشكل صحيح
2. **توفر النموذج**: التحقق من دعم منطقتك للنموذج
3. **اتصال الشبكة**: التأكد من قدرة الخدمات على التواصل
4. **صلاحيات RBAC**: التحقق من قدرة التطبيق على الوصول إلى OpenAI

**أوامر التصحيح:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## الوحدة 3: تخصيص تطبيقات الذكاء الاصطناعي لتلبية احتياجاتك

### الخطوة 3.1: تعديل تكوين الذكاء الاصطناعي

1. **تحديث نموذج OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **إضافة خدمات ذكاء اصطناعي إضافية:**

تعديل `infra/main.bicep` لإضافة Document Intelligence:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### الخطوة 3.2: تكوينات خاصة بالبيئة

**أفضل ممارسة**: تكوينات مختلفة للتطوير مقابل الإنتاج.

1. **إنشاء بيئة إنتاج:**
```bash
azd env new myai-production
```

2. **تعيين معلمات خاصة بالإنتاج:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **تمرين عملي 3.1: تحسين التكلفة**

**التحدي**: تكوين القالب لتطوير منخفض التكلفة.

**المهام:**
1. تحديد أي SKUs يمكن تعيينها إلى مستويات مجانية/أساسية
2. تكوين متغيرات البيئة لتقليل التكلفة
3. النشر ومقارنة التكاليف مع تكوين الإنتاج

**تلميحات الحل:**
- استخدام مستوى F0 (مجاني) لخدمات الإدراك المعرفي عند الإمكان
- استخدام المستوى الأساسي لخدمة البحث في التطوير
- النظر في استخدام خطة الاستهلاك لوظائف التطبيقات

## الوحدة 4: أفضل ممارسات الأمان والإنتاج

### الخطوة 4.1: إدارة الاعتمادات بشكل آمن

**التحدي الحالي**: العديد من تطبيقات الذكاء الاصطناعي تقوم بتضمين مفاتيح API أو تستخدم تخزينًا غير آمن.

**حل AZD**: الهوية المدارة + تكامل Key Vault.

1. **مراجعة تكوين الأمان في القالب الخاص بك:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **التحقق من عمل الهوية المدارة:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### الخطوة 4.2: أمان الشبكة

1. **تمكين نقاط النهاية الخاصة** (إذا لم يتم تكوينها بالفعل):

إضافة إلى قالب bicep الخاص بك:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### الخطوة 4.3: المراقبة والرصد

1. **تكوين Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **إعداد مراقبة خاصة بالذكاء الاصطناعي:**

إضافة مقاييس مخصصة لعمليات الذكاء الاصطناعي:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **تمرين عملي 4.1: تدقيق الأمان**

**المهمة**: مراجعة النشر الخاص بك لأفضل ممارسات الأمان.

**قائمة التحقق:**
- [ ] لا توجد أسرار مضمنة في الكود أو التكوين
- [ ] استخدام الهوية المدارة للمصادقة بين الخدمات
- [ ] تخزين التكوين الحساس في Key Vault
- [ ] تقييد الوصول إلى الشبكة بشكل صحيح
- [ ] تمكين المراقبة وتسجيل الأحداث

## الوحدة 5: تحويل تطبيق الذكاء الاصطناعي الخاص بك

### الخطوة 5.1: ورقة تقييم

**قبل تحويل تطبيقك**، أجب عن هذه الأسئلة:

1. **هيكل التطبيق:**
   - ما هي خدمات الذكاء الاصطناعي التي يستخدمها تطبيقك؟
   - ما هي موارد الحوسبة التي يحتاجها؟
   - هل يحتاج إلى قاعدة بيانات؟
   - ما هي الاعتمادات بين الخدمات؟

2. **متطلبات الأمان:**
   - ما هي البيانات الحساسة التي يتعامل معها تطبيقك؟
   - ما هي متطلبات الامتثال لديك؟
   - هل تحتاج إلى شبكة خاصة؟

3. **متطلبات التوسع:**
   - ما هو الحمل المتوقع؟
   - هل تحتاج إلى التوسع التلقائي؟
   - هل هناك متطلبات إقليمية؟

### الخطوة 5.2: إنشاء قالب AZD الخاص بك

**اتبع هذا النمط لتحويل تطبيقك:**

1. **إنشاء الهيكل الأساسي:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **إنشاء azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **إنشاء قوالب البنية التحتية:**

**infra/main.bicep** - القالب الرئيسي:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - وحدة OpenAI:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **تمرين عملي 5.1: تحدي إنشاء القالب**

**التحدي**: إنشاء قالب AZD لتطبيق ذكاء اصطناعي لمعالجة المستندات.

**المتطلبات:**
- Azure OpenAI لتحليل المحتوى
- Document Intelligence لـ OCR
- حساب تخزين لتحميل المستندات
- تطبيق وظائف للمنطق المعالج
- تطبيق ويب لواجهة المستخدم

**نقاط إضافية:**
- إضافة معالجة الأخطاء بشكل صحيح
- تضمين تقدير التكلفة
- إعداد لوحات مراقبة

## الوحدة 6: استكشاف المشكلات الشائعة وإصلاحها

### المشكلات الشائعة في النشر

#### المشكلة 1: تجاوز حصة خدمة OpenAI
**الأعراض:** فشل النشر مع خطأ الحصة
**الحلول:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### المشكلة 2: النموذج غير متوفر في المنطقة
**الأعراض:** فشل استجابات الذكاء الاصطناعي أو أخطاء نشر النموذج
**الحلول:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### المشكلة 3: مشكلات الصلاحيات
**الأعراض:** أخطاء 403 Forbidden عند استدعاء خدمات الذكاء الاصطناعي
**الحلول:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### مشكلات الأداء

#### المشكلة 4: استجابات الذكاء الاصطناعي البطيئة
**خطوات التحقيق:**
1. التحقق من مقاييس الأداء في Application Insights
2. مراجعة مقاييس خدمة OpenAI في بوابة Azure
3. التحقق من اتصال الشبكة والكمون

**الحلول:**
- تنفيذ التخزين المؤقت للاستفسارات الشائعة
- استخدام نموذج OpenAI المناسب لحالة الاستخدام الخاصة بك
- النظر في النسخ المتماثلة للقراءة لسيناريوهات الحمل العالي

### **تمرين عملي 6.1: تحدي التصحيح**

**السيناريو**: نجح النشر، لكن التطبيق يعيد أخطاء 500.

**مهام التصحيح:**
1. التحقق من سجلات التطبيق
2. التحقق من اتصال الخدمات
3. اختبار المصادقة
4. مراجعة التكوين

**الأدوات التي يجب استخدامها:**
- `azd show` للحصول على نظرة عامة على النشر
- بوابة Azure للحصول على سجلات الخدمات التفصيلية
- Application Insights للحصول على بيانات التتبع الخاصة بالتطبيق

## الوحدة 7: المراقبة والتحسين

### الخطوة 7.1: إعداد مراقبة شاملة

1. **إنشاء لوحات مخصصة:**

التنقل إلى بوابة Azure وإنشاء لوحة تحتوي على:
- عدد طلبات OpenAI والكمون
- معدلات أخطاء التطبيق
- استخدام الموارد
- تتبع التكلفة

2. **إعداد التنبيهات:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### الخطوة 7.2: تحسين التكلفة

1. **تحليل التكاليف الحالية:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **تنفيذ ضوابط التكلفة:**
- إعداد تنبيهات الميزانية
- استخدام سياسات التوسع التلقائي
- تنفيذ التخزين المؤقت للطلبات
- مراقبة استخدام الرموز لـ OpenAI

### **تمرين عملي 7.1: تحسين الأداء**

**المهمة**: تحسين تطبيق الذكاء الاصطناعي من حيث الأداء والتكلفة.

**المقاييس التي يجب تحسينها:**
- تقليل متوسط وقت الاستجابة بنسبة 20%
- تقليل التكاليف الشهرية بنسبة 15%
- الحفاظ على وقت تشغيل بنسبة 99.9%

**استراتيجيات التجربة:**
- تنفيذ التخزين المؤقت للاستجابات
- تحسين المطالبات لكفاءة الرموز
- استخدام SKUs المناسبة للحوسبة
- إعداد التوسع التلقائي بشكل صحيح

## التحدي النهائي: التنفيذ من البداية إلى النهاية

### سيناريو التحدي

مطلوب منك إنشاء روبوت دردشة لخدمة العملاء مدعوم بالذكاء الاصطناعي جاهز للإنتاج مع المتطلبات التالية:

**المتطلبات الوظيفية:**
- واجهة ويب لتفاعلات العملاء
- تكامل مع Azure OpenAI للاستجابات
- قدرة البحث في المستندات باستخدام البحث المعرفي
- تكامل مع قاعدة بيانات العملاء الحالية
- دعم متعدد اللغات

**المتطلبات غير الوظيفية:**
- التعامل مع 1000 مستخدم متزامن
- SLA وقت تشغيل بنسبة 99.9%
- الامتثال لـ SOC 2
- تكلفة أقل من $500 شهريًا
- النشر في بيئات متعددة (التطوير، الاختبار، الإنتاج)

### خطوات التنفيذ

1. **تصميم الهيكل**
2. **إنشاء قالب AZD**
3. **تنفيذ تدابير الأمان**
4. **إعداد المراقبة والتنبيهات**
5. **إنشاء خطوط نشر**
6. **توثيق الحل**

### معايير التقييم

- ✅ **الوظائف**: هل تلبي جميع المتطلبات؟
- ✅ **الأمان**: هل تم تنفيذ أفضل الممارسات؟
- ✅ **القابلية للتوسع**: هل يمكنها التعامل مع الحمل؟
- ✅ **سهولة الصيانة**: هل الكود والبنية التحتية منظمة بشكل جيد؟
- ✅ **التكلفة**: هل تبقى ضمن الميزانية؟

## موارد إضافية

### وثائق Microsoft
- [وثائق Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [وثائق خدمة Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [وثائق Azure AI Foundry](https://learn.microsoft.com/azure/ai-studio/)

### قوالب نموذجية
- [تطبيق دردشة Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [البدء السريع لتطبيق دردشة OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [دردشة Contoso](https://github.com/Azure-Samples/contoso-chat)

### موارد المجتمع
- [Discord الخاص بـ Azure AI Foundry](https://discord.gg/microsoft-azure)
- [GitHub الخاص بـ Azure Developer CLI](https://github.com/Azure/azure-dev)
- [قوالب AZD الرائعة](https://azure.github.io/awesome-azd/)

## 🎓 شهادة الإكمال

تهانينا! لقد أكملت ورشة عمل الذكاء الاصطناعي. يجب أن تكون الآن قادرًا على:

- ✅ تحويل تطبيقات الذكاء الاصطناعي الحالية إلى قوالب AZD
- ✅ نشر تطبيقات ذكاء اصطناعي جاهزة للإنتاج
- ✅ تنفيذ أفضل ممارسات الأمان لأعباء العمل الخاصة بالذكاء الاصطناعي  
- ✅ مراقبة وتحسين أداء تطبيقات الذكاء الاصطناعي  
- ✅ حل المشكلات الشائعة في النشر  

### الخطوات التالية  
1. قم بتطبيق هذه الأنماط على مشاريع الذكاء الاصطناعي الخاصة بك  
2. ساهم بقوالب تعود بالنفع على المجتمع  
3. انضم إلى Discord الخاص بـ Azure AI Foundry للحصول على دعم مستمر  
4. استكشف مواضيع متقدمة مثل النشر في مناطق متعددة  

---

**ملاحظات حول الورشة**: ساعدنا في تحسين هذه الورشة من خلال مشاركة تجربتك في [قناة Azure على Discord الخاص بـ Azure AI Foundry](https://discord.gg/microsoft-azure).  

---

**السابق:** [نشر نموذج الذكاء الاصطناعي](ai-model-deployment.md) | **التالي:** [ممارسات الذكاء الاصطناعي في الإنتاج](production-ai-practices.md)  

**بحاجة إلى مساعدة؟** انضم إلى مجتمعنا للحصول على الدعم والمناقشات حول AZD ونشر الذكاء الاصطناعي.  

---

**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو معلومات غير دقيقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الموثوق. للحصول على معلومات حاسمة، يُوصى بالاستعانة بترجمة بشرية احترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة ناتجة عن استخدام هذه الترجمة.