# Microsoft Foundry மற்றும் AZD ஒருங்கிணைப்பு

**அத்தியாயம் வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD தொடக்கப் பாடம்](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மை அபிவிருத்தி
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 1: உங்கள் முதல் திட்டம்](../chapter-01-foundation/first-project.md)
- **➡️ அடுத்து**: [AI மாடல் வெளியீடு](ai-model-deployment.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)

## கண்ணோட்டம்

இந்த கையேடு Microsoft Foundry சேவைகளை Azure Developer CLI (AZD) உடன் ஒருங்கிணைத்து AI செயலிகள் வெளியீட்டை எளிமைப்படுத்துவது எப்படி என்பதை காண்பிக்கிறது. Microsoft Foundry AI செயலிகளை கட்டமைத்து, வெளியிடச் செய்து, நிர்வகிக்க ஒரு விரிவான தளத்தை வழங்குகிறது, மற்றும் AZD அடித்தளம் மற்றும் வெளியீட்டு செயல்முறையை எளிமைப்படுத்துகிறது.

## Microsoft Foundry என்றால் என்ன?

Microsoft Foundry என்பது Microsoft-ன் ஒற்றுமை செய்யப்பட்ட AI அபிவிருத்தி தளம் ஆகும், அதில் அடங்கியது:

- **Model Catalog**: நவீன AI மாடல்களுக்கு அணுகல்
- **Prompt Flow**: AI பணிச்சூழலுக்கான காணொளி வடிவமைப்பாளர்
- **Microsoft Foundry Portal**: AI செயலிகளுக்கான ஒருங்கிணைந்த அபிவிருத்தி சூழல்
- **Deployment Options**: பலஹீதமான ஹோஸ்டிங் மற்றும் வலிக்கும் விரிவாக்க விருப்பங்கள்
- **Safety and Security**: பொறுப்பான AI அம்சங்கள் ந eingebuilt

## AZD + Microsoft Foundry: ஒன்றாக சிறந்தவை

| அம்சம் | Microsoft Foundry | AZD ஒருங்கிணைப்பு பயன் |
|---------|-----------------|------------------------|
| **Model Deployment** | கைமுறை போர்டல் வெளியீடு | தானியங்கி, மீண்டும் செய்யக்கூடிய வெளியீடுகள் |
| **Infrastructure** | கிளிக் மூலம் வழங்கல் | கட்டமைப்பை குறியீட்டாக (Bicep) |
| **Environment Management** | ஒரே சூழல் கவனம் | பல்வேறு சூழல்கள் (dev/staging/prod) |
| **CI/CD Integration** | குறைந்த அளவு | உள்ளூர் GitHub Actions ஆதரவு |
| **Cost Management** | அடிப்படை கண்காணிப்பு | சூழலுக்கு ஏற்ற செலவு உத்திச் சீரமைப்பு |

## தேவையான முன் நிபந்தனைகள்

- சரியான அனுமதிகளுடன் Azure சந்தா
- Azure Developer CLI நிறுவப்பட்டிருத்தல்
- Microsoft Foundry Models சேவைகளுக்கான அணுகல்
- Microsoft Foundry பற்றிய அடிப்படை பரிச்சயம்

> **தற்போதைய AZD அடிப்படை வெர்ஷன்:** இந்த உதாரணங்கள் `azd` `1.23.12` உடன் மதிப்பாய்வு செய்யப்பட்டன. AI முகவர் வேலைப்ப flow க்காக, தற்போதைய முன்னோட்ட நீட்டிப்பு வெளியீட்டை பயன்படுத்தவும் மற்றும் தொடங்குவதற்கு முன் உங்கள் நிறுவிய பதிப்பை சரிபார்க்கவும்.

## முக்கிய ஒருங்கிணைப்பு வடிவங்கள்

### வடிவம் 1: Microsoft Foundry Models ஒருங்கிணைப்பு

**பயன்பாட்டு நிலை**: Microsoft Foundry Models மாடல்களுடன் உரையாடல் செயலிகளை வெளியிடுதல்

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

**அடித்தளம் (main.bicep):**
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

### வடிவம் 2: AI Search + RAG ஒருங்கிணைப்பு

**பயன்பாட்டு நிலை**: retrieval-augmented generation (RAG) செயலிகளை வெளியிடுதல்

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

### வடிவம் 3: Document Intelligence ஒருங்கிணைப்பு

**பயன்பாட்டு நிலை**: ஆவணங்கள் செயலாக்கம் மற்றும் பகுப்பாய்வு பணிசார் வேலைப்பாடுகள்

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

## 🔧 கட்டமைப்பு வடிவங்கள்

### சூழல் மாறிலிகள் அமைத்தல்

**உற்பத்தி கட்டமைப்பு:**
```bash
# முதன்மை AI சேவைகள்
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
# வளர்ச்சிக்கான செலவு குறைக்கப்பட்ட அமைப்புகள்
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # இலவச நிலை
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

## வெளியீட்டு வேலைப்பாடுகள்

### Foundry க்கான AZD நீட்டிப்புகள்

AZD Microsoft Foundry சேவைகளுடன் பணிபுரிய AI-சார்ந்த திறன்களை சேர்க்கும் நீட்டிப்புகளை வழங்குகிறது:

```bash
# Foundry ஏஜென்ட் விரிவாக்கத்தை நிறுவவும்
azd extension install azure.ai.agents

# fine-tuning விரிவாக்கத்தை நிறுவவும்
azd extension install azure.ai.finetune

# தனிப்பயன் மாதிரிகள் விரிவாக்கத்தை நிறுவவும்
azd extension install azure.ai.models

# நிறுவப்பட்ட விரிவாக்கங்களை பட்டியலிடவும்
azd extension list --installed

# தற்போது நிறுவப்பட்ட ஏஜென்ட் விரிவாக்கத்தின் பதிப்பை பரிசோதிக்கவும்
azd extension show azure.ai.agents
```

AI நீட்டிப்புகள் இன்னும் முன்னோட்டத்தில் விரைவாக நகர்கின்றன. ஒரு கட்டளை இங்கே காட்டபட்டிருந்தபடி நடக்கவில்லை என்றால், திட்டத்தைத் தானாக சரி பார்க்கும் முன் சம்பந்தப்பட்ட நீட்டிப்பை மேம்படுத்தவும்.

### `azd ai` உடன் முகவர்-முதலான வெளியீடு

ஒரு முகவர் manifest இருந்தால், Foundry Agent Service உடன் இணைக்கப்பட்ட திட்டத்தை உருவாக்க `azd ai agent init` பயன்படுத்தவும்:

```bash
# ஏஜென்ட் மானிபெஸ்ட் மூலம் ஆரம்பிக்கவும்
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure-இல் வெளியிடவும்
azd up
```

விரைவு வெளியீட்டின் சமீபத்திய அம்சங்களில் `azure.ai.agents` `azd ai agent init` க்கு டெம்ப்ளேட்-அடிப்படை துவக்க ஆதரவையும் சேர்த்துள்ளது. நீங்கள் புதுப்பிக்கப்பட்ட முகவர் உதாரணங்களை பின்பற்றினால், உங்கள் நிறுவிய பதிப்பில் கிடைக்கும் சரியான பிளாக்-flags க்கான நீட்டிப்பு உதவியை சரிபார்க்கவும்.

முழுமையான கட்டளை குறிப்புகளுக்கும் கொடிகளிற்கும் [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) ஐ காண்க.

### ஒரே கட்டளை வெளியீடு

```bash
# ஒரே கட்டளையுடன் அனைத்தையும் வெளியிடவும்
azd up

# அல்லது படிப்படியாக வெளியிடவும்
azd provision  # அடித்தள அமைப்பு மட்டுமே
azd deploy     # விண்ணப்பம் மட்டுமே

# azd 1.23.11+ இல் நீண்டகாலம் இயக்கப்படும் AI பயன்பாட்டு வெளியீடுகளுக்காக
azd deploy --timeout 1800
```

### சூழல்-கேற்ற வெளியீடுகள்

```bash
# அபிவிருத்தி சூழல்
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

## கண்காணிப்பு மற்றும் கவனிப்புணர்வு

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

### நிர்வகிக்கப்பட்ட அடையாள அமைப்பு

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

### கேஷ் தந்திரங்கள்

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

### தானியங்கி அளவீட்டு கட்டமைப்பு

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

## பொதுவான பிரச்சினைகள் தீர்க்குதல்

### பிரச்சனை 1: OpenAI அளவுகோல் மீறப்பட்டது

**அறிகுறிகள்:**
- வெளியீடு அளவுகோல் பிழைகளுடன் தோல்வியடைகிறது
- பயன்பாட்டு பதிவுகளில் 429 பிழைகள்

**தீர்வுகள்:**
```bash
# தற்போதைய குவோட்டா பயன்பாட்டை சரிபார்க்கவும்
az cognitiveservices usage list --location eastus

# வேறு பிராந்தியத்தை முயற்சி செய்யவும்
azd env set AZURE_LOCATION westus2
azd up

# தற்காலிகமாக திறனைக் குறைக்கவும்
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### பிரச்சனை 2: அங்கீகார தோல்விகள்

**அறிகுறிகள்:**
- AI சேவைகள் அழைக்கும் போது 401/403 பிழைகள்
- "Access denied" செய்திகள்

**தீர்வுகள்:**
```bash
# பங்கு ஒதுக்கீடுகளை சரிபார்க்கவும்
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# மேலாண்மை அடையாளத்தின் கட்டமைப்பை சரிபார்க்கவும்
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault அணுகலை சரிபார்க்கவும்
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### பிரச்சனை 3: மாடல் வெளியீடு பிரச்சினைகள்

**அறிகுறிகள்:**
- வெளியீட்டில் மாடல்கள் கிடைக்கவில்லை
- குறிப்பிட்ட மாடல் பதிப்புகள் தோல்வியடைகின்றன

**தீர்வுகள்:**
```bash
# மண்டலத்தின்படி கிடைக்கக்கூடிய மாதிரிகளை பட்டியலிடவும்
az cognitiveservices model list --location eastus

# bicep டெம்ப்ளேட்டில் மாதிரி பதிப்பை புதுப்பிக்கவும்
# மாதிரியின் திறன் தேவைகளை சரிபார்க்கவும்
```

## உதாரண வார்ப்புருக்கள்

### RAG உரையாடல் செயலி (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**சேவைகள்**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**விளக்கம்**: மிகவும் பிரபலமான Azure AI மாதிரி — உங்களுடைய ஆவணங்களை அடிப்படையாகக் கொண்டு கேள்விகள் கேட்க அனுமதிக்கும் தயாரிப்பு-தயார் RAG உரையாடல் செயலி. உரையாடலுக்கு GPT-4.1-mini, எம்பெட்டிங்குகளுக்கு text-embedding-3-large மற்றும் மீட்புக்கு Azure AI Search பயன்படுத்தப்படுகிறது. பலதரப்பட்ட ஆவணங்கள், கூறு மொழி உள்ளீடு/வெளியீடு, Microsoft Entra அங்கீகாரம் மற்றும் Application Insights தடம் மனைவழி ஆதரிக்கப்படுகிறது.

**விரைவு துவக்கம்:**
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG உரையாடல் செயலி (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**சேவைகள்**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**விளக்கம்**: Python RAG உரையாடல் மாதிரியின் .NET/C# சமமையான பதிப்பு. ASP.NET Core Minimal API மற்றும் Blazor WebAssembly முன் கணினி உடன் கட்டப்பட்டுள்ளது. குரல் உரையாடல், GPT-4o-mini vision ஆதரவு மற்றும் .NET MAUI Blazor Hybrid டெஸ்க்டாப்/மொபைல் கிளையன்ட் உடன் வருகிறது.

**விரைவு துவக்கம்:**
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG உரையாடல் செயலி (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**சேவைகள்**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**விளக்கம்**: Langchain4J ஐப் பயன்படுத்தி AI ஒழுங்கமைப்புக்கு Java பதிப்பு. மைக்ரோசேவைஸ் நிகழ்வு இயக்கவியல் கட்டமைப்பு, பல தேடல் உத்திகள் (உரை, வெக்டர், ஐக்கிய), Azure Document Intelligence மூலம் ஆவணப் பதிவேற்றம் மற்றும் Azure Container Apps அல்லது Azure Kubernetes Service இல் வெளியீடு ஆதரிக்கின்றன.

**விரைவு துவக்கம்:**
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**சேவைகள்**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**விளக்கம்**: Azure AI Foundry மற்றும் Prompty ஐ பயன்படுத்தி முழுமையான ரிட்டெயில் RAG கோபைலட். Contoso Outdoor விற்பனைக்கூடத்தின் தயாரிப்பு மற்றும் கஸ்டமர் ஆர்டர் தரவுகளில் அடிப்படைபடுத்தப்பட்ட பதில்களை வழங்கும் சிறப்பு உரையாடல் உதவியாளர். முழு GenAIOps வேலைப்பாட்டை காட்டுகிறது — Prompty உடன் முன்னோட்டம், AI-உதவியுடன் மதிப்பீடு மற்றும் AZD மூலம் Container Apps இற்கு வெளியீடு.

**விரைவு துவக்கம்:**
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**சேவைகள்**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**விளக்கம்**: Prompty உடன் AI முகவர் ஒழுங்கமைப்பை காண்பிக்கும் பல-முகவர் மாதிரி. ஆராய்ச்சி முகவர் (Bing Grounding in Azure AI Agent Service), தயாரிப்பு முகவர் (Azure AI Search), எழுத்தாளர் முகவர் மற்றும் திருத்துனர் முகவர் இணைந்து நன்கு ஆராயப்பட்ட கட்டுரைகளை உருவாக்குகின்றன. GitHub Actions இல் மதிப்பீடு உடைய CI/CD உடன் வருகிறது.

**விரைவு துவக்கம்:**
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**சேவைகள்**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**விளக்கம்**: LangChain.js ஐப் பயன்படுத்தி முழுமையாக சர்வர்-இல்லாத RAG உரையாடல் பொறி, API க்கு Azure Functions மற்றும் ஹோஸ்டிங்கிற்கு Azure Static Web Apps இன் மூலம். Azure Cosmos DB வெக்டர் ஸ்தானாகவும் உரையாடலின் வரலாறு தரவுத்தளமாகவும் பயன்படுகிறது. இலவச சோதனைக்காக Ollama உடன் உள்ளூர் வளர்ச்சியை ஆதரிக்கிறது.

**விரைவு துவக்கம்:**
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**சேவைகள்**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**விளக்கம்**: ஆவணங்கள் பதிவேற்றம்/மேலாண்மைக்கு நிர்வாக போர்டல் உடைய நிறுவன நிலை RAG தீர்வு ஸ்டார்ட்டர்; பல இணைநிலையமைப்புகள் (Semantic Kernel, LangChain, Prompt Flow), உரை-க்கு-தனி, Microsoft Teams ஒருங்கிணைப்பு மற்றும் PostgreSQL அல்லது Cosmos DB பின்புல தேர்வு ஆகியவை கொண்டது. தயாரிப்பு RAG காட்சிகளுக்கான தனிப்பயன் தொடக்கப் புள்ளியாக வடிவமைக்கப்பட்டுள்ளது.

**விரைவு துவக்கம்:**
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**சேவைகள்**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**விளக்கம்**: மூன்று கட்டமைப்புகளை (LangChain.js, LlamaIndex.TS, மற்றும் Microsoft Agent Framework) பயன்படுத்தி பல-முகவர் AI ஒழுங்கமைப்புக்கு குறிப்பிடுகோள் செயலி. நான்கு மொழிகளில் MCP (Model Context Protocol) சர்வர்கள் சர்வர்-இல்லாத Azure Container Apps ஆகவிருந்து OpenTelemetry கண்காணிப்புடன் வெளியிடப்படுகின்றன.

**விரைவு துவக்கம்:**
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**சேவைகள்**: Azure AI Services + Azure OpenAI

**விளக்கம்**: Azure AI சேவைகள் மற்றும் கலந்தமைக்கப்பட்ட மெஷின் லெர்னிங் மாடல்கள் கொண்டு வழங்கும் குறைந்தபட்ச Bicep வார்ப்புரை. முழு செயலி ஸ்டாக் இல்லாமல் Azure AI அடிப்படை குழாமை மட்டும் உருவாக்க வேண்டிய சமயங்களில் லைட்வெய்ட் தொடக்கப் புள்ளி.

**விரைவு துவக்கம்:**
```bash
azd init --template azd-ai-starter
azd up
```

> **மேலும் வார்ப்புருக்களை உலாவவும்**: 80+ AI-சார்ந்த AZD வார்ப்புருக்கள் மொழிகள் மற்றும் பயன்பாட்டு வழிகளுக்கு [அற்புத AZD AI வார்ப்புரு கல்லரி](https://azure.github.io/awesome-azd/?tags=ai) ஐப் பார்வையிடவும்.

## அடுத்த படிகள்

1. **உதாரணங்களை முயற்சி செய்யவும்**: உங்கள் பயன்பாட்டு நிலைக்கு பொருத்தமான முன்-கட்டமைக்கப்பட்ட வார்ப்புருவுடன் தொடங்கவும்
2. **உங்கள் தேவைகளுக்கு தனிப்பயம்செய்யவும்**: அடித்தளம் மற்றும் பயன்பாட்டு குறியீட்டை முறைத்துணை மாற்றவும்
3. **கண்காணிப்பை சேர்க்கவும்**: முழுமையான கவனிப்பு அமைப்பை செயல்படுத்தவும்
4. **செலவுகளை மேம்படுத்தவும்**: உங்கள் பட்ஜெட்டுக்கேற்ற மீதமுள்ள கட்டமைப்புகளை சரிசெய்தல்
5. **உங்கள் வெளியீட்டை பாதுகாப்பாக மாற்றவும்**: நிறுவன பாதுகாப்பு மாதிரிகளை செயல்படுத்தவும்
6. **உற்பத்திக்கு பரப்பளவிற்கு விரிவாக்கவும்**: பல மண்டல மற்றும் உயர்தர கிடைக்குமன்மை அம்சங்களை சேர்க்கவும்

## 🎯 கைமுறை பயிற்சிகள்

### பயிற்சி 1: Microsoft Foundry Models உரையாடல் செயலியை வெளியிடுதல் (30 நிமிடங்கள்)
**நோக்கம்**: தயாரிப்பு-தயார் AI உரையாடல் செயலியைவை வெளியிட்டு சோதனை செய்வது

```bash
# வார்ப்புருவை ஆரம்பிக்கவும்
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# சூழல் மாறிலிகளை அமைக்கவும்
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# வெளியிடவும்
azd up

# பயன்பாட்டை சோதிக்கவும்
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# ஏஐ செயல்பாடுகளை கண்காணிக்கவும்
azd monitor

# சுத்தம் செய்யவும்
azd down --force --purge
```

**வெற்றி அளவுகோல்கள்:**
- [ ] வெளியீடு அளவுகோல் பிழைகள் இல்லாமல் முடிகிறது
- [ ] உலாவியில் உரையாடல் இடைமுகத்தை அணுகலாம்
- [ ] கேள்விகள் கேட்டு AI-அதிக சக்தி பதில்களைப் பெற முடியும்
- [ ] Application Insights தொலைபேசி தரவுகளை காட்டுகிறது
- [ ] வளங்களை வெற்றிகரமாக அழித்தல் இயன்றது

**கனவிடப்பட்ட செலவு**: சோதனைக்கான 30 நிமிடத்திற்கு $5-10

### பயிற்சி 2: பல-மாதிரி வெளியீட்டை அமைத்தல் (45 நிமிடங்கள்)
**நோக்கம்**: பல்வேறு கட்டமைப்புகளுடன் பல AI மாடல்களை வெளியிடுதல்

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

# பதிவேற்று மற்றும் சரிபார்க்கவும்
azd provision
azd show
```

**வெற்றி அளவுகோல்கள்:**
- [ ] பல மாடல்கள் வெற்றிகரமாக வெளியிடப்பட்டுள்ளன
- [ ] வெவ்வேறு திறன் அமைப்புகள் பொருந்தியுள்ளன
- [ ] மாடல்கள் API மூலம் அணுகக்கூடியவையாக உள்ளன
- [ ] பயன்பாட்டிலிருந்து இரு மாடல்களையும் அழைக்கலாம்

### பயிற்சி 3: செலவு கண்காணிப்பு அமைத்தல் (20 நிமிடங்கள்)
**நோக்கம்**: பட்ஜெட் எச்சரிக்கை மற்றும் செலவு கண்காணிப்பை அமைத்தல்

```bash
# Bicep-க்கு பட்ஜெட் எச்சரிப்பைச் சேர்க்க
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

# பட்ஜெட் எச்சரிப்பை நிறுவு
azd provision

# தற்போதைய செலவுகளை சரிபார்க்க
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**வெற்றி அளவுகோல்கள்:**
- [ ] Azure இல் பட்ஜெட் எச்சரிக்கை உருவாக்கப்பட்டது
- [ ] மின் அஞ்சல் அறிவிப்புகள் ஏற்படுத்தப்பட்டன
- [ ] Azure போர்டலில் செலவு தரவுகளை பார்க்க முடிகிறது
- [ ] பட்ஜெட் எல்லைகள் சரியாக அமைக்கப்பட்டுள்ளன

## 💡 அடிக்கடி கேட்கப்படும் கேள்விகள்

<details>
<summary><strong>வளர்ச்சிக்காலத்தில் Microsoft Foundry Models செலவுகளை எப்படி குறைக்கலாம்?</strong></summary>

1. **Free Tier பயன்படுத்தவும்**: Microsoft Foundry Models மாதத்திற்கு 50,000 டோக்கன்கள் இலவசம் வழங்குகிறது
2. **திறன் குறைக்கவும்**: dev க்காக 30+ பதிலாக திறனை 10 TPM செட் செய்க
3. **azd down பயன்படுத்தவும்**: செயல்படாமல் இருக்கும் போது வளங்களை நீக்கி விடுங்கள்
4. **பதில்களை கேஷ் செய்யவும்**: மீண்டும் வரும் கேட்டல்களுக்கு Redis கேஷ் செயல்படுத்தவும்
5. **Prompt Engineering பயன்படுத்தவும்**: திறமையான prompts மூலம் டோக்கன் பயன்பாட்டை குறைக்கவும்

</details>
```bash
# வளர்ச்சி உள்ளமைவு
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models மற்றும் OpenAI API இல் என்ன வேறுபாடு?</strong></summary>

**Microsoft Foundry Models**:
- என்டர்பிரைஸ் பாதுகாப்பு மற்றும் பின்பற்றல்
- தனியார் நெட்வொர்க் ஒருங்கிணைப்பு
- SLA உத்தரவாதங்கள்
- மேலாண்மை அடையாள அங்கீகாரம்
- உயர்ந்த குவோட்டாக்கள் கிடைக்கும்

**OpenAI API**:
- புதிதாக உள்ள மாதிரிகளுக்கு விரைவான அணுகல்
- எளிமையான அமைப்பு
- நுழைவு தடையின் குறைவு
- பொது இணையத்திலேயே மட்டுமே

உற்பத்தி பயன்பாடுகளுக்கு, **Microsoft Foundry Models பரிந்துரைக்கப்படுகிறது**.
</details>

<details>
<summary><strong>Microsoft Foundry Models க்கான குவோட்டா மீறிய பிழைகளை நான் எப்படி கையாள்வது?</strong></summary>

```bash
# தற்போதைய குவோட்டாவை சரிபார்க்கவும்
az cognitiveservices usage list --location eastus2

# மறொரு பிராந்தியத்தை முயற்சிக்கவும்
azd env set AZURE_LOCATION westus2
azd up

# தற்காலிகமாக திறனைக் குறைக்கவும்
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# குவோட்டா உயர்வை கோரவும்
# Azure போர்டலுக்கு செல்லவும் > குவோட்டாக்கள் > உயர்வு கோரவும்
```
</details>

<details>
<summary><strong>Microsoft Foundry Models உடன் என் சொந்த தரவைக் பயன்படுத்தலாமா?</strong></summary>

ஆமாம்! RAG (Retrieval Augmented Generation) க்காக **Azure AI Search** ஐ பயன்படுத்துங்கள்:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

இந்த [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) டெம்ப்ளேட்டை பார்க்கவும்.
</details>

<details>
<summary><strong>AI மாதிரி எண்ட்பாயின்டுகளை நான் எப்படி பாதுகாப்பது?</strong></summary>

**சிறந்த நடைமுறைகள்**:
1. Managed Identity ஐப் பயன்படுத்தவும் (API விசைகள் இல்லை)
2. Private Endpoints ஐ செயல்படுத்தவும்
3. நெட்வொர்க் பாதுகாப்பு குழுக்களை கட்டமைக்கவும்
4. கோரிக்கை வேகத்தை கட்டுப்படுத்தவும்
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

## சமூகம் மற்றும் ஆதரவு

- **Microsoft Foundry Discord**: [#Azure சேனல்](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues மற்றும் விவாதங்கள்](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [அதிகாரப்பூர்வ ஆவணங்கள்](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh இல் Microsoft Foundry திறன்](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - உங்கள் எடிட்டரில் Azure + Foundry ஏஜென்ட் திறன்களை நிறுவ `npx skills add microsoft/github-copilot-for-azure` பயன்படுத்தவும்

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: அத்தியாயம் 2 - AI-முதலில் உருவாக்கம்
- **⬅️ Previous Chapter**: [அத்தியாயம் 1: உங்கள் முதல் திட்டம்](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI மாதிரி பிரயோகப்படுத்தல்](ai-model-deployment.md)
- **🚀 Next Chapter**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)

**உதவி வேண்டுமா?** எங்கள் சமூகவிவாதங்களில் சேரவும் அல்லது ரெப்பொசிட்டரியில் ஒரு issue திறக்கவும். Azure AI + AZD சமூகம் உங்கள் வெற்றிக்கு உதவ இங்கே உள்ளது!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு அறிவிப்பு**:
இந்த ஆவணம் [Co-op Translator](https://github.com/Azure/co-op-translator) என்ற AI மொழி பெயர்ப்புச் சேவையைப் பயன்படுத்தி மொழி பெயர்க்கப்பட்டது. நாம் துல்லியத்திற்காக முயற்சித்தாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது துல்லியக்குறைபாடுகள் இருக்கக்கூடும் என்பதை தயவுசெய்து கருத்தில் கொள்ளவும். அதன் சொந்த மொழியில் உள்ள மூல ஆவணம் அதிகாரபூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்தவொரு தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பேற்க மாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->