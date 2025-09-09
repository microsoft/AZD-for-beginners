<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-09T17:08:40+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "fa"
}
-->
# مشکلات رایج و راه‌حل‌ها

## مقدمه

این راهنمای جامع عیب‌یابی به بررسی مشکلات متداول در استفاده از Azure Developer CLI می‌پردازد. یاد بگیرید چگونه مشکلات مربوط به احراز هویت، استقرار، ایجاد زیرساخت و پیکربندی برنامه را تشخیص داده، رفع و حل کنید. هر مشکل شامل علائم، دلایل اصلی و مراحل گام‌به‌گام برای حل آن است.

## اهداف یادگیری

با تکمیل این راهنما، شما:
- تکنیک‌های تشخیص مشکلات Azure Developer CLI را فرا خواهید گرفت
- مشکلات رایج مربوط به احراز هویت و مجوزها و راه‌حل‌های آن‌ها را درک خواهید کرد
- خطاهای استقرار، مشکلات ایجاد زیرساخت و مسائل پیکربندی را حل خواهید کرد
- استراتژی‌های نظارت و اشکال‌زدایی پیشگیرانه را اجرا خواهید کرد
- روش‌های عیب‌یابی سیستماتیک برای مشکلات پیچیده را به کار خواهید گرفت
- ثبت و نظارت مناسب را برای جلوگیری از مشکلات آینده پیکربندی خواهید کرد

## نتایج یادگیری

پس از تکمیل این راهنما، شما قادر خواهید بود:
- مشکلات Azure Developer CLI را با استفاده از ابزارهای تشخیصی داخلی شناسایی کنید
- مشکلات مربوط به احراز هویت، اشتراک و مجوزها را به طور مستقل حل کنید
- خطاهای استقرار و مشکلات ایجاد زیرساخت را به طور مؤثر رفع کنید
- مشکلات پیکربندی برنامه و مسائل خاص محیط را اشکال‌زدایی کنید
- نظارت و هشداردهی را برای شناسایی پیشگیرانه مشکلات احتمالی اجرا کنید
- بهترین روش‌ها برای ثبت، اشکال‌زدایی و جریان‌های کاری حل مشکلات را به کار ببرید

## تشخیص سریع

قبل از ورود به جزئیات مشکلات خاص، این دستورات را اجرا کنید تا اطلاعات تشخیصی جمع‌آوری شود:

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

## مشکلات احراز هویت

### مشکل: "عدم موفقیت در دریافت توکن دسترسی"
**علائم:**
- دستور `azd up` با خطاهای احراز هویت شکست می‌خورد
- دستورات پیام "غیرمجاز" یا "دسترسی رد شد" را بازمی‌گردانند

**راه‌حل‌ها:**
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

### مشکل: "مجوزهای ناکافی" در طول استقرار
**علائم:**
- استقرار با خطاهای مجوز شکست می‌خورد
- نمی‌توان برخی منابع Azure را ایجاد کرد

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

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ خطاهای ایجاد زیرساخت

### مشکل: تضاد نام منابع
**علائم:**
- خطاهای "نام منبع قبلاً وجود دارد"
- استقرار در طول ایجاد منابع شکست می‌خورد

**راه‌حل‌ها:**
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

### مشکل: مکان/منطقه در دسترس نیست
**علائم:**
- خطای "مکان 'xyz' برای نوع منبع در دسترس نیست"
- برخی SKUs در منطقه انتخاب‌شده موجود نیستند

**راه‌حل‌ها:**
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

### مشکل: خطاهای تجاوز از سهمیه
**علائم:**
- خطای "سهمیه برای نوع منبع تجاوز شده است"
- "حداکثر تعداد منابع رسیده است"

**راه‌حل‌ها:**
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

### مشکل: خطاهای قالب Bicep
**علائم:**
- شکست اعتبارسنجی قالب
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

### مشکل: شکست‌های ساخت
**علائم:**
- برنامه در طول استقرار نمی‌تواند ساخته شود
- خطاهای نصب بسته

**راه‌حل‌ها:**
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

### مشکل: شکست‌های استقرار کانتینر
**علائم:**
- برنامه‌های کانتینر نمی‌توانند شروع شوند
- خطاهای کشیدن تصویر

**راه‌حل‌ها:**
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

### مشکل: شکست‌های اتصال به پایگاه داده
**علائم:**
- برنامه نمی‌تواند به پایگاه داده متصل شود
- خطاهای زمان‌بندی اتصال

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
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### مشکل: مشکلات گواهی SSL/TLS
**علائم:**
- HTTPS کار نمی‌کند
- خطاهای اعتبارسنجی گواهی

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
- فرانت‌اند نمی‌تواند API را فراخوانی کند
- درخواست‌های Cross-origin مسدود شده‌اند

**راه‌حل‌ها:**
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

## 🌍 مشکلات مدیریت محیط

### مشکل: مشکلات تغییر محیط
**علائم:**
- محیط اشتباه استفاده می‌شود
- پیکربندی به درستی تغییر نمی‌کند

**راه‌حل‌ها:**
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

### مشکل: خرابی محیط
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

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 مشکلات عملکرد

### مشکل: زمان‌های طولانی استقرار
**علائم:**
- استقرارها بیش از حد طول می‌کشند
- زمان‌بندی‌ها در طول استقرار

**راه‌حل‌ها:**
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

### مشکل: مشکلات عملکرد برنامه
**علائم:**
- زمان‌های پاسخ‌دهی کند
- استفاده زیاد از منابع

**راه‌حل‌ها:**
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

## 🛠️ ابزارها و دستورات عیب‌یابی

### دستورات اشکال‌زدایی
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

### تحلیل لاگ‌ها
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

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

### زمان مناسب برای ارجاع
- مشکلات احراز هویت پس از امتحان همه راه‌حل‌ها ادامه دارند
- مشکلات زیرساخت با خدمات Azure
- مسائل مربوط به صورتحساب یا اشتراک
- نگرانی‌های امنیتی یا حوادث

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

### اطلاعات مورد نیاز برای جمع‌آوری
قبل از تماس با پشتیبانی، موارد زیر را جمع‌آوری کنید:
- خروجی `azd version`
- خروجی `azd info`
- پیام‌های خطا (متن کامل)
- مراحل بازتولید مشکل
- جزئیات محیط (`azd env show`)
- جدول زمانی شروع مشکل

### اسکریپت جمع‌آوری لاگ‌ها
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

## 📊 پیشگیری از مشکلات

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

### تنظیمات نظارت
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

### نگهداری منظم
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## منابع مرتبط

- [راهنمای اشکال‌زدایی](debugging.md) - تکنیک‌های پیشرفته اشکال‌زدایی
- [ایجاد منابع](../deployment/provisioning.md) - عیب‌یابی زیرساخت
- [برنامه‌ریزی ظرفیت](../pre-deployment/capacity-planning.md) - راهنمای برنامه‌ریزی منابع
- [انتخاب SKU](../pre-deployment/sku-selection.md) - توصیه‌های سطح خدمات

---

**نکته**: این راهنما را نشانه‌گذاری کنید و هر زمان که با مشکلی مواجه شدید به آن مراجعه کنید. اکثر مشکلات قبلاً دیده شده‌اند و راه‌حل‌های مشخصی دارند!

---

**ناوبری**
- **درس قبلی**: [ایجاد منابع](../deployment/provisioning.md)
- **درس بعدی**: [راهنمای اشکال‌زدایی](debugging.md)

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، توصیه می‌شود از ترجمه حرفه‌ای انسانی استفاده کنید. ما مسئولیتی در قبال سوء تفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.