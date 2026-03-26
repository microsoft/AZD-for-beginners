# Esempi - Modelli AZD pratici e configurazioni

**Apprendere con esempi - Organizzato per capitolo**
- **📚 Home del corso**: [AZD For Beginners](../README.md)
- **📖 Mappatura dei capitoli**: Esempi organizzati per complessità di apprendimento
- **🚀 Esempio locale**: [Soluzione Retail Multi-Agent](retail-scenario.md)
- **🤖 Esempi AI esterni**: Collegamenti ai repository di Azure Samples

> **📍 IMPORTANTE: Esempi locali vs esterni**  
> Questo repository contiene **4 esempi locali completi** con implementazioni complete:  
> - **Microsoft Foundry Models Chat** (deployment gpt-4.1 con interfaccia chat)  
> - **Container Apps** (API Flask semplice + microservizi)  
> - **Database App** (Web + Database SQL)  
> - **Retail Multi-Agent** (Soluzione AI enterprise)  
>  
> Esempi aggiuntivi sono **riferimenti esterni** a repository Azure-Samples che puoi clonare.

## Introduzione

Questa directory fornisce esempi pratici e riferimenti per aiutarti a imparare Azure Developer CLI tramite pratica hands-on. Lo scenario Retail Multi-Agent è un'implementazione completa pronta per la produzione inclusa in questo repository. Esempi aggiuntivi fanno riferimento agli Azure Samples ufficiali che dimostrano vari pattern AZD.

### Legenda di valutazione della complessità

- ⭐ **Principiante** - Concetti base, singolo servizio, 15-30 minuti
- ⭐⭐ **Intermedio** - Servizi multipli, integrazione database, 30-60 minuti
- ⭐⭐⭐ **Avanzato** - Architettura complessa, integrazione AI, 1-2 ore
- ⭐⭐⭐⭐ **Esperto** - Pronto per la produzione, pattern enterprise, 2+ ore

## 🎯 Cosa c'è effettivamente in questo repository

### ✅ Implementazione locale (Pronta all'uso)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**Distribuzione completa di gpt-4.1 con interfaccia chat inclusa in questo repository**

- **Posizione:** `examples/azure-openai-chat/`
- **Complessità:** ⭐⭐ (Intermedio)
- **Incluso:**
  - Distribuzione completa Microsoft Foundry Models (gpt-4.1)
  - Interfaccia chat da linea di comando in Python
  - Integrazione con Key Vault per chiavi API sicure
  - Template infrastrutturali Bicep
  - Monitoraggio dell'uso dei token e dei costi
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
**Esempi completi di distribuzione dei container inclusi in questo repository**

- **Posizione:** `examples/container-app/`
- **Complessità:** ⭐-⭐⭐⭐⭐ (Da Principiante a Esperto)
- **Incluso:**
  - [Guida principale](container-app/README.md) - Panoramica completa delle distribuzioni dei container
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Esempio REST API base
  - [Microservices Architecture](../../../examples/container-app/microservices) - Distribuzione multi-servizio pronta per la produzione
  - Modelli Avvio Rapido, Produzione e Avanzati
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

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Implementazione completa pronta per la produzione inclusa in questo repository**

- **Posizione:** `examples/retail-multiagent-arm-template/`
- **Complessità:** ⭐⭐⭐⭐ (Avanzato)
- **Incluso:**
  - Template di deploy ARM completo
  - Architettura multi-agent (Customer + Inventory)
  - Integrazione Microsoft Foundry Models
  - AI Search con RAG
  - Monitoraggio completo
  - Script di distribuzione con un clic

**Avvio rapido:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tecnologie:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Esempi esterni di Azure (Clona per usare)

I seguenti esempi sono mantenuti nei repository ufficiali Azure-Samples. Clonali per esplorare diversi pattern AZD:

### Applicazioni semplici (Capitoli 1-2)

| Modello | Repository | Complessità | Servizi |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Locale: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Locale: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
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

| Modello | Repository | Complessità | Focus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Locale: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat AI di base |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework per agent |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Pattern RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI enterprise |

### Database e pattern avanzati (Capitoli 3-8)

| Modello | Repository | Complessità | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrazione database |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Obiettivi di apprendimento

Lavorando su questi esempi, sarai in grado di:
- Esercitare i flussi di lavoro di Azure Developer CLI con scenari applicativi realistici
- Comprendere diverse architetture applicative e le loro implementazioni azd
- Padroneggiare i pattern Infrastructure as Code per vari servizi Azure
- Applicare la gestione delle configurazioni e strategie di deployment specifiche per ambiente
- Implementare monitoraggio, sicurezza e pattern di scalabilità in contesti pratici
- Acquisire esperienza nella risoluzione dei problemi e nel debug di scenari di deployment reali

## Risultati di apprendimento

Al completamento di questi esempi, sarai in grado di:
- Distribuire con fiducia diversi tipi di applicazioni usando Azure Developer CLI
- Adattare i template forniti ai requisiti della tua applicazione
- Progettare e implementare pattern infrastrutturali personalizzati usando Bicep
- Configurare applicazioni multi-servizio complesse con dipendenze adeguate
- Applicare best practice di sicurezza, monitoraggio e prestazioni in scenari reali
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

## Esempi Avvio Rapido

> **💡 Nuovo a AZD?** Inizia con l'esempio #1 (Flask API) - richiede ~20 minuti e insegna i concetti fondamentali.

### Per principianti
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Locale) ⭐  
   Distribuisci una semplice API REST con scale-to-zero  
   **Tempo:** 20-25 minuti | **Costo:** $0-5/month  
   **Imparerai:** Flusso di lavoro azd di base, containerizzazione, probe di integrità  
   **Risultato previsto:** Endpoint API funzionante che restituisce "Hello, World!" con monitoraggio

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Distribuisci un'app web Node.js Express con MongoDB  
   **Tempo:** 25-35 minuti | **Costo:** $10-30/month  
   **Imparerai:** Integrazione database, variabili d'ambiente, stringhe di connessione  
   **Risultato previsto:** App Todo con funzionalità di creare/leggere/aggiornare/eliminare

3. **[Sito statico - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Ospita un sito React statico con Azure Static Web Apps  
   **Tempo:** 20-30 minuti | **Costo:** $0-10/month  
   **Imparerai:** Hosting statico, funzioni serverless, deployment CDN  
   **Risultato previsto:** UI React con backend API, SSL automatico, CDN globale

### Per utenti intermedi
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Locale) ⭐⭐  
   Distribuisci gpt-4.1 con interfaccia chat e gestione sicura delle chiavi API  
   **Tempo:** 35-45 minuti | **Costo:** $50-200/month  
   **Imparerai:** Distribuzione Microsoft Foundry Models, integrazione Key Vault, tracciamento token  
   **Risultato previsto:** Applicazione chat funzionante con gpt-4.1 e monitoraggio dei costi

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Locale) ⭐⭐⭐⭐  
   Architettura multi-service pronta per la produzione  
   **Tempo:** 45-60 minuti | **Costo:** $50-150/month  
   **Imparerai:** Comunicazione tra servizi, accodamento dei messaggi, tracciamento distribuito  
   **Risultato previsto:** Sistema a 2 servizi (API Gateway + Product Service) con monitoraggio

6. **[Database App - C# con Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Applicazione web con API C# e Azure SQL Database  
   **Tempo:** 30-45 minuti | **Costo:** $20-80/month  
   **Imparerai:** Entity Framework, migrazioni del database, sicurezza delle connessioni  
   **Risultato previsto:** API C# con backend Azure SQL e deployment automatico dello schema

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions con trigger HTTP e Cosmos DB  
   **Tempo:** 30-40 minuti | **Costo:** $10-40/month  
   **Imparerai:** Architettura event-driven, scaling serverless, integrazione NoSQL  
   **Risultato previsto:** Function app che risponde a richieste HTTP con storage in Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Applicazione Java multi-service con Container Apps e API gateway  
   **Tempo:** 60-90 minuti | **Costo:** $80-200/month  
   **Imparerai:** Deployment Spring Boot, service mesh, bilanciamento del carico  
   **Risultato previsto:** Sistema Java multi-service con discovery dei servizi e routing

### Template Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - Esempio locale](../../../examples/azure-openai-chat)** ⭐⭐  
   Distribuzione completa gpt-4.1 con interfaccia chat  
   **Tempo:** 35-45 minuti | **Costo:** $50-200/month  
   **Risultato previsto:** Applicazione chat funzionante con tracciamento token e monitoraggio dei costi

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Applicazione chat intelligente con architettura RAG  
   **Tempo:** 60-90 minuti | **Costo:** $100-300/month  
   **Risultato previsto:** Interfaccia chat basata su RAG con ricerca documenti e citazioni

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analisi dei documenti usando servizi Azure AI  
   **Tempo:** 40-60 minuti | **Costo:** $20-80/month  
   **Risultato previsto:** API che estrae testo, tabelle ed entità dai documenti caricati

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Flusso MLOps con Azure Machine Learning  
   **Tempo:** 2-3 ore | **Costo:** $150-500/month  
   **Risultato previsto:** Pipeline ML automatizzata con training, deployment e monitoraggio

### Scenari reali

#### **Retail Multi-Agent Solution** 🆕
**[Guida completa all'implementazione](./retail-scenario.md)**

Una soluzione completa e pronta per la produzione per il supporto clienti multi-agent che dimostra il deployment di applicazioni AI di livello enterprise con AZD. Questo scenario fornisce:
- **Architettura completa**: Sistema multi-agente con agenti specializzati per il servizio clienti e la gestione dell'inventario
- **Infrastruttura di produzione**: Distribuzioni multi-regione di Microsoft Foundry Models, AI Search, Container Apps e monitoraggio completo
- **Template ARM pronto per il deployment**: Distribuzione con un clic con più modalità di configurazione (Minimal/Standard/Premium)
- **Funzionalità avanzate**: validazione di sicurezza red teaming, framework di valutazione degli agenti, ottimizzazione dei costi e guide per il troubleshooting
- **Contesto aziendale reale**: caso d'uso di supporto clienti per un rivenditore con upload di file, integrazione della ricerca e scaling dinamico

**Tecnologie**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complessità**: ⭐⭐⭐⭐ (Avanzato - Pronto per la produzione enterprise)

**Perfetto per**: sviluppatori AI, solution architect e team che costruiscono sistemi multi-agente per la produzione

**Avvio rapido**: Distribuisci la soluzione completa in meno di 30 minuti usando il template ARM incluso con `./deploy.sh -g myResourceGroup`

## 📋 Istruzioni per l'uso

### Prerequisiti

Prima di eseguire qualsiasi esempio:
- ✅ Sottoscrizione Azure con ruolo Owner o Contributor
- ✅ Azure Developer CLI installato ([Guida all'installazione](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop in esecuzione (per esempi con container)
- ✅ Quote Azure appropriate (verifica i requisiti specifici per l'esempio)

> **💰 Avviso sui costi:** Tutti gli esempi creano risorse Azure reali che comportano costi. Consulta i README individuali per le stime dei costi. Ricorda di eseguire `azd down` al termine per evitare costi continui.

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

5. **Verifica il deployment**
   ```bash
   # Ottieni gli endpoint del servizio
   azd env get-values
   
   # Testa l'endpoint (esempio)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Indicatori di successo attesi:**
   - ✅ `azd up` completa senza errori
   - ✅ Endpoint del servizio restituisce HTTP 200
   - ✅ Azure Portal mostra lo stato "Running"
   - ✅ Application Insights riceve telemetria

> **⚠️ Problemi?** Consulta [Problemi comuni](../docs/chapter-07-troubleshooting/common-issues.md) per la risoluzione dei problemi di deployment

### Adattamento degli esempi

Ogni esempio include:
- **README.md** - Istruzioni dettagliate per configurazione e personalizzazione
- **azure.yaml** - Configurazione AZD con commenti
- **infra/** - Template Bicep con spiegazione dei parametri
- **src/** - Codice di esempio dell'applicazione
- **scripts/** - Script di supporto per attività comuni

## 🎯 Obiettivi di apprendimento

### Categorie di esempio

#### **Distribuzioni di base**
- Applicazioni a servizio singolo
- Pattern infrastrutturali semplici
- Gestione della configurazione di base
- Configurazioni di sviluppo a basso costo

#### **Scenari avanzati**
- Architetture multi-servizio
- Configurazioni di rete complesse
- Pattern di integrazione database
- Implementazioni di sicurezza e conformità

#### **Pattern pronti per la produzione**
- Configurazioni ad alta disponibilità
- Monitoraggio e osservabilità
- Integrazione CI/CD
- Configurazioni di disaster recovery

## 📖 Descrizione degli esempi

### Applicazione Web Semplice - Node.js Express
**Tecnologie**: Node.js, Express, MongoDB, Container Apps  
**Complessità**: Principiante  
**Concetti**: Deploy di base, API REST, integrazione con database NoSQL

### Sito statico - React SPA
**Tecnologie**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complessità**: Principiante  
**Concetti**: Hosting statico, backend serverless, sviluppo web moderno

### Container App - Python Flask
**Tecnologie**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complessità**: Principiante  
**Concetti**: Containerizzazione, API REST, scale-to-zero, probe di salute, monitoring  
**Posizione**: [Esempio locale](../../../examples/container-app/simple-flask-api)

### Container App - Architettura a microservizi
**Tecnologie**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complessità**: Avanzato  
**Concetti**: Architettura multi-servizio, comunicazione tra servizi, accodamento dei messaggi, tracing distribuito  
**Posizione**: [Esempio locale](../../../examples/container-app/microservices)

### Applicazione database - C# con Azure SQL
**Tecnologie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complessità**: Intermedio  
**Concetti**: Entity Framework, connessioni al database, sviluppo di API web

### Funzione serverless - Python Azure Functions
**Tecnologie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complessità**: Intermedio  
**Concetti**: Architettura event-driven, computing serverless, sviluppo full-stack

### Microservizi - Java Spring Boot
**Tecnologie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complessità**: Intermedio  
**Concetti**: Comunicazione tra microservizi, sistemi distribuiti, pattern enterprise

### Esempi Microsoft Foundry

#### App di chat Microsoft Foundry Models
**Tecnologie**: Microsoft Foundry Models, Cognitive Search, App Service  
**Complessità**: Intermedio  
**Concetti**: Architettura RAG, ricerca vettoriale, integrazione LLM

#### Elaborazione documenti AI
**Tecnologie**: Azure AI Document Intelligence, Storage, Functions  
**Complessità**: Intermedio  
**Concetti**: Analisi dei documenti, OCR, estrazione dei dati

#### Pipeline di Machine Learning
**Tecnologie**: Azure ML, MLOps, Container Registry  
**Complessità**: Avanzato  
**Concetti**: Addestramento modelli, pipeline di deployment, monitoring

## 🛠 Esempi di configurazione

La directory `configurations/` contiene componenti riutilizzabili:

### Configurazioni ambiente
- Impostazioni per l'ambiente di sviluppo
- Configurazioni per l'ambiente di staging
- Configurazioni pronte per la produzione
- Configurazioni per deployment multi-regione

### Moduli Bicep
- Componenti infrastrutturali riutilizzabili
- Pattern comuni di risorse
- Template hardenizzati per la sicurezza
- Configurazioni ottimizzate per i costi

### Script di supporto
- Automazione della configurazione dell'ambiente
- Script di migrazione del database
- Strumenti di validazione del deployment
- Utility per il monitoraggio dei costi

## 🔧 Guida alla personalizzazione

### Adattare gli esempi al tuo caso d'uso

1. **Verifica i prerequisiti**
   - Verifica i requisiti dei servizi Azure
   - Verifica i limiti della sottoscrizione
   - Comprendi le implicazioni sui costi

2. **Modifica la configurazione**
   - Aggiorna le definizioni dei servizi in `azure.yaml`
   - Personalizza i template Bicep
   - Regola le variabili d'ambiente

3. **Testa a fondo**
   - Distribuisci prima nell'ambiente di sviluppo
   - Valida le funzionalità
   - Testa lo scaling e le prestazioni

4. **Revisione di sicurezza**
   - Rivedi i controlli di accesso
   - Implementa la gestione dei segreti
   - Abilita monitoraggio e alert

## 📊 Matrice di confronto

| Esempio | Servizi | Database | Autenticazione | Monitoraggio | Complessità |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Locale) | 2 | ❌ | Key Vault | Completo | ⭐⭐ |
| **Python Flask API** (Locale) | 1 | ❌ | Base | Completo | ⭐ |
| **Microservices** (Locale) | 5+ | ✅ | Enterprise | Avanzato | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Base | Base | ⭐ |
| React SPA + Functions | 3 | ✅ | Base | Completo | ⭐ |
| Python Flask Container | 2 | ❌ | Base | Completo | ⭐ |
| C# Web API + SQL | 2 | ✅ | Completo | Completo | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Completo | Completo | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Completo | Completo | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Completo | Completo | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Base | Completo | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Completo | Completo | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Locale) | **8+** | **✅** | **Enterprise** | **Avanzato** | **⭐⭐⭐⭐** |

## 🎓 Percorso di apprendimento

### Progressione raccomandata

1. **Inizia con l'app web semplice**
   - Impara i concetti base di AZD
   - Comprendi il flusso di lavoro del deployment
   - Pratica la gestione degli ambienti

2. **Prova il sito statico**
   - Esplora diverse opzioni di hosting
   - Impara l'integrazione con CDN
   - Comprendi la configurazione DNS

3. **Passa a Container App**
   - Impara le basi della containerizzazione
   - Comprendi i concetti di scaling
   - Pratica con Docker

4. **Aggiungi integrazione con il database**
   - Impara il provisioning del database
   - Comprendi le connection string
   - Pratica la gestione dei segreti

5. **Esplora il serverless**
   - Comprendi l'architettura event-driven
   - Impara trigger e binding
   - Pratica con le API

6. **Costruisci microservizi**
   - Impara la comunicazione tra servizi
   - Comprendi i sistemi distribuiti
   - Pratica deployment complessi

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
- **Produzione enterprise**: [Microservices (Locale)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Per pattern architetturale
- **API REST semplice**: [Python Flask API (Locale)](../../../examples/container-app/simple-flask-api)
- **Monolitico**: Node.js Express Todo, C# Web API + SQL
- **Statico + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservizi**: [Production Microservices (Locale)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerizzati**: [Python Flask (Locale)](../../../examples/container-app/simple-flask-api), [Microservices (Locale)](../../../examples/container-app/microservices)
- **Potenziato da AI**: **[Microsoft Foundry Models Chat (Locale)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Architettura multi-agente**: **Retail Multi-Agent Solution**
- **Enterprise multi-servizio**: [Microservices (Locale)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Per livello di complessità
- **Principiante**: [Python Flask API (Locale)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermedio**: **[Microsoft Foundry Models Chat (Locale)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Avanzato**: ML Pipeline
- **Pronto per la produzione enterprise**: [Microservices (Locale)](../../../examples/container-app/microservices) (Multi-service con message queuing), **Retail Multi-Agent Solution** (Sistema multi-agente completo con deployment tramite template ARM)

## 📚 Risorse aggiuntive

### Link alla documentazione
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Documentazione Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centro architettura Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Esempi della community
- [Esempi Azure - Template AZD](https://github.com/Azure-Samples/azd-templates)
- [Template Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galleria Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [App Todo con C# e Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [App Todo con Python e MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [App Todo con Node.js e PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [App Web React con API in C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Job di Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions con Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Buone pratiche
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuire con esempi

Hai un esempio utile da condividere? Accogliamo contributi!

### Linee guida per l'invio
1. Segui la struttura di directory stabilita
2. Includere un README.md completo
3. Aggiungi commenti ai file di configurazione
4. Esegui test approfonditi prima dell'invio
5. Includi stime dei costi e prerequisiti

### Struttura del template di esempio
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

**Suggerimento professionale**: Inizia con l'esempio più semplice che corrisponde al tuo stack tecnologico, poi procedi gradualmente verso scenari più complessi. Ogni esempio si basa sui concetti dei precedenti!

## 🚀 Pronto per iniziare?

### Il tuo percorso di apprendimento

1. **Principiante assoluto?** → Inizia con [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Hai conoscenze di base di AZD?** → Prova [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Stai creando app AI?** → Inizia con [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) o esplora [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ ore)
4. **Hai bisogno di uno stack tecnologico specifico?** → Usa la sezione [Trovare l'esempio giusto](#-finding-the-right-example) sopra

### Prossimi passi

- ✅ Rivedi [Prerequisiti](#prerequisiti) sopra
- ✅ Scegli un esempio che corrisponda al tuo livello di competenza (vedi [Legenda di complessità](#legenda-di-valutazione-della-complessità))
- ✅ Leggi attentamente il README dell'esempio prima di distribuire
- ✅ Imposta un promemoria per eseguire `azd down` dopo i test
- ✅ Condividi la tua esperienza tramite GitHub Issues o Discussions

### Hai bisogno di aiuto?

- 📖 [FAQ](../resources/faq.md) - Risposte alle domande comuni
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - Risolvi i problemi di distribuzione
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Chiedi alla community
- 📚 [Study Guide](../resources/study-guide.md) - Rafforza il tuo apprendimento

---

**Navigazione**
- **📚 Home del corso**: [AZD per principianti](../README.md)
- **📖 Materiali di studio**: [Guida di studio](../resources/study-guide.md) | [Scheda di riferimento](../resources/cheat-sheet.md) | [Glossario](../resources/glossary.md)
- **🔧 Risorse**: [FAQ](../resources/faq.md) | [Risoluzione dei problemi](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Ultimo aggiornamento: novembre 2025 | [Segnala problemi](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuisci con esempi](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica basato su IA [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per l'accuratezza, si prega di essere consapevoli che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->