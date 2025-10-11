<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-10-11T16:02:25+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "ta"
}
-->
# Azure AI Foundry AZD உடன் ஒருங்கிணைப்பு

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD ஆரம்பக்காரர்களுக்காக](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மை மேம்பாடு
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 1: உங்கள் முதல் திட்டம்](../getting-started/first-project.md)
- **➡️ அடுத்தது**: [AI மாடல் பிரசுரம்](ai-model-deployment.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../getting-started/configuration.md)

## கண்ணோட்டம்

இந்த வழிகாட்டி Azure AI Foundry சேவைகளை Azure Developer CLI (AZD) உடன் ஒருங்கிணைத்து AI பயன்பாடுகளை எளிதாக பிரசுரம் செய்யும் முறையை விளக்குகிறது. Azure AI Foundry AI பயன்பாடுகளை உருவாக்க, பிரசுரம் செய்ய மற்றும் மேலாண்மை செய்ய விரிவான தளத்தை வழங்குகிறது, அதேசமயம் AZD உள்கட்டமைப்பு மற்றும் பிரசுர செயல்முறையை எளிமைப்படுத்துகிறது.

## Azure AI Foundry என்றால் என்ன?

Azure AI Foundry என்பது Microsoft-இன் AI மேம்பாட்டுக்கான ஒருங்கிணைந்த தளம் ஆகும், இது கீழ்கண்டவற்றை உள்ளடக்கியது:

- **மாடல் பட்டியல்**: முன்னணி AI மாடல்களுக்கு அணுகல்
- **Prompt Flow**: AI வேலைப்பாடுகளுக்கான காட்சி வடிவமைப்பாளர்
- **AI Foundry Portal**: AI பயன்பாடுகளுக்கான ஒருங்கிணைந்த மேம்பாட்டு சூழல்
- **பிரசுர விருப்பங்கள்**: பல ஹோஸ்டிங் மற்றும் அளவீட்டு விருப்பங்கள்
- **பாதுகாப்பு மற்றும் பாதுகாப்பு**: பொறுப்பான AI அம்சங்கள் உட்பொதிக்கப்பட்டவை

## AZD + Azure AI Foundry: ஒன்றாக சிறந்தது

| அம்சம் | Azure AI Foundry | AZD ஒருங்கிணைப்பு நன்மை |
|-------|------------------|------------------------|
| **மாடல் பிரசுரம்** | கையேடு போர்டல் பிரசுரம் | தானியங்கி, மீண்டும் செய்யக்கூடிய பிரசுரங்கள் |
| **உள்கட்டமைப்பு** | கிளிக்-த்ரூ வழங்கல் | Code (Bicep) ஆக உள்கட்டமைப்பு |
| **சூழல் மேலாண்மை** | ஒற்றை சூழல் கவனம் | பல சூழல் (மேம்பாடு/முன்னோட்டம்/தயாரிப்பு) |
| **CI/CD ஒருங்கிணைப்பு** | வரையறுக்கப்பட்டது | GitHub Actions-க்கு இயல்பான ஆதரவு |
| **செலவ மேலாண்மை** | அடிப்படை கண்காணிப்பு | சூழல்-குறிப்பிட்ட செலவினம் மேம்பாடு |

## முன்பை தேவைகள்

- சரியான அனுமதிகளுடன் Azure சந்தா
- Azure Developer CLI நிறுவப்பட்டுள்ளது
- Azure OpenAI சேவைகளுக்கு அணுகல்
- Azure AI Foundry பற்றிய அடிப்படை அறிமுகம்

## முக்கிய ஒருங்கிணைப்பு முறை

### முறை 1: Azure OpenAI ஒருங்கிணைப்பு

**பயன்பாட்டு நிலை**: Azure OpenAI மாடல்களுடன் உரையாடல் பயன்பாடுகளை பிரசுரம் செய்யவும்

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

**உள்கட்டமைப்பு (main.bicep):**
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

### முறை 2: AI தேடல் + RAG ஒருங்கிணைப்பு

**பயன்பாட்டு நிலை**: Retrieval-Augmented Generation (RAG) பயன்பாடுகளை பிரசுரம் செய்யவும்

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

### முறை 3: ஆவண நுண்ணறிவு ஒருங்கிணைப்பு

**பயன்பாட்டு நிலை**: ஆவண செயலாக்கம் மற்றும் பகுப்பாய்வு வேலைப்பாடுகள்

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

## 🔧 கட்டமைப்பு முறைகள்

### சூழல் மாறிகள் அமைப்பு

**தயாரிப்பு கட்டமைப்பு:**
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

**மேம்பாட்டு கட்டமைப்பு:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Key Vault மூலம் பாதுகாப்பான கட்டமைப்பு

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

## பிரசுர வேலைப்பாடுகள்

### ஒற்றை கட்டளை பிரசுரம்

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### சூழல்-குறிப்பிட்ட பிரசுரங்கள்

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

## கண்காணிப்பு மற்றும் பார்வையிடல்

### Application Insights ஒருங்கிணைப்பு

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

### செலவ கண்காணிப்பு

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

## 🔐 பாதுகாப்பு சிறந்த நடைமுறைகள்

### மேலாண்மை அடையாள அமைப்பு

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

### நெட்வொர்க் பாதுகாப்பு

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

## செயல்திறன் மேம்பாடு

### கேஷிங் உத்திகள்

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

### தானியங்கி-அளவீட்டு அமைப்பு

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

## பொதுவான சிக்கல்களை தீர்க்குதல்

### சிக்கல் 1: OpenAI ஒதுக்கீடு மீறப்பட்டது

**அறிகுறிகள்:**
- ஒதுக்கீடு பிழைகளுடன் பிரசுரம் தோல்வி
- பயன்பாட்டு பதிவுகளில் 429 பிழைகள்

**தீர்வுகள்:**
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

### சிக்கல் 2: அங்கீகார தோல்விகள்

**அறிகுறிகள்:**
- AI சேவைகளை அழைக்கும் போது 401/403 பிழைகள்
- "அணுகல் மறுக்கப்பட்டது" செய்திகள்

**தீர்வுகள்:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### சிக்கல் 3: மாடல் பிரசுர சிக்கல்கள்

**அறிகுறிகள்:**
- பிரசுரத்தில் மாடல்கள் கிடைக்கவில்லை
- குறிப்பிட்ட மாடல் பதிப்புகள் தோல்வி

**தீர்வுகள்:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## உதாரண டெம்ப்ளேட்கள்

### அடிப்படை உரையாடல் பயன்பாடு

**களஞ்சியம்**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**சேவைகள்**: Azure OpenAI + Cognitive Search + App Service

**விரைவான தொடக்கம்**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### ஆவண செயலாக்க குழாய்

**களஞ்சியம்**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**சேவைகள்**: Document Intelligence + Storage + Functions

**விரைவான தொடக்கம்**:
```bash
azd init --template ai-document-processing
azd up
```

### நிறுவன உரையாடல் RAG உடன்

**களஞ்சியம்**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**சேவைகள்**: Azure OpenAI + Search + Container Apps + Cosmos DB

**விரைவான தொடக்கம்**:
```bash
azd init --template contoso-chat
azd up
```

## அடுத்த படிகள்

1. **உதாரணங்களை முயற்சிக்கவும்**: உங்கள் பயன்பாட்டு நிலைக்கு பொருந்தும் முன்பணியுடன் தொடங்கவும்
2. **உங்கள் தேவைகளுக்கு தனிப்பயனாக்கவும்**: உள்கட்டமைப்பு மற்றும் பயன்பாட்டு குறியீட்டை மாற்றவும்
3. **கண்காணிப்பை சேர்க்கவும்**: விரிவான பார்வையிடலை செயல்படுத்தவும்
4. **செலவினங்களை மேம்படுத்தவும்**: உங்கள் பட்ஜெட்டுக்கு பொருந்தும் கட்டமைப்புகளை சரிசெய்யவும்
5. **உங்கள் பிரசுரத்தை பாதுகாக்கவும்**: நிறுவன பாதுகாப்பு முறைகளை செயல்படுத்தவும்
6. **தயாரிப்புக்கு அளவீடு செய்யவும்**: பல பிராந்திய மற்றும் உயர் கிடைப்புத் தன்மைகளை சேர்க்கவும்

## சமூக மற்றும் ஆதரவு

- **Azure AI Foundry Discord**: [#Azure சேனல்](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [சிக்கல்கள் மற்றும் விவாதங்கள்](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [அதிகாரப்பூர்வ ஆவணங்கள்](https://learn.microsoft.com/azure/ai-studio/)

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD ஆரம்பக்காரர்களுக்காக](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மை மேம்பாடு
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 1: உங்கள் முதல் திட்டம்](../getting-started/first-project.md)
- **➡️ அடுத்தது**: [AI மாடல் பிரசுரம்](ai-model-deployment.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../getting-started/configuration.md)

**உதவி தேவைதா?** எங்கள் சமூக விவாதங்களில் சேரவும் அல்லது களஞ்சியத்தில் ஒரு சிக்கலைத் திறக்கவும். Azure AI + AZD சமூகத்தினர் உங்களை வெற்றி பெற உதவ தயாராக உள்ளனர்!

---

**குறிப்பு**:  
இந்த ஆவணம் [Co-op Translator](https://github.com/Azure/co-op-translator) என்ற AI மொழிபெயர்ப்பு சேவையை பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. எங்கள் தரச்சிறப்பிற்காக முயற்சி செய்தாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனத்தில் கொள்ளுங்கள். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.