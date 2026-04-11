# Integrarea Microsoft Foundry cu AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Capitolul 2 - Dezvoltare orientată pe AI
- **⬅️ Previous Chapter**: [Capitolul 1: Primul tău proiect](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [Dezploierea modelului AI](ai-model-deployment.md)
- **🚀 Next Chapter**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

## Prezentare generală

Acest ghid demonstrează cum să integrezi serviciile Microsoft Foundry cu Azure Developer CLI (AZD) pentru implementări de aplicații AI simplificate. Microsoft Foundry oferă o platformă cuprinzătoare pentru construirea, implementarea și gestionarea aplicațiilor AI, în timp ce AZD simplifică procesul de infrastructură și implementare.

## Ce este Microsoft Foundry?

Microsoft Foundry este platforma unificată a Microsoft pentru dezvoltarea AI care include:

- **Catalog de modele**: Acces la modele AI de ultimă generație
- **Prompt Flow**: Designer vizual pentru fluxuri de lucru AI
- **Portal Microsoft Foundry**: Mediu integrat de dezvoltare pentru aplicații AI
- **Opțiuni de implementare**: Multiple opțiuni de găzduire și scalare
- **Siguranță și securitate**: Funcții încorporate pentru AI responsabil

## AZD + Microsoft Foundry: Mai bune împreună

| Caracteristică | Microsoft Foundry | Beneficiu integrare AZD |
|---------|-----------------|------------------------|
| **Implementare modele** | Implementare manuală în portal | Implementări automatizate și repetabile |
| **Infrastructură** | Provisionare prin clic | Infrastructură ca Cod (Bicep) |
| **Gestionarea mediului** | Concentrare pe un singur mediu | Mai multe medii (dev/staging/prod) |
| **Integrare CI/CD** | Limitată | Suport nativ pentru GitHub Actions |
| **Gestionarea costurilor** | Monitorizare de bază | Optimizare a costurilor specifică mediului |

## Cerințe prealabile

- Abonament Azure cu permisiunile corespunzătoare
- Azure Developer CLI instalat
- Acces la serviciile Microsoft Foundry Models
- Familiaritate de bază cu Microsoft Foundry

> **Linia de bază curentă AZD:** Aceste exemple au fost verificate cu `azd` `1.23.12`. Pentru fluxul de lucru al agentului AI, folosește versiunea de preview curentă a extensiei și verifică versiunea instalată înainte de a începe.

## Modele principale de integrare

### Model 1: Integrarea cu modelele Microsoft Foundry

**Caz de utilizare**: Implementarea aplicațiilor de chat cu modelele Microsoft Foundry

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

### Model 2: Integrare AI Search + RAG

**Caz de utilizare**: Implementarea aplicațiilor de generare augmentată prin regăsire (RAG)

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

**Caz de utilizare**: Fluxuri de lucru pentru procesarea și analiza documentelor

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

**Configurare pentru producție:**
```bash
# Servicii AI de bază
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Configurațiile modelului
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Setări de performanță
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configurare pentru dezvoltare:**
```bash
# Setări optimizate din punct de vedere al costurilor pentru dezvoltare
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
# Instalează extensia Foundry agents
azd extension install azure.ai.agents

# Instalează extensia pentru fine-tuning
azd extension install azure.ai.finetune

# Instalează extensia pentru modele personalizate
azd extension install azure.ai.models

# Listează extensiile instalate
azd extension list --installed

# Inspectează versiunea curentă a extensiei pentru agenți instalată
azd extension show azure.ai.agents
```

Extensiile AI evoluează încă rapid în preview. Dacă o comandă se comportă diferit față de exemplul de aici, actualizează extensia relevantă înainte de a depana proiectul în sine.

### Implementare orientată pe agent cu `azd ai`

Dacă ai un manifest de agent, folosește `azd ai agent init` pentru a genera un proiect conectat la Foundry Agent Service:

```bash
# Inițializează dintr-un manifest de agent
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Implementare în Azure
azd up
```

Versiunile recente de preview ale `azure.ai.agents` au adăugat și suport pentru inițializare bazată pe șabloane pentru `azd ai agent init`. Dacă urmezi exemple mai noi de agenți, verifică ajutorul extensiei pentru flag-urile exacte disponibile în versiunea instalată.

Vezi [Comenzi AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pentru referința completă a comenzilor și flag-urilor.

### Implementare cu o singură comandă

```bash
# Desfășoară totul cu o singură comandă
azd up

# Sau desfășoară incremental
azd provision  # Doar infrastructura
azd deploy     # Doar aplicația

# Pentru implementări pe termen lung ale aplicațiilor AI în azd 1.23.11+
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

### Securitate de rețea

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

## Optimizare performanță

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

### Problema 1: Cota OpenAI depășită

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

# Reduce temporar capacitatea
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problema 2: Eșecuri de autentificare

**Simptome:**
- Erori 401/403 la apelarea serviciilor AI
- Mesaje "Access denied"

**Soluții:**
```bash
# Verificați atribuțiile de rol
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Verificați configurația identității gestionate
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validați accesul la Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Probleme de implementare a modelelor

**Simptome:**
- Modele nedisponibile în implementare
- Versiuni specifice de model care eșuează

**Soluții:**
```bash
# Listează modelele disponibile în funcție de regiune
az cognitiveservices model list --location eastus

# Actualizează versiunea modelului în șablonul bicep
# Verifică cerințele de capacitate ale modelului
```

## Șabloane de exemplu

### RAG Chat Application (Python)

**Depozit**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servicii**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descriere**: Cel mai popular exemplu Azure AI — o aplicație RAG de chat pregătită pentru producție care îți permite să pui întrebări pe baza propriilor documente. Folosește GPT-4.1-mini pentru chat, text-embedding-3-large pentru embedding-uri și Azure AI Search pentru regăsire. Suportă documente multimodale, intrare/ieșire vocală, autentificare Microsoft Entra și trasabilitate Application Insights.

**Pornire rapidă**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Depozit**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Servicii**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descriere**: Echivalentul .NET/C# al exemplului RAG din Python. Construit cu ASP.NET Core Minimal API și frontend Blazor WebAssembly. Include chat vocal, suport GPT-4o-mini vision și un client desktop/mobile companion .NET MAUI Blazor Hybrid.

**Pornire rapidă**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Depozit**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Servicii**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descriere**: Versiunea Java a exemplului RAG folosind Langchain4J pentru orchestrarea AI. Suportă arhitectură microservicii bazată pe evenimente, multiple strategii de căutare (text, vector, hibrid), încărcare de documente cu Azure Document Intelligence și implementare fie pe Azure Container Apps, fie pe Azure Kubernetes Service.

**Pornire rapidă**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**Depozit**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servicii**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descriere**: Copilot RAG end-to-end pentru retail care folosește Azure AI Foundry și Prompty. Chatbot pentru retailerul Contoso Outdoor care fundamentează răspunsurile în catalogul de produse și datele comenzilor clienților. Demonstrează fluxul complet GenAIOps — prototipare cu Prompty, evaluare cu evaluatori asistați de AI și implementare prin AZD către Container Apps.

**Pornire rapidă**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Depozit**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Servicii**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descriere**: Exemplu multi-agent care demonstrează orchestrarea agenților AI cu Prompty. Folosește un agent de cercetare (Bing Grounding în Azure AI Agent Service), un agent de produs (Azure AI Search), un agent scriitor și un agent editor pentru a produce colaborativ articole bine documentate. Include CI/CD cu evaluare în GitHub Actions.

**Pornire rapidă**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Depozit**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Servicii**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Descriere**: Chatbot RAG complet serverless folosind LangChain.js cu Azure Functions pentru API și Azure Static Web Apps pentru găzduire. Folosește Azure Cosmos DB atât ca magazin vectorial, cât și ca bază de date pentru istoricul de chat. Suportă dezvoltare locală cu Ollama pentru testare fără costuri.

**Pornire rapidă**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Depozit**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Servicii**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Descriere**: Accelerator de soluție RAG pentru întreprinderi, cu portal de administrare pentru încărcarea/gestionarea documentelor, multiple opțiuni de orchestrare (Semantic Kernel, LangChain, Prompt Flow), speech-to-text, integrare Microsoft Teams și alegerea între backend PostgreSQL sau Cosmos DB. Proiectat ca punct de plecare personalizabil pentru scenarii RAG în producție.

**Pornire rapidă**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Depozit**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Servicii**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Descriere**: Aplicație de referință pentru orchestrarea multi-agent AI folosind trei framework-uri (LangChain.js, LlamaIndex.TS și Microsoft Agent Framework). Include servere MCP (Model Context Protocol) în patru limbi, implementate ca Azure Container Apps serverless, cu monitorizare OpenTelemetry.

**Pornire rapidă**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Depozit**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Servicii**: Azure AI Services + Azure OpenAI

**Descriere**: Șablon Bicep minim care implementează servicii Azure AI cu modele de machine learning configurate. Un punct de plecare ușor atunci când ai nevoie doar ca infrastructura Azure AI să fie provisionată fără un stack de aplicație complet.

**Pornire rapidă**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Răsfoiește mai multe șabloane**: Vizitează [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) pentru peste 80 de șabloane AZD specifice AI, în diverse limbaje și scenarii.

## Următorii pași

1. **Încearcă exemplele**: Pornește cu un șablon preconstruit care se potrivește cazului tău de utilizare
2. **Personalizează pentru nevoile tale**: Modifică infrastructura și codul aplicației
3. **Adaugă monitorizare**: Implementează observabilitate cuprinzătoare
4. **Optimizează costurile**: Ajustează configurațiile pentru bugetul tău
5. **Asigură implementarea**: Aplică patternuri de securitate enterprise
6. **Scalează la producție**: Adaugă caracteristici multi-regiune și înaltă disponibilitate

## 🎯 Exerciții practice

### Exercițiul 1: Implementați o aplicație de chat cu modelele Microsoft Foundry (30 de minute)
**Scop**: Implementarea și testarea unei aplicații de chat AI pregătită pentru producție

```bash
# Inițializează șablonul
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Setează variabilele de mediu
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Implementează
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
- [ ] Se poate accesa interfața de chat în browser
- [ ] Se pot pune întrebări și se primesc răspunsuri generate de AI
- [ ] Application Insights afișează date de telemetrie
- [ ] Resursele au fost curățate cu succes

**Cost estimat**: $5-10 pentru 30 de minute de testare

### Exercițiul 2: Configurează implementare multi-model (45 de minute)
**Scop**: Implementarea mai multor modele AI cu configurații diferite

```bash
# Creați o configurație Bicep personalizată
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

# Implementați și verificați
azd provision
azd show
```

**Criterii de succes:**
- [ ] Mai multe modele implementate cu succes
- [ ] Aplicate setări de capacitate diferite
- [ ] Modelele accesibile prin API
- [ ] Se pot apela ambele modele din aplicație

### Exercițiul 3: Implementează monitorizarea costurilor (20 de minute)
**Scop**: Configurarea alertelor de buget și urmărire a costurilor

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

# Lansează alerta de buget
azd provision

# Verifică costurile curente
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Criterii de succes:**
- [ ] Alertă de buget creată în Azure
- [ ] Notificări prin email configurate
- [ ] Se pot vizualiza datele de cost în Azure Portal
- [ ] Praguri de buget setate corespunzător

## 💡 Întrebări frecvente

<details>
<summary><strong>Cum reduc costurile modelelor Microsoft Foundry în timpul dezvoltării?</strong></summary>

1. **Folosește nivelul gratuit**: Microsoft Foundry Models oferă 50.000 de tokenuri/lună gratuit
2. **Redu capacitatea**: Setează capacitatea la 10 TPM în loc de 30+ pentru dezvoltare
3. **Folosește azd down**: Dealocă resursele când nu dezvolți activ
4. **Cachează răspunsurile**: Implementează un cache Redis pentru interogările repetate
5. **Folosește ingineria prompturilor**: Redu consumul de tokenuri prin prompturi eficiente


```bash
# Configurație de dezvoltare
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Care este diferența între Microsoft Foundry Models și OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Securitate și conformitate la nivel de întreprindere
- Integrare cu rețele private
- Garanții SLA
- Autentificare Managed Identity
- Cote mai mari disponibile

**OpenAI API**:
- Acces mai rapid la modele noi
- Configurare mai simplă
- Barieră de intrare mai mică
- Doar internet public

Pentru aplicații de producție, **Microsoft Foundry Models este recomandat**.
</details>

<details>
<summary><strong>Cum gestionez erorile de cotă depășită pentru Microsoft Foundry Models?</strong></summary>

```bash
# Verificați cota curentă
az cognitiveservices usage list --location eastus2

# Încercați o regiune diferită
azd env set AZURE_LOCATION westus2
azd up

# Reduceți temporar capacitatea
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Solicitați creșterea cotei
# Accesați Portalul Azure > Cote > Solicitați creșterea
```
</details>

<details>
<summary><strong>Pot folosi propriile date cu Microsoft Foundry Models?</strong></summary>

Da! Folosește **Azure AI Search** pentru RAG (Retrieval Augmented Generation):

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
<summary><strong>Cum securizez endpoint-urile modelelor AI?</strong></summary>

**Cele mai bune practici**:
1. Folosește Managed Identity (fără chei API)
2. Activează Private Endpoints
3. Configurează grupuri de securitate de rețea
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

- **Microsoft Foundry Discord**: [#Canal Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Probleme și discuții](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentație oficială](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Skill Microsoft Foundry pe skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instalează skill-urile Azure + Foundry în editorul tău cu `npx skills add microsoft/github-copilot-for-azure`

---

**Navigare capitole:**
- **📚 Pagina cursului**: [AZD For Beginners](../../README.md)
- **📖 Capitolul curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Capitolul anterior**: [Capitolul 1: Primul tău proiect](../chapter-01-foundation/first-project.md)
- **➡️ Următorul**: [Implementarea modelelor AI](ai-model-deployment.md)
- **🚀 Capitolul următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

**Ai nevoie de ajutor?** Participă la discuțiile comunității noastre sau deschide un issue în repository. Comunitatea Azure AI + AZD este aici pentru a te ajuta să reușești!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru eventuale neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->