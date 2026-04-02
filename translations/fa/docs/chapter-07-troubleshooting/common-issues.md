# مسائل و راه‌حل‌های رایج

**ناوبری فصل:**
- **📚 صفحهٔ دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل 7 - عیب‌یابی و رفع اشکال
- **⬅️ فصل قبلی**: [فصل 6: بررسی‌های پیش از استقرار](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ بعدی**: [راهنمای دیباگ](debugging.md)
- **🚀 فصل بعد**: [فصل 8: الگوهای تولید و سازمانی](../chapter-08-production/production-ai-practices.md)

## مقدمه

این راهنمای جامع عیب‌یابی رایج‌ترین مشکلاتی را که هنگام استفاده از Azure Developer CLI پیش می‌آید پوشش می‌دهد. بیاموزید چگونه مشکلات مربوط به احراز هویت، استقرار، تأمین زیرساخت و پیکربندی برنامه را تشخیص، عیب‌یابی و رفع کنید. هر مشکل شامل علائم تفصیلی، علت‌های ریشه‌ای و مراحل گام‌به‌گام رفع مشکل است.

## اهداف یادگیری

با تکمیل این راهنما شما:
- مهارت در تکنیک‌های تشخیص برای مشکلات Azure Developer CLI را کسب می‌کنید
- مشکلات رایج احراز هویت و مجوزها و راه‌حل‌های آن‌ها را می‌فهمید
- شکست‌های استقرار، خطاهای تأمین زیرساخت و مشکلات پیکربندی را برطرف می‌کنید
- استراتژی‌های پیشگیرانهٔ مانیتورینگ و دیباگ را پیاده‌سازی می‌کنید
- روش‌های نظام‌مند عیب‌یابی برای مسائل پیچیده را به کار می‌برید
- لاگ‌گیری و مانیتورینگ مناسب را پیکربندی می‌کنید تا از بروز مشکلات آتی جلوگیری شود

## نتایج یادگیری

پس از تکمیل، شما قادر خواهید بود:
- مشکلات Azure Developer CLI را با استفاده از ابزارهای تشخیصی تعبیه‌شده تشخیص دهید
- مسائل مربوط به احراز هویت، اشتراک‌ها و مجوزها را به‌طور مستقل حل کنید
- شکست‌های استقرار و خطاهای تأمین زیرساخت را به‌طور مؤثر عیب‌یابی کنید
- مشکلات پیکربندی برنامه و مسائل مرتبط با محیط را دیباگ کنید
- مانیتورینگ و هشداردهی را پیاده‌سازی کنید تا مسائل بالقوه را پیشاپیش شناسایی کنید
- بهترین شیوه‌ها برای لاگ‌گیری، دیباگ و جریان‌های کاری حل مشکل را اعمال کنید

## تشخیص سریع

قبل از پرداختن به مشکلات خاص، این دستورات را اجرا کنید تا اطلاعات تشخیصی جمع‌آوری شود:

```bash
# بررسی نسخه و وضعیت سلامت azd
azd version
azd config show

# تأیید احراز هویت Azure
az account show
az account list

# بررسی محیط فعلی
azd env list
azd env get-values

# فعال‌سازی ثبت لاگ اشکال‌زدایی
export AZD_DEBUG=true
azd <command> --debug
```

## مشکلات احراز هویت

### مشکل: "دریافت توکن دسترسی ناموفق"
**علائم:**
- اجرای `azd up` با خطاهای احراز هویت شکست می‌خورد
- دستورات پیام‌های «unauthorized» یا «access denied» را برمی‌گردانند

**راه‌حل‌ها:**
```bash
# 1. احراز هویت مجدد با Azure CLI
az login
az account show

# 2. پاک کردن گواهی‌نامه‌های ذخیره‌شده
az account clear
az login

# 3. استفاده از جریان کد دستگاه (برای سیستم‌های بدون رابط گرافیکی)
az login --use-device-code

# 4. تنظیم صریح اشتراک
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### مشکل: "عدم دسترسی کافی" در هنگام استقرار
**علائم:**
- استقرار با خطاهای مجوز شکست می‌خورد
- نمی‌توان برخی از منابع Azure را ایجاد کرد

**راه‌حل‌ها:**
```bash
# 1. تخصیص نقش‌های Azure خود را بررسی کنید
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. اطمینان حاصل کنید که نقش‌های لازم را دارید
# - Contributor (برای ایجاد منابع)
# - User Access Administrator (برای تخصیص نقش‌ها)

# 3. برای دریافت مجوزهای مناسب با مدیر Azure خود تماس بگیرید
```

### مشکل: مسائل احراز هویت چندمستأجره
**راه‌حل‌ها:**
```bash
# ۱. ورود با مستاجر مشخص
az login --tenant "your-tenant-id"

# ۲. تنظیم مستاجر در پیکربندی
azd config set auth.tenantId "your-tenant-id"

# ۳. پاک‌سازی کش مستاجر در صورت تغییر مستاجر
az account clear
```

## 🏗️ خطاهای تأمین زیرساخت

### مشکل: تداخل نام منبع
**علائم:**
- خطاهایی مانند "The resource name already exists"
- استقرار در زمان ایجاد منابع شکست می‌خورد

**راه‌حل‌ها:**
```bash
# 1. از نام‌های منحصربه‌فرد برای منابع با توکن‌ها استفاده کنید
# در قالب Bicep خود:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. نام محیط را تغییر دهید
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. منابع موجود را پاک‌سازی کنید
azd down --force --purge
```

### مشکل: موقعیت/منطقه در دسترس نیست
**علائم:**
- "The location 'xyz' is not available for resource type"
- برخی از SKUها در منطقهٔ انتخاب‌شده موجود نیستند

**راه‌حل‌ها:**
```bash
# 1. بررسی مکان‌های موجود برای انواع منابع
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. از مناطق معمولاً در دسترس استفاده کنید
azd config set defaults.location eastus2
# یا
azd env set AZURE_LOCATION eastus2

# 3. بررسی در دسترس بودن سرویس‌ها بر اساس منطقه
# بازدید: https://azure.microsoft.com/global-infrastructure/services/
```

### مشکل: خطاهای تجاوز از سهمیه
**علائم:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**راه‌حل‌ها:**
```bash
# ۱. استفاده فعلی از سهمیه را بررسی کنید
az vm list-usage --location eastus2 -o table

# ۲. از طریق پورتال Azure درخواست افزایش سهمیه دهید
# به: اشتراک‌ها > استفاده + سهمیه‌ها مراجعه کنید

# ۳. برای توسعه از SKUهای کوچک‌تر استفاده کنید
# در فایل main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# ۴. منابع استفاده‌نشده را پاک کنید
az resource list --query "[?contains(name, 'unused')]" -o table
```

### مشکل: خطاهای قالب Bicep
**علائم:**
- خطاهای اعتبارسنجی قالب
- خطاهای نحوی در فایل‌های Bicep

**راه‌حل‌ها:**
```bash
# ‎1. اعتبارسنجی نحو Bicep
az bicep build --file infra/main.bicep

# ‎2. از لینتر Bicep استفاده کنید
az bicep lint --file infra/main.bicep

# ‎3. بررسی نحو فایل پارامتر
cat infra/main.parameters.json | jq '.'

# ‎4. پیش‌نمایش تغییرات استقرار
azd provision --preview
```

## 🚀 شکست‌های استقرار

### مشکل: شکست‌های ساخت
**علائم:**
- برنامه در حین استقرار قادر به ساخت نیست
- خطا در نصب بسته‌ها

**راه‌حل‌ها:**
```bash
# 1. خروجی ساخت را با پرچم اشکال‌زدایی بررسی کنید
azd deploy --service web --debug

# 2. وضعیت سرویس مستقر را مشاهده کنید
azd show

# 3. ساخت را به‌صورت محلی تست کنید
cd src/web
npm install
npm run build

# 3. سازگاری نسخه‌های Node.js و Python را بررسی کنید
node --version  # باید با تنظیمات azure.yaml مطابقت داشته باشد
python --version

# 4. کش ساخت را پاک کنید
rm -rf node_modules package-lock.json
npm install

# 5. در صورت استفاده از کانتینرها، Dockerfile را بررسی کنید
docker build -t test-image .
docker run --rm test-image
```

### مشکل: شکست‌های استقرار کانتینر
**علائم:**
- برنامه‌های کانتینری شروع به کار نمی‌کنند
- خطاهای دریافت ایمیج

**راه‌حل‌ها:**
```bash
# 1. تست ساخت Docker به‌صورت محلی
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. بررسی لاگ‌های کانتینر با استفاده از Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. نظارت بر برنامه از طریق azd
azd monitor --logs

# 3. بررسی دسترسی به رجیستری کانتینر
az acr login --name myregistry

# 4. بررسی پیکربندی برنامهٔ کانتینری
az containerapp show --name my-app --resource-group my-rg
```

### مشکل: خرابی‌های اتصال به پایگاه داده
**علائم:**
- برنامه قادر به اتصال به پایگاه داده نیست
- خطاهای timeout در اتصال

**راه‌حل‌ها:**
```bash
# 1. قوانین فایروال پایگاه داده را بررسی کنید
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. اتصال از برنامه را آزمایش کنید
# این را موقتاً به برنامه خود اضافه کنید:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. قالب رشته اتصال را بررسی کنید
azd env get-values | grep DATABASE

# 4. وضعیت سرور پایگاه داده را بررسی کنید
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 مشکلات پیکربندی

### مشکل: متغیرهای محیطی کار نمی‌کنند
**علائم:**
- برنامه قادر به خواندن مقادیر پیکربندی نیست
- متغیرهای محیطی خالی به نظر می‌رسند

**راه‌حل‌ها:**
```bash
# اطمینان حاصل کنید که متغیرهای محیطی تنظیم شده‌اند
azd env get-values
azd env get DATABASE_URL

# نام متغیرها را در azure.yaml بررسی کنید
cat azure.yaml | grep -A 5 env:

# برنامه را مجدداً راه‌اندازی کنید
azd deploy --service web

# پیکربندی سرویس برنامه را بررسی کنید
az webapp config appsettings list --name myapp --resource-group myrg
```

### مشکل: مشکلات گواهی SSL/TLS
**علائم:**
- HTTPS کار نمی‌کند
- خطاهای اعتبارسنجی گواهی

**راه‌حل‌ها:**
```bash
# ۱. وضعیت گواهی‌نامه SSL را بررسی کنید
az webapp config ssl list --resource-group myrg

# ۲. تنها HTTPS را فعال کنید
az webapp update --name myapp --resource-group myrg --https-only true

# ۳. در صورت نیاز دامنه سفارشی را اضافه کنید
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### مشکل: مشکلات پیکربندی CORS
**علائم:**
- فرانت‌اند قادر به فراخوانی API نیست
- درخواست‌های متقاطع منبع مسدود می‌شوند

**راه‌حل‌ها:**
```bash
# 1. پیکربندی CORS برای App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. به‌روزرسانی API برای مدیریت CORS
# در Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. بررسی اینکه آیا روی URLهای صحیح اجرا می‌شود
azd show
```

## 🌍 مشکلات مدیریت محیط

### مشکل: مشکلات تغییر محیط
**علائم:**
- از محیط اشتباه استفاده می‌شود
- پیکربندی به‌درستی تغییر نمی‌کند

**راه‌حل‌ها:**
```bash
# 1. فهرست همهٔ محیط‌ها
azd env list

# 2. به‌صراحت محیط را انتخاب کنید
azd env select production

# 3. محیط جاری را بررسی کنید
azd env list

# 4. در صورت خراب بودن، محیط جدید ایجاد کنید
azd env new production-new
azd env select production-new
```

### مشکل: خرابی محیط
**علائم:**
- محیط وضعیت نامعتبری نشان می‌دهد
- منابع با پیکربندی مطابقت ندارند

**راه‌حل‌ها:**
```bash
# 1. تازه‌سازی وضعیت محیط
azd env refresh

# 2. بازنشانی پیکربندی محیط
azd env new production-reset
# متغیرهای محیطی لازم را کپی کنید
azd env set DATABASE_URL "your-value"

# 3. وارد کردن منابع موجود (در صورت امکان)
# به‌صورت دستی فایل .azure/production/config.json را با شناسه‌های منابع به‌روز کنید
```

## 🔍 مشکلات عملکرد

### مشکل: زمان‌های طولانی استقرار
**علائم:**
- استقرارها بیش از حد طول می‌کشند
- Timeout در حین استقرار رخ می‌دهد

**راه‌حل‌ها:**
```bash
# 1. استقرار سرویس‌های مشخص برای تکرار سریع‌تر
azd deploy --service web
azd deploy --service api

# 2. وقتی زیرساخت تغییر نکرده است، فقط کد را مستقر کنید
azd deploy  # سریع‌تر از azd up

# 3. بهینه‌سازی فرآیند ساخت
# در package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. مکان‌های منابع را بررسی کنید (از همان منطقه استفاده کنید)
azd config set defaults.location eastus2
```

### مشکل: مشکلات عملکرد برنامه
**علائم:**
- زمان پاسخ‌دهی کند
- مصرف منابع بالا

**راه‌حل‌ها:**
```bash
# ۱. افزایش منابع
# SKU را در main.parameters.json به‌روزرسانی کنید:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# ۲. فعال‌سازی مانیتورینگ Application Insights
azd monitor --overview

# ۳. بررسی لاگ‌های برنامه در Azure
az webapp log tail --name myapp --resource-group myrg
# یا برای Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# ۴. پیاده‌سازی کش
# کش Redis را به زیرساخت خود اضافه کنید
```

## 🛠️ ابزارها و دستورات عیب‌یابی

### دستورات دیباگ
```bash
# اشکال‌زدایی جامع
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# بررسی نسخه azd
azd version

# نمایش پیکربندی فعلی
azd config show

# تست اتصال
curl -v https://myapp.azurewebsites.net/health
```

### تحلیل لاگ‌ها
```bash
# لاگ‌های برنامه از طریق Azure CLI
az webapp log tail --name myapp --resource-group myrg

# نظارت بر برنامه با azd
azd monitor --logs
azd monitor --live

# لاگ‌های منابع Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# لاگ‌های کانتینر (برای Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### بررسی منابع
```bash
# فهرست تمام منابع
az resource list --resource-group myrg -o table

# وضعیت منابع را بررسی کنید
az webapp show --name myapp --resource-group myrg --query state

# عیب‌یابی شبکه
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 دریافت کمک بیشتر

### زمانی که باید موضوع را ارجاع دهید
- مسائل احراز هویت پس از تلاش برای تمام راه‌حل‌ها ادامه دارند
- مشکلات زیرساختی با سرویس‌های Azure
- مسائل مربوط به صورتحساب یا اشتراک
- نگرانی‌ها یا رخدادهای امنیتی

### کانال‌های پشتیبانی
```bash
# 1. بررسی سلامت سرویس‌های Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. ایجاد تیکت پشتیبانی برای Azure
# به آدرس مراجعه کنید: https://portal.azure.com -> راهنما و پشتیبانی

# 3. منابع انجمن
# - Stack Overflow: تگ azure-developer-cli
# - مسائل GitHub: https://github.com/Azure/azure-dev/issues
# - پرسش و پاسخ Microsoft: https://learn.microsoft.com/en-us/answers/
```

### اطلاعاتی که باید جمع‌آوری شود
قبل از تماس با پشتیبانی، جمع‌آوری کنید:
- خروجی `azd version`
- خروجی `azd config show`
- خروجی `azd show` (وضعیت فعلی استقرار)
- پیام‌های خطا (متن کامل)
- مراحل بازتولید مشکل
- جزئیات محیط (`azd env get-values`)
- خط زمانی آغاز بروز مشکل

### اسکریپت جمع‌آوری لاگ
```bash
#!/bin/bash
# جمع‌آوری-اطلاعات-عیب‌یابی.sh

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

## 📊 پیشگیری از مشکلات

### چک‌لیست پیش از استقرار
```bash
# ۱. اعتبارسنجی احراز هویت
az account show

# ۲. بررسی سهمیه‌ها و محدودیت‌ها
az vm list-usage --location eastus2

# ۳. اعتبارسنجی قالب‌ها
az bicep build --file infra/main.bicep

# ۴. ابتدا به‌صورت محلی تست کنید
npm run build
npm run test

# ۵. از استقرارهای dry-run استفاده کنید
azd provision --preview
```

### پیکربندی مانیتورینگ
```bash
# فعال‌سازی Application Insights
# به فایل main.bicep اضافه کنید:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# پیکربندی هشدارها
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### نگهداری منظم
```bash
# بررسی سلامت هفتگی
./scripts/health-check.sh

# بازبینی هزینه ماهیانه
az consumption usage list --billing-period-name 202401

# بازبینی امنیتی سه‌ماهه
az security assessment list --resource-group myrg
```

## منابع مرتبط

- [راهنمای دیباگ](debugging.md) - تکنیک‌های پیشرفتهٔ دیباگ
- [تأمین منابع](../chapter-04-infrastructure/provisioning.md) - عیب‌یابی زیرساخت
- [برنامه‌ریزی ظرفیت](../chapter-06-pre-deployment/capacity-planning.md) - راهنمای برنامه‌ریزی منابع
- [انتخاب SKU](../chapter-06-pre-deployment/sku-selection.md) - توصیه‌های سطح سرویس

---

**نکته**: این راهنما را نشانه‌گذاری کنید و هر زمان با مشکلی مواجه شدید به آن مراجعه کنید. اکثر مشکلات قبلاً دیده شده‌اند و راه‌حل‌های مشخصی دارند!

---

**ناوبری**
- **درس قبلی**: [تأمین منابع](../chapter-04-infrastructure/provisioning.md)
- **درس بعدی**: [راهنمای دیباگ](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه‌ی هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی اشتباهات یا نادرستی‌هایی باشند. سند اصلی به زبان مادری آن باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس یا حیاتی، ترجمه‌ی حرفه‌ای انسانی توصیه می‌شود. ما مسئول هیچ‌گونه سوءتفاهم یا برداشت نادرستی که ناشی از استفاده از این ترجمه باشد، نیستیم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->