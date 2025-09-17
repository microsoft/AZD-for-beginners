<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f16d2988a24670d1b6aa2372de1a231a",
  "translation_date": "2025-09-17T21:48:24+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "it"
}
-->
# Glossario - Terminologia di Azure e AZD

**Riferimento per Tutti i Capitoli**  
- **📚 Home del Corso**: [AZD Per Principianti](../README.md)  
- **📖 Impara le Basi**: [Capitolo 1: Fondamenti di AZD](../docs/getting-started/azd-basics.md)  
- **🤖 Termini AI**: [Capitolo 2: Sviluppo AI-First](../docs/ai-foundry/azure-ai-foundry-integration.md)  

## Introduzione

Questo glossario completo fornisce definizioni per termini, concetti e acronimi utilizzati nella CLI per Sviluppatori Azure e nello sviluppo cloud di Azure. È un riferimento essenziale per comprendere la documentazione tecnica, risolvere problemi e comunicare efficacemente sui progetti azd e sui servizi Azure.

## Obiettivi di Apprendimento

Utilizzando questo glossario, potrai:  
- Comprendere la terminologia e i concetti essenziali della CLI per Sviluppatori Azure  
- Padroneggiare il vocabolario e i termini tecnici dello sviluppo cloud di Azure  
- Fare riferimento in modo efficiente alla terminologia di Infrastructure as Code e di distribuzione  
- Comprendere i nomi dei servizi Azure, gli acronimi e i loro scopi  
- Accedere a definizioni per la risoluzione dei problemi e il debug  
- Apprendere concetti avanzati di architettura e sviluppo su Azure  

## Risultati di Apprendimento

Con un riferimento regolare a questo glossario, sarai in grado di:  
- Comunicare efficacemente utilizzando la terminologia corretta della CLI per Sviluppatori Azure  
- Comprendere più chiaramente la documentazione tecnica e i messaggi di errore  
- Navigare con sicurezza tra i servizi e i concetti di Azure  
- Risolvere problemi utilizzando il vocabolario tecnico appropriato  
- Contribuire alle discussioni di team con un linguaggio tecnico accurato  
- Espandere sistematicamente le tue conoscenze sullo sviluppo cloud di Azure  

## A

**ARM Template**  
Modello di Azure Resource Manager. Formato JSON per Infrastructure as Code utilizzato per definire e distribuire risorse Azure in modo dichiarativo.

**App Service**  
Offerta PaaS (Platform-as-a-Service) di Azure per ospitare applicazioni web, API REST e backend per dispositivi mobili senza gestire l'infrastruttura.

**Application Insights**  
Servizio APM (Application Performance Monitoring) di Azure che fornisce approfondimenti sulle prestazioni, disponibilità e utilizzo delle applicazioni.

**Azure CLI**  
Interfaccia a riga di comando per gestire le risorse Azure. Utilizzata da azd per l'autenticazione e alcune operazioni.

**Azure Developer CLI (azd)**  
Strumento a riga di comando orientato agli sviluppatori che accelera il processo di creazione e distribuzione di applicazioni su Azure utilizzando modelli e Infrastructure as Code.

**azure.yaml**  
File di configurazione principale per un progetto azd che definisce servizi, infrastruttura e hook di distribuzione.

**Azure Resource Manager (ARM)**  
Servizio di distribuzione e gestione di Azure che fornisce un livello di gestione per creare, aggiornare ed eliminare risorse.

## B

**Bicep**  
Linguaggio specifico di dominio (DSL) sviluppato da Microsoft per distribuire risorse Azure. Offre una sintassi più semplice rispetto ai modelli ARM, compilando comunque in ARM.

**Build**  
Processo di compilazione del codice sorgente, installazione delle dipendenze e preparazione delle applicazioni per la distribuzione.

**Blue-Green Deployment**  
Strategia di distribuzione che utilizza due ambienti di produzione identici (blue e green) per ridurre al minimo i tempi di inattività e i rischi.

## C

**Container Apps**  
Servizio serverless di Azure per eseguire applicazioni containerizzate senza gestire infrastrutture complesse.

**CI/CD**  
Integrazione Continua/Distribuzione Continua. Pratiche automatizzate per integrare modifiche al codice e distribuire applicazioni.

**Cosmos DB**  
Servizio di database multi-modello distribuito globalmente di Azure che offre SLA completi per throughput, latenza, disponibilità e coerenza.

**Configuration**  
Impostazioni e parametri che controllano il comportamento delle applicazioni e le opzioni di distribuzione.

## D

**Deployment**  
Processo di installazione e configurazione di applicazioni e delle loro dipendenze sull'infrastruttura di destinazione.

**Docker**  
Piattaforma per sviluppare, distribuire ed eseguire applicazioni utilizzando la tecnologia di containerizzazione.

**Dockerfile**  
File di testo contenente istruzioni per creare un'immagine container Docker.

## E

**Environment**  
Target di distribuzione che rappresenta un'istanza specifica della tua applicazione (es. sviluppo, staging, produzione).

**Environment Variables**  
Valori di configurazione memorizzati come coppie chiave-valore a cui le applicazioni possono accedere in fase di esecuzione.

**Endpoint**  
URL o indirizzo di rete dove un'applicazione o un servizio può essere accessibile.

## F

**Function App**  
Servizio di calcolo serverless di Azure che consente di eseguire codice basato su eventi senza gestire l'infrastruttura.

## G

**GitHub Actions**  
Piattaforma CI/CD integrata con i repository GitHub per automatizzare i flussi di lavoro.

**Git**  
Sistema di controllo di versione distribuito utilizzato per tracciare le modifiche al codice sorgente.

## H

**Hooks**  
Script o comandi personalizzati che vengono eseguiti in punti specifici durante il ciclo di vita della distribuzione (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Tipo di servizio Azure dove un'applicazione verrà distribuita (es. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Pratica di definire e gestire l'infrastruttura tramite codice anziché processi manuali.

**Init**  
Processo di inizializzazione di un nuovo progetto azd, tipicamente da un modello.

## J

**JSON**  
JavaScript Object Notation. Formato di interscambio dati comunemente utilizzato per file di configurazione e risposte API.

**JWT**  
JSON Web Token. Standard per trasmettere informazioni in modo sicuro tra le parti come oggetto JSON.

## K

**Key Vault**  
Servizio di Azure per archiviare e gestire in modo sicuro segreti, chiavi e certificati.

**Kusto Query Language (KQL)**  
Linguaggio di query utilizzato per analizzare dati in Azure Monitor, Application Insights e altri servizi Azure.

## L

**Load Balancer**  
Servizio che distribuisce il traffico di rete in entrata su più server o istanze.

**Log Analytics**  
Servizio Azure per raccogliere, analizzare e agire sui dati di telemetria da ambienti cloud e on-premises.

## M

**Managed Identity**  
Funzionalità di Azure che fornisce ai servizi Azure un'identità gestita automaticamente per autenticarsi con altri servizi Azure.

**Microservices**  
Approccio architetturale in cui le applicazioni sono costruite come una raccolta di piccoli servizi indipendenti.

**Monitor**  
Soluzione di monitoraggio unificata di Azure che offre osservabilità completa su applicazioni e infrastruttura.

## N

**Node.js**  
Runtime JavaScript basato sul motore V8 di Chrome per creare applicazioni lato server.

**npm**  
Gestore di pacchetti per Node.js che gestisce dipendenze e pacchetti.

## O

**Output**  
Valori restituiti dalla distribuzione dell'infrastruttura che possono essere utilizzati da applicazioni o altre risorse.

## P

**Package**  
Processo di preparazione del codice applicativo e delle dipendenze per la distribuzione.

**Parameters**  
Valori di input passati ai modelli di infrastruttura per personalizzare le distribuzioni.

**PostgreSQL**  
Sistema di database relazionale open-source supportato come servizio gestito in Azure.

**Provisioning**  
Processo di creazione e configurazione delle risorse Azure definite nei modelli di infrastruttura.

## Q

**Quota**  
Limiti sulla quantità di risorse che possono essere create in una sottoscrizione o regione Azure.

## R

**Resource Group**  
Contenitore logico per risorse Azure che condividono lo stesso ciclo di vita, permessi e politiche.

**Resource Token**  
Stringa unica generata da azd per garantire che i nomi delle risorse siano univoci tra le distribuzioni.

**REST API**  
Stile architetturale per progettare applicazioni di rete utilizzando metodi HTTP.

**Rollback**  
Processo di ripristino a una versione precedente di un'applicazione o configurazione dell'infrastruttura.

## S

**Service**  
Componente della tua applicazione definito in azure.yaml (es. frontend web, backend API, database).

**SKU**  
Stock Keeping Unit. Rappresenta diversi livelli di servizio o prestazioni per le risorse Azure.

**SQL Database**  
Servizio di database relazionale gestito di Azure basato su Microsoft SQL Server.

**Static Web Apps**  
Servizio Azure per creare e distribuire applicazioni web full-stack dai repository di codice sorgente.

**Storage Account**  
Servizio Azure che fornisce archiviazione cloud per oggetti dati inclusi blob, file, code e tabelle.

**Subscription**  
Contenitore dell'account Azure che ospita gruppi di risorse e risorse, con gestione associata di fatturazione e accesso.

## T

**Template**  
Struttura predefinita del progetto contenente codice applicativo, definizioni di infrastruttura e configurazione per scenari comuni.

**Terraform**  
Strumento open-source per Infrastructure as Code che supporta più provider cloud, incluso Azure.

**Traffic Manager**  
Bilanciatore di carico basato su DNS di Azure per distribuire il traffico tra regioni globali di Azure.

## U

**URI**  
Uniform Resource Identifier. Stringa che identifica una risorsa particolare.

**URL**  
Uniform Resource Locator. Tipo di URI che specifica dove si trova una risorsa e come recuperarla.

## V

**Virtual Network (VNet)**  
Blocco fondamentale per reti private in Azure, che fornisce isolamento e segmentazione.

**VS Code**  
Visual Studio Code. Editor di codice popolare con eccellente integrazione con Azure e azd.

## W

**Webhook**  
Callback HTTP attivato da eventi specifici, comunemente utilizzato nei pipeline CI/CD.

**What-if**  
Funzionalità di Azure che mostra quali modifiche verrebbero apportate da una distribuzione senza eseguirla effettivamente.

## Y

**YAML**  
YAML Ain't Markup Language. Standard di serializzazione dei dati leggibile dall'uomo utilizzato per file di configurazione come azure.yaml.

## Z

**Zone**  
Posizioni fisicamente separate all'interno di una regione Azure che forniscono ridondanza e alta disponibilità.

---

## Acronomi Comuni

| Acronimo | Forma Completa | Descrizione |
|---------|----------------|-------------|
| AAD | Azure Active Directory | Servizio di gestione delle identità e degli accessi |
| ACR | Azure Container Registry | Servizio di registro immagini container |
| AKS | Azure Kubernetes Service | Servizio Kubernetes gestito |
| API | Application Programming Interface | Set di protocolli per costruire software |
| ARM | Azure Resource Manager | Servizio di distribuzione e gestione di Azure |
| CDN | Content Delivery Network | Rete distribuita di server |
| CI/CD | Continuous Integration/Continuous Deployment | Pratiche di sviluppo automatizzate |
| CLI | Command Line Interface | Interfaccia utente basata su testo |
| DNS | Domain Name System | Sistema per tradurre nomi di dominio in indirizzi IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versione sicura di HTTP |
| IaC | Infrastructure as Code | Gestione dell'infrastruttura tramite codice |
| JSON | JavaScript Object Notation | Formato di interscambio dati |
| JWT | JSON Web Token | Formato di token per trasmissione sicura delle informazioni |
| KQL | Kusto Query Language | Linguaggio di query per servizi dati Azure |
| RBAC | Role-Based Access Control | Metodo di controllo accessi basato su ruoli |
| REST | Representational State Transfer | Stile architetturale per servizi web |
| SDK | Software Development Kit | Collezione di strumenti di sviluppo |
| SLA | Service Level Agreement | Impegno sulla disponibilità/prestazioni del servizio |
| SQL | Structured Query Language | Linguaggio per gestire database relazionali |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocolli crittografici |
| URI | Uniform Resource Identifier | Stringa che identifica una risorsa |
| URL | Uniform Resource Locator | Tipo di URI che specifica la posizione di una risorsa |
| VM | Virtual Machine | Emulazione di un sistema informatico |
| VNet | Virtual Network | Rete privata in Azure |
| YAML | YAML Ain't Markup Language | Standard di serializzazione dei dati |

---

## Mappature dei Nomi dei Servizi Azure

| Nome Comune | Nome Ufficiale del Servizio Azure | Tipo di Host azd |
|-------------|-----------------------------------|------------------|
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

## Termini Specifici al Contesto

### Termini di Sviluppo
- **Hot Reload**: Aggiornamento automatico delle applicazioni durante lo sviluppo senza riavvio  
- **Build Pipeline**: Processo automatizzato per costruire e testare il codice  
- **Deployment Slot**: Ambiente di staging all'interno di un App Service  
- **Environment Parity**: Mantenere simili gli ambienti di sviluppo, staging e produzione  

### Termini di Sicurezza
- **Managed Identity**: Funzionalità di Azure che fornisce gestione automatica delle credenziali  
- **Key Vault**: Archiviazione sicura per segreti, chiavi e certificati  
- **RBAC**: Controllo degli accessi basato sui ruoli per le risorse Azure  
- **Network Security Group**: Firewall virtuale per controllare il traffico di rete  

### Termini di Monitoraggio
- **Telemetry**: Raccolta automatizzata di misurazioni e dati  
- **Application Performance Monitoring (APM)**: Monitoraggio delle prestazioni del software  
- **Log Analytics**: Servizio per raccogliere e analizzare dati di log  
- **Alert Rules**: Notifiche automatiche basate su metriche o condizioni  

### Termini di Distribuzione
- **Blue-Green Deployment**: Strategia di distribuzione senza downtime  
- **Canary Deployment**: Rilascio graduale a un sottoinsieme di utenti  
- **Rolling Update**: Sostituzione sequenziale delle istanze dell'applicazione  
- **Rollback**: Ripristino a una versione precedente dell'applicazione  

---

**Suggerimento d'Uso**: Usa `Ctrl+F` per cercare rapidamente termini specifici in questo glossario. I termini sono collegati tra loro dove applicabile.

---

**Navigazione**  
- **Lezione Precedente**: [Cheat Sheet](cheat-sheet.md)  
- **Lezione Successiva**: [FAQ](faq.md)  

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.