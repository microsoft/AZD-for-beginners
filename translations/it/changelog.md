# Registro delle modifiche - AZD For Beginners

## Introduzione

Questo registro delle modifiche documenta tutte le modifiche, gli aggiornamenti e i miglioramenti importanti al repository AZD For Beginners. Seguiamo i principi del versionamento semantico e manteniamo questo registro per aiutare gli utenti a capire cosa è cambiato tra le versioni.

## Obiettivi di apprendimento

Esaminando questo registro delle modifiche, potrai:
- Rimanere aggiornato sulle nuove funzionalità e sui contenuti aggiunti
- Comprendere i miglioramenti apportati alla documentazione esistente
- Tenere traccia delle correzioni di bug e delle rettifiche per garantire accuratezza
- Seguire l'evoluzione dei materiali didattici nel tempo

## Risultati di apprendimento

Dopo aver esaminato le voci del changelog, sarai in grado di:
- Identificare nuovi contenuti e risorse disponibili per l'apprendimento
- Comprendere quali sezioni sono state aggiornate o migliorate
- Pianificare il tuo percorso di apprendimento sulla base dei materiali più aggiornati
- Contribuire con feedback e suggerimenti per miglioramenti futuri

## Cronologia delle versioni

### [v3.18.0] - 2026-03-16

#### Comandi AZD AI CLI, convalida dei contenuti e ampliamento dei template
**Questa versione aggiunge la copertura dei comandi `azd ai`, `azd extension` e `azd mcp` in tutti i capitoli relativi all'AI, corregge link interrotti e codice deprecato in agents.md, aggiorna il cheat sheet e rivoluziona la sezione Esempi di Template con descrizioni validate e nuovi template Azure AI AZD.**

#### Aggiunto
- **🤖 Copertura AZD AI CLI** in 7 file (precedentemente solo nel Capitolo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nuova sezione "Estensioni e comandi AI" che introduce `azd extension`, `azd ai agent init` e `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opzione 4: `azd ai agent init` con tabella di confronto (approccio template vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Sottosezioni "AZD Extensions for Foundry" e "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start ora mostra sia i percorsi di deployment basati su template che su manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — La sezione Deploy ora include l'opzione `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Sottosezione "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nuova sezione "AI & Extensions Commands" con `azd extension`, `azd ai agent init`, `azd mcp` e `azd infra generate`
- **📦 Nuovi template di esempio AZD AI** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET con Blazor WebAssembly, Semantic Kernel e supporto per chat vocale
  - **azure-search-openai-demo-java** — Chat RAG Java che utilizza Langchain4J con opzioni di deployment ACA/AKS
  - **contoso-creative-writer** — App di scrittura creativa multi-agente che utilizza Azure AI Agent Service, Bing Grounding e Prompty
  - **serverless-chat-langchainjs** — RAG serverless usando Azure Functions + LangChain.js + Cosmos DB con supporto sviluppo locale Ollama
  - **chat-with-your-data-solution-accelerator** — Accelerator RAG enterprise con portale admin, integrazione Teams e opzioni PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — App di riferimento per orchestrazione MCP multi-agente con server in .NET, Python, Java e TypeScript
  - **azd-ai-starter** — Template starter Bicep minimale per infrastruttura Azure AI
  - **🔗 Link alla Galleria Awesome AZD AI** — Riferimento alla [galleria awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (oltre 80 template)

#### Correzioni
- **🔗 navigazione in agents.md**: i link Previous/Next ora corrispondono all'ordine delle lezioni nel README del Capitolo 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 link interrotti in agents.md**: `production-ai-practices.md` corretto in `../chapter-08-production/production-ai-practices.md` (3 occorrenze)
- **📦 codice deprecato in agents.md**: sostituito `opencensus` con `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API non valida in agents.md**: spostato `max_tokens` da `create_agent()` a `create_run()` come `max_completion_tokens`
- **🔢 conteggio token in agents.md**: sostituita la stima approssimativa `len//4` con `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: servizi corretti da "Cognitive Search + App Service" a "Azure AI Search + Azure Container Apps" (host predefinito cambiato Ott 2024)
- **contoso-chat**: descrizione aggiornata per riferirsi a Azure AI Foundry + Prompty, in linea con il titolo e lo stack tecnologico effettivi del repo

#### Rimosso
- **ai-document-processing**: rimosso il riferimento a template non funzionante (repo non accessibile pubblicamente come template AZD)

#### Migliorato
- **📝 esercizi in agents.md**: l'Esercizio 1 ora mostra l'output atteso e il passaggio `azd monitor`; l'Esercizio 2 include il codice completo di registrazione di `FunctionTool`; l'Esercizio 3 sostituisce indicazioni vaghe con comandi concreti `prepdocs.py`
- **📚 risorse in agents.md**: link alla documentazione aggiornati con i documenti correnti di Azure AI Agent Service e quickstart
- **📋 tabella Next Steps in agents.md**: aggiunto link al laboratorio AI Workshop per copertura completa del capitolo

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
**Questa versione migliora la navigazione dei README.md dei capitoli con un formato di tabella potenziato.**

#### Modificato
- **Tabella Mappa del Corso**: potenziata con link diretti alle lezioni, stime di durata e valutazioni di complessità
- **Pulizia delle cartelle**: rimosse cartelle vecchie ridondanti (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validazione link**: tutti i 21+ link interni nella tabella Course Map verificati

### [v3.16.0] - 2026-02-05

#### Aggiornamento dei nomi dei prodotti
**Questa versione aggiorna i riferimenti ai prodotti al branding Microsoft corrente.**

#### Modificato
- **Microsoft Foundry → Microsoft Foundry**: tutti i riferimenti aggiornati nei file non di traduzione
- **Azure AI Agent Service → Foundry Agents**: nome del servizio aggiornato per riflettere il branding corrente

#### File aggiornati
- `README.md` - Pagina principale del corso
- `changelog.md` - Cronologia delle versioni
- `course-outline.md` - Struttura del corso
- `docs/chapter-02-ai-development/agents.md` - Guida agli agenti AI
- `examples/README.md` - Documentazione degli esempi
- `workshop/README.md` - Pagina di benvenuto del workshop
- `workshop/docs/index.md` - Indice del workshop
- `workshop/docs/instructions/*.md` - Tutti i file di istruzioni del workshop

---

### [v3.15.0] - 2026-02-05

#### Ristrutturazione importante del repository: nomi delle cartelle basati sui capitoli
**Questa versione ristruttura la documentazione in cartelle dedicate per capitolo per una navigazione più chiara.**

#### Rinomina delle cartelle
Le vecchie cartelle sono state sostituite con cartelle numerate per capitolo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Aggiunta nuova: `docs/chapter-05-multi-agent/`

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
- **📚 File README per i capitoli**: creato README.md in ogni cartella di capitolo con:
  - Obiettivi di apprendimento e durata
  - Tabella delle lezioni con descrizioni
  - Comandi quick start
  - Navigazione verso gli altri capitoli

#### Modificato
- **🔗 Aggiornati tutti i link interni**: oltre 78+ percorsi aggiornati in tutti i file di documentazione
- **🗺️ README.md principale**: aggiornata la Mappa del Corso con la nuova struttura per capitoli
- **📝 examples/README.md**: aggiornati i riferimenti incrociati alle cartelle dei capitoli

#### Rimosso
- Vecchia struttura di cartelle (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Ristrutturazione del repository: navigazione per capitoli
**Questa versione ha aggiunto file README di navigazione per i capitoli (sostituiti da v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nuova guida agli agenti AI
**Questa versione aggiunge una guida completa per il deployment di agenti AI con Azure Developer CLI.**

#### Aggiunto
- **🤖 docs/microsoft-foundry/agents.md**: guida completa che copre:
  - Cosa sono gli agenti AI e in cosa si differenziano dai chatbot
  - Tre template quick-start per agenti (Foundry Agents, Prompty, RAG)
  - Pattern architetturali per agenti (single agent, RAG, multi-agent)
  - Configurazione e personalizzazione degli strumenti
  - Monitoraggio e tracciamento delle metriche
  - Considerazioni sui costi e ottimizzazione
  - Scenari comuni di troubleshooting
  - Tre esercizi pratici con criteri di successo

#### Struttura dei contenuti
- **Introduzione**: concetti sugli agenti per principianti
- **Quick Start**: deploy di agenti con `azd init --template get-started-with-ai-agents`
- **Pattern architetturali**: diagrammi visivi dei pattern per agenti
- **Configurazione**: setup degli strumenti e variabili d'ambiente
- **Monitoraggio**: integrazione con Application Insights
- **Esercizi**: apprendimento pratico progressivo (20-45 minuti ciascuno)

---

### [v3.12.0] - 2026-02-05

#### Aggiornamento dell'ambiente DevContainer
**Questa versione aggiorna la configurazione del container di sviluppo con strumenti moderni e migliori impostazioni predefinite per l'esperienza di apprendimento AZD.**

#### Modificato
- **🐳 Immagine base**: aggiornata da `python:3.12-bullseye` a `python:3.12-bookworm` (ultima stable di Debian)
- **📛 Nome del container**: rinominato da "Python 3" a "AZD for Beginners" per chiarezza

#### Aggiunto
- **🔧 Nuove funzionalità del Dev Container**:
  - `azure-cli` con supporto Bicep abilitato
  - `node:20` (versione LTS per i template AZD)
  - `github-cli` per la gestione dei template
  - `docker-in-docker` per il deployment di app in container

- **🔌 Inoltro porte**: Porte preconfigurate per lo sviluppo comune:
  - 8000 (anteprima MkDocs)
  - 3000 (app web)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nuove estensioni di VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense Python avanzato
  - `ms-azuretools.vscode-azurefunctions` - Supporto per Azure Functions
  - `ms-azuretools.vscode-docker` - Supporto Docker
  - `ms-azuretools.vscode-bicep` - Supporto per il linguaggio Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestione delle risorse Azure
  - `yzhang.markdown-all-in-one` - Modifica Markdown
  - `DavidAnson.vscode-markdownlint` - Linting per Markdown
  - `bierner.markdown-mermaid` - Supporto diagrammi Mermaid
  - `redhat.vscode-yaml` - Supporto YAML (per azure.yaml)
  - `eamodio.gitlens` - Visualizzazione Git
  - `mhutchie.git-graph` - Cronologia Git

- **⚙️ Impostazioni di VS Code**: Aggiunte impostazioni predefinite per l'interprete Python, il formato al salvataggio e la rimozione degli spazi bianchi

- **📦 Aggiornato requirements-dev.txt**:
  - Aggiunto plugin di minificazione per MkDocs
  - Aggiunto pre-commit per la qualità del codice
  - Aggiunti pacchetti Azure SDK (azure-identity, azure-mgmt-resource)

#### Risolto
- **Comando Post-Create**: Ora verifica l'installazione di AZD e Azure CLI all'avvio del contenitore

---

### [v3.11.0] - 2026-02-05

#### Revisione README per principianti
**Questa versione migliora significativamente il README.md rendendolo più accessibile ai principianti e aggiunge risorse essenziali per gli sviluppatori AI.**

#### Aggiunto
- **🆚 Confronto Azure CLI vs AZD**: Spiegazione chiara di quando usare ciascuno strumento con esempi pratici
- **🌟 Link Awesome AZD**: Collegamenti diretti alla galleria di template della community e risorse per contribuire:
  - [Galleria Awesome AZD](https://azure.github.io/awesome-azd/) - 200+ template pronti per il deployment
  - [Invia un Template](https://github.com/Azure/awesome-azd/issues) - Contributo della community
- **🎯 Guida Quick Start**: Sezione per iniziare semplificata in 3 passaggi (Install → Login → Deploy)
- **📊 Tabella di navigazione basata sull'esperienza**: Indicazioni chiare su dove iniziare in base all'esperienza dello sviluppatore

#### Modificato
- **Struttura del README**: Riorganizzata per una divulgazione progressiva - informazioni chiave per prime
- **Sezione Introduzione**: Riscritta per spiegare "La magia di `azd up`" ai principianti assoluti
- **Rimosso contenuto duplicato**: Eliminata la sezione di risoluzione dei problemi duplicata
- **Comandi di risoluzione dei problemi**: Corretto il riferimento a `azd logs` per utilizzare il valido `azd monitor --logs`

#### Risolto
- **🔐 Comandi di autenticazione**: Aggiunti `azd auth login` e `azd auth logout` a cheat-sheet.md
- **Riferimenti a comandi non validi**: Rimosso il restante `azd logs` dalla sezione di risoluzione dei problemi del README

#### Note
- **Ambito**: Modifiche applicate al README.md principale e a resources/cheat-sheet.md
- **Pubblico destinatario**: Miglioramenti specificamente rivolti agli sviluppatori nuovi a AZD

---

### [v3.10.0] - 2026-02-05

#### Aggiornamento di accuratezza dei comandi di Azure Developer CLI
**Questa versione corregge comandi AZD inesistenti in tutta la documentazione, assicurando che tutti gli esempi di codice usino una sintassi valida dell'Azure Developer CLI.**

#### Risolto
- **🔧 Rimozione di comandi AZD inesistenti**: Revisione completa e correzione dei comandi non validi:
  - `azd logs` (non esiste) → sostituito con `azd monitor --logs` o alternative Azure CLI
  - `azd service` subcomandi (non esistono) → sostituiti con `azd show` e Azure CLI
  - `azd infra import/export/validate` (non esistono) → rimossi o sostituiti con alternative valide
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flag (non esistono) → rimossi
  - `azd provision --what-if/--rollback` flag (non esistono) → aggiornati per usare `--preview`
  - `azd config validate` (non esiste) → sostituito con `azd config list`
  - `azd info`, `azd history`, `azd metrics` (non esistono) → rimossi

- **📚 File aggiornati con correzioni dei comandi**:
  - `resources/cheat-sheet.md`: Rinnovamento completo del riferimento ai comandi
  - `docs/deployment/deployment-guide.md`: Corrette le strategie di rollback e deployment
  - `docs/troubleshooting/debugging.md`: Corrette le sezioni di analisi dei log
  - `docs/troubleshooting/common-issues.md`: Aggiornati i comandi di risoluzione dei problemi
  - `docs/troubleshooting/ai-troubleshooting.md`: Corretta la sezione di debugging AZD
  - `docs/getting-started/azd-basics.md`: Corretti i comandi di monitoraggio
  - `docs/getting-started/first-project.md`: Aggiornati gli esempi di monitoraggio e debugging
  - `docs/getting-started/installation.md`: Corrette le sezioni di help ed esempi di versioni
  - `docs/pre-deployment/application-insights.md`: Corrette le istruzioni per la visualizzazione dei log
  - `docs/pre-deployment/coordination-patterns.md`: Corretti i comandi di debugging degli agent

#### Modificato
- **Strategie di rollback**: Documentazione aggiornata per utilizzare il rollback basato su Git (AZD non ha rollback nativo)
- **Visualizzazione dei log**: Sostituiti i riferimenti a `azd logs` con `azd monitor --logs`, `azd monitor --live` e comandi Azure CLI
- **Sezione Prestazioni**: Rimossi flag di deployment parallelo/incrementale inesistenti, fornite alternative valide

#### Dettagli Tecnici
- **Comandi AZD validi**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag validi di azd monitor**: `--live`, `--logs`, `--overview`
- **Funzionalità rimosse**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Note
- **Verifica**: Comandi validati contro Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Completamento del workshop e aggiornamento della qualità della documentazione
**Questa versione completa i moduli interattivi del workshop, corregge tutti i link rotti della documentazione e migliora la qualità complessiva dei contenuti per gli sviluppatori AI che utilizzano Microsoft AZD.**

#### Aggiunto
- **📝 CONTRIBUTING.md**: Nuovo documento di linee guida per i contributi con:
  - Istruzioni chiare per segnalare problemi e proporre modifiche
  - Standard di documentazione per nuovi contenuti
  - Linee guida per esempi di codice e convenzioni per i messaggi di commit
  - Informazioni sul coinvolgimento della community

#### Completato
- **🎯 Modulo Workshop 7 (Conclusione)**: Modulo di chiusura completato con:
  - Riepilogo completo dei risultati del workshop
  - Sezione dei concetti chiave acquisiti che copre AZD, template e Microsoft Foundry
  - Raccomandazioni per il proseguimento del percorso di apprendimento
  - Esercizi di sfida del workshop con valutazioni di difficoltà
  - Link per feedback della community e supporto

- **📚 Modulo Workshop 3 (Deconstruct)**: Obiettivi di apprendimento aggiornati con:
  - Guida all'attivazione di GitHub Copilot con server MCP
  - Comprensione della struttura delle cartelle dei template AZD
  - Pattern di organizzazione Infrastructure-as-Code (Bicep)
  - Istruzioni per laboratori pratici

- **🔧 Modulo Workshop 6 (Smantellamento)**: Completato con:
  - Obiettivi di cleanup delle risorse e gestione dei costi
  - Uso di `azd down` per il deprovisioning sicuro dell'infrastruttura
  - Guida al recupero dei servizi cognitivi eliminati in soft-delete
  - Suggerimenti bonus per esplorare GitHub Copilot e Azure Portal

#### Risolto
- **🔗 Correzione link rotti**: Risolti oltre 15 link interni rotti nella documentazione:
  - `docs/ai-foundry/ai-model-deployment.md`: Corretti i percorsi verso microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corretti i percorsi ai file ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: Sostituito il non esistente cicd-integration.md con deployment-guide.md
  - `examples/retail-scenario.md`: Corrette i percorsi di FAQ e guida alla risoluzione dei problemi
  - `examples/container-app/microservices/README.md`: Corrette le path della home del corso e della guida al deployment
  - `resources/faq.md` e `resources/glossary.md`: Aggiornati i riferimenti al capitolo AI
  - `course-outline.md`: Corretti i riferimenti alla guida per istruttori e ai laboratori del workshop AI

- **📅 Banner stato del workshop**: Aggiornato da "Under Construction" allo stato workshop attivo con data Febbraio 2026

- **🔗 Navigazione del workshop**: Corretti i link di navigazione rotti nel README.md del workshop che puntavano alla cartella lab-1-azd-basics inesistente

#### Modificato
- **Presentazione del workshop**: Rimossa l'avvertenza "under construction", il workshop è ora completo e pronto all'uso
- **Coerenza della navigazione**: Assicurata la navigazione tra moduli del workshop corretta per tutti i moduli
- **Riferimenti del percorso di apprendimento**: Aggiornati i riferimenti incrociati dei capitoli per usare i percorsi microsoft-foundry corretti

#### Validato
- ✅ Tutti i file markdown in inglese hanno link interni validi
- ✅ I moduli del workshop 0-7 sono completi con obiettivi di apprendimento
- ✅ La navigazione tra capitoli e moduli funziona correttamente
- ✅ I contenuti sono adatti agli sviluppatori AI che utilizzano Microsoft AZD
- ✅ Linguaggio e struttura adatti ai principianti mantenuti ovunque
- ✅ CONTRIBUTING.md fornisce indicazioni chiare per i contributori della community

#### Implementazione tecnica
- **Validazione link**: Script PowerShell automatizzato ha verificato tutti i link interni .md
- **Audit dei contenuti**: Revisione manuale della completezza del workshop e dell'idoneità per principianti
- **Sistema di navigazione**: Applicati pattern coerenti di navigazione tra capitoli e moduli

#### Note
- **Ambito**: Modifiche applicate solo alla documentazione in inglese
- **Traduzioni**: Le cartelle di traduzione non sono state aggiornate in questa versione (la traduzione automatica verrà sincronizzata successivamente)
- **Durata del workshop**: Il workshop completo ora offre 3-4 ore di apprendimento pratico

---

### [v3.8.0] - 2025-11-19

#### Documentazione avanzata: Monitoraggio, sicurezza e pattern multi-agente
**Questa versione aggiunge lezioni complete di livello A sull'integrazione di Application Insights, pattern di autenticazione e coordinazione multi-agente per deployment in produzione.**

#### Aggiunto
- **📊 Lezione integrazione Application Insights**: in `docs/pre-deployment/application-insights.md`:
  - Deployment incentrato su AZD con provisioning automatico
  - Template Bicep completi per Application Insights + Log Analytics
  - Applicazioni Python funzionanti con telemetria personalizzata (oltre 1.200 righe)
  - Pattern di monitoraggio AI/LLM (monitoraggio token/costi dei modelli Microsoft Foundry)
  - 6 diagrammi Mermaid (architettura, tracciamento distribuito, flusso di telemetria)
  - 3 esercizi pratici (avvisi, dashboard, monitoraggio AI)
  - Esempi di query Kusto e strategie di ottimizzazione dei costi
  - Streaming di metriche in tempo reale e debugging in tempo reale
  - Tempo di apprendimento 40-50 minuti con pattern pronti per la produzione

- **🔐 Lezione su autenticazione e pattern di sicurezza**: in `docs/getting-started/authsecurity.md`:
  - 3 pattern di autenticazione (connection string, Key Vault, managed identity)
  - Template Bicep complete per deployment sicuri
  - Codice applicativo Node.js con integrazione Azure SDK
  - 3 esercizi completi (abilitare managed identity, user-assigned identity, rotazione di Key Vault)
  - Best practice di sicurezza e configurazioni RBAC
  - Guida alla risoluzione dei problemi e analisi dei costi
  - Pattern di autenticazione senza password pronti per la produzione

- **🤖 Lezione sui pattern di coordinazione multi-agente**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 pattern di coordinazione (sequenziale, parallelo, gerarchico, event-driven, consensus)
  - Implementazione completa del servizio orchestratore (Python/Flask, oltre 1.500 righe)
  - 3 implementazioni di agent specializzati (Research, Writer, Editor)
  - Integrazione con Service Bus per message queuing
  - Gestione dello stato con Cosmos DB per sistemi distribuiti
  - 6 diagrammi Mermaid che mostrano le interazioni degli agent
  - 3 esercizi avanzati (gestione timeout, logica di retry, circuit breaker)
  - Suddivisione dei costi ($240-565/mese) con strategie di ottimizzazione
  - Integrazione con Application Insights per il monitoraggio

#### Migliorato
- **Capitolo Pre-deployment**: Ora include pattern completi di monitoraggio e coordinazione
- **Capitolo Getting Started**: Potenziato con pattern di autenticazione professionali
- **Prontezza per la produzione**: Copertura completa dalla sicurezza all'osservabilità
- **Outline del corso**: Aggiornato per fare riferimento alle nuove lezioni nei Capitoli 3 e 6

#### Modificato
- **Progressione dell'apprendimento**: Migliore integrazione di sicurezza e monitoraggio in tutto il corso
- **Qualità della documentazione**: Standard coerenti di livello A (95-97%) nelle nuove lezioni
- **Pattern di produzione**: Copertura completa end-to-end per deployment enterprise

#### Migliorato
- **Esperienza dello sviluppatore**: Percorso chiaro dallo sviluppo al monitoraggio in produzione
- **Standard di sicurezza**: Pattern professionali per autenticazione e gestione dei segreti
- **Osservabilità**: Integrazione completa di Application Insights con AZD
- **Carichi di lavoro AI**: Monitoraggio specializzato per i modelli Microsoft Foundry e i sistemi multi-agente

#### Convalidato
- ✅ Tutte le lezioni includono codice funzionante completo (non frammenti)
- ✅ Diagrammi Mermaid per l'apprendimento visivo (19 totali in 3 lezioni)
- ✅ Esercizi pratici con passaggi di verifica (9 in totale)
- ✅ Template Bicep pronti per la produzione distribuibili tramite `azd up`
- ✅ Analisi dei costi e strategie di ottimizzazione
- ✅ Guide alla risoluzione dei problemi e migliori pratiche
- ✅ Checkpoint di conoscenza con comandi di verifica

#### Risultati della valutazione della documentazione
- **docs/pre-deployment/application-insights.md**: - Guida completa al monitoraggio
- **docs/getting-started/authsecurity.md**: - Pattern professionali di sicurezza
- **docs/pre-deployment/coordination-patterns.md**: - Architetture multi-agente avanzate
- **Overall New Content**: - Standard di alta qualità coerenti

#### Implementazione tecnica
- **Application Insights**: Log Analytics + telemetria personalizzata + tracciamento distribuito
- **Authentication**: Managed Identity + Key Vault + pattern RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrazione
- **Monitoring**: Metriche in tempo reale + query Kusto + avvisi + dashboard
- **Cost Management**: Strategie di campionamento, politiche di retention, controlli di budget

### [v3.7.0] - 2025-11-19

#### Miglioramenti della qualità della documentazione e nuovo esempio Microsoft Foundry Models
**Questa versione migliora la qualità della documentazione in tutto il repository e aggiunge un esempio completo di deployment dei Microsoft Foundry Models con interfaccia chat gpt-4.1.**

#### Aggiunto
- **🤖 Microsoft Foundry Models Chat Example**: Complete gpt-4.1 deployment with working implementation in `examples/azure-openai-chat/`:
  - Infrastruttura completa Microsoft Foundry Models (deploy del modello gpt-4.1)
  - Interfaccia chat da riga di comando Python con cronologia delle conversazioni
  - Integrazione con Key Vault per l'archiviazione sicura delle chiavi API
  - Tracciamento dell'uso dei token e stima dei costi
  - Limitazione delle richieste e gestione degli errori
  - README completo con guida al deployment di 35-45 minuti
  - 11 file pronti per la produzione (template Bicep, app Python, configurazione)
- **📚 Esercizi di documentazione**: Aggiunti esercizi pratici alla guida alla configurazione:
  - Esercizio 1: Configurazione multi-ambiente (15 minuti)
  - Esercizio 2: Pratica sulla gestione dei segreti (10 minuti)
  - Criteri di successo chiari e passaggi di verifica
- **✅ Verifica del deployment**: Aggiunta sezione di verifica alla guida al deployment:
  - Procedure di controllo dello stato (health check)
  - Checklist dei criteri di successo
  - Output attesi per tutti i comandi di deployment
  - Riferimento rapido per la risoluzione dei problemi

#### Migliorato
- **examples/README.md**: Aggiornato a qualità A (93%):
  - Aggiunto azure-openai-chat a tutte le sezioni pertinenti
  - Aggiornato il conteggio degli esempi locali da 3 a 4
  - Aggiunto alla tabella Esempi di applicazioni AI
  - Integrato nel Quick Start per utenti intermedi
  - Aggiunto alla sezione Microsoft Foundry Templates
  - Aggiornata la matrice di confronto e le sezioni di individuazione tecnologica
- **Documentazione Quality**: Migliorata da B+ (87%) → A- (92%) nella cartella docs:
  - Aggiunti output attesi agli esempi di comandi critici
  - Includuti passaggi di verifica per le modifiche di configurazione
  - Potenziata l'apprendimento pratico con esercizi applicativi

#### Modificato
- **Progresso di apprendimento**: Migliore integrazione degli esempi AI per gli apprendenti intermedi
- **Struttura della documentazione**: Più esercizi azionabili con risultati chiari
- **Processo di verifica**: Criteri di successo espliciti aggiunti ai flussi di lavoro chiave

#### Migliorato
- **Esperienza dello sviluppatore**: il deployment dei Microsoft Foundry Models ora richiede 35-45 minuti (vs 60-90 per alternative complesse)
- **Trasparenza dei costi**: stime dei costi chiare ($50-200/mese) per l'esempio Microsoft Foundry Models
- **Percorso di apprendimento**: gli sviluppatori AI hanno un punto di ingresso chiaro con azure-openai-chat
- **Standard della documentazione**: output attesi e passaggi di verifica coerenti

#### Convalidato
- ✅ Esempio Microsoft Foundry Models completamente funzionante con `azd up`
- ✅ Tutti gli 11 file di implementazione sintatticamente corretti
- ✅ Istruzioni nel README corrispondono all'effettiva esperienza di deployment
- ✅ Link della documentazione aggiornati in oltre 8 posizioni
- ✅ L'indice degli esempi riflette accuratamente 4 esempi locali
- ✅ Nessun link esterno duplicato nelle tabelle
- ✅ Tutti i riferimenti di navigazione corretti

#### Implementazione tecnica
- **Architettura Microsoft Foundry Models**: gpt-4.1 + Key Vault + pattern Container Apps
- **Sicurezza**: Managed Identity pronto, segreti in Key Vault
- **Monitoraggio**: integrazione Application Insights
- **Gestione dei costi**: tracciamento dei token e ottimizzazione dell'uso
- **Deployment**: Singolo comando `azd up` per la configurazione completa

### [v3.6.0] - 2025-11-19

#### Aggiornamento importante: esempi di deployment per Container App
**Questa versione introduce esempi completi e pronti per la produzione di deployment di applicazioni containerizzate usando Azure Developer CLI (AZD), con documentazione completa e integrazione nel percorso formativo.**

#### Aggiunto
- **🚀 Esempi Container App**: Nuovi esempi locali in `examples/container-app/`:
  - [Guida principale](examples/container-app/README.md): Panoramica completa dei deployment containerizzati, quick start, produzione e pattern avanzati
  - [API Flask semplice](../../examples/container-app/simple-flask-api): API REST ideale per principianti con scale-to-zero, probe di integrità, monitoraggio e troubleshooting
  - [Architettura a microservizi](../../examples/container-app/microservices): Deployment multi-servizio pronto per la produzione (API Gateway, Product, Order, User, Notification), messaggistica asincrona, Service Bus, Cosmos DB, Azure SQL, tracciamento distribuito, deployment blue-green/canary
- **Migliori pratiche**: Sicurezza, monitoraggio, ottimizzazione dei costi e linee guida CI/CD per workload containerizzati
- **Esempi di codice**: `azure.yaml` completo, template Bicep e implementazioni multi-lingua dei servizi (Python, Node.js, C#, Go)
- **Test & Risoluzione dei problemi**: Scenari end-to-end, comandi di monitoraggio, guida alla risoluzione dei problemi

#### Modificato
- **README.md**: Aggiornato per presentare e collegare i nuovi esempi container app sotto "Local Examples - Container Applications"
- **examples/README.md**: Aggiornato per evidenziare gli esempi container app, aggiungere voci nella matrice di confronto e aggiornare i riferimenti tecnologici/architetturali
- **Course Outline & Study Guide**: Aggiornati per fare riferimento ai nuovi esempi container app e ai pattern di deployment nei capitoli pertinenti

#### Convalidato
- ✅ Tutti i nuovi esempi sono distribuibili con `azd up` e seguono le migliori pratiche
- ✅ Cross-link della documentazione e navigazione aggiornati
- ✅ Gli esempi coprono scenari da principiante ad avanzato, inclusi microservizi di produzione

#### Note
- **Ambito**: Documentazione e esempi in inglese solo
- **Prossimi passi**: Espandere con ulteriori pattern container avanzati e automazione CI/CD nelle release future

### [v3.5.0] - 2025-11-19

#### Rebranding del prodotto: Microsoft Foundry
**Questa versione implementa un cambiamento completo del nome del prodotto da "Microsoft Foundry" a "Microsoft Foundry" in tutta la documentazione in inglese, riflettendo il rebranding ufficiale di Microsoft.**

#### Modificato
- **🔄 Aggiornamento nome del prodotto**: Rebranding completo da "Microsoft Foundry" a "Microsoft Foundry"
  - Aggiornati tutti i riferimenti nella documentazione in inglese nella cartella `docs/`
  - Rinominata la cartella: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Rinominato il file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totale: 23 riferimenti di contenuto aggiornati in 7 file di documentazione

- **📁 Modifiche alla struttura delle cartelle**:
  - `docs/ai-foundry/` rinominata in `docs/microsoft-foundry/`
  - Tutti i riferimenti incrociati aggiornati per riflettere la nuova struttura delle cartelle
  - Link di navigazione convalidati in tutta la documentazione

- **📄 Rinomina dei file**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tutti i link interni aggiornati per fare riferimento al nuovo nome file

#### File aggiornati
- **Documentazione dei capitoli** (7 file):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aggiornamenti dei link di navigazione
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 riferimenti al nome del prodotto aggiornati
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Già utilizza Microsoft Foundry (dalle precedenti modifiche)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 riferimenti aggiornati (panoramica, feedback della community, documentazione)
  - `docs/getting-started/azd-basics.md` - 4 link di riferimento incrociato aggiornati
  - `docs/getting-started/first-project.md` - 2 link di navigazione capitolo aggiornati
  - `docs/getting-started/installation.md` - 2 link al capitolo successivo aggiornati
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 riferimenti aggiornati (navigazione, community Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link di navigazione aggiornato
  - `docs/troubleshooting/debugging.md` - 1 link di navigazione aggiornato

- **File della struttura del corso** (2 file):
  - `README.md` - 17 riferimenti aggiornati (panoramica del corso, titoli dei capitoli, sezione template, approfondimenti della community)
  - `course-outline.md` - 14 riferimenti aggiornati (panoramica, obiettivi di apprendimento, risorse dei capitoli)

#### Convalidato
- ✅ Zero riferimenti rimanenti alla cartella "ai-foundry" nei documenti in inglese
- ✅ Zero riferimenti rimanenti al nome del prodotto "Microsoft Foundry" nei documenti in inglese
- ✅ Tutti i link di navigazione funzionanti con la nuova struttura delle cartelle
- ✅ Rinomine di file e cartelle completate con successo
- ✅ Riferimenti incrociati tra i capitoli convalidati

#### Note
- **Ambito**: Le modifiche sono state applicate solo alla documentazione in inglese nella cartella `docs/`
- **Traduzioni**: Le cartelle di traduzione (`translations/`) non sono state aggiornate in questa versione
- **Workshop**: I materiali del workshop (`workshop/`) non sono stati aggiornati in questa versione
- **Esempi**: I file di esempio potrebbero ancora fare riferimento alla nomenclatura legacy (da affrontare in un aggiornamento futuro)
- **Link esterni**: Gli URL esterni e i riferimenti al repository GitHub rimangono invariati

#### Guida alla migrazione per i contributori
Se hai branch locali o documentazione che fanno riferimento alla vecchia struttura:
1. Aggiorna i riferimenti alle cartelle: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aggiorna i riferimenti ai file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Sostituisci il nome del prodotto: "Microsoft Foundry" → "Microsoft Foundry"
4. Convalida che tutti i link interni della documentazione funzionino ancora

---

### [v3.4.0] - 2025-10-24

#### Anteprima dell'infrastruttura e miglioramenti alla convalida
**Questa versione introduce il supporto completo per la nuova funzionalità preview di Azure Developer CLI e migliora l'esperienza utente del workshop.**

#### Aggiunto
- **🧪 azd provision --preview Feature Documentation**: Copertura completa della nuova capacità di anteprima dell'infrastruttura
  - Riferimento ai comandi ed esempi d'uso nel cheat sheet
  - Integrazione dettagliata nella guida al provisioning con casi d'uso e benefici
  - Integrazione dei controlli preliminari per una convalida del deployment più sicura
  - Aggiornamenti alla guida introduttiva con pratiche di deployment orientate alla sicurezza
- **🚧 Workshop Status Banner**: Banner HTML professionale che indica lo stato di sviluppo del workshop
  - Design a gradiente con indicatori di costruzione per una chiara comunicazione agli utenti
  - Timestamp dell'ultimo aggiornamento per trasparenza
  - Design responsive per dispositivi mobili

#### Migliorato
- **Sicurezza dell'infrastruttura**: La funzionalità preview è integrata in tutta la documentazione di deployment
- **Convalida pre-deployment**: Gli script automatizzati ora includono test di anteprima dell'infrastruttura
- **Flusso di lavoro dello sviluppatore**: Sequenze di comandi aggiornate per includere la preview come best practice
- **Esperienza del workshop**: Aspettative chiare impostate per gli utenti sullo stato di sviluppo dei contenuti

#### Modificato
- **Best practices per il deployment**: Workflow con priorità alla preview ora raccomandato
- **Flusso della documentazione**: La convalida dell'infrastruttura è stata spostata prima nel processo di apprendimento
- **Presentazione del workshop**: Comunicazione professionale dello stato con tempistiche di sviluppo chiare

#### Migliorato
- **Approccio Safety-First**: Le modifiche all'infrastruttura possono ora essere convalidate prima del deployment
- **Collaborazione del team**: I risultati della preview possono essere condivisi per revisione e approvazione
- **Consapevolezza dei costi**: Migliore comprensione dei costi delle risorse prima del provisioning
- **Mitigazione del rischio**: Ridotte le failure di deployment grazie alla convalida preventiva

#### Implementazione tecnica
- **Integrazione multi-documento**: La funzionalità preview documentata in 4 file chiave
- **Pattern di comando**: Sintassi e esempi coerenti in tutta la documentazione
- **Integrazione best practice**: Preview inclusa nei workflow di convalida e negli script
- **Indicatori visivi**: Chiare marcature NEW per facilità di scoperta

#### Infrastruttura del workshop
- **Comunicazione dello stato**: Banner HTML professionale con styling a gradiente
- **Esperienza utente**: Stato di sviluppo chiaro previene confusione
- **Presentazione professionale**: Mantiene la credibilità del repository impostando aspettative
- **Trasparenza della timeline**: Data dell'ultimo aggiornamento: ottobre 2025 per responsabilità

### [v3.3.0] - 2025-09-24

#### Materiali del workshop potenziati ed esperienza di apprendimento interattiva
**Questa versione introduce materiali completi per il workshop con guide interattive basate su browser e percorsi di apprendimento strutturati.**

#### Aggiunto
- **🎥 Interactive Workshop Guide**: Esperienza del workshop basata su browser con capacità di anteprima MkDocs
- **📝 Structured Workshop Instructions**: Percorso di apprendimento guidato in 7 passaggi dalla scoperta alla personalizzazione
  - 0-Introduction: Panoramica del workshop e configurazione
  - 1-Select-AI-Template: Processo di scoperta e selezione dei template
  - 2-Validate-AI-Template: Procedure di deployment e validazione
  - 3-Deconstruct-AI-Template: Comprensione dell'architettura del template
  - 4-Configure-AI-Template: Configurazione e personalizzazione
  - 5-Customize-AI-Template: Modifiche avanzate e iterazioni
  - 6-Teardown-Infrastructure: Pulizia e gestione delle risorse
  - 7-Wrap-up: Riepilogo e prossimi passi
- **🛠️ Workshop Tooling**: Configurazione MkDocs con tema Material per un'esperienza di apprendimento migliorata
- **🎯 Hands-On Learning Path**: Metodologia in 3 passaggi (Scoperta → Deployment → Personalizzazione)
- **📱 GitHub Codespaces Integration**: Configurazione dell'ambiente di sviluppo senza soluzione di continuità

#### Migliorato
- **AI Workshop Lab**: Esteso con un'esperienza di apprendimento strutturata completa di 2-3 ore
- **Workshop Documentation**: Presentazione professionale con navigazione e supporti visivi
- **Learning Progression**: Guida passo-passo chiara dalla selezione del template al deployment in produzione
- **Developer Experience**: Tooling integrato per flussi di lavoro di sviluppo semplificati

#### Miglioramenti
- **Accessibility**: Interfaccia basata su browser con ricerca, funzione copia e cambio tema
- **Self-Paced Learning**: Struttura del workshop flessibile che si adatta a diversi ritmi di apprendimento
- **Practical Application**: Scenari reali di deployment di template AI
- **Community Integration**: Integrazione Discord per supporto e collaborazione del workshop

#### Workshop Features
- **Built-in Search**: Ricerca rapida per parole chiave e lezioni
- **Copy Code Blocks**: Funzionalità hover-to-copy per tutti gli esempi di codice
- **Theme Toggle**: Supporto modalità scura/chiara per diverse preferenze
- **Visual Assets**: Screenshot e diagrammi per una comprensione migliorata
- **Help Integration**: Accesso diretto a Discord per supporto dalla community

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**Questa versione introduce una struttura di apprendimento a capitoli completa con una navigazione migliorata in tutto il repository.**

#### Added
- **📚 Chapter-Based Learning System**: Ristrutturato l'intero corso in 8 capitoli di apprendimento progressivi
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: Header e footer di navigazione coerenti in tutta la documentazione
- **🎯 Progress Tracking**: Checklist di completamento corso e sistema di verifica dell'apprendimento
- **🗺️ Learning Path Guidance**: Punti di ingresso chiari per diversi livelli di esperienza e obiettivi
- **🔗 Cross-Reference Navigation**: Capitoli correlati e prerequisiti chiaramente collegati

#### Enhanced
- **README Structure**: Trasformato in una piattaforma di apprendimento strutturata con organizzazione per capitoli
- **Documentation Navigation**: Ogni pagina ora include il contesto del capitolo e indicazioni sulla progressione
- **Template Organization**: Esempi e template mappati ai capitoli di apprendimento appropriati
- **Resource Integration**: Cheat sheet, FAQ e guide di studio collegati ai capitoli rilevanti
- **Workshop Integration**: Lab pratici mappati a obiettivi di apprendimento di più capitoli

#### Changed
- **Learning Progression**: Passata da documentazione lineare a apprendimento basato su capitoli flessibile
- **Configuration Placement**: Guida alla configurazione riposizionata come Chapter 3 per un flusso di apprendimento migliore
- **AI Content Integration**: Migliore integrazione di contenuti specifici per l'AI lungo il percorso di apprendimento
- **Production Content**: Pattern avanzati consolidati in Chapter 8 per utenti enterprise

#### Improved
- **User Experience**: Breadcrumb di navigazione chiari e indicatori di progressione per capitolo
- **Accessibility**: Pattern di navigazione coerenti per una traversata del corso più semplice
- **Professional Presentation**: Struttura del corso in stile universitario adatta a formazione accademica e aziendale
- **Learning Efficiency**: Ridotto il tempo per trovare contenuti rilevanti tramite una migliore organizzazione

#### Technical Implementation
- **Navigation Headers**: Navigazione capitoli standardizzata in oltre 40 file di documentazione
- **Footer Navigation**: Indicazioni di progressione coerenti e indicatori di completamento capitolo
- **Cross-Linking**: Sistema di linking interno completo che collega concetti correlati
- **Chapter Mapping**: Template ed esempi chiaramente associati a obiettivi di apprendimento

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Guida di studio ristrutturata per allinearsi al sistema di 8 capitoli
- **🎯 Chapter-Based Assessment**: Ogni capitolo include obiettivi di apprendimento specifici ed esercizi pratici
- **📋 Progress Tracking**: Programma di apprendimento settimanale con risultati misurabili e checklist di completamento
- **❓ Assessment Questions**: Domande di validazione delle conoscenze per ogni capitolo con esiti professionali
- **🛠️ Practical Exercises**: Attività pratiche con scenari reali di deployment e troubleshooting
- **📊 Skill Progression**: Avanzamento chiaro dai concetti base ai pattern enterprise con focus sullo sviluppo di carriera
- **🎓 Certification Framework**: Risultati di sviluppo professionale e sistema di riconoscimento della community
- **⏱️ Timeline Management**: Piano di apprendimento strutturato di 10 settimane con validazione delle milestone

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**Questa versione migliora la soluzione multi-agente per il retail con un naming degli agenti più chiaro e documentazione potenziata.**

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
- **Developer Experience**: Ruoli e responsabilità degli agenti più chiari nella documentazione
- **Production Readiness**: Migliore allineamento con convenzioni di naming enterprise
- **Learning Materials**: Naming degli agenti più intuitivo per scopi educativi
- **Template Usability**: Comprensione semplificata delle funzioni degli agenti e dei pattern di deployment

#### Technical Details
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**Questa versione trasforma il repository in una risorsa di apprendimento completa incentrata sull'AI con integrazione Microsoft Foundry.**

#### Added
- **🤖 AI-First Learning Path**: Ristrutturazione completa con priorità per sviluppatori e ingegneri AI
- **Microsoft Foundry Integration Guide**: Documentazione completa per connettere AZD ai servizi Microsoft Foundry
- **AI Model Deployment Patterns**: Guida dettagliata sulla selezione modelli, configurazione e strategie di deployment in produzione
- **AI Workshop Lab**: Workshop pratico di 2-3 ore per convertire applicazioni AI in soluzioni distribuibili con AZD
- **Production AI Best Practices**: Pattern enterprise per scalabilità, monitoraggio e messa in sicurezza dei carichi di lavoro AI
- **AI-Specific Troubleshooting Guide**: Risoluzione completa dei problemi per Microsoft Foundry Models, Cognitive Services e issue di deployment AI
- **AI Template Gallery**: Collezione in evidenza di template Microsoft Foundry con rating di complessità
- **Workshop Materials**: Struttura completa del workshop con lab pratici e materiali di riferimento

#### Enhanced
- **README Structure**: Incentrato sullo sviluppatore AI con il 45% di interesse della community proveniente da Microsoft Foundry Discord
- **Learning Paths**: Percorso dedicato per sviluppatori AI affiancato da percorsi tradizionali per studenti e ingegneri DevOps
- **Template Recommendations**: Template AI in evidenza inclusi azure-search-openai-demo, contoso-chat, and openai-chat-app-quickstart
- **Community Integration**: Supporto community Discord potenziato con canali e discussioni specifiche per l'AI

#### Security & Production Focus
- **Managed Identity Patterns**: Autenticazione e configurazioni di sicurezza specifiche per l'AI
- **Cost Optimization**: Tracciamento dell'uso dei token e controlli di budget per carichi di lavoro AI
- **Multi-Region Deployment**: Strategie per il deployment globale di applicazioni AI
- **Performance Monitoring**: Metriche specifiche per l'AI e integrazione con Application Insights

#### Documentation Quality
- **Linear Course Structure**: Progressione logica da principianti a pattern avanzati di deployment AI
- **Validated URLs**: Tutti i link esterni al repository verificati e accessibili
- **Complete Reference**: Tutti i link di documentazione interna validati e funzionanti
- **Production Ready**: Pattern di deployment enterprise con esempi reali

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Questa versione rappresenta una revisione significativa della struttura del repository e della presentazione dei contenuti.**

#### Added
- **Structured Learning Framework**: Tutte le pagine di documentazione ora includono sezioni Introduzione, Obiettivi di Apprendimento e Risultati di Apprendimento
- **Navigation System**: Aggiunti link alla lezione Precedente/Successiva in tutta la documentazione per una progressione guidata dell'apprendimento
- **Study Guide**: study-guide.md completo con obiettivi di apprendimento, esercizi pratici e materiali di valutazione
- **Professional Presentation**: Rimosse tutte le emoji per migliorare l'accessibilità e l'aspetto professionale
- **Enhanced Content Structure**: Organizzazione e flusso dei materiali di apprendimento migliorati

#### Changed
- **Documentation Format**: Standardizzata tutta la documentazione con una struttura coerente incentrata sull'apprendimento
- **Navigation Flow**: Implementata progressione logica attraverso tutti i materiali didattici
- **Content Presentation**: Rimosi elementi decorativi a favore di un formato chiaro e professionale
- **Link Structure**: Aggiornati tutti i link interni per supportare il nuovo sistema di navigazione

#### Improved
- **Accessibility**: Rimosse dipendenze dalle emoji per una migliore compatibilità con screen reader
- **Professional Appearance**: Presentazione pulita in stile accademico adatta alla formazione aziendale
- **Learning Experience**: Approccio strutturato con obiettivi e risultati chiari per ogni lezione
- **Content Organization**: Migliore flusso logico e connessione tra argomenti correlati

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Complete getting-started guide series
  - Comprehensive deployment and provisioning documentation
  - Detailed troubleshooting resources and debugging guides
  - Pre-deployment validation tools and procedures

- **Getting Started Module**
  - AZD Basics: Core concepts and terminology
  - Installation Guide: Platform-specific setup instructions
  - Configuration Guide: Environment setup and authentication
  - First Project Tutorial: Step-by-step hands-on learning

- **Deployment and Provisioning Module**
  - Deployment Guide: Complete workflow documentation
  - Provisioning Guide: Infrastructure as Code with Bicep
  - Best practices for production deployments
  - Multi-service architecture patterns

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure resource availability validation
  - SKU Selection: Comprehensive service tier guidance
  - Pre-flight Checks: Automated validation scripts (PowerShell and Bash)
  - Cost estimation and budget planning tools

- **Troubleshooting Module**
  - Common Issues: Frequently encountered problems and solutions
  - Debugging Guide: Systematic troubleshooting methodologies
  - Advanced diagnostic techniques and tools
  - Performance monitoring and optimization

- **Resources and References**
  - Command Cheat Sheet: Quick reference for essential commands
  - Glossary: Comprehensive terminology and acronym definitions
  - FAQ: Detailed answers to common questions
  - External resource links and community connections

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### Features
- **Multi-Platform Support**: Installazione e guide di configurazione per Windows, macOS e Linux
- **Multiple Skill Levels**: Contenuti progettati per studenti fino a sviluppatori professionisti
- **Practical Focus**: Esempi pratici e scenari reali
- **Comprehensive Coverage**: Dai concetti base ai pattern enterprise avanzati
- **Security-First Approach**: Best practice di sicurezza integrate in tutto
- **Cost Optimization**: Linee guida per deployment e gestione risorse a costi contenuti

#### Documentation Quality
- **Detailed Code Examples**: Esempi di codice pratici e testati
- **Step-by-Step Instructions**: Guida chiara e attuabile
- **Comprehensive Error Handling**: Risoluzione dei problemi comuni
- **Best Practices Integration**: Standard di settore e raccomandazioni
- **Version Compatibility**: Aggiornato con i più recenti servizi Azure e funzionalità azd

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Supporto multi-modello**: Modelli di integrazione per Hugging Face, Azure Machine Learning e modelli personalizzati
- **Framework per agenti AI**: Modelli per implementazioni LangChain, Semantic Kernel e AutoGen
- **Pattern RAG avanzati**: Opzioni di database vettoriale oltre Azure AI Search (Pinecone, Weaviate, ecc.)
- **Osservabilità AI**: Monitoraggio avanzato delle prestazioni del modello, dell'utilizzo dei token e della qualità delle risposte

#### Esperienza dello sviluppatore
- **Estensione VS Code**: Esperienza di sviluppo integrata AZD + Microsoft Foundry
- **Integrazione GitHub Copilot**: Generazione di template AZD assistita dall'AI
- **Tutorial interattivi**: Esercizi di coding pratici con convalida automatica per scenari AI
- **Contenuti video**: Tutorial video supplementari per studenti visivi focalizzati su deployment AI

### Versione 4.0.0 (Pianificata)
#### Pattern AI aziendali
- **Framework di governance**: Governance dei modelli AI, conformità e tracce di audit
- **AI multi-tenant**: Pattern per servire più clienti con servizi AI isolati
- **Distribuzione AI Edge**: Integrazione con Azure IoT Edge e istanze di container
- **AI in cloud ibrido**: Pattern di deployment multi-cloud e ibridi per carichi di lavoro AI

#### Funzionalità avanzate
- **Automazione delle pipeline AI**: Integrazione MLOps con pipeline di Azure Machine Learning
- **Sicurezza avanzata**: Pattern zero-trust, endpoint privati e protezione avanzata dalle minacce
- **Ottimizzazione delle prestazioni**: Strategie avanzate di tuning e scaling per applicazioni AI ad alto throughput
- **Distribuzione globale**: Pattern di delivery dei contenuti e caching edge per applicazioni AI

### Versione 3.0.0 (Pianificata) - Sostituita dall'attuale rilascio
#### Aggiunte proposte - Ora implementate in v3.0.0
- ✅ **Contenuti incentrati sull'AI**: Integrazione completa con Microsoft Foundry (Completato)
- ✅ **Tutorial interattivi**: Laboratorio pratico AI (Completato)
- ✅ **Modulo di sicurezza avanzato**: Pattern di sicurezza specifici per AI (Completato)
- ✅ **Ottimizzazione delle prestazioni**: Strategie di tuning per carichi di lavoro AI (Completato)

### Versione 2.1.0 (Pianificata) - Parzialmente implementata in v3.0.0
#### Piccoli miglioramenti - Alcuni completati nell'attuale rilascio
- ✅ **Esempi aggiuntivi**: Scenari di deployment focalizzati sull'AI (Completato)
- ✅ **FAQ estesa**: Domande specifiche sull'AI e risoluzione problemi (Completato)
- **Integrazione strumenti**: Guide migliorate per l'integrazione con IDE ed editor
- ✅ **Espansione del monitoraggio**: Pattern di monitoraggio e alert specifici per l'AI (Completato)

#### Ancora pianificato per un rilascio futuro
- **Documentazione ottimizzata per dispositivi mobili**: Design responsive per l'apprendimento mobile
- **Accesso offline**: Pacchetti di documentazione scaricabili
- **Integrazione IDE avanzata**: Estensione VS Code per flussi di lavoro AZD + AI
- **Cruscotto della community**: Metriche della community in tempo reale e tracciamento dei contributi

## Contribuire al changelog

### Segnalazione delle modifiche
Quando contribuisci a questo repository, assicurati che le voci del changelog includano:

1. **Numero di versione**: Seguendo il versionamento semantico (major.minor.patch)
2. **Data**: Data di rilascio o aggiornamento in formato YYYY-MM-DD
3. **Categoria**: Aggiunto, Modificato, Deprecato, Rimosso, Corretto, Sicurezza
4. **Descrizione chiara**: Descrizione concisa di ciò che è cambiato
5. **Valutazione dell'impatto**: Come le modifiche influenzano gli utenti esistenti

### Categorie di modifica

#### Aggiunto
- Nuove funzionalità, sezioni di documentazione o capacità
- Nuovi esempi, template o risorse didattiche
- Strumenti, script o utility aggiuntive

#### Modificato
- Modifiche alla funzionalità o alla documentazione esistente
- Aggiornamenti per migliorare chiarezza o accuratezza
- Ristrutturazione di contenuti o organizzazione

#### Deprecato
- Funzionalità o approcci che vengono gradualmente eliminati
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
- Cambiamenti incompatibili che richiedono azioni da parte dell'utente
- Ristrutturazioni significative dei contenuti o dell'organizzazione
- Modifiche che alterano l'approccio o la metodologia fondamentale

#### Versione minore (X.Y.0)
- Nuove funzionalità o aggiunte di contenuti
- Miglioramenti mantenendo la retrocompatibilità
- Esempi, strumenti o risorse aggiuntive

#### Versione patch (X.Y.Z)
- Correzioni di bug e rettifiche
- Piccoli miglioramenti ai contenuti esistenti
- Chiarimenti e piccoli perfezionamenti

## Feedback e suggerimenti della community

Incoraggiamo attivamente il feedback della community per migliorare questa risorsa di apprendimento:

### Come fornire feedback
- **GitHub Issues**: Segnala problemi o suggerisci miglioramenti (segnalazioni specifiche per AI benvenute)
- **Discussioni Discord**: Condividi idee e interagisci con la community di Microsoft Foundry
- **Pull Request**: Contribuisci con miglioramenti diretti ai contenuti, specialmente template e guide per l'AI
- **Discord di Microsoft Foundry**: Partecipa al canale #Azure per discussioni su AZD + AI
- **Forum della community**: Partecipa a discussioni più ampie tra sviluppatori Azure

### Categorie di feedback
- **Accuratezza dei contenuti AI**: Correzioni alle integrazioni e alle informazioni di deployment dei servizi AI
- **Esperienza di apprendimento**: Suggerimenti per migliorare il flusso di apprendimento per sviluppatori AI
- **Contenuti AI mancanti**: Richieste per ulteriori template, pattern o esempi AI
- **Accessibilità**: Miglioramenti per esigenze di apprendimento diversificate
- **Integrazione degli strumenti AI**: Suggerimenti per migliorare il flusso di lavoro di sviluppo AI
- **Pattern AI per la produzione**: Richieste di pattern di deployment enterprise per AI

### Impegno di risposta
- **Risposta a issue**: Entro 48 ore per problemi segnalati
- **Richieste di funzionalità**: Valutazione entro una settimana
- **Contributi della community**: Revisione entro una settimana
- **Questioni di sicurezza**: Priorità immediata con risposta accelerata

## Programma di manutenzione

### Aggiornamenti regolari
- **Revisioni mensili**: Accuratezza dei contenuti e convalida dei link
- **Aggiornamenti trimestrali**: Aggiunte e miglioramenti di contenuto significativi
- **Revisioni semestrali**: Ristrutturazione e potenziamento completi
- **Rilasci annuali**: Aggiornamenti di versione principali con miglioramenti significativi

### Monitoraggio e assicurazione della qualità
- **Test automatizzati**: Convalida regolare degli esempi di codice e dei link
- **Integrazione del feedback della community**: Incorporazione regolare dei suggerimenti degli utenti
- **Aggiornamenti tecnologici**: Allineamento con i servizi Azure più recenti e le release di azd
- **Audit di accessibilità**: Revisione regolare per principi di design inclusivi

## Politica di supporto delle versioni

### Supporto per la versione corrente
- **Ultima versione maggiore**: Supporto completo con aggiornamenti regolari
- **Versione maggiore precedente**: Aggiornamenti di sicurezza e correzioni critiche per 12 mesi
- **Versioni legacy**: Supporto comunitario solo, nessun aggiornamento ufficiale

### Linee guida per la migrazione
Quando vengono rilasciate versioni maggiori, forniamo:
- **Guide di migrazione**: Istruzioni passo-passo per la transizione
- **Note di compatibilità**: Dettagli sui cambiamenti incompatibili
- **Supporto strumenti**: Script o utility per assistere la migrazione
- **Supporto della community**: Forum dedicati per domande sulla migrazione

---

**Navigazione**
- **Lezione precedente**: [Guida di studio](resources/study-guide.md)
- **Lezione successiva**: Torna al [README principale](README.md)

**Rimani aggiornato**: Segui questo repository per ricevere notifiche su nuove release e aggiornamenti importanti ai materiali didattici.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avvertenza**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale eseguita da un essere umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->