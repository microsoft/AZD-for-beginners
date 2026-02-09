# Registro delle modifiche - AZD For Beginners

## Introduzione

Questo registro delle modifiche documenta tutte le modifiche, gli aggiornamenti e i miglioramenti rilevanti al repository AZD For Beginners. Seguiamo i principi del versionamento semantico e manteniamo questo registro per aiutare gli utenti a capire cosa è cambiato tra le versioni.

## Obiettivi di apprendimento

Rivedendo questo registro delle modifiche, potrai:
- Rimanere informato sulle nuove funzionalità e sull'aggiunta di contenuti
- Comprendere i miglioramenti apportati alla documentazione esistente
- Tenere traccia delle correzioni di bug e delle rettifiche per garantire l'accuratezza
- Seguire l'evoluzione dei materiali didattici nel tempo

## Risultati di apprendimento

Dopo aver esaminato le voci del registro delle modifiche, sarai in grado di:
- Identificare nuovi contenuti e risorse disponibili per l'apprendimento
- Capire quali sezioni sono state aggiornate o migliorate
- Pianificare il tuo percorso di apprendimento in base ai materiali più aggiornati
- Contribuire con feedback e suggerimenti per futuri miglioramenti

## Cronologia delle versioni

### [v3.17.0] - 2026-02-05

#### Miglioramento della navigazione del corso
**Questa versione migliora la navigazione dei capitoli in README.md con un formato di tabella potenziato.**

#### Modifiche
- **Course Map Table**: Potenziata con link diretti alle lezioni, stime di durata e valutazioni di complessità
- **Pulizia delle cartelle**: Rimosse cartelle vecchie e ridondanti (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validazione dei link**: Tutti i 21+ link interni nella tabella Course Map sono stati verificati

### [v3.16.0] - 2026-02-05

#### Aggiornamenti dei nomi dei prodotti
**Questa versione aggiorna i riferimenti ai prodotti per riflettere il branding Microsoft corrente.**

#### Modifiche
- **Azure AI Foundry → Microsoft Foundry**: Tutti i riferimenti aggiornati nei file non di traduzione
- **Azure AI Agent Service → Foundry Agents**: Nome del servizio aggiornato per riflettere il branding attuale

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

#### Rinominamento delle cartelle
Le vecchie cartelle sono state sostituite da cartelle numerate per capitolo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Migrazioni dei file
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
- **📚 File README per i capitoli**: Creato README.md in ogni cartella di capitolo con:
  - Obiettivi di apprendimento e durata
  - Tabella delle lezioni con descrizioni
  - Comandi di avvio rapido
  - Navigazione verso altri capitoli

#### Modificato
- **🔗 Aggiornati tutti i link interni**: 78+ percorsi aggiornati in tutti i file della documentazione
- **🗺️ Main README.md**: Aggiornata la Course Map con la nuova struttura dei capitoli
- **📝 examples/README.md**: Aggiornati i riferimenti incrociati alle cartelle dei capitoli

#### Rimosso
- Vecchia struttura di cartelle (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Ristrutturazione del repository: navigazione per capitoli
**Questa versione ha aggiunto file README per la navigazione dei capitoli (sostituiti da v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nuova guida agli agenti AI
**Questa versione aggiunge una guida completa per distribuire agenti AI con Azure Developer CLI.**

#### Aggiunto
- **🤖 docs/microsoft-foundry/agents.md**: Guida completa che copre:
  - Cosa sono gli agenti AI e in cosa differiscono dai chatbot
  - Tre template di avvio rapido per agenti (Foundry Agents, Prompty, RAG)
  - Pattern di architettura degli agenti (agente singolo, RAG, multi-agente)
  - Configurazione e personalizzazione degli strumenti
  - Monitoraggio e tracciamento delle metriche
  - Considerazioni sui costi e ottimizzazione
  - Scenari comuni di risoluzione dei problemi
  - Tre esercizi pratici con criteri di successo

#### Struttura del contenuto
- **Introduzione**: Concetti sugli agenti per principianti
- **Avvio rapido**: Distribuire agenti con `azd init --template get-started-with-ai-agents`
- **Pattern architetturali**: Diagrammi visivi dei pattern di agenti
- **Configurazione**: Configurazione degli strumenti e variabili d'ambiente
- **Monitoraggio**: Integrazione con Application Insights
- **Esercizi**: Apprendimento pratico progressivo (20-45 minuti ciascuno)

---

### [v3.12.0] - 2026-02-05

#### Aggiornamento dell'ambiente DevContainer
**Questa versione aggiorna la configurazione del contenitore di sviluppo con strumenti moderni e impostazioni predefinite migliori per l'esperienza di apprendimento AZD.**

#### Modifiche
- **🐳 Base Image**: Aggiornata da `python:3.12-bullseye` a `python:3.12-bookworm` (ultima stable Debian)
- **📛 Container Name**: Rinominato da "Python 3" a "AZD for Beginners" per chiarezza

#### Aggiunto
- **🔧 Nuove funzionalità del Dev Container**:
  - `azure-cli` con supporto Bicep abilitato
  - `node:20` (versione LTS per i template AZD)
  - `github-cli` per la gestione dei template
  - `docker-in-docker` per le distribuzioni di container app

- **🔌 Port Forwarding**: Porte preconfigurate per lo sviluppo comune:
  - 8000 (anteprima MkDocs)
  - 3000 (Web app)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nuove estensioni VS Code**:
  - `ms-python.vscode-pylance` - Enhanced Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions support
  - `ms-azuretools.vscode-docker` - Docker support
  - `ms-azuretools.vscode-bicep` - Bicep language support
  - `ms-azure-devtools.azure-resource-groups` - Azure resource management
  - `yzhang.markdown-all-in-one` - Markdown editing
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid diagram support
  - `redhat.vscode-yaml` - YAML support (for azure.yaml)
  - `eamodio.gitlens` - Git visualization
  - `mhutchie.git-graph` - Git history

- **⚙️ Impostazioni VS Code**: Aggiunte impostazioni predefinite per l'interprete Python, format on save e trimming degli spazi bianchi

- **📦 Updated requirements-dev.txt**:
  - Aggiunto plugin di minificazione per MkDocs
  - Aggiunto pre-commit per la qualità del codice
  - Aggiunti pacchetti Azure SDK (azure-identity, azure-mgmt-resource)

#### Corretto
- **Comando Post-Create**: Ora verifica l'installazione di AZD e Azure CLI all'avvio del contenitore

---

### [v3.11.0] - 2026-02-05

#### Revisione del README per principianti
**Questa versione migliora significativamente il README.md per renderlo più accessibile ai principianti e aggiunge risorse essenziali per sviluppatori AI.**

#### Aggiunto
- **🆚 Confronto Azure CLI vs AZD**: Spiegazione chiara di quando usare ciascuno strumento con esempi pratici
- **🌟 Link Awesome AZD**: Link diretti alla galleria di template della community e alle risorse di contributo:
  - [Galleria Awesome AZD](https://azure.github.io/awesome-azd/) - 200+ template pronti da distribuire
  - [Invia un template](https://github.com/Azure/awesome-azd/issues) - Contributo della community
- **🎯 Guida di avvio rapido**: Sezione semplificata di 3 passaggi per iniziare (Install → Login → Deploy)
- **📊 Tabella di navigazione basata sull'esperienza**: Indicazioni chiare su dove iniziare in base all'esperienza dello sviluppatore

#### Modificato
- **Struttura del README**: Riorganizzata per divulgazione progressiva - informazioni chiave per prime
- **Sezione Introduzione**: Riscritta per spiegare "The Magic of `azd up`" per i principianti assoluti
- **Rimosso contenuto duplicato**: Eliminata la sezione di troubleshooting duplicata
- **Comandi di troubleshooting**: Corretto il riferimento `azd logs` per usare il valido `azd monitor --logs`

#### Corretto
- **🔐 Comandi di autenticazione**: Aggiunti `azd auth login` e `azd auth logout` a cheat-sheet.md
- **Riferimenti a comandi non validi**: Rimosso il rimanente `azd logs` dalla sezione di troubleshooting del README

#### Note
- **Ambito**: Modifiche applicate al main README.md e a resources/cheat-sheet.md
- **Pubblico target**: Miglioramenti specificamente indirizzati agli sviluppatori nuovi ad AZD

---

### [v3.10.0] - 2026-02-05

#### Aggiornamento dell'accuratezza dei comandi Azure Developer CLI
**Questa versione corregge comandi AZD inesistenti in tutta la documentazione, assicurando che tutti gli esempi di codice usino la sintassi valida di Azure Developer CLI.**

#### Corretto
- **🔧 Rimozione dei comandi AZD inesistenti**: Revisione completa e correzione dei comandi non validi:
  - `azd logs` (non esiste) → sostituito con `azd monitor --logs` o alternative Azure CLI
  - sottomoduli di `azd service` (non esistono) → sostituiti con `azd show` e Azure CLI
  - `azd infra import/export/validate` (non esistono) → rimossi o sostituiti con alternative valide
  - flag `azd deploy --rollback/--incremental/--parallel/--detect-changes` (non esistono) → rimossi
  - flag `azd provision --what-if/--rollback` (non esistono) → aggiornati per usare `--preview`
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
- **Strategie di rollback**: Documentazione aggiornata per utilizzare rollback basati su Git (AZD non ha rollback nativo)
- **Visualizzazione dei log**: Sostituiti i riferimenti a `azd logs` con `azd monitor --logs`, `azd monitor --live` e comandi Azure CLI
- **Sezione Performance**: Rimosso l'uso di flag di deployment parallelo/incrementale inesistenti, fornendo alternative valide

#### Dettagli tecnici
- **Comandi AZD validi**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag validi per azd monitor**: `--live`, `--logs`, `--overview`
- **Funzionalità rimosse**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Note
- **Verifica**: Comandi convalidati con Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Completamento del workshop e aggiornamento della qualità della documentazione
**Questa versione completa i moduli interattivi del workshop, corregge tutti i link della documentazione interrotti e migliora la qualità complessiva dei contenuti per gli sviluppatori AI che utilizzano Microsoft AZD.**

#### Aggiunte
- **📝 CONTRIBUTING.md**: Nuovo documento delle linee guida per i contributi con:
  - Istruzioni chiare per segnalare problemi e proporre modifiche
  - Standard di documentazione per i nuovi contenuti
  - Linee guida per gli esempi di codice e convenzioni per i messaggi di commit
  - Informazioni per il coinvolgimento della community

#### Completati
- **🎯 Modulo del workshop 7 (Riepilogo)**: Modulo di riepilogo completamente completato con:
  - Riepilogo completo dei risultati del workshop
  - Sezione sui concetti chiave acquisiti che copre AZD, i template e AI Foundry
  - Raccomandazioni per il proseguimento del percorso di apprendimento
  - Esercizi di sfida del workshop con valutazioni di difficoltà
  - Feedback della community e link di supporto

- **📚 Modulo del workshop 3 (Scomposizione)**: Obiettivi di apprendimento aggiornati con:
  - Guida all'attivazione di GitHub Copilot con i server MCP
  - Comprensione della struttura delle cartelle dei template AZD
  - Modelli di organizzazione per Infrastructure-as-Code (Bicep)
  - Istruzioni per i laboratori pratici

- **🔧 Modulo del workshop 6 (Smantellamento)**: Completato con:
  - Obiettivi per la pulizia delle risorse e la gestione dei costi
  - `azd down` per il deprovisioning sicuro dell'infrastruttura
  - Guida al recupero dei servizi cognitivi cancellati in soft-delete
  - Sollecitazioni per esplorazioni bonus su GitHub Copilot e Azure Portal

#### Correzioni
- **🔗 Correzione link interrotti**: Risolti oltre 15 link interni alla documentazione interrotti:
  - `docs/ai-foundry/ai-model-deployment.md`: Corrette le path verso microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrette le path ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: Sostituito il file inesistente cicd-integration.md con deployment-guide.md
  - `examples/retail-scenario.md`: Corrette le path per FAQ e guida al troubleshooting
  - `examples/container-app/microservices/README.md`: Corrette le path della home del corso e della guida al deployment
  - `resources/faq.md` and `resources/glossary.md`: Aggiornati i riferimenti al capitolo AI
  - `course-outline.md`: Corrette le referenze alla guida dell'istruttore e ai laboratori del workshop AI

- **📅 Banner dello stato del workshop**: Aggiornato da "In costruzione" a stato workshop attivo con data febbraio 2026

- **🔗 Navigazione del workshop**: Corretti i link di navigazione interrotti in workshop README.md che puntavano alla cartella inesistente lab-1-azd-basics

#### Modifiche
- **Presentazione del workshop**: Rimosso l'avviso "in costruzione", il workshop è ora completo e pronto all'uso
- **Coerenza di navigazione**: Garantita la presenza di una corretta navigazione tra i moduli del workshop
- **Riferimenti del percorso di apprendimento**: Aggiornati i riferimenti incrociati dei capitoli per usare i corretti percorsi microsoft-foundry

#### Convalidato
- ✅ Tutti i file markdown in inglese hanno link interni validi
- ✅ I moduli del workshop 0-7 sono completi con obiettivi di apprendimento
- ✅ La navigazione tra capitoli e moduli funziona correttamente
- ✅ Il contenuto è adatto agli sviluppatori AI che utilizzano Microsoft AZD
- ✅ Linguaggio e struttura adatti ai principianti mantenuti in tutto il documento
- ✅ CONTRIBUTING.md fornisce linee guida chiare per i contributori della community

#### Implementazione tecnica
- **Validazione dei link**: Script PowerShell automatizzato ha verificato tutti i link interni .md
- **Audit dei contenuti**: Revisione manuale della completezza del workshop e dell'idoneità per i principianti
- **Sistema di navigazione**: Applicati schemi di navigazione coerenti per capitoli e moduli

#### Note
- **Ambito**: Modifiche applicate solo alla documentazione in inglese
- **Traduzioni**: Le cartelle di traduzione non sono state aggiornate in questa versione (la traduzione automatica verrà sincronizzata successivamente)
- **Durata del workshop**: Il workshop completo ora offre 3-4 ore di apprendimento pratico

---

### [v3.8.0] - 2025-11-19

#### Documentazione avanzata: Monitoraggio, sicurezza e modelli multi-agente
**Questa versione aggiunge lezioni di livello A complete su integrazione con Application Insights, pattern di autenticazione e coordinazione multi-agente per deployment in produzione.**

#### Aggiunte
- **📊 Lezione sull'integrazione di Application Insights**: in `docs/pre-deployment/application-insights.md`:
  - Deployment incentrato su AZD con provisioning automatico
  - Template Bicep completi per Application Insights + Log Analytics
  - Applicazioni Python funzionanti con telemetria personalizzata (oltre 1.200 righe)
  - Pattern di monitoraggio per AI/LLM (tracciamento token/costi Azure OpenAI)
  - 6 diagrammi Mermaid (architettura, tracciamento distribuito, flusso di telemetria)
  - 3 esercizi pratici (alert, dashboard, monitoraggio AI)
  - Esempi di query Kusto e strategie di ottimizzazione dei costi
  - Streaming di metriche live e debug in tempo reale
  - Tempo di apprendimento 40-50 minuti con pattern pronti per la produzione

- **🔐 Lezione su autenticazione e pattern di sicurezza**: in `docs/getting-started/authsecurity.md`:
  - 3 pattern di autenticazione (connection strings, Key Vault, managed identity)
  - Template Bicep infrastrutturali completi per deployment sicuri
  - Codice applicazione Node.js con integrazione Azure SDK
  - 3 esercizi completi (abilitare managed identity, user-assigned identity, rotazione di Key Vault)
  - Best practice di sicurezza e configurazioni RBAC
  - Guida al troubleshooting e analisi dei costi
  - Pattern di autenticazione passwordless pronti per la produzione

- **🤖 Lezione sui pattern di coordinazione multi-agente**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 pattern di coordinazione (sequenziale, parallelo, gerarchico, basato su eventi, consenso)
  - Implementazione completa del servizio orchestratore (Python/Flask, oltre 1.500 righe)
  - 3 implementazioni di agenti specializzati (Research, Writer, Editor)
  - Integrazione con Service Bus per l'accodamento dei messaggi
  - Gestione dello stato con Cosmos DB per sistemi distribuiti
  - 6 diagrammi Mermaid che mostrano le interazioni tra agenti
  - 3 esercizi avanzati (gestione timeout, logica di retry, circuit breaker)
  - Analisi dei costi ($240-565/mese) con strategie di ottimizzazione
  - Integrazione con Application Insights per il monitoraggio

#### Migliorato
- **Capitolo Pre-deployment**: Ora include pattern completi di monitoraggio e coordinazione
- **Capitolo Getting Started**: Potenziato con pattern di autenticazione professionali
- **Prontezza per la produzione**: Copertura completa dalla sicurezza all'osservabilità
- **Schema del corso**: Aggiornato per riferirsi alle nuove lezioni nei Capitoli 3 e 6

#### Modifiche
- **Progressione dell'apprendimento**: Migliore integrazione di sicurezza e monitoraggio in tutto il corso
- **Qualità della documentazione**: Standard di livello A coerenti (95-97%) nelle nuove lezioni
- **Pattern di produzione**: Copertura end-to-end completa per deployment enterprise

#### Miglioramenti
- **Esperienza sviluppatore**: Percorso chiaro dallo sviluppo al monitoraggio in produzione
- **Standard di sicurezza**: Pattern professionali per autenticazione e gestione dei segreti
- **Osservabilità**: Integrazione completa di Application Insights con AZD
- **Workload AI**: Monitoraggio specializzato per Azure OpenAI e sistemi multi-agente

#### Convalidato
- ✅ Tutte le lezioni includono codice completo e funzionante (non frammenti)
- ✅ Diagrammi Mermaid per l'apprendimento visivo (19 in totale nelle 3 lezioni)
- ✅ Esercizi pratici con passaggi di verifica (9 in totale)
- ✅ Template Bicep pronti per la produzione distribuibili via `azd up`
- ✅ Analisi dei costi e strategie di ottimizzazione
- ✅ Guide al troubleshooting e best practice
- ✅ Checkpoint di conoscenza con comandi di verifica

#### Risultati della valutazione della documentazione
- **docs/pre-deployment/application-insights.md**: - Guida completa sul monitoraggio
- **docs/getting-started/authsecurity.md**: - Pattern di sicurezza professionali
- **docs/pre-deployment/coordination-patterns.md**: - Architetture multi-agente avanzate
- **Nuovi contenuti complessivi**: - Standard di alta qualità coerenti

#### Implementazione tecnica
- **Application Insights**: Log Analytics + telemetria personalizzata + tracciamento distribuito
- **Autenticazione**: Managed Identity + Key Vault + pattern RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orchestrazione
- **Monitoraggio**: metriche live + query Kusto + alert + dashboard
- **Gestione dei costi**: strategie di campionamento, politiche di retention, controlli di budget

### [v3.7.0] - 2025-11-19

#### Miglioramenti della qualità della documentazione e nuovo esempio Azure OpenAI
**Questa versione migliora la qualità della documentazione in tutto il repository e aggiunge un esempio completo di deployment Azure OpenAI con interfaccia chat GPT-4.**

#### Aggiunte
- **🤖 Esempio Azure OpenAI Chat**: Deployment completo GPT-4 con implementazione funzionante in `examples/azure-openai-chat/`:
  - Infrastruttura Azure OpenAI completa (deployment del modello GPT-4)
  - Interfaccia chat da linea di comando Python con cronologia delle conversazioni
  - Integrazione con Key Vault per l'archiviazione sicura delle chiavi API
  - Tracciamento dell'uso dei token e stima dei costi
  - Limitazione della frequenza e gestione degli errori
  - README completo con guida al deployment di 35-45 minuti
  - 11 file pronti per la produzione (template Bicep, app Python, configurazione)
- **📚 Esercizi di documentazione**: Aggiunti esercizi pratici alla guida alla configurazione:
  - Esercizio 1: Configurazione multi-ambiente (15 minuti)
  - Esercizio 2: Esercitazione sulla gestione dei segreti (10 minuti)
  - Criteri di successo chiari e passaggi di verifica
- **✅ Verifica del deployment**: Aggiunta sezione di verifica alla guida al deployment:
  - Procedure di health check
  - Checklist dei criteri di successo
  - Output attesi per tutti i comandi di deployment
  - Riferimento rapido per il troubleshooting

#### Migliorato
- **examples/README.md**: Aggiornato a qualità di livello A (93%):
  - Aggiunto azure-openai-chat a tutte le sezioni rilevanti
  - Aggiornato il conteggio degli esempi locali da 3 a 4
  - Aggiunto alla tabella Esempi di applicazioni AI
  - Integrato nel Quick Start per utenti intermedi
  - Aggiunto alla sezione Microsoft Foundry Templates
  - Aggiornata la matrice di confronto e le sezioni sui risultati tecnologici
- **Qualità della documentazione**: Migliorata da B+ (87%) a A- (92%) nella cartella docs:
  - Aggiunti output attesi agli esempi di comandi critici
  - Inclusi passaggi di verifica per le modifiche di configurazione
  - Migliorato l'apprendimento pratico con esercizi pratici

#### Modifiche
- **Progressione dell'apprendimento**: Migliore integrazione di esempi AI per studenti intermedi
- **Struttura della documentazione**: Esercizi più pratici con risultati chiari
- **Processo di verifica**: Aggiunti criteri di successo espliciti ai flussi di lavoro chiave

#### Miglioramenti
- **Esperienza sviluppatore**: Il deployment Azure OpenAI ora richiede 35-45 minuti (vs 60-90 per alternative complesse)
- **Trasparenza sui costi**: Stime dei costi chiare ($50-200/mese) per l'esempio Azure OpenAI
- **Percorso di apprendimento**: Gli sviluppatori AI hanno un punto di ingresso chiaro con azure-openai-chat
- **Standard della documentazione**: Output attesi e passaggi di verifica coerenti

#### Convalidato
- ✅ L'esempio Azure OpenAI è pienamente funzionante con `azd up`
- ✅ Tutti gli 11 file di implementazione sono sintatticamente corretti
- ✅ Le istruzioni del README corrispondono all'effettiva esperienza di deployment
- ✅ Link della documentazione aggiornati in oltre 8 posizioni
- ✅ L'indice degli esempi riflette accuratamente 4 esempi locali
- ✅ Nessun link esterno duplicato nelle tabelle
- ✅ Tutte le referenze di navigazione sono corrette

#### Implementazione tecnica
- **Architettura Azure OpenAI**: GPT-4 + Key Vault + pattern Container Apps
- **Sicurezza**: Managed Identity pronto, segreti in Key Vault
- **Monitoraggio**: Integrazione con Application Insights
- **Gestione dei costi**: Tracciamento token e ottimizzazione dell'uso
- **Deployment**: Singolo comando `azd up` per la configurazione completa

### [v3.6.0] - 2025-11-19

#### Aggiornamento principale: Esempi di deployment per Container App
**Questa versione introduce esempi completi e pronti per la produzione per il deployment di applicazioni containerizzate usando Azure Developer CLI (AZD), con documentazione completa e integrazione nel percorso di apprendimento.**

#### Aggiunte
- **🚀 Esempi Container App**: Nuovi esempi locali in `examples/container-app/`:
  - [Guida principale](examples/container-app/README.md): Panoramica completa dei deployment containerizzati, quick start, produzione e pattern avanzati
  - [API Flask semplice](../../examples/container-app/simple-flask-api): REST API adatta ai principianti con scale-to-zero, probe di integrità, monitoraggio e troubleshooting
  - [Architettura microservizi](../../examples/container-app/microservices): Deployment multi-servizio pronto per la produzione (API Gateway, Product, Order, User, Notification), messaging asincrono, Service Bus, Cosmos DB, Azure SQL, tracciamento distribuito, deployment blue-green/canary
- **Migliori pratiche**: Sicurezza, monitoraggio, ottimizzazione dei costi e linee guida CI/CD per workload containerizzati
- **Esempi di codice**: `azure.yaml` completo, template Bicep e implementazioni di servizi in più linguaggi (Python, Node.js, C#, Go)
- **Testing e troubleshooting**: Scenari di test end-to-end, comandi di monitoraggio, guida al troubleshooting

#### Modifiche
- **README.md**: Aggiornato per includere e collegare i nuovi esempi di Container App nella sezione "Esempi locali - Applicazioni Container"
- **examples/README.md**: Aggiornato per evidenziare gli esempi Container App, aggiungere voci alla matrice di confronto e aggiornare i riferimenti a tecnologie/architetture
- **Course Outline & Study Guide**: Aggiornato per fare riferimento ai nuovi esempi di container app e ai modelli di deployment nei capitoli pertinenti

#### Validato
- ✅ Tutti i nuovi esempi possono essere distribuiti con `azd up` e seguono le best practice
- ✅ Cross-riferimenti della documentazione e navigazione aggiornati
- ✅ Gli esempi coprono scenari da principiante ad avanzato, inclusi microservizi di produzione

#### Note
- **Scope**: Solo documentazione ed esempi in inglese
- **Next Steps**: Ampliare con ulteriori pattern container avanzati e automazione CI/CD nelle versioni future

### [v3.5.0] - 2025-11-19

#### Rinominazione del prodotto: Microsoft Foundry
**Questa versione implementa un cambiamento completo del nome del prodotto da "Microsoft Foundry" a "Microsoft Foundry" in tutta la documentazione in inglese, riflettendo il rebranding ufficiale di Microsoft.**

#### Modifiche
- **🔄 Aggiornamento del nome del prodotto**: Rebranding completo da "Microsoft Foundry" a "Microsoft Foundry"
  - Aggiornati tutti i riferimenti nella documentazione in inglese nella cartella `docs/`
  - Cartella rinominata: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - File rinominato: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totale: 23 riferimenti di contenuto aggiornati in 7 file di documentazione

- **📁 Modifiche alla struttura delle cartelle**:
  - `docs/ai-foundry/` rinominata in `docs/microsoft-foundry/`
  - Tutti i riferimenti incrociati aggiornati per riflettere la nuova struttura delle cartelle
  - Link di navigazione convalidati in tutta la documentazione

- **📄 Rinomina dei file**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tutti i link interni aggiornati per riferirsi al nuovo nome file

#### File aggiornati
- **Documentazione dei capitoli** (7 file):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aggiornamenti dei link di navigazione
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 riferimenti al nome del prodotto aggiornati
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Già utilizza Microsoft Foundry (da aggiornamenti precedenti)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 riferimenti aggiornati (panoramica, feedback della community, documentazione)
  - `docs/getting-started/azd-basics.md` - 4 riferimenti incrociati aggiornati
  - `docs/getting-started/first-project.md` - 2 link di navigazione dei capitoli aggiornati
  - `docs/getting-started/installation.md` - 2 link al capitolo successivo aggiornati
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 riferimenti aggiornati (navigazione, community Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link di navigazione aggiornato
  - `docs/troubleshooting/debugging.md` - 1 link di navigazione aggiornato

- **File della struttura del corso** (2 file):
  - `README.md` - 17 riferimenti aggiornati (panoramica del corso, titoli dei capitoli, sezione template, approfondimenti della community)
  - `course-outline.md` - 14 riferimenti aggiornati (panoramica, obiettivi di apprendimento, risorse del capitolo)

#### Convalidato
- ✅ Nessun riferimento residuo al percorso della cartella "ai-foundry" nella documentazione in inglese
- ✅ Nessun riferimento residuo al nome del prodotto "Microsoft Foundry" nella documentazione in inglese
- ✅ Tutti i link di navigazione funzionano con la nuova struttura delle cartelle
- ✅ Rinomine di file e cartelle completate con successo
- ✅ Riferimenti incrociati tra i capitoli convalidati

#### Note
- **Scope**: Modifiche applicate soltanto alla documentazione in inglese nella cartella `docs/`
- **Translations**: Le cartelle di traduzione (`translations/`) non sono aggiornate in questa versione
- **Workshop**: I materiali del workshop (`workshop/`) non sono aggiornati in questa versione
- **Examples**: I file di esempio potrebbero ancora fare riferimento a nomi legacy (affrontato in un aggiornamento futuro)
- **External Links**: URL esterni e riferimenti al repository GitHub rimangono invariati

#### Guida alla migrazione per i contributori
Se hai branch locali o documentazione che fa riferimento alla vecchia struttura:
1. Aggiorna i riferimenti alle cartelle: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aggiorna i riferimenti ai file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Sostituisci il nome del prodotto: "Microsoft Foundry" → "Microsoft Foundry"
4. Convalida che tutti i link interni della documentazione funzionino ancora

---

### [v3.4.0] - 2025-10-24

#### Miglioramenti alla preview dell'infrastruttura e alla convalida
**Questa versione introduce il supporto completo per la nuova funzionalità preview dell'Azure Developer CLI e migliora l'esperienza utente del workshop.**

#### Aggiunto
- **🧪 azd provision --preview Feature Documentation**: Copertura completa della nuova funzionalità di anteprima dell'infrastruttura
  - Riferimento ai comandi ed esempi d'uso nel cheat sheet
  - Integrazione dettagliata nella guida al provisioning con casi d'uso e benefici
  - Integrazione dei controlli pre-volo per una convalida del deployment più sicura
  - Aggiornamenti della guida introduttiva con pratiche di deployment che privilegiano la sicurezza
- **🚧 Banner di stato del workshop**: Banner HTML professionale che indica lo stato di sviluppo del workshop
  - Design a gradiente con indicatori di costruzione per una comunicazione chiara agli utenti
  - Timestamp dell'ultimo aggiornamento per trasparenza
  - Design responsive per tutti i tipi di dispositivi

#### Migliorato
- **Sicurezza dell'infrastruttura**: la funzionalità di preview integrata in tutta la documentazione sul deployment
- **Convalida pre-deployment**: gli script automatizzati ora includono test di preview dell'infrastruttura
- **Flusso di lavoro dello sviluppatore**: sequenze di comandi aggiornate per includere la preview come best practice
- **Esperienza del workshop**: definite aspettative chiare per gli utenti sullo stato di sviluppo del contenuto

#### Modifiche
- **Best practice per il deployment**: il flusso di lavoro 'preview-first' ora è l'approccio raccomandato
- **Flusso della documentazione**: la convalida dell'infrastruttura è stata spostata più in anticipo nel processo di apprendimento
- **Presentazione del workshop**: comunicazione professionale dello stato con una timeline di sviluppo chiara

#### Migliorato
- **Approccio 'safety-first'**: le modifiche all'infrastruttura possono ora essere convalidate prima del deployment
- **Collaborazione del team**: i risultati della preview possono essere condivisi per revisione e approvazione
- **Consapevolezza dei costi**: migliore comprensione dei costi delle risorse prima del provisioning
- **Mitigazione dei rischi**: riduzione dei fallimenti di deployment tramite convalida preventiva

#### Implementazione tecnica
- **Integrazione multi-documento**: la funzionalità di preview documentata in 4 file chiave
- **Pattern dei comandi**: sintassi ed esempi coerenti in tutta la documentazione
- **Integrazione delle best practice**: la preview inclusa nei workflow e negli script di convalida
- **Indicatori visivi**: marcature chiare delle nuove funzionalità per facilitarne la scoperta

#### Infrastruttura del workshop
- **Comunicazione dello stato**: banner HTML professionale con stile a gradiente
- **Esperienza utente**: lo stato di sviluppo chiaro previene confusione
- **Presentazione professionale**: mantiene la credibilità del repository impostando aspettative
- **Trasparenza della timeline**: timestamp dell'ultimo aggiornamento di ottobre 2025 per responsabilità

### [v3.3.0] - 2025-09-24

#### Materiali del workshop migliorati e esperienza di apprendimento interattiva
**Questa versione introduce materiali completi per il workshop con guide interattive basate su browser e percorsi di apprendimento strutturati.**

#### Aggiunto
- **🎥 Guida interattiva del workshop**: esperienza del workshop basata su browser con funzionalità di anteprima MkDocs
- **📝 Istruzioni strutturate del workshop**: percorso di apprendimento guidato in 7 passaggi dalla scoperta alla personalizzazione
  - 0-Introduction: Panoramica del workshop e configurazione
  - 1-Select-AI-Template: Scoperta dei template e processo di selezione
  - 2-Validate-AI-Template: Procedure di deployment e convalida
  - 3-Deconstruct-AI-Template: Comprendere l'architettura del template
  - 4-Configure-AI-Template: Configurazione e personalizzazione
  - 5-Customize-AI-Template: Modifiche avanzate e iterazioni
  - 6-Teardown-Infrastructure: Pulizia e gestione delle risorse
  - 7-Wrap-up: Riepilogo e prossimi passi
- **🛠️ Tooling del workshop**: configurazione MkDocs con tema Material per un'esperienza di apprendimento migliorata
- **🎯 Percorso di apprendimento pratico**: metodologia in 3 passaggi (Scoperta → Distribuzione → Personalizzazione)
- **📱 Integrazione GitHub Codespaces**: configurazione dell'ambiente di sviluppo senza soluzione di continuità

#### Migliorato
- **AI Workshop Lab**: Esteso con un'esperienza di apprendimento strutturata di 2-3 ore
- **Documentazione del workshop**: Presentazione professionale con navigazione e supporti visivi
- **Progressione dell'apprendimento**: Guida passo-passo chiara dalla selezione del template al deployment in produzione
- **Esperienza dello sviluppatore**: Tooling integrato per flussi di lavoro di sviluppo semplificati

#### Migliorato
- **Accessibilità**: Interfaccia basata su browser con ricerca, funzionalità di copia e selettore del tema
- **Apprendimento autodidatta**: Struttura del workshop flessibile che si adatta a diversi ritmi di apprendimento
- **Applicazione pratica**: Scenari reali di deployment di template AI
- **Integrazione della community**: Integrazione con Discord per supporto e collaborazione nel workshop

#### Funzionalità del workshop
- **Ricerca integrata**: Scoperta rapida di parole chiave e lezioni
- **Copia blocchi di codice**: Funzionalità di copia al passaggio del mouse per tutti gli esempi di codice
- **Selettore del tema**: Supporto modalità scura/chiara per preferenze diverse
- **Risorse visive**: Screenshot e diagrammi per una comprensione migliore
- **Integrazione dell'aiuto**: Accesso diretto a Discord per supporto della community

### [v3.2.0] - 2025-09-17

#### Ristrutturazione importante della navigazione e sistema di apprendimento basato sui capitoli
**Questa versione introduce una struttura di apprendimento completa basata sui capitoli con una navigazione migliorata in tutto il repository.**

#### Aggiunto
- **📚 Sistema di apprendimento basato sui capitoli**: Corso ristrutturato in 8 capitoli di apprendimento progressivi
  - Capitolo 1: Fondamenti e Avvio rapido (⭐ - 30-45 min)
  - Capitolo 2: Sviluppo AI-First (⭐⭐ - 1-2 ore)
  - Capitolo 3: Configurazione e Autenticazione (⭐⭐ - 45-60 min)
  - Capitolo 4: Infrastructure as Code e Deployment (⭐⭐⭐ - 1-1.5 ore)
  - Capitolo 5: Soluzioni AI Multi-Agente (⭐⭐⭐⭐ - 2-3 ore)
  - Capitolo 6: Validazione e Pianificazione Pre-Deployment (⭐⭐ - 1 ora)
  - Capitolo 7: Risoluzione dei problemi e Debugging (⭐⭐ - 1-1.5 ore)
  - Capitolo 8: Pattern di produzione e aziendali (⭐⭐⭐⭐ - 2-3 ore)
- **📚 Sistema di navigazione completo**: Intestazioni e piè di pagina di navigazione coerenti in tutta la documentazione
- **🎯 Tracciamento dei progressi**: Checklist di completamento del corso e sistema di verifica dell'apprendimento
- **🗺️ Guida al percorso di apprendimento**: Punti di ingresso chiari per diversi livelli di esperienza e obiettivi
- **🔗 Navigazione con riferimenti incrociati**: Capitoli correlati e prerequisiti chiaramente collegati

#### Migliorato
- **Struttura del README**: Trasformata in una piattaforma di apprendimento strutturata con organizzazione basata sui capitoli
- **Navigazione della documentazione**: Ogni pagina ora include il contesto del capitolo e indicazioni sulla progressione
- **Organizzazione dei template**: Esempi e template mappati ai capitoli di apprendimento appropriati
- **Integrazione delle risorse**: Cheat sheet, FAQ e guide di studio collegati ai capitoli pertinenti
- **Integrazione del workshop**: Laboratori pratici mappati a obiettivi di apprendimento di più capitoli

#### Modifiche
- **Progressione dell'apprendimento**: Da documentazione lineare a apprendimento flessibile basato sui capitoli
- **Posizionamento della configurazione**: Guida alla configurazione riposizionata come Capitolo 3 per un miglior flusso di apprendimento
- **Integrazione dei contenuti AI**: Migliore integrazione dei contenuti specifici per l'AI lungo il percorso di apprendimento
- **Contenuti di produzione**: Pattern avanzati consolidati nel Capitolo 8 per apprendenti aziendali

#### Migliorato
- **Esperienza utente**: Breadcrumb di navigazione chiari e indicatori di progressione dei capitoli
- **Accessibilità**: Pattern di navigazione coerenti per una navigazione del corso più semplice
- **Presentazione professionale**: Struttura del corso in stile universitario adatta a formazione accademica e aziendale
- **Efficienza dell'apprendimento**: Riduzione del tempo per trovare contenuti rilevanti grazie a una migliore organizzazione

#### Implementazione tecnica
- **Intestazioni di navigazione**: Navigazione standardizzata dei capitoli in oltre 40 file di documentazione
- **Navigazione del piè di pagina**: Indicazioni di progressione coerenti e indicatori di completamento del capitolo
- **Collegamenti incrociati**: Sistema di collegamento interno completo che connette concetti correlati
- **Mappatura dei capitoli**: Template ed esempi chiaramente associati agli obiettivi di apprendimento

#### Miglioramento della guida di studio
- **📚 Obiettivi di apprendimento completi**: Guida di studio ristrutturata per allinearsi al sistema a 8 capitoli
- **🎯 Valutazione basata sui capitoli**: Ogni capitolo include obiettivi di apprendimento specifici ed esercizi pratici
- **📋 Tracciamento dei progressi**: Programma di apprendimento settimanale con risultati misurabili e checklist di completamento
- **❓ Domande di valutazione**: Domande per la validazione delle conoscenze per ogni capitolo con risultati professionali
- **🛠️ Esercizi pratici**: Attività pratiche con scenari reali di deployment e troubleshooting
- **📊 Progressione delle competenze**: Avanzamento chiaro dai concetti base ai pattern aziendali con focus sullo sviluppo della carriera
- **🎓 Framework di certificazione**: Risultati di sviluppo professionale e sistema di riconoscimento della community
- **⏱️ Gestione della timeline**: Piano di apprendimento strutturato di 10 settimane con convalida dei milestone

### [v3.1.0] - 2025-09-17

#### Soluzioni AI multi-agente potenziate
**Questa versione migliora la soluzione retail multi-agente con una migliore denominazione degli agenti e documentazione potenziata.**

#### Modifiche
- **Terminologia multi-agente**: Sostituito "Cora agent" con "Customer agent" in tutta la soluzione retail multi-agente per una comprensione più chiara
- **Architettura degli agenti**: Aggiornata tutta la documentazione, i template ARM e gli esempi di codice per usare la denominazione coerente "Customer agent"
- **Esempi di configurazione**: Modernizzati i pattern di configurazione degli agenti con convenzioni di denominazione aggiornate
- **Coerenza della documentazione**: Garantito che tutti i riferimenti utilizzino nomi degli agenti professionali e descrittivi

#### Migliorato
- **Pacchetto template ARM**: Aggiornato retail-multiagent-arm-template con riferimenti a Customer agent
- **Diagrammi dell'architettura**: Aggiornati i diagrammi Mermaid con la denominazione aggiornata degli agenti
- **Esempi di codice**: Le classi Python e gli esempi di implementazione ora utilizzano la denominazione CustomerAgent
- **Variabili d'ambiente**: Aggiornati tutti gli script di deployment per usare le convenzioni CUSTOMER_AGENT_NAME

#### Migliorato
- **Esperienza dello sviluppatore**: Ruoli e responsabilità degli agenti più chiari nella documentazione
- **Prontezza per la produzione**: Migliore allineamento con le convenzioni di denominazione aziendali
- **Materiali didattici**: Denominazione degli agenti più intuitiva a scopo educativo
- **Usabilità dei template**: Comprensione semplificata delle funzioni degli agenti e dei modelli di distribuzione

#### Dettagli tecnici
- Aggiornati i diagrammi architetturali Mermaid con riferimenti a CustomerAgent
- Sostituiti i nomi di classe CoraAgent con CustomerAgent negli esempi Python
- Modificate le configurazioni JSON del template ARM per utilizzare il tipo di agente "customer"
- Aggiornate le variabili d'ambiente da CORA_AGENT_* a CUSTOMER_AGENT_*
- Aggiornati tutti i comandi di distribuzione e le configurazioni dei container

### [v3.0.0] - 2025-09-12

#### Modifiche principali - Focus sugli sviluppatori AI e integrazione con Microsoft Foundry
**Questa versione trasforma il repository in una risorsa di apprendimento completa focalizzata sull'AI con integrazione di Microsoft Foundry.**

#### Aggiunte
- **🤖 Percorso di apprendimento AI-first**: Ristrutturazione completa che dà priorità agli sviluppatori e agli ingegneri AI
- **Guida all'integrazione di Microsoft Foundry**: Documentazione completa per connettere AZD ai servizi Microsoft Foundry
- **Pattern di distribuzione dei modelli AI**: Guida dettagliata su selezione del modello, configurazione e strategie di distribuzione in produzione
- **Laboratorio workshop AI**: Workshop pratico di 2-3 ore per convertire applicazioni AI in soluzioni distribuibili con AZD
- **Best practice per AI in produzione**: Pattern pronti per l'azienda per scalare, monitorare e mettere in sicurezza i carichi di lavoro AI
- **Guida alla risoluzione dei problemi specifica per l'AI**: Risoluzione completa dei problemi per Azure OpenAI, Cognitive Services e problemi di distribuzione AI
- **Galleria di template AI**: Collezione in evidenza di template Microsoft Foundry con valutazioni di complessità
- **Materiali per workshop**: Struttura completa del workshop con laboratori pratici e materiali di riferimento

#### Migliorato
- **Struttura del README**: Focalizzata sugli sviluppatori AI con dati di interesse della community al 45% provenienti da Microsoft Foundry Discord
- **Percorsi di apprendimento**: Percorso dedicato agli sviluppatori AI accanto ai percorsi tradizionali per studenti e ingegneri DevOps
- **Raccomandazioni sui template**: Template AI in evidenza inclusi azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Integrazione community**: Supporto migliorato della community su Discord con canali e discussioni specifici per l'AI

#### Focus su sicurezza e produzione
- **Pattern di Managed Identity**: Configurazioni di autenticazione e sicurezza specifiche per l'AI
- **Ottimizzazione dei costi**: Monitoraggio dell'uso dei token e controlli di budget per i carichi di lavoro AI
- **Distribuzione multi-regione**: Strategie per la distribuzione globale di applicazioni AI
- **Monitoraggio delle prestazioni**: Metriche specifiche per l'AI e integrazione con Application Insights

#### Qualità della documentazione
- **Struttura del corso lineare**: Progressione logica da principianti a pattern avanzati di distribuzione AI
- **URL convalidati**: Tutti i link esterni al repository verificati e accessibili
- **Riferimento completo**: Tutti i link della documentazione interna convalidati e funzionanti
- **Pronto per la produzione**: Pattern di distribuzione enterprise con esempi reali

### [v2.0.0] - 2025-09-09

#### Modifiche principali - Ristrutturazione del repository e miglioramento professionale
**Questa versione rappresenta una revisione significativa della struttura del repository e della presentazione dei contenuti.**

#### Aggiunte
- **Framework di apprendimento strutturato**: Tutte le pagine della documentazione ora includono sezioni Introduzione, Obiettivi di apprendimento e Risultati di apprendimento
- **Sistema di navigazione**: Aggiunti link Lezione precedente/Successiva in tutta la documentazione per una progressione di apprendimento guidata
- **Guida di studio**: Studio completo study-guide.md con obiettivi di apprendimento, esercizi pratici e materiali di valutazione
- **Presentazione professionale**: Rimosse tutte le emoji per migliorare l'accessibilità e l'aspetto professionale
- **Struttura dei contenuti migliorata**: Organizzazione e flusso dei materiali didattici migliorati

#### Modificato
- **Formato della documentazione**: Standardizzata tutta la documentazione con una struttura coerente orientata all'apprendimento
- **Flusso di navigazione**: Implementata una progressione logica in tutti i materiali didattici
- **Presentazione dei contenuti**: Rimosso elementi decorativi a favore di un formato chiaro e professionale
- **Struttura dei link**: Aggiornati tutti i link interni per supportare il nuovo sistema di navigazione

#### Migliorato
- **Accessibilità**: Rimosse le dipendenze dalle emoji per una migliore compatibilità con gli screen reader
- **Aspetto professionale**: Presentazione pulita in stile accademico adatta all'apprendimento aziendale
- **Esperienza di apprendimento**: Approccio strutturato con obiettivi e risultati chiari per ogni lezione
- **Organizzazione dei contenuti**: Migliore flusso logico e connessione tra argomenti correlati

### [v1.0.0] - 2025-09-09

#### Rilascio iniziale - Repository di apprendimento AZD completo

#### Aggiunte
- **Struttura principale della documentazione**
  - Serie completa di guide per iniziare
  - Documentazione completa per il deployment e il provisioning
  - Risorse dettagliate per la risoluzione dei problemi e guide al debugging
  - Strumenti e procedure di convalida pre-distribuzione

- **Modulo Introduzione**
  - Basi di AZD: Concetti fondamentali e terminologia
  - Guida all'installazione: Istruzioni di configurazione specifiche per piattaforma
  - Guida alla configurazione: Configurazione dell'ambiente e autenticazione
  - Tutorial del primo progetto: Apprendimento pratico passo dopo passo

- **Modulo Deployment e Provisioning**
  - Guida al deployment: Documentazione del flusso di lavoro completa
  - Guida al provisioning: Infrastructure as Code con Bicep
  - Best practice per distribuzioni in produzione
  - Pattern di architettura multi-servizio

- **Modulo di convalida pre-distribuzione**
  - Pianificazione della capacità: Convalida della disponibilità delle risorse Azure
  - Selezione SKU: Guida completa sui livelli di servizio
  - Controlli pre-volo: Script di convalida automatizzati (PowerShell e Bash)
  - Strumenti per stima dei costi e pianificazione del budget

- **Modulo di risoluzione dei problemi**
  - Problemi comuni: Problemi frequenti e soluzioni
  - Guida al debugging: Metodologie sistematiche per la risoluzione dei problemi
  - Tecniche e strumenti diagnostici avanzati
  - Monitoraggio delle prestazioni e ottimizzazione

- **Risorse e riferimenti**
  - Cheat sheet dei comandi: Riferimento rapido per comandi essenziali
  - Glossario: Definizioni complete di terminologia e acronimi
  - FAQ: Risposte dettagliate alle domande frequenti
  - Link a risorse esterne e collegamenti alla community

- **Esempi e template**
  - Esempio di applicazione web semplice
  - Template per il deployment di siti statici
  - Configurazione di applicazioni containerizzate
  - Pattern di integrazione del database
  - Esempi di architettura a microservizi
  - Implementazioni di funzioni serverless

#### Caratteristiche
- **Supporto multi-piattaforma**: Guide di installazione e configurazione per Windows, macOS e Linux
- **Livelli di competenza multipli**: Contenuti pensati per studenti fino a sviluppatori professionisti
- **Approccio pratico**: Esempi pratici e scenari reali
- **Copertura completa**: Dai concetti di base ai pattern enterprise avanzati
- **Approccio 'security-first'**: Best practice di sicurezza integrate in tutto il progetto
- **Ottimizzazione dei costi**: Indicazioni per distribuzioni e gestione delle risorse economiche

#### Qualità della documentazione
- **Esempi di codice dettagliati**: Campioni di codice pratici e testati
- **Istruzioni passo dopo passo**: Indicazioni chiare e pratiche
- **Gestione completa degli errori**: Risoluzione dei problemi per questioni comuni
- **Integrazione delle best practice**: Standard del settore e raccomandazioni
- **Compatibilità di versione**: Aggiornato con gli ultimi servizi Azure e le funzionalità di azd

## Miglioramenti futuri pianificati

### Versione 3.1.0 (Pianificata)
#### Espansione della piattaforma AI
- **Supporto multi-modello**: Pattern di integrazione per Hugging Face, Azure Machine Learning e modelli personalizzati
- **Framework per agenti AI**: Template per distribuzioni LangChain, Semantic Kernel e AutoGen
- **Pattern RAG avanzati**: Opzioni di database vettoriali oltre Azure AI Search (Pinecone, Weaviate, ecc.)
- **Osservabilità AI**: Monitoraggio avanzato delle prestazioni del modello, dell'uso dei token e della qualità delle risposte

#### Esperienza dello sviluppatore
- **Estensione VS Code**: Esperienza di sviluppo integrata AZD + AI Foundry
- **Integrazione GitHub Copilot**: Generazione di template AZD assistita dall'AI
- **Tutorial interattivi**: Esercizi di coding pratici con validazione automatizzata per scenari AI
- **Contenuti video**: Tutorial video supplementari per gli studenti visivi focalizzati sulle distribuzioni AI

### Versione 4.0.0 (Pianificata)
#### Pattern AI aziendali
- **Framework di governance**: Governance dei modelli AI, conformità e tracciamento degli audit
- **AI multi-tenant**: Pattern per servire più clienti con servizi AI isolati
- **Distribuzione Edge AI**: Integrazione con Azure IoT Edge e istanze container
- **AI ibrida cloud**: Pattern di distribuzione multi-cloud e ibrida per carichi di lavoro AI

#### Funzionalità avanzate
- **Automazione delle pipeline AI**: Integrazione MLOps con pipeline di Azure Machine Learning
- **Sicurezza avanzata**: Pattern zero-trust, endpoint privati e protezione avanzata dalle minacce
- **Ottimizzazione delle prestazioni**: Strategie avanzate di tuning e scaling per applicazioni AI ad alto throughput
- **Distribuzione globale**: Pattern di content delivery e caching edge per applicazioni AI

### Versione 3.0.0 (Pianificata) - Sostituita dalla release corrente
#### Aggiunte proposte - Ora implementate in v3.0.0
- ✅ **Contenuti focalizzati sull'AI**: Integrazione completa di Microsoft Foundry (Completato)
- ✅ **Tutorial interattivi**: Laboratorio pratico AI (Completato)
- ✅ **Modulo sicurezza avanzato**: Pattern di sicurezza specifici per l'AI (Completato)
- ✅ **Ottimizzazione delle prestazioni**: Strategie di tuning per carichi di lavoro AI (Completato)

### Versione 2.1.0 (Pianificata) - Parzialmente implementata in v3.0.0
#### Miglioramenti minori - Alcuni completati nella release corrente
- ✅ **Esempi aggiuntivi**: Scenari di distribuzione focalizzati sull'AI (Completato)
- ✅ **FAQ estese**: Domande specifiche sull'AI e risoluzione dei problemi (Completato)
- **Integrazione strumenti**: Guide migliorate per integrazione IDE ed editor
- ✅ **Espansione del monitoraggio**: Pattern di monitoraggio e allerta specifici per l'AI (Completato)

#### Ancora pianificato per una release futura
- **Documentazione mobile-friendly**: Design responsive per apprendimento mobile
- **Accesso offline**: Pacchetti di documentazione scaricabili
- **Integrazione IDE migliorata**: Estensione VS Code per workflow AZD + AI
- **Cruscotto della community**: Metriche in tempo reale della community e tracciamento dei contributi

## Contribuire al changelog

### Segnalazione delle modifiche
Quando contribuisci a questo repository, assicurati che le voci del changelog includano:

1. **Numero di versione**: Seguendo versionamento semantico (major.minor.patch)
2. **Data**: Data di rilascio o aggiornamento nel formato YYYY-MM-DD
3. **Categoria**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Descrizione chiara**: Descrizione concisa di cosa è cambiato
5. **Valutazione dell'impatto**: Come le modifiche influenzano gli utenti esistenti

### Categorie di modifica

#### Aggiunto
- Nuove funzionalità, sezioni della documentazione o capacità
- Nuovi esempi, template o risorse didattiche
- Strumenti aggiuntivi, script o utilità

#### Modificato
- Modifiche alla funzionalità o alla documentazione esistente
- Aggiornamenti per migliorare chiarezza o accuratezza
- Ristrutturazione dei contenuti o dell'organizzazione

#### Deprecato
- Funzionalità o approcci in fase di eliminazione
- Sezioni della documentazione programmate per la rimozione
- Metodi che hanno alternative migliori

#### Rimosso
- Funzionalità, documentazione o esempi non più rilevanti
- Informazioni obsolete o approcci deprecati
- Contenuti ridondanti o consolidati

#### Corretto
- Correzioni di errori nella documentazione o nel codice
- Risoluzione di problemi o issue segnalate
- Miglioramenti alla precisione o alla funzionalità

#### Sicurezza
- Miglioramenti o correzioni relative alla sicurezza
- Aggiornamenti alle best practice di sicurezza
- Risoluzione di vulnerabilità di sicurezza

### Linee guida per il versionamento semantico

#### Versione principale (X.0.0)
- Cambiamenti breaking che richiedono azione da parte degli utenti
- Ristrutturazione significativa dei contenuti o dell'organizzazione
- Modifiche che alterano l'approccio o la metodologia fondamentale

#### Versione minore (X.Y.0)
- Nuove funzionalità o aggiunte di contenuti
- Miglioramenti che mantengono la compatibilità retroattiva
- Esempi, strumenti o risorse aggiuntivi

#### Versione patch (X.Y.Z)
- Correzioni di bug e correzioni
- Miglioramenti minori ai contenuti esistenti
- Chiarimenti e piccoli miglioramenti

## Feedback e suggerimenti della community

Incoraggiamo attivamente il feedback della community per migliorare questa risorsa di apprendimento:

### Come fornire feedback
- **GitHub Issues**: Segnala problemi o suggerisci miglioramenti (issue specifiche per l'AI benvenute)
- **Discussioni Discord**: Condividi idee e interagisci con la community Microsoft Foundry
- **Pull Requests**: Contribuisci miglioramenti diretti ai contenuti, specialmente template e guide AI
- **Microsoft Foundry Discord**: Partecipa al canale #Azure per discussioni su AZD + AI
- **Forum della community**: Partecipa a discussioni più ampie per sviluppatori Azure

### Categorie di feedback
- **Accuratezza dei contenuti AI**: Correzioni alle informazioni sull'integrazione e la distribuzione dei servizi AI
- **Esperienza di apprendimento**: Suggerimenti per migliorare il flusso di apprendimento per sviluppatori AI
- **Contenuti AI mancanti**: Richieste per template, pattern o esempi AI aggiuntivi
- **Accessibilità**: Miglioramenti per esigenze di apprendimento diversificate
- **Integrazione strumenti AI**: Suggerimenti per una migliore integrazione dei workflow di sviluppo AI
- **Pattern AI per produzione**: Richieste di pattern di distribuzione AI enterprise

### Impegno di risposta
- **Risposta alle issue**: Entro 48 ore per problemi segnalati
- **Richieste di funzionalità**: Valutazione entro una settimana
- **Contributi della community**: Revisione entro una settimana
- **Issue di sicurezza**: Priorità immediata con risposta accelerata

## Programma di manutenzione

### Aggiornamenti regolari
- **Revisioni mensili**: Accuratezza dei contenuti e convalida dei link
- **Aggiornamenti trimestrali**: Aggiunte e miglioramenti significativi dei contenuti
- **Revisioni semestrali**: Ristrutturazione e miglioramento completi
- **Rilasci annuali**: Aggiornamenti di versione principali con miglioramenti significativi

### Monitoraggio e assicurazione della qualità
- **Test automatizzati**: Convalida regolare degli esempi di codice e dei link
- **Integrazione del feedback della community**: Incorporazione regolare dei suggerimenti degli utenti
- **Aggiornamenti tecnologici**: Allineamento con gli ultimi servizi Azure e release di azd
- **Audit di accessibilità**: Revisione regolare per principi di design inclusivo

## Politica di supporto delle versioni

### Supporto versione corrente
- **Ultima versione principale**: Supporto completo con aggiornamenti regolari
- **Versione principale precedente**: Aggiornamenti di sicurezza e correzioni critiche per 12 mesi
- **Versioni legacy**: Solo supporto della community, nessun aggiornamento ufficiale

### Guida alla migrazione
Quando vengono rilasciate versioni principali, forniamo:
- **Guide alla migrazione**: Istruzioni passo passo per la transizione
- **Note di compatibilità**: Dettagli sulle modifiche che interrompono la compatibilità
- **Supporto agli strumenti**: Script o utility per assistere la migrazione
- **Supporto della community**: Forum dedicati per domande sulla migrazione

---

**Navigazione**
- **Lezione precedente**: [Guida di studio](resources/study-guide.md)
- **Lezione successiva**: Torna a [README principale](README.md)

**Rimani aggiornato**: Segui questo repository per ricevere notifiche su nuove release e aggiornamenti importanti ai materiali didattici.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Esclusione di responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica basato su intelligenza artificiale [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per garantire accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella sua lingua d'origine deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali fraintendimenti o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->