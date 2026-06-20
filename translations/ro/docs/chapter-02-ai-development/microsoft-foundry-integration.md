# Integrarea Microsoft Foundry cu AZD

**Navigare capitole:**
- **📚 Acasă curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Capitol anterior**: [Capitolul 1: Primul Proiect](../chapter-01-foundation/first-project.md)
- **➡️ Următor**: [Implementarea Modelului AI](ai-model-deployment.md)
- **🚀 Capitol următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

## Prezentare generală

Acest ghid demonstrează cum să integrați serviciile Microsoft Foundry cu Azure Developer CLI (AZD) pentru implementări eficiente ale aplicațiilor AI. Microsoft Foundry oferă o platformă cuprinzătoare pentru construirea, implementarea și gestionarea aplicațiilor AI, în timp ce AZD simplifică procesul de infrastructură și implementare.

## Ce este Microsoft Foundry?

Microsoft Foundry este platforma unificată a Microsoft pentru dezvoltarea AI, care include:

- **Catalog de modele**: Acces la modele AI de ultimă generație
- **Prompt Flow**: Designer vizual pentru fluxuri de lucru AI
- **Portal Microsoft Foundry**: Mediu integrat de dezvoltare pentru aplicații AI
- **Opțiuni de implementare**: Multipli hosting și opțiuni de scalare
- **Securitate și siguranță**: Funcții integrate de AI responsabilă

## AZD + Microsoft Foundry: Mai bune împreună

| Caracteristică | Microsoft Foundry | Beneficiu integrare AZD |
|----------------|-------------------|------------------------|
| **Implementare model** | Implementare manuală în portal | Implementări automate și repetitive |
| **Infrastructură** | Provisionare prin click | Infrastructură ca cod (Bicep) |
| **Gestionare medii** | Focalizare pe un singur mediu | Medii multiple (dev/staging/prod) |
| **Integrare CI/CD** | Limitată | Suport nativ pentru GitHub Actions |
| **Gestionare costuri** | Monitorizare de bază | Optimizare costuri specifică mediilor |

## Cerințe prealabile

- Abonament Azure cu permisiuni potrivite
- Azure Developer CLI instalat
- Acces la serviciile Microsoft Foundry Models
- Familiarizare de bază cu Microsoft Foundry

> **Versiunea curentă AZD:** Exemplele au fost testate cu `azd` `1.23.12`. Pentru fluxul AI agent, folosiți ultima versiune de previzualizare a extensiei și verificați versiunea instalată înainte de a începe.

## Tipare cheie de integrare

### Tipar 1: Integrare Microsoft Foundry Models

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

### Tipar 2: Integrare AI Search + RAG

**Caz de utilizare**: Implementarea aplicațiilor retrieval-augmented generation (RAG)

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

### Tipar 3: Integrare Document Intelligence

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

## 🔧 Tipare de configurare

### Setarea variabilelor de mediu

**Configurare producție:**
```bash
# Servicii AI de bază
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Configurări model
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Setări de performanță
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configurare dezvoltare:**
```bash
# Setări optimizate pentru costuri pentru dezvoltare
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

# Instalează extensia de fine-tuning
azd extension install azure.ai.finetune

# Instalează extensia pentru modele personalizate
azd extension install azure.ai.models

# Listează extensiile instalate
azd extension list --installed

# Inspectează versiunea extensiei agentului instalată în prezent
azd extension show azure.ai.agents
```

Extensiile AI sunt încă în evoluție rapidă în faza de previzualizare. Dacă o comandă funcționează diferit față de cele prezentate aici, actualizați extensia relevantă înainte de a investiga problema proiectului.

### Implementare orientată agent cu `azd ai`

Dacă aveți un manifest de agent, folosiți `azd ai agent init` pentru a crea un proiect conectat la Foundry Agent Service:

```bash
# Inițializare dintr-un manifest de agent
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Implementare în Azure
azd up
```

Versiunile recente de previzualizare ale `azure.ai.agents` au adăugat suport pentru inițializare pe bază de șabloane cu `azd ai agent init`. Dacă urmați exemple mai noi de agenți, verificați ajutorul extensiei pentru semnalele exacte disponibile în versiunea instalată.

Consultați [Comenzile AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pentru referința completă de comenzi și semnale.

### Implementare cu o singură comandă

```bash
# Desfășurați totul cu o singură comandă
azd up

# Sau desfășurați incremental
azd provision  # Doar infrastructura
azd deploy     # Doar aplicația

# Pentru desfășurări aplicații AI pe termen lung în azd 1.23.11+
azd deploy --timeout 1800
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

### Monitorizarea costurilor

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

### Configurare identitate gestionată

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

### Securitatea rețelei

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

## Depanare probleme comune

### Problema 1: Depășirea cotei OpenAI

**Simptome:**
- Implementare eșuează cu erori de cota
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

### Problema 2: Eșecuri de autentificare

**Simptome:**
- Erori 401/403 la apelarea serviciilor AI
- Mesaje "Acces refuzat"

**Soluții:**
```bash
# Verificați atribuțiile rolurilor
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Verificați configurația identității gestionate
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validați accesul la Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Probleme la implementarea modelelor

**Simptome:**
- Modele indisponibile în implementare
- Versiuni specifice de model care eșuează

**Soluții:**
```bash
# Listează modelele disponibile pe regiune
az cognitiveservices model list --location eastus

# Actualizează versiunea modelului în șablonul bicep
# Verifică cerințele de capacitate ale modelului
```

## Șabloane exemplu

### Aplicație chat RAG (Python)

**Depozit**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servicii**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descriere**: Cel mai popular exemplu Azure AI — o aplicație chat RAG gata de producție care permite întrebări asupra propriilor documente. Folosește GPT-4.1-mini pentru chat, text-embedding-3-large pentru embeddings și Azure AI Search pentru căutare. Suportă documente multimodale, input/output vocal, autentificare Microsoft Entra și urmărire Application Insights.

**Pornire rapidă**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Aplicație chat RAG (.NET)

**Depozit**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Servicii**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descriere**: Echivalentul .NET/C# al exemplului Python RAG chat. Construit cu ASP.NET Core Minimal API și frontend Blazor WebAssembly. Include chat vocal, suport GPT-4o-mini vision și client desktop/mobile .NET MAUI Blazor Hybrid.

**Pornire rapidă**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Aplicație chat RAG (Java)

**Depozit**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Servicii**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descriere**: Versiunea Java a exemplului RAG chat folosind Langchain4J pentru orchestrare AI. Suportă arhitectură microservicii eveniment-driven, strategii multiple de căutare (text, vector, hibrid), încărcare documente cu Azure Document Intelligence și implementare pe Azure Container Apps sau Azure Kubernetes Service.

**Pornire rapidă**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Copilot Enterprise Retail cu Microsoft Foundry

**Depozit**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servicii**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descriere**: Copilot retail RAG end-to-end folosind Microsoft Foundry și Prompty. Chatbot pentru retailerul Contoso Outdoor care ancorează răspunsuri în catalogul de produse și datele comenzilor clienților. Demonstrează întregul flux GenAIOps — prototipare cu Prompty, evaluare cu evaluatori asistați AI și implementare cu AZD la Container Apps.

**Pornire rapidă**:
```bash
azd init --template contoso-chat
azd up
```

### Aplicație multi-agent pentru scriere creativă

**Depozit**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Servicii**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descriere**: Exemplu multi-agent demonstrând orchestrarea agenților AI cu Prompty. Folosește un agent de cercetare (Bing Grounding în Azure AI Agent Service), un agent de produs (Azure AI Search), un agent scriitor și un agent editor pentru a produce colaborativ articole bine documentate. Include CI/CD cu evaluare în GitHub Actions.

**Pornire rapidă**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Chat RAG serverless (JavaScript/TypeScript)

**Depozit**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Servicii**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB pentru NoSQL + LangChain.js

**Descriere**: Chatbot RAG complet serverless folosind LangChain.js cu Azure Functions pentru API și Azure Static Web Apps pentru hosting. Folosește Azure Cosmos DB ca stoc vectorial și bază de date istoric chat. Suportă dezvoltare locală cu Ollama pentru testare fără costuri.

**Pornire rapidă**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Accelerator soluție Chat cu Datele Tale

**Depozit**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Servicii**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Descriere**: Accelerator soluție RAG de nivel enterprise cu portal admin pentru încărcare/gestionare documente, opțiuni multiple de orchestrator (Semantic Kernel, LangChain, Prompt Flow), speech-to-text, integrare Microsoft Teams și alegere backend PostgreSQL sau Cosmos DB. Creat ca punct de start personalizabil pentru scenarii RAG de producție.

**Pornire rapidă**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### Agenți de turism AI — Orchestrare Multi-Agent MCP

**Depozit**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Servicii**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Descriere**: Aplicație de referință pentru orchestrarea multi-agent AI folosind trei framework-uri (LangChain.js, LlamaIndex.TS și Microsoft Agent Framework). Include servere MCP (Model Context Protocol) în patru limbaje implementate ca Azure Container Apps serverless cu monitorizare OpenTelemetry.

**Pornire rapidă**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Starter Azure AI

**Depozit**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Servicii**: Azure AI Services + Azure OpenAI

**Descriere**: Șablon Bicep minimal care implementează servicii Azure AI cu modele de machine learning configurate. Un punct de plecare ușor când ai nevoie doar de infrastructura Azure AI fără un întreg stack aplicațional.

**Pornire rapidă**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Răsfoiește mai multe șabloane**: Vizitează [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) pentru peste 80 de șabloane AZD specifice AI în diverse limbaje și scenarii.

## Pașii următori

1. **Încearcă exemplele**: Pornește cu un șablon preconstruit care se potrivește cazului tău de utilizare
2. **Personalizează conform nevoilor**: Modifică infrastructura și codul aplicației
3. **Adaugă monitorizare**: Implementează observabilitate completă
4. **Optimizează costurile**: Ajustează configurările pentru bugetul tău
5. **Asigură implementarea**: Pune în aplicare modele de securitate enterprise
6. **Scalare în producție**: Adaugă caracteristici multi-regiune și de înaltă disponibilitate

## 🎯 Exerciții practice

### Exercițiul 1: Implementarea Microsoft Foundry Models Chat App (30 minute)
**Scop**: Implementarea și testarea unei aplicații chat AI gata de producție

```bash
# Inițializează șablonul
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Setează variabilele de mediu
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Deploy (Lansare)
azd up

# Testează aplicația
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Monitorizează operațiunile AI
azd monitor

# Curăță (Elimină)
azd down --force --purge
```

**Criterii de succes:**
- [ ] Implementarea se finalizează fără erori de cota
- [ ] Se poate accesa interfața chat în browser
- [ ] Se pot pune întrebări și primi răspunsuri generate de AI
- [ ] Application Insights afișează date de telemetrie
- [ ] Resursele au fost curățate cu succes

**Cost estimat**: 5-10 USD pentru 30 de minute de testare

### Exercițiul 2: Configurare implementare multi-model (45 minute)
**Scop**: Implementarea mai multor modele AI cu configurații diferite

```bash
# Creează configurație Bicep personalizată
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

# Implementare și verificare
azd provision
azd show
```

**Criterii de succes:**
- [ ] Mai multe modele implementate cu succes
- [ ] Setări diferite de capacitate aplicate
- [ ] Modele accesibile prin API
- [ ] Se pot apela ambele modele din aplicație

### Exercițiul 3: Implementarea monitorizării costurilor (20 minute)
**Scop**: Configurarea alertelor de buget și urmărirea costurilor

```bash
# Adăugați alertă bugetară la Bicep
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

# Implementați alerta bugetară
azd provision

# Verificați costurile curente
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Criterii de succes:**
- [ ] Alertă buget creată în Azure
- [ ] Notificări prin email configurate
- [ ] Datele costurilor vizualizabile în Azure Portal
- [ ] Pragurile de buget setate corect

## 💡 Întrebări frecvente

<details>
<summary><strong>Cum pot reduce costurile Microsoft Foundry Models în timpul dezvoltării?</strong></summary>

1. **Folosește nivelul gratuit**: Microsoft Foundry Models oferă 50.000 de tokeni pe lună gratuit
2. **Reduce capacitatea**: Setează capacitatea la 10 TPM în loc de 30+ pentru dezvoltare
3. **Folosește azd down**: De alocă resursele când nu dezvolți activ
4. **Cachează răspunsuri**: Implementează cache Redis pentru interogări repetate
5. **Folosește inginerie de prompturi**: Redu utilizarea tokenilor cu prompturi eficiente
```bash
# Configurație de dezvoltare
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Care este diferența dintre Microsoft Foundry Models și OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Securitate și conformitate pentru întreprinderi
- Integrare în rețea privată
- Garanții SLA
- Autentificare cu identitate gestionată
- Cote mai mari disponibile

**OpenAI API**:
- Acces mai rapid la modele noi
- Configurare mai simplă
- Barieră de intrare mai mică
- Doar internet public

Pentru aplicații de producție, **Microsoft Foundry Models este recomandat**.
</details>

<details>
<summary><strong>Cum gestionez erorile de depășire a cotei în Microsoft Foundry Models?</strong></summary>

```bash
# Verifică cota curentă
az cognitiveservices usage list --location eastus2

# Încearcă o regiune diferită
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacitatea temporar
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Solicită creșterea cotei
# Mergi la Portalul Azure > Cote > Solicită creșterea
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
1. Folosește Identitate Gestionată (fără chei API)
2. Activează Puncte Finale Private
3. Configurează grupuri de securitate pentru rețea
4. Implementează limitarea ratei
5. Folosește Azure Key Vault pentru secrete

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

- **Microsoft Foundry Discord**: [canalul #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Probleme și discuții](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentație oficială](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Competența Microsoft Foundry pe skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instalează competențele agenților Azure + Foundry în editorul tău cu `npx skills add microsoft/github-copilot-for-azure`

---

**Navigare capitole:**
- **📚 Acasă curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Capitolul anterior**: [Capitolul 1: Primul tău proiect](../chapter-01-foundation/first-project.md)
- **➡️ Următorul**: [Implementare model AI](ai-model-deployment.md)
- **🚀 Capitolul următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

**Ai nevoie de ajutor?** Alătură-te discuțiilor comunității sau deschide o problemă în depozit. Comunitatea Azure AI + AZD este aici să te ajute să reușești!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->