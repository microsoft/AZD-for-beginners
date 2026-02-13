# AI एजेन्टहरू Azure Developer CLI सँग

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD शुरुवातीहरूको लागि](../../README.md)
- **📖 हालको अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ अघिल्लो**: [AI मोडेल परिनियोजन](ai-model-deployment.md)
- **➡️ अर्को**: [उत्पादन AI अभ्यासहरू](production-ai-practices.md)
- **🚀 उन्नत**: [बहु-एजेन्ट समाधानहरू](../../examples/retail-scenario.md)

---

## परिचय

AI एजेन्टहरू स्वतन्त्र कार्यक्रमहरू हुन् जसले आफ्नो वातावरणलाई बुझ्न, निर्णय लिन, र विशेष लक्ष्यहरू हासिल गर्न क्रियाहरू गर्न सक्छन्। सरल प्रम्प्ट-प्रतिक्रिया गर्ने च्याटबोटहरू भन्दा फरक, एजेन्टहरूले:

- **उपकरणहरू प्रयोग गर्न सक्छन्** - API कल गर्न, डेटाबेस खोज्न, कोड चलाउन
- **योजना र तर्क गर्न सक्छन्** - जटिल कार्यहरूलाई चरणहरूमा विभाजन गर्न
- **सन्दर्भबाट सिक्छन्** - स्मृति कायम राख्न र व्यवहार अनुकूलन गर्न
- **सहयोग गर्न सक्छन्** - अन्य एजेन्टहरूसँग काम गर्न (बहु-एजेन्ट प्रणालीहरू)

यो मार्गदर्शिकाले तपाईंलाई Azure मा Azure Developer CLI (azd) प्रयोग गरेर AI एजेन्टहरू कसरी परिनियोजन गर्ने देखाउँछ।

## सिकाइ लक्ष्यहरू

यो मार्गदर्शिका पूरा गर्दा, तपाईंले:
- AI एजेन्टहरू के हुन् र तिनीहरू च्याटबोटहरूबाट कसरी फरक छन् बुझ्ने
- AZD प्रयोग गरेर पूर्व-निर्मित AI एजेन्ट टेम्पलेटहरू परिनियोजन गर्ने
- अनुकूलित एजेन्टहरूको लागि Foundry Agents कन्फिगर गर्ने
- आधारभूत एजेन्ट ढाँचाहरू लागू गर्ने (उपकरण प्रयोग, RAG, बहु-एजेन्ट)
- परिनियोजित एजेन्टहरूको अनुगमन र डिबग गर्ने

## सिकाइ परिणामहरू

पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- एकल आदेशमा Azure मा AI एजेन्ट अनुप्रयोगहरू परिनियोजन गर्न
- एजेन्ट उपकरण र क्षमताहरू कन्फिगर गर्न
- एजेन्टहरूसँग retrieval-augmented generation (RAG) लागू गर्न
- जटिल कार्यप्रवाहहरूको लागि बहु-एजेन्ट वास्तुकलाहरू डिजाइन गर्न
- सामान्य एजेन्ट परिनियोजन समस्याहरू समाधान गर्न

---

## 🤖 एजेन्टलाई च्याटबोटबाट फरक के बनाउँछ?

| विशेषता | च्याटबोट | AI एजेन्ट |
|---------|----------|-----------|
| **व्यवहार** | प्रम्प्टहरूमा जवाफ दिन्छ | स्वायत्त कार्यहरू गर्दछ |
| **उपकरणहरू** | कुनै छैन | API कल गर्न, खोजी गर्न, कोड चलाउन सक्छ |
| **स्मृति** | केवल सत्र-आधारित | सत्रहरूमा स्थायी स्मृति |
| **योजना** | एकल उत्तर | बहु-चरण तर्क |
| **सहयोग** | एकल इकाई | अन्य एजेन्टहरूसँग काम गर्न सक्छ |

### सरल उपमा

- **च्याटबोट** = जानकारी डेस्कमा प्रश्नहरूको उत्तर दिने सहायक व्यक्ति
- **AI एजेन्ट** = एक व्यक्तिगत सहायक जसले कल गर्न, भेटघाट बुक गर्न, र तपाईंका लागि कार्यहरू पूरा गर्न सक्छ

---

## 🚀 छिटो सुरूवात: आफ्नो पहिलो एजेन्ट परिनियोजन गर्नुहोस्

### विकल्प 1: Foundry Agents टेम्पलेट (सिफारिश गरिएको)

```bash
# एआई एजेन्टहरूको टेम्पलेट आरम्भ गर्नुहोस्
azd init --template get-started-with-ai-agents

# Azure मा परिनियोजन गर्नुहोस्
azd up
```

**के परिनियोजन हुन्छ:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (RAG का लागि)
- ✅ Azure Container Apps (वेब इन्टरफेस)
- ✅ Application Insights (अनुगमन)

**समय:** ~15-20 मिनेट
**लागत:** ~$100-150/महिना (विकास)

### विकल्प 2: OpenAI Agent with Prompty

```bash
# Prompty-आधारित एजेन्ट टेम्प्लेट आरम्भ गर्नुहोस्
azd init --template agent-openai-python-prompty

# Azure मा तैनाथ गर्नुहोस्
azd up
```

**के परिनियोजन हुन्छ:**
- ✅ Azure Functions (सर्भरलेस एजेन्ट कार्यान्वयन)
- ✅ Azure OpenAI
- ✅ Prompty कन्फिगरेसन फाइलहरू
- ✅ नमूना एजेन्ट कार्यान्वयन

**समय:** ~10-15 मिनेट
**लागत:** ~$50-100/महिना (विकास)

### विकल्प 3: RAG Chat Agent

```bash
# RAG च्याट ढाँचा प्रारम्भ गर्नुहोस्
azd init --template azure-search-openai-demo

# Azure मा परिनियोजन गर्नुहोस्
azd up
```

**के परिनियोजन हुन्छ:**
- ✅ Azure OpenAI
- ✅ नमूना डाटासँग Azure AI Search
- ✅ दस्तावेज प्रशोधन पाइपलाइन
- ✅ उद्धरणहरू सहितको च्याट इन्टरफेस

**समय:** ~15-25 मिनेट
**लागत:** ~$80-150/महिना (विकास)

---

## 🏗️ एजेन्ट वास्तुकला ढाँचाहरू

### ढाँचा 1: उपकरणहरू सहित एकल एजेन्ट

सबैभन्दा सरल एजेन्ट ढाँचा - एक एजेन्ट जो धेरै उपकरणहरू प्रयोग गर्न सक्छ।

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

**उपयुक्त:**
- ग्राहक समर्थन बोटहरू
- अनुसन्धान सहायकहरू
- डेटा विश्लेषण एजेन्टहरू

**AZD टेम्पलेट:** `azure-search-openai-demo`

### ढाँचा 2: RAG एजेन्ट (Retrieval-Augmented Generation)

उत्तरहरू सिर्जना गर्नुअघि सम्बन्धित दस्तावेजहरू पुन:प्राप्त गर्ने एजेन्ट।

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

**उपयुक्त:**
- उद्यम ज्ञान भण्डारहरू
- दस्तावेज Q&A प्रणालीहरू
- अनुपालन र कानुनी अनुसन्धान

**AZD टेम्पलेट:** `azure-search-openai-demo`

### ढाँचा 3: बहु-एजेन्ट प्रणाली

जटिल कार्यहरूमा सँगै काम गर्ने धेरै विशेषज्ञ एजेन्टहरू।

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

**उपयुक्त:**
- जटिल सामग्री निर्माण
- बहु-चरण कार्यप्रवाहहरू
- विभिन्न विशेषज्ञता आवश्यक पर्ने कार्यहरू

**थप जान्नुहोस्:** [बहु-एजेन्ट समन्वय ढाँचाहरू](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ एजेन्ट उपकरणहरू कन्फिगर गर्नुहोस्

एजेन्टहरू तब शक्तिशाली हुन्छन् जब तिनीहरूले उपकरणहरू प्रयोग गर्न सक्छन्। यहाँ सामान्य उपकरणहरू कसरी कन्फिगर गर्ने देखाइएको छ:

### Foundry Agents मा उपकरण कन्फिगरेसन

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# कस्टम उपकरणहरू परिभाषित गर्नुहोस्
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

# उपकरणहरूसँग एजेन्ट सिर्जना गर्नुहोस्
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### वातावरण कन्फिगरेसन

```bash
# एजेण्ट-विशिष्ट वातावरण चरहरू सेटअप गर्नुहोस्
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# अपडेट गरिएको कन्फिगरेसन सहित तैनाथ गर्नुहोस्
azd deploy
```

---

## 📊 एजेन्टहरूको अनुगमन

### Application Insights एकीकरण

सबै AZD एजेन्ट टेम्पलेटहरू अनुगमनको लागि Application Insights समावेश गर्छन्:

```bash
# निगरानी ड्यासबोर्ड खोल्नुहोस्
azd monitor --overview

# प्रत्यक्ष लगहरू हेर्नुहोस्
azd monitor --logs

# प्रत्यक्ष मेट्रिक्स हेर्नुहोस्
azd monitor --live
```

### अनुगमन गर्नुपर्ने प्रमुख मेट्रिक्सहरू

| मेट्रिक | विवरण | लक्ष्य |
|--------|-------------|--------|
| प्रतिक्रिया ढिलाइ | प्रतिक्रिया सिर्जना गर्न लाग्ने समय | < 5 सेकेन्ड |
| टोकन प्रयोग | प्रति अनुरोध टोकन | लागतको लागि अनुगमन गर्नुहोस् |
| उपकरण कल सफलता दर | सफल उपकरण कार्यन्वयनहरूको % | > 95% |
| त्रुटि दर | असफल एजेन्ट अनुरोधहरू | < 1% |
| प्रयोगकर्ता सन्तुष्टि | प्रतिक्रिया स्कोरहरू | > 4.0/5.0 |

### एजेन्टहरूको लागि अनुकूल लगिङ

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

## 💰 लागत सम्बन्धी विचारहरू

### ढाँचाअनुसार अनुमानित मासिक लागतहरू

| ढाँचा | विकास वातावरण | उत्पादन |
|---------|-----------------|------------|
| एकल एजेन्ट | $50-100 | $200-500 |
| RAG एजेन्ट | $80-150 | $300-800 |
| बहु-एजेन्ट (2-3 एजेन्ट) | $150-300 | $500-1,500 |
| उद्यम बहु-एजेन्ट | $300-500 | $1,500-5,000+ |

### लागत अनुकूलन सुझावहरू

1. **सरल कार्यहरूको लागि GPT-4o-mini प्रयोग गर्नुहोस्**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **दोहरिने प्रश्नहरूको लागि क्याचिङ लागू गर्नुहोस्**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **टोकन सीमा सेट गर्नुहोस्**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # प्रतिक्रियाको लम्बाइ सीमित गर्नुहोस्
   )
   ```

4. **प्रयोगमा नभएमा शून्यमा स्केल गर्नुहोस्**
   ```bash
   # Container Apps स्वचालित रूपमा शून्यसम्म स्केल हुन्छन्
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 एजेन्टहरू समस्याको समाधान

### सामान्य समस्या र समाधानहरू

<details>
<summary><strong>❌ उपकरण कलहरूमा एजेन्ट जवाफ दिँदैन</strong></summary>

```bash
# उपकरणहरू ठीकसँग दर्ता भएका छन् कि छैनन् जाँच गर्नुहोस्
azd show

# OpenAI तैनाती जाँच गर्नुहोस्
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# एजेन्टका लगहरू जाँच गर्नुहोस्
azd monitor --logs
```

**सामान्य कारणहरू:**
- उपकरण फङ्क्शन सिग्नेचर मेल खाँदैन
- आवश्यक अनुमति हराइरहेको
- API अन्त्यबिन्दु पहुँचयोग्य छैन
</details>

<details>
<summary><strong>❌ एजेन्ट प्रतिक्रियाहरूमा उच्च विलम्ब</strong></summary>

```bash
# Application Insights मा अवरोधहरूको लागि जाँच गर्नुहोस्
azd monitor --live

# छिटो मोडेल प्रयोग गर्ने विचार गर्नुहोस्
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**सुधार सुझावहरू:**
- स्ट्रीमिङ प्रतिक्रिया प्रयोग गर्नुहोस्
- प्रतिक्रिया क्याचिङ लागू गर्नुहोस्
- सन्दर्भ विन्डो साइज घटाउनुहोस्
</details>

<details>
<summary><strong>❌ एजेन्टले गलत वा हल्युसिनेसन गरिएको जानकारी फर्काइरहेको छ</strong></summary>

```python
# राम्रो सिस्टम प्रॉम्प्टहरू प्रयोग गरेर सुधार गर्नुहोस्
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# ग्राउन्डिङका लागि पुनःप्राप्ति थप्नुहोस्
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # प्रतिक्रियाहरूलाई दस्तावेजहरूमा आधारित गर्नुहोस्
)
```
</details>

<details>
<summary><strong>❌ टोकन सीमा बढी भयो भन्ने त्रुटिहरू</strong></summary>

```python
# सन्दर्भ विन्डो व्यवस्थापन कार्यान्वयन गर्नुहोस्
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # मोटामोटी अनुमान
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 व्यवहारिक अभ्यासहरू

### अभ्यास 1: आधारभूत एजेन्ट परिनियोजन (20 मिनेट)

**लक्ष्य:** AZD प्रयोग गरेर आफ्नो पहिलो AI एजेन्ट परिनियोजन गर्नुहोस्

```bash
# चरण 1: टेम्पलेट आरम्भ गर्नुहोस्
azd init --template get-started-with-ai-agents

# चरण 2: Azure मा लगइन गर्नुहोस्
azd auth login

# चरण 3: तैनाथ गर्नुहोस्
azd up

# चरण 4: एजेन्ट परीक्षण गर्नुहोस्
# आउटपुटमा देखाइएको URL खोल्नुहोस्

# चरण 5: सफाइ गर्नुहोस्
azd down --force --purge
```

**सफलताको मापदण्डहरू:**
- [ ] एजेन्ट प्रश्नहरूको जवाफ दिन्छ
- [ ] अनुगमन ड्यासबोर्ड पहुँच गर्न सक्छ
- [ ] स्रोतहरू सफलतापूर्वक सफा गरियो

### अभ्यास 2: अनुकूलित उपकरण थप्नुहोस् (30 मिनेट)

**लक्ष्य:** अनुकूलित उपकरणसँग एजेन्ट विस्तार गर्नुहोस्

1. एजेन्ट टेम्पलेट परिनियोजन गर्नुहोस्
2. नयाँ उपकरण फङ्क्शन सिर्जना गर्नुहोस्:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # मौसम सेवामा गरिएको API कल
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. उपकरणलाई एजेन्टसँग दर्ता गर्नुहोस्
4. एजेन्टले नयाँ उपकरण प्रयोग गर्छ कि भनेर परीक्षण गर्नुहोस्

**सफलताको मापदण्डहरू:**
- [ ] एजेन्टले मौसमसम्बन्धी प्रश्नहरू पहिचान गर्छ
- [ ] उपकरण सही रूपमा कल हुन्छ
- [ ] प्रतिक्रियामा मौसम जानकारी समावेश छ

### अभ्यास 3: RAG एजेन्ट बनाउनुहोस् (45 मिनेट)

**लक्ष्य:** तपाइँका दस्तावेजहरूबाट प्रश्नहरूको उत्तर दिने एजेन्ट सिर्जना गर्नुहोस्

```bash
# RAG टेम्पलेट परिनियोजन गर्नुहोस्
azd init --template azure-search-openai-demo
azd up

# आफ्ना दस्तावेजहरू अपलोड गर्नुहोस्
# (टेम्पलेटको डेटा इनजेस्टन मार्गदर्शिका पालना गर्नुहोस्)

# डोमेन-विशिष्ट प्रश्नहरूसँग परीक्षण गर्नुहोस्
```

**सफलताको मापदण्डहरू:**
- [ ] एजेन्टले अपलोड गरिएको दस्तावेजहरूबाट उत्तर दिन्छ
- [ ] प्रतिक्रियाहरूमा उद्धरणहरू समावेश छन्
- [ ] दायराबाट बाहिरका प्रश्नहरूमा गल्ती/हल्युसिनेशन नहोस्

---

## 📚 अर्को कदमहरू

अब जब तपाईंले AI एजेन्टहरू बुझिसक्नुभयो, यी उन्नत विषयहरू अन्वेषण गर्नुहोस्:

| विषय | विवरण | लिङ्क |
|-------|-------------|------|
| **बहु-एजेन्ट प्रणालीहरू** | एकाधिक सहकार्य गर्ने एजेन्टहरूसहित प्रणालीहरू बनाउनुहोस् | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **समन्वय ढाँचाहरू** | अोर्केस्ट्रेसन र सञ्चार ढाँचाहरू सिक्नुहोस् | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **उत्पादन तैनाती** | उद्यम-योग्य एजेन्ट परिनियोजन | [Production AI Practices](production-ai-practices.md) |
| **एजेन्ट मूल्याङ्कन** | एजेन्ट प्रदर्शन परीक्षण र मूल्याङ्कन गर्नुहोस् | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 थप स्रोतहरू

### आधिकारिक दस्तावेजहरू
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD का एजेन्ट टेम्पलेटहरू
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### समुदाय स्रोतहरू
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**नेभिगेसन**
- **पछिल्लो पाठ**: [AI मोडेल परिनियोजन](ai-model-deployment.md)
- **अर्को पाठ**: [उत्पादन AI अभ्यासहरू](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा Co‑op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी सटीकताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुनसक्छ। मूल भाषामा रहेको दस्तावेजलाई अधिकारिक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि पेशेवर मानवीय अनुवाद सिफारिश गरिन्छ। हामी यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याका लागि उत्तरदायी हुनेछैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->