# مختبر ورشة عمل الذكاء الاصطناعي: جعل حلول الذكاء الاصطناعي الخاصة بك قابلة للنشر بواسطة AZD  

**تنقل الفصل:**  
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)  
- **📖 الفصل الحالي**: الفصل 2 - التطوير المعتمد على الذكاء الاصطناعي أولاً  
- **⬅️ السابق**: [نشر نموذج الذكاء الاصطناعي](ai-model-deployment.md)  
- **➡️ التالي**: [أفضل ممارسات الذكاء الاصطناعي في الإنتاج](production-ai-practices.md)  
- **🚀 الفصل التالي**: [الفصل 3: التكوين](../chapter-03-configuration/configuration.md)  

## نظرة عامة على الورشة  

يرشد هذا المختبر العملي المطورين خلال عملية أخذ قالب ذكاء اصطناعي موجود ونشره باستخدام Azure Developer CLI (AZD). ستتعلم أنماطًا أساسية لنشر الذكاء الاصطناعي في بيئات الإنتاج باستخدام خدمات Microsoft Foundry.  

> **ملاحظة التحقق (2026-07-13):** تمت مراجعة هذه الورشة باستخدام `azd` الإصدار `1.27.1`. إذا كانت التثبيت المحلية قديمة، يرجى تحديث AZD قبل البدء لضمان تطابق خطوات المصادقة والقالب وسير العمل في النشر مع الخطوات أدناه.  

**المدة:** ساعتان إلى 3 ساعات  
**المستوى:** متوسط  
**المتطلبات المسبقة:** معرفة أساسية بـ Azure، الإلمام بمفاهيم الذكاء الاصطناعي/تعلم الآلة  

## 🎓 أهداف التعلم  

بنهاية هذه الورشة، ستكون قادرًا على:  
- ✅ تحويل تطبيق ذكاء اصطناعي موجود لاستخدام قوالب AZD  
- ✅ تكوين خدمات Microsoft Foundry باستخدام AZD  
- ✅ تنفيذ إدارة بيانات اعتماد آمنة لخدمات الذكاء الاصطناعي  
- ✅ نشر تطبيقات الذكاء الاصطناعي جاهزة للإنتاج مع المراقبة  
- ✅ استكشاف وحل مشاكل النشر الشائعة في الذكاء الاصطناعي  

## المتطلبات المسبقة  

### الأدوات المطلوبة  
- تثبيت [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- تثبيت [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)  
- تثبيت [Git](https://git-scm.com/)  
- محرر الشفرة (يوصى بـ VS Code)  

### موارد Azure  
- اشتراك Azure بصلاحية المساهم  
- إمكانية الوصول إلى خدمات Microsoft Foundry Models (أو القدرة على طلب الوصول)  
- أذونات إنشاء مجموعة موارد  

### المتطلبات المعرفية  
- فهم أساسي لخدمات Azure  
- الإلمام بواجهات الأوامر النصية  
- مفاهيم أساسية في الذكاء الاصطناعي/تعلم الآلة (واجهات برمجة التطبيقات، النماذج، الطلبات)  

## إعداد المختبر  

### الخطوة 1: تحضير البيئة  

1. **التحقق من تثبيت الأدوات:**  
```bash
# تحقق من تثبيت AZD
azd version

# تحقق من Azure CLI
az --version

# تسجيل الدخول إلى Azure لعمليات سير عمل AZD
azd auth login

# تسجيل الدخول إلى Azure CLI فقط إذا كنت تخطط لتشغيل أوامر az أثناء التشخيص
az login
```
  
إذا كنت تعمل عبر مستأجرين متعددين أو لم يتم الكشف عن اشتراكك تلقائياً، أعد المحاولة باستخدام `azd auth login --tenant-id <tenant-id>`.  

2. **نسخ مستودع الورشة:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  
## الوحدة 1: فهم هيكل AZD لتطبيقات الذكاء الاصطناعي  

### تشريح قالب AZD الخاص بالذكاء الاصطناعي  

استكشف الملفات الرئيسية في قالب AZD المعد للذكاء الاصطناعي:  

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
  
**ما الذي يجب ملاحظته:**  
- تعريفات الخدمات لمكونات الذكاء الاصطناعي  
- تعيين المتغيرات البيئية  
- تكوينات المضيف  

2. **راجع البنية التحتية في main.bicep:**  
```bash
cat infra/main.bicep
```
  
**أنماط الذكاء الاصطناعي الرئيسية التي يجب التعرف عليها:**  
- توفير خدمة Microsoft Foundry Models  
- دمج Azure AI Search  
- إدارة المفاتيح الآمنة  
- تكوينات أمان الشبكة  

### **نقطة نقاش:** لماذا تهم هذه الأنماط بالنسبة للذكاء الاصطناعي  

- **تبعية الخدمات**: غالباً ما تتطلب تطبيقات الذكاء الاصطناعي تنسيق خدمات متعددة  
- **الأمان**: يجب إدارة مفاتيح API ونقاط النهاية بأمان  
- **القابلية للتوسع**: لأحمال الذكاء الاصطناعي متطلبات توسعة فريدة  
- **إدارة التكلفة**: خدمات الذكاء الاصطناعي يمكن أن تكون مكلفة إذا لم تُضبط بشكل صحيح  

## الوحدة 2: نشر تطبيق الذكاء الاصطناعي الأول الخاص بك  

### الخطوة 2.1: تهيئة البيئة  

1. **إنشاء بيئة AZD جديدة:**  
```bash
azd env new myai-workshop
```
  
2. **تعيين المعاملات المطلوبة:**  
```bash
# قم بتعيين منطقة أزور المفضلة لديك
azd env set AZURE_LOCATION eastus

# اختياري: قم بتعيين نموذج OpenAI محدد
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```
  
### الخطوة 2.2: نشر البنية التحتية والتطبيق  

1. **النشر باستخدام AZD:**  
```bash
azd up
```
  
**ما يحدث أثناء `azd up`:**  
- ✅ توفير خدمة Microsoft Foundry Models  
- ✅ إنشاء خدمة Azure AI Search  
- ✅ إعداد App Service للتطبيق الويب  
- ✅ تكوين الشبكات والأمان  
- ✅ نشر كود التطبيق  
- ✅ إعداد المراقبة والتسجيل  

2. **مراقبة تقدم النشر** وتدوين الموارد التي يتم إنشاؤها.  

### الخطوة 2.3: تحقق من النشر الخاص بك  

1. **تفقد الموارد المنشورة:**  
```bash
azd show
```
  
2. **افتح التطبيق المنشور:**  
```bash
azd show
```
  
افتح نقطة النهاية الويب المعروضة في نتائج `azd show`.  

3. **اختبر وظيفة الذكاء الاصطناعي:**  
   - انتقل إلى تطبيق الويب  
   - جرب استعلامات نموذجية  
   - تحقق من فعالية استجابات الذكاء الاصطناعي  

### **تمرين المختبر 2.1: ممارسة استكشاف الأخطاء**  

**السيناريو**: تم النشر بنجاح لكن الذكاء الاصطناعي لا يستجيب.  

**المشاكل الشائعة التي يجب فحصها:**  
1. **مفاتيح OpenAI API**: تحقق من تعيينها بشكل صحيح  
2. **توفر النموذج**: تحقق إذا كان منطقتك تدعم النموذج  
3. **اتصال الشبكة**: تأكد من قدرة الخدمات على التواصل  
4. **أذونات RBAC**: تحقق من تمكن التطبيق من الوصول إلى OpenAI  

**أوامر التصحيح:**  
```bash
# التحقق من متغيرات البيئة
azd env get-values

# عرض سجلات النشر
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# التحقق من حالة نشر OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## الوحدة 3: تخصيص تطبيقات الذكاء الاصطناعي حسب حاجتك  

### الخطوة 3.1: تعديل تكوين الذكاء الاصطناعي  

1. **تحديث نموذج OpenAI:**  
```bash
# التغيير إلى نموذج مختلف (إذا كان متاحًا في منطقتك)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# إعادة النشر بالتكوين الجديد
azd deploy
```
  
2. **إضافة خدمات ذكاء اصطناعي إضافية:**  

عدل `infra/main.bicep` لإضافة Document Intelligence:  

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
  
### الخطوة 3.2: تكوينات مخصصة للبيئة  

**أفضل الممارسات**: تكوينات مختلفة للتطوير مقابل الإنتاج.  

1. **إنشاء بيئة إنتاج:**  
```bash
azd env new myai-production
```
  
2. **تعيين معاملات خاصة بالإنتاج:**  
```bash
# عادةً ما يستخدم الإنتاج رموز تخزين (SKU) أعلى
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# تمكين ميزات أمان إضافية
azd env set ENABLE_PRIVATE_ENDPOINTS true
```
  
### **تمرين المختبر 3.1: تحسين التكلفة**  

**التحدي**: تكوين القالب لتطوير فعال من حيث التكلفة.  

**المهام:**  
1. تحديد أي SKU يمكن تعيينه إلى الطبقات المجانية/الأساسية  
2. تكوين المتغيرات البيئية لأدنى تكلفة  
3. النشر والمقارنة بين التكاليف مع تكوين الإنتاج  

**تلميحات الحل:**  
- استخدام الطبقة F0 (المجانية) لخدمات Azure AI عند الإمكان  
- استخدام الطبقة الأساسية لخدمة البحث في بيئة التطوير  
- النظر في استخدام خطة الاستهلاك لـ Functions  

## الوحدة 4: الأمان وأفضل ممارسات الإنتاج  

### الخطوة 4.1: إدارة بيانات الاعتماد الآمنة  

**التحدي الحالي**: العديد من تطبيقات الذكاء الاصطناعي تخزن مفاتيح API بشكل مدمج أو تستخدم تخزينًا غير آمن.  

**حل AZD**: الهوية المُدارة + دمج Key Vault.  

1. **راجع تكوين الأمان في القالب الخاص بك:**  
```bash
# ابحث عن تكوين Key Vault و Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **تحقق من عمل الهوية المُدارة:**  
```bash
# تحقق مما إذا كان لتطبيق الويب تكوين الهوية الصحيح
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```
  
### الخطوة 4.2: أمان الشبكة  

1. **تمكين نقاط النهاية الخاصة** (إن لم تكن مفعلة بالفعل):  

أضف إلى قالب البِسِك الخاص بك:  
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
  
### الخطوة 4.3: المراقبة والقابلية للرصد  

1. **تكوين Application Insights:**  
```bash
# يجب تكوين Application Insights تلقائيًا
# تحقق من التهيئة:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```
  
2. **إعداد مراقبة محددة للذكاء الاصطناعي:**  

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

**المهمة**: راجع نشر تطبيقك للتحقق من أفضل ممارسات الأمان.  

**قائمة التحقق:**  
- [ ] لا توجد أسرار مدمجة في الكود أو التكوين  
- [ ] تم استخدام الهوية المُدارة للمصادقة بين الخدمات  
- [ ] مخزن المفاتيح يخزن التكوينات الحساسة  
- [ ] تم تقييد الوصول إلى الشبكة بشكل صحيح  
- [ ] تم تفعيل المراقبة والتسجيل  

## الوحدة 5: تحويل تطبيق الذكاء الاصطناعي الخاص بك  

### الخطوة 5.1: ورقة تقييم  

**قبل تحويل تطبيقك**، أجب عن هذه الأسئلة:  

1. **هيكل التطبيق:**  
   - ما هي خدمات الذكاء الاصطناعي التي يستخدمها التطبيق؟  
   - ما هي موارد الحوسبة التي يحتاجها؟  
   - هل يحتاج إلى قاعدة بيانات؟  
   - ما التبعيات بين الخدمات؟  

2. **متطلبات الأمان:**  
   - ما البيانات الحساسة التي يتعامل معها التطبيق؟  
   - ما متطلبات الامتثال لديك؟  
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
  
### **تمرين المختبر 5.1: تحدي إنشاء القالب**  

**التحدي**: إنشاء قالب AZD لتطبيق ذكاء اصطناعي لمعالجة المستندات.  

**المتطلبات:**  
- Microsoft Foundry Models لتحليل المحتوى  
- Document Intelligence للتعرف الضوئي على الحروف  
- حساب تخزين لتحميل المستندات  
- تطبيق دوال للمنطق المعالجة  
- تطبيق ويب لواجهة المستخدم  

**نقاط إضافية:**  
- إضافة معالجة الأخطاء المناسبة  
- تضمين تقدير التكلفة  
- إعداد لوحات مراقبة  

## الوحدة 6: استكشاف وحل المشاكل الشائعة  

### مشاكل النشر الشائعة  

#### المشكلة 1: تجاوز حصة خدمة OpenAI  
**الأعراض:** فشل النشر مع خطأ الحصة  
**الحلول:**  
```bash
# تحقق من الحصص الحالية
az cognitiveservices usage list --location eastus

# طلب زيادة الحصة أو جرب منطقة مختلفة
azd env set AZURE_LOCATION westus2
azd up
```
  
#### المشكلة 2: النموذج غير متاح في المنطقة  
**الأعراض:** فشل استجابات الذكاء الاصطناعي أو أخطاء نشر النموذج  
**الحلول:**  
```bash
# تحقق من توفر النموذج حسب المنطقة
az cognitiveservices model list --location eastus

# التحديث إلى النموذج المتاح
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
  
### مشاكل الأداء  

#### المشكلة 4: استجابات الذكاء الاصطناعي بطيئة  
**خطوات التحقيق:**  
1. راجع Application Insights لمقاييس الأداء  
2. راجع مقاييس خدمة OpenAI في بوابة Azure  
3. تحقق من اتصال الشبكة والزمن المستغرق  

**الحلول:**  
- تنفيذ التخزين المؤقت للاستعلامات الشائعة  
- استخدام نموذج OpenAI المناسب لحالة الاستخدام  
- النظر في نسخ قراءة لتحسين الحمل العالي  

### **تمرين المختبر 6.1: تحدي التصحيح**  

**السيناريو**: تم النشر بنجاح، لكن التطبيق يعيد أخطاء 500.  

**مهام التصحيح:**  
1. تحقق من سجلات التطبيق  
2. تحقق من اتصال الخدمة  
3. اختبر المصادقة  
4. راجع التكوين  

**الأدوات المستخدمة:**  
- `azd show` للحصول على نظرة عامة على النشر  
- بوابة Azure لسجلات خدمة مفصلة  
- Application Insights لقياس تطبيق  

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
# تنبيه لمعدل خطأ مرتفع
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
  
2. **تنفيذ ضوابط التكاليف:**  
- إعداد تنبيهات الميزانية  
- استخدام سياسات التوسع التلقائي  
- تنفيذ تخزين مؤقت للطلبات  
- مراقبة استخدام الرموز لـ OpenAI  

### **تمرين المختبر 7.1: تحسين الأداء**  

**المهمة**: حسّن تطبيق الذكاء الاصطناعي من حيث الأداء والتكلفة.  

**المقاييس للتحسين:**  
- تقليل متوسط زمن الاستجابة بنسبة 20%  
- تقليل التكاليف الشهرية بنسبة 15%  
- الحفاظ على توافر بنسبة 99.9%  

**الاستراتيجيات المُقترحة:**  
- تنفيذ التخزين المؤقت للاستجابة  
- تحسين الطلبات لكفاءة الرموز  
- استخدام SKUs الحوسبية المناسبة  
- إعداد التوسع التلقائي الصحيح  

## التحدي النهائي: التنفيذ الشامل  

### سيناريو التحدي  

كُلفت بإنشاء روبوت دردشة لخدمة العملاء مدعوم بالذكاء الاصطناعي وجاهز للإنتاج مع هذه المتطلبات:  

**المتطلبات الوظيفية:**  
- واجهة ويب لتفاعل العملاء  
- التكامل مع Microsoft Foundry Models للردود  
- قدرة البحث في المستندات باستخدام Azure AI Search  
- التكامل مع قاعدة بيانات العملاء الحالية  
- دعم متعدد اللغات  

**المتطلبات غير الوظيفية:**  
- التعامل مع 1000 مستخدم متزامن  
- اتفاقية مستوى الخدمة uptime 99.9%  
- الامتثال لـ SOC 2  
- التكلفة أقل من 500 دولار شهريًا  
- النشر لبيئات متعددة (تطوير، اختبار، إنتاج)  

### خطوات التنفيذ  

1. **تصميم الهيكلية**  
2. **إنشاء قالب AZD**  
3. **تنفيذ تدابير الأمان**  
4. **إعداد المراقبة والتنبيهات**  
5. **إنشاء خطوط أنابيب النشر**  
6. **توثيق الحل**  

### معايير التقييم  

- ✅ **الوظائف**: هل يلبي جميع المتطلبات؟  
- ✅ **الأمان**: هل تم تنفيذ أفضل الممارسات؟  
- ✅ **القابلية للتوسع**: هل يمكنه التعامل مع الحمل؟  
- ✅ **قابلية الصيانة**: هل الكود والبنية التحتية منظمة بشكل جيد؟  
- ✅ **التكلفة**: هل ضمن الميزانية؟  

## موارد إضافية  

### وثائق مايكروسوفت  
- [وثائق Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [وثائق خدمة Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [وثائق Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)  

### قوالب نموذجية  
- [تطبيق دردشة Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)  
- [بدأ سريع لتطبيق دردشة OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)  

- [دردشة Contoso](https://github.com/Azure-Samples/contoso-chat)

### موارد المجتمع
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [قوالب AZD الرائعة](https://azure.github.io/awesome-azd/)

## 🎓 شهادة إتمام

تهانينا! لقد أكملت ورشة عمل الذكاء الاصطناعي. يجب أن تكون الآن قادرًا على:

- ✅ تحويل تطبيقات الذكاء الاصطناعي الحالية إلى قوالب AZD
- ✅ نشر تطبيقات الذكاء الاصطناعي الجاهزة للإنتاج
- ✅ تنفيذ أفضل ممارسات الأمان لأعباء عمل الذكاء الاصطناعي
- ✅ مراقبة وتحسين أداء تطبيقات الذكاء الاصطناعي
- ✅ استكشاف المشكلات الشائعة في النشر وحلها

### الخطوات التالية
1. طبق هذه الأنماط على مشاريع الذكاء الاصطناعي الخاصة بك
2. ساهم بالقوالب للمجتمع
3. انضم إلى Microsoft Foundry Discord للحصول على الدعم المستمر
4. استكشف موضوعات متقدمة مثل نشر متعدد المناطق

---

**ملاحظات الورشة**: ساعدنا في تحسين هذه الورشة بمشاركة تجربتك في [قناة Azure على Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**التنقل في الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - تطوير AI-First
- **⬅️ السابق**: [نشر نموذج الذكاء الاصطناعي](ai-model-deployment.md)
- **➡️ التالي**: [أفضل ممارسات الإنتاج للذكاء الاصطناعي](production-ai-practices.md)
- **🚀 الفصل التالي**: [الفصل 3: التكوين](../chapter-03-configuration/configuration.md)

**هل تحتاج مساعدة؟** انضم إلى مجتمعنا للدعم والمناقشات حول AZD ونشر الذكاء الاصطناعي.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->