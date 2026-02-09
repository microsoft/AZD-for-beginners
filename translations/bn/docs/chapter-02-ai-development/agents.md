# Azure Developer CLI দিয়ে AI এজেন্ট

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় 2 - AI-First Development
- **⬅️ পূর্ববর্তী**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ পরবর্তী**: [Production AI Practices](production-ai-practices.md)
- **🚀 উন্নত**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## পরিচিতি

AI এজেন্টগুলি স্বয়ংক্রিয় প্রোগ্রাম যা তাদের পরিবেশ অনুধাবন করতে, সিদ্ধান্ত নিতে এবং নির্দিষ্ট লক্ষ্য অর্জনের জন্য ক্রিয়া নিতে পারে। সাধারণ প্রম্পট-প্রতিক্রিয়াকারী চ্যাটবট থেকে ভিন্ন হয়ে, এজেন্টগুলি করতে পারে:

- **টুল ব্যবহার করা** - API কল করা, ডেটাবেস সার্চ করা, কোড সম্পাদন করা
- **পরিকল্পনা ও যুক্তি** - জটিল কাজকে ধাপে বিভক্ত করা
- **প্রসঙ্গ থেকে শেখা** - মেমরি বজায় রাখা এবং আচরণ অভিযোজিত করা
- **সহযোগিতা করা** - অন্যান্য এজেন্টের সাথে কাজ করা (মাল্টি-এজেন্ট সিস্টেম)

এই গাইডটি আপনাকে দেখাবে কিভাবে Azure Developer CLI (azd) ব্যবহার করে AI এজেন্টগুলো Azure-এ ডিপ্লয় করতে হয়।

## শেখার লক্ষ্য

এই গাইডটি সম্পূর্ণ করার মাধ্যমে আপনি:
- বুঝতে পারবেন AI এজেন্ট কী এবং সেগুলো চ্যাটবট থেকে কিভাবে আলাদা
- AZD ব্যবহার করে প্রি-বিল্ট AI এজেন্ট টেমপ্লেট ডিপ্লয় করতে পারবেন
- কাস্টম এজেন্টের জন্য Foundry Agents কনফিগার করতে পারবেন
- মৌলিক এজেন্ট প্যাটার্নগুলি (টুল ব্যবহার, RAG, মাল্টি-এজেন্ট) প্রয়োগ করতে পারবেন
- ডিপ্লয় করা এজেন্ট মনিটর এবং ডিবাগ করতে পারবেন

## শেখার ফলাফল

শেষ করলে, আপনি সক্ষম হবেন:
- একক কমান্ডে AI এজেন্ট অ্যাপ্লিকেশনগুলো Azure-এ ডিপ্লয় করা
- এজেন্ট টুল এবং ক্ষমতাগুলি কনফিগার করা
- এজেন্টের সাথে retrieval-augmented generation (RAG) বাস্তবায়ন করা
- জটিল কর্মপ্রবাহের জন্য মাল্টি-এজেন্ট আর্কিটেকচার ডিজাইন করা
- সাধারণ এজেন্ট ডিপ্লয়মেন্ট সমস্যা সমাধান করা

---

## 🤖 এজেন্টকে চ্যাটবট থেকে আলাদা করে কী?

| বৈশিষ্ট্য | চ্যাটবট | AI এজেন্ট |
|---------|---------|----------|
| **আচরণ** | প্রম্পটের উত্তর দেয় | স্বায়ত্তশাসিত ক্রিয়া গ্রহণ করে |
| **টুল** | নেই | API কল, সার্চ, কোড চালাতে পারে |
| **মেমরি** | শুধুমাত্র সেশন-ভিত্তিক | সেশনগুলোর মধ্যে স্থায়ী মেমরি |
| **পরিকল্পনা** | একক উত্তর | বহু-ধাপের যুক্তি |
| **সহযোগিতা** | একক সত্তা | অন্যান্য এজেন্টের সাথে কাজ করতে পারে |

### সরল উপমা

- **চ্যাটবট** = একটি তথ্য ডেস্কে প্রশ্নের উত্তর দেয় এমন সহায়ক ব্যক্তি
- **AI এজেন্ট** = একটি ব্যক্তিগত সহকারী যে কল করতে পারে, অ্যাপয়েন্টমেন্ট বুক করতে পারে, এবং আপনার জন্য কাজ সম্পন্ন করে

---

## 🚀 দ্রুত শুরু: আপনার প্রথম এজেন্ট ডিপ্লয় করুন

### বিকল্প 1: Foundry Agents টেমপ্লেট (প্রস্তাবিত)

```bash
# AI এজেন্টদের টেমপ্লেট প্রাথমিকভাবে সেট আপ করুন
azd init --template get-started-with-ai-agents

# Azure-এ স্থাপন করুন
azd up
```

**কোনগুলো ডিপ্লয় করা হবে:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (RAG এর জন্য)
- ✅ Azure Container Apps (ওয়েব ইন্টারফেস)
- ✅ Application Insights (মনিটরিং)

**সময়:** ~15-20 মিনিট
**খরচ:** ~$100-150/মাস (ডেভেলপমেন্ট)

### বিকল্প 2: OpenAI Agent with Prompty

```bash
# Prompty-ভিত্তিক এজেন্ট টেমপ্লেট আরম্ভ করুন
azd init --template agent-openai-python-prompty

# Azure-এ স্থাপন করুন
azd up
```

**কোনগুলো ডিপ্লয় করা হবে:**
- ✅ Azure Functions (সার্ভারলেস এজেন্ট এক্সিকিউশন)
- ✅ Azure OpenAI
- ✅ Prompty কনফিগারেশন ফাইল
- ✅ স্যাম্পল এজেন্ট ইমপ্লিমেন্টেশন

**সময়:** ~10-15 মিনিট
**খরচ:** ~$50-100/মাস (ডেভেলপমেন্ট)

### বিকল্প 3: RAG Chat Agent

```bash
# RAG চ্যাট টেমপ্লেট আরম্ভ করুন
azd init --template azure-search-openai-demo

# Azure-এ স্থাপন করুন
azd up
```

**কোনগুলো ডিপ্লয় করা হবে:**
- ✅ Azure OpenAI
- ✅ Azure AI Search স্যাম্পল ডেটাসহ
- ✅ ডকুমেন্ট প্রসেসিং পাইপলাইন
- ✅ উদ্ধৃতি সহ চ্যাট ইন্টারফেস

**সময়:** ~15-25 মিনিট
**খরচ:** ~$80-150/মাস (ডেভেলপমেন্ট)

---

## 🏗️ এজেন্ট আর্কিটেকচার প্যাটার্ন

### প্যাটার্ন 1: টুলসহ সিঙ্গেল এজেন্ট

সবচেয়ে সরল এজেন্ট প্যাটার্ন - একটি এজেন্ট যে একাধিক টুল ব্যবহার করতে পারে।

```
┌─────────────────────────────────────┐
│           User Interface            │
└─────────────────┬───────────────────┘
                  │
          ┌───────▼───────┐
          │  AI Agent     │
          │  (GPT-4o)     │
          └───────┬───────┘
                  │
    ┌─────────────┼─────────────┐
    │             │             │
┌───▼───┐   ┌────▼────┐   ┌───▼───┐
│Search │   │Database │   │ API   │
│ Tool  │   │  Tool   │   │ Tool  │
└───────┘   └─────────┘   └───────┘
```

**সেরা জন্য:**
- কাস্টমার সাপোর্ট বট
- রিসার্চ অ্যাসিস্ট্যান্ট
- ডেটা অ্যানালিসিস এজেন্ট

**AZD টেমপ্লেট:** `azure-search-openai-demo`

### প্যাটার্ন 2: RAG এজেন্ট (Retrieval-Augmented Generation)

একটি এজেন্ট যা উত্তর তৈরির আগে প্রাসঙ্গিক ডকুমেন্টগুলি রিট্রাইভ করে।

```
┌──────────────────────────────────────────────┐
│                User Query                     │
└─────────────────────┬────────────────────────┘
                      │
              ┌───────▼───────┐
              │  RAG Agent    │
              └───────┬───────┘
                      │
         ┌────────────┴────────────┐
         │                         │
    ┌────▼────┐              ┌────▼────┐
    │ Vector  │              │  LLM    │
    │ Search  │──Documents──►│ (GPT-4) │
    └─────────┘              └────┬────┘
                                  │
                          ┌───────▼───────┐
                          │ Response with │
                          │  Citations    │
                          └───────────────┘
```

**সেরা জন্য:**
- এন্টারপ্রাইজ নলেজ বেস
- ডকুমেন্ট Q&A সিস্টেম
- কমপ্লায়েন্স ও লিগ্যাল রিসার্চ

**AZD টেমপ্লেট:** `azure-search-openai-demo`

### প্যাটার্ন 3: মাল্টি-এজেন্ট সিস্টেম

বিভিন্ন বিশেষায়িত এজেন্টদের দল জটিল কাজগুলিতে একসাথে কাজ করে।

```
                ┌─────────────────┐
                │  Orchestrator   │
                │    Agent        │
                └────────┬────────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
┌───────▼───────┐ ┌─────▼──────┐ ┌───────▼───────┐
│   Research    │ │   Writer   │ │   Reviewer    │
│    Agent      │ │   Agent    │ │    Agent      │
│  (GPT-4o)     │ │(GPT-4o-mini│ │   (GPT-4o)    │
└───────────────┘ └────────────┘ └───────────────┘
```

**সেরা জন্য:**
- জটিল কনটেন্ট জেনারেশন
- বহু-ধাপের কর্মপ্রবাহ
- ভিন্ন দক্ষতা প্রয়োজন এমন কাজসমূহ

**আরও জানুন:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ এজেন্ট টুল কনফিগারেশন

এজেন্টগুলো শক্তিশালী হয় যখন তারা টুল ব্যবহার করতে পারে। এখানে সাধারণ টুল কনফিগার করার উপায়:

### Foundry Agents-এ টুল কনফিগারেশন

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# কাস্টম টুলগুলি সংজ্ঞায়িত করুন
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

# টুলগুলোর সঙ্গে এজেন্ট তৈরি করুন
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### পরিবেশ কনফিগারেশন

```bash
# এজেন্ট-নির্দিষ্ট পরিবেশ ভেরিয়েবল সেট করুন
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# আপডেটকৃত কনফিগারেশন দিয়ে ডিপ্লয় করুন
azd deploy
```

---

## 📊 এজেন্ট মনিটরিং

### Application Insights ইন্টিগ্রেশন

সমস্ত AZD এজেন্ট টেমপ্লেটে মনিটরিং-এর জন্য Application Insights অন্তর্ভুক্ত থাকে:

```bash
# পর্যবেক্ষণ ড্যাশবোর্ড খুলুন
azd monitor --overview

# লাইভ লগ দেখুন
azd monitor --logs

# লাইভ মেট্রিক্স দেখুন
azd monitor --live
```

### ট্র্যাক করার মূল ম্যাট্রিক্স

| মেট্রিক | বর্ণনা | লক্ষ্য |
|--------|-------------|--------|
| রেসপন্স লেটেন্সি | প্রতিক্রিয়া জেনারেট করতে সময় | < 5 সেকেন্ড |
| টোকেন ব্যবহার | প্রতি রিকোয়েস্ট টোকেন | খরচ মনিটর করুন |
| টুল কল সাফল্য হার | সফল টুল এক্সিকিউশনের % | > 95% |
| এরর রেট | ব্যর্থ এজেন্ট অনুরোধ | < 1% |
| ব্যবহারকারী সন্তুষ্টি | ফিডব্যাক স্কোর | > 4.0/5.0 |

### এজেন্টদের জন্য কাস্টম লগিং

```python
import logging
from opencensus.ext.azure.log_exporter import AzureLogHandler

logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
))

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    logger.info("agent_interaction", extra={
        "custom_dimensions": {
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        }
    })
```

---

## 💰 খরচ সম্পর্কিত বিবেচনা

### প্যাটার্ন অনুসারে আনুমানিক মাসিক খরচ

| প্যাটার্ন | ডেভ এনভায়র়নমেন্ট | প্রোডাকশন |
|---------|-----------------|------------|
| সিঙ্গেল এজেন্ট | $50-100 | $200-500 |
| RAG এজেন্ট | $80-150 | $300-800 |
| মাল্টি-এজেন্ট (2-3 এজেন্ট) | $150-300 | $500-1,500 |
| এন্টারপ্রাইজ মাল্টি-এজেন্ট | $300-500 | $1,500-5,000+ |

### খরচ অপ্টিমাইজেশন টিপস

1. **সরল কাজের জন্য GPT-4o-mini ব্যবহার করুন**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **পুনরাবৃত্তি কুয়েরির জন্য ক্যাশিং ব্যবহার করুন**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **টোকেন সীমা নির্ধারণ করুন**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # প্রতিক্রিয়ার দৈর্ঘ্য সীমিত করুন
   )
   ```

4. **ব্যবহার না হলে zero এ স্কেল করুন**
   ```bash
   # কন্টেইনার অ্যাপস স্বয়ংক্রিয়ভাবে শূন্যে স্কেল করে
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 এজেন্ট ট্রাবলশুটিং

### সাধারণ সমস্যা এবং সমাধান

<details>
<summary><strong>❌ এজেন্ট টুল কলগুলিতে সাড়া দিচ্ছে না</strong></summary>

```bash
# টুলগুলো সঠিকভাবে নিবন্ধিত আছে কিনা পরীক্ষা করুন
azd show

# OpenAI ডিপ্লয়মেন্ট যাচাই করুন
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# এজেন্ট লগগুলো পরীক্ষা করুন
azd monitor --logs
```

**সাধারণ কারণসমূহ:**
- টুল ফাংশন সিগনেচার মেলান না
- প্রয়োজনীয় অনুমতিগুলি অনুপস্থিত
- API endpoint অ্যাক্সেসযোগ্য নয়
</details>

<details>
<summary><strong>❌ এজেন্ট প্রতিক্রিয়ায় উচ্চ লেটেন্সি</strong></summary>

```bash
# বটলনেকগুলো নির্ধারণ করার জন্য Application Insights পরীক্ষা করুন
azd monitor --live

# একটি দ্রুততর মডেল ব্যবহার করার কথা বিবেচনা করুন
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**অপটিমাইজেশন টিপস:**
- স্ট্রিমিং রেসপন্স ব্যবহার করুন
- রেসপন্স ক্যাশিং প্রয়োগ করুন
- প্রসঙ্গ উইন্ডো আকার কমান
</details>

<details>
<summary><strong>❌ এজেন্ট ভুল বা হলুসিনেটেড তথ্য ফেরত দিচ্ছে</strong></summary>

```python
# ভাল সিস্টেম প্রম্পট ব্যবহার করে উন্নত করুন
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# গ্রাউন্ডিংয়ের জন্য তথ্য পুনরুদ্ধার যোগ করুন
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # উত্তরগুলোকে ডকুমেন্টে ভিত্তি করুন
)
```
</details>

<details>
<summary><strong>❌ টোকেন সীমা অতিক্রম ত্রুটি</strong></summary>

```python
# প্রসঙ্গ উইন্ডো ব্যবস্থাপনা বাস্তবায়ন করুন
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # মোটামুটি অনুমান
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 হ্যান্ডস-অন এক্সারসাইজ

### এক্সারসাইজ 1: একটি বেসিক এজেন্ট ডিপ্লয় করুন (20 মিনিট)

**লক্ষ্য:** AZD ব্যবহার করে আপনার প্রথম AI এজেন্ট ডিপ্লয় করা

```bash
# ধাপ 1: টেমপ্লেট ইনিশিয়ালাইজ করুন
azd init --template get-started-with-ai-agents

# ধাপ 2: Azure-এ লগইন করুন
azd auth login

# ধাপ 3: ডিপ্লয় করুন
azd up

# ধাপ 4: এজেন্ট পরীক্ষা করুন
# আউটপুটে দেখানো URL খুলুন

# ধাপ 5: পরিষ্কার করুন
azd down --force --purge
```

**সফলতার মানদণ্ড:**
- [ ] এজেন্ট প্রশ্নের জবাব দেয়
- [ ] মনিটরিং ড্যাশবোর্ডে অ্যাক্সেস আছে
- [ ] রিসোর্সগুলো সফলভাবে ক্লিনআপ করা হয়েছে

### এক্সারসাইজ 2: একটি কাস্টম টুল যোগ করুন (30 মিনিট)

**লক্ষ্য:** একটি কাস্টম টুল দিয়ে এজেন্ট বাড়ান

1. এজেন্ট টেমপ্লেট ডিপ্লয় করুন
2. একটি নতুন টুল ফাংশন তৈরি করুন:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # আবহাওয়া পরিষেবায় API কল
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. টুলটি এজেন্টের সাথে রেজিস্টার করুন
4. টেস্ট করুন যে এজেন্ট নতুন টুল ব্যবহার করে

**সফলতার মানদণ্ড:**
- [ ] এজেন্ট আবহাওয়া-সম্পর্কিত প্রশ্ন চিনতে পারে
- [ ] টুল সঠিকভাবে কল হচ্ছে
- [ ] প্রতিক্রিয়াতে আবহাওয়ার তথ্য অন্তর্ভুক্ত আছে

### এক্সারসাইজ 3: একটি RAG এজেন্ট তৈরি করুন (45 মিনিট)

**লক্ষ্য:** এমন একটি এজেন্ট তৈরি করা যা আপনার ডকুমেন্টগুলো থেকে প্রশ্নের উত্তরে সাহায্য করে

```bash
# RAG টেমপ্লেট স্থাপন করুন
azd init --template azure-search-openai-demo
azd up

# আপনার নথি আপলোড করুন
# (টেমপ্লেটের ডেটা গ্রহণ নির্দেশিকা অনুসরণ করুন)

# ডোমেন-নির্দিষ্ট প্রশ্ন দিয়ে পরীক্ষা করুন
```

**সফলতার মানদণ্ড:**
- [ ] এজেন্ট আপলোড করা ডকুমেন্ট থেকে উত্তর দেয়
- [ ] প্রতিক্রিয়াতে উদ্ধৃতি থাকে
- [ ] আউট-অভ-স্কোপ প্রশ্নে হলুসিনেশন নেই

---

## 📚 পরবর্তী ধাপ

এখন আপনি AI এজেন্ট সম্পর্কে বুঝে গেছেন, এই উন্নত বিষগুলো অন্বেষণ করুন:

| বিষয় | বর্ণনা | লিংক |
|-------|-------------|------|
| **Multi-Agent Systems** | একাধিক সহযোগী এজেন্ট দিয়ে সিস্টেম তৈরি করুন | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Coordination Patterns** | অর্কেস্ট্রেশন এবং যোগাযোগ প্যাটার্ন শিখুন | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Production Deployment** | এন্টারপ্রাইজ-রেডি এজেন্ট ডিপ্লয়মেন্ট | [Production AI Practices](production-ai-practices.md) |
| **Agent Evaluation** | এজেন্টের পারফরম্যান্স টেস্ট ও মূল্যায়ন করুন | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 অতিরিক্ত রিসোর্স

### অফিসিয়াল ডকুমেন্টেশন
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### এজেন্টদের জন্য AZD টেমপ্লেট
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### কমিউনিটি রিসোর্স
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**নেভিগেশন**
- **পূর্ববর্তী লেসন**: [AI Model Deployment](ai-model-deployment.md)
- **পরবর্তী লেসন**: [Production AI Practices](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়-অস্বীকার:
এই দলিলটি এআই অনুবাদ সেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা সঠিকতার জন্য যতটা সম্ভব চেষ্টা করলেও, স্বয়ংক্রিয় অনুবাদে ভুল বা অসঙ্গতি থাকতে পারে। মূল দলিলটি তার মূল ভাষায়ই কর্তৃত্বপূর্ণ উৎস হিসেবে গণ্য করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদের পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভ্রান্ত ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->