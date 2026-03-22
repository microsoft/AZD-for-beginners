# Guida di Studio - Obiettivi di Apprendimento Completi

**Navigazione del percorso di apprendimento**
- **📚 Home del corso**: [AZD For Beginners](../README.md)
- **📖 Inizia a studiare**: [Capitolo 1: Fondamenti & Avvio rapido](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Tracciamento del progresso**: [Completamento del corso](../README.md#-course-completion--certification)

## Introduzione

Questa guida di studio completa fornisce obiettivi di apprendimento strutturati, concetti chiave, esercizi pratici e materiali di valutazione per aiutarti a padroneggiare Azure Developer CLI (azd). Usa questa guida per monitorare i tuoi progressi e assicurarti di aver coperto tutti gli argomenti essenziali.

## Obiettivi di apprendimento

Completando questa guida di studio, sarai in grado di:
- Padroneggiare tutti i concetti fondamentali e avanzati di Azure Developer CLI
- Sviluppare competenze pratiche nel distribuire e gestire applicazioni Azure
- Acquisire fiducia nel risolvere problemi e ottimizzare le distribuzioni
- Comprendere le pratiche di distribuzione pronte per la produzione e le considerazioni sulla sicurezza

## Risultati dell'apprendimento

Dopo aver completato tutte le sezioni di questa guida, sarai in grado di:
- Progettare, distribuire e gestire architetture applicative complete usando azd
- Implementare strategie complete di monitoraggio, sicurezza e ottimizzazione dei costi
- Risolvere in modo indipendente problemi complessi di distribuzione
- Creare template personalizzati e contribuire alla community di azd

## Struttura di apprendimento in 8 capitoli

### Capitolo 1: Fondamenti & Avvio rapido (Settimana 1)
**Durata**: 30-45 minuti | **Complessità**: ⭐

#### Obiettivi di apprendimento
- Comprendere i concetti core e la terminologia di Azure Developer CLI
- Installare e configurare correttamente AZD sulla tua piattaforma di sviluppo
- Distribuire la tua prima applicazione usando un template esistente
- Navigare efficacemente l'interfaccia a riga di comando di AZD

#### Concetti chiave da padroneggiare
- Struttura e componenti di un progetto AZD (azure.yaml, infra/, src/)
- Flussi di lavoro basati su template per la distribuzione
- Nozioni di base sulla configurazione degli ambienti
- Gestione di resource group e subscription

#### Esercizi pratici
1. **Verifica dell'installazione**: Installa AZD e verifica con `azd version`
2. **Prima distribuzione**: Distribuisci con successo il template todo-nodejs-mongo
3. **Configurazione dell'ambiente**: Configura le tue prime variabili di ambiente
4. **Esplorazione delle risorse**: Esplora le risorse distribuite nel Portale di Azure

#### Domande di valutazione
- Quali sono i componenti principali di un progetto AZD?
- Come inizializzi un nuovo progetto da un template?
- Qual è la differenza tra `azd up` e `azd deploy`?
- Come gestisci più ambienti con AZD?

---

### Capitolo 2: Sviluppo AI-First (Settimana 2)
**Durata**: 1-2 ore | **Complessità**: ⭐⭐

#### Obiettivi di apprendimento
- Integrare i servizi Microsoft Foundry nei flussi di lavoro AZD
- Distribuire e configurare applicazioni potenziate dall'AI
- Comprendere i pattern di implementazione RAG (Retrieval-Augmented Generation)
- Gestire le distribuzioni e lo scaling dei modelli AI

#### Concetti chiave da padroneggiare
- Integrazione del servizio Models di Microsoft Foundry e gestione delle API
- Configurazione di AI Search e indicizzazione vettoriale
- Strategie di deployment dei modelli e pianificazione della capacità
- Monitoraggio delle applicazioni AI e ottimizzazione delle prestazioni

#### Esercizi pratici
1. **Distribuzione chat AI**: Distribuisci il template azure-search-openai-demo
2. **Implementazione RAG**: Configura l'indicizzazione e il recupero dei documenti
3. **Configurazione dei modelli**: Imposta più modelli AI con scopi diversi
4. **Monitoraggio AI**: Implementa Application Insights per i carichi di lavoro AI

#### Domande di valutazione
- Come configuri i servizi Models di Microsoft Foundry in un template AZD?
- Quali sono i componenti chiave di un'architettura RAG?
- Come gestisci la capacità e lo scaling dei modelli AI?
- Quali metriche di monitoraggio sono importanti per le applicazioni AI?

---

### Capitolo 3: Configurazione & Autenticazione (Settimana 3)
**Durata**: 45-60 minuti | **Complessità**: ⭐⭐

#### Obiettivi di apprendimento
- Padroneggiare strategie di configurazione e gestione degli ambienti
- Implementare pattern di autenticazione sicura e managed identity
- Organizzare le risorse con convenzioni di denominazione appropriate
- Configurare distribuzioni multi-ambiente (dev, staging, prod)

#### Concetti chiave da padroneggiare
- Gerarchia degli ambienti e precedenza delle configurazioni
- Managed identity e autenticazione con service principal
- Integrazione di Key Vault per la gestione dei segreti
- Gestione dei parametri specifici per ambiente

#### Esercizi pratici
1. **Configurazione multi-ambiente**: Configura gli ambienti dev, staging e prod
2. **Configurazione della sicurezza**: Implementa l'autenticazione con managed identity
3. **Gestione dei segreti**: Integra Azure Key Vault per i dati sensibili
4. **Gestione dei parametri**: Crea configurazioni specifiche per ambiente

#### Domande di valutazione
- Come configuri diversi ambienti con AZD?
- Quali sono i vantaggi dell'uso di managed identity rispetto ai service principal?
- Come gestisci in modo sicuro i segreti dell'applicazione?
- Qual è la gerarchia di configurazione in AZD?

---

### Capitolo 4: Infrastructure as Code & Distribuzione (Settimana 4-5)
**Durata**: 1-1.5 ore | **Complessità**: ⭐⭐⭐

#### Obiettivi di apprendimento
- Creare e personalizzare template infrastrutturali Bicep
- Implementare pattern e flussi di lavoro di deployment avanzati
- Comprendere le strategie di provisioning delle risorse
- Progettare architetture multi-servizio scalabili

- Distribuire applicazioni containerizzate utilizzando Azure Container Apps e AZD


#### Concetti chiave da padroneggiare
- Struttura dei template Bicep e best practice
- Dipendenze tra risorse e ordine di deployment
- File di parametri e modularità dei template
- Hook personalizzati e automazione delle distribuzioni
- Pattern di deployment per container app (quick start, produzione, microservizi)

#### Esercizi pratici
1. **Creazione di template personalizzati**: Costruisci un template per un'app multi-servizio
2. **Padronanza di Bicep**: Crea componenti infrastrutturali modulari e riutilizzabili
3. **Automazione del deployment**: Implementa hook pre/post deployment
4. **Progettazione dell'architettura**: Distribuisci una complessa architettura a microservizi
5. **Distribuzione di Container App**: Distribuisci gli esempi [Simple Flask API](../../../examples/container-app/simple-flask-api) e [Microservices Architecture](../../../examples/container-app/microservices) usando AZD

#### Domande di valutazione
- Come crei template Bicep personalizzati per AZD?
- Quali sono le best practice per organizzare il codice infrastrutturale?
- Come gestisci le dipendenze tra risorse nei template?
- Quali pattern di deployment supportano aggiornamenti senza downtime?

---

### Capitolo 5: Soluzioni AI Multi-Agente (Settimana 6-7)
**Durata**: 2-3 ore | **Complessità**: ⭐⭐⭐⭐

#### Obiettivi di apprendimento
- Progettare e implementare architetture AI multi-agente
- Orchestrare il coordinamento e la comunicazione tra agenti
- Distribuire soluzioni AI pronte per la produzione con monitoraggio
- Comprendere la specializzazione degli agenti e i pattern di workflow
- Integrare microservizi containerizzati come parte di soluzioni multi-agente

#### Concetti chiave da padroneggiare
- Pattern architetturali e principi di design per sistemi multi-agente
- Protocolli di comunicazione tra agenti e flusso dei dati
- Strategie di load balancing e scaling per agenti AI
- Monitoraggio di produzione per sistemi multi-agente
- Comunicazione service-to-service in ambienti containerizzati

#### Esercizi pratici
1. **Distribuzione soluzione retail**: Distribuisci lo scenario completo multi-agente per il retail
2. **Personalizzazione degli agenti**: Modifica i comportamenti degli agenti Customer e Inventory
3. **Scalabilità dell'architettura**: Implementa load balancing e auto-scaling
4. **Monitoraggio di produzione**: Configura monitoraggio e alerting completi
5. **Integrazione microservizi**: Estendi l'esempio [Microservices Architecture](../../../examples/container-app/microservices) per supportare workflow basati su agenti

#### Domande di valutazione
- Come progetti pattern di comunicazione efficaci tra agenti?
- Quali sono le considerazioni chiave per scalare i carichi di lavoro degli agenti AI?
- Come monitori e fai il debug di sistemi AI multi-agente?
- Quali pattern di produzione garantiscono affidabilità per gli agenti AI?

---

### Capitolo 6: Validazione & Pianificazione Pre-Distribuzione (Settimana 8)
**Durata**: 1 ora | **Complessità**: ⭐⭐

#### Obiettivi di apprendimento
- Eseguire una pianificazione completa della capacità e la validazione delle risorse
- Selezionare SKU Azure ottimali per rapporto costi/benefici
- Implementare controlli pre-volo e validazioni automatiche
- Pianificare le distribuzioni con strategie di ottimizzazione dei costi

#### Concetti chiave da padroneggiare
- Quote di risorse Azure e limitazioni di capacità
- Criteri di selezione degli SKU e ottimizzazione dei costi
- Script di validazione automatizzati e test
- Pianificazione delle distribuzioni e valutazione dei rischi

#### Esercizi pratici
1. **Analisi della capacità**: Analizza i requisiti delle risorse per le tue applicazioni
2. **Ottimizzazione SKU**: Confronta e seleziona tier di servizio economicamente vantaggiosi
3. **Automazione della validazione**: Implementa script di controllo pre-distribuzione
4. **Pianificazione dei costi**: Crea stime dei costi e budget per le distribuzioni

#### Domande di valutazione
- Come validi la capacità Azure prima della distribuzione?
- Quali fattori influenzano le decisioni di selezione degli SKU?
- Come automatizzi la validazione pre-distribuzione?
- Quali strategie aiutano a ottimizzare i costi di distribuzione?

---

### Capitolo 7: Troubleshooting & Debugging (Settimana 9)
**Durata**: 1-1.5 ore | **Complessità**: ⭐⭐

#### Obiettivi di apprendimento
- Sviluppare approcci sistematici di debug per le distribuzioni AZD
- Risolvere problemi comuni di distribuzione e configurazione
- Debuggare problemi specifici dell'AI e di prestazioni
- Implementare monitoraggio e alerting per il rilevamento proattivo dei problemi

#### Concetti chiave da padroneggiare
- Tecniche diagnostiche e strategie di logging
- Pattern di fallimento comuni e le loro soluzioni
- Monitoraggio delle prestazioni e ottimizzazione
- Procedure di risposta agli incidenti e ripristino

#### Esercizi pratici
1. **Competenze diagnostiche**: Esercitati con distribuzioni intenzionalmente rotte
2. **Analisi dei log**: Usa efficacemente Azure Monitor e Application Insights
3. **Ottimizzazione delle prestazioni**: Ottimizza applicazioni con prestazioni lente
4. **Procedure di recupero**: Implementa backup e disaster recovery

#### Domande di valutazione
- Quali sono i guasti di distribuzione AZD più comuni?
- Come fai il debug di problemi di autenticazione e permessi?
- Quali strategie di monitoraggio aiutano a prevenire problemi in produzione?
- Come ottimizzi le prestazioni delle applicazioni in Azure?

---

### Capitolo 8: Pattern di Produzione & Enterprise (Settimana 10-11)
**Durata**: 2-3 ore | **Complessità**: ⭐⭐⭐⭐

#### Obiettivi di apprendimento
- Implementare strategie di distribuzione di livello enterprise
- Progettare pattern di sicurezza e framework di conformità
- Stabilire monitoraggio, governance e gestione dei costi
- Creare pipeline CI/CD scalabili con integrazione AZD
- Applicare best practice per distribuzioni di container app in produzione (sicurezza, monitoraggio, costi, CI/CD)

#### Concetti chiave da padroneggiare
- Requisiti di sicurezza enterprise e conformità
- Framework di governance e implementazione delle policy
- Monitoraggio avanzato e gestione dei costi
- Integrazione CI/CD e pipeline di deployment automatizzate
- Strategie di deployment blue-green e canary per workload containerizzati

#### Esercizi pratici
1. **Sicurezza enterprise**: Implementa pattern di sicurezza completi
2. **Framework di governance**: Configura Azure Policy e gestione delle risorse
3. **Monitoraggio avanzato**: Crea dashboard e alerting automatizzato
4. **Integrazione CI/CD**: Costruisci pipeline di deployment automatizzate
5. **Container Apps in produzione**: Applica sicurezza, monitoraggio e ottimizzazione dei costi all'esempio [Microservices Architecture](../../../examples/container-app/microservices)

#### Domande di valutazione
- Come implementi la sicurezza enterprise nelle distribuzioni AZD?
- Quali pattern di governance assicurano conformità e controllo dei costi?
- Come progetti un monitoraggio scalabile per sistemi di produzione?
- Quali pattern CI/CD funzionano meglio con i flussi di lavoro AZD?

#### Obiettivi di apprendimento
- Comprendere i fondamenti e i concetti core di Azure Developer CLI
- Installare e configurare correttamente azd nel tuo ambiente di sviluppo
- Completare la tua prima distribuzione usando un template esistente
- Navigare la struttura del progetto azd e comprendere i componenti chiave

#### Concetti chiave da padroneggiare
- Template, ambienti e servizi
- Struttura di configurazione azure.yaml
- Comandi base azd (init, up, down, deploy)
- Principi di Infrastructure as Code
- Autenticazione e autorizzazione in Azure

#### Esercizi pratici

**Esercizio 1.1: Installazione e configurazione**
```bash
# Completa queste attività:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Esercizio 1.2: Prima distribuzione**
```bash
# Distribuire una semplice applicazione web:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Esercizio 1.3: Analisi della struttura del progetto**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Domande di autovalutazione
1. Quali sono i tre concetti core dell'architettura azd?
2. Qual è lo scopo del file azure.yaml?
3. Come aiutano gli ambienti a gestire diversi target di distribuzione?
4. Quali metodi di autenticazione possono essere usati con azd?
5. Cosa succede quando esegui `azd up` per la prima volta?

---

## Tracciamento del progresso e quadro di valutazione
```bash
# Creare e configurare più ambienti:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Esercizio 2.2: Configurazione avanzata**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Esercizio 2.3: Configurazione della sicurezza**
```bash
# Implementare le migliori pratiche di sicurezza:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Domande di autovalutazione
1. Come gestisce azd la precedenza delle variabili d'ambiente?
2. Cosa sono i deployment hooks e quando dovresti usarli?
3. Come configuri SKU diversi per ambienti differenti?
4. Quali sono le implicazioni di sicurezza dei diversi metodi di autenticazione?
5. Come gestisci segreti e dati di configurazione sensibili?

### Modulo 3: Distribuzione e Provisioning (Settimana 4)

#### Obiettivi di apprendimento
- Padroneggiare i flussi di lavoro di deployment e le best practice
- Comprendere Infrastructure as Code con template Bicep
- Implementare architetture multi-servizio complesse
- Ottimizzare le prestazioni e l'affidabilità delle distribuzioni

#### Concetti chiave da padroneggiare
- Struttura dei template Bicep e moduli
- Dipendenze tra risorse e ordine
- Strategie di deployment (blue-green, rolling updates)
- Distribuzioni multi-regione
- Migrazioni di database e gestione dei dati

#### Esercizi pratici

**Esercizio 3.1: Infrastruttura personalizzata**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Esercizio 3.2: Applicazione multi-servizio**
```bash
# Distribuire un'architettura a microservizi:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Esercizio 3.3: Integrazione del database**
```bash
# Implementare pattern di deployment del database:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Domande di autovalutazione
1. Quali sono i vantaggi dell'uso di Bicep rispetto ai template ARM?
2. Come gestisci le migrazioni di database nelle distribuzioni azd?
3. Quali strategie esistono per distribuzioni senza downtime?
4. Come gestisci le dipendenze tra servizi?
5. Quali sono le considerazioni per le distribuzioni multi-regione?

### Modulo 4: Validazione Pre-Distribuzione (Settimana 5)
- Implementare controlli pre-distribuzione completi
- Padroneggiare la pianificazione della capacità e la convalida delle risorse
- Comprendere la selezione SKU e l'ottimizzazione dei costi
- Costruire pipeline di convalida automatizzate

#### Concetti chiave da padroneggiare
- Quote e limiti delle risorse Azure
- Criteri di selezione SKU e implicazioni sui costi
- Script e strumenti di convalida automatizzati
- Metodologie di pianificazione della capacità
- Test di prestazioni e ottimizzazione

#### Esercizi pratici

**Exercise 4.1: Capacity Planning**
```bash
# Implementare la validazione della capacità:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Exercise 4.2: Pre-flight Validation**
```powershell
# Costruire una pipeline di validazione completa:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Exercise 4.3: SKU Optimization**
```bash
# Ottimizza le configurazioni del servizio:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Domande di autovalutazione
1. Quali fattori dovrebbero influenzare le decisioni di selezione dello SKU?
2. Come si convalida la disponibilità delle risorse Azure prima della distribuzione?
3. Quali sono i componenti chiave di un sistema di controlli pre-flight?
4. Come si stimano e si controllano i costi di distribuzione?
5. Quale monitoraggio è essenziale per la pianificazione della capacità?

### Modulo 5: Risoluzione dei problemi e Debug (Settimana 6)

#### Obiettivi di apprendimento
- Padroneggiare metodologie sistematiche di troubleshooting
- Sviluppare competenze nel debug di problemi di deployment complessi
- Implementare monitoraggio e alerting completi
- Costruire procedure di risposta agli incidenti e di recupero

#### Concetti chiave da padroneggiare
- Pattern comuni di fallimento nelle distribuzioni
- Tecniche di analisi e correlazione dei log
- Monitoraggio delle prestazioni e ottimizzazione
- Rilevamento e risposta agli incidenti di sicurezza
- Disaster recovery e continuità operativa

#### Esercizi pratici

**Exercise 5.1: Troubleshooting Scenarios**
```bash
# Esercitati a risolvere problemi comuni:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercise 5.2: Monitoring Implementation**
```bash
# Configura un monitoraggio completo:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Exercise 5.3: Incident Response**
```bash
# Sviluppare procedure di risposta agli incidenti:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Domande di autovalutazione
1. Qual è l'approccio sistematico al troubleshooting delle distribuzioni azd?
2. Come si correlano i log tra più servizi e risorse?
3. Quali metriche di monitoraggio sono più critiche per la rilevazione precoce dei problemi?
4. Come si implementano procedure efficaci di disaster recovery?
5. Quali sono i componenti chiave di un piano di risposta agli incidenti?

### Modulo 6: Argomenti avanzati e migliori pratiche (Settimane 7-8)

#### Obiettivi di apprendimento
- Implementare pattern di distribuzione di livello enterprise
- Padroneggiare l'integrazione e l'automazione CI/CD
- Sviluppare template personalizzati e contribuire alla community
- Comprendere requisiti avanzati di sicurezza e conformità

#### Concetti chiave da padroneggiare
- Pattern di integrazione della pipeline CI/CD
- Sviluppo e distribuzione di template personalizzati
- Governance enterprise e conformità
- Configurazioni avanzate di rete e sicurezza
- Ottimizzazione delle prestazioni e gestione dei costi

#### Esercizi pratici

**Exercise 6.1: CI/CD Integration**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Exercise 6.2: Custom Template Development**
```bash
# Crea e pubblica modelli personalizzati:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercise 6.3: Enterprise Implementation**
```bash
# Implementare funzionalità di livello enterprise:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Domande di autovalutazione
1. Come si integra azd nei flussi di lavoro CI/CD esistenti?
2. Quali sono le considerazioni chiave per lo sviluppo di template personalizzati?
3. Come si implementano governance e conformità nelle distribuzioni azd?
4. Quali sono le migliori pratiche per le distribuzioni su scala enterprise?
5. Come si contribuisce efficacemente alla community azd?

## Progetti pratici

### Progetto 1: Sito portfolio personale
**Complessità**: Principiante  
**Durata**: 1-2 settimane

Costruire e distribuire un sito portfolio personale usando:
- Hosting di siti statici su Azure Storage
- Configurazione di dominio personalizzato
- Integrazione CDN per prestazioni globali
- Pipeline di deployment automatizzata

**Consegne**:
- Sito funzionante distribuito su Azure
- Template azd personalizzato per deployment di portfolio
- Documentazione del processo di distribuzione
- Analisi dei costi e raccomandazioni di ottimizzazione

### Progetto 2: Applicazione di gestione attività
**Complessità**: Intermedio  
**Durata**: 2-3 settimane

Creare un'applicazione full-stack per la gestione delle attività con:
- Frontend React distribuito su App Service
- Backend API Node.js con autenticazione
- Database PostgreSQL con migrazioni
- Monitoraggio con Application Insights

**Consegne**:
- Applicazione completa con autenticazione utente
- Schema del database e script di migrazione
- Cruscotti di monitoraggio e regole di alerting
- Configurazione di distribuzione multi-ambiente

### Progetto 3: Piattaforma e-commerce a microservizi
**Complessità**: Avanzato  
**Durata**: 4-6 settimane

Progettare e implementare una piattaforma e-commerce basata su microservizi:
- Molteplici servizi API (catalogo, ordini, pagamenti, utenti)
- Integrazione con message queue tramite Service Bus
- Cache Redis per ottimizzazione delle prestazioni
- Logging e monitoraggio completi

**Esempio di riferimento**: Vedi [Architettura a microservizi](../../../examples/container-app/microservices) per un template pronto per la produzione e una guida al deployment

**Consegne**:
- Architettura a microservizi completa
- Pattern di comunicazione tra servizi
- Test di prestazioni e ottimizzazione
- Implementazione della sicurezza pronta per la produzione

## Valutazione e certificazione

### Verifiche delle conoscenze

Completa queste valutazioni dopo ogni modulo:

**Valutazione Modulo 1**: Concetti di base e installazione
- Domande a scelta multipla sui concetti core
- Attività pratiche di installazione e configurazione
- Esercizio di deployment semplice

**Valutazione Modulo 2**: Configurazione e ambienti
- Scenari di gestione degli ambienti
- Esercizi di troubleshooting della configurazione
- Implementazione della configurazione di sicurezza

**Valutazione Modulo 3**: Distribuzione e provisioning
- Sfide di progettazione dell'infrastruttura
- Scenari di distribuzione multi-servizio
- Esercizi di ottimizzazione delle prestazioni

**Valutazione Modulo 4**: Convalida pre-distribuzione
- Case study di pianificazione della capacità
- Scenari di ottimizzazione dei costi
- Implementazione di pipeline di convalida

**Valutazione Modulo 5**: Troubleshooting e debugging
- Esercizi di diagnosi dei problemi
- Attività di implementazione del monitoraggio
- Simulazioni di risposta agli incidenti

**Valutazione Modulo 6**: Argomenti avanzati
- Progettazione di pipeline CI/CD
- Sviluppo di template personalizzati
- Scenari di architettura enterprise

### Progetto finale (Capstone)

Progetta e implementa una soluzione completa che dimostri la padronanza di tutti i concetti:

**Requisiti**:
- Architettura applicativa multi-tier
- Molteplici ambienti di distribuzione
- Monitoraggio e alerting completi
- Implementazione di sicurezza e conformità
- Ottimizzazione dei costi e delle prestazioni
- Documentazione completa e runbook

**Criteri di valutazione**:
- Qualità dell'implementazione tecnica
- Completezza della documentazione
- Aderenza alla sicurezza e alle migliori pratiche
- Ottimizzazione delle prestazioni e dei costi
- Efficacia nel troubleshooting e nel monitoraggio

## Risorse di studio e riferimenti

### Documentazione ufficiale
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Risorse della community
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Ambienti di pratica
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Strumenti aggiuntivi
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Raccomandazioni sul programma di studio

### Studio a tempo pieno (8 settimane)
- **Settimane 1-2**: Moduli 1-2 (Primi passi, Configurazione)
- **Settimane 3-4**: Moduli 3-4 (Distribuzione, Pre-distribuzione)
- **Settimane 5-6**: Moduli 5-6 (Troubleshooting, Argomenti avanzati)
- **Settimane 7-8**: Progetti pratici e valutazione finale

### Studio part-time (16 settimane)
- **Settimane 1-4**: Modulo 1 (Primi passi)
- **Settimane 5-7**: Modulo 2 (Configurazione e ambienti)
- **Settimane 8-10**: Modulo 3 (Distribuzione e provisioning)
- **Settimane 11-12**: Modulo 4 (Convalida pre-distribuzione)
- **Settimane 13-14**: Modulo 5 (Troubleshooting e debugging)
- **Settimane 15-16**: Modulo 6 (Argomenti avanzati e valutazione)

---

## Quadro di monitoraggio dei progressi e valutazione

### Lista di controllo per il completamento del capitolo

Monitora i tuoi progressi attraverso ogni capitolo con questi risultati misurabili:

#### 📚 Capitolo 1: Fondamenti e Avvio rapido
- [ ] **Installazione completata**: AZD installato e verificato sulla tua piattaforma
- [ ] **Primo deployment**: Template todo-nodejs-mongo distribuito con successo
- [ ] **Configurazione ambiente**: Variabili d'ambiente iniziali configurate
- [ ] **Navigazione risorse**: Risorse distribuite esplorate in Azure Portal
- [ ] **Padronanza comandi**: Familiarità con i comandi di base AZD

#### 🤖 Capitolo 2: Sviluppo AI-First  
- [ ] **Deploy template AI**: azure-search-openai-demo distribuito con successo
- [ ] **Implementazione RAG**: Indicizzazione e retrieval dei documenti configurati
- [ ] **Configurazione modelli**: Più modelli AI configurati per scopi diversi
- [ ] **Monitoraggio AI**: Application Insights implementato per i workload AI
- [ ] **Ottimizzazione prestazioni**: Performance dell'app AI ottimizzate

#### ⚙️ Capitolo 3: Configurazione e Autenticazione
- [ ] **Setup multi-ambiente**: Ambienti dev, staging e prod configurati
- [ ] **Implementazione sicurezza**: Autenticazione con managed identity configurata
- [ ] **Gestione segreti**: Azure Key Vault integrato per dati sensibili
- [ ] **Gestione parametri**: Configurazioni specifiche per ambiente create
- [ ] **Padronanza autenticazione**: Pattern di accesso sicuro implementati

#### 🏗️ Capitolo 4: Infrastructure as Code e Distribuzione
- [ ] **Creazione template personalizzato**: Template per applicazione multi-servizio creato
- [ ] **Padronanza Bicep**: Componenti infrastrutturali modulari e riutilizzabili creati
- [ ] **Automazione deploy**: Hook pre/post deployment implementati
- [ ] **Progettazione architettura**: Architettura microservizi complessa distribuita
- [ ] **Ottimizzazione template**: Template ottimizzati per prestazioni e costi

#### 🎯 Capitolo 5: Soluzioni AI Multi-Agente
- [ ] **Deploy retail**: Scenario retail multi-agente distribuito completamente
- [ ] **Personalizzazione agenti**: Comportamenti degli agenti Customer e Inventory modificati
- [ ] **Scalabilità architettura**: Bilanciamento del carico e auto-scaling implementati
- [ ] **Monitoraggio produzione**: Monitoraggio e alerting completi configurati
- [ ] **Tuning prestazioni**: Prestazioni del sistema multi-agente ottimizzate

#### 🔍 Capitolo 6: Convalida e pianificazione pre-distribuzione
- [ ] **Analisi capacità**: Requisiti delle risorse analizzati per le applicazioni
- [ ] **Ottimizzazione SKU**: Tier di servizio costo-efficaci selezionati
- [ ] **Automazione convalida**: Script di controllo pre-deploy implementati
- [ ] **Pianificazione costi**: Preventivi di costo e budget creati per il deployment
- [ ] **Valutazione rischi**: Rischi di distribuzione identificati e mitigati

#### 🚨 Capitolo 7: Troubleshooting e Debugging
- [ ] **Competenze diagnostiche**: Deployment intenzionalmente difettosi debugati con successo
- [ ] **Analisi log**: Azure Monitor e Application Insights utilizzati efficacemente
- [ ] **Ottimizzazione prestazioni**: Applicazioni lente ottimizzate
- [ ] **Procedure di recupero**: Backup e disaster recovery implementati
- [ ] **Setup monitoraggio**: Monitoraggio proattivo e alerting creati

#### 🏢 Capitolo 8: Produzione e pattern enterprise
- [ ] **Sicurezza enterprise**: Pattern di sicurezza completi implementati
- [ ] **Framework di governance**: Azure Policy e gestione delle risorse configurati
- [ ] **Monitoraggio avanzato**: Cruscotti e alerting automatizzato creati
- [ ] **Integrazione CI/CD**: Pipeline di deployment automatizzate costruite
- [ ] **Conformità**: Requisiti di conformità enterprise soddisfatti

### Cronologia di apprendimento e milestone

#### Settimane 1-2: Costruzione delle basi
- **Milestone**: Distribuire la prima applicazione AI usando AZD
- **Validazione**: Applicazione funzionante accessibile via URL pubblico
- **Competenze**: Flussi di lavoro base di AZD e integrazione dei servizi AI

#### Settimane 3-4: Padronanza della configurazione
- **Milestone**: Deploy multi-ambiente con autenticazione sicura
- **Validazione**: Stessa applicazione distribuita su dev/staging/prod
- **Competenze**: Gestione degli ambienti e implementazione della sicurezza

#### Settimane 5-6: Competenza infrastrutturale
- **Milestone**: Template personalizzato per applicazione multi-servizio complessa
- **Validazione**: Template riutilizzabile distribuito da un altro membro del team
- **Competenze**: Padronanza di Bicep e automazione infrastrutturale

#### Settimane 7-8: Implementazione AI avanzata
- **Milestone**: Soluzione multi-agente AI pronta per la produzione
- **Validazione**: Sistema in grado di gestire carichi reali con monitoraggio
- **Competenze**: Orchestrazione multi-agente e ottimizzazione delle prestazioni

#### Settimane 9-10: Prontezza alla produzione
- **Milestone**: Distribuzione di livello enterprise con conformità completa
- **Validazione**: Superata revisione di sicurezza e audit di ottimizzazione dei costi
- **Competenze**: Governance, monitoraggio e integrazione CI/CD

### Valutazione e certificazione

#### Metodi di validazione delle conoscenze
1. **Deploy pratici**: Applicazioni funzionanti per ogni capitolo
2. **Code review**: Valutazione della qualità di template e configurazioni
3. **Problem solving**: Scenari di troubleshooting e relative soluzioni
4. **Insegnamento tra pari**: Spiegare i concetti ad altri apprendenti
5. **Contributo alla community**: Condividere template o miglioramenti

#### Risultati per lo sviluppo professionale
- **Progetti del portfolio**: 8 distribuzioni pronte per la produzione
- **Competenze tecniche**: Competenza nel deployment AZD e AI secondo gli standard del settore
- **Capacità di problem-solving**: Risoluzione dei problemi e ottimizzazione in autonomia
- **Riconoscimento nella comunità**: Partecipazione attiva nella community di sviluppatori Azure
- **Avanzamento di carriera**: Competenze direttamente applicabili a ruoli cloud e AI

#### Metriche di successo
- **Tasso di successo dei deployment**: >95% di deployment riusciti
- **Tempo di risoluzione**: <30 minuti per problemi comuni
- **Ottimizzazione delle prestazioni**: Miglioramenti dimostrabili nei costi e nelle prestazioni
- **Conformità alla sicurezza**: Tutti i deployment soddisfano gli standard di sicurezza aziendali
- **Trasferimento di conoscenza**: Capacità di fare da mentore ad altri sviluppatori

### Apprendimento continuo e coinvolgimento nella comunità

#### Rimani aggiornato
- **Aggiornamenti Azure**: Segui le note di rilascio di Azure Developer CLI
- **Eventi della comunità**: Partecipa a eventi per sviluppatori Azure e AI
- **Documentazione**: Contribuisci alla documentazione e agli esempi della community
- **Ciclo di feedback**: Fornisci feedback sui contenuti del corso e sui servizi Azure

#### Sviluppo della carriera
- **Rete professionale**: Connettiti con esperti Azure e AI
- **Opportunità di intervento**: Presenta ciò che hai imparato a conferenze o meetup
- **Contributi open source**: Contribuisci ai template e agli strumenti AZD
- **Mentoring**: Guida altri sviluppatori nel loro percorso di apprendimento di AZD

---

**Navigazione del capitolo:**
- **📚 Home del corso**: [AZD per principianti](../README.md)
- **📖 Inizia a imparare**: [Capitolo 1: Fondamenti e Avvio rapido](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Monitoraggio dei progressi**: Monitora i tuoi progressi attraverso il completo sistema di apprendimento di 8 capitoli
- **🤝 Comunità**: [Azure Discord](https://discord.gg/microsoft-azure) per supporto e discussione

**Monitoraggio del progresso di studio**: Usa questa guida strutturata per padroneggiare Azure Developer CLI attraverso un apprendimento progressivo e pratico con risultati misurabili e benefici per lo sviluppo professionale.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Esclusione di responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica basato su IA [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella lingua di origine deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale eseguita da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->