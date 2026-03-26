# Integrazione di Microsoft Foundry con AZD

**Chapter Navigation:**
- **📚 Home del corso**: [AZD per principianti](../../README.md)
- **📖 Capitolo corrente**: Capitolo 2 - Sviluppo incentrato sull'IA
- **⬅️ Capitolo precedente**: [Capitolo 1: Il tuo primo progetto](../chapter-01-foundation/first-project.md)
- **➡️ Successivo**: [Distribuzione modelli AI](ai-model-deployment.md)
- **🚀 Capitolo successivo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

## Panoramica

Questa guida dimostra come integrare i servizi Microsoft Foundry con Azure Developer CLI (AZD) per semplificare le distribuzioni di applicazioni AI. Microsoft Foundry fornisce una piattaforma completa per la creazione, il deployment e la gestione di applicazioni AI, mentre AZD semplifica il processo di infrastruttura e distribuzione.

## Cos'è Microsoft Foundry?

Microsoft Foundry è la piattaforma unificata di Microsoft per lo sviluppo AI che include:

- **Catalogo modelli**: Accesso a modelli AI all'avanguardia
- **Prompt Flow**: Designer visivo per flussi di lavoro AI
- **Microsoft Foundry Portal**: Ambiente di sviluppo integrato per applicazioni AI
- **Opzioni di deployment**: Molteplici opzioni di hosting e scalabilità
- **Sicurezza e protezione**: Funzionalità di AI responsabile integrate

## AZD + Microsoft Foundry: Meglio insieme

| Funzionalità | Microsoft Foundry | Vantaggi dell'integrazione con AZD |
|---------|-----------------|------------------------|
| **Distribuzione del modello** | Distribuzione manuale tramite portale | Distribuzioni automatizzate e ripetibili |
| **Infrastruttura** | Provisioning con clic | Infrastructure as Code (Bicep) |
| **Gestione degli ambienti** | Focus su un singolo ambiente | Multi-ambiente (dev/staging/prod) |
| **Integrazione CI/CD** | Limitata | Supporto nativo per GitHub Actions |
| **Gestione dei costi** | Monitoraggio di base | Ottimizzazione dei costi per ambiente |

## Prerequisiti

- Sottoscrizione Azure con permessi appropriati
- Azure Developer CLI installato
- Accesso ai servizi Microsoft Foundry Models
- Familiarità di base con Microsoft Foundry

## Modelli di integrazione principali

### Pattern 1: Integrazione con Microsoft Foundry Models

**Caso d'uso**: Distribuire applicazioni di chat con Microsoft Foundry Models

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

### Pattern 2: Integrazione AI Search + RAG

**Caso d'uso**: Distribuire applicazioni retrieval-augmented generation (RAG)

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

**Caso d'uso**: Flussi di lavoro per l'elaborazione e l'analisi dei documenti

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

## 🔧 Modelli di configurazione

### Configurazione delle variabili d'ambiente

**Configurazione di produzione:**
```bash
# Servizi principali di IA
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Configurazioni del modello
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Impostazioni delle prestazioni
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configurazione di sviluppo:**
```bash
# Impostazioni ottimizzate in termini di costi per lo sviluppo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Livello gratuito
```

### Configurazione sicura con Key Vault

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

## Flussi di distribuzione

### Estensioni AZD per Foundry

AZD fornisce estensioni che aggiungono capacità specifiche per l'AI per lavorare con i servizi Microsoft Foundry:

```bash
# Installa l'estensione Foundry Agents
azd extension install azure.ai.agents

# Installa l'estensione per il fine-tuning
azd extension install azure.ai.finetune

# Installa l'estensione per modelli personalizzati
azd extension install azure.ai.models

# Elenca le estensioni installate
azd extension list
```

### Distribuzione incentrata sull'agente con `azd ai`

Se disponi di un manifest di agente, usa `azd ai agent init` per creare la struttura di un progetto collegato al Foundry Agent Service:

```bash
# Inizializzare da un manifesto dell'agente
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Distribuire in Azure
azd up
```

Vedi [Comandi AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) per il riferimento completo dei comandi e delle opzioni.

### Distribuzione con un singolo comando

```bash
# Distribuisci tutto con un solo comando
azd up

# Oppure distribuisci in modo incrementale
azd provision  # Solo infrastruttura
azd deploy     # Solo applicazione
```

### Distribuzioni per ambiente

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

## Monitoraggio e osservabilità

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

### Monitoraggio dei costi

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

## 🔐 Best practice per la sicurezza

### Configurazione dell'identità gestita

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

### Sicurezza della rete

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

## Ottimizzazione delle prestazioni

### Strategie di caching

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

### Configurazione dell'auto-scaling

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

## Risoluzione dei problemi comuni

### Problema 1: Quota OpenAI superata

**Sintomi:**
- Il deployment fallisce con errori di quota
- Errori 429 nei log dell'applicazione

**Soluzioni:**
```bash
# Controlla l'utilizzo corrente della quota
az cognitiveservices usage list --location eastus

# Prova una regione diversa
azd env set AZURE_LOCATION westus2
azd up

# Riduci temporaneamente la capacità
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problema 2: Errori di autenticazione

**Sintomi:**
- Errori 401/403 nelle chiamate ai servizi AI
- Messaggi "Access denied"

**Soluzioni:**
```bash
# Verificare le assegnazioni di ruolo
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Verificare la configurazione dell'identità gestita
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Verificare l'accesso a Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Problemi di deployment dei modelli

**Sintomi:**
- Modelli non disponibili nel deployment
- Versioni specifiche dei modelli che falliscono

**Soluzioni:**
```bash
# Elenca i modelli disponibili per regione
az cognitiveservices model list --location eastus

# Aggiorna la versione del modello nel template Bicep
# Verifica i requisiti di capacità del modello
```

## Modelli di esempio

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servizi**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descrizione**: L'esempio Azure AI più popolare — un'app di chat RAG pronta per la produzione che ti permette di porre domande sui tuoi documenti. Usa GPT-4.1-mini per chat, text-embedding-ada-002 per gli embeddings e Azure AI Search per il recupero. Supporta documenti multimodali, input/output vocale, autenticazione Microsoft Entra e tracciamento con Application Insights.

**Avvio rapido**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Servizi**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descrizione**: L'equivalente .NET/C# dell'esempio Python RAG chat. Costruito con ASP.NET Core Minimal API e frontend Blazor WebAssembly. Include chat vocale, supporto GPT-4o-mini vision e un client desktop/mobile .NET MAUI Blazor Hybrid in accompagnamento.

**Avvio rapido**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Servizi**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descrizione**: Versione Java dell'esempio RAG chat che utilizza Langchain4J per l'orchestrazione AI. Supporta architettura a microservizi event-driven, più strategie di ricerca (testo, vettore, ibrido), upload di documenti con Azure Document Intelligence e deployment sia su Azure Container Apps che su Azure Kubernetes Service.

**Avvio rapido**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servizi**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descrizione**: Copilot retail end-to-end basato su RAG che utilizza Azure AI Foundry e Prompty. Un chatbot per Contoso Outdoor che fonda le risposte sul catalogo prodotti e sui dati degli ordini dei clienti. Dimostra l'intero flusso GenAIOps — prototipazione con Prompty, valutazione con evaluator assistiti dall'AI e deployment tramite AZD su Container Apps.

**Avvio rapido**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Servizi**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descrizione**: Esempio multi-agente che dimostra l'orchestrazione di agenti AI con Prompty. Usa un agente di ricerca (Bing Grounding in Azure AI Agent Service), un agente prodotto (Azure AI Search), un agente scrittore e un agente editor per produrre collaborativamente articoli ben documentati. Include CI/CD con valutazione in GitHub Actions.

**Avvio rapido**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Servizi**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Descrizione**: Chatbot RAG completamente serverless che usa LangChain.js con Azure Functions per l'API e Azure Static Web Apps per l'hosting. Usa Azure Cosmos DB sia come vector store che come database per la cronologia chat. Supporta lo sviluppo locale con Ollama per test a costo zero.

**Avvio rapido**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Servizi**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Descrizione**: Soluzione accelerator RAG di livello enterprise con portale amministrativo per upload/gestione documenti, più opzioni di orchestrazione (Semantic Kernel, LangChain, Prompt Flow), speech-to-text, integrazione con Microsoft Teams e scelta tra backend PostgreSQL o Cosmos DB. Progettata come punto di partenza personalizzabile per scenari RAG in produzione.

**Avvio rapido**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Servizi**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Descrizione**: Applicazione di riferimento per l'orchestrazione multi-agente AI che utilizza tre framework (LangChain.js, LlamaIndex.TS e Microsoft Agent Framework). Include server MCP (Model Context Protocol) in quattro linguaggi distribuiti come Azure Container Apps serverless con monitoraggio OpenTelemetry.

**Avvio rapido**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Servizi**: Azure AI Services + Azure OpenAI

**Descrizione**: Template Bicep minimale che deploya servizi Azure AI con modelli di machine learning configurati. Un punto di partenza leggero quando è necessario solo il provisioning dell'infrastruttura Azure AI senza uno stack applicativo completo.

**Avvio rapido**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Sfoglia altri template**: Visita la [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) per oltre 80 template AZD specifici per l'AI in vari linguaggi e scenari.

## Passaggi successivi

1. **Prova gli esempi**: Inizia con un template predefinito che corrisponde al tuo caso d'uso
2. **Personalizza in base alle tue esigenze**: Modifica l'infrastruttura e il codice applicativo
3. **Aggiungi monitoraggio**: Implementa osservabilità completa
4. **Ottimizza i costi**: Affina le configurazioni in base al budget
5. **Metti in sicurezza il deployment**: Applica pattern di sicurezza enterprise
6. **Scala in produzione**: Aggiungi funzionalità multi-regione e alta disponibilità

## 🎯 Esercizi pratici

### Esercizio 1: Distribuire l'app di chat Microsoft Foundry Models (30 minuti)
**Obiettivo**: Distribuire e testare un'app di chat AI pronta per la produzione

```bash
# Inizializza il template
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

# Monitora le operazioni dell'IA
azd monitor

# Esegui la pulizia
azd down --force --purge
```

**Criteri di successo:**
- [ ] Il deployment si completa senza errori di quota
- [ ] È possibile accedere all'interfaccia di chat nel browser
- [ ] È possibile porre domande e ottenere risposte AI
- [ ] Application Insights mostra i dati di telemetria
- [ ] Risorse correttamente eliminate al termine

**Costo stimato**: $5-10 per 30 minuti di test

### Esercizio 2: Configurare una distribuzione multi-modello (45 minuti)
**Obiettivo**: Distribuire più modelli AI con configurazioni diverse

```bash
# Crea una configurazione Bicep personalizzata
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
  name: 'text-embedding-ada-002'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
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

**Criteri di successo:**
- [ ] Più modelli distribuiti con successo
- [ ] Impostazioni di capacità diverse applicate
- [ ] Modelli accessibili tramite API
- [ ] Possibilità di chiamare entrambi i modelli dall'applicazione

### Esercizio 3: Implementare il monitoraggio dei costi (20 minuti)
**Obiettivo**: Configurare avvisi di budget e tracciamento dei costi

```bash
# Aggiungi un avviso di budget a Bicep
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

# Distribuisci l'avviso di budget
azd provision

# Verifica i costi correnti
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Criteri di successo:**
- [ ] Avviso di budget creato in Azure
- [ ] Notifiche via email configurate
- [ ] Possibilità di visualizzare i dati dei costi nel Portale Azure
- [ ] Soglie di budget impostate in modo appropriato

## 💡 Domande frequenti

<details>
<summary><strong>Come riduco i costi di Microsoft Foundry Models durante lo sviluppo?</strong></summary>

1. **Usa il tier gratuito**: Microsoft Foundry Models offre 50.000 token/mese gratuiti
2. **Riduci la capacità**: Imposta la capacità a 10 TPM invece di 30+ per lo sviluppo
3. **Usa azd down**: Dealloca le risorse quando non si sviluppa attivamente
4. **Cache delle risposte**: Implementa Redis per le query ripetute
5. **Usa Prompt Engineering**: Riduci l'uso di token con prompt più efficienti

```bash
# Configurazione di sviluppo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Qual è la differenza tra Microsoft Foundry Models e l'API OpenAI?</strong></summary>

**Microsoft Foundry Models**:
- Sicurezza enterprise e conformità
- Integrazione con reti private
- Garanzie SLA
- Autenticazione con managed identity
- Quote più elevate disponibili

**OpenAI API**:
- Accesso più rapido ai nuovi modelli
- Configurazione più semplice
- Minore barriera d'ingresso
- Solo internet pubblico

Per le applicazioni in produzione, **Microsoft Foundry Models è raccomandato**.
</details>

<details>
<summary><strong>Come gestisco gli errori di superamento della quota dei Microsoft Foundry Models?</strong></summary>

```bash
# Verifica la quota corrente
az cognitiveservices usage list --location eastus2

# Prova una regione diversa
azd env set AZURE_LOCATION westus2
azd up

# Riduci temporaneamente la capacità
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Richiedi aumento della quota
# Vai al Portale di Azure > Quote > Richiedi aumento
```
</details>

<details>
<summary><strong>Posso usare i miei dati con Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Come posso proteggere gli endpoint dei modelli AI?</strong></summary>

**Migliori pratiche**:
1. Usa Managed Identity (senza chiavi API)
2. Abilita Private Endpoints
3. Configura i gruppi di sicurezza di rete
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

## Comunità e supporto

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Segnalazioni e discussioni](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentazione ufficiale](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installa le agent skills di Azure + Foundry nel tuo editor con `npx skills add microsoft/github-copilot-for-azure`

---

**Navigazione del capitolo:**
- **📚 Home del corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo corrente**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Capitolo precedente**: [Capitolo 1: Il tuo primo progetto](../chapter-01-foundation/first-project.md)
- **➡️ Successivo**: [Distribuzione del modello AI](ai-model-deployment.md)
- **🚀 Capitolo successivo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

**Hai bisogno di aiuto?** Partecipa alle discussioni nella nostra community o apri un issue nel repository. La community Azure AI + AZD è qui per aiutarti a avere successo!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Esclusione di responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua madre deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->