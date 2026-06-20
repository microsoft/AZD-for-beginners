# ورشة عمل الذكاء الاصطناعي: جعل حلولك للذكاء الاصطناعي قابلة للنشر باستخدام AZD

**التنقل بين الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD For Beginners](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - تطوير يركز على الذكاء الاصطناعي
- **⬅️ السابق**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ التالي**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 الفصل التالي**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## نظرة عامة على الورشة

هذا المختبر العملي يوجه المطورين خلال عملية أخذ قالب ذكاء اصطناعي موجود ونشره باستخدام Azure Developer CLI (AZD). ستتعلم أنماطًا أساسية لنشر الذكاء الاصطناعي في بيئات الإنتاج باستخدام خدمات Microsoft Foundry.

> **ملاحظة التحقق (2026-03-25):** تمت مراجعة هذه الورشة مقابل `azd` `1.23.12`. إذا كان التثبيت المحلي لديك أقدم، قم بتحديث AZD قبل البدء حتى تتطابق عملية المصادقة والقالب وسير عمل النشر مع الخطوات أدناه.

**المدة:** 2-3 ساعات  
**المستوى:** متوسط  
**المتطلبات المسبقة:** معرفة أساسية بـ Azure، الإلمام بمفاهيم الذكاء الاصطناعي/التعلم الآلي

## 🎓 أهداف التعلم

بنهاية هذه الورشة، ستتمكن من:
- ✅ تحويل تطبيق ذكاء اصطناعي موجود لاستخدام قوالب AZD
- ✅ تكوين خدمات Microsoft Foundry باستخدام AZD
- ✅ تنفيذ إدارة آمنة للاعتمادات لخدمات الذكاء الاصطناعي
- ✅ نشر تطبيقات ذكاء اصطناعي جاهزة للإنتاج مع المراقبة
- ✅ حل مشكلات النشر الشائعة للذكاء الاصطناعي

## المتطلبات المسبقة

### الأدوات المطلوبة
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) مثبت
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) مثبت
- [Git](https://git-scm.com/) مثبت
- محرر كود (يفضل VS Code)

### موارد Azure
- اشتراك Azure مع صلاحية مساهم
- الوصول إلى خدمات Microsoft Foundry Models (أو القدرة على طلب الوصول)
- أذونات إنشاء مجموعة موارد

### المتطلبات المعرفية
- فهم أساسي لخدمات Azure
- الإلمام بواجهات سطر الأوامر
- مفاهيم أساسية في الذكاء الاصطناعي/التعلم الآلي (واجهات برمجة التطبيقات، النماذج، المطالبات)

## إعداد المختبر

### الخطوة 1: إعداد البيئة

1. **التحقق من تثبيت الأدوات:**
```bash
# تحقق من تثبيت AZD
azd version

# تحقق من Azure CLI
az --version

# تسجيل الدخول إلى Azure لسير عمل AZD
azd auth login

# سجّل الدخول إلى Azure CLI فقط إذا كنت تخطط لتشغيل أوامر az أثناء التشخيص
az login
```

إذا كنت تعمل عبر مستأجرين متعددين أو لم يتم اكتشاف اشتراكك تلقائيًا، أعد المحاولة باستخدام `azd auth login --tenant-id <tenant-id>`.

2. **استنساخ مستودع الورشة:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## الوحدة 1: فهم بنية AZD لتطبيقات الذكاء الاصطناعي

### تشريح قالب AZD لتطبيقات الذكاء الاصطناعي

استعرض الملفات الرئيسية في قالب AZD الجاهز للذكاء الاصطناعي:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **تمرين المختبر 1.1: استكشاف التكوين**

1. **افحص ملف azure.yaml:**
```bash
cat azure.yaml
```

**ما الذي تبحث عنه:**
- تعريفات الخدمات لمكونات الذكاء الاصطناعي
- تعيينات متغيرات البيئة
- تكوينات المضيف

2. **راجع البنية التحتية main.bicep:**
```bash
cat infra/main.bicep
```

**أنماط الذكاء الاصطناعي الرئيسية التي يجب تحديدها:**
- توفير خدمة Microsoft Foundry Models
- تكامل Azure AI Search
- إدارة المفاتيح الآمنة
- تكوينات أمان الشبكة

### **نقطة نقاش:** لماذا هذه الأنماط مهمة للذكاء الاصطناعي

- **تبعية الخدمات**: تطبيقات الذكاء الاصطناعي غالبًا ما تتطلب خدمات متعددة ومنسقة
- **الأمان**: يجب إدارة مفاتيح واجهات البرمجة والنقاط النهائية بشكل آمن
- **قابلية التوسع**: لأعباء عمل الذكاء الاصطناعي متطلبات توسع فريدة
- **إدارة التكاليف**: يمكن أن تكون خدمات الذكاء الاصطناعي مكلفة إذا لم تُضبط بشكل صحيح

## الوحدة 2: نشر تطبيق الذكاء الاصطناعي الأول لديك

### الخطوة 2.1: تهيئة البيئة

1. **إنشاء بيئة AZD جديدة:**
```bash
azd env new myai-workshop
```

2. **تعيين المعلمات المطلوبة:**
```bash
# حدد منطقة Azure المفضلة لديك
azd env set AZURE_LOCATION eastus

# اختياري: عيّن نموذج OpenAI محدد
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### الخطوة 2.2: نشر البنية التحتية والتطبيق

1. **النشر باستخدام AZD:**
```bash
azd up
```

**ما الذي يحدث أثناء `azd up`:**
- ✅ يقوم بتوفير خدمة Microsoft Foundry Models
- ✅ ينشئ خدمة Azure AI Search
- ✅ يهيئ App Service لتطبيق الويب
- ✅ يكوّن الشبكات والأمان
- ✅ ينشر شفرة التطبيق
- ✅ يضبط المراقبة والتسجيل

2. **راقب تقدم النشر** ودوّن الموارد التي يتم إنشاؤها.

### الخطوة 2.3: التحقق من النشر

1. **تحقق من الموارد المنشورة:**
```bash
azd show
```

2. **افتح التطبيق المنشور:**
```bash
azd show
```

افتح نقطة الوصول على الويب الموضحة في ناتج `azd show`.

3. **اختبر وظيفة الذكاء الاصطناعي:**
   - انتقل إلى تطبيق الويب
   - جرّب استعلامات نموذجية
   - تحقق من عمل استجابات الذكاء الاصطناعي

### **تمرين المختبر 2.1: ممارسة استكشاف الأخطاء وإصلاحها**

**السيناريو**: نجح النشر لكن الذكاء الاصطناعي لا يستجيب.

**المشكلات الشائعة للتحقق منها:**
1. **مفاتيح OpenAI API**: تحقق من تعيينها بشكل صحيح
2. **توفر النموذج**: تحقق ما إذا كانت منطقتك تدعم النموذج
3. **اتصال الشبكة**: تأكد من أن الخدمات يمكنها التواصل
4. **أذونات RBAC**: تحقق من أن التطبيق يمكنه الوصول إلى OpenAI

**أوامر التصحيح:**
```bash
# تحقق من متغيرات البيئة
azd env get-values

# عرض سجلات النشر
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# تحقق من حالة نشر OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## الوحدة 3: تخصيص تطبيقات الذكاء الاصطناعي حسب احتياجاتك

### الخطوة 3.1: تعديل تكوين الذكاء الاصطناعي

1. **تحديث نموذج OpenAI:**
```bash
# قم بالتبديل إلى نموذج مختلف (إذا كان متاحًا في منطقتك)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# أعد النشر باستخدام التكوين الجديد
azd deploy
```

2. **إضافة خدمات ذكاء اصطناعي إضافية:**

حرر `infra/main.bicep` لإضافة Document Intelligence:

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

**أفضل ممارسة**: تباين التكوينات بين التطوير والإنتاج.

1. **إنشاء بيئة إنتاج:**
```bash
azd env new myai-production
```

2. **تعيين معلمات خاصة بالإنتاج:**
```bash
# عادةً ما تستخدم بيئة الإنتاج SKUs أعلى
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# تمكين ميزات أمان إضافية
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **تمرين المختبر 3.1: تحسين التكاليف**

**التحدي**: قم بتكوين القالب لتقليل التكاليف أثناء التطوير.

**المهام:**
1. تحديد أي SKUs يمكن تعيينها إلى مستويات مجانية/أساسية
2. تكوين متغيرات البيئة لتقليل التكلفة إلى الحد الأدنى
3. النشر ومقارنة التكاليف مع تكوين الإنتاج

**تلميحات للحل:**
- استخدم الفئة F0 (مجانية) لخدمات Azure AI عندما يكون ذلك ممكنًا
- استخدم الفئة الأساسية لـ Search Service أثناء التطوير
- ضع في اعتبارك استخدام خطة Consumption لوظائف Functions

## الوحدة 4: الأمان وممارسات الإنتاج الأفضل

### الخطوة 4.1: إدارة الاعتمادات بشكل آمن

**التحدي الحالي**: العديد من تطبيقات الذكاء الاصطناعي تضع مفاتيح API مضمّنة في الشفرة أو تستخدم تخزينًا غير آمن.

**حل AZD**: Managed Identity + تكامل Key Vault.

1. **راجع تكوين الأمان في القالب الخاص بك:**
```bash
# تحقق من تكوين مخزن المفاتيح والهوية المُدارة
grep -r "keyVault\|managedIdentity" infra/
```

2. **تحقق من عمل Managed Identity:**
```bash
# تحقّق مما إذا كان لتطبيق الويب تكوين الهوية الصحيح
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### الخطوة 4.2: أمان الشبكة

1. **تمكين النقاط النهائية الخاصة** (إذا لم تكن مهيأة بالفعل):

أضف إلى قالب bicep الخاص بك:
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

### الخطوة 4.3: المراقبة وقابلية الملاحظة

1. **تكوين Application Insights:**
```bash
# يجب تكوين Application Insights تلقائيًا
# تحقق من التكوين:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **إعداد مراقبة خاصة بالذكاء الاصطناعي:**

أضف مقاييس مخصصة لعمليات الذكاء الاصطناعي:
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

### **تمرين المختبر 4.1: تدقيق الأمان**

**المهمة**: راجع نشرَك بالنسبة لممارسات الأمان المثلى.

**قائمة التحقق:**
- [ ] لا توجد أسرار مضمّنة في الشفرة أو التكوين
- [ ] استخدام Managed Identity للمصادقة بين الخدمات
- [ ] Key Vault يخزن التكوين الحساس
- [ ] الوصول إلى الشبكة مقيد بشكل مناسب
- [ ] تم تمكين المراقبة والتسجيل

## الوحدة 5: تحويل تطبيق الذكاء الاصطناعي الخاص بك

### الخطوة 5.1: ورقة تقييم

**قبل تحويل تطبيقك**، أجب عن هذه الأسئلة:

1. **معمارية التطبيق:**
   - ما خدمات الذكاء الاصطناعي التي يستخدمها تطبيقك؟
   - ما موارد الحوسبة التي يحتاجها؟
   - هل يتطلب قاعدة بيانات؟
   - ما التبعيات بين الخدمات؟

2. **متطلبات الأمان:**
   - ما البيانات الحساسة التي يتعامل معها تطبيقك؟
   - ما متطلبات الامتثال التي لديك؟
   - هل تحتاج إلى شبكات خاصة؟

3. **متطلبات التوسع:**
   - ما الحمل المتوقع لديك؟
   - هل تحتاج إلى توسيع تلقائي؟
   - هل هناك متطلبات إقليمية؟

### الخطوة 5.2: إنشاء قالب AZD الخاص بك

**اتبع هذا النمط لتحويل تطبيقك:**

1. **أنشئ البنية الأساسية:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# تهيئة قالب AZD
azd init --template minimal
```

2. **أنشئ azure.yaml:**
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

### **تمرين المختبر 5.1: تحدي إنشاء القالب**

**التحدي**: أنشئ قالب AZD لتطبيق ذكي لمعالجة المستندات.

**المتطلبات:**
- Microsoft Foundry Models لتحليل المحتوى
- Document Intelligence للتمييز البصري للنصوص (OCR)
- حساب تخزين لرفع المستندات
- Function App للمنطق المعالجي
- تطبيق ويب لواجهة المستخدم

**نقاط إضافية:**
- أضف معالجة أخطاء ملائمة
- تضمين تقدير للتكاليف
- إعداد لوحات مراقبة

## الوحدة 6: استكشاف المشكلات الشائعة

### مشكلات النشر الشائعة

#### المشكلة 1: تجاوز حصة خدمة OpenAI
**الأعراض:** يفشل النشر مع خطأ الحصة
**الحلول:**
```bash
# تحقق من الحصص الحالية
az cognitiveservices usage list --location eastus

# اطلب زيادة الحصة أو جرّب منطقة مختلفة
azd env set AZURE_LOCATION westus2
azd up
```

#### المشكلة 2: النموذج غير متاح في المنطقة
**الأعراض:** تفشل استجابات الذكاء الاصطناعي أو أخطاء نشر النموذج
**الحلول:**
```bash
# التحقق من توفر النموذج حسب المنطقة
az cognitiveservices model list --location eastus

# التحديث إلى نموذج متاح
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### المشكلة 3: مشكلات الأذونات
**الأعراض:** أخطاء 403 Forbidden عند استدعاء خدمات الذكاء الاصطناعي
**الحلول:**
```bash
# تحقق من تعيينات الأدوار
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# أضف الأدوار المفقودة
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### مشكلات الأداء

#### المشكلة 4: استجابات الذكاء الاصطناعي البطيئة
**خطوات التحقيق:**
1. تحقق من Application Insights لقياسات الأداء
2. راجع مقاييس خدمة OpenAI في بوابة Azure
3. تحقق من اتصال الشبكة والكمون

**الحلول:**
- نفّذ التخزين المؤقت للاستعلامات الشائعة
- استخدم نموذج OpenAI المناسب لحالة الاستخدام
- ضع في اعتبارك نسخًا مطابقة للقراءة لسيناريوهات الحمل العالي

### **تمرين المختبر 6.1: تحدي التصحيح**

**السيناريو**: نجح النشر، لكن التطبيق يعيد أخطاء 500.

**مهام التصحيح:**
1. تحقق من سجلات التطبيق
2. تحقق من اتصال الخدمات
3. اختبر المصادقة
4. راجع التكوين

**الأدوات المستخدمة:**
- `azd show` لعرض ملخص النشر
- بوابة Azure لسجلات الخدمات التفصيلية
- Application Insights Telemetry لتطبيقاتك

## الوحدة 7: المراقبة والتحسين

### الخطوة 7.1: إعداد مراقبة شاملة

1. **إنشاء لوحات معلومات مخصصة:**

انتقل إلى بوابة Azure وأنشئ لوحة تحتوي على:
- عدد طلبات OpenAI والكمون
- معدلات أخطاء التطبيق
- استخدام الموارد
- تتبع التكاليف

2. **إعداد تنبيهات:**
```bash
# تنبيه لارتفاع معدل الأخطاء
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### الخطوة 7.2: تحسين التكاليف

1. **تحليل التكاليف الحالية:**
```bash
# استخدم Azure CLI للحصول على بيانات التكلفة
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **تنفيذ ضوابط التكلفة:**
- إعداد تنبيهات الميزانية
- استخدام سياسات التوسع التلقائي
- تنفيذ التخزين المؤقت للطلبات
- مراقبة استخدام الرموز (tokens) لـ OpenAI

### **تمرين المختبر 7.1: تحسين الأداء**

**المهمة**: حسّن تطبيقك الذكي للأداء والتكلفة معًا.

**المقاييس التي يجب تحسينها:**
- تقليل متوسط زمن الاستجابة بنسبة 20%
- تقليل التكاليف الشهرية بنسبة 15%
- الحفاظ على توفر 99.9%

**استراتيجيات للتجربة:**
- تنفيذ تخزين مؤقت للاستجابات
- تحسين المطالبات لكفاءة الرموز
- استخدام SKUs الحوسبية المناسبة
- إعداد توسع تلقائي ملائم

## التحدي النهائي: التنفيذ من البداية للنهاية

### سيناريو التحدي

تم تكليفك بإنشاء روبوت محادثة مدعوم بالذكاء الاصطناعي لخدمة العملاء جاهز للإنتاج مع المتطلبات التالية:

**المتطلبات الوظيفية:**
- واجهة ويب لتفاعلات العملاء
- تكامل مع Microsoft Foundry Models للاستجابات
- إمكانية البحث في المستندات باستخدام Azure AI Search
- التكامل مع قاعدة بيانات العملاء الموجودة
- دعم متعدد اللغات

**المتطلبات غير الوظيفية:**
- التعامل مع 1000 مستخدم متزامن
- اتفاقية مستوى خدمة 99.9% uptime
- الامتثال لمعايير SOC 2
- التكلفة أقل من $500/شهر
- النشر إلى بيئات متعددة (dev، staging، prod)

### خطوات التنفيذ

1. **تصميم المعمارية**
2. **إنشاء قالب AZD**
3. **تنفيذ تدابير الأمان**
4. **إعداد المراقبة والتنبيه**
5. **إنشاء خطوط أنابيب النشر**
6. **توثيق الحل**

### معايير التقييم

- ✅ **الوظيفية**: هل يلبي جميع المتطلبات؟
- ✅ **الأمان**: هل تم تنفيذ ممارسات الأمان الأفضل؟
- ✅ **قابلية التوسع**: هل يمكنه التعامل مع الحمل؟
- ✅ **قابلية الصيانة**: هل الشفرة والبنية التحتية منظمة جيدا؟
- ✅ **التكلفة**: هل يبقى ضمن الميزانية؟

## موارد إضافية

### توثيق Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### قوالب عينة
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [دردشة Contoso](https://github.com/Azure-Samples/contoso-chat)

### موارد المجتمع
- [خادم Microsoft Foundry على Discord](https://discord.gg/microsoft-azure)
- [مستودع Azure Developer CLI على GitHub](https://github.com/Azure/azure-dev)
- [قوالب AZD الرائعة](https://azure.github.io/awesome-azd/)

## 🎓 شهادة الإتمام

تهانينا! لقد أكملت مختبر ورشة عمل الذكاء الاصطناعي. يجب أن تكون الآن قادرًا على:

- ✅ تحويل تطبيقات الذكاء الاصطناعي الحالية إلى قوالب AZD
- ✅ نشر تطبيقات الذكاء الاصطناعي الجاهزة للإنتاج
- ✅ تنفيذ أفضل ممارسات الأمان لأحمال عمل الذكاء الاصطناعي
- ✅ مراقبة وتحسين أداء تطبيقات الذكاء الاصطناعي
- ✅ استكشاف وإصلاح مشكلات النشر الشائعة

### الخطوات التالية
1. قم بتطبيق هذه الأنماط على مشاريع الذكاء الاصطناعي الخاصة بك
2. ساهم بإضافة القوالب إلى المجتمع
3. انضم إلى خادم Microsoft Foundry على Discord للحصول على دعم مستمر
4. استكشف مواضيع متقدمة مثل النشر عبر مناطق متعددة

---

**ملاحظات الورشة**: ساعدنا في تحسين هذه الورشة بمشاركة تجربتك في [قناة #Azure على Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**التنقل بين الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - تطوير يركز على الذكاء الاصطناعي
- **⬅️ السابق**: [نشر نماذج الذكاء الاصطناعي](ai-model-deployment.md)
- **➡️ التالي**: [أفضل ممارسات الذكاء الاصطناعي للإنتاج](production-ai-practices.md)
- **🚀 الفصل التالي**: [الفصل 3: التكوين](../chapter-03-configuration/configuration.md)

**هل تحتاج إلى مساعدة؟** انضم إلى مجتمعنا للحصول على الدعم والمناقشات حول نشر AZD وتطبيقات الذكاء الاصطناعي.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->