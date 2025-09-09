<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-09T19:26:46+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "ur"
}
-->
# عام مسائل اور ان کے حل

## تعارف

یہ جامع رہنمائی Azure Developer CLI استعمال کرتے وقت عام مسائل کے حل کے لیے ہے۔ اس میں تصدیق، تعیناتی، انفراسٹرکچر کی تیاری، اور ایپلیکیشن کی ترتیب کے مسائل کی تشخیص، حل، اور ان کے حل کے طریقے شامل ہیں۔ ہر مسئلے کے ساتھ تفصیلی علامات، وجوہات، اور مرحلہ وار حل کے طریقے دیے گئے ہیں۔

## سیکھنے کے اہداف

اس رہنمائی کو مکمل کرنے کے بعد آپ:
- Azure Developer CLI کے مسائل کی تشخیص کے طریقے سیکھیں گے
- عام تصدیق اور اجازت کے مسائل کو سمجھیں گے اور ان کے حل کریں گے
- تعیناتی کی ناکامیوں، انفراسٹرکچر کی تیاری کی غلطیوں، اور ترتیب کے مسائل کو حل کریں گے
- فعال نگرانی اور ڈیبگنگ کی حکمت عملیوں کو نافذ کریں گے
- پیچیدہ مسائل کے لیے منظم طریقے سے حل تلاش کریں گے
- مستقبل کے مسائل کو روکنے کے لیے مناسب لاگنگ اور نگرانی ترتیب دیں گے

## سیکھنے کے نتائج

رہنمائی مکمل کرنے کے بعد آپ:
- Azure Developer CLI کے مسائل کو بلٹ ان تشخیصی ٹولز کے ذریعے تشخیص کر سکیں گے
- تصدیق، سبسکرپشن، اور اجازت سے متعلق مسائل کو خود حل کریں گے
- تعیناتی کی ناکامیوں اور انفراسٹرکچر کی تیاری کی غلطیوں کو مؤثر طریقے سے حل کریں گے
- ایپلیکیشن کی ترتیب کے مسائل اور ماحول سے متعلق مسائل کو ڈیبگ کریں گے
- ممکنہ مسائل کی شناخت کے لیے نگرانی اور الرٹنگ کو نافذ کریں گے
- لاگنگ، ڈیبگنگ، اور مسئلے کے حل کے بہترین طریقے اپنائیں گے

## فوری تشخیص

خصوصی مسائل میں جانے سے پہلے، تشخیصی معلومات جمع کرنے کے لیے یہ کمانڈز چلائیں:

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

## تصدیق کے مسائل

### مسئلہ: "Access token حاصل کرنے میں ناکامی"
**علامات:**
- `azd up` تصدیق کی غلطیوں کے ساتھ ناکام ہو جاتا ہے
- کمانڈز "unauthorized" یا "access denied" واپس کرتے ہیں

**حل:**
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

### مسئلہ: تعیناتی کے دوران "Insufficient privileges"
**علامات:**
- تعیناتی اجازت کی غلطیوں کے ساتھ ناکام ہو جاتی ہے
- مخصوص Azure وسائل تخلیق نہیں کر سکتے

**حل:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### مسئلہ: ملٹی ٹیننٹ تصدیق کے مسائل
**حل:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ انفراسٹرکچر کی تیاری کی غلطیاں

### مسئلہ: وسائل کے نام کے تنازعات
**علامات:**
- "The resource name already exists" کی غلطیاں
- وسائل کی تخلیق کے دوران تعیناتی ناکام ہو جاتی ہے

**حل:**
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

### مسئلہ: مقام/علاقہ دستیاب نہیں
**علامات:**
- "The location 'xyz' is not available for resource type"
- منتخب کردہ علاقے میں مخصوص SKUs دستیاب نہیں

**حل:**
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

### مسئلہ: کوٹہ تجاوز کی غلطیاں
**علامات:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**حل:**
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

### مسئلہ: Bicep ٹیمپلیٹ کی غلطیاں
**علامات:**
- ٹیمپلیٹ کی توثیق کی ناکامیاں
- Bicep فائلز میں نحو کی غلطیاں

**حل:**
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

## 🚀 تعیناتی کی ناکامیاں

### مسئلہ: بلڈ کی ناکامیاں
**علامات:**
- تعیناتی کے دوران ایپلیکیشن بلڈ کرنے میں ناکام ہو جاتی ہے
- پیکیج انسٹالیشن کی غلطیاں

**حل:**
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

### مسئلہ: کنٹینر کی تعیناتی کی ناکامیاں
**علامات:**
- کنٹینر ایپس شروع کرنے میں ناکام ہو جاتی ہیں
- امیج پل کی غلطیاں

**حل:**
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

### مسئلہ: ڈیٹا بیس کنکشن کی ناکامیاں
**علامات:**
- ایپلیکیشن ڈیٹا بیس سے کنیکٹ نہیں کر سکتی
- کنکشن ٹائم آؤٹ کی غلطیاں

**حل:**
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

## 🔧 ترتیب کے مسائل

### مسئلہ: ماحول کے متغیرات کام نہیں کر رہے
**علامات:**
- ایپلیکیشن ترتیب کی قدروں کو نہیں پڑھ سکتی
- ماحول کے متغیرات خالی نظر آتے ہیں

**حل:**
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

### مسئلہ: SSL/TLS سرٹیفکیٹ کے مسائل
**علامات:**
- HTTPS کام نہیں کر رہا
- سرٹیفکیٹ کی توثیق کی غلطیاں

**حل:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### مسئلہ: CORS ترتیب کے مسائل
**علامات:**
- فرنٹ اینڈ API کو کال نہیں کر سکتا
- کراس اوریجن درخواست بلاک ہو گئی

**حل:**
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

## 🌍 ماحول کے انتظام کے مسائل

### مسئلہ: ماحول کی تبدیلی کے مسائل
**علامات:**
- غلط ماحول استعمال ہو رہا ہے
- ترتیب صحیح طریقے سے تبدیل نہیں ہو رہی

**حل:**
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

### مسئلہ: ماحول کی خرابی
**علامات:**
- ماحول غلط حالت دکھا رہا ہے
- وسائل ترتیب سے میل نہیں کھاتے

**حل:**
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

## 🔍 کارکردگی کے مسائل

### مسئلہ: تعیناتی کے وقت میں سستی
**علامات:**
- تعیناتی میں بہت زیادہ وقت لگ رہا ہے
- تعیناتی کے دوران ٹائم آؤٹ

**حل:**
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

### مسئلہ: ایپلیکیشن کی کارکردگی کے مسائل
**علامات:**
- سست ردعمل کا وقت
- وسائل کا زیادہ استعمال

**حل:**
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

## 🛠️ ٹربل شوٹنگ ٹولز اور کمانڈز

### ڈیبگ کمانڈز
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

### لاگ تجزیہ
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### وسائل کی تحقیق
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 اضافی مدد حاصل کرنا

### کب مسئلہ بڑھایا جائے
- تصدیق کے مسائل تمام حل آزمانے کے بعد بھی برقرار ہیں
- Azure خدمات کے ساتھ انفراسٹرکچر کے مسائل
- بلنگ یا سبسکرپشن سے متعلق مسائل
- سیکیورٹی کے خدشات یا واقعات

### سپورٹ چینلز
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

### معلومات جمع کرنا
سپورٹ سے رابطہ کرنے سے پہلے یہ معلومات جمع کریں:
- `azd version` کا آؤٹ پٹ
- `azd info` کا آؤٹ پٹ
- غلطی کے پیغامات (مکمل متن)
- مسئلے کو دوبارہ پیدا کرنے کے اقدامات
- ماحول کی تفصیلات (`azd env show`)
- مسئلہ شروع ہونے کا وقت

### لاگ جمع کرنے کا اسکرپٹ
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

## 📊 مسئلے کی روک تھام

### پری تعیناتی چیک لسٹ
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

### نگرانی کی ترتیب
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

### باقاعدہ دیکھ بھال
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## متعلقہ وسائل

- [Debugging Guide](debugging.md) - جدید ڈیبگنگ تکنیک
- [Provisioning Resources](../deployment/provisioning.md) - انفراسٹرکچر کی ٹربل شوٹنگ
- [Capacity Planning](../pre-deployment/capacity-planning.md) - وسائل کی منصوبہ بندی کی رہنمائی
- [SKU Selection](../pre-deployment/sku-selection.md) - سروس ٹائر کی سفارشات

---

**ٹپ**: اس رہنمائی کو بک مارک کریں اور جب بھی مسائل کا سامنا ہو تو اس کا حوالہ دیں۔ زیادہ تر مسائل پہلے دیکھے جا چکے ہیں اور ان کے حل موجود ہیں!

---

**نیویگیشن**
- **پچھلا سبق**: [Provisioning Resources](../deployment/provisioning.md)
- **اگلا سبق**: [Debugging Guide](debugging.md)

---

**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔