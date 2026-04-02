# Интеграция Microsoft Foundry с AZD

**Навигация по главам:**
- **📚 Главная курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 2 – Разработка с приоритетом ИИ
- **⬅️ Предыдущая глава**: [Глава 1: Ваш первый проект](../chapter-01-foundation/first-project.md)
- **➡️ Следующая**: [Развертывание модели ИИ](ai-model-deployment.md)
- **🚀 Следующая глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

## Обзор

В этом руководстве показано, как интегрировать сервисы Microsoft Foundry с Azure Developer CLI (AZD) для упрощенного развертывания ИИ-приложений. Microsoft Foundry предоставляет комплексную платформу для создания, развертывания и управления ИИ-приложениями, а AZD упрощает процесс инфраструктуры и развертывания.

## Что такое Microsoft Foundry?

Microsoft Foundry — это унифицированная платформа Microsoft для разработки ИИ, которая включает:

- **Каталог моделей**: Доступ к передовым моделям ИИ
- **Prompt Flow**: Визуальный дизайнер рабочих процессов ИИ
- **Портал Microsoft Foundry**: Интегрированная среда разработки ИИ-приложений
- **Варианты развертывания**: Несколько опций хостинга и масштабирования
- **Безопасность и защита**: Встроенные возможности ответственного ИИ

## AZD + Microsoft Foundry: лучше вместе

| Возможность | Microsoft Foundry | Преимущество интеграции с AZD |
|-------------|-------------------|-------------------------------|
| **Развертывание моделей** | Ручное развертывание через портал | Автоматизированные, повторяемые развертывания |
| **Инфраструктура** | Процедура с кликами | Инфраструктура как код (Bicep) |
| **Управление средами** | Фокус на одной среде | Много сред (dev/staging/prod) |
| **Интеграция CI/CD** | Ограниченная | Нативная поддержка GitHub Actions |
| **Управление затратами** | Базовый мониторинг | Оптимизация затрат по средам |

## Требования

- Подписка Azure с соответствующими правами
- Установленный Azure Developer CLI
- Доступ к сервисам Microsoft Foundry Models
- Базовое знакомство с Microsoft Foundry

> **Текущий базовый уровень AZD:** Эти примеры проверялись на `azd` версии `1.23.12`. Для рабочих процессов агентов ИИ используйте текущий предварительный выпуск расширения и проверьте вашу установленную версию перед началом.

## Основные шаблоны интеграции

### Шаблон 1: Интеграция Microsoft Foundry Models

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

### Шаблон 2: Интеграция AI Search + RAG

**Сценарий использования**: Развертывание приложений с генерацией, дополненной поиском (RAG)

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

### Шаблон 3: Интеграция Document Intelligence

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

## 🔧 Шаблоны конфигурации

### Настройка переменных окружения

**Конфигурация для продакшена:**
```bash
# Основные сервисы ИИ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Конфигурации моделей
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Настройки производительности
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Конфигурация для разработки:**
```bash
# Настройки, оптимизированные по стоимости для разработки
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

AZD предоставляет расширения, добавляющие функции, специфичные для ИИ и работы с сервисами Microsoft Foundry:

```bash
# Установить расширение агентов Foundry
azd extension install azure.ai.agents

# Установить расширение для тонкой настройки
azd extension install azure.ai.finetune

# Установить расширение пользовательских моделей
azd extension install azure.ai.models

# Список установленных расширений
azd extension list --installed

# Проверить версию установленного расширения агента
azd extension show azure.ai.agents
```

Расширения ИИ находятся в активной разработке в режиме предварительного просмотра. Если команда работает иначе, чем показано здесь, обновите соответствующее расширение перед устранением неполадок проекта.

### Развертывание с приоритетом агентам с `azd ai`

Если у вас есть манифест агента, используйте `azd ai agent init` для создания проекта с интеграцией с сервисом Foundry Agent Service:

```bash
# Инициализация из манифеста агента
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Развернуть в Azure
azd up
```

В последних предварительных релизах `azure.ai.agents` добавлена поддержка инициализации на основе шаблонов для `azd ai agent init`. Если вы следуете более новым примерам с агентами, посмотрите справку расширения по доступным флагам в вашей установленной версии.

Смотрите [Команды AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) для полного справочника команд и флагов.

### Развертывание одной командой

```bash
# Развернуть всё одной командой
azd up

# Или развернуть поэтапно
azd provision  # Только инфраструктура
azd deploy     # Только приложение

# Для длительных развертываний AI-приложений в azd 1.23.11+
azd deploy --timeout 1800
```

### Развертывания по средам

```bash
# Среда разработки
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Промышленная среда
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Мониторинг и наблюдаемость

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

## Устранение распространенных проблем

### Проблема 1: Превышение квоты OpenAI

**Симптомы:**
- Развертывание не удаётся из-за ошибок квоты
- Ошибки 429 в логах приложения

**Решения:**
```bash
# Проверьте текущее использование квоты
az cognitiveservices usage list --location eastus

# Попробуйте другой регион
azd env set AZURE_LOCATION westus2
azd up

# Временно уменьшите мощность
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Проблема 2: Ошибки аутентификации

**Симптомы:**
- Ошибки 401/403 при вызове ИИ-сервисов
- Сообщения "Доступ запрещён"

**Решения:**
```bash
# Проверить назначение ролей
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Проверить конфигурацию управляемой идентичности
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Проверить доступ к Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Проблема 3: Ошибки развертывания моделей

**Симптомы:**
- Модели недоступны при развертывании
- Ошибки конкретных версий моделей

**Решения:**
```bash
# Список доступных моделей по регионам
az cognitiveservices model list --location eastus

# Обновить версию модели в шаблоне bicep
# Проверить требования к емкости модели
```

## Примеры шаблонов

### RAG чат-приложение (Python)

**Репозиторий**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Сервисы**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Описание**: Самый популярный пример Azure AI — готовое к производству RAG чат-приложение для задавания вопросов на основе ваших документов. Использует GPT-4.1-mini для чата, text-embedding-3-large для эмбеддингов и Azure AI Search для поиска. Поддерживает мультимодальные документы, голосовой ввод/вывод, аутентификацию Microsoft Entra и трассировку Application Insights.

**Быстрый старт**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG чат-приложение (.NET)

**Репозиторий**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Сервисы**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Описание**: .NET/C# эквивалент Python-примера RAG чата. Построено на ASP.NET Core Minimal API и Blazor WebAssembly фронтенде. Включает голосовой чат, поддержку GPT-4o-mini vision и сопутствующий .NET MAUI Blazor гибридный клиент для настольных и мобильных устройств.

**Быстрый старт**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG чат-приложение (Java)

**Репозиторий**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Сервисы**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Описание**: Java-версия примера RAG чата с использованием Langchain4J для оркестрации ИИ. Поддерживает микросервисную событийно-ориентированную архитектуру, несколько стратегий поиска (текст, вектор, гибрид), загрузку документов с Azure Document Intelligence и развертывание на Azure Container Apps или Azure Kubernetes Service.

**Быстрый старт**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Корпоративный розничный помощник с Azure AI Foundry

**Репозиторий**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Сервисы**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Описание**: Полный розничный помощник RAG с использованием Azure AI Foundry и Prompty. Чатбот Contoso Outdoor, который основывает ответы на данных каталога продукции и заказов клиентов. Демонстрирует полный рабочий процесс GenAIOps — прототипирование с Prompty, оценку с помощниками на базе ИИ и развертывание через AZD в Container Apps.

**Быстрый старт**:
```bash
azd init --template contoso-chat
azd up
```

### Многоагентное приложение для творческого письма

**Репозиторий**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Сервисы**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Описание**: Многоагентный пример, демонстрирующий оркестрацию агентов ИИ с Prompty. Использует исследовательского агента (Bing Grounding в Azure AI Agent Service), агент продукта (Azure AI Search), агента писателя и агента редактора для совместного создания хорошо исследованных статей. Включает CI/CD с оценкой в GitHub Actions.

**Быстрый старт**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Безсерверный RAG чат (JavaScript/TypeScript)

**Репозиторий**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Сервисы**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB для NoSQL + LangChain.js

**Описание**: Полностью безсерверный RAG чатбот с использованием LangChain.js и Azure Functions для API, Azure Static Web Apps для хостинга. Использует Azure Cosmos DB как векторное хранилище и базу истории чатов. Поддерживает локальную разработку с Ollama для бесплатного тестирования.

**Быстрый старт**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Ускоритель решения Chat with Your Data

**Репозиторий**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Сервисы**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Описание**: Корпоративное RAG решение с порталом администратора для загрузки и управления документами, несколькими вариантами оркестратора (Semantic Kernel, LangChain, Prompt Flow), распознаванием речи, интеграцией с Microsoft Teams и выбором бекенда PostgreSQL или Cosmos DB. Предназначено как настраиваемая стартовая точка для производственных сценариев RAG.

**Быстрый старт**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI туристические агенты — многоагентная оркестрация MCP

**Репозиторий**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Сервисы**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP серверы (.NET, Python, Java, TypeScript)

**Описание**: Опорное приложение для многоагентной оркестрации ИИ с тремя фреймворками (LangChain.js, LlamaIndex.TS и Microsoft Agent Framework). Обладает MCP (Model Context Protocol) серверами на четырёх языках, развернутыми как безсерверные Azure Container Apps с мониторингом OpenTelemetry.

**Быстрый старт**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Начальный шаблон Azure AI

**Репозиторий**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Сервисы**: Сервисы Azure AI + Azure OpenAI

**Описание**: Минимальный шаблон Bicep, который разворачивает сервисы Azure AI с настроенными моделями машинного обучения. Легковесная отправная точка, если вам нужна только инфраструктура Azure AI без полного стека приложения.

**Быстрый старт**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Посмотреть больше шаблонов**: Посетите [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) с более чем 80 шаблонами AZD, специфичными для ИИ, на разных языках и сценариях.

## Следующие шаги

1. **Попробуйте примеры**: Начните с готового шаблона, соответствующего вашему сценарию
2. **Настройте под свои нужды**: Измените инфраструктуру и код приложения
3. **Добавьте мониторинг**: Реализуйте полноценную наблюдаемость
4. **Оптимизируйте затраты**: Тонко настройте конфигурации под бюджет
5. **Обеспечьте безопасность развертывания**: Внедрите корпоративные шаблоны безопасности
6. **Масштабируйтесь в продакшен**: Добавьте многорегиональные и высокодоступные функции

## 🎯 Практические задания

### Упражнение 1: Развертывание чат-приложения Microsoft Foundry Models (30 минут)
**Цель**: Развернуть и протестировать готовое к использованию ИИ чат-приложение

```bash
# Инициализация шаблона
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Установить переменные окружения
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Развернуть
azd up

# Тестировать приложение
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Контролировать операции ИИ
azd monitor

# Очистить
azd down --force --purge
```

**Критерии успеха:**
- [ ] Развертывание прошло без ошибок квоты
- [ ] Доступ к интерфейсу чата через браузер
- [ ] Возможность задавать вопросы и получать ответы с ИИ
- [ ] Application Insights отображает телеметрию
- [ ] Ресурсы успешно удалены после теста

**Оценочная стоимость:** 5-10 долларов за 30 минут тестирования

### Упражнение 2: Конфигурация развертывания с несколькими моделями (45 минут)
**Цель**: Развернуть несколько моделей ИИ с разными конфигурациями

```bash
# Создать пользовательскую конфигурацию Bicep
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

# Развернуть и проверить
azd provision
azd show
```

**Критерии успеха:**
- [ ] Несколько моделей успешно развернуты
- [ ] Применены разные параметры ёмкости
- [ ] Модели доступны через API
- [ ] Возможность вызывать обе модели из приложения

### Упражнение 3: Реализация мониторинга расходов (20 минут)
**Цель**: Настроить бюджетные оповещения и отслеживание затрат

```bash
# Добавить оповещение о бюджете в Bicep
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

# Развернуть оповещение о бюджете
azd provision

# Проверить текущие расходы
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Критерии успеха:**
- [ ] Создано оповещение о бюджете в Azure
- [ ] Настроены уведомления по электронной почте
- [ ] Можно просматривать данные о расходах в Azure Portal
- [ ] Правильно установлены пороги бюджета

## 💡 Часто задаваемые вопросы

<details>
<summary><strong>Как снизить затраты на Microsoft Foundry Models во время разработки?</strong></summary>

1. **Используйте бесплатный уровень**: Microsoft Foundry Models предлагает 50 000 токенов в месяц бесплатно
2. **Снизьте ёмкость**: Установите ёмкость 10 TPM вместо 30+ для разработки
3. **Используйте azd down**: Остановите ресурсы, когда не ведется активная разработка
4. **Кэшируйте ответы**: Реализуйте Redis-кэш для повторяющихся запросов
5. **Используйте инженеринг подсказок (Prompt Engineering)**: Сократите использование токенов с помощью эффективных подсказок
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
- Аутентификация через управляемую идентичность
- Доступны большие квоты

**OpenAI API**:
- Быстрый доступ к новым моделям
- Более простая настройка
- Более низкий порог входа
- Только общедоступный интернет

Для производственных приложений **рекомендуется Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Как обрабатывать ошибки превышения квот Microsoft Foundry Models?</strong></summary>

```bash
# Проверьте текущую квоту
az cognitiveservices usage list --location eastus2

# Попробуйте другой регион
azd env set AZURE_LOCATION westus2
azd up

# Временно уменьшите мощность
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Запросите увеличение квоты
# Перейдите в Azure Portal > Квоты > Запросить увеличение
```
</details>

<details>
<summary><strong>Могу ли я использовать свои данные с Microsoft Foundry Models?</strong></summary>

Да! Используйте **Azure AI Search** для RAG (генерация с помощью расширенного поиска):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

См. шаблон [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Как обеспечить безопасность конечных точек AI-моделей?</strong></summary>

**Лучшие практики**:
1. Используйте управляемую идентичность (без API-ключей)
2. Включите приватные конечные точки
3. Настраивайте группы безопасности сети
4. Реализуйте ограничение по количеству запросов
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
- **Agent Skills**: [Microsoft Foundry skill на skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Установите навыки агентов Azure + Foundry в редактор с помощью `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация по главам:**
- **📚 Главная курса**: [AZD Для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 2 - Разработка с приоритетом AI
- **⬅️ Предыдущая глава**: [Глава 1: Ваш первый проект](../chapter-01-foundation/first-project.md)
- **➡️ Следующая**: [Развертывание AI-модели](ai-model-deployment.md)
- **🚀 Следующая глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

**Нужна помощь?** Присоединяйтесь к обсуждениям в сообществе или создайте issue в репозитории. Сообщество Azure AI + AZD готово помочь вам добиться успеха!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия обеспечить точность, имейте в виду, что автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->