# مختبر ورشة عمل الذكاء الاصطناعي: جعل حلول الذكاء الاصطناعي الخاصة بك قابلة للنشر بواسطة AZD

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD For Beginners](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - تطوير يركز على الذكاء الاصطناعي
- **⬅️ السابق**: [نشر نماذج الذكاء الاصطناعي](ai-model-deployment.md)
- **➡️ التالي**: [أفضل ممارسات الذكاء الاصطناعي في الإنتاج](production-ai-practices.md)
- **🚀 الفصل التالي**: [الفصل 3: التهيئة](../chapter-03-configuration/configuration.md)

## لمحة عامة عن ورشة العمل

يقودك هذا المختبر العملي خطوة بخطوة خلال عملية أخذ قالب ذكاء اصطناعي موجود ونشره باستخدام Azure Developer CLI (AZD). ستتعلم أنماطًا أساسية لنشر الذكاء الاصطناعي في البيئات الإنتاجية باستخدام خدمات Microsoft Foundry.

> **ملاحظة التحقق (2026-03-25):** تمت مراجعة هذا المختبر مقابل `azd` `1.23.12`. إذا كان التثبيت المحلي لديك أقدم، حدّث AZD قبل البدء حتى تتطابق إجراءات المصادقة والقالب وسير العمل مع الخطوات أدناه.

**المدة:** 2-3 ساعات  
**المستوى:** متوسط  
**المتطلبات المسبقة:** معرفة أساسية بـ Azure، إلمام بمفاهيم الذكاء الاصطناعي/التعلم الآلي

## 🎓 أهداف التعلم

بنهاية هذا المختبر، ستكون قادرًا على:
- ✅ تحويل تطبيق ذكاء اصطناعي قائم لاستخدام قوالب AZD
- ✅ تكوين خدمات Microsoft Foundry باستخدام AZD
- ✅ تنفيذ إدارة آمنة لبيانات الاعتماد لخدمات الذكاء الاصطناعي
- ✅ نشر تطبيقات ذكاء اصطناعي جاهزة للإنتاج مع المراقبة
- ✅ استكشاف مشاكل نشر الذكاء الاصطناعي الشائعة وإصلاحها

## المتطلبات المسبقة

### الأدوات المطلوبة
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) مثبت
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) مثبت
- [Git](https://git-scm.com/) مثبت
- محرر شفرة (يوصى بـ VS Code)

### موارد Azure
- اشتراك Azure بصلاحيات مساهم
- الوصول إلى خدمات Microsoft Foundry Models (أو القدرة على طلب الوصول)
- أذونات إنشاء مجموعة موارد

### المعرفة المسبقة
- فهم أساسي لخدمات Azure
- إلمام بواجهات سطر الأوامر
- مفاهيم أساسية في الذكاء الاصطناعي/التعلم الآلي (واجهات برمجة التطبيقات، النماذج، المطاليب)

## إعداد المختبر

### الخطوة 1: إعداد البيئة

1. **تحقق من تثبيت الأدوات:**
```bash
# تحقق من تثبيت AZD
azd version

# تحقق من Azure CLI
az --version

# تسجيل الدخول إلى Azure لسير عمل AZD
azd auth login

# قم بتسجيل الدخول إلى Azure CLI فقط إذا كنت تخطط لتشغيل أوامر az أثناء التشخيص
az login
```

إذا كنت تعمل عبر مستأجرين متعددين أو لم يتم اكتشاف اشتراكك تلقائيًا، حاول مرة أخرى باستخدام `azd auth login --tenant-id <tenant-id>`.

2. **استنسخ مستودع الورشة:**
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
│       ├── search.bicep    # Cognitive Search setup
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

**ما الذي يجب البحث عنه:**
- تعريفات الخدمات للمكونات المتعلقة بالذكاء الاصطناعي
- تعيينات متغيرات البيئة
- تكوينات المضيف

2. **راجع البنية التحتية في main.bicep:**
```bash
cat infra/main.bicep
```

**أنماط الذكاء الاصطناعي الأساسية التي يجب تحديدها:**
- توفير خدمة Microsoft Foundry Models
- دمج Cognitive Search
- إدارة المفاتيح الآمنة
- تكوينات أمان الشبكة

### **نقطة نقاش:** لماذا تهم هذه الأنماط للذكاء الاصطناعي

- **اعتماديات الخدمات**: تطبيقات الذكاء الاصطناعي غالبًا ما تتطلب خدمات منسقة متعددة
- **الأمان**: مفاتيح واجهات برمجة التطبيقات ونقاط النهاية تحتاج لإدارة آمنة
- **قابلية التوسع**: أحمال عمل الذكاء الاصطناعي لها متطلبات مميزة في التوسيع
- **إدارة التكلفة**: يمكن أن تكون خدمات الذكاء الاصطناعي مكلفة إذا لم تُجهز بشكل مناسب

## الوحدة 2: نشر تطبيق الذكاء الاصطناعي الأول لديك

### الخطوة 2.1: تهيئة البيئة

1. **أنشئ بيئة AZD جديدة:**
```bash
azd env new myai-workshop
```

2. **اضبط المعلمات المطلوبة:**
```bash
# حدد منطقة Azure المفضلة لديك
azd env set AZURE_LOCATION eastus

# اختياري: حدد نموذج OpenAI معين
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### الخطوة 2.2: نشر البنية التحتية والتطبيق

1. **انشر باستخدام AZD:**
```bash
azd up
```

**ما الذي يحدث أثناء `azd up`:**
- ✅ يقوم بتوفير خدمة Microsoft Foundry Models
- ✅ ينشئ خدمة Cognitive Search
- ✅ يهيئ App Service لتطبيق الويب
- ✅ يضبط الشبكات والأمان
- ✅ ينشر كود التطبيق
- ✅ يهيئ المراقبة والتسجيل

2. **راقب تقدم النشر** ودوّن الموارد التي يتم إنشاؤها.

### الخطوة 2.3: التحقق من نشر التطبيق

1. **تحقق من الموارد المنشورة:**
```bash
azd show
```

2. **افتح التطبيق المنشور:**
```bash
azd show
```

افتح نقطة النهاية على الويب المعروضة في مخرجات `azd show`.

3. **اختبر وظائف الذكاء الاصطناعي:**
   - انتقل إلى تطبيق الويب
   - جرّب استعلامات عينة
   - تحقق من أن استجابات الذكاء الاصطناعي تعمل

### **تمرين المختبر 2.1: ممارسة استكشاف الأخطاء وإصلاحها**

**السيناريو**: نجح النشر لكن الذكاء الاصطناعي لا يستجيب.

**المشكلات الشائعة التي يجب التحقق منها:**
1. **مفاتيح OpenAI API**: تحقق من أنها مُعدة بشكل صحيح
2. **توفر النموذج**: تحقق ما إذا كانت منطقتك تدعم النموذج
3. **اتصال الشبكة**: تأكد أن الخدمات يمكنها الاتصال ببعضها
4. **أذونات RBAC**: تحقق أن التطبيق يمكنه الوصول إلى OpenAI

**أوامر التصحيح:**
```bash
# تحقق من متغيرات البيئة
azd env get-values

# عرض سجلات النشر
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# تحقق من حالة نشر أوبن إيه آي
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## الوحدة 3: تخصيص تطبيقات الذكاء الاصطناعي لتلبية احتياجاتك

### الخطوة 3.1: تعديل تكوين الذكاء الاصطناعي

1. **حدّث نموذج OpenAI:**
```bash
# قم بالتبديل إلى نموذج مختلف (إذا كان متاحًا في منطقتك)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# أعد النشر باستخدام التكوين الجديد
azd deploy
```

2. **أضف خدمات ذكاء اصطناعي إضافية:**

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

**أفضل ممارسة**: تكوينات مختلفة للتطوير مقابل الإنتاج.

1. **أنشئ بيئة إنتاج:**
```bash
azd env new myai-production
```

2. **اضبط معلمات خاصة بالإنتاج:**
```bash
# عادةً ما تستخدم بيئة الإنتاج وحدات حفظ المخزون ذات أرقام أعلى
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# تمكين ميزات أمان إضافية
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **تمرين المختبر 3.1: تحسين التكلفة**

**التحدي**: قم بتكوين القالب لبيئة تطوير منخفضة التكلفة.

**المهام:**
1. تحديد أي SKUs يمكن ضبطها على مستويات مجانية/أساسية
2. تكوين متغيرات البيئة للتكلفة الدنيا
3. النشر ومقارنة التكاليف مع تكوين الإنتاج

**تلميحات للحل:**
- استخدم مستوى F0 (مجاني) لخدمات Cognitive Services عندما يكون ممكنًا
- استخدم المستوى Basic لخدمة Search أثناء التطوير
- فكر في استخدام خطة Consumption لـ Functions

## الوحدة 4: الأمن وأفضل ممارسات الإنتاج

### الخطوة 4.1: إدارة بيانات الاعتماد الآمنة

**التحدي الحالي**: العديد من تطبيقات الذكاء الاصطناعي تخزن مفاتيح API بشكل ثابت أو تستخدم تخزينًا غير آمن.

**حل AZD**: الهوية المُدارة + تكامل Key Vault.

1. **راجع تكوين الأمان في قالبك:**
```bash
# ابحث عن تكوين مخزن المفاتيح والهوية المُدارة
grep -r "keyVault\|managedIdentity" infra/
```

2. **تحقق من أن الهوية المُدارة تعمل:**
```bash
# تحقق مما إذا كان تطبيق الويب يحتوي على التكوين الصحيح للهوية
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### الخطوة 4.2: أمان الشبكة

1. **تمكين نقاط نهاية خاصة** (إذا لم تكن مكوّنة بالفعل):

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

### الخطوة 4.3: المراقبة والقابلية للرؤية

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

**المهمة**: راجع نشرك بحثًا عن ممارسات الأمان الأفضل.

**قائمة المراجعة:**
- [ ] لا توجد أسرار مخزنة بشكل ثابت في الكود أو التكوين
- [ ] استخدام الهوية المُدارة للمصادقة بين الخدمات
- [ ] تخزين التكوين الحساس في Key Vault
- [ ] تقييد وصول الشبكة بشكل مناسب
- [ ] تم تمكين المراقبة والتسجيل

## الوحدة 5: تحويل تطبيق الذكاء الاصطناعي الخاص بك

### الخطوة 5.1: ورقة عمل التقييم

**قبل تحويل تطبيقك**، أجب عن هذه الأسئلة:

1. **بنية التطبيق:**
   - ما خدمات الذكاء الاصطناعي التي يستخدمها تطبيقك؟
   - ما موارد الحوسبة التي يحتاجها؟
   - هل يتطلب قاعدة بيانات؟
   - ما الاعتماديات بين الخدمات؟

2. **متطلبات الأمان:**
   - ما البيانات الحساسة التي يتعامل معها تطبيقك؟
   - ما متطلبات الالتزام التي لديك؟
   - هل تحتاج إلى شبكات خاصة؟

3. **متطلبات التوسيع:**
   - ما الحمولة المتوقعة لديك؟
   - هل تحتاج إلى التوسع التلقائي؟
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

3. **أنشئ قوالب البنية التحتية:**

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

**التحدي**: أنشئ قالب AZD لتطبيق ذكاء اصطناعي لمعالجة المستندات.

**المتطلبات:**
- Microsoft Foundry Models لتحليل المحتوى
- Document Intelligence للاصْطِلاح الضوئي للنصوص (OCR)
- Storage Account لرفع المستندات
- Function App لمنطق المعالجة
- Web app لواجهة المستخدم

**نقاط إضافية:**
- أضف معالجة أخطاء مناسبة
- تضمين تقدير للتكلفة
- إعداد لوحات مراقبة

## الوحدة 6: استكشاف المشكلات الشائعة وإصلاحها

### المشكلات الشائعة في النشر

#### المشكلة 1: تجاوز حصة خدمة OpenAI
**الأعراض:** يفشل النشر بخطأ حصة
**الحلول:**
```bash
# تحقق من الحصص الحالية
az cognitiveservices usage list --location eastus

# اطلب زيادة في الحصة أو جرّب منطقة مختلفة
azd env set AZURE_LOCATION westus2
azd up
```

#### المشكلة 2: النموذج غير متوفر في المنطقة
**الأعراض:** تفشل استجابات الذكاء الاصطناعي أو أخطاء نشر النموذج
**الحلول:**
```bash
# تحقق من توافر النموذج حسب المنطقة
az cognitiveservices model list --location eastus

# التحديث إلى نموذج متاح
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### المشكلة 3: مشاكل الأذونات
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
1. تحقق من Application Insights لمقاييس الأداء
2. راجع مقاييس خدمة OpenAI في بوابة Azure
3. تحقق من اتصال الشبكة والكمون

**الحلول:**
- تنفيذ التخزين المؤقت للاستعلامات الشائعة
- استخدام نموذج OpenAI المناسب لحالة الاستخدام
- النظر في مكررات القراءة لسيناريوهات الحمل العالي

### **تمرين المختبر 6.1: تحدي التصحيح**

**السيناريو**: نجح النشر، لكن التطبيق يعيد أخطاء 500.

**مهام التصحيح:**
1. تحقق من سجلات التطبيق
2. تحقق من اتصال الخدمات
3. اختبر المصادقة
4. راجع التكوين

**الأدوات المستخدمة:**
- `azd show` للحصول على نظرة عامة على النشر
- بوابة Azure لسجلات الخدمة التفصيلية
- Application Insights للتتبع والقياسات

## الوحدة 7: المراقبة والتحسين

### الخطوة 7.1: إعداد مراقبة شاملة

1. **إنشاء لوحات معلومات مخصصة:**

انتقل إلى بوابة Azure وأنشئ لوحة معلومات تحتوي على:
- عدد طلبات OpenAI والكمون
- معدلات أخطاء التطبيق
- استخدام الموارد
- تتبع التكاليف

2. **إعداد التنبيهات:**
```bash
# تنبيه بارتفاع معدل الأخطاء
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
# استخدم Azure CLI للحصول على بيانات التكلفة
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **تنفيذ ضوابط التكلفة:**
- إعداد تنبيهات ميزانية
- استخدام سياسات التوسيع التلقائي
- تنفيذ التخزين المؤقت للطلبات
- مراقبة استخدام الرموز المميزة لنماذج OpenAI

### **تمرين المختبر 7.1: تحسين الأداء**

**المهمة**: حسّن تطبيق الذكاء الاصطناعي لديك من حيث الأداء والتكلفة.

**المقاييس التي يجب تحسينها:**
- تقليل متوسط زمن الاستجابة بنسبة 20%
- تقليل التكاليف الشهرية بنسبة 15%
- الحفاظ على توفر 99.9%

**الاستراتيجيات التي يمكن تجربتها:**
- تنفيذ تخزين مؤقت للاستجابات
- تحسين المطاليب لكفاءة الرموز المميزة
- استخدام SKUs الحوسبية المناسبة
- إعداد التوسيع التلقائي الصحيح

## التحدي النهائي: التنفيذ الشامل

### سيناريو التحدي

مطُلوب منك إنشاء روبوت محادثة لخدمة العملاء جاهز للإنتاج ومدعوم بالذكاء الاصطناعي مع المتطلبات التالية:

**المتطلبات الوظيفية:**
- واجهة ويب لتفاعلات العملاء
- التكامل مع Microsoft Foundry Models للردود
- قدرة بحث عن المستندات باستخدام Cognitive Search
- التكامل مع قاعدة بيانات العملاء الموجودة
- دعم لغات متعددة

**المتطلبات غير الوظيفية:**
- معالجة 1000 مستخدم متزامن
- اتفاقية مستوى خدمة (SLA) بنسبة توفر 99.9%
- التوافق مع SOC 2
- تكلفة أقل من 500$/شهر
- النشر إلى بيئات متعددة (dev, staging, prod)

### خطوات التنفيذ

1. **تصميم البنية**
2. **إنشاء قالب AZD**
3. **تنفيذ إجراءات الأمان**
4. **إعداد المراقبة والتنبيهات**
5. **إنشاء خطوط نشر**
6. **توثيق الحل**

### معايير التقييم

- ✅ **الوظائف**: هل يلبي جميع المتطلبات؟
- ✅ **الأمان**: هل تم تطبيق أفضل الممارسات؟
- ✅ **قابلية التوسع**: هل يمكنه التعامل مع الحمل؟
- ✅ **قابليّة الصيانة**: هل الكود والبنية التحتية منظمان جيدًا؟
- ✅ **التكلفة**: هل يبقى ضمن الميزانية؟

## موارد إضافية

### توثيق Microsoft
- [توثيق Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [توثيق خدمة Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [توثيق Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### قوالب عيّنة
- [تطبيق دردشة نماذج Microsoft Foundry](https://github.com/Azure-Samples/azure-search-openai-demo)
- [البدء السريع لتطبيق دردشة OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [دردشة Contoso](https://github.com/Azure-Samples/contoso-chat)

### موارد المجتمع
- [خادم Microsoft Foundry في Discord](https://discord.gg/microsoft-azure)
- [مستودع GitHub لأداة Azure Developer CLI](https://github.com/Azure/azure-dev)
- [قوالب AZD الرائعة](https://azure.github.io/awesome-azd/)

## 🎓 شهادة الإتمام

تهانينا! لقد أكملت مختبر ورشة عمل الذكاء الاصطناعي. يجب أن تكون الآن قادرًا على:

- ✅ تحويل تطبيقات الذكاء الاصطناعي الحالية إلى قوالب AZD
- ✅ نشر تطبيقات ذكاء اصطناعي جاهزة للإنتاج
- ✅ تنفيذ أفضل ممارسات الأمان لأحمال عمل الذكاء الاصطناعي
- ✅ مراقبة وتحسين أداء تطبيقات الذكاء الاصطناعي
- ✅ استكشاف أخطاء النشر الشائعة وإصلاحها

### الخطوات التالية
1. طبق هذه الأنماط على مشاريع الذكاء الاصطناعي الخاصة بك
2. ساهم بإعادة القوالب إلى المجتمع
3. انضم إلى خادم Microsoft Foundry في Discord للحصول على دعم مستمر
4. استكشف موضوعات متقدمة مثل عمليات النشر متعددة المناطق

---

**ملاحظات الورشة**: ساعدنا على تحسين هذه الورشة بمشاركة تجربتك في [قناة #Azure على خادم Microsoft Foundry في Discord](https://discord.gg/microsoft-azure).

---

**التنقل بين الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - التطوير المرتكز على الذكاء الاصطناعي
- **⬅️ السابق**: [نشر نموذج الذكاء الاصطناعي](ai-model-deployment.md)
- **➡️ التالي**: [أفضل ممارسات الذكاء الاصطناعي للإنتاج](production-ai-practices.md)
- **🚀 الفصل التالي**: [الفصل 3: التكوين](../chapter-03-configuration/configuration.md)

**هل تحتاج مساعدة؟** انضم إلى مجتمعنا للحصول على الدعم والمناقشات حول نشر AZD والذكاء الاصطناعي.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**إخلاء المسؤولية**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر المعتمد. للمعلومات الحساسة، يوصى بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة تنشأ عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->