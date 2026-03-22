# Integrarea Microsoft Foundry cu AZD

**Navigare capitole:**
- **📚 Pagina principală curs:** [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent:** Capitolul 2 - Dezvoltare AI-First
- **⬅️ Capitolul anterior:** [Capitolul 1: Primul tău proiect](../chapter-01-foundation/first-project.md)
- **➡️ Următorul:** [Implementarea modelului AI](ai-model-deployment.md)
- **🚀 Următorul capitol:** [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

## Prezentare generală

Acest ghid demonstrează cum să integrezi serviciile Microsoft Foundry cu Azure Developer CLI (AZD) pentru implementări simplificate de aplicații AI. Microsoft Foundry oferă o platformă completă pentru construirea, implementarea și gestionarea aplicațiilor AI, în timp ce AZD simplifică procesul de infrastructură și implementare.

## Ce este Microsoft Foundry?

Microsoft Foundry este platforma unificată Microsoft pentru dezvoltare AI care include:

- **Catalog de modele**: Acces la modele AI de ultimă generație
- **Prompt Flow**: Designer vizual pentru fluxuri de lucru AI
- **Portal Microsoft Foundry**: Mediu integrat de dezvoltare pentru aplicații AI
- **Opțiuni de implementare**: Multiple opțiuni de găzduire și scalare
- **Siguranță și securitate**: Funcții AI responsabile integrate

## AZD + Microsoft Foundry: Mai bune împreună

| Funcționalitate | Microsoft Foundry | Beneficii integrare AZD |
|-----------------|-------------------|------------------------|
| **Implementare modele** | Implementare manuală prin portal | Implementări automate, repetitive |
| **Infrastructură** | Provisionare prin click-uri | Infrastructură ca și cod (Bicep) |
| **Gestionare mediu** | Focus pe un singur mediu | Medii multiple (dev/staging/prod) |
| **Integrare CI/CD** | Limitată | Suport nativ pentru GitHub Actions |
| **Gestionare costuri** | Monitorizare de bază | Optimizare costuri specifică mediului |

## Cerințe preliminare

- Abonament Azure cu permisiuni corespunzătoare
- Azure Developer CLI instalat
- Acces la serviciile Microsoft Foundry Models
- Familiaritate de bază cu Microsoft Foundry

## Modele principale de integrare

### Model 1: Integrarea Microsoft Foundry Models

**Caz de utilizare**: Implementarea aplicațiilor chat cu modele Microsoft Foundry Models

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

**Infrastructură (main.bicep):**
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

### Model 2: Integrare AI Search + RAG

**Caz de utilizare**: Implementarea aplicațiilor de generare augmentată prin recuperare (RAG)

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

### Model 3: Integrare Document Intelligence

**Caz de utilizare**: Fluxuri de procesare și analiză documente

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

## 🔧 Modele de configurare

### Configurare variabile de mediu

**Configurare producție:**
```bash
# Servicii AI de bază
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Configurații ale modelului
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Setări de performanță
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configurare dezvoltare:**
```bash
# Setări optimizate pentru cost în dezvoltare
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Nivel gratuit
```

### Configurare sigură cu Key Vault

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

## Fluxuri de implementare

### Extensii AZD pentru Foundry

AZD oferă extensii care adaugă capabilități specifice AI pentru lucrul cu serviciile Microsoft Foundry:

```bash
# Instalează extensia agenților Foundry
azd extension install azure.ai.agents

# Instalează extensia de ajustare fină
azd extension install azure.ai.finetune

# Instalează extensia modelelor personalizate
azd extension install azure.ai.models

# Listează extensiile instalate
azd extension list
```

### Implementare Agent-First cu `azd ai`

Dacă ai un manifest pentru agent, folosește `azd ai agent init` pentru a scaffolda un proiect conectat la Foundry Agent Service:

```bash
# Inițializează dintr-un manifest de agent
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Distribuie pe Azure
azd up
```

Vezi [Comenzile AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pentru referința completă a comenzilor și flag-urilor.

### Implementare cu o singură comandă

```bash
# Desfășurați totul cu o singură comandă
azd up

# Sau desfășurați incremental
azd provision  # Doar infrastructura
azd deploy     # Doar aplicația
```

### Implementări specifice mediului

```bash
# Mediu de dezvoltare
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Mediu de producție
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitorizare și observabilitate

### Integrare Application Insights

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

### Monitorizare costuri

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

## 🔐 Cele mai bune practici de securitate

### Configurare Managed Identity

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

### Securitate rețea

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

## Optimizarea performanței

### Strategii de caching

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

### Configurare auto-scalare

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

## Rezolvarea problemelor comune

### Problemă 1: Cota OpenAI depășită

**Simptome:**
- Implementarea eșuează cu erori de cotă
- Erori 429 în jurnalele aplicației

**Soluții:**
```bash
# Verifică utilizarea curentă a cotei
az cognitiveservices usage list --location eastus

# Încearcă o regiune diferită
azd env set AZURE_LOCATION westus2
azd up

# Redu capacitatea temporar
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problemă 2: Eșecuri de autentificare

**Simptome:**
- Erori 401/403 la apelarea serviciilor AI
- Mesaje "Acces interzis"

**Soluții:**
```bash
# Verificați atribuțiile rolurilor
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Verificați configurația identității gestionate
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validați accesul la Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problemă 3: Probleme cu implementarea modelelor

**Simptome:**
- Modelele nu sunt disponibile în implementare
- Versiuni specifice de modele au probleme

**Soluții:**
```bash
# Listează modelele disponibile pe regiune
az cognitiveservices model list --location eastus

# Actualizează versiunea modelului în șablonul bicep
# Verifică cerințele de capacitate ale modelului
```

## Șabloane exemplu

### Aplicație chat RAG (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servicii**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descriere**: Cel mai popular exemplu Azure AI — o aplicație chat RAG gata pentru producție care permite întrebări asupra propriilor documente. Folosește GPT-4.1-mini pentru chat, text-embedding-ada-002 pentru embeddinguri și Azure AI Search pentru recuperare. Suportă documente multimodale, intrare/ieșire vocală, autentificare Microsoft Entra și urmărire Application Insights.

**Pornire rapidă**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Aplicație chat RAG (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Servicii**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descriere**: Echivalentul .NET/C# al exemplului Python RAG chat. Construit cu ASP.NET Core Minimal API și frontend Blazor WebAssembly. Include chat vocal, suport GPT-4o-mini vision și client desktop/mobile .NET MAUI Blazor Hybrid companion.

**Pornire rapidă**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Aplicație chat RAG (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Servicii**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descriere**: Versiunea Java a exemplului RAG chat folosind Langchain4J pentru orchestrare AI. Suportă arhitectură microservicii bazată pe evenimente, strategii multiple de căutare (text, vectorial, hibrid), încărcare documente cu Azure Document Intelligence și implementare în Azure Container Apps sau Azure Kubernetes Service.

**Pornire rapidă**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Copilot retail enterprise cu Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servicii**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descriere**: Copilot retail RAG end-to-end folosind Azure AI Foundry și Prompty. Chatbot pentru retailerul Contoso Outdoor care fundamentază răspunsurile în catalogul de produse și datele comenzilor clienților. Demonstrează fluxul complet GenAIOps — prototip cu Prompty, evaluare cu evaluatori asistați AI și implementare prin AZD în Container Apps.

**Pornire rapidă**:
```bash
azd init --template contoso-chat
azd up
```

### Aplicație multi-agent pentru scris creativ

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Servicii**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descriere**: Exemplu multi-agent demonstrând orchestrarea agenților AI cu Prompty. Folosește un agent de cercetare (Bing Grounding în Azure AI Agent Service), un agent de produse (Azure AI Search), un agent scriitor și un agent editor care colaborează pentru a produce articole bine documentate. Include CI/CD cu evaluare în GitHub Actions.

**Pornire rapidă**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Chat RAG serverless (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Servicii**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB pentru NoSQL + LangChain.js

**Descriere**: Chatbot RAG complet serverless folosind LangChain.js cu Azure Functions pentru API și Azure Static Web Apps pentru găzduire. Folosește Azure Cosmos DB atât ca depozit vectorial, cât și ca bază de date istoric chat. Suportă dezvoltare locală cu Ollama pentru testare gratuită.

**Pornire rapidă**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Accelerator soluție Chat cu datele tale

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Servicii**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Descriere**: Accelerator soluție RAG enterprise cu portal admin pentru încărcare/gestionare documente, multiple opțiuni de orchestrare (Semantic Kernel, LangChain, Prompt Flow), conversie vorbire-text, integrare Microsoft Teams și opțiune backend PostgreSQL sau Cosmos DB. Proiectat ca punct de pornire personalizabil pentru scenarii RAG de producție.

**Pornire rapidă**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### Agenți de călătorie AI — Orchestrare multi-agent MCP

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Servicii**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Descriere**: Aplicație de referință pentru orchestrarea multi-agent AI folosind trei framework-uri (LangChain.js, LlamaIndex.TS și Microsoft Agent Framework). Include servere MCP (Model Context Protocol) în patru limbaje, implementate ca Azure Container Apps serverless cu monitorizare OpenTelemetry.

**Pornire rapidă**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Starter Azure AI

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Servicii**: Azure AI Services + Azure OpenAI

**Descriere**: Șablon Bicep minimal care implementează serviciile Azure AI cu modele de învățare automată configurate. Un punct de pornire ușor când ai nevoie doar de infrastructura Azure AI fără un stack complet de aplicație.

**Pornire rapidă**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Răsfoiește mai multe șabloane**: Vizitează [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) pentru peste 80 de șabloane AZD specifice AI în diverse limbaje și scenarii.

## Pașii următori

1. **Testează exemplele**: Începe cu un șablon preconstruit care se potrivește cazului tău de utilizare
2. **Personalizează pentru nevoile tale**: Modifică infrastructura și codul aplicației
3. **Adaugă monitorizare**: Implementează observabilitate comprehensivă
4. **Optimizează costurile**: Ajustează configurațiile pentru bugetul tău
5. **Asigură implementarea**: Aplică modele de securitate enterprise
6. **Scalează la producție**: Adaugă funcții multi-regiune și disponibilitate ridicată

## 🎯 Exerciții practice

### Exercițiul 1: Implementare aplicație chat Microsoft Foundry Models (30 minute)
**Scop**: Implementarea și testarea unei aplicații chat AI gata pentru producție

```bash
# Inițializează șablonul
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Setează variabilele de mediu
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Deployază
azd up

# Testează aplicația
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Monitorizează operațiunile AI
azd monitor

# Curăță
azd down --force --purge
```

**Criterii de succes:**
- [ ] Implementarea se finalizează fără erori de cotă
- [ ] Se poate accesa interfața chat în browser
- [ ] Se pot pune întrebări și primi răspunsuri alimentate AI
- [ ] Application Insights afișează date de telemetrie
- [ ] Resursele sunt curățate cu succes

**Cost estimat**: 5-10 $ pentru 30 minute de testare

### Exercițiul 2: Configurare implementare multi-model (45 minute)
**Scop**: Implementarea mai multor modele AI cu configurații diferite

```bash
# Creează o configurație personalizată Bicep
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

# Implementare și verificare
azd provision
azd show
```

**Criterii de succes:**
- [ ] Mai multe modele implementate cu succes
- [ ] Setări de capacitate diferite aplicate
- [ ] Modele accesibile prin API
- [ ] Se pot apela ambele modele din aplicație

### Exercițiul 3: Implementare monitorizare costuri (20 minute)
**Scop**: Configurarea alertelor de buget și urmărirea costurilor

```bash
# Adaugă alertă de buget la Bicep
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

# Implementare alertă de buget
azd provision

# Verifică costurile curente
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Criterii de succes:**
- [ ] Alertă de buget creată în Azure
- [ ] Notificări prin email configurate
- [ ] Se pot vizualiza date cost în Azure Portal
- [ ] Praguri de buget setate corespunzător

## 💡 Întrebări frecvente

<details>
<summary><strong>Cum reduc costurile Microsoft Foundry Models în timpul dezvoltării?</strong></summary>

1. **Folosește Free Tier**: Microsoft Foundry Models oferă 50.000 de tokeni/lună gratuit
2. **Reducerea capacității**: Setează capacitatea la 10 TPM în loc de 30+ pentru dev
3. **Folosește azd down**: Dezalocă resursele când nu dezvolți activ
4. **Cache răspunsuri**: Implementează cache Redis pentru interogări repetitive
5. **Folosește Prompt Engineering**: Redu utilizarea tokenilor cu prompturi eficiente

```bash
# Configurație pentru dezvoltare
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Care este diferența dintre Microsoft Foundry Models și OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Securitate și conformitate enterprise
- Integrare în rețea privată
- Garanții SLA
- Autentificare prin managed identity
- Cote mai mari disponibile

**OpenAI API**:
- Acces mai rapid la modele noi
- Configurare mai simplă
- Barieră de intrare mai joasă
- Acces public numai prin internet

Pentru aplicații de producție, **se recomandă Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Cum gestionez erorile Microsoft Foundry Models privind depășirea cotei?</strong></summary>

```bash
# Verifică cota curentă
az cognitiveservices usage list --location eastus2

# Încearcă o regiune diferită
azd env set AZURE_LOCATION westus2
azd up

# Redu temporar capacitatea
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Solicită creșterea cotei
# Accesează Azure Portal > Cotă > Solicită creștere
```
</details>

<details>
<summary><strong>Pot folosi propriile mele date cu Microsoft Foundry Models?</strong></summary>

Da! Folosește **Azure AI Search** pentru RAG (Generare augmentată prin recuperare):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Vezi șablonul [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Cum securizez punctele finale ale modelelor AI?</strong></summary>

**Cele mai bune practici**:
1. Folosește Managed Identity (fără chei API)
2. Activează Private Endpoints
3. Configurează grupuri de securitate a rețelei
4. Implementează limitarea ratei
5. Utilizează Azure Key Vault pentru secrete

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

## Comunitate și Suport

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues și discuții](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentație oficială](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill pe skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instalează abilitățile agent Azure + Foundry în editorul tău cu `npx skills add microsoft/github-copilot-for-azure`

---

**Navigare capitole:**
- **📚 Pagina cursului**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Capitolul anterior**: [Capitolul 1: Primul tău proiect](../chapter-01-foundation/first-project.md)
- **➡️ Următorul**: [Implementarea modelului AI](ai-model-deployment.md)
- **🚀 Capitolul următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

**Ai nevoie de ajutor?** Alătură-te discuțiilor comunității sau deschide o problemă în repository. Comunitatea Azure AI + AZD este aici să te ajute să reușești!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinări de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu suntem responsabili pentru niciun fel de neînțelegeri sau interpretări greșite care rezultă din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->