<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a284fb7fdbdf2f5d737de7d08f0ade9",
  "translation_date": "2025-09-12T21:44:40+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "nl"
}
-->
# Azure AI Foundry-integratie met AZD

**Vorige:** [Eerste Project](../getting-started/first-project.md) | **Volgende:** [AI Model Deployment](ai-model-deployment.md)

## Overzicht

Deze handleiding laat zien hoe je Azure AI Foundry-services kunt integreren met Azure Developer CLI (AZD) voor gestroomlijnde AI-applicatiedeployments. Azure AI Foundry biedt een uitgebreid platform voor het bouwen, implementeren en beheren van AI-applicaties, terwijl AZD het infrastructuur- en implementatieproces vereenvoudigt.

## Wat is Azure AI Foundry?

Azure AI Foundry is Microsofts geïntegreerde platform voor AI-ontwikkeling dat het volgende omvat:

- **Modelcatalogus**: Toegang tot geavanceerde AI-modellen
- **Prompt Flow**: Visuele ontwerper voor AI-workflows
- **AI Foundry Portal**: Geïntegreerde ontwikkelomgeving voor AI-applicaties
- **Implementatieopties**: Meerdere hosting- en schaalopties
- **Veiligheid en beveiliging**: Ingebouwde functies voor verantwoord gebruik van AI

## AZD + Azure AI Foundry: Samen sterker

| Functie | Azure AI Foundry | Voordeel van AZD-integratie |
|---------|------------------|----------------------------|
| **Modelimplementatie** | Handmatige implementatie via portal | Geautomatiseerde, herhaalbare implementaties |
| **Infrastructuur** | Klik-en-implementatie | Infrastructure as Code (Bicep) |
| **Omgevingsbeheer** | Focus op één omgeving | Multi-omgeving (dev/staging/prod) |
| **CI/CD-integratie** | Beperkt | Native ondersteuning voor GitHub Actions |
| **Kostenbeheer** | Basis monitoring | Omgevingsspecifieke kostenoptimalisatie |

## Vereisten

- Azure-abonnement met de juiste machtigingen
- Azure Developer CLI geïnstalleerd
- Toegang tot Azure OpenAI-services
- Basiskennis van Azure AI Foundry

## Kernintegratiepatronen

### Patroon 1: Azure OpenAI-integratie

**Gebruiksscenario**: Chatapplicaties implementeren met Azure OpenAI-modellen

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
// Azure OpenAI Account
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

**Gebruiksscenario**: Retrieval-augmented generation (RAG)-applicaties implementeren

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

### Patroon 3: Document Intelligence-integratie

**Gebruiksscenario**: Documentverwerkings- en analyseworkflows

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

### Instellen van omgevingsvariabelen

**Productieconfiguratie:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

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

### Implementatie met één opdracht

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### Omgevingsspecifieke implementaties

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

## Monitoring en observatie

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

## 🔐 Beveiligingsrichtlijnen

### Configuratie van Managed Identity

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

### Configuratie voor autoscaling

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

## Veelvoorkomende problemen oplossen

### Probleem 1: OpenAI-quota overschreden

**Symptomen:**
- Implementatie mislukt met quota-fouten
- 429-fouten in applicatielogs

**Oplossingen:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity temporarily
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Probleem 2: Authenticatiefouten

**Symptomen:**
- 401/403-fouten bij het aanroepen van AI-services
- "Toegang geweigerd"-meldingen

**Oplossingen:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Probleem 3: Problemen met modelimplementatie

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

### Basis chatapplicatie

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Cognitive Search + App Service

**Snelle start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Documentverwerkingspipeline

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Services**: Document Intelligence + Storage + Functions

**Snelle start**:
```bash
azd init --template ai-document-processing
azd up
```

### Enterprise Chat met RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Snelle start**:
```bash
azd init --template contoso-chat
azd up
```

## Volgende stappen

1. **Probeer de voorbeelden**: Begin met een vooraf gebouwd template dat past bij jouw gebruiksscenario
2. **Pas aan voor jouw behoeften**: Wijzig de infrastructuur en applicatiecode
3. **Voeg monitoring toe**: Implementeer uitgebreide observatie
4. **Optimaliseer kosten**: Stem configuraties af op jouw budget
5. **Beveilig je implementatie**: Implementeer beveiligingspatronen voor ondernemingen
6. **Schaal naar productie**: Voeg multi-regio en hoge beschikbaarheidsfuncties toe

## Community en ondersteuning

- **Azure AI Foundry Discord**: [#Azure kanaal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues en discussies](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Officiële documentatie](https://learn.microsoft.com/azure/ai-studio/)

---

**Vorige:** [Eerste Project](../getting-started/first-project.md) | **Volgende:** [AI Model Deployment](ai-model-deployment.md)

**Hulp nodig?** Doe mee aan onze communitydiscussies of open een issue in de repository. De Azure AI + AZD-community staat klaar om je te helpen slagen!

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in zijn oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.