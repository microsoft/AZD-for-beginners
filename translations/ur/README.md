# AZD برائے مبتدی: ایک منظم تعلیمی سفر

![AZD-for-beginners](../../translated_images/ur/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### خودکار تراجم (ہمیشہ تازہ ترین)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](./README.md) | [Vietnamese](../vi/README.md)

> **مقامی طور پر کلون کرنا پسند کریں؟**
>
> یہ ریپوزیٹری 50+ زبانوں کے تراجم شامل کرتی ہے جو ڈاؤن لوڈ سائز میں نمایاں اضافہ کرتی ہے۔ تراجم کے بغیر کلون کرنے کے لیے sparse checkout استعمال کریں:
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
> اس سے آپ کو وہ سب کچھ ملے گا جو کورس مکمل کرنے کے لیے ضروری ہے، اور ڈاؤن لوڈ بھی تیز ہوگا۔
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 آج azd میں نیا کیا ہے

Azure Developer CLI روایتی ویب ایپس اور APIs سے آگے بڑھ چکا ہے۔ آج azd Azure پر **کسی بھی** ایپلیکیشن کی تعیناتی کے لیے واحد ٹول ہے—جس میں AI-چلائے گئے ایپلیکیشنز اور ذہین ایجنٹس بھی شامل ہیں۔

آپ کے لیے اس کا مطلب یہ ہے:

- **AI ایجنٹس اب azd کے پہلے درجے کے ورک لوڈز ہیں۔** آپ موجودہ `azd init` → `azd up` ورک فلو کا استعمال کرتے ہوئے AI ایجنٹ پروجیکٹس کو شروع، تعینات، اور منظم کر سکتے ہیں۔
- **Microsoft Foundry انضمام** ماڈل تعیناتی، ایجنٹ ہوسٹنگ، اور AI سروس کی تشکیل کو براہ راست azd ٹیمپلیٹ نظام میں لاتا ہے۔
- **بنیادی ورک فلو بدلا نہیں ہے۔** چاہے آپ ٹوڈو ایپ، مائیکروسروس، یا ملٹی-ایجنٹ AI حل تعینات کر رہے ہوں، کمانڈز ایک جیسے ہیں۔

اگر آپ نے پہلے azd استعمال کیا ہے، تو AI سپورٹ ایک قدرتی توسیع ہے—کوئی الگ ٹول یا اعلیٰ درجے کا راستہ نہیں۔ اگر آپ نیا آغاز کر رہے ہیں، تو آپ ایک ایسا ورک فلو سیکھیں گے جو ہر چیز کے لیے کام کرتا ہے۔

---

## 🚀 Azure Developer CLI (azd) کیا ہے؟

**Azure Developer CLI (azd)** ایک ڈویلپر دوست کمانڈ لائن ٹول ہے جو Azure پر ایپلیکیشنز کی تعیناتی کو آسان بناتا ہے۔ Azure کے درجنوں وسائل کو دستی طور پر بنانے اور جوڑنے کے بجائے، آپ ایک ہی کمانڈ سے مکمل ایپلیکیشنز تعینات کر سکتے ہیں۔

### `azd up` کا جادو

```bash
# یہ واحد کمانڈ سب کچھ کرتی ہے:
# ✅ تمام Azure وسائل تخلیق کرتی ہے
# ✅ نیٹ ورکنگ اور سیکیورٹی کو ترتیب دیتی ہے
# ✅ آپ کے ایپلیکیشن کوڈ کو بناتی ہے
# ✅ Azure پر تعینات کرتی ہے
# ✅ آپ کو ایک فعال URL دیتی ہے
azd up
```

**یہی ہے!** کوئی Azure پورٹل پر کلکنگ نہیں، کوئی پیچیدہ ARM ٹیمپلیٹس سیکھنے کی ضرورت نہیں، کوئی دستی ترتیب نہیں—صرف Azure پر کام کرتی ایپلیکیشنز۔

---

## ❓ Azure Developer CLI اور Azure CLI میں کیا فرق ہے؟

یہ مبتدیوں کے سب سے عام سوالات میں سے ہے۔ یہاں آسان جواب ہے:

| خصوصیت | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **مقصد** | انفرادی Azure وسائل کا انتظام | مکمل ایپلیکیشنز کی تعیناتی |
| **ذہنیت** | انفراسٹرکچر پر مرکوز | ایپلیکیشن پر مرکوز |
| **مثال** | `az webapp create --name myapp...` | `azd up` |
| **سیکھنے کا مرحلہ** | Azure سروسز کا جاننا ضروری | صرف اپنی ایپ جانیں |
| **سب سے بہتر ہے** | DevOps، انفراسٹرکچر | ڈویلپرز، پروٹوٹائپنگ |

### آسان مثال

- **Azure CLI** ایسا ہے جیسے آپ کے پاس گھر بنانے کے تمام اوزار ہوں—ہتھوڑے، آری، کیل۔ آپ کچھ بھی بنا سکتے ہیں، لیکن آپ کو تعمیر کا علم ہونا چاہیے۔
- **Azure Developer CLI** ایسا ہے جیسے آپ ایک ٹھیکیدار کو ملازم رکھیں—آپ بتاتے ہیں کیا چاہیے، اور وہ تعمیر کا اہتمام کرتا ہے۔

### کب کون استعمال کریں

| منظر نامہ | اسے استعمال کریں |
|----------|------------------|
| "میں اپنی ویب ایپ جلدی تعینات کرنا چاہتا ہوں" | `azd up` |
| "مجھے صرف ایک اسٹوریج اکاؤنٹ بنانا ہے" | `az storage account create` |
| "میں ایک مکمل AI ایپ بنا رہا ہوں" | `azd init --template azure-search-openai-demo` |
| "مجھے کسی مخصوص Azure وسائل کی خرابی دور کرنی ہے" | `az resource show` |
| "میں چند منٹوں میں پروڈکشن کے لیے تیار تعیناتی چاہتا ہوں" | `azd up --environment production` |

### یہ دونوں ایک ساتھ کام کرتے ہیں!

AZD اندر Azure CLI استعمال کرتا ہے۔ آپ دونوں استعمال کر سکتے ہیں:
```bash
# اپنی ایپ کو AZD کے ذریعے تعینات کریں
azd up

# پھر Azure CLI کے ذریعے مخصوص وسائل کو باریک بینی سے ترتیب دیں
az webapp config set --name myapp --always-on true
```

---

## 🌟 بہترین AZD میں ٹیمپلیٹس تلاش کریں

خود سے شروع نہ کریں! **بہترین AZD** کمیونٹی کا مجموعہ ہے تیار ٹیمپلیٹس کا جنہیں فوری تعینات کیا جا سکتا ہے:

| ذریعہ | وضاحت |
|--------|---------|
| 🔗 [**بہترین AZD گیلری**](https://azure.github.io/awesome-azd/) | 200+ ٹیمپلیٹس ایک کلک میں تعینات کریں |
| 🔗 [**ٹیمپلیٹ جمع کروائیں**](https://github.com/Azure/awesome-azd/issues) | اپنی ٹیمپلیٹ کمیونٹی کے لیے مہیا کریں |
| 🔗 [**GitHub ریپوزیٹری**](https://github.com/Azure/awesome-azd) | اسٹار دیں اور سورس دریافت کریں |

### بہترین AZD سے مقبول AI ٹیمپلیٹس

```bash
# RAG چیٹ مائیکروسافٹ فاؤنڈری ماڈلز + مصنوعی ذہانت سرچ کے ساتھ
azd init --template azure-search-openai-demo

# فوری مصنوعی ذہانت چیٹ ایپلیکیشن
azd init --template openai-chat-app-quickstart

# فاؤنڈری ایجنٹس کے ساتھ مصنوعی ذہانت ایجنٹس
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 مراحل میں شروع کریں

شروع کرنے سے پہلے، یقینی بنائیں کہ آپ کا کمپیوٹر اس ٹیمپلیٹ کے لیے تیار ہے جسے آپ تعینات کرنا چاہتے ہیں:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

اگر کوئی لازمی چیک ناکام ہو جائے، پہلے اسے ٹھیک کریں اور پھر جلدی آغاز کریں۔

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

### مرحلہ 2: AZD کے لیے توثیق

```bash
# اگر آپ اس کورس میں براہِ راست Azure CLI کمانڈز استعمال کرنے کا ارادہ رکھتے ہیں تو یہ اختیاری ہے
az login

# AZD ورک فلو کے لیے ضروری
azd auth login
```

اگر آپ کو یقین نہیں ہے کہ کونسی چاہیے، تو مکمل سیٹ اپ کے لیے [تنصیب و سیٹ اپ](docs/chapter-01-foundation/installation.md#authentication-setup) دیکھیں۔

### مرحلہ 3: اپنی پہلی ایپ تعینات کریں

```bash
# ٹیمپلیٹ سے شروعات کریں
azd init --template todo-nodejs-mongo

# ایزور پر تعینات کریں (یہ سب کچھ بنا دیتا ہے!)
azd up
```

**🎉 یہی ہے!** آپ کی ایپ اب Azure پر چل رہی ہے۔

### صفائی (مت بھولیں!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 اس کورس کا استعمال کیسے کریں

یہ کورس **تدریجی سیکھنے** کے لیے ڈیزائن کیا گیا ہے—جہاں آرام دہ محسوس کریں وہاں سے شروع کریں اور آہستہ آہستہ آگے بڑھیں:

| آپ کا تجربہ | یہاں سے شروع کریں |
|-------------|------------------|
| **Azure میں مکمل نیا** | [باب 1: بنیاد](#-chapter-1-foundation--quick-start) |
| **Azure جانتے ہیں، AZD میں نئے ہیں** | [باب 1: بنیاد](#-chapter-1-foundation--quick-start) |
| **AI ایپس تعینات کرنا چاہتے ہیں** | [باب 2: AI-اول ترقی](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **عملی مشق چاہتے ہیں** | [🎓 انٹرایکٹو ورکشاپ](workshop/README.md) - 3-4 گھنٹے کی رہنمائی والی ورکشاپ |
| **پروڈکشن پیٹرنز درکار ہیں** | [باب 8: پروڈکشن & انٹرپرائز](#-chapter-8-production--enterprise-patterns) |

### فوری سیٹ اپ

1. **اس ریپوزیٹری کو فورک کریں**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **کلون کریں**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **مدد حاصل کریں**: [Azure Discord کمیونٹی](https://discord.com/invite/ByRwuEEgH4)

> **مقامی طور پر کلون کرنا پسند کریں؟**

> یہ ریپوزیٹری 50+ زبانوں کے تراجم شامل کرتی ہے جو ڈاؤن لوڈ سائز میں نمایاں اضافہ کرتی ہے۔ تراجم کے بغیر کلون کرنے کے لیے sparse checkout استعمال کریں:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> اس سے آپ کو وہ سب کچھ ملے گا جو کورس مکمل کرنے کے لیے ضروری ہے، اور ڈاؤن لوڈ بھی تیز ہوگا۔

## کورس کا جائزہ

Azure Developer CLI (azd) میں مہارت حاصل کریں منظم شدہ ابواب کے ذریعے جو تدریجی سیکھنے کے لیے ترتیب دئیے گئے ہیں۔ **خصوصی توجہ AI ایپلیکیشن تعیناتی پر Microsoft Foundry انضمام کے ساتھ۔**

### یہ کورس جدید ڈویلپرز کے لیے کیوں ضروری ہے

Microsoft Foundry Discord کمیونٹی کے تاثرات کی بنیاد پر، **45٪ ڈویلپرز AZD کو AI ورک لوڈز کے لیے استعمال کرنا چاہتے ہیں** لیکن انہیں درج ذیل چیلنجز کا سامنا ہے:
- پیچیدہ ملٹی سروس AI آرکیٹیکچرز
- پروڈکشن AI تعیناتی کے بہترین طریقے  
- Azure AI سروس انضمام اور تشکیل
- AI ورک لوڈز کے لیے لاگت کی بہتر سازی
- AI مخصوص تعیناتی کے مسائل کا حل

### سیکھنے کے مقاصد

اس منظم کورس کو مکمل کر کے آپ:
- **AZD کے بنیادی اصول سیکھیں گے**: بنیادی تصورات، تنصیب، اور ترتیب
- **AI ایپلیکیشنز تعینات کریں گے**: AZD کو Microsoft Foundry خدمات کے ساتھ استعمال کریں گے
- **انفراسٹرکچر بطور کوڈ نافذ کریں گے**: Bicep ٹیمپلیٹس کے ذریعے Azure وسائل کا انتظام کریں گے
- **تعیناتیاں مشکل حل کریں گے**: عام مسائل کا حل اور ڈی بگنگ کریں گے
- **پروڈکشن کے لیے بہتر بنائیں گے**: حفاظتی، اسکیلنگ، نگرانی، اور لاگت کے انتظام
- **ملٹی-ایجنٹ حل بنائیں گے**: پیچیدہ AI آرکیٹیکچر کی تعیناتی کریں گے

## شروع کرنے سے پہلے: اکاؤنٹس، رسائی، اور مفروضات

باب 1 شروع کرنے سے پہلے، یقینی بنائیں کہ آپ کے پاس درج ذیل تیاریاں موجود ہیں۔ اس گائیڈ میں بعد کے انسٹالیشن مراحل ان بنیادی چیزوں کو فرض کرتے ہیں کہ وہ پہلے سے طے شدہ ہیں۔
- **ایک Azure سبسکرپشن**: آپ کام کے موجودہ سبسکرپشن یا اپنے اکاؤنٹ سے استعمال کر سکتے ہیں، یا شروع کرنے کے لیے ایک [مفت ٹرائل](https://aka.ms/azurefreetrial) بنا سکتے ہیں۔
- **Azure وسائل بنانے کی اجازت**: زیادہ تر مشقوں کے لیے، آپ کے پاس ہدف سبسکرپشن یا ریسورس گروپ پر کم از کم **Contributor** رسائی ہونی چاہیے۔ کچھ ابواب میں یہ بھی فرض کیا جا سکتا ہے کہ آپ ریسورس گروپ، مینیجڈ آئیڈینٹٹیز، اور RBAC اسائنمنٹس بنا سکتے ہیں۔
- [**گیٹ ہب اکاؤنٹ**](https://github.com): یہ ریپوزیٹری فورک کرنے، اپنی تبدیلیوں کو ٹریک کرنے، اور ورکشاپ کے لیے GitHub Codespaces استعمال کرنے کے لیے مفید ہے۔
- **ٹیمپلیٹ رن ٹائم کے لیے درکار چیزیں**: کچھ ٹیمپلیٹس کو مقامی ٹولز جیسے Node.js، Python، Java، یا Docker کی ضرورت ہوتی ہے۔ شروع کرنے سے پہلے سیٹ اپ ویلیڈیٹر چلائیں تاکہ آپ گم شدہ ٹولز جلدی پکڑ سکیں۔
- **بنیادی ٹرمینل واقفیت**: آپ کو ماہر ہونے کی ضرورت نہیں، لیکن `git clone`, `azd auth login`, اور `azd up` جیسے کمانڈز چلانے میں آرام دہ ہونا چاہیے۔

> **کیا آپ انٹرپرائز سبسکرپشن میں کام کر رہے ہیں؟**  
> اگر آپ کا Azure ماحول ایک ایڈمنسٹریٹر کے ذریعے منظم ہے، تو پہلے سے تصدیق کریں کہ آپ اس سبسکرپشن یا ریسورس گروپ میں وسائل تعینات کر سکتے ہیں جسے آپ استعمال کرنے کا ارادہ رکھتے ہیں۔ اگر نہیں، تو شروع کرنے سے پہلے سینڈباکس سبسکرپشن یا Contributor رسائی کے لیے پوچھیں۔

> **Azure میں نئے ہیں؟**  
> اپنی Azure ٹرائل یا پے-ایز-یو-گو سبسکرپشن https://aka.ms/azurefreetrial پر شروع کریں تاکہ آپ بغیر کرایہ دار کی سطح کی منظوری کے انتظار کے مشقیں مکمل کر سکیں۔

## 🗺️ کورس کا نقشہ: ابواب کے لحاظ سے فوری نیویگیشن

ہر باب کا ایک مخصوص README ہوتا ہے جس میں سیکھنے کے مقاصد، تیز آغاز، اور مشقیں شامل ہیں:

| باب | موضوع | اسباق | دورانیہ | پیچیدگی |
|---------|-------|---------|----------|------------|
| **[باب 1: بنیاد](docs/chapter-01-foundation/README.md)** | آغاز کرنا | [AZD بیسکس](docs/chapter-01-foundation/azd-basics.md) &#124; [انسٹالیشن](docs/chapter-01-foundation/installation.md) &#124; [پہلا پروجیکٹ](docs/chapter-01-foundation/first-project.md) | 30-45 منٹ | ⭐ |
| **[باب 2: AI ڈیولپمنٹ](docs/chapter-02-ai-development/README.md)** | AI-فرسٹ ایپس | [فاؤنڈری انٹیگریشن](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI ایجنٹس](docs/chapter-02-ai-development/agents.md) &#124; [ماڈل تعیناتی](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ورکشاپ](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 گھنٹے | ⭐⭐ |
| **[باب 3: کنفیگریشن](docs/chapter-03-configuration/README.md)** | اتھ اور سیکیورٹی | [کنفیگریشن](docs/chapter-03-configuration/configuration.md) &#124; [اتھ اور سیکیورٹی](docs/chapter-03-configuration/authsecurity.md) | 45-60 منٹ | ⭐⭐ |
| **[باب 4: انفراسٹرکچر](docs/chapter-04-infrastructure/README.md)** | IaC اور تعیناتی | [تعیناتی گائیڈ](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [پروویژننگ](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 گھنٹے | ⭐⭐⭐ |
| **[باب 5: ملٹی ایجنٹ](docs/chapter-05-multi-agent/README.md)** | AI ایجنٹ حل | [ریٹیل منظرنامہ](examples/retail-scenario.md) &#124; [ہم آہنگی کے پیٹرنز](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 گھنٹے | ⭐⭐⭐⭐ |
| **[باب 6: پری-ڈیپلائمنٹ](docs/chapter-06-pre-deployment/README.md)** | منصوبہ بندی اور تصدیق | [پریف لائٹ چیکس](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [صلاحیت کی منصوبہ بندی](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU انتخاب](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [ایپ انسائٹس](docs/chapter-06-pre-deployment/application-insights.md) | 1 گھنٹہ | ⭐⭐ |
| **[باب 7: مسئلہ حل](docs/chapter-07-troubleshooting/README.md)** | ڈیبگ اور درست کریں | [عام مسائل](docs/chapter-07-troubleshooting/common-issues.md) &#124; [ڈیبگنگ](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI مسائل](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 گھنٹے | ⭐⭐ |
| **[باب 8: پروڈکشن](docs/chapter-08-production/README.md)** | انٹرپرائز پیٹرنز | [پروڈکشن طریقے](docs/chapter-08-production/production-ai-practices.md) | 2-3 گھنٹے | ⭐⭐⭐⭐ |
| **[🎓 ورکشاپ](workshop/README.md)** | عملی تجربہ | [تعارف](workshop/docs/instructions/0-Introduction.md) &#124; [انتخاب](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [تصدیق](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [تجزیہ](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [کنفیگریشن](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [حسب ضرورت](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [تنظیم ختم](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [اختتام](workshop/docs/instructions/7-Wrap-up.md) | 3-4 گھنٹے | ⭐⭐ |

**کل کورس کا دورانیہ:** تقریباً 10-14 گھنٹے | **مہارت کی ترقی:** ابتدائی → پروڈکشن کے لیے تیار

---

## 📚 سیکھنے کے ابواب

*اپنے تجربے کی سطح اور مقاصد کی بنیاد پر اپنی تعلیمی راہ منتخب کریں*

### 🚀 باب 1: بنیاد اور فوری آغاز  
**ضروریات:** Azure سبسکرپشن، بنیادی کمانڈ لائن کی معلومات  
**دورانیہ:** 30-45 منٹ  
**پیچیدگی:** ⭐

#### آپ کیا سیکھیں گے  
- Azure Developer CLI کے بنیادی اصول  
- اپنے پلیٹ فارم پر AZD انسٹال کرنا  
- اپنی پہلی کامیاب تعیناتی

#### سیکھنے کے وسائل  
- **🎯 یہاں سے شروع کریں**: [Azure Developer CLI کیا ہے؟](#what-is-azure-developer-cli)  
- **📖 نظریہ**: [AZD بیسکس](docs/chapter-01-foundation/azd-basics.md) - بنیادی تصورات اور اصطلاحات  
- **⚙️ سیٹ اپ**: [انسٹالیشن اور سیٹ اپ](docs/chapter-01-foundation/installation.md) - پلیٹ فارم مخصوص رہنما  
- **🛠️ عملی مشق**: [آپ کا پہلا پروجیکٹ](docs/chapter-01-foundation/first-project.md) - قدم بہ قدم ٹیوٹوریل  
- **📋 فوری حوالہ**: [کمانڈ چیٹ شیٹ](resources/cheat-sheet.md)

#### عملی مشقیں  
```bash
# فوری تنصیب کی جانچ
azd version

# اپنی پہلی ایپلیکیشن تعینات کریں
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 باب کا نتیجہ**: AZD استعمال کرتے ہوئے آسان ویب ایپلیکیشن کامیابی سے Azure پر تعینات کریں

**✅ کامیابی کی تصدیق:**  
```bash
# باب 1 مکمل کرنے کے بعد، آپ کو قابل ہونا چاہیے کہ:
azd version              # نصب شدہ ورژن دکھاتا ہے
azd init --template todo-nodejs-mongo  # پراجیکٹ کو شروع کرتا ہے
azd up                  # Azure پر تعینات کرتا ہے
azd show                # چلنے والی ایپلیکیشن کا یو آر ایل دکھاتا ہے
# ایپلیکیشن براؤزر میں کھلتی ہے اور کام کرتی ہے
azd down --force --purge  # وسائل کو صاف کرتا ہے
```
  
**📊 وقت کی سرمایہ کاری:** 30-45 منٹ  
**📈 مہارت کی سطح بعد:** بنیادی ایپلیکیشنز خود مختاری سے تعینات کر سکتے ہیں

---

### 🤖 باب 2: AI-فرسٹ ڈویلپمنٹ (AI ڈیولپرز کے لیے تجویز کردہ)  
**ضروریات:** باب 1 مکمل  
**دورانیہ:** 1-2 گھنٹے  
**پیچیدگی:** ⭐⭐

#### آپ کیا سیکھیں گے  
- Microsoft Foundry کا AZD کے ساتھ انٹیگریشن  
- AI سے چلنے والی ایپلیکیشنز کی تعیناتی  
- AI سروس کنفیگریشنز کی سمجھ

#### سیکھنے کے وسائل  
- **🎯 یہاں سے شروع کریں**: [Microsoft Foundry انٹیگریشن](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 AI ایجنٹس**: [AI ایجنٹس گائیڈ](docs/chapter-02-ai-development/agents.md) - AZD کے ساتھ ذہین ایجنٹس کی تعیناتی  
- **📖 پیٹرنز**: [AI ماڈل تعیناتی](docs/chapter-02-ai-development/ai-model-deployment.md) - AI ماڈلز کی تعیناتی اور انتظام  
- **🛠️ ورکشاپ**: [AI ورکشاپ لیب](docs/chapter-02-ai-development/ai-workshop-lab.md) - اپنے AI حل AZD کے لیے تیار کریں  
- **🎥 انٹرایکٹو گائیڈ**: [ورکشاپ مواد](workshop/README.md) - MkDocs * DevContainer ماحول کے ساتھ براؤزر پر مبنی سیکھنا  
- **📋 ٹیمپلیٹس**: [Microsoft Foundry ٹیمپلیٹس](#ورکشاپ-کے-وسائل)  
- **📝 مثالیں**: [AZD تعیناتی کی مثالیں](examples/README.md)

#### عملی مشقیں  
```bash
# اپنی پہلی AI ایپلیکیشن تعینات کریں
azd init --template azure-search-openai-demo
azd up

# اضافی AI ٹیمپلیٹس آزمائیں
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 باب کا نتیجہ**: RAG صلاحیتوں کے ساتھ AI سے چلنے والی چیٹ ایپلیکیشن تعینات اور ترتیب دیں

**✅ کامیابی کی تصدیق:**  
```bash
# باب 2 کے بعد، آپ کو قابل ہونا چاہیے:
azd init --template azure-search-openai-demo
azd up
# AI چیٹ انٹرفیس کا ٹیسٹ کریں
# سوالات پوچھیں اور ذرائع کے ساتھ AI سے چلنے والے جوابات حاصل کریں
# تلاش کے انضمام کی درستگی کی تصدیق کریں
azd monitor  # چیک کریں کہ ایپلیکیشن انسائٹس ٹیلی میٹری دکھاتا ہے
azd down --force --purge
```
  
**📊 وقت کی سرمایہ کاری:** 1-2 گھنٹے  
**📈 مہارت کی سطح بعد:** پروڈکشن کے لیے تیار AI ایپلیکیشنز تعینات اور ترتیب دے سکتے ہیں  
**💰 لاگت کا احساس:** ماہانہ $80-150 ترقیاتی لاگت، $300-3500 ماہانہ پروڈکشن لاگت سمجھیں

#### 💰 AI تعیناتیوں کے لیے لاگت کے پہلو

**ترقیاتی ماحول (تخمینہ $80-150/ماہ):**  
- Microsoft Foundry ماڈلز (Pay-as-you-go): $0-50/ماہ (ٹوکین کے استعمال پر مبنی)  
- AI سرچ (بنیادی سطح): $75/ماہ  
- کنٹینر ایپس (کنسپشن): $0-20/ماہ  
- اسٹوریج (معیاری): $1-5/ماہ

**پروڈکشن ماحول (تخمینہ $300-3,500+/ماہ):**  
- Microsoft Foundry ماڈلز (PTU مستقل کارکردگی کے لیے): $3,000+/ماہ یا Pay-as-you-go بڑی مقدار کے ساتھ  
- AI سرچ (معیاری سطح): $250/ماہ  
- کنٹینر ایپس (مختص): $50-100/ماہ  
- ایپلیکیشن انسائٹس: $5-50/ماہ  
- اسٹوریج (پریمیم): $10-50/ماہ

**💡 لاگت کی بچت کے مشورے:**  
- سیکھنے کے لیے **مفت سطح** Microsoft Foundry ماڈلز استعمال کریں (Azure OpenAI میں 50,000 ٹوکینز/ماہ شامل ہیں)  
- ترقی کے دوران غیر فعال کرنے کے لیے `azd down` چلائیں  
- ابتدا میں کنسپشن بیسڈ بلنگ استعمال کریں، صرف پروڈکشن کے لیے PTU میں اپ گریڈ کریں  
- تعیناتی سے پہلے `azd provision --preview` سے لاگت کا تخمینہ لگائیں  
- خودکار اسکیلنگ فعال کریں: صرف استعمال کے مطابق ادائیگی کریں

**لاگت کی نگرانی:**  
```bash
# ماہانہ متوقع اخراجات چیک کریں
azd provision --preview

# Azure پورٹل میں حقیقی اخراجات کی نگرانی کریں
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ باب 3: کنفیگریشن اور توثیق  
**ضروریات:** باب 1 مکمل  
**دورانیہ:** 45-60 منٹ  
**پیچیدگی:** ⭐⭐

#### آپ کیا سیکھیں گے  
- ماحول کی کنفیگریشن اور انتظام  
- اتھینٹیکشن اور سیکیورٹی کی بہترین عملی طریقے  
- وسائل کے نام اور تنظیم

#### سیکھنے کے وسائل  
- **📖 کنفیگریشن**: [کنفیگریشن گائیڈ](docs/chapter-03-configuration/configuration.md) - ماحول کی ترتیب  
- **🔐 سیکیورٹی**: [اتھینٹیکشن پیٹرنز اور مینیجڈ آئیڈینٹی](docs/chapter-03-configuration/authsecurity.md) - اتھینٹیکشن کے پیٹرنز  
- **📝 مثالیں**: [ڈیٹابیس ایپ مثال](examples/database-app/README.md) - AZD ڈیٹابیس کی مثالیں

#### عملی مشقیں  
- متعدد ماحول (dev، staging، prod) کنفیگر کریں  
- مینیجڈ آئیڈینٹی اتھینٹیکیشن سیٹ اپ کریں  
- ماحول خصوصیات کی کنفیگریشنز نافذ کریں

**💡 باب کا نتیجہ**: متعدد ماحول کو مناسب اتھینٹیکیشن اور سیکیورٹی کے ساتھ منظم کریں

---

### 🏗️ باب 4: انفراسٹرکچر ایز کوڈ اور تعیناتی  
**ضروریات:** ابواب 1-3 مکمل  
**دورانیہ:** 1-1.5 گھنٹے  
**پیچیدگی:** ⭐⭐⭐

#### آپ کیا سیکھیں گے  
- جدید تعیناتی کے پیٹرنز  
- انفراسٹرکچر ایز کوڈ Bicep کے ساتھ  
- وسائل کی تیاری کی حکمت عملی

#### سیکھنے کے وسائل  
- **📖 تعیناتی**: [تعیناتی گائیڈ](docs/chapter-04-infrastructure/deployment-guide.md) - مکمل ورک فلو  
- **🏗️ پروویژننگ**: [وسائل کی تیاری](docs/chapter-04-infrastructure/provisioning.md) - Azure ریسورس مینجمنٹ  
- **📝 مثالیں**: [کنٹینر ایپ مثال](../../examples/container-app) - کنٹینرائزڈ تعیناتیاں

#### عملی مشقیں  
- کسٹم Bicep ٹیمپلیٹس بنائیں  
- ملٹی سروس ایپلیکیشنز تعینات کریں  
- بلیو-گرین تعیناتی حکمت عملی نافذ کریں

**💡 باب کا نتیجہ**: کسٹم انفراسٹرکچر ٹیمپلیٹس استعمال کرتے ہوئے پیچیدہ ملٹی سروس ایپلیکیشنز تعینات کریں

---

### 🎯 باب 5: ملٹی-ایجنٹ AI حل (ایڈوانسڈ)  
**ضروریات:** ابواب 1-2 مکمل  
**دورانیہ:** 2-3 گھنٹے  
**پیچیدگی:** ⭐⭐⭐⭐

#### آپ کیا سیکھیں گے  
- ملٹی ایجنٹ فن تعمیر کے پیٹرنز  
- ایجنٹ آرکیسٹریشن اور ہم آہنگی  
- پروڈکشن کے لیے تیار AI تعیناتیاں

#### سیکھنے کے وسائل  
- **🤖 نمایاں پروجیکٹ**: [ریٹیل ملٹی-ایجنٹ حل](examples/retail-scenario.md) - مکمل نفاذ  
- **🛠️ ARM ٹیمپلیٹس**: [ARM ٹیمپلیٹ پیکیج](../../examples/retail-multiagent-arm-template) - ایک کلک تعیناتی  
- **📖 فن تعمیر**: [ملٹی ایجنٹ ہم آہنگی کے پیٹرنز](docs/chapter-06-pre-deployment/coordination-patterns.md) - پیٹرنز

#### عملی مشقیں  
```bash
# مکمل ریٹیل ملٹی ایجنٹ حل کو نافذ کریں
cd examples/retail-multiagent-arm-template
./deploy.sh

# ایجنٹ کنفیگریشنز کو دریافت کریں
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 باب کا نتیجہ**: کسٹمر اور انوینٹری ایجنٹس کے ساتھ پروڈکشن کے لیے تیار ملٹی-ایجنٹ AI حل تعینات اور منظم کریں

---

### 🔍 باب 6: پری-ڈیپلائمنٹ تصدیق اور منصوبہ بندی  
**ضروریات:** باب 4 مکمل  
**دورانیہ:** 1 گھنٹہ  
**پیچیدگی:** ⭐⭐
#### آپ کیا سیکھیں گے
- صلاحیت کی منصوبہ بندی اور وسائل کی توثیق  
- ایس کے یو کے انتخاب کی حکمت عملیاں  
- پری-فلائٹ چیکس اور آٹومیشن  

#### سیکھنے کے وسائل
- **📊 منصوبہ بندی**: [صلاحیت کی منصوبہ بندی](docs/chapter-06-pre-deployment/capacity-planning.md) - وسائل کی توثیق  
- **💰 انتخاب**: [SKU کا انتخاب](docs/chapter-06-pre-deployment/sku-selection.md) - موثر قیمت کے انتخاب  
- **✅ توثیق**: [پری-فلائٹ چیکس](docs/chapter-06-pre-deployment/preflight-checks.md) - خودکار اسکرپٹس  

#### عملی مشقیں
- صلاحیت کی توثیقی اسکرپٹس چلائیں  
- قیمت کے لیے SKU کے انتخاب کو بہتر بنائیں  
- خودکار پری-ڈپلائمنٹ چیکس نافذ کریں  

**💡 باب کا نتیجہ**: عملدرآمد سے پہلے ڈپلائمنٹس کی توثیق اور اصلاح  

---

### 🚨 باب 7: مسئلہ حل کرنا اور ڈیبگنگ  
**ضروریات**: کوئی بھی ڈپلائمنٹ باب مکمل ہونا  
**دورانیہ**: 1-1.5 گھنٹے  
**پیچیدگی**: ⭐⭐  

#### آپ کیا سیکھیں گے
- منظم ڈیبگنگ طریقے  
- عام مسائل اور حل  
- AI مخصوص مسئلہ حل کرنا  

#### سیکھنے کے وسائل
- **🔧 عام مسائل**: [عام مسائل](docs/chapter-07-troubleshooting/common-issues.md) - سوالات اور حل  
- **🕵️ ڈیبگنگ**: [ڈیبگنگ گائیڈ](docs/chapter-07-troubleshooting/debugging.md) - قدم بہ قدم حکمت عملیاں  
- **🤖 AI مسائل**: [AI مخصوص مسئلہ حل کرنا](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI سروس کے مسائل  

#### عملی مشقیں
- ڈپلائمنٹ ناکامیوں کی تشخیص کریں  
- توثیق کے مسائل کو حل کریں  
- AI سروس کے کنیکٹیویٹی کی ڈیبگنگ کریں  

**💡 باب کا نتیجہ**: عام ڈپلائمنٹ مسائل کی خود مختار تشخیص اور حل  

---

### 🏢 باب 8: پروڈکشن اور انٹرپرائز پیٹرنز  
**ضروریات**: ابواب 1-4 مکمل ہونا  
**دورانیہ**: 2-3 گھنٹے  
**پیچیدگی**: ⭐⭐⭐⭐  

#### آپ کیا سیکھیں گے
- پروڈکشن ڈپلائمنٹ کی حکمت عملیاں  
- انٹرپرائز سیکیورٹی پیٹرنز  
- مانیٹرنگ اور قیمت کی اصلاح  

#### سیکھنے کے وسائل
- **🏭 پروڈکشن**: [پروڈکشن AI بہترین طریقے](docs/chapter-08-production/production-ai-practices.md) - انٹرپرائز پیٹرنز  
- **📝 مثالیں**: [مائیکروسروسز کی مثال](../../examples/microservices) - پیچیدہ ڈھانچے  
- **📊 مانیٹرنگ**: [اپلیکیشن انسائٹس انٹیگریشن](docs/chapter-06-pre-deployment/application-insights.md) - مانیٹرنگ  

#### عملی مشقیں
- انٹرپرائز سیکیورٹی پیٹرنز نافذ کریں  
- جامع مانیٹرنگ سیٹ اپ کریں  
- مناسب گورننس کے ساتھ پروڈکشن میں تعینات کریں  

**💡 باب کا نتیجہ**: مکمل پروڈکشن صلاحیت کے ساتھ انٹرپرائز-ریڈی ایپلیکیشنز کی تعیناتی  

---

## 🎓 ورکشاپ کا جائزہ: عملی سیکھنے کا تجربہ

> **⚠️ ورکشاپ کی حالت: فعال ترقی**  
> ورکشاپ کے مواد پر ابھی کام جاری ہے اور اسے بہتر بنایا جا رہا ہے۔ بنیادی ماڈیولز فعال ہیں، لیکن کچھ اعلیٰ حصے نامکمل ہیں۔ ہم تمام مواد مکمل کرنے کے لیے سرگرم محنت کر رہے ہیں۔ [ترقی ٹریک کریں →](workshop/README.md)

### انٹرایکٹو ورکشاپ کے مواد  
**مکمل عملی سیکھنے کا تجربہ براوزر پر مبنی ٹولز اور رہنمائی کے ساتھ**  

ہمارے ورکشاپ مواد میں منظم، انٹرایکٹو سیکھنے کا تجربہ فراہم کیا گیا ہے جو اوپر دیے گئے بابوں کے نصاب کو مکمل کرتا ہے۔ ورکشاپ خود سیکھنے اور انسٹرکٹر کی قیادت والے سیشن دونوں کے لیے ڈیزائن کی گئی ہے۔  

#### 🛠️ ورکشاپ کی خصوصیات  
- **براوزر پر مبنی انٹرفیس**: مکمل MkDocs سے چلنے والی ورکشاپ جس میں سرچ، کاپی، اور تھیم کی خصوصیات موجود ہیں  
- **GitHub Codespaces انٹیگریشن**: ایک-کلک میں ترقیاتی ماحول قائم کریں  
- **منظم سیکھنے کا راستہ**: 8 ماڈیول کے رہنما مشقیں (کل 3-4 گھنٹے)  
- **ترقی پزیر طریقہ کار**: تعارف → انتخاب → توثیق → تجزیہ → تشکیلات → تخصیص → صفائی → خلاصہ  
- **انٹرایکٹو DevContainer ماحول**: پہلے سے سیٹ اپ شدہ ٹولز اور انحصار  

#### 📚 ورکشاپ ماڈیول کی ساخت  
ورکشاپ ایک **8 ماڈیول ترقی پزیر طریقہ کار** پر مبنی ہے جو آپ کو دریافت سے لے کر تعیناتی میں مہارت تک لے جاتا ہے:

| ماڈیول | موضوع | آپ کیا کریں گے | دورانیہ |  
|--------|-------|----------------|----------|  
| **0۔ تعارف** | ورکشاپ کا جائزہ | سیکھنے کے مقاصد، ضروریات، اور ورکشاپ کی ساخت سمجھیں | 15 منٹ |  
| **1۔ انتخاب** | ٹیمپلیٹ کی دریافت | AZD ٹیمپلیٹس کو دریافت کریں اور اپنے منظر نامے کے لیے درست AI ٹیمپلیٹ منتخب کریں | 20 منٹ |  
| **2۔ توثیق** | ڈپلائ اور تصدیق کریں | `azd up` کے ساتھ ٹیمپلیٹ تعینات کریں اور انفراسٹرکچر کی تصدیق کریں | 30 منٹ |  
| **3۔ تجزیہ** | ڈھانچے کو سمجھیں | GitHub Copilot کا استعمال کرتے ہوئے ٹیمپلیٹ کے فن تعمیر، Bicep فائلز، اور کوڈ کی ترتیب کو دریافت کریں | 30 منٹ |  
| **4۔ تشکیلات** | azure.yaml گہرا جائزہ | `azure.yaml` کی تشکیلات، لائف سائیکل ہکس، اور ماحول کے متغیرات میں مہارت حاصل کریں | 30 منٹ |  
| **5۔ تخصیص** | اسے اپنا بنائیں | AI سرچ، ٹریسنگ، تشخیص کو فعال کریں اور اپنے منظر نامے کے لیے تخصیص کریں | 45 منٹ |  
| **6۔ صفائی** | صفائی کریں | `azd down --purge` کے ذریعے وسائل کو محفوظ طریقے سے ختم کریں | 15 منٹ |  
| **7۔ خلاصہ** | اگلے اقدامات | کامیابیوں کا جائزہ لیں، اہم تصورات کو دہرائیں، اور اپنی سیکھنے کی راہ جاری رکھیں | 15 منٹ |  

**ورکشاپ کا بہاؤ:**  
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
# ذخیرہ میں "Code" → "Create codespace on main" پر کلک کریں

# آپشن 2: لوکل ڈیولپمنٹ
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# ورکشاپ/README.md میں سیٹ اپ ہدایات پر عمل کریں
```
  
#### 🎯 ورکشاپ کے سیکھنے کے نتائج  
ورکشاپ مکمل کرنے والے شرکاء حاصل کریں گے:  
- **پروڈکشن AI ایپلیکیشنز تعینات کریں**: AZD کے ذریعے Microsoft Foundry خدمات استعمال کریں  
- **ملٹی ایجنٹ فن تعمیر میں مہارت حاصل کریں**: مربوط AI ایجنٹ حل نافذ کریں  
- **سیکیورٹی بہترین طریقے نافذ کریں**: توثیق اور رسائی کنٹرول کو ترتیب دیں  
- **مقیاس کے لیے اصلاح کریں**: موثر لاگت، اعلیٰ کارکردگی والی تعیناتیاں ڈیزائن کریں  
- **ڈپلائمنٹس کے مسائل حل کریں**: عام مسائل خود مختار طور پر حل کریں  

#### 📖 ورکشاپ کے وسائل  
- **🎥 انٹرایکٹو گائیڈ**: [ورکشاپ کے مواد](workshop/README.md) - براوزر پر مبنی تعلیمی ماحول  
- **📋 ماڈیول کے مطابق ہدایات**:  
  - [0۔ تعارف](workshop/docs/instructions/0-Introduction.md) - ورکشاپ کا جائزہ اور مقاصد  
  - [1۔ انتخاب](workshop/docs/instructions/1-Select-AI-Template.md) - AI ٹیمپلیٹس تلاش کریں اور منتخب کریں  
  - [2۔ توثیق](workshop/docs/instructions/2-Validate-AI-Template.md) - ٹیمپلیٹس تعینات کریں اور تصدیق کریں  
  - [3۔ تجزیہ](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - ٹیمپلیٹ کے فن تعمیر کی دریافت  
  - [4۔ تشکیلات](workshop/docs/instructions/4-Configure-AI-Template.md) - `azure.yaml` کی مہارت  
  - [5۔ تخصیص](workshop/docs/instructions/5-Customize-AI-Template.md) - اپنی صورتحال کے لیے تخصیص کریں  
  - [6۔ صفائی](workshop/docs/instructions/6-Teardown-Infrastructure.md) - وسائل کی صفائی  
  - [7۔ خلاصہ](workshop/docs/instructions/7-Wrap-up.md) - جائزہ اور اگلے اقدامات  
- **🛠️ AI ورکشاپ لیب**: [AI ورکشاپ لیب](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI پر مبنی مشقیں  
- **💡 فوری آغاز**: [ورکشاپ سیٹ اپ گائیڈ](workshop/README.md#quick-start) - ماحول کی تشکیلات  

**مناسب برائے**: کارپوریٹ ٹریننگ، یونیورسٹی کے کورسز، خود سے سیکھنے، اور ڈویلپر بوٹ کیمپس۔  

---

## 📖 تفصیلی جائزہ: AZD کی صلاحیتیں  

بنیادی باتوں سے آگے، AZD پروڈکشن ڈپلائمنٹس کے لیے طاقتور خصوصیات فراہم کرتا ہے:  

- **ٹیمپلیٹ پر مبنی ڈپلائمنٹس** - عام ایپلیکیشن پیٹرنز کے لیے پہلے سے بنے ہوئے ٹیمپلیٹس استعمال کریں  
- **انفراسٹرکچر ایز کوڈ** - Bicep یا Terraform استعمال کرکے Azure وسائل کا انتظام کریں  
- **مربوط ورک فلو** - بغیر رکاوٹ ایپلیکیشنز کی پروویژننگ، تعیناتی، اور مانیٹرنگ کریں  
- **ڈیولپر دوست** - ڈیولپر کی استعداد اور تجربے کے لیے بہتر بنایا گیا  

### **AZD + Microsoft Foundry: AI ڈپلائمنٹس کے لیے بہترین**  

**AI حل کے لیے AZD کیوں؟** AZD AI ڈیولپرز کو درپیش بڑے چیلنجز کو حل کرتا ہے:  

- **AI-ریڈی ٹیمپلیٹس** - Microsoft Foundry ماڈلز، Cognitive Services، اور ML ورکلوڈز کے لیے پہلے سے ترتیب شدہ ٹیمپلیٹس  
- **محفوظ AI ڈپلائمنٹس** - AI خدمات، API کیز، اور ماڈل اینڈپوائنٹس کے لیے اندرونی سیکیورٹی پیٹرنز  
- **پروڈکشن AI پیٹرنز** - پیمانے کے قابل، مؤثر لاگت AI ایپلیکیشن ڈپلائمنٹس کے بہترین طریقے  
- **ایند ٹو ایند AI ورک فلو** - ماڈل کی ترقی سے لے کر مناسب مانیٹرنگ کے ساتھ پروڈکشن ڈپلائمنٹ تک  
- **قیمت کی اصلاح** - AI ورکلوڈز کے لیے ذہین وسائل کی تخصیص اور اسکالنگ کی حکمت عملی  
- **Microsoft Foundry انٹیگریشن** - Microsoft Foundry ماڈل کیٹلاگ اور اینڈپوائنٹس کے ساتھ بغیر رکاوٹ کنکشن  

---

## 🎯 ٹیمپلیٹس اور مثالوں کی لائبریری  

### نمایاں: Microsoft Foundry ٹیمپلیٹس  
**اگر آپ AI ایپلیکیشنز تعینات کر رہے ہیں تو یہاں شروع کریں!**  

> **نوٹ:** یہ ٹیمپلیٹس مختلف AI پیٹرنز کی مثالیں دیتے ہیں۔ کچھ بیرونی Azure سیمپلز ہیں، کچھ مقامی عمل درآمد ہیں۔  

| ٹیمپلیٹ | باب | پیچیدگی | خدمات | قسم |  
|----------|---------|------------|----------|------|  
| [**AI چیٹ کے ساتھ شروع کریں**](https://github.com/Azure-Samples/get-started-with-ai-chat) | باب 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | بیرونی |  
| [**AI ایجنٹس کے ساتھ شروع کریں**](https://github.com/Azure-Samples/get-started-with-ai-agents) | باب 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | بیرونی |  
| [**Azure سرچ + OpenAI ڈیمو**](https://github.com/Azure-Samples/azure-search-openai-demo) | باب 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | بیرونی |  
| [**OpenAI چیٹ ایپ کوئیک اسٹارٹ**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | باب 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | بیرونی |  
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | باب 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | بیرونی |  
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | باب 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | بیرونی |  
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | باب 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **مقامی** |  

### نمایاں: مکمل سیکھنے کے منظرنامے  
**تعلیمی ابواب کے مطابق پروڈکشن ریڈی ایپلیکیشن ٹیمپلیٹس**  

| ٹیمپلیٹ | سیکھنے کا باب | پیچیدگی | کلیدی سیکھنے کی بات |  
|----------|------------------|------------|--------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | باب 2 | ⭐ | بنیادی AI تعیناتی پیٹرنز |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | باب 2 | ⭐⭐ | Azure AI سرچ کے ساتھ RAG نفاذ |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | باب 4 | ⭐⭐ | دستاویز انٹیلیجنس انٹیگریشن |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | باب 5 | ⭐⭐⭐ | ایجنٹ فریم ورک اور فنکشن کالنگ |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | باب 8 | ⭐⭐⭐ | انٹرپرائز AI آراستگی |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | باب 5 | ⭐⭐⭐⭐ | کسٹمر اور انوینٹری ایجنٹس کے ساتھ ملٹی ایجنٹ فن تعمیر |  

### مثال کی قسم کے لحاظ سے سیکھنا  

> **📌 مقامی بمقابلہ بیرونی مثالیں:**  
> **مقامی مثالیں** (اس ریپو میں) = فوری استعمال کے لیے تیار  
> **بیرونی مثالیں** (Azure سیمپلز) = منسلک ریپوز سے کلون کریں  

#### مقامی مثالیں (فوری استعمال کے لیے تیار)  
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM ٹیمپلیٹس کے ساتھ مکمل پروڈکشن ریڈی نفاذ  
  - ملٹی ایجنٹ فن تعمیر (کسٹمر + انوینٹری ایجنٹس)  
  - جامع مانیٹرنگ اور تشخیص  
  - ARM ٹیمپلیٹ کے ذریعے ایک کلک میں تعیناتی  

#### مقامی مثالیں - کنٹینر ایپلیکیشنز (ابواب 2-5)  
**اس ریپوز میں جامع کنٹینر تعیناتی کی مثالیں:**  
- [**کنٹینر ایپ مثالیں**](examples/container-app/README.md) - کنٹینرائزڈ ڈپلائمنٹس کے لیے مکمل گائیڈ  
  - [سادہ فل اسکن API](../../examples/container-app/simple-flask-api) - بنیادی REST API جس میں اسکیل ٹو زیرو ہے  
  - [مائیکروسروسز فن تعمیر](../../examples/container-app/microservices) - پروڈکشن ریڈی ملٹی سروس ڈپلائمنٹ  
  - قوی آغاز، پروڈکشن، اور ایڈوانسڈ ڈپلائمنٹ پیٹرنز  
  - مانیٹرنگ، سیکیورٹی، اور قیمت کی اصلاح کی رہنمائی  

#### بیرونی مثالیں - سادہ ایپلیکیشنز (ابواب 1-2)  
**شروع کرنے کے لیے یہ Azure سیمپلز ریپوز کلون کریں:**  
- [سادہ ویب ایپ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - بنیادی ڈپلائمنٹ پیٹرنز  
- [اسٹیٹک ویب سائٹ - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - اسٹیٹک مواد کی تعیناتی  
- [کنٹینر ایپ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API تعیناتی  

#### بیرونی مثالیں - ڈیٹا بیس انٹیگریشن (باب 3-4)  
- [ڈیٹابیس ایپ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - ڈیٹابیس کنیکٹوٹی پیٹرنز
- [فنکشنز + کازموس DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - سرورلیس ڈیٹا ورک فلو

#### خارجی مثالیں - اعلی درجے کے پیٹرنز (باب 4-8)
- [جاوا مائیکروسروسز](https://github.com/Azure-Samples/java-microservices-aca-lab) - ملٹی سروس آرکیٹیکچرز
- [کنٹینر ایپس جابز](https://github.com/Azure-Samples/container-apps-jobs) - پس منظر میں عمل کاری  
- [انٹرپرائز ML پائپ لائن](https://github.com/Azure-Samples/mlops-v2) - پروڈکشن کے لئے تیار ML پیٹرنز

### خارجی ٹیمپلیٹ کلیکشنز
- [**سرکاری AZD ٹیمپلیٹ گیلری**](https://azure.github.io/awesome-azd/) - سرکاری اور کمیونٹی ٹیمپلیٹس کا منتخب مجموعہ
- [**Azure Developer CLI ٹیمپلیٹس**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - مائیکروسافٹ لرن ٹیمپلیٹ دستاویزات
- [**مثالوں کی ڈائرکٹری**](examples/README.md) - تفصیلی وضاحتوں کے ساتھ مقامی تعلیمی مثالیں

---

## 📚 تعلیمی وسائل اور حوالہ جات

### فوری حوالہ جات
- [**کمانڈ چیٹ شیٹ**](resources/cheat-sheet.md) - لازمی azd کمانڈز باب کے حساب سے منظم
- [**گہرا لفظنامہ**](resources/glossary.md) - Azure اور azd اصطلاحات  
- [**عمومی سوالات**](resources/faq.md) - تعلیمی باب کے حساب سے عام سوالات
- [**مطالعہ گائیڈ**](resources/study-guide.md) - مکمل عملی مشقیں

### عملی ورکشاپس
- [**AI ورکشاپ لیب**](docs/chapter-02-ai-development/ai-workshop-lab.md) - اپنی AI حل کو AZD کے ذریعے تعینات کریں (2-3 گھنٹے)
- [**انٹرایکٹو ورکشاپ**](workshop/README.md) - MkDocs اور GitHub Codespaces کے ساتھ 8 ماڈیول پر مشتمل رہنمائی شدہ مشقیں
  - عمل: تعارف → انتخاب → تصدیق → تجزیہ → ترتیب → تخصیص → بندش → خلاصہ

### خارجی تعلیمی وسائل
- [Azure Developer CLI دستاویزات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure آرکیٹیکچر سینٹر](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure قیمت کیلکولیٹر](https://azure.microsoft.com/pricing/calculator/)
- [Azure کی صورتحال](https://status.azure.com/)

### آپ کے ایڈیٹر کے لیے AI ایجنٹ صلاحیتیں
- [**skills.sh پر Microsoft Azure صلاحیتیں**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI، Foundry، تعیناتی، تشخیص، لاگت کی بہتری اور مزید کے لیے 37 اوپن ایجنٹ مہارتیں۔ انہیں GitHub Copilot، Cursor، Claude Code، یا کسی بھی معاون ایجنٹ میں انسٹال کریں:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 فوری مسئلہ حل کرنے کی رہنمائی

**نئے صارفین کو درپیش عام مسائل اور ان کے فوری حل:**

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

# AZD ماحول کے لیے مقرر کریں
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# تصدیق کریں
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" یا "Quota exceeded"</strong></summary>

```bash
# مختلف Azure خطہ آزما کریں
azd env set AZURE_LOCATION "westus2"
azd up

# یا ترقی میں چھوٹے SKUs استعمال کریں
# infra/main.parameters.json کو ترمیم کریں:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" آدھے راستے میں ناکام ہو گیا</strong></summary>

```bash
# آپشن 1: صاف کریں اور دوبارہ کوشش کریں
azd down --force --purge
azd up

# آپشن 2: صرف انفراسٹرکچر کو درست کریں
azd provision

# آپشن 3: تفصیلی صورتحال چیک کریں
azd show

# آپشن 4: ایزور مانیٹر میں لاگز چیک کریں
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "تصدیق میں ناکامی" یا "ٹوکین کی معیاد ختم ہو گئی"</strong></summary>

```bash
# دوبارہ تصدیق کریں AZD کے لیے
azd auth logout
azd auth login

# اختیاری: اگر آپ az کمانڈز چلا رہے ہیں تو Azure CLI کو بھی ریفریش کریں
az logout
az login

# تصدیق کی جانچ کریں
az account show
```
</details>

<details>
<summary><strong>❌ "وسائل پہلے سے موجود ہیں" یا ناموں میں تنازع</strong></summary>

```bash
# AZD منفرد نام تخلیق کرتا ہے، لیکن اگر تصادم ہو:
azd down --force --purge

# پھر نئے ماحول کے ساتھ دوبارہ کوشش کریں
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ ٹیمپلیٹ تعیناتی میں بہت زیادہ وقت لگ رہا ہے</strong></summary>

**عام انتظار کے اوقات:**
- سادہ ویب ایپ: 5-10 منٹ
- ڈیٹابیس کے ساتھ ایپ: 10-15 منٹ
- AI ایپلی کیشنز: 15-25 منٹ (OpenAI کی فراہمی سست ہے)

```bash
# پیش رفت چیک کریں
azd show

# اگر 30 منٹ سے زیادہ پھنسے ہوئے ہوں، Azure پورٹل چیک کریں:
azd monitor --overview
# ناکام تعیناتیوں کو تلاش کریں
```
</details>

<details>
<summary><strong>❌ "اجازت نہیں دی گئی" یا "ممنوع"</strong></summary>

```bash
# اپنا Azure کردار چیک کریں
az role assignment list --assignee $(az account show --query user.name -o tsv)

# آپ کو کم از کم "Contributor" کردار کی ضرورت ہے
# اپنے Azure ایڈمن سے درخواست کریں کہ اجازت دے:
# - Contributor (وسائل کے لیے)
# - User Access Administrator (کردار کی تفویضات کے لیے)
```
</details>

<details>
<summary><strong>❌ تعینات شدہ ایپلیکیشن URL نہیں مل رہا</strong></summary>

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

### 📚 مکمل مسائل حل کرنے کے وسائل

- **عام مسائل کی رہنمائی:** [تفصیلی حل](docs/chapter-07-troubleshooting/common-issues.md)
- **AI مخصوص مسائل:** [AI مسئلہ حل](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **ڈی بگ کرنے کی رہنمائی:** [مرحلہ وار ڈی بگنگ](docs/chapter-07-troubleshooting/debugging.md)
- **مدد حاصل کریں:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 کورس کی تکمیل اور سرٹیفیکیشن

### پیش رفت کا تعاقب
ہر باب کے ذریعے اپنی تعلیمی پیش رفت کا تعاقب کریں:

- [ ] **باب 1**: بنیاد اور فوری آغاز ✅
- [ ] **باب 2**: AI-فرسٹ ڈیولپمنٹ ✅  
- [ ] **باب 3**: ترتیب اور تصدیق ✅
- [ ] **باب 4**: کوڈ کے طور پر انفراسٹرکچر اور تعیناتی ✅
- [ ] **باب 5**: ملٹی-ایجنٹ AI حل ✅
- [ ] **باب 6**: پری-ڈپلائمنٹ تصدیق اور منصوبہ بندی ✅
- [ ] **باب 7**: مسئلہ حل کرنا اور ڈی بگ کرنا ✅
- [ ] **باب 8**: پروڈکشن اور انٹرپرائز پیٹرنز ✅

### تعلیمی تصدیق
ہر باب مکمل کرنے کے بعد اپنی معلومات کی تصدیق کریں:
1. **عملی مشق:** باب کی عملی تعیناتی مکمل کریں
2. **علمی جانچ:** اپنے باب کے FAQ سیکشن کا جائزہ لیں
3. **کمیونٹی گفتگو:** Azure Discord میں اپنا تجربہ شیئر کریں
4. **اگلا باب:** اگلے مشکل سطح پر جائیں

### کورس کی تکمیل کے فوائد
تمام ابواب مکمل کرنے پر آپ کے پاس ہوگا:
- **پروڈکشن کا تجربہ:** حقیقی AI ایپلی کیشنز Azure پر تعینات کیں
- **پیشہ ورانہ مہارتیں:** انٹرپرائز کے تیار تعیناتی صلاحیتیں  
- **کمیونٹی کی پہچان:** Azure ڈیولپر کمیونٹی کے فعال رکن
- **کیریئر کی ترقی:** AZD اور AI تعیناتی میں مطلوب ماہرین

---

## 🤝 کمیونٹی اور مدد

### مدد اور معاونت حاصل کریں
- **تکنیکی مسائل:** [بگز کی رپورٹ اور فیچرز کی درخواست](https://github.com/microsoft/azd-for-beginners/issues)
- **تعلیمی سوالات:** [Microsoft Azure Discord کمیونٹی](https://discord.gg/microsoft-azure) اور [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI مخصوص مدد:** شامل ہوں [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **دستاویزات:** [سرکاری Azure Developer CLI دستاویزات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord سے کمیونٹی کی بصیرت

**#Azure چینل سے تازہ پول نتائج:**
- **45٪** ڈیولپر AZD کے ذریعے AI ورکلوڈز کرنا چاہتے ہیں
- **اہم چیلنجز:** ملٹی سروس تعیناتی، اسناد کا انتظام، پروڈکشن کے لیے تیاری  
- **سب سے زیادہ درخواست کی گئی:** AI مخصوص ٹیمپلیٹس، مسئلہ حل کرنے کی گائیڈز، بہترین طریقے

**ہماری کمیونٹی میں شامل ہوں تاکہ:**
- اپنے AZD + AI تجربات شیئر کریں اور مدد حاصل کریں
- AI ٹیمپلیٹس کے ابتدائی نظارے تک رسائی حاصل کریں
- AI تعیناتی کے بہترین طریقوں میں تعاون کریں
- مستقبل کے AI + AZD فیچر کی ترقی پر اثر انداز ہوں

### کورس میں تعاون
ہم تعاون کا خیرمقدم کرتے ہیں! براہ کرم ہمارا [تعاون گائیڈ](CONTRIBUTING.md) پڑھیں جس میں شامل ہیں:
- **مواد کی بہتری:** موجودہ ابواب اور مثالوں کو بہتر بنائیں
- **نئی مثالیں:** حقیقی دنیا کے منظرنامے اور ٹیمپلیٹس شامل کریں  
- **ترجمہ:** کثیراللسانی معاونت میں مدد کریں
- **بگ رپورٹس:** درستگی اور وضاحت بہتر کریں
- **کمیونٹی کے اصول:** ہمارے شامل کرنے والے کمیونٹی اصولوں کی پابندی کریں

---

## 📄 کورس کی معلومات

### لائسنس
یہ منصوبہ MIT لائسنس کے تحت لائسنس یافتہ ہے - تفصیلات کے لیے [LICENSE](../../LICENSE) فائل دیکھیں۔

### متعلقہ Microsoft Learning وسائل

ہماری ٹیم دیگر جامع تعلیمی کورسز فراہم کرتی ہے:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![نو آموزوں کے لیے LangChain4j](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![نو آموزوں کے لیے LangChain.js](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![نو آموزوں کے لیے LangChain](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / ایجنٹس
[![نو آموزوں کے لیے AZD](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![نو آموزوں کے لیے Edge AI](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![نو آموزوں کے لیے MCP](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![نو آموزوں کے لیے AI ایجنٹس](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### جنریٹیو AI سیریز
[![نو آموزوں کے لیے جنریٹیو AI](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![جنریٹیو AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![جنریٹیو AI (جاوا)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![جنریٹیو AI (جاوا اسکرپٹ)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### بنیادی تعلمی کورسز
[![نو آموزوں کے لیے ML](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![نو آموزوں کے لیے ڈیٹا سائنس](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![نو آموزوں کے لیے AI](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![نو آموزوں کے لیے سائبرسیکیورٹی](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![نو آموزوں کے لیے ویب ڈویلپمنٹ](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![نو آموزوں کے لیے IoT](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![نو آموزوں کے لیے XR ڈیویلپمنٹ](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---

### کو پائلٹ سیریز
[![AI جوڑا پروگرامنگ کے لیے کو پائلٹ](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET کے لیے کو پائلٹ](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![کو پائلٹ ایڈونچر](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ کورس کی نیویگیشن

**🚀 سیکھنا شروع کرنے کے لیے تیار ہیں؟**

**نو آموز**: [باب 1: بنیاد اور فوری آغاز](#-chapter-1-foundation--quick-start) سے شروع کریں  
**AI ڈویلپرز**: [باب 2: AI-پہلا ترقی](#-chapter-2-ai-first-development-recommended-for-ai-developers) پر جائیں  
**تجربہ کار ڈویلپرز**: [باب 3: ترتیب اور تصدیق](#️-chapter-3-configuration--authentication) سے آغاز کریں

**اگلے مراحل**: [باب 1 شروع کریں - AZD بنیادی باتیں](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنبیہ**:
اس دستاویز کا ترجمہ AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے کیا گیا ہے۔ اگرچہ ہم درستگی کی کوشش کرتے ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار تراجم میں غلطیاں یا غیر درستیاں ہوسکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں حتمی اور مستند ماخذ سمجھی جانی چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تعبیر کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->