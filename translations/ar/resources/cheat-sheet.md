# قائمة أوامر مختصرة - أوامر AZD الأساسية

**مرجع سريع لجميع الفصول**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../README.md)
- **📖 البدء السريع**: [الفصل 1: الأساس والبدء السريع](../README.md#-chapter-1-foundation--quick-start)
- **🤖 أوامر الذكاء الاصطناعي**: [الفصل 2: التطوير الموجه بالذكاء الاصطناعي](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 متقدم**: [الفصل 4: البنية التحتية ككود](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## مقدمة

توفر هذه القائمة المختصرة الشاملة مرجعًا سريعًا لأكثر أوامر Azure Developer CLI استخدامًا، منظمة حسب الفئة مع أمثلة عملية. مثالية للبحث السريع أثناء التطوير واستكشاف الأخطاء وإصلاحها والعمليات اليومية مع مشاريع azd.

## أهداف التعلم

باستخدامك لهذه القائمة المختصرة، سوف:
- تحصل على وصول فوري إلى أوامر Azure Developer CLI الأساسية وبنية الأوامر
- تفهم تنظيم الأوامر حسب الفئات الوظيفية وحالات الاستخدام
- تستند إلى أمثلة عملية لسيناريوهات التطوير والنشر الشائعة
- تصل إلى أوامر استكشاف الأخطاء وإصلاحها لحل المشكلات بسرعة
- تجد خيارات التهيئة والتخصيص المتقدمة بكفاءة
- تحدد أوامر إدارة البيئات وسير العمل متعدد البيئات

## نواتج التعلم

من خلال الرجوع المنتظم إلى هذه القائمة المختصرة، ستتمكن من:
- تنفيذ أوامر azd بثقة دون الرجوع للتوثيق الكامل
- حل المشكلات الشائعة بسرعة باستخدام أوامر التشخيص المناسبة
- إدارة عدة بيئات وسيناريوهات نشر بكفاءة
- تطبيق ميزات azd المتقدمة وخيارات التهيئة حسب الحاجة
- استكشاف مشكلات النشر باستخدام تسلسل أوامر منهجي
- تحسين سير العمل من خلال الاستخدام الفعال للاختصارات وخيارات azd

## أوامر البدء

### المصادقة
```bash
# تسجيل الدخول إلى Azure عبر AZD
azd auth login

# تسجيل الدخول إلى Azure CLI (يستخدم AZD هذا في الخلفية)
az login

# التحقق من الحساب الحالي
az account show

# تعيين الاشتراك الافتراضي
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# تسجيل الخروج من AZD
azd auth logout

# تسجيل الخروج من Azure CLI
az logout
```

### تهيئة المشروع
```bash
# تصفح القوالب المتاحة
azd template list

# التهيئة من قالب
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# التهيئة في الدليل الحالي
azd init .

# التهيئة باسم مخصص
azd init --template todo-nodejs-mongo my-awesome-app
```

## أوامر النشر الأساسية

### سير عمل النشر الكامل
```bash
# نشر كل شيء (التهيئة + النشر)
azd up

# النشر مع تعطيل مطالبات التأكيد
azd up --confirm-with-no-prompt

# النشر إلى بيئة محددة
azd up --environment production

# النشر بمعلمات مخصصة
azd up --parameter location=westus2
```

### البنية التحتية فقط
```bash
# توفير موارد Azure
azd provision

# 🧪 معاينة تغييرات البنية التحتية
azd provision --preview
# يعرض معاينة تجريبية لما سيتم إنشاؤه/تعديله/حذفه من الموارد
# مماثل لـ 'terraform plan' أو 'bicep what-if' - آمن للتشغيل، لا يتم تطبيق أي تغييرات
```

### التطبيق فقط
```bash
# نشر كود التطبيق
azd deploy

# نشر خدمة محددة
azd deploy --service web
azd deploy --service api

# نشر جميع الخدمات
azd deploy --all
```

### البناء والحزمة
```bash
# استعادة (تنزيل) تبعيات التطبيق
azd restore

# استعادة خدمة محددة
azd restore --service api

# بناء حزمة قابلة للنشر دون نشرها
azd package

# بناء خدمة محددة
azd package --service api
```

> **`azd restore`** يقوم بتحميل تبعيات تطبيقك (npm، pip، NuGet، Maven، إلخ). يتم تشغيله تلقائيًا أثناء `azd package` و`azd deploy`، لذا نادرًا ما تستدعيه مباشرة — شغّله يدويًا لجلب التبعيات مسبقًا (على سبيل المثال، لتدفئة ذاكرة التخزين المؤقت لنظام CI أو للعمل دون اتصال لاحقًا).

> **`azd package`** ينشئ الأرتيفاكت القابل للنشر (صورة حاوية أو ملف zip) **دون** دفعه إلى Azure. استخدمه بمفرده للتحقق من نجاح البناء، أو لفحص المخرجات، أو لإنتاج أرتيفاكت ستقوم عملية منفصلة بنشره لاحقًا. تقوم `azd deploy` بالتغليف تلقائيًا، لذا تحتاج إلى `azd package` فقط عندما تريد الأرتيفاكت دون النشر.

## 🌍 إدارة البيئات

### عمليات البيئة
```bash
# عرض جميع البيئات
azd env list

# إنشاء بيئة جديدة
azd env new development
azd env new staging --location westus2

# تحديد بيئة
azd env select production

# عرض البيئات المتاحة
azd env list

# تحديث حالة البيئة
azd env refresh
```

### متغيرات البيئة
```bash
# تعيين متغير البيئة
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# الحصول على متغير البيئة
azd env get API_KEY

# عرض جميع متغيرات البيئة
azd env get-values

# إزالة متغير البيئة
azd env unset DEBUG
```

## ⚙️ أوامر التكوين

### التكوين العام
```bash
# عرض جميع التكوينات
azd config show

# تعيين الإعدادات الافتراضية العامة
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# إزالة التكوين
azd config unset defaults.location

# إعادة ضبط جميع التكوينات
azd config reset
```

### تكوين المشروع
```bash
# التحقق من صحة azure.yaml
azd config validate

# عرض معلومات المشروع
azd show

# الحصول على نقاط نهاية الخدمة
azd show --output json
```

## 📊 المراقبة والتشخيص

### لوحة المراقبة
```bash
# افتح لوحة المراقبة في بوابة Azure
azd monitor

# افتح المقاييس الحية في Application Insights
azd monitor --live

# افتح لوحة السجلات في Application Insights
azd monitor --logs

# افتح نظرة عامة على Application Insights
azd monitor --overview
```

### عرض سجلات الحاوية
```bash
# عرض السجلات عبر Azure CLI (لتطبيقات الحاويات)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# متابعة السجلات في الوقت الفعلي
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# عرض السجلات من بوابة Azure
azd monitor --logs
```

### استعلامات Log Analytics
```bash
# الوصول إلى تحليلات السجلات عبر بوابة Azure
azd monitor --logs

# استعلام السجلات باستخدام Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ أوامر الصيانة

### التنظيف
```bash
# إزالة كل موارد Azure
azd down

# حذف قسري بدون تأكيد
azd down --force

# تطهير الموارد المحذوفة مؤقتًا
azd down --purge

# تنظيف كامل
azd down --force --purge
```

### التحديثات
```bash
# التحقق من تحديثات azd
azd version

# الحصول على الإصدار الحالي
azd version

# عرض التكوين الحالي
azd config show
```

## 🔧 أوامر متقدمة

### خطوط الأنابيب وCI/CD
```bash
# تكوين إجراءات GitHub
azd pipeline config

# تكوين Azure DevOps
azd pipeline config --provider azdo

# عرض تكوين خط الأنابيب
azd pipeline show
```

### إدارة البنية التحتية
```bash
# إنشاء قوالب البنية التحتية
azd infra generate

# 🧪 معاينة وتخطيط البنية التحتية
azd provision --preview
# يحاكي توفير البنية التحتية دون نشرها
# يحلل قوالب Bicep/Terraform ويعرض:
# - الموارد التي سيتم إضافتها (أخضر +)
# - الموارد التي سيتم تعديلها (أصفر ~)
# - الموارد التي سيتم حذفها (أحمر -)
# آمن للتشغيل - لا تُجرى أي تغييرات فعلية على بيئة Azure

# توليف البنية التحتية من azure.yaml
azd infra synth
```

### معلومات المشروع
```bash
# عرض حالة المشروع ونقاط النهاية
azd show

# عرض معلومات المشروع المفصلة بتنسيق JSON
azd show --output json

# الحصول على نقاط نهاية الخدمة
azd show --output json | jq '.services'
```

## 🤖 أوامر الذكاء الاصطناعي والملحقات

### امتدادات AZD
```bash
# قائمة بجميع الامتدادات المتاحة (بما في ذلك الذكاء الاصطناعي)
azd extension list

# تثبيت امتداد وكلاء Foundry
azd extension install azure.ai.agents

# تثبيت امتداد مهارات الوكلاء (معاينة)
azd extension install azure.ai.skills

# تثبيت امتداد اتصالات Foundry (معاينة)
azd extension install azure.ai.connections

# تثبيت امتداد الضبط الدقيق
azd extension install azure.ai.finetune

# تثبيت امتداد النماذج المخصصة
azd extension install azure.ai.models

# ترقية جميع الامتدادات المثبتة
azd extension upgrade --all
```

### أوامر وكيل الذكاء الاصطناعي
```bash
# تهيئة مشروع وكيل من الملف الوصفي
azd ai agent init -m <manifest-path-or-uri>

# استهدف مشروع Foundry محدد
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# حدد دليل مصدر الوكيل
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# اختر هدف الاستضافة
azd ai agent init -m agent-manifest.yaml --host containerapp

# اختبر وكيلًا منشورًا (يطبع زمن الاستجابة + الزمن حتى البايت الأول)
azd ai agent invoke

# عرض تكوين نقطة النهاية الحية
azd ai agent endpoint show

# أنشئ مجموعة بيانات للتقييم، ثم حسّن الوكيل
azd ai agent eval generate
azd ai agent optimize

# قم بتنزيل المصدر المنشور لوكيل مستضاف قائم على الكود
azd ai agent code download

# حذف وكيل مستضاف وكل إصداراته (--force ينهي الجلسات النشطة)
azd ai agent delete --force
```

### خادم MCP (ألفا)
```bash
# ابدأ خادم MCP لمشروعك
azd mcp start

# إدارة موافقات الأدوات لعمليات MCP
azd copilot consent list
```

### إنشاء البنية التحتية
```bash
# توليد ملفات IaC من تعريف مشروعك
azd infra generate

# توليف البنية التحتية من azure.yaml
azd infra synth
```

---

## 🎯 سير العمل السريع

### سير عمل التطوير
```bash
# ابدأ مشروعًا جديدًا
azd init --template todo-nodejs-mongo
cd my-project

# انشر إلى بيئة التطوير
azd env new dev
azd up

# قم بإجراء تغييرات وأعد النشر
azd deploy

# افتح لوحة المراقبة
azd monitor --live
```

### سير عمل متعدد البيئات
```bash
# إعداد البيئات
azd env new dev
azd env new staging  
azd env new production

# نشر إلى بيئة التطوير
azd env select dev
azd up

# اختبار والترقية إلى بيئة ما قبل الإنتاج
azd env select staging
azd up

# نشر إلى الإنتاج
azd env select production
azd up
```

### سير عمل استكشاف الأخطاء وإصلاحها
```bash
# تفعيل وضع التصحيح
export AZD_DEBUG=true

# التحقق من حالة النشر
azd show

# التحقق من صحة التكوين
azd config show

# فتح لوحة المراقبة لعرض السجلات
azd monitor --logs

# التحقق من حالة الموارد
azd show --output json
```

## 🔍 أوامر التصحيح

### معلومات التصحيح
```bash
# تمكين إخراج التصحيح
export AZD_DEBUG=true
azd <command> --debug

# تعطيل القياسات عن بُعد للحصول على إخراج أنظف
export AZD_DISABLE_TELEMETRY=true

# التحقق من الإعدادات الحالية
azd config show

# التحقق من حالة المصادقة
az account show
```

### تصحيح القوالب
```bash
# عرض القوالب المتاحة مع التفاصيل
azd template list --output json

# عرض معلومات القالب
azd template show <template-name>

# التحقق من صحة القالب قبل التهيئة
azd template validate <template-name>
```

## 📁 أوامر الملفات والمجلدات

### هيكل المشروع
```bash
# عرض هيكل الدليل الحالي
tree /f  # ويندوز
find . -type f  # لينكس/ماك أو إس

# الانتقال إلى جذر مشروع azd
cd $(azd root)

# عرض دليل تكوين azd
echo $AZD_CONFIG_DIR  # عادةً ~/.azd
```

## 🎨 تنسيق المخرجات

### مخرجات JSON
```bash
# احصل على إخراج JSON للبرمجة النصية
azd show --output json
azd env list --output json
azd config show --output json

# قم بتحليلها باستخدام jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### مخرجات الجدول
```bash
# نسق كجدول
azd env list --output table

# عرض الخدمات المنشورة
azd show --output json | jq '.services | keys'
```

## 🔧 تراكيب الأوامر الشائعة

### برنامج فحص الصحة
```bash
#!/bin/bash
# فحص سريع للحالة
azd show
azd env get-values
azd monitor --logs
```

### التحقق من النشر
```bash
#!/bin/bash
# التحقق قبل النشر
azd show
azd provision --preview  # معاينة التغييرات قبل النشر
az account show
```

### مقارنة البيئات
```bash
#!/bin/bash
# مقارنة البيئات
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### برنامج تنظيف الموارد
```bash
#!/bin/bash
# تنظيف البيئات القديمة
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 متغيرات البيئة

### متغيرات البيئة الشائعة
```bash
# تكوين Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# تكوين AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# تكوين التطبيق
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 أوامر الطوارئ

### إصلاحات سريعة
```bash
# إعادة تعيين المصادقة
az account clear
az login

# فرض تحديث البيئة
azd env refresh

# إعادة نشر جميع الخدمات
azd deploy

# التحقق من حالة النشر
azd show --output json
```

### أوامر الاسترداد
```bash
# التعافي من فشل النشر - تنظيف وإعادة النشر
azd down --force --purge
azd up

# إعادة تهيئة البنية التحتية فقط
azd provision

# إعادة نشر التطبيق فقط
azd deploy
```

## 💡 نصائح احترافية

### أسماء مستعارة لتسريع سير العمل
```bash
# أضف إلى ملف .bashrc أو .zshrc الخاص بك
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### اختصارات الدوال
```bash
# التبديل السريع بين البيئات
azd-env() {
    azd env select $1 && azd show
}

# نشر سريع مع المراقبة
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# حالة البيئة
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 المساعدة والوثائق

### الحصول على مساعدة
```bash
# مساعدة عامة
azd --help
azd help

# مساعدة خاصة بالأمر
azd up --help
azd env --help
azd config --help

# عرض معلومات الإصدار والبناء
azd version
azd version --output json
```

### روابط الوثائق
```bash
# افتح الوثائق في المتصفح
azd docs

# عرض وثائق القالب
azd template show <template-name> --docs
```

---

**نصيحة**: احفظ هذه القائمة المرجعية واستخدم `Ctrl+F` للعثور بسرعة على الأوامر التي تحتاجها!

---

**التنقل**
- **الدرس السابق**: [فحوصات ما قبل النشر](../docs/pre-deployment/preflight-checks.md)
- **الدرس التالي**: [المعجم](glossary.md)

---

> **💡 هل تريد مساعدة أوامر Azure في محررك؟** قم بتثبيت [مهارات Microsoft Azure Agent](https://skills.sh/microsoft/github-copilot-for-azure) باستخدام `npx skills add microsoft/github-copilot-for-azure` — 37 مهارة للذكاء الاصطناعي وFoundry والنشر والتشخيص والمزيد.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->