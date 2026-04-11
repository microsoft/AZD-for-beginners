# Интеграция на Microsoft Foundry с AZD

**Навигация в глава:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 2 - AI-първо разработване
- **⬅️ Предишна глава**: [Глава 1: Вашият първи проект](../chapter-01-foundation/first-project.md)
- **➡️ Следваща**: [Деплойване на AI модел](ai-model-deployment.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

## Преглед

Това ръководство демонстрира как да интегрирате Microsoft Foundry услуги с Azure Developer CLI (AZD) за оптимизирано разгръщане на AI приложения. Microsoft Foundry предоставя цялостна платформа за изграждане, разгръщане и управление на AI приложения, докато AZD опростява инфраструктурата и процеса на разгръщане.

## Какво е Microsoft Foundry?

Microsoft Foundry е обединена платформа на Microsoft за разработка на AI, която включва:

- **Каталог на модели**: Достъп до най-съвременни AI модели
- **Prompt Flow**: Визуален дизайнер за AI работни потоци
- **Портал Microsoft Foundry**: Интегрирана среда за разработка на AI приложения
- **Опции за разгръщане**: Множество опции за хостинг и скалиране
- **Сигурност и безопасност**: Вградени функции за отговорен AI

## AZD + Microsoft Foundry: По-добре заедно

| Функция | Microsoft Foundry | Предимство на интеграцията с AZD |
|---------|-----------------|------------------------|
| **Разгръщане на модели** | Ръчно разгръщане през портала | Автоматизирани, повторяеми разгръщания |
| **Инфраструктура** | Предоставяне с кликове | Инфраструктура като код (Bicep) |
| **Управление на среди** | Фокус върху една среда | Мулти-среда (dev/staging/prod) |
| **CI/CD интеграция** | Ограничена | Родна поддръжка на GitHub Actions |
| **Управление на разходите** | Основен мониторинг | Оптимизация на разходите по среди |

## Предварителни изисквания

- Абонамент за Azure с подходящи права
- Инсталиран Azure Developer CLI
- Достъп до услуги Microsoft Foundry Models
- Основни познания за Microsoft Foundry

> **Текуща базова линия на AZD:** Тези примери са прегледани спрямо `azd` `1.23.12`. За работния поток на AI агент използвайте текущото предварително издание на разширението и проверете инсталираната версия преди да започнете.

## Основни интеграционни модели

### Модел 1: Интеграция с Microsoft Foundry Models

**Сценарий**: Разгръщане на чат приложения с модели Microsoft Foundry Models

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

### Модел 2: Интеграция AI търсене + RAG

**Сценарий**: Разгръщане на приложения за генерация с подсилено извличане (RAG)

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

### Модел 3: Интеграция Document Intelligence

**Сценарий**: Работни потоци за обработка и анализ на документи

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

## 🔧 Модели за конфигуриране

### Настройка на променливи на средата

**Конфигурация за продукция:**
```bash
# Основни AI услуги
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Конфигурации на моделите
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Настройки за производителност
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Конфигурация за развитие:**
```bash
# Оптимизирани за разходи настройки за разработка
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Безплатен план
```

### Сигурна конфигурация с Key Vault

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

## Работни потоци за разгръщане

### Разширения AZD за Foundry

AZD предоставя разширения, които добавят AI-специфични възможности за работа с Microsoft Foundry услуги:

```bash
# Инсталирайте добавката Foundry agents
azd extension install azure.ai.agents

# Инсталирайте добавката за фина настройка
azd extension install azure.ai.finetune

# Инсталирайте добавката за персонализирани модели
azd extension install azure.ai.models

# Избройте инсталираните добавки
azd extension list --installed

# Прегледайте текущата версия на инсталираната добавка за агенти
azd extension show azure.ai.agents
```

AI разширенията все още се развиват бързо в предварителната версия. Ако команда се държи различно от показаното тук, обновете релевантното разширение преди да отстранявате проблеми с проекта.

### Разгръщане с приоритет на агент с `azd ai`

Ако имате агент манифест, използвайте `azd ai agent init`, за да създадете проект, свързан с Foundry Agent Service:

```bash
# Инициализиране от манифест на агент
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Разгръщане в Azure
azd up
```

Последните предварителни версии на `azure.ai.agents` също добавиха поддръжка за шаблонно инициализиране на `azd ai agent init`. Ако следвате по-нови примери с агенти, проверете помощта на разширението за точните налични флагове във вашата инсталирана версия.

Вижте [AZD AI CLI Команди](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) за пълна референция на командите и флаговете.

### Разгръщане с една команда

```bash
# Разгръщайте всичко с една команда
azd up

# Или разгръщайте поетапно
azd provision  # Само инфраструктура
azd deploy     # Само приложение

# За дълготрайни разгръщания на AI приложения в azd 1.23.11+
azd deploy --timeout 1800
```

### Специфични за среда разгръщания

```bash
# Среда за разработка
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Производствена среда
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Мониторинг и наблюдение

### Интеграция с Application Insights

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

### Мониторинг на разходите

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

## 🔐 Най-добри практики за сигурност

### Конфигурация на управлявана идентичност

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

### Мрежова сигурност

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

## Оптимизация на производителността

### Стратегии за кеширане

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

### Конфигурация за автоскалиране

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

## Отстраняване на често срещани проблеми

### Проблем 1: Превишена квота OpenAI

**Симптоми:**
- Разгръщането се проваля с грешки за квота
- 429 грешки в логовете на приложението

**Решения:**
```bash
# Проверете текущото използване на квотата
az cognitiveservices usage list --location eastus

# Опитайте различен регион
azd env set AZURE_LOCATION westus2
azd up

# Намалете капацитета временно
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Проблем 2: Провали при автентикация

**Симптоми:**
- 401/403 грешки при извикване на AI услуги
- Съобщения "Достъпът е отказан"

**Решения:**
```bash
# Проверете разпределението на ролите
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Проверете конфигурацията на управляваната идентичност
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Потвърдете достъпа до Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Проблем 3: Проблеми с разгръщане на модели

**Симптоми:**
- Модели не са налични в разгръщането
- Специфични версии на модели не работят

**Решения:**
```bash
# Избройте наличните модели по регион
az cognitiveservices model list --location eastus

# Актуализирайте версията на модела в шаблона bicep
# Проверете изискванията за капацитет на модела
```

## Примерни шаблони

### RAG чат приложение (Python)

**Репозитория**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Услуги**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Описание**: Най-популярният пример на Azure AI — чат приложение с готовност за продукция, което ви позволява да задавате въпроси върху ваши собствени документи. Използва GPT-4.1-mini за чат, text-embedding-3-large за вграждания и Azure AI Search за извличане. Поддържа мултимодални документи, гласов вход/изход, Microsoft Entra автентикация и Application Insights проследяване.

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG чат приложение (.NET)

**Репозитория**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Услуги**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Описание**: .NET/C# еквивалент на Python RAG чат пример. Изграден с ASP.NET Core Minimal API и Blazor WebAssembly фронтенд. Включва гласов чат, поддръжка на GPT-4o-mini за визуализация и спомагателен .NET MAUI Blazor Hybrid десктоп/мобилен клиент.

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG чат приложение (Java)

**Репозитория**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Услуги**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Описание**: Java версия на RAG чат пример, използващ Langchain4J за AI оркестрация. Поддържа микроуслуги с евент-дривън архитектура, множество стратегии за търсене (текст, вектор, хибрид), качване на документи с Azure Document Intelligence и разгръщане на Azure Container Apps или Azure Kubernetes Service.

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Корпоративен търговски копилот с Azure AI Foundry

**Репозитория**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Услуги**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Описание**: Край до край търговски RAG копилот, използващ Azure AI Foundry и Prompty. Чатбот на Contoso Outdoor, който основава отговорите си на каталог продукти и данни за клиентски поръчки. Демонстрира пълния GenAIOps работен процес — прототипиране с Prompty, оценка с AI подпомогнати оценители и разгръщане чрез AZD към Container Apps.

**Бърз старт**:
```bash
azd init --template contoso-chat
azd up
```

### Многоагентно приложение за творческо писане

**Репозитория**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Услуги**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Описание**: Многоагентен пример, демонстриращ AI оркестрация с Prompty. Използва изследователски агент (Bing Grounding в Azure AI Agent Service), продуктов агент (Azure AI Search), писател агент и редактор агент за съвместно създаване на добре изследвани статии. Включва CI/CD с оценка в GitHub Actions.

**Бърз старт**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Безсървърно RAG чат (JavaScript/TypeScript)

**Репозитория**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Услуги**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB за NoSQL + LangChain.js

**Описание**: Изцяло безсървърно RAG чатбот приложение с LangChain.js, използващо Azure Functions за API и Azure Static Web Apps за хостинг. Използва Azure Cosmos DB като векторно хранилище и база данни за история на чата. Поддържа локално разработване с Ollama за тестване без разходи.

**Бърз старт**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Ускорител за решение Chat with Your Data

**Репозитория**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Услуги**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Описание**: Корпоративен RAG ускорител с админ портал за качване/управление на документи, множество опции за оркестрация (Semantic Kernel, LangChain, Prompt Flow), реч към текст, интеграция с Microsoft Teams и избор между PostgreSQL или Cosmos DB бекенд. Проектиран като персонализируема изходна точка за продукционни RAG сценарии.

**Бърз старт**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI агентите за пътувания — Многоагентна MCP оркестрация

**Репозитория**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Услуги**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP сървъри (.NET, Python, Java, TypeScript)

**Описание**: Референтно приложение за многоагентна AI оркестрация, използващо три фреймуърка (LangChain.js, LlamaIndex.TS и Microsoft Agent Framework). Включва MCP (Model Context Protocol) сървъри на четири езика, разположени като безсървърни Azure Container Apps с OpenTelemetry мониторинг.

**Бърз старт**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Репозитория**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Услуги**: Azure AI услуги + Azure OpenAI

**Описание**: Минимален Bicep шаблон, който разгръща Azure AI услуги с конфигурирани машинно обучени модели. Лекият старт, когато имате нужда само от инфраструктурата на Azure AI без пълна стека приложение.

**Бърз старт**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Прегледайте повече шаблони**: Посетете [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) за над 80 AI-специфични AZD шаблони на различни езици и сценарии.

## Следващи стъпки

1. **Изпробвайте примерите**: Започнете с предварително направен шаблон, който отговаря на вашия случай
2. **Персонализирайте според нуждите**: Модифицирайте инфраструктурата и кода на приложението
3. **Добавете мониторинг**: Внедрете цялостна наблюдаемост
4. **Оптимизирайте разходите**: Настройте конфигурациите за вашия бюджет
5. **Защитете разгръщането си**: Използвайте корпоративни модели за сигурност
6. **Мащабирайте за продукция**: Добавете мултирегионални и високодостъпни функции

## 🎯 Практически упражнения

### Упражнение 1: Разгръщане на чат приложение с Microsoft Foundry Models (30 минути)
**Цел**: Разгърнете и тествайте AI чат приложение готово за продукция

```bash
# Инициализиране на шаблона
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Задаване на променливи на средата
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Разгръщане
azd up

# Тествайте приложението
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Мониторинг на AI операциите
azd monitor

# Почистване
azd down --force --purge
```

**Критерии за успех:**
- [ ] Разгръщането завършва без грешки за квота
- [ ] Може да достъпите чат интерфейса в браузъра
- [ ] Може да задавате въпроси и получавате AI отговори
- [ ] Application Insights показва телеметрични данни
- [ ] Ресурсите са успешно почистени

**Приблизителна цена**: $5-10 за 30 минути тестване

### Упражнение 2: Конфигуриране на мултимоделно разгръщане (45 минути)
**Цел**: Разгърнете няколко AI модели с различни конфигурации

```bash
# Създаване на персонализирана Bicep конфигурация
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

# Разгръщане и проверка
azd provision
azd show
```

**Критерии за успех:**
- [ ] Несколько модела са успешно разположени
- [ ] Приложени са различни настройки на капацитет
- [ ] Моделите са достъпни чрез API
- [ ] Може да извиквате и двата модела от приложението

### Упражнение 3: Внедряване на мониторинг на разходите (20 минути)
**Цел**: Настройте бюджетни аларми и проследяване на разходите

```bash
# Добавяне на бюджетно предупреждение към Bicep
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

# Разгръщане на бюджетно предупреждение
azd provision

# Проверка на текущите разходи
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Критерии за успех:**
- [ ] Създадена е бюджетна аларма в Azure
- [ ] Конфигурирани са имейл известия
- [ ] Може да преглеждате данни за разходите в Azure портала
- [ ] Прагът на бюджета е подходящо зададен

## 💡 Често задавани въпроси

<details>
<summary><strong>Как да намаля разходите за Microsoft Foundry Models по време на разработка?</strong></summary>

1. **Използвайте безплатния слой**: Microsoft Foundry Models предлага 50,000 токена/месечно безплатно
2. **Намалете капацитета**: Задайте капацитет на 10 TPM вместо 30+ за разработка
3. **Използвайте azd down**: Освобождавайте ресурси, когато не разработвате активно
4. **Кеширайте отговорите**: Внедрете кеш Redis за повтарящи се заявки
5. **Използвайте инженеринг на подсказките (Prompt Engineering)**: Намалете употребата на токени с ефективни подсказки
```bash
# Конфигурация за разработка
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Каква е разликата между Microsoft Foundry Models и OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Сигурност и съответствие на корпоративно ниво
- Интеграция с частна мрежа
- Гаранции за SLA
- Удостоверяване чрез управлявани идентичности
- Налични по-високи квоти

**OpenAI API**:
- По-бърз достъп до нови модели
- По-просто настройване
- По-ниска бариера за навлизане
- Само публичен интернет

За продуктивни приложения се препоръчва **Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Как да се справя с грешки за превишаване на квоти при Microsoft Foundry Models?</strong></summary>

```bash
# Проверете текущия квотен лимит
az cognitiveservices usage list --location eastus2

# Опитайте различен регион
azd env set AZURE_LOCATION westus2
azd up

# Намалете капацитета временно
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Заявете увеличение на квотата
# Отидете в Azure Portal > Квоти > Заявете увеличение
```
</details>

<details>
<summary><strong>Мога ли да използвам свои данни с Microsoft Foundry Models?</strong></summary>

Да! Използвайте **Azure AI Search** за RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Вижте шаблона [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Как да осигуря защитата на крайни точки на AI модели?</strong></summary>

**Най-добри практики**:
1. Използвайте управлявана идентичност (без API ключове)
2. Активирайте частни крайни точки
3. Конфигурирайте мрежови защитни групи
4. Внедрете ограничаване на честотата на заявките
5. Използвайте Azure Key Vault за тайни

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

## Общност и Поддръжка

- **Microsoft Foundry Discord**: [#Azure канал](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Проблеми и дискусии](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Официална документация](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Умения Microsoft Foundry в skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Инсталирайте Azure + Foundry agent умения в редактора си с `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация в главите:**
- **📚 Начало на курса**: [AZD За начинаещи](../../README.md)
- **📖 Настояща глава**: Глава 2 - Разработка с приоритет AI
- **⬅️ Предишна глава**: [Глава 1: Вашият първи проект](../chapter-01-foundation/first-project.md)
- **➡️ Следваща**: [Разгръщане на AI модел](ai-model-deployment.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

**Нуждаете се от помощ?** Присъединете се към нашите общностни дискусии или отворете проблем в хранилището. Общността Azure AI + AZD е тук, за да ви помогне да успеете!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:  
Този документ е преведен с помощта на AI преводаческа услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия оригинален език трябва да се разглежда като авторитетен източник. За критична информация се препоръчва професионален човешки превод. Не носим отговорност за никакви недоразумения или неправилни тълкувания, възникнали от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->