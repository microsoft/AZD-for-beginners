# AI-agents met Azure Developer CLI

**Hoofdstuknavigatie:**
- **📚 Cursus Home**: [AZD For Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 2 - AI-First Development
- **⬅️ Vorige**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Volgende**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Geavanceerd**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## Introductie

AI-agents zijn autonome programma's die hun omgeving kunnen waarnemen, beslissingen kunnen nemen en acties kunnen uitvoeren om specifieke doelen te bereiken. In tegenstelling tot eenvoudige chatbots die op prompts reageren, kunnen agents:

- **Tools gebruiken** - API's aanroepen, databases doorzoeken, code uitvoeren
- **Plannen en redeneren** - Complexe taken in stappen opsplitsen
- **Leren van context** - Geheugen behouden en gedrag aanpassen
- **Samenwerken** - Werken met andere agents (multi-agent systemen)

Deze gids laat zien hoe je AI-agents naar Azure kunt implementeren met Azure Developer CLI (azd).

> **Validatienotitie (2026-03-25):** Deze gids is gecontroleerd tegen `azd` `1.23.12` en `azure.ai.agents` `0.1.18-preview`. De `azd ai`-ervaring is nog preview-gedreven, controleer dus de extensie-hulp als jouw geïnstalleerde vlaggen afwijken.

## Leerdoelen

Door deze gids te voltooien zul je:
- Begrijpen wat AI-agents zijn en hoe ze verschillen van chatbots
- Voorgebouwde AI-agenttemplates implementeren met AZD
- Foundry Agents configureren voor aangepaste agents
- Basisagentpatronen implementeren (toolgebruik, RAG, multi-agent)
- Geïnstrumenteerde agents monitoren en debuggen

## Leerresultaten

Na voltooiing kun je:
- AI-agentapplicaties naar Azure implementeren met één commando
- Agenttools en -mogelijkheden configureren
- Retrieval-augmented generation (RAG) implementeren met agents
- Multi-agentarchitecturen ontwerpen voor complexe workflows
- Veelvoorkomende problemen bij agent-implementatie oplossen

---

## 🤖 Wat maakt een agent anders dan een chatbot?

| Feature | Chatbot | AI Agent |
|---------|---------|----------|
| **Gedrag** | Reageert op prompts | Neemt autonome acties |
| **Tools** | Geen | Kan API's aanroepen, zoeken, code uitvoeren |
| **Geheugen** | Alleen sessie-gebaseerd | Persistente geheugen over sessies heen |
| **Plannen** | Enkele respons | Meerstapsredenering |
| **Samenwerking** | Enkelvoudige entiteit | Kan samenwerken met andere agents |

### Eenvoudige analogie

- **Chatbot** = Een behulpzaam persoon die vragen beantwoordt bij een informatiedesk
- **AI Agent** = Een persoonlijke assistent die kan bellen, afspraken kan maken en taken voor je kan voltooien

---

## 🚀 Snel aan de slag: Implementeer je eerste agent

### Optie 1: Foundry Agents Template (Aanbevolen)

```bash
# Initialiseer de sjabloon voor AI-agenten
azd init --template get-started-with-ai-agents

# Uitrollen naar Azure
azd up
```

**Wat wordt geïmplementeerd:**
- ✅ Foundry Agents
- ✅ Microsoft Foundry Models (gpt-4.1)
- ✅ Azure AI Search (voor RAG)
- ✅ Azure Container Apps (webinterface)
- ✅ Application Insights (monitoring)

**Tijd:** ~15-20 minuten
**Kosten:** ~$100-150/maand (ontwikkeling)

### Optie 2: OpenAI Agent met Prompty

```bash
# Initialiseer de op Prompty gebaseerde agenttemplate
azd init --template agent-openai-python-prompty

# Naar Azure uitrollen
azd up
```

**Wat wordt geïmplementeerd:**
- ✅ Azure Functions (serverless agent-executie)
- ✅ Microsoft Foundry Models
- ✅ Prompty-configuratiebestanden
- ✅ Voorbeeldimplementatie van een agent

**Tijd:** ~10-15 minuten
**Kosten:** ~$50-100/maand (ontwikkeling)

### Optie 3: RAG Chat Agent

```bash
# Initialiseer RAG chat-sjabloon
azd init --template azure-search-openai-demo

# Uitrollen naar Azure
azd up
```

**Wat wordt geïmplementeerd:**
- ✅ Microsoft Foundry Models
- ✅ Azure AI Search met voorbeeldgegevens
- ✅ Documentverwerkingspipeline
- ✅ Chatinterface met citaten

**Tijd:** ~15-25 minuten
**Kosten:** ~$80-150/maand (ontwikkeling)

### Optie 4: AZD AI Agent Init (Manifest- of Template-Based Preview)

Als je een agent-manifestbestand hebt, kun je de `azd ai`-opdracht gebruiken om een Foundry Agent Service-project direct te scaffolden. Recente preview-releases hebben ook template-gebaseerde initialisatie-ondersteuning toegevoegd, dus de exacte prompt-flow kan iets verschillen afhankelijk van je geïnstalleerde extensieversie.

```bash
# Installeer de AI-agents-extensie
azd extension install azure.ai.agents

# Optioneel: verifieer de geïnstalleerde previewversie
azd extension show azure.ai.agents

# Initialiseer vanuit een agentmanifest
azd ai agent init -m agent-manifest.yaml

# Implementeer naar Azure
azd up
```

**Wanneer gebruik je `azd ai agent init` vs `azd init --template`:**

| Approach | Best For | How It Works |
|----------|----------|------|
| `azd init --template` | Beginnen vanaf een werkende voorbeeldapp | Klont een volledige templaterepo met code + infra |
| `azd ai agent init -m` | Bouwen vanuit je eigen agent-manifest | Scaffoldt projectstructuur op basis van je agentdefinitie |

> **Tip:** Gebruik `azd init --template` tijdens het leren (Opties 1-3 hierboven). Gebruik `azd ai agent init` bij het bouwen van productieagents met je eigen manifests. Zie [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) voor de volledige referentie.

---

## 🏗️ Agentarchitectuurpatronen

### Patroon 1: Enkele Agent met Tools

Het eenvoudigste agentpatroon - één agent die meerdere tools kan gebruiken.

```mermaid
graph TD
    UI[Gebruikersinterface] --> Agent[AI-agent<br/>gpt-4.1]
    Agent --> Search[Zoektool]
    Agent --> Database[Databasetool]
    Agent --> API[API-tool]
```
**Het beste voor:**
- Klantenservic Bots
- Onderzoeksassistenten
- Data-analyse agents

**AZD-sjabloon:** `azure-search-openai-demo`

### Patroon 2: RAG Agent (Retrieval-Augmented Generation)

Een agent die relevante documenten ophaalt voordat hij antwoorden genereert.

```mermaid
graph TD
    Query[Gebruikersquery] --> RAG[RAG-agent]
    RAG --> Vector[Vectorzoekopdracht]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- Documenten --> LLM
    LLM --> Response[Antwoord met citaten]
```
**Het beste voor:**
- Bedrijfskennisbanken
- Document Q&A-systemen
- Compliance- en juridisch onderzoek

**AZD-sjabloon:** `azure-search-openai-demo`

### Patroon 3: Multi-Agent Systeem

Meerdere gespecialiseerde agents die samenwerken aan complexe taken.

```mermaid
graph TD
    Orchestrator[Orchestrator-agent] --> Research[Onderzoeksagent<br/>gpt-4.1]
    Orchestrator --> Writer[Schrijver-agent<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[Beoordelaar-agent<br/>gpt-4.1]
```
**Het beste voor:**
- Complexe contentgeneratie
- Meerstapsworkflows
- Taken die verschillende expertise vereisen

**Meer informatie:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Agenttools configureren

Agents worden krachtig als ze tools kunnen gebruiken. Zo configureer je veelvoorkomende tools:

### Toolconfiguratie in Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Definieer aangepaste hulpmiddelen
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

# Maak agent met hulpmiddelen
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Omgevingsconfiguratie

```bash
# Stel agent-specifieke omgevingsvariabelen in
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Rol uit met de bijgewerkte configuratie
azd deploy
```

---

## 📊 Agents monitoren

### Integratie met Application Insights

Alle AZD-agenttemplates bevatten Application Insights voor monitoring:

```bash
# Open het monitoringdashboard
azd monitor --overview

# Bekijk live logs
azd monitor --logs

# Bekijk live statistieken
azd monitor --live
```

### Belangrijke statistieken om te volgen

| Metric | Beschrijving | Doel |
|--------|-------------|--------|
| Response Latency | Tijd om een antwoord te genereren | < 5 seconden |
| Token Usage | Tokens per aanvraag | Monitoren voor kosten |
| Tool Call Success Rate | % succesvolle tooluitvoeringen | > 95% |
| Error Rate | Mislukte agentaanvragen | < 1% |
| User Satisfaction | Feedbackscores | > 4.0/5.0 |

### Aangepaste logging voor agents

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# Configureer Azure Monitor met OpenTelemetry
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

> **Opmerking:** Installeer de vereiste pakketten: `pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 Kostenoverwegingen

### Geschatte maandelijkse kosten per patroon

| Pattern | Dev Environment | Production |
|---------|-----------------|------------|
| Single Agent | $50-100 | $200-500 |
| RAG Agent | $80-150 | $300-800 |
| Multi-Agent (2-3 agents) | $150-300 | $500-1,500 |
| Enterprise Multi-Agent | $300-500 | $1,500-5,000+ |

### Tips voor kostenoptimalisatie

1. **Gebruik gpt-4.1-mini voor eenvoudige taken**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. **Implementeer caching voor herhaalde queries**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Stel tokenlimieten per run in**
   ```python
   # Stel max_completion_tokens in bij het uitvoeren van de agent, niet tijdens het aanmaken
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # Beperk de lengte van de reactie
   )
   ```

4. **Scale to zero wanneer niet in gebruik**
   ```bash
   # Container Apps schalen automatisch naar nul
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Agents oplossen van problemen

### Veelvoorkomende problemen en oplossingen

<details>
<summary><strong>❌ Agent reageert niet op tool-aanroepen</strong></summary>

```bash
# Controleer of tools correct zijn geregistreerd
azd show

# Controleer OpenAI-implementatie
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Controleer agentlogboeken
azd monitor --logs
```

**Veelvoorkomende oorzaken:**
- Functiesignatuurovereenkomst van tool incorrect
- Ontbrekende vereiste machtigingen
- API-eindpunt niet toegankelijk
</details>

<details>
<summary><strong>❌ Hoge latency in agentreacties</strong></summary>

```bash
# Controleer Application Insights op knelpunten
azd monitor --live

# Overweeg een sneller model te gebruiken
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd deploy
```

**Optimalisatietips:**
- Gebruik streaming-responses
- Implementeer response-caching
- Verminder de contextvenstergrootte
</details>

<details>
<summary><strong>❌ Agent geeft onjuiste of gehallucineerde informatie terug</strong></summary>

```python
# Verbeteren met betere systeemprompts
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Voeg ophalen toe voor onderbouwing
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # Onderbouw antwoorden met documenten
)
```
</details>

<details>
<summary><strong>❌ Tokenlimiet overschreden fouten</strong></summary>

```python
# Implementeer het beheer van het contextvenster
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

## 🎓 Hands-on oefeningen

### Oefening 1: Implementeer een basisagent (20 minuten)

**Doel:** Implementeer je eerste AI-agent met AZD

```bash
# Stap 1: Sjabloon initialiseren
azd init --template get-started-with-ai-agents

# Stap 2: Inloggen bij Azure
azd auth login
# Als u met meerdere tenants werkt, voeg --tenant-id <tenant-id> toe

# Stap 3: Uitrollen
azd up

# Stap 4: Test de agent
# Verwachte uitvoer na uitrol:
#   Uitrol voltooid!
#   Eindpunt: https://<app-name>.<region>.azurecontainerapps.io
# Open de URL die in de uitvoer wordt weergegeven en probeer een vraag te stellen

# Stap 5: Monitoring bekijken
azd monitor --overview

# Stap 6: Opruimen
azd down --force --purge
```

**Succescriteria:**
- [ ] Agent reageert op vragen
- [ ] Kan toegang krijgen tot het monitoringdashboard via `azd monitor`
- [ ] Resources succesvol opgeruimd

### Oefening 2: Voeg een aangepaste tool toe (30 minuten)

**Doel:** Breid een agent uit met een aangepaste tool

1. Implementeer de agenttemplate:
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. Maak een nieuwe toolfunctie in je agentcode:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # API-aanroep naar weerservice
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Registreer de tool bij de agent:
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
4. Herimplementeren en testen:
   ```bash
   azd deploy
   # Vraag: "Wat is het weer in Seattle?"
   # Verwacht: Agent roept get_weather("Seattle") aan en retourneert weerinformatie
   ```

**Succescriteria:**
- [ ] Agent herkent weergerelateerde vragen
- [ ] Tool wordt correct aangeroepen
- [ ] Antwoord bevat weerinformatie

### Oefening 3: Bouw een RAG-agent (45 minuten)

**Doel:** Maak een agent die vragen beantwoordt vanuit je documenten

```bash
# Stap 1: RAG-sjabloon uitrollen
azd init --template azure-search-openai-demo
azd up

# Stap 2: Upload uw documenten
# Plaats PDF/TXT-bestanden in de data/ directory en voer vervolgens uit:
python scripts/prepdocs.py

# Stap 3: Test met domeinspecifieke vragen
# Open de webapp-URL uit de uitvoer van azd up
# Stel vragen over uw geüploade documenten
# Antwoorden moeten citatieverwijzingen bevatten zoals [doc.pdf]
```

**Succescriteria:**
- [ ] Agent beantwoordt vanuit geüploade documenten
- [ ] Antwoorden bevatten citaten
- [ ] Geen hallucinaties bij vragen buiten scope

---

## 📚 Volgende stappen

Nu je AI-agents begrijpt, verken deze geavanceerde onderwerpen:

| Topic | Beschrijving | Link |
|-------|-------------|------|
| **Multi-Agent Systems** | Bouw systemen met meerdere samenwerkende agents | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Coordination Patterns** | Leer orkestratie- en communicatiepatronen | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Production Deployment** | Productieklare agentimplementatie | [Production AI Practices](../chapter-08-production/production-ai-practices.md) |
| **Agent Evaluation** | Test en evalueer agentprestaties | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **AI Workshop Lab** | Hands-on: Maak je AI-oplossing AZD-ready | [AI Workshop Lab](ai-workshop-lab.md) |

---

## 📖 Aanvullende bronnen

### Officiële documentatie
- [Azure AI Agent Service](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure AI Foundry Agent Service Quickstart](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel Agent Framework](https://learn.microsoft.com/semantic-kernel/)

### AZD-sjablonen voor agents
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Communitybronnen
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### Agent Skills voor je editor
- [**Microsoft Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Installeer herbruikbare AI-agentvaardigheden voor Azure-ontwikkeling in GitHub Copilot, Cursor of een andere ondersteunde agent. Bevat vaardigheden voor [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [deployment](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy), en [diagnostiek](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics):
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Navigatie**
- **Vorige les**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **Volgende les**: [AI Model Deployment](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we naar nauwkeurigheid streven, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de originele taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor enige misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->