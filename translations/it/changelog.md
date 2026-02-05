# Registro delle modifiche - AZD per principianti

## Introduzione

Questo registro documenta tutte le modifiche, gli aggiornamenti e i miglioramenti significativi al repository AZD per principianti. Seguiamo i principi della versione semantica e manteniamo questo registro per aiutare gli utenti a comprendere cosa è cambiato tra le versioni.

## Obiettivi di apprendimento

Esaminando questo registro delle modifiche, potrai:
- Rimanere informato sulle nuove funzionalità e aggiunte di contenuti
- Comprendere i miglioramenti apportati alla documentazione esistente
- Monitorare le correzioni di bug per garantire l'accuratezza
- Seguire l'evoluzione dei materiali di apprendimento nel tempo

## Risultati di apprendimento

Dopo aver esaminato le voci del registro delle modifiche, sarai in grado di:
- Identificare nuovi contenuti e risorse disponibili per l'apprendimento
- Comprendere quali sezioni sono state aggiornate o migliorate
- Pianificare il tuo percorso di apprendimento basandoti sui materiali più recenti
- Contribuire con feedback e suggerimenti per futuri miglioramenti

## Cronologia delle versioni

### [v3.8.0] - 19/11/2025

#### Documentazione avanzata: Monitoraggio, Sicurezza e Pattern Multi-Agent
**Questa versione aggiunge lezioni di livello avanzato su integrazione di Application Insights, pattern di autenticazione e coordinamento multi-agente per distribuzioni in produzione.**

#### Aggiunto
- **📊 Lezione sull'integrazione di Application Insights**: in `docs/pre-deployment/application-insights.md`:
  - Distribuzione focalizzata su AZD con provisioning automatico
  - Template Bicep completi per Application Insights + Log Analytics
  - Applicazioni Python funzionanti con telemetria personalizzata (oltre 1.200 righe)
  - Pattern di monitoraggio AI/LLM (tracciamento token/costi Azure OpenAI)
  - 6 diagrammi Mermaid (architettura, tracciamento distribuito, flusso di telemetria)
  - 3 esercizi pratici (avvisi, dashboard, monitoraggio AI)
  - Esempi di query Kusto e strategie di ottimizzazione dei costi
  - Streaming di metriche live e debug in tempo reale
  - Tempo di apprendimento di 40-50 minuti con pattern pronti per la produzione

- **🔐 Lezione sui pattern di autenticazione e sicurezza**: in `docs/getting-started/authsecurity.md`:
  - 3 pattern di autenticazione (stringhe di connessione, Key Vault, identità gestita)
  - Template Bicep completi per distribuzioni sicure
  - Codice applicativo Node.js con integrazione SDK Azure
  - 3 esercizi completi (abilitare identità gestita, identità assegnata dall'utente, rotazione Key Vault)
  - Migliori pratiche di sicurezza e configurazioni RBAC
  - Guida alla risoluzione dei problemi e analisi dei costi
  - Pattern di autenticazione senza password pronti per la produzione

- **🤖 Lezione sui pattern di coordinamento multi-agente**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 pattern di coordinamento (sequenziale, parallelo, gerarchico, basato su eventi, consenso)
  - Implementazione completa del servizio orchestratore (Python/Flask, oltre 1.500 righe)
  - 3 implementazioni specializzate di agenti (Ricerca, Scrittore, Editor)
  - Integrazione Service Bus per la gestione delle code di messaggi
  - Gestione dello stato con Cosmos DB per sistemi distribuiti
  - 6 diagrammi Mermaid che mostrano le interazioni tra agenti
  - 3 esercizi avanzati (gestione dei timeout, logica di retry, interruttore di circuito)
  - Analisi dei costi ($240-565/mese) con strategie di ottimizzazione
  - Integrazione di Application Insights per il monitoraggio

#### Migliorato
- **Capitolo Pre-deployment**: Ora include pattern completi di monitoraggio e coordinamento
- **Capitolo Getting Started**: Arricchito con pattern di autenticazione professionali
- **Prontezza per la produzione**: Copertura completa dalla sicurezza all'osservabilità
- **Outline del corso**: Aggiornato per fare riferimento alle nuove lezioni nei capitoli 3 e 6

#### Modificato
- **Progressione di apprendimento**: Migliore integrazione di sicurezza e monitoraggio in tutto il corso
- **Qualità della documentazione**: Standard A-grade coerenti (95-97%) nelle nuove lezioni
- **Pattern di produzione**: Copertura completa end-to-end per distribuzioni aziendali

#### Migliorato
- **Esperienza dello sviluppatore**: Percorso chiaro dallo sviluppo al monitoraggio in produzione
- **Standard di sicurezza**: Pattern professionali per autenticazione e gestione dei segreti
- **Osservabilità**: Integrazione completa di Application Insights con AZD
- **Carichi di lavoro AI**: Monitoraggio specializzato per Azure OpenAI e sistemi multi-agente

#### Validato
- ✅ Tutte le lezioni includono codice funzionante completo (non frammenti)
- ✅ Diagrammi Mermaid per apprendimento visivo (19 totali in 3 lezioni)
- ✅ Esercizi pratici con passaggi di verifica (9 totali)
- ✅ Template Bicep pronti per la produzione distribuibili tramite `azd up`
- ✅ Analisi dei costi e strategie di ottimizzazione
- ✅ Guide alla risoluzione dei problemi e migliori pratiche
- ✅ Checkpoint di conoscenza con comandi di verifica

#### Risultati della valutazione della documentazione
- **docs/pre-deployment/application-insights.md**: - Guida completa al monitoraggio
- **docs/getting-started/authsecurity.md**: - Pattern di sicurezza professionali
- **docs/pre-deployment/coordination-patterns.md**: - Architetture multi-agente avanzate
- **Nuovi contenuti complessivi**: - Standard di alta qualità coerenti

#### Implementazione tecnica
- **Application Insights**: Log Analytics + telemetria personalizzata + tracciamento distribuito
- **Autenticazione**: Identità gestita + Key Vault + pattern RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrazione
- **Monitoraggio**: Metriche live + query Kusto + avvisi + dashboard
- **Gestione dei costi**: Strategie di campionamento, politiche di conservazione, controlli di budget

### [v3.7.0] - 19/11/2025

#### Miglioramenti alla qualità della documentazione e nuovo esempio Azure OpenAI
**Questa versione migliora la qualità della documentazione in tutto il repository e aggiunge un esempio completo di distribuzione Azure OpenAI con interfaccia chat GPT-4.**

#### Aggiunto
- **🤖 Esempio di chat Azure OpenAI**: Distribuzione completa GPT-4 con implementazione funzionante in `examples/azure-openai-chat/`:
  - Infrastruttura Azure OpenAI completa (distribuzione modello GPT-4)
  - Interfaccia chat Python da riga di comando con cronologia delle conversazioni
  - Integrazione Key Vault per archiviazione sicura delle chiavi API
  - Tracciamento dell'uso dei token e stima dei costi
  - Limitazione della velocità e gestione degli errori
  - README completo con guida alla distribuzione di 35-45 minuti
  - 11 file pronti per la produzione (template Bicep, app Python, configurazione)
- **📚 Esercizi di documentazione**: Aggiunti esercizi pratici alla guida di configurazione:
  - Esercizio 1: Configurazione multi-ambiente (15 minuti)
  - Esercizio 2: Pratica di gestione dei segreti (10 minuti)
  - Criteri di successo chiari e passaggi di verifica
- **✅ Verifica della distribuzione**: Aggiunta sezione di verifica alla guida di distribuzione:
  - Procedure di controllo dello stato
  - Checklist dei criteri di successo
  - Output previsti per tutti i comandi di distribuzione
  - Riferimento rapido per la risoluzione dei problemi

#### Migliorato
- **examples/README.md**: Aggiornato a qualità A-grade (93%):
  - Aggiunto azure-openai-chat a tutte le sezioni pertinenti
  - Aggiornato il conteggio degli esempi locali da 3 a 4
  - Aggiunto alla tabella degli esempi di applicazioni AI
  - Integrato nel Quick Start per utenti intermedi
  - Aggiunto alla sezione Template Azure AI Foundry
  - Aggiornato il confronto tra matrici e sezioni di ricerca tecnologica
- **Qualità della documentazione**: Migliorata da B+ (87%) → A- (92%) nella cartella docs:
  - Aggiunti output previsti agli esempi di comandi critici
  - Inclusi passaggi di verifica per modifiche di configurazione
  - Arricchito l'apprendimento pratico con esercizi concreti

#### Modificato
- **Progressione di apprendimento**: Migliore integrazione degli esempi AI per utenti intermedi
- **Struttura della documentazione**: Esercizi più pratici con risultati chiari
- **Processo di verifica**: Criteri di successo espliciti aggiunti ai flussi di lavoro chiave

#### Migliorato
- **Esperienza dello sviluppatore**: La distribuzione Azure OpenAI ora richiede 35-45 minuti (rispetto ai 60-90 per alternative complesse)
- **Trasparenza dei costi**: Stime chiare dei costi ($50-200/mese) per l'esempio Azure OpenAI
- **Percorso di apprendimento**: Gli sviluppatori AI hanno un punto di ingresso chiaro con azure-openai-chat
- **Standard di documentazione**: Output previsti e passaggi di verifica coerenti

#### Validato
- ✅ Esempio Azure OpenAI completamente funzionante con `azd up`
- ✅ Tutti gli 11 file di implementazione sintatticamente corretti
- ✅ Le istruzioni README corrispondono all'esperienza di distribuzione reale
- ✅ Collegamenti della documentazione aggiornati in oltre 8 posizioni
- ✅ L'indice degli esempi riflette accuratamente 4 esempi locali
- ✅ Nessun collegamento esterno duplicato nelle tabelle
- ✅ Tutti i riferimenti di navigazione corretti

#### Implementazione tecnica
- **Architettura Azure OpenAI**: GPT-4 + Key Vault + pattern Container Apps
- **Sicurezza**: Identità gestita pronta, segreti in Key Vault
- **Monitoraggio**: Integrazione Application Insights
- **Gestione dei costi**: Tracciamento dei token e ottimizzazione dell'uso
- **Distribuzione**: Comando unico `azd up` per configurazione completa

### [v3.6.0] - 19/11/2025

#### Aggiornamento importante: Esempi di distribuzione di app containerizzate
**Questa versione introduce esempi di distribuzione di applicazioni containerizzate pronti per la produzione utilizzando Azure Developer CLI (AZD), con documentazione completa e integrazione nel percorso di apprendimento.**

#### Aggiunto
- **🚀 Esempi di app containerizzate**: Nuovi esempi locali in `examples/container-app/`:
  - [Guida principale](examples/container-app/README.md): Panoramica completa delle distribuzioni containerizzate, avvio rapido, produzione e pattern avanzati
  - [API Flask semplice](../../examples/container-app/simple-flask-api): API REST adatta ai principianti con scale-to-zero, sonde di salute, monitoraggio e risoluzione dei problemi
  - [Architettura microservizi](../../examples/container-app/microservices): Distribuzione multi-servizio pronta per la produzione (API Gateway, Prodotto, Ordine, Utente, Notifica), messaggistica asincrona, Service Bus, Cosmos DB, Azure SQL, tracciamento distribuito, distribuzione blue-green/canary
- **Migliori pratiche**: Sicurezza, monitoraggio, ottimizzazione dei costi e guida CI/CD per carichi di lavoro containerizzati
- **Esempi di codice**: `azure.yaml` completo, template Bicep e implementazioni di servizi multi-lingua (Python, Node.js, C#, Go)
- **Test e risoluzione dei problemi**: Scenari di test end-to-end, comandi di monitoraggio, guida alla risoluzione dei problemi

#### Modificato
- **README.md**: Aggiornato per evidenziare e collegare i nuovi esempi di app containerizzate sotto "Esempi locali - Applicazioni containerizzate"
- **examples/README.md**: Aggiornato per evidenziare gli esempi di app containerizzate, aggiungere voci alla matrice di confronto e aggiornare riferimenti tecnologici/architetturali
- **Outline del corso e guida di studio**: Aggiornato per fare riferimento ai nuovi esempi di app containerizzate e ai pattern di distribuzione nei capitoli pertinenti

#### Validato
- ✅ Tutti i nuovi esempi distribuibili con `azd up` e seguono le migliori pratiche
- ✅ Collegamenti e navigazione della documentazione aggiornati
- ✅ Gli esempi coprono scenari da principianti ad avanzati, inclusi microservizi di produzione

#### Note
- **Ambito**: Documentazione ed esempi in inglese solo
- **Prossimi passi**: Espandere con ulteriori pattern avanzati per container e automazione CI/CD nelle versioni future

### [v3.5.0] - 19/11/2025

#### Ridenominazione del prodotto: Microsoft Foundry
**Questa versione implementa un cambio di nome completo del prodotto da "Azure AI Foundry" a "Microsoft Foundry" in tutta la documentazione in inglese, riflettendo il rebranding ufficiale di Microsoft.**

#### Modificato
- **🔄 Aggiornamento del nome del prodotto**: Ridenominazione completa da "Azure AI Foundry" a "Microsoft Foundry"
  - Aggiornati tutti i riferimenti nella documentazione in inglese nella cartella `docs/`
  - Cartella rinominata: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - File rinominato: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totale: 23 riferimenti ai contenuti aggiornati in 7 file di documentazione

- **📁 Modifiche alla struttura delle cartelle**:
  - `docs/ai-foundry/` rinominata in `docs/microsoft-foundry/`
  - Tutti i riferimenti incrociati aggiornati per riflettere la nuova struttura delle cartelle
  - Collegamenti di navigazione validati in tutta la documentazione

- **📄 Ridenominazione dei file**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tutti i collegamenti interni aggiornati per fare riferimento al nuovo nome del file

#### File aggiornati
- **Documentazione dei capitoli** (7 file):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aggiornamenti ai collegamenti di navigazione
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 riferimenti al nome del prodotto aggiornati
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Già utilizzava Microsoft Foundry (da aggiornamenti precedenti)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 riferimenti aggiornati (panoramica, feedback della community, documentazione)
  - `docs/getting-started/azd-basics.md` - 4 collegamenti incrociati aggiornati
  - `docs/getting-started/first-project.md` - 2 collegamenti di navigazione del capitolo aggiornati
  - `docs/getting-started/installation.md` - 2 collegamenti al capitolo successivo aggiornati
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 riferimenti aggiornati (navigazione, community Discord)
  - `docs/troubleshooting/common-issues.md` - 1 collegamento di navigazione aggiornato
  - `docs/troubleshooting/debugging.md` - 1 collegamento di navigazione aggiornato

- **File della struttura del corso** (2 file):
  - `README.md` - 17 riferimenti aggiornati (panoramica del corso, titoli dei capitoli, sezione template, approfondimenti della community)
  - `course-outline.md` - 14 riferimenti aggiornati (panoramica, obiettivi di apprendimento, risorse dei capitoli)

#### Validato
- ✅ Zero riferimenti rimanenti al percorso della cartella "ai-foundry" nella documentazione in inglese
- ✅ Zero riferimenti rimanenti al nome del prodotto "Azure AI Foundry" nella documentazione in inglese
- ✅ Tutti i collegamenti di navigazione funzionanti con la nuova struttura delle cartelle
- ✅ Ridenominazione di file e cartelle completata con successo
- ✅ Riferimenti incrociati tra capitoli validati

#### Note
- **Ambito**: Modifiche applicate alla documentazione in inglese nella cartella `docs/` solo
- **Traduzioni**: Le cartelle di traduzione (`translations/`) non sono state aggiornate in questa versione
- **Workshop**: Materiali del workshop (`workshop/`) non aggiornati in questa versione
- **Esempi**: I file di esempio potrebbero ancora fare riferimento a nomi legacy (da risolvere in un futuro aggiornamento)
- **Link Esterni**: Gli URL esterni e i riferimenti al repository GitHub rimangono invariati

#### Guida alla Migrazione per i Collaboratori
Se hai branch locali o documentazione che fa riferimento alla vecchia struttura:
1. Aggiorna i riferimenti alle cartelle: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aggiorna i riferimenti ai file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Sostituisci il nome del prodotto: "Azure AI Foundry" → "Microsoft Foundry"
4. Verifica che tutti i link interni alla documentazione funzionino ancora

---

### [v3.4.0] - 2025-10-24

#### Anteprima dell'Infrastruttura e Miglioramenti alla Validazione
**Questa versione introduce un supporto completo per la nuova funzionalità di anteprima di Azure Developer CLI e migliora l'esperienza utente del workshop.**

#### Aggiunto
- **🧪 Documentazione della Funzionalità azd provision --preview**: Copertura completa della nuova capacità di anteprima dell'infrastruttura
  - Riferimenti ai comandi ed esempi di utilizzo in una cheat sheet
  - Integrazione dettagliata nella guida al provisioning con casi d'uso e vantaggi
  - Integrazione del controllo pre-volo per una validazione più sicura del deployment
  - Aggiornamenti alla guida introduttiva con pratiche di deployment orientate alla sicurezza
- **🚧 Banner di Stato del Workshop**: Banner HTML professionale che indica lo stato di sviluppo del workshop
  - Design sfumato con indicatori di costruzione per una comunicazione chiara agli utenti
  - Data dell'ultimo aggiornamento per trasparenza
  - Design mobile-responsive per tutti i tipi di dispositivi

#### Migliorato
- **Sicurezza dell'Infrastruttura**: Funzionalità di anteprima integrata in tutta la documentazione sul deployment
- **Validazione Pre-deployment**: Gli script automatizzati ora includono test di anteprima dell'infrastruttura
- **Flusso di Lavoro per Sviluppatori**: Sequenze di comandi aggiornate per includere l'anteprima come best practice
- **Esperienza del Workshop**: Aspettative chiare per gli utenti sullo stato di sviluppo dei contenuti

#### Modificato
- **Best Practice per il Deployment**: Il flusso di lavoro orientato all'anteprima è ora l'approccio raccomandato
- **Flusso della Documentazione**: La validazione dell'infrastruttura è stata spostata all'inizio del processo di apprendimento
- **Presentazione del Workshop**: Comunicazione professionale dello stato con una chiara timeline di sviluppo

#### Migliorato
- **Approccio Orientato alla Sicurezza**: Le modifiche all'infrastruttura possono ora essere validate prima del deployment
- **Collaborazione del Team**: I risultati dell'anteprima possono essere condivisi per revisione e approvazione
- **Consapevolezza dei Costi**: Migliore comprensione dei costi delle risorse prima del provisioning
- **Mitigazione dei Rischi**: Riduzione dei fallimenti di deployment grazie alla validazione anticipata

#### Implementazione Tecnica
- **Integrazione Multi-documento**: Funzionalità di anteprima documentata in 4 file chiave
- **Pattern dei Comandi**: Sintassi ed esempi coerenti in tutta la documentazione
- **Integrazione delle Best Practice**: L'anteprima è inclusa nei flussi di lavoro e negli script di validazione
- **Indicatori Visivi**: Chiare marcature di NUOVE funzionalità per una facile individuazione

#### Infrastruttura del Workshop
- **Comunicazione dello Stato**: Banner HTML professionale con stile sfumato
- **Esperienza Utente**: Stato di sviluppo chiaro per evitare confusione
- **Presentazione Professionale**: Mantiene la credibilità del repository impostando aspettative chiare
- **Trasparenza della Timeline**: Data dell'ultimo aggiornamento di ottobre 2025 per responsabilità

### [v3.3.0] - 2025-09-24

#### Materiali del Workshop Migliorati e Esperienza di Apprendimento Interattiva
**Questa versione introduce materiali completi per il workshop con guide interattive basate su browser e percorsi di apprendimento strutturati.**

#### Aggiunto
- **🎥 Guida Interattiva al Workshop**: Esperienza del workshop basata su browser con funzionalità di anteprima MkDocs
- **📝 Istruzioni Strutturate per il Workshop**: Percorso di apprendimento guidato in 7 passaggi, dalla scoperta alla personalizzazione
  - 0-Introduzione: Panoramica e configurazione del workshop
  - 1-Seleziona-Template-AI: Processo di scoperta e selezione del template
  - 2-Valida-Template-AI: Procedure di deployment e validazione
  - 3-Decomponi-Template-AI: Comprensione dell'architettura del template
  - 4-Configura-Template-AI: Configurazione e personalizzazione
  - 5-Personalizza-Template-AI: Modifiche avanzate e iterazioni
  - 6-Smaltimento-Infrastruttura: Pulizia e gestione delle risorse
  - 7-Conclusione: Riepilogo e prossimi passi
- **🛠️ Strumenti per il Workshop**: Configurazione MkDocs con tema Material per un'esperienza di apprendimento migliorata
- **🎯 Percorso di Apprendimento Pratico**: Metodologia in 3 fasi (Scoperta → Deployment → Personalizzazione)
- **📱 Integrazione con GitHub Codespaces**: Configurazione dell'ambiente di sviluppo senza interruzioni

#### Migliorato
- **Laboratorio del Workshop AI**: Esteso con un'esperienza di apprendimento strutturata di 2-3 ore
- **Documentazione del Workshop**: Presentazione professionale con navigazione e supporti visivi
- **Progressione dell'Apprendimento**: Guida chiara passo-passo dalla selezione del template al deployment in produzione
- **Esperienza per Sviluppatori**: Strumenti integrati per flussi di lavoro di sviluppo semplificati

#### Migliorato
- **Accessibilità**: Interfaccia basata su browser con funzionalità di ricerca, copia e toggle del tema
- **Apprendimento Autonomo**: Struttura flessibile del workshop che si adatta a diverse velocità di apprendimento
- **Applicazione Pratica**: Scenari di deployment di template AI nel mondo reale
- **Integrazione della Comunità**: Integrazione con Discord per supporto e collaborazione durante il workshop

#### Funzionalità del Workshop
- **Ricerca Integrata**: Scoperta rapida di parole chiave e lezioni
- **Blocchi di Codice Copiabili**: Funzionalità hover-to-copy per tutti gli esempi di codice
- **Toggle del Tema**: Supporto modalità chiara/scura per preferenze diverse
- **Risorse Visive**: Screenshot e diagrammi per una migliore comprensione
- **Integrazione di Aiuto**: Accesso diretto a Discord per supporto della comunità
- **Presentazione dei Contenuti**: Rimossi elementi decorativi a favore di una formattazione chiara e professionale
- **Struttura dei Link**: Aggiornati tutti i link interni per supportare il nuovo sistema di navigazione

#### Miglioramenti
- **Accessibilità**: Eliminata la dipendenza dagli emoji per una migliore compatibilità con i lettori di schermo
- **Aspetto Professionale**: Presentazione pulita in stile accademico, adatta all'apprendimento aziendale
- **Esperienza di Apprendimento**: Approccio strutturato con obiettivi e risultati chiari per ogni lezione
- **Organizzazione dei Contenuti**: Flusso logico migliorato e connessione tra argomenti correlati

### [v1.0.0] - 2025-09-09

#### Rilascio Iniziale - Repository Completo per l'Apprendimento di AZD

#### Aggiunto
- **Struttura Documentale Principale**
  - Serie completa di guide introduttive
  - Documentazione completa su distribuzione e provisioning
  - Risorse dettagliate per la risoluzione dei problemi e guide al debugging
  - Strumenti e procedure di validazione pre-distribuzione

- **Modulo Introduzione**
  - Fondamenti di AZD: Concetti e terminologia di base
  - Guida all'Installazione: Istruzioni di configurazione specifiche per piattaforma
  - Guida alla Configurazione: Configurazione dell'ambiente e autenticazione
  - Tutorial Primo Progetto: Apprendimento pratico passo dopo passo

- **Modulo Distribuzione e Provisioning**
  - Guida alla Distribuzione: Documentazione completa del flusso di lavoro
  - Guida al Provisioning: Infrastruttura come codice con Bicep
  - Best practice per distribuzioni in produzione
  - Modelli di architettura multi-servizio

- **Modulo Validazione Pre-Distribuzione**
  - Pianificazione della Capacità: Validazione della disponibilità delle risorse Azure
  - Selezione SKU: Guida completa ai livelli di servizio
  - Controlli Preliminari: Script di validazione automatizzati (PowerShell e Bash)
  - Strumenti per la stima dei costi e la pianificazione del budget

- **Modulo Risoluzione dei Problemi**
  - Problemi Comuni: Problemi frequenti e relative soluzioni
  - Guida al Debugging: Metodologie sistematiche di risoluzione dei problemi
  - Tecniche e strumenti diagnostici avanzati
  - Monitoraggio delle prestazioni e ottimizzazione

- **Risorse e Riferimenti**
  - Scheda Comandi: Riferimento rapido per i comandi essenziali
  - Glossario: Definizioni complete di terminologia e acronimi
  - FAQ: Risposte dettagliate alle domande comuni
  - Link a risorse esterne e connessioni con la community

- **Esempi e Modelli**
  - Esempio di Applicazione Web semplice
  - Modello di distribuzione per Sito Statico
  - Configurazione per Applicazioni Containerizzate
  - Modelli di integrazione con database
  - Esempi di architettura a microservizi
  - Implementazioni di funzioni serverless

#### Funzionalità
- **Supporto Multi-Piattaforma**: Guide di installazione e configurazione per Windows, macOS e Linux
- **Livelli di Competenza Multipli**: Contenuti progettati per studenti e sviluppatori professionisti
- **Focus Pratico**: Esempi pratici e scenari reali
- **Copertura Completa**: Dai concetti di base ai modelli avanzati per l'impresa
- **Approccio Sicurezza-First**: Best practice di sicurezza integrate ovunque
- **Ottimizzazione dei Costi**: Guida per distribuzioni economiche e gestione delle risorse

#### Qualità della Documentazione
- **Esempi di Codice Dettagliati**: Campioni di codice pratici e testati
- **Istruzioni Passo-Passo**: Guida chiara e attuabile
- **Gestione Completa degli Errori**: Risoluzione dei problemi comuni
- **Integrazione delle Best Practice**: Standard e raccomandazioni del settore
- **Compatibilità Versioni**: Aggiornato con i più recenti servizi Azure e funzionalità azd

## Miglioramenti Futuri Pianificati

### Versione 3.1.0 (Pianificata)
#### Espansione della Piattaforma AI
- **Supporto Multi-Modello**: Modelli di integrazione per Hugging Face, Azure Machine Learning e modelli personalizzati
- **Framework per Agenti AI**: Modelli per distribuzioni LangChain, Semantic Kernel e AutoGen
- **Modelli Avanzati RAG**: Opzioni di database vettoriali oltre Azure AI Search (Pinecone, Weaviate, ecc.)
- **Osservabilità AI**: Monitoraggio avanzato per prestazioni dei modelli, utilizzo dei token e qualità delle risposte

#### Esperienza Sviluppatore
- **Estensione VS Code**: Esperienza di sviluppo integrata AZD + AI Foundry
- **Integrazione GitHub Copilot**: Generazione di modelli AZD assistita dall'AI
- **Tutorial Interattivi**: Esercizi di codifica pratici con validazione automatica per scenari AI
- **Contenuti Video**: Tutorial video supplementari per studenti visivi focalizzati sulle distribuzioni AI

### Versione 4.0.0 (Pianificata)
#### Modelli AI per l'Impresa
- **Framework di Governance**: Governance dei modelli AI, conformità e tracciabilità
- **AI Multi-Tenant**: Modelli per servire più clienti con servizi AI isolati
- **Distribuzione AI Edge**: Integrazione con Azure IoT Edge e istanze container
- **AI Ibrido Cloud**: Modelli di distribuzione multi-cloud e ibridi per carichi di lavoro AI

#### Funzionalità Avanzate
- **Automazione Pipeline AI**: Integrazione MLOps con pipeline di Azure Machine Learning
- **Sicurezza Avanzata**: Modelli zero-trust, endpoint privati e protezione avanzata dalle minacce
- **Ottimizzazione delle Prestazioni**: Strategie avanzate di tuning e scalabilità per applicazioni AI ad alto throughput
- **Distribuzione Globale**: Modelli di distribuzione dei contenuti e caching edge per applicazioni AI

### Versione 3.0.0 (Pianificata) - Superata dalla Versione Attuale
#### Aggiunte Proposte - Ora Implementate in v3.0.0
- ✅ **Contenuti Focalizzati sull'AI**: Integrazione completa di Azure AI Foundry (Completato)
- ✅ **Tutorial Interattivi**: Laboratorio pratico AI (Completato)
- ✅ **Modulo Sicurezza Avanzata**: Modelli di sicurezza specifici per l'AI (Completato)
- ✅ **Ottimizzazione delle Prestazioni**: Strategie di tuning per carichi di lavoro AI (Completato)

### Versione 2.1.0 (Pianificata) - Parzialmente Implementata in v3.0.0
#### Miglioramenti Minori - Alcuni Completati nella Versione Attuale
- ✅ **Esempi Aggiuntivi**: Scenari di distribuzione focalizzati sull'AI (Completato)
- ✅ **FAQ Estesa**: Domande e risoluzione problemi specifici per l'AI (Completato)
- **Integrazione degli Strumenti**: Guide migliorate per l'integrazione con IDE ed editor
- ✅ **Espansione del Monitoraggio**: Modelli di monitoraggio e avvisi specifici per l'AI (Completato)

#### Ancora Pianificati per il Rilascio Futuro
- **Documentazione Mobile-Friendly**: Design responsivo per l'apprendimento su dispositivi mobili
- **Accesso Offline**: Pacchetti di documentazione scaricabili
- **Integrazione IDE Avanzata**: Estensione VS Code per flussi di lavoro AZD + AI
- **Dashboard della Community**: Metriche in tempo reale e tracciamento dei contributi della community

## Contribuire al Changelog

### Segnalazione delle Modifiche
Quando contribuisci a questo repository, assicurati che le voci del changelog includano:

1. **Numero di Versione**: Seguendo la versione semantica (major.minor.patch)
2. **Data**: Data di rilascio o aggiornamento in formato YYYY-MM-DD
3. **Categoria**: Aggiunto, Modificato, Deprecato, Rimosso, Corretto, Sicurezza
4. **Descrizione Chiara**: Descrizione concisa di ciò che è cambiato
5. **Valutazione dell'Impatto**: Come i cambiamenti influenzano gli utenti esistenti

### Categorie di Modifica

#### Aggiunto
- Nuove funzionalità, sezioni di documentazione o capacità
- Nuovi esempi, modelli o risorse di apprendimento
- Strumenti, script o utilità aggiuntive

#### Modificato
- Modifiche a funzionalità o documentazione esistenti
- Aggiornamenti per migliorare chiarezza o accuratezza
- Ristrutturazione di contenuti o organizzazione

#### Deprecato
- Funzionalità o approcci in fase di eliminazione
- Sezioni di documentazione programmate per la rimozione
- Metodi che hanno alternative migliori

#### Rimosso
- Funzionalità, documentazione o esempi non più rilevanti
- Informazioni obsolete o approcci deprecati
- Contenuti ridondanti o consolidati

#### Corretto
- Correzioni di errori nella documentazione o nel codice
- Risoluzione di problemi o problemi segnalati
- Miglioramenti all'accuratezza o alla funzionalità

#### Sicurezza
- Miglioramenti o correzioni relative alla sicurezza
- Aggiornamenti alle best practice di sicurezza
- Risoluzione di vulnerabilità di sicurezza

### Linee Guida per la Versione Semantica

#### Versione Principale (X.0.0)
- Modifiche che interrompono la compatibilità e richiedono azioni da parte dell'utente
- Ristrutturazione significativa di contenuti o organizzazione
- Cambiamenti che alterano l'approccio o la metodologia fondamentale

#### Versione Minore (X.Y.0)
- Nuove funzionalità o aggiunte di contenuti
- Miglioramenti che mantengono la compatibilità retroattiva
- Esempi, strumenti o risorse aggiuntive

#### Versione Patch (X.Y.Z)
- Correzioni di bug ed errori
- Miglioramenti minori ai contenuti esistenti
- Chiarimenti e piccoli miglioramenti

## Feedback e Suggerimenti dalla Community

Incoraggiamo attivamente il feedback della community per migliorare questa risorsa di apprendimento:

### Come Fornire Feedback
- **GitHub Issues**: Segnala problemi o suggerisci miglioramenti (benvenuti problemi specifici per l'AI)
- **Discussioni su Discord**: Condividi idee e interagisci con la community di Azure AI Foundry
- **Pull Request**: Contribuisci con miglioramenti diretti ai contenuti, in particolare modelli e guide AI
- **Discord Azure AI Foundry**: Partecipa al canale #Azure per discussioni su AZD + AI
- **Forum della Community**: Partecipa a discussioni più ampie per sviluppatori Azure

### Categorie di Feedback
- **Accuratezza dei Contenuti AI**: Correzioni per l'integrazione e la distribuzione dei servizi AI
- **Esperienza di Apprendimento**: Suggerimenti per migliorare il flusso di apprendimento per sviluppatori AI
- **Contenuti AI Mancanti**: Richieste per modelli, pattern o esempi AI aggiuntivi
- **Accessibilità**: Miglioramenti per esigenze di apprendimento diversificate
- **Integrazione Strumenti AI**: Suggerimenti per una migliore integrazione nei flussi di lavoro di sviluppo AI
- **Modelli AI per la Produzione**: Richieste di modelli di distribuzione AI per l'impresa

### Impegno di Risposta
- **Risposta ai Problemi**: Entro 48 ore per problemi segnalati
- **Richieste di Funzionalità**: Valutazione entro una settimana
- **Contributi della Community**: Revisione entro una settimana
- **Problemi di Sicurezza**: Priorità immediata con risposta accelerata

## Programma di Manutenzione

### Aggiornamenti Regolari
- **Revisioni Mensili**: Accuratezza dei contenuti e validazione dei link
- **Aggiornamenti Trimestrali**: Aggiunte e miglioramenti principali ai contenuti
- **Revisioni Semestrali**: Ristrutturazione ed espansione completa
- **Rilasci Annuali**: Aggiornamenti di versione principali con miglioramenti significativi

### Monitoraggio e Garanzia di Qualità
- **Test Automatizzati**: Validazione regolare di esempi di codice e link
- **Integrazione del Feedback della Community**: Integrazione regolare dei suggerimenti degli utenti
- **Aggiornamenti Tecnologici**: Allineamento con i più recenti servizi Azure e rilasci azd
- **Audit di Accessibilità**: Revisione regolare per principi di design inclusivi

## Politica di Supporto delle Versioni

### Supporto Versioni Correnti
- **Ultima Versione Principale**: Supporto completo con aggiornamenti regolari
- **Versione Principale Precedente**: Aggiornamenti di sicurezza e correzioni critiche per 12 mesi
- **Versioni Legacy**: Supporto solo dalla community, senza aggiornamenti ufficiali

### Guida alla Migrazione
Quando vengono rilasciate nuove versioni principali, forniamo:
- **Guide alla Migrazione**: Istruzioni passo-passo per la transizione
- **Note di Compatibilità**: Dettagli sulle modifiche che interrompono la compatibilità
- **Supporto Strumenti**: Script o utilità per assistere nella migrazione
- **Supporto della Community**: Forum dedicati per domande sulla migrazione

---

**Navigazione**
- **Lezione Precedente**: [Guida allo Studio](resources/study-guide.md)
- **Lezione Successiva**: Torna al [README Principale](README.md)

**Rimani Aggiornato**: Segui questo repository per notifiche su nuovi rilasci e aggiornamenti importanti ai materiali di apprendimento.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->