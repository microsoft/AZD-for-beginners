<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "67ffbcceec008228c4d22c1b3585844c",
  "translation_date": "2025-09-17T18:38:43+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "ur"
}
-->
# آپ کا پہلا پروجیکٹ - عملی رہنمائی

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD ابتدائیوں کے لیے](../../README.md)
- **📖 موجودہ باب**: باب 1 - بنیاد اور فوری آغاز
- **⬅️ پچھلا**: [انسٹالیشن اور سیٹ اپ](installation.md)
- **➡️ اگلا**: [کنفیگریشن](configuration.md)
- **🚀 اگلا باب**: [باب 2: AI-فرسٹ ڈیولپمنٹ](../ai-foundry/azure-ai-foundry-integration.md)

## تعارف

اپنے پہلے Azure Developer CLI پروجیکٹ میں خوش آمدید! یہ جامع عملی رہنمائی آپ کو Azure پر ایک مکمل اسٹیک ایپلیکیشن بنانے، ڈیپلائے کرنے، اور منیج کرنے کا مکمل طریقہ فراہم کرتی ہے۔ آپ ایک حقیقی ٹوڈو ایپلیکیشن کے ساتھ کام کریں گے جس میں React فرنٹ اینڈ، Node.js API بیک اینڈ، اور MongoDB ڈیٹا بیس شامل ہے۔

## سیکھنے کے اہداف

اس رہنمائی کو مکمل کرنے کے بعد، آپ:
- azd پروجیکٹ انیشیئلائزیشن ورک فلو کو ٹیمپلیٹس کے ذریعے ماسٹر کریں گے
- Azure Developer CLI پروجیکٹ کی ساخت اور کنفیگریشن فائلز کو سمجھیں گے
- Azure پر مکمل ایپلیکیشن ڈیپلائے کریں گے، جس میں انفراسٹرکچر پروویژننگ شامل ہے
- ایپلیکیشن اپڈیٹس اور ریڈیپلائےمنٹ حکمت عملیوں کو نافذ کریں گے
- ڈیولپمنٹ اور اسٹیجنگ کے لیے متعدد ماحول منیج کریں گے
- وسائل کی صفائی اور لاگت کے انتظام کے طریقے اپنائیں گے

## سیکھنے کے نتائج

رہنمائی مکمل کرنے کے بعد، آپ:
- azd پروجیکٹس کو ٹیمپلیٹس سے خود انیشیئلائز اور کنفیگر کر سکیں گے
- azd پروجیکٹ کی ساخت کو مؤثر طریقے سے نیویگیٹ اور تبدیل کر سکیں گے
- Azure پر مکمل اسٹیک ایپلیکیشنز کو سنگل کمانڈز کے ذریعے ڈیپلائے کر سکیں گے
- عام ڈیپلائےمنٹ مسائل اور تصدیق کے مسائل کو حل کر سکیں گے
- مختلف ڈیپلائےمنٹ مراحل کے لیے متعدد Azure ماحول منیج کر سکیں گے
- ایپلیکیشن اپڈیٹس کے لیے مسلسل ڈیپلائےمنٹ ورک فلو نافذ کر سکیں گے

## شروعات کریں

### ضروریات کی چیک لسٹ
- ✅ Azure Developer CLI انسٹال ([انسٹالیشن گائیڈ](installation.md))
- ✅ Azure CLI انسٹال اور تصدیق شدہ
- ✅ آپ کے سسٹم پر Git انسٹال
- ✅ Node.js 16+ (اس رہنمائی کے لیے)
- ✅ Visual Studio Code (تجویز کردہ)

### اپنی سیٹ اپ کی تصدیق کریں
```bash
# Check azd installation
azd version
```
### Azure تصدیق کی تصدیق کریں

```bash
az account show
```

### Node.js ورژن چیک کریں
```bash
node --version
```

## مرحلہ 1: ٹیمپلیٹ منتخب کریں اور انیشیئلائز کریں

چلیں ایک مشہور ٹوڈو ایپلیکیشن ٹیمپلیٹ سے شروع کرتے ہیں جس میں React فرنٹ اینڈ اور Node.js API بیک اینڈ شامل ہے۔

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### ابھی کیا ہوا؟
- ٹیمپلیٹ کوڈ کو آپ کی لوکل ڈائریکٹری میں ڈاؤنلوڈ کیا گیا
- ایک `azure.yaml` فائل بنائی گئی جس میں سروس کی تعریفیں شامل ہیں
- `infra/` ڈائریکٹری میں انفراسٹرکچر کوڈ سیٹ اپ کیا گیا
- ایک ماحول کی کنفیگریشن بنائی گئی

## مرحلہ 2: پروجیکٹ کی ساخت کو دریافت کریں

چلیں دیکھتے ہیں کہ azd نے ہمارے لیے کیا بنایا:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

آپ کو یہ نظر آنا چاہیے:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### اہم فائلز کو سمجھنا

**azure.yaml** - آپ کے azd پروجیکٹ کا مرکز:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - انفراسٹرکچر کی تعریف:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## مرحلہ 3: اپنے پروجیکٹ کو حسب ضرورت بنائیں (اختیاری)

ڈیپلائے کرنے سے پہلے، آپ ایپلیکیشن کو حسب ضرورت بنا سکتے ہیں:

### فرنٹ اینڈ میں ترمیم کریں
```bash
# Open the React app component
code src/web/src/App.tsx
```

ایک سادہ تبدیلی کریں:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### ماحول کے متغیرات کو کنفیگر کریں
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## مرحلہ 4: Azure پر ڈیپلائے کریں

اب دلچسپ حصہ - سب کچھ Azure پر ڈیپلائے کریں!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### ڈیپلائےمنٹ کے دوران کیا ہو رہا ہے؟

`azd up` کمانڈ یہ مراحل انجام دیتی ہے:
1. **پروویژن** (`azd provision`) - Azure وسائل بناتا ہے
2. **پیکیج** - آپ کے ایپلیکیشن کوڈ کو بناتا ہے
3. **ڈیپلائے** (`azd deploy`) - کوڈ کو Azure وسائل پر ڈیپلائے کرتا ہے

### متوقع آؤٹ پٹ
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## مرحلہ 5: اپنی ایپلیکیشن کو ٹیسٹ کریں

### اپنی ایپلیکیشن تک رسائی حاصل کریں
ڈیپلائےمنٹ آؤٹ پٹ میں فراہم کردہ URL پر کلک کریں، یا کسی بھی وقت حاصل کریں:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### ٹوڈو ایپ کو ٹیسٹ کریں
1. **ٹوڈو آئٹم شامل کریں** - "Add Todo" پر کلک کریں اور ایک ٹاسک درج کریں
2. **مکمل کے طور پر نشان زد کریں** - مکمل شدہ آئٹمز کو چیک کریں
3. **آئٹمز حذف کریں** - وہ ٹوڈوز ہٹائیں جن کی آپ کو مزید ضرورت نہیں

### اپنی ایپلیکیشن کی نگرانی کریں
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## مرحلہ 6: تبدیلیاں کریں اور دوبارہ ڈیپلائے کریں

چلیں ایک تبدیلی کریں اور دیکھیں کہ اپڈیٹ کرنا کتنا آسان ہے:

### API میں ترمیم کریں
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

ایک کسٹم رسپانس ہیڈر شامل کریں:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### صرف کوڈ کی تبدیلیاں ڈیپلائے کریں
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## مرحلہ 7: متعدد ماحول منیج کریں

پروڈکشن سے پہلے تبدیلیوں کو ٹیسٹ کرنے کے لیے ایک اسٹیجنگ ماحول بنائیں:

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

## مرحلہ 8: وسائل صاف کریں

جب آپ تجربہ مکمل کر لیں، تو جاری چارجز سے بچنے کے لیے صفائی کریں:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## آپ نے کیا سیکھا

مبارک ہو! آپ نے کامیابی سے:
- azd پروجیکٹ کو ٹیمپلیٹ سے انیشیئلائز کیا
- پروجیکٹ کی ساخت اور اہم فائلز کو دریافت کیا
- Azure پر مکمل اسٹیک ایپلیکیشن ڈیپلائے کی
- کوڈ میں تبدیلیاں کیں اور دوبارہ ڈیپلائے کیا
- متعدد ماحول منیج کیے
- وسائل صاف کیے

## عام مسائل کا حل

### تصدیق کی غلطیاں
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### ڈیپلائےمنٹ کی ناکامیاں
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### وسائل کے نام کے تنازعات
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

## اگلے مراحل

اب جب کہ آپ نے اپنا پہلا پروجیکٹ مکمل کر لیا ہے، ان ایڈوانسڈ موضوعات کو دریافت کریں:

### 1. انفراسٹرکچر کو حسب ضرورت بنائیں
- [انفراسٹرکچر بطور کوڈ](../deployment/provisioning.md)
- [ڈیٹا بیس، اسٹوریج، اور دیگر سروسز شامل کریں](../deployment/provisioning.md#adding-services)

### 2. CI/CD سیٹ اپ کریں
- [GitHub Actions انٹیگریشن](../deployment/cicd-integration.md)
- [Azure DevOps پائپ لائنز](../deployment/cicd-integration.md#azure-devops)

### 3. پروڈکشن کے بہترین طریقے
- [سیکیورٹی کنفیگریشنز](../deployment/best-practices.md#security)
- [کارکردگی کی اصلاح](../deployment/best-practices.md#performance)
- [مانیٹرنگ اور لاگنگ](../deployment/best-practices.md#monitoring)

### 4. مزید ٹیمپلیٹس دریافت کریں
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## اضافی وسائل

### سیکھنے کے مواد
- [Azure Developer CLI دستاویزات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure آرکیٹیکچر سینٹر](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure ویل آرکیٹیکٹڈ فریم ورک](https://learn.microsoft.com/en-us/azure/well-architected/)

### کمیونٹی اور سپورٹ
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer کمیونٹی](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### ٹیمپلیٹس اور مثالیں
- [آفیشل ٹیمپلیٹ گیلری](https://azure.github.io/awesome-azd/)
- [کمیونٹی ٹیمپلیٹس](https://github.com/Azure-Samples/azd-templates)
- [انٹرپرائز پیٹرنز](https://github.com/Azure/azure-dev/tree/main/templates)

---

**مبارک ہو کہ آپ نے اپنا پہلا azd پروجیکٹ مکمل کر لیا ہے!** اب آپ Azure پر شاندار ایپلیکیشنز بنانے اور ڈیپلائے کرنے کے لیے تیار ہیں۔

---

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD ابتدائیوں کے لیے](../../README.md)
- **📖 موجودہ باب**: باب 1 - بنیاد اور فوری آغاز
- **⬅️ پچھلا**: [انسٹالیشن اور سیٹ اپ](installation.md)
- **➡️ اگلا**: [کنفیگریشن](configuration.md)
- **🚀 اگلا باب**: [باب 2: AI-فرسٹ ڈیولپمنٹ](../ai-foundry/azure-ai-foundry-integration.md)
- **اگلا سبق**: [ڈیپلائےمنٹ گائیڈ](../deployment/deployment-guide.md)

---

**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔