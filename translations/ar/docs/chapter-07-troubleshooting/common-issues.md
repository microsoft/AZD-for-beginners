# القضايا الشائعة والحلول

**تنقل الفصول:**
- **📚 Course Home**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 7 - استكشاف الأخطاء وإصلاحها وتصحيح الأخطاء
- **⬅️ الفصل السابق**: [الفصل 6: فحوص ما قبل النشر](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ التالي**: [دليل تصحيح الأخطاء](debugging.md)
- **🚀 الفصل التالي**: [الفصل 8: أنماط الإنتاج والمؤسسات](../chapter-08-production/production-ai-practices.md)

## مقدمة

يغطي دليل استكشاف الأخطاء هذا بشكل شامل أكثر المشكلات التي يتم مواجهتها عند استخدام Azure Developer CLI. تعلّم كيفية تشخيص المشكلات واستكشافها وحلها المتعلقة بالمصادقة والنشر وتجهيز البنية التحتية وتكوين التطبيقات. يتضمن كل موضوع أعراضًا مفصلةً، وأسبابًا جذرية، وإجراءات حل خطوة بخطوة.

## أهداف التعلم

من خلال إكمال هذا الدليل، ستتمكن من:
- إتقان تقنيات التشخيص لمشكلات Azure Developer CLI
- فهم مشكلات المصادقة والأذونات الشائعة وحلولها
- حل حالات فشل النشر وأخطاء تجهيز البنية التحتية ومشاكل التكوين
- تنفيذ استراتيجيات مراقبة وتصحيح أخطاء استباقية
- تطبيق منهجيات استكشاف منهجية للمشكلات المعقدة
- تكوين تسجيل ومراقبة مناسبين لمنع المشكلات المستقبلية

## مخرجات التعلم

عند الانتهاء، ستتمكن من:
- تشخيص مشكلات Azure Developer CLI باستخدام أدوات التشخيص المدمجة
- حل مشكلات المصادقة والاشتراك والأذونات بشكل مستقل
- استكشاف حالات فشل النشر وأخطاء تجهيز البنية التحتية بفعالية
- تصحيح مشكلات تكوين التطبيق والمشكلات الخاصة بالبيئة
- تنفيذ المراقبة والتنبيه لتحديد المشكلات المحتملة بشكل استباقي
- تطبيق أفضل الممارسات لتسجيل الأخطاء، وتصحيحها، وسير عمل حل المشكلات

## تشخيص سريع

قبل التعمق في المشكلات المحددة، نفّذ هذه الأوامر لجمع معلومات تشخيصية:

```bash
# التحقق من إصدار azd وحالته
azd version
azd config show

# التحقق من مصادقة Azure
az account show
az account list

# التحقق من البيئة الحالية
azd env list
azd env get-values

# تمكين تسجيل التصحيح
export AZD_DEBUG=true
azd <command> --debug
```

## مشكلات المصادقة

### المشكلة: "Failed to get access token"
**الأعراض:**
- `azd up` يفشل مع أخطاء مصادقة
- الأوامر تُعيد "unauthorized" أو "access denied"

**الحلول:**
```bash
# 1. إعادة المصادقة باستخدام واجهة سطر أوامر Azure
az login
az account show

# 2. مسح بيانات الاعتماد المخزنة مؤقتًا
az account clear
az login

# 3. استخدام تدفق رمز الجهاز (للأنظمة بدون واجهة)
az login --use-device-code

# 4. تعيين الاشتراك صراحةً
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### المشكلة: "Insufficient privileges" أثناء النشر
**الأعراض:**
- يفشل النشر مع أخطاء أذونات
- لا يمكن إنشاء بعض موارد Azure

**الحلول:**
```bash
# ١. تحقق من تعيينات الأدوار في Azure الخاصة بك
az role assignment list --assignee $(az account show --query user.name -o tsv)

# ٢. تأكد من أن لديك الأدوار المطلوبة
# - مشارك (لإنشاء الموارد)
# - مسؤول وصول المستخدم (لتعيين الأدوار)

# ٣. اتصل بمسؤول Azure الخاص بك للحصول على الأذونات المناسبة
```

### المشكلة: مشاكل المصادقة متعددة المستأجرين
**الحلول:**
```bash
# 1. تسجيل الدخول باستخدام مستأجر معين
az login --tenant "your-tenant-id"

# 2. تعيين المستأجر في التكوين
azd config set auth.tenantId "your-tenant-id"

# 3. مسح ذاكرة التخزين المؤقت للمستأجر عند التبديل بين المستأجرين
az account clear
```

## 🏗️ أخطاء تجهيز البنية التحتية

### المشكلة: تعارض أسماء الموارد
**الأعراض:**
- أخطاء "The resource name already exists"
- يفشل النشر أثناء إنشاء الموارد

**الحلول:**
```bash
# 1. استخدم أسماء موارد فريدة مع توكنات
# في قالب Bicep الخاص بك:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. غيّر اسم البيئة
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. نظّف الموارد الموجودة
azd down --force --purge
```

### المشكلة: الموقع/المنطقة غير متاحة
**الأعراض:**
- "The location 'xyz' is not available for resource type"
- بعض SKUs غير متاحة في المنطقة المحددة

**الحلول:**
```bash
# 1. التحقق من المواقع المتاحة لأنواع الموارد
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. استخدم المناطق المتاحة بشكلٍ شائع
azd config set defaults.location eastus2
# أو
azd env set AZURE_LOCATION eastus2

# 3. التحقق من توفر الخدمة حسب المنطقة
# زيارة: https://azure.microsoft.com/global-infrastructure/services/
```

### المشكلة: أخطاء تجاوز الحصة
**الأعراض:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**الحلول:**
```bash
# 1. تحقق من استخدام الحصة الحالية
az vm list-usage --location eastus2 -o table

# 2. اطلب زيادة الحصة من خلال بوابة Azure
# اذهب إلى: الاشتراكات > الاستخدام + الحصص

# 3. استخدم وحدات SKU أصغر للتطوير
# في main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. قم بتنظيف الموارد غير المستخدمة
az resource list --query "[?contains(name, 'unused')]" -o table
```

### المشكلة: أخطاء قالب Bicep
**الأعراض:**
- فشل التحقق من القالب
- أخطاء تركيبية في ملفات Bicep

**الحلول:**
```bash
# 1. التحقق من صحة بناء جملة Bicep
az bicep build --file infra/main.bicep

# 2. استخدام أداة فحص Bicep
az bicep lint --file infra/main.bicep

# 3. التحقق من صحة بنية ملف المعلمات
cat infra/main.parameters.json | jq '.'

# 4. معاينة تغييرات النشر
azd provision --preview
```

## 🚀 فشل النشر

### المشكلة: فشل البناء
**الأعراض:**
- يفشل التطبيق في البناء أثناء النشر
- أخطاء تثبيت الحزم

**الحلول:**
```bash
# 1. تحقق من ناتج البناء باستخدام خيار التصحيح
azd deploy --service web --debug

# 2. عرض حالة الخدمة المنشورة
azd show

# 3. اختبار البناء محليًا
cd src/web
npm install
npm run build

# 3. تحقق من توافق إصدارات Node.js و Python
node --version  # يجب أن تتطابق مع إعدادات azure.yaml
python --version

# 4. مسح ذاكرة التخزين المؤقت للبناء
rm -rf node_modules package-lock.json
npm install

# 5. تحقق من Dockerfile إذا كنت تستخدم الحاويات
docker build -t test-image .
docker run --rm test-image
```

### المشكلة: فشل نشر الحاويات
**الأعراض:**
- تفشل تطبيقات الحاويات في البدء
- أخطاء سحب الصورة

**الحلول:**
```bash
# 1. اختبار بناء Docker محليًا
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. تحقق من سجلات الحاوية باستخدام Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. راقب التطبيق عبر azd
azd monitor --logs

# 3. تحقق من الوصول إلى سجل الحاويات
az acr login --name myregistry

# 4. تحقق من تكوين تطبيق الحاوية
az containerapp show --name my-app --resource-group my-rg
```

### المشكلة: فشل اتصال قاعدة البيانات
**الأعراض:**
- لا يستطيع التطبيق الاتصال بقاعدة البيانات
- أخطاء نفاد مهلة الاتصال

**الحلول:**
```bash
# 1. تحقق من قواعد جدار حماية قاعدة البيانات
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. اختبر الاتصال من التطبيق
# أضف إلى تطبيقك مؤقتًا:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. تحقق من تنسيق سلسلة الاتصال
azd env get-values | grep DATABASE

# 4. تحقق من حالة خادم قاعدة البيانات
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 مشكلات التكوين

### المشكلة: متغيرات البيئة لا تعمل
**الأعراض:**
- لا يستطيع التطبيق قراءة قيم التكوين
- تبدو متغيرات البيئة فارغة

**الحلول:**
```bash
# 1. التأكد من تعيين متغيرات البيئة
azd env get-values
azd env get DATABASE_URL

# 2. التحقق من أسماء المتغيرات في azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. إعادة تشغيل التطبيق
azd deploy --service web

# 4. التحقق من تكوين خدمة التطبيق
az webapp config appsettings list --name myapp --resource-group myrg
```

### المشكلة: مشاكل شهادات SSL/TLS
**الأعراض:**
- HTTPS لا يعمل
- أخطاء التحقق من الشهادة

**الحلول:**
```bash
# 1. تحقق من حالة شهادة SSL
az webapp config ssl list --resource-group myrg

# 2. فعّل HTTPS فقط
az webapp update --name myapp --resource-group myrg --https-only true

# 3. أضف نطاقًا مخصصًا (إذا لزم الأمر)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### المشكلة: مشكلات تكوين CORS
**الأعراض:**
- الواجهة الأمامية لا تستطيع استدعاء واجهة برمجة التطبيقات
- تم حظر الطلب عبر الأصل

**الحلول:**
```bash
# 1. تكوين CORS لخدمة التطبيق
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. تحديث واجهة برمجة التطبيقات للتعامل مع CORS
# في Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. التحقق مما إذا كان يعمل على عناوين URL الصحيحة
azd show
```

## 🌍 مشكلات إدارة البيئة

### المشكلة: مشاكل تبديل البيئة
**الأعراض:**
- يتم استخدام بيئة خاطئة
- التكوين لا يتغير بشكل صحيح

**الحلول:**
```bash
# 1. عرض جميع البيئات
azd env list

# 2. اختر البيئة صراحةً
azd env select production

# 3. تحقق من البيئة الحالية
azd env list

# 4. إنشاء بيئة جديدة إذا كانت تالفة
azd env new production-new
azd env select production-new
```

### المشكلة: تلف البيئة
**الأعراض:**
- تُظهر البيئة حالة غير صالحة
- الموارد لا تطابق التكوين

**الحلول:**
```bash
# 1. تحديث حالة البيئة
azd env refresh

# 2. إعادة تعيين تكوين البيئة
azd env new production-reset
# انسخ متغيرات البيئة المطلوبة
azd env set DATABASE_URL "your-value"

# 3. استيراد الموارد الموجودة (إذا أمكن)
# قم بتحديث ملف .azure/production/config.json يدوياً بمعرّفات الموارد
```

## 🔍 مشاكل الأداء

### المشكلة: بطء أوقات النشر
**الأعراض:**
- استغراق عمليات النشر وقتًا طويلاً
- انتهاء المهلة أثناء النشر

**الحلول:**
```bash
# 1. نشر خدمات محددة لتسريع التكرار
azd deploy --service web
azd deploy --service api

# 2. استخدم النشر القائم على الكود فقط عندما لا تتغير البنية التحتية
azd deploy  # أسرع من azd up

# 3. تحسين عملية البناء
# في package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. تحقق من مواقع الموارد (استخدم نفس المنطقة)
azd config set defaults.location eastus2
```

### المشكلة: مشاكل أداء التطبيق
**الأعراض:**
- بطء أوقات الاستجابة
- استخدام موارد عالٍ

**الحلول:**
```bash
# 1. زيادة الموارد
# تحديث SKU في main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. تفعيل مراقبة Application Insights
azd monitor --overview

# 3. تحقق من سجلات التطبيق في Azure
az webapp log tail --name myapp --resource-group myrg
# أو بالنسبة لتطبيقات الحاويات:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. تنفيذ التخزين المؤقت
# أضف ذاكرة تخزين مؤقت Redis إلى بنيتك التحتية
```

## 🛠️ أدوات وأوامر استكشاف الأخطاء

### أوامر التصحيح
```bash
# تصحيح شامل
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# تحقق من إصدار azd
azd version

# عرض التكوين الحالي
azd config show

# اختبار الاتصال
curl -v https://myapp.azurewebsites.net/health
```

### تحليل السجلات
```bash
# سجلات التطبيق عبر واجهة سطر أوامر Azure
az webapp log tail --name myapp --resource-group myrg

# مراقبة التطبيق باستخدام azd
azd monitor --logs
azd monitor --live

# سجلات موارد Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# سجلات الحاويات (لتطبيقات الحاويات)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### التحقيق في الموارد
```bash
# عرض جميع الموارد
az resource list --resource-group myrg -o table

# تحقق من حالة المورد
az webapp show --name myapp --resource-group myrg --query state

# تشخيص الشبكة
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 الحصول على مساعدة إضافية

### متى يجب التصعيد
- استمرار مشكلات المصادقة بعد تجربة كل الحلول
- مشكلات البنية التحتية مع خدمات Azure
- مشكلات الفوترة أو الاشتراك
- مخاوف أو حوادث أمنية

### قنوات الدعم
```bash
# 1. التحقق من حالة خدمة Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. إنشاء تذكرة دعم لدى Azure
# انتقل إلى: https://portal.azure.com -> المساعدة والدعم

# 3. موارد المجتمع
# - Stack Overflow: وسم azure-developer-cli
# - مشكلات GitHub: https://github.com/Azure/azure-dev/issues
# - أسئلة وأجوبة Microsoft: https://learn.microsoft.com/en-us/answers/
```

### المعلومات التي يجب جمعها
قبل الاتصال بالدعم، اجمع:
- مخرجات `azd version`
- مخرجات `azd config show`
- مخرجات `azd show` (حالة النشر الحالية)
- رسائل الخطأ (النص الكامل)
- خطوات إعادة إنتاج المشكلة
- تفاصيل البيئة (`azd env get-values`)
- الجدول الزمني لبدء المشكلة

### سكربت جمع السجلات
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
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 منع المشكلات

### قائمة التحقق قبل النشر
```bash
# ١. تحقق من المصادقة
az account show

# ٢. تحقق من الحصص والحدود
az vm list-usage --location eastus2

# ٣. تحقق من القوالب
az bicep build --file infra/main.bicep

# ٤. اختبر محليًا أولاً
npm run build
npm run test

# ٥. استخدم عمليات نشر تجريبية
azd provision --preview
```

### إعداد المراقبة
```bash
# تمكين Application Insights
# أضف إلى main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# قم بإعداد التنبيهات
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### الصيانة الدورية
```bash
# فحوصات صحية أسبوعية
./scripts/health-check.sh

# مراجعة التكاليف الشهرية
az consumption usage list --billing-period-name 202401

# مراجعة أمنية ربع سنوية
az security assessment list --resource-group myrg
```

## الموارد ذات الصلة

- [دليل تصحيح الأخطاء](debugging.md) - تقنيات متقدمة لتصحيح الأخطاء
- [توفير الموارد](../chapter-04-infrastructure/provisioning.md) - استكشاف أخطاء البنية التحتية
- [تخطيط السعة](../chapter-06-pre-deployment/capacity-planning.md) - إرشادات تخطيط الموارد
- [اختيار SKU](../chapter-06-pre-deployment/sku-selection.md) - توصيات مستوى الخدمة

---

**نصيحة**: احتفظ بهذا الدليل في المفضلة وارجع إليه كلما واجهت مشكلات. لقد تم رؤية معظم المشاكل من قبل وهناك حلول مثبتة لها!

---

**التنقل**
- **الدرس السابق**: [توفير الموارد](../chapter-04-infrastructure/provisioning.md)
- **الدرس التالي**: [دليل تصحيح الأخطاء](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**إخلاء المسؤولية**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية [Co-op Translator](https://github.com/Azure/co-op-translator). على الرغم من سعينا للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر المعتمد. للمعلومات الحرجة، يُنصح بالاستعانة بترجمة احترافية بشرية. نحن غير مسؤولين عن أي سوء فهم أو تفسير قد ينشأ عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->