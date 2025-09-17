<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee6549c72fe4271931326578e2379243",
  "translation_date": "2025-09-17T21:45:29+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "it"
}
-->
# Guida allo studio - Obiettivi di apprendimento completi

**Navigazione del percorso di apprendimento**
- **📚 Home del corso**: [AZD Per Principianti](../README.md)
- **📖 Inizia a imparare**: [Capitolo 1: Fondamenti e Avvio Rapido](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Monitoraggio del progresso**: [Completamento del corso](../README.md#-course-completion--certification)

## Introduzione

Questa guida allo studio completa fornisce obiettivi di apprendimento strutturati, concetti chiave, esercizi pratici e materiali di valutazione per aiutarti a padroneggiare Azure Developer CLI (azd). Usa questa guida per monitorare i tuoi progressi e assicurarti di aver coperto tutti gli argomenti essenziali.

## Obiettivi di apprendimento

Completando questa guida allo studio, sarai in grado di:
- Padroneggiare tutti i concetti fondamentali e avanzati di Azure Developer CLI
- Sviluppare competenze pratiche nel distribuire e gestire applicazioni Azure
- Acquisire sicurezza nel risolvere problemi e ottimizzare le distribuzioni
- Comprendere le pratiche di distribuzione pronte per la produzione e le considerazioni sulla sicurezza

## Risultati di apprendimento

Dopo aver completato tutte le sezioni di questa guida allo studio, sarai in grado di:
- Progettare, distribuire e gestire architetture applicative complete utilizzando azd
- Implementare strategie complete di monitoraggio, sicurezza e ottimizzazione dei costi
- Risolvere autonomamente problemi complessi di distribuzione
- Creare modelli personalizzati e contribuire alla comunità azd

## Struttura di apprendimento in 8 capitoli

### Capitolo 1: Fondamenti e Avvio Rapido (Settimana 1)
**Durata**: 30-45 minuti | **Complessità**: ⭐

#### Obiettivi di apprendimento
- Comprendere i concetti e la terminologia principali di Azure Developer CLI
- Installare e configurare con successo AZD sulla tua piattaforma di sviluppo
- Distribuire la tua prima applicazione utilizzando un modello esistente
- Navigare efficacemente nell'interfaccia a riga di comando di AZD

#### Concetti chiave da padroneggiare
- Struttura e componenti del progetto AZD (azure.yaml, infra/, src/)
- Flussi di lavoro basati su modelli di distribuzione
- Nozioni di base sulla configurazione dell'ambiente
- Gestione del gruppo di risorse e della sottoscrizione

#### Esercizi pratici
1. **Verifica dell'installazione**: Installa AZD e verifica con `azd version`
2. **Prima distribuzione**: Distribuisci con successo il modello todo-nodejs-mongo
3. **Configurazione dell'ambiente**: Configura le tue prime variabili di ambiente
4. **Esplorazione delle risorse**: Naviga tra le risorse distribuite nel portale Azure

#### Domande di valutazione
- Quali sono i componenti principali di un progetto AZD?
- Come si inizializza un nuovo progetto da un modello?
- Qual è la differenza tra `azd up` e `azd deploy`?
- Come si gestiscono più ambienti con AZD?

---

### Capitolo 2: Sviluppo AI-First (Settimana 2)
**Durata**: 1-2 ore | **Complessità**: ⭐⭐

#### Obiettivi di apprendimento
- Integrare i servizi Azure AI Foundry nei flussi di lavoro AZD
- Distribuire e configurare applicazioni basate sull'intelligenza artificiale
- Comprendere i modelli di implementazione RAG (Retrieval-Augmented Generation)
- Gestire distribuzioni e scalabilità dei modelli AI

#### Concetti chiave da padroneggiare
- Integrazione del servizio Azure OpenAI e gestione delle API
- Configurazione della ricerca AI e indicizzazione vettoriale
- Strategie di distribuzione dei modelli e pianificazione della capacità
- Monitoraggio delle applicazioni AI e ottimizzazione delle prestazioni

#### Esercizi pratici
1. **Distribuzione Chat AI**: Distribuisci il modello azure-search-openai-demo
2. **Implementazione RAG**: Configura l'indicizzazione e il recupero dei documenti
3. **Configurazione del modello**: Configura più modelli AI con scopi diversi
4. **Monitoraggio AI**: Implementa Application Insights per carichi di lavoro AI

#### Domande di valutazione
- Come si configurano i servizi Azure OpenAI in un modello AZD?
- Quali sono i componenti chiave di un'architettura RAG?
- Come si gestisce la capacità e la scalabilità dei modelli AI?
- Quali metriche di monitoraggio sono importanti per le applicazioni AI?

---

### Capitolo 3: Configurazione e Autenticazione (Settimana 3)
**Durata**: 45-60 minuti | **Complessità**: ⭐⭐

#### Obiettivi di apprendimento
- Padroneggiare strategie di configurazione e gestione degli ambienti
- Implementare modelli di autenticazione sicura e identità gestita
- Organizzare le risorse con convenzioni di denominazione appropriate
- Configurare distribuzioni multi-ambiente (dev, staging, prod)

#### Concetti chiave da padroneggiare
- Gerarchia degli ambienti e precedenza delle configurazioni
- Autenticazione con identità gestita e principal di servizio
- Integrazione di Key Vault per la gestione dei segreti
- Gestione dei parametri specifici dell'ambiente

#### Esercizi pratici
1. **Configurazione multi-ambiente**: Configura ambienti dev, staging e prod
2. **Configurazione della sicurezza**: Implementa l'autenticazione con identità gestita
3. **Gestione dei segreti**: Integra Azure Key Vault per dati sensibili
4. **Gestione dei parametri**: Crea configurazioni specifiche per l'ambiente

#### Domande di valutazione
- Come si configurano ambienti diversi con AZD?
- Quali sono i vantaggi dell'utilizzo dell'identità gestita rispetto ai principal di servizio?
- Come si gestiscono in modo sicuro i segreti delle applicazioni?
- Qual è la gerarchia di configurazione in AZD?

---

### Capitolo 4: Infrastruttura come Codice e Distribuzione (Settimana 4-5)
**Durata**: 1-1.5 ore | **Complessità**: ⭐⭐⭐

#### Obiettivi di apprendimento
- Creare e personalizzare modelli di infrastruttura Bicep
- Implementare modelli di distribuzione avanzati e flussi di lavoro
- Comprendere strategie di provisioning delle risorse
- Progettare architetture scalabili multi-servizio

#### Concetti chiave da padroneggiare
- Struttura e best practice dei modelli Bicep
- Dipendenze delle risorse e ordine di distribuzione
- File di parametri e modularità dei modelli
- Hook personalizzati e automazione della distribuzione

#### Esercizi pratici
1. **Creazione di modelli personalizzati**: Costruisci un modello di applicazione multi-servizio
2. **Padronanza di Bicep**: Crea componenti di infrastruttura modulari e riutilizzabili
3. **Automazione della distribuzione**: Implementa hook pre/post distribuzione
4. **Progettazione dell'architettura**: Distribuisci un'architettura complessa di microservizi

#### Domande di valutazione
- Come si creano modelli Bicep personalizzati per AZD?
- Quali sono le best practice per organizzare il codice dell'infrastruttura?
- Come si gestiscono le dipendenze delle risorse nei modelli?
- Quali modelli di distribuzione supportano aggiornamenti senza interruzioni?

---

### Capitolo 5: Soluzioni AI Multi-Agente (Settimana 6-7)
**Durata**: 2-3 ore | **Complessità**: ⭐⭐⭐⭐

#### Obiettivi di apprendimento
- Progettare e implementare architetture AI multi-agente
- Coordinare e comunicare tra agenti
- Distribuire soluzioni AI pronte per la produzione con monitoraggio
- Comprendere la specializzazione degli agenti e i modelli di flusso di lavoro

#### Concetti chiave da padroneggiare
- Modelli di architettura multi-agente e principi di progettazione
- Protocolli di comunicazione tra agenti e flusso di dati
- Strategie di bilanciamento del carico e scalabilità per agenti AI
- Monitoraggio della produzione per sistemi multi-agente

#### Esercizi pratici
1. **Distribuzione della soluzione retail**: Distribuisci lo scenario completo multi-agente per il retail
2. **Personalizzazione degli agenti**: Modifica i comportamenti degli agenti Cliente e Inventario
3. **Scalabilità dell'architettura**: Implementa bilanciamento del carico e auto-scalabilità
4. **Monitoraggio della produzione**: Configura monitoraggio completo e avvisi

#### Domande di valutazione
- Come si progettano modelli di comunicazione efficaci tra agenti?
- Quali sono le considerazioni chiave per scalare i carichi di lavoro degli agenti AI?
- Come si monitorano e si risolvono problemi nei sistemi AI multi-agente?
- Quali modelli di produzione garantiscono affidabilità per gli agenti AI?

---

### Capitolo 6: Validazione e Pianificazione Pre-Distribuzione (Settimana 8)
**Durata**: 1 ora | **Complessità**: ⭐⭐

#### Obiettivi di apprendimento
- Eseguire una pianificazione della capacità e una validazione delle risorse complete
- Selezionare gli SKU Azure ottimali per la convenienza economica
- Implementare controlli e validazioni automatiche pre-distribuzione
- Pianificare distribuzioni con strategie di ottimizzazione dei costi

#### Concetti chiave da padroneggiare
- Quote delle risorse Azure e limitazioni di capacità
- Criteri di selezione degli SKU e ottimizzazione dei costi
- Script di validazione automatica e test
- Metodologie di pianificazione della capacità
- Test delle prestazioni e ottimizzazione

#### Esercizi pratici
1. **Analisi della capacità**: Analizza i requisiti delle risorse per le tue applicazioni
2. **Ottimizzazione degli SKU**: Confronta e seleziona livelli di servizio convenienti
3. **Automazione della validazione**: Implementa script di controllo pre-distribuzione
4. **Pianificazione dei costi**: Crea stime e budget per i costi di distribuzione

#### Domande di valutazione
- Come si validano le capacità Azure prima della distribuzione?
- Quali fattori influenzano le decisioni di selezione degli SKU?
- Come si automatizzano le validazioni pre-distribuzione?
- Quali strategie aiutano a ottimizzare i costi di distribuzione?
2. Come si convalida la disponibilità delle risorse Azure prima del deployment?  
3. Quali sono i componenti chiave di un sistema di controllo preliminare?  
4. Come si stimano e controllano i costi di deployment?  
5. Quali monitoraggi sono essenziali per la pianificazione della capacità?

### Modulo 5: Risoluzione dei problemi e Debugging (Settimana 6)

#### Obiettivi di apprendimento
- Padroneggiare metodologie sistematiche di risoluzione dei problemi  
- Sviluppare competenze nel debugging di problemi complessi di deployment  
- Implementare monitoraggio e sistemi di allerta completi  
- Creare procedure di risposta agli incidenti e di recupero  

#### Concetti chiave da padroneggiare
- Modelli comuni di fallimento nei deployment  
- Tecniche di analisi e correlazione dei log  
- Monitoraggio delle prestazioni e ottimizzazione  
- Rilevamento e risposta agli incidenti di sicurezza  
- Recupero dai disastri e continuità operativa  

#### Esercizi pratici

**Esercizio 5.1: Scenari di risoluzione dei problemi**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```  

**Esercizio 5.2: Implementazione del monitoraggio**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```  

**Esercizio 5.3: Risposta agli incidenti**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```  

#### Domande di autovalutazione
1. Qual è l'approccio sistematico per risolvere i problemi nei deployment azd?  
2. Come si correlano i log tra più servizi e risorse?  
3. Quali metriche di monitoraggio sono più critiche per il rilevamento precoce dei problemi?  
4. Come si implementano procedure efficaci di disaster recovery?  
5. Quali sono i componenti chiave di un piano di risposta agli incidenti?  

### Modulo 6: Argomenti avanzati e migliori pratiche (Settimane 7-8)

#### Obiettivi di apprendimento
- Implementare modelli di deployment di livello enterprise  
- Padroneggiare l'integrazione e l'automazione CI/CD  
- Sviluppare template personalizzati e contribuire alla community  
- Comprendere requisiti avanzati di sicurezza e conformità  

#### Concetti chiave da padroneggiare
- Modelli di integrazione delle pipeline CI/CD  
- Sviluppo e distribuzione di template personalizzati  
- Governance e conformità aziendale  
- Configurazioni avanzate di rete e sicurezza  
- Ottimizzazione delle prestazioni e gestione dei costi  

#### Esercizi pratici

**Esercizio 6.1: Integrazione CI/CD**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```  

**Esercizio 6.2: Sviluppo di template personalizzati**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```  

**Esercizio 6.3: Implementazione aziendale**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```  

#### Domande di autovalutazione
1. Come si integra azd nei flussi di lavoro CI/CD esistenti?  
2. Quali sono le considerazioni chiave per lo sviluppo di template personalizzati?  
3. Come si implementano governance e conformità nei deployment azd?  
4. Quali sono le migliori pratiche per deployment su scala aziendale?  
5. Come si contribuisce efficacemente alla community azd?  

## Progetti pratici

### Progetto 1: Sito web personale di portfolio  
**Complessità**: Principiante  
**Durata**: 1-2 settimane  

Crea e distribuisci un sito web personale di portfolio utilizzando:  
- Hosting di siti statici su Azure Storage  
- Configurazione di un dominio personalizzato  
- Integrazione CDN per prestazioni globali  
- Pipeline di deployment automatizzato  

**Consegne**:  
- Sito web funzionante distribuito su Azure  
- Template azd personalizzato per deployment di portfolio  
- Documentazione del processo di deployment  
- Analisi dei costi e raccomandazioni per l'ottimizzazione  

### Progetto 2: Applicazione di gestione attività  
**Complessità**: Intermedio  
**Durata**: 2-3 settimane  

Crea un'applicazione full-stack per la gestione delle attività con:  
- Frontend React distribuito su App Service  
- Backend API Node.js con autenticazione  
- Database PostgreSQL con migrazioni  
- Monitoraggio con Application Insights  

**Consegne**:  
- Applicazione completa con autenticazione utente  
- Schema del database e script di migrazione  
- Dashboard di monitoraggio e regole di allerta  
- Configurazione di deployment multi-ambiente  

### Progetto 3: Piattaforma e-commerce basata su microservizi  
**Complessità**: Avanzato  
**Durata**: 4-6 settimane  

Progetta e implementa una piattaforma e-commerce basata su microservizi:  
- Servizi API multipli (catalogo, ordini, pagamenti, utenti)  
- Integrazione di code di messaggi con Service Bus  
- Cache Redis per ottimizzazione delle prestazioni  
- Logging e monitoraggio completi  

**Consegne**:  
- Architettura completa basata su microservizi  
- Modelli di comunicazione tra servizi  
- Test delle prestazioni e ottimizzazione  
- Implementazione di sicurezza pronta per la produzione  

## Valutazione e certificazione

### Verifiche delle conoscenze

Completa queste valutazioni dopo ogni modulo:

**Valutazione Modulo 1**: Concetti di base e installazione  
- Domande a scelta multipla sui concetti principali  
- Attività pratiche di installazione e configurazione  
- Esercizio di deployment semplice  

**Valutazione Modulo 2**: Configurazione e ambienti  
- Scenari di gestione degli ambienti  
- Esercizi di risoluzione dei problemi di configurazione  
- Implementazione di configurazioni di sicurezza  

**Valutazione Modulo 3**: Deployment e provisioning  
- Sfide di progettazione dell'infrastruttura  
- Scenari di deployment multi-servizio  
- Esercizi di ottimizzazione delle prestazioni  

**Valutazione Modulo 4**: Validazione pre-deployment  
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
- Scenari di architettura aziendale  

### Progetto finale

Progetta e implementa una soluzione completa che dimostri la padronanza di tutti i concetti:

**Requisiti**:  
- Architettura applicativa multi-livello  
- Ambienti di deployment multipli  
- Monitoraggio e allerta completi  
- Implementazione di sicurezza e conformità  
- Ottimizzazione dei costi e delle prestazioni  
- Documentazione completa e runbook  

**Criteri di valutazione**:  
- Qualità dell'implementazione tecnica  
- Completezza della documentazione  
- Aderenza alle migliori pratiche di sicurezza  
- Ottimizzazione delle prestazioni e dei costi  
- Efficacia nel troubleshooting e nel monitoraggio  

## Risorse di studio e riferimenti

### Documentazione ufficiale
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Documentazione Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Risorse della community
- [Galleria di template AZD](https://azure.github.io/awesome-azd/)  
- [Organizzazione GitHub Azure-Samples](https://github.com/Azure-Samples)  
- [Repository GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)  

### Ambienti di pratica
- [Account gratuito Azure](https://azure.microsoft.com/free/)  
- [Livello gratuito Azure DevOps](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Strumenti aggiuntivi
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  
- **Documentazione**: Contribuisci alla documentazione della community e agli esempi
- **Ciclo di Feedback**: Fornisci feedback sui contenuti del corso e sui servizi Azure

#### Sviluppo Professionale
- **Rete Professionale**: Connettiti con esperti di Azure e AI
- **Opportunità di Parlare in Pubblico**: Presenta ciò che hai imparato in conferenze o meetup
- **Contributo Open Source**: Contribuisci ai template e agli strumenti di AZD
- **Mentorship**: Guida altri sviluppatori nel loro percorso di apprendimento su AZD

---

**Navigazione Capitoli:**
- **📚 Home del Corso**: [AZD Per Principianti](../README.md)
- **📖 Inizia a Imparare**: [Capitolo 1: Fondamenti e Avvio Rapido](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Monitoraggio dei Progressi**: Tieni traccia dei tuoi avanzamenti attraverso il sistema di apprendimento completo in 8 capitoli
- **🤝 Community**: [Azure Discord](https://discord.gg/microsoft-azure) per supporto e discussioni

**Monitoraggio dei Progressi di Studio**: Usa questa guida strutturata per padroneggiare Azure Developer CLI attraverso un apprendimento progressivo e pratico, con risultati misurabili e benefici per lo sviluppo professionale.

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche potrebbero contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale eseguita da un traduttore umano. Non siamo responsabili per eventuali fraintendimenti o interpretazioni errate derivanti dall'uso di questa traduzione.