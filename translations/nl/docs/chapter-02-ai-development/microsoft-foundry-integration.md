# Microsoft Foundry-integratie met AZD

**Hoofdstuknavigatie:**
- **📚 Cursus Thuis**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 2 - AI-First Ontwikkeling
- **⬅️ Vorig Hoofdstuk**: [Hoofdstuk 1: Je Eerste Project](../chapter-01-foundation/first-project.md)
- **➡️ Volgend**: [AI Model Implementatie](ai-model-deployment.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

## Overzicht

Deze gids laat zien hoe je Microsoft Foundry-services integreert met Azure Developer CLI (AZD) voor gestroomlijnde AI-applicatie-implementaties. Microsoft Foundry biedt een uitgebreid platform voor het bouwen, implementeren en beheren van AI-toepassingen, terwijl AZD het infrastructuur- en implementatieproces vereenvoudigt.

## Wat is Microsoft Foundry?

Microsoft Foundry is Microsoft's uniforme platform voor AI-ontwikkeling dat het volgende omvat:

- **Modelcatalogus**: Toegang tot state-of-the-art AI-modellen
- **Prompt Flow**: Visuele ontwerper voor AI-workflows
- **Microsoft Foundry Portal**: Geïntegreerde ontwikkelomgeving voor AI-toepassingen
- **Implementatieopties**: Meerdere hosting- en schaalopties
- **Veiligheid en Beveiliging**: Ingebouwde verantwoordelijke AI-functies

## AZD + Microsoft Foundry: Beter Samen

| Kenmerk | Microsoft Foundry | Voordeel AZD Integratie |
|---------|-----------------|------------------------|
| **Model Implementatie** | Handmatige portal-implementatie | Geautomatiseerde, herhaalbare implementaties |
| **Infrastructuur** | Klik-door provisioning | Infrastructuur als Code (Bicep) |
| **Omgevingsbeheer** | Gericht op één omgeving | Meerdere omgevingen (dev/staging/prod) |
| **CI/CD Integratie** | Beperkt | Native GitHub Actions ondersteuning |
| **Kostenbeheer** | Basis monitoring | Omgevingsspecifieke kostenoptimalisatie |

## Vereisten

- Azure-abonnement met juiste machtigingen
- Azure Developer CLI geïnstalleerd
- Toegang tot Microsoft Foundry Models-services
- Basiskennis van Microsoft Foundry

> **Huidige AZD baseline:** Deze voorbeelden zijn bekeken met `azd` `1.27.1`. Voor de AI-agent workflow, gebruik de huidige preview-extension release en controleer de geïnstalleerde versie voordat je begint.

## Kernintegratiepatronen

### Patroon 1: Microsoft Foundry Models Integratie

**Gebruikssituatie**: Implementeer chattoepassingen met Microsoft Foundry Models-modellen

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

### Patroon 2: AI Search + RAG Integratie

**Gebruikssituatie**: Implementeer retrieval-augmented generation (RAG) toepassingen

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

### Patroon 3: Document Intelligence Integratie

**Gebruikssituatie**: Documentverwerking en analyse workflows

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

### Instellen van Omgevingsvariabelen

**Productieconfiguratie:**
```bash
# Kern AI-diensten
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modelconfiguraties
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Prestatie-instellingen
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Ontwikkelconfiguratie:**
```bash
# Kosten-geoptimaliseerde instellingen voor ontwikkeling
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Gratis laag
```

### Beveiligde Configuratie met Key Vault

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

## Implementatieworkflows

### AZD Extensies voor Foundry

AZD biedt extensies die AI-specifieke mogelijkheden toevoegen voor werken met Microsoft Foundry-services:

```bash
# Installeer de Foundry agenten extensie
azd extension install azure.ai.agents

# Installeer de fine-tuning extensie
azd extension install azure.ai.finetune

# Installeer de aangepaste modellen extensie
azd extension install azure.ai.models

# Toon geïnstalleerde extensies
azd extension list --installed

# Inspecteer de momenteel geïnstalleerde agent extensie versie
azd extension show azure.ai.agents
```

De AI-extensies ontwikkelen zich nog snel in preview. Als een commando anders werkt dan hier getoond, upgrade dan de relevante extensie voordat je het project zelf gaat troubleshooten.

### Agent-First Implementatie met `azd ai`

Als je een agent-manifest hebt, gebruik `azd ai agent init` om een project te scaffolden dat gekoppeld is aan Foundry Agent Service:

```bash
# Initialiseren vanuit een agent manifest
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Implementeren naar Azure
azd up
```

Recente preview-releases van `azure.ai.agents` hebben ook template-gebaseerde initialisatie-ondersteuning toegevoegd voor `azd ai agent init`. Als je nieuwere agentvoorbeelden volgt, controleer dan de extensie-hulp voor de exacte beschikbare flags in jouw geïnstalleerde versie.

Zie [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) voor de volledige commando-referentie en flags.

### Implementatie met Eén Commando

```bash
# Alles implementeren met één opdracht
azd up

# Of incrementeel implementeren
azd provision  # Alleen infrastructuur
azd deploy     # Alleen applicatie

# Voor langdurige AI-app-implementaties in azd 1.23.11+
azd deploy --timeout 1800
```

### Omgevingsspecifieke Implementaties

```bash
# Ontwikkelomgeving
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Productieomgeving
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitoring en Observeerbaarheid

### Application Insights Integratie

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

### Kostenmonitoring

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

## 🔐 Beveiligingsbest Practices

### Geconfigureerde Managed Identity

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

### Cachestrategieën

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

### Auto-scaling Configuratie

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

## Veelvoorkomende Problemen Oplossen

### Probleem 1: OpenAI Quota Overschreden

**Symptomen:**
- Implementatie mislukt met quota-fouten
- 429 fouten in applicatielogs

**Oplossingen:**
```bash
# Controleer huidig quotagebruik
az cognitiveservices usage list --location eastus

# Probeer een andere regio
azd env set AZURE_LOCATION westus2
azd up

# Verminder tijdelijke capaciteit
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Probleem 2: Authenticatiefouten

**Symptomen:**
- 401/403 fouten bij het aanroepen van AI-services
- "Toegang geweigerd" meldingen

**Oplossingen:**
```bash
# Verifieer roltoewijzingen
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Controleer configuratie van beheerde identiteit
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Valideer toegang tot Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Probleem 3: Problemen bij Modelimplementaties

**Symptomen:**
- Modellen niet beschikbaar in implementatie
- Specifieke modelversies falen

**Oplossingen:**
```bash
# Lijst beschikbare modellen per regio
az cognitiveservices model list --location eastus

# Werk modelversie bij in bicep-sjabloon
# Controleer modelcapaciteitsvereisten
```

## Voorbeeld Sjablonen

### RAG Chat Applicatie (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beschrijving**: De populairste Azure AI voorbeeldapplicatie — een productieklare RAG-chatapp die je vragen laat stellen over je eigen documenten. Gebruikt GPT-4.1-mini voor chat, text-embedding-3-large voor embeddings en Azure AI Search voor retrieval. Ondersteunt multimodale documenten, spraak in/uit, Microsoft Entra authenticatie en Application Insights tracing.

**Snelle Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Applicatie (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beschrijving**: Het .NET/C# equivalent van de Python RAG chat voorbeeldapplicatie. Gebouwd met ASP.NET Core Minimal API en Blazor WebAssembly frontend. Inclusief spraakchat, GPT-4o-mini visuele ondersteuning en een companion .NET MAUI Blazor Hybrid desktop/mobiele client.

**Snelle Start**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Applicatie (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beschrijving**: Java-versie van de RAG chat voorbeeldapplicatie met gebruik van Langchain4J voor AI-orchestration. Ondersteunt microservice event-driven architectuur, meerdere zoekstrategieën (tekst, vector, hybride), documentupload met Azure Document Intelligence en implementatie op zowel Azure Container Apps als Azure Kubernetes Service.

**Snelle Start**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot met Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beschrijving**: End-to-end retail RAG copilot met Microsoft Foundry en Prompty. Een Contoso Outdoor retailer chatbot die antwoorden baseert op productcatalogus en klantordergegevens. Demonstreert de volledige GenAIOps workflow — prototypen met Prompty, evalueren met AI-ondersteunde evaluators en implementeren via AZD in Container Apps.

**Snelle Start**:
```bash
azd init --template contoso-chat
azd up
```

### Creatieve Schrijven Multi-Agent Applicatie

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beschrijving**: Multi-agent voorbeeld dat AI agent-orchestratie met Prompty demonstreert. Gebruikt een onderzoeksagent (Bing Grounding in Azure AI Agent Service), een productagent (Azure AI Search), een schrijver-agent en een redacteur-agent om samen goed onderzochte artikelen te produceren. Inclusief CI/CD met evaluatie in GitHub Actions.

**Snelle Start**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB voor NoSQL + LangChain.js

**Beschrijving**: Volledig serverless RAG-chatbot met LangChain.js en Azure Functions voor de API en Azure Static Web Apps voor hosting. Gebruikt Azure Cosmos DB als zowel vectorstore als chatgeschiedenisdatabase. Ondersteunt lokale ontwikkeling met Ollama voor kostenloze tests.

**Snelle Start**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat met je Data Oplossingsversneller

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Beschrijving**: Enterprise-grade RAG-oplossingsversneller met beheerdersportaal voor documentupload/-beheer, meerdere orkestratoropties (Semantic Kernel, LangChain, Prompt Flow), spraak-naar-tekst, Microsoft Teams-integratie en keuze uit PostgreSQL of Cosmos DB als backend. Ontworpen als aanpasbaar startpunt voor productie-RAG-scenario's.

**Snelle Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Reisagenten — Multi-Agent MCP Orkestratie

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Beschrijving**: Referentieapplicatie voor multi-agent AI-orkestratie met drie frameworks (LangChain.js, LlamaIndex.TS en Microsoft Agent Framework). Kenmerkt MCP (Model Context Protocol) servers in vier talen die als serverless Azure Container Apps zijn gedeployed met OpenTelemetry monitoring.

**Snelle Start**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Beschrijving**: Minimale Bicep-sjabloon die Azure AI-services uitrolt met geconfigureerde machine learning modellen. Een lichte startpunt wanneer je alleen de Azure AI-infrastructuur nodig hebt zonder een complete applicatiestack.

**Snelle Start**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Bekijk meer sjablonen**: Bezoek de [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) voor 80+ AI-specifieke AZD-sjablonen in verschillende talen en scenario's.

## Volgende Stappen

1. **Probeer de Voorbeelden**: Begin met een vooraf gebouwd sjabloon dat bij je gebruikssituatie past
2. **Pas Aan voor Je Behoeften**: Wijzig de infrastructuur- en applicatiecode
3. **Voeg Monitoring Toe**: Implementeer uitgebreide observeerbaarheid
4. **Optimaliseer Kosten**: Stel configuraties af op je budget
5. **Beveilig Je Implementatie**: Pas enterprise beveiligingspatronen toe
6. **Schaal naar Productie**: Voeg multi-regio en hoge beschikbaarheid functies toe

## 🎯 Praktijkopdrachten

### Oefening 1: Implementeer Microsoft Foundry Models Chat App (30 minuten)
**Doel**: Implementeer en test een productieklare AI-chatapplicatie

```bash
# Sjabloon initialiseren
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Stel omgevingsvariabelen in
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Uitrollen
azd up

# Test de applicatie
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Houd AI-operaties in de gaten
azd monitor

# Opruimen
azd down --force --purge
```

**Succescriteria:**
- [ ] Implementatie voltooid zonder quota-fouten
- [ ] Toegang tot chatinterface in browser
- [ ] Vragen kunnen stellen en AI-ondersteunde antwoorden ontvangen
- [ ] Application Insights toont telemetriegegevens
- [ ] Bronnen succesvol opgeruimd

**Geschatte Kosten**: $5-10 voor 30 minuten testen

### Oefening 2: Configureer Multi-Model Implementatie (45 minuten)
**Doel**: Implementeer meerdere AI-modellen met verschillende configuraties

```bash
# Maak aangepaste Bicep-configuratie
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

# Implementeren en verifiëren
azd provision
azd show
```

**Succescriteria:**
- [ ] Meerdere modellen succesvol geïmplementeerd
- [ ] Verschillende capaciteitsinstellingen toegepast
- [ ] Modellen toegankelijk via API
- [ ] Beide modellen kunnen worden aangeroepen vanuit de applicatie

### Oefening 3: Implementeer Kostenmonitoring (20 minuten)
**Doel**: Stel budgetwaarschuwingen en kostentracking in

```bash
# Voeg budgetwaarschuwing toe aan Bicep
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

# Implementeer budgetwaarschuwing
azd provision

# Controleer huidige kosten
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Succescriteria:**
- [ ] Budgetwaarschuwing aangemaakt in Azure
- [ ] E-mail notificaties geconfigureerd
- [ ] Kan kosteninformatie bekijken in Azure Portal
- [ ] Budgetdrempels passend ingesteld

## 💡 Veelgestelde Vragen

<details>
<summary><strong>Hoe kan ik Microsoft Foundry Models-kosten verminderen tijdens ontwikkeling?</strong></summary>

1. **Gebruik de Gratis Laag**: Microsoft Foundry Models biedt 50.000 tokens/maand gratis
2. **Verminder Capaciteit**: Stel capaciteit in op 10 TPM in plaats van 30+ voor dev
3. **Gebruik azd down**: Dealloceer bronnen wanneer je niet actief ontwikkelt
4. **Cache Reacties**: Implementeer Redis-cache voor herhaalde queries
5. **Gebruik Prompt Engineering**: Verminder tokengebruik met efficiënte prompts


```bash
# Ontwikkelingsconfiguratie
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Wat is het verschil tussen Microsoft Foundry Models en OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Enterprise beveiliging en naleving
- Integratie met privé-netwerk
- SLA garanties
- Managed identity authenticatie
- Hogere quota beschikbaar

**OpenAI API**:
- Snellere toegang tot nieuwe modellen
- Eenvoudigere setup
- Lagere instapdrempel
- Alleen openbare internetverbinding

Voor productietoepassingen wordt **Microsoft Foundry Models aanbevolen**.
</details>

<details>
<summary><strong>Hoe ga ik om met Microsoft Foundry Models quota overschrijdingsfouten?</strong></summary>

```bash
# Controleer huidige quotum
az cognitiveservices usage list --location eastus2

# Probeer een andere regio
azd env set AZURE_LOCATION westus2
azd up

# Verminder tijdelijk capaciteit
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Vraag quotumverhoging aan
# Ga naar Azure Portal > Quota's > Verhoging aanvragen
```
</details>

<details>
<summary><strong>Kan ik mijn eigen data gebruiken met Microsoft Foundry Models?</strong></summary>

Ja! Gebruik **Azure AI Search** voor RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Zie de [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template.
</details>

<details>
<summary><strong>Hoe beveilig ik AI model endpoints?</strong></summary>

**Beste Praktijken**:
1. Gebruik Managed Identity (geen API-sleutels)
2. Schakel Private Endpoints in
3. Configureer netwerkgroepen voor beveiliging
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

## Gemeenschap en Ondersteuning

- **Microsoft Foundry Discord**: [#Azure kanaal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues en discussies](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Officiële documentatie](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill op skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installeer Azure + Foundry agent skills in je editor met `npx skills add microsoft/github-copilot-for-azure`

---

**Hoofdstuk Navigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 2 - AI-First Ontwikkeling
- **⬅️ Vorig Hoofdstuk**: [Hoofdstuk 1: Je Eerste Project](../chapter-01-foundation/first-project.md)
- **➡️ Volgend**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

**Hulp Nodig?** Doe mee aan onze community discussies of open een issue in de repository. De Azure AI + AZD community is hier om jou te helpen slagen!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->