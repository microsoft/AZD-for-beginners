# همگام‌سازی Microsoft Foundry با AZD

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۲ - توسعه اول هوش مصنوعی
- **⬅️ فصل قبل**: [فصل ۱: اولین پروژه شما](../chapter-01-foundation/first-project.md)
- **➡️ بعدی**: [عامل‌های هوش مصنوعی](agents.md)
- **🚀 فصل بعد**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

## نمای کلی

این راهنما نحوه ادغام خدمات Microsoft Foundry با Azure Developer CLI (AZD) را برای استقرارهای ساده‌تر برنامه‌های هوش مصنوعی نشان می‌دهد. Microsoft Foundry بستری جامع برای ساخت، استقرار، و مدیریت برنامه‌های هوش مصنوعی فراهم می‌کند، در حالی که AZD فرآیند زیرساخت و استقرار را ساده می‌کند.

## Microsoft Foundry چیست؟

Microsoft Foundry پلتفرم همگرا و یکپارچه مایکروسافت برای توسعه هوش مصنوعی است که شامل موارد زیر است:

- **کتابخانه مدل‌ها**: دسترسی به مدل‌های پیشرفته هوش مصنوعی
- **Prompt Flow**: طراح بصری جریان‌های کاری هوش مصنوعی
- **پرتال Microsoft Foundry**: محیط توسعه یکپارچه برای برنامه‌های هوش مصنوعی
- **گزینه‌های استقرار**: گزینه‌های میزبانی و مقیاس‌بندی متعدد
- **امنیت و ایمنی**: ویژگی‌های مسئولانه هوش مصنوعی تعبیه شده

## AZD + Microsoft Foundry: بهتر با هم

| ویژگی | Microsoft Foundry | مزیت ادغام با AZD |
|---------|-----------------|------------------------|
| **استقرار مدل** | استقرار دستی از طریق پرتال | استقرارهای خودکار و تکرارشونده |
| **زیرساخت** | پیکربندی پروژه و منابع | شروع از `azure.yaml`؛ خروجی بایسک یا Terraform در صورت نیاز |
| **مدیریت محیط** | تمرکز روی یک محیط | چند محیط (توسعه/آزمایش/تولید) |
| **ادغام CI/CD** | خدمات استقرار و ارزیابی | استفاده مجدد از پیکربندی در GitHub Actions یا Azure DevOps |
| **مدیریت هزینه** | نظارت پایه | بهینه‌سازی هزینه متناسب با هر محیط |

## پیش‌نیازها

- اشتراک Azure با مجوزهای مناسب
- Azure Developer CLI نسخه ۱.۳۷.۰ یا بالاتر برای جریان کاری Foundry GA
- دسترسی به خدمات مدل‌های Microsoft Foundry
- آشنایی ابتدایی با Microsoft Foundry

> **به‌روزرسانی Foundry GA (۲۰۲۶-۱۱-۰۹):** مجموعه افزونه `microsoft.foundry` به نسخه ۱.۰ و دسترس‌پذیری عمومی در [۵ نوامبر ۲۰۲۶](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/) رسید. راهنمای زیر پس از این اعلان و شروع سریع Microsoft Learn دنبال می‌شود. این یک مرور مستندات است، نه اعتبارسنجی استقرار زنده. ویژگی‌های پیش‌نمایش اختیاری و افزونه‌های مستقل وضعیت انتشار خود را حفظ می‌کنند.

**نتایج یادگیری:** نصب مجموعه GA، بازبینی `azure.yaml` یک عامل، مقایسه پاسخ‌های محلی و مستقر شده، و توضیح ارزیابی، CI/CD، و مرزهای پاکسازی. برای استقرار مرحله به مرحله عامل، به [راهنمای عامل میزبانی شده](#hosted-agent-walkthrough-ga) مراجعه کنید. قطعات منابع زیر الگوهای یکپارچه‌سازی دیگر را پوشش می‌دهند.

## الگوهای اصلی ادغام

**دامنه مثال‌ها:** کد بایسک زیر قطعات منبع نمونه را نشان می‌دهد، نه قالب کامل قابل استقرار. قالب مادر باید نام‌ها، `location`، منابع مرجع، هویت‌ها، خروجی‌ها، و میزبانی برنامه را تعریف کند. برای نقطه شروع قابل اجرا از نمونه لینک شده استفاده کنید. نمونه‌های Bash نیاز به احراز هویت Azure CLI جدا از `azd auth login` دارند.

### الگو ۱: ادغام مدل‌های Microsoft Foundry

**موارد استفاده**: استقرار برنامه‌های چت با مدل‌های Azure OpenAI در Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

**زیرساخت (main.bicep):**
```bicep
// Microsoft Foundry Models Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: true
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

تماس‌گیرنده باید هویت مدیریت شده متصل شده و `Cognitive Services OpenAI User` در سطح حساب داشته باشد؛ غیرفعال کردن کلیدها دسترسی نمی‌دهد. پیش از استقرار، دسترسی منطقه/مدل/SKU و سهمیه را بررسی کنید.

### الگو ۲: ادغام جستجو AI + RAG

**موارد استفاده**: استقرار برنامه‌های تولید افزوده بازیابی‌شده (RAG)

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

```

برای این ادغام منبع ARM `Microsoft.Search/searchServices/dataConnections` وجود ندارد. یک شاخص جستجو، منبع داده، ایندکسر/مجموعه مهارت‌ها یا بردارکننده را از طریق APIهای صفحه داده جستجو پشتیبانی‌شده پیکربندی کنید. اگر جستجو یک مدل جاسازی شده را فراخوانی می‌کند، هویت مدیریت شده را فعال کنید، نقش مدل مربوطه را اختصاص دهید، و مهارت جاسازی یا بردارساز آن را پیکربندی کنید. ببینید [بردارسازی یکپارچه شده](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### الگو ۳: ادغام هوش اسناد

**موارد استفاده**: جریان‌های کاری پردازش و تحلیل اسناد

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 الگوهای پیکربندی

### راه‌اندازی متغیرهای محیطی

به جز تنظیمات مستند شده AZD مانند `AZURE_LOCATION`، این‌ها **نام‌های ورودی قالب سفارشی** هستند. هیچ اثری نخواهند داشت مگر اینکه قالب/برنامه آن‌ها را از طریق نگاشت پارامتر و محیط میزبان مصرف کند. برای `azure-search-openai-demo`، از نام‌های واقعی مانند `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` و `AZURE_SEARCH_SERVICE_SKU` استفاده کنید. ظرفیت مدل SKU حساب نیست.

**پیکربندی تولید:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**پیکربندی توسعه:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### پیکربندی امن با Key Vault

ترجیحاً از Entra ID با احراز هویت محلی کلید غیرفعال شده استفاده کنید. مورد زیر فقط یک **جایگزین قدیمی احراز هویت کلید** برای برنامه‌هایی که کلید می‌خواهند است: نیازمند حساب با احراز هویت کلید فعال، هویت برنامه متصل به میزبانش، و دسترسی/شبکه Key Vault عملیاتی است. کلید را با `disableLocalAuth: true` ترکیب نکنید و انتظار نداشته باشید فراخوانی‌های مبتنی بر کلید کار کنند.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## جریان‌های کاری استقرار

### افزونه‌های AZD برای Foundry

برای جریان کاری GA، به جای تجمیع تدریجی افزونه‌های اصلی، مجموعه `microsoft.foundry` را نصب کنید:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

این مجموعه عوامل، اتصالات، بازرس، پروژه‌ها، روال‌ها، مهارت‌ها و جعبه ابزارها را نصب می‌کند. گروه دستورات `microsoft.foundry` اضافه نمی‌کند. ارزیابی‌ها، مجموعه داده‌ها، تنظیم دقیق و مدل‌های سفارشی هنگام نیاز جداگانه نصب می‌شوند. به [مرجع بسته‌بندی افزونه](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions) مراجعه کنید.

### راهنمای عامل میزبانی شده (GA)

یک **عامل میزبانی شده** کد عامل شما را روی محاسبات مدیریت شده توسط Foundry اجرا می‌کند. این تمرین از نمونه API پاسخ‌های چارچوب Python Agent Upstream Basic استفاده می‌کند، نه قطعات SDK سرویس عامل کلاسیک در درس‌های دیگر.

#### ۱. آماده‌سازی و مقداردهی اولیه

از یک دایرکتوری خالی خارج از نسخه دوره استفاده کنید. پایتون نسخه 3.13 یا بالاتر و یک نسخه فعلی [uv release](https://docs.astral.sh/uv/getting-started/installation/) را نصب کنید. نصب‌های مستقل uv می‌توانند از `uv self update` استفاده کنند. قبل از فراهم‌سازی، [دسترسی‌های عامل میزبانی](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions)، در دسترس بودن مدل و سهمیه‌ها در اشتراک و منطقه خود را بررسی کنید. منابع Azure و تماس‌های مدل محلی شامل هزینه می‌شوند.

نصب `azd auth login` و بسته بالا را کامل کنید. کد نمونه محلی از `DefaultAzureCredential` استفاده می‌کند؛ اگر از اعتبارنامه Azure CLI استفاده می‌کنید، با `az login` وارد شوید و از همان حساب و tenant ای استفاده کنید که AZD دارد. ورود به AZD به تنهایی ورود به Azure CLI نیست.

این فرمان تک خطی را در Bash یا PowerShell اجرا کنید:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

یک پروژه Foundry جدید یا موجود و اشتراک و منطقه مورد نظر را انتخاب کنید. برای استفاده مجدد از یک استقرار مدل، `--model-deployment <existing-deployment-name>` را **قبل از اجرای دستور** به دستور راه‌اندازی اضافه کنید و پروژه موجود را انتخاب کنید. برای دستورات بعدی، در دایرکتوری حاوی `azure.yaml` ایجاد شده بمانید.

#### 2. بازبینی تعریف استقرار

فایل `azure.yaml` را باز کنید و این تنظیمات را در [نمونه بالادستی](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml) پیدا کنید:

| تنظیمات | چه چیزی باید بررسی شود |
|---------|---------------|
| `host: azure.ai.project` و `deployments` | پروژه موردنظر Foundry و نام مدل، نسخه، SKU استقرار و ظرفیت |
| `host: azure.ai.agent` و `project` | عامل میزبانی شده و دایرکتوری حاوی منبع آن |
| `codeConfiguration` | زمان اجرای پایتون و نقطه ورود؛ نمونه بررسی‌شده از `python_3_13` و `main.py` استفاده می‌کند |
| `uses` | وابستگی به سرویس پروژه Foundry |
| `container.resources` | تخصیص CPU و حافظه، حتی اگر کد به‌صورت ریموت ساخته شود |
| `env` | نگاشت استقرار مدل و `PYTHONNOUSERSITE: "1"` برای غیرفعال‌کردن بارگذاری بسته‌های سایت کاربر |
| `infra.provider` | `microsoft.foundry`، که زیرساخت موردنیاز را سنتز می‌کند |

کد `azure.yaml` و عامل مرور شده را به همراه هم ارسال کنید. برای شروع نیازی به زیرساخت دستی نیست؛ هنگامی که به فایل‌های تأمین‌پذیر قابل ویرایش نیاز دارید، برای Bicep یا Terraform، از [خروج زیرساخت](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) پیروی کرده و از `azd provision` استفاده را ادامه دهید. اعتبارنامه‌ها یا وضعیت محیط `.azure/` را ارسال نکنید.

#### ۳. تأمین و تست به صورت محلی

```bash
azd provision
azd ai agent run
```

فرایند تأمین می‌تواند استقرارهای مدل مفقود شده را **حتی در پروژه‌های بازاستفاده شده** ایجاد کند. درخواست‌های مدل را بررسی کرده و یک نوع استقرار آنلاین در دسترس مانند Global Standard یا Data Zone Standard را انتخاب کنید؛ سهمیه و پشتیبانی منطقه‌ای متفاوت است.

اجرای محلی وابستگی‌ها را آماده کرده و **Agent Inspector** را باز می‌کند، جایی که می‌توانید درخواست‌ها، پاسخ‌ها و فعالیت ابزار/مدل را بررسی کنید. آن را اجرا نگه دارید و یک ترمینال دوم در همان دایرکتوری پروژه باز کنید:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**نقطه بازبینی:** اطمینان حاصل کنید که پاسخ مرتبط دریافت می‌کنید و می‌توانید فعالیت محلی مرتبط را بررسی کنید. اجرای محلی همچنان استقرار مدل Azure شما را فراخوانی می‌کند؛ این یک تست آفلاین یا رایگان نیست. از درخواست‌های مصنوعی استفاده کرده و از نمایش اسرار یا داده‌های حساس در خروجی inspector خودداری کنید.

#### ۴. استقرار و مقایسه

پس از اتمام، اجرای محلی را با Ctrl+C متوقف کنید. قبل از فراخوانی از راه دور، اتصال و دسترسی به خواندن ردپای [Application Insights پروژه را تنظیم یا بررسی کنید](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing).

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

در حالت استقرار کد، AZD کد منبع را برای ساخت راه دور Foundry آپلود می‌کند؛ نیازی به ساخت کانتینر محلی برای این مسیر نیست. خروجی استقرار لینک‌های playground و endpoint را فراهم می‌کند. پاسخ از عامل مستقر شده و ردپای ابر آن را تأیید کنید؛ فقط رویدادهای inspector محلی اثبات کارکرد ردپای ابر نیستند.

برای تغییرات بعدی، پیکربندی عامل میزبان پشتیبانی شده را با `azd deploy --preview` بررسی کنید. لاگ‌ها را با `azd ai agent monitor --follow` پخش کنید، یا مشکلات تنظیم و دسترسی را با `azd ai agent doctor` عیب‌یابی کنید. پیش‌نمایش استقرار مرور کامل زیرساخت یا امنیت نیست.

#### ۵. افزودن چک کیفیت تکرارپذیر

افزونه ارزیابی‌های منتشر شده به صورت مستقل را نصب کنید، سپس دارایی‌های تست پیش‌نویس را تولید کنید:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

رفتار مورد نظر عامل را توصیف کرده و **Dataset and evaluator** را انتخاب کرده، سپس **Turn** را بزنید. موارد ایجاد شده و قالب نمره‌دهی، شامل مورد سؤال پشتیبانی نشده را قبل از پیکربندی ارزیابی بررسی و ویرایش کنید:

```bash
azd ai eval init --name quality
```

مجموعه داده و قالب بازبینی شده را انتخاب کرده و استقرار مدل داور را تأیید کنید. `evals/azure.eval.yaml` و مرجع سرویس ارزیابی آن در `azure.yaml` را بررسی کنید، سپس دارایی‌ها را ثبت و اجرا کنید:

```bash
azd up
azd ai eval run start --eval quality
```

نمرات و موارد شکست‌خورده یا دارای خطا را بررسی کنید؛ ارزیابی کامل‌شده به‌طور خودکار تایید کیفیت نیست. تولید و نمره‌دهی نیز هزینه مدل دارد. پیکربندی غیرمحرمانه، مجموعه داده‌ها و قالب‌ها را ارسال کنید تا هم‌تیمی‌ها بتوانند تغییرات را مقایسه کنند. `azd ai agent optimize` می‌تواند یک ارزیابی سازگار را به عنوان مبنا استفاده کند، اما نامزدها را قبل از استقرار صریح مرور کنید. برای پروژه‌ها و CI قدیمی‌تر، به [گیت‌های کیفیت و مهاجرت](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) مراجعه کنید.

#### ۶. استفاده مجدد از جریان کاری در CI/CD

پس از موفقیت `azd up`، `azd pipeline config` را اجرا کرده و جریان کاری تولید شده GitHub Actions یا Azure DevOps را بررسی کنید. `microsoft.foundry` را روی رانر نصب کنید، به‌علاوه `azure.ai.evaluations` در صورت اجرای ارزیابی‌ها. تنظیمات بررسی، ورود و محیط تولید شده را نگه دارید؛ نصب به تنهایی pipeline را احراز هویت نمی‌کند.

برای هر مرحله یک محیط AZD جداگانه استفاده کنید، به هویت pipeline مجوزهای منابع و Foundry لازم را اعطا کنید، و اعتبارنامه‌ها را در اسرار pipeline نگه دارید یا از هویت فدرال استفاده کنید. دارایی‌های ارزیابی را ارسال کرده و اطمینان حاصل کنید که هویت می‌تواند به مجموعه داده‌ها/ارزیاب‌های ارجاع شده دسترسی داشته باشد. به [نمونه pipeline دوره](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) و [راهنمای Foundry CI/CD](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli) مراجعه کنید.

#### ۷. پاک‌سازی هدفمند

برای **پروژه جدید ایجاد شده توسط این محیط**، منابع لیست شده توسط `azd down` را قبل از تأیید مرور کنید: این دستور گروه منابع و همه چیز درون آن را حذف می‌کند.

برای **پروژه بازاستفاده شده**، `azd down` پروژه، عامل میزبان و سایر منابع را در جای خود باقی می‌گذارد. فقط منابع ناخواسته متعلق به خودتان را با استفاده از [راهنمای پاک‌سازی سریع](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources) حذف کنید؛ برای پاک‌سازی یک تمرین، گروه منابع مشترک را حذف نکنید.

**بررسی تکمیل:** توضیح دهید که کدام تنظیمات رفتار محلی و ابری را کنترل می‌کنند، پاسخ‌های محلی و مستقر شده را نشان دهید، نتیجه ارزیابی را مرور کنید و مشخص کنید پس از پاک‌سازی کدام منابع باقی می‌مانند.

### اختیاری: ساختاردهی با مهارت Microsoft Foundry

برنامه [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) را برای میزبان عامل کدنویسی خود نصب کنید، سپس یک پوشه خالی جداگانه باز کنید. از آن بخواهید نمونه‌ی پایه فریم‌ورک پاسخ‌های عامل پایتون را در حالت استقرار کد scaffold کند، `azure.yaml` تولیدشده را توضیح دهد و اشتراک، منطقه، پروژه، و استقرار مدل را پیشنهاد دهد. درخواست تأیید **قبل از ایجاد منابع Azure** کنید، تست محلی درخواست کنید و قبل از استقرار متوقف شوید. خروجی آن را مرور کنید و فقط زمانی که آماده بودید به مراحل استقرار فوق ادامه دهید.

برای پروژه‌های موجود، `--template`/`-t` جایگزین املای منسوخ شده `--manifest`/`-m` شده است؛ تغییر این فلگ باعث مهاجرت مانیفست‌های قدیمی یا پیکربندی عامل تو در تو نمی‌شود. به مرجع [AI CLI](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init) مراجعه کنید.

### استقرار با یک فرمان واحد

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### استقرارهای خاص محیط

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## پایش و مشاهده‌پذیری

### یکپارچه‌سازی با Application Insights

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
```

این یک منبع Insights ایجاد می‌کند، نه ابزار تلِمتری. زمانی که برنامه شما بازه‌های تماس مدل خروجی ایجاد می‌کند، این پرس و جو نمونه را در لاگ‌های Application Insights اجرا کنید (فیلتر را برای نام‌های واقعی بازه‌های خود تنظیم کنید):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### پایش هزینه‌ها

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

از گیرنده واقعی استفاده کنید و دسترسی‌های حوزه صورتحساب را تأیید کنید. بودجه هشدار ارسال می‌کند؛ سقف هزینه نیست.

## 🔐 بهترین شیوه‌های امنیتی

### پیکربندی Managed Identity

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### امنیت شبکه

این قطعه نقطه انتهایی همچنین به یک منطقه/گروه DNS خصوصی، لینک‌های VNet، اتصال برنامه به VNet و سیاست دسترسی عمومی صریح نیاز دارد. فقط ایجاد یک Endpoint خصوصی دسترسی عمومی را غیرفعال نمی‌کند.

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

## بهینه‌سازی عملکرد

### راهکارهای کشینگ

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

Azure Cache for Redis Basic/Standard/Premium در مسیر [بازنشستگی](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq) است؛ برای استقرارهای جدید از Azure Managed Redis استفاده کنید و راهنمای قالب/احراز هویت آن را دنبال کنید. پاسخ‌های AI کش شده را بر اساس مجوز، مدل/دستورالعمل‌ها و نسخه داده همراه با انقضا محدود کنید؛ هرگز پاسخ‌های خصوصی را فقط با متن پرس‌وجو به اشتراک نگذارید.

### پیکربندی مقیاس‌بندی خودکار

**منبع جزئی:** این تنظیمات مقیاس/ورودی را در یک برنامه کانتینر کامل با محیط مدیریت‌شده، تصویر کانتینر و محدودیت‌های منابع ادغام کنید. تعداد بیشتر نمونه‌ها سهمیه مدل را افزایش نمی‌دهد.

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## عیب‌یابی مشکلات رایج

### مشکل 1: превышение квоты OpenAI

**نشانه‌ها:**
- استقرار به دلیل خطاهای سهمیه شکست می‌خورد
- خطاهای 429 در لاگ‌های برنامه

**راه‌حل‌ها:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

متغیر capacity بالا فقط برای قالب سفارشی که به منظور مصرف آن متصل شده است اعمال می‌شود. برای نمونه RAG از `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` استفاده کنید. `AZURE_LOCATION` را تغییر ندهید تا منابع موجود را جابه‌جا کنید؛ برای یک منطقه جدید یک محیط جداگانه ایجاد کرده و مهاجرت/پاک‌سازی را برنامه‌ریزی کنید.

### مشکل 2: خطاهای احراز هویت

**نشانه‌ها:**
- خطاهای 401/403 هنگام فراخوانی سرویس‌های AI
- پیام‌های «دسترسی ممنوع»

**راه‌حل‌ها:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### مشکل 3: مشکلات استقرار مدل

**نشانه‌ها:**
- مدل‌ها در استقرار در دسترس نیستند
- نسخه‌های خاص مدل خطا دارند

**راه‌حل‌ها:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## قالب‌های نمونه

این‌ها جایگزین‌اند، نه دستورات پشت سر هم. هر کدام را در یک پوشه خالی جداگانه شروع کنید. مقصد صریح `.` مقداردهی اولیه را در دایرکتوری جاری حفظ می‌کند؛ در غیر این صورت AZD فعلی می‌تواند دایرکتوری فرزند با نام قالب ایجاد کند بدون تغییر دایرکتوری کاری شل شما.

### برنامه گفتگوی RAG (Python)

**مخزن**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**سرویس‌ها**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**توضیحات**: برنامه مرجع گفتگوی RAG برای پرسش درباره اسناد شما با بازیابی Azure AI Search. قبل از استفاده، مدل‌های پشتیبانی شده نمونه، ویژگی‌های اختیاری، راهنمای هزینه و سخت‌سازی تولید را بررسی کنید؛ استقرار یک نمونه برنامه را برای محیط تولید کامل نمی‌کند.

**شروع سریع**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### برنامه گفتگوی RAG (.NET)

**مخزن**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**سرویس‌ها**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**توضیحات**: معادل .NET/C# نمونه گفتگوی RAG در پایتون. ساخته شده با ASP.NET Core Minimal API و فرانت‌اند Blazor WebAssembly. شامل چت صوتی، پشتیبانی GPT-4o-mini vision و یک کلاینت دسکتاپ/موبایل هیبریدی .NET MAUI Blazor همراه.

**شروع سریع**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### برنامه گفتگوی RAG (Java)

**مخزن**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**سرویس‌ها**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**توضیحات**: نسخه جاوا نمونه گفتگوی RAG با استفاده از Langchain4J برای ارکستراسیون AI. از معماری میکروسرویس رویدادمحور، چندین استراتژی جستجو (متن، برداری، هیبرید)، آپلود سند با Azure Document Intelligence و استقرار در Azure Container Apps یا Azure Kubernetes Service پشتیبانی می‌کند.

**شروع سریع**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### همراه فروشگاه سازمانی با Microsoft Foundry

**مخزن**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**سرویس‌ها**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**توضیحات**: همراه فروشگاه جامع RAG با استفاده از Microsoft Foundry و Prompty. چت‌بات فروشگاه خارج از منزل Contoso که پاسخ‌ها را بر اساس کاتالوگ محصول و داده‌های سفارش مشتری پایه‌گذاری می‌کند. نشان‌دهنده کل جریان کاری GenAIOps — نمونه‌سازی با Prompty، ارزیابی با ارزیابان کمکی AI و استقرار از طریق AZD به Container Apps.

**شروع سریع**:
```bash
azd init --template contoso-chat .
azd up
```

### برنامه چندعاملی نویسندگی خلاقانه

**مخزن**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**سرویس‌ها**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**توضیحات**: نمونه چندعاملی که ارکستراسیون عامل AI با Prompty را نشان می‌دهد. از یک عامل تحقیقاتی (Bing Grounding در Azure AI Agent Service)، یک عامل محصول (Azure AI Search)، یک عامل نویسنده و یک عامل ویراستار برای تولید مشترک مقالات تحقیق شده استفاده می‌کند. شامل CI/CD با ارزیابی در GitHub Actions است.

**شروع سریع**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### گفتگوی بدون سرور RAG (JavaScript/TypeScript)

**مخزن**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**سرویس‌ها**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**توضیحات**: چت‌بات RAG کاملا بدون سرور با استفاده از LangChain.js با Azure Functions برای API و Azure Static Web Apps برای میزبانی. از Azure Cosmos DB به عنوان فروشگاه بردار و پایگاه داده تاریخچه چت استفاده می‌کند. پشتیبانی از توسعه محلی با Ollama برای تست بدون هزینه.

**شروع سریع**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### شتاب‌دهنده راه‌حل گفتگو با داده‌های شما

**مخزن**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**سرویس‌ها**: Microsoft Foundry + Azure Container Apps (وب/API/ورودی) + Azure AI Search با Cosmos DB، یا PostgreSQL با pgvector

**توضیحات**: شتاب‌دهنده گفتگویی مستند با ارجاعات. نمونه فعلی فرانت‌اند React، بک‌اند FastAPI و کارگر ورودی Functions را روی Container Apps میزبانی می‌کند؛ گزینه‌های ارکستراسیون Agent Framework و LangGraph هستند. گزینه‌های پایگاه داده/بازیابی هنگام استقرار انتخاب می‌شوند. این یک نقطه شروع است، نه سیستم تولید آماده؛ فرض نکنید نسخه‌های قدیمی App Service، Semantic Kernel یا Prompt Flow توصیف پیش‌فرض فعلی هستند.

**شروع سریع**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### عوامل مسافرتی AI — ارکستراسیون چند عاملی MCP

**مخزن**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**سرویس‌ها**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + سرورهای MCP (.NET، Python، Java، TypeScript)

**توضیحات**: برنامه مرجع برای ارکستراسیون AI چند عاملی با استفاده از سه چارچوب (LangChain.js، LlamaIndex.TS و Microsoft Agent Framework). شامل سرورهای MCP (پروتکل زمینه مدل) در چهار زبان که به صورت Azure Container Apps بدون سرور با پایش OpenTelemetry مستقر شده‌اند.

**شروع سریع**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **مرور قالب‌های بیشتر**: به [گالری قالب‌های عالی AZD AI](https://azure.github.io/awesome-azd/?tags=ai) برای قالب‌های موجود در زبان‌ها و سناریوهای مختلف مراجعه کنید. هر نمونه پیوند داده شده یک مخزن خارجی است، نه نمونه محلی ارائه شده توسط این دوره؛ پیش‌نیازها و راهنمای تولید فعلی آن‌ها را قبل از استقرار بررسی کنید.

## مراحل بعدی

1. **نمونه‌ها را امتحان کنید**: با یک قالب آماده که با مورد استفاده شما مطابقت دارد شروع کنید
2. **بر اساس نیازهای خود سفارشی کنید**: زیرساخت و کد برنامه را تغییر دهید
3. **پایش اضافه کنید**: مشاهده‌پذیری جامع پیاده‌سازی کنید
4. **هزینه‌ها را بهینه کنید**: پیکربندی‌ها را برای بودجه خود تنظیم کنید
5. **استقرار خود را امن کنید**: الگوهای امنیتی سازمانی اعمال کنید
6. **به تولید مقیاس دهید**: ویژگی‌های چندمنطقه‌ای و با دسترسی بالا اضافه کنید

## 🎯 تمرین‌های عملی

### تمرین 1: استقرار برنامه چت مدل‌های Microsoft Foundry (۳۰ دقیقه)
**هدف**: استقرار و تست یک برنامه مرجع چت AI

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Review the listed resources and confirm cleanup
azd down
```

**معیارهای موفقیت:**
- [ ] استقرار بدون خطاهای سهمیه کامل شود
- [ ] دسترسی به رابط چت در مرورگر امکان‌پذیر باشد
- [ ] قابلیت پرسش و دریافت پاسخ‌های مجهز به AI داشته باشد
- [ ] Application Insights داده‌های تلِمتری نشان دهد
- [ ] منابع با موفقیت پاک شوند

**هزینه:** راهنمای هزینه نمونه فعلی و SKUهای انتخاب شده را قبل از استقرار مرور کنید. صورتحساب تا حذف منابع ادامه دارد؛ تخمینی ثابت و ۳۰ دقیقه‌ای برای هر پیکربندی اعمال نمی‌شود.

### تمرین 2: پیکربندی استقرار چند مدل (۴۵ دقیقه)
**هدف**: استقرار مدل‌های AI متعدد با پیکربندی‌های مختلف

**نقطه شروع:** یک حساب Azure OpenAI موجود و یک ماژول گروه منابع AZD که بتواند این فایل را فراخوانی کند. با ویرایشگر خود `infra/ai-models.bicep` را با محتوای زیر ایجاد کنید. فقط به این دلیل که زیر `infra/` است به‌صورت خودکار مستقر نمی‌شود.

```bicep
param openAiAccountName string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

از ماژول با دامنه گروه منابع که مالک حساب است، یک فراخوانی ماژول اضافه کنید (نام نماد را بر اساس حساب واقعی خود تنظیم کنید):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

از اعلام همان استقرارها در هر دو ماژول خودداری کنید. اگر نقطه ورود AZD با دامنه اشتراک است، این را از ماژول فرزند دامنه گروه منابع آن فراخوانی کرده و مسیر نسبی را تنظیم کنید. آن ماژول حاوی را با `az bicep build --file <path-to-containing-module>` بسازید، سپس:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**معیارهای موفقیت:**
- [ ] چندین مدل با موفقیت مستقر شدند
- [ ] تنظیمات ظرفیت متفاوت اعمال شدند
- [ ] مدل‌ها از طریق API قابل دسترسی هستند
- [ ] می‌توان از برنامه به هر دو مدل صدا زد

### تمرین 3: پیاده‌سازی پایش هزینه (۲۰ دقیقه)
**هدف**: راه‌اندازی هشدارهای بودجه و پیگیری هزینه‌ها

**نقطه شروع:** الگوی بودجه بالا و یک ماژول زیرساخت دامنه گروه منابع. این منبع را با ویرایشگر خود اضافه کنید؛ `budgetStartDate` را از نگاشت پارامتر خود ارسال کنید (اگر قبلاً پارامتر اعلام شده است تکراری نکنید). گیرنده را جایگزین کرده و دسترسی نویسندگی بودجه را تأیید کنید.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

انتظار می‌رود: پاسخ شامل `amount: 200` و هر دو آستانه و گیرنده شما باشد. هزینه‌ها در پورتال هزینه مدیریت را بررسی کنید؛ داده‌های هزینه تاخیر دارند و هشدار لزوماً در تمرین کوتاه فعال نمی‌شود.

**معیارهای موفقیت:**
- [ ] هشدار بودجه در Azure ایجاد شده باشد
- [ ] اطلاع‌رسانی‌های ایمیلی پیکربندی شده باشد
- [ ] داده‌های هزینه در پرتال Azure قابل مشاهده باشد
- [ ] آستانه‌های بودجه به درستی تنظیم شده باشند

## 💡 پرسش‌های متداول

<details>
<summary><strong>چگونه هزینه‌های Microsoft Foundry Models را در طول توسعه کاهش دهم؟</strong></summary>

1. **قیمت‌گذاری را بررسی کنید**: هیچ سهمیه رایگان ماهانه جهانی ۵۰,۰۰۰ توکنی برای مدل‌های Azure OpenAI وجود ندارد
2. **ظرفیت مناسب انتخاب کنید**: ظرفیت `10` معمولاً نمایانگر ۱۰,۰۰۰ TPM برای این مدل‌های متن Standard است، نه ۱۰ TPM. کاهش این نرخ محدودکننده قیمت هر توکن را کاهش نمی‌دهد
3. **از azd down استفاده کنید**: هنگام عدم توسعه فعال منابع قابل حذف را پاک کنید (این غیرفعال‌سازی نیست)
4. **پاسخ‌ها را کش کنید**: کش Redis را برای پرس‌وجوهای تکراری پیاده‌سازی کنید
5. **از مهندسی پرامپت استفاده کنید**: استفاده از توکن را با پرامپت‌های بهینه کاهش دهید

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>تفاوت بین Microsoft Foundry Models و OpenAI API چیست؟</strong></summary>

**Microsoft Foundry Models**:
- امنیت و تطابق سازمانی
- یکپارچه‌سازی شبکه خصوصی
- تضمین‌های SLA
- احراز هویت Managed Identity
- سهمیه‌های بالاتر در دسترس

**OpenAI API**: ارائه‌دهنده/API متفاوت با دسترسی مدل، قیمت‌گذاری، احراز هویت و گزینه‌های اتصال سازمانی خود. فعلی‌ها را مقایسه کنید و فرض نکنید فقط اینترنت عمومی است یا همیشه مدل‌ها را ابتدا ارائه می‌دهد.

بر اساس نیازهای سازمان خود انتخاب کنید؛ نمونه‌های Managed Identity و لینک خصوصی خاص Azure در این دوره به سرویس‌های میزبانی شده در Azure مربوط می‌شود، نه همه مدل‌ها/ارائه‌دهندگان در کاتالوگ Foundry.
</details>

<details>
<summary><strong>چگونه با خطاهای تجاوز سهمیه Microsoft Foundry Models برخورد کنم؟</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>آیا می‌توانم از داده‌های خود با Microsoft Foundry Models استفاده کنم؟</strong></summary>

بله! از **Azure AI Search** برای RAG (تولید افزوده بازیابی‌شده) استفاده کنید:

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

به قالب [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) مراجعه کنید.
</details>

<details>
<summary><strong>چگونه انتهای مدل‌های هوش مصنوعی را امن کنیم؟</strong></summary>

**بهترین روش‌ها**:
۱. استفاده از Managed Identity (بدون کلید API)
۲. فعال کردن انتهای خصوصی
۳. پیکربندی گروه‌های امنیتی شبکه
۴. پیاده‌سازی محدودیت نرخ
۵. استفاده از Azure Key Vault برای نگهداری اسرار

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## جامعه و پشتیبانی

- **Microsoft Foundry Discord**: [کانال #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [مسائل و مباحث](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [مستندات رسمی](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [مهارت Microsoft Foundry در skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - نصب مهارت‌های Azure + Foundry agent در ویرایشگر خود با استفاده از `npx skills add microsoft/github-copilot-for-azure`

---

**هدایت فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۲ - توسعه هوش مصنوعی محور
- **⬅️ فصل قبلی**: [فصل ۱: اولین پروژه شما](../chapter-01-foundation/first-project.md)
- **➡️ بعدی**: [عامل‌های هوش مصنوعی](agents.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

**نیاز به کمک دارید؟** در بحث‌های جامعه ما شرکت کنید یا یک مسئله در مخزن باز کنید. جامعه Azure AI + AZD اینجا است تا به موفقیت شما کمک کند!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->