<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-09-17T18:41:02+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "ur"
}
-->
# عام مسائل اور ان کے حل

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 7 - خرابیوں کا پتہ لگانا اور ڈیبگنگ
- **⬅️ پچھلا باب**: [باب 6: پری فلائٹ چیکس](../pre-deployment/preflight-checks.md)
- **➡️ اگلا**: [ڈیبگنگ گائیڈ](debugging.md)
- **🚀 اگلا باب**: [باب 8: پروڈکشن اور انٹرپرائز پیٹرنز](../ai-foundry/production-ai-practices.md)

## تعارف

یہ جامع گائیڈ Azure Developer CLI استعمال کرتے وقت پیش آنے والے عام مسائل کا احاطہ کرتی ہے۔ اس میں آپ کو مسائل کی تشخیص، خرابیوں کا پتہ لگانے، اور ان کے حل کے طریقے سکھائے جائیں گے، جن میں توثیق، ڈپلائمنٹ، انفراسٹرکچر کی تیاری، اور ایپلیکیشن کنفیگریشن شامل ہیں۔ ہر مسئلے کے لیے تفصیلی علامات، بنیادی وجوہات، اور مرحلہ وار حل فراہم کیے گئے ہیں۔

## سیکھنے کے مقاصد

اس گائیڈ کو مکمل کرنے کے بعد آپ:
- Azure Developer CLI کے مسائل کی تشخیص کے ماہر بن جائیں گے
- عام توثیق اور اجازت کے مسائل اور ان کے حل کو سمجھ سکیں گے
- ڈپلائمنٹ کی ناکامیوں، انفراسٹرکچر کی تیاری کی غلطیوں، اور کنفیگریشن کے مسائل کو حل کر سکیں گے
- فعال مانیٹرنگ اور ڈیبگنگ کی حکمت عملیوں کو نافذ کر سکیں گے
- پیچیدہ مسائل کے لیے منظم خرابیوں کا پتہ لگانے کے طریقے اپنانا سیکھیں گے
- مستقبل کے مسائل سے بچنے کے لیے مناسب لاگنگ اور مانیٹرنگ کو ترتیب دے سکیں گے

## سیکھنے کے نتائج

گائیڈ مکمل کرنے کے بعد آپ:
- Azure Developer CLI کے مسائل کو بلٹ ان ڈائیگنوسٹک ٹولز کے ذریعے تشخیص کر سکیں گے
- توثیق، سبسکرپشن، اور اجازت سے متعلق مسائل کو خود حل کر سکیں گے
- ڈپلائمنٹ کی ناکامیوں اور انفراسٹرکچر کی تیاری کی غلطیوں کو مؤثر طریقے سے حل کر سکیں گے
- ایپلیکیشن کنفیگریشن کے مسائل اور ماحول سے متعلق مسائل کو ڈیبگ کر سکیں گے
- ممکنہ مسائل کی شناخت کے لیے مانیٹرنگ اور الرٹنگ کو فعال طور پر نافذ کر سکیں گے
- لاگنگ، ڈیبگنگ، اور مسئلے کے حل کے بہترین طریقوں کو اپنانا سیکھیں گے

## فوری تشخیص

کسی خاص مسئلے میں جانے سے پہلے، یہ کمانڈز چلائیں تاکہ تشخیصی معلومات حاصل کی جا سکیں:

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

## توثیق کے مسائل

### مسئلہ: "ایکسس ٹوکن حاصل کرنے میں ناکامی"
**علامات:**
- `azd up` توثیق کی غلطیوں کے ساتھ ناکام ہو جاتا ہے
- کمانڈز "غیر مجاز" یا "رسائی مسترد" کے پیغامات دیتی ہیں

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

### مسئلہ: ڈپلائمنٹ کے دوران "ناکافی مراعات"
**علامات:**
- ڈپلائمنٹ اجازت کی غلطیوں کے ساتھ ناکام ہو جاتا ہے
- کچھ Azure وسائل تخلیق نہیں ہو پا رہے

**حل:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### مسئلہ: ملٹی ٹیننٹ توثیق کے مسائل
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
- "وسائل کا نام پہلے سے موجود ہے" کی غلطیاں
- وسائل کی تخلیق کے دوران ڈپلائمنٹ ناکام ہو جاتا ہے

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
- "مقام 'xyz' وسائل کی قسم کے لیے دستیاب نہیں" کی غلطی
- منتخب کردہ علاقے میں کچھ SKUs دستیاب نہیں

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

### مسئلہ: کوٹہ سے تجاوز کی غلطیاں
**علامات:**
- "وسائل کی قسم کے لیے کوٹہ سے تجاوز" کی غلطی
- "وسائل کی زیادہ سے زیادہ تعداد تک پہنچ چکے ہیں"

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
- ٹیمپلیٹ کی توثیق میں ناکامی
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

## 🚀 ڈپلائمنٹ کی ناکامیاں

### مسئلہ: بلڈ کی ناکامیاں
**علامات:**
- ڈپلائمنٹ کے دوران ایپلیکیشن بلڈ ہونے میں ناکام
- پیکج انسٹالیشن کی غلطیاں

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

### مسئلہ: کنٹینر ڈپلائمنٹ کی ناکامیاں
**علامات:**
- کنٹینر ایپس شروع ہونے میں ناکام
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
- ایپلیکیشن ڈیٹا بیس سے کنیکٹ نہیں کر پا رہی
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

## 🔧 کنفیگریشن کے مسائل

### مسئلہ: ماحول کے متغیرات کام نہیں کر رہے
**علامات:**
- ایپ کنفیگریشن ویلیوز نہیں پڑھ پا رہی
- ماحول کے متغیرات خالی نظر آ رہے ہیں

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

### مسئلہ: CORS کنفیگریشن کے مسائل
**علامات:**
- فرنٹ اینڈ API کو کال نہیں کر پا رہا
- کراس اوریجن درخواست بلاک ہو رہی ہے

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
- کنفیگریشن صحیح طریقے سے تبدیل نہیں ہو رہی

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
- ماحول غیر درست حالت میں دکھائی دے رہا ہے
- وسائل کنفیگریشن سے میل نہیں کھا رہے

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

### مسئلہ: ڈپلائمنٹ کا وقت زیادہ لگنا
**علامات:**
- ڈپلائمنٹس میں بہت زیادہ وقت لگ رہا ہے
- ڈپلائمنٹ کے دوران ٹائم آؤٹ ہو رہا ہے

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

## 🛠️ خرابیوں کا پتہ لگانے کے ٹولز اور کمانڈز

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

### وسائل کی تحقیقات
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 اضافی مدد حاصل کرنا

### کب مسئلہ بڑھانا چاہیے
- تمام حل آزمانے کے بعد بھی توثیق کے مسائل برقرار رہیں
- Azure سروسز کے ساتھ انفراسٹرکچر کے مسائل
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

### لاگ کلیکشن اسکرپٹ
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

### پری ڈپلائمنٹ چیک لسٹ
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

### مانیٹرنگ سیٹ اپ
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

- [ڈیبگنگ گائیڈ](debugging.md) - ایڈوانسڈ ڈیبگنگ تکنیک
- [وسائل کی تیاری](../deployment/provisioning.md) - انفراسٹرکچر کی خرابیوں کا پتہ لگانا
- [صلاحیت کی منصوبہ بندی](../pre-deployment/capacity-planning.md) - وسائل کی منصوبہ بندی کی رہنمائی
- [SKU کا انتخاب](../pre-deployment/sku-selection.md) - سروس ٹائر کی سفارشات

---

**ٹپ**: اس گائیڈ کو بک مارک کر لیں اور جب بھی مسائل کا سامنا ہو تو اس کا حوالہ دیں۔ زیادہ تر مسائل پہلے دیکھے جا چکے ہیں اور ان کے حل موجود ہیں!

---

**نیویگیشن**
- **پچھلا سبق**: [وسائل کی تیاری](../deployment/provisioning.md)
- **اگلا سبق**: [ڈیبگنگ گائیڈ](debugging.md)

---

**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔