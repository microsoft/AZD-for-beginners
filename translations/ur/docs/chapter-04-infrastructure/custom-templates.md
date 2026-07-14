# اپنا خود کا azd ٹیمپلیٹ تیار کرنا

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD کے لیے ابتدائی](../../README.md)
- **📖 موجودہ باب**: باب 4 - انفراسٹرکچر ایز کوڈ اور تعیناتی
- **⬅️ پچھلا**: [تعیناتی گائیڈ](deployment-guide.md)
- **🚀 اگلا باب**: [باب 5: ملٹی ایجنٹ حل](../chapter-05-multi-agent/README.md)

> جولائی 2026 میں `azd 1.27.1` کے خلاف تصدیق شدہ۔

## تعارف

اب تک آپ نے `azd init --template <name>` کے ساتھ ٹیمپلیٹس *استعمال* کیے ہیں۔ لیکن جب آپ کے پاس ایک پروجیکٹ لے آؤٹ آجاتا ہے جو آپ کی ٹیم کو پسند آئے—مثلاً ایک کنٹینر ایپ جس کے ساتھ کوسموس ڈی بی اور صحیح مانیٹرنگ ہو—تو آپ اسے اپنے ذاتی قابل استعمال ٹیمپلیٹ میں تبدیل کرنا چاہیں گے۔ ٹیمپلیٹ بس ایک Git ریپوزیٹری ہے جس کی ایک متوقع ساخت ہوتی ہے جسے azd پڑھنا جانتا ہے۔ یہ سبق آپ کو دکھائے گا کہ اسے کس طرح سکریچ سے بنانا ہے، ٹیسٹ کرنا ہے، اور (اختیاری طور پر) کمیونٹی گیلری میں شائع کرنا ہے۔

## سیکھنے کے مقاصد

اس سبق کے اختتام تک، آپ:
- سمجھ جائیں گے کہ کیا کسی فولڈر کو "azd ٹیمپلیٹ" بناتا ہے
- ضروری فائلز اور فولڈر لے آؤٹ کو جانیں گے
- ایک `azure.yaml` اور `infra/` شامل کریں گے جسے دوسرے لوگ دوبارہ استعمال کر سکیں
- اسے شیئر کرنے سے پہلے اپنے ٹیمپلیٹ کو لوکل ٹیسٹ کریں گے
- اسے شائع کریں گے اور (اختیاری طور پر) Awesome AZD میں جمع کروائیں گے

## سیکھنے کے نتائج

اس سبق کے بعد، آپ کر سکیں گے:
- ایک نیا ٹیمپلیٹ ریپوزیٹری اسکافولڈ کرنا
- انفراسٹرکچر کو پیرامیٹرائز کرنا تاکہ یہ کسی بھی سبسکرپشن میں کام کرے
- `azd init` اور `azd up` کے ساتھ ٹیمپلیٹ کی تصدیق کرنا
- وہ میٹا ڈیٹا شامل کرنا جو کمیونٹی گیلری کو چاہیے

---

## ٹیمپلیٹ درحقیقت کیا ہے؟

ایک azd ٹیمپلیٹ **ایک Git ریپوزیٹری** ہے جس میں کم از کم یہ شامل ہوتا ہے:

| فائل / فولڈر | مقصد | ضروری؟ |
|---------------|---------|-----------|
| `azure.yaml` | سروسز، ہوسٹس، اور انفراسٹرکچر فراہم کنندہ کی تفصیل | ✅ جی ہاں |
| `infra/` | بائسک، ٹیررا فارم، یا پلمی جو ریسورسز فراہم کرتا ہے | ✅ جی ہاں |
| `src/` (یا آپ کا کوڈ) | وہ ایپلیکیشن کوڈ جو azd تعینات کرتا ہے | ✅ جی ہاں |
| `README.md` | ٹیمپلیٹ کے استعمال کا طریقہ | ✅ مضبوطی سے تجویز کردہ |
| `.azdo/` یا `.github/` | CI/CD پائپ لائن کی تعریفیں | اختیاری |
| `.devcontainer/` | قابل دوبارہ پیدا کرنے والا ڈویلپمنٹ ماحول | اختیاری |
| `azure.yaml` `metadata` | گیلری + ٹیلی میٹری معلومات | اختیاری (شائع کرنے کے لیے ضروری) |

یہاں کوئی جادو نہیں ہے: جب آپ `azd init --template you/your-repo` چلائیں گے، azd ریپو کو کلون کرے گا اور `azure.yaml` کو پڑھے گا۔

---

## مرحلہ 1: ریپوزیٹری اسکافولڈ کریں

فولڈر کی ساخت خود بنائیں یا ایک کم سے کم ٹیمپلیٹ سے شروع کریں اور اسے ترمیم کریں:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# معیاری لے آؤٹ بنائیں
mkdir -p src infra
```

ایک عام مکمل لے آؤٹ کچھ اس طرح دکھتا ہے:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## مرحلہ 2: `azure.yaml` لکھیں

یہ ٹیمپلیٹ کا دل ہے۔ یہ azd کو بتاتا ہے کہ کیا تعینات کرنا ہے اور کیسے:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> `metadata.template` فیلڈ وہ ہے جو گیلری ٹیلی میٹری استعمال کرتی ہے تاکہ استعمال کی گنتی کی جا سکے۔ `name@version` روایتی طریقہ استعمال کریں۔

---

## مرحلہ 3: انفراسٹرکچر کو پیرامیٹرائز کریں

ایک *قابلِ استعمال* ٹیمپلیٹ کے لیے سب سے اہم اصول: **کبھی نام، علاقوں، یا سبسکرپشن مخصوص قدریں ہارڈ کوڈ نہ کریں۔** پیرامیٹرز اور ریسورس ٹوکن پیٹرن استعمال کریں تاکہ وہی ٹیمپلیٹ کسی بھی شخص کی سبسکرپشن میں کام کرے۔

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

دو چیزیں اسے ٹیمپلیٹ فرینڈلی بناتی ہیں:

1. **`azd-env-name` ٹیگ** — azd اسے ہر ماحولیاتی نظام کے لیے وسائل کی ٹریکنگ اور صفائی کے لیے استعمال کرتا ہے۔
2. **`uniqueString(...)` ریسورس ٹوکن** — ایک مستحکم، عالمی طور پر منفرد لاحقہ پیدا کرتا ہے تاکہ نام ٹکراؤ نہ کریں۔

ایک میچنگ پیرامیٹر فائل فراہم کریں جو وہ قدریں پڑھتی ہے جو azd ماحول سے داخل کرتا ہے:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd خود بخود موجودہ ماحول سے `${AZURE_ENV_NAME}` اور `${AZURE_LOCATION}` کو تبدیل کرتا ہے۔

---

## مرحلہ 4: اپنے ٹیمپلیٹ کو مقامی طور پر آزمائیں

شیئر کرنے سے پہلے، یہ ثابت کریں کہ ٹیمپلیٹ صاف حالت سے کام کرتا ہے۔

**لوکل فولڈر سے ٹیسٹ کریں** (کسی Git پش کی ضرورت نہیں):

```bash
# اپنے مقامی ٹیمپلیٹ کے راستے کا استعمال کرتے ہوئے خالی ڈائریکٹری سے ابتدا کریں
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# مکمل طور پر ترتیب دیں + تعینات کریں
azd auth login
azd up
```

**پھر ٹئیر ڈاؤن ٹیسٹ کریں**—ایک اچھا ٹیمپلیٹ مکمل صفائی کرتا ہے:

```bash
azd down --force --purge
```

اگر `azd down` ریسورسز چھوڑ دیتا ہے، تو غالباً آپ نے کسی ریسورس پر `azd-env-name` ٹیگ چھوڑ دیا ہے۔

> **ٹپ:** پہلے `azd provision --preview` چلائیں۔ یہ ایک what-if کرتا ہے اور ٹیمپلیٹ کی غلطیاں اس سے پہلے ظاہر کرتا ہے کہ کوئی ریسورس بنایا جائے۔

---

## مرحلہ 5: ٹیمپلیٹ شائع کریں

ریپوزیٹری کو GitHub پر پش کریں (اگر آپ چاہتے ہیں کہ دوسرے اسے استعمال کریں تو پبلک):

```bash
gh repo create my-azd-template --public --source=. --push
```

اب کوئی بھی اسے استعمال کر سکتا ہے:

```bash
azd init --template your-github-username/my-azd-template
```

---

## مرحلہ 6 (اختیاری): Awesome AZD کو جمع کروائیں

[Awesome AZD گیلری](https://azure.github.io/awesome-azd/) کمیونٹی ٹیمپلیٹس کو فہرست دیتی ہے۔ فہرست میں آنے کے لیے آپ کے ریپو میں شامل ہونا چاہیے:

- ✅ ایک واضح `README.md` جس میں پری ریکوزیشن، ایک فن تعمیر کا خاکہ، اور لاگت کے نوٹس شامل ہوں
- ✅ ایک کام کرنے والا `azure.yaml` جس میں `metadata.template` ہو
- ✅ ایک ایسا انفراسٹرکچر جو تازہ سبسکرپشن میں صاف طریقے سے فراہم ہو
- ✅ ایک `LICENSE` فائل
- ✅ (تجویز کردہ) ایک `.devcontainer/` جس سے ایک کلک میں Codespaces چل سکیں

گیلری کے ڈیٹا فائل میں اپنا ٹیمپلیٹ شامل کرنے کے لیے تعاون کی رہنمائی کے مطابق [Awesome AZD ریپوزیٹری](https://github.com/Azure/awesome-azd) میں پُل ریکویسٹ کھول کر جمع کروائیں۔

---

## عام غلطیاں

| غلطی | حل |
|---------|-----|
| ہارڈ کوڈ شدہ ریسورس نام | `uniqueString()` ریسورس ٹوکن استعمال کریں |
| `azd down` ریسورس چھوڑ دیتا ہے | ہر ریسورس (یا ریسورس گروپ) پر `azd-env-name` ٹیگ لگائیں |
| ٹیمپلیٹ آپ کے لیے کام کرتا ہے، دوسروں کے لیے ناکام ہو جاتا ہے | سبسکرپشن IDs، ٹیننٹ IDs، اور علاقائی مفروضے ہٹا دیں |
| آؤٹ پٹ ایپ میں مربوط نہیں ہیں | `SERVICE_<NAME>_ENDPOINT_URL` اور دیگر `AZURE_*` آؤٹ پٹس برآمد کریں |
| گیلری میں جمع کروانا مسترد ہو گیا | `README.md`, `LICENSE`, اور `metadata.template` شامل کریں |

---

## خلاصہ

- ٹیمپلیٹ بس ایک Git ریپو ہے جس میں `azure.yaml`، `infra/`، اور آپ کا کوڈ ہوتا ہے۔
- ہر چیز کو پیرامیٹرائز کریں—نام، علاقے، اور IDs—تاکہ یہ کہیں بھی چل سکے۔
- ہمیشہ ریسورسز پر `azd-env-name` ٹیگ لگائیں تاکہ `azd down` کام کرے۔
- شائع کرنے سے پہلے `azd init --template <local-path>` کے ساتھ لوکل ٹیسٹ کریں۔
- میٹا ڈیٹا اور README شامل کریں تاکہ Awesome AZD کو جمع کروایا جا سکے۔

---

## 🔗 نیویگیشن

| سمت | وسائل |
|-----------|----------|
| **پچھلا** | [تعیناتی گائیڈ](deployment-guide.md) |
| **باب ہوم** | [باب 4: انفراسٹرکچر از کوڈ](README.md) |
| **اگلا باب** | [باب 5: ملٹی ایجنٹ حل](../chapter-05-multi-agent/README.md) |

## 📖 متعلقہ وسائل

- [ذرائع کو فراہم کرنا](provisioning.md)
- [Awesome AZD گیلری](https://azure.github.io/awesome-azd/)
- [سرکاری azd ٹیمپلیٹ دستاویزات](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->