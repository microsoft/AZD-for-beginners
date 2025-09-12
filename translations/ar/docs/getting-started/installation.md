<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "90202d23bcaf40c8fd99b6a444ddce4a",
  "translation_date": "2025-09-12T18:37:29+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "ar"
}
-->
# دليل التثبيت والإعداد

**السابق:** [التوثيق الرئيسي](../../README.md) | **التالي:** [أساسيات AZD](azd-basics.md)

## المقدمة

هذا الدليل الشامل سيرشدك خلال عملية تثبيت وتكوين Azure Developer CLI (azd) على نظامك. ستتعلم طرق تثبيت متعددة لأنظمة التشغيل المختلفة، إعداد المصادقة، والتكوين الأولي لتحضير بيئة التطوير الخاصة بك لنشر Azure.

## أهداف التعلم

بنهاية هذا الدرس، ستتمكن من:
- تثبيت Azure Developer CLI بنجاح على نظام التشغيل الخاص بك
- إعداد المصادقة مع Azure باستخدام طرق متعددة
- تجهيز بيئة التطوير الخاصة بك مع المتطلبات الأساسية اللازمة
- فهم خيارات التثبيت المختلفة ومتى يتم استخدام كل منها
- حل المشكلات الشائعة المتعلقة بالتثبيت والإعداد

## نتائج التعلم

بعد إكمال هذا الدرس، ستكون قادرًا على:
- تثبيت azd باستخدام الطريقة المناسبة لنظامك
- المصادقة مع Azure باستخدام `azd auth login`
- التحقق من التثبيت واختبار أوامر azd الأساسية
- تكوين بيئة التطوير الخاصة بك لاستخدام azd بشكل مثالي
- حل المشكلات الشائعة المتعلقة بالتثبيت بشكل مستقل

هذا الدليل سيساعدك على تثبيت وتكوين Azure Developer CLI على نظامك، بغض النظر عن نظام التشغيل أو بيئة التطوير الخاصة بك.

## المتطلبات الأساسية

قبل تثبيت azd، تأكد من توفر:
- **اشتراك Azure** - [إنشاء حساب مجاني](https://azure.microsoft.com/free/)
- **Azure CLI** - للمصادقة وإدارة الموارد
- **Git** - لاستنساخ القوالب والتحكم في الإصدارات
- **Docker** (اختياري) - للتطبيقات المعبأة في حاويات

## طرق التثبيت

### Windows

#### الخيار 1: PowerShell (موصى به)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### الخيار 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### الخيار 3: Chocolatey
```cmd
choco install azd
```

#### الخيار 4: التثبيت اليدوي
1. قم بتنزيل أحدث إصدار من [GitHub](https://github.com/Azure/azure-dev/releases)
2. استخراج إلى `C:\Program Files\azd\`
3. أضف إلى متغير PATH في البيئة

### macOS

#### الخيار 1: Homebrew (موصى به)
```bash
brew tap azure/azd
brew install azd
```

#### الخيار 2: سكربت التثبيت
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### الخيار 3: التثبيت اليدوي
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### الخيار 1: سكربت التثبيت (موصى به)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### الخيار 2: مديري الحزم

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

azd يأتي مثبتًا مسبقًا في GitHub Codespaces. ببساطة قم بإنشاء مساحة عمل وابدأ باستخدام azd فورًا.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ التحقق من التثبيت

بعد التثبيت، تحقق من أن azd يعمل بشكل صحيح:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

الناتج المتوقع:
```
azd version 1.5.0 (commit abc123)
```

## إعداد المصادقة

### مصادقة Azure CLI (موصى بها)
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

### مصادقة رمز الجهاز
إذا كنت تعمل على نظام بدون واجهة أو تواجه مشاكل مع المتصفح:
```bash
az login --use-device-code
```

### خدمة Principal (CI/CD)
للبيئات المؤتمتة:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## التكوين

### التكوين العام
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### متغيرات البيئة
أضف إلى ملف تعريف shell الخاص بك (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## تكامل IDE

### Visual Studio Code
قم بتثبيت إضافة Azure Developer CLI:
1. افتح VS Code
2. انتقل إلى الإضافات (Ctrl+Shift+X)
3. ابحث عن "Azure Developer CLI"
4. قم بتثبيت الإضافة

الميزات:
- IntelliSense لـ azure.yaml
- أوامر متكاملة في الطرفية
- تصفح القوالب
- مراقبة النشر

### GitHub Codespaces
قم بإنشاء ملف `.devcontainer/devcontainer.json`:
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
1. قم بتثبيت إضافة Azure
2. قم بتكوين بيانات اعتماد Azure
3. استخدم الطرفية المدمجة لأوامر azd

## 🐛 استكشاف الأخطاء وإصلاحها

### المشاكل الشائعة

#### رفض الإذن (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### مشاكل PATH
أضف azd يدويًا إلى PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### مشاكل الشبكة/الوكيل
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### تعارض الإصدارات
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### الحصول على المزيد من المساعدة
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## تحديث azd

### التحديثات التلقائية
azd سيقوم بإعلامك عند توفر تحديثات:
```bash
azd version --check-for-updates
```

### التحديثات اليدوية

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## الخطوات التالية

1. **إكمال المصادقة**: تأكد من أنك تستطيع الوصول إلى اشتراك Azure الخاص بك
2. **جرب أول عملية نشر**: اتبع [دليل المشروع الأول](first-project.md)
3. **استكشاف القوالب**: تصفح القوالب المتاحة باستخدام `azd template list`
4. **تكوين IDE الخاص بك**: قم بإعداد بيئة التطوير الخاصة بك

## الدعم

إذا واجهت مشاكل:
- [التوثيق الرسمي](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [الإبلاغ عن المشاكل](https://github.com/Azure/azure-dev/issues)
- [مناقشات المجتمع](https://github.com/Azure/azure-dev/discussions)
- [دعم Azure](https://azure.microsoft.com/support/)

---

**السابق:** [التوثيق الرئيسي](../../README.md) | **التالي:** [أساسيات AZD](azd-basics.md)

**تم التثبيت بنجاح!** تابع إلى [مشروعك الأول](first-project.md) لبدء العمل باستخدام azd.

---

**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو معلومات غير دقيقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي. للحصول على معلومات حاسمة، يُوصى بالاستعانة بترجمة بشرية احترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة تنشأ عن استخدام هذه الترجمة.