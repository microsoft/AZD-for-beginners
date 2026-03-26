# 3. Deconstruct a Template

!!! tip "AL TERMINE DI QUESTO MODULO SARAI IN GRADO DI"

    - [ ] Attivare GitHub Copilot con i server MCP per assistenza su Azure
    - [ ] Comprendere la struttura delle cartelle e i componenti del template AZD
    - [ ] Esplorare i modelli di organizzazione dell'infrastructure-as-code (Bicep)
    - [ ] **Lab 3:** Usare GitHub Copilot per esplorare e comprendere l'architettura del repository 

---


Con i template AZD e l'Azure Developer CLI (`azd`) possiamo avviare rapidamente il nostro percorso di sviluppo AI con repository standardizzati che forniscono codice di esempio, infrastruttura e file di configurazione - sotto forma di un progetto _starter_ pronto per il deploy.

**Ma ora, dobbiamo comprendere la struttura del progetto e il codebase - e essere in grado di personalizzare il template AZD - senza alcuna esperienza o conoscenza pregressa di AZD!**

---

## 1. Activate GitHub Copilot

### 1.1 Install GitHub Copilot Chat

È il momento di esplorare [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Ora, possiamo usare il linguaggio naturale per descrivere il nostro compito ad alto livello e ottenere assistenza nell'esecuzione. Per questo laboratorio, useremo il [piano Copilot Free](https://github.com/github-copilot/signup) che ha un limite mensile per completamenti e interazioni in chat.

L'estensione può essere installata dal marketplace, ma dovrebbe essere già disponibile nel tuo ambiente Codespaces. _Clicca su `Open Chat` dal menu a discesa dell'icona Copilot - e digita un prompt come `What can you do?`_ - potrebbe esserti richiesto di effettuare il login. **GitHub Copilot Chat è pronto**.

### 1.2. Install MCP Servers

Perché la modalità Agent sia efficace, ha bisogno di accesso agli strumenti giusti per aiutarlo a recuperare conoscenze o eseguire azioni. Qui entrano in gioco i server MCP. Configureremo i seguenti server:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Per attivarli:

1. Crea un file chiamato `.vscode/mcp.json` se non esiste
1. Copia quanto segue in quel file - e avvia i server!
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

??? warning "Potresti ricevere un errore che `npx` non è installato (clicca per espandere la correzione)"

      Per risolvere, apri il file `.devcontainer/devcontainer.json` e aggiungi questa riga alla sezione features. Poi ricostruisci il contenitore. Dovresti ora avere `npx` installato.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Test GitHub Copilot Chat

**Usa prima `az login` per autenticarti con Azure dalla riga di comando di VS Code.**

Dovresti ora essere in grado di interrogare lo stato della tua sottoscrizione Azure e porre domande sulle risorse o configurazioni distribuite. Prova questi prompt:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Puoi anche porre domande sulla documentazione Azure e ottenere risposte basate sul server Microsoft Docs MCP. Prova questi prompt:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Oppure puoi chiedere snippet di codice per completare un'attività. Prova questo prompt.

1. `Give me a Python code example that uses AAD for an interactive chat client`

In modalità `Ask`, questo fornirà codice che puoi copiare-incollare e provare. In modalità `Agent`, questo potrebbe andare oltre e creare le risorse rilevanti per te - inclusi script di configurazione e documentazione - per aiutarti a eseguire quel compito.

**Ora sei pronto per iniziare ad esplorare il repository del template**

---

## 2. Deconstruct Architecture

??? prompt "CHIEDI: Spiega l'architettura dell'applicazione in docs/images/architecture.png in 1 paragrafo"

      Questa applicazione è una chat potenziata dall'AI costruita su Azure che dimostra un'architettura moderna basata su agenti. La soluzione ruota attorno a un Azure Container App che ospita il codice principale dell'applicazione, il quale elabora l'input dell'utente e genera risposte intelligenti tramite un agente AI.
      
      L'architettura sfrutta Microsoft Foundry Project come base per le capacità AI, collegandosi ai servizi Azure AI che forniscono i modelli di linguaggio sottostanti (come gpt-4.1-mini) e le funzionalità di agent. Le interazioni degli utenti fluiscono tramite un frontend basato su React verso un backend FastAPI che comunica con il servizio agente AI per generare risposte contestuali.
      
      Il sistema incorpora capacità di recupero della conoscenza tramite ricerca di file o il servizio Azure AI Search, permettendo all'agente di accedere e citare informazioni da documenti caricati. Per l'eccellenza operativa, l'architettura include un monitoraggio completo tramite Application Insights e Log Analytics Workspace per tracing, logging e ottimizzazione delle prestazioni.
      
      Azure Storage fornisce lo storage blob per i dati dell'applicazione e i file caricati, mentre Managed Identity garantisce accesso sicuro tra le risorse Azure senza memorizzare credenziali. L'intera soluzione è progettata per scalabilità e manutenibilità, con l'applicazione containerizzata che scala automaticamente in base alla domanda offrendo sicurezza integrata, monitoraggio e funzionalità CI/CD tramite l'ecosistema di servizi gestiti di Azure.

![Architettura](../../../../../translated_images/it/architecture.48d94861e6e6cdc0.webp)

---

## 3. Repository Structure

!!! prompt "CHIEDI: Spiega la struttura delle cartelle del template. Inizia con un diagramma gerarchico visivo."

??? info "RISPOSTA: Diagramma gerarchico visivo"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Configurazione Azure Developer CLI
      │   ├── docker-compose.yaml           # Contenitori per sviluppo locale
      │   ├── pyproject.toml                # Configurazione progetto Python
      │   ├── requirements-dev.txt          # Dipendenze di sviluppo
      │   └── .devcontainer/                # Configurazione dev container per VS Code
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # Template infrastrutturale principale
      │   ├── api.bicep                     # Risorse specifiche per l'API
      │   ├── main.parameters.json          # Parametri per l'infrastruttura
      │   └── core/                         # Componenti infrastrutturali modulari
      │       ├── ai/                       # Configurazioni dei servizi AI
      │       ├── host/                     # Infrastruttura di hosting
      │       ├── monitor/                  # Monitoraggio e logging
      │       ├── search/                   # Configurazione Azure AI Search
      │       ├── security/                 # Sicurezza e identità
      │       └── storage/                  # Configurazioni account di storage
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Entry dell'applicazione FastAPI
      │   │   ├── routes.py                 # Definizioni delle rotte API
      │   │   ├── search_index_manager.py   # Funzionalità di ricerca
      │   │   ├── data/                     # Gestione dati per l'API
      │   │   ├── static/                   # Asset web statici
      │   │   └── templates/                # Template HTML
      │   ├── frontend/                     # Frontend React/TypeScript
      │   │   ├── package.json              # Dipendenze Node.js
      │   │   ├── vite.config.ts            # Configurazione build Vite
      │   │   └── src/                      # Codice sorgente frontend
      │   ├── data/                         # File di dati di esempio
      │   │   └── embeddings.csv            # Embeddings pre-calcolati
      │   ├── files/                        # File della knowledge base
      │   │   ├── customer_info_*.json      # Campioni di dati cliente
      │   │   └── product_info_*.md         # Documentazione prodotto
      │   ├── Dockerfile                    # Configurazione container
      │   └── requirements.txt              # Dipendenze Python
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Configurazione post-deploy
      │   ├── setup_credential.sh/.ps1     # Configurazione credenziali
      │   ├── validate_env_vars.sh/.ps1    # Validazione variabili d'ambiente
      │   └── resolve_model_quota.sh/.ps1  # Gestione quote modelli
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # Test unitari e di integrazione
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Framework di valutazione agent
      │   │   ├── evaluate.py               # Runner di valutazione
      │   │   ├── eval-queries.json         # Query di test
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Playground di sviluppo
      │   │   ├── 1-quickstart.py           # Esempi per iniziare
      │   │   └── aad-interactive-chat.py   # Esempi di autenticazione
      │   └── airedteaming/                 # Valutazione di sicurezza AI
      │       └── ai_redteaming.py          # Test red team
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # Guida al deploy
      │   ├── local_development.md          # Istruzioni per setup locale
      │   ├── troubleshooting.md            # Problemi comuni e soluzioni
      │   ├── azure_account_setup.md        # Prerequisiti Azure
      │   └── images/                       # Asset di documentazione
      │
      └── 📄 Project Metadata
         ├── README.md                     # Panoramica del progetto
         ├── CODE_OF_CONDUCT.md           # Linee guida della community
         ├── CONTRIBUTING.md              # Guida al contributo
         ├── LICENSE                      # Termini di licenza
         └── next-steps.md                # Indicazioni post-deploy
      ```

### 3.1. Core App Architecture

Questo template segue un pattern di **applicazione web full-stack** con:

- **Backend**: Python FastAPI con integrazione Azure AI
- **Frontend**: TypeScript/React con sistema di build Vite
- **Infrastructure**: Template Azure Bicep per le risorse cloud
- **Containerization**: Docker per deployment coerenti

### 3.2 Infra As Code (bicep)

Il livello infrastrutturale utilizza template **Azure Bicep** organizzati in modo modulare:

   - **`main.bicep`**: Orchestration di tutte le risorse Azure
   - **moduli `core/`**: Componenti riutilizzabili per diversi servizi
      - Servizi AI (Microsoft Foundry Models, AI Search)
      - Hosting container (Azure Container Apps)
      - Monitoraggio (Application Insights, Log Analytics)
      - Sicurezza (Key Vault, Managed Identity)

### 3.3 Application Source (`src/`)

**Backend API (`src/api/`)**:

- REST API basata su FastAPI
- Integrazione con Foundry Agents
- Gestione dell'indice di ricerca per il recupero della conoscenza
- Funzionalità di upload e processamento file

**Frontend (`src/frontend/`)**:

- SPA moderna React/TypeScript
- Vite per sviluppo rapido e build ottimizzate
- Interfaccia di chat per le interazioni con gli agent

**Knowledge Base (`src/files/`)**:

- Campioni di dati cliente e prodotto
- Dimostrazione del recupero della conoscenza via file
- Esempi in formato JSON e Markdown


### 3.4 DevOps & Automation

**Scripts (`scripts/`)**:

- Script PowerShell e Bash multipiattaforma
- Validazione e setup dell'ambiente
- Configurazione post-deploy
- Gestione delle quote dei modelli

**Integrazione Azure Developer CLI**:

- Configurazione `azure.yaml` per i workflow `azd`
- Provisioning e deployment automatizzati
- Gestione delle variabili d'ambiente

### 3.5 Testing & Quality Assurance

**Evaluation Framework (`evals/`)**:

- Valutazione delle prestazioni degli agent
- Test di qualità delle risposte alle query
- Pipeline di valutazione automatizzata

**AI Safety (`airedteaming/`)**:

- Test red team per la sicurezza AI
- Scansione delle vulnerabilità di sicurezza
- Pratiche di AI responsabile

---

## 4. Congratulations 🏆

Hai utilizzato con successo GitHub Copilot Chat con i server MCP per esplorare il repository.

- [X] Hai attivato GitHub Copilot per Azure
- [X] Hai compreso l'architettura dell'applicazione
- [X] Hai esplorato la struttura del template AZD

Questo ti dà una visione degli asset di _infrastructure as code_ per questo template. Successivamente, esamineremo il file di configurazione per AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Esclusione di responsabilità**:
Questo documento è stato tradotto mediante il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci a garantire l'accuratezza, si prega di tenere presente che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche si raccomanda una traduzione professionale eseguita da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->