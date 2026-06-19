# اپنا azd ٹیمپلیٹ تیار کرنا

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 4 - انفراسٹرکچر از کوڈ اور تعیناتی
- **⬅️ پچھلا**: [Deployment Guide](deployment-guide.md)
- **🚀 اگلا باب**: [باب 5: ملٹی ایجنٹ حل](../chapter-05-multi-agent/README.md)

> جون 2026 میں `azd 1.25.6` کے خلاف تصدیق شدہ۔

## تعارف

اب تک آپ نے *استعمال کیا ہے* ٹیمپلیٹس کو `azd init --template <name>` کے ساتھ۔ لیکن جب آپ کے پاس ایک پروجیکٹ لے آؤٹ ہوگا جو آپ کی ٹیم کو پسند آئے — مثلاً ایک Container App جس میں Cosmos DB اور درست مانیٹرنگ ہو — تو آپ اسے اپنے قابلِ استعمال ٹیمپلیٹ میں تبدیل کرنا چاہیں گے۔ ایک ٹیمپلیٹ محض ایک Git ریپوزٹری ہے جس کی ساخت متوقع ہوتی ہے اور azd جانتا ہے کہ اسے کیسے پڑھنا ہے۔ یہ سبق آپ کو دکھاتا ہے کہ ایک ٹیمپلیٹ سکریچ سے کیسے بنائیں، اسے ٹیسٹ کریں، اور (اختیاری طور پر) کمیونٹی گیلری میں شائع کریں۔

## تعلیمی مقاصد

اس سبق کے اختتام تک، آپ:
- سمجھیں گے کہ کون سی چیز کسی فولڈر کو "azd ٹیمپلیٹ" بناتی ہے
- ضروری فائلز اور فولڈر لے آؤٹ جان لیں گے
- ایسا `azure.yaml` اور `infra/` شامل کریں گے جسے دوسرے لوگ دوبارہ استعمال کر سکیں
- اشتراک کرنے سے پہلے اپنے ٹیمپلیٹ کو مقامی طور پر ٹیسٹ کریں گے
- اسے شائع کریں گے اور (اختیاری طور پر) Awesome AZD میں جمع کروائیں گے

## سیکھنے کے نتائج

یہ سبق مکمل کرنے کے بعد، آپ قابلِ اہلیت ہوں گے:
- نئی ٹیمپلیٹ ریپوزٹری تیار کریں
- انفراسٹرکچر کو پیرامیٹرائز کریں تاکہ یہ کسی بھی سبسکرپشن میں کام کرے
- `azd init` اور `azd up` کے ساتھ ٹیمپلیٹ کی توثیق کریں
- وہ میٹاڈیٹا شامل کریں جو کمیونٹی گیلری مانگتی ہے

---

## حقیقت میں ٹیمپلیٹ کیا ہے؟

ایک azd ٹیمپلیٹ **ایک Git ریپوزٹری** ہے جو کم از کم درج ذیل پر مشتمل ہوتی ہے:

| File / folder | Purpose | Required? |
|---------------|---------|-----------|
| `azure.yaml` | سروسز، ہوسٹس، اور انفراسٹرکچر فراہم کنندہ کو بیان کرتا ہے | ✅ ہاں |
| `infra/` | وسائل فراہم کرنے کے لیے Bicep، Terraform، یا Pulumi | ✅ ہاں |
| `src/` (or your code) | وہ ایپلیکیشن کوڈ جو azd تعینات کرتا ہے | ✅ ہاں |
| `README.md` | ٹیمپلیٹ کو کیسے استعمال کریں | ✅ شدید طور پر تجویز کیا گیا |
| `.azdo/` or `.github/` | CI/CD پائپ لائن کی تعریفیں | اختیاری |
| `.devcontainer/` | دوبارہ پیدا کرنے کے لائق ڈویلپمنٹ ماحول | اختیاری |
| `azure.yaml` `metadata` | گیلری اور ٹیلیمیٹری معلومات | اختیاری (شائع کرنے کے لیے ضروری) |

یہاں کوئی جادو نہیں ہے: جب آپ `azd init --template you/your-repo` چلائیں گے، azd ریپو کو کلون کرتا ہے اور `azure.yaml` کو پڑھتا ہے۔

---

## مرحلہ 1: ریپوزٹری کا ڈھانچہ بنائیں

فولڈر کی ساخت ہاتھ سے بنائیں یا ایک کم از کم ٹیمپلیٹ سے شروع کریں اور اسے ایڈٹ کریں:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# معیاری لے آؤٹ بنائیں
mkdir -p src infra
```

ایک عام مکمل ترتیب اس طرح دکھتی ہے:

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

> `metadata.template` فیلڈ وہ ہے جسے گیلری کی ٹیلیمیٹری استعمال کرتی ہے تاکہ استعمال گنا جا سکے۔ `name@version` کنونشن استعمال کریں۔

---

## مرحلہ 3: انفراسٹرکچر کو پیرامیٹرائز کریں

ایک *قابلِ دوبارہ استعمال* ٹیمپلیٹ کے لیے سب سے اہم اصول: **ناموں، علاقوں، یا سبسکرپشن مخصوص قدروں کو کبھی ہارڈ کوڈ نہ کریں۔** پیرامیٹرز اور resource token پیٹرن استعمال کریں تاکہ وہی ٹیمپلیٹ کسی کے بھی سبسکرپشن میں کام کرے۔

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

دو چیزیں اس ٹیمپلیٹ کو دوستانہ بناتی ہیں:

1. **`azd-env-name` tag** — azd اسے ہر ماحول کے لیے وسائل کا پتہ لگانے اور صاف کرنے کے لیے استعمال کرتا ہے۔
2. **`uniqueString(...)` resource token** — ایک مستحکم، عالمی طور پر منفرد سافکس بناتا ہے تاکہ نام ٹکراؤ نہ کریں۔

ایک مماثل parameters فائل فراہم کریں جو وہ قدریں پڑھتی ہو جو azd ماحول سے انجیکٹ کرتا ہے:

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

azd موجودہ ماحول سے `${AZURE_ENV_NAME}` اور `${AZURE_LOCATION}` خود بخود داخل کرتا ہے۔

---

## مرحلہ 4: اپنے ٹیمپلیٹ کو مقامی طور پر ٹیسٹ کریں

اشتراک کرنے سے پہلے ثابت کریں کہ ٹیمپلیٹ کلین سٹیٹ سے کام کرتا ہے۔

**لوکل فولڈر سے ٹیسٹ کریں** (کسی Git push کی ضرورت نہیں):

```bash
# خالی ڈائریکٹری سے اپنے مقامی ٹیمپلیٹ راستے کا استعمال کرتے ہوئے ابتدا کریں
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# شروع سے آخر تک پروویژن اور تعینات کریں
azd auth login
azd up
```

**پھر teardown کی آزمائش کریں**—ایک اچھا ٹیمپلیٹ مکمل طور پر وسائل ہٹا دیتا ہے:

```bash
azd down --force --purge
```

اگر `azd down` وسائل چھوڑ دیتا ہے، تو ممکنہ طور پر آپ نے کسی ریسورس پر `azd-env-name` ٹیگ لگانا بھول گئے ہیں۔

> **Tip:** پہلے `azd provision --preview` چلائیں۔ یہ ایک what-if انجام دیتا ہے اور کسی بھی ریسورس کے بننے سے پہلے ٹیمپلیٹ کی غلطیوں کو سامنے لاتا ہے۔

---

## مرحلہ 5: ٹیمپلیٹ شائع کریں

ریپوزٹری کو GitHub پر پش کریں (اگر آپ چاہتے ہیں کہ دوسرے لوگ استعمال کریں تو پبلک):

```bash
gh repo create my-azd-template --public --source=. --push
```

اب کوئی بھی اسے استعمال کر سکتا ہے:

```bash
azd init --template your-github-username/my-azd-template
```

---

## مرحلہ 6 (اختیاری): Awesome AZD میں جمع کروائیں

[Awesome AZD گیلری](https://azure.github.io/awesome-azd/) کمیونٹی ٹیمپلیٹس کی فہرست دیتی ہے۔ فہرست میں شامل ہونے کے لیے آپ کے ریپو میں درج ذیل شامل ہونے چاہئیں:

- ✅ ایک واضح `README.md` جس میں پہلے سے درکار چیزیں، ایک آرکیٹیکچر ڈایاگرام، اور قیمت کے نوٹس ہوں
- ✅ ایک کام کرنے والا `azure.yaml` جس میں `metadata.template` ہو
- ✅ ایسا انفراسٹرکچر جو تازہ سبسکرپشن میں صاف طریقے سے پروویژن ہو
- ✅ ایک `LICENSE` فائل
- ✅ (تجویز کردہ) ایک `.devcontainer/` جو ایک کلک Codespaces کے لیے ہو

گیلری کے data فائل میں اپنا ٹیمپلیٹ شامل کرنے والی پل ریکویسٹ کھول کر جمع کروائیں، اور شراکت گائیڈ پر عمل کریں جو [Awesome AZD repository](https://github.com/Azure/awesome-azd) میں موجود ہے۔

---

## عام مسائل

| مسئلہ | حل |
|---------|-----|
| وسائل کے ہارڈ کوڈڈ نام | `uniqueString()` ریسورس ٹوکن استعمال کریں |
| `azd down` وسائل چھوڑ دیتا ہے | ہر ریسورس (یا ریسورس گروپ) کو `azd-env-name` ٹیگ کریں |
| ٹیمپلیٹ آپ کے لیے کام کرتا ہے، دوسروں کے لیے ناکام ہوتا ہے | سبسکرپشن IDs، tenant IDs، اور علاقائی مفروضے ہٹا دیں |
| آؤٹ پٹس ایپ میں مربوط نہیں | `SERVICE_<NAME>_ENDPOINT_URL` اور دیگر `AZURE_*` آؤٹ پٹس کو ایکسپورٹ کریں |
| گیلری جمع کرانا مسترد ہو گیا | `README.md`, `LICENSE`, اور `metadata.template` شامل کریں |

---

## خلاصہ

- ایک ٹیمپلیٹ محض ایک Git ریپو ہے جس میں `azure.yaml`, `infra/`, اور آپ کا کوڈ ہوتا ہے۔
- ہر چیز کو پیرامیٹرائز کریں — نام، علاقے، اور IDs — تاکہ یہ کہیں بھی چل سکے۔
- ہمیشہ وسائل کو `azd-env-name` کے ساتھ ٹیگ کریں تاکہ `azd down` کام کرے۔
- شائع کرنے سے پہلے `azd init --template <local-path>` کے ساتھ مقامی طور پر ٹیسٹ کریں۔
- Awesome AZD میں جمع کروانے کے لیے میٹاڈیٹا اور README شامل کریں۔

---

## 🔗 نیویگیشن

| سمت | وسیلہ |
|-----------|----------|
| **پچھلا** | [Deployment Guide](deployment-guide.md) |
| **باب ہوم** | [باب 4: Infrastructure as Code](README.md) |
| **اگلا باب** | [باب 5: ملٹی ایجنٹ حل](../chapter-05-multi-agent/README.md) |

## 📖 متعلقہ وسائل

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [سرکاری azd ٹیمپلیٹ دستاویزات](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->