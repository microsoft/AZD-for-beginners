# Azure Developer CLI ഉപയോഗിച്ച് AI ഏജന്റുകൾ

**Chapter Navigation:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: Chapter 2 - AI-First Development
- **⬅️ മുൻമുഖം**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ അടുത്തത്**: [Production AI Practices](production-ai-practices.md)
- **🚀 അഡ്വാൻസ്ഡ്**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## പരിചയം

AI ഏജന്റുകൾ സ്വയംഭാര്യ പ്രോഗ്രാമുകളാണ്, അവ അവയുടെ പരിസരത്തെ ഗ്രഹിക്കുകയും, തീരുമാനം കഴിക്കുകയും, പ്രത്യേക ലക്ഷ്യങ്ങൾ സമ്പാദിക്കാൻ പ്രവർത്തനങ്ങൾ സ്വീകരിക്കുകയും ചെയ്യുന്നു. പ്രോംപ്റ്റുകൾക്ക് പ്രതികരിക്കുന്ന ലളിതമായ ചാറ്റ്ബോട്ടുകളിൽ നിന്നു വ്യത്യസ്തമായി, ഏജന്റുകൾ:

- **ഉപകരണങ്ങൾ ഉപയോഗിക്കുക** - APIs വിളിക്കുക, ഡാറ്റാബേസുകൾ തിരയുക, കോഡ് നിർവഹിക്കുക
- **സൂചിപ്പിക്കുകയും ന്യായീകരിക്കുകയും ചെയ്യുക** - സങ്കീർണമായ പ്രവൃത്തികൾ ഘട്ടങ്ങളായി വിഭജിക്കുക
- **സന്ദർഭത്തിൽ നിന്നു പഠിക്കുക** - മെമ്മറി നിലനിർത്തി പെരുമാറ്റം ക്രമീകരിക്കുക
- **സഹകരിക്കുക** - മറ്റ് ഏജന്റുകളുമായി (മൾട്ടി-ഏജന്റ് സിസ്റ്റങ്ങൾ) ചേർന്ന് പ്രവർത്തിക്കുക

ഈ ഗൈഡ് Azure Developer CLI (azd) ഉപയോഗിച്ചു Azureയിൽ AI ഏജന്റുകൾ എങ്ങനെ വിന്യസിക്കാമെന്ന് കാണിക്കുന്നു.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂർത്തിയാക്കിയാൽ, നിങ്ങൾ:
- AI ഏജന്റുകൾ എന്താണെന്ന് және ചാറ്റ്ബോട്ടുകളിൽനിന്നുള്ള വ്യത്യാസങ്ങളെ മനസിലാക്കുകയാകും
- AZD ഉപയോഗിച്ച് മുമ്പಿಳിച്ചിരിക്കുന്ന AI ഏജന്റ് ടെംപ്ലേറ്റുകൾ വിന്യസിക്കാൻ കഴിയും
- കസ്റ്റം ഏജന്റുകൾക്കായി Foundry Agents കോൺഫിഗർ ചെയ്യാൻ കഴിയും
- അടിസ്ഥാന ഏജന്റ് മാതൃകകൾ (ഉപകരണ ഉപയോഗം, RAG, മൾട്ടി-ഏജന്റ്) നടപ്പിലാക്കാൻ കഴിയും
- വിന്യസിച്ച ഏജന്റുകൾ നിരീക്ഷിക്കുകയും ഡീബഗ് ചെയ്യുകയും ചെയ്യാൻ കഴിയും

## പഠനഫലങ്ങൾ

പൂർത്തിയായപ്പോൾ, നിങ്ങളെക്കൽ കഴിയും:
- ഒരു കമാൻഡിനൊപ്പം Azureക്ക് AI ഏജന്റ് അപ്ലിക്കേഷനുകൾ വിന്യസിക്കുക
- ഏജന്റ് ഉപകരണങ്ങളും ശേഷികളും കോൺഫിഗർ ചെയ്യുക
- ഏജന്റുകളുമായി retrieval-augmented generation (RAG) നടപ്പിലാക്കുക
- സങ്കീർണ വർക്ക്‌ഫ്ലോകൾക്കായി മൾട്ടി-ഏജന്റ് ആർക്കിടെക്ചറുകൾ രൂപകല്‍പ്പന ചെയ്യുക
- സാധാരണ ഏജന്റ് വിന്യസന പ്രശ്നങ്ങൾ ടൂൾഷൂട്ട് ചെയ്യുക

---

## 🤖 ഏജന്റ് ഒരു ചാറ്റ്ബോട്ടിൽ നിന്ന് എന്തു കൊണ്ട് വ്യത്യസ്തമാണ്?

| സ്വഭാവം | ചാറ്റ്ബോട്ട് | AI ഏജന്റ് |
|---------|-----------|----------|
| **പ്രവർത്തനം** | പ്രോംപ്റ്റുകൾക്ക് പ്രതികരിക്കുന്നു | സ്വതന്ത്രമായി പ്രവർത്തനങ്ങൾ ചെയ്യുന്നു |
| **ഉപകരണങ്ങൾ** | ഇല്ല | APIs വിളിക്കാൻ, തിരയാൻ, കോഡ് പ്രവർത്തിപ്പിക്കാൻ കഴിയും |
| **സ്മൃതി** | സെഷൻ അടിസ്ഥാനത്തിൽ മാത്രം | സെഷനുകൾക്കു മീതെയുള്ള സ്ഥിരമായ സ്മൃതി |
| **പദ്ധതീകരണം** | ഒരു മറുപടി | പലഘട്ട ന്യായീകരണം |
| **സഹകരണം** | ഏക ഘടകം | മറ്റു ഏജന്റുകളുമായി പ്രവർത്തിക്കാവുന്നതാണ് |

### ലളിതമായ സമാനത

- **ചാറ്റ്ബോട്ട്** = ഒരു വിവര ഡെസ്കിൽ ചോദ്യം答ിക്കുന്ന സഹായക വ്യക്തി
- **AI ഏജന്റ്** = ഫോൺ വിളിക്കാൻ, അഡൈൻമെന്റ് ബുക്ക് ചെയ്യാൻ, നിങ്ങളുടെ വേണ്ടി പ്രവർത്തനങ്ങൾ പൂർത്തീകരിക്കാൻ കഴിയുന്ന വ്യക്തിഗത അസിസ്റ്റന്റ്

---

## 🚀 അതിവേഗ തുടക്കം: നിങ്ങളുടെ ആദ്യ ഏജന്റ് വിന്യസിക്കുക

### ഓപ്ഷൻ 1: Foundry Agents ടെംപ്ലേറ്റ് (ശുപാർശചെയ്‌തത്)

```bash
# AI ഏജന്റുകൾക്കായുള്ള ടെംപ്ലേറ്റ് ആരംഭിക്കുക
azd init --template get-started-with-ai-agents

# Azure ലേക്ക് വിന്യസിക്കുക
azd up
```

**ഏതെല്ലാം വിന്യസിക്കും:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (for RAG)
- ✅ Azure Container Apps (web interface)
- ✅ Application Insights (monitoring)

**സമയം:** ~15-20 minutes
**ചെലവ്:** ~$100-150/month (development)

### ഓപ്ഷൻ 2: OpenAI Agent with Prompty

```bash
# Prompty-ആധാരിത ഏജന്റ് ടെംപ്ലേറ്റ് ആരംഭിക്കുക
azd init --template agent-openai-python-prompty

# Azure-ലേക്ക് വിന്യസിക്കുക
azd up
```

**ഏതെല്ലാം വിന്യസിക്കും:**
- ✅ Azure Functions (serverless agent execution)
- ✅ Azure OpenAI
- ✅ Prompty configuration files
- ✅ Sample agent implementation

**സമയം:** ~10-15 minutes
**ചെലവ്:** ~$50-100/month (development)

### ഓപ്ഷൻ 3: RAG Chat Agent

```bash
# RAG ചാറ്റ് ടെംപ്ലേറ്റ് ആരംഭിക്കുക
azd init --template azure-search-openai-demo

# Azure-ലേക്ക് വിന്യസിക്കുക
azd up
```

**ഏതെല്ലാം വിന്യസിക്കും:**
- ✅ Azure OpenAI
- ✅ Azure AI Search with sample data
- ✅ Document processing pipeline
- ✅ Chat interface with citations

**സമയം:** ~15-25 minutes
**ചെലവ്:** ~$80-150/month (development)

---

## 🏗️ ഏജന്റ് ആർക്കിടെക്ചർ മാതൃകകൾ

### മാതൃക 1: ഉപകരണങ്ങളുള്ള ഏക ഏജന്റ്

ഏറ്റവും ലളിതമായ ഏജന്റ് മാതൃക - ഒരൊറ്റ ഏജന്റ് നിരവധി ഉപകരണങ്ങൾ ഉപയോഗിക്കാവുന്നതാണ്.

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

**ഇതിനുള്ള മികച്ചത്:**
- കസ്റ്റമർ സപ്പോർട്ട് ബോട്ടുകൾ
- റിസർച്ച് അസിസ്റ്റന്റുകൾ
- ഡാറ്റാ വിശകലന ഏജന്റുകൾ

**AZD ടെംപ്ലേറ്റ്:** `azure-search-openai-demo`

### മാതൃക 2: RAG ഏജന്റ് (Retrieval-Augmented Generation)

ഉത്തരം സൃഷ്ടിക്കുന്നതിന് മുമ്പ് ബന്ധപ്പെട്ട ഡോക്യുമെന്റുകൾ പുനഃപ്രാപ്തി ചെയ്യുന്ന ഏജന്റ്.

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

**ഇതിനുള്ള മികച്ചത്:**
- എന്റർപ്രൈസ് നോളജ് ബേസുകൾ
- ഡോക്യുമെന്റ് Q&A സിസ്റ്റങ്ങൾ
- അനുയോജ്യതയും നിയമപരമായ ഗവേഷണങ്ങളും

**AZD ടെംപ്ലേറ്റ്:** `azure-search-openai-demo`

### മാതൃക 3: മൾട്ടി-ഏജന്റ് സിസ്റ്റം

സങ്കീർണമായ ചുമതലകൾ കൈകാര്യം ചെയ്യാൻ പല വിദഗ്ധ ഏജന്റുകളും ചേർന്ന് പ്രവർത്തിക്കുക.

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

**ഇതിനുള്ള മികച്ചത്:**
- സങ്കീർണ ഉള്ളടക്കം സൃഷ്‌ടിക്കൽ
- ബഹു ഘട്ട പ്രവൃത്തി പ്രവാഹങ്ങൾ
- വ്യത്യസ്ത വിശേഷജ്ഞത ആവശ്യമായ ജോലികൾ

**കൂടുതൽ പഠിക്കുക:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ ഏജന്റ് ഉപകരണങ്ങൾ കോൺഫിഗർ ചെയ്യൽ

ഏജന്റുകൾ ഉപകരണങ്ങൾ ഉപയോഗിക്കുമ്പോൾ ശക്തിയുള്ളവയാവുന്നു. സാധാരണ ഉപകരണങ്ങൾ എങ്ങനെ കോൺഫിഗർ ചെയ്യാമെന്ന് ഇവിടെ കാണാം:

### Foundry Agents-ൽ ടൂൾ കോൺഫിഗറേഷൻ

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# ഇഷ്‌ടാനുസൃത ഉപകരണങ്ങൾ നിർവചിക്കുക
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

# ഉപകരണങ്ങളോടുകൂടിയ ഏജന്റ് സൃഷ്ടിക്കുക
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### പരിസ്ഥിതി കോൺഫിഗറേഷൻ

```bash
# ഏജന്റിന് പ്രത്യേകമായ പരിസ്ഥിതി വേരിയബിളുകൾ സജ്ജമാക്കുക
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# പുതുക്കിയ കോൺഫിഗറേഷനോടെ വിന്യസിക്കുക
azd deploy
```

---

## 📊 ഏജന്റുകൾ നിരീക്ഷിക്കൽ

### Application Insights സംവർത്തനമാക്കൽ

എല്ലാ AZD ഏജന്റ് ടെംപ്ലേറ്റുകളും നിരീക്ഷണത്തിന് Application Insights ഉൾക്കൊള്ളിച്ചിരിക്കുന്നു:

```bash
# മോണിറ്ററിംഗ് ഡാഷ്ബോർഡ് തുറക്കുക
azd monitor --overview

# ലൈവ് ലോഗുകൾ കാണുക
azd monitor --logs

# ലൈവ് മെട്രിക്‌സ് കാണുക
azd monitor --live
```

### ട്രാക്ക് ചെയ്യാനുള്ള പ്രധാന മെട്രിക്‌സ്

| മെട്രിക് | വിവരണം | ലക്ഷ്യം |
|--------|---------|--------|
| Response Latency | പ്രതികരണം സൃഷ്ടിക്കാൻ ആവശ്യമായ സമയം | < 5 seconds |
| Token Usage | ഒരു അഭ്യർത്ഥനക്ക് ഉപയോഗിക്കുന്ന ടോക്കനുകൾ | ചെലവിനായി നിരീക്ഷിക്കുക |
| Tool Call Success Rate | വിജയകരമായ ടൂൾ എക്‌സിക്യൂഷനുകളുടെ ശതമാനം | > 95% |
| Error Rate | പരാജയപ്പെട്ട ഏജന്റ് അഭ്യർത്ഥനകൾ | < 1% |
| User Satisfaction | പ്രതികരണ സ്കോറുകൾ | > 4.0/5.0 |

### ഏജენტის കസ്റ്റം ലോഗിംഗ്

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

## 💰 ചിലവ് പരിഗണനകൾ

### മാതൃകപ്രകാരം ഏകദേശം മാസാന്ത്യ ചിലവ്

| പാറ്റേൺ | Dev Environment | Production |
|---------|-----------------|------------|
| Single Agent | $50-100 | $200-500 |
| RAG Agent | $80-150 | $300-800 |
| Multi-Agent (2-3 agents) | $150-300 | $500-1,500 |
| Enterprise Multi-Agent | $300-500 | $1,500-5,000+ |

### ചിലവ് ഒപ്റ്റിമൈസേഷൻ ടિપ്സ്

1. **സാധാരണ ജോലികൾക്കായി GPT-4o-mini ഉപയോഗിക്കുക**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **പുനരാവൃത്തി ചെയ്യുന്ന ക്വെരികൾക്ക് കാഷ് നടപ്പാക്കുക**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **ടോക്കൺ പരമിതികൾ നിശ്ചയിക്കുക**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # പ്രതികരണത്തിന്റെ ദൈർഘ്യം പരിമിതപ്പെടുത്തുക
   )
   ```

4. **ഉപയോഗത്തിൽ ഇല്ലാത്തപ്പോൾ സ്കെയിൽ ടു സീറോ ചെയ്യുക**
   ```bash
   # Container Apps സ്വയമായി ശൂന്യത്തിലേക്ക് സ്കെയിൽ ചെയ്യുന്നു
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 ഏജന്റുകൾക്ക് സംശയനിവാരണത്തിൽ സഹായം

### സാധാരണ പ്രശ്‌നങ്ങൾയും പരിഹാരങ്ങളും

<details>
<summary><strong>❌ ടൂൾ വിളികളിൽ ഏജന്റ് പ്രതികരിക്കില്ല</strong></summary>

```bash
# ഉപകരണങ്ങൾ ശരിയായി രജിസ്റ്റർ ചെയ്തിട്ടുണ്ടോ എന്ന് പരിശോധിക്കുക
azd show

# OpenAI ഡിപ്ലോയ്മെന്റ് സ്ഥിരീകരിക്കുക
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# ഏജന്റ് ലോഗുകൾ പരിശോധിക്കുക
azd monitor --logs
```

**സാധാരണ കാരണങ്ങൾ:**
- ടൂൾ ഫംഗ്ഷൻ സിഗ्नेച്ചർ പൊരുത്തക്കേടായിരിക്കുന്നു
- ആവശ്യമായ അനുമതികൾ കാണാതിരിക്കുകയാണ്
- API എൻഡ്പോയിന്റ് ലഭ്യമല്ല
</details>

<details>
<summary><strong>❌ ഏജന്റിന്റെ പ്രതികരണങ്ങളിൽ ഉയർന്ന ലേറ്റൻസി</strong></summary>

```bash
# Application Insights-ൽ ബോട്ടിൽനെക്കുകൾക്കായി പരിശോധിക്കുക
azd monitor --live

# വേഗതയേറിയ ഒരു മോഡൽ ഉപയോഗിക്കാൻ പരിഗണിക്കുക
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**ഓപ്റ്റിമൈസേഷൻ ടിപ്പുകൾ:**
- സ്ട്രീമിംഗ് പ്രതികരണങ്ങൾ ഉപയോഗിക്കുക
- പ്രതികരണ കാഷിംഗ് നടപ്പാക്കുക
- കോൺടെക്സ് വിൻഡോ ആകാരം കുറയ്ക്കുക
</details>

<details>
<summary><strong>❌ ഏജന്റ് തെറ്റായ അല്ലെങ്കിൽ ഹല്യൂസിനേറ്റ് ചെയ്ത വിവരം നൽകുന്നു</strong></summary>

```python
# മികച്ച സിസ്റ്റം പ്രോംപ്റ്റുകൾ ഉപയോഗിച്ച് മെച്ചപ്പെടുത്തുക
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# അവലംബത്തിനായി തിരയൽ ചേർക്കുക
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # ഉത്തറുകൾ രേഖകളിൽ ആധാരമാക്കുക
)
```
</details>

<details>
<summary><strong>❌ ടോക്കൺ പരിധി ಮೀറലുള്ള പിശകുകൾ</strong></summary>

```python
# സന്ദർഭ വിൻഡോ മാനേജ്‌മെന്റ് നടപ്പിലാക്കുക
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # ഏകദേശം കണക്കുകൂട്ടൽ
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 പ്രായോഗിക അഭ്യാസങ്ങൾ

### അഭ്യാസം 1: ഒരു അടിസ്ഥാന ഏജന്റ് വിന്യസിക്കുക (20 മിനിറ്റ്)

**ലക്ഷ്യം:** AZD ഉപയോഗിച്ച് നിങ്ങളുടെ ആദ്യ AI ഏജന്റ് വിന്യസിക്കുക

```bash
# പടി 1: ടെംപ്ലേറ്റ് പ്രാരംഭീകരിക്കുക
azd init --template get-started-with-ai-agents

# പടി 2: Azure-ൽ ലോഗിൻ ചെയ്യുക
azd auth login

# പടി 3: വിന്യസിക്കുക
azd up

# പടി 4: ഏജന്റ് പരീക്ഷിക്കുക
# ഔട്ട്പുട്ടില്‍ കാണിച്ചിരിക്കുന്ന URL തുറക്കുക

# пടി 5: ശുചീകരിക്കുക
azd down --force --purge
```

**വിജയം ക്രൈറ്റീരിയ**
- [ ] ഏജന്റ് ചോദ്യങ്ങൾക്ക് പ്രതികരിക്കുന്നു
- [ ] നിരീക്ഷണ ഡാഷ്‌ബോർഡ് ആക്‌സസ് ചെയ്യാവുന്നതാണ്
- [ ] റിസോഴ്‌സുകൾ വിജയകരമായി ക്ലീൻ അപ്പ് ചെയ്തു

### അഭ്യാസം 2: ഒരു കസ്റ്റം ടൂൾ ചേർക്കുക (30 മിനിറ്റ്)

**ലക്ഷ്യം:** കസ്റ്റം ടൂളിലൂടെ ഒരു ഏജന്റ് വിപുലീകരിക്കുക

1. ഏജന്റ് ടെംപ്ലേറ്റ് വിന്യസിക്കുക
2. ഒരു പുതിയ ടൂൾ ഫംഗ്ഷൻ സൃഷ്ടിക്കുക:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # കാലാവസ്ഥ സേവനത്തിലേക്കുള്ള API കോൾ
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. ഏജന്റുമായി ടൂൾ രജിസ്റ്റർ ചെയ്യുക
4. ഏജന്റ് പുതിയ ടൂൾ ഉപയോഗിക്കുന്നതിൽ പരീക്ഷിക്കുക

**വിജയം ക്രൈറ്റീരിയ**
- [ ] ഏജന്റ് കാലാവസ്ഥ സംബന്ധമായ ചോദ്യങ്ങൾ തിരിച്ചറിയുന്നു
- [ ] ടൂൾ ശരിയായി വിളിക്കുന്നു
- [ ] പ്രതികരണം കാലാവസ്ഥ വിവരം ഉൾക്കൊള്ളുന്നു

### അഭ്യാസം 3: ഒരു RAG ഏജന്റ് നിർമ്മിക്കുക (45 മിനിറ്റ്)

**ലക്ഷ്യം:** നിങ്ങളുടെ ഡോക്യുമെന്റുകളിൽ നിന്നുള്ള ചോദ്യങ്ങൾക്ക് മറുപടി നൽകുന്ന ഏജന്റ് നിർമ്മിക്കുക

```bash
# RAG ടെംപ്ലേറ്റ് ഡിപ്ലോയ് ചെയ്യുക
azd init --template azure-search-openai-demo
azd up

# നിങ്ങളുടെ ഡോക്യുമെന്റുകൾ അപ്ലോഡ് ചെയ്യുക
# (ടെംപ്ലേറ്റിന്റെ ഡാറ്റ ഇൻജെക്ഷൻ ഗൈഡ് പിന്തുടരുക)

# നിശ್ಚിത മേഖല സംബന്ധമായ ചോദ്യങ്ങളുമായി പരീക്ഷിക്കുക
```

**വിജയം ക്രൈറ്റീരിയ**
- [ ] അപ്‌ലോഡ് ചെയ്ത ഡോക്യുമെന്റുകളിൽ നിന്നാണ് ഏജന്റ് മറുപടി നൽകുന്നത്
- [ ] പ്രതികരണങ്ങളിൽ ഉദ്ധരണികളുണ്ട്
- [ ] പരിധിവ बाह്യ ചോദ്യങ്ങളിൽ ഹല്യൂസിനേഷൻ ഉണ്ടാകുന്നില്ല

---

## 📚 അടുത്ത നടപടികൾ

ഈതുകൽ AI ഏജന്റുകളെക്കുറിച്ച് മനസിലാക്കി കഴിഞ്ഞാൽ, ഈ അഡ്വാൻസ്ഡ് വിഷയങ്ങൾ പഠിക്കുക:

| വിഷയം | വിവരണം | ലിങ്ക് |
|-------|---------|------|
| **Multi-Agent Systems** | ഒന്നിലധികം സഹകരിക്കുന്ന ഏജന്റുകളുള്ള സിസ്റ്റങ്ങൾ നിർമ്മിക്കുക | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Coordination Patterns** | ഓർക്കസ്‌ട്രേഷൻയും കമ്മ്യൂണിക്കേഷൻ പാറ്റേണുകളും പഠിക്കുക | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Production Deployment** | എന്റർപ്രൈസ്-തയ്യാറായ ഏജന്റ് വിന്യസണം | [Production AI Practices](production-ai-practices.md) |
| **Agent Evaluation** | ഏജന്റ് പ്രവർത്തനക്ഷമത പരിശോധിക്കുകയും വിലയിരുത്തുകയും ചെയ്യുക | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 അധിക വിഭവങ്ങൾ

### ഔദ്യോഗിക ഡോക്യുമെന്റേഷൻ
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD ഏജന്റ് ടെംപ്ലേറ്റുകൾ
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### കമ്മ്യൂണിറ്റി വിഭവങ്ങൾ
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigation**
- **മുമ്പത്തെ പാഠം**: [AI Model Deployment](ai-model-deployment.md)
- **അടുത്ത പാഠം**: [Production AI Practices](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ഡിസ്ക്ലെയിമർ:
ഈ രേഖ AI വിവർത്തന സേവനമായ [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിച്ചിട്ടുണ്ടെങ്കിലും, യാന്ത്രിക വിവർത്തനങ്ങളിൽ പിഴവുകൾ немесе തെറ്റിദ്ധാരണങ്ങൾ ഉണ്ടാവാമെന്ന് ദയവായി знമിക്കൂ. മൗലിക ഭാഷയിലെ യഥാർത്ഥ രേഖയെ പ്രാമാണിക ഉറവിടമായി കണക്കാക്കുക. നിർണായക വിവരങ്ങൾക്ക് പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം ശുപാർശ ചെയ്യപ്പെടുന്നു. ഈ വിവർത്തനം ഉപയോഗിക്കുന്നതിൽ നിന്നുണ്ടാകുന്ന ഏതെങ്കിലും തെറ്റിദ്ധാരണങ്ങൾക്കും വയർപ്പുകളിലും ഞങ്ങൾക്ക് ബാധ്യതയുണ്ടാകില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->