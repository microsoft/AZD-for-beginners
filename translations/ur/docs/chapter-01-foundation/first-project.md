# آپ کا پہلا پروجیکٹ - عملی ٹیوٹوریل

**باب کی نیوی گیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 1 - بنیاد اور فوری آغاز
- **⬅️ پچھلا**: [تنصیب اور سیٹ اپ](installation.md)
- **➡️ اگلا**: [تشکیل](configuration.md)
- **🚀 اگلا باب**: [باب 2: AI-فرسٹ ڈیولپمنٹ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## تعارف

آپ کے پہلے Azure Developer CLI پروجیکٹ میں خوش آمدید! یہ جامع عملی ٹیوٹوریل آپ کو ایک مکمل اسٹیک ایپلیکیشن کو azd استعمال کرتے ہوئے Azure پر بنانے، تعینات کرنے، اور مینج کرنے کا مکمل جائزہ فراہم کرتا ہے۔ آپ ایک حقیقی todo ایپلیکیشن کے ساتھ کام کریں گے جس میں React فرنٹ اینڈ، Node.js API بیک اینڈ، اور MongoDB ڈیٹا بیس شامل ہے۔

## تعلیمی مقاصد

اس ٹیوٹوریل کو مکمل کرکے، آپ:
- azd پروجیکٹ کی ابتدائی کاری کے ورک فلو میں مہارت حاصل کریں گے، ٹیمپلیٹس استعمال کرتے ہوئے
- Azure Developer CLI پروجیکٹ کی ساخت اور تشکیلی فائلیں سمجھیں گے
- پورے ایپلیکیشن کی تعیناتی Azure پر انفراسٹرکچر کی فراہمی کے ساتھ انجام دیں گے
- ایپلیکیشن اپڈیٹس اور دوبارہ تعیناتی کی حکمت عملیوں کو نافذ کریں گے
- ترقی اور اسٹیجنگ کے لیے متعدد ماحول کی مینجمنٹ کریں گے
- وسائل کی صفائی اور لاگت کے انتظام کی مشق کریں گے

## تعلیمی نتائج

مکمل کرنے پر، آپ قابل ہوں گے:
- ٹیمپلیٹس سے azd پروجیکٹس کو آزادانہ طور پر شروع اور ترتیب دینا
- مؤثر طریقے سے azd پروجیکٹ کی ساختوں کو دریافت اور ترمیم کرنا
- یکجا کمانڈز استعمال کرتے ہوئے پورے اسٹیک ایپلیکیشنز Azure پر تعینات کرنا
- عام تعیناتی مسائل اور تصدیقی مشکلات کو حل کرنا
- مختلف تعیناتی مراحل کے لیے متعدد Azure ماحول کی مینجمنٹ
- ایپلیکیشن اپ ڈیٹس کے لیے مسلسل تعیناتی ورک فلو نافذ کرنا

## آغاز

### ضروریات کی فہرست
- ✅ Azure Developer CLI انسٹال ہے ([تنصیب کی گائیڈ](installation.md))
- ✅ Azure CLI انسٹال ہے اور تصدیق شدہ ہے
- ✅ آپ کے سسٹم پر Git انسٹال ہے
- ✅ Node.js 16+ (اس ٹیوٹوریل کے لیے)
- ✅ Visual Studio Code (تجویز کردہ)

### اپنے سیٹ اپ کی تصدیق کریں
```bash
# azd کی تنصیب چیک کریں
azd version
```
### Azure کی تصدیق کی جانچ کریں

```bash
az account show
```

### Node.js ورژن چیک کریں
```bash
node --version
```

## مرحلہ 1: ٹیمپلیٹ کا انتخاب اور ابتدائی کاری

آئیے ایک مشہور todo ایپلیکیشن ٹیمپلیٹ سے شروع کرتے ہیں جس میں React فرنٹ اینڈ اور Node.js API بیک اینڈ شامل ہے۔

```bash
# دستیاب ٹیمپلیٹس کو براؤز کریں
azd template list

# ٹو ڈو ایپ ٹیمپلیٹ کو شروع کریں
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# ہدایات پر عمل کریں:
# - ایک ماحول کا نام درج کریں: "dev"
# - سبسکرپشن منتخب کریں (اگر آپ کے پاس متعدد ہیں)
# - ایک علاقہ منتخب کریں: "East US 2" (یا اپنی پسندیدہ جگہ)
```

### کیا ہوا؟
- ٹیمپلیٹ کوڈ آپ کی لوکل ڈائریکٹری میں ڈاؤن لوڈ کیا گیا
- `azure.yaml` فائل بنائی گئی جس میں سروس کی تفصیلات ہیں
- `infra/` ڈائریکٹری میں انفراسٹرکچر کوڈ ترتیب دیا گیا
- ماحول کی کنفیگریشن بنائی گئی

## مرحلہ 2: پروجیکٹ کی ساخت کو دریافت کریں

آئیے دیکھیں کہ azd نے ہمارے لیے کیا تخلیق کیا ہے:

```bash
# پروجیکٹ کا ڈھانچہ دیکھیں
tree /f   # ونڈوز
# یا
find . -type f | head -20   # میک او ایس/لینکس
```

آپ کو یہ دیکھنا چاہیے:
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

**azure.yaml** - آپ کے azd پروجیکٹ کا مرکز:
```bash
# پروجیکٹ کی ترتیب دیکھیں
cat azure.yaml
```

**infra/main.bicep** - انفراسٹرکچر کی تعریف:
```bash
# انفراسٹرکچر کوڈ دیکھیں
head -30 infra/main.bicep
```

## مرحلہ 3: اپنا پروجیکٹ حسب ضرورت بنائیں (اختیاری)

تعیناتی سے پہلے، آپ ایپلیکیشن میں تخصیص کر سکتے ہیں:

### فرنٹ اینڈ میں ترمیم کریں
```bash
# ریئیکٹ ایپ کمپونینٹ کھولیں
code src/web/src/App.tsx
```

ایک سادہ تبدیلی کریں:
```typescript
// عنوان تلاش کریں اور اسے تبدیل کریں
<h1>My Awesome Todo App</h1>
```

### ماحول کے متغیرات ترتیب دیں
```bash
# حسب ضرورت ماحول کے متغیرات مقرر کریں
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# تمام ماحول کے متغیرات دیکھیں
azd env get-values
```

## مرحلہ 4: Azure پر تعینات کریں

اب دلچسپ مرحلہ — سب کچھ Azure پر تعینات کریں!

```bash
# انفراسٹرکچر اور ایپلیکیشن کو تعینات کریں
azd up

# یہ کمانڈ کرے گا:
# 1. ایزور کے وسائل فراہم کریں (ایپ سروس، کاسموس ڈی بی، وغیرہ)
# 2. آپ کی ایپلیکیشن تیار کریں
# 3. فراہم کردہ وسائل پر تعینات کریں
# 4. ایپلیکیشن کا یو آر ایل دکھائیں
```

### تعیناتی کے دوران کیا ہو رہا ہے؟

`azd up` کمانڈ یہ اقدامات انجام دیتا ہے:
1. **فراہم کریں** (`azd provision`) - Azure وسائل بناتا ہے
2. **پیکج** - آپ کے ایپلیکیشن کوڈ کو بناتا ہے
3. **تعینات کریں** (`azd deploy`) - کوڈ کو Azure وسائل پر تعینات کرتا ہے

### متوقع آؤٹ پٹ
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
تعیناتی کے آؤٹ پٹ میں دیے گئے URL پر کلک کریں، یا جب چاہیں حاصل کریں:
```bash
# ایپلیکیشن کے اختتامی نکات حاصل کریں
azd show

# اپنے براؤزر میں ایپلیکیشن کھولیں
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo ایپ کی جانچ کریں
1. **نیا آئٹم شامل کریں** - "Add Todo" پر کلک کریں اور کوئی کام داخل کریں
2. **مکمل نشان لگائیں** - مکمل شدہ آئٹمز کو منتخب کریں
3. **آئٹمز حذف کریں** - جو todos آپ کو چاہئیں نہیں، انہیں ہٹائیں

### اپنی ایپلیکیشن کی نگرانی کریں
```bash
# اپنے وسائل کے لیے Azure پورٹل کھولیں
azd monitor

# درخواست کے لاگز دیکھیں
azd monitor --logs

# لائیو میٹرکس دیکھیں
azd monitor --live
```

## مرحلہ 6: تبدیلیاں کریں اور دوبارہ تعینات کریں

چلیں ایک تبدیلی کرتے ہیں اور دیکھتے ہیں کہ اپ ڈیٹ کرنا کتنا آسان ہے:

### API میں ترمیم کریں
```bash
# اے پی آئی کوڈ میں ترمیم کریں
code src/api/src/routes/lists.js
```

ایک کسٹم رسپانس ہیڈر شامل کریں:
```javascript
// ایک روٹ ہینڈلر تلاش کریں اور شامل کریں:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### صرف کوڈ کی تبدیلیوں کو تعینات کریں
```bash
# صرف درخواست کا کوڈ تعینات کریں (انفراسٹرکچر چھوڑ دیں)
azd deploy

# یہ 'azd up' سے کہیں زیادہ تیز ہے کیونکہ انفراسٹرکچر پہلے سے موجود ہے
```

## مرحلہ 7: متعدد ماحول کی مینجمنٹ

تبدیلیوں کو پروڈکشن سے پہلے جانچنے کے لیے ایک اسٹیجنگ ماحول بنائیں:

```bash
# ایک نیا اسٹیجنگ ماحول بنائیں
azd env new staging

# اسٹیجنگ پر تعینات کریں
azd up

# دوبارہ ڈیو ماحول پر جائیں
azd env select dev

# تمام ماحول کی فہرست بنائیں
azd env list
```

### ماحولوں کا موازنہ
```bash
# ترقیاتی ماحول دیکھیں
azd env select dev
azd show

# اسٹیجنگ ماحول دیکھیں
azd env select staging
azd show
```

## مرحلہ 8: وسائل کی صفائی کریں

جب آپ تجربات ختم کرلیں، مستقل چارجز سے بچنے کے لیے صفائی کریں:

```bash
# موجودہ ماحول کے لیے تمام Azure وسائل حذف کریں
azd down

# تصدیق کے بغیر زبردستی حذف کریں اور نرم حذف شدہ وسائل کو مکمل ختم کریں
azd down --force --purge

# مخصوص ماحول کو حذف کریں
azd env select staging
azd down --force --purge
```

## کلاسک ایپ بمقابلہ AI سے چلنے والی ایپ: ایک جیسا ورک فلو

آپ نے ابھی ایک روایتی ویب ایپلیکیشن تعینات کی۔ لیکن اگر آپ AI سے چلنے والی ایپلیکیشن تعینات کرنا چاہیں — مثلاً Microsoft Foundry Models کے ساتھ چٹ چیٹ ایپ؟

اچھی خبر: **ورک فلو بالکل ایک جیسا ہے۔**

| مرحلہ | کلاسک Todo ایپ | AI چیٹ ایپ |
|------|-----------------|-------------|
| ابتدائی کاری | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| تصدیق | `azd auth login` | `azd auth login` |
| تعیناتی | `azd up` | `azd up` |
| نگرانی | `azd monitor` | `azd monitor` |
| صفائی | `azd down --force --purge` | `azd down --force --purge` |

فرق صرف وہ **ٹیمپلیٹ** ہے جس سے آپ شروع کرتے ہیں۔ AI ٹیمپلیٹ میں اضافی انفراسٹرکچر شامل ہوتا ہے (جیسے Microsoft Foundry Models ریسورس یا AI سرچ انڈیکس)، لیکن azd یہ سب آپ کے لیے سنبھالتا ہے۔ آپ کو نئے کمانڈز سیکھنے کی ضرورت نہیں، کوئی مختلف ٹول اپنانے کی ضرورت نہیں، یا تعیناتی کے بارے میں اپنے سوچنے کا انداز تبدیل کرنے کی ضرورت نہیں۔

یہ azd کا بنیادی اصول ہے: **ایک ورک فلو، ہر قسم کا کام۔** آپ نے اس ٹیوٹوریل میں جو مہارتیں سیکھیں — ابتدائی کاری، تعیناتی، نگرانی، دوبارہ تعیناتی، اور صفائی — AI ایپلیکیشنز اور ایجنٹس پر برابر لاگو ہوتی ہیں۔

---

## آپ نے کیا سیکھا؟

مبارک ہو! آپ نے کامیابی کے ساتھ:
- ✅ ٹیمپلیٹ سے azd پروجیکٹ کی ابتدائی کاری کی
- ✅ پروجیکٹ کی ساخت اور اہم فائلوں کو دریافت کیا
- ✅ ایک مکمل اسٹیک ایپلیکیشن Azure پر تعینات کی
- ✅ کوڈ میں تبدیلیاں کیں اور دوبارہ تعینات کیا
- ✅ متعدد ماحول کا انتظام کیا
- ✅ وسائل کی صفائی کی

## 🎯 مہارت کی تصدیقی مشقیں

### مشق 1: مختلف ٹیمپلیٹ تعینات کریں (15 منٹ)
**مقصد**: azd init اور تعیناتی ورک فلو میں مہارت کا مظاہرہ کرنا

```bash
# پائتھن + مونگو ڈی بی اسٹیک آزمانا
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
- [ ] ایپلیکیشن بغیر غلطیوں کے تعینات ہو
- [ ] براؤزر میں ایپلیکیشن کا URL قابل رسائی ہو
- [ ] ایپلیکیشن درست طریقے سے کام کرے (todo شامل/حذف کریں)
- [ ] تمام وسائل کامیابی کے ساتھ صاف کیے گئے ہوں

### مشق 2: ترتیبات کو حسب ضرورت بنائیں (20 منٹ)
**مقصد**: ماحول کے متغیروں کی ترتیب کی مشق کرنا

```bash
cd my-first-azd-app

# حسب ضرورت ماحول تشکیل دیں
azd env new custom-config

# حسب ضرورت متغیرات سیٹ کریں
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# متغیرات کی تصدیق کریں
azd env get-values | grep APP_TITLE

# حسب ضرورت ترتیب کے ساتھ تعینات کریں
azd up
```

**کامیابی کے معیارات:**
- [ ] حسب ضرورت ماحول کامیابی کے ساتھ بنایا گیا ہو
- [ ] ماحول کے متغیرات سیٹ اور بازیافت کیے جا سکیں
- [ ] ایپلیکیشن حسب ضرورت ترتیب کے ساتھ تعینات ہو
- [ ] تعینات ایپ میں حسب ضرورت ترتیبات کی تصدیق ہو سکے

### مشق 3: متعدد ماحولوں کا ورک فلو (25 منٹ)
**مقصد**: ماحول کی مینجمنٹ اور تعیناتی حکمت عملیوں میں مہارت حاصل کرنا

```bash
# ترقیاتی ماحول بنائیں
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# ترقیاتی یو آر ایل نوٹ کریں
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# مرحلہ وار ماحول بنائیں
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# مرحلہ وار یو آر ایل نوٹ کریں
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# ماحول کا موازنہ کریں
azd env list

# دونوں ماحول کی جانچ کریں
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# دونوں کی صفائی کریں
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**کامیابی کے معیارات:**
- [ ] دو مختلف کنفیگریشن والے ماحول بنائے گئے ہوں
- [ ] دونوں ماحول کامیابی کے ساتھ تعینات کیے گئے ہوں
- [ ] `azd env select` کا استعمال کرتے ہوئے ماحولوں کے درمیان سوئچ کیا جا سکے
- [ ] ماحول کے متغیرات ماحولوں کے درمیان مختلف ہوں
- [ ] دونوں ماحولوں کی کامیابی کے ساتھ صفائی کی گئی ہو

## 📊 آپ کی پیشرفت

**صرف وقت**: تقریباً 60-90 منٹ  
**حاصل کردہ مہارتیں**:
- ✅ ٹیمپلیٹ پر مبنی پروجیکٹ کی ابتدائی کاری
- ✅ Azure وسائل کی فراہمی
- ✅ ایپلیکیشن تعیناتی ورک فلو
- ✅ ماحول کی مینجمنٹ
- ✅ ترتیبات کا انتظام
- ✅ وسائل کی صفائی اور لاگت کا انتظام

**اگلا مرحلہ**: آپ [تشکیل گائیڈ](configuration.md) کے لیے تیار ہیں تاکہ جدید ترتیبات کے پیٹرنز سیکھیں!

## عام مسائل اور ان کے حل

### تصدیقی غلطیاں
```bash
# Azure کے ساتھ دوبارہ تصدیق کریں
az login

# سبسکرپشن تک رسائی کی تصدیق کریں
az account show
```

### تعیناتی ناکامی
```bash
# ڈی بگ لاگنگ کو فعال کریں
export AZD_DEBUG=true
azd up --debug

# ایزور میں ایپلیکیشن لاگز دیکھیں
azd monitor --logs

# کنٹینر ایپس کے لیے، ایزور CLI استعمال کریں:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### وسائل کے ناموں کے تنازعے
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

## آگے کے اقدامات

اب جب کہ آپ نے اپنا پہلا پروجیکٹ مکمل کر لیا ہے، ان جدید موضوعات کو دریافت کریں:

### 1. انفراسٹرکچر کو حسب ضرورت بنائیں
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [ڈیٹا بیسز، اسٹوریج، اور دیگر خدمات شامل کرنا](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD سیٹ اپ کریں
- [تعیناتی گائیڈ](../chapter-04-infrastructure/deployment-guide.md) - مکمل CI/CD ورک فلو
- [Azure Developer CLI دستاویزات](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - پائپ لائن کنفیگریشن

### 3. پروڈکشن کی بہترین مشقیں
- [تعیناتی گائیڈ](../chapter-04-infrastructure/deployment-guide.md) - سیکیورٹی، کارکردگی، اور نگرانی

### 4. مزید ٹیمپلیٹس دریافت کریں
```bash
# ٹیمپلیٹس کو زمرہ کے لحاظ سے براؤز کریں
azd template list --filter web
azd template list --filter api
azd template list --filter database

# مختلف ٹیکنالوجی اسٹیکس آزمائیں
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## اضافی وسائل

### تعلیمی مواد
- [Azure Developer CLI دستاویزات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure آرکیٹیکچر سینٹر](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected فریم ورک](https://learn.microsoft.com/en-us/azure/well-architected/)

### کمیونٹی اور سپورٹ
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure ڈیولپر کمیونٹی](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### ٹیمپلیٹس اور مثالیں
- [سرکاری ٹیمپلیٹ گیلری](https://azure.github.io/awesome-azd/)
- [کمیونٹی ٹیمپلیٹس](https://github.com/Azure-Samples/azd-templates)
- [انٹرپرائز پیٹرنز](https://github.com/Azure/azure-dev/tree/main/templates)

---

**آپ کے پہلے azd پروجیکٹ کی تکمیل پر مبارکباد!** اب آپ اعتماد کے ساتھ Azure پر شاندار ایپلیکیشنز بنانے اور تعینات کرنے کے لیے تیار ہیں۔

---

**باب کی نیوی گیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 1 - بنیاد اور فوری آغاز
- **⬅️ پچھلا**: [تنصیب اور سیٹ اپ](installation.md)
- **➡️ اگلا**: [تشکیل](configuration.md)
- **🚀 اگلا باب**: [باب 2: AI-فرسٹ ڈیولپمنٹ](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **اگلا سبق**: [تعیناتی گائیڈ](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:  
اس دستاویز کا ترجمہ AI ترجمہ خدمت [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے کیا گیا ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم صحیحیت ہو سکتی ہے۔ اصل دستاویز اپنی مادری زبان میں ہی مستند ذریعہ سمجھی جانی چاہیے۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تعبیر کی ذمہ داری ہم پر عائد نہیں ہوگی۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->