# AI Agents with Azure Developer CLI

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Kabanata 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Practices](production-ai-practices.md)
- **🚀 Advanced**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## Introduction

Ang mga AI agent ay mga awtonomong programa na nakakakita ng kanilang kapaligiran, nakagagawa ng mga desisyon, at kumikilos upang makamit ang mga partikular na layunin. Hindi tulad ng simpleng mga chatbot na tumutugon sa mga prompt, ang mga agent ay maaaring:

- **Gumamit ng mga tool** - Tumawag ng APIs, maghanap sa mga database, magpatakbo ng code
- **Magplano at mag-reason** - Hatiin ang mga komplikadong gawain sa mga hakbang
- **Matuto mula sa konteksto** - Magpanatili ng memorya at iangkop ang pag-uugali
- **Makipagtulungan** - Makipagtulungan sa ibang mga agent (mga multi-agent system)

Ipinapakita ng gabay na ito kung paano mag-deploy ng mga AI agent sa Azure gamit ang Azure Developer CLI (azd).

## Learning Goals

Sa pamamagitan ng pagtatapos ng gabay na ito, ikaw ay:
- Maiintindihan kung ano ang mga AI agent at kung paano sila naiiba sa mga chatbot
- Makakapag-deploy ng mga pre-built na AI agent template gamit ang AZD
- Makakakumpigura ng Foundry Agents para sa mga custom agent
- Makakapatupad ng mga pangunahing pattern ng agent (paggamit ng tool, RAG, multi-agent)
- Makakamonitor at mag-debug ng mga na-deploy na agent

## Learning Outcomes

Pagkatapos matapos, magagawa mong:
- Mag-deploy ng mga AI agent application sa Azure gamit ang isang utos
- I-configure ang mga tool at kakayahan ng agent
- Magpatupad ng retrieval-augmented generation (RAG) kasama ang mga agent
- Magdisenyo ng multi-agent architectures para sa mga komplikadong workflow
- Mag-troubleshoot ng mga karaniwang isyu sa deployment ng agent

---

## 🤖 Ano ang Pagkakaiba ng Agent mula sa Chatbot?

| Tampok | Chatbot | AI Agent |
|--------|---------|----------|
| **Pag-uugali** | Tumutugon sa mga prompt | Gumagawa ng awtonomong mga aksyon |
| **Mga tool** | Wala | Maaaring tumawag ng APIs, maghanap, magpatakbo ng code |
| **Memorya** | Batay lamang sa session | Persistent na memorya sa mga session |
| **Pagpaplano** | Isang tugon lang | Multi-step na pag-iisip |
| **Pakikipagtulungan** | Isang entidad lang | Maaaring makipagtulungan sa ibang mga agent |

### Simple Analogy

- **Chatbot** = Isang matulunging tao na sumasagot sa mga tanong sa information desk
- **AI Agent** = Isang personal na assistant na maaaring tumawag, mag-book ng appointment, at tapusin ang mga gawain para sa iyo

---

## 🚀 Quick Start: I-deploy ang Iyong Unang Agent

### Option 1: Foundry Agents Template (Recommended)

```bash
# Ihanda ang template para sa mga AI ahente
azd init --template get-started-with-ai-agents

# I-deploy sa Azure
azd up
```

**Ano ang ide-deploy:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (para sa RAG)
- ✅ Azure Container Apps (web interface)
- ✅ Application Insights (monitoring)

**Oras:** ~15-20 minuto
**Gastos:** ~$100-150/buwan (development)

### Option 2: OpenAI Agent with Prompty

```bash
# I-initialize ang template ng agent na nakabase sa Prompty
azd init --template agent-openai-python-prompty

# I-deploy sa Azure
azd up
```

**Ano ang ide-deploy:**
- ✅ Azure Functions (serverless agent execution)
- ✅ Azure OpenAI
- ✅ Prompty configuration files
- ✅ Sample agent implementation

**Oras:** ~10-15 minuto
**Gastos:** ~$50-100/buwan (development)

### Option 3: RAG Chat Agent

```bash
# I-initialize ang RAG chat template
azd init --template azure-search-openai-demo

# I-deploy sa Azure
azd up
```

**Ano ang ide-deploy:**
- ✅ Azure OpenAI
- ✅ Azure AI Search na may sample data
- ✅ Document processing pipeline
- ✅ Chat interface na may citations

**Oras:** ~15-25 minuto
**Gastos:** ~$80-150/buwan (development)

---

## 🏗️ Mga Pattern ng Arkitektura ng Agent

### Pattern 1: Single Agent with Tools

Ang pinakasimpleng pattern ng agent - isang agent na maaaring gumamit ng maraming tool.

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

**Pinaka-angkop para sa:**
- Customer support bots
- Research assistants
- Data analysis agents

**AZD Template:** `azure-search-openai-demo`

### Pattern 2: RAG Agent (Retrieval-Augmented Generation)

Isang agent na kumukuha ng mga kaugnay na dokumento bago bumuo ng mga tugon.

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

**Pinaka-angkop para sa:**
- Enterprise knowledge bases
- Document Q&A systems
- Compliance at legal research

**AZD Template:** `azure-search-openai-demo`

### Pattern 3: Multi-Agent System

Maramihang mga specialized na agent na nagtutulungan sa mga komplikadong gawain.

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

**Pinaka-angkop para sa:**
- Komplikadong content generation
- Multi-step workflows
- Mga gawain na nangangailangan ng iba't ibang expertise

**Learn More:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Pag-configure ng Mga Tool ng Agent

Nagiging makapangyarihan ang mga agent kapag maaari silang gumamit ng mga tool. Narito kung paano i-configure ang mga karaniwang tool:

### Tool Configuration in Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Tukuyin ang mga pasadyang tool
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

# Gumawa ng ahente gamit ang mga tool
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Environment Configuration

```bash
# Itakda ang mga environment variable na tukoy sa agent
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# I-deploy gamit ang na-update na konfigurasyon
azd deploy
```

---

## 📊 Pagmo-monitor ng Mga Agent

### Application Insights Integration

Lahat ng AZD agent templates ay may kasamang Application Insights para sa monitoring:

```bash
# Buksan ang dashboard ng pagsubaybay
azd monitor --overview

# Tingnan ang mga log nang real-time
azd monitor --logs

# Tingnan ang mga sukatan nang real-time
azd monitor --live
```

### Mga Pangunahing Metric na Subaybayan

| Metric | Paglalarawan | Target |
|--------|--------------|--------|
| Response Latency | Oras para bumuo ng tugon | < 5 seconds |
| Token Usage | Mga token bawat request | Subaybayan para sa gastos |
| Tool Call Success Rate | % ng matagumpay na pag-execute ng tool | > 95% |
| Error Rate | Nabigong mga request ng agent | < 1% |
| User Satisfaction | Mga feedback score | > 4.0/5.0 |

### Custom Logging para sa Mga Agent

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

## 💰 Mga Dapat Isaalang-alang sa Gastos

### Tinatayang Buwanang Gastos ayon sa Pattern

| Pattern | Dev Environment | Production |
|---------|-----------------|------------|
| Single Agent | $50-100 | $200-500 |
| RAG Agent | $80-150 | $300-800 |
| Multi-Agent (2-3 agents) | $150-300 | $500-1,500 |
| Enterprise Multi-Agent | $300-500 | $1,500-5,000+ |

### Mga Tip para sa Pag-optimize ng Gastos

1. **Gumamit ng GPT-4o-mini para sa simpleng mga gawain**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Magpatupad ng caching para sa mga paulit-ulit na query**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Mag-set ng token limits**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Limitahan ang haba ng tugon
   )
   ```

4. **I-scale to zero kapag hindi ginagamit**
   ```bash
   # Awtomatikong bumababa ang bilang ng mga Container Apps hanggang sa zero
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Pag-troubleshoot ng Mga Agent

### Mga Karaniwang Isyu at Mga Solusyon

<details>
<summary><strong>❌ Agent hindi tumutugon sa mga tawag ng tool</strong></summary>

```bash
# Suriin kung maayos na nakarehistro ang mga tool
azd show

# Suriin ang deployment ng OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Suriin ang mga log ng ahente
azd monitor --logs
```

**Mga Karaniwang sanhi:**
- Hindi tugmang signature ng function ng tool
- Nawawalang kinakailangang permiso
- Hindi maa-access ang API endpoint
</details>

<details>
<summary><strong>❌ Mataas na latency sa mga tugon ng agent</strong></summary>

```bash
# Suriin ang Application Insights para sa mga sagabal
azd monitor --live

# Isaalang-alang ang paggamit ng mas mabilis na modelo
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Mga tip sa pag-optimize:**
- Gumamit ng streaming responses
- Magpatupad ng response caching
- Bawasan ang laki ng context window
</details>

<details>
<summary><strong>❌ Agent nagbabalik ng maling o hallucinated na impormasyon</strong></summary>

```python
# Pagbutihin gamit ang mas mahusay na mga prompt ng sistema
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Magdagdag ng pagkuha para sa pagpapatibay
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # I-base ang mga sagot sa mga dokumento
)
```
</details>

<details>
<summary><strong>❌ Lumabis ang token limit errors</strong></summary>

```python
# Ipatupad ang pamamahala ng window ng konteksto
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Magaspang na tantya
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Hands-On Exercises

### Exercise 1: I-deploy ang Isang Basic Agent (20 minuto)

**Layunin:** I-deploy ang iyong unang AI agent gamit ang AZD

```bash
# Hakbang 1: I-initialize ang template
azd init --template get-started-with-ai-agents

# Hakbang 2: Mag-login sa Azure
azd auth login

# Hakbang 3: I-deploy
azd up

# Hakbang 4: Subukan ang ahente
# Buksan ang URL na ipinakita sa output

# Hakbang 5: Linisin ang mga resources
azd down --force --purge
```

**Success Criteria:**
- [ ] Agent ay tumutugon sa mga tanong
- [ ] Maa-access ang monitoring dashboard
- [ ] Malinis nang maayos ang mga resources

### Exercise 2: Magdagdag ng Custom Tool (30 minuto)

**Layunin:** Palawakin ang agent gamit ang isang custom na tool

1. I-deploy ang agent template
2. Lumikha ng bagong tool function:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Tawag sa API sa serbisyo ng panahon
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. I-register ang tool sa agent
4. Subukan na ginagamit ng agent ang bagong tool

**Success Criteria:**
- [ ] Nakikilala ng agent ang mga tanong tungkol sa panahon
- [ ] Tama ang pagtawag sa tool
- [ ] Kasama sa tugon ang impormasyon ng panahon

### Exercise 3: Bumuo ng RAG Agent (45 minuto)

**Layunin:** Gumawa ng agent na sumasagot mula sa iyong mga dokumento

```bash
# I-deploy ang template ng RAG
azd init --template azure-search-openai-demo
azd up

# I-upload ang iyong mga dokumento
# (Sundan ang gabay ng template para sa pag-import ng datos)

# Subukan gamit ang mga tanong na partikular sa domain
```

**Success Criteria:**
- [ ] Sumagot ang agent mula sa mga na-upload na dokumento
- [ ] May kasamang citations ang mga tugon
- [ ] Walang hallucination sa mga tanong na wala sa saklaw

---

## 📚 Susunod na Mga Hakbang

Ngayon na naiintindihan mo na ang mga AI agent, tuklasin ang mga advanced na paksa na ito:

| Topic | Paglalarawan | Link |
|-------|--------------|------|
| **Multi-Agent Systems** | Bumuo ng mga system na may maramihang magkakatuwang na agent | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Coordination Patterns** | Matutunan ang orchestration at communication patterns | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Production Deployment** | Enterprise-ready na deployment ng agent | [Production AI Practices](production-ai-practices.md) |
| **Agent Evaluation** | Subukan at suriin ang performance ng agent | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Karagdagang Mga Mapagkukunan

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
Paunawa:
Ang dokumentong ito ay isinalin gamit ang serbisyong AI para sa pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o mga di-katumpakan. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pinakapinagkakatiwalaang sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na magmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->