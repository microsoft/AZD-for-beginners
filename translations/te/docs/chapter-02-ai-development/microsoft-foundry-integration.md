# Microsoft Foundry Integration with AZD

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్స్ హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 2 - AI-మొదటి అభివృద్ధి
- **⬅️ గత అధ్యాయం**: [అధ్యాయం 1: మీ మొదటి ప్రాజెక్ట్](../chapter-01-foundation/first-project.md)
- **➡️ తదుపరి**: [AI మోడల్ డిప్లాయ్‌మెంట్](ai-model-deployment.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 3: కాన్ఫిగరేషన్](../chapter-03-configuration/configuration.md)

## అవలోకనం

ఈ మార్గదర్శకం Microsoft Foundry సేవలను Azure Developer CLI (AZD) తో ఏకీకృతం చేసుకోవడం ద్వారా సులభతరమైన AI యాప్‌ల డిప్లాయ్‌మెంట్ ఎలా జరగాలో ప్రదర్శిస్తుంది. Microsoft Foundry AI యాప్‌లను నిర్మించడం, డిప్లాయ్ చేయడం, నిర్వహించడానికి సమగ్ర వేదికను అందిస్తుంది, AZD వాతావరణ మరియు డిప్లాయ్‌మెంట్ ప్రక్రియను సరళీకరిస్తుంది.

## Microsoft Foundry అంటే ఏమిటి?

Microsoft Foundry అనేది Microsoft యొక్క ఐక్యత AI అభివృద్ధి వేదిక, దీనిలో:

- **మోడల్ కెటలాగ్**: అతి ఆధునిక AI మోడల్స్‌కి ప్రాప్తి
- **ప్రాంప్ట్ ఫ్లో**: AI వర్క్‌ఫ్లోలకు విజువల్ డిజైనర్
- **Microsoft Foundry పోర్టల్**: AI యాప్ల కోసం ఏకీకృత అభివృద్ధి వాతావరణం
- **డిప్లాయ్‌మెంట్ ఎంపికలు**: బహు హోస్టింగ్ మరియు స్కేలింగ్ ఎంపికలు
- **సురక్షత మరియు భద్రత**: తెలివైన బాధ్యతాయుత AI లక్షణాలు

## AZD + Microsoft Foundry: కలిసి బాగా పని చేస్తుంది

| లక్షణం | Microsoft Foundry | AZD అనుసంధానం లాభం |
|---------|-----------------|------------------------|
| **మోడల్ డిప్లాయ్‌మెంట్** | మానవీయ పోర్టల్ డిప్లాయ్‌మెంట్ | సవాల్ చేయదగిన, ఆటోమేటెడ్ డిప్లాయ్‌మెంట్లు |
| **రూపకల్పన** | క్లిక్-త్రూ ప్రోవిజనింగ్ | ఇన్ఫ్రాస్ట్రక్చర్ అస్ కోడ్ (Bicep) |
| **పర్యావరణ నిర్వహణ** | ఒక్క వాతావరణ దృష్టి | బహు-పర్యావరణ (డెవ్/స్టేజింగ్/ప్రొడక్షన్) |
| **CI/CD అనుసంధానం** | పరిమితి | స్వदेशీ గిట్‌లబ్ యాక్షన్స్ మద్దతు |
| **ఖర్చు నిర్వహణ** | ప్రాథమిక మానిటరింగ్ | వాతావరణ-ప్రత్యేక ఖర్చు ఆప్టిమైజేషన్ |

## ముందస్తు అవసరాలు

- అనుమతులు ఉన్న Azure సబ్‌స్క్రిప్షన్
- Azure Developer CLI ఇన్‌స్టాల్ చేయబడినది
- Microsoft Foundry మోడల్స్ సర్వీసుల ప్రాప్తి
- Microsoft Foundry గురించి ప్రాథమిక పరిచయం

> **ప్రస్తుత AZD బేస్‌లైన్:** ఈ ఉదాహరణలు `azd` `1.27.1` ద్వారా సమీక్షించబడ్డాయి. AI ఏజెంట్ వర్క్‌ఫ్లో కోసం ప్రస్తుత ప్రీవ్యూ ఎక్స్‌టెన్షన్ రీలీజ్ వాడండి మరియు ప్రారంభించే ముందు మీ ఇన్‌స్టాల్డ్ వెర్షన్‌ని తనిఖీ చేయండి.

## ప్రధాన అనుసంధాన నమూనాలు

### నమూనా 1: Microsoft Foundry మోడల్స్ అనుసంధానం

**వినియోగం**: Microsoft Foundry మోడల్స్ మోడల్స్‌తో చాట్ యాప్‌లను డిప్లాయ్ చేయండి

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

### నమూనా 2: AI సెర్చ్ + RAG అనుసంధానం

**వినియోగం**: రిట్రీవల్-ఆగ్మెంటెడ్ జనరేషన్ (RAG) యాప్‌లను డిప్లాయ్ చేయండి

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

### నమూనా 3: డాక్యుమెంట్ ఇంటెలిజెన్స్ అనుసంధానం

**వినియోగం**: డాక్యుమెంట్ ప్రాసెసింగ్ మరియు విశ్లేషణ వర్క్‌ఫ్లోలు

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

### వాతావరణ వేరియబుల్స్ సెటప్

**ప్రొడక్షన్ కాన్ఫిగరేషన్:**
```bash
# ముఖ్య AI సేవలు
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# మోడల్ కాన్ఫిగరేషన్లు
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# పనితీరు సెట్టింగులు
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**డెవలప్‌మెంట్ కాన్ఫిగరేషన్:**
```bash
# అభివృద్ధికి ఖర్చు-ఆప్టిమైజ్డ్ సెట్టింగులు
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # ఉచిత స్థాయి
```

### కీ వాల్ట్‌తో సురక్షిత కాన్ఫిగరేషన్

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

### Foundry కోసం AZD ఎక్స్‌టెన్షన్స్

AZD Microsoft Foundry సేవలతో పనిచేయడానికి AI-ప్రత్యేక సామర్థ్యాలను చేర్చే ఎక్స్‌టెన్షన్స్ అందిస్తుంది:

```bash
# ఫౌండ్రీ ఏజెంట్‌ల విస్తరణను ఇన్స్టాల్ చేయండి
azd extension install azure.ai.agents

# ఫైన్-ట్యూనింగ్ విస్తరణాన్ని ఇన్స్టాల్ చేయండి
azd extension install azure.ai.finetune

# కస్టమ్ మోడల్స్ విస్తరణను ఇన్స్టాల్ చేయండి
azd extension install azure.ai.models

# ఇన్స్టాల్ చేసిన విస్తరణలను జాబితా చేయండి
azd extension list --installed

# ప్రస్తుతంగా ఇన్స్టాల్ చేసిన ఏజెంట్ విస్తరణ వెర్షన్‌ను పరిశీలించండి
azd extension show azure.ai.agents
```

AI ఎక్స్‌టెన్షన్స్ అర్థం చేసుకోవడానికి ఇంకా త్వరగా ప్రివ్యూ‌లో ఉన్నాయి. ఒక కమాండ్ ఇక్కడ చూపిన విధంగా పనిచేయకపోతే, ప్రాజెక్ట్‌ను ట్రబుల్‌షూట్ చేయక ముందే సంబంధిత ఎక్స్‌టెన్షన్‌ను అప్డేట్ చేయండి.

### `azd ai` తో ఏజెంట్-మొదటి డిప్లాయ్‌మెంట్

మీరు ఏజెంట్ మానిఫెస్ట్ ఉంటే, Microsoft Foundry ఏజెంట్ సర్వీస్‌కు వెంటనే ప్రాజెక్ట్ రూపొందించడానికి `azd ai agent init` ఉపయోగించండి:

```bash
# ఏజెంట్ మనిఫెస్ట్ నుండి ప్రారంభించండి
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ఆజ్యూర్‌కు అమర్చండి
azd up
```

`azure.ai.agents` తాజా ప్రివ్యూ విడుదలలు కూడా `azd ai agent init` కోసం టెంప్లేట్ ఆధారిత ప్రారంభ మద్దతును చేర్చాయి. మీరు తాజా ఏజెంట్ ఉదాహరణలను అనుసరిస్తున్నట్లయితే, మీ ఇన్‌స్టాల్డ్ వెర్షన్‌లో అందుబాటులో ఉన్న ఖచ్చితమైన ఫ్లాగ్‌ల కోసం ఎక్స్‌టెన్షన్ సహాయాన్ని తనిఖీ చేయండి.

పూర్తి కమాండ్ సూచిక మరియు ఫ్లాగ్‌ల కోసం [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) చూడండి.

### సింగిల్ కమాండ్ డిప్లాయ్‌మెంట్

```bash
# ఒక ఆదేశంతో అన్ని అమర్చండి
azd up

# లేదా క్ర‌మేణ తేలిక‌గా అమర్చండి
azd provision  # మాత్ర‌మే మౌలిక సదుపాయాలు
azd deploy     # మాత్ర‌మే అనువర్తనం

# అజ్డ్ 1.23.11+ లో దీర్ఘకాలిక AI అనువర్తన అమరికల కోసం
azd deploy --timeout 1800
```

### వాతావరణ-ప్రత్యేక డిప్లాయ్‌మెంట్లు

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

### అప్లికేషన్ ఇన్‌సైట్స్ అనుసంధానం

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

## 🔐 సెక్యూరిటీ ఉత్తమ పద్దతులు

### నిర్వహిత గుర్తింపు కాన్ఫిగరేషన్

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

## పనితీరు మెరుగుదల

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

## సాధారణ సమస్యల నिवारణ

### సమస్య 1: OpenAI కోటా మించిపోయింది

**లక్షణాలు:**
- డిప్లాయ్‌మెంట్ కోటా లోపాలతో విఫలమవుతుంది
- అప్లికేషన్ లాగ్స్‌లో 429 లోపాలు

**పరిష్కారాలు:**
```bash
# ప్రస్తుత కోటా ఉపయోగాన్ని పరిశీలించండి
az cognitiveservices usage list --location eastus

# వేరే ప్రాంతాన్ని ప్రయత్నించండి
azd env set AZURE_LOCATION westus2
azd up

# సామర్థ్యాన్ని తాత్కాలికంగా తగ్గించండి
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### సమస్య 2: ప్రామాణీకరణ విఫలమవ్వడం

**లక్షణాలు:**
- AI సర్వీసులకి పిలుపుల సమయంలో 401/403 లోపాలు
- "ప్రాప్తి నిరాకరణ" సందేశాలు

**పరిష్కారాలు:**
```bash
# పాత్ర నియామకాలను ధృవీకరించండి
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# నిర్వహించిన ఐడెంటిటీ కాన్ఫిగరేషన్‌ను తనిఖీ చేయండి
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# కీ వాల్ట్ ప్రవేశాన్ని సరిచూడండి
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### సమస్య 3: మోడల్ డిప్లాయ్‌మెంట్ సమస్యలు

**లక్షణాలు:**
- డిప్లాయ్‌మెంట్‌లో మోడల్స్ అందుబాటులో లేవు
- నిర్దిష్ట మోడల్ సంస్కరణలు విఫలమవుతున్నాయి

**పరిష్కారాలు:**
```bash
# ప్రాంతం ద్వారా అందుబాటులో ఉన్న మోడలులను జాబితా చేయండి
az cognitiveservices model list --location eastus

# బిసెప్ టెంప్లేట్‌లో మోడల్ సంస్కరణను అప్‌డేట్ చేయండి
# మోడల్ సామర్థ్య అవసరాలను తనిఖీ చేయండి
```

## ఉదాహరణ టెంప్లేట్లు

### RAG చాట్ యాప్ (Python)

**రిపోజిటరీ**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**సేవలు**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**వివరణ**: అత్యంత ప్రజాదరణ పొందిన Azure AI నమూనా — ఉత్పత్తి-సిద్ధ RAG చాట్ యాప్, ఇది మీ స్వంత డాక్యుమెంట్లపై ప్రశ్నలు అడగడానికి అనుమతిస్తుంది. GPT-4.1-mini చాట్ కోసం, text-embedding-3-large ఎంబెడ్డింగ్‌ల కోసం మరియు Azure AI సెర్చ్ రిట్రీవల్ కోసం ఉపయోగిస్తుంది. బహుముఖ డాక్యుమెంట్లు, స్పీచ్ ఇన్‌పుట్/అవుట్‌పుట్, Microsoft Entra ప్రామాణీకరణ మరియు అప్లికేషన్ ఇన్‌సైట్స్ ట్రేసింగ్‌ను మద్దతు ఇస్తుంది.

**త్వరిత ప్రారంభం**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG చాట్ యాప్ (.NET)

**రిపోజిటరీ**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**సేవలు**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**వివరణ**: Python RAG చాట్ నమూనా యొక్క .NET/C# సమానమైనది. ASP.NET కోర్ మినిమల్ API మరియు బ్లేజర్ వెబ్ అసెంబ్లీ ఫ్రంటెండ్‌తో నిర్మించబడింది. వాయిస్ చాట్, GPT-4o-mini విజన్ మద్దతు, మరియు సహాయక .NET MAUI బ్లేజర్ హైబ్రిడ్ డెస్క్‌టాప్/మొబైల్ క్లయింట్ కలిగి ఉంది.

**త్వరిత ప్రారంభం**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG చాట్ యాప్ (Java)

**రిపోజిటరీ**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**సేవలు**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**వివరణ**: Langchain4J ఉపయోగించి AI ఆర్కెస్ట్రేషన్ కోసం RAG చాట్ నమూనా యొక్క Java వెర్షన్. మైక్రోసర్వీస్ ఈవెంట్-డ్రివెన్ ఆర్కిటెక్చర్, బహు సెర్చ్ వ్యూహాలు (టెక్స్ట్, వెక్టర్, హైబ్రీడ్), Azure డాక్యుమెంట్ ఇంటెలిజెన్స్‌తో డాక్యుమెంట్ అప్లోడ్, మరియు Azure కంటైనర్ యాప్స్ లేదా Azure కుబర్నెటీస్ సర్వీస్‌పై డిప్లాయ్‌మెంట్ మద్దతు ఇస్తుంది.

**త్వరిత ప్రారంభం**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Microsoft Foundryతో ఎంటర్ప్రైజ్ రిటెయిల్ కోపైలట్

**రిపోజిటరీ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**సేవలు**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**వివరణ**: Microsoft Foundry మరియు Prompty ఉపయోగిస్తున్న ఎండ్-టు-ఎండ్ రిటైల్ RAG కోపైలట్. Contoso అవుట్‌డోర్ రిటైలర్ చాట్బాట్, ఇది ప్రోడక్ట్ క్యాటలాగ్ మరియు కస్టమర్ ఆర్డర్ డేటాను ఆధారంగా సమాధానాలిచ్చేలా రూపొందించబడింది. పూర్తి GenAIOps వర్క్‌ఫ్లోని ప్రదర్శిస్తుంది — Prompty తో ప్రోటోటైప్, AI-సహాయిత ఎవాల్యుయేటర్లతో మదింపు, మరియు AZD ద్వారా కంటైనర్ యాప్స్‌కు డిప్లాయ్‌మెంట్.

**త్వరిత ప్రారంభం**:
```bash
azd init --template contoso-chat
azd up
```

### క్రియేటివ్ రైటింగ్ మల్టీ-ఏజెంట్ అప్లికేషన్

**రిపోజిటరీ**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**సేవలు**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**వివరణ**: Promptyతో AI ఏజెంట్ ఆర్కెస్ట్రేషన్‌ని చూపించే మల్టీ-ఏజెంట్ నమూనా. ఒక రీసెర్చ్ ఏజెంట్ (Bing Grounding in Azure AI Agent Service), ఒక ప్రొడక్ట్ ఏజెంట్ (Azure AI Search), ఒక రైటర్ ఏజెంట్, మరియు ఒక ఎడిటర్ ఏజెంట్ కలిసి బాగా పరిశోధించిన ఆర్టికల్స్ తయారు చేస్తారు. GitHub యాక్షన్స్‌లో CI/CD మదింపు సహా ఉంటుంది.

**త్వరిత ప్రారంభం**:
```bash
azd init --template contoso-creative-writer
azd up
```

### సర్వర్లెస్ RAG చాట్ (JavaScript/TypeScript)

**రిపోజిటరీ**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**సేవలు**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**వివరణ**: LangChain.js ఉపయోగించి పూర్తిగా సర్వర్లెస్ RAG చాట్‌బాట్, API కోసం Azure Functions మరియు హోస్టింగ్ కోసం Azure Static Web Apps. Azure Cosmos DBని వెక్టర్ స్టోర్ మరియు చాట్ హిస్టరీ డేటాబేస్గా ఉపయోగిస్తుంది. సున్నా ధర టెస్టింగ్ కోసం Ollamaతో లోకల్ అభివృద్ధిని మద్దతు ఇస్తుంది.

**త్వరిత ప్రారంభం**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### మీ డేటాతో చాట్ సొల్యూషన్ యాక్సలరేటర్

**రిపోజిటరీ**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**సేవలు**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**వివరణ**: డాక్యుమెంట్ అప్లోడ్/నిర్వహణ కోసం అడ్మిన్ పోర్టల్, బహు ఆర్కెస్ట్రేటర్ ఎంపికలు (Semantic Kernel, LangChain, Prompt Flow), స్పీచ్-టు-టెక్స్ట్, Microsoft Teams అనుసంధానం, మరియు PostgreSQL లేదా Cosmos DB బ్యాకెండ్ను ఎంపిక చేసే ఎంటర్ప్రైజ్-గ్రేడ్ RAG సొల్యూషన్ యాక్సలరేటర్. ఉత్పత్తి RAG సన్నాహాల కోసం అనుకూలీకరణ విధిగా రూపొందించబడింది.

**త్వరిత ప్రారంభం**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI ట్రావెల్ ఏజెంట్లు — మల్టీ-ఏజెంట్ MCP ఆర్కెస్ట్రేషన్

**రిపోజిటరీ**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**సేవలు**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**వివరణ**: మూడు ఫ్రేమ్‌వర్క్‌లు (LangChain.js, LlamaIndex.TS, Microsoft Agent Framework) ఉపయోగించి మల్టీ-ఏజెంట్ AI ఆర్కెస్ట్రేషన్ కోసం రిఫరెన్స్ అప్లికేషన్. నలుగురు భాషల్లో MCP (Model Context Protocol) సర్వర్స్ సర్వర్లెస్ Azure Container Apps గా డిప్లాయ్ చేయబడి OpenTelemetry మానిటరింగ్ కలిగి ఉంటుంది.

**త్వరిత ప్రారంభం**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI స్టార్టర్

**రిపోజిటరీ**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**సేవలు**: Azure AI సేవలు + Azure OpenAI

**వివరణ**: సాధారణ Bicep టెంప్లేట్, Azure AI సేవలను ఒక మోడల్‌తో సిద్ధం చేస్తుంది. పూర్తి అప్లికేషన్ స్టాక్ అవసరం లేకుండా Azure AI రూపకల్పన నిర్వహించడంలో చిన్నపాటి ప్రారంభ స్థానం.

**త్వరిత ప్రారంభం**:
```bash
azd init --template azd-ai-starter
azd up
```

> **మరిన్ని టెంప్లేట్లను చూడండి**: భిన్న భాషలు మరియు సన్నాహాలతో 80+ AI-ప్రత్యేక AZD టెంప్లేట్లు కోసం [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) సందర్శించండి.

## తదుపరి చర్యలు

1. **ఉదాహరణలను ప్రయత్నించండి**: మీ వినియోగానికి సరిపోయే ముందుగా రూపొందించిన టెంప్లేట్తో ప్రారంభించండి
2. **మీ అవసరాలకు అనుగుణంగా సరిచేయండి**: రూపకల్పన మరియు అనువర్తన కోడ్ మార్చండి
3. **మానిటరింగ్ చేర్చండి**: సమగ్ర ఆబ్జర్వబిలిటీ అమలు చేయండి
4. **ఖర్చులను ఆప్టిమైజ్ చేయండి**: మీ బడ్జెట్ కొరకు కాన్ఫిగరేషన్‌ను మెరుగుపరుచుకోండి
5. **మీ డిప్లాయ్‌మెంట్‌ను సురక్షితం చేయండి**: ఎంటర్ప్రైజ్ భద్రతా నమూనాలు అమలు చేయండి
6. **ఉత్పత్తికి స్కేలు చేయండి**: బహుదేశీయ, అధిక లభ్యత లక్షణాలు చేర్చండి

## 🎯 ప్రాక్టికల్ వ్యాయామాలు

### వ్యాయామం 1: Microsoft Foundry మోడల్స్ చాట్ యాప్ డిప్లాయ్ చేయండి (30 నిమిషాలు)
**లక్ష్యం**: ఉత్పత్తి-సిద్ధ AI చాట్ అప్లికేషన్ డిప్లాయ్ చేసి పరీక్షించండి

```bash
# టెంప్లేట్ ప్రారంభించండి
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# పర్యావరణ మార్పులను సెట్ చేయండి
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# పంపిణీ చేయండి
azd up

# అప్లికేషన్‌ను పరీక్షించండి
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AI ఆపరేషన్లను పర్యవేక్షించండి
azd monitor

# శుభ్రపరచండి
azd down --force --purge
```

**విజయం ప్రమాణాలు:**
- [ ] డిప్లాయ్‌మెంట్ కోటా లోపాలు లేకుండా పూర్తయ్యాలి
- [ ] బ్రౌజర్లో చాట్ ఇంటర్ఫేస్ ప్రాప్తి సాధ్యమే
- [ ] ప్రశ్నలు అడిగి AI ఆధారిత సమాధానాలు పొందగలగాలి
- [ ] అప్లికేషన్ ఇన్‌సైట్స్ ద్వారా టెలిమేట్రీ డేటా కనిపించాలి
- [ ] విజయవంతంగా వనరులు శుభ్రపరిచారు

**గణాంక ఖర్చు**: 30 నిమిషాల పరీక్షకు $5-10

### వ్యాయామం 2: బహుళ మోడల్ డిప్లాయ్‌మెంట్ కాన్ఫిగర్ చేయండి (45 నిమిషాలు)
**లక్ష్యం**: వివిధ కాన్ఫిగరేషన్లతో బహుళ AI మోడల్స్ డిప్లాయ్ చేయండి

```bash
# అలంకరించు అనుకూల బిసెప్ కాన్ఫిగరేషన్
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

# క్రమబద్ధపరిచి సరిచూసుకోండి
azd provision
azd show
```

**విజయం ప్రమాణాలు:**
- [ ] అనేక మోడల్స్ విజయవంతంగా డిప్లాయ్ చేయబడ్డాయి
- [ ] విభిన్న సామర్ధ్య సెట్టింగ్స్ అమలు చేయబడ్డాయి
- [ ] మోడల్స్ API ద్వారా ప్రాప్తించగలవు
- [ ] రెండు మోడల్స్‌లకు అప్లికేషన్ నుంచి పిలుపులు చేయగలగాలి

### వ్యాయామం 3: ఖర్చు మానిటరింగ్ అమలు చేయండి (20 నిమిషాలు)
**లక్ష్యం**: బడ్జెట్ అలెర్ట్స్ మరియు ఖర్చు ట్రాకింగ్‌ను ఏర్పాటు చేయండి

```bash
# బైసెప్ కు బడ్జెట్ అలర్ట్ జోడించండి
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

# బడ్జెట్ అలర్ట్ ను అమర్చండి
azd provision

# ప్రస్తుత ఖర్చులను తనిఖీ చేయండి
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**విజయం ప్రమాణాలు:**
- [ ] Azureలో బడ్జెట్ అలర్ట్ సృష్టించబడింది
- [ ] ఇమెయిల్ నోటిఫికేషన్లు ఏర్పాటు చేయబడ్డాయి
- [ ] Azure పోర్టల్‌లో ఖర్చు డేటా చూడగలగాలి
- [ ] బడ్జెట్ తీరులు సరిగ్గా సెట్ చేయబడ్డాయి

## 💡 తరచుగా అడిగే ప్రశ్నలు

<details>
<summary><strong>Microsoft Foundry మోడల్స్ ఖర్చులను అభివృద్ధి సమయంలో ఎలా తగ్గించుకోవాలి?</strong></summary>

1. **ఫ్రీ టియర్ వాడండి**: Microsoft Foundry Models నెలకి 50,000 టోకెన్లు ఉచితం అందిస్తుంది
2. **సామర్థ్యాన్ని తగ్గించండి**: అభివృద్ధికి 30+ స్థానంలో 10 TPM సెట్ చేయండి
3. **azd down ఉపయోగించండి**: అభివృద్ధి చేయని సమయంలో వనరులు డీఅలోకేట్ చేయండి
4. **తర్వాత తరచూ చేసే ప్రశ్నలకు Redis క్యాచ్ అమలు చేయండి**
5. **ప్రాంప్ట్ ఇంజనీరింగ్ ఉపయోగించండి**: సమర్థవంతమైన ప్రాంప్ట్‌లతో టోకెన్ వినియోగాన్ని తగ్గించండి


```bash
# అభివృద్ధి కాన్ఫిగరేషన్
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry మోడల్‌లు మరియు OpenAI API మధ్య తేడా ఏమిటి?</strong></summary>

**Microsoft Foundry మోడల్‌లు**:
- సంస్థ భద్రత మరియు అనుగుణత
- ప్రైవేటు నెట్‌వర్క్ ఇంటిగ్రేషన్
- SLA హామీలు
- నిర్వహించబడిన ఐడెంటిటీ ప్రమాణీకరణ
- అధిక క్వాటాలు అందుబాటులో ఉన్నాయి

**OpenAI API**:
- కొత్త మోడల్‌లకు వేగవంతమైన ప్రాక్సెస్
- సులభమైన సెటప్
- తక్కువ ప్రవేశ భాష
- పబ్లిక్ ఇంటర్నెట్ మాత్రమే

ఉత్పత్తి అనువర్తనాల కొరకు, **Microsoft Foundry మోడల్‌లు సూచించబడతాయి**.
</details>

<details>
<summary><strong>Microsoft Foundry మోడల్‌లు క్వోటా మించిపోయిన పొరపాట్లను నేను ఎలా నిర్వహించాలి?</strong></summary>

```bash
# ప్రస్తుత కోటాను తనిఖీ చేయండి
az cognitiveservices usage list --location eastus2

# వేరే ప్రాంతాన్ని ప్రయత్నించండి
azd env set AZURE_LOCATION westus2
azd up

# తాత్కాలికంగా సామర్థ్యాన్ని తగ్గించండి
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# కోటా పెంపు కೋರండి
# అజ్యూర్ పోర్టల్ > కోటాలు > పెంపు కోసం అభ్యర్థించండి
```
</details>

<details>
<summary><strong>Microsoft Foundry మోడల్‌లతో నేను నా స్వంత డేటాను ఉపయోగించుకోవచ్చా?</strong></summary>

అవును! RAG (రిట్రీవల్ ఆగుమెంటెడ్ జెనరేషన్) కోసం **Azure AI Search** ఉపయోగించండి:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) టెంప్లేట్‌ను చూడండి.
</details>

<details>
<summary><strong>నేను AI మోడల్ ఎండ్పాయింట్‌లను ఎలా భద్రపరచాలి?</strong></summary>

**ఉత్తమ అలవాట్లు**:
1. నిర్వహించబడిన ఐడెంటిటీ ఉపయోగించండి (API కీలు వద్దు)
2. ప్రైవేటు ఎండ్పాయింట్‌లను ఎనేబుల్ చేయండి
3. నెట్‌వర్క్ భద్రతా సమూహాలను కాన్ఫిగర్ చేయండి
4. రేట్ లిమిటింగ్ అమలు చేయండి
5. రహస్యాలకు Azure Key Vault ఉపయోగించండి

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

- **Microsoft Foundry Discord**: [#Azure ఛానెల్](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [ఇష్యూస్ మరియు చర్చలు](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [అధికారిక డాక్యూమెంటేషన్](https://learn.microsoft.com/azure/ai-studio/)
- **ఏజెంట్ స్కిల్స్**: [skills.sh లో Microsoft Foundry స్కిల్](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - మీ ఎడిటర్‌లో `npx skills add microsoft/github-copilot-for-azure` తో Azure + Foundry ఏజెంట్ స్కిల్స్ ఇన్స్టాల్ చేయండి

---

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభదశలు](../../README.md)
- **📖 ప్రస్తుత శాథకం**: చాప్టర్ 2 - AI-ఫస్ట్ డెవలప్‌మెంట్
- **⬅️ ముందు చాప్టర్**: [చాప్టర్ 1: మీ మొదటి ప్రాజెక్ట్](../chapter-01-foundation/first-project.md)
- **➡️ తరువాత**: [AI మోడల్ పంపిణీ](ai-model-deployment.md)
- **🚀 తరువాత చాప్టర్**: [చాప్టర్ 3: కాన్ఫిగరేషన్](../chapter-03-configuration/configuration.md)

**సహాయం కావాలా?** మా కమ్యూనిటీ చర్చలకు చేరండి లేదా రిపాజిటరీలో ఒక ఇష్యూను తెరవండి. Azure AI + AZD కమ్యూనిటీ మీరు విజయవంతం కావడానికి ఇక్కడ ఉంది!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->