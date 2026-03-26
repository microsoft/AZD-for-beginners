# راهنمای نصب و راه‌اندازی

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۱ - مبانی و شروع سریع
- **⬅️ قبلی**: [مبانی AZD](azd-basics.md)
- **➡️ بعدی**: [اولین پروژه شما](first-project.md)
- **🚀 فصل بعدی**: [فصل ۲: توسعه مبتنی بر هوش مصنوعی](../chapter-02-ai-development/microsoft-foundry-integration.md)

## مقدمه

این راهنمای جامع شما را در نصب و پیکربندی Azure Developer CLI (azd) روی سیستم‌تان همراهی می‌کند. شما روش‌های مختلف نصب برای سیستم‌عامل‌های گوناگون، تنظیم احراز هویت و پیکربندی اولیه را برای آماده‌سازی محیط توسعه خود برای استقرار در Azure خواهید آموخت.

## اهداف یادگیری

تا پایان این درس، شما:
- Azure Developer CLI را به‌طور موفقیت‌آمیز روی سیستم‌عامل خود نصب خواهید کرد
- احراز هویت با Azure را با روش‌های مختلف پیکربندی خواهید کرد
- محیط توسعه خود را با پیش‌نیازهای لازم تنظیم خواهید کرد
- گزینه‌های مختلف نصب و زمان استفاده از هر کدام را درک خواهید کرد
- مشکلات رایج نصب و راه‌اندازی را عیب‌یابی خواهید کرد

## دستاوردهای آموزشی

پس از تکمیل این درس، شما قادر خواهید بود:
- azd را با روش مناسب برای پلتفرم خود نصب کنید
- با استفاده از azd auth login با Azure احراز هویت کنید
- نصب خود را تأیید کرده و دستورات پایه azd را تست کنید
- محیط توسعه خود را برای استفاده بهینه از azd پیکربندی کنید
- مشکلات متداول نصب را به‌صورت مستقل حل کنید

این راهنما به شما کمک می‌کند تا Azure Developer CLI را روی سیستم خود نصب و پیکربندی کنید، صرف‌نظر از سیستم‌عامل یا محیط توسعه شما.

## پیش‌نیازها

قبل از نصب azd، اطمینان حاصل کنید که:
- **اشتراک Azure** - [یک حساب رایگان ایجاد کنید](https://azure.microsoft.com/free/)
- **Azure CLI** - برای احراز هویت و مدیریت منابع
- **Git** - برای کلون کردن قالب‌ها و کنترل نسخه
- **Docker** (اختیاری) - برای برنامه‌های کانتینری

## روش‌های نصب

### ویندوز

#### گزینه ۱: PowerShell (توصیه‌شده)
```powershell
# به‌عنوان مدیر یا با امتیازات ارتقا یافته اجرا کنید
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### گزینه ۲: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### گزینه ۳: Chocolatey
```cmd
choco install azd
```

#### گزینه ۴: نصب دستی
1. آخرین نسخه را از [GitHub](https://github.com/Azure/azure-dev/releases) دانلود کنید
2. آن را در `C:\Program Files\azd\` استخراج کنید
3. آن را به متغیر محیطی PATH اضافه کنید

### macOS

#### گزینه ۱: Homebrew (توصیه‌شده)
```bash
brew tap azure/azd
brew install azd
```

#### گزینه ۲: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### گزینه ۳: نصب دستی
```bash
# دانلود و نصب
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### لینوکس

#### گزینه ۱: Install Script (توصیه‌شده)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### گزینه ۲: Package Managers

**Ubuntu/Debian:**
```bash
# افزودن مخزن بسته‌های مایکروسافت
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# نصب azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# افزودن مخزن بسته‌های مایکروسافت
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd به‌صورت از پیش نصب‌شده در GitHub Codespaces موجود است. به‌سادگی یک codespace ایجاد کنید و فوراً از azd استفاده کنید.

### Docker

```bash
# azd را در یک کانتینر اجرا کنید
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# یک نام مستعار برای استفادهٔ آسان‌تر ایجاد کنید
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ بررسی نصب

پس از نصب، بررسی کنید که azd به‌درستی کار می‌کند:

```bash
# بررسی نسخه
azd version

# مشاهده راهنما
azd --help

# فهرست قالب‌های موجود
azd template list
```

خروجی مورد انتظار:
```
azd version 1.x.x (commit xxxxxx)
```

**توجه**: شماره نسخه واقعی ممکن است متفاوت باشد. برای آخرین نسخه به [نسخه‌های Azure Developer CLI](https://github.com/Azure/azure-dev/releases) مراجعه کنید.

**✅ چک‌لیست موفقیت نصب:**
- [ ] `azd version` شماره نسخه را بدون خطا نشان دهد
- [ ] `azd --help` مستندات دستورات را نمایش دهد
- [ ] `azd template list` قالب‌های موجود را نمایش دهد
- [ ] `az account show` اشتراک Azure شما را نمایش دهد
- [ ] بتوانید یک پوشه تست ایجاد کرده و با موفقیت `azd init` را اجرا کنید

**اگر همه بررسی‌ها موفق باشند، آماده‌اید به [اولین پروژه شما](first-project.md) بروید!**

## راه‌اندازی احراز هویت

### احراز هویت با Azure CLI (توصیه‌شده)
```bash
# اگر قبلاً نصب نشده است، Azure CLI را نصب کنید
# ویندوز: winget install Microsoft.AzureCLI
# مک‌اواس: brew install azure-cli
# لینوکس: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# به Azure وارد شوید
az login

# احراز هویت را تأیید کنید
az account show
```

### احراز هویت با کد دستگاه
اگر روی سیستمی بدون رابط گرافیکی هستید یا با مرورگر مشکل دارید:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
برای محیط‌های خودکار:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## پیکربندی

### پیکربندی سراسری
```bash
# تنظیم اشتراک پیش‌فرض
azd config set defaults.subscription <subscription-id>

# تنظیم مکان پیش‌فرض
azd config set defaults.location eastus2

# نمایش تمام پیکربندی‌ها
azd config list
```

### متغیرهای محیطی
به پروفایل پوسته خود (`.bashrc`, `.zshrc`, `.profile`) اضافه کنید:
```bash
# پیکربندی Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# پیکربندی azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # فعال‌سازی ثبت لاگ‌های اشکال‌زدایی
```

## ادغام با IDE

### Visual Studio Code
افزونه Azure Developer CLI را نصب کنید:
1. VS Code را باز کنید
2. به بخش Extensions بروید (Ctrl+Shift+X)
3. عبارت "Azure Developer CLI" را جستجو کنید
4. افزونه را نصب کنید

قابلیت‌ها:
- IntelliSense برای azure.yaml
- دستورات ترمینال یکپارچه
- مرور قالب‌ها
- مانیتورینگ استقرار

### GitHub Codespaces
یک `.devcontainer/devcontainer.json` ایجاد کنید:
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
1. افزونه Azure را نصب کنید
2. اطلاعات احراز هویت Azure را پیکربندی کنید
3. از ترمینال یکپارچه برای دستورات azd استفاده کنید

## 🐛 عیب‌یابی نصب

### مشکلات رایج

#### دسترسی رد شد (Windows)
```powershell
# PowerShell را به‌عنوان مدیر اجرا کنید.
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### مشکلات PATH
azd را به‌صورت دستی به PATH اضافه کنید:

**ویندوز:**
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

# غیرفعال‌سازی بررسی SSL (برای محیط تولید توصیه نمی‌شود)
azd config set http.insecure true
```

#### تعارض نسخه‌ها
```bash
# حذف نصب‌های قدیمی
# ویندوز: winget uninstall Microsoft.Azd
# مک‌اواس: brew uninstall azd
# لینوکس: sudo apt remove azd

# پاک‌سازی پیکربندی
rm -rf ~/.azd
```

### دریافت کمک بیشتر
```bash
# فعال‌سازی ثبت وقایع اشکال‌زدایی
export AZD_DEBUG=true
azd <command> --debug

# مشاهده پیکربندی جاری
azd config list

# مشاهده وضعیت استقرار جاری
azd show
```

## به‌روزرسانی azd

### به‌روزرسانی خودکار
azd زمانی که به‌روزرسانی موجود باشد به شما اطلاع خواهد داد:
```bash
azd version --check-for-updates
```

### به‌روزرسانی دستی

**ویندوز (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**لینوکس:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 سوالات متداول

<details>
<summary><strong>تفاوت بین azd و az CLI چیست؟</strong></summary>

**Azure CLI (az)**: ابزار سطح پایین برای مدیریت منابع منفرد Azure
- `az webapp create`, `az storage account create`
- یک منبع در هر بار
- تمرکز بر مدیریت زیرساخت

**Azure Developer CLI (azd)**: ابزار سطح بالا برای استقرار کامل برنامه‌ها
- `azd up` کل برنامه را همراه با همه منابع مستقر می‌کند
- گردش‌کار مبتنی بر قالب
- تمرکز بر افزایش بهره‌وری توسعه‌دهنده

**شما به هر دو نیاز دارید**: azd از az CLI برای احراز هویت استفاده می‌کند
</details>

<details>
<summary><strong>آیا می‌توانم از azd با منابع Azure موجود استفاده کنم؟</strong></summary>

بله! شما می‌توانید:
1. منابع موجود را در محیط‌های azd وارد کنید
2. به منابع موجود در قالب‌های Bicep خود ارجاع دهید
3. از azd برای استقرارهای جدید در کنار زیرساخت موجود استفاده کنید

برای جزئیات به [راهنمای پیکربندی](configuration.md) مراجعه کنید.
</details>

<details>
<summary><strong>آیا azd با Azure Government یا Azure China کار می‌کند؟</strong></summary>

بله، ابر را پیکربندی کنید:
```bash
# آژور دولتی
az cloud set --name AzureUSGovernment
az login

# آژور چین
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>آیا می‌توانم از azd در خطوط CI/CD استفاده کنم؟</strong></summary>

قطعاً! azd برای خودکارسازی طراحی شده است:
- یکپارچه‌سازی با GitHub Actions
- پشتیبانی از Azure DevOps
- احراز هویت Service Principal
- حالت غیرتعاملی

برای الگوهای CI/CD به [راهنمای استقرار](../chapter-04-infrastructure/deployment-guide.md) مراجعه کنید.
</details>

<details>
<summary><strong>هزینه استفاده از azd چقدر است؟</strong></summary>

خود azd به‌تنهایی **کاملاً رایگان** و متن‌باز است. شما تنها برای موارد زیر هزینه می‌پردازید:
- منابع Azure که مستقر می‌کنید
- هزینه‌های مصرف Azure (محاسبه، ذخیره‌سازی، و غیره)

برای برآورد هزینه‌ها قبل از استقرار از `azd provision --preview` استفاده کنید.
</details>

## گام‌های بعدی

1. **تکمیل احراز هویت**: اطمینان حاصل کنید که می‌توانید به اشتراک Azure خود دسترسی داشته باشید
2. **اولین استقرار خود را امتحان کنید**: دستورالعمل [راهنمای اولین پروژه](first-project.md) را دنبال کنید
3. **کاوش در قالب‌ها**: قالب‌های موجود را با `azd template list` مرور کنید
4. **پیکربندی IDE**: محیط توسعه خود را تنظیم کنید

## پشتیبانی

اگر با مشکلی مواجه شدید:
- [مستندات رسمی](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [گزارش مسائل](https://github.com/Azure/azure-dev/issues)
- [بحث‌های جامعه](https://github.com/Azure/azure-dev/discussions)
- [پشتیبانی Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - راهنمایی دستورات Azure را مستقیماً در ویرایشگر خود با `npx skills add microsoft/github-copilot-for-azure` دریافت کنید

---

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۱ - مبانی و شروع سریع
- **⬅️ قبلی**: [مبانی AZD](azd-basics.md) 
- **➡️ بعدی**: [اولین پروژه شما](first-project.md)
- **🚀 فصل بعدی**: [فصل ۲: توسعه مبتنی بر هوش مصنوعی](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ نصب کامل شد!** برای شروع ساختن با azd به [اولین پروژه شما](first-project.md) بروید.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. نسخهٔ اصلی سند به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در برابر هرگونه سوءتفاهم یا تفسیر نادرستی که از استفاده از این ترجمه ناشی شود مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->