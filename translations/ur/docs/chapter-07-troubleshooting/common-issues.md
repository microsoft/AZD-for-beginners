# عام مسائل اور حل

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 7 - مسئلہ حل اور ڈی بگنگ
- **⬅️ پچھلا باب**: [باب 6: پری-فلائٹ چیک لسٹ](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ اگلا**: [ڈی بگنگ گائیڈ](debugging.md)
- **🚀 اگلا باب**: [باب 8: پروڈکشن اور انٹرپرائز پیٹرنز](../chapter-08-production/production-ai-practices.md)

## تعارف

یہ جامع مسئلہ حل کرنے کی گائیڈ Azure Developer CLI استعمال کرتے وقت سب سے زیادہ پیش آنے والے مسائل کا احاطہ کرتی ہے۔ تصدیق، تعیناتی، انفراسٹرکچر پروویژننگ، اور ایپلیکیشن کنفیگریشن کے عام مسائل کی تشخیص، حل اور دور کرنے کا طریقہ سیکھیں۔ ہر مسئلہ میں تفصیلی علامات، بنیادی وجوہات، اور مرحلہ وار حل کے طریقہ کار شامل ہیں۔

## تعلیمی مقاصد

اس گائیڈ کو مکمل کر کے، آپ:
- Azure Developer CLI مسائل کے تشخیصی تکنیکوں میں مہارت حاصل کریں گے
- عام تصدیق اور اجازت سے متعلق مسائل اور ان کے حل کو سمجھیں گے
- تعیناتی کی ناکامیوں، انفراسٹرکچر پروویژننگ کی غلطیوں، اور کنفیگریشن کے مسائل کو حل کریں گے
- پیش قدمی نگرانی اور ڈی بگنگ حکمت عملیاں نافذ کریں گے
- پیچیدہ مسائل کے لیے منظم مسئلہ حل کرنے کی طریقہ کار اپنائیں گے
- مستقبل کے مسائل کی روک تھام کے لیے مناسب لاگنگ اور مانیٹرنگ ترتیب دیں گے

## تعلیمی نتائج

مکمل ہونے پر، آپ قابل ہوں گے:
- بلٹ ان تشخیصی ٹولز کا استعمال کرتے ہوئے Azure Developer CLI کے مسائل کی تشخیص کریں
- تصدیق، سبسکرپشن، اور اجازت سے متعلق مسائل خود مختار طور پر حل کریں
- تعیناتی کی ناکامیوں اور انفراسٹرکچر پروویژننگ کی غلطیوں کو مؤثر طریقے سے حل کریں
- ایپلیکیشن کنفیگریشن کے مسائل اور ماحول سے مخصوص مسائل کو ٹھیک کریں
- ممکنہ مسائل کی پیشگی نشاندہی کے لیے مانیٹرنگ اور الرٹنگ نافذ کریں
- لاگنگ، ڈی بگنگ، اور مسئلہ حل کرنے کے بہترین طریقے لاگو کریں

## فوری تشخیص

> اپنے ماحول کی اقدار کے ساتھ مثال کے نام/شناختی نمبروں کی جگہ بدلیں۔ Bash، Bicep، JavaScript، اور پیرامیٹر-فائل کے حصے علیحدہ لیبل کیے گئے ہیں؛ یہ ایک واحد قابل عمل اسکرپٹ نہیں ہیں۔ تباہ کن آپریشنز کا جائزہ لیں اور راز ظاہر ہونے سے پہلے انہیں رد کریں۔ `azd monitor --logs` ایک براؤزر کھولتا ہے؛ یہ ٹرمینل لاگز کو سٹریم نہیں کرتا۔

مخصوص مسائل میں جانے سے پہلے، تشخیصی معلومات اکٹھا کرنے کے لیے یہ کمانڈز چلائیں:

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

## تصدیقی مسائل

### مسئلہ: "رسائی کا ٹوکن حاصل کرنے میں ناکامی"
**علامات:**
- `azd up` تصدیقی غلطیوں کے ساتھ ناکام ہوتا ہے
- کمانڈز "غیر مجاز" یا "رسائی مسترد" ظاہر کرتی ہیں

**حل:**
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

### مسئلہ: تعیناتی کے دوران "ناکافی مراعات"
**علامات:**
- تعیناتی اجازت کی غلطیوں کی وجہ سے ناکام ہوتی ہے
- مخصوص Azure وسائل تخلیق نہیں کر سکتا

**حل:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### مسئلہ: ملٹی ٹیننٹ تصدیقی مسائل
**حل:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ انفراسٹرکچر پروویژننگ کی غلطیاں

### مسئلہ: وسائل کے ناموں کے تصادم
**علامات:**
- "وسیلے کا نام پہلے سے موجود ہے" کی غلطیاں
- وسائل کی تخلیق کے دوران تعیناتی ناکام ہونا

**حل:**
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

### مسئلہ: مقام/ریجن دستیاب نہیں
**علامات:**
- "وسیلے کی قسم کے لیے 'xyz' مقام دستیاب نہیں"
- منتخب کردہ خطے میں مخصوص SKUs دستیاب نہیں

**حل:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

مقام کی متغیر کی تبدیلی موجودہ وسائل کو منتقل نہیں کرتی۔ موجودہ ریسورس گروپ یا وسیلہ مقام کی تبدیلی کو مسترد کر سکتا ہے؛ خطے کی دوبارہ تعیناتی کے لیے الگ ماحول استعمال کریں۔

### مسئلہ: کوٹہ زیادہ ہونے کی غلطیاں
**علامات:**
- "وسیلے کی قسم کے لیے کوٹہ زیادہ ہو گیا"
- "وسائل کی زیادہ سے زیادہ تعداد پہنچ گئی"

**حل:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

ترقی کے لیے، `infra/main.parameters.json` میں سپورٹڈ چھوٹا SKU منتخب کریں:

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

### مسئلہ: بائسِپ ٹیمپلیٹ کی غلطیاں
**علامات:**
- ٹیمپلیٹ کی توثیق میں ناکامی
- بائسِپ فائلوں میں نحو کی غلطیاں

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
- تعیناتی کے دوران ایپلیکیشن بلڈ ہونے میں ناکام
- پیکیج انسٹالیشن کی غلطیاں

**حل:**
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

### مسئلہ: کنٹینر تعیناتی کی ناکامیاں
**علامات:**
- کنٹینر ایپس شروع نہیں ہو پاتیں
- امیج پل کی غلطیاں

**حل:**
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

### مسئلہ: ڈیٹا بیس کنکشن کی ناکامیاں
**علامات:**
- ایپلیکیشن ڈیٹا بیس سے کنیکٹ نہیں ہو سکتی
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
- ایپ کنفیگریشن کی اقدار نہیں پڑھ سکتی
- ماحول کے متغیرات خالی دکھائی دیتے ہیں

**حل:**
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

### مسئلہ: SSL/TLS سرٹیفیکیٹ کے مسائل
**علامات:**
- HTTPS کام نہیں کر رہا
- سرٹیفیکیٹ کی توثیق کی غلطیاں

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
- فرنٹ اینڈ API کو کال نہیں کر سکتا
- کراس-اورجن ریکویسٹ بلاک ہو گئی

**حل:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. اپنے موجودہ Express ایپلیکیشن کو اپ ڈیٹ کریں (جن میں `cors` شامل ہے):

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

## 🌍 ماحول کی مینجمنٹ کے مسائل

### مسئلہ: ماحول کی تبدیلی کے مسائل
**علامات:**
- غلط ماحول استعمال ہو رہا ہے
- کنفیگریشن صحیح طریقے سے نہیں بدل رہی

**حل:**
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

### مسئلہ: ماحول کی خرابی
**علامات:**
- ماحول غلط حالت دکھاتا ہے
- وسائل کنفیگریشن سے نہیں میل کھاتے

**حل:**
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

## 🔍 کارکردگی کے مسائل

### مسئلہ: تعیناتی میں دیر ہونا
**علامات:**
- تعیناتیاں بہت دیر لگاتی ہیں
- تعیناتی کے دوران ٹائم آؤٹ

**حل:**
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

### مسئلہ: ایپلیکیشن کی کارکردگی کے مسائل
**علامات:**
- ردعمل کے وقت میں سستی
- وسائل کا زیادہ استعمال

**حل:**
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

## 🛠️ مسئلہ حل کرنے کے آلات اور کمانڈز

### ڈی بگ کمانڈز
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

### لاگ تجزیہ
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

### وسائل کی جانچ پڑتال
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 اضافی مدد حاصل کرنا

### کب اسکیلٹ کریں
- تمام حل آزمانے کے بعد بھی تصدیقی مسائل برقرار رہیں
- Azure خدمات کے انفراسٹرکچر مسائل
- بلنگ یا سبسکرپشن سے متعلق مسائل
- سیکیورٹی خدشات یا واقعات

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

### جمع کرنے کے لیے معلومات
سپورٹ سے رابطہ کرنے سے پہلے، یہ معلومات اکٹھی کریں:
- `azd version` آؤٹ پٹ
- `azd config show` آؤٹ پٹ
- `azd show` آؤٹ پٹ (موجودہ تعیناتی کی حالت)
- غلطی کے پیغامات (مکمل متن)
- مسئلہ کی دوبارہ پیشی کے اقدامات
- خفیہ شدہ ماحول کی تفصیلات (کبھی بھی `azd env get-values` کے خام ڈیٹا کو نہ شیئر کریں، کیونکہ اس میں راز ہو سکتے ہیں)
- مسئلہ کب شروع ہوا اس کا ٹائم لائن

### لاگ جمع کرنے کی اسکرپٹ
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

## 📊 مسئلہ کی روک تھام

### پری-ڈپلائمنٹ چیک لسٹ
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

### باقاعدہ دیکھ بھال
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## متعلقہ وسائل

- [ڈی بگنگ گائیڈ](debugging.md) - اعلی درجے کی ڈی بگنگ تکنیکیں
- [پروویژننگ وسائل](../chapter-04-infrastructure/provisioning.md) - انفراسٹرکچر مسئلہ حل
- [کیپیسٹی پلاننگ](../chapter-06-pre-deployment/capacity-planning.md) - وسائل کی منصوبہ بندی کی رہنمائی
- [SKU سلیکشن](../chapter-06-pre-deployment/sku-selection.md) - سروس ٹئیر کی سفارشات

---

**ٹپ**: اس گائیڈ کو نشان زد شدہ رکھیں اور جب بھی مسائل کا سامنا ہو اسے دیکھیں۔ زیادہ تر مسائل پہلے بھی دیکھے گئے ہیں اور ان کے قائم شدہ حل موجود ہیں!

---

**نیویگیشن**
- **پچھلا سبق**: [پروویژننگ وسائل](../chapter-04-infrastructure/provisioning.md)
- **اگلا سبق**: [ڈی بگنگ گائیڈ](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->