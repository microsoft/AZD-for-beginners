<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-09-17T21:37:58+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "it"
}
-->
# Integrazione di Azure AI Foundry con AZD

**Navigazione Capitolo:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Capitolo Precedente**: [Capitolo 1: Il tuo primo progetto](../getting-started/first-project.md)
- **➡️ Successivo**: [Distribuzione del Modello AI](ai-model-deployment.md)
- **🚀 Capitolo Successivo**: [Capitolo 3: Configurazione](../getting-started/configuration.md)

## Panoramica

Questa guida dimostra come integrare i servizi di Azure AI Foundry con Azure Developer CLI (AZD) per semplificare le distribuzioni di applicazioni AI. Azure AI Foundry offre una piattaforma completa per creare, distribuire e gestire applicazioni AI, mentre AZD semplifica il processo di infrastruttura e distribuzione.

## Cos'è Azure AI Foundry?

Azure AI Foundry è la piattaforma unificata di Microsoft per lo sviluppo AI che include:

- **Catalogo Modelli**: Accesso a modelli AI all'avanguardia
- **Prompt Flow**: Designer visivo per flussi di lavoro AI
- **Portale AI Foundry**: Ambiente di sviluppo integrato per applicazioni AI
- **Opzioni di Distribuzione**: Diverse opzioni di hosting e scalabilità
- **Sicurezza e Affidabilità**: Funzionalità integrate per un'AI responsabile

## AZD + Azure AI Foundry: Meglio Insieme

| Funzionalità | Azure AI Foundry | Beneficio dell'Integrazione con AZD |
|--------------|------------------|-------------------------------------|
| **Distribuzione Modelli** | Distribuzione manuale tramite portale | Distribuzioni automatizzate e ripetibili |
| **Infrastruttura** | Provisioning tramite clic | Infrastruttura come Codice (Bicep) |
| **Gestione Ambienti** | Focus su un singolo ambiente | Multi-ambiente (sviluppo/staging/produzione) |
| **Integrazione CI/CD** | Limitata | Supporto nativo per GitHub Actions |
| **Gestione Costi** | Monitoraggio di base | Ottimizzazione dei costi specifica per ambiente |

## Prerequisiti

- Abbonamento Azure con permessi appropriati
- Azure Developer CLI installato
- Accesso ai servizi Azure OpenAI
- Familiarità di base con Azure AI Foundry

## Modelli di Integrazione Principali

### Modello 1: Integrazione con Azure OpenAI

**Caso d'Uso**: Distribuire applicazioni di chat con modelli Azure OpenAI

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
// Azure OpenAI Account
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
  name: 'gpt-35-turbo'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0613'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### Modello 2: Integrazione AI Search + RAG

**Caso d'Uso**: Distribuire applicazioni di generazione aumentata dal recupero (RAG)

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

### Modello 3: Integrazione Document Intelligence

**Caso d'Uso**: Flussi di lavoro per l'elaborazione e l'analisi di documenti

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

**Configurazione Produzione:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

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

## Flussi di Lavoro di Distribuzione

### Distribuzione con un Singolo Comando

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
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

### Integrazione con Application Insights

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

### Monitoraggio dei Costi

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

## 🔐 Migliori Pratiche di Sicurezza

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

## Risoluzione dei Problemi Comuni

### Problema 1: Quota OpenAI Superata

**Sintomi:**
- La distribuzione fallisce con errori di quota
- Errori 429 nei log dell'applicazione

**Soluzioni:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity temporarily
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problema 2: Fallimenti di Autenticazione

**Sintomi:**
- Errori 401/403 durante le chiamate ai servizi AI
- Messaggi di "Accesso negato"

**Soluzioni:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Problemi di Distribuzione Modelli

**Sintomi:**
- Modelli non disponibili nella distribuzione
- Fallimenti di versioni specifiche di modelli

**Soluzioni:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Template di Esempio

### Applicazione Chat di Base

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servizi**: Azure OpenAI + Cognitive Search + App Service

**Avvio Rapido**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Pipeline di Elaborazione Documenti

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Servizi**: Document Intelligence + Storage + Functions

**Avvio Rapido**:
```bash
azd init --template ai-document-processing
azd up
```

### Chat Aziendale con RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servizi**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Avvio Rapido**:
```bash
azd init --template contoso-chat
azd up
```

## Prossimi Passi

1. **Prova gli Esempi**: Inizia con un template pre-costruito che corrisponde al tuo caso d'uso
2. **Personalizza per le tue Esigenze**: Modifica l'infrastruttura e il codice dell'applicazione
3. **Aggiungi Monitoraggio**: Implementa un'osservabilità completa
4. **Ottimizza i Costi**: Affina le configurazioni per il tuo budget
5. **Proteggi la tua Distribuzione**: Implementa modelli di sicurezza aziendale
6. **Scala in Produzione**: Aggiungi funzionalità multi-regione e alta disponibilità

## Comunità e Supporto

- **Discord di Azure AI Foundry**: [Canale #Azure](https://discord.gg/microsoft-azure)
- **GitHub AZD**: [Problemi e discussioni](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentazione ufficiale](https://learn.microsoft.com/azure/ai-studio/)

---

**Navigazione Capitolo:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Capitolo Precedente**: [Capitolo 1: Il tuo primo progetto](../getting-started/first-project.md)
- **➡️ Successivo**: [Distribuzione del Modello AI](ai-model-deployment.md)
- **🚀 Capitolo Successivo**: [Capitolo 3: Configurazione](../getting-started/configuration.md)

**Hai bisogno di aiuto?** Partecipa alle discussioni della comunità o apri un problema nel repository. La comunità Azure AI + AZD è qui per aiutarti a raggiungere il successo!

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.