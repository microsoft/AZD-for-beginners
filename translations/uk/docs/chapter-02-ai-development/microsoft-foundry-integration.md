# Інтеграція Microsoft Foundry з AZD

**Навігація по розділах:**
- **📚 Головна курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка з орієнтацією на ШІ
- **⬅️ Попередній розділ**: [Розділ 1: Ваш перший проєкт](../chapter-01-foundation/first-project.md)
- **➡️ Наступний**: [Розгортання AI-моделей](ai-model-deployment.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

## Огляд

Цей посібник демонструє, як інтегрувати служби Microsoft Foundry з Azure Developer CLI (AZD) для оптимізованого розгортання AI-додатків. Microsoft Foundry забезпечує комплексну платформу для створення, розгортання та керування AI-додатками, тоді як AZD спрощує процес інфраструктури та розгортання.

## Що таке Microsoft Foundry?

Microsoft Foundry — це уніфікована платформа Microsoft для розробки AI, що включає:

- **Каталог моделей**: Доступ до передових AI моделей
- **Prompt Flow**: Візуальний конструктор AI-робочих процесів
- **Портал Microsoft Foundry**: Інтегроване середовище розробки AI-додатків
- **Опції розгортання**: Різні варіанти хостингу та масштабування
- **Безпека та захист**: Вбудовані функції відповідального AI

## AZD + Microsoft Foundry: Краще разом

| Функція | Microsoft Foundry | Перевага інтеграції з AZD |
|---------|-----------------|------------------------|
| **Розгортання моделей** | Ручне розгортання через портал | Автоматизовані, повторювані розгортання |
| **Інфраструктура** | Налагодження через кліки | Інфраструктура як код (Bicep) |
| **Управління середовищем** | Фокус на одному середовищі | Багатосередовищність (розробка/стейджинг/прод) |
| **Інтеграція CI/CD** | Обмежена | Вбудована підтримка GitHub Actions |
| **Управління витратами** | Базовий моніторинг | Оптимізація витрат для кожного середовища |

## Вимоги

- Підписка Azure з відповідними дозволами
- Встановлений Azure Developer CLI
- Доступ до Microsoft Foundry Models
- Базове знайомство з Microsoft Foundry

## Основні патерни інтеграції

### Патерн 1: Інтеграція Microsoft Foundry Models

**Випадок використання**: Розгортання чат-додатків з моделями Microsoft Foundry Models

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

### Патерн 2: Інтеграція AI Search + RAG

**Випадок використання**: Розгортання додатків з покращеним пошуком (RAG)

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

### Патерн 3: Інтеграція інтелектуальної обробки документів

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

## 🔧 Патерни конфігурації

### Налаштування змінних середовища

**Конфігурація для продакшн:**
```bash
# Основні служби ШІ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Конфігурації моделей
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Налаштування продуктивності
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Конфігурація для розробки:**
```bash
# Оптимізовані за вартістю налаштування для розробки
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

### Розширення AZD для Foundry

AZD надає розширення, які додають AI-специфічні можливості для роботи з Microsoft Foundry:

```bash
# Встановіть розширення агентів Foundry
azd extension install azure.ai.agents

# Встановіть розширення для тонкого налаштування
azd extension install azure.ai.finetune

# Встановіть розширення для користувацьких моделей
azd extension install azure.ai.models

# Перелік встановлених розширень
azd extension list
```

### Розгортання з пріоритетом агента за допомогою `azd ai`

Якщо у вас є агент-мафест, використовуйте `azd ai agent init` для створення проєкту, підключеного до Foundry Agent Service:

```bash
# Ініціалізація з маніфесту агента
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Розгортання в Azure
azd up
```

Дивіться [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) для повного довідника по командах та опціях.

### Розгортання однією командою

```bash
# Розгорнути все однією командою
azd up

# Або розгортати поступово
azd provision  # Лише інфраструктура
azd deploy     # Лише застосунок
```

### Розгортання для конкретних середовищ

```bash
# Середовище розробки
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Промислове середовище
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Моніторинг та спостереження

### Інтеграція Application Insights

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

## Вирішення типових проблем

### Проблема 1: Перевищено квоту OpenAI

**Симптоми:**
- Розгортання не вдалось через помилки квоти
- Помилки 429 у логах додатку

**Рішення:**
```bash
# Перевірте поточне використання квоти
az cognitiveservices usage list --location eastus

# Спробуйте інший регіон
azd env set AZURE_LOCATION westus2
azd up

# Тимчасово зменшити ємність
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Проблема 2: Помилки аутентифікації

**Симптоми:**
- Помилки 401/403 при викликах AI-сервісів
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
- Моделі недоступні під час розгортання
- Помилки у конкретних версіях моделей

**Рішення:**
```bash
# Перелічити доступні моделі за регіонами
az cognitiveservices model list --location eastus

# Оновити версію моделі у шаблоні bicep
# Перевірити вимоги до потужності моделі
```

## Приклади шаблонів

### RAG чат-додаток (Python)

**Репозиторій**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Служби**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Опис**: Найпопулярніший зразок Azure AI — готовий до продакшн RAG чат-додаток, який дозволяє ставити запитання по власних документах. Використовує GPT-4.1-mini для чату, text-embedding-ada-002 для векторних представлень та Azure AI Search для пошуку. Підтримує мультимодальні документи, голосовий ввід/вивід, аутентифікацію Microsoft Entra і трасування через Application Insights.

**Швидкий старт**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG чат-додаток (.NET)

**Репозиторій**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Служби**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Опис**: Еквівалент зразка RAG чату на Python для .NET/C#. Побудований на ASP.NET Core Minimal API та Blazor WebAssembly фронтенді. Включає голосовий чат, підтримку GPT-4o-mini vision та додаток .NET MAUI Blazor Hybrid для десктопу/мобільних пристроїв.

**Швидкий старт**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG чат-додаток (Java)

**Репозиторій**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Служби**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Опис**: Java-версія RAG чат зразка з використанням Langchain4J для AI-оркестрації. Підтримує поділену на мікросервіси подієво-орієнтовану архітектуру, кілька стратегій пошуку (текст, вектор, гібрид), завантаження документів з Azure Document Intelligence, розгортання на Azure Container Apps або Azure Kubernetes Service.

**Швидкий старт**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Підсилювач для роздрібного бізнесу з Azure AI Foundry

**Репозиторій**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Служби**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Опис**: Комплексний RAG-помічник для роздрібної торгівлі з Azure AI Foundry та Prompty. Чат-бот Contoso Outdoor для інтерактивної роботи з каталогом продуктів та даними клієнтських замовлень. Демонструє повний GenAIOps робочий процес — прототип з Prompty, оцінка за допомогою AI-помічників, розгортання через AZD у Container Apps.

**Швидкий старт**:
```bash
azd init --template contoso-chat
azd up
```

### Креативний мультиагентський додаток для письма

**Репозиторій**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Служби**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Опис**: Зразок мультиагентської оркестрації AI агентів за допомогою Prompty. Включає дослідницького агента (Bing Grounding у Azure AI Agent Service), агента продукту (Azure AI Search), агента-письменника і агента-редактора для спільного створення добре досліджених статей. Включає CI/CD з оцінкою в GitHub Actions.

**Швидкий старт**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Безсерверний RAG чат (JavaScript/TypeScript)

**Репозиторій**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Служби**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Опис**: Повністю безсерверний RAG чат-бот, що використовує LangChain.js з Azure Functions для API та Azure Static Web Apps для хостингу. Використовує Azure Cosmos DB як векторне сховище і базу історії чатів. Підтримує локальну розробку з Ollama для безкоштовного тестування.

**Швидкий старт**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Прискорювач рішення Chat with Your Data

**Репозиторій**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Служби**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Опис**: Підприємницьке рішення RAG з порталом адміністратора для завантаження/керування документами, кількома варіантами оркестраторів (Semantic Kernel, LangChain, Prompt Flow), підтримкою голосового вводу, інтеграцією Microsoft Teams і вибором PostgreSQL або Cosmos DB на бекенді. Спрямоване як настроювана стартова точка для виробничих сценаріїв RAG.

**Швидкий старт**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI туристичні агенти — мультиагентська MCP оркестрація

**Репозиторій**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Служби**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Сервери (.NET, Python, Java, TypeScript)

**Опис**: Референс-додаток мультиагентської AI оркестрації, що використовує три фреймворки (LangChain.js, LlamaIndex.TS, Microsoft Agent Framework). Має MCP (Model Context Protocol) сервери на чотирьох мовах, розгорнуті як безсерверні Azure Container Apps з моніторингом OpenTelemetry.

**Швидкий старт**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Стартер

**Репозиторій**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Служби**: Azure AI Services + Azure OpenAI

**Опис**: Мінімалістичний шаблон Bicep, який розгортає Azure AI служби з налаштованими моделями машинного навчання. Легкий старт, якщо потрібно лише забезпечити інфраструктуру Azure AI без повного стеку додатків.

**Швидкий старт**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Переглянути більше шаблонів**: Відвідайте [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) для 80+ AI-специфічних AZD шаблонів різними мовами й сценаріями.

## Наступні кроки

1. **Спробуйте приклади**: Почніть з готового шаблону, що відповідає вашому випадку
2. **Налаштуйте під свої потреби**: Змініть інфраструктуру та код додатку
3. **Додайте моніторинг**: Реалізуйте комплексне спостереження
4. **Оптимізуйте витрати**: Підлаштуйте конфігурації під бюджет
5. **Захистіть розгортання**: Впровадьте корпоративні патерни безпеки
6. **Масштабуйте до продакшну**: Додайте багаторегіональні та високодоступні функції

## 🎯 Практичні вправи

### Вправа 1: Розгортання чат-додатку Microsoft Foundry Models (30 хвилин)
**Мета**: Розгорнути та протестувати готовий до продакшн AI чат-додаток

```bash
# Ініціалізувати шаблон
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Встановити змінні оточення
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Розгорнути
azd up

# Тестувати застосунок
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Моніторинг операцій ШІ
azd monitor

# Очистити
azd down --force --purge
```

**Критерії успіху:**
- [ ] Розгортання завершилось без помилок квоти
- [ ] Можливість доступу до чат-інтерфейсу у браузері
- [ ] Можливість ставити питання та отримувати AI-відповіді
- [ ] Application Insights показує телеметричні дані
- [ ] Успішне очищення ресурсів після тестування

**Орієнтовна вартість**: $5-10 за 30 хвилин тестування

### Вправа 2: Налаштування розгортання багатьох моделей (45 хвилин)
**Мета**: Розгорнути кілька AI моделей з різними конфігураціями

```bash
# Створити власну конфігурацію Bicep
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

# Розгорнути та перевірити
azd provision
azd show
```

**Критерії успіху:**
- [ ] Багато моделей успішно розгорнено
- [ ] Застосовано різні налаштування потужності
- [ ] Моделі доступні через API
- [ ] Можливість виклику обох моделей з додатку

### Вправа 3: Впровадження моніторингу витрат (20 хвилин)
**Мета**: Налаштувати бюджетні сповіщення та відстеження витрат

```bash
# Додати бюджетне сповіщення до Bicep
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

# Розгорнути бюджетне сповіщення
azd provision

# Перевірити поточні витрати
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Критерії успіху:**
- [ ] Створено сповіщення про бюджет в Azure
- [ ] Налаштовані email повідомлення
- [ ] Можливість перегляду даних витрат у порталі Azure
- [ ] Відповідно встановлені пороги бюджету

## 💡 Часті запитання

<details>
<summary><strong>Як знизити витрати Microsoft Foundry Models під час розробки?</strong></summary>

1. **Використовуйте безкоштовний рівень**: Microsoft Foundry Models надає 50,000 токенів на місяць безкоштовно
2. **Зменшіть потужність**: Встановіть 10 TPM замість 30+ для розробки
3. **Використовуйте azd down**: Звільняйте ресурси, коли не працюєте активно
4. **Кешування відповідей**: Реалізуйте Redis кеш для повторних запитів
5. **Використовуйте інжиніринг запитів (Prompt Engineering)**: Зменшуйте споживання токенів за допомогою оптимізованих запитів

```bash
# Конфігурація розробки
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>В чому різниця між Microsoft Foundry Models та OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Корпоративний рівень безпеки і відповідності
- Інтеграція з приватною мережею
- Гарантії SLA
- Аутентифікація через керовану ідентичність
- Доступні вищі квоти

**OpenAI API**:
- Швидший доступ до нових моделей
- Простіша настройка
- Нижчий поріг входу
- Тільки публічний інтернет

Для виробничих додатків **рекомендується Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Як обробляти помилки перевищення квоти Microsoft Foundry Models?</strong></summary>

```bash
# Перевірте поточну квоту
az cognitiveservices usage list --location eastus2

# Спробуйте інший регіон
azd env set AZURE_LOCATION westus2
azd up

# Тимчасово зменшити потужність
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Запитати збільшення квоти
# Перейдіть до Azure Portal > Квоти > Запит на збільшення
```
</details>

<details>
<summary><strong>Чи можна використовувати власні дані з Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Як забезпечити безпеку кінцевих точок AI моделей?</strong></summary>

**Кращі практики**:
1. Використовуйте Managed Identity (без API ключів)
2. Увімкніть Private Endpoints
3. Налаштуйте мережеві групи безпеки
4. Впровадьте обмеження швидкості
5. Використовуйте Azure Key Vault для зберігання секретів

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
- **AZD GitHub**: [Проблеми та обговорення](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Офіційна документація](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Навички Microsoft Foundry на skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Встановіть навички Azure + Foundry agent у ваш редактор за допомогою `npx skills add microsoft/github-copilot-for-azure`

---

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - AI-First Development
- **⬅️ Попередній розділ**: [Розділ 1: Ваш перший проект](../chapter-01-foundation/first-project.md)
- **➡️ Наступний**: [Розгортання AI моделі](ai-model-deployment.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

**Потрібна допомога?** Приєднуйтесь до обговорень у спільноті або відкрийте проблему в репозиторії. Спільнота Azure AI + AZD допоможе вам досягти успіху!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу штучного інтелекту [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, враховуйте, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ його рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння чи неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->