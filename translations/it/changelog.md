# Registro delle modifiche - AZD For Beginners

## Introduzione

Questo registro delle modifiche documenta tutte le modifiche, gli aggiornamenti e i miglioramenti rilevanti al repository AZD For Beginners. Seguiamo i principi del versionamento semantico e manteniamo questo registro per aiutare gli utenti a comprendere cosa è cambiato tra le versioni.

## Obiettivi di apprendimento

Rivedendo questo changelog, tu:
- Rimani informato sulle nuove funzionalità e aggiunte di contenuti
- Comprendi i miglioramenti apportati alla documentazione esistente
- Tieni traccia delle correzioni di bug e delle rettifiche per garantire l'accuratezza
- Segui l'evoluzione dei materiali didattici nel tempo

## Risultati dell'apprendimento

Dopo aver esaminato le voci del changelog, sarai in grado di:
- Identificare nuovi contenuti e risorse disponibili per l'apprendimento
- Comprendere quali sezioni sono state aggiornate o migliorate
- Pianificare il tuo percorso di apprendimento in base ai materiali più aggiornati
- Contribuire con feedback e suggerimenti per futuri miglioramenti

## Cronologia delle versioni

### [v3.22.0] - 2026-06-16

#### Esercizio per principianti #2: Creazione di template, Dev Containers, Pulumi, Azure DevOps, Service Principals e altro
**Questa versione chiude le rimanenti lacune di livello intermedio emerse dall'analisi azd-coverage: come creare e pubblicare il proprio template, ambienti riproducibili dev-container/Codespaces, il provider d'infrastruttura Pulumi, una guida passo-passo ad Azure DevOps CI/CD, l'autenticazione con service principal, indicazioni per la scelta dell'host (AKS/Spring Apps), spiegazioni di `azd restore`/`azd package`, gestione degli errori negli hook e pratiche per team/ambienti condivisi.**

#### Aggiunte
- **🧱 Nuova lezione del Capitolo 4** `docs/chapter-04-infrastructure/custom-templates.md` — creare il proprio template azd: struttura richiesta (`azure.yaml`, `infra/`, `src/`), il campo `metadata.template`, parametrizzazione dell'infrastruttura con il token di risorsa `uniqueString()` e il tag `azd-env-name`, testing locale con `azd init --template <local-path>`, pubblicazione su GitHub e invio alla galleria Awesome AZD
- **📦 Nuova lezione del Capitolo 1** `docs/chapter-01-foundation/dev-containers.md` — ambienti azd riproducibili con Dev Containers e GitHub Codespaces: un `.devcontainer/devcontainer.json` minimale che usa la feature ufficiale `ghcr.io/azure/azure-dev/azd`, feature specifiche per linguaggio, `docker-in-docker` per host container e `azd auth login --use-device-code` per l'accesso remoto
- **🧩 Pulumi con azd** sezione in `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, layout delle cartelle Pulumi, gli stack mappati agli ambienti azd, output/tagging richiesti e il medesimo flusso di lavoro `azd up` / `azd down`
- **🎯 Indicazioni per la selezione dell'host** in `docs/chapter-04-infrastructure/provisioning.md` — un confronto pensato per principianti tra `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` e `springapp`, con indicazioni su quando scegliere AKS o Azure Spring Apps
- **🛠️ Guida passo-passo Azure DevOps CI/CD** in `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection con workload identity federation (OIDC), il `azure-dev.yml` generato e la configurazione del variable-group
- **🔑 Service Principals (Pattern 4)** aggiunto a `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` non interattivo con client secret vs. credenziali federate/OIDC, quando usarli e come conservare le credenziali in modo sicuro
- **🪝 Gestione degli errori negli hook** sottosezione in `docs/chapter-04-infrastructure/deployment-guide.md` — codici di uscita e `set -e`, `continueOnError`, testare gli hook in isolamento con `azd hooks run`, shell specifiche per OS e `--debug`
- **👥 Team / ambienti condivisi** sezione in `docs/chapter-03-configuration/configuration.md` — cosa vive in `.azure/`, cosa aggiungere a gitignore, ambienti per singolo sviluppatore, `azd env list`/`select` e come fornire i valori di ambiente in CI/CD
- **🧰 Spiegazioni di `azd restore` e del `azd package` ampliato** in `resources/cheat-sheet.md` — ripristino delle dipendenze e costruzione di un artefatto distribuibile senza effettuare il deploy

#### Modifiche
- **🧭 Tabella delle lezioni del Capitolo 4** aggiornata per includere la nuova lezione "Creazione del proprio template" (Lezione 3)
- **🧭 Tabella delle lezioni del Capitolo 1** aggiornata per includere la nuova lezione "Dev Containers & Codespaces" (Lezione 5); i footer di navigazione collegati tra `bring-your-own-app.md` e `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Esercizio per principianti: Lezione pratica multi-agent, "Bring Your Own App," Terraform e guida CI/CD
**Questa versione chiude le lacune più grandi per una guida completa per principianti aggiungendo due nuove lezioni pratiche (una walkthrough multi-agent distribuibile e l'aggiunta di azd a un'app esistente), un'introduzione per principianti agli hook, una sezione su Terraform con azd, una guida passo-passo alla pipeline GitHub Actions, una spiegazione per le nuove estensioni in preview e una checklist esplicita per la verifica del deployment.**

#### Aggiunte
- **🤝 Nuova lezione del Capitolo 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — una walkthrough completa e pratica, distribuibile, a due agenti (orchestrator + specialisti) usando un template reale (`contoso-creative-writer`), che copre quando usare il multi-agent, il flusso `azd up`, la comprensione delle risorse distribuite, il tracciamento cross-agent, la personalizzazione e la rimozione
- **📦 Nuova lezione del Capitolo 1** `docs/chapter-01-foundation/bring-your-own-app.md` — come aggiungere azd a un progetto esistente con `azd init` ("use code in the current directory"), comprendere `azure.yaml` e `infra/`, `azd infra generate`, rilevamento dell'host e deploy con `azd up`
- **🌐 Terraform con azd** sezione aggiunta a `docs/chapter-04-infrastructure/provisioning.md` — configurazione `infra.provider: terraform`, layout della cartella `.tf`, output `AZURE_*` richiesti e tagging `azd-env-name`, e l'identico flusso di lavoro `azd up` / `azd down` (chiude la lacuna dove il supporto Terraform era menzionato ma veniva mostrato solo Bicep)
- **⚙️ Guida passo-passo GitHub Actions** in `docs/chapter-08-production/production-ai-practices.md` — dal repo GitHub ai deploy automatizzati: `azd pipeline config`, credenziali federate OIDC (nessun secret memorizzato), il `azure-dev.yml` generato e indicazioni su secrets vs variables
- **🪝 Introduzione per principianti "Nuovo agli hook?"** in `docs/chapter-04-infrastructure/deployment-guide.md` — cos'è un hook, una tabella delle fasi degli hook, un hook minimale di esempio e l'esecuzione manuale degli hook con `azd hooks run`
- **✅ Checklist "Verifica il tuo deployment"** aggiunta al Passo 5 di `docs/chapter-01-foundation/first-project.md` — smoke test, controllo dell'endpoint di health e criteri di successo espliciti
- **🧩 Spiegazione per le nuove estensioni in preview** `azure.ai.skills` e `azure.ai.connections` (cosa sono e quando usarle) in `docs/chapter-08-production/production-ai-practices.md`

#### Modifiche
- **🧭 Tabella delle lezioni del Capitolo 5** corretta: `multi-agent-basics.md` è ora la Lezione 1 (l'unica lezione completamente pratica), con etichettatura chiara che la Lezione 2 si trova nel Capitolo 6 e lo scenario Retail è un blueprint architetturale, non un template eseguibile con un solo comando
- **🧭 Tabella delle lezioni del Capitolo 1** ora include la nuova lezione "Bring Your Own App" (Lezione 4)
- **🔗 Footer di navigazione** aggiornati: `first-project.md` ora collega in avanti a `bring-your-own-app.md`

#### Sistemati
- **🧱 Chiuso il gap "Terraform dichiarato ma mancante"** — il corso precedentemente faceva riferimento al supporto Terraform senza mostrarlo
- **🔀 Corrette le cross-link fuorvianti del Capitolo 5** che implicavano l'esistenza di un'implementazione multi-agent completa quando in realtà esisteva solo un blueprint architetturale

#### File aggiornati
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(nuovo)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(nuovo)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**Questa versione riafferma la convalida del corso contro `azd` `1.25.6` (giugno 2026) e l'estensione `azure.ai.agents` `0.1.40-preview`, amplia le linee guida AI da "scaffold an agent" al ciclo di vita completo dell'agente (test → evaluate → optimize → inspect → delete), mette in evidenza le nuove estensioni preview `azure.ai.skills` e `azure.ai.connections`, e nota il rebrand del prodotto ".NET Aspire" in "Aspire".**

#### Aggiunte
- **🔁 Copertura completa del ciclo di vita dell'agente** per principianti e AI engineer in tutta la documentazione:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabella del ciclo di vita (scaffold → test → measure → improve → inspect → clean up) aggiunta alla sezione Extensions and AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — Nuova sezione "Managing the Agent Lifecycle" che tratta `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` e `delete --force`
  - `resources/cheat-sheet.md` — Comandi AI Agent ampliati con `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` e `delete --force`
- **🧩 Nuove estensioni in preview** documentate: `azure.ai.skills` (skill riutilizzabili per agenti) e `azure.ai.connections` (Foundry connections) aggiunte alla tabella delle estensioni e al cheat sheet
- **⏱️ Linee guida sui tempi di risposta** — gli esempi di `azd ai agent invoke` ora indicano che vengono stampati latency totale e time-to-first-byte
- **📌 Banner di versione** nel README radice che indirizza gli studenti a `azd version` e `azd upgrade`

#### Modifiche
- **✅ Baseline di convalida aggiornata** da `azd 1.23.12` (marzo 2026) a `azd 1.25.6` (giugno 2026) in tutti i README dei capitoli e nella documentazione del workshop
- **🤖 Nota sull'estensione del Capitolo 2** aggiornata da `azure.ai.agents` `0.1.18-preview` a `0.1.40-preview`
- **🧪 Esempio di convalida del workshop** (output di `azd version`) aggiornato a `1.25.6`
- **🧭 README "What's New in azd Today"** aggiornato per mettere in evidenza il ciclo di vita end-to-end degli agenti, le nuove estensioni AI e recenti fix di qualità della vita (`azd init` idempotente, `azd auth login` pulizia token scaduti, prompt first-run di `azd tool`)
- **📖 Chapter 2 agents.md (Option 4)** ora indirizza gli studenti ai comandi post-deploy del ciclo di vita invece di fermarsi a `azd up`

#### Sistemati
- **🏷️ Naming del prodotto** — aggiunta una nota sul rebrand Aspire (".NET Aspire" è ora semplicemente "Aspire"); il supporto di azd per Aspire resta invariato
- **🔎 Convalida delle release live** confermata contro il feed delle release della Azure Developer CLI: CLI stabile `1.25.6` (2026-06-12) e `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### File aggiornati
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27
#### Chiarimenti per l'onboarding dei principianti, convalida dell'impostazione e pulizia finale dei comandi AZD
**Questa versione segue la verifica di convalida di AZD 1.23 con una revisione della documentazione focalizzata sui principianti: chiarisce le indicazioni di autenticazione preferendo AZD, aggiunge script di convalida dell'ambiente locale, verifica i comandi chiave contro l'AZD CLI reale e rimuove gli ultimi riferimenti obsoleti ai comandi in inglese al di fuori del changelog.**

#### Aggiunto
- **🧪 Script di convalida dell'installazione per i principianti** con `validate-setup.ps1` e `validate-setup.sh` in modo che gli apprendenti possano confermare gli strumenti necessari prima di iniziare il Capitolo 1
- **✅ Passaggi di convalida iniziale dell'installazione** nel README radice e nel README del Capitolo 1 in modo che i prerequisiti mancanti vengano intercettati prima di `azd up`

#### Modificato
- **🔐 Indicazioni di autenticazione per principianti** ora trattano coerentemente `azd auth login` come il percorso principale per i flussi di lavoro AZD, mentre `az login` è indicato come opzionale a meno che non si utilizzino direttamente comandi Azure CLI
- **📚 Flusso di onboarding del Capitolo 1** ora indirizza gli apprendenti a convalidare il proprio ambiente locale prima dell'installazione, dell'autenticazione e dei primi passaggi di deployment
- **🛠️ Messaggistica del validatore** ora separa chiaramente i requisiti bloccanti dagli avvisi opzionali relativi ad Azure CLI per il percorso principianti basato solo su AZD
- **📖 Documentazione su configurazione, risoluzione dei problemi ed esempi** ora distingue tra l'autenticazione AZD richiesta e l'accesso opzionale con Azure CLI quando entrambi erano precedentemente presentati senza contesto

#### Risolto
- **📋 Rimanenti riferimenti a comandi in inglese** aggiornati alle forme AZD correnti, incluso `azd config show` nel cheat sheet e `azd monitor --overview` dove era prevista la guida alla panoramica del Portale Azure
- **🧭 Affermazioni per principianti nel Capitolo 1** attenuate per evitare promesse eccessive di assenza di errori garantiti o rollback automatici su tutti i template e le risorse Azure
- **🔎 Validazione live della CLI** confermata per il supporto corrente di `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` e `azd down --force --purge`

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

#### Convalida AZD 1.23.12, ampliamento dell'ambiente workshop e aggiornamento dei modelli AI
**Questa versione esegue una verifica della documentazione rispetto ad `azd` `1.23.12`, aggiorna esempi di comandi AZD obsoleti, aggiorna le indicazioni sui modelli AI ai valori predefiniti correnti e amplia le istruzioni del workshop oltre GitHub Codespaces per supportare anche dev container e clone locale.**

#### Aggiunto
- **✅ Note di convalida nei capitoli principali e nella documentazione del workshop** per rendere esplicita la baseline AZD testata per gli apprendenti che usano build CLI più recenti o più vecchie
- **⏱️ Indicazioni sul timeout di deployment** per deployment di app AI di lunga durata usando `azd deploy --timeout 1800`
- **🔎 Passaggi per ispezionare le estensioni** con `azd extension show azure.ai.agents` nella documentazione dei flussi di lavoro AI
- **🌐 Indicazioni più ampie per l'ambiente del workshop** che coprono GitHub Codespaces, dev container e clone locale con MkDocs

#### Modificato
- **📚 README introduttivi dei capitoli** ora indicano coerentemente la convalida contro `azd 1.23.12` per foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting e production
- **🛠️ Riferimenti ai comandi AZD** aggiornati alle forme correnti nei documenti:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` o `azd env get-value(s)` a seconda del contesto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` quando si intende la panoramica di Application Insights
- **🧪 Esempi di anteprima di provisioning** semplificati all'uso supportato corrente come `azd provision --preview` e `azd provision --preview -e production`
- **🧭 Flusso del workshop** aggiornato in modo che gli apprendenti possano completare i laboratori in Codespaces, in un dev container o in un clone locale invece di assumere l'esecuzione esclusiva in Codespaces
- **🔐 Indicazioni di autenticazione** ora preferiscono `azd auth login` per i flussi di lavoro AZD, con `az login` posizionato come opzionale quando si utilizzano direttamente comandi Azure CLI

#### Risolto
- **🪟 Comandi di installazione su Windows** normalizzati alla corretta capitalizzazione dei pacchetti `winget` nella guida di installazione
- **🐧 Indicazioni di installazione Linux** corrette per evitare istruzioni specifiche di distro non supportate per `azd` e invece rimandare agli asset di rilascio dove opportuno
- **📦 Esempi di modelli AI** aggiornati da vecchi predefiniti come `gpt-35-turbo` e `text-embedding-ada-002` a esempi correnti quali `gpt-4.1-mini`, `gpt-4.1` e `text-embedding-3-large`
- **📋 Frammenti di deployment e diagnostica** corretti per usare comandi di ambiente e di stato attuali in log, script e passaggi di troubleshooting
- **⚙️ Indicazioni per GitHub Actions** aggiornate da `Azure/setup-azd@v1.0.0` a `Azure/setup-azd@v2`
- **🤖 Linee guida MCP/Copilot sul consenso** aggiornate da `azd mcp consent` a `azd copilot consent list`

#### Migliorato
- **🧠 Guida del capitolo AI** ora spiega meglio il comportamento preview-sensibile di `azd ai`, il login tenant-specifico, l'uso delle estensioni corrente e le raccomandazioni aggiornate per il deployment di modelli
- **🧪 Istruzioni del workshop** ora utilizzano esempi di versione più realistici e un linguaggio più chiaro per la configurazione dell'ambiente nei laboratori pratici
- **📈 Documenti di produzione e troubleshooting** ora si allineano meglio con il monitoraggio attuale, i modelli di fallback e gli esempi di tier di costo

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

#### Comandi AZD AI CLI, convalida dei contenuti ed espansione dei template
**Questa versione aggiunge la copertura per `azd ai`, `azd extension` e `azd mcp` in tutti i capitoli correlati all'AI, corregge link rotti e codice deprecato in agents.md, aggiorna il cheat sheet e ristruttura la sezione Example Templates con descrizioni validate e nuovi template Azure AI AZD.**

#### Aggiunto
- **🤖 Copertura AZD AI CLI** estesa su 7 file (precedentemente solo nel Capitolo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nuova sezione "Extensions and AI Commands" che introduce `azd extension`, `azd ai agent init` e `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opzione 4: `azd ai agent init` con tabella di confronto (approccio template vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Sottosezioni "AZD Extensions for Foundry" e "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start ora mostra percorsi di deployment basati sia su template che su manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sezione Deploy ora include l'opzione `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Sottosezione "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nuova sezione "AI & Extensions Commands" con `azd extension`, `azd ai agent init`, `azd mcp` e `azd infra generate`
- **📦 Nuovi template di esempio AZD AI** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — chat RAG .NET con Blazor WebAssembly, Semantic Kernel e supporto voce
  - **azure-search-openai-demo-java** — chat RAG Java che usa Langchain4J con opzioni di deployment ACA/AKS
  - **contoso-creative-writer** — app multi-agente per scrittura creativa usando Azure AI Agent Service, Bing Grounding e Prompty
  - **serverless-chat-langchainjs** — RAG serverless usando Azure Functions + LangChain.js + Cosmos DB con supporto Ollama per sviluppo locale
  - **chat-with-your-data-solution-accelerator** — accelerator RAG enterprise con portale admin, integrazione Teams e opzioni PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — app di riferimento per orchestrazione MCP multi-agente con server in .NET, Python, Java e TypeScript
  - **azd-ai-starter** — template starter Bicep per infrastruttura minima Azure AI
  - **🔗 Link alla galleria Awesome AZD AI** — Riferimento alla [galleria awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ template)

#### Risolto
- **🔗 Navigazione in agents.md**: i link Previous/Next ora corrispondono all'ordine delle lezioni del README del Capitolo 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Link rotti in agents.md**: `production-ai-practices.md` corretto in `../chapter-08-production/production-ai-practices.md` (3 occorrenze)
- **📦 Codice deprecato in agents.md**: `opencensus` sostituito con `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API non valida in agents.md**: `max_tokens` spostato da `create_agent()` a `create_run()` come `max_completion_tokens`
- **🔢 Conteggio token in agents.md**: sostituita la stima approssimativa `len//4` con `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Servizi corretti da "Cognitive Search + App Service" a "Azure AI Search + Azure Container Apps" (host predefinito cambiato ott 2024)
- **contoso-chat**: Descrizione aggiornata per riferirsi a Azure AI Foundry + Prompty, in linea con il titolo e lo stack tecnologico reali del repository

#### Rimosso
- **ai-document-processing**: Rimosso riferimento a template non funzionante (repo non accessibile pubblicamente come template AZD)

#### Migliorato
- **📝 Esercizi in agents.md**: L'Esercizio 1 ora mostra l'output atteso e il passaggio `azd monitor`; l'Esercizio 2 include il codice completo di registrazione di `FunctionTool`; l'Esercizio 3 sostituisce indicazioni vaghe con comandi concreti `prepdocs.py`
- **📚 Risorse in agents.md**: Link alla documentazione aggiornati alle attuali doc di Azure AI Agent Service e quickstart
- **📋 Tabella Next Steps in agents.md**: Aggiunto link al laboratorio AI Workshop per copertura completa del capitolo

#### File aggiornati
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05
#### Miglioramento della navigazione del corso
**Questa versione migliora la navigazione dei capitoli in README.md con un formato di tabella migliorato.**

#### Modificato
- **Tabella della mappa del corso**: migliorata con collegamenti diretti alle lezioni, stime di durata e valutazioni di complessità
- **Pulizia delle cartelle**: rimosse cartelle vecchie ridondanti (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validazione dei collegamenti**: tutti i 21+ collegamenti interni nella tabella della Mappa del Corso verificati

### [v3.16.0] - 2026-02-05

#### Aggiornamenti dei nomi dei prodotti
**Questa versione aggiorna i riferimenti ai prodotti per riflettere il branding Microsoft corrente.**

#### Modificato
- **Microsoft Foundry → Microsoft Foundry**: tutti i riferimenti aggiornati nei file non di traduzione
- **Azure AI Agent Service → Foundry Agents**: nome del servizio aggiornato per riflettere il branding attuale

#### File aggiornati
- `README.md` - Main course landing page
- `changelog.md` - Version history
- `course-outline.md` - Course structure
- `docs/chapter-02-ai-development/agents.md` - AI agents guide
- `examples/README.md` - Examples documentation
- `workshop/README.md` - Workshop landing page
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - All workshop instruction files

---

### [v3.15.0] - 2026-02-05

#### Ristrutturazione importante del repository: nomi delle cartelle basati sui capitoli
**Questa versione ristruttura la documentazione in cartelle dedicate per capitolo per una navigazione più chiara.**

#### Ridenominazione delle cartelle
Le vecchie cartelle sono state sostituite con cartelle numerate per capitolo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Migrazione dei file
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

#### Aggiunto
- **📚 File README dei capitoli**: creato README.md in ogni cartella del capitolo con:
  - Obiettivi di apprendimento e durata
  - Tabella delle lezioni con descrizioni
  - Comandi di avvio rapido
  - Navigazione verso altri capitoli

#### Modificato
- **🔗 Aggiornati tutti i collegamenti interni**: oltre 78 percorsi aggiornati in tutti i file della documentazione
- **🗺️ README.md principale**: Mappa del Corso aggiornata con la nuova struttura dei capitoli
- **📝 examples/README.md**: riferimenti incrociati aggiornati alle cartelle dei capitoli

#### Rimosso
- Struttura di cartelle vecchia (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Ristrutturazione del repository: navigazione per capitoli
**Questa versione ha aggiunto file README per la navigazione dei capitoli (sostituiti da v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nuova guida agli agenti AI
**Questa versione aggiunge una guida completa per distribuire agenti AI con Azure Developer CLI.**

#### Aggiunto
- **🤖 docs/microsoft-foundry/agents.md**: guida completa che copre:
  - Cosa sono gli agenti AI e come differiscono dai chatbot
  - Tre template agenti per avvio rapido (Foundry Agents, Prompty, RAG)
  - Pattern di architettura degli agenti (single agent, RAG, multi-agent)
  - Configurazione e personalizzazione degli strumenti
  - Monitoraggio e tracciamento delle metriche
  - Considerazioni sui costi e ottimizzazione
  - Scenari comuni di risoluzione dei problemi
  - Tre esercizi pratici con criteri di successo

#### Struttura dei contenuti
- **Introduzione**: concetti sugli agenti per principianti
- **Avvio rapido**: distribuire agenti con `azd init --template get-started-with-ai-agents`
- **Pattern di architettura**: diagrammi visivi dei pattern degli agenti
- **Configurazione**: configurazione degli strumenti e variabili d'ambiente
- **Monitoraggio**: integrazione con Application Insights
- **Esercizi**: apprendimento pratico progressivo (20-45 minuti ciascuno)

---

### [v3.12.0] - 2026-02-05

#### Aggiornamento dell'ambiente DevContainer
**Questa versione aggiorna la configurazione del contenitore di sviluppo con strumenti moderni e impostazioni predefinite migliori per l'esperienza di apprendimento AZD.**

#### Modificato
- **🐳 Immagine di base**: aggiornata da `python:3.12-bullseye` a `python:3.12-bookworm` (l'ultima release stabile di Debian)
- **📛 Nome del contenitore**: rinominato da "Python 3" a "AZD for Beginners" per chiarezza

#### Aggiunto
- **🔧 Nuove funzionalità del Dev Container**:
  - `azure-cli` con supporto Bicep abilitato
  - `node:20` (versione LTS per i template AZD)
  - `github-cli` per la gestione dei template
  - `docker-in-docker` per il deploy di app in container

  - **🔌 Inoltro porte**: porte preconfigurate per lo sviluppo comune:
    - 8000 (anteprima MkDocs)
    - 3000 (Web app)
    - 5000 (Python Flask)
    - 8080 (API)

  - **🧩 Nuove estensioni VS Code**:
    - `ms-python.vscode-pylance` - IntelliSense Python migliorato
    - `ms-azuretools.vscode-azurefunctions` - supporto per Azure Functions
    - `ms-azuretools.vscode-docker` - supporto Docker
    - `ms-azuretools.vscode-bicep` - supporto per il linguaggio Bicep
    - `ms-azure-devtools.azure-resource-groups` - gestione delle risorse Azure
    - `yzhang.markdown-all-in-one` - modifica Markdown
    - `DavidAnson.vscode-markdownlint` - linting per Markdown
    - `bierner.markdown-mermaid` - supporto per diagrammi Mermaid
    - `redhat.vscode-yaml` - supporto YAML (per azure.yaml)
    - `eamodio.gitlens` - visualizzazione Git
    - `mhutchie.git-graph` - cronologia Git

  - **⚙️ Impostazioni VS Code**: aggiunte impostazioni predefinite per l'interprete Python, la formattazione al salvataggio e il trimming degli spazi bianchi

  - **📦 requirements-dev.txt aggiornato**:
    - Aggiunto plugin MkDocs per la minificazione
    - Aggiunto pre-commit per la qualità del codice
    - Aggiunti pacchetti Azure SDK (azure-identity, azure-mgmt-resource)

#### Corretto
- **Post-Create Command**: ora verifica l'installazione di AZD e Azure CLI all'avvio del contenitore

---

### [v3.11.0] - 2026-02-05

#### Revisione del README per principianti
**Questa versione migliora significativamente il README.md per renderlo più accessibile ai principianti e aggiunge risorse essenziali per gli sviluppatori AI.**

#### Aggiunto
- **🆚 Confronto Azure CLI vs AZD**: spiegazione chiara su quando usare ciascuno strumento con esempi pratici
- **🌟 Link Awesome AZD**: collegamenti diretti alla galleria dei template della community e alle risorse per contribuire:
  - [Galleria Awesome AZD](https://azure.github.io/awesome-azd/) - 200+ template pronti da distribuire
  - [Invia un template](https://github.com/Azure/awesome-azd/issues) - Contributo della community
- **🎯 Guida Quick Start**: sezione semplificata in 3 passaggi per iniziare (Installa → Accedi → Distribuisci)
- **📊 Tabella di navigazione basata sull'esperienza**: guida chiara su dove iniziare in base all'esperienza dello sviluppatore

#### Modificato
- **Struttura del README**: riorganizzata per esposizione progressiva - prima le informazioni più importanti
- **Sezione Introduzione**: riscritta per spiegare "The Magic of `azd up`" ai principianti assoluti
- **Contenuto duplicato rimosso**: eliminata sezione di risoluzione dei problemi duplicata
- **Comandi di risoluzione dei problemi**: corretto il riferimento a `azd logs` per usare il valido `azd monitor --logs`

#### Corretto
- **🔐 Comandi di autenticazione**: aggiunti `azd auth login` e `azd auth logout` a cheat-sheet.md
- **Riferimenti a comandi non validi**: rimosso il restante `azd logs` dalla sezione troubleshooting del README

#### Note
- **Ambito**: modifiche applicate al README.md principale e a resources/cheat-sheet.md
- **Pubblico target**: miglioramenti mirati specificamente agli sviluppatori nuovi ad AZD

---

### [v3.10.0] - 2026-02-05

#### Aggiornamento di accuratezza dei comandi Azure Developer CLI
**Questa versione corregge comandi AZD inesistenti nella documentazione, assicurando che tutti gli esempi di codice utilizzino una sintassi valida dell'Azure Developer CLI.**

#### Corretto
- **🔧 Comandi AZD non esistenti rimossi**: audit completo e correzione dei comandi non validi:
  - `azd logs` (non esiste) → sostituito con `azd monitor --logs` o alternative di Azure CLI
  - `azd service` subcommands (non esistono) → sostituiti con `azd show` e Azure CLI
  - `azd infra import/export/validate` (non esistono) → rimossi o sostituiti con alternative valide
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (non esistono) → rimossi
  - `azd provision --what-if/--rollback` flags (non esistono) → aggiornati per usare `--preview`
  - `azd config validate` (non esiste) → sostituito con `azd config list`
  - `azd info`, `azd history`, `azd metrics` (non esistono) → rimossi

- **📚 File aggiornati con correzioni dei comandi**:
  - `resources/cheat-sheet.md`: Major overhaul of command reference
  - `docs/deployment/deployment-guide.md`: Fixed rollback and deployment strategies
  - `docs/troubleshooting/debugging.md`: Corrected log analysis sections
  - `docs/troubleshooting/common-issues.md`: Updated troubleshooting commands
  - `docs/troubleshooting/ai-troubleshooting.md`: Fixed AZD debugging section
  - `docs/getting-started/azd-basics.md`: Corrected monitoring commands
  - `docs/getting-started/first-project.md`: Updated monitoring and debugging examples
  - `docs/getting-started/installation.md`: Fixed help and version examples
  - `docs/pre-deployment/application-insights.md`: Corrected log viewing commands
  - `docs/pre-deployment/coordination-patterns.md`: Fixed agent debugging commands

#### Modificato
- **Strategie di rollback**: documentazione aggiornata per usare rollback basato su Git (AZD non dispone di rollback nativo)
- **Visualizzazione dei log**: riferimenti a `azd logs` sostituiti con `azd monitor --logs`, `azd monitor --live` e comandi Azure CLI
- **Sezione Prestazioni**: rimossi flag di deployment parallelo/incrementale inesistenti, fornendo alternative valide

#### Dettagli tecnici
- **Comandi AZD validi**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag validi di azd monitor**: `--live`, `--logs`, `--overview`
- **Funzionalità rimosse**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Note
- **Verifica**: comandi validati contro Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Completamento del workshop e aggiornamento della qualità della documentazione
**Questa versione completa i moduli interattivi del workshop, ripara tutti i link della documentazione interrotti e migliora la qualità complessiva dei contenuti per gli sviluppatori AI che utilizzano Microsoft AZD.**

#### Aggiunto
- **📝 CONTRIBUTING.md**: nuovo documento di linee guida per i contributi con:
  - Linee guida per esempi di codice e convenzioni per i messaggi di commit
  - Informazioni sul coinvolgimento della community

#### Completati
- **🎯 Modulo del workshop 7 (Conclusione)**: Modulo di chiusura completamente completato con:
  - Riepilogo completo dei risultati del workshop
  - Sezione dei concetti chiave acquisiti che copre AZD, template e Microsoft Foundry
  - Raccomandazioni per il proseguimento del percorso di apprendimento
  - Esercizi di sfida del workshop con valutazioni di difficoltà
  - Link per feedback della community e supporto

- **📚 Modulo del workshop 3 (Deconstruct)**: Obiettivi di apprendimento aggiornati con:
  - Guida all'attivazione di GitHub Copilot con i server MCP
  - Comprensione della struttura delle cartelle dei template AZD
  - Pattern di organizzazione Infrastructure-as-Code (Bicep)
  - Istruzioni per il laboratorio pratico

- **🔧 Modulo del workshop 6 (Smantellamento)**: Completato con:
  - Obiettivi di pulizia delle risorse e gestione dei costi
  - Uso di `azd down` per il deprovisioning sicuro dell'infrastruttura
  - Guida al recupero dei servizi cognitivi cancellati in modo soft
  - Spunti bonus per esplorazione con GitHub Copilot e Azure Portal

#### Correzioni
- **🔗 Correzioni di link interrotti**: Risolti più di 15 link interni danneggiati:
  - `docs/ai-foundry/ai-model-deployment.md`: Corrette le path verso microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corretti i percorsi ai file ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: Sostituito il non esistente cicd-integration.md con deployment-guide.md
  - `examples/retail-scenario.md`: Corrette le path della FAQ e della guida alla risoluzione dei problemi
  - `examples/container-app/microservices/README.md`: Corretti i percorsi della home del corso e della guida al deployment
  - `resources/faq.md` e `resources/glossary.md`: Aggiornati i riferimenti al capitolo AI
  - `course-outline.md`: Corretti i riferimenti alla guida dell'istruttore e ai laboratori AI del workshop

- **📅 Banner stato del workshop**: Aggiornato da "Under Construction" a stato attivo del workshop con data febbraio 2026

- **🔗 Navigazione del workshop**: Corretti link di navigazione interrotti in README.md del workshop che puntavano alla cartella inesistente lab-1-azd-basics

#### Modifiche
- **Presentazione del workshop**: Rimosso l'avviso "under construction", il workshop è ora completo e pronto all'uso
- **Coerenza della navigazione**: Garantito che tutti i moduli del workshop abbiano una navigazione inter-modulo appropriata
- **Riferimenti al percorso di apprendimento**: Aggiornati i riferimenti incrociati dei capitoli per usare i corretti percorsi microsoft-foundry

#### Validato
- ✅ Tutti i file markdown in inglese hanno link interni validi
- ✅ I moduli del workshop 0-7 sono completi con obiettivi di apprendimento
- ✅ La navigazione tra capitoli e moduli funziona correttamente
- ✅ Il contenuto è adatto agli sviluppatori AI che utilizzano Microsoft AZD
- ✅ Linguaggio e struttura adatti ai principianti mantenuti in tutto il contenuto
- ✅ CONTRIBUTING.md fornisce linee guida chiare per i contributori della community

#### Implementazione tecnica
- **Link Validation**: Script PowerShell automatizzato ha verificato tutti i link interni .md
- **Content Audit**: Revisione manuale della completezza del workshop e dell'idoneità per i principianti
- **Navigation System**: Applicati pattern di navigazione coerenti tra capitoli e moduli

#### Note
- **Scope**: Modifiche applicate solo alla documentazione in inglese
- **Translations**: Le cartelle di traduzione non sono state aggiornate in questa versione (la traduzione automatica si sincronizzerà in seguito)
- **Workshop Duration**: Il workshop completo ora offre 3-4 ore di apprendimento pratico

---

### [v3.8.0] - 2025-11-19

#### Documentazione avanzata: Monitoraggio, Sicurezza e Pattern multi-agente
**Questa versione aggiunge lezioni complete di livello A su integrazione di Application Insights, pattern di autenticazione e coordinazione multi-agente per deployment di produzione.**

#### Aggiunto
- **📊 Lezione integrazione Application Insights**: in `docs/pre-deployment/application-insights.md`:
  - Deployment incentrato su AZD con provisioning automatico
  - Template Bicep completi per Application Insights + Log Analytics
  - Applicazioni Python funzionanti con telemetria personalizzata (oltre 1.200 righe)
  - Pattern di monitoraggio AI/LLM (monitoraggio token/costi per Microsoft Foundry Models)
  - 6 diagrammi Mermaid (architettura, tracciamento distribuito, flusso di telemetria)
  - 3 esercizi pratici (alert, dashboard, monitoraggio AI)
  - Esempi di query Kusto e strategie di ottimizzazione dei costi
  - Streaming metriche in tempo reale e debugging in tempo reale
  - Tempo di apprendimento 40-50 minuti con pattern pronti per la produzione

- **🔐 Lezione su pattern di autenticazione e sicurezza**: in `docs/getting-started/authsecurity.md`:
  - 3 pattern di autenticazione (connection string, Key Vault, managed identity)
  - Template Bicep completi per infrastrutture per deployment sicuri
  - Codice applicazione Node.js con integrazione Azure SDK
  - 3 esercizi completi (abilitare managed identity, user-assigned identity, rotazione di Key Vault)
  - Best practice di sicurezza e configurazioni RBAC
  - Guida alla risoluzione dei problemi e analisi dei costi
  - Pattern di autenticazione passwordless pronti per la produzione

- **🤖 Lezione su pattern di coordinazione multi-agente**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 pattern di coordinazione (sequenziale, parallelo, gerarchico, event-driven, consenso)
  - Implementazione completa del servizio orchestratore (Python/Flask, oltre 1.500 righe)
  - 3 implementazioni di agenti specializzati (Research, Writer, Editor)
  - Integrazione con Service Bus per l'accodamento dei messaggi
  - Gestione dello stato con Cosmos DB per sistemi distribuiti
  - 6 diagrammi Mermaid che mostrano le interazioni tra agenti
  - 3 esercizi avanzati (gestione timeout, logica di retry, circuit breaker)
  - Analisi dei costi ($240-565/month) con strategie di ottimizzazione
  - Integrazione con Application Insights per il monitoraggio

#### Migliorato
- **Capitolo Pre-deployment**: Ora include pattern completi di monitoraggio e coordinazione
- **Capitolo Getting Started**: Potenziato con pattern di autenticazione professionali
- **Prontezza per la produzione**: Copertura completa dalla sicurezza all'osservabilità
- **Struttura del corso**: Aggiornata per riferire alle nuove lezioni nei Capitoli 3 e 6

#### Modificato
- **Progressione di apprendimento**: Migliore integrazione di sicurezza e monitoraggio in tutto il corso
- **Qualità della documentazione**: Standard coerenti di livello A (95-97%) nelle nuove lezioni
- **Pattern di produzione**: Copertura end-to-end completa per deployment enterprise

#### Migliorato
- **Esperienza sviluppatore**: Percorso chiaro dallo sviluppo al monitoraggio in produzione
- **Standard di sicurezza**: Pattern professionali per autenticazione e gestione dei segreti
- **Osservabilità**: Integrazione completa di Application Insights con AZD
- **Carichi di lavoro AI**: Monitoraggio specializzato per Microsoft Foundry Models e sistemi multi-agente

#### Validato
- ✅ Tutte le lezioni includono codice funzionante completo (non snippet)
- ✅ Diagrammi Mermaid per apprendimento visivo (19 in totale nelle 3 lezioni)
- ✅ Esercizi pratici con passi di verifica (9 in totale)
- ✅ Template Bicep pronti per la produzione distribuibili tramite `azd up`
- ✅ Analisi dei costi e strategie di ottimizzazione
- ✅ Guide alla risoluzione dei problemi e best practice
- ✅ Checkpoint di conoscenza con comandi di verifica

#### Risultati della valutazione della documentazione
- **docs/pre-deployment/application-insights.md**: - Guida completa al monitoraggio
- **docs/getting-started/authsecurity.md**: - Pattern professionali di sicurezza
- **docs/pre-deployment/coordination-patterns.md**: - Architetture multi-agente avanzate
- **Contenuto nuovo complessivo**: - Standard coerenti di alta qualità

#### Implementazione tecnica
- **Application Insights**: Log Analytics + telemetria personalizzata + tracciamento distribuito
- **Autenticazione**: Managed Identity + Key Vault + pattern RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrazione
- **Monitoraggio**: Metriche live + query Kusto + alert + dashboard
- **Gestione dei costi**: Strategie di sampling, politiche di retention, controlli del budget

### [v3.7.0] - 2025-11-19

#### Miglioramenti della qualità della documentazione e nuovo esempio Microsoft Foundry Models
**Questa versione migliora la qualità della documentazione nel repository e aggiunge un esempio completo di deployment di Microsoft Foundry Models con interfaccia chat gpt-4.1.**

#### Aggiunto
- **🤖 Esempio chat Microsoft Foundry Models**: Deployment completo gpt-4.1 con implementazione funzionante in `examples/azure-openai-chat/`:
  - Infrastruttura completa Microsoft Foundry Models (deployment del modello gpt-4.1)
  - Interfaccia chat a riga di comando Python con cronologia delle conversazioni
  - Integrazione Key Vault per archiviazione sicura delle API key
  - Tracciamento dell'uso dei token e stima dei costi
  - Rate limiting e gestione degli errori
  - README completo con guida al deployment di 35-45 minuti
  - 11 file pronti per la produzione (template Bicep, app Python, configurazione)
- **📚 Esercizi di documentazione**: Aggiunti esercizi pratici alla guida di configurazione:
  - Esercizio 1: Configurazione multi-ambiente (15 minuti)
  - Esercizio 2: Pratica di gestione dei segreti (10 minuti)
  - Criteri di successo chiari e passi di verifica
- **✅ Verifica del deployment**: Aggiunta sezione di verifica alla guida al deployment:
  - Procedure di health check
  - Checklist dei criteri di successo
  - Output attesi per tutti i comandi di deployment
  - Riferimento rapido per la risoluzione dei problemi

#### Potenziato
- **examples/README.md**: Aggiornato a qualità di livello A (93%):
  - Aggiunto azure-openai-chat a tutte le sezioni rilevanti
  - Aggiornato il conteggio degli esempi locali da 3 a 4
  - Aggiunto alla tabella Esempi applicazioni AI
  - Integrato nel Quick Start per utenti intermedi
  - Aggiunto alla sezione Microsoft Foundry Templates
  - Aggiornata la Comparison Matrix e le sezioni di ricerca tecnologica
- **Qualità della documentazione**: Migliorata B+ (87%) → A- (92%) nella cartella docs:
  - Aggiunti output attesi agli esempi di comandi critici
  - Inclusi passi di verifica per le modifiche di configurazione
  - Apprendimento pratico potenziato con esercizi pratici

#### Modificato
- **Progressione di apprendimento**: Migliore integrazione di esempi AI per apprendenti intermedi
- **Struttura della documentazione**: Esercizi più concreti con risultati chiari
- **Processo di verifica**: Criteri di successo espliciti aggiunti ai workflow chiave

#### Migliorato
- **Esperienza sviluppatore**: Il deployment di Microsoft Foundry Models ora richiede 35-45 minuti (vs 60-90 per alternative complesse)
- **Trasparenza dei costi**: Stime dei costi chiare ($50-200/month) per l'esempio Microsoft Foundry Models
- **Percorso di apprendimento**: Gli sviluppatori AI hanno un punto di ingresso chiaro con azure-openai-chat
- **Standard della documentazione**: Output attesi e passi di verifica coerenti

#### Validato
- ✅ L'esempio Microsoft Foundry Models è completamente funzionante con `azd up`
- ✅ Tutti gli 11 file di implementazione sono sintatticamente corretti
- ✅ Le istruzioni del README corrispondono all'esperienza reale di deployment
- ✅ Link della documentazione aggiornati in oltre 8 posizioni
- ✅ L'indice degli esempi riflette accuratamente 4 esempi locali
- ✅ Nessun link esterno duplicato nelle tabelle
- ✅ Tutti i riferimenti di navigazione corretti

#### Implementazione tecnica
- **Architettura Microsoft Foundry Models**: modello gpt-4.1 + Key Vault + pattern Container Apps
- **Sicurezza**: Pronto per Managed Identity, segreti in Key Vault
- **Monitoraggio**: Integrazione Application Insights
- **Gestione dei costi**: Tracciamento token e ottimizzazione dell'uso
- **Deployment**: Singolo comando `azd up` per la configurazione completa

### [v3.6.0] - 2025-11-19

#### Aggiornamento importante: Esempi di deployment per Container App
**Questa versione introduce esempi completi e pronti per la produzione di deployment di applicazioni containerizzate usando Azure Developer CLI (AZD), con documentazione completa e integrazione nel percorso di apprendimento.**

#### Aggiunto
- **🚀 Esempi Container App**: Nuovi esempi locali in `examples/container-app/`:
  - [Guida principale](examples/container-app/README.md): Panoramica completa dei deployment containerizzati, quick start, produzione e pattern avanzati
  - [Simple Flask API](../../examples/container-app/simple-flask-api): API REST per principianti con scale-to-zero, probe di salute, monitoraggio e risoluzione dei problemi
  - [Architettura Microservizi](../../examples/container-app/microservices): Deployment multi-servizio pronto per la produzione (API Gateway, Product, Order, User, Notification), messaging asincrono, Service Bus, Cosmos DB, Azure SQL, tracciamento distribuito, deployment blue-green/canary
- Best practice: Sicurezza, monitoraggio, ottimizzazione dei costi e linee guida CI/CD per carichi di lavoro containerizzati
- Esempi di codice: `azure.yaml` completo, template Bicep e implementazioni multi-linguaggio dei servizi (Python, Node.js, C#, Go)
- Testing & Troubleshooting: scenari di test end-to-end, comandi di monitoraggio, guida alla risoluzione dei problemi

#### Modificato
- **README.md**: Aggiornato per includere e linkare i nuovi esempi Container App sotto "Local Examples - Container Applications"
- **examples/README.md**: Aggiornato per evidenziare gli esempi container app, aggiungere voci alla comparison matrix e aggiornare riferimenti tecnologici/architetturali
- **Course Outline & Study Guide**: Aggiornati per riferire ai nuovi esempi Container App e ai pattern di deployment nei capitoli rilevanti

#### Validato
- ✅ Tutti i nuovi esempi distribuibili con `azd up` e seguono le best practice
- ✅ Cross-link della documentazione e navigazione aggiornati
- ✅ Gli esempi coprono scenari da principianti ad avanzati, inclusi microservizi per la produzione

#### Note
- **Scope**: Documentazione ed esempi in inglese solamente
- **Next Steps**: Espandere con ulteriori pattern container avanzati e automazione CI/CD nelle versioni future

### [v3.5.0] - 2025-11-19

#### Rebranding del prodotto: Microsoft Foundry
**Questa versione implementa un aggiornamento completo del nome del prodotto da "Microsoft Foundry" a "Microsoft Foundry" in tutta la documentazione in inglese, riflettendo il rebranding ufficiale di Microsoft.**

#### Modificato
- **🔄 Aggiornamento nome del prodotto**: Rebranding completo da "Microsoft Foundry" a "Microsoft Foundry"
  - Aggiornate tutte le referenze nella documentazione in inglese nella cartella `docs/`
  - Rinominata cartella: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renamed file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 content references updated across 7 documentation files

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` renamed to `docs/microsoft-foundry/`
  - All cross-references updated to reflect new folder structure
  - Navigation links validated across all documentation

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - All internal links updated to reference new filename

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigation link updates
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 product name references updated
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Already using Microsoft Foundry (from previous updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 references updated (overview, community feedback, documentation)
  - `docs/getting-started/azd-basics.md` - 4 cross-reference links updated
  - `docs/getting-started/first-project.md` - 2 chapter navigation links updated
  - `docs/getting-started/installation.md` - 2 next chapter links updated
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 references updated (navigation, Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 navigation link updated
  - `docs/troubleshooting/debugging.md` - 1 navigation link updated

- **Course Structure Files** (2 files):
  - `README.md` - 17 references updated (course overview, chapter titles, templates section, community insights)
  - `course-outline.md` - 14 references updated (overview, learning objectives, chapter resources)

#### Validated
- ✅ Zero remaining "ai-foundry" folder path references in English docs
- ✅ Zero remaining "Microsoft Foundry" product name references in English docs
- ✅ All navigation links functional with new folder structure
- ✅ File and folder renames completed successfully
- ✅ Cross-references between chapters validated

#### Notes
- **Scope**: Changes applied to English documentation in `docs/` folder only
- **Translations**: Translation folders (`translations/`) not updated in this version
- **Workshop**: Workshop materials (`workshop/`) not updated in this version
- **Examples**: Example files may still reference legacy naming (to be addressed in future update)
- **External Links**: External URLs and GitHub repository references remain unchanged

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**This version introduces comprehensive support for the new Azure Developer CLI preview feature and enhances workshop user experience.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: Comprehensive coverage of the new infrastructure preview capability
  - Command reference and usage examples in cheat sheet
  - Detailed integration in provisioning guide with use cases and benefits
  - Pre-flight check integration for safer deployment validation
  - Getting started guide updates with safety-first deployment practices
- **🚧 Workshop Status Banner**: Professional HTML banner indicating workshop development status
  - Gradient design with construction indicators for clear user communication
  - Last updated timestamp for transparency
  - Mobile-responsive design for all device types

#### Enhanced
- **Infrastructure Safety**: Preview functionality integrated throughout deployment documentation
- **Pre-deployment Validation**: Automated scripts now include infrastructure preview testing
- **Developer Workflow**: Updated command sequences to include preview as best practice
- **Workshop Experience**: Clear expectations set for users about content development status

#### Changed
- **Deployment Best Practices**: Preview-first workflow now recommended approach
- **Documentation Flow**: Infrastructure validation moved earlier in learning process
- **Workshop Presentation**: Professional status communication with clear development timeline

#### Improved
- **Safety-First Approach**: Infrastructure changes can now be validated before deployment
- **Team Collaboration**: Preview results can be shared for review and approval
- **Cost Awareness**: Better understanding of resource costs before provisioning
- **Risk Mitigation**: Reduced deployment failures through advance validation

#### Technical Implementation
- **Multi-document Integration**: Preview feature documented across 4 key files
- **Command Patterns**: Consistent syntax and examples throughout documentation
- **Best Practice Integration**: Preview included in validation workflows and scripts
- **Visual Indicators**: Clear NEW feature markings for discoverability

#### Workshop Infrastructure
- **Status Communication**: Professional HTML banner with gradient styling
- **User Experience**: Clear development status prevents confusion
- **Professional Presentation**: Maintains repository credibility while setting expectations
- **Timeline Transparency**: October 2025 last updated timestamp for accountability

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**This version introduces comprehensive workshop materials with browser-based interactive guides and structured learning paths.**

#### Added
- **🎥 Interactive Workshop Guide**: Browser-based workshop experience with MkDocs preview capability
- **📝 Structured Workshop Instructions**: 7-step guided learning path from discovery to customization
  - 0-Introduction: Workshop overview and setup
  - 1-Select-AI-Template: Template discovery and selection process
  - 2-Validate-AI-Template: Deployment and validation procedures
  - 3-Deconstruct-AI-Template: Understanding template architecture
  - 4-Configure-AI-Template: Configuration and customization
  - 5-Customize-AI-Template: Advanced modifications and iterations
  - 6-Teardown-Infrastructure: Cleanup and resource management
  - 7-Wrap-up: Summary and next steps
- **🛠️ Workshop Tooling**: MkDocs configuration with Material theme for enhanced learning experience
- **🎯 Hands-On Learning Path**: 3-step methodology (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Seamless development environment setup

#### Enhanced
- **AI Workshop Lab**: Extended with comprehensive 2-3 hour structured learning experience
- **Workshop Documentation**: Professional presentation with navigation and visual aids
- **Learning Progression**: Clear step-by-step guidance from template selection to production deployment
- **Developer Experience**: Integrated tooling for streamlined development workflows

#### Improved
- **Accessibility**: Browser-based interface with search, copy functionality, and theme toggle
- **Self-Paced Learning**: Flexible workshop structure accommodating different learning speeds
- **Practical Application**: Real-world AI template deployment scenarios
- **Community Integration**: Discord integration for workshop support and collaboration

#### Workshop Features
- **Built-in Search**: Quick keyword and lesson discovery
- **Copy Code Blocks**: Hover-to-copy functionality for all code examples
- **Theme Toggle**: Dark/light mode support for different preferences
- **Visual Assets**: Screenshots and diagrams for enhanced understanding
- **Help Integration**: Direct Discord access for community support

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**This version introduces a comprehensive chapter-based learning structure with enhanced navigation throughout the entire repository.**

#### Added
- **📚 Chapter-Based Learning System**: Restructured entire course into 8 progressive learning chapters
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: Consistent navigation headers and footers across all documentation
- **🎯 Progress Tracking**: Course completion checklist and learning verification system
- **🗺️ Learning Path Guidance**: Clear entry points for different experience levels and goals
- **🔗 Cross-Reference Navigation**: Related chapters and prerequisites clearly linked

#### Enhanced
- **README Structure**: Transformed into a structured learning platform with chapter-based organization
- **Documentation Navigation**: Every page now includes chapter context and progression guidance
- **Template Organization**: Examples and templates mapped to appropriate learning chapters
- **Resource Integration**: Cheat sheets, FAQs, and study guides connected to relevant chapters
- **Workshop Integration**: Hands-on labs mapped to multiple chapter learning objectives

#### Changed
- **Learning Progression**: Moved from linear documentation to flexible chapter-based learning
- **Configuration Placement**: Repositioned configuration guide as Chapter 3 for better learning flow
- **AI Content Integration**: Better integration of AI-specific content throughout the learning journey
- **Production Content**: Advanced patterns consolidated in Chapter 8 for enterprise learners

#### Improved
- **User Experience**: Clear navigation breadcrumbs and chapter progression indicators
- **Accessibility**: Consistent navigation patterns for easier course traversal
- **Professional Presentation**: University-style course structure suitable for academic and corporate training
- **Learning Efficiency**: Reduced time to find relevant content through improved organization

#### Technical Implementation
- **Navigation Headers**: Standardized chapter navigation across 40+ documentation files
- **Footer Navigation**: Consistent progression guidance and chapter completion indicators
- **Cross-Linking**: Comprehensive internal linking system connecting related concepts
- **Chapter Mapping**: Templates and examples clearly associated with learning objectives

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Restructured study guide to align with 8-chapter system
- **🎯 Chapter-Based Assessment**: Each chapter includes specific learning objectives and practical exercises
- **📋 Progress Tracking**: Weekly learning schedule with measurable outcomes and completion checklists
- **❓ Assessment Questions**: Knowledge validation questions for each chapter with professional outcomes
- **🛠️ Practical Exercises**: Hands-on activities with real deployment scenarios and troubleshooting
- **📊 Skill Progression**: Clear advancement from basic concepts to enterprise patterns with career development focus
- **🎓 Certification Framework**: Professional development outcomes and community recognition system
- **⏱️ Timeline Management**: Structured 10-week learning plan with milestone validation

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**This version improves the multi-agent retail solution with better agent naming and enhanced documentation.**

#### Changed
- **Multi-Agent Terminology**: Replaced "Cora agent" with "Customer agent" throughout retail multi-agent solution for clearer understanding
- **Agent Architecture**: Updated all documentation, ARM templates, and code examples to use consistent "Customer agent" naming
- **Configuration Examples**: Modernized agent configuration patterns with updated naming conventions
- **Documentation Consistency**: Ensured all references use professional, descriptive agent names

#### Enhanced
- **ARM Template Package**: Updated retail-multiagent-arm-template with Customer agent references
- **Architecture Diagrams**: Refreshed Mermaid diagrams with updated agent naming
- **Code Examples**: Python classes and implementation examples now use CustomerAgent naming
- **Environment Variables**: Updated all deployment scripts to use CUSTOMER_AGENT_NAME conventions

#### Improved
- **Developer Experience**: Clearer agent roles and responsibilities in documentation
- **Production Readiness**: Better alignment with enterprise naming conventions
- **Learning Materials**: More intuitive agent naming for educational purposes
- **Template Usability**: Simplified understanding of agent functions and deployment patterns

#### Technical Details
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**This version transforms the repository into a comprehensive AI-focused learning resource with Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: Complete restructure prioritizing AI developers and engineers
- **Microsoft Foundry Integration Guide**: Comprehensive documentation for connecting AZD with Microsoft Foundry services
- **AI Model Deployment Patterns**: Detailed guide covering model selection, configuration, and production deployment strategies
- **AI Workshop Lab**: workshop pratico di 2-3 ore per convertire applicazioni AI in soluzioni distribuibili con AZD
- **Production AI Best Practices**: pattern pronti per l'azienda per scalare, monitorare e mettere in sicurezza i carichi di lavoro AI
- **AI-Specific Troubleshooting Guide**: guida completa alla risoluzione dei problemi per Microsoft Foundry Models, Cognitive Services e problemi di distribuzione AI
- **AI Template Gallery**: raccolta in primo piano di template Microsoft Foundry con valutazioni di complessità
- **Workshop Materials**: struttura completa del workshop con laboratori pratici e materiali di riferimento

#### Migliorato
- **README Structure**: rivolto agli sviluppatori AI con dati di interesse della community al 45% dal Microsoft Foundry Discord
- **Learning Paths**: percorso dedicato per sviluppatori AI insieme ai percorsi tradizionali per studenti e ingegneri DevOps
- **Template Recommendations**: template AI in evidenza inclusi azure-search-openai-demo, contoso-chat, and openai-chat-app-quickstart
- **Community Integration**: supporto alla community Discord potenziato con canali e discussioni specifiche per l'AI

#### Focus su Sicurezza e Produzione
- **Managed Identity Patterns**: configurazioni di autenticazione e sicurezza specifiche per l'AI
- **Cost Optimization**: tracciamento dell'uso dei token e controlli di budget per i carichi di lavoro AI
- **Multi-Region Deployment**: strategie per la distribuzione globale di applicazioni AI
- **Performance Monitoring**: metriche specifiche per l'AI e integrazione con Application Insights

#### Qualità della documentazione
- **Linear Course Structure**: progressione logica dai pattern di deployment AI per principianti fino agli avanzati
- **Validated URLs**: tutti i link ai repository esterni verificati e accessibili
- **Complete Reference**: tutti i link alla documentazione interna validati e funzionanti
- **Production Ready**: pattern di distribuzione enterprise con esempi reali

### [v2.0.0] - 2025-09-09

#### Modifiche principali - Ristrutturazione del repository e miglioramento professionale
**Questa versione rappresenta una revisione significativa della struttura del repository e della presentazione dei contenuti.**

#### Aggiunto
- **Structured Learning Framework**: tutte le pagine di documentazione includono ora sezioni Introduzione, Obiettivi di apprendimento e Risultati di apprendimento
- **Navigation System**: aggiunti link Lezione precedente/Successiva in tutta la documentazione per una progressione guidata nell'apprendimento
- **Study Guide**: study-guide.md completo con obiettivi di apprendimento, esercizi pratici e materiali di valutazione
- **Professional Presentation**: rimosse tutte le icone emoji per migliorare l'accessibilità e l'aspetto professionale
- **Enhanced Content Structure**: migliorata l'organizzazione e il flusso dei materiali di apprendimento

#### Modificato
- **Documentation Format**: standardizzata tutta la documentazione con una struttura coerente incentrata sull'apprendimento
- **Navigation Flow**: implementata una progressione logica attraverso tutti i materiali didattici
- **Content Presentation**: rimosso elementi decorativi a favore di una formattazione chiara e professionale
- **Link Structure**: aggiornati tutti i link interni per supportare il nuovo sistema di navigazione

#### Migliorato
- **Accessibility**: rimosse le dipendenze dalle emoji per una migliore compatibilità con gli screen reader
- **Professional Appearance**: presentazione pulita in stile accademico adatta all'apprendimento aziendale
- **Learning Experience**: approccio strutturato con obiettivi e risultati chiari per ogni lezione
- **Content Organization**: migliore flusso logico e connessione tra argomenti correlati

### [v1.0.0] - 2025-09-09

#### Rilascio iniziale - Repository di apprendimento AZD completo

#### Aggiunto
- **Core Documentation Structure**
  - Guida completa getting-started
  - Documentazione completa su deployment e provisioning
  - Risorse dettagliate per la risoluzione dei problemi e guide al debug
  - Strumenti e procedure di validazione pre-distribuzione

- **Getting Started Module**
  - Fondamenti di AZD: concetti e terminologia fondamentali
  - Guida all'installazione: istruzioni di setup specifiche per piattaforma
  - Guida alla configurazione: impostazione dell'ambiente e autenticazione
  - Primo progetto tutorial: apprendimento pratico passo dopo passo

- **Deployment and Provisioning Module**
  - Guida al deployment: documentazione completa del workflow
  - Guida al provisioning: Infrastructure as Code con Bicep
  - Best practice per i deployment in produzione
  - Pattern di architettura multi-servizio

- **Pre-deployment Validation Module**
  - Capacity Planning: validazione della disponibilità delle risorse Azure
  - SKU Selection: guida completa alle classi di servizio
  - Pre-flight Checks: script di validazione automatica (PowerShell e Bash)
  - Strumenti di stima dei costi e pianificazione del budget

- **Troubleshooting Module**
  - Problemi comuni: problemi frequentemente riscontrati e soluzioni
  - Debugging Guide: metodologie sistematiche per la risoluzione dei problemi
  - Tecniche diagnostiche avanzate e strumenti
  - Monitoraggio delle prestazioni e ottimizzazione

- **Resources and References**
  - Scheda comandi rapida: riferimento veloce per i comandi essenziali
  - Glossario: definizioni complete di terminologia e acronimi
  - FAQ: risposte dettagliate alle domande comuni
  - Link a risorse esterne e connessioni alla community

- **Examples and Templates**
  - Esempio di semplice applicazione web
  - Template per il deployment di siti statici
  - Configurazione per applicazioni container
  - Pattern di integrazione con database
  - Esempi di architettura microservizi
  - Implementazioni di funzioni serverless

#### Caratteristiche
- **Multi-Platform Support**: guide di installazione e configurazione per Windows, macOS e Linux
- **Multiple Skill Levels**: contenuti progettati per studenti fino a sviluppatori professionisti
- **Practical Focus**: esempi pratici e scenari del mondo reale
- **Comprehensive Coverage**: dai concetti di base ai pattern enterprise avanzati
- **Security-First Approach**: best practice di sicurezza integrate in tutto il percorso
- **Cost Optimization**: indicazioni per deployment e gestione delle risorse efficienti in termini di costi

#### Qualità della documentazione
- **Detailed Code Examples**: esempi di codice pratici e testati
- **Step-by-Step Instructions**: indicazioni chiare e operative
- **Comprehensive Error Handling**: risoluzione dei problemi per le casistiche comuni
- **Best Practices Integration**: standard e raccomandazioni del settore
- **Version Compatibility**: aggiornato con i servizi Azure più recenti e le funzionalità di azd

## Miglioramenti futuri pianificati

### Versione 3.1.0 (Pianificata)
#### Espansione della piattaforma AI
- **Multi-Model Support**: pattern di integrazione per Hugging Face, Azure Machine Learning e modelli personalizzati
- **AI Agent Frameworks**: template per deployment con LangChain, Semantic Kernel e AutoGen
- **Advanced RAG Patterns**: opzioni per database vettoriali oltre Azure AI Search (Pinecone, Weaviate, ecc.)
- **AI Observability**: monitoraggio avanzato delle prestazioni dei modelli, dell'uso dei token e della qualità delle risposte

#### Esperienza sviluppatore
- **VS Code Extension**: esperienza di sviluppo integrata AZD + Microsoft Foundry in VS Code
- **GitHub Copilot Integration**: generazione di template AZD assistita dall'AI
- **Interactive Tutorials**: esercizi pratici di coding con validazione automatica per scenari AI
- **Video Content**: tutorial video supplementari per apprendenti visivi con focus su deployment AI

### Versione 4.0.0 (Pianificata)
#### Pattern AI aziendali
- **Governance Framework**: governance dei modelli AI, conformità e tracce di audit
- **Multi-Tenant AI**: pattern per servire più clienti con servizi AI isolati
- **Edge AI Deployment**: integrazione con Azure IoT Edge e container instances
- **Hybrid Cloud AI**: pattern di deployment multi-cloud e ibridi per carichi di lavoro AI

#### Funzionalità avanzate
- **AI Pipeline Automation**: integrazione MLOps con pipeline di Azure Machine Learning
- **Advanced Security**: pattern zero-trust, endpoint privati e protezione avanzata dalle minacce
- **Performance Optimization**: tuning avanzato e strategie di scaling per applicazioni AI ad alto throughput
- **Global Distribution**: distribuzione dei contenuti e pattern di caching edge per applicazioni AI

### Versione 3.0.0 (Pianificata) - Sostituita dalla versione attuale
#### Aggiunte proposte - Ora implementate in v3.0.0
- ✅ **AI-Focused Content**: integrazione completa con Microsoft Foundry (Completato)
- ✅ **Interactive Tutorials**: laboratorio pratico AI workshop (Completato)
- ✅ **Advanced Security Module**: pattern di sicurezza specifici per l'AI (Completato)
- ✅ **Performance Optimization**: strategie di tuning per carichi di lavoro AI (Completato)

### Versione 2.1.0 (Pianificata) - Parzialmente implementata in v3.0.0
#### Miglioramenti minori - Alcuni completati nella release attuale
- ✅ **Additional Examples**: scenari di deployment focalizzati sull'AI (Completato)
- ✅ **Extended FAQ**: FAQ specifiche per l'AI e risoluzione dei problemi (Completato)
- **Tool Integration**: guide migliorate per l'integrazione con IDE ed editor
- ✅ **Monitoring Expansion**: ampliamento del monitoraggio e pattern di alerting specifici per l'AI (Completato)

#### Ancora pianificati per una versione futura
- **Mobile-Friendly Documentation**: design responsive per l'apprendimento mobile
- **Offline Access**: pacchetti di documentazione scaricabili
- **Enhanced IDE Integration**: estensione VS Code per workflow AZD + AI
- **Community Dashboard**: metriche della community in tempo reale e tracciamento delle contribuzioni

## Contribuire al changelog

### Segnalazione delle modifiche
Quando contribuisci a questo repository, assicurati che le voci del changelog includano:

1. **Version Number**: seguendo semantic versioning (major.minor.patch)
2. **Date**: data di rilascio o aggiornamento in formato YYYY-MM-DD
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: descrizione concisa di cosa è cambiato
5. **Impact Assessment**: come le modifiche influenzano gli utenti esistenti

### Categorie di modifica

#### Aggiunto
- Nuove funzionalità, sezioni di documentazione o capacità
- Nuovi esempi, template o risorse di apprendimento
- Strumenti aggiuntivi, script o utility

#### Modificato
- Modifiche a funzionalità o documentazione esistenti
- Aggiornamenti per migliorare chiarezza o accuratezza
- Ristrutturazione di contenuti o organizzazione

#### Deprecato
- Funzionalità o approcci che stanno venendo rimossi gradualmente
- Sezioni di documentazione programmate per la rimozione
- Metodi che hanno alternative migliori

#### Rimosso
- Funzionalità, documentazione o esempi non più rilevanti
- Informazioni obsolete o approcci deprecati
- Contenuti ridondanti o consolidati

#### Corretto
- Correzioni di errori nella documentazione o nel codice
- Risoluzione di problemi segnalati
- Miglioramenti all'accuratezza o alla funzionalità

#### Sicurezza
- Miglioramenti o correzioni relative alla sicurezza
- Aggiornamenti alle best practice di sicurezza
- Risoluzione di vulnerabilità di sicurezza

### Linee guida per il versionamento semantico

#### Versione maggiore (X.0.0)
- Cambiamenti incompatibili che richiedono azioni da parte degli utenti
- Ristrutturazioni significative di contenuti o organizzazione
- Cambiamenti che alterano l'approccio o la metodologia di base

#### Versione minore (X.Y.0)
- Nuove funzionalità o aggiunte di contenuti
- Miglioramenti che mantengono la retrocompatibilità
- Esempi aggiuntivi, strumenti o risorse

#### Patch (X.Y.Z)
- Correzioni di bug e rettifiche
- Miglioramenti minori ai contenuti esistenti
- Chiarimenti e piccoli miglioramenti

## Feedback e suggerimenti della community

Incoraggiamo attivamente il feedback della community per migliorare questa risorsa di apprendimento:

### Come fornire feedback
- **GitHub Issues**: segnala problemi o suggerisci miglioramenti (problematiche specifiche per l'AI benvenute)
- **Discord Discussions**: condividi idee e interagisci con la community Microsoft Foundry
- **Pull Requests**: contribuisci con miglioramenti diretti ai contenuti, specialmente template e guide AI
- **Microsoft Foundry Discord**: partecipa al canale #Azure per discussioni su AZD + AI
- **Community Forums**: partecipa alle discussioni più ampie per gli sviluppatori Azure

### Categorie di feedback
- **AI Content Accuracy**: correzioni all'integrazione e alle informazioni sul deployment dei servizi AI
- **Learning Experience**: suggerimenti per migliorare il flusso di apprendimento per sviluppatori AI
- **Missing AI Content**: richieste di template, pattern o esempi AI aggiuntivi
- **Accessibility**: miglioramenti per esigenze di apprendimento diverse
- **AI Tool Integration**: suggerimenti per una migliore integrazione dei workflow di sviluppo AI
- **Production AI Patterns**: richieste di pattern per il deployment AI in ambiente enterprise

### Impegno di risposta
- **Issue Response**: entro 48 ore per i problemi segnalati
- **Feature Requests**: valutazione entro una settimana
- **Community Contributions**: revisione entro una settimana
- **Security Issues**: priorità immediata con risposta accelerata

## Programma di manutenzione

### Aggiornamenti regolari
- **Monthly Reviews**: verifica della correttezza dei contenuti e validazione dei link
- **Quarterly Updates**: aggiunte e miglioramenti significativi ai contenuti
- **Semi-Annual Reviews**: ristrutturazione e miglioramento completo
- **Annual Releases**: aggiornamenti di versione principali con miglioramenti significativi

### Monitoraggio e assicurazione della qualità
- **Automated Testing**: validazione regolare degli esempi di codice e dei link
- **Community Feedback Integration**: integrazione regolare dei suggerimenti degli utenti
- **Technology Updates**: allineamento con i servizi Azure più recenti e le release di azd
- **Accessibility Audits**: revisione periodica per principi di design inclusivi

## Politica di supporto delle versioni

### Supporto della versione corrente
- **Latest Major Version**: supporto completo con aggiornamenti regolari
- **Previous Major Version**: aggiornamenti di sicurezza e correzioni critiche per 12 mesi
- **Legacy Versions**: supporto dalla community solamente, senza aggiornamenti ufficiali

### Guida alla migrazione
Quando vengono rilasciate versioni principali, forniamo:
- **Migration Guides**: istruzioni passo dopo passo per la transizione
- **Compatibility Notes**: dettagli sui cambiamenti incompatibili
- **Tool Support**: script o utility per assistere nella migrazione
- **Community Support**: forum dedicati per domande sulla migrazione

---

**Navigazione**
- **Lezione precedente**: [Guida di studio](resources/study-guide.md)
- **Lezione successiva**: Torna al [README principale](README.md)

**Rimani aggiornato**: Segui questo repository per ricevere notifiche su nuove release e aggiornamenti importanti ai materiali di apprendimento.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->