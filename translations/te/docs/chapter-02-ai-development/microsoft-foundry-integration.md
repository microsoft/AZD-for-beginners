# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Overview

ఈ గైడ్ Microsoft Foundry సేవలను Azure Developer CLI (AZD) తో ఎలా సమీకరించాలో చూపిస్తుంది, తద్వారా AI అప్లికేషన్ డిప్లోయ్‌మెంట్ సులభమవుతుంది. Microsoft Foundry AI అప్లికేషన్లను నిర్మించడం, డిప్లాయ్ చేయడం, మరియు నిర్వహించడానికి సమగ్ర వేదికని అందిస్తుంది, కాగా AZD ఇన్ఫ్రాస్ట్రక్చర్ మరియు డిప్లాయ్‌మెంట్ ప్రాసెస్‌ను సరళీకృతం చేస్తుంది.

## What is Microsoft Foundry?

Microsoft Foundry అనేది Microsoft యొక్క ఏకీకృత AI అభివృద్ధి వేదిక, దీనిలో ఈ విషయాలు ఉన్నాయి:

- **Model Catalog**: ఆధునిక AI మోడళ్లకు యాక్సెస్
- **Prompt Flow**: AI వర్క్‌ఫ్లోల కోసం విజువల్ డిజైనర్
- **Microsoft Foundry Portal**: AI అప్లికేషన్ల కోసం ఒక ఏకీకృత డెవలప్‌మెంట్ పరిసరము
- **Deployment Options**: అనేక హోస్టింగ్ మరియు స్కేలింగ్ ఎంపికలు
- **Safety and Security**: బిల్ట్-ఇన్ బాధ్యతాయుత AI ఫీచర్లు

## AZD + Microsoft Foundry: Better Together

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Prerequisites

- సరైన అనుమతులతో Azure subscription
- Azure Developer CLI ఇన్‌స్టాల్ చేయబడినది
- Microsoft Foundry Models సేవలకు యాక్సెస్
- Microsoft Foundry గురించి ప్రాథమిక పరిజ్ఞానం

> **Current AZD baseline:** These examples were reviewed against `azd` `1.23.12`. For the AI agent workflow, use the current preview extension release and check your installed version before you begin.

## Core Integration Patterns

### Pattern 1: Microsoft Foundry Models Integration

**Use Case**: Microsoft Foundry Models ఉపయోగించి చాట్ అప్లికేషన్లను డిప్లాయ్ చేయడం

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

### Pattern 2: AI Search + RAG Integration

**Use Case**: retrieval-augmented generation (RAG) అప్లికేషన్లను డిప్లాయ్ చేయడం

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

### Pattern 3: Document Intelligence Integration

**Use Case**: డాక్యుమెంట్ ప్రాసెసింగ్ మరియు విశ్లేషణ వర్క్‌ఫ్లోలు

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

## 🔧 Configuration Patterns

### Environment Variables Setup

**Production Configuration:**
```bash
# ప్రధాన ఏఐ సేవలు
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# మోడల్ అమరికలు
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# పనితీరు అమరికలు
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Development Configuration:**
```bash
# అభివృద్ధి కోసం ఖర్చు-అనుకూలీకరించిన సెట్టింగులు
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # ఉచిత స్థాయి
```

### Secure Configuration with Key Vault

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

## Deployment Workflows

### AZD Extensions for Foundry

AZD Microsoft Foundry సేవలతో పని చేయడానికి AI-స్పెసిఫిక్ సామర్థ్యాలను జోడించే ఎక్స్‌టెన్షన్స్ అందిస్తుంది:

```bash
# Foundry agents విస్తరణను ఇన్‌స్టాల్ చేయండి
azd extension install azure.ai.agents

# ఫైన్-ట్యూనింగ్ విస్తరణను ఇన్‌స్టాల్ చేయండి
azd extension install azure.ai.finetune

# కస్టమ్ మోడల్స్ విస్తరణను ఇన్‌స్టాల్ చేయండి
azd extension install azure.ai.models

# ఇన్‌స్టాల్ చేయబడిన విస్తరణలను జాబితా చేయండి
azd extension list --installed

# ప్రస్తుతం ఇన్‌స్టాల్ చేయబడిన ఏజెంట్ విస్తరణ సంస్కరణను పరిశీలించండి
azd extension show azure.ai.agents
```

AI ఎక్స్‌టెన్షన్లు ఇంకా ప్రివ్యూ ద్వారా వేగంగా మారుతున్నాయి. ఒక కమాండ్ ఇక్కడ చూపించినట్టు వ్యవహరించకపోతే, ప్రాజెక్ట్‌ను ట్రబుల్షూట్ చేయడానికి ముందు సంబంధిత ఎక్స్‌టెన్షన్‌ను అప్గ్రేడ్ చేయండి.

### Agent-First Deployment with `azd ai`

మీకు agent manifest ఉంటే, Foundry Agent Service కు వైర్ చేయబడిన ప్రాజెక్ట్‌ను scaffold చేయడానికి `azd ai agent init` ఉపయోగించండి:

```bash
# ఏజెంట్ మెనిఫెస్ట్ నుండి ప్రారంభించండి
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azureలో అమలు చేయండి
azd up
```

`azure.ai.agents` యొక్క ఇటీవల ప్రివ్యూ విడుదలలు కూడా `azd ai agent init` కోసం టెంప్లేట్-ఆధారిత ఇనిషియలైజేషన్ మద్దతును జోడించాయి. మీరు కొత్త agent నమూనాలను అనుసరిస్తున్నట్లయితే, మీ ఇన్స్టాల్ చేయబడిన వెర్షన్‌లో అందుబాటులో ఉన్న ఖచ్చిత ఫ్లాగ్‌ల కోసం ఎక్స్‌టెన్షన్ సహాయం‌ను చెక్ చేయండి.

See [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for the full command reference and flags.

### Single Command Deployment

```bash
# అన్నింటినీ ఒకే కమాండ్‌తో డిప్లాయ్ చేయండి
azd up

# లేదా దశల వారీగా డిప్లాయ్ చేయండి
azd provision  # కేవలం మౌలిక సదుపాయాలు
azd deploy     # కేవలం అనువర్తనం

# azd 1.23.11+లో దీర్ఘకాలం నడిచే AI యాప్‌ల డిప్లాయ్‌మెంట్ కోసం
azd deploy --timeout 1800
```

### Environment-Specific Deployments

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

## Monitoring and Observability

### Application Insights Integration

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

### Cost Monitoring

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

## 🔐 Security Best Practices

### Managed Identity Configuration

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

### Network Security

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

## Performance Optimization

### Caching Strategies

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

### Auto-scaling Configuration

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

## Troubleshooting Common Issues

### Issue 1: OpenAI Quota Exceeded

**Symptoms:**
- డిప్లోయ్‌మెంట్ కోటా त्रुटులతో విఫలమవుతుంది
- అప్లికేషన్ లాగ్స్‌లో 429 errors

**Solutions:**
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

### Issue 2: Authentication Failures

**Symptoms:**
- AI సేవలను కాల్ చేసే సమయంలో 401/403 errors
- "Access denied" సందేశాలు

**Solutions:**
```bash
# పాత్ర కేటాయింపులను ధృవీకరించండి
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# మేనేజ్‌డ్ ఐడెంటిటీ కాన్ఫిగరేషన్‌ను తనిఖీ చేయండి
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# కీ వాల్ట్ యాక్సెస్‌ను ధృవీకరించండి
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Issue 3: Model Deployment Issues

**Symptoms:**
- మోడళ్లు డిప్లోయ్‌లో అందుబాటులో లేనివి
- నిర్దిష్ట మోడల్ వెర్షన్లు విఫలమవుతున్నాయి

**Solutions:**
```bash
# ప్రాంతం వారీగా అందుబాటులో ఉన్న మోడళ్లను జాబితా చేయండి
az cognitiveservices model list --location eastus

# bicep టెంప్లేట్‌లో మోడల్ వెర్షన్‌ను నవీకరించండి
# మోడల్ సామర్థ్య అవసరాలను తనిఖీ చేయండి
```

## Example Templates

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: అత్యంత ప్రజాదరణ ఉన్న Azure AI సాంపిల్ — మీ 문서లపై ప్రశ్నలు అడగడానికి ప్రొడక్షన్-రెడీ RAG చాట్ యాప్. చాట్ కోసం GPT-4.1-mini, ఎంబెడింగ్‌లకు text-embedding-3-large, రిట్రీవల్ కోసం Azure AI Search ఉపయోగిస్తుంది. మల్టీమోడల్ డాక్యుమెంట్లు, స్పీచ్ ఇన్‌పుట్/ఔట్‌పుట్, Microsoft Entra authentication, మరియు Application Insights ట్రేసింగ్‌ను మద్దతిస్తుంది.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: Python RAG చాట్ సాంపిల్ యొక్క .NET/C# సమాన ప్రతిగా చేయబడింది. ASP.NET Core Minimal API మరియు Blazor WebAssembly ఫ్రంట్‌ఎండ్‌తో నిర్మించబడింది. వాయిస్ చాట్, GPT-4o-mini విజన్ మద్దతు, మరియు సహాయ .NET MAUI Blazor హైబ్రిడ్ డెస్క్‌టాప్/మొబైల్ క్లయింట్‌ను కలిగిస్తుంది.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: Langchain4J ఉపయోగించి AI ఆర్కెస్ట్రేషన్ కోసం Java సంస్కరణ. మైక్రోసర్వీస్ ఈవెంట్-డ్రివెన్ ఆర్కిటెక్చర్, బహు సెర్చ్ వ్యూహాలు (టెక్స్ట్, వెక్టర్, హైబ్రిడ్), Azure Document Intelligence తో డాక్యుమెంట్ అప్లోడ్, మరియు Azure Container Apps లేదా Azure Kubernetes Service మీద డిప్లోయ్ చేయడాన్ని మద్దతిస్తుంది.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: Microsoft Foundry మరియు Prompty ఉపయోగించిన end-to-end రిటైల్ RAG copilot. ఉత్పత్తి క్యాటలాగ్ మరియు కస్టమర్ ఆర్డర్ డేటాలో ఆధారపడి ప్రతిస్పందనలు ఇచ్చే Contoso Outdoor రిటైల్ చాట్‌బాట్. పూర్తి GenAIOps వర్క్‌ఫ్లోని డెమో చేస్తుంది — Prompty తో ప్రోటోటైప్ చేయండి, AI-సహాయంతో ఈవాల్యుయేటర్లు ఉపయోగించి అంచనా వేయండి, మరియు AZD ద్వారా Container Apps లో డిప్లోయ్ చేయండి.

**Quick Start**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: Prompty తో AI ఏజెంట్ ఆర్కెస్ట్రేషన్ చూపించే మల్టీ-ఏజెంట్ సాంపిల్. రీసెర్చ్ ఏజెంట్ (Bing Grounding in Azure AI Agent Service), ప్రొడక్ట్ ఏజెంట్ (Azure AI Search), రచయిత ఏజెంట్, మరియు ఎడిటర్ ఏజెంట్ కలసి బాగా పరిశోధించిన ఆర్టికల్స్ తయారు చేస్తారు. GitHub Actions‌లో ఈవాల్యుయేషన్‌తో CI/CD కలిగి ఉంది.

**Quick Start**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: API కోసం Azure Functions మరియు హోస్టింగ్ కోసం Azure Static Web Apps ఉపయోగించి పూర్తిగా సర్వర్‌లెస్ RAG చాట్‌బాట్ LangChain.js తో. వెక్టర్ స్టోర్ మరియు చాట్ హిస్టరీ డేటాబేస్ ఇద్దరికీ Azure Cosmos DB ఉపయోగిస్తుంది. జీరో-కాస్ట్ టెస్టింగ్ కోసం స్థానిక డెవలప్‌మెంట్‌ను Ollama తో మద్దతు చేస్తుంది.

**Quick Start**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description**: డాక్యుమెంట్ అప్లోడ్/వ్యవస్థాపన కోసం అడ్మిన్ పోర్టల్ ఉన్న ఎంటర్ప్రైజ్-గ్రేడ్ RAG సొల్యూషన్ యాక్సిలరేటర్. వివిధ ఆర్కెస్ట్రేటర్లు (Semantic Kernel, LangChain, Prompt Flow), స్పీచ్-టు-టెక్స్ట్, Microsoft Teams ఇంటిగ్రేషన్, మరియు PostgreSQL లేదా Cosmos DB బ్యాక్‌ఎండ్ ఎంపికను అందిస్తుంది. ప్రొడక్షన్ RAG సన్నివేశాల కోసం అనుకూలీకరించదగిన మొదటి బిందువుగా రూపొందించబడింది.

**Quick Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: మూడు ఫ్రేమ్‌వర్క్‌లను ఉపయోగించి మల్టీ-ఏజెంట్ AI ఆర్కెస్ట్రేషన్ కోసం రిఫరెన్స్ అప్లికేషన్ (LangChain.js, LlamaIndex.TS, మరియు Microsoft Agent Framework). నాలుగు భాషలలో MCP (Model Context Protocol) సర్వర్లు serverless Azure Container Apps గా డిప్లాయ్ చేయబడి OpenTelemetry మానిటరింగ్‌ను కలిగి ఉంటాయి.

**Quick Start**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Description**: Azure AI సేవలను కాన్ఫిగర్ చేయబడిన మెషీన్ లర్నింగ్ మోడల్స్‌తో డిప్లోయ్ చేసే మినిమల్ Bicep టెంప్లేట్. పూర్తి అప్లికేషన్ స్టాక్ అవసరం లేకుండా కేవలం Azure AI ఇన్ఫ్రాస్ట్రక్చర్ మాత్రమే ప్రావిజన్ చేయాల్సినప్పుడు లైట్‌వెయిట్ ప్రారంభ బిందువు.

**Quick Start**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Browse more templates**: Visit the [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for 80+ AI-specific AZD templates across languages and scenarios.

## Next Steps

1. **Try the Examples**: మీ use case కి సరిపోయే ప్రీ-బిల్ట్ టెంప్లేట్‌తో మొదలుపెట్టండి
2. **Customize for Your Needs**: ఇన్ఫ్రాస్ట్రక్చర్ మరియు అప్లికేషన్ కో드를 మార్చండి
3. **Add Monitoring**: సమగ్ర ఆబ్జర్వబిలిటీని అమలు చెయ్యండి
4. **Optimize Costs**: మీ బడ్జెట్ కోసం కాన్ఫిగరేషన్లను సరిచూసుకోండి
5. **Secure Your Deployment**: ఎంటర్ప్రైజ్ సెక్యూరిటీ నమూనాలను అమలు చేయండి
6. **Scale to Production**: బహు-రీజియన్ మరియు హై-అవైలబిలిటీ ఫీచర్లను జోడించండి

## 🎯 Hands-On Exercises

### Exercise 1: Deploy Microsoft Foundry Models Chat App (30 minutes)
**Goal**: ప్రొడక్షన్-రెడీ AI చాట్ అప్లికేషన్‌ను డిప్లాయ్ చేసి టెస్ట్ చేయడం

```bash
# టెంప్లేట్ ప్రారంభించండి
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# పర్యావరణ వేరియబుల్స్ సెట్ చేయండి
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# డిప్లాయ్ చేయండి
azd up

# అనువర్తనాన్ని పరీక్షించండి
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AI కార్యకలాపాలను పర్యవేక్షించండి
azd monitor

# శుభ్రపరచండి
azd down --force --purge
```

**Success Criteria:**
- [ ] Deployment completes without quota errors
- [ ] బ్రౌజర్లో చాట్ ఇంటర్‌ఫేస్‌కి యాక్సెస్ చేయగలగాలి
- [ ] ప్రశ్నలు అడిగి AI-శక్తితో స్పందనలు పొందగలగాలి
- [ ] Application Insights telemetry డేటాను చూపిస్తుంది
- [ ] రిసోర్సుల‌ను విజయవంతంగా క్లీనప్ చేసారు

**Estimated Cost**: $5-10 for 30 minutes of testing

### Exercise 2: Configure Multi-Model Deployment (45 minutes)
**Goal**: వేర్వేరు కాన్ఫిగరేషన్లతో బహుళ AI మోడళ్లను డిప్లాయ్ చేయడం

```bash
# అనుకూలమైన Bicep కాన్ఫిగరేషన్‌ను సృష్టించండి
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

# అమలు చేసి తనిఖీ చేయండి
azd provision
azd show
```

**Success Criteria:**
- [ ] బహుళ మోడళ్లు విజయవంతంగా డిప్లాయ్ అయ్యాయి
- [ ] వేర్వేరు capacity సెట్టింగ్లు వర్తించబడ్డాయి
- [ ] మోడళ్లు API ద్వారా అందుబాటులో ఉన్నాయి
- [ ] అప్లికేషన్ నుండి రెండు మోడళ్లను కాల్ చేయగలగాలి

### Exercise 3: Implement Cost Monitoring (20 minutes)
**Goal**: బడ్జెట్ అలర్ట్స్ మరియు ఖర్చుల ట్రాకింగ్ సెటప్ చేయడం

```bash
# Bicepలో బడ్జెట్ అలర్ట్ జోడించండి
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

# బడ్జెట్ అలర్ట్‌ను అమలు చేయండి
azd provision

# ప్రస్తుత ఖర్చులను తనిఖీ చేయండి
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Success Criteria:**
- [ ] Azureలో బడ్జెట్ అలర్ట్ సృష్టించబడింది
- [ ] Email నోటిఫికేషన్లు కాన్ఫిగರ್ చేయబడ్డాయి
- [ ] Azure Portalలో ఖర్చు డేటా చూడగలగాలి
- [ ] బడ్జెట్ థ్రెష్‌హోల్డ్స్ مناسبంగా సెటు చేసినవి

## 💡 Frequently Asked Questions

<details>
<summary><strong>నేను డెవలప్‌మెంట్ సమయంలో Microsoft Foundry Models ఖర్చులను ఎలా తగ్గించగలను?</strong></summary>

1. **Use Free Tier**: Microsoft Foundry Models ప్రతి నెలకు 50,000 tokens/మంత్ ఫ్రీ అందిస్తుంది
2. **Reduce Capacity**: dev కోసం capacity ను 30+ స్థానంలో 10 TPM గా సెట్ చేయండి
3. **Use azd down**: సక్రియంగా అభివృద్ధి చేయకపోయే సమయంలో రిసోర్సుల‌ను డీఅల్లొకేట్ చేయండి
4. **Cache Responses**: అన్‌సంబర్మైన ప్రశ్నల కోసం Redis cache అమలు చేయండి
5. **Use Prompt Engineering**: సమర్థవంతమైన prompts తో token వినియోగాన్ని తగ్గించండి


```bash
# అభివృద్ధి కాన్ఫిగరేషన్
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models మరియు OpenAI API మధ్య వున్న తేడా ఏమిటి?</strong></summary>

**Microsoft Foundry Models**:
- ఎంటర్‌ప్రైజ్ భద్రత మరియు అనుకూలత
- ప్రైవేట్ నెట్‌వర్క్ అనుసంధానం
- SLA హామీలు
- Managed identity ప్రామాణీకరణ
- అధిక కోటాలు అందుబాటులో ఉంటాయి

**OpenAI API**:
- కొత్త మోడళ్లకు వేగవంతమైన యాక్సెస్
- సరళమైన సెటప్
- ప్రవేశానికి తక్కువ అడ్డంకులు
- కేవలం పబ్లిక్ ఇంటర్నెట్

ఉత్పత్తి అనువర్తనాల కోసం, **Microsoft Foundry Models సిఫార్సు చేయబడుతుంది**.
</details>

<details>
<summary><strong>Microsoft Foundry Models కోటా అధిగమించిన లోపాలను నేను ఎలా నిర్వహించాలి?</strong></summary>

```bash
# ప్రస్తుత క్వోటాను తనిఖీ చేయండి
az cognitiveservices usage list --location eastus2

# వేరే ప్రాంతాన్ని ప్రయత్నించండి
azd env set AZURE_LOCATION westus2
azd up

# సామర్థ్యాన్ని తాత్కాలికంగా తగ్గించండి
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# క్వోటా పెరుగుదల కోసం అభ్యర్థించండి
# Azure Portal > Quotas > Request increase కు వెళ్లండి
```
</details>

<details>
<summary><strong>నేను నా స్వంత డేటాను Microsoft Foundry Models తో ఉపయోగించవచ్చా?</strong></summary>

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

See the [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template.
</details>

<details>
<summary><strong>AI మోడల్ ఎండ్‌పాయింట్‌లను నేను ఎలా సురక్షితం చేసుకోవాలి?</strong></summary>

**ఉత్తమ ఆచరణలు**:
1. Managed Identity ఉపయోగించండి (API కీలు అవసరం 없습니다)
2. ప్రైవేట్ ఎండ్‌పాయింట్లను సక్రియం చేయండి
3. నెట్‌వర్క్ సెక్యూరిటీ గ్రూప్‌లను కాన్ఫిగర్ చేయండి
4. రేటు పరిమితి అమలు చేయండి
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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [ఇష్యులు మరియు చర్చలు](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [అధికారిక డాక్యुमెంటేషన్](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - మీ ఎడిటర్‌లో Azure + Foundry agent skills ఇన్‌స్టాల్ చేయడానికి `npx skills add microsoft/github-copilot-for-azure`

---

**అధ్యాయ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD For Beginners](../../README.md)
- **📖 వర్తమాన అధ్యాయము**: Chapter 2 - AI-First Development
- **⬅️ మునుపటి అధ్యాయం**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ తర్వాతి**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 తరువాతి అధ్యాయం**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**సహాయం కావాలా?** మన కమ్యూనిటీ చర్చల్లో చేరండి లేదా రిపోజిటరీలో ఒక ఇష్యూ తెరవండి. Azure AI + AZD కమ్యూనిటీ మీ విజయానికి సహాయపడేందుకు సిద్ధంగా ఉంది!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->