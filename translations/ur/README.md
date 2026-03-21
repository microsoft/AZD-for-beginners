# AZD ابتدائیوں کے لیے: ایک منظم تعلیمی سفر

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

> **مقامی طور پر کلون کرنا پسند ہے؟**
>
> اس ریپوزٹری میں 50+ زبانوں کے تراجم شامل ہیں جو ڈاؤن لوڈ سائز کو نمایاں طور پر بڑھاتے ہیں۔ تراجم کے بغیر کلون کرنے کے لیے sparse checkout استعمال کریں:
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
> اس سے آپ کو کورس مکمل کرنے کے لیے سب کچھ مل جاتا ہے، اور ڈاؤن لوڈ بہت تیز ہو جاتا ہے۔
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 آج azd میں کیا نیا ہے

Azure Developer CLI روایتی ویب ایپس اور APIs سے بڑھ کر ہو چکا ہے۔ آج، azd ایک واحد ٹول ہے جس سے **کسی بھی** ایپلیکیشن کو Azure پر تعینات کیا جا سکتا ہے—بشمول AI سے چلنے والی ایپلیکیشنز اور ذہین ایجنٹس۔

یہ آپ کے لیے کیا مطلب رکھتا ہے:

- **AI ایجنٹس اب پہلا درجے کے azd ورکلوڈز ہیں۔** آپ AI ایجنٹ پراجیکٹس کو وہی `azd init` → `azd up` ورک فلو استعمال کرتے ہوئے شروع، تعینات، اور منظم کر سکتے ہیں جسے آپ جانتے ہیں۔
- **Microsoft Foundry انٹیگریشن** ماڈل ڈپلائمنٹ، ایجنٹ ہوسٹنگ، اور AI سروس کی ترتیب کو براہ راست azd ٹیمپلیٹ ماحولیاتی نظام میں لاتی ہے۔
- **کوئر ورک فلو تبدیل نہیں ہوا۔** چاہے آپ todo ایپ، مائیکرو سروس، یا ملٹی ایجنٹ AI حل تعینات کر رہے ہوں، کمانڈز ایک جیسے ہیں۔

اگر آپ پہلے azd استعمال کر چکے ہیں تو AI سپورٹ ایک فطری توسیع ہے—کوئی الگ ٹول یا جدید ٹریک نہیں۔ اگر آپ نیا شروع کر رہے ہیں تو آپ ایک ایسا ورک فلو سیکھیں گے جو ہر چیز کے لیے کام کرتا ہے۔

---

## 🚀 Azure Developer CLI (azd) کیا ہے؟

**Azure Developer CLI (azd)** ایک ڈویلپر دوست کمانڈ لائن ٹول ہے جو Azure پر ایپلیکیشنز کو تعینات کرنا آسان بناتا ہے۔ درجنوں Azure وسائل کو دستی طور پر بنانے اور جوڑنے کی بجائے، آپ ایک کمانڈ سے پوری ایپلیکیشنز تعینات کر سکتے ہیں۔

### `azd up` کا جادو

```bash
# یہ واحد کمانڈ سب کچھ کرتی ہے:
# ✅ تمام Azure وسائل بناتا ہے
# ✅ نیٹ ورکنگ اور سیکیورٹی کو ترتیب دیتا ہے
# ✅ آپ کے ایپلیکیشن کے کوڈ کو بناتا ہے
# ✅ Azure پر تعینات کرتا ہے
# ✅ آپ کو ایک کام کرنے والا URL فراہم کرتا ہے
azd up
```

**بس یہی!** Azure پورٹل پر کلکنگ نہیں، کوئی پیچیدہ ARM ٹیمپلیٹس سیکھنا نہیں، کوئی دستی ترتیب نہیں - صرف کام کرنے والی Azure پر ایپلیکیشنز۔

---

## ❓ Azure Developer CLI اور Azure CLI: فرق کیا ہے؟

یہ سب سے عام سوال ہے جو ابتدائی پوچھتے ہیں۔ یہاں آسان جواب ہے:

| خصوصیت | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **مقصد** | انفرادی Azure وسائل کا انتظام | مکمل ایپلیکیشنز کی تعیناتی |
| **ذہنیت** | انفراسٹرکچر پر مرکوز | ایپلیکیشن پر مرکوز |
| **مثال** | `az webapp create --name myapp...` | `azd up` |
| **سیکھنے کا مرحلہ** | Azure سروسز جاننا ضروری ہے | صرف اپنی ایپ جانیں |
| **سب سے بہتر** | DevOps، انفراسٹرکچر | ڈویلپرز، پروٹوٹائپنگ |

### آسان موازنہ

- **Azure CLI** ایسے ہے جیسے آپ کے پاس گھر بنانے کے تمام اوزار ہوں - ہتھوڑے، آریاں، کیلے۔ آپ کچھ بھی بنا سکتے ہیں، لیکن تعمیرات کا علم ہونا چاہیے۔
- **Azure Developer CLI** ایسے ہے جیسے آپ ایک ٹھیکیدار کو ملا کر کام کر رہے ہیں—آپ بتاتے ہیں کیا چاہتے ہیں، اور وہ تعمیری کام سنبھالتا ہے۔

### کب کیا استعمال کریں

| منظر نامہ | یہ استعمال کریں |
|----------|----------------|
| "میں اپنی ویب ایپ جلدی تعینات کرنا چاہتا ہوں" | `azd up` |
| "مجھے صرف ایک اسٹوریج اکاؤنٹ بنانا ہے" | `az storage account create` |
| "میں مکمل AI ایپلیکیشن بنا رہا ہوں" | `azd init --template azure-search-openai-demo` |
| "مجھے مخصوص Azure وسائل کی خرابی دور کرنی ہے" | `az resource show` |
| "میں پروڈکشن ریڈی تعینات چند منٹوں میں چاہتا ہوں" | `azd up --environment production` |

### یہ ایک ساتھ کام کرتے ہیں!

AZD اندر Azure CLI استعمال کرتا ہے۔ آپ دونوں استعمال کر سکتے ہیں:
```bash
# اپنی ایپ کو AZD کے ساتھ تعینات کریں
azd up

# پھر Azure CLI کے ذریعے مخصوص وسائل کو باریک بینی سے حسبِ ضرورت ڈھالیں
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD میں ٹیمپلیٹس تلاش کریں

شروع سے نہ بنائیں! **Awesome AZD** کمیونٹی کی تیار تعیناتی کے لیے ٹیمپلیٹس کا مجموعہ ہے:

| وسائل | وضاحت |
|--------|---------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | 200+ ٹیمپلیٹس ایک کلک تعیناتی کے ساتھ براؤز کریں |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | اپنی ٹیمپلیٹ کمیونٹی میں شامل کریں |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | اسٹار دیں اور سورس کو تلاش کریں |

### Awesome AZD سے مشہور AI ٹیمپلیٹس

```bash
# RAG چیٹ Microsoft فاؤنڈری ماڈلز کے ساتھ + اے آئی سرچ
azd init --template azure-search-openai-demo

# فوری اے آئی چیٹ ایپلیکیشن
azd init --template openai-chat-app-quickstart

# اے آئی ایجنٹس فاؤنڈری ایجنٹس کے ساتھ
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 مراحل میں شروعات کریں

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
# ٹیمپلیٹ سے آغاز کریں
azd init --template todo-nodejs-mongo

# Azure پر تعینات کریں (یہ سب کچھ بنا دیتا ہے!)
azd up
```

**🎉 یہ ہوگیا!** آپ کی ایپ اب Azure پر زندہ ہے۔

### صفائی کریں (یاد رکھیں!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 اس کورس کا استعمال کیسے کریں

یہ کورس **ترقی پسند سیکھنے** کے لیے ڈیزائن کیا گیا ہے - جہاں آرام دہ ہوں وہاں سے شروع کریں اور آگے بڑھیں:

| آپ کا تجربہ | یہاں سے شروع کریں |
|--------------|------------------|
| **Azure میں بالکل نیا** | [باب 1: بنیاد](#-chapter-1-foundation--quick-start) |
| **Azure جانتے ہیں، AZD نیا ہے** | [باب 1: بنیاد](#-chapter-1-foundation--quick-start) |
| **AI ایپلیکیشنز تعینات کرنا چاہتے ہیں** | [باب 2: AI-فرسٹ ڈیولپمنٹ](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **عملی مشق چاہتے ہیں** | [🎓 انٹرایکٹو ورکشاپ](workshop/README.md) - 3-4 گھنٹے کی رہنمائی والے تجربہ گاہ |
| **پروڈکشن پیٹرنز چاہئیں** | [باب 8: پروڈکشن اور انٹرپرائز](#-chapter-8-production--enterprise-patterns) |

### فوری سیٹ اپ

1. **اس ریپوزٹری کو فورک کریں**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **کلون کریں**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **مدد حاصل کریں**: [Azure Discord کمیونٹی](https://discord.com/invite/ByRwuEEgH4)

> **مقامی طور پر کلون کرنا پسند ہے؟**

> اس ریپوزٹری میں 50+ زبانوں کے تراجم شامل ہیں جو ڈاؤن لوڈ سائز کو بہت بڑھا دیتے ہیں۔ تراجم کے بغیر کلون کرنے کے لیے sparse checkout استعمال کریں:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> اس سے آپ کو کورس مکمل کرنے کے لیے سب کچھ ملتا ہے اور ڈاؤن لوڈ بہت تیز ہو جاتا ہے۔

## کورس کا جائزہ

منظم ابواب کے ذریعے Azure Developer CLI (azd) میں مہارت حاصل کریں جو ترقی پسند سیکھنے کے لیے ڈیزائن کیے گئے ہیں۔ **AI ایپلیکیشن کی تعیناتی پر خصوصی توجہ Microsoft Foundry انٹیگریشن کے ساتھ۔**

### جدید ڈویلپرز کے لیے یہ کورس کیوں ضروری ہے

Microsoft Foundry Discord کمیونٹی کی رائے کی بنیاد پر، **45% ڈویلپرز azd کو AI ورکلوڈز کے لیے استعمال کرنا چاہتے ہیں** لیکن درج ذیل چیلنجز کا سامنا ہے:
- پیچیدہ کثیرالخدمت AI آرکیٹیکچرز
- پروڈکشن AI تعیناتی کے بہترین طریقے
- Azure AI سروس انٹیگریشن اور ترتیب
- AI ورکلوڈز کے لیے لاگت کی اصلاح
- AI مخصوص تعیناتی مسائل کی خرابی دور کرنا

### سیکھنے کے مقاصد

یہ منظم کورس مکمل کر کے آپ:
- **AZD کی بنیادی باتیں سیکھیں**: بنیادی تصورات، انسٹالیشن، اور ترتیب
- **AI ایپلیکیشنز تعینات کریں**: AZD کو Microsoft Foundry خدمات کے ساتھ استعمال کریں
- **انفراسٹرکچر ایز کوڈ نافذ کریں**: Bicep ٹیمپلیٹس سے Azure وسائل کا انتظام کریں
- **تعیناتیوں کی خرابی دور کریں**: عام مسائل حل کریں اور ڈی بگ کریں
- **پروڈکشن کے لیے بہتر کریں**: سیکیورٹی، اسکیلنگ، مانیٹرنگ، اور لاگت کا انتظام
- **ملٹی ایجنٹ حل بنائیں**: پیچیدہ AI آرکیٹیکچرز تعینات کریں

## 🗺️ کورس کا نقشہ: باب کے حساب سے تیز راستہ

ہر باب میں تفصیل سے README ہے جس میں سیکھنے کے مقاصد، فوری آغاز، اور مشقیں شامل ہیں:

| باب | موضوع | اسباق | دورانیہ | پیچیدگی |
|---------|-------|---------|----------|------------|
| **[باب 1: بنیاد](docs/chapter-01-foundation/README.md)** | آغاز | [AZD بنیادی باتیں](docs/chapter-01-foundation/azd-basics.md) &#124; [انسٹالیشن](docs/chapter-01-foundation/installation.md) &#124; [پہلا پراجیکٹ](docs/chapter-01-foundation/first-project.md) | 30-45 منٹ | ⭐ |
| **[باب 2: AI کی ترقی](docs/chapter-02-ai-development/README.md)** | AI-پہلے ایپس | [فاؤنڈری انضمام](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI ایجنٹس](docs/chapter-02-ai-development/agents.md) &#124; [ماڈل کی تعیناتی](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ورکشاپ](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 گھنٹے | ⭐⭐ |
| **[باب 3: ترتیب](docs/chapter-03-configuration/README.md)** | تصدیق اور سیکیورٹی | [ترتیب](docs/chapter-03-configuration/configuration.md) &#124; [تصدیق اور سیکیورٹی](docs/chapter-03-configuration/authsecurity.md) | 45-60 منٹ | ⭐⭐ |
| **[باب 4: انفراسٹرکچر](docs/chapter-04-infrastructure/README.md)** | IaC اور تعیناتی | [تعیناتی گائیڈ](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [پروویژننگ](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 گھنٹے | ⭐⭐⭐ |
| **[باب 5: کثیر ایجنٹ](docs/chapter-05-multi-agent/README.md)** | AI ایجنٹ حل | [ریٹیل منظرنامہ](examples/retail-scenario.md) &#124; [ہم آہنگی کے نمونے](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 گھنٹے | ⭐⭐⭐⭐ |
| **[باب 6: پری-تعیناتی](docs/chapter-06-pre-deployment/README.md)** | منصوبہ بندی اور توثیق | [پری فلائٹ چیکس](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [صلاحیت کی منصوبہ بندی](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU انتخاب](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [ایپ ان سائٹس](docs/chapter-06-pre-deployment/application-insights.md) | 1 گھنٹہ | ⭐⭐ |
| **[باب 7: مسئلے حل کرنا](docs/chapter-07-troubleshooting/README.md)** | ڈیبگ اور درست کریں | [عام مسائل](docs/chapter-07-troubleshooting/common-issues.md) &#124; [ڈیبگنگ](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI مسائل](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 گھنٹے | ⭐⭐ |
| **[باب 8: پیداوار](docs/chapter-08-production/README.md)** | انٹرپرائز پیٹرنز | [پیداوار کی مشقیں](docs/chapter-08-production/production-ai-practices.md) | 2-3 گھنٹے | ⭐⭐⭐⭐ |
| **[🎓 ورکشاپ](workshop/README.md)** | ہینڈز آن لیب | [تعارف](workshop/docs/instructions/0-Introduction.md) &#124; [انتخاب](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [تصدیق](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [تجزئیہ](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [ترتیب](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [حسب ضرورت](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [اختتام](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [خلاصہ](workshop/docs/instructions/7-Wrap-up.md) | 3-4 گھنٹے | ⭐⭐ |

**کل کورس کا دورانیہ:** ~10-14 گھنٹے | **مہارت کی ترقی:** ابتدائی → پیداوار کے لیے تیار

---

## 📚 تعلیمی ابواب

*اپنے تجربے اور مقاصد کی بنیاد پر سیکھنے کا راستہ منتخب کریں*

### 🚀 باب 1: بنیاد اور جلد آغاز
**شرائط:** Azure سبسکرپشن، بنیادی کمانڈ لائن کی معلومات  
**دورانیہ:** 30-45 منٹ  
**پیچیدگی:** ⭐

#### آپ کیا سیکھیں گے
- Azure Developer CLI کے بنیادی اصول سمجھنا
- اپنے پلیٹ فارم پر AZD انسٹال کرنا
- آپ کی پہلی کامیاب تعیناتی

#### سیکھنے کے وسائل
- **🎯 یہاں شروع کریں**: [Azure Developer CLI کیا ہے؟](#what-is-azure-developer-cli)
- **📖 نظریہ**: [AZD کے بنیادی اصول](docs/chapter-01-foundation/azd-basics.md) - بنیادی تصورات اور اصطلاحات
- **⚙️ سیٹ اپ**: [انسٹالیشن اور سیٹ اپ](docs/chapter-01-foundation/installation.md) - پلیٹ فارم مخصوص رہنما
- **🛠️ عملی کام**: [آپ کا پہلا پروجیکٹ](docs/chapter-01-foundation/first-project.md) - قدم بہ قدم ٹیوٹوریل
- **📋 تیز حوالہ**: [کمانڈ چیٹ شیٹ](resources/cheat-sheet.md)

#### عملی مشقیں
```bash
# تیز تنصیب کی جانچ
azd version

# اپنا پہلا ایپلیکیشن نافذ کریں
azd init --template todo-nodejs-mongo
azd up
```

**💡 باب کا نتیجہ:** AZD کا استعمال کرتے ہوئے Azure پر ایک سادہ ویب ایپلیکیشن کامیابی سے تعینات کریں

**✅ کامیابی کی تصدیق:**
```bash
# باب 1 مکمل کرنے کے بعد، آپ کو قابل ہونا چاہیے:
azd version              # نصب شدہ ورژن دکھاتا ہے
azd init --template todo-nodejs-mongo  # پروجیکٹ کو شروع کرتا ہے
azd up                  # Azure پر ڈیپلائے کرتا ہے
azd show                # چلنے والی ایپ کا URL دکھاتا ہے
# ایپلیکیشن براؤزر میں کھلتی ہے اور کام کرتی ہے
azd down --force --purge  # وسائل کو صاف کرتا ہے
```

**📊 وقت کی سرمایہ کاری:** 30-45 منٹ  
**📈 بعد کی مہارت:** بنیادی ایپلیکیشنز خود مختاری سے تعینات کر سکتے ہیں  
**📈 بعد کی مہارت:** بنیادی ایپلیکیشنز خود مختاری سے تعینات کر سکتے ہیں  

---

### 🤖 باب 2: AI-پہلے ترقی (AI ڈویلپرز کے لیے تجویز کردہ)
**شرائط:** باب 1 مکمل کیا ہوا  
**دورانیہ:** 1-2 گھنٹے  
**پیچیدگی:** ⭐⭐

#### آپ کیا سیکھیں گے
- Microsoft Foundry کا AZD کے ساتھ انضمام
- AI سے چلنے والی ایپلیکیشنز کی تعیناتی
- AI سروس کنفیگریشن کی سمجھ بوجھ

#### سیکھنے کے وسائل
- **🎯 یہاں شروع کریں**: [Microsoft Foundry انضمام](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI ایجنٹس**: [AI ایجنٹس گائیڈ](docs/chapter-02-ai-development/agents.md) - AZD کے ساتھ ذہین ایجنٹس تعینات کریں
- **📖 نمونے**: [AI ماڈل کی تعیناتی](docs/chapter-02-ai-development/ai-model-deployment.md) - AI ماڈلز تعینات اور مینیج کریں
- **🛠️ ورکشاپ**: [AI ورکشاپ لیب](docs/chapter-02-ai-development/ai-workshop-lab.md) - اپنی AI حل AZD کے لیے تیار کریں
- **🎥 انٹرایکٹو گائیڈ**: [ورکشاپ مواد](workshop/README.md) - MkDocs * DevContainer ماحول میں براؤزر پر مبنی تعلیم
- **📋 ٹیمپلیٹس**: [Microsoft Foundry ٹیمپلیٹس](#ورکشاپ-کے-ذرائع)
- **📝 مثالیں**: [AZD تعیناتی کی مثالیں](examples/README.md)

#### عملی مشقیں
```bash
# اپنا پہلا اے آئی ایپلیکیشن تعینات کریں
azd init --template azure-search-openai-demo
azd up

# اضافی اے آئی ٹیمپلیٹس آزماییں
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 باب کا نتیجہ:** RAG خصوصیات کے ساتھ AI سے چلنے والی چیٹ ایپلیکیشن تعینات اور ترتیب دیں

**✅ کامیابی کی تصدیق:**
```bash
# باب 2 کے بعد، آپ کو قابل ہونا چاہئے کہ:
azd init --template azure-search-openai-demo
azd up
# AI چیٹ انٹرفیس کی جانچ کریں
# سوالات پوچھیں اور ذرائع کے ساتھ AI کی مدد سے جوابات حاصل کریں
# تصدیق کریں کہ تلاش کی انٹیگریشن کام کر رہی ہے
azd monitor  # چیک کریں کہ Application Insights ٹیلی میٹری دکھاتا ہے
azd down --force --purge
```

**📊 وقت کی سرمایہ کاری:** 1-2 گھنٹے  
**📈 بعد کی مہارت:** پیداواری کے لیے تیار AI ایپلیکیشنز تعینات اور ترتیب دے سکتے ہیں  
**💰 لاگت کا ادراک:** $80-150/ماہ ترقیاتی اخراجات، $300-3500/ماہ پیداواری اخراجات کو سمجھیں

#### 💰 AI کی تعیناتی کے لیے لاگت کے پہلو

**ترقیاتی ماحول (تخمینی $80-150/ماہ):**
- Microsoft Foundry ماڈلز (پے اےز یو گو): $0-50/ماہ (ٹوکین استعمال کی بنیاد پر)
- AI سرچ (بنیادی سطح): $75/ماہ
- کنٹینر ایپس (کنزمپشن): $0-20/ماہ
- اسٹوریج (معیاری): $1-5/ماہ

**پیداواری ماحول (تخمینی $300-3,500+/ماہ):**
- Microsoft Foundry ماڈلز (PTU مسلسل کارکردگی کے لیے): $3,000+/ماہ یا بڑی مقدار کے ساتھ پے اےز یو گو
- AI سرچ (معیاری سطح): $250/ماہ
- کنٹینر ایپس (مختص): $50-100/ماہ
- ایپلیکیشن ان سائٹس: $5-50/ماہ
- اسٹوریج (پریمیم): $10-50/ماہ

**💡 لاگت میں کمی کے نکات:**
- **مفت طبقہ** Microsoft Foundry ماڈلز کو سیکھنے کے لیے استعمال کریں (Azure OpenAI 50,000 ٹوکینز/ماہ شامل)
- جب فعال ترقی نہ کر رہے ہوں تو `azd down` چلائیں تاکہ وسائل کو ختم کیا جا سکے
- کنزمپشن کی بنیاد پر بلنگ سے شروع کریں، پیداواری کے لیے صرف PTU پر اپ گریڈ کریں
- تعیناتی سے پہلے لاگت کا اندازہ لگانے کے لیے `azd provision --preview` استعمال کریں
- خودکار اسکیلنگ فعال کریں: صرف اصل استعمال کے لیے ادائیگی کریں

**لاگت کی نگرانی:**
```bash
# اندازہ شدہ ماہانہ اخراجات چیک کریں
azd provision --preview

# ایزور پورٹل میں اصل اخراجات کی نگرانی کریں
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ باب 3: ترتیب اور تصدیق
**شرائط:** باب 1 مکمل کیا ہوا  
**دورانیہ:** 45-60 منٹ  
**پیچیدگی:** ⭐⭐

#### آپ کیا سیکھیں گے
- ماحول کی ترتیب اور انتظام
- تصدیق اور سیکیورٹی کی بہترین مشقیں
- وسائل کے نام اور تنظیم

#### سیکھنے کے وسائل
- **📖 ترتیب**: [ترتیب گائیڈ](docs/chapter-03-configuration/configuration.md) - ماحول کی سیٹ اپ
- **🔐 سیکیورٹی**: [تصدیق کے نمونے اور مینیجڈ شناخت](docs/chapter-03-configuration/authsecurity.md) - تصدیقی نمونے
- **📝 مثالیں**: [ڈیٹابیس ایپ مثال](examples/database-app/README.md) - AZD ڈیٹابیس کی مثالیں

#### عملی مشقیں
- متعدد ماحول ترتیب دیں (ڈیولپمنٹ، اسٹیجنگ، پیداوار)
- مینیجڈ شناخت کی تصدیق قائم کریں
- ماحول مخصوص ترتیبات نافذ کریں

**💡 باب کا نتیجہ:** مناسب تصدیق اور سیکیورٹی کے ساتھ متعدد ماحول کا انتظام کریں

---

### 🏗️ باب 4: انفراسٹرکچر ایز کوڈ اور تعیناتی
**شرائط:** ابواب 1-3 مکمل کیے ہوئے  
**دورانیہ:** 1-1.5 گھنٹے  
**پیچیدگی:** ⭐⭐⭐

#### آپ کیا سیکھیں گے
- جدید تعیناتی کے نمونے
- Bicep کے ذریعہ انفراسٹرکچر بطور کوڈ
- وسائل کی فراہمی کی حکمت عملی

#### سیکھنے کے وسائل
- **📖 تعیناتی**: [تعیناتی گائیڈ](docs/chapter-04-infrastructure/deployment-guide.md) - مکمل ورک فلو
- **🏗️ فراہمی**: [وسائل کی فراہمی](docs/chapter-04-infrastructure/provisioning.md) - Azure وسائل کا انتظام
- **📝 مثالیں**: [کنٹینر ایپ کی مثال](../../examples/container-app) - کنٹینرائزڈ تعیناتیاں

#### عملی مشقیں
- حسب ضرورت Bicep ٹیمپلیٹس بنائیں
- کثیر الخدمات ایپلیکیشنز تعینات کریں
- نیلے-سبز تعیناتی حکمت عملی نافذ کریں

**💡 باب کا نتیجہ:** حسب ضرورت انفراسٹرکچر ٹیمپلیٹس کا استعمال کرتے ہوئے پیچیدہ کثیرالخدمات ایپلیکیشنز تعینات کریں

---

### 🎯 باب 5: کثیر ایجنٹ AI حل (اعلی سطح)
**شرائط:** ابواب 1-2 مکمل کیے ہوئے  
**دورانیہ:** 2-3 گھنٹے  
**پیچیدگی:** ⭐⭐⭐⭐

#### آپ کیا سیکھیں گے
- کثیر ایجنٹ کی فن تعمیر کے نمونے
- ایجنٹ کی ہم آہنگی اور تعاون
- پیداواری کے لیے تیار AI کی تعیناتیاں

#### سیکھنے کے وسائل
- **🤖 نمایاں پروجیکٹ**: [ریٹیل کثیر ایجنٹ حل](examples/retail-scenario.md) - مکمل نفاذ
- **🛠️ ARM ٹیمپلیٹس**: [ARM ٹیمپلیٹ پیکیج](../../examples/retail-multiagent-arm-template) - ون کلک تعیناتی
- **📖 فن تعمیر**: [کثیر ایجنٹ ہم آہنگی کے نمونے](docs/chapter-06-pre-deployment/coordination-patterns.md) - نمونے

#### عملی مشقیں
```bash
# مکمل ریٹیل کثیر ایجنٹ حل کو نافذ کریں
cd examples/retail-multiagent-arm-template
./deploy.sh

# ایجنٹ سیٹ اپ کو دریافت کریں
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 باب کا نتیجہ:** کسٹمر اور انوینٹری ایجنٹس کے ساتھ پیداواری کے لیے تیار کثیر ایجنٹ AI حل تعینات اور مینیج کریں

---

### 🔍 باب 6: پری-تعیناتی توثیق اور منصوبہ بندی
**شرائط:** باب 4 مکمل کیا ہوا  
**دورانیہ:** 1 گھنٹہ  
**پیچیدگی:** ⭐⭐

#### آپ کیا سیکھیں گے
- صلاحیت کی منصوبہ بندی اور وسائل کی توثیق
- SKU انتخاب کی حکمت عملی
- پری فلائٹ چیکس اور خود کاری

#### سیکھنے کے وسائل
- **📊 منصوبہ بندی**: [صلاحیت کی منصوبہ بندی](docs/chapter-06-pre-deployment/capacity-planning.md) - وسائل کی توثیق
- **💰 انتخاب**: [SKU انتخاب](docs/chapter-06-pre-deployment/sku-selection.md) - لاگت موثر انتخاب
- **✅ توثیق**: [پری فلائٹ چیکس](docs/chapter-06-pre-deployment/preflight-checks.md) - خودکار اسکرپٹس

#### عملی مشقیں
- صلاحیت کی توثیق کے اسکرپٹس چلائیں
- لاگت کے لیے SKU انتخاب کو بہتر بنائیں
- خودکار پری-تعیناتی چیکس نافذ کریں

**💡 باب کا نتیجہ:** تعیناتی سے پہلے توثیق اور بہتر بنائیں

---

### 🚨 باب 7: مسئلے حل کرنا اور ڈیبگنگ
**شرائط:** کوئی بھی تعیناتی باب مکمل کیا ہوا  
**دورانیہ:** 1-1.5 گھنٹے  
**پیچیدگی:** ⭐⭐

#### آپ کیا سیکھیں گے
- منظم ڈیبگنگ کے طریقے
- عام مسائل اور حل
- AI مخصوص مسئلے حل کرنا

#### سیکھنے کے وسائل
- **🔧 عام مسائل**: [عام مسائل](docs/chapter-07-troubleshooting/common-issues.md) - اکثر پوچھے جانے والے سوالات اور حل
- **🕵️ ڈیبگنگ**: [ڈیبگنگ گائیڈ](docs/chapter-07-troubleshooting/debugging.md) - مرحلہ وار حکمت عملی
- **🤖 AI مسائل**: [AI مخصوص مسئلے حل کرنا](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI سروس کے مسائل

#### عملی مشقیں
- تعیناتی کی ناکامیوں کی تشخیص کریں
- تصدیقی مسائل حل کریں
- AI سروس کنیکٹیویٹی کا ڈیبگ کریں

**💡 باب کا نتیجہ:** عام تعیناتی مسائل کو خود مختاری سے تشخیص اور حل کریں

---

### 🏢 باب 8: پیداوار اور انٹرپرائز کے نمونے
**شرائط:** ابواب 1-4 مکمل کیے ہوئے  
**دورانیہ:** 2-3 گھنٹے  
**پیچیدگی:** ⭐⭐⭐⭐

#### آپ کیا سیکھیں گے
- پیداواری تعیناتی کی حکمت عملی
- انٹرپرائز سیکیورٹی کے نمونے
- مانیٹرنگ اور لاگت کی بہتری

#### سیکھنے کے وسائل
- **🏭 پیداوار**: [پیداواری AI بہترین مشقیں](docs/chapter-08-production/production-ai-practices.md) - انٹرپرائز پیٹرنز  
- **📝 مثالیں**: [مائیکروسروسز کی مثال](../../examples/microservices) - پیچیدہ معماریات  
- **📊 نگرانی**: [ایپلیکیشن انسائٹس انضمام](docs/chapter-06-pre-deployment/application-insights.md) - نگرانی  

#### عملی مشقیں  
- انٹرپرائز سیکیورٹی پیٹرنز نافذ کریں  
- جامع نگرانی قائم کریں  
- مناسب گورننس کے ساتھ پیداوار میں تعینات کریں  

**💡 باب کا نتیجہ**: مکمل پیداوار کی صلاحیتوں کے ساتھ انٹرپرائز-ریڈی ایپلیکیشنز تعینات کریں  

---

## 🎓 ورکشاپ کا جائزہ: عملی تدریسی تجربہ  

> **⚠️ ورکشاپ کی حالت: فعال ترقی**  
> ورکشاپ کے مواد اس وقت تیار کیے جا رہے ہیں اور بہتر بنائے جا رہے ہیں۔ بنیادی ماڈیول فعال ہیں، لیکن کچھ پیش رفتی سیکشنز مکمل نہیں ہیں۔ ہم تمام مواد مکمل کرنے پر سرگرمی سے کام کر رہے ہیں۔ [پیش رفت ٹریک کریں →](workshop/README.md)  

### انٹرایکٹو ورکشاپ مواد  
**براؤزر پر مبنی اوزار اور رہنمائی شدہ مشقوں کے ساتھ جامع عملی سیکھنے کا تجربہ**  

ہمارا ورکشاپ مواد ایک منظم، انٹرایکٹو تعلیمی تجربہ فراہم کرتا ہے جو اوپر دیے گئے باب پر مبنی نصاب کو پورا کرتا ہے۔ ورکشاپ خود رفتاری سیکھنے اور انسٹرکٹر کی قیادت والے سیشنز دونوں کے لیے ڈیزائن کیا گیا ہے۔  

#### 🛠️ ورکشاپ کی خصوصیات  
- **براؤزر پر مبنی انٹرفیس**: مکمل MkDocs کی مدد سے ورکشاپ، تلاش، کاپی، اور تھیم کی خصوصیات کے ساتھ  
- **GitHub Codespaces انضمام**: ایک کلک میں ڈویلپمنٹ ماحول سیٹ اپ  
- **منظم تعلیمی راستہ**: 8 ماڈیولز کی رہنمائی شدہ مشقیں (کل 3-4 گھنٹے)  
- **پیش رفتی طریقہ کار**: تعارف → انتخاب → تصدیق → تجزیہ → ترتیب → تخصیص → ختم کاری → اختتام  
- **انٹرایکٹو DevContainer ماحول**: پیشگی ترتیب شدہ اوزار اور انحصارات  

#### 📚 ورکشاپ ماڈیول کی ساخت  
ورکشاپ ایک **8 ماڈیولز پر مبنی پیش رفتی طریقہ کار** پر عمل کرتی ہے جو آپ کو دریافت سے تعیناتی میں مہارت دیتا ہے:  

| ماڈیول | موضوع | آپ کیا کریں گے | دورانیہ |  
|--------|-------|----------------|----------|  
| **0. تعارف** | ورکشاپ کا جائزہ | تعلیمی مقاصد، ضروریات، اور ورکشاپ کی ساخت کو سمجھیں | 15 منٹ |  
| **1. انتخاب** | ٹیمپلیٹ کی دریافت | AZD ٹیمپلیٹس کا جائزہ لیں اور اپنے منظر نامے کے لیے صحیح AI ٹیمپلیٹ منتخب کریں | 20 منٹ |  
| **2. تصدیق** | تعینات کریں اور تصدیق کریں | `azd up` کے ساتھ ٹیمپلیٹ تعینات کریں اور انفراسٹرکچر کی کارکردگی چیک کریں | 30 منٹ |  
| **3. تجزیہ** | ساخت کو سمجھیں | GitHub Copilot کا استعمال کرتے ہوئے ٹیمپلیٹ کی معماری، بائسک فائلز، اور کوڈ کی تنظیم دریافت کریں | 30 منٹ |  
| **4. ترتیب** | azure.yaml کی گہرائی میں جائیں | `azure.yaml` کنفیگریشن، لائف سائیکل ہکس، اور ماحول کے متغیرات پر عبور حاصل کریں | 30 منٹ |  
| **5. تخصیص** | اسے اپنی بنائیں | AI سرچ، ٹریسنگ، تشخیص فعال کریں، اور اپنے منظر نامے کے لیے تخصیص کریں | 45 منٹ |  
| **6. ختم کاری** | صفائی کریں | `azd down --purge` کے ساتھ محفوظ طریقے سے وسائل ختم کریں | 15 منٹ |  
| **7. اختتام** | اگلے اقدامات | کارنامے، کلیدی تصورات کا جائزہ لیں اور اپنی تعلیمی راہ جاری رکھیں | 15 منٹ |  

**ورکشاپ کے بہاؤ:**  
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```
  
#### 🚀 ورکشاپ کا آغاز  
```bash
# آپشن 1: GitHub Codespaces (تجویز کردہ)
# محفوظ کرنے والے خانے میں "Code" → "Create codespace on main" پر کلک کریں

# آپشن 2: مقامی ترقی
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# ورکشاپ/README.md میں سیٹ اپ کی ہدایات پر عمل کریں
```
  
#### 🎯 ورکشاپ کے تعلیمی نتائج  
ورکشاپ مکمل کرنے والوں کو:  
- **پیداواری AI ایپلیکیشنز تعینات کریں**: Microsoft Foundry سروسز کے ساتھ AZD استعمال کریں  
- **ملٹی-ایجنٹ معماریوں میں مہارت حاصل کریں**: مربوط AI ایجنٹ حل نافذ کریں  
- **سیکیورٹی کی بہترین مشقیں نافذ کریں**: تصدیق اور رسائی کنٹرول کی ترتیب دیں  
- **اسکال کے لیے بہتر کریں**: لاگت مؤثر، کارکردگی بخش تعینات ڈیزائن کریں  
- **تعیناتی مسائل کا حل کریں**: عام مسائل کو خود حل کریں  

#### 📖 ورکشاپ کے ذرائع  
- **🎥 انٹرایکٹو گائیڈ**: [ورکشاپ مواد](workshop/README.md) - براؤزر پر مبنی سیکھنے کا ماحول  
- **📋 ماڈیول بذات ماڈیول ہدایات**:  
  - [0. تعارف](workshop/docs/instructions/0-Introduction.md) - ورکشاپ کا جائزہ اور مقاصد  
  - [1. انتخاب](workshop/docs/instructions/1-Select-AI-Template.md) - AI ٹیمپلیٹس تلاش کریں اور منتخب کریں  
  - [2. تصدیق](workshop/docs/instructions/2-Validate-AI-Template.md) - ٹیمپلیٹس تعینات کریں اور تصدیق کریں  
  - [3. تجزیہ](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - ٹیمپلیٹ کی معماری دریافت کریں  
  - [4. ترتیب](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml کا ماہر بنیں  
  - [5. تخصیص](workshop/docs/instructions/5-Customize-AI-Template.md) - اپنے منظرنامے کے لیے تخصیص کریں  
  - [6. ختم کاری](workshop/docs/instructions/6-Teardown-Infrastructure.md) - وسائل صاف کریں  
  - [7. اختتام](workshop/docs/instructions/7-Wrap-up.md) - جائزہ اور اگلے اقدامات  
- **🛠️ AI ورکشاپ لیب**: [AI ورکشاپ لیب](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI مرکوز مشقیں  
- **💡 جلد آغاز کریں**: [ورکشاپ سیٹ اپ گائیڈ](workshop/README.md#quick-start) - ماحول کی ترتیب  

**مناسب برائے**: کارپوریٹ تربیت، یونیورسٹی کورسز، خود رفتار سیکھنا، اور ڈیولپر بوٹ کیمپ۔  

---

## 📖 تفصیلی جائزہ: AZD کی صلاحیتیں  

بنیادی باتوں کے علاوہ، AZD پیداواری تعیناتیوں کے لیے طاقتور خصوصیات فراہم کرتا ہے:  

- **ٹیمپلیٹ پر مبنی تعیناتیاں** - عام ایپلیکیشن پیٹرنز کے لیے پہلے سے تیار ٹیمپلیٹس استعمال کریں  
- **انفراسٹرکچر ایز کوڈ** - Azure وسائل کو Bicep یا Terraform کے ذریعے منظم کریں  
- **انٹیگریٹڈ ورک فلو** - ایپلیکیشنز کو بآسانی پروویژن، تعینات، اور مانیٹر کریں  
- **ڈویلپر دوستانہ** - ڈویلپر کی پیداواری اور تجربے کو بہتر بنانے کے لیے بہتر بنایا گیا  

### **AZD + Microsoft Foundry: AI تعیناتیوں کے لیے بہترین**  

**AI حلوں کے لیے AZD کیوں؟** AZD AI ڈویلپرز کو درپیش اہم چیلنجوں کا حل پیش کرتا ہے:  

- **AI-ریڈی ٹیمپلیٹس** - Microsoft Foundry ماڈلز، Cognitive Services، اور ML ورک لوڈز کے لیے پہلے سے ترتیب شدہ ٹیمپلیٹس  
- **محفوظ AI تعیناتیاں** - AI خدمات، API keys، اور ماڈل اینڈ پوائنٹس کے لیے اندرونی حفاظتی پیٹرنز  
- **پیداواری AI پیٹرنز** - قابل توسیع، لاگت مؤثر AI ایپلیکیشن تعیناتیوں کے بہترین مشورے  
- **اینڈ ٹو اینڈ AI ورک فلو** - ماڈل کی ترقی سے لے کر پیداوار تک مکمل نگرانی کے ساتھ  
- **لاگت کی اصلاح** - AI ورک لوڈز کے لیے وسائل کی ذہین تقسیم اور پیمانہ بندی حکمت عملی  
- **Microsoft Foundry انضمام** - Microsoft Foundry ماڈل کیٹلاگ اور اینڈ پوائنٹس سے بغیر رکاوٹ رابطہ  

---

## 🎯 ٹیمپلیٹس اور مثالوں کی لائبریری  

### نمایاں: Microsoft Foundry ٹیمپلیٹس  
**اگر آپ AI ایپلیکیشنز تعینات کر رہے ہیں تو یہاں سے شروع کریں!**  

> **نوٹ:** یہ ٹیمپلیٹس مختلف AI پیٹرنز دکھاتے ہیں۔ کچھ بیرونی Azure Samples ہیں، جبکہ دیگر مقامی نفاذ ہیں۔  

| ٹیمپلیٹ | باب | پیچیدگی | خدمات | قسم |  
|----------|---------|------------|----------|------|  
| [**AI چیٹ کے ساتھ شروع کریں**](https://github.com/Azure-Samples/get-started-with-ai-chat) | باب 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | بیرونی |  
| [**AI ایجنٹس کے ساتھ شروع کریں**](https://github.com/Azure-Samples/get-started-with-ai-agents) | باب 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| بیرونی |  
| [**Azure سرچ + OpenAI ڈیمو**](https://github.com/Azure-Samples/azure-search-openai-demo) | باب 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | بیرونی |  
| [**OpenAI چیٹ ایپ کوئیک اسٹارٹ**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | باب 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | بیرونی |  
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | باب 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | بیرونی |  
| [**Contoso چیٹ RAG**](https://github.com/Azure-Samples/contoso-chat) | باب 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | بیرونی |  
| [**ریٹیل ملٹی-ایجنٹ سولوشن**](examples/retail-scenario.md) | باب 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **مقامی** |  

### نمایاں: مکمل تعلیمی منظرنامے  
**پیداواری-ریڈی ایپلیکیشن ٹیمپلیٹس جو تعلیمی ابواب سے ملتے ہیں**  

| ٹیمپلیٹ | تعلیمی باب | پیچیدگی | کلیدی سیکھنا |  
|----------|------------------|------------|--------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | باب 2 | ⭐ | بنیادی AI تعیناتی پیٹرنز |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | باب 2 | ⭐⭐ | Azure AI سرچ کے ساتھ RAG نفاذ |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | باب 4 | ⭐⭐ | دستاویز انٹیلیجنس انضمام |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | باب 5 | ⭐⭐⭐ | ایجنٹ فریم ورک اور فنکشن کالنگ |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | باب 8 | ⭐⭐⭐ | انٹرپرائز AI آرکیسٹریشن |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | باب 5 | ⭐⭐⭐⭐ | کسٹمر اور انوینٹری ایجنٹس کے ساتھ ملٹی-ایجنٹ معماری |  

### مثال کی قسم کے لحاظ سے سیکھنا  

> **📌 مقامی بمقابلہ بیرونی مثالیں:**  
> **مقامی مثالیں** (اس ریپو میں) = فوری استعمال کے لیے تیار  
> **بیرونی مثالیں** (Azure Samples) = منسلک ریپوز سے کلون کریں  

#### مقامی مثالیں (فوری استعمال کے لیے تیار)  
- [**ریٹیل ملٹی-ایجنٹ سولوشن**](examples/retail-scenario.md) - ARM ٹیمپلیٹس کے ساتھ مکمل پیداواری نفاذ  
  - ملٹی-ایجنٹ معماری (کسٹمر + انوینٹری ایجنٹس)  
  - جامع نگرانی اور تشخیص  
  - ایک کلک تعیناتی ARM ٹیمپلیٹ کے ذریعے  

#### مقامی مثالیں - کنٹینر ایپلیکیشنز (ابواب 2-5)  
**اس ریپوز میں کنٹینر تعیناتی کی جامع مثالیں:**  
- [**کنٹینر ایپ کی مثالیں**](examples/container-app/README.md) - کنٹینرائزڈ تعیناتیوں کے مکمل گائیڈ  
  - [سادہ Flask API](../../examples/container-app/simple-flask-api) - بنیادی REST API سکيل ٹو زیرو کے ساتھ  
  - [مائیکروسروسز کی معماری](../../examples/container-app/microservices) - پیداواری تیار کثیر سروس تعیناتی  
  - کوئیک اسٹارٹ، پیداوار، اور پیش رفت تعیناتی پیٹرنز  
  - نگرانی، سیکیورٹی، اور لاگت کی اصلاح کی رہنمائی  

#### بیرونی مثالیں - سادہ ایپلیکیشنز (ابواب 1-2)  
**شروع کرنے کے لیے یہ Azure Samples ریپوز کلون کریں:**  
- [سادہ ویب ایپ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - بنیادی تعیناتی پیٹرنز  
- [اسٹیٹک ویب سائٹ - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - اسٹیٹک مواد کی تعیناتی  
- [کنٹینر ایپ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API تعیناتی  

#### بیرونی مثالیں - ڈیٹا بیس انضمام (ابواب 3-4)  
- [ڈیٹا بیس ایپ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - ڈیٹا بیس کنیکٹیویٹی پیٹرنز  
- [فنکشنز + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - سرورلیس ڈیٹا ورک فلو  

#### بیرونی مثالیں - پیش رفتی پیٹرنز (ابواب 4-8)  
- [Java مائیکروسروسز](https://github.com/Azure-Samples/java-microservices-aca-lab) - کثیر سروس معماریات  
- [کنٹینر ایپس جابز](https://github.com/Azure-Samples/container-apps-jobs) - پس منظر کی پروسیسنگ  
- [انٹرپرائز ML پائپ لائن](https://github.com/Azure-Samples/mlops-v2) - پیداواری ریڈی ML پیٹرنز  

### بیرونی ٹیمپلیٹ کلیکشنز  
- [**سرکاری AZD ٹیمپلیٹ گیلری**](https://azure.github.io/awesome-azd/) - سرکاری اور کمیونٹی ٹیمپلیٹس کا منتخب مجموعہ  
- [**Azure Developer CLI ٹیمپلیٹس**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn ٹیمپلیٹ دستاویزات  
- [**مثالیں ڈائریکٹری**](examples/README.md) - تفصیلی وضاحتوں کے ساتھ مقامی تعلیمی مثالیں  

---

## 📚 تعلیمی ذرائع اور حوالہ جات  

### جلدی حوالہ جات  
- [**کمانڈ چیٹ شیٹ**](resources/cheat-sheet.md) - باب وار منظم ضروری azd کمانڈز  
- [**اصطلاحات**](resources/glossary.md) - Azure اور azd کی اصطلاحات  
- [**عمومی سوالات**](resources/faq.md) - تعلیمی ابواب کے حساب سے عام سوالات  
- [**مطالعہ گائیڈ**](resources/study-guide.md) - جامع عملی مشقیں  

### عملی ورکشاپس  
- [**AI ورکشاپ لیب**](docs/chapter-02-ai-development/ai-workshop-lab.md) - اپنی AI حلوں کو AZD سے قابل تعینات بنائیں (2-3 گھنٹے)  
- [**انٹرایکٹو ورکشاپ**](workshop/README.md) - MkDocs اور GitHub Codespaces کے ساتھ 8 ماڈیولز کی رہنمائی شدہ مشقیں  
  - ترتیب: تعارف → انتخاب → تصدیق → تجزیہ → ترتیب → تخصیص → ختم کاری → اختتام  

### بیرونی تعلیمی ذرائع  

- [Azure Developer CLI دستاویزات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure آرکیٹیکچر سینٹر](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure پرائسنگ کیلکولیٹر](https://azure.microsoft.com/pricing/calculator/)
- [Azure صورتحال](https://status.azure.com/)

### آپ کے ایڈیٹر کے لیے AI ایجنٹ مہارتیں
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI، Foundry، تعیناتی، تشخیص، لاگت کی بہتری، اور مزید کے لیے 37 کھلے ایجنٹ مہارتیں۔ انہیں GitHub Copilot، Cursor، Claude Code، یا کسی بھی سپورٹڈ ایجنٹ میں انسٹال کریں:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 فوری مسئلہ حل کرنے کی گائیڈ

**نئے صارفین کو عام مسائل اور فوری حل:**

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
<summary><strong>❌ "No subscription found" یا "Subscription not set"</strong></summary>

```bash
# دستیاب اشتراکات کی فہرست بنائیں
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

# یا ترقی کے دوران چھوٹے SKUs استعمال کریں
# infra/main.parameters.json میں ترمیم کریں:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" درمیان میں فیل ہونا</strong></summary>

```bash
# آپشن 1: صاف کریں اور دوبارہ کوشش کریں
azd down --force --purge
azd up

# آپشن 2: صرف بنیادی ڈھانچہ درست کریں
azd provision

# آپشن 3: تفصیلی حالت چیک کریں
azd show

# آپشن 4: Azure Monitor میں لاگ دیکھیں
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

# توثیق کی تصدیق کریں
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" یا ناموں کا تضاد</strong></summary>

```bash
# AZD منفرد نام پیدا کرتا ہے، لیکن اگر تنازعہ ہو:
azd down --force --purge

# پھر تازہ ماحول کے ساتھ دوبارہ کوشش کریں
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ ٹیمپلیٹ تعیناتی میں بہت دیر لگنا</strong></summary>

**معمول کے انتظار کے اوقات:**
- سادہ ویب ایپ: 5-10 منٹ
- ڈیٹا بیس والی ایپ: 10-15 منٹ
- AI ایپلیکیشنز: 15-25 منٹ (OpenAI کی فراہمی سست ہے)

```bash
# پیش رفت چیک کریں
azd show

# اگر 30 منٹ سے زیادہ رکے، تو Azure پورٹل چیک کریں:
azd monitor
# ناکام تعیناتیاں تلاش کریں
```
</details>

<details>
<summary><strong>❌ "Permission denied" یا "Forbidden"</strong></summary>

```bash
# اپنا Azure رول چیک کریں
az role assignment list --assignee $(az account show --query user.name -o tsv)

# آپ کو کم از کم "کانٹریبیوٹر" کا رول چاہیے
# اپنے Azure ایڈمن سے درخواست کریں کہ دیں:
# - کانٹریبیوٹر (وسائل کے لیے)
# - یوزر ایکسیس ایڈمنسٹریٹر (رول اسائنمنٹس کے لیے)
```
</details>

<details>
<summary><strong>❌ تعینات شدہ ایپلیکیشن کا URL نہیں مل رہا</strong></summary>

```bash
# تمام سروس اینڈ پوائنٹس دکھائیں
azd show

# یا Azure پورٹل کھولیں
azd monitor

# مخصوص سروس چیک کریں
azd env get-values
# *_URL متغیرات تلاش کریں
```
</details>

### 📚 مکمل مسئلہ حل کرنے کے وسائل

- **عام مسائل کی رہنمائی:** [تفصیلی حل](docs/chapter-07-troubleshooting/common-issues.md)
- **AI مخصوص مسائل:** [AI مسئلہ حل کرنا](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **ڈی بگ گائیڈ:** [مرحلہ وار ڈی بگنگ](docs/chapter-07-troubleshooting/debugging.md)
- **مدد حاصل کریں:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 کورس مکمل کرنا اور سرٹیفیکیشن

### پیش رفت کی مانیٹرنگ
اپنی سیکھنے کی پیش رفت کو ہر باب میں ٹریک کریں:

- [ ] **باب 1**: بنیاد اور فوری آغاز ✅
- [ ] **باب 2**: AI-فرسٹ ڈیولپمنٹ ✅  
- [ ] **باب 3**: کنفیگریشن اور توثیق ✅
- [ ] **باب 4**: انفراسٹرکچر بطور کوڈ اور تعیناتی ✅
- [ ] **باب 5**: ملٹی-ایجنٹ AI حل ✅
- [ ] **باب 6**: پری-ڈپلائمنٹ ویلیڈیشن اور منصوبہ بندی ✅
- [ ] **باب 7**: مسئلہ حل کرنا اور ڈی بگنگ ✅
- [ ] **باب 8**: پروڈکشن اور انٹرپرائز پیٹرنز ✅

### سیکھنے کی تصدیق
ہر باب مکمل کرنے کے بعد، اپنی معلومات کی تصدیق کریں:
1. **عملی مشق**: باب کا ہینڈز آن تعیناتی مکمل کریں
2. **علمی جائزہ**: اپنے باب کے FAQ سیکشن کا جائزہ لیں
3. **کمیونٹی بحث**: Azure Discord میں اپنے تجربے کا اشتراک کریں
4. **اگلا باب**: اگلے پیچیدگی کی سطح پر جائیں

### کورس مکمل کرنے کے فوائد
تمام ابواب مکمل کرنے پر، آپ کے پاس ہوگا:
- **پروڈکشن کا تجربہ**: حقیقی AI ایپلیکیشنز کو Azure پر تعینات کیا ہوا
- **پیشہ ورانہ مہارتیں**: انٹرپرائز ریڈی تعیناتی کی صلاحیتیں  
- **کمیونٹی کی پہچان**: Azure ڈیولپر کمیونٹی کے فعال رکن
- **کیریئر کی ترقی**: AZD اور AI تعیناتی کی مانگی ہوئی مہارتیں

---

## 🤝 کمیونٹی اور سپورٹ

### مدد اور سپورٹ حاصل کریں
- **تکنیکی مسائل:** [مسائل رپورٹ کریں اور فیچرز درخواست کریں](https://github.com/microsoft/azd-for-beginners/issues)
- **سیکھنے کے سوالات:** [Microsoft Azure Discord کمیونٹی](https://discord.gg/microsoft-azure) اور [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI مخصوص مدد:** [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) میں شامل ہوں
- **دستاویزات:** [آفیشل Azure Developer CLI دستاویزات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord کی کمیونٹی ان سائٹس

**#Azure چینل کے حالیہ پول کے نتائج:**
- **45٪** ڈویلپرز AI ورکلوڈز کے لیے AZD استعمال کرنا چاہتے ہیں
- **اہم چیلنجز:** ملٹی سروس تعیناتی، اسناد کا انتظام، پروڈکشن کی تیاری  
- **سب سے زیادہ مطلوبہ:** AI مخصوص ٹیمپلیٹس، مسئلہ حل کرنے کی گائیڈز، بہترین طریقے

**ہماری کمیونٹی میں شامل ہوں تاکہ:**
- اپنے AZD + AI تجربات شیئر کریں اور مدد حاصل کریں
- نئے AI ٹیمپلیٹس کے ابتدائی نظارے تک رسائی حاصل کریں
- AI تعیناتی کے بہترین طریقوں میں مدد دیں
- مستقبل کے AI + AZD فیچر ڈیولپمنٹ پر اثر انداز ہوں

### کورس میں تعاون کریں
ہم تعاون کا خیرمقدم کرتے ہیں! تفصیلات کے لیے ہماری [Contributing Guide](CONTRIBUTING.md) پڑھیں:
- **مواد کی بہتریاں:** موجودہ ابواب اور مثالیں بہتر بنائیں
- **نئی مثالیں:** حقیقی دنیا کے منظرنامے اور ٹیمپلیٹس شامل کریں  
- **ترجمہ:** کثیراللسانی سپورٹ برقرار رکھنے میں مدد کریں
- **بگ رپورٹس:** درستگی اور وضاحت بہتر بنائیں
- **کمیونٹی معیارات:** ہمارے جامع کمیونٹی گائیڈ لائنز پر عمل کریں

---

## 📄 کورس معلومات

### لائسنس
یہ پروجیکٹ MIT لائسنس کے تحت لائسنس یافتہ ہے - تفصیلات کے لیے [LICENSE](../../LICENSE) فائل دیکھیں۔

### متعلقہ Microsoft لرننگ وسائل

ہماری ٹیم دیگر جامع تعلیمی کورسز بناتی ہے:

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
 
### Generative AI سیریز
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### بنیادی سیکھنا
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### کوپائلٹ سیریز
[![AI جوڑی پروگرامنگ کے لیے کوپائلٹ](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET کے لیے کوپائلٹ](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![کوپائلٹ ایڈونچر](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ کورس نیویگیشن

**🚀 سیکھنا شروع کرنے کے لیے تیار ہیں؟**

**ابتدائی افراد**: [باب 1: بنیاد اور جلدی آغاز](#-chapter-1-foundation--quick-start) سے شروع کریں  
**AI ڈویلپرز**: [باب 2: AI-فرسٹ ڈیولپمنٹ](#-chapter-2-ai-first-development-recommended-for-ai-developers) پر جائیں  
**ماہر ڈویلپرز**: [باب 3: کنفیگریشن اور توثیق](#️-chapter-3-configuration--authentication) سے آغاز کریں

**اگلے اقدامات**: [باب 1 شروع کریں - AZD کی بنیادی باتیں](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**دستخطی دستبرداری**:  
اس دستاویز کو AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کیا گیا ہے۔ جب کہ ہم درستگی کی کوشش کرتے ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار تراجم میں غلطیاں یا نا درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں مستند ماخذ سمجھا جانا چاہیے۔ اہم معلومات کے لئے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمہ کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریحات کے لئے ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->