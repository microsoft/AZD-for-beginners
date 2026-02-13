# AI ఏజెంట్లు Azure Developer CLI తో

**చాప్టర్ నావిగేషన్:**
- **📚 Course Home**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 Current Chapter**: అధ్యాయం 2 - AI-మొదటి అభివృద్ధి
- **⬅️ Previous**: [AI మోడల్ డిప్లాయ్‌మెంట్](ai-model-deployment.md)
- **➡️ Next**: [ప్రొడక్షన్ AI అభ్యాసాలు](production-ai-practices.md)
- **🚀 Advanced**: [బహుళ-ఏజెంట్ పరిష్కారాలు](../../examples/retail-scenario.md)

---

## పరిచయం

AI ఏజెంట్లు స్వయంప్రerana ప్రోగ్రామ్స్, ఇవి వారి పరిసరాలను గ్రహించి, నిర్ణయాలు తీసుకుని, నిర్దిష్ట లక్ష్యాలను సాధించడానికి చర్యలు తీసుకుంటాయి. ప్రాంప్ట్‌లకు మాత్రమే ప్రతిస్పందించే సాధారణ చాట్‌బాట్‌లతో పోలిస్తే, ఏజెంట్లు చేయగలవు:

- **టూల్స్ ఉపయోగించు** - APIs కాల్ చేయి, డేటాబేస్‌లను శోధించు, కోడ్ అమలు చేయు
- **ప్లాన్ చేయి మరియు తర్కం చేయి** - సంక్లిష్ట పనులను దశలుగా విభజించు
- **సందర్భం నుండి నేరు** - మెమరీని నిల్వ చేసి ప్రవర్తనలో అనుకూలత చూపు
- **సహకరించు** - ఇతర ఏజెంట్లతో పని చేయి (బహుళ-ఏజెంట్ వ్యవస్థలు)

ఈ గైడ్ మీకు Azure లో Azure Developer CLI (azd) ఉపయోగించి AI ఏజెంట్లను ఎలా డిప్లాయ్ చేయాలో చూపిస్తుంది.

## అభ్యాస లక్ష్యాలు

ఈ గైడ్ పూర్తి చేసిన తర్వాత, మీరు:
- ఏవి AI ఏజెంట్లు మరియు అవి చాట్‌బాట్‌లతో ఎలా భిన్నంగా ఉంటాయో అర్థం చేసుకుంటారు
- AZD ఉపయోగించి ముందుగా నిర్మించిన AI ఏజెంట్ టెంప్లెట్లను డిప్లాయ్ చేయగలరు
- కাস্টమ్ ఏజెంట్ల కోసం Foundry Agents ని కాన్ఫిగర్ చేయగలరు
- ప్రాథమిక ఏజెంట్ పద్ధతులను (టూల్ వినియోగం, RAG, బహుళ-ఏజెంట్) అమలు చేయగలరు
- డిప్లాయ్ చేసిన ఏజెంట్లను మానిటర్ చేయి మరియు డీబగ్ చేయగలరు

## నేర్చుకున్న ఫలితాలు

పూర్తి చేసిన తర్వాత, మీరు చేయగలరు:
- ఒకే కమాండ్ తో AI ఏజెంట్ అప్లికేషన్లను Azure కు డిప్లాయ్ చేయడం
- ఏజెంట్ టూల్స్ మరియు సామర్ధ్యాలను కాన్ఫిగర్ చేయడం
- ఏజెంట్లతో retrieval-augmented generation (RAG) అమలు చేయడం
- సంక్లిష్ట వర్క్‌ఫ్లోలకు బహుళ-ఏజెంట్ ఆర్కిటెక్చర్‌లు రూపొందించడం
- సాధారణ ఏజెంట్ డిప్లాయ్‌మెంట్ సమస్యలను ట్రబుల్‌షూట్ చేయడం

---

## 🤖 ఏజెంట్‌ను చాట్‌బాట్‌కంటే వేరు చేసే అంశాలు?

| ఫీచర్ | చాట్‌బాట్ | AI ఏజెంట్ |
|---------|---------|----------|
| **ప్రవర్తన** | ప్రాంప్ట్‌లకు స్పందిస్తుంది | స్వయం నిర్ణయించి చర్యలు తీసుకుంటుంది |
| **టూల్స్** | లేదు | APIs కాల్ చేయగలదు, శోధించగలదు, కోడ్ అమలు చేయగలదు |
| **మెమరీ** | కేవలం సెషన్-ఆధారితం | సెషన్‌లకు మించెయిన స్థిర మెమొరీ |
| **ప్లానింగ్** | ఒక్క బారిన స్పందన | బహుళ దశల తర్కం |
| **సహకారం** | ఒకే ఏకకం | ఇతర ఏజెంట్లతో పని చేయగలదు |

### సరళ తులన

- **చాట్‌బాట్** = సమాచార డెస్క్‌లో ప్రశ్నలకు సమాధానం చెప్పే సహాయక వ్యక్తి
- **AI ఏజెంట్** = మీ కోసం కాల్స్ చేయగల, అపాయింట్‌మెంట్ బుక్ చేయగల, పనులు పూర్తి చేయగల వ్యక్తిగత సహాయకుడు

---

## 🚀 త్వరిత ప్రారంభం: మీ మొదటి ఏజెంట్‌ను డిప్లాయ్ చేయండి

### ఎంపిక 1: Foundry Agents టెంప్లెట్ (సిఫార్సు)

```bash
# AI ఏజెంట్స్ మూసను ప్రారంభించండి
azd init --template get-started-with-ai-agents

# Azureలో అమర్చండి
azd up
```

**ఏవి డిప్లాయ్ అవుతాయి:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (RAG కోసం)
- ✅ Azure Container Apps (వెబ్ ఇంటర్ఫేస్)
- ✅ Application Insights (మానిటరింగ్)

**సమయం:** సుమారు 15-20 నిమిషాలు
**ఖర్చు:** సుమారు $100-150/నెల (డెవలప్‌మెంట్)

### ఎంపిక 2: Prompty తో OpenAI ఏజెంట్

```bash
# Prompty ఆధారిత ఏజెంట్ మూసను ప్రారంభించండి
azd init --template agent-openai-python-prompty

# Azureకు డిప్లాయ్ చేయండి
azd up
```

**ఏవి డిప్లాయ్ అవుతాయి:**
- ✅ Azure Functions (సర్వర్‌లెస్ ఏజెంట్ అమలు)
- ✅ Azure OpenAI
- ✅ Prompty కాన్ఫిగరేషన్ ఫైళ్లు
- ✅ నమూనా ఏజెంట్ అమలు

**సమయం:** సుమారు 10-15 నిమిషాలు
**ఖర్చు:** సుమారు $50-100/నెల (డెవలప్‌మెంట్)

### ఎంపిక 3: RAG చాట్ ఏజెంట్

```bash
# RAG చాట్ టెంప్లేట్‌ను ప్రారంభించండి
azd init --template azure-search-openai-demo

# Azureలో అమర్చండి
azd up
```

**ఏవి డిప్లాయ్ అవుతాయి:**
- ✅ Azure OpenAI
- ✅ Azure AI Search నమూనా డేటాతో
- ✅ డాక్యుమెంట్ ప్రాసెసింగ్ పైప్‌లైన్
- ✅ సిటేషన్లతో చాట్ ఇంటర్ఫేస్

**సమయం:** సుమారు 15-25 నిమిషాలు
**ఖర్చు:** సుమారు $80-150/నెల (డెవలప్‌మెంట్)

---

## 🏗️ ఏజెంట్ ఆర్కిటెక్చర్ నమూనాలు

### నమూనా 1: టూల్స్ తో ఒకే ఏజెంట్

ఇది చాలా సరళమైన ఏజెంట్ నమూనా - ఒక ఏజెంట్ అనేక టూల్స్ ఉపయోగించగలదు.

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

**ఉత్తమంగా:**
- కస్టమర్ సపోర్ట్ బోట్స్
- రీసెర్చ్ అసిస్టెంట్స్
- డేటా విశ్లేషణ ఏజెంట్లు

**AZD టెంప్లెట్:** `azure-search-openai-demo`

### నమూనా 2: RAG ఏజెంట్ (Retrieval-Augmented Generation)

స్పందనలు రూపొందించే ముందు సంబంధిత డాక్యుమెంట్స్‌ను రికవర్ చేసే ఏజెంట్.

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

**ఉత్తమంగా:**
- ఎంటర్ప్రైజ్ నోలెడ్జ్ బేస్‌లు
- డాక్యుమెంట్ Q&A సిస్టమ్స్
- కంప్లయన్స్ మరియు లీగల్ పరిశోధన

**AZD టెంప్లెట్:** `azure-search-openai-demo`

### నమూనా 3: బహుళ-ఏజెంట్ వ్యవస్థ

సంక్లిష్ట పనులపై కలిసి పని చేసే బహుళ ప్రత్యేక ఏజెంట్లు.

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

**ఉత్తమంగా:**
- సంక్లిష్ట కంటెంట్ జనరేషన్
- బహుళ-దశ కార్యక్రమాలు
- వివిధ నైపుణ్యాలు అవసరమయ్యే పనులు

**ఇంకా తెలుసుకోండి:** [బహుళ-ఏజెంట్ సమన్వయ నమూనాలు](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ ఏజెంట్ టూల్స్ కాన్ఫిగర్ చేయడం

ఏజెంట్లు టూల్స్ ఉపయోగించగలిగే సమయంలో శక్తివంతంగా మారతాయి. సాధారణ టూల్స్ ని ఎలా కాన్ఫిగర్ చేయాలో ఇక్కడ ఉంది:

### Foundry Agents లో టూల్ కాన్ఫిగరేషన్

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# అనుకూల సాధనాలను నిర్వచించండి
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

# సాధనాలతో ఏజెంట్‌ను సృష్టించండి
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### ఎన్విరాన్మెంట్ కాన్ఫిగరేషన్

```bash
# ఏజెంట్-నిర్దిష్ట పర్యావరణ చరరాశులను సెట్ చేయండి
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# నవీకరించబడిన కాన్ఫిగరేషన్‌తో అమలు చేయండి
azd deploy
```

---

## 📊 ఏజెంట్లని పరిశీలించడం

### Application Insights సమీకరణం

అన్ని AZD ఏజెంట్ టెంప్లెట్లు మానిటరింగ్ కోసం Application Insights ను కలిగి ఉంటాయి:

```bash
# మానిటరింగ్ డ్యాష్‌బోర్డ్‌ను తెరవండి
azd monitor --overview

# లైవ్ లాగ్‌లను వీక్షించండి
azd monitor --logs

# లైవ్ మెట్రిక్స్‌లను వీక్షించండి
azd monitor --live
```

### ట్రాక్ చేయాల్సిన ప్రధాన మెట్రిక్స్

| మెట్రిక్ | వివరణ | లక్ష్యము |
|--------|-------------|--------|
| Response Latency | స్పందన రూపొందించడానికి సమయం | < 5 సెకన్లు |
| Token Usage | ప్రతి అభ్యర్థనకు టోకెన్లు | ఖర్చు కోసం పరిశీలించండి |
| Tool Call Success Rate | విజయవంతమైన టూల్ ఎగ్జిక్యూషన్స్ శాతం | > 95% |
| Error Rate | విఫలమైన ఏజెంట్ అభ్యర్థనలు | < 1% |
| User Satisfaction | ఫీడ్‌బ్యాక్ స్కోర్లు | > 4.0/5.0 |

### ఏజెంట్ల కోసం అనుకూల లాగింగ్

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

## 💰 ఖర్చు విషయాలు

### నమూనా ప్రకారం తగిన నెలవారి ఖర్చుల అంచనా

| నమూనా | డెవ్ పరిసరాలు | ప్రొడక్షన్ |
|---------|-----------------|------------|
| ఒకే ఏజెంట్ | $50-100 | $200-500 |
| RAG ఏజెంట్ | $80-150 | $300-800 |
| బహుళ-ఏజెంట్ (2-3 ఏజెంట్లు) | $150-300 | $500-1,500 |
| ఎంటర్ప్రైజ్ బహుళ-ఏజెంట్ | $300-500 | $1,500-5,000+ |

### ఖర్చు ఆప్టిమైజేషన్ చిట్కాలు

1. **సాధారణ పనులకు GPT-4o-miniని ఉపయోగించండి**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **పునరావృత్తి ప్రశ్నల కోసం క్యాషింగ్ అమలు చేయండి**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **టోకెన్ పరిమితులను నిర్ణయించండి**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # స్పందన పొడవును పరిమితం చేయండి
   )
   ```

4. **ఉపయోగంలో లేని సమయంలో శూన్యానికి స్కేల్ చేయండి**
   ```bash
   # Container Apps స్వయంచాలకంగా శూన్యానికి స్కేలు అవుతాయి
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 ఏజెంట్లలో సమస్యలు పరిష్కారం

### సాధారణ సమస్యలు మరియు పరిష్కారాలు

<details>
<summary><strong>❌ టూల్ కాల్స్‌కు ఏజెంట్ స్పందించడం లేదు</strong></summary>

```bash
# సాధనాలు సరైన రీతిలో నమోదు అయ్యాయో లేదా కాదో తనిఖీ చేయండి
azd show

# OpenAI డిప్లాయ్‌మెంట్‌ను ధృవీకరించండి
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# ఏజెంట్ లాగ్‌లను తనిఖీ చేయండి
azd monitor --logs
```

**సాధారణ కారణాలు:**
- టూల్ ఫంక్షన్ సిగ్నేచర్ సరిపోలకపోవడం
- అవసరమైన అనుమతులు లేనివి
- API ఎండ్‌పాయింట్ యాక్సెస్ అయ్యే స్థితిలో లేదు
</details>

<details>
<summary><strong>❌ ఏజెంట్ స్పందనల్లో ఎక్కువ ఆలస్యం</strong></summary>

```bash
# Application Insightsలో బాటిల్‌నెక్‌లు కోసం తనిఖీ చేయండి
azd monitor --live

# వేగవంతమైన మోడల్‌ను ఉపయోగించాలని పరిగణించండి
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**ఆప్టిమైజేషన్ చిట్కాలు:**
- స్ట్రీమింగ్ پاسخలు ఉపయోగించండి
- స్పందన క్యాషింగ్ అమలు చేయండి
- కాంటెక్స్ట్ విండో పరిమాణాన్ని తగ్గించండి
</details>

<details>
<summary><strong>❌ ఏజెంట్ తప్పు లేదా హాలుసినేటెడ్ సమాచారం ఇస్తోంది</strong></summary>

```python
# మెరుగైన సిస్టమ్ ప్రాంప్ట్‌లను ఉపయోగించి మెరుగుపరచండి
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# గ్రౌండింగ్ కోసం రీట్రీవల్ జోడించండి
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # జవాబులను డాక్యుమెంట్లలో ఆధారపరచండి
)
```
</details>

<details>
<summary><strong>❌ టోకెన్ పరిమితి మించిన ERRORS</strong></summary>

```python
# కాంటెక్స్ట్ విండో నిర్వహణను అమలు చేయండి
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # సుమారు అంచనా
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 హ్యాండ్స్-ఆన్ వ్యాయామాలు

### వ్యాయామం 1: ఒక ప్రాథమిక ఏజెంట్‌ను డిప్లాయ్ చేయండి (20 నిమిషాలు)

**లక్ష్యం:** AZD ఉపయోగించి మీ మొదటి AI ఏజెంట్‌ను డిప్లాయ్ చేయండి

```bash
# దశ 1: టెంప్లేట్ ప్రారంభించండి
azd init --template get-started-with-ai-agents

# దశ 2: Azureలో లాగిన్ అవ్వండి
azd auth login

# దశ 3: డిప్లాయ్ చేయండి
azd up

# దశ 4: ఏజెంట్‌ను పరీక్షించండి
# ఔట్‌పుట్‌లో చూపించిన URLని తెరవండి

# దశ 5: శుభ్రపరచండి
azd down --force --purge
```

**విజయ ప్రమాణాలు:**
- [ ] ఏజెంట్ ప్రశ్నలకు స్పందిస్తుంది
- [ ] మానిటరింగ్ డ్యాష్‌బోర్డ్‌ని యాక్సెస్ చేయగలదు
- [ ] రీసోర్సులు విజయవంతంగా శుభ్రపరుచబడ్డాయి

### వ్యాయామం 2: కస్టమ్ టూల్ జోడించండి (30 నిమిషాలు)

**లక్ష్యం:** ఒక ఏజెంట్‌కు కస్టమ్ టూల్ ద్వారా విస్తరించండి

1. ఏజెంట్ టెంప్లెట్‌ను డిప్లాయ్ చేయండి
2. కొత్త టూల్ ఫంక్షన్ సృష్టించండి:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # వాతావరణ సేవకు API పిలుపు
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. టూల్‌ను ఏజెంట్‌తో రిజిస్టర్ చేయండి
4. ఏజెంట్ కొత్త టూల్‌ను ఉపయోగిస్తున్నదో పరీక్షించండి

**విజయ ప్రమాణాలు:**
- [ ] ఏజెంట్ వాతావరణ సంబంధి ప్రశ్నలను గుర్తిస్తుంది
- [ ] టూల్ సరైనভাবে పిలవబడుతుంది
- [ ] స్పందనలో వాతావరణ సమాచారం ఉంటుంది

### వ్యాయామం 3: RAG ఏజెంట్ నిర్మించండి (45 నిమిషాలు)

**లక్ష్యం:** మీ డాక్యుమెంట్ల నుండి ప్రశ్నలకు సమాధానం చెప్పే ఏజెంట్‌ను రూపొందించండి

```bash
# RAG టెంప్లేట్‌ను అమలు చేయండి
azd init --template azure-search-openai-demo
azd up

# మీ డాక్యుమెంట్లను అప్లోడ్ చేయండి
# (టెంప్లేట్ యొక్క డేటా దిగుమతి గైడ్‌ను అనుసరించండి)

# డొమైన్-నిర్దిష్ట ప్రశ్నలతో పరీక్షించండి
```

**విజయ ప్రమాణాలు:**
- [ ] ఏజెంట్ అప్లోడ్ చేసిన డాక్యుమెంట్ల నుండి సమాధానం ఇస్తుంది
- [ ] స్పందనల్లో ఉల్లేఖలు ఉంటాయి
- [ ] వ్యాప్తి బహిష్కరించిన ప్రశ్నలపై హ్యాలుసినేషన్ ఉండకూడదు

---

## 📚 తదుపరి దశలు

ఇప్పుడు మీరు AI ఏజెంట్లను అర్థం చేసుకున్నందున, ఈ అధునాతన విషయాలను అన్వేషించండి:

| విషయం | వివరణ | లింక్ |
|-------|-------------|------|
| **బహుళ-ఏజెంట్ వ్యవస్థలు** | అనేక ఏజెంట్లు కలిసి పని చేసే సిస్టమ్లు నిర్మించండి | [రెటైల్ బహుళ-ఏజెంట్ ఉదాహరణ](../../examples/retail-scenario.md) |
| **సమన్వయ నమూనాలు** | ఆర్కిస్ట్రేషన్ మరియు కమ్యూనికేషన్ నమూనాలను నేర్చుకోండి | [సమన్వయ నమూనాలు](../chapter-06-pre-deployment/coordination-patterns.md) |
| **ప్రొడక్షన్ డిప్లాయ్‌మెంట్** | ఎంటర్ప్రైజ్-సిద్ధ ఏజెంట్ డిప్లాయ్‌మెంట్ | [ప్రొడక్షన్ AI అభ్యాసాలు](production-ai-practices.md) |
| **ఏజెంట్ మూల్యాంకనం** | ఏజెంట్ పనితీరు పరీక్షించండి మరియు మూల్యాంకనం చేయండి | [AI సమస్య పరిష్కారం](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 అదనపు వనరులు

### అధికారిక డాక్యుమెంటేషన్
- [Foundry ఏజెంట్లు](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### ఏజెంట్ల కోసం AZD టెంప్లేట్లు
- [AI ఏజెంట్లతో ప్రారంభించండి](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### కమ్యూనిటీ వనరులు
- [అద్భుత AZD - ఏజెంట్ టెంప్లేట్లు](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**నావిగేషన్**
- **పూర్వ పాఠం**: [AI మోడల్ డిప్లాయ్‌మెంట్](ai-model-deployment.md)
- **తరువాత పాఠం**: [ప్రొడక్షన్ AI అభ్యాసాలు](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
బాధ్యతా నిరాకరణ:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలలో పొరపాట్లు లేదా అసంబద్ధతలు ఉండవచ్చు అని దయచేసి గమనించండి. మూల పత్రాన్ని దాని స్థానిక (మూల) భాషలో ఉన్న వెర్షన్‌ను అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి వృత్తిపరమైన మానవ అనువాదం చేయించుకోవాలని సూచించబడిందని గమనించండి. ఈ అనువాదాన్ని ఉపయోగించడం వల్ల ఏర్పడే ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేయబడిన విషయాల కోసం మేము బాధ్యతారహితంగా ఉంటాము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->