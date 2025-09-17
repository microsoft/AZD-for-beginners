<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "88986b920b82d096f82d6583f5e0a6e6",
  "translation_date": "2025-09-17T18:22:40+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "ar"
}
-->
# أساسيات AZD - فهم Azure Developer CLI

# أساسيات AZD - المفاهيم الأساسية والمبادئ

**تنقل الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل الأول - الأساسيات والبداية السريعة
- **⬅️ السابق**: [نظرة عامة على الدورة](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ التالي**: [التثبيت والإعداد](installation.md)
- **🚀 الفصل التالي**: [الفصل الثاني: تطوير يعتمد على الذكاء الاصطناعي](../ai-foundry/azure-ai-foundry-integration.md)

## المقدمة

تقدم هذه الدرس أداة Azure Developer CLI (azd)، وهي أداة قوية تعتمد على سطر الأوامر لتسريع رحلتك من التطوير المحلي إلى النشر على Azure. ستتعرف على المفاهيم الأساسية، الميزات الرئيسية، وكيفية تبسيط azd لعملية نشر التطبيقات السحابية الأصلية.

## أهداف التعلم

بنهاية هذا الدرس، ستتمكن من:
- فهم ماهية Azure Developer CLI والغرض الأساسي منها
- تعلم المفاهيم الأساسية مثل القوالب، البيئات، والخدمات
- استكشاف الميزات الرئيسية بما في ذلك التطوير المعتمد على القوالب والبنية التحتية ككود
- فهم هيكل مشروع azd وسير العمل
- الاستعداد لتثبيت وتكوين azd لبيئة التطوير الخاصة بك

## نتائج التعلم

بعد إكمال هذا الدرس، ستتمكن من:
- شرح دور azd في سير عمل التطوير السحابي الحديث
- تحديد مكونات هيكل مشروع azd
- وصف كيفية عمل القوالب، البيئات، والخدمات معًا
- فهم فوائد البنية التحتية ككود باستخدام azd
- التعرف على أوامر azd المختلفة وأغراضها

## ما هو Azure Developer CLI (azd)؟

Azure Developer CLI (azd) هي أداة تعتمد على سطر الأوامر مصممة لتسريع رحلتك من التطوير المحلي إلى النشر على Azure. تبسط عملية بناء، نشر، وإدارة التطبيقات السحابية الأصلية على Azure.

## المفاهيم الأساسية

### القوالب
القوالب هي الأساس لـ azd. تحتوي على:
- **كود التطبيق** - كود المصدر والاعتمادات الخاصة بك
- **تعريفات البنية التحتية** - موارد Azure المعرفة باستخدام Bicep أو Terraform
- **ملفات التكوين** - الإعدادات والمتغيرات البيئية
- **سكربتات النشر** - سير عمل النشر الآلي

### البيئات
تمثل البيئات أهداف النشر المختلفة:
- **التطوير** - للاختبار والتطوير
- **التجريب** - بيئة ما قبل الإنتاج
- **الإنتاج** - بيئة الإنتاج الحية

كل بيئة تحتفظ بـ:
- مجموعة موارد Azure الخاصة بها
- إعدادات التكوين
- حالة النشر

### الخدمات
الخدمات هي اللبنات الأساسية لتطبيقك:
- **الواجهة الأمامية** - تطبيقات الويب، SPAs
- **الخلفية** - APIs، الخدمات المصغرة
- **قاعدة البيانات** - حلول تخزين البيانات
- **التخزين** - تخزين الملفات والكتل

## الميزات الرئيسية

### 1. التطوير المعتمد على القوالب
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. البنية التحتية ككود
- **Bicep** - لغة مخصصة لـ Azure
- **Terraform** - أداة بنية تحتية متعددة السحابات
- **ARM Templates** - قوالب مدير موارد Azure

### 3. سير العمل المتكامل
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. إدارة البيئات
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 هيكل المشروع

هيكل مشروع azd النموذجي:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 ملفات التكوين

### azure.yaml
الملف الرئيسي لتكوين المشروع:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
تكوين خاص بالبيئة:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 سير العمل الشائع

### بدء مشروع جديد
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### دورة التطوير
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## فهم `azd down --force --purge`
أمر `azd down --force --purge` هو طريقة قوية لإزالة بيئة azd بالكامل وجميع الموارد المرتبطة بها. إليك تفصيل لما يفعله كل علم:
```
--force
```
- يتخطى مطالبات التأكيد.
- مفيد للأتمتة أو السكربتات حيث لا يمكن الإدخال اليدوي.
- يضمن استمرار عملية الإزالة دون انقطاع، حتى إذا اكتشف CLI تناقضات.

```
--purge
```
يحذف **جميع البيانات الوصفية المرتبطة**، بما في ذلك:
حالة البيئة
المجلد المحلي `.azure`
معلومات النشر المؤقتة
يمنع azd من "تذكر" عمليات النشر السابقة، مما قد يسبب مشاكل مثل مجموعات الموارد غير المتطابقة أو مراجع السجل القديمة.

### لماذا استخدام كلاهما؟
عندما تواجه مشاكل مع `azd up` بسبب حالة متبقية أو عمليات نشر جزئية، يضمن هذا المزيج الحصول على **بداية نظيفة**.

يكون مفيدًا بشكل خاص بعد حذف الموارد يدويًا في بوابة Azure أو عند تبديل القوالب، البيئات، أو اصطلاحات تسمية مجموعات الموارد.

### إدارة البيئات المتعددة
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 أوامر التنقل

### الاكتشاف
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### إدارة المشاريع
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### المراقبة
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## أفضل الممارسات

### 1. استخدام أسماء ذات معنى
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. الاستفادة من القوالب
- ابدأ بالقوالب الموجودة
- خصصها حسب احتياجاتك
- أنشئ قوالب قابلة لإعادة الاستخدام لمؤسستك

### 3. عزل البيئات
- استخدم بيئات منفصلة للتطوير/التجريب/الإنتاج
- لا تقم بالنشر مباشرة إلى الإنتاج من الجهاز المحلي
- استخدم خطوط CI/CD للنشر إلى الإنتاج

### 4. إدارة التكوين
- استخدم المتغيرات البيئية للبيانات الحساسة
- احتفظ بالتكوين في التحكم بالإصدارات
- وثق الإعدادات الخاصة بالبيئة

## تقدم التعلم

### مبتدئ (الأسبوع 1-2)
1. تثبيت azd والمصادقة
2. نشر قالب بسيط
3. فهم هيكل المشروع
4. تعلم الأوامر الأساسية (up، down، deploy)

### متوسط (الأسبوع 3-4)
1. تخصيص القوالب
2. إدارة البيئات المتعددة
3. فهم كود البنية التحتية
4. إعداد خطوط CI/CD

### متقدم (الأسبوع 5+)
1. إنشاء قوالب مخصصة
2. أنماط بنية تحتية متقدمة
3. عمليات نشر متعددة المناطق
4. تكوينات على مستوى المؤسسات

## الخطوات التالية

**📖 متابعة تعلم الفصل الأول:**
- [التثبيت والإعداد](installation.md) - تثبيت azd وتكوينه
- [مشروعك الأول](first-project.md) - إكمال البرنامج التعليمي العملي
- [دليل التكوين](configuration.md) - خيارات التكوين المتقدمة

**🎯 جاهز للفصل التالي؟**
- [الفصل الثاني: تطوير يعتمد على الذكاء الاصطناعي](../ai-foundry/azure-ai-foundry-integration.md) - البدء في بناء تطبيقات الذكاء الاصطناعي

## موارد إضافية

- [نظرة عامة على Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [معرض القوالب](https://azure.github.io/awesome-azd/)
- [عينات المجتمع](https://github.com/Azure-Samples)

---

**تنقل الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل الأول - الأساسيات والبداية السريعة  
- **⬅️ السابق**: [نظرة عامة على الدورة](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ التالي**: [التثبيت والإعداد](installation.md)
- **🚀 الفصل التالي**: [الفصل الثاني: تطوير يعتمد على الذكاء الاصطناعي](../ai-foundry/azure-ai-foundry-integration.md)

---

**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو معلومات غير دقيقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي. للحصول على معلومات حاسمة، يُوصى بالاستعانة بترجمة بشرية احترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة تنشأ عن استخدام هذه الترجمة.