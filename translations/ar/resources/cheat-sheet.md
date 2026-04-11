# ورقة الغش للأوامر - أوامر AZD الأساسية

**مرجع سريع لجميع الفصول**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../README.md)
- **📖 بداية سريعة**: [الفصل 1: الأساس والبداية السريعة](../README.md#-chapter-1-foundation--quick-start)
- **🤖 أوامر الذكاء الاصطناعي**: [الفصل 2: التطوير الموجه بالذكاء الاصطناعي](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 متقدم**: [الفصل 4: البنية التحتية ككود](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## المقدمة

توفر ورقة الغش الشاملة هذه مرجعًا سريعًا لأكثر أوامر Azure Developer CLI استخدامًا، منظمة حسب الفئة مع أمثلة عملية. مثالية للبحث السريع أثناء التطوير، واستكشاف الأخطاء وإصلاحها، والعمليات اليومية مع مشاريع azd.

## أهداف التعلم

باستخدام ورقة الغش هذه، ستتمكن من:
- الوصول الفوري إلى أوامر Azure Developer CLI الأساسية وتركيبها
- فهم تنظيم الأوامر حسب الفئات الوظيفية وحالات الاستخدام
- الرجوع إلى أمثلة عملية لسيناريوهات التطوير والنشر الشائعة
- الوصول إلى أوامر استكشاف الأخطاء لإيجاد حلول سريعة للمشكلات
- العثور على خيارات التكوين والتخصيص المتقدمة بكفاءة
- تحديد أوامر إدارة البيئات وتدفقات العمل متعددة البيئات

## مخرجات التعلم

بالرجوع المنتظم إلى ورقة الغش هذه، ستتمكن من:
- تنفيذ أوامر azd بثقة دون الحاجة للرجوع إلى الوثائق الكاملة
- حل المشكلات الشائعة بسرعة باستخدام أوامر التشخيص المناسبة
- إدارة عدة بيئات وسيناريوهات نشر بكفاءة
- تطبيق ميزات azd المتقدمة وخيارات التكوين حسب الحاجة
- استكشاف مشكلات النشر باستخدام تسلسل أوامر منظم
- تحسين سير العمل من خلال الاستخدام الفعال لاختصارات azd والخيارات

## أوامر بدء الاستخدام

### المصادقة
```bash
# تسجيل الدخول إلى Azure عبر AZD
azd auth login

# تسجيل الدخول إلى Azure CLI (تستخدم AZD هذا في الخلفية)
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

# تهيئة من قالب
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# تهيئة في الدليل الحالي
azd init .

# تهيئة باسم مخصص
azd init --template todo-nodejs-mongo my-awesome-app
```

## أوامر النشر الأساسية

### سير عمل النشر الكامل
```bash
# نشر كل شيء (تهيئة + نشر)
azd up

# نشر مع تعطيل مطالبات التأكيد
azd up --confirm-with-no-prompt

# نشر إلى بيئة محددة
azd up --environment production

# نشر بمعلمات مخصصة
azd up --parameter location=westus2
```

### البنية التحتية فقط
```bash
# توفير موارد Azure
azd provision

# 🧪 معاينة تغييرات البنية التحتية
azd provision --preview
# يعرض معاينة تجريبية لما سيتم إنشاؤه/تعديله/حذفه من الموارد
# مماثل لأمر 'terraform plan' أو 'bicep what-if' - آمن للتشغيل، لن يتم تطبيق أي تغييرات
```

### التطبيق فقط
```bash
# نشر شفرة التطبيق
azd deploy

# نشر خدمة محددة
azd deploy --service web
azd deploy --service api

# نشر جميع الخدمات
azd deploy --all
```

### البناء والتغليف
```bash
# بناء تطبيقات
azd package

# بناء خدمة محددة
azd package --service api
```

## 🌍 إدارة البيئة

### عمليات البيئة
```bash
# عرض جميع البيئات
azd env list

# إنشاء بيئة جديدة
azd env new development
azd env new staging --location westus2

# اختر البيئة
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
# قائمة جميع التكوينات
azd config show

# تعيين الإعدادات الافتراضية العامة
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# إزالة التكوين
azd config unset defaults.location

# إعادة تعيين جميع التكوينات
azd config reset
```

### تكوين المشروع
```bash
# التحقق من ملف azure.yaml
azd config validate

# عرض معلومات المشروع
azd show

# الحصول على نقاط نهاية الخدمة
azd show --output json
```

## 📊 المراقبة والتشخيص

### لوحة المراقبة
```bash
# افتح لوحة معلومات المراقبة في بوابة Azure
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

# الاستعلام عن السجلات باستخدام Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ أوامر الصيانة

### التنظيف
```bash
# إزالة جميع موارد Azure
azd down

# حذف قسري دون تأكيد
azd down --force

# حذف نهائي للموارد المحذوفة مؤقتًا
azd down --purge

# تنظيف كامل
azd down --force --purge
```

### التحديثات
```bash
# التحقق من وجود تحديثات azd
azd version

# الحصول على الإصدار الحالي
azd version

# عرض التكوين الحالي
azd config show
```

## 🔧 أوامر متقدمة

### خطوط الأنابيب وCI/CD
```bash
# تكوين GitHub Actions
azd pipeline config

# تكوين Azure DevOps
azd pipeline config --provider azdo

# عرض تكوين خط الأنابيب
azd pipeline show
```

### إدارة البنية التحتية
```bash
# توليد قوالب البنية التحتية
azd infra generate

# 🧪 معاينة وتخطيط البنية التحتية
azd provision --preview
# يحاكي توفير البنية التحتية دون نشرها
# يقوم بتحليل قوالب Bicep/Terraform ويعرض:
# - الموارد التي ستُضاف (باللون الأخضر +)
# - الموارد التي سيتم تعديلها (باللون الأصفر ~)
# - الموارد التي سيتم حذفها (باللون الأحمر -)
# آمن للتشغيل - لا تُجرى أي تغييرات فعلية على بيئة Azure

# توليد البنية التحتية من azure.yaml
azd infra synth
```

### معلومات المشروع
```bash
# عرض حالة المشروع ونقاط النهاية
azd show

# عرض معلومات المشروع التفصيلية بصيغة JSON
azd show --output json

# الحصول على نقاط نهاية الخدمة
azd show --output json | jq '.services'
```

## 🤖 أوامر الذكاء الاصطناعي والملحقات

### ملحقات AZD
```bash
# اعرض جميع الإضافات المتاحة (بما في ذلك الذكاء الاصطناعي)
azd extension list

# ثبت امتداد وكلاء Foundry
azd extension install azure.ai.agents

# ثبت امتداد الضبط الدقيق
azd extension install azure.ai.finetune

# ثبت امتداد النماذج المخصصة
azd extension install azure.ai.models

# قم بترقية جميع الإضافات المثبتة
azd extension upgrade --all
```

### أوامر وكلاء الذكاء الاصطناعي
```bash
# تهيئة مشروع وكيل من ملف المانيفست
azd ai agent init -m <manifest-path-or-uri>

# استهداف مشروع Foundry محدد
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# تحديد دليل مصدر الوكيل
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# اختيار هدف الاستضافة
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### خادم MCP (ألفا)
```bash
# ابدأ خادم MCP لمشروعك
azd mcp start

# إدارة موافقة الأداة لعمليات MCP
azd copilot consent list
```

### توليد البنية التحتية
```bash
# إنشاء ملفات البنية التحتية كرمز من تعريف مشروعك
azd infra generate

# توليد البنية التحتية من azure.yaml
azd infra synth
```

---

## 🎯 مسارات عمل سريعة

### سير عمل التطوير
```bash
# ابدأ مشروعًا جديدًا
azd init --template todo-nodejs-mongo
cd my-project

# انشر إلى بيئة التطوير
azd env new dev
azd up

# أجرِ التغييرات وأعد النشر
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

# النشر إلى بيئة التطوير
azd env select dev
azd up

# الاختبار والترقية إلى بيئة المعاينة
azd env select staging
azd up

# النشر إلى الإنتاج
azd env select production
azd up
```

### سير عمل استكشاف الأخطاء وإصلاحها
```bash
# تمكين وضع التصحيح
export AZD_DEBUG=true

# التحقق من حالة النشر
azd show

# التحقق من صحة التكوين
azd config show

# افتح لوحة المراقبة لعرض السجلات
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

# تعطيل القياس عن بُعد للحصول على مخرجات أنظف
export AZD_DISABLE_TELEMETRY=true

# التحقق من التكوين الحالي
azd config show

# التحقق من حالة المصادقة
az account show
```

### تصحيح القوالب
```bash
# قائمة القوالب المتاحة مع التفاصيل
azd template list --output json

# عرض معلومات القالب
azd template show <template-name>

# التحقق من صحة القالب قبل التهيئة
azd template validate <template-name>
```

## 📁 أوامر الملفات والمجلدات

### هيكل المشروع
```bash
# عرض بنية الدليل الحالي
tree /f  # ويندوز
find . -type f  # لينوكس / ماك أو إس

# انتقل إلى جذر مشروع azd
cd $(azd root)

# عرض دليل تكوين azd
echo $AZD_CONFIG_DIR  # عادةً ~/.azd
```

## 🎨 تنسيق المخرجات

### مخرجات JSON
```bash
# الحصول على مخرجات JSON للبرمجة النصية
azd show --output json
azd env list --output json
azd config show --output json

# حلل باستخدام jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### مخرجات الجدول
```bash
# عرض كجدول
azd env list --output table

# عرض الخدمات المنشورة
azd show --output json | jq '.services | keys'
```

## 🔧 تركيبات الأوامر الشائعة

### نص فحص الصحة
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
# قارن البيئات
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### نص تنظيف الموارد
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
# استعادة النشر الفاشل - تنظيف وإعادة نشر
azd down --force --purge
azd up

# إعادة توفير البنية التحتية فقط
azd provision

# إعادة نشر التطبيق فقط
azd deploy
```

## 💡 نصائح احترافية

### اختصارات للتسريع في سير العمل
```bash
# أضفها إلى ملف .bashrc أو .zshrc الخاص بك
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

### الحصول على المساعدة
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

# اعرض وثائق القالب
azd template show <template-name> --docs
```

---

**نصيحة**: احفظ هذه الورقة في المفضلة واستخدم `Ctrl+F` للعثور بسرعة على الأوامر التي تحتاجها!

---

**التنقل**
- **الدرس السابق**: [فحوصات ما قبل النشر](../docs/pre-deployment/preflight-checks.md)
- **الدرس التالي**: [مسرد المصطلحات](glossary.md)

---

> **💡 هل تريد مساعدة بأوامر Azure داخل محررك؟** Install [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) with `npx skills add microsoft/github-copilot-for-azure` — 37 مهارة للذكاء الاصطناعي وFoundry والنشر والتشخيص والمزيد.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**إخلاء المسؤولية**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم بأن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر المعتمد. للمعلومات الحرجة، يُنصح بالاعتماد على ترجمة بشرية مهنية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة ناتجة عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->