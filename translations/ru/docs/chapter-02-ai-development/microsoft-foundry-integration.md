# Интеграция Microsoft Foundry с AZD

**Навигация по главам:**
- **📚 Главная курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 2 - Разработка с акцентом на ИИ
- **⬅️ Предыдущая глава**: [Глава 1: Ваш первый проект](../chapter-01-foundation/first-project.md)
- **➡️ Следующая**: [Агенты ИИ](agents.md)
- **🚀 Следующая глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

## Обзор

В этом руководстве показано, как интегрировать сервисы Microsoft Foundry с Azure Developer CLI (AZD) для упрощения развертывания приложений с ИИ. Microsoft Foundry предоставляет комплексную платформу для создания, развертывания и управления приложениями ИИ, а AZD упрощает процесс инфраструктуры и развертывания.

## Что такое Microsoft Foundry?

Microsoft Foundry — это единная платформа Microsoft для разработки ИИ, включающая:

- **Каталог моделей**: Доступ к передовым моделям ИИ
- **Prompt Flow**: Визуальный конструктор рабочих процессов ИИ
- **Портал Microsoft Foundry**: Интегрированная среда разработки приложений ИИ
- **Опции развертывания**: Различные варианты хостинга и масштабирования
- **Безопасность и защита**: Встроенные функции ответственного ИИ

## AZD + Microsoft Foundry: Вместе лучше

| Функция | Microsoft Foundry | Преимущество интеграции AZD |
|---------|-----------------|------------------------|
| **Развертывание модели** | Ручное развертывание через портал | Автоматизированные, повторяемые развертывания |
| **Инфраструктура** | Конфигурация через клики | Инфраструктура как код (Bicep) |
| **Управление средой** | Фокус на одной среде | Много сред (dev/staging/prod) |
| **Интеграция CI/CD** | Ограниченная | Поддержка GitHub Actions из коробки |
| **Управление затратами** | Базовый мониторинг | Оптимизация затрат по средам |

## Требования

- Подписка Azure с соответствующими разрешениями
- Установленный Azure Developer CLI
- Доступ к сервисам Microsoft Foundry Models
- Базовые знания Microsoft Foundry

> **Обзор релиза (2026-11-04):** Руководство по AI CLI проверено по документации/исходникам `azd` `1.37.2`, агентов `1.0.0-beta.23` и оценок `1.0.0-beta.2`. Используйте `azd >= 1.37.0` для объединенного рабочего процесса. См. [изменения и исправления релиза](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); этот обзор не сертифицирует каждую шаблон или пример SDK для живого развертывания.

## Основные шаблоны интеграции

**Область примеров:** В приведенном ниже Bicep содержатся фрагменты ресурсов для иллюстрации, а не полный развертываемый шаблон. Включающий шаблон должен определять имена, `location`, ссылки на ресурсы, идентичности, выходные данные и хостинг приложения. Используйте связанный пример в качестве запускаемой отправной точки. Примеры Bash требуют отдельной аутентификации Azure CLI, помимо `azd auth login`.

### Шаблон 1: Интеграция Microsoft Foundry Models

**Сценарий использования**: Развертывание чат-приложений с моделями Azure OpenAI в Microsoft Foundry

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

Вызывающему требуется присоединённая управляемая идентичность и `Cognitive Services OpenAI User` на уровне аккаунта; отключение ключей не дает доступ. Проверьте доступность региона/модели/SKU и квоты перед развертыванием.

### Шаблон 2: Интеграция AI Search + RAG

**Сценарий использования**: Развертывание приложений retrieval-augmented generation (RAG)

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

Для этой интеграции нет ресурса ARM `Microsoft.Search/searchServices/dataConnections`. Настройте Search индекс, источник данных, индексатор/набор навыков или векторизатор через поддерживаемые API Search data-plane. Если Search вызывает модель встраивания, включите управляемую идентичность, предоставьте соответствующую роль модели и настройте навык встраивания/векторизатор. См. [интегрированная векторизация](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Шаблон 3: Интеграция Document Intelligence

**Сценарий использования**: Обработка и анализ документов в рабочем процессе

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

## 🔧 Шаблоны настройки

### Настройка переменных окружения

Кроме документированных настроек AZD, таких как `AZURE_LOCATION`, это **имена пользовательских входных параметров шаблона**. Они не влияют, если шаблон/приложение не использует их через параметры и маппинги окружения хоста. Для `azure-search-openai-demo` используйте их фактические имена, например `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` и `AZURE_SEARCH_SERVICE_SKU` вместо этого. Емкость модели — это не SKU аккаунта.

**Настройки для производства:**
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

**Настройки для разработки:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Безопасная настройка с помощью Key Vault

Предпочитайте Entra ID с отключенной локальной аутентификацией ключей. Следующее — лишь **наследственная альтернатива аутентификации ключом** для приложений, которые требуют ключи: это требует учетной записи с включенной аутентификацией ключа, прикрепленной идентичности приложения к хосту и рабочим доступом/сетевым настройкам Key Vault. Не сочетайте извлечение ключей с `disableLocalAuth: true` и ожидайте работы ключевых вызовов.

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

## Рабочие процессы развертывания

### Расширения AZD для Foundry

AZD предоставляет расширения с функциями, специфичными для ИИ, для работы с сервисами Microsoft Foundry:

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

Расширения AI находятся на стадии активного предварительного просмотра. Если команда ведет себя иначе, чем здесь показано, обновите соответствующее расширение перед устранением проблем в проекте.

### Развертывание с акцентом на агента с `azd ai`

Используйте `azd ai agent init` интерактивно или возьмите текущий шаблон проекта агента `azure.yaml`, связанный с Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` заменяют устаревшие `--manifest`/`-m`; наследственные манифесты и вложенные конфигурации агента требуют миграции. Оценивайте агентов с помощью `azd ai eval` из `azure.ai.evaluations`, а не по удаленному наследственному рабочему процессу. См. [миграция оценки](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) для настройки, выполнения и результатов.

См. [Команды AI CLI AZD](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) для полного справочника по командам и флагам.

### Развертывание одной командой

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Развертывание по средам

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

## Мониторинг и наблюдаемость

### Интеграция Application Insights

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

Это создает ресурс Insights, но не настраивает телеметрию. После того как ваше приложение начнет создавать исходящие спаны вызовов моделей, выполните этот пример запроса в журналах Application Insights (адаптируйте фильтр под свои имена спанов):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Мониторинг затрат

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

Используйте реального получателя и проверьте разрешения области биллинга. Бюджет отправляет оповещения; он не является пределом расходов.

## 🔐 Лучшие практики безопасности

### Настройка управляемой идентичности

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

### Сетевая безопасность

Этот фрагмент конечной точки также требует приватной зоны DNS/группы, VNet ссылок, подключения приложения к VNet и явной политики публичного доступа. Создание приватной конечной точки само по себе не отключает публичный доступ.

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

## Оптимизация производительности

### Стратегии кэширования

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

Azure Cache для Redis Basic/Standard/Premium находится на [пути к устареванию](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); используйте Azure Managed Redis для новых развертываний и следуйте текущим рекомендациям по шаблонам и аутентификации. Кэшируйте ответы ИИ с учетом авторизации, модели/инструкций и версии данных с истечением срока; никогда не делитесь приватными ответами, используя только текст запроса.

### Настройка автоскейлинга

**Частичный ресурс:** объедините эти настройки масштабирования/входа в полноценное приложение контейнеров с управляемой средой, образом контейнера и лимитами ресурсов. Увеличение количества реплик не увеличивает квоту модели.

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

## Решение распространенных проблем

### Проблема 1: Превышена квота OpenAI

**Симптомы:**
- Ошибки квоты при развертывании
- Ошибки 429 в логах приложения

**Решения:**
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

Переменная емкости выше применяется только к пользовательскому шаблону, настроенному на её использование. Для примера RAG используйте `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Не изменяйте `AZURE_LOCATION` для перемещения существующих ресурсов; создайте отдельную среду для нового региона и планируйте миграцию/очистку.

### Проблема 2: Ошибки аутентификации

**Симптомы:**
- Ошибки 401/403 при вызове сервисов ИИ
- Сообщения "Доступ запрещен"

**Решения:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Проблема 3: Ошибки развертывания модели

**Симптомы:**
- Модели недоступны при развертывании
- Отдельные версии моделей не работают

**Решения:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Примерные шаблоны

Это альтернативы, а не последовательные команды. Запускайте каждую в отдельной пустой директории. Явное указание `.` сохраняет инициализацию в текущей директории; иначе AZD может создать поддиректорию с именем шаблона без изменения рабочей директории оболочки.

### RAG чат-приложение (Python)

**Репозиторий**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Сервисы**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Описание**: Референсное приложение RAG чата для вопросов по вашим документам с использованием Azure AI Search для поиска. Ознакомьтесь с поддерживаемыми моделями, опциональными функциями, рекомендациями по затратам и подготовкой к продакшену перед использованием; развертывание примера не делает приложение готовым к продакшену.

**Быстрый старт**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG чат-приложение (.NET)

**Репозиторий**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Сервисы**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Описание**: .NET/C# версия примера RAG чата Python. Построено с использованием ASP.NET Core Minimal API и Blazor WebAssembly на фронтенде. Включает голосовой чат, поддержку GPT-4o-mini vision и клиент .NET MAUI Blazor Hybrid для ПК и мобильных устройств.

**Быстрый старт**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG чат-приложение (Java)

**Репозиторий**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Сервисы**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Описание**: Java-версия примера RAG чата, использующая Langchain4J для оркестровки ИИ. Поддерживает микросервисную событийно-ориентированную архитектуру, несколько стратегий поиска (текст, вектор, гибрид), загрузку документов в Azure Document Intelligence и развертывание на Azure Container Apps или Azure Kubernetes Service.

**Быстрый старт**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Корпоративный розничный помощник с Microsoft Foundry

**Репозиторий**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Сервисы**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Описание**: Полный розничный помощник RAG с использованием Microsoft Foundry и Prompty. Чат-бот Contoso Outdoor, который опирается на данные каталога продуктов и заказов клиентов. Демонстрирует полный GenAIOps workflow — прототипирование с Prompty, оценка с помощью ИИ, развертывание через AZD в Container Apps.

**Быстрый старт**:
```bash
azd init --template contoso-chat .
azd up
```

### Многоагентное приложение для творческого письма

**Репозиторий**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Сервисы**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Описание**: Многоагентный пример, демонстрирующий оркестрацию ИИ-агентов с Prompty. Использует исследовательского агента (Bing Grounding в Azure AI Agent Service), продуктового агента (Azure AI Search), писателя и редактора для совместного создания хорошо исследованных статей. Включает CI/CD с оценкой в GitHub Actions.

**Быстрый старт**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Безсерверный RAG чат (JavaScript/TypeScript)

**Репозиторий**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Сервисы**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Описание**: Полностью безсерверный чат RAG с использованием LangChain.js с Azure Functions для API и Azure Static Web Apps для хостинга. Использует Azure Cosmos DB как хранилище векторов и базу истории чата. Поддерживает локальную разработку с Ollama для тестирования без затрат.

**Быстрый старт**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Ускоритель решения Chat with Your Data

**Репозиторий**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Сервисы**: Microsoft Foundry + Azure Container Apps (веб/API/ингестирование) + Azure AI Search с Cosmos DB или PostgreSQL с pgvector

**Описание**: Ускоритель чат-приложения, основанного на документах с цитированием. Текущий пример содержит React фронтенд, FastAPI бэкенд и Functions ingestion воркер на Container Apps; варианты оркестратора — Agent Framework и LangGraph. Варианты базы данных/поиска выбираются при развертывании. Это отправная точка, не готовое к эксплуатации прозводственное решение; не предполагается, что старые App Service, Semantic Kernel или Prompt Flow описывают текущий стандарт.

**Быстрый старт**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Многоагентное управление для AI туристических агентов MCP

**Репозиторий**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Сервисы**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP-серверы (.NET, Python, Java, TypeScript)

**Описание**: Референсное приложение для многомодельной оркестровки ИИ с использованием трех фреймворков (LangChain.js, LlamaIndex.TS и Microsoft Agent Framework). Включает MCP (Model Context Protocol) серверы на четырех языках, развернутые как безсерверные Azure Container Apps с мониторингом OpenTelemetry.

**Быстрый старт**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Просмотрите больше шаблонов**: Посетите [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) для изучения доступных шаблонов по языкам и сценариям. Каждый связанный пример — это внешний репозиторий, а не локальный пример из данного курса; перед развертыванием ознакомьтесь с актуальными требованиями и рекомендациями для продакшена.

## Следующие шаги

1. **Попробуйте примеры**: Начните с готового шаблона, соответствующего вашему кейсу
2. **Настройте под свои нужды**: Измените инфраструктуру и код приложения
3. **Добавьте мониторинг**: Внедрите комплексную наблюдаемость
4. **Оптимизируйте затраты**: Подстройте конфигурации под бюджет
5. **Обеспечьте безопасность развертывания**: Внедрите корпоративные паттерны безопасности
6. **Масштабируйте для продакшена**: Добавьте многорегиональность и высокую доступность

## 🎯 Практические задания

### Задание 1: Развертывание чат-приложения Microsoft Foundry Models (30 минут)
**Цель**: Развернуть и протестировать референсное AI-чат приложение

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

**Критерии успеха:**
- [ ] Развертывание прошло без ошибок квоты
- [ ] Доступ к чат-интерфейсу из браузера
- [ ] Возможность задавать вопросы и получать ответы с помощью ИИ
- [ ] Application Insights отображает телеметрические данные
- [ ] Ресурсы успешно очищены

**Стоимость:** Ознакомьтесь с текущим прайс-листом и выбранными SKU перед развертыванием. Оплата продолжается, пока ресурсы не удалены; фиксированной 30-минутной оценки для всех конфигураций нет.

### Задание 2: Настройка развертывания нескольких моделей (45 минут)
**Цель**: Развернуть несколько моделей ИИ с разными конфигурациями

**Стартовая точка:** Наличие аккаунта Azure OpenAI и модуля ресурсной группы AZD, способного вызывать этот файл. Создайте `infra/ai-models.bicep` со следующим содержимым в вашем редакторе. Он не развертывается автоматически, просто потому что находится под `infra/`.

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

Из модуля с областью ресурсной группы, который владеет аккаунтом, добавьте вызов модуля (адаптируйте имя символа под ваш аккаунт):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Не объявляйте одни и те же развертывания в обоих модулях. Если входная точка AZD — область подписки, вызывайте этот модуль из его дочернего модуля с областью ресурсной группы и настройте относительный путь. Соберите содержащий модуль с помощью `az bicep build --file <path-to-containing-module>`, затем:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Критерии успеха:**
- [ ] Несколько моделей успешно развернуты
- [ ] Применены разные настройки производительности
- [ ] Модели доступны через API
- [ ] Можно вызывать обе модели из приложения

### Задание 3: Реализация мониторинга затрат (20 минут)
**Цель**: Настроить уведомления о бюджете и отслеживание расходов

**Стартовая точка:** Паттерн бюджета выше и модуль инфраструктуры с областью ресурсной группы. Добавьте этот ресурс через редактор; передайте `budgetStartDate` из вашей карты параметров (не дублируйте параметр, если он уже объявлен). Замените получателя и подтвердите наличие прав на запись бюджета.

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

Ожидается: ответ содержит `amount: 200`, оба порога и вашего получателя. Проверьте Cost Management в портале для актуальных начислений; данные о расходах задерживаются, а тревога может не сработать в коротком упражнении.

**Критерии успеха:**
- [ ] В Azure создано уведомление о бюджете
- [ ] Настроены email-уведомления
- [ ] Можно просматривать данные о расходах в Azure Portal
- [ ] Пороги бюджета выставлены корректно

## 💡 Часто задаваемые вопросы

<details>
<summary><strong>Как снизить затраты на Microsoft Foundry Models во время разработки?</strong></summary>

1. **Проверяйте цены**: Нет универсального бесплатного лимита в 50 000 токенов в месяц для моделей Azure OpenAI
2. **Подбирайте мощность по размеру**: Мощность `10` обычно соответствует 10 000 TPM для этих стандартных текстовых моделей, а не 10 TPM. Снижение этого лимита скорости не снижает цены за токен
3. **Используйте azd down**: Удаляйте временные ресурсы, когда не ведете активную разработку (это не деаллоцирование)
4. **Кэшируйте ответы**: Реализуйте Redis-кэш для повторяющихся запросов
5. **Используйте оптимизацию запросов**: Снижайте использование токенов через эффективные подсказки (prompt engineering)

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>В чем разница между Microsoft Foundry Models и OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Корпоративная безопасность и соответствие требованиям
- Интеграция с приватной сетью
- Гарантии уровня обслуживания (SLA)
- Аутентификация через управляемые удостоверения
- Доступны более высокие квоты

**OpenAI API**: Отдельный провайдер/интерфейс с собственной доступностью моделей, ценообразованием, аутентификацией и вариантами интеграции для корпоративных клиентов. Сравнивайте актуальные предложения, не предполагая, что он предназначен только для публичного интернета или что модели там всегда появляются первыми.

Выбирайте согласно требованиям вашей организации; примеры с управляемыми удостоверениями и приватными ссылками Azure из этого курса применимы к сервисам, хостящимся в Azure, а не ко всем моделям/провайдерам в каталоге Foundry.
</details>

<details>
<summary><strong>Что делать при ошибках превышения квот Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Могу ли я использовать свои данные с Microsoft Foundry Models?</strong></summary>

Да! Используйте **Azure AI Search** для RAG (Retrieval Augmented Generation):

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

Смотрите шаблон [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Как обеспечить безопасность конечных точек моделей ИИ?</strong></summary>

**Лучшие практики**:
1. Используйте управляемые удостоверения (без API-ключей)
2. Включите приватные конечные точки
3. Настройте сетевые группы безопасности
4. Внедрите ограничение скорости запросов
5. Используйте Azure Key Vault для секретов

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

## Сообщество и поддержка

- **Microsoft Foundry Discord**: [#Azure канал](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Проблемы и дискуссии](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Официальная документация](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Навык Microsoft Foundry на skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Установите агента Azure + Foundry в редактор с помощью `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация по главам:**
- **📚 Главная курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 2 — Разработка на основе ИИ
- **⬅️ Предыдущая глава**: [Глава 1: Ваш первый проект](../chapter-01-foundation/first-project.md)
- **➡️ Следующая**: [ИИ-агенты](agents.md)
- **🚀 Следующая глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

**Нужна помощь?** Присоединяйтесь к обсуждениям в сообществе или создайте issue в репозитории. Сообщество Azure AI + AZD готово помочь вам добиться успеха!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->