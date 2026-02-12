# AI-agentid Azure Developer CLI-iga

**Chapter Navigation:**
- **📚 Course Home**: [AZD algajatele](../../README.md)
- **📖 Current Chapter**: Peatükk 2 - AI-esmane arendus
- **⬅️ Previous**: [AI mudeli juurutamine](ai-model-deployment.md)
- **➡️ Next**: [Tootmise AI-tavad](production-ai-practices.md)
- **🚀 Advanced**: [Mitmeagendilised lahendused](../../examples/retail-scenario.md)

---

## Sissejuhatus

AI-agentid on autonoomsed programmid, mis suudavad tajuda oma keskkonda, teha otsuseid ja võtta tegevusi konkreetsete eesmärkide saavutamiseks. Erinevalt lihtsatest vestlusrobotitest, mis vastavad päringutele, suudavad agendid:

- **Kasutada tööriistu** - kutsuda API-sid, otsida andmebaase, käivitada koodi
- **Planeerida ja mõelda** - jagada keerulisi ülesandeid sammudeks
- **Õppida kontekstist** - säilitada mälu ja kohandada käitumist
- **Koostööd teha** - töötada koos teiste agentidega (mitmeagendilised süsteemid)

See juhend näitab, kuidas juurutada AI-agente Azure'i, kasutades Azure Developer CLI-d (azd).

## Õpieesmärgid

Selle juhendi lõpuks:
- Mõistate, mis on AI-agentid ja kuidas need erinevad vestlusrobotitest
- Juurutate eelvalmis AI-agendi malle AZD abil
- Konfigureerite Foundry Agent'e kohandatud agentide jaoks
- Rakendate põhilisi agendi mustreid (tööriistakasutus, RAG, mitmeagendiline)
- Jälgite ja silute juurutatud agente

## Õpitulemused

Pärast juhendi läbimist suudate:
- Juurutada AI-agendirakendusi Azure'i ühe käsuga
- Konfigureerida agendi tööriistu ja võimeid
- Rakendada retrieval-augmented generation (RAG) agente
- Kujundada mitmeagendilisi arhitektuure keerukate töövoogude jaoks
- Lahendada tavalisi agendi juurutamise probleeme

---

## 🤖 Mis teeb agendist erineva vestlusrobotist?

| Feature | Chatbot | AI Agent |
|---------|---------|----------|
| **Behavior** | Vastab päringutele | Võtab autonoomseid tegevusi |
| **Tools** | Puuduvad | Suudab kutsuda API-sid, otsida, käivitada koodi |
| **Memory** | Ainult sessioonipõhine | Püsiv mälu sessioonide vahel |
| **Planning** | Ühe vastusega | Mitmeastmeline mõtlemine |
| **Collaboration** | Üks entiteet | Suudab töötada koos teiste agentidega |

### Lihtne võrdlus

- **Vestlusrobot** = Abivalmis inimene, kes vastab infotöölauas esitatud küsimustele
- **AI-agent** = Isiklik assistent, kes saab helistada, broneerida kohtumisi ja täita teie jaoks ülesandeid

---

## 🚀 Kiirjuhend: juurutage oma esimene agent

### Valik 1: Foundry Agents mall (Soovitatav)

```bash
# AI-agentide malli initsialiseerimine
azd init --template get-started-with-ai-agents

# Azure'i juurutamine
azd up
```

**Mis juurutatakse:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (RAG jaoks)
- ✅ Azure Container Apps (veebiliides)
- ✅ Application Insights (jälgimine)

**Aeg:** ~15–20 minutit
**Kulu:** ~$100–150/kuu (arendus)

### Valik 2: OpenAI Agent Prompty-ga

```bash
# Initsialiseeri Prompty-põhine agendi mall
azd init --template agent-openai-python-prompty

# Juuruta Azure'i
azd up
```

**Mis juurutatakse:**
- ✅ Azure Functions (serverivaba agendi täitmine)
- ✅ Azure OpenAI
- ✅ Prompty konfiguratsioonifailid
- ✅ Näidisagendi rakendus

**Aeg:** ~10–15 minutit
**Kulu:** ~$50–100/kuu (arendus)

### Valik 3: RAG-vestlusagent

```bash
# Initsialiseeri RAG-vestluse mall
azd init --template azure-search-openai-demo

# Juuruta Azure'i
azd up
```

**Mis juurutatakse:**
- ✅ Azure OpenAI
- ✅ Azure AI Search näidisandmetega
- ✅ Dokumentide töötlemise torujuhe
- ✅ Vestlusliides tsitaatidega

**Aeg:** ~15–25 minutit
**Kulu:** ~$80–150/kuu (arendus)

---

## 🏗️ Agendi arhitektuurimustrid

### Muster 1: Üks agent tööriistadega

Kõige lihtsam agendi muster - üks agent, kes võib kasutada mitmeid tööriistu.

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

**Parim jaoks:**
- Klienditoe botid
- Uurimisassistendid
- Andmeanalüüsi agentid

**AZD Template:** `azure-search-openai-demo`

### Muster 2: RAG-agent (Retrieval-Augmented Generation)

Agent, mis hangib enne vastuse genereerimist asjakohaseid dokumente.

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

**Parim jaoks:**
- Ettevõtte teadmistebaasid
- Dokumentide Q&A süsteemid
- Vastavus- ja õiguslikud uuringud

**AZD Template:** `azure-search-openai-demo`

### Muster 3: Mitmeagendiline süsteem

Mitu spetsialiseerunud agenti, mis töötavad koos keerukate ülesannete lahendamiseks.

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

**Parim jaoks:**
- Keeruline sisu genereerimine
- Mitmeastmelised töövood
- Ülesanded, mis nõuavad erinevat ekspertiisi

**Lisateave:** [Koordineerimise mustrid](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Agendi tööriistade konfigureerimine

Agendid muutuvad võimsaks, kui nad saavad tööriistu kasutada. Siin on, kuidas konfigureerida sagedasemaid tööriistu:

### Tööriista konfiguratsioon Foundry Agent'ides

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Määratle kohandatud tööriistad
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

# Loo agent tööriistadega
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Keskkonna konfiguratsioon

```bash
# Seadista agendi-spetsiifilised keskkonnamuutujad
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Juuruta uuendatud konfiguratsiooniga
azd deploy
```

---

## 📊 Agentide jälgimine

### Application Insights integratsioon

Kõik AZD agendi mallid sisaldavad Application Insightsi jälgimiseks:

```bash
# Ava monitooringu juhtpaneel
azd monitor --overview

# Vaata reaalajas logisid
azd monitor --logs

# Vaata reaalajas mõõdikuid
azd monitor --live
```

### Olulised mõõdikud jälgimiseks

| Metric | Description | Target |
|--------|-------------|--------|
| Vastuse latentsus | Aeg vastuse genereerimiseks | < 5 sekundit |
| Tokeni kasutus | Tokenid päringu kohta | Jälgida kulu jaoks |
| Tööriista kutsumise edutõenäosus | Edukate tööriista täitmiste %-maht | > 95% |
| Vigade määr | Ebaõnnestunud agendi päringud | < 1% |
| Kasutaja rahulolu | Tagasiside skoorid | > 4.0/5.0 |

### Kohandatud logimine agentidele

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

## 💰 Kulutegurid

### Hinnangulised igakuised kulud mustri järgi

| Pattern | Dev Environment | Production |
|---------|-----------------|------------|
| Single Agent | $50-100 | $200-500 |
| RAG Agent | $80-150 | $300-800 |
| Multi-Agent (2-3 agents) | $150-300 | $500-1,500 |
| Enterprise Multi-Agent | $300-500 | $1,500-5,000+ |

### Kulude optimeerimise nipid

1. **Kasuta GPT-4o-mini lihtsateks ülesanneteks**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Rakenda vahemälu korduvate päringute jaoks**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Sea tokenipiirangud**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Piira vastuse pikkust
   )
   ```

4. **Skaleeri nulli, kui ei kasutata**
   ```bash
   # Container Apps skaleeruvad automaatselt nullini
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Agendi tõrkeotsing

### Levinumad probleemid ja lahendused

<details>
<summary><strong>❌ Agent ei vasta tööriistakutsetele</strong></summary>

```bash
# Kontrolli, kas tööriistad on õigesti registreeritud
azd show

# Kontrolli OpenAI juurutust
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Kontrolli agendi logisid
azd monitor --logs
```

**Tavalised põhjused:**
- Tööriista funktsiooni signatuuri sobimatus
- Puuduvad vajalikud õigused
- API lõpp-punkt ei ole ligipääsetav
</details>

<details>
<summary><strong>❌ Agenti vastuste kõrge latentsus</strong></summary>

```bash
# Kontrolli Application Insightsi kitsaskohti
azd monitor --live

# Kaalu kiirema mudeli kasutamist
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Optimeerimisnõuanded:**
- Kasuta voogedastusega vastuseid
- Rakenda vastuste vahemälu
- Vähenda konteksti akna suurust
</details>

<details>
<summary><strong>❌ Agent tagastab vale või väljamõeldud teabe</strong></summary>

```python
# Paranda paremate süsteemipromptide abil
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Lisa andmete toomine vastuste põhjendamiseks
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Põhista vastused dokumentide põhjal
)
```
</details>

<details>
<summary><strong>❌ Tokenipiiri ületamise vead</strong></summary>

```python
# Rakenda kontekstiakna haldus
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Umbkaudne hinnang
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Praktilised harjutused

### Harjutus 1: Juuruta põhiagent (20 minutit)

**Eesmärk:** Juurutada oma esimene AI-agent, kasutades AZD

```bash
# Samm 1: Initsialiseeri mall
azd init --template get-started-with-ai-agents

# Samm 2: Logi sisse Azure'i
azd auth login

# Samm 3: Paigalda
azd up

# Samm 4: Testi agenti
# Ava väljundis kuvatud URL

# Samm 5: Puhasta
azd down --force --purge
```

**Õnnestumise kriteeriumid:**
- [ ] Agent vastab küsimustele
- [ ] Saab juurde pääseda jälgimisdashboardile
- [ ] Ressursid puhastati edukalt

### Harjutus 2: Lisa kohandatud tööriist (30 minutit)

**Eesmärk:** Laiendada agenti kohandatud tööriistaga

1. Juuruta agendi mall
2. Loo uus tööriistafunktsioon:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # API-päring ilmateenusele
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Registreeri tööriist agendi juures
4. Testi, et agent tööriista kasutab

**Õnnestumise kriteeriumid:**
- [ ] Agent tunneb ära ilmaga seotud päringud
- [ ] Tööriist kutsutakse õigesti
- [ ] Vastus sisaldab ilmaandmeid

### Harjutus 3: Ehita RAG-agent (45 minutit)

**Eesmärk:** Loo agent, mis vastab küsimustele sinu dokumentidest

```bash
# Juuruta RAG-mall
azd init --template azure-search-openai-demo
azd up

# Laadi oma dokumendid üles
# (Järgi malli andmete importimise juhendit)

# Testi domeenispetsiifiliste küsimustega
```

**Õnnestumise kriteeriumid:**
- [ ] Agent vastab üleslaaditud dokumentidest
- [ ] Vastustes on tsitaadid
- [ ] Ei esine väljamõeldud vastuseid väljaspool ulatust

---

## 📚 Järgmised sammud

Nüüd, kui mõistate AI-agente, uurige neid edasijõudnuid teemasid:

| Topic | Description | Link |
|-------|-------------|------|
| **Mitmeagendilised süsteemid** | Ehita süsteeme mitme koostööagentiga | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Koordineerimise mustrid** | Õpi orkestreerimise ja kommunikatsiooni mustreid | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Tootmisse juurutamine** | Ettevõtte tasemel agendi juurutamine | [Production AI Practices](production-ai-practices.md) |
| **Agendi hindamine** | Testi ja hinda agendi jõudlust | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Lisamaterjalid

### Ametlik dokumentatsioon
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD mallid agentidele
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Kogukonna ressursid
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigation**
- **Previous Lesson**: [AI mudeli juurutamine](ai-model-deployment.md)
- **Next Lesson**: [Tootmise AI-tavad](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Lahtiütlus:
See dokument on tõlgitud tehisintellekti tõlketeenuse Co-op Translator (https://github.com/Azure/co-op-translator) abil. Kuigi me püüame tagada täpsust, pidage palun meeles, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument algkeeles tuleks pidada autoriteetseks allikaks. Kriitilise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->