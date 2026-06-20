# Glossary - Azure and AZD Terminology

**Riferimento per Tutti i Capitoli**
- **📚 Home del Corso**: [AZD Per Principianti](../README.md)
- **📖 Impara le Basi**: [Capitolo 1: Basi di AZD](../docs/getting-started/azd-basics.md)
- **🤖 Termini AI**: [Capitolo 2: Sviluppo incentrato sull'AI](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introduzione

Questo glossario completo fornisce definizioni per termini, concetti e acronimi utilizzati in Azure Developer CLI e nello sviluppo cloud Azure. Riferimento essenziale per comprendere la documentazione tecnica, risolvere problemi e comunicare efficacemente sui progetti azd e sui servizi Azure.

## Obiettivi di apprendimento

Usando questo glossario, potrai:
- Comprendere la terminologia e i concetti essenziali di Azure Developer CLI
- Padroneggiare il vocabolario e i termini tecnici dello sviluppo cloud Azure
- Fare riferimento in modo efficiente alla terminologia di Infrastructure as Code e di deployment
- Comprendere i nomi dei servizi Azure, gli acronimi e i loro scopi
- Accedere alle definizioni per la terminologia di troubleshooting e debugging
- Apprendere concetti avanzati di architettura e sviluppo Azure

## Risultati di apprendimento

Con un riferimento regolare a questo glossario, sarai in grado di:
- Comunicare efficacemente usando la terminologia corretta di Azure Developer CLI
- Comprendere la documentazione tecnica e i messaggi di errore più chiaramente
- Muoversi con sicurezza tra servizi e concetti Azure
- Risolvere problemi utilizzando il vocabolario tecnico appropriato
- Contribuire alle discussioni di team con un linguaggio tecnico accurato
- Ampliare sistematicamente le tue conoscenze nello sviluppo cloud Azure

## A

**ARM Template**  
Azure Resource Manager template. Formato Infrastructure as Code basato su JSON usato per definire e distribuire risorse Azure in modo dichiarativo.

**App Service**  
Offerta platform-as-a-service (PaaS) di Azure per ospitare applicazioni web, API REST e back-end mobili senza gestire l'infrastruttura.

**Application Insights**  
Servizio APM di Azure che fornisce approfondimenti sulle prestazioni, disponibilità e utilizzo delle applicazioni.

**Azure CLI**  
Interfaccia a riga di comando per la gestione delle risorse Azure. Utilizzata da azd per l'autenticazione e alcune operazioni.

**Azure Developer CLI (azd)**  
Strumento a riga di comando incentrato sullo sviluppatore che accelera il processo di creazione e distribuzione di applicazioni su Azure usando template e Infrastructure as Code.

**azure.yaml**  
File di configurazione principale per un progetto azd che definisce servizi, infrastruttura e hook di deployment.

**Azure Resource Manager (ARM)**  
Servizio di deployment e gestione di Azure che fornisce un livello di gestione per creare, aggiornare e cancellare risorse.

## B

**Bicep**  
Domain-specific language (DSL) sviluppato da Microsoft per il deployment di risorse Azure. Offre una sintassi più semplice rispetto agli ARM template compilando in ARM.

**Build**  
Processo di compilazione del codice sorgente, installazione delle dipendenze e preparazione delle applicazioni per il deployment.

**Blue-Green Deployment**  
Strategia di deployment che utilizza due ambienti di produzione identici (blue e green) per minimizzare downtime e rischi.

## C

**Container Apps**  
Servizio serverless di container di Azure che permette di eseguire applicazioni containerizzate senza gestire un'infrastruttura complessa.

**CI/CD**  
Continuous Integration/Continuous Deployment. Pratiche automatizzate per integrare le modifiche del codice e distribuire le applicazioni.

**Cosmos DB**  
Servizio di database multimodello e distribuito globalmente di Azure che fornisce SLA completi per throughput, latenza, disponibilità e consistenza.

**Configuration**  
Impostazioni e parametri che controllano il comportamento dell'applicazione e le opzioni di deployment.

## D

**Deployment**  
Processo di installazione e configurazione delle applicazioni e delle loro dipendenze sull'infrastruttura di destinazione.

**Docker**  
Piattaforma per sviluppare, distribuire ed eseguire applicazioni usando la tecnologia dei container.

**Dockerfile**  
File di testo contenente istruzioni per costruire un'immagine container Docker.

## E

**Environment**  
Destinazione di deployment che rappresenta un'istanza specifica della tua applicazione (ad es., sviluppo, staging, produzione).

**Environment Variables**  
Valori di configurazione memorizzati come coppie chiave-valore che le applicazioni possono leggere a runtime.

**Endpoint**  
URL o indirizzo di rete dove un'applicazione o un servizio è accessibile.

## F

**Function App**  
Servizio compute serverless di Azure che permette di eseguire codice event-driven senza gestire l'infrastruttura.

## G

**GitHub Actions**  
Piattaforma CI/CD integrata con i repository GitHub per automatizzare i workflow.

**Git**  
Sistema di controllo versione distribuito usato per tracciare le modifiche al codice sorgente.

## H

**Hooks**  
Script o comandi personalizzati che vengono eseguiti in punti specifici del ciclo di vita del deployment (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Tipo di servizio Azure dove un'applicazione verrà distribuita (ad es., appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Pratica di definire e gestire l'infrastruttura tramite codice piuttosto che processi manuali.

**Init**  
Processo di inizializzazione di un nuovo progetto azd, tipicamente a partire da un template.

## J

**JSON**  
JavaScript Object Notation. Formato di interchange di dati comunemente usato per file di configurazione e risposte API.

**JWT**  
JSON Web Token. Standard per trasmettere in modo sicuro informazioni tra parti come oggetto JSON.

## K

**Key Vault**  
Servizio di Azure per memorizzare e gestire in modo sicuro segreti, chiavi e certificati.

**Kusto Query Language (KQL)**  
Linguaggio di query usato per analizzare i dati in Azure Monitor, Application Insights e altri servizi Azure.

## L

**Load Balancer**  
Servizio che distribuisce il traffico di rete in ingresso su più server o istanze.

**Log Analytics**  
Servizio Azure per raccogliere, analizzare e agire sui dati di telemetria da ambienti cloud e on-premises.

## M

**Managed Identity**  
Funzionalità di Azure che fornisce ai servizi Azure un'identità gestita automaticamente per autenticarsi verso altri servizi Azure.

**Microservices**  
Approccio architetturale in cui le applicazioni sono costruite come una collezione di servizi piccoli e indipendenti.

**Monitor**  
Soluzione di monitoraggio unificata di Azure che fornisce osservabilità full-stack su applicazioni e infrastruttura.

## N

**Node.js**  
Runtime JavaScript basato sul motore V8 di Chrome per costruire applicazioni server-side.

**npm**  
Package manager per Node.js che gestisce dipendenze e pacchetti.

## O

**Output**  
Valori restituiti dal deployment dell'infrastruttura che possono essere usati dalle applicazioni o da altre risorse.

## P

**Package**  
Processo di preparazione del codice applicativo e delle dipendenze per il deployment.

**Parameters**  
Valori di input passati ai template di infrastruttura per personalizzare i deployment.

**PostgreSQL**  
Sistema di database relazionale open-source supportato come servizio gestito in Azure.

**Provisioning**  
Processo di creazione e configurazione delle risorse Azure definite nei template di infrastruttura.

## Q

**Quota**  
Limiti sulla quantità di risorse che possono essere create in una subscription o in una regione Azure.

## R

**Resource Group**  
Contenitore logico per risorse Azure che condividono lo stesso ciclo di vita, permessi e policy.

**Resource Token**  
Stringa unica generata da azd per assicurare che i nomi delle risorse siano unici tra i deployment.

**REST API**  
Stile architetturale per progettare applicazioni di rete usando i metodi HTTP.

**Rollback**  
Processo di ritorno a una versione precedente di un'applicazione o della configurazione dell'infrastruttura.

## S

**Service**  
Componente della tua applicazione definito in azure.yaml (ad es., frontend web, backend API, database).

**SKU**  
Stock Keeping Unit. Rappresenta diversi livelli di servizio o prestazioni per le risorse Azure.

**SQL Database**  
Servizio di database relazionale gestito di Azure basato su Microsoft SQL Server.

**Static Web Apps**  
Servizio Azure per costruire e distribuire applicazioni web full-stack a partire da repository di codice sorgente.

**Storage Account**  
Servizio Azure che fornisce storage cloud per oggetti dati inclusi blob, file, queue e tabelle.

**Subscription**  
Contenitore dell'account Azure che ospita resource group e risorse, con fatturazione e gestione degli accessi associati.

## T

**Template**  
Struttura di progetto preconfigurata contenente codice applicativo, definizioni di infrastruttura e configurazione per scenari comuni.

**Terraform**  
Strumento open-source di Infrastructure as Code che supporta più cloud provider incluso Azure.

**Traffic Manager**  
Bilanciatore del traffico basato su DNS di Azure per distribuire il traffico tra regioni Azure globali.

## U

**URI**  
Uniform Resource Identifier. Stringa che identifica una risorsa particolare.

**URL**  
Uniform Resource Locator. Tipo di URI che specifica dove si trova una risorsa e come recuperarla.

## V

**Virtual Network (VNet)**  
Elemento fondamentale per reti private in Azure, che fornisce isolamento e segmentazione.

**VS Code**  
Visual Studio Code. Editor di codice popolare con ottima integrazione per Azure e azd.

## W

**Webhook**  
Callback HTTP attivato da eventi specifici, comunemente usato nelle pipeline CI/CD.

**What-if**  
Funzionalità di Azure che mostra quali modifiche verrebbero apportate da un deployment senza eseguirlo effettivamente.

## Y

**YAML**  
YAML Ain't Markup Language. Standard di serializzazione dati leggibile dall'uomo usato per file di configurazione come azure.yaml.

## Z

**Zone**  
Posizioni fisicamente separate all'interno di una regione Azure che forniscono ridondanza e alta disponibilità.

---

## Acronomi Comuni

| Acronimo | Espansione | Descrizione |
|---------|-----------|-------------|
| AAD | Azure Active Directory (now Microsoft Entra ID) | Servizio di gestione delle identità e degli accessi |
| ACR | Azure Container Registry | Servizio di registro di immagini container |
| AKS | Azure Kubernetes Service | Servizio Kubernetes gestito |
| API | Application Programming Interface | Insieme di protocolli per costruire software |
| ARM | Azure Resource Manager | Servizio di deployment e gestione di Azure |
| CDN | Content Delivery Network | Rete distribuita di server |
| CI/CD | Continuous Integration/Continuous Deployment | Pratiche di sviluppo automatizzate |
| CLI | Command Line Interface | Interfaccia utente testuale |
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
| SQL | Structured Query Language | Linguaggio per gestire database relazionali |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocolli crittografici |
| URI | Uniform Resource Identifier | Stringa che identifica una risorsa |
| URL | Uniform Resource Locator | Tipo di URI che specifica la posizione della risorsa |
| VM | Virtual Machine | Emulazione di un sistema informatico |
| VNet | Virtual Network | Rete privata in Azure |
| YAML | YAML Ain't Markup Language | Standard di serializzazione dati |

---

## Mappature dei Nomi dei Servizi Azure

| Nome Comune | Nome Ufficiale del Servizio Azure | Tipo host azd |
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
| Search | Azure AI Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Termini Specifici per il Contesto

### Termini di Sviluppo
- **Hot Reload**: Aggiornamento automatico delle applicazioni durante lo sviluppo senza riavvio
- **Build Pipeline**: Processo automatizzato per costruire e testare il codice
- **Deployment Slot**: Ambiente di staging all'interno di un App Service
- **Environment Parity**: Mantenere ambienti di sviluppo, staging e produzione simili

### Termini di Sicurezza
- **Managed Identity**: Funzionalità di Azure che fornisce la gestione automatica delle credenziali
- **Key Vault**: Archiviazione sicura per segreti, chiavi e certificati
- **RBAC**: Controllo degli accessi basato sui ruoli per le risorse Azure
- **Network Security Group**: Firewall virtuale per controllare il traffico di rete

### Termini di Monitoraggio
- **Telemetry**: Raccolta automatizzata di misure e dati
- **Application Performance Monitoring (APM)**: Monitoraggio delle prestazioni del software
- **Log Analytics**: Servizio per raccogliere e analizzare i dati di log
- **Alert Rules**: Notifiche automatiche basate su metriche o condizioni

### Termini di Deployment
- **Blue-Green Deployment**: Strategia di deployment a zero-downtime
- **Canary Deployment**: Rilascio graduale a una sottosezione di utenti
- **Rolling Update**: Sostituzione sequenziale delle istanze applicative
- **Rollback**: Ritorno a una versione precedente dell'applicazione

---

**Suggerimento d'uso**: Usa `Ctrl+F` per cercare rapidamente termini specifici in questo glossario. I termini sono incrociati dove applicabile.

---

**Navigazione**
- **Lezione precedente**: [Cheat Sheet](cheat-sheet.md)
- **Lezione successiva**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->