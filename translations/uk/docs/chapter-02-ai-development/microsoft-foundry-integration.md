# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD для початківців](../../README.md)
- **📖 Current Chapter**: Розділ 2 - Розробка з фокусом на ШІ
- **⬅️ Previous Chapter**: [Розділ 1: Ваш перший проєкт](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

## Огляд

Цей посібник демонструє, як інтегрувати служби Microsoft Foundry з Azure Developer CLI (AZD) для спрощення розгортання ШІ-застосунків. Microsoft Foundry надає комплексну платформу для створення, розгортання та управління ШІ-застосунками, тоді як AZD спрощує процес налаштування інфраструктури та розгортання.

## Що таке Microsoft Foundry?

Microsoft Foundry — це уніфікована платформа Microsoft для розробки ШІ, яка включає:

- **Каталог моделей**: Доступ до найсучасніших моделей ШІ
- **Prompt Flow**: Візуальний дизайнер робочих потоків ШІ
- **AI Foundry Portal**: Інтегроване середовище розробки для ШІ-застосунків
- **Варіанти розгортання**: Різні опції хостингу та масштабування
- **Безпека та захист**: Вбудовані функції відповідального використання ШІ

## AZD + Microsoft Foundry: Краще разом

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Автоматизовані, відтворювані розгортання |
| **Infrastructure** | Click-through provisioning | Інфраструктура як код (Bicep) |
| **Environment Management** | Single environment focus | Багатосередовищність (dev/staging/prod) |
| **CI/CD Integration** | Limited | Вбудована підтримка GitHub Actions |
| **Cost Management** | Basic monitoring | Оптимізація витрат для кожного середовища |

## Вимоги

- Підписка Azure з відповідними дозволами
- Встановлений Azure Developer CLI
- Доступ до Azure OpenAI services
- Базове знайомство з Microsoft Foundry

## Основні шаблони інтеграції

### Шаблон 1: Інтеграція з Azure OpenAI

**Випадок використання**: Розгортання чат-застосунків з моделями Azure OpenAI

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

### Шаблон 2: AI Search + RAG інтеграція

**Випадок використання**: Розгортання застосунків з генерацією, доповненою пошуком (RAG)

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

**Конфігурація для продакшену:**
```bash
# Основні сервіси ШІ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Налаштування моделей
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
# Розгорнути все однією командою
azd up

# Або розгорнути поступово
azd provision  # Тільки інфраструктура
azd deploy     # Тільки додаток
```

### Розгортання для конкретних середовищ

```bash
# Середовище розробки
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Продуктивне середовище
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Моніторинг та спостережливість

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

## 🔐 Кращі практики безпеки

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

### Налаштування автоскейлінгу

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

## Усунення поширених проблем

### Проблема 1: Перевищено квоту OpenAI

**Симптоми:**
- Розгортання завершується з помилками квоти
- Помилки 429 у логах застосунку

**Рішення:**
```bash
# Перевірте поточне використання квоти
az cognitiveservices usage list --location eastus

# Спробуйте інший регіон
azd env set AZURE_LOCATION westus2
azd up

# Тимчасово зменшити потужність
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Проблема 2: Помилки автентифікації

**Симптоми:**
- Помилки 401/403 при виклику сервісів ШІ
- Повідомлення "Access denied"

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
- Певні версії моделей не працюють

**Рішення:**
```bash
# Перелічити доступні моделі за регіоном
az cognitiveservices model list --location eastus

# Оновити версію моделі у bicep-шаблоні
# Перевірити вимоги до місткості моделі
```

## Прикладні шаблони

### Базовий чат-застосунок

**Репозиторій**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Служби**: Azure OpenAI + Cognitive Search + App Service

**Швидкий старт**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Конвеєр обробки документів

**Репозиторій**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Служби**: Document Intelligence + Storage + Functions

**Швидкий старт**:
```bash
azd init --template ai-document-processing
azd up
```

### Корпоративний чат з RAG

**Репозиторій**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Служби**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Швидкий старт**:
```bash
azd init --template contoso-chat
azd up
```

## Наступні кроки

1. **Спробуйте приклади**: Почніть з готового шаблону, що відповідає вашому випадку використання
2. **Налаштуйте під свої потреби**: Змініть інфраструктуру та код застосунку
3. **Додайте моніторинг**: Реалізуйте повну спостережливість
4. **Оптимізуйте витрати**: Налаштуйте конфігурації під ваш бюджет
5. **Захистіть розгортання**: Впровадьте корпоративні патерни безпеки
6. **Масштабуйте до продакшену**: Додайте мультирегіональність та високу доступність

## 🎯 Практичні вправи

### Вправа 1: Розгорнути чат-застосунок Azure OpenAI (30 хвилин)
**Мета**: Розгорнути та протестувати готовий до продакшену чат-застосунок на ШІ

```bash
# Ініціалізувати шаблон
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Встановити змінні середовища
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Розгорнути
azd up

# Протестувати додаток
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Моніторити операції ШІ
azd monitor

# Очистити
azd down --force --purge
```

**Критерії успіху:**
- [ ] Розгортання завершилося без помилок квоти
- [ ] Можна отримати доступ до інтерфейсу чату в браузері
- [ ] Можна ставити запитання та отримувати відповіді, згенеровані ШІ
- [ ] Application Insights показує телеметрію
- [ ] Успішно очищено ресурси

**Оціночна вартість**: $5-10 за 30 хвилин тестування

### Вправа 2: Налаштувати мульти-модельне розгортання (45 хвилин)
**Мета**: Розгорнути кілька моделей ШІ з різними конфігураціями

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
- [ ] Застосовано різні налаштування потужності
- [ ] Моделі доступні через API
- [ ] Можна викликати обидві моделі з застосунку

### Вправа 3: Впровадити моніторинг витрат (20 хвилин)
**Мета**: Налаштувати сповіщення щодо бюджету та відстеження витрат

```bash
# Додати сповіщення про бюджет у Bicep
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
- [ ] Створено сповіщення по бюджету в Azure
- [ ] Налаштовано повідомлення електронною поштою
- [ ] Можна переглядати дані по витратах в Azure Portal
- [ ] Пороги бюджету встановлено відповідним чином

## 💡 Поширені запитання

<details>
<summary><strong>Як зменшити витрати Azure OpenAI під час розробки?</strong></summary>

1. **Використовуйте безкоштовний рівень**: Azure OpenAI пропонує 50,000 токенів/місяць безкоштовно
2. **Зменшіть потужність**: Встановіть capacity на 10 TPM замість 30+ для розробки
3. **Використовуйте azd down**: Звільняйте ресурси, коли не працюєте активно над розробкою
4. **Кешуйте відповіді**: Реалізуйте Redis кеш для повторюваних запитів
5. **Використовуйте інженерію підказок (Prompt Engineering)**: Зменшуйте використання токенів через ефективні підказки

```bash
# Конфігурація для розробки
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>У чому різниця між Azure OpenAI та OpenAI API?</strong></summary>

**Azure OpenAI**:
- Корпоративна безпека та відповідність
- Інтеграція з приватними мережами
- Гарантії SLA
- Аутентифікація через керовану ідентичність
- Доступні вищі квоти

**OpenAI API**:
- Швидший доступ до нових моделей
- Простіша настройка
- Нижчий бар'єр входу
- Тільки публічний інтернет

Для продакшен-застосунків рекомендовано використовувати **Azure OpenAI**.
</details>

<details>
<summary><strong>Як впоратися з помилками перевищення квоти Azure OpenAI?</strong></summary>

```bash
# Перевірте поточну квоту
az cognitiveservices usage list --location eastus2

# Спробуйте інший регіон
azd env set AZURE_LOCATION westus2
azd up

# Тимчасово зменшіть потужність
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Подайте запит на збільшення квоти
# Перейдіть у Azure Portal > Квоти > Подати запит на збільшення
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
<summary><strong>Як захистити кінцеві точки моделей ШІ?</strong></summary>

**Кращі практики**:
1. Використовуйте Managed Identity (без API-ключів)
2. Увімкніть Private Endpoints
3. Налаштуйте мережеві групи безпеки
4. Реалізуйте обмеження частоти запитів
5. Зберігайте секрети в Azure Key Vault

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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD для початківців](../../README.md)
- **📖 Current Chapter**: Розділ 2 - Розробка з фокусом на ШІ
- **⬅️ Previous Chapter**: [Розділ 1: Ваш перший проєкт](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

**Потрібна допомога?** Приєднуйтесь до обговорень спільноти або відкрийте issue в репозиторії. Спільнота Azure AI + AZD готова допомогти вам досягти успіху!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Відмова від відповідальності:
Цей документ перекладено за допомогою сервісу машинного перекладу Co-op Translator (https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, зверніть увагу, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ його рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується звертатися до професійного людського перекладу. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що можуть виникнути внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->