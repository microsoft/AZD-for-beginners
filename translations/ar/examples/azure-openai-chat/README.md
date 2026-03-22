# تطبيق دردشة Microsoft Foundry Models

**مسار التعلم:** متوسط ⭐⭐ | **الوقت:** 35-45 دقيقة | **التكلفة:** $50-200/month

تطبيق دردشة كامل لـ Microsoft Foundry Models تم نشره باستخدام Azure Developer CLI (azd). يوضح هذا المثال نشر gpt-4.1، والوصول الآمن إلى API، وواجهة دردشة بسيطة.

## 🎯 ما ستتعلمه

- نشر خدمة Microsoft Foundry Models باستخدام نموذج gpt-4.1
- تأمين مفاتيح OpenAI API باستخدام Key Vault
- بناء واجهة دردشة بسيطة باستخدام Python
- مراقبة استخدام التوكنات والتكاليف
- تنفيذ تحديد المعدل ومعالجة الأخطاء

## 📦 ما الذي يتضمنه

✅ **خدمة Microsoft Foundry Models** - نشر نموذج gpt-4.1  
✅ **تطبيق دردشة Python** - واجهة دردشة بسيطة لسطر الأوامر  
✅ **تكامل Key Vault** - تخزين آمن لمفاتيح API  
✅ **قوالب ARM** - بنية تحتية كاملة ككود  
✅ **مراقبة التكاليف** - تتبع استخدام التوكنات  
✅ **تحديد المعدل** - منع استنفاد الحصة  

## Architecture

```mermaid
graph TD
    App[تطبيق دردشة بايثون<br/>محلي/سحابي<br/>واجهة سطر الأوامر<br/>سجل المحادثات<br/>تتبع استخدام التوكنات] -- "HTTPS (مفتاح API)" --> Foundry[خدمة نماذج Microsoft Foundry<br/>نموذج gpt-4.1<br/>سعة 20 ألف توكن/دقيقة<br/>التبديل عند الفشل عبر مناطق متعددة]
    Foundry --> KV[خزنة مفاتيح Azure<br/>مفتاح API الخاص بـ OpenAI<br/>عنوان URL لنقطة النهاية]
    Foundry -. الهوية المُدارة .-> KV
```
## المتطلبات المسبقة

### مطلوب

- **Azure Developer CLI (azd)** - [دليل التثبيت](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **اشتراك Azure** مع وصول OpenAI - [Request access](https://aka.ms/oai/access)
- **Python 3.9+** - [Install Python](https://www.python.org/downloads/)

### التحقق من المتطلبات المسبقة

```bash
# تحقق من إصدار azd (يجب أن يكون 1.5.0 أو أعلى)
azd version

# تحقق من تسجيل الدخول إلى Azure
azd auth login

# تحقق من إصدار Python
python --version  # أو python3 --version

# تحقق من إمكانية الوصول إلى OpenAI (افحص ذلك في بوابة Azure)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ مهم:** تتطلب Microsoft Foundry Models موافقة على التطبيق. إذا لم تقم بالتقديم، قم بزيارة [aka.ms/oai/access](https://aka.ms/oai/access). عادةً ما تستغرق الموافقة يومًا إلى يومي عمل.

## ⏱️ الجدول الزمني للنشر

| المرحلة | المدة | ما يحدث |
|-------|----------|--------------|
| فحص المتطلبات المسبقة | 2-3 minutes | التحقق من توفر حصة OpenAI |
| نشر البنية التحتية | 8-12 minutes | Create OpenAI, Key Vault, model deployment |
| تكوين التطبيق | 2-3 minutes | إعداد البيئة والتبعيات |
| **الإجمالي** | **12-18 minutes** | جاهز للدردشة مع gpt-4.1 |

**ملاحظة:** قد يستغرق نشر OpenAI لأول مرة وقتًا أطول بسبب توفير النموذج.

## بداية سريعة

```bash
# انتقل إلى المثال
cd examples/azure-openai-chat

# هيئ البيئة
azd env new myopenai

# انشر كل شيء (البنية التحتية + التكوين)
azd up
# سيُطلب منك:
# 1. اختر اشتراك Azure
# 2. اختر موقعًا تتوفر فيه خدمة OpenAI (مثل: eastus, eastus2, westus)
# 3. انتظر 12-18 دقيقة لإتمام النشر

# ثبّت تبعيات Python
pip install -r requirements.txt

# ابدأ الدردشة!
python chat.py
```

**المخرجات المتوقعة:**
```
🤖 Microsoft Foundry Models Chat Application
Connected to: gpt-4.1 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Microsoft Foundry Models.
Assistant: Microsoft Foundry Models Service provides REST API access to OpenAI's powerful language models including gpt-4.1, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ التحقق من النشر

### الخطوة 1: التحقق من موارد Azure

```bash
# عرض الموارد المنشورة
azd show

# الناتج المتوقع يظهر:
# - خدمة OpenAI: (اسم المورد)
# - خزنة المفاتيح: (اسم المورد)
# - النشر: gpt-4.1
# - الموقع: eastus (أو المنطقة التي اخترتها)
```

### الخطوة 2: اختبار OpenAI API

```bash
# الحصول على نقطة نهاية OpenAI والمفتاح
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# اختبار استدعاء واجهة برمجة التطبيقات
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4.1/chat/completions?api-version=2024-08-01-preview" \
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

### الخطوة 3: التحقق من وصول Key Vault

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
- ✅ تم نشر خدمة OpenAI بنموذج gpt-4.1
- ✅ تُرجع مكالمة API استجابة صالحة
- ✅ تم تخزين الأسرار في Key Vault
- ✅ يعمل تتبع استخدام التوكنات

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

- **سجل المحادثة** - يحافظ على السياق عبر الرسائل
- **عدّ التوكنات** - يتتبع الاستخدام ويقدّر التكاليف
- **معالجة الأخطاء** - تعامل أنيق مع حدود المعدل وأخطاء API
- **تقدير التكلفة** - حساب التكلفة في الوقت الحقيقي لكل رسالة
- **دعم البث** - استجابات بث اختيارية

### الأوامر

أثناء الدردشة، يمكنك استخدام:
- `quit` أو `exit` - إنهاء الجلسة
- `clear` - مسح سجل المحادثة
- `tokens` - عرض إجمالي استخدام التوكنات
- `cost` - عرض التكلفة التقديرية الإجمالية

### الإعداد (`config.py`)

يحمل الإعدادات من متغيرات البيئة:
```python
AZURE_OPENAI_ENDPOINT  # من مخزن المفاتيح
AZURE_OPENAI_API_KEY   # من مخزن المفاتيح
AZURE_OPENAI_MODEL     # الافتراضي: gpt-4.1
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
You: Explain Microsoft Foundry Models Service in 3 sentences.
Assistant: Microsoft Foundry Models Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like gpt-4.1 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Microsoft Foundry Models Service offers several model families including gpt-4.1 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## إدارة التكاليف

### تسعير التوكنات (gpt-4.1)

| النموذج | الإدخال (لكل 1K tokens) | المخرجات (لكل 1K tokens) |
|-------|----------------------|------------------------|
| gpt-4.1 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### التكاليف الشهرية المقدرة

بناءً على أنماط الاستخدام:

| مستوى الاستخدام | الرسائل/اليوم | التوكنات/اليوم | التكلفة الشهرية |
|-------------|--------------|------------|--------------|
| **خفيف** | 20 messages | 3,000 tokens | $3-5 |
| **متوسط** | 100 messages | 15,000 tokens | $15-25 |
| **عالي** | 500 messages | 75,000 tokens | $75-125 |

**تكلفة البنية التحتية الأساسية:** $1-2/month (Key Vault + minimal compute)

### نصائح تحسين التكلفة

```bash
# 1. استخدم GPT-3.5-Turbo للمهام الأبسط (أرخص 20 مرة)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. قلل الحد الأقصى لعدد التوكنات للحصول على ردود أقصر
export AZURE_OPENAI_MAX_TOKENS=400

# 3. راقب استخدام التوكنات
python chat.py --show-tokens

# 4. قم بإعداد تنبيهات الميزانية
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## المراقبة

### عرض استخدام التوكنات

```bash
# في بوابة Azure:
# مورد OpenAI → المقاييس → اختر "معاملة الرمز"

# أو عبر Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### عرض سجلات API

```bash
# بث سجلات التشخيص
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# سجلات الاستعلام
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## استكشاف الأخطاء وإصلاحها

### المشكلة: "Access Denied" Error

**الأعراض:** 403 Forbidden when calling API

**الحلول:**
```bash
# 1. تحقق من أن الوصول إلى OpenAI موافق عليه
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. تحقق من أن مفتاح API صحيح
azd env get-value AZURE_OPENAI_API_KEY

# 3. تحقق من صيغة عنوان URL لنقطة النهاية
azd env get-value AZURE_OPENAI_ENDPOINT
# يجب أن يكون: https://[name].openai.azure.com/
```

### المشكلة: "Rate Limit Exceeded"

**الأعراض:** 429 Too Many Requests

**الحلول:**
```bash
# 1. التحقق من الحصة الحالية
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4.1

# 2. طلب زيادة الحصة (إذا لزم الأمر)
# اذهب إلى بوابة Azure → مورد OpenAI → الحصص → طلب زيادة

# 3. تنفيذ منطق إعادة المحاولة (موجود بالفعل في chat.py)
# يقوم التطبيق بإعادة المحاولة تلقائيًا مع تزايد فترات الانتظار بشكل أُسّي
```

### المشكلة: "Model Not Found"

**الأعراض:** 404 error for deployment

**الحلول:**
```bash
# 1. عرض عمليات النشر المتاحة
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. تحقق من اسم النموذج في البيئة
echo $AZURE_OPENAI_MODEL

# 3. حدّث إلى اسم النشر الصحيح
export AZURE_OPENAI_MODEL=gpt-4.1  # أو gpt-35-turbo
```

### المشكلة: زمن استجابة مرتفع

**الأعراض:** أوقات استجابة بطيئة (>5 seconds)

**الحلول:**
```bash
# 1. تحقق من الكمون الإقليمي
# انشر في المنطقة الأقرب إلى المستخدمين

# 2. قلل قيمة max_tokens للحصول على استجابات أسرع
export AZURE_OPENAI_MAX_TOKENS=400

# 3. استخدم التدفق للحصول على تجربة مستخدم أفضل
python chat.py --stream
```

## أفضل ممارسات الأمان

### 1. حماية مفاتيح API

```bash
# لا تقم بإضافة المفاتيح إلى نظام التحكم بالمصدر
# استخدم Key Vault (معدّ بالفعل)

# قم بتدوير المفاتيح بانتظام
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. تنفيذ ترشيح المحتوى

```python
# تتضمن Microsoft Foundry Models نظام تصفية محتوى مضمّن
# قم بالتكوين في بوابة Azure:
# مورد OpenAI → مرشحات المحتوى → إنشاء مرشح مخصص

# الفئات: الكراهية، المحتوى الجنسي، العنف، وإيذاء النفس
# المستويات: تصفية منخفضة، متوسطة، وعالية
```

### 3. استخدام Managed Identity (للإنتاج)

```bash
# في عمليات النشر الإنتاجية، استخدم الهوية المُدارة
# بدلاً من مفاتيح API (يتطلب استضافة التطبيق على Azure)

# حدّث ملف infra/openai.bicep ليشمل:
# identity: { type: 'SystemAssigned' }
```

## التطوير

### التشغيل محليًا

```bash
# تثبيت التبعيات
pip install -r src/requirements.txt

# تعيين متغيرات البيئة
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4.1"

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
# احذف جميع موارد Azure
azd down --force --purge

# هذا يزيل:
# - خدمة OpenAI
# - مخزن المفاتيح (مع حذف ناعم لمدة 90 يومًا)
# - مجموعة الموارد
# - جميع عمليات النشر والتكوينات
```

## الخطوات التالية

### توسيع هذا المثال

1. **إضافة واجهة ويب** - بناء واجهة أمامية بـ React/Vue
   ```bash
   # أضف خدمة الواجهة الأمامية إلى azure.yaml
   # انشر إلى تطبيقات الويب الثابتة من Azure
   ```

2. **تنفيذ RAG** - إضافة بحث في المستندات باستخدام Azure AI Search
   ```python
   # دمج Azure Cognitive Search
   # تحميل المستندات وإنشاء فهرس المتجهات
   ```

3. **إضافة استدعاء الدوال** - تمكين استخدام الأدوات
   ```python
   # عرّف الدوال في chat.py
   # اسمح لـ gpt-4.1 بالاتصال بواجهات برمجة التطبيقات الخارجية
   ```

4. **دعم متعدد النماذج** - نشر نماذج متعددة
   ```bash
   # أضف نماذج gpt-35-turbo ونماذج التضمين
   # نفّذ منطق توجيه النماذج
   ```

### أمثلة ذات صلة

- **[Retail Multi-Agent](../retail-scenario.md)** - بنية متقدمة متعددة الوكلاء
- **[Database App](../../../../examples/database-app)** - إضافة تخزين دائم
- **[Container Apps](../../../../examples/container-app)** - النشر كخدمة مُحاوية

### موارد التعلم

- 📚 [AZD For Beginners Course](../../README.md) - الصفحة الرئيسية للدورة
- 📚 [Microsoft Foundry Models Documentation](https://learn.microsoft.com/azure/ai-services/openai/) - الوثائق الرسمية
- 📚 [OpenAI API Reference](https://platform.openai.com/docs/api-reference) - تفاصيل API
- 📚 [Responsible AI](https://www.microsoft.com/ai/responsible-ai) - أفضل الممارسات

## موارد إضافية

### التوثيق
- **[Microsoft Foundry Models Service](https://learn.microsoft.com/azure/ai-services/openai/)** - الدليل الكامل
- **[gpt-4.1 Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - قدرات النماذج
- **[Content Filtering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - ميزات الأمان
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - مرجع azd

### الدروس
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - النشر الأول
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - بناء تطبيقات الدردشة
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - ميزات متقدمة

### الأدوات
- **[Microsoft Foundry Models Studio](https://oai.azure.com/)** - مساحة لعب عبر الويب
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - كتابة مطالبات أفضل
- **[Token Calculator](https://platform.openai.com/tokenizer)** - تقدير استخدام التوكنات

### المجتمع
- **[Azure AI Discord](https://discord.gg/azure)** - احصل على مساعدة من المجتمع
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - منتدى الأسئلة والأجوبة
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - آخر التحديثات

---

**🎉 نجاح!** لقد نشرت Microsoft Foundry Models وبنيت تطبيق دردشة يعمل. ابدأ في استكشاف قدرات gpt-4.1 وجرب مطالبات وحالات استخدام مختلفة.

**أسئلة؟** [افتح مشكلة](https://github.com/microsoft/AZD-for-beginners/issues) أو تحقق من [الأسئلة الشائعة](../../resources/faq.md)

**تنبيه التكلفة:** تذكّر تشغيل `azd down` عند الانتهاء من الاختبار لتجنب الرسوم المستمرة (~$50-100/month للاستخدام النشط).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
إخلاء المسؤولية:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي Co-op Translator (https://github.com/Azure/co-op-translator). بينما نسعى إلى الدقة، يُرجى ملاحظة أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الموثوق به. بالنسبة للمعلومات الحرجة، يُنصح بالاستعانة بترجمة احترافية بشرية. نحن غير مسؤولين عن أي سوء فهم أو تفسير ينشأ عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->