# Integrazione Microsoft Foundry con AZD

**Navigazione Capitoli:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Capitolo Precedente**: [Capitolo 1: Il Tuo Primo Progetto](../chapter-01-foundation/first-project.md)
- **➡️ Successivo**: [Deployment Modelli AI](ai-model-deployment.md)
- **🚀 Capitolo Successivo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

## Panoramica

Questa guida dimostra come integrare i servizi Microsoft Foundry con Azure Developer CLI (AZD) per semplificare i deployment di applicazioni AI. Microsoft Foundry fornisce una piattaforma completa per costruire, distribuire e gestire applicazioni AI, mentre AZD semplifica il processo di infrastruttura e deployment.

## Cos’è Microsoft Foundry?

Microsoft Foundry è la piattaforma unificata di Microsoft per lo sviluppo AI che include:

- **Catalogo Modelli**: Accesso a modelli AI all’avanguardia
- **Prompt Flow**: Designer visuale per workflow AI
- **Portale Microsoft Foundry**: Ambiente di sviluppo integrato per applicazioni AI
- **Opzioni di Deployment**: Molteplici opzioni di hosting e scalabilità
- **Safety e Sicurezza**: Funzionalità AI responsabili integrate

## AZD + Microsoft Foundry: Meglio Insieme

| Funzionalità | Microsoft Foundry | Beneficio Integrazione AZD |
|---------|-----------------|------------------------|
| **Deployment Modello** | Deployment manuale via portale | Deployment automatizzati e ripetibili |
| **Infrastruttura** | Provisioning tramite clic | Infrastructure as Code (Bicep) |
| **Gestione Ambienti** | Focus su singolo ambiente | Multi-ambiente (dev/staging/prod) |
| **Integrazione CI/CD** | Limitata | Supporto nativo GitHub Actions |
| **Gestione Costi** | Monitoraggio base | Ottimizzazione costi per ambiente |

## Prerequisiti

- Sottoscrizione Azure con permessi adeguati
- Azure Developer CLI installato
- Accesso ai servizi Microsoft Foundry Models
- Familiarità di base con Microsoft Foundry

> **Baseline attuale AZD:** Questi esempi sono stati testati con `azd` `1.27.1`. Per il workflow AI agent, usa l’ultima release dell’estensione in preview e verifica la versione installata prima di iniziare.

## Pattern di Integrazione Principali

### Pattern 1: Integrazione Microsoft Foundry Models

**Caso d’Uso**: Deploy di applicazioni chat con modelli Microsoft Foundry Models

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      - AZURE_OPENAI_ENDPOINT
      - AZURE_OPENAI_API_KEY
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
    disableLocalAuth: false
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
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### Pattern 2: Integrazione AI Search + RAG

**Caso d’Uso**: Deploy di applicazioni retrieval-augmented generation (RAG)

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

// Connect Search with OpenAI
resource searchConnection 'Microsoft.Search/searchServices/dataConnections@2023-11-01' = {
  parent: searchService
  name: 'openai-connection'
  properties: {
    targetResourceId: openAIAccount.id
    authenticationMethod: 'managedIdentity'
  }
}
```

### Pattern 3: Integrazione Document Intelligence

**Caso d’Uso**: Workflow di elaborazione e analisi documenti

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

## 🔧 Pattern di Configurazione

### Configurazione Variabili d’Ambiente

**Configurazione Produzione:**
```bash
# Servizi core di intelligenza artificiale
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Configurazioni del modello
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Impostazioni delle prestazioni
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configurazione Sviluppo:**
```bash
# Impostazioni ottimizzate per i costi per lo sviluppo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Livello gratuito
```

### Configurazione Sicura con Key Vault

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
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

## Workflow di Deployment

### Estensioni AZD per Foundry

AZD fornisce estensioni che aggiungono capacità specifiche AI per lavorare con i servizi Microsoft Foundry:

```bash
# Installa l'estensione Foundry agents
azd extension install azure.ai.agents

# Installa l'estensione per il fine-tuning
azd extension install azure.ai.finetune

# Installa l'estensione modelli personalizzati
azd extension install azure.ai.models

# Elenca le estensioni installate
azd extension list --installed

# Ispeziona la versione attualmente installata dell'estensione agent
azd extension show azure.ai.agents
```

Le estensioni AI sono ancora in rapido sviluppo in preview. Se un comando si comporta diversamente da quanto mostrato, aggiorna l’estensione pertinente prima di risolvere problemi nel progetto stesso.

### Deployment Agent-First con `azd ai`

Se disponi di un manifest agente, usa `azd ai agent init` per creare lo scheletro di un progetto connesso a Foundry Agent Service:

```bash
# Inizializza da un manifesto agente
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Distribuisci su Azure
azd up
```

Recenti versioni preview di `azure.ai.agents` hanno aggiunto il supporto all’inizializzazione basata su template per `azd ai agent init`. Se segui esempi agent più nuovi, consulta l’aiuto estensione per le opzioni esatte disponibili nella tua versione.

Vedi [Comandi CLI AZD AI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) per il riferimento completo ai comandi e flag.

### Deployment con Comando Unico

```bash
# Distribuisci tutto con un solo comando
azd up

# Oppure distribuisci in modo incrementale
azd provision  # Solo infrastruttura
azd deploy     # Solo applicazione

# Per distribuzioni di applicazioni AI a lunga esecuzione in azd 1.23.11+
azd deploy --timeout 1800
```

### Deployment Specifici per Ambiente

```bash
# Ambiente di sviluppo
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Ambiente di produzione
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
resource customMetrics 'Microsoft.Insights/components/analyticsItems@2015-05-01' = {
  parent: applicationInsights
  name: 'AI-Metrics'
  properties: {
    name: 'AI Operations Metrics'
    content: '''
      requests
      | where name contains "openai"
      | summarize 
          RequestCount = count(),
          AvgDuration = avg(duration),
          SuccessRate = countif(success == true) * 100.0 / count()
      by bin(timestamp, 5m)
    '''
  }
}
```

### Monitoraggio Costi

```bicep
// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
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

## 🔐 Best Practice di Sicurezza

### Configurazione Managed Identity

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
      - REDIS_CONNECTION_STRING
      - CACHE_TTL=3600
```

```bicep
// Redis cache for AI responses
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

### Configurazione Auto-scaling

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
- Il deployment fallisce con errori di quota
- Errori 429 nei log applicazione

**Soluzioni:**
```bash
# Controlla l'uso della quota attuale
az cognitiveservices usage list --location eastus

# Prova una regione diversa
azd env set AZURE_LOCATION westus2
azd up

# Riduci temporaneamente la capacità
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problema 2: Fallimenti di Autenticazione

**Sintomi:**
- Errori 401/403 durante chiamate ai servizi AI
- Messaggi "Accesso negato"

**Soluzioni:**
```bash
# Verifica delle assegnazioni di ruolo
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Controlla la configurazione dell'identità gestita
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Valida l'accesso a Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Problemi di Deployment Modelli

**Sintomi:**
- Modelli non disponibili nel deployment
- Versioni specifiche dei modelli che falliscono

**Soluzioni:**
```bash
# Elenca i modelli disponibili per regione
az cognitiveservices model list --location eastus

# Aggiorna la versione del modello nel template bicep
# Verifica i requisiti di capacità del modello
```

## Template Esempio

### Applicazione Chat RAG (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servizi**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descrizione**: Il campione Azure AI più popolare — un’app chat RAG pronta per la produzione che consente di porre domande sui propri documenti. Usa GPT-4.1-mini per la chat, text-embedding-3-large per embeddings e Azure AI Search per il retrieval. Supporta documenti multimodali, input/output vocale, autenticazione Microsoft Entra e tracciamento Application Insights.

**Avvio Rapido**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Applicazione Chat RAG (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Servizi**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descrizione**: L’equivalente .NET/C# del campione chat RAG Python. Costruito con ASP.NET Core Minimal API e frontend Blazor WebAssembly. Include chat vocale, supporto GPT-4o-mini vision e client desktop/mobile companion .NET MAUI Blazor Hybrid.

**Avvio Rapido**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Applicazione Chat RAG (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Servizi**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descrizione**: Versione Java del campione chat RAG che usa Langchain4J per orchestrazione AI. Supporta architettura microservizi event-driven, multiple strategie di ricerca (testo, vettore, ibrida), upload documenti con Azure Document Intelligence e deployment su Azure Container Apps o Azure Kubernetes Service.

**Avvio Rapido**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Copilota Retail Enterprise con Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servizi**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descrizione**: Copilota retail end-to-end RAG che usa Microsoft Foundry e Prompty. Chatbot per Contoso Outdoor che basa le risposte su catalogo prodotti e dati ordini clienti. Dimostra l’intero workflow GenAIOps — prototipo con Prompty, valutazione assistita da AI, deployment via AZD su Container Apps.

**Avvio Rapido**:
```bash
azd init --template contoso-chat
azd up
```

### Applicazione Multi-Agente per Scrittura Creativa

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Servizi**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descrizione**: Campione multi-agente che dimostra orchestrazione agent AI con Prompty. Usa un agente di ricerca (Bing Grounding in Azure AI Agent Service), un agente prodotto (Azure AI Search), un agente scrittore e un agente editor per produrre collaborativamente articoli ben documentati. Include CI/CD con valutazione in GitHub Actions.

**Avvio Rapido**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Chat RAG Serverless (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Servizi**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB per NoSQL + LangChain.js

**Descrizione**: Chatbot RAG completamente serverless che usa LangChain.js con Azure Functions per l’API e Azure Static Web Apps per hosting. Usa Azure Cosmos DB come store vettoriale e database della cronologia chat. Supporta sviluppo locale con Ollama per testing a costo zero.

**Avvio Rapido**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Acceleratore Soluzione Chat con I Tuoi Dati

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Servizi**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Descrizione**: Acceleratore soluzione RAG enterprise-grade con portale admin per upload/gestione documenti, diverse opzioni orchestrator (Semantic Kernel, LangChain, Prompt Flow), speech-to-text, integrazione Microsoft Teams e scelta backend PostgreSQL o Cosmos DB. Progettato come punto di partenza personalizzabile per scenari RAG in produzione.

**Avvio Rapido**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### Agenti di Viaggio AI — Orchestrazione Multi-Agente MCP

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Servizi**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + Server MCP (.NET, Python, Java, TypeScript)

**Descrizione**: Applicazione di riferimento per orchestrazione multi-agente AI usando tre framework (LangChain.js, LlamaIndex.TS, Microsoft Agent Framework). Include server MCP (Model Context Protocol) in quattro linguaggi, distribuiti come app serverless Azure Container Apps con monitoraggio OpenTelemetry.

**Avvio Rapido**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Servizi**: Azure AI Services + Azure OpenAI

**Descrizione**: Template Bicep minimale che distribuisce servizi Azure AI con modelli machine learning configurati. Un punto di partenza leggero quando serve solo l’infrastruttura Azure AI senza un intero stack applicativo.

**Avvio Rapido**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Esplora altri template**: Visita la [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) per oltre 80 template AZD specifici AI tra linguaggi e scenari.

## Passi Successivi

1. **Prova gli Esempi**: Inizia con un template pre-costruito che corrisponde al tuo caso d’uso
2. **Personalizza per le Tue Esigenze**: Modifica infrastruttura e codice applicazione
3. **Aggiungi Monitoraggio**: Implementa osservabilità completa
4. **Ottimizza Costi**: Raffina configurazioni per il tuo budget
5. **Metti in Sicurezza il Deployment**: Implementa pattern di sicurezza enterprise
6. **Scala in Produzione**: Aggiungi funzionalità multi-regione e alta disponibilità

## 🎯 Esercizi Pratici

### Esercizio 1: Deploy Applicazione Chat con Microsoft Foundry Models (30 minuti)
**Obiettivo**: Deploy e test di un’applicazione chat AI pronta per la produzione

```bash
# Inizializza il modello
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Imposta le variabili d'ambiente
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Distribuisci
azd up

# Testa l'applicazione
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Monitora le operazioni AI
azd monitor

# Pulisci
azd down --force --purge
```

**Criteri di Successo:**
- [ ] Il deployment si completa senza errori di quota
- [ ] Accesso all’interfaccia chat nel browser
- [ ] Possibilità di porre domande e ricevere risposte AI
- [ ] Application Insights mostra dati di telemetria
- [ ] Risorse pulite con successo al termine

**Costo Stimato**: 5-10 $ per 30 minuti di test

### Esercizio 2: Configura Deployment Multi-Modello (45 minuti)
**Obiettivo**: Deploy di più modelli AI con configurazioni differenti

```bash
# Crea configurazione Bicep personalizzata
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

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
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
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
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# Distribuisci e verifica
azd provision
azd show
```

**Criteri di Successo:**
- [ ] Molteplici modelli deployati con successo
- [ ] Applicate impostazioni di capacità diverse
- [ ] Modelli accessibili via API
- [ ] Entrambi i modelli chiamabili dall’applicazione

### Esercizio 3: Implementa Monitoraggio Costi (20 minuti)
**Obiettivo**: Configura alert di budget e tracciamento costi

```bash
# Aggiungi avviso di budget a Bicep
cat >> infra/main.bicep << 'EOF'

resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2025-12-31'
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
EOF

# Distribuisci avviso di budget
azd provision

# Controlla i costi attuali
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Criteri di Successo:**
- [ ] Alert di budget creato in Azure
- [ ] Notifiche email configurate
- [ ] Possibilità di visualizzare dati costi in Azure Portal
- [ ] Soglie di budget impostate correttamente

## 💡 Domande Frequenti

<details>
<summary><strong>Come riduco i costi Microsoft Foundry Models durante lo sviluppo?</strong></summary>

1. **Usa il Tier Gratuito**: Microsoft Foundry Models offre 50.000 token al mese gratuitamente
2. **Riduci la Capacità**: Imposta la capacità a 10 TPM invece di 30+ per dev
3. **Usa azd down**: Dealloca le risorse quando non stai sviluppando attivamente
4. **Cache delle Risposte**: Implementa caching Redis per query ripetute
5. **Usa Prompt Engineering**: Riduci l’uso di token con prompt efficienti


```bash
# Configurazione di sviluppo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Qual è la differenza tra Microsoft Foundry Models e OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Sicurezza aziendale e conformità
- Integrazione in rete privata
- Garanzie SLA
- Autenticazione con identità gestita
- Quota più elevata disponibile

**OpenAI API**:
- Accesso più rapido ai nuovi modelli
- Configurazione più semplice
- Barriera d'ingresso più bassa
- Solo internet pubblico

Per app di produzione, **si consiglia Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Come gestisco gli errori di superamento quota in Microsoft Foundry Models?</strong></summary>

```bash
# Controlla la quota attuale
az cognitiveservices usage list --location eastus2

# Prova una regione diversa
azd env set AZURE_LOCATION westus2
azd up

# Riduci temporaneamente la capacità
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Richiedi aumento della quota
# Vai al Portale Azure > Quote > Richiedi aumento
```
</details>

<details>
<summary><strong>Posso utilizzare i miei dati con Microsoft Foundry Models?</strong></summary>

Sì! Usa **Azure AI Search** per RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Vedi il template [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Come metto in sicurezza gli endpoint dei modelli AI?</strong></summary>

**Best Practices**:
1. Usa Managed Identity (no chiavi API)
2. Abilita Private Endpoints
3. Configura i gruppi di sicurezza della rete
4. Implementa il rate limiting
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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentazione ufficiale](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill su skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installa gli agent skills di Azure + Foundry nel tuo editor con `npx skills add microsoft/github-copilot-for-azure`

---

**Navigazione Capitolo:**
- **📚 Home del Corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Capitolo Precedente**: [Capitolo 1: Il tuo primo progetto](../chapter-01-foundation/first-project.md)
- **➡️ Successivo**: [Deploy Modello AI](ai-model-deployment.md)
- **🚀 Capitolo Successivo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

**Hai bisogno di aiuto?** Partecipa alle discussioni della nostra comunità o apri un issue nel repository. La community Azure AI + AZD è qui per aiutarti a raggiungere il successo!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->