# Microsoft Foundry Integration med AZD

**Kapitelnavigation:**
- **📚 Kursus Forside**: [AZD For Beginners](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 2 - AI-Først Udvikling
- **⬅️ Forrige Kapitel**: [Kapitel 1: Dit Første Projekt](../chapter-01-foundation/first-project.md)
- **➡️ Næste**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Næste Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Oversigt

Denne vejledning demonstrerer, hvordan man integrerer Microsoft Foundry-tjenester med Azure Developer CLI (AZD) for strømlinede AI-applikationsudrulninger. Microsoft Foundry tilbyder en omfattende platform til at bygge, udrulle og administrere AI-applikationer, mens AZD forenkler infrastrukturen og udrulningsprocessen.

## Hvad er Microsoft Foundry?

Microsoft Foundry er Microsofts samlede platform til AI-udvikling, som inkluderer:

- **Modelkatalog**: Adgang til topmoderne AI-modeller
- **Prompt Flow**: Visuel designer til AI-arbejdsgange
- **Microsoft Foundry Portal**: Integreret udviklingsmiljø til AI-applikationer
- **Udrulningsmuligheder**: Flere hosting- og skaleringsmuligheder
- **Sikkerhed og Tryghed**: Indbyggede ansvarlige AI-funktioner

## AZD + Microsoft Foundry: Bedre Sammen

| Funktion | Microsoft Foundry | AZD Integrationsfordel |
|---------|-----------------|------------------------|
| **Modeludrulning** | Manuel portal-udrulning | Automatiserede, gentagelige udrulninger |
| **Infrastruktur** | Klik-gennem-provisionering | Infrastruktur som kode (Bicep) |
| **Miljøstyring** | Fokus på enkelt miljø | Multi-miljø (dev/staging/prod) |
| **CI/CD Integration** | Begrænset | Indbygget GitHub Actions support |
| **Omkostningsstyring** | Basisovervågning | Miljø-specifik omkostningsoptimering |

## Forudsætninger

- Azure-abonnement med passende rettigheder
- Azure Developer CLI installeret
- Adgang til Microsoft Foundry Models tjenester
- Grundlæggende kendskab til Microsoft Foundry

> **Nuværende AZD baseline:** Disse eksempler er gennemgået med `azd` `1.27.1`. Til AI agent arbejdsgangen, brug den aktuelle preview-udgivelse af udvidelsen og tjek din installerede version før du begynder.

## Kerneintegrationsmønstre

### Mønster 1: Microsoft Foundry Models Integration

**Brugssag**: Udrul chat-applikationer med Microsoft Foundry Models modeller

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

**Infrastruktur (main.bicep):**
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

### Mønster 2: AI Search + RAG Integration

**Brugssag**: Udrulning af retrieval-augmented generation (RAG) applikationer

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

### Mønster 3: Document Intelligence Integration

**Brugssag**: Dokumentbehandling og analysearbejdsgange

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
# Kerne AI-tjenester
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modelkonfigurationer
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Ydelsesindstillinger
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

AZD leverer udvidelser, der tilføjer AI-specifikke funktioner til arbejde med Microsoft Foundry-tjenester:

```bash
# Installer Foundry-agentudvidelsen
azd extension install azure.ai.agents

# Installer finjusteringsudvidelsen
azd extension install azure.ai.finetune

# Installer udvidelsen til brugerdefinerede modeller
azd extension install azure.ai.models

# List installerede udvidelser
azd extension list --installed

# Undersøg den aktuelt installerede version af agentudvidelsen
azd extension show azure.ai.agents
```

AI-udvidelserne udvikler sig stadig hurtigt i preview. Hvis en kommando opfører sig anderledes end vist her, opgrader da den relevante udvidelse før fejlfinding af projektet selv.

### Agent-første udrulning med `azd ai`

Hvis du har en agent-manifest, brug `azd ai agent init` til at opbygge et projekt koblet til Foundry Agent Service:

```bash
# Initialiser fra en agentmanifest
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Udrul til Azure
azd up
```

Seneste preview-udgivelser af `azure.ai.agents` har også tilføjet skabelonbaseret initialiseringssupport til `azd ai agent init`. Hvis du følger nyere agent-eksempler, tjek da udvidelseshjælpen for præcise tilgængelige flag i din installerede version.

Se [AZD AI CLI Kommandoer](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for fuld kommando-reference og flag.

### Udrulning med én enkelt kommando

```bash
# Udrul alt med én kommando
azd up

# Eller udrul inkrementelt
azd provision  # Kun infrastruktur
azd deploy     # Kun applikation

# Til langvarige AI-app-udrulninger i azd 1.23.11+
azd deploy --timeout 1800
```

### Miljø-specifikke udrulninger

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

## Overvågning og Observability

### Integration af Application Insights

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

## 🔐 Sikkerhedspraksis

### Konfiguration af managed identity

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

## Performanceoptimering

### Cache-strategier

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

### Auto-skalering konfiguration

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

## Fejlfinding af Almindelige Problemer

### Problem 1: OpenAI kvote overskredet

**Symptomer:**
- Udrulning fejler med kvotefeil
- 429 fejl i applikationslogs

**Løsninger:**
```bash
# Tjek nuværende kvotabrug
az cognitiveservices usage list --location eastus

# Prøv en anden region
azd env set AZURE_LOCATION westus2
azd up

# Reducer kapacitet midlertidigt
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problem 2: Autentificeringsfejl

**Symptomer:**
- 401/403 fejl ved kald til AI-tjenester
- "Adgang nægtet" beskeder

**Løsninger:**
```bash
# Bekræft roller tildelinger
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Tjek konfiguration af administreret identitet
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Valider adgang til Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problem 3: Modeludrulningsproblemer

**Symptomer:**
- Modeller tilgængelige i udrulning
- Specifikke modelversioner fejler

**Løsninger:**
```bash
# List tilgængelige modeller efter region
az cognitiveservices model list --location eastus

# Opdater modelversion i bicep-skabelon
# Kontroller modelkapacitetskrav
```

## Eksempel Skabeloner

### RAG Chat Applikation (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beskrivelse**: Det mest populære Azure AI-eksempel — en produktionsklar RAG chat-app, der lader dig stille spørgsmål over dine egne dokumenter. Brug GPT-4.1-mini til chat, text-embedding-3-large til embeddings, og Azure AI Search til retrieval. Understøtter multimodale dokumenter, taleindgang/-udgang, Microsoft Entra autentificering og Application Insights sporing.

**Hurtig Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Applikation (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beskrivelse**: .NET/C#-ækvivalenten til Python RAG chat-eksemplet. Bygget med ASP.NET Core Minimal API og Blazor WebAssembly frontend. Indeholder stemmechat, GPT-4o-mini vision-support og en ledsagende .NET MAUI Blazor Hybrid desktop/mobil klient.

**Hurtig Start**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Applikation (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beskrivelse**: Java-versionen af RAG chat-eksemplet, som bruger Langchain4J til AI orkestrering. Understøtter mikroservice event-drevet arkitektur, flere søgestrategier (tekst, vektor, hybrid), dokumentupload med Azure Document Intelligence og udrulning på enten Azure Container Apps eller Azure Kubernetes Service.

**Hurtig Start**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot med Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Tjenester**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beskrivelse**: End-to-end retail RAG copilot, der bruger Microsoft Foundry og Prompty. En Contoso Outdoor detailhandler chatbot, der baserer svar på produktkatalog- og kundeordredatasæt. Demonstrerer hele GenAIOps-arbejdsgangen – prototype med Prompty, evaluering med AI-assisterede evaluatorer og udrul via AZD til Container Apps.

**Hurtig Start**:
```bash
azd init --template contoso-chat
azd up
```

### Kreativ Skrive Multi-Agent Applikation

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Tjenester**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beskrivelse**: Multi-agent eksempel, der demonstrerer AI agent orkestrering med Prompty. Brug en forskningsagent (Bing Grounding i Azure AI Agent Service), en produktagent (Azure AI Search), en skribentagent og en redaktøragent til samarbejdende produktion af velresearchede artikler. Indeholder CI/CD med evaluering i GitHub Actions.

**Hurtig Start**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Tjenester**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Beskrivelse**: Fuldt serverløs RAG chatbot, der bruger LangChain.js med Azure Functions til API og Azure Static Web Apps til hosting. Bruger Azure Cosmos DB som både vektorstore og chat-historikdatabase. Understøtter lokal udvikling med Ollama til omkostningsfri test.

**Hurtig Start**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat med dine data Løsningsaccelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Beskrivelse**: Enterprise-grade RAG løsningsaccelerator med adminportal til dokumentupload/-håndtering, flere orkestrator-muligheder (Semantic Kernel, LangChain, Prompt Flow), tale-til-tekst, Microsoft Teams integration og valg af PostgreSQL eller Cosmos DB backend. Designet som et tilpasseligt udgangspunkt for produktionsklare RAG scenarier.

**Hurtig Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Rejseagenter — Multi-Agent MCP Orkestrering

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Tjenester**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Beskrivelse**: Referenceapplikation for multi-agent AI orkestrering ved brug af tre frameworks (LangChain.js, LlamaIndex.TS og Microsoft Agent Framework). Inkluderer MCP (Model Context Protocol) servers i fire sprog udrullet som serverløse Azure Container Apps med OpenTelemetry overvågning.

**Hurtig Start**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Tjenester**: Azure AI Services + Azure OpenAI

**Beskrivelse**: Minimal Bicep-skabelon, der udruller Azure AI-tjenester med konfigurerede maskinlæringsmodeller. Et letvægts udgangspunkt, når du kun har brug for Azure AI-infrastrukturen uden en fuld applikationsstack.

**Hurtig Start**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Se flere skabeloner**: Besøg [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for 80+ AI-specifikke AZD-skabeloner på tværs af sprog og scenarier.

## Næste Skridt

1. **Prøv eksemplerne**: Start med en forudbygget skabelon, der matcher dit brugsscenarie
2. **Tilpas efter behov**: Ændr infrastrukturen og applikationskoden
3. **Tilføj overvågning**: Implementer omfattende observability
4. **Optimer omkostninger**: Finjuster konfigurationer til dit budget
5. **Sikre din udrulning**: Implementer virksomhedssikkerhedsmønstre
6. **Skaler til produktion**: Tilføj multi-region- og højtilgængelighedsfunktioner

## 🎯 Praktiske Øvelser

### Øvelse 1: Udrul Microsoft Foundry Models Chat App (30 minutter)
**Mål**: Udrul og test en produktionsklar AI chat applikation

```bash
# Initialiser skabelon
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Indstil miljøvariabler
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

**Succes kriterier:**
- [ ] Udrulning fuldføres uden kvotafejl
- [ ] Kan tilgå chatinterface i browseren
- [ ] Kan stille spørgsmål og få AI-drevne svar
- [ ] Application Insights viser telemetridata
- [ ] Ryddet op i ressourcer med succes

**Anslået omkostning**: 5-10 USD for 30 minutters test

### Øvelse 2: Konfigurer Multi-Model Udrulning (45 minutter)
**Mål**: Udrul flere AI-modeller med forskellige konfigurationer

```bash
# Opret brugerdefineret Bicep-konfiguration
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

# Implementer og bekræft
azd provision
azd show
```

**Succes kriterier:**
- [ ] Flere modeller udrullet med succes
- [ ] Forskellige kapacitetsindstillinger anvendt
- [ ] Modeller tilgængelige via API
- [ ] Kan kalde begge modeller fra applikationen

### Øvelse 3: Implementer Omkostningsovervågning (20 minutter)
**Mål**: Opsæt budgetalarmer og omkostningsovervågning

```bash
# Tilføj budgetalarm til Bicep
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

# Udrul budgetalarm
azd provision

# Tjek nuværende omkostninger
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Succes kriterier:**
- [ ] Budgetalarm oprettet i Azure
- [ ] Emailnotifikationer konfigureret
- [ ] Kan se omkostningsdata i Azure Portal
- [ ] Budgetgrænser sat passende

## 💡 Ofte Stillede Spørgsmål

<details>
<summary><strong>Hvordan reducerer jeg Microsoft Foundry Models omkostninger under udvikling?</strong></summary>

1. **Brug gratis niveau**: Microsoft Foundry Models tilbyder 50.000 tokens/måned gratis
2. **Reducer kapacitet**: Sæt kapacitet til 10 TPM i stedet for 30+ til udvikling
3. **Brug azd down**: Frigør ressourcer, når du ikke aktivt udvikler
4. **Cache svar**: Implementer Redis cache for gentagne forespørgsler
5. **Brug prompt engineering**: Reducer tokenforbrug med effektive prompts


```bash
# Udviklingskonfiguration
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Hvad er forskellen mellem Microsoft Foundry Models og OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Virksomhedssikkerhed og overholdelse
- Integration med privat netværk
- SLA-garantier
- Administreret identitetsgodkendelse
- Højere kvoter tilgængelige

**OpenAI API**:
- Hurtigere adgang til nye modeller
- Simpel opsætning
- Lavere adgangsbarriere
- Kun offentlig internet

For produktionsapps anbefales det at bruge **Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Hvordan håndterer jeg fejl ved Microsoft Foundry Models kvoteoverskridelse?</strong></summary>

```bash
# Tjek nuværende kvote
az cognitiveservices usage list --location eastus2

# Prøv en anden region
azd env set AZURE_LOCATION westus2
azd up

# Reducer kapacitet midlertidigt
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Anmod om kvoteforhøjelse
# Gå til Azure Portal > Kvoter > Anmod om forhøjelse
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
<summary><strong>Hvordan sikrer jeg AI-model endepunkter?</strong></summary>

**Bedste praksis**:
1. Brug Administreret Identitet (ingen API-nøgler)
2. Aktivér Private Endepunkter
3. Konfigurer netværkssikkerhedsgrupper
4. Implementér hastighedsbegrænsning
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

## Community og Support

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues og diskussioner](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Officiel dokumentation](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry færdighed på skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installer Azure + Foundry agent færdigheder i din editor med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 2 - AI-First Development
- **⬅️ Forrige kapitel**: [Kapitel 1: Dit første projekt](../chapter-01-foundation/first-project.md)
- **➡️ Næste**: [AI Model Deployering](ai-model-deployment.md)
- **🚀 Næste kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Brug for hjælp?** Deltag i vores fællesskabsdiskussioner eller opret en sag i repoet. Azure AI + AZD fællesskabet er her for at hjælpe dig med at få succes!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->