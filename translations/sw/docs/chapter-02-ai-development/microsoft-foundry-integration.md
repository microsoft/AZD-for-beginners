# Uunganisho wa Microsoft Foundry na AZD

**Uelekezaji wa Sura:**
- **📚 Nyumbani mwa Kozi**: [AZD Kwa Wakaguzi](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 2 - Maendeleo ya AI-Kwanza
- **⬅️ Sura ya Awali**: [Sura 1: Mradi Wako wa Kwanza](../chapter-01-foundation/first-project.md)
- **➡️ Ifuatayo**: [Wakala wa AI](agents.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

## Muhtasari

Mwongozo huu unaonyesha jinsi ya kuunganisha huduma za Microsoft Foundry na Azure Developer CLI (AZD) kwa uingizaji rahisi wa programu za AI. Microsoft Foundry hutoa jukwaa kamili la kujenga, kupeleka, na kusimamia programu za AI, wakati AZD inarahisisha mchakato wa miundombinu na uingizaji.

## Nini ni Microsoft Foundry?

Microsoft Foundry ni jukwaa moja la maendeleo ya AI la Microsoft ambalo linajumuisha:

- **Kavani ya Mfano**: Upatikanaji wa mifano ya hali ya juu ya AI
- **Mtiririko wa Haraka**: Mbuni wa kuona wa mchakato wa AI
- **Kituo cha Microsoft Foundry**: Mazingira ya maendeleo yaliyojumuishwa kwa programu za AI
- **Chaguzi za Uingizaji**: Chaguzi nyingi za kukaribisha na kupanua
- **Usalama na Ulinzi**: Sifa zilizojengwa za AI zenye uwajibikaji

## AZD + Microsoft Foundry: Bora Pamoja

| Kipengele | Microsoft Foundry | Faida za Uunganisho wa AZD |
|---------|-----------------|------------------------|
| **Uingizaji wa Mfano** | Uingizaji wa lango la mkono | Uingizaji wa otomatiki, unaorudiwa |
| **Miundombinu** | Ugavi kwa kubofya kupitia | Miundombinu kama Msimbo (Bicep) |
| **Usimamizi wa Mazingira** | Lengo la mazingira moja | Mazingira mengi (bunifu/uandikishaji/uzalishaji) |
| **Uunganisho wa CI/CD** | Mdogo | Msaada wa asili wa GitHub Actions |
| **Usimamizi wa Gharama** | Ufuatiliaji wa msingi | Uboreshaji wa gharama maalum kwa mazingira |

## Masharti ya Awali

- Usajili wa Azure wenye ruhusa zinazofaa
- Azure Developer CLI imewekwa
- Upatikanaji wa huduma za Microsoft Foundry Models
- Ujuzi wa msingi na Microsoft Foundry

> **Mapitio ya utoaji (2026-11-04):** Mwongozo wa AI CLI ulipimwa dhidi ya `azd` `1.37.2`, mawakala `1.0.0-beta.23`, na tathmini `1.0.0-beta.2` nyaraka/chanzo. Tumia `azd >= 1.37.0` kwa mtiririko uliojumuishwa. Angalia [mabadiliko na marekebisho ya utoaji](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); hakiki hii haisaidii kuthibitisha kila kiolezo au mfano wa SDK dhidi ya uingizaji unaoishi.

## Mifumo Msingi ya Uunganisho

**Wigo wa mifano:** Bicep chini ina vipande vya rasilimali vya mfano, si kiolezo kamili cha kuingiza. Kiolezo kinachoshikilia lazima kitaje majina, `location`, rasilimali zinazohusiana, vitambulisho, matokeo, na kukaribisha programu. Tumia mfano uliounganishwa kama mwanzo wa kutekeleza. Mifano ya Bash inahitaji uthibitishaji wa Azure CLI tofauti na `azd auth login`.

### Mfano 1: Uunganisho wa Microsoft Foundry Models

**Matumizi**: Ingiza programu za mazungumzo na mifano ya Azure OpenAI ndani ya Microsoft Foundry

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

Mwita anahitaji kitambulisho kilichounganishwa cha usimamizi na `Cognitive Services OpenAI User` kwa kiwango cha akaunti; kuzima funguo hakuruhusu upatikanaji. Hakikisha upatikanaji wa eneo/mfano/SKU na kiwango kabla ya kuingiza.

### Mfano 2: Utafutaji wa AI + Uunganisho wa RAG

**Matumizi**: Ingiza programu za kizazi zenye utaftaji (RAG)

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

Hakuna rasilimali ya ARM ya `Microsoft.Search/searchServices/dataConnections` kwa uunganisho huu. Sanidi faharasa ya Utafutaji, chanzo cha data, indexer/skillset au vectorizer kupitia API za mwelekeo wa data wa Utafutaji unaounga mkono. Ikiwa Utafutaji wa simu mfano wa kuingiza, wezesha utambulisho usimamizi wake, toa jukumu la mfano husika, na sanidi ujuzi/vektorizi wa kuingiza. Angalia [uunganisho wa kuidhinishwa](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Mfano 3: Uunganisho wa Akili ya Nyaraka

**Matumizi**: Mchakato na uchambuzi wa nyaraka

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

### Usanidi wa Mabadiliko ya Mazingira

Isipokuwa mipangilio ya AZD iliyoandikwa kama `AZURE_LOCATION`, haya ni **majina ya ingizo ya kiolezo maalum**. Hayana athari isipokuwa kiolezo/ programu itavitumia kupitia ramani za vigezo na mazingira ya mwenyeji. Kwa `azure-search-openai-demo`, tumia majina yake halisi kama `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` na `AZURE_SEARCH_SERVICE_SKU` badala yake. Uwezo wa mfano si SKU ya akaunti.

**Usanidi wa Uzalishaji:**
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

**Usanidi wa Maendeleo:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Usanidi Salama na Key Vault

Pendekeza Entra ID na uthibitishaji wa funguo wa ndani umekwama. Hii ni **mbadala wa zamani wa uthibitishaji wa funguo** kwa programu zinazohitaji funguo: inahitaji akaunti yenye uthibitishaji wa funguo umewashwa, kitambulisho cha programu kimeunganishwa kwa mwenyeji wake, na ufikiaji wa Key Vault/kmtandao kazi. Usichanganye upokezi wa funguo na `disableLocalAuth: true` na uterezi wa simu za funguo zifanye kazi.

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

## Miradi ya Uingizaji

### Viendelezi vya AZD kwa Foundry

AZD hutoa viendelezi vinavyoongeza uwezo maalum wa AI kwa kufanya kazi na huduma za Microsoft Foundry:

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

Viendelezi vya AI bado vinaendelea haraka katika awali. Ikiwa amri yaendesha tofauti na ilivyoonekana hapa, boresha kiendelezi husika kabla ya kusuluhisha mradi kwa ujumla.

### Uingizaji wa Wakala-Kwanza kwa `azd ai`

Tumia `azd ai agent init` kwa ushirikiano, au tumia kiolezo cha mradi wa wakala wa sasa `azure.yaml` uliounganishwa na Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` hutumia tahajia ya zamani ya `--manifest`/`-m`; maandalizi ya waraka na usanidi wa wakala uliomo bado yanahitaji uhamisho. Pitia mawakala na `azd ai eval` kutoka `azure.ai.evaluations`, si mtiririko wa zamani uliotolewa. Angalia [uhamishaji wa tathmini](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) kwa usanidi, utekelezaji, na matokeo.

Angalia [Amri za AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) kwa rejeleo kamili la amri na bendera.

### Uingizaji wa Amri Moja

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Uingizaji Maalum kwa Mazingira

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

## Ufuatiliaji na Uangalizi

### Uunganisho wa Application Insights

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

Hii inatoa rasilimali ya Insights, si usanisi wa upimaji. Mara programu yako itakapotoa vipindi vya simu zinazotoka, fanya uchunguzi huu wa mfano katika Application Insights Logs (badilisha kichujio kutumia majina halisi ya vipindi):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Ufuatiliaji wa Gharama

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

Tumia mpokeaji halisi na hakikisha ruhusa za wigo wa bili. Bajeti hutuma arifa; si kipimo cha matumizi.

## 🔐 Mbinu Bora za Usalama

### Usanidi wa Kitambulisho Chosimamisizi

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

Kipande hiki cha mwisho pia kinahitaji eneo/kikundi cha DNS binafsi, viungo vya VNet, muunganisho wa programu na VNet, na sera wazi ya upatikanaji wa umma. Kuunda mwisho binafsi pekee hakuzimi upatikanaji wa umma.

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

## Boresha Utendaji

### Mikakati ya Kuweka Kache

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

Azure Cache kwa Redis Basic/Standard/Premium iko kwenye [njia ya kufutwa](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); tumia Azure Managed Redis kwa mgao mpya na fuata mwongozo wake wa sasa wa kiolezo/uthibitishaji. Panga majibu ya AI yaliyokachekwa kwa idhini, mfano/maelekezo, na toleo la data, na muda wa kumalizika; usiwashirikishe majibu binafsi kwa kutumia maandishi ya maswali pekee.

### Usanidi wa Kujiendesha-Upana (Auto-scaling)

**Rasilimali ya sehemu:** changanya mipangilio hii ya upanaji/ingress ndani ya programu ya Container kamili yenye mazingira yaliyosimamiwa, picha ya kontena, na mipaka ya rasilimali. Nakala zaidi haziongezi kiwango cha mfano.

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

## Suluhisho la Matatizo ya Kawaida

### Tatizo 1: Kiwango cha OpenAI Kimezidiwa

**Dalili:**
- Uingizaji hufeli kwa makosa ya kiwango
- Makosa 429 katika kumbukumbu za programu

**Suluhisho:**
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

Kigezo cha uwezo kilicho hapo juu kinatumika tu kwa kiolezo maalum kilichounganishwa kutumia. Kwa mfano wa RAG, tumia `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Usibadilishe `AZURE_LOCATION` kusogeza rasilimali zilizopo mahali; tengeneza mazingira tofauti kwa eneo jipya na panga uhamisho/usafishaji.

### Tatizo 2: Kushindwa kwa Uthibitishaji

**Dalili:**
- Makosa 401/403 wakati wa kukamata huduma za AI
- Ujumbe za "Upatikanaji umekataliwa"

**Suluhisho:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Tatizo 3: Masuala ya Uingizaji wa Mfano

**Dalili:**
- Mifano haipatikani kwenye uingizaji
- Toleo maalum la mfano linafeli

**Suluhisho:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Mifano ya Viungo

Hizi ni mbadala, si amri za mfuatano. Anzisha kila moja kwenye saraka tupu tofauti. Mahali pa wazi pa kuanzisha na `.` huhifadhi uanzishaji kwenye saraka yako ya sasa; vinginevyo AZD ya sasa inaweza kuunda saraka mtoto yenye jina la kiolezo bila kubadilisha saraka ya sasa ya shell yako.

### Programu ya Mazungumzo ya RAG (Python)

**Hifadhidata**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Huduma**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Maelezo**: Rejea ya mazungumzo ya RAG kwa maswali juu ya nyaraka zako, na utaftaji wa Azure AI Search. Pitia mifano inayounga mkono, vipengele za hiari, mwongozo wa gharama, na uimarishaji wa uzalishaji kabla ya matumizi; kupeleka mfano hakufanyi programu kuwa tayari kwa uzalishaji.

**Anza Haraka**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Programu ya Mazungumzo ya RAG (.NET)

**Hifadhidata**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Huduma**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Maelezo**: Sawia ya .NET/C# ya mfano wa mazungumzo wa RAG wa Python. Imejengwa na ASP.NET Core Minimal API na Blazor WebAssembly mbele. Inajumuisha mazungumzo ya sauti, msaada wa GPT-4o-mini vision, na mteja wa desktop/mkononi wa mseto wa .NET MAUI Blazor.

**Anza Haraka**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Programu ya Mazungumzo ya RAG (Java)

**Hifadhidata**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Huduma**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Maelezo**: Toleo la Java la mfano wa mazungumzo wa RAG ukitumia Langchain4J kwa usimamishaji wa AI. Inaunga mkono muundo mdogo wa udalili wa huduma, mikakati mingi ya utaftaji (maandishi, vekta, mchanganyiko), kupakia nyaraka na Azure Document Intelligence, na uingizaji kwenye Azure Container Apps au Azure Kubernetes Service.

**Anza Haraka**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Rubani wa Malipo ya Kibiashara na Microsoft Foundry

**Hifadhidata**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Huduma**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Maelezo**: Rubani kamili wa malipo ya rejareja akitumia Microsoft Foundry na Prompty. Chatbot ya rejareja ya Contoso Outdoor inayotegemea jibu kwenye katalogi ya bidhaa na data ya agizo la mteja. Inaonyesha mtiririko kamili wa GenAIOps — tengeneza awali na Prompty, tathmini na wanathmini wa AI, na ingeza kwa AZD hadi Container Apps.

**Anza Haraka**:
```bash
azd init --template contoso-chat .
azd up
```

### Programu ya Kuandika Inavyounda Wakala Wengi

**Hifadhidata**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Huduma**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Maelezo**: Mfano wa mawakala wengi unaoonyesha usimamizi wa wakala wa AI na Prompty. Inatumia wakala wa utafiti (Bing Grounding katika Azure AI Agent Service), wakala wa bidhaa (Azure AI Search), wakala mwandishi, na wakala mhariri kushirikiana kuandaa makala zenye utafiti mwafaka. Inajumuisha CI/CD na tathmini katika GitHub Actions.

**Anza Haraka**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Mazungumzo ya RAG Pasipo Server (JavaScript/TypeScript)

**Hifadhidata**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Huduma**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB kwa NoSQL + LangChain.js

**Maelezo**: Chatbot ya RAG isiyo na seva ikitumia LangChain.js na Azure Functions kwa API na Azure Static Web Apps kwa kukaribisha. Inatumia Azure Cosmos DB kama hifadhi ya vekta na hifadhidata ya historia ya mazungumzo. Inasaidia maendeleo ya eneo na Ollama kwa majaribio ya bila gharama.

**Anza Haraka**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Mwongozaji wa Suluhisho la Mazungumzo na Data Yako

**Hifadhidata**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Huduma**: Microsoft Foundry + Azure Container Apps (wavu/API/ingestion) + Azure AI Search na Cosmos DB, au PostgreSQL na pgvector

**Maelezo**: Mwongozaji wa mazungumzo unaounga mkono nyaraka na marejeleo. Mfano wa sasa unaendesha React mbele, FastAPI nyuma, na mfanyakazi wa Functions kwa usindikaji kwenye Container Apps; chaguzi za muongozo ni Agent Framework na LangGraph. Chaguzi za hifadhidata/utafutaji huchaguliwa wakati wa uingizaji. Ni mwanzo, si mfumo kamili wa uzalishaji; usifikirie toleo la zamani la App Service, Semantic Kernel, au Prompt Flow linaelezea chaguo-msingi wa sasa.

**Anza Haraka**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Mawakala wa Safari wa AI — Mwongozo wa MCP wa Mawakala Wengi

**Hifadhidata**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Huduma**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Maelezo**: Programu ya rejea kwa upangaji wa AI wa mawakala wengi kwa kutumia mifumo mitatu (LangChain.js, LlamaIndex.TS, na Microsoft Agent Framework). Ina huduma za MCP (Model Context Protocol) katika lugha nne zinazoendeshwa kama Azure Container Apps zisizo na seva zikiwa na ufuatiliaji wa OpenTelemetry.

**Anza Haraka**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Tazama templeti zaidi**: Tembelea [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) kwa templeti zinazopatikana sasa katika lugha na matukio mbalimbali. Kila mfano uliounganishwa ni hazina ya nje, sio mfano wa ndani unaotolewa na kozi hii; angalia mahitaji yake ya sasa na mwongozo wa uzalishaji kabla ya kupeleka.

## Hatua Zinazo Fuata

1. **Jaribu Mifano**: Anza na templeti iliyotengenezwa tayari inayolingana na matumizi yako
2. **Badilisha Kwa Mahitaji Yako**: Badilisha miundombinu na msimbo wa programu
3. **Ongeza Ufuatiliaji**: Tekeleza uonekano wa kina
4. **Boreshaji Gharama**: Rekebisha mipangilio kwa bajeti yako
5. **Linda Uwekaji Wako**: Tekeleza mifumo ya usalama wa biashara
6. **Panga kwa Uzalishaji**: Ongeza vipengele vya maeneo mengi na upatikanaji mkubwa

## 🎯 Mazoezi ya Vitendo

### Zoefzi 1: Wekeza App ya Mazungumzo ya Microsoft Foundry Models (dakika 30)
**Lengo**: Wekeza na jaribu programu ya rejea ya mazungumzo ya AI

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

**Vigezo vya Mafanikio:**
- [ ] Uwekaji unakamilika bila makosa ya kiwango
- [ ] Inaweza kufikia kiolesura cha mazungumzo katika kivinjari
- [ ] Inaweza kuuliza maswali na kupata majibu yanayotokana na AI
- [ ] Application Insights inaonyesha data za telemetry
- [ ] Rasilimali zimeondolewa kwa mafanikio

**Gharama:** Kagua mwongozo wa gharama wa mfano wa sasa na SKUs zilizochaguliwa kabla ya kuwekeza. Malipo yanaendelea mpaka rasilimali zichukuliwe; hakuna makadirio ya dakika 30 ya kawaida kwa usanidi wote.

### Zoefzi 2: Sanidi Uwekaji wa Mifano Mingi (dakika 45)
**Lengo**: Wekeza mifano mingi ya AI yenye usanidi tofauti

**Mwanzo:** Akaunti ya Azure OpenAI iliyopo na moduli ya kundi la rasilimali ya AZD inayoweza kuita faili hii. Tengeneza `infra/ai-models.bicep` na maudhui yafuatayo ukitumia mhariri wako. Haitekelezwi moja kwa moja kwa sababu iko chini ya `infra/`.

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

Kutoka kwa moduli ya kundi la rasilimali inayomiliki akaunti, ongeza wito wa moduli (rekebisha jina la alama kwa akaunti yako halisi):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Usitangaze utekelezaji uleule katika moduli zote mbili. Ikiwa njia ya kuingia ya AZD ni kwa muktadha wa usajili, itaamsha hili kutoka kwa moduli yake ya mtoto ya kundi la rasilimali na rekebisha njia ya kati. Jenga moduli hiyo yenyewe kwa kutumia `az bicep build --file <path-to-containing-module>`, kisha:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Vigezo vya Mafanikio:**
- [ ] Mifano mingi imewekwa kwa mafanikio
- [ ] Mipangilio tofauti ya uwezo imetumika
- [ ] Mifano inapatikana kupitia API
- [ ] Inaweza kuita mifano yote miwili kutoka kwa programu

### Zoefzi 3: Tekeleza Ufuatiliaji wa Gharama (dakika 20)
**Lengo**: Sanidi onyo la bajeti na ufuatiliaji wa gharama

**Mwanzo:** Mfano wa bajeti hapo juu na moduli ya miundombinu ya kundi la rasilimali. Ongeza rasilimali hii ukitumia mhariri wako; pita `budgetStartDate` kutoka kwa ramani zako za vigezo (usirudie parameter ikiwa tayari imetangazwa). Badilisha mpokeaji na thibitisha una ruhusa ya kuandika bajeti.

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

Kinachotarajiwa: jibu lina `amount: 200`, vizingiti vyote viwili, na mpokeaji wako. Kagua Cost Management katika portal kwa malipo halisi; data ya gharama ni kuchelewa na onyo halihitaji kuzimwa wakati wa zoefzi fupi.

**Vigezo vya Mafanikio:**
- [ ] Onyo la bajeti limeundwa Azure
- [ ] Arifa za barua pepe zimesanidiwa
- [ ] Inaweza kuangalia data za gharama katika Azure Portal
- [ ] Vizingiti vya bajeti vimewekwa ipasavyo

## 💡 Maswali Yanayoulizwa Mara kwa Mara

<details>
<summary><strong>Ninawezaje kupunguza gharama za Microsoft Foundry Models wakati wa maendeleo?</strong></summary>

1. **Angalia bei**: Hakuna ruksa ya bure ya tokeni 50,000 kwa mwezi kwa mfano wa Azure OpenAI
2. **Pima uwezo ipasavyo**: Uwezo `10` kawaida unawakilisha TPM 10,000 kwa mifano ya maandishi ya Standard, si TPM 10. Kupunguza kikomo hiki cha kiwango hakupunguzi bei kwa tokeni
3. **Tumia azd down**: Ondoa rasilimali zinazoweza kutupwa wakati usipoendeleza (hii si kutoa huduma)
4. **Hifadhi Majibu**: Tekeleza cache ya Redis kwa maswali yanayojirudia
5. **Tumia Uhandisi wa Prompt**: Punguza matumizi ya tokeni kwa maombi yenye ufanisi

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Nambari ya tofauti kati ya Microsoft Foundry Models na OpenAI API ni ipi?</strong></summary>

**Microsoft Foundry Models**:
- Usalama wa biashara na ufuasi
- Uunganisho wa mtandao binafsi
- Dhamana za SLA
- Uthibitisho wa kitambulisho kilichodhibitiwa
- Viwango vya juu vinavyopatikana

**OpenAI API**: Mtoa huduma/API tofauti mwenye upatikanaji wa mfano wake, bei, uthibitisho, na chaguzi za uunganisho wa biashara. Linganisha huduma za sasa badala ya kudhani ni mtandao wa umma tu au daima hutuma mifano kwanza.

Chagua kulingana na mahitaji ya shirika lako; mifano maalum ya kitambulisho kilichodhibitiwa na viungo binafsi katika kozi hii hutumika kwa huduma zinazokaliwa Azure, si kila mfano/mtoa huduma katika katalojia ya Foundry.
</details>

<details>
<summary><strong>Ninawezaje kushughulikia makosa ya kuizidi kiwango cha Microsoft Foundry Models?</strong></summary>

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
<summary><strong?Je, naweza kutumia data yangu mwenyewe na Microsoft Foundry Models?</strong></summary>

Ndiyo! Tumia **Azure AI Search** kwa RAG (Uzalishaji Ulioboreshwa kwa Urejelezaji):

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

Tazama templeti ya [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Je, ninawezaje kulinda sehemu za mfano wa AI?</strong></summary>

**Mbinu Bora**:
1. Tumia Kitambulisho Kilichodhibitiwa (bila funguo za API)
2. Zimisha Sehemu za Kibinafsi
3. Sanidi makundi ya usalama wa mtandao
4. Tekeleza ukomo wa kiwango
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
- **Microsoft Learn**: [Nyaraka Rasmi](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Ujuzi wa Microsoft Foundry kwenye skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Sakinisha ujuzi wa mawakala wa Azure + Foundry katika mhariri wako kwa kutumia `npx skills add microsoft/github-copilot-for-azure`

---

**Uvinjari wa Sura:**
- **📚 Nyumbani Kozi**: [AZD Kwa Wahanga](../../README.md)
- **📖 Sura ya Sasa**: Sura 2 - Maendeleo ya AI-Kwanza
- **⬅️ Sura Iliyojaa**: [Sura 1: Mradi Wako wa Kwanza](../chapter-01-foundation/first-project.md)
- **➡️ Ifuatayo**: [Mawakala wa AI](agents.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

**Unahitaji Msaada?** Jiunge katika mijadala ya jamii yetu au fungua tatizo kwenye hazina. Jamii ya Azure AI + AZD iko hapa kusaidia kufanikisha mafanikio yako!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->