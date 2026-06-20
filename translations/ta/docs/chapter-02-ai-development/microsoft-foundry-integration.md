# Microsoft Foundry Integration with AZD

**அத்தியாயம் பயண செய்தி:**
- **📚 பாடநூல் முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 நடப்பு அத்தியாயம்**: அத்தியாயம் 2 - AI-முதல் வளர்ப்பு
- **⬅️ முந்தய அத்தியாயம்**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ அடுத்தது**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 அடுத்த அத்தியாயம்**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## அறிமுகம்

இந்த வழிகாட்டி Microsoft Foundry சேவைகள் மற்றும் Azure Developer CLI (AZD) ஐ ஒருங்கிணைத்து AI கட்டுப்படுத்தப்பட்ட பயன்பாடுகளை சீரமைக்க மற்றும் தானாக நீடித்தவையாக அமைக்க எப்படி செய்வதென்று காண்பிக்கிறது. Microsoft Foundry AI பயன்பாடுகளை உருவாக்க, 배포 செய்ய மற்றும் நிர்வகிக்க ஒரு விரிவான மேடையை வழங்குகிறது, AZD உடன் சேர்ந்து கட்டமைப்பு மற்றும் நியாகரியை எளிமையாக்குகிறது.

## Microsoft Foundry என்பது என்ன?

Microsoft Foundry என்பது Microsoft இன் ஒருங்கிணைந்த AI மேடையாகும், இதில் அடங்கு:

- **Model Catalog**: நவீன AI மாதிரிகளுக்கு அணுகல்
- **Prompt Flow**: AI வேலைப்பாடுகளுக்கான காட்சி வடிவமைப்பாளர்
- **Microsoft Foundry Portal**: AI செயலிகளுக்கான ஒருங்கிணைக்கப்பட்ட வளர்ச்சி சூழல்
- **Deployment Options**: பல்வேறு ஹோஸ்டிங் மற்றும் ஸ்கேலிங் விருப்பங்கள்
- **Safety and Security**: உட்பட்ட பொறுப்புள்ள AI அம்சங்கள்

## AZD + Microsoft Foundry: இணைந்து சிறந்தது

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | கைமறை போர்டல் மூலம் 배포 | தானியங்கி, மீண்டும் பயன்படுத்தக்கூடிய 배포கள் |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | ஒரே சுற்றுச்சூழல் கவனம் | பல சுற்றுச்சூழல்கள் (dev/staging/prod) |
| **CI/CD Integration** | வரையறுக்கப்பட்டது | இயல்புநிலை GitHub Actions ஆதரவு |
| **Cost Management** | அடிப்படை கண்காணிப்பு | சுற்றுச்சூழல்-சார்ந்த செலவுக் கண்காப்பு 최적화 |

## முன்-தேவைகள்

- பொருத்தமான அனுமதிகளுடன் Azure சந்தா
- Azure Developer CLI நிறுவப்பட்டுள்ளது
- Microsoft Foundry Models சேவைகள் அணுகல்
- Microsoft Foundry அடிப்படையான பரிச்சயம்

> **நடப்பு AZD அடிப்படை:** இந்த உதாரணங்கள் `azd` `1.23.12` மீது மதிப்பாய்வு செய்யப்பட்டன. AI ஏஜென்ட் வேலைப்பாட்டிற்கு, தற்போதைய முன்னிலைவீச்சு நீட்டிப்பு வெளியீட்டை பயன்படுத்து மற்றும் உங்கள் நிறுவப்பட்ட பதிப்பை தொடங்குவதற்கு முன் சரிபார்க்கவும்.

## முதன்மை ஒருங்கிணைப்பு மாதிரிகள்

### Pattern 1: Microsoft Foundry Models ஒருங்கிணைவு

**பயன்பாடு**: Microsoft Foundry Models மாதிரிகளுடன் chat பயன்பாடுகளை 배포 செய்ய

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

**Infrastructure (main.bicep):**
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

### Pattern 2: AI Search + RAG ஒருங்கிணைவு

**பயன்பாடு**: retrieval-augmented generation (RAG) பயன்பாடுகளை 배포 செய்ய

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

### Pattern 3: Document Intelligence ஒருங்கிணைவு

**பயன்பாடு**: ஆவணம் செயலாக்கம் மற்றும் பகுப்பாய்வு வேலைப்பாட்டுகள்

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

## 🔧 கட்டமைப்பு மாதிரிகள்

### சுற்றுச்சூழல் மாறிலிகள் அமைப்புகள்

**உற்பத்தி கட்டமைப்பு:**
```bash
# முக்கிய AI சேவைகள்
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# மாதிரி அமைப்புகள்
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# செயல்திறன் அமைப்புகள்
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**வளர்ச்சி கட்டமைப்பு:**
```bash
# வளர்ச்சிக்காக செலவு குறைப்பாக அமைக்கப்பட்ட அமைப்புகள்
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # இலவச நிலை
```

### Key Vault மூலம் பாதுகாக்கப்பட்ட கட்டமைப்பு

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

## 배포 வேலைப்பாடுகள்

### Foundry க்கான AZD நீட்டிப்புகள்

AZD Microsoft Foundry சேவைகளுடன் வேலை செய்ய AI-சந்தித்த அம்சங்களை சேர்க்கும் நீட்டிப்புகளை வழங்குகிறது:

```bash
# Foundry agents விரிவாக்கத்தை நிறுவவும்
azd extension install azure.ai.agents

# நுண்ணசீரமைப்பு விரிவாக்கத்தை நிறுவவும்
azd extension install azure.ai.finetune

# தனிப்பயன் மாதிரிகள் விரிவாக்கத்தை நிறுவவும்
azd extension install azure.ai.models

# நிறுவப்பட்ட விரிவாக்கங்களை பட்டியலிடவும்
azd extension list --installed

# தற்போது நிறுவப்பட்ட ஏஜெண்ட் விரிவாக்கத்தின் பதிப்பைப் பரிசோதிக்கவும்
azd extension show azure.ai.agents
```

AI நீட்டிப்புகள் இன்னும் முன்னிலைவீச்சில் வேகமாக நகர்கின்றன. ஒரு கட்டளை இங்குக் காட்டியிருந்ததைவிட வேறாக நடக்கும் என்றால், திட்டத்தைத் தானாக பிரச்சனையிடுவதற்கு முன் சம்பந்தப்பட்ட நீட்டிப்பை மேம்படுத்து.

### `azd ai` உடன் ஏஜென்ட்-முதலில் 배포

உங்களுக்கு ஏஜென்ட் மெனிபெஸ்ட் இருந்தால், Foundry Agent Service க்கு இணைக்கப்பட்ட திட்டத்தை scaffold செய்ய `azd ai agent init` ஐப் பயன்படுத்தவும்:

```bash
# ஏஜென்ட் மானிஃபெஸ்டில் இருந்து ஆரம்பிக்கவும்
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure-க்கு வெளியிடவும்
azd up
```

`azure.ai.agents` இன் சமீபத்திய முன்னிலைவீச்சு வெளியீடுகள் `azd ai agent init` க்கு கட்டமைப்பு-பொறுப்பான தொடக்க ஆதரவை கூடச் சேர்த்துள்ளன. புதிய ஏஜென்ட் மாதிரிகளை பின்பற்றினால், உங்கள் நிறுவப்பட்ட பதிப்பில் கிடைக்கும் சரியான கொடிகள் (flags) குறித்து நீட்டிப்பு உதவியை சரிபார்க்கவும்.

முழு கட்டளை குறிப்புக்கும் கொடிகளுக்கும் [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) ஐப் பார்க்கவும்.

### ஒரு கட்டளையிலேயே 배포

```bash
# ஒரே கட்டளையால் அனைத்தையும் வெளியிடு
azd up

# அல்லது படிப்படியாக வெளியிடு
azd provision  # அடித்தள கட்டமைப்பு மட்டும்
azd deploy     # செயலி மட்டும்

# azd 1.23.11+ இல் நீண்ட காலம் இயக்கப்படும் AI செயலி வெளியீடுகளுக்காக
azd deploy --timeout 1800
```

### சுற்றுச்சூழல்-சார்ந்த 배포கள்

```bash
# வளர்ச்சி சூழல்
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

### செலவுக் கண்காணிப்பு

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

### Managed Identity அமைப்பு

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

### பிணைய பாதுகாப்பு

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

## செயல்திறன் 최적화

### கேச்சிங் மேலாண்மை

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

### Auto-scaling கட்டமைப்பு

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

## வழக்கமான பிரச்சனைகள் தீர்க்குதல்

### பிரச்சனை 1: OpenAI Quota மீறல்

**அறிகுறிகள்:**
- 배포 quota பிழைகளுடன் தோல்வி அடைகிறது
- பயன்பாடு 日誌ல் 429 பிழைகள்

**தீர்வுகள்:**
```bash
# தற்போதைய ஒதுக்கீட்டு பயன்பாட்டை சரிபார்க்கவும்
az cognitiveservices usage list --location eastus

# வேறொரு பிராந்தியத்தை முயற்சிக்கவும்
azd env set AZURE_LOCATION westus2
azd up

# தற்காலிகமாக திறனைக் குறைக்கவும்
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### பிரச்சனை 2: அங்கீகாரம் தோல்விகள்

**அறிகுறிகள்:**
- AI சேவைகளைக் அழைக்கும் போது 401/403 பிழைகள்
- "Access denied" செய்திகள்

**தீர்வுகள்:**
```bash
# பாத்திர ஒதுக்கீடுகளை சரிபார்க்கவும்
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# கையாளப்பட்ட அடையாளக் கட்டமைப்பை சரிபார்க்கவும்
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault அணுகலை சரிபார்க்கவும்
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### பிரச்சனை 3: மாதிரி 배포 பிரச்சனைகள்

**அறிகுறிகள்:**
- மாதிரிகள் 배포யில் கிடைக்கவில்லை
- குறிப்பிட்ட மாதிரி பதிப்புகள் தோல்வி

**தீர்வுகள்:**
```bash
# பிரதேசம் வாரியாக கிடைக்கும் மாதிரிகளை பட்டியலிடவும்
az cognitiveservices model list --location eastus

# bicep வார்ப்புருவில் மாதிரி பதிப்பை புதுப்பிக்கவும்
# மாதிரியின் திறன் தேவைகளை சரிபார்க்கவும்
```

## உதாரண வார்ப்புருக்கள்

### RAG Chat பயன்பாடு (Python)

**களஞ்சியம்**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**சேவைகள்**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**விவரம்**: அதிகம் பிரபலமான Azure AI மாதிரி — உங்களது சொந்த ஆவணங்களை அடிப்படையாகக் கொண்டு கேட்கும் production-உகந்த RAG chat பயன்பாடு. சந்திப்பிற்கு GPT-4.1-mini for chat, text-embedding-3-large for embeddings, மற்றும் Azure AI Search for retrieval பயன்படுத்துகிறது. பன்மொழி ஆவணங்கள், பேச்சு உள்ளீடு/வெளியீடு, Microsoft Entra அங்கீகாரம் மற்றும் Application Insights செருகல்களை ஆதரிக்கிறது.

**விரைவு தொடக்கம்**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat பயன்பாடு (.NET)

**களஞ்சியம்**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**சேவைகள்**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**விவரம்**: Python RAG chat மாதிரியின் .NET/C# சமமையான பதிப்பு. ASP.NET Core Minimal API மற்றும் Blazor WebAssembly முன்னமைத்துடன் கட்டமைக்கப்பட்டுள்ளது. குரல் உரையாடல், GPT-4o-mini vision ஆதரவு மற்றும் துணை .NET MAUI Blazor ஹைப்ரிட் டெஸ்க்டாப்/மொபைல் கிளையன்டை உள்ளடக்கியது.

**விரைவு தொடக்கம்**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat பயன்பாடு (Java)

**களஞ்சியம்**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**சேவைகள்**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**விவரம்**: Langchain4J ஐ AI ஒர்க்கஸ்ட்ரேஷனுக்காக பயன்படுத்தி RAG chat மாதிரியின் Java பதிப்பு. மைக்ரோசேவைஸ் நிகழ்வு-மேம்படுத்தப்பட்ட கட்டமைப்பு, பல தேடல் 전략ங்கள் (உரை, வெക്ടர், ஹைபிரிட்), Azure Document Intelligence மூலம் ஆவணப் பதிவேற்றம் மற்றும் Azure Container Apps அல்லது Azure Kubernetes Service இல் 배포 ஆதரவு கொண்டது.

**விரைவு தொடக்கம்**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Microsoft Foundry உடன் ஐம்பெர்ச் ரீடைல் கோபைலட் (Enterprise Retail Copilot)

**களஞ்சியம்**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**சேவைகள்**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**விவரம்**: Microsoft Foundry மற்றும் Prompty பயன்படுத்தி உள்ள-முற்றிலும் retail RAG copilot. Contoso Outdoor சில்லறை கடை உரையாடல் அதிகாரம், பதில்களை பொருட்கள் கத்தலாகவும் வாடிக்கையாளர் ऑர்ட்டர் தரவுகளிலுமாக அடிப்படையாக்குகிறது. முழு GenAIOps வேலைப்பாட்டை காட்டுகிறது — Prompty உடன் prototype, AI-உதவியுடன் மதிப்பீடு, மற்றும் AZD மூலமாக Container Apps இல் 배포.

**விரைவு தொடக்கம்**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing பல-ஏஜென்ட் பயன்பாடு

**களஞ்சியம்**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**சேவைகள்**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**விவரம்**: Prompty உடன் AI ஏஜென்ட் ஒர்க்கஸ்ட்ரேஷனை காட்டும் பல-ஏஜென்ட் மாதிரி. ஒரு ஆய்வு ஏஜென்ட் (Bing Grounding in Azure AI Agent Service), ஒரு பொருள் ஏஜென்ட் (Azure AI Search), ஒரு எழுத்தாளர் ஏஜென்ட் மற்றும் ஒரு தொகுப்பாளர் ஏஜென்ட் இணைந்து நன்கு ஆராய்ச்சி செய்யப்பட்ட கட்டுரைகளை உருவாக்குகிறார்கள். GitHub Actions இல் மதிப்பீடு உடன் CI/CD ஐ உட்படுத்தியுள்ளன.

**விரைவு தொடக்கம்**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**களஞ்சியம்**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**சேவைகள்**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**விவரம்**: LangChain.js உடன் முழுமையாக serverless RAG chatbot; API க்கு Azure Functions மற்றும் ஹோஸ்டிங்கிற்கு Azure Static Web Apps பயன்படுத்துகிறது. Azure Cosmos DB ஐ வெக்டர் ஸ்டோர் மற்றும் சந்திப்பு வரலாறு தரவுத்தளமாக இரு பயன்களுக்கும் பயன்படுத்துகிறது. இலவசப் பரிசோதனைக்காக Ollama உடன் உள்ளூர் வளர்ச்சிக்கு ஆதரவு செய்கிறது.

**விரைவு தொடக்கம்**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**களஞ்சியம்**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**சேவைகள்**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**விவரம்**: ஆவணப் பதிவேற்ற/நிர்வகிப்பிற்கு நிர்வாகக் காட்சி உடைய எண்டர்பிரைஸ்-தர RAG தீர்வு விரிவாக்கி. பல ஓர்க்கஸ்ட்ரேஷன் விருப்பங்கள் (Semantic Kernel, LangChain, Prompt Flow), பேச்சு-இலிருந்து-உரை, Microsoft Teams ஒருங்கிணைவு, மற்றும் PostgreSQL அல்லது Cosmos DB பின்புலம் தேர்வு போன்ற அம்சங்கள் கொண்டது. உற்பத்தி RAG நிலைகளுக்கான தனிப்பயன்பாட்டு தொடக்க புள்ளியாக வடிவமைக்கப்பட்டுள்ளது.

**விரைவு தொடக்கம்**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI பயண ஏஜென்டுகள் — பல-ஏஜென்ட் MCP ஒர்க்கஸ்ட்ரேஷன்

**களஞ்சியம்**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**சேவைகள்**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**விவரம்**: மூன்று ஃப்ரேம்வொர்க்குகளை (LangChain.js, LlamaIndex.TS, மற்றும் Microsoft Agent Framework) பயன்படுத்தி பல-ஏஜென்ட் AI ஒர்க்கஸ்ட்ரேஷனுக்கான குறிப்பு பயன்பாடு. நான்கு மொழிகளில் உள்ள MCP (Model Context Protocol) சேவைகள் serverless Azure Container Apps ஆக 배포 செய்யப்பட்டு OpenTelemetry கண்காணிப்புடன் வழங்கப்படுகின்றன.

**விரைவு தொடக்கம்**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**களஞ்சியம்**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**சேவைகள்**: Azure AI Services + Azure OpenAI

**விவரம்**: Azure AI சேவைகளை கன்ஃபிகர் செய்யப்பட்ட இயந்திரம் மாதிரிகளுடன் 배포 செய்யும் குறைந்தநிலை Bicep வார்ப்புரு. முழு பயன்பாட்டு ஸ்டாக் தேவையில்லாமல் רק Azure AI கட்டமைப்பை மட்டுமே provision செய்ய வேண்டுமானால் இது ஒரு லைட்வெயிட் தொடக்க புள்ளி.

**விரைவு தொடக்கம்**:
```bash
azd init --template azd-ai-starter
azd up
```

> **மேலும் வார்ப்புருக்கள் ব্রௌஸ் செய்ய**: 80+ AI-சார்ந்த AZD வார்ப்புருக்கள் மற்றும் காட்சிகளுக்கு [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) ஐப் பார்வையிடவும்.

## அடுத்த படிகள்

1. **உதாரணங்களை முயற்சித்து பாருங்கள்**: உங்கள் பயன்பாட்டுக்கு பொருந்திய முன்னமைக்கப்பட்ட வார்ப்புருவுடன் தொடங்குங்கள்
2. **உங்கள் தேவைக்கு ஒழுங்குபடுத்துங்கள்**: கட்டமைப்பு மற்றும் பயன்பாட்டு கோடுகளை மாற்றியமைக்கவும்
3. **கண்காணிப்பை சேர்க்கவும்**: விரிவான பார்வையிடலை அமல்படுத்தவும்
4. **செலவுகளை 최적화 செய்யவும்**: உங்கள் பட்ஜெட்டிற்கான கட்டமைப்புகளை நுட்பமாக திருத்துக
5. **உங்கள் 배포 பாதுகாப்பு செய்யவும்**: நிறுவன பாதுகாப்பு மாதிரிகளை நடைமுறைப்படுத்தவும்
6. **உற்பத்திக்கு வலியுறுத்தவும்**: பல-ஏரியா மற்றும் உயர்-கிடைக்கும் அம்சங்களைச் சேர்க்கவும்

## 🎯 கைமுறைப் பயிற்சிகள்

### பயிற்சி 1: Microsoft Foundry Models Chat App 배포 (30 நிமிடங்கள்)
**முகவரி**: ஒரு production-தகுதி AI உரையாடல் பயன்பாட்டை 배포 செய்து சோதனை செய்ய

```bash
# வார்ப்புருவை ஆரம்பிக்கவும்
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# சுற்றுச்சூழல் மாறிகளை அமைக்கவும்
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# வெளியிடவும்
azd up

# பயன்பாட்டை பரிசோதிக்கவும்
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# ஏஐ செயல்பாடுகளைக் கண்காணிக்கவும்
azd monitor

# சுத்தம் செய்யவும்
azd down --force --purge
```

**வெற்றி அளவுகோல்கள்:**
- [ ] 배포 quota பிழைகள் இல்லாமல் முடிகிறது
- [ ] உலாவியில் உரையாடல் இடைமுகத்தை அணுக முடியும்
- [ ] கேள்விகள் கேட்டு AI-ஆதரிக்கப்பட்ட பதில்களை பெற முடியும்
- [ ] Application Insights தொலைவியல் தகவல்களை காட்டுகிறது
- [ ] வளங்களை வெற்றிகரமாக கழுத்து மீளமைத்தல் செய்யப்பட்டுள்ளன

**கணக்கிடப்பட்ட செலவு**: 30 நிமிட சோதனைக்கு $5-10

### பயிற்சி 2: பல-மாதிரி 배포 கட்டமைக்கு (45 நிமிடங்கள்)
**முகவரி**: வெவ்வேறு கட்டமைப்புகளுடன் பல AI மாதிரிகள் 배포 செய்ய

```bash
# தனிப்பயன் Bicep அமைப்பை உருவாக்கவும்
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

# விநியோகித்து மற்றும் சரிபார்க்கவும்
azd provision
azd show
```

**வெற்றி அளவுகோல்கள்:**
- [ ] பல மாதிரிகள் வெற்றிகரமாக 배포 செய்யப்பட்டன
- [ ] வெவ்வேறு திறன் அமைப்புகள் பொருந்தியுள்ளன
- [ ] மாதிரிகள் API மூலம் அணுகக்கூடியவை
- [ ] பயன்பாடிலிருந்து இரு மாதிரிகளையும் அழைக்க முடிகிறது

### பயிற்சி 3: செலவுக் கண்காணிப்பு అమல்படுத்து (20 நிமிடங்கள்)
**முகவரி**: பட்ஜெட் அறிவிப்புகள் மற்றும் செலவுக் கண்காணிப்பை அமைக்கவும்

```bash
# Bicep-இல் பட்ஜெட் எச்சரிப்பை சேர்க்கவும்
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

# பட்ஜெட் எச்சரிப்பை நிறுவவும்
azd provision

# தற்போதைய செலவுகளை சரிபார்க்கவும்
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**வெற்றி அளவுகோல்கள்:**
- [ ] Azure இல் பட்ஜெட் அறிவிப்பு உருவாக்கப்பட்டது
- [ ] மின்னஞ்சல் அறிவிப்புகள் கட்டமைக்கப்பட்டன
- [ ] Azure போர்டலிலே செலவு தரவுகளைப் பார்க்க முடியும்
- [ ] பட்ஜெட் எல்லைகள் சரியாக அமைக்கப்பட்டுள்ளன

## 💡 அடிக்கடி கேட்கப்படும் கேள்விகள்

<details>
<summary><strong>எப்படி வளர்ச்சி காரியத்தில் Microsoft Foundry Models செலவுகளை குறைக்கலாம்?</strong></summary>

1. **இலவச பட்டத்தை பயன்படுத்தவும்**: Microsoft Foundry Models மாதத்திற்கு 50,000 டோக்கன்கள்/மாதம் இலவசமாக வழங்குகிறது
2. **திறன் குறைக்கவும்**: dev க்காக திறனை 30+ க்கு பதிலாக 10 TPM ஆக அமைக்கவும்
3. **azd down பயன்படுத்தவும்**: செயலில் இல்லாத போது வளங்களை deallocate செய்ய
4. **பதில்களை கேச் செய்யவும்**: மீண்டும் கேட்கப்படும் வினாக்களுக்கு Redis கேச் ஐ அமல்படுத்தவும்
5. **Prompt Engineering ஐ பயன்படுத்தவும்**: திறமையாக prompts அமைத்து டோக்கன் பயன்பாட்டை குறைக்கவும்


```bash
# வளர்ச்சி கட்டமைப்பு
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models மற்றும் OpenAI API இடையிலான வேறுமை என்ன?</strong></summary>

**Microsoft Foundry Models**:
- தொழில் பாதுகாப்பு மற்றும் ஒழுங்கு இணக்கம்
- தனியார் நெட்வொர்க் ஒருங்கிணைவு
- SLA உத்தரவாதங்கள்
- Managed Identity மூலம் அங்கீகாரம்
- மேலான குவோட்டா கிடைக்கும்

**OpenAI API**:
- புதிய மாடல்களுக்கு வேகமான அணுகல்
- எளிதான அமைப்பு
- நுழைவுக்கு குறைந்த தடைகள்
- பொது இணையத்திலேயே மட்டுமே

தொழில்துறை பயன்பாடுகளுக்கு, **Microsoft Foundry Models பரிந்துரைக்கப்படுகிறது**.
</details>

<details>
<summary><strong>Microsoft Foundry Models குவோட்டா மீறல் பிழைகளை எப்படி கையாள்வது?</strong></summary>

```bash
# தற்போதைய கொட்டாவைக் சரிபார்க்கவும்
az cognitiveservices usage list --location eastus2

# வேறு மண்டலத்தை முயற்சி செய்யவும்
azd env set AZURE_LOCATION westus2
azd up

# தற்காலிகமாக திறனைக் குறைக்கவும்
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# கொட்டா அதிகரிப்பை கோரவும்
# Azure போர்டலுக்கு செல்லவும் > கொட்டாக்கள் > அதிகரிப்பு கோரிக்கையை சமர்ப்பிக்கவும்
```
</details>

<details>
<summary><strong>Microsoft Foundry Models உடன் என் சொந்த தரவுகளைப் பயன்படுத்தலாமா?</strong></summary>

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

இந்த [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) டெம்ப்ளேட்டை பாருங்கள்.
</details>

<details>
<summary><strong>AI மாடல் என்ட்பாயிண்ட்களை எப்படி பாதுகாக்கிறேன்?</strong></summary>

**சிறந்த வழிமுறைகள்**:
1. Managed Identity ஐப் பயன்படுத்தவும் (API விசைகள் இல்லை)
2. Private Endpoints ஐ செயல்படுத்தவும்
3. நெட்வொர்க் பாதுகாப்பு குழுக்களை அமைக்கவும்
4. வேக வரம்பை அமல்படுத்தவும்
5. ரகசியங்களுக்காக Azure Key Vault ஐ பயன்படுத்தவும்

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

## சமூகமும் ஆதரவும்

- **Microsoft Foundry Discord**: [#Azure சேனல்](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [அதிகாரப்பூர்வ ஆவணங்கள்](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - உங்கள் எடிட்டரில் Azure + Foundry agent skills ஐ `npx skills add microsoft/github-copilot-for-azure` கொண்டு நிறுவவும்

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மை மேம்பாடு
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 1: உங்கள் முதல் திட்டம்](../chapter-01-foundation/first-project.md)
- **➡️ அடுத்தது**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: அமைப்பு](../chapter-03-configuration/configuration.md)

**உதவி தேவைவுமா?** எங்கள் சமூக கலந்துரையாடல்களில் சேரவும் அல்லது ரெப்போசிடரியில் ஒரு issue திறக்கவும். Azure AI + AZD சமுதாயம் உங்கள் வெற்றிக்கு உதவ இங்கே உள்ளது!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->