# Microsoft Foundry-integration med AZD

**Kapitelnavigering:**
- **📚 Kursens hemsida**: [AZD för nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 2 - AI-First-utveckling
- **⬅️ Föregående kapitel**: [Kapitel 1: Ditt första projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nästa**: [AI-modellutplacering](ai-model-deployment.md)
- **🚀 Nästa kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Översikt

Denna guide visar hur man integrerar Microsoft Foundry-tjänster med Azure Developer CLI (AZD) för smidigare AI-applikationsutplaceringar. Microsoft Foundry erbjuder en omfattande plattform för att bygga, distribuera och hantera AI-applikationer, medan AZD förenklar infrastrukturen och utplaceringsprocessen.

## Vad är Microsoft Foundry?

Microsoft Foundry är Microsofts enade plattform för AI-utveckling som inkluderar:

- **Modellkatalog**: Tillgång till toppmoderna AI-modeller
- **Prompt Flow**: Visuell designer för AI-arbetsflöden
- **Microsoft Foundry Portal**: Integrerad utvecklingsmiljö för AI-applikationer
- **Utplaceringsalternativ**: Flera värd- och skalningsalternativ
- **Säkerhet och trygghet**: Inbyggda ansvarsfulla AI-funktioner

## AZD + Microsoft Foundry: Bättre tillsammans

| Funktion | Microsoft Foundry | Fördel med AZD-integration |
|---------|-----------------|------------------------|
| **Modellutplacering** | Manuell portaluppställning | Automatiserade, upprepbara utplaceringar |
| **Infrastruktur** | Klickbaserad provisionering | Infrastruktur som kod (Bicep) |
| **Miljöhantering** | Fokus på en enda miljö | Flera miljöer (dev/stage/prod) |
| **CI/CD-integration** | Begränsad | Naturligt stöd för GitHub Actions |
| **Kostnadshantering** | Grundläggande övervakning | Miljöspecifik kostnadsoptimering |

## Förutsättningar

- Azure-prenumeration med rätt behörigheter
- Azure Developer CLI installerat
- Tillgång till Microsoft Foundry Models-tjänster
- Grundläggande kännedom om Microsoft Foundry

> **Aktuell AZD-baslinje:** Dessa exempel granskades mot `azd` `1.27.1`. För AI-agentarbetsflödet, använd den aktuella preview-extensionen och kontrollera din installerade version innan du börjar.

## Kärnintegrationsmönster

### Mönster 1: Microsoft Foundry Models-integration

**Användningsfall**: Distribuera chattapplikationer med Microsoft Foundry Models-modeller

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

### Mönster 2: AI-sökning + RAG-integrering

**Användningsfall**: Distribuera tilläggsgenerering med hämtning (RAG)-applikationer

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

### Mönster 3: Dokumentintelligensintegration

**Användningsfall**: Arbetsflöden för dokumentbearbetning och analys

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

### Miljövariabler - inställning

**Produktionskonfiguration:**
```bash
# Kärn-AI-tjänster
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modellkonfigurationer
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

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

## Utplaceringsarbetsflöden

### AZD-extensioner för Foundry

AZD tillhandahåller extensioner som lägger till AI-specifika funktioner för arbete med Microsoft Foundry-tjänster:

```bash
# Installera Foundry agents-tillägget
azd extension install azure.ai.agents

# Installera finjusterings-tillägget
azd extension install azure.ai.finetune

# Installera tillägget för anpassade modeller
azd extension install azure.ai.models

# Lista installerade tillägg
azd extension list --installed

# Inspektera den för närvarande installerade versionen av agenttillägget
azd extension show azure.ai.agents
```

AI-extensionerna utvecklas fortfarande snabbt i preview. Om ett kommando beter sig annorlunda än här, uppgradera relevant extension innan du felsöker projektet.

### Agent-först-utplacering med `azd ai`

Om du har ett agentmanifest, använd `azd ai agent init` för att skapa ett projekt kopplat till Foundry Agent Service:

```bash
# Initiera från en agentmanifest
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Distribuera till Azure
azd up
```

Nyare preview-releaser av `azure.ai.agents` har även lagt till mallbaserat initieringsstöd för `azd ai agent init`. Om du följer nyare agentexempel, kontrollera extensionshjälpen för tillgängliga flaggor i din version.

Se [AZD AI CLI-kommandon](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) för komplett kommandoreferens och flaggor.

### Utplacering med enskilt kommando

```bash
# Distribuera allt med ett kommando
azd up

# Eller distribuera stegvis
azd provision  # Endast infrastruktur
azd deploy     # Endast applikation

# För långvariga AI-applikationsdistributioner i azd 1.23.11+
azd deploy --timeout 1800
```

### Miljöspecifika utplaceringar

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

## Övervakning och observabilitet

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

### Hantering av identiteter

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

### Cachningsstrategier

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

**Symptom:**
- Utplacering misslyckas med kvotfel
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

**Symptom:**
- 401/403-fel vid anrop till AI-tjänster
- "Access denied"-meddelanden

**Lösningar:**
```bash
# Verifiera rolltilldelningar
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kontrollera konfiguration av hanterad identitet
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validera åtkomst till Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problem 3: Modellutplaceringsproblem

**Symptom:**
- Modeller ej tillgängliga i utplacering
- Specifika modellversioner misslyckas

**Lösningar:**
```bash
# Lista tillgängliga modeller efter region
az cognitiveservices model list --location eastus

# Uppdatera modellversion i bicep-mallen
# Kontrollera modellens kapacitetskrav
```

## Exempelmallar

### RAG Chattapplikation (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Tjänster**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beskrivning**: Det mest populära Azure AI-exemplet — en produktionsklar RAG-chattapp som låter dig ställa frågor över dina egna dokument. Använder GPT-4.1-mini för chatt, text-embedding-3-large för inbäddningar och Azure AI Search för hämtning. Stöder multimodala dokument, talinmatning/utmatning, Microsoft Entra-autentisering och Application Insights-spårning.

**Snabbstart**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chattapplikation (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Tjänster**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beskrivning**: .NET/C#-motsvarigheten till Python RAG-chattexemplet. Byggd med ASP.NET Core Minimal API och Blazor WebAssembly frontend. Inkluderar röstchatt, GPT-4o-mini vision-stöd och en följeslagare .NET MAUI Blazor Hybrid desktop/mobil klient.

**Snabbstart**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chattapplikation (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Tjänster**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beskrivning**: Java-versionen av RAG-chattprovet med användning av Langchain4J för AI-orchestration. Stöder microservice-händelsedriven arkitektur, flera sökstrategier (text, vektor, hybrid), dokumentuppladdning med Azure Document Intelligence och utplacering på antingen Azure Container Apps eller Azure Kubernetes Service.

**Snabbstart**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot med Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Tjänster**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beskrivning**: Slut-till-slut retail RAG copilot med Microsoft Foundry och Prompty. En Contoso Outdoor återförsäljarchattbot som baserar svar på produktkatalog och kundorderdata. Demonstrerar hela GenAIOps-arbetsflödet — prototyp med Prompty, utvärdera med AI-assisterade granskare och distribuera via AZD till Container Apps.

**Snabbstart**:
```bash
azd init --template contoso-chat
azd up
```

### Kreativ skrivande multi-agent-applikation

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Tjänster**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beskrivning**: Multiprovs-prov som visar AI-agentorkestrering med Prompty. Använder en forskningsagent (Bing Grounding i Azure AI Agent Service), en produktagent (Azure AI Search), en skribentagent och en redigerareagent för att tillsammans producera välgrundade artiklar. Inkluderar CI/CD med utvärdering i GitHub Actions.

**Snabbstart**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverlös RAG-chatt (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Tjänster**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB för NoSQL + LangChain.js

**Beskrivning**: Fullständigt serverlös RAG-chattbot med LangChain.js och Azure Functions för API samt Azure Static Web Apps för hosting. Använder Azure Cosmos DB som både vektorlager och chattloggdatabas. Stöder lokal utveckling med Ollama för kostnadsfri testning.

**Snabbstart**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chatta med dina data – lösningsaccelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Tjänster**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Beskrivning**: Enterprise-klassad RAG-lösningsaccelerator med adminportal för dokumentuppladdning/hantering, flera orkestreringsalternativ (Semantic Kernel, LangChain, Prompt Flow), tal-till-text, Microsoft Teams-integrering och val mellan PostgreSQL eller Cosmos DB som backend. Designad som en anpassningsbar startpunkt för produktionsscenarier med RAG.

**Snabbstart**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP-orkestrering

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Tjänster**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP-servrar (.NET, Python, Java, TypeScript)

**Beskrivning**: Referensapplikation för multi-agent AI-orkestrering med tre ramverk (LangChain.js, LlamaIndex.TS och Microsoft Agent Framework). Innehåller MCP (Model Context Protocol) servrar i fyra språk utplacerade som serverlösa Azure Container Apps med OpenTelemetry-övervakning.

**Snabbstart**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Tjänster**: Azure AI Services + Azure OpenAI

**Beskrivning**: Minimal Bicep-mall som distribuerar Azure AI-tjänster med konfigurerade maskininlärningsmodeller. En lätt startpunkt när du bara behöver etablera Azure AI-infrastrukturen utan full applikationsstack.

**Snabbstart**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Bläddra i fler mallar**: Besök [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) för över 80 AI-specifika AZD-mallar över språk och scenarier.

## Nästa steg

1. **Prova exemplen**: Börja med en färdig mall som matchar ditt användningsfall
2. **Anpassa efter dina behov**: Modifiera infrastruktur och applikationskod
3. **Lägg till övervakning**: Implementera omfattande observabilitet
4. **Optimera kostnader**: Finjustera konfigurationer efter din budget
5. **Säkra din utplacering**: Implementera företagsmässiga säkerhetsmönster
6. **Skala till produktion**: Lägg till multi-region och hög tillgänglighet

## 🎯 Praktiska övningar

### Övning 1: Distribuera Microsoft Foundry Models chatt-app (30 minuter)
**Mål**: Distribuera och testa en produktionsklar AI-chattapplikation

```bash
# Initialisera mall
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

**Kriterier för framgång:**
- [ ] Utplacering klarar sig utan kvotfel
- [ ] Kan komma åt chattgränssnitt i webbläsare
- [ ] Kan ställa frågor och få AI-drivna svar
- [ ] Application Insights visar telemetridata
- [ ] Lyckas rensa upp resurser

**Beräknad kostnad**: 5-10 USD för 30 minuters testning

### Övning 2: Konfigurera multi-modellutplacering (45 minuter)
**Mål**: Distribuera flera AI-modeller med olika konfigurationer

```bash
# Skapa anpassad Bicep-konfiguration
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

# Distribuera och verifiera
azd provision
azd show
```

**Kriterier för framgång:**
- [ ] Flera modeller distribuerade framgångsrikt
- [ ] Olika kapacitetsinställningar applicerade
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

**Kriterier för framgång:**
- [ ] Budgetvarning skapad i Azure
- [ ] E-postnotifieringar konfigurerade
- [ ] Kan visa kostnadsdata i Azure Portal
- [ ] Budgetgränser lämpligt satta

## 💡 Vanliga frågor

<details>
<summary><strong>Hur minskar jag Microsoft Foundry Models-kostnader under utveckling?</strong></summary>

1. **Använd gratisnivån**: Microsoft Foundry Models erbjuder 50 000 tokens/månad gratis
2. **Minska kapaciteten**: Sätt kapaciteten till 10 TPM istället för 30+ för utveckling
3. **Använd azd down**: Avallokera resurser när du inte aktivt utvecklar
4. **Cachea svar**: Implementera Redis-cache för upprepade frågor
5. **Använd promptengineering**: Minska token-användning med effektiva prompts


```bash
# Utvecklingskonfiguration
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Vad är skillnaden mellan Microsoft Foundry Models och OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Företagssäkerhet och efterlevnad
- Integration i privat nätverk
- SLA-garantier
- Hanterad identitetsautentisering
- Högre tillgängliga kvoter

**OpenAI API**:
- Snabbare tillgång till nya modeller
- Enklare installation
- Lägre inträdesbarriär
- Endast offentligt internet

För produktionsappar rekommenderas **Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Hur hanterar jag fel för överskridna kvoter i Microsoft Foundry Models?</strong></summary>

```bash
# Kontrollera aktuell kvot
az cognitiveservices usage list --location eastus2

# Prova annan region
azd env set AZURE_LOCATION westus2
azd up

# Minska kapaciteten tillfälligt
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Begära kvötsökning
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

Se [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)-mallen.
</details>

<details>
<summary><strong>Hur säkrar jag AI-modellendpoints?</strong></summary>

**Bästa praxis**:
1. Använd Managed Identity (inga API-nycklar)
2. Aktivera privata endpoints
3. Konfigurera nätverkssäkerhetsgrupper
4. Implementera hastighetsbegränsning
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

## Community och Support

- **Microsoft Foundry Discord**: [#Azure-kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problem och diskussioner](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Officiell dokumentation](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry-färdighet på skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installera Azure + Foundry agent-färdigheter i din editor med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigation:**
- **📚 Kursstart**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande Kapitel**: Kapitel 2 - AI-First Development
- **⬅️ Föregående Kapitel**: [Kapitel 1: Ditt Första Projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nästa**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Nästa Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Behöver du hjälp?** Gå med i våra community-diskussioner eller öppna en fråga i repot. Azure AI + AZD-communityn är här för att hjälpa dig lyckas!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->