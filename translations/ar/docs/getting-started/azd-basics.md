<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-09T19:14:39+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "ar"
}
-->
# أساسيات AZD - فهم Azure Developer CLI

## المقدمة

تقدم هذه الدرس أداة Azure Developer CLI (azd)، وهي أداة سطر أوامر قوية تُسرّع رحلتك من التطوير المحلي إلى النشر على Azure. ستتعلم المفاهيم الأساسية، الميزات الرئيسية، وكيفية تبسيط azd لعملية نشر التطبيقات السحابية الأصلية.

## أهداف التعلم

بنهاية هذا الدرس، ستتمكن من:
- فهم ما هو Azure Developer CLI والغرض الأساسي منه
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

Azure Developer CLI (azd) هو أداة سطر أوامر مصممة لتسريع رحلتك من التطوير المحلي إلى النشر على Azure. تُبسط عملية بناء، نشر، وإدارة التطبيقات السحابية الأصلية على Azure.

## المفاهيم الأساسية

### القوالب
القوالب هي الأساس لـ azd. تحتوي على:
- **كود التطبيق** - كود المصدر والاعتمادات الخاصة بك
- **تعريفات البنية التحتية** - موارد Azure المعرفة باستخدام Bicep أو Terraform
- **ملفات التكوين** - الإعدادات والمتغيرات البيئية
- **سكربتات النشر** - سير عمل النشر الآلي

### البيئات
تمثل البيئات أهداف نشر مختلفة:
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
- **الواجهة الخلفية** - APIs، الخدمات المصغرة
- **قاعدة البيانات** - حلول تخزين البيانات
- **التخزين** - تخزين الملفات والبلوب

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
- **ARM Templates** - قوالب Azure Resource Manager

### 3. سير العمل المتكامل
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
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
azd down --force --purge
```

### إدارة بيئات متعددة
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

### إدارة المشروع
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
- استخدم خطوط CI/CD للنشر في الإنتاج

### 4. إدارة التكوين
- استخدم المتغيرات البيئية للبيانات الحساسة
- احتفظ بالتكوين في التحكم بالإصدارات
- وثّق الإعدادات الخاصة بكل بيئة

## تقدم التعلم

### مبتدئ (الأسبوع 1-2)
1. تثبيت azd والمصادقة
2. نشر قالب بسيط
3. فهم هيكل المشروع
4. تعلم الأوامر الأساسية (up، down، deploy)

### متوسط (الأسبوع 3-4)
1. تخصيص القوالب
2. إدارة بيئات متعددة
3. فهم كود البنية التحتية
4. إعداد خطوط CI/CD

### متقدم (الأسبوع 5+)
1. إنشاء قوالب مخصصة
2. أنماط بنية تحتية متقدمة
3. نشرات متعددة المناطق
4. تكوينات على مستوى المؤسسات

## الخطوات التالية

- [التثبيت والإعداد](installation.md) - تثبيت azd وتكوينه
- [مشروعك الأول](first-project.md) - دليل عملي
- [دليل التكوين](configuration.md) - خيارات التكوين المتقدمة

## موارد إضافية

- [نظرة عامة على Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [معرض القوالب](https://azure.github.io/awesome-azd/)
- [عينات المجتمع](https://github.com/Azure-Samples)

---

**التنقل**
- **الدرس السابق**: [README](../../README.md)
- **الدرس التالي**: [التثبيت والإعداد](installation.md)

---

**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو معلومات غير دقيقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي. للحصول على معلومات حاسمة، يُوصى بالاستعانة بترجمة بشرية احترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة ناتجة عن استخدام هذه الترجمة.