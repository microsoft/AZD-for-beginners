# Integrasyon ng Microsoft Foundry sa AZD

**Pag-navigate ng Kabanata:**
- **📚 Course Home**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Current Chapter**: Kabanata 2 - Pag-unlad na Pinangungunahan ng AI
- **⬅️ Previous Chapter**: [Kabanata 1: Ang Iyong Unang Proyekto](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [Pag-deploy ng Modelong AI](ai-model-deployment.md)
- **🚀 Next Chapter**: [Kabanata 3: Konfigurasyon](../chapter-03-configuration/configuration.md)

## Pangkalahatang-ideya

Ang gabay na ito ay nagpapakita kung paano i-integrate ang mga serbisyo ng Microsoft Foundry sa Azure Developer CLI (AZD) para sa mas pinadaling pag-deploy ng mga aplikasyon ng AI. Ang Microsoft Foundry ay nagbibigay ng komprehensibong plataporma para sa pagbuo, pag-deploy, at pamamahala ng mga aplikasyon ng AI, habang pinapadali ng AZD ang imprastraktura at proseso ng pag-deploy.

## Ano ang Microsoft Foundry?

Ang Microsoft Foundry ay pinag-isang plataporma ng Microsoft para sa pag-develop ng AI na kinabibilangan ng:

- **Model Catalog**: Pag-access sa mga makabagong modelo ng AI
- **Prompt Flow**: Visual designer para sa mga AI workflow
- **Microsoft Foundry Portal**: Isang integrated na development environment para sa mga aplikasyon ng AI
- **Deployment Options**: Iba’t ibang opsyon sa pagho-host at pag-scale
- **Safety and Security**: May nakapaloob na mga responsable at ligtas na tampok ng AI

## AZD + Microsoft Foundry: Mas Magandang Magkasama

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manwal na pag-deploy sa portal | Automatiko, maulit-ulit na pag-deploy |
| **Infrastructure** | Provisioning sa pamamagitan ng pag-click | Infrastructure as Code (Bicep) |
| **Environment Management** | Pokus sa isang kapaligiran | Maramihang kapaligiran (dev/staging/prod) |
| **CI/CD Integration** | Limitado | Suporta sa katutubong GitHub Actions |
| **Cost Management** | Pangunahing monitoring | Pag-optimize ng gastos na batay sa kapaligiran |

## Mga Kinakailangan

- Azure subscription na may angkop na mga permiso
- Azure Developer CLI na naka-install
- Access sa Microsoft Foundry Models services
- Pangunahing pamilyaridad sa Microsoft Foundry

## Pangunahing Mga Pattern ng Integrasyon

### Pattern 1: Integrasyon ng Microsoft Foundry Models

**Kaso ng Paggamit**: Mag-deploy ng mga chat application gamit ang mga modelo ng Microsoft Foundry Models

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

**Kaso ng Paggamit**: Mag-deploy ng retrieval-augmented generation (RAG) na mga application

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

### Pagsasaayos ng Mga Variable ng Kapaligiran

**Konfigurasyon para sa Produksyon:**
```bash
# Pangunahing mga serbisyo ng AI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Mga konfigurasyon ng modelo
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Mga setting ng pagganap
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Konfigurasyon para sa Pag-unlad:**
```bash
# Mga setting na na-optimize para sa gastos para sa pag-unlad
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

## Mga Daloy ng Pag-deploy

### Mga Extension ng AZD para sa Foundry

Nagbibigay ang AZD ng mga extension na nagdaragdag ng AI-specific na kakayahan para sa pagtatrabaho sa mga serbisyo ng Microsoft Foundry:

```bash
# I-install ang ekstensyon ng Foundry agents
azd extension install azure.ai.agents

# I-install ang ekstensyon para sa fine-tuning
azd extension install azure.ai.finetune

# I-install ang ekstensyon para sa mga pasadyang modelo
azd extension install azure.ai.models

# Ilista ang mga naka-install na ekstensyon
azd extension list
```

### Pag-deploy na Una ang Agent gamit ang `azd ai`

Kung mayroon kang agent manifest, gamitin ang `azd ai agent init` upang i-scaffold ang proyekto na naka-wire sa Foundry Agent Service:

```bash
# I-initialize mula sa manifest ng ahente
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# I-deploy sa Azure
azd up
```

Tingnan ang [Mga Utos ng AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para sa buong sanggunian ng mga utos at mga flag.

### Pag-deploy ng Isang Utos

```bash
# I-deploy ang lahat gamit ang isang utos
azd up

# O i-deploy nang paunti-unti
azd provision  # Imprastruktura lamang
azd deploy     # Aplikasyon lamang
```

### Pag-deploy na Tukoy sa Kapaligiran

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

## Pagmo-monitor at Obserbabilidad

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

### Pagmo-monitor ng Gastos

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

## 🔐 Pinakamahusay na Mga Praktis sa Seguridad

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

## Pagsasaayos ng Karaniwang mga Isyu

### Isyu 1: Lumagpas ang Quota ng OpenAI

**Mga Sintomas:**
- Nabibigo ang pag-deploy dahil sa mga error sa quota
- 429 errors sa mga log ng aplikasyon

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

### Isyu 2: Mga Pagkabigo sa Autentikasyon

**Mga Sintomas:**
- 401/403 errors kapag tumatawag sa mga AI service
- Mga mensaheng "Access denied"

**Mga Solusyon:**
```bash
# Suriin ang mga pagtatalaga ng papel
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Suriin ang konfigurasyon ng managed identity
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Patunayan ang pag-access sa Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Isyu 3: Mga Isyu sa Pag-deploy ng Modelo

**Mga Sintomas:**
- Hindi available ang mga modelo sa deployment
- Ang ilang partikular na bersyon ng modelo ay nabibigo

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

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: Ang pinakasikat na Azure AI sample — isang production-ready na RAG chat app na nagpapahintulot sa iyong magtanong tungkol sa iyong sariling mga dokumento. Gumagamit ng GPT-4.1-mini para sa chat, text-embedding-ada-002 para sa embeddings, at Azure AI Search para sa retrieval. Sumusuporta sa multimodal na mga dokumento, speech input/output, Microsoft Entra authentication, at Application Insights tracing.

**Mabilis na Pagsisimula**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: Ang katumbas na .NET/C# ng Python RAG chat sample. Binuo gamit ang ASP.NET Core Minimal API at Blazor WebAssembly frontend. Kasama ang voice chat, GPT-4o-mini vision support, at isang kasamang .NET MAUI Blazor Hybrid desktop/mobile client.

**Mabilis na Pagsisimula**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: Java na bersyon ng RAG chat sample gamit ang Langchain4J para sa AI orchestration. Sumusuporta sa microservice event-driven architecture, maramihang search strategies (text, vector, hybrid), pag-upload ng dokumento gamit ang Azure Document Intelligence, at pag-deploy sa alinman sa Azure Container Apps o Azure Kubernetes Service.

**Mabilis na Pagsisimula**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: End-to-end retail RAG copilot gamit ang Azure AI Foundry at Prompty. Isang Contoso Outdoor retailer chatbot na nagbabase ng mga tugon sa katalogo ng produkto at data ng order ng customer. Ipinapakita ang buong GenAIOps workflow — prototype gamit ang Prompty, i-evaluate gamit ang AI-assisted evaluators, at i-deploy via AZD sa Container Apps.

**Mabilis na Pagsisimula**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: Multi-agent sample na nagpapakita ng AI agent orchestration gamit ang Prompty. Gumagamit ng research agent (Bing Grounding sa Azure AI Agent Service), isang product agent (Azure AI Search), isang writer agent, at isang editor agent upang magkatuwang na makagawa ng mahusay na na-research na mga artikulo. Kasama ang CI/CD na may evaluation sa GitHub Actions.

**Mabilis na Pagsisimula**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: Ganap na serverless na RAG chatbot gamit ang LangChain.js na may Azure Functions para sa API at Azure Static Web Apps para sa hosting. Gumagamit ng Azure Cosmos DB bilang pareho vector store at chat history database. Sumusuporta sa lokal na pag-develop gamit ang Ollama para sa zero-cost testing.

**Mabilis na Pagsisimula**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description**: Enterprise-grade RAG solution accelerator na may admin portal para sa pag-upload/pamamahala ng dokumento, maramihang opsyon ng orchestrator (Semantic Kernel, LangChain, Prompt Flow), speech-to-text, integrasyon sa Microsoft Teams, at pagpipilian ng PostgreSQL o Cosmos DB na backend. Dinisenyo bilang isang nako-customize na panimulang punto para sa production RAG scenarios.

**Mabilis na Pagsisimula**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: Reference application para sa multi-agent AI orchestration gamit ang tatlong framework (LangChain.js, LlamaIndex.TS, at Microsoft Agent Framework). Tampok ang MCP (Model Context Protocol) servers sa apat na wika na dinedeploy bilang serverless Azure Container Apps na may OpenTelemetry monitoring.

**Mabilis na Pagsisimula**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Description**: Minimal na Bicep template na nagde-deploy ng Azure AI services na may naka-configure na machine learning models. Isang magaan na panimulang punto kapag kailangan mo lamang ng Azure AI imprastruktura nang hindi kasama ang buong application stack.

**Mabilis na Pagsisimula**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Mag-browse ng higit pang mga template**: Bisitahin ang [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) para sa 80+ mga template ng AZD na nakatuon sa AI sa iba't ibang wika at senaryo.

## Mga Susunod na Hakbang

1. **Subukan ang mga Halimbawa**: Magsimula sa isang pre-built na template na tumutugma sa iyong kaso ng paggamit
2. **I-customize para sa Iyong Pangangailangan**: Baguhin ang imprastruktura at application code
3. **Magdagdag ng Monitoring**: Ipatupad ang komprehensibong obserbabilidad
4. **I-optimize ang Gastos**: I-fine-tune ang mga konfigurasyon para sa iyong badyet
5. **I-secure ang Iyong Pag-deploy**: Ipatupad ang enterprise security patterns
6. **I-scale sa Produksyon**: Magdagdag ng multi-region at high-availability na mga tampok

## 🎯 Mga Praktikal na Ehersisyo

### Ehersisyo 1: I-deploy ang Microsoft Foundry Models Chat App (30 minuto)
**Layunin**: I-deploy at subukan ang isang production-ready na AI chat application

```bash
# I-initialize ang template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Itakda ang mga environment variable
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
- [ ] Nakumpleto ang pag-deploy nang walang mga error sa quota
- [ ] Maaaring ma-access ang chat interface sa browser
- [ ] Maaaring magtanong at makatanggap ng mga tugon na pinapagana ng AI
- [ ] Ipinapakita ng Application Insights ang telemetry data
- [ ] Matagumpay na na-clean up ang mga resources

**Tinatayang Gastos**: $5-10 para sa 30 minuto ng pagsubok

### Ehersisyo 2: I-configure ang Multi-Model Deployment (45 minuto)
**Layunin**: Mag-deploy ng maramihang AI model na may iba't ibang konfigurasyon

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

# I-deploy at suriin
azd provision
azd show
```

**Kriteriya ng Tagumpay:**
- [ ] Maramihang modelo ang matagumpay na na-deploy
- [ ] Iba't ibang mga setting ng kapasidad ang naipatupad
- [ ] Ang mga modelo ay naa-access via API
- [ ] Maaaring tawagan ang parehong mga modelo mula sa aplikasyon

### Ehersisyo 3: Magpatupad ng Pagmo-monitor ng Gastos (20 minuto)
**Layunin**: Mag-set up ng mga budget alert at pag-track ng gastos

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

**Kriteriya ng Tagumpay:**
- [ ] Nalikha ang budget alert sa Azure
- [ ] Nakakabit ang mga notification sa email
- [ ] Maaaring tingnan ang data ng gastos sa Azure Portal
- [ ] Ang mga threshold ng budget ay naitakda nang tama

## 💡 Mga Madalas Itanong

<details>
<summary><strong>Paano ko mababawasan ang gastos ng Microsoft Foundry Models habang nagde-develop?</strong></summary>

1. **Gamitin ang Libreng Tier**: Nag-aalok ang Microsoft Foundry Models ng 50,000 tokens/buwan nang libre
2. **Bawasan ang Kapasidad**: Itakda ang kapasidad sa 10 TPM sa halip na 30+ para sa dev
3. **Gamitin ang azd down**: I-deallocate ang mga resources kapag hindi aktibong nagde-develop
4. **I-cache ang Mga Tugon**: Magpatupad ng Redis cache para sa mga paulit-ulit na query
5. **Gamitin ang Prompt Engineering**: Bawasan ang paggamit ng token sa pamamagitan ng epektibong prompts

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
- Integrasyon sa private network
- May mga SLA na garantiya
- Managed identity authentication
- Mas mataas na mga quota available

**OpenAI API**:
- Mas mabilis na access sa mga bagong modelo
- Mas simple ang setup
- Mas mababang hadlang sa pagsisimula
- Pampublikong internet lamang

Para sa mga production na app, **inirerekomenda ang Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Paano ko haharapin ang mga error na 'quota exceeded' ng Microsoft Foundry Models?</strong></summary>

```bash
# Suriin ang kasalukuyang kuota
az cognitiveservices usage list --location eastus2

# Subukan ang ibang rehiyon
azd env set AZURE_LOCATION westus2
azd up

# Pansamantalang bawasan ang kapasidad
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Humiling ng pagtaas ng kuota
# Pumunta sa Azure Portal > Mga Kuota > Humiling ng pagtaas
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

Tingnan ang template na [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Paano ko paprotektahan ang mga endpoint ng AI model?</strong></summary>

**Mga Pinakamahusay na Kasanayan**:
1. Gamitin ang Managed Identity (walang API keys)
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
- **AZD GitHub**: [Mga isyu at diskusyon](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Opisyal na dokumentasyon](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - I-install ang Azure + Foundry agent skills sa iyong editor gamit ang `npx skills add microsoft/github-copilot-for-azure`

---

**Pag-navigate ng Kabanata:**
- **📚 Pangunahing Pahina ng Kurso**: [AZD For Beginners](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraang Kabanata**: [Kabanata 1: Ang Iyong Unang Proyekto](../chapter-01-foundation/first-project.md)
- **➡️ Susunod**: [Pag-deploy ng AI Model](ai-model-deployment.md)
- **🚀 Sunod na Kabanata**: [Kabanata 3: Konfigurasyon](../chapter-03-configuration/configuration.md)

**Kailangan ng Tulong?** Sumali sa aming mga talakayan sa komunidad o magbukas ng isyu sa repositoryo. Ang komunidad ng Azure AI + AZD ay nandito para tulungan kang magtagumpay!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang serbisyong pagsasalin ng AI na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi tumpak na bahagi. Ang orihinal na dokumento sa katutubong wika nito ang dapat ituring na opisyal na sanggunian. Para sa mga kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagutan sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->