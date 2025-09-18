<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-09-18T11:18:03+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "bg"
}
-->
# Интеграция на Azure AI Foundry с AZD

**Навигация по главите:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 2 - Разработка с приоритет на AI
- **⬅️ Предишна глава**: [Глава 1: Вашият първи проект](../getting-started/first-project.md)
- **➡️ Следваща**: [Деплоймент на AI модели](ai-model-deployment.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../getting-started/configuration.md)

## Преглед

Това ръководство показва как да интегрирате услугите на Azure AI Foundry с Azure Developer CLI (AZD) за улеснено разгръщане на AI приложения. Azure AI Foundry предоставя цялостна платформа за създаване, разгръщане и управление на AI приложения, докато AZD опростява процеса на инфраструктура и разгръщане.

## Какво е Azure AI Foundry?

Azure AI Foundry е унифицираната платформа на Microsoft за AI разработка, която включва:

- **Каталог на модели**: Достъп до най-съвременни AI модели
- **Prompt Flow**: Визуален дизайнер за AI работни потоци
- **Портал AI Foundry**: Интегрирана среда за разработка на AI приложения
- **Опции за разгръщане**: Множество хостинг и мащабиращи опции
- **Безопасност и сигурност**: Вградени функции за отговорен AI

## AZD + Azure AI Foundry: По-добри заедно

| Функция | Azure AI Foundry | Полза от интеграция с AZD |
|---------|-----------------|------------------------|
| **Разгръщане на модели** | Ръчно разгръщане през портал | Автоматизирани, повторяеми разгръщания |
| **Инфраструктура** | Провизиране чрез кликвания | Инфраструктура като код (Bicep) |
| **Управление на среди** | Фокус върху една среда | Множество среди (dev/staging/prod) |
| **Интеграция с CI/CD** | Ограничена | Нативна поддръжка на GitHub Actions |
| **Управление на разходи** | Основен мониторинг | Оптимизация на разходите за конкретна среда |

## Предпоставки

- Абонамент за Azure с подходящи разрешения
- Инсталиран Azure Developer CLI
- Достъп до услугите на Azure OpenAI
- Основни познания за Azure AI Foundry

## Основни модели за интеграция

### Модел 1: Интеграция с Azure OpenAI

**Приложение**: Разгръщане на чат приложения с модели на Azure OpenAI

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

### Модел 2: AI търсене + RAG интеграция

**Приложение**: Разгръщане на приложения за извличане с допълнено генериране (RAG)

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

### Модел 3: Интеграция за интелигентност на документи

**Приложение**: Работни потоци за обработка и анализ на документи

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

## 🔧 Модели за конфигурация

### Настройка на променливи на средата

**Конфигурация за продукция:**
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

**Конфигурация за разработка:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Сигурна конфигурация с Key Vault

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

## Работни потоци за разгръщане

### Разгръщане с една команда

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### Разгръщания за конкретна среда

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

## Мониторинг и наблюдение

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

### Мониторинг на разходите

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

## 🔐 Най-добри практики за сигурност

### Конфигурация на управлявана идентичност

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

### Мрежова сигурност

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

## Оптимизация на производителността

### Стратегии за кеширане

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

### Конфигурация за автоматично мащабиране

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

## Отстраняване на често срещани проблеми

### Проблем 1: Превишена квота на OpenAI

**Симптоми:**
- Разгръщането се проваля с грешки за квота
- 429 грешки в логовете на приложението

**Решения:**
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

### Проблем 2: Грешки при автентикация

**Симптоми:**
- 401/403 грешки при извикване на AI услуги
- Съобщения "Достъпът е отказан"

**Решения:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Проблем 3: Проблеми с разгръщане на модели

**Симптоми:**
- Моделите не са налични при разгръщане
- Конкретни версии на модели се провалят

**Решения:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Примерни шаблони

### Основно чат приложение

**Репозитори**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Услуги**: Azure OpenAI + Cognitive Search + App Service

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Тръбопровод за обработка на документи

**Репозитори**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Услуги**: Document Intelligence + Storage + Functions

**Бърз старт**:
```bash
azd init --template ai-document-processing
azd up
```

### Корпоративен чат с RAG

**Репозитори**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Услуги**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Бърз старт**:
```bash
azd init --template contoso-chat
azd up
```

## Следващи стъпки

1. **Опитайте примерите**: Започнете с предварително създаден шаблон, който отговаря на вашия случай
2. **Персонализирайте според нуждите си**: Модифицирайте инфраструктурата и кода на приложението
3. **Добавете мониторинг**: Реализирайте цялостно наблюдение
4. **Оптимизирайте разходите**: Настройте конфигурациите според бюджета си
5. **Осигурете разгръщането си**: Прилагайте модели за сигурност на корпоративно ниво
6. **Мащабирайте до продукция**: Добавете функции за много региони и висока наличност

## Общност и поддръжка

- **Discord на Azure AI Foundry**: [#Azure канал](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Проблеми и дискусии](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Официална документация](https://learn.microsoft.com/azure/ai-studio/)

---

**Навигация по главите:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 2 - Разработка с приоритет на AI
- **⬅️ Предишна глава**: [Глава 1: Вашият първи проект](../getting-started/first-project.md)
- **➡️ Следваща**: [Деплоймент на AI модели](ai-model-deployment.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../getting-started/configuration.md)

**Нуждаете се от помощ?** Присъединете се към дискусиите в общността или отворете проблем в репозиторията. Общността на Azure AI + AZD е тук, за да ви помогне да успеете!

---

**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Не носим отговорност за недоразумения или погрешни интерпретации, произтичащи от използването на този превод.