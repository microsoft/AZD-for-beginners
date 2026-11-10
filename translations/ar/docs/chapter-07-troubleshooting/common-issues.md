# المشكلات الشائعة والحلول

**تصفح الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 7 - استكشاف الأخطاء وإصلاحها وتصحيح الأخطاء
- **⬅️ الفصل السابق**: [الفصل 6: فحوصات ما قبل التشغيل](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ التالي**: [دليل تصحيح الأخطاء](debugging.md)
- **🚀 الفصل التالي**: [الفصل 8: أنماط الإنتاج والمؤسسات](../chapter-08-production/production-ai-practices.md)

## مقدمة

يغطي هذا الدليل الشامل لاستكشاف الأخطاء وإصلاحها أكثر المشكلات التي تواجه عند استخدام Azure Developer CLI. تعلم كيفية تشخيص وحل المشكلات الشائعة المتعلقة بالمصادقة، والنشر، وتوفير البنية التحتية، وتكوين التطبيقات. يتضمن كل مشكلة أعراضًا مفصلة، وأسبابًا جذرية، وإجراءات حل خطوة بخطوة.

## أهداف التعلم

بعد إتمام هذا الدليل، سوف:
- تتقن تقنيات التشخيص لمشكلات Azure Developer CLI
- تفهم المشكلات الشائعة في المصادقة والأذونات وحلولها
- تحل مشكلات فشل النشر وأخطاء توفير البنية التحتية والمشكلات في التكوين
- تنفذ استراتيجيات المراقبة والتصحيح الاستباقية
- تطبق منهجيات استكشاف الأخطاء المنهجية للمشكلات المعقدة
- تضبط تسجيل الملاحظات والمراقبة بشكل صحيح لمنع المشكلات المستقبلية

## نواتج التعلم

عند الانتهاء، ستتمكن من:
- تشخيص مشكلات Azure Developer CLI باستخدام أدوات التشخيص المدمجة
- حل مشكلات المصادقة والاشتراك والأذونات بشكل مستقل
- استكشاف مشكلات فشل النشر وأخطاء توفير البنية التحتية بفعالية
- تصحيح أخطاء تكوين التطبيقات والمشكلات المتعلقة بالبيئة الخاصة
- تنفيذ المراقبة والتنبيهات لتحديد المشكلات المحتملة قبل وقوعها
- تطبيق أفضل الممارسات في التسجيل، والتصحيح، وسير عمل حل المشكلات

## التشخيص السريع

> استبدل أسماء/معرفات الأمثلة بالقيم الخاصة ببيئتك. أجزاء باشت، بيسب، جافا سكريبت، وملفات المعلمات موضحة بشكل منفصل أدناه؛ هي ليست سكريبت واحد قابل للتنفيذ. راجع العمليات التي قد تكون مدمرة واحجب الأسرار قبل مشاركة التشخيصات. `azd monitor --logs` يفتح متصفحًا؛ لا يبث سجلات الطرفية.

قبل الغوص في المشكلات المحددة، شغّل هذه الأوامر لجمع معلومات التشخيص:

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## مشكلات المصادقة

### المشكلة: "فشل الحصول على رمز الوصول"
**الأعراض:**
- يفشل `azd up` بأخطاء المصادقة
- تعيد الأوامر "غير مصرح" أو "تم رفض الوصول"

**الحلول:**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### المشكلة: "صلاحيات غير كافية" أثناء النشر
**الأعراض:**
- يفشل النشر بأخطاء الأذونات
- لا يمكن إنشاء بعض موارد Azure

**الحلول:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### المشكلة: مشاكل المصادقة متعددة المستأجرين
**الحلول:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ أخطاء توفير البنية التحتية

### المشكلة: تعارض أسماء الموارد
**الأعراض:**
- أخطاء "اسم المورد موجود بالفعل"
- يفشل النشر أثناء إنشاء الموارد

**الحلول:**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### المشكلة: الموقع/المنطقة غير متاحة
**الأعراض:**
- "الموقع 'xyz' غير متاح لنوع المورد"
- بعض وحدات SKU غير متوفرة في المنطقة المحددة

**الحلول:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

تغيير متغير الموقع لا ينقل الموارد الحالية. قد يرفض مجموعة موارد أو مورد قائم تغيير الموقع؛ استخدم بيئة منفصلة لإعادة نشر إقليمية.

### المشكلة: أخطاء تجاوز الحصة
**الأعراض:**
- "تم تجاوز الحصة لنوع المورد"
- "تم الوصول إلى الحد الأقصى لعدد الموارد"

**الحلول:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

للتطوير، اختر وحدة SKU صغيرة مدعومة في `infra/main.parameters.json`:

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### المشكلة: أخطاء قالب بيسب
**الأعراض:**
- فشل التحقق من القالب
- أخطاء في بناء جملة ملفات بيسب

**الحلول:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 فشل النشر

### المشكلة: فشل البناء
**الأعراض:**
- يفشل التطبيق في البناء أثناء النشر
- أخطاء تثبيت الحزم

**الحلول:**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### المشكلة: فشل نشر الحاويات
**الأعراض:**
- تطبيقات الحاويات تفشل في البدء
- أخطاء سحب الصورة

**الحلول:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### المشكلة: فشل اتصال قاعدة البيانات
**الأعراض:**
- التطبيق لا يستطيع الاتصال بقاعدة البيانات
- أخطاء نفاد مهلة الاتصال

**الحلول:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 مشكلات التكوين

### المشكلة: متغيرات البيئة لا تعمل
**الأعراض:**
- التطبيق لا يستطيع قراءة قيم التكوين
- تظهر متغيرات البيئة فارغة

**الحلول:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### المشكلة: مشاكل شهادة SSL/TLS
**الأعراض:**
- HTTPS لا يعمل
- أخطاء التحقق من الشهادة

**الحلول:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### المشكلة: مشاكل تكوين CORS
**الأعراض:**
- الواجهة الأمامية لا تستطيع استدعاء API
- طلبات عبر الأصل محظورة

**الحلول:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. حدّث تطبيق Express الحالي الخاص بك (مع `cors` مستوردًا):

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
# 3. Check if running on correct URLs
azd show
```

## 🌍 مشكلات إدارة البيئة

### المشكلة: مشاكل تبديل البيئة
**الأعراض:**
- استخدام بيئة خاطئة
- التكوين لا يتحول بشكل صحيح

**الحلول:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### المشكلة: تلف البيئة
**الأعراض:**
- تظهر البيئة بحالة غير صالحة
- الموارد لا تطابق التكوين

**الحلول:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 مشكلات الأداء

### المشكلة: بطء أوقات النشر
**الأعراض:**
- النشرات تستغرق وقتًا طويلا
- انقطاعات مهلة أثناء النشر

**الحلول:**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### المشكلة: مشاكل أداء التطبيق
**الأعراض:**
- أوقات استجابة بطيئة
- استخدام عالي للموارد

**الحلول:**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ أدوات وأوامر استكشاف الأخطاء

### أوامر التصحيح
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### تحليل السجلات
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### استقصاء الموارد
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 الحصول على مساعدة إضافية

### متى يجب التصعيد
- تستمر مشكلات المصادقة بعد تجربة كل الحلول
- مشاكل في البنية التحتية لخدمات Azure
- مشكلات ذات صلة بالفوترة أو الاشتراك
- مخاوف أو حوادث أمنية

### قنوات الدعم
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### معلومات يجب جمعها
قبل الاتصال بالدعم، اجمع:
- مخرجات `azd version`
- مخرجات `azd config show`
- مخرجات `azd show` (حالة النشر الحالية)
- رسائل الخطأ (النص الكامل)
- خطوات تكرار المشكلة
- تفاصيل البيئة المحجوبة (لا تشارك `azd env get-values` الخام أبدًا، فقد تحتوي على أسرار)
- التوقيت الذي بدأت فيه المشكلة

### سكريبت جمع السجلات
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 الوقاية من المشكلات

### قائمة التحقق قبل النشر
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### إعداد المراقبة
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### الصيانة الدورية
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## الموارد ذات الصلة

- [دليل تصحيح الأخطاء](debugging.md) - تقنيات تصحيح متقدمة
- [توفير الموارد](../chapter-04-infrastructure/provisioning.md) - استكشاف أخطاء البنية التحتية
- [تخطيط السعة](../chapter-06-pre-deployment/capacity-planning.md) - إرشادات تخطيط الموارد
- [اختيار SKU](../chapter-06-pre-deployment/sku-selection.md) - توصيات مستوى الخدمة

---

**نصيحة**: احتفظ بهذا الدليل في المفضلة وارجع إليه كلما واجهت مشكلات. معظم المشكلات مألوفة ولها حلول مثبتة!

---

**التنقل**
- **الدرس السابق**: [توفير الموارد](../chapter-04-infrastructure/provisioning.md)
- **الدرس التالي**: [دليل تصحيح الأخطاء](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->