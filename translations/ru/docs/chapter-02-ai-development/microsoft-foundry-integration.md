# Интеграция Microsoft Foundry с AZD

**Навигация по главам:**
- **📚 Главная курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 2 – AI-первый подход к разработке
- **⬅️ Предыдущая глава**: [Глава 1: Ваш первый проект](../chapter-01-foundation/first-project.md)
- **➡️ Следующая**: [Развертывание AI-модели](ai-model-deployment.md)
- **🚀 Следующая глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

## Обзор

Это руководство демонстрирует, как интегрировать сервисы Microsoft Foundry с Azure Developer CLI (AZD) для упрощения развертывания AI-приложений. Microsoft Foundry предоставляет комплексную платформу для создания, развертывания и управления AI-приложениями, а AZD упрощает инфраструктуру и процесс развертывания.

## Что такое Microsoft Foundry?

Microsoft Foundry — это единая платформа Microsoft для разработки AI, которая включает:

- **Каталог моделей**: Доступ к современным AI-моделям
- **Prompt Flow**: Визуальный конструктор AI-рабочих процессов
- **Портал Microsoft Foundry**: Интегрированная среда разработки AI-приложений
- **Опции развертывания**: Различные варианты хостинга и масштабирования
- **Безопасность и ответственность**: Встроенные функции ответственного AI

## AZD + Microsoft Foundry: лучше вместе

| Функция | Microsoft Foundry | Преимущества интеграции AZD |
|---------|-----------------|-----------------------------|
| **Развертывание моделей** | Ручное развертывание через портал | Автоматизированные, повторяемые развертывания |
| **Инфраструктура** | Пошаговое предоставление через клик | Инфраструктура как код (Bicep) |
| **Управление средами** | Фокус на одной среде | Много сред (dev/staging/prod) |
| **Интеграция CI/CD** | Ограниченная | Встроенная поддержка GitHub Actions |
| **Управление расходами** | Базовый мониторинг | Оптимизация затрат по средам |

## Необходимые условия

- Подписка Azure с соответствующими правами
- Установленный Azure Developer CLI
- Доступ к сервисам Microsoft Foundry Models
- Базовое знакомство с Microsoft Foundry

## Основные паттерны интеграции

### Паттерн 1: Интеграция Microsoft Foundry Models

**Сценарий использования**: Развертывание чат-приложений с моделями Microsoft Foundry Models

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

### Паттерн 2: Интеграция AI Search + RAG

**Сценарий использования**: Развертывание приложений с генерацией на основе извлечения (RAG)

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

### Паттерн 3: Интеграция Document Intelligence

**Сценарий использования**: Рабочие процессы обработки и анализа документов

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

## 🔧 Паттерны конфигурации

### Настройка переменных окружения

**Конфигурация для продакшена:**
```bash
# Основные сервисы ИИ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Конфигурации моделей
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Настройки производительности
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Конфигурация для разработки:**
```bash
# Оптимизированные по стоимости настройки для разработки
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Бесплатный уровень
```

### Безопасная конфигурация с Key Vault

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

## Рабочие процессы развертывания

### Расширения AZD для Foundry

AZD предоставляет расширения с AI-специфическими возможностями для работы с сервисами Microsoft Foundry:

```bash
# Установить расширение агентов Foundry
azd extension install azure.ai.agents

# Установить расширение тонкой настройки
azd extension install azure.ai.finetune

# Установить расширение пользовательских моделей
azd extension install azure.ai.models

# Список установленных расширений
azd extension list
```

### Развертывание с помощью агента через `azd ai`

Если у вас есть манифест агента, используйте `azd ai agent init` для создания проекта с подключением к Foundry Agent Service:

```bash
# Инициализация из манифеста агента
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Развернуть в Azure
azd up
```

Смотрите [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) для полного справочника по командам и флагам.

### Развертывание одной командой

```bash
# Развернуть всё одной командой
azd up

# Или развернуть постепенно
azd provision  # Только инфраструктура
azd deploy     # Только приложение
```

### Развертывание с учетом среды

```bash
# Среда разработки
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Производственная среда
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

### Мониторинг затрат

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

### Конфигурация автмасштабирования

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

## Часто встречающиеся проблемы и их решение

### Проблема 1: Превышение квоты OpenAI

**Симптомы:**
- Ошибки квоты при развертывании
- Код ошибки 429 в логах приложения

**Решения:**
```bash
# Проверить текущее использование квоты
az cognitiveservices usage list --location eastus

# Попробуйте другой регион
azd env set AZURE_LOCATION westus2
azd up

# Временно уменьшить мощность
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Проблема 2: Ошибки аутентификации

**Симптомы:**
- Ошибки 401/403 при вызове AI-сервисов
- Сообщения «Доступ запрещён»

**Решения:**
```bash
# Проверить назначения ролей
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Проверить конфигурацию управляемой идентификации
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Проверить доступ к Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Проблема 3: Ошибки развертывания моделей

**Симптомы:**
- Модели недоступны при развертывании
- Сбои отдельных версий моделей

**Решения:**
```bash
# Перечислить доступные модели по регионам
az cognitiveservices model list --location eastus

# Обновить версию модели в шаблоне bicep
# Проверить требования к емкости модели
```

## Примеры шаблонов

### RAG чат-приложение (Python)

**Репозиторий**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Сервисы**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Описание**: Самый популярный образец Azure AI — готовое к продакшену RAG-чат-приложение, позволяющее задавать вопросы на основе собственных документов. Использует GPT-4.1-mini для чата, text-embedding-ada-002 для эмбеддингов и Azure AI Search для поиска. Поддерживает мультимодальные документы, голосовой ввод/вывод, аутентификацию Microsoft Entra и трассировку Application Insights.

**Быстрый старт**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG чат-приложение (.NET)

**Репозиторий**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Сервисы**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Описание**: .NET/C# версия Python-образца RAG-чата. Построено с использованием ASP.NET Core Minimal API и Blazor WebAssembly frontend. Включает голосовой чат, поддержку GPT-4o-mini vision и сопроводительное приложение .NET MAUI Blazor Hybrid для настольных и мобильных устройств.

**Быстрый старт**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG чат-приложение (Java)

**Репозиторий**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Сервисы**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Описание**: Java-версия RAG-чата с использованием Langchain4J для оркестрации AI. Поддерживает архитектуру микросервисов с событийно-ориентированным взаимодействием, несколько стратегий поиска (текст, вектор, гибрид), загрузку документов с Azure Document Intelligence и развертывание на Azure Container Apps или Azure Kubernetes Service.

**Быстрый старт**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Корпоративный розничный помощник с Azure AI Foundry

**Репозиторий**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Сервисы**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Описание**: Конечное решение RAG-помощника для розничной торговли с использованием Azure AI Foundry и Prompty. Чат-бот Contoso Outdoor, основывающий ответы на данных каталога продуктов и заказов клиентов. Демонстрирует полный рабочий процесс GenAIOps — прототипирование с Prompty, оценка с помощью AI-помощников и развертывание через AZD в Container Apps.

**Быстрый старт**:
```bash
azd init --template contoso-chat
azd up
```

### Многоагентное приложение для творческого письма

**Репозиторий**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Сервисы**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Описание**: Пример многоагентной оркестрации AI с Prompty. Включает исследовательского агента (Bing Grounding в Azure AI Agent Service), продукта-агента (Azure AI Search), агента-писателя и агента-редактора для совместного создания хорошо проработанных статей. Включает CI/CD с оценкой через GitHub Actions.

**Быстрый старт**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Безсерверный RAG чат (JavaScript/TypeScript)

**Репозиторий**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Сервисы**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB для NoSQL + LangChain.js

**Описание**: Полностью безсерверный RAG-чатбот с использованием LangChain.js, Azure Functions для API и Azure Static Web Apps для хостинга. Использует Azure Cosmos DB как векторное хранилище и базу истории чата. Поддерживает локальную разработку с Ollama для бесплатного тестирования.

**Быстрый старт**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Ускоритель решения «Чат с данными»

**Репозиторий**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Сервисы**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Описание**: Корпоративный ускоритель решения RAG с административным порталом для загрузки/управления документами, несколькими опциями оркестрации (Semantic Kernel, LangChain, Prompt Flow), речевым вводом, интеграцией Microsoft Teams и выбором между PostgreSQL или Cosmos DB в качестве базы. Предназначен как настраиваемая стартовая площадка для продакшен-сценариев RAG.

**Быстрый старт**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### Многоагентные туристические агенты — оркестрация MCP

**Репозиторий**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Сервисы**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP-серверы (.NET, Python, Java, TypeScript)

**Описание**: Референсное приложение для многоагентной AI-оркестрации с использованием трёх фреймворков (LangChain.js, LlamaIndex.TS и Microsoft Agent Framework). Включает MCP (Model Context Protocol) серверы на четырёх языках, развернутые как безсерверные Azure Container Apps с мониторингом OpenTelemetry.

**Быстрый старт**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Стартовый шаблон Azure AI

**Репозиторий**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Сервисы**: Azure AI Services + Azure OpenAI

**Описание**: Минимальный шаблон Bicep, который разворачивает сервисы Azure AI с настроенными моделями машинного обучения. Легкий старт, когда необходимо только развернуть инфраструктуру Azure AI без полного стека приложения.

**Быстрый старт**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Просмотреть больше шаблонов**: Посетите [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) с более чем 80 AI-специфичными шаблонами AZD для разных языков и сценариев.

## Следующие шаги

1. **Попробуйте примеры**: Начните с готового шаблона, соответствующего вашему случаю
2. **Настройте под свои нужды**: Измените инфраструктуру и код приложения
3. **Добавьте мониторинг**: Реализуйте полную наблюдаемость
4. **Оптимизируйте затраты**: Тонко настройте конфигурации под бюджет
5. **Обеспечьте безопасность развертывания**: Внедрите корпоративные шаблоны безопасности
6. **Масштабируйте до продакшена**: Добавьте мульти-региональную и высокодоступную архитектуру

## 🎯 Практические задания

### Задание 1: Развернуть чат-приложение с Microsoft Foundry Models (30 минут)
**Цель**: Развернуть и протестировать готовое к продакшену AI чат-приложение

```bash
# Инициализация шаблона
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Установить переменные окружения
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Развертывание
azd up

# Тестирование приложения
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Мониторинг операций ИИ
azd monitor

# Очистка
azd down --force --purge
```

**Критерии успеха:**
- [ ] Развертывание прошло без ошибок квоты
- [ ] Можно открыть интерфейс чата в браузере
- [ ] Можно задавать вопросы и получать AI-ответы
- [ ] Application Insights отображает телеметрию
- [ ] Ресурсы успешно удалены после теста

**Оценочная стоимость**: $5-10 за 30 минут тестирования

### Задание 2: Настроить развертывание нескольких моделей (45 минут)
**Цель**: Развернуть несколько AI-моделей с разными конфигурациями

```bash
# Создайте пользовательскую конфигурацию Bicep
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

# Разверните и проверьте
azd provision
azd show
```

**Критерии успеха:**
- [ ] Несколько моделей успешно развернуты
- [ ] Применены разные настройки мощности
- [ ] Модели доступны через API
- [ ] Можно вызывать обе модели из приложения

### Задание 3: Внедрить мониторинг затрат (20 минут)
**Цель**: Настроить уведомления о бюджете и отслеживание расходов

```bash
# Добавить предупреждение о бюджете в Bicep
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

# Развернуть предупреждение о бюджете
azd provision

# Проверить текущие расходы
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Критерии успеха:**
- [ ] Уведомление о бюджете создано в Azure
- [ ] Настроены email-уведомления
- [ ] Можно просматривать данные о расходах в Azure Portal
- [ ] Пороговые значения бюджета установлены правильно

## 💡 Часто задаваемые вопросы

<details>
<summary><strong>Как снизить затраты на Microsoft Foundry Models во время разработки?</strong></summary>

1. **Используйте бесплатный тарифный план**: Microsoft Foundry Models предлагает 50 000 токенов в месяц бесплатно
2. **Уменьшите мощность**: Установите 10 TPM вместо 30+ для разработки
3. **Используйте azd down**: Освобождайте ресурсы, когда не ведёте активную разработку
4. **Кэшируйте ответы**: Реализуйте кеш Redis для повторяющихся запросов
5. **Оптимизируйте промпты**: Сократите использование токенов с помощью эффективных промптов

```bash
# Конфигурация разработки
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>В чем разница между Microsoft Foundry Models и OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Корпоративная безопасность и соответствие требованиям
- Интеграция с приватной сетью
- Гарантии SLA
- Аутентификация с управляемой идентичностью
- Доступны повышенные квоты

**OpenAI API**:
- Быстрый доступ к новым моделям
- Простая настройка
- Низкий порог входа
- Только публичный интернет

Для производственных приложений **рекомендуется Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Как справиться с ошибками превышения квоты в Microsoft Foundry Models?</strong></summary>

```bash
# Проверить текущую квоту
az cognitiveservices usage list --location eastus2

# Попробовать другой регион
azd env set AZURE_LOCATION westus2
azd up

# Временно уменьшить вместимость
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Запросить увеличение квоты
# Перейти в Azure Portal > Quotas > Запросить увеличение
```
</details>

<details>
<summary><strong>Могу ли я использовать свои данные с Microsoft Foundry Models?</strong></summary>

Да! Используйте **Azure AI Search** для RAG (генерация с пополнением извлечением):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Смотрите шаблон [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Как обеспечить безопасность конечных точек AI-моделей?</strong></summary>

**Лучшие практики**:
1. Используйте Managed Identity (без API ключей)
2. Включите Private Endpoints
3. Настройте группы сетевой безопасности
4. Реализуйте ограничение скорости
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

- **Microsoft Foundry Discord**: [канал #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Проблемы и обсуждения](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Официальная документация](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Навык Microsoft Foundry на skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Установите навыки агента Azure + Foundry в вашем редакторе с помощью `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация по главам:**
- **📚 Главная курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 2 - Разработка с приоритетом AI
- **⬅️ Предыдущая глава**: [Глава 1: Ваш первый проект](../chapter-01-foundation/first-project.md)
- **➡️ Следующая**: [Развертывание AI-моделей](ai-model-deployment.md)
- **🚀 Следующая глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

**Нужна помощь?** Присоединяйтесь к обсуждениям сообщества или откройте проблему в репозитории. Сообщество Azure AI + AZD готово помочь вам достичь успеха!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:  
Этот документ был переведен с использованием автоматической системы перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши стремления к точности, просьба учитывать, что машинный перевод может содержать ошибки и неточности. Оригинальный документ на исходном языке следует считать достоверным источником информации. Для получения критически важной информации рекомендуется обращаться к профессиональному переводчику-человеку. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->