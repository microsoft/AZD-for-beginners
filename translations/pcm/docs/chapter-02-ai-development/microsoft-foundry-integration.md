# Microsoft Foundry Integration wit AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Agents](agents.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Overview

Dis guide dey show how to join Microsoft Foundry service wit Azure Developer CLI (AZD) to make AI app deployment beta easy. Microsoft Foundry na one complete platform for build, deploy, and manage AI apps, while AZD dey simplify the infrastructure and deployment process.

## Wetin be Microsoft Foundry?

Microsoft Foundry na Microsoft unified platform for AI development wey get:

- **Model Catalog**: Access to beta correct AI models
- **Prompt Flow**: Visual designer for AI workflow dem
- **Microsoft Foundry Portal**: Integrated development environment for AI apps
- **Deployment Options**: Plenty hosting and scaling options
- **Safety and Security**: Built-in responsible AI features

## AZD + Microsoft Foundry: Better Together

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Prerequisites

- Azure subscription wey get better permissions
- Azure Developer CLI installed
- Access to Microsoft Foundry Models services
- Basic sabi Microsoft Foundry

> **Release review (2026-11-04):** AI CLI guidance check am with `azd` `1.37.2`, agents `1.0.0-beta.23`, and evaluations `1.0.0-beta.2` documentation/source. Use `azd >= 1.37.0` for the combined workflow. See [release changes and fixes](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); dis review no mean say every template or SDK example fit work for live deployment.

## Core Integration Patterns

**Scope of the examples:** The Bicep wey dey below get illustrative resource parts, e no be full deployable template. The containing template must define names, `location`, referenced resources, identities, outputs, and app hosting. Use linked sample for runnable starting point. Bash examples need Azure CLI authentication separate from `azd auth login`.

### Pattern 1: Microsoft Foundry Models Integration

**Use Case**: Deploy chat apps wit Azure OpenAI models for Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
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
    disableLocalAuth: true
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
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

The caller need attached managed identity and `Cognitive Services OpenAI User` for account scope; disabling keys no go give access. Confirm region/model/SKU availability and quota before deployment.

### Pattern 2: AI Search + RAG Integration

**Use Case**: Deploy retrieval-augmented generation (RAG) apps

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

```

No `Microsoft.Search/searchServices/dataConnections` ARM resource for dis one. Configure Search index, data source, indexer/skillset or vectorizer through supported Search data-plane APIs. If Search dey call embedding model, enable its managed identity, give relevant model role, configure embedding skill/vectorizer. See [integrated vectorization](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Pattern 3: Document Intelligence Integration

**Use Case**: Document processing and analysis workflow dem

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

Outside documented AZD settings like `AZURE_LOCATION`, these na **custom-template input names**. Them no go work unless template/app use dem via parameter and host-environment mappings. For `azure-search-openai-demo`, use correct names like `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` and `AZURE_SEARCH_SERVICE_SKU` instead. Model capacity no be account SKU.

**Production Configuration:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Development Configuration:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Secure Configuration with Key Vault

Make you prefer Entra ID with local key authentication off. Wetin dey below na **legacy key-authentication alternative** for apps wey need keys: e need account wit key auth enabled, app identity attached to host, plus Key Vault access/network working. No join key retrieval wit `disableLocalAuth: true` and hope say key-based calls go work.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
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

AZD get extensions wey add AI-specific power to work wit Microsoft Foundry services:

```bash
# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# List installed extensions
azd extension list --installed

# Inspect the currently installed agent extension version
azd extension show azure.ai.agents
```

AI extensions still dey move fast for preview. If command no behave like this one, upgrade the extension before you start check the project.

### Agent-First Deployment wit `azd ai`

Use `azd ai agent init` interactively, or use current `azure.yaml` agent project template connected to Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` don replace deprecated `--manifest`/`-m` spelling; legacy manifest and nested agent configuration still need migration. Use `azd ai eval` from `azure.ai.evaluations` to evaluate agents, no use old workflow wey they remove. See [evaluation migration](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) for setup, run and results.

See [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for full command list and flags.

### Single Command Deployment

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Environment-Specific Deployments

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
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
```

Dis one dey create Insights resource, e no be telemetry instrumentation. When your app send model-call spans, run dis query for Application Insights Logs (adapt filter to real span names):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Cost Monitoring

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

Use real recipient and check billing-scope permission. Budget dey send alerts; e no be spending cap.

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

This endpoint fragment still need private DNS zone/group, VNet links, app VNet connectivity, and clear public-access policy. Just create private endpoint no go disable public access.

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
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
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

Azure Cache for Redis Basic/Standard/Premium dey for [retirement path](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); use Azure Managed Redis for new deployments and follow its authentication/template guide. Scope cached AI response by authorization, model/instruction, data version and expiry; no share private responses based on only query text.

### Auto-scaling Configuration

**Partial resource:** merge these scale/ingress settings into full Container App wit managed environment, container image, and resource limits. More replicas no go increase model quota.

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
- Deployment fail wit quota errors
- 429 errors for app logs

**Solutions:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

The capacity variable na only for custom template wey dey wired to use am. For RAG sample, use `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. No change `AZURE_LOCATION` to move existing resources; create separate environment for new region and plan migration/cleanup.

### Issue 2: Authentication Failures

**Symptoms:**
- 401/403 errors when dey call AI services
- "Access denied" messages

**Solutions:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Issue 3: Model Deployment Issues

**Symptoms:**
- Models no dey available for deployment
- Certain model versions dey fail

**Solutions:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Example Templates

These be alternatives, no be sequential commands. Start each one for separate empty directory. Explicit `.` destination go keep init for your current directory; else AZD fit create template-named child directory without changing your shell directory.

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: RAG chat reference app for question on your documents, with Azure AI Search retrieval. Check supported models, optional features, cost guidance, production hardening for current sample before use; deploying sample no mean say app ready for production.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: .NET/C# beta for Python RAG chat sample. Build with ASP.NET Core Minimal API plus Blazor WebAssembly frontend. Get voice chat, GPT-4o-mini vision support, plus companion .NET MAUI Blazor Hybrid desktop/mobile client.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: Java version for RAG chat sample using Langchain4J for AI orchestration. Support microservice event-driven architecture, many search strategies (text, vector, hybrid), document upload with Azure Document Intelligence, deploy on Azure Container Apps or Azure Kubernetes Service.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot wit Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: End-to-end retail RAG copilot wit Microsoft Foundry and Prompty. Contoso Outdoor retailer chatbot wey base responses on product catalog and customer order data. Show full GenAIOps workflow—prototype wit Prompty, evaluate wit AI-assisted evaluators, deploy with AZD to Container Apps.

**Quick Start**:
```bash
azd init --template contoso-chat .
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: Multi-agent sample wey dey show AI agent orchestration wit Prompty. Get research agent (Bing Grounding for Azure AI Agent Service), product agent (Azure AI Search), writer agent, plus editor agent wey work together to produce well-research articles. Get CI/CD with evaluation in GitHub Actions.

**Quick Start**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: Fully serverless RAG chatbot dey use LangChain.js with Azure Functions for API and Azure Static Web Apps for hosting. Dey use Azure Cosmos DB as vector store and chat history database. Support local development with Ollama for zero-cost testing.

**Quick Start**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat wit Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search with Cosmos DB, or PostgreSQL with pgvector

**Description**: Document-grounded chat accelerator wit citations. Current sample get React frontend, FastAPI backend and Functions ingestion worker on Container Apps; orchestrator options na Agent Framework and LangGraph. Database/retrieval options selected during deployment. Na starting point, no be turnkey production system; no assume old App Service, Semantic Kernel or Prompt Flow versions be current default.

**Quick Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: Reference app wey dey do multi-agent AI orchestration wey use three frameworks (LangChain.js, LlamaIndex.TS, and Microsoft Agent Framework). E get MCP (Model Context Protocol) servers for four languages wey dem deploy as serverless Azure Container Apps wey get OpenTelemetry monitoring.

**Quick Start**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Browse more templates**: Visit di [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for di templates wey dey now for different languages and scenarios. Each one wey get link na external repository, no be local sample wey dis course give; make you check di requirements and production guide well before you deploy am.

## Next Steps

1. **Try the Examples**: Begin with template wey fit your use case
2. **Customize for Your Needs**: Change di infrastructure and app code
3. **Add Monitoring**: Make sure say you fit see how e dey perform well
4. **Optimize Costs**: Arrange configurations to fit your budget
5. **Secure Your Deployment**: Use enterprise security patterns
6. **Scale to Production**: Add multi-region and high-availability features

## 🎯 Hands-On Exercises

### Exercise 1: Deploy Microsoft Foundry Models Chat App (30 minutes)
**Goal**: Deploy and test AI chat reference app

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Clean up
azd down --force --purge
```

**Success Criteria:**
- [ ] Deployment finish without quota wahala
- [ ] You fit enter chat interface for browser
- [ ] You fit ask questions and get AI-powered answers
- [ ] Application Insights dey show telemetry data
- [ ] Resources dem clean well after

**Cost:** Check di sample cost guide and di selected SKUs before you deploy. Billing go still dey go till you delete di resources; no fixed 30-minute estimate fit every setup.

### Exercise 2: Configure Multi-Model Deployment (45 minutes)
**Goal**: Deploy many AI models with different configurations

**Starting point:** Get Azure OpenAI account and AZD resource-group module wey fit call dis file. Create `infra/ai-models.bicep` with di content wey you go put for your editor. E no go deploy automatically just because e dey under `infra/`.

```bicep
param openAiAccountName string

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
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
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
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

From di resource-group-scoped module wey get di account, add module call (change di symbol name to your actual account):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

No make you dey declare di same deployments for both modules. If AZD entry point na subscription-scoped, call am from its resource-group-scoped child module and change di relative path. Build dat module with `az bicep build --file <path-to-containing-module>`, den:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Success Criteria:**
- [ ] Multiple models deploy well
- [ ] Different capacity settings apply
- [ ] Models fit access via API
- [ ] You fit call both models from app

### Exercise 3: Implement Cost Monitoring (20 minutes)
**Goal**: Set budget alerts and track cost

**Starting point:** Di budget pattern wey you see before and resource-group-scoped infrastructure module. Add dis resource with your editor; pass `budgetStartDate` from your parameter mapping (no put duplicate parameter if e don dey). Change recipient and make sure say you get budget write access.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

Expect: response get `amount: 200`, both thresholds, and your recipient. Check Cost Management for portal for real charges; cost data dey delay and alert no need fire for short exercise.

**Success Criteria:**
- [ ] Budget alert don create for Azure
- [ ] Email notifications don configure
- [ ] You fit see cost data for Azure Portal
- [ ] Budget thresholds set correct

## 💡 Frequently Asked Questions

<details>
<summary><strong>How I fit reduce Microsoft Foundry Models costs during development?</strong></summary>

1. **Check pricing**: No universal free 50,000-token monthly allowance for Azure OpenAI models
2. **Right-size capacity**: Capacity `10` usually mean 10,000 TPM for these Standard text models, no be 10 TPM. To reduce this rate limit no go reduce per-token prices
3. **Use azd down**: Delete resources wey you no dey use when development stop (e no be deallocation)
4. **Cache Responses**: Use Redis cache for repeated queries
5. **Use Prompt Engineering**: Reduce token use with better prompts

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Wetin be di difference between Microsoft Foundry Models and OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Enterprise security and compliance
- Private network integration
- SLA guarantees
- Managed identity authentication
- Higher quotas dey available

**OpenAI API**: Na different provider/API wey get im own model availability, pricing, authentication, and enterprise connectivity options. Make you compare current offerings no assume say e be just public-internet or always ship models first.

Choose based on your organization's requirements; Azure-managed identity and private-link examples for this course apply to Azure-hosted services, no be every model/provider for Foundry catalog.
</details>

<details>
<summary><strong>How I take handle Microsoft Foundry Models quota exceeded errors?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>I fit use my own data with Microsoft Foundry Models?</strong></summary>

Yes! Use **Azure AI Search** for RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

See di [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template.
</details>

<details>
<summary><strong>How I fit secure AI model endpoints?</strong></summary>

**Best Practices**:
1. Use Managed Identity (no API keys)
2. Enable Private Endpoints
3. Configure network security groups
4. Implement rate limiting
5. Use Azure Key Vault for secrets

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

## Community and Support

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Install Azure + Foundry agent skills inside your editor with `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Agents](agents.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Need Help?** Join our community discussions or open issue for di repository. Azure AI + AZD community dey here to help you succeed!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->