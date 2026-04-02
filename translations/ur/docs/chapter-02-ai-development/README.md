# باب 2: AI-پہلا ترقی

**📚 کورس**: [AZD ابتدائیوں کے لیے](../../README.md) | **⏱️ دورانیہ**: 1-2 گھنٹے | **⭐ پیچیدگی**: متوسط

---

## جائزہ

یہ باب Azure Developer CLI اور Microsoft Foundry خدمات کا استعمال کرتے ہوئے AI سے چلنے والی ایپلیکیشنز کی تعیناتی پر مرکوز ہے۔ سادہ AI چیٹ ایپس سے لے کر ٹولز کے ساتھ ذہین ایجنٹس تک۔

> **تصدیقی نوٹ (2026-03-25):** اس باب میں کمانڈ فلو اور توسیعی رہنمائی کا جائزہ `azd` `1.23.12` اور موجودہ پریویو AI ایجنٹ ایکسٹینشن ریلیز `azure.ai.agents` `0.1.18-preview` کے تحت لیا گیا ہے۔ اگر آپ کے پاس پرانا AZD ورژن ہے تو پہلے اپ ڈیٹ کریں اور پھر مشقوں کو جاری رکھیں۔

## تعلیمی مقاصد

اس باب کو مکمل کرکے، آپ:
- پہلے سے تیار شدہ AZD ٹیمپلیٹس کا استعمال کرتے ہوئے AI ایپلیکیشنز تعینات کریں گے
- Microsoft Foundry کی AZD کے ساتھ انضمام کو سمجھیں گے
- ٹولز کے ساتھ AI ایجنٹس کو ترتیب اور حسب ضرورت بنائیں گے
- RAG (Retrieval-Augmented Generation) ایپلیکیشنز تعینات کریں گے

---

## 📚 اسباق

| # | سبق | وضاحت | وقت |
|---|------|---------|------|
| 1 | [Microsoft Foundry انضمام](microsoft-foundry-integration.md) | AZD کو Foundry خدمات سے منسلک کریں | 30 منٹ |
| 2 | [AI ایجنٹس کی رہنمائی](agents.md) | ٹولز کے ساتھ ذہین ایجنٹس تعینات کریں | 45 منٹ |
| 3 | [AI ماڈل کی تعیناتی](ai-model-deployment.md) | AI ماڈلز کو تعینات اور ترتیب دیں | 30 منٹ |
| 4 | [AI ورکشاپ لیب](ai-workshop-lab.md) | عملی: اپنا AI حل AZD کے لیے تیار کریں | 60 منٹ |

---

## 🚀 فوری آغاز

```bash
# اختیار 1: RAG چیٹ ایپلیکیشن
azd init --template azure-search-openai-demo
azd up

# اختیار 2: AI ایجنٹس
azd init --template get-started-with-ai-agents
azd up

# اختیار 3: فوری چیٹ ایپ
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 نمایاں AI ٹیمپلیٹس

| ٹیمپلیٹ | وضاحت | خدمات |
|----------|---------|--------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | حوالوں کے ساتھ RAG چیٹ | OpenAI + AI سرچ |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ٹولز کے ساتھ AI ایجنٹ | AI ایجنٹ سروس |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | بنیادی AI چیٹ | OpenAI + کنٹینر ایپس |

---

## 💰 لاگت کا ادراک

| ماحول | تخمینہ ماہانہ لاگت |
|-------------|----------------------|
| ترقیاتی | $80-150 |
| مرحلہ وار | $150-300 |
| پیداوار | $300-3,500+ |

**اشارہ:** چارجز سے بچنے کے لیے ٹیسٹنگ کے بعد `azd down` چلائیں۔

---

## 🔗 نیویگیشن

| سمت | باب |
|-----------|---------|
| **پچھلا** | [باب 1: بنیاد](../chapter-01-foundation/README.md) |
| **اگلا** | [باب 3: تشکیل](../chapter-03-configuration/README.md) |
| **چھلانگ لگائیں** | [باب 8: پیداوار کے نمونے](../chapter-08-production/README.md) |

---

## 📖 متعلقہ وسائل

- [AI مسائل کا حل](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [پیداوار AI طریقے](../chapter-08-production/production-ai-practices.md)
- [ایپلیکیشن انسائٹس](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنبیہ**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشش کرتے ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم صحت ہو سکتی ہے۔ اصل دستاویز اپنی مادری زبان میں معتبر ماخذ سمجھا جانا چاہیے۔ اہم معلومات کے لیے پیشہ ورانہ انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تفسیر کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->