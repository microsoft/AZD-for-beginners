# Microsoft Foundry Integration wit AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Agents](agents.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Overview

Dis guide dey show how you fit join Microsoft Foundry services wit Azure Developer CLI (AZD) make e easy to deploy AI applications. Microsoft Foundry dey provide one full platform to build, deploy, and manage AI applications, and AZD dey simplify infrastructure and deployment process.

## Wetin be Microsoft Foundry?

Microsoft Foundry na Microsoft one platform wey dem use for AI development wey get:

- **Model Catalog**: Access to di latest AI models
- **Prompt Flow**: Visual designer for AI workflows
- **Microsoft Foundry Portal**: Integrated development environment for AI applications
- **Deployment Options**: Different hosting and scaling options
- **Safety and Security**: Built-in responsible AI features

## AZD + Microsoft Foundry: Beta Together

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Project and resource configuration | Start from `azure.yaml`; eject Bicep or Terraform when needed |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Deployment and evaluation services | Reuse configuration in GitHub Actions or Azure DevOps |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Prerequisites

- Azure subscription wey get correct permissions
- Azure Developer CLI 1.37.0 or later for di GA Foundry workflow
- Access to Microsoft Foundry Models services
- Small knowledge about Microsoft Foundry

> **Foundry GA update (2026-11-09):** Di `microsoft.foundry` extension bundle don reach version 1.0 and general availability on [November 5, 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Di walkthrough wey dey below follow dat announcement and di linked Microsoft Learn quickstart. Dis na documentation review, no be live deployment validation. Optional preview features and independently released extensions still dey get their own release status.

**Learning outcomes:** Install di GA bundle, check agent `azure.yaml`, compare local and deployed responses, and explain evaluation, CI/CD, and cleanup boundaries. For step-by-step agent deployment, go to di [hosted-agent walkthrough](#hosted-agent-walkthrough-ga). The resource fragments below cover other integration patterns.

## Core Integration Patterns

**Scope of di examples:** The Bicep below get illustrative resource fragments, e no be complete deployable template. Di containing template gats define names, `location`, referenced resources, identities, outputs, and hosting. Use linked sample for runnable start. Bash examples need Azure CLI authentication separate from `azd auth login`.

### Pattern 1: Microsoft Foundry Models Integration

**Use Case**: Deploy chat applications with Azure OpenAI models for Microsoft Foundry

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

Di caller need attached managed identity and `Cognitive Services OpenAI User` at account level; disabling keys no go give access. Check region/model/SKU availability plus quota before deployment.

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

No `Microsoft.Search/searchServices/dataConnections` ARM resource for dis integration. Configure Search index, data source, indexer/skillset or vectorizer via supported Search data-plane APIs. If Search call embedding model, enable im managed identity, grant right model role, and configure embedding skill/vectorizer. See [integrated vectorization](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

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

Except for documented AZD settings like `AZURE_LOCATION`, these na **custom-template input names**. Dem no go work unless template/application use dem through parameter and host-environment mappings. For `azure-search-openai-demo`, use actual names like `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` and `AZURE_SEARCH_SERVICE_SKU` instead. Model capacity no be account SKU.

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

Prefer Entra ID with local key authentication off. Di following na only **legacy key-authentication alternative** for apps wey need keys: e need account with key authentication on, application identity attached to host, and working Key Vault access/network. No mix key retrieval with `disableLocalAuth: true` and expect key-based calls to work.

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

For GA workflow, install `microsoft.foundry` bundle instead of to gather core extensions one by one:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Bundle go install agents, connections, inspector, projects, routines, skills, and toolboxes. E no add `microsoft.foundry` command group. Evaluations, datasets, fine-tuning, and custom models go install separately when needed. See [extension packaging reference](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Hosted-Agent Walkthrough (GA)

**Hosted agent** dey run your agent code for Foundry-managed compute. Dis exercise dey use upstream basic Python Agent Framework Responses API sample, no be di classic Agent Service SDK fragments for other lessons.

#### 1. Prepare and initialize

Use empty directory outside this course checkout. Install Python 3.13 or later and current [uv release](https://docs.astral.sh/uv/getting-started/installation/). Standalone uv installations fit use `uv self update`. Check [hosted-agent permissions](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), model availability and quota for your subscription and region before you provision. Azure resources and local model calls go cost.

Complete `azd auth login` and bundle install above. Local sample code use `DefaultAzureCredential`; if you dey use Azure CLI credentials, sign in with `az login` using same account and tenant as AZD. AZD sign-in alone no be Azure CLI sign-in.

Run dis one-line command for Bash or PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Choose new or existing Foundry project and subscription and region wey you want. To reuse model deployment, add `--model-deployment <existing-deployment-name>` to initialization command **before you run am**, then select existing project. Dey for directory wey get generated `azure.yaml` for remaining commands.

#### 2. Review deployment definition

Open `azure.yaml` and find these settings in [upstream sample](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Setting | Wetin to check |
|---------|---------------|
| `host: azure.ai.project` and `deployments` | Intended Foundry project and model name, version, deployment SKU, and capacity |
| `host: azure.ai.agent` and `project` | Hosted agent and directory wey get im source |
| `codeConfiguration` | Python runtime and entry point; di sample use `python_3_13` and `main.py` |
| `uses` | Dependency on Foundry project service |
| `container.resources` | CPU and memory allocation, even if code dey built remotely |
| `env` | Model deployment mapping and `PYTHONNOUSERSITE: "1"` to disable user-site package loading |
| `infra.provider` | `microsoft.foundry`, wey synthesize required infrastructure |

Commit reviewed `azure.yaml` and agent code together. No need handwritten infrastructure to start; if you need editable provisioning files, follow [infrastructure ejection](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) for Bicep or Terraform and continue to use `azd provision`. No commit credentials or `.azure/` environment state.

#### 3. Provision and test locally

```bash
azd provision
azd ai agent run
```

Provisioning fit create missing model deployments **even for reused project**. Review model prompts and select available online deployment like Global Standard or Data Zone Standard; quota and regional support no dey always same.

Local run go prepare dependencies and open **Agent Inspector**, wey you fit inspect requests, responses, and tool/model activity. Make e dey run and open second terminal in same project directory:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Checkpoint:** Confirm say you dey get relevant response and you fit check local activity. Local execution still dey call your Azure model deployment; no be offline or free test. Use synthetic prompts and no expose secrets or sensitive data for inspector output.

#### 4. Deploy and compare

Stop local run wit Ctrl+C after you finish. Before remote invocation, configure or verify project's [Application Insights connection and trace-reading access](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing).

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

For code deployment mode, AZD go upload source for remote Foundry build; no need local container build for dis path. Deployment output go give playground and endpoint links. Verify response from deployed agent and cloud trace; local inspector events no guarantee cloud tracing dey work.

For later changes, review supported hosted-agent configuration with `azd deploy --preview`. Stream logs wit `azd ai agent monitor --follow`, or diagnose setup and access problems wit `azd ai agent doctor`. Deployment preview no be full infrastructure or security check.

#### 5. Add repeatable quality check

Install independently released evaluations extension, then generate draft test assets:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Describe agent's intended behavior and select **Dataset and evaluator**, then **Turn**. Review and edit generated cases and grading rubric, including unsupported-question case, before you configure evaluation:

```bash
azd ai eval init --name quality
```

Select reviewed dataset and rubric and confirm judge model deployment. Inspect `evals/azure.eval.yaml` and evaluation-service reference inside `azure.yaml`, then register assets and run:

```bash
azd up
azd ai eval run start --eval quality
```

Inspect scores and failed or errored cases; completed evaluation no be automatic quality pass. Generation and scoring go incur model charges. Commit nonsecret configuration, datasets, and rubrics so teammates fit compare changes. `azd ai agent optimize` fit reuse compatible evaluation as baseline, but make sure to review candidates before explicit deployment. See [quality gates and migration](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) for older projects and CI.

#### 6. Reuse workflow for CI/CD

After successful `azd up`, run `azd pipeline config` and review generated GitHub Actions or Azure DevOps workflow. Install `microsoft.foundry` for runner, plus `azure.ai.evaluations` if you dey run evaluations. Keep generated checkout, sign-in, and environment settings; installation alone no be pipeline authentication.

Use separate AZD environment per stage, grant pipeline identity required resource and Foundry permissions, and keep credentials in pipeline secrets or use federated identity. Commit evaluation assets and verify identity fit access datasets/evaluators. See [course pipeline example](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) and [Foundry CI/CD guide](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Clean up well well

For **new project wey environment create**, review resources list by `azd down` before you confirm: e go delete resource group and everything inside.

For **reused project**, `azd down` go leave project, hosted agent, and other resources dey. Remove only resources wey you no want and you own using [quickstart cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); no delete shared resource group if you wan clean up one exercise.

**Completion check:** Explain which settings dey control local and cloud behavior, show local and deployed responses, review evaluation result, and identify resources wey still remain after cleanup.

### Optional: Scaffold wit Microsoft Foundry Skill

Install [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) for your coding agent host, then open another empty folder. Ask am make e scaffold basic Python Agent Framework Responses API sample for code deployment mode, explain generated `azure.yaml`, and propose subscription, region, project, and model deployment. Require approval **before you create Azure resources**, ask for local test, and stop before deployment. Review output and continue deployment steps above only if you ready.

For di projects wey don dey already, `--template`/`-t` na im dey replace di old `--manifest`/`-m` spelling wey don kpai; wen you change dis flag e no go move old manifests or nested agent configuration. Make you check di [AI CLI reference](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

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

Dis one dey provide an Insights resource, e no be telemetry instrumentation. Once your app begin to send outbound model-call spans, run dis example query for Application Insights Logs (adjust di filter to your real span names):

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

Use correct recipient and make sure say you get billing-scope permissions. Budget fit send alerts; e no be spending cap.

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

This endpoint fragment still need private DNS zone/group, VNet links, application VNet connectivity, and explicit public-access policy. Just create private endpoint alone no go disable public access.

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

Azure Cache for Redis Basic/Standard/Premium dey waka go [retirement path](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); use Azure Managed Redis for new deployments and follow di current template/authentication instruction. Dem go scope cached AI responses by authorization, model/instructions, and data version, plus expiry; no ever share private responses only with query text.

### Auto-scaling Configuration

**Partial resource:** merge these scale/ingress settings into one full Container App with managed environment, container image, and resource limits. More replicas no mean say model quota go increase.

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
- Deployment go fail wit quota errors
- 429 errors dey for application logs

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

Di capacity variable wey dey there na for custom template wey dey wired to use am. For di RAG sample, make you use `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. No change `AZURE_LOCATION` to move old resources go di new place; better make you create new environment for new region and plan how you go migrate or clean am.

### Issue 2: Authentication Failures

**Symptoms:**
- 401/403 errors wen you dey call AI services
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
- Specific model versions dey fail

**Solutions:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Example Templates

These na alternatives, no be commands wey dey follow one behind di other. Start each one for separate empty directory. Di explicit `.` destination dey keep initialization for your current directory; if not, current AZD fit create template-named child directory without changing your shell working directory.

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: RAG chat reference app wey dey answer questions about your documents, using Azure AI Search retrieval. Check the current sample’s supported models, optional features, cost advice, plus production hardening before you use am; just deploy sample no mean say app go ready for production.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: Na .NET/C# version of di Python RAG chat sample. E build with ASP.NET Core Minimal API and Blazor WebAssembly frontend. E get voice chat, GPT-4o-mini vision support, and .NET MAUI Blazor Hybrid desktop/mobile client.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: Na Java version of di RAG chat sample wey use Langchain4J for AI orchestration. E support microservice event-driven architecture, many search methods (text, vector, hybrid), document upload with Azure Document Intelligence, and deployment on Azure Container Apps or Azure Kubernetes Service.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot wit Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: End-to-end retail RAG copilot using Microsoft Foundry and Prompty. Na Contoso Outdoor retailer chatbot wey dey ground answers in product catalog plus customer order data. E dey show full GenAIOps workflow — prototype wit Prompty, evaluate wit AI-assisted evaluators, then deploy via AZD to Container Apps.

**Quick Start**:
```bash
azd init --template contoso-chat .
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: Multi-agent sample wey show AI agent orchestration wit Prompty. E get research agent (Bing Grounding for Azure AI Agent Service), product agent (Azure AI Search), writer agent, and editor agent wey dey work together to produce well-researched articles. Get CI/CD with evaluation for GitHub Actions.

**Quick Start**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: Fully serverless RAG chatbot wey dey use LangChain.js with Azure Functions for API and Azure Static Web Apps for hosting. E use Azure Cosmos DB as vector store and chat history database. E support local development wit Ollama wey no dey cost anything for testing.

**Quick Start**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search with Cosmos DB, or PostgreSQL wit pgvector

**Description**: Document-grounded chat accelerator with citations. Current sample get React frontend, FastAPI backend, and Functions ingestion worker on Container Apps; orchestrator options na Agent Framework and LangGraph. Database or retrieval options dey selected at deployment. Na starting point, no be turnkey production system; no go assume old App Service, Semantic Kernel, or Prompt Flow variants na current default.

**Quick Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: Reference application for multi-agent AI orchestration using three frameworks (LangChain.js, LlamaIndex.TS, and Microsoft Agent Framework). E feature MCP (Model Context Protocol) servers in four languages deployed as serverless Azure Container Apps with OpenTelemetry monitoring.

**Quick Start**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Browse more templates**: Visit di [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for templates wey dey available now across languages and scenarios. Each linked example na external repository, no be local example wey dis course dey supply; check the current prerequisites and production advice before you deploy.

## Next Steps

1. **Try di Examples**: Start wit pre-built template wey go match your use case
2. **Customize for Your Needs**: Change the infrastructure and app code
3. **Add Monitoring**: Implement full observability
4. **Optimize Costs**: Fine-tune configurations for your budget
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

# Review the listed resources and confirm cleanup
azd down
```

**Success Criteria:**
- [ ] Deployment finish without quota errors
- [ ] Fit access chat interface for browser
- [ ] Fit ask questions and get AI-powered responses
- [ ] Application Insights show telemetry data
- [ ] Resources successfully clean up

**Cost:** Check di sample’s current cost guide and selected SKUs before you deploy. Billing no stop till resources delete; no fixed 30-minute estimate fit apply to all configurations.

### Exercise 2: Configure Multi-Model Deployment (45 minutes)
**Goal**: Deploy multiple AI models with different configurations

**Starting point:** You get existing Azure OpenAI account and AZD resource-group module wey fit call dis file. Create `infra/ai-models.bicep` with di content below using your editor. E no go deploy automatically just because e dey under `infra/`.

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

From di resource-group-scoped module wey dey own di account, add a module invocation (adjust di symbol name to your real account):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

No declare di same deployments for both modules. If AZD entry point na subscription-scoped, invoke dis from resource-group-scoped child module and adjust di relative path. Build dat containing module wit `az bicep build --file <path-to-containing-module>`, then:

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
- [ ] Fit call both models from application

### Exercise 3: Implement Cost Monitoring (20 minutes)
**Goal**: Setup budget alerts and cost tracking

**Starting point:** Di budget pattern above and resource-group-scoped infrastructure module. Add dis resource using your editor; pass `budgetStartDate` from your parameter mapping (no duplicate di parameter if e already declare). Change di recipient and confirm you get budget write access.

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

Expected: di response get `amount: 200`, both thresholds, and your recipient. Check Cost Management for portal to see real charges; cost data dey delay so alert no need to fire during short exercise.

**Success Criteria:**
- [ ] Budget alert create for Azure
- [ ] Email notifications set
- [ ] Fit see cost data for Azure Portal
- [ ] Budget thresholds set correct

## 💡 Frequently Asked Questions

<details>
<summary><strong>How I go take reduce Microsoft Foundry Models costs during development?</strong></summary>

1. **Check pricing**: No universal free 50,000-token monthly allowance for Azure OpenAI models dey
2. **Right-size capacity**: Capacity `10` normally mean 10,000 TPM for these Standard text models, no be 10 TPM. Reducing dis rate limit no go reduce per-token prices
3. **Use azd down**: Delete disposable resources wen you no dey develop actively (this no be deallocation)
4. **Cache Responses**: Use Redis cache for repeated queries
5. **Use Prompt Engineering**: Cut down token use with efficient prompts

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Wetyn be difference between Microsoft Foundry Models and OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Enterprise security and compliance
- Private network integration
- SLA guarantees
- Managed identity authentication
- Higher quota available

**OpenAI API**: Na separate provider/API with its own model availability, pricing, authentication, and enterprise connectivity options. Compare current offerings instead of assuming na public-internet-only or models always first ship.

Pick based on your organization's requirements; Azure managed identity and private-link examples for this course na for Azure-hosted services, no be every model/provider for Foundry catalog.
</details>

<details>
<summary><strong>How I go handle Microsoft Foundry Models quota exceeded errors?</strong></summary>

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

Yes o! Use **Azure AI Search** for RAG (Retrieval Augmented Generation):

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

Check di [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template.
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
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Install Azure + Foundry agent skills in your editor with `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Agents](agents.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Need Help?** Join our community discussions or open an issue in the repository. The Azure AI + AZD community na here to help you succeed!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->