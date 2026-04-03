# Uunganishaji wa Microsoft Foundry na AZD

**Urambazaji wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 2 - Maendeleo Yanayoweka AI Kwanza
- **⬅️ Sura Iliyopita**: [Sura 1: Mradi Wako wa Kwanza](../chapter-01-foundation/first-project.md)
- **➡️ Ifuatayo**: [Utekelezaji wa Mfano wa AI](ai-model-deployment.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

## Muhtasari

Mwongozo huu unaonyesha jinsi ya kuunganisha huduma za Microsoft Foundry na Azure Developer CLI (AZD) kwa ajili ya kupeleka programu za AI kwa urahisi. Microsoft Foundry inatoa jukwaa kamili la kujenga, kupeleka, na kusimamia programu za AI, wakati AZD inarahisisha mchakato wa miundombinu na utekelezaji.

## Microsoft Foundry ni Nini?

Microsoft Foundry ni jukwaa limeunganishwa la Microsoft kwa ajili ya maendeleo ya AI linalojumuisha:

- **Model Catalog**: Ufikiaji wa modeli za AI za kisasa
- **Prompt Flow**: Mbunifu wa kuona wa mtiririko wa kazi za AI
- **Microsoft Foundry Portal**: Mazingira ya maendeleo yaliyounganishwa kwa programu za AI
- **Deployment Options**: Chaguzi mbalimbali za kuendesha mwenyeji na kupanua
- **Safety and Security**: Vipengele vilivyojengwa vya AI yenye uwajibikaji

## AZD + Microsoft Foundry: Better Together

| Kipengele | Microsoft Foundry | Faida ya Uunganishaji wa AZD |
|---------|-----------------|------------------------|
| **Utekelezaji wa Modeli** | Utekelezaji kwa mkono kupitia portal | Utekelezaji otomatiki, unaorudiwa |
| **Miundombinu** | Utayarishaji kwa kupitia bonyeza | Miundombinu kama Msimbo (Bicep) |
| **Usimamizi wa Mazingira** | Kujikita katika mazingira moja | Mazingira mengi (dev/staging/prod) |
| **Uunganishaji wa CI/CD** | Mdogo | Msaada asili kwa GitHub Actions |
| **Usimamizi wa Gharama** | Ufuatiliaji wa msingi | Uboreshaji wa gharama kwa mazingira maalum |

## Mahitaji ya Awali

- Usajili wa Azure (subscription) wenye ruhusa zinazofaa
- Azure Developer CLI imewekwa
- Ufikiaji wa huduma za Microsoft Foundry Models
- Ujuzi wa msingi wa Microsoft Foundry

> **Mstari wa Msingi wa AZD wa Sasa:** Mfano hizi zilichunguzwa dhidi ya `azd` `1.23.12`. Kwa mtiririko wa kazi wa wakala wa AI, tumia toleo la awali la upanuzi na angalia toleo uliyoweka kabla ya kuanza.

## Mifumo Msingi ya Uunganishaji

### Mfano 1: Uunganishaji wa Microsoft Foundry Models

**Tukio la Matumizi**: Telekeza programu za gumzo kwa kutumia modeli za Microsoft Foundry Models

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

**Miundombinu (main.bicep):**
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

### Mfano 2: Uunganishaji wa AI Search + RAG

**Tukio la Matumizi**: Telekeza programu za uzalishaji ulioboreshwa kwa urejeshaji (RAG)

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

### Mfano 3: Uunganishaji wa Document Intelligence

**Tukio la Matumizi**: Mtiririko wa kazi wa usindikaji na uchambuzi wa nyaraka

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

## 🔧 Mifumo ya Usanidi

### Usanidi wa Vigezo vya Mazingira

**Usanidi wa Uzalishaji:**
```bash
# Huduma kuu za AI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Usanidi wa modeli
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Mipangilio ya utendaji
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Usanidi wa Maendeleo:**
```bash
# Mipangilio iliyoboreshwa kwa gharama kwa ajili ya maendeleo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Ngazi ya bure
```

### Usanidi Salama kwa Key Vault

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

## Mtiririko ya Utekelezaji

### Upanuzi wa AZD kwa Foundry

AZD huleta upanuzi unaoongeza uwezo maalum wa AI kwa kufanya kazi na huduma za Microsoft Foundry:

```bash
# Sakinisha upanuzi wa mawakala wa Foundry
azd extension install azure.ai.agents

# Sakinisha upanuzi wa urekebishaji wa kina
azd extension install azure.ai.finetune

# Sakinisha upanuzi wa mifano maalum
azd extension install azure.ai.models

# Orodhesha upanuzi zilizowekwa
azd extension list --installed

# Angalia toleo la sasa la upanuzi wa mawakala uliosakinishwa
azd extension show azure.ai.agents
```

Upanuzi za AI bado zinabadilika kwa haraka katika awamu ya mapitio (preview). Ikiwa amri inafanya kazi tofauti na ilivyoonyeshwa hapa, sasisha upanuzi husika kabla ya kutatua matatizo ya mradi mwenyewe.

### Utekelezaji unaoweka Wakala Kwanza kwa `azd ai`

Ikiwa una manifest ya wakala, tumia `azd ai agent init` kuunda mradi uliounganishwa na Foundry Agent Service:

```bash
# Anzisha kutoka kwenye manifesti ya wakala
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Sambaza kwenye Azure
azd up
```

Matoleo ya hivi karibuni ya mapitio ya `azure.ai.agents` pia yameongeza msaada wa uanzishaji kwa kutumia templates kwa `azd ai agent init`. Ikiwa unafuata sampuli mpya za wakala, angalia msaada wa upanuzi kwa bendera kamili zinazopatikana katika toleo uliyoweka.

Angalia [Amri za AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) kwa rejea kamili ya amri na bendera.

### Utekelezaji kwa Amri Moja

```bash
# Weka kila kitu kwa amri moja
azd up

# Au weka kwa hatua
azd provision  # Miundombinu tu
azd deploy     # Programu tu

# Kwa kupeleka programu za AI zinazoendesha kwa muda mrefu katika azd 1.23.11+
azd deploy --timeout 1800
```

### Utekelezaji Maalum kwa Mazingira

```bash
# Mazingira ya maendeleo
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Mazingira ya uzalishaji
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Ufuatiliaji na Observability

### Uunganishaji wa Application Insights

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

### Ufuatiliaji wa Gharama

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

## 🔐 Misingi Bora ya Usalama

### Usanidi wa Utambulisho Ulioendeshwa (Managed Identity)

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

### Usalama wa Mtandao

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

## Uboreshaji wa Utendaji

### Mikakati ya Caching

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

### Usanidi wa Upanuaji Kiotomatiki

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

## Kutatua Matatizo ya Kawaida

### Tatizo 1: Kiwango cha OpenAI Kimezidiwa

**Dalili:**
- Utekelezaji unashindwa kwa makosa ya quota
- Makosa ya 429 kwenye magogo ya programu

**Suluhisho:**
```bash
# Angalia matumizi ya kikomo cha sasa
az cognitiveservices usage list --location eastus

# Jaribu eneo tofauti
azd env set AZURE_LOCATION westus2
azd up

# Punguza uwezo kwa muda mfupi
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Tatizo 2: Kushindwa kwa Uthibitishaji

**Dalili:**
- Makosa 401/403 wakati wa kuita huduma za AI
- Ujumbe wa "Access denied"

**Suluhisho:**
```bash
# Thibitisha uteuzi wa majukumu
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kagua usanidi wa utambulisho uliosimamiwa
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Thibitisha ufikiaji wa Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Tatizo 3: Matatizo ya Utekelezaji wa Modeli

**Dalili:**
- Modeli hazipatikani katika utekelezaji
- Matoleo maalum ya modeli yanashindwa

**Suluhisho:**
```bash
# Orodhesha modeli zinazopatikana kwa mkoa
az cognitiveservices model list --location eastus

# Sasisha toleo la modeli katika kiolezo cha bicep
# Angalia mahitaji ya uwezo wa modeli
```

## Violezo vya Mfano

### Programu ya Gumzo ya RAG (Python)

**Hifadhi**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Huduma**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Maelezo**: Mfano maarufu kabisa wa Azure AI — programu ya gumzo ya RAG tayari kwa uzalishaji inayokuruhusu kuuliza maswali juu ya nyaraka zako mwenyewe. Inatumia GPT-4.1-mini kwa gumzo, text-embedding-3-large kwa embeddings, na Azure AI Search kwa urejeshaji. Inasaidia nyaraka za aina nyingi (multimodal), ingizo/utura wa sauti, uthibitishaji wa Microsoft Entra, na ufuatiliaji wa Application Insights.

**Anza Haraka:**
```bash
azd init --template azure-search-openai-demo
azd up
```

### Programu ya Gumzo ya RAG (.NET)

**Hifadhi**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Huduma**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Maelezo**: Tofauti ya .NET/C# ya sampuli ya gumzo ya RAG ya Python. Imejengwa kwa ASP.NET Core Minimal API na frontend ya Blazor WebAssembly. Inajumuisha gumzo la sauti, msaada wa GPT-4o-mini vision, na mteja wa mezani/mkononi wa .NET MAUI Blazor Hybrid.

**Anza Haraka:**
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Programu ya Gumzo ya RAG (Java)

**Hifadhi**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Huduma**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Maelezo**: Toleo la Java la sampuli ya gumzo ya RAG linalotumia Langchain4J kwa usimamizi wa AI. Inasaidia usanifu wa microservice unaoendeshwa kwa matukio, mikakati mingi ya utafutaji (maandishi, vector, mchanganyiko), upakiaji wa nyaraka kwa kutumia Azure Document Intelligence, na utekelezaji kwenye Azure Container Apps au Azure Kubernetes Service.

**Anza Haraka:**
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**Hifadhi**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Huduma**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Maelezo**: Copilot wa rejareja wa RAG kutoka mwanzo hadi mwisho ukitumia Azure AI Foundry na Prompty. Chatbot ya Contoso Outdoor inayosimamiwa na data ya katalogi ya bidhaa na oda za wateja. Inaonyesha mtiririko kamili wa GenAIOps — prototipu kwa Prompty, tathmini kwa watathmini walioongozwa na AI, na utekelezaji kupitia AZD hadi Container Apps.

**Anza Haraka:**
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Hifadhi**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Huduma**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Maelezo**: Sampuli ya wakala nyingi inayoonyesha uwanda wa wakala wa AI kwa kutumia Prompty. Inatumia wakala wa utafiti (Bing Grounding katika Azure AI Agent Service), wakala wa bidhaa (Azure AI Search), wakala mwandishi, na wakala mhariri kushirikiana kuandaa makala zilizo na utafiti mzuri. Inajumuisha CI/CD na tathmini katika GitHub Actions.

**Anza Haraka:**
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Hifadhi**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Huduma**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Maelezo**: Chatbot ya RAG isiyohitaji seva kabisa ikitumia LangChain.js na Azure Functions kwa API na Azure Static Web Apps kwa utoaji. Inatumia Azure Cosmos DB kama duka la vector na hifadhi ya historia ya gumzo. Inasaidia maendeleo ya kienyeji kwa Ollama kwa majaribio bila gharama.

**Anza Haraka:**
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Hifadhi**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Huduma**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Maelezo**: Suluhisho la RAG la kiwango cha biashara lenye jopo la msimamizi kwa upakiaji/usimamizi wa nyaraka, chaguzi nyingi za msimamizi wa mchakato (Semantic Kernel, LangChain, Prompt Flow), utambuzi wa sauti hadi maandishi, ujumuishaji wa Microsoft Teams, na chaguo la PostgreSQL au Cosmos DB kama backend. Limeundwa kama msingi unaoweza kubadilishwa kwa matukio ya RAG ya uzalishaji.

**Anza Haraka:**
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Hifadhi**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Huduma**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Maelezo**: Programu ya rejea kwa uwanda wa wakala wengi wa AI ikitumia mifumo mitatu (LangChain.js, LlamaIndex.TS, na Microsoft Agent Framework). Inajumuisha seva za MCP (Model Context Protocol) katika lugha nne zilitumika kama Azure Container Apps zisizo na seva pamoja na ufuatiliaji wa OpenTelemetry.

**Anza Haraka:**
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Hifadhi**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Huduma**: Azure AI Services + Azure OpenAI

**Maelezo**: Templeti ndogo ya Bicep inayotoa huduma za Azure AI zikiwa na modeli za kujifunza kwa mashine zilizosanidiwa. Msingi mwepesi wa kuanza wakati unahitaji tu miundombinu ya Azure AI isipokuwa stack kamili ya programu.

**Anza Haraka:**
```bash
azd init --template azd-ai-starter
azd up
```

> **Tazama templeti zaidi**: Tembelea [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) kwa templeti 80+ za AZD zinazohusiana na AI kwa lugha na matukio mbalimbali.

## Hatua Zifuatazo

1. **Jaribu Mifano**: Anza na templeti iliyojengwa tayari inayolingana na kesi yako ya matumizi
2. **Binafsisha kwa Mahitaji Yako**: Badilisha miundombinu na msimbo wa programu
3. **Ongeza Ufuatiliaji**: Tekeleza ufuatiliaji mpana
4. **Boresha Gharama**: Rekebisha usanidi kwa bajeti yako
5. **Lindeni Utekelezaji Wako**: Tekeleza mifumo ya usalama ya kampuni
6. **Panuzi hadi Uzalishaji**: Ongeza vipengele vya maeneo mengi na upatikanaji wa juu

## 🎯 Mazoezi ya Vitendo

### Mazoezi 1: Telekeza App ya Gumzo ya Microsoft Foundry Models (30 minutes)
**Lengo**: Telekeza na kujaribu programu ya gumzo ya AI ambayo iko tayari kwa uzalishaji

```bash
# Anzisha kiolezo
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Weka vigezo vya mazingira
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Sambaza
azd up

# Jaribu programu
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Fuatilia shughuli za AI
azd monitor

# Safisha
azd down --force --purge
```

**Vigezo vya Mafanikio:**
- [ ] Utekelezaji unakamilika bila makosa ya quota
- [ ] Inaweza kufikia kiolesura cha gumzo kwenye kivinjari
- [ ] Inaweza kuuliza maswali na kupata majibu yanayozaa kwa AI
- [ ] Application Insights inaonyesha data za telemetry
- [ ] Rasilimali zilisafishwa kwa mafanikio

**Gharama Iliyokadiriwa**: $5-10 kwa dakika 30 za majaribio

### Mazoezi 2: Sanidi Utekelezaji wa Modeli Nyingi (45 minutes)
**Lengo**: Telekeza modeli nyingi za AI zikiwa na usanidi tofauti

```bash
# Unda usanidi maalum wa Bicep
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

# Sambaza na thibitisha
azd provision
azd show
```

**Vigezo vya Mafanikio:**
- [ ] Modeli nyingi zilitekelezwa kwa mafanikio
- [ ] Mipangilio tofauti ya uwezo ilitumika
- [ ] Modeli zinapatikana kupitia API
- [ ] Inaweza kuita zote mbili kutoka kwenye programu

### Mazoezi 3: Tekeleza Ufuatiliaji wa Gharama (20 minutes)
**Lengo**: Sanidi arifu za bajeti na ufuatiliaji wa gharama

```bash
# Ongeza arifa ya bajeti kwa Bicep
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

# Weka arifa ya bajeti
azd provision

# Angalia gharama za sasa
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Vigezo vya Mafanikio:**
- [ ] Arifu la bajeti limetengenezwa katika Azure
- [ ] Arifa za barua pepe zimesanidiwa
- [ ] Inaweza kuona data za gharama katika Azure Portal
- [ ] Vikomo vya bajeti vimewekwa ipasavyo

## 💡 Maswali Yanayoulizwa Mara kwa Mara

<details>
<summary><strong>Je, ninawezaje kupunguza gharama za Microsoft Foundry Models wakati wa maendeleo?</strong></summary>

1. **Tumia Tier ya Bure**: Microsoft Foundry Models inatoa tokeni 50,000 kwa mwezi bila malipo
2. **Punguza Uwezo**: Weka uwezo kwa 10 TPM badala ya 30+ kwa ajili ya maendeleo
3. **Tumia azd down**: Ondoa rasilimali (deallocate) wakati hauendi kuendeleza
4. **Hifadhi Majibu (Cache)**: Tekeleza cache ya Redis kwa maswali yanayojirudia
5. **Tumia Prompt Engineering**: Punguza matumizi ya tokeni kwa kutumia prompts zenye ufanisi
```bash
# Usanidi wa maendeleo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Je, tofauti kati ya Microsoft Foundry Models na OpenAI API ni ipi?</strong></summary>

**Microsoft Foundry Models**:
- Usalama wa shirika na ufuataji wa kanuni
- Uunganishaji na mtandao wa kibinafsi
- Dhamana za SLA
- Uthibitishaji wa Managed Identity
- Vikomo vya juu vinapatikana

**OpenAI API**:
- Upatikanaji wa haraka kwa modeli mpya
- Utekelezaji rahisi
- Kizuizi cha chini cha kuingia
- Mtandao wa umma pekee

Kwa programu za uzalishaji, **Microsoft Foundry Models inashauriwa**.
</details>

<details>
<summary><strong>Ninashughulikiaje makosa ya 'quota exceeded' ya Microsoft Foundry Models?</strong></summary>

```bash
# Angalia kizuizi cha sasa
az cognitiveservices usage list --location eastus2

# Jaribu eneo tofauti
azd env set AZURE_LOCATION westus2
azd up

# Punguza uwezo kwa muda
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Omba ongezeko la kizuizi
# Nenda kwenye Portal ya Azure > Kizuizi > Omba ongezeko
```
</details>

<details>
<summary><strong>Je, naweza kutumia data yangu mwenyewe na Microsoft Foundry Models?</strong></summary>

Ndiyo! Tumia **Azure AI Search** kwa RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Angalia kiolezo cha [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Ninawezaje kulinda vituo vya mwisho vya modeli za AI?</strong></summary>

**Mbinu Bora**:
1. Tumia Managed Identity (bila funguo za API)
2. Wezesha Private Endpoints
3. Sanidi vikundi vya usalama vya mtandao
4. Tekeleza ukomo wa viwango (rate limiting)
5. Tumia Azure Key Vault kwa siri

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

## Jamii na Msaada

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Masuala na majadiliano](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Nyaraka rasmi](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Sakinisha ujuzi wa wakala wa Azure + Foundry kwenye mhariri wako kwa kutumia `npx skills add microsoft/github-copilot-for-azure`

---

**Mwelekeo wa Sura:**
- **📚 Nyumbani wa Kozi**: [AZD For Beginners](../../README.md)
- **📖 Sura ya Sasa**: Sura 2 - Maendeleo ya AI Kwanza
- **⬅️ Sura Iliyopita**: [Sura 1: Mradi Wako wa Kwanza](../chapter-01-foundation/first-project.md)
- **➡️ Ifuatayo**: [Uwekaji wa Mfano wa AI](ai-model-deployment.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Mipangilio](../chapter-03-configuration/configuration.md)

**Unahitaji Msaada?** Jiunge na majadiliano ya jamii au fungua tatizo (issue) kwenye hazina. Jamii ya Azure AI + AZD ipo hapa kukusaidia ufanikiwe!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuwa sahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Nyaraka ya asili katika lugha yake inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu iliyofanywa na mtaalamu wa binadamu inashauriwa. Hatujawajibiki kwa kutoelewana au tafsiri potofu yoyote inayotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->