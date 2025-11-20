<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fc2d5d2f2f572c99876be92d82680e22",
  "translation_date": "2025-11-20T10:20:17+00:00",
  "source_file": "examples/azure-openai-chat/README.md",
  "language_code": "ar"
}
-->
# تطبيق دردشة Azure OpenAI

**مسار التعلم:** متوسط ⭐⭐ | **الوقت:** 35-45 دقيقة | **التكلفة:** $50-200/شهريًا

تطبيق دردشة كامل باستخدام Azure OpenAI يتم نشره باستخدام Azure Developer CLI (azd). يوضح هذا المثال نشر GPT-4، الوصول الآمن إلى واجهة برمجة التطبيقات، وواجهة دردشة بسيطة.

## 🎯 ما ستتعلمه

- نشر خدمة Azure OpenAI مع نموذج GPT-4  
- تأمين مفاتيح واجهة برمجة التطبيقات باستخدام Key Vault  
- بناء واجهة دردشة بسيطة باستخدام Python  
- مراقبة استخدام الرموز والتكاليف  
- تنفيذ تحديد المعدل ومعالجة الأخطاء  

## 📦 ما يتضمنه

✅ **خدمة Azure OpenAI** - نشر نموذج GPT-4  
✅ **تطبيق دردشة Python** - واجهة دردشة بسيطة عبر سطر الأوامر  
✅ **تكامل Key Vault** - تخزين آمن لمفاتيح واجهة برمجة التطبيقات  
✅ **قوالب ARM** - بنية تحتية كاملة كرمز  
✅ **مراقبة التكاليف** - تتبع استخدام الرموز  
✅ **تحديد المعدل** - منع استنفاد الحصة  

## الهيكلية

```
┌─────────────────────────────────────────────┐
│   Python Chat Application (Local/Cloud)    │
│   - Command-line interface                 │
│   - Conversation history                   │
│   - Token usage tracking                   │
└──────────────────┬──────────────────────────┘
                   │ HTTPS (API Key)
                   ▼
┌─────────────────────────────────────────────┐
│   Azure OpenAI Service                      │
│   ┌───────────────────────────────────────┐ │
│   │   GPT-4 Model                         │ │
│   │   - 20K tokens/min capacity           │ │
│   │   - Multi-region failover (optional)  │ │
│   └───────────────────────────────────────┘ │
│                                             │
│   Managed Identity ───────────────────────┐ │
└────────────────────────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│   Azure Key Vault                           │
│   - OpenAI API Key (secret)                 │
│   - Endpoint URL (secret)                   │
└─────────────────────────────────────────────┘
```

## المتطلبات

### المطلوب

- **Azure Developer CLI (azd)** - [دليل التثبيت](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- **اشتراك Azure** مع الوصول إلى OpenAI - [طلب الوصول](https://aka.ms/oai/access)  
- **Python 3.9+** - [تثبيت Python](https://www.python.org/downloads/)  

### التحقق من المتطلبات

```bash
# تحقق من إصدار azd (يحتاج إلى 1.5.0 أو أعلى)
azd version

# تحقق من تسجيل الدخول إلى Azure
azd auth login

# تحقق من إصدار Python
python --version  # أو python3 --version

# تحقق من الوصول إلى OpenAI (تحقق في بوابة Azure)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ مهم:** تتطلب Azure OpenAI موافقة على التطبيق. إذا لم تقم بالتقديم، قم بزيارة [aka.ms/oai/access](https://aka.ms/oai/access). عادةً ما تستغرق الموافقة 1-2 يوم عمل.

## ⏱️ الجدول الزمني للنشر

| المرحلة | المدة | ما يحدث |
|---------|-------|---------|
| التحقق من المتطلبات | 2-3 دقائق | التحقق من توفر حصة OpenAI |
| نشر البنية التحتية | 8-12 دقيقة | إنشاء OpenAI، Key Vault، نشر النموذج |
| إعداد التطبيق | 2-3 دقائق | إعداد البيئة والاعتماديات |
| **الإجمالي** | **12-18 دقيقة** | جاهز للدردشة مع GPT-4 |

**ملاحظة:** قد يستغرق نشر OpenAI لأول مرة وقتًا أطول بسبب تجهيز النموذج.

## البدء السريع

```bash
# انتقل إلى المثال
cd examples/azure-openai-chat

# تهيئة البيئة
azd env new myopenai

# نشر كل شيء (البنية التحتية + التكوين)
azd up
# سيتم مطالبتك بـ:
# 1. اختيار اشتراك Azure
# 2. اختيار الموقع مع توفر OpenAI (مثل، eastus، eastus2، westus)
# 3. الانتظار لمدة 12-18 دقيقة للنشر

# تثبيت تبعيات Python
pip install -r requirements.txt

# ابدأ الدردشة!
python chat.py
```

**الناتج المتوقع:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ التحقق من النشر

### الخطوة 1: التحقق من موارد Azure

```bash
# عرض الموارد المنشورة
azd show

# يُظهر الإخراج المتوقع:
# - خدمة OpenAI: (اسم المورد)
# - Key Vault: (اسم المورد)
# - النشر: gpt-4
# - الموقع: eastus (أو المنطقة التي اخترتها)
```

### الخطوة 2: اختبار واجهة برمجة تطبيقات OpenAI

```bash
# احصل على نقطة نهاية OpenAI والمفتاح
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# اختبار استدعاء API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**الاستجابة المتوقعة:**
```json
{
  "choices": [
    {
      "message": {
        "role": "assistant",
        "content": "Hello! How can I assist you today?"
      }
    }
  ],
  "usage": {
    "prompt_tokens": 8,
    "completion_tokens": 9,
    "total_tokens": 17
  }
}
```

### الخطوة 3: التحقق من الوصول إلى Key Vault

```bash
# سرد الأسرار في Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**الأسرار المتوقعة:**
- `openai-api-key`  
- `openai-endpoint`  

**معايير النجاح:**
- ✅ تم نشر خدمة OpenAI مع GPT-4  
- ✅ استدعاء واجهة برمجة التطبيقات يعيد استكمالًا صالحًا  
- ✅ تم تخزين الأسرار في Key Vault  
- ✅ تتبع استخدام الرموز يعمل  

## هيكل المشروع

```
azure-openai-chat/
├── README.md                   ✅ This guide
├── azure.yaml                  ✅ AZD configuration
├── infra/                      ✅ Infrastructure as Code
│   ├── main.bicep             ✅ Main Bicep template
│   ├── main.parameters.json   ✅ Parameters
│   └── openai.bicep           ✅ OpenAI resource definition
├── src/                        ✅ Application code
│   ├── chat.py                ✅ Chat interface
│   ├── config.py              ✅ Configuration loader
│   └── requirements.txt       ✅ Python dependencies
└── .gitignore                  ✅ Git ignore rules
```

## ميزات التطبيق

### واجهة الدردشة (`chat.py`)

يتضمن تطبيق الدردشة:

- **تاريخ المحادثة** - يحافظ على السياق عبر الرسائل  
- **عد الرموز** - يتتبع الاستخدام ويقدر التكاليف  
- **معالجة الأخطاء** - معالجة سلسة لتحديد المعدل وأخطاء واجهة برمجة التطبيقات  
- **تقدير التكاليف** - حساب التكلفة في الوقت الفعلي لكل رسالة  
- **دعم البث** - استجابات بث اختيارية  

### الأوامر

أثناء الدردشة، يمكنك استخدام:  
- `quit` أو `exit` - إنهاء الجلسة  
- `clear` - مسح تاريخ المحادثة  
- `tokens` - عرض إجمالي استخدام الرموز  
- `cost` - عرض التكلفة الإجمالية المقدرة  

### التكوين (`config.py`)

يقوم بتحميل التكوين من متغيرات البيئة:  
```python
AZURE_OPENAI_ENDPOINT  # من Key Vault
AZURE_OPENAI_API_KEY   # من Key Vault
AZURE_OPENAI_MODEL     # الافتراضي: gpt-4
AZURE_OPENAI_MAX_TOKENS # الافتراضي: 800
```

## أمثلة الاستخدام

### دردشة أساسية

```bash
python chat.py
```

### دردشة مع نموذج مخصص

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### دردشة مع البث

```bash
python chat.py --stream
```

### مثال على محادثة

```
You: Explain Azure OpenAI Service in 3 sentences.
Assistant: Azure OpenAI Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like GPT-4 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Azure OpenAI Service offers several model families including GPT-4 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## إدارة التكاليف

### تسعير الرموز (GPT-4)

| النموذج | الإدخال (لكل 1K رمز) | الإخراج (لكل 1K رمز) |
|---------|----------------------|----------------------|
| GPT-4   | $0.03               | $0.06               |
| GPT-3.5-Turbo | $0.0015       | $0.002             |

### التكاليف الشهرية المقدرة

بناءً على أنماط الاستخدام:

| مستوى الاستخدام | الرسائل/اليوم | الرموز/اليوم | التكلفة الشهرية |
|------------------|---------------|--------------|-----------------|
| **خفيف**        | 20 رسالة      | 3,000 رمز    | $3-5           |
| **متوسط**       | 100 رسالة     | 15,000 رمز   | $15-25         |
| **ثقيل**        | 500 رسالة     | 75,000 رمز   | $75-125        |

**تكلفة البنية التحتية الأساسية:** $1-2/شهريًا (Key Vault + حساب بسيط)

### نصائح لتقليل التكاليف

```bash
# ١. استخدم GPT-3.5-Turbo للمهام البسيطة (أرخص بـ 20 مرة)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# ٢. قلل الحد الأقصى للرموز للحصول على ردود أقصر
export AZURE_OPENAI_MAX_TOKENS=400

# ٣. راقب استخدام الرموز
python chat.py --show-tokens

# ٤. قم بإعداد تنبيهات الميزانية
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## المراقبة

### عرض استخدام الرموز

```bash
# في بوابة Azure:
# مورد OpenAI → المقاييس → اختر "معاملة الرموز"

# أو عبر Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### عرض سجلات واجهة برمجة التطبيقات

```bash
# تدفق سجلات التشخيص
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# استعلام السجلات
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## استكشاف الأخطاء وإصلاحها

### المشكلة: خطأ "Access Denied"

**الأعراض:** 403 Forbidden عند استدعاء واجهة برمجة التطبيقات  

**الحلول:**  
```bash
# 1. تحقق من الموافقة على الوصول إلى OpenAI
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. تحقق من صحة مفتاح API
azd env get-value AZURE_OPENAI_API_KEY

# 3. تحقق من تنسيق عنوان URL للنقطة النهائية
azd env get-value AZURE_OPENAI_ENDPOINT
# يجب أن يكون: https://[name].openai.azure.com/
```

### المشكلة: تجاوز حد المعدل

**الأعراض:** 429 Too Many Requests  

**الحلول:**  
```bash
# 1. تحقق من الحصة الحالية
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. طلب زيادة الحصة (إذا لزم الأمر)
# انتقل إلى بوابة Azure → مورد OpenAI → الحصص → طلب زيادة

# 3. تنفيذ منطق إعادة المحاولة (موجود بالفعل في chat.py)
# التطبيق يعيد المحاولة تلقائيًا مع تراجع أسي
```

### المشكلة: "Model Not Found"

**الأعراض:** خطأ 404 للنشر  

**الحلول:**  
```bash
# ١. قم بسرد عمليات النشر المتاحة
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# ٢. تحقق من اسم النموذج في البيئة
echo $AZURE_OPENAI_MODEL

# ٣. قم بالتحديث إلى اسم النشر الصحيح
export AZURE_OPENAI_MODEL=gpt-4  # أو gpt-35-turbo
```

### المشكلة: زمن استجابة مرتفع

**الأعراض:** أوقات استجابة بطيئة (>5 ثوانٍ)  

**الحلول:**  
```bash
# ١. تحقق من زمن الوصول الإقليمي
# النشر في المنطقة الأقرب للمستخدمين

# ٢. تقليل max_tokens للحصول على استجابات أسرع
export AZURE_OPENAI_MAX_TOKENS=400

# ٣. استخدام البث لتحسين تجربة المستخدم
python chat.py --stream
```

## أفضل ممارسات الأمان

### 1. حماية مفاتيح واجهة برمجة التطبيقات

```bash
# لا تقم أبدًا بتضمين المفاتيح في التحكم بالمصدر
# استخدم Key Vault (تم تكوينه بالفعل)

# قم بتدوير المفاتيح بانتظام
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. تنفيذ تصفية المحتوى

```python
# يتضمن Azure OpenAI تصفية محتوى مدمجة
# قم بالتكوين في بوابة Azure:
# مورد OpenAI → فلاتر المحتوى → إنشاء فلتر مخصص

# الفئات: الكراهية، الجنس، العنف، إيذاء النفس
# المستويات: تصفية منخفضة، متوسطة، عالية
```

### 3. استخدام الهوية المُدارة (الإنتاج)

```bash
# لاستخدامات الإنتاج، استخدم الهوية المُدارة
# بدلاً من مفاتيح API (يتطلب استضافة التطبيق على Azure)

# قم بتحديث infra/openai.bicep لتتضمن:
# الهوية: { النوع: 'SystemAssigned' }
```

## التطوير

### التشغيل محليًا

```bash
# تثبيت التبعيات
pip install -r src/requirements.txt

# تعيين متغيرات البيئة
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# تشغيل التطبيق
python src/chat.py
```

### تشغيل الاختبارات

```bash
# تثبيت تبعيات الاختبار
pip install pytest pytest-cov

# تشغيل الاختبارات
pytest tests/ -v

# مع التغطية
pytest tests/ --cov=src --cov-report=html
```

### تحديث نشر النموذج

```bash
# نشر إصدار مختلف من النموذج
az cognitiveservices account deployment create \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-35-turbo \
  --model-name gpt-35-turbo \
  --model-version "0613" \
  --model-format OpenAI \
  --sku-capacity 20 \
  --sku-name "Standard"
```

## التنظيف

```bash
# حذف جميع موارد Azure
azd down --force --purge

# هذا يزيل:
# - خدمة OpenAI
# - Key Vault (مع حذف ناعم لمدة 90 يومًا)
# - مجموعة الموارد
# - جميع عمليات النشر والتكوينات
```

## الخطوات التالية

### توسيع هذا المثال

1. **إضافة واجهة ويب** - بناء واجهة أمامية باستخدام React/Vue  
   ```bash
   # إضافة خدمة الواجهة الأمامية إلى azure.yaml
   # النشر إلى تطبيقات الويب الثابتة في Azure
   ```

2. **تنفيذ RAG** - إضافة بحث عن المستندات باستخدام Azure AI Search  
   ```python
   # دمج Azure Cognitive Search
   # تحميل المستندات وإنشاء فهرس متجه
   ```

3. **إضافة استدعاء الوظائف** - تمكين استخدام الأدوات  
   ```python
   # تعريف الدوال في chat.py
   # السماح لـ GPT-4 باستدعاء واجهات برمجة التطبيقات الخارجية
   ```

4. **دعم نماذج متعددة** - نشر نماذج متعددة  
   ```bash
   # إضافة gpt-35-turbo، نماذج التضمين
   # تنفيذ منطق توجيه النموذج
   ```

### أمثلة ذات صلة

- **[Retail Multi-Agent](../retail-scenario.md)** - هيكلية متعددة الوكلاء متقدمة  
- **[Database App](../../../../examples/database-app)** - إضافة تخزين دائم  
- **[Container Apps](../../../../examples/container-app)** - نشر كخدمة مكونة  

### موارد التعلم

- 📚 [دورة AZD للمبتدئين](../../README.md) - الصفحة الرئيسية للدورة  
- 📚 [وثائق Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/) - الوثائق الرسمية  
- 📚 [مرجع واجهة برمجة تطبيقات OpenAI](https://platform.openai.com/docs/api-reference) - تفاصيل واجهة برمجة التطبيقات  
- 📚 [الذكاء الاصطناعي المسؤول](https://www.microsoft.com/ai/responsible-ai) - أفضل الممارسات  

## موارد إضافية

### الوثائق
- **[خدمة Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/)** - دليل كامل  
- **[نماذج GPT-4](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - قدرات النموذج  
- **[تصفية المحتوى](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - ميزات الأمان  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - مرجع azd  

### الدروس
- **[البدء السريع مع OpenAI](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - أول نشر  
- **[إكمالات الدردشة](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - بناء تطبيقات الدردشة  
- **[استدعاء الوظائف](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - ميزات متقدمة  

### الأدوات
- **[Azure OpenAI Studio](https://oai.azure.com/)** - ملعب ويب  
- **[دليل هندسة المطالبات](https://platform.openai.com/docs/guides/prompt-engineering)** - كتابة مطالبات أفضل  
- **[حاسبة الرموز](https://platform.openai.com/tokenizer)** - تقدير استخدام الرموز  

### المجتمع
- **[Discord Azure AI](https://discord.gg/azure)** - الحصول على المساعدة من المجتمع  
- **[مناقشات GitHub](https://github.com/Azure-Samples/openai/discussions)** - منتدى الأسئلة والأجوبة  
- **[مدونة Azure](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - أحدث التحديثات  

---

**🎉 نجاح!** لقد قمت بنشر Azure OpenAI وبناء تطبيق دردشة يعمل. ابدأ في استكشاف قدرات GPT-4 وجرب مطالبات وحالات استخدام مختلفة.

**أسئلة؟** [افتح قضية](https://github.com/microsoft/AZD-for-beginners/issues) أو تحقق من [الأسئلة الشائعة](../../resources/faq.md)

**تنبيه التكلفة:** تذكر تشغيل `azd down` عند الانتهاء من الاختبار لتجنب التكاليف المستمرة (~$50-100/شهريًا للاستخدام النشط).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الموثوق. للحصول على معلومات حاسمة، يُوصى بالترجمة البشرية الاحترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة ناتجة عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->