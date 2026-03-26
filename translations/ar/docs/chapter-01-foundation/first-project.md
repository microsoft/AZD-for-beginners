# مشروعك الأول - درس عملي

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 1 - الأساس والبدء السريع
- **⬅️ السابق**: [التثبيت والإعداد](installation.md)
- **➡️ التالي**: [التكوين](configuration.md)
- **🚀 الفصل التالي**: [الفصل 2: تطوير يركز على الذكاء الاصطناعي](../chapter-02-ai-development/microsoft-foundry-integration.md)

## مقدمة

مرحبًا بك في مشروعك الأول باستخدام Azure Developer CLI! يقدم هذا الدرس العملي الشامل شرحًا كاملًا لإنشاء ونشر وإدارة تطبيق متكامل على Azure باستخدام azd. ستعمل على تطبيق مهام حقيقي يتضمن واجهة أمامية React، وواجهة برمجة تطبيقات Node.js، وقاعدة بيانات MongoDB.

## أهداف التعلم

من خلال إكمال هذا الدرس، ستتمكن من:
- إتقان سير عمل تهيئة مشروع azd باستخدام القوالب
- فهم بنية مشروع Azure Developer CLI وملفات التكوين
- تنفيذ نشر التطبيق الكامل إلى Azure مع توفير البنية التحتية
- تنفيذ استراتيجيات تحديث وإعادة نشر التطبيق
- إدارة بيئات متعددة للتطوير ومرحلة الاختبار
- تطبيق ممارسات تنظيف الموارد وإدارة التكاليف

## مخرجات التعلم

عند الانتهاء، ستكون قادرًا على:
- تهيئة وتكوين مشاريع azd من القوالب بشكل مستقل
- التنقل وتعديل هياكل مشاريع azd بفعالية
- نشر تطبيقات متكاملة إلى Azure باستخدام أوامر واحدة
- استكشاف أخطاء النشر الشائعة ومشاكل المصادقة وإصلاحها
- إدارة بيئات Azure متعددة لمراحل نشر مختلفة
- تنفيذ سير عمل النشر المستمر لتحديثات التطبيق

## البدء

### قائمة المتطلبات الأساسية
- ✅ مثبت Azure Developer CLI ([دليل التثبيت](installation.md))
- ✅ مثبت ومصادق عليه Azure CLI
- ✅ Git مثبت على جهازك
- ✅ Node.js 16+ (لهذا الدرس)
- ✅ Visual Studio Code (موصى به)

### تحقق من إعدادك
```bash
# تحقق من تثبيت azd
azd version
```
### تحقق من مصادقة Azure

```bash
az account show
```

### التحقق من إصدار Node.js
```bash
node --version
```

## الخطوة 1: اختر وابدأ قالبًا

لنبدأ بقالب تطبيق مهام شائع يتضمن واجهة أمامية React وواجهة برمجة تطبيقات Node.js.

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
# - اختر منطقة: "East US 2" (أو المنطقة التي تفضلها)
```

### ماذا حدث للتو؟
- تم تنزيل كود القالب إلى دليلك المحلي
- تم إنشاء ملف `azure.yaml` مع تعريفات الخدمات
- تم إعداد كود البنية التحتية في دليل `infra/`
- تم إنشاء تكوين البيئة

## الخطوة 2: استكشاف هيكل المشروع

لنراجع ما أنشأه azd لنا:

```bash
# عرض بنية المشروع
tree /f   # ويندوز
# أو
find . -type f | head -20   # ماك أو إس/لينكس
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

### الملفات الأساسية التي يجب فهمها

**azure.yaml** - قلب مشروع azd الخاص بك:
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

قم بإجراء تغيير بسيط:
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

حان الجزء المثير - انشر كل شيء إلى Azure!

```bash
# نشر البنية التحتية والتطبيق
azd up

# سيقوم هذا الأمر بما يلي:
# 1. توفير موارد Azure (خدمة التطبيقات، Cosmos DB، إلخ.)
# 2. بناء تطبيقك
# 3. النشر إلى الموارد التي تم توفيرها
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
# احصل على نقاط نهاية التطبيق
azd show

# افتح التطبيق في متصفحك
azd show --output json | jq -r '.services.web.endpoint'
```

### اختبار تطبيق المهام
1. **إضافة عنصر مهام** - انقر "Add Todo" وأدخل مهمة
2. **وضع علامة كمكتمل** - علم العناصر المكتملة
3. **حذف عناصر** - إزالة المهام التي لم تعد بحاجة إليها

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

لنجري تغييرًا ونرى مدى سهولة التحديث:

### تعديل واجهة برمجة التطبيقات
```bash
# حرر شفرة واجهة برمجة التطبيقات
code src/api/src/routes/lists.js
```

أضف رأس استجابة مخصص:
```javascript
// اعثر على معالج المسار وأضف:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### نشر تغييرات الكود فقط
```bash
# انشر كود التطبيق فقط (تخطي البنية التحتية)
azd deploy

# هذا أسرع بكثير من 'azd up' لأن البنية التحتية موجودة بالفعل
```

## الخطوة 7: إدارة بيئات متعددة

قم بإنشاء بيئة staging لاختبار التغييرات قبل الإنتاج:

```bash
# إنشاء بيئة تجريبية جديدة
azd env new staging

# النشر إلى البيئة التجريبية
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

# عرض بيئة ما قبل الإنتاج
azd env select staging
azd show
```

## الخطوة 8: تنظيف الموارد

عندما تنتهي من التجربة، قم بالتنظيف لتجنب التكاليف المستمرة:

```bash
# حذف كل موارد Azure للبيئة الحالية
azd down

# الحذف بالقوة دون تأكيد ومسح الموارد المحذوفة مؤقتًا
azd down --force --purge

# حذف بيئة محددة
azd env select staging
azd down --force --purge
```

## تطبيق كلاسيكي مقابل تطبيق مدعوم بالذكاء الاصطناعي: نفس سير العمل

لقد قمت للتو بنشر تطبيق ويب تقليدي. ولكن ماذا لو أردت نشر تطبيق مدعوم بالذكاء الاصطناعي بدلاً من ذلك—على سبيل المثال، تطبيق دردشة مدعوم بنماذج Microsoft Foundry؟

الخبر الجيد: **سير العمل متماثل.**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

الاختلاف الوحيد هو **القالب** الذي تبدأ منه. يتضمن قالب الذكاء الاصطناعي بنية تحتية إضافية (مثل مورد نماذج Microsoft Foundry أو فهرس AI Search)، لكن azd يتولى كل ذلك نيابة عنك. لست بحاجة لتعلم أوامر جديدة، أو اعتماد أداة مختلفة، أو تغيير طريقة تفكيرك حول النشر.

هذا هو المبدأ الأساسي لـ azd: **سير عمل واحد، أي عبء عمل.** المهارات التي مارستها في هذا الدرس—التهيئة، والنشر، والمراقبة، وإعادة النشر، والتنظيف—تنطبق بنفس القدر على تطبيقات ووكلاء الذكاء الاصطناعي.

---

## ما الذي تعلمته

تهانينا! لقد نجحت في:
- ✅ تهيئة مشروع azd من قالب
- ✅ استكشاف هيكل المشروع والملفات الأساسية
- ✅ نشر تطبيق متكامل إلى Azure
- ✅ إجراء تغييرات على الكود وإعادة النشر
- ✅ إدارة بيئات متعددة
- ✅ تنظيف الموارد

## 🎯 تمارين التحقق من المهارة

### التمرين 1: نشر قالب مختلف (15 دقيقة)
**الهدف**: إثبات الإتقان لأمر `azd init` وسير عمل النشر

```bash
# جرّب مكدس بايثون و MongoDB
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
- [ ] يتم نشر التطبيق بدون أخطاء
- [ ] يمكن الوصول إلى عنوان تطبيق في المتصفح
- [ ] التطبيق يعمل بشكل صحيح (إضافة/إزالة المهام)
- [ ] تم تنظيف جميع الموارد بنجاح

### التمرين 2: تخصيص التكوين (20 دقيقة)
**الهدف**: ممارسة تكوين متغيرات البيئة

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

# نشر باستخدام تكوين مخصص
azd up
```

**معايير النجاح:**
- [ ] تم إنشاء بيئة مخصصة بنجاح
- [ ] تم تعيين متغيرات البيئة ويمكن استرجاعها
- [ ] يتم نشر التطبيق بالتكوين المخصص
- [ ] يمكن التحقق من الإعدادات المخصصة في التطبيق المنشور

### التمرين 3: سير عمل متعدد البيئات (25 دقيقة)
**الهدف**: إتقان إدارة البيئات واستراتيجيات النشر

```bash
# أنشئ بيئة التطوير
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# دوّن رابط بيئة التطوير
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# أنشئ بيئة المعاينة
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# دوّن رابط بيئة المعاينة
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# قارن البيئات
azd env list

# اختبر البيئتين
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# نظف البيئتين
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**معايير النجاح:**
- [ ] تم إنشاء بيئتين بتكوينات مختلفة
- [ ] تم نشر كلتا البيئتين بنجاح
- [ ] يمكن التبديل بين البيئات باستخدام `azd env select`
- [ ] تختلف متغيرات البيئة بين البيئات
- [ ] تم تنظيف كلتا البيئتين بنجاح

## 📊 تقدمك

**الوقت المستثمر**: ~60-90 دقيقة  
**المهارات المكتسبة**:
- ✅ تهيئة المشاريع بناءً على القوالب
- ✅ توفير موارد Azure
- ✅ سير عمل نشر التطبيقات
- ✅ إدارة البيئات
- ✅ إدارة التكوين
- ✅ تنظيف الموارد وإدارة التكاليف

**المستوى التالي**: أنت جاهز لقراءة [دليل التكوين](configuration.md) لتعلم أنماط التكوين المتقدمة!

## استكشاف المشكلات الشائعة

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

# بالنسبة لتطبيقات الحاويات، استخدم Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### تعارض أسماء الموارد
```bash
# استخدم اسم بيئة فريد
azd env new dev-$(whoami)-$(date +%s)
```

### مشاكل المنفذ/الشبكة
```bash
# تحقق مما إذا كانت المنافذ متاحة
netstat -an | grep :3000
netstat -an | grep :3100
```

## الخطوات التالية

الآن بعد أن أكملت مشروعك الأول، استكشف هذه الموضوعات المتقدمة:

### 1. تخصيص البنية التحتية
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [إضافة قواعد بيانات وتخزين وخدمات أخرى](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. إعداد CI/CD
- [دليل النشر](../chapter-04-infrastructure/deployment-guide.md) - سير عمل CI/CD الكامل
- [توثيق Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - تكوين الأنابيب

### 3. أفضل ممارسات الإنتاج
- [دليل النشر](../chapter-04-infrastructure/deployment-guide.md) - الأمان والأداء والمراقبة

### 4. استكشاف المزيد من القوالب
```bash
# تصفّح القوالب حسب الفئة
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
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### المجتمع والدعم
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### القوالب والأمثلة
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**تهانينا على إكمال مشروع azd الأول الخاص بك!** أنت الآن جاهز لبناء ونشر تطبيقات مذهلة على Azure بثقة.

---

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 1 - الأساس والبدء السريع
- **⬅️ السابق**: [التثبيت والإعداد](installation.md)
- **➡️ التالي**: [التكوين](configuration.md)
- **🚀 الفصل التالي**: [الفصل 2: تطوير يركز على الذكاء الاصطناعي](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **الدرس التالي**: [دليل النشر](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
إخلاء المسؤولية:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية بالذكاء الاصطناعي [Co-op Translator] (https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يُرجى ملاحظة أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار الوثيقة الأصلية بلغتها الأصلية المصدر المعتمد. للمعلومات الحرجة، يُنصح بالاستعانة بترجمة احترافية بشرية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة ناتجة عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->