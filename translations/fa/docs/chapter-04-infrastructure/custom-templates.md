# نوشتن قالب azd خودتان

**ناوبری فصل:**
- **📚 صفحه دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۴ - زیرساخت به‌عنوان کد و استقرار
- **⬅️ قبلی**: [راهنمای استقرار](deployment-guide.md)
- **🚀 فصل بعدی**: [فصل ۵: راه‌حل‌های چندعاملی](../chapter-05-multi-agent/README.md)

> تأیید شده با `azd 1.25.6` در ژوئن ۲۰۲۶.

## مقدمه

تا کنون شما قالب‌ها را با `azd init --template <name>` *مصرف* کرده‌اید. اما وقتی چیدمان پروژه‌ای دارید که تیم‌تان می‌پسندد—مثلاً یک Container App با یک Cosmos DB و مانیتورینگ مناسب—می‌خواهید آن را به یک قالب قابل استفاده مجدد تبدیل کنید. یک قالب در واقع یک مخزن Git است با ساختاری قابل پیش‌بینی که azd می‌داند چگونه آن را بخواند. این درس نشان می‌دهد چگونه یکی را از صفر بسازید، تست کنید و (اختیاری) آن را در گالری جامعه منتشر کنید.

## اهداف یادگیری

تا پایان این درس، شما خواهید:
- درک کنید چه چیزی یک پوشه را «قالب azd» می‌کند
- با فایل‌ها و چیدمان پوشه‌های موردنیاز آشنا باشید
- افزودن `azure.yaml` و `infra/` که دیگران بتوانند مجدداً استفاده کنند
- قالب خود را پیش از اشتراک‌گذاری به‌صورت محلی تست کنید
- آن را منتشر کنید و (اختیاری) در Awesome AZD ثبت کنید

## نتایج یادگیری

پس از تکمیل این درس، شما قادر خواهید بود:
- ایجاد ساختار اولیه مخزن قالب جدید
- پارامتردهی زیرساخت به‌طوری‌که در هر اشتراکی کار کند
- اعتبارسنجی قالب با `azd init` و `azd up`
- افزودن فراداده‌ای که گالری جامعه لازم دارد

---

## قالب واقعاً چیست؟

قالب azd **یک مخزن Git** است که حداقل شامل موارد زیر است:

| فایل / پوشه | هدف | ضروری؟ |
|---------------|---------|-----------|
| `azure.yaml` | توضیح‌دهنده سرویس‌ها، میزبان‌ها و ارائه‌دهنده زیرساخت | ✅ بله |
| `infra/` | Bicep، Terraform، یا Pulumi که منابع را فراهم می‌کند | ✅ بله |
| `src/` (یا کد شما) | کد برنامه‌ای که azd مستقر می‌کند | ✅ بله |
| `README.md` | نحوه استفاده از قالب | ✅ قویاً توصیه‌شده |
| `.azdo/` یا `.github/` | تعاریف خط لوله CI/CD | اختیاری |
| `.devcontainer/` | محیط توسعه قابل بازتولید | اختیاری |
| `azure.yaml` `metadata` | اطلاعات گالری + تله‌متری | اختیاری (برای انتشار لازم است) |

اینجا چیز جادویی وجود ندارد: وقتی `azd init --template you/your-repo` را اجرا می‌کنید، azd مخزن را کلون کرده و `azure.yaml` را می‌خواند.

---

## گام ۱: ایجاد ساختار مخزن

ساختار پوشه را دستی ایجاد کنید یا از یک قالب حداقلی شروع کرده و آن را ویرایش کنید:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# طرح‌بندی استاندارد را ایجاد کنید
mkdir -p src infra
```

یک چیدمان نهایی معمولی به این شکل است:

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

## گام ۲: نوشتن `azure.yaml`

این قلب قالب است. به azd می‌گوید چه چیزی را استقرار دهد و چگونه:

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

> فیلد `metadata.template` همان چیزی است که تله‌متری گالری برای شمارش استفاده می‌کند. از قرارداد `name@version` استفاده کنید.

---

## گام ۳: پارامتردهی زیرساخت

مهم‌ترین قانون برای یک قالب *قابل استفاده مجدد*: **هرگز نام‌ها، مناطق یا مقادیر خاص اشتراک را به‌صورت سخت‌کد نکنید.** از پارامترها و الگوی توکن منبع استفاده کنید تا همان قالب در اشتراک هر کسی کار کند.

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

دو مورد این قالب را مناسب برای به‌اشتراک‌گذاری می‌کنند:

1. **برچسب `azd-env-name`** — azd از آن برای ردیابی و پاک‌سازی منابع به ازای هر محیط استفاده می‌کند.
2. **توکن منبع `uniqueString(...)`** — یک پسوند پایدار و یکتا در سطح جهانی تولید می‌کند تا نام‌ها با هم تداخل نداشته باشند.

فایل پارامتر منطبق را فراهم کنید که مقادیری را که azd از محیط تزریق می‌کند می‌خواند:

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

azd به‌طور خودکار `${AZURE_ENV_NAME}` و `${AZURE_LOCATION}` را از محیط جاری جایگزین می‌کند.

---

## گام ۴: قالب خود را به‌صورت محلی تست کنید

قبل از به‌اشتراک‌گذاری، ثابت کنید که قالب از یک وضعیت پاک کار می‌کند.

**تست از پوشه محلی** (نیازی به پوش کردن Git نیست):

```bash
# از یک دایرکتوری خالی، با استفاده از مسیر قالب محلی خود مقداردهی اولیه کنید
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# فراهم‌آوری و استقرار از ابتدا تا انتها
azd auth login
azd up
```

**سپس پاک‌سازی را تست کنید**—یک قالب خوب کاملاً پاک‌سازی می‌کند:

```bash
azd down --force --purge
```

اگر `azd down` منابعی را باقی می‌گذارد، احتمالاً برچسب `azd-env-name` را روی یک منبع جا گذاشته‌اید.

> **نکته:** ابتدا `azd provision --preview` را اجرا کنید. این دستور یک چه-اگر اجرا می‌کند و خطاهای قالب را قبل از ایجاد هر منبع نشان می‌دهد.

---

## گام ۵: انتشار قالب

مخزن را به GitHub پوش کنید (عمومی اگر می‌خواهید دیگران از آن استفاده کنند):

```bash
gh repo create my-azd-template --public --source=. --push
```

هر کسی اکنون می‌تواند از آن استفاده کند:

```bash
azd init --template your-github-username/my-azd-template
```

---

## گام ۶ (اختیاری): ارسال به Awesome AZD

گالری [Awesome AZD](https://azure.github.io/awesome-azd/) قالب‌های جامعه را فهرست می‌کند. برای قرار گرفتن در فهرست مخزن شما باید شامل موارد زیر باشد:

- ✅ یک `README.md` واضح با پیش‌نیازها، نمودار معماری، و نکات هزینه‌ای
- ✅ یک `azure.yaml` عملیاتی با `metadata.template`
- ✅ زیرساختی که در یک اشتراک جدید به‌خوبی ایجاد شود
- ✅ یک فایل `LICENSE`
- ✅ (توصیه‌شده) یک `.devcontainer/` برای Codespaces با یک کلیک

ارسال را با باز کردن یک pull request انجام دهید که قالب شما را به فایل داده‌های گالری اضافه می‌کند، و از راهنمای مشارکت در [مخزن Awesome AZD](https://github.com/Azure/awesome-azd) پیروی کنید.

---

## اشتباهات رایج

| مشکل | راه‌حل |
|---------|-----|
| نام‌های منابع سخت‌کد‌شده | از توکن منبع `uniqueString()` استفاده کنید |
| `azd down` منابع را باقی می‌گذارد | همه منابع (یا گروه منابع) را با `azd-env-name` برچسب‌گذاری کنید |
| قالب برای شما کار می‌کند، برای دیگران شکست می‌خورد | شناسه‌های اشتراک، شناسه‌های مستأجر و فروض مربوط به منطقه را حذف کنید |
| خروجی‌ها به برنامه متصل نیستند | خروجی‌های `SERVICE_<NAME>_ENDPOINT_URL` و سایر خروجی‌های `AZURE_*` را صادر کنید |
| ارسال به گالری رد شد | افزودن `README.md`، `LICENSE` و `metadata.template` |

---

## خلاصه

- قالب فقط یک مخزن Git با `azure.yaml`، `infra/` و کد شما است.
- همه چیز را پارامتردهی کنید — نام‌ها، مناطق و شناسه‌ها — تا در هر جا اجرا شود.
- همیشه منابع را با `azd-env-name` برچسب‌گذاری کنید تا `azd down` کار کند.
- قبل از انتشار به‌صورت محلی با `azd init --template <local-path>` تست کنید.
- فراداده و یک README اضافه کنید تا برای Awesome AZD ارسال شود.

---

## 🔗 ناوبری

| جهت | منبع |
|-----------|----------|
| **قبلی** | [راهنمای استقرار](deployment-guide.md) |
| **صفحه فصل** | [فصل ۴: زیرساخت به‌عنوان کد](README.md) |
| **فصل بعد** | [فصل ۵: راه‌حل‌های چندعاملی](../chapter-05-multi-agent/README.md) |

## 📖 منابع مرتبط

- [استقرار منابع](provisioning.md)
- [گالری Awesome AZD](https://azure.github.io/awesome-azd/)
- [مستندات رسمی قالب azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->