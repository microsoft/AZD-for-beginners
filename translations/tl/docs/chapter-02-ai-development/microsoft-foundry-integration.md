# Integrasyon ng Microsoft Foundry sa AZD

**Pag-navigate ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD For Beginners](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraang Kabanata**: [Kabanata 1: Ang Iyong Unang Proyekto](../chapter-01-foundation/first-project.md)
- **➡️ Susunod**: [Pag-deploy ng Modelo ng AI](ai-model-deployment.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Konfigurasyon](../chapter-03-configuration/configuration.md)

## Pangkalahatang-ideya

Ang gabay na ito ay nagpapakita kung paano i-integrate ang mga serbisyo ng Microsoft Foundry sa Azure Developer CLI (AZD) para sa mas pinadaling pag-deploy ng mga AI application. Nagbibigay ang Microsoft Foundry ng komprehensibong plataporma para sa pagbuo, pag-deploy, at pamamahala ng mga AI application, habang pinapadali naman ng AZD ang imprastruktura at proseso ng pag-deploy.

## Ano ang Microsoft Foundry?

Ang Microsoft Foundry ay pinag-isang plataporma ng Microsoft para sa pag-develop ng AI na kinabibilangan ng:

- **Model Catalog**: Pag-access sa mga makabagong modelo ng AI
- **Prompt Flow**: Visual na taga-disenyo para sa mga AI workflow
- **Microsoft Foundry Portal**: Integrated development environment para sa mga AI application
- **Deployment Options**: Maraming opsyon sa pagho-host at pag-scale
- **Safety and Security**: Mga built-in na tampok para sa responsableng AI

## AZD + Microsoft Foundry: Mas Magandang Magkasama

| Tampok | Microsoft Foundry | Benepisyo ng Integrasyon ng AZD |
|---------|-----------------|------------------------|
| **Pag-deploy ng Modelo** | Manwal na pag-deploy sa portal | Awtomatiko, paulit-ulit na pag-deploy |
| **Imprastruktura** | Click-through provisioning | Imprastruktura bilang Code (Bicep) |
| **Pamamahala ng Kapaligiran** | Nakatuon sa isang kapaligiran | Maramihang kapaligiran (dev/staging/prod) |
| **Integrasyon ng CI/CD** | Limitado | Katutubong suporta para sa GitHub Actions |
| **Pamamahala ng Gastos** | Pangunahing pagmo-monitor | Pag-optimize ng gastos para sa bawat kapaligiran |

## Mga Kinakailangan

- Azure subscription na may angkop na mga permiso
- Nakainstall ang Azure Developer CLI
- Access sa mga serbisyo ng Microsoft Foundry Models
- Pangunahing pamilyaridad sa Microsoft Foundry

> **Kasalukuyang baseline ng AZD:** Sinuri ang mga halimbawa laban sa `azd` `1.23.12`. Para sa AI agent workflow, gamitin ang kasalukuyang preview extension release at suriin ang naka-install mong bersyon bago magsimula.

## Pangunahing Mga Pattern ng Integrasyon

### Pattern 1: Integrasyon ng Microsoft Foundry Models

**Kaso ng Paggamit**: Mag-deploy ng mga chat application gamit ang Microsoft Foundry Models

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

**Imprastruktura (main.bicep):**
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

### Pattern 2: AI Search + RAG Integrasyon

**Kaso ng Paggamit**: Mag-deploy ng mga retrieval-augmented generation (RAG) na aplikasyon

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

### Pattern 3: Integrasyon ng Document Intelligence

**Kaso ng Paggamit**: Mga workflow para sa pagproseso at pagsusuri ng dokumento

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

## 🔧 Mga Pattern ng Konfigurasyon

### Pag-setup ng Mga Environment Variable

**Konfigurasyon para sa Produksyon:**
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

**Konfigurasyon para sa Pag-unlad:**
```bash
# Mga setting na pinahusay para mabawasan ang gastos sa pag-develop
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Libreng antas
```

### Ligtas na Konfigurasyon gamit ang Key Vault

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

## Mga Workflow sa Pag-deploy

### Mga Extension ng AZD para sa Foundry

Nagbibigay ang AZD ng mga extension na nagdaragdag ng mga AI-specific na kakayahan para sa pakikipagtulungan sa mga serbisyo ng Microsoft Foundry:

```bash
# I-install ang Foundry agents extension
azd extension install azure.ai.agents

# I-install ang fine-tuning extension
azd extension install azure.ai.finetune

# I-install ang extension para sa mga pasadyang modelo
azd extension install azure.ai.models

# Ilista ang mga naka-install na extension
azd extension list --installed

# Siyasatin ang kasalukuyang naka-install na bersyon ng agent extension
azd extension show azure.ai.agents
```

Ang mga AI extension ay mabilis pa ring nagbabago sa preview. Kung ang isang utos ay kumikilos nang iba kaysa ipinapakita dito, i-upgrade ang kaukulang extension bago mag-troubleshoot sa proyekto mismo.

### Agent-First Deployment gamit ang `azd ai`

Kung mayroon kang agent manifest, gamitin ang `azd ai agent init` upang i-scaffold ang isang proyekto na naka-wired sa Foundry Agent Service:

```bash
# I-initialize mula sa manifest ng ahente
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# I-deploy sa Azure
azd up
```

Kamakailang preview releases ng `azure.ai.agents` ay nagdagdag din ng template-based initialization support para sa `azd ai agent init`. Kung sinusundan mo ang mas bagong agent samples, tingnan ang tulong ng extension para sa eksaktong mga flag na magagamit sa iyong naka-install na bersyon.

Tingnan ang [Mga Utos ng AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para sa buong sanggunian ng mga utos at flag.

### Pag-deploy na May Isang Utos

```bash
# I-deploy ang lahat gamit ang isang utos
azd up

# O mag-deploy nang paunti-unti
azd provision  # Imprastruktura lamang
azd deploy     # Aplikasyon lamang

# Para sa mga pangmatagalang pag-deploy ng AI na aplikasyon sa azd 1.23.11+
azd deploy --timeout 1800
```

### Mga Pag-deploy na Espesipiko sa Kapaligiran

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

## Pagsubaybay at Obserbabilidad

### Integrasyon ng Application Insights

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

## 🔐 Pinakamahuhusay na Praktika sa Seguridad

### Konfigurasyon ng Managed Identity

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

### Seguridad ng Network

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

## Pag-optimize ng Pagganap

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

### Konfigurasyon ng Auto-scaling

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

### Isyu 1: Naabot ang Quota ng OpenAI

**Sintomas:**
- Nabibigo ang pag-deploy dahil sa mga error sa quota
- Mga error na 429 sa application logs

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

### Isyu 2: Mga Pagkabigo sa Pagpapatotoo

**Sintomas:**
- Mga error na 401/403 kapag tumatawag sa mga AI service
- Mga mensaheng "Access denied"

**Mga Solusyon:**
```bash
# Suriin ang mga pagtatalaga ng role
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Suriin ang konfigurasyon ng managed identity
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Tiyakin ang pag-access sa Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Isyu 3: Mga Problema sa Pag-deploy ng Modelo

**Sintomas:**
- Hindi available ang mga modelo sa pag-deploy
- Nabibigo ang mga tiyak na bersyon ng modelo

**Mga Solusyon:**
```bash
# Ilista ang mga magagamit na modelo ayon sa rehiyon
az cognitiveservices model list --location eastus

# I-update ang bersyon ng modelo sa bicep template
# Suriin ang mga kinakailangan sa kapasidad ng modelo
```

## Mga Halimbawa ng Template

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Mga Serbisyo**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Paglalarawan**: Ang pinaka-popular na sample ng Azure AI — isang production-ready na RAG chat app na nagpapahintulot sa iyo na magtanong tungkol sa iyong sariling mga dokumento. Gumagamit ng GPT-4.1-mini para sa chat, text-embedding-3-large para sa embeddings, at Azure AI Search para sa retrieval. Sinusuportahan ang multimodal na mga dokumento, input/output na pananalita, Microsoft Entra authentication, at Application Insights tracing.

**Mabilis na Pagsisimula**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Mga Serbisyo**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Paglalarawan**: Katumbas ng .NET/C# ng Python RAG chat sample. Binuo gamit ang ASP.NET Core Minimal API at Blazor WebAssembly frontend. Kasama ang voice chat, GPT-4o-mini vision support, at isang kasamang .NET MAUI Blazor Hybrid desktop/mobile client.

**Mabilis na Pagsisimula**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Mga Serbisyo**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Paglalarawan**: Bersyon sa Java ng RAG chat sample gamit ang Langchain4J para sa AI orchestration. Sinusuportahan ang microservice event-driven architecture, maraming estratehiya sa paghahanap (text, vector, hybrid), pag-upload ng dokumento gamit ang Azure Document Intelligence, at pag-deploy sa alinman sa Azure Container Apps o Azure Kubernetes Service.

**Mabilis na Pagsisimula**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Mga Serbisyo**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Paglalarawan**: End-to-end retail RAG copilot gamit ang Microsoft Foundry at Prompty. Isang Contoso Outdoor retailer chatbot na nag-uugnay ng mga sagot sa katalogo ng produkto at data ng order ng customer. Ipinapakita ang buong GenAIOps workflow — mag-prototype gamit ang Prompty, mag-evaluate gamit ang AI-assisted evaluators, at mag-deploy via AZD sa Container Apps.

**Mabilis na Pagsisimula**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Mga Serbisyo**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Paglalarawan**: Multi-agent sample na nagpapakita ng AI agent orchestration gamit ang Prompty. Gumagamit ng research agent (Bing Grounding sa Azure AI Agent Service), product agent (Azure AI Search), writer agent, at editor agent upang magkatuwang na makabuo ng maingat na sinuring mga artikulo. Kasama ang CI/CD na may evaluation sa GitHub Actions.

**Mabilis na Pagsisimula**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Mga Serbisyo**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB para sa NoSQL + LangChain.js

**Paglalarawan**: Ganap na serverless na RAG chatbot gamit ang LangChain.js na may Azure Functions para sa API at Azure Static Web Apps para sa hosting. Ginagamit ang Azure Cosmos DB bilang parehong vector store at chat history database. Sinusuportahan ang lokal na pag-develop gamit ang Ollama para sa zero-cost na testing.

**Mabilis na Pagsisimula**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Mga Serbisyo**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Paglalarawan**: Enterprise-grade RAG solution accelerator na may admin portal para sa pag-upload/pamamahala ng dokumento, maraming opsyon ng orchestrator (Semantic Kernel, LangChain, Prompt Flow), speech-to-text, Microsoft Teams integration, at pagpipilian ng PostgreSQL o Cosmos DB bilang backend. Dinisenyo bilang naiaangkop na panimulang punto para sa production RAG scenarios.

**Mabilis na Pagsisimula**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Mga Serbisyo**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Paglalarawan**: Reference application para sa multi-agent AI orchestration gamit ang tatlong framework (LangChain.js, LlamaIndex.TS, at Microsoft Agent Framework). Tampok ang MCP (Model Context Protocol) servers sa apat na wika na naka-deploy bilang serverless Azure Container Apps na may OpenTelemetry monitoring.

**Mabilis na Pagsisimula**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Mga Serbisyo**: Azure AI Services + Azure OpenAI

**Paglalarawan**: Minimal na Bicep template na nag-de-deploy ng Azure AI services na may naka-configure na machine learning models. Isang magaan na panimulang punto kapag kailangan mo lamang ng na-provision na Azure AI infrastructure nang walang buong application stack.

**Mabilis na Pagsisimula**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Mag-browse ng higit pang mga template**: Bisitahin ang [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) para sa 80+ AI-specific AZD templates sa iba't ibang wika at senaryo.

## Susunod na Mga Hakbang

1. **Subukan ang Mga Halimbawa**: Magsimula sa isang pre-built template na tumutugma sa iyong use case
2. **I-customize para sa Iyong Pangangailangan**: Baguhin ang imprastruktura at application code
3. **Magdagdag ng Pagsubaybay**: Magpatupad ng komprehensibong obserbabilidad
4. **I-optimize ang Mga Gastos**: I-tune ang mga konfigurasyon ayon sa iyong badyet
5. **Siguraduhin ang Iyong Pag-deploy**: Magpatupad ng mga enterprise security pattern
6. **I-scale sa Produksyon**: Magdagdag ng multi-region at high-availability na mga tampok

## 🎯 Mga Hands-On na Ehersisyo

### Ehersisyo 1: Mag-deploy ng Microsoft Foundry Models Chat App (30 minuto)
**Layunin**: Mag-deploy at subukan ang isang production-ready na AI chat application

```bash
# I-inisyalisa ang template
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

**Kriteriya ng Tagumpay:**
- [ ] Matatapos ang pag-deploy nang walang mga error sa quota
- [ ] Maaaring ma-access ang chat interface sa browser
- [ ] Maaaring magtanong at makatanggap ng mga AI-powered na tugon
- [ ] Nagpapakita ang Application Insights ng telemetry data
- [ ] Matagumpay na na-clean up ang mga resources

**Tinatayang Gastos**: $5-10 para sa 30 minutong testing

### Ehersisyo 2: I-configure ang Multi-Model Deployment (45 minuto)
**Layunin**: Mag-deploy ng maraming AI modelo na may iba't ibang konfigurasyon

```bash
# Lumikha ng pasadyang Bicep na konfigurasyon
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

# I-deploy at suriin
azd provision
azd show
```

**Kriteriya ng Tagumpay:**
- [ ] Maraming modelo na na-deploy nang matagumpay
- [ ] Iba't ibang settings ng kapasidad ang naipatupad
- [ ] Maaaring ma-access ang mga modelo via API
- [ ] Maaaring tawagin ang parehong mga modelo mula sa application

### Ehersisyo 3: Magpatupad ng Pagsubaybay ng Gastos (20 minuto)
**Layunin**: I-set up ang budget alerts at tracking ng gastos

```bash
# Magdagdag ng alerto ng badyet sa Bicep
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

# I-deploy ang alerto ng badyet
azd provision

# Suriin ang kasalukuyang mga gastos
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kriteriya ng Tagumpay:**
- [ ] Nalikha ang budget alert sa Azure
- [ ] Na-configure ang mga email notification
- [ ] Maaaring makita ang cost data sa Azure Portal
- [ ] Na-set nang angkop ang mga threshold ng budget

## 💡 Madalas Itanong

<details>
<summary><strong>Paano ko mababawasan ang gastos ng Microsoft Foundry Models habang nasa development?</strong></summary>

1. **Gumamit ng Free Tier**: Nag-aalok ang Microsoft Foundry Models ng 50,000 tokens/buwan nang libre
2. **Bawasan ang Kapasidad**: Itakda ang kapasidad sa 10 TPM sa halip na 30+ para sa dev
3. **Gamitin ang azd down**: I-deallocate ang mga resource kapag hindi aktibong nagde-develop
4. **I-cache ang mga Tugon**: Magpatupad ng Redis cache para sa paulit-ulit na mga query
5. **Gumamit ng Prompt Engineering**: Bawasan ang paggamit ng token sa pamamagitan ng epektibong mga prompt

</details>
```bash
# Konfigurasyon ng pag-unlad
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Ano ang pagkakaiba ng Microsoft Foundry Models at OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Seguridad at pagsunod para sa enterprise
- Integrasyon ng pribadong network
- Mga garantiya ng SLA
- Pagpapatunay gamit ang Managed Identity
- Mas mataas na quota na magagamit

**OpenAI API**:
- Mas mabilis na pag-access sa mga bagong modelo
- Mas simple ang pagsasaayos
- Mas mababang hadlang sa pagpasok
- Pampublikong internet lamang

Para sa mga production na app, **inirerekomenda ang Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Paano ko hinaharap ang mga error na lumampas sa quota ng Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Paano ko pinoprotektahan ang mga endpoint ng AI model?</strong></summary>

**Pinakamahusay na Gawi**:
1. Gumamit ng Managed Identity (walang API keys)
2. Paganahin ang Private Endpoints
3. I-configure ang network security groups
4. Magpatupad ng rate limiting
5. Gamitin ang Azure Key Vault para sa mga secret

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

**Pag-navigate ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD For Beginners](../../README.md)
- **📖 Kasalukuyang Kabanata**: Chapter 2 - AI-First Development
- **⬅️ Nakaraang Kabanata**: [Kabanata 1: Ang Iyong Unang Proyekto](../chapter-01-foundation/first-project.md)
- **➡️ Susunod**: [Pag-deploy ng Modelo ng AI](ai-model-deployment.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Konfigurasyon](../chapter-03-configuration/configuration.md)

**Kailangan ng Tulong?** Sumali sa aming mga talakayan sa komunidad o magbukas ng isyu sa repositoryo. Narito ang Azure AI + AZD na komunidad upang tulungan kang magtagumpay!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->