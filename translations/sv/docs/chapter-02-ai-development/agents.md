# AI-agenter med Azure Developer CLI

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 2 - AI-först utveckling
- **⬅️ Föregående**: [Microsoft Foundry-integration](microsoft-foundry-integration.md)
- **➡️ Nästa**: [Distribution av AI-modeller](ai-model-deployment.md)
- **🚀 Avancerat**: [Flera agentlösningar](../../examples/retail-scenario.md)

---

## Introduktion

AI-agenter är autonoma program som kan uppfatta sin omgivning, fatta beslut och vidta åtgärder för att uppnå specifika mål. Till skillnad från enkla chatbottar som svarar på prompts kan agenter:

- **Använder verktyg** - Anropa API:er, söka i databaser, köra kod
- **Planera och resonera** - Dela upp komplexa uppgifter i steg
- **Lära från kontext** - Behålla minne och anpassa beteende
- **Samarbeta** - Arbeta med andra agenter (multi-agent-system)

Denna guide visar hur du distribuerar AI-agenter till Azure med Azure Developer CLI (azd).

## Lärandemål

Genom att slutföra denna guide kommer du att:
- Förstå vad AI-agenter är och hur de skiljer sig från chatbottar
- Distribuera förbyggda AI-agentmallar med AZD
- Konfigurera Foundry-agenter för egna agenter
- Implementera grundläggande agentmönster (verktygsanvändning, RAG, multi-agent)
- Övervaka och felsöka distribuerade agenter

## Läranderesultat

Efter slutförandet kommer du att kunna:
- Distribuera AI-agentapplikationer till Azure med ett enda kommando
- Konfigurera agenters verktyg och kapabiliteter
- Implementera retrieval-augmented generation (RAG) med agenter
- Designa multi-agentarkitekturer för komplexa arbetsflöden
- Felsöka vanliga problem vid agentdistribution

---

## 🤖 Vad gör en agent annorlunda än en chatbot?

| Funktion | Chatbot | AI-agent |
|---------|---------|----------|
| **Beteende** | Svarar på prompts | Utför autonoma åtgärder |
| **Verktyg** | Inga | Kan anropa API:er, söka, köra kod |
| **Minne** | Endast sessionsbaserat | Bestående minne över sessioner |
| **Planering** | Enkel respons | Flera steg i resonemang |
| **Samarbete** | Enskild enhet | Kan arbeta med andra agenter |

### Enkel analogi

- **Chatbot** = En hjälpsam person som svarar på frågor vid en informationsdisk
- **AI-agent** = En personlig assistent som kan ringa, boka möten och utföra uppgifter åt dig

---

## 🚀 Snabbstart: Distribuera din första agent

### Alternativ 1: Foundry Agents-mall (rekommenderas)

```bash
# Initiera mallen för AI-agenterna
azd init --template get-started-with-ai-agents

# Distribuera till Azure
azd up
```

**Vad som distribueras:**
- ✅ Foundry Agents
- ✅ Microsoft Foundry Models (gpt-4.1)
- ✅ Azure AI Search (för RAG)
- ✅ Azure Container Apps (webgränssnitt)
- ✅ Application Insights (övervakning)

**Tid:** ~15-20 minuter
**Kostnad:** ~$100-150/month (development)

### Alternativ 2: OpenAI-agent med Prompty

```bash
# Initiera den Prompty-baserade agentmallen
azd init --template agent-openai-python-prompty

# Distribuera till Azure
azd up
```

**Vad som distribueras:**
- ✅ Azure Functions (serverlös agentkörning)
- ✅ Microsoft Foundry Models
- ✅ Prompty-konfigurationsfiler
- ✅ Exempelimplementering av agent

**Tid:** ~10-15 minuter
**Kostnad:** ~$50-100/month (development)

### Alternativ 3: RAG-chattagent

```bash
# Initiera RAG-chattmall
azd init --template azure-search-openai-demo

# Distribuera till Azure
azd up
```

**Vad som distribueras:**
- ✅ Microsoft Foundry Models
- ✅ Azure AI Search med exempeldata
- ✅ Dokumentbearbetningspipeline
- ✅ Chattgränssnitt med källhänvisningar

**Tid:** ~15-25 minuter
**Kostnad:** ~$80-150/month (development)

### Alternativ 4: AZD AI Agent Init (manifestbaserat)

Om du har en agentmanifestfil kan du använda kommandot `azd ai` för att skaffa en Foundry Agent Service-projektstruktur direkt:

```bash
# Installera tillägget för AI-agenter
azd extension install azure.ai.agents

# Initiera från ett agentmanifest
azd ai agent init -m agent-manifest.yaml

# Distribuera till Azure
azd up
```

**När du ska använda `azd ai agent init` vs `azd init --template`:**

| Approach | Best For | How It Works |
|----------|----------|------|
| `azd init --template` | Starting from a working sample app | Clones a full template repo with code + infra |
| `azd ai agent init -m` | Building from your own agent manifest | Scaffolds project structure from your agent definition |

> **Tips:** Använd `azd init --template` när du lär dig (Alternativ 1–3 ovan). Använd `azd ai agent init` när du bygger produktionsagenter med egna manifest. Se [AZD AI CLI-kommandon](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) för full referens.

---

## 🏗️ Agentarkitekturmönster

### Mönster 1: Enkel agent med verktyg

Den enklaste agentarkitekturen - en agent som kan använda flera verktyg.

```mermaid
graph TD
    UI[Användargränssnitt] --> Agent[AI-agent<br/>gpt-4.1]
    Agent --> Search[Sökverktyg]
    Agent --> Database[Databasverktyg]
    Agent --> API[API-verktyg]
```
**Bäst för:**
- Kundtjänstbotar
- Forskningsassistenter
- Dataanalysagenter

**AZD-mall:** `azure-search-openai-demo`

### Mönster 2: RAG-agent (Retrieval-Augmented Generation)

En agent som hämtar relevanta dokument innan den genererar svar.

```mermaid
graph TD
    Query[Användarförfrågan] --> RAG[RAG-agent]
    RAG --> Vector[Vektorsökning]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- Dokument --> LLM
    LLM --> Response[Svar med källhänvisningar]
```
**Bäst för:**
- Företagskunskapsbaser
- Dokument-Q&A-system
- Efterlevnad och juridisk forskning

**AZD-mall:** `azure-search-openai-demo`

### Mönster 3: System med flera agenter

Flera specialiserade agenter som arbetar tillsammans med komplexa uppgifter.

```mermaid
graph TD
    Orchestrator[Orkestreringsagent] --> Research[Forskningsagent<br/>gpt-4.1]
    Orchestrator --> Writer[Författaragent<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[Granskningsagent<br/>gpt-4.1]
```
**Bäst för:**
- Komplett innehållsgenerering
- Arbetsflöden i flera steg
- Uppgifter som kräver olika expertis

**Läs mer:** [Samordningsmönster för flera agenter](../chapter-06-pre-deployment/coordination-patterns.md)

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

# Skapa en agent med verktyg
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Miljökonfiguration

```bash
# Ställ in agentspecifika miljövariabler
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
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
# Öppna övervakningspanelen
azd monitor --overview

# Visa loggar i realtid
azd monitor --logs

# Visa mätvärden i realtid
azd monitor --live
```

### Viktiga mått att följa

| Mått | Beskrivning | Mål |
|--------|-------------|--------|
| Svarsfördröjning | Tid för att generera svar | < 5 sekunder |
| Tokenanvändning | Tokens per förfrågan | Övervaka för kostnad |
| Lyckandefrekvens för verktygsanrop | % av lyckade verktygsanrop | > 95% |
| Felprocent | Misslyckade agentförfrågningar | < 1% |
| Användarnöjdhet | Återkopplingspoäng | > 4.0/5.0 |

### Anpassad loggning för agenter

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# Konfigurera Azure Monitor med OpenTelemetry
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

> **Obs:** Installera de nödvändiga paketen: `pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 Kostnadsöverväganden

### Beräknade månadskostnader per mönster

| Mönster | Utvecklingsmiljö | Produktion |
|---------|-----------------|------------|
| Enkel agent | $50-100 | $200-500 |
| RAG-agent | $80-150 | $300-800 |
| Multi-agent (2-3 agenter) | $150-300 | $500-1,500 |
| Företags multi-agent | $300-500 | $1,500-5,000+ |

### Tips för kostnadsoptimering

1. **Använd gpt-4.1-mini för enkla uppgifter**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. **Implementera cache för upprepade förfrågningar**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Sätt tokenbegränsningar per körning**
   ```python
   # Ställ in max_completion_tokens när agenten körs, inte vid skapandet
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # Begränsa svarslängden
   )
   ```

4. **Skala till noll när den inte används**
   ```bash
   # Container Apps skalas automatiskt ner till noll
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Felsökning av agenter

### Vanliga problem och lösningar

<details>
<summary><strong>❌ Agenten svarar inte på verktygsanrop</strong></summary>

```bash
# Kontrollera att verktygen är korrekt registrerade
azd show

# Verifiera OpenAI-distributionen
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Kontrollera agentloggar
azd monitor --logs
```

**Vanliga orsaker:**
- Fel i funktionssignatur för verktyget
- Saknade nödvändiga behörigheter
- API-slutpunkt inte åtkomlig
</details>

<details>
<summary><strong>❌ Hög latens i agentens svar</strong></summary>

```bash
# Kontrollera Application Insights för flaskhalsar
azd monitor --live

# Överväg att använda en snabbare modell
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd deploy
```

**Optimeringstips:**
- Använd strömmande svar
- Implementera svarscache
- Minska kontextfönstrets storlek
</details>

<details>
<summary><strong>❌ Agenten returnerar felaktig eller hallucinerad information</strong></summary>

```python
# Förbättra med bättre systempromptar
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Lägg till sökning för förankring
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # Förankra svar i dokument
)
```
</details>

<details>
<summary><strong>❌ Tokenbegränsning överskriden</strong></summary>

```python
# Implementera hantering av kontextfönster
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
# Förväntad utdata efter distribution:
#   Distribution slutförd!
#   Slutpunkt: https://<app-name>.<region>.azurecontainerapps.io
# Öppna URL:en som visas i utdata och prova att ställa en fråga

# Steg 5: Visa övervakning
azd monitor --overview

# Steg 6: Rensa upp
azd down --force --purge
```

**Framgångskriterier:**
- [ ] Agenten svarar på frågor
- [ ] Kan få åtkomst till övervakningspanelen via `azd monitor`
- [ ] Resurserna städades upp framgångsrikt

### Övning 2: Lägg till ett anpassat verktyg (30 minuter)

**Mål:** Utöka en agent med ett anpassat verktyg

1. Distribuera agentmallen:
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. Skapa en ny verktygsfunktion i din agentkod:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # API-anrop till vädertjänst
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Registrera verktyget med agenten:
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
4. Redistribuera och testa:
   ```bash
   azd deploy
   # Fråga: "Hur är vädret i Seattle?"
   # Förväntat: Agenten anropar get_weather("Seattle") och returnerar väderinformation
   ```

**Framgångskriterier:**
- [ ] Agenten känner igen väderrelaterade frågor
- [ ] Verktyget anropas korrekt
- [ ] Svaret innehåller väderinformation

### Övning 3: Bygg en RAG-agent (45 minuter)

**Mål:** Skapa en agent som besvarar frågor från dina dokument

```bash
# Steg 1: Distribuera RAG-mallen
azd init --template azure-search-openai-demo
azd up

# Steg 2: Ladda upp dina dokument
# Placera PDF/TXT-filer i mappen data/ och kör sedan:
python scripts/prepdocs.py

# Steg 3: Testa med domänspecifika frågor
# Öppna webbappens URL från azd up-utdata
# Ställ frågor om dina uppladdade dokument
# Svar bör inkludera källhänvisningar som [doc.pdf]
```

**Framgångskriterier:**
- [ ] Agenten svarar från uppladdade dokument
- [ ] Svaren inkluderar källhänvisningar
- [ ] Ingen hallucination vid frågor utanför scope

---

## 📚 Nästa steg

Nu när du förstår AI-agenter, utforska dessa avancerade ämnen:

| Ämne | Beskrivning | Länk |
|-------|-------------|------|
| **System med flera agenter** | Bygg system med flera samarbetande agenter | [Exempel: Multi-agent i detaljhandeln](../../examples/retail-scenario.md) |
| **Samordningsmönster** | Lära sig orkestrerings- och kommunikationsmönster | [Samordningsmönster](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Produktionsdistribution** | Agentdistribution redo för produktion | [Produktions AI-praktiker](../chapter-08-production/production-ai-practices.md) |
| **Utvärdering av agenter** | Testa och utvärdera agentprestanda | [AI-felsökning](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **AI Workshop-labb** | Praktiskt: Gör din AI-lösning redo för AZD | [AI Workshop Lab](ai-workshop-lab.md) |

---

## 📖 Ytterligare resurser

### Officiell dokumentation
- [Azure AI Agent Service](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure AI Foundry Agent Service Quickstart](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel Agent Framework](https://learn.microsoft.com/semantic-kernel/)

### AZD-mallar för agenter
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Community-resurser
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### Agentfärdigheter för din editor
- [**Microsoft Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Installera återanvändbara AI-agentfärdigheter för Azure-utveckling i GitHub Copilot, Cursor eller någon stödd agent. Inkluderar färdigheter för [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [deployment](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy), och [diagnostics](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics):
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Navigering**
- **Föregående lektion**: [Microsoft Foundry-integration](microsoft-foundry-integration.md)
- **Nästa lektion**: [Distribution av AI-modeller](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning: Detta dokument har översatts med hjälp av AI-översättningstjänsten Co-op Translator (https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, vänligen observera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på originalspråket ska betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår genom användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->