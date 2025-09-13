<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a284fb7fdbdf2f5d737de7d08f0ade9",
  "translation_date": "2025-09-12T23:14:51+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "uk"
}
-->
# Інтеграція Azure AI Foundry з AZD

**Попереднє:** [Перший проєкт](../getting-started/first-project.md) | **Наступне:** [Розгортання AI-моделі](ai-model-deployment.md)

## Огляд

Цей посібник демонструє, як інтегрувати сервіси Azure AI Foundry з Azure Developer CLI (AZD) для спрощеного розгортання AI-додатків. Azure AI Foundry надає комплексну платформу для створення, розгортання та управління AI-додатками, тоді як AZD спрощує процес інфраструктури та розгортання.

## Що таке Azure AI Foundry?

Azure AI Foundry — це єдина платформа Microsoft для розробки AI, яка включає:

- **Каталог моделей**: Доступ до передових AI-моделей
- **Prompt Flow**: Візуальний дизайнер для AI-робочих процесів
- **Портал AI Foundry**: Інтегроване середовище розробки для AI-додатків
- **Опції розгортання**: Різноманітні варіанти хостингу та масштабування
- **Безпека та захист**: Вбудовані функції відповідального AI

## AZD + Azure AI Foundry: краще разом

| Функція | Azure AI Foundry | Перевага інтеграції з AZD |
|---------|-----------------|------------------------|
| **Розгортання моделей** | Ручне розгортання через портал | Автоматизовані, повторювані розгортання |
| **Інфраструктура** | Налаштування через інтерфейс | Інфраструктура як код (Bicep) |
| **Управління середовищем** | Фокус на одному середовищі | Багатосередовищна підтримка (dev/staging/prod) |
| **Інтеграція CI/CD** | Обмежена | Вбудована підтримка GitHub Actions |
| **Управління витратами** | Базовий моніторинг | Оптимізація витрат для кожного середовища |

## Попередні вимоги

- Підписка Azure з відповідними дозволами
- Встановлений Azure Developer CLI
- Доступ до сервісів Azure OpenAI
- Базове розуміння Azure AI Foundry

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
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

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
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### Розгортання для конкретного середовища

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

## Моніторинг та спостереження

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

### Налаштування авто-масштабування

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
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity temporarily
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Проблема 2: Помилки автентифікації

**Симптоми:**
- Помилки 401/403 при виклику AI-сервісів
- Повідомлення "Доступ заборонено"

**Рішення:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Проблема 3: Проблеми з розгортанням моделей

**Симптоми:**
- Моделі недоступні для розгортання
- Помилки для конкретних версій моделей

**Рішення:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
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
5. **Забезпечте безпеку розгортання**: Реалізуйте шаблони корпоративної безпеки
6. **Масштабуйте до продакшну**: Додайте багаторегіональність та функції високої доступності

## Спільнота та підтримка

- **Discord Azure AI Foundry**: [#Azure канал](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Проблеми та обговорення](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Офіційна документація](https://learn.microsoft.com/azure/ai-studio/)

---

**Попереднє:** [Перший проєкт](../getting-started/first-project.md) | **Наступне:** [Розгортання AI-моделі](ai-model-deployment.md)

**Потрібна допомога?** Приєднуйтесь до обговорень у спільноті або відкрийте проблему в репозиторії. Спільнота Azure AI + AZD готова допомогти вам досягти успіху!

---

**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ на його рідній мові слід вважати авторитетним джерелом. Для критичної інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникають внаслідок використання цього перекладу.