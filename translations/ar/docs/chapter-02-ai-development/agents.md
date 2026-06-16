# وكلاء الذكاء الاصطناعي باستخدام Azure Developer CLI

**تصفح الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - التطوير المعتمد على الذكاء الاصطناعي
- **⬅️ السابق**: [تكامل Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ التالي**: [نشر نماذج الذكاء الاصطناعي](ai-model-deployment.md)
- **🚀 متقدم**: [حلول متعددة الوكلاء](../../examples/retail-scenario.md)

---

## المقدمة

وكلاء الذكاء الاصطناعي هم برامج مستقلة يمكنها إدراك بيئتها، واتخاذ قرارات، وتنفيذ إجراءات لتحقيق أهداف محددة. على عكس روبوتات الدردشة البسيطة التي ترد على المطالبات، يمكن للوكلاء:

- **استخدام الأدوات** - استدعاء واجهات برمجة التطبيقات (APIs)، البحث في قواعد البيانات، تنفيذ الشيفرة
- **التخطيط والتفكير** - تقسيم المهام المعقدة إلى خطوات
- **التعلم من السياق** - الحفاظ على الذاكرة وتكييف السلوك
- **التعاون** - العمل مع وكلاء آخرين (أنظمة متعددة الوكلاء)

يوضح هذا الدليل كيفية نشر وكلاء الذكاء الاصطناعي إلى Azure باستخدام Azure Developer CLI (azd).

> **ملاحظة التحقق (2026-03-25):** تم مراجعة هذا الدليل مقابل `azd` `1.23.12` و `azure.ai.agents` `0.1.18-preview`. تجربة `azd ai` لا تزال مدفوعة بالمعاينة، لذا تحقق من مساعدة الامتداد إذا اختلفت العلامات المثبتة لديك.

## أهداف التعلم

من خلال إكمال هذا الدليل، ستتمكن من:
- فهم ما هي وكلاء الذكاء الاصطناعي وكيف تختلف عن روبوتات الدردشة
- نشر قوالب وكلاء مُسبقة الإنشاء باستخدام AZD
- تكوين وكلاء Foundry للوكلاء المخصصين
- تنفيذ أنماط وكيل أساسية (استخدام الأدوات، RAG، متعدد الوكلاء)
- مراقبة وتصحيح أخطاء الوكلاء المنشورين

## نتائج التعلم

عند الانتهاء، ستتمكن من:
- نشر تطبيقات وكلاء الذكاء الاصطناعي إلى Azure بأمر واحد
- تكوين أدوات وقدرات الوكيل
- تنفيذ التوليد المعزز بالاسترجاع (RAG) مع الوكلاء
- تصميم بنى متعددة الوكلاء لتدفقات عمل معقدة
- استكشاف وحل مشكلات النشر الشائعة للوكلاء

---

## 🤖 ما الذي يميز الوكيل عن روبوت الدردشة؟

| الميزة | روبوت الدردشة | وكيل الذكاء الاصطناعي |
|---------|---------|----------|
| **السلوك** | يرد على المطالبات | يتخذ إجراءات ذاتية |
| **الأدوات** | لا شيء | يمكنه استدعاء APIs، البحث، تنفيذ الشيفرة |
| **الذاكرة** | قائمة على الجلسة فقط | ذاكرة دائمة عبر الجلسات |
| **التخطيط** | استجابة واحدة | التفكير متعدد الخطوات |
| **التعاون** | كيان واحد | يمكنه العمل مع وكلاء آخرين |

### تشبيه بسيط

- **روبوت الدردشة** = شخص مساعد يجيب على الأسئلة في مكتب المعلومات
- **وكيل الذكاء الاصطناعي** = مساعد شخصي يمكنه إجراء المكالمات، حجز المواعيد، وإكمال المهام نيابةً عنك

---

## 🚀 بداية سريعة: انشر وكيلك الأول

### الخيار 1: قالب Foundry Agents (موصى به)

```bash
# تهيئة قالب لوكلاء الذكاء الاصطناعي
azd init --template get-started-with-ai-agents

# نشر إلى أزور
azd up
```

**ما الذي يتم نشره:**
- ✅ Foundry Agents
- ✅ Microsoft Foundry Models (gpt-4.1)
- ✅ Azure AI Search (لـ RAG)
- ✅ Azure Container Apps (واجهة الويب)
- ✅ Application Insights (للمراقبة)

**الوقت:** ~15-20 دقيقة
**التكلفة:** ~$100-150/شهر (للتطوير)

### الخيار 2: وكيل OpenAI مع Prompty

```bash
# تهيئة قالب الوكيل المعتمد على Prompty
azd init --template agent-openai-python-prompty

# نشر إلى Azure
azd up
```

**ما الذي يتم نشره:**
- ✅ Azure Functions (تنفيذ الوكيل بدون خادم)
- ✅ Microsoft Foundry Models
- ✅ ملفات تكوين Prompty
- ✅ تنفيذ وكيل نموذجي

**الوقت:** ~10-15 دقيقة
**التكلفة:** ~$50-100/شهر (للتطوير)

### الخيار 3: وكيل دردشة RAG

```bash
# تهيئة قالب دردشة RAG
azd init --template azure-search-openai-demo

# نشر إلى أزور
azd up
```

**ما الذي يتم نشره:**
- ✅ Microsoft Foundry Models
- ✅ Azure AI Search مع بيانات عينة
- ✅ خط أنابيب معالجة المستندات
- ✅ واجهة دردشة مع استشهادات

**الوقت:** ~15-25 دقيقة
**التكلفة:** ~$80-150/شهر (للتطوير)

### الخيار 4: تهيئة AZD AI Agent (معاينة قائمة على البيان أو القالب)

إذا كان لديك ملف بيان الوكيل، يمكنك استخدام أمر `azd ai` لتهيئة مشروع Foundry Agent Service مباشرةً. أضافت إصدارات المعاينة الأخيرة أيضًا دعم التهيئة القائم على القوالب، لذا قد يختلف تدفق المطالبة قليلاً اعتمادًا على إصدار الامتداد المثبت لديك.

```bash
# قم بتثبيت ملحق وكلاء الذكاء الاصطناعي
azd extension install azure.ai.agents

# اختياري: تحقق من إصدار المعاينة المثبت
azd extension show azure.ai.agents

# قم بالتهيئة من ملف تعريف الوكيل
azd ai agent init -m agent-manifest.yaml

# انشر إلى Azure
azd up

# اختبر الوكيل المنشور (يعرض زمن الاستجابة + الوقت حتى أول بايت)
azd ai agent invoke
```

**متى تستخدم `azd ai agent init` مقابل `azd init --template`:**

| النهج | الأفضل لـ | كيف يعمل |
|----------|----------|------|
| `azd init --template` | البدء من تطبيق عينة يعمل | يستنسخ مستودع قالب كامل يحتوي على الشيفرة + البنية التحتية |
| `azd ai agent init -m` | البناء من ملف بيان الوكيل الخاص بك | ينشئ هيكل المشروع من تعريف الوكيل الخاص بك |

> **نصيحة:** استخدم `azd init --template` عند التعلم (الخيارات 1-3 أعلاه). استخدم `azd ai agent init` عند بناء وكلاء إنتاج مع بيانات البيان الخاصة بك.

بعد `azd up`، يقودك نفس الامتداد خلال بقية دورة حياة الوكيل: `azd ai agent invoke` للاختبار، `azd ai agent eval generate` و `azd ai agent optimize` لقياس وتحسين الجودة، و `azd ai agent delete` للتنظيف. انظر [أوامر AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) للمرجع الكامل.

---

## 🏗️ أنماط بنية الوكلاء

### النمط 1: وكيل واحد مع أدوات

أبسط نمط وكيل - وكيل واحد يمكنه استخدام أدوات متعددة.

```mermaid
graph TD
    UI[واجهة المستخدم] --> Agent[وكيل الذكاء الاصطناعي<br/>gpt-4.1]
    Agent --> Search[أداة البحث]
    Agent --> Database[أداة قاعدة البيانات]
    Agent --> API[أداة واجهة برمجة التطبيقات]
```

**الأفضل لـ:**
- روبوتات دعم العملاء
- مساعدين للبحث
- وكلاء تحليل البيانات

**قالب AZD:** `azure-search-openai-demo`

### النمط 2: وكيل RAG (التوليد المعزز بالاسترجاع)

وكيل يقوم باسترجاع المستندات ذات الصلة قبل توليد الاستجابات.

```mermaid
graph TD
    Query[استعلام المستخدم] --> RAG[وكيل RAG]
    RAG --> Vector[بحث المتجهات]
    RAG --> LLM[نموذج لغوي كبير<br/>gpt-4.1]
    Vector -- مستندات --> LLM
    LLM --> Response[استجابة مع استشهادات]
```

**الأفضل لـ:**
- قواعد معارف المؤسسات
- أنظمة الأسئلة والأجوبة بالمستندات
- الامتثال والبحوث القانونية

**قالب AZD:** `azure-search-openai-demo`

### النمط 3: نظام متعدد الوكلاء

عدة وكلاء متخصصين يعملون معًا على مهام معقدة.

```mermaid
graph TD
    Orchestrator[وكيل المنسّق] --> Research[وكيل البحث<br/>gpt-4.1]
    Orchestrator --> Writer[وكيل الكاتب<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[وكيل المراجع<br/>gpt-4.1]
```

**الأفضل لـ:**
- توليد محتوى معقد
- تدفقات عمل متعددة الخطوات
- المهام التي تتطلب خبرات مختلفة

**تعرف أكثر:** [أنماط تنسيق متعدد الوكلاء](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ تكوين أدوات الوكلاء

تصبح الوكلاء قوية عندما يمكنها استخدام الأدوات. إليك كيفية تكوين الأدوات الشائعة:

### تكوين الأدوات في Foundry Agents

```python
# تكوين_الوكيل.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# تعريف أدوات مخصصة
search_tool = FunctionTool(
    name="search_knowledge_base",
    description="Search the company knowledge base for relevant documents",
    parameters={
        "type": "object",
        "properties": {
            "query": {
                "type": "string",
                "description": "The search query"
            }
        },
        "required": ["query"]
    }
)

# إنشاء وكيل باستخدام الأدوات
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### تكوين البيئة

```bash
# إعداد متغيرات البيئة الخاصة بالوكيل
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# نشر باستخدام التكوين المحدث
azd deploy
```

---

## 📊 مراقبة الوكلاء

### تكامل Application Insights

تتضمن جميع قوالب وكلاء AZD Application Insights للمراقبة:

```bash
# افتح لوحة المراقبة
azd monitor --overview

# عرض السجلات الحية
azd monitor --logs

# عرض المقاييس الحية
azd monitor --live
```

### المقاييس الرئيسية للتتبع

| المقياس | الوصف | الهدف |
|--------|-------------|--------|
| زمن الاستجابة | الوقت اللازم لتوليد الاستجابة | < 5 ثوانٍ |
| استخدام التوكنات | عدد التوكنات لكل طلب | راقب من أجل التكلفة |
| نسبة نجاح استدعاء الأدوات | % من تنفيذ استدعاءات الأدوات الناجحة | > 95% |
| معدل الأخطاء | الطلبات الفاشلة للوكيل | < 1% |
| رضا المستخدم | درجات التغذية الراجعة | > 4.0/5.0 |

### تسجيل مخصص للوكلاء

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# تكوين Azure Monitor باستخدام OpenTelemetry
configure_azure_monitor(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
)

tracer = trace.get_tracer(__name__)

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    with tracer.start_as_current_span("agent_interaction") as span:
        span.set_attributes({
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        })
```

> **ملاحظة:** ثبّت الحزم المطلوبة: `pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 اعتبارات التكلفة

### التكاليف الشهرية المقدرة حسب النمط

| النمط | بيئة التطوير | الإنتاج |
|---------|-----------------|------------|
| وكيل واحد | $50-100 | $200-500 |
| وكيل RAG | $80-150 | $300-800 |
| متعدد الوكلاء (2-3 وكلاء) | $150-300 | $500-1,500 |
| متعدد الوكلاء للمؤسسات | $300-500 | $1,500-5,000+ |

### نصائح لتحسين التكلفة

1. **استخدم gpt-4.1-mini للمهام البسيطة**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. **نفّذ التخزين المؤقت للاستفسارات المتكررة**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **حدد حدود التوكن لكل تشغيل**
   ```python
   # قم بتعيين max_completion_tokens عند تشغيل الوكيل، وليس أثناء إنشائه
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # حدد طول الاستجابة
   )
   ```

4. **قُم بالمقايَسَة إلى الصفر عندما لا تكون قيد الاستخدام**
   ```bash
   # تقوم تطبيقات الحاويات بالتحجيم تلقائيًا حتى الصفر
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 استكشاف أخطاء الوكلاء وإصلاحها

### المشكلات الشائعة والحلول

<details>
<summary><strong>❌ الوكيل لا يستجيب لاستدعاءات الأدوات</strong></summary>

```bash
# تحقق مما إذا كانت الأدوات مسجلة بشكل صحيح
azd show

# تحقق من نشر OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# تحقق من سجلات الوكيل
azd monitor --logs
```

**الأسباب الشائعة:**
- عدم تطابق توقيع دالة الأداة
- فقدان الأذونات المطلوبة
- نقطة نهاية API غير قابلة للوصول
</details>

<details>
<summary><strong>❌ زمن استجابة عالي في ردود الوكيل</strong></summary>

```bash
# تحقق من Application Insights للعثور على نقاط الاختناق
azd monitor --live

# ضع في اعتبارك استخدام نموذج أسرع
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd deploy
```

**نصائح التحسين:**
- استخدم الاستجابات المتدفقة
- نفّذ التخزين المؤقت للاستجابة
- قلّل من حجم نافذة السياق
</details>

<details>
<summary><strong>❌ الوكيل يُرجع معلومات غير صحيحة أو متخيّلة</strong></summary>

```python
# التحسين عبر مطالبات نظامية أفضل
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# إضافة آلية استرجاع للتأصيل
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # ربط الردود بالمستندات
)
```
</details>

<details>
<summary><strong>❌ أخطاء تجاوز حد التوكن</strong></summary>

```python
# تنفيذ إدارة نافذة السياق
def truncate_context(messages, max_tokens=8000, model="gpt-4.1"):
    """Keep only recent messages within token limit."""
    import tiktoken
    encoding = tiktoken.encoding_for_model(model)
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(encoding.encode(msg.content))
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 تمارين عملية

### التمرين 1: نشر وكيل أساسي (20 دقيقة)

**الهدف:** نشر وكيل الذكاء الاصطناعي الأول باستخدام AZD

```bash
# الخطوة 1: تهيئة القالب
azd init --template get-started-with-ai-agents

# الخطوة 2: تسجيل الدخول إلى Azure
azd auth login
# إذا كنت تعمل عبر مستأجرين، أضف --tenant-id <tenant-id>

# الخطوة 3: النشر
azd up

# الخطوة 4: اختبار الوكيل
# المخرجات المتوقعة بعد النشر:
#   اكتمل النشر!
#   نقطة النهاية: https://<app-name>.<region>.azurecontainerapps.io
# افتح عنوان URL الظاهر في المخرجات وحاول طرح سؤال

# الخطوة 5: عرض المراقبة
azd monitor --overview

# الخطوة 6: تنظيف الموارد
azd down --force --purge
```

**معايير النجاح:**
- [ ] يستجيب الوكيل للأسئلة
- [ ] يمكن الوصول إلى لوحة المراقبة عبر `azd monitor`
- [ ] تنظيف الموارد بنجاح

### التمرين 2: إضافة أداة مخصصة (30 دقيقة)

**الهدف:** توسيع الوكيل بأداة مخصصة

1. انشر قالب الوكيل:
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. أنشئ دالة أداة جديدة في شيفرة الوكيل الخاصة بك:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # استدعاء واجهة برمجة التطبيقات لخدمة الطقس
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. سجّل الأداة مع الوكيل:
   ```python
   from azure.ai.projects.models import FunctionTool

   weather_tool = FunctionTool(
       name="get_weather",
       description="Get current weather for a location",
       parameters={
           "type": "object",
           "properties": {
               "location": {"type": "string", "description": "City name"}
           },
           "required": ["location"]
       }
   )

   agent = project_client.agents.create_agent(
       model="gpt-4.1",
       name="Weather Agent",
       tools=[weather_tool]
   )
   ```
4. أعد النشر والاختبار:
   ```bash
   azd deploy
   # اسأل: "ما هو الطقس في سياتل؟"
   # المتوقع: يقوم الوكيل باستدعاء get_weather("Seattle") ويعيد معلومات الطقس
   ```

**معايير النجاح:**
- [ ] يتعرف الوكيل على الاستفسارات المتعلقة بالطقس
- [ ] يتم استدعاء الأداة بشكل صحيح
- [ ] تتضمن الاستجابة معلومات الطقس

### التمرين 3: بناء وكيل RAG (45 دقيقة)

**الهدف:** إنشاء وكيل يجيب عن الأسئلة من مستنداتك

```bash
# الخطوة 1: نشر قالب RAG
azd init --template azure-search-openai-demo
azd up

# الخطوة 2: قم بتحميل مستنداتك
# ضع ملفات PDF/TXT في دليل data/، ثم شغّل:
python scripts/prepdocs.py

# الخطوة 3: اختبر بأسئلة متخصصة بالمجال
# افتح عنوان URL لتطبيق الويب من مخرجات azd up
# اطرح أسئلة حول مستنداتك المحمّلة
# ينبغي أن تتضمن الردود مراجع استشهاد مثل [doc.pdf]
```

**معايير النجاح:**
- [ ] يجيب الوكيل من المستندات المرفوعة
- [ ] تتضمن الإجابات استشهادات
- [ ] لا توجد هلوسة في الأسئلة خارج النطاق

---

## 📚 الخطوات التالية

الآن بعد أن فهمت وكلاء الذكاء الاصطناعي، استكشف هذه المواضيع المتقدمة:

| الموضوع | الوصف | الرابط |
|-------|-------------|------|
| **أنظمة متعددة الوكلاء** | بناء أنظمة تحتوي على وكلاء متعاونين متعددين | [مثال متعدد الوكلاء لتجارة التجزئة](../../examples/retail-scenario.md) |
| **أنماط التنسيق** | تعلّم أنماط التنسيق والتواصل | [أنماط التنسيق](../chapter-06-pre-deployment/coordination-patterns.md) |
| **نشر الإنتاج** | نشر وكلاء جاهزين للمؤسسات | [ممارسات الذكاء الاصطناعي للإنتاج](../chapter-08-production/production-ai-practices.md) |
| **تقييم الوكلاء** | اختبار وتقييم أداء الوكلاء | [استكشاف أخطاء الذكاء الاصطناعي وإصلاحها](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **مختبر ورشة عمل الذكاء الاصطناعي** | عمليًا: اجعل حل الذكاء الاصطناعي جاهزًا لـ AZD | [مختبر ورشة عمل الذكاء الاصطناعي](ai-workshop-lab.md) |

---

## 📖 موارد إضافية

### الوثائق الرسمية
- [خدمة Microsoft Foundry Agent](https://learn.microsoft.com/azure/ai-services/agents/)
- [دليل البدء لخدمة Microsoft Foundry Agent](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [إطار عمل Semantic Kernel Agent](https://learn.microsoft.com/semantic-kernel/)

### قوالب AZD للوكلاء
- [البدء مع وكلاء الذكاء الاصطناعي](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [عرض Azure Search OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)

### موارد المجتمع
- [Awesome AZD - قوالب الوكلاء](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Discord Azure AI](https://discord.gg/microsoft-azure)
- [Discord Microsoft Foundry](https://discord.gg/nTYy5BXMWG)

### مهارات الوكلاء لمحررك
- [**Microsoft Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - ثبّت مهارات وكلاء الذكاء الاصطناعي القابلة لإعادة الاستخدام لتطوير Azure في GitHub Copilot أو Cursor أو أي وكيل مدعوم. تتضمن مهارات لـ [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [النشر](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy)، و [التشخيص](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics):
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**التنقل**
- **الدرس السابق**: [تكامل Microsoft Foundry](microsoft-foundry-integration.md)
- **الدرس التالي**: [نشر نماذج الذكاء الاصطناعي](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->