# Интеграция на Microsoft Foundry с AZD

**Навигация в главите:**
- **📚 Начало на курса**: [AZD For Beginners](../../README.md)
- **📖 Текуща глава**: Глава 2 - AI-First Development
- **⬅️ Предишна глава**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Следваща**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Следваща глава**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Преглед

Това ръководство демонстрира как да интегрирате услугите на Microsoft Foundry с Azure Developer CLI (AZD) за опростени разгръщания на AI приложения. Microsoft Foundry предоставя цялостна платформа за изграждане, разгръщане и управление на AI приложения, докато AZD опростява инфраструктурата и процеса на разгръщане.

## Какво е Microsoft Foundry?

Microsoft Foundry е обединената платформа на Microsoft за разработка на AI, която включва:

- **Model Catalog**: Достъп до най-съвременни AI модели
- **Prompt Flow**: Визуален дизайнер за AI работни потоци
- **Microsoft Foundry Portal**: Интегрирана среда за разработка на AI приложения
- **Deployment Options**: Множество опции за хостинг и скалиране
- **Safety and Security**: Вградени функции за отговорно използване на AI

## AZD + Microsoft Foundry: По-добре заедно

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Автоматизирани, повтаряеми разгръщания |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Многосредова (dev/staging/prod) |
| **CI/CD Integration** | Limited | Вградена поддръжка на GitHub Actions |
| **Cost Management** | Basic monitoring | Оптимизация на разходите специфична за средата |

## Предпоставки

- Абонамент за Azure с подходящи разрешения
- Инсталиран Azure Developer CLI
- Достъп до услугите на Microsoft Foundry Models
- Основни познания за Microsoft Foundry

> **Текуща базова версия на AZD:** Тези примери бяха прегледани спрямо `azd` `1.23.12`. За работния поток с AI агент използвайте текущото preview издание на разширението и проверете инсталираната си версия преди да започнете.

## Основни модели на интеграция

### Шаблон 1: Интеграция с Microsoft Foundry Models

**Сценарий**: Разгръщане на чат приложения с модели от Microsoft Foundry Models

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

### Шаблон 2: AI Search + RAG интеграция

**Сценарий**: Разгръщане на приложения за извличане с разширено генериране (RAG)

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

### Шаблон 3: Интеграция на Document Intelligence

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

## 🔧 Шаблони за конфигурация

### Настройка на променливи на средата

**Конфигурация за продукция:**
```bash
# Основни услуги за изкуствен интелект
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Конфигурации на модела
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Настройки за производителност
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Конфигурация за разработка:**
```bash
# Настройки, оптимизирани за минимални разходи при разработка
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Безплатно ниво
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

### AZD разширения за Foundry

AZD предоставя разширения, които добавят AI-специфични възможности за работа с услугите на Microsoft Foundry:

```bash
# Инсталирайте разширението Foundry agents
azd extension install azure.ai.agents

# Инсталирайте разширението за фина настройка
azd extension install azure.ai.finetune

# Инсталирайте разширението за персонализирани модели
azd extension install azure.ai.models

# Избройте инсталираните разширения
azd extension list --installed

# Проверете версията на в момента инсталираното разширение за агенти
azd extension show azure.ai.agents
```

AI разширенията все още се развиват бързо в прегледен режим. Ако команда се държи по различен начин от показаното тук, обновете съответното разширение преди да започнете отстраняване на проблеми в самия проект.

### Разгръщане, ориентирано към агенти, с `azd ai`

Ако имате manifest за агент, използвайте `azd ai agent init`, за да създадете структура на проект, свързан с Foundry Agent Service:

```bash
# Инициализиране от агентски манифест
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Разгръщане в Azure
azd up
```

Последните preview издания на `azure.ai.agents` също добавиха поддръжка за инициализация базирана на шаблони за `azd ai agent init`. Ако следвате по-нови примери за агенти, проверете помощта на разширението за точните флагове, налични във вашата инсталирана версия.

Вижте [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) за пълния справочник с команди и флагове.

### Разгръщане с една команда

```bash
# Разположете всичко с една команда
azd up

# Или разгръщайте поетапно
azd provision  # Само инфраструктура
azd deploy     # Само приложение

# За дълготрайни разгръщания на AI приложения в azd 1.23.11+
azd deploy --timeout 1800
```

### Разгръщания специфични за средата

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

### Конфигурация за автоматично скалиране

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

### Проблем 1: Квотата на OpenAI е надвишена

**Симптоми:**
- Разгръщането не успява с грешки за квота
- 429 грешки в логовете на приложението

**Решения:**
```bash
# Проверете текущото използване на квотата
az cognitiveservices usage list --location eastus

# Опитайте различен регион
azd env set AZURE_LOCATION westus2
azd up

# Временно намалете капацитета
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Проблем 2: Грешки при удостоверяване

**Симптоми:**
- 401/403 грешки при извикване на AI услуги
- Съобщения "Access denied"

**Решения:**
```bash
# Проверете присвояванията на роли
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Проверете конфигурацията на управляваната идентичност
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Проверете достъпа до Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Проблем 3: Проблеми с разгръщането на моделите

**Симптоми:**
- Моделите не са налични в разгръщането
- Някои версии на моделите не функционират

**Решения:**
```bash
# Изброяване на наличните модели по регион
az cognitiveservices model list --location eastus

# Актуализиране на версията на модела в bicep шаблона
# Проверете изискванията за капацитета на модела
```

## Примерни шаблони

### RAG чат приложение (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Услуги**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Описание**: Най-популярен пример за Azure AI — готово за продукция RAG чат приложение, което ви позволява да задавате въпроси върху собствените си документи. Използва GPT-4.1-mini за чат, text-embedding-3-large за embeddings и Azure AI Search за извличане. Поддържа мултимодални документи, гласов вход/изход, удостоверяване чрез Microsoft Entra и трасировка с Application Insights.

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG чат приложение (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Услуги**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Описание**: Еквивалентът на RAG чат примера за .NET/C#. Изградено с ASP.NET Core Minimal API и Blazor WebAssembly фронтенд. Включва гласов чат, поддръжка на GPT-4o-mini vision и компаньон .NET MAUI Blazor Hybrid десктоп/мобилен клиент.

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG чат приложение (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Услуги**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Описание**: Java версия на RAG чат примера, използваща Langchain4J за AI оркестрация. Поддържа микроуслуги, архитектура, базирана на събития, множество стратегии за търсене (текст, вектор, хибрид), качване на документи с Azure Document Intelligence и разгръщане на Azure Container Apps или Azure Kubernetes Service.

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot с Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Услуги**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Описание**: Край до край retail RAG copilot, използващ Microsoft Foundry и Prompty. Чатбот за търговец Contoso Outdoor, който обосновава отговорите си в продуктов каталог и данни за поръчки на клиенти. Демонстрира пълния GenAIOps работен поток — прототипиране с Prompty, оценка с AI-подпомогнати оценители и разгръщане чрез AZD в Container Apps.

**Бърз старт**:
```bash
azd init --template contoso-chat
azd up
```

### Многоагентно приложение за творческо писане

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Услуги**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Описание**: Многоагентен пример, демонстриращ оркестрация на AI агенти с Prompty. Използва изследователски агент (Bing Grounding в Azure AI Agent Service), продуктов агент (Azure AI Search), агент писател и агент редактор за съвместно създаване на добре проучени статии. Включва CI/CD с оценка в GitHub Actions.

**Бърз старт**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG чат (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Услуги**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB за NoSQL + LangChain.js

**Описание**: Напълно serverless RAG чатбот, използващ LangChain.js с Azure Functions за API и Azure Static Web Apps за хостинг. Използва Azure Cosmos DB както като векторно хранилище, така и за база данни за чат история. Поддържа локална разработка с Ollama за безплатно тестване.

**Бърз старт**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Услуги**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Описание**: Enterprise-class RAG ускорител с администраторски портал за качване/управление на документи, множество опции за оркестрация (Semantic Kernel, LangChain, Prompt Flow), speech-to-text, интеграция с Microsoft Teams и избор на бекенд PostgreSQL или Cosmos DB. Проектиран като персонализируем начален пункт за продукционни RAG сценарии.

**Бърз старт**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — мултиагентна MCP оркестрация

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Услуги**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Описание**: Примерно приложение за мултиагентна AI оркестрация, използващо три рамки (LangChain.js, LlamaIndex.TS и Microsoft Agent Framework). Включва MCP (Model Context Protocol) сървъри на четири езика, разположени като serverless Azure Container Apps с OpenTelemetry мониторинг.

**Бърз старт**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Услуги**: Azure AI Services + Azure OpenAI

**Описание**: Минимален Bicep шаблон, който разгръща Azure AI услуги с конфигурирани машинни обучителни модели. Лекият начален пункт, когато ви трябва само осигурена инфраструктура за Azure AI без пълен стек от приложението.

**Бърз старт**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Разгледайте още шаблони**: Посетете [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) за 80+ AI-специфични AZD шаблона на различни езици и сценарии.

## Следващи стъпки

1. **Изпробвайте примерите**: Започнете с предварително създаден шаблон, който отговаря на вашия сценарий
2. **Персонализирайте според нуждите си**: Модифицирайте инфраструктурата и кода на приложението
3. **Добавете мониторинг**: Имплементирайте пълна наблюдаемост
4. **Оптимизирайте разходите**: Фино настройте конфигурациите според бюджета си
5. **Осигурете разгръщането си**: Имплементирайте корпоративни модели за сигурност
6. **Мащабирайте за продукция**: Добавете мултирегионални и високо налични функции

## 🎯 Практически упражнения

### Упражнение 1: Деплой на чат приложение с Microsoft Foundry Models (30 минути)
**Цел**: Разгръщане и тестване на готово за продукция AI чат приложение

```bash
# Инициализирай шаблона
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Задай променливите на средата
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Разгърни
azd up

# Тествай приложението
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Наблюдавай операциите на ИИ
azd monitor

# Почисти
azd down --force --purge
```

**Критерии за успех:**
- [ ] Разгръщането завършва без грешки за квота
- [ ] Достъп до чат интерфейса чрез браузър
- [ ] Възможност за задаване на въпроси и получаване на AI-отговори
- [ ] Application Insights показва телеметрични данни
- [ ] Успешно почистване на ресурсите

**Ориентировъчна цена**: $5-10 за 30 минути тестване

### Упражнение 2: Конфигуриране на мултимоделно разгръщане (45 минути)
**Цел**: Разгръщане на няколко AI модела с различни конфигурации

```bash
# Създаване на персонализирана конфигурация за Bicep
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
- [ ] Няколко модела разположени успешно
- [ ] Приложени различни настройки за капацитет
- [ ] Моделите достъпни чрез API
- [ ] Възможност за извикване на двата модела от приложението

### Упражнение 3: Имплементиране на мониторинг на разходите (20 минути)
**Цел**: Настройка на бюджетни аларми и проследяване на разходите

```bash
# Добавете бюджетно предупреждение в Bicep
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

# Разположете бюджетно предупреждение
azd provision

# Проверете текущите разходи
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Критерии за успех:**
- [ ] Създаден бюджетен аларм в Azure
- [ ] Конфигурирани имейл известия
- [ ] Възможност за преглед на данни за разходите в Azure Portal
- [ ] Прагoвeте на бюджета зададени подходящо

## 💡 Често задавани въпроси

<details>
<summary><strong>Как да намаля разходите за Microsoft Foundry Models по време на разработка?</strong></summary>

1. **Използвайте безплатния план**: Microsoft Foundry Models предлага 50,000 токена/месец безплатно
2. **Намалете капацитета**: Задайте капацитет на 10 TPM вместо 30+ за разработка
3. **Използвайте azd down**: Деактивирайте ресурсите, когато не разработвате активно
4. **Кеширайте отговорите**: Имплементирайте Redis кеш за повторни заявки
5. **Използвайте Prompt Engineering**: Намалете използването на токени с ефективни prompt-и


```bash
# Конфигурация за разработка
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Каква е разликата между Microsoft Foundry Models и OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Корпоративна сигурност и съответствие
- Интеграция с частна мрежа
- Гаранции за SLA
- Удостоверяване чрез управлявана идентичност
- Налични по-високи квоти

**OpenAI API**:
- По-бърз достъп до нови модели
- По-проста настройка
- По-нисък праг за влизане
- Достъп само през публичния интернет

За производствени приложения се препоръчва **Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Как да се справя с грешки на надвишена квота за Microsoft Foundry Models?</strong></summary>

```bash
# Проверете текущата квота
az cognitiveservices usage list --location eastus2

# Опитайте друг регион
azd env set AZURE_LOCATION westus2
azd up

# Временно намалете капацитета
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Поискайте увеличение на квотата
# Отидете в Azure портал > Квоти > Искане за увеличение
```
</details>

<details>
<summary><strong>Мога ли да използвам собствени данни с Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Как да защитя крайните точки на AI моделите?</strong></summary>

**Най-добри практики**:
1. Използвайте Managed Identity (без API ключове)
2. Активирайте Private Endpoints
3. Конфигурирайте network security groups
4. Въведете rate limiting
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

## Общност и поддръжка

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Проблеми и дискусии](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Официална документация](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Инсталирайте Azure + Foundry агентски умения в редактора си с `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация в главата:**
- **📚 Начало на курса**: [AZD For Beginners](../../README.md)
- **📖 Текуща глава**: Chapter 2 - AI-First Development
- **⬅️ Предишна глава**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Следваща**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Следваща глава**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Нужда от помощ?** Присъединете се към дискусиите в общността или отворете issue в репозитория. Общността Azure AI + AZD е тук, за да ви помогне да успеете!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->