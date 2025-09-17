<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "67ffbcceec008228c4d22c1b3585844c",
  "translation_date": "2025-09-17T18:21:38+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "ar"
}
-->
# مشروعك الأول - دليل عملي

**تنقل الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل الأول - الأساسيات والبداية السريعة
- **⬅️ السابق**: [التثبيت والإعداد](installation.md)
- **➡️ التالي**: [التكوين](configuration.md)
- **🚀 الفصل التالي**: [الفصل الثاني: تطوير يعتمد على الذكاء الاصطناعي](../ai-foundry/azure-ai-foundry-integration.md)

## المقدمة

مرحبًا بك في مشروعك الأول باستخدام Azure Developer CLI! يقدم هذا الدليل العملي الشامل شرحًا كاملاً لإنشاء ونشر وإدارة تطبيق كامل على Azure باستخدام azd. ستعمل مع تطبيق مهام حقيقي يتضمن واجهة أمامية React، وواجهة خلفية API باستخدام Node.js، وقاعدة بيانات MongoDB.

## أهداف التعلم

عند إكمال هذا الدليل، ستتمكن من:
- إتقان عملية بدء مشاريع azd باستخدام القوالب
- فهم هيكل مشاريع Azure Developer CLI وملفات التكوين
- تنفيذ نشر كامل للتطبيق على Azure مع توفير البنية التحتية
- تطبيق استراتيجيات تحديث التطبيق وإعادة النشر
- إدارة بيئات متعددة للتطوير والتجربة
- تطبيق ممارسات تنظيف الموارد وإدارة التكاليف

## نتائج التعلم

عند الانتهاء، ستكون قادرًا على:
- بدء وتكوين مشاريع azd باستخدام القوالب بشكل مستقل
- التنقل وتعديل هيكل مشاريع azd بفعالية
- نشر تطبيقات كاملة على Azure باستخدام أوامر بسيطة
- حل المشكلات الشائعة في النشر ومشاكل المصادقة
- إدارة بيئات Azure متعددة لمراحل النشر المختلفة
- تنفيذ تدفقات نشر مستمرة لتحديثات التطبيق

## البدء

### قائمة المتطلبات الأساسية
- ✅ تثبيت Azure Developer CLI ([دليل التثبيت](installation.md))
- ✅ تثبيت Azure CLI والمصادقة عليه
- ✅ تثبيت Git على نظامك
- ✅ Node.js 16+ (لهذا الدليل)
- ✅ Visual Studio Code (موصى به)

### التحقق من الإعداد
```bash
# Check azd installation
azd version
```
### التحقق من مصادقة Azure

```bash
az account show
```

### التحقق من إصدار Node.js
```bash
node --version
```

## الخطوة 1: اختيار وبدء قالب

لنبدأ بقالب تطبيق مهام شائع يتضمن واجهة أمامية React وواجهة خلفية API باستخدام Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### ماذا حدث للتو؟
- تم تنزيل كود القالب إلى الدليل المحلي الخاص بك
- تم إنشاء ملف `azure.yaml` مع تعريفات الخدمات
- تم إعداد كود البنية التحتية في دليل `infra/`
- تم إنشاء تكوين البيئة

## الخطوة 2: استكشاف هيكل المشروع

لنلقي نظرة على ما أنشأه azd لنا:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
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
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - تعريف البنية التحتية:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## الخطوة 3: تخصيص مشروعك (اختياري)

قبل النشر، يمكنك تخصيص التطبيق:

### تعديل الواجهة الأمامية
```bash
# Open the React app component
code src/web/src/App.tsx
```

قم بإجراء تغيير بسيط:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### تكوين متغيرات البيئة
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## الخطوة 4: النشر على Azure

الآن الجزء المثير - نشر كل شيء على Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### ماذا يحدث أثناء النشر؟

يقوم أمر `azd up` بالخطوات التالية:
1. **التوفير** (`azd provision`) - إنشاء موارد Azure
2. **التعبئة** - بناء كود التطبيق
3. **النشر** (`azd deploy`) - نشر الكود على موارد Azure

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
انقر على الرابط المقدم في مخرجات النشر، أو احصل عليه في أي وقت:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### اختبار تطبيق المهام
1. **إضافة مهمة** - انقر على "إضافة مهمة" وأدخل مهمة
2. **وضع علامة كمكتملة** - ضع علامة على المهام المكتملة
3. **حذف المهام** - قم بإزالة المهام التي لم تعد بحاجة إليها

### مراقبة تطبيقك
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## الخطوة 6: إجراء تغييرات وإعادة النشر

لنقم بإجراء تغيير ونرى مدى سهولة تحديث التطبيق:

### تعديل واجهة API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

أضف رأس استجابة مخصص:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### نشر تغييرات الكود فقط
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## الخطوة 7: إدارة بيئات متعددة

قم بإنشاء بيئة تجريبية لاختبار التغييرات قبل الإنتاج:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### مقارنة البيئات
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## الخطوة 8: تنظيف الموارد

عندما تنتهي من التجربة، قم بتنظيف الموارد لتجنب التكاليف المستمرة:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## ما تعلمته

تهانينا! لقد نجحت في:
- بدء مشروع azd من قالب
- استكشاف هيكل المشروع والملفات الرئيسية
- نشر تطبيق كامل على Azure
- إجراء تغييرات على الكود وإعادة النشر
- إدارة بيئات متعددة
- تنظيف الموارد

## حل المشكلات الشائعة

### أخطاء المصادقة
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### فشل النشر
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### تعارض أسماء الموارد
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### مشاكل المنافذ/الشبكة
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## الخطوات التالية

الآن بعد أن أكملت مشروعك الأول، استكشف هذه المواضيع المتقدمة:

### 1. تخصيص البنية التحتية
- [البنية التحتية ككود](../deployment/provisioning.md)
- [إضافة قواعد بيانات، تخزين، وخدمات أخرى](../deployment/provisioning.md#adding-services)

### 2. إعداد CI/CD
- [تكامل GitHub Actions](../deployment/cicd-integration.md)
- [خطوط Azure DevOps](../deployment/cicd-integration.md#azure-devops)

### 3. أفضل الممارسات للإنتاج
- [تكوينات الأمان](../deployment/best-practices.md#security)
- [تحسين الأداء](../deployment/best-practices.md#performance)
- [المراقبة والتسجيل](../deployment/best-practices.md#monitoring)

### 4. استكشاف المزيد من القوالب
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## موارد إضافية

### مواد تعليمية
- [وثائق Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مركز هندسة Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [إطار عمل Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### المجتمع والدعم
- [GitHub الخاص بـ Azure Developer CLI](https://github.com/Azure/azure-dev)
- [مجتمع مطوري Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### القوالب والأمثلة
- [معرض القوالب الرسمي](https://azure.github.io/awesome-azd/)
- [قوالب المجتمع](https://github.com/Azure-Samples/azd-templates)
- [أنماط المؤسسات](https://github.com/Azure/azure-dev/tree/main/templates)

---

**تهانينا على إكمال مشروعك الأول باستخدام azd!** أنت الآن جاهز لبناء ونشر تطبيقات رائعة على Azure بثقة.

---

**تنقل الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل الأول - الأساسيات والبداية السريعة
- **⬅️ السابق**: [التثبيت والإعداد](installation.md)
- **➡️ التالي**: [التكوين](configuration.md)
- **🚀 الفصل التالي**: [الفصل الثاني: تطوير يعتمد على الذكاء الاصطناعي](../ai-foundry/azure-ai-foundry-integration.md)
- **الدرس التالي**: [دليل النشر](../deployment/deployment-guide.md)

---

**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي. للحصول على معلومات حاسمة، يُوصى بالاستعانة بترجمة بشرية احترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة تنشأ عن استخدام هذه الترجمة.