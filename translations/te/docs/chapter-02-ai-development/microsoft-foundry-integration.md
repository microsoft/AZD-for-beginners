# Microsoft Foundry ను AZD తో సమగ్రీకరణ

**అధ్యాయ నావిగేషన్:**
- **📚 Course Home**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 Current Chapter**: అధ్యాయం 2 - AI-ముఖ్య అభివృద్ధి
- **⬅️ Previous Chapter**: [అధ్యాయం 1: మీ మొదటి ప్రాజెక్ట్](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI మోడల్ అమరిక](ai-model-deployment.md)
- **🚀 Next Chapter**: [అధ్యాయం 3: కాన్ఫిగరేషన్](../chapter-03-configuration/configuration.md)

## అవలోకనం

ఈ గైడ్ Microsoft Foundry సేవలను Azure Developer CLI (AZD) ద్వారా సమగ్రీకరించి AI యాప్లికేషన్ డిప్లాయ్‌మెంట్లను సులభతరం చేయడం ఎలా చేయాలో చూపిస్తుంది. Microsoft Foundry AI యాప్లికేషన్లు నిర్మించడానికి, డిప్లాయ్ చేయడానికి, మరియు నిర్వహించడానికి సమగ్ర ప్లాట్‌ఫారమ్‌ను అందిస్తుంది, అదే సమయంలో AZD ఇన్‌ఫ్రాస్ట్రక్చర్ మరియు డిప్లాయ్‌మెంట్ ప్రక్రియను సరళీకృతం చేస్తుంది.

## Microsoft Foundry అంటే ఏమిటి?

Microsoft Foundry Microsoft యొక్క ఒక ఏకీకృత AI అభివృద్ధి ప్లాట్‌ఫారమ్, ఇది అందించేది:

- **మోడల్ క్యాటలాగ్**: అత్యాధునిక AI మోడల్స్‌కు ప్రాప్తి
- **ప్రాంప్ట్ ఫ్లో**: AI వర్క్‌ఫ్లోల కోసం విజువల్ డిజైనర్
- **AI Foundry పోర్టల్**: AI యాప్లికేషన్ల కోసం సమగ్ర అభివృద్ధి వాతావరణం
- **డిప్లాయ్‌మెంట్ ఎంపికలు**: బహుళ హోస్టింగ్ మరియు స్కేలింగ్ ఎంపికలు
- **సేఫ్టీ మరియు సెక్యూరిటీ**: బిల్ట్-ఇన్ బాధ్యత్వవంతమైన AI ఫీచర్లు

## AZD + Microsoft Foundry: కలిసి ఉత్తమం

| ఫీచర్ | Microsoft Foundry | AZD సమీకరణ ప్రయోజనం |
|---------|-----------------|------------------------|
| **మోడల్ డిప్లాయ్‌మెంట్** | మాన్యువల్ పోర్టల్ డిప్లాయ్‌మెంట్ | ఆటోమేటెడ్, పునరావృతమైన డిప్లాయ్‌మెంట్స్ |
| **ఇన్‌ఫ్రాస్ట్రక్చర్** | క్లిక్-త్రూ ప్రొవిజనింగ్ | కోడ్ ద్వారా ఇన్‌ఫ్రాస్ట్రక్చర్ (Bicep) |
| **పరిసర నిర్వహణ** | ఒకే పరిసరంపై దృష్టి | బహుళ పరిసరాలు (dev/staging/prod) |
| **CI/CD సమీకరణ** | పరిమితం | స్థానిక GitHub Actions మద్దతు |
| **ఖర్చుల నిర్వహణ** | ప్రాథమిక మానిటరింగ్ | పరిసర-నిర్దిష్ట ఖర్చు ఆప్టిమైజేషన్ |

## ముందస్తు అవసరాలు

- సరైన అనుమతులుతో Azure సబ్‌స్క్రిప్షన్
- Azure Developer CLI ఇన్స్టాల్ చేయబడినదిగా ఉండాలి
- Azure OpenAI సేవలకు ప్రాప్తి
- Microsoft Foundry తో ప్రాథమిక పరిచయం

## ముఖ్య సమీకరణ నమూనాలు

### ప్యాటర్న్ 1: Azure OpenAI సమీకరణ

**ఉపయోగం**: Azure OpenAI మోడల్స్‌తో చాట్ యాప్లికేషన్లను డిప్లాయ్ చేయడం

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

**ఇన్‌ఫ్రాస్ట్రక్చర్ (main.bicep):**
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

### ప్యాటర్న్ 2: AI Search + RAG సమీకరణ

**ఉపయోగం**: రిట్రీవల్-ఆగ్మెంటెడ్ జనరేషన్ (RAG) అప్లికేషన్లను డిప్లాయ్ చేయడం

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

### ప్యాటర్న్ 3: డాక్యుమెంట్ ఇంటెలిజెన్స్ సమీకరణ

**ఉపయోగం**: డాక్యుమెంట్ ప్రాసెసింగ్ మరియు విశ్లేషణ వర్క్‌ఫ్లోలు

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

## 🔧 కాన్ఫిగరేషన్ నమూనాలు

### పరిసర వేరియబుల్స్ సెటప్

**ప్రొడక్షన్ కాన్ఫిగరేషన్:**
```bash
# కోర్ ఏఐ సేవలు
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# మోడల్ కాన్ఫిగరేషన్లు
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# పనితీరు సెట్టింగులు
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**డెవలప్‌మెంట్ కాన్ఫిగరేషన్:**
```bash
# అభివృద్ధి కోసం ఖర్చు-ఆప్టిమైజ్ చేయబడిన సెట్టింగులు
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # ఉచిత స్థాయి
```

### Key Vault తో సురక్షిత కాన్ఫిగరేషన్

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

## డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లోలు

### ఒకే కమాండ్ డిప్లాయ్‌మెంట్

```bash
# ఒకే ఆజ్ఞతో అన్నింటినీ అమర్చండి
azd up

# లేదా దశల వారీగా అమర్చండి
azd provision  # కేవలం మౌలిక వసతులు
azd deploy     # కేవలం అనువర్తనం మాత్రమే
```

### పరిసర-నిర్దిష్ట డిప్లాయ్‌మెంట్లు

```bash
# అభివృద్ధి వాతావరణం
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# ఉత్పత్తి వాతావరణం
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## మానిటరింగ్ మరియు ఆబ్జర్వబిలిటీ

### Application Insights సమీకరణ

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

### ఖర్చుల మానిటరింగ్

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

## 🔐 భద్రత ఉత్తమ పద్ధతులు

### Managed Identity కాన్ఫిగరేషన్

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

### నెట్‌వర్క్ భద్రత

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

## పనితీరు ఆప్టిమైజేషన్

### క్యాచింగ్ వ్యూహాలు

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

### ఆటో-స్కేలింగ్ కాన్ఫిగరేషన్

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

## సాధారణ సమస్యలు పరిష్కారం

### సమస్య 1: OpenAI కోటా అధిగమించబడింది

**లక్షణాలు:**
- డిప్లాయ్‌మెంట్ కోటా ఎర్రర్లు తో విఫలమవుతుంది
- అప్లికేషన్ లాగ్‌లలో 429 ఎర్రర్లు

**పరిష్కారాలు:**
```bash
# ప్రస్తుత క్వోటా వినియోగాన్ని తనిఖీ చేయండి
az cognitiveservices usage list --location eastus

# వేరే ప్రాంతాన్ని ప్రయత్నించండి
azd env set AZURE_LOCATION westus2
azd up

# సామర్థ్యాన్ని తాత్కాలికంగా తగ్గించండి
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### సమస్య 2: ప్రామాణీకరణ విఫలమవులు

**లక్షణాలు:**
- AI సేవలను పిలిచేటప్పుడు 401/403 ఎర్రర్లు
- "అనుమతి నిరాకరించబడింది" సందేశాలు

**పరిష్కారాలు:**
```bash
# పాత్ర నియామకాలను ధృవీకరించండి
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# నిర్వహించబడిన ఐడెంటిటీ కాన్ఫిగరేషన్‌ను తనిఖీ చేయండి
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault యాక్సెస్‌ను ధృవీకరించండి
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### సమస్య 3: మోడల్ డిప్లాయ్‌మెంట్ సమస్యలు

**లక్షణాలు:**
- డిప్లాయ్‌మెంట్‌లో మోడల్స్ అందుబాటులో లేవు
- నిర్దిష్ట మోడల్ వెర్షన్లు విఫలమవుతున్నాయి

**పరిష్కారాలు:**
```bash
# ప్రాంతాల వారీగా అందుబాటులో ఉన్న మోడళ్లను జాబితా చేయండి
az cognitiveservices model list --location eastus

# bicep టెంప్లేట్‌లో మోడల్ వెర్షన్‌ను నవీకరించండి
# మోడల్ సామర్థ్య అవసరాలను తనిఖీ చేయండి
```

## ఉదాహరణ టెంప్లేట్స్

### ప్రాథమిక చాట్ అప్లికేషన్

**రిపోజిటరీ**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**సేవలు**: Azure OpenAI + Cognitive Search + App Service

**త్వరిత ప్రారంభం**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### డాక్యుమెంట్ ప్రాసెసింగ్ పైప్‌లైన్

**రిపోజిటరీ**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**సేవలు**: Document Intelligence + Storage + Functions

**త్వరిత ప్రారంభం**:
```bash
azd init --template ai-document-processing
azd up
```

### RAG తో ఎంటర్ప్రైస్ చాట్

**రిపోజిటరీ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**సేవలు**: Azure OpenAI + Search + Container Apps + Cosmos DB

**త్వరిత ప్రారంభం**:
```bash
azd init --template contoso-chat
azd up
```

## తదుపరి చర్యలు

1. **ఉదాహరణలను ప్రయత్నించండి**: మీ వినియోగకేస్‌కు సరిపోయే ప్రీ-బిల్ట్ టెంప్లెట్‌తో ప్రారంభించండి
2. **మీ అవసరాల కోసం అనుకూలీకరించండి**: ఇన్‌ఫ్రాస్ట్రక్చర్ మరియు అప్లికేషన్ కోడ్ ను మార్చండి
3. **మానిటరింగ్ జోడించండి**: సమగ్ర ఆబ్జర్వబిలిటీ అమలు చేయండి
4. **ఖర్చులు ఆప్టిమైజ్ చేయండి**: మీ బడ్జెట్‌కు అనుగుణంగా కాన్ఫిగరేషన్‌లు మెరుగు చేయండి
5. **మీ డిప్లాయ్‌మెంట్‌ను సురక్షితం చేయండి**: ఎంటర్ప్రైజ్ భద్రతా నమూనాలను అమలు చేయండి
6. **ప్రొడక్షన్‌కు స్కేలు చేయండి**: బహుళ-రీజియన్ మరియు హై-అవెయిలబిలిటీ ఫీచర్‌లను జోడించండి

## 🎯 హ్యాండ్స్-ఆన్ వ్యాయామాలు

### వ్యాయామం 1: Azure OpenAI చాట్ యాప్ ను డిప్లాయ్ చేయండి (30 నిమిషాలు)
**లక్ష్యం**: ప్రొడక్షన్-రెడీ AI చాట్ అప్లికేషన్‌ను డిప్లాయ్ చేసి పరీక్షించడం

```bash
# టెంప్లేట్‌ను ప్రారంభించండి
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# పర్యావరణ వేరియబుల్స్‌ను సెట్ చేయండి
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# డిప్లాయ్ చేయండి
azd up

# అప్లికేషన్‌ను పరీక్షించండి
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# ఏఐ ఆపరేషన్లను పర్యవేక్షించండి
azd monitor

# శుభ్రం చేయండి
azd down --force --purge
```

**విజయ ప్రమాణాలు:**
- [ ] డిప్లాయ్‌మెంట్ కోటా ఎర్రర్లు లేకుండా పూర్తి అవుతుంది
- [ ] బ్రౌజర్‌లోని చాట్ ఇంటర్‌ఫేస్‌కు యాక్సెస్ చేయగలరు
- [ ] ప్రశ్నలు అడిగి AI-చాలిత సమాధానాలు పొందగలరు
- [ ] Application Insights టెలిమేట్రి డేటాను చూపిస్తుంది
- [ ] వనరులను విజయవంతంగా శుభ్రపరచడం జరిగింది

**అంచనా ఖర్చు**: 30 నిమిషాల పరీక్షకు $5-10

### వ్యాయామం 2: బహుళ-మోడల్ డిప్లాయ్‌మెంట్‌ను కాన్ఫిగర్ చేయండి (45 నిమిషాలు)
**లక్ష్యం**: వేర్వేరు కాన్ఫిగరేషన్‌లతో బహుళ AI మోడల్స్‌ను డిప్లాయ్ చేయడం

```bash
# అనుకూల Bicep కాన్ఫిగరేషన్ సృష్టించండి
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

# అమలు చేసి ధృవీకరించండి
azd provision
azd show
```

**విజయ ప్రమాణాలు:**
- [ ] బహుళ మోడల్స్ విజయవంతంగా డిప్లాయ్ అయ్యాయి
- [ ] వివిధ కెపాసిటీ సెట్టింగ్స్ వర్తించబడ్డాయి
- [ ] మోడల్స్ API ద్వారా యాక్సెస్ చేయగలగాలి
- [ ] అప్లికేషన్ నుండి రెండు మోడల్స్‌ను పిలవగలగాలి

### వ్యాయామం 3: ఖర్చుల మానిటరింగ్ అమలు చేయండి (20 నిమిషాలు)
**లక్ష్యం**: బడ్జెట్ అలర్ట్‌లు మరియు ఖర్చుల ట్రాకింగ్‌ను సెట్ చేయడం

```bash
# Bicepకి బడ్జెట్ అలర్ట్ జోడించండి
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

# బడ్జెట్ అలర్ట్‌ను డిప్లాయ్ చేయండి
azd provision

# ప్రస్తుత ఖర్చులను తనిఖీ చేయండి
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**విజయ ప్రమాణాలు:**
- [ ] Azureలో బడ్జెట్ అలర్ట్ సృష్టించబడింది
- [ ] ఇమెయిల్ నోటిఫికేషన్‌లు కాన్ఫిగర్డ్ చేయబడ్డాయి
- [ ] Azure పోర్టల్‌లో ఖర్చు డేటా చూడగలగాలి
- [ ] బడ్జెట్ పరిమితులు సరైన విధంగా సెట్ చేయబడ్డాయి

## 💡 తరచుగా అడిగే ప్రశ్నలు

<details>
<summary><strong>డెవలప్‌మెంట్ సమయంలో Azure OpenAI ఖర్చులను ఎలా తగ్గించాలి?</strong></summary>

1. **ఉచిత టియర్ ఉపయోగించండి**: Azure OpenAI నెలకు 50,000 టోకెన్లు ఉచితం అందిస్తుంది
2. **కెపాసిటీ తక్కువ చేయండి**: డెవ్ కోసం కెపాసిటీని 30+ బదులు 10 TPM‌గా సెట్ చేయండి
3. **azd down ఉపయోగించండి**: చురుకుగా అభివృద్ధి చేయని సమయంలో వనరులను విడుదల చేయండి
4. **ప్రతిస్పందనలను క్యాష్ చేయండి**: పునరావృత ప్రశ్నలకు Redis క్యాష్ అమలు చేయండి
5. **ప్రాంప్ట్ ఇంజినీరింగ్ ఉపయోగించండి**: సమర్థవంతమైన ప్రాంప్ట్స్‌తో టోకెన్ వినియోగం తగ్గించండి

```bash
# అభివృద్ధి కాన్ఫిగరేషన్
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI మరియు OpenAI API మధ్య తేడా ఏమిటి?</strong></summary>

**Azure OpenAI**:
- ఎంటర్ప్రైజ్ భద్రత మరియు కంప్లైయన్స్
- ప్రైవేట్ నెట్‌వర్క్ ఏకగ్రత
- SLA హామీలు
- Managed identity ఆధారిత ఆథెంటికేషన్
- ఉన్నత కోటాలు అందుబాటులో ఉన్నాయి

**OpenAI API**:
- కొత్త మోడల్స్‌కి వేగవంతమైన ప్రాప్తి
- సాధారణ సెట్అప్
- తక్కువ ప్రవేశ అడ్డం
- పబ్లిక్ ఇంటర్నెట్ మాత్రమే

ప్రొడక్షన్ యాప్స్‌కు, **Azure OpenAI సిఫార్సు చేయబడింది**.
</details>

<details>
<summary><strong>Azure OpenAI కోటా అధిగమించిన ఎర్రర్లను నేను ఎలా నిర్వహిస్తాను?</strong></summary>

```bash
# ప్రస్తుత కోటాను తనిఖీ చేయండి
az cognitiveservices usage list --location eastus2

# వేరే ప్రాంతాన్ని ప్రయత్నించండి
azd env set AZURE_LOCATION westus2
azd up

# తాత్కాలికంగా సామర్థ్యాన్ని తగ్గించండి
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# కోటా పెంపును అభ్యర్థించండి
# Azure పోర్టల్‌కు వెళ్లండి > కోటాలు > పెంపు అభ్యర్థించండి
```
</details>

<details>
<summary><strong>నేను నా స్వంత డేటాను Azure OpenAI తో ఉపయోగించగలనా?</strong></summary>

అవును! RAG (Retrieval Augmented Generation) కోసం **Azure AI Search** ఉపయోగించండి:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

చూడండి [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) టెంప్లేట్.
</details>

<details>
<summary><strong>నేను AI మోడల్ ఎండ్‌పాయింట్‌లను ఎలా సురక్షించగలన?</strong></summary>

**ఉత్తమ పద్ధతులు**:
1. Managed Identity వినియోగించండి (API కీలు అవసరం లేదు)
2. ప్రైవేట్ ఎండ్‌పాయింట్‌లు ఎనేబుల్ చేయండి
3. నెట్‌వర్క్ సెక్యూరిటీ గ్రూప్‌లను కాన్ఫిగర్ చేయండి
4. రేట్ లిమిటింగ్ అమలు చేయండి
5. రహస్యాల కోసం Azure Key Vault ఉపయోగించండి

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

## కమ్యూనిటీ మరియు మద్దతు

- **Microsoft Foundry Discord**: [#Azure చానల్](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [ఇష్యూస్ మరియు చర్చలు](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [అధికారిక డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/ai-studio/)

---

**అధ్యాయ నావిగేషన్:**
- **📚 Course Home**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 Current Chapter**: అధ్యాయం 2 - AI-ముఖ్య అభివృద్ధి
- **⬅️ Previous Chapter**: [అధ్యాయం 1: మీ మొదటి ప్రాజెక్ట్](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI మోడల్ అమరిక](ai-model-deployment.md)
- **🚀 Next Chapter**: [అధ్యాయం 3: కాన్ఫిగరేషన్](../chapter-03-configuration/configuration.md)

**సహాయం కావాలా?** మన కమ్యూనిటీ చర్చలకు చేరండి లేదా రిపోజిటరీలో ఇష్యూ ఓపెన్ చేయండి. Azure AI + AZD కమ్యూనిటీ మీ విజయానికి సహాయం చేయడానికి ఇక్కడ ఉంది!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
నిరాకరణ:
ఈ పత్రాన్ని AI అనువాద సేవ అయిన [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, ఆటోమెటెడ్ అనువాదాల్లో తప్పులు లేదా లోపాలు ఉండే అవకాశం ఉందని దయచేసి గమనించండి. మూల పత్రాన్ని దాని స్థానిక/స్వదేశీ భాషలో ఉన్న రూపాన్నే అధికారం ఉన్న మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం ప్రొఫెషనల్ మానవ అనువాదాన్ని సూచిస్తాం. ఈ అనువాదాన్ని ఉపయోగించడంవల్ల ఏర్పడే ఏవైనా అవగాహనా లోపాలు లేదా తప్పుగా అర్థం చేసుకోవడంపై మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->