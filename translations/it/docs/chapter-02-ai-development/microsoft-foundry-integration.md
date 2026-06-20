# Integrazione di Microsoft Foundry con AZD

**Navigazione del Capitolo:**
- **📚 Home del Corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo corrente**: Capitolo 2 - Sviluppo incentrato sull'IA
- **⬅️ Capitolo precedente**: [Capitolo 1: Il tuo primo progetto](../chapter-01-foundation/first-project.md)
- **➡️ Successivo**: [Distribuzione dei Modelli AI](ai-model-deployment.md)
- **🚀 Capitolo successivo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

## Panoramica

Questa guida mostra come integrare i servizi Microsoft Foundry con Azure Developer CLI (AZD) per semplificare le distribuzioni di applicazioni AI. Microsoft Foundry fornisce una piattaforma completa per creare, distribuire e gestire applicazioni AI, mentre AZD semplifica il processo di infrastruttura e distribuzione.

## Che cos'è Microsoft Foundry?

Microsoft Foundry è la piattaforma unificata di Microsoft per lo sviluppo AI che include:

- **Catalogo dei modelli**: Accesso a modelli AI all'avanguardia
- **Prompt Flow**: Designer visivo per i flussi di lavoro AI
- **Portale Microsoft Foundry**: Ambiente di sviluppo integrato per applicazioni AI
- **Opzioni di distribuzione**: Molteplici opzioni di hosting e scalabilità
- **Sicurezza e protezione**: Funzionalità di AI responsabile integrate

## AZD + Microsoft Foundry: Meglio insieme

| Funzionalità | Microsoft Foundry | Vantaggio dell'integrazione con AZD |
|---------|-----------------|------------------------|
| **Distribuzione dei modelli** | Distribuzione manuale tramite portale | Distribuzioni automatizzate e ripetibili |
| **Infrastruttura** | Provisioning tramite clic | Infrastruttura come codice (Bicep) |
| **Gestione degli ambienti** | Focus su un singolo ambiente | Multi-ambiente (dev/staging/prod) |
| **Integrazione CI/CD** | Limitata | Supporto nativo per GitHub Actions |
| **Gestione dei costi** | Monitoraggio di base | Ottimizzazione dei costi per ambiente |

## Prerequisiti

- Sottoscrizione Azure con permessi appropriati
- Azure Developer CLI installato
- Accesso ai servizi Microsoft Foundry Models
- Familiarità di base con Microsoft Foundry

> **Baseline AZD corrente:** Questi esempi sono stati verificati con `azd` `1.23.12`. Per il workflow degli agenti AI, usa la release preview dell'estensione attuale e controlla la versione installata prima di iniziare.

## Pattern di integrazione principali

### Pattern 1: Integrazione con Microsoft Foundry Models

**Caso d'uso**: Distribuire applicazioni chat con i modelli Microsoft Foundry

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

**Caso d'uso**: Distribuire applicazioni di retrieval-augmented generation (RAG)

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

## 🔧 Pattern di configurazione

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
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Piano gratuito
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

## Flussi di lavoro di distribuzione

### Estensioni AZD per Foundry

AZD fornisce estensioni che aggiungono capacità specifiche per l'AI per lavorare con i servizi Microsoft Foundry:

```bash
# Installa l'estensione Foundry Agents
azd extension install azure.ai.agents

# Installa l'estensione per il fine-tuning
azd extension install azure.ai.finetune

# Installa l'estensione per i modelli personalizzati
azd extension install azure.ai.models

# Elenca le estensioni installate
azd extension list --installed

# Ispeziona la versione attualmente installata dell'estensione agent
azd extension show azure.ai.agents
```

Le estensioni AI sono ancora in rapida evoluzione in preview. Se un comando si comporta in modo diverso da quanto mostrato qui, aggiorna l'estensione rilevante prima di risolvere i problemi del progetto stesso.

### Distribuzione Agent-First con `azd ai`

Se hai un agent manifest, usa `azd ai agent init` per scaffolding di un progetto collegato al Foundry Agent Service:

```bash
# Inizializza da un manifesto dell'agente
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Distribuisci su Azure
azd up
```

Le release preview recenti di `azure.ai.agents` hanno anche aggiunto il supporto all'inizializzazione basata su template per `azd ai agent init`. Se stai seguendo esempi agent più recenti, controlla l'help dell'estensione per le flag esatte disponibili nella versione installata.

Vedi [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) per il riferimento completo dei comandi e delle flag.

### Distribuzione con singolo comando

```bash
# Distribuisci tutto con un solo comando
azd up

# Oppure distribuisci in modo incrementale
azd provision  # Solo infrastruttura
azd deploy     # Solo applicazione

# Per distribuzioni di applicazioni AI di lunga durata in azd 1.23.11+
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

## 🔐 Migliori pratiche di sicurezza

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

### Sicurezza di rete

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
- La distribuzione fallisce con errori di quota
- Errori 429 nei log dell'applicazione

**Soluzioni:**
```bash
# Verificare l'utilizzo corrente della quota
az cognitiveservices usage list --location eastus

# Provare una regione diversa
azd env set AZURE_LOCATION westus2
azd up

# Ridurre temporaneamente la capacità
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problema 2: Errori di autenticazione

**Sintomi:**
- Errori 401/403 quando si chiamano i servizi AI
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

### Problema 3: Problemi nella distribuzione dei modelli

**Sintomi:**
- Modelli non disponibili in fase di distribuzione
- Versioni specifiche dei modelli che falliscono

**Soluzioni:**
```bash
# Elenca i modelli disponibili per regione
az cognitiveservices model list --location eastus

# Aggiorna la versione del modello nel template Bicep
# Verifica i requisiti di capacità del modello
```

## Esempi di template

### Applicazione RAG Chat (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servizi**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descrizione**: Il sample Azure AI più popolare — un'app RAG chat pronta per la produzione che ti permette di fare domande sui tuoi documenti. Usa GPT-4.1-mini per la chat, text-embedding-3-large per gli embedding e Azure AI Search per il recupero. Supporta documenti multimodali, input/output vocale, autenticazione Microsoft Entra e tracciamento con Application Insights.

**Avvio rapido**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Applicazione RAG Chat (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Servizi**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descrizione**: L'equivalente .NET/C# del sample RAG chat in Python. Costruito con ASP.NET Core Minimal API e frontend Blazor WebAssembly. Include chat vocale, supporto GPT-4o-mini vision e un client desktop/mobile .NET MAUI Blazor Hybrid companion.

**Avvio rapido**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Applicazione RAG Chat (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Servizi**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descrizione**: Versione Java del sample RAG chat che utilizza Langchain4J per l'orchestrazione AI. Supporta architetture microservizio event-driven, strategie di ricerca multiple (testo, vettore, ibrida), caricamento documenti con Azure Document Intelligence e distribuzione su Azure Container Apps o Azure Kubernetes Service.

**Avvio rapido**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot con Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servizi**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descrizione**: Copilot retail end-to-end RAG che utilizza Microsoft Foundry e Prompty. Un chatbot per il retailer Contoso Outdoor che fonda le risposte sul catalogo prodotti e sui dati degli ordini dei clienti. Dimostra l'intero workflow GenAIOps — prototipazione con Prompty, valutazione con valutatori assistiti dall'AI e distribuzione tramite AZD su Container Apps.

**Avvio rapido**:
```bash
azd init --template contoso-chat
azd up
```

### Applicazione Multi-Agent per Scrittura Creativa

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Servizi**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descrizione**: Sample multi-agente che dimostra l'orchestrazione di agenti AI con Prompty. Utilizza un agente di ricerca (Bing Grounding in Azure AI Agent Service), un agente prodotto (Azure AI Search), un agente scrittore e un agente editor che collaborano per produrre articoli ben documentati. Include CI/CD con valutazione in GitHub Actions.

**Avvio rapido**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Servizi**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB per NoSQL + LangChain.js

**Descrizione**: Chatbot RAG completamente serverless che utilizza LangChain.js con Azure Functions per l'API e Azure Static Web Apps per l'hosting. Usa Azure Cosmos DB sia come vector store che come database della cronologia chat. Supporta lo sviluppo locale con Ollama per test a costo zero.

**Avvio rapido**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Servizi**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Descrizione**: Solution accelerator RAG di livello enterprise con portale admin per caricamento/gestione documenti, molteplici opzioni di orchestrazione (Semantic Kernel, LangChain, Prompt Flow), speech-to-text, integrazione con Microsoft Teams e scelta tra backend PostgreSQL o Cosmos DB. Progettato come punto di partenza personalizzabile per scenari RAG di produzione.

**Avvio rapido**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### Agenti di viaggio AI — Orchestrazione Multi-Agent MCP

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Servizi**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Descrizione**: Applicazione di riferimento per l'orchestrazione multi-agente AI usando tre framework (LangChain.js, LlamaIndex.TS e Microsoft Agent Framework). Presenta server MCP (Model Context Protocol) in quattro linguaggi distribuiti come Azure Container Apps serverless con monitoraggio OpenTelemetry.

**Avvio rapido**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Servizi**: Azure AI Services + Azure OpenAI

**Descrizione**: Template Bicep minimale che distribuisce i servizi Azure AI con modelli di machine learning configurati. Un punto di partenza leggero quando è necessario solo il provisioning dell'infrastruttura Azure AI senza uno stack applicativo completo.

**Avvio rapido**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Sfoglia altri template**: Visita la [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) per oltre 80 template AZD specifici per AI in diversi linguaggi e scenari.

## Prossimi passi

1. **Prova gli esempi**: Inizia con un template predefinito che corrisponde al tuo caso d'uso
2. **Personalizza per le tue esigenze**: Modifica l'infrastruttura e il codice dell'applicazione
3. **Aggiungi il monitoraggio**: Implementa un'osservabilità completa
4. **Ottimizza i costi**: Affina le configurazioni in base al tuo budget
5. **Metti in sicurezza la distribuzione**: Applica i pattern di sicurezza enterprise
6. **Scala in produzione**: Aggiungi funzionalità multi-regione e alta disponibilità

## 🎯 Esercizi pratici

### Esercizio 1: Distribuire l'app chat con Microsoft Foundry Models (30 minuti)
**Obiettivo**: Distribuire e testare un'applicazione AI chat pronta per la produzione

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

# Monitora le operazioni di IA
azd monitor

# Pulisci
azd down --force --purge
```

**Criteri di successo:**
- [ ] La distribuzione si completa senza errori di quota
- [ ] Si può accedere all'interfaccia chat nel browser
- [ ] Si possono fare domande e ottenere risposte generate dall'AI
- [ ] Application Insights mostra dati di telemetria
- [ ] Risorse correttamente rimosse al termine

**Costo stimato**: $5-10 per 30 minuti di test

### Esercizio 2: Configurare una distribuzione multi-modello (45 minuti)
**Obiettivo**: Distribuire più modelli AI con configurazioni differenti

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
- [ ] È possibile chiamare entrambi i modelli dall'applicazione

### Esercizio 3: Implementare il monitoraggio dei costi (20 minuti)
**Obiettivo**: Configurare avvisi di budget e monitoraggio dei costi

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

**Criteri di successo:**
- [ ] Avviso di budget creato in Azure
- [ ] Notifiche email configurate
- [ ] È possibile visualizzare i dati di costo nel Portale di Azure
- [ ] Soglie di budget impostate in modo appropriato

## 💡 Domande frequenti

<details>
<summary><strong>Come posso ridurre i costi dei Microsoft Foundry Models durante lo sviluppo?</strong></summary>

1. **Usa il piano gratuito**: Microsoft Foundry Models offre 50.000 token/mese gratuiti
2. **Riduci la capacità**: Imposta la capacità a 10 TPM invece di 30+ per lo sviluppo
3. **Usa azd down**: Dealloca le risorse quando non stai sviluppando attivamente
4. **Metti in cache le risposte**: Implementa una cache Redis per query ripetute
5. **Utilizza l'ingegneria dei prompt**: Riduci l'uso di token con prompt efficienti


```bash
# Configurazione di sviluppo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Qual è la differenza tra Microsoft Foundry Models e l'API di OpenAI?</strong></summary>

**Microsoft Foundry Models**:
- Sicurezza e conformità aziendale
- Integrazione con reti private
- Garanzie SLA
- Autenticazione con Managed Identity
- Quote più elevate disponibili

**OpenAI API**:
- Accesso più rapido ai nuovi modelli
- Configurazione più semplice
- Barriera d'ingresso più bassa
- Solo internet pubblico

Per le applicazioni in produzione, si raccomanda **Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Come gestisco gli errori dovuti al superamento della quota in Microsoft Foundry Models?</strong></summary>

```bash
# Verifica la quota corrente
az cognitiveservices usage list --location eastus2

# Prova una regione diversa
azd env set AZURE_LOCATION westus2
azd up

# Riduci temporaneamente la capacità
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Richiedi un aumento della quota
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
<summary><strong>Come posso mettere in sicurezza gli endpoint dei modelli AI?</strong></summary>

**Migliori pratiche**:
1. Usare Managed Identity (nessuna chiave API)
2. Abilitare Private Endpoints
3. Configurare i gruppi di sicurezza di rete
4. Implementare il rate limiting
5. Usare Azure Key Vault per i segreti

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

- **Discord di Microsoft Foundry**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD su GitHub**: [Issue e discussioni](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentazione ufficiale](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill su skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installa le skill Azure + Foundry nel tuo editor con `npx skills add microsoft/github-copilot-for-azure`

---

**Navigazione del Capitolo:**
- **📚 Home del corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo corrente**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Capitolo precedente**: [Capitolo 1: Il tuo primo progetto](../chapter-01-foundation/first-project.md)
- **➡️ Successivo**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Capitolo successivo**: [Capitolo 3: Configuration](../chapter-03-configuration/configuration.md)

**Hai bisogno di aiuto?** Unisciti alle discussioni della community o apri una issue nel repository. La community Azure AI + AZD è qui per aiutarti ad avere successo!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->