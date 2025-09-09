<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e9fcb9121c8d0b570798d778f8904a22",
  "translation_date": "2025-09-09T19:07:35+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "ur"
}
-->
# انسٹالیشن اور سیٹ اپ گائیڈ

## تعارف

یہ جامع گائیڈ آپ کو Azure Developer CLI (azd) کو اپنے سسٹم پر انسٹال اور کنفیگر کرنے کے مراحل سے گزارے گی۔ آپ مختلف آپریٹنگ سسٹمز کے لیے انسٹالیشن کے طریقے، تصدیق کی سیٹ اپ، اور ابتدائی کنفیگریشن سیکھیں گے تاکہ آپ اپنے ڈیولپمنٹ ماحول کو Azure ڈیپلائمنٹس کے لیے تیار کر سکیں۔

## سیکھنے کے اہداف

اس سبق کے اختتام تک، آپ:
- اپنے آپریٹنگ سسٹم پر Azure Developer CLI کو کامیابی سے انسٹال کریں گے
- Azure کے ساتھ مختلف طریقوں سے تصدیق کو کنفیگر کریں گے
- اپنے ڈیولپمنٹ ماحول کو ضروری شرائط کے ساتھ سیٹ اپ کریں گے
- مختلف انسٹالیشن آپشنز کو سمجھیں گے اور جانیں گے کہ کب کون سا استعمال کرنا ہے
- عام انسٹالیشن اور سیٹ اپ کے مسائل کو حل کریں گے

## سیکھنے کے نتائج

اس سبق کو مکمل کرنے کے بعد، آپ قابل ہوں گے:
- اپنے پلیٹ فارم کے لیے مناسب طریقے سے azd انسٹال کریں
- azd auth login کے ذریعے Azure کے ساتھ تصدیق کریں
- اپنی انسٹالیشن کی تصدیق کریں اور بنیادی azd کمانڈز کو ٹیسٹ کریں
- اپنے ڈیولپمنٹ ماحول کو azd کے بہترین استعمال کے لیے کنفیگر کریں
- عام انسٹالیشن کے مسائل کو خود سے حل کریں

یہ گائیڈ آپ کو Azure Developer CLI کو اپنے سسٹم پر انسٹال اور کنفیگر کرنے میں مدد دے گی، چاہے آپ کا آپریٹنگ سسٹم یا ڈیولپمنٹ ماحول کوئی بھی ہو۔

## شرائط

azd انسٹال کرنے سے پہلے، یقینی بنائیں کہ آپ کے پاس:
- **Azure سبسکرپشن** - [مفت اکاؤنٹ بنائیں](https://azure.microsoft.com/free/)
- **Azure CLI** - تصدیق اور وسائل کے انتظام کے لیے
- **Git** - ٹیمپلیٹس کلون کرنے اور ورژن کنٹرول کے لیے
- **Docker** (اختیاری) - کنٹینرائزڈ ایپلیکیشنز کے لیے

## انسٹالیشن کے طریقے

### ونڈوز

#### آپشن 1: پاور شیل (تجویز کردہ)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### آپشن 2: ونڈوز پیکیج مینیجر (winget)
```cmd
winget install Microsoft.Azd
```

#### آپشن 3: Chocolatey
```cmd
choco install azd
```

#### آپشن 4: دستی انسٹالیشن
1. [GitHub](https://github.com/Azure/azure-dev/releases) سے تازہ ترین ریلیز ڈاؤنلوڈ کریں
2. `C:\Program Files\azd\` میں ایکسٹریکٹ کریں
3. PATH ماحول متغیر میں شامل کریں

### macOS

#### آپشن 1: Homebrew (تجویز کردہ)
```bash
brew tap azure/azd
brew install azd
```

#### آپشن 2: انسٹال اسکرپٹ
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### آپشن 3: دستی انسٹالیشن
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### لینکس

#### آپشن 1: انسٹال اسکرپٹ (تجویز کردہ)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### آپشن 2: پیکیج مینیجرز

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

azd پہلے سے GitHub Codespaces میں انسٹال ہوتا ہے۔ بس ایک کوڈ اسپیس بنائیں اور فوراً azd استعمال کریں۔

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ انسٹالیشن کی تصدیق

انسٹالیشن کے بعد، تصدیق کریں کہ azd صحیح کام کر رہا ہے:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

متوقع آؤٹ پٹ:
```
azd version 1.5.0 (commit abc123)
```

## 🔐 تصدیق کی سیٹ اپ

### Azure CLI تصدیق (تجویز کردہ)
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

### ڈیوائس کوڈ تصدیق
اگر آپ ہیڈ لیس سسٹم پر ہیں یا براؤزر کے مسائل کا سامنا ہے:
```bash
az login --use-device-code
```

### سروس پرنسپل (CI/CD)
خودکار ماحول کے لیے:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## 🛠️ کنفیگریشن

### گلوبل کنفیگریشن
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### ماحول متغیرات
اپنے شیل پروفائل (`.bashrc`, `.zshrc`, `.profile`) میں شامل کریں:
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## 🔧 IDE انٹیگریشن

### Visual Studio Code
Azure Developer CLI ایکسٹینشن انسٹال کریں:
1. VS Code کھولیں
2. ایکسٹینشنز پر جائیں (Ctrl+Shift+X)
3. "Azure Developer CLI" تلاش کریں
4. ایکسٹینشن انسٹال کریں

خصوصیات:
- azure.yaml کے لیے IntelliSense
- انٹیگریٹڈ ٹرمینل کمانڈز
- ٹیمپلیٹس براؤزنگ
- ڈیپلائمنٹ مانیٹرنگ

### GitHub Codespaces
`.devcontainer/devcontainer.json` بنائیں:
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
1. Azure پلگ ان انسٹال کریں
2. Azure کی اسناد کنفیگر کریں
3. azd کمانڈز کے لیے انٹیگریٹڈ ٹرمینل استعمال کریں

## 🐛 انسٹالیشن کے مسائل کا حل

### عام مسائل

#### اجازت سے انکار (ونڈوز)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH مسائل
azd کو دستی طور پر PATH میں شامل کریں:

**ونڈوز:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### نیٹ ورک/پراکسی مسائل
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### ورژن تنازعات
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### مزید مدد حاصل کرنا
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## azd کو اپ ڈیٹ کرنا

### خودکار اپ ڈیٹس
azd آپ کو اپ ڈیٹس دستیاب ہونے پر مطلع کرے گا:
```bash
azd version --check-for-updates
```

### دستی اپ ڈیٹس

**ونڈوز (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**لینکس:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## اگلے مراحل

1. **تصدیق مکمل کریں**: یقینی بنائیں کہ آپ اپنی Azure سبسکرپشن تک رسائی حاصل کر سکتے ہیں
2. **اپنا پہلا ڈیپلائمنٹ آزمائیں**: [پہلے پروجیکٹ کی گائیڈ](first-project.md) پر عمل کریں
3. **ٹیمپلیٹس دریافت کریں**: `azd template list` کے ساتھ دستیاب ٹیمپلیٹس براؤز کریں
4. **اپنا IDE کنفیگر کریں**: اپنا ڈیولپمنٹ ماحول سیٹ اپ کریں

## سپورٹ

اگر آپ کو مسائل کا سامنا ہو:
- [سرکاری دستاویزات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مسائل رپورٹ کریں](https://github.com/Azure/azure-dev/issues)
- [کمیونٹی مباحثے](https://github.com/Azure/azure-dev/discussions)
- [Azure سپورٹ](https://azure.microsoft.com/support/)

---

**نیویگیشن**
- **پچھلا سبق**: [AZD بنیادی معلومات](azd-basics.md)
- **اگلا سبق**: [کنفیگریشن](configuration.md)

**انسٹالیشن مکمل!** [اپنا پہلا پروجیکٹ](first-project.md) پر جاری رکھیں تاکہ azd کے ساتھ کام شروع کریں۔

---

**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔