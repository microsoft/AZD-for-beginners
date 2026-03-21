# تنصیب اور سیٹ اپ گائیڈ

**باب نیویگیشن:**
- **📚 کورس ہوم**: [نو آموزوں کے لیے AZD](../../README.md)
- **📖 موجودہ باب**: باب 1 - بنیاد اور فوری آغاز
- **⬅️ پچھلا**: [AZD کے بنیادی اصول](azd-basics.md)
- **➡️ اگلا**: [آپ کا پہلا پروجیکٹ](first-project.md)
- **🚀 اگلا باب**: [باب 2: AI-فرسٹ ڈیولپمنٹ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## تعارف

یہ جامع گائیڈ آپ کو آپ کے سسٹم پر Azure Developer CLI (azd) کی تنصیب اور ترتیب دینے کا طریقہ سکھائے گی۔ آپ مختلف آپریٹنگ سسٹمز کے لیے متعدد تنصیب کے طریقے، توثیق کی ترتیبات، اور ابتدائی تشکیل سیکھیں گے تاکہ Azure میں تعیناتی کے لیے اپنے ترقیاتی ماحول کو تیار کیا جا سکے۔

## سیکھنے کے مقاصد

اس سبق کے آخر تک، آپ:
- اپنے آپریٹنگ سسٹم پر کامیابی سے Azure Developer CLI انسٹال کریں گے
- Azure کے ساتھ متعدد طریقوں سے توثیق ترتیب دیں گے
- ضروری پیشگی شرائط کے ساتھ اپنے ترقیاتی ماحول کو ترتیب دیں گے
- مختلف تنصیب کے آپشنز کو سمجھیں گے اور ہر ایک کب استعمال کرنا ہے جانیں گے
- عام تنصیب اور سیٹ اپ مسائل کا حل تلاش کریں گے

## سیکھنے کے نتائج

اس سبق کو مکمل کرنے کے بعد، آپ قابل ہوں گے:
- اپنے پلیٹ فارم کے لیے مناسب طریقہ استعمال کرتے ہوئے azd انسٹال کریں
- azd auth login کے ذریعے Azure کے ساتھ توثیق کریں
- اپنی تنصیب کی تصدیق کریں اور بنیادی azd کمانڈز کا تجربہ کریں
- بہترین azd استعمال کے لیے اپنے ترقیاتی ماحول کو ترتیب دیں
- عام تنصیب کے مسائل خود حل کریں

یہ گائیڈ آپ کے آپریٹنگ سسٹم یا ترقیاتی ماحول سے قطع نظر Azure Developer CLI کو انسٹال اور ترتیب دینے میں مدد دے گا۔

## ضروریات

azd انسٹال کرنے سے پہلے، یقینی بنائیں کہ آپ کے پاس ہے:
- **Azure سبسکرپشن** - [مفت اکاؤنٹ بنائیں](https://azure.microsoft.com/free/)
- **Azure CLI** - توثیق اور وسائل کے انتظام کے لیے
- **Git** - ٹیمپلیٹس کلون کرنے اور ورژن کنٹرول کے لیے
- **Docker** (اختیاری) - کنٹینرائزڈ ایپلیکیشنز کے لیے

## انسٹالیشن کے طریقے

### ونڈوز

#### آپشن 1: PowerShell (تجویز کردہ)
```powershell
# بطور ایڈمنسٹریٹر یا اعلیٰ اجازتوں کے ساتھ چلائیں
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

#### آپشن 4: دستی تنصیب
1. [GitHub](https://github.com/Azure/azure-dev/releases) سے تازہ ترین ریلیز ڈاؤن لوڈ کریں
2. اسے `C:\Program Files\azd\` میں نکالیں
3. PATH ماحولیاتی متغیر میں شامل کریں

### میک او ایس

#### آپشن 1: Homebrew (تجویز کردہ)
```bash
brew tap azure/azd
brew install azd
```

#### آپشن 2: انسٹال اسکرپٹ
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### آپشن 3: دستی تنصیب
```bash
# ڈاؤن لوڈ کریں اور انسٹال کریں
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
# مائیکروسافٹ پیکیج ریپوزٹری شامل کریں
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd انسٹال کریں
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# مائیکروسافٹ پیکیج ریپوزٹری شامل کریں
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd GitHub Codespaces میں پری انسٹال ہوتا ہے۔ بس ایک codespace بنائیں اور فوراً azd استعمال کرنا شروع کریں۔

### Docker

```bash
# ای زی ڈی کو ایک کنٹینر میں چلائیں
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# آسان استعمال کے لیے ایک عرفی نام بنائیں
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ انسٹالیشن کی تصدیق کریں

انسٹالیشن کے بعد، azd کے صحیح کام کرنے کی تصدیق کریں:

```bash
# ورژن چیک کریں
azd version

# مدد دیکھیں
azd --help

# دستیاب ٹیمپلیٹس کی فہرست بنائیں
azd template list
```

متوقع نتیجہ:
```
azd version 1.x.x (commit xxxxxx)
```

**نوٹ**: اصل ورژن نمبر مختلف ہو سکتا ہے۔ تازہ ترین ورژن کے لیے [Azure Developer CLI ریلیزز](https://github.com/Azure/azure-dev/releases) دیکھیں۔

**✅ انسٹالیشن کامیابی چیک لسٹ:**
- [ ] `azd version` بغیر کسی غلطی کے ورژن نمبر دکھائے
- [ ] `azd --help` کمانڈ دستاویزات دکھائے
- [ ] `azd template list` دستیاب ٹیمپلیٹس دکھائے
- [ ] `az account show` آپ کی Azure سبسکرپشن ظاہر کرے
- [ ] آپ ایک ٹیسٹ ڈائریکٹری بنا کر `azd init` کامیابی سے چلا سکیں

**اگر تمام چیکس مکمل ہو جائیں، تو آپ [آپ کے پہلے پروجیکٹ](first-project.md) کی طرف بڑھنے کے لیے تیار ہیں!**

## توثیق کی ترتیب

### Azure CLI توثیق (تجویز کردہ)
```bash
# اگر پہلے سے انسٹال نہ کیا گیا ہو تو Azure CLI انسٹال کریں
# Windows: winget استعمال کرتے ہوئے Microsoft.AzureCLI انسٹال کریں
# macOS: brew کے ذریعے azure-cli انسٹال کریں
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash چلائیں

# Azure میں لاگ ان کریں
az login

# تصدیق کریں کہ توثیق ہو چکی ہے
az account show
```

### ڈیوائس کوڈ توثیق
اگر آپ ہیڈلیس سسٹم پر ہیں یا براؤزر میں مسائل آ رہے ہیں:
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

## ترتیب

### عالمی ترتیب
```bash
# ڈیفالٹ سبسکرپشن سیٹ کریں
azd config set defaults.subscription <subscription-id>

# ڈیفالٹ مقام سیٹ کریں
azd config set defaults.location eastus2

# تمام کنفیگریشن دیکھیں
azd config list
```

### ماحولیاتی متغیرات
اپنے شیل پروفائل (`.bashrc`, `.zshrc`, `.profile`) میں شامل کریں:
```bash
# ایزور کنفیگریشن
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# ایزد کنفیگریشن
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # ڈیبگ لاگنگ کو فعال کریں
```

## IDE انٹیگریشن

### Visual Studio Code
Azure Developer CLI ایکسٹینشن انسٹال کریں:
1. VS Code کھولیں
2. ایکسٹینشنز (Ctrl+Shift+X) پر جائیں
3. "Azure Developer CLI" تلاش کریں
4. ایکسٹینشن انسٹال کریں

خصوصیات:
- azure.yaml کے لیے IntelliSense
- مربوط ٹرمینل کمانڈز
- ٹیمپلیٹس کی براؤزنگ
- تعیناتی کی نگرانی

### GitHub Codespaces
ایک `.devcontainer/devcontainer.json` بنائیں:
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
2. Azure اسناد ترتیب دیں
3. azd کمانڈز کے لیے مربوط ٹرمینل استعمال کریں

## 🐛 انسٹالیشن کے مسائل کا حل

### عام مسائل

#### اجازت نامہ مسترد (ونڈوز)
```powershell
# پاور شیل کو ایڈمنسٹریٹر کے طور پر چلائیں
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH کے مسائل
azd کو دستی طور پر PATH میں شامل کریں:

**ونڈوز:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**میک او ایس/لینکس:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### نیٹ ورک/پراکسی کے مسائل
```bash
# پراکسی ترتیب دیں
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# ایس ایس ایل کی تصدیق چھوڑ دیں (پیداواری ماحول کے لیے سفارش نہیں کی جاتی)
azd config set http.insecure true
```

#### ورژن تصادمات
```bash
# پرانی تنصیبات کو ہٹائیں
# ونڈوز: winget uninstall Microsoft.Azd
# میک او ایس: brew uninstall azd
# لینکس: sudo apt remove azd

# ترتیب صاف کریں
rm -rf ~/.azd
```

### مزید مدد حاصل کرنا
```bash
# ڈیبگ لاگنگ کو فعال کریں
export AZD_DEBUG=true
azd <command> --debug

# موجودہ ترتیب دیکھیں
azd config list

# موجودہ تعیناتی کی صورتحال دیکھیں
azd show
```

## azd کی اپڈیٹنگ

### خودکار اپڈیٹس
azd آپ کو اپڈیٹس کے دستیاب ہونے کی اطلاع دے گا:
```bash
azd version --check-for-updates
```

### دستی اپڈیٹس

**ونڈوز (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**میک او ایس (Homebrew):**
```bash
brew upgrade azd
```

**لینکس:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 اکثر پوچھے جانے والے سوالات

<details>
<summary><strong>azd اور az CLI میں کیا فرق ہے؟</strong></summary>

**Azure CLI (az)**: انفرادی Azure وسائل کے انتظام کے لیے نچلے درجے کا آلہ
- `az webapp create`, `az storage account create`
- ایک وقت میں ایک وسیلہ
- انفراسٹرکچر کے انتظام پر توجہ

**Azure Developer CLI (azd)**: مکمل ایپلیکیشن تعیناتیوں کے لیے اعلیٰ سطحی آلہ
- `azd up` تمام ایپ اور تمام وسائل کی تعیناتی کرتا ہے
- ٹیمپلیٹ پر مبنی ورک فلو
- ڈیولپر کی پیداواریت پر توجہ

**آپ کو دونوں کی ضرورت ہے**: azd توثیق کے لیے az CLI استعمال کرتا ہے
</details>

<details>
<summary><strong>کیا میں موجودہ Azure وسائل کے ساتھ azd استعمال کر سکتا ہوں؟</strong></summary>

جی ہاں! آپ کر سکتے ہیں:
1. موجودہ وسائل کو azd ماحول میں درآمد کریں
2. اپنے بائسک ٹیمپلیٹس میں موجودہ وسائل کا حوالہ دیں
3. موجودہ انفراسٹرکچر کے ساتھ نئی تعیناتیاں azd کے ذریعے کریں

تفصیلات کے لیے [ترتیب گائیڈ](configuration.md) دیکھیں۔
</details>

<details>
<summary><strong>کیا azd Azure Government یا Azure China کے ساتھ کام کرتا ہے؟</strong></summary>

جی ہاں، کلاؤڈ کو ترتیب دیں:
```bash
# Azure Government
az cloud set --name AzureUSGovernment
az login

# Azure China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>کیا میں azd CI/CD پائپ لائنز میں استعمال کر سکتا ہوں؟</strong></summary>

بلکل! azd خودکار بنانے کے لیے ڈیزائن کیا گیا ہے:
- GitHub Actions انٹیگریشن
- Azure DevOps کی حمایت
- سروس پرنسپل توثیق
- غیر تعاملی موڈ

CI/CD پیٹرنز کے لیے [تعیناتی گائیڈ](../chapter-04-infrastructure/deployment-guide.md) دیکھیں۔
</details>

<details>
<summary><strong>azd کے استعمال کی لاگت کیا ہے؟</strong></summary>

azd خود بالکل **مفت** اور اوپن سورس ہے۔ آپ صرف ادائیگی کرتے ہیں:
- Azure وسائل جو آپ تعینات کرتے ہیں
- Azure استعمال کی قیمتیں (کمپیوٹ، اسٹوریج، وغیرہ)

تعیناتی سے پہلے لاگت کا اندازہ لگانے کے لیے `azd provision --preview` استعمال کریں۔
</details>

## اگلے اقدامات

1. **توثیق مکمل کریں**: یقینی بنائیں کہ آپ Azure سبسکرپشن تک رسائی حاصل کر سکیں
2. **اپنی پہلی تعیناتی آزمائیں**: [پہلا پروجیکٹ گائیڈ](first-project.md) کی پیروی کریں
3. **ٹیمپلیٹس کو براؤز کریں**: `azd template list` کے ذریعہ دستیاب ٹیمپلیٹس دریافت کریں
4. **اپنی IDE ترتیب دیں**: اپنا ترقیاتی ماحول سیٹ اپ کریں

## مدد

اگر آپ کو مسائل کا سامنا ہو:
- [سرکاری دستاویزات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مسائل رپورٹ کریں](https://github.com/Azure/azure-dev/issues)
- [کمیونٹی گفتگو](https://github.com/Azure/azure-dev/discussions)
- [Azure سپورٹ](https://azure.microsoft.com/support/)
- [**Azure ایجنٹ اسکلز**](https://skills.sh/microsoft/github-copilot-for-azure) - `npx skills add microsoft/github-copilot-for-azure` کے ذریعے اپنے ایڈیٹر میں Azure کمانڈ رہنمائی حاصل کریں

---

**باب نیویگیشن:**
- **📚 کورس ہوم**: [نو آموزوں کے لیے AZD](../../README.md)
- **📖 موجودہ باب**: باب 1 - بنیاد اور فوری آغاز
- **⬅️ پچھلا**: [AZD کے بنیادی اصول](azd-basics.md) 
- **➡️ اگلا**: [آپ کا پہلا پروجیکٹ](first-project.md)
- **🚀 اگلا باب**: [باب 2: AI-فرسٹ ڈیولپمنٹ](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ انسٹالیشن مکمل!** azd کے ساتھ تعمیر شروع کرنے کے لیے [آپ کا پہلا پروجیکٹ](first-project.md) پر جائیں۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**دستخطی دستبرداری**:  
اس دستاویز کو AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کیا گیا ہے۔ اگرچہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم آگاہ رہیں کہ خودکار ترجموں میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں قابل اقتدار ماخذ سمجھی جانی چاہیے۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمہ کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تفسیر کی ذمہ داری ہم پر نہیں ہوگی۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->