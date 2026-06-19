# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Overview

ဤလမ်းညွှန်သည် Microsoft Foundry ဝန်ဆောင်မှုများကို Azure Developer CLI (AZD) နှင့် ပေါင်းစည်း၍ AI အက်ပလီကေးရှင်းများကို လွယ်ကူစွာ တပ်ဆင်နိုင်ရန် ပြသပေးသည်။ Microsoft Foundry သည် AI အက်ပလီကေးရှင်းများကို တည်ဆောက်၊ တပ်ဆင်နှင့် စီမံခန့်ခွဲရန် အတွက် စုပေါင်း ပလက်ဖောင်း ဖြစ်ပြီး AZD သည် အင်ဖရာစထက်ချာနှင့် သတ်မှတ်ထားသော တပ်ဆင်မှုများကို ရိုးရှင်းစေသည်။

## What is Microsoft Foundry?

Microsoft Foundry သည် Microsoft ၏ AI ဖွံ့ဖြိုးရေးအတွက် စုစည်းထားသော ပလက်ဖောင်း ဖြစ်ပြီး အောက်ပါများကို ပါဝင်သည်။

- **Model Catalog**: အဆင့်မြင့် AI မော်ဒယ်များသို့ ဝင်ရောက်နိုင်ခြင်း
- **Prompt Flow**: AI ဝေါဟာရလုပ်ငန်းစဉ်များအတွက် ဗီジュယယ် ဒီဇိုင်းနာ
- **Microsoft Foundry Portal**: AI အက်ပလီကေးရှင်းများအတွက် ပေါင်းစည်းထားသော ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်
- **Deployment Options**: ဟော့စတင်းနှင့် အဆင့်မြှင့်ခြင်းဆိုင်ရာ ရွေးချယ်စရာများစွာ
- **Safety and Security**: တာဝန်ရှိသည့် AI လက္ခဏာများ အပါအဝင် လုံခြုံရေးနှင့် လုံခြုံမှု

## AZD + Microsoft Foundry: Better Together

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Prerequisites

- Azure subscription with appropriate permissions
- Azure Developer CLI installed
- Access to Microsoft Foundry Models services
- Basic familiarity with Microsoft Foundry

> **Current AZD baseline:** These examples were reviewed against `azd` `1.23.12`. For the AI agent workflow, use the current preview extension release and check your installed version before you begin.

## Core Integration Patterns

### Pattern 1: Microsoft Foundry Models Integration

**Use Case**: Deploy chat applications with Microsoft Foundry Models models

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

**Use Case**: Deploy retrieval-augmented generation (RAG) applications

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

**Use Case**: Document processing and analysis workflows

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
# အဓိက AI ဝန်ဆောင်မှုများ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# မော်ဒယ် ဖွဲ့စည်းမှုများ
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# စွမ်းဆောင်ရည် ဆက်တင်များ
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Development Configuration:**
```bash
# ဖွံ့ဖြိုးရေးအတွက် ကုန်ကျစရိတ်သက်သာအောင် ညှိထားသော ဆက်တင်များ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # အခမဲ့ အဆင့်
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

AZD သည် Microsoft Foundry ဝန်ဆောင်မှုများနှင့် အလုပ်လုပ်နိုင်ရန် AI-သီးသန့် လုပ်ဆောင်ချက်များ ထည့်သွင်းပေးသည့် extension များကို ပေးသည်။

```bash
# Foundry အေးဂျင့် တိုးချဲ့မှုကို တပ်ဆင်ပါ
azd extension install azure.ai.agents

# ချိန်ညှိခြင်း တိုးချဲ့မှုကို တပ်ဆင်ပါ
azd extension install azure.ai.finetune

# စိတ်ကြိုက် မော်ဒယ်များ တိုးချဲ့မှုကို တပ်ဆင်ပါ
azd extension install azure.ai.models

# တပ်ဆင်ထားသော တိုးချဲ့မှုများကို စာရင်းပြပါ
azd extension list --installed

# လက်ရှိ တပ်ဆင်ထားသော အေးဂျင့် တိုးချဲ့မှု၏ ဗားရှင်းကို စစ်ဆေးပါ
azd extension show azure.ai.agents
```

The AI extensions are still moving quickly in preview. If a command behaves differently than shown here, upgrade the relevant extension before troubleshooting the project itself.

### Agent-First Deployment with `azd ai`

If you have an agent manifest, use `azd ai agent init` to scaffold a project wired to Foundry Agent Service:

```bash
# agent manifest အား အသုံးပြု၍ အစပြုပါ။
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure သို့ ဖြန့်ချိပါ။
azd up
```

Recent preview releases of `azure.ai.agents` also added template-based initialization support for `azd ai agent init`. If you are following newer agent samples, check the extension help for the exact flags available in your installed version.

See [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for the full command reference and flags.

### Single Command Deployment

```bash
# တစ်ချက်အမိန့်နဲ့ အားလုံးကို တပ်ဆင်ပါ
azd up

# သို့မဟုတ် အဆင့်ဆင့် တပ်ဆင်ပါ
azd provision  # အခြေခံအဆောက်အဦးသာ
azd deploy     # အပလီကေးရှင်းသာ

# azd 1.23.11+ တွင် အချိန်ရှည်ဆောင်ရွက်နိုင်သည့် AI အက်ပ်များကို တပ်ဆင်ရာအတွက်
azd deploy --timeout 1800
```

### Environment-Specific Deployments

```bash
# ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# ထုတ်လုပ်ရေးပတ်ဝန်းကျင်
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
- Deployment fails with quota errors
- 429 errors in application logs

**Solutions:**
```bash
# လက်ရှိ ကိုတာ အသုံးပြုမှုကို စစ်ဆေးပါ
az cognitiveservices usage list --location eastus

# တခြားဒေသကို စမ်းကြည့်ပါ
azd env set AZURE_LOCATION westus2
azd up

# စွမ်းဆောင်ရည်ကို ယာယီအတွက် လျော့ပါ
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Issue 2: Authentication Failures

**Symptoms:**
- 401/403 errors when calling AI services
- "Access denied" messages

**Solutions:**
```bash
# ရာထူးခန့်ထားမှုများကို အတည်ပြုပါ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# စီမံထားသော Identity ဖွဲ့စည်းပုံကို စစ်ဆေးပါ
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault သို့ ဝင်ရောက်ခွင့်ကို အတည်ပြုပါ
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Issue 3: Model Deployment Issues

**Symptoms:**
- Models not available in deployment
- Specific model versions failing

**Solutions:**
```bash
# ဒေသအလိုက် အသုံးပြုနိုင်သော မော်ဒယ်များကို စာရင်းပြပါ
az cognitiveservices model list --location eastus

# Bicep template ထဲရှိ မော်ဒယ် ဗားရှင်းကို မွမ်းမံပါ
# မော်ဒယ်၏ စွမ်းရည် လိုအပ်ချက်များကို စစ်ဆေးပါ
```

## Example Templates

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: အများဆုံး လူကြိုက်များသော Azure AI နမူနာ — ကိုယ်ပိုင် စာရွက်စာတမ်းများပေါ် မေးခွန်းမေးနိုင်သည့် production-ready RAG chat အက်ပလီကေးရှင်း။ Chat အတွက် GPT-4.1-mini, embeddings အတွက် text-embedding-3-large၊ ရှာဖွေရေးအတွက် Azure AI Search ကို အသုံးပြုသည်။ မျိုးစုံပုံစာရွက်စာတမ်းများ၊ အသံအ Mits入力/ထွက်၊ Microsoft Entra authentication နှင့် Application Insights tracing ကို ထောက်ပံ့သည်။

**Quick Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: Python RAG chat နမူနာ၏ .NET/C# ညီမျှ ဗားရှင်း။ ASP.NET Core Minimal API နှင့် Blazor WebAssembly frontend ဖြင့် တည်ဆောက်ထားသည်။ အသံစာပို့စကား, GPT-4o-mini vision ပြုမှုများ နှင့် .NET MAUI Blazor Hybrid デスクトップ/မိုဘိုင်း client ကို ပါဝင်သည်။

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: Langchain4J ကို အသုံးပြု၍ RAG chat နမူနာ၏ Java ဗားရှင်း။ မိုက်ခရိုဆားဗာ အခြေပြု event-driven စာရင်းဇယား၊ စာရွက်စာတမ်းတင်ရန် Azure Document Intelligence ပေါင်းစပ်မှု၊ နှင့် Azure Container Apps သို့မဟုတ် Azure Kubernetes Service တို့တွင် တပ်ဆင်နိုင်သည်။

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: Microsoft Foundry နှင့် Prompty ကို အသုံးပြုပြီး retail RAG copilot အတွက် end-to-end နမူနာ။ Contoso Outdoor အရောင်းဆိုင်အတွက် ထုတ်ကုန် ကတ်တလော့နှင့် အော်ဒါ ဒေတာကို အခြေခံ၍ တုံ့ပြန်ချက်များပေးသော chatbot ဖြစ်သည်။ GenAIOps workflow အပြည့်အစုံကို ပြသသည် — Prompty ဖြင့် prototype ပြုလုပ်ခြင်း၊ AI-assisted evaluators ဖြင့် ဆန်းစစ်ခြင်း၊ AZD ဖြင့် Container Apps သို့ တပ်ဆင်ခြင်း။

**Quick Start**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: Prompty ဖြင့် AI agent orchestration ကို ပြသသည့် multi-agent နမူနာ။ သုတေသန agent (Bing Grounding in Azure AI Agent Service), product agent (Azure AI Search), writer agent, editor agent တို့ကို အတူဖက်၍ သုတေသနတည်ရှိသည့် ဆောင်းပါးများကို ပူးပေါင်းဖန်တီးသည်။ GitHub Actions တွင် evaluation ပါဝင်သည့် CI/CD ကိုပါ ထည့်သွင်းထားသည်။

**Quick Start**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: LangChain.js နှင့် Azure Functions သုံးထားသော အပြည့်အစုံ serverless RAG chatbot။ API အတွက် Azure Functions, ဟို့စတင်းအတွက် Azure Static Web Apps ကို အသုံးပြုသည်။ Azure Cosmos DB ကို vector store နှင့် chat history database အဖြစ် အသုံးပြုသည်။ Ollama အသုံးပြု၍ နေ့စဉ် ဖေါ်ပြချက်များအတွက် local development အထောက်အပံ့ကို ထောက်ပံ့သည်။

**Quick Start**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description**: Enterprise-အဆင့် RAG solution accelerator — စာရွက်စာတမ်းတင်/စီမံခန့်ခွဲရန် admin portal, Semantic Kernel / LangChain / Prompt Flow စသည့် orchestrator ရွေးချယ်စရာများ၊ အသံမှ စာသားသို့ ပြောင်းခြင်း၊ Microsoft Teams ထည့်သွင်းခြင်း၊ PostgreSQL သို့မဟုတ် Cosmos DB backend ရွေးချယ်စရာတို့ ပါဝင်သည်။ production RAG စနစ်များအတွက် စတင်ရန် အဆင်ပြေသော အခြေခံ Template ဖြစ်သည်။

**Quick Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: မျိုးစုံ agent AI orchestration ကို ကိုးကားပြသသည့် နမူနာ application — LangChain.js, LlamaIndex.TS, Microsoft Agent Framework တို့ကို အသုံးပြုသည်။ MCP (Model Context Protocol) servers များကို ဘာသာစကား၄ မျိုးဖြင့် serverless Azure Container Apps အဖြစ် တပ်ဆင်ထားပြီး OpenTelemetry မောနီတာစနစ်ပါဝင်သည်။

**Quick Start**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Description**: Azure AI ဝန်ဆောင်မှုများနှင့် ဆက်စပ်မော်ဒယ်များကို တပ်ဆင်ပေးသည့် အနိမ့်ဆုံး Bicep template ဖြစ်သည်။ application stack အပြည့်အဝ မလိုအပ်ဘဲ Azure AI အင်ဖရာသာ တပ်ဆင်ချင်သောအခါ စတင်ရန် အဆင်ပြေသည်။

**Quick Start**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Browse more templates**: Visit the [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for 80+ AI-specific AZD templates across languages and scenarios.

## Next Steps

1. **Try the Examples**: Start with a pre-built template that matches your use case
2. **Customize for Your Needs**: Modify the infrastructure and application code
3. **Add Monitoring**: Implement comprehensive observability
4. **Optimize Costs**: Fine-tune configurations for your budget
5. **Secure Your Deployment**: Implement enterprise security patterns
6. **Scale to Production**: Add multi-region and high-availability features

## 🎯 Hands-On Exercises

### Exercise 1: Deploy Microsoft Foundry Models Chat App (30 minutes)
**Goal**: Deploy and test a production-ready AI chat application

```bash
# ပုံစံကို စတင်သတ်မှတ်ပါ
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ပတ်ဝန်းကျင်အပြောင်းအလဲများကို သတ်မှတ်ပါ
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# ဖြန့်ချိပါ
azd up

# အပလီကေးရှင်းကို စမ်းသပ်ပါ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AI လုပ်ငန်းများကို စောင့်ကြည့်ပါ
azd monitor

# ရှင်းလင်းလုပ်ဆောင်ပါ
azd down --force --purge
```

**Success Criteria:**
- [ ] Deployment completes without quota errors
- [ ] Can access chat interface in browser
- [ ] Can ask questions and get AI-powered responses
- [ ] Application Insights shows telemetry data
- [ ] Successfully cleaned up resources

**Estimated Cost**: $5-10 for 30 minutes of testing

### Exercise 2: Configure Multi-Model Deployment (45 minutes)
**Goal**: Deploy multiple AI models with different configurations

```bash
# စိတ်ကြိုက် Bicep ဖွဲ့စည်းမှု ဖန်တီးပါ
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

# တပ်ဆင်၍ အတည်ပြုပါ
azd provision
azd show
```

**Success Criteria:**
- [ ] Multiple models deployed successfully
- [ ] Different capacity settings applied
- [ ] Models accessible via API
- [ ] Can call both models from application

### Exercise 3: Implement Cost Monitoring (20 minutes)
**Goal**: Set up budget alerts and cost tracking

```bash
# Bicep ထဲသို့ ဘတ်ဂျက် သတိပေးချက် ထည့်ပါ
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

# ဘတ်ဂျက် သတိပေးချက် တပ်ဆင်ပါ
azd provision

# လက်ရှိ ကုန်ကျစရိတ် စစ်ဆေးပါ
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Success Criteria:**
- [ ] Budget alert created in Azure
- [ ] Email notifications configured
- [ ] Can view cost data in Azure Portal
- [ ] Budget thresholds set appropriately

## 💡 Frequently Asked Questions

<details>
<summary><strong>Microsoft Foundry Models ကို ဖွံ့ဖြိုးရေးအချိန်မှာ ကုန်ကျစရိတ် လျော့နည်းစေရန် ဘယ်လိုလုပ်သင့်သလဲ?</strong></summary>

1. **Use Free Tier**: Microsoft Foundry Models offers 50,000 tokens/month free
2. **Reduce Capacity**: Set capacity to 10 TPM instead of 30+ for dev
3. **Use azd down**: Deallocate resources when not actively developing
4. **Cache Responses**: Implement Redis cache for repeated queries
5. **Use Prompt Engineering**: Reduce token usage with efficient prompts
```bash
# ဖွံ့ဖြိုးရေး ပြင်ဆင်ချက်
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models နှင့် OpenAI API တို့၏ ကွာခြားချက်ကဘာလဲ?</strong></summary>

**Microsoft Foundry Models**:
- အဖွဲ့အစည်းအဆင့် လုံခြုံရေးနှင့်လိုက်နာရေး
- ပုဂ္ဂလိက ကွန်ယက် ပေါင်းစည်းမှု
- SLA အာမခံချက်များ
- Managed Identity ဖြင့် အတည်ပြုခြင်း
- ပိုမြင့်သော ကွော့တာများ ရနိုင်သည်

**OpenAI API**:
- မော်ဒယ်အသစ်များသို့ ပိုမြန်လက်လှမ်းရနိုင်ခြင်း
- တပ်ဆင်မှု ပိုလွယ်ကူခြင်း
- ဝင်ရောက်မှုပေါ် သက်သာမှုနည်းသော အတားအဆီး
- အများပြည်သူ အင်တာနက်မှသာ အသုံးပြုနိုင်သည်

ထုတ်လုပ်မှု အက်ပလီကေးရှင်းများအတွက်၊ **Microsoft Foundry Models ကို အကြံပြုပါသည်။**
</details>

<details>
<summary><strong>Microsoft Foundry Models ၏ quota ကျော်လွန် error များကို ဘယ်လို ကိုင်တွယ်ရမလဲ?</strong></summary>

```bash
# လက်ရှိ ကန့်သတ်ပမာဏကို စစ်ဆေးပါ
az cognitiveservices usage list --location eastus2

# အခြား ဒေသကို စမ်းကြည့်ပါ
azd env set AZURE_LOCATION westus2
azd up

# စွမ်းဆောင်ရည်ကို ယာယီ လျော့နည်းစေပါ
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ကန့်သတ်ပမာဏ တိုးရန် တောင်းဆိုပါ
# Azure Portal > Quotas > Request increase သို့ သွားပါ
```
</details>

<details>
<summary><strong>Microsoft Foundry Models နှင့် ကိုယ်ပိုင်ဒေတာကို အသုံးပြုနိုင်မလား?</strong></summary>

ဟုတ်ပါတယ်! RAG (Retrieval Augmented Generation) အတွက် **Azure AI Search** ကို အသုံးပြုပါ။

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

အဆိုပါ [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) နမူနာကို ကြည့်ပါ။
</details>

<details>
<summary><strong>AI မော်ဒယ် endpoint များကို မည်သို့ လုံခြုံစေမည်နည်း?</strong></summary>

**အကောင်းဆုံး လေ့လာရမည့်နည်းလမ်းများ**:
1. Managed Identity ကို သုံးပါ (API key မလိုအပ်ပါ)
2. Private Endpoints ကို ဖွင့်ပါ
3. network security groups များကို ဖွဲ့စည်း ပြင်ဆင်ပါ
4. တုံ့ပြန်နှုန်း ကန့်သတ်မှုကို အကောင်အထည်ဖော်ပါ
5. လျှို့ဝှက်ချက်များအတွက် Azure Key Vault ကို သုံးပါ

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

## လူမှုအသိုင်းအဝိုင်းနှင့် ထောက်ပံ့မှု

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [ပြဿနာများနှင့် ဆွေးနွေးမှုများ](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [တရားဝင်စာတမ်းများ](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - သင့် editor တွင် Azure + Foundry agent skills များကို ထည့်ရန် `npx skills add microsoft/github-copilot-for-azure` ကို အသုံးပြုပါ

---

**အခန်း လမ်းညွှန်ချက်များ:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိ အခန်း**: Chapter 2 - AI-First Development
- **⬅️ ယခင် အခန်း**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ နောက်တစ်ခု**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 နောက်တစ်ခန်း**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**အကူအညီ လိုပါသလား?** ကျွန်ုပ်တို့၏ လူမှုအသိုင်းအဝိုင်း ဆွေးနွေးချက်များတွင် ပါဝင်ဆွေးနွေးပါ သို့မဟုတ် repository တွင် issue တစ်ခုပြုလုပ်ပါ။ Azure AI + AZD လူမှုအသိုင်းအဝိုင်းသည် သင် အောင်မြင်စေရန် ကူညီရန် ရှိနေပါသည်!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->