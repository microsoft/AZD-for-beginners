# Registro delle modifiche - AZD For Beginners

## Introduzione

Questo registro delle modifiche documenta tutte le modifiche, gli aggiornamenti e i miglioramenti rilevanti al repository AZD For Beginners. Seguiamo i principi del versionamento semantico e manteniamo questo registro per aiutare gli utenti a comprendere cosa è cambiato tra le versioni.

## Obiettivi di apprendimento

Rivedendo questo registro delle modifiche, potrai:
- Rimanere informato sulle nuove funzionalità e aggiunte di contenuto
- Comprendere i miglioramenti apportati alla documentazione esistente
- Tenere traccia delle correzioni di bug e degli adeguamenti per garantire accuratezza
- Seguire l'evoluzione dei materiali didattici nel tempo

## Risultati di apprendimento

Dopo aver esaminato le voci del registro delle modifiche, sarai in grado di:
- Identificare nuovi contenuti e risorse disponibili per l'apprendimento
- Comprendere quali sezioni sono state aggiornate o migliorate
- Pianificare il tuo percorso di apprendimento basandoti sui materiali più aggiornati
- Contribuire con feedback e suggerimenti per miglioramenti futuri

## Cronologia delle versioni

### [v3.19.1] - 2026-03-27

#### Chiarimenti per l'onboarding dei principianti, convalida dell'installazione e pulizia finale dei comandi AZD
**Questa versione segue la verifica di AZD 1.23 con una passata di documentazione focalizzata sui principianti: chiarisce le indicazioni di autenticazione incentrate su AZD, aggiunge script di convalida dell'installazione locali, verifica i comandi chiave contro l'AZD CLI live e rimuove le ultime reference obsolete ai comandi in lingua inglese al di fuori del changelog.**

#### Aggiunte
- **🧪 Script di convalida dell'ambiente per principianti** con `validate-setup.ps1` e `validate-setup.sh` in modo che gli apprendenti possano verificare gli strumenti richiesti prima di iniziare il Capitolo 1
- **✅ Passaggi preliminari di convalida dell'installazione** nel README radice e nel README del Capitolo 1 in modo che i prerequisiti mancanti vengano individuati prima di `azd up`

#### Modifiche
- **🔐 Guida all'autenticazione per principianti** ora considera coerentemente `azd auth login` come percorso primario per i flussi di lavoro AZD, con `az login` evidenziato come opzionale a meno che non si utilizzino direttamente comandi Azure CLI
- **📚 Flusso di onboarding del Capitolo 1** ora indica agli apprendenti di convalidare la configurazione locale prima dei passaggi di installazione, autenticazione e primo deployment
- **🛠️ Messaggi del validatore** ora separano chiaramente i requisiti bloccanti dagli avvisi opzionali di Azure CLI per il percorso per principianti esclusivamente AZD
- **📖 Documenti di configurazione, risoluzione dei problemi ed esempi** ora distinguono tra l'autenticazione AZD richiesta e l'accesso opzionale tramite Azure CLI dove in precedenza venivano presentati senza contesto

#### Correzioni
- **📋 Riferimenti ai comandi ancora in inglese** aggiornati alle forme AZD correnti, inclusi `azd config show` nel cheat sheet e `azd monitor --overview` dove era intesa la guida sull'overview del Portale Azure
- **🧭 Affermazioni per principianti nel Capitolo 1** attenuate per evitare promesse eccessive di comportamento senza errori garantiti o rollback su tutti i template e le risorse Azure
- **🔎 Validazione CLI live** confermata per il supporto corrente di `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, e `azd down --force --purge`

#### File aggiornati
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### Validazione AZD 1.23.12, espansione dell'ambiente workshop e aggiornamento dei modelli AI
**Questa versione esegue una verifica della documentazione rispetto a `azd` `1.23.12`, aggiorna esempi di comandi AZD obsoleti, aggiorna le indicazioni sui modelli AI ai valori predefiniti correnti e amplia le istruzioni del workshop oltre GitHub Codespaces per supportare anche dev container e clone locali.**

#### Aggiunte
- **✅ Note di convalida** in tutti i capitoli principali e nei documenti del workshop per rendere esplicita la baseline AZD testata per gli apprendenti che utilizzano build CLI più recenti o più datate
- **⏱️ Indicazioni sul timeout di deploy** per deployment di app AI di lunga durata usando `azd deploy --timeout 1800`
- **🔎 Passaggi per ispezione delle estensioni** con `azd extension show azure.ai.agents` nei documenti sul flusso di lavoro AI
- **🌐 Indicazioni ambientali più ampie per il workshop** che coprono GitHub Codespaces, dev container e clone locali con MkDocs

#### Modifiche
- **📚 README introduttivi dei capitoli** ora segnalano in modo coerente la convalida rispetto a `azd 1.23.12` nei capitoli foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting e production
- **🛠️ Riferimenti ai comandi AZD** aggiornati alle forme correnti nella documentazione:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` o `azd env get-value(s)` a seconda del contesto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` dove è intesa l'overview di Application Insights
- **🧪 Esempi di provision preview** semplificati all'uso attualmente supportato come `azd provision --preview` e `azd provision --preview -e production`
- **🧭 Flusso del workshop** aggiornato in modo che gli apprendenti possano completare i lab in Codespaces, in un dev container o in un clone locale invece di presumere l'esecuzione solo in Codespaces
- **🔐 Indicazioni di autenticazione** ora privilegiano `azd auth login` per i flussi di lavoro AZD, con `az login` posizionato come opzionale quando si utilizzano direttamente comandi Azure CLI

#### Correzioni
- **🪟 Comandi di installazione Windows** normalizzati alla maiuscola/minuscola corrente del pacchetto `winget` nella guida d'installazione
- **🐧 Guida d'installazione Linux** corretta per evitare istruzioni per gestori di pacchetti `azd` non supportate specifiche per distro e invece indirizzare agli asset di release quando appropriato
- **📦 Esempi di modelli AI** aggiornati dai vecchi valori predefiniti come `gpt-35-turbo` e `text-embedding-ada-002` a esempi correnti come `gpt-4.1-mini`, `gpt-4.1` e `text-embedding-3-large`
- **📋 Snippet di deployment e diagnostica** corretti per usare comandi di ambiente e di stato correnti nei log, negli script e nei passaggi di troubleshooting
- **⚙️ Indicazioni per GitHub Actions** aggiornate da `Azure/setup-azd@v1.0.0` a `Azure/setup-azd@v2`
- **🤖 Indicazioni MCP/Copilot per il consenso** aggiornate da `azd mcp consent` a `azd copilot consent list`

#### Migliorato
- **🧠 Capitolo AI**: le indicazioni spiegano meglio il comportamento preview-sensitive di `azd ai`, il login specifico del tenant, l'uso corrente delle estensioni e le raccomandazioni aggiornate per il deployment dei modelli
- **🧪 Istruzioni del workshop** ora utilizzano esempi di versione più realistici e un linguaggio di configurazione dell'ambiente più chiaro per i lab pratici
- **📈 Documenti di produzione e troubleshooting** ora si allineano meglio con esempi correnti su monitoraggio, fallback model e livelli di costo

#### File aggiornati
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### Comandi CLI AZD AI, convalida dei contenuti ed espansione dei template
**Questa versione aggiunge la copertura dei comandi `azd ai`, `azd extension` e `azd mcp` in tutti i capitoli relativi all'AI, corregge link interrotti e codice deprecato in agents.md, aggiorna il cheat sheet e ristruttura la sezione Example Templates con descrizioni validate e nuovi template Azure AI AZD.**

#### Aggiunte
- **🤖 Copertura CLI AZD AI** su 7 file (precedentemente solo nel Capitolo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nuova sezione "Extensions and AI Commands" che introduce `azd extension`, `azd ai agent init` e `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opzione 4: `azd ai agent init` con tabella di confronto (approccio template vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Sottosezioni "AZD Extensions for Foundry" e "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Avvio rapido ora mostra sia i percorsi di distribuzione basati su template sia quelli basati su manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — La sezione Deploy ora include l'opzione `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Sottosezione "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nuova sezione "AI & Extensions Commands" con `azd extension`, `azd ai agent init`, `azd mcp` e `azd infra generate`
- **📦 Nuovi template di esempio AZD AI** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — chat RAG .NET con Blazor WebAssembly, Semantic Kernel e supporto per chat vocale
  - **azure-search-openai-demo-java** — chat RAG Java che utilizza Langchain4J con opzioni di deployment ACA/AKS
  - **contoso-creative-writer** — app multi-agente per scrittura creativa che utilizza Azure AI Agent Service, Bing Grounding e Prompty
  - **serverless-chat-langchainjs** — RAG serverless che usa Azure Functions + LangChain.js + Cosmos DB con supporto per sviluppo locale con Ollama
  - **chat-with-your-data-solution-accelerator** — acceleratore RAG enterprise con portale amministrativo, integrazione Teams e opzioni PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — app di riferimento per orchestrazione multi-agente MCP con server in .NET, Python, Java e TypeScript
  - **azd-ai-starter** — template starter Bicep per infrastruttura Azure AI minimale
  - **🔗 Link alla galleria Awesome AZD AI** — Riferimento alla [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ template)

#### Correzioni
- **🔗 Navigazione in agents.md**: i link Previous/Next ora corrispondono all'ordine delle lezioni del README del Capitolo 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Link rotti in agents.md**: `production-ai-practices.md` corretto in `../chapter-08-production/production-ai-practices.md` (3 occorrenze)
- **📦 Codice deprecato in agents.md**: sostituito `opencensus` con `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API non valida in agents.md**: spostato `max_tokens` da `create_agent()` a `create_run()` come `max_completion_tokens`
- **🔢 Conteggio token in agents.md**: sostituita la stima approssimativa `len//4` con `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Servizi corretti da "Cognitive Search + App Service" a "Azure AI Search + Azure Container Apps" (host predefinito cambiato Oct 2024)
- **contoso-chat**: Descrizione aggiornata per fare riferimento a Azure AI Foundry + Prompty, in linea con il titolo reale del repository e lo stack tecnologico

#### Rimosso
- **ai-document-processing**: Rimosso il riferimento al template non funzionante (repo non accessibile pubblicamente come template AZD)

#### Migliorato
- **📝 agents.md exercises**: L'esercizio 1 ora mostra l'output previsto e il passaggio `azd monitor`; l'esercizio 2 include il codice completo di registrazione di `FunctionTool`; l'esercizio 3 sostituisce indicazioni vaghe con comandi concreti `prepdocs.py`
- **📚 agents.md resources**: Aggiornati i link alla documentazione con i documenti correnti di Azure AI Agent Service e quickstart
- **📋 agents.md Next Steps table**: Aggiunto il link AI Workshop Lab per la copertura completa del capitolo

#### Files Updated
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Course Navigation Enhancement
**Questa versione migliora la navigazione del README.md del corso con un formato di tabella potenziato.**

#### Changed
- **Course Map Table**: Arricchita con link diretti alle lezioni, stime di durata e valutazioni di complessità
- **Folder Cleanup**: Rimosse cartelle vecchie ridondanti (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Verificati tutti i 21+ link interni nella tabella Course Map

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**Questa versione aggiorna i riferimenti ai prodotti per il branding Microsoft corrente.**

#### Changed
- **Microsoft Foundry → Microsoft Foundry**: Tutti i riferimenti aggiornati nei file non relativi alle traduzioni
- **Azure AI Agent Service → Foundry Agents**: Nome del servizio aggiornato per riflettere il branding corrente

#### Files Updated
- `README.md` - Pagina principale del corso
- `changelog.md` - Cronologia delle versioni
- `course-outline.md` - Struttura del corso
- `docs/chapter-02-ai-development/agents.md` - Guida agli agenti AI
- `examples/README.md` - Documentazione degli esempi
- `workshop/README.md` - Pagina di atterraggio del workshop
- `workshop/docs/index.md` - Indice del workshop
- `workshop/docs/instructions/*.md` - Tutti i file di istruzioni del workshop

---

### [v3.15.0] - 2026-02-05

#### Major Repository Restructuring: Chapter-Based Folder Names
**Questa versione ristruttura la documentazione in cartelle dedicate per capitolo per una navigazione più chiara.**

#### Folder Renames
Le vecchie cartelle sono state sostituite con cartelle numerate per capitolo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Aggiunta nuova: `docs/chapter-05-multi-agent/`

#### File Migrations
| File | Da | A |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Added
- **📚 File README dei capitoli**: Creati README.md in ciascuna cartella di capitolo con:
  - Obiettivi di apprendimento e durata
  - Tabella delle lezioni con descrizioni
  - Comandi di avvio rapido
  - Navigazione verso gli altri capitoli

#### Changed
- **🔗 Aggiornati tutti i link interni**: Oltre 78 percorsi aggiornati in tutti i file di documentazione
- **🗺️ README principale**: Aggiornata la Course Map con la nuova struttura a capitoli
- **📝 examples/README.md**: Aggiornati i riferimenti incrociati alle cartelle dei capitoli

#### Removed
- Vecchia struttura di cartelle rimossa (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**Questa versione ha aggiunto file README di navigazione per capitoli (sostituiti da v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**Questa versione aggiunge una guida completa per il deploy di agenti AI con Azure Developer CLI.**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: Guida completa che copre:
  - Cosa sono gli agenti AI e come differiscono dai chatbot
  - Tre template quick-start per agenti (Foundry Agents, Prompty, RAG)
  - Pattern architetturali degli agenti (single agent, RAG, multi-agent)
  - Configurazione e personalizzazione degli strumenti
  - Monitoraggio e tracciamento delle metriche
  - Considerazioni sui costi e ottimizzazione
  - Scenari comuni di troubleshooting
  - Tre esercizi pratici con criteri di successo

#### Content Structure
- **Introduction**: Concetti sugli agenti per principianti
- **Quick Start**: Deploy di agenti con `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Diagrammi visivi dei pattern degli agenti
- **Configuration**: Impostazione degli strumenti e variabili d'ambiente
- **Monitoring**: Integrazione con Application Insights
- **Exercises**: Apprendimento pratico progressivo (20-45 minuti ciascuno)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**Questa versione aggiorna la configurazione del contenitore di sviluppo con strumenti moderni e impostazioni predefinite migliori per l'esperienza di apprendimento AZD.**

#### Changed
- **🐳 Immagine base**: Aggiornata da `python:3.12-bullseye` a `python:3.12-bookworm` (ultima Debian stabile)
- **📛 Nome del container**: Rinominato da "Python 3" a "AZD for Beginners" per chiarezza

#### Added
- **🔧 Nuove funzionalità Dev Container**:
  - `azure-cli` con supporto Bicep abilitato
  - `node:20` (versione LTS per i template AZD)
  - `github-cli` per la gestione dei template
  - `docker-in-docker` per i deployment di container app

- **🔌 Port Forwarding**: Porte preconfigurate per lo sviluppo comune:
  - 8000 (anteprima MkDocs)
  - 3000 (Web app)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nuove estensioni VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense Python migliorato
  - `ms-azuretools.vscode-azurefunctions` - Supporto Azure Functions
  - `ms-azuretools.vscode-docker` - Supporto Docker
  - `ms-azuretools.vscode-bicep` - Supporto linguaggio Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestione risorse Azure
  - `yzhang.markdown-all-in-one` - Editing Markdown
  - `DavidAnson.vscode-markdownlint` - Linting Markdown
  - `bierner.markdown-mermaid` - Supporto diagrammi Mermaid
  - `redhat.vscode-yaml` - Supporto YAML (per azure.yaml)
  - `eamodio.gitlens` - Visualizzazione Git
  - `mhutchie.git-graph` - Cronologia Git

- **⚙️ Impostazioni VS Code**: Aggiunte impostazioni predefinite per interprete Python, format on save e rimozione spazi bianchi

- **📦 Aggiornato requirements-dev.txt**:
  - Aggiunto plugin MkDocs minify
  - Aggiunto pre-commit per la qualità del codice
  - Aggiunti pacchetti Azure SDK (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: Ora verifica l'installazione di AZD e Azure CLI all'avvio del container

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**Questa versione migliora significativamente il README.md per essere più accessibile ai principianti e aggiunge risorse essenziali per sviluppatori AI.**

#### Added
- **🆚 Confronto Azure CLI vs AZD**: Spiegazione chiara su quando usare ciascuno strumento con esempi pratici
- **🌟 Link Awesome AZD**: Link diretti alla galleria di template della community e alle risorse per contribuire:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ template pronti al deploy
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Contribuisci con un template
- **🎯 Guida Quick Start**: Sezione semplificata in 3 passaggi per iniziare (Install → Login → Deploy)
- **📊 Tabella di navigazione basata sull'esperienza**: Indicazioni chiare su dove iniziare in base all'esperienza dello sviluppatore

#### Changed
- **Struttura README**: Riorganizzata per disclosure progressiva - informazioni chiave in cima
- **Sezione Introduction**: Riscritta per spiegare "La magia di `azd up`" per principianti assoluti
- **Rimosso contenuto duplicato**: Eliminata sezione di troubleshooting duplicata
- **Comandi di troubleshooting**: Corretto il riferimento a `azd logs` per usare il valido `azd monitor --logs`

#### Fixed
- **🔐 Comandi di autenticazione**: Aggiunti `azd auth login` e `azd auth logout` a cheat-sheet.md
- **Riferimenti a comandi non validi**: Rimosso il rimanente `azd logs` dalla sezione troubleshooting del README

#### Notes
- **Ambito**: Modifiche applicate al README principale e a resources/cheat-sheet.md
- **Pubblico target**: Migliorie mirate specificamente agli sviluppatori nuovi a AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**Questa versione corregge comandi AZD inesistenti nella documentazione, assicurando che tutti gli esempi di codice usino la sintassi valida di Azure Developer CLI.**

#### Fixed
- **🔧 Comandi AZD inesistenti rimossi**: Audit completo e correzione di comandi non validi:
  - `azd logs` (non esiste) → sostituito con `azd monitor --logs` o alternative Azure CLI
  - sottocomandi `azd service` (non esistono) → sostituiti con `azd show` e Azure CLI
  - `azd infra import/export/validate` (non esistono) → rimossi o sostituiti con alternative valide
  - flag `azd deploy --rollback/--incremental/--parallel/--detect-changes` (non esistono) → rimossi
  - flag `azd provision --what-if/--rollback` (non esistono) → aggiornati per usare `--preview`
  - `azd config validate` (non esiste) → sostituito con `azd config list`
  - `azd info`, `azd history`, `azd metrics` (non esistono) → rimossi

- **📚 File aggiornati con correzioni ai comandi**:
  - `resources/cheat-sheet.md`: Rifacimento importante del riferimento ai comandi
  - `docs/deployment/deployment-guide.md`: Corrette strategie di rollback e deployment
  - `docs/troubleshooting/debugging.md`: Corrette le sezioni di analisi log
  - `docs/troubleshooting/common-issues.md`: Aggiornati comandi di troubleshooting
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrette la sezione di debug AZD
  - `docs/getting-started/azd-basics.md`: Corrette i comandi di monitoraggio
  - `docs/getting-started/first-project.md`: Aggiornati esempi di monitoraggio e debug
  - `docs/getting-started/installation.md`: Corretti esempi di help e versioni
  - `docs/pre-deployment/application-insights.md`: Corretti i comandi per la visualizzazione dei log
  - `docs/pre-deployment/coordination-patterns.md`: Corrette i comandi di debug degli agenti

- **📝 Riferimento versione aggiornato**:
  - `docs/getting-started/installation.md`: Modificata la versione hardcoded `1.5.0` in generica `1.x.x` con link alle release

#### Changed
- **Strategie di rollback**: Documentazione aggiornata per usare rollback basati su Git (AZD non ha rollback nativo)
- **Visualizzazione dei log**: Sostituiti riferimenti a `azd logs` con `azd monitor --logs`, `azd monitor --live` e comandi Azure CLI
- **Sezione performance**: Rimosi flag di deployment parallel/incremental inesistenti e fornite alternative valide

#### Technical Details
- **Comandi AZD validi**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag validi di azd monitor**: `--live`, `--logs`, `--overview`
- **Funzionalità rimosse**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Note
- **Verifica**: Comandi convalidati contro Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Completamento del workshop e aggiornamento della qualità della documentazione
**Questa versione completa i moduli interattivi del workshop, corregge tutti i link della documentazione non funzionanti e migliora la qualità complessiva dei contenuti per gli sviluppatori AI che utilizzano Microsoft AZD.**

#### Aggiunto
- **📝 CONTRIBUTING.md**: Nuovo documento con le linee guida per i contributi che include:
  - Istruzioni chiare per la segnalazione di problemi e la proposta di modifiche
  - Standard di documentazione per nuovi contenuti
  - Linee guida sugli esempi di codice e convenzioni per i messaggi di commit
  - Informazioni sul coinvolgimento della community

#### Completato
- **🎯 Modulo del workshop 7 (Conclusione)**: Modulo di conclusione completamente completato con:
  - Riepilogo completo dei risultati del workshop
  - Sezione sui concetti chiave acquisiti che copre AZD, template e Microsoft Foundry
  - Raccomandazioni per il proseguimento del percorso di apprendimento
  - Esercizi di sfida del workshop con valutazione della difficoltà
  - Link per feedback e supporto della community

- **📚 Modulo del workshop 3 (Deconstruct)**: Obiettivi di apprendimento aggiornati con:
  - Guida all'attivazione di GitHub Copilot con i server MCP
  - Comprensione della struttura delle cartelle dei template AZD
  - Modelli di organizzazione Infrastructure-as-code (Bicep)
  - Istruzioni per i laboratori pratici

- **🔧 Modulo del workshop 6 (Smantellamento)**: Completato con:
  - Obiettivi per la pulizia delle risorse e la gestione dei costi
  - Uso di `azd down` per un deprovisioning sicuro dell'infrastruttura
  - Guida al recupero dei servizi cognitivi eliminati in modo soft
  - Promemoria di esplorazione extra per GitHub Copilot e il portale Azure

#### Correzioni
- **🔗 Correzione link rotti**: Risolti oltre 15 link interni della documentazione non funzionanti:
  - `docs/ai-foundry/ai-model-deployment.md`: Corrette le path verso microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrette le path di ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: Sostituito cicd-integration.md non esistente con deployment-guide.md
  - `examples/retail-scenario.md`: Corretti i percorsi della FAQ e della guida al troubleshooting
  - `examples/container-app/microservices/README.md`: Corrette le path della home del corso e della guida alla distribuzione
  - `resources/faq.md` e `resources/glossary.md`: Aggiornati i riferimenti al capitolo AI
  - `course-outline.md`: Corrette le referenze all'instructor guide e ai lab del workshop AI

- **📅 Banner stato del workshop**: Aggiornato da "Under Construction" a stato del workshop attivo con data febbraio 2026

- **🔗 Navigazione del workshop**: Corretti i link di navigazione rotti nel README.md del workshop che puntavano alla cartella lab-1-azd-basics inesistente

#### Modificato
- **Presentazione del workshop**: Rimosso l'avviso "under construction", il workshop è ora completo e pronto all'uso
- **Coerenza di navigazione**: Garantita la corretta navigazione tra i moduli del workshop
- **Riferimenti al percorso di apprendimento**: Aggiornati i cross-reference dei capitoli per usare i percorsi microsoft-foundry corretti

#### Convalidato
- ✅ Tutti i file markdown in inglese hanno link interni validi
- ✅ I moduli del workshop 0-7 sono completi con obiettivi di apprendimento
- ✅ La navigazione tra capitoli e moduli funziona correttamente
- ✅ I contenuti sono adatti agli sviluppatori AI che usano Microsoft AZD
- ✅ Linguaggio e struttura adatti ai principianti mantenuti
- ✅ CONTRIBUTING.md fornisce indicazioni chiare per i contributori della community

#### Implementazione tecnica
- **Validazione dei link**: Script PowerShell automatizzato ha verificato tutti i link interni .md
- **Audit dei contenuti**: Revisione manuale della completezza del workshop e dell'idoneità per i principianti
- **Sistema di navigazione**: Applicati schemi di navigazione coerenti tra capitoli e moduli

#### Note
- **Ambito**: Modifiche applicate solo alla documentazione in inglese
- **Traduzioni**: Le cartelle di traduzione non sono state aggiornate in questa versione (la traduzione automatica si sincronizzerà in seguito)
- **Durata del workshop**: Il workshop completo fornisce ora 3-4 ore di apprendimento pratico

---

### [v3.8.0] - 2025-11-19

#### Documentazione avanzata: monitoraggio, sicurezza e pattern multi-agente
**Questa versione aggiunge lezioni complete di livello A sull'integrazione con Application Insights, pattern di autenticazione e coordinamento multi-agente per distribuzioni in produzione.**

#### Aggiunto
- **📊 Lezione sull'integrazione con Application Insights**: in `docs/pre-deployment/application-insights.md`:
  - Distribuzione focalizzata su AZD con provisioning automatico
  - Template Bicep completi per Application Insights + Log Analytics
  - Applicazioni Python funzionanti con telemetria personalizzata (1.200+ righe)
  - Pattern di monitoraggio per AI/LLM (tracciamento token/costi Microsoft Foundry Models)
  - 6 diagrammi Mermaid (architettura, tracing distribuito, flusso di telemetria)
  - 3 esercizi pratici (alert, dashboard, monitoraggio AI)
  - Esempi di query Kusto e strategie di ottimizzazione dei costi
  - Streaming metriche live e debug in tempo reale
  - Tempo di apprendimento 40-50 minuti con pattern pronti per la produzione

- **🔐 Lezione sui pattern di autenticazione e sicurezza**: in `docs/getting-started/authsecurity.md`:
  - 3 pattern di autenticazione (connection strings, Key Vault, managed identity)
  - Template infrastrutturali Bicep completi per distribuzioni sicure
  - Codice applicativo Node.js con integrazione Azure SDK
  - 3 esercizi completi (abilitare managed identity, user-assigned identity, rotazione Key Vault)
  - Best practice di sicurezza e configurazioni RBAC
  - Guida al troubleshooting e analisi dei costi
  - Pattern di autenticazione passwordless pronti per la produzione

- **🤖 Lezione sui pattern di coordinazione multi-agente**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 pattern di coordinazione (sequenziale, parallelo, gerarchico, event-driven, consensus)
  - Implementazione completa del servizio orchestratore (Python/Flask, 1.500+ righe)
  - 3 implementazioni agent specializzate (Research, Writer, Editor)
  - Integrazione con Service Bus per il message queuing
  - Gestione dello stato con Cosmos DB per sistemi distribuiti
  - 6 diagrammi Mermaid che mostrano le interazioni degli agent
  - 3 esercizi avanzati (gestione timeout, logica di retry, circuit breaker)
  - Analisi dei costi ($240-565/mese) con strategie di ottimizzazione
  - Integrazione con Application Insights per il monitoraggio

#### Potenziato
- **Capitolo Pre-deployment**: Ora include pattern completi di monitoraggio e coordinazione
- **Capitolo Getting Started**: Potenziato con pattern di autenticazione professionali
- **Prontezza per la produzione**: Copertura completa dalla sicurezza all'osservabilità
- **Indice del corso**: Aggiornato per fare riferimento alle nuove lezioni nei Capitoli 3 e 6

#### Modificato
- **Progressione dell'apprendimento**: Migliore integrazione di sicurezza e monitoraggio in tutto il corso
- **Qualità della documentazione**: Standard coerenti di livello A (95-97%) sulle nuove lezioni
- **Pattern di produzione**: Copertura end-to-end completa per distribuzioni enterprise

#### Migliorato
- **Esperienza sviluppatore**: Percorso chiaro dallo sviluppo al monitoraggio in produzione
- **Standard di sicurezza**: Pattern professionali per autenticazione e gestione dei segreti
- **Osservabilità**: Integrazione completa di Application Insights con AZD
- **Carichi di lavoro AI**: Monitoraggio specializzato per Microsoft Foundry Models e sistemi multi-agente

#### Convalidato
- ✅ Tutte le lezioni includono codice completo funzionante (non snippet)
- ✅ Diagrammi Mermaid per l'apprendimento visivo (19 in totale across 3 lezioni)
- ✅ Esercizi pratici con passaggi di verifica (9 in totale)
- ✅ Template Bicep pronti per la produzione distribuibili tramite `azd up`
- ✅ Analisi dei costi e strategie di ottimizzazione
- ✅ Guide al troubleshooting e best practice
- ✅ Checkpoint di conoscenza con comandi di verifica

#### Risultati della valutazione della documentazione
- **docs/pre-deployment/application-insights.md**: - Guida completa al monitoraggio
- **docs/getting-started/authsecurity.md**: - Pattern di sicurezza professionali
- **docs/pre-deployment/coordination-patterns.md**: - Architetture multi-agente avanzate
- **Nuovi contenuti complessivi**: - Standard di alta qualità coerenti

#### Implementazione tecnica
- **Application Insights**: Log Analytics + telemetria personalizzata + tracing distribuito
- **Autenticazione**: Managed Identity + Key Vault + pattern RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orchestrazione
- **Monitoraggio**: Metriche live + query Kusto + alert + dashboard
- **Gestione dei costi**: Strategie di sampling, policy di retention, controlli di budget

### [v3.7.0] - 2025-11-19

#### Miglioramenti della qualità della documentazione e nuovo esempio Microsoft Foundry Models
**Questa versione migliora la qualità della documentazione nell'intero repository e aggiunge un esempio completo di distribuzione Microsoft Foundry Models con interfaccia di chat gpt-4.1.**

#### Aggiunto
- **🤖 Esempio chat Microsoft Foundry Models**: Distribuzione completa gpt-4.1 con implementazione funzionante in `examples/azure-openai-chat/`:
  - Infrastruttura completa per Microsoft Foundry Models (deploy modello gpt-4.1)
  - Interfaccia chat a riga di comando Python con cronologia delle conversazioni
  - Integrazione con Key Vault per l'archiviazione sicura delle chiavi API
  - Tracciamento dell'uso dei token e stima dei costi
  - Limitazione della velocità e gestione degli errori
  - README completo con guida alla distribuzione di 35-45 minuti
  - 11 file pronti per la produzione (template Bicep, app Python, configurazione)
- **📚 Esercizi di documentazione**: Aggiunti esercizi pratici alla guida di configurazione:
  - Esercizio 1: Configurazione multi-ambiente (15 minuti)
  - Esercizio 2: Pratica di gestione dei segreti (10 minuti)
  - Criteri di successo chiari e passaggi di verifica
- **✅ Verifica della distribuzione**: Aggiunta sezione di verifica alla guida di distribuzione:
  - Procedure di health check
  - Checklist dei criteri di successo
  - Output previsti per tutti i comandi di distribuzione
  - Riferimento rapido per il troubleshooting

#### Potenziato
- **examples/README.md**: Aggiornato a qualità A (93%):
  - Aggiunto azure-openai-chat a tutte le sezioni rilevanti
  - Aggiornato il conteggio degli esempi locali da 3 a 4
  - Aggiunto alla tabella degli esempi di applicazioni AI
  - Integrato nella Quick Start per utenti intermedi
  - Aggiunto alla sezione Microsoft Foundry Templates
  - Aggiornata la matrice di confronto e le sezioni di individuazione tecnologica
- **Qualità della documentazione**: Migliorata da B+ (87%) → A- (92%) nella cartella docs:
  - Aggiunti output previsti agli esempi di comandi critici
  - Inclusi passaggi di verifica per le modifiche di configurazione
  - Migliorata l'apprendimento pratico con esercizi concreti

#### Modificato
- **Progressione dell'apprendimento**: Migliore integrazione degli esempi AI per utenti intermedi
- **Struttura della documentazione**: Esercizi più pratici con risultati chiari
- **Processo di verifica**: Criteri di successo espliciti aggiunti ai flussi di lavoro chiave

#### Migliorato
- **Esperienza sviluppatore**: La distribuzione Microsoft Foundry Models ora richiede 35-45 minuti (vs 60-90 per alternative complesse)
- **Trasparenza dei costi**: Stime dei costi chiare ($50-200/mese) per l'esempio Microsoft Foundry Models
- **Percorso di apprendimento**: Gli sviluppatori AI hanno un punto d'ingresso chiaro con azure-openai-chat
- **Standard della documentazione**: Output previsti e passaggi di verifica coerenti

#### Convalidato
- ✅ Esempio Microsoft Foundry Models pienamente funzionante con `azd up`
- ✅ Tutti gli 11 file di implementazione sintatticamente corretti
- ✅ Istruzioni del README corrispondono all'esperienza reale di distribuzione
- ✅ Link della documentazione aggiornati in 8+ posizioni
- ✅ L'indice degli esempi riflette accuratamente 4 esempi locali
- ✅ Nessun link esterno duplicato nelle tabelle
- ✅ Tutte le referenze di navigazione corrette

#### Implementazione tecnica
- **Architettura Microsoft Foundry Models**: gpt-4.1 + Key Vault + pattern Container Apps
- **Sicurezza**: Managed Identity pronta, segreti in Key Vault
- **Monitoraggio**: Integrazione con Application Insights
- **Gestione dei costi**: Tracciamento dei token e ottimizzazione dell'uso
- **Distribuzione**: Comando singolo `azd up` per il setup completo

### [v3.6.0] - 2025-11-19

#### Aggiornamento importante: esempi di distribuzione Container App
**Questa versione introduce esempi completi e pronti per la produzione di distribuzione di applicazioni containerizzate usando Azure Developer CLI (AZD), con documentazione completa e integrazione nel percorso di apprendimento.**

#### Aggiunto
- **🚀 Esempi Container App**: Nuovi esempi locali in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Panoramica completa delle distribuzioni containerizzate, quick start, produzione e pattern avanzati
  - [Simple Flask API](../../examples/container-app/simple-flask-api): API REST per principianti con scale-to-zero, probe di salute, monitoraggio e troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Distribuzione multi-servizio pronta per la produzione (API Gateway, Product, Order, User, Notification), messaging asincrono, Service Bus, Cosmos DB, Azure SQL, tracing distribuito, deploy blue-green/canary
- **Best Practice**: Sicurezza, monitoraggio, ottimizzazione dei costi e linee guida CI/CD per i workload containerizzati
- **Esempi di codice**: `azure.yaml` completo, template Bicep e implementazioni multi-lingua dei servizi (Python, Node.js, C#, Go)
- **Test & Troubleshooting**: Scenari di test end-to-end, comandi di monitoraggio, guida al troubleshooting

#### Modificato
- **README.md**: Aggiornato per presentare e collegare nuovi esempi di app container sotto "Local Examples - Container Applications"
- **examples/README.md**: Aggiornato per evidenziare gli esempi di app container, aggiungere voci alla matrice di confronto e aggiornare i riferimenti tecnologici/architetturali
- **Course Outline & Study Guide**: Aggiornati per fare riferimento ai nuovi esempi di app container e ai pattern di deployment nei capitoli pertinenti

#### Validato
- ✅ Tutti i nuovi esempi distribuibili con `azd up` e conformi alle best practice
- ✅ Collegamenti incrociati della documentazione e navigazione aggiornati
- ✅ Gli esempi coprono scenari da principianti ad avanzati, inclusi microservizi di produzione

#### Note
- **Ambito**: Documentazione ed esempi in inglese solamente
- **Prossimi passi**: Espandere con ulteriori pattern avanzati per container e automazione CI/CD nelle versioni future

### [v3.5.0] - 2025-11-19

#### Ribrandizzazione del prodotto: Microsoft Foundry
**Questa versione implementa un cambiamento completo del nome del prodotto da "Microsoft Foundry" a "Microsoft Foundry" in tutta la documentazione in inglese, riflettendo il rebranding ufficiale di Microsoft.**

#### Modificato
- **🔄 Aggiornamento del nome del prodotto**: Ribrandizzazione completa da "Microsoft Foundry" a "Microsoft Foundry"
  - Aggiornati tutti i riferimenti nella documentazione in inglese nella cartella `docs/`
  - Cartella rinominata: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - File rinominato: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totale: 23 riferimenti di contenuto aggiornati in 7 file di documentazione

- **📁 Modifiche alla struttura delle cartelle**:
  - `docs/ai-foundry/` rinominata in `docs/microsoft-foundry/`
  - Tutti i riferimenti incrociati aggiornati per riflettere la nuova struttura delle cartelle
  - Link di navigazione convalidati in tutta la documentazione

- **📄 Rinomina file**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tutti i link interni aggiornati per fare riferimento al nuovo nome del file

#### File aggiornati
- **Documentazione dei capitoli** (7 file):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aggiornamenti ai link di navigazione
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 riferimenti al nome del prodotto aggiornati
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Già utilizza Microsoft Foundry (da aggiornamenti precedenti)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 riferimenti aggiornati (panoramica, feedback della community, documentazione)
  - `docs/getting-started/azd-basics.md` - 4 link di riferimento incrociato aggiornati
  - `docs/getting-started/first-project.md` - 2 link di navigazione capitolo aggiornati
  - `docs/getting-started/installation.md` - 2 link al capitolo successivo aggiornati
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 riferimenti aggiornati (navigazione, community Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link di navigazione aggiornato
  - `docs/troubleshooting/debugging.md` - 1 link di navigazione aggiornato

- **File della struttura del corso** (2 file):
  - `README.md` - 17 riferimenti aggiornati (panoramica del corso, titoli dei capitoli, sezione template, approfondimenti della community)
  - `course-outline.md` - 14 riferimenti aggiornati (panoramica, obiettivi di apprendimento, risorse del capitolo)

#### Validato
- ✅ Zero riferimenti residui al percorso della cartella "ai-foundry" nella documentazione in inglese
- ✅ Zero riferimenti residui al nome del prodotto "Microsoft Foundry" nella documentazione in inglese
- ✅ Tutti i link di navigazione funzionanti con la nuova struttura delle cartelle
- ✅ Rinomine di file e cartelle completate con successo
- ✅ Riferimenti incrociati tra i capitoli convalidati

#### Note
- **Ambito**: Modifiche applicate solo alla documentazione in inglese nella cartella `docs/`
- **Traduzioni**: Cartelle di traduzione (`translations/`) non aggiornate in questa versione
- **Workshop**: Materiali del workshop (`workshop/`) non aggiornati in questa versione
- **Esempi**: I file di esempio potrebbero ancora fare riferimento a nomi legacy (da correggere in un aggiornamento futuro)
- **Link esterni**: URL esterni e riferimenti al repository GitHub rimangono invariati

#### Guida alla migrazione per i contributori
Se hai rami locali o documentazione che fanno riferimento alla vecchia struttura:
1. Aggiorna i riferimenti alle cartelle: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aggiorna i riferimenti ai file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Sostituire il nome del prodotto: "Microsoft Foundry" → "Microsoft Foundry"
4. Convalida che tutti i link interni della documentazione funzionino ancora

---

### [v3.4.0] - 2025-10-24

#### Miglioramenti all'anteprima e alla convalida dell'infrastruttura
**Questa versione introduce un supporto completo per la nuova funzionalità in anteprima della Azure Developer CLI e migliora l'esperienza utente del workshop.**

#### Aggiunto
- **🧪 Documentazione della funzionalità azd provision --preview**: Copertura completa della nuova capacità di anteprima dell'infrastruttura
  - Riferimento al comando ed esempi d'uso nel cheat sheet
  - Integrazione dettagliata nella guida al provisioning con casi d'uso e benefici
  - Integrazione di controlli pre-volo per una convalida del deployment più sicura
  - Aggiornamenti alla guida introduttiva con pratiche di deployment orientate alla sicurezza
- **🚧 Banner di stato del workshop**: Banner HTML professionale che indica lo stato di sviluppo del workshop
  - Design a gradiente con indicatori di costruzione per una comunicazione chiara agli utenti
  - Timestamp dell'ultimo aggiornamento per trasparenza
  - Design responsive per tutti i tipi di dispositivo

#### Migliorato
- **Sicurezza dell'infrastruttura**: Funzionalità di anteprima integrata nella documentazione di deployment
- **Convalida pre-deployment**: Gli script automatizzati ora includono test di anteprima dell'infrastruttura
- **Workflow dello sviluppatore**: Sequenze di comandi aggiornate per includere l'anteprima come best practice
- **Esperienza del workshop**: Aspettative chiare per gli utenti sullo stato di sviluppo dei contenuti

#### Modificato
- **Best Practice di deployment**: Workflow "preview-first" ora consigliato
- **Flusso della documentazione**: La convalida dell'infrastruttura è stata spostata anticipatamente nel processo di apprendimento
- **Presentazione del workshop**: Comunicazione professionale dello stato con timeline di sviluppo chiara

#### Migliorato
- **Approccio safety-first**: I cambiamenti di infrastruttura possono ora essere convalidati prima del deployment
- **Collaborazione del team**: I risultati dell'anteprima possono essere condivisi per revisione e approvazione
- **Consapevolezza dei costi**: Migliore comprensione dei costi delle risorse prima del provisioning
- **Mitigazione del rischio**: Ridotte le possibilità di fallimento del deployment grazie alla convalida preventiva

#### Implementazione tecnica
- **Integrazione multi-documento**: La funzionalità di anteprima documentata in 4 file chiave
- **Pattern di comandi**: Sintassi coerente ed esempi in tutta la documentazione
- **Integrazione delle best practice**: Anteprima inclusa nei workflow di validazione e negli script
- **Indicatori visivi**: Chiare marcature NEW per facilitare il reperimento della funzionalità

#### Infrastruttura del workshop
- **Comunicazione dello stato**: Banner HTML professionale con styling a gradiente
- **Esperienza utente**: Stato di sviluppo chiaro per evitare confusione
- **Presentazione professionale**: Mantiene la credibilità del repository impostando aspettative
- **Trasparenza della timeline**: Timestamp ultimo aggiornamento ottobre 2025 per responsabilità

### [v3.3.0] - 2025-09-24

#### Materiali del workshop migliorati ed esperienza di apprendimento interattiva
**Questa versione introduce materiali esaustivi per il workshop con guide interattive basate sul browser e percorsi di apprendimento strutturati.**

#### Aggiunto
- **🎥 Guida interattiva del workshop**: Esperienza del workshop basata su browser con funzionalità di anteprima MkDocs
- **📝 Istruzioni strutturate del workshop**: Percorso di apprendimento guidato in 7 passaggi dalla scoperta alla personalizzazione
  - 0-Introduction: Panoramica del workshop e configurazione
  - 1-Select-AI-Template: Processo di scoperta e selezione dei template
  - 2-Validate-AI-Template: Procedure di deployment e convalida
  - 3-Deconstruct-AI-Template: Comprensione dell'architettura del template
  - 4-Configure-AI-Template: Configurazione e personalizzazione
  - 5-Customize-AI-Template: Modifiche avanzate e iterazioni
  - 6-Teardown-Infrastructure: Pulizia e gestione delle risorse
  - 7-Wrap-up: Riepilogo e prossimi passi
- **🛠️ Strumentazione del workshop**: Configurazione MkDocs con tema Material per migliorare l'esperienza di apprendimento
- **🎯 Percorso di apprendimento pratico**: Metodologia in 3 passi (Discovery → Deployment → Customization)
- **📱 Integrazione con GitHub Codespaces**: Configurazione senza interruzioni dell'ambiente di sviluppo

#### Migliorato
- **Lab AI Workshop**: Esteso con un'esperienza strutturata di apprendimento di 2-3 ore
- **Documentazione del workshop**: Presentazione professionale con navigazione e ausili visivi
- **Progressione dell'apprendimento**: Guida chiara passo-passo dalla selezione del template al deployment in produzione
- **Esperienza dello sviluppatore**: Strumentazione integrata per flussi di lavoro di sviluppo semplificati

#### Migliorato
- **Accessibilità**: Interfaccia basata su browser con ricerca, funzionalità di copia e toggle del tema
- **Apprendimento autogestito**: Struttura flessibile del workshop che si adatta a diversi ritmi di apprendimento
- **Applicazione pratica**: Scenari reali di deployment di template AI
- **Integrazione community**: Integrazione con Discord per supporto e collaborazione sul workshop

#### Caratteristiche del workshop
- **Ricerca integrata**: Scoperta rapida per parole chiave e lezioni
- **Copia blocchi di codice**: Funzionalità hover-to-copy per tutti gli esempi di codice
- **Cambio tema**: Supporto modalità scura/chiara per preferenze diverse
- **Asset visivi**: Screenshot e diagrammi per una migliore comprensione
- **Integrazione aiuto**: Accesso diretto a Discord per supporto della community

### [v3.2.0] - 2025-09-17

#### Ristrutturazione importante della navigazione e sistema di apprendimento basato sui capitoli
**Questa versione introduce una struttura di apprendimento basata sui capitoli completa con una navigazione migliorata in tutto il repository.**

#### Aggiunto
- **📚 Sistema di apprendimento basato sui capitoli**: Ristrutturato l'intero corso in 8 capitoli progressivi
  - Chapter 1: Fondamenti & Avvio rapido (⭐ - 30-45 min)
  - Chapter 2: Sviluppo AI-First (⭐⭐ - 1-2 ore)
  - Chapter 3: Configurazione & Autenticazione (⭐⭐ - 45-60 min)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 ore)
  - Chapter 5: Soluzioni AI Multi-Agente (⭐⭐⭐⭐ - 2-3 ore)
  - Chapter 6: Convalida e pianificazione pre-deployment (⭐⭐ - 1 ora)
  - Chapter 7: Risoluzione dei problemi & Debugging (⭐⭐ - 1-1.5 ore)
  - Chapter 8: Pattern di produzione & enterprise (⭐⭐⭐⭐ - 2-3 ore)
- **📚 Sistema di navigazione completo**: Intestazioni e footer di navigazione coerenti in tutta la documentazione
- **🎯 Tracciamento del progresso**: Checklist di completamento del corso e sistema di verifica dell'apprendimento
- **🗺️ Guida del percorso di apprendimento**: Punti di ingresso chiari per diversi livelli di esperienza e obiettivi
- **🔗 Navigazione con riferimenti incrociati**: Capitoli correlati e prerequisiti chiaramente collegati

#### Migliorato
- **Struttura del README**: Trasformata in una piattaforma di apprendimento strutturata con organizzazione basata sui capitoli
- **Navigazione della documentazione**: Ogni pagina ora include il contesto del capitolo e indicazioni sulla progressione
- **Organizzazione dei template**: Esempi e template mappati ai capitoli di apprendimento appropriati
- **Integrazione delle risorse**: Cheat sheet, FAQ e guide di studio collegati ai capitoli rilevanti
- **Integrazione workshop**: Lab pratici mappati a più obiettivi di apprendimento dei capitoli

#### Modificato
- **Progressione dell'apprendimento**: Spostata da documentazione lineare a un apprendimento flessibile basato sui capitoli
- **Posizionamento della configurazione**: Guida alla configurazione riposizionata come Capitolo 3 per un flusso di apprendimento migliore
- **Integrazione dei contenuti AI**: Migliore integrazione dei contenuti specifici per l'AI lungo il percorso di apprendimento
- **Contenuti di produzione**: Pattern avanzati consolidati nel Capitolo 8 per studenti enterprise

#### Migliorato
- **Esperienza utente**: Breadcrumb di navigazione chiari e indicatori di progressione del capitolo
- **Accessibilità**: Pattern di navigazione coerenti per facilitare l'attraversamento del corso
- **Presentazione professionale**: Struttura in stile universitario adatta alla formazione accademica e aziendale
- **Efficienza dell'apprendimento**: Riduzione del tempo per trovare contenuti rilevanti grazie all'organizzazione migliorata

#### Implementazione tecnica
- **Intestazioni di navigazione**: Navigazione dei capitoli standardizzata in oltre 40 file di documentazione
- **Footer di navigazione**: Indicazioni di progressione coerenti e indicatori di completamento dei capitoli
- **Riferimenti incrociati**: Sistema completo di link interni che collega concetti correlati
- **Mappatura dei capitoli**: Template e esempi chiaramente associati agli obiettivi di apprendimento

#### Miglioramento della guida di studio
- **📚 Obiettivi di apprendimento completi**: Guida di studio ristrutturata per allinearsi al sistema a 8 capitoli
- **🎯 Valutazione basata sui capitoli**: Ogni capitolo include obiettivi di apprendimento specifici ed esercizi pratici
- **📋 Tracciamento del progresso**: Programma di apprendimento settimanale con risultati misurabili e checklist di completamento
- **❓ Domande di valutazione**: Domande di verifica della conoscenza per ogni capitolo con risultati professionali
- **🛠️ Esercizi pratici**: Attività pratiche con scenari reali di deployment e risoluzione dei problemi
- **📊 Progressione delle competenze**: Avanzamento chiaro dai concetti base ai pattern enterprise con focus sullo sviluppo della carriera
- **🎓 Framework di certificazione**: Risultati di sviluppo professionale e sistema di riconoscimento della community
- **⏱️ Gestione della timeline**: Piano di apprendimento strutturato di 10 settimane con convalide dei milestone

### [v3.1.0] - 2025-09-17

#### Miglioramento delle soluzioni AI multi-agente
**Questa versione migliora la soluzione multi-agente per il settore retail con una denominazione degli agenti più chiara e documentazione potenziata.**

#### Modificato
- **Terminologia multi-agente**: Sostituito "Cora agent" con "Customer agent" in tutta la soluzione multi-agente per il retail per una comprensione più chiara
- **Architettura degli agenti**: Aggiornata tutta la documentazione, i template ARM e gli esempi di codice per usare la denominazione coerente "Customer agent"
- **Esempi di configurazione**: Modernizzati i pattern di configurazione degli agenti con convenzioni di denominazione aggiornate
- **Coerenza della documentazione**: Garantito che tutti i riferimenti utilizzino nomi di agenti professionali e descrittivi

#### Migliorato
- **ARM Template Package**: Aggiornato retail-multiagent-arm-template con riferimenti all'agente Customer
- **Architecture Diagrams**: Aggiornati i diagrammi Mermaid con la nuova denominazione degli agenti
- **Code Examples**: Le classi Python e gli esempi di implementazione ora utilizzano la denominazione CustomerAgent
- **Environment Variables**: Aggiornati tutti gli script di deployment per usare le convenzioni CUSTOMER_AGENT_NAME

#### Migliorato
- **Developer Experience**: Ruoli e responsabilità degli agenti più chiari nella documentazione
- **Production Readiness**: Migliore allineamento con le convenzioni di denominazione aziendali
- **Learning Materials**: Denominazione degli agenti più intuitiva per scopi didattici
- **Template Usability**: Comprensione semplificata delle funzioni degli agenti e dei modelli di deployment

#### Dettagli Tecnici
- Aggiornati i diagrammi architetturali Mermaid con riferimenti a CustomerAgent
- Sostituiti i nomi delle classi CoraAgent con CustomerAgent negli esempi Python
- Modificate le configurazioni JSON del template ARM per usare il tipo di agente "customer"
- Aggiornate le variabili d'ambiente da CORA_AGENT_* a CUSTOMER_AGENT_*
- Aggiornati tutti i comandi di deployment e le configurazioni dei container

### [v3.0.0] - 2025-09-12

#### Principali Modifiche - Focus sullo Sviluppatore AI e Integrazione con Microsoft Foundry
**Questa versione trasforma il repository in una risorsa di apprendimento completa incentrata sull'AI con integrazione Microsoft Foundry.**

#### Aggiunte
- **🤖 AI-First Learning Path**: Ristrutturazione completa che dà priorità agli sviluppatori e agli ingegneri AI
- **Microsoft Foundry Integration Guide**: Documentazione completa per connettere AZD con i servizi Microsoft Foundry
- **AI Model Deployment Patterns**: Guida dettagliata che copre la selezione del modello, la configurazione e le strategie di deploy in produzione
- **AI Workshop Lab**: Workshop pratico di 2-3 ore per convertire applicazioni AI in soluzioni distribuibili con AZD
- **Production AI Best Practices**: Pattern aziendali pronti per scalare, monitorare e mettere in sicurezza i carichi di lavoro AI
- **AI-Specific Troubleshooting Guide**: Guida completa alla risoluzione dei problemi per Microsoft Foundry Models, Cognitive Services e problemi di deployment AI
- **AI Template Gallery**: Collezione in rilievo di template Microsoft Foundry con classifiche di complessità
- **Workshop Materials**: Struttura completa del workshop con laboratori pratici e materiali di riferimento

#### Migliorato
- **README Structure**: Incentrato sugli sviluppatori AI con dati di interesse della community al 45% dal Microsoft Foundry Discord
- **Learning Paths**: Percorso dedicato per sviluppatori AI accanto ai percorsi tradizionali per studenti e ingegneri DevOps
- **Template Recommendations**: Template AI in evidenza inclusi azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Community Integration**: Supporto migliorato alla community su Discord con canali e discussioni specifiche per l'AI

#### Focus su Sicurezza e Produzione
- **Managed Identity Patterns**: Configurazioni di autenticazione e sicurezza specifiche per l'AI
- **Cost Optimization**: Monitoraggio dell'uso dei token e controlli di budget per i carichi di lavoro AI
- **Multi-Region Deployment**: Strategie per il deployment globale di applicazioni AI
- **Performance Monitoring**: Metriche specifiche per l'AI e integrazione con Application Insights

#### Qualità della Documentazione
- **Linear Course Structure**: Progressione logica da principianti a pattern avanzati di deployment AI
- **Validated URLs**: Tutti i link esterni del repository verificati e accessibili
- **Complete Reference**: Tutti i link interni della documentazione verificati e funzionanti
- **Production Ready**: Pattern di deployment aziendali con esempi reali

### [v2.0.0] - 2025-09-09

#### Principali Modifiche - Ristrutturazione del Repository e Miglioramento Professionale
**Questa versione rappresenta una revisione significativa della struttura del repository e della presentazione dei contenuti.**

#### Aggiunte
- **Structured Learning Framework**: Tutte le pagine di documentazione ora includono sezioni Introduzione, Obiettivi di Apprendimento e Risultati dell'Apprendimento
- **Navigation System**: Aggiunti link Lezione Precedente/Successiva in tutta la documentazione per una progressione guidata dell'apprendimento
- **Study Guide**: study-guide.md completo con obiettivi di apprendimento, esercizi pratici e materiali di valutazione
- **Professional Presentation**: Rimosse tutte le icone emoji per migliorare l'accessibilità e l'aspetto professionale
- **Enhanced Content Structure**: Organizzazione e flusso dei materiali di apprendimento migliorati

#### Modifiche
- **Documentation Format**: Standardizzata tutta la documentazione con una struttura coerente focalizzata sull'apprendimento
- **Navigation Flow**: Implementata una progressione logica attraverso tutti i materiali di apprendimento
- **Content Presentation**: Rimosso elementi decorativi a favore di un formato chiaro e professionale
- **Link Structure**: Aggiornati tutti i link interni per supportare il nuovo sistema di navigazione

#### Migliorato
- **Accessibility**: Rimosse le dipendenze dalle emoji per una migliore compatibilità con gli screen reader
- **Professional Appearance**: Presentazione pulita in stile accademico adatta alla formazione aziendale
- **Learning Experience**: Approccio strutturato con obiettivi e risultati chiari per ogni lezione
- **Content Organization**: Migliore flusso logico e connessione tra argomenti correlati

### [v1.0.0] - 2025-09-09

#### Rilascio Iniziale - Repository di Apprendimento AZD Completo

#### Aggiunte
- **Core Documentation Structure**
  - Serie completa di guide getting-started
  - Documentazione completa su deployment e provisioning
  - Risorse dettagliate per il troubleshooting e guide al debug
  - Strumenti e procedure di validazione pre-deployment

- **Getting Started Module**
  - AZD Basics: Concetti fondamentali e terminologia
  - Installation Guide: Istruzioni di setup specifiche per piattaforma
  - Configuration Guide: Configurazione dell'ambiente e autenticazione
  - First Project Tutorial: Apprendimento pratico passo passo

- **Deployment and Provisioning Module**
  - Deployment Guide: Documentazione completa del workflow
  - Provisioning Guide: Infrastructure as Code con Bicep
  - Best practices per deployment in produzione
  - Pattern di architettura multi-servizio

- **Pre-deployment Validation Module**
  - Capacity Planning: Validazione della disponibilità delle risorse Azure
  - SKU Selection: Guida completa alla scelta del livello di servizio
  - Pre-flight Checks: Script di validazione automatizzata (PowerShell e Bash)
  - Strumenti per stima dei costi e pianificazione del budget

- **Troubleshooting Module**
  - Common Issues: Problemi frequenti e soluzioni
  - Debugging Guide: Metodologie sistematiche di troubleshooting
  - Tecniche e strumenti diagnostici avanzati
  - Monitoraggio delle prestazioni e ottimizzazione

- **Resources and References**
  - Command Cheat Sheet: Riferimento rapido per i comandi essenziali
  - Glossary: Definizioni complete di terminologia e acronimi
  - FAQ: Risposte dettagliate alle domande comuni
  - Link a risorse esterne e connessioni alla community

- **Examples and Templates**
  - Esempio di semplice applicazione Web
  - Template per il deployment di siti Web statici
  - Configurazione per applicazioni containerizzate
  - Pattern di integrazione con database
  - Esempi di architettura a microservizi
  - Implementazioni di funzioni serverless

#### Funzionalità
- **Multi-Platform Support**: Guide di installazione e configurazione per Windows, macOS e Linux
- **Multiple Skill Levels**: Contenuti progettati per studenti fino a sviluppatori professionisti
- **Practical Focus**: Esempi pratici e scenari reali
- **Comprehensive Coverage**: Dai concetti base ai pattern aziendali avanzati
- **Security-First Approach**: Best practice di sicurezza integrate in tutto il materiale
- **Cost Optimization**: Indicazioni per deployment e gestione delle risorse cost-effective

#### Qualità della Documentazione
- **Detailed Code Examples**: Esempi di codice pratici e testati
- **Step-by-Step Instructions**: Indicazioni chiare e attuabili
- **Comprehensive Error Handling**: Risoluzione dei problemi per problematiche comuni
- **Best Practices Integration**: Standard industriali e raccomandazioni
- **Version Compatibility**: Aggiornato con gli ultimi servizi Azure e le funzionalità di azd

## Miglioramenti Futuri Pianificati

### Version 3.1.0 (Pianificata)
#### Espansione della Piattaforma AI
- **Multi-Model Support**: Pattern di integrazione per Hugging Face, Azure Machine Learning e modelli custom
- **AI Agent Frameworks**: Template per deploy di LangChain, Semantic Kernel e AutoGen
- **Advanced RAG Patterns**: Opzioni di database vettoriali oltre Azure AI Search (Pinecone, Weaviate, ecc.)
- **AI Observability**: Monitoraggio avanzato per performance dei modelli, uso dei token e qualità delle risposte

#### Esperienza dello Sviluppatore
- **VS Code Extension**: Esperienza di sviluppo integrata AZD + Microsoft Foundry
- **GitHub Copilot Integration**: Generazione di template AZD assistita dall'AI
- **Interactive Tutorials**: Esercizi di coding pratici con validazione automatizzata per scenari AI
- **Video Content**: Tutorial video supplementari per apprendenti visivi incentrati sui deployment AI

### Version 4.0.0 (Pianificata)
#### Pattern AI per l'Enterprise
- **Governance Framework**: Governance dei modelli AI, conformità e tracce di audit
- **Multi-Tenant AI**: Pattern per servire più clienti con servizi AI isolati
- **Edge AI Deployment**: Integrazione con Azure IoT Edge e istanze di container
- **Hybrid Cloud AI**: Pattern di deployment multi-cloud e ibridi per carichi di lavoro AI

#### Funzionalità Avanzate
- **AI Pipeline Automation**: Integrazione MLOps con pipeline di Azure Machine Learning
- **Advanced Security**: Pattern zero-trust, private endpoints e protezione avanzata dalle minacce
- **Performance Optimization**: Strategie avanzate di tuning e scaling per applicazioni AI ad alto throughput
- **Global Distribution**: Pattern di distribuzione dei contenuti e caching edge per applicazioni AI

### Version 3.0.0 (Pianificata) - Sostituita dalla Release Corrente
#### Aggiunte Proposte - Ora Implementate in v3.0.0
- ✅ **AI-Focused Content**: Integrazione completa con Microsoft Foundry (Completato)
- ✅ **Interactive Tutorials**: Laboratorio workshop pratico AI (Completato)
- ✅ **Advanced Security Module**: Pattern di sicurezza specifici per l'AI (Completato)
- ✅ **Performance Optimization**: Strategie di tuning per carichi di lavoro AI (Completato)

### Version 2.1.0 (Pianificata) - Parzialmente Implementata in v3.0.0
#### Miglioramenti Minori - Alcuni Completati nella Release Corrente
- ✅ **Additional Examples**: Scenari di deployment incentrati sull'AI (Completato)
- ✅ **Extended FAQ**: Domande specifiche sull'AI e troubleshooting (Completato)
- **Tool Integration**: Guide migliorate per l'integrazione degli IDE e degli editor
- ✅ **Monitoring Expansion**: Pattern di monitoraggio e alerting specifici per l'AI (Completato)

#### Ancora Pianificato per le Versioni Future
- **Mobile-Friendly Documentation**: Design responsive per apprendimento mobile
- **Offline Access**: Pacchetti di documentazione scaricabili
- **Enhanced IDE Integration**: Estensione VS Code per workflow AZD + AI
- **Community Dashboard**: Metriche della community in tempo reale e tracciamento dei contributi

## Contribuire al Changelog

### Segnalazione delle Modifiche
Quando contribuisci a questo repository, assicurati che le voci del changelog includano:

1. **Version Number**: Seguendo il versionamento semantico (major.minor.patch)
2. **Date**: Data di rilascio o aggiornamento in formato YYYY-MM-DD
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Descrizione concisa di ciò che è cambiato
5. **Impact Assessment**: Come le modifiche influenzano gli utenti esistenti

### Categorie di Modifica

#### Aggiunte
- Nuove funzionalità, sezioni della documentazione o capacità
- Nuovi esempi, template o risorse di apprendimento
- Strumenti aggiuntivi, script o utilità

#### Modifiche
- Modifiche alla funzionalità o alla documentazione esistente
- Aggiornamenti per migliorare chiarezza o accuratezza
- Ristrutturazione dei contenuti o dell'organizzazione

#### Deprecato
- Funzionalità o approcci che stanno venendo eliminati
- Sezioni della documentazione programmate per la rimozione
- Metodi che hanno alternative migliori

#### Rimossi
- Funzionalità, documentazione o esempi non più rilevanti
- Informazioni obsolete o approcci deprecati
- Contenuti ridondanti o consolidati

#### Correzioni
- Correzioni di errori nella documentazione o nel codice
- Risoluzione di problemi o issue segnalate
- Miglioramenti all'accuratezza o alla funzionalità

#### Sicurezza
- Miglioramenti o fix relativi alla sicurezza
- Aggiornamenti alle best practice di sicurezza
- Risoluzione di vulnerabilità di sicurezza

### Linee Guida per il Versionamento Semantico

#### Versione Major (X.0.0)
- Cambiamenti incompatibili che richiedono azione da parte dell'utente
- Ristrutturazione significativa dei contenuti o dell'organizzazione
- Cambiamenti che alterano l'approccio o la metodologia fondamentale

#### Versione Minor (X.Y.0)
- Nuove funzionalità o aggiunte di contenuto
- Miglioramenti che mantengono la retrocompatibilità
- Esempi, strumenti o risorse aggiuntive

#### Versione Patch (X.Y.Z)
- Correzioni di bug e rettifiche
- Miglioramenti minori ai contenuti esistenti
- Chiarimenti e piccoli miglioramenti

## Feedback e Suggerimenti della Community

Incoraggiamo attivamente il feedback della community per migliorare questa risorsa di apprendimento:

### Come Fornire Feedback
- **GitHub Issues**: Segnala problemi o suggerisci miglioramenti (issue specifiche per l'AI benvenute)
- **Discord Discussions**: Condividi idee e interagisci con la community Microsoft Foundry
- **Pull Requests**: Contribuisci con miglioramenti diretti ai contenuti, in particolare template e guide AI
- **Microsoft Foundry Discord**: Partecipa al canale #Azure per discussioni su AZD + AI
- **Community Forums**: Partecipa a discussioni più ampie per sviluppatori Azure

### Categorie di Feedback
- **AI Content Accuracy**: Correzioni relative all'integrazione dei servizi AI e alle informazioni di deployment
- **Learning Experience**: Suggerimenti per migliorare il percorso di apprendimento per sviluppatori AI
- **Missing AI Content**: Richieste di template, pattern o esempi AI aggiuntivi
- **Accessibility**: Miglioramenti per esigenze di apprendimento diversificate
- **AI Tool Integration**: Suggerimenti per una migliore integrazione del workflow di sviluppo AI
- **Production AI Patterns**: Richieste di pattern di deployment AI enterprise

### Impegno di Risposta
- **Issue Response**: Entro 48 ore per problemi segnalati
- **Feature Requests**: Valutazione entro una settimana
- **Community Contributions**: Revisione entro una settimana
- **Security Issues**: Priorità immediata con risposta accelerata

## Programma di Manutenzione

### Aggiornamenti Regolari
- **Monthly Reviews**: Verifica dell'accuratezza dei contenuti e validazione dei link
- **Quarterly Updates**: Aggiunte e miglioramenti importanti ai contenuti
- **Semi-Annual Reviews**: Ristrutturazione completa e miglioramenti
- **Annual Releases**: Aggiornamenti di major version con miglioramenti significativi

### Monitoraggio e Garanzia di Qualità
- **Automated Testing**: Validazione regolare degli esempi di codice e dei link
- **Community Feedback Integration**: Incorporazione regolare dei suggerimenti degli utenti
- **Technology Updates**: Allineamento con gli ultimi servizi Azure e le release di azd
- **Accessibility Audits**: Revisione regolare per principi di design inclusivo

## Politica di Supporto delle Versioni

### Supporto per la Versione Corrente
- **Ultima versione principale**: Supporto completo con aggiornamenti regolari
- **Versione principale precedente**: Aggiornamenti di sicurezza e correzioni critiche per 12 mesi
- **Versioni legacy**: Solo supporto dalla community, nessun aggiornamento ufficiale

### Linee guida per la migrazione
Quando vengono rilasciate nuove versioni principali, forniamo:
- **Guide alla migrazione**: Istruzioni passo-passo per la transizione
- **Note di compatibilità**: Dettagli sulle modifiche incompatibili
- **Supporto strumenti**: Script o utility per assistere nella migrazione
- **Supporto della community**: Forum dedicati per domande sulla migrazione

---

**Navigazione**
- **Lezione precedente**: [Guida di studio](resources/study-guide.md)
- **Lezione successiva**: Torna a [README principale](README.md)

**Rimani aggiornato**: Monitora questo repository per le notifiche sulle nuove versioni e per gli aggiornamenti importanti ai materiali didattici.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Dichiarazione di non responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica basato su IA [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per l'accuratezza, si prega di essere consapevoli che le traduzioni automatizzate possono contenere errori o inesattezze. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non ci riteniamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->