<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c58e92a5b56ad73610b95518b0eea386",
  "translation_date": "2025-09-17T16:23:25+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "fa"
}
-->
# راهنمای نصب و راه‌اندازی

**فهرست فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۱ - مبانی و شروع سریع
- **⬅️ قبلی**: [مبانی AZD](azd-basics.md)
- **➡️ بعدی**: [اولین پروژه شما](first-project.md)
- **🚀 فصل بعدی**: [فصل ۲: توسعه مبتنی بر هوش مصنوعی](../ai-foundry/azure-ai-foundry-integration.md)

## مقدمه

این راهنمای جامع شما را در فرآیند نصب و پیکربندی Azure Developer CLI (azd) بر روی سیستم‌تان راهنمایی می‌کند. شما با روش‌های مختلف نصب برای سیستم‌عامل‌های مختلف، تنظیم احراز هویت و پیکربندی اولیه برای آماده‌سازی محیط توسعه خود برای استقرار در Azure آشنا خواهید شد.

## اهداف یادگیری

در پایان این درس، شما:
- Azure Developer CLI را با موفقیت بر روی سیستم‌عامل خود نصب خواهید کرد
- احراز هویت با Azure را با استفاده از روش‌های مختلف پیکربندی خواهید کرد
- محیط توسعه خود را با پیش‌نیازهای لازم تنظیم خواهید کرد
- گزینه‌های مختلف نصب را خواهید شناخت و خواهید دانست که هر کدام چه زمانی مناسب هستند
- مشکلات رایج نصب و راه‌اندازی را رفع خواهید کرد

## نتایج یادگیری

پس از تکمیل این درس، شما قادر خواهید بود:
- azd را با روش مناسب برای پلتفرم خود نصب کنید
- با استفاده از دستور `azd auth login` به Azure احراز هویت کنید
- نصب خود را تأیید کرده و دستورات پایه‌ای azd را آزمایش کنید
- محیط توسعه خود را برای استفاده بهینه از azd پیکربندی کنید
- مشکلات رایج نصب را به‌طور مستقل حل کنید

این راهنما به شما کمک می‌کند تا Azure Developer CLI را بر روی سیستم خود نصب و پیکربندی کنید، بدون توجه به سیستم‌عامل یا محیط توسعه شما.

## پیش‌نیازها

قبل از نصب azd، مطمئن شوید که موارد زیر را دارید:
- **اشتراک Azure** - [ایجاد حساب رایگان](https://azure.microsoft.com/free/)
- **Azure CLI** - برای احراز هویت و مدیریت منابع
- **Git** - برای کلون کردن قالب‌ها و کنترل نسخه
- **Docker** (اختیاری) - برای برنامه‌های کانتینری

## روش‌های نصب

### ویندوز

#### گزینه ۱: پاورشل (توصیه‌شده)
```powershell
# Run as Administrator or with elevated privileges
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
2. فایل‌ها را در مسیر `C:\Program Files\azd\` استخراج کنید
3. مسیر را به متغیر PATH اضافه کنید

### macOS

#### گزینه ۱: Homebrew (توصیه‌شده)
```bash
brew tap azure/azd
brew install azd
```

#### گزینه ۲: اسکریپت نصب
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### گزینه ۳: نصب دستی
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### لینوکس

#### گزینه ۱: اسکریپت نصب (توصیه‌شده)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### گزینه ۲: مدیران بسته

**Ubuntu/Debian:**
```bash
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd به‌صورت پیش‌فرض در GitHub Codespaces نصب شده است. کافی است یک کداسپیس ایجاد کنید و فوراً از azd استفاده کنید.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ تأیید نصب

پس از نصب، بررسی کنید که azd به‌درستی کار می‌کند:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

خروجی مورد انتظار:
```
azd version 1.5.0 (commit abc123)
```

## تنظیم احراز هویت

### احراز هویت با Azure CLI (توصیه‌شده)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### احراز هویت با کد دستگاه
اگر از سیستم بدون رابط گرافیکی استفاده می‌کنید یا مشکلات مرورگر دارید:
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

### پیکربندی جهانی
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### متغیرهای محیطی
به پروفایل شل خود اضافه کنید (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## یکپارچه‌سازی با IDE

### Visual Studio Code
افزونه Azure Developer CLI را نصب کنید:
1. VS Code را باز کنید
2. به بخش Extensions بروید (Ctrl+Shift+X)
3. "Azure Developer CLI" را جستجو کنید
4. افزونه را نصب کنید

ویژگی‌ها:
- IntelliSense برای azure.yaml
- دستورات ترمینال یکپارچه
- مرور قالب‌ها
- نظارت بر استقرار

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
1. افزونه Azure را نصب کنید
2. اعتبارنامه‌های Azure را پیکربندی کنید
3. از ترمینال یکپارچه برای دستورات azd استفاده کنید

## 🐛 رفع مشکلات نصب

### مشکلات رایج

#### دسترسی رد شده (ویندوز)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### مشکلات PATH
مسیر azd را به‌صورت دستی اضافه کنید:

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
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### تضاد نسخه‌ها
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### دریافت کمک بیشتر
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## به‌روزرسانی azd

### به‌روزرسانی خودکار
azd هنگام در دسترس بودن به‌روزرسانی‌ها به شما اطلاع می‌دهد:
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

## مراحل بعدی

1. **احراز هویت را کامل کنید**: مطمئن شوید که به اشتراک Azure خود دسترسی دارید
2. **اولین استقرار خود را امتحان کنید**: راهنمای [اولین پروژه](first-project.md) را دنبال کنید
3. **قالب‌ها را بررسی کنید**: قالب‌های موجود را با دستور `azd template list` مرور کنید
4. **IDE خود را پیکربندی کنید**: محیط توسعه خود را تنظیم کنید

## پشتیبانی

اگر با مشکلی مواجه شدید:
- [مستندات رسمی](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [گزارش مشکلات](https://github.com/Azure/azure-dev/issues)
- [بحث‌های جامعه](https://github.com/Azure/azure-dev/discussions)
- [پشتیبانی Azure](https://azure.microsoft.com/support/)

---

**فهرست فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۱ - مبانی و شروع سریع
- **⬅️ قبلی**: [مبانی AZD](azd-basics.md) 
- **➡️ بعدی**: [اولین پروژه شما](first-project.md)
- **🚀 فصل بعدی**: [فصل ۲: توسعه مبتنی بر هوش مصنوعی](../ai-foundry/azure-ai-foundry-integration.md)

**✅ نصب کامل شد!** به [اولین پروژه شما](first-project.md) ادامه دهید تا ساخت با azd را آغاز کنید.

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، توصیه می‌شود از ترجمه انسانی حرفه‌ای استفاده کنید. ما مسئولیتی در قبال سوءتفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.