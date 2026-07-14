# ایجاد قالب azd اختصاصی خودتان

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل کنونی**: فصل ۴ - زیرساخت به عنوان کد و استقرار
- **⬅️ قبلی**: [راهنمای استقرار](deployment-guide.md)
- **🚀 فصل بعدی**: [فصل ۵: راه‌حل‌های چندعامل](../chapter-05-multi-agent/README.md)

> تایید شده با `azd 1.27.1` در ژوئیه ۲۰۲۶.

## مقدمه

تاکنون شما قالب‌ها را با `azd init --template <name>` *مصرف* کرده‌اید. اما هنگامی که ساختار پروژه‌ای دارید که تیم شما می‌پسندد—مثلاً یک برنامه Container App با Cosmos DB و پایش مناسب—می‌خواهید آن را به قالب قابل استفاده مجدد خود تبدیل کنید. یک قالب فقط یک مخزن Git با ساختاری قابل پیش‌بینی است که azd می‌داند چگونه آن را بخواند. این درس به شما نشان می‌دهد چگونه یکی را از ابتدا بسازید، آزمایش کنید و (اختیاری) در گالری جامعه منتشر کنید.

## اهداف آموزشی

در پایان این درس، شما:
- درک می‌کنید چه چیزی یک پوشه را "قالب azd" می‌سازد
- با فایل‌ها و ساختار پوشه‌های مورد نیاز آشنا می‌شوید
- یک `azure.yaml` و `infra/` اضافه می‌کنید که دیگران بتوانند مجدد استفاده کنند
- قالب خود را قبل از به اشتراک گذاری تست می‌کنید
- آن را منتشر کرده و (اختیاری) برای Awesome AZD ارسال می‌کنید

## نتایج یادگیری

پس از تکمیل این درس، شما خواهید توانست:
- یک مخزن قالب جدید راه‌اندازی کنید
- زیرساخت را پارامتردهی کنید تا در هر اشتراکی کار کند
- قالب را با `azd init` و `azd up` معتبرسازی کنید
- فراداده‌ای که گالری جامعه لازم دارد را اضافه کنید

---

## قالب چیست، واقعاً؟

یک قالب azd **یک مخزن Git است** که حداقل شامل موارد زیر می‌باشد:

| فایل / پوشه | هدف | ضروری؟ |
|---------------|---------|-----------|
| `azure.yaml` | توضیح خدمات، میزبان‌ها و ارائه‌دهنده زیرساخت | ✅ بله |
| `infra/` | Bicep، Terraform یا Pulumi که منابع را فراهم می‌کند | ✅ بله |
| `src/` (یا کد شما) | کد اپلیکیشن که azd آن را استقرار می‌دهد | ✅ بله |
| `README.md` | نحوه استفاده از قالب | ✅ بسیار توصیه شده |
| `.azdo/` یا `.github/` | تعاریف خط لوله CI/CD | اختیاری |
| `.devcontainer/` | محیط توسعه قابل بازتولید | اختیاری |
| `azure.yaml` `metadata` | اطلاعات گالری + تلومتری | اختیاری (لازم برای انتشار) |

در اینجا چیزی جادویی نیست: وقتی اجرا می‌کنید `azd init --template you/your-repo`، azd مخزن را کلون کرده و `azure.yaml` را می‌خواند.

---

## مرحله ۱: ساختاردهی مخزن

ساختار پوشه را دستی ایجاد کنید یا از یک قالب حداقلی شروع کنید و آن را ویرایش کنید:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# ایجاد طرح‌بندی استاندارد
mkdir -p src infra
```

یک ساختار معمولی تکمیل شده به این شکل است:

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

## مرحله ۲: نوشتن `azure.yaml`

این قلب قالب است. به azd می‌گوید چه چیزی را و چگونه مستقر کند:

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

> فیلد `metadata.template` همان چیزی است که تلومتری گالری برای شمارش استفاده به کار می‌برد. از قرارداد `name@version` استفاده کنید.

---

## مرحله ۳: پارامتردهی زیرساخت

مهم‌ترین قانون برای قالب *قابل استفاده مجدد*: **هرگز نام‌ها، مناطق یا مقادیر خاص اشتراک را به صورت هاردکد نکنید.** از پارامترها و الگوی توکن منبع استفاده کنید تا همان قالب در اشتراک هر کسی کار کند.

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

دو مورد این قالب را دوستانه می‌کند:

۱. **برچسب `azd-env-name`** — azd از آن برای ردیابی و پاکسازی منابع به ازای هر محیط استفاده می‌کند.
۲. **توکن منبع `uniqueString(...)`** — یک پسوند پایدار و یگانه جهانی تولید می‌کند تا نام‌ها تداخلی نداشته باشند.

یک فایل پارامترهای همسان ارائه دهید که مقادیری که azd از محیط تزریق می‌کند را می‌خواند:

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

azd به صورت خودکار `${AZURE_ENV_NAME}` و `${AZURE_LOCATION}` را از محیط جاری جایگزین می‌کند.

---

## مرحله ۴: قالب خود را محلی تست کنید

قبل از به اشتراک گذاری، اثبات کنید قالب از وضعیت تمیز کار می‌کند.

**از پوشه محلی تست کنید** (نیازی به گیت پوش نیست):

```bash
# از یک دایرکتوری خالی، با استفاده از مسیر قالب محلی خود مقداردهی اولیه کنید
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# ارائه و استقرار از ابتدا تا انتها
azd auth login
azd up
```

**سپس آزمایش کنید که پاک‌سازی انجام شود**—یک قالب خوب کاملاً پاک می‌کند:

```bash
azd down --force --purge
```

اگر `azd down` منابعی باقی گذاشت، احتمالاً برچسب `azd-env-name` را روی یک منبع زده‌ نشده است.

> **نکته:** ابتدا `azd provision --preview` را اجرا کنید. این کار یک پیش‌نمایش انجام می‌دهد و خطاهای قالب را قبل از ساخت هر منبع نشان می‌دهد.

---

## مرحله ۵: انتشار قالب

مخزن را به GitHub پوش کنید (عمومی اگر می‌خواهید دیگران استفاده کنند):

```bash
gh repo create my-azd-template --public --source=. --push
```

حالا هر کسی می‌تواند از آن استفاده کند:

```bash
azd init --template your-github-username/my-azd-template
```

---

## مرحله ۶ (اختیاری): ارسال به Awesome AZD

[گالری Awesome AZD](https://azure.github.io/awesome-azd/) قالب‌های جامعه را فهرست می‌کند. برای قرار گرفتن در فهرست، مخزن شما باید شامل موارد زیر باشد:

- ✅ یک `README.md` واضح با پیش‌نیازها، نمودار معماری و نکات هزینه
- ✅ یک `azure.yaml` کارا با `metadata.template`
- ✅ زیرساختی که در یک اشتراک تازه به خوبی راه‌اندازی می‌شود
- ✅ یک فایل `LICENSE`
- ✅ (توصیه شده) یک `.devcontainer/` برای Codespaces با یک کلیک

با باز کردن یک درخواست کشش که قالب شما را به فایل داده گالری اضافه می‌کند، مطابق راهنمای مشارکت در [مخزن Awesome AZD](https://github.com/Azure/awesome-azd) ارسال کنید.

---

## خطاهای رایج

| خطا | رفع |
|---------|-----|
| نام‌های هاردکد شده منابع | استفاده از توکن منبع `uniqueString()` |
| باقی ماندن منابع با `azd down` | هر منبع (یا گروه منابع) را با `azd-env-name` برچسب‌گذاری کنید |
| قالب برای شما کار می‌کند، برای دیگران نه | شناسه‌های اشتراک، شناسه‌های مستاجر و فرضیات منطقه‌ای را حذف کنید |
| خروجی‌ها به اپ متصل نیستند | خروجی‌های `SERVICE_<NAME>_ENDPOINT_URL` و دیگر خروجی‌های `AZURE_*` را صادر کنید |
| ارسال به گالری رد شده است | اضافه کردن `README.md`، `LICENSE` و `metadata.template` |

---

## خلاصه

- یک قالب فقط یک مخزن Git با `azure.yaml`، `infra/` و کد شما است.
- همه چیز را پارامتردهی کنید—نام‌ها، مناطق و شناسه‌ها—تا در هر جایی اجرا شود.
- همیشه منابع را با `azd-env-name` برچسب‌گذاری کنید تا `azd down` کار کند.
- قبل از انتشار، با `azd init --template <local-path>` به صورت محلی تست کنید.
- برای ارسال به Awesome AZD فراداده و README اضافه کنید.

---

## 🔗 ناوبری

| جهت | منابع |
|-----------|----------|
| **قبلی** | [راهنمای استقرار](deployment-guide.md) |
| **صفحه اصلی فصل** | [فصل ۴: زیرساخت به عنوان کد](README.md) |
| **فصل بعدی** | [فصل ۵: راه‌حل‌های چندعامل](../chapter-05-multi-agent/README.md) |

## 📖 منابع مرتبط

- [تامین منابع](provisioning.md)
- [گالری Awesome AZD](https://azure.github.io/awesome-azd/)
- [مستندات رسمی قالب azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->