# Интеграција Microsoft Foundry са AZD

**Навигација кроз поглавља:**
- **📚 Почетак курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - Развој вођен вештачком интелигенцијом
- **⬅️ Претходно поглавље**: [Поглавље 1: Ваш први пројекат](../chapter-01-foundation/first-project.md)
- **➡️ Следеће**: [Распоређивање AI модела](ai-model-deployment.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

## Преглед

Ово упутство показује како да интегришете Microsoft Foundry услуге са Azure Developer CLI (AZD) за поједностављена распоређивања AI апликација. Microsoft Foundry пружа свеобухватну платформу за израду, распоређивање и управљање AI апликацијама, док AZD поједностављује процес инфраструктуре и распоређивања.

## Шта је Microsoft Foundry?

Microsoft Foundry је Мајкрософтов јединствени систем за развој AI који укључује:

- **Model Catalog**: Приступ напредним AI моделима
- **Prompt Flow**: Визуелни дизајнер за AI радне токове
- **Microsoft Foundry Portal**: Интегрисано окружење за развој AI апликација
- **Deployment Options**: Више опција за хостовање и скалирање
- **Safety and Security**: Уграђене функције одговорног AI

## AZD + Microsoft Foundry: Боље заједно

| Функција | Microsoft Foundry | Предност интеграције са AZD |
|---------|-----------------|------------------------|
| **Распоређивање модела** | Ручно распоређивање преко портала | Аутоматизована, понављајућа распоређивања |
| **Инфраструктура** | Провизионисање преко кликова | Инфраструктура као код (Bicep) |
| **Управљање окружењем** | Фокус на једно окружење | Мулти-окружење (dev/staging/prod) |
| **CI/CD интеграција** | Ограничено | Нативна подршка за GitHub Actions |
| **Управљање трошковима** | Основно праћење | Оптимизација трошкова по окружењу |

## Предуслови

- Azure претплата са одговарајућим дозволама
- Инсталиран Azure Developer CLI
- Приступ услугама Microsoft Foundry Models
- Основно познавање Microsoft Foundry

## Основни шаблони интеграције

### Шаблон 1: Интеграција Microsoft Foundry Models

**Случај употребе**: Распоређивање чет апликација помоћу Microsoft Foundry Models модела

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

### Шаблон 2: AI претрага + RAG интеграција

**Случај употребе**: Распоређивање апликација за генерацију допуњену преузимањем (RAG)

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

### Шаблон 3: Интеграција Document Intelligence

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

## 🔧 Шаблони конфигурације

### Подешавање променљивих окружења

**Конфигурација за производњу:**
```bash
# Основне АИ услуге
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Конфигурације модела
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Поставке перформанси
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Конфигурација за развој:**
```bash
# Подешавања оптимизована за смањење трошкова током развоја
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Бесплатно ниво
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

## Радни токови за распоређивање

### AZD екстензије за Foundry

AZD обезбеђује екстензије које додају AI-специфичне могућности за рад са услугама Microsoft Foundry:

```bash
# Инсталирајте проширење Foundry agents
azd extension install azure.ai.agents

# Инсталирајте проширење за фино подешавање
azd extension install azure.ai.finetune

# Инсталирајте проширење за прилагођене моделе
azd extension install azure.ai.models

# Прикажите инсталирана проширења
azd extension list
```

### Распоређивање усмерено на агенте са `azd ai`

Ако имате манифест агента, користите `azd ai agent init` да иницијализујете пројекат повезан са Foundry Agent Service:

```bash
# Иницијализуј из манифеста агента
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Распореди на Azure
azd up
```

Погледајте [AZD AI CLI команде](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) за пун референтни списак команди и опција.

### Распоређивање једном командом

```bash
# Разместите све једном командом
azd up

# Или разместите постепено
azd provision  # Само инфраструктура
azd deploy     # Само апликација
```

### Распоређивања специфична по окружењу

```bash
# Развојно окружење
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Производно окружење
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Мониторинг и опсервабилност

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

### Праћење трошкова

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

### Безбедност мреже

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

### Проблем 1: Прекорачена квота OpenAI

**Симптоми:**
- Распоређивање не успева због грешака у квоти
- 429 грешке у логовима апликације

**Решења:**
```bash
# Проверите тренутну употребу квоте
az cognitiveservices usage list --location eastus

# Пробајте другу регију
azd env set AZURE_LOCATION westus2
azd up

# Привремено смањите капацитет
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Проблем 2: Неуспеси при аутентификацији

**Симптоми:**
- 401/403 грешке при позивању AI услуга
- „Приступ одбијен“ поруке

**Решења:**
```bash
# Проверити доделе улога
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Проверити конфигурацију управљаног идентитета
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Проверити приступ Key Vault-у
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Проблем 3: Проблеми при распоређивању модела

**Симптоми:**
- Модели нису доступни у распоређивању
- Одређене верзије модела не успевају

**Решења:**
```bash
# Листа доступних модела по регијама
az cognitiveservices model list --location eastus

# Ажурирај верзију модела у bicep шаблону
# Провери захтеве за капацитет модела
```

## Примери шаблона

### RAG чет апликација (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: Најпопуларнији Azure AI пример — RAG чет апликација спремна за производњу која вам омогућава да постављате питања преко својих докумената. Користи GPT-4.1-mini за чет, text-embedding-ada-002 за embeddings, и Azure AI Search за преузимање. Пружа подршку за мултимодалне документе, говорни улаз/излаз, Microsoft Entra аутентификацију и праћење преко Application Insights.

**Брзи почетак**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG чет апликација (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: .NET/C# еквивалент Python RAG чет примера. Изграђен са ASP.NET Core Minimal API и Blazor WebAssembly фронтендом. Укључује voice chat, GPT-4o-mini vision подршку, и пратиоца .NET MAUI Blazor Hybrid десктоп/мобилни клијент.

**Брзи почетак**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG чет апликација (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: Јава верзија RAG чет примера која користи Langchain4J за AI оркестрацију. Подржава микросервисну архитектуру вођену догађајима, више стратегија претраге (текст, вектор, хибрид), отпремање докумената са Azure Document Intelligence, и распоређивање на Azure Container Apps или Azure Kubernetes Service.

**Брзи почетак**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: Енд-то-енд retail RAG copilot који користи Azure AI Foundry и Prompty. Contoso Outdoor продавац чет-бот који основа одговоре на подацима каталога производа и подацима о поруџбинама купаца. Демонстрира комплетан GenAIOps радни ток — прототипирање са Prompty, евалуација уз помоћ AI-помогнутих евалуатора, и распоређивање преко AZD у Container Apps.

**Брзи почетак**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: Мулти-агент пример који демонстрира оркестрацију AI агената са Prompty. Користи research агента (Bing Grounding у Azure AI Agent Service), product агента (Azure AI Search), writer агента и editor агента да заједно произведу добро истражене чланке. Укључује CI/CD са евалуацијом у GitHub Actions.

**Брзи почетак**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: Потпуно serverless RAG чет-бот који користи LangChain.js са Azure Functions за API и Azure Static Web Apps за хостовање. Користи Azure Cosmos DB као векторску продавницу и базу за историју четова. Пружа локални развој са Ollama за тестирање без трошкова.

**Брзи почетак**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description**: Enterprise-grade RAG решење са админ порталом за отпремање/управљање документима, више опција оркестратора (Semantic Kernel, LangChain, Prompt Flow), говор у текст, интеграција са Microsoft Teams, и избор PostgreSQL или Cosmos DB бекенда. Дизајнирано као прилагодљив полазни пункт за продукцијске RAG сценарије.

**Брзи почетак**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: Референтна апликација за мулти-агент оркестрацију AI која користи три фрејмворка (LangChain.js, LlamaIndex.TS, и Microsoft Agent Framework). Карактеристике укључују MCP (Model Context Protocol) сервере у четири језика распоређене као serverless Azure Container Apps са OpenTelemetry мониторингом.

**Брзи почетак**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Description**: Минималан Bicep шаблон који распоређује Azure AI услуге са конфигурисаним машински учењим моделима. Лака полазна тачка када вам је потребна само провизија Azure AI инфраструктуре без пуног апликационог стака.

**Брзи почетак**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Погледајте више шаблона**: Посетите [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) за 80+ AZD шаблона специфичних за AI преко језика и сценарија.

## Следећи кораци

1. **Испробајте примере**: Почните са предфабрикованим шаблоном који одговара вашем случају употребе
2. **Прилагодите за своје потребе**: Измените инфраструктуру и апликациони код
3. **Додајте мониторинг**: Имплементирајте свеобухватну опсервабилност
4. **Оптимизујте трошкове**: Подесите конфигурације у складу са буџетом
5. **Заштитите распоређивање**: Имплементирајте ентерпрајз безбедносне шаблоне
6. **Скалирајте за продукцију**: Додајте мултирегионалне и високо-доступне карактеристике

## 🎯 Практичне вежбе

### Вежба 1: Распоредите Microsoft Foundry Models чет апликацију (30 минута)
**Циљ**: Распоредити и тестирати апликацију за чет спремну за продукцију

```bash
# Иницијализуј шаблон
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Подеси променљиве окружења
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Распореди
azd up

# Тестирај апликацију
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Надгледај операције вештачке интелигенције
azd monitor

# Очисти
azd down --force --purge
```

**Критеријуми успеха:**
- [ ] Распоређивање завршено без грешака у квоти
- [ ] Приступ интерфејсу за чет у прегледачу
- [ ] Могућност постављања питања и добијање AI-погорних одговора
- [ ] Application Insights приказује телеметријске податке
- [ ] Ресурси успешно очишћени

**Процењени трошак**: $5-10 за 30 минута тестирања

### Вежба 2: Конфигуришите распоређивање више модела (45 минута)
**Циљ**: Распоредити више AI модела са различитим конфигурацијама

```bash
# Креирај прилагођену Bicep конфигурацију
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

# Размешти и провери
azd provision
azd show
```

**Критеријуми успеха:**
- [ ] Више модела успешно распоређено
- [ ] Примењена различита подешавања капацитета
- [ ] Модели доступни преко API-ја
- [ ] Могућност позивања оба модела из апликације

### Вежба 3: Имплементирајте праћење трошкова (20 минута)
**Циљ**: Подесити упозорења за буџет и праћење трошкова

```bash
# Додај упозорење о буџету у Bicep
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

# Размешти упозорење о буџету
azd provision

# Провери текуће трошкове
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Критеријуми успеха:**
- [ ] Буџетско упозорење креирано у Azure
- [ ] Постављене е-поштa нотификације
- [ ] Приказ података о трошковима у Azure порталу
- [ ] Прагова буџета подешени адекватно

## 💡 Често постављана питања

<details>
<summary><strong>Како смањити трошкове Microsoft Foundry Models током развоја?</strong></summary>

1. **Користите бесплатни ниво**: Microsoft Foundry Models нуди 50.000 токена/месечно бесплатно
2. **Смањите капацитет**: Подесите капацитет на 10 TPM уместо 30+ за развој
3. **Користите azd down**: Деаллокујте ресурсе када не развијате активно
4. **Кеширајте одговоре**: Имплементирајте Redis кеш за поновљене упите
5. **Користите Prompt Engineering**: Смањите употребу токена ефикасним промптовима

```bash
# Конфигурација за развој
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Која је разлика између Microsoft Foundry Models и OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Ентерпрајз безбедност и усаглашеност
- Интеграција приватне мреже
- Гаранције SLA
- Аутентификација управљаним идентитетом
- Веће доступне квоте

**OpenAI API**:
- Бржи приступ новим моделима
- Једноставније подешавање
- Нижа баријера за улаз
- Само јавни интернет

За продукцијске апликације, **препоручује се Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Како да поступим са грешкама када је пређена квота за Microsoft Foundry Models?</strong></summary>

```bash
# Проверите тренутну квоту
az cognitiveservices usage list --location eastus2

# Пробајте другу регију
azd env set AZURE_LOCATION westus2
azd up

# Привремено смањите капацитет
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Затражите повећање квоте
# Идите у Azure портал > Квоте > Затражите повећање
```
</details>

<details>
<summary><strong>Могу ли да користим своје податке са Microsoft Foundry Models?</strong></summary>

Да! Користите **Azure AI Search** за RAG (генерација проширена претрагом):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Погледајте шаблон [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Како да обезбедим крајње тачке AI модела?</strong></summary>

**Најбоље праксе**:
1. Користите Managed Identity (без API кључева)
2. Омогућите приватне крајње тачке
3. Подесите групе мрежне безбедности
4. Уведите ограничење учесталости захтева
5. Користите Azure Key Vault за чување тајни

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

## Заједница и подршка

- **Microsoft Foundry Discord**: [#Azure канал](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Проблеми и дискусије](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Званична документација](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Инсталирајте Azure + Foundry агентске вештине у вашем уређивачу помоћу `npx skills add microsoft/github-copilot-for-azure`

---

**Навигација по поглављима:**
- **📚 Почетна страница курса**: [AZD For Beginners](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - Развој вођен вештачком интелигенцијом
- **⬅️ Претходно поглавље**: [Поглавље 1: Ваш први пројекат](../chapter-01-foundation/first-project.md)
- **➡️ Следеће**: [Распоређивање AI модела](ai-model-deployment.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

**Треба помоћ?** Придружите се нашим дискусијама у заједници или отворите issue у репозиторијуму. Заједница Azure AI + AZD је овде да вам помогне да успете!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање одговорности**:
Овај документ је преведен коришћењем AI сервиса за превођење [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматизовани преводи могу да садрже грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални превод од стране људског преводиоца. Нисмо одговорни за било каква непоразумевања или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->