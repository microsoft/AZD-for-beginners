# آپ کا پہلا پروجیکٹ - عملی سبق

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 1 - بنیاد اور جلدی آغاز
- **⬅️ سابقہ**: [انسٹالیشن اور سیٹ اپ](installation.md)
- **➡️ اگلا**: [تشکیل](configuration.md)
- **🚀 اگلا باب**: [باب 2: AI-فرسٹ ڈیولپمنٹ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## تعارف

آپ کے پہلے Azure Developer CLI پروجیکٹ میں خوش آمدید! یہ مکمل عملی سبق azd کا استعمال کرتے ہوئے Azure پر مکمل اسٹیک ایپلیکیشن بنانے، تعینات کرنے، اور مینج کرنے کی مکمل رہنمائی فراہم کرتا ہے۔ آپ ایک حقیقی ٹوڈو ایپلیکیشن کے ساتھ کام کریں گے جس میں React فرنٹ اینڈ، Node.js API بیک اینڈ، اور MongoDB ڈیٹا بیس شامل ہیں۔

## سیکھنے کے مقاصد

اس سبق کو مکمل کرنے کے بعد، آپ:
- ٹیمپلیٹس کا استعمال کرتے ہوئے azd پروجیکٹ انیشیئلائزیشن ورک فلو میں ماہر ہو جائیں گے
- Azure Developer CLI پروجیکٹ کی ساخت اور کنفیگریشن فائلوں کو سمجھیں گے
- انفراسٹرکچر کی فراہمی کے ساتھ Azure پر مکمل ایپلیکیشن تعینات کریں گے
- ایپلیکیشن اپڈیٹس اور دوبارہ تعیناتی کی حکمت عملی نافذ کریں گے
- ترقی اور اسٹیجنگ کے لیے متعدد ماحول کا انتظام کریں گے
- وسائل کی صفائی اور لاگت کے انتظام کی عملی تدابیر اپنائیں گے

## سیکھنے کے نتائج

مکمل کرنے پر، آپ قابل ہوں گے:
- آزادانہ طور پر ٹیمپلیٹس سے azd پروجیکٹس کا آغاز اور تشکیل دیں
- مؤثر طریقے سے azd پروجیکٹ کی ساخت میں نیویگیٹ اور ترمیم کریں
- ایک کمانڈ سے Azure پر مکمل اسٹیک ایپلیکیشنز تعینات کریں
- عام تعیناتی مسائل اور تصدیقی مسائل کو حل کریں
- مختلف تعیناتی مراحل کے لیے Azure کے متعدد ماحول کا انتظام کریں
- ایپلیکیشن اپڈیٹس کے لیے مسلسل تعیناتی کے ورک فلو نافذ کریں

## شروع کریں

### ضروری چیزوں کی چیک لسٹ
- ✅ Azure Developer CLI نصب شدہ ([انسٹالیشن گائیڈ](installation.md))
- ✅ `azd auth login` کے ساتھ AZD کی توثیق مکمل
- ✅ آپ کے سسٹم پر Git نصب ہے
- ✅ Node.js 16+ (اس سبق کے لیے)
- ✅ Visual Studio Code (تجویز کردہ)

جاری رکھنے سے پہلے، مخزن کی جڑ سے سیٹ اپ ویلیڈیٹر چلائیں:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### اپنا سیٹ اپ چیک کریں
```bash
# azd کی تنصیب چیک کریں
azd version

# AZD کی توثیق چیک کریں
azd auth login --check-status
```

### اختیاری Azure CLI تصدیق کو چیک کریں

```bash
az account show
```

### Node.js کا ورژن چیک کریں
```bash
node --version
```

## مرحلہ 1: ٹیمپلیٹ کا انتخاب اور انیشیئلائز کریں

آئیے ایک مقبول ٹوڈو ایپلیکیشن ٹیمپلیٹ سے شروع کریں جس میں React فرنٹ اینڈ اور Node.js API بیک اینڈ شامل ہیں۔

```bash
# دستیاب ٹیمپلیٹس کو براؤز کریں
azd template list

# ٹو ڈو ایپ ٹیمپلیٹ کو انیشیالائز کریں
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# پرامپٹس کی پیروی کریں:
# - ایک ماحول کا نام درج کریں: "dev"
# - ایک سبسکرپشن منتخب کریں (اگر آپ کے پاس متعدد ہوں)
# - ایک علاقہ منتخب کریں: "East US 2" (یا آپ کا پسندیدہ علاقہ)
```

### ابھی کیا ہوا؟
- ٹیمپلیٹ کوڈ آپ کی مقامی ڈائریکٹری میں ڈاؤن لوڈ ہوا
- سروس کی تعریفات کے ساتھ `azure.yaml` فائل بنائی گئی
- `infra/` ڈائریکٹری میں انفراسٹرکچر کوڈ سیٹ اپ کیا گیا
- ایک ماحول کی ترتیب بنائی گئی

## مرحلہ 2: پروجیکٹ کی ساخت کا جائزہ لیں

آئیے دیکھتے ہیں کہ azd نے ہمارے لیے کیا تخلیق کیا ہے:

```bash
# پروجیکٹ کا ڈھانچہ دیکھیں
tree /f   # ونڈوز
# یا
find . -type f | head -20   # میک او ایس/لینکس
```

آپ کو نظر آنا چاہیے:
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

**azure.yaml** - آپ کے azd پروجیکٹ کا مرکزی حصہ:
```bash
# پروجیکٹ کی ترتیب دیکھیں
cat azure.yaml
```

**infra/main.bicep** - انفراسٹرکچر کی تعریف:
```bash
# انفراسٹرکچر کوڈ دیکھیں
head -30 infra/main.bicep
```

## مرحلہ 3: اپنا پروجیکٹ حسبِ منشا بنائیں (اختیاری)

تعیناتی سے پہلے، آپ ایپلیکیشن کو حسبِ منشا بنا سکتے ہیں:

### فرنٹ اینڈ میں ترمیم کریں
```bash
# رییکٹ ایپ کمپونینٹ کھولیں
code src/web/src/App.tsx
```

ایک سادہ تبدیلی کریں:
```typescript
// عنوان تلاش کریں اور اسے تبدیل کریں
<h1>My Awesome Todo App</h1>
```

### ماحول متغیرات (Environment Variables) ترتیب دیں
```bash
# حسب منشاء ماحول کے متغیرات مقرر کریں
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# تمام ماحول کے متغیرات دیکھیں
azd env get-values
```

## مرحلہ 4: Azure پر تعینات کریں

اب دلچسپ مرحلہ - سب کچھ Azure پر تعینات کریں!

```bash
# انفراسٹرکچر اور ایپلیکیشن تعینات کریں
azd up

# یہ کمانڈ کرے گا:
# 1. ایزور وسائل مہیا کریں (ایپ سروس، کاسموس ڈی بی، وغیرہ)
# 2. آپ کی ایپلیکیشن تعمیر کریں
# 3. مہیا کیے گئے وسائل پر تعینات کریں
# 4. ایپلیکیشن کا URL دکھائیں
```

### تعیناتی کے دوران کیا ہو رہا ہے؟

`azd up` کمانڈ یہ اقدامات انجام دیتی ہے:
1. **پروویزن** (`azd provision`) - Azure وسائل بناتا ہے
2. **پیکیج** - آپ کے ایپلیکیشن کوڈ کو بناتا ہے
3. **تعینات کرنا** (`azd deploy`) - کوڈ Azure وسائل پر تعینات کرتا ہے

### متوقع نتیجہ
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## مرحلہ 5: اپنی ایپلیکیشن کی جانچ کریں

### اپنی ایپلیکیشن تک رسائی حاصل کریں
تعیناتی کے نتیجے میں دی گئی URL پر کلک کریں، یا کسی بھی وقت حاصل کریں:
```bash
# ایپلیکیشن کے اینڈ پوائنٹس حاصل کریں
azd show

# ایپلیکیشن کو اپنے براؤزر میں کھولیں
azd show --output json | jq -r '.services.web.endpoint'
```

### ٹوڈو ایپ کی جانچ کریں
1. **نیا ٹوڈو شامل کریں** - "Add Todo" پر کلک کریں اور کوئی کام درج کریں
2. **مکمل شدہ نشان لگائیں** - مکمل شدہ آئٹمز کو چیک کریں
3. **آئٹمز حذف کریں** - وہ ٹوڈو حذف کریں جن کی اب ضرورت نہیں

### اپنی ایپلیکیشن کی نگرانی کریں
```bash
# اپنے وسائل کے لیے Azure پورٹل کھولیں
azd monitor

# ایپلیکیشن لاگز دیکھیں
azd monitor --logs

# لائیو میٹرکس دیکھیں
azd monitor --live
```

### ✅ تعیناتی کی تصدیق کریں

آگے بڑھنے سے پہلے، یہ فوری چیک لسٹ مکمل کریں تاکہ یقین ہو جائے کہ سب کچھ کام کر رہا ہے—"deploy succeeded" کا مطلب یہ نہ لیں کہ "app کام کر رہا ہے":

```bash
# 1۔ اس بات کی تصدیق کریں کہ اینڈ پوائنٹ موجود ہے اور قابل رسائی ہے
azd show

# 2۔ اینڈ پوائنٹ کا سموک ٹیسٹ کریں (HTTP 200 کی توقع ہے)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3۔ اگر آپ کی ایپلیکیشن ایک ہیلتھ اینڈ پوائنٹ فراہم کرتی ہے تو اس کی جانچ کریں
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**تعیناتی تب تصدیق کی جاتی ہے جب:**
- ✅ `azd show` قابل رسائی اینڈپوائنٹ URL دکھائے
- ✅ URL آپ کے براؤزر میں بغیر کسی غلطی کے کھلے
- ✅ بنیادی خصوصیات کام کریں (ٹوڈو شامل/مکمل/حذف)
- ✅ `azd monitor --logs` درخواستوں کو بغیر غیر متوقع غلطیوں کے پہچانتا ہے

اگر کوئی چیک ناکام ہو جائے تو [باب 7: مسائل کا حل](../chapter-07-troubleshooting/README.md) پر جائیں۔

## مرحلہ 6: تبدیلیاں کریں اور دوبارہ تعینات کریں

آئیے ایک تبدیلی کریں اور دیکھیں کہ اپڈیٹ کرنا کتنا آسان ہے:

### API میں ترمیم کریں
```bash
# API کوڈ میں ترمیم کریں
code src/api/src/routes/lists.js
```

ایک کسٹم رسپانس ہیڈر شامل کریں:
```javascript
// ایک راستہ ہینڈلر تلاش کریں اور شامل کریں:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### صرف کوڈ کی تبدیلیاں تعینات کریں
```bash
# صرف ایپلیکیشن کوڈ تعینات کریں (انفراسٹرکچر کو چھوڑ دیں)
azd deploy

# چونکہ انفراسٹرکچر پہلے سے موجود ہے، یہ 'azd up' سے کہیں تیز ہے
```

## مرحلہ 7: متعدد ماحول کا انتظام کریں

پیداواری ماحول سے پہلے تبدیلیوں کو جانچنے کے لیے ایک اسٹیجنگ ماحول بنائیں:

```bash
# نیا اسٹیجنگ ماحول بنائیں
azd env new staging

# اسٹیجنگ پر تعینات کریں
azd up

# ڈیولپمنٹ ماحول پر واپس جائیں
azd env select dev

# تمام ماحول کی فہرست بنائیں
azd env list
```

### ماحول کا موازنہ
```bash
# ڈویلپمنٹ کے ماحول کو دیکھیں
azd env select dev
azd show

# اسٹیجنگ کے ماحول کو دیکھیں
azd env select staging
azd show
```

## مرحلہ 8: وسائل کی صفائی کریں

جب تجربات ختم ہو جائیں، تو جاری چارجز سے بچنے کے لیے صفائی کریں:

```bash
# موجودہ ماحول کے لیے تمام Azure وسائل حذف کریں
azd down

# تصدیق کے بغیر زبردستی حذف کریں اور نرم حذف شدہ وسائل کو مکمل طور پر صاف کریں
azd down --force --purge

# مخصوص ماحول حذف کریں
azd env select staging
azd down --force --purge
```

## کلاسک ایپ بمقابلہ AI چلنے والی ایپ: ایک جیسا ورک فلو

آپ نے ابھی ایک روایتی ویب ایپلیکیشن تعینات کی ہے۔ لیکن اگر آپ AI پاورڈ ایپ تعینات کرنا چاہتے مثلاً ایک چیٹ ایپ جو Microsoft Foundry Models پر مبنی ہو؟

خوشخبری یہ ہے: **ورک فلو بالکل ایک جیسا ہے۔**

| مرحلہ | کلاسک ٹوڈو ایپ | AI چیٹ ایپ |
|------|-----------------|-------------|
| شروع کریں | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| توثیق کریں | `azd auth login` | `azd auth login` |
| تعینات کریں | `azd up` | `azd up` |
| نگرانی کریں | `azd monitor` | `azd monitor` |
| صفائی کریں | `azd down --force --purge` | `azd down --force --purge` |

فرق صرف **ٹیمپلیٹ** ہے جس سے آپ شروع کرتے ہیں۔ AI ٹیمپلیٹ میں اضافی انفراسٹرکچر شامل ہوتا ہے (جیسا کہ Microsoft Foundry Models ریسورس یا AI سرچ انڈیکس)، لیکن azd یہ سب آپ کے لیے سنبھالتا ہے۔ آپ کو نئے کمانڈز سیکھنے کی ضرورت نہیں، مختلف ٹول اپنانے کی ضرورت نہیں، یا تعیناتی کے بارے میں سوچنے کا انداز تبدیل کرنے کی ضرورت نہیں۔

یہ azd کا بنیادی اصول ہے: **ایک ورک فلو، کوئی بھی ورک لوڈ۔** اس سبق میں آپ نے جو مہارتیں سیکھی ہیں—انیشیئلائز کرنا، تعینات کرنا، نگرانی کرنا، دوبارہ تعینات کرنا، اور صفائی کرنا—وہ AI ایپلیکیشنز اور ایجنٹس پر بھی برابر لاگو ہوتی ہیں۔

---

## آپ نے کیا سیکھا

مبارک ہو! آپ نے کامیابی سے:
- ✅ ٹیمپلیٹ سے azd پروجیکٹ انیشیئلائز کیا
- ✅ پروجیکٹ کی ساخت اور اہم فائلوں کو دریافت کیا
- ✅ Azure پر مکمل اسٹیک ایپلیکیشن تعینات کی
- ✅ کوڈ میں تبدیلیاں کیں اور دوبارہ تعینات کیا
- ✅ متعدد ماحول کا انتظام کیا
- ✅ وسائل کی صفائی کی

## 🎯 ہنر کی تصدیقی مشقیں

### مشق 1: مختلف ٹیمپلیٹ تعینات کریں (15 منٹ)
**مقصد**: azd init اور تعیناتی ورک فلو میں مہارت کا مظاہرہ کرنا

```bash
# پائتھن + مونگو ڈی بی اسٹیک آزما ئیں
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# تعیناتی کی تصدیق کریں
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# صفائی کریں
azd down --force --purge
```

**کامیابی کے معیار:**
- [ ] ایپلیکیشن بغیر غلطیوں کے تعینات ہو
- [ ] براؤزر میں ایپلیکیشن کا URL کھل جائے
- [ ] ایپلیکیشن صحیح کام کرے (ٹوڈوز شامل/حذف کریں)
- [ ] تمام وسائل کامیابی سے صاف کیے گئے ہوں

### مشق 2: کنفیگریشن کو حسبِ منشا بنائیں (20 منٹ)
**مقصد**: ماحول متغیرات کی تشکیل کی مشق کرنا

```bash
cd my-first-azd-app

# حسب ضرورت ماحول بنائیں
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

**کامیابی کے معیار:**
- [ ] حسبِ منشا ماحول کامیابی سے بنایا گیا
- [ ] ماحول کے متغیرات سیٹ اور حاصل کیے جا سکتے ہوں
- [ ] کسٹم کنفیگریشن کے ساتھ ایپلیکیشن تعینات ہو
- [ ] تعینات ایپ میں کسٹم سیٹنگز کی تصدیق کی جا سکے

### مشق 3: متعدد ماحول کا ورک فلو (25 منٹ)
**مقصد**: ماحول کے انتظام اور تعیناتی کی حکمت عملی میں مہارت حاصل کرنا

```bash
# ڈیولپمنٹ ماحول بنائیں
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# ڈیولپمنٹ کا URL نوٹ کریں
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# اسٹیجنگ ماحول بنائیں
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# اسٹیجنگ کا URL نوٹ کریں
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# ماحولیات کا موازنہ کریں
azd env list

# دونوں ماحولیات کا ٹیسٹ کریں
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# دونوں کی صفائی کریں
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**کامیابی کے معیار:**
- [ ] دو مختلف کنفیگریشنز کے ساتھ ماحول بنائے گئے
- [ ] دونوں ماحول کامیابی سے تعینات کیے گئے
- [ ] `azd env select` کے ذریعے ماحول میں سوئچ کیا جا سکتا ہے
- [ ] ماحول کے متغیرات ماحول کے لحاظ سے مختلف ہیں
- [ ] دونوں ماحولوں کی صفائی کامیابی سے ہوئی

## 📊 آپ کی پیش رفت

**وقت خرچ کیا**: ~60-90 منٹ  
**حاصل کردہ مہارتیں**:
- ✅ ٹیمپلیٹ پر مبنی پروجیکٹ انیشیئلائزیشن
- ✅ Azure وسائل کی فراہمی
- ✅ ایپلیکیشن تعیناتی کے ورک فلو
- ✅ ماحول کا انتظام
- ✅ کنفیگریشن مینجمنٹ
- ✅ وسائل کی صفائی اور لاگت کا انتظام

**اگلے مرحلے کے لیے**: آپ تیار ہیں [تشکیل گائیڈ](configuration.md) کے لیے تاکہ جدید کنفیگریشن پیٹرنز سیکھ سکیں!

## عام مسائل کا حل

### تصدیقی غلطیاں
```bash
# Azure کے ساتھ دوبارہ توثیق کریں
az login

# رکنیت تک رسائی کی تصدیق کریں
az account show
```

### تعیناتی کی ناکامیاں
```bash
# ڈی بگ لاگنگ کو فعال کریں
export AZD_DEBUG=true
azd up --debug

# Azure میں ایپلیکیشن لاگز دیکھیں
azd monitor --logs

# کنٹینر ایپس کے لئے، Azure CLI استعمال کریں:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### وسائل کے نام کا تنازعہ
```bash
# ایک منفرد ماحول کا نام استعمال کریں
azd env new dev-$(whoami)-$(date +%s)
```

### پورٹ/نیٹ ورک مسائل
```bash
# چیک کریں کہ پورٹس دستیاب ہیں یا نہیں
netstat -an | grep :3000
netstat -an | grep :3100
```

## اگلے اقدامات

اب جب کہ آپ نے اپنا پہلا پروجیکٹ مکمل کر لیا ہے، تو ان جدید موضوعات کو دریافت کریں:

### 1. انفراسٹرکچر کو حسبِ منشا بنائیں
- [انفراسٹرکچر ایس کوڈ کے طور پر](../chapter-04-infrastructure/provisioning.md)
- [ڈیٹا بیسس، اسٹوریج، اور دیگر خدمات شامل کریں](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD سیٹ اپ کریں
- [تعیناتی گائیڈ](../chapter-04-infrastructure/deployment-guide.md) - مکمل CI/CD ورک فلو
- [Azure Developer CLI ڈاکیومنٹیشن](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - پائپ لائن کنفیگریشن

### 3. پیداوری کی بہترین مشقیں
- [تعیناتی گائیڈ](../chapter-04-infrastructure/deployment-guide.md) - سیکیورٹی، کارکردگی، اور نگرانی

### 4. مزید ٹیمپلیٹس دریافت کریں
```bash
# ٹیمپلیٹس کو زمرہ وار براؤز کریں
azd template list --filter web
azd template list --filter api
azd template list --filter database

# مختلف ٹیکنالوجی اسٹیکس آزمانے کی کوشش کریں
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## اضافی وسائل

### سیکھنے کے مواد
- [Azure Developer CLI ڈاکیومنٹیشن](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure آرکیٹیکچر سینٹر](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure ویل-آرکیٹیکٹڈ فریم ورک](https://learn.microsoft.com/en-us/azure/well-architected/)

### کمیونٹی اور سپورٹ
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer کمیونٹی](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### ٹیمپلیٹس اور مثالیں
- [سرکاری ٹیمپلیٹ گیلری](https://azure.github.io/awesome-azd/)
- [کمیونٹی ٹیمپلیٹس](https://github.com/Azure-Samples/azd-templates)
- [انٹرپرائز پیٹرنز](https://github.com/Azure/azure-dev/tree/main/templates)

---

**مبارک ہو کہ آپ نے اپنا پہلا azd پروجیکٹ مکمل کر لیا!** آپ اب اعتماد کے ساتھ Azure پر بہترین ایپلیکیشنز بنانے اور تعینات کرنے کے لیے تیار ہیں۔

---

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 1 - بنیاد اور جلدی آغاز
- **⬅️ سابقہ**: [انسٹالیشن اور سیٹ اپ](installation.md)
- **➡️ اگلا**: [اپنی ایپ لائیں](bring-your-own-app.md)
- **🚀 اگلا باب**: [باب 2: AI-فرسٹ ڈیولپمنٹ](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->