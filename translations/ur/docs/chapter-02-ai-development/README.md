# باب 2: AI-فرسٹ ڈیولپمنٹ

**📚 کورس**: [AZD ابتدائی افراد کے لیے](../../README.md) | **⏱️ دورانیہ**: 1-2 گھنٹے | **⭐ پیچیدگی**: درمیانی

---

## جائزہ

یہ باب Azure Developer CLI اور Microsoft Foundry خدمات کا استعمال کرتے ہوئے AI سے چلنے والی ایپلیکیشنز کی تعیناتی پر مرکوز ہے۔ سادہ AI چیٹ ایپس سے لے کر ٹولز کے ساتھ ذہین ایجنٹس تک۔

> **تصدیقی نوٹ (2026-06-15):** اس باب میں کمانڈ فلو اور ایکسٹینشن کی رہنمائی کو `azd` `1.25.6` اور موجودہ پری ویو AI ایجنٹ ایکسٹینشن ریلیز `azure.ai.agents` `0.1.40-preview` کے خلاف جانچا گیا ہے۔ اگر آپ پرانے AZD ورژن پر ہیں، پہلے اپڈیٹ کریں اور پھر مشقوں کے ساتھ آگے بڑھیں۔

## سیکھنے کے مقاصد

اس باب کو مکمل کرنے کے بعد، آپ:
- پہلے سے بنے ہوئے AZD ٹیمپلیٹس کا استعمال کرتے ہوئے AI ایپلیکیشنز تعینات کریں گے
- Microsoft Foundry کے AZD کے ساتھ انضمام کو سمجھیں گے
- ٹولز کے ساتھ AI ایجنٹس کو کنفیگر اور حسب ضرورت بنائیں گے
- RAG (ریٹریول-آگمینٹڈ جنریشن) ایپلیکیشنز تعینات کریں گے

---

## 📚 اسباق

| # | سبق | وضاحت | وقت |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry انضمام](microsoft-foundry-integration.md) | AZD کو Foundry خدمات سے جوڑنا | 30 منٹ |
| 2 | [AI ایجنٹس گائیڈ](agents.md) | ٹولز کے ساتھ ذہین ایجنٹس تعینات کریں | 45 منٹ |
| 3 | [AI ماڈل کی تعیناتی](ai-model-deployment.md) | AI ماڈلز کو تعینات اور کنفیگر کریں | 30 منٹ |
| 4 | [AI ورکشاپ لیب](ai-workshop-lab.md) | عملی تجربہ: اپنی AI حل کو AZD کے لیے تیار کریں | 60 منٹ |

---

## 🚀 جلد آغاز

```bash
# آپشن 1: RAG چیٹ ایپلیکیشن
azd init --template azure-search-openai-demo
azd up

# آپشن 2: AI ایجنٹس
azd init --template get-started-with-ai-agents
azd up

# آپشن 3: فوری چیٹ ایپ
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 منتخب AI ٹیمپلیٹس

| ٹیمپلیٹ | وضاحت | خدمات |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | حوالہ جات کے ساتھ RAG چیٹ | OpenAI + AI سرچ |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ٹولز کے ساتھ AI ایجنٹ | AI ایجنٹ سروس |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | بنیادی AI چیٹ | OpenAI + کنٹینر ایپس |

---

## 💰 لاگت کی آگاہی

| ماحول | متوقع ماہانہ لاگت |
|-------------|----------------------|
| ڈیولپمنٹ | $80-150 |
| اسٹیجنگ | $150-300 |
| پروڈکشن | $300-3,500+ |

**ٹپ:** چارجز سے بچنے کے لیے ٹیسٹنگ کے بعد `azd down` چلائیں۔

---

## 🔗 نیویگیشن

| سمت | باب |
|-----------|---------|
| **پچھلا** | [باب 1: بنیاد](../chapter-01-foundation/README.md) |
| **اگلا** | [باب 3: کنفیگریشن](../chapter-03-configuration/README.md) |
| **چھلانگ لگائیں** | [باب 8: پروڈکشن پیٹرنز](../chapter-08-production/README.md) |

---

## 📖 متعلقہ وسائل

- [AI دشواریوں کا حل](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [پروڈکشن AI طریقے](../chapter-08-production/production-ai-practices.md)
- [ایپلیکیشن انسائٹس](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->