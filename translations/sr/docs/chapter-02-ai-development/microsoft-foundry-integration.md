# Microsoft Foundry интеграција са AZD

**Навигација кроз поглавље:**
- **📚 Почетна страна курса**: [AZD за почетнике](../../README.md)
- **📖 Текуће поглавље**: Поглавље 2 - Развој уз ИИ у првом плану
- **⬅️ Претходно поглавље**: [Поглавље 1: Ваш први пројекат](../chapter-01-foundation/first-project.md)
- **➡️ Следеће**: [ИИ агенти](agents.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

## Преглед

Овај водич показује како интегрисати Microsoft Foundry услуге са Azure Developer CLI (AZD) ради поједностављеног распореда ИИ апликација. Microsoft Foundry пружа свеобухватну платформу за израду, имплементацију и управљање ИИ апликацијама, док AZD поједностављује инфраструктуру и процес распореда.

## Шта је Microsoft Foundry?

Microsoft Foundry је јединствена платформа компаније Microsoft за развој ИИ која укључује:

- **Каталог модела**: Приступ најсавременијим ИИ моделима
- **Prompt Flow**: Визуелни дизајнер ИИ токова рада
- **Microsoft Foundry портал**: Интегрисано развојно окружење за ИИ апликације
- **Опције распореда**: Више опција за хостинг и скалирање
- **Безбедност и сигурност**: Уграђене функције одговорног ИИ

## AZD + Microsoft Foundry: Боље заједно

| Карактеристика | Microsoft Foundry | Предност AZD интеграције |
|---------|-----------------|------------------------|
| **Распоред модела** | Ручни распореди преко портала | Аутоматизовани, поновљиви распореди |
| **Инфраструктура** | Клик-по-клику провизије | Инфраструктура као код (Bicep) |
| **Управљање окружењем** | Фокус на једно окружење | Мулти-окружење (развој/стагинг/продукција) |
| **CI/CD интеграција** | Ограничено | Нативна подршка за GitHub Actions |
| **Управљање трошковима** | Основно праћење | Оптимизација трошкова по окружењу |

## Предуслови

- Azure претплата са одговарајућим дозволама
- Инсталиран Azure Developer CLI
- Приступ Microsoft Foundry Models услугама
- Основно познавање Microsoft Foundry платформе

> **Преглед издања (2026-11-04):** Упутство за AI CLI проверено је са `azd` `1.37.2`, агенти `1.0.0-beta.23`, и документацијом/извором за евалуације `1.0.0-beta.2`. Користите `azd >= 1.37.0` за комбиновани ток рада. Погледајте [промене и исправке издања](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); овај преглед не потврђује сваки шаблон или пример SDK-а у живом распоредању.

## Основни обрасци интеграције

**Обим примера:** Код испод у Bicep-у садржи илустративне фрагменте ресурса, а не комплетан распоредив шаблон. Родитељски шаблон мора дефинисати имена, `location`, реферисане ресурсе, идентитете, излазе и хостинг апликације. Користите повезани пример као покретачку тачку. Bash примери захтевају посебну Azure CLI аутентификацију поред `azd auth login`.

### Образац 1: Интеграција Microsoft Foundry модела

**Случај коришћења**: Распоред апликација за чет са Azure OpenAI моделима у Microsoft Foundry

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

**Инфраструктура (main.bicep):**
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

Позивач треба да има прикључени управљани идентитет и `Cognitive Services OpenAI User` на нивоу налога; онемогућавање кључева не даје приступ. Проверите доступност региона/модела/SKU и квоте пре распореда.

### Образац 2: AI претрага + RAG интеграција

**Случај коришћења**: Распоред апликација за генерисање са такмичарским приступом (RAG)

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

Не постоји `Microsoft.Search/searchServices/dataConnections` ARM ресурс за ову интеграцију. Конфигуришите претраживачки индекс, извор података, индексер/скиллсет или векторизатор преко подржаних Search data-plane API-ja. Ако Search позива модел уграђивања, омогућите његов управљани идентитет, дајте релевантну улогу модела и конфигуришите његов скилл/векторизатор уграђивања. Погледајте [интегрисану векторизацију](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Образац 3: Интеграција интелигенције докумената

**Случај коришћења**: Токови рада за обраду и анализу докумената

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

## 🔧 Обрасци конфигурације

### Подешавање променљивих окружења

Освен документираних AZD подешавања као што су `AZURE_LOCATION`, ово су **име улаза прилагођеног шаблона**. Немају ефекат осим ако шаблон/апликација их не користи кроз параметре и мапирања окружења домаћина. За `azure-search-openai-demo` користите његова стварна имена као што су `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` и `AZURE_SEARCH_SERVICE_SKU`. Капацитет модела није SKU налога.

**Продукциона конфигурација:**
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

**Конфигурација за развој:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Сигурна конфигурација са Key Vault-ом

Препоручује се Entra ID са искљученом локалном аутентификацијом кључева. Следеће је само **застарела алтернатива аутентификацији кључем** за апликације које захтевају кључеве: потребан је налог са омогућеном аутентификацијом кључа, идентитет апликације прикључен на његов домаћин, и функционисање приступа и мреже Key Vault-a. Не комбинујте приступ кључу са `disableLocalAuth: true` и не очекујте да позиви на бази кључа раде.

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

## Токови распореда

### AZD проширења за Foundry

AZD пружа проширења која додају ИИ-специфичне могућности за рад са Microsoft Foundry услугама:

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

ИИ проширења су још увек у брзом развоју у прегледу. Ако се команда понаша другачије него што је овде приказано, надоградите релевантно проширење пре решавања проблема на самом пројекту.

### Распоред агената са `azd ai`

Користите `azd ai agent init` интерактивно или примените актуелни `azure.yaml` шаблон пројекта агента повезан са Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` замењује застарели правопис `--manifest`/`-m`; застарела манифеста и угнежђене конфигурације агената и даље захтевају миграцију. Евалуирајте агенте са `azd ai eval` из `azure.ai.evaluations`, а не уклоњеним застарелим током рада. Погледајте [миграцију евалуације](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) за подешавање, извршење и резултате.

Погледајте [AZD AI CLI наредбе](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) за пун преглед команди и параметара.

### Распоред једном командом

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Распоред по окружењима

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

## Праћење и опсервабилност

### Интеграција Application Insights

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

Ово провизује Insights ресурс, не телекомуникациону инструментализацију. Када ваша апликација емитује опсеге позива модела ка споља, покрените овај илустративни упит у Application Insights Logs (прилагодите филтер стварним именима опсега):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Праћење трошкова

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

Користите стварног примаоца и проверите дозволе обима наплате. Буџет шаље упозорења; није ограничење трошкова.

## 🔐 Најбоље праксе безбедности

### Конфигурација управљаног идентитета

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

### Мрежна безбедност

Овај фрагмент крајње тачке такође захтева приватну DNS зону/групу, VNet линкове, повезаност апликације са VNet-ом и експлицитну политику јавног приступа. Само креирање приватне крајње тачке не онемогућује јавни приступ.

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

## Оптимизација перформанси

### Стратегије кеширања

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

Azure Cache for Redis Basic/Standard/Premium је на [пустионичком путу](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); користите Azure Managed Redis за нове распореде и следите његова упутства из шаблона и аутентификације. Обим кешираних ИИ одговора дефинишите по овлашћењу, моделу/упутствима и верзији података, са истеком; никад не делите приватне одговоре само коришћењем текста упита.

### Конфигурација аутоматског скалирања

**Делимични ресурс:** спојите ове параметре скалирања/пролаза у комплетан Container App са управљаним окружењем, сликом контејнера и ограничењима ресурса. Више реплика не повећава квоту модела.

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

## Решавање уобичајених проблема

### Проблем 1: Прекорачена квота OpenAI

**Симптоми:**
- Распоред неуспешан са грешкама квоте
- 429 грешака у логовима апликације

**Решења:**
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

Променљива капацитета горе се односи само на прилагођени шаблон који је повезан да га користи. За RAG пример, користите `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Не мењајте `AZURE_LOCATION` да преместите постојеће ресурсе на место; креирајте засебно окружење за нови регион и планирајте миграцију/чишћење.

### Проблем 2: Неуспели покушаји аутентификације

**Симптоми:**
- 401/403 грешке при позивању ИИ услуга
- Поруке "Приступ одбијен"

**Решења:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Проблем 3: Проблеми са распоредом модела

**Симптоми:**
- Модели нису доступни у распоредању
- Падају одређене верзије модела

**Решења:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Пример шаблона

Ово су алтернативе, не наредбе у низу. Почните сваки у засебном празном директоријуму. Експлицитан `.` одредишна тачка задржава иницијализацију у вашем тренутном директоријуму; иначе тренутни AZD може креирати поддиректоријум са именом шаблона без промене радног директоријума у вашем шелу.

### RAG чет апликација (Python)

**Репозиторијум**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Услуге**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Опис**: Референтна RAG чет апликација за питања о вашим документима, са Azure AI Search претрагом. Прегледајте тренутне подржане моделе, опционе функције, смернице трошкова и појачање за продукцију пре коришћења; распоредање примера не чини апликацију спремном за производњу.

**Брзи почетак**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG чет апликација (.NET)

**Репозиторијум**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Услуге**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Опис**: .NET/C# верзија Python RAG чет примера. Изграђена са ASP.NET Core Minimal API и Blazor WebAssembly фронтендом. Укључује гласовни чет, GPT-4o-mini визију и пратње .NET MAUI Blazor Hybrid десктоп/мобилни клијент.

**Брзи почетак**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG чет апликација (Java)

**Репозиторијум**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Услуге**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Опис**: Јава верзија RAG чет примера користећи Langchain4J за ИИ оркестрацију. Подржава микросервисну догађајно-вођену архитектуру, више стратегија претраге (текстуална, векторска, хибридна), отпремање докумената са Azure Document Intelligence и распоређивање или на Azure Container Apps или Azure Kubernetes Service.

**Брзи почетак**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Корпоративни трговачки копилот са Microsoft Foundry-ом

**Репозиторијум**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Услуге**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Опис**: Крај-крај трговачки RAG копилот користећи Microsoft Foundry и Prompty. Contoso Outdoor трговачки чатбот који упућује одговоре на податке из каталога производа и података о наруџбинама купаца. Покреће цео GenAIOps ток — прототип са Prompty-ом, процена уз помоћ ИИ-а и имплементација путем AZD у Container Apps.

**Брзи почетак**:
```bash
azd init --template contoso-chat .
azd up
```

### Креативна апликација са више агената

**Репозиторијум**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Услуге**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Опис**: Пример са више агената који демонстрира ИИ оркестрацију агената са Prompty-ом. Користи истраживачког агента (Bing Grounding у Azure AI Agent Service), агента за производ (Azure AI Search), агента писаца и агента уредника за заједничку израду добро истражених чланака. Укључује CI/CD са евалуацијом у GitHub Actions.

**Брзи почетак**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Безсервирни RAG чет (JavaScript/TypeScript)

**Репозиторијум**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Услуге**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB за NoSQL + LangChain.js

**Опис**: Потпуно безсервирни RAG четбот који користи LangChain.js са Azure Functions за API и Azure Static Web Apps за хостинг. Користи Azure Cosmos DB као и складиште вектора и базу података историје ћаскања. Подржава локални развој са Ollama за тестирање без трошкова.

**Брзи почетак**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Акцелератор решења Чет са вашим подацима

**Репозиторијум**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Услуге**: Microsoft Foundry + Azure Container Apps (веб/API/ингестија) + Azure AI Search са Cosmos DB или PostgreSQL са pgvector

**Опис**: Чет акцелератор заснован на документима са цитатима. Тренутни пример хостира React фронтенд, FastAPI бекаенд и Functions радника за ингестију на Container Apps; опције оркестратора су Agent Framework и LangGraph. Опције базе података/претраге бирају се при распореди. Представља почетну тачку, а не крајње продукционо решење; немојте претпостављати да старије варијанте App Service-а, Semantic Kernela или Prompt Flow-а описују тренутни подразумевани модел.

**Брзи почетак**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI агенти за путовања — Мулти-агент MCP оркестрација

**Репозиторијум**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Услуге**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP сервери (.NET, Python, Java, TypeScript)

**Опис**: Референтна апликација за мулти-агентску AI оркестрацију користећи три оквира (LangChain.js, LlamaIndex.TS, и Microsoft Agent Framework). Карактеристике MCP (Model Context Protocol) сервере на четири језика распоређене као безсерверске Azure Container Apps са OpenTelemetry мониторингом.

**Брзи почетак**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Прегледајте више шаблона**: Посетите [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) за тренутно доступне шаблоне на различитим језицима и сценаријима. Сваки повезани пример је спољашњи репозиторијум, а не локални пример обезбеђен овим курсом; проверите његове тренутне предуслове и смернице за продукцију пре распоређивања.

## Следећи кораци

1. **Испробајте примере**: Почните са унапред направљеним шаблоном који одговара вашем случају коришћења
2. **Прилагодите својим потребама**: Измените инфраструктуру и код апликације
3. **Додајте мониторинг**: Имплементирајте свеобухватну посматрачност
4. **Оптимизујте трошкове**: Подесите конфигурације по свом буџету
5. **Осигурајте своју имплементацију**: Имплементирајте безбедносне шаблоне за предузећа
6. **Размножите за продукцију**: Додајте мулти-регионалне и високодоступне функције

## 🎯 Практичне вежбе

### Вежба 1: Распоредите Microsoft Foundry Models Chat апликацију (30 минута)
**Циљ**: Распоредити и тестирати AI чат референтну апликацију

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

**Критеријуми успеха:**
- [ ] Распоређивање се завршава без грешака о квоти
- [ ] Могућ приступ интерфејсу за чет у прегледачу
- [ ] Могу постављати питања и добијати одговоре уз помоћ AI
- [ ] Application Insights приказује телеметријске податке
- [ ] Ресурси успешно очишћени

**Трошак:** Прегледајте тренутни водич за трошкове и одабране SKU-ове пре распоређивања. Обрачун траје док се ресурси не обришу; нема фиксне процене од 30 минута која важи за све конфигурације.

### Вежба 2: Конфигуришите мулти-модел распоређивање (45 минута)
**Циљ**: Распоредити више AI модела са различитим конфигурацијама

**Почетна тачка:** Постојећи Azure OpenAI налог и AZD модул групе ресурса који може позвати овај фајл. Креирајте `infra/ai-models.bicep` са следећим садржајем користећи свој едитор. Неће се аутоматски распоредити само зато што се налази под `infra/`.

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

Из модула ограниченог на ресурсну групу који поседује налог, додајте позив модула (прилагодите име симбола на ваш стварни налог):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Немојте проглашавати исте распоређивања у оба модула. Ако је AZD улазна тачка ограничена на претплату, позовите ово из његовог дочерњег модула ограниченог на ресурсну групу и прилагодите релативну путању. Изграите тај модул са `az bicep build --file <path-to-containing-module>`, затим:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Критеријуми успеха:**
- [ ] Више модела успешно распоређено
- [ ] Примењене различите поставке капацитета
- [ ] Модели приступачни преко API
- [ ] Могућ позив оба модела из апликације

### Вежба 3: Имплементирајте мониторинг трошкова (20 минута)
**Циљ**: Подесити аларме буџета и праћење трошкова

**Почетна тачка:** Образац буџета горе и модул инфраструктуре ограничен на ресурсну групу. Додајте овај ресурс користећи свој едитор; проследите `budgetStartDate` из мапирања параметара (немојте дуплирати параметар ако је већ декларисан). Замените примаоца и потврдите да имате приступ за писање буџета.

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

Очекује се: одговор садржи `amount: 200`, оба прага, и вашег примаоца. Прегледајте Cost Management у порталу за стварне трошкове; подаци о трошковима су одложени и аларм не мора да се активира током кратке вежбе.

**Критеријуми успеха:**
- [ ] Буџетски аларм креиран у Azure-у
- [ ] Конфигурисане е-поште за обавештења
- [ ] Могућ преглед података о трошковима у Azure порталу
- [ ] Буџетски прагови правилно подешени

## 💡 Често Постављана Питња

<details>
<summary><strong>Како да смањим трошкове Microsoft Foundry Models током развоја?</strong></summary>

1. **Проверите ценовник**: Не постоји универзални бесплатни месечни лимит од 50,000 токена за Azure OpenAI моделе
2. **Правилно подесите капацитет**: Капацитет `10` обично представља 10,000 TPM за ове Стандард текст моделе, а не 10 TPM. Смањење овог лимита брзине не смањује цене по токену
3. **Користите azd down**: Обришите ресурсе који се могу одбацити када не развијате активно (ово није деалаокација)
4. **Кеширајте одговоре**: Имплементирајте Redis кеш за поновљене упите
5. **Користите Prompt Engineering**: Смањите коришћење токена ефикасним упитима

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Која је разлика између Microsoft Foundry Models и OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Безбедност и усаглашеност за предузећа
- Интеграција приватне мреже
- Гаранције нивоа услуге (SLA)
- Аутентификација управљаним идентитетом
- Доступни већи квоте

**OpenAI API**: Појединачни провајдер/API са својом доступношћу модела, ценама, аутентификацијом и опцијама повезивања за предузећа. Упоредите тренутне понуде уместо да претпостављате да је доступан само преко јавног интернета или да увек најпре доставља моделе.

Изаберите у складу са захтевима ваше организације; примери управљаног идентитета специфични за Azure и приватних линкова у овом курсу односе се на услуге домаћина у Azure-у, а не на сваки модел/провајдер у Foundry каталогу.
</details>

<details>
<summary><strong>Како да решим грешке о превазишлом квоти за Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Могу ли користити сопствене податке са Microsoft Foundry Models?</strong></summary>

Да! Користите **Azure AI Search** за RAG (Retrieval Augmented Generation):

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

Погледајте [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) шаблон.
</details>

<details>
<summary><strong>Како обезбедити крајње тачке AI модела?</strong></summary>

**Најбоље праксе**:
1. Користите управљани идентитет (без API кључева)
2. Омогућите приватне крајње тачке
3. Конфигуришите групе безбедности мреже
4. Имплементирајте ограничење брзине
5. Користите Azure Key Vault за тајне

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

## Заједница и подршка

- **Microsoft Foundry Discord**: [#Azure канал](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Проблеми и дискусије](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Званична документација](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry вештина на skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Инсталирајте Azure + Foundry агентске вештине у свом едитору са `npx skills add microsoft/github-copilot-for-azure`

---

**Навигација по поглављима:**
- **📚 Почетак курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - AI-путем развоја
- **⬅️ Претходно поглавље**: [Поглавље 1: Ваш први пројекат](../chapter-01-foundation/first-project.md)
- **➡️ Следеће**: [AI агенти](agents.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

**Треба вам помоћ?** Придружите се дискусијама наше заједнице или отворите проблем у репозиторијуму. Заједница Azure AI + AZD је овде да вам помогне да успете!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->