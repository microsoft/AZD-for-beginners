# Microsoft Foundry ஐ AZD உடன் ஒருங்கிணைத்தல்

**Chapter Navigation:**
- **📚 Course Home**: [AZD தொடக்கர்களுக்காக](../../README.md)
- **📖 Current Chapter**: அத்தியாயம் 2 - AI-முதன்மை மேம்பாடு
- **⬅️ Previous Chapter**: [அத்தியாயம் 1: உங்கள் முதல் திட்டம்](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)

## கண்ணோட்டம்

இந்த வழிகாட்டி Microsoft Foundry சேவைகளை Azure Developer CLI (AZD) உடன் எவ்வாறு ஒருங்கிணைக்க மறைமுகமாக AI பயன்பாடு வெளியீடுகளை எளிதாக்குவது என்பதை விளக்குகிறது. Microsoft Foundry AI பயன்பாடுகளை கட்டமைக்க, வெளியிட மற்றும் நிர்வகிக்க ஒரு விருப்பமான தளத்தை வழங்குகிறது, மேலும் AZD அடித்தளம் மற்றும் வெளியீட்டு செயல்முறையை எளிமைப்படுத்துகிறது.

## Microsoft Foundry என்றால் என்ன?

Microsoft Foundry என்பது Microsoft இன் ஐக்கிய AI மேம்பாட்டு தளம் ஆகும், இதில் உள்ளவை:

- **மாடல் அடைவு**: முன்னேற்றமான AI மாடல்களுக்கு அணுகல்
- **Prompt Flow**: AI பணித்திட்டங்களுக்கான காட்சி வடிவமைப்பாளர்
- **Microsoft Foundry Portal**: AI பயன்பாடுகளுக்கான ஒருங்கிணைந்த மேம்பாட்டு சூழல்
- **வெளியீட்டு விருப்பங்கள்**: பல ஹோஸ்டிங் மற்றும் அளவீட்டு விருப்பங்கள்
- **பாதுகாப்பு மற்றும் பாதுகாப்பு**: உட்சேர்ந்த பொறுப்பான AI அம்சங்கள்

## AZD + Microsoft Foundry: ஒன்றாக சிறந்தது

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | கையேடு போர்டல் வெளியீடு | தானியங்கி, மீண்டும் பயன்படுத்தக்கூடிய வெளியீடுகள் |
| **Infrastructure** | கிளிக்-தொடரில் வழங்குதல் | Infrastructure as Code (Bicep) |
| **Environment Management** | ஒரே சுற்றுப்புற கவனம் | பல சுற்றுப்புறங்கள் (dev/staging/prod) |
| **CI/CD Integration** | குறைந்தது | மூல GitHub Actions ஆதரவு |
| **Cost Management** | அடிப்படை கண்காணிப்பு | சுற்றுப்புற-சார்ந்த செலவு 최க்கரம் |

## முன் நிபந்தனைகள்

- சரியான அனுமதிகளுடன் Azure சந்தா
- Azure Developer CLI நிறுவப்பட்டிருத்தல்
- Microsoft Foundry Models சேவைகளுக்கு அணுகல்
- Microsoft Foundry பற்றிய அடிப்படை பரிச்சயம்

## முக்கிய ஒருங்கிணைப்பு முறைப்பாடுகள்

### முறை 1: Microsoft Foundry Models ஒருங்கிணைப்பு

**பயன்பாட்டு வழக்கு**: Microsoft Foundry Models மாதிரிகளுடன் உரையாடல்த் பயன்பாடுகளை வெளியிடுதல்

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

**அடிப்படை அமைப்பு (main.bicep):**
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

### முறை 2: AI Search + RAG ஒருங்கிணைப்பு

**பயன்பாட்டு வழக்கு**: முன்னோக்கி-மேம்படுத்தப்பட்ட உருவாக்கம் (RAG) பயன்பாடுகளை வெளியிடுதல்

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

**பயன்பாட்டு வழக்கு**: ஆவண செயலாக்கம் மற்றும் பகுப்பாய்வு பணித் தளங்கள்

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

## 🔧 கட்டமைப்பு முறைப்பாடுகள்

### சுற்றுச்சூழல் மாறிலிகள் அமைப்புகள்

**உற்பத்தி கட்டமைப்பு:**
```bash
# முக்கிய செயற்கை நுண்ணறிவு சேவைகள்
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# மாதிரி கட்டமைப்புகள்
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# செயல்திறன் அமைப்புகள்
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**வளர்ச்சி கட்டமைப்பு:**
```bash
# வளர்ச்சிக்கான செலவு குறைத்துக்கொள்ள வடிவமைக்கப்பட்ட அமைப்புகள்
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # இலவச அடுக்கு
```

### Key Vault உடன் பாதுகாப்பான கட்டமைப்பு

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

## வெளியீட்டு பணித்திட்டங்கள்

### Foundry க்கான AZD விரிவாக்கங்கள்

AZD Microsoft Foundry சேவைகளுடன் பணியாற்ற AI-சார்ந்த திறன்களை சேர்க்கும் விரிவாக்கங்களை வழங்குகிறது:

```bash
# Foundry agents விரிவாக்கத்தை நிறுவவும்
azd extension install azure.ai.agents

# பைன்-டியூனிங் விரிவாக்கத்தை நிறுவவும்
azd extension install azure.ai.finetune

# தனிப்பயன் மாடல்கள் விரிவாக்கத்தை நிறுவவும்
azd extension install azure.ai.models

# நிறுவப்பட்ட விரிவாக்கங்களை பட்டியலிடவும்
azd extension list
```

### `azd ai` உடன் ஏஜென்ட்-முதன்மை வெளியீடு

உங்களிடம் ஏஜென்ட் manifest இருந்தால், Foundry Agent சேவைக்கு இணைக்கப்பட்ட ஒரு திட்டத்தை உருவாக்க `azd ai agent init` ஐ பயன்படுத்தவும்:

```bash
# ஏஜெண்ட் மானிபெஸ்டில் இருந்து துவக்கவும்
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure-க்கு அமைக்கவும்
azd up
```

முழு கட்டளை குறிப்புகள் மற்றும் கொடிகளுக்காக [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) ஐப் பார்க்கவும்.

### ஒரே கட்டளையால் வெளியீடு

```bash
# ஒரே கட்டளையால் அனைத்தையும் நடைமுறைப்படுத்தவும்
azd up

# அல்லது படிப்படியாக நடைமுறைப்படுத்தவும்
azd provision  # அடித்தள கட்டமைப்பு மட்டும்
azd deploy     # பயன்பாடு மட்டும்
```

### சுற்றுச்சூழல்-சார்ந்த வெளியீடுகள்

```bash
# மேம்பாட்டு சூழல்
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# உற்பத்தி சூழல்
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## கண்காணிப்பு மற்றும் கவனிப்பு

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

### செலவு கண்காணிப்பு

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

### மென்பொருள் அடையாளக் கட்டமைப்பு

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

## செயல்திறன் மேம்படுத்தல்

### கேசிங் வழிமுறைகள்

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

### தானியங்கி அளவீட்டு (Auto-scaling) கட்டமைப்பு

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

## பொதுவான பிரச்சனைகளை சரிசெய்தல்

### பிரச்சனை 1: OpenAI Quota மீறப்பட்டது

**அறிகுறிகள்:**
- வெளியீடு quota பிழைகளால் தோல்வி அடைகிறது
- பயன்பாட்டு பதிவுகளில் 429 பிழைகள்

**தீர்வுகள்:**
```bash
# தற்போது குவோட்டா பயன்பாட்டை சரிபார்க்கவும்
az cognitiveservices usage list --location eastus

# வேறு பிரதேசத்தை முயற்சிக்கவும்
azd env set AZURE_LOCATION westus2
azd up

# தற்காலிகமாக திறனைக் குறைக்கவும்
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### பிரச்சனை 2: அங்கீகாரத் தோல்விகள்

**அறிகுறிகள்:**
- AI சேவைகளை அழைக்கும் போது 401/403 பிழைகள்
- "அணுகல் மறுக்கப்பட்டது" போன்ற செய்திகள்

**தீர்வுகள்:**
```bash
# பாத்திர ஒதுக்கீடுகளை சரிபார்க்கவும்
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# நிர்வகிக்கப்பட்ட அடையாள அமைப்பை சரிபார்க்கவும்
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault அணுகலை சரிபார்க்கவும்
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### பிரச்சனை 3: மாடல் வெளியீட்டு பிரச்சனைகள்

**அறிகுறிகள்:**
- மாடல்கள் deployment இல் கிடைக்கவில்லை
- குறிப்பிட்ட மாடல் பதிப்புகள் தோல்வியாகின்றன

**தீர்வுகள்:**
```bash
# பிராந்தியங்கள் வாரியாக கிடைக்கும் மாடல்களை பட்டியலிடவும்
az cognitiveservices model list --location eastus

# bicep வார்ப்புருவில் மாடல் பதிப்பை புதுப்பிக்கவும்
# மாடல் திறன் தேவைகளை சரிபார்க்கவும்
```

## உதாரண வார்ப்புருக்கள்

### RAG உரையாடல் பயன்பாடு (Python)

**களஞ்சியம்**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**சேவைகள்**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**விளக்கம்**: மிகவும் பிரபலமான Azure AI மாதிரி — உற்பத்திக்குத் தயாரான RAG உரையாடல் பயன்பாடு, இது உங்கள் சொந்த ஆவணங்களில் கேள்விகள் கேட்க அனுமதிக்கிறது. உரையாடலுக்காக GPT-4.1-mini ஐ, எம்பெட்டிங்குகளுக்காக text-embedding-ada-002 ஐ, மற்றும் மீட்புக்கு Azure AI Search ஐ பயன்படுத்துகிறது.பல-மாதிரி ஆவணங்கள், குரல் உள்ளீடு/வெளியீடு, Microsoft Entra அங்கீகாரம் மற்றும் Application Insights டிரேசிங் ஆதரிக்கப்படுகிறது.

**விரைவு தொடக்கம்**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG உரையாடல் பயன்பாடு (.NET)

**களஞ்சியம்**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**சேவைகள்**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**விளக்கம்**: Python RAG உரையாடல் மாதிரியின் .NET/C# சமமானது. ASP.NET Core Minimal API மற்றும் Blazor WebAssembly ஃபிரன்ட்எண்ட் உடன் கட்டப்பட்டுள்ளது. குரல் உரையாடல், GPT-4o-mini vision ஆதரவு மற்றும் இணை .NET MAUI Blazor ஹைப்ரிட் டெஸ்க்டாப்/மொபைல் கிளையண்ட் கொடுக்கப்பட்டுள்ளது.

**விரைவு தொடக்கம்**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG உரையாடல் பயன்பாடு (Java)

**களஞ்சியம்**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**சேவைகள்**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**விளக்கம்**: Langchain4J ஐ பயன்படுத்தி AI ஒழுங்கமைப்புக்கான Java பதிப்பு RAG உரையாடல் மாதிரி. சிறு சேவை நிகழ்வு இயக்கமைப்பு, பல தேடல் நெறிகள் (எழுத்து, வெக்டர், சீமிச்சை), Azure Document Intelligence உடன் ஆவணப் பதிவேற்றம் ஆகியவை ஆதரிக்கப்படுகின்றன. பின்னர் Azure Container Apps அல்லது Azure Kubernetes Service இல் வெளியிட முடியும்.

**விரைவு தொடக்கம்**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**களஞ்சியம்**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**சேவைகள்**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**விளக்கம்**: Azure AI Foundry மற்றும் Prompty ஐ பயன்படுத்தி முழுமையான சில்லறை RAG கூடுதல் உதவியாளர். பொருள் பட்டியல் மற்றும் வாடிக்கையாளர் ஆர்டர் தரவுகளை அடிப்படையாக கொண்டு பதில்களை தரும் Contoso Outdoor சில்லறை சேவை உரையாடல் பொது மாதிரி. முழு GenAIOps பணித்திட்டத்தை காட்சியிட்டுள்ளது — Prompty உடன் நெறிப்படுத்தல், AI-உதவியுடன் மதிப்பீடு மற்றும் AZD மூலம் Container Apps இற்கு வெளியீடு.

**விரைவு தொடக்கம்**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**களஞ்சியம்**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**சேவைகள்**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**விளக்கம்**: Prompty உடன் பல-ஏஜென்ட் ஒழுங்கமைப்பை காண்பிக்கும் படைப்பியல் எழுத்து மாதிரி. ஆராய்ச்சி ஏஜென்ட் (Bing Grounding in Azure AI Agent Service), உற்பத்தி ஏஜென்ட் (Azure AI Search), எழுத்தாளர் ஏஜென்ட் மற்றும் ஆசிரியர் ஏஜென்ட் ஆகியவை ஒன்றிணைந்து நன்கு ஆராயப்பட்ட கட்டுரைகளை உருவாக்குகிறது. GitHub Actions இல் மதிப்பீடு உடன் CI/CD உடன் துவக்கப்படுகின்றது.

**விரைவு தொடக்கம்**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**களஞ்சியம்**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**சேவைகள்**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**விளக்கம்**: LangChain.js உடன் முழுமையாக serverless RAG சாட் தடவல், API க்காக Azure Functions மற்றும் ஹோஸ்டிங்கிற்கு Azure Static Web Apps பயன்படுத்துகிறது. Azure Cosmos DB ஐ வெக்டர் ஸ்டோர் மற்றும் உரையாடல் வரலாறு தரவுத்தளமாக பயன்படுத்துகிறது. பூகமான வளர்ச்சி பரிசோதனைக்கு Ollama ஐ உள்ளூர் முறையில் ஆதரிக்கிறது.

**விரைவு தொடக்கம்**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**களஞ்சியம்**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**சேவைகள்**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**விளக்கம்**: ஆவணப் பதிவேற்று/ம lump நிர்வாகத்திற்கான நிர்வாகப் போர்டல் உடன் நிறுவன-தர RAG தீர்வு accelerator. பல ஒழுங்கமைப்பு தேர்வுகள் (Semantic Kernel, LangChain, Prompt Flow), உரை-to-மொழி, Microsoft Teams ஒருங்கிணைப்பு மற்றும் PostgreSQL அல்லது Cosmos DB பின்னணியை தேர்ந்தெடுக்க கூடியது. உற்பத்தி RAG சந்தர்ப்பங்களுக்கு கைமுறைத் தொடக்கப்புள்ளியாக வடிவமைக்கப்பட்டுள்ளது.

**விரைவு தொடக்கம்**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**களஞ்சியம்**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**சேவைகள்**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**விளக்கம்**: மூன்று கட்டமைப்புகளை (LangChain.js, LlamaIndex.TS, Microsoft Agent Framework) பயன்படுத்தி பல-ஏஜென்ட் AI ஒழுங்கமைப்பிற்கான குறியீட்டு பயன்பாடு. நான்கு மொழிகளில் MCP (Model Context Protocol) சர்வர்கள் serverless Azure Container Apps ஆக வெளியிடப்பட்டு OpenTelemetry கண்காணிப்புடன் வழங்கப்படுகின்றன.

**விரைவு தொடக்கம்**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**களஞ்சியம்**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**சேவைகள்**: Azure AI Services + Azure OpenAI

**விளக்கம்**: Azure AI சேவைகளை machine learning மாடல்களுடன் கூடிய குறைந்தபட்ச Bicep வார்ப்புரு. முழு பயன்பாட்டு ஸ்டாக் வேண்டாமெனில் அற்புதமான ஆரம்ப புள்ளியாகும்.

**விரைவு தொடக்கம்**:
```bash
azd init --template azd-ai-starter
azd up
```

> **மேலும் வார்ப்புருக்களை உலாவ்**: 80+ AI-குறிப்பிட்ட AZD வார்ப்புருக்கள் மற்றும் சதி-காட்சிகள் இற்காக [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) ஐ பாருங்கள்.

## அடுத்த படிகள்

1. **உதாரணங்களை முயற்சி செய்யவும்**: உங்கள் பயன்பாட்டிற்கு ஏற்ற முன்-பணியமைக்கப்பட்ட வார்ப்புருவைத் தொடங்கவும்
2. **உங்கள் தேவைகளுக்கு அமைக்கவும்**: அமைப்பு மற்றும் பயன்பாட்டு குறியீட்டை மாற்றவும்
3. **கண்காணிப்பைப் சேர்க்கவும்**: விரிவான கவனிப்பை அமல்படுத்து
4. **செலவுகளை மேம்படுத்தவும்**: உங்கள் பட்ஜெட்டிற்கான அமைப்புகளை நுணுக்கப்படுத்தவும்
5. **உங்கள் வெளியீட்டை பாதுகாப்பு செய்யவும்**: நிறுவன பாதுகாப்பு வடிவங்களை செயல்படுத்து
6. **உற்பத்திக்கு விரிதல்**: பல-மண்டல மற்றும் உயர்ந்த கிடையும்மை அம்சங்களைச் சேர்க்கவும்

## 🎯 நடைமுறை பயிற்சிகள்

### பயிற்சி 1: Microsoft Foundry Models உரையாடல் பயன்பாட்டை வெளியிடுதல் (30 நிமிடம்)
**இலக்கு**: உற்பத்தி-தயார் AI உரையாடல் பயன்பாட்டை வெளியிடி சோதனை செய்வது

```bash
# டெம்ப்ளேட்டை ஆரம்பிக்கவும்
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# சூழல் மாறில்களை அமைக்கவும்
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# பயன்படுத்தவும்
azd up

# விண்ணப்பத்தை சோதிக்கவும்
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# கணினி நுண்ணறிவு செயல்பாடுகளை கண்காணிக்கவும்
azd monitor

# சுத்தப்படுத்தவும்
azd down --force --purge
```

**வெற்றி அளவுகோல்கள்:**
- [ ] வெளியீடு quota பிழைகள் இல்லாமல் முடிவடைய வேண்டும்
- [ ] உலாவியில் உரையாடல் இடைமுகத்திற்கு அணுக முடியும்
- [ ] கேள்விகள் கேட்டு AI-ஆதரித்த பதில்களை பெற முடியும்
- [ ] Application Insights தொலைநிலைக் கண்காணிப்பு தகவல்களை காட்டுகிறது
- [ ] வளங்கள் வெற்றிகரமாக சுத்தம் செய்யப்பட்டன

**எஸ்டிமேட்டு செலவு**: 30 நிமிட சோதனைக்கு $5-10

### பயிற்சி 2: பல-மாடல்கள் வெளியீட்டை அமைத்தல் (45 நிமிடம்)
**இலக்கு**: வேறுபாடான அமைப்புகளுடன் பல AI மாடல்களை வெளியிடுதல்

```bash
# தனிப்பயன் Bicep கட்டமைப்பை உருவாக்கவும்
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

# நிறுவவும் மற்றும் சரிபார்க்கவும்
azd provision
azd show
```

**வெற்றி அளவுகோல்கள்:**
- [ ] பல மாடல்கள் வெற்றிகரமாக வெளியிடப்பட்டன
- [ ] வெவ்வேறு திறன் அமைப்புகள் பயன்படுத்தப்பட்டன
- [ ] மாடல்கள் API வழியாக அணுகக்கூடியவை
- [ ] பயன்பாட்டில் இரு மாடல்களையும் அழைக்க முடியும்

### பயிற்சி 3: செலவு கண்காணிப்பை அமல்படுத்தல் (20 நிமிடம்)
**இலக்கு**: பட்ஜெட் எச்சரிக்கைகள் மற்றும் செலவுக் கண்காணிப்பை அமைத்தல்

```bash
# Bicepக்கு பட்ஜெட் எச்சரிக்கையை சேர்க்கவும்
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

# பட்ஜெட் எச்சரிக்கையை அமல்படுத்தவும்
azd provision

# தற்போதைய செலவுகளை சரிபார்க்கவும்
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**வெற்றி அளவுகோல்கள்:**
- [ ] Azure இல் பட்ஜெட் எச்சரிக்கை உருவாக்கப்பட்டது
- [ ] மின்னஞ்சல் सूचनைகள் கட்டமைக்கப்பட்டன
- [ ] Azure போர்டலில் செலவு தரவை காண முடிகிறது
- [ ] பட்ஜெட் எல்லைகளும் சரியாக அமைக்கப்பட்டன

## 💡 அடிக்கடி கேட்கப்படும் கேள்விகள்

<details>
<summary><strong>வளர்ச்சியின் போது Microsoft Foundry Models செலவுகளை நான் எப்படி குறைப்பேன்?</strong></summary>

1. **இலவச தரத்தை பயன்படுத்தவும்**: Microsoft Foundry Models மாதத்திற்கு 50,000 டோக்கன்கள் இலவசமாக வழங்குகிறது
2. **திறனை குறைக்கவும்**: dev க்காக 30+ பதிலாக திறனைக் 10 TPM இல் அமைக்கவும்
3. **azd down ஐப் பயன்படுத்தவும்**: ஆர்வமின்றி வளர்ச்சியில் இல்லாதபோது வளங்களை விடுவிக்கவும்
4. **பதில்களை கேஷ் செய்யவும்**: மீண்டும்தொடர்ந்து கேட்கப்படும் கேள்விகளுக்கு Redis கேஷ் அமல்படுத்தவும்
5. **Prompt Engineering ஐ பயன்படுத்தவும்**: திறமையான prompts மூலம் டோக்கன் பயன்பாட்டை குறைக்கவும்

```bash
# வளர்ச்சி கட்டமைப்பு
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models மற்றும் OpenAI API இன் வேறுபாடு என்ன?</strong></summary>

**Microsoft Foundry Models**:
- நிறுவனத் தரமான பாதுகாப்பு மற்றும் இணக்கத்தன்மை
- தனியார் நெட்வொர்க் ஒருங்கிணைப்பு
- SLA உறுதிமொழிகள்
- மேலாண்மை அடையாள அங்கீகாரம்
- அதிகமான quota கள் கிடைக்கும்

**OpenAI API**:
- புதிய மாடல்களுக்கு விரைவான அணுகல்
- எளிமையான அமைப்பு
- நுழைவுக்கு குறைந்த தடுப்பு
- பொது இணையத்தை மட்டுமே பயன்படுத்துகிறது

உற்பத்தி பயன்பாடுகளுக்காக, **Microsoft Foundry Models பரிந்துரைக்கப்படுகிறது**.
</details>

<details>
<summary><strong>Microsoft Foundry மாதிரிகள் குவோட்டா மீறிய பிழைகளை நான் எப்படி கையாள வேண்டும்?</strong></summary>

```bash
# தற்போதைய குவோட்டாவை சரிபார்க்கவும்
az cognitiveservices usage list --location eastus2

# வேறொரு பிராந்தியத்தை முயற்சிக்கவும்
azd env set AZURE_LOCATION westus2
azd up

# தற்காலிகமாக திறனை குறைக்கவும்
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# குவோட்டா அதிகரிப்பை கோரவும்
# Azure போர்டலில் செல்லவும் > குவோட்டாக்கள் > அதிகரிப்பு கோரவும்
```
</details>

<details>
<summary><strong>நான் என் சொந்த தரவைக் Microsoft Foundry மாதிரிகளுடன் பயன்படுத்தலாமா?</strong></summary>

ஆம்! RAG (Retrieval Augmented Generation) க்காக **Azure AI Search** ஐப் பயன்படுத்தவும்:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

இந்த [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) டெம்ப்ளேட்டை காணவும்.
</details>

<details>
<summary><strong>AI மாதிரி எண்ட்பாயின்ட்களை நான் எப்படி பாதுகாப்பாக வைத்துக் கொள்வது?</strong></summary>

**சிறந்த நடைமுறைகள்**:
1. Use Managed Identity (API விசைகள் இல்லை)
2. Enable Private Endpoints
3. Configure network security groups
4. Implement rate limiting
5. Use Azure Key Vault for secrets

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

## சமுதாயம் மற்றும் ஆதரவு

- **Microsoft Foundry Discord**: [#Azure சேனல்](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [பிரச்சினைகள் மற்றும் விவாதங்கள்](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [அதிகாரபூர்வ ஆவணங்கள்](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh இல் Microsoft Foundry திறன்](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - உங்கள் எடிட்டரில் Azure + Foundry agent திறன்களை `npx skills add microsoft/github-copilot-for-azure` மூலம் நிறுவவும்

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD தொடக்கர்களுக்காக](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மை அபிவிருத்தி
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 1: உங்கள் முதல் திட்டம்](../chapter-01-foundation/first-project.md)
- **➡️ அடுத்து**: [AI மாதிரி பயன்பாடு](ai-model-deployment.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)

**உதவி தேவையா?** எங்கள் சமுதாயப் பேச்சுக்களில் கலந்து கொள்ளுங்கள் அல்லது சேமிப்பகத்தில் ஒரு பிரச்சினையை திறக்கவும். Azure AI + AZD சமுதாயம் உங்கள் வெற்றிக்கு உதவ இங்கு உள்ளது!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு அறிவிப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், தானாக இயங்கும் மொழிபெயர்ப்புகளில் தவறுகள் அல்லது துல்லியமின்மைகள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனத்தில் கொள்ளவும். மூல மொழியில் உள்ள அசல் ஆவணத்தை அதிகாரப்பூர்வ ஆதாரமாகக் கருதவேண்டும். முக்கியமான தகவல்களுக்கு தொழில்முறை மனித மொழிபெயர்ப்பினை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதாலும் ஏற்பட்ட எந்த தவறான புரிதலும் அல்லது தவறான விளக்கங்களாலும் நாங்கள் பொறுப்பேற்கமுடியாது.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->