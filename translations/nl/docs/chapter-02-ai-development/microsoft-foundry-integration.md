# Microsoft Foundry Integratie met AZD

**Hoofdstuknavigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 2 - AI-first ontwikkeling
- **⬅️ Vorig Hoofdstuk**: [Hoofdstuk 1: Je Eerste Project](../chapter-01-foundation/first-project.md)
- **➡️ Volgende**: [AI Modelimplementatie](ai-model-deployment.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

## Overzicht

Deze gids toont hoe je Microsoft Foundry-services integreert met Azure Developer CLI (AZD) voor gestroomlijnde AI-applicatie-implementaties. Microsoft Foundry biedt een uitgebreid platform voor het bouwen, implementeren en beheren van AI-toepassingen, terwijl AZD het infrastructuur- en implementatieproces vereenvoudigt.

## Wat is Microsoft Foundry?

Microsoft Foundry is het uniforme platform van Microsoft voor AI-ontwikkeling dat omvat:

- **Model Catalog**: Toegang tot state-of-the-art AI-modellen
- **Prompt Flow**: Visuele ontwerper voor AI-workflows
- **Microsoft Foundry Portal**: Geïntegreerde ontwikkelomgeving voor AI-toepassingen
- **Deployment Options**: Meerdere hosting- en schaalopties
- **Safety and Security**: Ingebouwde verantwoordelijk AI-functionaliteiten

## AZD + Microsoft Foundry: Beter Samen

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Vereisten

- Azure-abonnement met de juiste machtigingen
- Azure Developer CLI geïnstalleerd
- Toegang tot Microsoft Foundry Models-services
- Basisbekendheid met Microsoft Foundry

## Kernintegratiepatronen

### Patroon 1: Integratie van Microsoft Foundry Models

**Gebruiksscenario**: Implementeer chatapplicaties met Microsoft Foundry Models-modellen

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

### Patroon 2: AI Search + RAG-integratie

**Gebruiksscenario**: Implementeer retrieval-augmented generation (RAG)-toepassingen

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

### Patroon 3: Documentintelligentie-integratie

**Gebruiksscenario**: Documentverwerking en analysetaken

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

**Productieconfiguratie:**
```bash
# Kern-AI-diensten
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modelconfiguraties
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Prestatie-instellingen
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Ontwikkelconfiguratie:**
```bash
# Kostengeoptimaliseerde instellingen voor ontwikkeling
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Gratis laag
```

### Veilige configuratie met Key Vault

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

### AZD-extensies voor Foundry

AZD biedt extensies die AI-specifieke mogelijkheden toevoegen voor het werken met Microsoft Foundry-services:

```bash
# Installeer de Foundry agents-extensie
azd extension install azure.ai.agents

# Installeer de fine-tuning-extensie
azd extension install azure.ai.finetune

# Installeer de extensie voor aangepaste modellen
azd extension install azure.ai.models

# Toon geïnstalleerde extensies
azd extension list
```

### Agent-eerst implementatie met `azd ai`

Als je een agent-manifest hebt, gebruik `azd ai agent init` om een project te scaffolden dat gekoppeld is aan Foundry Agent Service:

```bash
# Initialiseer vanuit een agentmanifest
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Rol uit naar Azure
azd up
```

Zie [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) voor de volledige opdrachtreferentie en flags.

### Implementatie met één commando

```bash
# Alles met één commando uitrollen
azd up

# Of stapsgewijs uitrollen
azd provision  # Alleen infrastructuur
azd deploy     # Alleen applicatie
```

### Omgevingsspecifieke implementaties

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

## Monitoring en observeerbaarheid

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

### Kostenbewaking

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

## 🔐 Beste beveiligingspraktijken

### Configuratie van beheerde identiteit

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

## Prestatie-optimalisatie

### Cachingstrategieën

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

### Autoscaling-configuratie

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

## Probleemoplossing van veelvoorkomende problemen

### Probleem 1: OpenAI-quota overschreden

**Symptomen:**
- Implementatie mislukt door quota-fouten
- 429-fouten in applicatielogs

**Oplossingen:**
```bash
# Controleer huidig quotagebruik
az cognitiveservices usage list --location eastus

# Probeer een andere regio
azd env set AZURE_LOCATION westus2
azd up

# Verminder tijdelijk de capaciteit
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Probleem 2: Authenticatiefouten

**Symptomen:**
- 401/403-fouten bij het aanroepen van AI-services
- "Toegang geweigerd"-meldingen

**Oplossingen:**
```bash
# Controleer roltoewijzingen
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Controleer configuratie van de beheerde identiteit
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Controleer toegang tot Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Probleem 3: Problemen bij modelimplementatie

**Symptomen:**
- Modellen niet beschikbaar in de implementatie
- Specifieke modelversies falen

**Oplossingen:**
```bash
# Lijst beschikbare modellen per regio
az cognitiveservices model list --location eastus

# Werk modelversie bij in bicep-template
# Controleer de capaciteitsvereisten van het model
```

## Voorbeeldsjablonen

### RAG-chatapplicatie (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Diensten**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beschrijving**: De populairste Azure AI-sample — een productieklare RAG-chatapp die je vragen over je eigen documenten laat stellen. Gebruikt GPT-4.1-mini voor chat, text-embedding-ada-002 voor embeddings en Azure AI Search voor ophalen. Ondersteunt multimodale documenten, spraakinvoer/-uitvoer, Microsoft Entra-authenticatie en Application Insights-tracing.

**Snelstart**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG-chatapplicatie (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Diensten**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beschrijving**: De .NET/C#-tegenhanger van de Python RAG-chat-sample. Gebouwd met ASP.NET Core Minimal API en Blazor WebAssembly-frontend. Inclusief spraakchat, GPT-4o-mini vision-ondersteuning en een companion .NET MAUI Blazor Hybrid desktop/mobile client.

**Snelstart**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG-chatapplicatie (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Diensten**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beschrijving**: Java-versie van de RAG-chat-sample die Langchain4J gebruikt voor AI-orchestratie. Ondersteunt microservice event-driven architectuur, meerdere zoekstrategieën (tekst, vector, hybride), documentupload met Azure Document Intelligence en implementatie op Azure Container Apps of Azure Kubernetes Service.

**Snelstart**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot met Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Diensten**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beschrijving**: End-to-end retail RAG-copilot die Azure AI Foundry en Prompty gebruikt. Een Contoso Outdoor retailer-chatbot die antwoorden baseert op productcatalogus- en klantordergegevens. Demonstreert de volledige GenAIOps-workflow — prototype met Prompty, evalueer met AI-ondersteunde evaluators en implementeer via AZD naar Container Apps.

**Snelstart**:
```bash
azd init --template contoso-chat
azd up
```

### Multi-agentapplicatie voor creatief schrijven

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Diensten**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beschrijving**: Multi-agent-sample die AI-agentorchestratie met Prompty demonstreert. Gebruikt een onderzoeksagent (Bing Grounding in Azure AI Agent Service), een productagent (Azure AI Search), een schrijversagent en een redacteur-agent om gezamenlijk goed onderzochte artikelen te produceren. Inclusief CI/CD met evaluatie in GitHub Actions.

**Snelstart**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverloze RAG-chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Diensten**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB voor NoSQL + LangChain.js

**Beschrijving**: Volledig serverloze RAG-chatbot met LangChain.js, waarbij Azure Functions de API verzorgt en Azure Static Web Apps de hosting. Gebruikt Azure Cosmos DB als zowel vector store als chatgeschiedenis-database. Ondersteunt lokale ontwikkeling met Ollama voor kosteloos testen.

**Snelstart**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat met uw gegevens Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Diensten**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Beschrijving**: Enterprise-grade RAG solution accelerator met admin-portal voor documentupload/-beheer, meerdere orchestrator-opties (Semantic Kernel, LangChain, Prompt Flow), spraak-naar-tekst, Microsoft Teams-integratie en keuze tussen PostgreSQL of Cosmos DB als backend. Ontworpen als een aanpasbaar startpunt voor productie-RAG-scenario's.

**Snelstart**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-agent MCP-orchestratie

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Diensten**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP-servers (.NET, Python, Java, TypeScript)

**Beschrijving**: Referentieapplicatie voor multi-agent AI-orchestratie met drie frameworks (LangChain.js, LlamaIndex.TS en Microsoft Agent Framework). Kenmerkt MCP (Model Context Protocol)-servers in vier talen die worden geïmplementeerd als serverloze Azure Container Apps met OpenTelemetry-monitoring.

**Snelstart**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Diensten**: Azure AI Services + Azure OpenAI

**Beschrijving**: Minimale Bicep-sjabloon die Azure AI-services implementeert met geconfigureerde machine learning-modellen. Een lichtgewicht startpunt wanneer je alleen de Azure AI-infrastructuur nodig hebt zonder volledige applicatiestack.

**Snelstart**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Bekijk meer sjablonen**: Bezoek de [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) voor meer dan 80 AI-specifieke AZD-sjablonen in verschillende talen en scenario's.

## Volgende stappen

1. **Probeer de voorbeelden**: Begin met een vooraf gebouwd sjabloon dat bij je use case past
2. **Pas aan naar je behoeften**: Wijzig de infrastructuur en applicatiecode
3. **Voeg monitoring toe**: Implementeer uitgebreide observeerbaarheid
4. **Optimaliseer kosten**: Fijn afstemmen van configuraties voor je budget
5. **Beveilig je implementatie**: Implementeer enterprise-beveiligingspatronen
6. **Schaal naar productie**: Voeg multi-regio en hoge beschikbaarheidsfuncties toe

## 🎯 Praktijkoefeningen

### Oefening 1: Implementeer Microsoft Foundry Models-chatapp (30 minuten)
**Doel**: Implementeer en test een productieklare AI-chatapplicatie

```bash
# Initialiseer sjabloon
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Stel omgevingsvariabelen in
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Implementeer
azd up

# Test de applicatie
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Bewaak AI-operaties
azd monitor

# Ruim op
azd down --force --purge
```

**Succescriteria:**
- [ ] Implementatie voltooit zonder quota-fouten
- [ ] Toegang tot de chatinterface in de browser mogelijk
- [ ] Vragen kunnen stellen en AI-gestuurde antwoorden ontvangen
- [ ] Application Insights toont telemetriedata
- [ ] Resources succesvol opgeruimd

**Geschatte kosten**: $5-10 voor 30 minuten testen

### Oefening 2: Configureer multi-modelimplementatie (45 minuten)
**Doel**: Implementeer meerdere AI-modellen met verschillende configuraties

```bash
# Maak een aangepaste Bicep-configuratie
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

# Implementeer en verifieer
azd provision
azd show
```

**Succescriteria:**
- [ ] Meerdere modellen succesvol geïmplementeerd
- [ ] Verschillende capaciteitsinstellingen toegepast
- [ ] Modellen toegankelijk via API
- [ ] Beide modellen kunnen vanuit de applicatie worden aangeroepen

### Oefening 3: Implementeer kostenbewaking (20 minuten)
**Doel**: Stel budgetalerts en kostentracking in

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
- [ ] Budgetalert aangemaakt in Azure
- [ ] E-mailmeldingen geconfigureerd
- [ ] Kostengegevens zichtbaar in Azure Portal
- [ ] Budgetdrempels passend ingesteld

## 💡 Veelgestelde vragen

<details>
<summary><strong>Hoe kan ik de kosten van Microsoft Foundry Models tijdens ontwikkeling verlagen?</strong></summary>

1. **Gebruik de gratis tier**: Microsoft Foundry Models biedt 50.000 tokens/maand gratis
2. **Verminder capaciteit**: Stel capaciteit in op 10 TPM in plaats van 30+ voor ontwikkeling
3. **Gebruik azd down**: Dealloceer resources wanneer je niet actief ontwikkelt
4. **Cache antwoorden**: Implementeer Redis-cache voor herhaalde queries
5. **Gebruik prompt-engineering**: Verminder tokengebruik met efficiënte prompts

```bash
# Ontwikkelconfiguratie
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Wat is het verschil tussen Microsoft Foundry Models en de OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Enterprise-beveiliging en compliance
- Integratie met privé-netwerken
- SLA-garanties
- Authenticatie met beheerde identiteit
- Hogere quota beschikbaar

**OpenAI API**:
- Snellere toegang tot nieuwe modellen
- Eenvoudigere setup
- Lagere drempel om te beginnen
- Alleen openbaar internet

Voor productie-apps wordt **Microsoft Foundry Models aanbevolen**.
</details>

<details>
<summary><strong>Hoe ga ik om met quota-overschrijdingsfouten van Microsoft Foundry Models?</strong></summary>

```bash
# Controleer de huidige quota
az cognitiveservices usage list --location eastus2

# Probeer een andere regio
azd env set AZURE_LOCATION westus2
azd up

# Verminder tijdelijk de capaciteit
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Vraag verhoging van het quotum aan
# Ga naar de Azure-portal > Quota's > Vraag om verhoging aan
```
</details>

<details>
<summary><strong>Kan ik mijn eigen gegevens gebruiken met Microsoft Foundry Models?</strong></summary>

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

Bekijk de [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) sjabloon.
</details>

<details>
<summary><strong>Hoe beveilig ik AI-modelendpunten?</strong></summary>

**Beste Praktijken**:
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

## Community en Ondersteuning

- **Microsoft Foundry Discord**: [#Azure-kanaal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues en discussies](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Officiële documentatie](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry-skill op skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installeer Azure + Foundry agent skills in je editor met `npx skills add microsoft/github-copilot-for-azure`

---

**Hoofdstuknavigatie:**
- **📚 Cursus Startpagina**: [AZD For Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Chapter 2 - AI-First Development
- **⬅️ Vorig Hoofdstuk**: [Hoofdstuk 1: Je Eerste Project](../chapter-01-foundation/first-project.md)
- **➡️ Volgende**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

**Hulp nodig?** Doe mee aan onze communitydiscussies of open een issue in de repository. De Azure AI + AZD-community is hier om je te helpen slagen!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vrijwaring**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, houd er rekening mee dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->