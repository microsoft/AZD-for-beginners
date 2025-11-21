<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a896781acb2a7bebb3c4c66c4f46e7f",
  "translation_date": "2025-11-20T22:02:32+00:00",
  "source_file": "examples/README.md",
  "language_code": "it"
}
-->
# Esempi - Modelli e Configurazioni Pratiche AZD

**Imparare con gli Esempi - Organizzati per Capitolo**
- **📚 Home del Corso**: [AZD Per Principianti](../README.md)
- **📖 Mappatura dei Capitoli**: Esempi organizzati per complessità di apprendimento
- **🚀 Esempio Locale**: [Soluzione Multi-Agente per il Retail](retail-scenario.md)
- **🤖 Esempi AI Esterni**: Link ai repository Azure Samples

> **📍 IMPORTANTE: Esempi Locali vs Esterni**  
> Questo repository contiene **4 esempi locali completi** con implementazioni complete:  
> - **Azure OpenAI Chat** (Distribuzione GPT-4 con interfaccia chat)  
> - **Container Apps** (API Flask semplice + Microservizi)  
> - **App Database** (Web + Database SQL)  
> - **Retail Multi-Agent** (Soluzione AI per aziende)  
>  
> Gli esempi aggiuntivi sono **riferimenti esterni** ai repository Azure-Samples che puoi clonare.

## Introduzione

Questa directory fornisce esempi pratici e riferimenti per aiutarti a imparare Azure Developer CLI attraverso la pratica. Lo scenario Multi-Agente per il Retail è un'implementazione completa e pronta per la produzione inclusa in questo repository. Gli esempi aggiuntivi fanno riferimento agli Azure Samples ufficiali che dimostrano vari modelli AZD.

### Legenda della Complessità

- ⭐ **Principiante** - Concetti di base, servizio singolo, 15-30 minuti
- ⭐⭐ **Intermedio** - Servizi multipli, integrazione database, 30-60 minuti
- ⭐⭐⭐ **Avanzato** - Architettura complessa, integrazione AI, 1-2 ore
- ⭐⭐⭐⭐ **Esperto** - Pronto per la produzione, modelli aziendali, 2+ ore

## 🎯 Cosa Contiene Effettivamente Questo Repository

### ✅ Implementazione Locale (Pronta all'Uso)

#### [Applicazione Chat Azure OpenAI](azure-openai-chat/README.md) 🆕
**Distribuzione completa GPT-4 con interfaccia chat inclusa in questo repository**

- **Posizione:** `examples/azure-openai-chat/`
- **Complessità:** ⭐⭐ (Intermedio)
- **Cosa è Incluso:**
  - Distribuzione completa Azure OpenAI (GPT-4)
  - Interfaccia chat a riga di comando in Python
  - Integrazione Key Vault per chiavi API sicure
  - Modelli di infrastruttura Bicep
  - Monitoraggio dell'uso dei token e dei costi
  - Limitazione del tasso e gestione degli errori

**Avvio Rapido:**
```bash
# Naviga verso l'esempio
cd examples/azure-openai-chat

# Distribuisci tutto
azd up

# Installa le dipendenze e inizia a chattare
pip install -r src/requirements.txt
python src/chat.py
```

**Tecnologie:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Esempi di Container App](container-app/README.md) 🆕
**Esempi completi di distribuzione di container inclusi in questo repository**

- **Posizione:** `examples/container-app/`
- **Complessità:** ⭐-⭐⭐⭐⭐ (Da Principiante ad Avanzato)
- **Cosa è Incluso:**
  - [Guida Principale](container-app/README.md) - Panoramica completa delle distribuzioni di container
  - [API Flask Semplice](../../../examples/container-app/simple-flask-api) - Esempio di API REST di base
  - [Architettura Microservizi](../../../examples/container-app/microservices) - Distribuzione multi-servizio pronta per la produzione
  - Modelli di Avvio Rapido, Produzione e Avanzati
  - Monitoraggio, sicurezza e ottimizzazione dei costi

**Avvio Rapido:**
```bash
# Visualizza guida principale
cd examples/container-app

# Distribuisci API Flask semplice
cd simple-flask-api
azd up

# Distribuisci esempio di microservizi
cd ../microservices
azd up
```

**Tecnologie:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Soluzione Multi-Agente per il Retail](retail-scenario.md) 🆕
**Implementazione completa pronta per la produzione inclusa in questo repository**

- **Posizione:** `examples/retail-multiagent-arm-template/`
- **Complessità:** ⭐⭐⭐⭐ (Avanzato)
- **Cosa è Incluso:**
  - Modello di distribuzione ARM completo
  - Architettura multi-agente (Cliente + Inventario)
  - Integrazione Azure OpenAI
  - Ricerca AI con RAG
  - Monitoraggio completo
  - Script di distribuzione con un clic

**Avvio Rapido:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tecnologie:** Azure OpenAI, Ricerca AI, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Azure Samples Esterni (Clonare per Usare)

Gli esempi seguenti sono mantenuti nei repository ufficiali Azure-Samples. Clonali per esplorare diversi modelli AZD:

### Applicazioni Semplici (Capitoli 1-2)

| Modello | Repository | Complessità | Servizi |
|:--------|:-----------|:------------|:--------|
| **API Flask Python** | [Locale: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservizi** | [Locale: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-servizio, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Container Flask Python** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Come Usare:**
```bash
# Clona un esempio qualsiasi
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Distribuisci
azd up
```

### Esempi di Applicazioni AI (Capitoli 2, 5, 8)

| Modello | Repository | Complessità | Focus |
|:--------|:-----------|:------------|:------|
| **Azure OpenAI Chat** | [Locale: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Distribuzione GPT-4 |
| **Avvio Rapido AI Chat** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat AI di base |
| **Agenti AI** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework per agenti |
| **Demo Ricerca + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Modello RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI per aziende |

### Database e Modelli Avanzati (Capitoli 3-8)

| Modello | Repository | Complessità | Focus |
|:--------|:-----------|:------------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrazione database |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Serverless NoSQL |
| **Microservizi Java** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-servizio |
| **Pipeline ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Obiettivi di Apprendimento

Lavorando su questi esempi, potrai:
- Praticare i flussi di lavoro Azure Developer CLI con scenari applicativi realistici
- Comprendere diverse architetture applicative e le loro implementazioni azd
- Padroneggiare i modelli di Infrastructure as Code per vari servizi Azure
- Applicare strategie di gestione della configurazione e distribuzione specifica per ambiente
- Implementare modelli di monitoraggio, sicurezza e scalabilità in contesti pratici
- Acquisire esperienza con il troubleshooting e il debugging di scenari di distribuzione reali

## Risultati di Apprendimento

Completando questi esempi, sarai in grado di:
- Distribuire vari tipi di applicazioni utilizzando Azure Developer CLI con sicurezza
- Adattare i modelli forniti alle tue esigenze applicative
- Progettare e implementare modelli di infrastruttura personalizzati utilizzando Bicep
- Configurare applicazioni multi-servizio complesse con dipendenze corrette
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

## Esempi di Avvio Rapido

> **💡 Nuovo in AZD?** Inizia con l'esempio #1 (API Flask) - richiede ~20 minuti e insegna i concetti fondamentali.

### Per Principianti
1. **[Container App - API Flask Python](../../../examples/container-app/simple-flask-api)** (Locale) ⭐  
   Distribuisci una semplice API REST con scale-to-zero  
   **Tempo:** 20-25 minuti | **Costo:** $0-5/mese  
   **Cosa Imparerai:** Flusso di lavoro azd di base, containerizzazione, sonde di salute  
   **Risultato Atteso:** Endpoint API funzionante che restituisce "Hello, World!" con monitoraggio

2. **[Web App Semplice - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Distribuisci un'applicazione web Node.js Express con MongoDB  
   **Tempo:** 25-35 minuti | **Costo:** $10-30/mese  
   **Cosa Imparerai:** Integrazione database, variabili di ambiente, stringhe di connessione  
   **Risultato Atteso:** App lista di cose da fare con funzionalità di creazione/lettura/aggiornamento/eliminazione

3. **[Sito Statico - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Ospita un sito statico React con Azure Static Web Apps  
   **Tempo:** 20-30 minuti | **Costo:** $0-10/mese  
   **Cosa Imparerai:** Hosting statico, funzioni serverless, distribuzione CDN  
   **Risultato Atteso:** UI React con backend API, SSL automatico, CDN globale

### Per Utenti Intermedi
4. **[Applicazione Chat Azure OpenAI](../../../examples/azure-openai-chat)** (Locale) ⭐⭐  
   Distribuisci GPT-4 con interfaccia chat e gestione sicura delle chiavi API  
   **Tempo:** 35-45 minuti | **Costo:** $50-200/mese  
   **Cosa Imparerai:** Distribuzione Azure OpenAI, integrazione Key Vault, monitoraggio dei token  
   **Risultato Atteso:** Applicazione chat funzionante con GPT-4 e monitoraggio dei costi

5. **[Container App - Microservizi](../../../examples/container-app/microservices)** (Locale) ⭐⭐⭐⭐  
   Architettura multi-servizio pronta per la produzione  
   **Tempo:** 45-60 minuti | **Costo:** $50-150/mese  
   **Cosa Imparerai:** Comunicazione tra servizi, code di messaggi, tracciamento distribuito  
   **Risultato Atteso:** Sistema a 2 servizi (API Gateway + Servizio Prodotti) con monitoraggio

6. **[App Database - C# con Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Applicazione web con API C# e Database SQL Azure  
   **Tempo:** 30-45 minuti | **Costo:** $20-80/mese  
   **Cosa Imparerai:** Entity Framework, migrazioni database, sicurezza delle connessioni  
   **Risultato Atteso:** API C# con backend SQL Azure, distribuzione automatica dello schema

7. **[Funzione Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Funzioni Azure Python con trigger HTTP e Cosmos DB  
   **Tempo:** 30-40 minuti | **Costo:** $10-40/mese  
   **Cosa Imparerai:** Architettura basata su eventi, scalabilità serverless, integrazione NoSQL  
   **Risultato Atteso:** App funzione che risponde a richieste HTTP con archiviazione Cosmos DB

8. **[Microservizi - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Applicazione Java multi-servizio con Container Apps e API Gateway  
   **Tempo:** 60-90 minuti | **Costo:** $80-200/mese  
   **Cosa Imparerai:** Distribuzione Spring Boot, service mesh, bilanciamento del carico  
   **Risultato Atteso:** Sistema Java multi-servizio con scoperta e instradamento dei servizi

### Modelli Azure AI Foundry

1. **[App Chat Azure OpenAI - Esempio Locale](../../../examples/azure-openai-chat)** ⭐⭐  
   Distribuzione completa GPT-4 con interfaccia chat  
   **Tempo:** 35-45 minuti | **Costo:** $50-200/mese  
   **Risultato Atteso:** Applicazione chat funzionante con monitoraggio dei token e dei costi

2. **[Demo Ricerca + OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Applicazione chat intelligente con architettura RAG  
   **Tempo:** 60-90 minuti | **Costo:** $100-300/mese  
   **Risultato Atteso:** Interfaccia chat basata su RAG con ricerca documenti e citazioni

3. **[Elaborazione Documenti AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analisi documenti utilizzando i servizi AI di Azure  
   **Tempo:** 40-60 minuti | **Costo:** $20-80/mese  
   **Risultato Atteso:** API che estrae testo, tabelle e entità da documenti caricati

4. **[Pipeline Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Flusso di lavoro MLOps con Azure Machine Learning  
   **Tempo:** 2-3 ore | **Costo:** $150-500/mese  
   **Risultato Atteso:** Pipeline ML automatizzata con addestramento, distribuzione e monitoraggio

### Scenari Reali

#### **Soluzione Multi-Agente per il Retail** 🆕
**[Guida Completa all'Implementazione](./retail-scenario.md)**

Una soluzione completa e pronta per la produzione per il supporto clienti multi-agente che dimostra la distribuzione di applicazioni AI di livello aziendale con AZD. Questo scenario fornisce:

- **Architettura Completa**: Sistema multi-agente con agenti specializzati per il servizio clienti e la gestione dell'inventario
- **Infrastruttura di Produzione**: Deployment Azure OpenAI multi-regione, AI Search, Container Apps e monitoraggio completo  
- **Template ARM Pronto per il Deployment**: Deployment con un clic e modalità di configurazione multiple (Minimale/Standard/Premium)  
- **Funzionalità Avanzate**: Validazione di sicurezza Red Teaming, framework di valutazione degli agenti, ottimizzazione dei costi e guide per la risoluzione dei problemi  
- **Contesto Reale di Business**: Caso d'uso per il supporto clienti di un rivenditore con caricamento file, integrazione di ricerca e scalabilità dinamica  

**Tecnologie**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Complessità**: ⭐⭐⭐⭐ (Avanzato - Pronto per la Produzione Enterprise)  

**Perfetto per**: Sviluppatori AI, architetti di soluzioni e team che costruiscono sistemi multi-agente di produzione  

**Avvio Rapido**: Distribuisci la soluzione completa in meno di 30 minuti utilizzando il template ARM incluso con `./deploy.sh -g myResourceGroup`  

## 📋 Istruzioni per l'Uso  

### Prerequisiti  

Prima di eseguire qualsiasi esempio:  
- ✅ Abbonamento Azure con accesso Owner o Contributor  
- ✅ CLI Azure Developer installata ([Guida all'Installazione](../docs/getting-started/installation.md))  
- ✅ Docker Desktop in esecuzione (per esempi con container)  
- ✅ Quote Azure appropriate (controlla i requisiti specifici dell'esempio)  

> **💰 Avviso sui Costi:** Tutti gli esempi creano risorse Azure reali che comportano costi. Consulta i file README individuali per le stime dei costi. Ricorda di eseguire `azd down` al termine per evitare costi continuativi.  

### Esecuzione degli Esempi in Locale  

1. **Clona o Copia l'Esempio**  
   ```bash
   # Naviga all'esempio desiderato
   cd examples/simple-web-app
   ```
  
2. **Inizializza l'Ambiente AZD**  
   ```bash
   # Inizializza con il modello esistente
   azd init
   
   # Oppure crea un nuovo ambiente
   azd env new my-environment
   ```
  
3. **Configura l'Ambiente**  
   ```bash
   # Imposta le variabili richieste
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **Distribuisci**  
   ```bash
   # Distribuire infrastruttura e applicazione
   azd up
   ```
  
5. **Verifica la Distribuzione**  
   ```bash
   # Ottieni gli endpoint del servizio
   azd env get-values
   
   # Testa l'endpoint (esempio)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Indicatori di Successo Attesi:**  
   - ✅ `azd up` completato senza errori  
   - ✅ Endpoint del servizio restituisce HTTP 200  
   - ✅ Azure Portal mostra lo stato "In esecuzione"  
   - ✅ Application Insights riceve telemetria  

> **⚠️ Problemi?** Consulta [Problemi Comuni](../docs/troubleshooting/common-issues.md) per la risoluzione dei problemi di distribuzione  

### Adattamento degli Esempi  

Ogni esempio include:  
- **README.md** - Istruzioni dettagliate per configurazione e personalizzazione  
- **azure.yaml** - Configurazione AZD con commenti  
- **infra/** - Template Bicep con spiegazioni sui parametri  
- **src/** - Codice applicativo di esempio  
- **scripts/** - Script di supporto per attività comuni  

## 🎯 Obiettivi di Apprendimento  

### Categorie di Esempi  

#### **Distribuzioni Base**  
- Applicazioni con un solo servizio  
- Pattern di infrastruttura semplici  
- Gestione di configurazioni di base  
- Configurazioni di sviluppo economiche  

#### **Scenari Avanzati**  
- Architetture multi-servizio  
- Configurazioni di rete complesse  
- Pattern di integrazione con database  
- Implementazioni di sicurezza e conformità  

#### **Pattern Pronti per la Produzione**  
- Configurazioni ad alta disponibilità  
- Monitoraggio e osservabilità  
- Integrazione CI/CD  
- Configurazioni per il recupero da disastri  

## 📖 Descrizioni degli Esempi  

### Applicazione Web Semplice - Node.js Express  
**Tecnologie**: Node.js, Express, MongoDB, Container Apps  
**Complessità**: Principiante  
**Concetti**: Distribuzione di base, REST API, integrazione con database NoSQL  

### Sito Web Statico - React SPA  
**Tecnologie**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complessità**: Principiante  
**Concetti**: Hosting statico, backend serverless, sviluppo web moderno  

### Container App - Python Flask  
**Tecnologie**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complessità**: Principiante  
**Concetti**: Containerizzazione, REST API, scale-to-zero, sonde di salute, monitoraggio  
**Posizione**: [Esempio Locale](../../../examples/container-app/simple-flask-api)  

### Container App - Architettura Microservizi  
**Tecnologie**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complessità**: Avanzato  
**Concetti**: Architettura multi-servizio, comunicazione tra servizi, code di messaggi, tracciamento distribuito  
**Posizione**: [Esempio Locale](../../../examples/container-app/microservices)  

### Applicazione Database - C# con Azure SQL  
**Tecnologie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complessità**: Intermedio  
**Concetti**: Entity Framework, connessioni al database, sviluppo di web API  

### Funzione Serverless - Python Azure Functions  
**Tecnologie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complessità**: Intermedio  
**Concetti**: Architettura basata su eventi, calcolo serverless, sviluppo full-stack  

### Microservizi - Java Spring Boot  
**Tecnologie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complessità**: Intermedio  
**Concetti**: Comunicazione tra microservizi, sistemi distribuiti, pattern enterprise  

### Esempi Azure AI Foundry  

#### Azure OpenAI Chat App  
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
- Impostazioni per ambiente di sviluppo  
- Configurazioni per ambiente di staging  
- Configurazioni pronte per la produzione  
- Setup di distribuzione multi-regione  

### Moduli Bicep  
- Componenti di infrastruttura riutilizzabili  
- Pattern di risorse comuni  
- Template con sicurezza avanzata  
- Configurazioni ottimizzate per i costi  

### Script di Supporto  
- Automazione per setup dell'ambiente  
- Script per migrazione database  
- Strumenti di validazione della distribuzione  
- Utility per monitoraggio dei costi  

## 🔧 Guida alla Personalizzazione  

### Adattamento degli Esempi al Tuo Caso d'Uso  

1. **Revisione dei Prerequisiti**  
   - Controlla i requisiti dei servizi Azure  
   - Verifica i limiti dell'abbonamento  
   - Comprendi le implicazioni sui costi  

2. **Modifica della Configurazione**  
   - Aggiorna le definizioni dei servizi in `azure.yaml`  
   - Personalizza i template Bicep  
   - Modifica le variabili di ambiente  

3. **Test Approfonditi**  
   - Distribuisci prima in ambiente di sviluppo  
   - Valida la funzionalità  
   - Testa scalabilità e prestazioni  

4. **Revisione della Sicurezza**  
   - Controlla i controlli di accesso  
   - Implementa la gestione dei segreti  
   - Abilita monitoraggio e avvisi  

## 📊 Tabella Comparativa  

| Esempio | Servizi | Database | Autenticazione | Monitoraggio | Complessità |  
|---------|----------|----------|----------------|--------------|-------------|  
| **Azure OpenAI Chat** (Locale) | 2 | ❌ | Key Vault | Completo | ⭐⭐ |  
| **Python Flask API** (Locale) | 1 | ❌ | Base | Completo | ⭐ |  
| **Microservizi** (Locale) | 5+ | ✅ | Enterprise | Avanzato | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Base | Base | ⭐ |  
| React SPA + Functions | 3 | ✅ | Base | Completo | ⭐ |  
| Python Flask Container | 2 | ❌ | Base | Completo | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Completo | Completo | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Completo | Completo | ⭐⭐ |  
| Java Microservizi | 5+ | ✅ | Completo | Completo | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | Completo | Completo | ⭐⭐⭐ |  
| Elaborazione Documenti AI | 2 | ❌ | Base | Completo | ⭐⭐ |  
| Pipeline ML | 4+ | ✅ | Completo | Completo | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (Locale) | **8+** | **✅** | **Enterprise** | **Avanzato** | **⭐⭐⭐⭐** |  

## 🎓 Percorso di Apprendimento  

### Progressione Consigliata  

1. **Inizia con Applicazione Web Semplice**  
   - Impara i concetti base di AZD  
   - Comprendi il flusso di distribuzione  
   - Pratica la gestione degli ambienti  

2. **Prova Sito Web Statico**  
   - Esplora opzioni di hosting diverse  
   - Impara l'integrazione CDN  
   - Comprendi la configurazione DNS  

3. **Passa a Container App**  
   - Impara le basi della containerizzazione  
   - Comprendi i concetti di scalabilità  
   - Pratica con Docker  

4. **Aggiungi Integrazione Database**  
   - Impara il provisioning del database  
   - Comprendi le stringhe di connessione  
   - Pratica la gestione dei segreti  

5. **Esplora Serverless**  
   - Comprendi l'architettura basata su eventi  
   - Impara i trigger e i binding  
   - Pratica con le API  

6. **Costruisci Microservizi**  
   - Impara la comunicazione tra servizi  
   - Comprendi i sistemi distribuiti  
   - Pratica distribuzioni complesse  

## 🔍 Trovare l'Esempio Giusto  

### Per Stack Tecnologico  
- **Container Apps**: [Python Flask API (Locale)](../../../examples/container-app/simple-flask-api), [Microservizi (Locale)](../../../examples/container-app/microservices), Java Microservizi  
- **Node.js**: Node.js Express Todo App, [Microservizi API Gateway (Locale)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Locale)](../../../examples/container-app/simple-flask-api), [Microservizi Product Service (Locale)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservizi Order Service (Locale)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, Pipeline ML  
- **Go**: [Microservizi User Service (Locale)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservizi  
- **React**: React SPA + Functions  
- **Container**: [Python Flask (Locale)](../../../examples/container-app/simple-flask-api), [Microservizi (Locale)](../../../examples/container-app/microservices), Java Microservizi  
- **Database**: [Microservizi (Locale)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Locale)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, Elaborazione Documenti AI, Pipeline ML, **Retail Multi-Agent Solution**  
- **Sistemi Multi-Agente**: **Retail Multi-Agent Solution**  
- **Integrazione OpenAI**: **[Azure OpenAI Chat (Locale)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Produzione Enterprise**: [Microservizi (Locale)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Per Pattern Architetturale  
- **REST API Semplice**: [Python Flask API (Locale)](../../../examples/container-app/simple-flask-api)  
- **Monolitico**: Node.js Express Todo, C# Web API + SQL  
- **Statico + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Microservizi**: [Microservizi di Produzione (Locale)](../../../examples/container-app/microservices), Java Spring Boot Microservizi  
- **Containerizzato**: [Python Flask (Locale)](../../../examples/container-app/simple-flask-api), [Microservizi (Locale)](../../../examples/container-app/microservices)  
- **AI-Powered**: **[Azure OpenAI Chat (Locale)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, Elaborazione Documenti AI, Pipeline ML, **Retail Multi-Agent Solution**  
- **Architettura Multi-Agente**: **Retail Multi-Agent Solution**  
- **Multi-Servizio Enterprise**: [Microservizi (Locale)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Per Livello di Complessità  
- **Principiante**: [Python Flask API (Locale)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Intermedio**: **[Azure OpenAI Chat (Locale)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservizi, Azure OpenAI Chat App, Elaborazione Documenti AI  
- **Avanzato**: Pipeline ML  
- **Pronto per la Produzione Enterprise**: [Microservizi (Locale)](../../../examples/container-app/microservices) (Multi-servizio con code di messaggi), **Retail Multi-Agent Solution** (Sistema multi-agente completo con distribuzione tramite template ARM)  

## 📚 Risorse Aggiuntive  

### Link alla Documentazione  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Template AZD Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [Documentazione Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Centro Architettura Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Esempi della Comunità  
- [Template AZD Azure Samples](https://github.com/Azure-Samples/azd-templates)  
- [Template Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [Galleria CLI Azure Developer](https://azure.github.io/awesome-azd/)  
- [Todo App con C# e Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App con Python e MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [App Todo con Node.js e PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [App Web React con API in C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Job di Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions con Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Best Practices
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuire con Esempi

Hai un esempio utile da condividere? Accettiamo volentieri contributi!

### Linee Guida per la Presentazione
1. Segui la struttura delle directory stabilita
2. Includi un README.md completo
3. Aggiungi commenti ai file di configurazione
4. Testa accuratamente prima di inviare
5. Includi stime dei costi e prerequisiti

### Struttura del Template di Esempio
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

**Consiglio Pro**: Inizia con l'esempio più semplice che corrisponde al tuo stack tecnologico, poi passa gradualmente a scenari più complessi. Ogni esempio si basa sui concetti dei precedenti!

## 🚀 Pronto per Iniziare?

### Il Tuo Percorso di Apprendimento

1. **Completamente Principiante?** → Inizia con [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minuti)
2. **Hai Conoscenze di Base su AZD?** → Prova [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minuti)
3. **Stai Creando App AI?** → Inizia con [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minuti) o esplora [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ ore)
4. **Hai Bisogno di uno Stack Tecnologico Specifico?** → Usa la sezione [Trovare l'Esempio Giusto](../../../examples) sopra

### Prossimi Passi

- ✅ Rivedi i [Prerequisiti](../../../examples) sopra
- ✅ Scegli un esempio che corrisponde al tuo livello di competenza (vedi [Legenda della Complessità](../../../examples))
- ✅ Leggi attentamente il README dell'esempio prima di procedere con il deployment
- ✅ Imposta un promemoria per eseguire `azd down` dopo i test
- ✅ Condividi la tua esperienza tramite GitHub Issues o Discussions

### Hai Bisogno di Aiuto?

- 📖 [FAQ](../resources/faq.md) - Risposte alle domande comuni
- 🐛 [Guida alla Risoluzione dei Problemi](../docs/troubleshooting/common-issues.md) - Risolvi problemi di deployment
- 💬 [Discussioni su GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Chiedi alla community
- 📚 [Guida di Studio](../resources/study-guide.md) - Rafforza il tuo apprendimento

---

**Navigazione**
- **📚 Home del Corso**: [AZD For Beginners](../README.md)
- **📖 Materiali di Studio**: [Guida di Studio](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossario](../resources/glossary.md)
- **🔧 Risorse**: [FAQ](../resources/faq.md) | [Risoluzione dei Problemi](../docs/troubleshooting/common-issues.md)

---

*Ultimo Aggiornamento: Novembre 2025 | [Segnala Problemi](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuisci con Esempi](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si consiglia una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->