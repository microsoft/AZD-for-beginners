# AI Agents with Azure Developer CLI

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Practices](production-ai-practices.md)
- **🚀 Advanced**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## Introduction

AI agenti so avtonomni programi, ki zaznavajo svoje okolje, sprejemajo odločitve in izvajajo dejanja za dosego določenih ciljev. V nasprotju s preprostimi klepetalniki, ki odgovarjajo na pozive, agenti lahko:

- **Uporabljajo orodja** - Kličo API-je, iščejo v bazah podatkov, izvajajo kodo
- **Načrtujejo in sklepajo** - Razbijejo kompleksne naloge na korake
- **Se učijo iz konteksta** - Ohranjajo pomnilnik in prilagajajo vedenje
- **Sodelujejo** - Delujejo z drugimi agenti (večagentni sistemi)

Ta vodič vam pokaže, kako razporediti AI agente v Azure z uporabo Azure Developer CLI (azd).

## Learning Goals

Z dokončanjem tega vodiča boste:
- Razumeli, kaj so AI agenti in kako se razlikujejo od klepetalnikov
- Razporedili vnaprej izdelane predloge AI agentov z uporabo AZD
- Konfigurirali Foundry agente za prilagojene agente
- Implementirali osnovne vzorce agentov (uporaba orodij, RAG, večagentno)
- Spremljali in odpravljali napake razporejenih agentov

## Learning Outcomes

Po zaključku boste lahko:
- Razporedili AI aplikacije agentov v Azure z eno samo ukazno vrstico
- Konfigurirali orodja in zmogljivosti agentov
- Implementirali retrieval-augmented generation (RAG) z agenti
- Načrtovali večagentne arhitekture za kompleksne delovne procese
- Odpravljali pogoste težave pri razporejanju agentov

---

## 🤖 What Makes an Agent Different from a Chatbot?

| Značilnost | Klepetalnik | AI agent |
|---------|---------|----------|
| **Vedenje** | Odgovarja na pozive | Izvaja avtonomne ukrepe |
| **Orodja** | Brez | Lahko kliče API-je, išče, izvaja kodo |
| **Pomnilnik** | Samo znotraj seje | Trajni pomnilnik med sejami |
| **Načrtovanje** | En sam odgovor | Večstopenjsko sklepanje |
| **Sodelovanje** | En sam subjekt | Lahko sodeluje z drugimi agenti |

### Simple Analogy

- **Klepetalnik** = Prijazna oseba, ki odgovarja na vprašanja na informacijskem pultu
- **AI agent** = Osebni asistent, ki lahko opravlja klice, rezervira termine in izvede naloge za vas

---

## 🚀 Quick Start: Deploy Your First Agent

### Option 1: Foundry Agents Template (Recommended)

```bash
# Inicializiraj predlogo AI agentov
azd init --template get-started-with-ai-agents

# Razporedi v Azure
azd up
```

**Kaj je razporejeno:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (za RAG)
- ✅ Azure Container Apps (spletni vmesnik)
- ✅ Application Insights (spremljanje)

**Čas:** ~15-20 minut
**Strošek:** ~$100-150/mesec (razvoj)

### Option 2: OpenAI Agent with Prompty

```bash
# Inicializirajte predlogo agenta, ki temelji na Prompty
azd init --template agent-openai-python-prompty

# Namestite v Azure
azd up
```

**Kaj je razporejeno:**
- ✅ Azure Functions (serverless izvedba agenta)
- ✅ Azure OpenAI
- ✅ Konfiguracijske datoteke Prompty
- ✅ Primer implementacije agenta

**Čas:** ~10-15 minut
**Strošek:** ~$50-100/mesec (razvoj)

### Option 3: RAG Chat Agent

```bash
# Inicializiraj predlogo klepeta RAG
azd init --template azure-search-openai-demo

# Razporedi v Azure
azd up
```

**Kaj je razporejeno:**
- ✅ Azure OpenAI
- ✅ Azure AI Search s primeri podatkov
- ✅ Pipeline za obdelavo dokumentov
- ✅ Klepetalni vmesnik z navedbami virov

**Čas:** ~15-25 minut
**Strošek:** ~$80-150/mesec (razvoj)

---

## 🏗️ Agent Architecture Patterns

### Vzorec 1: En agent z orodji

Najpreprostejši vzorec agenta - en agent, ki lahko uporablja več orodij.

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

**Najbolj primerno za:**
- Pomoč pri podpori strankam
- Raziskovalni asistenti
- Agenti za analizo podatkov

**AZD Template:** `azure-search-openai-demo`

### Vzorec 2: RAG Agent (pridobitno-podprta generacija)

Agent, ki pridobi relevantne dokumente pred generiranjem odgovorov.

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

**Najbolj primerno za:**
- Podjetniške baze znanja
- Sisteme Q&A za dokumente
- Skladnost in pravne raziskave

**AZD Template:** `azure-search-openai-demo`

### Vzorec 3: Večagentni sistem

Več specializiranih agentov, ki sodelujejo pri kompleksnih nalogah.

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

**Najbolj primerno za:**
- Kompleksno generiranje vsebin
- Večstopenjske delovne procese
- Naloge, ki zahtevajo različno strokovno znanje

**Več informacij:** [Vzorce koordinacije več agentov](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Configuring Agent Tools

Agenti postanejo zmogljivi, ko lahko uporabljajo orodja. Tako konfigurirate pogosta orodja:

### Konfiguracija orodij v Foundry Agentih

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Opredeli prilagojena orodja
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

# Ustvari agenta z orodji
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Konfiguracija okolja

```bash
# Nastavi okoljske spremenljivke, specifične za agenta
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Razporedi z posodobljeno konfiguracijo
azd deploy
```

---

## 📊 Monitoring Agents

### Integracija z Application Insights

Vse AZD predloge agentov vključujejo Application Insights za spremljanje:

```bash
# Odpri nadzorno ploščo za spremljanje
azd monitor --overview

# Ogled dnevnikov v živo
azd monitor --logs

# Ogled metrik v živo
azd monitor --live
```

### Ključne meritve za spremljanje

| Meritev | Opis | Cilj |
|--------|-------------|--------|
| Latenca odgovora | Čas za generiranje odgovora | < 5 sekund |
| Poraba žetonov | Žetoni na zahtevo | Spremljajte zaradi stroškov |
| Uspešnost klicev orodij | % uspešnih izvedb orodij | > 95% |
| Stopnja napak | Neuspešne zahteve agenta | < 1% |
| Zadovoljstvo uporabnikov | Ocene povratnih informacij | > 4.0/5.0 |

### Prilagojeno beleženje za agente

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

## 💰 Cost Considerations

### Ocenjeni mesečni stroški po vzorcih

| Vzorec | Razvojno okolje | Produkcija |
|---------|-----------------|------------|
| En agent | $50-100 | $200-500 |
| RAG agent | $80-150 | $300-800 |
| Večagentni (2-3 agenti) | $150-300 | $500-1,500 |
| Podjetniški večagentni | $300-500 | $1,500-5,000+ |

### Smernice za optimizacijo stroškov

1. **Uporabite GPT-4o-mini za preproste naloge**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Implementirajte predpomnjenje za ponavljajoče poizvedbe**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Nastavite omejitve žetonov**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Omeji dolžino odgovora
   )
   ```

4. **Razširite na ničelno porabo, ko ni v uporabi**
   ```bash
   # Container Apps se samodejno zmanjšajo na nič
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Troubleshooting Agents

### Pogoste težave in rešitve

<details>
<summary><strong>❌ Agent ne odgovarja na klice orodij</strong></summary>

```bash
# Preveri, ali so orodja pravilno registrirana
azd show

# Preveri namestitev OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Preveri dnevnike agenta
azd monitor --logs
```

**Pogosti vzroki:**
- Neujemanje podpisa funkcije orodja
- Manjkajo potrebna dovoljenja
- Končna točka API ni dostopna
</details>

<details>
<summary><strong>❌ Visoka zakasnitev v odgovorih agenta</strong></summary>

```bash
# Preverite Application Insights zaradi ozkih grl
azd monitor --live

# Razmislite o uporabi hitrejšega modela
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Optimizacijski nasveti:**
- Uporabite pretočne odgovore
- Implementirajte predpomnjenje odgovorov
- Zmanjšajte velikost kontekstnega okna
</details>

<details>
<summary><strong>❌ Agent vrača nepravilne ali izmišljene informacije</strong></summary>

```python
# Izboljšajte z boljšimi sistemskimi pozivi
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Dodajte pridobivanje za utemeljitev
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Utemeljite odgovore v dokumentih
)
```
</details>

<details>
<summary><strong>❌ Napake: presežena omejitev žetonov</strong></summary>

```python
# Implementiraj upravljanje kontekstnega okna
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Približna ocena
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Hands-On Exercises

### Exercise 1: Deploy a Basic Agent (20 minutes)

**Cilj:** Namestite svojega prvega AI agenta z AZD

```bash
# Korak 1: Inicializirajte predlogo
azd init --template get-started-with-ai-agents

# Korak 2: Prijavite se v Azure
azd auth login

# Korak 3: Namestite
azd up

# Korak 4: Preizkusite agenta
# Odprite URL, prikazan v izhodu

# Korak 5: Počistite
azd down --force --purge
```

**Kriteriji uspeha:**
- [ ] Agent odgovarja na vprašanja
- [ ] Lahko dostopa do nadzorne plošče za spremljanje
- [ ] Viri so uspešno očiščeni

### Exercise 2: Add a Custom Tool (30 minutes)

**Cilj:** Razširite agenta z lastnim orodjem

1. Razporedite predlogo agenta
2. Ustvarite novo funkcijo orodja:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Klic API-ja na vremensko storitev
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Registrirajte orodje pri agentu
4. Preizkusite, ali agent uporablja novo orodje

**Kriteriji uspeha:**
- [ ] Agent prepozna poizvedbe povezane z vremenom
- [ ] Orodje se pravilno kliče
- [ ] Odgovor vključuje informacije o vremenu

### Exercise 3: Build a RAG Agent (45 minutes)

**Cilj:** Ustvarite agenta, ki odgovarja na vprašanja iz vaših dokumentov

```bash
# Namestite predlogo RAG
azd init --template azure-search-openai-demo
azd up

# Naložite svoje dokumente
# (Sledite vodiču predloge za uvoz podatkov)

# Preizkusite z vprašanji, specifičnimi za domeno
```

**Kriteriji uspeha:**
- [ ] Agent odgovarja na podlagi prenesenih dokumentov
- [ ] Odgovori vključujejo navedbe virov
- [ ] Brez izmišljenih informacij pri vprašanjih izven obsega

---

## 📚 Next Steps

Zdaj, ko razumete AI agente, raziščite te napredne teme:

| Tema | Opis | Povezava |
|-------|-------------|------|
| **Večagentni sistemi** | Zgradite sisteme z več sodelujočimi agenti | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Vzorce koordinacije** | Naučite se orkestracije in komunikacijskih vzorcev | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Produkcijska namestitev** | Priprava agentov za podjetniško uporabo | [Production AI Practices](production-ai-practices.md) |
| **Vrednotenje agentov** | Testirajte in ocenite uspešnost agentov | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Additional Resources

### Uradna dokumentacija
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD predloge za agente
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Skupnostni viri
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigation**
- **Previous Lesson**: [AI Model Deployment](ai-model-deployment.md)
- **Next Lesson**: [Production AI Practices](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v svoji izvorni različici velja za avtoritativni vir. Za kritične informacije priporočamo strokoven človeški prevod. Ne prevzemamo odgovornosti za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->