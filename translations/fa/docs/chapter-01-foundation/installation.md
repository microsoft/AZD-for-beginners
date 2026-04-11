# راهنمای نصب و راه‌اندازی

**ناوبری فصل:**
- **📚 صفحهٔ دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل 1 - پایه‌ها و شروع سریع
- **⬅️ قبلی**: [اصول AZD](azd-basics.md)
- **➡️ بعدی**: [اولین پروژهٔ شما](first-project.md)
- **🚀 فصل بعدی**: [فصل 2: توسعه مبتنی بر هوش مصنوعی](../chapter-02-ai-development/microsoft-foundry-integration.md)

## مقدمه

این راهنمای جامع شما را در نصب و پیکربندی Azure Developer CLI (azd) روی سیستم‌تان راهنمایی می‌کند. روش‌های مختلف نصب برای سیستم‌عامل‌های متفاوت، راه‌اندازی احراز هویت و پیکربندی اولیه برای آماده‌سازی محیط توسعهٔ شما جهت انجام استقرار در Azure را خواهید آموخت.

## اهداف آموزشی

تا پایان این درس، شما قادر خواهید بود:
- Azure Developer CLI را با موفقیت روی سیستم‌عامل خود نصب کنید
- احراز هویت با Azure را با استفاده از روش‌های مختلف پیکربندی کنید
- محیط توسعهٔ خود را با پیش‌نیازهای لازم تنظیم کنید
- گزینه‌های مختلف نصب را درک کرده و بدانید چه زمانی از هر کدام استفاده کنید
- مشکلات رایج نصب و راه‌اندازی را رفع کنید

## دستاوردهای یادگیری

پس از اتمام این درس، شما خواهید توانست:
- azd را با روش مناسب برای پلتفرم خود نصب کنید
- با استفاده از azd auth login احراز هویت کنید
- نصب خود را بررسی کرده و فرمان‌های پایهٔ azd را آزمایش کنید
- محیط توسعهٔ خود را برای استفادهٔ بهینه از azd پیکربندی کنید
- مشکلات رایج نصب را به‌صورت مستقل حل کنید

این راهنما به شما کمک می‌کند تا Azure Developer CLI را روی سیستم خود نصب و پیکربندی کنید، فارغ از سیستم‌عامل یا محیط توسعهٔ شما.

## پیش‌نیازها

قبل از نصب azd، اطمینان حاصل کنید که:
- **اشتراک Azure** - [ایجاد حساب رایگان](https://azure.microsoft.com/free/)
- **Azure CLI** - برای احراز هویت و مدیریت منابع
- **Git** - برای کلون کردن قالب‌ها و کنترل نسخه
- **Docker** (اختیاری) - برای برنامه‌های کانتینری شده

## روش‌های نصب

### Windows

#### گزینهٔ 1: Windows Package Manager (پیشنهادی)
```cmd
winget install microsoft.azd
```

#### گزینهٔ 2: اسکریپت نصب PowerShell
```powershell
# هنگامی که winget در دسترس نیست، مفید است
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### گزینهٔ 3: Chocolatey
```cmd
choco install azd
```

#### گزینهٔ 4: نصب دستی
1. آخرین نسخه را از [GitHub](https://github.com/Azure/azure-dev/releases) دانلود کنید
2. آن را استخراج کنید به `C:\Program Files\azd\`
3. به متغیر محیطی PATH اضافه کنید

### macOS

#### گزینهٔ 1: Homebrew (پیشنهادی)
```bash
brew tap azure/azd
brew install azd
```

#### گزینهٔ 2: اسکریپت نصب
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### گزینهٔ 3: نصب دستی
```bash
# دانلود و نصب کنید
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### گزینهٔ 1: اسکریپت نصب (پیشنهادی)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### گزینهٔ 2: مدیران بسته

**نصب دستی از دارایی‌های انتشار:**
```bash
# آخرین آرشیو مناسب معماری لینوکس خود را از این آدرس دانلود کنید:
# https://github.com/Azure/azure-dev/releases
# سپس آن را از حالت فشرده خارج کنید و باینری azd را به PATH خود اضافه کنید.
```

### GitHub Codespaces

برخی از Codespaces و محیط‌های کانتینر توسعه قبلاً `azd` را شامل می‌شوند، اما باید آن را بررسی کنید به‌جای اینکه فرض کنید موجود است:

```bash
azd version
```

اگر `azd` موجود نبود، آن را با اسکریپت استاندارد برای آن محیط نصب کنید.

### Docker

```bash
# azd را در یک کانتینر اجرا کنید
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# یک نام مستعار برای استفادهٔ آسان‌تر ایجاد کنید
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ بررسی نصب

پس از نصب، مطمئن شوید azd به‌درستی کار می‌کند:

```bash
# نسخه را بررسی کنید
azd version

# راهنما را مشاهده کنید
azd --help

# قالب‌های موجود را فهرست کنید
azd template list
```

خروجی مورد انتظار:
```
azd version 1.x.x (commit xxxxxx)
```

**توجه**: شمارهٔ نسخهٔ واقعی ممکن است متفاوت باشد. برای آخرین نسخه به [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) مراجعه کنید.

**✅ چک‌لیست موفقیت نصب:**
- [ ] `azd version` شمارهٔ نسخه را بدون خطا نشان می‌دهد
- [ ] `azd --help` مستندات فرمان را نمایش می‌دهد
- [ ] `azd template list` قالب‌های موجود را نشان می‌دهد
- [ ] می‌توانید یک دایرکتوری آزمایشی ایجاد کنید و با موفقیت `azd init` را اجرا کنید

**اگر همهٔ بررسی‌ها موفق بودند، آماده‌اید به [اولین پروژهٔ شما](first-project.md) بروید!**

## راه‌اندازی احراز هویت

### پیکربندی پیشنهادی برای مبتدیان

برای جریان‌های کاری مبتنی بر AZD، با `azd auth login` وارد شوید.

```bash
# برای فرمان‌های AZD مانند azd up لازم است
azd auth login

# وضعیت احراز هویت AZD را بررسی کنید
azd auth login --check-status
```

فقط وقتی قصد دارید خودتان در طول دوره فرمان‌های `az` را اجرا کنید از ورود Azure CLI استفاده کنید.

### احراز هویت با Azure CLI (اختیاری)
```bash
# در صورت نصب نبودن، Azure CLI را نصب کنید
# ویندوز: winget install Microsoft.AzureCLI
# مک‌اواس: brew install azure-cli
# لینوکس: مستندات نصب Azure CLI را برای توزیع خود ببینید

# به Azure وارد شوید
az login

# احراز هویت را تأیید کنید
az account show
```

### کدام فرآیند ورود را باید استفاده کنید؟

- از `azd auth login` استفاده کنید اگر مسیر مبتدی AZD را دنبال می‌کنید و عمدتاً فرمان‌های `azd` را اجرا می‌کنید.
- از `az login` نیز استفاده کنید وقتی می‌خواهید فرمان‌های Azure CLI مانند `az account show` را اجرا کنید یا منابع را مستقیماً بررسی کنید.
- اگر یک تمرین شامل هر دو فرمان `azd` و `az` است، هر دو فرمان ورود را یک‌بار در ابتدای کار اجرا کنید.

### احراز هویت با کد دستگاه
اگر روی سیستمی بدون واسط گرافیکی هستید یا مشکلات مرورگر دارید:
```bash
azd auth login --use-device-code
```

### سرویس پرینسیپل (CI/CD)
برای محیط‌های خودکار:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### اعتبارسنجی پیکربندی کامل شما

اگر می‌خواهید قبل از شروع فصل 1 یک بررسی سریع آمادگی انجام دهید:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## پیکربندی

### پیکربندی سراسری
```bash
# تنظیم اشتراک پیش‌فرض
azd config set defaults.subscription <subscription-id>

# تنظیم مکان پیش‌فرض
azd config set defaults.location eastus2

# مشاهده تمام پیکربندی‌ها
azd config show
```

### متغیرهای محیطی
به فایل پروفایل شل خود اضافه کنید (`.bashrc`, `.zshrc`, `.profile`):
```bash
# پیکربندی آژور
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# پیکربندی azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # فعال‌سازی لاگ‌گیری اشکال‌زدایی
```

## ادغام با IDE

### Visual Studio Code
افزونهٔ Azure Developer CLI را نصب کنید:
1. VS Code را باز کنید
2. به بخش Extensions بروید (Ctrl+Shift+X)
3. جستجو برای "Azure Developer CLI"
4. افزونه را نصب کنید

ویژگی‌ها:
- IntelliSense برای azure.yaml
- فرمان‌های ترمینال یکپارچه
- مرور قالب‌ها
- مانیتورینگ استقرار

### GitHub Codespaces
یک فایل `.devcontainer/devcontainer.json` ایجاد کنید:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. افزونهٔ Azure را نصب کنید
2. اطلاعات اعتباری Azure را پیکربندی کنید
3. از ترمینال یکپارچه برای فرمان‌های azd استفاده کنید

## 🐛 رفع اشکال نصب

### مشکلات رایج

#### دسترسی رد شد (Windows)
```powershell
# PowerShell را با دسترسی مدیر اجرا کنید
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### مشکلات PATH
azd را به‌صورت دستی به PATH خود اضافه کنید:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### مشکلات شبکه/پراکسی
```bash
# پیکربندی پراکسی
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# اعتبارسنجی SSL را نادیده بگیرید (در محیط تولید توصیه نمی‌شود)
azd config set http.insecure true
```

#### تعارض نسخه‌ها
```bash
# حذف نصب‌های قدیمی
# ویندوز: winget uninstall microsoft.azd
# مک‌اواس: brew uninstall azd
# لینوکس: قبل از نصب مجدد، فایل باینری یا پیوند نمادین قبلی azd را حذف کنید

# پاک‌سازی پیکربندی
rm -rf ~/.azd
```

### دریافت کمک بیشتر
```bash
# فعال‌سازی گزارش‌گیری اشکال‌زدایی
export AZD_DEBUG=true
azd <command> --debug

# مشاهده پیکربندی فعلی
azd config show

# مشاهده وضعیت استقرار فعلی
azd show
```

## به‌روزرسانی azd

### بررسی به‌روزرسانی
azd زمانی که نسخهٔ جدیدتری در دسترس باشد هشدار می‌دهد، و می‌توانید بیلد فعلی خود را با موارد زیر تأیید کنید:
```bash
azd version
```

### به‌روزرسانی دستی

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 سوالات متداول

<details>
<summary><strong>تفاوت azd و az CLI چیست؟</strong></summary>

**Azure CLI (az)**: ابزار سطح پایین برای مدیریت یک‌به‌یک منابع Azure
- `az webapp create`, `az storage account create`
- یک منبع در هر بار
- تمرکز بر مدیریت زیرساخت

**Azure Developer CLI (azd)**: ابزار سطح بالا برای استقرار کامل برنامه‌ها
- `azd up` کل اپلیکیشن را همراه با تمام منابع استقرار می‌دهد
- گردش‌کار مبتنی بر قالب
- تمرکز بر تولیدیت توسعه‌دهنده

**شما به هر دو نیاز دارید**: azd برای احراز هویت از az CLI استفاده می‌کند
</details>

<details>
<summary><strong>آیا می‌توانم از azd با منابع موجود Azure استفاده کنم؟</strong></summary>

بله! شما می‌توانید:
1. منابع موجود را به محیط‌های azd وارد کنید
2. به منابع موجود در قالب‌های Bicep خود ارجاع دهید
3. از azd برای استقرارهای جدید در کنار زیرساخت موجود استفاده کنید

جزئیات را در [راهنمای پیکربندی](configuration.md) ببینید.
</details>

<details>
<summary><strong>آیا azd با Azure Government یا Azure China کار می‌کند؟</strong></summary>

بله، کلود را پیکربندی کنید:
```bash
# آزور دولتی
az cloud set --name AzureUSGovernment
az login

# آزور چین
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>آیا می‌توانم azd را در خطوط CI/CD استفاده کنم؟</strong></summary>

صددرصد! azd برای خودکارسازی طراحی شده است:
- ادغام با GitHub Actions
- پشتیبانی از Azure DevOps
- احراز هویت با سرویس پرینسیپل
- حالت بدون تعاملی

الگوهای CI/CD را در [راهنمای استقرار](../chapter-04-infrastructure/deployment-guide.md) ببینید.
</details>

<details>
<summary><strong>هزینهٔ استفاده از azd چقدر است؟</strong></summary>

خود azd به‌صورت **کاملاً رایگان** و متن‌باز است. شما تنها برای موارد زیر هزینه می‌پردازید:
- منابع Azure که مستقر می‌کنید
- هزینه‌های مصرف Azure (محاسبات، ذخیره‌سازی، و غیره)

قبل از استقرار از `azd provision --preview` برای برآورد هزینه‌ها استفاده کنید.
</details>

## گام‌های بعدی

1. **تکمیل احراز هویت**: اطمینان حاصل کنید که به اشتراک Azure خود دسترسی دارید
2. **آزمایشی از اولین استقرار**: از [راهنمای اولین پروژه](first-project.md) پیروی کنید
3. **مرور قالب‌ها**: قالب‌های موجود را با `azd template list` مرور کنید
4. **پیکربندی IDE**: محیط توسعهٔ خود را تنظیم کنید

## پشتیبانی

اگر با مشکلی مواجه شدید:
- [مستندات رسمی](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [گزارش مشکلات](https://github.com/Azure/azure-dev/issues)
- [بحث‌های جامعه](https://github.com/Azure/azure-dev/discussions)
- [پشتیبانی Azure](https://azure.microsoft.com/support/)
- [**مهارت‌های عامل Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - راهنمای فرمان‌های Azure را مستقیماً در ویرایشگر خود با `npx skills add microsoft/github-copilot-for-azure` دریافت کنید

---

**ناوبری فصل:**
- **📚 صفحهٔ دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل 1 - پایه‌ها و شروع سریع
- **⬅️ قبلی**: [اصول AZD](azd-basics.md) 
- **➡️ بعدی**: [اولین پروژهٔ شما](first-project.md)
- **🚀 فصل بعدی**: [فصل 2: توسعه مبتنی بر هوش مصنوعی](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ نصب کامل شد!** برای شروع ساخت با azd به [اولین پروژهٔ شما](first-project.md) ادامه دهید.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری‌اش باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->