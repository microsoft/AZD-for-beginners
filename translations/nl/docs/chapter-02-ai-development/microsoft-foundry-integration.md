# Microsoft Foundry-integratie met AZD

**Hoofdstuk Navigatie:**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 2 - AI-First Ontwikkeling
- **⬅️ Vorig Hoofdstuk**: [Hoofdstuk 1: Je Eerste Project](../chapter-01-foundation/first-project.md)
- **➡️ Volgend**: [AI Agents](agents.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

## Overzicht

Deze gids laat zien hoe je Microsoft Foundry-services integreert met Azure Developer CLI (AZD) voor gestroomlijnde AI-applicatie-implementaties. Microsoft Foundry biedt een uitgebreid platform voor het bouwen, implementeren en beheren van AI-toepassingen, terwijl AZD het infrastructuur- en implementatieproces vereenvoudigt.

## Wat is Microsoft Foundry?

Microsoft Foundry is Microsoft's unified platform voor AI-ontwikkeling dat omvat:

- **Modelcatalogus**: Toegang tot geavanceerde AI-modellen
- **Prompt Flow**: Visuele ontwerper voor AI-workflows
- **Microsoft Foundry Portal**: Geïntegreerde ontwikkelomgeving voor AI-toepassingen
- **Implementatie-opties**: Meerdere hosting- en schaalopties
- **Veiligheid en Beveiliging**: Ingebouwde verantwoordelijkheidsfuncties voor AI

## AZD + Microsoft Foundry: Beter Samen

| Kenmerk | Microsoft Foundry | Voordeel Integratie met AZD |
|---------|-----------------|------------------------|
| **Modelimplementatie** | Handmatige portalimplementatie | Geautomatiseerde, herhaalbare implementaties |
| **Infrastructuur** | Klik-door provisioning | Infrastructuur als Code (Bicep) |
| **Omgevingsbeheer** | Focus op één omgeving | Meerdere omgevingen (dev/staging/prod) |
| **CI/CD-integratie** | Beperkt | Native ondersteuning voor GitHub Actions |
| **Kostenbeheer** | Basisbewaking | Omgevingsspecifieke kostenoptimalisatie |

## Vereisten

- Azure-abonnement met de juiste machtigingen
- Azure Developer CLI geïnstalleerd
- Toegang tot Microsoft Foundry Models-services
- Basiskennis van Microsoft Foundry

> **Release review (2026-11-04):** AI CLI-richtlijnen zijn gecontroleerd tegen `azd` `1.37.2`, agents `1.0.0-beta.23`, en evaluaties `1.0.0-beta.2` documentatie/bron. Gebruik `azd >= 1.37.0` voor de gecombineerde workflow. Zie [releasewijzigingen en fixes](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); deze review certificeert niet elke template of SDK-voorbeeld tegen een live implementatie.

## Kernintegratiepatronen

**Reikwijdte van de voorbeelden:** De onderstaande Bicep bevat illustratieve resource-fragmenten, geen volledig implementeerbare template. De omliggende template moet namen, `location`, gerefereerde resources, identiteiten, outputs en applicatie-hosting definiëren. Gebruik een gelinkte sample voor een uitvoerig startpunt. Bash-voorbeelden vereisen aparte Azure CLI-authenticatie naast `azd auth login`.

### Patroon 1: Integratie Microsoft Foundry Models

**Gebruikssituatie**: Implementeer chat-applicaties met Azure OpenAI-modellen in Microsoft Foundry

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

**Infrastructuur (main.bicep):**
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

De aanroeper heeft een gekoppelde managed identity en `Cognitive Services OpenAI User` op account-niveau nodig; het uitschakelen van sleutels verleent geen toegang. Verifieer regio/model/SKU-beschikbaarheid en quota vóór implementatie.

### Patroon 2: AI Search + RAG Integratie

**Gebruikssituatie**: Implementeer retrieval-augmented generation (RAG)-applicaties

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

Er is geen `Microsoft.Search/searchServices/dataConnections` ARM-resource voor deze integratie. Configureer een Search-index, gegevensbron, indexer/skillset of vectorizer via de ondersteunde Search data-plane API's. Als Search een embedding-model oproept, activeer dan de managed identity, ken de relevante modelrol toe, en configureer de embed-skills/vectorizer. Zie [geïntegreerde vectorisatie](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Patroon 3: Document Intelligence Integratie

**Gebruikssituatie**: Workflows voor documentverwerking en -analyse

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

## 🔧 Configuratiepatronen

### Omgevingsvariabelen instellen

Behalve de gedocumenteerde AZD-instellingen zoals `AZURE_LOCATION`, zijn dit **aangepaste template invoernaamgevingen**. Ze hebben geen effect tenzij de template/applicatie ze gebruikt via parameter- en host-omgeving mappings. Voor `azure-search-openai-demo`, gebruik in plaats daarvan de feitelijke namen zoals `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` en `AZURE_SEARCH_SERVICE_SKU`. Modelcapaciteit is geen account SKU.

**Productieconfiguratie:**
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

**Ontwikkelingsconfiguratie:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Beveiligde configuratie met Key Vault

Geef de voorkeur aan Entra ID met locale sleutel-authenticatie uitgeschakeld. Het volgende is alleen een **verouderde sleutel-authenticatie-alternatief** voor applicaties die sleutels vereisen: het vraagt om een account met sleutel-authenticatie ingeschakeld, de applicatie-identiteit gekoppeld aan zijn host, en werkende Key Vault-toegang/netwerk. Combineer geen sleutel-opvraging met `disableLocalAuth: true` en verwacht dat sleutelgebaseerde oproepen werken.

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

## Implementatieworkflows

### AZD-extensies voor Foundry

AZD biedt extensies die AI-specifieke mogelijkheden toevoegen voor het werken met Microsoft Foundry-services:

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

De AI-extensies ontwikkelen zich nog snel in preview. Als een commando zich anders gedraagt dan hier getoond, upgrade dan eerst de relevante extensie voordat je het project zelf debugt.

### Agent-First Implementatie met `azd ai`

Gebruik `azd ai agent init` interactief, of neem een actueel `azure.yaml` agent-projecttemplate dat is verbonden met Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` vervangt de verouderde `--manifest`/`-m` schrijfwijze; legacy manifest en geneste agentconfiguratie moeten nog gemigreerd worden. Evalueer agents met `azd ai eval` van `azure.ai.evaluations`, niet de verwijderde legacy workflow. Zie [evaluatie migratie](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) voor setup, uitvoering en resultaten.

Zie [AZD AI CLI Commando's](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) voor de volledige commandoreferentie en opties.

### Eén-commando Implementatie

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Omgevingsspecifieke Implementaties

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

## Monitoring en Observeerbaarheid

### Integratie met Application Insights

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

Dit voorziet een Insights resource, geen telemetrie-instrumentatie. Zodra je app uitgaande model-oproep spans geeft, voer dan deze illustratieve query uit in Application Insights Logs (pas de filter aan op je daadwerkelijke span-namen):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Kostenbewaking

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

Gebruik een echte ontvanger en verifieer facturerings-scope machtigingen. Een budget stuurt waarschuwingen; het is geen bestedingslimiet.

## 🔐 Beste Praktijken voor Beveiliging

### Managed Identity Configuratie

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

### Netwerkbeveiliging

Dit endpoint-fragment heeft ook een private DNS-zone/groep, VNet-links, applicatie VNet-connectiviteit, en een expliciet beleid voor openbare toegang nodig. Het maken van een private endpoint alleen schakelt publieke toegang niet uit.

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

## Prestatieoptimalisatie

### Caching Strategieën

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

Azure Cache for Redis Basic/Standard/Premium staat op een [uitfaseringstraject](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); gebruik Azure Managed Redis voor nieuwe implementaties en volg de huidige template-/authenticatierichtlijnen. Scope gecachte AI-responses op autorisatie, model/instructies en dataversie, met vervaldatum; deel nooit privé responsen alleen op basis van querytekst.

### Auto-scaling Configuratie

**Deelresource:** voeg deze schaal-/ingress-instellingen samen in een volledige Container App met een beheerde omgeving, containerimage en resourcebeperkingen. Meer replica's verhogen de modelquota niet.

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

## Problemen Oplossen bij Veelvoorkomende Problemen

### Probleem 1: OpenAI Quota Overschreden

**Symptomen:**
- Implementatie mislukt met quota-fouten
- 429-fouten in applicatielogs

**Oplossingen:**
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

De capaciteitvariabele hierboven geldt alleen voor een aangepaste template die deze consumeert. Gebruik voor de RAG-sample `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Verander `AZURE_LOCATION` niet om bestaande resources te verplaatsen; maak een aparte omgeving voor een nieuwe regio en plan migratie/opruiming.

### Probleem 2: Authenticatiefouten

**Symptomen:**
- 401/403-fouten bij het aanroepen van AI-services
- "Toegang geweigerd" berichten

**Oplossingen:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Probleem 3: Model Implementatieproblemen

**Symptomen:**
- Modellen niet beschikbaar in implementatie
- Specifieke modelversies falen

**Oplossingen:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Voorbeeldtemplates

Dit zijn alternatieven, geen sequentiële commando's. Start elk in een aparte lege map. De expliciete `.` bestemming houdt initialisatie in je huidige map; anders kan de huidige AZD een template-genaamde submap maken zonder de werkmap in je shell te veranderen.

### RAG Chat Applicatie (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beschrijving**: Een RAG chat referentieapplicatie voor vragen over je documenten, met Azure AI Search retrieval. Bekijk de huidige sample's ondersteunde modellen, optionele functies, kostengids en productierijkmaking vóór gebruik; het implementeren van een sample maakt een applicatie niet direct productieklaar.

**Snelstart**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG Chat Applicatie (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beschrijving**: De .NET/C# equivalent van de Python RAG chat sample. Gebouwd met ASP.NET Core Minimal API en Blazor WebAssembly frontend. Inclusief voice chat, GPT-4o-mini vision-ondersteuning en een begeleidende .NET MAUI Blazor Hybrid desktop/mobile client.

**Snelstart**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG Chat Applicatie (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beschrijving**: Java-versie van de RAG chat sample met Langchain4J voor AI-orchestratie. Ondersteunt microservice event-driven architectuur, meerdere zoekstrategieën (tekst, vector, hybride), document-upload met Azure Document Intelligence, en implementatie op Azure Container Apps of Azure Kubernetes Service.

**Snelstart**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot met Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beschrijving**: End-to-end retail RAG copilot met Microsoft Foundry en Prompty. Een Contoso Outdoor retailer chatbot die antwoorden baseert op productcatalogus en klantordergegevens. Demonstreert de volledige GenAIOps workflow — prototype met Prompty, evaluatie met AI-ondersteunde evaluators, en implementatie via AZD naar Container Apps.

**Snelstart**:
```bash
azd init --template contoso-chat .
azd up
```

### Creative Writing Multi-Agent Applicatie

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beschrijving**: Multi-agent sample die AI-agent orchestratie met Prompty demonstreert. Gebruikt een onderzoeksagent (Bing Grounding in Azure AI Agent Service), een productagent (Azure AI Search), een schrijver-agent en een redacteur-agent om samen zorgvuldig onderzochte artikelen te produceren. Inclusief CI/CD met evaluatie in GitHub Actions.

**Snelstart**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB voor NoSQL + LangChain.js

**Beschrijving**: Volledig serverloze RAG-chatbot met LangChain.js, Azure Functions voor de API en Azure Static Web Apps voor hosting. Gebruikt Azure Cosmos DB als zowel vector store als chatgeschiedenisdatabase. Ondersteunt lokale ontwikkeling met Ollama voor kosteloze tests.

**Snelstart**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat met Jouw Data Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search met Cosmos DB, of PostgreSQL met pgvector

**Beschrijving**: Een document-gegrond chat-accelerator met citaten. De huidige sample host een React-frontend, FastAPI-backend, en Functions ingestion-worker op Container Apps; orkestratie-opties zijn Agent Framework en LangGraph. Database-/retrieval-opties worden geselecteerd bij implementatie. Het is een startpunt, geen kant-en-klaar productiesysteem; ga er niet vanuit dat oudere App Service, Semantic Kernel, of Prompt Flow varianten de huidige standaard beschrijven.

**Snelstart**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestratie

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP-servers (.NET, Python, Java, TypeScript)

**Beschrijving**: Referentie-applicatie voor multi-agent AI-orchestration met gebruik van drie frameworks (LangChain.js, LlamaIndex.TS, en Microsoft Agent Framework). Beschikt over MCP (Model Context Protocol) servers in vier talen die worden ingezet als serverloze Azure Container Apps met OpenTelemetry monitoring.

**Snelle start**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Bekijk meer sjablonen**: Bezoek de [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) voor momenteel beschikbare sjablonen in diverse talen en scenario's. Elk gekoppeld voorbeeld is een externe repository, geen lokaal voorbeeld dat door deze cursus is geleverd; controleer de actuele vereisten en productierichtlijnen voor implementatie.

## Volgende stappen

1. **Probeer de voorbeelden uit**: Begin met een vooraf gebouwd sjabloon dat past bij je use case
2. **Pas aan naar jouw wensen**: Wijzig de infrastructuur- en applicatiecode
3. **Voeg monitoring toe**: Implementeer uitgebreide observatie
4. **Optimaliseer kosten**: Stel configuraties af op je budget
5. **Beveilig je implementatie**: Voer beveiligingspatronen voor bedrijven in
6. **Schaal naar productie**: Voeg multi-regio en hoge beschikbaarheidsfuncties toe

## 🎯 Praktijkopdrachten

### Opdracht 1: Implementeer Microsoft Foundry Models Chat App (30 minuten)
**Doel**: Implementeren en testen van een AI-chat referentieapplicatie

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

**Succescriteria:**
- [ ] Implementatie voltooid zonder quotafouten
- [ ] Toegang tot chatinterface in browser
- [ ] Vragen kunnen stellen en AI-gestuurde antwoorden ontvangen
- [ ] Application Insights toont telemetriedata
- [ ] Bronnen succesvol opgeruimd

**Kosten:** Bekijk de huidige kostenhandleiding en geselecteerde SKUs van het voorbeeld voor implementatie. Facturering loopt door tot bronnen worden verwijderd; er is geen vaste 30-minuten schatting voor elke configuratie.

### Opdracht 2: Configureer Multi-Model Implementatie (45 minuten)
**Doel**: Implementeer meerdere AI-modellen met verschillende configuraties

**Startpunt:** Een bestaand Azure OpenAI-account en een AZD resource-group-module die dit bestand kan aanroepen. Maak `infra/ai-models.bicep` aan met onderstaande inhoud via je editor. Deze wordt niet automatisch uitgerold alleen omdat het zich onder `infra/` bevindt.

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

Vanuit de resource-group-gescopeerde module die het account beheert, voeg een module-aanroep toe (pas de symboolnaam aan naar je eigen account):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Verklaar dezelfde implementaties niet in beide modules. Als het AZD toegangspunt op abonnementsniveau is, roep dit dan aan vanuit de resource-group-gescopeerde submodule en pas het relatieve pad aan. Bouw die module met `az bicep build --file <path-to-containing-module>`, dan:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Succescriteria:**
- [ ] Meerdere modellen succesvol geïmplementeerd
- [ ] Verschillende capaciteitsinstellingen toegepast
- [ ] Modellen toegankelijk via API
- [ ] Beide modellen kunnen worden aangeroepen vanuit de applicatie

### Opdracht 3: Implementeer Kostenmonitoring (20 minuten)
**Doel**: Stel budgetalerts en kostentracking in

**Startpunt:** Het hierboven genoemde budgetpatroon en een resource-group-gescopeerde infrastructuurmodule. Voeg deze resource toe via je editor; geef `budgetStartDate` door vanuit je parameter-mapping (dupliseer de parameter niet als die al is gedeclareerd). Vervang de ontvanger en bevestig dat je schrijfrechten hebt op het budget.

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

Verwacht: de reactie bevat `amount: 200`, beide drempels en jouw ontvanger. Controleer Cost Management in het portal voor daadwerkelijke kosten; kostendata is vertraagd en een alert hoeft niet af te gaan tijdens een korte oefening.

**Succescriteria:**
- [ ] Budgetalert aangemaakt in Azure
- [ ] E-mailmeldingen geconfigureerd
- [ ] Kostendata kan bekeken worden in Azure Portal
- [ ] Budgetdrempels correct ingesteld

## 💡 Veelgestelde vragen

<details>
<summary><strong>Hoe kan ik Microsoft Foundry Models kosten verlagen tijdens ontwikkeling?</strong></summary>

1. **Controleer prijzen**: Er is geen universele gratis maandelijkse toewijzing van 50.000 tokens voor Azure OpenAI-modellen
2. **Pas capaciteit aan**: Capaciteit `10` vertegenwoordigt doorgaans 10.000 TPM voor deze Standard tekstmodellen, niet 10 TPM. Het verlagen van deze snelheidslimiet verlaagt de prijs per token niet
3. **Gebruik azd down**: Verwijder tijdelijke bronnen als je niet actief ontwikkelt (dit is geen de-allocatie)
4. **Cache reacties**: Implementeer Redis cache voor herhaalde queries
5. **Gebruik Prompt Engineering**: Verminder tokenverbruik met efficiënte prompts

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Wat is het verschil tussen Microsoft Foundry Models en de OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Beveiliging en compliance voor ondernemingen
- Integratie met privénetwerk
- SLA-garanties
- Authenticatie via managed identity
- Hogere quota beschikbaar

**OpenAI API**: Een aparte provider/API met eigen modelbeschikbaarheid, prijsstelling, authenticatie en opties voor enterprise-connectiviteit. Vergelijk de actuele aanbiedingen in plaats van aan te nemen dat het alleen publiek internet is of dat modellen er altijd als eerste verschijnen.

Kies op basis van de eisen van jouw organisatie; Azure-specifieke managed identity en private-link voorbeelden in deze cursus gelden voor Azure-gehoste diensten, niet voor elk model/provider in de Foundry-catalogus.
</details>

<details>
<summary><strong>Hoe ga ik om met Microsoft Foundry Models quota overschrijdingsfouten?</strong></summary>

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
<summary><strong>Kan ik mijn eigen data gebruiken met Microsoft Foundry Models?</strong></summary>

Ja! Gebruik **Azure AI Search** voor RAG (Retrieval Augmented Generation):

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

Bekijk de [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) sjabloon.
</details>

<details>
<summary><strong>Hoe beveilig ik AI-model endpoints?</strong></summary>

**Best Practices**:
1. Gebruik Managed Identity (geen API-sleutels)
2. Schakel Private Endpoints in
3. Configureer netwerkbeveiligingsgroepen
4. Implementeer rate limiting
5. Gebruik Azure Key Vault voor geheimen

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

## Community en ondersteuning

- **Microsoft Foundry Discord**: [#Azure-kanaal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues en discussies](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Officiële documentatie](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill op skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installeer Azure + Foundry agent skills in je editor met `npx skills add microsoft/github-copilot-for-azure`

---

**Hoofdstuknavigatie:**
- **📚 Cursus Home**: [AZD voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 2 - AI-First Ontwikkeling
- **⬅️ Vorig Hoofdstuk**: [Hoofdstuk 1: Jouw Eerste Project](../chapter-01-foundation/first-project.md)
- **➡️ Volgende**: [AI Agents](agents.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

**Hulp nodig?** Doe mee aan onze community-discussies of open een issue in de repository. De Azure AI + AZD community staat klaar om je te helpen slagen!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->