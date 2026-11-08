# Integrazione Microsoft Foundry con AZD

**Navigazione Capitoli:**
- **📚 Home del Corso**: [AZD per Principianti](../../README.md)
- **📖 Capitolo Corrente**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Capitolo Precedente**: [Capitolo 1: Il Tuo Primo Progetto](../chapter-01-foundation/first-project.md)
- **➡️ Successivo**: [Agenti AI](agents.md)
- **🚀 Capitolo Successivo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

## Panoramica

Questa guida dimostra come integrare i servizi Microsoft Foundry con Azure Developer CLI (AZD) per implementazioni semplificate di applicazioni AI. Microsoft Foundry fornisce una piattaforma completa per costruire, distribuire e gestire applicazioni AI, mentre AZD semplifica il processo di infrastruttura e distribuzione.

## Cos'è Microsoft Foundry?

Microsoft Foundry è la piattaforma unificata di Microsoft per lo sviluppo AI che include:

- **Catalogo Modelli**: Accesso a modelli AI all'avanguardia
- **Prompt Flow**: Designer visuale per flussi di lavoro AI
- **Portale Microsoft Foundry**: Ambiente di sviluppo integrato per applicazioni AI
- **Opzioni di Distribuzione**: Varie opzioni di hosting e scalabilità
- **Sicurezza e Sicurezza**: Funzionalità AI responsabile integrate

## AZD + Microsoft Foundry: Meglio Insieme

| Funzionalità | Microsoft Foundry | Vantaggio dell'Integrazione AZD |
|---------|-----------------|------------------------|
| **Distribuzione Modelli** | Distribuzione manuale nel portale | Distribuzioni automatizzate e ripetibili |
| **Infrastruttura** | Provisioning con clic | Infrastruttura come codice (Bicep) |
| **Gestione Ambienti** | Focus su ambiente singolo | Multi-ambiente (dev/staging/prod) |
| **Integrazione CI/CD** | Limitata | Supporto nativo per GitHub Actions |
| **Gestione Costi** | Monitoraggio base | Ottimizzazione dei costi specifica per ambiente |

## Prerequisiti

- Sottoscrizione Azure con permessi appropriati
- Azure Developer CLI installato
- Accesso ai servizi Microsoft Foundry Models
- Familiarità di base con Microsoft Foundry

> **Revisione rilascio (2026-11-04):** La guida AI CLI è stata verificata con `azd` `1.37.2`, agenti `1.0.0-beta.23` e documentazione/sorgente valutazioni `1.0.0-beta.2`. Usare `azd >= 1.37.0` per il flusso di lavoro combinato. Vedi [cambiamenti e correzioni di rilascio](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); questa revisione non certifica ogni template o esempio SDK contro una distribuzione live.

## Modelli di Integrazione Principali

**Ambito degli esempi:** Il Bicep sottostante contiene frammenti illustrativi di risorse, non un template completo distribuibile. Il template contenente deve definire nomi, `location`, risorse referenziate, identità, output e hosting applicazioni. Usare un esempio collegato come punto di partenza eseguibile. Gli esempi Bash richiedono autenticazione Azure CLI separata da `azd auth login`.

### Modello 1: Integrazione Microsoft Foundry Models

**Caso d'Uso**: Distribuire applicazioni chat con modelli Azure OpenAI in Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

**Infrastruttura (main.bicep):**
```bicep
// Microsoft Foundry Models Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: true
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

Il chiamante necessita di un'identità gestita allegata e `Cognitive Services OpenAI User` a livello di account; disabilitare le chiavi non concede accesso. Verificare disponibilità regione/modello/SKU e quota prima della distribuzione.

### Modello 2: Integrazione AI Search + RAG

**Caso d'Uso**: Distribuire applicazioni di generazione aumentata da ricerca (RAG)

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

```

Non esiste una risorsa ARM `Microsoft.Search/searchServices/dataConnections` per questa integrazione. Configurare un indice Search, sorgente dati, indicizzatore/skillset o vectorizer tramite le API di data-plane Search supportate. Se Search chiama un modello embedding, abilitarne l'identità gestita, concedere il ruolo modello pertinente e configurare la sua skill embedding/vectorizer. Vedi [vettorizzazione integrata](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Modello 3: Integrazione Document Intelligence

**Caso d'Uso**: Flussi di lavoro per elaborazione e analisi documenti

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 Modelli di Configurazione

### Configurazione Variabili d'Ambiente

Tranne per le impostazioni AZD documentate come `AZURE_LOCATION`, questi sono **nomi input personalizzati del template**. Non hanno effetto a meno che il template/applicazione non li consumi tramite parametri e mappature ambiente host. Per `azure-search-openai-demo`, usare i nomi reali come `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` e `AZURE_SEARCH_SERVICE_SKU` invece. La capacità modello non è SKU account.

**Configurazione Produzione:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configurazione Sviluppo:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Configurazione Sicura con Key Vault

Preferire Entra ID con autenticazione chiave locale disabilitata. Quanto segue è solo un **alternativa legacy di autenticazione con chiave** per applicazioni che richiedono chiavi: necessita di un account con autenticazione chiave abilitata, identità applicazione allegata al suo host e accesso/rete Key Vault funzionanti. Non combinare il recupero chiave con `disableLocalAuth: true` aspettandosi che le chiamate basate su chiave funzionino.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## Flussi di Lavoro di Distribuzione

### Estensioni AZD per Foundry

AZD fornisce estensioni che aggiungono capacità specifiche per AI per lavorare con i servizi Microsoft Foundry:

```bash
# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# List installed extensions
azd extension list --installed

# Inspect the currently installed agent extension version
azd extension show azure.ai.agents
```

Le estensioni AI sono ancora in rapido sviluppo in anteprima. Se un comando si comporta diversamente da quanto mostrato qui, aggiornare l'estensione rilevante prima di risolvere problemi nel progetto stesso.

### Distribuzione Agent-First con `azd ai`

Usare `azd ai agent init` in modo interattivo, o adottare un attuale template progetto agente `azure.yaml` collegato a Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` sostituisce la grafia deprecata `--manifest`/`-m`; manifest legacy e configurazione agente annidata richiedono ancora migrazione. Valutare agenti con `azd ai eval` da `azure.ai.evaluations`, non con il vecchio flusso di lavoro rimosso. Vedi [migrazione valutazioni](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) per configurazione, esecuzione e risultati.

Vedi [Comandi AI CLI AZD](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) per la referenza completa dei comandi e flag.

### Distribuzione con Singolo Comando

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Distribuzioni Specifiche per Ambiente

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitoraggio e Osservabilità

### Integrazione Application Insights

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
```

Questo crea una risorsa Insights, non strumentazione telemetry. Quando la tua app emette span delle chiamate modello in uscita, esegui questa query illustrativa nei log di Application Insights (adatta il filtro ai nomi reali di span):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Monitoraggio Costi

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

Usare un destinatario reale e verificare permessi scope fatturazione. Un budget invia avvisi; non è un limite di spesa.

## 🔐 Best Practice di Sicurezza

### Configurazione Identità Gestita

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### Sicurezza di Rete

Questo frammento endpoint richiede anche zona/gruppo DNS privato, link VNet, connettività VNet applicazione e una policy esplicita di accesso pubblico. Creare solo un endpoint privato non disabilita l'accesso pubblico.

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

## Ottimizzazione delle Prestazioni

### Strategie di Caching

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

Azure Cache per Redis Basic/Standard/Premium è in un [percorso di dismissione](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); usare Azure Managed Redis per nuove distribuzioni e seguire le indicazioni attuali di template/autenticazione. Limitare le risposte AI memorizzate nella cache per autorizzazione, modello/istruzioni e versione dati, con scadenza; non condividere mai risposte private usando solo il testo della query.

### Configurazione Auto-scaling

**Risorsa parziale:** unire queste impostazioni scale/ingress in un Container App completo con ambiente gestito, immagine container e limiti risorse. Più repliche non aumentano la quota modello.

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## Risoluzione Problemi Comuni

### Problema 1: Quota OpenAI Superata

**Sintomi:**
- La distribuzione fallisce con errori di quota
- Errori 429 nei log applicazione

**Soluzioni:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

La variabile capacità sopra si applica solo a un template personalizzato collegato a consumarla. Per l'esempio RAG, usare `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Non modificare `AZURE_LOCATION` per spostare risorse esistenti in posto; creare un ambiente separato per una nuova regione e pianificare migrazione/pulizia.

### Problema 2: Fallimenti di Autenticazione

**Sintomi:**
- Errori 401/403 chiamando servizi AI
- Messaggi "Accesso negato"

**Soluzioni:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problema 3: Problemi di Distribuzione Modelli

**Sintomi:**
- Modelli non disponibili in distribuzione
- Versioni modello specifiche che falliscono

**Soluzioni:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Template di Esempio

Questi sono alternativi, non comandi sequenziali. Avviare ognuno in una directory vuota separata. La destinazione esplicita `.` mantiene l'inizializzazione nella directory corrente; altrimenti AZD corrente può creare una sottodirectory nominata come il template senza cambiare la directory di lavoro della shell.

### Applicazione Chat RAG (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servizi**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descrizione**: Applicazione chat RAG di riferimento per domande sui tuoi documenti, con recupero Azure AI Search. Esaminare i modelli supportati attuali, funzionalità opzionali, guida ai costi e hardening produzione prima dell'uso; distribuire un esempio non rende un'applicazione pronta per la produzione.

**Avvio Rapido**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Applicazione Chat RAG (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Servizi**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descrizione**: Equivalente .NET/C# dell'esempio chat RAG Python. Costruito con ASP.NET Core Minimal API e frontend Blazor WebAssembly. Include chat vocale, supporto GPT-4o-mini vision e client desktop/mobile ibrido .NET MAUI Blazor companion.

**Avvio Rapido**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Applicazione Chat RAG (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Servizi**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descrizione**: Versione Java dell'esempio chat RAG usando Langchain4J per orchestrazione AI. Supporta architettura a microservizi a eventi, multiple strategie di ricerca (testo, vettore, ibrido), upload documenti con Azure Document Intelligence e distribuzione su Azure Container Apps o AKS.

**Avvio Rapido**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot con Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servizi**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descrizione**: Copilota vendita al dettaglio end-to-end RAG usando Microsoft Foundry e Prompty. Chatbot Contoso Outdoor basato su catalogo prodotti e dati ordini clienti. Dimostra l'intero flusso GenAIOps — prototipo con Prompty, valuta con valutatori assistiti AI e distribuisci tramite AZD su Container Apps.

**Avvio Rapido**:
```bash
azd init --template contoso-chat .
azd up
```

### Applicazione Multi-Agente di Scrittura Creativa

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Servizi**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descrizione**: Esempio multi-agente che dimostra orchestrazione agenti AI con Prompty. Usa un agente ricerca (Bing Grounding in Azure AI Agent Service), agente prodotto (Azure AI Search), agente scrittore e agente editor per produrre collaborativamente articoli ben ricercati. Include CI/CD con valutazione in GitHub Actions.

**Avvio Rapido**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Chat Serverless RAG (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Servizi**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB per NoSQL + LangChain.js

**Descrizione**: Chatbot RAG completamente serverless usando LangChain.js con Azure Functions per API e Azure Static Web Apps per hosting. Usa Azure Cosmos DB sia come store vettoriale che come database cronologia chat. Supporta sviluppo locale con Ollama per test a costo zero.

**Avvio Rapido**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Acceleratore di Soluzione Chat con i Tuoi Dati

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Servizi**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search con Cosmos DB, o PostgreSQL con pgvector

**Descrizione**: Acceleratore chat basato su documenti con citazioni. L'esempio attuale ospita frontend React, backend FastAPI e worker ingestione Functions su Container Apps; opzioni orchestratore sono Agent Framework e LangGraph. Sono selezionate opzioni database/recupero a distribuzione. È un punto di partenza, non un sistema di produzione pronto all'uso; non assumere che varianti App Service, Semantic Kernel o Prompt Flow più vecchie descrivano il default attuale.

**Avvio Rapido**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Agenti di Viaggio AI — Orchestrazione Multi-Agente MCP

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Servizi**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Descrizione**: Applicazione di riferimento per l'orchestrazione AI multi-agente utilizzando tre framework (LangChain.js, LlamaIndex.TS e Microsoft Agent Framework). Include server MCP (Model Context Protocol) in quattro lingue distribuiti come Azure Container Apps serverless con monitoraggio OpenTelemetry.

**Avvio rapido**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Esplora altri modelli**: Visita la [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) per i modelli attualmente disponibili in varie lingue e scenari. Ogni esempio collegato è un repository esterno, non un esempio locale fornito da questo corso; controlla i prerequisiti attuali e le indicazioni di produzione prima della distribuzione.

## Passi successivi

1. **Prova gli esempi**: Inizia con un modello pre-costruito che corrisponde al tuo caso d'uso
2. **Personalizza per le tue esigenze**: Modifica l'infrastruttura e il codice dell'applicazione
3. **Aggiungi monitoraggio**: Implementa un'osservabilità completa
4. **Ottimizza i costi**: Regola la configurazione secondo il tuo budget
5. **Proteggi la tua distribuzione**: Applica schemi di sicurezza aziendale
6. **Scala per la produzione**: Aggiungi funzionalità multi-regione e alta disponibilità

## 🎯 Esercizi pratici

### Esercizio 1: Distribuire l'app di chat Microsoft Foundry Models (30 minuti)
**Obiettivo**: Distribuire e testare un'applicazione di riferimento per chat AI

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Clean up
azd down --force --purge
```

**Criteri di successo:**
- [ ] La distribuzione si completa senza errori di quota
- [ ] Accesso all'interfaccia chat tramite browser
- [ ] Possibilità di porre domande e ricevere risposte AI
- [ ] Application Insights mostra dati di telemetria
- [ ] Pulizia delle risorse riuscita

**Costo:** Rivedi la guida ai costi attuali del sample e gli SKU selezionati prima della distribuzione. La fatturazione continua finché le risorse non vengono eliminate; non esiste una stima fissa di 30 minuti valida per ogni configurazione.

### Esercizio 2: Configura la distribuzione multi-modello (45 minuti)
**Obiettivo**: Distribuire più modelli AI con configurazioni diverse

**Punto di partenza:** Un account Azure OpenAI esistente e un modulo di resource-group AZD che può richiamare questo file. Crea `infra/ai-models.bicep` con il seguente contenuto utilizzando il tuo editor. Non viene distribuito automaticamente solo perché è sotto `infra/`.

```bicep
param openAiAccountName string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

Dal modulo a livello di gruppo di risorse proprietario dell'account, aggiungi un'invocazione di modulo (adatta il nome del simbolo al tuo account reale):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Non dichiarare le stesse distribuzioni in entrambi i moduli. Se il punto di ingresso AZD è a livello di sottoscrizione, invoca questo dal suo modulo figlio a livello di gruppo risorse e adatta il percorso relativo. Compila quel modulo contenitore con `az bicep build --file <path-to-containing-module>`, quindi:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Criteri di successo:**
- [ ] Diversi modelli distribuiti con successo
- [ ] Diverse configurazioni di capacità applicate
- [ ] Modelli accessibili via API
- [ ] Possibilità di chiamare entrambi i modelli dall'applicazione

### Esercizio 3: Implementa il monitoraggio dei costi (20 minuti)
**Obiettivo**: Configurare avvisi di budget e monitorare i costi

**Punto di partenza:** Il modello di budget sopra e un modulo infrastrutturale a livello di gruppo risorse. Aggiungi questa risorsa utilizzando il tuo editor; passa `budgetStartDate` dalla tua mappatura di parametri (non duplicare il parametro se già dichiarato). Sostituisci il destinatario e conferma di avere l'autorizzazione di scrittura sul budget.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

Previsto: la risposta contiene `amount: 200`, entrambe le soglie, e il tuo destinatario. Controlla Cost Management nel portale per gli addebiti reali; i dati sui costi sono ritardati e un avviso potrebbe non scattare durante un esercizio breve.

**Criteri di successo:**
- [ ] Avviso di budget creato in Azure
- [ ] Notifiche email configurate
- [ ] Possibilità di visualizzare i dati sui costi nel portale Azure
- [ ] Soglie di budget impostate correttamente

## 💡 Domande frequenti

<details>
<summary><strong>Come posso ridurre i costi dei Microsoft Foundry Models durante lo sviluppo?</strong></summary>

1. **Controlla i prezzi**: Non esiste una soglia mensile universale gratuita di 50.000 token per i modelli Azure OpenAI
2. **Dimensiona correttamente la capacità**: La capacità `10` tipicamente rappresenta 10.000 TPM per questi modelli Standard di testo, non 10 TPM. Ridurre questo limite di velocità non abbassa i prezzi per token
3. **Usa azd down**: Elimina le risorse usa e getta quando non stai sviluppando attivamente (questo non equivale a deallocazione)
4. **Cache delle risposte**: Implementa cache Redis per query ripetute
5. **Usa Prompt Engineering**: Riduci l'uso di token con prompt efficienti

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Qual è la differenza tra Microsoft Foundry Models e OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Sicurezza e conformità enterprise
- Integrazione con reti private
- Garanzie SLA
- Autenticazione con Managed Identity
- Quote più alte disponibili

**OpenAI API**: Un provider/API separato con disponibilità modelli, prezzi, autenticazione e opzioni di connettività enterprise propri. Confronta le offerte attuali invece di presumere sia solo pubblica su Internet o che fornisca sempre prima i modelli.

Scegli in base ai requisiti della tua organizzazione; esempi specifici per Azure su managed identity e private-link in questo corso si applicano ai servizi ospitati su Azure, non a tutti i modelli/provider nel catalogo Foundry.
</details>

<details>
<summary><strong>Come gestisco gli errori di superamento quota in Microsoft Foundry Models?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>Posso usare i miei dati con Microsoft Foundry Models?</strong></summary>

Sì! Usa **Azure AI Search** per RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

Vedi il modello [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Come posso proteggere gli endpoint dei modelli AI?</strong></summary>

**Best Practices**:
1. Usa Managed Identity (niente chiavi API)
2. Abilita Private Endpoints
3. Configura gruppi di sicurezza di rete
4. Implementa limitazioni di velocità
5. Usa Azure Key Vault per i segreti

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## Comunità e Supporto

- **Microsoft Foundry Discord**: [Canale #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problemi e discussioni](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentazione ufficiale](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill su skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installa le competenze Azure + Foundry agent nel tuo editor con `npx skills add microsoft/github-copilot-for-azure`

---

**Navigazione del Capitolo:**
- **📚 Homepage del Corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo corrente**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Capitolo precedente**: [Capitolo 1: Il tuo primo progetto](../chapter-01-foundation/first-project.md)
- **➡️ Successivo**: [Agenti AI](agents.md)
- **🚀 Capitolo successivo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

**Hai bisogno di aiuto?** Partecipa alle discussioni della community o apri un problema nel repository. La community Azure AI + AZD è qui per aiutarti a prosperare!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->