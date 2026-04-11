# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Kabanata 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Pangkalahatang-ideya

Ang gabay na ito ay nagpapakita kung paano i-integrate ang Microsoft Foundry services sa Azure Developer CLI (AZD) para sa mas pinadaling deployment ng AI application. Nagbibigay ang Microsoft Foundry ng komprehensibong platform para sa pagbuo, pag-deploy, at pamamahala ng AI applications, habang pinapasimple ng AZD ang proseso ng imprastruktura at deployment.

## Ano ang Microsoft Foundry?

Ang Microsoft Foundry ay pinag-isang platform ng Microsoft para sa pag-develop ng AI na naglalaman ng:

- **Model Catalog**: Access sa mga makabagong AI models
- **Prompt Flow**: Visual designer para sa AI workflows
- **Microsoft Foundry Portal**: Integrated development environment para sa AI applications
- **Deployment Options**: Maraming pagpipilian sa hosting at scaling
- **Safety and Security**: May built-in na responsible AI features

## AZD + Microsoft Foundry: Mas Maganda Nang Magkasama

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Mga Kinakailangan

- Azure subscription na may angkop na permissions
- Azure Developer CLI na naka-install
- Access sa Microsoft Foundry Models services
- Pangunahing pamilyaridad sa Microsoft Foundry

> **Current AZD baseline:** Sinuri ang mga halimbawa na ito laban sa `azd` `1.23.12`. Para sa AI agent workflow, gamitin ang kasalukuyang preview extension release at tingnan ang iyong naka-install na bersyon bago ka magsimula.

## Core Integration Patterns

### Pattern 1: Microsoft Foundry Models Integration

**Use Case**: I-deploy ang chat applications gamit ang Microsoft Foundry Models models

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

**Use Case**: I-deploy ang retrieval-augmented generation (RAG) applications

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

**Use Case**: Mga workflow para sa pagproseso at pagsusuri ng dokumento

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
# Pangunahing serbisyo ng AI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Mga konfigurasyon ng modelo
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Mga setting ng pagganap
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Development Configuration:**
```bash
# Mga setting na na-optimize para mabawasan ang gastos sa pag-develop
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Libreng antas
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

Nagbibigay ang AZD ng mga extension na nagdadagdag ng AI-specific na kakayahan para sa pagtatrabaho sa Microsoft Foundry services:

```bash
# I-install ang extension ng Foundry agents
azd extension install azure.ai.agents

# I-install ang extension para sa fine-tuning
azd extension install azure.ai.finetune

# I-install ang extension para sa mga custom na modelo
azd extension install azure.ai.models

# Ilista ang mga naka-install na extension
azd extension list --installed

# Suriin ang kasalukuyang naka-install na bersyon ng agent extension
azd extension show azure.ai.agents
```

Ang mga AI extension ay mabilis pa ring umuunlad sa preview. Kung ang isang command ay kumikilos nang iba kaysa sa ipinapakita dito, i-upgrade ang kaugnay na extension bago i-troubleshoot ang mismong proyekto.

### Agent-First Deployment with `azd ai`

Kung mayroon kang agent manifest, gamitin ang `azd ai agent init` para mag-scaffold ng proyekto na naka-wire sa Foundry Agent Service:

```bash
# I-initialize mula sa manifest ng ahente
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# I-deploy sa Azure
azd up
```

Ang mga kamakailang preview release ng `azure.ai.agents` ay nagdagdag din ng template-based initialization support para sa `azd ai agent init`. Kung sinusundan mo ang mas bagong agent samples, tingnan ang help ng extension para sa eksaktong flags na available sa iyong naka-install na bersyon.

Tingnan ang [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para sa buong reference ng command at mga flags.

### Single Command Deployment

```bash
# I-deploy ang lahat gamit ang isang utos
azd up

# O i-deploy nang paunti-unti
azd provision  # Imprastruktura lamang
azd deploy     # Aplikasyon lamang

# Para sa pangmatagalang pag-deploy ng AI na app sa azd 1.23.11+
azd deploy --timeout 1800
```

### Environment-Specific Deployments

```bash
# Kapaligiran ng pag-develop
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Kapaligiran ng produksyon
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
- Nabibigo ang deployment dahil sa quota errors
- 429 errors sa application logs

**Solutions:**
```bash
# Suriin ang kasalukuyang paggamit ng quota
az cognitiveservices usage list --location eastus

# Subukan ang ibang rehiyon
azd env set AZURE_LOCATION westus2
azd up

# Pansamantalang bawasan ang kapasidad
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Issue 2: Authentication Failures

**Symptoms:**
- 401/403 errors kapag tumatawag sa AI services
- Mga mensaheng "Access denied"

**Solutions:**
```bash
# Suriin ang mga pagtatalaga ng tungkulin
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Suriin ang konfigurasyon ng pinamamahalaang pagkakakilanlan
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Suriin ang pag-access sa Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Issue 3: Model Deployment Issues

**Symptoms:**
- Hindi available ang mga modelo sa deployment
- Nabibigo ang mga partikular na bersyon ng modelo

**Solutions:**
```bash
# Ilista ang magagamit na mga modelo ayon sa rehiyon
az cognitiveservices model list --location eastus

# I-update ang bersyon ng modelo sa bicep template
# Suriin ang mga kinakailangan sa kapasidad ng modelo
```

## Example Templates

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: Ang pinakapopular na Azure AI sample — isang production-ready RAG chat app na nagpapahintulot sa iyo na magtanong gamit ang iyong sariling mga dokumento. Gumagamit ng GPT-4.1-mini para sa chat, text-embedding-3-large para sa embeddings, at Azure AI Search para sa retrieval. Sumusuporta sa multimodal documents, speech input/output, Microsoft Entra authentication, at Application Insights tracing.

**Mabilis na Simula**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: Ang katumbas na .NET/C# ng Python RAG chat sample. Binuo gamit ang ASP.NET Core Minimal API at Blazor WebAssembly frontend. Kasama ang voice chat, GPT-4o-mini vision support, at isang kaakibat na .NET MAUI Blazor Hybrid desktop/mobile client.

**Mabilis na Simula**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: Java na bersyon ng RAG chat sample na gumagamit ng Langchain4J para sa AI orchestration. Sumusuporta sa microservice event-driven architecture, maraming search strategies (text, vector, hybrid), document upload gamit ang Azure Document Intelligence, at deployment sa alinman sa Azure Container Apps o Azure Kubernetes Service.

**Mabilis na Simula**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: End-to-end retail RAG copilot gamit ang Azure AI Foundry at Prompty. Isang Contoso Outdoor retailer chatbot na nag-uugnay ng mga sagot sa product catalog at customer order data. Ipinapakita ang buong GenAIOps workflow — prototype gamit ang Prompty, i-evaluate gamit ang AI-assisted evaluators, at i-deploy via AZD sa Container Apps.

**Mabilis na Simula**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: Multi-agent sample na nagpapakita ng AI agent orchestration gamit ang Prompty. Gumagamit ng research agent (Bing Grounding in Azure AI Agent Service), product agent (Azure AI Search), writer agent, at editor agent upang magkakasamang makabuo ng mga mahusay na na-research na artikulo. Kasama ang CI/CD na may evaluation sa GitHub Actions.

**Mabilis na Simula**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: Ganap na serverless na RAG chatbot gamit ang LangChain.js na may Azure Functions para sa API at Azure Static Web Apps para sa hosting. Gumagamit ng Azure Cosmos DB bilang parehong vector store at chat history database. Sumusuporta sa lokal na pag-develop gamit ang Ollama para sa zero-cost testing.

**Mabilis na Simula**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description**: Enterprise-grade RAG solution accelerator na may admin portal para sa document upload/management, maraming orchestrator options (Semantic Kernel, LangChain, Prompt Flow), speech-to-text, Microsoft Teams integration, at pagpipilian ng PostgreSQL o Cosmos DB backend. Dinisenyo bilang customizable na panimulang punto para sa production RAG scenarios.

**Mabilis na Simula**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: Reference application para sa multi-agent AI orchestration gamit ang tatlong framework (LangChain.js, LlamaIndex.TS, at Microsoft Agent Framework). Tampok ang MCP (Model Context Protocol) servers sa apat na wika na dineploy bilang serverless Azure Container Apps na may OpenTelemetry monitoring.

**Mabilis na Simula**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Description**: Minimal na Bicep template na nagde-deploy ng Azure AI services na may na-configure na machine learning models. Isang magaan na panimulang punto kapag kailangan mo lamang ang Azure AI infrastructure na provisioned nang walang buong application stack.

**Mabilis na Simula**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Browse more templates**: Visit the [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for 80+ AI-specific AZD templates across languages and scenarios.

## Susunod na Mga Hakbang

1. **Subukan ang mga Halimbawa**: Magsimula sa isang pre-built template na tumutugma sa iyong use case
2. **I-customize para sa Iyong Pangangailangan**: Baguhin ang imprastruktura at application code
3. **Magdagdag ng Monitoring**: Magpatupad ng komprehensibong observability
4. **I-optimize ang Mga Gastos**: Pulihin ang mga configuration para sa iyong budget
5. **I-secure ang Iyong Deployment**: Magpatupad ng enterprise security patterns
6. **I-scale para sa Produksyon**: Magdagdag ng multi-region at high-availability features

## 🎯 Hands-On Exercises

### Exercise 1: Deploy Microsoft Foundry Models Chat App (30 minutes)
**Goal**: I-deploy at subukan ang isang production-ready AI chat application

```bash
# Ihanda ang template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Itakda ang mga variable ng kapaligiran
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# I-deploy
azd up

# Subukan ang aplikasyon
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Subaybayan ang mga operasyon ng AI
azd monitor

# Linisin
azd down --force --purge
```

**Success Criteria:**
- [ ] Natapos ang deployment nang walang quota errors
- [ ] Maaaring ma-access ang chat interface sa browser
- [ ] Maaaring magtanong at makatanggap ng AI-powered na mga tugon
- [ ] Ipinapakita ng Application Insights ang telemetry data
- [ ] Matagumpay na na-clean up ang mga resources

**Tinatayang Gastos**: $5-10 para sa 30 minuto ng testing

### Exercise 2: Configure Multi-Model Deployment (45 minutes)
**Goal**: I-deploy ang maraming AI models na may iba't ibang configuration

```bash
# Lumikha ng pasadyang konfigurasyon ng Bicep
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

# I-deploy at beripikahin
azd provision
azd show
```

**Success Criteria:**
- [ ] Maramihang modelo ang na-deploy nang matagumpay
- [ ] Different capacity settings ang na-apply
- [ ] Mga modelo ay ma-access via API
- [ ] Maaaring tawagin ang parehong mga modelo mula sa application

### Exercise 3: Implement Cost Monitoring (20 minutes)
**Goal**: Mag-setup ng budget alerts at cost tracking

```bash
# Magdagdag ng alerto sa badyet sa Bicep
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

# I-deploy ang alerto sa badyet
azd provision

# Suriin ang kasalukuyang gastos
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Success Criteria:**
- [ ] Nabuo ang budget alert sa Azure
- [ ] Na-configure ang email notifications
- [ ] Maaaring makita ang cost data sa Azure Portal
- [ ] Na-set nang naaangkop ang mga budget thresholds

## 💡 Frequently Asked Questions

<details>
<summary><strong>Paano ko mababawasan ang Microsoft Foundry Models costs habang nagde-develop?</strong></summary>

1. **Gamitin ang Free Tier**: Nag-aalok ang Microsoft Foundry Models ng 50,000 tokens/buwan nang libre
2. **Bawasan ang Capacity**: I-set ang capacity sa 10 TPM imbes na 30+ para sa dev
3. **Gamitin ang azd down**: I-deallocate ang mga resources kapag hindi aktibong nagde-develop
4. **I-cache ang Mga Tugon**: Magpatupad ng Redis cache para sa mga paulit-ulit na query
5. **Gamitin ang Prompt Engineering**: Bawasan ang token usage gamit ang mas epektibong mga prompt
```bash
# Konfigurasyon para sa pag-develop
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Ano ang pagkakaiba ng Microsoft Foundry Models at OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Seguridad at pagsunod para sa enterprise
- Integrasyon sa pribadong network
- Garantiyang SLA
- Pagpapatunay ng Managed Identity
- Mas mataas na quota ang magagamit

**OpenAI API**:
- Mas mabilis na pag-access sa mga bagong modelo
- Mas simpleng pagsasaayos
- Mas mababang hadlang sa pagpasok
- Publikong internet lamang

Para sa production na apps, **inirerekomenda ang Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Paano ko haharapin ang mga error na nalampasan ang quota ng Microsoft Foundry Models?</strong></summary>

```bash
# Suriin ang kasalukuyang quota
az cognitiveservices usage list --location eastus2

# Subukan ang ibang rehiyon
azd env set AZURE_LOCATION westus2
azd up

# Pansamantalang bawasan ang kapasidad
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Humiling ng pagtaas ng quota
# Pumunta sa Azure Portal > Mga quota > Humiling ng pagtaas
```
</details>

<details>
<summary><strong>Maaari ko bang gamitin ang sarili kong data sa Microsoft Foundry Models?</strong></summary>

Oo! Gumamit ng **Azure AI Search** para sa RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Tingnan ang template na [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Paano ko poprotektahan ang mga endpoint ng AI model?</strong></summary>

**Pinakamahusay na mga Kasanayan**:
1. Gumamit ng Managed Identity (walang API keys)
2. Paganahin ang Private Endpoints
3. I-configure ang mga network security group
4. Magpatupad ng rate limiting
5. Gumamit ng Azure Key Vault para sa mga lihim

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

## Komunidad at Suporta

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Isyu at mga diskusyon](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Opisyal na dokumentasyon](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - I-install ang Azure + Foundry agent skills sa iyong editor gamit ang `npx skills add microsoft/github-copilot-for-azure`

---

**Pag-navigate ng Kabanata:**
- **📚 Pahina ng Kurso**: [AZD For Beginners](../../README.md)
- **📖 Kasalukuyang Kabanata**: Chapter 2 - AI-First Development
- **⬅️ Nakaraang Kabanata**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Susunod**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Susunod na Kabanata**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Kailangan ng Tulong?** Sumali sa aming mga talakayan sa komunidad o magbukas ng isyu sa repositoryo. Ang komunidad ng Azure AI + AZD ay nandito upang tulungan kang magtagumpay!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Ang dokumentong ito ay isinalin gamit ang serbisyong pagsasalin na gumagamit ng AI na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman sinisikap naming maging tumpak, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na pinagmumulan ng awtoridad. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling ginagawa ng tao. Hindi kami mananagot para sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->