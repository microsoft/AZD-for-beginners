# Microsoft Foundry-integration med AZD

**Kapitelnavigation:**
- **📚 Kursus Hjem**: [AZD For Beginners](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 2 - AI-First Udvikling
- **⬅️ Forrige Kapitel**: [Kapitel 1: Dit Første Projekt](../chapter-01-foundation/first-project.md)
- **➡️ Næste**: [AI-agenter](agents.md)
- **🚀 Næste Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Oversigt

Denne vejledning demonstrerer, hvordan man integrerer Microsoft Foundry-tjenester med Azure Developer CLI (AZD) for strømlinede AI-applikationsudrulninger. Microsoft Foundry tilbyder en omfattende platform til opbygning, udrulning og styring af AI-applikationer, mens AZD forenkler infrastruktur- og udrulningsprocessen.

## Hvad er Microsoft Foundry?

Microsoft Foundry er Microsofts samlede platform til AI-udvikling, som inkluderer:

- **Modelkatalog**: Adgang til avancerede AI-modeller
- **Prompt Flow**: Visuel designer til AI-arbejdsgange
- **Microsoft Foundry Portal**: Integreret udviklingsmiljø for AI-applikationer
- **Udrulningsmuligheder**: Flere hosting- og skaleringsmuligheder
- **Sikkerhed og Tryghed**: Indbyggede ansvarlige AI-funktioner

## AZD + Microsoft Foundry: Bedre sammen

| Funktion | Microsoft Foundry | AZD Integrationsfordel |
|---------|-----------------|------------------------|
| **Modeludrulning** | Manuel portaludrulning | Automatiserede, gentagelige udrulninger |
| **Infrastruktur** | Klik-gennem provisionering | Infrastruktur som kode (Bicep) |
| **Miljøstyring** | Fokus på enkelt miljø | Multi-miljø (dev/staging/prod) |
| **CI/CD-integration** | Begrænset | Indbygget GitHub Actions-understøttelse |
| **Omkostningsstyring** | Grundlæggende overvågning | Miljøspecifik omkostningsoptimering |

## Forudsætninger

- Azure-abonnement med de nødvendige tilladelser
- Azure Developer CLI installeret
- Adgang til Microsoft Foundry Models-tjenester
- Grundlæggende kendskab til Microsoft Foundry

> **Udgivelsesevaluering (2026-11-04):** AI CLI vejledning blev gennemgået i forhold til `azd` `1.37.2`, agenter `1.0.0-beta.23` og evalueringer `1.0.0-beta.2` dokumentation/kilde. Brug `azd >= 1.37.0` til den kombinerede arbejdsgang. Se [udgivelsesændringer og rettelser](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); denne gennemgang certificerer ikke alle skabeloner eller SDK-eksempler i forhold til en live-udrulning.

## Kerneintegrationsmønstre

**Omfang af eksemplerne:** Bicep-koden nedenfor indeholder illustrative ressourcefragmenter, ikke en komplet deployerbar skabelon. Den overordnede skabelon skal definere navne, `location`, referenced ressourcer, identiteter, outputs og hosting af applikation. Brug et linket eksempel for en kørbar startpakke. Bash-eksempler kræver Azure CLI-autentifikation separat fra `azd auth login`.

### Mønster 1: Microsoft Foundry Models-integration

**Brugstilfælde**: Udrul chatapplikationer med Azure OpenAI-modeller i Microsoft Foundry

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

Kalderen skal have tilknyttet managed identity og `Cognitive Services OpenAI User` på kontoniveau; deaktivering af nøgler giver ikke adgang. Bekræft regions-/model-/SKU-tilgængelighed og kvoter før udrulning.

### Mønster 2: AI Search + RAG-integration

**Brugstilfælde**: Udrul retrieval-augmented generation (RAG) applikationer

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

Der findes ikke en `Microsoft.Search/searchServices/dataConnections` ARM-ressource til denne integration. Konfigurer en Search-indeks, datakilde, indekserer/skillset eller vektorisator via de understøttede Search data-plane API'er. Hvis Search kalder en embedding-model, aktiver dens managed identity, tildel relevant modelrolle, og konfigurer dens embedding-skill/vektorizer. Se [integreret vektorisering](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Mønster 3: Document Intelligence-integration

**Brugstilfælde**: Dokumentbehandlings- og analysearbejdsgange

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

Bortset fra dokumenterede AZD-indstillinger som `AZURE_LOCATION`, er disse **brugerdefinerede skabelonindgange**. De har ingen effekt, medmindre skabelonen/applikationen bruger dem via parameter- og miljømapping. For `azure-search-openai-demo` brug de faktiske navne som `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` og `AZURE_SEARCH_SERVICE_SKU` i stedet. Modellkapacitet er ikke kontos SKU.

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

**Udviklingskonfiguration:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Sikker konfiguration med Key Vault

Foretræk Entra ID med lokal nøgleautentifikation deaktiveret. Følgende er kun et **ældre nød-alternativ med nøgle-autentifikation** til applikationer, der kræver nøgler: det kræver en konto med nøgleautentifikation aktiveret, applikationsidentitet tilknyttet vært, og fungerende adgang/netværk til Key Vault. Kombiner ikke nøglehentning med `disableLocalAuth: true` og forvent, at nøglebaserede kald virker.

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

## Udrulningsarbejdsgange

### AZD-udvidelser til Foundry

AZD tilbyder udvidelser, der tilføjer AI-specifikke funktioner til arbejde med Microsoft Foundry-tjenester:

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

AI-udvidelserne udvikler sig stadig hurtigt i preview. Hvis en kommando opfører sig anderledes end vist her, opgrader den relevante udvidelse, før du fejlsøger selve projektet.

### Agent-først udrulning med `azd ai`

Brug `azd ai agent init` interaktivt, eller brug en aktuel `azure.yaml` agent-projekt skabelon, der er tilsluttet Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` erstatter den forældede `--manifest`/`-m` stavemåde; ældre manifest og indlejret agentkonfiguration kræver stadig migration. Evaluer agenter med `azd ai eval` fra `azure.ai.evaluations`, ikke den fjernede ældre arbejdsgang. Se [evalueringsmigrering](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) for opsætning, eksekvering og resultater.

Se [AZD AI CLI Kommandoer](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for fuld kommandoreference og flag.

### Udrulning med enkelt kommando

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Miljøspecifikke udrulninger

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

## Overvågning og Observerbarhed

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

Dette opretter en Insights-ressource, ikke telemetri-instrumentering. Når din app udsender udgående model-kald, skal du køre denne illustrative forespørgsel i Application Insights Logs (tilpas filteret til dine faktiske span-navne):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Omkostningsovervågning

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

Brug en reel modtager og bekræft betalings-omfangstilladelser. Et budget sender advarsler; det er ikke en udgiftsgrænse.

## 🔐 Sikkerhed bedste praksis

### Managed Identity-konfiguration

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

Dette endpoint-fragment kræver også en privat DNS-zone/gruppe, VNet-links, applikations VNet-forbindelse og en eksplicit politik for offentlig adgang. At skabe et privat endpoint alene deaktiverer ikke offentlig adgang.

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

## Ydeevneoptimering

### Cache-strategier

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

Azure Cache for Redis Basic/Standard/Premium er på en [udfasningsvej](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); brug Azure Managed Redis til nye udrulninger og følg dets aktuelle skabelon-/autentifikationsvejledning. Afgræns cachelagrede AI-svar efter autorisation, model/instruktioner og dataversion, med udløb; del aldrig private svar kun ud fra forespørgselstekst.

### Auto-skalering konfiguration

**Delvis ressource:** flet disse skalerings-/indgangsindstillinger ind i en komplet Container App med et managed miljø, containerbillede og ressourcebegrænsninger. Flere replikaer øger ikke modelkvoter.

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

### Problem 1: OpenAI kvote overskredet

**Symptomer:**
- Udrulning fejler med kvotefeil
- 429-fejl i applikationslogs

**Løsninger:**
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

Variablen for kapacitet gælder kun for en brugerdefineret skabelon, der bruger den. For RAG-eksemplet brug `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Ændr ikke `AZURE_LOCATION` for at flytte eksisterende ressourcer på plads; opret et separat miljø for en ny region og planlæg migration/rydning.

### Problem 2: Autentificeringsfejl

**Symptomer:**
- 401/403 fejl ved kald til AI-tjenester
- "Adgang nægtet" beskeder

**Løsninger:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problem 3: Modeludrulningsproblemer

**Symptomer:**
- Modeller ikke tilgængelige ved udrulning
- Specifikke modelversioner fejler

**Løsninger:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Eksempel-skabeloner

Disse er alternativer, ikke sekventielle kommandoer. Start hver i en separat tom mappe. Den eksplicitte `.` destination fastholder initialisering i din nuværende mappe; ellers kan den nuværende AZD oprette en undermappe med skabelonnavnet uden at ændre dit shells arbejdsmappe.

### RAG Chat-applikation (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beskrivelse**: En RAG chat referenceapplikation til spørgsmål over dine dokumenter, med Azure AI Search-opsamling. Gennemgå det nuværende eksempls understøttede modeller, valgfrie funktioner, omkostningsvejledning og produktionssikring før brug; udrulning af et eksempel gør ikke en applikation produktionsklar.

**Hurtig start**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG Chat-applikation (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beskrivelse**: .NET/C# ækvivalent til Python RAG chat-eksemplet. Bygget med ASP.NET Core Minimal API og Blazor WebAssembly frontend. Inkluderer stemmechat, GPT-4o-mini visionsunderstøttelse og en ledsagende .NET MAUI Blazor Hybrid desktop/mobil klient.

**Hurtig start**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG Chat-applikation (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beskrivelse**: Java-version af RAG chat-eksemplet, der bruger Langchain4J til AI-orchestrering. Understøtter event-drevet mikrotjenestearkitektur, flere søgestrategier (tekst, vektor, hybrid), dokumentupload med Azure Document Intelligence, og udrulning på enten Azure Container Apps eller Azure Kubernetes Service.

**Hurtig start**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot med Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Tjenester**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beskrivelse**: End-to-end detail RAG copilot med Microsoft Foundry og Prompty. En Contoso Outdoor detailhandler chatbot, der baserer svar i produktkatalog- og kundeordredatabase. Demonstrerer hele GenAIOps arbejdsgangen — prototype med Prompty, evaluer med AI-assisterede evaluatorer, og udrul via AZD til Container Apps.

**Hurtig start**:
```bash
azd init --template contoso-chat .
azd up
```

### Kreativ Skrivning Multi-Agent-applikation

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Tjenester**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beskrivelse**: Multi-agent eksempel, der demonstrerer AI-agent orchestrering med Prompty. Bruger en forskningsagent (Bing Grounding i Azure AI Agent Service), en produktagent (Azure AI Search), en forfatteragent og en redaktøragent til at samarbejde om velresearchede artikler. Inkluderer CI/CD med evaluering i GitHub Actions.

**Hurtig start**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverløs RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Tjenester**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB til NoSQL + LangChain.js

**Beskrivelse**: Fuldt serverløs RAG chatbot, der bruger LangChain.js med Azure Functions til API'en og Azure Static Web Apps til hosting. Bruger Azure Cosmos DB som både vektorlager og chat historie database. Understøtter lokal udvikling med Ollama til omkostningsfri test.

**Hurtig start**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat med Dine Data Løsningsaccelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Tjenester**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search med Cosmos DB, eller PostgreSQL med pgvector

**Beskrivelse**: En dokument-baseret chat-accelerator med kildehenvisninger. Det nuværende eksempel hoster en React frontend, FastAPI backend og Functions ingestion worker på Container Apps; orkestratorvalg er Agent Framework og LangGraph. Database-/opslagmuligheder vælges ved udrulning. Det er et udgangspunkt, ikke et færdigt produktsystem; antag ikke, at ældre App Service, Semantic Kernel eller Prompt Flow varianter beskriver den nuværende standard.

**Hurtig start**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI Rejseagenter — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Tjenester**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Beskrivelse**: Referenceapplikation for multi-agent AI-orkestrering ved brug af tre frameworks (LangChain.js, LlamaIndex.TS og Microsoft Agent Framework). Indeholder MCP (Model Context Protocol) servere i fire sprog, implementeret som serverløse Azure Container Apps med OpenTelemetry overvågning.

**Hurtig start**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Gennemse flere skabeloner**: Besøg [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for aktuelle tilgængelige skabeloner på tværs af sprog og scenarier. Hvert linked eksempel er et eksternt repository, ikke et lokalt eksempel leveret i dette kursus; undersøg dets aktuelle forudsætninger og produktionsvejledning før implementering.

## Næste skridt

1. **Prøv eksemplerne**: Start med en forudbygget skabelon, der matcher dit brugsscenario
2. **Tilpas efter dine behov**: Ændr infrastrukturen og applikationskoden
3. **Tilføj overvågning**: Implementer omfattende observabilitet
4. **Optimer omkostninger**: Finjuster konfigurationer til dit budget
5. **Sikr din implementering**: Implementer virksomhedssikkerhedsmønstre
6. **Skaler til produktion**: Tilføj multi-region og høj-tilgængelighedsfunktioner

## 🎯 Praktiske øvelser

### Øvelse 1: Implementer Microsoft Foundry Models Chat App (30 minutter)
**Mål**: Implementer og test en AI-chat referenceapplikation

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

**Succes kriterier:**
- [ ] Implementering fuldføres uden kvotafejl
- [ ] Kan få adgang til chatgrænsefladen i browseren
- [ ] Kan stille spørgsmål og få AI-drevne svar
- [ ] Application Insights viser telemetridata
- [ ] Ressourcer slettet med succes efterfølgende

**Omkostninger:** Gennemgå det aktuelle omkostningsguide og valgte SKU’er for eksemplet før implementering. Fakturering fortsætter indtil ressourcer er slettet; der gælder ikke et fast 30-minutters estimat for alle konfigurationer.

### Øvelse 2: Konfigurer Multi-Model implementering (45 minutter)
**Mål**: Implementer flere AI-modeller med forskellige konfigurationer

**Udgangspunkt:** En eksisterende Azure OpenAI-konto og et AZD resource-group modul, der kan kalde denne fil. Opret `infra/ai-models.bicep` med følgende indhold i din editor. Det implementeres ikke automatisk bare fordi det er under `infra/`.

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

Fra det resource-group scoped modul, der ejer kontoen, tilføj et modulkald (tilpas symbolnavnet til din faktiske konto):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Deklarer ikke de samme implementeringer i begge moduler. Hvis AZD-indgangspunktet er subscription-scoped, kald dette fra dets resource-group scoped undermodul og juster den relative sti. Byg det indeholdende modul med `az bicep build --file <path-to-containing-module>`, og gør derefter:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Succes kriterier:**
- [ ] Flere modeller implementeret succesfuldt
- [ ] Forskellige kapacitetsindstillinger anvendt
- [ ] Modeller tilgængelige via API
- [ ] Kan kalde begge modeller fra applikationen

### Øvelse 3: Implementer Omkostningsovervågning (20 minutter)
**Mål**: Sæt budgetalarmer og omkostningssporing op

**Udgangspunkt:** Budgetmønstret ovenfor og et resource-group scoped infrastrukturmodul. Tilføj denne ressource med din editor; overfør `budgetStartDate` fra din parameterkortlægning (duplikér ikke parameteren hvis den allerede er deklareret). Erstat modtageren og bekræft, at du har budgetskriveadgang.

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

Forventet: Responsen indeholder `amount: 200`, begge tærskler og din modtager. Undersøg Cost Management i portalen for faktiske udgifter; omkostningsdata er forsinkede og en alarm behøver ikke at udløse under en kort øvelse.

**Succes kriterier:**
- [ ] Budgetalarm oprettet i Azure
- [ ] E-mail notifikationer konfigureret
- [ ] Kan se omkostningsdata i Azure Portal
- [ ] Budgettærskler sat korrekt

## 💡 Ofte stillede spørgsmål

<details>
<summary><strong>Hvordan reducerer jeg Microsoft Foundry Models omkostninger under udvikling?</strong></summary>

1. **Tjek priserne**: Der findes ikke en universel gratis månedlig kvote på 50.000 tokens for Azure OpenAI modeller
2. **Vælg passende kapacitet**: Kapacitet `10` repræsenterer typisk 10.000 TPM for disse Standard tekstmodeller, ikke 10 TPM. At reducere denne grænse reducerer ikke prisen per token
3. **Brug azd down**: Slet midlertidige ressourcer, når du ikke aktivt udvikler (det er ikke deallokering)
4. **Cache svar**: Implementer Redis-cache for gentagne forespørgsler
5. **Brug Prompt Engineering**: Reducer tokenforbrug med effektive prompts

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Hvad er forskellen mellem Microsoft Foundry Models og OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Virksomhedssikkerhed og overholdelse
- Integration i privat netværk
- SLA-garantier
- Managed identity autentifikation
- Højere kvoter tilgængelige

**OpenAI API**: En separat udbyder/API med egen modeltilgængelighed, prissætning, autentifikation og virksomhedstilknytningsmuligheder. Sammenlign aktuelle tilbud i stedet for at antage, det kun er offentligt internet eller altid frigiver modeller først.

Vælg baseret på din organisations behov; Azure-specifikke managed identity og private-link eksempler i dette kursus gælder Azure-hostede tjenester, ikke hver model/udbyder i Foundry-kataloget.
</details>

<details>
<summary><strong>Hvordan håndterer jeg Microsoft Foundry Models fejl om kvoteoverskridelse?</strong></summary>

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
<summary><strong>Kan jeg bruge mine egne data med Microsoft Foundry Models?</strong></summary>

Ja! Brug **Azure AI Search** til RAG (Retrieval Augmented Generation):

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

Se [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) skabelonen.
</details>

<details>
<summary><strong>Hvordan sikrer jeg AI model-endpoints?</strong></summary>

**Bedste praksis**:
1. Brug Managed Identity (ingen API-nøgler)
2. Aktiver Private Endpoints
3. Konfigurer netværkssikkerhedsgrupper
4. Implementer ratebegrænsning
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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Officiel dokumentation](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill på skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installer Azure + Foundry agentfærdigheder i din editor med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigation:**
- **📚 Kursus startside**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 2 - AI-Første Udvikling
- **⬅️ Forrige kapitel**: [Kapitel 1: Dit første projekt](../chapter-01-foundation/first-project.md)
- **➡️ Næste**: [AI Agenter](agents.md)
- **🚀 Næste kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Brug for hjælp?** Deltag i vores fællesskabsdiskussioner eller opret en issue i repository'et. Azure AI + AZD fællesskabet er her for at hjælpe dig med succes!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->