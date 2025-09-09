<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-09T19:26:26+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "ar"
}
-->
# المشاكل الشائعة والحلول

## المقدمة

يغطي هذا الدليل الشامل لاستكشاف الأخطاء وإصلاحها أكثر المشاكل شيوعًا التي تواجهها عند استخدام Azure Developer CLI. تعلم كيفية تشخيص المشاكل، استكشاف الأخطاء وإصلاحها، وحل المشكلات المتعلقة بالمصادقة، النشر، توفير البنية التحتية، وتكوين التطبيقات. يتضمن كل مشكلة أعراضًا مفصلة، أسبابًا جذرية، وإجراءات حل خطوة بخطوة.

## أهداف التعلم

عند إكمال هذا الدليل، ستتمكن من:
- إتقان تقنيات التشخيص لمشاكل Azure Developer CLI
- فهم مشاكل المصادقة والأذونات الشائعة وحلولها
- حل أخطاء النشر، مشاكل توفير البنية التحتية، ومشاكل التكوين
- تنفيذ استراتيجيات مراقبة واستكشاف الأخطاء بشكل استباقي
- تطبيق منهجيات منهجية لاستكشاف الأخطاء وإصلاحها للمشاكل المعقدة
- إعداد تسجيل ومراقبة مناسب لمنع المشاكل المستقبلية

## نتائج التعلم

عند الانتهاء، ستكون قادرًا على:
- تشخيص مشاكل Azure Developer CLI باستخدام أدوات التشخيص المدمجة
- حل مشاكل المصادقة، الاشتراك، والأذونات بشكل مستقل
- استكشاف أخطاء النشر وتوفير البنية التحتية بفعالية
- تصحيح مشاكل تكوين التطبيقات والمشاكل الخاصة بالبيئة
- تنفيذ المراقبة والتنبيه لتحديد المشاكل المحتملة بشكل استباقي
- تطبيق أفضل الممارسات لتسجيل الأخطاء، استكشاف الأخطاء، وإجراءات حل المشاكل

## التشخيص السريع

قبل التعمق في المشاكل المحددة، قم بتشغيل هذه الأوامر لجمع معلومات التشخيص:

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## مشاكل المصادقة

### المشكلة: "فشل في الحصول على رمز الوصول"
**الأعراض:**
- فشل `azd up` مع أخطاء المصادقة
- الأوامر تعرض "غير مصرح" أو "تم رفض الوصول"

**الحلول:**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### المشكلة: "امتيازات غير كافية" أثناء النشر
**الأعراض:**
- فشل النشر مع أخطاء الأذونات
- عدم القدرة على إنشاء موارد Azure معينة

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

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ أخطاء توفير البنية التحتية

### المشكلة: تعارض أسماء الموارد
**الأعراض:**
- أخطاء "اسم المورد موجود بالفعل"
- فشل النشر أثناء إنشاء الموارد

**الحلول:**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### المشكلة: الموقع/المنطقة غير متاحة
**الأعراض:**
- "الموقع 'xyz' غير متاح لنوع المورد"
- بعض SKUs غير متاحة في المنطقة المحددة

**الحلول:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### المشكلة: تجاوز الحصة
**الأعراض:**
- "تم تجاوز الحصة لنوع المورد"
- "تم الوصول إلى الحد الأقصى لعدد الموارد"

**الحلول:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### المشكلة: أخطاء قوالب Bicep
**الأعراض:**
- فشل التحقق من صحة القالب
- أخطاء في بناء ملفات Bicep

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
- فشل التطبيق في البناء أثناء النشر
- أخطاء تثبيت الحزم

**الحلول:**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### المشكلة: فشل نشر الحاويات
**الأعراض:**
- فشل تشغيل تطبيقات الحاويات
- أخطاء سحب الصور

**الحلول:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### المشكلة: فشل الاتصال بقاعدة البيانات
**الأعراض:**
- عدم قدرة التطبيق على الاتصال بقاعدة البيانات
- أخطاء انتهاء مهلة الاتصال

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

## 🔧 مشاكل التكوين

### المشكلة: عدم عمل متغيرات البيئة
**الأعراض:**
- عدم قدرة التطبيق على قراءة قيم التكوين
- ظهور متغيرات البيئة فارغة

**الحلول:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### المشكلة: مشاكل شهادات SSL/TLS
**الأعراض:**
- عدم عمل HTTPS
- أخطاء التحقق من صحة الشهادة

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
- عدم قدرة الواجهة الأمامية على استدعاء API
- حظر طلبات عبر الأصل

**الحلول:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 مشاكل إدارة البيئة

### المشكلة: مشاكل تبديل البيئة
**الأعراض:**
- استخدام البيئة الخاطئة
- عدم تبديل التكوين بشكل صحيح

**الحلول:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### المشكلة: تلف البيئة
**الأعراض:**
- تظهر البيئة في حالة غير صالحة
- الموارد لا تتطابق مع التكوين

**الحلول:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 مشاكل الأداء

### المشكلة: أوقات نشر بطيئة
**الأعراض:**
- النشر يستغرق وقتًا طويلًا
- انتهاء المهلة أثناء النشر

**الحلول:**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### المشكلة: مشاكل أداء التطبيق
**الأعراض:**
- أوقات استجابة بطيئة
- استخدام عالي للموارد

**الحلول:**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ أدوات وأوامر استكشاف الأخطاء

### أوامر التصحيح
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### تحليل السجلات
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### التحقيق في الموارد
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
- استمرار مشاكل المصادقة بعد تجربة جميع الحلول
- مشاكل البنية التحتية مع خدمات Azure
- مشاكل الفوترة أو الاشتراك
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

### المعلومات التي يجب جمعها
قبل الاتصال بالدعم، اجمع:
- مخرجات `azd version`
- مخرجات `azd info`
- رسائل الخطأ (النص الكامل)
- خطوات إعادة إنتاج المشكلة
- تفاصيل البيئة (`azd env show`)
- الجدول الزمني لبدء المشكلة

### سكربت جمع السجلات
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 منع المشاكل

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
```bash
# Enable Application Insights
# Add to main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### الصيانة الدورية
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## الموارد ذات الصلة

- [دليل التصحيح](debugging.md) - تقنيات التصحيح المتقدمة
- [توفير الموارد](../deployment/provisioning.md) - استكشاف أخطاء البنية التحتية
- [تخطيط السعة](../pre-deployment/capacity-planning.md) - إرشادات تخطيط الموارد
- [اختيار SKU](../pre-deployment/sku-selection.md) - توصيات مستويات الخدمة

---

**نصيحة**: احتفظ بهذا الدليل في المفضلة وارجع إليه كلما واجهت مشاكل. معظم المشاكل تم مواجهتها من قبل ولها حلول مثبتة!

---

**التنقل**
- **الدرس السابق**: [توفير الموارد](../deployment/provisioning.md)
- **الدرس التالي**: [دليل التصحيح](debugging.md)

---

**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو معلومات غير دقيقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي. للحصول على معلومات حاسمة، يُوصى بالاستعانة بترجمة بشرية احترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة تنشأ عن استخدام هذه الترجمة.