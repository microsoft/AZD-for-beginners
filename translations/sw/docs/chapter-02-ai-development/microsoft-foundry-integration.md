# Uunganishaji wa Microsoft Foundry na AZD

**Uvinjari wa Sura:**
- **📚 Nyumbani wa Kozi**: [AZD kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Chapter 2 - AI-First Development
- **⬅️ Sura Iliyopita**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Ijayo**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Sura Inayofuata**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Muhtasari

Mwongozo huu unaonyesha jinsi ya kuunganisha huduma za Microsoft Foundry na Azure Developer CLI (AZD) kwa kutekeleza programu za AI kwa njia rahisi. Microsoft Foundry inatoa jukwaa kamili la kujenga, kutekeleza, na kusimamia programu za AI, wakati AZD inarahisisha miundombinu na mchakato wa utekelezaji.

## Microsoft Foundry ni nini?

Microsoft Foundry ni jukwaa lililounganishwa la Microsoft kwa maendeleo ya AI ambalo linajumuisha:

- **Katalogi ya Modeli**: Ufikiaji wa modeli za kisasa za AI
- **Prompt Flow**: Mbunifu wa kuona kwa mtiririko wa kazi za AI
- **Portal ya Microsoft Foundry**: Mazingira ya maendeleo yaliyounganishwa kwa programu za AI
- **Chaguo za Utekelezaji**: Chaguzi mbalimbali za mwenyeji na upanuzi
- **Usalama na Ulinzi**: Sifa za uwajibikaji wa AI zimetumika ndani

## AZD + Microsoft Foundry: Bora Pamoja

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Mahitaji ya Awali

- Usajili wa Azure ulio na ruhusa zinazofaa
- Azure Developer CLI imewekwa
- Ufikiaji wa Microsoft Foundry Models services
- Uelewa wa msingi kuhusu Microsoft Foundry

## Mifumo ya Msingi ya Uunganishaji

### Mfano 1: Uunganishaji wa Microsoft Foundry Models

**Tukio la Matumizi**: Tekeleza programu za gumzo kwa kutumia modeli za Microsoft Foundry Models

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

### Mfano 2: Uunganishaji wa AI Search + RAG

**Tukio la Matumizi**: Tekeleza programu za retrieval-augmented generation (RAG)

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

## 🔧 Mifano ya Mipangilio

### Usanidi wa Vigezo vya Mazingira

**Usanidi wa Uzalishaji:**
```bash
# Huduma kuu za AI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Mipangilio ya modeli
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Mipangilio ya utendaji
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Usanidi wa Maendeleo:**
```bash
# Mipangilio ya gharama nafuu kwa ajili ya maendeleo
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

### Viongezi vya AZD kwa Foundry

AZD inatoa viongezi vinavyoongeza uwezo maalum wa AI kwa kazi na huduma za Microsoft Foundry:

```bash
# Sakinisha kiendelezi cha mawakala wa Foundry
azd extension install azure.ai.agents

# Sakinisha kiendelezi cha kurekebisha kwa kina
azd extension install azure.ai.finetune

# Sakinisha kiendelezi cha miundo maalum
azd extension install azure.ai.models

# Orodhesha viendelezi vilivyowekwa
azd extension list
```

### Utekelezaji wa Kwanza kwa Wakala kwa `azd ai`

Ikiwa una manifest ya wakala, tumia `azd ai agent init` kuunda mradi uliounganishwa na Foundry Agent Service:

```bash
# Anzisha kutoka kwenye manifesti ya wakala
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Sambaza kwenye Azure
azd up
```

Angalia [Amri za AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) kwa rejea kamili ya amri na bendera.

### Utekelezaji kwa Amri Moja

```bash
# Sambaza kila kitu kwa amri moja
azd up

# Au sambaza hatua kwa hatua
azd provision  # Miundombinu tu
azd deploy     # Programu tu
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

## Ufuatiliaji na Uonekano

### Uunganishaji na Application Insights

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

## 🔐 Mbinu Bora za Usalama

### Usanidi wa Utambulisho uliosimamiwa

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

### Mikakati ya Kache

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

### Usanidi wa Kuongezeka/Pungua Kiotomatiki

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

## Kutatuwa kwa Masuala ya Kawaida

### Tatizo 1: Kiasi cha OpenAI Kimezidiwa

**Dalili:**
- Utekelezaji unashindwa kwa makosa ya kigezo
- Makosa ya 429 katika logi za programu

**Suluhisho:**
```bash
# Kagua matumizi ya kikomo ya sasa
az cognitiveservices usage list --location eastus

# Jaribu eneo tofauti
azd env set AZURE_LOCATION westus2
azd up

# Punguza uwezo kwa muda mfupi
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Tatizo 2: Kushindwa kwa Uthibitisho

**Dalili:**
- Makosa ya 401/403 wakati wa kuita huduma za AI
- Ujumbe wa "Access denied"

**Suluhisho:**
```bash
# Thibitisha uteuzi wa majukumu
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kagua usanidi wa utambulisho uliosimamiwa
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Thibitisha ufikiaji wa Hazina ya Funguo
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Tatizo 3: Masuala ya Utekelezaji wa Modeli

**Dalili:**
- Modeli hazipatikani kwenye utekelezaji
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

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Maelezo**: Mfano maarufu zaidi wa Azure AI — programu ya gumzo ya RAG inayotumika uzalishaji inayokuruhusu kuuliza maswali juu ya nyaraka zako mwenyewe. Inatumia GPT-4.1-mini kwa gumzo, text-embedding-ada-002 kwa embeddings, na Azure AI Search kwa urejesho. Inaunga mkono nyaraka zenye modal mbalimbali, ingizo/mazao ya sauti, uthibitisho wa Microsoft Entra, na ufuatiliaji wa Application Insights.

**Anza Haraka**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Programu ya Gumzo ya RAG (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Maelezo**: Toleo la .NET/C# la mfano wa gumzo la RAG wa Python. Imejengwa na ASP.NET Core Minimal API na mbele ya Blazor WebAssembly. Inajumuisha gumzo la sauti, msaada wa GPT-4o-mini vision, na mteja wa mezani/mkononi wa .NET MAUI Blazor Hybrid.

**Anza Haraka**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Programu ya Gumzo ya RAG (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Maelezo**: Toleo la Java la mfano wa gumzo la RAG likitumia Langchain4J kwa uendeshaji wa AI. Inaunga mkono usanifu wa microservice unaotegemea matukio, mikakati mbalimbali ya utafutaji (maandishi, vector, hybrid), upakiaji wa nyaraka kwa Azure Document Intelligence, na utekelezaji kwa Azure Container Apps au Azure Kubernetes Service.

**Anza Haraka**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Copilot ya Rejareja kwa Biashara na Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Maelezo**: Copilot ya RAG ya biashara kabisa inayotumia Azure AI Foundry na Prompty. Chatbot ya duka la Contoso Outdoor inayotumia data za orodha ya bidhaa na maagizo ya wateja kwa kufafanua majibu. Inaonyesha mchakato kamili wa GenAIOps — kuunda mfano na Prompty, kutathmini kwa wasevaluaji wanaosaidiwa na AI, na kutekeleza kupitia AZD kwa Container Apps.

**Anza Haraka**:
```bash
azd init --template contoso-chat
azd up
```

### Programu ya Kuandika Ubunifu yenye Wakala Nyingi

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Maelezo**: Mfano wa wakala-mengi unaoonyesha uendeshaji wa mawakala wa AI kwa kutumia Prompty. Inatumia wakala wa utafiti (Bing Grounding katika Azure AI Agent Service), wakala wa bidhaa (Azure AI Search), wakala mwandishi, na wakala mhariri ili kuzalisha makala zilizo na utafiti mzuri kwa ushirikiano. Inajumuisha CI/CD na tathmini katika GitHub Actions.

**Anza Haraka**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Gumzo la RAG Lisilo na Seva (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Maelezo**: Chatbot ya RAG isiyo na server inayotumia LangChain.js na Azure Functions kwa API na Azure Static Web Apps kwa mwenyeji. Inatumia Azure Cosmos DB kama duka la vector na hifadhidata ya historia ya gumzo. Inaunga mkono maendeleo ya ndani kwa kutumia Ollama kwa majaribio bila gharama.

**Anza Haraka**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Kiboreshaji cha Suluhisho 'Chat with Your Data'

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Maelezo**: Suluhisho la RAG lenye kiwango cha kitaalamu kwa biashara na jopo la usimamizi wa upakiaji/utawala wa nyaraka, chaguzi nyingi za orchestrator (Semantic Kernel, LangChain, Prompt Flow), kutoka sauti hadi maandishi, ujumuishaji wa Microsoft Teams, na chaguo la PostgreSQL au Cosmos DB kwa kuhifadhi nyuma. Imeundwa kama sehemu inayoweza kubadilishwa kwa matumizi ya uzalishaji wa RAG.

**Anza Haraka**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### Wakala wa Kusafiri wa AI — Uendeshaji wa Wakala-Mengi MCP

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Maelezo**: Programu ya rejea kwa uendeshaji wa wakala-mengi wa AI ikitumia mifumo mitatu (LangChain.js, LlamaIndex.TS, na Microsoft Agent Framework). Inajumuisha seva za MCP (Model Context Protocol) katika lugha nne zinazotekelezwa kama Azure Container Apps zisizo na server na ufuatiliaji wa OpenTelemetry.

**Anza Haraka**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Maelezo**: Kiolezo kidogo cha Bicep kinachotekeleza huduma za Azure AI na modeli za machine learning zilizo sanidiwa. Ni msingi mwepesi wa kuanzia wakati unataka tu miundombinu ya Azure AI iwe tayari bila stack kamili ya programu.

**Anza Haraka**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Tazama violezo zaidi**: Tembelea [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) kwa violezo 80+ vya AZD vinavyolenga AI kwa lugha na nyanja mbalimbali.

## Hatua Zifuatazo

1. **Jaribu Violezo**: Anza na kiolezo kilicho tayari ambacho kinalingana na tukio lako la matumizi
2. **Binafsisha Kwa Mahitaji Yako**: Badilisha miundombinu na msimbo wa programu
3. **Ongeza Ufuatiliaji**: Tekeleza uonekano kamili
4. **Boresha Gharama**: Sanidi mipangilio kwa bajeti yako
5. **Lindisha Utekelezaji Wako**: Tekeleza mifumo ya usalama ya kampuni
6. **Pandea Uzalishaji**: Ongeza eneo nyingi na sifa za upatikanaji wa juu

## 🎯 Mazoezi ya Vitendo

### Mazoezi 1: Tekeleza Programu ya Gumzo ya Microsoft Foundry Models (dakika 30)
**Lengo**: Tekeleza na kujaribu programu ya gumzo ya AI inayotumika uzalishaji

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
- [ ] Utekelezaji unakamilika bila makosa ya kigezo
- [ ] Inaweza kufikiwa kiolesura cha gumzo kwenye kivinjari
- [ ] Inawezeshwa kuuliza maswali na kupokea majibu yaliyoendeshwa na AI
- [ ] Application Insights inaonyesha data za telemetry
- [ ] Rasilimali zimeondolewa kwa mafanikio

**Gharama Inakadiriwa**: $5-10 kwa dakika 30 za majaribio

### Mazoezi 2: Sanidi Utekelezaji wa Modeli Nyingi (dakika 45)
**Lengo**: Tekeleza modeli nyingi za AI zenye mipangilio tofauti

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

# Sambaza na thibitisha
azd provision
azd show
```

**Vigezo vya Mafanikio:**
- [ ] Modeli nyingi zimetekelezwa kwa mafanikio
- [ ] Mipangilio mbalimbali ya uwezo imetumika
- [ ] Modeli zinaweza kufikiwa kupitia API
- [ ] Inawezeshwa kuita modeli zote kutoka kwenye programu

### Mazoezi 3: Tekeleza Ufuatiliaji wa Gharama (dakika 20)
**Lengo**: Weka arifa za bajeti na ufuatiliaji wa gharama

```bash
# Ongeza tahadhari ya bajeti kwa Bicep
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

# Weka tahadhari ya bajeti
azd provision

# Angalia gharama za sasa
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Vigezo vya Mafanikio:**
- [ ] Arifa ya bajeti imetengenezwa katika Azure
- [ ] Arifa za barua pepe zimesanidiwa
- [ ] Inaweza kuona data za gharama ndani ya Azure Portal
- [ ] Vizingiti vya bajeti vimewekwa ipasavyo

## 💡 Maswali Yanayoulizwa Mara kwa Mara

<details>
<summary><strong>Jinsi ya kupunguza gharama za Microsoft Foundry Models wakati wa maendeleo?</strong></summary>

1. **Tumia Tier ya Bure**: Microsoft Foundry Models inatoa 50,000 tokens/mwezi bure
2. **Punguza Uwezo**: Weka uwezo kwa 10 TPM badala ya 30+ kwa maendeleo
3. **Tumia azd down**: Ondoa rasilimali wakati hauko kwenye maendeleo
4. **Hifadhi Majibu**: Tekeleza kache ya Redis kwa maswali yanorudiwa
5. **Tumia Prompt Engineering**: Punguza matumizi ya tokens kwa prompts zenye ufanisi

```bash
# Usanidi wa maendeleo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Je, tofauti kati ya Microsoft Foundry Models na OpenAI API ni ipi?</strong></summary>

**Microsoft Foundry Models**:
- Usalama wa kampuni na ufuataji wa sheria
- Uunganisho wa mtandao wa kibinafsi
- Dhamana za SLA
- Uthibitisho kwa utambulisho uliosimamiwa
- Vigezo vya juu vinapatikana

**OpenAI API**:
- Upatikanaji wa haraka wa modeli mpya
- Utangulizi rahisi
- Kizuizi cha kuingia kidogo
- Mtandao wa umma tu

Kwa programu za uzalishaji, **Microsoft Foundry Models inashauriwa**.
</details>

<details>
<summary><strong>Ninawezaje kushughulikia hitilafu za "quota exceeded" za Microsoft Foundry Models?</strong></summary>

```bash
# Angalia kikomo cha sasa
az cognitiveservices usage list --location eastus2

# Jaribu mkoa tofauti
azd env set AZURE_LOCATION westus2
azd up

# Punguza uwezo kwa muda
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Omba ongezeko la kikomo
# Nenda kwenye Azure Portal > Vikomo > Omba ongezeko
```
</details>

<details>
<summary><strong>Je, ninaweza kutumia data yangu mwenyewe na Microsoft Foundry Models?</strong></summary>

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

Tazama kiolezo [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Ninawezaje kulinda endpoints za modeli za AI?</strong></summary>

**Mbinu Bora**:
1. Tumia Managed Identity (hakuna API keys)
2. Wezesha Private Endpoints
3. Sanidi network security groups
4. Tekeleza rate limiting
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
- **AZD GitHub**: [Masuala na mijadala](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Nyaraka rasmi](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Ujuzi wa Microsoft Foundry kwenye skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Sakinisha ujuzi za wakala za Azure + Foundry kwenye mhariri wako kwa kutumia `npx skills add microsoft/github-copilot-for-azure`

---

**Urambazaji wa Sura:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Sura ya Sasa**: Sura 2 - Maendeleo ya Kwanza ya AI
- **⬅️ Sura Iliyopita**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Ifuatayo**: [Uwekaji wa Modeli za AI](ai-model-deployment.md)
- **🚀 Sura Ifuatayo**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Unahitaji Msaada?** Jiunge na mijadala ya jamii yetu au fungua issue katika repository. Jamii ya Azure AI + AZD iko hapa kukusaidia kufanikiwa!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Taarifa ya kutokuwa na dhamana**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuwa sahihi, tafadhali fahamu kwamba tafsiri za moja kwa moja zinaweza kuwa na makosa au kasoro. Nyaraka ya awali katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatuwajibiki kwa wasielewano wowote au tafsiri potofu zitakazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->