# Интеграција Microsoft Foundry са AZD

**Наведба поглавља:**
- **📚 Почетак курса**: [AZD For Beginners](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - Развој вођен вештачком интелигенцијом
- **⬅️ Претходно поглавље**: [Поглавље 1: Ваш први пројекат](../chapter-01-foundation/first-project.md)
- **➡️ Следеће**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

## Преглед

Овај водич показује како да интегришете Microsoft Foundry сервисе са Azure Developer CLI (AZD) за поједностављене деплоје AI апликација. Microsoft Foundry пружа свеобухватну платформу за креирање, деплој и управљање AI апликацијама, док AZD поједностављује инфраструктуру и процес деплоирања.

## Шта је Microsoft Foundry?

Microsoft Foundry је јединствена Microsoft платформа за развој AI која укључује:

- **Каталог модела**: Приступ најсавременијим AI моделима
- **Prompt Flow**: Визуелни дизајнер за AI радне токове
- **Microsoft Foundry портал**: Интегрисано развојно окружење за AI апликације
- **Опције деплоја**: Различите опције хостинга и скалирања
- **Безбедност и сигурност**: Уграђене функције одговорног AI

## AZD + Microsoft Foundry: Боље заједно

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Ручно преко портала | Аутоматизована, поновљива деплојања |
| **Infrastructure** | Провизионисање кликом | Инфраструктура као код (Bicep) |
| **Environment Management** | Фокус на једном окружењу | Више окружења (dev/staging/prod) |
| **CI/CD Integration** | Ограничено | Нативна подршка за GitHub Actions |
| **Cost Management** | Основно праћење | Оптимизација трошкова по окружењу |

## Захтеви

- Azure претплата са одговарајућим дозволама
- Инсталиран Azure Developer CLI
- Приступ Microsoft Foundry Models сервисима
- Основно познавање Microsoft Foundry

> **Тренутна AZD база:** Ови примери су прегледани против `azd` `1.23.12`. За AI agent радни ток, користите тренутно preview издање екстензије и проверите вашу инсталирану верзију пре него што почнете.

## Основни обрасци интеграције

### Образац 1: Интеграција Microsoft Foundry Models

**Случај употребе**: Деплој апликација за ћаскање са Microsoft Foundry Models моделима

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

### Образац 2: AI Search + RAG интеграција

**Случај употребе**: Деплој апликација за retrieval-augmented generation (RAG)

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

### Образац 3: Интеграција Document Intelligence

**Случај употребе**: Радни токови за обраду и анализу докумената

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

**Продукциона конфигурација:**
```bash
# Основне услуге вештачке интелигенције
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

**Развојна конфигурација:**
```bash
# Подешавања оптимизована у погледу трошкова за развој
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Бесплатно ниво
```

### Безбедна конфигурација помоћу Key Vault

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

AZD пружа екстензије које додају AI-специфичне могућности за рад са Microsoft Foundry сервисима:

```bash
# Инсталирајте проширење Foundry агената
azd extension install azure.ai.agents

# Инсталирајте проширење за фино подешавање
azd extension install azure.ai.finetune

# Инсталирајте проширење за прилагођене моделе
azd extension install azure.ai.models

# Прикажите инсталирана проширења
azd extension list --installed

# Инспектујте тренутно инсталирану верзију проширења за агенте
azd extension show azure.ai.agents
```

AI екстензије су још у брзом развоју у preview стадијуму. Ако команда ради другачије него што је овде приказано, ажурирајте релевантну екстензију пре него што решавате проблеме са пројектом.

### Деплој усмерен на агенте помоћу `azd ai`

Ако имате agent manifest, користите `azd ai agent init` да бисте скелетонизовали пројекат повезан са Foundry Agent Service:

```bash
# Иницијализовати из манифеста агента
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Разместити на Azure
azd up
```

Ново preview издање `azure.ai.agents` такође је додало подршку за иницијализацију засновану на шаблонима за `azd ai agent init`. Ако пратите новије агент примере, проверите помоћ екстензије за тачне флагове доступне у вашој инсталираној верзији.

Погледајте [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) за пун референт командни списак и флагове.

### Деплој једном командом

```bash
# Разместите све једном командом
azd up

# Или постепено разместите
azd provision  # Само инфраструктура
azd deploy     # Само апликација

# За дуготрајно распоређивање AI апликација у azd 1.23.11+
azd deploy --timeout 1800
```

### Деплоји специфични за окружења

```bash
# Развојно окружење
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Продукционо окружење
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Мониторинг и опсервабилност

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

## 🔐 Најбоље безбедносне праксе

### Подешавање Managed Identity

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

### Подешавање аутоматског скалирања

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

### Проблем 1: Прекорачен OpenAI квота

**Симптоми:**
- Деплој не успева са грешкама квоте
- 429 грешке у логовима апликације

**Решења:**
```bash
# Проверите тренутну употребу квоте
az cognitiveservices usage list --location eastus

# Пробајте другу регију
azd env set AZURE_LOCATION westus2
azd up

# Привремено смањите капацитет
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Проблем 2: Аутентификациони неуспеси

**Симптоми:**
- 401/403 грешке приликом позива AI сервиса
- Поруке "Приступ одбијен"

**Решења:**
```bash
# Проверите доделе улога
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Проверите конфигурацију управљеног идентитета
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Потврдите приступ Key Vault-у
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Проблем 3: Проблеми са деплојом модела

**Симптоми:**
- Модели нису доступни у деплоју
- Пojedinačne верзије модела не успевају

**Решења:**
```bash
# Прикажи доступне моделе по регионима
az cognitiveservices model list --location eastus

# Ажурирај верзију модела у bicep шаблону
# Провери захтеве за капацитет модела
```

## Пример шаблона

### RAG чат апликација (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Сервиси**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Опис**: Најпопуларнији Azure AI пример — продукционo спремна RAG чат апликација која вам омогућава да постављате питања у вези са вашим документима. Користи GPT-4.1-mini за ћаскање, text-embedding-3-large за embeddings и Azure AI Search за retrieval. Подржава мултимодалне документе, унос/излаз говора, Microsoft Entra аутентификацију и трасирање преко Application Insights.

**Брзи почетак**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG чат апликација (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Сервиси**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Опис**: .NET/C# еквиваленат Python RAG chat примера. Изграђен са ASP.NET Core Minimal API и Blazor WebAssembly фронтендом. Укључује voice chat, GPT-4o-mini визион подршку и пратилац .NET MAUI Blazor Hybrid десктоп/мобилни клијент.

**Брзи почетак**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG чат апликација (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Сервиси**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Опис**: Java верзија RAG chat примера која користи Langchain4J за AI оркестрацију. Подржава микросервисну, event-driven архитектуру, више стратегија претраге (text, vector, hybrid), отпремање докумената помоћу Azure Document Intelligence и деплој на Azure Container Apps или Azure Kubernetes Service.

**Брзи почетак**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot са Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Сервиси**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Опис**: Енд-то-енд малопродајни RAG copilot који користи Microsoft Foundry и Prompty. Contoso Outdoor трговачки четбот који утерује одговоре у податке каталога производа и податке о куповинама корисника. Демонстрира цео GenAIOps радни ток — прототипирање са Prompty, евалуацију уз AI-помоћ, и деплој путем AZD у Container Apps.

**Брзи почетак**:
```bash
azd init --template contoso-chat
azd up
```

### Мулти-агент апликација за креативно писање

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Сервиси**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Опис**: Мулти-агент пример који демонстрира оркестрацију AI агената уз Prompty. Користи research агента (Bing Grounding у Azure AI Agent Service), product агента (Azure AI Search), писца агента и уредника агента за заједничко креирање добро истражених чланака. Укључује CI/CD са евалуацијом у GitHub Actions.

**Брзи почетак**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Сервиси**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB за NoSQL + LangChain.js

**Опис**: Потпуно серверлес RAG четбот користећи LangChain.js са Azure Functions за API и Azure Static Web Apps за хостинг. Користи Azure Cosmos DB као векторско складиште и базу историје ћаскања. Подржава локални развој са Ollama за тестирање без трошкова.

**Брзи почетак**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Сервиси**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Опис**: Решење-акслератор за RAG у корпоративном окружењу са админ порталом за отпремање/управљање документима, више опција оркестраторa (Semantic Kernel, LangChain, Prompt Flow), speech-to-text, интеграцијом са Microsoft Teams и избором PostgreSQL или Cosmos DB као бекенда. Дизајнирано као прилагодљив почетни пункт за продукцијске RAG сценарије.

**Брзи почетак**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP оркестрација

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Сервиси**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Опис**: Референтна апликација за мулти-агентну AI оркестрацију користећи три фрејмворка (LangChain.js, LlamaIndex.TS и Microsoft Agent Framework). Карактерише MCP (Model Context Protocol) сервере у четири језика деплојоване као serverless Azure Container Apps са OpenTelemetry мониторингом.

**Брзи почетак**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Сервиси**: Azure AI Services + Azure OpenAI

**Опис**: Минималан Bicep шаблон који деплојује Azure AI сервисе са конфигурисаним машинским моделима. Лаган почетни тандем када вам је потребна само обезбеђена Azure AI инфраструктура без целог апликативног стекa.

**Брзи почетак**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Прегледајте више шаблона**: Посетите [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) за преко 80 AI-специфичних AZD шаблона на различитим језицима и сценаријима.

## Следећи кораци

1. **Испробајте примере**: Почните са унапред направљеним шаблоном који одговара вашем случају употребе
2. **Прилагодите својим потребама**: Модификујте инфраструктуру и код апликације
3. **Додајте мониторинг**: Имплементирајте свеобухватну опсервабилност
4. **Оптимизујте трошкове**: Подешавајте конфигурације према вашем буџету
5. **Осигурајте деплој**: Имплементирајте корпоративне безбедносне обрасце
6. **Скалирајте за продукцију**: Додајте мулти-регион и високу доступност

## 🎯 Практични задатци

### Задатак 1: Деплој Microsoft Foundry Models чат апликације (30 минута)
**Циљ**: Деплој и тест производно-спремне AI чат апликације

```bash
# Иницијализуј шаблон
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Постави променљиве окружења
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Распореди
azd up

# Тестирај апликацију
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Надгледај операције вештачке интелигенције
azd monitor

# Очисти
azd down --force --purge
```

**Критеријуми успеха:**
- [ ] Деплој се заврши без грешака квоте
- [ ] Могућ приступ интерфејсу ћаскања у прегледачу
- [ ] Могуће је постављати питања и добијати AI-подржане одговоре
- [ ] Application Insights приказује телеметријске податке
- [ ] Ресурси су успешно очишћени

**Процењени трошак**: $5-10 за 30 минута тестирања

### Задатак 2: Конфигуришите мулти-модел деплој (45 минута)
**Циљ**: Деплојујте више AI модела са различитим конфигурацијама

```bash
# Креирање прилагођене Bicep конфигурације
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

# Распоређивање и провера
azd provision
azd show
```

**Критеријуми успеха:**
- [ ] Више модела успешно деплојовано
- [ ] Примењена различита подешавања капацитета
- [ ] Модели доступни преко APIја
- [ ] Могуће позивати оба модела из апликације

### Задатак 3: Имплементирајте праћење трошкова (20 минута)
**Циљ**: Подешавање обавештења о буџету и праћење трошкова

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

# Размести упозорење о буџету
azd provision

# Провери тренутне трошкове
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Критеријуми успеха:**
- [ ] Буџетско обавештење креирано у Azure
- [ ] Конфигурисана email обавештења
- [ ] Могућ преглед података о трошковима у Azure порталу
- [ ] Праг буџета адекватно постављен

## 💡 Често постављана питања

<details>
<summary><strong>Како да смањим трошкове Microsoft Foundry Models током развоја?</strong></summary>

1. **Користите бесплатни ниво**: Microsoft Foundry Models нуди 50,000 токена месечно бесплатно
2. **Смањите капацитет**: Поставите капацитет на 10 TPM уместо 30+ за развој
3. **Користите azd down**: Деаллоцирајте ресурсе када не развијате активно
4. **Кеширајте одговоре**: Имплементирајте Redis кеш за поновљене упите
5. **Примените Prompt Engineering**: Смањите употребу токена ефикасним упитима


```bash
# Конфигурација за развој
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Која је разлика између Microsoft Foundry Models и OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Корпоративна безбедност и усаглашеност
- Интеграција приватне мреже
- Гаранције у оквиру SLA
- Аутентификација управљеног идентитета
- Доступне веће квоте

**OpenAI API**:
- Бржи приступ новим моделима
- Једноставније подешавање
- Нижа баријера за улазак
- Само преко јавног интернета

За продукцијске апликације, **Microsoft Foundry Models is recommended**.
</details>

<details>
<summary><strong>Како да поступим када су квоте Microsoft Foundry Models прекорачене?</strong></summary>

```bash
# Проверите тренутну квоту
az cognitiveservices usage list --location eastus2

# Пробајте другу регију
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
<summary><strong>Могу ли да користим своје податке са Microsoft Foundry Models?</strong></summary>

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

Погледајте шаблон [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Како да обезбедим ендпоинте AI модела?</strong></summary>

**Најбоље праксе**:
1. Користите Managed Identity (без API кључева)
2. Омогућите Private Endpoints
3. Конфигуришите групе за мрежну безбедност
4. Успоставите ограничење брзине захтева
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
- **AZD GitHub**: [Issues и дискусије](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Званична документација](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill на skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Инсталирајте Azure + Foundry agent skills у вашем уређивачу помоћу `npx skills add microsoft/github-copilot-for-azure`

---

**Навигација поглавља:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - AI-First Development
- **⬅️ Претходно поглавље**: [Поглавље 1: Ваш први пројекат](../chapter-01-foundation/first-project.md)
- **➡️ Следеће**: [Распоређивање AI модела](ai-model-deployment.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

**Потребна помоћ?** Придружите се нашим дискусијама у заједници или отворите issue у репозиторијуму. Заједница Azure AI + AZD је овде да вам помогне да успете!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->