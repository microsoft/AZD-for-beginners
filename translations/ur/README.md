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

> **مقامی کلون کرنا پسند ہے؟**
>
> یہ ذخیرہ 50+ زبانوں کے تراجم پر مشتمل ہے جو ڈاؤن لوڈ سائز کو نمایاں طور پر بڑھاتا ہے۔ تراجم کے بغیر کلون کرنے کے لیے sparse checkout استعمال کریں:
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
> یہ آپ کو کورس مکمل کرنے کے لیے ضروری تمام چیزیں مہیا کرتا ہے اور ڈاؤن لوڈ بہت تیز ہوتا ہے۔
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 آج azd میں کیا نیا ہے

> 📌 یہ کورس **`azd 1.25.6`** (جون 2026) کے مطابق تصدیق شدہ ہے۔ اپنی بلڈ دیکھنے کے لیے `azd version` چلائیں، اور تازہ ترین حاصل کرنے کے لیے `azd upgrade`۔

Azure Developer CLI روایتی ویب ایپس اور APIs سے آگے بڑھ چکا ہے۔ آج، azd Azure پر کسی بھی ایپلیکیشن کو تعینات کرنے کے لیے واحد آلہ ہے—جس میں AI پاورڈ ایپس اور ذہین ایجنٹس شامل ہیں۔

اس کا مطلب آپ کے لیے:

- **AI ایجینٹس اب azd ورک لوڈز کی پہلی درجہ کی حیثیت رکھتے ہیں۔** آپ AI ایجنٹ پروجیکٹس کو `azd init` → `azd up` کے وہی ورک فلو کے ذریعے شروع، تعینات اور منظم کر سکتے ہیں جس سے آپ پہلے واقف ہیں۔
- **CLI سے ایجنٹ کی مکمل زندگی کا چکر۔** `azure.ai.agents` ایکسٹینشن اب پورے سفر کا احاطہ کرتی ہے—`azd ai agent init` سے scaffolding، `azd ai agent invoke` سے ٹیسٹ (جوابی وقت کے ساتھ)، `azd ai agent eval generate` اور `azd ai agent optimize` سے معیار کو ناپنا اور بہتر کرنا، اور `azd ai agent delete` سے صفائی۔
- **زیادہ AI بلڈنگ بلاکس۔** نئے پری ویو ایکسٹینشنز—`azure.ai.skills` اور `azure.ai.connections`—آپ کو azd کے ذریعے دوبارہ قابل استعمال ایجنٹ مہارتیں اور Foundry کنکشنز براہ راست منظم کرنے دیتے ہیں۔
- **Microsoft Foundry انضمام** ماڈل تعیناتی، ایجنٹ ہوسٹنگ، اور AI سروس کنفیگریشن کو azd ٹیمپلیٹ ایکو سسٹم میں لاتا ہے۔
- **روزمرہ کے بنیادی کاموں میں آسانی۔** حالیہ ریلیزز نے `azd init` کو idempotent بنایا (دوبارہ چلانے کے لیے محفوظ)، `azd auth login` کو پرانے ٹوکن خودکار طور پر صاف کرنے والا بنایا، اور ایک دوستانہ `azd tool` پہلی بار چلانے کی سیٹ اپ پرامپٹ شامل کی۔
- **بنیادی ورک فلو تبدیل نہیں ہوا۔** چاہے آپ ٹو ڈو ایپ، مائیکرو سروس، یا ملٹی ایجنٹ AI سلوشن تعینات کر رہے ہوں، کمانڈز ویسے ہی ہیں۔

> **Aspire صارفین کے لیے نوٹ:** مائیکروسافٹ اب اس پروڈکٹ کو سادہ طور پر **Aspire** (سابقہ ".NET Aspire") کہتا ہے۔ azd کی Aspire سپورٹ میں کوئی تبدیلی نہیں—صرف نام اپڈیٹ ہوا ہے۔

اگر آپ نے azd پہلے استعمال کیا ہے، تو AI سپورٹ ایک فطری توسیع ہے—کوئی الگ آلہ یا ایڈوانسڈ ٹریک نہیں۔ اگر آپ نئی شروعات کر رہے ہیں، تو آپ ایک ایسا ورک فلو سیکھیں گے جو ہر چیز کے لیے کام کرتا ہے۔

---

## 🚀 Azure Developer CLI (azd) کیا ہے؟

**Azure Developer CLI (azd)** ایک ڈویلپر دوستانہ کمانڈ لائن آلہ ہے جو Azure پر ایپلیکیشنز تعینات کرنا آسان بناتا ہے۔ بہت سے Azure وسائل کو دستی طور پر بنانے اور جوڑنے کی بجائے، آپ پورے ایپلیکیشنز کو ایک ہی کمانڈ سے تعینات کر سکتے ہیں۔

### `azd up` کا جادو

```bash
# یہ واحد کمانڈ سب کچھ کرتی ہے:
# ✅ تمام Azure وسائل بناتا ہے
# ✅ نیٹ ورکنگ اور سیکیورٹی کو ترتیب دیتا ہے
# ✅ آپ کے ایپلیکیشن کوڈ کو بناتا ہے
# ✅ Azure پر تعینات کرتا ہے
# ✅ آپ کو ایک فعال URL دیتا ہے
azd up
```

**بس!** کوئی Azure پورٹل کلکنگ نہیں، کوئی پیچیدہ ARM ٹیمپلیٹس سیکھنے کی ضرورت نہیں، کوئی دستی کنفیگریشن نہیں—صرف Azure پر کام کرنے والی ایپلیکیشنز۔

---

## ❓ Azure Developer CLI بمقابلہ Azure CLI: کیا فرق ہے؟

یہ سب سے عام سوال ہے جو مبتدی پوچھتے ہیں۔ یہاں سادہ جواب ہے:

| خصوصیت | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **مقصد** | انفرادی Azure وسائل کا انتظام | مکمل ایپلیکیشنز کی تعیناتی |
| **ذہنیت** | انفراسٹرکچر پر مرکوز | ایپلیکیشن پر مرکوز |
| **مثال** | `az webapp create --name myapp...` | `azd up` |
| **سیکھنے کا منحنی خط** | Azure خدمات جاننی ضروری ہیں | صرف اپنی ایپ جانیں |
| **بہترین ہے برائے** | DevOps، انفراسٹرکچر | ڈویلپرز، پروٹو ٹائپنگ |

### آسان مثال

- **Azure CLI** گھر بنانے کے لیے تمام اوزار رکھنے کی طرح ہے - ہتھوڑی، آری، کیل۔ آپ کچھ بھی بنا سکتے ہیں، مگر تعمیرات جاننا ضروری ہے۔
- **Azure Developer CLI** ایک ٹھیکیدار کو ملا لینے کے مترادف ہے—آپ بتائیں گے کیا چاہیے، اور وہ تعمیراتی کام سنبھال لے گا۔

### کب کس کا استعمال کریں

| منظر | استعمال کریں |
|----------|----------|
| "میں اپنی ویب ایپ جلدی تعینات کرنا چاہتا ہوں" | `azd up` |
| "مجھے صرف ایک اسٹوریج اکاؤنٹ بنانا ہے" | `az storage account create` |
| "میں مکمل AI ایپ بنا رہا ہوں" | `azd init --template azure-search-openai-demo` |
| "مجھے کسی مخصوص Azure وسائل کی درستی کرنی ہے" | `az resource show` |
| "میں چند منٹس میں پروڈکشن ریڈی تعیناتی چاہتا ہوں" | `azd up --environment production` |

### یہ دونوں ساتھ کام کرتے ہیں!

AZD اندرونی طور پر Azure CLI استعمال کرتا ہے۔ آپ دونوں استعمال کر سکتے ہیں:
```bash
# اپنی ایپ AZD کے ساتھ تعینات کریں
azd up

# پھر Azure CLI کے ساتھ مخصوص وسائل کو فائن ٹیون کریں
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD میں ٹیمپلیٹس تلاش کریں

شروع سے نہ کریں! **Awesome AZD** برادری کا مجموعہ ہے جو تیار ٹیمپلیٹس مہیا کرتا ہے:

| وسیلہ | تفصیل |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | ایک کلک سے 200+ ٹیمپلیٹس تلاش کریں اور تعینات کریں |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | اپنی ٹیمپلیٹ برادری کو پیش کریں |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | سورس کو اسٹار کریں اور دریافت کریں |

### Awesome AZD سے مشہور AI ٹیمپلیٹس

```bash
# RAG چیٹ Microsoft Foundry ماڈلز + AI سرچ کے ساتھ
azd init --template azure-search-openai-demo

# فوری AI چیٹ ایپلیکیشن
azd init --template openai-chat-app-quickstart

# Foundry ایجنٹس کے ساتھ AI ایجنٹس
azd init --template get-started-with-ai-agents
```

---

## 🎯 تین مراحل میں آغاز

شروع کرنے سے پہلے، یقینی بنائیں کہ آپ کی مشین اس ٹیمپلیٹ کے لیے تیار ہے جو آپ تعینات کرنا چاہتے ہیں:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

اگر کوئی بھی ضروری چیک ناکام ہو، تو پہلے اسے درست کریں اور پھر فوری آغاز کریں۔

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

### مرحلہ 2: AZD کے لیے مستند کریں

```bash
# اگر آپ اس کورس میں براہِ راست Azure CLI کمانڈز استعمال کرنے کا ارادہ رکھتے ہیں تو اختیاری
az login

# AZD ورک فلو کے لیے ضروری
azd auth login
```

اگر آپ کو یقین نہیں کہ کون سا آپ کو چاہیے، تو [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup) میں مکمل سیٹ اپ فلو پر عمل کریں۔

### مرحلہ 3: اپنی پہلی ایپ تعینات کریں

```bash
# ٹیمپلیٹ سے شروع کریں
azd init --template todo-nodejs-mongo

# ایزور پر تعینات کریں (سب کچھ بنا دیتا ہے!)
azd up
```

**🎉 ہو گیا!** آپ کی ایپ اب Azure پر زندہ ہے۔

### صفائی (یاد رہے!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 اس کورس کو کیسے استعمال کریں

یہ کورس **ترقی پسند سیکھنے** کے لیے ڈیزائن کیا گیا ہے—جہاں آپ آرام دہ ہوں وہیں سے شروع کریں اور اوپر کی طرف بڑھیں:

| آپ کا تجربہ | یہاں شروع کریں |
|-----------------|------------|
| **Azure میں بالکل نیا** | [باب 1: بنیاد](#-chapter-1-foundation--quick-start) |
| **Azure جانتے ہیں، AZD نئے ہیں** | [باب 1: بنیاد](#-chapter-1-foundation--quick-start) |
| **AI ایپلی کیشنز تعینات کرنا چاہتے ہیں** | [باب 2: AI-فرسٹ ڈیولپمنٹ](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **ہاتھ سے مشق کرنا چاہتے ہیں** | [🎓 انٹریکٹو ورکشاپ](workshop/README.md) - 3-4 گھنٹے گائیڈڈ لیب |
| **پروڈکشن پیٹرنز کی ضرورت ہے** | [باب 8: پروڈکشن اور انٹرپرائز](#-chapter-8-production--enterprise-patterns) |

### فوری سیٹ اپ

1. **اس ذخیرہ کو فورک کریں**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **کلون کریں**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **مدد حاصل کریں**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **مقامی کلون کرنا پسند ہے؟**

> یہ ذخیرہ 50+ زبانوں کے تراجم پر مشتمل ہے جو ڈاؤن لوڈ سائز کو نمایاں طور پر بڑھاتا ہے۔ تراجم کے بغیر کلون کرنے کے لیے sparse checkout استعمال کریں:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> یہ آپ کو کورس مکمل کرنے کے لیے ضروری تمام چیزیں مہیا کرتا ہے اور ڈاؤن لوڈ بہت تیز ہوتا ہے۔

## کورس کا جائزہ

Azure Developer CLI (azd) کو منظم ابواب کے ذریعے بہتر سیکھیں جو ترقی پسند سیکھنے کے لیے ترتیب دیے گئے ہیں۔ **مائیکروسافٹ Foundry انضمام کے ساتھ AI ایپلی کیشنتعیناتی پر خاص توجہ۔**
### جدید ترقی پسندوں کے لیے یہ کورس کیوں ضروری ہے

Microsoft Foundry Discord کمیونٹی کی بصیرت کی بنیاد پر، **45% ترقی پسند AI ورک لوڈز کے لیے AZD استعمال کرنا چاہتے ہیں** لیکن مندرجہ ذیل چیلنجز کا سامنا کرتے ہیں:
- پیچیدہ ملٹی سروس AI آرکیٹیکچرز
- پروڈکشن AI ڈیپلائمنٹ کی بہترین مشقیں  
- Azure AI سروس انضمام اور ترتیب
- AI ورک لوڈز کے لیے لاگت میں بہتری
- AI مخصوص ڈیپلائمنٹ کے مسائل کو حل کرنا

### سیکھنے کے مقاصد

اس منظم کورس کو مکمل کرکے، آپ:
- **AZD کے بنیادی اصولوں میں مہارت حاصل کریں گے**: کلیدی تصورات، تنصیب، اور ترتیب
- **AI ایپلی کیشنز کی تعیناتی کریں**: Microsoft Foundry خدمات کے ساتھ AZD استعمال کریں
- **انفراسٹرکچر ایز کوڈ نافذ کریں**: Bicep ٹیمپلیٹس کے ذریعے Azure وسائل کا انتظام کریں
- **ڈیپلائمنٹس کا مسئلہ حل کریں**: عام مسائل کو دور کریں اور مسائل کو ڈیبگ کریں
- **پروڈکشن کے لیے بہتر بنائیں**: سیکیورٹی، اسکیلنگ، مانیٹرنگ، اور لاگت کا انتظام
- **ملٹی ایجنٹ حل بنائیں**: پیچیدہ AI آرکیٹیکچرز تعینات کریں

## شروع کرنے سے پہلے: اکاؤنٹس، رسائی، اور مفروضات

باب 1 شروع کرنے سے پہلے، یقینی بنائیں کہ درج ذیل چیزیں موجود ہیں۔ اس گائیڈ کے بعد والے انسٹالیشن مراحل ان بنیادی چیزوں کو فرض کرتے ہیں کہ وہ پہلے سے مکمل ہو چکی ہیں۔

- **Azure سبسکرپشن**: آپ کام کی موجودہ سبسکرپشن، اپنا اکاؤنٹ، یا شروعات کے لیے [فری ٹرائل](https://aka.ms/azurefreetrial) استعمال کر سکتے ہیں۔
- **Azure وسائل بنانے کی اجازت**: زیادہ تر مشقوں کے لیے آپ کو ہدف سبسکرپشن یا ریسورس گروپ پر کم از کم **Contributor** رسائی ہونی چاہیے۔ کچھ ابواب یہ بھی فرض کر سکتے ہیں کہ آپ ریسورس گروپز، مینیجڈ آئیڈینٹیز، اور RBAC اسائنمنٹس بنا سکتے ہیں۔
- [**GitHub اکاؤنٹ**](https://github.com): یہ ریپوزیٹری فورک کرنے، اپنی تبدیلیاں ٹریک کرنے، اور ورکشاپ کے لیے GitHub Codespaces استعمال کرنے کے لیے مفید ہے۔
- **ٹیمپلیٹ رن ٹائم پری ریکوئزٹس**: کچھ ٹیمپلیٹس کے لیے مقامی ٹولز جیسے Node.js، Python، Java، یا Docker درکار ہیں۔ شروع کرنے سے پہلے سیٹ اپ ویلڈیٹر چلائیں تاکہ گمشدہ ٹولز جلدی پکڑے جا سکیں۔
- **بنیادی ٹرمینل واقفیت**: ماہر ہونے کی ضرورت نہیں، لیکن آپ کو کمانڈز جیسے `git clone`، `azd auth login`، اور `azd up` چلانے میں آسانی ہونی چاہیے۔

> **انٹرپرائز سبسکرپشن میں کام کر رہے ہیں؟**  
> اگر آپ کا Azure ماحول کسی ایڈمنسٹریٹر کے ذریعے مینیج ہوتا ہے، تو پہلے تصدیق کریں کہ آپ اس سبسکرپشن یا ریسورس گروپ میں وسائل تعینات کر سکتے ہیں جو آپ استعمال کرنے کا ارادہ رکھتے ہیں۔ اگر نہیں، تو شروع کرنے سے پہلے سینڈ باکس سبسکرپشن یا Contributor رسائی مانگیں۔

> **Azure میں نیا ہیں؟**  
> اپنی Azure ٹرائل یا Pay-as-you-go سبسکرپشن https://aka.ms/azurefreetrial سے شروع کریں تاکہ آپ مشقیں مکمل کر سکیں بغیر ٹیننٹ سطح کی منظوری کے انتظار کے۔

## 🗺️ کورس کا نقشہ: باب کے لحاظ سے فوری نیویگیشن

ہر باب کے لیے مخصوص README ہے جس میں سیکھنے کے مقاصد، فوری آغاز، اور مشقیں شامل ہیں:

| باب | موضوع | اسباق | دورانیہ | پیچیدگی |
|---------|-------|---------|----------|------------|
| **[باب 1: بنیاد](docs/chapter-01-foundation/README.md)** | شروعات | [AZD بنیادیات](docs/chapter-01-foundation/azd-basics.md) &#124; [انسٹالیشن](docs/chapter-01-foundation/installation.md) &#124; [پہلا پروجیکٹ](docs/chapter-01-foundation/first-project.md) | 30-45 منٹ | ⭐ |
| **[باب 2: AI ترقی](docs/chapter-02-ai-development/README.md)** | AI-فرسٹ ایپس | [Foundry انضمام](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI ایجنٹس](docs/chapter-02-ai-development/agents.md) &#124; [ماڈل ڈیپلائمنٹ](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ورکشاپ](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 گھنٹے | ⭐⭐ |
| **[باب 3: ترتیب](docs/chapter-03-configuration/README.md)** | توثیق اور سیکیورٹی | [ترتیب](docs/chapter-03-configuration/configuration.md) &#124; [توثیق اور سیکیورٹی](docs/chapter-03-configuration/authsecurity.md) | 45-60 منٹ | ⭐⭐ |
| **[باب 4: انفراسٹرکچر](docs/chapter-04-infrastructure/README.md)** | کوڈ کے طور پر انفراسٹرکچر اور تعیناتی | [ڈیپلائمنٹ گائیڈ](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [پروویژننگ](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 گھنٹے | ⭐⭐⭐ |
| **[باب 5: ملٹی ایجنٹ](docs/chapter-05-multi-agent/README.md)** | AI ایجنٹ حل | [ریٹیل منظر نامہ](examples/retail-scenario.md) &#124; [ہم آہنگی کے پیٹرنز](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 گھنٹے | ⭐⭐⭐⭐ |
| **[باب 6: پری-ڈیپلائمنٹ](docs/chapter-06-pre-deployment/README.md)** | منصوبہ بندی اور توثیق | [پری فلائٹ چیکس](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [صلاحیت کی منصوبہ بندی](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU کا انتخاب](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [ایپ انسائٹس](docs/chapter-06-pre-deployment/application-insights.md) | 1 گھنٹہ | ⭐⭐ |
| **[باب 7: مسئلہ حل](docs/chapter-07-troubleshooting/README.md)** | ڈیبگ اور درست کریں | [عام مسائل](docs/chapter-07-troubleshooting/common-issues.md) &#124; [ڈیبگنگ](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI مسائل](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 گھنٹے | ⭐⭐ |
| **[باب 8: پروڈکشن](docs/chapter-08-production/README.md)** | انٹرپرائز پیٹرنز | [پروڈکشن کی مشقیں](docs/chapter-08-production/production-ai-practices.md) | 2-3 گھنٹے | ⭐⭐⭐⭐ |
| **[🎓 ورکشاپ](workshop/README.md)** | عملی تجربہ | [تعریف](workshop/docs/instructions/0-Introduction.md) &#124; [چناؤ](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [توثیق](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [تجزیہ](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [ترتیب](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [حسب ضرورت](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [تنظیم کی تخفیف](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [اختتام](workshop/docs/instructions/7-Wrap-up.md) | 3-4 گھنٹے | ⭐⭐ |

**کل کورس دورانیہ:** تقریباً 10-14 گھنٹے | **مہارت کی پیشرفت:** مبتدی → پروڈکشن کے لیے تیار

---

## 📚 سیکھنے کے ابواب

*اپنی تجربے کی سطح اور مقاصد کی بنیاد پر سیکھنے کا راستہ منتخب کریں*

### 🚀 باب 1: بنیاد اور فوری آغاز  
**ضروریات:** Azure سبسکرپشن، بنیادی کمانڈ لائن معلومات  
**دورانیہ:** 30-45 منٹ  
**پیچیدگی:** ⭐

#### آپ کیا سیکھیں گے
- Azure Developer CLI کے بنیادی اصول سمجھنا
- اپنے پلیٹ فارم پر AZD انسٹال کرنا
- آپ کی پہلی کامیاب تعیناتی

#### سیکھنے کے وسائل
- **🎯 یہاں سے شروع کریں**: [Azure Developer CLI کیا ہے؟](#what-is-azure-developer-cli)
- **📖 نظریہ**: [AZD بنیادیات](docs/chapter-01-foundation/azd-basics.md) - بنیادی تصورات اور اصطلاحات
- **⚙️ سیٹ اپ**: [انسٹالیشن اور سیٹ اپ](docs/chapter-01-foundation/installation.md) - پلیٹ فارم مخصوص رہنمائیاں
- **🛠️ عملی مرحلہ**: [آپ کا پہلا پروجیکٹ](docs/chapter-01-foundation/first-project.md) - مرحلہ وار ٹیوٹوریل
- **📋 فوری حوالہ**: [کمانڈ چیٹ شیٹ](resources/cheat-sheet.md)

#### عملی مشقیں
```bash
# تیز تنصیب جانچ
azd version

# اپنا پہلا ایپلیکیشن تعینات کریں
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 باب کا نتیجہ**: AZD استعمال کرتے ہوئے Azure پر سادہ ویب ایپلیکیشن کامیابی سے تعینات کریں

**✅ کامیابی کی تصدیق:**  
```bash
# باب 1 مکمل کرنے کے بعد، آپ قادِر ہوں گے کہ:
azd version              # انسٹال شدہ ورژن دکھاتا ہے
azd init --template todo-nodejs-mongo  # پروجیکٹ کو شروع کرتا ہے
azd up                  # Azure پر تعینات کرتا ہے
azd show                # چلنے والی ایپ کا URL دکھاتا ہے
# ایپلیکیشن براؤزر میں کھلتی ہے اور کام کرتی ہے
azd down --force --purge  # وسائل کی صفائی کرتا ہے
```
  
**📊 وقت کی سرمایہ کاری:** 30-45 منٹ  
**📈 مہارت کی سطح بعد:** بنیادی ایپلیکیشنز آزادانہ تعینات کر سکتی ہیں

---

### 🤖 باب 2: AI-فرسٹ ترقی (AI ڈویلپرز کے لیے سفارش کی جاتی ہے)  
**ضروریات:** باب 1 مکمل  
**دورانیہ:** 1-2 گھنٹے  
**پیچیدگی:** ⭐⭐

#### آپ کیا سیکھیں گے
- AZD کے ساتھ Microsoft Foundry انضمام
- AI پر مبنی ایپلیکیشنز کی تعیناتی
- AI سروس کنفیگریشنز سمجھنا

#### سیکھنے کے وسائل
- **🎯 یہاں سے شروع کریں**: [Microsoft Foundry انضمام](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI ایجنٹس**: [AI ایجنٹس گائیڈ](docs/chapter-02-ai-development/agents.md) - AZD کے ساتھ ذہین ایجنٹس تعینات کریں
- **📖 پیٹرنز**: [AI ماڈل ڈیپلائمنٹ](docs/chapter-02-ai-development/ai-model-deployment.md) - AI ماڈلز تعینات اور منظم کریں
- **🛠️ ورکشاپ**: [AI ورکشاپ لیب](docs/chapter-02-ai-development/ai-workshop-lab.md) - اپنے AI حل AZD کے لیے تیار کریں
- **🎥 انٹرایکٹو گائیڈ**: [ورکشاپ مواد](workshop/README.md) - MkDocs * DevContainer ماحول کے ساتھ براؤزر بیسڈ لرننگ
- **📋 ٹیمپلیٹس**: [Microsoft Foundry ٹیمپلیٹس](#ورکشاپ-وسائل)
- **📝 مثالیں**: [AZD ڈیپلائمنٹ مثالیں](examples/README.md)

#### عملی مشقیں  
```bash
# اپنا پہلا AI ایپلیکیشن تعینات کریں
azd init --template azure-search-openai-demo
azd up

# اضافی AI ٹیمپلیٹس آزمانے کی کوشش کریں
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 باب کا نتیجہ**: RAG صلاحیتوں کے ساتھ AI پر مبنی چیٹ ایپلیکیشن تعینات اور تشکیل دیں

**✅ کامیابی کی تصدیق:**  
```bash
# باب 2 کے بعد، آپ قابل ہونے چاہئیں:
azd init --template azure-search-openai-demo
azd up
# AI چیٹ انٹرفیس کی جانچ کریں
# سوالات پوچھیں اور ذرائع کے ساتھ AI کی مدد یافتہ جوابات حاصل کریں
# یقینی بنائیں کہ سرچ انٹیگریشن کام کرتی ہے
azd monitor  # چیک کریں کہ ایپلیکیشن انسائٹس ٹیلی میٹری دکھا رہی ہے
azd down --force --purge
```
  
**📊 وقت کی سرمایہ کاری:** 1-2 گھنٹے  
**📈 مہارت کی سطح بعد:** پروڈکشن کے لیے تیار AI ایپلیکیشنز تعینات اور کنفیگر کر سکتے ہیں  
**💰 لاگت کی آگاہی:** $80-150/ماہ ترقیاتی لاگت، $300-3500/ماہ پروڈکشن لاگت کو سمجھیں

#### 💰 AI تعیناتیوں کے لیے لاگت کے پہلو

**ترقیاتی ماحول (تخمینہ $80-150/ماہ):**  
- Microsoft Foundry ماڈلز (Pay-as-you-go): $0-50/ماہ (ٹوکین استعمال کی بنیاد پر)  
- AI سرچ (بنیادی درجے): $75/ماہ  
- کنٹینر ایپس (کھپت پر مبنی): $0-20/ماہ  
- اسٹوریج (معیاری): $1-5/ماہ  

**پروڈکشن ماحول (تخمینہ $300-3,500+/ماہ):**  
- Microsoft Foundry ماڈلز (PTU مستقل کارکردگی کے لیے): $3,000+/ماہ یا Pay-as-you-go زیادہ مقدار کے ساتھ  
- AI سرچ (معیاری درجے): $250/ماہ  
- کنٹینر ایپس (مخصوص): $50-100/ماہ  
- ایپلیکیشن انسائٹس: $5-50/ماہ  
- اسٹوریج (پریمیم): $10-50/ماہ  

**💡 لاگت کی بہتری کے نکات:**  
- سیکھنے کے لیے **Free Tier** Microsoft Foundry ماڈلز استعمال کریں (Azure OpenAI میں 50,000 ٹوکینز/ماہ شامل ہیں)  
- فعال ترقی نہ ہونے پر `azd down` چلائیں تاکہ وسائل کو خالی کیا جا سکے  
- کھپت کی بنیاد پر بلنگ کے ساتھ شروع کریں، صرف پروڈکشن کے لیے PTU اپ گریڈ کریں  
- تعیناتی سے پہلے `azd provision --preview` کے ذریعے لاگت کا اندازہ لگائیں  
- خودکار اسکیلنگ فعال کریں: صرف حقیقی استعمال کے لیے ادائیگی کریں  

**لاگت مانیٹرنگ:**  
```bash
# ماہانہ اندازہ شدہ لاگت چیک کریں
azd provision --preview

# ایزور پورٹل میں حقیقی لاگت کی نگرانی کریں
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ باب 3: ترتیب اور توثیق  
**ضروریات:** باب 1 مکمل  
**دورانیہ:** 45-60 منٹ  
**پیچیدگی:** ⭐⭐

#### آپ کیا سیکھیں گے
- ماحول کی ترتیب اور انتظام
- توثیق اور سیکیورٹی کی بہترین مشقیں
- وسائل کا نام اور تنظیم

#### سیکھنے کے وسائل
- **📖 ترتیب**: [ترتیب رہنما](docs/chapter-03-configuration/configuration.md) - ماحول سیٹ اپ
- **🔐 سیکیورٹی**: [توثیقی پیٹرنز اور مینیجڈ آئیڈینٹی](docs/chapter-03-configuration/authsecurity.md) - توثیقی پیٹرنز
- **📝 مثالیں**: [ڈیٹا بیس ایپ مثال](examples/database-app/README.md) - AZD ڈیٹا بیس کی مثالیں

#### عملی مشقیں
- متعدد ماحول (dev، staging، prod) ترتیب دیں  
- مینیجڈ آئیڈینٹی توثیق نافذ کریں  
- ماحول کی مخصوص ترتیبیں نافذ کریں  

**💡 باب کا نتیجہ**: مناسب توثیق اور سیکیورٹی کے ساتھ متعدد ماحول کا انتظام کریں

---

### 🏗️ باب 4: انفراسٹرکچر ایز کوڈ اور تعیناتی  
**ضروریات:** ابواب 1-3 مکمل  
**دورانیہ:** 1-1.5 گھنٹے  
**پیچیدگی:** ⭐⭐⭐

#### آپ کیا سیکھیں گے
- جدید تعیناتی کے پیٹرنز  
- Bicep کے ساتھ انفراسٹرکچر ایز کوڈ  
- وسائل کی فراہمی کی حکمت عملی

#### سیکھنے کے وسائل
- **📖 ڈیپلائمنٹ**: [ڈیپلائمنٹ گائیڈ](docs/chapter-04-infrastructure/deployment-guide.md) - مکمل ورک فلو  
- **🏗️ پروویژننگ**: [وسائل کی فراہمی](docs/chapter-04-infrastructure/provisioning.md) - Azure وسائل کا انتظام  
- **📝 مثالیں**: [کنٹینر ایپ مثال](../../examples/container-app) - کنٹینرائزڈ تعیناتیاں

#### عملی مشقیں
- کسٹم Bicep ٹیمپلیٹس بنائیں  
- ملٹی سروس ایپلیکیشنز تعینات کریں  
- بلیو-گرین تعیناتی حکمت عملی نافذ کریں  

**💡 باب کا نتیجہ**: کسٹم انفراسٹرکچر ٹیمپلیٹس کے ذریعے پیچیدہ ملٹی سروس ایپلیکیشنز تعینات کریں

---
### 🎯 باب 5: ملٹی ایجنٹ AI حل (ایڈوانسڈ)  
**پیشگی شرائط**: ابواب 1-2 مکمل  
**دورانیہ**: 2-3 گھنٹے  
**پیچیدگی**: ⭐⭐⭐⭐

#### آپ کیا سیکھیں گے  
- ملٹی ایجنٹ فن تعمیر کے نمونے  
- ایجنٹ کا آرکسٹراشن اور کوآرڈینیشن  
- پروڈکشن کے لیے تیار AI کی تنصیبات  

#### تعلیمی وسائل  
- **🤖 نمایاں پروجیکٹ**: [ریٹیل ملٹی ایجنٹ حل](examples/retail-scenario.md) - مکمل نفاذ  
- **🛠️ ARM ٹیمپلیٹس**: [ARM ٹیمپلیٹ پیکج](../../examples/retail-multiagent-arm-template) - ایک کلک تنصیب  
- **📖 فن تعمیر**: [ملٹی ایجنٹ کوآرڈینیشن کے نمونے](docs/chapter-06-pre-deployment/coordination-patterns.md) - نمونے  

#### عملی مشقیں  
```bash
# مکمل ریٹیل ملٹی ایجنٹ حل کو نافذ کریں
cd examples/retail-multiagent-arm-template
./deploy.sh

# ایجنٹ کی ترتیبوں کو دریافت کریں
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 باب کا نتیجہ**: کسٹمر اور انوینٹری ایجنٹس کے ساتھ پروڈکشن کے لیے تیار ملٹی ایجنٹ AI حل کی تعیناتی اور انتظام  

---

### 🔍 باب 6: پری-ڈپلائمنٹ ویلیڈیشن اور منصوبہ بندی  
**پیشگی شرائط**: باب 4 مکمل  
**دورانیہ**: 1 گھنٹہ  
**پیچیدگی**: ⭐⭐

#### آپ کیا سیکھیں گے  
- صلاحیت کی منصوبہ بندی اور وسائل کی توثیق  
- SKU انتخاب کی حکمت عملیاں  
- پری-فلائٹ چیکس اور آٹومیشن  

#### تعلیمی وسائل  
- **📊 منصوبہ بندی**: [صلاحیت کی منصوبہ بندی](docs/chapter-06-pre-deployment/capacity-planning.md) - وسائل کی توثیق  
- **💰 انتخاب**: [SKU انتخاب](docs/chapter-06-pre-deployment/sku-selection.md) - لاگت مؤثر انتخاب  
- **✅ توثیق**: [پری-فلائٹ چیکس](docs/chapter-06-pre-deployment/preflight-checks.md) - خودکار اسکرپٹس  

#### عملی مشقیں  
- صلاحیت کی توثیق کے اسکرپٹس چلائیں  
- لاگت کے لحاظ سے SKU انتخاب کو بہتر بنائیں  
- خودکار پری-ڈپلائمنٹ چیکس نافذ کریں  

**💡 باب کا نتیجہ**: تعیناتی سے پہلے تصدیق اور اصلاح کریں  

---

### 🚨 باب 7: مسائل کا حل اور ڈیبگنگ  
**پیشگی شرائط**: کسی بھی ڈپلائمنٹ باب کا مکمل ہونا  
**دورانیہ**: 1-1.5 گھنٹے  
**پیچیدگی**: ⭐⭐

#### آپ کیا سیکھیں گے  
- منظم ڈیبگنگ کے طریقے  
- عام مسائل اور حل  
- AI مخصوص مسائل کا حل  

#### تعلیمی وسائل  
- **🔧 عام مسائل**: [عام مسائل](docs/chapter-07-troubleshooting/common-issues.md) - اکثر پوچھے جانے والے سوالات اور حل  
- **🕵️ ڈیبگنگ**: [ڈیبگنگ گائیڈ](docs/chapter-07-troubleshooting/debugging.md) - مرحلہ وار حکمت عملیاں  
- **🤖 AI مسائل**: [AI-مخصوص مسائل](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI سروس کے مسائل  

#### عملی مشقیں  
- ڈپلائمنٹ کی ناکامیوں کی تشخیص کریں  
- توثیق کے مسائل حل کریں  
- AI سروس کنیکٹیویٹی کو ڈیبگ کریں  

**💡 باب کا نتیجہ**: عام ڈپلائمنٹ مسائل کی خود مختارانہ تشخیص اور حل  

---

### 🏢 باب 8: پروڈکشن اور انٹرپرائز کے نمونے  
**پیشگی شرائط**: ابواب 1-4 مکمل  
**دورانیہ**: 2-3 گھنٹے  
**پیچیدگی**: ⭐⭐⭐⭐

#### آپ کیا سیکھیں گے  
- پروڈکشن ڈپلائمنٹ کی حکمت عملیاں  
- انٹرپرائز سیکیورٹی کے نمونے  
- مانیٹرنگ اور لاگت کی بہتری  

#### تعلیمی وسائل  
- **🏭 پروڈکشن**: [پروڈکشن AI بہترین عمل](docs/chapter-08-production/production-ai-practices.md) - انٹرپرائز کے نمونے  
- **📝 مثالیں**: [مائیکرو سروسز کی مثال](../../examples/microservices) - پیچیدہ فن تعمیر  
- **📊 مانیٹرنگ**: [ایپلیکیشن انسائٹس انٹیگریشن](docs/chapter-06-pre-deployment/application-insights.md) - مانیٹرنگ  

#### عملی مشقیں  
- انٹرپرائز سیکیورٹی نمونوں کا نفاذ کریں  
- مکمل مانیٹرنگ قائم کریں  
- مناسب گورننس کے ساتھ پروڈکشن میں ڈیپلائے کریں  

**💡 باب کا نتیجہ**: مکمل پروڈکشن صلاحیتوں کے ساتھ انٹرپرائز ایپلیکیشنز کی تعیناتی  

---

## 🎓 ورکشاپ کا جائزہ: عملی سیکھنے کا تجربہ  

> **⚠️ ورکشاپ کی حالت: فعال ترقی**  
> ورکشاپ کے مواد کی تیاری اور بہتری جاری ہے۔ بنیادی ماڈیول فعال ہیں، مگر کچھ اعلیٰ سیکشنز مکمل نہیں۔ ہم مواد کو مکمل کرنے پر کام کر رہے ہیں۔ [رفتار دیکھیں →](workshop/README.md)  

### انٹریکٹو ورکشاپ مواد  
**مکمل عملی سیکھنے کا تجربہ، براؤزر پر مبنی ٹولز اور رہنمائی کے ساتھ**  

ہماری ورکشاپ کا مواد ایک منظم، انٹریکٹو سیکھنے کا تجربہ فراہم کرتا ہے جو اوپر دیے گئے ابواب کے نصاب کے ساتھ مکمل ہوتا ہے۔ ورکشاپ خود رفتار سیکھنے اور انسٹرکٹر کے زیر رہنمائی سیشنز دونوں کے لیے ڈیزائن کی گئی ہے۔  

#### 🛠️ ورکشاپ کی خصوصیات  
- **براؤزر پر مبنی انٹرفیس**: مکمل MkDocs سے چلنے والی ورکشاپ، تلاش، کاپی، اور تھیم کے فیچرز کے ساتھ  
- **GitHub Codespaces انٹیگریشن**: ایک کلک کے ساتھ ڈویلپمنٹ ماحول کی تیاری  
- **منظم سیکھنے کا راستہ**: 8 ماڈیول پر مبنی رہنمائی شدہ مشقیں (کل 3-4 گھنٹے)  
- **ترقی پسند طریقہ کار**: تعارف → انتخاب → توثیق → تجزیہ → تشکیل → تخصیص → صفائی → اختتام  
- **انٹریکٹو DevContainer ماحول**: پہلے سے ترتیب دیے گئے ٹولز اور انحصار  

#### 📚 ورکشاپ ماڈیول کی ساخت  
ورکشاپ ایک **8 ماڈیولز پر مشتمل ترقی پسند طریقہ کار** پر عمل کرتی ہے جو آپ کو دریافت سے لے کر مہارت تک لے جاتی ہے:  

| ماڈیول | موضوع | آپ کیا کریں گے | دورانیہ |  
|--------|-------|----------------|----------|  
| **0. تعارف** | ورکشاپ کا جائزہ | سیکھنے کے مقاصد، پیشگی شرائط، اور ورکشاپ کا ڈھانچہ سمجھیں | 15 منٹ |  
| **1. انتخاب** | ٹیمپلیٹ کی دریافت | AZD ٹیمپلیٹس تلاش کریں اور اپنے منظر نامے کے لیے صحیح AI ٹیمپلیٹ منتخب کریں | 20 منٹ |  
| **2. توثیق** | ڈیپلائے اور تصدیق | `azd up` کے ساتھ ٹیمپلیٹ تعینات کریں اور انفراسٹرکچر کی تصدیق کریں | 30 منٹ |  
| **3. تجزیہ** | ساخت کو سمجھیں | GitHub Copilot کی مدد سے ٹیمپلیٹ فن تعمیر، بائسک فائلز، اور کوڈ آرگنائزیشن دریافت کریں | 30 منٹ |  
| **4. ترتیب** | azure.yaml پر گرفت | `azure.yaml` کی تشکیل، lifecycle hooks، اور ماحول کی متغیرات میں مہارت حاصل کریں | 30 منٹ |  
| **5. تخصیص** | اسے اپنا بنائیں | AI سرچ، ٹریسنگ، تشخیص فعال کریں اور اپنے منظر نامے کے مطابق تخصیص کریں | 45 منٹ |  
| **6. صفائی** | وسائل کا انخلا | `azd down --purge` کے ذریعے وسائل کی محفوظ صفائی کریں | 15 منٹ |  
| **7. اختتام** | اگلے مراحل | کامیابیوں، کلیدی تصورات کا جائزہ لیں اور اپنی سیکھنے کی راہ جاری رکھیں | 15 منٹ |  

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
# آپشن 1: گٹ ہب کوڈ اسپیسز (تجویز کردہ)
# ریپوزٹری میں "Code" → "Create codespace on main" پر کلک کریں

# آپشن 2: لوکل ڈیولپمنٹ
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# ورکشاپ/README.md میں سیٹ اپ کی ہدایات پر عمل کریں
```
  
#### 🎯 ورکشاپ سے حاصل ہونے والے نتائج  
ورکشاپ مکمل کرنے والے شرکاء:  
- **پروڈکشن AI ایپلیکیشنز کی تعیناتی**: Microsoft Foundry خدمات کے ساتھ AZD کا استعمال  
- **ملٹی ایجنٹ فن تعمیر میں مہارت**: مربوط AI ایجنٹ حل نافذ کریں  
- **سیکیورٹی کے بہترین طریقے نافذ کریں**: توثیق اور رسائی کنٹرول ترتیب دیں  
- **اسکیلنگ کے لیے اصلاح**: لاگت مؤثر، کارکردگی بخش تعیناتیوں کا ڈیزائن  
- **ڈپلائمنٹ مسائل حل کریں**: عام مسائل کو خود مختارانہ طور پر حل کریں  

#### 📖 ورکشاپ وسائل  
- **🎥 انٹریکٹو گائیڈ**: [ورکشاپ کے مواد](workshop/README.md) - براؤزر پر مبنی سیکھنے کا ماحول  
- **📋 ماڈیول بہ ماڈیول ہدایات**:  
  - [0. تعارف](workshop/docs/instructions/0-Introduction.md) - ورکشاپ کا جائزہ اور مقاصد  
  - [1. انتخاب](workshop/docs/instructions/1-Select-AI-Template.md) - AI ٹیمپلیٹس کی تلاش اور انتخاب  
  - [2. توثیق](workshop/docs/instructions/2-Validate-AI-Template.md) - ٹیمپلیٹس کی تعیناتی اور تصدیق  
  - [3. تجزیہ](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - ٹیمپلیٹ فن تعمیر کی دریافت  
  - [4. ترتیب](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml میں مہارت  
  - [5. تخصیص](workshop/docs/instructions/5-Customize-AI-Template.md) - اپنے منظر نامے کے مطابق تخصیص  
  - [6. صفائی](workshop/docs/instructions/6-Teardown-Infrastructure.md) - وسائل کی صفائی  
  - [7. اختتام](workshop/docs/instructions/7-Wrap-up.md) - جائزہ اور اگلے اقدامات  
- **🛠️ AI ورکشاپ لیب**: [AI ورکشاپ لیب](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI مرکوز مشقیں  
- **💡 جلد آغاز کرنے کی گائیڈ**: [ورکشاپ سیٹ اپ گائیڈ](workshop/README.md#quick-start) - ماحول کی ترتیب  

**مناسب برائے**: کارپوریٹ تربیت، یونیورسٹی کورسز، خود رفتار سیکھنے، اور ڈویلپر بوٹ کیمپس۔

---

## 📖 گہرائی سے جائزہ: AZD صلاحیتیں  

بنیادی باتوں کے علاوہ، AZD پروڈکشن ڈپلائمنٹ کے لیے طاقتور خصوصیات فراہم کرتا ہے:  

- **ٹیمپلیٹ پر مبنی تعیناتیاں** - عام ایپلیکیشن پیٹرنز کے لیے پہلے سے تیار ٹیمپلیٹس  
- **انفراسٹرکچر ایز کوڈ** - بائسک یا ٹیررافارم کی مدد سے Azure وسائل کا نظم  
- **یکجا ورک فلو** - ایپلیکیشنز کی روانی سے فراہمی، تعیناتی، اور مانیٹرنگ  
- **ڈویلپر دوست** - ڈویلپر کی پیداواریت اور تجربے کے لیے موزوں  

### **AZD + Microsoft Foundry: AI ڈپلائمنٹس کے لیے بہترین**  

**کیوں AZD برائے AI حل؟** AZD AI ڈویلپرز کو درپیش اہم چیلنجز کو حل کرتا ہے:  

- **AI کے لیے تیار ٹیمپلیٹس** - Microsoft Foundry ماڈل، Azure AI سروسز، اور ML ورک لوڈز کے لیے پہلے سے ترتیب دیے گئے ٹیمپلیٹس  
- **محفوظ AI تعیناتیاں** - AI سروسز، API کیز، اور ماڈل اینڈ پوائنٹس کے لیے بلٹ ان سیکیورٹی پیٹرنز  
- **پروڈکشن AI نمونے** - اسکیل ایبل، لاگت مؤثر AI ایپلیکیشن ڈپلائیمنٹ کے بہترین طریقے  
- **ایند ٹو ایند AI ورک فلو** - ماڈل کی ترقی سے لے کر درست مانیٹرنگ کے ساتھ پروڈکشن تعیناتی تک  
- **لاگت کی اصلاح** - AI ورک لوڈز کے لیے ذکی وسائل کی تقسیم اور اسکیلنگ کی حکمت عملی  
- **Microsoft Foundry انٹیگریشن** - Microsoft Foundry ماڈل کیٹلاگ اور اینڈ پوائنٹس سے مربوط کنکشن  

---

## 🎯 ٹیمپلیٹس اور مثالوں کی لائبریری

### نمایاں: Microsoft Foundry ٹیمپلیٹس  
**اگر آپ AI ایپلیکیشنز تعینات کر رہے ہیں تو یہاں سے آغاز کریں!**

> **نوٹ:** یہ ٹیمپلیٹس مختلف AI نمونوں کی نمایش کرتے ہیں۔ کچھ بیرونی Azure سیمپلز ہیں، کچھ مقامی نفاذ ہیں۔  

| ٹیمپلیٹ | باب | پیچیدگی | خدمات | قسم |  
|----------|---------|------------|----------|------|  
| [**AI چیٹ کے ساتھ شروع کریں**](https://github.com/Azure-Samples/get-started-with-ai-chat) | باب 2 | ⭐⭐ | AzureOpenAI + Azure AI ماڈل انفرنس API + Azure AI سرچ + Azure کنٹینر ایپس + ایپلیکیشن انسائٹس | بیرونی |  
| [**AI ایجنٹس کے ساتھ شروع کریں**](https://github.com/Azure-Samples/get-started-with-ai-agents) | باب 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI سرچ + Azure کنٹینر ایپس + ایپلیکیشن انسائٹس| بیرونی |  
| [**Azure سرچ + OpenAI ڈیمو**](https://github.com/Azure-Samples/azure-search-openai-demo) | باب 2 | ⭐⭐ | AzureOpenAI + Azure AI سرچ + ایپ سروس + اسٹوریج | بیرونی |  
| [**OpenAI چیٹ ایپ کوئیک اسٹارٹ**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | باب 2 | ⭐ | AzureOpenAI + کنٹینر ایپس + ایپلیکیشن انسائٹس | بیرونی |  
| [**ایجنٹ OpenAI پائتھن پرومپٹی**](https://github.com/Azure-Samples/agent-openai-python-prompty) | باب 5 | ⭐⭐⭐ | AzureOpenAI + Azure فنگشنز + پرومپٹی | بیرونی |  
| [**Contoso چیٹ RAG**](https://github.com/Azure-Samples/contoso-chat) | باب 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI سرچ + Cosmos DB + کنٹینر ایپس | بیرونی |  
| [**ریٹیل ملٹی ایجنٹ حل**](examples/retail-scenario.md) | باب 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI سرچ + اسٹوریج + کنٹینر ایپس + Cosmos DB | **مقامی** |  

### نمایاں: مکمل سیکھنے کے منظرنامے  
**پروڈکشن کے لیے تیار ایپلیکیشن ٹیمپلیٹس، سیکھنے کے ابواب کے مطابق**  

| ٹیمپلیٹ | سیکھنے کا باب | پیچیدگی | کلیدی سیکھنے |  
|----------|------------------|------------|--------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | باب 2 | ⭐ | بنیادی AI تعیناتی کے نمونے |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | باب 2 | ⭐⭐ | Azure AI سرچ کے ساتھ RAG نفاذ |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | باب 4 | ⭐⭐ | دستاویز انٹیلیجنس انٹیگریشن |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | باب 5 | ⭐⭐⭐ | ایجنٹ فریم ورک اور فنکشن کالنگ |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | باب 8 | ⭐⭐⭐ | انٹرپرائز AI آرکسٹرشن |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | باب 5 | ⭐⭐⭐⭐ | کسٹمر اور انوینٹری ایجنٹس کے ساتھ ملٹی ایجنٹ فن تعمیر |  

### مثال کی قسم کے لحاظ سے سیکھنا  

> **📌 مقامی بمقابلہ بیرونی مثالیں:**  
> **مقامی مثالیں** (اس ریپوزیٹری میں) = فوری استعمال کے لیے تیار  
> **بیرونی مثالیں** (Azure سیمپلز) = لنکڈ ریپوزیٹریز سے کلون کریں  

#### مقامی مثالیں (فوری استعمال کے لیے تیار)  
- [**ریٹیل ملٹی ایجنٹ حل**](examples/retail-scenario.md) - ARM ٹیمپلیٹس کے ساتھ مکمل پروڈکشن تیار نفاذ  
  - ملٹی ایجنٹ فن تعمیر (کسٹمر + انوینٹری ایجنٹس)  
  - جامع مانیٹرنگ اور تشخیص  
  - ARM ٹیمپلیٹ کے ذریعے ایک کلک تنصیب  

#### مقامی مثالیں - کنٹینر ایپلیکیشنز (ابواب 2-5)  
**اس ریپوزیٹری میں جامع کنٹینر ڈپلائمنٹ کی مثالیں:**
- [**کنٹینر ایپ مثالیں**](examples/container-app/README.md) - کنٹینرائزڈ تعیناتیوں کے لیے مکمل رہنما
  - [سادہ فلاسک API](../../examples/container-app/simple-flask-api) - سکيل ٹو زیرو کے ساتھ بنیادی REST API
  - [مائکرو سروسز آرکیٹیکچر](../../examples/container-app/microservices) - پروڈکشن کے لیے تیار ملٹی سروس تعیناتی
  - فوری شروع، پیداواری اور اعلیٰ تعیناتی کے نمونے
  - نگرانی، سیکیورٹی، اور لاگت کی اصلاح کے رہنما اصول

#### خارجی مثالیں - سادہ ایپلیکیشنز (ابواب 1-2)
**شروع کرنے کے لیے ان Azure Samples ریپوزیٹریز کو کلون کریں:**
- [سادہ ویب ایپ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - بنیادی تعیناتی کے نمونے
- [جامد ویب سائٹ - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - جامد مواد کی تعیناتی
- [کنٹینر ایپ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API کی تعیناتی

#### خارجی مثالیں - ڈیٹابیس انٹیگریشن (ابواب 3-4)  
- [ڈیٹابیس ایپ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - ڈیٹابیس کنیکٹیویٹی کے نمونے
- [فَنکشنز + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - سرور لیس ڈیٹا ورک فلو

#### خارجی مثالیں - اعلیٰ نمونے (ابواب 4-8)
- [جاوا مائکرو سروسز](https://github.com/Azure-Samples/java-microservices-aca-lab) - ملٹی سروس آرکیٹیکچرز
- [کنٹینر ایپس جابز](https://github.com/Azure-Samples/container-apps-jobs) - پس منظر پراسیسنگ  
- [انٹرپرائز ایم ایل پائپ لائن](https://github.com/Azure-Samples/mlops-v2) - پروڈکشن کے لیے تیار ML نمونے

### خارجی ٹیمپلیٹ کلیکشنز
- [**سرکاری AZD ٹیمپلیٹ گیلری**](https://azure.github.io/awesome-azd/) - سرکاری اور کمیونٹی ٹیمپلیٹس کا منتخب مجموعہ
- [**Azure Developer CLI ٹیمپلیٹس**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - مائیکروسافٹ لرن ٹیمپلیٹ دستاویزات
- [**مثالوں کی ڈائریکٹری**](examples/README.md) - مقامی سیکھنے کی مثالیں تفصیلی وضاحتوں کے ساتھ

---

## 📚 سیکھنے کے وسائل اور حوالے

### فوری حوالہ جات
- [**کمانڈ چیٹ شیٹ**](resources/cheat-sheet.md) - ابواب کے مطابق منظم لازمی azd کمانڈز
- [**اصطلاحات**](resources/glossary.md) - Azure اور azd کی اصطلاحات  
- [**عمومی سوالات**](resources/faq.md) - سیکھنے کے ابواب کے مطابق عام سوالات
- [**مطالعہ گائیڈ**](resources/study-guide.md) - جامع مشقیں

### ہینڈز آن ورکشاپس
- [**AI ورکشاپ لیب**](docs/chapter-02-ai-development/ai-workshop-lab.md) - اپنے AI حلوں کو AZD سے تعینات کرنے کے قابل بنائیں (2-3 گھنٹے)
- [**انٹرایکٹو ورکشاپ**](workshop/README.md) - MkDocs اور GitHub Codespaces کے ساتھ 8 ماڈیولز پر مشتمل رہنما مشقیں
  - درج ذیل مراحل پر عمل کریں: تعارف → انتخاب → توثیق → تجزیہ → ترتیب → تخصیص → ختم کرنا → خلاصہ

### خارجی سیکھنے کے وسائل
- [Azure Developer CLI دستاویزات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure آرکیٹیکچر سینٹر](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure پرائسنگ کیلکولیٹر](https://azure.microsoft.com/pricing/calculator/)
- [Azure اسٹیٹس](https://status.azure.com/)

### آپ کے ایڈیٹر کے لیے AI ایجنٹ اسکلز
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI، Foundry، تعیناتی، ڈائیگناسٹکس، لاگت کی اصلاح، اور مزید کے لیے 37 اوپن ایجنٹ اسکلز۔ انہیں GitHub Copilot، Cursor، Claude Code، یا کسی بھی سپورٹڈ ایجنٹ میں انسٹال کریں:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 فوری پریشانی حل کرنے کی رہنما

**نوزائیدہ افراد کے عام مسائل اور فوری حل:**

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

# انسٹالیشن کی تصدیق کریں
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
<summary><strong>❌ "InsufficientQuota" یا "کوٹا ختم ہو گیا"</strong></summary>

```bash
# مختلف ایزور خطہ آزما ئیں
azd env set AZURE_LOCATION "westus2"
azd up

# یا ترقی میں چھوٹے SKUs استعمال کریں
# infra/main.parameters.json کو ایڈٹ کریں :
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

# آپشن 2: صرف بنیادی ڈھانچے کو ٹھیک کریں
azd provision

# آپشن 3: تفصیلی حالت چیک کریں
azd show

# آپشن 4: Azure مانیٹر میں لاگز چیک کریں
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "توثیق ناکام" یا "ٹوکین کی میعاد ختم"</strong></summary>

```bash
# AZD کے لیے دوبارہ توثیق کریں
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
<summary><strong>❌ "وسائل پہلے سے موجود ہیں" یا ناموں میں تصادم</strong></summary>

```bash
# AZD منفرد نام بناتا ہے، لیکن اگر تضاد ہو:
azd down --force --purge

# پھر نئے ماحول کے ساتھ دوبارہ کوشش کریں
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ ٹیمپلیٹ کی تعیناتی بہت زیادہ وقت لے رہی ہے</strong></summary>

**معمول کے انتظار کے اوقات:**
- سادہ ویب ایپ: 5-10 منٹ
- ڈیٹابیس کے ساتھ ایپ: 10-15 منٹ
- AI ایپلیکیشنز: 15-25 منٹ (OpenAI کی فراہمی سست ہے)

```bash
# پیش رفت کی جانچ کریں
azd show

# اگر 30 منٹ سے زیادہ پھنس جائیں، تو Azure پورٹل چیک کریں:
azd monitor --overview
# ناکام تعیناتیوں کو تلاش کریں
```
</details>

<details>
<summary><strong>❌ "اجازت نامہ نہیں ملا" یا "ممنوع"</strong></summary>

```bash
# اپنا ایزور رول چیک کریں
az role assignment list --assignee $(az account show --query user.name -o tsv)

# آپ کو کم از کم "کنٹریبیوٹر" رول کی ضرورت ہے
# اپنے ایزور ایڈمن سے درخواست کریں کہ دینے کے لیے:
# - کنٹریبیوٹر (وسائل کے لیے)
# - یوزر ایکسس ایڈمنسٹریٹر (رول اسائنمنٹس کے لیے)
```
</details>

<details>
<summary><strong>❌ تعینات شدہ ایپلیکیشن URL نہیں مل رہا</strong></summary>

```bash
# تمام سروس اینڈپوائنٹس دکھائیں
azd show

# یا Azure پورٹل کھولیں
azd monitor

# مخصوص سروس چیک کریں
azd env get-values
# *_URL متغیرات تلاش کریں
```
</details>

### 📚 مکمل پریشانی حل کرنے کے وسائل

- **عام مسائل کا رہنما:** [تفصیلی حل](docs/chapter-07-troubleshooting/common-issues.md)
- **AI مخصوص مسائل:** [AI پریشانی حل](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **ڈی بگنگ گائیڈ:** [مرحلہ وار ڈی بگنگ](docs/chapter-07-troubleshooting/debugging.md)
- **مدد حاصل کریں:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 کورس مکمل کرنا اور سرٹیفیکیشن

### پیش رفت کا سراغ لگانا
اپنے سیکھنے کی پیش رفت ہر باب کے ذریعے ٹریک کریں:

- [ ] **باب 1**: بنیاد اور فوری آغاز ✅
- [ ] **باب 2**: AI-فرسٹ ڈیولپمنٹ ✅  
- [ ] **باب 3**: ترتیب اور تصدیق ✅
- [ ] **باب 4**: انفراسٹرکچر از کوڈ اور تعیناتی ✅
- [ ] **باب 5**: ملٹی ایجنٹ AI حل ✅
- [ ] **باب 6**: پری-تعیناتی توثیق اور منصوبہ بندی ✅
- [ ] **باب 7**: پریشانی حل اور ڈی بگنگ ✅
- [ ] **باب 8**: پیداواری اور انٹرپرائز نمونے ✅

### سیکھنے کی تصدیق
ہر باب مکمل کرنے کے بعد اپنی معلومات کی تصدیق کریں:
1. **عملی مشق**: باب کی ہینڈز آن تعیناتی مکمل کریں
2. **علمی جانچ**: اپنے باب کے FAQ سیکشن کا جائزہ لیں
3. **کمیونٹی بحث**: Azure Discord میں اپنا تجربہ شیئر کریں
4. **اگلا باب**: اگلے پیچیدگی کے درجے پر جائیں

### کورس مکمل کرنے کے فوائد
تمام ابواب مکمل کرنے کے بعد آپ کے پاس ہوگا:
- **پیداواری تجربہ**: حقیقی AI ایپلیکیشنز کو Azure پر تعینات کیا ہوا
- **پیشہ ورانہ مہارتیں**: انٹرپرائز کے لیے تیار تعیناتی کی صلاحیت  
- **کمیونٹی میں پہچان**: Azure ڈویلپر کمیونٹی کے سرگرم رکن
- **کریئر کی ترقی**: AZD اور AI تعیناتی کی مانگ میں مہارت

---

## 🤝 کمیونٹی اور سپورٹ

### مدد اور سپورٹ حاصل کریں
- **تکنیکی مسائل**: [بگ رپورٹ کریں اور فیچرز کی درخواست کریں](https://github.com/microsoft/azd-for-beginners/issues)
- **سیکھنے کے سوالات**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) اور [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI مخصوص مدد**: شامل ہوں [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **دستاویزات**: [سرکاری Azure Developer CLI دستاویزات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord سے کمیونٹی بصیرت

**#Azure چینل سے حالیہ پول کے نتائج:**
- **45%** ڈویلپرز AI ورک لوڈز کے لیے AZD استعمال کرنا چاہتے ہیں
- **بہترین چیلنجز**: ملٹی سروس تعیناتیاں، اسناد کا انتظام، پیداواری تیاری  
- **سب سے زیادہ درخواست کی گئی چیزیں**: AI مخصوص ٹیمپلیٹس، پریشانی حل کرنے کی گائیڈز، بہترین طریقے

**ہماری کمیونٹی میں شامل ہوں تاکہ:**
- اپنے AZD + AI تجربات شیئر کریں اور مدد حاصل کریں
- نئی AI ٹیمپلیٹس کے ابتدائی ورژنز تک رسائی حاصل کریں
- AI تعیناتی کے بہترین طریقوں میں تعاون کریں
- مستقبل کے AI + AZD فیچر کی ترقی متاثر کریں

### کورس میں تعاون
ہم تعاون خوش آمدید کہتے ہیں! براہِ کرم ہمارا [تعاون گائیڈ](CONTRIBUTING.md) پڑھیں جس میں شامل ہیں:
- **مواد کی بہتری**: موجودہ ابواب اور مثالوں کو بہتر بنائیں
- **نئی مثالیں**: حقیقی دنیا کے منظرنامے اور ٹیمپلیٹس شامل کریں  
- **ترجمہ**: کثیراللسانی معاونت برقرار رکھنے میں مدد کریں
- **بگ رپورٹس**: درستگی اور وضاحت بہتر کریں
- **کمیونٹی معیارات**: ہمارے جامع کمیونٹی قواعد و ضوابط کی پیروی کریں

---

## 📄 کورس کی معلومات

### لائسنس
یہ پروجیکٹ MIT لائسنس کے تحت لائسنس یافتہ ہے - تفصیلات کے لیے [LICENSE](../../LICENSE) فائل دیکھیں۔

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
 
### Generative AI سیریز
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![جنریٹو اے آئی (جاوا اسکرپٹ)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### بنیادی تعلیم
[![نو آموزوں کے لیے مشین لرننگ](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![نو آموزوں کے لیے ڈیٹا سائنس](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![نو آموزوں کے لیے اے آئی](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![نو آموزوں کے لیے سائبر سیکیورٹی](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![نو آموزوں کے لیے ویب ڈیولپمنٹ](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![نو آموزوں کے لیے آئی او ٹی](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![نو آموزوں کے لیے ایکس آر ڈویلپمنٹ](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### کوپائلٹ سیریز
[![اے آئی پیئرڈ پروگرامنگ کے لیے کوپائلٹ](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![سی شارپ/.NET کے لیے کوپائلٹ](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![کوپائلٹ ایڈونچر](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ کورس نیویگیشن

**🚀 سیکھنا شروع کرنے کے لیے تیار؟**

**نو آموز**: [باب 1: بنیاد اور تیز آغاز](#-chapter-1-foundation--quick-start) کے ساتھ شروع کریں  
**اے آئی ڈویلپرز**: [باب 2: اے آئی-فرسٹ ڈیولپمنٹ](#-chapter-2-ai-first-development-recommended-for-ai-developers) پر جائیں  
**تجربہ کار ڈویلپرز**: [باب 3: کنفیگریشن اور تصدیق](#️-chapter-3-configuration--authentication) سے شروع کریں

**اگلے مراحل**: [باب 1 - AZD بنیادی معلومات شروع کریں](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->