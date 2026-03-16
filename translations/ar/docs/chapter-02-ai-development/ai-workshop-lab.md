# مختبر ورشة عمل الذكاء الاصطناعي: جعل حلول الذكاء الاصطناعي الخاصة بك قابلة للنشر باستخدام AZD

**التنقل بين الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - تطوير يركز على الذكاء الاصطناعي
- **⬅️ السابق**: [نشر نماذج الذكاء الاصطناعي](ai-model-deployment.md)
- **➡️ التالي**: [أفضل ممارسات الذكاء الاصطناعي للإنتاج](production-ai-practices.md)
- **🚀 الفصل التالي**: [الفصل 3: التكوين](../chapter-03-configuration/configuration.md)

## نظرة عامة على ورشة العمل

يرشدك هذا المختبر العملي خلال عملية أخذ قالب ذكاء اصطناعي موجود ونشره باستخدام Azure Developer CLI (AZD). ستتعلم أنماطًا أساسية لنشر الذكاء الاصطناعي في بيئات الإنتاج باستخدام خدمات Microsoft Foundry.

**المدة:** 2-3 ساعات  
**المستوى:** متوسط  
**المتطلبات المسبقة:** معرفة أساسية بـ Azure، وإلمام بمفاهيم AI/ML

## 🎓 أهداف التعلم

بحلول نهاية هذه الورشة، ستتمكن من:
- ✅ تحويل تطبيق ذكاء اصطناعي موجود لاستخدام قوالب AZD
- ✅ تكوين خدمات Microsoft Foundry باستخدام AZD
- ✅ تنفيذ إدارة آمنة للاعتمادات لخدمات الذكاء الاصطناعي
- ✅ نشر تطبيقات ذكاء اصطناعي جاهزة للإنتاج مع المراقبة
- ✅ استكشاف مشكلات النشر الشائعة وإصلاحها

## المتطلبات المسبقة

### الأدوات المطلوبة
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) مثبت
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) مثبت
- [Git](https://git-scm.com/) مثبت
- محرر أكواد (يوصى بـ VS Code)

### موارد Azure
- اشتراك Azure بصلاحية مساهم
- الوصول إلى خدمات Microsoft Foundry Models (أو القدرة على طلب الوصول)
- أذونات إنشاء مجموعة موارد

### المتطلبات المعرفية
- فهم أساسي لخدمات Azure
- الإلمام بواجهات سطر الأوامر
- مفاهيم أساسية في AI/ML (واجهات برمجة التطبيقات، النماذج، المطالبات)

## إعداد المختبر

### الخطوة 1: إعداد البيئة

1. **تحقق من تثبيت الأدوات:**
```bash
# تحقق من تثبيت AZD
azd version

# تحقق من تثبيت Azure CLI
az --version

# سجّل الدخول إلى Azure
az login
azd auth login
```

2. **استنساخ مستودع ورشة العمل:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## الوحدة 1: فهم بنية AZD لتطبيقات الذكاء الاصطناعي

### تركيب قالب AZD الجاهز للذكاء الاصطناعي

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

### **تمرين المعمل 1.1: استكشاف التكوين**

1. **افحص ملف azure.yaml:**
```bash
cat azure.yaml
```

**ما الذي ينبغي البحث عنه:**
- تعريفات الخدمات لمكونات الذكاء الاصطناعي
- تعيينات متغيرات البيئة
- تكوينات المضيف

2. **راجع البنية التحتية في main.bicep:**
```bash
cat infra/main.bicep
```

**أنماط الذكاء الاصطناعي الرئيسية التي يجب تحديدها:**
- توفير خدمة Microsoft Foundry Models
- التكامل مع Cognitive Search
- إدارة المفاتيح الآمنة
- تكوينات أمان الشبكة

### **نقطة نقاش:** لماذا تهم هذه الأنماط للذكاء الاصطناعي

- **اعتماد الخدمات**: غالبًا ما تتطلب تطبيقات الذكاء الاصطناعي عدة خدمات منسقة
- **الأمان**: مفاتيح واجهات برمجة التطبيقات ونقاط النهاية تحتاج إلى إدارة آمنة
- **القابلية للتوسع**: أحمال عمل الذكاء الاصطناعي لها متطلبات مميزة للتوسع
- **إدارة التكلفة**: يمكن أن تكون خدمات الذكاء الاصطناعي مكلفة إذا لم يتم تكوينها بشكل صحيح

## الوحدة 2: نشر تطبيق الذكاء الاصطناعي الأول

### الخطوة 2.1: تهيئة البيئة

1. **إنشاء بيئة AZD جديدة:**
```bash
azd env new myai-workshop
```

2. **اضبط المعلمات المطلوبة:**
```bash
# حدد منطقتك المفضلة في Azure
azd env set AZURE_LOCATION eastus

# اختياري: عيّن نموذج OpenAI محدد
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### الخطوة 2.2: نشر البنية التحتية والتطبيق

1. **النشر باستخدام AZD:**
```bash
azd up
```

**ما الذي يحدث أثناء `azd up`:**
- ✅ يوفر خدمة Microsoft Foundry Models
- ✅ ينشئ خدمة Cognitive Search
- ✅ يجهز App Service لتطبيق الويب
- ✅ يكوّن الشبكات والأمان
- ✅ ينشر شفرة التطبيق
- ✅ يضبط المراقبة والسجلات

2. **راقب تقدم النشر** ولاحظ الموارد الجاري إنشاؤها.

### الخطوة 2.3: التحقق من النشر

1. **تحقق من الموارد المنشورة:**
```bash
azd show
```

2. **افتح التطبيق المنشور:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **اختبر وظائف الذكاء الاصطناعي:**
   - انتقل إلى تطبيق الويب
   - جرّب استعلامات نموذجية
   - تحقق من عمل استجابات الذكاء الاصطناعي

### **تمرين المعمل 2.1: تدريب على استكشاف الأخطاء وإصلاحها**

**السيناريو**: نجح النشر لكن الذكاء الاصطناعي لا يستجيب.

**المشكلات الشائعة للتحقق منها:**
1. **مفاتيح OpenAI API**: تحقق من ضبطها بشكل صحيح
2. **توفر النموذج**: تحقق مما إذا كانت منطقتك تدعم النموذج
3. **اتصال الشبكة**: تأكد من قدرة الخدمات على التواصل
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

## الوحدة 3: تخصيص تطبيقات الذكاء الاصطناعي لتلبية احتياجاتك

### الخطوة 3.1: تعديل تكوين الذكاء الاصطناعي

1. **تحديث نموذج OpenAI:**
```bash
# التبديل إلى نموذج آخر (إذا كان متاحًا في منطقتك)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# أعد النشر باستخدام التكوين الجديد
azd deploy
```

2. **إضافة خدمات ذكاء اصطناعي إضافية:**

حرّر `infra/main.bicep` لإضافة Document Intelligence:

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

1. **إنشاء بيئة الإنتاج:**
```bash
azd env new myai-production
```

2. **اضبط المعلمات الخاصة بالإنتاج:**
```bash
# في بيئة الإنتاج عادةً ما تُستخدم وحدات SKU أعلى
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# تمكين ميزات أمان إضافية
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **تمرين المعمل 3.1: تحسين التكلفة**

**التحدي**: قم بتكوين القالب لتطوير فعال من حيث التكلفة.

**المهام:**
1. تحديد أي من SKUs يمكن تعيينه إلى مستويات مجانية/أساسية
2. تكوين متغيرات البيئة لتقليل التكلفة
3. انشر وقارن التكاليف مع تكوين الإنتاج

**تلميحات للحل:**
- استخدم مستوى F0 (مجانًا) لخدمات Cognitive عندما يكون ذلك ممكنًا
- استخدم المستوى Basic لخدمة Search أثناء التطوير
- ضع في اعتبارك استخدام خطة Consumption لـ Functions

## الوحدة 4: الأمان وأفضل ممارسات الإنتاج

### الخطوة 4.1: إدارة الاعتمادات الآمنة

**التحدي الحالي**: العديد من تطبيقات الذكاء الاصطناعي تقوم بتضمين مفاتيح API داخل الشيفرة أو تستخدم تخزينًا غير آمن.

**حل AZD**: Managed Identity + تكامل Key Vault.

1. **راجع تكوين الأمان في القالب الخاص بك:**
```bash
# ابحث عن تكوين Key Vault والهوية المُدارة
grep -r "keyVault\|managedIdentity" infra/
```

2. **تحقق من أن Managed Identity تعمل:**
```bash
# تحقق مما إذا كان لتطبيق الويب تكوين الهوية الصحيح
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### الخطوة 4.2: أمان الشبكة

1. **تمكين النقاط النهائية الخاصة** (إذا لم تكن مُكوّنة بالفعل):

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

### الخطوة 4.3: المراقبة والقابلية للمشاهدة

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

### **تمرين المعمل 4.1: تدقيق الأمان**

**المهمة**: راجع نشر تطبيقك بالنسبة لأفضل ممارسات الأمان.

**قائمة التحقق:**
- [ ] لا توجد أسرار مضمنة في الشيفرة أو التكوين
- [ ] استخدام Managed Identity للمصادقة بين الخدمات
- [ ] يخزن Key Vault التكوين الحساس
- [ ] تم تقييد الوصول إلى الشبكة بشكل مناسب
- [ ] تم تمكين المراقبة والسجلات

## الوحدة 5: تحويل تطبيق الذكاء الاصطناعي الخاص بك

### الخطوة 5.1: ورقة تقييم

**قبل تحويل تطبيقك**, أجب عن هذه الأسئلة:

1. **هندسة التطبيق:**
   - ما خدمات الذكاء الاصطناعي التي يستخدمها تطبيقك؟
   - ما موارد الحوسبة التي يحتاجها؟
   - هل يتطلب قاعدة بيانات؟
   - ما تبعيات الخدمات فيما بينها؟

2. **متطلبات الأمان:**
   - ما البيانات الحساسة التي يتعامل معها تطبيقك؟
   - ما متطلبات الامتثال التي لديك؟
   - هل تحتاج إلى شبكة خاصة؟

3. **متطلبات التوسع:**
   - ما الحمل المتوقع؟
   - هل تحتاج إلى توسيع تلقائي؟
   - هل هناك متطلبات إقليمية؟

### الخطوة 5.2: أنشئ قالب AZD الخاص بك

**اتبع هذا النمط لتحويل تطبيقك:**

1. **إنشاء البنية الأساسية:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# تهيئة قالب AZD
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

### **تمرين المعمل 5.1: تحدي إنشاء القالب**

**التحدي**: أنشئ قالب AZD لتطبيق ذكاء اصطناعي لمعالجة المستندات.

**المتطلبات:**
- Microsoft Foundry Models لتحليل المحتوى
- Document Intelligence لأجل OCR
- حساب تخزين لرفع المستندات
- Function App لمنطق المعالجة
- تطبيق ويب لواجهة المستخدم

**نقاط إضافية:**
- أضف معالجة أخطاء مناسبة
- ضمّن تقديرًا للتكلفة
- قم بإعداد لوحات مراقبة

## الوحدة 6: استكشاف المشاكل الشائعة وإصلاحها

### مشكلات النشر الشائعة

#### المشكلة 1: تجاوز حصة خدمة OpenAI
**الأعراض:** يفشل النشر بسبب خطأ الحصة
**الحلول:**
```bash
# تحقق من الحصص الحالية
az cognitiveservices usage list --location eastus

# اطلب زيادة في الحصص أو جرّب منطقة مختلفة
azd env set AZURE_LOCATION westus2
azd up
```

#### المشكلة 2: النموذج غير متاح في المنطقة
**الأعراض:** تفشل استجابات الذكاء الاصطناعي أو تحدث أخطاء في نشر النموذج
**الحلول:**
```bash
# تحقق من توفر النموذج حسب المنطقة
az cognitiveservices model list --location eastus

# قم بالتحديث إلى نموذج متاح
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
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

#### المشكلة 4: بطء استجابات الذكاء الاصطناعي
**خطوات التحقيق:**
1. تحقق من Application Insights للحصول على مقاييس الأداء
2. راجع مقاييس خدمة OpenAI في بوابة Azure
3. تحقق من اتصال الشبكة والكمون

**الحلول:**
- قم بتنفيذ التخزين المؤقت للاستعلامات الشائعة
- استخدم نموذج OpenAI المناسب لحالة الاستخدام الخاصة بك
- فكر في استخدام نسخ قراءة للحالات ذات الحمل العالي

### **تمرين المعمل 6.1: تحدي التصحيح**

**السيناريو**: نجح نشر التطبيق، لكن التطبيق يعيد أخطاء 500.

**مهام التصحيح:**
1. تحقق من سجلات التطبيق
2. تحقق من اتصال الخدمات
3. اختبر المصادقة
4. راجع التكوين

**الأدوات للاستخدام:**
- `azd show` للحصول على ملخص النشر
- بوابة Azure لسجلات الخدمات المفصلة
- Application Insights للقياسات الخاصة بالتطبيق

## الوحدة 7: المراقبة والتحسين

### الخطوة 7.1: إعداد مراقبة شاملة

1. **إنشاء لوحات معلومات مخصصة:**

انتقل إلى بوابة Azure وأنشئ لوحة معلومات تحتوي على:
- عدد طلبات OpenAI والكمون
- معدلات أخطاء التطبيق
- استهلاك الموارد
- تتبع التكاليف

2. **إعداد التنبيهات:**
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

1. **حلل التكاليف الحالية:**
```bash
# استخدم Azure CLI للحصول على بيانات التكلفة
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **تنفيذ ضوابط التكلفة:**
- إعداد تنبيهات الميزانية
- استخدم سياسات التحجيم التلقائي
- نفّذ تخزينًا مؤقتًا للطلبات
- راقب استخدام الرموز (tokens) لـ OpenAI

### **تمرين المعمل 7.1: تحسين الأداء**

**المهمة**: قم بتحسين تطبيق الذكاء الاصطناعي الخاص بك من حيث الأداء والتكلفة.

**المقاييس المطلوب تحسينها:**
- خفّض متوسط زمن الاستجابة بنسبة 20%
- خفّض التكاليف الشهرية بنسبة 15%
- حافظ على توفر 99.9%

**استراتيجيات للتجربة:**
- تنفيذ التخزين المؤقت للاستجابات
- تحسين المطالبات لكفاءة الرموز
- استخدام SKUs الحوسبية المناسبة
- إعداد التحجيم التلقائي المناسب

## التحدي النهائي: التنفيذ من البداية إلى النهاية

### سيناريو التحدي

مكلف بإنشاء روبوت محادثة لخدمة العملاء مدعوم بالذكاء الاصطناعي وجاهز للإنتاج مع المتطلبات التالية:

**المتطلبات الوظيفية:**
- واجهة ويب لتفاعل العملاء
- التكامل مع Microsoft Foundry Models لتوليد الاستجابات
- قدرة على البحث في المستندات باستخدام Cognitive Search
- التكامل مع قاعدة بيانات العملاء الحالية
- دعم متعدد اللغات

**المتطلبات غير الوظيفية:**
- التعامل مع 1000 مستخدم متزامن
- اتفاقية مستوى الخدمة (SLA) بتوافر 99.9%
- الامتثال لمعيار SOC 2
- التكلفة أقل من $500/شهر
- النشر في بيئات متعددة (dev, staging, prod)

### خطوات التنفيذ

1. **صمم الهندسة المعمارية**
2. **أنشئ قالب AZD**
3. **نفّذ تدابير الأمان**
4. **أعد المراقبة والتنبيهات**
5. **أنشئ خطوط نشر**
6. **وثّق الحل**

### معايير التقييم

- ✅ **الوظائف**: هل تلبي جميع المتطلبات؟
- ✅ **الأمان**: هل تم تنفيذ أفضل الممارسات؟
- ✅ **القابلية للتوسع**: هل يمكنها التعامل مع الحمل؟
- ✅ **قابلية الصيانة**: هل الشيفرة والبنية التحتية منظمة جيدًا؟
- ✅ **التكلفة**: هل تبقى ضمن الميزانية؟

## موارد إضافية

### وثائق Microsoft
- [وثائق Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [وثائق خدمة Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [وثائق Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### قوالب عينة
- [تطبيق دردشة Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [الدليل السريع لتطبيق دردشة OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [دردشة Contoso](https://github.com/Azure-Samples/contoso-chat)

### موارد المجتمع
- [خادم Microsoft Foundry على Discord](https://discord.gg/microsoft-azure)
- [مستودع Azure Developer CLI على GitHub](https://github.com/Azure/azure-dev)
- [قوالب AZD رائعة](https://azure.github.io/awesome-azd/)

## 🎓 شهادة الإتمام

تهانينا! لقد أكملت مختبر ورشة عمل الذكاء الاصطناعي. يجب أن تكون الآن قادرًا على:
- ✅ تحويل تطبيقات AI الحالية إلى قوالب AZD
- ✅ نشر تطبيقات AI جاهزة للإنتاج
- ✅ تنفيذ أفضل ممارسات الأمان لأحمال عمل AI
- ✅ مراقبة وتحسين أداء تطبيقات AI
- ✅ استكشاف مشكلات النشر الشائعة وإصلاحها

### الخطوات التالية
1. طبق هذه الأنماط على مشاريع AI الخاصة بك
2. شارك القوالب مع المجتمع
3. انضم إلى Discord الخاص بـ Microsoft Foundry للحصول على دعم مستمر
4. استكشف مواضيع متقدمة مثل النشر متعدد المناطق

---

**ملاحظات الورشة**: ساعدنا في تحسين هذه الورشة بمشاركة تجربتك في [قناة #Azure على Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**التنقل بين الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - التطوير المتمحور حول الذكاء الاصطناعي
- **⬅️ السابق**: [نشر نموذج AI](ai-model-deployment.md)
- **➡️ التالي**: [أفضل ممارسات AI للإنتاج](production-ai-practices.md)
- **🚀 الفصل التالي**: [الفصل 3: التكوين](../chapter-03-configuration/configuration.md)

**هل تحتاج إلى مساعدة؟** انضم إلى مجتمعنا للحصول على الدعم والمناقشات حول AZD ونشر الذكاء الاصطناعي.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
إخلاء المسؤولية:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية [Co-op Translator] (https://github.com/Azure/co-op-translator). بينما نسعى إلى الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو سهو. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر المعتبر والمرجعي. للمعلومات الحرجة، يوصى بالاستعانة بترجمة بشرية محترفة. لا نتحمل أي مسؤولية عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->