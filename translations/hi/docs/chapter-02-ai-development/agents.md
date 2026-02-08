# AI Agents with Azure Developer CLI

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Practices](production-ai-practices.md)
- **🚀 Advanced**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## Introduction

AI एजेंट autonome प्रोग्राम हैं जो अपने वातावरण का अवलोकन कर सकते हैं, निर्णय ले सकते हैं, और विशिष्ट लक्ष्यों को प्राप्त करने के लिए कार्रवाई कर सकते हैं। सरल चैटबॉट्स जो प्रॉम्प्ट्स का उत्तर देते हैं उनसे अलग, एजेंट कर सकते हैं:

- **टूल्स का उपयोग करें** - APIs कॉल करना, डेटाबेस खोजना, कोड निष्पादित करना
- **योजना और तर्क करें** - जटिल कार्यों को चरणों में विभाजित करना
- **संदर्भ से सीखें** - मेमोरी बनाए रखना और व्यवहार अनुकूलित करना
- **सहयोग करें** - अन्य एजेंटों के साथ काम करना (मल्टी-एजेंट सिस्टम)

यह गाइड दिखाता है कि Azure Developer CLI (azd) का उपयोग करके Azure पर AI एजेंट कैसे तैनात करें।

## Learning Goals

इस गाइड को पूरा करने पर, आप:
- यह समझेंगे कि AI एजेंट क्या हैं और वे चैटबॉट्स से कैसे अलग हैं
- AZD का उपयोग करके पूर्व-निर्मित AI एजेंट टेम्पलेट्स तैनात करेंगे
- कस्टम एजेंट्स के लिए Foundry Agents को कॉन्फ़िगर करेंगे
- बुनियादी एजेंट पैटर्न (टूल उपयोग, RAG, मल्टी-एजेंट) लागू करेंगे
- तैनात एजेंटों की निगरानी और डिबग करना सीखेंगे

## Learning Outcomes

पूरा करने पर, आप सक्षम होंगे:
- एक कमांड से Azure पर AI एजेंट एप्लिकेशन तैनात करना
- एजेंट टूल्स और क्षमताओं को कॉन्फ़िगर करना
- एजेंट्स के साथ retrieval-augmented generation (RAG) लागू करना
- जटिल वर्कफ़्लो के लिए मल्टी-एजेंट आर्किटेक्चर डिजाइन करना
- सामान्य एजेंट तैनाती समस्याओं का निवारण करना

---

## 🤖 What Makes an Agent Different from a Chatbot?

| Feature | Chatbot | AI Agent |
|---------|---------|----------|
| **Behavior** | प्रॉम्प्ट्स का उत्तर देता है | स्वायत्त कार्य करता है |
| **Tools** | कोई नहीं | API कॉल कर सकता है, खोज कर सकता है, कोड चला सकता है |
| **Memory** | केवल सेशन-आधारित | सेशनों में स्थायी मेमोरी |
| **Planning** | एकल उत्तर | बहु-चरण तर्क |
| **Collaboration** | एक इकाई | अन्य एजेंटों के साथ काम कर सकता है |

### Simple Analogy

- **Chatbot** = एक सूचना डेस्क पर प्रश्नों का उत्तर देने वाला सहायक व्यक्ति
- **AI Agent** = एक व्यक्तिगत सहायक जो कॉल कर सकता है, अपॉइंटमेंट बुक कर सकता है, और आपके लिए कार्य पूरा कर सकता है

---

## 🚀 Quick Start: Deploy Your First Agent

### Option 1: Foundry Agents Template (Recommended)

```bash
# एआई एजेंटों का टेम्पलेट प्रारंभ करें
azd init --template get-started-with-ai-agents

# Azure पर तैनात करें
azd up
```

**क्या तैनात होता है:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (RAG के लिए)
- ✅ Azure Container Apps (वेब इंटरफ़ेस)
- ✅ Application Insights (निगरानी)

**समय:** ~15-20 मिनट
**लागत:** ~$100-150/माह (डेवलपमेंट)

### Option 2: OpenAI Agent with Prompty

```bash
# Prompty-आधारित एजेंट टेम्पलेट को आरंभ करें
azd init --template agent-openai-python-prompty

# Azure पर तैनात करें
azd up
```

**क्या तैनात होता है:**
- ✅ Azure Functions (सर्वरलेस एजेंट निष्पादन)
- ✅ Azure OpenAI
- ✅ Prompty कॉन्फ़िगरेशन फाइलें
- ✅ सैंपल एजेंट इम्प्लीमेंटेशन

**समय:** ~10-15 मिनट
**लागत:** ~$50-100/माह (डेवलपमेंट)

### Option 3: RAG Chat Agent

```bash
# RAG चैट टेम्पलेट को आरंभ करें
azd init --template azure-search-openai-demo

# Azure पर तैनात करें
azd up
```

**क्या तैनात होता है:**
- ✅ Azure OpenAI
- ✅ Azure AI Search सैंपल डेटा के साथ
- ✅ दस्तावेज़ प्रोसेसिंग पाइपलाइन
- ✅ संदर्भों के साथ चैट इंटरफ़ेस

**समय:** ~15-25 मिनट
**लागत:** ~$80-150/माह (डेवलपमेंट)

---

## 🏗️ Agent Architecture Patterns

### Pattern 1: Single Agent with Tools

सबसे सरल एजेंट पैटर्न - एक एजेंट जो कई टूल्स का उपयोग कर सकता है।

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

**सबसे उपयुक्त के लिए:**
- कस्टमर सपोर्ट बॉट्स
- रिसर्च असिस्टेंट
- डेटा विश्लेषण एजेंट्स

**AZD Template:** `azure-search-openai-demo`

### Pattern 2: RAG Agent (Retrieval-Augmented Generation)

एक एजेंट जो उत्तर उत्पन्न करने से पहले संबंधित दस्तावेज़ पुनः प्राप्त करता है।

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

**सबसे उपयुक्त के लिए:**
- एंटरप्राइज़ नॉलेज बेस
- दस्तावेज़ Q&A सिस्टम
- अनुपालन और कानूनी शोध

**AZD Template:** `azure-search-openai-demo`

### Pattern 3: Multi-Agent System

कई विशिष्ट एजेंट जटिल कार्यों पर मिलकर काम करते हैं।

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

**सबसे उपयुक्त के लिए:**
- जटिल सामग्री निर्माण
- बहु-चरण वर्कफ़्लो
- ऐसे कार्य जिनके लिए अलग-अलग विशेषज्ञता की आवश्यकता हो

**Learn More:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Configuring Agent Tools

एजेंट्स तब शक्तिशाली बनते हैं जब वे टूल्स का उपयोग कर सकते हैं। यहाँ सामान्य टूल्स को कॉन्फ़िगर करने का तरीका है:

### Tool Configuration in Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# कस्टम उपकरण परिभाषित करें
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

# उपकरणों के साथ एजेंट बनाएँ
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Environment Configuration

```bash
# एजेंट-विशिष्ट पर्यावरण चर सेट करें
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# अद्यतन विन्यास के साथ तैनात करें
azd deploy
```

---

## 📊 Monitoring Agents

### Application Insights Integration

सभी AZD एजेंट टेम्पलेट्स निगरानी के लिए Application Insights शामिल करते हैं:

```bash
# मॉनिटरिंग डैशबोर्ड खोलें
azd monitor --overview

# लाइव लॉग देखें
azd monitor --logs

# लाइव मेट्रिक्स देखें
azd monitor --live
```

### ट्रैक करने के लिए प्रमुख मीट्रिक्स

| Metric | Description | Target |
|--------|-------------|--------|
| Response Latency | प्रतिक्रिया उत्पन्न करने का समय | < 5 seconds |
| Token Usage | प्रति अनुरोध टोकन | लागत के लिए निगरानी करें |
| Tool Call Success Rate | % सफल टूल निष्पादन | > 95% |
| Error Rate | विफल एजेंट अनुरोध | < 1% |
| User Satisfaction | प्रतिक्रिया स्कोर | > 4.0/5.0 |

### एजेंट्स के लिए कस्टम लॉगिंग

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

## 💰 Cost Considerations

### Estimated Monthly Costs by Pattern

| Pattern | Dev Environment | Production |
|---------|-----------------|------------|
| Single Agent | $50-100 | $200-500 |
| RAG Agent | $80-150 | $300-800 |
| Multi-Agent (2-3 agents) | $150-300 | $500-1,500 |
| Enterprise Multi-Agent | $300-500 | $1,500-5,000+ |

### Cost Optimization Tips

1. **सरल कार्यों के लिए GPT-4o-mini का उपयोग करें**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **दोहराए गए प्रश्नों के लिए कैशिंग लागू करें**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **टोकन सीमाएँ सेट करें**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # प्रतिक्रिया की लंबाई सीमित करें
   )
   ```

4. **जब उपयोग में न हो तो शून्य पर स्केल करें**
   ```bash
   # कंटेनर ऐप्स स्वचालित रूप से शून्य तक स्केल होते हैं
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Troubleshooting Agents

### Common Issues and Solutions

<details>
<summary><strong>❌ एजेंट टूल कॉल्स का उत्तर नहीं दे रहा</strong></summary>

```bash
# जाँचें कि उपकरण सही तरीके से पंजीकृत हैं
azd show

# OpenAI तैनाती सत्यापित करें
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# एजेंट लॉग्स जाँचें
azd monitor --logs
```

**सामान्य कारण:**
- टूल फ़ंक्शन सिग्नेचर का मिलान न होना
- आवश्यक अनुमतियों का अभाव
- API endpoint पहुँचा नहीं जा सकता
</details>

<details>
<summary><strong>❌ एजेंट प्रतिक्रियाओं में उच्च विलंबता</strong></summary>

```bash
# Application Insights में बॉटलनेक्स के लिए जांच करें
azd monitor --live

# तेज़ मॉडल का उपयोग करने पर विचार करें
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**अनुकूलन सुझाव:**
- स्ट्रीमिंग प्रतिक्रियाओं का उपयोग करें
- प्रतिक्रिया कैशिंग लागू करें
- संदर्भ विंडो का आकार घटाएँ
</details>

<details>
<summary><strong>❌ एजेंट गलत या हॉलुसिनेटेड जानकारी लौटा रहा है</strong></summary>

```python
# बेहतर सिस्टम प्रॉम्प्ट्स के साथ सुधार करें
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# ग्राउंडिंग के लिए पुनःप्राप्ति जोड़ें
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # प्रतिक्रियाओं को दस्तावेज़ों के आधार पर बनाएँ
)
```
</details>

<details>
<summary><strong>❌ टोकन सीमा से अधिक त्रुटियाँ</strong></summary>

```python
# संदर्भ विंडो प्रबंधन को लागू करें
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # मोटा अनुमान
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Hands-On Exercises

### Exercise 1: Deploy a Basic Agent (20 minutes)

**Goal:** AZD का उपयोग करके अपना पहला AI एजेंट तैनात करें

```bash
# चरण 1: टेम्पलेट प्रारंभ करें
azd init --template get-started-with-ai-agents

# चरण 2: Azure में लॉगिन करें
azd auth login

# चरण 3: तैनात करें
azd up

# चरण 4: एजेंट का परीक्षण करें
# आउटपुट में दिखाए गए URL को खोलें

# चरण 5: साफ़ करें
azd down --force --purge
```

**सफलता मानदंड:**
- [ ] एजेंट प्रश्नों का उत्तर देता है
- [ ] मॉनिटरिंग डैशबोर्ड तक पहुँच सकता है
- [ ] संसाधन सफलतापूर्वक क्लीनअप हो गए हैं

### Exercise 2: Add a Custom Tool (30 minutes)

**Goal:** एक एजेंट को एक कस्टम टूल के साथ विस्तृत करें

1. एजेंट टेम्पलेट तैनात करें
2. एक नया टूल फ़ंक्शन बनाएं:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # मौसम सेवा के लिए API कॉल
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. एजेंट के साथ टूल पंजीकृत करें
4. परीक्षण करें कि एजेंट नया टूल उपयोग करता है

**सफलता मानदंड:**
- [ ] एजेंट मौसम-संबंधी प्रश्नों को पहचानता है
- [ ] टूल सही तरीके से कॉल किया गया है
- [ ] प्रतिक्रिया में मौसम की जानकारी शामिल है

### Exercise 3: Build a RAG Agent (45 minutes)

**Goal:** एक ऐसा एजेंट बनाएं जो आपके दस्तावेज़ों से प्रश्नों का उत्तर दे

```bash
# RAG टेम्पलेट तैनात करें
azd init --template azure-search-openai-demo
azd up

# अपनी दस्तावेज़ें अपलोड करें
# (टेम्पलेट की डेटा इनजेशन मार्गदर्शिका का पालन करें)

# डोमेन-विशिष्ट प्रश्नों के साथ परीक्षण करें
```

**सफलता मानदंड:**
- [ ] एजेंट अपलोड किए गए दस्तावेज़ों से उत्तर देता है
- [ ] उत्तरों में उद्धरण शामिल हैं
- [ ] क्षेत्राधारित प्रश्नों पर कोई हॉलुसिनेशन नहीं

---

## 📚 Next Steps

अब जब आप AI एजेंटों को समझ गए हैं, इन उन्नत विषयों का अन्वेषण करें:

| Topic | Description | Link |
|-------|-------------|------|
| **Multi-Agent Systems** | कई सहयोगी एजेंटों के साथ सिस्टम बनाना | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Coordination Patterns** | ऑर्केस्ट्रेशन और संचार पैटर्न सीखें | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Production Deployment** | एंटरप्राइज़-तैयार एजेंट तैनाती | [Production AI Practices](production-ai-practices.md) |
| **Agent Evaluation** | एजेंट प्रदर्शन का परीक्षण और मूल्यांकन करें | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Additional Resources

### Official Documentation
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD Templates for Agents
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Community Resources
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigation**
- **Previous Lesson**: [AI Model Deployment](ai-model-deployment.md)
- **Next Lesson**: [Production AI Practices](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान रखें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल भाषा में उपलब्ध दस्तावेज़ को प्राधिकृत स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->