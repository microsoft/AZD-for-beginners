<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2e61bc7db9c28647211ab64e03045882",
  "translation_date": "2025-11-20T10:59:35+00:00",
  "source_file": "docs/microsoft-foundry/microsoft-foundry-integration.md",
  "language_code": "ru"
}
-->
# Интеграция Microsoft Foundry с AZD

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 2 - Разработка с приоритетом AI
- **⬅️ Предыдущая глава**: [Глава 1: Ваш первый проект](../getting-started/first-project.md)
- **➡️ Далее**: [Развертывание AI-модели](ai-model-deployment.md)
- **🚀 Следующая глава**: [Глава 3: Конфигурация](../getting-started/configuration.md)

## Обзор

Этот гид демонстрирует, как интегрировать сервисы Microsoft Foundry с Azure Developer CLI (AZD) для упрощенного развертывания AI-приложений. Microsoft Foundry предоставляет комплексную платформу для создания, развертывания и управления AI-приложениями, а AZD упрощает процесс инфраструктуры и развертывания.

## Что такое Microsoft Foundry?

Microsoft Foundry — это единая платформа Microsoft для разработки AI, включающая:

- **Каталог моделей**: Доступ к передовым AI-моделям
- **Prompt Flow**: Визуальный дизайнер для AI-рабочих процессов
- **Портал AI Foundry**: Интегрированная среда разработки для AI-приложений
- **Варианты развертывания**: Множество опций хостинга и масштабирования
- **Безопасность**: Встроенные функции ответственного AI

## AZD + Microsoft Foundry: лучше вместе

| Функция | Microsoft Foundry | Преимущества интеграции с AZD |
|---------|-----------------|------------------------|
| **Развертывание моделей** | Ручное развертывание через портал | Автоматизированные, повторяемые развертывания |
| **Инфраструктура** | Провизия через интерфейс | Инфраструктура как код (Bicep) |
| **Управление средами** | Фокус на одной среде | Мультисреда (dev/staging/prod) |
| **Интеграция CI/CD** | Ограниченная | Поддержка GitHub Actions |
| **Управление затратами** | Базовый мониторинг | Оптимизация затрат для каждой среды |

## Предварительные требования

- Подписка Azure с соответствующими разрешениями
- Установленный Azure Developer CLI
- Доступ к сервисам Azure OpenAI
- Базовые знания Microsoft Foundry

## Основные шаблоны интеграции

### Шаблон 1: Интеграция Azure OpenAI

**Сценарий использования**: Развертывание чат-приложений с моделями Azure OpenAI

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
// Azure OpenAI Account
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

### Шаблон 2: AI-поиск + интеграция RAG

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

### Шаблон 3: Интеграция анализа документов

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

### Настройка переменных среды

**Конфигурация для продакшена:**
```bash
# Основные услуги ИИ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Конфигурации модели
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

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

### Развертывание одной командой

```bash
# Разверните все одной командой
azd up

# Или развертывайте постепенно
azd provision  # Только инфраструктура
azd deploy     # Только приложение
```

### Развертывания для конкретных сред

```bash
# Среда разработки
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Среда эксплуатации
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

### Настройка авто-масштабирования

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
- Развертывание завершается с ошибками квоты
- Ошибки 429 в логах приложения

**Решения:**
```bash
# Проверить текущее использование квоты
az cognitiveservices usage list --location eastus

# Попробовать другой регион
azd env set AZURE_LOCATION westus2
azd up

# Временно уменьшить мощность
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Проблема 2: Ошибки аутентификации

**Симптомы:**
- Ошибки 401/403 при вызове AI-сервисов
- Сообщения "Доступ запрещен"

**Решения:**
```bash
# Проверить назначение ролей
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Проверить конфигурацию управляемой идентичности
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Проверить доступ к Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Проблема 3: Проблемы с развертыванием моделей

**Симптомы:**
- Модели недоступны в развертывании
- Ошибки для конкретных версий моделей

**Решения:**
```bash
# Список доступных моделей по регионам
az cognitiveservices model list --location eastus

# Обновить версию модели в шаблоне bicep
# Проверить требования к емкости модели
```

## Примеры шаблонов

### Базовое чат-приложение

**Репозиторий**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Сервисы**: Azure OpenAI + Cognitive Search + App Service

**Быстрый старт**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Конвейер обработки документов

**Репозиторий**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Сервисы**: Document Intelligence + Storage + Functions

**Быстрый старт**:
```bash
azd init --template ai-document-processing
azd up
```

### Корпоративный чат с RAG

**Репозиторий**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Сервисы**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Быстрый старт**:
```bash
azd init --template contoso-chat
azd up
```

## Следующие шаги

1. **Попробуйте примеры**: Начните с готового шаблона, подходящего для вашего сценария
2. **Настройте под свои нужды**: Измените инфраструктуру и код приложения
3. **Добавьте мониторинг**: Реализуйте полный набор инструментов наблюдаемости
4. **Оптимизируйте затраты**: Настройте конфигурации в соответствии с вашим бюджетом
5. **Обеспечьте безопасность развертывания**: Реализуйте корпоративные шаблоны безопасности
6. **Масштабируйте до продакшена**: Добавьте функции мульти-региона и высокой доступности

## 🎯 Практические упражнения

### Упражнение 1: Развертывание чат-приложения Azure OpenAI (30 минут)
**Цель**: Развернуть и протестировать готовое к продакшену AI чат-приложение

```bash
# Инициализировать шаблон
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Установить переменные окружения
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Развернуть
azd up

# Протестировать приложение
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Мониторинг операций ИИ
azd monitor

# Очистить
azd down --force --purge
```

**Критерии успеха:**
- [ ] Развертывание завершается без ошибок квоты
- [ ] Доступ к интерфейсу чата через браузер
- [ ] Возможность задавать вопросы и получать ответы от AI
- [ ] Application Insights показывает данные телеметрии
- [ ] Успешная очистка ресурсов

**Оценочная стоимость**: $5-10 за 30 минут тестирования

### Упражнение 2: Настройка развертывания нескольких моделей (45 минут)
**Цель**: Развернуть несколько AI-моделей с различными конфигурациями

```bash
# Создать пользовательскую конфигурацию Bicep
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
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

# Развернуть и проверить
azd provision
azd show
```

**Критерии успеха:**
- [ ] Несколько моделей успешно развернуты
- [ ] Применены разные настройки мощности
- [ ] Модели доступны через API
- [ ] Возможность вызова обеих моделей из приложения

### Упражнение 3: Реализация мониторинга затрат (20 минут)
**Цель**: Настроить оповещения о бюджете и отслеживание затрат

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
- [ ] Данные о затратах видны в Azure Portal
- [ ] Установлены соответствующие пороги бюджета

## 💡 Часто задаваемые вопросы

<details>
<summary><strong>Как снизить затраты на Azure OpenAI во время разработки?</strong></summary>

1. **Используйте бесплатный уровень**: Azure OpenAI предоставляет 50,000 токенов/месяц бесплатно
2. **Снизьте мощность**: Установите мощность на 10 TPM вместо 30+ для разработки
3. **Используйте azd down**: Освобождайте ресурсы, когда активно не разрабатываете
4. **Кэшируйте ответы**: Реализуйте Redis-кэш для повторяющихся запросов
5. **Используйте Prompt Engineering**: Снижайте использование токенов с помощью эффективных запросов

```bash
# Конфигурация разработки
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>В чем разница между Azure OpenAI и OpenAI API?</strong></summary>

**Azure OpenAI**:
- Корпоративная безопасность и соответствие требованиям
- Интеграция с приватной сетью
- Гарантии SLA
- Аутентификация через управляемую идентичность
- Доступны более высокие квоты

**OpenAI API**:
- Быстрый доступ к новым моделям
- Более простая настройка
- Низкий порог входа
- Только публичный интернет

Для продакшен-приложений **рекомендуется Azure OpenAI**.
</details>

<details>
<summary><strong>Как справляться с ошибками превышения квоты Azure OpenAI?</strong></summary>

```bash
# Проверить текущую квоту
az cognitiveservices usage list --location eastus2

# Попробовать другой регион
azd env set AZURE_LOCATION westus2
azd up

# Временно уменьшить мощность
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Запросить увеличение квоты
# Перейти в Azure Portal > Квоты > Запросить увеличение
```
</details>

<details>
<summary><strong>Могу ли я использовать свои данные с Azure OpenAI?</strong></summary>

Да! Используйте **Azure AI Search** для RAG (Retrieval Augmented Generation):

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
<summary><strong>Как защитить конечные точки AI-моделей?</strong></summary>

**Лучшие практики**:
1. Используйте управляемую идентичность (без API-ключей)
2. Включите приватные конечные точки
3. Настройте группы безопасности сети
4. Реализуйте ограничение скорости
5. Используйте Azure Key Vault для хранения секретов

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

- **Discord Microsoft Foundry**: [#Azure канал](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Вопросы и обсуждения](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Официальная документация](https://learn.microsoft.com/azure/ai-studio/)

---

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 2 - Разработка с приоритетом AI
- **⬅️ Предыдущая глава**: [Глава 1: Ваш первый проект](../getting-started/first-project.md)
- **➡️ Далее**: [Развертывание AI-модели](ai-model-deployment.md)
- **🚀 Следующая глава**: [Глава 3: Конфигурация](../getting-started/configuration.md)

**Нужна помощь?** Присоединяйтесь к обсуждениям сообщества или создайте вопрос в репозитории. Сообщество Azure AI + AZD готово помочь вам добиться успеха!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:  
Этот документ был переведен с использованием сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия обеспечить точность, автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его родном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные интерпретации, возникшие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->