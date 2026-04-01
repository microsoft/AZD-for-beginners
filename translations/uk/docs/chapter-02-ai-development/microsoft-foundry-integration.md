# Інтеграція Microsoft Foundry з AZD

**Навігація по розділах:**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 – Розробка з акцентом на штучний інтелект
- **⬅️ Попередній розділ**: [Розділ 1: Ваш перший проєкт](../chapter-01-foundation/first-project.md)
- **➡️ Наступний**: [Розгортання AI-моделі](ai-model-deployment.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

## Огляд

Цей посібник демонструє, як інтегрувати сервіси Microsoft Foundry з Azure Developer CLI (AZD) для спрощеного розгортання AI-застосунків. Microsoft Foundry надає комплексну платформу для створення, розгортання та управління AI-застосунками, а AZD оптимізує процес інфраструктури та розгортання.

## Що таке Microsoft Foundry?

Microsoft Foundry — це уніфікована платформа Microsoft для розробки AI, що включає:

- **Каталог моделей**: Доступ до передових AI-моделей
- **Prompt Flow**: Візуальний дизайнер AI-робочих процесів
- **Портал Microsoft Foundry**: Інтегроване середовище розробки AI-застосунків
- **Опції розгортання**: Різноманітні варіанти хостингу та масштабування
- **Безпека**: Вбудовані функції відповідального AI

## AZD + Microsoft Foundry: Кращі разом

| Функція | Microsoft Foundry | Переваги інтеграції з AZD |
|---------|-----------------|--------------------------|
| **Розгортання моделей** | Ручне через портал | Автоматизоване, повторюване розгортання |
| **Інфраструктура** | Провізування через кліки | Інфраструктура як код (Bicep) |
| **Управління середовищами** | Фокус на одному середовищі | Багатосередовищність (dev/staging/prod) |
| **Інтеграція CI/CD** | Обмежена | Рідна підтримка GitHub Actions |
| **Управління витратами** | Базовий моніторинг | Оптимізація витрат для кожного середовища |

## Передумови

- Підписка Azure з відповідними дозволами
- Встановлений Azure Developer CLI
- Доступ до сервісів Microsoft Foundry Models
- Початкові знання Microsoft Foundry

> **Поточний базовий рівень AZD:** Ці приклади перевіряли на версії `azd` `1.23.12`. Для робочого процесу AI-агента використовуйте актуальне прев’ю розширення та перевірте вашу встановлену версію перед початком.

## Основні патерни інтеграції

### Патерн 1: Інтеграція Microsoft Foundry Models

**Використання**: Розгортання чат-застосунків з моделями Microsoft Foundry Models

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

### Патерн 2: Інтеграція AI Search + RAG

**Використання**: Розгортання застосунків із генерацією, доповненою пошуком (RAG)

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

### Патерн 3: Інтеграція Document Intelligence

**Використання**: Робочі процеси обробки та аналізу документів

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

**Конфігурація для продакшену:**
```bash
# Основні сервіси ШІ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Конфігурації моделей
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

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

### Розширення AZD для Foundry

AZD надає розширення, що додають AI-специфічні можливості для роботи з сервісами Microsoft Foundry:

```bash
# Встановити розширення агентів Foundry
azd extension install azure.ai.agents

# Встановити розширення тонкого налаштування
azd extension install azure.ai.finetune

# Встановити розширення користувацьких моделей
azd extension install azure.ai.models

# Показати список встановлених розширень
azd extension list --installed

# Перевірити поточну встановлену версію розширення агента
azd extension show azure.ai.agents
```

AI-розширення все ще активно розвиваються у прев’ю. Якщо команда поводиться інакше, ніж показано тут, оновіть відповідне розширення перед налагодженням самого проєкту.

### Розгортання, орієнтоване на агента, з `azd ai`

Якщо маєте манифест агента, використайте `azd ai agent init` для створення проєкту, підключеного до Foundry Agent Service:

```bash
# Ініціалізувати з маніфесту агента
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Розгорнути в Azure
azd up
```

Останні прев’ю-релізи `azure.ai.agents` також додали підтримку ініціалізації за шаблоном для `azd ai agent init`. Якщо ви користуєтеся новішими прикладами агентів, перевірте допомогу розширення щодо доступних прапорців у вашій версії.

Див. [AZD AI CLI Команди](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) для повного переліку команд і прапорців.

### Розгортання однією командою

```bash
# Розгорніть все однією командою
azd up

# Або розгортайте поетапно
azd provision  # Лише інфраструктура
azd deploy     # Лише застосунок

# Для довготривалих розгортань додатків ШІ у azd 1.23.11+
azd deploy --timeout 1800
```

### Розгортання, орієнтоване на середовище

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

## Моніторинг і спостережливість

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

## Вирішення поширених проблем

### Проблема 1: Перевищення квоти OpenAI

**Симптоми:**
- Розгортання не вдається з помилками квоти
- 429 помилки в логах застосунку

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
- 401/403 помилки при виклику AI-сервісів
- Повідомлення "Доступ заборонено"

**Рішення:**
```bash
# Перевірити призначення ролей
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Перевірити конфігурацію керованої ідентичності
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Перевірити доступ до Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Проблема 3: Проблеми з розгортанням моделей

**Симптоми:**
- Моделі відсутні при розгортанні
- Відмови конкретних версій моделей

**Рішення:**
```bash
# Перелік доступних моделей за регіонами
az cognitiveservices model list --location eastus

# Оновити версію моделі в bicep-шаблоні
# Перевірити вимоги до потужності моделі
```

## Прикладні шаблони

### RAG чат-застосунок (Python)

**Репозиторій**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Сервіси**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Опис**: Найпопулярніший зразок Azure AI — готовий до виробництва RAG чат-застосунок, що дозволяє ставити запитання по вашим документам. Використовує GPT-4.1-mini для чату, text-embedding-3-large для векторів і Azure AI Search для пошуку. Підтримує мультимодальні документи, введення/виведення голосом, автентифікацію Microsoft Entra та трасування Application Insights.

**Швидкий старт:**
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG чат-застосунок (.NET)

**Репозиторій**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Сервіси**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Опис**: .NET/C# аналог Python-версії RAG чату. Побудовано на ASP.NET Core Minimal API і Blazor WebAssembly фронтенді. Включає голосовий чат, підтримку GPT-4o-mini vision та компаньйона у вигляді .NET MAUI Blazor гібридного десктоп/мобільного клієнта.

**Швидкий старт:**
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG чат-застосунок (Java)

**Репозиторій**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Сервіси**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Опис**: Java-версія RAG чату з використанням Langchain4J для оркестрації AI. Підтримує мікросервісну подійно-орієнтовану архітектуру, кілька стратегій пошуку (текст, вектор, гібрид), завантаження документів з Azure Document Intelligence, розгортання на Azure Container Apps чи Azure Kubernetes Service.

**Швидкий старт:**
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Копілот для роздрібного підприємства з Azure AI Foundry

**Репозиторій**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Сервіси**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Опис**: Повноцінний роздрібний RAG копілот з Azure AI Foundry і Prompty. Чатбот рітейлера Contoso Outdoor, що ґрунтує відповіді на каталозі товарів і даних замовлень клієнтів. Демонструє повний робочий процес GenAIOps — прототип на Prompty, оцінка AI-помічниками, розгортання через AZD на Container Apps.

**Швидкий старт:**
```bash
azd init --template contoso-chat
azd up
```

### Багатоагентський застосунок для творчого письма

**Репозиторій**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Сервіси**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Опис**: Зразок багатьох агентів, що демонструє оркестрацію AI-агентів за допомогою Prompty. Використовує агента дослідника (Bing Grounding в Azure AI Agent Service), агента продукту (Azure AI Search), агента-письменника та агента-редактора для спільного створення ґрунтовних статей. Включає CI/CD із оцінкою в GitHub Actions.

**Швидкий старт:**
```bash
azd init --template contoso-creative-writer
azd up
```

### Безсерверний RAG чат (JavaScript/TypeScript)

**Репозиторій**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Сервіси**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB для NoSQL + LangChain.js

**Опис**: Повністю безсерверний RAG чатбот із LangChain.js, Azure Functions для API та Azure Static Web Apps для хостингу. Використовує Azure Cosmos DB як векторне сховище та базу даних історії чату. Підтримує локальну розробку з Ollama для тестування без витрат.

**Швидкий старт:**
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Прискорювач рішення Chat with Your Data

**Репозиторій**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Сервіси**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Опис**: Прискорювач корпоративного рівня RAG із порталом адміністратора для завантаження/управління документами, кількома варіантами оркестрації (Semantic Kernel, LangChain, Prompt Flow), мовлення у текст, інтеграція з Microsoft Teams і вибір між PostgreSQL або Cosmos DB на бекенді. Призначений як настроювана база для виробничих сценаріїв RAG.

**Швидкий старт:**
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Оркестрація Multi-Agent MCP

**Репозиторій**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Сервіси**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Опис**: Шаблон застосунку для мультиагентної AI-оркестрації з використанням трьох фреймворків (LangChain.js, LlamaIndex.TS та Microsoft Agent Framework). Включає MCP (Model Context Protocol) сервери на чотирьох мовах, розгорнуті як безсерверні Azure Container Apps з моніторингом OpenTelemetry.

**Швидкий старт:**
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Початковий шаблон Azure AI

**Репозиторій**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Сервіси**: Azure AI Services + Azure OpenAI

**Опис**: Мінімальний Bicep-шаблон, що розгортає сервіси Azure AI з налаштованими моделями машинного навчання. Легковаговий старт, коли потрібна лише інфраструктура Azure AI без повного стеку застосунку.

**Швидкий старт:**
```bash
azd init --template azd-ai-starter
azd up
```

> **Переглянути більше шаблонів**: Відвідайте [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) для понад 80 AI-специфічних шаблонів AZD різними мовами та сценаріями.

## Наступні кроки

1. **Спробуйте приклади**: Почніть із готового шаблону, що відповідає вашому випадку
2. **Налаштуйте під свої потреби**: Змініть інфраструктуру та код застосунку
3. **Додайте моніторинг**: Реалізуйте повну спостережливість
4. **Оптимізуйте витрати**: Підберіть конфігурації відповідно до бюджету
5. **Забезпечте безпеку розгортання**: Впровадьте корпоративні патерни безпеки
6. **Масштабуйте на продакшен**: Додайте мульти-регіональні та високодоступні функції

## 🎯 Практичні вправи

### Вправа 1: Розгортання чат-застосунку з Microsoft Foundry Models (30 хвилин)
**Мета**: Розгорнути й протестувати готовий до виробництва AI чат-застосунок

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
- [ ] Розгортання завершено без помилок квоти
- [ ] Доступ до інтерфейсу чату у браузері
- [ ] Можна ставити питання і отримувати відповіді з AI
- [ ] Application Insights показує телеметрію
- [ ] Успішне очищення ресурсів

**Орієнтовна вартість**: $5-10 за 30 хв тестування

### Вправа 2: Налаштування розгортання з кількома моделями (45 хвилин)
**Мета**: Розгорнути кілька AI-моделей із різними конфігураціями

```bash
# Створити користувацьку конфігурацію Bicep
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

# Розгорнути та перевірити
azd provision
azd show
```

**Критерії успіху:**
- [ ] Кілька моделей успішно розгорнені
- [ ] Застосовано різні налаштування потужності
- [ ] Моделі доступні через API
- [ ] Можна викликати обидві моделі з застосунку

### Вправа 3: Впровадження моніторингу витрат (20 хвилин)
**Мета**: Налаштувати сповіщення про бюджет та відслідковування витрат

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
- [ ] Створено сповіщення про бюджет у Azure
- [ ] Налаштовано email-сповіщення
- [ ] Можна переглянути дані про витрати в Azure Portal
- [ ] Встановлені відповідні межі бюджету

## 💡 Часті питання

<details>
<summary><strong>Як зменшити витрати на Microsoft Foundry Models під час розробки?</strong></summary>

1. **Використовуйте безкоштовний рівень**: Microsoft Foundry Models надає 50,000 токенів на місяць безкоштовно
2. **Зменште потужність**: Встановіть потужність на 10 TPM замість 30+ для розробки
3. **Використовуйте azd down**: Звільняйте ресурси, коли не розробляєте активно
4. **Кешуйте відповіді**: Впровадьте Redis кеш для повторних запитів
5. **Використовуйте prompt engineering**: Зменшуйте використання токенів за допомогою ефективних запитів

</details>
```bash
# Конфігурація розробки
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>У чому різниця між Microsoft Foundry Models і OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Безпека підприємства і відповідність стандартам
- Інтеграція з приватною мережею
- Гарантії SLA
- Аутентифікація за допомогою керованої ідентичності
- Доступні вищі квоти

**OpenAI API**:
- Швидший доступ до нових моделей
- Простіше налаштування
- Нижчий поріг входу
- Тільки публічний інтернет

Для продуктивних додатків **рекомендується Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Як обробляти помилки перевищення квоти Microsoft Foundry Models?</strong></summary>

```bash
# Перевірте поточну квоту
az cognitiveservices usage list --location eastus2

# Спробуйте інший регіон
azd env set AZURE_LOCATION westus2
azd up

# Тимчасово зменшити місткість
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Запросити збільшення квоти
# Перейдіть до Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>Чи можу я використовувати власні дані з Microsoft Foundry Models?</strong></summary>

Звісно! Використовуйте **Azure AI Search** для RAG (Retrieval Augmented Generation):

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
<summary><strong>Як захистити кінцеві точки моделей штучного інтелекту?</strong></summary>

**Кращі практики**:
1. Використовуйте керовану ідентичність (без API ключів)
2. Увімкніть приватні кінцеві точки
3. Налаштуйте групи безпеки мережі
4. Реалізуйте обмеження швидкості запитів
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
- **Agent Skills**: [Навичка Microsoft Foundry на skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Встановіть навички агента Azure + Foundry у вашому редакторі за допомогою `npx skills add microsoft/github-copilot-for-azure`

---

**Навігація по розділах:**
- **📚 Домашня сторінка курсу**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка зі ставкою на ШІ
- **⬅️ Попередній розділ**: [Розділ 1: Ваш перший проєкт](../chapter-01-foundation/first-project.md)
- **➡️ Наступний**: [Розгортання ШІ-моделі](ai-model-deployment.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

**Потрібна допомога?** Приєднуйтеся до обговорень спільноти або відкрийте питання у репозиторії. Спільнота Azure AI + AZD тут, щоб допомогти вам досягти успіху!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Застереження**:  
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоч ми і прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки чи неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критичної інформації рекомендується звертатися до професійного людського перекладу. Ми не несемо відповідальності за будь-які непорозуміння чи неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->