# Agenți AI cu Azure Developer CLI

**Navigare capitole:**
- **📚 Pagina cursului**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 2 - Dezvoltare axată pe AI
- **⬅️ Anterior**: [Implementarea modelului AI](ai-model-deployment.md)
- **➡️ Următor**: [Practici AI pentru producție](production-ai-practices.md)
- **🚀 Avansat**: [Soluții Multi-Agent](../../examples/retail-scenario.md)

---

## Introducere

Agenții AI sunt programe autonome care pot percepe mediul înconjurător, pot lua decizii și pot întreprinde acțiuni pentru a atinge obiective specifice. Spre deosebire de chatboții simpli care răspund la solicitări, agenții pot:

- **Folosesc instrumente** - Apelează API-uri, caută în baze de date, execută cod
- **Planifică și raționează** - Împarte sarcini complexe în pași
- **Învață din context** - Menține memorie și își adaptează comportamentul
- **Colaborează** - Lucrează cu alți agenți (sisteme multi-agent)

Acest ghid vă arată cum să implementați agenți AI în Azure folosind Azure Developer CLI (azd).

## Obiective de învățare

La finalizarea acestui ghid, veți:
- Înțelege ce sunt agenții AI și cum se diferențiază de chatboți
- Implementa șabloane de agenți preconstruiți folosind AZD
- Configura Foundry Agents pentru agenți personalizați
- Implementa modele de bază pentru agenți (folosirea instrumentelor, RAG, multi-agent)
- Monitoriza și depana agenții implementați

## Rezultate ale învățării

După finalizare, veți putea:
- Implementa aplicații cu agenți AI în Azure cu o singură comandă
- Configura instrumentele și capacitățile agentului
- Implementa retrieval-augmented generation (RAG) cu agenți
- Proiecta arhitecturi multi-agent pentru fluxuri de lucru complexe
- Depana probleme comune la implementarea agenților

---

## 🤖 Ce diferențiază un agent de un chatbot?

| Caracteristică | Chatbot | Agent AI |
|---------|---------|----------|
| **Comportament** | Răspunde la solicitări | Întreprinde acțiuni autonome |
| **Instrumente** | Niciunul | Poate apela API-uri, căuta, executa cod |
| **Memorie** | Doar pe durata sesiunii | Memorie persistentă între sesiuni |
| **Planificare** | Un singur răspuns | Raționament în mai mulți pași |
| **Colaborare** | Entitate unică | Poate lucra cu alți agenți |

### Analogie simplă

- **Chatbot** = O persoană serviabilă care răspunde la întrebări la un ghișeu de informații
- **Agent AI** = Un asistent personal care poate efectua apeluri, rezerva întâlniri și îndeplini sarcini pentru tine

---

## 🚀 Pornire rapidă: Implementați primul agent

### Opțiunea 1: Șablon Foundry Agents (Recomandat)

```bash
# Inițializează șablonul agenților AI
azd init --template get-started-with-ai-agents

# Desfășoară în Azure
azd up
```

**Ce se implementează:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (pentru RAG)
- ✅ Azure Container Apps (interfață web)
- ✅ Application Insights (monitorizare)

**Timp:** ~15-20 minute
**Cost:** ~$100-150/lună (dezvoltare)

### Opțiunea 2: Agent OpenAI cu Prompty

```bash
# Inițializați șablonul agentului bazat pe Prompty
azd init --template agent-openai-python-prompty

# Implementați în Azure
azd up
```

**Ce se implementează:**
- ✅ Azure Functions (execuție fără server a agentului)
- ✅ Azure OpenAI
- ✅ fișiere de configurare Prompty
- ✅ implementare exemplu a agentului

**Timp:** ~10-15 minute
**Cost:** ~$50-100/lună (dezvoltare)

### Opțiunea 3: Agent Chat RAG

```bash
# Inițializează șablonul de chat RAG
azd init --template azure-search-openai-demo

# Implementează în Azure
azd up
```

**Ce se implementează:**
- ✅ Azure OpenAI
- ✅ Azure AI Search cu date exemplu
- ✅ pipeline de procesare a documentelor
- ✅ interfață de chat cu citări

**Timp:** ~15-25 minute
**Cost:** ~$80-150/lună (dezvoltare)

---

## 🏗️ Modele de arhitectură pentru agenți

### Modelul 1: Agent unic cu instrumente

Cel mai simplu model de agent - un agent care poate folosi multe instrumente.

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

**Cel mai potrivit pentru:**
- Boți de suport pentru clienți
- Asistenți de cercetare
- Agenți pentru analiza datelor

**Șablon AZD:** `azure-search-openai-demo`

### Modelul 2: Agent RAG (Retrieval-Augmented Generation)

Un agent care recuperează documente relevante înainte de a genera răspunsuri.

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

**Cel mai potrivit pentru:**
- Baze de cunoștințe enterprise
- Sisteme Q&A pe documente
- Cercetare în domeniul conformității și juridic

**Șablon AZD:** `azure-search-openai-demo`

### Modelul 3: Sistem multi-agent

Mai mulți agenți specializați care lucrează împreună la sarcini complexe.

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

**Cel mai potrivit pentru:**
- Generare de conținut complex
- Fluxuri de lucru în mai mulți pași
- Sarcini care necesită expertiză diferită

**Află mai multe:** [Pattern-uri de coordonare multi-agent](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Configurarea instrumentelor agentului

Agenții devin puternici când pot folosi instrumente. Iată cum să configurați instrumentele comune:

### Configurarea instrumentelor în Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Definiți instrumente personalizate
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

# Creați un agent cu instrumente
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Configurarea mediului

```bash
# Configurează variabilele de mediu specifice agentului
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Desfășoară cu configurația actualizată
azd deploy
```

---

## 📊 Monitorizarea agenților

### Integrarea Application Insights

Toate șabloanele AZD pentru agenți includ Application Insights pentru monitorizare:

```bash
# Deschide tabloul de bord de monitorizare
azd monitor --overview

# Vizualizează jurnalele în timp real
azd monitor --logs

# Vizualizează indicatorii în timp real
azd monitor --live
```

### Indicatori cheie de urmărit

| Metrica | Descriere | Țintă |
|--------|-------------|--------|
| Latența răspunsului | Timp pentru generarea răspunsului | < 5 secunde |
| Utilizare tokeni | Tokeni per solicitare | Monitorizați costul |
| Rata de succes a apelurilor către instrumente | % din execuții ale instrumentelor reușite | > 95% |
| Rata erorilor | Solicitări eșuate ale agentului | < 1% |
| Satisfacția utilizatorului | Scoruri de feedback | > 4.0/5.0 |

### Jurnalizare personalizată pentru agenți

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

## 💰 Considerații privind costurile

### Costuri lunare estimate pe model

| Model | Mediu de dezvoltare | Producție |
|---------|-----------------|------------|
| Agent unic | $50-100 | $200-500 |
| Agent RAG | $80-150 | $300-800 |
| Multi-Agent (2-3 agenți) | $150-300 | $500-1,500 |
| Multi-Agent pentru întreprinderi | $300-500 | $1,500-5,000+ |

### Sfaturi pentru optimizarea costurilor

1. **Folosiți GPT-4o-mini pentru sarcini simple**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Implementați caching pentru interogări repetate**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Setați limite pentru tokeni**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Limitează lungimea răspunsului
   )
   ```

4. **Scalați la zero când nu este utilizat**
   ```bash
   # Container Apps se pot scala automat până la zero
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Depanarea agenților

### Probleme comune și soluții

<details>
<summary><strong>❌ Agentul nu răspunde la apelurile către instrumente</strong></summary>

```bash
# Verifică dacă instrumentele sunt înregistrate corect
azd show

# Verifică implementarea OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Verifică jurnalele agentului
azd monitor --logs
```

**Cauze comune:**
- Potrivire greșită a semnăturii funcției instrumentului
- Lipsa permisiunilor necesare
- Endpoint API inaccesibil
</details>

<details>
<summary><strong>❌ Latență ridicată în răspunsurile agentului</strong></summary>

```bash
# Verifică Application Insights pentru blocaje
azd monitor --live

# Ia în considerare utilizarea unui model mai rapid
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Sfaturi de optimizare:**
- Folosiți răspunsuri în streaming
- Implementați caching pentru răspunsuri
- Reduceți dimensiunea ferestrei de context
</details>

<details>
<summary><strong>❌ Agentul returnează informații incorecte sau halucinante</strong></summary>

```python
# Îmbunătățiți prin prompturi de sistem mai bune
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Adăugați recuperare pentru fundamentare
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Bazați răspunsurile pe documente
)
```
</details>

<details>
<summary><strong>❌ Erori de depășire a limitei de tokeni</strong></summary>

```python
# Implementați gestionarea ferestrei de context
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Estimare aproximativă
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Exerciții practice

### Exercițiul 1: Implementați un agent de bază (20 minute)

**Scop:** Implementați primul dumneavoastră agent AI folosind AZD

```bash
# Pasul 1: Inițializați șablonul
azd init --template get-started-with-ai-agents

# Pasul 2: Conectați-vă la Azure
azd auth login

# Pasul 3: Implementați
azd up

# Pasul 4: Testați agentul
# Deschideți URL-ul afișat în ieșire

# Pasul 5: Curățați resursele
azd down --force --purge
```

**Criterii de succes:**
- [ ] Agentul răspunde la întrebări
- [ ] Poate accesa panoul de monitorizare
- [ ] Resursele eliminate cu succes

### Exercițiul 2: Adăugați un instrument personalizat (30 minute)

**Scop:** Extindeți un agent cu un instrument personalizat

1. Implementați șablonul agentului
2. Creați o nouă funcție pentru instrument:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Apel API către serviciul meteo
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Înregistrați instrumentul cu agentul
4. Testați că agentul folosește noul instrument

**Criterii de succes:**
- [ ] Agentul recunoaște întrebări legate de vreme
- [ ] Instrumentul este apelat corect
- [ ] Răspunsul include informații meteo

### Exercițiul 3: Construiți un agent RAG (45 minute)

**Scop:** Creați un agent care răspunde la întrebări din documentele dvs.

```bash
# Implementați șablonul RAG
azd init --template azure-search-openai-demo
azd up

# Încărcați documentele dvs.
# (Urmați ghidul șablonului pentru ingestia datelor)

# Testați cu întrebări specifice domeniului
```

**Criterii de succes:**
- [ ] Agentul răspunde din documentele încărcate
- [ ] Răspunsurile includ citări
- [ ] Fără halucinații la întrebări în afara domeniului

---

## 📚 Pașii următori

Acum că ați înțeles agenții AI, explorați aceste subiecte avansate:

| Subiect | Descriere | Link |
|-------|-------------|------|
| **Sisteme multi-agent** | Construiți sisteme cu mai mulți agenți care colaborează | [Exemplu multi-agent pentru retail](../../examples/retail-scenario.md) |
| **Pattern-uri de coordonare** | Învățați modele de orchestrare și comunicare | [Pattern-uri de coordonare](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Deploy în producție** | Implementarea agenților pregătită pentru mediul enterprise | [Practici AI pentru producție](production-ai-practices.md) |
| **Evaluarea agenților** | Testați și evaluați performanța agentului | [Depanare AI](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Resurse suplimentare

### Documentație oficială
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### Șabloane AZD pentru agenți
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Resurse din comunitate
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigare**
- **Lecția anterioară**: [Implementarea modelului AI](ai-model-deployment.md)
- **Lecția următoare**: [Practici AI pentru producție](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Declinare de responsabilitate:
Acest document a fost tradus folosind serviciul de traducere AI Co-op Translator (https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa nativă, trebuie considerat sursa autoritară. Pentru informații critice, se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări greșite care rezultă din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->