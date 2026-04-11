# Microsoft Foundry ను AZD తో సమ్మేళనం

**అధ్యాయ నావిగేషన్:**
- **📚 కోర్స్ హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 2 - AI-ప్రథమ అభివృద్ధి
- **⬅️ ముందటి అధ్యాయం**: [అధ్యాయం 1: మీ మొదటి ప్రాజెక్ట్](../chapter-01-foundation/first-project.md)
- **➡️ తరువాత**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 3: కాన్ఫిగరేషన్](../chapter-03-configuration/configuration.md)

## సారాంశం

ఈ గైడ్ Microsoft Foundry సర్వీసులను Azure Developer CLI (AZD) తో 어떻게 సమ్మిళితం చేయాలో చూపిస్తుంది, తద్వారా AI అప్లికేషన్ల డిప్లాయ్‌మెంట్ క్లిష్టత తగ్గుతుంది. Microsoft Foundry AI అప్లికేషన్లు నిర్మించడానికి, డిప్లాయ్ చేయడానికి మరియు నిర్వహించడానికి సమగ్ర వేదికను అందిస్తుంది, కాని AZD ను ఉపయోగించడం ఇన్‌ఫ్రాస్ట్రక్చర్ మరియు డిప్లాయ్‌మెంట్ ప్రక్రియను సరళతరం చేస్తుంది.

## Microsoft Foundry అన్నది ఏమిటి?

Microsoft Foundry అనేది Microsoft యొక్క ఏకీకృత AI అభివృద్ధి ప్లాట్‌ఫారమ్, దీనిలో ఉన్నాయి:

- **Model Catalog**: ఆధునిక AI మోడల్స్ కు యాక్సెస్
- **Prompt Flow**: AI వర్క్‌ఫ్లోల కోసం విజువల్ డిజైనర్
- **Microsoft Foundry Portal**: AI అప్లికేషన్ల కోసం సమగ్ర అభివృద్ధి వాతావరణం
- **Deployment Options**: బహుళ హోస్టింగ్ మరియు స్కేలింగ్ ఎంపికలు
- **Safety and Security**: బిల్ట్-ఇన్ బాధ్యతాయుత AI ఫీచర్లు

## AZD + Microsoft Foundry: కలిసి మెరుగ్గా

| ఫీచర్ | Microsoft Foundry | AZD ఇంటిగ్రేషన్ లాభం |
|---------|-----------------|------------------------|
| **Model Deployment** | మాన్యువల్ పోర్టల్ ద్వారా డిప్లాయ్‌మెంట్ | ఆటోమేటెడ్, పునరావృతంగా అమలు చేయగలిగే డిప్లాయ్‌మెంట్‌లు |
| **Infrastructure** | క్లిక్-థ్రూ ప్రొవిజనింగ్ | Infrastructure as Code (Bicep) |
| **Environment Management** | ఒకే ఎన్విరాన్మెంట్ దృష్టి | బహుళ ఎన్విరాన్మెంట్లు (dev/staging/prod) |
| **CI/CD Integration** | పరిమిత | నేటివ్ GitHub Actions మద్దతు |
| **Cost Management** | ప్రాథమిక మానిటరింగ్ | ఎన్విరాన్మెంట్-నిర్దిష్ట ఖర్చు ఆప్టిమైజేషన్ |

## అవసరాలు

- సరైన అనుమతులతో Azure సబ్‌స్క్రిప్షన్
- Azure Developer CLI ఇన్‌స్టాల్ చేయబడింది
- Microsoft Foundry Models సర్వీసులకు యాక్సెస్
- Microsoft Foundry గురించి బేసిక్ పరిచయం

> **ప్రస్తుత AZD బేస్‌లైన్:** ఈ ఉదాహరణలు `azd` `1.23.12`పై సమీక్షించబడ్డాయి. AI ఏజెంట్ వర్క్‌ఫ్లో కోసం, ప్రివ్యూలో ఉన్న ఎక్స్‌టెన్షన్ విడుదలను ఉపయోగించండి మరియు ప్రారంభంలో మీ ఇన్స్టాల్ చేసిన వెర్షన్ తనిఖీ చేయండి.

## ప్రధాన ఇంటిగ్రేషన్ నమూనాలు

### నమూనా 1: Microsoft Foundry Models ఇంటిగ్రేషన్

**ఉపయోగం**: Microsoft Foundry Models మోడల్స్‌తో చాట్ అప్లికేషన్లు డిప్లాయ్ చేయండి

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

### నమూనా 2: AI Search + RAG ఇంటిగ్రేషన్

**ఉపయోగం**: retrieval-augmented generation (RAG) అప్లికేషన్లు డిప్లాయ్ చేయడం

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

### నమూనా 3: డాక్యుమెంట్ ఇంటెలిజెన్స్ ఇంటిగ్రేషన్

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

### ఎన్విరాన్మెంట్ వేరియబుల్స్ సెటప్

**ప్రొడక్షన్ కాన్ఫిగరేషన్:**
```bash
# ప్రధాన AI సేవలు
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# మోడల్ ఏర్పాట్లు
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# పనితీరు సెట్టింగులు
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**డెవలప్‌మెంట్ కాన్ఫిగరేషన్:**
```bash
# అభివృద్ధి కోసం ఖర్చు-అనుకూల సెట్టింగులు
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

### Foundry కోసం AZD ఎక్స్‌టెన్షన్‌లు

AZD Microsoft Foundry సర్వీసులతో పనిచేసే AI-స్పెసిఫిక్ సామర్థ్యాలను జోడించే ఎక్స్‌టెన్షన్‌లను అందిస్తుంది:

```bash
# Foundry agents విస్తరణను ఇన్‌స్టాల్ చేయండి
azd extension install azure.ai.agents

# ఫైన్-ట్యూనింగ్ విస్తరణను ఇన్‌స్టాల్ చేయండి
azd extension install azure.ai.finetune

# కస్టమ్ మోడల్స్ విస్తరణను ఇన్‌స్టాల్ చేయండి
azd extension install azure.ai.models

# ఇన్‌స్టాల్ చేసిన విస్తరణలను జాబితా చేయండి
azd extension list --installed

# ప్రస్తుతం ఇన్‌స్టాల్ చేయబడిన ఏజెంట్ విస్తరణ వెర్షన్‌ను తనిఖీ చేయండి
azd extension show azure.ai.agents
```

AI ఎక్స్‌టెన్షన్‌లు ఇప్పటికీ ప్రివ్యూ‌లో వేగంగా మారుతున్నాయి. ఒక కమాండ్ ఇక్కడ చూపినట్లుగా పనిచేయకపోతే, ప్రాజెక్ట్‌ను ట్రబుల్‌షూట్ చేయడానికి ముందు సంబంధిత ఎక్స్‌టెన్షన్‌ని అప్‌డేట్ చేయండి.

### `azd ai` తో Agent-First డిప్లాయ్‌మెంట్

మీకు ఏజెంట్ మానిఫెస్ట్ ఉంటే, Foundry Agent Serviceకు వైర్డ్ అయిన ప్రాజెక్ట్‌ను స్కాఫోల్డ్ చేయడానికి `azd ai agent init` ను ఉపయోగించండి:

```bash
# ఏජెంట్ మానిఫెస్ట్ నుండి ప్రారంభించండి
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azureకి అమలు చేయండి
azd up
```

`azure.ai.agents` యొక్క ఇటీవల ప్రివ్యూ విడుదలలు `azd ai agent init` కోసం టెంప్లేట్-ఆధారిత ఆరంభ మద్దతును కూడా జతచేశాయి. మీరు కొత్త ఏజెంట్ సాంపుల్స్‌ను అనుసరిస్తున్నట్లయితే, మీ ఇన్స్టాల్ చేసిన వెర్షన్‌లో లభ్యమయ్యే ఖచ్చితమైన ఫ్లాగ్‌ల కోసం ఎక్స్‌టెన్షన్ సహాయాన్ని తనిఖీ చేయండి.

పూర్తి కమాండ్ సూచన మరియు ఫ్లాగ్‌ల కోసం [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) చూడండి.

### ఒకే కమాండ్ డిప్లాయ్‌మెంట్

```bash
# ఒకే కమాండ్‌తో అన్ని డిప్లాయ్ చేయండి
azd up

# లేదా విడతలుగా డిప్లాయ్ చేయండి
azd provision  # కేవలం మౌలిక సదుపాయాలు
azd deploy     # అనువర్తనం మాత్రమే

# azd 1.23.11+లో దీర్ఘకాలం నడిచే AI అప్లికేషన్ డిప్లాయ్‌మెంట్స్ కోసం
azd deploy --timeout 1800
```

### ఎన్విరాన్మెంట్-నిర్దిష్ట డిప్లాయ్‌మెంట్లు

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

## మానిటరింగ్ మరియు అవలోకనం

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

## 🔐 సెక్యూరిటీ ఉత్తమ అభ్యాసాలు

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

### నెట్‌వర్క్ సెక్యూరిటీ

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

## పర్ఫార్మెన్స్ ఆప్టిమైజేషన్

### కాచింగ్ వ్యూహాలు

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

## సాధారణ సమస్యల ట్రబుల్‌షూట్

### సమస్య 1: OpenAI క్వోటా అధిగమించబడింది

**లక్షణాలు:**
- క్వోటా లోపాల కారణంగా డిప్లాయ్‌మెంట్ విఫలమవడం
- అప్లికేషన్ లాగ్‌లలో 429 ఎర్రర్లు

**పరిష్కారాలు:**
```bash
# ప్రస్తుత క్వోటా వినియోగాన్ని తనిఖీ చేయండి
az cognitiveservices usage list --location eastus

# వేరే ప్రాంతాన్ని ప్రయత్నించండి
azd env set AZURE_LOCATION westus2
azd up

# తాత్కాలికంగా సామర్థ్యాన్ని తగ్గించండి
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### సమస్య 2: ప్రమాణీకరణ వైఫల్యాలు

**లక్షణాలు:**
- AI సర్వీసులను కాల్ చేసే సమయంలో 401/403 ఎర్రర్లు
- "Access denied" సందేశాలు

**పరిష్కారాలు:**
```bash
# పాత్ర కేటాయింపులను ధృవీకరించండి
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# నియంత్రిత గుర్తింపు కాన్ఫిగరేషన్‌ను తనిఖీ చేయండి
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault యాక్సెస్‌ను ధృవీకరించండి
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### సమస్య 3: మోడల్ డిప్లాయ్‌మెంట్ సమస్యలు

**లక్షణాలు:**
- డిప్లాయ్‌లో మోడల్స్ అందుబాటులో లేకపోవడం
- విశిష్ట మోడల్ వెర్షన్లు ఫెయిల్ అవ్వడం

**పరిష్కారాలు:**
```bash
# ప్రాంతం వారీగా అందుబాటులో ఉన్న మోడళ్లు జాబితా చేయండి
az cognitiveservices model list --location eastus

# Bicep టెంప్లేట్‌లో మోడల్ సంస్కరణను నవీకరించండి
# మోడల్ సామర్థ్య అవసరాలను తనిఖీ చేయండి
```

## ఉదాహరణ టెంప్లేట్లు

### RAG చాట్ అప్లికేషన్ (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**వివరణ**: అత్యంత ప్రజాదరణ పొందిన Azure AI స్యాంపిల్ — ఇది మీ స్వంత డాక్యుమెంట్లపై ప్రశ్నలు అడగడానికి ఉత్పత్తి-సిద్ధ RAG చాట్ యాప్. చాట్ కోసం GPT-4.1-mini, embeddings కోసం text-embedding-3-large మరియు రిట్రీవల్ కోసం Azure AI Search ఉపయోగిస్తుంది. బహుమాధ్యమైన డాక్యుమెంట్లు, స్పీచ్ ఇన్‌పుట్/ఔట్పుట్, Microsoft Entra ప్రమాణీకరణ, మరియు Application Insights ట్రేసింగ్‌కు మద్దతు ఉంది.

**త్వరిత ప్రారంభం**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG చాట్ అప్లికేషన్ (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**వివరణ**: Python RAG చాట్ స్యాంపిల్ యొక్క .NET/C# సమానమైన వెర్షన్. ASP.NET Core Minimal API మరియు Blazor WebAssembly ఫ్రంట్ ఎండ్‌తో నిర్మింపబడినది. వాయిస్ చాట్, GPT-4o-mini విజన్ మద్దతు, మరియు స‌హాయక .NET MAUI Blazor హైబ్రిడ్ డెస్క్‌టాప్/మొబైల్ క్లయింట్‌ను కలిగి ఉంటుంది.

**త్వరిత ప్రారంభం**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG చాట్ అప్లికేషన్ (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**వివరణ**: Langchain4J ఉపయోగించి AI ఆర్కెస్ట్రేషన్ కోసం Java వెర్షన్. మైక్రోసర్వీస్ ఈవెంట్-డ్రివెన్ ఆర్కిటెక్చర్, టెక్స్ట్/వెక్టర్/హైబ్రిడ్ వంటి బహురూప శోధన వ్యూహాలు, Azure Document Intelligence తో డాక్యుమెంట్ అప్లోడ్ మరియు Azure Container Apps లేదా Azure Kubernetes Service పై డిప్లాయ్ మద్దతును కలిగి ఉంటుంది.

**త్వరిత ప్రారంభం**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**వివరణ**: Azure AI Foundry మరియు Prompty ఉపయోగించే అన్ని-దశల రిటెయిల్ RAG కోపైలట్. ఇది Contoso Outdoor రిటైలర్ చాట్‌బాట్, ఇది నిలుపుబడిన ప్రతిస్పందనలను ప్రొడక్ట్ క్యాటలాగ్ మరియు కస్టమర్ ఆర్డర్ డేటా ఆధారంగా ఉంచుతుంది. పూర్తి GenAIOps వర్క్‌ఫ్లోని ప్రదర్శిస్తుంది — Prompty తో ప్రోటోటైప్, AI-అసిస్టెడ్ ఎవాల్యుటర్లతో మూల్యాంకనం, మరియు AZD ద్వారా Container Apps కు డిప్లాయ్ చేయడం.

**త్వరిత ప్రారంభం**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent అప్లికేషన్

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**వివరణ**: Prompty తో AI ఏజెంట్ ఆర్కెస్ట్రేషన్‌ను ప్రదర్శించే మల్టీ-ఏజెంట్ స్యాంపిల్. పరిశోధనా ఏజెంట్ (Bing Grounding in Azure AI Agent Service), ప్రొడక్ట్ ఏజెంట్ (Azure AI Search), రైటర్ ఏజెంట్ మరియు ఎడిటర్ ఏజెంట్ కలిసి బాగా పరిశోధించిన వ్యాసాలను సృష్టిస్తాయి. GitHub Actions లో ఎవాల్యువేషన్ తో CI/CD కూడా ఉంది.

**త్వరిత ప్రారంభం**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG చాట్ (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**వివరణ**: API కోసం Azure Functions మరియు హోస్టింగ్ కోసం Azure Static Web Apps ఉపయోగించే పూర్తిగా సర్వర్‌లెస్ RAG చాట్‌బాట్. Azure Cosmos DB ను వెక్టర్ స్టోర్ మరియు చాట్ హిస్టరీ డేటాబేస్‌గా ఉపయోగిస్తుంది. శూన్య-ఖర్చు టెస్టింగ్ కోసం స్థానిక అభివృద్ధి Ollama తో మద్దతు ఇస్తుంది.

**త్వరిత ప్రారంభం**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**వివరణ**: డాక్యుమెంట్ అప్లోడ్/నిర్వహణ కోసం అడ్మిన్ పోర్టల్ ఉన్న ఎంటర్‌ప్రైజ్-గ్రేడ్ RAG సొల్యూషన్ ఆక్సిలరేటర్. వివిధ ఆర్కెస్ట్రేటర్ ఎంపికలు (Semantic Kernel, LangChain, Prompt Flow), స్పీచ్-టు-టెక్స్ట్, Microsoft Teams ఇంటిగ్రేషన్, మరియు PostgreSQL లేదా Cosmos DB బ్యాకెండ్ ఎంపికను అందిస్తుంది. ప్రొడక్షన్ RAG సన్నివేశాల ప్రారంభ బిందువు కోసం అనుకూలీకరించదగిన విధంగా రూపొందించబడింది.

**త్వరిత ప్రారంభం**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI ట్రావెల్ ఏజెంట్స్ — Multi-Agent MCP ఆర్కెస్ట్రేషన్

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**వివరణ**: మూడు ఫ్రేమ్‌వర్క్‌లను (LangChain.js, LlamaIndex.TS, మరియు Microsoft Agent Framework) ఉపయోగించే మల్టీ-ఏజెంట్ AI ఆర్కెస్ట్రేషన్ కోసం రిఫరెన్స్ అప్లికేషన్. నాలుగు భాషల్లో MCP (Model Context Protocol) సర్వర్లు సర్వర్‌లెస్ Azure Container Apps గా డిప్లాయ్ చేయబడి OpenTelemetry మానిటరింగ్ కలిగి ఉన్నాయి.

**త్వరిత ప్రారంభం**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**వివరణ**: Azure AI సర్వీసులను కాన్ఫిగర్డ్ మిషీన్ లెర్నింగ్ మోడల్స్‌తో డిప్లాయ్ చేయే מינిమల్ Bicep టెంప్లేట్. పూర్తి అప్లికేషన్ స్టాక్ అవసరం లేకుండా ఆజ్యూర్ AI ఇన్‌ఫ్రాస్ట్రక్చర్ మాత్రమే ప్రొవిజన్ చేయాల్సిన సందర్భాల్లో లైట్‌వెయిట్ ప్రారంభ బిందువు.

**త్వరిత ప్రారంభం**:
```bash
azd init --template azd-ai-starter
azd up
```

> **ఇంకా టెంప్లేట్లు బ్రౌజ్ చేయండి**: 80+ AI-స్పెసిఫిక్ AZD టెంప్లేట్ల కోసం భాషలు మరియు సన్నివేశాలపై [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) ను సందర్శించండి.

## తదుపరి దశలు

1. **ఉదాహరణలు పరీక్షించండి**: మీ వినియోగానికి అనుకూలంగా తయారైన టెంప్లేట్‌తో ప్రారంభించండి
2. **మీ అవసరాలకు అనుగుణంగా సవరించండి**: ఇన్‌ఫ్రాస్ట్రక్చర్ మరియు అప్లికేషన్ కోడ్‌ను మార్చండి
3. **మానిటరింగ్ జోడించండి**: సమగ్ర అవలోకనం అమలు చేయండి
4. **ఖర్చులను ఆప్టిమైజ్ చేయండి**: మీ బడ్జెట్‌కు సరిపడే విధంగా కాన్ఫిగరేషన్లను సెట్ చేయండి
5. **మీ డిప్లాయ్‌మెంట్‌ను సురక్షితం చేయండి**: ఎంటర్‌ప్రైజ్ సెక్యూరిటీ నమూనాల్ని అమలు చేయండి
6. **ప్రొడక్షన్‌కు స్కేల్ చేయండి**: బహుళ-రీజియన్ మరియు హై-అవైలబిలిటీ ఫీచర్లను జోడించండి

## 🎯 ప్రాయోగిక వ్యాయామాలు

### వ్యాస్యం 1: Microsoft Foundry Models చాట్ యాప్‌ను డిప్లాయ్ చేయడం (30 నిమిషాలు)
**లక్ష్యం**: ప్రొడక్షన్-రెడీ AI చాట్ అప్లికేషన్‌ను డిప్లాయ్ చేసి పరీక్షించండి

```bash
# టెంప్లేట్‌ను ప్రారంభించండి
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# పర్యావరణ వేరియబుల్స్‌ను సెట్ చేయండి
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# డిప్లాయ్ చేయండి
azd up

# అనువర్తనాన్ని పరీక్షించండి
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# ఏఐ కార్యకలాపాలను పర్యవేక్షించండి
azd monitor

# శుభ్రపరచండి
azd down --force --purge
```

**విజయ ప్రమాణాలు:**
- [ ] డిప్లాయ్‌మెంట్ క్వోటా లోపాలు లేకుండా పూర్తి అవాలి
- [ ] బ్రౌజర్‌లో చాట్ ఇంటర్‌ఫేస్‌కు యాక్సెస్ చేయగలగాలి
- [ ] ప్రశ్నలు అడిగి AI ఆధారిత ప్రతిస్పందనలు పొందగలగాలి
- [ ] Application Insightsలో టెలిమిత్రి డేటా ప్రదర్శించబడాలి
- [ ] రిసోర్సులు విజయవంతంగా శుభ్రం చేయబడ్డాయి

**అంచనా ఖర్చు**: $5-10 (30 నిమిషాల టెస్టింగ్)

### వ్యాస్యం 2: బహు-మోడల్ డిప్లాయ్‌మెంట్ కాన్ఫిగర్ చేయండి (45 నిమిషాలు)
**లక్ష్యం**: వేరున్న కాన్ఫిగరేషన్లతో బహు AI మోడల్స్‌ను డిప్లాయ్ చేయండి

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

# డిప్లాయ్ చేసి నిర్ధారించండి
azd provision
azd show
```

**విజయ ప్రమాణాలు:**
- [ ] బహుళ మోడల్స్ విజయవంతంగా డిప్లాయ్ చేయబడ్డాయి
- [ ] వేరే వేరు కెపాసిటీ సెట్టింగ్స్ వర్తించబడ్డాయి
- [ ] మోడల్స్ API ద్వారా యాక్సెస్ చేయదగినవి
- [ ] అప్లికేషన్ నుండి రెండింటినీ కాల్ చేయగలగాలి

### వ్యాస్యం 3: ఖర్చు మానిటరింగ్ అమలు చేయండి (20 నిమిషాలు)
**లక్ష్యం**: బడ్జెట్ అలెర్ట్‌లు మరియు ఖర్చు ట్రాకింగ్ సెట్ చేయండి

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

# బడ్జెట్ అలర్ట్ అమలు చేయండి
azd provision

# ప్రస్తుత ఖర్చులను తనిఖీ చేయండి
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**విజయ ప్రమాణాలు:**
- [ ] Azureలో బడ్జెట్ అలెర్ట్ సృష్టించబడింది
- [ ] Email నోటిఫికేషన్స్ కాన్ఫిగర్ చేయబడ్డాయి
- [ ] Azure పోర్టల్‌లో ఖర్చు డేటా చూడవచ్చు
- [ ] బడ్జెట్ థ్రెషోల్డ్లు సరి అయినవిగా సెట్ చేయబడ్డాయి

## 💡 ఎక్కువగా అడిగే ప్రశ్నలు

<details>
<summary><strong>డెవలప్మెంట్ సమయంలో Microsoft Foundry Models ఖర్చులను ఎలా తగ్గించగలను?</strong></summary>

1. **ఫ్రీ టియర్ ఉపయోగించండి**: Microsoft Foundry Models నెలకు 50,000 tokens ఉచితం అందిస్తుంది
2. **కెపాసిటీ తగ్గించండి**: dev కోసం 30+ బదులు కెపాసిటీని 10 TPM గా సెట్ చేయండి
3. **azd down ఉపయోగించండి**: సక్రియంగా అభివృద్ధి చేయడంలేకపోతే రిసోర్సులను డి-అలోకేట్ చేయండి
4. **రెస్పాన్సులను క్యాష్ చేయండి**: పునరావృత ప్రశ్నల కోసం Redis క్యాష్ అమలు చేయండి
5. **Prompt Engineering ఉపయోగించండి**: సమర్ధవంతమైన prompts తో token వినియోగాన్ని తగ్గించండి

</details>
```bash
# అభివృద్ధి కాన్ఫిగరేషన్
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models మరియు OpenAI API మధ్య తేడా ఏమిటి?</strong></summary>

**Microsoft Foundry Models**:
- ఎంటర్‌ప్రైజ్ భద్రత మరియు కంప్లెయిన్స్
- ప్రైవేట్ నెట్‌వర్క్ ఇంటిగ్రేషన్
- SLA హామీలు
- Managed identity ప్రమాణీకరణ
- ఎక్కువ కోటా లభ్యమవుతుంది

**OpenAI API**:
- కొత్త మోడల్స్‌కి వేగంగా ప్రాప్యత
- సులభమైన సెటప్
- ప్రవేశానికి తక్కువ ఆటవికరం
- పబ్లిక్ ఇంటర్నెట్ మాత్రమే

ఉత్పత్తి అనువర్తనాల కోసం, **Microsoft Foundry Models సిఫార్సు చేయబడుతుంది**.
</details>

<details>
<summary><strong>Microsoft Foundry Models కోటా అదుపు తప్పిపోయిన తప్పిదాలను ఎలా నిర్వహించాలి?</strong></summary>

```bash
# ప్రస్తుత క్వోటాను తనిఖీ చేయండి
az cognitiveservices usage list --location eastus2

# వేరే ప్రాంతాన్ని ప్రయత్నించండి
azd env set AZURE_LOCATION westus2
azd up

# తాత్కాలికంగా సామర్థ్యాన్ని తగ్గించండి
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# క్వోటా పెంపుకు అభ్యర్థించండి
# Azure పోర్టల్ > క్వోటాలు > పెంపుకు అభ్యర్థించడానికి వెళ్లండి
```
</details>

<details>
<summary><strong>నా స్వంత డేటాను Microsoft Foundry Models తో ఉపయోగించవచ్చా?</strong></summary>

ఉన్నది! RAG (Retrieval Augmented Generation) కోసం **Azure AI Search** ను ఉపయోగించండి:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

చూసుకోండి [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) టెంప్లేట్.
</details>

<details>
<summary><strong>AI మోడల్ ఎండ్‌పాయింట్‌లను నేను ఎలా భద్రపరచగలను?</strong></summary>

**ఉత్తమ ఆచరణలు**:
1. Managed Identity ఉపయోగించండి (API కీలు పెట్టకండి)
2. Private Endpoints సక్రియం చేయండి
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

## కమ్యూనిటీ మరియు సపోర్ట్

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - మీ ఎడిటర్‌లో Azure + Foundry agent skills ను `npx skills add microsoft/github-copilot-for-azure` తో ఇన్‌స్టాల్ చేయండి

---

**చాప్టర్ నావిగేషన్:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**సహాయం కావాలా?** మన కమ్యూనిటీ చర్చల్లో చేరండి లేదా రిపోజిటరీలో ఇష్యూ ఓపెన్ చేయండి. Azure AI + AZD కమ్యూనిటీ మీ విజయానికి సహాయం చేయడానికి ఇక్కడ ఉంది!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**నిరాకరణ**:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించారు. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో తప్పులు లేదా అసంపూర్ణతలు ఉండే అవకాశం ఉందని దయచేసి గమనించండి. మూల పత్రాన్ని దాని స్థానిక భాషలోనే అధికారిక మూలంగా పరిగణించాలి. ముఖ్యమైన సమాచారం కోసం వృత్తిపరమైన మానవ అనువాదం సిఫార్సు చేయబడుతుంది. ఈ అనువాదాన్ని ఉపయోగించడం వలన ఏర్పడే ఏవైనా అవగాహనా తప్పులు లేదా తప్పుగా అర్థం చేసుకోవడాలకు మేము బాధ్యులమేమి కాదని గమనించండి.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->