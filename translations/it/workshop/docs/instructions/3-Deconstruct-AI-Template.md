# 3. Deconstruct a Template

!!! tip "AL TERMINE DI QUESTO MODULO SARAI IN GRADO DI"

    - [ ] Attivare GitHub Copilot con i server MCP per l'assistenza su Azure
    - [ ] Comprendere la struttura delle cartelle del template AZD e i componenti
    - [ ] Esplorare i modelli organizzativi dell'infrastruttura come codice (Bicep)
    - [ ] **Lab 3:** Utilizzare GitHub Copilot per esplorare e comprendere l'architettura del repository 

---


Con i template AZD e l'Azure Developer CLI (`azd`) possiamo avviare rapidamente il nostro percorso di sviluppo AI con repository standardizzati che forniscono codice di esempio, infrastruttura e file di configurazione - sotto forma di un progetto _starter_ pronto per il deploy.

**Ma ora, dobbiamo comprendere la struttura del progetto e la codebase - e saper personalizzare il template AZD - senza alcuna esperienza o conoscenza pregressa di AZD!**

---

## 1. Activate GitHub Copilot

### 1.1 Install GitHub Copilot Chat

È il momento di esplorare [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Ora possiamo usare il linguaggio naturale per descrivere il nostro compito a livello alto e ottenere assistenza nell'esecuzione. Per questo laboratorio, utilizzeremo il [Copilot Free plan](https://github.com/github-copilot/signup) che ha un limite mensile per completion e interazioni in chat.

L'estensione può essere installata dal marketplace, ed è spesso già disponibile in Codespaces o negli ambienti con dev container. _Clicca su `Open Chat` dal menu a discesa dell'icona di Copilot - e digita un prompt come `What can you do?`_ - potresti essere invitato ad effettuare il login. **GitHub Copilot Chat è pronto**.

### 1.2. Install MCP Servers

Per rendere efficace la modalità Agent, questa necessita dell'accesso agli strumenti corretti per aiutarla a recuperare conoscenza o eseguire azioni. È qui che i server MCP possono aiutare. Configureremo i seguenti server:

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

??? warning "Potresti ricevere un errore che `npx` non è installato (clicca per espandere la soluzione)"

      Per risolvere, apri il file `.devcontainer/devcontainer.json` e aggiungi questa riga alla sezione features. Poi ricostruisci il container. Ora dovresti avere `npx` installato.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```


---

### 1.3. Test GitHub Copilot Chat

**Per prima cosa usa `azd auth login` per autenticarti con Azure dalla command line di VS Code. Usa anche `az login` solo se prevedi di eseguire comandi dell'Azure CLI direttamente.**

Ora dovresti essere in grado di interrogare lo stato della tua sottoscrizione Azure e fare domande sulle risorse distribuite o sulla configurazione. Prova questi prompt:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Puoi anche porre domande sulla documentazione Azure e ottenere risposte ancorate al server Microsoft Docs MCP. Prova questi prompt:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Oppure puoi richiedere snippet di codice per completare un'attività. Prova questo prompt.

1. `Give me a Python code example that uses AAD for an interactive chat client`

In modalità `Ask`, questo fornirà codice che puoi copiare-incollare e provare. In modalità `Agent`, questo potrebbe andare oltre e creare le risorse rilevanti per te - includendo script di setup e documentazione - per aiutarti a eseguire quel compito.

**Ora sei pronto per iniziare a esplorare il repository del template**

---

## 2. Deconstruct Architecture

??? prompt "CHIEDI: Spiega l'architettura dell'applicazione in docs/images/architecture.png in 1 paragrafo"

      Questa applicazione è un'applicazione di chat potenziata dall'AI costruita su Azure che dimostra un'architettura moderna basata su agenti. La soluzione ruota attorno a un Azure Container App che ospita il codice principale dell'applicazione, il quale elabora l'input dell'utente e genera risposte intelligenti tramite un agente AI. 
      
      L'architettura sfrutta Microsoft Foundry Project come base per le capacità AI, collegandosi ai servizi Azure AI che forniscono i modelli linguistici sottostanti (come gpt-4.1-mini) e la funzionalità di agent. Le interazioni degli utenti fluiscono tramite un frontend basato su React verso un backend FastAPI che comunica con il servizio agente AI per generare risposte contestuali. 
      
      Il sistema integra capacità di recupero della conoscenza tramite ricerca nei file o il servizio Azure AI Search, consentendo all'agente di accedere e citare informazioni da documenti caricati. Per l'eccellenza operativa, l'architettura include un monitoraggio completo tramite Application Insights e Log Analytics Workspace per tracing, logging e ottimizzazione delle prestazioni. 
      
      Azure Storage fornisce lo storage di tipo blob per i dati dell'applicazione e gli upload di file, mentre Managed Identity garantisce accessi sicuri tra le risorse Azure senza memorizzare credenziali. L'intera soluzione è progettata per scalabilità e manutenibilità, con l'applicazione containerizzata che scala automaticamente in base alla domanda offrendo al contempo sicurezza, monitoraggio e capacità CI/CD tramite l'ecosistema di servizi gestiti di Azure.

![Architettura](../../../../../translated_images/it/architecture.48d94861e6e6cdc0.webp)

---

## 3. Repository Structure

!!! prompt "CHIEDI: Spiega la struttura delle cartelle del template. Inizia con un diagramma gerarchico visivo."

??? info "RISPOSTA: Diagramma gerarchico visivo"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Configurazione per Azure Developer CLI
      │   ├── docker-compose.yaml           # Contenitori per sviluppo locale
      │   ├── pyproject.toml                # Configurazione del progetto Python
      │   ├── requirements-dev.txt          # Dipendenze di sviluppo
      │   └── .devcontainer/                # Configurazione del dev container per VS Code
      │
      ├── 🏗️ Infrastruttura (infra/)
      │   ├── main.bicep                    # Template infrastruttura principale
      │   ├── api.bicep                     # Risorse specifiche per l'API
      │   ├── main.parameters.json          # Parametri per l'infrastruttura
      │   └── core/                         # Componenti infrastrutturali modulari
      │       ├── ai/                       # Configurazioni dei servizi AI
      │       ├── host/                     # Infrastruttura di hosting
      │       ├── monitor/                  # Monitoraggio e logging
      │       ├── search/                   # Configurazione di Azure AI Search
      │       ├── security/                 # Sicurezza e identità
      │       └── storage/                  # Configurazioni dell'account di storage
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # API backend
      │   │   ├── main.py                   # Punto di ingresso dell'applicazione FastAPI
      │   │   ├── routes.py                 # Definizioni delle route API
      │   │   ├── search_index_manager.py   # Funzionalità di ricerca
      │   │   ├── data/                     # Gestione dei dati dell'API
      │   │   ├── static/                   # Risorse web statiche
      │   │   └── templates/                # Template HTML
      │   ├── frontend/                     # Frontend React/TypeScript
      │   │   ├── package.json              # Dipendenze Node.js
      │   │   ├── vite.config.ts            # Configurazione di build di Vite
      │   │   └── src/                      # Codice sorgente frontend
      │   ├── data/                         # File di dati di esempio
      │   │   └── embeddings.csv            # Embedding pre-calcolati
      │   ├── files/                        # File della knowledge base
      │   │   ├── customer_info_*.json      # Esempi di dati cliente
      │   │   └── product_info_*.md         # Documentazione prodotto
      │   ├── Dockerfile                    # Configurazione del container
      │   └── requirements.txt              # Dipendenze Python
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Configurazione post-distribuzione
      │   ├── setup_credential.sh/.ps1     # Configurazione delle credenziali
      │   ├── validate_env_vars.sh/.ps1    # Validazione delle variabili d'ambiente
      │   └── resolve_model_quota.sh/.ps1  # Gestione delle quote dei modelli
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # Test unitari e di integrazione
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Framework di valutazione degli agenti
      │   │   ├── evaluate.py               # Runner di valutazione
      │   │   ├── eval-queries.json         # Query di test
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Area di sviluppo
      │   │   ├── 1-quickstart.py           # Esempi per iniziare
      │   │   └── aad-interactive-chat.py   # Esempi di autenticazione
      │   └── airedteaming/                 # Valutazione della sicurezza AI
      │       └── ai_redteaming.py          # Test red team
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # Guida al deployment
      │   ├── local_development.md          # Istruzioni per l'ambiente locale
      │   ├── troubleshooting.md            # Problemi comuni e soluzioni
      │   ├── azure_account_setup.md        # Prerequisiti Azure
      │   └── images/                       # Risorse per la documentazione
      │
      └── 📄 Project Metadata
         ├── README.md                     # Panoramica del progetto
         ├── CODE_OF_CONDUCT.md           # Linee guida della community
         ├── CONTRIBUTING.md              # Guida alle contribuzioni
         ├── LICENSE                      # Termini di licenza
         └── next-steps.md                # Indicazioni post-distribuzione
      ```

### 3.1. Core App Architecture

This template follows a **full-stack web application** pattern with:

- **Backend**: Python FastAPI with Azure AI integration
- **Frontend**: TypeScript/React with Vite build system
- **Infrastructure**: Azure Bicep templates for cloud resources
- **Containerization**: Docker for consistent deployment

### 3.2 Infra As Code (bicep)

The infrastructure layer uses **Azure Bicep** templates organized modularly:

   - **`main.bicep`**: Orchestrates all Azure resources
   - **`core/` modules**: Reusable components for different services
      - AI services (Microsoft Foundry Models, AI Search)
      - Container hosting (Azure Container Apps)
      - Monitoring (Application Insights, Log Analytics)
      - Security (Key Vault, Managed Identity)

### 3.3 Application Source (`src/`)

**Backend API (`src/api/`)**:

- FastAPI-based REST API
- Foundry Agents integration
- Search index management for knowledge retrieval
- File upload and processing capabilities

**Frontend (`src/frontend/`)**:

- Modern React/TypeScript SPA
- Vite for fast development and optimized builds
- Chat interface for agent interactions

**Knowledge Base (`src/files/`)**:

- Sample customer and product data
- Demonstrates file-based knowledge retrieval
- JSON and Markdown format examples


### 3.4 DevOps & Automation

**Scripts (`scripts/`)**:

- Cross-platform PowerShell and Bash scripts
- Environment validation and setup
- Post-deployment configuration
- Model quota management

**Azure Developer CLI Integration**:

- `azure.yaml` configuration for `azd` workflows
- Automated provisioning and deployment
- Environment variable management

### 3.5 Testing & Quality Assurance

**Evaluation Framework (`evals/`)**:

- Agent performance evaluation
- Query-response quality testing
- Automated assessment pipeline

**AI Safety (`airedteaming/`)**:

- Red team testing for AI safety
- Security vulnerability scanning
- Responsible AI practices

---

## 4. Congratulations 🏆

Hai utilizzato con successo GitHub Copilot Chat con i server MCP per esplorare il repository.

- [X] Hai attivato GitHub Copilot per Azure
- [X] Hai compreso l'architettura dell'applicazione
- [X] Hai esplorato la struttura del template AZD

Questo ti dà un'idea degli asset _infrastructure as code_ per questo template. Successivamente, esamineremo il file di configurazione per AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Esclusione di responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali fraintendimenti o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->