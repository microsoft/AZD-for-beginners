# آپ کا پہلا پروجیکٹ - عملی ٹیوٹوریل

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD برائے ابتدائیہ](../../README.md)
- **📖 موجودہ باب**: باب 1 - بنیاد اور فوری آغاز
- **⬅️ پچھلا**: [انسٹالیشن اور سیٹ اپ](installation.md)
- **➡️ اگلا**: [تشکیل](configuration.md)
- **🚀 اگلا باب**: [باب 2: AI-فرسٹ ڈیولپمنٹ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## تعارف

آپ کے پہلے Azure Developer CLI پروجیکٹ میں خوش آمدید! یہ جامع عملی ٹیوٹوریل azd کے ذریعے Azure پر مکمل اسٹیک اپلیکیشن بنانے، تعینات کرنے، اور انتظام کرنے کا مکمل خاکہ فراہم کرتا ہے۔ آپ ایک حقیقی ٹوڈو اپلیکیشن کے ساتھ کام کریں گے جو React فرنٹ اینڈ، Node.js API بیک اینڈ، اور MongoDB ڈیٹا بیس پر مشتمل ہے۔

## سیکھنے کے اہداف

اس ٹیوٹوریل کو مکمل کر کے آپ:
- ٹمپلٹس استعمال کرتے ہوئے azd پروجیکٹ ابتدائیہ ورک فلو میں مہارت حاصل کریں گے
- Azure Developer CLI پروجیکٹ کی ساخت اور کنفیگریشن فائلوں کو سمجھیں گے
- بنیادی ڈھانچے کی فراہمی کے ساتھ مکمل اپلیکیشن Azure پر تعینات کریں گے
- اپلیکیشن اپڈیٹس اور دوبارہ تعیناتی کی حکمت عملی نافذ کریں گے
- ترقی اور اسٹیجنگ کے لیے متعدد ماحول کا انتظام کریں گے
- وسائل کی صفائی اور لاگت کی مینجمنٹ کے طریقے اپنائیں گے

## سیکھنے کے نتائج

مکمل کرنے کے بعد، آپ قابل ہوں گے کہ:
- خود مختاری سے ٹمپلٹس سے azd پروجیکٹس کو شروع اور تشکیل دیں
- azd پروجیکٹ کی ساخت میں مؤثر طریقے سے تشریف لے جائیں اور ترمیم کریں
- ایک کمانڈ کے ذریعے مکمل اسٹیک اپلیکیشن کو Azure پر تعینات کریں
- عام تعیناتی کے مسائل اور توثیق کی دشواریوں کو حل کریں
- مختلف تعیناتی مراحل کے لئے متعدد Azure ماحول کا انتظام کریں
- اپلیکیشن اپڈیٹس کے لئے مسلسل تعیناتی کے ورک فلو نافذ کریں

## شروعات

### ضروریات کی فہرست
- ✅ Azure Developer CLI نصب ([انسٹالیشن گائیڈ](installation.md))
- ✅ `azd auth login` کے ذریعے AZD توثیق مکمل
- ✅ آپ کے سسٹم پر Git نصب
- ✅ Node.js 16+ (اس ٹیوٹوریل کے لیے)
- ✅ Visual Studio Code (تجویز کردہ)

جاری رکھنے سے پہلے، مخزن کے روٹ سے سیٹ اپ ویلیڈیٹر چلائیں:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### اپنے سیٹ اپ کی تصدیق کریں
```bash
# ازڈ کی تنصیب چیک کریں
azd version

# AZD کی تصدیق چیک کریں
azd auth login --check-status
```

### اختیاری Azure CLI توثیق کی تصدیق کریں

```bash
az account show
```

### Node.js کا ورژن چیک کریں
```bash
node --version
```

## مرحلہ 1: ایک ٹیمپلیٹ منتخب کریں اور شروع کریں

آئیے ایک مقبول ٹوڈو اپلیکیشن ٹیمپلیٹ سے شروع کرتے ہیں جس میں React فرنٹ اینڈ اور Node.js API بیک اینڈ شامل ہیں۔

```bash
# دستیاب ٹیمپلیٹس کو براؤز کریں
azd template list

# ٹوڈو ایپ ٹیمپلیٹ کو شروع کریں
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# ہدایات پر عمل کریں:
# - ایک ماحول کا نام درج کریں: "dev"
# - ایک سبسکرپشن منتخب کریں (اگر آپ کے پاس متعدد ہیں)
# - ایک علاقہ منتخب کریں: "East US 2" (یا اپنی پسندیدہ جگہ)
```

### ابھی کیا ہوا؟
- ٹیمپلیٹ کوڈ آپ کی مقامی ڈائریکٹری میں ڈاؤن لوڈ کیا گیا
- `azure.yaml` فائل سروس کی تعریفات کے ساتھ بنائی گئی
- `infra/` ڈائریکٹری میں بنیادی ڈھانچے کا کوڈ مرتب کیا گیا
- ایک ماحول کی ترتیب بنائی گئی

## مرحلہ 2: پروجیکٹ کی ساخت کا جائزہ لیں

آئیے دیکھتے ہیں کہ azd نے ہمارے لیے کیا بنایا ہے:

```bash
# پروجیکٹ کا ڈھانچہ دیکھیں
tree /f   # ونڈوز
# یا
find . -type f | head -20   # میک او ایس/لینکس
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

### سمجھنے کے لیے اہم فائلیں

**azure.yaml** - آپ کے azd پروجیکٹ کا دل:
```bash
# پراجیکٹ کی ترتیب دیکھیں
cat azure.yaml
```

**infra/main.bicep** - بنیادی ڈھانچے کی تعریف:
```bash
# انفراسٹرکچر کوڈ دیکھیں
head -30 infra/main.bicep
```

## مرحلہ 3: اپنے پروجیکٹ کو حسب ضرورت بنائیں (اختیاری)

تعیناتی سے پہلے، آپ اپلیکیشن کو حسب ضرورت بنا سکتے ہیں:

### فرنٹ اینڈ میں ترمیم کریں
```bash
# ریئیکٹ ایپ کمپونینٹ کو کھولیں
code src/web/src/App.tsx
```

ایک سادہ تبدیلی کریں:
```typescript
// عنوان تلاش کریں اور اسے تبدیل کریں
<h1>My Awesome Todo App</h1>
```

### ماحول کے متغیرات کو ترتیب دیں
```bash
# کسٹم ماحول کے متغیرات سیٹ کریں
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# تمام ماحول کے متغیرات دیکھیں
azd env get-values
```

## مرحلہ 4: Azure پر تعینات کریں

اب دلچسپ مرحلہ — سب کچھ Azure پر تعینات کریں!

```bash
# انفراسٹرکچر اور ایپلیکیشن تعینات کریں
azd up

# یہ کمانڈ کرے گا:
# 1. ایزور کے وسائل فراہم کریں (ایپ سروس، کازموس ڈی بی، وغیرہ)
# 2. آپ کی ایپلیکیشن بنائیں
# 3. فراہم کردہ وسائل پر تعینات کریں
# 4. ایپلیکیشن کا یو آر ایل دکھائیں
```

### تعیناتی کے دوران کیا ہو رہا ہے؟

`azd up` کمانڈ یہ اقدامات کرتی ہے:
1. **فراہم کرنا** (`azd provision`) - Azure وسائل بناتا ہے
2. **پیکج** - آپ کے اپلیکیشن کوڈ کو بناتا ہے
3. **تعینات کریں** (`azd deploy`) - وسائل پر کوڈ تعینات کرتا ہے

### متوقع نتیجہ
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## مرحلہ 5: اپنی اپلیکیشن کا تجربہ کریں

### اپنی اپلیکیشن تک رسائی حاصل کریں
تعیناتی کے نتائج میں دی گئی URL پر کلک کریں، یا کسی بھی وقت حاصل کریں:
```bash
# درخواست کے اختتامی نکات حاصل کریں
azd show

# اپنی براؤزر میں درخواست کھولیں
azd show --output json | jq -r '.services.web.endpoint'
```

### ٹوڈو اپلیکیشن کا تجربہ کریں
1. **نیا ٹوڈو آئٹم شامل کریں** - "Add Todo" پر کلک کریں اور کام درج کریں
2. **مکمل نشان زد کریں** - مکمل شدہ آئٹمز کو نشان زد کریں
3. **آئٹمز حذف کریں** - وہ ٹوڈوز حذف کریں جن کی اب ضرورت نہیں

### اپنی اپلیکیشن کی مانیٹرنگ کریں
```bash
# اپنی وسائل کے لیے Azure پورٹل کھولیں
azd monitor

# درخواست کے لاگز دیکھیں
azd monitor --logs

# لائیو میٹرکس دیکھیں
azd monitor --live
```

## مرحلہ 6: تبدیلیاں کریں اور دوبارہ تعینات کریں

آئیے ایک تبدیلی کریں اور دیکھیں کہ اپڈیٹ کرنا کتنا آسان ہے:

### API میں ترمیم کریں
```bash
# API کوڈ میں ترمیم کریں
code src/api/src/routes/lists.js
```

ایک حسب ضرورت ریسپانس ہیڈر شامل کریں:
```javascript
// ایک روٹ ہینڈلر تلاش کریں اور شامل کریں:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### صرف کوڈ کی تبدیلیاں تعینات کریں
```bash
# صرف ایپلیکیشن کوڈ تعینات کریں (انفراسٹرکچر کو چھوڑ دیں)
azd deploy

# چونکہ انفراسٹرکچر پہلے سے موجود ہے، یہ 'azd up' سے کہیں زیادہ تیز ہے
```

## مرحلہ 7: متعدد ماحول کا انتظام کریں

پیداوار سے پہلے تبدیلیوں کے تجربے کے لئے ایک اسٹیجنگ ماحول بنائیں:

```bash
# ایک نیا اسٹیجنگ ماحول بنائیں
azd env new staging

# اسٹیجنگ پر تعینات کریں
azd up

# دوبارہ ڈویلپمنٹ ماحول پر جائیں
azd env select dev

# تمام ماحول کی فہرست بنائیں
azd env list
```

### ماحول کا موازنہ
```bash
# ڈیولپمنٹ ماحول دیکھیں
azd env select dev
azd show

# اسٹیجنگ ماحول دیکھیں
azd env select staging
azd show
```

## مرحلہ 8: وسائل کو صاف کریں

جب آپ تجربہ مکمل کر لیں، تو اضافی چارجز سے بچنے کے لیے صفائی کریں:

```bash
# موجودہ ماحول کے لیے تمام Azure وسائل کو حذف کریں
azd down

# بغیر تصدیق کے زبردستی حذف کریں اور نرم حذف شدہ وسائل کو صاف کریں
azd down --force --purge

# مخصوص ماحول کو حذف کریں
azd env select staging
azd down --force --purge
```

## کلاسیکی ایپ بمقابلہ AI سے چلنے والی ایپ: وہی ورک فلو

آپ نے ابھی ایک روایتی ویب ایپلیکیشن تعینات کی۔ لیکن اگر آپ چاہتے ہیں کہ AI سے چلنے والی ایپ تعینات کریں — جیسے Microsoft Foundry Models سے سپورٹ شدہ چیٹ ایپ؟

اچھی خبر: **ورک فلو بالکل ایک جیسا ہے۔**

| مرحلہ | کلاسیکی ٹوڈو ایپ | AI چیٹ ایپ |
|-------|------------------|------------|
| ابتدائیہ | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| تصدیق | `azd auth login` | `azd auth login` |
| تعینات | `azd up` | `azd up` |
| نگرانی | `azd monitor` | `azd monitor` |
| صفائی | `azd down --force --purge` | `azd down --force --purge` |

فرق صرف وہ **ٹیمپلیٹ** ہے جس سے آپ شروع کرتے ہیں۔ AI ٹیمپلیٹ اضافی بنیادی ڈھانچے (جیسے Microsoft Foundry Models resource یا AI Search انڈیکس) شامل کرتا ہے، لیکن azd یہ سب آپ کے لیے سنبھالتا ہے۔ آپ کو نئے کمانڈ سیکھنے، مختلف ٹول استعمال کرنے، یا تعیناتی کے بارے میں سوچنے کے طریقے بدلنے کی ضرورت نہیں۔

یہ azd کا بنیادی اصول ہے: **ایک ورک فلو، کوئی بھی ورک لوڈ۔** آپ نے اس ٹیوٹوریل میں جو مہارتیں حاصل کیں — ابتدائیہ، تعیناتی، نگرانی، دوبارہ تعیناتی، اور صفائی — وہ AI اپلیکیشنز اور ایجنٹس کے لیے بھی ایک جیسی ہیں۔

---

## آپ نے کیا سیکھا

مبارک ہو! آپ نے کامیابی سے:
- ✅ ٹیمپلیٹ سے ایک azd پروجیکٹ شروع کیا
- ✅ پروجیکٹ کی ساخت اور اہم فائلوں کا جائزہ لیا
- ✅ ایک مکمل اسٹیک اپلیکیشن Azure پر تعینات کی
- ✅ کوڈ میں تبدیلی کی اور دوبارہ تعینات کیا
- ✅ متعدد ماحول کا انتظام کیا
- ✅ وسائل کی صفائی کی

## 🎯 مہارت کی توثیق کی مشقیں

### مشق 1: مختلف ٹیمپلیٹ تعینات کریں (15 منٹ)
**مقصد**: azd init اور تعیناتی ورک فلو پر عبور دکھانا

```bash
# کوشش کریں Python + MongoDB اسٹیک
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# تعیناتی کی تصدیق کریں
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# صفائی کریں
azd down --force --purge
```

**کامیابی کے معیارات:**
- [ ] اپلیکیشن بغیر کسی غلطی کے تعینات ہو جائے
- [ ] براؤزر میں اپلیکیشن URL تک رسائی حاصل ہو سکے
- [ ] اپلیکیشن درست طریقے سے کام کرے (ٹودوز شامل/حذف کریں)
- [ ] تمام وسائل کامیابی سے صاف کیے جائیں

### مشق 2: کنفیگریشن حسب ضرورت بنائیں (20 منٹ)
**مقصد**: ماحول کے متغیرات کو ترتیب دینے کی مشق کرنا

```bash
cd my-first-azd-app

# حسب ضرورت ماحول تخلیق کریں
azd env new custom-config

# حسب ضرورت متغیرات سیٹ کریں
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# متغیرات کی تصدیق کریں
azd env get-values | grep APP_TITLE

# حسب ضرورت کنفیگریشن کے ساتھ تعینات کریں
azd up
```

**کامیابی کے معیارات:**
- [ ] حسب ضرورت ماحول کامیابی کے ساتھ بنایا گیا
- [ ] ماحول کے متغیرات سیٹ کیے گئے اور بازیافت کیے جا سکتے ہیں
- [ ] اپلیکیشن حسب ضرورت کنفیگریشن کے ساتھ تعینات ہو
- [ ] تعینات ایپ میں حسب ضرورت ترتیبات کی تصدیق ہو سکے

### مشق 3: کثیر ماحول کا ورک فلو (25 منٹ)
**مقصد**: ماحول کے انتظام اور تعیناتی کی حکمت عملیوں میں مہارت حاصل کرنا

```bash
# ڈیولپمنٹ ماحول بنائیں
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# ڈیولپمنٹ URL نوٹ کریں
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# اسٹیجنگ ماحول بنائیں
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# اسٹیجنگ URL نوٹ کریں
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# ماحول کا موازنہ کریں
azd env list

# دونوں ماحول کا ٹیسٹ کریں
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# دونوں کی صفائی کریں
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**کامیابی کے معیارات:**
- [ ] مختلف کنفیگریشن کے ساتھ دو ماحول بنائے گئے
- [ ] دونوں ماحول کامیابی کے ساتھ تعینات ہوئے
- [ ] `azd env select` سے ماحول کے درمیان سوئچ کیا جا سکتا ہے
- [ ] ماحول کے متغیرات ماحولوں کے درمیان مختلف ہیں
- [ ] دونوں ماحول کامیابی سے صاف کیے گئے

## 📊 آپ کی پیش رفت

**وقت صرف کیا گیا**: تقریباً 60-90 منٹ  
**حاصل کی گئی مہارتیں**:
- ✅ ٹیمپلیٹ پر مبنی پروجیکٹ ابتدائیہ
- ✅ Azure وسائل کی فراہمی
- ✅ اپلیکیشن تعیناتی کے ورک فلو
- ✅ ماحول کا انتظام
- ✅ کنفیگریشن مینجمنٹ
- ✅ وسائل کی صفائی اور لاگت کا انتظام

**اگلا مرحلہ**: آپ تیار ہیں [تشکیل گائیڈ](configuration.md) کے لیے، تاکہ جدید کنفیگریشن کے نمونوں کو سیکھ سکیں!

## عام مسائل کا حل

### توثیقی غلطیاں
```bash
# Azure کے ساتھ دوبارہ تصدیق کریں
az login

# سبسکرپشن کی رسائی کی تصدیق کریں
az account show
```

### تعیناتی کی ناکامیاں
```bash
# ڈیبگ لاگنگ کو فعال کریں
export AZD_DEBUG=true
azd up --debug

# ایزور میں ایپلیکیشن لاگز دیکھیں
azd monitor --logs

# کنٹینر ایپس کے لیے، ایزور CLI استعمال کریں:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### وسائل کے ناموں کے تصادم
```bash
# ایک منفرد ماحول کا نام استعمال کریں
azd env new dev-$(whoami)-$(date +%s)
```

### پورٹ/نیٹ ورک کے مسائل
```bash
# چیک کریں کہ پورٹس دستیاب ہیں یا نہیں
netstat -an | grep :3000
netstat -an | grep :3100
```

## اگلے اقدامات

اب جب آپ نے اپنا پہلا پروجیکٹ مکمل کر لیا ہے، تو ان جدید موضوعات کو دریافت کریں:

### 1. بنیادی ڈھانچے کو حسب ضرورت بنائیں
- [انفراسٹرکچر بطور کوڈ](../chapter-04-infrastructure/provisioning.md)
- [ڈیٹابیسز، اسٹوریج، اور دیگر خدمات شامل کریں](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD سیٹ اپ کریں
- [تعیناتی گائیڈ](../chapter-04-infrastructure/deployment-guide.md) - مکمل CI/CD ورک فلو
- [Azure Developer CLI دستاویزات](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - پائپ لائن کنفیگریشن

### 3. پیداوار کی بہترین مشقیں
- [تعیناتی گائیڈ](../chapter-04-infrastructure/deployment-guide.md) - سیکیورٹی، کارکردگی، اور نگرانی

### 4. مزید ٹیمپلیٹس دریافت کریں
```bash
# ٹیمپلیٹس کو زمرہ وار براؤز کریں
azd template list --filter web
azd template list --filter api
azd template list --filter database

# مختلف ٹیکنالوجی اسٹیکس آزما کر دیکھیں
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## اضافی وسائل

### سیکھنے کا مواد
- [Azure Developer CLI دستاویزات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure آرکیٹیکچر سینٹر](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure اچھے آرکیٹیکٹڈ فریم ورک](https://learn.microsoft.com/en-us/azure/well-architected/)

### کمیونٹی اور سپورٹ
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer کمیونٹی](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### ٹیمپلیٹس اور مثالیں
- [سرکاری ٹیمپلیٹ گیلری](https://azure.github.io/awesome-azd/)
- [کمیونٹی ٹیمپلیٹس](https://github.com/Azure-Samples/azd-templates)
- [انٹرپرائز پیٹرنز](https://github.com/Azure/azure-dev/tree/main/templates)

---

**آپ کے پہلے azd پروجیکٹ کی تکمیل پر مبارکباد!** اب آپ اعتماد کے ساتھ Azure پر شاندار ایپلیکیشنز بنانے اور تعینات کرنے کے لیے تیار ہیں۔

---

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD برائے ابتدائیہ](../../README.md)
- **📖 موجودہ باب**: باب 1 - بنیاد اور فوری آغاز
- **⬅️ پچھلا**: [انسٹالیشن اور سیٹ اپ](installation.md)
- **➡️ اگلا**: [تشکیل](configuration.md)
- **🚀 اگلا باب**: [باب 2: AI-فرسٹ ڈیولپمنٹ](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **اگانا سبق**: [تعیناتی گائیڈ](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:  
اس دستاویز کا ترجمہ AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے کیا گیا ہے۔ اگرچہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار تراجم میں غلطیاں یا غیر یقینی معلومات ہو سکتی ہیں۔ اصل دستاویز کو اس کی مادری زبان میں مستند ماخذ سمجھا جانا چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے لیے ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->