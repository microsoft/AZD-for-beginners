# Pagsasama ng Microsoft Foundry sa AZD

**Pag-navigate sa Kabanata:**
- **📚 Bahay ng Kurso**: [AZD Para sa mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraang Kabanata**: [Kabanata 1: Ang Iyong Unang Proyekto](../chapter-01-foundation/first-project.md)
- **➡️ Susunod**: [Pag-deploy ng AI Model](ai-model-deployment.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Pag-configure](../chapter-03-configuration/configuration.md)

## Pangkalahatang-ideya

Ipinapakita ng gabay na ito kung paano isama ang mga serbisyo ng Microsoft Foundry sa Azure Developer CLI (AZD) para sa mas maayos na pag-deploy ng AI na mga aplikasyon. Nagbibigay ang Microsoft Foundry ng isang komprehensibong platform para sa pagbuo, pag-deploy, at pamamahala ng mga AI na aplikasyon, habang pinapasimple ng AZD ang proseso ng imprastraktura at deployment.

## Ano ang Microsoft Foundry?

Ang Microsoft Foundry ay ang pinag-isang platform ng Microsoft para sa pag-develop ng AI na kinabibilangan ng:

- **Model Catalog**: Access sa mga makabagong AI models
- **Prompt Flow**: Visual designer para sa AI workflows
- **Microsoft Foundry Portal**: Pinagsamang development environment para sa mga AI application
- **Deployment Options**: Maraming pagpipilian sa hosting at scaling
- **Safety and Security**: Mga built-in na tampok ng responsable AI

## AZD + Microsoft Foundry: Mas Maganda Kapag Magkasama

| Tampok | Microsoft Foundry | Benepisyo ng Pagsasama sa AZD |
|---------|-----------------|------------------------|
| **Model Deployment** | Manu-manong deployment sa portal | Awtomatiko, paulit-ulit na deployment |
| **Imprastraktura** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Pamamahala ng Kapaligiran** | Nakatuon sa isang kapaligiran | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limitado | Native na suporta sa GitHub Actions |
| **Pamamahala ng Gastos** | Basic monitoring | Environment-specific na optimal na gastos |

## Mga Kinakailangan

- Azure subscription na may angkop na permiso
- Nakainstall ang Azure Developer CLI
- Access sa Microsoft Foundry Models services
- Pangunahing pagkakakilala sa Microsoft Foundry

> **Kasalukuyang baseline ng AZD:** Ang mga halimbawa na ito ay sinuri gamit ang `azd` `1.27.1`. Para sa AI agent workflow, gamitin ang kasalukuyang preview extension release at tingnan ang iyong naka-install na bersyon bago magsimula.

## Mga Pangunahing Pattern ng Integrasyon

### Pattern 1: Pagsasama ng Microsoft Foundry Models

**Pangunahing Gamit**: Mag-deploy ng chat applications gamit ang mga modelong Microsoft Foundry Models

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

**Imprastraktura (main.bicep):**
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

### Pattern 2: Pagsasama ng AI Search + RAG

**Pangunahing Gamit**: Mag-deploy ng retrieval-augmented generation (RAG) applications

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

### Pattern 3: Pagsasama ng Document Intelligence

**Pangunahing Gamit**: Mga workflow para sa pagproseso at pagsusuri ng dokumento

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

## 🔧 Mga Pattern ng Pag-configure

### Pagsasaayos ng Environment Variables

**Production Configuration:**
```bash
# Pangunahing mga serbisyo ng AI
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
# Mga setting na na-optimize para sa gastos para sa pag-unlad
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Libreng antas
```

### Secure Configuration gamit ang Key Vault

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

## Mga Workflow ng Deployment

### AZD Extensions para sa Foundry

Nagbibigay ang AZD ng mga extension na nagdaragdag ng AI-specific na kakayahan para sa paggamit ng mga serbisyo ng Microsoft Foundry:

```bash
# I-install ang Foundry agents na extension
azd extension install azure.ai.agents

# I-install ang fine-tuning na extension
azd extension install azure.ai.finetune

# I-install ang custom models na extension
azd extension install azure.ai.models

# Ilista ang mga naka-install na extension
azd extension list --installed

# Suriin ang kasalukuyang naka-install na bersyon ng agent extension
azd extension show azure.ai.agents
```

Ang mga AI extension ay patuloy pa ring mabilis na umuunlad sa preview. Kung mayroong utos na kumikilos nang iba kaysa dito, i-upgrade muna ang kaukulang extension bago mag-troubleshoot ng proyekto.

### Agent-First Deployment gamit ang `azd ai`

Kung mayroon kang agent manifest, gamitin ang `azd ai agent init` upang i-scaffold ang isang proyekto na naka-wire sa Foundry Agent Service:

```bash
# I-initialize mula sa isang agent manifest
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# I-deploy sa Azure
azd up
```

Kamakailang mga preview release ng `azure.ai.agents` ay nagdagdag din ng template-based initialization support para sa `azd ai agent init`. Kung sumusunod ka sa mga bagong halimbawa ng agent, tingnan ang tulong ng extension para sa eksaktong mga flag na available sa iyong na-install na bersyon.

Tingnan ang [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para sa buong reperensiya ng mga utos at flag.

### Single Command Deployment

```bash
# I-deploy ang lahat gamit ang isang utos
azd up

# O mag-deploy nang paunti-unti
azd provision  # Imprastruktura lamang
azd deploy     # Aplikasyon lamang

# Para sa pangmatagalang pagpapatakbo ng AI app deployments sa azd 1.23.11+
azd deploy --timeout 1800
```

### Mga Deployment na Nakatuon sa Kapaligiran

```bash
# Kapaligiran ng pag-unlad
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

## Monitoring at Observability

### Pagsasama ng Application Insights

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

### Pagsubaybay ng Gastos

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

## 🔐 Mga Pinakamahusay na Kasanayan sa Seguridad

### Pag-configure ng Managed Identity

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

### Seguridad sa Network

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

## Pag-optimize ng Performance

### Mga Estratehiya sa Caching

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

### Pag-configure ng Auto-scaling

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

## Pag-troubleshoot ng Mga Karaniwang Isyu

### Isyu 1: Lumabis ang Quota ng OpenAI

**Sintomas:**
- Nabibigo ang deployment dahil sa mga error sa quota
- 429 na error sa mga log ng aplikasyon

**Mga Solusyon:**
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

### Isyu 2: Mga Malfunction sa Pag-awtentika

**Sintomas:**
- 401/403 error kapag tinatawagan ang AI services
- Mga mensaheng "Access denied"

**Mga Solusyon:**
```bash
# Suriin ang mga asignasyon ng papel
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Suriin ang configuration ng pinamamahalaang pagkakakilanlan
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Patunayan ang access sa Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Isyu 3: Mga Problema sa Deployment ng Modelo

**Sintomas:**
- Hindi available ang mga modelo sa deployment
- Mga partikular na bersyon ng modelo ang pumapalya

**Mga Solusyon:**
```bash
# Ilista ang mga magagamit na modelo ayon sa rehiyon
az cognitiveservices model list --location eastus

# I-update ang bersyon ng modelo sa bicep template
# Suriin ang mga kinakailangan sa kapasidad ng modelo
```

## Mga Halimbawang Template

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Mga Serbisyo**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Paglalarawan**: Ang pinakasikat na sample ng Azure AI — isang production-ready na RAG chat app na nagpapahintulot sa iyo na magtanong tungkol sa iyong sariling mga dokumento. Ginagamit ang GPT-4.1-mini para sa chat, text-embedding-3-large para sa embeddings, at Azure AI Search para sa retrieval. Sumusuporta sa multimodal na mga dokumento, input/output sa pagsasalita, Microsoft Entra authentication, at Application Insights tracing.

**Mabilis na Simula**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Mga Serbisyo**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Paglalarawan**: Ang katumbas na .NET/C# ng Python RAG chat sample. Ginawa gamit ang ASP.NET Core Minimal API at Blazor WebAssembly frontend. Kasama ang voice chat, suporta sa GPT-4o-mini vision, at kasama ang .NET MAUI Blazor Hybrid desktop/mobile client.

**Mabilis na Simula**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Mga Serbisyo**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Paglalarawan**: Bersyon ng Java ng RAG chat sample gamit ang Langchain4J para sa AI orchestration. Sumusuporta sa microservice event-driven architecture, maraming search strategies (text, vector, hybrid), pag-upload ng dokumento gamit ang Azure Document Intelligence, at deployment sa Azure Container Apps o Azure Kubernetes Service.

**Mabilis na Simula**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot gamit ang Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Mga Serbisyo**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Paglalarawan**: End-to-end retail RAG copilot gamit ang Microsoft Foundry at Prompty. Isang chatbot ng Contoso Outdoor retailer na nakabatay sa catalog ng produkto at data ng order ng customer. Ipinapakita ang buong GenAIOps workflow — prototype gamit ang Prompty, suriin gamit ang AI-assisted evaluators, at i-deploy gamit ang AZD sa Container Apps.

**Mabilis na Simula**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Mga Serbisyo**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Paglalarawan**: Multi-agent sample na nagpapakita ng AI agent orchestration gamit ang Prompty. Gumagamit ng research agent (Bing Grounding sa Azure AI Agent Service), product agent (Azure AI Search), writer agent, at editor agent upang magkatuwang na makalikha ng mahusay na mga artikulo. Kasama ang CI/CD sa pagsusuri gamit ang GitHub Actions.

**Mabilis na Simula**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Mga Serbisyo**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Paglalarawan**: Fully serverless RAG chatbot gamit ang LangChain.js kasama ang Azure Functions para sa API at Azure Static Web Apps para sa hosting. Ginagamit ang Azure Cosmos DB bilang vector store at chat history database. Sinusuportahan ang lokal na pag-unlad gamit ang Ollama para sa zero-cost testing.

**Mabilis na Simula**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Mga Serbisyo**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Paglalarawan**: Enterprise-grade RAG solution accelerator na may admin portal para sa pag-upload/pamamahala ng dokumento, maraming mga opsyon ng orchestrator (Semantic Kernel, LangChain, Prompt Flow), speech-to-text, Microsoft Teams integration, at pagpipilian ng PostgreSQL o Cosmos DB sa backend. Dinisenyo bilang isang madaling i-customize na panimulang punto para sa production RAG scenarios.

**Mabilis na Simula**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Mga Serbisyo**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Paglalarawan**: Reference application para sa multi-agent AI orchestration gamit ang tatlong frameworks (LangChain.js, LlamaIndex.TS, at Microsoft Agent Framework). Tampok ang MCP (Model Context Protocol) servers sa apat na wika na naka-deploy bilang serverless Azure Container Apps na may OpenTelemetry monitoring.

**Mabilis na Simula**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Mga Serbisyo**: Azure AI Services + Azure OpenAI

**Paglalarawan**: Minimal na Bicep template na nag-de-deploy ng Azure AI services na may naka-configure na machine learning models. Isang magaan na panimulang punto para sa pag-provision ng Azure AI infrastructure nang hindi kinakailangan ng buong application stack.

**Mabilis na Simula**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Mag-browse ng mas marami pang mga template**: Bisitahin ang [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) para sa mahigit 80 AI-specific na mga AZD template sa iba't ibang wika at senaryo.

## Mga Susunod na Hakbang

1. **Subukan ang mga Halimbawa**: Magsimula sa pre-built na template na tumutugma sa iyong paggamit
2. **I-customize para sa Iyong Pangangailangan**: Baguhin ang imprastraktura at code ng aplikasyon
3. **Magdagdag ng Monitoring**: Magpatupad ng komprehensibong observability
4. **I-optimize ang Gastos**: Pinuhin ang mga configuration para sa iyong budget
5. **Siguraduhin ang Iyong Deployment**: Magpatupad ng mga pattern ng enterprise security
6. **I-scale sa Production**: Magdagdag ng mga multi-region at high-availability na mga tampok

## 🎯 Mga Hands-On na Ehersisyo

### Ehersisyo 1: Magdeploy ng Microsoft Foundry Models Chat App (30 minuto)
**Layunin**: Magdeploy at subukan ang production-ready na AI chat application

```bash
# Simulan ang template
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

# I-monitor ang mga operasyon ng AI
azd monitor

# Linisin
azd down --force --purge
```

**Pamantayan ng Tagumpay:**
- [ ] Natapos ang deployment nang walang quota error
- [ ] Maa-access ang chat interface sa browser
- [ ] Makapag-tanong at makakuha ng AI-powered na mga sagot
- [ ] Nagpapakita ang Application Insights ng telemetry data
- [ ] Matagumpay na nalinis ang mga resources

**Tinatayang Gastos**: $5-10 para sa 30 minutong testing

### Ehersisyo 2: Mag-configure ng Multi-Model Deployment (45 minuto)
**Layunin**: Magdeploy ng maraming AI models na may iba't ibang configuration

```bash
# Gumawa ng pasadyang Bicep na configuration
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

# Mag-deploy at mag-verify
azd provision
azd show
```

**Pamantayan ng Tagumpay:**
- [ ] Maraming modelo ang matagumpay na na-deploy
- [ ] Iba't ibang mga setting ng kapasidad ang naipasa
- [ ] Maa-access ang mga modelo gamit ang API
- [ ] Maaaring tawagan ang parehong mga modelo mula sa aplikasyon

### Ehersisyo 3: Magpatupad ng Cost Monitoring (20 minuto)
**Layunin**: Mag-set up ng mga budget alert at pagsubaybay sa gastos

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

# Suriin ang kasalukuyang mga gastos
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Pamantayan ng Tagumpay:**
- [ ] Nalikha ang budget alert sa Azure
- [ ] Naka-configure ang email notifications
- [ ] Maaaring makita ang datos ng gastos sa Azure Portal
- [ ] Maayos ang pagkaka-set ng mga budget threshold

## 💡 Mga Madalas Itanong

<details>
<summary><strong>Paano ko mababawasan ang gastos sa Microsoft Foundry Models habang nandaragdagos ang development?</strong></summary>

1. **Gamitin ang Free Tier**: Nagbibigay ang Microsoft Foundry Models ng 50,000 tokens/buwan nang libre
2. **Bawasan ang Kapasidad**: Itakda ang kapasidad sa 10 TPM sa halip na 30+ para sa dev
3. **Gamitin ang azd down**: I-deallocate ang mga resources kapag hindi aktibong nagdedebelop
4. **I-cache ang Mga Tugon**: Magpatupad ng Redis cache para sa mga paulit-ulit na query
5. **Gamitin ang Prompt Engineering**: Bawasan ang paggamit ng token gamit ang epektibong mga prompt


```bash
# Konpigurasyon ng pag-unlad
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Ano ang pinagkaiba ng Microsoft Foundry Models at OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Seguridad at pagsunod sa enterprise
- Pribadong integrasyon ng network
- Garantiyang SLA
- Managed identity authentication
- Mas mataas na quota na available

**OpenAI API**:
- Mas mabilis na access sa bagong mga modelo
- Mas simpleng setup
- Mas mababang hadlang sa pagpasok
- Pampublikong internet lamang

Para sa production apps, **inirerekomenda ang Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Paano ko haharapin ang mga error sa quota exceeded ng Microsoft Foundry Models?</strong></summary>

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
# Pumunta sa Azure Portal > Quotas > Humiling ng pagtaas
```
</details>

<details>
<summary><strong>Maaari ko bang gamitin ang sarili kong data sa Microsoft Foundry Models?</strong></summary>

Oo! Gamitin ang **Azure AI Search** para sa RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Tingnan ang [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template.
</details>

<details>
<summary><strong>Paano ko mapoprotektahan ang AI model endpoints?</strong></summary>

**Pinakamahusay na mga Praktis**:
1. Gamitin ang Managed Identity (walang API keys)
2. Paganahin ang Private Endpoints
3. I-configure ang mga network security groups
4. Magpatupad ng rate limiting
5. Gamitin ang Azure Key Vault para sa mga lihim

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
- **AZD GitHub**: [Mga isyu at talakayan](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Opisyal na dokumentasyon](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - I-install ang Azure + Foundry agent skills sa iyong editor gamit ang `npx skills add microsoft/github-copilot-for-azure`

---

**Pag-navigate sa Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD For Beginners](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraang Kabanata**: [Kabanata 1: Ang Iyong Unang Proyekto](../chapter-01-foundation/first-project.md)
- **➡️ Susunod**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Configuration](../chapter-03-configuration/configuration.md)

**Kailangan ng Tulong?** Sumali sa aming mga talakayan sa komunidad o magbukas ng isyu sa repositoryo. Narito ang Azure AI + AZD na komunidad upang tulungan kang magtagumpay!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->