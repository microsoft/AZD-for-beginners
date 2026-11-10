# باب 2: AI-پہلا ترقی

**📚 کورس**: [نئے افراد کے لیے AZD](../../README.md) | **⏱️ دورانیہ**: ورکشاپ سمیت 4-5 گھنٹے | **⭐ پیچیدگی**: درمیانی

---

## جائزہ

یہ باب Azure Developer CLI اور Microsoft Foundry خدمات استعمال کرتے ہوئے AI سے چلنے والی ایپلی کیشنز کی تعیناتی پر مرکوز ہے۔ سادہ AI چیٹ ایپس سے لے کر ٹولز کے ساتھ ذہین ایجنٹس تک۔

> **ریلیز جائزہ (2026-11-04):** AI CLI رہنمائی کو شائع شدہ `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, اور `azure.ai.evaluations` `1.0.0-beta.2` دستاویزات/ماخذ کے خلاف چیک کیا گیا۔ مشترکہ ورک فلو کے لیے `azd >= 1.37.0` استعمال کریں۔ جائزے اب علیحدہ `azd ai eval` نیسپیس استعمال کرتے ہیں؛ دیکھیں [ریلیز تبدیلیاں اور ہجرت کی رہنمائی](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes)۔ یہ لائیو تعیناتی کی تصدیق نہیں ہے۔

## تعلیمی مقاصد

اس باب کو مکمل کر کے، آپ:
- پہلے سے تیار کردہ AZD ٹیمپلیٹس کے ذریعے AI ایپلی کیشنز کو تعینات کریں گے
- AZD کے ساتھ Microsoft Foundry انضمام کو سمجھیں گے
- ٹولز کے ساتھ AI ایجنٹس کو تشکیل دیں اور اپنی مرضی کے مطابق بنائیں گے
- RAG (ریٹریول-اگمینٹڈ جنریشن) ایپلی کیشنز کی تعیناتی کریں گے

---

## 📚 اسباق

| # | سبق | وضاحت | وقت |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry انضمام](microsoft-foundry-integration.md) | AZD کو Foundry خدمات سے جوڑیں | 30 منٹ |
| 2 | [AI ایجنٹس گائیڈ](agents.md) | ٹولز کے ساتھ ذہین ایجنٹس کی تعیناتی | 45 منٹ |
| 3 | [AI ماڈل کی تعیناتی](ai-model-deployment.md) | AI ماڈلز کو تعینات اور تشکیل دیں | 30 منٹ |
| 4 | [AI ورکشاپ لیب](ai-workshop-lab.md) | عملی کام: ایک ٹیمپلیٹ دریافت کریں اور اپنی تبدیلی کی منصوبہ بندی کریں | 2-3 گھنٹے |

---

## 🚀 فوری آغاز

نئے خالی ڈائریکٹری میں ایک آپشن منتخب کریں۔ ختم ہونے والا `.` موجودہ ڈائریکٹری کو شروع کرتا ہے؛ ورنہ AZD ایک ماتحت ڈائریکٹری بنا سکتا ہے بغیر آپ کے شیل کی ورکنگ ڈائریکٹری کو بدلے۔

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
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

## 💰 لاگت کا شعور

یہ صرف تخمینی حدیں ہیں، مکمل قیمتیں یا حدود نہیں؛ ماڈل ٹریفک، سرچ/کمپیوٹ SKUs، علاقے، اور اضافی خصوصیات ان سے تجاوز کر سکتی ہیں۔ مہیا کرنے سے پہلے منتخب کردہ نمونے کی موجودہ قیمت کی رہنمائی کا جائزہ لیں۔

| ماحول | تخمینی ماہانہ لاگت |
|-------------|----------------------|
| ترقیاتی | $80-150 |
| اسٹیجنگ | $150-300 |
| پیداوار | $300-3,500+ |

**مشورہ:** چارجز سے بچنے کے لیے آزمائش کے بعد `azd down` چلائیں۔

---

## 🔗 نیویگیشن

| سمت | باب |
|-----------|---------|
| **پچھلا** | [باب 1: بنیاد](../chapter-01-foundation/README.md) |
| **اگلا** | [باب 3: ترتیب](../chapter-03-configuration/README.md) |
| **چھلانگ لگائیں** | [باب 8: پیداوار کے نمونے](../chapter-08-production/README.md) |

---

## 📖 متعلقہ وسائل

- [AI مسائل کا حل](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [پیداواری AI طریقہ کار](../chapter-08-production/production-ai-practices.md)
- [ایپلیکیشن انسائٹس](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->