# مشکلات و راه‌حل‌های رایج

**هدایت فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۷ - عیب‌یابی و اشکال‌زدایی
- **⬅️ فصل قبل**: [فصل ۶: بررسی‌های پیش‌پروازی](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ بعدی**: [راهنمای اشکال‌زدایی](debugging.md)
- **🚀 فصل بعدی**: [فصل ۸: الگوهای تولید و سازمانی](../chapter-08-production/production-ai-practices.md)

## مقدمه

این راهنمای جامع عیب‌یابی، رایج‌ترین مشکلات هنگام استفاده از Azure Developer CLI را پوشش می‌دهد. یاد بگیرید چگونه مشکلات مربوط به احراز هویت، استقرار، تامین زیرساخت و پیکربندی برنامه را تشخیص، عیب‌یابی و حل کنید. هر مشکل شامل علائم دقیق، علل اصلی و مراحل گام‌به‌گام حل آن است.

## اهداف یادگیری

با تکمیل این راهنما شما:
- تسلط بر تکنیک‌های تشخیص مشکلات Azure Developer CLI
- درک مشکلات رایج احراز هویت و مجوزها و راه‌حل‌های آنها
- رفع خطاهای استقرار، تامین زیرساخت و پیکربندی
- اجرای راهبردهای پیشگیرانه نظارت و اشکال‌زدایی
- به‌کارگیری متدولوژی‌های سیستماتیک عیب‌یابی برای مشکلات پیچیده
- پیکربندی مناسب ثبت وقایع و نظارت برای جلوگیری از مشکلات آینده

## نتایج یادگیری

پس از پایان، قادر خواهید بود:
- مسائل Azure Developer CLI را با استفاده از ابزارهای تشخیصی داخلی شناسایی کنید
- مشکلات مربوط به احراز هویت، اشتراک و مجوزها را به صورت مستقل حل کنید
- خطاهای استقرار و تامین زیرساخت را به طور موثر رفع کنید
- مشکلات پیکربندی برنامه و محیط را اشکال‌زدایی نمایید
- نظارت و هشداردهی را برای شناسایی پیشگیرانه مشکلات احتمالی پیاده‌سازی کنید
- بهترین روش‌ها را برای ثبت وقایع، اشکال‌زدایی و روندهای حل مشکل به‌کار ببرید

## تشخیص سریع

> نام‌ها/شناسه‌های نمونه را با مقادیر محیط خود جایگزین کنید. قطعات کد Bash، Bicep، JavaScript و فایل پارامتر جداگانه برچسب‌گذاری شده‌اند؛ اینها یک اسکریپت اجرایی واحد نیستند. عملیات تخریبی را بررسی و اسرار را پیش از به اشتراک‌گذاری تشخیص‌ عیب‌ها حذف کنید. `azd monitor --logs` مرورگر را باز می‌کند؛ لاگ‌های ترمینال را پخش نمی‌کند.

پیش از پرداختن به مشکلات خاص، این دستورات را برای جمع‌آوری اطلاعات تشخیصی اجرا کنید:

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

## مشکلات احراز هویت

### مشکل: "دریافت نشانه دسترسی ناموفق بود"
**علائم:**
- `azd up` با خطاهای احراز هویت شکست می‌خورد
- دستورات پیام "عدم مجوز" یا "دسترسی ممنوع" می‌دهند

**راه‌حل‌ها:**
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

### مشکل: "امتیازات کافی نیست" در حین استقرار
**علائم:**
- استقرار با خطاهای مجوز شکست می‌خورد
- امکان ایجاد برخی منابع Azure نیست

**راه‌حل‌ها:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### مشکل: مشکلات احراز هویت چند مستاجری
**راه‌حل‌ها:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ خطاهای تامین زیرساخت

### مشکل: تداخل نام منابع
**علائم:**
- خطاهای "نام منبع قبلاً وجود دارد"
- استقرار در هنگام ایجاد منابع شکست می‌خورد

**راه‌حل‌ها:**
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

### مشکل: مکان/منطقه در دسترس نیست
**علائم:**
- "مکان 'xyz' برای نوع منبع در دسترس نیست"
- برخی SKUها در منطقه انتخاب‌شده موجود نیستند

**راه‌حل‌ها:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

تغییر مقدار متغیر مکان منابع موجود را مهاجرت نمی‌دهد. یک گروه منبع یا منبع موجود ممکن است تغییر مکان را نپذیرد؛ برای استقرار مجدد منطقه‌ای از محیط جداگانه استفاده کنید.

### مشکل: خطاهای تجاوز از سهمیه
**علائم:**
- "سهمیه نوع منبع تجاوز شده است"
- "حداکثر تعداد منابع رسیده است"

**راه‌حل‌ها:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

برای توسعه، یک SKU کوچک‌تر و پشتیبانی شده در `infra/main.parameters.json` انتخاب کنید:

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

### مشکل: خطاهای قالب Bicep
**علائم:**
- شکست در اعتبارسنجی قالب
- خطاهای نحوی در فایل‌های Bicep

**راه‌حل‌ها:**
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

## 🚀 شکست‌های استقرار

### مشکل: شکست در بیلد
**علائم:**
- برنامه در حین استقرار بیلد نمی‌شود
- خطاهای نصب بسته‌ها

**راه‌حل‌ها:**
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

### مشکل: شکست استقرار کانتینر
**علائم:**
- برنامه‌های کانتینری اجرا نمی‌شوند
- خطاهای دریافت تصویر

**راه‌حل‌ها:**
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

### مشکل: شکست اتصال به پایگاه داده
**علائم:**
- برنامه قادر به اتصال به پایگاه داده نیست
- خطاهای Timeout اتصال

**راه‌حل‌ها:**
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

## 🔧 مشکلات پیکربندی

### مشکل: متغیرهای محیطی کار نمی‌کنند
**علائم:**
- برنامه نمی‌تواند مقادیر پیکربندی را بخواند
- متغیرهای محیطی خالی به نظر می‌رسند

**راه‌حل‌ها:**
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

### مشکل: مشکلات گواهینامه SSL/TLS
**علائم:**
- HTTPS کار نمی‌کند
- خطاهای اعتبارسنجی گواهینامه

**راه‌حل‌ها:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### مشکل: مشکلات پیکربندی CORS
**علائم:**
- فرانت‌اند نمی‌تواند به API فراخوانی کند
- درخواست‌های بین‌مبدا مسدود شده‌اند

**راه‌حل‌ها:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. برنامه Express موجود خود را به‌روزرسانی کنید (با واردکردن `cors`):

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

## 🌍 مشکلات مدیریت محیط

### مشکل: مشکلات تغییر محیط
**علائم:**
- محیط اشتباه به کار می‌رود
- پیکربندی به درستی تغییر نمی‌کند

**راه‌حل‌ها:**
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

### مشکل: فساد محیط
**علائم:**
- محیط وضعیت نامعتبر نشان می‌دهد
- منابع با پیکربندی مطابقت ندارند

**راه‌حل‌ها:**
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

## 🔍 مشکلات عملکرد

### مشکل: زمان‌های طولانی استقرار
**علائم:**
- استقرارها بیش از حد طول می‌کشند
- Timeout در طول استقرار

**راه‌حل‌ها:**
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

### مشکل: مشکلات عملکرد برنامه
**علائم:**
- زمان پاسخ‌دهی کند
- مصرف بالای منابع

**راه‌حل‌ها:**
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

## 🛠️ ابزارها و دستورات عیب‌یابی

### دستورات اشکال‌زدایی
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

### تحلیل لاگ
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

### بررسی منابع
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 دریافت کمک بیشتر

### زمان گزارش به سطح بالاتر
- پس از اجرا تمام راه‌حل‌ها مشکل احراز هویت هنوز وجود دارد
- مشکلات زیرساخت در خدمات Azure
- مشکلات مربوط به صورت‌حساب یا اشتراک
- نگرانی‌ها یا حوادث امنیتی

### کانال‌های پشتیبانی
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

### اطلاعات قابل جمع‌آوری
پیش از تماس با پشتیبانی، موارد زیر را جمع‌آوری کنید:
- خروجی `azd version`
- خروجی `azd config show`
- خروجی `azd show` (وضعیت فعلی استقرار)
- پیام‌های خطا (متن کامل)
- مراحل بازتولید مشکل
- جزئیات محیط حذف شده (هرگز `azd env get-values` خام شامل اسرار را به اشتراک نگذارید)
- جدول زمانی شروع مشکل

### اسکریپت جمع‌آوری لاگ
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

## 📊 پیشگیری از مشکل

### چک‌لیست پیش از استقرار
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

### تنظیم نظارت
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

### نگهداری منظم
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## منابع مرتبط

- [راهنمای اشکال‌زدایی](debugging.md) - تکنیک‌های پیشرفته عیب‌یابی
- [تامین منابع](../chapter-04-infrastructure/provisioning.md) - عیب‌یابی زیرساخت
- [برنامه‌ریزی ظرفیت](../chapter-06-pre-deployment/capacity-planning.md) - راهنمای برنامه‌ریزی منابع
- [انتخاب SKU](../chapter-06-pre-deployment/sku-selection.md) - توصیه‌های سطح سرویس

---

**نکته**: این راهنما را نشانه‌گذاری کنید و هر زمان با مشکلی مواجه شدید به آن مراجعه کنید. اکثر مشکلات قبلاً دیده شده‌اند و راه‌حل‌های مشخصی دارند!

---

**هدایت**
- **درس قبل**: [تامین منابع](../chapter-04-infrastructure/provisioning.md)
- **درس بعد**: [راهنمای اشکال‌زدایی](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->