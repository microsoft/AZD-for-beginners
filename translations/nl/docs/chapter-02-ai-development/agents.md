# AI-agenten met Azure Developer CLI

**Hoofdstuknavigatie:**
- **📚 Cursus Home**: [AZD voor Beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 2 - AI-first ontwikkeling
- **⬅️ Vorige**: [AI-modelimplementatie](ai-model-deployment.md)
- **➡️ Volgende**: [Productie AI-praktijken](production-ai-practices.md)
- **🚀 Geavanceerd**: [Multi-agentoplossingen](../../examples/retail-scenario.md)

---

## Inleiding

AI-agenten zijn autonome programma's die hun omgeving kunnen waarnemen, beslissingen kunnen nemen en acties kunnen uitvoeren om specifieke doelen te bereiken. In tegenstelling tot eenvoudige chatbots die op prompts reageren, kunnen agenten:

- **Hulpmiddelen gebruiken** - API's aanroepen, databases doorzoeken, code uitvoeren
- **Plannen en redeneren** - Complexe taken opdelen in stappen
- **Leren van context** - Geheugen onderhouden en gedrag aanpassen
- **Samenwerken** - Werken met andere agenten (multi-agent systemen)

Deze gids laat je zien hoe je AI-agenten naar Azure kunt uitrollen met Azure Developer CLI (azd).

## Leerdoelen

Door deze gids te voltooien zal je:
- Begrijpen wat AI-agenten zijn en hoe ze verschillen van chatbots
- Vooraf gebouwde AI-agent-sjablonen implementeren met AZD
- Foundry Agents configureren voor aangepaste agenten
- Basisagentpatronen implementeren (toolgebruik, RAG, multi-agent)
- Geïmplementeerde agenten monitoren en debuggen

## Leerresultaten

Na voltooiing kun je:
- AI-agentapplicaties naar Azure implementeren met één enkele opdracht
- Agenttools en -mogelijkheden configureren
- Retrieval-augmented generation (RAG) met agenten implementeren
- Multi-agentarchitecturen ontwerpen voor complexe workflows
- Veelvoorkomende implementatieproblemen van agenten oplossen

---

## 🤖 Wat maakt een agent anders dan een chatbot?

| Kenmerk | Chatbot | AI-agent |
|---------|---------|----------|
| **Gedrag** | Reageert op prompts | Neemt autonome acties |
| **Hulpmiddelen** | Geen | Kan API's aanroepen, zoeken, code uitvoeren |
| **Geheugen** | Alleen sessiegebaseerd | Persistent geheugen tussen sessies |
| **Planning** | Enkele reactie | Veelstapsredenering |
| **Samenwerking** | Enkele entiteit | Kan samenwerken met andere agenten |

### Eenvoudige analogie

- **Chatbot** = Een behulpzaam persoon die vragen beantwoordt bij een informatiebalie
- **AI-agent** = Een persoonlijke assistent die kan bellen, afspraken kan plannen en taken voor je kan voltooien

---

## 🚀 Snelstart: Implementeer je eerste agent

### Optie 1: Foundry Agents-sjabloon (aanbevolen)

```bash
# Initialiseer de sjabloon voor AI-agenten
azd init --template get-started-with-ai-agents

# Uitrollen naar Azure
azd up
```

**Wat wordt uitgerold:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (voor RAG)
- ✅ Azure Container Apps (webinterface)
- ✅ Application Insights (bewaking)

**Tijd:** ~15-20 minuten
**Kosten:** ~$100-150/maand (ontwikkeling)

### Optie 2: OpenAI-agent met Prompty

```bash
# Initialiseer de op Prompty gebaseerde agent-sjabloon
azd init --template agent-openai-python-prompty

# Uitrollen naar Azure
azd up
```

**Wat wordt uitgerold:**
- ✅ Azure Functions (serverless agentuitvoering)
- ✅ Azure OpenAI
- ✅ Prompty-configuratiebestanden
- ✅ Voorbeeldimplementatie van een agent

**Tijd:** ~10-15 minuten
**Kosten:** ~$50-100/maand (ontwikkeling)

### Optie 3: RAG Chat-agent

```bash
# Initialiseer RAG-chatsjabloon
azd init --template azure-search-openai-demo

# Uitrollen naar Azure
azd up
```

**Wat wordt uitgerold:**
- ✅ Azure OpenAI
- ✅ Azure AI Search met voorbeeldgegevens
- ✅ Documentverwerkingspipeline
- ✅ Chatinterface met citaties

**Tijd:** ~15-25 minuten
**Kosten:** ~$80-150/maand (ontwikkeling)

---

## 🏗️ Agentarchitectuurpatronen

### Patroon 1: Enkelvoudige agent met hulpmiddelen

Het eenvoudigste agentpatroon - één agent die meerdere tools kan gebruiken.

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

**Het beste voor:**
- Klantenservice-bots
- Onderzoeksassistenten
- Data-analyseagenten

**AZD Template:** `azure-search-openai-demo`

### Patroon 2: RAG-agent (Retrieval-Augmented Generation)

Een agent die relevante documenten ophaalt voordat hij antwoorden genereert.

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

**Het beste voor:**
- Enterprise kennisbanken
- Document Q&A-systemen
- Compliance- en juridisch onderzoek

**AZD Template:** `azure-search-openai-demo`

### Patroon 3: Multi-agentensysteem

Meerdere gespecialiseerde agenten die samenwerken aan complexe taken.

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

**Het beste voor:**
- Complexe contentgeneratie
- Meerstapsworkflows
- Taken die verschillende expertise vereisen

**Meer leren:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Configuratie van agenttools

Agenten worden krachtig wanneer ze tools kunnen gebruiken. Zo configureer je veelvoorkomende tools:

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

# Maak agent aan met tools
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Omgevingsconfiguratie

```bash
# Stel agentspecifieke omgevingsvariabelen in
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Rol uit met bijgewerkte configuratie
azd deploy
```

---

## 📊 Agenten monitoren

### Integratie met Application Insights

Alle AZD agent-sjablonen bevatten Application Insights voor monitoring:

```bash
# Open het dashboard voor monitoring
azd monitor --overview

# Bekijk live logbestanden
azd monitor --logs

# Bekijk live statistieken
azd monitor --live
```

### Belangrijke statistieken om te volgen

| Maatstaf | Beschrijving | Doel |
|--------|-------------|--------|
| Responstijd | Tijd om antwoord te genereren | < 5 seconds |
| Tokengebruik | Tokens per verzoek | Monitor voor kosten |
| Succespercentage van tool-aanroepen | % van succesvolle tooluitvoeringen | > 95% |
| Foutpercentage | Mislukte agentaanvragen | < 1% |
| Gebruikerstevredenheid | Feedbackscores | > 4.0/5.0 |

### Aangepaste logging voor agenten

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

## 💰 Kostenoverwegingen

### Geschatte maandelijkse kosten per patroon

| Patroon | Ontwikkelomgeving | Productie |
|---------|-----------------|------------|
| Single Agent | $50-100 | $200-500 |
| RAG Agent | $80-150 | $300-800 |
| Multi-Agent (2-3 agents) | $150-300 | $500-1,500 |
| Enterprise Multi-Agent | $300-500 | $1,500-5,000+ |

### Tips voor kostenoptimalisatie

1. **Gebruik GPT-4o-mini voor eenvoudige taken**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Implementeer caching voor herhaalde queries**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Stel tokenlimieten in**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Beperk de lengte van het antwoord
   )
   ```

4. **Schaal naar nul wanneer niet in gebruik**
   ```bash
   # Container Apps schalen automatisch naar nul
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Probleemoplossing voor agenten

### Veelvoorkomende problemen en oplossingen

<details>
<summary><strong>❌ Agent reageert niet op tool-aanroepen</strong></summary>

```bash
# Controleer of de tools correct zijn geregistreerd
azd show

# Controleer de OpenAI-implementatie
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Controleer de agentlogboeken
azd monitor --logs
```

**Veelvoorkomende oorzaken:**
- Handtekening van toolfunctie komt niet overeen
- Ontbrekende vereiste machtigingen
- API-endpoint niet toegankelijk
</details>

<details>
<summary><strong>❌ Hoge latentie in agentreacties</strong></summary>

```bash
# Controleer Application Insights op knelpunten
azd monitor --live

# Overweeg een sneller model te gebruiken
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Optimalisatietips:**
- Gebruik streamingreacties
- Implementeer caching van reacties
- Verminder de grootte van het contextvenster
</details>

<details>
<summary><strong>❌ Agent geeft onjuiste of gehallucineerde informatie terug</strong></summary>

```python
# Verbeter met betere systeemprompts
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Voeg opvraging toe voor onderbouwing
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Onderbouw antwoorden met documenten
)
```
</details>

<details>
<summary><strong>❌ Fouten: tokenlimiet overschreden</strong></summary>

```python
# Implementeer beheer van het contextvenster
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Ruwe schatting
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Praktijkopdrachten

### Oefening 1: Implementeer een basisagent (20 minuten)

**Doel:** Implementeer je eerste AI-agent met AZD

```bash
# Stap 1: Sjabloon initialiseren
azd init --template get-started-with-ai-agents

# Stap 2: Aanmelden bij Azure
azd auth login

# Stap 3: Uitrollen
azd up

# Stap 4: De agent testen
# Open de URL die in de uitvoer wordt weergegeven

# Stap 5: Opruimen
azd down --force --purge
```

**Succescriteria:**
- [ ] Agent reageert op vragen
- [ ] Kan toegang krijgen tot het monitoringsdashboard
- [ ] Resources succesvol opgeruimd

### Oefening 2: Voeg een aangepaste tool toe (30 minuten)

**Doel:** Breid een agent uit met een aangepaste tool

1. Implementeer het agent-sjabloon
2. Maak een nieuwe toolfunctie:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # API-aanroep naar weerservice
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Registreer de tool bij de agent
4. Test dat de agent de nieuwe tool gebruikt

**Succescriteria:**
- [ ] Agent herkent weersgerelateerde vragen
- [ ] Tool wordt correct aangeroepen
- [ ] Antwoord bevat weerinformatie

### Oefening 3: Bouw een RAG-agent (45 minuten)

**Doel:** Maak een agent die vragen beantwoordt op basis van jouw documenten

```bash
# Implementeer RAG-sjabloon
azd init --template azure-search-openai-demo
azd up

# Upload uw documenten
# (Volg de handleiding voor gegevensinname van het sjabloon)

# Test met domeinspecifieke vragen
```

**Succescriteria:**
- [ ] Agent beantwoordt vanuit geüploade documenten
- [ ] Antwoorden bevatten citaties
- [ ] Geen hallucinatie bij vragen buiten het bereik

---

## 📚 Volgende stappen

Nu je AI-agenten begrijpt, verken deze geavanceerde onderwerpen:

| Onderwerp | Beschrijving | Link |
|-------|-------------|------|
| **Multi-Agent Systems** | Bouw systemen met meerdere samenwerkende agenten | [Retail Multi-Agent Voorbeeld](../../examples/retail-scenario.md) |
| **Coördinatiepatronen** | Leer orkestratie- en communicatiepatronen | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Productie-implementatie** | Enterprise-klare agentimplementatie | [Productie AI-praktijken](production-ai-practices.md) |
| **Agentevaluatie** | Test en evalueer agentprestaties | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Aanvullende bronnen

### Officiële documentatie
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD-sjablonen voor agenten
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Communitybronnen
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigatie**
- **Vorige les**: [AI-modelimplementatie](ai-model-deployment.md)
- **Volgende les**: [Productie AI-praktijken](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, houd er rekening mee dat geautomatiseerde vertalingen fouten of onjuistheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->