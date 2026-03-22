# ورقة غش للأوامر - أوامر AZD الأساسية

**مرجع سريع لجميع الفصول**
- **📚 Course Home**: [AZD للمبتدئين](../README.md)
- **📖 Quick Start**: [الفصل 1: الأساس والبدء السريع](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [الفصل 2: تطوير يركز على الذكاء الاصطناعي (موصى به لمطوري الذكاء الاصطناعي)](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [الفصل 4: البنية التحتية ككود](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## المقدمة

تقدم ورقة الغش هذه مرجعًا سريعًا لأوامر Azure Developer CLI الأكثر استخدامًا، منظمة حسب الفئات مع أمثلة عملية. مثالية للبحث السريع أثناء التطوير، واستكشاف الأخطاء وإصلاحها، والعمليات اليومية مع مشاريع azd.

## أهداف التعلم

باستخدام ورقة الغش هذه، سوف:
- تحصل على وصول فوري إلى أوامر azd الأساسية وبناء الجملة
- تفهم تنظيم الأوامر حسب الفئات الوظيفية وحالات الاستخدام
- ترجع إلى أمثلة عملية لسيناريوهات التطوير والنشر الشائعة
- تصل إلى أوامر استكشاف الأخطاء وإصلاحها لحل المشكلات بسرعة
- تجد خيارات التكوين والتخصيص المتقدمة بكفاءة
- تحدد أوامر إدارة البيئة وسير العمل متعدد البيئات

## نتائج التعلم

من خلال الرجوع المنتظم إلى ورقة الغش هذه، ستكون قادرًا على:
- تنفيذ أوامر azd بثقة دون الحاجة إلى الرجوع إلى الوثائق الكاملة
- حل المشكلات الشائعة بسرعة باستخدام أوامر التشخيص المناسبة
- إدارة بيئات ونماذج نشر متعددة بكفاءة
- تطبيق ميزات azd المتقدمة وخيارات التكوين حسب الحاجة
- استكشاف مشكلات النشر باستخدام تسلسلات أوامر منهجية
- تحسين سير العمل من خلال الاستخدام الفعال لاختصارات وخيارات azd

## أوامر البدء

### المصادقة
```bash
# تسجيل الدخول إلى Azure عبر AZD
azd auth login

# تسجيل الدخول إلى Azure CLI (يستخدم AZD هذا ضمنيًا)
az login

# تحقق من الحساب الحالي
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

# نشر مع تعطيل مطالبات التأكيد
azd up --confirm-with-no-prompt

# نشر إلى بيئة محددة
azd up --environment production

# نشر باستخدام معلمات مخصصة
azd up --parameter location=westus2
```

### البنية التحتية فقط
```bash
# توفير موارد Azure
azd provision

# 🧪 معاينة تغييرات البنية التحتية
azd provision --preview
# يعرض معاينة (تشغيل تجريبي) لما سيتم إنشاؤه/تعديله/حذفه من الموارد
# مماثل لـ 'terraform plan' أو 'bicep what-if' - آمن للتشغيل، لن يتم تطبيق أي تغييرات
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

## 🌍 إدارة البيئات

### عمليات البيئة
```bash
# عرض جميع البيئات
azd env list

# إنشاء بيئة جديدة
azd env new development
azd env new staging --location westus2

# اختر البيئة
azd env select production

# عرض البيئة الحالية
azd env show

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

## ⚙️ أوامر التهيئة

### التهيئة العامة
```bash
# عرض جميع الإعدادات
azd config list

# تعيين الإعدادات الافتراضية العامة
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# إزالة التكوين
azd config unset defaults.location

# إعادة تعيين جميع الإعدادات
azd config reset
```

### تهيئة المشروع
```bash
# التحقق من صحة ملف azure.yaml
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
# إزالة جميع موارد Azure
azd down

# الحذف القسري دون تأكيد
azd down --force

# إزالة نهائية للموارد المحذوفة مؤقتًا
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
azd config list
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
# يحاكي توفير البنية التحتية دون النشر
# يحلل قوالب Bicep/Terraform ويعرض:
# - الموارد التي ستُضاف (أخضر +)
# - الموارد التي ستُعدل (أصفر ~)
# - الموارد التي ستُحذف (أحمر -)
# آمن للتشغيل - لا تُجرى تغييرات فعلية على بيئة Azure

# توليف البنية التحتية من azure.yaml
azd infra synth
```

### معلومات المشروع
```bash
# إظهار حالة المشروع ونقاط النهاية
azd show

# إظهار معلومات المشروع التفصيلية بصيغة JSON
azd show --output json

# الحصول على نقاط النهاية للخدمة
azd show --output json | jq '.services'
```

## 🤖 أوامر الذكاء الاصطناعي والملحقات

### امتدادات AZD
```bash
# سرد جميع الإضافات المتاحة (بما في ذلك الذكاء الاصطناعي)
azd extension list

# تثبيت إضافة وكلاء Foundry
azd extension install azure.ai.agents

# تثبيت إضافة الضبط الدقيق
azd extension install azure.ai.finetune

# تثبيت إضافة النماذج المخصصة
azd extension install azure.ai.models

# ترقية جميع الإضافات المثبتة
azd extension upgrade --all
```

### أوامر وكلاء الذكاء الاصطناعي
```bash
# تهيئة مشروع وكيل من ملف البيان
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
# قم بتشغيل خادم MCP لمشروعك
azd mcp start

# قم بإدارة موافقة الأداة لعمليات MCP
azd mcp consent
```

### توليد البنية التحتية
```bash
# توليد ملفات البنية التحتية ككود من تعريف مشروعك
azd infra generate

# توليد البنية التحتية من azure.yaml
azd infra synth
```

---

## 🎯 تدفقات العمل السريعة

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

# اختبار والترقية إلى بيئة المعاينة
azd env select staging
azd up

# نشر إلى بيئة الإنتاج
azd env select production
azd up
```

### سير عمل استكشاف الأخطاء
```bash
# تمكين وضع التصحيح
export AZD_DEBUG=true

# التحقق من حالة النشر
azd show

# التحقق من التكوين
azd config list

# فتح لوحة المراقبة للسجلات
azd monitor --logs

# التحقق من حالة الموارد
azd show --output json
```

## 🔍 أوامر تصحيح الأخطاء

### معلومات التصحيح
```bash
# تفعيل مخرجات التصحيح
export AZD_DEBUG=true
azd <command> --debug

# تعطيل جمع القياسات عن بعد للحصول على مخرجات أنظف
export AZD_DISABLE_TELEMETRY=true

# التحقق من التكوين الحالي
azd config list

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

## 📁 أوامر الملفات والدلائل

### هيكل المشروع
```bash
# عرض هيكل الدليل الحالي
tree /f  # ويندوز
find . -type f  # لينكس/ماك أو إس

# انتقل إلى جذر مشروع azd
cd $(azd root)

# عرض دليل تكوين azd
echo $AZD_CONFIG_DIR  # عادةً ~/.azd
```

## 🎨 تنسيق المخرجات

### مخرجات JSON
```bash
# احصل على مخرجات JSON للبرمجة النصية
azd show --output json
azd env list --output json
azd config list --output json

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

## 🔧 تراكيب أوامر شائعة

### سكربت فحص الحالة
```bash
#!/bin/bash
# فحص صحي سريع
azd show
azd env show
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

### سكربت تنظيف الموارد
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
# استعادة بعد فشل النشر - تنظيف وإعادة النشر
azd down --force --purge
azd up

# إعادة توفير البنية التحتية فقط
azd provision

# إعادة نشر التطبيق فقط
azd deploy
```

## 💡 نصائح احترافية

### الأسماء المستعارة لتسريع سير العمل
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
    azd env show
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

# عرض وثائق القالب
azd template show <template-name> --docs
```

---

**نصيحة**: اضف صفحة الغش هذه إلى المفضلة واستخدم `Ctrl+F` للعثور سريعًا على الأوامر التي تحتاجها!

---

**التنقل**
- **الدرس السابق**: [فحوصات ما قبل النشر](../docs/pre-deployment/preflight-checks.md)
- **الدرس التالي**: [مسرد المصطلحات](glossary.md)

---

> **💡 هل تريد مساعدة بأوامر Azure في محررك؟** قم بتثبيت [مهارات وكيل Microsoft Azure](https://skills.sh/microsoft/github-copilot-for-azure) باستخدام `npx skills add microsoft/github-copilot-for-azure` — 37 مهارة للذكاء الاصطناعي، وFoundry، والنشر، والتشخيص، والمزيد.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
إخلاء المسؤولية:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر المعتمد. للمعلومات الحساسة أو الحرجة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير خاطئ قد ينشأ عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->