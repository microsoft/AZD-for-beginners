# Microsoft Foundry-integration med AZD

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 2 - AI-först utveckling
- **⬅️ Föregående kapitel**: [Kapitel 1: Ditt första projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nästa**: [Distribution av AI-modell](ai-model-deployment.md)
- **🚀 Nästa kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Översikt

Denna guide visar hur du integrerar Microsoft Foundry-tjänster med Azure Developer CLI (AZD) för smidigare distributioner av AI-applikationer. Microsoft Foundry erbjuder en omfattande plattform för att bygga, distribuera och hantera AI-applikationer, medan AZD förenklar infrastruktur- och distributionsprocessen.

## Vad är Microsoft Foundry?

Microsoft Foundry är Microsofts enade plattform för AI-utveckling som inkluderar:

- **Model Catalog**: Tillgång till toppmoderna AI-modeller
- **Prompt Flow**: Visuell designer för AI-arbetsflöden
- **Microsoft Foundry Portal**: Integrerad utvecklingsmiljö för AI-applikationer
- **Deployment Options**: Flera värd- och skalningsalternativ
- **Safety and Security**: Inbyggda ansvarstagande AI-funktioner

## AZD + Microsoft Foundry: Bättre tillsammans

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manuell distribution via portalen | Automatiserade, reproducerbara distributioner |
| **Infrastructure** | Provisionering via klick | Infrastruktur som kod (Bicep) |
| **Environment Management** | Fokus på en enda miljö | Flera miljöer (dev/staging/prod) |
| **CI/CD Integration** | Begränsad | Inbyggt stöd för GitHub Actions |
| **Cost Management** | Grundläggande övervakning | Miljöspecifika kostnadsoptimeringar |

## Förutsättningar

- Azure-prenumeration med lämpliga behörigheter
- Azure Developer CLI installerad
- Tillgång till Microsoft Foundry Models-tjänster
- Grundläggande kännedom om Microsoft Foundry

## Kärnintegreringsmönster

### Mönster 1: Integration med Microsoft Foundry Models

**Användningsfall**: Distribuera chattapplikationer med Microsoft Foundry Models

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

### Mönster 2: AI-sök + RAG-integration

**Användningsfall**: Distribuera retrieval-augmented generation (RAG)-applikationer

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

### Mönster 3: Integration med Document Intelligence

**Användningsfall**: Dokumentbearbetning och analysarbetsflöden

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

## 🔧 Konfigurationsmönster

### Konfiguration av miljövariabler

**Produktionskonfiguration:**
```bash
# Kärn-AI-tjänster
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modellkonfigurationer
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Prestandainställningar
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Utvecklingskonfiguration:**
```bash
# Kostnadsoptimerade inställningar för utveckling
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Gratisnivå
```

### Säker konfiguration med Key Vault

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

## Distributionsarbetsflöden

### AZD-tillägg för Foundry

AZD erbjuder tillägg som lägger till AI-specifika funktioner för arbete med Microsoft Foundry-tjänster:

```bash
# Installera tillägget Foundry Agents
azd extension install azure.ai.agents

# Installera tillägget för finjustering
azd extension install azure.ai.finetune

# Installera tillägget för anpassade modeller
azd extension install azure.ai.models

# Lista installerade tillägg
azd extension list
```

### Agent-först-distribution med `azd ai`

Om du har ett agentmanifest, använd `azd ai agent init` för att skapa ett projekt kopplat till Foundry Agent Service:

```bash
# Initiera från ett agentmanifest
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Distribuera till Azure
azd up
```

Se [AZD AI CLI-kommandon](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) för fullständig kommandoreferens och flaggor.

### Distribution med ett enda kommando

```bash
# Distribuera allt med ett kommando
azd up

# Eller distribuera stegvis
azd provision  # Endast infrastruktur
azd deploy     # Endast applikation
```

### Miljöspecifika distributioner

```bash
# Utvecklingsmiljö
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Produktionsmiljö
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Övervakning och observerbarhet

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

### Kostnadsövervakning

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

## 🔐 Säkerhetsbästa praxis

### Konfiguration av hanterad identitet

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

### Nätverkssäkerhet

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

## Prestandaoptimering

### Cachingstrategier

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

### Konfiguration för autoskalning

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

## Felsökning av vanliga problem

### Problem 1: OpenAI-kvot överskriden

**Symtom:**
- Distribution misslyckas med kvotfel
- 429-fel i applikationsloggar

**Lösningar:**
```bash
# Kontrollera aktuell kvotanvändning
az cognitiveservices usage list --location eastus

# Prova en annan region
azd env set AZURE_LOCATION westus2
azd up

# Minska kapaciteten tillfälligt
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problem 2: Autentiseringsfel

**Symtom:**
- 401/403-fel vid anrop till AI-tjänster
- "Åtkomst nekad"-meddelanden

**Lösningar:**
```bash
# Verifiera rolltilldelningar
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kontrollera konfigurationen för hanterad identitet
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validera åtkomst till Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problem 3: Problem med modelldistribution

**Symtom:**
- Modeller inte tillgängliga i distributionen
- Specifika modellversioner misslyckas

**Lösningar:**
```bash
# Lista tillgängliga modeller per region
az cognitiveservices model list --location eastus

# Uppdatera modellversion i bicep-mallen
# Kontrollera modellens kapacitetskrav
```

## Exempelmallar

### RAG-chattapplikation (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Tjänster**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beskrivning**: Det mest populära Azure AI-exemplet — en produktionsklar RAG-chattapp som låter dig ställa frågor om dina egna dokument. Använder GPT-4.1-mini för chatt, text-embedding-ada-002 för embeddings, och Azure AI Search för återvinning. Stöder multimodala dokument, talinmatning/-utmatning, Microsoft Entra-autentisering och Application Insights-spårning.

**Snabbstart**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG-chattapplikation (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Tjänster**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beskrivning**: .NET/C#-motsvarigheten till Python RAG-chatt-exemplet. Byggd med ASP.NET Core Minimal API och Blazor WebAssembly-frontenden. Inkluderar röstchatt, GPT-4o-mini vision-stöd och en följeslagare i form av en .NET MAUI Blazor Hybrid desktop/mobilklient.

**Snabbstart**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG-chattapplikation (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Tjänster**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beskrivning**: Java-versionen av RAG-chatt-exemplet som använder Langchain4J för AI-orkestrering. Stöder mikrotjänst- och händelsedriven arkitektur, flera sökstrategier (text, vektor, hybrid), dokumentuppladdning med Azure Document Intelligence och distribution på antingen Azure Container Apps eller Azure Kubernetes Service.

**Snabbstart**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot med Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Tjänster**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beskrivning**: Komplett retail RAG-copilot som använder Azure AI Foundry och Prompty. En Contoso Outdoor-återförsäljares chatbot som grundar svar i produktkatalog och kundorderdata. Demonstrerar hela GenAIOps-arbetsflödet — prototyp med Prompty, utvärdera med AI-assisterade utvärderare, och distribuera via AZD till Container Apps.

**Snabbstart**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Tjänster**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beskrivning**: Multi-agent-exempel som demonstrerar AI-agentorkestrering med Prompty. Använder en forskningsagent (Bing Grounding i Azure AI Agent Service), en produktagent (Azure AI Search), en författaragent och en redigeringsagent för att gemensamt producera välresearchade artiklar. Inkluderar CI/CD med utvärdering i GitHub Actions.

**Snabbstart**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Tjänster**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB för NoSQL + LangChain.js

**Beskrivning**: Fullt serverlös RAG-chatbot som använder LangChain.js med Azure Functions för API:et och Azure Static Web Apps för hosting. Använder Azure Cosmos DB som både vektorlager och chattloggdatabas. Stöder lokal utveckling med Ollama för kostnadsfri testning.

**Snabbstart**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Tjänster**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Beskrivning**: Företagsklassad RAG-lösningsaccelerator med adminportal för dokumentuppladdning/hantering, flera orkestratoralternativ (Semantic Kernel, LangChain, Prompt Flow), tal-till-text, Microsoft Teams-integration och val mellan PostgreSQL eller Cosmos DB som backend. Designad som en anpassningsbar startpunkt för produktionsscenarier inom RAG.

**Snabbstart**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orkestrering

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Tjänster**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP-servrar (.NET, Python, Java, TypeScript)

**Beskrivning**: Referensapplikation för multi-agent AI-orkestrering som använder tre ramverk (LangChain.js, LlamaIndex.TS och Microsoft Agent Framework). Inkluderar MCP (Model Context Protocol)-servrar i fyra språk som distribueras som serverlösa Azure Container Apps med OpenTelemetry-övervakning.

**Snabbstart**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Tjänster**: Azure AI Services + Azure OpenAI

**Beskrivning**: Minimal Bicep-mall som distribuerar Azure AI-tjänster med konfigurerade maskininlärningsmodeller. En lättviktsstartpunkt när du endast behöver förprovisionera Azure AI-infrastrukturen utan en fullständig applikationsstack.

**Snabbstart**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Bläddra bland fler mallar**: Besök [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) för 80+ AI-specifika AZD-mallar över språk och scenarier.

## Nästa steg

1. **Prova exemplen**: Börja med en färdig mall som matchar ditt användningsfall
2. **Anpassa efter dina behov**: Modifiera infrastrukturen och applikationskoden
3. **Lägg till övervakning**: Implementera omfattande observerbarhet
4. **Optimera kostnader**: Finjustera konfigurationer för din budget
5. **Säkra din distribution**: Implementera företagsmässiga säkerhetsmönster
6. **Skala till produktion**: Lägg till multiregion och hög tillgänglighet

## 🎯 Praktiska övningar

### Övning 1: Distribuera Microsoft Foundry Models chatt-app (30 minuter)
**Mål**: Distribuera och testa en produktionsklar AI-chattapplikation

```bash
# Initiera mall
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Ställ in miljövariabler
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Distribuera
azd up

# Testa applikationen
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Övervaka AI-operationer
azd monitor

# Rensa upp
azd down --force --purge
```

**Framgångskriterier:**
- [ ] Distributionen slutförs utan kvotfel
- [ ] Kan nå chattgränssnittet i webbläsaren
- [ ] Kan ställa frågor och få AI-drivna svar
- [ ] Application Insights visar telemetridata
- [ ] Resurser rensades upp framgångsrikt

**Beräknad kostnad**: $5-10 för 30 minuters test

### Övning 2: Konfigurera multimodellsdistribution (45 minuter)
**Mål**: Distribuera flera AI-modeller med olika konfigurationer

```bash
# Skapa en anpassad Bicep-konfiguration
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

# Distribuera och verifiera
azd provision
azd show
```

**Framgångskriterier:**
- [ ] Flera modeller distribuerade framgångsrikt
- [ ] Olika kapacitetsinställningar tillämpade
- [ ] Modeller åtkomliga via API
- [ ] Kan anropa båda modellerna från applikationen

### Övning 3: Implementera kostnadsövervakning (20 minuter)
**Mål**: Ställ in budgetvarningar och kostnadsspårning

```bash
# Lägg till budgetvarning i Bicep
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

# Distribuera budgetvarning
azd provision

# Kontrollera aktuella kostnader
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Framgångskriterier:**
- [ ] Budgetvarning skapad i Azure
- [ ] E-postmeddelanden för avisering konfigurerade
- [ ] Kan visa kostnadsdata i Azure-portalen
- [ ] Budgettrösklar satta lämpligt

## 💡 Vanliga frågor

<details>
<summary><strong>Hur minskar jag Microsoft Foundry Models-kostnader under utveckling?</strong></summary>

1. **Använd gratisnivån**: Microsoft Foundry Models erbjuder 50 000 tokens/månad gratis
2. **Minska kapaciteten**: Sätt kapaciteten till 10 TPM istället för 30+ för utveckling
3. **Använd azd down**: Avallokera resurser när du inte utvecklar aktivt
4. **Cacha svar**: Implementera Redis-cache för återkommande frågor
5. **Använd promptteknik**: Minska tokenanvändning med effektiva prompts

```bash
# Utvecklingskonfiguration
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Vad är skillnaden mellan Microsoft Foundry Models och OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Företagsklassad säkerhet och efterlevnad
- Integration med privata nätverk
- SLA-garantier
- Autentisering med hanterad identitet
- Högre kvoter tillgängliga

**OpenAI API**:
- Snabbare tillgång till nya modeller
- Enklare uppsättning
- Lägre inträdesbarriär
- Endast offentligt internet

För produktionsappar rekommenderas **Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Hur hanterar jag Microsoft Foundry Models-fel för överskriden kvot?</strong></summary>

```bash
# Kontrollera aktuell kvot
az cognitiveservices usage list --location eastus2

# Pröva en annan region
azd env set AZURE_LOCATION westus2
azd up

# Minska kapaciteten tillfälligt
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Begär kvotökning
# Gå till Azure-portalen > Kvoter > Begär ökning
```
</details>

<details>
<summary><strong>Kan jag använda mina egna data med Microsoft Foundry Models?</strong></summary>

Ja! Använd **Azure AI Search** för RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Se mallen [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Hur säkrar jag AI-modelländpunkter?</strong></summary>

**Bästa praxis**:
1. Använd Managed Identity (inga API-nycklar)
2. Aktivera Private Endpoints
3. Konfigurera network security groups
4. Implementera rate limiting
5. Använd Azure Key Vault för hemligheter

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

## Gemenskap och support

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installera Azure + Foundry agent skills i din editor med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigering:**
- **📚 Kursstartsida**: [AZD For Beginners](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 2 - AI-First Development
- **⬅️ Föregående kapitel**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Nästa**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Nästa kapitel**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Behöver du hjälp?** Gå med i våra communitydiskussioner eller öppna ett ärende i repositoryn. Azure AI + AZD-communityn finns här för att hjälpa dig att lyckas!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Friskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten Co-op Translator (https://github.com/Azure/co-op-translator). Vi eftersträvar noggrannhet, men var medveten om att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på sitt ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår genom användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->