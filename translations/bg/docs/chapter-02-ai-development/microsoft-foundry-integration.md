# Интеграция на Microsoft Foundry с AZD

**Навигация в глави:**
- **📚 Начална страница на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 2 - AI-първо разработване
- **⬅️ Предишна глава**: [Глава 1: Вашият първи проект](../chapter-01-foundation/first-project.md)
- **➡️ Следваща**: [AI агенти](agents.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

## Преглед

Това ръководство показва как да интегрирате услугите на Microsoft Foundry с Azure Developer CLI (AZD) за опростено внедряване на AI приложения. Microsoft Foundry предоставя цялостна платформа за създаване, внедряване и управление на AI приложения, докато AZD опростява инфраструктурата и процеса на внедряване.

## Какво е Microsoft Foundry?

Microsoft Foundry е обединената платформа на Microsoft за развой на AI, която включва:

- **Каталог на модели**: Достъп до най-съвременни AI модели
- **Prompt Flow**: Визуален дизайнер за AI работни процеси
- **Портал Microsoft Foundry**: Интегрирана развойна среда за AI приложения
- **Опции за внедряване**: Множество опции за хостинг и мащабиране
- **Безопасност и сигурност**: Вградени функции за отговорен AI

## AZD + Microsoft Foundry: По-добре заедно

| Особеност | Microsoft Foundry | Полза от интеграция с AZD |
|---------|-----------------|------------------------|
| **Внедряване на модели** | Ръчно внедряване през портала | Автоматизирани, повторяеми внедрявания |
| **Инфраструктура** | Прецизно конфигуриране с кликове | Инфраструктура като код (Bicep) |
| **Управление на средата** | Фокус върху една среда | Множество среди (dev/staging/prod) |
| **CI/CD интеграция** | Ограничена | Вградена поддръжка на GitHub Actions |
| **Управление на разходите** | Основно наблюдение | Оптимизация на разходите спрямо средата |

## Предварителни изисквания

- Абонамент в Azure с подходящи разрешения
- Инсталиран Azure Developer CLI
- Достъп до услугите на Microsoft Foundry Models
- Основни познания за Microsoft Foundry

> **Преглед на изданието (2026-11-04):** Ръководството за AI CLI беше проверено спрямо документите/източниците на `azd` `1.37.2`, агенти `1.0.0-beta.23` и оценки `1.0.0-beta.2`. Използвайте `azd >= 1.37.0` за комбинирания работен процес. Вижте [промени и корекции в изданието](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); този преглед не сертифицира всеки шаблон или пример SDK спрямо живо внедряване.

## Основни модели на интеграция

**Обхват на примерите:** По-долу Bicep съдържа илюстративни фрагменти на ресурси, а не пълен шаблон за внедряване. Основният шаблон трябва да дефинира имена, `location`, реферирани ресурси, идентичности, изходи и хостинг на приложението. Използвайте свързан образец за работеща отправна точка. Примерите с Bash изискват удостоверяване в Azure CLI отделно от `azd auth login`.

### Модел 1: Интеграция с Microsoft Foundry Models

**Приложение**: Внедряване на чат приложения с Azure OpenAI модели в Microsoft Foundry

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

За извикващия е необходима прикрепена управлявана идентичност и `Cognitive Services OpenAI User` в обхвата на акаунта; деактивирането на ключове не дава достъп. Проверете наличността на региона/модела/SKU и квотата преди внедряване.

### Модел 2: Интеграция AI Search + RAG

**Приложение**: Внедряване на приложения за генериране с повишено извличане (RAG)

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

Няма `Microsoft.Search/searchServices/dataConnections` ARM ресурс за тази интеграция. Конфигурирайте Search индекс, източник на данни, индексиращ/набор от умения или векторизатор чрез поддържаните Search data-plane API. Ако Search извиква embedding модел, активирайте управляваната му идентичност, предоставете съответната роля за модела и конфигурирайте embedding умение/векторизатор. Вижте [интегрирана векторизация](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Модел 3: Интеграция на Document Intelligence

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

## 🔧 Модели на конфигурация

### Настройка на променливи на средата

С изключение на документираните настройки на AZD като `AZURE_LOCATION`, тези са **имената на входните параметри в потребителски шаблон**. Те нямат ефект, освен ако шаблонът/приложението не ги използва чрез параметърни и хост-средови съпоставяния. За `azure-search-openai-demo` използвайте реалните имена като `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` и `AZURE_SEARCH_SERVICE_SKU`. Капацитетът на модела не е същият като SKU на акаунта.

**Конфигурация за продукция:**
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

**Конфигурация за разработка:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Сигурна конфигурация с Key Vault

Предпочитайте Entra ID с деактивирана локална автентикация на ключове. Следното е само **алтернативен наследствен вариант с автентикация чрез ключ** за приложения, които изискват ключове: изисква акаунт с активирана автентикация чрез ключ, прикрепена идентичност на приложението към хоста му и работещ достъп/мрежа към Key Vault. Не комбинирайте извличане на ключове с `disableLocalAuth: true` и очаквайте повиквания с ключ да работят.

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

## Работни потоци за внедряване

### AZD разширения за Foundry

AZD предоставя разширения, които добавят AI-специфични възможности за работа с Microsoft Foundry услуги:

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

AI разширенията все още се развиват бързо в предварителен преглед. Ако команда се държи по различен начин от показаното тук, обновете съответното разширение преди да отстранявате проблеми в самия проект.

### Внедряване с приоритет на агента с `azd ai`

Използвайте `azd ai agent init` интерактивно или приемете актуален шаблон за агентен проект `azure.yaml`, свързан с Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` заменя остарялото изписване `--manifest`/`-m`; наследствени манифест и вложена конфигурация на агенти още изискват миграция. Оценявайте агенти с `azd ai eval` от `azure.ai.evaluations`, а не с премахнатия наследствен работен процес. Вижте [миграция на оценките](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) за настройка, изпълнение и резултати.

Вижте [AZD AI CLI команди](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) за пълен справочник с команди и флагове.

### Внедряване с една команда

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Внедряване спрямо среда

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

## Мониторинг и наблюдаемост

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
```

Това създава ресурс Insights, а не телеметрична инструментализация. След като вашето приложение излъчва изходящи повиквания към модели, изпълнете този илюстративен заявка в Application Insights Logs (адаптирайте филтъра към реалните имена на спановете):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Наблюдение на разходите

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

Използвайте реален получател и проверете разрешенията за обхвата на фактуриране. Бюджетът изпраща сигнали; не е лимит за разходи.

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

Този фрагмент от крайна точка изисква и частна DNS зона/група, VNet връзки, връзка на приложението с VNet и изрична политика за публичен достъп. Самото създаване на частна крайна точка не деактивира публичния достъп.

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

Azure Cache за Redis Basic/Standard/Premium е на [път към пенсиониране](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); ползвайте Azure Managed Redis за нови внедрения и следвайте актуалните му насоки за шаблони и удостоверяване. Кеширайте AI отговорите спрямо автентикация, модел/инструкции и версия на данните, с валидност; никога не споделяйте частни отговори само с въпросен текст.

### Конфигурация на автоматично мащабиране

**Частичен ресурс:** обединете тези настройки за мащабиране/входящ трафик в пълен Container App със управлявана среда, контейнерен образ и ресурсни лимити. Повече реплики не увеличават квотата на модела.

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
- Внедряването се проваля с грешки за квота
- 429 грешки в логовете на приложението

**Решения:**
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

Променливата капацитет по-горе важи само за потребителски шаблон, настроен да го използва. За RAG пример, използвайте `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Не променяйте `AZURE_LOCATION`, за да местите съществуващи ресурси; създайте отделна среда за нов регион и планирайте миграция/почистване.

### Проблем 2: Неуспешна автентикация

**Симптоми:**
- 401/403 грешки при повиквания към AI услуги
- Съобщения "Достъпът е отказан"

**Решения:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Проблем 3: Проблеми с внедряване на модел

**Симптоми:**
- Модели, недостъпни във внедряването
- Конкретни версии на модели, които се провалят

**Решения:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Примерни шаблони

Това са алтернативи, а не последователни команди. Стартирайте всеки в отделна празна директория. Изричното `.` запазва инициализацията във вашата текуща директория; иначе актуалният AZD може да създаде подпапка с име на шаблона без да сменя работната директория на шел.

### RAG чат приложение (Python)

**Хранилище**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Услуги**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Описание**: Референтно RAG чат приложение за въпроси относно вашите документи с извличане чрез Azure AI Search. Прегледайте поддържаните модели в текущия пример, опционални функции, насоки за разходи и производствено закаляване преди използване; внедряването на пример не прави приложението готово за продукция.

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG чат приложение (.NET)

**Хранилище**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Услуги**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Описание**: .NET/C# еквивалент на Python RAG чат примера. Изграден с ASP.NET Core Minimal API и фронтенд Blazor WebAssembly. Включва гласов чат, поддръжка на GPT-4o-mini за визуални данни и придружителен .NET MAUI Blazor Hybrid клиент за настолен/мобилен платформ.

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG чат приложение (Java)

**Хранилище**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Услуги**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Описание**: Java версия на RAG чат примера използвайки Langchain4J за AI оркестрация. Поддържа микросеривисно архитектурно събитийно управление, множество стратегии за търсене (текст, вектор, хибрид), качване на документи с Azure Document Intelligence и внедряване в Azure Container Apps или Azure Kubernetes Service.

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot с Microsoft Foundry

**Хранилище**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Услуги**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Описание**: Край до край RAG помощник за търговия на дребно, използващ Microsoft Foundry и Prompty. Чатбот на Contoso Outdoor retailer, който базира отговорите си на продуктов каталог и данни за клиентски поръчки. Демонстрира пълния GenAIOps работен процес — прототипинг с Prompty, оценка с AI асистирани оценители и внедряване чрез AZD в Container Apps.

**Бърз старт**:
```bash
azd init --template contoso-chat .
azd up
```

### Многоагентно приложение за творческо писане

**Хранилище**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Услуги**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Описание**: Многоагентен пример, демонстриращ AI агентска оркестрация с Prompty. Използва изследователски агент (Bing Grounding в Azure AI Agent Service), продуктов агент (Azure AI Search), писателски агент и редакторски агент за съвместно създаване на добре проучени статии. Включва CI/CD с оценка в GitHub Actions.

**Бърз старт**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG чат (JavaScript/TypeScript)

**Хранилище**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Услуги**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB за NoSQL + LangChain.js

**Описание**: Изцяло serverless RAG чатбот, използващ LangChain.js с Azure Functions за API и Azure Static Web Apps за хостинг. Използва Azure Cosmos DB като векторно хранилище и база данни за история на чата. Поддържа локална разработка с Ollama за тестване без разходи.

**Бърз старт**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat with Your Data Solution Accelerator

**Хранилище**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Услуги**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search с Cosmos DB, или PostgreSQL с pgvector

**Описание**: Ускорител за чат, основан на документи с цитати. Текущият пример хоства React фронтенд, FastAPI бекенд и ingestion работник с Functions на Container Apps; опции за оркестрация са Agent Framework и LangGraph. Опциите за база данни/извличане се избират при внедряването. Това е отправна точка, а не готова продукционна система; не приемайте, че по-старите варианти на App Service, Semantic Kernel или Prompt Flow описват настоящия стандарт.

**Бърз старт**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI пътнически агенти — Многоагентска MCP оркестрация

**Хранилище**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Услуги**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP сървъри (.NET, Python, Java, TypeScript)

**Описание**: Референтно приложение за мулти-агентна AI оркестрация с използване на три рамки (LangChain.js, LlamaIndex.TS и Microsoft Agent Framework). Включва MCP (Model Context Protocol) сървъри на четири езика, разположени като безсървърни Azure Container Apps с мониторинг чрез OpenTelemetry.

**Бърз старт**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Разгледайте още шаблони**: Посетете [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) за наличните шаблони на различни езици и сценарии. Всеки свързан пример е външно хранилище, не локален пример, предоставен от този курс; прегледайте текущите му предварителни изисквания и насоки за продукционна употреба преди внедряване.

## Следващи стъпки

1. **Изпробвайте примерите**: Започнете с предварително създаден шаблон, който съответства на вашия случай на употреба
2. **Персонализирайте според нуждите си**: Модифицирайте инфраструктурата и кода на приложението
3. **Добавете мониторинг**: Внедрете цялостна наблюдаемост
4. **Оптимизирайте разходите**: Настройте конфигурациите според бюджета си
5. **Осигурете вашето внедряване**: Прилагайте корпоративни модели за сигурност
6. **Разширете за продукция**: Добавете мулти-регионални и функции за висока наличност

## 🎯 Практически упражнения

### Упражнение 1: Внедряване на Chat приложение с Microsoft Foundry Models (30 минути)
**Цел**: Внедряване и тестване на AI чат референтно приложение

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

**Критерии за успех:**
- [ ] Внедряването завършва без грешки за квоти
- [ ] Има достъп до чат интерфейса в браузъра
- [ ] Може да задава въпроси и да получава AI-управлявани отговори
- [ ] Application Insights показва телеметрични данни
- [ ] Ресурсите са успешно почистени

**Разходи:** Прегледайте актуалното ръководство за разходи и избраните SKU преди внедряване. Таксуването продължава докато ресурсите не бъдат изтрити; няма фиксирана 30-минутна оценка, която да важи за всяка конфигурация.

### Упражнение 2: Конфигуриране на Мулти-Моделно Внедряване (45 минути)
**Цел**: Внедряване на множество AI модели с различни конфигурации

**Начална точка:** Съществуващ акаунт в Azure OpenAI и AZD модул за ресурсна група, който може да извика този файл. Създайте `infra/ai-models.bicep` със следното съдържание чрез вашия редактор. Той не се внедрява автоматично само защото е под директорията `infra/`.

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

От модула с обхват за ресурсна група, който притежава акаунта, добавете извикване на модул (адаптирайте името на символа към вашия действителен акаунт):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Не декларирайте същите внедрявания и в двата модула. Ако входната точка на AZD е с обхват абонамент, извикайте това от нейния дочерен модул с обхват ресурсна група и регулирайте относителния път. Създайте този включващ модул с `az bicep build --file <path-to-containing-module>`, след което:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Критерии за успех:**
- [ ] Множество модели внедрени успешно
- [ ] Прилагани са различни настройки на капацитета
- [ ] Моделите са достъпни чрез API
- [ ] Приложението може да позвъни и на двата модела

### Упражнение 3: Внедряване на Мониторинг на Разходите (20 минути)
**Цел**: Настройване на бюджетни предупреждения и проследяване на разходите

**Начална точка:** Шаблонът за бюджет по-горе и инфраструктурен модул с обхват ресурсна група. Добавете този ресурс чрез вашия редактор; подайте `budgetStartDate` от вашата параметърна карта (не дублирайте параметъра ако вече е деклариран). Заменете получателя и потвърдете, че имате права за писане в бюджета.

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

Очаквано: отговорът съдържа `amount: 200`, и двата прага и вашия получател. Прегледайте управлението на разходите в портала за актуални такси; данните за разходи са със забавяне и предупреждението не е необходимо да се задейства по време на кратко упражнение.

**Критерии за успех:**
- [ ] Създадено е бюджетно предупреждение в Azure
- [ ] Конфигурирани са email известия
- [ ] Може да се преглеждат данни за разходи в Azure Portal
- [ ] Бюджетните прагове са зададени правилно

## 💡 Често задавани въпроси

<details>
<summary><strong>Как да намаля разходите за Microsoft Foundry Models по време на разработка?</strong></summary>

1. **Проверете ценообразуването**: Няма универсален безплатен месечен лимит от 50 000 токена за Azure OpenAI модели
2. **Подходящ капацитет**: Капацитетът `10` обикновено представлява 10 000 TPM за тези Standard текстови модели, а не 10 TPM. Намаляването на този лимит на скоростта не снижава цената на токен
3. **Използвайте azd down**: Изтрийте временните ресурси, когато не разработвате активно (това не е деактивиране)
4. **Кеширайте отговорите**: Внедрете Redis кеш за повтарящи се заявки
5. **Използвайте Prompt Engineering**: Намалете използването на токени с ефективни подсказки

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Каква е разликата между Microsoft Foundry Models и OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Корпоративна сигурност и съответствие
- Интеграция с частна мрежа
- Гаранции за SLA
- Достоверност с управлявана идентичност
- По-високи налични квоти

**OpenAI API**: Отделен доставчик/API с различна наличност на модели, ценообразуване, удостоверяване и корпоративни възможности за свързване. Сравнявайте текущите оферти, вместо да предполагате, че е само за публичния интернет или винаги разпространява модели първо.

Избирайте на базата на изискванията на вашата организация; Azure-специфични примери за управлявана идентичност и private-link, разгледани в курса, се отнасят за Azure хоствани услуги, не за всеки модел/доставчик от каталога Foundry.
</details>

<details>
<summary><strong>Как да се справя с грешки за превишена квота при Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Мога ли да използвам собствени данни с Microsoft Foundry Models?</strong></summary>

Да! Използвайте **Azure AI Search** за RAG (Retrieval Augmented Generation):

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

Вижте шаблона [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Как да защитя края на AI моделите?</strong></summary>

**Най-добри практики**:
1. Използвайте управлявана идентичност (без API ключове)
2. Активирайте Private Endpoints
3. Конфигурирайте групи за мрежова сигурност
4. Внедрете ограничение на скоростта
5. Използвайте Azure Key Vault за тайни

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

## Общност и Поддръжка

- **Microsoft Foundry Discord**: [#Azure канал](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Проблеми и дискусии](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Официална документация](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill на skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Инсталирайте Azure + Foundry агентски умения в редактора си с `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация в Глава:**
- **📚 Начало на Курс**: [AZD за Начинаещи](../../README.md)
- **📖 Текуща Глава**: Глава 2 - AI-Първо Разработване
- **⬅️ Предишна Глава**: [Глава 1: Вашият Първи Проект](../chapter-01-foundation/first-project.md)
- **➡️ Следваща**: [AI Агенти](agents.md)
- **🚀 Следваща Глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

**Нуждаете се от помощ?** Присъединете се към нашите общностни дискусии или отворете проблем в хранилището. Общността за Azure AI + AZD е тук, за да ви помогне да успеете!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->