# Glossary - Azure and AZD Terminology

**Riferimento per tutti i capitoli**
- **📚 Home del corso**: [AZD per principianti](../README.md)
- **📖 Impara le basi**: [Capitolo 1: Nozioni di base su AZD](../docs/getting-started/azd-basics.md)
- **🤖 Termini IA**: [Capitolo 2: Sviluppo AI-First](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introduzione

Questo glossario completo fornisce definizioni per termini, concetti e acronimi utilizzati in Azure Developer CLI e nello sviluppo cloud su Azure. Riferimento essenziale per comprendere la documentazione tecnica, risolvere problemi e comunicare efficacemente sui progetti azd e sui servizi Azure.

## Obiettivi di apprendimento

Usando questo glossario, potrai:
- Comprendere la terminologia e i concetti essenziali di Azure Developer CLI
- Padroneggiare il vocabolario e i termini tecnici dello sviluppo cloud su Azure
- Consultare in modo efficiente la terminologia relativa a Infrastructure as Code e al deployment
- Comprendere i nomi dei servizi Azure, gli acronimi e i loro scopi
- Accedere a definizioni per la terminologia di troubleshooting e debugging
- Apprendere concetti avanzati di architettura e sviluppo su Azure

## Risultati di apprendimento

Con il riferimento regolare a questo glossario, sarai in grado di:
- Comunicare efficacemente usando la terminologia corretta di Azure Developer CLI
- Comprendere più chiaramente la documentazione tecnica e i messaggi di errore
- Navigare con fiducia tra i servizi e i concetti di Azure
- Risolvere problemi utilizzando il vocabolario tecnico appropriato
- Contribuire alle discussioni del team con un linguaggio tecnico accurato
- Ampliare sistematicamente le tue conoscenze sullo sviluppo cloud su Azure

## A

**Modello ARM**  
Azure Resource Manager template. Formato Infrastructure as Code basato su JSON utilizzato per definire e distribuire le risorse Azure in modo dichiarativo.

**App Service**  
Offerta platform-as-a-service (PaaS) di Azure per ospitare applicazioni web, API REST e backend per mobile senza gestire l'infrastruttura.

**Application Insights**  
Servizio di Application Performance Monitoring (APM) di Azure che fornisce approfondimenti sulle prestazioni, sulla disponibilità e sull'utilizzo delle applicazioni.

**Azure CLI**  
Interfaccia a riga di comando per la gestione delle risorse Azure. Utilizzata da azd per l'autenticazione e alcune operazioni.

**Azure Developer CLI (azd)**  
Strumento a riga di comando incentrato sullo sviluppatore che accelera il processo di creazione e distribuzione di applicazioni su Azure utilizzando template e Infrastructure as Code.

**azure.yaml**  
Il file di configurazione principale per un progetto azd che definisce servizi, infrastruttura e hook di deployment.

**Azure Resource Manager (ARM)**  
Servizio di Azure per il deployment e la gestione che fornisce un livello di gestione per creare, aggiornare e eliminare risorse.

## B

**Bicep**  
Linguaggio specifico per il dominio (DSL) sviluppato da Microsoft per il deployment delle risorse Azure. Fornisce una sintassi più semplice rispetto ai template ARM pur compilando in ARM.

**Build**  
Processo di compilazione del codice sorgente, installazione delle dipendenze e preparazione delle applicazioni per il deployment.

**Blue-Green Deployment**  
Strategia di deployment che utilizza due ambienti di produzione identici (blue e green) per ridurre al minimo tempi di inattività e rischi.

## C

**Container Apps**  
Servizio di container serverless di Azure che permette di eseguire applicazioni containerizzate senza gestire infrastrutture complesse.

**CI/CD**  
Continuous Integration/Continuous Deployment. Pratiche automatizzate per integrare modifiche al codice e distribuire le applicazioni.

**Cosmos DB**  
Servizio di database multi-modello e distribuito globalmente di Azure che fornisce SLA complete per throughput, latenza, disponibilità e coerenza.

**Configuration**  
Impostazioni e parametri che controllano il comportamento dell'applicazione e le opzioni di deployment.

## D

**Deployment**  
Processo di installazione e configurazione delle applicazioni e delle loro dipendenze sull'infrastruttura di destinazione.

**Docker**  
Piattaforma per sviluppare, spedire ed eseguire applicazioni utilizzando la tecnologia dei container.

**Dockerfile**  
File di testo contenente istruzioni per la creazione di un'immagine container Docker.

## E

**Environment**  
Un target di deployment che rappresenta un'istanza specifica della tua applicazione (ad es., sviluppo, staging, produzione).

**Environment Variables**  
Valori di configurazione memorizzati come coppie chiave-valore che le applicazioni possono leggere a runtime.

**Endpoint**  
URL o indirizzo di rete dove un'applicazione o un servizio può essere accessibile.

## F

**Function App**  
Servizio compute serverless di Azure che permette di eseguire codice event-driven senza gestire l'infrastruttura.

## G

**GitHub Actions**  
Piattaforma CI/CD integrata con i repository GitHub per automatizzare workflow.

**Git**  
Sistema di controllo versione distribuito utilizzato per tracciare le modifiche nel codice sorgente.

## H

**Hooks**  
Script o comandi personalizzati che vengono eseguiti in punti specifici del ciclo di vita del deployment (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Tipo di servizio Azure dove un'applicazione sarà distribuita (ad es., appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Pratica di definire e gestire l'infrastruttura tramite codice anziché processi manuali.

**Init**  
Processo di inizializzazione di un nuovo progetto azd, tipicamente a partire da un template.

## J

**JSON**  
JavaScript Object Notation. Formato di scambio dati comunemente usato per file di configurazione e risposte API.

**JWT**  
JSON Web Token. Standard per trasmettere in modo sicuro informazioni tra parti sotto forma di oggetto JSON.

## K

**Key Vault**  
Servizio di Azure per memorizzare e gestire in modo sicuro segreti, chiavi e certificati.

**Kusto Query Language (KQL)**  
Linguaggio di query usato per analizzare i dati in Azure Monitor, Application Insights e altri servizi Azure.

## L

**Load Balancer**  
Servizio che distribuisce il traffico di rete in ingresso tra più server o istanze.

**Log Analytics**  
Servizio di Azure per raccogliere, analizzare e agire sui dati di telemetria provenienti da ambienti cloud e on-premises.

## M

**Managed Identity**  
Funzionalità di Azure che fornisce ai servizi Azure un'identità gestita automaticamente per l'autenticazione verso altri servizi Azure.

**Microservices**  
Approccio architetturale in cui le applicazioni sono costruite come una raccolta di servizi piccoli e indipendenti.

**Monitor**  
Soluzione unificata di monitoraggio di Azure che fornisce osservabilità full-stack su applicazioni e infrastruttura.

## N

**Node.js**  
Runtime JavaScript basato sul motore V8 di Chrome per costruire applicazioni server-side.

**npm**  
Gestore di pacchetti per Node.js che gestisce dipendenze e pacchetti.

## O

**Output**  
Valori restituiti dal deployment dell'infrastruttura che possono essere utilizzati da applicazioni o altre risorse.

## P

**Package**  
Processo di preparazione del codice dell'applicazione e delle dipendenze per il deployment.

**Parameters**  
Valori di input passati ai template infrastrutturali per personalizzare i deployment.

**PostgreSQL**  
Sistema di database relazionale open-source supportato come servizio gestito in Azure.

**Provisioning**  
Processo di creazione e configurazione delle risorse Azure definite nei template infrastrutturali.

## Q

**Quota**  
Limiti sulla quantità di risorse che possono essere create in una subscription o in una regione Azure.

## R

**Resource Group**  
Contenitore logico per risorse Azure che condividono lo stesso ciclo di vita, permessi e policy.

**Resource Token**  
Stringa unica generata da azd per garantire che i nomi delle risorse siano univoci tra i deployment.

**REST API**  
Stile architetturale per progettare applicazioni di rete usando i metodi HTTP.

**Rollback**  
Processo di ripristino a una versione precedente di un'applicazione o della configurazione infrastrutturale.

## S

**Service**  
Componente della tua applicazione definito in azure.yaml (ad es., frontend web, backend API, database).

**SKU**  
Stock Keeping Unit. Rappresenta diversi livelli di servizio o prestazioni per le risorse Azure.

**SQL Database**  
Servizio di database relazionale gestito di Azure basato su Microsoft SQL Server.

**Static Web Apps**  
Servizio di Azure per costruire e distribuire applicazioni web full-stack a partire da repository di codice sorgente.

**Storage Account**  
Servizio di Azure che fornisce storage cloud per oggetti dati inclusi blob, file, code e tabelle.

**Subscription**  
Contenitore dell'account Azure che contiene resource group e risorse, con fatturazione e gestione degli accessi associati.

## T

**Template**  
Struttura di progetto predefinita contenente codice applicativo, definizioni infrastrutturali e configurazione per scenari comuni.

**Terraform**  
Tool open-source di Infrastructure as Code che supporta più provider cloud incluso Azure.

**Traffic Manager**  
Bilanciatore del traffico basato su DNS di Azure per distribuire il traffico tra regioni Azure globali.

## U

**URI**  
Uniform Resource Identifier. Stringa che identifica una risorsa particolare.

**URL**  
Uniform Resource Locator. Tipo di URI che specifica dove si trova una risorsa e come recuperarla.

## V

**Virtual Network (VNet)**  
Elemento fondamentale per le reti private in Azure, che fornisce isolamento e segmentazione.

**VS Code**  
Visual Studio Code. Editor di codice popolare con eccellente integrazione per Azure e azd.

## W

**Webhook**  
Callback HTTP attivato da eventi specifici, comunemente usato nelle pipeline CI/CD.

**What-if**  
Funzionalità di Azure che mostra quali cambiamenti verrebbero effettuati da un deployment senza eseguirlo realmente.

## Y

**YAML**  
YAML Ain't Markup Language. Standard di serializzazione dati leggibile dall'uomo usato per file di configurazione come azure.yaml.

## Z

**Zone**  
Posizioni fisicamente separate all'interno di una regione Azure che forniscono ridondanza e alta disponibilità.

---

## Acronimi comuni

| Acronimo | Forma estesa | Descrizione |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Servizio di identità e gestione degli accessi |
| ACR | Azure Container Registry | Servizio di registry per immagini container |
| AKS | Azure Kubernetes Service | Servizio Kubernetes gestito |
| API | Application Programming Interface | Insieme di protocolli per costruire software |
| ARM | Azure Resource Manager | Servizio di deployment e gestione di Azure |
| CDN | Content Delivery Network | Rete distribuita di server per la consegna di contenuti |
| CI/CD | Continuous Integration/Continuous Deployment | Pratiche di sviluppo automatizzate |
| CLI | Command Line Interface | Interfaccia utente basata su testo |
| DNS | Domain Name System | Sistema per tradurre nomi di dominio in indirizzi IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versione sicura di HTTP |
| IaC | Infrastructure as Code | Gestione dell'infrastruttura tramite codice |
| JSON | JavaScript Object Notation | Formato di scambio dati |
| JWT | JSON Web Token | Formato di token per la trasmissione sicura di informazioni |
| KQL | Kusto Query Language | Linguaggio di query per i servizi dati Azure |
| RBAC | Role-Based Access Control | Metodo di controllo accessi basato sui ruoli utente |
| REST | Representational State Transfer | Stile architetturale per servizi web |
| SDK | Software Development Kit | Collezione di strumenti per lo sviluppo |
| SLA | Service Level Agreement | Impegno sulla disponibilità/prestazioni del servizio |
| SQL | Structured Query Language | Linguaggio per la gestione di database relazionali |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocolli crittografici |
| URI | Uniform Resource Identifier | Stringa che identifica una risorsa |
| URL | Uniform Resource Locator | Tipo di URI che specifica la posizione di una risorsa |
| VM | Virtual Machine | Emulazione di un sistema computerizzato |
| VNet | Virtual Network | Rete privata in Azure |
| YAML | YAML Ain't Markup Language | Standard di serializzazione dei dati |

---

## Mappature dei nomi dei servizi Azure

| Nome comune | Nome ufficiale del servizio Azure | azd Host Type |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Termini specifici per il contesto

### Termini di sviluppo
- **Hot Reload**: Aggiornamento automatico delle applicazioni durante lo sviluppo senza riavvio
- **Build Pipeline**: Processo automatizzato per compilare e testare il codice
- **Deployment Slot**: Ambiente di staging all'interno di un App Service
- **Environment Parity**: Mantenere ambienti di sviluppo, staging e produzione simili

### Termini di sicurezza
- **Managed Identity**: Funzionalità di Azure che fornisce gestione automatica delle credenziali
- **Key Vault**: Archiviazione sicura per segreti, chiavi e certificati
- **RBAC**: Controllo degli accessi basato sui ruoli per le risorse Azure
- **Network Security Group**: Firewall virtuale per controllare il traffico di rete

### Termini di monitoraggio
- **Telemetry**: Raccolta automatizzata di misurazioni e dati
- **Application Performance Monitoring (APM)**: Monitoraggio delle prestazioni del software
- **Log Analytics**: Servizio per raccogliere e analizzare i dati di log
- **Alert Rules**: Notifiche automatizzate basate su metriche o condizioni

### Termini di deployment
- **Blue-Green Deployment**: Strategia di deployment a zero downtime
- **Canary Deployment**: Rilascio graduale a una sottosezione di utenti
- **Rolling Update**: Sostituzione sequenziale delle istanze dell'applicazione
- **Rollback**: Ripristino a una versione precedente dell'applicazione

---

**Suggerimento d'uso**: Usa `Ctrl+F` per cercare rapidamente termini specifici in questo glossario. I termini sono incrociati dove applicabile.

---

**Navigazione**
- **Lezione precedente**: [Cheat Sheet](cheat-sheet.md)
- **Lezione successiva**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Esclusione di responsabilità:
Questo documento è stato tradotto mediante il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci a garantire l'accuratezza, si segnala che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella lingua di partenza deve essere considerato la fonte autorevole. Per informazioni critiche è consigliata una traduzione professionale effettuata da un traduttore umano. Non ci assumiamo responsabilità per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->