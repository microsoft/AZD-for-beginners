<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "02c0d6833f050997d358015c9d6b71d9",
  "translation_date": "2025-11-20T22:07:18+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "it"
}
-->
# Guida allo Studio - Obiettivi di Apprendimento Completi

**Navigazione del Percorso di Apprendimento**
- **📚 Home del Corso**: [AZD Per Principianti](../README.md)
- **📖 Inizia a Imparare**: [Capitolo 1: Fondamenti & Avvio Rapido](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Monitoraggio del Progresso**: [Completamento del Corso](../README.md#-course-completion--certification)

## Introduzione

Questa guida allo studio completa fornisce obiettivi di apprendimento strutturati, concetti chiave, esercizi pratici e materiali di valutazione per aiutarti a padroneggiare Azure Developer CLI (azd). Usa questa guida per monitorare i tuoi progressi e assicurarti di aver coperto tutti gli argomenti essenziali.

## Obiettivi di Apprendimento

Completando questa guida allo studio, sarai in grado di:
- Padroneggiare tutti i concetti fondamentali e avanzati di Azure Developer CLI
- Sviluppare competenze pratiche nel distribuire e gestire applicazioni Azure
- Acquisire sicurezza nel risolvere problemi e ottimizzare le distribuzioni
- Comprendere le pratiche di distribuzione pronte per la produzione e le considerazioni sulla sicurezza

## Risultati di Apprendimento

Dopo aver completato tutte le sezioni di questa guida allo studio, sarai in grado di:
- Progettare, distribuire e gestire architetture applicative complete utilizzando azd
- Implementare strategie complete di monitoraggio, sicurezza e ottimizzazione dei costi
- Risolvere autonomamente problemi complessi di distribuzione
- Creare modelli personalizzati e contribuire alla comunità azd

## Struttura di Apprendimento in 8 Capitoli

### Capitolo 1: Fondamenti & Avvio Rapido (Settimana 1)
**Durata**: 30-45 minuti | **Complessità**: ⭐

#### Obiettivi di Apprendimento
- Comprendere i concetti e la terminologia di base di Azure Developer CLI
- Installare e configurare con successo AZD sulla tua piattaforma di sviluppo
- Distribuire la tua prima applicazione utilizzando un modello esistente
- Navigare efficacemente nell'interfaccia a riga di comando di AZD

#### Concetti Chiave da Padroneggiare
- Struttura e componenti del progetto AZD (azure.yaml, infra/, src/)
- Flussi di lavoro di distribuzione basati su modelli
- Nozioni di base sulla configurazione dell'ambiente
- Gestione dei gruppi di risorse e delle sottoscrizioni

#### Esercizi Pratici
1. **Verifica dell'Installazione**: Installa AZD e verifica con `azd version`
2. **Prima Distribuzione**: Distribuisci con successo il modello todo-nodejs-mongo
3. **Configurazione dell'Ambiente**: Configura le tue prime variabili di ambiente
4. **Esplorazione delle Risorse**: Naviga tra le risorse distribuite nel Portale di Azure

#### Domande di Valutazione
- Quali sono i componenti principali di un progetto AZD?
- Come si inizializza un nuovo progetto da un modello?
- Qual è la differenza tra `azd up` e `azd deploy`?
- Come si gestiscono più ambienti con AZD?

---

### Capitolo 2: Sviluppo AI-First (Settimana 2)
**Durata**: 1-2 ore | **Complessità**: ⭐⭐

#### Obiettivi di Apprendimento
- Integrare i servizi Microsoft Foundry con i flussi di lavoro AZD
- Distribuire e configurare applicazioni potenziate dall'AI
- Comprendere i modelli di implementazione RAG (Retrieval-Augmented Generation)
- Gestire le distribuzioni e il dimensionamento dei modelli AI

#### Concetti Chiave da Padroneggiare
- Integrazione del servizio Azure OpenAI e gestione delle API
- Configurazione della ricerca AI e indicizzazione vettoriale
- Strategie di distribuzione dei modelli e pianificazione della capacità
- Monitoraggio delle applicazioni AI e ottimizzazione delle prestazioni

#### Esercizi Pratici
1. **Distribuzione Chat AI**: Distribuisci il modello azure-search-openai-demo
2. **Implementazione RAG**: Configura l'indicizzazione e il recupero dei documenti
3. **Configurazione del Modello**: Configura più modelli AI con scopi diversi
4. **Monitoraggio AI**: Implementa Application Insights per i carichi di lavoro AI

#### Domande di Valutazione
- Come si configurano i servizi Azure OpenAI in un modello AZD?
- Quali sono i componenti chiave di un'architettura RAG?
- Come si gestisce la capacità e il dimensionamento dei modelli AI?
- Quali metriche di monitoraggio sono importanti per le applicazioni AI?

---

### Capitolo 3: Configurazione & Autenticazione (Settimana 3)
**Durata**: 45-60 minuti | **Complessità**: ⭐⭐

#### Obiettivi di Apprendimento
- Padroneggiare le strategie di configurazione e gestione degli ambienti
- Implementare modelli di autenticazione sicuri e identità gestite
- Organizzare le risorse con convenzioni di denominazione appropriate
- Configurare distribuzioni multi-ambiente (dev, staging, prod)

#### Concetti Chiave da Padroneggiare
- Gerarchia degli ambienti e precedenza della configurazione
- Autenticazione con identità gestite e principali di servizio
- Integrazione di Key Vault per la gestione dei segreti
- Gestione dei parametri specifici per ambiente

#### Esercizi Pratici
1. **Configurazione Multi-Ambiente**: Configura gli ambienti dev, staging e prod
2. **Configurazione della Sicurezza**: Implementa l'autenticazione con identità gestite
3. **Gestione dei Segreti**: Integra Azure Key Vault per i dati sensibili
4. **Gestione dei Parametri**: Crea configurazioni specifiche per ambiente

#### Domande di Valutazione
- Come si configurano ambienti diversi con AZD?
- Quali sono i vantaggi dell'uso di identità gestite rispetto ai principali di servizio?
- Come si gestiscono in modo sicuro i segreti delle applicazioni?
- Qual è la gerarchia di configurazione in AZD?

---

### Capitolo 4: Infrastruttura come Codice & Distribuzione (Settimana 4-5)
**Durata**: 1-1,5 ore | **Complessità**: ⭐⭐⭐

#### Obiettivi di Apprendimento
- Creare e personalizzare modelli di infrastruttura Bicep
- Implementare modelli e flussi di lavoro di distribuzione avanzati
- Comprendere le strategie di provisioning delle risorse
- Progettare architetture scalabili multi-servizio

- Distribuire applicazioni containerizzate utilizzando Azure Container Apps e AZD

#### Concetti Chiave da Padroneggiare
- Struttura e best practice dei modelli Bicep
- Dipendenze delle risorse e ordine di distribuzione
- File di parametri e modularità dei modelli
- Hook personalizzati e automazione della distribuzione
- Modelli di distribuzione delle app containerizzate (avvio rapido, produzione, microservizi)

#### Esercizi Pratici
1. **Creazione di Modelli Personalizzati**: Costruisci un modello di applicazione multi-servizio
2. **Maestria in Bicep**: Crea componenti di infrastruttura modulari e riutilizzabili
3. **Automazione della Distribuzione**: Implementa hook pre/post distribuzione
4. **Progettazione dell'Architettura**: Distribuisci un'architettura complessa di microservizi
5. **Distribuzione di App Containerizzate**: Distribuisci gli esempi [Simple Flask API](../../../examples/container-app/simple-flask-api) e [Microservices Architecture](../../../examples/container-app/microservices) utilizzando AZD

#### Domande di Valutazione
- Come si creano modelli Bicep personalizzati per AZD?
- Quali sono le best practice per organizzare il codice dell'infrastruttura?
- Come si gestiscono le dipendenze delle risorse nei modelli?
- Quali modelli di distribuzione supportano aggiornamenti senza interruzioni?

---

### Capitolo 5: Soluzioni AI Multi-Agente (Settimana 6-7)
**Durata**: 2-3 ore | **Complessità**: ⭐⭐⭐⭐

#### Obiettivi di Apprendimento
- Progettare e implementare architetture AI multi-agente
- Coordinare e orchestrare la comunicazione tra agenti
- Distribuire soluzioni AI pronte per la produzione con monitoraggio
- Comprendere la specializzazione degli agenti e i modelli di flusso di lavoro
- Integrare microservizi containerizzati come parte di soluzioni multi-agente

#### Concetti Chiave da Padroneggiare
- Modelli di architettura multi-agente e principi di progettazione
- Protocolli di comunicazione tra agenti e flusso di dati
- Strategie di bilanciamento del carico e scalabilità per agenti AI
- Monitoraggio della produzione per sistemi multi-agente
- Comunicazione tra servizi in ambienti containerizzati

#### Esercizi Pratici
1. **Distribuzione della Soluzione Retail**: Distribuisci lo scenario retail multi-agente completo
2. **Personalizzazione degli Agenti**: Modifica i comportamenti degli agenti Customer e Inventory
3. **Scalabilità dell'Architettura**: Implementa bilanciamento del carico e auto-scaling
4. **Monitoraggio della Produzione**: Configura monitoraggio e avvisi completi
5. **Integrazione dei Microservizi**: Estendi l'esempio [Microservices Architecture](../../../examples/container-app/microservices) per supportare flussi di lavoro basati su agenti

#### Domande di Valutazione
- Come si progettano modelli efficaci di comunicazione multi-agente?
- Quali sono le considerazioni chiave per scalare i carichi di lavoro degli agenti AI?
- Come si monitorano e si risolvono i problemi nei sistemi AI multi-agente?
- Quali modelli di produzione garantiscono l'affidabilità per gli agenti AI?

---

### Capitolo 6: Validazione & Pianificazione Pre-Distribuzione (Settimana 8)
**Durata**: 1 ora | **Complessità**: ⭐⭐

#### Obiettivi di Apprendimento
- Eseguire una pianificazione della capacità e una validazione delle risorse complete
- Selezionare gli SKU Azure ottimali per un rapporto costo-efficacia
- Implementare controlli e validazioni pre-volo automatizzati
- Pianificare distribuzioni con strategie di ottimizzazione dei costi

#### Concetti Chiave da Padroneggiare
- Quote delle risorse Azure e limitazioni di capacità
- Criteri di selezione degli SKU e ottimizzazione dei costi
- Script di validazione automatizzati e test
- Pianificazione delle distribuzioni e valutazione dei rischi

#### Esercizi Pratici
1. **Analisi della Capacità**: Analizza i requisiti delle risorse per le tue applicazioni
2. **Ottimizzazione degli SKU**: Confronta e seleziona livelli di servizio convenienti
3. **Automazione della Validazione**: Implementa script di controllo pre-distribuzione
4. **Pianificazione dei Costi**: Crea stime e budget per i costi di distribuzione

#### Domande di Valutazione
- Come si valida la capacità di Azure prima della distribuzione?
- Quali fattori influenzano le decisioni di selezione degli SKU?
- Come si automatizza la validazione pre-distribuzione?
- Quali strategie aiutano a ottimizzare i costi di distribuzione?

---

### Capitolo 7: Risoluzione dei Problemi & Debugging (Settimana 9)
**Durata**: 1-1,5 ore | **Complessità**: ⭐⭐

#### Obiettivi di Apprendimento
- Sviluppare approcci sistematici per il debugging delle distribuzioni AZD
- Risolvere problemi comuni di distribuzione e configurazione
- Debuggare problemi specifici dell'AI e problemi di prestazioni
- Implementare monitoraggio e avvisi per rilevare proattivamente i problemi

#### Concetti Chiave da Padroneggiare
- Tecniche diagnostiche e strategie di logging
- Modelli comuni di errore e loro soluzioni
- Monitoraggio delle prestazioni e ottimizzazione
- Procedure di risposta agli incidenti e recupero

#### Esercizi Pratici
1. **Competenze Diagnostiche**: Esercitati con distribuzioni intenzionalmente errate
2. **Analisi dei Log**: Usa Azure Monitor e Application Insights in modo efficace
3. **Ottimizzazione delle Prestazioni**: Ottimizza applicazioni con prestazioni lente
4. **Procedure di Recupero**: Implementa backup e recupero di emergenza

#### Domande di Valutazione
- Quali sono i fallimenti di distribuzione AZD più comuni?
- Come si risolvono problemi di autenticazione e permessi?
- Quali strategie di monitoraggio aiutano a prevenire problemi in produzione?
- Come si ottimizzano le prestazioni delle applicazioni in Azure?

---

### Capitolo 8: Modelli di Produzione & Enterprise (Settimana 10-11)
**Durata**: 2-3 ore | **Complessità**: ⭐⭐⭐⭐

#### Obiettivi di Apprendimento
- Implementare strategie di distribuzione di livello enterprise
- Progettare modelli di sicurezza e framework di conformità
- Stabilire monitoraggio, governance e gestione dei costi
- Creare pipeline CI/CD scalabili con integrazione AZD
- Applicare best practice per distribuzioni di app containerizzate in produzione (sicurezza, monitoraggio, costi, CI/CD)

#### Concetti Chiave da Padroneggiare
- Requisiti di sicurezza e conformità aziendali
- Framework di governance e implementazione delle policy
- Monitoraggio avanzato e gestione dei costi
- Integrazione CI/CD e pipeline di distribuzione automatizzate
- Strategie di distribuzione blue-green e canary per carichi di lavoro containerizzati

#### Esercizi Pratici
1. **Sicurezza Aziendale**: Implementa modelli di sicurezza completi
2. **Framework di Governance**: Configura Azure Policy e gestione delle risorse
3. **Monitoraggio Avanzato**: Crea dashboard e avvisi automatizzati
4. **Integrazione CI/CD**: Costruisci pipeline di distribuzione automatizzate
5. **App Containerizzate in Produzione**: Applica sicurezza, monitoraggio e ottimizzazione dei costi all'esempio [Microservices Architecture](../../../examples/container-app/microservices)

#### Domande di Valutazione
- Come si implementa la sicurezza aziendale nelle distribuzioni AZD?
- Quali modelli di governance garantiscono conformità e controllo dei costi?
- Come si progetta un monitoraggio scalabile per i sistemi in produzione?
- Quali modelli CI/CD funzionano meglio con i flussi di lavoro AZD?

#### Obiettivi di Apprendimento
- Comprendere i fondamenti e i concetti chiave di Azure Developer CLI
- Installare e configurare con successo azd nel tuo ambiente di sviluppo
- Completare la tua prima distribuzione utilizzando un modello esistente
- Navigare nella struttura del progetto azd e comprendere i componenti chiave

#### Concetti Chiave da Padroneggiare
- Modelli, ambienti e servizi
- Struttura di configurazione azure.yaml
- Comandi di base azd (init, up, down, deploy)
- Principi di Infrastructure as Code
- Autenticazione e autorizzazione Azure

#### Esercizi Pratici

**Esercizio 1.1: Installazione e Configurazione**
```bash
# Completa questi compiti:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Esercizio 1.2: Prima Distribuzione**
```bash
# Distribuire un'applicazione web semplice:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Esercizio 1.3: Analisi della Struttura del Progetto**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Domande di Auto-Valutazione
1. Quali sono i tre concetti principali dell'architettura azd?
2. Qual è lo scopo del file azure.yaml?
3. Come gli ambienti aiutano a gestire diversi target di distribuzione?
4. Quali metodi di autenticazione possono essere utilizzati con azd?
5. Cosa succede quando esegui `azd up` per la prima volta?

---

## Monitoraggio del Progresso e Framework di Valutazione
```bash
# Creare e configurare più ambienti:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Esercizio 2.2: Configurazione Avanzata**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Esercizio 2.3: Configurazione della Sicurezza**
```bash
# Implementare le migliori pratiche di sicurezza:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Domande di Auto-Valutazione
1. Come azd gestisce la precedenza delle variabili di ambiente?
2. Cosa sono gli hook di distribuzione e quando dovresti usarli?
3. Come si configurano diversi SKU per diversi ambienti?
4. Quali sono le implicazioni di sicurezza dei diversi metodi di autenticazione?
5. Come si gestiscono segreti e dati di configurazione sensibili?

### Modulo 3: Distribuzione e Provisioning (Settimana 4)

#### Obiettivi di Apprendimento
- Padroneggiare i flussi di lavoro di distribuzione e le best practice
- Comprendere Infrastructure as Code con i modelli Bicep
- Implementare architetture complesse multi-servizio
- Ottimizzare le prestazioni e l'affidabilità della distribuzione

#### Concetti Chiave da Padroneggiare
- Struttura e moduli dei modelli Bicep
- Dipendenze delle risorse e ordine
- Strategie di distribuzione (blue-green, aggiornamenti progressivi)
- Distribuzioni multi-regione
- Migrazioni di database e gestione dei dati

#### Esercizi Pratici

**Eserc
5. Quali sono le considerazioni per le implementazioni multi-regione?

### Modulo 4: Validazione Pre-Implementazione (Settimana 5)

#### Obiettivi di Apprendimento
- Implementare controlli pre-implementazione completi
- Padroneggiare la pianificazione della capacità e la validazione delle risorse
- Comprendere la selezione degli SKU e l'ottimizzazione dei costi
- Creare pipeline di validazione automatizzate

#### Concetti Chiave da Padroneggiare
- Quote e limiti delle risorse Azure
- Criteri di selezione degli SKU e implicazioni sui costi
- Script e strumenti di validazione automatizzati
- Metodologie di pianificazione della capacità
- Test delle prestazioni e ottimizzazione

#### Esercizi Pratici

**Esercizio 4.1: Pianificazione della Capacità**
```bash
# Implementare la validazione della capacità:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Esercizio 4.2: Validazione Pre-Implementazione**
```powershell
# Costruire una pipeline di validazione completa:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Esercizio 4.3: Ottimizzazione degli SKU**
```bash
# Ottimizzare le configurazioni del servizio:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Domande di Auto-Valutazione
1. Quali fattori dovrebbero influenzare le decisioni sulla selezione degli SKU?
2. Come si valida la disponibilità delle risorse Azure prima dell'implementazione?
3. Quali sono i componenti chiave di un sistema di controllo pre-implementazione?
4. Come si stimano e controllano i costi di implementazione?
5. Quali monitoraggi sono essenziali per la pianificazione della capacità?

### Modulo 5: Risoluzione dei Problemi e Debugging (Settimana 6)

#### Obiettivi di Apprendimento
- Padroneggiare metodologie sistematiche di risoluzione dei problemi
- Sviluppare competenze nel debugging di problemi complessi di implementazione
- Implementare monitoraggio e avvisi completi
- Creare procedure di risposta agli incidenti e di recupero

#### Concetti Chiave da Padroneggiare
- Modelli comuni di fallimento delle implementazioni
- Tecniche di analisi e correlazione dei log
- Monitoraggio delle prestazioni e ottimizzazione
- Rilevamento e risposta agli incidenti di sicurezza
- Recupero dai disastri e continuità aziendale

#### Esercizi Pratici

**Esercizio 5.1: Scenari di Risoluzione dei Problemi**
```bash
# Pratica la risoluzione di problemi comuni:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Esercizio 5.2: Implementazione del Monitoraggio**
```bash
# Configurare un monitoraggio completo:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Esercizio 5.3: Risposta agli Incidenti**
```bash
# Costruire procedure di risposta agli incidenti:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Domande di Auto-Valutazione
1. Qual è l'approccio sistematico per risolvere i problemi di implementazione azd?
2. Come si correlano i log tra più servizi e risorse?
3. Quali metriche di monitoraggio sono più critiche per rilevare problemi precocemente?
4. Come si implementano procedure efficaci di recupero dai disastri?
5. Quali sono i componenti chiave di un piano di risposta agli incidenti?

### Modulo 6: Argomenti Avanzati e Best Practices (Settimana 7-8)

#### Obiettivi di Apprendimento
- Implementare modelli di implementazione di livello enterprise
- Padroneggiare l'integrazione e l'automazione CI/CD
- Sviluppare template personalizzati e contribuire alla community
- Comprendere requisiti avanzati di sicurezza e conformità

#### Concetti Chiave da Padroneggiare
- Modelli di integrazione delle pipeline CI/CD
- Sviluppo e distribuzione di template personalizzati
- Governance e conformità aziendale
- Configurazioni avanzate di rete e sicurezza
- Ottimizzazione delle prestazioni e gestione dei costi

#### Esercizi Pratici

**Esercizio 6.1: Integrazione CI/CD**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Esercizio 6.2: Sviluppo di Template Personalizzati**
```bash
# Crea e pubblica modelli personalizzati:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Esercizio 6.3: Implementazione Enterprise**
```bash
# Implementa funzionalità di livello aziendale:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Domande di Auto-Valutazione
1. Come si integra azd nei flussi di lavoro CI/CD esistenti?
2. Quali sono le considerazioni chiave per lo sviluppo di template personalizzati?
3. Come si implementano governance e conformità nelle implementazioni azd?
4. Quali sono le best practices per implementazioni su scala enterprise?
5. Come si contribuisce efficacemente alla community azd?

## Progetti Pratici

### Progetto 1: Sito Web Portfolio Personale
**Complessità**: Principiante  
**Durata**: 1-2 settimane

Crea e implementa un sito web portfolio personale utilizzando:
- Hosting di siti web statici su Azure Storage
- Configurazione di un dominio personalizzato
- Integrazione CDN per prestazioni globali
- Pipeline di implementazione automatizzata

**Consegne**:
- Sito web funzionante implementato su Azure
- Template azd personalizzato per implementazioni di portfolio
- Documentazione del processo di implementazione
- Raccomandazioni per analisi e ottimizzazione dei costi

### Progetto 2: Applicazione di Gestione Attività
**Complessità**: Intermedio  
**Durata**: 2-3 settimane

Crea un'applicazione full-stack per la gestione delle attività con:
- Frontend React implementato su App Service
- Backend API Node.js con autenticazione
- Database PostgreSQL con migrazioni
- Monitoraggio con Application Insights

**Consegne**:
- Applicazione completa con autenticazione utente
- Schema del database e script di migrazione
- Dashboard di monitoraggio e regole di avviso
- Configurazione di implementazione multi-ambiente

### Progetto 3: Piattaforma E-commerce Microservizi
**Complessità**: Avanzato  
**Durata**: 4-6 settimane

Progetta e implementa una piattaforma e-commerce basata su microservizi:
- Servizi API multipli (catalogo, ordini, pagamenti, utenti)
- Integrazione di code di messaggi con Service Bus
- Cache Redis per ottimizzazione delle prestazioni
- Logging e monitoraggio completi

**Esempio di Riferimento**: Vedi [Architettura Microservizi](../../../examples/container-app/microservices) per un template pronto per la produzione e guida all'implementazione

**Consegne**:
- Architettura completa basata su microservizi
- Modelli di comunicazione tra servizi
- Test delle prestazioni e ottimizzazione
- Implementazione di sicurezza pronta per la produzione

## Valutazione e Certificazione

### Verifiche di Conoscenza

Completa queste valutazioni dopo ogni modulo:

**Valutazione Modulo 1**: Concetti di base e installazione
- Domande a scelta multipla sui concetti fondamentali
- Attività pratiche di installazione e configurazione
- Esercizio di implementazione semplice

**Valutazione Modulo 2**: Configurazione e ambienti
- Scenari di gestione degli ambienti
- Esercizi di risoluzione dei problemi di configurazione
- Implementazione di configurazioni di sicurezza

**Valutazione Modulo 3**: Implementazione e provisioning
- Sfide di progettazione dell'infrastruttura
- Scenari di implementazione multi-servizio
- Esercizi di ottimizzazione delle prestazioni

**Valutazione Modulo 4**: Validazione pre-implementazione
- Studi di caso sulla pianificazione della capacità
- Scenari di ottimizzazione dei costi
- Implementazione di pipeline di validazione

**Valutazione Modulo 5**: Risoluzione dei problemi e debugging
- Esercizi di diagnosi dei problemi
- Attività di implementazione del monitoraggio
- Simulazioni di risposta agli incidenti

**Valutazione Modulo 6**: Argomenti avanzati
- Progettazione di pipeline CI/CD
- Sviluppo di template personalizzati
- Scenari di architettura enterprise

### Progetto Finale

Progetta e implementa una soluzione completa che dimostri la padronanza di tutti i concetti:

**Requisiti**:
- Architettura applicativa multi-livello
- Ambienti di implementazione multipli
- Monitoraggio e avvisi completi
- Implementazione di sicurezza e conformità
- Ottimizzazione dei costi e tuning delle prestazioni
- Documentazione completa e runbook

**Criteri di Valutazione**:
- Qualità dell'implementazione tecnica
- Completezza della documentazione
- Adesione alle best practices di sicurezza
- Ottimizzazione delle prestazioni e dei costi
- Efficacia nel troubleshooting e monitoraggio

## Risorse di Studio e Riferimenti

### Documentazione Ufficiale
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Documentazione Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centro Architettura Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Risorse della Community
- [Galleria Template AZD](https://azure.github.io/awesome-azd/)
- [Organizzazione GitHub Azure-Samples](https://github.com/Azure-Samples)
- [Repository GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)

### Ambienti Pratici
- [Account Gratuito Azure](https://azure.microsoft.com/free/)
- [Tier Gratuito Azure DevOps](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Strumenti Aggiuntivi
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Pacchetto Estensioni Azure Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Raccomandazioni per il Programma di Studio

### Studio a Tempo Pieno (8 settimane)
- **Settimane 1-2**: Moduli 1-2 (Introduzione, Configurazione)
- **Settimane 3-4**: Moduli 3-4 (Implementazione, Pre-implementazione)
- **Settimane 5-6**: Moduli 5-6 (Risoluzione dei Problemi, Argomenti Avanzati)
- **Settimane 7-8**: Progetti Pratici e Valutazione Finale

### Studio Part-Time (16 settimane)
- **Settimane 1-4**: Modulo 1 (Introduzione)
- **Settimane 5-7**: Modulo 2 (Configurazione e Ambienti)
- **Settimane 8-10**: Modulo 3 (Implementazione e Provisioning)
- **Settimane 11-12**: Modulo 4 (Validazione Pre-implementazione)
- **Settimane 13-14**: Modulo 5 (Risoluzione dei Problemi e Debugging)
- **Settimane 15-16**: Modulo 6 (Argomenti Avanzati e Valutazione)

---

## Monitoraggio del Progresso e Framework di Valutazione

### Checklist di Completamento Capitoli

Monitora il tuo progresso attraverso ogni capitolo con questi risultati misurabili:

#### 📚 Capitolo 1: Fondamenti & Avvio Rapido
- [ ] **Installazione Completata**: AZD installato e verificato sulla tua piattaforma
- [ ] **Prima Implementazione**: Template todo-nodejs-mongo implementato con successo
- [ ] **Configurazione Ambiente**: Variabili di ambiente configurate per la prima volta
- [ ] **Navigazione Risorse**: Esplorate risorse implementate nel Portale Azure
- [ ] **Padronanza Comandi**: Familiarità con i comandi di base AZD

#### 🤖 Capitolo 2: Sviluppo AI-First  
- [ ] **Implementazione Template AI**: Template azure-search-openai-demo implementato con successo
- [ ] **Implementazione RAG**: Configurazione di indicizzazione e recupero documenti
- [ ] **Configurazione Modelli**: Configurati modelli AI multipli con scopi diversi
- [ ] **Monitoraggio AI**: Implementato Application Insights per carichi di lavoro AI
- [ ] **Ottimizzazione Prestazioni**: Ottimizzate le prestazioni dell'applicazione AI

#### ⚙️ Capitolo 3: Configurazione & Autenticazione
- [ ] **Setup Multi-Ambiente**: Configurati ambienti dev, staging e prod
- [ ] **Implementazione Sicurezza**: Configurata autenticazione con identità gestita
- [ ] **Gestione Segreti**: Integrato Azure Key Vault per dati sensibili
- [ ] **Gestione Parametri**: Creata configurazione specifica per ambiente
- [ ] **Padronanza Autenticazione**: Implementati modelli di accesso sicuro

#### 🏗️ Capitolo 4: Infrastruttura come Codice & Implementazione
- [ ] **Creazione Template Personalizzato**: Creato template applicativo multi-servizio
- [ ] **Padronanza Bicep**: Creati componenti infrastrutturali modulari e riutilizzabili
- [ ] **Automazione Implementazione**: Implementati hook pre/post implementazione
- [ ] **Progettazione Architettura**: Implementata architettura complessa basata su microservizi
- [ ] **Ottimizzazione Template**: Template ottimizzati per prestazioni e costi

#### 🎯 Capitolo 5: Soluzioni AI Multi-Agent
- [ ] **Implementazione Soluzione Retail**: Scenario retail multi-agent completato
- [ ] **Personalizzazione Agenti**: Modificati comportamenti degli agenti Cliente e Inventario
- [ ] **Scalabilità Architettura**: Implementato bilanciamento del carico e auto-scaling
- [ ] **Monitoraggio Produzione**: Configurato monitoraggio e avvisi completi
- [ ] **Ottimizzazione Prestazioni**: Ottimizzato sistema multi-agent

#### 🔍 Capitolo 6: Validazione Pre-Implementazione & Pianificazione
- [ ] **Analisi Capacità**: Analizzati requisiti di risorse per applicazioni
- [ ] **Ottimizzazione SKU**: Selezionati livelli di servizio economici
- [ ] **Automazione Validazione**: Implementati script di controllo pre-implementazione
- [ ] **Pianificazione Costi**: Creati stime e budget per implementazione
- [ ] **Valutazione Rischi**: Identificati e mitigati rischi di implementazione

#### 🚨 Capitolo 7: Risoluzione dei Problemi & Debugging
- [ ] **Competenze Diagnostiche**: Debugging di implementazioni intenzionalmente errate completato
- [ ] **Analisi Log**: Utilizzati Azure Monitor e Application Insights in modo efficace
- [ ] **Ottimizzazione Prestazioni**: Applicazioni lente ottimizzate
- [ ] **Procedure di Recupero**: Implementati backup e recupero dai disastri
- [ ] **Setup Monitoraggio**: Creato monitoraggio proattivo e avvisi

#### 🏢 Capitolo 8: Produzione & Modelli Enterprise
- [ ] **Sicurezza Enterprise**: Implementati modelli di sicurezza completi
- [ ] **Framework Governance**: Configurati Azure Policy e gestione risorse
- [ ] **Monitoraggio Avanzato**: Creati dashboard e avvisi automatizzati
- [ ] **Integrazione CI/CD**: Costruite pipeline di implementazione automatizzate
- [ ] **Implementazione Conformità**: Soddisfatti requisiti di conformità aziendale

### Cronologia di Apprendimento e Traguardi

#### Settimana 1-2: Costruzione Fondamentale
- **Traguardo**: Implementare la prima applicazione AI utilizzando AZD
- **Validazione**: Applicazione funzionante accessibile tramite URL pubblico
- **Competenze**: Flussi di lavoro AZD di base e integrazione servizi AI

#### Settimana 3-4: Padronanza Configurazione
- **Traguardo**: Implementazione multi-ambiente con autenticazione sicura
- **Validazione**: Stessa applicazione implementata su dev/staging/prod
- **Competenze**: Gestione ambienti e implementazione sicurezza

#### Settimana 5-6: Esperienza Infrastrutturale
- **Traguardo**: Template personalizzato per applicazione multi-servizio complessa
- **Validazione**: Template riutilizzabile implementato da un altro membro del team
- **Competenze**: Padronanza Bicep e automazione infrastrutturale

#### Settimana 7-8: Implementazione AI Avanzata
- **Traguardo**: Soluzione AI multi-agent pronta per la produzione
- **Validazione**: Sistema che gestisce carico reale con monitoraggio
- **Competenze**: Orchestrazione multi-agent e ottimizzazione prestazioni

#### Settimana 9-10: Prontezza per la Produzione
- **Traguardo**: Implementazione di livello enterprise con piena conformità
- **Validazione**: Supera revisione di sicurezza e audit di ottimizzazione costi
- **Competenze**: Governance, monitoraggio e integrazione CI/CD

### Valutazione e Certificazione

#### Metodi di Validazione della Conoscenza
1. **Implementazioni Pratiche**: Applicazioni funzionanti per ogni capitolo
2. **Revisione Codice**: Valutazione qualità template e configurazioni
3. **Risoluzione Problemi**: Scenari di troubleshooting e soluzioni
4. **Insegnamento tra Pari**: Spiegare concetti ad altri studenti
5. **Contributo della Comunità**: Condividi modelli o miglioramenti

#### Risultati di Sviluppo Professionale
- **Progetti nel Portfolio**: 8 implementazioni pronte per la produzione
- **Competenze Tecniche**: Esperienza con AZD e distribuzione AI a livello industriale
- **Capacità di Risoluzione dei Problemi**: Risoluzione autonoma dei problemi e ottimizzazione
- **Riconoscimento nella Comunità**: Partecipazione attiva nella comunità degli sviluppatori Azure
- **Avanzamento di Carriera**: Competenze direttamente applicabili a ruoli nel cloud e nell'AI

#### Metriche di Successo
- **Tasso di Successo delle Implementazioni**: >95% di implementazioni riuscite
- **Tempo di Risoluzione dei Problemi**: <30 minuti per problemi comuni
- **Ottimizzazione delle Prestazioni**: Miglioramenti dimostrabili in termini di costi e prestazioni
- **Conformità alla Sicurezza**: Tutte le implementazioni rispettano gli standard di sicurezza aziendali
- **Trasferimento di Conoscenze**: Capacità di fare da mentore ad altri sviluppatori

### Apprendimento Continuo e Coinvolgimento nella Comunità

#### Rimanere Aggiornati
- **Aggiornamenti Azure**: Segui le note di rilascio di Azure Developer CLI
- **Eventi della Comunità**: Partecipa a eventi per sviluppatori Azure e AI
- **Documentazione**: Contribuisci alla documentazione e agli esempi della comunità
- **Ciclo di Feedback**: Fornisci feedback sui contenuti del corso e sui servizi Azure

#### Sviluppo di Carriera
- **Rete Professionale**: Connettiti con esperti di Azure e AI
- **Opportunità di Parlare in Pubblico**: Presenta le tue conoscenze a conferenze o meetup
- **Contributo Open Source**: Contribuisci a modelli e strumenti AZD
- **Mentorship**: Guida altri sviluppatori nel loro percorso di apprendimento AZD

---

**Navigazione del Capitolo:**
- **📚 Home del Corso**: [AZD Per Principianti](../README.md)
- **📖 Inizia a Imparare**: [Capitolo 1: Fondamenti e Avvio Rapido](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Monitoraggio dei Progressi**: Tieni traccia dei tuoi progressi attraverso il sistema di apprendimento completo in 8 capitoli
- **🤝 Comunità**: [Azure Discord](https://discord.gg/microsoft-azure) per supporto e discussione

**Monitoraggio dei Progressi di Studio**: Usa questa guida strutturata per padroneggiare Azure Developer CLI attraverso un apprendimento progressivo e pratico con risultati misurabili e benefici per lo sviluppo professionale.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche potrebbero contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->