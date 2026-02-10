# AI-agenter med Azure Developer CLI

**Kapitelnavigering:**
- **📚 Kursens startsida**: [AZD For Beginners](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 2 - AI-First Development
- **⬅️ Föregående**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Nästa**: [Production AI Practices](production-ai-practices.md)
- **🚀 Avancerat**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## Introduktion

AI-agenter är autonoma program som kan uppfatta sin omgivning, fatta beslut och vidta åtgärder för att uppnå specifika mål. Till skillnad från enkla chattbotar som svarar på prompts kan agenter:

- **Använda verktyg** - Anropa API:er, söka i databaser, köra kod
- **Planera och resonera** - Dela upp komplexa uppgifter i steg
- **Lära av kontext** - Behålla minne och anpassa beteende
- **Samarbeta** - Arbeta med andra agenter (multi-agent-system)

Denna guide visar hur du distribuerar AI-agenter till Azure med Azure Developer CLI (azd).

## Lärandemål

Genom att slutföra denna guide kommer du att:
- Förstå vad AI-agenter är och hur de skiljer sig från chattbotar
- Distribuera färdiga AI-agentmallar med AZD
- Konfigurera Foundry Agents för egna agenter
- Implementera grundläggande agentmönster (verktygsanvändning, RAG, multi-agent)
- Övervaka och felsöka distribuerade agenter

## Läranderesultat

Efter slutförande kommer du att kunna:
- Distribuera AI-agentapplikationer till Azure med ett enda kommando
- Konfigurera agentverktyg och funktioner
- Implementera retrieval-augmented generation (RAG) med agenter
- Designa multi-agentarkitekturer för komplexa arbetsflöden
- Felsöka vanliga problem vid agentdistribution

---

## 🤖 Vad gör en agent annorlunda än en chattbot?

| Feature | Chatbot | AI Agent |
|---------|---------|----------|
| **Beteende** | Svarar på prompts | Vidtar autonoma åtgärder |
| **Verktyg** | Inga | Kan anropa API:er, söka, köra kod |
| **Minne** | Endast sessionsbaserat | Beständigt minne över sessioner |
| **Planering** | Enkel respons | Flerstegsresonemang |
| **Samarbete** | Enskild enhet | Kan arbeta med andra agenter |

### Enkel analogi

- **Chattbot** = En hjälpsam person som svarar på frågor vid ett informationsskrivbord
- **AI-agent** = En personlig assistent som kan ringa samtal, boka möten och slutföra uppgifter åt dig

---

## 🚀 Kom igång snabbt: Distribuera din första agent

### Alternativ 1: Foundry Agents-mall (Rekommenderas)

```bash
# Initiera mallen för AI-agenter
azd init --template get-started-with-ai-agents

# Distribuera till Azure
azd up
```

**Vad som distribueras:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (för RAG)
- ✅ Azure Container Apps (webbgränssnitt)
- ✅ Application Insights (övervakning)

**Tid:** ~15–20 minuter
**Kostnad:** ~100–150 USD/månad (utveckling)

### Alternativ 2: OpenAI-agent med Prompty

```bash
# Initiera den Prompty-baserade agentmallen
azd init --template agent-openai-python-prompty

# Distribuera till Azure
azd up
```

**Vad som distribueras:**
- ✅ Azure Functions (serverlös agentkörning)
- ✅ Azure OpenAI
- ✅ Prompty-konfigurationsfiler
- ✅ Exempel på agentimplementation

**Tid:** ~10–15 minuter
**Kostnad:** ~50–100 USD/månad (utveckling)

### Alternativ 3: RAG-chattagent

```bash
# Initiera RAG-chattmall
azd init --template azure-search-openai-demo

# Distribuera till Azure
azd up
```

**Vad som distribueras:**
- ✅ Azure OpenAI
- ✅ Azure AI Search med provdata
- ✅ Dokumentbearbetningspipeline
- ✅ Chattgränssnitt med källhänvisningar

**Tid:** ~15–25 minuter
**Kostnad:** ~80–150 USD/månad (utveckling)

---

## 🏗️ Agentarkitekturmönster

### Mönster 1: Enkel agent med verktyg

Det enklaste agentmönstret - en agent som kan använda flera verktyg.

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

**Passar bäst för:**
- Kundsupport-botar
- Forskningsassistenter
- Dataanalysagenter

**AZD-mall:** `azure-search-openai-demo`

### Mönster 2: RAG-agent (Retrieval-Augmented Generation)

En agent som hämtar relevanta dokument innan den genererar svar.

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

**Passar bäst för:**
- Företagskunskapsbaser
- Dokument Q&A-system
- Regelefterlevnad och juridisk forskning

**AZD-mall:** `azure-search-openai-demo`

### Mönster 3: Multi-agent-system

Flera specialiserade agenter som arbetar tillsammans med komplexa uppgifter.

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

**Passar bäst för:**
- Komplex innehållsgenerering
- Flerstegsarbetsflöden
- Uppgifter som kräver olika expertis

**Läs mer:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Konfigurera agentverktyg

Agenter blir kraftfulla när de kan använda verktyg. Så här konfigurerar du vanliga verktyg:

### Verktygskonfiguration i Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Definiera anpassade verktyg
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

# Skapa agent med verktyg
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Miljökonfiguration

```bash
# Konfigurera agentspecifika miljövariabler
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Distribuera med uppdaterad konfiguration
azd deploy
```

---

## 📊 Övervaka agenter

### Integration med Application Insights

Alla AZD-agentmallar inkluderar Application Insights för övervakning:

```bash
# Öppna övervakningspanel
azd monitor --overview

# Visa loggar i realtid
azd monitor --logs

# Visa mätvärden i realtid
azd monitor --live
```

### Viktiga mätvärden att spåra

| Metric | Description | Target |
|--------|-------------|--------|
| Response Latency | Tid att generera svar | < 5 sekunder |
| Token Usage | Tokens per begäran | Övervaka för kostnad |
| Tool Call Success Rate | % lyckade verktygsanrop | > 95% |
| Error Rate | Misslyckade agentförfrågningar | < 1% |
| User Satisfaction | Betyg från användare | > 4.0/5.0 |

### Anpassad loggning för agenter

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

## 💰 Kostnadsöverväganden

### Uppskattade månadskostnader per mönster

| Pattern | Dev Environment | Production |
|---------|-----------------|------------|
| Single Agent | $50-100 | $200-500 |
| RAG Agent | $80-150 | $300-800 |
| Multi-Agent (2-3 agents) | $150-300 | $500-1,500 |
| Enterprise Multi-Agent | $300-500 | $1,500-5,000+ |

### Tips för kostnadsoptimering

1. **Använd GPT-4o-mini för enkla uppgifter**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Implementera caching för upprepade förfrågningar**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Sätt tokenbegränsningar**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Begränsa svarslängden
   )
   ```

4. **Skala till noll när det inte används**
   ```bash
   # Container Apps skalas automatiskt ner till noll
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Felsökning av agenter

### Vanliga problem och lösningar

<details>
<summary><strong>❌ Agent svarar inte på verktygsanrop</strong></summary>

```bash
# Kontrollera om verktygen är korrekt registrerade
azd show

# Verifiera OpenAI-distributionen
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Kontrollera agentloggar
azd monitor --logs
```

**Vanliga orsaker:**
- Fel i verktygsfunktionssignatur
- Saknade nödvändiga behörigheter
- API-endpoint inte åtkomlig
</details>

<details>
<summary><strong>❌ Hög latens i agentrespons</strong></summary>

```bash
# Kontrollera Application Insights efter flaskhalsar
azd monitor --live

# Överväg att använda en snabbare modell
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Optimeringstips:**
- Använd streamade svar
- Implementera response-caching
- Minska kontextfönstrets storlek
</details>

<details>
<summary><strong>❌ Agenten återger felaktig eller hallucinatorisk information</strong></summary>

```python
# Förbättra med bättre systempromptar
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Lägg till hämtning för att förankra
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Förankra svar i dokument
)
```
</details>

<details>
<summary><strong>❌ Fel vid överskridet token-gräns</strong></summary>

```python
# Implementera hantering av kontextfönster
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Ungefärlig uppskattning
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Praktiska övningar

### Övning 1: Distribuera en grundläggande agent (20 minuter)

**Mål:** Distribuera din första AI-agent med AZD

```bash
# Steg 1: Initiera mallen
azd init --template get-started-with-ai-agents

# Steg 2: Logga in på Azure
azd auth login

# Steg 3: Distribuera
azd up

# Steg 4: Testa agenten
# Öppna URL:en som visas i utdata

# Steg 5: Rensa upp
azd down --force --purge
```

**Kriterier för framgång:**
- [ ] Agenten svarar på frågor
- [ ] Kan nå övervakningsinstrumentpanelen
- [ ] Resurser städas upp framgångsrikt

### Övning 2: Lägg till ett eget verktyg (30 minuter)

**Mål:** Utöka en agent med ett anpassat verktyg

1. Distribuera agentmallen
2. Skapa en ny verktygsfunktion:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # API-anrop till vädertjänst
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Registrera verktyget hos agenten
4. Testa att agenten använder det nya verktyget

**Kriterier för framgång:**
- [ ] Agenten känner igen väderrelaterade frågor
- [ ] Verktyget anropas korrekt
- [ ] Svar innehåller väderinformation

### Övning 3: Bygg en RAG-agent (45 minuter)

**Mål:** Skapa en agent som svarar på frågor utifrån dina dokument

```bash
# Distribuera RAG-mallen
azd init --template azure-search-openai-demo
azd up

# Ladda upp dina dokument
# (Följ mallens guide för datainmatning)

# Testa med domänspecifika frågor
```

**Kriterier för framgång:**
- [ ] Agenten svarar utifrån uppladdade dokument
- [ ] Svaren inkluderar källhänvisningar
- [ ] Ingen hallucination på frågor utanför omfattningen

---

## 📚 Nästa steg

Nu när du förstår AI-agenter, utforska dessa avancerade ämnen:

| Topic | Description | Link |
|-------|-------------|------|
| **Multi-Agent Systems** | Bygg system med flera samarbetande agenter | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Coordination Patterns** | Lär dig orkestrerings- och kommunikationsmönster | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Production Deployment** | Agentdistribution för företag | [Production AI Practices](production-ai-practices.md) |
| **Agent Evaluation** | Testa och utvärdera agentens prestanda | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Ytterligare resurser

### Officiell dokumentation
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD-mallar för agenter
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Community-resurser
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigering**
- **Föregående lektion**: [AI Model Deployment](ai-model-deployment.md)
- **Nästa lektion**: [Production AI Practices](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten Co-op Translator (https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet bör du vara medveten om att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet i dess originalspråk bör betraktas som den auktoritativa källan. För viktig information rekommenderas professionell, mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår genom användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->