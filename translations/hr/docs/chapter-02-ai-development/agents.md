# AI agenti s Azure Developer CLI

**Navigacija poglavlja:**
- **📚 Početna tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - Razvoj usmjeren na AI
- **⬅️ Prethodno**: [Implementacija AI modela](ai-model-deployment.md)
- **➡️ Sljedeće**: [Prakse AI u produkciji](production-ai-practices.md)
- **🚀 Napredno**: [Rješenja s više agenata](../../examples/retail-scenario.md)

---

## Uvod

AI agenti su autonomni programi koji mogu percipirati svoje okruženje, donositi odluke i poduzimati radnje kako bi postigli određene ciljeve. Za razliku od jednostavnih chatbotova koji odgovaraju na upite, agenti mogu:

- **Koriste alate** - pozivati API-je, pretraživati baze podataka, izvršavati kod
- **Planirati i zaključivati** - razložiti složene zadatke na korake
- **Uče iz konteksta** - zadržavati memoriju i prilagođavati ponašanje
- **Suradnja** - rad s drugim agentima (sustavi s više agenata)

Ovaj vodič prikazuje kako rasporediti AI agente u Azure koristeći Azure Developer CLI (azd).

## Ciljevi učenja

Nakon dovršetka ovog vodiča, naučit ćete:
- Razumjeti što su AI agenti i kako se razlikuju od chatbotova
- Rasporediti unaprijed izrađene predloške AI agenata koristeći AZD
- Konfigurirati Foundry Agente za prilagođene agente
- Implementirati osnovne obrasce agenata (upotreba alata, RAG, više agenata)
- Nadzirati i otklanjati pogreške raspoređenih agenata

## Ishodi učenja

Po završetku, moći ćete:
- Rasporediti AI agent aplikacije na Azure jednom naredbom
- Konfigurirati alate i sposobnosti agenata
- Implementirati retrieval-augmented generation (RAG) s agentima
- Dizajnirati arhitekture s više agenata za složene tokove rada
- Rješavati uobičajene probleme pri raspoređivanju agenata

---

## 🤖 Što čini agenta različitim od chatbota?

| Značajka | Chatbot | AI agent |
|---------|---------|----------|
| **Ponašanje** | Odgovara na upite | Poduzima autonomne radnje |
| **Alati** | Nema | Može pozivati API-je, pretraživati, izvršavati kod |
| **Memorija** | Samo zasnovana na sesiji | Postojana memorija između sesija |
| **Planiranje** | Jedan odgovor | Višestupanjsko zaključivanje |
| **Suradnja** | Pojedinačni entitet | Može raditi s drugim agentima |

### Jednostavna analogija

- **Chatbot** = Pomoćna osoba koja odgovara na pitanja na informativnom pultu
- **AI agent** = Osobni asistent koji može obavljati pozive, rezervirati termine i izvršavati zadatke umjesto vas

---

## 🚀 Brzi početak: Rasporedite svog prvog agenta

### Opcija 1: Predložak Foundry agenata (preporučeno)

```bash
# Inicijalizirajte predložak AI agenata
azd init --template get-started-with-ai-agents

# Rasporedite na Azure
azd up
```

**Što se raspoređuje:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (za RAG)
- ✅ Azure Container Apps (web sučelje)
- ✅ Application Insights (nadzor)

**Vrijeme:** ~15-20 minuta
**Trošak:** ~$100-150/mjesec (razvoj)

### Opcija 2: OpenAI agent s Prompty

```bash
# Inicijalizirajte predložak agenta temeljenog na Prompty
azd init --template agent-openai-python-prompty

# Rasporedi na Azure
azd up
```

**Što se raspoređuje:**
- ✅ Azure Functions (serverless izvršavanje agenata)
- ✅ Azure OpenAI
- ✅ Prompty konfiguracijske datoteke
- ✅ Primjer implementacije agenta

**Vrijeme:** ~10-15 minuta
**Trošak:** ~$50-100/mjesec (razvoj)

### Opcija 3: RAG chat agent

```bash
# Inicijaliziraj RAG predložak razgovora
azd init --template azure-search-openai-demo

# Rasporedi na Azure
azd up
```

**Što se raspoređuje:**
- ✅ Azure OpenAI
- ✅ Azure AI Search s primjerom podataka
- ✅ Pipeline za obradu dokumenata
- ✅ Chat sučelje s citatima

**Vrijeme:** ~15-25 minuta
**Trošak:** ~$80-150/mjesec (razvoj)

---

## 🏗️ Obrasci arhitekture agenata

### Obrazac 1: Jedan agent s alatima

Najjednostavniji obrazac agenata – jedan agent koji može koristiti više alata.

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

**Najbolje za:**
- Botove za korisničku podršku
- Pomoćnike za istraživanje
- Agente za analizu podataka

**AZD predložak:** `azure-search-openai-demo`

### Obrazac 2: RAG agent (Retrieval-Augmented Generation)

Agent koji dohvaća relevantne dokumente prije generiranja odgovora.

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

**Najbolje za:**
- Poslovne baze znanja
- Sustave za pitanja i odgovore nad dokumentima
- Istraživanje u području usklađenosti i pravnih pitanja

**AZD predložak:** `azure-search-openai-demo`

### Obrazac 3: Sustav s više agenata

Više specijaliziranih agenata koji surađuju na složenim zadacima.

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

**Najbolje za:**
- Složenu generaciju sadržaja
- Višestupanjske tokove rada
- Zadatke koji zahtijevaju različite stručnosti

**Saznajte više:** [Koordinacijski obrasci za više agenata](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Konfiguriranje alata agenata

Agenti postaju moćni kad mogu koristiti alate. Evo kako konfigurirati uobičajene alate:

### Konfiguracija alata u Foundry Agentima

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Definirajte prilagođene alate
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

# Kreirajte agenta s alatima
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Konfiguracija okruženja

```bash
# Postavite varijable okruženja specifične za agenta
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Razmjestite s ažuriranom konfiguracijom
azd deploy
```

---

## 📊 Nadgledanje agenata

### Integracija s Application Insights

Svi AZD predlošci agenata uključuju Application Insights za nadgledanje:

```bash
# Otvori nadzornu ploču za praćenje
azd monitor --overview

# Prikaži zapise u stvarnom vremenu
azd monitor --logs

# Prikaži metrike u stvarnom vremenu
azd monitor --live
```

### Ključne metrike za praćenje

| Metrika | Opis | Cilj |
|--------|-------------|--------|
| Kašnjenje odgovora | Vrijeme za generiranje odgovora | < 5 sekundi |
| Korištenje tokena | Tokeni po zahtjevu | Pratiti zbog troškova |
| Uspješnost poziva alata | % uspješnih izvršenja alata | > 95% |
| Stopa pogrešaka | Neuspjeli zahtjevi agenta | < 1% |
| Zadovoljstvo korisnika | Ocjene povratnih informacija | > 4.0/5.0 |

### Prilagođeno bilježenje za agente

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

## 💰 Troškovi

### Procijenjeni mjesečni troškovi po obrascu

| Obrazac | Razvojno okruženje | Produkcija |
|---------|-----------------|------------|
| Jedan agent | $50-100 | $200-500 |
| RAG agent | $80-150 | $300-800 |
| Više agenata (2-3 agenta) | $150-300 | $500-1,500 |
| Enterprise više agenata | $300-500 | $1,500-5,000+ |

### Savjeti za optimizaciju troškova

1. **Koristite GPT-4o-mini za jednostavne zadatke**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Implementirajte cache za ponovljene upite**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Postavite ograničenja tokena**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Ograniči duljinu odgovora
   )
   ```

4. **Skalirajte na nulu kada se ne koristi**
   ```bash
   # Container Apps se automatski skaliraju na nulu.
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Rješavanje problema s agentima

### Uobičajeni problemi i rješenja

<details>
<summary><strong>❌ Agent ne odgovara na pozive alata</strong></summary>

```bash
# Provjerite jesu li alati ispravno registrirani
azd show

# Provjerite implementaciju OpenAI-a
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Provjerite zapisnike agenta
azd monitor --logs
```

**Uobičajeni uzroci:**
- Neusklađenost potpisa funkcije alata
- Nedostaju potrebne dozvole
- API krajnja točka nije dostupna
</details>

<details>
<summary><strong>❌ Visoka latencija u odgovorima agenta</strong></summary>

```bash
# Provjerite Application Insights zbog uskih grla
azd monitor --live

# Razmislite o korištenju bržeg modela
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Savjeti za optimizaciju:**
- Koristite streaming odgovore
- Implementirajte keširanje odgovora
- Smanjite veličinu kontekstnog prozora
</details>

<details>
<summary><strong>❌ Agent vraća netočne ili halucinirane informacije</strong></summary>

```python
# Poboljšati pomoću boljih sistemskih uputa
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Dodati dohvaćanje za utemeljenje
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Utemeljiti odgovore u dokumentima
)
```
</details>

<details>
<summary><strong>❌ Pogreške zbog prekoračenja ograničenja tokena</strong></summary>

```python
# Implementiraj upravljanje kontekstnim prozorom
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Gruba procjena
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Praktične vježbe

### Vježba 1: Rasporedite osnovnog agenta (20 minuta)

**Cilj:** Rasporediti svog prvog AI agenta koristeći AZD

```bash
# Korak 1: Inicijalizirajte predložak
azd init --template get-started-with-ai-agents

# Korak 2: Prijavite se u Azure
azd auth login

# Korak 3: Rasporedite
azd up

# Korak 4: Testirajte agenta
# Otvorite URL prikazan u izlazu

# Korak 5: Očistite
azd down --force --purge
```

**Kriteriji uspjeha:**
- [ ] Agent odgovara na pitanja
- [ ] Može pristupiti nadzornoj ploči
- [ ] Resursi su uspješno očišćeni

### Vježba 2: Dodajte prilagođeni alat (30 minuta)

**Cilj:** Proširiti agenta prilagođenim alatom

1. Rasporedite predložak agenta
2. Stvorite novu funkciju alata:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # API poziv servisu za vremensku prognozu
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Registrirajte alat s agentom
4. Testirajte da agent koristi novi alat

**Kriteriji uspjeha:**
- [ ] Agent prepoznaje upite vezane uz vremensku prognozu
- [ ] Alat se poziva ispravno
- [ ] Odgovor uključuje informacije o vremenu

### Vježba 3: Izgradite RAG agenta (45 minuta)

**Cilj:** Stvoriti agenta koji odgovara na pitanja iz vaših dokumenata

```bash
# Postavite RAG predložak
azd init --template azure-search-openai-demo
azd up

# Prenesite svoje dokumente
# (Slijedite vodič predloška za unos podataka)

# Testirajte s pitanjima specifičnim za domenu
```

**Kriteriji uspjeha:**
- [ ] Agent odgovara na temelju učitanih dokumenata
- [ ] Odgovori uključuju citate
- [ ] Nema halucinacija na pitanjima izvan opsega

---

## 📚 Sljedeći koraci

Sada kad razumijete AI agente, istražite ove napredne teme:

| Tema | Opis | Poveznica |
|-------|-------------|------|
| **Sustavi s više agenata** | Izgradite sustave s više surađujućih agenata | [Primjer maloprodajnog sustava s više agenata](../../examples/retail-scenario.md) |
| **Koordinacijski obrasci** | Naučite obrasce orkestracije i komunikacije | [Koordinacijski obrasci](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Raspoređivanje u produkciju** | Raspoređivanje agenata spremno za poduzeća | [Prakse za AI u produkciji](production-ai-practices.md) |
| **Evaluacija agenata** | Testirajte i ocijenite performanse agenata | [Rješavanje problema s AI](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Dodatni resursi

### Službena dokumentacija
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD predlošci za agente
- [Počnite s AI agentima](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Resursi zajednice
- [Awesome AZD - predlošci agenata](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigacija**
- **Prethodna lekcija**: [Implementacija AI modela](ai-model-deployment.md)
- **Sljedeća lekcija**: [Prakse za AI u produkciji](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje odgovornosti**:
Ovaj dokument je preveden korištenjem AI prevoditeljske usluge [Co-op Translator](https://github.com/Azure/co-op-translator). Iako se trudimo postići točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalan prijevod od strane ljudskog prevoditelja. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->