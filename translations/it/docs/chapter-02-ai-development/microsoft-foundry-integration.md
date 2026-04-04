# Integrazione di Microsoft Foundry con AZD

**Chapter Navigation:**
- **📚 Home del Corso**: [AZD per Principianti](../../README.md)
- **📖 Capitolo corrente**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Capitolo precedente**: [Capitolo 1: Il tuo primo progetto](../chapter-01-foundation/first-project.md)
- **➡️ Successivo**: [Distribuzione di modelli AI](ai-model-deployment.md)
- **🚀 Capitolo successivo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

## Panoramica

Questa guida mostra come integrare i servizi Microsoft Foundry con Azure Developer CLI (AZD) per distribuire applicazioni AI in modo semplificato. Microsoft Foundry fornisce una piattaforma completa per creare, distribuire e gestire applicazioni AI, mentre AZD semplifica il processo di infrastruttura e distribuzione.

## Che cos'è Microsoft Foundry?

Microsoft Foundry è la piattaforma unificata di Microsoft per lo sviluppo AI che include:

- **Model Catalog**: Accesso a modelli AI all'avanguardia
- **Prompt Flow**: Designer visivo per i workflow AI
- **Microsoft Foundry Portal**: Ambiente di sviluppo integrato per applicazioni AI
- **Deployment Options**: Molteplici opzioni di hosting e scalabilità
- **Safety and Security**: Funzionalità di AI responsabile integrate

## AZD + Microsoft Foundry: Meglio Insieme

| Funzionalità | Microsoft Foundry | Vantaggi dell'integrazione con AZD |
|---------|-----------------|------------------------|
| **Distribuzione del modello** | Distribuzione manuale via portale | Distribuzioni automatizzate e ripetibili |
| **Infrastruttura** | Provisioning con click-through | Infrastructure as Code (Bicep) |
| **Gestione degli ambienti** | Focus su un singolo ambiente | Multi-ambiente (dev/staging/prod) |
| **Integrazione CI/CD** | Limitata | Supporto nativo per GitHub Actions |
| **Gestione dei costi** | Monitoraggio di base | Ottimizzazione dei costi specifica per ambiente |

## Prerequisiti

- Sottoscrizione Azure con le autorizzazioni appropriate
- Azure Developer CLI installato
- Accesso ai servizi Microsoft Foundry Models
- Familiarità di base con Microsoft Foundry

> **Current AZD baseline:** These examples were reviewed against `azd` `1.23.12`. For the AI agent workflow, use the current preview extension release and check your installed version before you begin.

## Pattern di integrazione principali

### Pattern 1: Integrazione dei modelli Microsoft Foundry

**Caso d'uso**: distribuire applicazioni di chat con i modelli di Microsoft Foundry

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

### Pattern 2: AI Search + RAG Integration

**Caso d'uso**: distribuire applicazioni RAG (retrieval-augmented generation)

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

### Pattern 3: Document Intelligence Integration

**Caso d'uso**: workflow di elaborazione e analisi dei documenti

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
# Servizi principali di intelligenza artificiale
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

**Configurazione di sviluppo:**
```bash
# Impostazioni ottimizzate per i costi per lo sviluppo
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
# Installa l'estensione Foundry agents
azd extension install azure.ai.agents

# Installa l'estensione per il fine-tuning
azd extension install azure.ai.finetune

# Installa l'estensione per i modelli personalizzati
azd extension install azure.ai.models

# Elenca le estensioni installate
azd extension list --installed

# Ispeziona la versione dell'estensione agent attualmente installata
azd extension show azure.ai.agents
```

Le estensioni AI sono ancora in rapida evoluzione in anteprima. Se un comando si comporta diversamente rispetto a quanto mostrato qui, aggiorna l'estensione pertinente prima di risolvere i problemi del progetto stesso.

### Distribuzione incentrata sull'agente con `azd ai`

Se disponi di un manifest dell'agente, usa `azd ai agent init` per creare lo scheletro di un progetto connesso al Foundry Agent Service:

```bash
# Inizializza da un manifesto dell'agente
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Distribuisci su Azure
azd up
```

Le recenti release preview di `azure.ai.agents` hanno anche aggiunto il supporto all'inizializzazione basata su template per `azd ai agent init`. Se stai seguendo esempi agent più recenti, controlla l'help dell'estensione per i flag esatti disponibili nella versione installata.

Vedi [Comandi CLI AZD AI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) per il riferimento completo dei comandi e dei flag.

### Distribuzione con singolo comando

```bash
# Distribuisci tutto con un solo comando
azd up

# Oppure distribuisci in modo incrementale
azd provision  # Solo infrastruttura
azd deploy     # Solo applicazione

# Per le distribuzioni di applicazioni AI di lunga durata in azd 1.23.11+
azd deploy --timeout 1800
```

### Distribuzioni specifiche per ambiente

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

## 🔐 Pratiche consigliate di sicurezza

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

### Configurazione di autoscaling

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
- La distribuzione fallisce con errori di quota
- Errori 429 nei log dell'applicazione

**Soluzioni:**
```bash
# Verifica l'utilizzo corrente della quota
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
- Errori 401/403 durante le chiamate ai servizi AI
- Messaggi "Accesso negato"

**Soluzioni:**
```bash
# Verificare le assegnazioni di ruolo
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Verificare la configurazione dell'identità gestita
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Verificare l'accesso a Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Problemi di distribuzione dei modelli

**Sintomi:**
- Modelli non disponibili nella distribuzione
- Versioni specifiche del modello che falliscono

**Soluzioni:**
```bash
# Elenca i modelli disponibili per regione
az cognitiveservices model list --location eastus

# Aggiorna la versione del modello nel template bicep
# Verifica i requisiti di capacità del modello
```

## Modelli di esempio

### Applicazione Chat RAG (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servizi**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descrizione**: Il sample Azure AI più popolare — un'app chat RAG pronta per la produzione che ti permette di porre domande sui tuoi documenti. Usa GPT-4.1-mini per la chat, text-embedding-3-large per gli embedding e Azure AI Search per il recupero. Supporta documenti multimodali, input/output vocale, autenticazione Microsoft Entra e tracciamento con Application Insights.

**Avvio rapido**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Applicazione Chat RAG (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Servizi**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descrizione**: L'equivalente .NET/C# del sample Python RAG chat. Costruito con ASP.NET Core Minimal API e frontend Blazor WebAssembly. Include chat vocale, supporto GPT-4o-mini vision e un client desktop/mobile .NET MAUI Blazor Hybrid companion.

**Avvio rapido**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Applicazione Chat RAG (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Servizi**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descrizione**: Versione Java del sample RAG chat che utilizza Langchain4J per l'orchestrazione AI. Supporta architettura microservizi event-driven, molteplici strategie di ricerca (testo, vettore, ibrido), upload di documenti con Azure Document Intelligence e distribuzione su Azure Container Apps o Azure Kubernetes Service.

**Avvio rapido**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot con Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servizi**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descrizione**: Copilot retail end-to-end RAG che utilizza Azure AI Foundry e Prompty. Un chatbot per il rivenditore Contoso Outdoor che ancorà le risposte ai dati del catalogo prodotti e degli ordini dei clienti. Dimostra l'intero workflow GenAIOps — prototipazione con Prompty, valutazione con evaluator assistiti dall'AI e distribuzione tramite AZD su Container Apps.

**Avvio rapido**:
```bash
azd init --template contoso-chat
azd up
```

### Applicazione Multi-Agente per Scrittura Creativa

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Servizi**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descrizione**: Sample multi-agente che dimostra l'orchestrazione di agenti AI con Prompty. Usa un agente di ricerca (Bing Grounding in Azure AI Agent Service), un agente prodotto (Azure AI Search), un agente scrittore e un agente editor che collaborano per produrre articoli ben documentati. Include CI/CD con valutazione in GitHub Actions.

**Avvio rapido**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Chat RAG Serverless (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Servizi**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Descrizione**: Chatbot RAG completamente serverless usando LangChain.js con Azure Functions per l'API e Azure Static Web Apps per l'hosting. Usa Azure Cosmos DB sia come store vettoriale sia come database della cronologia chat. Supporta lo sviluppo locale con Ollama per test a costo zero.

**Avvio rapido**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat con i tuoi dati - Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Servizi**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Descrizione**: Acceleratore di soluzione RAG di livello enterprise con portale admin per upload/gestione dei documenti, molteplici opzioni di orchestrazione (Semantic Kernel, LangChain, Prompt Flow), speech-to-text, integrazione Microsoft Teams e scelta del backend tra PostgreSQL o Cosmos DB. Progettato come punto di partenza personalizzabile per scenari RAG in produzione.

**Avvio rapido**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### Agenti di viaggio AI — Orchestrazione MCP multi-agente

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Servizi**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Descrizione**: Applicazione di riferimento per l'orchestrazione AI multi-agente usando tre framework (LangChain.js, LlamaIndex.TS e Microsoft Agent Framework). Presenta server MCP (Model Context Protocol) in quattro linguaggi distribuiti come Azure Container Apps serverless con monitoraggio OpenTelemetry.

**Avvio rapido**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Servizi**: Azure AI Services + Azure OpenAI

**Descrizione**: Template Bicep minimale che distribuisce i servizi Azure AI con modelli di machine learning configurati. Un punto di partenza leggero quando hai bisogno solo dell'infrastruttura Azure AI senza uno stack applicativo completo.

**Avvio rapido**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Sfoglia altri template**: Visita la [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) per oltre 80 template AZD specifici per AI in diversi linguaggi e scenari.

## Prossimi passi

1. **Prova gli esempi**: Inizia con un template pre-costruito che corrisponde al tuo caso d'uso
2. **Personalizza per le tue esigenze**: Modifica l'infrastruttura e il codice applicativo
3. **Aggiungi monitoraggio**: Implementa osservabilità completa
4. **Ottimizza i costi**: Affina le configurazioni in base al tuo budget
5. **Metti in sicurezza la distribuzione**: Applica pattern di sicurezza enterprise
6. **Scala in produzione**: Aggiungi funzionalità multi-regione e alta disponibilità

## 🎯 Esercizi pratici

### Esercizio 1: Distribuire l'app chat con i modelli Microsoft Foundry (30 minuti)
**Obiettivo**: Distribuire e testare un'app chat AI pronta per la produzione

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

# Monitora le operazioni di intelligenza artificiale
azd monitor

# Pulisci
azd down --force --purge
```

**Criteri di successo:**
- [ ] La distribuzione si completa senza errori di quota
- [ ] È possibile accedere all'interfaccia di chat nel browser
- [ ] È possibile porre domande e ottenere risposte potenziate dall'AI
- [ ] Application Insights mostra dati di telemetria
- [ ] Risorse ripulite con successo

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

**Criteri di successo:**
- [ ] Più modelli distribuiti con successo
- [ ] Applicate impostazioni di capacità differenti
- [ ] Modelli accessibili tramite API
- [ ] L'applicazione può chiamare entrambi i modelli

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
- [ ] Notifiche email configurate
- [ ] È possibile visualizzare i dati dei costi nel Portale di Azure
- [ ] Soglie di budget impostate in modo appropriato

## 💡 Domande frequenti

<details>
<summary><strong>Come posso ridurre i costi dei modelli Microsoft Foundry durante lo sviluppo?</strong></summary>

1. **Usare il piano gratuito**: Microsoft Foundry Models offre 50.000 token/mese gratuiti
2. **Ridurre la capacità**: Impostare la capacità a 10 TPM invece di 30+ per lo sviluppo
3. **Usare azd down**: deallocare le risorse quando non si sviluppa attivamente
4. **Cache delle risposte**: Implementare una cache Redis per query ripetute
5. **Usare il prompt engineering**: Ridurre l'utilizzo di token con prompt efficienti

</details>
```bash
# Configurazione di sviluppo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Qual è la differenza tra i modelli Microsoft Foundry e l'API OpenAI?</strong></summary>

**Microsoft Foundry Models**:
- Sicurezza aziendale e conformità
- Integrazione con reti private
- Garanzie SLA
- Autenticazione con Managed Identity
- Quote più elevate disponibili

**OpenAI API**:
- Accesso più rapido ai nuovi modelli
- Configurazione più semplice
- Barriera d'ingresso più bassa
- Solo su Internet pubblico

Per le applicazioni di produzione, è consigliato **Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Come gestisco gli errori di superamento della quota di Microsoft Foundry Models?</strong></summary>

```bash
# Controlla la quota corrente
az cognitiveservices usage list --location eastus2

# Prova una regione diversa
azd env set AZURE_LOCATION westus2
azd up

# Riduci temporaneamente la capacità
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Richiedi un aumento della quota
# Vai al Portale di Azure > Quote > Richiedi un aumento
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

**Buone pratiche**:
1. Usa Managed Identity (niente chiavi API)
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

## Comunità e supporto

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Segnalazioni e discussioni](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentazione ufficiale](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installa le skill agent di Azure + Foundry nel tuo editor con `npx skills add microsoft/github-copilot-for-azure`

---

**Navigazione del capitolo:**
- **📚 Home del corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo corrente**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Capitolo precedente**: [Capitolo 1: Il tuo primo progetto](../chapter-01-foundation/first-project.md)
- **➡️ Successivo**: [Distribuzione dei modelli AI](ai-model-deployment.md)
- **🚀 Capitolo successivo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

**Hai bisogno di aiuto?** Partecipa alle discussioni della nostra community o apri un issue nel repository. La community Azure AI + AZD è qui per aiutarti ad avere successo!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur facendo del nostro meglio per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali fraintendimenti o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->