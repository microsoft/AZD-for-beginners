<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T17:12:09+00:00",
  "source_file": "changelog.md",
  "language_code": "it"
}
-->
# Registro delle modifiche - AZD Per Principianti

## Introduzione

Questo registro documenta tutte le modifiche, gli aggiornamenti e i miglioramenti significativi al repository AZD Per Principianti. Seguiamo i principi della versione semantica e manteniamo questo registro per aiutare gli utenti a comprendere cosa è cambiato tra le versioni.

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
- Pianificare il tuo percorso di apprendimento basandoti sui materiali più aggiornati
- Contribuire con feedback e suggerimenti per futuri miglioramenti

## Cronologia delle versioni

### [v3.4.0] - 24/10/2025

#### Miglioramenti alla Preview dell'Infrastruttura e alla Validazione
**Questa versione introduce un supporto completo per la nuova funzionalità di anteprima del CLI per sviluppatori Azure e migliora l'esperienza degli utenti nei workshop.**

#### Aggiunto
- **🧪 Documentazione della funzionalità azd provision --preview**: Copertura completa della nuova capacità di anteprima dell'infrastruttura
  - Riferimenti ai comandi ed esempi di utilizzo nel cheat sheet
  - Integrazione dettagliata nella guida alla provisioning con casi d'uso e vantaggi
  - Integrazione del controllo pre-volo per una validazione più sicura del deployment
  - Aggiornamenti alla guida introduttiva con pratiche di deployment sicure
- **🚧 Banner di stato del workshop**: Banner HTML professionale che indica lo stato di sviluppo del workshop
  - Design sfumato con indicatori di costruzione per una comunicazione chiara agli utenti
  - Timestamp dell'ultimo aggiornamento per trasparenza
  - Design mobile-responsive per tutti i tipi di dispositivi

#### Migliorato
- **Sicurezza dell'infrastruttura**: Funzionalità di anteprima integrata in tutta la documentazione di deployment
- **Validazione pre-deployment**: Gli script automatizzati ora includono test di anteprima dell'infrastruttura
- **Flusso di lavoro per sviluppatori**: Sequenze di comandi aggiornate per includere l'anteprima come pratica consigliata
- **Esperienza del workshop**: Aspettative chiare per gli utenti riguardo allo stato di sviluppo dei contenuti

#### Modificato
- **Best practice di deployment**: Flusso di lavoro basato sull'anteprima ora approccio raccomandato
- **Flusso della documentazione**: La validazione dell'infrastruttura è stata spostata prima nel processo di apprendimento
- **Presentazione del workshop**: Comunicazione professionale dello stato con una chiara timeline di sviluppo

#### Migliorato
- **Approccio sicurezza-prima**: Le modifiche all'infrastruttura possono ora essere validate prima del deployment
- **Collaborazione del team**: I risultati dell'anteprima possono essere condivisi per revisione e approvazione
- **Consapevolezza dei costi**: Migliore comprensione dei costi delle risorse prima del provisioning
- **Mitigazione dei rischi**: Riduzione dei fallimenti di deployment grazie alla validazione anticipata

#### Implementazione tecnica
- **Integrazione multi-documento**: Funzionalità di anteprima documentata in 4 file chiave
- **Pattern dei comandi**: Sintassi e esempi coerenti in tutta la documentazione
- **Integrazione delle best practice**: Anteprima inclusa nei flussi di validazione e script
- **Indicatori visivi**: Chiare marcature NUOVE funzionalità per una facile individuazione

#### Infrastruttura del workshop
- **Comunicazione dello stato**: Banner HTML professionale con stile sfumato
- **Esperienza utente**: Stato di sviluppo chiaro evita confusione
- **Presentazione professionale**: Mantiene la credibilità del repository stabilendo aspettative
- **Trasparenza della timeline**: Timestamp dell'ultimo aggiornamento di ottobre 2025 per responsabilità

### [v3.3.0] - 24/09/2025

#### Materiali del workshop migliorati e esperienza di apprendimento interattiva
**Questa versione introduce materiali completi per il workshop con guide interattive basate su browser e percorsi di apprendimento strutturati.**

#### Aggiunto
- **🎥 Guida interattiva al workshop**: Esperienza di workshop basata su browser con capacità di anteprima MkDocs
- **📝 Istruzioni strutturate per il workshop**: Percorso di apprendimento guidato in 7 fasi, dalla scoperta alla personalizzazione
  - 0-Introduzione: Panoramica e configurazione del workshop
  - 1-Seleziona-Modello-AI: Processo di scoperta e selezione del modello
  - 2-Valida-Modello-AI: Procedure di deployment e validazione
  - 3-Decomponi-Modello-AI: Comprensione dell'architettura del modello
  - 4-Configura-Modello-AI: Configurazione e personalizzazione
  - 5-Personalizza-Modello-AI: Modifiche avanzate e iterazioni
  - 6-Rimozione-Infrastruttura: Pulizia e gestione delle risorse
  - 7-Conclusione: Riepilogo e prossimi passi
- **🛠️ Strumenti per il workshop**: Configurazione MkDocs con tema Material per un'esperienza di apprendimento migliorata
- **🎯 Percorso di apprendimento pratico**: Metodologia in 3 fasi (Scoperta → Deployment → Personalizzazione)
- **📱 Integrazione con GitHub Codespaces**: Configurazione dell'ambiente di sviluppo senza interruzioni

#### Migliorato
- **Laboratorio del workshop AI**: Esteso con un'esperienza di apprendimento strutturata di 2-3 ore
- **Documentazione del workshop**: Presentazione professionale con navigazione e supporti visivi
- **Progressione dell'apprendimento**: Guida chiara passo-passo dalla selezione del modello al deployment in produzione
- **Esperienza dello sviluppatore**: Strumenti integrati per flussi di lavoro di sviluppo semplificati

#### Migliorato
- **Accessibilità**: Interfaccia basata su browser con ricerca, funzionalità di copia e cambio tema
- **Apprendimento autonomo**: Struttura del workshop flessibile per adattarsi a diverse velocità di apprendimento
- **Applicazione pratica**: Scenari di deployment di modelli AI nel mondo reale
- **Integrazione della comunità**: Integrazione con Discord per supporto e collaborazione nel workshop

#### Caratteristiche del workshop
- **Ricerca integrata**: Scoperta rapida di parole chiave e lezioni
- **Blocchi di codice copiabili**: Funzionalità di copia al passaggio del mouse per tutti gli esempi di codice
- **Cambio tema**: Supporto modalità chiara/scura per diverse preferenze
- **Risorse visive**: Screenshot e diagrammi per una migliore comprensione
- **Integrazione di aiuto**: Accesso diretto a Discord per supporto della comunità

### [v3.2.0] - 17/09/2025

#### Ristrutturazione della navigazione e sistema di apprendimento basato su capitoli
**Questa versione introduce una struttura di apprendimento basata su capitoli con una navigazione migliorata in tutto il repository.**

#### Aggiunto
- **📚 Sistema di apprendimento basato su capitoli**: Ristrutturazione dell'intero corso in 8 capitoli di apprendimento progressivo
  - Capitolo 1: Fondamenti e Avvio Rapido (⭐ - 30-45 min)
  - Capitolo 2: Sviluppo AI-First (⭐⭐ - 1-2 ore)
  - Capitolo 3: Configurazione e Autenticazione (⭐⭐ - 45-60 min)
  - Capitolo 4: Infrastruttura come Codice e Deployment (⭐⭐⭐ - 1-1.5 ore)
  - Capitolo 5: Soluzioni AI Multi-Agente (⭐⭐⭐⭐ - 2-3 ore)
  - Capitolo 6: Validazione e Pianificazione Pre-Deployment (⭐⭐ - 1 ora)
  - Capitolo 7: Risoluzione dei problemi e Debugging (⭐⭐ - 1-1.5 ore)
  - Capitolo 8: Modelli di Produzione e Enterprise (⭐⭐⭐⭐ - 2-3 ore)
- **📚 Sistema di navigazione completo**: Intestazioni e piè di pagina di navigazione coerenti in tutta la documentazione
- **🎯 Tracciamento del progresso**: Checklist di completamento del corso e sistema di verifica dell'apprendimento
- **🗺️ Guida al percorso di apprendimento**: Punti di ingresso chiari per diversi livelli di esperienza e obiettivi
- **🔗 Navigazione incrociata**: Capitoli correlati e prerequisiti chiaramente collegati

#### Migliorato
- **Struttura del README**: Trasformato in una piattaforma di apprendimento strutturata con organizzazione basata su capitoli
- **Navigazione della documentazione**: Ogni pagina ora include il contesto del capitolo e la guida alla progressione
- **Organizzazione dei modelli**: Esempi e modelli mappati ai capitoli di apprendimento appropriati
- **Integrazione delle risorse**: Cheat sheet, FAQ e guide di studio collegati ai capitoli pertinenti
- **Integrazione del workshop**: Laboratori pratici mappati a obiettivi di apprendimento di più capitoli

#### Modificato
- **Progressione dell'apprendimento**: Passaggio da una documentazione lineare a un apprendimento flessibile basato su capitoli
- **Posizionamento della configurazione**: Guida alla configurazione riposizionata come Capitolo 3 per un flusso di apprendimento migliore
- **Integrazione dei contenuti AI**: Migliore integrazione dei contenuti specifici per l'AI lungo il percorso di apprendimento
- **Contenuti di produzione**: Modelli avanzati consolidati nel Capitolo 8 per i discenti aziendali

#### Migliorato
- **Esperienza utente**: Chiari indicatori di navigazione e progressione dei capitoli
- **Accessibilità**: Pattern di navigazione coerenti per una più facile traversata del corso
- **Presentazione professionale**: Struttura del corso in stile universitario adatta per formazione accademica e aziendale
- **Efficienza dell'apprendimento**: Tempo ridotto per trovare contenuti rilevanti grazie a una migliore organizzazione

#### Implementazione tecnica
- **Intestazioni di navigazione**: Navigazione standardizzata dei capitoli in oltre 40 file di documentazione
- **Navigazione a piè di pagina**: Guida alla progressione coerente e indicatori di completamento dei capitoli
- **Collegamenti incrociati**: Sistema di collegamento interno completo che collega concetti correlati
- **Mappatura dei capitoli**: Modelli ed esempi chiaramente associati agli obiettivi di apprendimento

#### Miglioramento della guida di studio
- **📚 Obiettivi di apprendimento completi**: Guida di studio ristrutturata per allinearsi al sistema a 8 capitoli
- **🎯 Valutazione basata sui capitoli**: Ogni capitolo include obiettivi di apprendimento specifici ed esercizi pratici
- **📋 Tracciamento del progresso**: Programma di apprendimento settimanale con risultati misurabili e checklist di completamento
- **❓ Domande di valutazione**: Domande di validazione della conoscenza per ogni capitolo con risultati professionali
- **🛠️ Esercizi pratici**: Attività pratiche con scenari di deployment reali e risoluzione dei problemi
- **📊 Progressione delle competenze**: Avanzamento chiaro dai concetti di base ai modelli aziendali con focus sullo sviluppo professionale
- **🎓 Struttura di certificazione**: Risultati di sviluppo professionale e sistema di riconoscimento della comunità
- **⏱️ Gestione del tempo**: Piano di apprendimento strutturato di 10 settimane con validazione delle tappe

### [v3.1.0] - 17/09/2025

#### Soluzioni AI Multi-Agente migliorate
**Questa versione migliora la soluzione multi-agente per il retail con una migliore denominazione degli agenti e documentazione migliorata.**

#### Modificato
- **Terminologia Multi-Agente**: Sostituito "agente Cora" con "agente Cliente" in tutta la soluzione multi-agente per il retail per una comprensione più chiara
- **Architettura degli agenti**: Aggiornata tutta la documentazione, i modelli ARM e gli esempi di codice per utilizzare una denominazione coerente "agente Cliente"
- **Esempi di configurazione**: Modernizzati i pattern di configurazione degli agenti con convenzioni di denominazione aggiornate
- **Coerenza della documentazione**: Garantito che tutti i riferimenti utilizzino nomi di agenti professionali e descrittivi

#### Migliorato
- **Pacchetto Template ARM**: Template retail-multiagent-arm aggiornato con riferimenti all'agente Cliente
- **Diagrammi di architettura**: Diagrammi Mermaid aggiornati con la nuova denominazione degli agenti
- **Esempi di codice**: Le classi Python e gli esempi di implementazione ora utilizzano la denominazione CustomerAgent
- **Variabili di ambiente**: Aggiornati tutti gli script di deployment per utilizzare convenzioni CUSTOMER_AGENT_NAME

#### Migliorato
- **Esperienza dello sviluppatore**: Ruoli e responsabilità degli agenti più chiari nella documentazione
- **Prontezza per la produzione**: Migliore allineamento con le convenzioni di denominazione aziendali
- **Materiali di apprendimento**: Denominazione degli agenti più intuitiva per scopi educativi
- **Usabilità dei template**: Comprensione semplificata delle funzioni degli agenti e dei pattern di deployment

#### Dettagli tecnici
- Diagrammi di architettura Mermaid aggiornati con riferimenti a CustomerAgent
- Sostituiti i nomi delle classi CoraAgent con CustomerAgent negli esempi Python
- Modificati i modelli di configurazione JSON ARM per utilizzare il tipo di agente "customer"
- Aggiornate le variabili di ambiente da CORA_AGENT_* a CUSTOMER_AGENT_*
- Rinnovati tutti i comandi di deployment e le configurazioni dei container

### [v3.0.0] - 12/09/2025

#### Cambiamenti principali - Focus sugli sviluppatori AI e integrazione con Azure AI Foundry
**Questa versione trasforma il repository in una risorsa di apprendimento completa focalizzata sull'AI con integrazione con Azure AI Foundry.**

#### Aggiunto
- **🤖 Percorso di apprendimento AI-First**: Ristrutturazione completa con priorità per sviluppatori e ingegneri AI
- **Guida all'integrazione con Azure AI Foundry**: Documentazione completa per connettere AZD con i servizi Azure AI Foundry
- **Pattern di deployment dei modelli AI**: Guida dettagliata su selezione, configurazione e strategie di deployment in produzione
- **Laboratorio AI Workshop**: Workshop pratico di 2-3 ore per convertire applicazioni AI in soluzioni deployabili con AZD
- **Best practice AI per la produzione**: Pattern pronti per l'azienda per scalare, monitorare e proteggere i carichi di lavoro AI
- **Guida alla risoluzione dei problemi specifici per l'AI**: Risoluzione completa dei problemi per Azure OpenAI, Cognitive Services e problemi di deployment AI
- **Galleria di template AI**: Collezione di template Azure AI Foundry con valutazioni di complessità
- **Materiali del workshop**: Struttura completa del workshop con laboratori pratici e materiali di riferimento

#### Migliorato
- **Struttura del README**: Focalizzata sugli sviluppatori AI con dati di interesse della comunità del 45% da Discord di Azure AI Foundry
- **Percorsi di apprendimento**: Percorso dedicato agli sviluppatori AI accanto ai percorsi tradizionali per studenti e ingegneri DevOps
- **Raccomandazioni sui template**: Template AI consigliati tra cui azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Integrazione della comunità**: Supporto migliorato alla comunità Discord con canali e discussioni specifici per l'AI

#### Focus su sicurezza e produzione
- **Pattern di identità gestita**: Configurazioni di autenticazione e sicurezza specifiche per l'AI
- **Ottimizzazione dei costi**: Monitoraggio dell'uso dei token e controlli di budget per i carichi di lavoro AI
- **Deployment multi-regione**: Strategie per il deployment globale delle applicazioni AI
- **Monitoraggio delle prestazioni**: Metriche specifiche per l'AI e integrazione con Application Insights

#### Qualità della documentazione
- **Struttura del corso lineare**: Progressione logica dai pattern di deployment AI per principianti a quelli avanzati
- **URL validati**: Tutti i link ai repository esterni verificati e accessibili
- **Riferimento completo**: Tutti i link interni alla documentazione validati e funzionanti
- **Pronto per la produzione**: Pattern di deployment aziendali con esempi reali

### [v2.0.0] - 09/09/2025

#### Cambiamenti principali - Ristrutturazione del repository
- **Formato della Documentazione**: Standardizzato tutta la documentazione con una struttura coerente focalizzata sull'apprendimento
- **Flusso di Navigazione**: Implementato una progressione logica attraverso tutti i materiali di apprendimento
- **Presentazione dei Contenuti**: Rimossi elementi decorativi a favore di una formattazione chiara e professionale
- **Struttura dei Link**: Aggiornati tutti i link interni per supportare il nuovo sistema di navigazione

#### Miglioramenti
- **Accessibilità**: Eliminata la dipendenza dagli emoji per una migliore compatibilità con i lettori di schermo
- **Aspetto Professionale**: Presentazione pulita, in stile accademico, adatta all'apprendimento aziendale
- **Esperienza di Apprendimento**: Approccio strutturato con obiettivi e risultati chiari per ogni lezione
- **Organizzazione dei Contenuti**: Migliore flusso logico e connessione tra argomenti correlati

### [v1.0.0] - 2025-09-09

#### Rilascio Iniziale - Repository Completo per l'Apprendimento AZD

#### Aggiunto
- **Struttura Principale della Documentazione**
  - Serie completa di guide introduttive
  - Documentazione completa su distribuzione e provisioning
  - Risorse dettagliate per la risoluzione dei problemi e guide di debug
  - Strumenti e procedure di validazione pre-distribuzione

- **Modulo Introduzione**
  - Fondamenti di AZD: Concetti e terminologia principali
  - Guida all'Installazione: Istruzioni di configurazione specifiche per piattaforma
  - Guida alla Configurazione: Configurazione dell'ambiente e autenticazione
  - Tutorial sul Primo Progetto: Apprendimento pratico passo dopo passo

- **Modulo Distribuzione e Provisioning**
  - Guida alla Distribuzione: Documentazione completa del flusso di lavoro
  - Guida al Provisioning: Infrastructure as Code con Bicep
  - Best practice per distribuzioni in produzione
  - Modelli di architettura multi-servizio

- **Modulo Validazione Pre-Distribuzione**
  - Pianificazione della Capacità: Validazione della disponibilità delle risorse Azure
  - Selezione SKU: Guida completa ai livelli di servizio
  - Controlli Preliminari: Script di validazione automatizzati (PowerShell e Bash)
  - Strumenti di stima dei costi e pianificazione del budget

- **Modulo Risoluzione dei Problemi**
  - Problemi Comuni: Problemi frequenti e soluzioni
  - Guida al Debug: Metodologie sistematiche di risoluzione dei problemi
  - Tecniche e strumenti diagnostici avanzati
  - Monitoraggio delle prestazioni e ottimizzazione

- **Risorse e Riferimenti**
  - Cheat Sheet dei Comandi: Riferimento rapido per i comandi essenziali
  - Glossario: Definizioni complete di terminologia e acronimi
  - FAQ: Risposte dettagliate alle domande comuni
  - Link a risorse esterne e connessioni con la comunità

- **Esempi e Modelli**
  - Esempio di Applicazione Web semplice
  - Modello di distribuzione per Sito Statico
  - Configurazione per Applicazioni Container
  - Modelli di integrazione con database
  - Esempi di architettura microservizi
  - Implementazioni di funzioni serverless

#### Funzionalità
- **Supporto Multi-Piattaforma**: Guide di installazione e configurazione per Windows, macOS e Linux
- **Livelli di Competenza Multipli**: Contenuti progettati per studenti e sviluppatori professionisti
- **Focus Pratico**: Esempi pratici e scenari reali
- **Copertura Completa**: Dai concetti di base ai modelli avanzati per l'azienda
- **Approccio alla Sicurezza**: Best practice di sicurezza integrate ovunque
- **Ottimizzazione dei Costi**: Guida per distribuzioni economiche e gestione delle risorse

#### Qualità della Documentazione
- **Esempi di Codice Dettagliati**: Campioni di codice pratici e testati
- **Istruzioni Passo-Passo**: Indicazioni chiare e attuabili
- **Gestione Completa degli Errori**: Risoluzione dei problemi comuni
- **Integrazione delle Best Practice**: Standard e raccomandazioni del settore
- **Compatibilità Versioni**: Aggiornato con i servizi Azure più recenti e le funzionalità azd

## Miglioramenti Futuri Pianificati

### Versione 3.1.0 (Pianificata)
#### Espansione della Piattaforma AI
- **Supporto Multi-Modello**: Modelli di integrazione per Hugging Face, Azure Machine Learning e modelli personalizzati
- **Framework per Agenti AI**: Modelli per distribuzioni LangChain, Semantic Kernel e AutoGen
- **Modelli RAG Avanzati**: Opzioni di database vettoriale oltre Azure AI Search (Pinecone, Weaviate, ecc.)
- **Osservabilità AI**: Monitoraggio avanzato delle prestazioni dei modelli, utilizzo dei token e qualità delle risposte

#### Esperienza per Sviluppatori
- **Estensione VS Code**: Esperienza di sviluppo integrata AZD + AI Foundry
- **Integrazione GitHub Copilot**: Generazione assistita di modelli AZD con AI
- **Tutorial Interattivi**: Esercizi di codifica pratici con validazione automatica per scenari AI
- **Contenuti Video**: Tutorial video supplementari per studenti visivi focalizzati sulle distribuzioni AI

### Versione 4.0.0 (Pianificata)
#### Modelli AI per l'Azienda
- **Framework di Governance**: Governance dei modelli AI, conformità e tracciabilità
- **AI Multi-Tenant**: Modelli per servire più clienti con servizi AI isolati
- **Distribuzione AI Edge**: Integrazione con Azure IoT Edge e istanze container
- **AI Cloud Ibrido**: Modelli di distribuzione multi-cloud e ibridi per carichi di lavoro AI

#### Funzionalità Avanzate
- **Automazione Pipeline AI**: Integrazione MLOps con pipeline Azure Machine Learning
- **Sicurezza Avanzata**: Modelli zero-trust, endpoint privati e protezione avanzata dalle minacce
- **Ottimizzazione delle Prestazioni**: Strategie avanzate di tuning e scaling per applicazioni AI ad alta capacità
- **Distribuzione Globale**: Modelli di distribuzione dei contenuti e caching edge per applicazioni AI

### Versione 3.0.0 (Pianificata) - Superata dalla Versione Corrente
#### Aggiunte Proposte - Ora Implementate nella v3.0.0
- ✅ **Contenuti Focalizzati sull'AI**: Integrazione completa con Azure AI Foundry (Completato)
- ✅ **Tutorial Interattivi**: Laboratorio pratico per AI (Completato)
- ✅ **Modulo Sicurezza Avanzata**: Modelli di sicurezza specifici per AI (Completato)
- ✅ **Ottimizzazione delle Prestazioni**: Strategie di tuning per carichi di lavoro AI (Completato)

### Versione 2.1.0 (Pianificata) - Parzialmente Implementata nella v3.0.0
#### Miglioramenti Minori - Alcuni Completati nella Versione Corrente
- ✅ **Esempi Aggiuntivi**: Scenari di distribuzione focalizzati sull'AI (Completato)
- ✅ **FAQ Estesa**: Domande e risoluzione problemi specifici per AI (Completato)
- **Integrazione Strumenti**: Guide migliorate per l'integrazione con IDE ed editor
- ✅ **Espansione Monitoraggio**: Modelli di monitoraggio e avvisi specifici per AI (Completato)

#### Ancora Pianificati per il Rilascio Futuro
- **Documentazione Mobile-Friendly**: Design responsivo per l'apprendimento su dispositivi mobili
- **Accesso Offline**: Pacchetti di documentazione scaricabili
- **Integrazione Avanzata con IDE**: Estensione VS Code per flussi di lavoro AZD + AI
- **Dashboard della Comunità**: Metriche in tempo reale e monitoraggio dei contributi della comunità

## Contributi al Changelog

### Segnalazione delle Modifiche
Quando contribuisci a questo repository, assicurati che le voci del changelog includano:

1. **Numero di Versione**: Seguendo la versione semantica (major.minor.patch)
2. **Data**: Data di rilascio o aggiornamento in formato YYYY-MM-DD
3. **Categoria**: Aggiunto, Modificato, Deprecato, Rimosso, Corretto, Sicurezza
4. **Descrizione Chiara**: Descrizione concisa di ciò che è cambiato
5. **Valutazione dell'Impatto**: Come le modifiche influenzano gli utenti esistenti

### Categorie di Modifica

#### Aggiunto
- Nuove funzionalità, sezioni di documentazione o capacità
- Nuovi esempi, modelli o risorse di apprendimento
- Strumenti, script o utilità aggiuntivi

#### Modificato
- Modifiche alla funzionalità o documentazione esistente
- Aggiornamenti per migliorare chiarezza o accuratezza
- Ristrutturazione di contenuti o organizzazione

#### Deprecato
- Funzionalità o approcci in fase di eliminazione
- Sezioni di documentazione programmate per la rimozione
- Metodi con alternative migliori

#### Rimosso
- Funzionalità, documentazione o esempi non più rilevanti
- Informazioni obsolete o approcci deprecati
- Contenuti ridondanti o consolidati

#### Corretto
- Correzioni di errori nella documentazione o nel codice
- Risoluzione di problemi segnalati
- Miglioramenti di accuratezza o funzionalità

#### Sicurezza
- Miglioramenti o correzioni relative alla sicurezza
- Aggiornamenti alle best practice di sicurezza
- Risoluzione di vulnerabilità di sicurezza

### Linee Guida per la Versione Semantica

#### Versione Principale (X.0.0)
- Modifiche significative che richiedono azioni da parte degli utenti
- Ristrutturazione importante di contenuti o organizzazione
- Modifiche che alterano l'approccio o la metodologia fondamentale

#### Versione Minore (X.Y.0)
- Nuove funzionalità o aggiunte di contenuti
- Miglioramenti che mantengono la compatibilità retroattiva
- Esempi, strumenti o risorse aggiuntive

#### Versione Patch (X.Y.Z)
- Correzioni di bug ed errori
- Miglioramenti minori ai contenuti esistenti
- Chiarimenti e piccoli miglioramenti

## Feedback e Suggerimenti della Comunità

Incoraggiamo attivamente il feedback della comunità per migliorare questa risorsa di apprendimento:

### Come Fornire Feedback
- **GitHub Issues**: Segnala problemi o suggerisci miglioramenti (benvenuti problemi specifici per AI)
- **Discussioni su Discord**: Condividi idee e interagisci con la comunità Azure AI Foundry
- **Pull Requests**: Contribuisci direttamente al miglioramento dei contenuti, in particolare modelli e guide AI
- **Discord Azure AI Foundry**: Partecipa al canale #Azure per discussioni su AZD + AI
- **Forum della Comunità**: Partecipa a discussioni più ampie tra sviluppatori Azure

### Categorie di Feedback
- **Accuratezza dei Contenuti AI**: Correzioni alle informazioni sull'integrazione e distribuzione dei servizi AI
- **Esperienza di Apprendimento**: Suggerimenti per migliorare il flusso di apprendimento per sviluppatori AI
- **Contenuti AI Mancanti**: Richieste per modelli, schemi o esempi AI aggiuntivi
- **Accessibilità**: Miglioramenti per esigenze di apprendimento diversificate
- **Integrazione Strumenti AI**: Suggerimenti per una migliore integrazione dei flussi di lavoro di sviluppo AI
- **Modelli AI per la Produzione**: Richieste di modelli di distribuzione AI per l'azienda

### Impegno di Risposta
- **Risposta ai Problemi**: Entro 48 ore per problemi segnalati
- **Richieste di Funzionalità**: Valutazione entro una settimana
- **Contributi della Comunità**: Revisione entro una settimana
- **Problemi di Sicurezza**: Priorità immediata con risposta accelerata

## Programma di Manutenzione

### Aggiornamenti Regolari
- **Revisioni Mensili**: Accuratezza dei contenuti e validazione dei link
- **Aggiornamenti Trimestrali**: Aggiunte e miglioramenti principali ai contenuti
- **Revisioni Semestrali**: Ristrutturazione e miglioramenti completi
- **Rilasci Annuali**: Aggiornamenti di versione principali con miglioramenti significativi

### Monitoraggio e Garanzia di Qualità
- **Test Automatizzati**: Validazione regolare di esempi di codice e link
- **Integrazione Feedback della Comunità**: Incorporazione regolare dei suggerimenti degli utenti
- **Aggiornamenti Tecnologici**: Allineamento con i servizi Azure più recenti e le versioni azd
- **Audit di Accessibilità**: Revisione regolare per principi di design inclusivo

## Politica di Supporto delle Versioni

### Supporto Versione Corrente
- **Ultima Versione Principale**: Supporto completo con aggiornamenti regolari
- **Versione Principale Precedente**: Aggiornamenti di sicurezza e correzioni critiche per 12 mesi
- **Versioni Legacy**: Supporto della comunità solo, senza aggiornamenti ufficiali

### Guida alla Migrazione
Quando vengono rilasciate versioni principali, forniamo:
- **Guide alla Migrazione**: Istruzioni passo-passo per la transizione
- **Note di Compatibilità**: Dettagli sulle modifiche significative
- **Supporto Strumenti**: Script o utilità per assistere nella migrazione
- **Supporto della Comunità**: Forum dedicati per domande sulla migrazione

---

**Navigazione**
- **Lezione Precedente**: [Guida allo Studio](resources/study-guide.md)
- **Lezione Successiva**: Torna al [README Principale](README.md)

**Rimani Aggiornato**: Segui questo repository per notifiche su nuovi rilasci e aggiornamenti importanti ai materiali di apprendimento.

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.