# Integrasyon ng Microsoft Foundry sa AZD

**Pag-navigate ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraang Kabanata**: [Kabanata 1: Ang Iyong Unang Proyekto](../chapter-01-foundation/first-project.md)
- **➡️ Susunod**: [AI Agents](agents.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Configuration](../chapter-03-configuration/configuration.md)

## Pangkalahatang Ideya

Ipinapakita ng gabay na ito kung paano i-integrate ang mga serbisyo ng Microsoft Foundry sa Azure Developer CLI (AZD) para sa mas pinadaling deployment ng mga AI application. Nagbibigay ang Microsoft Foundry ng isang komprehensibong plataporma para sa paggawa, deployment, at pamamahala ng mga AI application, habang pinapasimple ng AZD ang proseso ng imprastruktura at deployment.

## Ano ang Microsoft Foundry?

Ang Microsoft Foundry ay ang pinag-isang plataporma ng Microsoft para sa pagbuo ng AI na kinabibilangan ng:

- **Model Catalog**: Akses sa mga makabagong AI model
- **Prompt Flow**: Visual na taga-disenyo para sa mga AI workflow
- **Microsoft Foundry Portal**: Pinagsamang development environment para sa mga AI application
- **Deployment Options**: Maraming opsyon para sa pag-host at pag-scale
- **Safety and Security**: Naka-built-in na mga tampok para sa responsableng AI

## AZD + Microsoft Foundry: Mas Maganda Kapag Magkasama

| Tampok | Microsoft Foundry | Benepisyo ng Integrasyon sa AZD |
|---------|-----------------|------------------------|
| **Deployment ng Modelo** | Manual na deployment sa portal | Automated, paulit-ulit na deployment |
| **Imprastruktura** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Pamamahala ng Kapaligiran** | Pokus sa isang kapaligiran | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limitado | Katutubong suporta sa GitHub Actions |
| **Pamamahala ng Gastos** | Pangunahing monitoring | Pag-optimize ng gastos ayon sa kapaligiran |

## Mga Kinakailangan

- Azure subscription na may angkop na mga pahintulot
- Nakainstall ang Azure Developer CLI
- Akses sa mga serbisyo ng Microsoft Foundry Models
- Pangunahing kaalaman tungkol sa Microsoft Foundry

> **Pagrebisa ng release (2026-11-04):** Sinuri ang gabay sa AI CLI laban sa `azd` `1.37.2`, mga ahente `1.0.0-beta.23`, at dokumentasyon/source ng mga ebalwasyon `1.0.0-beta.2`. Gamitin ang `azd >= 1.37.0` para sa pinagsamang workflow. Tingnan ang [mga pagbabago at pag-aayos sa release](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); ang pagsusuring ito ay hindi nagsisiguro ng bawat template o SDK na halimbawa laban sa isang aktwal na deployment.

## Pangunahing Mga Pattern ng Integrasyon

**Saklaw ng mga halimbawa:** Ang Bicep sa ibaba ay naglalaman ng mga ilustratibong fragment ng resource, hindi isang kumpletong template na pwedeng i-deploy. Ang naglalaman na template ay kailangang magtakda ng mga pangalan, `location`, mga tinukoy na resource, mga identidad, output, at pagho-host ng application. Gumamit ng naka-link na halimbawa para sa isang maaring patakbuhin na panimulang punto. Nangangailangan ng hiwalay na Azure CLI authentication ang mga halimbawa ng Bash mula sa `azd auth login`.

### Pattern 1: Integrasyon ng Microsoft Foundry Models

**Case ng Paggamit**: Mag-deploy ng mga chat application gamit ang mga Azure OpenAI model sa Microsoft Foundry

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

Kailangan ng caller ang naka-attach na managed identity at `Cognitive Services OpenAI User` sa account scope; ang pag-disable ng keys ay hindi nagbibigay ng access. Siguraduhing available ang region/model/SKU at quota bago mag-deploy.

### Pattern 2: AI Search + RAG Integration

**Case ng Paggamit**: Mag-deploy ng retrieval-augmented generation (RAG) na mga application

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

Walang `Microsoft.Search/searchServices/dataConnections` ARM resource para sa integrasyong ito. I-configure ang isang Search index, data source, indexer/skillset o vectorizer sa pamamagitan ng suportadong Search data-plane APIs. Kung tatawagin ng Search ang isang embedding model, i-enable ang managed identity nito, bigyan ng kaukulang model role, at i-configure ang embedding skill/vectorizer nito. Tingnan ang [pinagsamang vectorization](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Pattern 3: Integrasyon ng Document Intelligence

**Case ng Paggamit**: Mga workflow ng pagproseso at pagsusuri ng dokumento

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

## 🔧 Mga Pattern sa Pag-configure

### Pagsasaayos ng Environment Variables

Maliban sa mga dokumentadong AZD settings tulad ng `AZURE_LOCATION`, ito ay **custom-template input names**. Wala silang epekto maliban kung ginagamit ng template/application sa pamamagitan ng parameter at mga host-environment mapping. Para sa `azure-search-openai-demo`, gamitin ang aktwal nitong mga pangalan tulad ng `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` at `AZURE_SEARCH_SERVICE_SKU`. Ang kapasidad ng modelo ay hindi account SKU.

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

### Ligtas na Pag-configure gamit ang Key Vault

Mas gusto ang Entra ID na naka-disable ang lokal na key authentication. Ang sumusunod ay isang **legacy key-authentication na alternatibo** para sa mga application na nangangailangan ng keys: nangangailangan ito ng account na may key authentication enabled, ang identity ng application ay naka-attach sa host nito, at gumagana ang access/networking ng Key Vault. Huwag pagsamahin ang pagkuha ng key sa `disableLocalAuth: true` at asahan na gumana ang mga tawag na nakabase sa key.

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

## Mga Workflow sa Deployment

### Mga Extension ng AZD para sa Foundry

Nagbibigay ang AZD ng mga extension na nagdaragdag ng mga espesipikong kakayahan sa AI para sa pakikipagtrabaho sa mga serbisyo ng Microsoft Foundry:

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

Ang mga extension sa AI ay mabilis pa rin ang pag-usad habang nasa preview. Kung may utos na kumikilos nang iba sa ipinapakita dito, i-upgrade ang kaukulang extension bago mag-troubleshoot ng mismong proyekto.

### Agent-First Deployment gamit ang `azd ai`

Gumamit nang interaktibo ng `azd ai agent init`, o gamitin ang kasalukuyang `azure.yaml` na template ng proyekto ng agent na nakakabit sa Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` ay pumapalit sa deprecated na `--manifest`/`-m` na baybay; kailangan pa ring gawin ang migration ng legacy manifest at nested na configuration ng agent. Ebalwahin ang mga ahente gamit ang `azd ai eval` mula sa `azure.ai.evaluations`, hindi sa tinanggal na legacy workflow. Tingnan ang [migration ng ebalwasyon](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) para sa setup, pagpapatakbo, at resulta.

Tingnan ang [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para sa buong reference ng command at mga flags.

### Deployment ng Isang Utos Lang

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Mga Deployment na Espesipiko sa Kapaligiran

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

## Monitoring at Observability

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
```

Nagpo-provision ito ng isang Insights resource, hindi telemetry instrumentation. Kapag nag-emit ang iyong app ng outbound model-call spans, patakbuhin ang ilustratibong query na ito sa Application Insights Logs (i-adapt ang filter sa iyong aktwal na mga pangalan ng span):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Pagsubaybay sa Gastos

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

Gumamit ng totoong recipient at siguraduhing may pahintulot sa billing scope. Ang budget ay nagpapadala ng mga alerto; hindi ito cap sa paggastos.

## 🔐 Pinakamahuhusay na Praktis sa Seguridad

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

Nangangailangan din ang fragment ng endpoint na ito ng private DNS zone/group, mga link sa VNet, konektividad ng application sa VNet, at isang tahasang patakaran para sa public access. Hindi pinapatigil ng paglikha ng isang pribadong endpoint lamang ang public access.

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

Ang Azure Cache para sa Redis Basic/Standard/Premium ay nasa [daan ng pagretiro](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); gamitin ang Azure Managed Redis para sa mga bagong deployment at sundin ang kasalukuyang gabay sa template/authentication nito. I-scope ang cached na sagot ng AI ayon sa authorization, modelo/instruction, at bersyon ng data, na may expiry; huwag kailanman ibahagi ang mga private na sagot gamit lang ang query text.

### Pag-configure ng Auto-scaling

**Bahagyang resource:** pagsamahin ang mga scale/ingress setting na ito sa isang kumpletong Container App na may managed environment, container image, at resource limits. Ang mas maraming replicas ay hindi nagpapataas ng quota ng modelo.

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

## Pag-troubleshoot ng Karaniwang mga Isyu

### Isyu 1: Lumabis sa Quota ng OpenAI

**Sintomas:**
- Nabibigo ang deployment dahil sa mga error sa quota
- 429 na error sa mga application log

**Mga Solusyon:**
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

Ang kapasidad na variable sa itaas ay nalalapat lamang sa isang custom template na nakakabit upang gamitin ito. Para sa sample ng RAG, gamitin ang `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Huwag baguhin ang `AZURE_LOCATION` para ilipat ang mga umiiral na resources sa lugar; gumawa ng hiwalay na kapaligiran para sa isang bagong rehiyon at planuhin ang migration/pagsasaayos.

### Isyu 2: Mga Palya sa Authentication

**Sintomas:**
- 401/403 na error kapag tinatawag ang mga serbisyo ng AI
- Mga mensahe na "Access denied"

**Mga Solusyon:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Isyu 3: Mga Problema sa Deployment ng Modelo

**Sintomas:**
- Mga modelo ay hindi available sa deployment
- Mga partikular na bersyon ng modelo ay nabibigo

**Mga Solusyon:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Mga Halimbawa ng Template

Ito ay mga alternatibo, hindi magkakasunod na utos. Simulan ang bawat isa sa isang hiwalay na walang lamang direktoryo. Ang tahasang patutunguhang `.` ay pinananatili ang inisyal na lokasyon sa iyong kasalukuyang direktoryo; kung hindi, maaaring gumawa ang kasalukuyang AZD ng isang template-named na child directory nang hindi binabago ang working directory ng iyong shell.

### RAG Chat Application (Python)

**Repositoryo**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Mga Serbisyo**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Paglalarawan**: Isang RAG chat reference na application para sa mga tanong tungkol sa iyong mga dokumento, gamit ang Azure AI Search retrieval. Suriin ang suportadong mga modelo ng kasalukuyang sample, opsyonal na mga tampok, gabay sa gastos, at pagpapahigpit para sa produksyon bago gamitin; ang pag-deploy ng sample ay hindi nangangahulugang handa na ang application para sa produksyon.

**Mabilis na Simula**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG Chat Application (.NET)

**Repositoryo**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Mga Serbisyo**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Paglalarawan**: Katumbas ng .NET/C# ng Python na RAG chat sample. Ginawa gamit ang ASP.NET Core Minimal API at Blazor WebAssembly frontend. May voice chat, suporta sa GPT-4o-mini vision, at kasama ang .NET MAUI Blazor Hybrid desktop/mobile na kliyente.

**Mabilis na Simula**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG Chat Application (Java)

**Repositoryo**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Mga Serbisyo**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Paglalarawan**: Bersyon ng Java ng RAG chat sample gamit ang Langchain4J para sa orchestrasyon ng AI. Sinusuportahan ang microservice event-driven architecture, maraming estratehiya sa paghahanap (text, vector, hybrid), pag-upload ng dokumento gamit ang Azure Document Intelligence, at deployment sa alinman sa Azure Container Apps o Azure Kubernetes Service.

**Mabilis na Simula**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot gamit ang Microsoft Foundry

**Repositoryo**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Mga Serbisyo**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Paglalarawan**: End-to-end retail RAG copilot gamit ang Microsoft Foundry at Prompty. Isang chatbot ng Contoso Outdoor retailer na nakabase sa katalogo ng produkto at data ng order ng customer. Ipinapakita ang buong GenAIOps workflow — prototype gamit ang Prompty, ebalwasyon gamit ang AI-assisted evaluators, at deployment sa pamamagitan ng AZD sa Container Apps.

**Mabilis na Simula**:
```bash
azd init --template contoso-chat .
azd up
```

### Creative Writing Multi-Agent Application

**Repositoryo**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Mga Serbisyo**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Paglalarawan**: Multi-agent na halimbawa na nagpapakita ng orchestrasyon ng AI agent gamit ang Prompty. Gumagamit ng research agent (Bing Grounding sa Azure AI Agent Service), product agent (Azure AI Search), writer agent, at editor agent para magkasanib na makagawa ng mahusay na nasuring mga artikulo. May kasamang CI/CD gamit ang ebalwasyon sa GitHub Actions.

**Mabilis na Simula**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repositoryo**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Mga Serbisyo**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB para sa NoSQL + LangChain.js

**Paglalarawan**: Ganap na serverless na RAG chatbot gamit ang LangChain.js kasama ang Azure Functions para sa API at Azure Static Web Apps para sa pagho-host. Ginagamit ang Azure Cosmos DB bilang parehong vector store at chat history database. Sinusuportahan ang lokal na development gamit ang Ollama para sa zero-cost na testing.

**Mabilis na Simula**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat with Your Data Solution Accelerator

**Repositoryo**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Mga Serbisyo**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search na may Cosmos DB, o PostgreSQL na may pgvector

**Paglalarawan**: Isang document-grounded na chat accelerator na may mga citation. Ang kasalukuyang sample ay nagho-host ng React frontend, FastAPI backend, at Functions ingestion worker sa Container Apps; ang mga opsyon sa orchestrator ay Agent Framework at LangGraph. Pinipili ang database/retrieval options sa deployment. Isa itong panimulang punto, hindi isang turnkey production system; huwag ipagpalagay ang mga lumang variant ng App Service, Semantic Kernel, o Prompt Flow bilang kasalukuyang default.

**Mabilis na Simula**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repositoryo**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Mga Serbisyo**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Paglalarawan**: Reference application para sa multi-agent AI orchestration gamit ang tatlong frameworks (LangChain.js, LlamaIndex.TS, at Microsoft Agent Framework). Naglalaman ng MCP (Model Context Protocol) servers sa apat na wika na dineploy bilang serverless Azure Container Apps na may OpenTelemetry monitoring.

**Mabilis na Pagsisimula**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Mag-browse ng iba pang mga template**: Bisitahin ang [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) para sa kasalukuyang available na mga template sa iba't ibang wika at mga senaryo. Bawat naka-link na halimbawa ay isang external na repositoryo, hindi isang lokal na halimbawa mula sa kursong ito; suriin ang kasalukuyang mga kinakailangan at gabay sa produksyon bago magdeploy.

## Mga Susunod na Hakbang

1. **Subukan ang Mga Halimbawa**: Magsimula sa isang pre-built na template na tumutugma sa iyong kaso ng paggamit
2. **I-customize Ayon sa Iyong Pangangailangan**: Baguhin ang imprastruktura at code ng aplikasyon
3. **Magdagdag ng Monitoring**: Magpatupad ng komprehensibong observability
4. **I-optimize ang Gastos**: Ayusin ang mga konfigurasyon ayon sa iyong badyet
5. **Isigurado ang Iyong Deployment**: Magpatupad ng mga pattern ng seguridad para sa enterprise
6. **I-scale para sa Produksyon**: Magdagdag ng multi-region at high-availability na mga tampok

## 🎯 Mga Hands-On na Ehersisyo

### Ehersisyo 1: I-deploy ang Microsoft Foundry Models Chat App (30 minuto)
**Layunin**: I-deploy at subukan ang AI chat reference application

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

**Mga Pamantayan ng Tagumpay:**
- [ ] Nakumpleto ang deployment nang walang quota errors
- [ ] Maaaring ma-access ang chat interface sa browser
- [ ] Maaaring magtanong at makatanggap ng AI-powered na mga sagot
- [ ] Ipinapakita ng Application Insights ang telemetry data
- [ ] Matagumpay na na-clean up ang mga resources

**Gastos:** Suriin ang kasalukuyang gabay sa gastos ng sample at mga piniling SKU bago magdeploy. Magpapatuloy ang pagsingil hanggang sa matanggal ang mga resources; walang tiyak na 30-minutong pagtataya na naaangkop sa lahat ng konfigurasyon.

### Ehersisyo 2: I-configure ang Multi-Model Deployment (45 minuto)
**Layunin**: Mag-deploy ng maraming AI models na may iba't ibang mga konfigurasyon

**Panimulang punto:** Isang umiiral na Azure OpenAI account at isang AZD resource-group module na maaaring tumawag sa file na ito. Gumawa ng `infra/ai-models.bicep` gamit ang sumusunod na nilalaman gamit ang iyong editor. Hindi ito awtomatikong na-de-deploy kahit na ito ay nasa ilalim ng `infra/`.

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

Mula sa resource-group-scoped module na nagmamay-ari ng account, magdagdag ng tawag sa module (i-adapt ang pangalan ng simbolo sa iyong aktwal na account):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Huwag ideklara ang parehong deployments sa parehong mga module. Kung ang entry point ng AZD ay subscription-scoped, tawagin ito mula sa resource-group-scoped na child module nito at ayusin ang relative path. I-build ang naglalaman na module gamit ang `az bicep build --file <path-to-containing-module>`, pagkatapos:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Mga Pamantayan ng Tagumpay:**
- [ ] Maraming modelo ang matagumpay na na-deploy
- [ ] Iba't ibang mga setting ng kapasidad ang naipatupad
- [ ] Maaaring ma-access ang mga modelo sa pamamagitan ng API
- [ ] Maaaring tawagan ang parehong mga modelo mula sa aplikasyon

### Ehersisyo 3: Ipatupad ang Cost Monitoring (20 minuto)
**Layunin**: Mag-set up ng mga budget alerts at pagsubaybay sa gastos

**Panimulang punto:** Ang budget pattern sa itaas at isang resource-group-scoped infrastructure module. Idagdag ang resource na ito gamit ang iyong editor; ipasa ang `budgetStartDate` mula sa iyong parameter mapping (huwag doblehin ang parameter kung nakadeklara na). Palitan ang recipient at tiyaking mayroon kang budget write access.

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

Inaasahan: naglalaman ang tugon ng `amount: 200`, parehong mga threshold, at ang iyong recipient. Suriin ang Cost Management sa portal para sa aktwal na mga singil; ang data ng gastos ay delayed at hindi kailangang mag-fire ng alerto sa maikling ehersisyo.

**Mga Pamantayan ng Tagumpay:**
- [ ] Nalikhang budget alert sa Azure
- [ ] Nakapag-configure ng email notifications
- [ ] Maaaring makita ang cost data sa Azure Portal
- [ ] Naayos nang maayos ang mga budget threshold

## 💡 Madalas Itanong

<details>
<summary><strong>Paano ko mapabababa ang gastos sa Microsoft Foundry Models habang nagde-develop?</strong></summary>

1. **Suriin ang presyo**: Walang pangkalahatang libreng 50,000-token na buwanang allowance para sa Azure OpenAI models
2. **Itama ang laki ng kapasidad**: Ang kapasidad na `10` ay karaniwang kumakatawan sa 10,000 TPM para sa mga Standard text models na ito, hindi 10 TPM. Ang pagbabawas ng rate limit ay hindi nagpapababa ng presyo kada token
3. **Gamitin ang azd down**: Tanggalin ang mga disposable resources kapag hindi aktibong nagde-develop (hindi ito deallocation)
4. **I-cache ang mga Tugon**: Magpatupad ng Redis cache para sa mga paulit-ulit na tanong
5. **Gamitin ang Prompt Engineering**: Bawasan ang paggamit ng token sa pamamagitan ng epektibong mga prompt

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Ano ang pagkakaiba ng Microsoft Foundry Models at OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Seguridad at pagsunod para sa enterprise
- Integrasyon sa pribadong network
- Garantiyang SLA
- Managed identity authentication
- Mas mataas na mga quota ang available

**OpenAI API**: Isang hiwalay na provider/API na may sariling availability ng modelo, presyo, authentication, at mga opsyon sa konektividad para sa enterprise. Ihambing ang kasalukuyang mga alok sa halip na ipagpalagay na ito ay lamang para sa public internet o palaging nauunang maghatid ng mga modelo.

Pumili ayon sa mga pangangailangan ng iyong organisasyon; ang Azure-specific managed identity at private-link na mga halimbawa sa kursong ito ay naaangkop sa mga serbisyo na naka-host sa Azure, hindi sa bawat modelo/provider sa Foundry catalog.
</details>

<details>
<summary><strong>Paano ko haharapin ang mga error na quota exceeded sa Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Pwede ko bang gamitin ang sarili kong data sa Microsoft Foundry Models?</strong></summary>

Oo! Gamitin ang **Azure AI Search** para sa RAG (Retrieval Augmented Generation):

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

Tingnan ang [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) na template.
</details>

<details>
<summary><strong>Paano ko isisiguro ang mga AI model endpoints?</strong></summary>

**Pinakamahusay na Paraan**:
1. Gamitin ang Managed Identity (walang API keys)
2. Paganahin ang Private Endpoints
3. I-configure ang mga network security groups
4. Magpatupad ng rate limiting
5. Gamitin ang Azure Key Vault para sa mga sikreto

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
- **AZD GitHub**: [Mga Isyu at diskusyon](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Opisyal na dokumentasyon](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill sa skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - I-install ang Azure + Foundry agent skills sa iyong editor gamit ang `npx skills add microsoft/github-copilot-for-azure`

---

**Pag-navigate sa Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD For Beginners](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraang Kabanata**: [Kabanata 1: Ang Iyong Unang Proyekto](../chapter-01-foundation/first-project.md)
- **➡️ Susunod**: [AI Agents](agents.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Configuration](../chapter-03-configuration/configuration.md)

**Kailangan ng Tulong?** Sumali sa aming mga talakayan sa komunidad o magbukas ng isyu sa repositoryo. Narito ang Azure AI + AZD community upang tulungan kang magtagumpay!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->