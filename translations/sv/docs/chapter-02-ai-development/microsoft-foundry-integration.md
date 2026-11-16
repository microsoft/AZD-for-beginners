# Microsoft Foundry-integration med AZD

**Kapitelnavigering:**
- **📚 Kurshemsida**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 2 - AI-först Utveckling
- **⬅️ Föregående kapitel**: [Kapitel 1: Ditt första projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nästa**: [AI-agenter](agents.md)
- **🚀 Nästa kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Översikt

Denna guide visar hur man integrerar Microsoft Foundry-tjänster med Azure Developer CLI (AZD) för smidigare distribution av AI-applikationer. Microsoft Foundry erbjuder en omfattande plattform för att bygga, distribuera och hantera AI-applikationer, medan AZD förenklar infrastrukturen och distributionsprocessen.

## Vad är Microsoft Foundry?

Microsoft Foundry är Microsofts enade plattform för AI-utveckling som inkluderar:

- **Modellkatalog**: Tillgång till toppmoderna AI-modeller
- **Prompt Flow**: Visuell designer för AI-arbetsflöden
- **Microsoft Foundry Portal**: Integrerad utvecklingsmiljö för AI-applikationer
- **Distributionsalternativ**: Flera värd- och skalningsalternativ
- **Säkerhet och trygghet**: Inbyggda funktioner för ansvarsfull AI

## AZD + Microsoft Foundry: Bättre tillsammans

| Funktion | Microsoft Foundry | Fördel med AZD-integration |
|---------|-----------------|------------------------|
| **Modellutplacering** | Manuell portaldistribution | Automatiserad, upprepningsbar distribution |
| **Infrastruktur** | Klicka för att provisionera | Infrastruktur som kod (Bicep) |
| **Miljöhantering** | Fokuserad på en miljö | Flera miljöer (dev/staging/prod) |
| **CI/CD-integration** | Begränsad | Inbyggt stöd för GitHub Actions |
| **Kostnadshantering** | Grundläggande övervakning | Miljöspecifik kostnadsoptimering |

## Förutsättningar

- Azure-prenumeration med lämpliga behörigheter
- Installerad Azure Developer CLI
- Tillgång till Microsoft Foundry Models-tjänster
- Grundläggande kännedom om Microsoft Foundry

> **Granskning av release (2026-11-04):** AI CLI-vägledning har kontrollerats mot `azd` `1.37.2`, agenter `1.0.0-beta.23` och utvärderingar `1.0.0-beta.2` dokumentation/källa. Använd `azd >= 1.37.0` för det kombinerade arbetsflödet. Se [förändringar och korrigeringar i releasen](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); denna granskning certifierar inte varje mall eller SDK-exempel mot en live-distribution.

## Kärnintegrationsmönster

**Omfattning för exemplen:** Bicepen nedan innehåller illustrativa resursfragment, inte en komplett körbar mall. Den innehållande mallen måste definiera namn, `location`, refererade resurser, identiteter, utdata och applikationsvärdskap. Använd ett länkat exempel för en körbar startpunkt. Bash-exempel kräver Azure CLI-autentisering separat från `azd auth login`.

### Mönster 1: Microsoft Foundry Models-integration

**Användningsfall**: Distribuera chattapplikationer med Azure OpenAI-modeller i Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
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
    disableLocalAuth: true
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
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

Anroparen behöver en bifogad hanterad identitet och `Cognitive Services OpenAI User` på kontonivå; att inaktivera nycklar ger inte åtkomst. Kontrollera region/modell/SKU-tillgänglighet och kvot innan distribution.

### Mönster 2: AI Search + RAG-integration

**Användningsfall**: Distribuera retrieval-augmented generation (RAG) applikationer

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

```

Det finns ingen `Microsoft.Search/searchServices/dataConnections` ARM-resurs för denna integration. Konfigurera en Search-index, datakälla, indexer/skillset eller vektorisering genom de stödda Search data-planes API:erna. Om Search anropar en inbäddningsmodell, aktivera dess hanterade identitet, ge relevant modellroll och konfigurera dess inbäddningsskicklighet/vektoriserare. Se [integrerad vektorisering](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Mönster 3: Dokumentintelligensintegration

**Användningsfall**: Dokumentbearbetnings- och analysarbetsflöden

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

### Miljövariabler Setup

Med undantag för dokumenterade AZD-inställningar som `AZURE_LOCATION`, är dessa **anpassade mallinmatningsnamn**. De har ingen effekt om inte mallen/applikationen använder dem via parameter- och värdmiljö-kartläggningar. För `azure-search-openai-demo`, använd dess faktiska namn som `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` och `AZURE_SEARCH_SERVICE_SKU` istället. Modellkapacitet är inte kontos SKU.

**Produktionskonfiguration:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Utvecklingskonfiguration:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Säker konfiguration med Key Vault

Föredra Entra ID med lokal nyckelautentisering avstängd. Följande är endast ett **legacy nyckel-autentiseringsalternativ** för applikationer som kräver nycklar: det kräver ett konto med nyckelautentisering aktiverad, applikationsidentiteten kopplad till dess värd, och fungerande Key Vault-åtkomst/nätverk. Kombinera inte nyckelhämtning med `disableLocalAuth: true` och förvänta dig att nyckelbaserade anrop ska fungera.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
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

### AZD Extensions för Foundry

AZD tillhandahåller tillägg som lägger till AI-specifika funktioner för arbete med Microsoft Foundry-tjänster:

```bash
# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# List installed extensions
azd extension list --installed

# Inspect the currently installed agent extension version
azd extension show azure.ai.agents
```

AI-tilläggen utvecklas fortfarande snabbt i förhandsversion. Om ett kommando beter sig annorlunda än här visat, uppgradera relevant tillägg innan du felsöker projektet själv.

### Agent-först distribution med `azd ai`

Använd `azd ai agent init` interaktivt, eller anta en aktuell `azure.yaml` agentprojektmall ansluten till Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` ersätter den föråldrade `--manifest`/`-m` stavningen; legacy-manifest och inbäddad agentkonfiguration behöver fortfarande migrering. Utvärdera agenter med `azd ai eval` från `azure.ai.evaluations`, inte det borttagna legacyarbetsflödet. Se [utvärderingsmigration](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) för setup, körning och resultat.

Se [AZD AI CLI-kommandon](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) för fullständig kommandoreferens och flaggor.

### Distribution med ett enda kommando

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Miljöspecifika distributioner

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
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
```

Detta tillhandahåller en Insights-resurs, inte telemetriinstrumentering. När din app skickar utgående modellanrops-spans, kör denna illustrativa fråga i Application Insights Logs (anpassa filter efter dina faktiska span-namn):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Kostnadsövervakning

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

Använd en verklig mottagare och verifiera faktureringsbeskinnings-behörigheter. En budget skickar varningar; det är inte en utgiftsgräns.

## 🔐 Säkerhetsbästa praxis

### Hanterad identitetskonfiguration

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

Detta ändpunktsfragment behöver också en privat DNS-zon/grupp, VNet-länkar, applikations VNet-anslutning och en explicit policy för offentlig åtkomst. Att skapa en privat ändpunkt ensam inaktiverar inte offentlig åtkomst.

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
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
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

Azure Cache för Redis Basic/Standard/Premium är på en [utrangering](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); använd Azure Managed Redis för nya distributioner och följ dess aktuella mall- och autentiseringsguide. Begränsa cachade AI-svar efter auktorisation, modell/instruktioner och dataversion med utgångstid; dela aldrig privata svar bara med hjälp av frågetext.

### Auto-skalningskonfiguration

**Delresurs:** slå ihop dessa skalnings-/ingress-inställningar till en komplett Container App med hanterad miljö, containerbild och resursgränser. Fler repliker ökar inte modellkvoten.

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

### Problem 1: OpenAI kvoten överskriden

**Symptom:**
- Distribution misslyckas med kvotfel
- 429-fel i applikationsloggar

**Lösningar:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

Variabeln kapacitet ovan gäller endast en anpassad mall ansluten för att förbruka den. För RAG-exemplet, använd `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Ändra inte `AZURE_LOCATION` för att flytta befintliga resurser på plats; skapa en separat miljö för en ny region och planera migration/städning.

### Problem 2: Autentiseringsfel

**Symptom:**
- 401/403-fel vid anrop till AI-tjänster
- "Åtkomst nekad"-meddelanden

**Lösningar:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problem 3: Problem med modellutplacering

**Symptom:**
- Modeller ej tillgängliga vid distribution
- Specifika modellversioner fallerar

**Lösningar:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Exempelmallar

Dessa är alternativ, inte sekventiella kommandon. Starta varje i en separat tom katalog. Den explicita destinationen `.` håller initialiseringen i din nuvarande katalog; annars kan nuvarande AZD skapa en mall-namngiven undermapp utan att ändra ditt shell:s arbetskatalog.

### RAG Chat-applikation (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Tjänster**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beskrivning**: En RAG-chatt referensapplikation för frågor över dina dokument, med Azure AI Search-återvinning. Granska det aktuella exemplet med stödda modeller, valfria funktioner, kostnadsråd och produktionstätning innan användning; att distribuera ett exempel gör inte en applikation produktionsklar.

**Snabbstart**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG Chat-applikation (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Tjänster**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beskrivning**: .NET/C# motsvarighet till Python RAG-chatt exemplaret. Byggd med ASP.NET Core Minimal API och Blazor WebAssembly frontend. Inkluderar röstchatt, GPT-4o-mini visionsstöd och en kompis .NET MAUI Blazor Hybrid desktop/mobil klient.

**Snabbstart**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG Chat-applikation (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Tjänster**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beskrivning**: Java-versionen av RAG-chatt-exemplet med Langchain4J för AI-orkestrering. Stöder mikrotjänst-händelsedriven arkitektur, flera sökstrategier (text, vektor, hybrid), dokumentuppladdning med Azure Document Intelligence och distribution på antingen Azure Container Apps eller Azure Kubernetes Service.

**Snabbstart**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot med Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Tjänster**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beskrivning**: End-to-end detaljhandel RAG copilot som använder Microsoft Foundry och Prompty. En Contoso Outdoor-detaljhandel chatbot som grundar svar i produktkatalog och kundorderdata. Demonstrerar hela GenAIOps arbetsflödet — prototyp med Prompty, utvärdera med AI-assisterade utvärderare och distribuera via AZD till Container Apps.

**Snabbstart**:
```bash
azd init --template contoso-chat .
azd up
```

### Kreativt skrivande multi-agent applikation

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Tjänster**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beskrivning**: Multi-agent-exempel som visar AI-agent orkestrering med Prompty. Använder en forskningsagent (Bing Grounding i Azure AI Agent Service), en produktagent (Azure AI Search), en skrivaragent och en redaktörsagent för att gemensamt producera väl undersökta artiklar. Inkluderar CI/CD med utvärdering i GitHub Actions.

**Snabbstart**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverlös RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Tjänster**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB för NoSQL + LangChain.js

**Beskrivning**: Fullt serverlös RAG-chatbot som använder LangChain.js med Azure Functions för API:et och Azure Static Web Apps för värdskap. Använder Azure Cosmos DB som både vektorlager och databas för chattlogg. Stöder lokal utveckling med Ollama för kostnadsfri testning.

**Snabbstart**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chatta med din data-lösningsaccelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Tjänster**: Microsoft Foundry + Azure Container Apps (webb/API/ingestion) + Azure AI Search med Cosmos DB, eller PostgreSQL med pgvector

**Beskrivning**: En dokumentgrundad chataccelerator med källhänvisningar. Det aktuella exemplet värdar en React-frontend, FastAPI-backend och Functions-inkorgsarbetare på Container Apps; orkestratoralternativ är Agent Framework och LangGraph. Databas-/återvinningsalternativ väljs vid distribution. Det är en startpunkt, inte en helt färdig produktionslösning; anta inte att äldre App Service, Semantic Kernel eller Prompt Flow-varianter beskriver aktuell standard.

**Snabbstart**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI Resebyråagenter — Multi-Agent MCP Orkestrering

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Tjänster**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP-servrar (.NET, Python, Java, TypeScript)

**Beskrivning**: Referensapplikation för multi-agent AI-orkestrering med tre ramverk (LangChain.js, LlamaIndex.TS och Microsoft Agent Framework). Har MCP (Model Context Protocol) servrar på fyra språk som körs som serverlösa Azure Container Apps med OpenTelemetry-övervakning.

**Snabbstart**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Bläddra bland fler mallar**: Besök [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) för tillgängliga mallar på olika språk och scenarier. Varje länkad exempel är ett externt repository, inte ett lokalt exempel från denna kurs; granska aktuella förutsättningar och produktionsanvisningar innan distribution.

## Nästa steg

1. **Prova exemplen**: Börja med en förbyggd mall som matchar ditt användningsfall
2. **Anpassa efter dina behov**: Modifiera infrastrukturen och applikationskoden
3. **Lägg till övervakning**: Implementera omfattande observabilitet
4. **Optimera kostnader**: Finjustera konfigurationer för din budget
5. **Säkra din distribution**: Genomför säkerhetsmönster för företag
6. **Skalning till produktion**: Lägg till multi-region och hög tillgänglighet

## 🎯 Praktiska övningar

### Övning 1: Distribuera Microsoft Foundry Models Chat App (30 minuter)
**Mål**: Distribuera och testa en AI-chatt-referensapplikation

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Clean up
azd down --force --purge
```

**Framgångskriterier:**
- [ ] Distributionen slutförs utan kvotfel
- [ ] Kan komma åt chattgränssnittet i webbläsaren
- [ ] Kan ställa frågor och få AI-drivna svar
- [ ] Application Insights visar telemetridata
- [ ] Resurser rensades upp framgångsrikt

**Kostnad:** Granska exempelns aktuella kostnadsguide och valda SKU:er innan distribution. Fakturering pågår tills resurser raderas; ingen fast 30-minutersuppskattning gäller för alla konfigurationer.

### Övning 2: Konfigurera multi-modell-distribution (45 minuter)
**Mål**: Distribuera flera AI-modeller med olika konfigurationer

**Utgångspunkt:** Ett befintligt Azure OpenAI-konto och en AZD resource-group-modul som kan anropa denna fil. Skapa `infra/ai-models.bicep` med följande innehåll i din editor. Den distribueras inte automatiskt bara för att den ligger under `infra/`.

```bicep
param openAiAccountName string

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
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
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
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

Från den resource-group-scopade modulen som äger kontot, lägg till ett modul-anrop (anpassa symbolnamnet till ditt faktiska konto):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Deklarera inte samma distributioner i båda modulerna. Om AZD-entrépunkten är subscription-scopad, anropa detta från dess resource-group-scopade undermodul och justera den relativa sökvägen. Bygg den innehållande modulen med `az bicep build --file <path-to-containing-module>`, sedan:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Framgångskriterier:**
- [ ] Flera modeller distribuerade framgångsrikt
- [ ] Olika kapacitetsinställningar tillämpade
- [ ] Modeller tillgängliga via API
- [ ] Kan anropa båda modeller från applikationen

### Övning 3: Implementera kostnadsövervakning (20 minuter)
**Mål**: Sätt upp budgetlarm och kostnadsspårning

**Utgångspunkt:** Budgetmönstret ovan och en resource-group-scopad infrastrukturmodul. Lägg till denna resurs i din editor; skicka `budgetStartDate` från din parameterkarta (duplikera inte parametern om den redan är deklarerad). Byt ut mottagaren och bekräfta att du har skrivbehörighet för budget.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

Förväntat: svaret innehåller `amount: 200`, båda trösklar och din mottagare. Inspektera Kostnadshantering i portalen för faktiska avgifter; kostnadsdata är fördröjd och ett larm behöver inte aktiveras under en kort övning.

**Framgångskriterier:**
- [ ] Budgetlarm skapat i Azure
- [ ] E-postnotifikationer konfigurerade
- [ ] Kan visa kostnadsdata i Azure-portalen
- [ ] Budgettrösklar satta korrekt

## 💡 Vanliga frågor

<details>
<summary><strong>Hur kan jag minska kostnaderna för Microsoft Foundry Models under utveckling?</strong></summary>

1. **Kontrollera priset**: Det finns ingen universell gratis månadsgräns på 50 000 token för Azure OpenAI-modeller
2. **Rätt kapacitet**: Kapacitet `10` representerar vanligtvis 10 000 TPM för dessa Standard textmodeller, inte 10 TPM. Att minska denna hastighetsgräns minskar inte priset per token
3. **Använd azd down**: Radera tillfälliga resurser när du inte aktivt utvecklar (detta är inte deallokering)
4. **Cachelagra svar**: Implementera Redis-cache för återkommande förfrågningar
5. **Använd Prompt Engineering**: Minska tokenanvändning med effektiva prompts

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Vad är skillnaden mellan Microsoft Foundry Models och OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Företagssäkerhet och efterlevnad
- Privat nätverksintegration
- SLA-garantier
- Hanterad identitetsautentisering
- Högre kvoter tillgängliga

**OpenAI API**: En separat leverantör/API med egen modelltillgänglighet, prissättning, autentisering och företagsanslutningsalternativ. Jämför aktuella erbjudanden istället för att anta att det bara är för offentlig internetanvändning eller alltid levererar modeller först.

Välj baserat på din organisations krav; Azure-specifika exempel på hanterad identitet och private-link i denna kurs gäller Azure-hostade tjänster, inte varje modell/leverantör i Foundry-katalogen.
</details>

<details>
<summary><strong>Hur hanterar jag fel för överskridna kvoter i Microsoft Foundry Models?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>Kan jag använda mina egna data med Microsoft Foundry Models?</strong></summary>

Ja! Använd **Azure AI Search** för RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

Se [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) mallen.
</details>

<details>
<summary><strong>Hur säkrar jag AI-modellernas slutpunkter?</strong></summary>

**Bästa praxis**:
1. Använd hanterad identitet (inga API-nycklar)
2. Aktivera privata slutpunkter
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

## Community och support

- **Microsoft Foundry Discord**: [#Azure-kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problem och diskussioner](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Officiell dokumentation](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill på skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installera Azure + Foundry agent skills i din editor med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD för nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 2 - AI-First Development
- **⬅️ Föregående kapitel**: [Kapitel 1: Ditt första projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nästa**: [AI-agenter](agents.md)
- **🚀 Nästa kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Behöver du hjälp?** Delta i våra community-diskussioner eller öppna en issue i repot. Azure AI + AZD-communityn är här för att hjälpa dig lyckas!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->