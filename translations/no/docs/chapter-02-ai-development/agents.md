# AI-agenter med Azure Developer CLI

**Kapittelnavigasjon:**
- **📚 Kursforside**: [AZD for nybegynnere](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 2 - AI-fokusert utvikling
- **⬅️ Forrige**: [Distribusjon av AI-modeller](ai-model-deployment.md)
- **➡️ Neste**: [Produksjonspraksis for AI](production-ai-practices.md)
- **🚀 Avansert**: [Multi-agent-løsninger](../../examples/retail-scenario.md)

---

## Introduksjon

AI-agenter er autonome programmer som kan oppfatte miljøet sitt, ta beslutninger og utføre handlinger for å nå bestemte mål. I motsetning til enkle chatboter som svarer på forespørsler, kan agenter:

- **Bruk verktøy** - Kalle API-er, søke i databaser, kjøre kode
- **Planlegge og resonnere** - Dele komplekse oppgaver opp i trinn
- **Lære fra kontekst** - Opprettholde minne og tilpasse atferd
- **Samarbeide** - Arbeide med andre agenter (multi-agent-systemer)

Denne veiledningen viser hvordan du distribuerer AI-agenter til Azure ved hjelp av Azure Developer CLI (azd).

## Læringsmål

Ved å fullføre denne veiledningen vil du:
- Forstå hva AI-agenter er og hvordan de skiller seg fra chatboter
- Distribuere forhåndsbygde AI-agentmaler ved hjelp av AZD
- Konfigurere Foundry Agents for egendefinerte agenter
- Implementere grunnleggende agentmønstre (verktøybruk, RAG, multi-agent)
- Overvåke og feilsøke distribuerte agenter

## Læringsutbytte

Etter fullføring vil du kunne:
- Distribuere AI-agentapplikasjoner til Azure med en enkelt kommando
- Konfigurere agentverktøy og funksjonaliteter
- Implementere retrieval-augmented generation (RAG) med agenter
- Designe multi-agent-arkitekturer for komplekse arbeidsflyter
- Feilsøke vanlige problemer ved agentdistribusjon

---

## 🤖 Hva skiller en agent fra en chatbot?

| Egenskap | Chatbot | AI-agent |
|---------|---------|----------|
| **Atferd** | Svarer på forespørsler | Utfører autonome handlinger |
| **Verktøy** | Ingen | Kan kalle API-er, søke, kjøre kode |
| **Minne** | Kun øktbasert | Vedvarende minne på tvers av økter |
| **Planlegging** | Enkelt svar | Flertrinns resonnement |
| **Samarbeid** | Enkeltstående enhet | Kan samarbeide med andre agenter |

### Enkel analogi

- **Chatbot** = En hjelpsom person som svarer på spørsmål ved en informasjonsdisk
- **AI Agent** = En personlig assistent som kan ringe, booke avtaler og fullføre oppgaver for deg

---

## 🚀 Kom i gang raskt: Distribuer din første agent

### Alternativ 1: Foundry Agents-mal (Anbefalt)

```bash
# Initialiser malen for AI-agenter
azd init --template get-started-with-ai-agents

# Distribuer til Azure
azd up
```

**Hva som distribueres:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (for RAG)
- ✅ Azure Container Apps (webgrensesnitt)
- ✅ Application Insights (overvåking)

**Tid:** ~15-20 minutter
**Kostnad:** ~$100-150/month (development)

### Alternativ 2: OpenAI Agent med Prompty

```bash
# Initialiser den Prompty-baserte agentmalen
azd init --template agent-openai-python-prompty

# Distribuer til Azure
azd up
```

**Hva som distribueres:**
- ✅ Azure Functions (serverløs agentkjøring)
- ✅ Azure OpenAI
- ✅ Prompty-konfigurasjonsfiler
- ✅ Eksempelveiledning for agentimplementasjon

**Tid:** ~10-15 minutter
**Kostnad:** ~$50-100/month (development)

### Alternativ 3: RAG Chat-agent

```bash
# Initialiser RAG chat-mal
azd init --template azure-search-openai-demo

# Distribuer til Azure
azd up
```

**Hva som distribueres:**
- ✅ Azure OpenAI
- ✅ Azure AI Search med eksempeldatasett
- ✅ Dokumentbehandlingspipeline
- ✅ Chatgrensesnitt med henvisninger

**Tid:** ~15-25 minutter
**Kostnad:** ~$80-150/month (development)

---

## 🏗️ Agentarkitekturmønstre

### Mønster 1: Enkel agent med verktøy

Det enkleste agentmønsteret - en agent som kan bruke flere verktøy.

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

**Passer for:**
- Kundestøtteboter
- Forskningsassistenter
- Dataanalyseagenter

**AZD-mal:** `azure-search-openai-demo`

### Mønster 2: RAG-agent (Retrieval-Augmented Generation)

En agent som henter relevante dokumenter før den genererer svar.

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

**Passer for:**
- Bedriftskunnskapsbaser
- Dokumentspørsmål-og-svar-systemer
- Overholdelse og juridisk forskning

**AZD-mal:** `azure-search-openai-demo`

### Mønster 3: Multi-agent-system

Flere spesialiserte agenter som samarbeider om komplekse oppgaver.

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

**Passer for:**
- Kompleks innholdsproduksjon
- Flertrinns arbeidsflyter
- Oppgaver som krever ulik ekspertise

**Lær mer:** [Koordineringsmønstre for multi-agent-systemer](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Konfigurere agentverktøy

Agenter blir kraftigere når de kan bruke verktøy. Slik konfigurerer du vanlige verktøy:

### Verktøykonfigurasjon i Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Definer egendefinerte verktøy
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

# Opprett agent med verktøy
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Miljøkonfigurasjon

```bash
# Sett opp agentspesifikke miljøvariabler
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Distribuer med oppdatert konfigurasjon
azd deploy
```

---

## 📊 Overvåking av agenter

### Integrasjon med Application Insights

Alle AZD-agentmaler inkluderer Application Insights for overvåking:

```bash
# Åpne overvåkingsdashbordet
azd monitor --overview

# Vis sanntidslogger
azd monitor --logs

# Vis sanntidsmålinger
azd monitor --live
```

### Nøkkelmetrikker å følge

| Metrikk | Beskrivelse | Mål |
|--------|-------------|--------|
| Responstid | Tid for å generere svar | < 5 sekunder |
| Tokenbruk | Tokens per forespørsel | Overvåk for kostnad |
| Suksessrate for verktøykall | % av vellykkede verktøykjøringer | > 95% |
| Feilrate | Mislykkede agentforespørsler | < 1% |
| Brukertilfredshet | Tilbakemeldingspoeng | > 4.0/5.0 |

### Tilpasset logging for agenter

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

## 💰 Kostnadsbetraktninger

### Estimerte månedlige kostnader per mønster

| Mønster | Utviklingsmiljø | Produksjon |
|---------|-----------------|------------|
| Enkeltagent | $50-100 | $200-500 |
| RAG-agent | $80-150 | $300-800 |
| Multi-agent (2-3 agenter) | $150-300 | $500-1,500 |
| Bedrifts multi-agent | $300-500 | $1,500-5,000+ |

### Tips for kostnadsoptimalisering

1. **Bruk GPT-4o-mini for enkle oppgaver**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Implementer caching for gjentatte spørringer**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Sett tokenbegrensninger**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Begrens svarlengden
   )
   ```

4. **Skaler til null når ikke i bruk**
   ```bash
   # Container Apps skalerer automatisk til null
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Feilsøking av agenter

### Vanlige problemer og løsninger

<details>
<summary><strong>❌ Agent svarer ikke på verktøykall</strong></summary>

```bash
# Sjekk om verktøyene er riktig registrert
azd show

# Bekreft OpenAI-utrullingen
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Sjekk agentloggene
azd monitor --logs
```

**Vanlige årsaker:**
- Funksjonssignatur for verktøyet stemmer ikke
- Manglende nødvendige tillatelser
- API-endepunktet er ikke tilgjengelig
</details>

<details>
<summary><strong>❌ Høy latenstid i agentresponser</strong></summary>

```bash
# Sjekk Application Insights for flaskehalser
azd monitor --live

# Vurder å bruke en raskere modell
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Optimaliseringstips:**
- Bruk streaming-responser
- Implementer responscaching
- Reduser kontekstvindusstørrelsen
</details>

<details>
<summary><strong>❌ Agent returnerer feilaktig eller hallusinert informasjon</strong></summary>

```python
# Forbedre med bedre systeminstrukser
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Legg til gjenfinning for forankring
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Forankre svar i dokumenter
)
```
</details>

<details>
<summary><strong>❌ Token-grense overskredet-feil</strong></summary>

```python
# Implementer håndtering av kontekstvinduet
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Omtrentlig anslag
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Praktiske øvelser

### Øvelse 1: Distribuer en grunnleggende agent (20 minutter)

**Mål:** Distribuer din første AI-agent med AZD

```bash
# Trinn 1: Initialiser malen
azd init --template get-started-with-ai-agents

# Trinn 2: Logg inn på Azure
azd auth login

# Trinn 3: Distribuer
azd up

# Trinn 4: Test agenten
# Åpne URL-en som vises i utdataene

# Trinn 5: Rydd opp
azd down --force --purge
```

**Suksesskriterier:**
- [ ] Agent svarer på spørsmål
- [ ] Kan få tilgang til overvåkingsdashbord
- [ ] Ressurser ryddet opp vellykket

### Øvelse 2: Legg til et tilpasset verktøy (30 minutter)

**Mål:** Utvid en agent med et tilpasset verktøy

1. Distribuer agentmalen
2. Opprett en ny verktøyfunksjon:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # API-anrop til værmeldingstjeneste
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Registrer verktøyet med agenten
4. Test at agenten bruker det nye verktøyet

**Suksesskriterier:**
- [ ] Agenten gjenkjenner værrelaterte spørringer
- [ ] Verktøyet kalles korrekt
- [ ] Svaret inneholder værinformasjon

### Øvelse 3: Bygg en RAG-agent (45 minutter)

**Mål:** Lag en agent som svarer på spørsmål fra dokumentene dine

```bash
# Distribuer RAG-mal
azd init --template azure-search-openai-demo
azd up

# Last opp dokumentene dine
# (Følg malens veiledning for dataimport)

# Test med domenespesifikke spørsmål
```

**Suksesskriterier:**
- [ ] Agent svarer fra opplastede dokumenter
- [ ] Svarene inneholder henvisninger
- [ ] Ingen hallusinasjoner på spørsmål utenfor omfang

---

## 📚 Neste steg

Nå som du forstår AI-agenter, utforsk disse avanserte temaene:

| Tema | Beskrivelse | Lenke |
|-------|-------------|------|
| **Multi-agent-systemer** | Bygg systemer med flere samarbeidende agenter | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Koordineringsmønstre** | Lær orkestrering og kommunikasjonsmønstre | [Koordineringsmønstre](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Produksjonsutrulling** | Agentdistribusjon klar for virksomhet | [Produksjonspraksis for AI](production-ai-practices.md) |
| **Agentevaluering** | Test og evaluer agentytelse | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Flere ressurser

### Offisiell dokumentasjon
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD-maler for agenter
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Fellesskapsressurser
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigasjon**
- **Forrige leksjon**: [Distribusjon av AI-modeller](ai-model-deployment.md)
- **Neste leksjon**: [Produksjonspraksis for AI](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten Co-op Translator (https://github.com/Azure/co-op-translator). Selv om vi gjør vårt beste for å være nøyaktige, må du være oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell, menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->