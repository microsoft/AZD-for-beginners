# آپ کا پہلا پروجیکٹ - عملی سبق

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [ابتدائیوں کے لئے AZD](../../README.md)
- **📖 موجودہ باب**: باب 1 - بنیاد اور فوری آغاز
- **⬅️ پچھلا**: [انسٹالیشن اور سیٹ اپ](installation.md)
- **➡️ اگلا**: [اپنی ایپ لائیں](bring-your-own-app.md)
- **🚀 اگلا باب**: [باب 2: AI-فرسٹ ڈیولپمنٹ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## تعارف

آپ کے پہلے Azure ڈیولپر CLI پروجیکٹ میں خوش آمدید! آپ ایک ٹوڈو ایپلیکیشن ڈپلائے کریں گے جس میں React فرنٹ اینڈ، Node.js API، اور Azure Cosmos DB شامل ہیں۔ ٹیمپلیٹ تاریخی نام `todo-nodejs-mongo` کو برقرار رکھتا ہے؛ اس کا موجودہ انفراسٹرکچر Cosmos DB کو NoSQL کے لیے استعمال کرتا ہے، اس لئے ڈاؤن لوڈ شدہ README اور `infra/` کو دیکھیں، بجائے اس کے کہ آپ ڈیٹا بیس API کو نام سے اندازہ لگائیں۔

> نومبر 2026 میں `azd 1.37.2` اور عوامی ٹیمپلیٹ کے خلاف جائزہ لیا گیا۔ نیچے دیے گئے مثالیں Bash استعمال کرتی ہیں؛ JSON نکالنے کے لیے بھی `jq` ضروری ہے۔ Azure کی تعیناتیوں پر چارجز آتے ہیں اور اس جائزے میں عملدرآمد نہیں کیا گیا۔

## سیکھنے کے اہداف

اس سبق کو مکمل کرکے، آپ:
- azd پروجیکٹ ابتدائیہ ورک فلو کو ٹیمپلیٹس کے ذریعے ماہر بنائیں گے
- Azure ڈیولپر CLI پروجیکٹ کی ساخت اور ترتیب کی فائلیں سمجھیں گے
- مکمل ایپلیکیشن کو Azure پر انفرسٹرکچر کی فراہمی کے ساتھ تعینات کریں گے
- ایپلیکیشن کی اپ ڈیٹس اور دوبارہ تعیناتی کی حکمت عملی نافذ کریں گے
- ترقی اور اسٹیجنگ کے متعدد ماحول کا انتظام کریں گے
- وسائل کی صفائی اور لاگت کا انتظام کریں گے

## سیکھنے کے نتائج

مکمل کرنے پر، آپ قابل ہوں گے:
- ٹیمپلیٹس سے azd پروجیکٹس کو خود مختار طریقے سے ابتدائیہ اور ترتیب دیں
- azd پروجیکٹ کی ساخت کو مؤثر طریقے سے نیویگیٹ اور ترمیم کریں
- ایک کمانڈ سے Azure پر فل اسٹیک ایپلیکیشنز تعینات کریں
- عام تعیناتی کے مسائل اور تصدیقی مسائل حل کریں
- مختلف مرحلوں کے لیے متعدد Azure ماحول کا انتظام کریں
- ایپلیکیشن کی اپ ڈیٹس کے لئے مسلسل تعیناتی ورک فلو نافذ کریں

## شروع ہو جائیے

### ضروریات کی فہرست
- ✅ Azure Developer CLI انسٹال شدہ ([انسٹالیشن گائیڈ](installation.md))
- ✅ `azd auth login` کے ساتھ AZD توثیق مکمل کی گئی
- ✅ نظام پر Git انسٹال ہے
- ✅ Node.js 22 LTS (یا ڈاؤن لوڈ شدہ ٹیمپلیٹ کے لیے مطلوبہ سپورٹڈ ورژن)
- ✅ Visual Studio Code (تجویز کردہ)

آگے بڑھنے سے پہلے، ریپوزٹری روٹ سے سیٹ اپ ویلیڈیٹر چلائیں:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### اپنے سیٹ اپ کی تصدیق کریں
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### اختیاری Azure CLI توثیق کی تصدیق کریں

```bash
az account show
```

### Node.js ورژن چیک کریں
```bash
node --version
```

## مرحلہ 1: ٹیمپلیٹ منتخب کریں اور شروعات کریں

آئیے ایک مقبول ٹوڈو ایپلیکیشن ٹیمپلیٹ سے آغاز کرتے ہیں جس میں React فرنٹ اینڈ اور Node.js API بیک اینڈ شامل ہیں۔

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

### ابھی کیا ہوا؟
- ٹیمپلیٹ کا کوڈ آپ کی مقامی ڈائریکٹری میں ڈاؤن لوڈ ہو گیا
- `azure.yaml` فائل سروس کی تعریفات کے ساتھ بنائی گئی
- `infra/` ڈائریکٹری میں انفرسٹرکچر کوڈ ترتیب دیا گیا
- ایک ماحول کی تشکیل کی گئی

## مرحلہ 2: پروجیکٹ کی ساخت کو دریافت کریں

آئیے دیکھتے ہیں کہ azd نے ہمارے لیے کیا بنایا ہے:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

آپ کو دکھائی دے گا:
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

### سمجھنے کے لیے کلیدی فائلیں

**azure.yaml** - آپ کے azd پروجیکٹ کا دل:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - انفراسٹرکچر کی تعریف:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## مرحلہ 3: اپنا پروجیکٹ حسب ضرورت بنائیں (اختیاری)

تعیناتی سے پہلے، آپ درخواست کو حسب ضرورت بنا سکتے ہیں:

### فرنٹ اینڈ میں ترمیم کریں
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

ایک آسان تبدیلی کریں:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### ماحول کی متغیرات ترتیب دیں
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

یہ دو حسب ضرورت اقدار صرف مقامی ذخیرہ دکھاتی ہیں۔ اسٹاک ٹیمپلیٹ `WEBSITE_TITLE` یا `API_VERSION` استعمال نہیں کرتا، لہٰذا وہ ایپ کو تبدیل نہیں کرتے۔ اوپر واضح سورس ترمیم دکھائی گئی عنوان کو تبدیل کرتی ہے۔

## مرحلہ 4: Azure پر تعینات کریں

اب دلچسپ حصہ - سب کچھ Azure پر تعینات کریں!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### تعیناتی کے دوران کیا ہو رہا ہے؟

ورک فلو انفراسٹرکچر فراہم کرتا ہے اور کوڈ پیکج/ڈپلائے کرتا ہے۔ درست ترتیب کو `workflows.up` کے ذریعے `azure.yaml` میں حسب ضرورت بنایا جا سکتا ہے؛ یہ ٹیمپلیٹ فراہم کرنے کے بعد تعیناتی کی وضاحت کرتا ہے۔ ہر ٹیمپلیٹ کے لئے ایک ہی مرحلے کی ترتیب پر انحصار نہ کریں۔

### متوقع نتیجہ
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## مرحلہ 5: اپنی ایپلیکیشن کا ٹیسٹ کریں

### اپنی ایپلیکیشن تک رسائی حاصل کریں
تعیناتی کے نتیجے میں فراہم کردہ URL پر کلک کریں، یا کسی بھی وقت حاصل کریں:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### ٹوڈو ایپ کا ٹیسٹ کریں
1. **نیا ٹوڈو شامل کریں** - "Add Todo" پر کلک کریں اور کوئی کام درج کریں
2. **مکمل ہوئے کے طور پر نشان زد کریں** - مکمل کیے گئے کاموں کو چیک کریں
3. **موارد کو حذف کریں** - وہ ٹوڈوز ہٹائیں جن کی اب ضرورت نہیں

### اپنی ایپلیکیشن کی نگرانی کریں
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ اپنی تعیناتی کی تصدیق کریں

آگے بڑھنے سے پہلے، اس فوری چیک لسٹ سے گزر کر تصدیق کریں کہ سب کچھ واقعی کام کر رہا ہے—یہ فرض نہ کریں کہ "deploy succeeded" کا مطلب ہے "app works":

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

**تعیناتی کی تصدیق اس وقت ہوتی ہے جب:**
- ✅ `azd show` قابل رسائی اینڈپوائنٹ URL ظاہر کرتا ہے
- ✅ URL آپ کے براؤزر میں کسی ایرر کے بغیر کھلتا ہے
- ✅ مرکزی خصوصیات کام کر رہی ہیں (ٹوڈو شامل/مکمل/حذف)
- ✅ `azd monitor --logs` درخواستیں موصول ہوتے دکھاتا ہے بغیر غیر متوقع غلطیوں کے

اگر کوئی چیک ناکام ہو جائے، تو [باب 7: مسئلہ حل](../chapter-07-troubleshooting/README.md) پر جائیں۔

## مرحلہ 6: تبدیلیاں کریں اور دوبارہ تعینات کریں

آئیے ایک تبدیلی کریں اور دیکھتے ہیں کہ اپ ڈیٹ کرنا کتنا آسان ہے:

### API میں ترمیم کریں
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

ایک کسٹم رسپانس ہیڈر شامل کریں:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### صرف کوڈ کی تبدیلیاں تعینات کریں
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## مرحلہ 7: متعدد ماحول کا انتظام کریں

تبدیلیوں کو پروڈکشن سے پہلے ٹیسٹ کرنے کے لیے ایک اسٹیجنگ ماحول بنائیں:

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

### ماحول کا موازنہ
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## مرحلہ 8: وسائل کی صفائی کریں

جب آپ تجربے ختم کر لیں، تو جاری چارجز سے بچنے کے لیے صفائی کریں:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## کلاسک ایپ بمقابلہ AI-طاقت یافتہ ایپ: ایک ہی ورک فلو

آپ نے ابھی ایک روایتی ویب ایپلیکیشن ڈپلائے کی ہے۔ لیکن اگر آپ AI طاقت یافتہ ایپ، جیسے Microsoft Foundry Models پر مبنی چیٹ ایپ، تعینات کرنا چاہتے تو؟

اچھی خبر: **ورک فلو ایک جیسا ہے۔**

| مرحلہ | کلاسک ٹوڈو ایپ | AI چیٹ ایپ |
|------|-----------------|-------------|
| ابتدائیہ (خالی ڈائریکٹری) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| تصدیق کریں | `azd auth login` | `azd auth login` |
| تعینات کریں | `azd up` | `azd up` |
| نگرانی کریں | `azd monitor` | `azd monitor` |
| صفائی کریں | `azd down --force --purge` | `azd down --force --purge` |

لائف سائیکل کمانڈز ایک جیسے ہیں، لیکن ضروریات مختلف ہیں۔ AI ٹیمپلیٹ ماڈل کی رسائی، علاقائی کوٹا، ڈیٹا انجیست، اور اضافی ترتیب طلب کر سکتا ہے۔ تعیناتی سے پہلے اس کا README پڑھیں؛ `azd up` غائب اجازتیں یا کوٹا مہیا نہیں کر سکتا۔

azd کا بنیادی اصول یہی ہے: **ایک ورک فلو، کوئی بھی ورکلوڈ۔** اس سبق میں آپ نے جو مہارتیں حاصل کیں—ابتدائیہ کرنا، تعینات کرنا، نگرانی کرنا، دوبارہ تعینات کرنا، اور صفائی—AI ایپلیکیشنز اور ایجنٹس پر بھی برابر لاگو ہوتی ہیں۔

---

## آپ نے کیا سیکھا ہے

مبارک ہو! آپ نے کامیابی کے ساتھ:
- ✅ ٹیمپلیٹ سے azd پروجیکٹ شروع کیا
- ✅ پروجیکٹ کی ساخت اور کلیدی فائلیں دریافت کیں
- ✅ Azure پر فل اسٹیک ایپلیکیشن تعینات کی
- ✅ کوڈ میں تبدیلی کی اور دوبارہ تعینات کیا
- ✅ متعدد ماحول کا انتظام کیا
- ✅ وسائل کی صفائی کی

## 🎯 مہارت کی توثیق کی مشقیں

### مشق 1: مختلف ٹیمپلیٹ کی تعیناتی (15 منٹ)
**ہدف**: azd init اور تعیناتی ورک فلو میں مہارت کا مظاہرہ کرنا

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

**کامیابی کے معیارات:**
- [ ] ایپلیکیشن بغیر کسی غلطی کے تعینات ہو جائے
- [ ] ایپلیکیشن URL براؤزر میں قابل رسائی ہو
- [ ] ایپلیکیشن صحیح کام کرے (ٹوڈوز شامل/حذف کریں)
- [ ] تمام وسائل کامیابی سے صاف کر دیے گئے ہوں

### مشق 2: ترتیب میں تخصیص (20 منٹ)
**ہدف**: مقامی ماحول کی قدر کی ذخیرہ کاری کا مشق کرنا بغیر اسے رن ٹائم کی ترتیب سمجھنے کے

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

**کامیابی کے معیارات:**
- [ ] حسب ضرورت ماحول کامیابی سے بنایا گیا
- [ ] ماحول کی متغیرات سیٹ کی گئیں اور حاصل کی جا سکتی ہیں
- [ ] `azd env get-value APP_TITLE` پرنٹ کرتا ہے `My Custom Todo App`
- [ ] وضاحت کر سکتا ہے کہ یہ اقدار اسٹاک ایپ کو کیوں تبدیل نہیں کرتی جب تک کہ کوڈ/انفراسٹرکچر ان کا استعمال نہ کرے

### مشق 3: کثیر ماحول ورک فلو (25 منٹ)
**مقصد**: ماحولیات کے انتظام اور تعیناتی کی حکمت عملیوں میں مہارت حاصل کریں

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

**کامیابی کے معیار:**
- [ ] دو ماحول مختلف ترتیب کے ساتھ بنائے گئے
- [ ] دونوں ماحول کامیابی کے ساتھ تعینات کیے گئے
- [ ] ماحولیات کے درمیان سوئچ کر سکتے ہیں استعمال کرتے ہوئے `azd env select`
- [ ] ماحولیات کے متغیرات ماحولیات کے درمیان مختلف ہوتے ہیں
- [ ] دونوں ماحولیات کو کامیابی کے ساتھ صاف کیا گیا

## 📊 آپ کی پیش رفت

**صرف وقت**: تقریباً 60-90 منٹ  
**حاصل کردہ مہارتیں**:
- ✅ ٹیمپلیٹ پر مبنی پروجیکٹ کی ابتدا
- ✅ Azure وسائل کی فراہمی
- ✅ ایپلیکیشن کی تعیناتی کے عمل
- ✅ ماحول کا انتظام
- ✅ ترتیب کا انتظام
- ✅ وسائل کی صفائی اور لاگت کا انتظام

**اگلا مرحلہ**: آپ [Configuration Guide](../chapter-03-configuration/configuration.md) کے لیے تیار ہیں تاکہ جدید ترتیب کے نمونے سیکھ سکیں!

## عام مسائل کا حل

### تصدیقی غلطیاں
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### تعیناتی کی ناکامیاں
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### وسائل کے ناموں کے تصادم
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### پورٹ/نیٹ ورک کے مسائل
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## اگلے اقدامات

اب جب کہ آپ نے اپنا پہلا پروجیکٹ مکمل کر لیا ہے، ان ترقی یافتہ موضوعات کو دریافت کریں:

### 1. بنیادی ڈھانچے کو حسبِ خواہش بنائیں
- [انفراسٹرکچر ایز کوڈ](../chapter-04-infrastructure/provisioning.md)
- [ڈیٹا بیس انفراسٹرکچر شامل کریں](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. CI/CD ترتیب دیں
- [تعیناتی گائیڈ](../chapter-04-infrastructure/deployment-guide.md) - مکمل CI/CD ورک فلو
- [Azure Developer CLI دستاویزات](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - پائپ لائن کنفیگریشن

### 3. پیداواری بہترین طریقے
- [تعیناتی گائیڈ](../chapter-04-infrastructure/deployment-guide.md) - سیکیورٹی، کارکردگی، اور نگرانی

### 4. مزید ٹیمپلیٹس دریافت کریں
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

## اضافی وسائل

### تعلیمی مواد
- [Azure Developer CLI دستاویزات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ایزور آرکیٹیکچر سینٹر](https://learn.microsoft.com/en-us/azure/architecture/)
- [ایزور ویل آرکیٹیکٹڈ فریم ورک](https://learn.microsoft.com/en-us/azure/well-architected/)

### کمیونٹی اور معاونت
- [ایزور ڈویلپر CLI گٹ ہب](https://github.com/Azure/azure-dev)
- [ایزور ڈویلپر کمیونٹی](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [اسٹیک اوور فلو - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### ٹیمپلیٹس اور مثالیں
- [سرکاری ٹیمپلیٹ گیلری](https://azure.github.io/awesome-azd/)
- [کمیونٹی ٹیمپلیٹ شراکتیں](https://github.com/Azure/awesome-azd)
- [ٹو ڈو ٹیمپلیٹ ماخذ](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**آپ کا پہلا azd پروجیکٹ مکمل کرنے پر مبارک ہو!** آپ اب اعتماد کے ساتھ ایزور پر شاندار ایپلیکیشنز بنانے اور تعینات کرنے کے لیے تیار ہیں۔

---

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [نئے افراد کے لیے AZD](../../README.md)
- **📖 موجودہ باب**: باب 1 - بنیاد اور فوری آغاز
- **⬅️ پچھلا**: [انسٹالیشن اور سیٹ اپ](installation.md)
- **➡️ اگلا**: [اپنی ایپ لائیں](bring-your-own-app.md)
- **🚀 اگلا باب**: [باب 2: AI-فرسٹ ڈیولپمنٹ](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->