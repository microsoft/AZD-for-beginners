# Microsoft Foundry-integration med AZD

**Chapter Navigation:**
- **📚 Kursusforside**: [AZD For Beginners](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 2 - AI-først udvikling
- **⬅️ Forrige kapitel**: [Kapitel 1: Dit første projekt](../chapter-01-foundation/first-project.md)
- **➡️ Næste**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Næste kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Oversigt

Denne vejledning viser, hvordan du integrerer Microsoft Foundry-tjenester med Azure Developer CLI (AZD) for strømlinede AI-applikationsudrulninger. Microsoft Foundry giver en omfattende platform til at bygge, udrulle og administrere AI-applikationer, mens AZD forenkler infrastruktur- og udrulningsprocessen.

## Hvad er Microsoft Foundry?

Microsoft Foundry er Microsofts samlede platform til AI-udvikling, som inkluderer:

- **Model Catalog**: Adgang til moderne AI-modeller
- **Prompt Flow**: Visuel designer til AI-arbejdsgange
- **Microsoft Foundry Portal**: Integreret udviklingsmiljø til AI-applikationer
- **Deployment Options**: Flere hosting- og skaleringsmuligheder
- **Safety and Security**: Indbyggede funktioner for ansvarlig AI

## AZD + Microsoft Foundry: Bedre sammen

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Forudsætninger

- Azure-abonnement med passende tilladelser
- Azure Developer CLI installeret
- Adgang til Microsoft Foundry Models-tjenester
- Grundlæggende kendskab til Microsoft Foundry

> **Current AZD baseline:** Disse eksempler blev gennemgået med `azd` `1.23.12`. For AI-agentarbejdsgangen skal du bruge den aktuelle preview-udvidelsesudgivelse og kontrollere din installerede version, inden du begynder.

## Kerneintegrationsmønstre

### Mønster 1: Integration af Microsoft Foundry-modeller

**Brugssag**: Udrul chatapplikationer med Microsoft Foundry Models-modeller

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

**Infrastructure (main.bicep):**
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

### Mønster 2: AI Search + RAG-integration

**Brugssag**: Udrul retrieval-augmented generation (RAG) applikationer

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

### Mønster 3: Document Intelligence-integration

**Brugssag**: Dokumentbehandlings- og analysearbejdsgange

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

## 🔧 Konfigurationsmønstre

### Opsætning af miljøvariabler

**Produktionskonfiguration:**
```bash
# Kerne-AI-tjenester
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modelkonfigurationer
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Ydeevneindstillinger
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Udviklingskonfiguration:**
```bash
# Omkostningsoptimerede indstillinger til udvikling
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Gratis niveau
```

### Sikker konfiguration med Key Vault

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

## Udrulningsarbejdsgange

### AZD-udvidelser til Foundry

AZD tilbyder udvidelser, der tilføjer AI-specifikke kapabiliteter til arbejde med Microsoft Foundry-tjenester:

```bash
# Installer Foundry agents-udvidelsen
azd extension install azure.ai.agents

# Installer finjusteringsudvidelsen
azd extension install azure.ai.finetune

# Installer udvidelsen til brugerdefinerede modeller
azd extension install azure.ai.models

# Vis installerede udvidelser
azd extension list --installed

# Undersøg den aktuelt installerede version af agentudvidelsen
azd extension show azure.ai.agents
```

AI-udvidelserne udvikler sig stadig hurtigt i preview. Hvis en kommando opfører sig anderledes end vist her, opgrader den relevante udvidelse, inden du fejlfinder projektet selv.

### Agent-først udrulning med `azd ai`

Hvis du har et agent-manifest, brug `azd ai agent init` til at opsætte et projekt tilsluttet Foundry Agent Service:

```bash
# Initialiser fra et agentmanifest
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Udrul til Azure
azd up
```

Nylige preview-udgivelser af `azure.ai.agents` har også tilføjet skabelonbaseret initialiseringssupport til `azd ai agent init`. Hvis du følger nyere agenteksempler, skal du tjekke udvidelsens hjælp for de nøjagtige flags, der er tilgængelige i din installerede version.

Se [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for fuld kommandoreference og flags.

### Udrulning med enkelt kommando

```bash
# Udrul alt med én kommando
azd up

# Eller udrul inkrementelt
azd provision  # Kun infrastruktur
azd deploy     # Kun applikation

# Til langvarige AI-app-udrulninger i azd 1.23.11+
azd deploy --timeout 1800
```

### Miljøspecifikke udrulninger

```bash
# Udviklingsmiljø
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Produktionsmiljø
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Overvågning og observerbarhed

### Integration med Application Insights

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

### Omkostningsovervågning

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

## 🔐 Bedste sikkerhedspraksis

### Konfiguration af Managed Identity

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

### Netværkssikkerhed

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

## Ydelsesoptimering

### Caching-strategier

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

### Autoskaleringkonfiguration

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

## Fejlfinding af almindelige problemer

### Problem 1: OpenAI-kvote overskredet

**Symptomer:**
- Udrulning fejler med kvotafejl
- 429-fejl i applikationslogs

**Løsninger:**
```bash
# Kontroller det aktuelle kvoteforbrug
az cognitiveservices usage list --location eastus

# Prøv en anden region
azd env set AZURE_LOCATION westus2
azd up

# Reducer kapaciteten midlertidigt
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problem 2: Autentificeringsfejl

**Symptomer:**
- 401/403-fejl ved kald til AI-tjenester
- "Access denied" beskeder

**Løsninger:**
```bash
# Bekræft tildeling af roller
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kontroller konfigurationen for administreret identitet
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Bekræft adgang til Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problem 3: Problemer med modeludrulning

**Symptomer:**
- Modeller er ikke tilgængelige i udrulningen
- Specifikke modelversioner fejler

**Løsninger:**
```bash
# Vis tilgængelige modeller pr. region
az cognitiveservices model list --location eastus

# Opdater modelversion i bicep-skabelon
# Kontroller modelens kapacitetskrav
```

## Eksempelskabeloner

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beskrivelse**: Det mest populære Azure AI-eksempel — en produktionsklar RAG-chatapp, der lader dig stille spørgsmål om dine egne dokumenter. Bruger GPT-4.1-mini til chat, text-embedding-3-large til embeddings og Azure AI Search til hentning. Understøtter multimodale dokumenter, taleindgang/-output, Microsoft Entra-autentificering og Application Insights-sporing.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beskrivelse**: .NET/C#-ækvivalenten til Python RAG-chat-eksemplet. Bygget med ASP.NET Core Minimal API og Blazor WebAssembly-front-end. Inkluderer talechat, GPT-4o-mini vision-support og en ledsagende .NET MAUI Blazor Hybrid desktop/mobil-klient.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beskrivelse**: Java-version af RAG-chat-eksemplet, der bruger Langchain4J til AI-orchestration. Understøtter mikrotjenestebaseret event-drevet arkitektur, flere søgestrategier (tekst, vektor, hybrid), dokumentupload med Azure Document Intelligence og udrulning på enten Azure Container Apps eller Azure Kubernetes Service.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot med Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Tjenester**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beskrivelse**: End-to-end retail RAG-copilot ved brug af Azure AI Foundry og Prompty. En Contoso Outdoor detailhandels-chatbot, der forankrer svar i produktkatalog- og kundeordredata. Demonstrerer hele GenAIOps-arbejdsgangen — prototype med Prompty, evaluér med AI-assisterede evaluatorer, og udrul via AZD til Container Apps.

**Quick Start**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Tjenester**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beskrivelse**: Multi-agent-eksempel, der demonstrerer AI-agent-orchestration med Prompty. Bruger en research-agent (Bing Grounding i Azure AI Agent Service), en produkt-agent (Azure AI Search), en forfatter-agent og en redaktør-agent til i fællesskab at producere velresearchede artikler. Inkluderer CI/CD med evaluering i GitHub Actions.

**Quick Start**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Tjenester**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Beskrivelse**: Fuldt serverløs RAG-chatbot ved brug af LangChain.js med Azure Functions til API'et og Azure Static Web Apps til hosting. Bruger Azure Cosmos DB som både vektorstore og chat-historikdatabase. Understøtter lokal udvikling med Ollama til omkostningsfri test.

**Quick Start**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Beskrivelse**: Enterprise-grade RAG-solution accelerator med admin-portal til dokumentupload/-styring, flere orkestratormuligheder (Semantic Kernel, LangChain, Prompt Flow), tale-til-tekst, Microsoft Teams-integration og valg af PostgreSQL eller Cosmos DB backend. Designet som et tilpasseligt udgangspunkt for produktions-RAG-scenarier.

**Quick Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Tjenester**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Beskrivelse**: Referenceapplikation for multi-agent AI-orchestration ved brug af tre frameworks (LangChain.js, LlamaIndex.TS og Microsoft Agent Framework). Indeholder MCP (Model Context Protocol) servers i fire sprog, udrullet som serverløse Azure Container Apps med OpenTelemetry-overvågning.

**Quick Start**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Tjenester**: Azure AI Services + Azure OpenAI

**Beskrivelse**: Minimal Bicep-skabelon, der udruller Azure AI-tjenester med konfigurerede machine learning-modeller. Et letvægtsudgangspunkt, når du kun behøver den Azure AI-infrastruktur uden en komplet applikationsstak.

**Quick Start**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Browse more templates**: Besøg [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for 80+ AI-specifikke AZD-skabeloner på tværs af sprog og scenarier.

## Næste skridt

1. **Prøv eksemplerne**: Start med en forudbygget skabelon, der matcher dit brugsscenario
2. **Tilpas efter dine behov**: Ændr infrastrukturen og applikationskoden
3. **Tilføj overvågning**: Implementér omfattende observerbarhed
4. **Optimer omkostninger**: Finjustér konfigurationer til dit budget
5. **Sikre din udrulning**: Implementér enterprise-sikkerhedsmønstre
6. **Skaler til produktion**: Tilføj multi-region og høj-tilgængelighedsfunktioner

## 🎯 Praktiske øvelser

### Øvelse 1: Udrul Microsoft Foundry Models chatapp (30 minutter)
**Mål**: Udrul og test en produktionsklar AI-chatapplikation

```bash
# Initialiser skabelon
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Sæt miljøvariabler
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Udrul
azd up

# Test applikationen
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Overvåg AI-operationer
azd monitor

# Ryd op
azd down --force --purge
```

**Succes-kriterier:**
- [ ] Udrulning gennemføres uden kvotafejl
- [ ] Kan få adgang til chatgrænsefladen i browseren
- [ ] Kan stille spørgsmål og få AI-drevne svar
- [ ] Application Insights viser telemetridata
- [ ] Ressourcer ryddet op med succes

**Anslåede omkostninger**: $5-10 for 30 minutters test

### Øvelse 2: Konfigurer multi-model udrulning (45 minutter)
**Mål**: Udrul flere AI-modeller med forskellige konfigurationer

```bash
# Opret tilpasset Bicep-konfiguration
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

# Udrul og bekræft
azd provision
azd show
```

**Succes-kriterier:**
- [ ] Flere modeller udrullet med succes
- [ ] Forskellige kapacitetsindstillinger anvendt
- [ ] Modeller tilgængelige via API
- [ ] Kan kalde begge modeller fra applikationen

### Øvelse 3: Implementér omkostningsovervågning (20 minutter)
**Mål**: Opsæt budgetalarmer og omkostningssporing

```bash
# Tilføj budgetadvarsel til Bicep
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

# Udrul budgetadvarsel
azd provision

# Kontroller aktuelle omkostninger
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Succes-kriterier:**
- [ ] Budgetalarm oprettet i Azure
- [ ] E-mail-notifikationer konfigureret
- [ ] Kan se omkostningsdata i Azure Portal
- [ ] Budgetgrænser sat passende

## 💡 Ofte stillede spørgsmål

<details>
<summary><strong>Hvordan kan jeg reducere Microsoft Foundry Models-omkostninger under udvikling?</strong></summary>

1. **Brug gratis niveau**: Microsoft Foundry Models tilbyder 50,000 tokens/måned gratis
2. **Reducer kapacitet**: Indstil kapacitet til 10 TPM i stedet for 30+ til udvikling
3. **Brug azd down**: Dealloker ressourcer, når du ikke aktivt udvikler
4. **Cache svar**: Implementer Redis-cache for gentagne forespørgsler
5. **Brug prompt-engineering**: Reducer tokenforbrug med effektive prompter


```bash
# Konfiguration til udvikling
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Hvad er forskellen mellem Microsoft Foundry Models og OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Virksomhedssikkerhed og overholdelse
- Integration med private netværk
- SLA-garantier
- Godkendelse via Managed Identity
- Højere kvoter tilgængelige

**OpenAI API**:
- Hurtigere adgang til nye modeller
- Mere enkel opsætning
- Lavere adgangsbarriere
- Kun offentligt internet

Til produktionsapps anbefales **Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Hvordan håndterer jeg fejl ved overskredet kvote for Microsoft Foundry Models?</strong></summary>

```bash
# Kontroller den aktuelle kvote
az cognitiveservices usage list --location eastus2

# Prøv en anden region
azd env set AZURE_LOCATION westus2
azd up

# Reducer kapaciteten midlertidigt
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Anmod om forhøjelse af kvoten
# Gå til Azure-portalen > Kvoter > Anmod om forhøjelse
```
</details>

<details>
<summary><strong>Kan jeg bruge mine egne data med Microsoft Foundry Models?</strong></summary>

Ja! Brug **Azure AI Search** til RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Se [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) skabelonen.
</details>

<details>
<summary><strong>Hvordan sikrer jeg AI-modelendepunkter?</strong></summary>

**Bedste praksis**:
1. Brug Managed Identity (ingen API-nøgler)
2. Aktivér Private Endpoints
3. Konfigurer netværkssikkerhedsgrupper
4. Implementér ratebegrænsning
5. Brug Azure Key Vault til hemmeligheder

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

## Fællesskab og support

- **Microsoft Foundry Discord**: [#Azure-kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues og diskussioner](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Officiel dokumentation](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill på skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installer Azure + Foundry agent skills i din editor med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD for begyndere](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 2 - AI-først udvikling
- **⬅️ Forrige kapitel**: [Kapitel 1: Dit første projekt](../chapter-01-foundation/first-project.md)
- **➡️ Næste**: [Implementering af AI-model](ai-model-deployment.md)
- **🚀 Næste kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Brug for hjælp?** Deltag i vores fællesskabsdiskussioner eller åbn en issue i repositoryet. Azure AI + AZD-fællesskabet er her for at hjælpe dig med at få succes!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dette dokument er oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument i dets modersmål bør betragtes som den autoritative kilde. For kritiske oplysninger anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->