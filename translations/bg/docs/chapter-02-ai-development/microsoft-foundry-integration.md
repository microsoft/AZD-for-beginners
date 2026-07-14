# Интеграция на Microsoft Foundry с AZD

**Навигация в главите:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 2 - AI-First разработка
- **⬅️ Предишна глава**: [Глава 1: Вашият първи проект](../chapter-01-foundation/first-project.md)
- **➡️ Следваща**: [Деплойване на AI модел](ai-model-deployment.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

## Преглед

Това ръководство показва как да се интегрират услугите на Microsoft Foundry с Azure Developer CLI (AZD) за оптимизирани деплойвания на AI приложения. Microsoft Foundry предоставя цялостна платформа за изграждане, деплойване и управление на AI приложения, докато AZD опростява инфраструктурата и процеса на деплойване.

## Какво е Microsoft Foundry?

Microsoft Foundry е обединената платформа на Microsoft за AI разработка, която включва:

- **Каталог на модели**: Достъп до най-съвременни AI модели
- **Prompt Flow**: Визуален дизайнер за AI работни потоци
- **Портал Microsoft Foundry**: Интегрирана среда за разработка на AI приложения
- **Опции за деплойване**: Множество опции за хостинг и мащабиране
- **Сигурност и безопасност**: Вградени отговорни AI функции

## AZD + Microsoft Foundry: По-добре заедно

| Функционалност | Microsoft Foundry | Предимство на интеграция с AZD |
|---------|-----------------|------------------------|
| **Деплойване на модели** | Ръчно деплойване през портал | Автоматизирани, повтарящи се деплойвания |
| **Инфраструктура** | Осигуряване чрез кликове | Инфраструктура като код (Bicep) |
| **Управление на среди** | Фокус върху една среда | Множество среди (разработка/тестване/продукция) |
| **Интеграция CI/CD** | Ограничена | Вградена поддръжка на GitHub Actions |
| **Управление на разходи** | Основен мониторинг | Оптимизация на разходите за конкретна среда |

## Предварителни условия

- Абонамент в Azure с подходящи разрешения
- Инсталиран Azure Developer CLI
- Достъп до услугите на Microsoft Foundry Models
- Основна познатия с Microsoft Foundry

> **Текуща версия на AZD:** Тези примери са проверени с `azd` `1.27.1`. За работния поток на AI агент, използвайте текущото предварително издание на разширението и проверете инсталираната версия, преди да започнете.

## Основни модели на интеграция

### Модел 1: Интеграция с Microsoft Foundry Models

**Сценарий на употреба**: Деплойване на чат приложения с модели от Microsoft Foundry Models

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

### Модел 2: AI търсене + RAG интеграция

**Сценарий на употреба**: Деплойване на приложения с retrieval-augmented generation (RAG)

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

### Модел 3: Интеграция на Document Intelligence

**Сценарий на употреба**: Работни потоци за обработка и анализ на документи

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

## 🔧 Конфигурационни модели

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

**Конфигурация за разработка:**
```bash
# Настройки, оптимизирани за разходи при разработка
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Безплатен слой
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

## Работни потоци за деплойване

### Разширения AZD за Foundry

AZD предлага разширения, които добавят AI специфични възможности за работа с услугите на Microsoft Foundry:

```bash
# Инсталирайте разширението за агенти на Foundry
azd extension install azure.ai.agents

# Инсталирайте разширението за фина настройка
azd extension install azure.ai.finetune

# Инсталирайте разширението за персонализирани модели
azd extension install azure.ai.models

# Избройте инсталираните разширения
azd extension list --installed

# Проверете версията на текущо инсталираното агентско разширение
azd extension show azure.ai.agents
```

AI разширенията все още се развиват бързо в предварителен преглед. Ако команда се държи различно от показаното тук, обновете съответното разширение преди да диагностицирате проекта.

### Деплойване с приоритет на агента с `azd ai`

Ако имате агентски манифест, използвайте `azd ai agent init`, за да създадете проект, свързан с Foundry Agent Service:

```bash
# Инициализиране от манифест на агент
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Деплой към Azure
azd up
```

Последните предварителни версии на `azure.ai.agents` също добавиха поддръжка за инициализация чрез шаблони за `azd ai agent init`. Ако следвате по-нови примери с агенти, проверете помощта на разширението за точните налични флагове във вашата инсталирана версия.

Вижте [AZD AI CLI команди](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) за пълната справка и параметри.

### Деплойване с една команда

```bash
# Разгръщайте всичко с една команда
azd up

# Или разгръщайте постепенно
azd provision  # Само инфраструктура
azd deploy     # Само приложение

# За дългосрочни разгръщания на AI приложения в azd 1.23.11+
azd deploy --timeout 1800
```

### Деплойване за конкретни среди

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

## Мониторинг и наблюдаемост

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

### Мониторинг на разходи

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

### Конфигурация за авто-мащабиране

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

### Проблем 1: Превишение на квотата за OpenAI

**Симптоми:**
- Деплойването се проваля с грешки за квота
- 429 грешки в логовете на приложението

**Решения:**
```bash
# Проверете текущата употреба на квотата
az cognitiveservices usage list --location eastus

# Опитайте различен регион
azd env set AZURE_LOCATION westus2
azd up

# Намалете капацитета временно
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Проблем 2: Неуспешна автентикация

**Симптоми:**
- 401/403 грешки при повикване на AI услуги
- Съобщения "Достъп отказан"

**Решения:**
```bash
# Проверете назначенията на ролите
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Проверете конфигурацията на управляваната идентичност
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Потвърдете достъпа до Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Проблем 3: Проблеми с деплойване на модел

**Симптоми:**
- Моделите не са налични в деплойването
- Определени версии на моделите не работят

**Решения:**
```bash
# Изброяване на наличните модели по региони
az cognitiveservices model list --location eastus

# Актуализиране на версията на модела в шаблона bicep
# Проверка на изискванията за капацитет на модела
```

## Примерни шаблони

### Приложение за RAG чат (Python)

**Репозитория**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Услуги**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Описание**: Най-популярният пример за Azure AI — готово за продукция RAG чат приложение, което позволява задаване на въпроси върху ваши документи. Използва GPT-4.1-mini за чат, text-embedding-3-large за вграждания и Azure AI Search за търсене. Поддържа мултимодални документи, речов вход/изход, Microsoft Entra автентикация и проследяване с Application Insights.

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Приложение за RAG чат (.NET)

**Репозитория**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Услуги**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Описание**: .NET/C# еквивалент на Python RAG чат примера. Изграден с ASP.NET Core Minimal API и Blazor WebAssembly фронтенд. Включва гласов чат, GPT-4o-mini визуална поддръжка и придружаващ .NET MAUI Blazor Hybrid десктоп/мобилен клиент.

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Приложение за RAG чат (Java)

**Репозитория**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Услуги**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Описание**: Java версия на RAG чат примера използваща Langchain4J за AI оркестрация. Поддържа микросървисна архитектура, множество стратегии за търсене (текстово, векторно, хибридно), качване на документи с Azure Document Intelligence и деплойване в Azure Container Apps или Azure Kubernetes Service.

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot с Microsoft Foundry

**Репозитория**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Услуги**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Описание**: Край до край RAG помощник за търговия с Microsoft Foundry и Prompty. Чатбот на Contoso Outdoor, който базира отговорите си на продуктов каталог и данни за поръчки на клиенти. Демонстрира цялостния GenAIOps работен поток — прототипиране с Prompty, оценка с AI-помощни оценители и деплойване чрез AZD в Container Apps.

**Бърз старт**:
```bash
azd init --template contoso-chat
azd up
```

### Креативно писане — многоагентно приложение

**Репозитория**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Услуги**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Описание**: Многоагентен пример демонстриращ AI агентска оркестрация с Prompty. Използва изследователски агент (Bing Grounding в Azure AI Agent Service), продуктен агент (Azure AI Search), писателски и редакторски агенти за съвместно създаване на добре проучени статии. Включва CI/CD с оценка чрез GitHub Actions.

**Бърз старт**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Безсървърен RAG чат (JavaScript/TypeScript)

**Репозитория**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Услуги**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB за NoSQL + LangChain.js

**Описание**: Пълно безсървърно RAG чат приложение с LangChain.js, Azure Functions за API и Azure Static Web Apps за хостинг. Използва Azure Cosmos DB като векторно хранилище и за история на чата. Поддържа локална разработка с Ollama за тестове без разходи.

**Бърз старт**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Ускорител за решение Chat with Your Data

**Репозитория**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Услуги**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Описание**: Корпоративно решение RAG ускорител с администраторски портал за качване/управление на документи, няколко опции за оркестрация (Semantic Kernel, LangChain, Prompt Flow), реч в текст, интеграция с Microsoft Teams и избор на бекенд PostgreSQL или Cosmos DB. Проектирано като персонализируемо начало за продукционни RAG сценарии.

**Бърз старт**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — многоагентска оркестрация MCP

**Репозитория**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Услуги**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP сървъри (.NET, Python, Java, TypeScript)

**Описание**: Примерно приложение за многоагентска AI оркестрация с три фреймуърка (LangChain.js, LlamaIndex.TS и Microsoft Agent Framework). Включва MCP (Model Context Protocol) сървъри на четири езика, деплойнати като безсървърни Azure Container Apps с OpenTelemetry мониторинг.

**Бърз старт**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Репозитория**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Услуги**: Azure AI услуги + Azure OpenAI

**Описание**: Минимален Bicep шаблон, който деплойва Azure AI услуги с конфигурирани машинни модели. Лек стартов шаблон, когато ви трябва само инфраструктурата на Azure AI без пълен стeк от приложения.

**Бърз старт**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Прегледайте още шаблони**: Посетете [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) за над 80 AI-специфични AZD шаблони за различни езици и сценарии.

## Следващи стъпки

1. **Опитайте примерите**: Започнете с предварително създаден шаблон, който отговаря на вашия случай
2. **Персонализирайте според нуждите си**: Модифицирайте инфраструктурата и кода на приложенията
3. **Добавете мониторинг**: Внедрете пълна наблюдаемост
4. **Оптимизирайте разходите**: Настройвайте конфигурациите за вашия бюджет
5. **Защитете деплойването си**: Прилагайте корпоративни модели за сигурност
6. **Мащабирайте към продукция**: Добавете много регионални и висока достъпност характеристики

## 🎯 Практически упражнения

### Упражнение 1: Деплойване на чат приложение с Microsoft Foundry Models (30 минути)
**Цел**: Деплойване и тестване на AI чат приложение готово за продукция

```bash
# Инициализиране на шаблона
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Настройване на променливи на околната среда
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Разгръщане
azd up

# Тестване на приложението
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Мониторинг на AI операциите
azd monitor

# Изчистване
azd down --force --purge
```

**Критерии за успех:**
- [ ] Деплойването завършва без грешки за квота
- [ ] Може да достъпи чат интерфейс през браузър
- [ ] Може да задава въпроси и получава AI-задвижвани отговори
- [ ] Application Insights показва телеметрични данни
- [ ] Ресурсите са успешно почистени

**Оценена цена**: $5-10 за 30 минути тестване

### Упражнение 2: Конфигуриране на много моделно деплойване (45 минути)
**Цел**: Деплойване на няколко AI модели с различни конфигурации

```bash
# Създайте персонализирана Bicep конфигурация
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

# Разположете и проверете
azd provision
azd show
```

**Критерии за успех:**
- [ ] Няколко модела са успешно деплойнати
- [ ] Приложени са различни настройки на капацитет
- [ ] Моделите са достъпни чрез API
- [ ] Може да се вика и двата модела от приложението

### Упражнение 3: Настройване на мониторинг на разходите (20 минути)
**Цел**: Настройване на бюджетни аларми и проследяване на разходи

```bash
# Добавете предупреждение за бюджет в Bicep
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

# Разположете предупреждението за бюджет
azd provision

# Проверете текущите разходи
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Критерии за успех:**
- [ ] Създадена е бюджетна аларма в Azure
- [ ] Настроени са имейл известия
- [ ] Може да се видят разходните данни в Azure портала
- [ ] Порогите за бюджет са правилно зададени

## 💡 Често задавани въпроси

<details>
<summary><strong>Как да намаля разходите за Microsoft Foundry Models по време на разработка?</strong></summary>

1. **Използвайте безплатния слой**: Microsoft Foundry Models предлага 50 000 токена/месец безплатно
2. **Намалете капацитета**: Задайте капацитет 10 TPM вместо 30+ за разработка
3. **Използвайте azd down**: Деактивирайте ресурси, когато не разработвате активно
4. **Кеширайте отговорите**: Внедрете Redis кеш за повторни заявки
5. **Използвайте prompt engineering**: Намалете използването на токени с ефективни подсказки


```bash
# Конфигурация за разработка
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Каква е разликата между Microsoft Foundry Models и OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Предприятелска сигурност и съответствие
- Интеграция с частна мрежа
- Гаранции за SLA
- Аутентикация с управлявана идентичност
- По-високи налични квоти

**OpenAI API**:
- По-бърз достъп до нови модели
- По-проста настройка
- По-ниска бариера за влизане
- Само публичен интернет

За продукционни приложения се препоръчва **Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Как да се справя с грешки за превишаване на квотата в Microsoft Foundry Models?</strong></summary>

```bash
# Проверете текущата квота
az cognitiveservices usage list --location eastus2

# Опитайте друг регион
azd env set AZURE_LOCATION westus2
azd up

# Временно намалете капацитета
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Заявете увеличаване на квотата
# Отидете в Azure Portal > Квоти > Заявка за увеличение
```
</details>

<details>
<summary><strong>Мога ли да използвам собствени данни с Microsoft Foundry Models?</strong></summary>

Да! Използвайте **Azure AI Search** за RAG (Обогатено генериране с издирване):

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
<summary><strong>Как да осигуря сигурност на крайни точки на AI моделите?</strong></summary>

**Най-добри практики**:
1. Използвайте управлявана идентичност (без API ключове)
2. Активирайте частни крайни точки
3. Конфигурирайте групи за мрежова сигурност
4. Внедрете ограничение на скоростта
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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Проблеми и дискусии](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Официална документация](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Умение Microsoft Foundry в skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Инсталирайте Azure + Foundry agent skills в редактора си с `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация в глава:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 2 - Разработка с приоритет AI
- **⬅️ Предишна глава**: [Глава 1: Вашият първи проект](../chapter-01-foundation/first-project.md)
- **➡️ Следваща**: [Деплоймънт на AI модел](ai-model-deployment.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

**Нуждаете се от помощ?** Присъединете се към дискусиите в нашата общност или отворете issue в хранилището. Общността на Azure AI + AZD е тук, за да ви помогне да успеете!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->