<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-09-18T11:39:32+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "sr"
}
-->
# Интеграција Azure AI Foundry са AZD

**Навигација кроз поглавља:**
- **📚 Почетна страна курса**: [AZD за почетнике](../../README.md)
- **📖 Текуће поглавље**: Поглавље 2 - Развој заснован на вештачкој интелигенцији
- **⬅️ Претходно поглавље**: [Поглавље 1: Ваш први пројекат](../getting-started/first-project.md)
- **➡️ Следеће**: [Деплој AI модела](ai-model-deployment.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../getting-started/configuration.md)

## Преглед

Овај водич показује како да интегришете Azure AI Foundry услуге са Azure Developer CLI (AZD) ради поједностављеног деплоја апликација заснованих на вештачкој интелигенцији. Azure AI Foundry пружа свеобухватну платформу за изградњу, деплој и управљање AI апликацијама, док AZD олакшава процес инфраструктуре и деплоја.

## Шта је Azure AI Foundry?

Azure AI Foundry је јединствена платформа компаније Microsoft за развој вештачке интелигенције која укључује:

- **Каталог модела**: Приступ најсавременијим AI моделима
- **Prompt Flow**: Визуелни дизајнер за AI токове рада
- **AI Foundry портал**: Интегрисано развојно окружење за AI апликације
- **Опције деплоја**: Више опција за хостовање и скалирање
- **Безбедност и сигурност**: Уграђене функције одговорне вештачке интелигенције

## AZD + Azure AI Foundry: Бољи заједно

| Карактеристика | Azure AI Foundry | Предност интеграције са AZD |
|----------------|------------------|-----------------------------|
| **Деплој модела** | Ручни деплој преко портала | Аутоматизовани, поновљиви деплоји |
| **Инфраструктура** | Провизионисање кликом | Инфраструктура као код (Bicep) |
| **Управљање окружењем** | Фокус на једно окружење | Више окружења (развој/тест/продукција) |
| **CI/CD интеграција** | Ограничена | Нативна подршка за GitHub Actions |
| **Управљање трошковима** | Основни мониторинг | Оптимизација трошкова специфична за окружење |

## Предуслови

- Azure претплата са одговарајућим дозволама
- Инсталиран Azure Developer CLI
- Приступ Azure OpenAI услугама
- Основно познавање Azure AI Foundry

## Основни обрасци интеграције

### Образац 1: Интеграција Azure OpenAI

**Случај употребе**: Деплој апликација за ћаскање са Azure OpenAI моделима

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

### Образац 2: AI претрага + RAG интеграција

**Случај употребе**: Деплој апликација за претрагу уз помоћ генерације засноване на претраживању (RAG)

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

### Образац 3: Интеграција интелигенције докумената

**Случај употребе**: Радни токови за обраду и анализу докумената

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

## 🔧 Обрасци конфигурације

### Подешавање променљивих окружења

**Конфигурација за продукцију:**
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

**Конфигурација за развој:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Сигурна конфигурација са Key Vault

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

## Радни токови деплоја

### Деплој једном командом

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### Деплој специфичан за окружење

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

## Мониторинг и посматрање

### Интеграција са Application Insights

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

### Мониторинг трошкова

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

## 🔐 Најбоље праксе за безбедност

### Конфигурација управљаног идентитета

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

### Мрежна безбедност

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

## Оптимизација перформанси

### Стратегије кеширања

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

### Конфигурација аутоматског скалирања

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

## Решавање уобичајених проблема

### Проблем 1: Прекорачен OpenAI квота

**Симптоми:**
- Деплој не успева због грешака квоте
- 429 грешке у логовима апликације

**Решења:**
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

### Проблем 2: Грешке аутентификације

**Симптоми:**
- 401/403 грешке приликом позивања AI услуга
- Поруке "Приступ одбијен"

**Решења:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Проблем 3: Проблеми са деплојем модела

**Симптоми:**
- Модели нису доступни у деплоју
- Одређене верзије модела не успевају

**Решења:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Пример шаблона

### Основна апликација за ћаскање

**Репозиторијум**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Услуге**: Azure OpenAI + Cognitive Search + App Service

**Брзи почетак**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Радни ток за обраду докумената

**Репозиторијум**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Услуге**: Document Intelligence + Storage + Functions

**Брзи почетак**:
```bash
azd init --template ai-document-processing
azd up
```

### Ентерпрајз ћаскање са RAG

**Репозиторијум**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Услуге**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Брзи почетак**:
```bash
azd init --template contoso-chat
azd up
```

## Следећи кораци

1. **Испробајте примере**: Почните са унапред припремљеним шаблоном који одговара вашем случају употребе
2. **Прилагодите својим потребама**: Измените инфраструктуру и код апликације
3. **Додајте мониторинг**: Имплементирајте свеобухватно посматрање
4. **Оптимизујте трошкове**: Фино подесите конфигурације у складу са вашим буџетом
5. **Осигурајте свој деплој**: Имплементирајте безбедносне обрасце за предузећа
6. **Скалирајте до продукције**: Додајте функције за више региона и високу доступност

## Заједница и подршка

- **Azure AI Foundry Discord**: [#Azure канал](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Проблеми и дискусије](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Званична документација](https://learn.microsoft.com/azure/ai-studio/)

---

**Навигација кроз поглавља:**
- **📚 Почетна страна курса**: [AZD за почетнике](../../README.md)
- **📖 Текуће поглавље**: Поглавље 2 - Развој заснован на вештачкој интелигенцији
- **⬅️ Претходно поглавље**: [Поглавље 1: Ваш први пројекат](../getting-started/first-project.md)
- **➡️ Следеће**: [Деплој AI модела](ai-model-deployment.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../getting-started/configuration.md)

**Потребна помоћ?** Придружите се дискусијама у заједници или отворите проблем у репозиторијуму. Заједница Azure AI + AZD је ту да вам помогне да успете!

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.