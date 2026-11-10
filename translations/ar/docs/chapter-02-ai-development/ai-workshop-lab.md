# مختبر ورشة العمل للذكاء الاصطناعي: كيفية جعل حلول الذكاء الاصطناعي الخاصة بك قابلة للنشر باستخدام AZD

**التنقل بين الفصول:** 
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - التطوير المُركَّز على الذكاء الاصطناعي
- **⬅️ السابق**: [نشر نموذج الذكاء الاصطناعي](ai-model-deployment.md)
- **➡️ التالي**: [أفضل الممارسات لإنتاج الذكاء الاصطناعي](../chapter-08-production/production-ai-practices.md)
- **🚀 الفصل التالي**: [الفصل 3: التهيئة](../chapter-03-configuration/configuration.md)

## نظرة عامة على الورشة

يوجه هذا المختبر العملي المطورين خلال عملية أخذ قالب ذكاء اصطناعي موجود ونشره باستخدام Azure Developer CLI (AZD). ستتعلم الأنماط الأساسية لنشر الذكاء الاصطناعي في بيئات الإنتاج باستخدام خدمات Microsoft Foundry.

> **مراجعة الإصدار (2026-11-04):** نُقِّح توجيه أوامر AZD وأسماء تكوينات العينات مقابل إصدار `azd` `1.37.2` والتكوين الحالي للعينة المرتبطة. هذه مراجعة توثيق، وليست تحققًا من نشر مباشر. مختبر RAG لا يتطلب امتداد الوكيل؛ للتقييمات المتعلقة بالوكيل، استخدم الامتداد المنفصل `azure.ai.evaluations` و[سير العمل التقييمي الحالي](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks)، وليس أوامر التقييم الوكيل القديمة.

**المدة:** من 2 إلى 3 ساعات  
**المستوى:** متوسط  
**المتطلبات السابقة:** معرفة أساسية بـ Azure، إلمام بمفاهيم الذكاء الاصطناعي/التعلم الآلي

## 🎓 أهداف التعلم

بحلول نهاية هذه الورشة، ستكون قادرًا على:
- ✅ استكشاف قالب AI AZD موجود وتخطيط تحويل تطبيقك الخاص
- ✅ تهيئة خدمات Microsoft Foundry باستخدام AZD
- ✅ تنفيذ إدارة بيانات اعتماد آمنة لخدمات الذكاء الاصطناعي
- ✅ نشر تطبيق مرجعي للذكاء الاصطناعي مع المراقبة
- ✅ استكشاف وإصلاح المشكلات الشائعة في نشر الذكاء الاصطناعي

## المتطلبات المسبقة

### الأدوات المطلوبة
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) مثبت
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) مثبت
- [Git](https://git-scm.com/) مثبت
- محرر الشيفرة (يوصى بـ VS Code)

تستخدم هذه الكتل الأمرية تركيب باش (بما في ذلك الاستمرارية في السطر و `grep`). على Windows، استخدم Git Bash/WSL أو قم بترجمتها إلى PowerShell. كما قم بتثبيت أدوات اللغة، ومدير الحزم، والحاويات المدرجة في [إعداد بيئة العينة المحلية](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### موارد Azure
- اشتراك Azure مع أذونات توفير الموارد وتعيين الأدوار (المساهم وحده لا يمكنه إنشاء تعيينات RBAC؛ استخدم مسؤول دور مخول أو ما يعادله الموثق في العينة)
- الوصول إلى خدمات Microsoft Foundry Models (أو القدرة على طلب الوصول)
- أذونات إنشاء مجموعة الموارد

### متطلبات المعرفة الأساسية
- فهم أساسي لخدمات Azure
- إلمام بواجهات الأوامر
- مفاهيم أساسية في الذكاء الاصطناعي/التعلم الآلي (واجهات برمجة التطبيقات، النماذج، المطالبات)

## إعداد المختبر

### الخطوة 1: تجهيز البيئة

1. **تحقق من تثبيت الأدوات:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

إذا كنت تعمل عبر عدة مستأجرين أو لم يتم اكتشاف اشتراكك تلقائيًا، أعد المحاولة باستخدام `azd auth login --tenant-id <tenant-id>`.

2. **استنساخ مستودع الورشة:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## الوحدة 1: فهم بنية AZD لتطبيقات الذكاء الاصطناعي

### تركيب قالب AZD للذكاء الاصطناعي

استكشف الملفات الأساسية في قالب AZD جاهز للذكاء الاصطناعي:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

يمكن أن يتغير العينة التي تم التحقق منها؛ `.azure/` تظهر بعد تهيئة البيئة، وليس بالضرورة في استنساخ جديد. افحص التحقق الفعلي بدلاً من إنشاء مجلدات مفقودة لمطابقة هذا المخطط.

### **تمرين المختبر 1.1: استكشاف التكوين**

1. **افحص ملف azure.yaml:**
```bash
cat azure.yaml
```

**ما يجب البحث عنه:**
- تعريفات الخدمة لمكونات الذكاء الاصطناعي
- تعيينات متغيرات البيئة
- تكوينات المضيف

2. **راجع البنية التحتية main.bicep:**
```bash
cat infra/main.bicep
```

**أنماط الذكاء الاصطناعي الرئيسية لتحديدها:**
- توفير خدمة نماذج Microsoft Foundry
- تكامل Azure AI Search
- إدارة مفاتيح آمنة
- تكوينات أمان الشبكة

### **نقطة نقاش:** لماذا تهم هذه الأنماط للذكاء الاصطناعي

- **اعتمادات الخدمة**: غالبًا ما تتطلب تطبيقات الذكاء الاصطناعي خدمات متعددة منسقة
- **الأمان**: تحتاج مفاتيح واجهة برمجة التطبيقات ونقاط النهاية إلى إدارة آمنة
- **قابلية التوسع**: لأعباء عمل الذكاء الاصطناعي متطلبات توسع فريدة
- **إدارة التكلفة**: يمكن أن تكون خدمات الذكاء الاصطناعي مكلفة إذا لم يتم تكوينها بشكل صحيح

## الوحدة 2: نشر أول تطبيق ذكاء اصطناعي لك

### الخطوة 2.1: تهيئة البيئة

1. **إنشاء بيئة AZD جديدة:**
```bash
azd env new myai-workshop
```

2. **تعيين المعلمات المطلوبة:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### الخطوة 2.2: نشر البنية التحتية والتطبيق

1. **النشر باستخدام AZD:**
```bash
azd up
```

**ما يحدث أثناء `azd up`:**
- ✅ يوفر خدمة نماذج Microsoft Foundry
- ✅ ينشئ خدمة Azure AI Search
- ✅ يهيئ Azure Container Apps للواجهة الخلفية والواجهة الأمامية المجتمعة (العينة الافتراضية الحالية)
- ✅ يكوّن الشبكات والأمان
- ✅ ينشر كود التطبيق
- ✅ يهيئ المراقبة والتسجيل

2. **راقب تقدم النشر** ودون الموارد التي يتم إنشاؤها.

### الخطوة 2.3: تحقق من نشر تطبيقك

1. **تحقق من الموارد المنشورة:**
```bash
azd show
```

2. **افتح التطبيق المنشور:**
```bash
azd show
```

افتح نقطة النهاية على الويب الموضحة في ناتج `azd show`.

3. **اختبر وظيفة الذكاء الاصطناعي:**
   - انتقل إلى تطبيق الويب
   - جرّب استفسارات عينة
   - تحقق من أن ردود الذكاء الاصطناعي تعمل

### **تمرين المختبر 2.1: ممارسة استكشاف الأخطاء وإصلاحها**

**السيناريو**: نجح نشر التطبيق ولكن الذكاء الاصطناعي لا يستجيب.

**المشاكل الشائعة للتحقق منها:**
1. **المصادقة**: تحقق من هوية الإدارة وتعيينات الأدوار؛ وافحص مفاتيح API فقط إذا قمت بتمكين المصادقة المعتمدة على المفاتيح عن قصد
2. **توفر النموذج**: تحقق مما إذا كانت منطقتك تدعم النموذج
3. **اتصال الشبكة**: تأكد من أن الخدمات يمكنها التواصل
4. **أذونات RBAC**: تحقق من أن التطبيق يمكنه الوصول إلى OpenAI

**أوامر تصحيح الأخطاء:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## الوحدة 3: تخصيص تطبيقات الذكاء الاصطناعي لاحتياجاتك

### الخطوة 3.1: تعديل تكوين الذكاء الاصطناعي

1. **قم بتحديث نموذج OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **أضف خدمات ذكاء اصطناعي إضافية:**

حرّر `infra/main.bicep` لإضافة ذكاء المستندات:

ما يلي مقطع توضيحي، وليس قالبًا كاملاً. قد يوفر المثال خدمات معالجة المستندات بالفعل: افحص البنية التحتية الحالية قبل إضافة موارد مكررة. الإضافات المخصصة تتطلب توصيل المخرجات، والهويات، وتكوين التطبيق.

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

### الخطوة 3.2: إعدادات خاصة بالبيئة

**أفضل الممارسات**: إعدادات مختلفة للتطوير مقابل الإنتاج.

1. **إنشاء بيئة للإنتاج:**
```bash
azd env new myai-production
```

2. **تعيين معلمات خاصة بالإنتاج:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

تأتي هذه الأسماء من [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) للنموذج. يخزن `azd env set` قيمة لكنه لا يجعل المتغير العشوائي فعالًا: يجب على القالب استهلاكه. راجع [دليل عزل الشبكة](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) في النموذج قبل تعطيل الوصول العام، واستخدم `azd up` لتطبيق تغييرات البنية التحتية. تحدد الشفرة المفتاحية OpenAI SKU `S0` فقط ليس تدفق النموذج؛ نوع نشر النموذج والسعة مهمان أيضًا.

### **تمرين المختبر 3.1: تحسين التكاليف**

**التحدي**: تكوين القالب لتطوير فعال من حيث التكلفة.

**المهام:**
1. اختر بيئة ورشة العمل القابلة للتصرف: `azd env select myai-workshop`.
2. سجِّل الشفرة المفتاحية Search SKU وسعة النموذج الحالية من `infra/main.parameters.json` والبيئة المختارة.
3. استخدم المدخلات المدعومة أدناه، بعد التأكد من حصة النموذج/المنطقة:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. تحقق من الشفرة المفتاحية Search SKU وسعة النشر في البوابة وقم بتقدير الفرق باستخدام حاسبة الأسعار. لا تتوقع تحديث بيانات الفوترة على الفور.

**معايير النجاح:** يستخدم البحث Basic، نشر الدردشة لديه السعة المدعومة المطلوبة، ولا تزال التطبيق يجيب على سؤال عينة. السعة `10` هي تخصيص حد معدل، وليست خصم سعر على الرمز. يمكن تقييد تغييرات طبقة البحث أو تتطلب إعادة الإنشاء؛ لا تجرب على الموارد الإنتاجية. F0 خاص بالخدمة وليس نموذج SKU لـ Azure OpenAI.

## الوحدة ٤: الأمن وأفضل ممارسات الإنتاج

### الخطوة ٤.١: إدارة بيانات الاعتماد بشكل آمن

**التحدي الحالي**: العديد من تطبيقات الذكاء الاصطناعي تقوم بتشفير مفاتيح API أو تستخدم تخزينًا غير آمن.

**حل AZD**: الهوية المُدارة + تكامل Key Vault.

1. **راجع تكوين الأمان في القالب الخاص بك:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **تحقق من عمل الهوية المُدارة:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### الخطوة ٤.٢: أمان الشبكة

1. **قم بتمكين النقاط النهائية الخاصة** باستخدام تكوين الشبكة المدعوم من العينة (إذا لم يتم تكوينها بالفعل).

لقالبك الخاص، يعرض هذا المقتطف التوضيحي اتصال نقطة النهاية لـ OpenAI. كما يحتاج إلى VNet وتكوين DNS خاص واتصال التطبيق؛ لا تقم بلصقه دون تغيير في العينة التي تحتوي بالفعل على وحدات النقطة النهائية الخاصة:
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

### الخطوة ٤.٣: المراقبة والرصد

1. **قم بتكوين Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **قم بتمكين تكامل Application Insights الخاص بالعينة:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

تصدر أدوات العينة بيانات القياس عن بعد؛ إعداد `OPENAI_MONITOR_ENABLED` تعسفي لا يُمكّن مقاييس الذكاء الاصطناعي. راجع التتبع لمكالمات النموذج، الكمون، الإخفاقات، واستخدام الرموز، وتجنب تسجيل المطالبات أو الاستجابات الحساسة.

### **تمرين مختبر 4.1: تدقيق الأمان**

**المهمة**: راجع نشر تطبيقك لأفضل ممارسات الأمان.

**قائمة التحقق:**
- [ ] لا توجد أسرار مضمّنة في الكود أو التكوين
- [ ] استخدام هوية مُدارة للمصادقة بين الخدمات
- [ ] تخزين التكوين الحساس في Key Vault
- [ ] تقييد الوصول إلى الشبكة بشكل صحيح
- [ ] تمكين المراقبة وتسجيل الدخول

## الوحدة 5: تحويل تطبيقك الذكي الخاص

### الخطوة 5.1: ورقة تقييم

**قبل تحويل تطبيقك**، أجب عن هذه الأسئلة:

1. **هندسة التطبيق:**
   - ما هي خدمات الذكاء الاصطناعي التي يستخدمها تطبيقك؟
   - ما هي موارد الحوسبة التي يحتاجها؟
   - هل يتطلب قاعدة بيانات؟
   - ما هي التبعيات بين الخدمات؟

2. **متطلبات الأمان:**
   - ما هي البيانات الحساسة التي يتعامل معها تطبيقك؟
   - ما هي متطلبات الامتثال التي لديك؟
   - هل تحتاج إلى شبكة خاصة؟

3. **متطلبات التوسع:**
   - ما هو الحمل المتوقع لديك؟
   - هل تحتاج إلى التوسع التلقائي؟
   - هل هناك متطلبات إقليمية؟

### الخطوة 5.2: إنشاء قالب AZD الخاص بك

**اتبع هذا النمط لتحويل تطبيقك:**

**هيكل فقط:** هذا القسم لا يوفر مصدر API / تطبيق ويب، أو بنية استضافة، أو نشر نماذج، أو هوية / RBAC، أو `main.parameters.json` مكتمل. يوضح Bicep المُحدّد بمجموعة الموارد تكوين الوحدة؛ يجب على نقطة الدخول النموذجية المحددة بالاشتراك في AZD إنشاء مجموعة موارد واستدعائها في هذا النطاق. لا تتوقع من `azd up` نشر تطبيق كامل بمجرد نسخ هذه المقاطع فقط. للحصول على أساس قابل للتشغيل، استمر في استخدام قالب RAG من الوحدة 1.

1. **إنشاء الهيكل الأساسي:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **تمرين المختبر 5.1: تحدي إنشاء القالب**

**التحدي**: إنشاء قالب AZD لتطبيق ذكاء اصطناعي لمعالجة المستندات.

**المتطلبات:**
- نماذج Microsoft Foundry لتحليل المحتوى
- الذكاء المستندي لـ OCR
- حساب تخزين لتحميل المستندات
- تطبيق دالة للمنطق المعالجة
- تطبيق ويب لواجهة المستخدم

**نقاط إضافية:**
- إضافة معالجة صحيحة للأخطاء
- تضمين تقدير التكلفة
- إعداد لوحات مراقبة

## الوحدة 6: استكشاف المشكلات الشائعة وإصلاحها

### المشكلات الشائعة في النشر

#### المشكلة 1: تجاوز حصة خدمة OpenAI
**الأعراض:** فشل النشر مع خطأ في الحصة
**الحلول:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
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
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### المشكلة 3: مشاكل في الأذونات
**الأعراض:** أخطاء 403 ممنوع عند استدعاء خدمات الذكاء الاصطناعي
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

#### المشكلة 4: بطء استجابات الذكاء الاصطناعي
**خطوات التحقيق:**
1. فحص Application Insights لمقاييس الأداء
2. مراجعة مقاييس خدمة OpenAI في بوابة Azure
3. التحقق من اتصال الشبكة والكمون

**الحلول:**
- تنفيذ التخزين المؤقت للاستعلامات الشائعة
- استخدام نموذج OpenAI المناسب لحالة الاستخدام الخاصة بك
- قم بتوسيع نسخ التطبيق فقط بعد التحقق من حدود RPM/TPM للنموذج؛ نشرات Azure OpenAI لا تكشف عن إعداد "نسخة قراءة" بأسلوب قاعدة بيانات عام

### **تمرين المختبر 6.1: تحدي تصحيح الأخطاء**

**السيناريو**: تم نشر التطبيق بنجاح، لكن التطبيق يعيد أخطاء 500.

**مهام التصحيح:**
1. تحقق من سجلات التطبيق
2. تحقق من اتصال الخدمة
3. اختبار المصادقة
4. مراجعة التكوين

**الأدوات التي يجب استخدامها:**
- `azd show` لمراجعة نشر الخدمة
- بوابة Azure لسجلات الخدمة التفصيلية
- Application Insights لتتبع بيانات التطبيق

## الوحدة 7: المراقبة والتحسين

### الخطوة 7.1: إعداد المراقبة الشاملة

1. **إنشاء لوحات تحكم مخصصة:**

انتقل إلى بوابة Azure وأنشئ لوحة تحكم تشمل:
- عدد الطلبات والكمون لـ OpenAI
- معدلات أخطاء التطبيق
- استخدام الموارد
- تتبع التكاليف

2. **إعداد التنبيهات:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

تحقق من أن المكون يرسل بيانات التتبع للطلبات وأضف مجموعة إجراءات إذا كانت الإشعارات مطلوبة. المقياس هو عدد وليس نسبة الفشل؛ تنبيه المعدل يحتاج إلى استعلام مناسب ومقام.

### الخطوة 7.2: تحسين التكلفة

1. **تحليل التكاليف الحالية:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

استبدل أماكن التواريخ. دعم API الخاص بالاستهلاك يختلف حسب اتفاقية الفوترة؛ استخدم إدارة التكاليف في البوابة إذا كانت تفاصيل الاستخدام غير متوفرة. التكاليف متأخرة وليست اختبارًا في الوقت الفعلي.

2. **تنفيذ ضوابط التكلفة:**
- إعداد تنبيهات الميزانية
- استخدام سياسات التوسع التلقائي
- تنفيذ تخزين مؤقت للطلبات
- مراقبة استخدام الرموز لـ OpenAI

### **تمرين المعمل 7.1: تحسين الأداء**

**المهمة**: قم بتحسين تطبيق الذكاء الاصطناعي الخاص بك للأداء والتكلفة معًا.

**المقاييس التي يجب تحسينها:**
- تقليل متوسط زمن الاستجابة بنسبة 20%
- تقليل التكاليف الشهرية بنسبة 15%
- تحديد اتفاقية مستوى الخدمة (SLO) بتوفر بنسبة 99.9% ونافذة قياس (لا يمكن لتمرين مختصر اثبات التوفر الشهري)

**الاستراتيجيات التي يمكن تجربتها:**
- تنفيذ التخزين المؤقت للاستجابات
- تحسين العبارات لتقليل استهلاك الرموز
- استخدام وحدات الحوسبة المناسبة
- إعداد التوسع التلقائي المناسب

## التحدي النهائي: التنفيذ من البداية للنهاية

### سيناريو التحدي

هذا **تحدي معماري/تصميم اختياري**، وليس تمرين تشغيل أو شهادة إنتاج. اقترح روبوت دردشة لخدمة العملاء مدعوم بالذكاء الاصطناعي ووثق المتطلبات التي تحتاج لمزيد من التنفيذ والأدلة:

**المتطلبات الوظيفية:**
- واجهة ويب لتفاعل العملاء
- تكامل مع نماذج Microsoft Foundry للردود
- قدرة بحث في الوثائق باستخدام Azure AI Search
- تكامل مع قاعدة بيانات العملاء الحالية
- دعم متعدد اللغات

**المتطلبات غير الوظيفية:**
- التعامل مع 1000 مستخدم متزامن
- اتفاقية مستوى الخدمة بتوفر 99.9%
- الامتثال لـ SOC 2
- التكلفة أقل من 500 دولار شهريًا
- النشر في بيئات متعددة (تطوير، اختبار، إنتاج)

هذه قيود افتراضية من أصحاب المصلحة، وليست نتائج مضمونة بالتوازي. حدد معدل الطلب، وأحجام العبارات والإخراج، ومدة الجلسة قبل تقدير التكاليف؛ وجود 1000 مستخدم متزامن لا يثبت عبء عمل ولا يضمن ميزانية 500 دولار. SOC 2 نتيجة تدقيق تنظيمي، وليس مجرد تفعيل عبر قالب AZD. اعرف التنازلات ورفض القيود غير الممكنة مع أدلة.

### خطوات التنفيذ

1. **تصميم البنية المعمارية**
2. **إنشاء قالب AZD**
3. **تنفيذ إجراءات الأمان**
4. **إعداد المراقبة والتنبيهات**
5. **إنشاء قنوات النشر**
6. **توثيق الحل**

### معايير التقييم

- ✅ **الوظائف**: هل تم عرض القدرات المنفذة والاختلافات المتبقية بوضوح؟
- ✅ **الأمان**: هل تم تنفيذ أفضل الممارسات؟
- ✅ **القابلية للتوسع**: هل يتحمل الحمل؟
- ✅ **قابلية الصيانة**: هل الكود والبنية التحتية منظمة جيدًا؟
- ✅ **التكلفة**: هل يبقى ضمن الميزانية؟

## موارد إضافية

### وثائق مايكروسوفت
- [وثائق Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [وثائق خدمة Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [وثائق Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### قوالب عينة
- [تطبيق دردشة Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [بداية سريعة لتطبيق دردشة OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [دردشة Contoso](https://github.com/Azure-Samples/contoso-chat)

### موارد المجتمع
- [خادم Microsoft Foundry على ديسكورد](https://discord.gg/microsoft-azure)
- [مستودع Azure Developer CLI في GitHub](https://github.com/Azure/azure-dev)
- [قوالب AZD الرائعة](https://azure.github.io/awesome-azd/)

## 🎓 نقطة التحقق من الإتمام

تهانينا! لقد أتممت ورشة عمل الذكاء الاصطناعي. ينبغي أن تكون قادرًا الآن على:

- ✅ شرح كيفية تكييف تطبيق ذكاء اصطناعي موجود لقالب AZD
- ✅ نشر واختبار تطبيق ذكاء اصطناعي مرجعي
- ✅ تنفيذ أفضل ممارسات الأمان لأعباء الذكاء الاصطناعي
- ✅ مراقبة وتحسين أداء تطبيق الذكاء الاصطناعي
- ✅ استكشاف مشكلات النشر الشائعة وحلها

**تنظيف:** قم بتشغيل `azd env list`، وحدد كل بيئة قابلة للإزالة تم إنشاؤها في هذا المختبر (`myai-workshop`، وإذا تم نشر `myai-production`/`myai-quota-test`)، ثم شغّل `azd down` في كل منها. راجع خطة الحذف؛ حذف تكوين البيئة المحلي فقط لا يحذف موارد Azure. تجنب `--purge` إلا إذا كنت تفهم إزالة الموارد المحذوفة جزئيًا بشكل نهائي.

### الخطوات التالية
1. طبق هذه الأنماط على مشاريع الذكاء الاصطناعي الخاصة بك
2. ساهم بالقوالب للمجتمع
3. انضم إلى خادم Microsoft Foundry على ديسكورد للدعم المستمر
4. استكشف مواضيع متقدمة مثل نشر متعدد المناطق

---

**تعليقات الورشة**: ساعدنا في تحسين هذه الورشة بمشاركة تجربتك في قناة [Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - التطوير المرتكز على الذكاء الاصطناعي
- **⬅️ السابق**: [نشر نموذج الذكاء الاصطناعي](ai-model-deployment.md)
- **➡️ التالي**: [أفضل ممارسات الذكاء الاصطناعي للإنتاج](../chapter-08-production/production-ai-practices.md)
- **🚀 الفصل التالي**: [الفصل 3: التكوين](../chapter-03-configuration/configuration.md)

**هل تحتاج مساعدة؟** انضم إلى مجتمعنا للدعم والمناقشات حول AZD ونشرات الذكاء الاصطناعي.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->