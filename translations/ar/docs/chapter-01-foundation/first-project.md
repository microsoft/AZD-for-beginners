# مشروعك الأول - دليل عملي

**تنقّل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 1 - الأساسيات والبدء السريع
- **⬅️ السابق**: [التثبيت والإعداد](installation.md)
- **➡️ التالي**: [التكوين](configuration.md)
- **🚀 الفصل التالي**: [الفصل 2: تطوير مُركّز على الذكاء الاصطناعي](../chapter-02-ai-development/microsoft-foundry-integration.md)

## المقدمة

مرحبًا بك في مشروعك الأول باستخدام Azure Developer CLI! يقدّم هذا الدليل العملي الشامل شرحًا متكاملاً لإنشاء ونشر وإدارة تطبيق كامل على Azure باستخدام azd. ستعمل على تطبيق مهام حقيقي يتضمن واجهة أمامية React، وخادم API بـ Node.js، وقاعدة بيانات MongoDB.

## أهداف التعلم

بإكمال هذا الدليل، سوف:
- تتقن سير عمل تهيئة مشروع azd باستخدام القوالب
- تفهم بنية مشروع Azure Developer CLI وملفات التهيئة
- تنفذ نشر التطبيق الكامل إلى Azure مع توفير البنية التحتية
- تطبّق استراتيجيات تحديث التطبيق وإعادة النشر
- تدير بيئات متعددة للتطوير والاختبار
- تطبّق ممارسات تنظيف الموارد وإدارة التكاليف

## نتائج التعلم

عند الانتهاء، ستكون قادرًا على:
- تهيئة وتكوين مشاريع azd من القوالب بشكل مستقل
- التنقل وتعديل هياكل مشاريع azd بفعالية
- نشر تطبيقات كاملة إلى Azure بأوامر مفردة
- استكشاف مشاكل النشر والمصادقة الشائعة وإصلاحها
- إدارة بيئات Azure متعددة لمراحل نشر مختلفة
- تنفيذ سير عمل للتوزيع المستمر لتحديثات التطبيق

## البدء

### قائمة المتطلبات الأساسية
- ✅ تثبيت Azure Developer CLI ([دليل التثبيت](installation.md))
- ✅ إتمام مصادقة AZD باستخدام `azd auth login`
- ✅ تثبيت Git على نظامك
- ✅ Node.js 16+ (لهذا الدرس)
- ✅ Visual Studio Code (موصى به)

قبل المتابعة، شغّل مدقق الإعداد من جذر المستودع:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### التحقق من إعدادك
```bash
# تحقق من تثبيت azd
azd version

# تحقق من مصادقة AZD
azd auth login --check-status
```

### التحقّق من مصادقة Azure CLI الاختيارية

```bash
az account show
```

### التحقق من إصدار Node.js
```bash
node --version
```

## الخطوة 1: اختيار وتهيئة قالب

لنبدأ بقالب تطبيق مهام شائع يتضمن واجهة أمامية React وخلفية API بـ Node.js.

```bash
# تصفح القوالب المتاحة
azd template list

# تهيئة قالب تطبيق المهام
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# اتبع المطالبات:
# - أدخل اسم البيئة: "dev"
# - اختر اشتراكًا (إذا كان لديك أكثر من واحد)
# - اختر منطقة: "East US 2" (أو المنطقة المفضلة لديك)
```

### ماذا حدث للتو؟
- تم تنزيل كود القالب إلى الدليل المحلي لديك
- تم إنشاء ملف `azure.yaml` مع تعريفات الخدمات
- تم إعداد كود البنية التحتية في الدليل `infra/`
- تم إنشاء تهيئة بيئة

## الخطوة 2: استكشاف بنية المشروع

لنستعرض ما أنشأه azd لنا:

```bash
# عرض بنية المشروع
tree /f   # ويندوز
# أو
find . -type f | head -20   # macOS/لينكس
```

يجب أن ترى:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### الملفات الرئيسية لفهمها

**azure.yaml** - جوهر مشروع azd الخاص بك:
```bash
# عرض تكوين المشروع
cat azure.yaml
```

**infra/main.bicep** - تعريف البنية التحتية:
```bash
# عرض كود البنية التحتية
head -30 infra/main.bicep
```

## الخطوة 3: تخصيص مشروعك (اختياري)

قبل النشر، يمكنك تخصيص التطبيق:

### تعديل الواجهة الأمامية
```bash
# افتح مكوّن تطبيق React
code src/web/src/App.tsx
```

أجرِ تغييرًا بسيطًا:
```typescript
// ابحث عن العنوان وقم بتغييره
<h1>My Awesome Todo App</h1>
```

### تكوين متغيرات البيئة
```bash
# تعيين متغيرات بيئة مخصصة
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# عرض جميع متغيرات البيئة
azd env get-values
```

## الخطوة 4: النشر إلى Azure

حان الوقت للجزء المثير - نشر كل شيء إلى Azure!

```bash
# نشر البنية التحتية والتطبيق
azd up

# سيقوم هذا الأمر بـ:
# 1. تهيئة موارد Azure (خدمة التطبيقات، Cosmos DB، إلخ.)
# 2. بناء تطبيقك
# 3. النشر إلى الموارد المهيأة
# 4. عرض عنوان URL الخاص بالتطبيق
```

### ماذا يحدث أثناء النشر؟

أمر `azd up` ينفذ هذه الخطوات:
1. **Provision** (`azd provision`) - ينشئ موارد Azure
2. **Package** - يبني كود التطبيق الخاص بك
3. **Deploy** (`azd deploy`) - ينشر الكود إلى موارد Azure

### المخرجات المتوقعة
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## الخطوة 5: اختبار تطبيقك

### الوصول إلى تطبيقك
انقر على عنوان URL المقدم في مخرجات النشر، أو احصل عليه في أي وقت:
```bash
# الحصول على نقاط نهاية التطبيق
azd show

# افتح التطبيق في متصفحك
azd show --output json | jq -r '.services.web.endpoint'
```

### اختبار تطبيق المهام
1. **إضافة عنصر مهمة** - انقر "Add Todo" وأدخل مهمة
2. **وضع علامة كمكتمل** - علّم العناصر المكتملة
3. **حذف عناصر** - أزل المهام التي لم تعد بحاجة إليها

### مراقبة تطبيقك
```bash
# افتح بوابة Azure لمواردك
azd monitor

# عرض سجلات التطبيق
azd monitor --logs

# عرض المقاييس الحية
azd monitor --live
```

## الخطوة 6: إجراء تغييرات وإعادة النشر

لنجرّب تغييرًا ونرى مدى سهولة التحديث:

### تعديل الـ API
```bash
# عدل كود واجهة برمجة التطبيقات
code src/api/src/routes/lists.js
```

أضف رأس استجابة مخصص:
```javascript
// ابحث عن معالج المسار وأضف:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### نشر تغييرات الكود فقط
```bash
# انشر شفرة التطبيق فقط (تخطي البنية التحتية)
azd deploy

# هذا أسرع بكثير من 'azd up' لأن البنية التحتية موجودة بالفعل
```

## الخطوة 7: إدارة بيئات متعددة

أنشئ بيئة تحضير لاختبار التغييرات قبل الإنتاج:

```bash
# إنشاء بيئة جديدة لما قبل الإنتاج
azd env new staging

# نشر إلى بيئة ما قبل الإنتاج
azd up

# العودة إلى بيئة التطوير
azd env select dev

# عرض جميع البيئات
azd env list
```

### مقارنة البيئات
```bash
# عرض بيئة التطوير
azd env select dev
azd show

# عرض بيئة الاختبار
azd env select staging
azd show
```

## الخطوة 8: تنظيف الموارد

عند الانتهاء من التجارب، قم بالتنظيف لتجنّب الرسوم المستمرة:

```bash
# حذف جميع موارد أزور للبيئة الحالية
azd down

# الحذف القسري دون تأكيد وإزالة نهائية للموارد المحذوفة مؤقتًا
azd down --force --purge

# حذف بيئة محددة
azd env select staging
azd down --force --purge
```

## تطبيق تقليدي مقابل تطبيق مدعوم بالذكاء الاصطناعي: نفس سير العمل

لقد نشرت تطبيق ويب تقليدي للتو. لكن ماذا لو أردت نشر تطبيق مدعوم بالذكاء الاصطناعي بدلاً من ذلك — مثل تطبيق دردشة مدعوم بنماذج Microsoft Foundry؟

الخبر السار: **سير العمل متماثل.**

| الخطوة | تطبيق المهام التقليدي | تطبيق دردشة بالذكاء الاصطناعي |
|------|-----------------|-------------|
| التهيئة | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| المصادقة | `azd auth login` | `azd auth login` |
| النشر | `azd up` | `azd up` |
| المراقبة | `azd monitor` | `azd monitor` |
| التنظيف | `azd down --force --purge` | `azd down --force --purge` |

الاختلاف الوحيد هو **القالب** الذي تبدأ منه. يتضمن قالب الذكاء الاصطناعي بنية تحتية إضافية (مثل مورد Microsoft Foundry Models أو فهرس Azure AI Search)، لكن azd يتعامل مع كل ذلك نيابةً عنك. لست بحاجة لتعلّم أوامر جديدة، أو اعتماد أداة مختلفة، أو تغيير طريقة تفكيرك حول النشر.

هذا هو المبدأ الأساسي لـ azd: **سير عمل واحد، أي حمل عمل.** المهارات التي مارستها في هذا الدرس — التهيئة، والنشر، والمراقبة، وإعادة النشر، والتنظيف — تنطبق بالمثل على تطبيقات ووكلاء الذكاء الاصطناعي.

---

## ما الذي تعلمته

تهانينا! لقد نجحت في:
- ✅ تهيئة مشروع azd من قالب
- ✅ استكشاف بنية المشروع والملفات الرئيسية
- ✅ نشر تطبيق كامل إلى Azure
- ✅ إجراء تغييرات على الكود وإعادة النشر
- ✅ إدارة بيئات متعددة
- ✅ تنظيف الموارد

## 🎯 تمارين التحقق من المهارة

### التمرين 1: نشر قالب مختلف (15 دقيقة)
**الهدف**: إثبات إتقان azd init وسير عمل النشر

```bash
# جرّب مكدس بايثون وMongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# تحقّق من النشر
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# نظّف
azd down --force --purge
```

**معايير النجاح:**
- [ ] تم نشر التطبيق بدون أخطاء
- [ ] يمكن الوصول إلى عنوان تطبيق الويب في المستعرض
- [ ] يعمل التطبيق بشكل صحيح (إضافة/إزالة مهام)
- [ ] تم تنظيف كل الموارد بنجاح

### التمرين 2: تخصيص التكوين (20 دقيقة)
**الهدف**: التدريب على تكوين متغيرات البيئة

```bash
cd my-first-azd-app

# إنشاء بيئة مخصصة
azd env new custom-config

# تعيين متغيرات مخصصة
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# التحقق من المتغيرات
azd env get-values | grep APP_TITLE

# النشر باستخدام تكوين مخصص
azd up
```

**معايير النجاح:**
- [ ] تم إنشاء بيئة مخصصة بنجاح
- [ ] تم تعيين متغيرات البيئة ويمكن استرجاعها
- [ ] ينشر التطبيق بتكوين مخصص
- [ ] يمكن التحقق من الإعدادات المخصصة في التطبيق المنشور

### التمرين 3: سير عمل متعدد البيئات (25 دقيقة)
**الهدف**: إتقان إدارة البيئات واستراتيجيات النشر

```bash
# إنشاء بيئة التطوير
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# تدوين عنوان URL لبيئة التطوير
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# إنشاء بيئة المعاينة
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# تدوين عنوان URL لبيئة المعاينة
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# مقارنة البيئات
azd env list

# اختبار البيئتين
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# تنظيف كلتا البيئتين
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**معايير النجاح:**
- [ ] تم إنشاء بيئتين بتكوينات مختلفة
- [ ] تم نشر كلتا البيئتين بنجاح
- [ ] يمكن التبديل بين البيئات باستخدام `azd env select`
- [ ] تختلف متغيرات البيئة بين البيئات
- [ ] تم تنظيف كلا البيئتين بنجاح

## 📊 تقدمك

**الوقت المستثمر**: ~60-90 دقيقة  
**المهارات المكتسبة**:
- ✅ تهيئة المشاريع بالاعتماد على القوالب
- ✅ توفير موارد Azure
- ✅ سير عمل نشر التطبيقات
- ✅ إدارة البيئات
- ✅ إدارة التكوين
- ✅ تنظيف الموارد وإدارة التكاليف

**المستوى التالي**: أنت جاهز لقراءة [دليل التكوين](configuration.md) لتعلّم أنماط التكوين المتقدمة!

## استكشاف المشكلات الشائعة وإصلاحها

### أخطاء المصادقة
```bash
# أعد المصادقة مع Azure
az login

# تحقق من الوصول إلى الاشتراك
az account show
```

### فشل النشر
```bash
# تمكين تسجيلات التصحيح
export AZD_DEBUG=true
azd up --debug

# عرض سجلات التطبيق في Azure
azd monitor --logs

# بالنسبة لتطبيقات الحاويات، استخدم واجهة سطر أوامر Azure:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### تضارب أسماء الموارد
```bash
# استخدم اسمًا فريدًا للبيئة
azd env new dev-$(whoami)-$(date +%s)
```

### مشاكل المنفذ/الشبكة
```bash
# تحقق مما إذا كانت المنافذ متاحة
netstat -an | grep :3000
netstat -an | grep :3100
```

## الخطوات التالية

الآن بعد أن أكملت مشروعك الأول، استكشف هذه المواضيع المتقدمة:

### 1. تخصيص البنية التحتية
- [البنية التحتية ككود](../chapter-04-infrastructure/provisioning.md)
- [إضافة قواعد بيانات وتخزين وخدمات أخرى](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. إعداد CI/CD
- [دليل النشر](../chapter-04-infrastructure/deployment-guide.md) - سير عمل CI/CD كامل
- [توثيق Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - تكوين خط الأنابيب

### 3. أفضل ممارسات الإنتاج
- [دليل النشر](../chapter-04-infrastructure/deployment-guide.md) - الأمان والأداء والمراقبة

### 4. استكشاف المزيد من القوالب
```bash
# تصفح القوالب حسب الفئة
azd template list --filter web
azd template list --filter api
azd template list --filter database

# جرّب مجموعات تقنيات مختلفة
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## موارد إضافية

### مواد تعليمية
- [توثيق Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مركز هندسة Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [إطار العمل الجيد التصميم لـ Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### المجتمع والدعم
- [Azure Developer CLI على GitHub](https://github.com/Azure/azure-dev)
- [مجتمع مطوري Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### القوالب والأمثلة
- [معرض القوالب الرسمي](https://azure.github.io/awesome-azd/)
- [قوالب المجتمع](https://github.com/Azure-Samples/azd-templates)
- [نماذج المؤسسات](https://github.com/Azure/azure-dev/tree/main/templates)

---

**تهانينا على إكمال مشروع azd الأول!** أنت الآن جاهز لبناء ونشر تطبيقات رائعة على Azure بثقة.

---

**تنقّل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 1 - الأساسيات والبدء السريع
- **⬅️ السابق**: [التثبيت والإعداد](installation.md)
- **➡️ التالي**: [التكوين](configuration.md)
- **🚀 الفصل التالي**: [الفصل 2: تطوير مُركّز على الذكاء الاصطناعي](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **الدرس التالي**: [دليل النشر](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لضمان الدقة، يُرجى ملاحظة أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر المعتمد. للمعلومات الحرجة، يُنصح بالاستعانة بترجمة بشرية محترفة. لسنا مسؤولين عن أي سوء فهم أو تفسيرات خاطئة تنشأ عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->