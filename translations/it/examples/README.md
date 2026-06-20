# Esempi - Modelli AZD pratici e configurazioni

**Imparare con esempi - Organizzato per capitolo**
- **📚 Home del corso**: [AZD per Principianti](../README.md)
- **📖 Mappatura dei capitoli**: Esempi organizzati per complessità di apprendimento
- **🚀 Esempio locale**: [Soluzione Retail Multi-Agent](retail-scenario.md)
- **🤖 Esempi AI esterni**: Collegamenti ai repository Azure Samples

> **📍 IMPORTANTE: Esempi locali vs esterni**  
> Questo repository contiene **4 esempi locali completi** con implementazioni complete:  
> - **Microsoft Foundry Models Chat** (deployment gpt-4.1 con interfaccia di chat)  
> - **Container Apps** (API Flask semplice + Microservizi)  
> - **Database App** (Web + Database SQL)  
> - **Retail Multi-Agent** (Soluzione AI aziendale)  
>  
> Ulteriori esempi sono **riferimenti esterni** a repository Azure-Samples che puoi clonare.

## Introduzione

Questa directory fornisce esempi pratici e riferimenti per aiutarti a imparare Azure Developer CLI tramite pratica sul campo. Lo scenario Retail Multi-Agent è un'implementazione completa e pronta per la produzione inclusa in questo repository. Ulteriori esempi fanno riferimento agli Azure Samples ufficiali che dimostrano diversi pattern AZD.

### Legenda della complessità

- ⭐ **Principiante** - Concetti base, singolo servizio, 15-30 minuti
- ⭐⭐ **Intermedio** - Più servizi, integrazione con database, 30-60 minuti
- ⭐⭐⭐ **Avanzato** - Architettura complessa, integrazione AI, 1-2 ore
- ⭐⭐⭐⭐ **Esperto** - Pronto per la produzione, pattern enterprise, 2+ ore

## 🎯 Cosa c'è effettivamente in questo repository

### ✅ Implementazioni locali (Pronte all'uso)

#### [Applicazione Chat Microsoft Foundry Models](azure-openai-chat/README.md) 🆕
**Deploy gpt-4.1 completo con interfaccia di chat incluso in questo repository**

- **Posizione:** `examples/azure-openai-chat/`
- **Complessità:** ⭐⭐ (Intermedio)
- **Cosa è incluso:**
  - Deploy completo di Microsoft Foundry Models (gpt-4.1)
  - Interfaccia chat da linea di comando in Python
  - Integrazione con Key Vault per chiavi API sicure
  - Template di infrastruttura Bicep
  - Monitoraggio dell'utilizzo dei token e dei costi
  - Limitazione della velocità e gestione degli errori

**Avvio rapido:**
```bash
# Vai all'esempio
cd examples/azure-openai-chat

# Distribuisci tutto
azd up

# Installa le dipendenze e inizia a chattare
pip install -r src/requirements.txt
python src/chat.py
```

**Tecnologie:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Esempi Container App](container-app/README.md) 🆕
**Esempi completi di deployment di container inclusi in questo repository**

- **Posizione:** `examples/container-app/`
- **Complessità:** ⭐-⭐⭐⭐⭐ (Principiante a Avanzato)
- **Cosa è incluso:**
  - [Guida principale](container-app/README.md) - Panoramica completa dei deployment di container
  - [API Flask semplice](../../../examples/container-app/simple-flask-api) - Esempio base di REST API
  - [Architettura a microservizi](../../../examples/container-app/microservices) - Deployment multi-servizio pronto per la produzione
  - Pattern Avvio rapido, Produzione e Avanzati
  - Monitoraggio, sicurezza e ottimizzazione dei costi

**Avvio rapido:**
```bash
# Visualizza guida principale
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
- **Cosa è incluso:**
  - Template di deployment ARM completo
  - Architettura multi-agent (Customer + Inventory)
  - Integrazione con Microsoft Foundry Models
  - AI Search con RAG
  - Monitoraggio completo
  - Script di deploy con un clic

**Avvio rapido:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tecnologie:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Esempi Azure esterni (Clona per usare)

I seguenti esempi sono mantenuti nei repository ufficiali Azure-Samples. Clonali per esplorare diversi pattern AZD:

### Applicazioni semplici (Capitoli 1-2)

| Template | Repository | Complessità | Servizi |
|:---------|:-----------|:-----------|:---------|
| **API Python Flask** | [Locale: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
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

### Esempi di applicazioni AI (Capitoli 2, 5, 8)

| Template | Repository | Complessità | Focus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Locale: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | deploy gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat AI di base |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework per agent |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Pattern RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI enterprise |

### Database e pattern avanzati (Capitoli 3-8)

| Template | Repository | Complessità | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrazione database |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Obiettivi di apprendimento

Lavorando su questi esempi, sarai in grado di:
- Esercitare i workflow di Azure Developer CLI con scenari applicativi realistici
- Comprendere diverse architetture applicative e le loro implementazioni azd
- Padroneggiare pattern Infrastructure as Code per vari servizi Azure
- Applicare la gestione della configurazione e strategie di deployment specifiche per ambiente
- Implementare pattern di monitoraggio, sicurezza e scalabilità in contesti pratici
- Acquisire esperienza con troubleshooting e debug di scenari di deployment reali

## Risultati di apprendimento

Al completamento di questi esempi, sarai in grado di:
- Distribuire con sicurezza vari tipi di applicazioni usando Azure Developer CLI
- Adattare i template forniti ai requisiti della tua applicazione
- Progettare e implementare pattern infrastrutturali personalizzati usando Bicep
- Configurare applicazioni complesse multi-servizio con dipendenze appropriate
- Applicare pratiche di sicurezza, monitoraggio e performance in scenari reali
- Risolvere problemi e ottimizzare i deployment basandoti sull'esperienza pratica

## Struttura della directory

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

## Esempi di avvio rapido

> **💡 Nuovo in AZD?** Inizia con l'esempio n.1 (Flask API) - richiede ~20 minuti e insegna i concetti base.

### Per principianti
1. **[Container App - API Python Flask](../../../examples/container-app/simple-flask-api)** (Locale) ⭐  
   Distribuisci una semplice API REST con scale-to-zero  
   **Tempo:** 20-25 minuti | **Costo:** $0-5/month  
   **Imparerai:** Workflow azd di base, containerizzazione, probe di health  
   **Risultato previsto:** Endpoint API funzionante che restituisce "Hello, World!" con monitoraggio

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Distribuisci un'app web Node.js Express con MongoDB  
   **Tempo:** 25-35 minuti | **Costo:** $10-30/month  
   **Imparerai:** Integrazione con database, variabili d'ambiente, stringhe di connessione  
   **Risultato previsto:** App Todo con funzionalità di creazione/lettura/aggiornamento/cancellazione

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Ospita un sito statico React con Azure Static Web Apps  
   **Tempo:** 20-30 minuti | **Costo:** $0-10/month  
   **Imparerai:** Hosting statico, funzioni serverless, deployment su CDN  
   **Risultato previsto:** UI React con backend API, SSL automatico, CDN globale

### Per utenti intermedi
4. **[Applicazione Chat Microsoft Foundry Models](../../../examples/azure-openai-chat)** (Locale) ⭐⭐  
   Distribuisci gpt-4.1 con interfaccia di chat e gestione sicura delle chiavi API  
   **Tempo:** 35-45 minuti | **Costo:** $50-200/month  
   **Imparerai:** Deploy Microsoft Foundry Models, integrazione Key Vault, monitoraggio dei token  
   **Risultato previsto:** Applicazione chat funzionante con gpt-4.1 e monitoraggio dei costi

5. **[Container App - Microservizi](../../../examples/container-app/microservices)** (Locale) ⭐⭐⭐⭐  
   Architettura multi-servizio pronta per la produzione  
   **Tempo:** 45-60 minuti | **Costo:** $50-150/month  
   **Imparerai:** Comunicazione tra servizi, coda di messaggi, tracing distribuito  
   **Risultato previsto:** Sistema a 2 servizi (API Gateway + Product Service) con monitoraggio

6. **[Database App - C# con Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Applicazione web con API C# e Azure SQL Database  
   **Tempo:** 30-45 minuti | **Costo:** $20-80/month  
   **Imparerai:** Entity Framework, migrazioni del database, sicurezza delle connessioni  
   **Risultato previsto:** API C# con backend Azure SQL, deployment automatico dello schema

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions con trigger HTTP e Cosmos DB  
   **Tempo:** 30-40 minuti | **Costo:** $10-40/month  
   **Imparerai:** Architettura event-driven, scaling serverless, integrazione NoSQL  
   **Risultato previsto:** Function app che risponde a richieste HTTP con storage su Cosmos DB

8. **[Microservizi - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Applicazione Java multi-servizio con Container Apps e API gateway  
   **Tempo:** 60-90 minuti | **Costo:** $80-200/month  
   **Imparerai:** Deploy Spring Boot, service mesh, bilanciamento del carico  
   **Risultato previsto:** Sistema Java multi-servizio con discovery e routing

### Template Microsoft Foundry

1. **[Applicazione Chat Microsoft Foundry Models - Esempio Locale](../../../examples/azure-openai-chat)** ⭐⭐  
   Deploy gpt-4.1 completo con interfaccia di chat  
   **Tempo:** 35-45 minuti | **Costo:** $50-200/month  
   **Risultato previsto:** Applicazione chat funzionante con monitoraggio dei token e dei costi

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Applicazione chat intelligente con architettura RAG  
   **Tempo:** 60-90 minuti | **Costo:** $100-300/month  
   **Risultato previsto:** Interfaccia chat basata su RAG con ricerca di documenti e citazioni

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analisi di documenti usando servizi Azure AI  
   **Tempo:** 40-60 minuti | **Costo:** $20-80/month  
   **Risultato previsto:** API che estrae testo, tabelle ed entità dai documenti caricati

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Workflow MLOps con Azure Machine Learning  
   **Tempo:** 2-3 ore | **Costo:** $150-500/month  
   **Risultato previsto:** Pipeline ML automatizzata con training, deploy e monitoraggio

### Scenari del mondo reale

#### **Soluzione Retail Multi-Agent** 🆕
**[Guida completa all'implementazione](./retail-scenario.md)**

Una soluzione multi-agent completa e pronta per la produzione per il supporto clienti che dimostra il deployment di applicazioni AI di livello enterprise con AZD. Questo scenario fornisce:

- **Architettura completa**: Sistema multi-agent con agent specializzati per il servizio clienti e la gestione dell'inventario
- **Infrastruttura di produzione**: Distribuzioni multi-regione di Microsoft Foundry Models, AI Search, Container Apps e monitoraggio completo
- **Template ARM pronto per il deploy**: Distribuzione con un clic con più modalità di configurazione (Minimal/Standard/Premium)
- **Funzionalità avanzate**: Validazione di sicurezza red teaming, framework di valutazione degli agenti, ottimizzazione dei costi e guide per il troubleshooting
- **Contesto aziendale reale**: Caso d'uso di supporto clienti per retailer con upload di file, integrazione di ricerca e scaling dinamico

**Tecnologie**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complessità**: ⭐⭐⭐⭐ (Avanzato - Pronto per la Produzione Enterprise)

**Perfetto per**: sviluppatori AI, solution architect e team che costruiscono sistemi multi-agente in produzione

**Avvio rapido**: Distribuisci la soluzione completa in meno di 30 minuti usando il template ARM incluso con `./deploy.sh -g myResourceGroup`

## 📋 Istruzioni per l'uso

### Prerequisiti

Prima di eseguire qualsiasi esempio:
- ✅ Sottoscrizione Azure con accesso Owner o Contributor
- ✅ Azure Developer CLI installato ([Guida all'installazione](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop in esecuzione (per esempi con container)
- ✅ Quote Azure appropriate (verificare i requisiti specifici dell'esempio)

> **💰 Avviso sui costi:** Tutti gli esempi creano risorse Azure reali che comportano costi. Consultare i singoli file README per stime dei costi. Ricordarsi di eseguire `azd down` al termine per evitare costi continui.

### Esecuzione degli esempi in locale

1. **Clona o copia l'esempio**
   ```bash
   # Vai all'esempio desiderato
   cd examples/simple-web-app
   ```

2. **Inizializza l'ambiente AZD**
   ```bash
   # Inizializza con un modello esistente
   azd init
   
   # Oppure crea un nuovo ambiente
   azd env new my-environment
   ```

3. **Configura l'ambiente**
   ```bash
   # Imposta le variabili richieste
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Distribuisci**
   ```bash
   # Distribuire l'infrastruttura e l'applicazione
   azd up
   ```

5. **Verifica la distribuzione**
   ```bash
   # Ottieni gli endpoint del servizio
   azd env get-values
   
   # Testa l'endpoint (esempio)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Indicatori di successo attesi:**
   - ✅ `azd up` viene completato senza errori
   - ✅ L'endpoint del servizio restituisce HTTP 200
   - ✅ Azure Portal mostra lo stato "Running"
   - ✅ Application Insights riceve telemetria

> **⚠️ Problemi?** Vedi [Problemi comuni](../docs/chapter-07-troubleshooting/common-issues.md) per la risoluzione dei problemi di distribuzione

### Adattamento degli esempi

Ogni esempio include:
- **README.md** - Istruzioni dettagliate per configurazione e personalizzazione
- **azure.yaml** - Configurazione AZD con commenti
- **infra/** - Template Bicep con spiegazione dei parametri
- **src/** - Codice dell'applicazione di esempio
- **scripts/** - Script di utilità per attività comuni

## 🎯 Obiettivi di apprendimento

### Categorie di esempi

#### **Distribuzioni di base**
- Applicazioni a servizio singolo
- Pattern infrastrutturali semplici
- Gestione di configurazione di base
- Setup di sviluppo a basso costo

#### **Scenari avanzati**
- Architetture multi-servizio
- Configurazioni di rete complesse
- Pattern di integrazione database
- Implementazioni di sicurezza e compliance

#### **Pattern pronti per la produzione**
- Configurazioni ad alta disponibilità
- Monitoraggio e osservabilità
- Integrazione CI/CD
- Setup di disaster recovery

## 📖 Descrizione degli esempi

### Simple Web App - Node.js Express
**Tecnologie**: Node.js, Express, MongoDB, Container Apps  
**Complessità**: Principiante  
**Concetti**: Distribuzione di base, REST API, integrazione database NoSQL

### Static Website - React SPA
**Tecnologie**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complessità**: Principiante  
**Concetti**: Hosting statico, backend serverless, sviluppo web moderno

### Container App - Python Flask
**Tecnologie**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complessità**: Principiante  
**Concetti**: Containerizzazione, REST API, scale-to-zero, health probes, monitoring  
**Posizione**: [Esempio locale](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Tecnologie**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complessità**: Avanzato  
**Concetti**: Architettura multi-servizio, comunicazione tra servizi, code di messaggi, tracing distribuito  
**Posizione**: [Esempio locale](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Tecnologie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complessità**: Intermedio  
**Concetti**: Entity Framework, connessioni al database, sviluppo di web API

### Serverless Function - Python Azure Functions
**Tecnologie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complessità**: Intermedio  
**Concetti**: Architettura event-driven, computing serverless, sviluppo full-stack

### Microservices - Java Spring Boot
**Tecnologie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complessità**: Intermedio  
**Concetti**: Comunicazione tra microservizi, sistemi distribuiti, pattern enterprise

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Tecnologie**: Microsoft Foundry Models, Azure AI Search, App Service  
**Complessità**: Intermedio  
**Concetti**: Architettura RAG, ricerca vettoriale, integrazione LLM

#### AI Document Processing
**Tecnologie**: Azure AI Document Intelligence, Storage, Functions  
**Complessità**: Intermedio  
**Concetti**: Analisi dei documenti, OCR, estrazione dei dati

#### Machine Learning Pipeline
**Tecnologie**: Azure ML, MLOps, Container Registry  
**Complessità**: Avanzato  
**Concetti**: Addestramento modelli, pipeline di deployment, monitoraggio

## 🛠 Esempi di configurazione

La directory `configurations/` contiene componenti riutilizzabili:

### Configurazioni di ambiente
- Impostazioni per ambiente di sviluppo
- Configurazioni per ambiente di staging
- Configurazioni pronte per la produzione
- Setup per deployment multi-regione

### Moduli Bicep
- Componenti infrastrutturali riutilizzabili
- Pattern comuni di risorse
- Template con hardening per la sicurezza
- Configurazioni ottimizzate per i costi

### Script di supporto
- Automazione setup ambiente
- Script di migrazione database
- Strumenti di validazione del deployment
- Utility per il monitoraggio dei costi

## 🔧 Guida alla personalizzazione

### Adattare gli esempi al tuo caso d'uso

1. **Rivedi i prerequisiti**
   - Verifica i requisiti dei servizi Azure
   - Controlla i limiti della sottoscrizione
   - Comprendi le implicazioni sui costi

2. **Modifica la configurazione**
   - Aggiorna le definizioni dei servizi in `azure.yaml`
   - Personalizza i template Bicep
   - Regola le variabili d'ambiente

3. **Test approfonditi**
   - Distribuisci prima in ambiente di sviluppo
   - Valida la funzionalità
   - Testa lo scaling e le prestazioni

4. **Revisione della sicurezza**
   - Controlla i controlli di accesso
   - Implementa la gestione dei segreti
   - Abilita monitoraggio e alerting

## 📊 Matrice di confronto

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 Percorso di apprendimento

### Progressione consigliata

1. **Inizia con la Simple Web App**
   - Impara i concetti base di AZD
   - Comprendi il workflow di deployment
   - Esercitati nella gestione degli ambienti

2. **Prova lo Static Website**
   - Esplora le diverse opzioni di hosting
   - Impara l'integrazione CDN
   - Comprendi la configurazione DNS

3. **Passa alla Container App**
   - Impara le basi della containerizzazione
   - Comprendi i concetti di scaling
   - Esercitati con Docker

4. **Aggiungi l'integrazione database**
   - Impara il provisioning dei database
   - Comprendi le stringhe di connessione
   - Esercitati nella gestione dei segreti

5. **Esplora il serverless**
   - Comprendi l'architettura event-driven
   - Impara trigger e binding
   - Esercitati con le API

6. **Costruisci microservizi**
   - Impara la comunicazione tra servizi
   - Comprendi i sistemi distribuiti
   - Esercitati con deploy complessi

## 🔍 Trovare l'esempio giusto

### Per stack tecnologico
- **Container Apps**: [Python Flask API (Locale)](../../../examples/container-app/simple-flask-api), [Microservices (Locale)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Locale)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Locale)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Locale)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Locale)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Locale)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Locale)](../../../examples/container-app/simple-flask-api), [Microservices (Locale)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Locale)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Locale)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Sistemi multi-agente**: **Retail Multi-Agent Solution**
- **Integrazione OpenAI**: **[Microsoft Foundry Models Chat (Locale)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Locale)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Per pattern architetturale
- **Simple REST API**: [Python Flask API (Locale)](../../../examples/container-app/simple-flask-api)
- **Monolitico**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Locale)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerizzato**: [Python Flask (Locale)](../../../examples/container-app/simple-flask-api), [Microservices (Locale)](../../../examples/container-app/microservices)
- **Potenzionato da AI**: **[Microsoft Foundry Models Chat (Locale)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Architettura multi-agente**: **Retail Multi-Agent Solution**
- **Enterprise multi-service**: [Microservices (Locale)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Per livello di complessità
- **Principiante**: [Python Flask API (Locale)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermedio**: **[Microsoft Foundry Models Chat (Locale)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Avanzato**: ML Pipeline
- **Enterprise Pronto per la Produzione**: [Microservices (Locale)](../../../examples/container-app/microservices) (Multi-service con code di messaggi), **Retail Multi-Agent Solution** (Sistema multi-agente completo con deployment tramite template ARM)

## 📚 Risorse aggiuntive

### Link alla documentazione
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Esempi della community
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Web App React con API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Job di Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions con Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Migliori pratiche
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuire con esempi

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

**Consiglio**: Inizia con l'esempio più semplice che corrisponde al tuo stack tecnologico, quindi procedi gradualmente verso scenari più complessi. Ogni esempio si basa sui concetti dei precedenti!

## 🚀 Pronto per iniziare?

### Il tuo percorso di apprendimento

1. **Principiante assoluto?** → Inizia con [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Hai conoscenze di base su AZD?** → Prova [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Sviluppi app AI?** → Inizia con [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) o esplora [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ ore)
4. **Hai bisogno di uno stack tecnologico specifico?** → Usa la sezione [Trovare l'esempio giusto](#-finding-the-right-example) sopra

### Prossimi passi

- ✅ Rivedi i [Prerequisiti](#prerequisiti) sopra
- ✅ Scegli un esempio che corrisponda al tuo livello di abilità (vedi [Legenda della complessità](#legenda-della-complessità))
- ✅ Leggi attentamente il README dell'esempio prima di distribuire
- ✅ Imposta un promemoria per eseguire `azd down` dopo i test
- ✅ Condividi la tua esperienza tramite GitHub Issues o Discussions

### Hai bisogno di aiuto?

- 📖 [FAQ](../resources/faq.md) - Domande frequenti
- 🐛 [Guida alla risoluzione dei problemi](../docs/chapter-07-troubleshooting/common-issues.md) - Risolvi i problemi di distribuzione
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Chiedi alla community
- 📚 [Guida allo studio](../resources/study-guide.md) - Rafforza il tuo apprendimento

---

**Navigazione**
- **📚 Home del corso**: [AZD For Beginners](../README.md)
- **📖 Materiale di studio**: [Guida allo studio](../resources/study-guide.md) | [Scheda di riferimento](../resources/cheat-sheet.md) | [Glossario](../resources/glossary.md)
- **🔧 Risorse**: [FAQ](../resources/faq.md) | [Risoluzione dei problemi](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Ultimo aggiornamento: novembre 2025 | [Segnala problemi](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuisci con esempi](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->