# Microsoft Foundry ను AZD తో ఇంటిగ్రేట్ చేయడం

**అధ్యాయ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 2 - AI-ప్రధాన అభివృద్ధి
- **⬅️ మునుపటి అధ్యాయం**: [అధ్యాయం 1: మీ మొదటి ప్రాజెక్ట్](../chapter-01-foundation/first-project.md)
- **➡️ తరువాత**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 తరువాతి అధ్యాయం**: [అధ్యాయం 3: అమరికలు](../chapter-03-configuration/configuration.md)

## అవలోకనం

ఈ గైడ్ Microsoft Foundry సేవలను Azure Developer CLI (AZD) తో సమగ్రంగా జతచేసి AI అప్లికేషన్ డిప్లాయ్‌మెంట్‌ను ఎలా సరళీకృతం చేయాలో చూపిస్తుంది. Microsoft Foundry AI అప్లికేషన్లు నిర్మించడానికి, డిప్లాయ్ చేయడానికి మరియు నిర్వహించడానికి సమగ్ర వేదికను అందిస్తుంది, మరియు AZD మౌలిక సదుపాయాలు మరియు డిప్లాయ్‌మెంట్ ప్రక్రియను సులభతరం చేస్తుంది.

## Microsoft Foundry అంటే ఏమిటి?

Microsoft Foundry అనేది Microsoft యొక్క ఏఐ అభివృద్ధి కోసం ఏకీకృత వేదిక, ఇది ఈ క్రింది అంశాలను కలిగి ఉంటుంది:

- **మోడల్ క్యాటలాగ్**: ఆధునిక AI మోడళ్లకు ప్రాప్తి
- **Prompt Flow**: AI వర్క్‌ఫ్లోల కోసం విజువల్ డిజైనర్
- **Microsoft Foundry Portal**: AI అప్లికేషన్ల కోసం సమగ్ర అభివృద్ధి వాతావరణం
- **డిప్లాయ్‌మెంట్ ఎంపికలు**: బహుముఖ హోస్టింగ్ మరియు స్కేలింగ్ ఎంపికలు
- **సేఫ్టీ మరియు సెక్యూరిటీ**: కలిగిన బాధ్యతాయుత AI లక్షణాలు

## AZD + Microsoft Foundry: కలసి మెరుగ్గా

| ఫీచర్ | Microsoft Foundry | AZD ఇంటిగ్రేషన్ లాభం |
|---------|-----------------|------------------------|
| **మోడల్ డిప్లాయ్‌మెంట్** | మాన్యువల్ పోర్టల్ డిప్లాయ్‌మెంట్ | ఆటోమేటెడ్, పునరావృతంగా అమలు చేయదగ్గ డిప్లాయ్‌మెంట్లు |
| **ఇన్‌ఫ్రాస్ట్రక్చర్** | క్లిక్ ద్వారా ప్రావిజనింగ్ | Infrastructure as Code (Bicep) |
| **పర్యావరణ నిర్వహణ** | ఒకే పారివేశంపై దృష్టి | బహు-పర్యావరణ (dev/staging/prod) |
| **CI/CD ఇంటిగ్రేషన్** | పరిమిత | స్థానిక GitHub Actions మద్దతు |
| **ఖర్చు నిర్వహణ** | ప్రాథమిక మానిటరింగ్ | పర్యావరణ-స్పెసిఫిక్ ఖర్చు ఆప్టిమైజేషన్ |

## ముందు అవసరాలు

- సరైన అనుమతులతో Azure సబ్‌స్క్రిప్షన్
- Azure Developer CLI ఇన్స్టాల్ చేయబడినది
- Microsoft Foundry Models సేవలకు ప్రాప్తి
- Microsoft Foundry గురించి ప్రాథమిక పరిచయం

## ప్రాథమిక ఇంటిగ్రేషన్ నమూనాలు

### నమూనా 1: Microsoft Foundry Models ఇంటిగ్రేషన్

**వినియోగ కేసు**: Microsoft Foundry Models మోడళ్లతో చాట్ అప్లికేషన్లను డిప్లాయ్ చేయడం

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

### నమూనా 2: AI Search + RAG ఇంటిగ్రేషన్

**వినియోగ కేసు**: retrieval-augmented generation (RAG) అప్లికేషన్లను డిప్లాయ్ చేయడం

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

### నమూనా 3: డాక్యుమెంట్ ఇన్టెలిజెన్స్ ఇంటిగ్రేషన్

**వినియోగ కేసు**: డాక్యుమెంట్ ప్రాసెసింగ్ మరియు విశ్లేషణ వర్క్‌ఫ్లోలు

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

### పర్యావరణ వేరియబుల్స్ సెటప్

**ఉత్పత్తి కాన్ఫిగరేషన్:**
```bash
# ప్రధాన కృత్రిమ బుద్ధి సేవలు
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# మోడల్ అమరికలు
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# పనితీరు అమరికలు
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**డెవలప్మెంట్ కాన్ఫిగరేషన్:**
```bash
# డెవలప్‌మెంట్ కోసం ఖర్చు-ఆప్టిమైజ్ చేయబడ్డ సెట్టింగులు
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

### Foundry కోసం AZD ఎక్స్‌టెన్షన్లు

AZD Microsoft Foundry సేవలతో పని చేయడానికి AI-స్పెసిఫిక్ సామర్థ్యాలను జోడించే ఎక్స్‌టెన్షన్లను అందిస్తుంది:

```bash
# Foundry agents ఎక్స్‌టెన్షన్ ఇన్‌స్టాల్ చేయండి
azd extension install azure.ai.agents

# fine-tuning ఎక్స్‌టెన్షన్ ఇన్‌స్టాల్ చేయండి
azd extension install azure.ai.finetune

# custom models ఎక్స్‌టెన్షన్ ఇన్‌స్టాల్ చేయండి
azd extension install azure.ai.models

# ఇన్‌స్టాల్ చేసిన ఎక్స్‌టెన్షన్లను జాబితా చేయండి
azd extension list
```

### `azd ai` తో ఏజెంట్-ఫస్ట్ డిప్లాయ్‌మెంట్

మీ వద్ద ఏజెంట్ మేనిఫెస్ట్ ఉంటే, Foundry Agent Service కు వైర్డ్ అయిన ప్రాజెక్ట్‌ను స్కాఫోల్డ్ చేయడానికి `azd ai agent init` ను ఉపయోగించండి:

```bash
# ఏజెంట్ మానిఫెస్ట్ నుండి ప్రారంభించండి
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azureకు డిప్లాయ్ చేయండి
azd up
```

పూర్తి కమాండ్ రిఫరెన్స్ మరియు ఫ్లాగ్స్ కోసం [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) ను చూడండి.

### ఒక్క కమాండ్ డిప్లాయ్‌మెంట్

```bash
# ఒక కమాండ్‌తో అన్ని డిప్లాయ్ చేయండి
azd up

# లేదా దశలవారీగా డిప్లాయ్ చేయండి
azd provision  # మౌలిక సదుపాయాలు మాత్రమే
azd deploy     # అనువర్తనం మాత్రమే
```

### పర్యావరణ-స్పెసిఫిక్ డిప్లాయ్‌మెంట్లు

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

### Application Insights ఇంటిగ్రేషన్

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

### ఖర్చు మానిటరింగ్

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

### మేనేజ్‌డ్ ఐడెంటిటీ కాన్ఫిగరేషన్

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

### క్యాచింగ్ తంత్రాలు

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

## సాధారణ సమస్యల పరిష్కారాలు

### సమస్య 1: OpenAI కోటా అధిగమించబడింది

**లక్షణాలు:**
- కోటా లోపాల కారణంగా డిప్లాయ్‌మెంట్ విఫలమవడం
- అప్లికేషన్ లాగ్‌లలో 429 లోపాలు

**పరిష్కారాలు:**
```bash
# ప్రస్తుత కోటా వినియోగాన్ని తనిఖీ చేయండి
az cognitiveservices usage list --location eastus

# వేరే ప్రాంతాన్ని ప్రయత్నించండి
azd env set AZURE_LOCATION westus2
azd up

# సామర్థ్యాన్ని తాత్కాలికంగా తగ్గించండి
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### సమస్య 2: ఆథెంటికేషన్ వైఫల్యాలు

**లక్షణాలు:**
- AI సేవలను కాల్ చేసేటప్పుడు 401/403 లోపాలు
- "Access denied" సందేశాలు

**పరిష్కారాలు:**
```bash
# పాత్ర కేటాయింపులను నిర్ధారించండి
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# నిర్వహించబడిన గుర్తింపు కాన్ఫిగరేషన్‌ను తనిఖీ చేయండి
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# కీ వాల్ట్ యాక్సెస్‌ను ధృవీకరించండి
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### సమస్య 3: మోడల్ డిప్లాయ్‌మెంట్ సమస్యలు

**లక్షణాలు:**
- డిప్లాయ్‌మెంట్‌లో మోడళ్లు అందుబాటులో లేవు
- నిర్దిష్ట మోడల్ వెర్షన్లు విఫలమవడం

**పరిష్కారాలు:**
```bash
# ప్రాంతాల వారీగా అందుబాటులో ఉన్న మోడళ్ల జాబితాను చూపించండి
az cognitiveservices model list --location eastus

# Bicep టెంప్లేట్‌లో మోడల్ వెర్షన్‌ను నవీకరించండి
# మోడల్ సామర్థ్య అవసరాలను తనిఖీ చేయండి
```

## ఉదాహరణ టెంప్లేట్లు

### RAG చాట్ అప్లికేషన్ (Python)

**రిపోజిటరీ**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**సేవలు**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**వివరణ**: అత్యంత ప్రసిద్ధ Azure AI శాంపిల్ — ఉత్పత్తి-సిద్ధ RAG చాట్ యాప్, ఇది మీ స్వంత డాక్యుమెంట్స్‌పై ప్రశ్నలు అడగడానికి అనుమతిస్తుంది. చాట్‌కు GPT-4.1-mini ను ఉపయోగిస్తుంది, ఎంబెడ్డింగ్స్‌కు text-embedding-ada-002 ను ఉపయోగిస్తుంది, మరియు రిట్రీవల్ కోసం Azure AI Search ను ఉపయోగిస్తుంది. మల్టీమోడల్ డాక్యుమెంట్లు, శబ్ద ఇన్‌పుట్/ఆుట్‌పుట్, Microsoft Entra ఆథెంటికేషన్ మరియు Application Insights ట్రేసింగ్‌కు మద్దతు కలిగి ఉంది.

**త్వరిత ప్రారంభం**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG చాట్ అప్లికేషన్ (.NET)

**రిపోజిటరీ**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**సేవలు**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**వివరణ**: Python RAG చాట్ శాంపిల్‌కు .NET/C# సమాన రూపం. ASP.NET Core Minimal API మరియు Blazor WebAssembly ఫ్రంట్‌ఎండ్‌తో నిర్మించబడింది. వాయిస్ చాట్, GPT-4o-mini విజన్ మద్దతు, మరియు సహచర .NET MAUI Blazor హైబ్రిడ్ డెస్క్‌టాప్/మొబైల్ క్లయింట్‌ను కూడా కలిగి ఉంది.

**త్వరిత ప్రారంభం**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG చాట్ అప్లికేషన్ (Java)

**రిపోజిటరీ**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**సేవలు**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**వివరణ**: Langchain4J ఉపయోగించి AI ఆకర్షణ కోసం Java సంస్కరణ. మైక్రోసర్వీస్ ఈవెంట్-డ్రివన్ ఆర్కిటెక్చర్‌ను మద్దతు చేస్తుంది, బహు శోధన వ్యూహాలు (టెక్స్ట్, వెక్టర్, హైబ్రిడ్), Azure Document Intelligenceతో డాక్యుమెంట్ అప్‌లోడ్, మరియు Azure Container Apps లేదా Azure Kubernetes Service లో డిప్లాయ్ చేయడానికి ఎంపిక.

**త్వరిత ప్రారంభం**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**రిపోజిటరీ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**సేవలు**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**వివరణ**: Azure AI Foundry మరియు Prompty ఉపయోగించి ఎండ్-టు-ఎండ్ రిటైల్ RAG కాపిలాట్. ఉత్పత్తి క్యాటలాగ్ మరియు కస్టమర్ ఆర్డర్ డేటా ఆధారంగా సమాధానాలను గ్రౌండ్ చేస్తున్న Contoso Outdoor రిటైల్ చాట్‌బాట్. పూర్తి GenAIOps వర్క్‌ఫ్లోను ప్రదర్శిస్తుంది — Promptyతో ప్రోటోటైప్, AI-సహాయంతో ఎవెల్యుయేషన్‌లు, మరియు AZD ద్వారా Container Apps కు డిప్లాయ్ చేయడం.

**త్వరిత ప్రారంభం**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**రిపోజిటరీ**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**సేవలు**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**వివరణ**: Promptyతో ఏజెంట్ ఆర్కెస్ట్రేషన్‌ను ప్రదర్శిస్తున్న మల్టీ-ఏజెంట్ శాంపిల్. రీసెర్చ్ ఏజెంట్ (Bing Grounding in Azure AI Agent Service), ప్రొడక్ట్ ఏజెంట్ (Azure AI Search), రైటర్ ఏజెంట్ మరియు ఎడిట‌ర్ ఏజెంట్ కలసి సరిగ్గా పరిశోధన చేసిన ఆర్టికల్స్‌ని ఉత్పత్తి చేస్తాయి. GitHub Actionsలో ఎవల్యుయేషన్‌తో CI/CD ను కూడా కలిగి ఉంటుంది.

**త్వరిత ప్రారంభం**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**రిపోజిటరీ**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**సేవలు**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**వివరణ**: LangChain.js ఉపయోగించి పూర్తిగా సర్వర్‌లెస్ RAG చాట్‌బాట్, API కోసం Azure Functions మరియు హోస్టింగ్ కోసం Azure Static Web Apps తో రూపొందించబడింది. Azure Cosmos DB ని వెక్టర్ స్టోర్ మరియు చాట్ హిస్టరీ డేటాబేస్‌గా ఉపయోగిస్తుంది. శూన్య ఖర్చు పరీక్షలకు స్థానిక అభివృద్ధికి Ollama మద్దతు ఉంది.

**త్వరిత ప్రారంభం**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**రిపోజిటరీ**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**సేవలు**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**వివరణ**: డాక్యుమెంట్ అప్లోడ్/నిర్వహణ కోసం అడ్మిన్ పోర్టల్ ఉన్న ఎంటర్ప్రైజ్-గ్రేడ్ RAG సొల్యూషన్ యాక్సిలరేటర్, బహు ఆర్కెస్ట్రేటర్ ఎంపికలు (Semantic Kernel, LangChain, Prompt Flow), స్పీచ్-టు-టెక్స్, Microsoft Teams ఇంటిగ్రేషన్, మరియు PostgreSQL లేదా Cosmos DB బ్యాక్‌ఎండ్ ఎంపికతో రూపొందించబడింది. ప్రొడక్షన్ RAG సన్నివేశాలకు అనుకూలమైన సరళ ప్రారంభ పాయింట్.

**త్వరిత ప్రారంభం**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**రిపోజిటరీ**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**సేవలు**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**వివరణ**: మూడు ఫ్రేమ్‌వర్క్‌లను ఉపయోగించి మల్టీ-ఏజెంట్ AI ఆర్కెస్ట్రేషన్‌కు సూచనాత్మక అప్లికేషన్ (LangChain.js, LlamaIndex.TS, మరియు Microsoft Agent Framework). నాలుగు భాషలలో MCP (Model Context Protocol) సర్వర్లను సర్వర్‌లెస్ Azure Container Apps గా డిప్లాయ్ చేస్తుంది మరియు OpenTelemetry మానిటరింగ్‌ను కలిగి ఉంటుంది.

**త్వరిత ప్రారంభం**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**రిపోజిటరీ**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**సేవలు**: Azure AI Services + Azure OpenAI

**వివరణ**: Azure AI సేవలను కాన్ఫిగర్ చేసిన మెషీన్ లెర్నింగ్ మోడళ్లు కలిగి నిల్వ చేసే కనిష్ట Bicep టెంప్లెట్. పూర్తి అప్లికేషన్ స్టాక్ అవసరం లేకుండా కేవలం Azure AI మౌలికసౌకర్యం మాత్రమే ప్రావిజన్ చేయాల్సినప్పుడు తేలికైన ప్రారంభ పాయింట్.

**త్వరిత ప్రారంభం**:
```bash
azd init --template azd-ai-starter
azd up
```

> **మరిన్ని టెంప్లేట్లను బ్రౌజ్ చేయండి**: బాషలు మరియు సన్నివేశాల వారీగా 80+ AI-స్పెసిఫిక్ AZD టెంప్లేట్ల కోసం [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) ను సందర్శించండి.

## తర్వాతి దశలు

1. **ఉదాహరణలను ప్రయత్నించండి**: మీ వినియోగ కేసుకి సరిపోయే ప్రీ-బిల్ట్ టెంప్లేట్‌తో ప్రారంభించండి
2. **మీ అవసరాలకు అనుగుణంగా కస్టమైజ్ చేయండి**: ఇన్‌ఫ్రాస్ట్రక్చర్ మరియు అప్లికేషన్ కోడ్‌ను సవరించండి
3. **మానిటరింగ్ జోడించండి**: సమగ్ర ఆబ్సర్వబిలిటీని అమలు చేయండి
4. **ఖర్చులను ఆప్టిమైజ్ చేయండి**: బడ్జెట్‌కు అనుగుణంగా కాన్ఫిగరేషన్లను మెరుగుపరచండి
5. **డిప్లాయ్‌మెంట్‌ను సురక్షితం చేయండి**: ఎంటర్ప్రైజ్ భద్రతా నమూనాలను అమలు చేయండి
6. **ప్రొడక్షన్‌కు స్కేల్ చేయండి**: బహు-రీజియన్ మరియు హై-అవైలబిలిటీ ఫీచర్లను జోడించండి

## 🎯 హ్యాండ్స్-ఆన్ వ్యాయామాలు

### వ్యాయామం 1: Microsoft Foundry Models చాట్ యాప్‌ను డిప్లాయ్ చేయండి (30 నిమిషాలు)
**గోల్**: ఉత్పత్తి-సిద్దమైన AI చాట్ అప్లికేషన్‌ను డిప్లాయ్ చేసి పరీక్షించండి

```bash
# టెంప్లేట్‌ను ప్రారంభించండి
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# పర్యావరణ చరాలను సెట్ చేయండి
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# డిప్లాయ్ చేయండి
azd up

# అప్లికేషన్‌ను పరీక్షించండి
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# ఏఐ కార్యకలాపాలను పర్యవేక్షించండి
azd monitor

# శుభ్రపరচండి
azd down --force --purge
```

**సక్సెస్ ప్రమాణాలు:**
- [ ] కోటా లోపాలు లేకుండా డిప్లాయ్‌మెంట్ పూర్తి అవుతుంది
- [ ] బ్రౌజర్‌లో చాట్ ఇంటర్‌ఫేస్‌కు యాక్సెస్ చేయగలరు
- [ ] ప్రశ్నలు అడిగి AI-పవర్డ్ సమాధానాలు పొందగలరు
- [ ] Application Insights టెలీమేట్రీ డేటాను చూపిస్తుంది
- [ ] వనరులను విజయవంతంగా క్లీనప్ చేశారు

**అంచనా ఖర్చు**: 30 నిమిషాల టెస్టింగ్ కి $5-10

### వ్యాయామం 2: బహు-మోడల్ డిప్లాయ్‌మెంట్ కాన్ఫిగర్ చేయండి (45 నిమిషాలు)
**గోల్**: వివిధ కాన్ఫిగరేషన్లతో బహు AI మోడళ్లను డిప్లాయ్ చేయండి

```bash
# అనుకూల Bicep కాన్ఫిగరేషన్ సృష్టించండి
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

# డిప్లాయ్ చేసి తనిఖీ చేయండి
azd provision
azd show
```

**సక్సెస్ ప్రమాణాలు:**
- [ ] బహు మోడళ్లను విజయవంతంగా డిప్లాయ్ చేశారు
- [ ] వివిధ కెపాసిటీ సెట్టింగ్స్ వర్తింపజేయబడ్డాయి
- [ ] మోడళ్లను API ద్వారా యాక్సెస్ చేయగలరు
- [ ] అప్లికేషన్ నుంచి రెండు మోడళ్లను కాల్ చేయగలరూ

### వ్యాయామం 3: ఖర్చు మానిటరింగ్ అమలు చేయండి (20 నిమిషాలు)
**గోల్**: బడ్జెట్ అలెర్ట్స్ మరియు ఖర్చు ట్రాకింగ్ సెటప్ చేయడం

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

**సక్సెస్ ప్రమాణాలు:**
- [ ] Azureలో బడ్జెట్ అలర్ట్ సృష్టించబడింది
- [ ] ఇమెయిల్ నోటిఫికేషన్లు కాంఫిగర్ చేయబడ్డాయి
- [ ] Azure పోర్టల్‌లో ఖర్చు డేటాను వీక్షించగలరు
- [ ] బడ్జెట్ థ్రెషోల్డ్లు సరైన రీతిలో సెట్ చేయబడ్డాయి

## 💡 తరచుగా అడిగే ప్రశ్నలు

<details>
<summary><strong>వికాస సమయంలో Microsoft Foundry Models ఖర్చులను నేను ఎలా తగ్గించగలను?</strong></summary>

1. **ఫ్రీ టియర్ ఉపయోగించండి**: Microsoft Foundry Models నెలకి 50,000 టోకెన్లు ఉచితం అందిస్తుంది
2. **క్షమతను తగ్గించండి**: dev కోసం 30+ కాకుండా TPMని 10 గా సెట్ చేయండి
3. **azd down ఉపయోగించండి**: సક્રియంగా అభివృద్ధి చేయని సమయంలో వనరులను డిఆలోకేట్ చేయండి
4. **రెస్పాన్సులను క్యాష్ చేయండి**: పునరావృత ప్రశ్నల కోసం Redis క్యాష్ అమలు చేయండి
5. **ప్రాంప్ట్ ఇంజనీరింగ్ ఉపయోగించండి**: సమర్థవంతమైన ప్రాంప్ట్స్ ద్వారా టోకెన్ వినియోగాన్ని తగ్గించండి

```bash
# అభివృద్ధి కాన్ఫిగరేషన్
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models మరియు OpenAI API మధ్య తేడా ఏమిటి?</strong></summary>

**Microsoft Foundry Models**:
- ఎంటర్ప్రైజ్ భద్రత మరియు కంప్లయన్స్
- ప్రైవేట్ నెట్‌వర్క్ ఇంటిగ్రేషన్
- SLA హామీలు
- మేనేజ్‌డ్ ఐడెంటిటీ ఆథెంటికేషన్
- అధిక కోటాలు అందుబాటులో ఉంటాయి

**OpenAI API**:
- కొత్త మోడళ్లకు వేగవంతమైన ప్రవేశం
- సులభమైన సెటప్
- తక్కువ ప్రవేశ నిరోధకం
- కేవలం పబ్లిక్ ఇంటర్నెట్

ప్రొడక్షన్ యాప్స్ కోసం, **Microsoft Foundry Modelsని సిఫార్సు చేయబడుతుంది**.
</details>

<details>
<summary><strong>Microsoft Foundry మోడల్‌ల కోటా అధిగమింపు లోపాలను నేను ఎలా నిర్వహించాలి?</strong></summary>

```bash
# ప్రస్తుత కోటాను తనిఖీ చేయండి
az cognitiveservices usage list --location eastus2

# వేరే ప్రాంతంలో ప్రయత్నించండి
azd env set AZURE_LOCATION westus2
azd up

# సామర్థ్యాన్ని తాత్కాలికంగా తగ్గించండి
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# కోటా పెరగాలని అభ్యర్థించండి
# Azure పోర్టల్ > కోటాలు > పెంపు అభ్యర్థనకు వెళ్లండి
```
</details>

<details>
<summary><strong>నా స్వంత డేటాను Microsoft Foundry మోడల్‌లతో ఉపయోగించగలనా?</strong></summary>

అవును! RAG (Retrieval Augmented Generation) కోసం **Azure AI Search**ను ఉపయోగించండి:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

ఈ [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) టెంప్లేట్‌ని చూడండి.
</details>

<details>
<summary><strong>AI మోడల్ ఎండ్‌పాయింట్‌లను నేను ఎలా భద్రపరచాలి?</strong></summary>

**ఉత్తమ పద్ధతులు**:
1. Managed Identity ను ఉపయోగించండి (API కీలు అవసరం లేదు)
2. ప్రైవేట్ ఎండ్‌పాయింట్లను ప్రారంభించండి
3. నెట్‌వర్క్ సెక్యూరిటీ గ్రూప్‌లను కాన్ఫిగర్ చేయండి
4. రేటు పరిమితిని అమలు చేయండి
5. రహస్యాల కోసం Azure Key Vault ను ఉపయోగించండి

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

- **Microsoft Foundry Discord**: [#Azure చానెల్](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [ఇష్యూలు మరియు చర్చలు](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [అధికారিক డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh పై Microsoft Foundry స్కిల్](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - మీ ఎడిటర్‌లో Azure + Foundry agent skills ను `npx skills add microsoft/github-copilot-for-azure` తో ఇన్‌స్టాల్ చేయండి

---

**అధ్యాయ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 2 - AI-ప్రథమ అభివృద్ధి
- **⬅️ మునుపటి అధ్యాయం**: [అధ్యాయం 1: మీ మొదటి ప్రాజెక్ట్](../chapter-01-foundation/first-project.md)
- **➡️ తదుపరి**: [AI మోడల్ డిప్లాయ్‌మెంట్](ai-model-deployment.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 3: కాన్ఫిగరేషన్](../chapter-03-configuration/configuration.md)

**సహాయం కావాలా?** మా కమ్యూనిటీ చర్చల్లో చేరండి లేదా రిపాజిటరీలో ఒక ఇష్యూ ఓపెన్ చేయండి. Azure AI + AZD కమ్యూనిటీ మీ విజయానికి సహాయం చేయడానికి ఇక్కడ ఉంది!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**నిరాకరణ**:
ఈ డాక్యుమెంట్‌ను AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ద్వారా అనువదించబడి ఉంది. మేము ఖచ్చితత్వానికి శ్రద్ధ పెడతామైనా, స్వయంచాలక అనువాదాల్లో పొరపాట్లు లేదా లోపాలు ఉండవచ్చు అని దయచేసి గమనించండి. మూల భాషలో ఉన్న అసలైన డాక్యుమెంట్‌ను అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం వృత్తిపరులైన మానవ అనువాదం సిఫార్సు చేయబడుతుంది. ఈ అనువాదం వినియోగం వల్ల ఏర్పడిన ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడాలపై మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->