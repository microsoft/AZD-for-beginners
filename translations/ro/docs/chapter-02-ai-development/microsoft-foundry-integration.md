# Integrarea Microsoft Foundry cu AZD

**Navigare Capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul Curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Capitolul Anterior**: [Capitolul 1: Primul Tău Proiect](../chapter-01-foundation/first-project.md)
- **➡️ Următorul**: [Dezvoltarea Modelului AI](ai-model-deployment.md)
- **🚀 Capitolul Următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

## Prezentare Generală

Acest ghid demonstrează cum să integrezi serviciile Microsoft Foundry cu Azure Developer CLI (AZD) pentru implementări simplificate ale aplicațiilor AI. Microsoft Foundry oferă o platformă completă pentru construirea, implementarea și gestionarea aplicațiilor AI, în timp ce AZD simplifică infrastructura și procesul de implementare.

## Ce este Microsoft Foundry?

Microsoft Foundry este platforma unificată Microsoft pentru dezvoltarea AI care include:

- **Catalog de Modele**: Acces la modele AI de ultimă generație
- **Prompt Flow**: Designer vizual pentru fluxuri de lucru AI
- **Portal Microsoft Foundry**: Mediu integrat de dezvoltare pentru aplicații AI
- **Opțiuni de Implementare**: Multiple opțiuni de hosting și scalare
- **Siguranță și Securitate**: Funcții responsabile AI integrate

## AZD + Microsoft Foundry: Mai Bine Împreună

| Caracteristică | Microsoft Foundry | Beneficiul Integrării AZD |
|---------|-----------------|------------------------|
| **Implementare Model** | Implementare manuală din portal | Implementări automate, repetabile |
| **Infrastructură** | Provizionare prin click | Infrastructură ca și Cod (Bicep) |
| **Gestionare Mediu** | Focus pe un singur mediu | Medii multiple (dev/staging/prod) |
| **Integrare CI/CD** | Limitat | Suport nativ pentru GitHub Actions |
| **Gestionare Costuri** | Monitorizare de bază | Optimizare costuri pe medii specifice |

## Precondiții

- Abonament Azure cu permisiuni corespunzătoare
- Azure Developer CLI instalat
- Acces la serviciile Microsoft Foundry Models
- Familiaritate de bază cu Microsoft Foundry

> **Versiunea curentă AZD:** Aceste exemple au fost verificate cu `azd` `1.27.1`. Pentru fluxul de lucru al agentului AI, folosește lansarea curentă preview a extensiei și verifică versiunea instalată înainte de a începe.

## Modele de Integrare de Bază

### Model 1: Integrare Microsoft Foundry Models

**Caz de Utilizare**: Implementarea aplicațiilor de chat cu modele Microsoft Foundry Models

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

**Caz de Utilizare**: Implementarea aplicațiilor cu generare augmentată prin recuperare (RAG)

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

### Model 3: Integrare Inteligență Documentară

**Caz de Utilizare**: Fluxuri de lucru pentru procesarea și analiza documentelor

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

## 🔧 Modele de Configurare

### Configurarea Variabilelor de Mediu

**Configurare Producție:**
```bash
# Servicii AI de bază
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Configurații ale modelelor
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Setări de performanță
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configurare Dezvoltare:**
```bash
# Setări optimizate pentru cost, pentru dezvoltare
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Nivel gratuit
```

### Configurare Securizată cu Key Vault

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

## Fluxuri de Implementare

### Extensii AZD pentru Foundry

AZD oferă extensii care adaugă capabilități specifice AI pentru lucrul cu serviciile Microsoft Foundry:

```bash
# Instalează extensia agenților Foundry
azd extension install azure.ai.agents

# Instalează extensia pentru reglare fină
azd extension install azure.ai.finetune

# Instalează extensia modelelor personalizate
azd extension install azure.ai.models

# Listează extensiile instalate
azd extension list --installed

# Inspectează versiunea extensiei agentului instalate în prezent
azd extension show azure.ai.agents
```

Extensiile AI sunt încă în evoluție rapidă în preview. Dacă o comandă se comportă diferit față de descrierea de aici, actualizează extensia relevantă înainte de a face depanare proiectului propriu-zis.

### Implementare Agent-First cu `azd ai`

Dacă ai un manifest de agent, folosește `azd ai agent init` pentru a genera un proiect conectat la Foundry Agent Service:

```bash
# Inițializează dintr-un manifest de agent
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Desfășoară pe Azure
azd up
```

Lansările recente preview ale `azure.ai.agents` au adăugat suport inițial pentru template-uri la `azd ai agent init`. Dacă urmezi exemple noi pentru agenți, verifică ajutorul extensiei pentru flagurile exacte disponibile în versiunea ta instalată.

Vezi [Comenzi AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pentru referința completă de comenzi și flaguri.

### Implementare cu o Singură Comandă

```bash
# Desfășurați totul cu o singură comandă
azd up

# Sau desfășurați incremental
azd provision  # Doar infrastructura
azd deploy     # Doar aplicația

# Pentru desfășurări de aplicații AI care rulează pe termen lung în azd 1.23.11+
azd deploy --timeout 1800
```

### Implementări Specifice Mediului

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

## Monitorizare și Observabilitate

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

### Monitorizarea Costurilor

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

## 🔐 Cele Mai Bune Practici de Securitate

### Configurarea Identității Gestionate

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

### Securitatea Rețelei

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

## Optimizarea Performanței

### Strategii de Caching

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

### Configurarea Auto-scalării

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

## Depanarea Problemelor Comune

### Problema 1: Cota OpenAI Depășită

**Simptome:**
- Implementarea eșuează cu erori legate de cotă
- Erori 429 în jurnalele aplicației

**Soluții:**
```bash
# Verifică utilizarea actuală a cotei
az cognitiveservices usage list --location eastus

# Încearcă o regiune diferită
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacitatea temporar
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problema 2: Eșecuri de Autentificare

**Simptome:**
- Erori 401/403 la apelarea serviciilor AI
- Mesaje de „Acces refuzat”

**Soluții:**
```bash
# Verificați atribuțiile rolurilor
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Verificați configurația identității gestionate
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validarea accesului la Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Probleme la Implementarea Modelului

**Simptome:**
- Modelele nu sunt disponibile în implementare
- Versiuni specifice de modele care eșuează

**Soluții:**
```bash
# Listează modelele disponibile pe regiune
az cognitiveservices model list --location eastus

# Actualizează versiunea modelului în șablonul bicep
# Verifică cerințele de capacitate ale modelului
```

## Șabloane Exemplu

### Aplicație Chat RAG (Python)

**Depozit**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servicii**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descriere**: Cel mai popular exemplu Azure AI — o aplicație chat RAG gata pentru producție care permite punerea de întrebări pe propriile documente. Utilizează GPT-4.1-mini pentru chat, text-embedding-3-large pentru încorporări și Azure AI Search pentru recuperare. Suportă documente multimodale, intrare/ieșire voce, autentificare Microsoft Entra și trasabilitate Application Insights.

**Începere Rapidă**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Aplicație Chat RAG (.NET)

**Depozit**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Servicii**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descriere**: Echivalentul .NET/C# al exemplului Python RAG chat. Construit cu ASP.NET Core Minimal API și interfata Blazor WebAssembly. Include chat vocal, suport GPT-4o-mini viziune și un client desktop/mobil companion .NET MAUI Blazor Hybrid.

**Începere Rapidă**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Aplicație Chat RAG (Java)

**Depozit**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Servicii**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descriere**: Versiunea Java a exemplului RAG chat folosind Langchain4J pentru orchestrarea AI. Suportă arhitectură microservicii orientată pe evenimente, strategii multiple de căutare (text, vector, hibrid), încărcare documente cu Azure Document Intelligence și implementare pe Azure Container Apps sau Azure Kubernetes Service.

**Începere Rapidă**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Copilot Retail Enterprise cu Microsoft Foundry

**Depozit**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servicii**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descriere**: Copilot RAG complet retail folosind Microsoft Foundry și Prompty. Un chatbot Contoso Outdoor care bazează răspunsurile pe catalogul de produse și datele comenzilor clienților. Demonstrează fluxul complet GenAIOps — prototip cu Prompty, evaluare cu evaluatori asistați AI și implementare prin AZD către Container Apps.

**Începere Rapidă**:
```bash
azd init --template contoso-chat
azd up
```

### Aplicație Multi-Agent pentru Scriere Creativă

**Depozit**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Servicii**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descriere**: Exemplu multi-agent demonstrând orchestrarea agenților AI cu Prompty. Folosește un agent de cercetare (Bing Grounding în Azure AI Agent Service), un agent de produs (Azure AI Search), un agent scriitor și un agent editor pentru a produce colaborativ articole bine documentate. Include CI/CD cu evaluare în GitHub Actions.

**Începere Rapidă**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Chat RAG Serverless (JavaScript/TypeScript)

**Depozit**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Servicii**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB pentru NoSQL + LangChain.js

**Descriere**: Chatbot RAG complet serverless folosind LangChain.js cu Azure Functions pentru API și Azure Static Web Apps pentru hosting. Folosește Azure Cosmos DB atât ca magazin vectorial, cât și ca bază de date a istoricului chat. Suportă dezvoltare locală cu Ollama pentru testare fără costuri.

**Începere Rapidă**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Accelerator Soluție Chat cu Datele Tale

**Depozit**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Servicii**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Descriere**: Accelerator de soluție RAG grad enterprise cu portal admin pentru încărcare/gestionare documente, opțiuni multiple de orchestrator (Semantic Kernel, LangChain, Prompt Flow), conversie vorbire-text, integrare Microsoft Teams și alegere backend PostgreSQL sau Cosmos DB. Conceput ca punct personalizabil de pornire pentru scenarii RAG de producție.

**Începere Rapidă**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### Agenți AI de Călătorie — Orchestrare Multi-Agent MCP

**Depozit**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Servicii**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + Servere MCP (.NET, Python, Java, TypeScript)

**Descriere**: Aplicație de referință pentru orchestrarea AI multi-agent folosind trei cadre (LangChain.js, LlamaIndex.TS și Microsoft Agent Framework). Are servere MCP (Model Context Protocol) în patru limbi implementate ca Azure Container Apps serverless cu monitorizare OpenTelemetry.

**Începere Rapidă**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Depozit**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Servicii**: Servicii Azure AI + Azure OpenAI

**Descriere**: Șablon Bicep minimal care implementează servicii Azure AI cu modele de machine learning configurate. Un punct de pornire ușor când ai nevoie doar de infrastructura Azure AI provisionată, fără un stack complet de aplicație.

**Începere Rapidă**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Răsfoiește mai multe șabloane**: Vizitează [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) pentru peste 80 de șabloane AZD specifice AI în diverse limbaje și scenarii.

## Următorii Pași

1. **Încearcă Exemplele**: Pornește cu un șablon pre-construit care se potrivește cazului tău de utilizare
2. **Personalizează pentru Nevoile Tale**: Modifică infrastructura și codul aplicației
3. **Adaugă Monitorizare**: Implementează observabilitate completă
4. **Optimizează Costurile**: Ajustează configurațiile pentru bugetul tău
5. **Securizează Implementarea**: Aplică modele de securitate enterprise
6. **Scalează Pentru Producție**: Adaugă caracteristici multi-regiune și înaltă disponibilitate

## 🎯 Exerciții Practice

### Exercițiul 1: Implementarea Aplicației Chat Microsoft Foundry Models (30 minute)
**Scop**: Implementarea și testarea unei aplicații AI chat gata de producție

```bash
# Inițializează șablonul
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Setează variabilele de mediu
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Desfășurare
azd up

# Testează aplicația
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Monitorizează operațiunile AI
azd monitor

# Curățare
azd down --force --purge
```

**Criterii de Succes:**
- [ ] Implementarea se finalizează fără erori de cotă
- [ ] Se poate accesa interfața de chat în browser
- [ ] Se pot pune întrebări și primi răspunsuri AI
- [ ] Application Insights afișează datele telemetriei
- [ ] Resursele sunt curățate cu succes

**Cost Estimat**: 5-10$ pentru 30 de minute de testare

### Exercițiul 2: Configurarea Implementării Multi-Model (45 minute)
**Scop**: Implementarea mai multor modele AI cu configurații diferite

```bash
# Creează o configurație Bicep personalizată
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

**Criterii de Succes:**
- [ ] Mai multe modele implementate cu succes
- [ ] Setări de capacitate diferite aplicate
- [ ] Modele accesibile prin API
- [ ] Se pot apela ambele modele din aplicație

### Exercițiul 3: Implementarea Monitorizării Costurilor (20 minute)
**Scop**: Configurarea alertelor bugetare și urmărirea costurilor

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

# Desfășoară alerta de buget
azd provision

# Verifică costurile curente
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Criterii de Succes:**
- [ ] Alertă buget creată în Azure
- [ ] Notificări prin email configurate
- [ ] Se pot vizualiza datele costurilor în Portalul Azure
- [ ] Pragurile bugetare setate corect

## 💡 Întrebări Frecvente

<details>
<summary><strong>Cum pot reduce costurile Microsoft Foundry Models în timpul dezvoltării?</strong></summary>

1. **Folosește Nivelul Gratuit**: Microsoft Foundry Models oferă 50.000 tokens/lună gratuit
2. **Reduce Capacitatea**: Setează capacitatea la 10 TPM în loc de 30+ pentru dezvoltare
3. **Folosește azd down**: Dezalocă resursele când nu dezvolți activ
4. **Cachează Răspunsurile**: Implementează cache Redis pentru interogări repetate
5. **Folosește Engineering pentru Prompturi**: Redu consumul de tokens cu prompturi eficiente


```bash
# Configurație pentru dezvoltare
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Care este diferența dintre Microsoft Foundry Models și OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Securitate și conformitate pentru mediul enterprise
- Integrare în rețea privată
- Garanții SLA
- Autentificare cu identitate gestionată
- Cote mai mari disponibile

**OpenAI API**:
- Acces mai rapid la modele noi
- Configurare mai simplă
- Barieră de intrare mai scăzută
- Doar internet public

Pentru aplicații de producție, **Microsoft Foundry Models este recomandat**.
</details>

<details>
<summary><strong>Cum gestionez erorile de depășire a cotei la Microsoft Foundry Models?</strong></summary>

```bash
# Verifică cota curentă
az cognitiveservices usage list --location eastus2

# Încearcă o regiune diferită
azd env set AZURE_LOCATION westus2
azd up

# Redu capacitatea temporar
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Solicită creșterea cotei
# Accesează Azure Portal > Cote > Solicită creșterea
```
</details>

<details>
<summary><strong>Pot folosi propriile mele date cu Microsoft Foundry Models?</strong></summary>

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
3. Configurează grupurile de securitate a rețelei
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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentație oficială](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instalează abilități de agent Azure + Foundry în editorul tău cu `npx skills add microsoft/github-copilot-for-azure`

---

**Navigarea capitolului:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul Curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Capitolul Anterior**: [Capitolul 1: Primul tău proiect](../chapter-01-foundation/first-project.md)
- **➡️ Următorul**: [Dezvoltarea Modelului AI](ai-model-deployment.md)
- **🚀 Capitolul Următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

**Ai nevoie de ajutor?** Alătură-te discuțiilor comunității sau deschide o problemă în depozit. Comunitatea Azure AI + AZD este aici să te ajute să reușești!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->