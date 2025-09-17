<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-17T21:43:27+00:00",
  "source_file": "examples/README.md",
  "language_code": "it"
}
-->
# Esempi - Template e Configurazioni Pratiche AZD

**Imparare con gli Esempi - Organizzati per Capitolo**
- **📚 Home del Corso**: [AZD Per Principianti](../README.md)
- **📖 Mappatura dei Capitoli**: Esempi organizzati per complessità di apprendimento
- **🚀 Inizia Semplice**: [Esempi Capitolo 1](../../../examples)
- **🤖 Esempi AI**: [Capitoli 2 & 5 Soluzioni AI](../../../examples)

## Introduzione

Questa directory contiene esempi pratici, template e scenari reali per aiutarti a imparare Azure Developer CLI attraverso la pratica. Ogni esempio fornisce codice funzionante completo, template per l'infrastruttura e istruzioni dettagliate per diverse architetture applicative e modelli di distribuzione.

## Obiettivi di Apprendimento

Lavorando su questi esempi, potrai:
- Praticare i flussi di lavoro di Azure Developer CLI con scenari applicativi realistici
- Comprendere diverse architetture applicative e le loro implementazioni con azd
- Padroneggiare i modelli di Infrastructure as Code per vari servizi Azure
- Applicare strategie di gestione della configurazione e distribuzione specifiche per ambiente
- Implementare modelli di monitoraggio, sicurezza e scalabilità in contesti pratici
- Acquisire esperienza nel risolvere problemi e fare debug di scenari di distribuzione reali

## Risultati di Apprendimento

Completando questi esempi, sarai in grado di:
- Distribuire con sicurezza diversi tipi di applicazioni utilizzando Azure Developer CLI
- Adattare i template forniti alle tue esigenze applicative
- Progettare e implementare modelli di infrastruttura personalizzati utilizzando Bicep
- Configurare applicazioni multi-servizio complesse con dipendenze adeguate
- Applicare best practice di sicurezza, monitoraggio e prestazioni in scenari reali
- Risolvere problemi e ottimizzare le distribuzioni basandoti sull'esperienza pratica

## Struttura della Directory

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Esempi di Inizio Rapido

### Per Principianti
1. **[App Web Semplice - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Distribuisci un'applicazione web Node.js Express con MongoDB
2. **[Sito Statico - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Ospita un sito statico React con Azure Static Web Apps
3. **[App Containerizzata - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Distribuisci un'applicazione Python Flask containerizzata

### Per Utenti Intermedi
4. **[App con Database - C# con Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Applicazione web con API C# e database Azure SQL
5. **[Funzione Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Funzioni Azure Python con trigger HTTP e Cosmos DB
6. **[Microservizi - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Applicazione Java multi-servizio con Container Apps e API gateway

### Template Azure AI Foundry

1. **[App Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Applicazione di chat intelligente con Azure OpenAI
2. **[Elaborazione Documenti AI](https://github.com/Azure-Samples/azure-ai-document-processing)** - Analisi documenti utilizzando i servizi Azure AI
3. **[Pipeline di Machine Learning](https://github.com/Azure-Samples/mlops-v2)** - Workflow MLOps con Azure Machine Learning

### Scenari Reali

#### **Soluzione Multi-Agente per il Retail** 🆕
**[Guida Completa all'Implementazione](./retail-scenario.md)**

Una soluzione multi-agente per il supporto clienti pronta per la produzione, che dimostra la distribuzione di applicazioni AI di livello enterprise con AZD. Questo scenario include:

- **Architettura Completa**: Sistema multi-agente con agenti specializzati per il servizio clienti e la gestione dell'inventario
- **Infrastruttura di Produzione**: Distribuzioni multi-regione di Azure OpenAI, AI Search, Container Apps e monitoraggio completo
- **Template ARM Pronto per la Distribuzione**: Distribuzione con un clic con modalità di configurazione multiple (Minimale/Standard/Premium)
- **Funzionalità Avanzate**: Validazione della sicurezza (red teaming), framework di valutazione degli agenti, ottimizzazione dei costi e guide per la risoluzione dei problemi
- **Contesto Aziendale Reale**: Caso d'uso per il supporto clienti di un rivenditore con caricamento file, integrazione di ricerca e scalabilità dinamica

**Tecnologie**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complessità**: ⭐⭐⭐⭐ (Avanzato - Pronto per la Produzione)

**Ideale per**: Sviluppatori AI, architetti di soluzioni e team che costruiscono sistemi multi-agente di produzione

**Inizio Rapido**: Distribuisci la soluzione completa in meno di 30 minuti utilizzando il template ARM incluso con `./deploy.sh -g myResourceGroup`

## 📋 Istruzioni per l'Uso

### Esecuzione degli Esempi in Locale

1. **Clona o Copia l'Esempio**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inizializza l'Ambiente AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Configura l'Ambiente**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Distribuisci**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Adattamento degli Esempi

Ogni esempio include:
- **README.md** - Istruzioni dettagliate per il setup e la personalizzazione
- **azure.yaml** - Configurazione AZD con commenti
- **infra/** - Template Bicep con spiegazioni sui parametri
- **src/** - Codice applicativo di esempio
- **scripts/** - Script di supporto per attività comuni

## 🎯 Obiettivi di Apprendimento

### Categorie di Esempi

#### **Distribuzioni Base**
- Applicazioni a servizio singolo
- Modelli di infrastruttura semplici
- Gestione di configurazioni di base
- Setup di sviluppo economici

#### **Scenari Avanzati**
- Architetture multi-servizio
- Configurazioni di rete complesse
- Modelli di integrazione con database
- Implementazioni di sicurezza e conformità

#### **Modelli Pronti per la Produzione**
- Configurazioni ad alta disponibilità
- Monitoraggio e osservabilità
- Integrazione CI/CD
- Setup per il ripristino di emergenza

## 📖 Descrizioni degli Esempi

### App Web Semplice - Node.js Express
**Tecnologie**: Node.js, Express, MongoDB, Container Apps  
**Complessità**: Principiante  
**Concetti**: Distribuzione base, REST API, integrazione con database NoSQL

### Sito Statico - React SPA
**Tecnologie**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complessità**: Principiante  
**Concetti**: Hosting statico, backend serverless, sviluppo web moderno

### App Containerizzata - Python Flask
**Tecnologie**: Python Flask, Docker, Container Apps, Container Registry  
**Complessità**: Principiante  
**Concetti**: Containerizzazione, architettura a microservizi, sviluppo API

### App con Database - C# con Azure SQL
**Tecnologie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complessità**: Intermedio  
**Concetti**: Entity Framework, connessioni al database, sviluppo API web

### Funzione Serverless - Python Azure Functions
**Tecnologie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complessità**: Intermedio  
**Concetti**: Architettura event-driven, calcolo serverless, sviluppo full-stack

### Microservizi - Java Spring Boot
**Tecnologie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complessità**: Intermedio  
**Concetti**: Comunicazione tra microservizi, sistemi distribuiti, modelli enterprise

### Esempi Azure AI Foundry

#### App Chat Azure OpenAI
**Tecnologie**: Azure OpenAI, Cognitive Search, App Service  
**Complessità**: Intermedio  
**Concetti**: Architettura RAG, ricerca vettoriale, integrazione LLM

#### Elaborazione Documenti AI
**Tecnologie**: Azure AI Document Intelligence, Storage, Functions  
**Complessità**: Intermedio  
**Concetti**: Analisi documenti, OCR, estrazione dati

#### Pipeline di Machine Learning
**Tecnologie**: Azure ML, MLOps, Container Registry  
**Complessità**: Avanzato  
**Concetti**: Addestramento modelli, pipeline di distribuzione, monitoraggio

## 🛠 Esempi di Configurazione

La directory `configurations/` contiene componenti riutilizzabili:

### Configurazioni di Ambiente
- Impostazioni per l'ambiente di sviluppo
- Configurazioni per l'ambiente di staging
- Configurazioni pronte per la produzione
- Setup per distribuzioni multi-regione

### Moduli Bicep
- Componenti infrastrutturali riutilizzabili
- Modelli di risorse comuni
- Template con sicurezza rafforzata
- Configurazioni ottimizzate per i costi

### Script di Supporto
- Automazione del setup dell'ambiente
- Script per la migrazione del database
- Strumenti di validazione della distribuzione
- Utility per il monitoraggio dei costi

## 🔧 Guida alla Personalizzazione

### Adattare gli Esempi alle Tue Esigenze

1. **Rivedi i Prerequisiti**
   - Controlla i requisiti dei servizi Azure
   - Verifica i limiti della sottoscrizione
   - Comprendi le implicazioni sui costi

2. **Modifica la Configurazione**
   - Aggiorna le definizioni dei servizi in `azure.yaml`
   - Personalizza i template Bicep
   - Regola le variabili di ambiente

3. **Testa a Fondo**
   - Distribuisci prima nell'ambiente di sviluppo
   - Valida la funzionalità
   - Testa scalabilità e prestazioni

4. **Revisione della Sicurezza**
   - Controlla i controlli di accesso
   - Implementa la gestione dei segreti
   - Abilita monitoraggio e avvisi

## 📊 Tabella Comparativa

| Esempio | Servizi | Database | Autenticazione | Monitoraggio | Complessità |
|---------|----------|----------|----------------|--------------|-------------|
| Node.js Express Todo | 2 | ✅ | Base | Base | ⭐ |
| React SPA + Functions | 3 | ✅ | Base | Completo | ⭐ |
| Python Flask Container | 2 | ❌ | Base | Completo | ⭐ |
| C# Web API + SQL | 2 | ✅ | Completo | Completo | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Completo | Completo | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Completo | Completo | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Completo | Completo | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Base | Completo | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Completo | Completo | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Enterprise** | **Avanzato** | **⭐⭐⭐⭐** |

## 🎓 Percorso di Apprendimento

### Progressione Consigliata

1. **Inizia con l'App Web Semplice**
   - Impara i concetti base di AZD
   - Comprendi il flusso di distribuzione
   - Pratica la gestione degli ambienti

2. **Prova il Sito Statico**
   - Esplora diverse opzioni di hosting
   - Impara l'integrazione con CDN
   - Comprendi la configurazione DNS

3. **Passa all'App Containerizzata**
   - Impara le basi della containerizzazione
   - Comprendi i concetti di scalabilità
   - Pratica con Docker

4. **Aggiungi l'Integrazione con il Database**
   - Impara il provisioning del database
   - Comprendi le stringhe di connessione
   - Pratica la gestione dei segreti

5. **Esplora il Serverless**
   - Comprendi l'architettura event-driven
   - Impara i trigger e i binding
   - Pratica con le API

6. **Costruisci Microservizi**
   - Impara la comunicazione tra servizi
   - Comprendi i sistemi distribuiti
   - Pratica distribuzioni complesse

## 🔍 Trovare l'Esempio Giusto

### Per Stack Tecnologico
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Container**: Python Flask Container App, Java Microservices
- **Database**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Sistemi Multi-Agente**: **Retail Multi-Agent Solution**
- **Produzione Enterprise**: **Retail Multi-Agent Solution**

### Per Modello Architetturale
- **Monolitico**: Node.js Express Todo, C# Web API + SQL
- **Statico + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservizi**: Java Spring Boot Microservices
- **Containerizzato**: Python Flask Container App
- **AI-Powered**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Architettura Multi-Agente**: **Retail Multi-Agent Solution**
- **Multi-Servizio Enterprise**: **Retail Multi-Agent Solution**

### Per Livello di Complessità
- **Principiante**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Intermedio**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Avanzato**: ML Pipeline
- **Pronto per la Produzione Enterprise**: **Retail Multi-Agent Solution** (Sistema multi-agente completo con distribuzione tramite template ARM)

## 📚 Risorse Aggiuntive

### Link alla Documentazione
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Template AZD Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Documentazione Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Esempi della Community
- [Template AZD Azure Samples](https://github.com/Azure-Samples/azd-templates)
- [Template Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galleria Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [App Todo con C# e Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [App Todo con Python e MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [App Todo con Node.js e PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)  
- [App Web React con API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)  
- [Job di Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)  
- [Azure Functions con Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)  

### Migliori Pratiche  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

## 🤝 Contribuire con Esempi  

Hai un esempio utile da condividere? Accogliamo con piacere i tuoi contributi!  

### Linee Guida per l'Invio  
1. Segui la struttura delle directory stabilita  
2. Includi un README.md completo  
3. Aggiungi commenti ai file di configurazione  
4. Testa accuratamente prima di inviare  
5. Includi stime dei costi e prerequisiti  

### Struttura del Template d'Esempio  
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```  

---  

**Suggerimento Pro**: Inizia con l'esempio più semplice che corrisponde al tuo stack tecnologico, poi passa gradualmente a scenari più complessi. Ogni esempio si basa sui concetti dei precedenti!  

**Prossimi Passi**:  
- Scegli un esempio che corrisponde al tuo livello di competenza  
- Segui le istruzioni di configurazione nel README dell'esempio  
- Sperimenta con personalizzazioni  
- Condividi ciò che hai imparato con la comunità  

---  

**Navigazione**  
- **Lezione Precedente**: [Guida allo Studio](../resources/study-guide.md)  
- **Torna a**: [README Principale](../README.md)  

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche potrebbero contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si consiglia una traduzione professionale eseguita da un traduttore umano. Non siamo responsabili per eventuali fraintendimenti o interpretazioni errate derivanti dall'uso di questa traduzione.