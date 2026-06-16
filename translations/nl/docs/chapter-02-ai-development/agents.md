# AI-agents met Azure Developer CLI

**Hoofdstuknavigatie:**
- **📚 Cursusstart**: [AZD For Beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Chapter 2 - AI-First Development
- **⬅️ Vorige**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Volgende**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Geavanceerd**: [Multi-agentoplossingen](../../examples/retail-scenario.md)

---

## Inleiding

AI-agents zijn autonome programma's die hun omgeving kunnen waarnemen, beslissingen kunnen nemen en acties kunnen uitvoeren om specifieke doelen te bereiken. In tegenstelling tot eenvoudige chatbots die op prompts reageren, kunnen agents:

- **Gebruik tools** - Roep API's aan, doorzoek databases, voer code uit
- **Plannen en redeneren** - Breek complexe taken op in stappen
- **Leren van context** - Behoud geheugen en pas gedrag aan
- **Samenwerken** - Werken met andere agents (multi-agent systemen)

Deze gids laat zien hoe je AI-agents naar Azure kunt implementeren met Azure Developer CLI (azd).

> **Validatienotitie (2026-03-25):** Deze gids is beoordeeld tegen `azd` `1.23.12` en `azure.ai.agents` `0.1.18-preview`. De `azd ai`-ervaring is nog steeds preview-gedreven, dus controleer de extensie-help als je geïnstalleerde flags anders zijn.

## Leerdoelen

Door deze gids te voltooien, zul je:
- Begrijpen wat AI-agents zijn en hoe ze verschillen van chatbots
- Voorgebouwde AI-agent-sjablonen implementeren met AZD
- Foundry Agents configureren voor aangepaste agents
- Basisagentpatronen implementeren (toolgebruik, RAG, multi-agent)
- Geïmplementeerde agents monitoren en debuggen

## Leerresultaten

Na voltooiing kun je:
- AI-agenttoepassingen met één opdracht naar Azure implementeren
- Agenttools en -mogelijkheden configureren
- Retrieval-augmented generation (RAG) implementeren met agents
- Multi-agent-architecturen ontwerpen voor complexe workflows
- Veelvoorkomende implementatieproblemen van agents oplossen

---

## 🤖 Wat maakt een agent anders dan een chatbot?

| Kenmerk | Chatbot | AI-agent |
|---------|---------|----------|
| **Gedrag** | Reageert op prompts | Ondernemt autonome acties |
| **Tools** | Geen | Kan API's aanroepen, zoeken, code uitvoeren |
| **Geheugen** | Alleen sessiegebonden | Persistent geheugen over sessies heen |
| **Plannen** | Enkele reactie | Meerdere redeneringsstappen |
| **Samenwerking** | Enkel entiteit | Kan samenwerken met andere agents |

### Eenvoudige analogie

- **Chatbot** = Een behulpzaam persoon die vragen beantwoordt bij een informatiebalie
- **AI Agent** = Een persoonlijke assistent die kan bellen, afspraken kan maken en taken voor je afrondt

---

## 🚀 Snelstart: Implementeer je eerste agent

### Optie 1: Foundry Agents-sjabloon (Aanbevolen)

```bash
# Initialiseer het sjabloon voor AI-agenten
azd init --template get-started-with-ai-agents

# Implementeer naar Azure
azd up
```

**Wat wordt ingezet:**
- ✅ Foundry Agents
- ✅ Microsoft Foundry Models (gpt-4.1)
- ✅ Azure AI Search (voor RAG)
- ✅ Azure Container Apps (webinterface)
- ✅ Application Insights (monitoring)

**Tijd:** ~15-20 minuten
**Kosten:** ~$100-150/maand (ontwikkeling)

### Optie 2: OpenAI-agent met Prompty

```bash
# Initialiseer het op Prompty gebaseerde agentsjabloon
azd init --template agent-openai-python-prompty

# Uitrollen naar Azure
azd up
```

**Wat wordt ingezet:**
- ✅ Azure Functions (serverloze agentuitvoering)
- ✅ Microsoft Foundry Models
- ✅ Prompty-configuratiebestanden
- ✅ Voorbeeldimplementatie van agent

**Tijd:** ~10-15 minuten
**Kosten:** ~$50-100/maand (ontwikkeling)

### Optie 3: RAG-chatagent

```bash
# RAG-chattemplate initialiseren
azd init --template azure-search-openai-demo

# Naar Azure uitrollen
azd up
```

**Wat wordt ingezet:**
- ✅ Microsoft Foundry Models
- ✅ Azure AI Search met voorbeeldgegevens
- ✅ Documentverwerkingspipeline
- ✅ Chatinterface met citaties

**Tijd:** ~15-25 minuten
**Kosten:** ~$80-150/maand (ontwikkeling)

### Optie 4: AZD AI Agent Init (Manifest- of sjabloongebaseerde preview)

Als je een agentmanifestbestand hebt, kun je de `azd ai`-opdracht gebruiken om direct een Foundry Agent Service-project te scaffolden. Recente preview-releases hebben ook sjabloongebaseerde initialisatie toegevoegd, dus de exacte promptflow kan iets verschillen afhankelijk van je geïnstalleerde extensieversie.

```bash
# Installeer de AI-agenten-extensie
azd extension install azure.ai.agents

# Optioneel: controleer de geïnstalleerde previewversie
azd extension show azure.ai.agents

# Initialiseer vanuit een agentmanifest
azd ai agent init -m agent-manifest.yaml

# Implementeer naar Azure
azd up

# Test de geïmplementeerde agent (geeft latentie en tijd tot eerste byte weer)
azd ai agent invoke
```

**Wanneer `azd ai agent init` vs `azd init --template` gebruiken:**

| Aanpak | Geschikt voor | Hoe het werkt |
|----------|----------|------|
| `azd init --template` | Beginnen vanaf een werkende voorbeeldapp | Kloont een volledige sjabloon-repo met code + infra |
| `azd ai agent init -m` | Bouwen vanuit je eigen agentmanifest | Scaffoldt projectstructuur vanuit je agentdefinitie |

> **Tip:** Gebruik `azd init --template` tijdens het leren (Opties 1-3 hierboven). Gebruik `azd ai agent init` bij het bouwen van productieagents met je eigen manifesten.

Na `azd up` begeleidt dezelfde extensie je door de rest van de agent lifecycle: `azd ai agent invoke` om te testen, `azd ai agent eval generate` en `azd ai agent optimize` om kwaliteit te meten en te verbeteren, en `azd ai agent delete` om op te ruimen. Zie [AZD AI CLI-commando's](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) voor de volledige referentie.

---

## 🏗️ Agentarchitectuurpatronen

### Patroon 1: Enkele agent met tools

Het eenvoudigste agentpatroon - één agent die meerdere tools kan gebruiken.

```mermaid
graph TD
    UI[Gebruikersinterface] --> Agent[AI-agent<br/>gpt-4.1]
    Agent --> Search[Zoektool]
    Agent --> Database[Databasetool]
    Agent --> API[API-tool]
```

**Geschikt voor:**
- Klantenservicebots
- Onderzoeksassistenten
- Data-analyseagents

**AZD-sjabloon:** `azure-search-openai-demo`

### Patroon 2: RAG Agent (Retrieval-Augmented Generation)

Een agent die relevante documenten ophaalt voordat hij antwoorden genereert.

```mermaid
graph TD
    Query[Gebruikersvraag] --> RAG[RAG-agent]
    RAG --> Vector[Vector-zoekopdracht]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- Documenten --> LLM
    LLM --> Response[Antwoord met bronvermeldingen]
```

**Geschikt voor:**
- Enterprise kennisbanken
- Document Q&A-systemen
- Compliance- en juridisch onderzoek

**AZD-sjabloon:** `azure-search-openai-demo`

### Patroon 3: Multi-agent-systeem

Meerdere gespecialiseerde agents die samenwerken aan complexe taken.

```mermaid
graph TD
    Orchestrator[Orkestrator Agent] --> Research[Onderzoeksagent<br/>gpt-4.1]
    Orchestrator --> Writer[Schrijver Agent<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[Beoordelaar Agent<br/>gpt-4.1]
```

**Geschikt voor:**
- Complexe contentgeneratie
- Meertraps-workflows
- Taken die verschillende expertise vereisen

**Meer informatie:** [Coördinatiepatronen voor multi-agenten](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Agenttools configureren

Agents worden krachtig wanneer ze tools kunnen gebruiken. Hier lees je hoe je veelvoorkomende tools configureert:

### Toolconfiguratie in Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Definieer aangepaste tools
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

# Maak een agent met tools
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

# Rol uit met bijgewerkte configuratie
azd deploy
```

---

## 📊 Agents monitoren

### Integratie met Application Insights

Alle AZD-agent-sjablonen bevatten Application Insights voor monitoring:

```bash
# Open monitoringdashboard
azd monitor --overview

# Bekijk live logs
azd monitor --logs

# Bekijk live metrics
azd monitor --live
```

### Belangrijke statistieken om te volgen

| Metriek | Beschrijving | Doel |
|--------|-------------|--------|
| Responstijd | Tijd om antwoord te genereren | < 5 seconden |
| Tokengebruik | Tokens per verzoek | Houd in de gaten voor kosten |
| Succespercentage van tool-aanroepen | % succesvolle tooluitvoeringen | > 95% |
| Foutpercentage | Mislukte agentaanvragen | < 1% |
| Gebruikerstevredenheid | Feedbackscores | > 4.0/5.0 |

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

| Patroon | Ontwikkelomgeving | Productie |
|---------|-----------------|------------|
| Enkele agent | $50-100 | $200-500 |
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
       max_completion_tokens=1000  # Beperk de lengte van het antwoord
   )
   ```

4. **Schaal naar nul wanneer niet in gebruik**
   ```bash
   # Container-apps schalen automatisch naar nul
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Problemen oplossen met agents

### Veelvoorkomende problemen en oplossingen

<details>
<summary><strong>❌ Agent reageert niet op tool-aanroepen</strong></summary>

```bash
# Controleer of de tools correct zijn geregistreerd
azd show

# Verifieer de OpenAI-implementatie
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Controleer de agentlogs
azd monitor --logs
```

**Veelvoorkomende oorzaken:**
- Onjuiste functiesignatuur van tool
- Ontbrekende benodigde machtigingen
- API-endpoint niet toegankelijk
</details>

<details>
<summary><strong>❌ Hoge latentie in agentreacties</strong></summary>

```bash
# Controleer Application Insights op knelpunten
azd monitor --live

# Overweeg een sneller model te gebruiken
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd deploy
```

**Optimalisatietips:**
- Gebruik streaming-antwoorden
- Implementeer response-caching
- Verklein de contextvenstergrootte
</details>

<details>
<summary><strong>❌ Agent geeft onjuiste of hallucinerende informatie terug</strong></summary>

```python
# Verbeter met betere systeemprompts
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Voeg opvraging toe voor verankering
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # Baseer antwoorden op documenten
)
```
</details>

<details>
<summary><strong>❌ Fouten: tokenlimiet overschreden</strong></summary>

```python
# Implementeer beheer van het contextvenster
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

## 🎓 Praktische oefeningen

### Oefening 1: Implementeer een basisagent (20 minuten)

**Doel:** Implementeer je eerste AI-agent met AZD

```bash
# Stap 1: Initialiseer sjabloon
azd init --template get-started-with-ai-agents

# Stap 2: Aanmelden bij Azure
azd auth login
# Als u over meerdere tenants werkt, voeg --tenant-id <tenant-id> toe

# Stap 3: Implementeren
azd up

# Stap 4: Test de agent
# Verwachte uitvoer na implementatie:
#   Implementatie voltooid!
#   Eindpunt: https://<app-name>.<region>.azurecontainerapps.io
# Open de URL die in de uitvoer wordt weergegeven en probeer een vraag te stellen

# Stap 5: Bekijk monitoring
azd monitor --overview

# Stap 6: Opruimen
azd down --force --purge
```

**Succescriteria:**
- [ ] Agent reageert op vragen
- [ ] Kan via `azd monitor` toegang krijgen tot monitoringdashboard
- [ ] Middelen succesvol opgeruimd

### Oefening 2: Voeg een aangepaste tool toe (30 minuten)

**Doel:** Breid een agent uit met een aangepaste tool

1. Implementeer het agent-sjabloon:
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. Maak een nieuwe toolfunctie in je agentcode:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # API-aanroep naar de weerservice
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
4. Herimplementeer en test:
   ```bash
   azd deploy
   # Vraag: "Wat is het weer in Seattle?"
   # Verwacht: Agent roept get_weather("Seattle") aan en geeft weersinformatie terug.
   ```

**Succescriteria:**
- [ ] Agent herkent vraagstellingen over het weer
- [ ] Tool wordt correct aangeroepen
- [ ] Antwoord bevat weerinformatie

### Oefening 3: Bouw een RAG-agent (45 minuten)

**Doel:** Maak een agent die vragen beantwoordt op basis van je documenten

```bash
# Stap 1: Implementeer RAG-sjabloon
azd init --template azure-search-openai-demo
azd up

# Stap 2: Upload je documenten
# Plaats PDF/TXT-bestanden in de map data/ en voer vervolgens uit:
python scripts/prepdocs.py

# Stap 3: Test met domeinspecifieke vragen
# Open de webapp-URL uit de uitvoer van azd up
# Stel vragen over je geüploade documenten
# Antwoorden moeten citatieverwijzingen bevatten zoals [doc.pdf]
```

**Succescriteria:**
- [ ] Agent antwoordt vanuit geüploade documenten
- [ ] Antwoorden bevatten citaties
- [ ] Geen hallucinerende antwoorden bij vragen buiten scope

---

## 📚 Volgende stappen

Nu je AI-agents begrijpt, verken deze geavanceerde onderwerpen:

| Onderwerp | Beschrijving | Link |
|-------|-------------|------|
| **Multi-agentensystemen** | Bouw systemen met meerdere samenwerkende agents | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Coördinatiepatronen** | Leer orkestratie- en communicatiepatronen | [Coördinatiepatronen](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Productie-implementatie** | Enterprise-klare agentimplementatie | [Production AI Practices](../chapter-08-production/production-ai-practices.md) |
| **Agentevaluatie** | Test en evalueer agentprestaties | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **AI Workshop-lab** | Hands-on: Maak je AI-oplossing AZD-klaar | [AI Workshop Lab](ai-workshop-lab.md) |

---

## 📖 Aanvullende bronnen

### Officiële documentatie
- [Microsoft Foundry Agent Service](https://learn.microsoft.com/azure/ai-services/agents/)
- [Microsoft Foundry Agent Service Quickstart](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel Agent Framework](https://learn.microsoft.com/semantic-kernel/)

### AZD-sjablonen voor agents
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Communitybronnen
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### Agentvaardigheden voor je editor
- [**Microsoft Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Installeer herbruikbare AI-agentvaardigheden voor Azure-ontwikkeling in GitHub Copilot, Cursor of elke ondersteunde agent. Inclusief vaardigheden voor [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [deployment](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy), en [diagnostics](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics):
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
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->