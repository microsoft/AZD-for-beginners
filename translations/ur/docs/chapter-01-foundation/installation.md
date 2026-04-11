# انسٹالیشن اور سیٹ اپ گائیڈ

**باب نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 1 - بنیاد اور فوری آغاز
- **⬅️ پچھلا**: [AZD Basics](azd-basics.md)
- **➡️ اگلا**: [آپ کا پہلا پروجیکٹ](first-project.md)
- **🚀 اگلا باب**: [باب 2: AI-فرسٹ ڈیولپمنٹ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## تعارف

یہ مکمل رہنما آپ کو Azure Developer CLI (azd) کو اپنے سسٹم پر انسٹال اور ترتیب دینے کے مراحل سے گزرائے گا۔ آپ مختلف آپریٹنگ سسٹمز کے لیے متعدد انسٹالیشن کے طریقے، توثیق کا سیٹ اپ اور اپنے ترقیاتی ماحول کو Azure کی تعیناتیوں کے لیے تیار کرنے کے ابتدائی سیٹ اپ سیکھیں گے۔

## سیکھنے کے اہداف

اس سبق کے اختتام تک، آپ:
- اپنے آپریٹنگ سسٹم پر Azure Developer CLI کامیابی سے انسٹال کریں گے
- متعدد طریقوں سے Azure کے ساتھ توثیق مرتب کریں گے
- اپنے ترقیاتی ماحول کو ضروری قبل از شرائط کے ساتھ سیٹ اپ کریں گے
- مختلف انسٹالیشن کے آپشنز اور ان کے استعمال کا موقع سمجھیں گے
- عام انسٹالیشن اور سیٹ اپ مسائل کو حل کرنا سیکھیں گے

## سیکھنے کے نتائج

اس سبق کو مکمل کرنے کے بعد، آپ قابل ہوں گے کہ:
- اپنے پلیٹ فارم کے مطابق درست طریقہ کار سے azd انسٹال کریں
- azd auth login کے ذریعے Azure کے ساتھ توثیق کریں
- اپنی انسٹالیشن کی تصدیق کریں اور بنیادی azd کمانڈز کی جانچ کریں
- azd کے بہترین استعمال کے لیے اپنے ترقیاتی ماحول کو تشکیل دیں
- عام انسٹالیشن کے مسائل کو خود بخود حل کریں

یہ رہنما آپ کے آپریٹنگ سسٹم یا ترقیاتی ماحول سے قطع نظر Azure Developer CLI کو انسٹال اور ترتیب دینے میں مدد کرے گا۔

## قبل از شرائط

azd انسٹال کرنے سے پہلے، یقینی بنائیں کہ آپ کے پاس:
- **Azure سبسکرپشن** - [مفت اکاؤنٹ بنائیں](https://azure.microsoft.com/free/)
- **Azure CLI** - توثیق اور وسائل کے انتظام کے لیے
- **Git** - ٹیمپلیٹس کی کلوننگ اور ورژن کنٹرول کے لیے
- **Docker** (اختیاری) - کنٹینر والے ایپلیکیشنز کے لیے

## انسٹالیشن کے طریقے

### ونڈوز

#### آپشن 1: ونڈوز پیکج مینیجر (تجویز کردہ)
```cmd
winget install microsoft.azd
```

#### آپشن 2: پاور شیل انسٹال اسکرپٹ
```powershell
# مفید جب winget دستیاب نہ ہو
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### آپشن 3: چاکلیٹی
```cmd
choco install azd
```

#### آپشن 4: دستی انسٹالیشن
1. تازہ ترین ریلیز [GitHub](https://github.com/Azure/azure-dev/releases) سے ڈاؤن لوڈ کریں
2. `C:\Program Files\azd\` میں نکالیں
3. PATH ماحول متغیر میں شامل کریں

### میک او ایس

#### آپشن 1: ہوم برو (تجویز کردہ)
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
# ڈاؤن لوڈ اور انسٹال کریں
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### لینکس

#### آپشن 1: انسٹال اسکرپٹ (تجویز کردہ)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### آپشن 2: پیکج مینیجرز

**ریلیز اسیسٹ سے دستی انسٹالیشن:**
```bash
# اپنے لینکس آرکیٹیکچر کے لیے تازہ ترین آرکائیو یہاں سے ڈاؤن لوڈ کریں:
# https://github.com/Azure/azure-dev/releases
# پھر اسے نکالیں اور azd بائنری کو اپنے PATH میں شامل کریں۔
```

### GitHub Codespaces

کچھ Codespaces اور dev container ماحول پہلے سے `azd` شامل کرتے ہیں، لیکن آپ کو اسے فرض کرنے کے بجائے تصدیق کرنی چاہیے:

```bash
azd version
```

اگر `azd` موجود نہیں ہے، تو ماحولیاتی اسکرپٹ کے مطابق اسٹینڈرڈ اسکرپٹ سے انسٹال کریں۔

### ڈاکر

```bash
# ایزد کو کنٹینر میں چلائیں
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# آسان استعمال کے لئے ایک عرفی نام بنائیں
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ انسٹالیشن کی تصدیق

انسٹالیشن کے بعد، azd کے صحیح کام کرنے کی تصدیق کریں:

```bash
# ورژن چیک کریں
azd version

# مدد دیکھیں
azd --help

# دستیاب ٹیمپلیٹس کی فہرست
azd template list
```

متوقع آؤٹ پٹ:
```
azd version 1.x.x (commit xxxxxx)
```

**نوٹ**: حقیقی ورژن نمبر مختلف ہو سکتا ہے۔ تازہ ترین ورژن کے لیے [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) دیکھیں۔

**✅ انسٹالیشن کی کامیابی کا چیک لسٹ:**
- [ ] `azd version` بغیر غلطی کے ورژن نمبر دکھائے
- [ ] `azd --help` کمانڈ دستاویزات دکھائے
- [ ] `azd template list` دستیاب ٹیمپلیٹس دکھائے
- [ ] آپ ایک ٹیسٹ ڈائریکٹری بنا کر `azd init` کامیابی سے چلا سکیں

**اگر تمام چیکس کامیاب ہوں، تو آپ [آپ کے پہلے پروجیکٹ](first-project.md) کی طرف بڑھنے کے لیے تیار ہیں!**

## توثیق کا سیٹ اپ

### مبتدیوں کے لیے تجویز کردہ سیٹ اپ

AZD-فرسٹ ورک فلو کے لیے، `azd auth login` کے ذریعے سائن ان کریں۔

```bash
# AZD کمانڈز جیسے azd up کے لیے درکار
azd auth login

# AZD توثیق کی حالت کی تصدیق کریں
azd auth login --check-status
```

Azure CLI سائن ان اس وقت کریں جب آپ کورس کے دوران خود `az` کمانڈز چلانا چاہیں۔

### Azure CLI توثیق (اختیاری)
```bash
# اگر پہلے سے انسٹال نہ ہو تو Azure CLI انسٹال کریں
# ونڈوز: winget install Microsoft.AzureCLI
# میک او ایس: brew install azure-cli
# لینکس: اپنی تقسیم کیلئے Azure CLI انسٹال دستاویزات دیکھیں

# Azure میں لاگ ان کریں
az login

# توثیق کی تصدیق کریں
az account show
```

### کون سا سائن ان فلو استعمال کریں؟

- اگر آپ مبتدیوں کا AZD راستہ اپنا رہے ہیں اور زیادہ تر `azd` کمانڈز چلا رہے ہیں تو `azd auth login` استعمال کریں۔
- جب آپ Azure CLI کمانڈز مثلاً `az account show` چلانا چاہتے ہوں یا وسائل کا براہ راست معائنہ کرنا ہو تو `az login` بھی استعمال کریں۔
- اگر کسی مشق میں دونوں `azd` اور `az` کمانڈز شامل ہوں، تو شروع میں دونوں سائن ان کمانڈز ایک بار چلائیں۔

### ڈیوائس کوڈ توثیق
اگر آپ ہیدلس سسٹم استعمال کر رہے ہیں یا براؤزر کے مسائل ہیں:
```bash
azd auth login --use-device-code
```

### سروس پرنسپل (CI/CD)
خودکار ماحول کے لیے:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### اپنی مکمل سیٹ اپ کی توثیق کریں

اگر آپ باب 1 شروع کرنے سے پہلے جلدی میں چیک کرنا چاہتے ہیں:

**ونڈوز:**
```powershell
.\validate-setup.ps1
```

**میک او ایس / لینکس:**
```bash
bash ./validate-setup.sh
```

## تشکیلات

### عالمی ترتیب
```bash
# ڈیفالٹ سبسکرپشن سیٹ کریں
azd config set defaults.subscription <subscription-id>

# ڈیفالٹ مقام سیٹ کریں
azd config set defaults.location eastus2

# تمام ترتیب دیکھیں
azd config show
```

### ماحول کے متغیرات
اپنے شیل پروفائل (.bashrc, .zshrc, .profile) میں شامل کریں:
```bash
# ایژور کی ترتیب
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd کی ترتیب
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # ڈیبگ لاگنگ کو فعال کریں
```

## IDE انٹیگریشن

### Visual Studio Code
Azure Developer CLI ایکسٹینشن انسٹال کریں:
1. VS Code کھولیں
2. ایکسٹینشنز پر جائیں (Ctrl+Shift+X)
3. "Azure Developer CLI" تلاش کریں
4. ایکسٹینشن انسٹال کریں

خصوصیات:
- azure.yaml کے لیے IntelliSense
- مربوط ٹرمینل کمانڈز
- ٹیمپلیٹ براؤزنگ
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
2. Azure سندیں مرتب کریں
3. azd کمانڈز کے لیے مربوط ٹرمینل استعمال کریں

## 🐛 انسٹالیشن کے مسائل کا حل

### عام مسائل

#### اجازت نامہ مسترد (ونڈوز)
```powershell
# پاور شیل کو ایڈمنسٹریٹر کے طور پر چلائیں
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH کے مسائل
azd کو اپنے PATH میں دستی طور پر شامل کریں:

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

# ایس ایس ایل کی تصدیق کو چھوڑیں (پیداواری ماحول کے لیے سفارش نہیں کی جاتی)
azd config set http.insecure true
```

#### ورژن تصادمات
```bash
# پرانی تنصیبات کو ہٹا دیں
# ونڈوز: winget uninstall microsoft.azd
# میک او ایس: brew uninstall azd
# لینکس: دوبارہ انسٹال کرنے سے پہلے پچھلا azd بائنری یا سملنک ہٹا دیں

# ترتیب صاف کریں
rm -rf ~/.azd
```

### مزید مدد حاصل کرنا
```bash
# ڈیبگ لاگنگ کو فعال کریں
export AZD_DEBUG=true
azd <command> --debug

# موجودہ ترتیب دیکھیں
azd config show

# موجودہ تعیناتی کی حیثیت دیکھیں
azd show
```

## azd کو اپ ڈیٹ کرنا

### اپ ڈیٹ چیک
azd نوٹس دیتا ہے جب نیا ورژن دستیاب ہوتا ہے، اور آپ اپنے موجودہ ورژن کی تصدیق کر سکتے ہیں:
```bash
azd version
```

### دستی اپ ڈیٹس

**ونڈوز (winget):**
```cmd
winget upgrade microsoft.azd
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

**Azure CLI (az)**: کم سطح کا آلہ انفرادی Azure وسائل کے انتظام کے لیے
- `az webapp create`, `az storage account create`
- ایک وقت میں ایک وسیلہ
- بنیادی توجہ انفراسٹرکچر مینجمنٹ پر

**Azure Developer CLI (azd)**: اعلی سطح کا آلہ مکمل ایپلیکیشن تعیناتیوں کے لیے
- `azd up` پوری ایپ اور تمام وسائل کی تعیناتی کرتا ہے
- ٹیمپلیٹ پر مبنی ورک فلو
- ڈیولپر کی پیداواریت پر توجہ

**آپ کو دونوں کی ضرورت ہے**: azd توثیق کے لیے az CLI استعمال کرتا ہے
</details>

<details>
<summary><strong>کیا میں موجودہ Azure وسائل کے ساتھ azd استعمال کر سکتا ہوں؟</strong></summary>

جی ہاں! آپ:
1. موجودہ وسائل کو azd ماحول میں درآمد کر سکتے ہیں
2. Bicep ٹیمپلیٹس میں موجودہ وسائل کا حوالہ دے سکتے ہیں
3. نئی تعیناتیوں کے لیے azd استعمال کر سکتے ہیں جو موجودہ انفراسٹرکچر کے ساتھ ہیں

تفصیلات کے لیے [Configuration Guide](configuration.md) دیکھیں۔
</details>

<details>
<summary><strong>کیا azd Azure Government یا Azure China کے ساتھ کام کرتا ہے؟</strong></summary>

جی ہاں، کلاؤڈ کو ترتیب دیں:
```bash
# ایزور حکومت
az cloud set --name AzureUSGovernment
az login

# ایزور چین
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>کیا میں azd کو CI/CD پائپ لائنز میں استعمال کر سکتا ہوں؟</strong></summary>

بالکل! azd آٹومیشن کے لیے ڈیزائن کیا گیا ہے:
- GitHub Actions انٹیگریشن
- Azure DevOps کی حمایت
- سروس پرنسپل توثیق
- غیر مداخلتی وضع

CI/CD کے انداز کے لیے دیکھیں [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md).
</details>

<details>
<summary><strong>azd کے استعمال کی قیمت کیا ہے؟</strong></summary>

azd خود **مکمل طور پر مفت** اور اوپن سورس ہے۔ آپ صرف ان چیزوں کی قیمت ادا کرتے ہیں:
- وہ Azure وسائل جو آپ تعینات کرتے ہیں
- Azure کے استعمال کی قیمتیں (کمپیوٹ، اسٹوریج، وغیرہ)

تعیناتی سے پہلے لاگت کا اندازہ لگانے کے لیے `azd provision --preview` استعمال کریں۔
</details>

## اگلے اقدامات

1. **توثیق مکمل کریں**: یقینی بنائیں کہ آپ Azure سبسکرپشن تک رسائی حاصل کر سکتے ہیں
2. **اپنی پہلی تعیناتی آزمائیں**: [First Project Guide](first-project.md) پر عمل کریں
3. **ٹیمپلیٹس دریافت کریں**: `azd template list` سے دستیاب ٹیمپلیٹس دیکھیں
4. **اپنا IDE ترتیب دیں**: اپنا ترقیاتی ماحول سیٹ اپ کریں

## سپورٹ

اگر آپ کو مسائل کا سامنا ہو:
- [سرکاری دستاویزات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مسائل رپورٹ کریں](https://github.com/Azure/azure-dev/issues)
- [کمیونٹی مباحثے](https://github.com/Azure/azure-dev/discussions)
- [Azure سپورٹ](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - `npx skills add microsoft/github-copilot-for-azure` کے ذریعے اپنے ایڈیٹر میں براہ راست Azure کمانڈ کی رہنمائی پائیں

---

**باب نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 1 - بنیاد اور فوری آغاز
- **⬅️ پچھلا**: [AZD Basics](azd-basics.md) 
- **➡️ اگلا**: [آپ کا پہلا پروجیکٹ](first-project.md)
- **🚀 اگلا باب**: [باب 2: AI-فرسٹ ڈیولپمنٹ](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ انسٹالیشن مکمل!** azd کے ساتھ بنانا شروع کرنے کے لیے جاری رکھیں [آپ کا پہلا پروجیکٹ](first-project.md) پر۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**اعلانِ دستبرد**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کی کوشش کرتے ہیں، براہ کرم یاد رکھیں کہ خودکار تراجم میں غلطیاں یا عدم صحت ہو سکتی ہے۔ اصل دستاویز اپنی مادری زبان میں ہی مستند ماخذ سمجھی جانی چاہیے۔ اہم معلومات کے لیے، پیشہ ورانہ انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم پر نہیں ہوگی۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->