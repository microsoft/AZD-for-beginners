<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T20:11:26+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "it"
}
-->
# Guida allo studio - AZD per principianti

## Introduzione

Questa guida completa fornisce obiettivi di apprendimento strutturati, concetti chiave, esercizi pratici e materiali di valutazione per aiutarti a padroneggiare Azure Developer CLI (azd). Usa questa guida per monitorare i tuoi progressi e assicurarti di aver coperto tutti gli argomenti essenziali.

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

## Struttura del corso

### Modulo 1: Introduzione (Settimane 1-2)

#### Obiettivi di apprendimento
- Comprendere i fondamenti e i concetti principali di Azure Developer CLI
- Installare e configurare correttamente azd nel tuo ambiente di sviluppo
- Completare la tua prima distribuzione utilizzando un modello esistente
- Navigare nella struttura del progetto azd e comprendere i componenti principali

#### Concetti chiave da padroneggiare
- Modelli, ambienti e servizi
- Struttura di configurazione azure.yaml
- Comandi di base azd (init, up, down, deploy)
- Principi di Infrastructure as Code
- Autenticazione e autorizzazione Azure

#### Esercizi pratici

**Esercizio 1.1: Installazione e configurazione**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Esercizio 1.2: Prima distribuzione**
```bash
# Deploy a simple web application:
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
1. Quali sono i tre concetti principali dell'architettura azd?
2. Qual è lo scopo del file azure.yaml?
3. In che modo gli ambienti aiutano a gestire diversi obiettivi di distribuzione?
4. Quali metodi di autenticazione possono essere utilizzati con azd?
5. Cosa succede quando esegui `azd up` per la prima volta?

### Modulo 2: Configurazione e ambienti (Settimana 3)

#### Obiettivi di apprendimento
- Padroneggiare la gestione e la configurazione degli ambienti
- Comprendere configurazioni avanzate di azure.yaml
- Implementare impostazioni e variabili specifiche per l'ambiente
- Configurare l'autenticazione per diversi scenari

#### Concetti chiave da padroneggiare
- Gerarchia degli ambienti e precedenza delle variabili
- Configurazione dei servizi e parametri
- Hook ed eventi del ciclo di vita
- Metodi di autenticazione (utente, service principal, identità gestita)
- Gestione dei file di configurazione

#### Esercizi pratici

**Esercizio 2.1: Configurazione multi-ambiente**
```bash
# Create and configure multiple environments:
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
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Domande di autovalutazione
1. Come gestisce azd la precedenza delle variabili di ambiente?
2. Cosa sono gli hook di distribuzione e quando dovresti usarli?
3. Come configuri diversi SKU per diversi ambienti?
4. Quali sono le implicazioni di sicurezza dei diversi metodi di autenticazione?
5. Come gestisci segreti e dati di configurazione sensibili?

### Modulo 3: Distribuzione e provisioning (Settimana 4)

#### Obiettivi di apprendimento
- Padroneggiare i flussi di lavoro di distribuzione e le migliori pratiche
- Comprendere Infrastructure as Code con modelli Bicep
- Implementare architetture complesse multi-servizio
- Ottimizzare le prestazioni e l'affidabilità delle distribuzioni

#### Concetti chiave da padroneggiare
- Struttura e moduli dei modelli Bicep
- Dipendenze delle risorse e ordinamento
- Strategie di distribuzione (blue-green, aggiornamenti progressivi)
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
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Esercizio 3.3: Integrazione del database**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Domande di autovalutazione
1. Quali sono i vantaggi di utilizzare Bicep rispetto ai modelli ARM?
2. Come gestisci le migrazioni di database nelle distribuzioni azd?
3. Quali strategie esistono per distribuzioni senza tempi di inattività?
4. Come gestisci le dipendenze tra i servizi?
5. Quali sono le considerazioni per le distribuzioni multi-regione?

### Modulo 4: Validazione pre-distribuzione (Settimana 5)

#### Obiettivi di apprendimento
- Implementare controlli completi pre-distribuzione
- Padroneggiare la pianificazione della capacità e la validazione delle risorse
- Comprendere la selezione degli SKU e l'ottimizzazione dei costi
- Costruire pipeline di validazione automatizzate

#### Concetti chiave da padroneggiare
- Quote e limiti delle risorse Azure
- Criteri di selezione degli SKU e implicazioni sui costi
- Script e strumenti di validazione automatizzati
- Metodologie di pianificazione della capacità
- Test delle prestazioni e ottimizzazione

#### Esercizi pratici

**Esercizio 4.1: Pianificazione della capacità**
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Esercizio 4.2: Validazione pre-distribuzione**
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Esercizio 4.3: Ottimizzazione degli SKU**
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Domande di autovalutazione
1. Quali fattori dovrebbero influenzare le decisioni di selezione degli SKU?
2. Come validi la disponibilità delle risorse Azure prima della distribuzione?
3. Quali sono i componenti chiave di un sistema di controllo pre-distribuzione?
4. Come stimi e controlli i costi di distribuzione?
5. Quali monitoraggi sono essenziali per la pianificazione della capacità?

### Modulo 5: Risoluzione dei problemi e debugging (Settimana 6)

#### Obiettivi di apprendimento
- Padroneggiare metodologie sistematiche di risoluzione dei problemi
- Sviluppare competenze nel debugging di problemi complessi di distribuzione
- Implementare monitoraggio e avvisi completi
- Costruire procedure di risposta agli incidenti e recupero

#### Concetti chiave da padroneggiare
- Modelli comuni di fallimento della distribuzione
- Tecniche di analisi e correlazione dei log
- Monitoraggio delle prestazioni e ottimizzazione
- Rilevamento e risposta agli incidenti di sicurezza
- Recupero da disastri e continuità operativa

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
1. Qual è l'approccio sistematico alla risoluzione dei problemi nelle distribuzioni azd?
2. Come correlare i log tra più servizi e risorse?
3. Quali metriche di monitoraggio sono più critiche per il rilevamento precoce dei problemi?
4. Come implementi procedure efficaci di recupero da disastri?
5. Quali sono i componenti chiave di un piano di risposta agli incidenti?

### Modulo 6: Argomenti avanzati e migliori pratiche (Settimane 7-8)

#### Obiettivi di apprendimento
- Implementare modelli di distribuzione di livello aziendale
- Padroneggiare l'integrazione e l'automazione CI/CD
- Sviluppare modelli personalizzati e contribuire alla comunità
- Comprendere requisiti avanzati di sicurezza e conformità

#### Concetti chiave da padroneggiare
- Modelli di integrazione CI/CD
- Sviluppo e distribuzione di modelli personalizzati
- Governance aziendale e conformità
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

**Esercizio 6.2: Sviluppo di modelli personalizzati**
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
1. Come integri azd nei flussi di lavoro CI/CD esistenti?
2. Quali sono le considerazioni chiave per lo sviluppo di modelli personalizzati?
3. Come implementi governance e conformità nelle distribuzioni azd?
4. Quali sono le migliori pratiche per distribuzioni su scala aziendale?
5. Come contribuisci efficacemente alla comunità azd?

## Progetti pratici

### Progetto 1: Sito web portfolio personale
**Complessità**: Principiante  
**Durata**: 1-2 settimane

Crea e distribuisci un sito web portfolio personale utilizzando:
- Hosting di siti web statici su Azure Storage
- Configurazione di dominio personalizzato
- Integrazione CDN per prestazioni globali
- Pipeline di distribuzione automatizzata

**Deliverables**:
- Sito web funzionante distribuito su Azure
- Modello azd personalizzato per distribuzioni di portfolio
- Documentazione del processo di distribuzione
- Raccomandazioni per l'analisi e l'ottimizzazione dei costi

### Progetto 2: Applicazione di gestione delle attività
**Complessità**: Intermedio  
**Durata**: 2-3 settimane

Crea un'applicazione completa di gestione delle attività con:
- Frontend React distribuito su App Service
- Backend API Node.js con autenticazione
- Database PostgreSQL con migrazioni
- Monitoraggio con Application Insights

**Deliverables**:
- Applicazione completa con autenticazione utente
- Schema del database e script di migrazione
- Dashboard di monitoraggio e regole di avviso
- Configurazione di distribuzione multi-ambiente

### Progetto 3: Piattaforma e-commerce basata su microservizi
**Complessità**: Avanzato  
**Durata**: 4-6 settimane

Progetta e implementa una piattaforma e-commerce basata su microservizi:
- Servizi API multipli (catalogo, ordini, pagamenti, utenti)
- Integrazione di code di messaggi con Service Bus
- Cache Redis per ottimizzazione delle prestazioni
- Logging e monitoraggio completi

**Deliverables**:
- Architettura completa basata su microservizi
- Modelli di comunicazione tra servizi
- Test delle prestazioni e ottimizzazione
- Implementazione di sicurezza pronta per la produzione

## Valutazione e certificazione

### Verifiche di conoscenza

Completa queste valutazioni dopo ogni modulo:

**Valutazione Modulo 1**: Concetti di base e installazione
- Domande a scelta multipla sui concetti principali
- Attività pratiche di installazione e configurazione
- Esercizio di distribuzione semplice

**Valutazione Modulo 2**: Configurazione e ambienti
- Scenari di gestione degli ambienti
- Esercizi di risoluzione dei problemi di configurazione
- Implementazione della configurazione di sicurezza

**Valutazione Modulo 3**: Distribuzione e provisioning
- Sfide di progettazione dell'infrastruttura
- Scenari di distribuzione multi-servizio
- Esercizi di ottimizzazione delle prestazioni

**Valutazione Modulo 4**: Validazione pre-distribuzione
- Studi di caso sulla pianificazione della capacità
- Scenari di ottimizzazione dei costi
- Implementazione della pipeline di validazione

**Valutazione Modulo 5**: Risoluzione dei problemi e debugging
- Esercizi di diagnosi dei problemi
- Attività di implementazione del monitoraggio
- Simulazioni di risposta agli incidenti

**Valutazione Modulo 6**: Argomenti avanzati
- Progettazione di pipeline CI/CD
- Sviluppo di modelli personalizzati
- Scenari di architettura aziendale

### Progetto finale

Progetta e implementa una soluzione completa che dimostri la padronanza di tutti i concetti:

**Requisiti**:
- Architettura applicativa multi-tier
- Ambienti di distribuzione multipli
- Monitoraggio e avvisi completi
- Implementazione di sicurezza e conformità
- Ottimizzazione dei costi e delle prestazioni
- Documentazione completa e runbook

**Criteri di valutazione**:
- Qualità dell'implementazione tecnica
- Completezza della documentazione
- Aderenza alle migliori pratiche di sicurezza
- Ottimizzazione delle prestazioni e dei costi
- Efficacia nella risoluzione dei problemi e nel monitoraggio

## Risorse di studio e riferimenti

### Documentazione ufficiale
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Documentazione Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centro di architettura Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Risorse della comunità
- [Galleria di modelli AZD](https://azure.github.io/awesome-azd/)
- [Organizzazione GitHub Azure-Samples](https://github.com/Azure-Samples)
- [Repository GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)

### Ambienti di pratica
- [Account gratuito Azure](https://azure.microsoft.com/free/)
- [Livello gratuito Azure DevOps](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Strumenti aggiuntivi
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Pacchetto di estensioni Azure Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Raccomandazioni per il programma di studio

### Studio a tempo pieno (8 settimane)
- **Settimane 1-2**: Moduli 1-2 (Introduzione, Configurazione)
- **Settimane 3-4**: Moduli 3-4 (Distribuzione, Validazione pre-distribuzione)
- **Settimane 5-6**: Moduli 5-6 (Risoluzione dei problemi, Argomenti avanzati)
- **Settimane 7-8**: Progetti pratici e valutazione finale

### Studio part-time (16 settimane)
- **Settimane 1-4**: Modulo 1 (Introduzione)
- **Settimane 5-7**: Modulo 2 (Configurazione e ambienti)
- **Settimane 8-10**: Modulo 3 (Distribuzione e provisioning)
- **Settimane 11-12**: Modulo 4 (Validazione pre-distribuzione)
- **Settimane 13-14**: Modulo 5 (Risoluzione dei problemi e debugging)
- **Settimane 15-16**: Modulo 6 (Argomenti avanzati e valutazione)

### Studio autonomo
- Completa ogni modulo al tuo ritmo
- Dedica più tempo ai concetti impegnativi
- Ripeti gli esercizi fino a raggiungere la padronanza
- Partecipa alle discussioni della comunità e fai domande

## Consigli per il successo

### Strategie di apprendimento efficaci
1. **Pratica regolarmente**: Distribuisci applicazioni frequentemente per acquisire memoria muscolare
2. **Sperimenta senza paura**: Usa ambienti di sviluppo per provare nuove configurazioni
3. **Documenta il tuo apprendimento**: Tieni traccia delle soluzioni ai problemi che incontri
4. **Unisciti alla comunità**: Partecipa alle discussioni e contribuisci ai progetti
5. **Rimani aggiornato**: Segui gli aggiornamenti di Azure e le nuove funzionalità di azd

### Errori comuni da evitare
1. **Saltare i prerequisiti**: Assicurati di avere una conoscenza di base adeguata
2. **Affrettare i concetti**: Dedica tempo a comprendere a fondo i fondamentali
3. **Ignorare la sicurezza**: Implementa sempre le migliori pratiche di sicurezza fin dall'inizio
4. **Non testare a fondo**: Testa le distribuzioni in più ambienti
5. **Evitare la documentazione**: Una buona documentazione è essenziale per la manutenzione

### Costruire esperienza pratica
1. **Inizia in piccolo**: Comincia con applicazioni semplici e aumenta gradualmente la complessità
2. **Impara dagli errori**: Usa gli esercizi di risoluzione dei problemi come opportunità di apprendimento
3. **Contribuisci all'Open Source**: Condividi i tuoi modelli e soluzioni con la comunità  
4. **Insegna agli altri**: Spiegare i concetti agli altri rafforza la tua comprensione  
5. **Rimani curioso**: Esplora continuamente nuovi servizi Azure e modelli di integrazione  

---

**Navigazione**  
- **Lezione precedente**: [FAQ](faq.md)  
- **Prossima lezione**: [Changelog](../changelog.md)  

**Tracciamento del progresso di studio**: Usa questa guida per monitorare il tuo percorso di apprendimento e assicurarti una copertura completa di tutti i concetti e le pratiche di Azure Developer CLI.  

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.