# AI-agenter med Azure Developer CLI

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 2 - AI-først udvikling
- **⬅️ Forrige**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Næste**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Avanceret**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## Introduktion

AI-agenter er autonome programmer, der kan opfatte deres miljø, træffe beslutninger og udføre handlinger for at nå specifikke mål. I modsætning til simple chatbots, der reagerer på prompts, kan agenter:

- **Bruge værktøjer** - Kalde API'er, søge i databaser, køre kode
- **Planlægge og ræsonnere** - Opdele komplekse opgaver i trin
- **Lære fra kontekst** - Vedligeholde hukommelse og tilpasse adfærd
- **Samarbejde** - Arbejde sammen med andre agenter (multi-agent systemer)

Denne vejledning viser, hvordan du implementerer AI-agenter i Azure ved hjælp af Azure Developer CLI (azd).

## Læringsmål

Når du har gennemført denne vejledning, vil du:
- Forstå, hvad AI-agenter er, og hvordan de adskiller sig fra chatbots
- Implementere forbyggede AI-agent-skabeloner ved hjælp af AZD
- Konfigurere Foundry Agents til brugerdefinerede agenter
- Implementere grundlæggende agentmønstre (værktøjsbrug, RAG, multi-agent)
- Overvåge og fejlfinde implementerede agenter

## Læringsresultater

Efter gennemførelse vil du kunne:
- Implementere AI-agentapplikationer til Azure med en enkelt kommando
- Konfigurere agentværktøjer og -funktioner
- Implementere retrieval-augmented generation (RAG) med agenter
- Designe multi-agent-arkitekturer til komplekse arbejdsflows
- Fejlfinde almindelige problemer ved agentimplementering

---

## 🤖 Hvad gør en agent forskellig fra en chatbot?

| Funktion | Chatbot | AI-agent |
|---------|---------|----------|
| **Adfærd** | Svarer på prompts | Udfører autonome handlinger |
| **Værktøjer** | Ingen | Kan kalde API'er, søge, eksekvere kode |
| **Hukommelse** | Kun sessionsbaseret | Vedvarende hukommelse på tværs af sessioner |
| **Planlægning** | Én enkelt respons | Flertrins ræsonnement |
| **Samarbejde** | Enkelt enhed | Kan arbejde sammen med andre agenter |

### Simpel analogi

- **Chatbot** = En hjælpsom person, der besvarer spørgsmål ved et informationsskrank
- **AI-agent** = En personlig assistent, der kan foretage opkald, booke aftaler og fuldføre opgaver for dig

---

## 🚀 Kom godt i gang: Implementer din første agent

### Mulighed 1: Foundry Agents-skabelon (Anbefalet)

```bash
# Initialiser skabelon til AI-agenter
azd init --template get-started-with-ai-agents

# Udrul til Azure
azd up
```

**Hvad implementeres:**
- ✅ Foundry Agents
- ✅ Microsoft Foundry Models (gpt-4.1)
- ✅ Azure AI Search (til RAG)
- ✅ Azure Container Apps (webgrænseflade)
- ✅ Application Insights (overvågning)

**Tid:** ~15-20 minutter
**Omkostning:** ~$100-150/måned (udvikling)

### Mulighed 2: OpenAI Agent with Prompty

```bash
# Initialiser Prompty-baseret agentskabelon
azd init --template agent-openai-python-prompty

# Udrul til Azure
azd up
```

**Hvad implementeres:**
- ✅ Azure Functions (serverløs agentudførelse)
- ✅ Microsoft Foundry Models
- ✅ Prompty-konfigurationsfiler
- ✅ Eksempelfagent-implementering

**Tid:** ~10-15 minutter
**Omkostning:** ~$50-100/måned (udvikling)

### Mulighed 3: RAG Chat Agent

```bash
# Initialiser RAG-chatskabelon
azd init --template azure-search-openai-demo

# Udrul til Azure
azd up
```

**Hvad implementeres:**
- ✅ Microsoft Foundry Models
- ✅ Azure AI Search med eksempeldata
- ✅ Dokumentbehandlingspipeline
- ✅ Chatgrænseflade med kildeangivelser

**Tid:** ~15-25 minutter
**Omkostning:** ~$80-150/måned (udvikling)

### Mulighed 4: AZD AI Agent Init (manifest-baseret)

Hvis du har en agentmanifestfil, kan du bruge `azd ai`-kommandoen til at scaffolde et Foundry Agent Service-projekt direkte:

```bash
# Installer AI-agenter-udvidelsen
azd extension install azure.ai.agents

# Initialiser fra et agentmanifest
azd ai agent init -m agent-manifest.yaml

# Udrul til Azure
azd up
```

**Hvornår du skal bruge `azd ai agent init` vs `azd init --template`:**

| Tilgang | Bedst til | Hvordan det virker |
|----------|----------|------|
| `azd init --template` | Starter fra en fungerende eksempelapp | Kloner et fuldt skabelon-repo med kode + infrastruktur |
| `azd ai agent init -m` | Opbygning fra dit eget agentmanifest | Skaber projektstruktur ud fra din agentdefinition |

> **Tip:** Brug `azd init --template` når du lærer (Muligheder 1-3 ovenfor). Brug `azd ai agent init` når du bygger produktionsagenter med dine egne manifests. Se [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for fuld reference.

---

## 🏗️ Agent-arkitekturmønstre

### Mønster 1: Enkel agent med værktøjer

Det simpleste agentmønster - én agent, der kan bruge flere værktøjer.

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
- Virksomhedens vidensdatabaser
- Dokument Q&A-systemer
- Compliance og juridisk research

**AZD-skabelon:** `azure-search-openai-demo`

### Mønster 3: Multi-agent system

Flere specialiserede agenter, der arbejder sammen om komplekse opgaver.

```mermaid
graph TD
    Orchestrator[Orkestrator-agent] --> Research[Forskningsagent<br/>gpt-4.1]
    Orchestrator --> Writer[Forfatteragent<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[Anmelderagent<br/>gpt-4.1]
```
**Bedst til:**
- Kompleks indholdsgenerering
- Flertrins-arbejdsflows
- Opgaver, der kræver forskellig ekspertise

**Lær mere:** [Koordinationsmønstre for multi-agenter](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Konfigurering af agentværktøjer

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
# Åbn overvågningsdashboard
azd monitor --overview

# Se live-logfiler
azd monitor --logs

# Se live-målinger
azd monitor --live
```

### Vigtige målepunkter at følge

| Metrik | Beskrivelse | Mål |
|--------|-------------|--------|
| Responstid | Tid til at generere svar | < 5 sekunder |
| Tokenforbrug | Tokens pr. forespørgsel | Overvåg for omkostninger |
| Succesrate for værktøjskald | % af vellykkede værktøjskald | > 95% |
| Fejlrate | Mislykkede agentforespørgsler | < 1% |
| Brugertilfredshed | Feedback-score | > 4.0/5.0 |

### Brugerdefineret logging for agenter

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

## 💰 Omkostningshensyn

### Anslåede månedlige omkostninger pr. mønster

| Mønster | Udviklingsmiljø | Produktion |
|---------|-----------------|------------|
| Enkel agent | $50-100 | $200-500 |
| RAG-agent | $80-150 | $300-800 |
| Multi-agent (2-3 agenter) | $150-300 | $500-1,500 |
| Enterprise multi-agent | $300-500 | $1,500-5,000+ |

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
   # Indstil max_completion_tokens, når agenten køres, ikke under oprettelsen
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # Begræns svarlængden
   )
   ```

4. **Skaler til nul, når det ikke er i brug**
   ```bash
   # Container Apps skalerer automatisk til nul
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Fejlfinding af agenter

### Almindelige problemer og løsninger

<details>
<summary><strong>❌ Agent svarer ikke på værktøjskald</strong></summary>

```bash
# Kontroller, at værktøjerne er korrekt registreret
azd show

# Bekræft OpenAI-udrulningen
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Kontroller agentlogfilerne
azd monitor --logs
```

**Almindelige årsager:**
- Uoverensstemmelse i funktionssignatur for værktøjet
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
- Brug streaming-svar
- Implementer response-caching
- Reducer kontekstvinduesstørrelsen
</details>

<details>
<summary><strong>❌ Agent returnerer ukorrekt eller hallucineret information</strong></summary>

```python
# Forbedr med bedre systemprompter
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Tilføj opslag til forankring
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # Forankr svar i dokumenter
)
```
</details>

<details>
<summary><strong>❌ Token-grænse overskredet</strong></summary>

```python
# Implementer styring af kontekstvinduet
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
# Trin 1: Initialiser skabelonen
azd init --template get-started-with-ai-agents

# Trin 2: Log ind på Azure
azd auth login

# Trin 3: Udrul
azd up

# Trin 4: Test agenten
# Forventet output efter udrulning:
#   Udrulning fuldført!
#   Endepunkt: https://<app-name>.<region>.azurecontainerapps.io
# Åbn den URL, der vises i outputtet, og prøv at stille et spørgsmål

# Trin 5: Se overvågning
azd monitor --overview

# Trin 6: Ryd op
azd down --force --purge
```

**Succeskriterier:**
- [ ] Agent svarer på spørgsmål
- [ ] Kan få adgang til overvågningsdashboard via `azd monitor`
- [ ] Ressourcer ryddes op korrekt

### Øvelse 2: Tilføj et brugerdefineret værktøj (30 minutter)

**Mål:** Udvid en agent med et brugerdefineret værktøj

1. Implementer agent-skabelonen:
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
   # Spørg: "Hvad er vejret i Seattle?"
   # Forventet: Agenten kalder get_weather("Seattle") og returnerer vejrinfo
   ```

**Succeskriterier:**
- [ ] Agent genkender vejrudspørgsmål
- [ ] Værktøj kaldes korrekt
- [ ] Svaret inkluderer vejrinformation

### Øvelse 3: Byg en RAG-agent (45 minutter)

**Mål:** Opret en agent, der besvarer spørgsmål ud fra dine dokumenter

```bash
# Trin 1: Udrul RAG-skabelon
azd init --template azure-search-openai-demo
azd up

# Trin 2: Upload dine dokumenter
# Placer PDF- og TXT-filer i data-mappen, og kør derefter:
python scripts/prepdocs.py

# Trin 3: Test med domænespecifikke spørgsmål
# Åbn webapp-URL'en fra azd up-outputtet
# Stil spørgsmål om dine uploadede dokumenter
# Svarene bør inkludere kildehenvisninger som [doc.pdf]
```

**Succeskriterier:**
- [ ] Agent svarer fra uploadede dokumenter
- [ ] Svar inkluderer kildeangivelser
- [ ] Ingen hallucinationer ved spørgsmål uden for omfang

---

## 📚 Næste skridt

Nu hvor du forstår AI-agenter, kan du udforske disse avancerede emner:

| Emne | Beskrivelse | Link |
|-------|-------------|------|
| **Multi-agent systemer** | Byg systemer med flere samarbejdende agenter | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Koordinationsmønstre** | Lær orkestrerings- og kommunikationsmønstre | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Produktionsimplementering** | Agent-implementering klar til enterprise | [Production AI Practices](../chapter-08-production/production-ai-practices.md) |
| **Agent-evaluering** | Test og evaluer agenteffektivitet | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **AI Workshop Lab** | Hands-on: Gør din AI-løsning AZD-klar | [AI Workshop Lab](ai-workshop-lab.md) |

---

## 📖 Yderligere ressourcer

### Officiel dokumentation
- [Azure AI Agent Service](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure AI Foundry Agent Service Quickstart](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel Agent Framework](https://learn.microsoft.com/semantic-kernel/)

### AZD-skabeloner til agenter
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Fællesskabsressourcer
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### Agentfærdigheder til din editor
- [**Microsoft Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Installer genanvendelige AI-agent-færdigheder til Azure-udvikling i GitHub Copilot, Cursor eller enhver understøttet agent. Inkluderer færdigheder for [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [deployment](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy), og [diagnostics](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics):
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
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på originalsproget bør betragtes som den autoritative kilde. Til kritisk information anbefales professionel, menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->