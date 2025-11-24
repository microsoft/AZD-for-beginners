<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2e61bc7db9c28647211ab64e03045882",
  "translation_date": "2025-11-24T00:09:40+00:00",
  "source_file": "docs/microsoft-foundry/microsoft-foundry-integration.md",
  "language_code": "uk"
}
-->
# Інтеграція Microsoft Foundry з AZD

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка з акцентом на AI
- **⬅️ Попередній розділ**: [Розділ 1: Ваш перший проєкт](../getting-started/first-project.md)
- **➡️ Далі**: [Розгортання AI-моделі](ai-model-deployment.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../getting-started/configuration.md)

## Огляд

Цей посібник демонструє, як інтегрувати сервіси Microsoft Foundry з Azure Developer CLI (AZD) для спрощеного розгортання AI-додатків. Microsoft Foundry надає комплексну платформу для створення, розгортання та управління AI-додатками, тоді як AZD спрощує процес інфраструктури та розгортання.

## Що таке Microsoft Foundry?

Microsoft Foundry — це єдина платформа Microsoft для розробки AI, яка включає:

- **Каталог моделей**: Доступ до найсучасніших AI-моделей
- **Prompt Flow**: Візуальний дизайнер для AI-робочих процесів
- **AI Foundry Portal**: Інтегроване середовище розробки для AI-додатків
- **Опції розгортання**: Різні варіанти хостингу та масштабування
- **Безпека**: Вбудовані функції відповідального AI

## AZD + Microsoft Foundry: краще разом

| Функція | Microsoft Foundry | Перевага інтеграції з AZD |
|---------|-----------------|------------------------|
| **Розгортання моделей** | Ручне розгортання через портал | Автоматизовані, повторювані розгортання |
| **Інфраструктура** | Налаштування через кліки | Інфраструктура як код (Bicep) |
| **Управління середовищем** | Фокус на одному середовищі | Багатосередовищна підтримка (dev/staging/prod) |
| **Інтеграція CI/CD** | Обмежена | Вбудована підтримка GitHub Actions |
| **Управління витратами** | Базовий моніторинг | Оптимізація витрат для кожного середовища |

## Попередні вимоги

- Підписка на Azure з відповідними дозволами
- Встановлений Azure Developer CLI
- Доступ до сервісів Azure OpenAI
- Базове знайомство з Microsoft Foundry

## Основні шаблони інтеграції

### Шаблон 1: Інтеграція Azure OpenAI

**Випадок використання**: Розгортання чат-додатків з моделями Azure OpenAI

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

**Інфраструктура (main.bicep):**
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

### Шаблон 2: Інтеграція AI Search + RAG

**Випадок використання**: Розгортання додатків з генерацією, доповненою пошуком (RAG)

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

### Шаблон 3: Інтеграція Document Intelligence

**Випадок використання**: Робочі процеси обробки та аналізу документів

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

## 🔧 Шаблони конфігурації

### Налаштування змінних середовища

**Конфігурація для продакшну:**
```bash
# Основні послуги штучного інтелекту
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Конфігурації моделі
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Налаштування продуктивності
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Конфігурація для розробки:**
```bash
# Налаштування, оптимізовані за вартістю для розробки
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Безкоштовний рівень
```

### Безпечна конфігурація з Key Vault

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

## Робочі процеси розгортання

### Розгортання однією командою

```bash
# Розгорніть все однією командою
azd up

# Або розгорніть поступово
azd provision  # Тільки інфраструктура
azd deploy     # Тільки додаток
```

### Розгортання для конкретного середовища

```bash
# Середовище розробки
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Середовище виробництва
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Моніторинг і спостереження

### Інтеграція з Application Insights

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

### Моніторинг витрат

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

## 🔐 Найкращі практики безпеки

### Налаштування керованої ідентичності

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

### Мережева безпека

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

## Оптимізація продуктивності

### Стратегії кешування

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

### Налаштування автоматичного масштабування

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

## Вирішення поширених проблем

### Проблема 1: Перевищення квоти OpenAI

**Симптоми:**
- Розгортання не вдається через помилки квоти
- Помилки 429 у логах додатків

**Рішення:**
```bash
# Перевірте поточне використання квоти
az cognitiveservices usage list --location eastus

# Спробуйте інший регіон
azd env set AZURE_LOCATION westus2
azd up

# Тимчасово зменште потужність
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Проблема 2: Помилки автентифікації

**Симптоми:**
- Помилки 401/403 при виклику AI-сервісів
- Повідомлення "Доступ заборонено"

**Рішення:**
```bash
# Перевірте призначення ролей
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Перевірте конфігурацію керованої ідентичності
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Перевірте доступ до Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Проблема 3: Проблеми з розгортанням моделей

**Симптоми:**
- Моделі недоступні в розгортанні
- Помилки для конкретних версій моделей

**Рішення:**
```bash
# Перелік доступних моделей за регіоном
az cognitiveservices model list --location eastus

# Оновити версію моделі в шаблоні bicep
# Перевірити вимоги до місткості моделі
```

## Приклад шаблонів

### Базовий чат-додаток

**Репозиторій**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Сервіси**: Azure OpenAI + Cognitive Search + App Service

**Швидкий старт**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Конвеєр обробки документів

**Репозиторій**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Сервіси**: Document Intelligence + Storage + Functions

**Швидкий старт**:
```bash
azd init --template ai-document-processing
azd up
```

### Корпоративний чат з RAG

**Репозиторій**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Сервіси**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Швидкий старт**:
```bash
azd init --template contoso-chat
azd up
```

## Наступні кроки

1. **Спробуйте приклади**: Почніть з готового шаблону, який відповідає вашому випадку використання
2. **Налаштуйте під свої потреби**: Змініть інфраструктуру та код додатка
3. **Додайте моніторинг**: Реалізуйте комплексне спостереження
4. **Оптимізуйте витрати**: Налаштуйте конфігурації відповідно до вашого бюджету
5. **Забезпечте безпеку розгортання**: Реалізуйте шаблони безпеки для підприємств
6. **Масштабуйте до продакшну**: Додайте багаторегіональність та функції високої доступності

## 🎯 Практичні вправи

### Вправа 1: Розгорніть чат-додаток Azure OpenAI (30 хвилин)
**Мета**: Розгорнути та протестувати готовий до продакшну AI чат-додаток

```bash
# Ініціалізувати шаблон
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Встановити змінні середовища
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Розгорнути
azd up

# Тестувати додаток
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Моніторинг операцій ШІ
azd monitor

# Очистити
azd down --force --purge
```

**Критерії успіху:**
- [ ] Розгортання завершується без помилок квоти
- [ ] Можна отримати доступ до інтерфейсу чату в браузері
- [ ] Можна ставити запитання та отримувати відповіді від AI
- [ ] Application Insights показує дані телеметрії
- [ ] Ресурси успішно очищені

**Орієнтовна вартість**: $5-10 за 30 хвилин тестування

### Вправа 2: Налаштуйте розгортання кількох моделей (45 хвилин)
**Мета**: Розгорнути кілька AI-моделей з різними конфігураціями

```bash
# Створити власну конфігурацію Bicep
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

# Розгорнути та перевірити
azd provision
azd show
```

**Критерії успіху:**
- [ ] Кілька моделей успішно розгорнуті
- [ ] Застосовані різні налаштування потужності
- [ ] Моделі доступні через API
- [ ] Можна викликати обидві моделі з додатка

### Вправа 3: Реалізуйте моніторинг витрат (20 хвилин)
**Мета**: Налаштувати сповіщення про бюджет та відстеження витрат

```bash
# Додати сповіщення про бюджет до Bicep
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

# Розгорнути сповіщення про бюджет
azd provision

# Перевірити поточні витрати
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Критерії успіху:**
- [ ] Створено сповіщення про бюджет в Azure
- [ ] Налаштовані сповіщення електронною поштою
- [ ] Можна переглядати дані про витрати в Azure Portal
- [ ] Пороги бюджету налаштовані відповідно

## 💡 Часті запитання

<details>
<summary><strong>Як зменшити витрати Azure OpenAI під час розробки?</strong></summary>

1. **Використовуйте безкоштовний рівень**: Azure OpenAI пропонує 50,000 токенів/місяць безкоштовно
2. **Зменшіть потужність**: Встановіть потужність на 10 TPM замість 30+ для розробки
3. **Використовуйте azd down**: Відключайте ресурси, коли активно не розробляєте
4. **Кешуйте відповіді**: Реалізуйте Redis-кеш для повторюваних запитів
5. **Використовуйте Prompt Engineering**: Зменшуйте використання токенів за допомогою ефективних запитів

```bash
# Конфігурація розробки
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>У чому різниця між Azure OpenAI та OpenAI API?</strong></summary>

**Azure OpenAI**:
- Безпека та відповідність для підприємств
- Інтеграція з приватною мережею
- Гарантії SLA
- Автентифікація через керовану ідентичність
- Доступні вищі квоти

**OpenAI API**:
- Швидший доступ до нових моделей
- Просте налаштування
- Нижчий поріг входу
- Тільки публічний інтернет

Для продакшн-додатків **рекомендується Azure OpenAI**.
</details>

<details>
<summary><strong>Як вирішити помилки перевищення квоти Azure OpenAI?</strong></summary>

```bash
# Перевірте поточну квоту
az cognitiveservices usage list --location eastus2

# Спробуйте інший регіон
azd env set AZURE_LOCATION westus2
azd up

# Тимчасово зменште потужність
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Запитайте збільшення квоти
# Перейдіть до Azure Portal > Квоти > Запит на збільшення
```
</details>

<details>
<summary><strong>Чи можу я використовувати власні дані з Azure OpenAI?</strong></summary>

Так! Використовуйте **Azure AI Search** для RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Дивіться шаблон [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Як забезпечити безпеку кінцевих точок AI-моделей?</strong></summary>

**Найкращі практики**:
1. Використовуйте керовану ідентичність (без API-ключів)
2. Увімкніть приватні кінцеві точки
3. Налаштуйте групи безпеки мережі
4. Реалізуйте обмеження швидкості
5. Використовуйте Azure Key Vault для секретів

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

## Спільнота та підтримка

- **Microsoft Foundry Discord**: [#Azure канал](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Проблеми та обговорення](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Офіційна документація](https://learn.microsoft.com/azure/ai-studio/)

---

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка з акцентом на AI
- **⬅️ Попередній розділ**: [Розділ 1: Ваш перший проєкт](../getting-started/first-project.md)
- **➡️ Далі**: [Розгортання AI-моделі](ai-model-deployment.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../getting-started/configuration.md)

**Потрібна допомога?** Приєднуйтесь до обговорень у спільноті або відкрийте проблему в репозиторії. Спільнота Azure AI + AZD готова допомогти вам досягти успіху!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ на його рідній мові слід вважати авторитетним джерелом. Для критичної інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникають внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->