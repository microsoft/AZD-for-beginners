# مشروعك الأول - درس عملي

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 1 - الأساسيات والبدء السريع
- **⬅️ السابق**: [Installation & Setup](installation.md)
- **➡️ التالي**: [Configuration](configuration.md)
- **🚀 الفصل التالي**: [الفصل 2: تطوير يركز على الذكاء الاصطناعي](../chapter-02-ai-development/microsoft-foundry-integration.md)

## مقدمة

مرحبًا بك في مشروعك الأول باستخدام Azure Developer CLI! يوفر هذا الدرس العملي الشامل شرحًا كاملاً لإنشاء ونشر وإدارة تطبيق كامل المكدس على Azure باستخدام azd. ستعمل على تطبيق مهام حقيقي يتضمن واجهة React أمامية، وواجهة برمجة تطبيقات Node.js في الخلفية، وقاعدة بيانات MongoDB.

## أهداف التعلم

من خلال إكمال هذا الدرس، ستتمكن من:
- إتقان سير عمل تهيئة مشروع azd باستخدام القوالب
- فهم هيكل مشروع Azure Developer CLI وملفات التكوين
- تنفيذ نشر كامل للتطبيق إلى Azure مع توفير البنية التحتية
- تنفيذ تحديثات التطبيق واستراتيجيات إعادة النشر
- إدارة بيئات متعددة للتطوير والتحضيري
- تطبيق ممارسات تنظيف الموارد وإدارة التكاليف

## مخرجات التعلم

عند الانتهاء، ستكون قادرًا على:
- تهيئة وتكوين مشاريع azd من القوالب بشكل مستقل
- التنقل وتعديل هياكل مشاريع azd بفعالية
- نشر تطبيقات كاملة المكدس إلى Azure باستخدام أوامر مفردة
- استكشاف مشكلات النشر الشائعة ومشكلات المصادقة وإصلاحها
- إدارة بيئات Azure متعددة لمراحل نشر مختلفة
- تنفيذ سير عمل النشر المستمر لتحديثات التطبيق

## البدء

### قائمة التحقق من المتطلبات المسبقة
- ✅ تم تثبيت Azure Developer CLI ([دليل التثبيت](installation.md))
- ✅ إتمام مصادقة AZD باستخدام `azd auth login`
- ✅ تم تثبيت Git على نظامك
- ✅ Node.js 16+ (لهذا الدرس)
- ✅ Visual Studio Code (مستحسن)

قبل المتابعة، شغل مدقق الإعداد من جذر المستودع:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### تحقق من إعدادك
```bash
# تحقق من تثبيت azd
azd version

# تحقق من مصادقة AZD
azd auth login --check-status
```

### تحقق من مصادقة Azure CLI الاختيارية

```bash
az account show
```

### تحقق من إصدار Node.js
```bash
node --version
```

## الخطوة 1: اختر وابدأ قالبًا

لنبدأ بقالب تطبيق مهام شائع يتضمن واجهة React أمامية وواجهة برمجة تطبيقات Node.js في الخلفية.

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
- تم تنزيل كود القالب إلى الدليل المحلي الخاص بك
- تم إنشاء ملف `azure.yaml` يحتوي على تعريفات الخدمات
- تم إعداد كود البنية التحتية في الدليل `infra/`
- تم إنشاء تكوين بيئة

## الخطوة 2: استكشف بنية المشروع

دعنا نفحص ما أنشأه azd لنا:

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

### الملفات الرئيسية لفهمها

**azure.yaml** - قلب مشروع azd الخاص بك:
```bash
# عرض تكوين المشروع
cat azure.yaml
```

**infra/main.bicep** - تعريف البنية التحتية:
```bash
# عرض شفرة البنية التحتية
head -30 infra/main.bicep
```

## الخطوة 3: خصص مشروعك (اختياري)

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

## الخطوة 4: انشر إلى Azure

والآن للجزء المثير - انشر كل شيء إلى Azure!

```bash
# نشر البنية التحتية والتطبيق
azd up

# سيقوم هذا الأمر بما يلي:
# 1. توفير موارد Azure (خدمة التطبيقات، Cosmos DB، إلخ.)
# 2. بناء تطبيقك
# 3. النشر إلى الموارد المُوفَّرة
# 4. عرض رابط التطبيق
```

### ما الذي يحدث أثناء النشر؟

ينفذ أمر `azd up` الخطوات التالية:
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

## الخطوة 5: اختبر تطبيقك

### الوصول إلى تطبيقك
انقر على عنوان URL المقدم في مخرجات النشر، أو احصل عليه في أي وقت:
```bash
# الحصول على نقاط نهاية التطبيق
azd show

# افتح التطبيق في متصفحك
azd show --output json | jq -r '.services.web.endpoint'
```

### اختبر تطبيق المهام
1. **أضف مهمة** - انقر على "إضافة مهمة" وأدخل مهمة
2. **وضع علامة كمكتمل** - ضع علامة على العناصر المكتملة
3. **حذف عناصر** - أزل المهام التي لم تعد بحاجة إليها

### راقب تطبيقك
```bash
# افتح بوابة Azure لمواردك
azd monitor

# عرض سجلات التطبيق
azd monitor --logs

# عرض المقاييس الحية
azd monitor --live
```

### ✅ تحقق من النشر الخاص بك

قبل المتابعة، مرّ بهذه القائمة السريعة للتأكد من أن كل شيء يعمل بالفعل—لا تفترض أن "نجح النشر" يعني "التطبيق يعمل":

```bash
# 1. تأكد من أن نقطة النهاية موجودة ويمكن الوصول إليها
azd show

# 2. اختبر نقطة النهاية بسرعة (من المتوقع استجابة HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. تحقق من نقطة النهاية الخاصة بالحالة الصحية إذا كان تطبيقك يوفر واحدة
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**يتم التحقق من النشر عندما:**
- ✅ `azd show` يعرض عنوان URL لنقطة نهاية يمكن الوصول إليها
- ✅ يفتح عنوان URL في متصفحك بدون أخطاء
- ✅ تعمل الميزات الأساسية (إضافة/وضع علامة كمكتمل/حذف مهمة)
- ✅ يعرض `azd monitor --logs` وصول الطلبات بدون أخطاء غير متوقعة

إذا فشل أي فحص، انتقل إلى [الفصل 7: استكشاف الأخطاء وإصلاحها](../chapter-07-troubleshooting/README.md).

## الخطوة 6: أجرِ تغييرات وأعد النشر

دعنا نجري تغييرًا ونرى مدى سهولة التحديث:

### عدل واجهة برمجة التطبيقات
```bash
# حرّر كود واجهة برمجة التطبيقات
code src/api/src/routes/lists.js
```

أضف رأس استجابة مخصص:
```javascript
// ابحث عن معالج المسار وأضف:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### انشر تغييرات الكود فقط
```bash
# انشر رمز التطبيق فقط (تجاوز البنية التحتية)
azd deploy

# هذا أسرع بكثير من 'azd up' لأن البنية التحتية موجودة بالفعل
```

## الخطوة 7: إدارة بيئات متعددة

أنشئ بيئة تحضيرية لاختبار التغييرات قبل الإنتاج:

```bash
# إنشاء بيئة تجريبية جديدة
azd env new staging

# النشر إلى بيئة الاختبار
azd up

# الرجوع إلى بيئة التطوير
azd env select dev

# عرض جميع البيئات
azd env list
```

### مقارنة بين البيئات
```bash
# عرض بيئة التطوير
azd env select dev
azd show

# عرض بيئة المعاينة
azd env select staging
azd show
```

## الخطوة 8: تنظيف الموارد

عندما تنتهي من التجربة، قم بالتنظيف لتجنب التكاليف المستمرة:

```bash
# حذف جميع موارد Azure للبيئة الحالية
azd down

# الحذف القسري دون تأكيد وحذف نهائي للموارد المحذوفة مؤقتًا
azd down --force --purge

# حذف بيئة محددة
azd env select staging
azd down --force --purge
```

## التطبيق الكلاسيكي مقابل التطبيق المدعوم بالذكاء الاصطناعي: نفس سير العمل

لقد نشرت للتو تطبيق ويب تقليدي. لكن ماذا لو أردت نشر تطبيق مدعوم بالذكاء الاصطناعي — مثل تطبيق دردشة مدعوم بنماذج Microsoft Foundry؟

الخبر الجيد: **سير العمل متماثل.**

| الخطوة | تطبيق المهام الكلاسيكي | تطبيق الدردشة بالذكاء الاصطناعي |
|------|-----------------|-------------|
| تهيئة | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| المصادقة | `azd auth login` | `azd auth login` |
| النشر | `azd up` | `azd up` |
| المراقبة | `azd monitor` | `azd monitor` |
| التنظيف | `azd down --force --purge` | `azd down --force --purge` |

الفرق الوحيد هو **القالب** الذي تبدأ منه. يتضمن قالب الذكاء الاصطناعي بنية تحتية إضافية (مثل مورد Microsoft Foundry Models أو فهرس AI Search)، لكن azd يتولى كل ذلك نيابةً عنك. لا تحتاج لتعلّم أوامر جديدة، أو تبني أداة مختلفة، أو تغيير كيفية تفكيرك حول النشر.

هذا هو المبدأ الأساسي لـ azd: **سير عمل واحد، أي عبء عمل.** المهارات التي مارستها في هذا الدرس — التهيئة، والنشر، والمراقبة، وإعادة النشر، والتنظيف — تنطبق بنفس القدر على تطبيقات ووكلاء الذكاء الاصطناعي.

---

## ما الذي تعلمته

تهانينا! لقد قمت بنجاح بما يلي:
- ✅ تهيئة مشروع azd من قالب
- ✅ استكشاف بنية المشروع والملفات الرئيسية
- ✅ نشر تطبيق كامل المكدس إلى Azure
- ✅ إجراء تغييرات على الكود وإعادة النشر
- ✅ إدارة بيئات متعددة
- ✅ تنظيف الموارد

## 🎯 تمارين التحقق من المهارة

### التمرين 1: نشر قالب مختلف (15 دقيقة)
**الهدف**: إظهار الإتقان في تهيئة azd وسير عمل النشر

```bash
# جرّب مكدس Python + MongoDB
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
- [ ] يمكن الوصول إلى عنوان URL للتطبيق في المتصفح
- [ ] يعمل التطبيق بشكل صحيح (إضافة/إزالة مهام)
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

# النشر باستخدام تكوين مخصص
azd up
```

**معايير النجاح:**
- [ ] تم إنشاء بيئة مخصصة بنجاح
- [ ] تم تعيين متغيرات البيئة ويمكن استرجاعها
- [ ] يتم نشر التطبيق بالتكوين المخصص
- [ ] يمكن التحقق من الإعدادات المخصصة في التطبيق المنشور

### التمرين 3: سير عمل متعدد البيئات (25 دقيقة)
**الهدف**: اتقان إدارة البيئات واستراتيجيات النشر

```bash
# إنشاء بيئة التطوير
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# تدوين عنوان URL لبيئة التطوير
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# إنشاء بيئة الاختبار
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# تدوين عنوان URL لبيئة الاختبار
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# مقارنة البيئتين
azd env list

# اختبار كلتا البيئتين
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# تنظيف كلتا البيئتين
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**معايير النجاح:**
- [ ] تم إنشاء بيئتين بتكوينات مختلفة
- [ ] تم نشر البيئتين بنجاح
- [ ] يمكن التبديل بين البيئات باستخدام `azd env select`
- [ ] تختلف متغيرات البيئة بين البيئات
- [ ] تم تنظيف كلا البيئتين بنجاح

## 📊 تقدمك

**الوقت المستثمر**: ~60-90 دقيقة  
**المهارات المكتسبة**:
- ✅ تهيئة المشاريع المعتمدة على القوالب
- ✅ توفير موارد Azure
- ✅ سير عمل نشر التطبيقات
- ✅ إدارة البيئات
- ✅ إدارة التكوين
- ✅ تنظيف الموارد وإدارة التكاليف

**المستوى التالي**: أنت جاهز لـ [دليل التكوين](configuration.md) لتعلّم نماذج تكوين متقدمة!

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
# تمكين تسجيل تصحيح الأخطاء
export AZD_DEBUG=true
azd up --debug

# عرض سجلات التطبيق في Azure
azd monitor --logs

# بالنسبة لتطبيقات الحاويات، استخدم Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### تعارض أسماء الموارد
```bash
# استخدم اسمًا فريدًا للبيئة
azd env new dev-$(whoami)-$(date +%s)
```

### مشكلات المنفذ/الشبكة
```bash
# تحقق مما إذا كانت المنافذ متاحة
netstat -an | grep :3000
netstat -an | grep :3100
```

## الخطوات التالية

الآن بعد أن أكملت مشروعك الأول، استكشف هذه المواضيع المتقدمة:

### 1. تخصيص البنية التحتية
- [البنية التحتية ككود](../chapter-04-infrastructure/provisioning.md)
- [إضافة قواعد بيانات، وتخزين، وخدمات أخرى](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. إعداد CI/CD
- [دليل النشر](../chapter-04-infrastructure/deployment-guide.md) - سير عمل CI/CD كامل
- [توثيق Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - تكوين خطوط الأنابيب

### 3. أفضل ممارسات الإنتاج
- [دليل النشر](../chapter-04-infrastructure/deployment-guide.md) - الأمن، والأداء، والمراقبة

### 4. استكشف المزيد من القوالب
```bash
# تصفح القوالب حسب الفئة
azd template list --filter web
azd template list --filter api
azd template list --filter database

# جرّب مكدسات تقنية مختلفة
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## موارد إضافية

### مواد تعليمية
- [توثيق Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مركز هندسة Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [إطار عمل Azure جيد التصميم](https://learn.microsoft.com/en-us/azure/well-architected/)

### المجتمع والدعم
- [مستودع Azure Developer CLI على GitHub](https://github.com/Azure/azure-dev)
- [مجتمع مطوري Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### القوالب والأمثلة
- [المعرض الرسمي للقوالب](https://azure.github.io/awesome-azd/)
- [قوالب المجتمع](https://github.com/Azure-Samples/azd-templates)
- [أنماط المؤسسات](https://github.com/Azure/azure-dev/tree/main/templates)

---

**تهانينا على إكمال مشروع azd الأول الخاص بك!** أنت الآن جاهز لبناء ونشر تطبيقات رائعة على Azure بثقة.

---

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 1 - الأساسيات والبدء السريع
- **⬅️ السابق**: [Installation & Setup](installation.md)
- **➡️ التالي**: [أحضر تطبيقك الخاص](bring-your-own-app.md)
- **🚀 الفصل التالي**: [الفصل 2: تطوير يركز على الذكاء الاصطناعي](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->