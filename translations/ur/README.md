# AZD برائے مبتدیان: ایک منظم تعلیمی سفر

![AZD-for-beginners](../../translated_images/ur/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### خودکار تراجم (ہمیشہ تازہ ترین)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](./README.md) | [Vietnamese](../vi/README.md)

> **ترجیح ہے کہ لوکل کلون کریں؟**
>
> اس ریپوزیٹری میں 50+ زبانوں کے تراجم شامل ہیں جو ڈاؤن لوڈ سائز کو نمایاں طور پر بڑھاتے ہیں۔ بغیر تراجم کے کلون کرنے کے لیے sparse checkout استعمال کریں:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> یہ آپ کو کورس مکمل کرنے کے لیے تمام ضروری مواد زیادہ تیزی سے ڈاؤن لوڈ کرنے کی سہولت دیتا ہے۔
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd) کیا ہے؟

**Azure Developer CLI (azd)** ایک ڈویلپر فرینڈلی کمانڈ لائن ٹول ہے جو Azure پر ایپلیکیشنز کو تعینات کرنا آسان بناتا ہے۔ درجنوں Azure ریسورسز کو دستی طور پر بنانے اور جوڑنے کے بجائے، آپ ایک کمانڈ کے ذریعے مکمل ایپلیکیشنز تعینات کر سکتے ہیں۔

### `azd up` کا جادو

```bash
# یہ واحد کمانڈ سب کچھ کرتی ہے:
# ✅ تمام Azure وسائل تخلیق کرتا ہے
# ✅ نیٹ ورکنگ اور سیکیورٹی کو ترتیب دیتا ہے
# ✅ آپ کے ایپلیکیشن کوڈ کو بناتا ہے
# ✅ Azure پر تعینات کرتا ہے
# ✅ آپ کو ایک فعال URL فراہم کرتا ہے
azd up
```

**بس یہی!** کوئی Azure پورٹل پر کلکنگ نہیں، کوئی پیچیدہ ARM ٹیمپلیٹس سیکھنے کی ضرورت نہیں، کوئی دستی ترتیب نہیں — صرف کام کرنے والی ایپلیکیشنز Azure پر۔

---

## ❓ Azure Developer CLI اور Azure CLI: کیا فرق ہے؟

یہ مبتدیوں کی سب سے عام پوچھے جانے والا سوال ہے۔ جواب سادہ ہے:

| خصوصیت | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **مقصد** | الگ الگ Azure ریسورسز کا انتظام کرنا | مکمل ایپلیکیشنز تعینات کرنا |
| **ذہنیت** | انفراسٹرکچر پر توجہ | ایپلیکیشن پر توجہ |
| **مثال** | `az webapp create --name myapp...` | `azd up` |
| **سیکھنے کا منحنی** | Azure خدمات جاننا ضروری ہے | صرف اپنی ایپ جانیں |
| **سب سے بہتر** | ڈیو اوپس، انفراسٹرکچر | ڈویلپرز، پروٹو ٹائپنگ |

### آسان تشبیہ

- **Azure CLI** ایسے ہے جیسے کسی گھر کی تعمیر کے لیے تمام اوزار موجود ہوں — ہتھوڑے، آری، کیل۔ آپ کچھ بھی بنا سکتے ہیں، لیکن تعمیر کی معلومات ہونی چاہیے۔
- **Azure Developer CLI** ایک ٹھیکیدار کی طرح ہے — آپ بتاتے ہیں کہ کیا چاہیے اور وہ تعمیر کا کام سنبھالتا ہے۔

### کب کون سا استعمال کریں

| صورتحال | یہ استعمال کریں |
|----------|----------|
| "میں اپنی ویب ایپ جلدی تعینات کرنا چاہتا ہوں" | `azd up` |
| "مجھے صرف ایک اسٹوریج اکاؤنٹ بنانا ہے" | `az storage account create` |
| "میں ایک مکمل AI ایپ بنا رہا ہوں" | `azd init --template azure-search-openai-demo` |
| "مجھے کسی مخصوص Azure ریسورس کی ڈیبگنگ کرنی ہے" | `az resource show` |
| "میں چند منٹوں میں پروڈکشن ریڈی تعیناتی چاہتا ہوں" | `azd up --environment production` |

### یہ آپس میں کام کرتے ہیں!

AZD کے پیچھے Azure CLI کام کر رہا ہے۔ آپ دونوں استعمال کر سکتے ہیں:
```bash
# اپنی ایپ کو AZD کے ساتھ تعینات کریں
azd up

# پھر Azure CLI کے ذریعے مخصوص وسائل کو باریک بینی سے ترتیب دیں
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD میں ٹیمپلیٹس تلاش کریں

خاکہ سے شروع نہ کریں! **Awesome AZD** کمیونٹی کا مجموعہ ہے جہاں تعینات کرنے کے لیے تیار ٹیمپلیٹس دستیاب ہیں:

| ریسورس | تفصیل |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | ایک کلک تعیناتی کے ساتھ 200+ ٹیمپلیٹس براؤز کریں |
| 🔗 [**ٹیپلیٹ جمع کروائیں**](https://github.com/Azure/awesome-azd/issues) | اپنی ٹیمپلیٹ کمیونٹی میں شامل کریں |
| 🔗 [**GitHub ریپوزیٹری**](https://github.com/Azure/awesome-azd) | اسٹار کریں اور سورس دیکھیں |

### Awesome AZD سے مقبول AI ٹیمپلیٹس

```bash
# RAG چیٹ Azure OpenAI اور AI سرچ کے ساتھ
azd init --template azure-search-openai-demo

# فوری AI چیٹ ایپلیکیشن
azd init --template openai-chat-app-quickstart

# Foundry Agents کے ساتھ AI ایجنٹس
azd init --template get-started-with-ai-agents
```

---

## 🎯 تین مراحل میں شروع کریں

### مرحلہ 1: AZD انسٹال کریں (2 منٹ)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### مرحلہ 2: Azure میں لاگ ان کریں

```bash
azd auth login
```

### مرحلہ 3: اپنی پہلی ایپ تعینات کریں

```bash
# سانچے سے شروعات کریں
azd init --template todo-nodejs-mongo

# Azure پر تعینات کریں (سب کچھ بناتا ہے!)
azd up
```

**🎉 بس یہی!** آپ کی ایپ اب Azure پر لائیو ہے۔

### صفائی کریں (یاد رکھیں!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 اس کورس کا استعمال کیسے کریں

یہ کورس **تدریجی سیکھنے** کے لیے ڈیزائن کیا گیا ہے — جہاں آپ آرام دہ ہوں وہاں سے شروع کریں اور آہستہ آہستہ آگے بڑھیں:

| آپ کا تجربہ | یہاں سے شروع کریں |
|-----------------|------------|
| **Azure میں بالکل نیا** | [باب 1: بنیاد](../..) |
| **Azure جانتے ہیں، AZD نئے ہیں** | [باب 1: بنیاد](../..) |
| **AI ایپس تعینات کرنا چاہتے ہیں** | [باب 2: AI-اول ترقی](../..) |
| **عملی تجربہ چاہتے ہیں** | [🎓 انٹرایکٹو ورکشاپ](workshop/README.md) - 3-4 گھنٹے کا رہنمائی والا لیب |
| **پروڈکشن پیٹرنز چاہیے** | [باب 8: پروڈکشن اور انٹرپرائز](../..) |

### جلدی ترتیب

1. **اس ریپوزیٹری کو فورک کریں**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **کلون کریں**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **مدد حاصل کریں**: [Azure Discord کمیونٹی](https://discord.com/invite/ByRwuEEgH4)

> **ترجیح ہے کہ لوکل کلون کریں؟**

> اس ریپوزیٹری میں 50+ زبانوں کے تراجم شامل ہیں جو ڈاؤن لوڈ سائز کو نمایاں طور پر بڑھاتے ہیں۔ بغیر تراجم کے کلون کرنے کے لیے sparse checkout استعمال کریں:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> یہ آپ کو کورس مکمل کرنے کے لیے تمام ضروری مواد زیادہ تیزی سے ڈاؤن لوڈ کرنے کی سہولت دیتا ہے۔

## کورس کا جائزہ

Azure Developer CLI (azd) پر عبور حاصل کریں، منظم ابواب کے ذریعے جو تدریجی سیکھنے کے لیے ترتیب دیے گئے ہیں۔ **خصوصی توجہ Microsoft Foundry انٹیگریشن کے ساتھ AI ایپلیکیشنز کی تعیناتی پر۔**

### یہ کورس جدید ڈویلپرز کے لیے کیوں ضروری ہے

Microsoft Foundry Discord کمیونٹی کی معلومات کی بنیاد پر، **45٪ ڈویلپرز AZD کو AI ورک لوڈز کے لیے استعمال کرنا چاہتے ہیں** لیکن درج ذیل چیلنجز کا سامنا کرتے ہیں:
- پیچیدہ کثیر الخدمت AI آرکیٹیکچرز
- پروڈکشن AI تعیناتی کی بہترین عملی حکمت عملی  
- Azure AI سروس انٹیگریشن اور ترتیب
- AI ورک لوڈز کے لیے لاگت میں بہتری
- AI مخصوص تعیناتی کے مسائل کو حل کرنا

### سیکھنے کے مقاصد

اس منظم کورس کو مکمل کرکے، آپ:
- **AZD کی بنیادی باتیں سیکھیں گے**: بنیادی تصورات، تنصیب، اور ترتیب
- **AI ایپلیکیشنز تعینات کریں گے**: Microsoft Foundry خدمات کے ساتھ AZD استعمال کریں
- **انفراسٹرکچر از کوڈ نافذ کریں گے**: Bicep ٹیمپلیٹس کے ذریعے Azure ریسورسز کا انتظام کریں
- **تعیناتی کے مسائل حل کریں گے**: عمومی مسائل کے حل اور ڈیبگنگ
- **پروڈکشن کے لیے بہتر بنائیں گے**: سیکیورٹی، اسکیلنگ، مانیٹرنگ، اور لاگت کا انتظام
- **متعدد ایجنٹ والے حل بنائیں گے**: پیچیدہ AI آرکیٹیکچرز تعینات کریں

## 🗺️ کورس نقشہ: باب وار تیز نیویگیشن

ہر باب کی اپنی ایک README ہے جس میں سیکھنے کے مقاصد، جلدی آغاز، اور مشقیں شامل ہیں:

| باب | موضوع | اسباق | دورانیہ | پیچیدگی |
|---------|-------|---------|----------|------------|
| **[باب 1: بنیاد](docs/chapter-01-foundation/README.md)** | شروع کرنا | [AZD کی بنیادی باتیں](docs/chapter-01-foundation/azd-basics.md) &#124; [تنصیب](docs/chapter-01-foundation/installation.md) &#124; [پہلا پروجیکٹ](docs/chapter-01-foundation/first-project.md) | 30-45 منٹ | ⭐ |
| **[باب 2: AI کی ترقی](docs/chapter-02-ai-development/README.md)** | AI پہلے ایپلیکیشنز | [Foundry انٹیگریشن](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI ایجنٹس](docs/chapter-02-ai-development/agents.md) &#124; [ماڈل تعیناتی](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ورکشاپ](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 گھنٹے | ⭐⭐ |
| **[باب 3: ترتیب](docs/chapter-03-configuration/README.md)** | تصدیق اور سیکیورٹی | [ترتیب](docs/chapter-03-configuration/configuration.md) &#124; [تصدیق اور سیکیورٹی](docs/chapter-03-configuration/authsecurity.md) | 45-60 منٹ | ⭐⭐ |
| **[باب 4: بنیادی ڈھانچہ](docs/chapter-04-infrastructure/README.md)** | IaC اور تعیناتی | [تعیناتی کی رہنما](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [پروویژننگ](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 گھنٹے | ⭐⭐⭐ |
| **[باب 5: ملٹی ایجنٹ](docs/chapter-05-multi-agent/README.md)** | AI ایجنٹ حل | [ریٹیل منظرنامہ](examples/retail-scenario.md) &#124; [رابطہ سازی کے پیٹرنز](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 گھنٹے | ⭐⭐⭐⭐ |
| **[باب 6: پری-ڈپلائمنٹ](docs/chapter-06-pre-deployment/README.md)** | منصوبہ بندی اور تصدیق | [پری فلائٹ چیکز](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [کیپیسٹی پلاننگ](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU انتخاب](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [ایپ انسائٹس](docs/chapter-06-pre-deployment/application-insights.md) | 1 گھنٹہ | ⭐⭐ |
| **[باب 7: مسئلہ حل کرنا](docs/chapter-07-troubleshooting/README.md)** | ڈیبگ اور درستگی | [عام مسائل](docs/chapter-07-troubleshooting/common-issues.md) &#124; [ڈیبگنگ](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI مسائل](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 گھنٹے | ⭐⭐ |
| **[باب 8: پیداوار](docs/chapter-08-production/README.md)** | انٹرپرائز پیٹرنز | [پیداواری طریقے](docs/chapter-08-production/production-ai-practices.md) | 2-3 گھنٹے | ⭐⭐⭐⭐ |
| **[🎓 ورکشاپ](workshop/README.md)** | عملی تجرباتی لیب | [تعارف](workshop/docs/instructions/0-Introduction.md) &#124; [انتخاب](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [تصدیق](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [تجزیہ](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [ترتیب](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [حسب ضرورت](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [خاتمہ](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [اختتام](workshop/docs/instructions/7-Wrap-up.md) | 3-4 گھنٹے | ⭐⭐ |

**کل کورس کی مدت:** تقریباً 10-14 گھنٹے | **مہارت کی ترقی:** مبتدی → پیداوار کے لیے تیار

---

## 📚 سیکھنے والے ابواب

*اپنے تجربے اور مقاصد کی بنیاد پر سیکھنے کا راستہ منتخب کریں*

### 🚀 باب 1: بنیاد اور فوری آغاز
**پیشگی شرائط**: Azure سبسکرپشن، بنیادی کمانڈ لائن کا علم  
**مدت**: 30-45 منٹ  
**پیچیدگی**: ⭐

#### آپ کیا سیکھیں گے
- Azure ڈیولپر CLI کے بنیادی اصولوں کو سمجھنا
- اپنے پلیٹ فارم پر AZD انسٹال کرنا
- آپ کی پہلی کامیاب تعیناتی

#### سیکھنے کے وسائل
- **🎯 یہاں سے شروع کریں**: [Azure Developer CLI کیا ہے؟](../..)
- **📖 نظریہ**: [AZD بنیادیات](docs/chapter-01-foundation/azd-basics.md) - بنیادی تصورات اور اصطلاحات
- **⚙️ سیٹ اپ**: [انسٹالیشن اور سیٹ اپ](docs/chapter-01-foundation/installation.md) - پلیٹ فارم مخصوص گائیڈز
- **🛠️ عملی**: [آپ کا پہلا منصوبہ](docs/chapter-01-foundation/first-project.md) - مرحلہ وار ٹیوٹوریل
- **📋 جلدی حوالہ**: [کمانڈ چیٹ شیٹ](resources/cheat-sheet.md)

#### عملی مشقیں
```bash
# تیز ترین تنصیب کی جانچ
azd version

# اپنی پہلی درخواست شائع کریں
azd init --template todo-nodejs-mongo
azd up
```

**💡 باب کا نتیجہ**: AZD استعمال کرتے ہوئے آسان ویب ایپلیکیشن کی کامیاب تعیناتی

**✅ کامیابی کی تصدیق:**
```bash
# باب 1 مکمل کرنے کے بعد، آپ قادر ہوں گے:
azd version              # نصب شدہ ورژن دکھاتا ہے
azd init --template todo-nodejs-mongo  # پراجیکٹ کا آغاز کرتا ہے
azd up                  # ایزور پر تعینات کرتا ہے
azd show                # چلنے والی ایپ کا یو آر ایل دکھاتا ہے
# ایپلیکیشن براؤزر میں کھلتی ہے اور کام کرتی ہے
azd down --force --purge  # وسائل کو صاف کرتا ہے
```

**📊 وقت کی سرمایہ کاری:** 30-45 منٹ  
**📈 بعد کی مہارت کی سطح:** بنیادی ایپلیکیشنز آزادانہ طور پر تعینات کرسکتا ہے

**✅ کامیابی کی تصدیق:**
```bash
# باب 1 مکمل کرنے کے بعد، آپ کو قابل ہونا چاہئے:
azd version              # انسٹال شدہ ورژن دکھاتا ہے
azd init --template todo-nodejs-mongo  # پروجیکٹ کو شروع کرتا ہے
azd up                  # ایزور پر تعینات کرتا ہے
azd show                # چل رہی ایپ کا URL دکھاتا ہے
# ایپلیکیشن براؤزر میں کھلتی ہے اور کام کرتی ہے
azd down --force --purge  # وسائل کو صاف کرتا ہے
```

**📊 وقت کی سرمایہ کاری:** 30-45 منٹ  
**📈 بعد کی مہارت کی سطح:** بنیادی ایپلیکیشنز آزادانہ طور پر تعینات کرسکتا ہے

---

### 🤖 باب 2: AI-فرسٹ ڈیولپمنٹ (AI ڈویلپرز کے لیے سفارش کی گئی)
**پیشگی شرائط**: باب 1 مکمل ہوا ہو  
**مدت**: 1-2 گھنٹے  
**پیچیدگی**: ⭐⭐

#### آپ کیا سیکھیں گے
- Microsoft Foundry کا AZD کے ساتھ انضمام
- AI سے طاقتور ایپلیکیشنز کی تعیناتی
- AI سروس ترتیبات کو سمجھنا

#### سیکھنے کے وسائل
- **🎯 یہاں سے شروع کریں**: [Microsoft Foundry انضمام](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI ایجنٹس**: [AI ایجنٹس کی گائڈ](docs/chapter-02-ai-development/agents.md) - AZD کے ساتھ ذہین ایجنٹس کی تعیناتی
- **📖 پیٹرنز**: [AI ماڈل کی تعیناتی](docs/chapter-02-ai-development/ai-model-deployment.md) - AI ماڈلز کی تعیناتی اور انتظام
- **🛠️ ورکشاپ**: [AI ورکشاپ لیب](docs/chapter-02-ai-development/ai-workshop-lab.md) - اپنے AI حلین کو AZD کے لیے تیار کریں
- **🎥 انٹرایکٹو گائیڈ**: [ورکشاپ مواد](workshop/README.md) - MkDocs * DevContainer ماحول میں براؤزر پر مبنی سیکھنا
- **📋 ٹیمپلیٹس**: [Microsoft Foundry ٹیمپلیٹس](../..)
- **📝 مثالیں**: [AZD تعیناتی کی مثالیں](examples/README.md)

#### عملی مشقیں
```bash
# اپنا پہلا اے آئی ایپلیکیشن تعینات کریں
azd init --template azure-search-openai-demo
azd up

# اضافی اے آئی سانچے آزماﺅ
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 باب کا نتیجہ**: RAG صلاحیتوں کے ساتھ AI طاقتور چیٹ ایپلیکیشن کی تعیناتی اور ترتیب

**✅ کامیابی کی تصدیق:**
```bash
# باب ۲ کے بعد، آپ کو یہ کرنا آنا چاہیے:
azd init --template azure-search-openai-demo
azd up
# AI چیٹ انٹرفیس کا ٹیسٹ کریں
# سوالات پوچھیں اور ماخذات کے ساتھ AI کی مدد سے جوابات حاصل کریں
# تلاش کی انضمام کی تصدیق کریں کہ یہ کام کر رہا ہے
azd monitor  # ایپلیکیشن انسائٹس میں ٹیلیمیٹری کا ظاہر ہونا چیک کریں
azd down --force --purge
```

**📊 وقت کی سرمایہ کاری:** 1-2 گھنٹے  
**📈 بعد کی مہارت کی سطح:** پیداوار کے لیے تیار AI ایپلیکیشنز کی تعیناتی اور ترتیب  
**💰 لاگت کی آگاہی:** $80-150/ماہ ترقیاتی قیمت، $300-3500/ماہ پیداوار قیمت سے واقفیت

#### 💰 AI تعیناتی کے لیے لاگت کے پہلو

**ترقیاتی ماحول (تخمینی $80-150/ماہ):**
- Azure OpenAI (ادائیگی کے مطابق): $0-50/ماہ (ٹوکن کے استعمال کی بنیاد پر)
- AI تلاش (بنیادی سطح): $75/ماہ
- کنٹینر ایپس (صارفیت کے مطابق): $0-20/ماہ
- اسٹوریج (معیاری): $1-5/ماہ

**پیداوار کا ماحول (تخمینی $300-3500+/ماہ):**
- Azure OpenAI (مانگ کے لیے PTU): $3,000+/ماہ یا زیادہ استعمال کے ساتھ ادائیگی
- AI تلاش (معیاری سطح): $250/ماہ
- کنٹینر ایپس (مختص): $50-100/ماہ
- ایپلیکیشن انسائٹس: $5-50/ماہ
- اسٹوریج (پریمیم): $10-50/ماہ

**💡 لاگت کو بہتر بنانے کے نکات:**
- سیکھنے کے لیے **Free Tier** Azure OpenAI استعمال کریں (50,000 ٹوکن/ماہ شامل)
- جب ترقی میں نہ ہوں تو `azd down` چلائیں تاکہ وسائل کو غیر مختص کیا جا سکے
- صارفیت کی بنیاد پر بلنگ سے شروع کریں، صرف پیداوار میں PTU پر اپ گریڈ کریں
- تعیناتی سے پہلے `azd provision --preview` سے لاگت کا تخمینہ لگائیں
- آٹو اسکیلنگ فعال کریں: صرف اصل استعمال کی ادائیگی کریں

**لاگت کی نگرانی:**
```bash
# تخمینہ شدہ ماہانہ اخراجات چیک کریں
azd provision --preview

# Azure پورٹل میں حقیقی اخراجات کی نگرانی کریں
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ باب 3: ترتیب اور تصدیق
**پیشگی شرائط**: باب 1 مکمل ہوا ہو  
**مدت**: 45-60 منٹ  
**پیچیدگی**: ⭐⭐

#### آپ کیا سیکھیں گے
- ماحول کی ترتیب اور انتظام
- تصدیق اور سیکورٹی کے بہترین طریقے
- وسائل کے نام اور تنظیم

#### سیکھنے کے وسائل
- **📖 ترتیب**: [ترتیب کی رہنما](docs/chapter-03-configuration/configuration.md) - ماحول کی ترتیب
- **🔐 سیکورٹی**: [تصدیقی پیٹرنز اور مینیجڈ شناخت](docs/chapter-03-configuration/authsecurity.md) - تصدیقی طریقے
- **📝 مثالیں**: [ڈیٹابیس ایپ کی مثال](examples/database-app/README.md) - AZD ڈیٹابیس کی مثالیں

#### عملی مشقیں
- متعدد ماحول (dev, staging, prod) کی ترتیب دیں
- مینیجڈ شناخت کی تصدیق قائم کریں
- ماحول مخصوص ترتیبات نافذ کریں

**💡 باب کا نتیجہ**: مناسب تصدیق اور سیکورٹی کے ساتھ متعدد ماحول کا انتظام کریں

---

### 🏗️ باب 4: بنیادی ڈھانچہ بطور کوڈ اور تعیناتی
**پیشگی شرائط**: ابواب 1-3 مکمل ہو چکے ہوں  
**مدت**: 1-1.5 گھنٹے  
**پیچیدگی**: ⭐⭐⭐

#### آپ کیا سیکھیں گے
- جدید تعیناتی کے نمونے
- Bicep کے ساتھ بنیادی ڈھانچہ بطور کوڈ
- وسائل کی پروویژننگ حکمت عملیاں

#### سیکھنے کے وسائل
- **📖 تعیناتی**: [تعیناتی کی رہنما](docs/chapter-04-infrastructure/deployment-guide.md) - مکمل ورک فلو
- **🏗️ پروویژننگ**: [وسائل کی پروویژننگ](docs/chapter-04-infrastructure/provisioning.md) - Azure وسائل کا نظم
- **📝 مثالیں**: [کنٹینر ایپ مثال](../../examples/container-app) - کنٹینرائزڈ تعیناتیاں

#### عملی مشقیں
- کسٹم Bicep ٹیمپلیٹس بنائیں
- ملٹی سروس ایپلیکیشنز تعینات کریں
- بلیو-گرین تعیناتی حکمت عملیاں نافذ کریں

**💡 باب کا نتیجہ**: کسٹم بنیادی ڈھانچہ ٹیمپلیٹس کے ذریعے پیچیدہ ملٹی سروس ایپلیکیشنز تعینات کریں

---

### 🎯 باب 5: ملٹی ایجنٹ AI حل (اعلیٰ سطح)
**پیشگی شرائط**: ابواب 1-2 مکمل ہو چکے ہوں  
**مدت**: 2-3 گھنٹے  
**پیچیدگی**: ⭐⭐⭐⭐

#### آپ کیا سیکھیں گے
- ملٹی ایجنٹ آرکیٹیکچر کے نمونے
- ایجنٹ کے آرکیسٹریشن اور رابطہ کاری
- پیداوار کے لیے تیار AI تعیناتیاں

#### سیکھنے کے وسائل
- **🤖 نمایاں منصوبہ**: [ریٹیل ملٹی ایجنٹ حل](examples/retail-scenario.md) - مکمل نفاذ
- **🛠️ ARM ٹیمپلیٹس**: [ARM ٹیمپلیٹ پیکیج](../../examples/retail-multiagent-arm-template) - ون کلک تعیناتی
- **📖 آرکیٹیکچر**: [ملٹی ایجنٹ رابطہ کاری کے نمونے](docs/chapter-06-pre-deployment/coordination-patterns.md) - پیٹرنز

#### عملی مشقیں
```bash
# مکمل ریٹیل ملٹی ایجنٹ حل کی تعیناتی کریں
cd examples/retail-multiagent-arm-template
./deploy.sh

# ایجنٹ کی ترتیبات کو دریافت کریں
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 باب کا نتیجہ**: کسٹمر اور انوینٹری ایجنٹس کے ساتھ پیداوار کے لیے تیار ملٹی ایجنٹ AI حل تعینات اور منظم کریں

---

### 🔍 باب 6: پری-ڈپلائمنٹ تصدیق اور منصوبہ بندی
**پیشگی شرائط**: باب 4 مکمل ہو چکا ہو  
**مدت**: 1 گھنٹہ  
**پیچیدگی**: ⭐⭐

#### آپ کیا سیکھیں گے
- صلاحیت کی منصوبہ بندی اور وسائل کی تصدیق
- SKU انتخاب کی حکمت عملیاں
- پری-فلائٹ چیکز اور خودکار اقدامات

#### سیکھنے کے وسائل
- **📊 منصوبہ بندی**: [کیپیسٹی پلاننگ](docs/chapter-06-pre-deployment/capacity-planning.md) - وسائل کی تصدیق
- **💰 انتخاب**: [SKU انتخاب](docs/chapter-06-pre-deployment/sku-selection.md) - لاگت مؤثر انتخاب
- **✅ تصدیق**: [پری-فلائٹ چیکز](docs/chapter-06-pre-deployment/preflight-checks.md) - خودکار اسکرپٹس

#### عملی مشقیں
- کیپیسٹی تصدیقی اسکرپٹس چلائیں
- لاگت کے لیے SKU انتخاب کو بہتر بنائیں
- خودکار پری ڈپلائمنٹ چیکز نافذ کریں

**💡 باب کا نتیجہ**: تعیناتی سے پہلے تصدیق اور اصلاح کریں

---

### 🚨 باب 7: مسئلہ حل کرنا اور ڈیبگنگ
**پیشگی شرائط**: کوئی بھی تعیناتی باب مکمل ہو  
**مدت**: 1-1.5 گھنٹے  
**پیچیدگی**: ⭐⭐

#### آپ کیا سیکھیں گے
- منظم ڈیبگنگ کے طریقے
- عام مسائل اور حل
- AI مخصوص مسئلہ حل

#### سیکھنے کے وسائل
- **🔧 عام مسائل**: [عام مسائل](docs/chapter-07-troubleshooting/common-issues.md) - اکثر پوچھے جانے والے سوالات اور حل
- **🕵️‍♂️ ڈیبگنگ**: [ڈیبگنگ گائیڈ](docs/chapter-07-troubleshooting/debugging.md) - مرحلہ وار حکمت عملیاں
- **🤖 AI مسائل**: [AI مخصوص مسئلہ حل](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI سروس کے مسائل

#### عملی مشقیں
- تعیناتی کی ناکامیوں کی تشخیص کریں
- تصدیقی مسائل حل کریں
- AI سروس کنیکٹیویٹی کی ڈیبگنگ کریں

**💡 باب کا نتیجہ**: عام تعیناتی مسائل کا خود مختار تشخیص اور حل

---

### 🏢 باب 8: پیداوار اور انٹرپرائز پیٹرنز
**پیشگی شرائط**: ابواب 1-4 مکمل ہو چکے ہوں  
**مدت**: 2-3 گھنٹے  
**پیچیدگی**: ⭐⭐⭐⭐

#### آپ کیا سیکھیں گے
- پیداوار کی تعیناتی کی حکمت عملیاں
- انٹرپرائز سیکورٹی کے نمونے
- نگرانی اور لاگت کی اصلاح

#### سیکھنے کے وسائل
- **🏭 پیداوار**: [پیداواری AI بہترین طریقے](docs/chapter-08-production/production-ai-practices.md) - انٹرپرائز پیٹرنز
- **📝 مثالیں**: [مائیکرو سروسز کی مثال](../../examples/microservices) - پیچیدہ آرکیٹیکچر
- **📊 نگرانی**: [ایپلیکیشن انسائٹس انضمام](docs/chapter-06-pre-deployment/application-insights.md) - نگرانی

#### عملی مشقیں
- انٹرپرائز سیکورٹی پیٹرنز نافذ کریں
- مکمل نگرانی قائم کریں
- مناسب حکمرانی کے ساتھ پیداوار میں تعینات کریں

**💡 باب کا نتیجہ**: مکمل پیداوار کی صلاحیت کے ساتھ انٹرپرائز کے لیے تیار ایپلیکیشنز کی تعیناتی

---

## 🎓 ورکشاپ کا جائزہ: عملی تعلیمی تجربہ

> **⚠️ ورکشاپ کی حالت: فعال ترقی**  
> ورکشاپ کے مواد اس وقت تیار اور بہتر کیے جا رہے ہیں۔ بنیادی ماڈیول فعال ہیں، لیکن کچھ اعلیٰ درجے کے حصے نا مکمل ہیں۔ ہم تمام مواد مکمل کرنے کے لیے سرگرمی سے کام کر رہے ہیں۔ [ترقی کا سراغ لگائیں →](workshop/README.md)

### انٹرایکٹو ورکشاپ مواد  
**براوزر پر مبنی ٹولز اور رہنمائی شدہ مشقوں کے ساتھ جامع عملی سیکھنے کا تجربہ**

ہمارا ورکشاپ مواد ایک منظم، انٹرایکٹو سیکھنے کا تجربہ فراہم کرتا ہے جو اوپر دیے گئے باب پر مبنی نصاب کی تکمیل کرتا ہے۔ ورکشاپ کو خود رفتاری سیکھنے اور انسٹرکٹر کی رہنمائی میں سیشنز دونوں کے لیے ڈیزائن کیا گیا ہے۔

#### 🛠️ ورکشاپ خصوصیات  
- **براوزر پر مبنی انٹرفیس**: تلاش، کاپی، اور تھیم خصوصیات کے ساتھ مکمل MkDocs سے چلنے والا ورکشاپ  
- **GitHub Codespaces انٹیگریشن**: ایک کلک میں ترقیاتی ماحول کی ترتیب  
- **منظم سیکھنے کا راستہ**: 8 ماڈیول پر مشتمل رہنمائی شدہ مشقیں (کل 3-4 گھنٹے)  
- **ترقی یافتہ طریقہ کار**: تعارف → انتخاب → توثیق → تجزیہ → ترتیب → تخصیص → صفائی → خلاصہ  
- **انٹرایکٹو DevContainer ماحول**: پہلے سے ترتیب دیے گئے ٹولز اور انحصارات  

#### 📚 ورکشاپ ماڈیول کی ساخت  
ورکشاپ ایک **8 ماڈیول پر مشتمل ترقی پذیر طریقہ کار** کی پیروی کرتا ہے جو آپ کو دریافت سے لے کر تعیناتی میں مہارت تک لے جاتا ہے:

| ماڈیول | موضوع | آپ کیا کریں گے | دورانیہ |  
|--------|-------|----------------|----------|  
| **0. تعارف** | ورکشاپ کا جائزہ | سیکھنے کے مقاصد، شرائط، اور ورکشاپ کی ساخت سمجھیں | 15 منٹ |  
| **1. انتخاب** | ٹیمپلیٹ کی دریافت | AZD ٹیمپلیٹس کو دریافت کریں اور اپنے منظرنامے کے لیے صحیح AI ٹیمپلیٹ منتخب کریں | 20 منٹ |  
| **2. توثیق** | تعیناتی اور تصدیق | `azd up` کے ساتھ ٹیمپلیٹ تعینات کریں اور بنیادی ڈھانچے کی کارکردگی کی تصدیق کریں | 30 منٹ |  
| **3. تجزیہ** | ساخت کو سمجھیں | GitHub Copilot استعمال کرتے ہوئے ٹیمپلیٹ کی ساخت، Bicep فائلیں، اور کوڈ کی تنظیم کو دریافت کریں | 30 منٹ |  
| **4. ترتیب** | azure.yaml کی تفصیلی جانچ | `azure.yaml` کی ترتیب، لائف سائیکل ہکس، اور ماحول کے متغیرات میں مہارت حاصل کریں | 30 منٹ |  
| **5. تخصیص** | اسے اپنا بنائیں | AI سرچ، ٹریسنگ، تشخیص کو فعال کریں اور اپنے منظرنامے کے مطابق تخصیص کریں | 45 منٹ |  
| **6. صفائی** | وسائل صاف کریں | `azd down --purge` کے ذریعے وسائل کو محفوظ طریقے سے غیر فعال کریں | 15 منٹ |  
| **7. خلاصہ** | اگلے اقدامات | کامیابیاں، اہم تصورات کا جائزہ لیں، اور اپنی سیکھنے کا سفر جاری رکھیں | 15 منٹ |  

**ورکشاپ کا بہاؤ:**  
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```
  
#### 🚀 ورکشاپ شروع کریں  
```bash
# آپشن 1: گٹ ہب کوڈ اسپیسز (تجویز کردہ)
# ریپوزیٹری میں "Code" → "Create codespace on main" پر کلک کریں

# آپشن 2: لوکل ڈیولپمنٹ
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# ورکشاپ/README.md میں سیٹ اپ ہدایات پر عمل کریں
```
  
#### 🎯 ورکشاپ کے سیکھنے کے نتائج  
ورکشاپ مکمل کرنے والے شرکاء:  
- **پروڈکشن AI ایپلیکیشنز تعینات کریں**: Microsoft Foundry خدمات کے ساتھ AZD استعمال کریں  
- **ملٹی ایجنٹ آرکیٹیکچر میں مہارت حاصل کریں**: ہم آہنگ AI ایجنٹ حل نافذ کریں  
- **سیکیورٹی بہترین طریقے نافذ کریں**: توثیق اور رسائی کنٹرول ترتیب دیں  
- **اسکیل کے لیے بہتر بنائیں**: لاگت مؤثر، کارگر تعیناتیوں کی ڈیزائننگ  
- **تعیناتیوں کے مسائل حل کریں**: عام مسائل خود مختار طریقے سے درست کریں  

#### 📖 ورکشاپ کے وسائل  
- **🎥 انٹرایکٹو گائیڈ**: [ورکشاپ مواد](workshop/README.md) - براوزر پر مبنی سیکھنے کا ماحول  
- **📋 ماڈیول بہ ماڈیول ہدایات**:  
  - [0. تعارف](workshop/docs/instructions/0-Introduction.md) - ورکشاپ کا جائزہ اور مقاصد  
  - [1. انتخاب](workshop/docs/instructions/1-Select-AI-Template.md) - AI ٹیمپلیٹس تلاش کریں اور منتخب کریں  
  - [2. توثیق](workshop/docs/instructions/2-Validate-AI-Template.md) - ٹیمپلیٹس تعینات کریں اور تصدیق کریں  
  - [3. تجزیہ](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - ٹیمپلیٹ کی ساخت دریافت کریں  
  - [4. ترتیب](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml میں مہارت حاصل کریں  
  - [5. تخصیص](workshop/docs/instructions/5-Customize-AI-Template.md) - اپنے منظرنامے کے مطابق تخصیص کریں  
  - [6. صفائی](workshop/docs/instructions/6-Teardown-Infrastructure.md) - وسائل صاف کریں  
  - [7. خلاصہ](workshop/docs/instructions/7-Wrap-up.md) - جائزہ اور اگلے اقدامات  
- **🛠️ AI ورکشاپ لیب**: [AI ورکشاپ لیب](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI پر مرکوز مشقیں  
- **💡 فوری آغاز**: [ورکشاپ سیٹ اپ گائیڈ](workshop/README.md#quick-start) - ماحول کی ترتیب  

**مناسب برائے**: کارپوریٹ تربیت، یونیورسٹی کورسز، خود رفتار سیکھنا، اور ڈویلپر بوٹ کیمپس۔  

---

## 📖 تفصیلی جائزہ: AZD کی خصوصیات  

بنیادی باتوں سے آگے، AZD پروڈکشن تعیناتیوں کے لیے طاقتور خصوصیات فراہم کرتا ہے:  

- **ٹیمپلیٹ کی بنیاد پر تعیناتیاں** - عمومی ایپلیکیشن ایک نمونوں کے لیے پہلے سے تیار ٹیمپلیٹس کا استعمال  
- **انفراسٹرکچر ایز کوڈ** - Azure وسائل کو Bicep یا Terraform سے منظم کریں  
- **مربوط ورک فلو** - ایپلیکیشنز کو آسانی سے پروویژن، تعینات، اور مانیٹر کریں  
- **ڈویلپر دوستانہ** - ڈویلپر کی پیداواری صلاحیت اور تجربے کے لیے بہتر بنایا گیا  

### **AZD + Microsoft Foundry: AI تعیناتیوں کے لیے مکمل**  

**کیوں AZD AI حل کے لیے؟** AZD ان اہم چیلنجز کا حل ہے جن کا سامنا AI ڈویلپرز کرتے ہیں:  

- **AI ریڈی ٹیمپلیٹس** - Azure OpenAI، Cognitive Services، اور ML ورک لوڈز کے لیے پہلے سے ترتیب دیے گئے ٹیمپلیٹس  
- **محفوظ AI تعیناتیاں** - AI خدمات، API کیز، اور ماڈل اینڈپوائنٹس کے لیے بلٹ ان سیکیورٹی پیٹرنز  
- **پروڈکشن AI پیٹرنز** - قابل اسکیل، لاگت مؤثر AI ایپلی کیشنز کی بہترین عملی مثالیں  
- **اینڈ ٹو اینڈ AI ورک فلو** - ماڈل کی ترقی سے پروڈکشن تعیناتی تک مکمل نگرانی کے ساتھ  
- **لاگت کی بہتر کاری** - AI ورک لوڈز کے لیے ذہین وسائل کی تقسیم اور اسکیلنگ حکمت عملی  
- **Microsoft Foundry انٹیگریشن** - Microsoft Foundry ماڈل کیٹلاگ اور اینڈپوائنٹس سے مربوط  

---

## 🎯 ٹیمپلیٹس اور مثالوں کی لائبریری  

### نمایاں: Microsoft Foundry ٹیمپلیٹس  
**اگر آپ AI ایپلی کیشنز تعینات کر رہے ہیں تو یہاں سے شروع کریں!**  

> **نوٹ:** یہ ٹیمپلیٹس مختلف AI پیٹرنز کی نمائندگی کرتے ہیں۔ کچھ بیرونی Azure نمونے ہیں، جبکہ بعض مقامی نفاذ ہیں۔  

| ٹیمپلیٹ | باب | پیچیدگی | خدمات | قسم |  
|----------|---------|------------|----------|------|  
| [**AI چیٹ کے ساتھ شروع کریں**](https://github.com/Azure-Samples/get-started-with-ai-chat) | باب 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | بیرونی |  
| [**AI ایجنٹس کے ساتھ شروع کریں**](https://github.com/Azure-Samples/get-started-with-ai-agents) | باب 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| بیرونی |  
| [**Azure Search + OpenAI ڈیمو**](https://github.com/Azure-Samples/azure-search-openai-demo) | باب 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | بیرونی |  
| [**OpenAI چیٹ ایپ فوری آغاز**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | باب 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | بیرونی |  
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | باب 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | بیرونی |  
| [**Contoso چیٹ RAG**](https://github.com/Azure-Samples/contoso-chat) | باب 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | بیرونی |  
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | باب 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **مقامی** |  

### نمایاں: مکمل سیکھنے کے منظرنامے  
**پروڈکشن کے لیے تیار ایپلیکیشن ٹیمپلیٹس جو سیکھنے کے ابواب سے منسلک ہیں**  

| ٹیمپلیٹ | سیکھنے کا باب | پیچیدگی | اہم سیکھنے کے نکات |  
|----------|------------------|------------|--------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | باب 2 | ⭐ | بنیادی AI تعیناتی پیٹرنز |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | باب 2 | ⭐⭐ | Azure AI سرچ کے ساتھ RAG نفاذ |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | باب 4 | ⭐⭐ | دستاویز کی ذہانت کا انضمام |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | باب 5 | ⭐⭐⭐ | ایجنٹ فریم ورک اور فنکشن کالنگ |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | باب 8 | ⭐⭐⭐ | انٹرپرائز AI کوآرڈینیشن |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | باب 5 | ⭐⭐⭐⭐ | کسٹمر اور انوینٹری ایجنٹس کے ساتھ ملٹی ایجنٹ آرکیٹیکچر |  

### مثال کی قسم کے ذریعے سیکھنا  

> **📌 مقامی بمقابلہ بیرونی مثالیں:**  
> **مقامی مثالیں** (اس ریپوزیٹری میں) = فوری استعمال کے لیے تیار  
> **بیرونی مثالیں** (Azure نمونے) = لنک شدہ ریپوزیٹریز سے کلون کریں  

#### مقامی مثالیں (فوری استعمال کے لیے تیار)  
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM ٹیمپلیٹس کے ساتھ مکمل پروڈکشن ریڈی نفاذ  
  - ملٹی ایجنٹ آرکیٹیکچر (کسٹمر + انوینٹری ایجنٹس)  
  - جامع مانیٹرنگ اور تشخیص  
  - ARM ٹیمپلیٹ کے ذریعے ایک کلک تعیناتی  

#### مقامی مثالیں - کنٹینر ایپلیکیشنز (ابواب 2-5)  
**اس ریپوزیٹری میں جامع کنٹینر تعیناتی کی مثالیں:**  
- [**کنٹینر ایپ مثالیں**](examples/container-app/README.md) - کنٹینرائزڈ تعیناتیاں کی مکمل رہنمائی  
  - [سادہ فلاسک API](../../examples/container-app/simple-flask-api) - زیرو اسکیل کے ساتھ بنیادی REST API  
  - [مائیکروسروسز آرکیٹیکچر](../../examples/container-app/microservices) - پروڈکشن ریڈی ملٹی سروس تعیناتی  
  - فوری آغاز، پروڈکشن، اور اعلیٰ درجے کی تعیناتی کے نمونے  
  - مانیٹرنگ، سیکیورٹی، اور لاگت کی بہتر کاری کی رہنمائی  

#### بیرونی مثالیں - سادہ ایپلیکیشنز (ابواب 1-2)  
**شروع کرنے کے لیے یہ Azure سمپلز ریپوزیٹریز کلون کریں:**  
- [سادہ ویب ایپ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - بنیادی تعیناتی پیٹرنز  
- [اسٹیٹک ویب سائٹ - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - اسٹیٹک مواد کی تعیناتی  
- [کنٹینر ایپ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API تعیناتی  

#### بیرونی مثالیں - ڈیٹا بیس انضمام (ابواب 3-4)  
- [ڈیٹا بیس ایپ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - ڈیٹا بیس کنیکٹیویٹی پیٹرنز  
- [فنکشنز + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - سرور لیس ڈیٹا ورک فلو  

#### بیرونی مثالیں - اعلیٰ درجے کے پیٹرنز (ابواب 4-8)  
- [جاوا مائیکروسروسز](https://github.com/Azure-Samples/java-microservices-aca-lab) - ملٹی سروس آرکیٹیکچرز  
- [کنٹینر ایپس جابز](https://github.com/Azure-Samples/container-apps-jobs) - پس منظر میں پروسیسنگ  
- [انٹرپرائز ML پائپ لائن](https://github.com/Azure-Samples/mlops-v2) - پروڈکشن ریڈی ML نمونے  

### بیرونی ٹیمپلیٹ مجموعے  
- [**آفیشل AZD ٹیمپلیٹ گیلری**](https://azure.github.io/awesome-azd/) - آفیشل اور کمیونٹی ٹیمپلیٹس کا مجموعہ  
- [**Azure Developer CLI ٹیمپلیٹس**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn ٹیمپلیٹ دستاویزات  
- [**مثالوں کا ڈائریکٹری**](examples/README.md) - مفصل وضاحتوں کے ساتھ مقامی سیکھنے کی مثالیں  

---

## 📚 سیکھنے کے وسائل اور حوالہ جات  

### فوری حوالہ جات  
- [**کمانڈ چیٹ شیٹ**](resources/cheat-sheet.md) - ابواب کے مطابق منظم کردہ ضروری azd کمانڈز  
- [**گلوسری**](resources/glossary.md) - Azure اور azd کی اصطلاحات  
- [**عمومی سوالات**](resources/faq.md) - سیکھنے کے ابواب کے مطابق عام سوالات  
- [**مطالعہ گائیڈ**](resources/study-guide.md) - جامع عملی مشقیں  

### عملی ورکشاپس  
- [**AI ورکشاپ لیب**](docs/chapter-02-ai-development/ai-workshop-lab.md) - اپنے AI حلوں کو AZD سے تعینات کرنے کے قابل بنائیں (2-3 گھنٹے)  
- [**انٹرایکٹو ورکشاپ**](workshop/README.md) - MkDocs اور GitHub Codespaces کے ساتھ 8 ماڈیول کی رہنمائی شدہ مشقیں  
  - ترتیب وار: تعارف → انتخاب → توثیق → تجزیہ → ترتیب → تخصیص → صفائی → خلاصہ  

### بیرونی سیکھنے کے وسائل  
- [Azure Developer CLI دستاویزات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure آرکیٹیکچر سینٹر](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure قیمت کیلکولیٹر](https://azure.microsoft.com/pricing/calculator/)  
- [Azure کی صورتحال](https://status.azure.com/)  

---

## 🔧 فوری مسئلہ حل کرنے کی رہنما  

**ابتدائی افراد کو پیش آنے والے عام مسائل اور فوری حل:**  

<details>  
<summary><strong>❌ "azd: command not found"</strong></summary>  

```bash
# پہلے AZD انسٹال کریں
# ونڈوز (پاور شیل):
winget install microsoft.azd

# میک او ایس:
brew tap azure/azd && brew install azd

# لینکس:
curl -fsSL https://aka.ms/install-azd.sh | bash

# تنصیب کی تصدیق کریں
azd version
```
</details>  

<details>  
<summary><strong>❌ "کوئی سبسکرپشن نہیں ملی" یا "سبسکرپشن سیٹ نہیں ہے"</strong></summary>  

```bash
# دستیاب سبسکرپشنز کی فہرست بنائیں
az account list --output table

# ڈیفالٹ سبسکرپشن سیٹ کریں
az account set --subscription "<subscription-id-or-name>"

# AZD ماحول کے لیے سیٹ کریں
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# تصدیق کریں
az account show
```
</details>  

<details>
<summary><strong>❌ "InsufficientQuota" یا "Quota exceeded"</strong></summary>

```bash
# مختلف Azure خطہ آزما کر دیکھیں
azd env set AZURE_LOCATION "westus2"
azd up

# یا ترقیاتی مرحلے میں چھوٹے SKUs استعمال کریں
# infra/main.parameters.json کو ترمیم کریں:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" درمیان میں فیل ہو جاتا ہے</strong></summary>

```bash
# اختیار 1: صاف کریں اور دوبارہ کوشش کریں
azd down --force --purge
azd up

# اختیار 2: صرف انفراسٹرکچر کو ٹھیک کریں
azd provision

# اختیار 3: تفصیلی صورتحال چیک کریں
azd show

# اختیار 4: آزور مانیٹر میں لاگز چیک کریں
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" یا "Token expired"</strong></summary>

```bash
# دوبارہ تصدیق کریں
az logout
az login

azd auth logout
azd auth login

# تصدیق کی جانچ کریں
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" یا نام کے تصادم</strong></summary>

```bash
# AZD منفرد نام تخلیق کرتا ہے، لیکن اگر تصادم ہو:
azd down --force --purge

# پھر نئے ماحول کے ساتھ دوبارہ کوشش کریں
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ ٹیمپلیٹ کی تعیناتی میں بہت زیادہ وقت لگنا</strong></summary>

**عام انتظار کے اوقات:**
- سادہ ویب ایپ: 5-10 منٹ
- ڈیٹا بیس والی ایپ: 10-15 منٹ
- AI ایپلیکیشنز: 15-25 منٹ (اوپن اے آئی کی فراہمی سست ہے)

```bash
# پیش رفت چیک کریں
azd show

# اگر ۳۰ منٹ سے زیادہ روک گیا ہے، Azure پورٹل چیک کریں:
azd monitor
# ناکام تعیناتیوں کی تلاش کریں
```
</details>

<details>
<summary><strong>❌ "Permission denied" یا "Forbidden"</strong></summary>

```bash
# اپنا Azure رول چیک کریں
az role assignment list --assignee $(az account show --query user.name -o tsv)

# آپ کو کم از کم "Contributor" رول کی ضرورت ہے
# اپنے Azure ایڈمن سے درخواست کریں کہ وہ اجازت دے:
# - Contributor (وسائل کے لیے)
# - User Access Administrator (رول تفویضات کے لیے)
```
</details>

<details>
<summary><strong>❌ تعینات شدہ ایپلیکیشن یو آر ایل نہیں مل رہا</strong></summary>

```bash
# تمام سروس اینڈ پوائنٹس دکھائیں
azd show

# یا ایزور پورٹل کھولیں
azd monitor

# مخصوص سروس چیک کریں
azd env get-values
# *_URL متغیرات تلاش کریں
```
</details>

### 📚 مکمل مسئلہ حل کرنے کے وسائل

- **عام مسائل کی گائیڈ:** [تفصیلی حل](docs/chapter-07-troubleshooting/common-issues.md)
- **AI مخصوص مسائل:** [AI مسئلہ حل کرنا](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **ڈی بگنگ گائیڈ:** [مرحلہ وار ڈی بگنگ](docs/chapter-07-troubleshooting/debugging.md)
- **مدد حاصل کریں:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 کورس کی تکمیل اور سرٹیفیکیٹ

### ترقی کا سراغ لگانا
ہر باب کے ذریعے اپنی سیکھنے کی پیش رفت کو ٹریک کریں:

- [ ] **باب 1**: بنیاد اور فوری آغاز ✅
- [ ] **باب 2**: AI-فرسٹ ڈیولپمنٹ ✅  
- [ ] **باب 3**: کنفیگریشن اور توثیق ✅
- [ ] **باب 4**: انفراسٹرکچر بطور کوڈ اور تعیناتی ✅
- [ ] **باب 5**: ملٹی ایجنٹ AI حل ✅
- [ ] **باب 6**: پری ڈیپلائمنٹ تصدیق اور منصوبہ بندی ✅
- [ ] **باب 7**: مسئلہ حل کرنا اور ڈی بگنگ ✅
- [ ] **باب 8**: پروڈکشن اور انٹرپرائز پیٹرنز ✅

### سیکھنے کی تصدیق
ہر باب مکمل کرنے کے بعد اپنے علم کو تصدیق کریں:
1. **عملی مشق**: باب کی عملی تعیناتی مکمل کریں
2. **علمی جائزہ**: اپنے باب کے FAQ سیکشن کا جائزہ لیں
3. **کمیونٹی مباحثہ**: Azure Discord میں اپنا تجربہ شیئر کریں
4. **اگلا باب**: اگلے پیچیدہ سطح پر بڑھیں

### کورس مکمل کرنے کے فوائد
تمام ابواب مکمل کرنے پر آپ کے پاس ہوگا:
- **پروڈکشن کا تجربہ**: Azure پر حقیقی AI ایپلیکیشنز تعینات کیں
- **پیشہ ورانہ مہارت**: انٹرپرائز تیار تعیناتی کی صلاحیتیں  
- **کمیونٹی کی پہچان**: Azure ڈیولپر کمیونٹی کے فعال رکن
- **کیریئر کی ترقی**: AZD اور AI تعیناتی کے مطالبہ شدہ مہارت

---

## 🤝 کمیونٹی اور سپورٹ

### مدد اور حمایت حاصل کریں
- **تکنیکی مسائل**: [بگز رپورٹ کریں اور خصوصیات کی درخواست کریں](https://github.com/microsoft/azd-for-beginners/issues)
- **سیکھنے کے سوالات**: [Microsoft Azure Discord کمیونٹی](https://discord.gg/microsoft-azure) اور [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI سے متعلق مدد**: شامل ہوں [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **دستاویزات**: [سرکاری Azure Developer CLI دستاویزات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord سے کمیونٹی کے خیالات

**#Azure چینل کے حالیہ پول کے نتائج:**
- **45%** ڈیولپرز AI ورک لوڈز کے لیے AZD استعمال کرنا چاہتے ہیں
- **سب سے بڑے چیلنجز**: ملٹی سروس تعیناتیاں، اسناد کی مینجمنٹ، پروڈکشن کے لیے تیاری  
- **سب سے زیادہ مطلوبہ**: AI مخصوص ٹیمپلیٹس، مسئلہ حل کرنے کی گائیڈز، بہترین عملی طریقے

**ہماری کمیونٹی میں شامل ہوں تاکہ:**
- اپنے AZD + AI تجربات شئیر کریں اور مدد حاصل کریں
- نئے AI ٹیمپلیٹس کے ابتدائی جائزے تک رسائی حاصل کریں
- AI تعیناتی کی بہترین عملی طریقوں میں تعاون کریں
- مستقبل کے AI + AZD فیچرز کی ترقی پر اثر انداز ہوں

### کورس میں تعاون
ہم تعاون کا خیرمقدم کرتے ہیں! براہ کرم ہمارے [تعاون کی گائیڈ](CONTRIBUTING.md) کو پڑھیں جس میں تفصیلات شامل ہیں:
- **مواد کی بہتری**: موجودہ ابواب اور مثالوں کو بہتر بنائیں
- **نئی مثالیں**: حقیقی دنیا کے منظرنامے اور ٹیمپلیٹس شامل کریں  
- **ترجمہ**: کثیر لسانی حمایت کو برقرار رکھنے میں مدد کریں
- **بگ رپورٹس**: درستگی اور وضاحت کو بہتر بنائیں
- **کمیونٹی کے معیارات**: ہماری جامع کمیونٹی گائیڈ لائنز پر عمل کریں

---

## 📄 کورس کی معلومات

### لائسنس
یہ پروجیکٹ MIT لائسنس کے تحت لائسنس یافتہ ہے - مزید جاننے کے لیے [LICENSE](../../LICENSE) فائل دیکھیں۔

### متعلقہ Microsoft لرننگ وسائل

ہماری ٹیم دیگر جامع سیکھنے کے کورسز تیار کرتی ہے:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---
## 🗺️ کورس نیویگیشن

**🚀 سیکھنے کے لیے تیار ہیں؟**

**شروع کرنے والے**: [باب 1: بنیاد اور جلد آغاز](../..) سے شروع کریں  
**ای آئی ڈویلپرز**: [باب 2: ای آئی-فرسٹ ڈیولپمنٹ](../..) پر جائیں  
**تجربہ کار ڈویلپرز**: [باب 3: ترتیب اور تصدیق](../..) سے شروع کریں

**اگلے اقدامات**: [باب 1 شروع کریں - AZD بنیادیات](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**دستخطِ دستبرداری**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم آگاہ رہیں کہ خودکار تراجم میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں معتبر ذریعہ شمار کی جانی چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->