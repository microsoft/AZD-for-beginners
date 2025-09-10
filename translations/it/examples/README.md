<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:10:06+00:00",
  "source_file": "examples/README.md",
  "language_code": "it"
}
-->
# Esempi - Modelli e Configurazioni Pratiche AZD

## Introduzione

Questa directory contiene esempi pratici, modelli e scenari reali per aiutarti a imparare Azure Developer CLI attraverso la pratica diretta. Ogni esempio fornisce codice funzionante completo, modelli di infrastruttura e istruzioni dettagliate per diverse architetture applicative e modelli di distribuzione.

## Obiettivi di Apprendimento

Lavorando su questi esempi, potrai:
- Praticare i flussi di lavoro di Azure Developer CLI con scenari applicativi realistici
- Comprendere diverse architetture applicative e le loro implementazioni con azd
- Padroneggiare i modelli di Infrastructure as Code per vari servizi Azure
- Applicare strategie di gestione della configurazione e distribuzione specifiche per ambiente
- Implementare modelli di monitoraggio, sicurezza e scalabilità in contesti pratici
- Acquisire esperienza con il troubleshooting e il debugging di scenari di distribuzione reali

## Risultati di Apprendimento

Completando questi esempi, sarai in grado di:
- Distribuire con sicurezza diversi tipi di applicazioni utilizzando Azure Developer CLI
- Adattare i modelli forniti alle tue esigenze applicative
- Progettare e implementare modelli di infrastruttura personalizzati utilizzando Bicep
- Configurare applicazioni complesse multi-servizio con dipendenze adeguate
- Applicare le migliori pratiche di sicurezza, monitoraggio e prestazioni in scenari reali
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

## Esempi Rapidi

### Per Principianti
1. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Distribuisci un'applicazione web Node.js Express con MongoDB
2. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Ospita un sito web statico React con Azure Static Web Apps
3. **[Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Distribuisci un'applicazione Python Flask containerizzata

### Per Utenti Intermedi
4. **[Database App - C# con Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Applicazione web con API C# e database Azure SQL
5. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Funzioni Azure Python con trigger HTTP e Cosmos DB
6. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Applicazione Java multi-servizio con Container Apps e API gateway

### Modelli Azure AI Foundry

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Applicazione di chat intelligente con Azure OpenAI
2. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** - Analisi documentale utilizzando i servizi Azure AI
3. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** - Workflow MLOps con Azure Machine Learning

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
- **README.md** - Istruzioni dettagliate per configurazione e personalizzazione
- **azure.yaml** - Configurazione AZD con commenti
- **infra/** - Modelli Bicep con spiegazioni sui parametri
- **src/** - Codice applicativo di esempio
- **scripts/** - Script di supporto per attività comuni

## 🎯 Obiettivi di Apprendimento

### Categorie di Esempi

#### **Distribuzioni Base**
- Applicazioni mono-servizio
- Modelli di infrastruttura semplici
- Gestione della configurazione di base
- Configurazioni economiche per lo sviluppo

#### **Scenari Avanzati**
- Architetture multi-servizio
- Configurazioni di rete complesse
- Modelli di integrazione con database
- Implementazioni di sicurezza e conformità

#### **Modelli Pronti per la Produzione**
- Configurazioni ad alta disponibilità
- Monitoraggio e osservabilità
- Integrazione CI/CD
- Configurazioni per il ripristino di emergenza

## 📖 Descrizioni degli Esempi

### Simple Web App - Node.js Express
**Tecnologie**: Node.js, Express, MongoDB, Container Apps  
**Complessità**: Principiante  
**Concetti**: Distribuzione base, REST API, integrazione con database NoSQL

### Static Website - React SPA
**Tecnologie**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complessità**: Principiante  
**Concetti**: Hosting statico, backend serverless, sviluppo web moderno

### Container App - Python Flask
**Tecnologie**: Python Flask, Docker, Container Apps, Container Registry  
**Complessità**: Principiante  
**Concetti**: Containerizzazione, architettura microservizi, sviluppo API

### Database App - C# con Azure SQL
**Tecnologie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complessità**: Intermedio  
**Concetti**: Entity Framework, connessioni al database, sviluppo API web

### Serverless Function - Python Azure Functions
**Tecnologie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complessità**: Intermedio  
**Concetti**: Architettura event-driven, calcolo serverless, sviluppo full-stack

### Microservices - Java Spring Boot
**Tecnologie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complessità**: Intermedio  
**Concetti**: Comunicazione tra microservizi, sistemi distribuiti, modelli aziendali

### Azure AI Foundry Examples

#### Azure OpenAI Chat App
**Tecnologie**: Azure OpenAI, Cognitive Search, App Service  
**Complessità**: Intermedio  
**Concetti**: Architettura RAG, ricerca vettoriale, integrazione LLM

#### AI Document Processing
**Tecnologie**: Azure AI Document Intelligence, Storage, Functions  
**Complessità**: Intermedio  
**Concetti**: Analisi documentale, OCR, estrazione dati

#### Machine Learning Pipeline
**Tecnologie**: Azure ML, MLOps, Container Registry  
**Complessità**: Avanzato  
**Concetti**: Addestramento modelli, pipeline di distribuzione, monitoraggio

## 🛠 Esempi di Configurazione

La directory `configurations/` contiene componenti riutilizzabili:

### Configurazioni di Ambiente
- Impostazioni per ambiente di sviluppo
- Configurazioni per ambiente di staging
- Configurazioni pronte per la produzione
- Configurazioni di distribuzione multi-regione

### Moduli Bicep
- Componenti di infrastruttura riutilizzabili
- Modelli di risorse comuni
- Modelli con sicurezza avanzata
- Configurazioni ottimizzate per i costi

### Script di Supporto
- Automazione della configurazione dell'ambiente
- Script per migrazione di database
- Strumenti di validazione della distribuzione
- Utilità per il monitoraggio dei costi

## 🔧 Guida alla Personalizzazione

### Adattamento degli Esempi alle Tue Esigenze

1. **Rivedi i Prerequisiti**
   - Controlla i requisiti dei servizi Azure
   - Verifica i limiti della sottoscrizione
   - Comprendi le implicazioni sui costi

2. **Modifica la Configurazione**
   - Aggiorna le definizioni dei servizi in `azure.yaml`
   - Personalizza i modelli Bicep
   - Regola le variabili di ambiente

3. **Testa a Fondo**
   - Distribuisci prima nell'ambiente di sviluppo
   - Valida la funzionalità
   - Testa scalabilità e prestazioni

4. **Revisione della Sicurezza**
   - Controlla i controlli di accesso
   - Implementa la gestione dei segreti
   - Abilita il monitoraggio e gli avvisi

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

## 🎓 Percorso di Apprendimento

### Progressione Consigliata

1. **Inizia con Simple Web App**
   - Impara i concetti base di AZD
   - Comprendi il flusso di distribuzione
   - Pratica la gestione degli ambienti

2. **Prova Static Website**
   - Esplora diverse opzioni di hosting
   - Impara l'integrazione CDN
   - Comprendi la configurazione DNS

3. **Passa a Container App**
   - Impara le basi della containerizzazione
   - Comprendi i concetti di scalabilità
   - Pratica con Docker

4. **Aggiungi l'Integrazione con Database**
   - Impara il provisioning dei database
   - Comprendi le stringhe di connessione
   - Pratica la gestione dei segreti

5. **Esplora Serverless**
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
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Per Modello Architetturale
- **Monolitico**: Node.js Express Todo, C# Web API + SQL
- **Statico + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservizi**: Java Spring Boot Microservices
- **Containerizzato**: Python Flask Container App
- **AI-Powered**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Per Livello di Complessità
- **Principiante**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Intermedio**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Avanzato**: ML Pipeline

## 📚 Risorse Aggiuntive

### Link alla Documentazione
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Documentazione Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Esempi della Comunità
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Galleria Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Todo App con C# e Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App con Python e MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App con Node.js e PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Web App React con API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions con Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Best Practices
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuire con Esempi

Hai un esempio utile da condividere? Accogliamo con piacere i contributi!

### Linee Guida per la Presentazione
1. Segui la struttura della directory stabilita
2. Includi un README.md completo
3. Aggiungi commenti ai file di configurazione
4. Testa accuratamente prima di inviare
5. Includi stime sui costi e prerequisiti

### Struttura del Modello di Esempio
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

**Suggerimento**: Inizia con l'esempio più semplice che corrisponde al tuo stack tecnologico, poi procedi gradualmente verso scenari più complessi. Ogni esempio si basa sui concetti dei precedenti!

**Prossimi Passi**: 
- Scegli un esempio che corrisponde al tuo livello di competenza
- Segui le istruzioni di configurazione nel README dell'esempio
- Sperimenta con le personalizzazioni
- Condividi le tue esperienze con la comunità

---

**Navigazione**
- **Lezione Precedente**: [Guida allo Studio](../resources/study-guide.md)
- **Torna a**: [README Principale](../README.md)

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali fraintendimenti o interpretazioni errate derivanti dall'uso di questa traduzione.