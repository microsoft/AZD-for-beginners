# Интеграција Microsoft Foundry са AZD

**Навигација кроз поглавља:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - AI-прво развијање
- **⬅️ Претходно поглавље**: [Поглавље 1: Ваш први пројекат](../chapter-01-foundation/first-project.md)
- **➡️ Следеће**: [Деплој AI модела](ai-model-deployment.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

## Преглед

Овај водич показује како да интегришете Microsoft Foundry услуге са Azure Developer CLI-јем (AZD) за поједностављене деплоје AI апликација. Microsoft Foundry пружа свеобухватну платформу за изградњу, деплој и управљање AI апликацијама, док AZD поједностављује инфраструктуру и процес деплоја.

## Шта је Microsoft Foundry?

Microsoft Foundry је једна платформа Microsoft-а за AI развој која укључује:

- **Каталог модела**: Приступ најсавременијим AI моделима
- **Prompt Flow**: Визуелни дизајнер за AI радне токове
- **Microsoft Foundry портал**: Интегрисано развојно окружење за AI апликације
- **Опције деплоја**: Више опција хостинга и скалирања
- **Безбедност и сигурност**: Уграђене функције одговорног AI

## AZD + Microsoft Foundry: Боље заједно

| Карактеристика | Microsoft Foundry | Предност интеграције са AZD |
|---------|-----------------|------------------------|
| **Деплој модела** | Ручни деплој преко портала | Аутоматизовани, понављиви деплоји |
| **Инфраструктура** | Пружање кликом | Инфраструктура као код (Bicep) |
| **Управљање окружењем** | Фокус на једном окружењу | Više okruženja (dev/staging/prod) |
| **Интеграција CI/CD** | Ограничено | Подршка за GitHub Actions нативно |
| **Управљање трошковима** | Основно праћење | Оптимизација трошкова по окружењу |

## Предуслови

- Azure претплата са одговарајућим дозволама
- Инсталиран Azure Developer CLI
- Приступ Microsoft Foundry Models услугама
- Основно познавање Microsoft Foundry

> **Тренутна AZD верзија:** Ови примери су проверени са `azd` `1.27.1`. За AI agent радни ток користите актуелно preview издање екстензије и проверите верзију пре него што почнете.

## Основни интеграциони шаблони

### Шаблон 1: Интеграција Microsoft Foundry Models

**Примена**: Деплој чат апликација са Microsoft Foundry Models моделима

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

### Шаблон 2: AI претрага + RAG интеграција

**Примена**: Деплој апликација заснованих на retrieval-augmented generation (RAG)

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

### Шаблон 3: Интеграција докумената интелигенције

**Примена**: Радни токови за обраду и анализу докумената

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

## 🔧 Конфигурациони шаблони

### Подешавање променљивих окружења

**Конфигурација за продукцију:**
```bash
# Основне AI услуге
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Конфигурације модела
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Подешавања перформанси
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Конфигурација за развој:**
```bash
# Подешавања оптимизована за трошкове за развој
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Бесплатни ниво
```

### Сигурна конфигурација са Key Vault

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

## Радни токови деплоја

### AZD екстензије за Foundry

AZD пружа екстензије које додају AI-специфичне могућности за рад са Microsoft Foundry услугама:

```bash
# Инсталирајте проширење агената Foundry
azd extension install azure.ai.agents

# Инсталирајте проширење за фино подешавање
azd extension install azure.ai.finetune

# Инсталирајте проширење за прилагођене моделе
azd extension install azure.ai.models

# Прикажи листу инсталираних проширења
azd extension list --installed

# Испитај тренутно инсталирану верзију проширења агента
azd extension show azure.ai.agents
```

AI екстензије су још увек у брзом развоју као preview. Ако нека команда функционише другачије него овде описано, надоградите одговарајућу екстензију пре него што решавате проблеме у пројекту.

### Деплој прво-аитента са `azd ai`

Ако имате manifest агента, користите `azd ai agent init` за scaffold-овање пројекта повезаног са Foundry Agent сервисом:

```bash
# Иницијализуј из манифеста агента
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Деплоји на Ајзуре
azd up
```

Недавна preview издања `azure.ai.agents` су додала и подршку за иницијализацију базирану на шаблонима у `azd ai agent init`. Ако пратите новије примере агената, проверите упутство за екстензију за тачне аргументе доступне у вашој инсталираној верзији.

Погледајте [AZD AI CLI команде](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) за пуну референцу команда и аргумената.

### Деплој једном командом

```bash
# Распоредите све са једном командом
azd up

# Или распореди постепено
azd provision  # Само инфраструктура
azd deploy     # Само апликација

# За дуготрајне распореде AI апликација у azd 1.23.11+
azd deploy --timeout 1800
```

### Деплоји специфични за окружења

```bash
# Средина за развој
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Производна средина
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Надгледање и посматрање

### Интеграција са Application Insights

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

### Праћење трошкова

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

### Конфигурација аутоматског скалирања

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

### Проблем 1: Прекорачење квоте за OpenAI

**Симптоми:**
- Деплој се не извршава због грешака везаних за квоту
- 429 грешака у логовима апликације

**Решења:**
```bash
# Проверите тренутну потрошњу квоте
az cognitiveservices usage list --location eastus

# Покушајте другу регију
azd env set AZURE_LOCATION westus2
azd up

# Привремено смањите капацитет
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Проблем 2: Неуспешна аутентикација

**Симптоми:**
- 401/403 грешке приликом позива AI услуга
- Поруке "Access denied"

**Решења:**
```bash
# Проверите додељивања улога
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Проверите конфигурацију управљаног идентитета
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Потврдите приступ Key Vault-у
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Проблем 3: Проблеми са деплојем модела

**Симптоми:**
- Модели нису доступни у деплоју
- Неуспешне одређене верзије модела

**Решења:**
```bash
# Листа доступних модела по регионима
az cognitiveservices model list --location eastus

# Ажурирати верзију модела у бајп шаблону
# Проверити потребе за капацитетом модела
```

## Пример шаблона

### RAG Чат апликација (Python)

**Репозиторијум**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Услуге**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Опис**: Најпопуларнији Azure AI пример — RAG чат апликација спремна за продукцију која вам омогућава да постављате питања на основу својих докумената. Користи GPT-4.1-mini за чат, text-embedding-3-large за уграђивање и Azure AI Search за пребацивање. Подржава мултимодалне документе, гласовни улаз/излаз, Microsoft Entra аутентификацију и праћење преко Application Insights.

**Брзи почетак**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Чат апликација (.NET)

**Репозиторијум**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Услуге**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Опис**: .NET/C# еквивалент Python RAG чат примера. Изграђен са ASP.NET Core Minimal API и Blazor WebAssembly frontend-ом. Укључује гласовни чат, GPT-4o-mini vision подршку и пратиоца .NET MAUI Blazor Hybrid desktop/mobile клијента.

**Брзи почетак**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Чат апликација (Java)

**Репозиторијум**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Услуге**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Опис**: Java верзија RAG чат примера користећи Langchain4J за AI оркестрацију. Подржава микросервисну event-driven архитектуру, више стратегија претраге (текст, вектор, хибрид), отпремање докумената са Azure Document Intelligence и деплој на Azure Container Apps или Azure Kubernetes Service.

**Брзи почетак**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot са Microsoft Foundry

**Репозиторијум**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Услуге**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Опис**: Цела ритейл RAG copilot користећи Microsoft Foundry и Prompty. Contoso Outdoor ритейлера chatbot који оснива одговоре на каталогу производа и подацима о корисничким наруџбинама. Демонстрира цео GenAIOps радни ток — прототипирање са Prompty-ом, процена са AI асистентима и деплој са AZD на Container Apps.

**Брзи почетак**:
```bash
azd init --template contoso-chat
azd up
```

### Креативна мулти-агент апликација

**Репозиторијум**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Услуге**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Опис**: Мулти-агент пример који демонстрира оркестрацију AI агената са Prompty. Користи истраживачког агента (Bing Grounding у Azure AI Agent Service), продукт агента (Azure AI Search), писца и уредника агента за заједничко креирање добрo истражених чланака. Укључује CI/CD са проценом преко GitHub Actions.

**Брзи почетак**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Серверлесс RAG Чат (JavaScript/TypeScript)

**Репозиторијум**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Услуге**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB за NoSQL + LangChain.js

**Опис**: Потпуно серверлесс RAG chatbot коришћењем LangChain.js са Azure Functions за API и Azure Static Web Apps за хостинг. Користи Azure Cosmos DB као и складиште вектора и базу података за историју чата. Подржава локални развој са Ollama за тестирање без трошкова.

**Брзи почетак**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Акцелератор решења Чат са вашим подацима

**Репозиторијум**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Услуге**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Опис**: Решење акцелератора RAG класе ентерпрајз уз админ портал за отпремање и управљање документима, више опција оркестратора (Semantic Kernel, LangChain, Prompt Flow), претварање говора у текст, интеграцију са Microsoft Teams и избор између PostgreSQL или Cosmos DB базе. Дизајниран као прилагодљив полазни основ за продукцијске RAG сценарије.

**Брзи почетак**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI туристички агенти — Мулти-Агент MCP Оркестрација

**Репозиторијум**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Услуге**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP сервери (.NET, Python, Java, TypeScript)

**Опис**: Референцијална апликација за мулти-агент оркестрацију AI користећи три оквира (LangChain.js, LlamaIndex.TS, и Microsoft Agent Framework). Укључује MCP (Model Context Protocol) сервере на четири језика који се деплоју као серверлесс Azure Container Apps са OpenTelemetry мониторингом.

**Брзи почетак**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Стартер

**Репозиторијум**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Услуге**: Azure AI Services + Azure OpenAI

**Опис**: Минимални Bicep шаблон који деплојује Azure AI услуге са конфигурисаним моделима машинског учења. Лаган почетни корак када вам је потребна само Azure AI инфраструктура без комплетног стека апликација.

**Брзи почетак**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Прегледајте више шаблона**: Посетите [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) за више од 80 AZD шаблона специфичних за AI на различитим језицима и сценаријима.

## Следећи кораци

1. **Испробајте примере**: Почните са већ припремљеним шаблоном који одговара вашој употреби
2. **Прилагодите својим потребама**: Модификујте инфраструктуру и код апликације
3. **Додајте надгледање**: Имплементирајте свеобухватну посматрање
4. **Оптимизујте трошкове**: Финесирајте конфигурације према свом буџету
5. **Осигурајте деплој**: Имплементирајте ентерпрајз безбедносне шаблоне
6. **Скалирајте до продукције**: Додајте мултирегионалне и високе расположивости функције

## 🎯 Вежбе за праксу

### Вежба 1: Деплој Microsoft Foundry Models Чат апликације (30 минута)
**Циљ**: Деплој и тестирање продукцијски спремне AI чат апликације

```bash
# Иницијализуј шаблон
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Подеси променљиве окружења
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Објави
azd up

# Тестирај апликацију
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Прати АI операције
azd monitor

# Очисти
azd down --force --purge
```

**Критеријуми успеха:**
- [ ] Деплој се завршава без грешака у квоти
- [ ] Може се приступити интерфејсу за ћаскање у прегледачу
- [ ] Могу се постављати питања и добијати AI-подржани одговори
- [ ] Application Insights приказује телеметријске податке
- [ ] Ресурси су успешно очишћени

**Процењени трошак**: 5-10 долара за 30 минута тестирања

### Вежба 2: Конфигурисање мулти-модел деплоја (45 минута)
**Циљ**: Деплој више AI модела са различитим конфигурацијама

```bash
# Креирај прилагођену Бицеп конфигурацију
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

# Депложи и провери
azd provision
azd show
```

**Критеријуми успеха:**
- [ ] Више модела је успешно деплојирано
- [ ] Примењене су различите поставке капацитета
- [ ] Модели су доступни преко API-ја
- [ ] Могу се позвати оба модела из апликације

### Вежба 3: Имплементација праћења трошкова (20 минута)
**Циљ**: Подешавање буџетских упозорења и праћења трошкова

```bash
# Додај упозорење о буџету у Bicep
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

# Пошаљи упозорење о буџету
azd provision

# Провери тренутне трошкове
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Критеријуми успеха:**
- [ ] Буџетско упозорење је креирано у Azure-у
- [ ] Конфигурисане су email нотификације
- [ ] Могуће је прегледати трошкове у Azure порталу
- [ ] Праг буџета је адекватно подешен

## 💡 Често постављана питања

<details>
<summary><strong>Како могу да смањим трошкове Microsoft Foundry Models током развоја?</strong></summary>

1. **Користите бесплатни ниво**: Microsoft Foundry Models нуди 50,000 токена месечно бесплатно
2. **Смањите капацитет**: Поставите капацитет на 10 TPM уместо 30+ за развој
3. **Користите azd down**: Деактивирајте ресурсе када не развијате активно
4. **Кеширајте одговоре**: Имплементирајте Redis кеш за понављане упите
5. **Користите Prompt Engineering**: Смањите употребу токена ефикасним упитима


```bash
# Конфигурација за развој
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Која је разлика између Microsoft Foundry модела и OpenAI API-ја?</strong></summary>

**Microsoft Foundry модели**:
- Безбедност и усаглашеност на нивоу предузећа
- Интеграција приватне мреже
- Гаранције СЛА
- Аутентикација управљаног идентитета
- Доступни већи квоти

**OpenAI API**:
- Бржи приступ новим моделима
- Једноставнија подешавања
- Нижа баријера за улазак
- Само јавни интернет

За продукционе апликације, **препоручује се Microsoft Foundry модели**.
</details>

<details>
<summary><strong>Како да решим грешке везане за прекорачење квоте у Microsoft Foundry моделима?</strong></summary>

```bash
# Проверите тренутну квоту
az cognitiveservices usage list --location eastus2

# Покушајте другу регију
azd env set AZURE_LOCATION westus2
azd up

# Привремено смањите капацитет
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Затражите повећање квоте
# Идите на Azure портал > Квоте > Затражите повећање
```
</details>

<details>
<summary><strong>Могу ли да користим своје податке са Microsoft Foundry моделима?</strong></summary>

Да! Користите **Azure AI Search** за RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Погледајте [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) шаблон.
</details>

<details>
<summary><strong>Како да обезбедим AI модел крајње тачке?</strong></summary>

**Најбоље праксе**:
1. Користите Управљани идентитет (без API кључева)
2. Омогућите Приватне крајње тачке
3. Конфигуришите групе мрежне безбедности
4. Имплементирајте ограничење брзине приступа
5. Користите Azure Key Vault за тајне податке

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
- **Agent Skills**: [Microsoft Foundry вештина на skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Инсталирајте Azure + Foundry agent вештине у вашем едитор-у помоћу `npx skills add microsoft/github-copilot-for-azure`

---

**Навигација кроз поглавља:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - AI-Први развој
- **⬅️ Претходно поглавље**: [Поглавље 1: Ваш први пројекат](../chapter-01-foundation/first-project.md)
- **➡️ Следеће**: [Распоређивање AI модела](ai-model-deployment.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

**Треба вам помоћ?** Придружите се дискусијама у заједници или отворите проблем у репозиторијуму. Azure AI + AZD заједница је ту да вам помогне да успете!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->