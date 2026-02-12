# Azure Developer CLI ဖြင့် AI အေးဂျင့်များ

**အခန်း လမ်းကြောင်း:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 ယခုအခန်း**: အခန်း 2 - AI-ပထမ ဦးစားပေး ဖွံ့ဖြိုးရေး
- **⬅️ ယခင်**: [AI မော်ဒယ် တင်ပို့ခြင်း](ai-model-deployment.md)
- **➡️ နောက်တစ်ခု**: [ထုတ်လုပ်ရေး AI လုပ်ထုံးလုပ်နည်းများ](production-ai-practices.md)
- **🚀 အဆင့်မြင့်**: [Multi-Agent ဖြေရှင်းချက်များ](../../examples/retail-scenario.md)

---

## နိဒါန်း

AI အေးဂျင့်များသည် သူ့ပတ်ဝန်းကျင်ကို ရှာဖွေထောက်လှမ်းပြီး ဆုံးဖြတ်ချက်ချနိုင်ကာ သတ်မှတ်ထားသော ရည်မှန်းချက်များကို ဖြည့်ဆည်းရန် လုပ်ဆောင်ချက်များ ဆောင်ရွက်နိုင်သည့် အလိုအလျောက် ပြေးဆောင်သော ပရိုဂရမ်များ ဖြစ်သည်။ ပုံမှန် prompt များကို တုံ့ပြန်သည့် ရိုးရှင်းသော chatbot များနှင့် မတူဘဲ၊ အေးဂျင့်များသည် -

- **ကိရိယာများကို အသုံးပြုနိုင်ခြင်း** - API များကို ခေါ်ဆိုခြင်း၊ ဒေတာဘေ့စ်များကို ရှာဖွေခြင်း၊ ကုဒ်ကို အကောင်အထည်ဖော်ခြင်း
- **အစီအစဉ်ချခြင်းနှင့် ရှာဖွေတွေးခေါ်နိုင်ခြင်း** - ရှုပ်ထွေးသည့် အလုပ်များကို အဆင့်လိုက် ခွဲထုတ်ခြင်း
- **အကြောင်းအရာမှ သင်ယူနိုင်ခြင်း** - မှတ်ဉာဏ်ကို ထိန်းသိမ်း၍ အပြုအမူများကို လိုက်လျောညီထွေပြောင်းလဲနိုင်ခြင်း
- **ပူးပေါင်းဆောင်ရွက်နိုင်ခြင်း** - အခြား အေးဂျင့်များနှင့် ပူးပေါင်းဆောင်ရွက်နိုင်ခြင်း (multi-agent စနစ်များ)

ဤလမ်းညွှန်သည် Azure Developer CLI (azd) ကို အသုံးပြု၍ AI အေးဂျင့်များကို Azure သို့ မည်သို့ တင်သွင်းရမည့်နည်းလမ်းကို ပြသသည်။

## သင်ယူရန် ရည်မှန်းချက်များ

ဤလမ်းညွှန်ကို တက်လှမ်းပြီးဖြေဆိုခြင်းအားဖြင့် သင်သည်-
- AI အေးဂျင့်များ ဆိုတာဘာဖြစ်ပြီး chatbot များနှင့် မည်ကွာခြားကြောင်း နားလည်နိုင်မည်
- AZD ကို အသုံးပြု၍ အဆင်သင့် AI အေးဂျင့် သင်သာများကို တင်သွင်းနိုင်မည်
- စိတ်ကြိုက် အေးဂျင့်များအတွက် Foundry Agents ကို ဖန်တီးပြင်ဆင်နိုင်မည်
- အခြေခံ အေးဂျင့် နမူနာပုံစံများ (ကိရိယာ အသုံးပြုမှု၊ RAG, multi-agent) ကို အကောင်အထည်ဖော်နိုင်မည်
- တင်သွင်းပြီးသော အေးဂျင့်များကို မော်နီတာနှင့် ဒီဘပ်ဂ် ပြုလုပ်နိုင်မည်

## သင်ယူပြီး ရရှိမည့် ကျွမ်းကျင်မှုများ

သင်ပြီးစီးပါက သင်သည်-
- တစ်မ.command ကြောင့် Azure သို့ AI အေးဂျင့် အက်ပလီကေးရှင်းများကို တင်သွင်းနိုင်မည်
- အေးဂျင့် ကိရိယာများနှင့် လုပ်ဆောင်နိုင်စွမ်းများကို ဖော်ပြနိုင်မည်
- အေးဂျင့်များ နှင့် RAG (retrieval-augmented generation) ကို အကောင်အထည်ဖော်နိုင်မည်
- ရှုပ်ထွေးသော လုပ်ငန်းစဉ်များအတွက် multi-agent ဗဟိုထွက်ဖွဲ့စည်းမှုများ ဒီဇိုင်းဆွဲနိုင်မည်
- အေးဂျင့် တင်သွင်းခြင်းတွင် ဖြစ်တတ်သော ပြဿနာများကို ပြန်လည် ဖြေရှင်းနိုင်မည်

---

## 🤖 အေးဂျင့်သည် Chatbot ထက် ဘာကြောင့် မတူသနည်း။

| Feature | Chatbot | AI Agent |
|---------|---------|----------|
| **Behavior** | Prompt များကို တုံ့ပြန်သည် | ကိုယ်ပိုင် အလိုအလျောက် လုပ်ဆောင်ချက်များ ဆောင်ရွက်သည် |
| **Tools** | မရှိ | API ခေါ်ဆိုနိုင်၊ ရှာဖွေ၊ ကုဒ် အသုံးပြု ဆောင်ရွက်နိုင်သည် |
| **Memory** | Session အပေါ် မူတည် သာ | Session များအတွင်း နှင့် ကျော်လွန်၍ တည်ငြိမ်သော မှတ်ဉာဏ်ရှိသည် |
| **Planning** | တစ်ချက်တည်းဖြေရှင်းချက် | အဆင့်စုံ ဖြစ်မြင်၍ တုံ့ပြန်သည် |
| **Collaboration** | တစ်ခုတည်းသော အဖွဲ့အစည်း | အခြား အေးဂျင့်များနှင့် ပူးပေါင်း လုပ်ဆောင်နိုင်သည် |

### ရိုးရှင်းသော နှိုင်းယှဉ်ချက်

- **Chatbot** = အချက်အလက် တိုင်ပင်ဌာန၌ မေးခွန်းများကို ဖြေဆိုပေးသည့် ကူညီသူ
- **AI Agent** = ဖုန်းခေါ်ဆို၊ အစည်းအဝေးများ မှာယူ၊ သင့်အတွက် အလုပ်များ ပြီးမြောက်စေသည့် ကိုယ်ပိုင် အကူအညီပေးသူ

---

## 🚀 အလျင်အမြန် စတင်ရန်: သင့်ပထမဆုံး အေးဂျင့်ကို တင်သွင်းခြင်း

### Option 1: Foundry Agents Template (အကြံပြု)

```bash
# AI agent များအတွက် template ကို စတင်အစပြုပါ
azd init --template get-started-with-ai-agents

# Azure သို့ ဖြန့်ချိပါ
azd up
```

**တင်သွင်းမည့် အရာများ:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (RAG အတွက်)
- ✅ Azure Container Apps (web interface)
- ✅ Application Insights (မော်နီတာရေး)

**ချိန်ယူချိန်:** ~15-20 မိနစ်
**ကုန်ကျစရိတ်:** ~$100-150/月 (ဖွံ့ဖြိုးရေး)

### Option 2: OpenAI Agent with Prompty

```bash
# Prompty အခြေပြု အေဂျင့် ပုံစံကို စတင်ပြင်ဆင်ပါ
azd init --template agent-openai-python-prompty

# Azure သို့ တပ်ဆင်ပါ
azd up
```

**တင်သွင်းမည့် အရာများ:**
- ✅ Azure Functions (serverless agent 실행)
- ✅ Azure OpenAI
- ✅ Prompty configuration ဖိုင်များ
- ✅ နမူနာ အေးဂျင့် အကောင်အထည်ဖော်ခြင်း

**ချိန်ယူချိန်:** ~10-15 မိနစ်
**ကုန်ကျစရိတ်:** ~$50-100/月 (ဖွံ့ဖြိုးရေး)

### Option 3: RAG Chat Agent

```bash
# RAG chat template ကို စတင်တည်ထောင်ပါ
azd init --template azure-search-openai-demo

# Azure သို့ ဖြန့်ချိပါ
azd up
```

**တင်သွင်းမည့် အရာများ:**
- ✅ Azure OpenAI
- ✅ Azure AI Search နှင့် နမူနာ ဒေတာ
- ✅ အချက်အလက် စာရွက် တင်သွင်း ပြုစုပျိုးထောင်ခြင်း ပိုင်း
- ✅ ဗီလာစကားပြော အင်တာဖေ့စ်နှင့် ကိုးကားချက်များပါသည့် chat အင်တာဖေ့စ်

**ချိန်ယူချိန်:** ~15-25 မိနစ်
**ကုန်ကျစရိတ်:** ~$80-150/月 (ဖွံ့ဖြိုးရေး)

---

## 🏗️ အေးဂျင့် ဖွဲ့စည်းပုံ ပုံစံများ

### Pattern 1: တစ်ဦးတည်း အေးဂျင့် + ကိရိယာများ

အဓိကအားဖြင့် ရိုးရှင်းဆုံး ပုံစံ — ကိရိယာ အမျိုးမျိုးကို အသုံးပြုနိုင်သည့် တစ်ဦးတည်း အေးဂျင့်။

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

**သင့်တော်သည်:**
- ဖောက်သည် ပံ့ပိုးမှု ဘော့များ
- သုတေသန အကူအညီပေးသူများ
- ဒေတာ သုံးသပ်ရေး အေးဂျင့်များ

**AZD Template:** `azure-search-openai-demo`

### Pattern 2: RAG Agent (Retrieval-Augmented Generation)

တုံ့ပြန်ချက်ထုတ်မည့်မတိုင်မီ သက်ဆိုင်ရာ စာရွက်စာတမ်းများကို ရှာဖွေယူသော အေးဂျင့်။

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

**သင့်တော်သည်:**
- အဖွဲ့အစည်း အခြေခံ ज्ञान စာကြည့်တိုက်များ
- စာရွက် Q&A စနစ်များ
- တရားမဝင်ခြင်းနှင့် ဥပဒေအတွင်း သုတေသန

**AZD Template:** `azure-search-openai-demo`

### Pattern 3: Multi-Agent System

အမြင့် စွမ်းရည် specialized အေးဂျင့်များ အများအပြား ပူးပေါင်း၍ ရှုပ်ထွေးသော အလုပ်များ ဆောင်ရွက်သည်။

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

**သင့်တော်သည်:**
- ရှုပ်ထွေးသော အကြောင်းအရာ ဖန်တီးခြင်း
- အဆင့်စုံ လုပ်ငန်းစဉ်များ
- အတန်းအစား ကွဲပြားသော ကျွမ်းကျင်မှု လိုအပ်သည့် အလုပ်များ

**ပိုမိုလေ့လာရန်:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ အေးဂျင့် ကိရိယာများ ကို ပြင်ဆင်ခြင်း

ကိရိယာများ အသုံးပြုသည့် အခါ အေးဂျင့်များ ပို၍ အာဏာရှိလာသည်။ အသုံးများသော ကိရိယာများကို ပြင်ဆင်သည့်နည်းလမ်းများမှာ -

### Tool Configuration in Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# စိတ်ကြိုက် ကိရိယာများကို သတ်မှတ်ပါ
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

# ကိရိယာများနှင့် အေးဂျင့်တစ်ခု ဖန်တီးပါ
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Environment Configuration

```bash
# အေဂျင့်ဆိုင်ရာ ပတ်ဝန်းကျင်ပြောင်းလဲမှုများကို သတ်မှတ်ပါ
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# အပ်ဒိတ်လုပ်ပြီးသော ဖွဲ့စည်းမှုဖြင့် တပ်ဆင်ပါ
azd deploy
```

---

## 📊 အေးဂျင့် များကို မော်နီတာရေးခြင်း

### Application Insights တစ်စိတ်တစ်ပိုင်းဖြစ်သော ပေါင်းစည်းမှု

AZD အေးဂျင့် နမူနာများအားလုံးသည် မော်နီတာရေးအတွက် Application Insights ကို ထည့်သွင်းထားသည်။

```bash
# စောင့်ကြည့်ရေး ဒက်ရှ်ဘုတ် ဖွင့်ရန်
azd monitor --overview

# တိုက်ရိုက် မှတ်တမ်းများ ကြည့်ရန်
azd monitor --logs

# တိုက်ရိုက် မက်ထရစ်များ ကြည့်ရန်
azd monitor --live
```

### စောင့်ကြည့်ရန် အဓိက Metrics များ

| Metric | ဖော်ပြချက် | ဲလည်ပတ်ရန် ရည်မှန်းချက် |
|--------|-------------|--------|
| Response Latency | တုံ့ပြန်ချက် ထုတ်ပေးရန် ကြာချိန် | < 5 seconds |
| Token Usage | တောင်းဆိုမှုတစ်ခုချင်းစီ အတွက် Token များ | ကုန်ကျစရိတ်အတွက် စောင့်ကြည့်ရန် |
| Tool Call Success Rate | ကိရိယာ ခေါ်ဆိုမှု အောင်မြင်မှု ရာခိုင်နှုန်း | > 95% |
| Error Rate | မအောင်မြင်သော အေးဂျင့် တောင်းဆိုမှုများ | < 1% |
| User Satisfaction | အသုံးပြုသူ တုံ့ပြန်ချက် အဆင့်ပြတ် | > 4.0/5.0 |

### အေးဂျင့်များအတွက် အထူး မှတ်တမ်းတင်မှု

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

## 💰 ကုန်ကျစရိတ်ဆိုင်ရာ အစဉ်အမြဲ

### ပုံစံအလိုက် ခန့်မှန်း လစဉ်ကုန်ကျစရိတ်

| Pattern | Dev Environment | Production |
|---------|-----------------|------------|
| Single Agent | $50-100 | $200-500 |
| RAG Agent | $80-150 | $300-800 |
| Multi-Agent (2-3 agents) | $150-300 | $500-1,500 |
| Enterprise Multi-Agent | $300-500 | $1,500-5,000+ |

### ကုန်ကျစရိတ် ထိန်းသိမ်းနည်းများ

1. **ရိုးရှင်းသော အလုပ်များအတွက် GPT-4o-mini ကို အသုံးပြုပါ**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **ထပ်မံ မေးခွန်းများအတွက် caching ကို အကောင်အထည်ဖော်ပါ**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Token ကန့်သတ်ချက်များ သတ်မှတ်ပါ**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # တုံ့ပြန်ချက်၏ အရှည်ကို ကန့်သတ်ပါ
   )
   ```

4. **အသုံးမပြုသည့် အချိန်တွင် scale to zero သို့ ရောက်စေပါ**
   ```bash
   # Container Apps များသည် အလုပ်မရှိသောအချိန်များတွင် အလိုအလျောက် သုညအထိ အရွယ်အစား လျော့သွားနိုင်သည်
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 အေးဂျင့် ပြသာနာ ဖြေရှင်းခြင်း

### အသုံးများသော ပြဿနာများနှင့် ဖြေရှင်းနည်းများ

<details>
<summary><strong>❌ အေးဂျင့်သည် ကိရိယာ ခေါ်ဆိုမှုများကို မတုံ့ပြန်ခြင်း</strong></summary>

```bash
# ကိရိယာများကို မှန်ကန်စွာ မှတ်ပုံတင်ထားကြောင်း စစ်ဆေးပါ
azd show

# OpenAI ဖြန့်ချိမှုကို အတည်ပြုပါ
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# အေဂျင့်မှတ်တမ်းများကို စစ်ဆေးပါ
azd monitor --logs
```

**ရိုးရှင်းသော အကြောင်းရင်းများ:**
- Tool function signature မကိုက်ညီခြင်း
- လိုအပ်သော ခွင့်ပြုချက်များ မရှိခြင်း
- API endpoint သို့ ဝင်ရောက် မရနိုင်ခြင်း
</details>

<details>
<summary><strong>❌ အေးဂျင့် တုံ့ပြန်မှုများတွင် နှောင့်နှေးမှု မြင့်မားခြင်း</strong></summary>

```bash
# Application Insights ကို စွမ်းဆောင်ရည် ကန့်သတ်ချက်များအတွက် စစ်ဆေးပါ
azd monitor --live

# ပိုမိုလျင်မြန်သော မော်ဒယ်ကို အသုံးပြုရန် စဉ်းစားပါ
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**မြှင့်တင်ရန် အကြံပြုချက်များ:**
- Streaming responses ကို အသုံးပြုပါ
- ဖြေချင်ချက်များအတွက် caching ကို အကောင်အထည်ဖော်ပါ
- context window အရွယ်အစား လျော့ပါ
</details>

<details>
<summary><strong>❌ အေးဂျင့်မှ မှားယွင်း သို့မဟုတ် hallucination အချက်အလက် ပြန်လည်ပေးခြင်း</strong></summary>

```python
# ပိုမိုကောင်းမွန်သော စနစ် အချက်ပေးစာသားများဖြင့် တိုးတက်စေပါ
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# အခြေခံခြင်းအတွက် အချက်အလက် ရယူမှုကို ထည့်ပါ
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # တုံ့ပြန်ချက်များကို စာရွက်စာတမ်းများတွင် အခြေခံပါ
)
```
</details>

<details>
<summary><strong>❌ Token ကန့်သတ်ချက် ကျော်လွန်ပြီး ဖြစ်သော အမှားများ</strong></summary>

```python
# ဆက်စပ်အကြောင်းအရာ ပြတင်းပေါက် စီမံခန့်ခွဲမှုကို အကောင်အထည်ဖော်ပါ
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # ကြမ်းတမ်း ခန့်မှန်းချက်
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 လက်တွေ့ လေ့ကျင့်ခန်းများ

### Exercise 1: မူလ အေးဂျင့် တင်သွင်းခြင်း (20 မိနစ်)

**ရည်ရွယ်ချက်:** AZD ကို အသုံးပြု၍ သင့် ပထမဆုံး AI အေးဂျင့်ကို တင်သွင်းရန်

```bash
# အဆင့် 1: ပုံစံကို စတင်ပြင်ဆင်ပါ
azd init --template get-started-with-ai-agents

# အဆင့် 2: Azure သို့ လော့ဂ်အင် ဝင်ပါ
azd auth login

# အဆင့် 3: တပ်ဆင်ပါ
azd up

# အဆင့် 4: အေးဂျင့်ကို စမ်းသပ်ပါ
# အထွက်တွင် ပြထားသော URL ကို ဖွင့်ပါ

# အဆင့် 5: ရှင်းလင်းလုပ်ဆောင်ပါ
azd down --force --purge
```

**အောင်မြင်မှု အခြေအနေများ:**
- [ ] အေးဂျင့်သည် မေးခွန်းများကို တုံ့ပြန်သည်
- [ ] မော်နီတာ ပြတင်းပေါက်ကို ဝင်ရောက်ကြည့်ရှုနိုင်သည်
- [ ] ရင်းနုန်းများကို သန့်ရှင်းစွာ ဖျက်သိမ်းနိုင်သည်

### Exercise 2: စိတ်ကြိုက် ကိရိယာ ထည့်သွင်းခြင်း (30 မိနစ်)

**ရည်ရွယ်ချက်:** အေးဂျင့်တစ်ခုကို စိတ်ကြိုက် ကိရိယာဖြင့် တိုးချဲ့ရန်

1. Agent အား template ဖြင့် တင်သွင်းပါ
2. ကိရိယာ လုပ်ဆောင်ချက် အသစ်တစ်ခု ဖန်တီးပါ:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # ရာသီဥတု ဝန်ဆောင်မှုသို့ API ခေါ်ယူခြင်း
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. ကိရိယာကို အေးဂျင့်နှင့် မှတ်ပုံတင်ပါ
4. အေးဂျင့်က အသစ်ထည့်ထားသော ကိရိယာကို အသုံးပြုကြောင်း စမ်းသပ်ပါ

**အောင်မြင်မှု အခြေအနေများ:**
- [ ] မိုးလေဝသ ဆိုင်ရာ မေးခွန်းများကို အေးဂျင့် မှ သိရှိနိုင်သည်
- [ ] ကိရိယာကို မှန်ကန်စွာ ခေါ်ဆိုနေသည်
- [ ] တုံ့ပြန်ချက်တွင် မိုးလေဝသ သတင်းအချက်အလက် ပါဝင်သည်

### Exercise 3: RAG အေးဂျင့် တည်ဆောက်ခြင်း (45 မိနစ်)

**ရည်ရွယ်ချက်:** သင့်စာရွက်စာတမ်းများမှ မေးခွန်းများကို ဖြေရှင်းနိုင်သည့် အေးဂျင့် တည်ဆောက်ရန်

```bash
# RAG နမူနာကို တပ်ဆင်ပါ
azd init --template azure-search-openai-demo
azd up

# သင့်စာရွက်စာတမ်းများကို တင်ပါ
# (နမူနာ၏ ဒေတာ စုပ်ယူခြင်း လမ်းညွှန်ကို လိုက်နာပါ)

# နယ်ပယ်-ဆိုင်ရာ မေးခွန်းများဖြင့် စမ်းသပ်ပါ
```

**အောင်မြင်မှု အခြေအနေများ:**
- [ ] အေးဂျင့်သည် တင်ထားသော စာရွက်များမှ ဖြေဆိုနိုင်သည်
- [ ] တုံ့ပြန်ချက်များတွင် ကိုးကားချက်များ ပါဝင်သည်
- [ ] မသက်ဆိုင်သော မေးခွန်းများတွင် hallucination မဖြစ်စေခြင်း

---

## 📚 နောက်တိုးလမ်းများ

AI အေးဂျင့်များကို နားလည်ပြီးဖြစ်သောအခါ အောက်ပါ အဆင့်မြင့်အကြောင်းအရာများကို စူးစမ်းပါ။

| Topic | ဖော်ပြချက် | Link |
|-------|-------------|------|
| **Multi-Agent Systems** | အေးဂျင့် အများကို ပူးပေါင်းပြီး စနစ်တကျ တည်ဆောက်ခြင်း | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Coordination Patterns** | အစီအစဉ်နှင့် ဆက်သွယ်ရေး ပုံစံများကို လေ့လာပါ | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Production Deployment** | အဖွဲ့အစည်းအသုံးအေဆောင် အဆင့် ရောက်သော အေးဂျင့် တင်ပို့ခြင်း | [Production AI Practices](production-ai-practices.md) |
| **Agent Evaluation** | အေးဂျင့် စွမ်းဆောင်ရည် အကိုးအထား စမ်းသပ်ခြင်း | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 အပိုဆောင်း ရင်းမြစ်များ

### တရားဝင် စာတမ်း
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD အေးဂျင့် အတွက် Templates
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### အဖွဲ့အစည်း သတင်းအချက်အလက်များ
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**လမ်းကြောင်း ညွှန်:** 
- **ယခင် သင်ခန်းစာ**: [AI မော်ဒယ် တင်ပို့ခြင်း](ai-model-deployment.md)
- **နောက်တစ်ခု သင်ခန်းစာ**: [ထုတ်လုပ်ရေး AI လုပ်ထုံးလုပ်နည်းများ](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
တာဝန်မယူခြင်း (Disclaimer):

ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းဆောင်ရွက်သော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါရှိနိုင်သည်ကို ကျေးဇူးပြု၍ သတိပြုပါ။ မူလဘာသာဖြင့် ရေးသားထားသော မူရင်းစာတမ်းကို တရားဝင် အရင်းအမြစ်အဖြစ် ယူဆရန် အကြံပြုပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် ကျွမ်းကျင်သော လူသား ဘာသာပြန်ကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်နိုင်သည့် နားမလည်မှုများ သို့မဟုတ် မမှန်ကန်သော ဖော်ပြချက်များအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->