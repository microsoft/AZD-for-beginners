# ساخت قالب azd خودتان

**هدایت فصل:**
- **📚 صفحه اصلی دوره**: [مقدماتی‌های AZD](../../README.md)
- **📖 فصل فعلی**: فصل ۴ - زیرساخت به عنوان کد و استقرار
- **⬅️ قبلی**: [راهنمای استقرار](deployment-guide.md)
- **🚀 فصل بعدی**: [فصل ۵: راه‌حل‌های چندعاملی](../chapter-05-multi-agent/README.md)

> بررسی شده طبق `azd 1.37.2` (نوامبر ۲۰۲۶). این یک **راهنمای نوشتن با فایل‌های ناقص** است، نه یک قالب کامل: باید کد برنامه و `modules/web.bicep` به همراه محیط، رجیستری، برنامه کانتینری و خروجی‌های آن را قبل از استقرار تامین کنید. پروویژنینگ Azure در این بازبینی اجرا نشده است.

## مقدمه

تا کنون شما *مصرف‌ کننده*ٔ الگوها با `azd init --template <name>` بوده‌اید. اما زمانی که یک ساختار پروژه داشته باشید که تیم شما دوست دارد—مثلاً یک برنامه Container با یک Cosmos DB و نظارت مناسب—خواهید خواست آن را به یک الگوی قابل استفاده‌ی مجدد خودتان تبدیل کنید. یک الگو صرفاً یک مخزن Git با ساختاری قابل پیش‌بینی است که azd می‌داند چگونه بخواند. این درس نشان می‌دهد چگونه یکی را از ابتدا بسازید، آزمایش کنید و (اختیاری) آن را در گالری جامعه منتشر کنید.

## اهداف یادگیری

در پایان این درس، شما خواهید توانست:
- بفهمید چه چیزی یک پوشه را به یک «قالب azd» تبدیل می‌کند
- با فایل‌ها و چیدمان مورد نیاز پوشه آشنا شوید
- یک `azure.yaml` و `infra/` اضافه کنید که دیگران بتوانند دوباره استفاده کنند
- قالب خود را به صورت محلی قبل از به اشتراک‌گذاری آزمایش کنید
- آن را منتشر کنید و (اختیاری) به Awesome AZD ارسال کنید

## نتایج یادگیری

پس از اتمام این درس، قادر خواهید بود:
- ایجاد چارچوب اولیه یک مخزن قالب جدید
- پارامترسازی زیرساخت به‌گونه‌ای که در هر اشتراکی کار کند
- اعتبارسنجی یک قالب با `azd init` و `azd up`
- افزودن فراداده‌های مورد نیاز گالری جامعه

---

## قالب واقعا چیست؟

یک قالب azd **یک مخزن گیت** است که حداقل شامل موارد زیر است:

| فایل / پوشه | هدف | ضروری؟ |
|---------------|---------|-----------|
| `azure.yaml` | توضیح‌دهنده خدمات، میزبان‌ها و تامین‌کننده زیرساخت | ✅ بله |
| `infra/` | تعاریف فراهم‌سازی Bicep یا Terraform | برای این مثال صریح-IaC مورد نیاز است؛ پروژه‌های زیرساخت تولید شده می‌توانند آن را حذف کنند |
| `src/` (یا کد شما) | کد برنامه‌ای که azd مستقر می‌کند | مورد نیاز برای خدمات مبتنی بر منبع؛ همه قالب‌ها شامل کد برنامه نیستند |
| `README.md` | نحوه استفاده از قالب | ✅ توصیه قوی |
| `.azdo/` یا `.github/` | تعریف‌های خط لوله CI/CD | اختیاری |
| `.devcontainer/` | محیط توسعه قابل بازتولید | اختیاری |
| `azure.yaml` `metadata` | اطلاعات هویت/تلومتری قالب | توصیه شده؛ انتشار مخزن Git نیاز به آن ندارد |

در اینجا هیچ چیز جادویی نیست: وقتی `azd init --template you/your-repo` را اجرا می‌کنید، azd مخزن را کلون می‌کند و `azure.yaml` را می‌خواند.

---

## گام ۱: ساختاردهی مخزن

ساختار پوشه را به صورت دستی ایجاد کنید یا از یک قالب حداقلی شروع کنید و آن را ویرایش کنید:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

یک چیدمان معمولی نهایی شبیه این است:

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

این قلب قالب است. به azd می‌گوید چه چیزی را مستقر کند و چگونه:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # built-in alternative: terraform
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> فیلد `metadata.template` همان است که تلومتری گالری برای شمارش استفاده می‌کند. از قرارداد `name@version` استفاده کنید.

---

## گام ۳: پارامتربندی زیرساخت

مهم‌ترین قانون برای یک قالب *قابل استفاده مجدد*: **هرگز نام‌ها، مناطق، یا مقادیر خاص اشتراک را به صورت کدگذاری سخت قرار ندهید.** از پارامترها و الگوی توکن منابع استفاده کنید تا همان قالب در اشتراک هر کسی کار کند.

```bicep
// infra/main.bicep
targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module web 'modules/web.bicep' = {
  name: 'web'
  scope: rg
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

دو چیز این قالب را مناسب می‌کند:

1. **برچسب `azd-env-name`** — azd از آن برای دنبال کردن و پاکسازی منابع در هر محیط استفاده می‌کند.
2. **توکن منابع `uniqueString(...)`** — پسوند هش پایدار تولید می‌کند تا برخوردها کاهش یابند؛ این تضمینی برای یکتایی جهانی نیست.

`modules/web.bicep` مفقود باید `name`، `location`، و `tags` را قبول کند، محیط/ثبت برنامه‌های کانتینری و برنامه را فراهم آورد، برنامه را با `azd-service-name: web` برچسب‌گذاری کند و `uri` را صادر نماید. همچنین باید مقادیر ثبت مورد نیاز جریان ساخت/استقرار انتخابی (مثلاً `AZURE_CONTAINER_REGISTRY_ENDPOINT` از ماژول ریشه) را آشکار سازد. خروجی یک نقطه پایانی به تنهایی سرویس کشف، تنظیمات برنامه یا احراز هویت ثبت را متصل نمی‌کند.

یک فایل پارامتر همسان ارائه دهید که مقادیری را که azd از محیط تزریق می‌کند، بخواند:

موارد زیر را به عنوان `infra/main.parameters.json` ذخیره کنید:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd به طور خودکار `${AZURE_ENV_NAME}` و `${AZURE_LOCATION}` را از محیط فعلی جایگزین می‌کند.

---

## گام ۴: قالب خود را به صورت محلی تست کنید

قبل از به اشتراک‌گذاری، اثبات کنید قالب از حالت پاک کار می‌کند.

**از پوشه محلی تست کنید** (نیازی به پوش گیت نیست):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**سپس پاکسازی را تست کنید**—یک قالب خوب به طور کامل پاک می‌کند:

```bash
azd down --force --purge
```

اگر `azd down` منابع را باقی گذاشت، کشف محیط/گروه منابع، منابع خارجی/مشترک، مجوزها، قفل‌ها و محافظت از حذف را بررسی کنید. `--purge` حالت محلی `.azure/` را پاک نمی‌کند.

> **نکته:** پس از تامین همه فایل‌های مفقود، ابتدا `azd provision --preview` را اجرا کنید. قلاب‌ها را قبل از پیش‌نمایش بررسی کنید زیرا ممکن است دستورات جانبی اجرا کنند. پیش‌نمایش تخمین قیمت یا تضمین موفقیت فراهم‌آوری نیست.

---

## گام ۵: قالب را منتشر کنید

مخزن را به گیت‌هاب فشار دهید (عمومی اگر می‌خواهید دیگران استفاده کنند):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

حالا هر کسی می‌تواند از آن استفاده کند:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## گام ۶ (اختیاری): در Awesome AZD ثبت کنید

گالری [Awesome AZD](https://azure.github.io/awesome-azd/) قالب‌های جامعه را فهرست می‌کند. برای ثبت شدن، مخزن شما باید شامل موارد زیر باشد:

- ✅ یک `README.md` واضح با پیش‌نیازها، نمودار معماری و یادداشت‌های هزینه
- ✅ یک `azure.yaml` کاری با `metadata.template`
- ✅ زیرساختی که به طور تمیز در اشتراک تازه فراهم شود
- ✅ یک فایل `LICENSE`
- ✅ (توصیه شده) یک `.devcontainer/` برای Codespaces با یک کلیک

با باز کردن یک درخواست کشش که قالب شما را به فایل داده‌های گالری اضافه می‌کند و راهنمای مشارکت در [مخزن Awesome AZD](https://github.com/Azure/awesome-azd) را دنبال می‌کند، آن را ثبت کنید.

---

## خطاهای رایج

| خطا | رفع |
|---------|-----|
| نام‌های منابع سخت‌کد شده | از توکن منابع `uniqueString()` استفاده کنید |
| `azd down` منابع باقی می‌گذارد | هر منبع (یا گروه منابع) را با `azd-env-name` برچسب‌گذاری کنید |
| قالب برای شما کار می‌کند، برای دیگران نه | شناسه اشتراک، شناسه مستاجر و فرضیات منطقه‌ای را حذف کنید |
| خروجی‌هایی که در برنامه سیم‌کشی نشده‌اند | تطابق `azd-service-name`/`resourceName` برای استقرار و به‌صراحت نگاشت خروجی‌ها به تنظیمات برنامه |
| ارسال گالری رد شد | افزودن `README.md`، `LICENSE`، و `metadata.template` |

---

## خلاصه

- یک قالب فقط یک مخزن گیت با `azure.yaml`، `infra/`، و کد شما است.
- همه چیز را پارامتردهی کنید—نام‌ها، مناطق، و شناسه‌ها—تا در هر جایی اجرا شود.
- همیشه منابع را با `azd-env-name` برچسب‌گذاری کنید تا `azd down` کار کند.
- قبل از انتشار، به صورت محلی با `azd init --template <local-path>` تست کنید.
- افزودن فراداده و یک README برای ارسال به Awesome AZD.

---

## 🔗 ناوبری

| جهت | منبع |
|-----------|----------|
| **قبلی** | [راهنمای استقرار](deployment-guide.md) |
| **خانه فصل** | [فصل ۴: زیرساخت به عنوان کد](README.md) |
| **فصل بعدی** | [فصل ۵: راه‌حل‌های چندعاملی](../chapter-05-multi-agent/README.md) |

## 📖 منابع مرتبط

- [تامین منابع](provisioning.md)
- [گالری Awesome AZD](https://azure.github.io/awesome-azd/)
- [مستندات رسمی قالب azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->