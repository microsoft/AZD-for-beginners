# AI-agenter med Azure Developer CLI

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Beginners](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 2 - AI-først udvikling
- **⬅️ Forrige**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Næste**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Avanceret**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## Introduktion

AI-agenter er autonome programmer, der kan opfatte deres omgivelser, træffe beslutninger og udføre handlinger for at nå specifikke mål. I modsætning til simple chatbots, der reagerer på forespørgsler, kan agenter:

- **Bruge værktøjer** - Kalde API'er, søge i databaser, udføre kode
- **Planlægge og ræsonnere** - Opdele komplekse opgaver i trin
- **Lære af kontekst** - Bevare hukommelse og tilpasse adfærd
- **Samarbejde** - Arbejde med andre agenter (multi-agent-systemer)

Denne vejledning viser, hvordan du implementerer AI-agenter til Azure ved hjælp af Azure Developer CLI (azd).

> **Valideringsbemærkning (2026-03-25):** Denne vejledning blev gennemgået med `azd` `1.23.12` og `azure.ai.agents` `0.1.18-preview`. Oplevelsen `azd ai` er stadig preview-drevet, så tjek udvidelsens hjælp, hvis dine installerede flags adskiller sig.

## Læringsmål

Ved at gennemføre denne vejledning vil du:
- Forstå hvad AI-agenter er, og hvordan de adskiller sig fra chatbots
- Implementere færdigbyggede AI-agent-skabeloner ved hjælp af AZD
- Konfigurere Foundry-agenter til brugerdefinerede agenter
- Implementere grundlæggende agentmønstre (værktøjsbrug, RAG, multi-agent)
- Overvåge og fejlfinde implementerede agenter

## Læringsresultater

Efter gennemførelse vil du kunne:
- Implementere AI-agent-applikationer til Azure med en enkelt kommando
- Konfigurere agentværktøjer og -funktioner
- Implementere retrieval-augmented generation (RAG) med agenter
- Designe multi-agent-arkitekturer til komplekse arbejdsgange
- Fejlfinde almindelige problemer ved agentimplementering

---

## 🤖 Hvad gør en agent forskellig fra en chatbot?

| Funktion | Chatbot | AI-agent |
|---------|---------|----------|
| **Adfærd** | Reagerer på forespørgsler | Tager autonome handlinger |
| **Værktøjer** | Ingen | Kan kalde API'er, søge, udføre kode |
| **Hukommelse** | Kun sessionsbaseret | Vedvarende hukommelse på tværs af sessioner |
| **Planlægning** | Enkelt svar | Flertrins ræsonnement |
| **Samarbejde** | Enkelt enhed | Kan arbejde sammen med andre agenter |

### Enkel analogi

- **Chatbot** = En hjælpsom person, der besvarer spørgsmål i en informationsskranke
- **AI-agent** = En personlig assistent, som kan foretage opkald, booke aftaler og udføre opgaver for dig

---

## 🚀 Kom godt i gang: Implementer din første agent

### Mulighed 1: Foundry Agents-skabelon (Anbefalet)

```bash
# Initialiser AI-agenternes skabelon
azd init --template get-started-with-ai-agents

# Udrul til Azure
azd up
```

**Hvad der implementeres:**
- ✅ Foundry Agents
- ✅ Microsoft Foundry Models (gpt-4.1)
- ✅ Azure AI Search (til RAG)
- ✅ Azure Container Apps (webgrænseflade)
- ✅ Application Insights (overvågning)

**Tid:** ~15-20 minutter
**Omkostninger:** ~$100-150/måned (udvikling)

### Mulighed 2: OpenAI-agent med Prompty

```bash
# Initialiser den Prompty-baserede agent-skabelon
azd init --template agent-openai-python-prompty

# Udrul til Azure
azd up
```

**Hvad der implementeres:**
- ✅ Azure Functions (serverless agentudførelse)
- ✅ Microsoft Foundry Models
- ✅ Prompty-konfigurationsfiler
- ✅ Eksempelagent-implementering

**Tid:** ~10-15 minutter
**Omkostninger:** ~$50-100/måned (udvikling)

### Mulighed 3: RAG Chat-agent

```bash
# Initialiser RAG-chatskabelon
azd init --template azure-search-openai-demo

# Udrul til Azure
azd up
```

**Hvad der implementeres:**
- ✅ Microsoft Foundry Models
- ✅ Azure AI Search med eksempeldata
- ✅ Dokumentbehandlingspipeline
- ✅ Chatgrænseflade med citater

**Tid:** ~15-25 minutter
**Omkostninger:** ~$80-150/måned (udvikling)

### Mulighed 4: AZD AI Agent Init (Manifest- eller skabelonbaseret preview)

Hvis du har en agent-manifestfil, kan du bruge `azd ai`-kommandoen til at opbygge et Foundry Agent Service-projekt direkte. Nylige preview-udgivelser har også tilføjet skabelonbaseret initialiseringssupport, så den nøjagtige prompt-flow kan variere lidt afhængigt af din installerede udvidelsesversion.

```bash
# Installer udvidelsen til AI-agenter
azd extension install azure.ai.agents

# Valgfrit: bekræft den installerede preview-version
azd extension show azure.ai.agents

# Initialiser fra et agentmanifest
azd ai agent init -m agent-manifest.yaml

# Udrul til Azure
azd up
```

**Hvornår man skal bruge `azd ai agent init` vs `azd init --template`:**

| Tilgang | Bedst til | Hvordan det virker |
|----------|----------|------|
| `azd init --template` | Starte fra en fungerende eksempelapp | Kloner et komplet skabelon-repo med kode + infrastruktur |
| `azd ai agent init -m` | Bygge ud fra din egen agent-manifest | Skaber projektstruktur ud fra din agentdefinition |

> **Tip:** Brug `azd init --template` når du lærer (Muligheder 1-3 ovenfor). Brug `azd ai agent init` når du bygger produktionsagenter med dine egne manifests. Se [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for fuld reference.

---

## 🏗️ Agentarkitekturmønstre

### Mønster 1: Enkelt agent med værktøjer

Det simpleste agentmønster - en agent, der kan bruge flere værktøjer.

```mermaid
graph TD
    UI[Brugergrænseflade] --> Agent[AI-agent<br/>gpt-4.1]
    Agent --> Search[Søgeværktøj]
    Agent --> Database[Databaseværktøj]
    Agent --> API[API-værktøj]
```
**Bedst til:**
- Kundesupportbots
- Forskningsassistenter
- Dataanalyseagenter

**AZD-skabelon:** `azure-search-openai-demo`

### Mønster 2: RAG-agent (Retrieval-Augmented Generation)

En agent, der henter relevante dokumenter, før den genererer svar.

```mermaid
graph TD
    Query[Brugerforespørgsel] --> RAG[RAG-agent]
    RAG --> Vector[Vektorsøgning]
    RAG --> LLM[Stor sprogmodel<br/>gpt-4.1]
    Vector -- Dokumenter --> LLM
    LLM --> Response[Svar med kildehenvisninger]
```
**Bedst til:**
- Virksomhedens vidensbaser
- Dokument Q&A-systemer
- Overholdelse og juridisk forskning

**AZD-skabelon:** `azure-search-openai-demo`

### Mønster 3: Multi-Agent System

Flere specialiserede agenter, der arbejder sammen om komplekse opgaver.

```mermaid
graph TD
    Orchestrator[Orkestratoragent] --> Research[Forskningsagent<br/>gpt-4.1]
    Orchestrator --> Writer[Forfatteragent<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[Gennemlæseragent<br/>gpt-4.1]
```
**Bedst til:**
- Kompleks indholdsgenerering
- Flertrins arbejdsgange
- Opgaver, der kræver forskellig ekspertise

**Lær mere:** [Koordinationsmønstre for multi-agent-systemer](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Konfigurering af agentværktøjer

Agenter bliver stærkere, når de kan bruge værktøjer. Her er, hvordan du konfigurerer almindelige værktøjer:

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
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Miljøkonfiguration

```bash
# Opsæt agent-specifikke miljøvariabler
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
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
# Åbn overvågningspanel
azd monitor --overview

# Se logfiler i realtid
azd monitor --logs

# Se målinger i realtid
azd monitor --live
```

### Vigtige målepunkter at overvåge

| Metrik | Beskrivelse | Mål |
|--------|-------------|--------|
| Response Latency | Tid til at generere svar | < 5 sekunder |
| Token Usage | Tokens pr. forespørgsel | Overvåg for omkostninger |
| Tool Call Success Rate | % af vellykkede værktøjsudførelser | > 95% |
| Error Rate | Fejlede agentforespørgsler | < 1% |
| User Satisfaction | Feedback-score | > 4.0/5.0 |

### Egen logning for agenter

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# Konfigurer Azure Monitor med OpenTelemetry
configure_azure_monitor(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
)

tracer = trace.get_tracer(__name__)

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    with tracer.start_as_current_span("agent_interaction") as span:
        span.set_attributes({
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        })
```

> **Bemærk:** Installer de nødvendige pakker: `pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 Omkostningsovervejelser

### Estimerede månedlige omkostninger pr. mønster

| Mønster | Udviklingsmiljø | Produktion |
|---------|-----------------|------------|
| Enkelt agent | $50-100 | $200-500 |
| RAG-agent | $80-150 | $300-800 |
| Multi-Agent (2-3 agents) | $150-300 | $500-1,500 |
| Enterprise Multi-Agent | $300-500 | $1,500-5,000+ |

### Tips til omkostningsoptimering

1. **Brug gpt-4.1-mini til simple opgaver**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. **Implementer caching for gentagne forespørgsler**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Sæt token-grænser per kørsel**
   ```python
   # Angiv max_completion_tokens, når agenten køres, ikke under oprettelsen
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # Begræns svarets længde
   )
   ```

4. **Skaler til nul, når det ikke er i brug**
   ```bash
   # Container Apps skalerer automatisk ned til nul
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Fejlfinding af agenter

### Almindelige problemer og løsninger

<details>
<summary><strong>❌ Agent svarer ikke på værktøjsopkald</strong></summary>

```bash
# Kontroller, om værktøjerne er korrekt registreret
azd show

# Bekræft OpenAI-udrulning
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
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd deploy
```

**Optimeringstips:**
- Brug streaming-responser
- Implementer svarcaching
- Reducer kontekstvinduesstørrelse
</details>

<details>
<summary><strong>❌ Agenten returnerer ukorrekt eller 'hallucineret' information</strong></summary>

```python
# Forbedre med bedre systemprompter
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Tilføj hentning til forankring
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # Forankr svar i dokumenter
)
```
</details>

<details>
<summary><strong>❌ Fejl: Token-grænse overskredet</strong></summary>

```python
# Implementer styring af kontekstvindue
def truncate_context(messages, max_tokens=8000, model="gpt-4.1"):
    """Keep only recent messages within token limit."""
    import tiktoken
    encoding = tiktoken.encoding_for_model(model)
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(encoding.encode(msg.content))
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Praktiske øvelser

### Øvelse 1: Implementer en grundlæggende agent (20 minutter)

**Mål:** Implementer din første AI-agent ved hjælp af AZD

```bash
# Trin 1: Initialiser skabelon
azd init --template get-started-with-ai-agents

# Trin 2: Log ind på Azure
azd auth login
# Hvis du arbejder på tværs af lejere, tilføj --tenant-id <tenant-id>

# Trin 3: Udrul
azd up

# Trin 4: Test agenten
# Forventet output efter udrulning:
#   Udrulning fuldført!
#   Endpoint: https://<app-name>.<region>.azurecontainerapps.io
# Åbn URL'en vist i outputtet og prøv at stille et spørgsmål

# Trin 5: Se overvågning
azd monitor --overview

# Trin 6: Ryd op
azd down --force --purge
```

**Kriterier for succes:**
- [ ] Agent svarer på spørgsmål
- [ ] Kan få adgang til overvågningsdashboard via `azd monitor`
- [ ] Ressourcer ryddes op korrekt

### Øvelse 2: Tilføj et brugerdefineret værktøj (30 minutter)

**Mål:** Udvid en agent med et brugerdefineret værktøj

1. Deploy the agent template:
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. Opret en ny værktøjsfunktion i din agentkode:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # API-opkald til vejrtjeneste
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Registrer værktøjet hos agenten:
   ```python
   from azure.ai.projects.models import FunctionTool

   weather_tool = FunctionTool(
       name="get_weather",
       description="Get current weather for a location",
       parameters={
           "type": "object",
           "properties": {
               "location": {"type": "string", "description": "City name"}
           },
           "required": ["location"]
       }
   )

   agent = project_client.agents.create_agent(
       model="gpt-4.1",
       name="Weather Agent",
       tools=[weather_tool]
   )
   ```
4. Genimplementer og test:
   ```bash
   azd deploy
   # Spørg: "Hvordan er vejret i Seattle?"
   # Forventet: Agenten kalder get_weather("Seattle") og returnerer vejrinformation
   ```

**Kriterier for succes:**
- [ ] Agent genkender vejrudspørgsler
- [ ] Værktøj kaldes korrekt
- [ ] Svaret indeholder vejrdata

### Øvelse 3: Byg en RAG-agent (45 minutter)

**Mål:** Opret en agent, der svarer på spørgsmål ud fra dine dokumenter

```bash
# Trin 1: Udrul RAG-skabelon
azd init --template azure-search-openai-demo
azd up

# Trin 2: Upload dine dokumenter
# Placer PDF/TXT-filer i data/-mappen, og kør derefter:
python scripts/prepdocs.py

# Trin 3: Test med domænespecifikke spørgsmål
# Åbn webappens URL fra azd up-outputtet
# Stil spørgsmål om dine uploadede dokumenter
# Svarene bør inkludere kildehenvisninger som [doc.pdf]
```

**Kriterier for succes:**
- [ ] Agent svarer ud fra uploadede dokumenter
- [ ] Svar indeholder citater
- [ ] Ingen hallucination på spørgsmål uden for scope

---

## 📚 Næste skridt

Nu hvor du forstår AI-agenter, kan du udforske disse avancerede emner:

| Emne | Beskrivelse | Link |
|-------|-------------|------|
| **Multi-Agent Systems** | Byg systemer med flere samarbejdende agenter | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Coordination Patterns** | Lær orkestrerings- og kommunikationsmønstre | [Koordinationsmønstre](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Production Deployment** | Agentimplementering klar til enterprise | [Production AI Practices](../chapter-08-production/production-ai-practices.md) |
| **Agent Evaluation** | Test og evaluer agentens ydelse | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **AI Workshop Lab** | Hands-on: Gør din AI-løsning klar til AZD | [AI Workshop Lab](ai-workshop-lab.md) |

---

## 📖 Yderligere ressourcer

### Officiel dokumentation
- [Azure AI Agent Service](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure AI Foundry Agent Service Quickstart](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel Agent Framework](https://learn.microsoft.com/semantic-kernel/)

### AZD-skabeloner til agenter
- [Kom i gang med AI-agenter](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Fællesskabsressourcer
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### Agent-færdigheder til din editor
- [**Microsoft Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Installer genanvendelige AI-agentfærdigheder til Azure-udvikling i GitHub Copilot, Cursor eller enhver understøttet agent. Indeholder færdigheder til [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [deployment](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy), og [diagnostics](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics):
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Navigation**
- **Forrige lektion**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **Næste lektion**: [AI Model Deployment](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på originalsproget bør betragtes som den autoritative kilde. For kritisk information anbefales en professionel, menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->