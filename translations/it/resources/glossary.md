# Glossario - Terminologia di Azure e AZD

**Riferimento per tutti i capitoli**
- **📚 Home del Corso**: [AZD per Principianti](../README.md)
- **📖 Impara le Basi**: [Capitolo 1: Nozioni di base AZD](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 Termini AI**: [Capitolo 2: Sviluppo AI-First](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduzione

Questo glossario completo fornisce definizioni per termini, concetti e acronimi usati in Azure Developer CLI e nello sviluppo cloud Azure. Riferimento essenziale per comprendere la documentazione tecnica, risolvere problemi e comunicare efficacemente sui progetti azd e i servizi Azure.

## Obiettivi di Apprendimento

Usando questo glossario, potrai:
- Comprendere la terminologia e i concetti essenziali di Azure Developer CLI
- Padroneggiare il vocabolario e i termini tecnici dello sviluppo cloud Azure
- Fare riferimento efficacemente alla terminologia di Infrastructure as Code e deployment
- Comprendere i nomi dei servizi Azure, gli acronimi e i loro scopi
- Accedere alle definizioni per la terminologia di troubleshooting e debugging
- Apprendere concetti avanzati di architettura e sviluppo Azure

## Risultati di Apprendimento

Consultando regolarmente questo glossario, sarai in grado di:
- Comunicare efficacemente usando la terminologia corretta di Azure Developer CLI
- Comprendere più chiaramente la documentazione tecnica e i messaggi di errore
- Navigare nei servizi e concetti Azure con fiducia
- Risolvere problemi usando il vocabolario tecnico appropriato
- Contribuire alle discussioni di team con un linguaggio tecnico preciso
- Ampliare sistematicamente le tue conoscenze nello sviluppo cloud Azure

## A

**ARM Template**  
Template Azure Resource Manager. Formato Infrastructure as Code basato su JSON usato per definire e distribuire risorse Azure in modo dichiarativo.

**App Service**  
Offerta platform-as-a-service (PaaS) di Azure per ospitare applicazioni web, API REST e backend mobile senza gestire l'infrastruttura.

**Application Insights**  
Servizio Azure di monitoraggio delle prestazioni delle applicazioni (APM) che fornisce approfondimenti dettagliati su performance, disponibilità e utilizzo.

**Azure CLI**  
Interfaccia a linea di comando per gestire risorse Azure. Complementare ad AZD ma con login separato; l'autenticazione principale di AZD usa `azd auth login`.

**Azure Developer CLI (azd)**  
Strumento da linea di comando orientato agli sviluppatori che accelera il processo di creazione e distribuzione di applicazioni su Azure usando template e Infrastructure as Code.

**azure.yaml**  
File di configurazione principale di un progetto azd che definisce servizi, infrastruttura e hook di deployment.

**Azure Resource Manager (ARM)**  
Servizio di Azure per il deployment e la gestione che fornisce uno strato di gestione per creare, aggiornare ed eliminare risorse.

## B

**Bicep**  
Linguaggio specifico di dominio (DSL) sviluppato da Microsoft per il deployment di risorse Azure. Offre una sintassi più semplice rispetto ai template ARM pur compilando in ARM.

**Build**  
Processo di compilazione del codice sorgente, installazione delle dipendenze e preparazione delle applicazioni per il deployment.

**Blue-Green Deployment**  
Strategia di deployment che utilizza due ambienti di produzione identici (blu e verde) per minimizzare downtime e rischi.

## C

**Container Apps**  
Servizio container serverless di Azure che consente di eseguire applicazioni containerizzate senza gestire infrastrutture complesse.

**CI/CD**  
Continuous Integration/Continuous Deployment. Pratiche automatizzate per integrare modifiche al codice e distribuire applicazioni.

**Cosmos DB**  
Servizio database multimodello, distribuito globalmente di Azure che offre SLA completi per throughput, latenza, disponibilità e consistenza.

**Configuration**  
Impostazioni e parametri che controllano il comportamento dell'applicazione e le opzioni di deployment.

## D

**Deployment**  
Processo di installazione e configurazione delle applicazioni e delle relative dipendenze sull'infrastruttura di destinazione.

**Docker**  
Piattaforma per sviluppare, distribuire ed eseguire applicazioni usando la tecnologia di containerizzazione.

**Dockerfile**  
File di testo contenente istruzioni per costruire un'immagine container Docker.

## E

**Environment**  
Un target di deployment che rappresenta un'istanza specifica della tua applicazione (es. sviluppo, staging, produzione).

**Environment Variables**  
Valori di configurazione memorizzati come coppie chiave-valore accessibili dall'applicazione a runtime.

**Endpoint**  
URL o indirizzo di rete a cui un'applicazione o servizio può essere raggiunto.

## F

**Function App**  
Servizio compute serverless di Azure che consente di eseguire codice event-driven senza gestire l'infrastruttura.

## G

**GitHub Actions**  
Piattaforma CI/CD integrata con repository GitHub per automatizzare workflow.

**Git**  
Sistema di controllo versione distribuito usato per tracciare le modifiche nel codice sorgente.

## H

**Hooks**  
Script o comandi personalizzati che si eseguono in punti specifici del ciclo di vita del deployment (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Tipo di servizio Azure dove un'applicazione sarà distribuita (es. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Pratica di definire e gestire l'infrastruttura tramite codice invece di processi manuali.

**Init**  
Processo di inizializzazione di un nuovo progetto azd, tipicamente da un template.

## J

**JSON**  
JavaScript Object Notation. Formato di scambio dati comunemente usato per file di configurazione e risposte API.

**JWT**  
JSON Web Token. Standard per trasmettere informazioni in modo sicuro tra parti come oggetto JSON.

## K

**Key Vault**  
Servizio di Azure per archiviare e gestire in sicurezza segreti, chiavi e certificati.

**Kusto Query Language (KQL)**  
Linguaggio di query usato per analizzare dati in Azure Monitor, Application Insights e altri servizi Azure.

## L

**Load Balancer**  
Servizio che distribuisce il traffico di rete in ingresso su più server o istanze.

**Log Analytics**  
Servizio Azure per raccogliere, analizzare e agire su dati telemetrici da ambienti cloud e on-premises.

## M

**Managed Identity**  
Funzionalità Azure che fornisce ai servizi Azure un'identità gestita automaticamente per l'autenticazione verso altri servizi.

**Microservices**  
Approccio architetturale dove le applicazioni sono costruite come una collezione di piccoli servizi indipendenti.

**Monitor**  
Soluzione di monitoraggio unificato di Azure che fornisce osservabilità completa su applicazioni e infrastruttura.

## N

**Node.js**  
Runtime JavaScript basato sul motore V8 di Chrome per costruire applicazioni lato server.

**npm**  
Gestore di pacchetti per Node.js che gestisce dipendenze e pacchetti.

## O

**Output**  
Valori restituiti dal deployment dell'infrastruttura che possono essere usati da applicazioni o altre risorse.

## P

**Package**  
Processo di preparazione del codice applicativo e delle dipendenze per il deployment.

**Parameters**  
Valori di input passati ai template di infrastruttura per personalizzare i deployment.

**PostgreSQL**  
Sistema di database relazionale open-source supportato come servizio gestito su Azure.

**Provisioning**  
Processo di creazione e configurazione delle risorse Azure definite nei template di infrastruttura.

## Q

**Quota**  
Limiti sulla quantità di risorse che possono essere create in un abbonamento o regione Azure.

## R

**Resource Group**  
Contenitore logico per risorse Azure che condividono lo stesso ciclo di vita, permessi e policy.

**Resource Token**  
Stringa univoca generata da azd per assicurare nomi risorsa unici tra i deployment.

**REST API**  
Stile architetturale per progettare applicazioni in rete usando metodi HTTP.

**Rollback**  
Processo di ripristino a una versione precedente di un'applicazione o configurazione infrastrutturale.

## S

**Service**  
Componente della tua applicazione definito in azure.yaml (es. frontend web, backend API, database).

**SKU**  
Stock Keeping Unit. Rappresenta diversi livelli di servizio o prestazioni per risorse Azure.

**SQL Database**  
Servizio di database relazionale gestito di Azure basato su Microsoft SQL Server.

**Static Web Apps**  
Servizio Azure per costruire e distribuire applicazioni web full-stack da repository di codice sorgente.

**Storage Account**  
Servizio Azure che fornisce storage cloud per oggetti dati inclusi blob, file, code e tabelle.

**Subscription**  
Contenitore di account Azure che contiene resource group e risorse, con relativa gestione di fatturazione e accesso.

## T

**Template**  
Struttura di progetto pre-costruita contenente codice applicativo, definizioni infrastrutturali e configurazione per scenari comuni.

**Terraform**  
Strumento open-source Infrastructure as Code che supporta diversi provider cloud incluso Azure.

**Traffic Manager**  
Bilanciatore di carico DNS-based di Azure per distribuire traffico tra regioni Azure globali.

## U

**URI**  
Uniform Resource Identifier. Stringa che identifica una risorsa particolare.

**URL**  
Uniform Resource Locator. Tipo di URI che specifica dove si trova una risorsa e come recuperarla.

## V

**Virtual Network (VNet)**  
Blocchi fondamentali per reti private in Azure, fornendo isolamento e segmentazione.

**VS Code**  
Visual Studio Code. Editor di codice popolare con eccellente integrazione Azure e azd.

## W

**Webhook**  
Callback HTTP attivato da eventi specifici, comunemente usato in pipeline CI/CD.

**What-if**  
Funzionalità Azure che mostra quali cambiamenti verrebbero fatti da un deployment senza eseguirlo realmente.

## Y

**YAML**  
YAML Ain't Markup Language. Standard di serializzazione dati leggibile dall'uomo usato per file di configurazione come azure.yaml.

## Z

**Zone**  
Posizioni fisicamente separate all'interno di una regione Azure che forniscono ridondanza e alta disponibilità.

---

## Acronimi comuni

| Acronym | Forma Estesa | Descrizione |
|---------|-----------|-------------|
| AAD | Azure Active Directory (ora Microsoft Entra ID) | Servizio di gestione identità e accesso |
| ACR | Azure Container Registry | Servizio di registry per immagini container |
| AKS | Azure Kubernetes Service | Servizio Kubernetes gestito |
| API | Application Programming Interface | Insieme di protocolli per costruire software |
| ARM | Azure Resource Manager | Servizio di deployment e gestione Azure |
| CDN | Content Delivery Network | Rete distribuita di server |
| CI/CD | Continuous Integration/Continuous Deployment | Pratiche di sviluppo automatizzate |
| CLI | Command Line Interface | Interfaccia utente basata su testo |
| DNS | Domain Name System | Sistema per tradurre nomi dominio in indirizzi IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versione sicura di HTTP |
| IaC | Infrastructure as Code | Gestione infrastruttura tramite codice |
| JSON | JavaScript Object Notation | Formato di scambio dati |
| JWT | JSON Web Token | Formato token per trasmissione dati sicura |
| KQL | Kusto Query Language | Linguaggio di query per servizi dati Azure |
| RBAC | Role-Based Access Control | Metodo di controllo accessi basato su ruoli utente |
| REST | Representational State Transfer | Stile architetturale per servizi web |
| SDK | Software Development Kit | Collezione di strumenti di sviluppo |
| SLA | Service Level Agreement | Impegno su disponibilità/prestazioni servizio |
| SQL | Structured Query Language | Linguaggio per gestire database relazionali |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocolli crittografici |
| URI | Uniform Resource Identifier | Stringa che identifica una risorsa |
| URL | Uniform Resource Locator | Tipo di URI che specifica posizione risorsa |
| VM | Virtual Machine | Emulazione di un sistema computerizzato |
| VNet | Virtual Network | Rete privata in Azure |
| YAML | YAML Ain't Markup Language | Standard di serializzazione dati |

---

## Mappature nomi servizi Azure

| Nome Comune | Nome Ufficiale Servizio Azure | Tipo Host azd |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | Risorsa infrastrutturale, non un'applicazione `host` |
| NoSQL DB | Azure Cosmos DB | Risorsa infrastrutturale, non un'applicazione `host` |
| Storage | Azure Storage Account | Risorsa infrastrutturale, non applicazione integrata `host` |
| Cache | Azure Managed Redis | Risorsa infrastrutturale, non un'applicazione `host` |
| Search | Azure AI Search | Risorsa infrastrutturale, non un'applicazione `host` |
| Messaging | Azure Service Bus | Risorsa infrastrutturale, non un'applicazione `host` |

`services.<name>.host` seleziona un target di deployment applicativo; non è una abbreviazione per alcun tipo di risorsa Azure. Database, cache, servizi di ricerca e code sono normalmente provisionati tramite il provider di infrastruttura e collegati all'applicazione tramite output/configurazione.

---

## Termini specifici per contesto

### Termini di sviluppo
- **Hot Reload**: Aggiornamento automatico delle applicazioni durante lo sviluppo senza riavvio
- **Build Pipeline**: Processo automatizzato per la build e il test del codice
- **Deployment Slot**: Ambiente di staging all'interno di un App Service
- **Environment Parity**: Mantenere ambienti sviluppo, staging e produzione simili

### Termini di sicurezza
- **Managed Identity**: Funzionalità Azure che fornisce gestione automatica delle credenziali
- **Key Vault**: Archiviazione sicura per segreti, chiavi e certificati
- **RBAC**: Controllo accessi basato sui ruoli per risorse Azure
- **Network Security Group**: Firewall virtuale per controllare il traffico di rete

### Termini di monitoraggio
- **Telemetry**: Raccolta automatizzata di misurazioni e dati
- **Application Performance Monitoring (APM)**: Monitoraggio delle prestazioni software
- **Log Analytics**: Servizio per la raccolta e analisi dei dati di log
- **Alert Rules**: Notifiche automatiche basate su metriche o condizioni

### Termini di deployment
- **Blue-Green Deployment**: Strategia di deployment senza downtime
- **Canary Deployment**: Rilascio graduale a un sottoinsieme di utenti
- **Rolling Update**: Sostituzione sequenziale delle istanze applicative
- **Rollback**: Ripristino a una versione precedente dell'applicazione

---

**Suggerimento d'Uso**: Usa `Ctrl+F` per cercare rapidamente termini specifici in questo glossario. I termini sono collegati tra loro dove applicabile.

---

**Navigazione**
- **Lezione Precedente**: [Cheat Sheet](cheat-sheet.md)
- **Lezione Successiva**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->