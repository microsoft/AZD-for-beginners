# AZD برائے مبتدی: ایک منظم تعلیمی سفر

![AZD-for-beginners](../../translated_images/ur/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### خودکار ترجمے (ہمیشہ تازہ ترین)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](./README.md) | [Vietnamese](../vi/README.md)

> **کیا آپ مقامی طور پر کلون کرنا پسند کریں گے؟**
>
> یہ ذخیرہ 50+ زبانوں کا ترجمہ شامل کرتا ہے جو ڈاؤن لوڈ کے سائز کو نمایاں طور پر بڑھاتا ہے۔ ترجمے کے بغیر کلون کرنے کے لیے sparse checkout استعمال کریں:
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
> یہ آپ کو تیزی سے ڈاؤن لوڈ کے ساتھ کورس مکمل کرنے کے لیے ہر چیز فراہم کرتا ہے۔
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azd میں آج کیا نیا ہے

> 📌 یہ کورس **`azd 1.27.1`** (جولائی 2026) کے مطابق تصدیق شدہ ہے۔ `azd version` چلائیں اپنے ورژن کے لیے، اور `azd upgrade` تازہ ترین حاصل کرنے کے لیے۔

Azure Developer CLI نے روایتی ویب ایپس اور APIs سے بڑھ کر ترقی کی ہے۔ آج، azd Azure پر **کسی بھی** ایپلیکیشن کی تعیناتی کے لیے واحد ٹول ہے—جس میں AI سے چلنے والی ایپلیکیشنز اور ذہین ایجنٹس شامل ہیں۔

اس کا آپ کے لیے مطلب یہ ہے:

- **AI ایجنٹس اب azd کے پہلے درجے کے ورک لوڈز ہیں۔** آپ اسی `azd init` → `azd up` ورک فلو کا استعمال کرتے ہوئے AI ایجنٹ پروجیکٹس کو شروع، تعینات، اور منظم کر سکتے ہیں جس سے آپ واقف ہیں۔
- **CLI سے مکمل ایجنٹ لائف سائیکل۔** `azure.ai.agents` ایکسٹینشن اب پورا سفر کور کرتی ہے—`azd ai agent init` اسکافولڈ کے لیے، `azd ai agent invoke` ٹیسٹ کے لیے (ردعمل کے وقت کی آؤٹ پٹ کے ساتھ)، `azd ai agent eval generate` اور `azd ai agent optimize` معیار کو ماپنے اور بہتر بنانے کے لیے، اور `azd ai agent delete` صفائی کے لیے۔
- **مزید AI تعمیراتی بلاکس۔** نئے پریویو ایکسٹینشنز—`azure.ai.skills` اور `azure.ai.connections`—آپ کو azd کے ساتھ براہ راست دوبارہ استعمال ہونے والے ایجنٹ مہارتوں اور Foundry کنکشنز کو منظم کرنے دیتے ہیں۔
- **Microsoft Foundry انضمام** ماڈل تعیناتی، ایجنٹ ہوسٹنگ، اور AI سروس کنفیگریشن کو azd ٹیمپلیٹ نظام میں لاتا ہے۔
- **روزمرہ کے معمولات کو آسان بنایا گیا۔** حالیہ ریلیزز نے `azd init` کو idempotent (دوبارہ چلانے کے لیے محفوظ) بنایا، `azd auth login` کو پرانے ٹوکنز خود بخود صاف کرنے والا بنایا، اور ایک دوستانہ `azd tool` فرسٹ رن سیٹ اپ پرامپٹ شامل کیا۔
- **بنیادی ورک فلو میں کوئی تبدیلی نہیں آئی۔** چاہے آپ todo ایپ، ایک مائکرو سروس، یا ایک ملٹی ایجنٹ AI حل تعینات کر رہے ہوں، کمانڈز وہی ہیں۔

> **Aspire صارفین کے لیے نوٹ:** مائیکروسافٹ اب پروڈکٹ کو صرف **Aspire** (پہلے ".NET Aspire") کے طور پر جانتا ہے۔ azd کی Aspire سپورٹ میں کوئی تبدیلی نہیں آئی—صرف نام بدل گیا ہے۔

اگر آپ نے پہلے azd استعمال کیا ہے، تو AI سپورٹ ایک قدرتی توسیع ہے—کوئی الگ ٹول یا ایک جدید ٹریک نہیں۔ اگر آپ نئی شروعات کر رہے ہیں، تو آپ ایک ایسا ورک فلو سیکھیں گے جو سب کے لیے کام کرتا ہے۔

---

## 🚀 Azure Developer CLI (azd) کیا ہے؟

**Azure Developer CLI (azd)** ایک ڈویلپر دوست کمانڈ لائن ٹول ہے جو Azure پر ایپلیکیشنز تعینات کرنا آسان بناتا ہے۔ Azure کے متعدد وسائل کو دستی طور پر بنانے اور جوڑنے کی بجائے، آپ پورے ایپلیکیشنز کو ایک کمانڈ سے تعینات کر سکتے ہیں۔

### `azd up` کا جادو

```bash
# یہ واحد کمانڈ سب کچھ کرتی ہے:
# ✅ تمام Azure وسائل بناتا ہے
# ✅ نیٹ ورکنگ اور سیکیورٹی کو ترتیب دیتا ہے
# ✅ آپ کے ایپلیکیشن کوڈ کو تیار کرتا ہے
# ✅ Azure پر تعینات کرتا ہے
# ✅ آپ کو ایک کام کرنے والا URL فراہم کرتا ہے
azd up
```

**یہی ہے!** کوئی Azure پورٹل پر کلکنگ نہیں، کوئی پیچیدہ ARM ٹیمپلیٹس پہلے سیکھنے کی ضرورت نہیں، کوئی دستی کنفیگریشن نہیں - صرف Azure پر کام کرنے والی ایپلیکیشنز۔

---

## ❓ Azure Developer CLI بمقابلہ Azure CLI: فرق کیا ہے؟

یہ سب سے عام سوال ہے جو مبتدی پوچھتے ہیں۔ یہاں سادہ جواب ہے:

| فیچر | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **مقصد** | انفرادی Azure وسائل کا انتظام | مکمل ایپلیکیشنز کی تعیناتی |
| **ذہنیت** | انفراسٹرکچر پر مرکوز | ایپلیکیشن پر مرکوز |
| **مثال** | `az webapp create --name myapp...` | `azd up` |
| **سیکھنے کا مرحلہ** | Azure خدمات جاننا ضروری | صرف اپنی ایپ جانیں |
| **بہترین استعمال** | DevOps، انفراسٹرکچر | ڈویلپرز، پروٹوٹائپنگ |

### سادہ مثال

- **Azure CLI** ایسے ہے جیسے آپ کے پاس گھر بنانے کے لیے تمام اوزار ہوں - ہتھوڑی، آری، کیل۔ آپ کچھ بھی بنا سکتے ہیں، لیکن آپ کو تعمیر کا علم ہونا چاہیے۔
- **Azure Developer CLI** ایسے ہے جیسے آپ ایک ٹھیکیدار کو ملازمت دیں - آپ بیان کریں کہ کیا چاہتے ہیں، اور وہ گھر بنا دے۔

### کب کیا استعمال کریں

| منظر نامہ | یہ استعمال کریں |
|----------|----------|
| "میں اپنی ویب ایپ کو جلدی تعینات کرنا چاہتا ہوں" | `azd up` |
| "مجھے صرف ایک سٹوریج اکاؤنٹ بنانا ہے" | `az storage account create` |
| "میں ایک مکمل AI ایپلیکیشن بنا رہا ہوں" | `azd init --template azure-search-openai-demo` |
| "مجھے کسی مخصوص Azure وسائل کو ڈیبگ کرنا ہے" | `az resource show` |
| "میں چند منٹوں میں پروڈکشن کے لیے تیار تعیناتی چاہتا ہوں" | `azd up --environment production` |

### یہ دونوں ایک ساتھ کام کرتے ہیں!

AZD Azure CLI کو اندرونی طور پر استعمال کرتا ہے۔ آپ دونوں استعمال کر سکتے ہیں:
```bash
# اپنے ایپ کو AZD کے ساتھ تعینات کریں
azd up

# پھر Azure CLI کے ساتھ مخصوص وسائل کو بہتر بنائیں
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD میں ٹیمپلیٹس تلاش کریں

شروع سے نہیں بنائیں! **Awesome AZD** تیار تعینات کرنے کے لیے کمیونٹی کا مجموعہ ہے:

| وسائل | تفصیل |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | ایک کلک تعیناتی کے ساتھ 200+ ٹیمپلیٹس براؤز کریں |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | اپنی ٹیمپلیٹ کمیونٹی میں شامل کریں |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | اسٹار دیں اور سورس کو دریافت کریں |

### Awesome AZD سے مقبول AI ٹیمپلیٹس

```bash
# مائیکروسافٹ فاﺅنڈری ماڈلز + اے آئی سرچ کے ساتھ RAG چیٹ
azd init --template azure-search-openai-demo

# فوری اے آئی چیٹ ایپلیکیشن
azd init --template openai-chat-app-quickstart

# فاﺅنڈری ایجنٹس کے ساتھ اے آئی ایجنٹس
azd init --template get-started-with-ai-agents
```

---

## 🎯 شروع کرنے کے 3 مراحل

شروع کرنے سے پہلے، یقینی بنائیں کہ آپ کی مشین اس ٹیمپلیٹ کے لیے تیار ہے جو آپ تعینات کرنا چاہتے ہیں:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

اگر کوئی ضروری چیک ناکام ہو، تو اسے پہلے درست کریں اور پھر فوراً شروع کریں۔

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

### مرحلہ 2: AZD کے لیے تصدیق کریں

```bash
# اختیاری اگر آپ اس کورس میں Azure CLI کمانڈز کا براہ راست استعمال کرنے کا ارادہ رکھتے ہیں
az login

# AZD ورک فلو کے لئے ضروری ہے
azd auth login
```

اگر آپ کو یقین نہیں ہے کہ آپ کو کون سا چاہیے، تو مکمل سیٹ اپ فلو [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup) میں فالو کریں۔

### مرحلہ 3: اپنی پہلی ایپ تعینات کریں

```bash
# ٹیمپلیٹ سے آغاز کریں
azd init --template todo-nodejs-mongo

# Azure پر تعینات کریں (ہر چیز تخلیق کرتا ہے!)
azd up
```

**🎉 یہی ہے!** آپ کی ایپ اب Azure پر لائیو ہے۔

### صفائی (مت بھولیں!)

```bash
# تجربہ مکمل ہونے پر تمام وسائل ہٹا دیں
azd down --force --purge
```

---

## 📚 اس کورس کو کیسے استعمال کریں

یہ کورس **ترقی پسند تعلیم** کے لیے ڈیزائن کیا گیا ہے - وہاں سے شروع کریں جہاں آپ آرام دہ ہیں اور آہستہ آہستہ آگے بڑھیں:

| آپ کا تجربہ | یہاں سے شروع کریں |
|-----------------|------------|
| **Azure میں بالکل نیا** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Azure جانتے ہیں، AZD نئے ہیں** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **AI ایپ تعینات کرنا چاہتے ہیں** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **عملی مشق چاہیے** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 گھنٹے کی رہنمائی والا لیب |
| **پروڈکشن پیٹرنز چاہیے** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### تیز سیٹ اپ

1. **اس ریپوزیٹری کو فورک کریں**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **کلون کریں**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **مدد حاصل کریں**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **کیا آپ مقامی طور پر کلون کرنا پسند کریں گے؟**

> یہ ذخیرہ 50+ زبانوں کا ترجمہ شامل کرتا ہے جو ڈاؤن لوڈ کے سائز کو نمایاں طور پر بڑھاتا ہے۔ ترجمے کے بغیر کلون کرنے کے لیے sparse checkout استعمال کریں:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> یہ آپ کو تیزی سے ڈاؤن لوڈ کے ساتھ کورس مکمل کرنے کے لیے ہر چیز فراہم کرتا ہے۔


## کورس کا خلاصہ

منظم ابواب کے ذریعے Azure Developer CLI (azd) میں مہارت حاصل کریں جو ترقی پسند تعلیم کے لیے ڈیزائن کیے گئے ہیں۔ **Microsoft Foundry کے انضمام کے ساتھ AI ایپلیکیشن تعیناتی پر خاص توجہ۔**


### یہ کورس جدید ڈویلپرز کے لیے کیوں ضروری ہے

مائیکروسافٹ فاؤنڈری ڈسکورڈ کمیونٹی کے انصافی جائزے کی بنیاد پر، **45% ڈویلپرز AI ورک لوڈز کے لیے AZD استعمال کرنا چاہتے ہیں** لیکن درج ذیل چیلنجز کا سامنا کرتے ہیں:
- پیچیدہ کثیر سروس AI آرکیٹیکچرز  
- پروڈکشن AI تعیناتی کی بہترین مشقیں  
- Azure AI سروس انٹیگریشن اور کنفیگریشن  
- AI ورک لوڈز کے لیے لاگت کی بہتر کاری  
- AI مخصوص تعیناتی کے مسائل کا حل تلاش کرنا  

### سیکھنے کے مقاصد

اس مرتب شدہ کورس کو مکمل کرکے، آپ:
- **AZD کی بنیادوں میں مہارت حاصل کریں**: بنیادی تصورات، تنصیب، اور کنفیگریشن  
- **AI ایپلیکیشنز کی تعیناتی**: Microsoft Foundry خدمات کے ساتھ AZD استعمال کریں  
- **انفراسٹرکچر بطور کوڈ نافذ کریں**: Bicep ٹیمپلیٹس کے ذریعے Azure وسائل کا انتظام کریں  
- **تعیناتی مسائل کو حل کریں**: عام مسائل کا ازالہ اور ڈیبگ کریں  
- **پروڈکشن کے لیے بہتر بنائیں**: سیکیورٹی، اسکیلنگ، مانیٹرنگ، اور لاگت کا انتظام  
- **کثیر ایجنٹ حل تیار کریں**: پیچیدہ AI آرکیٹیکچرز کی تعیناتی  

## شروع کرنے سے پہلے: اکاؤنٹس، رسائی، اور مفروضے

باب 1 شروع کرنے سے پہلے، اس بات کو یقینی بنائیں کہ آپ کے پاس درج ذیل چیزیں موجود ہوں۔ اس گائیڈ میں بعد کی تنصیب کے اقدامات ان بنیادی باتوں کو فرض کرتے ہیں کہ وہ پہلے ہی مکمل ہو چکے ہیں۔

- **ایک Azure سبسکرپشن**: آپ کام یا اپنے ذاتی اکاؤنٹ کی موجودہ سبسکرپشن استعمال کر سکتے ہیں، یا شروع کرنے کے لیے [مفت ٹرائل](https://aka.ms/azurefreetrial) بنا سکتے ہیں۔  
- **Azure وسائل بنانے کی اجازت**: زیادہ تر مشقوں کے لیے، آپ کو ہدف سبسکرپشن یا ریسورس گروپ پر کم از کم **Contributor** رسائی ہونی چاہیے۔ کچھ ابواب میں یہ بھی مفروضہ ہو سکتا ہے کہ آپ ریسورس گروپس، مینجڈ شناختیں، اور RBAC اسائنمنٹس بنا سکتے ہیں۔  
- [**GitHub اکاؤنٹ**](https://github.com): یہ ریپوزیٹری کو فورک کرنے، اپنی تبدیلیوں کو ٹریک کرنے، اور ورکشاپ کے لیے GitHub Codespaces استعمال کرنے کے لیے مفید ہے۔  
- **ٹیمپلیٹ رن ٹائم کی ضروریات**: کچھ ٹیمپلیٹس کو مقامی ٹولز جیسے Node.js، Python، Java، یا Docker کی ضرورت ہوتی ہے۔ شروع کرنے سے پہلے سیٹ اپ ویلیڈیٹر چلائیں تاکہ آپ بروقت گمشدہ ٹولز کا پتہ لگا سکیں۔  
- **بنیادی ٹرمینل کی معلومات**: آپ کو ماہر ہونے کی ضرورت نہیں ہے، لیکن آپ کو `git clone`, `azd auth login`, اور `azd up` جیسے کمانڈز چلانے میں آرام دہ ہونا چاہیے۔  

> **کیا آپ انٹرپرائز سبسکرپشن میں کام کر رہے ہیں؟**  
> اگر آپ کا Azure ماحول کسی ایڈمنسٹریٹر کے ذریعے منظم ہے، تو پہلے سے تصدیق کر لیں کہ آپ جس سبسکرپشن یا ریسورس گروپ میں وسائل تعینات کرنا چاہتے ہیں وہاں آپ کے پاس اجازت ہے۔ اگر نہیں، تو شروع کرنے سے پہلے سینڈباکس سبسکرپشن یا Contributor رسائی مانگیں۔  

> **Azure میں نئے ہیں؟**  
> اپنی ذاتی Azure ٹرائل یا پے ایز یو گو سبسکرپشن سے شروع کریں https://aka.ms/azurefreetrial تاکہ آپ بغیر ٹیننٹ سطح کی منظوریوں کا انتظار کیے مشقیں شروع سے آخر تک مکمل کر سکیں۔  

## 🗺️ کورس کا نقشہ: باب کے مطابق تیز نیویگیشن

ہر باب کے لیے ایک مخصوص README فائل موجود ہے جس میں سیکھنے کے مقاصد، فوری شروع کرنے کے طریقے، اور مشقیں ہیں:

| باب | موضوع | اسباق | دورانیہ | پیچیدگی |
|---------|-------|---------|----------|------------|
| **[باب 1: بنیاد](docs/chapter-01-foundation/README.md)** | شروع ہونا | [AZD بنیادی معلومات](docs/chapter-01-foundation/azd-basics.md) &#124; [تنصیب](docs/chapter-01-foundation/installation.md) &#124; [پہلا پروجیکٹ](docs/chapter-01-foundation/first-project.md) | 30-45 منٹ | ⭐ |
| **[باب 2: AI ترقی](docs/chapter-02-ai-development/README.md)** | AI-فرسٹ ایپس | [فاؤنڈری انٹیگریشن](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI ایجنٹس](docs/chapter-02-ai-development/agents.md) &#124; [ماڈل تعیناتی](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ورکشاپ](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 گھنٹے | ⭐⭐ |
| **[باب 3: کنفیگریشن](docs/chapter-03-configuration/README.md)** | تصدیق اور سیکیورٹی | [کنفیگریشن](docs/chapter-03-configuration/configuration.md) &#124; [تصدیق اور سیکیورٹی](docs/chapter-03-configuration/authsecurity.md) | 45-60 منٹ | ⭐⭐ |
| **[باب 4: انفراسٹرکچر](docs/chapter-04-infrastructure/README.md)** | IaC اور تعیناتی | [تعیناتی گائیڈ](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [پروویژننگ](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 گھنٹے | ⭐⭐⭐ |
| **[باب 5: کثیر ایجنٹ](docs/chapter-05-multi-agent/README.md)** | AI ایجنٹ حل | [ریٹیل منظرنامہ](examples/retail-scenario.md) &#124; [ہم آہنگی پیٹرنز](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 گھنٹے | ⭐⭐⭐⭐ |
| **[باب 6: پری-ڈپلائمنٹ](docs/chapter-06-pre-deployment/README.md)** | منصوبہ بندی اور تصدیق | [پری فلائٹ چیکس](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [صلاحیت کی منصوبہ بندی](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU کا انتخاب](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [ایپ ان سائٹس](docs/chapter-06-pre-deployment/application-insights.md) | 1 گھنٹہ | ⭐⭐ |
| **[باب 7: مسئلے حل کرنا](docs/chapter-07-troubleshooting/README.md)** | ڈیبگ اور اصلاح | [عام مسائل](docs/chapter-07-troubleshooting/common-issues.md) &#124; [ڈیبگنگ](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI مسائل](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 گھنٹے | ⭐⭐ |
| **[باب 8: پروڈکشن](docs/chapter-08-production/README.md)** | انٹرپرائز پیٹرنز | [پروڈکشن کی مشقیں](docs/chapter-08-production/production-ai-practices.md) | 2-3 گھنٹے | ⭐⭐⭐⭐ |
| **[🎓 ورکشاپ](workshop/README.md)** | عملی تجربہ | [تعارف](workshop/docs/instructions/0-Introduction.md) &#124; [انتخاب](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [تصدیق](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [تجزیہ](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [کنفیگریشن](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [حسب ضرورت](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [خاتمہ](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [اختتامیہ](workshop/docs/instructions/7-Wrap-up.md) | 3-4 گھنٹے | ⭐⭐ |

**کل کورس کا دورانیہ:** ~10-14 گھنٹے | **مہارت میں ترقی:** مبتدی → پروڈکشن کے لیے تیار  

---

## 📚 سیکھنے کے ابواب

*اپنے تجربے اور مقاصد کی بنیاد پر اپنا سیکھنے کا راستہ منتخب کریں*

### 🚀 باب 1: بنیاد اور فوری آغاز
**ضروریات:** Azure سبسکرپشن، بنیادی کمانڈ لائن کی معلومات  
**دورانیہ:** 30-45 منٹ  
**پیچیدگی:** ⭐

#### آپ کیا سیکھیں گے
- Azure Developer CLI کی بنیادی باتوں کو سمجھنا  
- اپنی پلیٹ فارم پر AZD انسٹال کرنا  
- اپنی پہلی کامیاب تعیناتی  

#### تعلیمی وسائل
- **🎯 یہاں سے شروع کریں**: [Azure Developer CLI کیا ہے؟](#what-is-azure-developer-cli)  
- **📖 نظریہ**: [AZD کی بنیادی معلومات](docs/chapter-01-foundation/azd-basics.md) - بنیادی تصورات اور اصطلاحات  
- **⚙️ سیٹ اپ**: [تنصیب اور سیٹ اپ](docs/chapter-01-foundation/installation.md) - پلیٹ فارم مخصوص رہنما  
- **🛠️ عملی کام**: [آپ کا پہلا پروجیکٹ](docs/chapter-01-foundation/first-project.md) - قدم بہ قدم ہدایت  
- **📋 جلدی حوالہ**: [کمانڈ چیٹ شیٹ](resources/cheat-sheet.md)  

#### عملی مشقیں
```bash
# فوری تنصیب کی جانچ
azd version

# اپنا پہلا ایپلیکیشن تعینات کریں
azd init --template todo-nodejs-mongo
azd up
```

**💡 باب کا نتیجہ**: AZD استعمال کرتے ہوئے ایک سادہ ویب ایپلیکیشن کو Azure پر کامیابی سے تعینات کرنا  

**✅ کامیابی کی تصدیق:**
```bash
# باب 1 مکمل کرنے کے بعد، آپ کو قابل ہونا چاہیے:
azd version              # نصب شدہ ورژن دکھاتا ہے
azd init --template todo-nodejs-mongo  # منصوبہ شروع کرتا ہے
azd up                  # ایزور پر تعینات کرتا ہے
azd show                # چلنے والی ایپ کا URL ظاہر کرتا ہے
# درخواست براؤزر میں کھلتی ہے اور کام کرتی ہے
azd down --force --purge  # وسائل کی صفائی کرتا ہے
```

**📊 وقت کی سرمایہ کاری:** 30-45 منٹ  
**📈 مہارت کی سطح بعد میں:** بنیادی ایپلیکیشنز کو آزادانہ طور پر تعینات کر سکتا ہے  
**📈 مہارت کی سطح بعد میں:** بنیادی ایپلیکیشنز کو آزادانہ طور پر تعینات کر سکتا ہے  

---

### 🤖 باب 2: AI-فرسٹ ترقی (AI ڈویلپرز کے لیے تجویز کردہ)
**ضروریات:** باب 1 مکمل  
**دورانیہ:** 1-2 گھنٹے  
**پیچیدگی:** ⭐⭐

#### آپ کیا سیکھیں گے
- Microsoft Foundry کا AZD کے ساتھ انٹیگریشن  
- AI سے چلنے والی ایپلیکیشنز کی تعیناتی  
- AI سروس کی کنفیگریشن کا فہم  

#### تعلیمی وسائل
- **🎯 یہاں سے شروع کریں**: [Microsoft Foundry انٹیگریشن](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 AI ایجنٹس**: [AI ایجنٹس گائیڈ](docs/chapter-02-ai-development/agents.md) - AZD کے ساتھ ذہین ایجنٹس تعینات کریں  
- **📖 پیٹرنز**: [AI ماڈل تعیناتی](docs/chapter-02-ai-development/ai-model-deployment.md) - AI ماڈلز کی تعیناتی اور انتظام  
- **🛠️ ورکشاپ**: [AI ورکشاپ لیب](docs/chapter-02-ai-development/ai-workshop-lab.md) - اپنی AI حل کو AZD کے لیے تیار کریں  
- **🎥 انٹرایکٹو گائیڈ**: [ورکشاپ مواد](workshop/README.md) - MkDocs کے ساتھ براؤزر پر مبنی تعلیم * DevContainer ماحول  
- **📋 ٹیمپلیٹس**: [Microsoft Foundry ٹیمپلیٹس](#ورکشاپ-وسائل)  
- **📝 مثالیں**: [AZD تعیناتی کی مثالیں](examples/README.md)  

#### عملی مشقیں
```bash
# اپنا پہلا AI ایپلیکیشن ڈیپلائے کریں
azd init --template azure-search-openai-demo
azd up

# اضافی AI ٹیمپلیٹس آزمائیں
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 باب کا نتیجہ**: RAG صلاحیتوں کے ساتھ AI سے چلنے والی چیٹ ایپلیکیشن کو تعینات اور کنفیگریشن کریں  

**✅ کامیابی کی تصدیق:**
```bash
# باب 2 کے بعد، آپ کو یہ کرنے کے قابل ہونا چاہیے:
azd init --template azure-search-openai-demo
azd up
# AI چیٹ انٹرفیس کا ٹیسٹ کریں
# سوالات پوچھیں اور ذرائع کے ساتھ AI کی طاقت سے حاصل کردہ جوابات حاصل کریں
# تلاش انضمام کام کر رہا ہے کی تصدیق کریں
azd monitor  # چیک کریں کہ ایپلیکیشن انسائٹس ٹیلیمیٹری دکھاتا ہے
azd down --force --purge
```

**📊 وقت کی سرمایہ کاری:** 1-2 گھنٹے  
**📈 مہارت کی سطح بعد میں:** پروڈکشن کے قابل AI ایپلیکیشنز تعینات اور کنفیگر کر سکتا ہے  
**💰 لاگت کی آگاہی:** $80-150/ماہ ترقیاتی لاگت، $300-3500/ماہ پروڈکشن لاگت  

#### 💰 AI تعینات کی لاگت کے متعلق غور و خوض

**ترقیاتی ماحول (تخمینی $80-150/ماہ):**
- Microsoft Foundry ماڈلز (پے ایز یو گو): $0-50/ماہ (ٹوکن کے استعمال پر مبنی)  
- AI تلاش (بنیادی درجے): $75/ماہ  
- کنٹینر ایپس (کنسپشن): $0-20/ماہ  
- اسٹوریج (اسٹینڈرڈ): $1-5/ماہ  

**پروڈکشن ماحول (تخمینی $300-3,500+/ماہ):**
- Microsoft Foundry ماڈلز (طویل مدتی کارکردگی کے لیے PTU): $3,000+/ماہ یا زیادہ حجم کے ساتھ پے ایز یو گو  
- AI تلاش (معیاری درجے): $250/ماہ  
- کنٹینر ایپس (ہدایت شدہ): $50-100/ماہ  
- ایپلیکیشن ان سائٹس: $5-50/ماہ  
- اسٹوریج (پریمیم): $10-50/ماہ  

**💡 لاگت کی بہتر کاری کے نکات:**
- سیکھنے کے لیے **مفت درجے** کے Microsoft Foundry ماڈلز استعمال کریں (Azure OpenAI میں ماہانہ 50,000 ٹوکن شامل ہیں)  
- ترقیاتی کام نہ کرتے وقت وسائل کو ڈی-الاکیٹ کرنے کے لیے `azd down` چلائیں  
- ابتدا میں کنسپشن بیسڈ بلنگ استعمال کریں، پروڈکشن کے لیے صرف PTU میں اپ گریڈ کریں  
- لاگت کا تخمینہ لگانے کے لیے تعیناتی سے پہلے `azd provision --preview` چلائیں  
- آٹو-اسکیلنگ فعال کریں: صرف اصل استعمال کی ادائیگی کریں  

**لاگت کی مانیٹرنگ:**
```bash
# اندازہ شدہ ماہانہ اخراجات چیک کریں
azd provision --preview

# ایزور پورٹل میں اصل اخراجات کی نگرانی کریں
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ باب 3: کنفیگریشن اور تصدیق
**ضروریات:** باب 1 مکمل  
**دورانیہ:** 45-60 منٹ  
**پیچیدگی:** ⭐⭐

#### آپ کیا سیکھیں گے
- ماحول کی کنفیگریشن اور انتظام  
- تصدیق اور سیکیورٹی کی بہترین مشقیں  
- وسائل کے نام اور تنظیم  

#### تعلیمی وسائل
- **📖 کنفیگریشن**: [کنفیگریشن گائیڈ](docs/chapter-03-configuration/configuration.md) - ماحول کی ترتیب  
- **🔐 سیکیورٹی**: [تصدیق کے طریقے اور مینجڈ شناخت](docs/chapter-03-configuration/authsecurity.md) - تصدیقی پیٹرنز  
- **📝 مثالیں**: [ڈیٹابیس ایپ مثال](examples/database-app/README.md) - AZD ڈیٹابیس کی مثالیں  

#### عملی مشقیں
- متعدد ماحول (dev, staging, prod) کی کنفیگریشن  
- مینجڈ شناخت کی تصدیق قائم کریں  
- ماحول مخصوص کنفیگریشنز نافذ کریں  

**💡 باب کا نتیجہ**: متعدد ماحول کا مناسب تصدیق اور سیکیورٹی کے ساتھ انتظام کریں  

---

### 🏗️ باب 4: انفراسٹرکچر بطور کوڈ اور تعیناتی
**ضروریات:** ابواب 1-3 مکمل  
**دورانیہ:** 1-1.5 گھنٹے  
**پیچیدگی:** ⭐⭐⭐

#### آپ کیا سیکھیں گے
- جدید تعیناتی کے نمونے  
- Bicep کے ساتھ انفراسٹرکچر بطور کوڈ  
- وسائل کے انتظام کی حکمت عملیاں  

#### تعلیمی وسائل
- **📖 تعیناتی**: [تعیناتی گائیڈ](docs/chapter-04-infrastructure/deployment-guide.md) - مکمل ورک فلو  
- **🏗️ پروویژننگ**: [وسائل کی پروویژننگ](docs/chapter-04-infrastructure/provisioning.md) - Azure وسایل کا انتظام  
- **📝 مثالیں**: [کنٹینر ایپ کی مثال](../../examples/container-app) - کنٹینر شدہ تعیناتیاں  

#### عملی مشقیں
- تخصیص شدہ Bicep ٹیمپلیٹس بنائیں  
- کثیر سروس ایپلیکیشنز تعینات کریں  
- بلیو-گرین تعیناتی کی حکمت عملی نافذ کریں  

**💡 باب کا نتیجہ**: تخصیص شدہ انفراسٹرکچر ٹیمپلیٹس کے ذریعے پیچیدہ کثیر سروس ایپلیکیشنز تعینات کریں  

---


### 🎯 باب 5: کثیر ایجنٹ AI حل (اعلیٰ درجے)
**پیشگی ضروریات**: ابواب 1-2 مکمل  
**دورانیہ**: 2-3 گھنٹے  
**پیچیدگی**: ⭐⭐⭐⭐

#### آپ کیا سیکھیں گے
- کثیر ایجنٹ فن تعمیر کے نمونے
- ایجنٹ کی نگرانی اور تعاون
- پیداوار کے قابل AI تعیناتیاں

#### تعلیمی وسائل
- **🤖 نمایاں پروجیکٹ**: [ریٹیل کثیر ایجنٹ حل](examples/retail-scenario.md) - مکمل عمل درآمد
- **🛠️ ARM ٹیمپلیٹس**: [ARM ٹیمپلیٹ پیکج](../../examples/retail-multiagent-arm-template) - ایک کلک تعیناتی
- **📖 فن تعمیر**: [کثیر ایجنٹ تعاون کے نمونے](docs/chapter-06-pre-deployment/coordination-patterns.md) - نمونے

#### عملی مشقیں
```bash
# مکمل ریٹیل ملٹی ایجنٹ حل تعینات کریں
cd examples/retail-multiagent-arm-template
./deploy.sh

# ایجنٹ کی تشکیل کو دریافت کریں
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 باب کا نتیجہ**: صارف اور انوینٹری ایجنٹس کے ساتھ پیداوار کے قابل کثیر ایجنٹ AI حل کی تعیناتی اور انتظام

---

### 🔍 باب 6: پری ڈیپلائمنٹ تصدیق اور منصوبہ بندی
**پیشگی ضروریات**: باب 4 مکمل  
**دورانیہ**: 1 گھنٹہ  
**پیچیدگی**: ⭐⭐

#### آپ کیا سیکھیں گے
- صلاحیت کی منصوبہ بندی اور وسائل کی تصدیق
- SKU انتخاب کی حکمت عملیاں
- پری فلائٹ چیکس اور خودکار عمل

#### تعلیمی وسائل
- **📊 منصوبہ بندی**: [صلاحیت کی منصوبہ بندی](docs/chapter-06-pre-deployment/capacity-planning.md) - وسائل کی تصدیق
- **💰 انتخاب**: [SKU انتخاب](docs/chapter-06-pre-deployment/sku-selection.md) - لاگت مؤثر اختیارات
- **✅ تصدیق**: [پری فلائٹ چیکس](docs/chapter-06-pre-deployment/preflight-checks.md) - خودکار اسکرپٹس

#### عملی مشقیں
- صلاحیت کی تصدیقی اسکرپٹس چلائیں
- لاگت کے لیے SKU انتخاب کو بہتر بنائیں
- خودکار پری ڈیپلائمنٹ چیکس نافذ کریں

**💡 باب کا نتیجہ**: تعیناتی کو عملدرآمد سے پہلے تصدیق اور بہتر بنائیں

---

### 🚨 باب 7: خرابیوں کا پتہ لگانا اور ڈی بگ کرنا
**پیشگی ضروریات**: کوئی بھی تعیناتی باب مکمل  
**دورانیہ**: 1-1.5 گھنٹے  
**پیچیدگی**: ⭐⭐

#### آپ کیا سیکھیں گے
- منظم ڈی بگنگ طریقے
- عام مسائل اور حل
- AI مخصوص خرابیوں کا پتہ لگانا

#### تعلیمی وسائل
- **🔧 عام مسائل**: [عام مسائل](docs/chapter-07-troubleshooting/common-issues.md) - اکثر پوچھے جانے والے سوالات اور حل
- **🕵️ ڈی بگنگ**: [ڈی بگنگ گائیڈ](docs/chapter-07-troubleshooting/debugging.md) - مرحلہ وار حکمت عملیاں
- **🤖 AI مسائل**: [AI مخصوص خرابیوں کا پتہ لگانا](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI سروس کے مسائل

#### عملی مشقیں
- تعیناتی کی ناکامیوں کی تشخیص کریں
- توثیق کے مسائل حل کریں
- AI سروس کنیکٹیویٹی کو ڈی بگ کریں

**💡 باب کا نتیجہ**: خود مختار طریقے سے عام تعیناتی مسائل کی تشخیص اور حل کریں

---

### 🏢 باب 8: پیداوار اور انٹرپرائز نمونے
**پیشگی ضروریات**: ابواب 1-4 مکمل  
**دورانیہ**: 2-3 گھنٹے  
**پیچیدگی**: ⭐⭐⭐⭐

#### آپ کیا سیکھیں گے
- پیداوار کی تعیناتی کی حکمت عملی
- انٹرپرائز سیکیورٹی نمونے
- نگرانی اور لاگت کی بہتری

#### تعلیمی وسائل
- **🏭 پیداوار**: [پیداوار AI بہترین طریقے](docs/chapter-08-production/production-ai-practices.md) - انٹرپرائز نمونے
- **📝 مثالیں**: [مائیکروسروسز کی مثال](../../examples/microservices) - پیچیدہ فن تعمیرات
- **📊 نگرانی**: [ایپلیکیشن انسائٹس انٹیگریشن](docs/chapter-06-pre-deployment/application-insights.md) - نگرانی

#### عملی مشقیں
- انٹرپرائز سیکیورٹی نمونے نافذ کریں
- مکمل نگرانی قائم کریں
- مناسب گورننس کے ساتھ پیداوار میں تعینات کریں

**💡 باب کا نتیجہ**: مکمل پیداوار صلاحیتوں کے ساتھ انٹرپرائز تیار ایپلیکیشنز تعینات کریں

---

## 🎓 ورکشاپ کا جائزہ: عملی سیکھنے کا تجربہ

> **⚠️ ورکشاپ کی حیثیت: فعال ترقی**  
> ورکشاپ کے مواد زیرِ ترقی اور بہتری کے مراحل میں ہیں۔ بنیادی ماڈیولز کام کر رہے ہیں، لیکن کچھ اعلیٰ درجے کے سیکشنز مکمل نہیں ہیں۔ ہم پورا مواد مکمل کرنے پر سرگرمی سے کام کر رہے ہیں۔ [پیش رفت دیکھیں →](workshop/README.md)

### انٹرایکٹو ورکشاپ مواد
**براؤزر کے ذریعے مکمل عملی سیکھنے کا تجربہ اور رہنمائی شدہ مشقیں**

ہمارے ورکشاپ مواد ایک منظم، انٹرایکٹو سیکھنے کا تجربہ فراہم کرتے ہیں جو اوپر دیے گئے باب کی تعلیمی نصاب کی تکمیل کرتا ہے۔ ورکشاپ خود سیکھنے اور انسٹرکٹر کی رہنمائی والے کلاسز دونوں کے لیے ڈیزائن کی گئی ہے۔

#### 🛠️ ورکشاپ کی خصوصیات
- **براؤزر بیسڈ انٹرفیس**: مکمل MkDocs سے چلنے والی ورکشاپ جس میں تلاش، کاپی، اور تھیم کی خصوصیات ہیں
- **GitHub Codespaces انٹیگریشن**: ایک کلک میں ڈیولپمنٹ ماحول کی سیٹ اپ
- **منظم تعلیمی راستہ**: 8 ماڈیولز پر مشتمل رہنمائی شدہ مشقیں (کل 3-4 گھنٹے)
- **ترقیاتی طریقہ کار**: تعارف → انتخاب → تصدیق → تجزیہ → ترتیب → تخصیص → صفائی → خلاصہ
- **انٹرایکٹو DevContainer ماحول**: پہلے سے ترتیب شدہ آلات اور انحصاریاں

#### 📚 ورکشاپ ماڈیول کا ڈھانچہ
ورکشاپ ایک **8 ماڈیولز پر مشتمل ترقیاتی طریقہ کار** کو فالو کرتی ہے جو آپ کو دریافت سے لے کر تعیناتی میں مہارت تک لے جاتا ہے:

| ماڈیول | موضوع | آپ کیا کریں گے | دورانیہ |
|--------|-------|----------------|----------|
| **0. تعارف** | ورکشاپ کا جائزہ | سیکھنے کے مقاصد، ضروریات، اور ورکشاپ کا ڈھانچہ سمجھیں | 15 منٹ |
| **1. انتخاب** | ٹیمپلیٹ دریافت | AZD ٹیمپلیٹس دریافت کریں اور اپنے منظرنامے کے لئے درست AI ٹیمپلیٹ منتخب کریں | 20 منٹ |
| **2. تصدیق** | تعینات کریں اور تصدیق کریں | `azd up` کے ساتھ ٹیمپلیٹ تعینات کریں اور انفراسٹرکچر کی کارکردگی کی تصدیق کریں | 30 منٹ |
| **3. تجزیہ** | ڈھانچہ سمجھیں | GitHub Copilot کا استعمال کرتے ہوئے ٹیمپلیٹ فن تعمیر، بائسک فائلز، اور کوڈ کی تنظیم کو دریافت کریں | 30 منٹ |
| **4. ترتیب** | azure.yaml کی گہرائی میں | `azure.yaml` کی کنفیگریشن، لائف سائیکل ہک اور ماحول متغیرات میں مہارت حاصل کریں | 30 منٹ |
| **5. تخصیص** | اسے اپنا بنائیں | AI سرچ، ٹریسنگ، تشخیص کو فعال کریں اور اپنے منظرنامے کے لیے تخصیص کریں | 45 منٹ |
| **6. صفائی** | صفائی کریں | `azd down --purge` کے ساتھ وسائل کو محفوظ طریقے سے ختم کریں | 15 منٹ |
| **7. خلاصہ** | اگلے اقدامات | کامیابیوں کا جائزہ لیں، کلیدی تصورات کو دہرائیں، اور اپنی تعلیمی سفر جاری رکھیں | 15 منٹ |

**ورکشاپ کا بہاؤ:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 ورکشاپ شروع کرنا
```bash
# اختیار 1: GitHub Codespaces (تجویز کردہ)
# ریپوزیٹری میں "Code" → "Create codespace on main" پر کلک کریں

# اختیار 2: مقامی ترقی
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md میں سیٹ اپ ہدایات پر عمل کریں
```

#### 🎯 ورکشاپ سیکھنے کے نتائج
ورکشاپ مکمل کرنے سے شرکاء:
- **پیداوار AI ایپلیکیشنز تعینات کریں**: Microsoft Foundry سروسز کے ساتھ AZD استعمال کریں
- **کثیر ایجنٹ فن تعمیر میں مہارت حاصل کریں**: مربوط AI ایجنٹ حل نافذ کریں
- **سیکیورٹی بہترین طریقے نافذ کریں**: توثیق اور رسائی کنٹرول ترتیب دیں
- **مقیاس پذیری کے لئے بہتر بنائیں**: لاگت مؤثر، مؤثر تعیناتیاں ڈیزائن کریں
- **تعیناتیاں درست کریں**: عام مسائل خود مختار طریقے سے حل کریں

#### 📖 ورکشاپ وسائل
- **🎥 انٹرایکٹو گائیڈ**: [ورکشاپ مواد](workshop/README.md) - براؤزر بیسڈ سیکھنے کا ماحول
- **📋 ماڈیول بہ ماڈیول ہدایات**:
  - [0. تعارف](workshop/docs/instructions/0-Introduction.md) - ورکشاپ کا جائزہ اور مقاصد
  - [1. انتخاب](workshop/docs/instructions/1-Select-AI-Template.md) - AI ٹیمپلیٹس تلاش کریں اور منتخب کریں
  - [2. تصدیق](workshop/docs/instructions/2-Validate-AI-Template.md) - ٹیمپلیٹس تعینات کریں اور تصدیق کریں
  - [3. تجزیہ](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - ٹیمپلیٹ فن تعمیر دریافت کریں
  - [4. ترتیب](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml میں مہارت حاصل کریں
  - [5. تخصیص](workshop/docs/instructions/5-Customize-AI-Template.md) - اپنے منظرنامے کے لئے تخصیص کریں
  - [6. صفائی](workshop/docs/instructions/6-Teardown-Infrastructure.md) - وسائل کی صفائی کریں
  - [7. خلاصہ](workshop/docs/instructions/7-Wrap-up.md) - جائزہ اور اگلے اقدامات
- **🛠️ AI ورکشاپ لیب**: [AI ورکشاپ لیب](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI مخصوص مشقیں
- **💡 فوری آغاز**: [ورکشاپ سیٹ اپ گائیڈ](workshop/README.md#quick-start) - ماحول کی ترتیب

**مناسب برائے**: کارپوریٹ تربیت، یونیورسٹی کورسز، خود سیکھنے، اور ڈیولپر بوٹ کیمپ۔

---

## 📖 تفصیلی جائزہ: AZD کی صلاحیتیں

بنیادی باتوں سے آگے، AZD پیداوار کی تعینات کیلئے طاقتور خصوصیات فراہم کرتا ہے:

- **ٹیمپلیٹ پر مبنی تعیناتیاں** - عام ایپلیکیشن نمونوں کے لیے پہلے سے تیار شدہ ٹیمپلیٹس استعمال کریں
- **انفراسٹرکچر از کوڈ** - Azure وسائل کا انتظام بائسک یا ٹیرraform کے ذریعے کریں  
- **ملحقہ ورک فلو** - بغیر رکاوٹ کے پروویژن، تعیناتی، اور نگرانی کریں
- **ڈویلپر دوست** - ڈویلپر کی پیداواریت اور تجربے کے لیے بہتر بنایا گیا

### **AZD + Microsoft Foundry: AI تعیناتیوں کے لیے بہترین**

**AI حل کے لیے AZD کیوں؟** AZD AI ڈویلپرز کو درپیش اہم چیلنجز کو حل کرتا ہے:

- **AI کے لیے تیار ٹیمپلیٹس** - Microsoft Foundry ماڈلز، Azure AI خدمات، اور ML کام کے بوجھ کے لیے پہلے سے ترتیب شدہ ٹیمپلیٹس
- **محفوظ AI تعیناتیاں** - AI خدمات، API کیز، اور ماڈل اینڈپوائنٹس کے لیے اندرونی سیکیورٹی نمونے  
- **پیداوار AI نمونے** - مقیاس پذیر، لاگت مؤثر AI اپلیکیشن تعیناتیوں کے بہترین طریقے
- **سر سے آخر AI ورک فلو** - ماڈل کی ترقی سے لے کر نگرانی کے ساتھ پراڈکشن تعیناتی تک
- **لاگت کی بہتری** - AI کام کے بوجھ کے لیے سمارٹ وسائل کی مختص اور اسکیلنگ حکمت عملیاں
- **Microsoft Foundry انٹیگریشن** - Microsoft Foundry ماڈل کیٹلاگ اور اینڈپوائنٹس کے ساتھ بغیر رکاوٹ کنکشن

---

## 🎯 ٹیمپلیٹس اور مثالوں کی لائبریری

### نمایاں: Microsoft Foundry ٹیمپلیٹس
**یہاں سے شروع کریں اگر آپ AI ایپلیکیشنز تعینات کر رہے ہیں!**

> **نوٹ:** یہ ٹیمپلیٹس مختلف AI نمونے دکھاتے ہیں۔ کچھ بیرونی Azure سیمپلز ہیں، اور کچھ مقامی عمل درآمد۔

| ٹیمپلیٹ | باب | پیچیدگی | خدمات | قسم |
|----------|---------|------------|----------|------|
| [**AI چیٹ کے ساتھ شروع کریں**](https://github.com/Azure-Samples/get-started-with-ai-chat) | باب 2 | ⭐⭐ | AzureOpenAI + Azure AI ماڈل انفرنس API + Azure AI سرچ + Azure کنٹینر ایپس + ایپلیکیشن انسائٹس | بیرونی |
| [**AI ایجنٹس کے ساتھ شروع کریں**](https://github.com/Azure-Samples/get-started-with-ai-agents) | باب 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI سرچ + Azure کنٹینر ایپس + ایپلیکیشن انسائٹس| بیرونی |
| [**Azure سرچ + OpenAI ڈیمو**](https://github.com/Azure-Samples/azure-search-openai-demo) | باب 2 | ⭐⭐ | AzureOpenAI + Azure AI سرچ + ایپ سروس + اسٹوریج | بیرونی |
| [**OpenAI چیٹ ایپ فوری شروع**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | باب 2 | ⭐ | AzureOpenAI + کنٹینر ایپس + ایپلیکیشن انسائٹس | بیرونی |
| [**ایجنٹ OpenAI پائتھن Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | باب 5 | ⭐⭐⭐ | AzureOpenAI + Azure فنکشنز + Prompty | بیرونی |
| [**Contoso چیٹ RAG**](https://github.com/Azure-Samples/contoso-chat) | باب 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI سرچ + کاسموس DB + کنٹینر ایپس | بیرونی |
| [**ریٹیل کثیر ایجنٹ حل**](examples/retail-scenario.md) | باب 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI سرچ + اسٹوریج + کنٹینر ایپس + کاسموس DB | **مقامی** |

### نمایاں: مکمل تعلیمی منظرنامے
**پیداوار کے قابل ایپلیکیشن ٹیمپلیٹس تعلیمی ابواب کے مطابق**

| ٹیمپلیٹ | تعلیمی باب | پیچیدگی | کلیدی سیکھنے کا موضوع |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | باب 2 | ⭐ | بنیادی AI تعیناتی نمونے |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | باب 2 | ⭐⭐ | Azure AI سرچ کے ساتھ RAG عمل درآمد |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | باب 4 | ⭐⭐ | دستاویز ذہانت انٹیگریشن |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | باب 5 | ⭐⭐⭐ | ایجنٹ فریم ورک اور فنکشن کالنگ |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | باب 8 | ⭐⭐⭐ | انٹرپرائز AI نگرانی |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | باب 5 | ⭐⭐⭐⭐ | صارف اور انوینٹری ایجنٹس کے ساتھ کثیر ایجنٹ فن تعمیر |

### قسم کے لحاظ سے سیکھنا

> **📌 مقامی بمقابلہ بیرونی مثالیں:**  
> **مقامی مثالیں** (اس ریپوزیٹری میں) = فوری استعمال کے لیے تیار  
> **بیرونی مثالیں** (Azure سیمپلز) = منسلک ریپوزیٹریز سے کلون کریں

#### مقامی مثالیں (فوری استعمال کے لیے تیار)
- [**ریٹیل کثیر ایجنٹ حل**](examples/retail-scenario.md) - ARM ٹیمپلیٹس کے ساتھ مکمل پیداوار کے قابل عمل درآمد
  - کثیر ایجنٹ فن تعمیر (صارف + انوینٹری ایجنٹس)
  - جامع نگرانی اور تشخیص
  - ARM ٹیمپلیٹ کے ذریعے ایک کلک تعیناتی

#### مقامی مثالیں - کنٹینر ایپلیکیشنز (ابواب 2-5)
**اس ریپوزیٹری میں جامع کنٹینر تعیناتی کی مثالیں:**

- [**کنٹینر ایپ کی مثالیں**](examples/container-app/README.md) - کنٹینرائزڈ تعیناتیوں کے لیے مکمل رہنمائی
  - [سادہ فلاسک API](../../examples/container-app/simple-flask-api) - سکيل ٹو زیرو کے ساتھ بنیادی REST API
  - [مائیکرو سروسز آرکیٹیکچر](../../examples/container-app/microservices) - پروڈکشن کے لیے تیار ملٹی سروس تعیناتی
  - فوری آغاز، پروڈکشن، اور پیش رفت تعیناتی کے نمونے
  - مانیٹرنگ، سیکیورٹی، اور لاگت کی بہتر کاری کی رہنمائی

#### بیرونی مثالیں - آسان ایپس (باب 1-2)
**شروع کرنے کے لیے ان Azure Samples ریپوز کو کلون کریں:**
- [سادہ ویب ایپ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - بنیادی تعیناتی کے نمونے
- [اسٹاتک ویب سائٹ - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - اسٹاتک مواد کی تعیناتی
- [کنٹینر ایپ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API کی تعیناتی

#### بیرونی مثالیں - ڈیٹا بیس انٹیگریشن (باب 3-4)  
- [ڈیٹا بیس ایپ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - ڈیٹا بیس کنیکٹیویٹی کے نمونے
- [فنکشنز + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - سرورلیس ڈیٹا ورک فلو

#### بیرونی مثالیں - پیش رفت نمونے (باب 4-8)
- [جاوا مائیکرو سروسز](https://github.com/Azure-Samples/java-microservices-aca-lab) - ملٹی سروس آرکیٹیکچر
- [کنٹینر ایپس کے جابز](https://github.com/Azure-Samples/container-apps-jobs) - پس منظر میں پراسیسنگ  
- [انٹرپرائز ML پائپ لائن](https://github.com/Azure-Samples/mlops-v2) - پروڈکشن کے لئے تیار ML نمونے

### بیرونی ٹیمپلیٹ کلیکشنز
- [**سرکاری AZD ٹیمپلیٹ گیلری**](https://azure.github.io/awesome-azd/) - سرکاری اور کمیونٹی ٹیمپلیٹس کا منتخب مجموعہ
- [**Azure Developer CLI ٹیمپلیٹس**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - مائیکروسافٹ لرن ٹیمپلیٹ دستاویزات
- [**مثالوں کا ڈائریکٹری**](examples/README.md) - مقامی سیکھنے کی مثالیں تفصیلی وضاحتوں کے ساتھ

---

## 📚 سیکھنے کے وسائل اور مراجع

### فوری حوالے
- [**کمانڈ چیٹ شیٹ**](resources/cheat-sheet.md) - ضروری azd کمانڈز بابوں کے مطابق مرتب
- [**اصطلاحات**](resources/glossary.md) - Azure اور azd کی اصطلاحات  
- [**اکثر پوچھے جانے والے سوالات**](resources/faq.md) - عام سوالات جو سیکھنے کے بابوں میں منظم ہیں
- [**مطالعہ کی رہنمائی**](resources/study-guide.md) - جامع عملی مشقیں

### عملی ورکشاپس
- [**AI ورکشاپ لیب**](docs/chapter-02-ai-development/ai-workshop-lab.md) - اپنی AI حل کو AZD تعیناتی کے قابل بنائیں (2-3 گھنٹے)
- [**انٹرایکٹو ورکشاپ**](workshop/README.md) - MkDocs اور GitHub Codespaces کے ساتھ 8 ماڈیول رہنما مشقیں
  - مرحلہ وار: تعارف → انتخاب → توثیق → تجزیہ → ترتیب → تخصیص → بندش → خلاصہ

### بیرونی سیکھنے کے وسائل
- [Azure Developer CLI دستاویزات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure آرکیٹیکچر سینٹر](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure قیمت کیلکولیٹر](https://azure.microsoft.com/pricing/calculator/)
- [Azure اسٹیٹس](https://status.azure.com/)

### آپ کے ایڈیٹر کے لیے AI ایجنٹ کی مہارتیں
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI، Foundry، تعیناتی، تشخیص، لاگت کی بہتر کاری اور مزید کے لیے 37 اوپن ایجنٹ مہارتیں۔ انہیں GitHub Copilot، Cursor، Claude Code، یا کسی بھی سپورٹڈ ایجنٹ میں انسٹال کریں:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 فوری مسئلہ حل کی رہنمائی

**ابتدائی افراد کو عموماً پیش آنے والے مسائل اور فوری حل:**

<details>
<summary><strong>❌ "azd: کمانڈ نہیں ملی"</strong></summary>

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
<summary><strong>❌ "کوئی سبسکرپشن نہیں ملا" یا "سبسکرپشن سیٹ نہیں کی گئی"</strong></summary>

```bash
# دستیاب سبسکرپشن کی فہرست بنائیں
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
# مختلف Azure خطہ آزمائیں
azd env set AZURE_LOCATION "westus2"
azd up

# یا ترقی میں چھوٹے SKUs استعمال کریں
# infra/main.parameters.json میں ترمیم کریں:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" آدھی راہ میں فیل ہو گیا</strong></summary>

```bash
# آپشن 1: صفائی کریں اور دوبارہ کوشش کریں
azd down --force --purge
azd up

# آپشن 2: صرف انفراسٹرکچر کو درست کریں
azd provision

# آپشن 3: تفصیلی حیثیت چیک کریں
azd show

# آپشن 4: ایذور مانیٹر میں لاگز چیک کریں
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "تصدیق ناکام" یا "ٹوکن کی مدت ختم ہو گئی"</strong></summary>

```bash
# دوبارہ توثیق کریں AZD کے لیے
azd auth logout
azd auth login

# اختیاری: اگر آپ az کمانڈز چلا رہے ہیں تو Azure CLI کو بھی ریفریش کریں
az logout
az login

# توثیق کی تصدیق کریں
az account show
```
</details>

<details>
<summary><strong>❌ "وسائل پہلے سے موجود ہیں" یا نامی تنازعات</strong></summary>

```bash
# AZD منفرد نام تخلیق کرتا ہے، لیکن اگر تنازعہ ہو:
azd down --force --purge

# پھر نئے ماحول کے ساتھ دوبارہ کوشش کریں
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ ٹیمپلیٹ کی تعیناتی میں بہت زیادہ وقت لگ رہا ہے</strong></summary>

**عام انتظار کے اوقات:**
- سادہ ویب ایپ: 5-10 منٹ
- ایپ جس میں ڈیٹا بیس ہے: 10-15 منٹ
- AI ایپلیکیشنز: 15-25 منٹ (OpenAI کی فراہمی سست ہے)

```bash
# پیش رفت چیک کریں
azd show

# اگر ۳۰ منٹ سے زیادہ پھنسے ہوئے ہیں تو، Azure پورٹل چیک کریں:
azd monitor --overview
# ناکام تنصیبات تلاش کریں
```
</details>

<details>
<summary><strong>❌ "اجازت نہیں ہے" یا "ممنوعہ"</strong></summary>

```bash
# اپنا Azure کردار چیک کریں
az role assignment list --assignee $(az account show --query user.name -o tsv)

# آپ کو کم از کم "Contributor" کا کردار درکار ہے
# اپنے Azure ایڈمن سے درخواست کریں کہ تفویض کریں:
# - Contributor (وسائل کے لیے)
# - User Access Administrator (کردار کی تفویض کے لیے)
```
</details>

<details>
<summary><strong>❌ تعینات شدہ ایپلیکیشن URL نہیں مل رہا</strong></summary>

```bash
# تمام سروس اینڈ پوائنٹس دکھائیں
azd show

# یا ایزور پورٹل کھولیں
azd monitor

# مخصوص سروس چیک کریں
azd env get-values
# *_URL ویری ایبلز تلاش کریں
```
</details>

### 📚 مکمل مسئلہ حل کے وسائل

- **عام مسائل کی رہنمائی:** [تفصیلی حل](docs/chapter-07-troubleshooting/common-issues.md)
- **AI مخصوص مسائل:** [AI مسئلہ حل](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **ڈیبگنگ کی رہنمائی:** [قدم بہ قدم ڈیبگنگ](docs/chapter-07-troubleshooting/debugging.md)
- **مدد حاصل کریں:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 کورس مکمل کرنا اور سرٹیفیکیشن

### ترقی کا سراغ لگانا
ہر باب کے ذریعے اپنی سیکھنے کی پیش رفت کو ٹریک کریں:

- [ ] **باب 1**: بنیاد اور فوری آغاز ✅
- [ ] **باب 2**: AI-پہلا ترقی ✅  
- [ ] **باب 3**: ترتیب اور تصدیق ✅
- [ ] **باب 4**: کوڈ کے طور پر انفراسٹرکچر اور تعیناتی ✅
- [ ] **باب 5**: ملٹی ایجنٹ AI حل ✅
- [ ] **باب 6**: پری ڈپلائمنٹ کی توثیق اور منصوبہ بندی ✅
- [ ] **باب 7**: مسئلہ حل اور ڈیبگنگ ✅
- [ ] **باب 8**: پروڈکشن اور انٹرپرائز نمونے ✅

### سیکھنے کی تصدیق
ہر باب مکمل کرنے کے بعد، اپنے علم کی تصدیق کریں:
1. **عملی مشق**: باب کی ہینڈ آن تعیناتی مکمل کریں
2. **علمی چیک**: اپنے باب کے FAQ سیکشن کا جائزہ لیں
3. **کمیونٹی گفتگو**: اپنے تجربات Azure Discord میں شیئر کریں
4. **اگلا باب**: اگلے پیچیدگی کے درجے پر جائیں

### کورس مکمل کرنے کے فوائد
تمام ابواب مکمل کرنے کے بعد آپ کے پاس ہوگا:
- **پروڈکشن کا تجربہ**: حقیقی AI ایپلیکیشنز کی Azure پر تعیناتی
- **پیشہ ورانہ مہارتیں**: انٹرپرائز کے لیے تیار تعیناتی کی صلاحیتیں  
- **کمیونٹی کی پہچان**: Azure ڈیولپر کمیونٹی کا فعال رکن
- **کریئر میں ترقی**: AZD اور AI تعیناتی میں طلب کی مہارت

---

## 🤝 کمیونٹی اور مدد

### مدد اور سپورٹ حاصل کریں
- **تکنیکی مسائل**: [بگ رپورٹ کریں اور خصوصیات کی درخواست کریں](https://github.com/microsoft/azd-for-beginners/issues)
- **سیکھنے کے سوالات**: [Microsoft Azure Discord کمیونٹی](https://discord.gg/microsoft-azure) اور [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI مخصوص مدد**: شامل ہوں [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **دستاویزات**: [سرکاری Azure Developer CLI دستاویزات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord سے کمیونٹی کی آراء

**#Azure چینل سے حالیہ پول نتائج:**
- **45٪** ڈیولپرز AI ورک لوڈز کے لیے AZD استعمال کرنا چاہتے ہیں
- **اہم چیلنجز**: ملٹی سروس تعیناتیاں، اسناد کا انتظام، پروڈکشن کی تیاری  
- **سب سے زیادہ درخواست کی گئی**: AI مخصوص ٹیمپلیٹس، مسئلہ حل کی رہنمائیاں، بہترین مشقیں

**ہماری کمیونٹی میں شامل ہوں تاکہ:**
- اپنے AZD + AI تجربات شیئر کریں اور مدد حاصل کریں
- نئے AI ٹیمپلیٹس کے ابتدائی معاينات تک رسائی حاصل کریں
- AI تعیناتی کی بہترین مشقوں میں تعاون کریں
- مستقبل کے AI + AZD فیچر کی ترقی پر اثر انداز ہوں

### کورس میں تعاون
ہم تعاون کا خیرمقدم کرتے ہیں! براہ کرم ہمارے [تعاون کی رہنمائی](CONTRIBUTING.md) کو پڑھیں جس میں شامل ہیں:
- **مواد کی بہتری**: موجودہ ابواب اور مثالوں کو بہتر بنائیں
- **نئی مثالیں**: حقیقی دنیا کے منظرنامے اور ٹیمپلیٹس شامل کریں  
- **ترجمہ**: کثیراللسانی سپورٹ برقرار رکھنے میں مدد کریں
- **بگ رپورٹیں**: درستگی اور وضاحت بہتر کریں
- **کمیونٹی کے معیارات**: ہمارے شامل کمیونٹی اصولوں کی پابندی کریں

---

## 📄 کورس کی معلومات

### لائسنس
یہ پروجیکٹ MIT لائسنس کے تحت لائسنس یافتہ ہے - تفصیلات کے لیے [LICENSE](../../LICENSE) فائل دیکھیں۔

### متعلقہ Microsoft سیکھنے کے وسائل

ہماری ٹیم دیگر جامع سیکھنے کے کورسز تیار کرتی ہے:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![ابتدائیوں کے لیے LangChain4j](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![ابتدائیوں کے لیے LangChain.js](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![ابتدائیوں کے لیے LangChain](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / ایجنٹس
[![AZD ابتدائیوں کے لیے](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI ابتدائیوں کے لیے](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP ابتدائیوں کے لیے](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI ایجنٹس ابتدائیوں کے لیے](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### جنریٹیو AI سیریز
[![جنریٹیو AI ابتدائیوں کے لیے](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![جنریٹیو AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![جنریٹیو AI (جاوا)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### بنیادی تعلیم
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### کوپائلٹ سیریز
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ کورس نیویگیشن

**🚀 سیکھنا شروع کرنے کے لیے تیار؟**

**نئے سیکھنے والے**: [باب 1: بنیاد اور فوری آغاز](#-chapter-1-foundation--quick-start) سے شروع کریں  
**AI ڈویلپرز**: [باب 2: AI-فرسٹ ڈیویلپمنٹ](#-chapter-2-ai-first-development-recommended-for-ai-developers) پر جائیں  
**تجربہ کار ڈیویلپرز**: [باب 3: تشکیل اور تصدیق](#️-chapter-3-configuration--authentication) سے شروع کریں

**اگلے مراحل**: [باب 1 شروع کریں - AZD بنیادی معلومات](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->