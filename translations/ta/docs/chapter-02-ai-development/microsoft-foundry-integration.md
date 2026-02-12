# Microsoft Foundry-ஐ AZD உடன் ஒருங்கிணைவு

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: Chapter 2 - AI-First Development
- **⬅️ முந்தைய அத்தியாயம்**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 அடுத்த அத்தியாயம்**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## கண்ணோட்டம்

இந்த கையேடு Microsoft Foundry சேவைகளை Azure Developer CLI (AZD) உடன் ஒருங்கிணைத்து AI பயன்பாடுகளை எளிதாக வினியோகிப்பது எப்படி என்பதை விளக்குகிறது. Microsoft Foundry AI பயன்பாடுகளை உருவாக்க, வினியோகிக்க மற்றும் மேலாண்மை செய்வதற்கான ஒரு சர்வேசி தளம் வழங்குகிறது, அதேசமயம் AZD அடித்தளம் மற்றும் வினியோகம் செயல்முறையை எளிதாக்குகிறது.

## Microsoft Foundry என்றால் என்ன?

Microsoft Foundry என்பது Microsoft-இன் ஒருங்கிணைந்த AI மேம்பாட்டு தளம் ஆகும், இதில் உள்ளது:

- **Model Catalog**: சிறந்த நிலை AI மாதிரிகளுக்கு அணுகல்
- **Prompt Flow**: AI வேலைநெறிகளுக்கான காட்சி வடிவமைப்பாளர்
- **AI Foundry Portal**: AI பயன்பாடுகளுக்கான ஒருங்கிணைந்த மேம்பாட்டு சூழல்
- **Deployment Options**: பலஹர சேவைத்தவற் மற்றும் அளவீட்டு விருப்பங்கள்
- **Safety and Security**: உட்படுத்தப்பட்ட பொறுப்பான AI அம்சங்கள்

## AZD + Microsoft Foundry: இணைந்து சிறந்தவை

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## முன்நிபந்தனைகள்

- சரியான அனுமதிகளுடன் Azure subscription
- Azure Developer CLI நிறுவப்பட்டிருக்க வேண்டும்
- Azure OpenAI சேவைகளுக்கான அணுகல்
- Microsoft Foundry உடன் அடிப்படை பரிச்சயம்

## முக்கிய ஒருங்கிணைவு மாதிரிகள்

### மாதிரி 1: Azure OpenAI ஒருங்கிணைவு

**பயன்பாட்டு விவரம்**: Azure OpenAI மாதிரிகளுடன் உரையாடல் பயன்பாடுகளை வினியோகிக்க

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

### மாதிரி 2: AI Search + RAG ஒருங்கிணைவு

**பயன்பாட்டு விவரம்**: retrieval-augmented generation (RAG) பயன்பாடுகளை வினியோகிக்க

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

### மாதிரி 3: Document Intelligence ஒருங்கிணைவு

**பயன்பாட்டு விவரம்**: ஆவண செயலாக்கம் மற்றும் பகுப்பாய்வு வேலைநெறிகள்

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

### சுற்றுச்சூழல் மாறிகள் அமைப்பு

**தயாரிப்பு கட்டமைப்பு:**
```bash
# முக்கிய ஏஐ சேவைகள்
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# மாடல் கட்டமைப்புகள்
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# செயல்திறன் அமைப்புகள்
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**வளர்ச்சிக்கான கட்டமைப்பு:**
```bash
# வளர்ச்சிக்கான செலவுக்கு ஒழுங்குபடுத்தப்பட்ட அமைப்புகள்
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # இலவச அடுக்கு
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

## வினியோக வேலைநெறிகள்

### ஒரே கட்டளையில் வினியோகம்

```bash
# ஒரே கட்டளையால் அனைத்தையும் வெளியிடவும்
azd up

# அல்லது படிப்படியாக வெளியிடவும்
azd provision  # அடித்தள கட்டமைப்பு மட்டும்
azd deploy     # விண்ணப்பம் மட்டும்
```

### சுற்றுச்சூழல்-சார்ந்த வினியோகங்கள்

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

## கண்காணிப்பு மற்றும் கண்டறிதல்

### Application Insights ஒருங்கிணைவு

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

### Managed Identity கட்டமைப்பு

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

## திறன் மேம்பாடு

### கேஷிங் முறைமைகள்

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

### தானாக அளவை மாற்றும் கட்டமைப்பு

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

## பொதுவான பிரச்சினைகளை தீர்க்கும் வழிமுறைகள்

### பிரச்சினை 1: OpenAI கொட்டா (Quota) மீறல்

**அறிகுறிகள்:**
- கொட்டா பிழைகளுடன் வினியோகம் தோல்வியடையிறது
- பயன்பாட்டு பதிவுகளில் 429 பிழைகள்

**தீர்வுகள்:**
```bash
# தற்போதைய வரம்பு பயன்பாட்டைச் சரிபார்க்கவும்
az cognitiveservices usage list --location eastus

# வேறு மண்டலத்தை முயற்சி செய்யவும்
azd env set AZURE_LOCATION westus2
azd up

# தற்காலிகமாக திறனை குறைக்கவும்
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### பிரச்சினை 2: அங்கீகார தோல்விகள்

**அறிகுறிகள்:**
- AI சேவைகளுக்கு அழைக்கும் போது 401/403 பிழைகள்
- "Access denied" செய்தியுகள்

**தீர்வுகள்:**
```bash
# பங்கு ஒதுக்கீடுகளை சரிபார்க்க
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# நிர்வகிக்கப்பட்ட அடையாளத்தின் கட்டமைப்பை சரிபார்க்க
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault அணுகலை சரிபார்க்க
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### பிரச்சினை 3: மாடல் வினியோகம் பிரச்சினைகள்

**அறிகுறிகள்:**
- வினியோகம் செய்யப்பட்ட மாதிரிகள் கிடைக்கவில்லை
- குறிப்பிட்ட மாடல் பதிப்புகள் தோல்வி அடைகின்றன

**தீர்வுகள்:**
```bash
# பிராந்தியங்களின் அடிப்படையில் கிடைக்கக்கூடிய மாதிரிகளை பட்டியலிடவும்
az cognitiveservices model list --location eastus

# bicep டெம்ப்ளேட்டில் மாதிரி பதிப்பை புதுப்பிக்கவும்
# மாதிரியின் திறன் தேவைகளை சரிபார்க்கவும்
```

## உதாரண டெம்ப்ளேட்டுகள்

### அடிப்படை உரையாடல் பயன்பாடு

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**சேவைகள்**: Azure OpenAI + Cognitive Search + App Service

**துரித ஆரம்பம்**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### ஆவண செயலாக்க குழாய்ப்பாதை

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**சேவைகள்**: Document Intelligence + Storage + Functions

**துரித ஆரம்பம்**:
```bash
azd init --template ai-document-processing
azd up
```

### நிறுவன உரையாடல் (RAG உடன்)

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**சேவைகள்**: Azure OpenAI + Search + Container Apps + Cosmos DB

**துரித ஆரம்பம்**:
```bash
azd init --template contoso-chat
azd up
```

## அடுத்த படிகள்

1. **உதாரணங்களை முயற்சிக்கவும்**: உங்கள் பயன்பாட்டு தேவைக்கு பொருந்தும் முன்பமைக்கப்பட்ட டெம்ப்ளேட்டை தொடங்கவும்
2. **உங்கள் தேவைகளுக்கு 맞게 மாற்றவும்**: அடித்தளம் மற்றும் பயன்பாட்டு குறியீட்டை மாற்றவும்
3. **கண்காணிப்பை சேர்க்கவும்**: முழுமையான கண்காணிப்பு அம்சங்களை செயல்படுத்தவும்
4. **செலவுகளை 최적화 செய்யவும்**: உங்கள் பட்ஜெட்டிற்கு ஏற்ப கட்டமைப்புகளை ஈட்டுங்கள்
5. **வினியோகத்தை பாதுகாக்கவும்**: நிறுவனக் பாதுகாப்பு வடிவமைப்புகளை செயல்படுத்தவும்
6. **தயாரிப்புக்குத் தகுதிசெய்யவும்**: பல பிரதேச மற்றும் உயர் கிடைக்கும் தன்மைகளை சேர்க்கவும்

## 🎯 கையடக்க பயிற்சிகள்

### பயிற்சி 1: Azure OpenAI உரையாடல் செயலியை வினியோகம் செய் (30 நிமிடம்)
**நோக்கம்**: தயாரிப்பு-உரிய AI உரையாடல் செயலியை வினியோகம் செய்து சோதனை பண்ணுதல்

```bash
# வார்ப்புருவை ஆரம்பிக்கவும்
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# சூழல் மாறிலிகளை அமைக்கவும்
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# நிறுவவும்
azd up

# பயன்பாட்டைப் பரிசோதிக்கவும்
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# செயற்கை நுண்ணறிவின் செயல்பாடுகளை கண்காணிக்கவும்
azd monitor

# சுத்தம் செய்யவும்
azd down --force --purge
```

**வெற்றி அளவுகோல்கள்:**
- [ ] வினியோகம் கொட்டா பிழைகள் இல்லாமல் முடிவடைகிறது
- [ ] உலாவியில் உரையாடல் இடைமுகத்தை அணுக முடியும்
- [ ] கேள்விகள் கேட்டு AI-ஆல் பதில்கள் பெற முடிகிறது
- [ ] Application Insights டெலிமெட்ரி தரவுகளை காட்டுகிறது
- [ ] மூலப்பொருட்களை வெற்றிகரமாக சுத்தம் செய்துள்ளது

**கணிக்கப்பட்ட செலவு**: $5-10 30 நிமிட பரிசோதனைக்காக

### பயிற்சி 2: பல-மாடல் வினியோகத்தை கட்டமைக்க (45 நிமிடம்)
**நோக்கம்**: வேறுபட்ட கட்டமைப்புகளுடன் பல AI மாதிரிகளை வினியோகம் செய்தல்

```bash
# தனிப்பயன் Bicep கட்டமைப்பை உருவாக்கவும்
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
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
- [ ] பல மாதிரிகள் வெற்றிகரமாக வினியோகிக்கப்பட்டன
- [ ] வேறுபட்ட திறன் அமைப்புகள் பொருந்தியுள்ளன
- [ ] மாதிரிகள் API மூலம் அணுகக்கூடியவை
- [ ] செயலியில் இரண்டையுமாக அழைக்க முடிகிறது

### பயிற்சி 3: செலவு கண்காணிப்பு செயல்படுத்த (20 நிமிடம்)
**நோக்கம்**: பட்ஜெட் எச்சரிக்கைகள் மற்றும் செலவு கணக்கீட்டை அமைத்தல்

```bash
# Bicepக்கு பட்ஜெட் எச்சரிப்பைச் சேர்க்க
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

# பட்ஜெட் எச்சரிப்பை அமல்படுத்து
azd provision

# தற்போதைய செலவுகளை சரிபார்க்க
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**வெற்றி அளவுகோல்கள்:**
- [ ] Azure-இல் பட்ஜெட் எச்சரிக்கை உருவானது
- [ ] மின்னஞ்சல் அறிவிப்புகள் கட்டமைக்கப்பட்டன
- [ ] Azure போர்டலில் செலவு தரவை பார்க்க முடிகிறது
- [ ] பட்ஜெட் தகுதிகள் சரியானவாறு அமைக்கப்பட்டன

## 💡 அடிக்கடி கேட்கப்படும் கேள்விகள்

<details>
<summary><strong>வளர்ச்சியின் போது Azure OpenAI செலவுகளை எப்படி குறைப்பது?</strong></summary>

1. **இலவச பருமனைப் பயன்படுத்தவும்**: Azure OpenAI 50,000 டோக்கன்கள்/மாதம் இலவசம் வழங்குகிறது
2. **திறனை குறைக்கவும்**: dev க்கு 30+ பதிலாக திறனை 10 TPM என அமைக்கவும்
3. **azd down பயன்படுத்தவும்**: செயலில் உருவாக்கம் செய்யாத போது வளங்களை விடுவிக்கவும்
4. **பதில்களை கேஷ் செய்யவும்**: மீண்டும் கேட்ட கேள்விகளுக்கு Redis cache ஐ செயல்படுத்தவும்
5. **Prompt Engineering ஐப் பயன்படுத்தவும்**: திறமையான prompts மூலம் டோக்கன் பயன்பாட்டை குறைக்கவும்

```bash
# வளர்ச்சி கட்டமைப்பு
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI மற்றும் OpenAI API-இலுள்ள வேறுபாடு என்ன?</strong></summary>

**Azure OpenAI**:
- நிறுவன பாதுகாப்பு மற்றும் இணக்கத் தன்மை
- தனியார் நெட்வொர்க் ஒருங்கிணைவு
- SLA உத்தரவாதங்கள்
- Managed identity அங்கீகாரம்
- அதிகமான கொட்டாக்கள் கிடைக்கின்றன

**OpenAI API**:
- புதிய மாதிரிகளுக்கு வேகமாக அணுகல்
- எளிமையான அமைப்பு
- நுழைவதற்கான தடம்குறைவு
- பொதுஇணையதளம் மட்டுமே

தயாரிப்பு பயன்பாடுகளுக்காக, **Azure OpenAI பரிந்துரைக்கப்படுகிறது**.
</details>

<details>
<summary><strong>Azure OpenAI கொட்டா மீறல் பிழைகளைக் எப்படி கையாள்வது?</strong></summary>

```bash
# தற்போதைய குவோட்டாவை சரிபார்க்கவும்
az cognitiveservices usage list --location eastus2

# வேறு பிராந்தியத்தை முயற்சிக்கவும்
azd env set AZURE_LOCATION westus2
azd up

# தற்காலிகமாக திறனை குறைக்கவும்
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# குவோட்டா உயர்வை கோரவும்
# Azure போர்டல் > குவோட்டாக்கள் > உயர்வை கோரவும்
```
</details>

<details>
<summary><strong>என் சொந்த தரவுகளை Azure OpenAI உடன் பயன்படுத்தலாமா?</strong></summary>

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

See the [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template.
</details>

<details>
<summary><strong>AI மாடல் endpoint-களை எப்படி பாதுகாப்பு செய்வது?</strong></summary>

**சிறந்த நடைமுறைகள்**:
1. Managed Identity ஐப் பயன்படுத்தவும் (API விசைகள் இல்லை)
2. தனியார் Endpoints-ஐ இயக்கு
3. நெட்வொர்க் பாதுகாப்பு குழுக்களை கட்டமைக்கவும்
4. விகித வரம்பிடலை அமல்படுத்தவும்
5. ரகசியங்களுக்காக Azure Key Vault ஐப் பயன்படுத்தவும்

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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: Chapter 2 - AI-First Development
- **⬅️ முந்தைய அத்தியாயம்**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 அடுத்த அத்தியாயம்**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**உதவி வேண்டுமா?** எங்கள் சமுதாய விவாதங்களில் இணையுங்கள் அல்லது ரெப்போசிடரியில் ஒரு பதிவு திறக்கவும். Azure AI + AZD சமுதாயம் உங்கள் வெற்றிக்காக உதவ தயாராக இருக்கிறது!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
விலக்கு அறிக்கை:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டது. நாங்கள் துல்லியமாக வழங்க முயல்கிறோம் என்றாலும், தானியங்கி மொழிபெயர்ப்புகள் பிழைகள் அல்லது தவறான தகவல்களை கொண்டிருக்கும் வாய்ப்பு உள்ளது என்பதை தயவுசெய்து கருதவும். அதன் சொந்த மொழியில் உள்ள மூல ஆவணம் அதிகாரபூர்வமான ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, ஒழுங்குபூர்வமான மனித மொழிபெயர்ப்பாளர் மூலம் மொழிபெயர்ப்பு செய்ய பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதில் இருந்து வரும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->