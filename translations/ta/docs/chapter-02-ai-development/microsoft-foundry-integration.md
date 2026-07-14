# மைக்ரோசாஃப்ட் ஃபவுன்ட்ரி ஒருங்கிணைப்பு AZD உடன்

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD புதிய பயனாளிகளுக்கு](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மை வளர்ச்சி
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 1: உங்கள் முதல் திட்டம்](../chapter-01-foundation/first-project.md)
- **➡️ அடுத்தது**: [AI மாதிரிகள் நிறைவேற்றல்](ai-model-deployment.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: அமைப்புகள்](../chapter-03-configuration/configuration.md)

## கண்ணோட்டம்

இந்த வழிகாட்டி Microsoft Foundry சேவைகளை Azure Developer CLI (AZD) உடன் ஒருங்கிணைத்து AI பயன்பாட்டுகளை எளிதாக்கி நிறுவுவதற்கான முறைகளை காட்டுகிறது. Microsoft Foundry, AI பயன்பாடுகள் உருவாக்க, உடனடி பராமரிப்புக்கான முழுமையான தளம் வழங்குகிறது, மற்றும் AZD கட்டமைப்பு மற்றும் நிறுவலை எளிமைப்படுத்துகிறது.

## Microsoft Foundry என்றால் என்ன?

Microsoft Foundry என்பது Microsoft-ன் ஐக்கியமான AI வளர்ச்சி தளம் ஆகும், இது உள்ளடக்கியது:

- **மாதிரி அகராதி**: अत्यাধुनिक AI மாதிரிகளுக்கு அணுகல்
- **ப்ராம்ட் ஃப்ளோ**: AI பணியிலக்க அட்டைப்பட வடிவமைப்பாளர்
- **Microsoft Foundry போர்டல்**: AI பயன்பாடுகளுக்கான ஒருங்கிணைந்த வளர்ச்சி சூழல்
- **நிறுவல் தேர்வுகள்**: பல்வேறு ஹோஸ்டிங் மற்றும் அளவுரு விருப்பங்கள்
- **பாதுகாப்பு மற்றும் பாதுகாப்பு**: பொறுப்பான AI அம்சங்கள் உள்ளடக்கம்

## AZD + Microsoft Foundry: ஒன்றிணைந்து சிறந்தவை

| அம்சம் | Microsoft Foundry | AZD ஒருங்கிணைப்பு நன்மை |
|---------|-----------------|------------------------|
| **மாதிரி நிறுவல்** | கைமுறை போர்டல் நிறுவல் | தானாகவும் மீண்டும் செய்யக்கூடிய நிறுவல்கள் |
| **இணையவழிச் கட்டமைப்பு** | கிளிக் மூலமாக ஒதுக்கீடு | Infrastructure as Code (Bicep) |
| **சூழல் மேலாண்மை** | ஒரே சூழல் கவனம் | பல சூழல்கள் (வளர்ச்சி/முதற்தபால்/உற்பத்தி) |
| **CI/CD ஒருங்கிணைப்பு** | வரம்பானது | நெடுவரிசையான GitHub Actions ஆதரவு |
| **செலவு மேலாண்மை** | அடிப்படை கண்காணிப்பு | சூழல்-சிறப்பான செலவு மேம்படுத்தல் |

## முன்னோடிகள்

- சொந்த உரிமைகள் உடைய Azure சந்தா
- Azure Developer CLI நிறுவியிருத்தல்
- Microsoft Foundry மாதிரிகள் சேவைகள் அணுகல்
- Microsoft Foundry பற்றிய அடிப்படை அறிமுகம்

> **தற்போதைய AZD அடிப்படை:** இந்த எடுத்துக்காட்டுகள் `azd` `1.27.1` வெளியீட்டுடன் சோதிக்கப்பட்டது. AI முகவர் பணிக் குறைக்கும் போது தற்போதைய முன்னோட்ட விரிவாக்க வெளியீட்டை பயன்படுத்தி உங்கள் நிறுவிய பதிப்பை ஆரம்பிப்பதற்கு முன் சரிபார்க்கவும்.

## கோர் ஒருங்கிணைப்பு மாதிரிகள்

### மாதிரி 1: Microsoft Foundry Models ஒருங்கிணைப்பு

**பயன்பாடு**: Microsoft Foundry Models மாதிரிகளுடன் உரையாடல் பயன்பாடுகளை பின்வற்றல்

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

**இணையவழிச் கட்டமைப்பு (main.bicep):**
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

### மாதிரி 2: AI தேடல் + RAG ஒருங்கிணைப்பு

**பயன்பாடு**: பெறுபேறு-கருத்துப்படுத்தும் தலைமுறை (RAG) பயன்பாடுகளை பின்வற்றல்

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

### மாதிரி 3: ஆவண বுத்தி ஒருங்கிணைப்பு

**பயன்பாடு**: ஆவண செயல்முறை மற்றும் பகுப்பாய்வு பணிகள்

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

## 🔧 அமைப்பு மாதிரிகள்

### சூழல் மாறிகள் அமைப்பு

**உற்பத்தி அமைப்பு:**
```bash
# மைய கூற்றுக் கலை சேவைகள்
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# மாதிரி கட்டமைப்புகள்
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# செயல்திறன் அமைப்புகள்
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**வளர்ச்சி அமைப்பு:**
```bash
# மேம்பாட்டுக்கான செலவு-உத்தரவாத அமைப்புகள்
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # இலவச பருவம்
```

### முக்கியக் குவால்ட் கொண்டு பாதுகாப்பான அமைப்பு

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

## நிறுவல் பணிகள்

### Foundry க்கான AZD விரிவாக்கங்கள்

AZD Microsoft Foundry சேவைகளுடன் வேலை செய்ய AI விருப்பங்களைச் சேர்க்கும் விரிவாக்கங்கள் வழங்குகிறது:

```bash
# Foundry ஏஜென்ட்கள் விரிவாக்கத்தை நிறுவவும்
azd extension install azure.ai.agents

# நுணுக்கமாக்கல் விரிவாக்கத்தை நிறுவவும்
azd extension install azure.ai.finetune

# தனிப்பயன் மாதிரிகள் விரிவாக்கத்தை நிறுவவும்
azd extension install azure.ai.models

# நிறுவப்பட்ட விரிவாக்கங்களை பட்டியலிடவும்
azd extension list --installed

# தற்போது நிறுவப்பட்ட ஏஜென்ட் விரிவாக்க பதிப்பை பரிசீலிக்கவும்
azd extension show azure.ai.agents
```

AI விரிவாக்கங்கள் இன்னும் முன்னோட்ட நிலையில் விரைவாகப் பயணிக்கின்றன. ஒரு கட்டளை இதில் காட்டியதற்கு மாறாக நடந்தால் தொடர்புடைய விரிவாக்கத்தை மேம்படுத்தி பிறகு திட்டத்தை சரி பார்க்கவும்.

### `azd ai` உடன் முகவர் முதலிலை நிறுவல்

உங்கள் கைப்பிரதி அறிக்கை இருந்தால் `azd ai agent init` பயன்படுத்தி Foundry Agent சேவைக்கான திட்டத்தை உருவாக்கவும்:

```bash
# ஒரு முகவர் அறிக்கையிடல் தகவலிலிருந்து ஆரம்பிக்கவும்
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure-க்கு பிரசாரம் செய்யவும்
azd up
```

சமீபத்திய `azure.ai.agents` முன்னோட்ட வெளியீடுகள் `azd ai agent init` இற்கான வார்ப்புரு அடிப்படையிலான துவக்க ஆதரவைச் சேர்த்துள்ளன. புதிய முகவர் மாதிரிகளை பின்தொடரின், உங்கள் நிறுவிய பதிப்பில் உள்ள பக்கவிளைவுகளை சரிபார்க்க விரிவாக்க உதவியை பாருங்கள்.

முழுமையான கட்டளை குறிப்பு மற்றும் கொடியை [AZD AI CLI கட்டளைகள்](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) இல் காணவும்.

### ஒரே கட்டளை நிறுவல்

```bash
# ஒரேயொரு கட்டளையுடன் அனைத்தையும் தளம் அமைக்கவும்
azd up

# அல்லது படிப்படியாக தளம் அமைக்கவும்
azd provision  # கட்டமைப்பு மட்டும்
azd deploy     # பயன்பாடு மட்டும்

# azd 1.23.11+ இல் நீண்டகாலம் இயக்கும் AI பயன்பாடு தளம் அமைப்புகளுக்கு
azd deploy --timeout 1800
```

### சூழல்-சார்ந்த நிறுவல்கள்

```bash
# வளர்ப்பு சுற்றுச்சூழல்
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# தயாரிப்பு சுற்றுச்சூழல்
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## கண்காணிப்பு மற்றும் கவனிப்புக் குணாதிசயங்கள்

### ஆப்ரிகேஷன் இன்ஸைட்ஸ் ஒருங்கிணைப்பு

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

## செயல்திறன் மேம்படுத்தல்

### தற்காலிக சேமிப்பு (Cache) கொள்கைகள்

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

### தானாக அளவை மாற்றும் அமைப்பு

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

## பொதுவான சிக்கல்கள் தீர்வு

### சிக்கல் 1: OpenAI ஒதுக்கீடு (Quota) கடந்தது

**அறிகுறிகள்:**
- நிறுவல் ஒதுக்கீடு பிழைகளால் தோல்வியடையும்
- பயன்பாட்டு பதிவுகளில் 429 பிழைகள்

**தீர்வுகள்:**
```bash
# தற்போதைய குவோட்டா பயன்பாட்டை சரிபார்க்கவும்
az cognitiveservices usage list --location eastus

# வேறொரு பிராந்தியத்தை முயற்சிக்கவும்
azd env set AZURE_LOCATION westus2
azd up

# தற்காலிகமாக திறனை குறைக்கவும்
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### சிக்கல் 2: அங்கீகார தோல்விகள்

**அறிகுறிகள்:**
- AI சேவைகளை அழைக்கும் போது 401/403 பிழைகள்
- "அணுகல் மறுக்கப்பட்டது" செய்திகள்

**தீர்வுகள்:**
```bash
# பங்கு ஒதுக்கீடுகளை சரிபார்க்கவும்
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# நிர்வகிக்கப்படும் அடையாளக் கட்டமைப்பை சரிபார்க்கவும்
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# முக்கிய வேல்ட் அணுகலைச் சரிபார்க்கவும்
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### சிக்கல் 3: மாதிரி நிறுவல் சிக்கல்கள்

**அறிகுறிகள்:**
- மாதிரிகள் நிறுவலில் கிடைக்கவில்லை
- குறிப்பிட்ட மாதிரி பதிப்புகள் தோல்வியடைகின்றன

**தீர்வுகள்:**
```bash
# பிராந்தியத்தின் அடிப்படையில் கிடைக்கும் மாதிரிகளை பட்டியலிடுக
az cognitiveservices model list --location eastus

# பைசெப் மாதிரியில் மாதிரி பதிப்பை புதுப்பிக்கவும்
# மாதிரியின் திறன் தேவைகளை சரிபார்க்கவும்
```

## எடுத்துக்காட்டு வார்ப்புருக்கள்

### RAG உரையாடல் பயன்பாடு (Python)

**காப்பகம்**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**சேவைகள்**: Azure OpenAI + Azure AI தேடல் + Azure கன்டெய்னர் பயன்பாடுகள் + Azure Blob சேமிப்பு

**விளக்கம்**: மிகவும் பிரபலமான Azure AI மாதிரி — உங்களுடைய ஆவணங்களில் கேள்விகள் கேட்கக் கூடிய தயார்படுத்தப்பட்ட RAG உரையாடல் பயன்பாடு. உரையாடலுக்கு GPT-4.1-mini, உறவுகளுக்கு text-embedding-3-large, மற்றும் Azure AI தேடலுக்கு retrieval பயன்படுத்துகிறது. பல்வகை ஆவணங்கள், பேச்சு உள்ளீடு/வெளியீடு, Microsoft Entra அங்கீகாரம் மற்றும் Application Insights கண்காணிப்பு ஆதரிக்கப்படுகிறது.

**தற்போது தொடக்கம்**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG உரையாடல் (.NET)

**காப்பகம்**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**சேவைகள்**: Azure OpenAI + Azure AI தேடல் + Azure கன்டெய்னர் பயன்பாடுகள் + Semantic Kernel

**விளக்கம்**: Python RAG உரையாடல் மாதிரியின் .NET/C# சமமானது. ASP.NET Core Minimal API மற்றும் Blazor WebAssembly முன் கடைசி வலைப்பக்கத்துடன் கட்டப்பட்டது. குரல் உரையாடல், GPT-4o-mini காணொலி ஆதரவு மற்றும் .NET MAUI Blazor ஹைபிரிட் டெஸ்க்டாப்/மொபைல் கிளையண்டும் உள்ளது.

**தற்போது தொடக்கம்**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG உரையாடல் (Java)

**காப்பகம்**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**சேவைகள்**: Azure OpenAI + Azure AI தேடல் + Azure கன்டெய்னர் பயன்பாடுகள் / AKS + Langchain4J + Azure Cosmos DB

**விளக்கம்**: Langchain4J பயன்படுத்தி AI ஒழுங்கமைப்புடன் ஜாவா பதிப்பு. மைக்ரோசர்வீஸ் நிகழ்வு சம்பந்தப்பட்ட அமைப்பு, பல தேடல் முறைகள் (உரை, வெக்டர், ஹைப்பிரிட்), Azure ஆவண ஞானத்தைப் பயன்படுத்தி ஆவணப் பதிவேற்றம் மற்றும் Azure கன்டெய்னர் பயன்பாடுகள் அல்லது Azure குபேர்நெட்டிஸ் சேவையில் நிறுவல் ஆதரவு.

**தற்போது தொடக்கம்**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### எண்டர்பிரைஸ் ரீட்டெயில் கூட்டாளி Microsoft Foundry உடன்

**காப்பகம்**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**சேவைகள்**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI தேடல் + Azure கன்டெய்னர் பயன்பாடுகள் + Azure Cosmos DB

**விளக்கம்**: Microsoft Foundry மற்றும் Prompty பயன்படுத்திய முடிவடையுள்ள வணிக RAG கூட்டாளி. Contoso Outdoor வணிக உரையாடல் பொறி, தயாரிப்பு அகராதி மற்றும் வாடிக்கையாளர் ஆர்டர் தரவுகளில் பதில்களை அடிப்படையாக கொண்டது. முழு GenAIOps பணிக் குறைக்கும் முறையை காட்டுகிறது — Prompty கொண்டு உருவாக்கல், AI-ஆல உதவி மதிப்பீட்டாளர்களுடன் மதிப்பீடு மற்றும் AZD வழியாக கன்டெய்னர் பயன்பாடுகளில் நிறுவல்.

**தற்போது தொடக்கம்**:
```bash
azd init --template contoso-chat
azd up
```

### படைப்பூக்க எழுத்து பல முகவர் பயன்பாடு

**காப்பகம்**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**சேவைகள்**: Azure OpenAI + Azure AI முகவர் சேவை + Bing பிணைப்பு + Azure AI தேடல் + Azure கன்டெய்னர் பயன்பாடுகள்

**விளக்கம்**: Prompty உடன் AI முகவர் ஒழுங்கமைப்பை காட்டும் பல முகவர் மாதிரி. ஆராய்ச்சி முகவர் (Bing பிணைப்பு Azure AI முகவர் சேவையில்), தயாரிப்பு முகவர் (Azure AI தேடல்), எழுத்தாளர் முகவர் மற்றும் தொகுத்திருத்துகாரர் முகவர் சேர்ந்து நன்கு ஆராய்ச்சி செய்யப்பட்ட கட்டுரைகளை உருவாக்கி வழங்குதல். GitHub Actions இல் மதிப்பீடு செய்யும் CI/CD உடன்.

**தற்போது தொடக்கம்**:
```bash
azd init --template contoso-creative-writer
azd up
```

### சர்வர்லெஸ் RAG உரையாடல் (JavaScript/TypeScript)

**காப்பகம்**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**சேவைகள்**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**விளக்கம்**: முழுமையாக சர்வர்லெஸ் RAG உரையாடல் பொறி LangChain.js மற்றும் Azure Functions API மற்றும் Azure Static Web Apps ஹோஸ்டிங்குடன். Azure Cosmos DB வெக்டர் ஷாப்பிங் மற்றும் உரையாடல் வரலாறு தரவுத்தளமாக பயன்படுத்தப்படுகிறது. Ollama மூலம் உள்ளூர் வளர்ச்சிக்கு பூஜ்ஜிய செலவில்லா சோதனை ஆதரவு வழங்குகிறது.

**தற்போது தொடக்கம்**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### உங்கள் தரவுடன் உரையாடல் வினை வேகம்

**காப்பகம்**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**சேவைகள்**: Azure OpenAI + Azure AI தேடல் + Azure பயன்பாட்டு சேவை + Azure ஆவண ஞான் + Azure Functions + Azure Cosmos DB / PostgreSQL

**விளக்கம்**: ஆவணப் பதிவேற்றம்/மேலாண்மைக்கான நிர்வாக போர்டல்கள், பல ஒழுங்கமைப்பாளர் விருப்பங்கள் (Semantic Kernel, LangChain, Prompt Flow), பேச்சு உரை மாற்றல், Microsoft Teams ஒருங்கிணைப்பு மற்றும் PostgreSQL அல்லது Cosmos DB பின்புலத்துடன் கூடிய நிறுவன தர RAG தீர்வு வேகமாக்கி. உற்பத்தி RAG சூழல்களுக்கு தனிப்பயன்படுத்தக்கூடிய துவக்கக் கொள்கைப்பட வடிவமைக்கப்பட்டுள்ளது.

**தற்போது தொடக்கம்**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI பயண முகவர்கள் — பல முகவர் MCP ஒழுங்கமைப்பு

**காப்பகம்**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**சேவைகள்**: Azure OpenAI + Microsoft Foundry + Azure கன்டெய்னர் பயன்பாடுகள் + MCP சர்வர்கள் (.NET, Python, Java, TypeScript)

**விளக்கம்**: மூன்று கட்டமைப்புகள் (LangChain.js, LlamaIndex.TS மற்றும் Microsoft Agent Framework) கொண்டு பல முகவர் AI ஒழுங்கமைப்புக்கான குறிப்பு பயன்பாடு. நான்கு மொழிகளில் MCP (மாதிரி சூழல் நியமன) சர்வர்கள் சர்வேஷ் Azure கன்டெய்னர் பயன்பாடுகளாக நடப்பு கீழ் OpenTelemetry கண்காணிப்புடன்.

**தற்போது தொடக்கம்**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI தொடக்கக்கலைஞர்

**காப்பகம்**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**சேவைகள்**: Azure AI சேவைகள் + Azure OpenAI

**விளக்கம்**: இயந்திரக் கற்றல் மாதிரிகளுடன் Azure AI சேவைகளை நிறுவும் மிக எளிய Bicep வார்ப்புரு. முழு பயன்பாட்டு தொகுப்பின்றி Azure AI வலைப்பின்னல் மட்டுமே தேவைப்படும் போது உதவும்.

**தற்போது தொடக்கம்**:
```bash
azd init --template azd-ai-starter
azd up
```

> **மேலும் வார்ப்புருக்களை உலாவவும்**: மொழிகள் மற்றும் சூழல்களுக்கான 80+ AI சார்ந்த AZD வார்ப்புருக்கள் `[Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai)` இல் காணவும்.

## அடுத்த படிகள்

1. **எடுத்துக்காட்டுகளை முயற்சி செய்யவும்**: உங்கள் பயன்பாட்டிற்கேற்ற முன்னொட்டி மாதிரியைத் தேர்வு செய்யவும்
2. **உங்கள் தேவைகள் படி மாற்றவும்**: கட்டமைப்பு மற்றும் செயலியை மாற்றவும்
3. **கண்காணிப்பை சேர்க்கவும்**: விரிவான கவனிப்பு அமலகாண புதிய பணிகளைச் செயல்படுத்தவும்
4. **செலவுகளை மேம்படுத்தவும்**: உங்கள் பட்ஜெட்டுக்கேற்ற அமைப்புகளை தெளிவுபடுத்தவும்
5. **உங்கள் நிறுவலை பாதுகாப்பாக வைத்திருக்கும்**: நிறுவன பாதுகாப்பு முறைமைகள் நிலைத்திடவும்
6. **உற்பத்திக்கு அளவு மேம்படுத்தவும்**: பல பிரதேச மற்றும் உயர் கிடைக்கும் பண்புகளைச் சேர்க்கவும்

## 🎯 கையாள் பயிற்சிகள்

### பயிற்சி 1: Microsoft Foundry மாதிரிகள் உரையாடல் பயன்பாடு நிறுவல் (30 நிமிடங்கள்)
**நோக்கம்**: தயார்படுத்துத்தக்க AI உரையாடல் பயன்பாட்டை நிறுவி சோதனை செய்தல்

```bash
# மாதிரியை துவங்கவும்
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# சூழல் மாறிலிகளை செட் செய்யவும்
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# நடைமுறைப்படுத்தவும்
azd up

# பயன்பாட்டை சோதிக்கவும்
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# செயற்கை நுண்ணறிவு செயல்பாடுகளை கண்காணிக்கவும்
azd monitor

# சுத்தம் செய்யவும்
azd down --force --purge
```

**வெற்றி அளவுகோல்கள்:**
- [ ] ஒதுக்கீடு பிழைகள் இல்லாமல் நிறுவல் முடியும்
- [ ] உலாவியில் உரையாடல் இடைமுகம் அணுகக்கூடியது
- [ ] கேள்விகள் கேட்டு AI சக்தியுடன் பதில்கள் பெற முடியும்
- [ ] செயலியின் புரிந்துறைமை தரவு காட்டுகிறது
- [ ] வளங்கள் வெற்றிகரமாக சுத்தம் செய்யப்பட்டது

**கணக்கிடப்பட்ட செலவு**: 30 நிமிட சோதனைக்கு $5-10

### பயிற்சி 2: பல மாதிரியான நிறுவல் அமைத்தல் (45 நிமிடங்கள்)
**நோக்கம்**: பல வெவ்வேறு அமைப்புகளுடன் பல AI மாதிரிகள் நிறுவல்

```bash
# தனிப்பயன் பைசெப் கட்டமைப்பை உருவாக்கவும்
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

# டிப்ளாய் செய்து சரிபார்க்கவும்
azd provision
azd show
```

**வெற்றி அளவுகோல்கள்:**
- [ ] பல மாதிரிகள் வெற்றிகரமாக நிறுவப்பட்டன
- [ ] வெவ்வேறு திறன்கள் அமைக்கப்பட்டுள்ளன
- [ ] API மூலமாக மாதிரிகள் அணுகக்கூடியவை
- [ ] செயலியில் இரண்டையும் அழைக்க முடியும்

### பயிற்சி 3: செலவு கண்காணிப்பு செயல்படுத்தல் (20 நிமிடங்கள்)
**நோக்கம்**: பட்ஜெட் அலர்ட்கள் மற்றும் செலவு கண்காணிப்பை அமைத்தல்

```bash
# Bicepக்கு பட்ஜெட் எச்சரிக்கையைச் சேர்க்கவும்
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
- [ ] Azure இல் பட்ஜெட் அலர்ட் உருவாக்கப்பட்டது
- [ ] மின்னஞ்சல் அறிவிப்புகள் அமைக்கப்பட்டன
- [ ] Azure போர்டலில் செலவு தரவு பார்க்க முடியும்
- [ ] பட்ஜெட் எல்லைகள் சரியான முறையில் அமைக்கப்பட்டன

## 💡 அடிக்கடி கேட்கப்பட்ட கேள்விகள்

<details>
<summary><strong>Microsoft Foundry Models வளம்முறை வளர்ச்சிக்கালে செலவுகளை எப்படி குறைப்பது?</strong></summary>

1. **இலவச தகுதிகூட்டையை பயன்படுத்தவும்**: Microsoft Foundry மாதிரிகள் மாதம் 50,000 டோக்கன்கள் இலவசமாக வழங்குகிறது
2. **திறன்களை குறைக்கவும்**: வளர்ச்சிக்கான TPM (Token Per Minute) எண்ணிக்கை 30+ இல் சேர்க்காமல் 10 ஆக அமைக்கவும்
3. **azd down கமாண்டு பயன்படுத்தவும்**: செயல்பாட்டில் இல்லாதப்போது வளங்களை விடுவிக்கவும்
4. **பதில்களை தற்காலிக சேமிப்பில் வைக்கவும்**: மீண்டும் கேட்கப்படும் கேள்விகளுக்கு Redis கேச் செயல்படுத்தவும்
5. **ப்ராம்ட் உத்தி பயன்படுத்தவும்**: திறமையான ப்ராம்ட் முறைகளால் டோக்கன் பயன்பாட்டை குறைக்கவும்


```bash
# வளர்ச்சி அமைப்பு
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry மாதிரிகளும் OpenAI API உம் என்ன வேறுபாடு?</strong></summary>

**Microsoft Foundry மாதிரிகள்**:
- நிறுவன பாதுகாப்பு மற்றும் உத்தரவாதங்கள்
- தனிப்பட்ட நெட்வொர்க் ஒருங்கிணைப்பு
- SLA உத்தரவாதங்கள்
- நிர்வகிக்கப்படும் அடையாள அங்கீகாரம்
- அதிகமான குறியீடுகள் கிடைக்கின்றன

**OpenAI API**:
- புதிய மாதிரிகளுக்கான வேகமான அணுகல்
- எளிமையான அமைப்பு
- குறைந்த நுழைவு தடைகள்
- பொதுவான இன்டர்நெட் மட்டும்

தயாரிப்பு பயன்பாடுகளுக்காக, **Microsoft Foundry மாதிரிகள் பரிந்துரைக்கப்படுகின்றன**.
</details>

<details>
<summary><strong>Microsoft Foundry மாதிரிகள் குறியீடு தாண்டிய பிழைகளை நான் எப்படி கையாள்வது?</strong></summary>

```bash
# தற்போதைய பயன்மீதியை சோதிக்கவும்
az cognitiveservices usage list --location eastus2

# வேறு பகுதியை முயற்சிக்கவும்
azd env set AZURE_LOCATION westus2
azd up

# திறனைக் குறைக்கும் தற்காலிகமாக
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# பயன்மீதி அதிகரிப்பை கோரி
# Azure போர்ட்டல் > பயன்மீதிகள் > அதிகரிப்பை கோர செல்லவும்
```
</details>

<details>
<summary><strong>Microsoft Foundry மாதிரிகளுடன் என் சொந்த தரவை பயன்படுத்தலாமா?</strong></summary>

ஆம்! RAG (Retrieval Augmented Generation) க்கு **Azure AI Search** பயன்படுத்தவும்:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) வடிவமைப்பைப் பார்க்கவும்.
</details>

<details>
<summary><strong>AI மாதிரி முடிவுகளை நான் எப்படி பாதுகாப்பதாக வைக்க வேண்டும்?</strong></summary>

**சிறந்த நடைமுறைகள்**:
1. நிர்வகிக்கப்படும் அடையாளத்தை பயன்படுத்தவும் (API விசைகள் இல்லை)
2. தனிப்பட்ட முடிவுநிலையங்களை இயக்கவும்
3. நெட்வொர்க் பாதுகாப்பு குழுக்களை கட்டமைக்கவும்
4. வீதக் கட்டுப்பாட்டை அமல்படுத்தவும்
5. மறைமுக விசைகளுக்காக Azure Key Vault ஐ பயன்படுத்தவும்

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
- **AZD GitHub**: [பிரச்சனைகள் மற்றும் விவாதங்கள்](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [அதிகாரப் பத்திரிகை](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh தளத்தில் Microsoft Foundry திறன்](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - உங்கள் ஆசிரியர் தொகுப்பில் Azure + Foundry முகவர் திறன்களை `npx skills add microsoft/github-copilot-for-azure` மூலம் நிறுவவும்

---

**அத்தியாயம் வழிசெலுத்தல்:**
- **📚 பாடத்திட்ட முகப்பு**: [AZD தொடக்கக்காரர்கள்](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI முதன்மை மேம்பாடு
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 1: உங்கள் முதல் திட்டம்](../chapter-01-foundation/first-project.md)
- **➡️ அடுத்தது**: [AI மாதிரி வெளியீடு](ai-model-deployment.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)

**உதவி வேண்டுமா?** எங்கள் சமூகக் கலந்துரையாடல்களில் கலந்து கொள்ள거나 அல்லது வளக்கோப்பில் ஒரு பிரச்சனையை திறக்கவும். Azure AI + AZD சமூகமும் உங்கள் வெற்றிக்காக இருக்கிறது!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->