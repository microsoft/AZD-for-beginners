# مشروعك الأول - درس عملي

**التنقل بين الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 1 - الأساسيات والبداية السريعة
- **⬅️ السابق**: [التثبيت والإعداد](installation.md)
- **➡️ التالي**: [أحضر تطبيقك الخاص](bring-your-own-app.md)
- **🚀 الفصل التالي**: [الفصل 2: التطوير المعتمد على الذكاء الاصطناعي](../chapter-02-ai-development/microsoft-foundry-integration.md)

## المقدمة

مرحبًا بك في مشروع Azure Developer CLI الأول لك! ستقوم بنشر تطبيق مهام مع واجهة أمامية React، وAPI بـ Node.js، وAzure Cosmos DB. القالب يحتفظ بالاسم التاريخي `todo-nodejs-mongo`؛ البنية التحتية الحالية تستخدم Cosmos DB لنظام NoSQL، لذا تحقق من README و`infra/` المنزّلين بدلاً من استنتاج API قاعدة البيانات من الاسم.

> تم المراجعة مقابل `azd 1.37.2` والقالب العام في نوفمبر 2026. الأمثلة أدناه تستخدم Bash؛ استخراج JSON يتطلب أيضًا `jq`. نشر Azure يتطلب تكاليف ولم يتم تنفيذه أثناء هذه المراجعة.

## أهداف التعلم

عند إكمال هذا الدرس، سوف تقوم بـ:
- إتقان عملية تهيئة مشروع azd باستخدام القوالب
- فهم هيكل مشروع Azure Developer CLI وملفات التكوين
- تنفيذ نشر التطبيق الكامل على Azure مع توفير البنية التحتية
- تنفيذ تحديثات التطبيق واستراتيجيات إعادة النشر
- إدارة بيئات متعددة للتطوير والاختبار
- تطبيق ممارسات تنظيف الموارد وإدارة التكاليف

## نتائج التعلم

بعد الانتهاء، ستكون قادرًا على:
- تهيئة وتكوين مشاريع azd من القوالب بشكل مستقل
- التنقل وتعديل هياكل مشاريع azd بفعالية
- نشر تطبيقات كاملة إلى Azure باستخدام أوامر واحدة
- استكشاف وحل مشكلات النشر الشائعة ومشاكل المصادقة
- إدارة بيئات Azure متعددة لمراحل نشر مختلفة
- تنفيذ تدفقات النشر المستمر لتحديثات التطبيق

## البداية

### قائمة المراجعة للمتطلبات الأساسية
- ✅ تثبيت Azure Developer CLI ([دليل التثبيت](installation.md))
- ✅ إتمام مصادقة AZD مع `azd auth login`
- ✅ تثبيت Git على نظامك
- ✅ Node.js 22 LTS (أو نسخة مدعومة من القالب المنزّل)
- ✅ Visual Studio Code (موصى به)

قبل المتابعة، شغّل مدقق الإعداد من جذر المستودع:

**ويندوز:** `./validate-setup.ps1`

**ماك / لينكس:** `bash ./validate-setup.sh`

### تحقق من إعدادك
```bash
# Check azd installation
azd version

# Check AZD authentication
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

لنبدأ بقالب تطبيق مهام شهير يتضمن واجهة React أمامية وAPI بـ Node.js في الخلفية.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### ماذا حدث للتو؟
- تم تحميل كود القالب إلى مجلدك المحلي
- تم إنشاء ملف `azure.yaml` مع تعريفات الخدمات
- تم إعداد كود البنية التحتية في مجلد `infra/`
- تم إنشاء تكوين البيئة

## الخطوة 2: استكشاف هيكل المشروع

دعنا نفحص ما أنشأه azd لنا:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

يجب أن ترى:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### ملفات رئيسية لفهمها

**azure.yaml** - القلب النابض لمشروع azd الخاص بك:
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
code src/web/src/layout/header.tsx
```

أجري تعديلًا بسيطًا:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### تكوين متغيرات البيئة
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

هذان القيمتان المخصصتان تظهران تخزينًا محليًا فقط. القالب الافتراضي لا يستهلك `WEBSITE_TITLE` أو `API_VERSION`، لذا لا تغير التطبيق. التعديل الصريح أعلاه يغير العنوان المعروض.

## الخطوة 4: النشر على Azure

الآن الجزء المثير - انشر كل شيء على Azure!

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

تدفق العمل يوفر البنية التحتية ويعبئ/ينشر الكود. يمكن تخصيص الترتيب الدقيق من خلال `workflows.up` في `azure.yaml`؛ هذا القالب يحدد التوفير يليه النشر. لا تعتمد على ترتيب شامل موحد لكل قالب.

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
انقر على الرابط في مخرجات النشر، أو احصل عليه في أي وقت:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### اختبر تطبيق المهام
1. **أضف مهمة** - انقر على "إضافة مهمة" وأدخل مهمة
2. **علم كمكتملة** - ضع علامة على المهام المنجزة
3. **حذف المهام** - أزل المهام التي لم تعد بحاجة إليها

### راقب تطبيقك
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ تحقق من نشر تطبيقك

قبل المتابعة، مر على هذه القائمة السريعة لتتأكد من أن كل شيء يعمل فعلًا — لا تفترض أن "النشر نجح" يعني "التطبيق يعمل":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**يتم التحقق من النشر عندما:**
- ✅ `azd show` يعرض عنوان نقطة نهاية قابل للوصول
- ✅ العنوان يفتح في متصفحك بدون أخطاء
- ✅ تعمل الميزات الأساسية (إضافة/إكمال/حذف مهمة)
- ✅ `azd monitor --logs` يظهر الطلبات الواردة بدون أخطاء غير متوقعة

إذا فشل أي تحقق، انتقل إلى [الفصل 7: استكشاف الأخطاء](../chapter-07-troubleshooting/README.md).

## الخطوة 6: قم بالتغييرات وأعد النشر

دعنا نجري تغييرًا ونرى مدى سهولة التحديث:

### تعديل الـ API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

أضف رأس استجابة مخصص:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### انشر تغييرات الكود فقط
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## الخطوة 7: إدارة بيئات متعددة

أنشئ بيئة اختبار لاختبار التغييرات قبل الإنتاج:

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

### مقارنة بين البيئات
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## الخطوة 8: تنظيف الموارد

عندما تنتهي من التجارب، نظف لتجنب التكاليف المستمرة:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## تطبيق كلاسيكي مقابل تطبيق مدعوم بالذكاء الاصطناعي: نفس التدفق

لقد نشرت تطبيق ويب تقليدي. لكن ماذا لو أردت نشر تطبيق مدعوم بالذكاء الاصطناعي - مثل تطبيق دردشة مدعوم بنماذج Microsoft Foundry؟

الخبر الجيد: **تدفق العمل هو نفسه تمامًا.**

| الخطوة | تطبيق المهام الكلاسيكي | تطبيق دردشة الذكاء الاصطناعي |
|------|-----------------|-------------|
| التهيئة (دليل فارغ) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| المصادقة | `azd auth login` | `azd auth login` |
| النشر | `azd up` | `azd up` |
| المراقبة | `azd monitor` | `azd monitor` |
| التنظيف | `azd down --force --purge` | `azd down --force --purge` |

أوامر دورة الحياة متشابهة، لكن المتطلبات الأساسية تختلف. قد يحتاج قالب الذكاء الاصطناعي إلى وصول إلى نماذج، حصة إقليمية، إدخال بيانات، وتكوين إضافي. اقرأ README الخاص به قبل النشر؛ `azd up` لا يمكنه توفير الأذونات أو الحصص الناقصة.

هذا هو المبدأ الأساسي لـ azd: **تدفق عمل واحد، أي حمولة عمل.** المهارات التي تدربت عليها في هذا الدرس — التهيئة، النشر، المراقبة، إعادة النشر، والتنظيف — تنطبق بنفس القدر على تطبيقات الذكاء الاصطناعي والوكالات.

---

## ما تعلمته

تهانينا! لقد نجحت في:
- ✅ تهيئة مشروع azd من قالب
- ✅ استكشاف هيكل المشروع والملفات الرئيسية
- ✅ نشر تطبيق كامل الواجهة على Azure
- ✅ إجراء تغييرات على الكود وإعادة النشر
- ✅ إدارة بيئات متعددة
- ✅ تنظيف الموارد

## 🎯 تمارين للتحقق من المهارات

### التمرين 1: نشر قالب مختلف (15 دقيقة)
**الهدف**: إثبات إتقان تهيئة azd وعملية النشر

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**معايير النجاح:**
- [ ] التطبيق يُنشر بدون أخطاء
- [ ] يمكن الوصول إلى عنوان التطبيق في المتصفح
- [ ] التطبيق يعمل بشكل صحيح (إضافة/إزالة المهام)
- [ ] تم تنظيف كل الموارد بنجاح

### التمرين 2: تخصيص التكوين (20 دقيقة)
**الهدف**: تمرن على تخزين قيم البيئة المحلية دون الخلط بينها وبين تكوين وقت التشغيل

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**معايير النجاح:**
- [ ] تم إنشاء بيئة مخصصة بنجاح
- [ ] تم تعيين متغيرات البيئة ويمكن استرجاعها
- [ ] `azd env get-value APP_TITLE` يعرض `My Custom Todo App`
- [ ] يمكن تفسير سبب عدم تغيير هذه القيم التطبيق الافتراضي إلا إذا استهلكها الكود/البنية التحتية

### التمرين 3: تدفق عمل بيئات متعددة (25 دقيقة)
**الهدف**: إتقان إدارة البيئات واستراتيجيات النشر

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**معايير النجاح:**
- [ ] تم إنشاء بيئتين بتكوينات مختلفة
- [ ] تم نشر البيئتين بنجاح
- [ ] يمكن التبديل بين البيئات باستخدام `azd env select`
- [ ] متغيرات البيئة تختلف بين البيئتين
- [ ] تم تنظيف كلتا البيئتين بنجاح

## 📊 تقدمك

**الوقت المستغرق**: ~60-90 دقيقة  
**المهارات المكتسبة**:
- ✅ تهيئة المشاريع من القوالب
- ✅ توفير موارد Azure
- ✅ تدفقات نشر التطبيقات
- ✅ إدارة البيئات
- ✅ إدارة التكوين
- ✅ تنظيف الموارد وإدارة التكاليف

**المستوى التالي**: أنت جاهز لقراءة [دليل التكوين](../chapter-03-configuration/configuration.md) لتعلم أنماط التكوين المتقدمة!

## استكشاف المشكلات الشائعة

### أخطاء المصادقة
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### فشل النشر
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### تعارض أسماء الموارد
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### مشكلات الشبكة/المنفذ
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## الخطوات التالية

بعد إكمال مشروعك الأول، استكشف هذه المواضيع المتقدمة:

### 1. تخصيص البنية التحتية
- [البنية التحتية ككود](../chapter-04-infrastructure/provisioning.md)
- [إضافة بنية قاعدة بيانات](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. إعداد CI/CD
- [دليل النشر](../chapter-04-infrastructure/deployment-guide.md) - تدفقات عمل CI/CD كاملة
- [توثيق Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - تكوين خطوط الأنابيب

### 3. أفضل ممارسات الإنتاج
- [دليل النشر](../chapter-04-infrastructure/deployment-guide.md) - الأمان، الأداء، والمراقبة

### 4. استكشاف المزيد من القوالب
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## موارد إضافية

### مواد تعليمية
- [توثيق Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مركز هندسة Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [إطار عمل Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### المجتمع والدعم
- [GitHub لـ Azure Developer CLI](https://github.com/Azure/azure-dev)
- [مجتمع Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### القوالب والأمثلة
- [معرض القوالب الرسمي](https://azure.github.io/awesome-azd/)
- [مساهمات قوالب المجتمع](https://github.com/Azure/awesome-azd)
- [مصدر قالب المهام](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**تهانينا على إكمال مشروعك الأول azd!** أنت الآن جاهز لبناء ونشر تطبيقات مذهلة على Azure بثقة.

---

**التنقل بين الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 1 - الأساسيات والبداية السريعة
- **⬅️ السابق**: [التثبيت والإعداد](installation.md)
- **➡️ التالي**: [أحضر تطبيقك الخاص](bring-your-own-app.md)
- **🚀 الفصل التالي**: [الفصل 2: التطوير المعتمد على الذكاء الاصطناعي](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->