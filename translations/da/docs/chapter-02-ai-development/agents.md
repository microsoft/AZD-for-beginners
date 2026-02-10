# AI-agenter med Azure Developer CLI

**Kapitelnavigation:**
- **📚 Course Home**: [AZD for begyndere](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 2 - AI-først udvikling
- **⬅️ Forrige**: [AI-modeludrulning](ai-model-deployment.md)
- **➡️ Næste**: [Produktions-AI-praksis](production-ai-practices.md)
- **🚀 Avanceret**: [Multi-agentløsninger](../../examples/retail-scenario.md)

---

## Introduktion

AI-agenter er autonome programmer, der kan opfatte deres omgivelser, træffe beslutninger og udføre handlinger for at nå specifikke mål. I modsætning til simple chatbots, der svarer på prompts, kan agenter:

- **Bruge værktøjer** - Kalde API'er, søge i databaser, køre kode
- **Planlægge og ræsonnere** - Opdele komplekse opgaver i trin
- **Lære fra kontekst** - Vedligeholde hukommelse og tilpasse adfærd
- **Samarbejde** - Arbejde sammen med andre agenter (multi-agent-systemer)

Denne vejledning viser dig, hvordan du udruller AI-agenter til Azure ved hjælp af Azure Developer CLI (azd).

## Læringsmål

Ved at gennemføre denne vejledning vil du:
- Forstå hvad AI-agenter er, og hvordan de adskiller sig fra chatbots
- Udrulle færdigbyggede AI-agent-skabeloner ved hjælp af AZD
- Konfigurere Foundry Agents til brugerdefinerede agenter
- Implementere grundlæggende agentmønstre (værktøjsbrug, RAG, multi-agent)
- Overvåge og debugge udrullede agenter

## Læringsresultater

Efter gennemførelsen vil du kunne:
- Udrulle AI-agentapplikationer til Azure med en enkelt kommando
- Konfigurere agentværktøjer og funktionaliteter
- Implementere retrieval-augmented generation (RAG) med agenter
- Designe multi-agent-arkitekturer til komplekse arbejdsgange
- Fejlsøge almindelige problemer ved agentudrulning

---

## 🤖 Hvad gør en agent forskellig fra en chatbot?

| Funktion | Chatbot | AI-agent |
|---------|---------|----------|
| **Adfærd** | Svarer på prompts | Tage autonome handlinger |
| **Værktøjer** | Ingen | Kan kalde API'er, søge, udføre kode |
| **Hukommelse** | Kun sessionsbaseret | Vedvarende hukommelse på tværs af sessioner |
| **Planlægning** | Enkelt svar | Flertrins ræsonnement |
| **Samarbejde** | Enkelt enhed | Kan arbejde med andre agenter |

### Enkel analogi

- **Chatbot** = En hjælpsom person, der svarer på spørgsmål ved et informationsskrank
- **AI-agent** = En personlig assistent, der kan foretage opkald, booke aftaler og udføre opgaver for dig

---

## 🚀 Kom godt i gang: Udrul din første agent

### Mulighed 1: Foundry Agents-skabelon (anbefalet)

```bash
# Initialiser skabelonen til AI-agenter
azd init --template get-started-with-ai-agents

# Udrul til Azure
azd up
```

**Hvad der bliver udrullet:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (til RAG)
- ✅ Azure Container Apps (webgrænseflade)
- ✅ Application Insights (overvågning)

**Tid:** ~15-20 minutter
**Omkostning:** ~$100-150/måned (udvikling)

### Mulighed 2: OpenAI-agent med Prompty

```bash
# Initialiser den Prompty-baserede agent-skabelon
azd init --template agent-openai-python-prompty

# Udrul til Azure
azd up
```

**Hvad der bliver udrullet:**
- ✅ Azure Functions (serverløs agent-udførelse)
- ✅ Azure OpenAI
- ✅ Prompty-konfigurationsfiler
- ✅ Eksempel på agentimplementering

**Tid:** ~10-15 minutter
**Omkostning:** ~$50-100/måned (udvikling)

### Mulighed 3: RAG-chatagent

```bash
# Initialiser RAG-chat-skabelon
azd init --template azure-search-openai-demo

# Udrul til Azure
azd up
```

**Hvad der bliver udrullet:**
- ✅ Azure OpenAI
- ✅ Azure AI Search med eksempeldata
- ✅ Dokumentprocesseringspipeline
- ✅ Chatgrænseflade med kildehenvisninger

**Tid:** ~15-25 minutter
**Omkostning:** ~$80-150/måned (udvikling)

---

## 🏗️ Agent-arkitekturmønstre

### Mønster 1: Enkel agent med værktøjer

Det simpleste agentmønster - en agent, der kan bruge flere værktøjer.

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

**Bedst til:**
- Kundesupport-bots
- Forskningsassistenter
- Dataanalyseagenter

**AZD-skabelon:** `azure-search-openai-demo`

### Mønster 2: RAG-agent (Retrieval-Augmented Generation)

En agent, der henter relevante dokumenter, før den genererer svar.

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

**Bedst til:**
- Virksomheders vidensdatabaser
- Dokument Q&A-systemer
- Compliance og juridisk research

**AZD-skabelon:** `azure-search-openai-demo`

### Mønster 3: Multi-agent-system

Flere specialiserede agenter, der arbejder sammen om komplekse opgaver.

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

**Bedst til:**
- Kompleks indholdsgenerering
- Flertrins arbejdsgange
- Opgaver, der kræver forskellig ekspertise

**Lær mere:** [Koordineringsmønstre for multi-agent](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Konfiguration af agentværktøjer

Agenter bliver kraftfulde, når de kan bruge værktøjer. Her er hvordan du konfigurerer almindelige værktøjer:

### Værktøjskonfiguration i Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Definer brugerdefinerede værktøjer
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

# Opret agent med værktøjer
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Miljøkonfiguration

```bash
# Opsæt agent-specifikke miljøvariabler
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Udrul med opdateret konfiguration
azd deploy
```

---

## 📊 Overvågning af agenter

### Integration med Application Insights

Alle AZD-agent-skabeloner inkluderer Application Insights til overvågning:

```bash
# Åbn overvågningsdashboard
azd monitor --overview

# Se logfiler i realtid
azd monitor --logs

# Se målinger i realtid
azd monitor --live
```

### Vigtige målepunkter at spore

| Metrik | Beskrivelse | Mål |
|--------|-------------|--------|
| Responstid | Tid til at generere svar | < 5 sekunder |
| Tokenforbrug | Tokens pr. anmodning | Overvåg for omkostninger |
| Succesrate for værktøjskald | % af succesfulde værktøjskald | > 95% |
| Fejlfrekvens | Mislykkede agentanmodninger | < 1% |
| Brugertilfredshed | Feedback-score | > 4.0/5.0 |

### Brugerdefineret logning for agenter

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

## 💰 Omkostningsovervejelser

### Estimerede månedlige omkostninger efter mønster

| Mønster | Udviklingsmiljø | Produktion |
|---------|-----------------|------------|
| Enkel agent | $50-100 | $200-500 |
| RAG-agent | $80-150 | $300-800 |
| Multi-agent (2-3 agenter) | $150-300 | $500-1,500 |
| Enterprise multi-agent | $300-500 | $1,500-5,000+ |

### Tips til omkostningsoptimering

1. **Brug GPT-4o-mini til simple opgaver**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Implementer caching for gentagne forespørgsler**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Sæt tokenbegrænsninger**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Begræns svarlængden
   )
   ```

4. **Skaler til nul, når det ikke er i brug**
   ```bash
   # Container Apps skalerer automatisk til nul
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Fejlfinding for agenter

### Almindelige problemer og løsninger

<details>
<summary><strong>❌ Agent reagerer ikke på værktøjskald</strong></summary>

```bash
# Kontroller, om værktøjerne er korrekt registreret
azd show

# Bekræft OpenAI-udrulningen
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Kontroller agentens logfiler
azd monitor --logs
```

**Almindelige årsager:**
- Uoverensstemmelse i værktøjsfunktionssignatur
- Manglende nødvendige tilladelser
- API-endpoint ikke tilgængeligt
</details>

<details>
<summary><strong>❌ Høj latenstid i agentens svar</strong></summary>

```bash
# Tjek Application Insights for flaskehalse
azd monitor --live

# Overvej at bruge en hurtigere model
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Optimeringstips:**
- Brug streaming-responser
- Implementer respons-caching
- Reducer kontekstvinduesstørrelsen
</details>

<details>
<summary><strong>❌ Agenten returnerer ukorrekt eller hallucinatorisk information</strong></summary>

```python
# Forbedr med bedre systemprompter
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Tilføj opslag for forankring
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Forankr svar i dokumenter
)
```
</details>

<details>
<summary><strong>❌ Token-grænse overskredet</strong></summary>

```python
# Implementer håndtering af kontekstvindue
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Groft estimat
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Praktiske øvelser

### Øvelse 1: Udrul en grundlæggende agent (20 minutter)

**Mål:** Udrul din første AI-agent ved hjælp af AZD

```bash
# Trin 1: Initialiser skabelon
azd init --template get-started-with-ai-agents

# Trin 2: Log ind på Azure
azd auth login

# Trin 3: Udrul
azd up

# Trin 4: Test agenten
# Åbn den URL, der vises i outputtet

# Trin 5: Ryd op
azd down --force --purge
```

**Succeskriterier:**
- [ ] Agenten svarer på spørgsmål
- [ ] Kan få adgang til overvågningsdashboard
- [ ] Ressourcer ryddet op med succes

### Øvelse 2: Tilføj et brugerdefineret værktøj (30 minutter)

**Mål:** Udvid en agent med et brugerdefineret værktøj

1. Udrul agent-skabelonen
2. Opret en ny værktøjsfunktion:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # API-kald til vejrtjeneste
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Registrer værktøjet hos agenten
4. Test at agenten bruger det nye værktøj

**Succeskriterier:**
- [ ] Agenten genkender vejrudspørgsler
- [ ] Værktøjet kaldes korrekt
- [ ] Svaret indeholder vejrdata

### Øvelse 3: Byg en RAG-agent (45 minutter)

**Mål:** Opret en agent, der besvarer spørgsmål ud fra dine dokumenter

```bash
# Udrul RAG-skabelon
azd init --template azure-search-openai-demo
azd up

# Upload dine dokumenter
# (Følg skabelonens vejledning til dataindtagelse)

# Test med domænespecifikke spørgsmål
```

**Succeskriterier:**
- [ ] Agenten svarer ud fra uploadede dokumenter
- [ ] Svar inkluderer kildehenvisninger
- [ ] Ingen hallucinationer ved spørgsmål uden for omfanget

---

## 📚 Næste skridt

Nu hvor du forstår AI-agenter, kan du udforske disse avancerede emner:

| Emne | Beskrivelse | Link |
|-------|-------------|------|
| **Multi-agent-systemer** | Byg systemer med flere samarbejdende agenter | [Eksempel på multi-agent i detailhandel](../../examples/retail-scenario.md) |
| **Koordineringsmønstre** | Lær orkestrerings- og kommunikationsmønstre | [Koordineringsmønstre](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Produktionsudrulning** | Agentudrulning klar til virksomhedsbrug | [Produktions-AI-praksis](production-ai-practices.md) |
| **Agent-evaluering** | Test og evaluer agentens ydeevne | [AI-fejlfinding](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Yderligere ressourcer

### Officiel dokumentation
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD-skabeloner til agenter
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Fællesskabsressourcer
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigation**
- **Forrige lektion**: [AI-modeludrulning](ai-model-deployment.md)
- **Næste lektion**: [Produktions-AI-praksis](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten Co-op Translator (https://github.com/Azure/co-op-translator). Selvom vi bestræber os på at være præcise, skal du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på originalsproget bør betragtes som den autoritative kilde. For kritisk information anbefales en professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->