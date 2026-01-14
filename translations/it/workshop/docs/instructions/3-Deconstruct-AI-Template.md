<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4e403f041411361140d6beb88ab2a181",
  "translation_date": "2025-09-24T14:58:44+00:00",
  "source_file": "workshop/docs/instructions/3-Deconstruct-AI-Template.md",
  "language_code": "it"
}
-->
# 3. Decomporre un Template

!!! tip "ALLA FINE DI QUESTO MODULO SARAI IN GRADO DI"

    - [ ] Elemento
    - [ ] Elemento
    - [ ] Elemento
    - [ ] **Laboratorio 3:** 

---

Con i template di AZD e l'Azure Developer CLI (`azd`), possiamo avviare rapidamente il nostro percorso di sviluppo AI con repository standardizzati che forniscono codice di esempio, file di infrastruttura e configurazione - sotto forma di un progetto _starter_ pronto per il deployment.

**Ma ora dobbiamo comprendere la struttura del progetto e il codice - e saper personalizzare il template AZD - senza alcuna esperienza o conoscenza preliminare di AZD!**

---

## 1. Attivare GitHub Copilot

### 1.1 Installare GitHub Copilot Chat

È il momento di esplorare [GitHub Copilot con Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Ora possiamo utilizzare il linguaggio naturale per descrivere il nostro compito a un livello alto e ottenere assistenza nell'esecuzione. Per questo laboratorio, utilizzeremo il [piano gratuito di Copilot](https://github.com/github-copilot/signup), che ha un limite mensile per completamenti e interazioni in chat.

L'estensione può essere installata dal marketplace, ma dovrebbe essere già disponibile nel tuo ambiente Codespaces. _Clicca su `Open Chat` dal menu a tendina dell'icona di Copilot - e digita un prompt come `What can you do?`_ - potresti essere invitato ad accedere. **GitHub Copilot Chat è pronto**.

### 1.2. Installare i Server MCP

Per rendere efficace la modalità Agent, è necessario avere accesso agli strumenti giusti per aiutarlo a recuperare conoscenze o eseguire azioni. Qui entrano in gioco i server MCP. Configureremo i seguenti server:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Per attivarli:

1. Crea un file chiamato `.vscode/mcp.json` se non esiste
1. Copia il seguente contenuto in quel file - e avvia i server!
   ```json title=".vscode/mcp.json"
   {
      "servers": {
         "Azure MCP Server": {
            "command": "npx",
            "args": [
            "-y",
            "@azure/mcp@latest",
            "server",
            "start"
            ]
         },
         "microsoft.docs.mcp": {
            "type": "http",
            "url": "https://learn.microsoft.com/api/mcp"
         }
      }
   }
   ```

??? warning "Potresti ricevere un errore che `npx` non è installato (clicca per espandere e vedere la soluzione)"

      Per risolvere, apri il file `.devcontainer/devcontainer.json` e aggiungi questa riga alla sezione delle funzionalità. Poi ricostruisci il container. Ora dovresti avere `npx` installato.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Testare GitHub Copilot Chat

**Per prima cosa usa `az login` per autenticarti con Azure dalla riga di comando di VS Code.**

Ora dovresti essere in grado di interrogare lo stato della tua sottoscrizione Azure e fare domande sulle risorse o configurazioni distribuite. Prova questi prompt:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Puoi anche fare domande sulla documentazione di Azure e ottenere risposte basate sul server Microsoft Docs MCP. Prova questi prompt:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Oppure puoi chiedere frammenti di codice per completare un'attività. Prova questo prompt:

1. `Give me a Python code example that uses AAD for an interactive chat client`

In modalità `Ask`, questo fornirà codice che puoi copiare e incollare per provarlo. In modalità `Agent`, potrebbe fare un passo ulteriore e creare le risorse rilevanti per te - inclusi script di configurazione e documentazione - per aiutarti a eseguire quell'attività.

**Ora sei pronto per iniziare a esplorare il repository del template**

---

## 2. Decomporre l'Architettura

??? prompt "CHIEDI: Spiega l'architettura dell'applicazione in docs/images/architecture.png in 1 paragrafo"

      Questa applicazione è un'applicazione di chat basata su AI costruita su Azure che dimostra un'architettura moderna basata su agenti. La soluzione ruota attorno a un'Azure Container App che ospita il codice principale dell'applicazione, il quale elabora l'input dell'utente e genera risposte intelligenti tramite un agente AI. 
      
      L'architettura sfrutta il progetto Azure AI Foundry come base per le capacità AI, collegandosi ai servizi Azure AI che forniscono i modelli linguistici sottostanti (come GPT-4o-mini) e la funzionalità dell'agente. Le interazioni degli utenti fluiscono attraverso un frontend basato su React verso un backend FastAPI che comunica con il servizio agente AI per generare risposte contestuali. 
      
      Il sistema incorpora capacità di recupero delle conoscenze tramite ricerca di file o il servizio Azure AI Search, consentendo all'agente di accedere e citare informazioni da documenti caricati. Per l'eccellenza operativa, l'architettura include un monitoraggio completo tramite Application Insights e Log Analytics Workspace per il tracciamento, il logging e l'ottimizzazione delle prestazioni. 
      
      Azure Storage fornisce archiviazione blob per i dati dell'applicazione e i file caricati, mentre Managed Identity garantisce un accesso sicuro tra le risorse Azure senza memorizzare credenziali. L'intera soluzione è progettata per scalabilità e manutenibilità, con l'applicazione containerizzata che si scala automaticamente in base alla domanda, fornendo al contempo sicurezza, monitoraggio e capacità CI/CD integrate tramite l'ecosistema di servizi gestiti di Azure.

![Architecture](../../../../../translated_images/architecture.48d94861e6e6cdc0.it.png)

---

## 3. Struttura del Repository

!!! prompt "CHIEDI: Spiega la struttura delle cartelle del template. Inizia con un diagramma gerarchico visivo."

??? info "RISPOSTA: Diagramma Gerarchico Visivo"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configurazione e Setup
      │   ├── azure.yaml                    # Configurazione Azure Developer CLI
      │   ├── docker-compose.yaml           # Container di sviluppo locale
      │   ├── pyproject.toml                # Configurazione progetto Python
      │   ├── requirements-dev.txt          # Dipendenze di sviluppo
      │   └── .devcontainer/                # Setup container di sviluppo VS Code
      │
      ├── 🏗️ Infrastruttura (infra/)
      │   ├── main.bicep                    # Template principale infrastruttura
      │   ├── api.bicep                     # Risorse specifiche per l'API
      │   ├── main.parameters.json          # Parametri infrastruttura
      │   └── core/                         # Componenti modulari infrastruttura
      │       ├── ai/                       # Configurazioni servizi AI
      │       ├── host/                     # Infrastruttura di hosting
      │       ├── monitor/                  # Monitoraggio e logging
      │       ├── search/                   # Setup Azure AI Search
      │       ├── security/                 # Sicurezza e identità
      │       └── storage/                  # Configurazioni account di archiviazione
      │
      ├── 💻 Sorgente Applicazione (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Entry point applicazione FastAPI
      │   │   ├── routes.py                 # Definizioni delle rotte API
      │   │   ├── search_index_manager.py   # Funzionalità di ricerca
      │   │   ├── data/                     # Gestione dati API
      │   │   ├── static/                   # Asset web statici
      │   │   └── templates/                # Template HTML
      │   ├── frontend/                     # Frontend React/TypeScript
      │   │   ├── package.json              # Dipendenze Node.js
      │   │   ├── vite.config.ts            # Configurazione build Vite
      │   │   └── src/                      # Codice sorgente frontend
      │   ├── data/                         # File di esempio dati
      │   │   └── embeddings.csv            # Embedding pre-calcolati
      │   ├── files/                        # File base di conoscenza
      │   │   ├── customer_info_*.json      # Esempi dati clienti
      │   │   └── product_info_*.md         # Documentazione prodotti
      │   ├── Dockerfile                    # Configurazione container
      │   └── requirements.txt              # Dipendenze Python
      │
      ├── 🔧 Automazione e Script (scripts/)
      │   ├── postdeploy.sh/.ps1           # Setup post-deployment
      │   ├── setup_credential.sh/.ps1     # Configurazione credenziali
      │   ├── validate_env_vars.sh/.ps1    # Validazione ambiente
      │   └── resolve_model_quota.sh/.ps1  # Gestione quota modelli
      │
      ├── 🧪 Test e Valutazione
      │   ├── tests/                        # Test unitari e di integrazione
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Framework di valutazione agenti
      │   │   ├── evaluate.py               # Runner valutazione
      │   │   ├── eval-queries.json         # Query di test
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Area di sviluppo
      │   │   ├── 1-quickstart.py           # Esempi introduttivi
      │   │   └── aad-interactive-chat.py   # Esempi di autenticazione
      │   └── airedteaming/                 # Valutazione sicurezza AI
      │       └── ai_redteaming.py          # Test red team
      │
      ├── 📚 Documentazione (docs/)
      │   ├── deployment.md                 # Guida al deployment
      │   ├── local_development.md          # Istruzioni per setup locale
      │   ├── troubleshooting.md            # Problemi comuni e soluzioni
      │   ├── azure_account_setup.md        # Prerequisiti Azure
      │   └── images/                       # Asset documentazione
      │
      └── 📄 Metadata Progetto
         ├── README.md                     # Panoramica progetto
         ├── CODE_OF_CONDUCT.md           # Linee guida comunitarie
         ├── CONTRIBUTING.md              # Guida al contributo
         ├── LICENSE                      # Termini di licenza
         └── next-steps.md                # Guida post-deployment
      ```

### 3.1. Architettura Core dell'App

Questo template segue un pattern di **applicazione web full-stack** con:

- **Backend**: Python FastAPI con integrazione Azure AI
- **Frontend**: TypeScript/React con sistema di build Vite
- **Infrastruttura**: Template Azure Bicep per risorse cloud
- **Containerizzazione**: Docker per deployment coerente

### 3.2 Infrastruttura come Codice (bicep)

Il layer infrastrutturale utilizza template **Azure Bicep** organizzati in modo modulare:

   - **`main.bicep`**: Orchestration di tutte le risorse Azure
   - **Moduli `core/`**: Componenti riutilizzabili per diversi servizi
      - Servizi AI (Azure OpenAI, AI Search)
      - Hosting container (Azure Container Apps)
      - Monitoraggio (Application Insights, Log Analytics)
      - Sicurezza (Key Vault, Managed Identity)

### 3.3 Sorgente Applicazione (`src/`)

**Backend API (`src/api/`)**:

- API REST basata su FastAPI
- Integrazione con il servizio agente Azure AI
- Gestione degli indici di ricerca per il recupero delle conoscenze
- Capacità di caricamento e elaborazione file

**Frontend (`src/frontend/`)**:

- SPA moderna con React/TypeScript
- Vite per sviluppo rapido e build ottimizzate
- Interfaccia di chat per interazioni con l'agente

**Base di Conoscenza (`src/files/`)**:

- Esempi di dati cliente e prodotto
- Dimostrazione di recupero conoscenze basato su file
- Esempi in formato JSON e Markdown

### 3.4 DevOps e Automazione

**Script (`scripts/`)**:

- Script cross-platform in PowerShell e Bash
- Validazione e setup dell'ambiente
- Configurazione post-deployment
- Gestione delle quote dei modelli

**Integrazione Azure Developer CLI**:

- Configurazione `azure.yaml` per workflow `azd`
- Provisioning e deployment automatizzati
- Gestione delle variabili d'ambiente

### 3.5 Test e Assicurazione Qualità

**Framework di Valutazione (`evals/`)**:

- Valutazione delle performance dell'agente
- Test di qualità query-risposta
- Pipeline di valutazione automatizzata

**Sicurezza AI (`airedteaming/`)**:

- Test red team per sicurezza AI
- Scansione vulnerabilità
- Pratiche di AI responsabile

---

## 4. Congratulazioni 🏆

Hai utilizzato con successo GitHub Copilot Chat con i server MCP per esplorare il repository.

- [X] Attivato GitHub Copilot per Azure
- [X] Compreso l'Architettura dell'Applicazione
- [X] Esplorato la struttura del template AZD

Questo ti dà un'idea degli asset di _infrastruttura come codice_ per questo template. Nel prossimo modulo, esamineremo il file di configurazione per AZD.

---

