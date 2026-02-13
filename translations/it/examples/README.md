# Esempi - Modelli e Configurazioni AZD Pratici

**Imparare con Esempi - Organizzati per Capitolo**
- **📚 Home del Corso**: [AZD per Principianti](../README.md)
- **📖 Mappatura dei Capitoli**: Esempi organizzati per complessità di apprendimento
- **🚀 Esempio Locale**: [Soluzione Retail Multi-Agent](retail-scenario.md)
- **🤖 Esempi AI Esterni**: Collegamenti ai repository Azure Samples

> **📍 IMPORTANTE: Esempi locali vs esterni**  
> Questo repository contiene **4 esempi locali completi** con implementazioni complete:  
> - **Azure OpenAI Chat** (deploy GPT-4 con interfaccia chat)  
> - **Container Apps** (Semplice API Flask + Microservizi)  
> - **Database App** (Web + Database SQL)  
> - **Retail Multi-Agent** (Soluzione AI aziendale)  
>  
> Esempi aggiuntivi sono **riferimenti esterni** a repository Azure-Samples che puoi clonare.

## Introduzione

Questa directory fornisce esempi pratici e riferimenti per aiutarti a imparare Azure Developer CLI attraverso esercitazioni pratiche. Lo scenario Retail Multi-Agent è un'implementazione completa e pronta per la produzione inclusa in questo repository. Ulteriori esempi fanno riferimento ai repository ufficiali Azure Samples che dimostrano vari pattern AZD.

### Legenda di Complessità

- ⭐ **Principiante** - Concetti di base, singolo servizio, 15-30 minuti
- ⭐⭐ **Intermedio** - Più servizi, integrazione database, 30-60 minuti
- ⭐⭐⭐ **Avanzato** - Architettura complessa, integrazione AI, 1-2 ore
- ⭐⭐⭐⭐ **Esperto** - Pronto per la produzione, pattern enterprise, 2+ ore

## 🎯 Cosa c'è effettivamente in questo repository

### ✅ Implementazione Locale (Pronta all'Uso)

#### [Applicazione Chat Azure OpenAI](azure-openai-chat/README.md) 🆕
**Implementazione GPT-4 completa con interfaccia chat inclusa in questo repository**

- **Posizione:** `examples/azure-openai-chat/`
- **Complessità:** ⭐⭐ (Intermedio)
- **Cosa è Incluso:**
  - Distribuzione Azure OpenAI completa (GPT-4)
  - Interfaccia chat da linea di comando in Python
  - Integrazione con Key Vault per chiavi API sicure
  - Template infrastrutturali in Bicep
  - Monitoraggio dell'uso dei token e dei costi
  - Limitazione delle richieste e gestione degli errori

**Avvio rapido:**
```bash
# Vai alla cartella example
cd examples/azure-openai-chat

# Distribuisci tutto
azd up

# Installa le dipendenze e inizia a chattare
pip install -r src/requirements.txt
python src/chat.py
```

**Tecnologie:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Esempi Container App](container-app/README.md) 🆕
**Esempi completi di deploy di container inclusi in questo repository**

- **Posizione:** `examples/container-app/`
- **Complessità:** ⭐-⭐⭐⭐⭐ (Principiante ad Avanzato)
- **Cosa è Incluso:**
  - [Guida Principale](container-app/README.md) - Panoramica completa sui deploy di container
  - [API Flask Semplice](../../../examples/container-app/simple-flask-api) - Esempio base di REST API
  - [Architettura Microservizi](../../../examples/container-app/microservices) - Deploy multi-service pronto per la produzione
  - Avvio rapido, pattern per produzione e avanzati
  - Monitoraggio, sicurezza e ottimizzazione dei costi

**Avvio rapido:**
```bash
# Visualizza la guida principale
cd examples/container-app

# Distribuisci una semplice API Flask
cd simple-flask-api
azd up

# Distribuisci un esempio di microservizi
cd ../microservices
azd up
```

**Tecnologie:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Soluzione Retail Multi-Agent](retail-scenario.md) 🆕
**Implementazione completa pronta per la produzione inclusa in questo repository**

- **Posizione:** `examples/retail-multiagent-arm-template/`
- **Complessità:** ⭐⭐⭐⭐ (Avanzato)
- **Cosa è Incluso:**
  - Template ARM completo
  - Architettura multi-agente (Customer + Inventory)
  - Integrazione Azure OpenAI
  - AI Search con RAG
  - Monitoraggio completo
  - Script di deploy con un clic

**Avvio rapido:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tecnologie:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Esempi Azure Esterni (Clona per Usare)

Gli esempi seguenti sono mantenuti nei repository ufficiali Azure-Samples. Clonali per esplorare diversi pattern AZD:

### Applicazioni Semplici (Capitoli 1-2)

| Template | Repository | Complessità | Servizi |
|:---------|:-----------|:-----------:|:--------|
| **Python Flask API** | [Locale: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservizi** | [Locale: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Come usare:**
```bash
# Clona qualsiasi esempio
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Distribuisci
azd up
```

### Esempi di Applicazioni AI (Capitoli 2, 5, 8)

| Template | Repository | Complessità | Focus |
|:---------|:-----------|:-----------:|:------|
| **Azure OpenAI Chat** | [Locale: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Distribuzione GPT-4 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat AI di base |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework per agent |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Pattern RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI aziendale |

### Database e Pattern Avanzati (Capitoli 3-8)

| Template | Repository | Complessità | Focus |
|:---------|:-----------|:-----------:|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrazione database |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Microservizi Java** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **Pipeline ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Obiettivi di Apprendimento

Lavorando su questi esempi, imparerai a:
- Esercitarti nei workflow di Azure Developer CLI con scenari applicativi realistici
- Comprendere diverse architetture applicative e le loro implementazioni azd
- Padroneggiare i pattern Infrastructure as Code per vari servizi Azure
- Applicare gestione delle configurazioni e strategie di deploy specifiche per ambiente
- Implementare pattern di monitoraggio, sicurezza e scalabilità in contesti pratici
- Acquisire esperienza con risoluzione dei problemi e debugging in scenari di deploy reali

## Risultati di Apprendimento

Al termine di questi esempi, sarai in grado di:
- Distribuire con sicurezza vari tipi di applicazioni usando Azure Developer CLI
- Adattare i template forniti ai requisiti della tua applicazione
- Progettare e implementare pattern infrastrutturali personalizzati usando Bicep
- Configurare applicazioni multi-servizio complesse con dipendenze corrette
- Applicare best practice di sicurezza, monitoraggio e performance in scenari reali
- Risolvere problemi e ottimizzare i deploy basandosi sull'esperienza pratica

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

## Esempi Avvio Rapido

> **💡 Nuovo ad AZD?** Inizia con l'esempio n.1 (Flask API) - richiede ~20 minuti e insegna i concetti fondamentali.

### Per Principianti
1. **[Container App - API Python Flask](../../../examples/container-app/simple-flask-api)** (Locale) ⭐  
   Distribuisci una semplice REST API con scale-to-zero  
   **Tempo:** 20-25 minuti | **Costo:** $0-5/mese  
   **Imparerai:** flusso di lavoro azd di base, containerizzazione, sonde di integrità  
   **Risultato atteso:** Endpoint API funzionante che restituisce "Hello, World!" con monitoraggio

2. **[App Web Semplice - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Distribuisci un'app web Node.js Express con MongoDB  
   **Tempo:** 25-35 minuti | **Costo:** $10-30/mese  
   **Imparerai:** integrazione database, variabili d'ambiente, stringhe di connessione  
   **Risultato atteso:** App Todo con funzionalità di creazione/lettura/aggiornamento/cancellazione

3. **[Sito Statico - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Ospita un sito React statico con Azure Static Web Apps  
   **Tempo:** 20-30 minuti | **Costo:** $0-10/mese  
   **Imparerai:** hosting statico, funzioni serverless, deploy CDN  
   **Risultato atteso:** UI React con backend API, SSL automatico, CDN globale

### Per Utenti Intermedi
4. **[Applicazione Azure OpenAI Chat](../../../examples/azure-openai-chat)** (Locale) ⭐⭐  
   Distribuisci GPT-4 con interfaccia chat e gestione sicura delle chiavi API  
   **Tempo:** 35-45 minuti | **Costo:** $50-200/mese  
   **Imparerai:** distribuzione Azure OpenAI, integrazione Key Vault, monitoraggio token  
   **Risultato atteso:** Applicazione chat funzionante con GPT-4 e monitoraggio dei costi

5. **[Container App - Microservizi](../../../examples/container-app/microservices)** (Locale) ⭐⭐⭐⭐  
   Architettura multi-service pronta per la produzione  
   **Tempo:** 45-60 minuti | **Costo:** $50-150/mese  
   **Imparerai:** comunicazione tra servizi, code di messaggi, tracciamento distribuito  
   **Risultato atteso:** Sistema a 2 servizi (API Gateway + Product Service) con monitoraggio

6. **[Database App - C# con Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Applicazione web con API C# e Azure SQL Database  
   **Tempo:** 30-45 minuti | **Costo:** $20-80/mese  
   **Imparerai:** Entity Framework, migrazioni del database, sicurezza delle connessioni  
   **Risultato atteso:** API C# con backend Azure SQL, deploy automatico dello schema

7. **[Funzione Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions con trigger HTTP e Cosmos DB  
   **Tempo:** 30-40 minuti | **Costo:** $10-40/mese  
   **Imparerai:** architettura event-driven, scaling serverless, integrazione NoSQL  
   **Risultato atteso:** Function app che risponde a richieste HTTP con storage in Cosmos DB

8. **[Microservizi - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Applicazione Java multi-service con Container Apps e API gateway  
   **Tempo:** 60-90 minuti | **Costo:** $80-200/mese  
   **Imparerai:** deploy Spring Boot, service mesh, bilanciamento del carico  
   **Risultato atteso:** Sistema Java multi-service con discovery dei servizi e routing

### Template Microsoft Foundry

1. **[Applicazione Azure OpenAI Chat - Esempio Locale](../../../examples/azure-openai-chat)** ⭐⭐  
   Distribuzione GPT-4 completa con interfaccia chat  
   **Tempo:** 35-45 minuti | **Costo:** $50-200/mese  
   **Risultato atteso:** Applicazione chat funzionante con monitoraggio token e costi

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Applicazione chat intelligente con architettura RAG  
   **Tempo:** 60-90 minuti | **Costo:** $100-300/mese  
   **Risultato atteso:** Interfaccia chat basata su RAG con ricerca documenti e citazioni

3. **[Elaborazione Documenti AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analisi dei documenti usando i servizi Azure AI  
   **Tempo:** 40-60 minuti | **Costo:** $20-80/mese  
   **Risultato atteso:** API che estrae testo, tabelle ed entità da documenti caricati

4. **[Pipeline di Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Workflow MLOps con Azure Machine Learning  
   **Tempo:** 2-3 ore | **Costo:** $150-500/mese  
   **Risultato atteso:** Pipeline ML automatizzata con training, deploy e monitoraggio

### Scenari del Mondo Reale

#### **Retail Multi-Agent Solution** 🆕
**[Guida all'Implementazione Completa](./retail-scenario.md)**

Una soluzione completa e pronta per la produzione per il supporto clienti multi-agente che dimostra il deployment di applicazioni AI a livello enterprise con AZD. Questo scenario fornisce:

- **Architettura Completa**: Sistema multi-agente con agenti specializzati per assistenza clienti e gestione dell'inventario
- **Infrastruttura di Produzione**: Distribuzioni Azure OpenAI multi-regione, AI Search, Container Apps e monitoraggio completo
- **Modello ARM Pronto al Deploy**: Distribuzione con un clic con più modalità di configurazione (Minimal/Standard/Premium)
- **Funzionalità Avanzate**: Validazione di sicurezza red teaming, framework di valutazione degli agenti, ottimizzazione dei costi e guide alla risoluzione dei problemi
- **Contesto Aziendale Reale**: Caso d'uso assistenza clienti per rivenditori con caricamento file, integrazione di ricerca e scaling dinamico

**Technologies**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Avanzato - Pronto per la produzione enterprise)

**Perfect for**: sviluppatori AI, architetti di soluzioni e team che costruiscono sistemi multi-agente in produzione

**Quick Start**: Distribuisci la soluzione completa in meno di 30 minuti usando il modello ARM incluso con `./deploy.sh -g myResourceGroup`

## 📋 Usage Instructions

### Prerequisites

Before running any example:
- ✅ Sottoscrizione Azure con accesso Owner o Contributor
- ✅ Azure Developer CLI installato ([Guida all'installazione](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop in esecuzione (per gli esempi con container)
- ✅ Quote Azure appropriate (verificare i requisiti specifici per ogni esempio)

> **💰 Avviso sui costi:** Tutti gli esempi creano risorse Azure reali che comportano addebiti. Consulta i README individuali per le stime dei costi. Ricorda di eseguire `azd down` al termine per evitare costi continuativi.

### Running Examples Locally

1. **Clone or Copy Example**
   ```bash
   # Vai all'esempio desiderato
   cd examples/simple-web-app
   ```

2. **Initialize AZD Environment**
   ```bash
   # Inizializza con un modello esistente
   azd init
   
   # Oppure crea un nuovo ambiente
   azd env new my-environment
   ```

3. **Configure Environment**
   ```bash
   # Imposta le variabili richieste
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Deploy**
   ```bash
   # Distribuire l'infrastruttura e l'applicazione
   azd up
   ```

5. **Verify Deployment**
   ```bash
   # Ottieni gli endpoint del servizio
   azd env get-values
   
   # Testa l'endpoint (esempio)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Indicatori di successo previsti:**
   - ✅ `azd up` si completa senza errori
   - ✅ L'endpoint del servizio restituisce HTTP 200
   - ✅ Azure Portal mostra lo stato "Running"
   - ✅ Application Insights riceve telemetria

> **⚠️ Problemi?** Vedi [Common Issues](../docs/chapter-07-troubleshooting/common-issues.md) per la risoluzione dei problemi di deployment

### Adapting Examples

Each example includes:
- **README.md** - Istruzioni dettagliate per l'installazione e la personalizzazione
- **azure.yaml** - Configurazione AZD con commenti
- **infra/** - Template Bicep con spiegazioni dei parametri
- **src/** - Codice di esempio dell'applicazione
- **scripts/** - Script di supporto per attività comuni

## 🎯 Learning Objectives

### Example Categories

#### **Basic Deployments**
- Applicazioni a servizio singolo
- Pattern infrastrutturali semplici
- Gestione della configurazione di base
- Configurazioni di sviluppo a basso costo

#### **Advanced Scenarios**
- Architetture multi-servizio
- Configurazioni di rete complesse
- Pattern di integrazione dei database
- Implementazioni di sicurezza e conformità

#### **Production-Ready Patterns**
- Configurazioni ad alta disponibilità
- Monitoraggio e osservabilità
- Integrazione CI/CD
- Piani di disaster recovery

## 📖 Example Descriptions

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Principiante  
**Concepts**: Deploy di base, API REST, integrazione con database NoSQL

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Principiante  
**Concepts**: Hosting statico, backend serverless, sviluppo web moderno

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Principiante  
**Concepts**: Containerizzazione, API REST, scale-to-zero, health probe, monitoraggio  
**Location**: [Esempio locale](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Avanzato  
**Concepts**: Architettura multi-servizio, comunicazione tra servizi, accodamento messaggi, tracciamento distribuito  
**Location**: [Esempio locale](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: Intermedio  
**Concepts**: Entity Framework, connessioni al database, sviluppo di Web API

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: Intermedio  
**Concepts**: Architettura event-driven, computing serverless, sviluppo full-stack

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: Intermedio  
**Concepts**: Comunicazione tra microservizi, sistemi distribuiti, pattern enterprise

### Microsoft Foundry Examples

#### Azure OpenAI Chat App
**Technologies**: Azure OpenAI, Cognitive Search, App Service  
**Complexity**: Intermedio  
**Concepts**: Architettura RAG, ricerca vettoriale, integrazione LLM

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Intermedio  
**Concepts**: Analisi documenti, OCR, estrazione dati

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Avanzato  
**Concepts**: Addestramento modelli, pipeline di deploy, monitoraggio

## 🛠 Configuration Examples

The `configurations/` directory contains reusable components:

### Environment Configurations
- Impostazioni per l'ambiente di sviluppo
- Configurazioni per l'ambiente di staging
- Configurazioni pronte per la produzione
- Setup per deployment multi-regione

### Bicep Modules
- Componenti infrastrutturali riutilizzabili
- Pattern comuni per le risorse
- Template con hardening della sicurezza
- Configurazioni ottimizzate per i costi

### Helper Scripts
- Automazione della configurazione dell'ambiente
- Script per migrazione database
- Strumenti di validazione del deployment
- Utility per il monitoraggio dei costi

## 🔧 Customization Guide

### Adapting Examples for Your Use Case

1. **Review Prerequisites**
   - Verificare i requisiti dei servizi Azure
   - Controllare i limiti della sottoscrizione
   - Comprendere le implicazioni sui costi

2. **Modify Configuration**
   - Aggiornare le definizioni dei servizi in `azure.yaml`
   - Personalizzare i template Bicep
   - Regolare le variabili d'ambiente

3. **Test Thoroughly**
   - Distribuire prima nell'ambiente di sviluppo
   - Validare le funzionalità
   - Testare scalabilità e prestazioni

4. **Security Review**
   - Riesaminare i controlli di accesso
   - Implementare la gestione dei segreti
   - Abilitare monitoraggio e avvisi

## 📊 Comparison Matrix

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Local) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 Learning Path

### Recommended Progression

1. **Start with Simple Web App**
   - Imparare i concetti base di AZD
   - Comprendere il flusso di deployment
   - Esercitarsi nella gestione degli ambienti

2. **Try Static Website**
   - Esplorare diverse opzioni di hosting
   - Imparare l'integrazione con CDN
   - Comprendere la configurazione DNS

3. **Move to Container App**
   - Apprendere le basi della containerizzazione
   - Comprendere i concetti di scaling
   - Esercitarsi con Docker

4. **Add Database Integration**
   - Imparare il provisioning del database
   - Comprendere le connection string
   - Esercitarsi nella gestione dei segreti

5. **Explore Serverless**
   - Comprendere l'architettura event-driven
   - Conoscere trigger e binding
   - Esercitarsi con le API

6. **Build Microservices**
   - Imparare la comunicazione tra servizi
   - Comprendere i sistemi distribuiti
   - Esercitarsi con deployment complessi

## 🔍 Finding the Right Example

### By Technology Stack
- **Container Apps**: [API Python Flask (Locale)](../../../examples/container-app/simple-flask-api), [Microservices (Locale)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Locale)](../../../examples/container-app/microservices)
- **Python**: [API Python Flask (Locale)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Locale)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Locale)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Locale)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Locale)](../../../examples/container-app/simple-flask-api), [Microservices (Locale)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Locale)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Locale)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Azure OpenAI Chat (Locale)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Locale)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### By Architecture Pattern
- **Simple REST API**: [API Python Flask (Locale)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Locale)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Locale)](../../../examples/container-app/simple-flask-api), [Microservices (Locale)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (Locale)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Locale)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### By Complexity Level
- **Beginner**: [API Python Flask (Locale)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Azure OpenAI Chat (Locale)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Locale)](../../../examples/container-app/microservices) (Multi-service con accodamento messaggi), **Retail Multi-Agent Solution** (Sistema multi-agente completo con deployment tramite template ARM)

## 📚 Additional Resources

### Documentation Links
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Documentazione Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centro Architettura Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Community Examples
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [App Todo con Node.js e PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [App web React con API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Job di Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions con Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Migliori pratiche
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Esempi di contributo

Hai un esempio utile da condividere? Accogliamo contributi!

### Linee guida per l'invio
1. Segui la struttura di directory stabilita
2. Includi un README.md completo
3. Aggiungi commenti ai file di configurazione
4. Testa accuratamente prima di inviare
5. Includi stime dei costi e prerequisiti

### Struttura del modello di esempio
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

**Suggerimento professionale**: Inizia con l'esempio più semplice che corrisponde al tuo stack tecnologico, poi procedi gradualmente verso scenari più complessi. Ogni esempio si basa sui concetti del precedente!

## 🚀 Pronto per iniziare?

### Il tuo percorso di apprendimento

1. **Principiante completo?** → Inizia con [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Hai conoscenze di base di AZD?** → Prova [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Stai sviluppando app AI?** → Inizia con [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) oppure esplora [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ ore)
4. **Hai bisogno di uno stack tecnologico specifico?** → Usa la sezione [Trovare l'esempio giusto](../../../examples) sopra

### Prossimi passi

- ✅ Rivedi i [Prerequisiti](../../../examples) sopra
- ✅ Scegli un esempio che corrisponda al tuo livello di abilità (vedi la [Legenda di complessità](../../../examples))
- ✅ Leggi attentamente il README dell'esempio prima di effettuare il deployment
- ✅ Imposta un promemoria per eseguire `azd down` dopo i test
- ✅ Condividi la tua esperienza tramite GitHub Issues o Discussions

### Hai bisogno di aiuto?

- 📖 [FAQ](../resources/faq.md) - Domande frequenti
- 🐛 [Guida alla risoluzione dei problemi](../docs/chapter-07-troubleshooting/common-issues.md) - Risolvi i problemi di deployment
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Chiedi alla community
- 📚 [Guida di studio](../resources/study-guide.md) - Rafforza il tuo apprendimento

---

**Navigazione**
- **📚 Home del corso**: [AZD For Beginners](../README.md)
- **📖 Materiali di studio**: [Guida di studio](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossario](../resources/glossary.md)
- **🔧 Risorse**: [FAQ](../resources/faq.md) | [Risoluzione dei problemi](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Ultimo aggiornamento: novembre 2025 | [Segnala problemi](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuisci con esempi](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Dichiarazione di non responsabilità:
Questo documento è stato tradotto utilizzando il servizio di traduzione con intelligenza artificiale Co-op Translator (https://github.com/Azure/co-op-translator). Pur impegnandoci per la massima accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale, nella sua lingua nativa, dovrebbe essere considerato la fonte autorevole. Per informazioni critiche si raccomanda una traduzione professionale effettuata da un traduttore umano. Non ci assumiamo responsabilità per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->