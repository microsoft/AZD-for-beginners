# Agenti AI con Azure Developer CLI

**Navigazione del Capitolo:**
- **📚 Home del Corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo Corrente**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Precedente**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Successivo**: [Production AI Practices](production-ai-practices.md)
- **🚀 Avanzato**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## Introduzione

Gli agenti AI sono programmi autonomi che possono percepire il loro ambiente, prendere decisioni e intraprendere azioni per raggiungere obiettivi specifici. Diversamente dai semplici chatbot che rispondono a prompt, gli agenti possono:

- **Usare strumenti** - Chiamare API, cercare nei database, eseguire codice
- **Pianificare e ragionare** - Suddividere compiti complessi in passaggi
- **Imparare dal contesto** - Mantenere memoria e adattare il comportamento
- **Collaborare** - Lavorare con altri agenti (sistemi multi-agente)

Questa guida mostra come distribuire agenti AI su Azure usando Azure Developer CLI (azd).

## Obiettivi di apprendimento

Completando questa guida, tu:
- Capirai cosa sono gli agenti AI e come differiscono dai chatbot
- Distribuirai template di agenti pre-costruiti usando AZD
- Configurerai Foundry Agents per agenti personalizzati
- Implementerai pattern di base per agenti (uso strumenti, RAG, multi-agente)
- Monitorerai e eseguirai il debug degli agenti distribuiti

## Risultati di apprendimento

Al termine, sarai in grado di:
- Distribuire applicazioni di agenti AI su Azure con un unico comando
- Configurare strumenti e capacità degli agenti
- Implementare retrieval-augmented generation (RAG) con agenti
- Progettare architetture multi-agente per flussi di lavoro complessi
- Risolvere i problemi comuni di distribuzione degli agenti

---

## 🤖 Cosa rende un agente diverso da un chatbot?

| Feature | Chatbot | AI Agent |
|---------|---------|----------|
| **Behavior** | Risponde a prompt | Esegue azioni autonome |
| **Tools** | Nessuno | Può chiamare API, cercare, eseguire codice |
| **Memory** | Solo basata sulla sessione | Memoria persistente tra le sessioni |
| **Planning** | Risposta singola | Ragionamento in più passaggi |
| **Collaboration** | Entità singola | Può lavorare con altri agenti |

### Semplice analogia

- **Chatbot** = Una persona disponibile che risponde a domande al banco informazioni
- **Agente AI** = Un assistente personale che può fare chiamate, prenotare appuntamenti e completare compiti per te

---

## 🚀 Avvio rapido: distribuisci il tuo primo agente

### Opzione 1: Template Foundry Agents (Consigliato)

```bash
# Inizializza il modello degli agenti IA
azd init --template get-started-with-ai-agents

# Distribuisci su Azure
azd up
```

**Cosa viene distribuito:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (per RAG)
- ✅ Azure Container Apps (interfaccia web)
- ✅ Application Insights (monitoraggio)

**Tempo:** ~15-20 minuti
**Costo:** ~$100-150/mese (sviluppo)

### Opzione 2: Agente OpenAI con Prompty

```bash
# Inizializza il template dell'agente basato su Prompty
azd init --template agent-openai-python-prompty

# Distribuisci su Azure
azd up
```

**Cosa viene distribuito:**
- ✅ Azure Functions (esecuzione serverless dell'agente)
- ✅ Azure OpenAI
- ✅ File di configurazione Prompty
- ✅ Implementazione di esempio dell'agente

**Tempo:** ~10-15 minuti
**Costo:** ~$50-100/mese (sviluppo)

### Opzione 3: Agente Chat RAG

```bash
# Inizializza il modello di chat RAG
azd init --template azure-search-openai-demo

# Distribuisci su Azure
azd up
```

**Cosa viene distribuito:**
- ✅ Azure OpenAI
- ✅ Azure AI Search con dati di esempio
- ✅ Pipeline di elaborazione documenti
- ✅ Interfaccia di chat con citazioni

**Tempo:** ~15-25 minuti
**Costo:** ~$80-150/mese (sviluppo)

---

## 🏗️ Pattern architetturali per agenti

### Pattern 1: Agente singolo con strumenti

Il pattern di agente più semplice - un agente che può usare più strumenti.

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

**Ideale per:**
- Bot di supporto clienti
- Assistenti per la ricerca
- Agenti per analisi dei dati

**AZD Template:** `azure-search-openai-demo`

### Pattern 2: Agente RAG (Retrieval-Augmented Generation)

Un agente che recupera documenti rilevanti prima di generare risposte.

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

**Ideale per:**
- Basi di conoscenza aziendali
- Sistemi di Q&A su documenti
- Ricerca normativa e legale

**AZD Template:** `azure-search-openai-demo`

### Pattern 3: Sistema Multi-Agente

Più agenti specializzati che lavorano insieme su compiti complessi.

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

**Ideale per:**
- Generazione di contenuti complessi
- Flussi di lavoro multi-step
- Attività che richiedono competenze diverse

**Per saperne di più:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Configurazione degli strumenti per agenti

Gli agenti diventano potenti quando possono usare strumenti. Ecco come configurare strumenti comuni:

### Configurazione degli strumenti in Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Definire strumenti personalizzati
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

# Creare l'agente con gli strumenti
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Configurazione dell'ambiente

```bash
# Imposta le variabili d'ambiente specifiche dell'agente
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Distribuisci con la configurazione aggiornata
azd deploy
```

---

## 📊 Monitoraggio degli agenti

### Integrazione Application Insights

Tutti i template AZD per agenti includono Application Insights per il monitoraggio:

```bash
# Apri la dashboard di monitoraggio
azd monitor --overview

# Visualizza i log in tempo reale
azd monitor --logs

# Visualizza le metriche in tempo reale
azd monitor --live
```

### Metriche chiave da monitorare

| Metric | Descrizione | Obiettivo |
|--------|-------------|----------|
| Latenza di risposta | Tempo per generare la risposta | < 5 secondi |
| Utilizzo token | Token per richiesta | Monitorare per i costi |
| Tasso di successo chiamate strumenti | % di esecuzioni riuscite degli strumenti | > 95% |
| Tasso di errore | Richieste agente fallite | < 1% |
| Soddisfazione utente | Punteggi di feedback | > 4.0/5.0 |

### Logging personalizzato per agenti

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

## 💰 Considerazioni sui costi

### Costi mensili stimati per pattern

| Pattern | Ambiente di sviluppo | Produzione |
|---------|----------------------|------------|
| Agente singolo | $50-100 | $200-500 |
| Agente RAG | $80-150 | $300-800 |
| Multi-Agente (2-3 agenti) | $150-300 | $500-1,500 |
| Multi-Agente enterprise | $300-500 | $1,500-5,000+ |

### Consigli per l'ottimizzazione dei costi

1. **Usa GPT-4o-mini per attività semplici**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Implementa caching per query ripetute**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Imposta limiti di token**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Limita la lunghezza della risposta
   )
   ```

4. **Ridimensiona a zero quando non in uso**
   ```bash
   # Container Apps si ridimensionano automaticamente a zero
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Risoluzione dei problemi degli agenti

### Problemi comuni e soluzioni

<details>
<summary><strong>❌ L'agente non risponde alle chiamate degli strumenti</strong></summary>

```bash
# Verifica se gli strumenti sono registrati correttamente
azd show

# Verifica il deployment di OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Verifica i log dell'agente
azd monitor --logs
```

**Cause comuni:**
- Firma della funzione dello strumento non corrispondente
- Permessi richiesti mancanti
- Endpoint API non accessibile
</details>

<details>
<summary><strong>❌ Elevata latenza nelle risposte dell'agente</strong></summary>

```bash
# Controlla Application Insights per colli di bottiglia
azd monitor --live

# Considera l'uso di un modello più veloce
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Suggerimenti di ottimizzazione:**
- Usa risposte in streaming
- Implementa caching delle risposte
- Riduci la finestra di contesto
</details>

<details>
<summary><strong>❌ L'agente restituisce informazioni errate o allucinate</strong></summary>

```python
# Migliorare con prompt di sistema migliori
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Aggiungere il recupero delle informazioni per l'ancoraggio
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Basare le risposte sui documenti
)
```
</details>

<details>
<summary><strong>❌ Errori per superamento del limite di token</strong></summary>

```python
# Implementare la gestione della finestra di contesto
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Stima approssimativa
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Esercizi pratici

### Esercizio 1: Distribuisci un agente di base (20 minuti)

**Obiettivo:** Distribuire il tuo primo agente AI usando AZD

```bash
# Passo 1: Inizializza il modello
azd init --template get-started-with-ai-agents

# Passo 2: Accedi ad Azure
azd auth login

# Passo 3: Distribuisci
azd up

# Passo 4: Testa l'agente
# Apri l'URL mostrato nell'output

# Passo 5: Pulisci
azd down --force --purge
```

**Criteri di successo:**
- [ ] L'agente risponde alle domande
- [ ] È possibile accedere alla dashboard di monitoraggio
- [ ] Le risorse sono state eliminate correttamente

### Esercizio 2: Aggiungi uno strumento personalizzato (30 minuti)

**Obiettivo:** Estendere un agente con uno strumento personalizzato

1. Distribuisci il template dell'agente
2. Crea una nuova funzione strumento:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Chiamata API al servizio meteo
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Registra lo strumento con l'agente
4. Verifica che l'agente utilizzi il nuovo strumento

**Criteri di successo:**
- [ ] L'agente riconosce query relative al meteo
- [ ] Lo strumento viene chiamato correttamente
- [ ] La risposta include informazioni sul meteo

### Esercizio 3: Costruisci un agente RAG (45 minuti)

**Obiettivo:** Creare un agente che risponda alle domande dai tuoi documenti

```bash
# Distribuisci il template RAG
azd init --template azure-search-openai-demo
azd up

# Carica i tuoi documenti
# (Segui la guida del template per l'ingestione dei dati)

# Testa con domande specifiche del dominio
```

**Criteri di successo:**
- [ ] L'agente risponde usando i documenti caricati
- [ ] Le risposte includono citazioni
- [ ] Nessuna allucinazione su domande fuori ambito

---

## 📚 Prossimi passi

Ora che hai compreso gli agenti AI, esplora questi argomenti avanzati:

| Argomento | Descrizione | Link |
|-------|-------------|------|
| **Sistemi Multi-Agente** | Costruisci sistemi con più agenti che collaborano | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Pattern di coordinamento** | Impara schemi di orchestrazione e comunicazione | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Distribuzione in produzione** | Distribuzione agenti pronta per l'azienda | [Production AI Practices](production-ai-practices.md) |
| **Valutazione degli agenti** | Testa e valuta le prestazioni degli agenti | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Risorse aggiuntive

### Documentazione ufficiale
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### Template AZD per agenti
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Risorse della community
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigazione**
- **Lezione precedente**: [AI Model Deployment](ai-model-deployment.md)
- **Lezione successiva**: [Production AI Practices](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Dichiarazione di non responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua originale dovrebbe essere considerato la fonte autorevole. Per informazioni critiche è raccomandata una traduzione professionale effettuata da un traduttore umano. Non ci assumiamo responsabilità per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->