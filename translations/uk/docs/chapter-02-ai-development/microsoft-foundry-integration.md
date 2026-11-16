# Інтеграція Microsoft Foundry з AZD

**Навігація по розділах:**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка з пріоритетом на ШІ
- **⬅️ Попередній розділ**: [Розділ 1: Ваш перший проект](../chapter-01-foundation/first-project.md)
- **➡️ Наступний**: [Агенти ШІ](agents.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

## Огляд

У цьому посібнику показано, як інтегрувати сервіси Microsoft Foundry з Azure Developer CLI (AZD) для оптимізованого розгортання ШІ-додатків. Microsoft Foundry надає комплексну платформу для створення, розгортання та керування ШІ-додатками, тоді як AZD спрощує інфраструктуру та процес розгортання.

## Що таке Microsoft Foundry?

Microsoft Foundry — це уніфікована платформа Microsoft для розробки ШІ, яка включає:

- **Каталог моделей**: Доступ до передових моделей ШІ
- **Prompt Flow**: Візуальний конструктор для робочих процесів ШІ
- **Портал Microsoft Foundry**: Інтегроване середовище розробки для ШІ-додатків
- **Опції розгортання**: Різні варіанти розміщення та масштабування
- **Безпека та захист**: Вбудовані функції відповідального ШІ

## AZD + Microsoft Foundry: Краще разом

| Функція | Microsoft Foundry | Переваги інтеграції з AZD |
|---------|-----------------|------------------------|
| **Розгортання моделей** | Ручне розгортання через портал | Автоматизоване, повторюване розгортання |
| **Інфраструктура** | Пошагове надання | Інфраструктура як код (Bicep) |
| **Керування середовищем** | Фокус на одному середовищі | Підтримка кількох середовищ (розробка/тестування/виробництво) |
| **Інтеграція CI/CD** | Обмежена | Вбудована підтримка GitHub Actions |
| **Управління витратами** | Базовий моніторинг | Оптимізація витрат за конкретними середовищами |

## Вимоги

- Підписка Azure з необхідними дозволами
- Встановлений Azure Developer CLI
- Доступ до сервісів Microsoft Foundry Models
- Базове знайомство з Microsoft Foundry

> **Огляд релізу (2026-11-04):** Керівництво по AI CLI було перевірено на основі документації/джерел `azd` `1.37.2`, агентів `1.0.0-beta.23` і оцінок `1.0.0-beta.2`. Використовуйте `azd >= 1.37.0` для об’єднаного робочого процесу. Дивіться [зміни і виправлення релізу](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); цей огляд не гарантує, що всі шаблони або приклади SDK протестовані проти живого розгортання.

## Основні патерни інтеграції

**Обсяг прикладів:** Нижче наведено фрагменти ресурсів Bicep для ілюстрації, а не повний шаблон для розгортання. Шаблон, що містить ці фрагменти, повинен визначати імена, `location`, посилання на ресурси, ідентичності, виходи та розміщення додатків. Використовуйте пов’язаний зразок як точку запуску. Приклади Bash вимагають окремої автентифікації Azure CLI, окремо від `azd auth login`.

### Патерн 1: Інтеграція Microsoft Foundry Models

**Випадок використання**: Розгортання чат-додатків з моделями Azure OpenAI у Microsoft Foundry

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

Виконавець потребує приєднаної керованої ідентичності і `Cognitive Services OpenAI User` на рівні облікового запису; відключення ключів не надає доступу. Перед розгортанням перевірте доступність регіону/моделі/SKU та квоти.

### Патерн 2: Інтеграція AI Search + RAG

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

```

Для цієї інтеграції немає ресурсу `Microsoft.Search/searchServices/dataConnections` ARM. Налаштуйте індекс Search, джерело даних, індексер/набір навичок або векторизатор через підтримувані API Search data-plane. Якщо Search викликає модель embedding, увімкніть її керовану ідентичність, надайте відповідну роль моделі та налаштуйте її навички embedding/векторизатор. Дивіться [інтегрована векторизація](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Патерн 3: Інтеграція Document Intelligence

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

Окрім задокументованих налаштувань AZD, таких як `AZURE_LOCATION`, це **імена входів користувацького шаблону**. Вони не впливають, якщо шаблон/додаток їх не використовує через параметри й мапінг середовища хоста. Для `azure-search-openai-demo` використовуйте його фактичні імена, такі як `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` і `AZURE_SEARCH_SERVICE_SKU`. Потужність моделі не є SKU облікового запису.

**Конфігурація для виробництва:**
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

**Конфігурація для розробки:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Безпечна конфігурація з Key Vault

Віддавайте перевагу Entra ID з вимкненою локальною автентифікацією ключів. Наступне є тільки **спадщиною альтернативою автентифікації ключем** для додатків, яким потрібні ключі: потрібен обліковий запис з увімкненою автентифікацією ключа, ідентичність додатку приєднана до хоста, та працюючий доступ/мережа Key Vault. Не комбінуйте отримання ключа з `disableLocalAuth: true` та очікуйте, що виклики з ключем працюватимуть.

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

## Робочі процеси розгортання

### Розширення AZD для Foundry

AZD надає розширення, які додають специфічні для ШІ можливості для роботи з сервісами Microsoft Foundry:

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

Розширення ШІ все ще швидко розвиваються у режимі попереднього перегляду. Якщо команда поводиться інакше, ніж тут показано, оновіть відповідне розширення перед тим, як налагоджувати сам проєкт.

### Розгортання з фокусом на агента за допомогою `azd ai`

Використовуйте `azd ai agent init` інтерактивно або прийміть сучасний шаблон проєкту агента `azure.yaml`, підключений до Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` замінює застарілий напис `--manifest`/`-m`; застарілий маніфест і вкладена конфігурація агента все ще потребують міграції. Оцінюйте агентів за допомогою `azd ai eval` з `azure.ai.evaluations`, а не застарілим робочим процесом. Дивіться [міграція оцінок](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) для налаштування, запуску та результатів.

Дивіться [Команди AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) для повного довідника команд і прапорців.

### Розгортання однією командою

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Розгортання для конкретних середовищ

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

## Моніторинг і спостереження

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
```

Це створює ресурс Insights, а не інструментацію телеметрії. Як тільки ваш додаток почне відсилати спани викликів моделей, виконайте цей ілюстративний запит у журналах Application Insights (адаптуйте фільтр до реальних імен спанів):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Моніторинг витрат

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

Використовуйте дійсного отримувача і перевірте дозволи на межі білінгу. Бюджет надсилає сповіщення; це не ліміт витрат.

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

### Мережна безпека

Цей фрагмент кінцевої точки також потребує приватної DNS-зони/групи, зв’язків VNet, підключення додатку до VNet та явно визначеної політики публічного доступу. Створення приватної кінцевої точки саме по собі не вимикає публічний доступ.

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

Azure Cache для Redis Basic/Standard/Premium перебуває на [шляху списання](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); використовуйте Azure Managed Redis для нових розгортань та дотримуйтесь сучасних налаштувань шаблону/автентифікації. Сортуйте кешовані відповіді ШІ за авторизацією, моделлю/інструкціями та версією даних з часом життя; ніколи не діліться приватними відповідями лише за текстом запиту.

### Налаштування автоматичного масштабування

**Частковий ресурс:** об’єднайте ці налаштування масштабування/доступу в повний додаток Container App з керованим середовищем, образом контейнера та обмеженнями ресурсів. Більша кількість реплік не збільшує квоту моделей.

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
- Помилки 429 у журналах додатка

**Рішення:**
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

Змінна потужності вище застосовується лише до користувацького шаблону, який її споживає. Для зразка RAG використовуйте `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Не змінюйте `AZURE_LOCATION` для переміщення існуючих ресурсів; створіть окреме середовище для нового регіону та плануйте міграцію/очищення.

### Проблема 2: Помилки автентифікації

**Симптоми:**
- Помилки 401/403 при викликах сервісів ШІ
- Повідомлення "Доступ заборонено"

**Рішення:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Проблема 3: Проблеми з розгортанням моделей

**Симптоми:**
- Моделі недоступні при розгортанні
- Помилки у конкретних версіях моделей

**Рішення:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Приклад шаблонів

Це альтернативи, а не послідовні команди. Починайте кожен у окремій пустій директорії. Явно вказана ціль `.` зберігає ініціалізацію у вашій поточній директорії; інакше AZD створить дочірню директорію з ім’ям шаблону без зміни робочої директорії оболонки.

### RAG чат-додаток (Python)

**Репозиторій**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Сервіси**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Опис**: Зразковий чат-додаток RAG для питань над вашими документами з використанням Azure AI Search. Перед використанням ознайомтеся з поточними підтримуваними моделями, додатковими функціями, рекомендаціями по вартості та заходами з підвищення надійності для виробництва; розгортання зразка не означає готовність додатку до виробництва.

**Швидкий старт**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG чат-додаток (.NET)

**Репозиторій**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Сервіси**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Опис**: .NET/C# версія зразка RAG чату на Python. Побудований на ASP.NET Core Minimal API і фронтенді Blazor WebAssembly. Включає голосовий чат, підтримку GPT-4o-mini vision та клієнт .NET MAUI Blazor Hybrid для настільних і мобільних пристроїв.

**Швидкий старт**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG чат-додаток (Java)

**Репозиторій**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Сервіси**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Опис**: Java-версія зразка RAG чату з використанням Langchain4J для оркестрації ШІ. Підтримує мікросервісну подійну архітектуру, кілька стратегій пошуку (текст, вектор, гібрид), завантаження документів через Azure Document Intelligence та розгортання або на Azure Container Apps, або на Azure Kubernetes Service.

**Швидкий старт**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Корпоративний рітейл-копілот з Microsoft Foundry

**Репозиторій**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Сервіси**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Опис**: Повний рітейл-копілот RAG з використанням Microsoft Foundry та Prompty. Чат-бот Contoso Outdoor, який формує відповіді на основі каталогу продукції та даних замовлень клієнтів. Демонструє повний робочий процес GenAIOps — прототипування з Prompty, оцінювання за допомогою AI-асистованих оцінювачів, та розгортання через AZD на Container Apps.

**Швидкий старт**:
```bash
azd init --template contoso-chat .
azd up
```

### Мультиагентський додаток для творчого письма

**Репозиторій**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Сервіси**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Опис**: Мультиагентський зразок, який демонструє оркестрацію агентів ШІ з Prompty. Використовує дослідницького агента (Bing Grounding в Azure AI Agent Service), продуктових агентів (Azure AI Search), агента-письменника та агента-редактора для спільного створення ґрунтовних статей. Містить CI/CD з оцінюванням у GitHub Actions.

**Швидкий старт**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Безсерверний чат RAG (JavaScript/TypeScript)

**Репозиторій**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Сервіси**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB для NoSQL + LangChain.js

**Опис**: Повністю безсерверний чат-бот RAG з LangChain.js з Azure Functions для API та Azure Static Web Apps для хостингу. Використовує Azure Cosmos DB як сховище векторів і базу даних історії чатів. Підтримує локальну розробку з Ollama для безкоштовного тестування.

**Швидкий старт**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Прискорювач чат-додатку "Chat with Your Data"

**Репозиторій**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Сервіси**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search з Cosmos DB або PostgreSQL з pgvector

**Опис**: Прискорювач чат-додатку, що працює на основі документів з посиланнями. Поточний зразок розміщує фронтенд React, бекенд FastAPI та ingestion worker на Functions через Container Apps; варіанти оркестратора — Agent Framework і LangGraph. Параметри бази даних/пошуку обираються при розгортанні. Це відправна точка, а не готова виробнича система; не припускайте, що старі варіанти App Service, Semantic Kernel або Prompt Flow відповідають теперішнім умовам за замовчуванням.

**Швидкий старт**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Агентство AI для подорожей — мультиагентське оркестрування MCP

**Репозиторій**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Сервіси**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Опис**: Референсна програма для мультиагентної AI-оркестрації з використанням трьох фреймворків (LangChain.js, LlamaIndex.TS та Microsoft Agent Framework). Містить MCP (Model Context Protocol) сервери на чотирьох мовах, розгорнуті як безсерверні Azure Container Apps з моніторингом OpenTelemetry.

**Швидкий старт**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Перегляньте більше шаблонів**: Відвідайте [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) для доступних шаблонів різними мовами та сценаріями. Кожен приклад — це зовнішній репозиторій, а не локальний приклад цього курсу; перед розгортанням перевірте його поточні вимоги та рекомендації для продакшн.

## Наступні кроки

1. **Спробуйте приклади**: Почніть з готового шаблону, що відповідає вашому випадку
2. **Налаштуйте під свої потреби**: Змініть інфраструктуру та код додатку
3. **Додайте моніторинг**: Впровадьте комплексну спостережливість
4. **Оптимізуйте витрати**: Відрегулюйте конфігурації відповідно до бюджету
5. **Захистіть розгортання**: Впровадьте корпоративні схеми безпеки
6. **Масштабуйте для продакшну**: Додайте мульти-регіональні та високодоступні функції

## 🎯 Практичні вправи

### Вправа 1: Розгортання чат-додатку Microsoft Foundry Models (30 хвилин)
**Мета**: Розгорнути та протестувати AI чат-референс додаток

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

**Критерії успіху:**
- [ ] Розгортання пройшло без помилок квот
- [ ] Можна отримати доступ до інтерфейсу чату в браузері
- [ ] Можна ставити запитання та отримувати відповіді з AI
- [ ] Application Insights відображає дані телеметрії
- [ ] Ресурси успішно очищено після використання

**Вартість:** Перед розгортанням ознайомтесь із поточним керівництвом по вартісному використанню та обраними SKU. Оплата триває, поки ресурси не видалено; фіксованої 30-хвилинної оцінки немає для всіх конфігурацій.

### Вправа 2: Налаштування мульти-модельного розгортання (45 хвилин)
**Мета**: Розгорнути кілька моделей AI з різними конфігураціями

**Початковий пункт:** Існуючий акаунт Azure OpenAI та модуль AZD групи ресурсів, що може викликати цей файл. Створіть `infra/ai-models.bicep` з таким вмістом у вашому редакторі. Розгортання не відбувається автоматично лише через знаходження під `infra/`.

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

З модуля, що має область групи ресурсів і володіє аккаунтом, додайте виклик модуля (адаптуйте ім'я символу під свій фактичний акаунт):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Не оголошуйте однакові розгортання в обох модулях. Якщо точка входу AZD має область підписки, викличте це з дочірнього модуля в області групи ресурсів та налаштуйте відносний шлях. Побудуйте той модуль зі `az bicep build --file <path-to-containing-module>`, потім:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Критерії успіху:**
- [ ] Успішно розгорнуто кілька моделей
- [ ] Застосовано різні налаштування потужності
- [ ] Моделі доступні через API
- [ ] Можна звертатися до обох моделей із додатку

### Вправа 3: Впровадження моніторингу витрат (20 хвилин)
**Мета**: Налаштувати оповіщення бюджету та відстеження витрат

**Початковий пункт:** Вищенаведений шаблон бюджету та інфраструктурний модуль у області групи ресурсів. Додайте цей ресурс у редакторі; передайте `budgetStartDate` з вашого відображення параметрів (не дублюйте параметр, якщо він уже є). Замініть отримувача і переконайтеся, що маєте права на запис бюджету.

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

Очікується: відповідь містить `amount: 200`, обидва пороги та вашого отримувача. Перевірте фактичні витрати у Cost Management у порталі; дані про витрати затримуються, і оповіщення може не спрацювати під час короткої вправи.

**Критерії успіху:**
- [ ] Створено оповіщення бюджету в Azure
- [ ] Налаштовано email-сповіщення
- [ ] Можна переглядати дані про витрати в Azure Portal
- [ ] Пороги бюджету встановлено належним чином

## 💡 Часті запитання

<details>
<summary><strong>Як зменшити витрати на Microsoft Foundry Models під час розробки?</strong></summary>

1. **Перевірте ціни**: Не існує універсального безкоштовного ліміту 50,000 токенів на місяць для моделей Azure OpenAI
2. **Правильно встановіть потужність**: Потужність `10` зазвичай відповідає 10,000 TPM для цих моделей Standard text, а не 10 TPM. Зменшення обмеження швидкості не знижує ціну за токен
3. **Використовуйте azd down**: Видаляйте тимчасові ресурси, коли не розробляєте активно (це не деактивація)
4. **Кешуйте відповіді**: Впровадьте кеш Redis для повторних запитів
5. **Використовуйте prompt engineering**: Зменшуйте використання токенів щоб ефективно формувати запити

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>У чому різниця між Microsoft Foundry Models і OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Корпоративна безпека та відповідність нормам
- Інтеграція із приватною мережею
- Гарантії SLA
- Аутентифікація через керовані ідентичності
- Доступні вищі квоти

**OpenAI API**: Окремий провайдер/API з власною доступністю моделей, ціною, аутентифікацією та опціями корпоративного підключення. Порівнюйте актуальні пропозиції, не припускаючи, що це лише публічний інтернет або моделі завжди доступні там першими.

Обирайте відповідно до потреб вашої організації; приклади з керованими ідентичностями Azure та приватними лінками у цьому курсі застосовуються до сервісів, розміщених в Azure, а не до кожної моделі/провайдера в каталозі Foundry.
</details>

<details>
<summary><strong>Як вирішувати помилки "перевищено квоту Microsoft Foundry Models"?</strong></summary>

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
<summary><strong>Чи можу я використовувати власні дані з Microsoft Foundry Models?</strong></summary>

Так! Використовуйте **Azure AI Search** для RAG (генерація, підкріплена пошуком):

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

Дивіться шаблон [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Як захистити кінцеві точки AI моделей?</strong></summary>

**Найкращі практики**:
1. Використовуйте керовану ідентичність (без API ключів)
2. Увімкніть приватні кінцеві точки
3. Налаштуйте мережеві групи безпеки
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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Питання та обговорення](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Офіційна документація](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Навички Microsoft Foundry на skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Встановлюйте навички агента Azure + Foundry в редакторі через `npx skills add microsoft/github-copilot-for-azure`

---

**Навігація по розділу:**
- **📚 Головна сторінка курсу**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка, орієнтована на AI
- **⬅️ Попередній розділ**: [Розділ 1: Ваш перший проект](../chapter-01-foundation/first-project.md)
- **➡️ Наступний**: [AI агенти](agents.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

**Потрібна допомога?** Приєднуйтесь до обговорень у спільноті або відкрийте питання в репозиторії. Спільнота Azure AI + AZD допоможе вам досягти успіху!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->