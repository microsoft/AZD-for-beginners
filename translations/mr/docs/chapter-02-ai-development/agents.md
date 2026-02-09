# AI एजंट्स with Azure Developer CLI

**Chapter Navigation:**
- **📚 Course Home**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 Current Chapter**: अध्याय 2 - एआय-प्रथम विकास
- **⬅️ Previous**: [AI मॉडेल डिप्लॉयमेंट](ai-model-deployment.md)
- **➡️ Next**: [उत्पादन-स्तरावरील AI पद्धती](production-ai-practices.md)
- **🚀 Advanced**: [बहु-एजंट समाधान](../../examples/retail-scenario.md)

---

## परिचय

एआय एजंट्स स्वायत्त प्रोग्राम आहेत जे त्यांच्या वातावरणाचे निरीक्षण करू शकतात, निर्णय घेऊ शकतात आणि विशिष्ट लक्ष्ये साध्य करण्यासाठी क्रिया घेऊ शकतात. साध्या चॅटबॉट्सपेक्षा जे प्रॉम्प्टांना प्रतिसाद देतात, एजंट्स खालील गोष्टी करू शकतात:

- **साधने वापरतात** - APIs कॉल करणे, डेटाबेस शोधणे, कोड कार्यान्वित करणे
- **योजना बनवतात आणि विचार करतात** - जटिल कार्यांना टप्प्यात विभागणे
- **संदर्भातून शिकतात** - स्मृती राखणे आणि वर्तन अनुकूल करणे
- **सहकार्य करतात** - इतर एजंट्ससोबत काम करणे (मल्टी-एजंट सिस्टम)

हा मार्गदर्शक तुम्हाला Azure वर Azure Developer CLI (azd) वापरून एआय एजंट कसे तैनात करायचे ते दाखवतो.

## शिकण्याचे उद्दिष्ट

हा मार्गदर्शक पूर्ण केल्यावर, तुम्ही:
- एआय एजंट काय असतात आणि ते चॅटबॉट्सपासून कसे वेगळे आहेत हे समजून घ्याल
- AZD वापरून पूर्व-निर्मित एआय एजंट टेम्पलेट्स तैनात कराल
- कस्टम एजंटसाठी Foundry Agents कॉन्फिगर कराल
- मूलभूत एजंट पॅटर्न्स (साधन वापर, RAG, मल्टी-एजंट) अंमलात आणाल
- तैनात केलेले एजंट मॉनिटर आणि डीबग कराल

## शिकण्याचे अपेक्षित निकाल

पूर्ण झाल्यावर, तुम्ही सक्षम असाल:
- एकाच कमांडने एआय एजंट अनुप्रयोग Azure वर तैनात करणे
- एजंट साधने आणि क्षमता कॉन्फिगर करणे
- एजंटसह retrieval-augmented generation (RAG) अंमलात आणणे
- जटिल वर्कफ्लोसाठी मल्टी-एजंट आर्किटेक्चर डिझाइन करणे
- सामान्य एजंट तैनाती समस्या निवारण करणे

---

## 🤖 एजंट आणि चॅटबॉटमध्ये काय फरक आहे?

| वैशिष्ट्य | चॅटबॉट | एआय एजंट |
|---------|---------|----------|
| **वर्तन** | प्रॉम्प्टला प्रतिसाद देतो | स्वायत्त क्रिया करतो |
| **साधने** | नाही | APIs कॉल करू शकतो, शोध करू शकतो, कोड चालवू शकतो |
| **स्मृती** | फक्त सत्र-आधारित | सत्रांमधील कायमस्वरूपी स्मृती |
| **नियोजन** | एकल प्रतिसाद | बहु-टप्प्यांमध्ये विचारपूर्वक निर्णय |
| **सहकार्य** | एकक घटक | इतर एजंट्ससोबत काम करू शकतो |

### साधे रूपक

- **चॅटबॉट** = माहिती डेस्कवर प्रश्नांची उत्तरे देणारा एक मदत करणारा कर्मचारी
- **एआय एजंट** = एक वैयक्तिक सहाय्यक जो कॉल करू शकतो, अपॉइंटमेंट बुक करू शकतो, आणि तुमच्यासाठी कार्य पूर्ण करू शकतो

---

## 🚀 जलद प्रारंभ: तुमचा पहिला एजंट तैनात करा

### पर्याय 1: Foundry Agents टेम्पलेट (शिफारस केलेले)

```bash
# एआय एजंट्स साचा प्रारंभ करा
azd init --template get-started-with-ai-agents

# Azure वर तैनात करा
azd up
```

**जे तैनात केले जाते:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (RAG साठी)
- ✅ Azure Container Apps (वेब इंटरफेस)
- ✅ Application Insights (मॉनिटरिंग)

**वेळ:** ~15-20 मिनिटे
**खर्च:** ~$100-150/महिना (विकास)

### पर्याय 2: Prompty सह OpenAI Agent

```bash
# Prompty-आधारित एजंट टेम्पलेट प्रारंभ करा
azd init --template agent-openai-python-prompty

# Azure वर तैनात करा
azd up
```

**जे तैनात केले जाते:**
- ✅ Azure Functions (सर्व्हरलेस एजंट अंमलबजावणी)
- ✅ Azure OpenAI
- ✅ Prompty कॉन्फिगरेशन फाईल्स
- ✅ सॅम्पल एजंट अंमलबजावणी

**वेळ:** ~10-15 मिनिटे
**खर्च:** ~$50-100/महिना (विकास)

### पर्याय 3: RAG चॅट एजंट

```bash
# RAG चॅट साचा प्रारंभ करा
azd init --template azure-search-openai-demo

# Azure वर तैनात करा
azd up
```

**जे तैनात केले जाते:**
- ✅ Azure OpenAI
- ✅ Azure AI Search सॅम्पल डेटासह
- ✅ कागदपत्र प्रक्रिया पाइपलाइन
- ✅ संदर्भासहित चॅट इंटरफेस

**वेळ:** ~15-25 मिनिटे
**खर्च:** ~$80-150/महिना (विकास)

---

## 🏗️ एजंट आर्किटेक्चर पॅटर्न्स

### पॅटर्न 1: साधा एजंट सध्या साधनेसह

सर्वात सोपा एजंट पॅटर्न - एक एजंट जो अनेक साधने वापरू शकतो.

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

**योग्य आहे:**
- ग्राहक समर्थन बॉट्स
- संशोधन सहाय्यक
- डेटा विश्लेषण एजंट्स

**AZD Template:** `azure-search-openai-demo`

### पॅटर्न 2: RAG एजंट (Retrieval-Augmented Generation)

एक एजंट जो प्रतिसाद देण्यापूर्वी संबंधित दस्तऐवज प्राप्त करतो.

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

**योग्य आहे:**
- एंटरप्राइझ नॉलेज बेस
- दस्तऐवज Q&A सिस्टम्स
- अनुपालन आणि कायदेशीर संशोधन

**AZD Template:** `azure-search-openai-demo`

### पॅटर्न 3: मल्टी-एजंट सिस्टम

जटिल कार्यांवर एकत्र काम करणारे अनेक विशेष एजंट्स.

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

**योग्य आहे:**
- जटिल सामग्री निर्मिती
- बहु-टप्प्यांचे वर्कफ्लो
- विविध कौशल्यांची आवश्यकता असलेली कामे

**अधिक जाणून घ्या:** [बहु-एजंट समन्वय पॅटर्न्स](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ एजंट साधने कॉन्फिगर करणे

एजंट्स साधने वापरू शकतात तेव्हाच शक्तिशाली बनतात. सामान्य साधने कशी कॉन्फिगर करायची ते येथे आहे:

### Foundry Agents मध्ये साधन कॉन्फिगरेशन

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# सानुकूल साधने परिभाषित करा
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

# साधनांसह एजंट तयार करा
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### पर्यावरण कॉन्फिगरेशन

```bash
# एजंटसाठी विशिष्ट पर्यावरण चल सेट करा
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# अद्ययावत कॉन्फिगरेशनसह तैनात करा
azd deploy
```

---

## 📊 एजंट्सचे मॉनिटरिंग

### Application Insights एकत्रीकरण

सर्व AZD एजंट टेम्पलेट्समध्ये मॉनिटरिंगसाठी Application Insights समाविष्ट आहे:

```bash
# मॉनिटरिंग डॅशबोर्ड उघडा
azd monitor --overview

# थेट लॉग पहा
azd monitor --logs

# थेट मेट्रिक्स पहा
azd monitor --live
```

### ट्रॅक करण्यासाठी प्रमुख मेट्रिक्स

| मेट्रिक | वर्णन | लक्ष्य |
|--------|-------------|--------|
| प्रतिसाद विलंब | प्रतिसाद तयार करण्याचा वेळ | < 5 सेकंद |
| टोकन वापर | प्रत्येक विनंतीसाठी टोकन्स | खर्चासाठी मॉनिटर करा |
| साधन कॉल यश दर | यशस्वी साधन अंमलबजावण्या टक्केवारी | > 95% |
| त्रुटी दर | अयशस्वी एजंट विनंत्या | < 1% |
| वापरकर्ता समाधान | अभिप्राय गुण | > 4.0/5.0 |

### एजंट्ससाठी कस्टम लॉगिंग

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

## 💰 खर्च विचार

### पॅटर्ननुसार अंदाजित मासिक खर्च

| पॅटर्न | विकास वातावरण | उत्पादन |
|---------|-----------------|------------|
| Single Agent | $50-100 | $200-500 |
| RAG Agent | $80-150 | $300-800 |
| Multi-Agent (2-3 agents) | $150-300 | $500-1,500 |
| Enterprise Multi-Agent | $300-500 | $1,500-5,000+ |

### खर्च कमी करण्याच्या टिपा

1. **साध्या कामांसाठी GPT-4o-mini वापरा**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **पुन्हा विचारांमध्ये कॅशिंग अंमलात आणा**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **टोकन मर्यादा सेट करा**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # प्रतिसादाची लांबी मर्यादित करा
   )
   ```

4. **वापर नसताना स्केल टू झिरो करा**
   ```bash
   # Container Apps आपोआप शून्यावर स्केल होतात
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 एजंट्सचे तांत्रिक निवारण

### सामान्य समस्या आणि उपाय

<details>
<summary><strong>❌ साधन कॉल्सना एजंट प्रतिसाद देत नाही</strong></summary>

```bash
# साधने योग्यरित्या नोंदणीकृत आहेत का ते तपासा
azd show

# OpenAI तैनातीची पडताळणी करा
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# एजंटचे लॉग तपासा
azd monitor --logs
```

**सामान्य कारणे:**
- साधन फंक्शन सिग्नेचर जुळत नाही
- आवश्यक परवानग्या गायब आहेत
- API एンドपॉईंट प्रवेशयोग्य नाही
</details>

<details>
<summary><strong>❌ एजंट प्रतिसादांमध्ये उच्च विलंब</strong></summary>

```bash
# Application Insights मध्ये बॉटलनेक्स तपासा
azd monitor --live

# जलद मॉडेल वापरण्याचा विचार करा
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**ऑप्टिमायझेशन टिप्स:**
- स्ट्रीमिंग प्रतिसाद वापरा
- प्रतिसाद कॅशिंग अंमलात आणा
- संदर्भ विंडोचा आकार कमी करा
</details>

<details>
<summary><strong>❌ एजंट चुकीची किंवा हॅलुसिनेट केलेली माहिती परत करतो</strong></summary>

```python
# चांगल्या सिस्टम प्रॉम्प्टसह सुधारणा करा
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# उत्तरांना आधार देण्यासाठी पुनर्प्राप्ती जोडा
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # उत्तरांना दस्तऐवजांवर आधारित करा
)
```
</details>

<details>
<summary><strong>❌ टोकन मर्यादा ओलांडली म्हणून त्रुटी</strong></summary>

```python
# संदर्भ विंडोचे व्यवस्थापन राबवा
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # कच्चा अंदाज
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 प्रायोगिक सराव

### सराव 1: मूलभूत एजंट तैनात करा (20 मिनिटे)

**उद्दिष्ट:** AZD वापरून तुमचा पहिला एआय एजंट तैनात करा

```bash
# पाऊल 1: टेम्पलेट प्रारंभ करा
azd init --template get-started-with-ai-agents

# पाऊल 2: Azure मध्ये लॉगिन करा
azd auth login

# पाऊल 3: तैनात करा
azd up

# पाऊल 4: एजंटची चाचणी करा
# आउटपुटमधील URL उघडा

# पाऊल 5: साफसफाई करा
azd down --force --purge
```

**यश निकष:**
- [ ] एजंट प्रश्नांना उत्तर देतो
- [ ] मॉनिटरिंग डॅशबोर्डमध्ये प्रवेश करू शकतो
- [ ] संसाधने यशस्वीरित्या स्वच्छ केली गेली

### सराव 2: एक कस्टम साधन जोडा (30 मिनिटे)

**उद्दिष्ट:** एजंटमध्ये कस्टम साधन जोडा

1. एजंट टेम्पलेट तैनात करा
2. नवीन साधन फंक्शन तयार करा:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # हवामान सेवेसाठी API कॉल
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. एजंटसोबत साधन नोंदणी करा
4. साधन एजंटने वापरले होते की नाही याची चाचणी करा

**यश निकष:**
- [ ] एजंट हवामान संबंधित प्रश्न ओळखतो
- [ ] साधन योग्यरित्या कॉल केले जाते
- [ ] प्रतिसादात हवामान माहिती समाविष्ट आहे

### सराव 3: RAG एजंट तयार करा (45 मिनिटे)

**उद्दिष्ट:** तुमच्या दस्तऐवजांमधून प्रश्नांची उत्तरे देणारा एजंट तयार करा

```bash
# RAG टेम्पलेट तैनात करा
azd init --template azure-search-openai-demo
azd up

# आपले दस्तऐवज अपलोड करा
# (टेम्पलेटच्या डेटा इन्गेशन मार्गदर्शकाचे पालन करा)

# डोमेन-विशिष्ट प्रश्नांसह चाचणी करा
```

**यश निकष:**
- [ ] अपलोड केलेल्या दस्तऐवजांपासून एजंट उत्तर देतो
- [ ] प्रतिसादांमध्ये हवाला समाविष्ट असतात
- [ ] मर्यादेबाहेरच्या प्रश्नांवर हॅलुसिनेशन नाही

---

## 📚 पुढील पावले

आता जेव्हा तुम्हाला एआय एजंट समजले आहेत, तेव्हा या प्रगत विषयांचा शोध घ्या:

| विषय | वर्णन | लिंक |
|-------|-------------|------|
| **मल्टी-एजंट सिस्टम्स** | एकमेकांसोबत सहकार्य करणाऱ्या अनेक एजंट्ससह सिस्टम तयार करा | [रिटेल बहु-एजंट उदाहरण](../../examples/retail-scenario.md) |
| **समन्वय पॅटर्न्स** | ऑर्केस्ट्रेशन आणि संचार पॅटर्न्स शिका | [समन्वय पॅटर्न्स](../chapter-06-pre-deployment/coordination-patterns.md) |
| **उत्पादन तैनात करणे** | एंटरप्राइझ-तैयार एजंट तैनाती | [उत्पादन-स्तरावरील AI पद्धती](production-ai-practices.md) |
| **एजंट मूल्यांकन** | एजंटची चाचणी आणि कामगिरीचे मूल्यांकन करा | [AI तांत्रिक निवारण](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 अतिरिक्त साधने

### अधिकृत दस्तऐवजीकरण
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD टेम्पलेट्स फॉर एजंट्स
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### समुदाय स्रोत
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigation**
- **Previous Lesson**: [AI मॉडेल डिप्लॉयमेंट](ai-model-deployment.md)
- **Next Lesson**: [उत्पादन-स्तरावरील AI पद्धती](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हे दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केलेले आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, परंतु कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा असमर्थनीयता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत म्हणून मानला जाणे आवश्यक आहे. महत्त्वाच्या माहितीकरिता व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजुतींसाठी किंवा चुकीच्या अर्थनिष्कर्षांसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->