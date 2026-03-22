# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD за начинаещи](../../README.md)
- **📖 Current Chapter**: Глава 2 - Разработка с приоритет за AI
- **⬅️ Previous Chapter**: [Глава 1: Вашият първи проект](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [Разгръщане на AI модел](ai-model-deployment.md)
- **🚀 Next Chapter**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

## Преглед

Този наръчник демонстрира как да интегрирате услугите на Microsoft Foundry с Azure Developer CLI (AZD) за опростени внедрявания на AI приложения. Microsoft Foundry предоставя цялостна платформа за изграждане, внедряване и управление на AI приложения, докато AZD опростява инфраструктурата и процеса на разгръщане.

## Какво е Microsoft Foundry?

Microsoft Foundry е унифицираната платформа на Microsoft за разработка на AI, която включва:

- **Каталог с модели**: Достъп до най-съвременни AI модели
- **Prompt Flow**: Визуален дизайнер за AI работни потоци
- **Microsoft Foundry Portal**: Интегрирана среда за разработка на AI приложения
- **Опции за внедряване**: Множество възможности за хостинг и мащабиране
- **Сигурност и безопасност**: Вградени функции за отговорен AI

## AZD + Microsoft Foundry: По-добре заедно

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Изисквания

- Абонамент в Azure с подходящи права
- Инсталиран Azure Developer CLI
- Достъп до услугите на Microsoft Foundry Models
- Основно познаване на Microsoft Foundry

## Основни модели на интеграция

### Модел 1: Интеграция с Microsoft Foundry Models

**Използване**: Разгръщане на чат приложения с модели от Microsoft Foundry Models

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

### Модел 2: AI Search + RAG Интеграция

**Използване**: Разгръщане на приложения с retrieval-augmented generation (RAG)

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

### Модел 3: Интеграция с Document Intelligence

**Използване**: Работни потоци за обработка и анализ на документи

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

## 🔧 Патерни за конфигурация

### Настройка на променливите на средата

**Конфигурация за продукция:**
```bash
# Основни услуги за изкуствен интелект
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Конфигурации на модели
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Настройки за производителност
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Конфигурация за разработка:**
```bash
# Настройки, оптимизирани за икономична разработка
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

## Работни потоци за внедряване

### Разширения на AZD за Foundry

AZD предоставя разширения, които добавят AI-специфични възможности за работа с услугите на Microsoft Foundry:

```bash
# Инсталирайте разширението Foundry agents
azd extension install azure.ai.agents

# Инсталирайте разширението за фино настройване
azd extension install azure.ai.finetune

# Инсталирайте разширението за персонализирани модели
azd extension install azure.ai.models

# Избройте инсталираните разширения
azd extension list
```

### Деплой, ориентиран към агенти, с `azd ai`

Ако имате manifest за агент, използвайте `azd ai agent init`, за да изградиш скелет на проект, свързан с Foundry Agent Service:

```bash
# Инициализиране от манифест на агент
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Разгръщане в Azure
azd up
```

Вижте [AZD AI CLI команди](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) за пълния справочник с команди и флагове.

### Внедряване с една команда

```bash
# Разположете всичко с една команда
azd up

# Или разположете поетапно
azd provision  # Само инфраструктура
azd deploy     # Само приложение
```

### Внедрявания специфични за среда

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

### Конфигурация за автоматично мащабиране

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

### Проблем 1: Надвишена квота на OpenAI

**Симптоми:**
- Разгръщането неуспешно със съобщения за квота
- 429 грешки в логовете на приложението

**Решения:**
```bash
# Проверете текущото използване на квотата
az cognitiveservices usage list --location eastus

# Опитайте друг регион
azd env set AZURE_LOCATION westus2
azd up

# Временно намалете капацитета
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Проблем 2: Неуспешна автентикация

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

### Проблем 3: Проблеми при разгръщане на модел

**Симптоми:**
- Моделите не са налични в разгръщането
- Определени версии на модели се провалят

**Решения:**
```bash
# Изброяване на наличните модели по региони
az cognitiveservices model list --location eastus

# Актуализиране на версията на модела в Bicep шаблона
# Проверка на изискванията за капацитета на модела
```

## Примерни шаблони

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Услуги**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Описание**: Най-популярният пример за Azure AI — готов за продукция RAG чат приложение, което ви позволява да задавате въпроси върху собствените си документи. Използва GPT-4.1-mini за чат, text-embedding-ada-002 за embeddings и Azure AI Search за извличане. Поддържа мултимодални документи, вход/изход на реч, удостоверяване през Microsoft Entra и проследяване с Application Insights.

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Услуги**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Описание**: Еквивалентът на Python примерa за RAG чат, но на .NET/C#. Изграден с ASP.NET Core Minimal API и фронтенд с Blazor WebAssembly. Включва гласов чат, поддръжка на GPT-4o-mini vision и спомагателен клиент .NET MAUI Blazor Hybrid за десктоп/мобилни устройства.

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Услуги**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Описание**: Java версия на примера RAG чат, използваща Langchain4J за AI оркестрация. Поддържа микросървисна, събитийно-ориентирана архитектура, множество стратегии за търсене (текст, вектор, хибрид), качване на документи с Azure Document Intelligence и внедряване както на Azure Container Apps, така и на Azure Kubernetes Service.

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Услуги**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Описание**: Край до край retail RAG copilot използващ Azure AI Foundry и Prompty. Чатбот за магазин Contoso Outdoor, който обосновава отговорите си в каталога с продукти и данните за клиентски поръчки. Демонстрира пълния GenAIOps работен процес — прототипиране с Prompty, оценяване с AI-помощни оценители и разгръщане чрез AZD в Container Apps.

**Бърз старт**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Услуги**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Описание**: Многоагентен пример, демонстриращ оркестрация на AI агенти с Prompty. Използва изследователски агент (Bing Grounding в Azure AI Agent Service), продуктов агент (Azure AI Search), агент-писател и агент-редактор за съвместно генериране на добре проучени статии. Включва CI/CD с оценяване в GitHub Actions.

**Бърз старт**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Услуги**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Описание**: Изцяло serverless RAG чатбот, използващ LangChain.js с Azure Functions за API и Azure Static Web Apps за хостинг. Използва Azure Cosmos DB както за векторно хранилище, така и за база данни за чат история. Поддържа локално разработване с Ollama за безплатни тестове.

**Бърз старт**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Услуги**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Описание**: RAG решение-ускорител за корпоративни нужди с администраторски портал за качване/управление на документи, множество опции за оркестратор (Semantic Kernel, LangChain, Prompt Flow), преобразуване на реч в текст, интеграция с Microsoft Teams и избор между PostgreSQL или Cosmos DB като бекенд. Проектиран като персонализируем отправен момент за продукционни RAG сценарии.

**Бърз старт**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Услуги**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Описание**: Референтно приложение за многоагентна AI оркестрация, използващо три рамки (LangChain.js, LlamaIndex.TS и Microsoft Agent Framework). Включва MCP (Model Context Protocol) сървъри на четири езика, внедрени като serverless Azure Container Apps с OpenTelemetry мониторинг.

**Бърз старт**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Услуги**: Azure AI Services + Azure OpenAI

**Описание**: Минимален Bicep шаблон, който разгръща Azure AI услуги с конфигурирани машинни обучителни модели. Лекият отправен момент, когато имате нужда само от провизирана Azure AI инфраструктура без пълен стек на приложението.

**Бърз старт**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Разгледайте още шаблони**: Посетете [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) за 80+ AI-специфични AZD шаблона за различни езици и сценарии.

## Следващи стъпки

1. **Опитайте примерите**: Започнете с предварително изграден шаблон, който съответства на вашия сценарий
2. **Персонализирайте според нуждите си**: Модифицирайте инфраструктурата и кода на приложението
3. **Добавете мониторинг**: Имплементирайте цялостна наблюдаемост
4. **Оптимизирайте разходите**: Фина настройка на конфигурациите спрямо бюджета ви
5. **Защитете внедряването**: Внедрете корпоративни модели за сигурност
6. **Мащабирайте за продукция**: Добавете мултирегионални и висока наличност функции

## 🎯 Практически упражнения

### Упражнение 1: Разгръщане на чат приложение с Microsoft Foundry Models (30 минути)
**Цел**: Разгръщане и тестване на готово за продукция AI чат приложение

```bash
# Инициализирай шаблона
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Задай променливите на средата
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Разгръни
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
- [ ] Може да се достъпи чат интерфейса в браузър
- [ ] Може да се задават въпроси и да се получават AI-генерирани отговори
- [ ] Application Insights показва телеметрични данни
- [ ] Ресурсите са успешно изчистени

**Прогнозна цена**: $5-10 за 30 минути тестване

### Упражнение 2: Конфигуриране на разгръщане с множество модели (45 минути)
**Цел**: Разгръщане на няколко AI модела с различни конфигурации

```bash
# Създаване на персонализирана конфигурация на Bicep
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

# Разгръщане и проверка
azd provision
azd show
```

**Критерии за успех:**
- [ ] Няколко модела са разположени успешно
- [ ] Прилагани са различни настройки за капацитет
- [ ] Моделите са достъпни чрез API
- [ ] Приложението може да извиква и двата модела

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
- [ ] Създаден е бюджетен аларм в Azure
- [ ] Конфигурирани са имейл известия
- [ ] Може да се преглеждат данните за разходите в Azure Portal
- [ ] Прагът на бюджета е зададен правилно

## 💡 Често задавани въпроси

<details>
<summary><strong>Как да намаля разходите за Microsoft Foundry Models по време на разработка?</strong></summary>

1. **Използвайте безплатния план**: Microsoft Foundry Models предлага 50,000 токена/месец безплатно
2. **Намалете капацитета**: Задайте капацитет на 10 TPM вместо 30+ за разработка
3. **Използвайте azd down**: Деактивирайте ресурсите, когато не разработвате активно
4. **Кеширайте отговорите**: Имплементирайте Redis кеш за повтарящи се заявки
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
- Корпоративна сигурност и съответствие
- Интеграция в частни мрежи
- Гаранции за SLA
- Аутентикация чрез управлявана идентичност
- Налични са по-високи квоти

**OpenAI API**:
- По-бърз достъп до нови модели
- По-прост процес на настройка
- По-нисък праг за влизане
- Само публичен интернет

За продукционни приложения, **препоръчва се Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Как да се справя с грешки за превишена квота на Microsoft Foundry Models?</strong></summary>

```bash
# Проверете текущата квота
az cognitiveservices usage list --location eastus2

# Опитайте различен регион
azd env set AZURE_LOCATION westus2
azd up

# Временно намалете капацитета
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Поискайте увеличение на квотата
# Отидете в Azure Portal > Квоти > Поискайте увеличение
```
</details>

<details>
<summary><strong>Мога ли да използвам собствените си данни с Microsoft Foundry Models?</strong></summary>

Да! Използвайте **Azure AI Search** за RAG (Генериране, подсилено с извличане):

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
<summary><strong>Как да защитя крайни точки на AI моделите?</strong></summary>

**Най-добри практики**:
1. Използвайте Managed Identity (без API ключове)
2. Активирайте Private Endpoints
3. Конфигурирайте групи за мрежова сигурност
4. Прилагайте ограничение на честотата на заявките
5. Използвайте Azure Key Vault за съхранение на тайни

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
- **AZD GitHub**: [Issues и дискусии](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Официална документация](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Инсталирайте уменията на агента Azure + Foundry в редактора си с `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация в главите:**
- **📚 Начало на курса**: [AZD For Beginners](../../README.md)
- **📖 Текуща глава**: Глава 2 - Разработка, водена от AI
- **⬅️ Предишна глава**: [Глава 1: Вашият първи проект](../chapter-01-foundation/first-project.md)
- **➡️ Следваща**: [Разгръщане на AI модел](ai-model-deployment.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

**Имате нужда от помощ?** Присъединете се към нашите дискусии в общността или отворете issue в репозитория. Общността Azure AI + AZD е тук, за да ви помогне да успеете!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводаческата услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматичните преводи могат да съдържат грешки или неточности. Оригиналният документ на оригиналния език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за никакви недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->