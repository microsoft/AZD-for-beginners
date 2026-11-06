# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Agents](agents.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Overview

This guide demonstrates how to integrate Microsoft Foundry services with Azure Developer CLI (AZD) for streamlined AI application deployments. Microsoft Foundry provides a comprehensive platform for building, deploying, and managing AI applications, while AZD simplifies the infrastructure and deployment process.

## What is Microsoft Foundry?

Microsoft Foundry is Microsoft's unified platform for AI development that includes:

- **Model Catalog**: Access to state-of-the-art AI models
- **Prompt Flow**: Visual designer for AI workflows
- **Microsoft Foundry Portal**: Integrated development environment for AI applications
- **Deployment Options**: Multiple hosting and scaling options
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

- Azure subscription with appropriate permissions
- Azure Developer CLI installed
- Access to Microsoft Foundry Models services
- Basic familiarity with Microsoft Foundry

> **Release review (2026-11-04):** AI CLI guidance was checked against `azd` `1.37.2`, agents `1.0.0-beta.23`, and evaluations `1.0.0-beta.2` documentation/source. Use `azd >= 1.37.0` for the combined workflow. See [release changes and fixes](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); this review does not certify every template or SDK example against a live deployment.

## Core Integration Patterns

**Scope of the examples:** The Bicep below contains illustrative resource fragments, not a complete deployable template. The containing template must define names, `location`, referenced resources, identities, outputs, and application hosting. Use a linked sample for a runnable starting point. Bash examples require Azure CLI authentication separately from `azd auth login`.

### Pattern 1: Microsoft Foundry Models Integration

**Use Case**: Deploy chat applications with Azure OpenAI models in Microsoft Foundry

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

The caller needs an attached managed identity and `Cognitive Services OpenAI User` at the account scope; disabling keys does not grant access. Verify region/model/SKU availability and quota before deploying.

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

```

There is no `Microsoft.Search/searchServices/dataConnections` ARM resource for this integration. Configure a Search index, data source, indexer/skillset or vectorizer through the supported Search data-plane APIs. If Search calls an embedding model, enable its managed identity, grant the relevant model role, and configure its embedding skill/vectorizer. See [integrated vectorization](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

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

Except for documented AZD settings such as `AZURE_LOCATION`, these are **custom-template input names**. They have no effect unless the template/application consumes them through parameter and host-environment mappings. For `azure-search-openai-demo`, use its actual names such as `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` and `AZURE_SEARCH_SERVICE_SKU` instead. Model capacity is not account SKU.

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

Prefer Entra ID with local key authentication disabled. The following is only a **legacy key-authentication alternative** for applications that require keys: it requires an account with key authentication enabled, the application identity attached to its host, and working Key Vault access/networking. Do not combine key retrieval with `disableLocalAuth: true` and expect key-based calls to work.

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

AZD provides extensions that add AI-specific capabilities for working with Microsoft Foundry services:

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

The AI extensions are still moving quickly in preview. If a command behaves differently than shown here, upgrade the relevant extension before troubleshooting the project itself.

### Agent-First Deployment with `azd ai`

Use `azd ai agent init` interactively, or adopt a current `azure.yaml` agent project template wired to Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` replaces the deprecated `--manifest`/`-m` spelling; legacy manifest and nested agent configuration still need migration. Evaluate agents with `azd ai eval` from `azure.ai.evaluations`, not the removed legacy workflow. See [evaluation migration](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) for setup, execution, and results.

See [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for the full command reference and flags.

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

This provisions an Insights resource, not telemetry instrumentation. Once your app emits outbound model-call spans, run this illustrative query in Application Insights Logs (adapt the filter to your actual span names):

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

Use a real recipient and verify billing-scope permissions. A budget sends alerts; it is not a spending cap.

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

This endpoint fragment also needs a private DNS zone/group, VNet links, application VNet connectivity, and an explicit public-access policy. Creating a private endpoint alone does not disable public access.

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

Azure Cache for Redis Basic/Standard/Premium is on a [retirement path](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); use Azure Managed Redis for new deployments and follow its current template/authentication guidance. Scope cached AI responses by authorization, model/instructions, and data version, with expiry; never share private responses using query text alone.

### Auto-scaling Configuration

**Partial resource:** merge these scale/ingress settings into a complete Container App with a managed environment, container image, and resource limits. More replicas do not increase model quota.

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

The capacity variable above applies only to a custom template wired to consume it. For the RAG sample, use `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Do not change `AZURE_LOCATION` to move existing resources in place; create a separate environment for a new region and plan migration/cleanup.

### Issue 2: Authentication Failures

**Symptoms:**
- 401/403 errors when calling AI services
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
- Models not available in deployment
- Specific model versions failing

**Solutions:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Example Templates

These are alternatives, not sequential commands. Start each in a separate empty directory. The explicit `.` destination keeps initialization in your current directory; otherwise current AZD can create a template-named child directory without changing your shell's working directory.

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: A RAG chat reference application for questions over your documents, with Azure AI Search retrieval. Review the current sample's supported models, optional features, cost guidance, and production hardening before use; deploying a sample does not make an application production-ready.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: The .NET/C# equivalent of the Python RAG chat sample. Built with ASP.NET Core Minimal API and Blazor WebAssembly frontend. Includes voice chat, GPT-4o-mini vision support, and a companion .NET MAUI Blazor Hybrid desktop/mobile client.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: Java version of the RAG chat sample using Langchain4J for AI orchestration. Supports microservice event-driven architecture, multiple search strategies (text, vector, hybrid), document upload with Azure Document Intelligence, and deployment on either Azure Container Apps or Azure Kubernetes Service.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot with Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: End-to-end retail RAG copilot using Microsoft Foundry and Prompty. A Contoso Outdoor retailer chatbot that grounds responses in product catalog and customer order data. Demonstrates the full GenAIOps workflow — prototype with Prompty, evaluate with AI-assisted evaluators, and deploy via AZD to Container Apps.

**Quick Start**:
```bash
azd init --template contoso-chat .
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: Multi-agent sample demonstrating AI agent orchestration with Prompty. Uses a research agent (Bing Grounding in Azure AI Agent Service), a product agent (Azure AI Search), a writer agent, and an editor agent to collaboratively produce well-researched articles. Includes CI/CD with evaluation in GitHub Actions.

**Quick Start**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: Fully serverless RAG chatbot using LangChain.js with Azure Functions for the API and Azure Static Web Apps for hosting. Uses Azure Cosmos DB as both vector store and chat history database. Supports local development with Ollama for zero-cost testing.

**Quick Start**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search with Cosmos DB, or PostgreSQL with pgvector

**Description**: A document-grounded chat accelerator with citations. The current sample hosts a React frontend, FastAPI backend, and Functions ingestion worker on Container Apps; orchestrator options are Agent Framework and LangGraph. Database/retrieval options are selected at deployment. It is a starting point, not a turnkey production system; do not assume older App Service, Semantic Kernel, or Prompt Flow variants describe the current default.

**Quick Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: Reference application for multi-agent AI orchestration using three frameworks (LangChain.js, LlamaIndex.TS, and Microsoft Agent Framework). Features MCP (Model Context Protocol) servers in four languages deployed as serverless Azure Container Apps with OpenTelemetry monitoring.

**Quick Start**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Browse more templates**: Visit the [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for currently available templates across languages and scenarios. Each linked example is an external repository, not a local example supplied by this course; inspect its current prerequisites and production guidance before deployment.

## Next Steps

1. **Try the Examples**: Start with a pre-built template that matches your use case
2. **Customize for Your Needs**: Modify the infrastructure and application code
3. **Add Monitoring**: Implement comprehensive observability
4. **Optimize Costs**: Fine-tune configurations for your budget
5. **Secure Your Deployment**: Implement enterprise security patterns
6. **Scale to Production**: Add multi-region and high-availability features

## 🎯 Hands-On Exercises

### Exercise 1: Deploy Microsoft Foundry Models Chat App (30 minutes)
**Goal**: Deploy and test an AI chat reference application

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
- [ ] Deployment completes without quota errors
- [ ] Can access chat interface in browser
- [ ] Can ask questions and get AI-powered responses
- [ ] Application Insights shows telemetry data
- [ ] Successfully cleaned up resources

**Cost:** Review the sample's current cost guide and selected SKUs before deploying. Billing continues until resources are deleted; no fixed 30-minute estimate applies to every configuration.

### Exercise 2: Configure Multi-Model Deployment (45 minutes)
**Goal**: Deploy multiple AI models with different configurations

**Starting point:** An existing Azure OpenAI account and an AZD resource-group module that can call this file. Create `infra/ai-models.bicep` with the following content using your editor. It is not automatically deployed just because it is under `infra/`.

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

From the resource-group-scoped module owning the account, add a module invocation (adapt the symbol name to your actual account):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Do not declare the same deployments in both modules. If the AZD entry point is subscription-scoped, invoke this from its resource-group-scoped child module and adjust the relative path. Build that containing module with `az bicep build --file <path-to-containing-module>`, then:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Success Criteria:**
- [ ] Multiple models deployed successfully
- [ ] Different capacity settings applied
- [ ] Models accessible via API
- [ ] Can call both models from application

### Exercise 3: Implement Cost Monitoring (20 minutes)
**Goal**: Set up budget alerts and cost tracking

**Starting point:** The budget pattern above and a resource-group-scoped infrastructure module. Add this resource using your editor; pass `budgetStartDate` from your parameter mapping (do not duplicate the parameter if already declared). Replace the recipient and confirm you have budget write access.

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

Expected: the response contains `amount: 200`, both thresholds, and your recipient. Inspect Cost Management in the portal for actual charges; cost data is delayed and an alert need not fire during a short exercise.

**Success Criteria:**
- [ ] Budget alert created in Azure
- [ ] Email notifications configured
- [ ] Can view cost data in Azure Portal
- [ ] Budget thresholds set appropriately

## 💡 Frequently Asked Questions

<details>
<summary><strong>How do I reduce Microsoft Foundry Models costs during development?</strong></summary>

1. **Check pricing**: There is no universal free 50,000-token monthly allowance for Azure OpenAI models
2. **Right-size capacity**: Capacity `10` typically represents 10,000 TPM for these Standard text models, not 10 TPM. Reducing this rate limit does not reduce per-token prices
3. **Use azd down**: Delete disposable resources when not actively developing (this is not deallocation)
4. **Cache Responses**: Implement Redis cache for repeated queries
5. **Use Prompt Engineering**: Reduce token usage with efficient prompts

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>What's the difference between Microsoft Foundry Models and OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Enterprise security and compliance
- Private network integration
- SLA guarantees
- Managed identity authentication
- Higher quotas available

**OpenAI API**: A separate provider/API offering with its own model availability, pricing, authentication, and enterprise connectivity options. Compare current offerings rather than assuming it is public-internet-only or always ships models first.

Choose based on your organization's requirements; Azure-specific managed identity and private-link examples in this course apply to Azure-hosted services, not every model/provider in the Foundry catalog.
</details>

<details>
<summary><strong>How do I handle Microsoft Foundry Models quota exceeded errors?</strong></summary>

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
<summary><strong>Can I use my own data with Microsoft Foundry Models?</strong></summary>

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

See the [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template.
</details>

<details>
<summary><strong>How do I secure AI model endpoints?</strong></summary>

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
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Install Azure + Foundry agent skills in your editor with `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Agents](agents.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Need Help?** Join our community discussions or open an issue in the repository. The Azure AI + AZD community is here to help you succeed!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
This document has been translated using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we strive for accuracy, please be aware that automated translations may contain errors or inaccuracies. The original document in its native language should be considered the authoritative source. For critical information, professional human translation is recommended. We are not liable for any misunderstandings or misinterpretations arising from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->