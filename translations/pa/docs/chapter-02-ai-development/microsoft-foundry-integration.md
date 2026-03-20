# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Overview

ਇਹ ਗਾਈਡ ਦਰਸਾਉਂਦੀ ਹੈ ਕਿ Microsoft Foundry ਸੇਵਾਵਾਂ ਨੂੰ Azure Developer CLI (AZD) ਨਾਲ ਕਿਵੇਂ ਇਕਠੇ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ ਤਾਂ ਜੋ AI ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਡਿਪਲੋਇਮੈਂਟ ਪ੍ਰਕਿਰਿਆ ਸੁਗਮ ਬਣਾਈ ਜਾ ਸਕੇ। Microsoft Foundry AI ਐਪਲਿਕੇਸ਼ਨਾਂ ਦੇ ਨਿਰਮਾਣ, ਡਿਪਲੋਇੰਗ ਅਤੇ ਪ੍ਰਬੰਧਨ ਲਈ ਇੱਕ ਸਮഗ്ര ਪਲੇਟਫਾਰਮ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ, ਜਦਕਿ AZD ਇਨਫ੍ਰਾਸਟਰੱਕਚਰ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ਪ੍ਰਕਿਰਿਆ ਨੂੰ ਆਸਾਨ ਬਣਾਉਂਦਾ ਹੈ।

## What is Microsoft Foundry?

Microsoft Foundry ਮਾਇਕ੍ਰੋਸਾਫਟ ਦਾ ਏਕਿਕ੍ਰਿਤ AI ਵਿਕਾਸ ਪਲੇਟਫਾਰਮ ਹੈ ਜਿਸ ਵਿੱਚ ਸ਼ਾਮਲ ਹਨ:

- **Model Catalog**: ਅਧੁਨਿਕ AI ਮਾਡਲਾਂ ਤੱਕ ਪਹੁੰਚ
- **Prompt Flow**: AI ਵਰਕਫਲੋਜ਼ ਲਈ ਵਿਜ਼ੂਅਲ ਡਿਜ਼ਾਈਨਰ
- **Microsoft Foundry Portal**: AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ ਏਕਿਕ੍ਰਿਤ ਡਿਵੈਲਪਮੈਂਟ ਇਨਵਾਇਰਨਮੈਂਟ
- **Deployment Options**: ਹੋਸਟਿੰਗ ਅਤੇ ਸਕੇਲਿੰਗ ਦੇ ਕਈ ਵਿਕਲਪ
- **Safety and Security**: ਬਿਲਟ-ਇਨ ਜ਼ਿੰਮੇਵਾਰ AI ਫੀਚਰ

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
# ਮੁੱਖ ਏਆਈ ਸੇਵਾਵਾਂ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# ਮਾਡਲ ਸੰਰਚਨਾਵਾਂ
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# ਕਾਰਗੁਜ਼ਾਰੀ ਸੈਟਿੰਗਾਂ
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Development Configuration:**
```bash
# ਵਿਕਾਸ ਲਈ ਲਾਗਤ-ਅਨੁਕੂਲ ਸੈਟਿੰਗਾਂ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # ਮੁਫ਼ਤ ਪੱਧਰ
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

AZD provides extensions that add AI-specific capabilities for working with Microsoft Foundry services:

```bash
# Foundry ਏਜੰਟਸ ਐਕਸਟੇਨਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ
azd extension install azure.ai.agents

# ਫਾਈਨ-ਟਿਊਨਿੰਗ ਐਕਸਟੇਨਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ
azd extension install azure.ai.finetune

# ਕਸਟਮ ਮਾਡਲਜ਼ ਐਕਸਟੇਨਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ
azd extension install azure.ai.models

# ਇੰਸਟਾਲ ਕੀਤੀਆਂ ਐਕਸਟੇਨਸ਼ਨਾਂ ਦੀ ਸੂਚੀ ਦਿਖਾਓ
azd extension list
```

### Agent-First Deployment with `azd ai`

If you have an agent manifest, use `azd ai agent init` to scaffold a project wired to Foundry Agent Service:

```bash
# ਏਜੈਂਟ ਮੈਨਿਫੈਸਟ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure ਤੇ ਡਿਪਲੋਇ ਕਰੋ
azd up
```

See [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for the full command reference and flags.

### Single Command Deployment

```bash
# ਇੱਕ ਕਮਾਂਡ ਨਾਲ ਸਭ ਕੁਝ ਡਿਪਲੋਏ ਕਰੋ
azd up

# ਜਾਂ ਕ੍ਰਮਵਾਰ ਡਿਪਲੋਏ ਕਰੋ
azd provision  # ਸਿਰਫ਼ ਢਾਂਚਾ
azd deploy     # ਸਿਰਫ਼ ਐਪਲੀਕੇਸ਼ਨ
```

### Environment-Specific Deployments

```bash
# ਵਿਕਾਸ ਵਾਤਾਵਰਨ
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# ਉਤਪਾਦਨ ਵਾਤਾਵਰਨ
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
# ਮੌਜੂਦਾ ਕੋਟਾ ਦੀ ਵਰਤੋਂ ਜਾਂਚੋ
az cognitiveservices usage list --location eastus

# ਕਿਸੇ ਹੋਰ ਖੇਤਰ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ
azd env set AZURE_LOCATION westus2
azd up

# ਅਸਥਾਈ ਤੌਰ 'ਤੇ ਸਮਰੱਥਾ ਘਟਾਓ
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Issue 2: Authentication Failures

**Symptoms:**
- 401/403 errors when calling AI services
- "Access denied" messages

**Solutions:**
```bash
# ਰੋਲ ਅਸਾਈਨਮੈਂਟਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ ਦੀ ਸੰਰਚਨਾ ਦੀ ਜਾਂਚ ਕਰੋ
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# ਕੀ ਵੌਲਟ ਪਹੁੰਚ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Issue 3: Model Deployment Issues

**Symptoms:**
- Models not available in deployment
- Specific model versions failing

**Solutions:**
```bash
# ਖੇਤਰ ਅਨੁਸਾਰ ਉਪਲਬਧ ਮਾਡਲਾਂ ਦੀ ਸੂਚੀ
az cognitiveservices model list --location eastus

# bicep ਟੈਮਪਲੇਟ ਵਿੱਚ ਮਾਡਲ ਸੰਸਕਰਣ ਅਪਡੇਟ ਕਰੋ
# ਮਾਡਲ ਸਮਰੱਥਾ ਦੀਆਂ ਲੋੜਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
```

## Example Templates

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: ਸਭ ਤੋਂ ਪ੍ਰਸਿੱਧ Azure AI ਨਮੂਨਾ — ਇੱਕ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ RAG ਚੈਟ ਐਪ ਜੋ ਤੁਹਾਨੂੰ ਆਪਣੇ ਦਸਤਾਵੇਜ਼ਾਂ 'ਤੇ ਸਵਾਲ ਪੁੱਛਣ ਦੀ ਆਗਿਆ ਦਿੰਦਾ ਹੈ। ਚੈਟ ਲਈ GPT-4.1-mini, ਐਂਬੈਡਿੰਗ ਲਈ text-embedding-ada-002 ਅਤੇ ਰੀਟ੍ਰਾਈਵਲ ਲਈ Azure AI Search ਵਰਤਦਾ ਹੈ। ਮਲਟੀਮੋਡਲ ਦਸਤਾਵੇਜ਼ਾਂ, ਸਪੀਚ ਇਨਪੁਟ/ਆਉਟਪੁਟ, Microsoft Entra ਪ੍ਰਮਾਣੀਕਰਨ, ਅਤੇ Application Insights ਟ੍ਰੇਸਿੰਗ ਨੂੰ ਸਮਰਥਨ ਕਰਦਾ ਹੈ।

**Quick Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: Python RAG ਚੈਟ ਨਮੂਨੇ ਦਾ .NET/C# ਵਰਜਨ। ASP.NET Core Minimal API ਅਤੇ Blazor WebAssembly ਫਰੰਟਐਂਡ ਨਾਲ ਬਣਾਇਆ ਗਿਆ। ਵੌਇਸ ਚੈਟ, GPT-4o-mini ਵਿਜ਼ਨ ਸਹਾਇਤਾ, ਅਤੇ ਇੱਕ ਸੰਯੋਗੀ .NET MAUI Blazor Hybrid ਡੈਸਕਟਾਪ/ਮੋਬਾਈਲ ਕਲਾਇੰਟ ਸ਼ਾਮਿਲ ਹਨ।

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: Langchain4J ਦੀ ਵਰਤੋਂ ਕਰਦਿਆਂ RAG ਚੈਟ ਨਮੂਨੇ ਦਾ Java ਵਰਜਨ। ਮਾਈਕ੍ਰੋਸਰਵਿਸ ਇਵੈਂਟ-ਡ੍ਰਿਵਨ ਆਰਕੀਟੈਕਚਰ, ਕਈ ਖੋਜ ਰਣਨੀਤੀਆਂ (ਟੈਕਸਟ, ਵੇਕਟਰ, ਹਾਈਬ੍ਰਿਡ), Azure Document Intelligence ਨਾਲ ਦਸਤਾਵੇਜ਼ ਅਪਲੋਡ ਅਤੇ Azure Container Apps ਜਾਂ Azure Kubernetes Service ਉੱਤੇ ਡਿਪਲੋਇਮੈਂਟ ਨੂੰ ਸਹਾਇਤ ਕਰਦਾ ਹੈ।

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: Azure AI Foundry ਅਤੇ Prompty ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅੰਤ-ਤਕ retailed RAG copilot। Contoso Outdoor ਰਿਟੇਲਰ ਚੈਟਬੋਟ ਜੋ ਉਤਪਾਦ ਕੈਟਲੌਗ ਅਤੇ ਗਾਹਕ ਆਰਡਰ ਡੇਟਾ ਵਿਚ ਆਧਾਰਿਤ ਜਵਾਬ ਦਿੰਦਾ ਹੈ। ਪੂਰੇ GenAIOps ਵਰਕਫਲੋ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ — Prompty ਨਾਲ ਪ੍ਰੋਟੋਟਾਈਪ, AI-ਸਹਾਇਤ ਐਵਾਲੂਏਟਰਾਂ ਨਾਲ ਮੁਲਾਂਕਣ, ਅਤੇ AZD ਰਾਹੀਂ Container Apps ਉੱਤੇ ਡਿਪਲੋਇਮੈਂਟ।

**Quick Start**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: Prompty ਨਾਲ AI ਏਜੰਟ ਆਰਕੀਸਟਰੈਸ਼ਨ ਦਿਖਾਉਂਦਾ ਹੋਇਆ ਮਲਟੀ-ਏਜੰਟ ਨਮੂਨਾ। ਇੱਕ ਰਿਸਰਚ ਏਜੰਟ (Bing Grounding in Azure AI Agent Service), ਇੱਕ ਪ੍ਰੋਡਕਟ ਏਜੰਟ (Azure AI Search), ਇੱਕ ਰਾਈਟਰ ਏਜੰਟ, ਅਤੇ ਇੱਕ ਸੰਪਾਦਕ ਏਜੰਟ ਮਿਲ ਕੇ ਚੰਗੀਆਂ ਤਰੀਕਿਆਂ ਨਾਲ ਰਿਸਰਚ ਕੀਤੀਆਂ ਲੇਖ ਸਿਰਜਦੇ ਹਨ। GitHub Actions ਵਿੱਚ ਮੁਲਾਂਕਣ ਨਾਲ CI/CD ਸ਼ਾਮਿਲ ਹੈ।

**Quick Start**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: LangChain.js ਨਾਲ ਪੂਰੀ ਤਰ੍ਹਾਂ ਸਰਵਰਲੈੱਸ RAG ਚੈਟਬੋਟ ਜੋ API ਲਈ Azure Functions ਅਤੇ ਹੋਸਟਿੰਗ ਲਈ Azure Static Web Apps ਵਰਤਦਾ ਹੈ। Azure Cosmos DB ਨੂੰ ਵੇਕਟਰ ਸਟੋਰ ਅਤੇ ਚੈਟ ਇਤਿਹਾਸ ਡੇਟਾਬੇਸ ਦੋਹਾਂ ਲਈ ਵਰਤਦਾ ਹੈ। ਓਲਲਾਮਾ (Ollama) ਨਾਲ ਲੋਕਲ ਡਿਵੈਲਪਮੈਂਟ ਲਈ ਜ਼ੀਰੋ-ਕੋਸਟ ਟੈਸਟਿੰਗ ਦਾ ਸਮਰਥਨ ਹੈ।

**Quick Start**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description**: ਐਨਟਰਪਰਾਇਜ਼-ਗਰੇਡ RAG ਸਲੂਸ਼ਨ ਐਕਸੀਲੇਰੇਟਰ ਜਿਸ ਵਿੱਚ ਦਸਤਾਵੇਜ਼ ਅਪਲੋਡ/ਪ੍ਰਬੰਧਨ ਲਈ ਐਡਮਿਨ ਪੋਰਟਲ, ਕਈ ਆਰਕੀਸਟਰੇਟਰ ਵਿਕਲਪ (Semantic Kernel, LangChain, Prompt Flow), ਸਪੀਚ-ਟੂ-ਟੈਕਸਟ, Microsoft Teams ਇੰਟੈਗ੍ਰੇਸ਼ਨ, ਅਤੇ PostgreSQL ਜਾਂ Cosmos DB ਬੈਕਐਂਡ ਦੀ ਚੋਣ ਸ਼ਾਮਿਲ ਹੈ। ਪ੍ਰੋਡਕਸ਼ਨ RAG ਸਿਨਾਰਿਓਜ਼ ਲਈ ਇੱਕ ਕਸਟਮਾਈਜ਼ ਕਰਨਯੋਗ ਸ਼ੁਰੂਆਤੀ ਬਿੰਦੂ ਵਜੋਂ ਡਿਜ਼ਾਇਨ ਕੀਤਾ ਗਿਆ ਹੈ।

**Quick Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: ਤਿੰਨ ਫਰੇਮਵਰਕਾਂ (LangChain.js, LlamaIndex.TS, ਅਤੇ Microsoft Agent Framework) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਮਲਟੀ-ਏਜੰਟ AI ਆਰਕੀਸਟਰੈਸ਼ਨ ਲਈ ਰੇਫਰੈਂਸ ਐਪਲੀਕੇਸ਼ਨ। ਚਾਰ ਭਾਸ਼ਾਵਾਂ ਵਿੱਚ MCP (Model Context Protocol) ਸਰਵਰਾਂ ਨੂੰ ਸਰਵਰਲੈੱਸ Azure Container Apps ਵਜੋਂ ਡਿਪਲੋਇ ਕੀਤਾ ਗਿਆ ਹੈ ਅਤੇ OpenTelemetry ਮੋਨਿਟਰਿੰਗ ਸ਼ਾਮਿਲ ਹੈ।

**Quick Start**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Description**: ਇੱਕ ਨ ਘੱਟੋ-ਘੱਟ Bicep ਟੈਂਪਲੇਟ ਜੋ Azure AI ਸੇਵਾਵਾਂ ਨੂੰ ਸੰਰਚਿਤ ਮਸ਼ੀਨ ਲਰਨਿੰਗ ਮਾਡਲਾਂ ਨਾਲ ਡਿਪਲੋਇ ਕਰਦਾ ਹੈ। ਜਦੋਂ ਤੁਹਾਨੂੰ ਸਿਰਫ਼ Azure AI ਇਨਫ੍ਰਾਸਟਰੱਕਚਰ ਦੀ ਲੋੜ ਹੋਵੇ ਅਤੇ ਪੂਰੇ ਐਪਲੀਕੇਸ਼ਨ ਸਟੈੱਕ ਦੀ ਲੋੜ ਨਾ ਹੋਵੇ ਤਾਂ ਇਹ ਇੱਕ ਹਲਕਾ-ਪੁਲਕ ਆਰੰਭਿਕ ਬਿੰਦੂ ਹੈ।

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
# ਟੈਂਪਲੇਟ ਸ਼ੁਰੂ ਕਰੋ
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ਮਾਹੌਲ ਦੇ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# ਤੈਨਾਤ ਕਰੋ
azd up

# ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# ਏਆਈ ਕਾਰਵਾਈਆਂ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor

# ਸਫਾਈ ਕਰੋ
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
# ਕਸਟਮ Bicep ਸੰਰਚਨਾ ਬਣਾਓ
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

# ਤਾਇਨਾਤ ਕਰੋ ਅਤੇ ਤਸਦੀਕ ਕਰੋ
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
# Bicep ਵਿੱਚ ਬਜਟ ਅਲਰਟ ਜੋੜੋ
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

# ਬਜਟ ਅਲਰਟ ਤੈਨਾਤ ਕਰੋ
azd provision

# ਮੌਜੂਦਾ ਲਾਗਤਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Success Criteria:**
- [ ] Budget alert created in Azure
- [ ] Email notifications configured
- [ ] Can view cost data in Azure Portal
- [ ] Budget thresholds set appropriately

## 💡 Frequently Asked Questions

<details>
<summary><strong>ਮੈਂ ਵਿਕਾਸ ਦੌਰਾਨ Microsoft Foundry Models ਦੇ ਖਰਚੇ ਘੱਟ ਕਿਵੇਂ ਕਰ ਸਕਦਾ/ਸਕਦੀ ਹਾਂ?</strong></summary>

1. **Use Free Tier**: Microsoft Foundry Models offers 50,000 tokens/month free
2. **Reduce Capacity**: Set capacity to 10 TPM instead of 30+ for dev
3. **Use azd down**: Deallocate resources when not actively developing
4. **Cache Responses**: Implement Redis cache for repeated queries
5. **Use Prompt Engineering**: Reduce token usage with efficient prompts

```bash
# ਵਿਕਾਸ ਸੰਰਚਨਾ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models ਅਤੇ OpenAI API ਵਿੱਚ ਕੀ ਫਰਕ ਹੈ?</strong></summary>

**Microsoft Foundry Models**:
- Enterprise security and compliance
- Private network integration
- SLA guarantees
- Managed identity authentication
- Higher quotas available

**OpenAI API**:
- Faster access to new models
- Simpler setup
- Lower barrier to entry
- Public internet only

For production apps, **Microsoft Foundry Models is recommended**.
</details>

<details>
<summary><strong>Microsoft Foundry Models ਦੇ ਕੋਟਾ ਵੱਧ ਜਾਣ ਵਾਲੀਆਂ ਗਲਤੀਆਂ ਨੂੰ ਮੈਂ ਕਿਵੇਂ ਸੰਭਾਲਾਂ?</strong></summary>

```bash
# ਮੌਜੂਦਾ ਕੋਟਾ ਦੀ ਜਾਂਚ ਕਰੋ
az cognitiveservices usage list --location eastus2

# ਕਿਸੇ ਹੋਰ ਖੇਤਰ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ
azd env set AZURE_LOCATION westus2
azd up

# ਅਸਥਾਈ ਤੌਰ ਤੇ ਸਮਰੱਥਾ ਘਟਾਓ
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ਕੋਟਾ ਵਧਾਉਣ ਦੀ ਬੇਨਤੀ ਕਰੋ
# Azure ਪੋਰਟਲ 'ਤੇ ਜਾਓ > ਕੋਟੇ > ਵਾਧੇ ਦੀ ਬੇਨਤੀ
```
</details>

<details>
<summary><strong>ਕੀ ਮੈਂ Microsoft Foundry Models ਨਾਲ ਆਪਣੇ ਡੇਟਾ ਨੂੰ ਵਰਤ ਸਕਦਾ/ਸਕਦੀ ਹਾਂ?</strong></summary>

ਹਾਂ! RAG (Retrieval Augmented Generation) ਲਈ **Azure AI Search** ਵਰਤੋ:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

ਇਸ ਟੈਮਪਲੇਟ ਨੂੰ ਵੇਖੋ: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template.
</details>

<details>
<summary><strong>ਮੈਂ AI ਮਾਡਲ ਐਂਡਪੌਇੰਟਸ ਨੂੰ ਕਿਵੇਂ ਸੁਰੱਖਿਅਤ ਕਰਾਂ?</strong></summary>

**ਸਰਵੋਤਮ ਅਭਿਆਸ**:
1. Managed Identity ਵਰਤੋ (ਕੋਈ API ਕੁੰਜੀਆਂ ਨਹੀਂ)
2. Private Endpoints ਸක්੍ਰਿਯ ਕਰੋ
3. network security groups ਕਨਫਿਗਰ ਕਰੋ
4. rate limiting ਲਾਗੂ ਕਰੋ
5. ਸਕ੍ਰੇਟਸ ਲਈ Azure Key Vault ਵਰਤੋ

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

## ਕਮਿਊਨਿਟੀ ਅਤੇ ਸਹਾਇਤਾ

- **Microsoft Foundry Discord**: [#Azure ਚੈਨਲ](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [ਮੁੱਦੇ ਅਤੇ ਚਰਚਾਵਾਂ](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [ਰਸਮੀ ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh ਉੱਤੇ Microsoft Foundry skill](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - ਆਪਣੇ ਐਡੀਟਰ ਵਿੱਚ Azure + Foundry agent skills ਇੰਸਟਾਲ ਕਰੋ `npx skills add microsoft/github-copilot-for-azure` ਦੀ ਵਰਤੋਂ ਕਰਕੇ

---

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**ਮਦਦ ਦੀ ਲੋੜ ਹੈ?** ਸਾਡੇ ਕਮਿਊਨਿਟੀ ਚਰਚਾਵਾਂ ਵਿੱਚ ਸ਼ਾਮਿਲ ਹੋਵੋ ਜਾਂ ਰਿਪੋਜ਼ਟਰੀ ਵਿੱਚ ਇੱਕ Issue ਖੋਲ੍ਹੋ। Azure AI + AZD ਕਮਿਊਨਿਟੀ ਤੁਹਾਡੇ ਸਫਲ ਹੋਣ ਵਿੱਚ ਮਦਦ ਕਰਨ ਲਈ ਇੱਥੇ ਹੈ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਪਸ਼ਟੀਕਰਨ**:
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਿਵੇਂ ਕਿ ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੇਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸ਼ੁੱਧਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ, ਜੋ ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੈ, ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਅਹਿਮ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਕਾਰਨ ਪੈਦਾ ਹੋਈਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->