# Microsoft Foundry интеграција са AZD

**Навигација поглавља:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Текуће поглавље**: Поглавље 2 - Развој усмерен на AI
- **⬅️ Претходно поглавље**: [Поглавље 1: Ваш први пројекат](../chapter-01-foundation/first-project.md)
- **➡️ Следеће**: [Распоређивање AI модела](ai-model-deployment.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

## Преглед

Ово упутство показује како да интегришете Microsoft Foundry сервисе са Azure Developer CLI (AZD) ради поједностављених распоређивања AI апликација. Microsoft Foundry пружа свеобухватну платформу за изградњу, распоређивање и управљање AI апликацијама, док AZD поједностављује инфраструктуру и процес распоређивања.

## Шта је Microsoft Foundry?

Microsoft Foundry је Мицрософтов уједињени портал за развој AI који укључује:

- **Каталог модела**: Приступ најсавременијим AI моделима
- **Prompt Flow**: Визуелни дизајнер за AI токове рада
- **Портал Microsoft Foundry**: Интегрисано развојно окружење за AI апликације
- **Опције распоређивања**: Више опција хостовања и скалирања
- **Безбедност и сигурност**: Уграђене одговорне AI функције

## AZD + Microsoft Foundry: Боље заједно

| Карактеристика | Microsoft Foundry | Предност интеграције са AZD |
|---------|-----------------|------------------------|
| **Распоређивање модела** | Ручно распоређивање преко портала | Аутоматизована, понављајућа распоређивања |
| **Инфраструктура** | Провизионисање кликом | Инфраструктура као код (Bicep) |
| **Управљање окружењем** | Фокус на једном окружењу | Мулти-окружења (dev/staging/prod) |
| **CI/CD интеграција** | Ограничено | Нативна подршка за GitHub Actions |
| **Управљање трошковима** | Основни мониторинг | Оптимизација трошкова специфична за окружење |

## Предуслови

- Azure претплата са одговарајућим дозволама
- Azure Developer CLI инсталиран
- Приступ Microsoft Foundry Models сервисима
- Основно познавање Microsoft Foundry

> **Тренутна AZD основа:** Ови примери су прегледани против `azd` `1.23.12`. За радни ток AI агента, користите тренутно preview проширење и проверите вашу инсталирану верзију пре него што почнете.

## Основни шаблони интеграције

### Шаблон 1: Интеграција Microsoft Foundry Models

**Сценарио употребе**: Распоредите чат апликације помоћу Microsoft Foundry Models модела

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

**Infrastructure (main.bicep):**
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

### Шаблон 2: AI Search + RAG интеграција

**Сценарио употребе**: Распоредите апликације са извлачењем и генерацијом (RAG)

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

**Сценарио употребе**: Радни токови за обраду и анализу докумената

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

**Конфигурација за продукцију:**
```bash
# Основне услуге вештачке интелигенције
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Конфигурације модела
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Подешавања перформанси
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Конфигурација за развој:**
```bash
# Подешавања оптимизована за уштеду током развоја
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Бесплатан ниво
```

### Безбедна конфигурација са Key Vault

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

### AZD проширења за Foundry

AZD пружа проширења која додају AI-специфичне могућности за рад са Microsoft Foundry сервисима:

```bash
# Инсталирајте проширење Foundry agents
azd extension install azure.ai.agents

# Инсталирајте проширење за фино подешавање
azd extension install azure.ai.finetune

# Инсталирајте проширење за прилагођене моделе
azd extension install azure.ai.models

# Прикажите инсталирана проширења
azd extension list --installed

# Проверите тренутно инсталирану верзију проширења агента
azd extension show azure.ai.agents
```

AI проширења су још увек у брзом развоју у preview фази. Ако команда понаша другачије него што је овде приказано, ажурирајте релевантно проширење пре него што кренете у решавање проблема са самим пројектом.

### Распоређивање усмерено на агента са `azd ai`

Ако имате agent manifest, користите `azd ai agent init` да бисте scaffold-овали пројекат повезан са Foundry Agent Service:

```bash
# Иницијализовати из манифеста агента
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Разместити на Azure
azd up
```

Недавна preview издања `azure.ai.agents` такође су додала подршку за иницијализацију засновану на шаблонима за `azd ai agent init`. Ако следите новије примерe за агенте, проверите помоћ проширења за тачне флагове доступне у вашој инсталираној верзији.

Погледајте [AZD AI CLI команде](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) за пуну референцу команда и флагова.

### Распоређивање једном командом

```bash
# Распоредите све једном командом
azd up

# Или распоредите постепено
azd provision  # Само инфраструктура
azd deploy     # Само апликација

# За распоређивање дуготрајних AI апликација у azd 1.23.11+
azd deploy --timeout 1800
```

### Распоређивања специфична за окружење

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

## Надгледање и набљудивост

### Интеграција Application Insights

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

### Надгледање трошкова

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

## 🔐 Најбоље праксе безбедности

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

### Проблем 1: Прекорачили сте квоту OpenAI

**Симптоми:**
- Распоређивање не успева због грешака везаних за квоту
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

### Проблем 2: Неуспеси у аутентификацији

**Симптоми:**
- 401/403 грешке приликом позива AI сервиса
- Поруке „Access denied“

**Решења:**
```bash
# Проверите доделе улога
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Проверите конфигурацију управљаног идентитета
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Потврдите приступ трезору кључева
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Проблем 3: Проблеми у распоређивању модела

**Симптоми:**
- Модели нису доступни у распоређивању
- Одређене верзије модела не функционишу

**Решења:**
```bash
# Прикажи доступне моделе по регионима
az cognitiveservices model list --location eastus

# Ажурирај верзију модела у bicep шаблону
# Провери захтеве за капацитет модела
```

## Примери шаблона

### RAG чат апликација (Python)

**Репозиторијум**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Услуге**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Опис**: Најпопуларнији Azure AI пример — продукцијски спремна RAG чат апликација која вам омогућава да постављате питања у вези са вашим документима. Користи GPT-4.1-mini за ћаскање, text-embedding-3-large за embedding-је и Azure AI Search за извлачење. Подржава мултимодалне документе, улаз/излаз говора, Microsoft Entra аутентификацију и трассирање у Application Insights.

**Брзи почетак**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG чат апликација (.NET)

**Репозиторијум**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Услуге**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Опис**: .NET/C# еквивалент Python RAG чат примера. Изграђен са ASP.NET Core Minimal API и Blazor WebAssembly фронтендом. Укључује voice chat, подршку за GPT-4o-mini vision и пратиоца у виду .NET MAUI Blazor Hybrid десктоп/мобилног клијента.

**Брзи почетак**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG чат апликација (Java)

**Репозиторијум**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Услуге**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Опис**: Java верзија RAG чат примера користи Langchain4J за AI оркестрацију. Подржава микросервисну архитектуру засновану на догађајима, више стратегија претраге (текст, вектор, хибрид), отпремање докумената са Azure Document Intelligence и распоређивање на Azure Container Apps или Azure Kubernetes Service.

**Брзи почетак**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot са Azure AI Foundry

**Репозиторијум**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Услуге**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Опис**: End-to-end retail RAG copilot који користи Azure AI Foundry и Prompty. Contoso Outdoor трговачки chatbot који ослања одговоре на каталог производа и податке о наруџбинама купаца. Демонстрира комплетан GenAIOps радни ток — прототипирање са Prompty, евалуацију помоћу AI-помоћних евалуатора и распоређивање преко AZD на Container Apps.

**Брзи почетак**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent апликација

**Репозиторијум**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Услуге**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Опис**: Мулти-агент пример који демонстрира оркестрацију AI агената са Prompty. Користи research агента (Bing Grounding у Azure AI Agent Service), product агента (Azure AI Search), writer агента и editor агента да заједно произведу добро истражене чланке. Укључује CI/CD са евалуацијом у GitHub Actions.

**Брзи почетак**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Безсерверски RAG чат (JavaScript/TypeScript)

**Репозиторијум**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Услуге**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Опис**: Потпуно serverless RAG chatbot користећи LangChain.js са Azure Functions за API и Azure Static Web Apps за хостинг. Користи Azure Cosmos DB као векторску складишну и базу за историју ћаскања. Подржава локални развој са Ollama за тестирање без трошкова.

**Брзи почетак**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Репозиторијум**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Услуге**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Опис**: Enterprise-grade RAG solution accelerator са админ порталом за отпремање/управљање документима, више опција оркестратора (Semantic Kernel, LangChain, Prompt Flow), speech-to-text, интеграцију са Microsoft Teams и избор PostgreSQL или Cosmos DB backend-а. Дизајнирано као прилагодљива полазна тачка за продукцијске RAG сценарије.

**Брзи почетак**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Мулти-агентна MCP оркестрација

**Репозиторијум**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Услуге**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Опис**: Референтна апликација за мулти-агентну AI оркестрацију користећи три фреймворка (LangChain.js, LlamaIndex.TS и Microsoft Agent Framework). Карактеристике укључују MCP (Model Context Protocol) сервере на четири језика распоређене као serverless Azure Container Apps са OpenTelemetry мониторингом.

**Брзи почетак**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Репозиторијум**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Услуге**: Azure AI Services + Azure OpenAI

**Опис**: Минималан Bicep шаблон који распоређује Azure AI сервисе са конфигурисаним машинским моделима. Лака полазна тачка када вам је потребна само провизионирана Azure AI инфраструктура без комплетног апликационог стекa.

**Брзи почетак**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Прегледајте више шаблона**: Посетите [Галерија одличних AZD AI шаблона](https://azure.github.io/awesome-azd/?tags=ai) за преко 80 AZD шаблона специфичних за AI преко језика и сценарија.

## Следећи кораци

1. **Испробајте примере**: Почните са унапред припремљеним шаблоном који одговара вашем сценарију
2. **Прилагодите за своје потребе**: Измените инфраструктуру и апликациони код
3. **Додајте надгледање**: Имплементирајте свеобухватну набљудивост
4. **Оптимизујте трошкове**: Подесите конфигурације у складу са буџетом
5. **Осигурајте ваше распоређивање**: Имплементирајте ентерпрајз безбедносне шаблоне
6. **Скалирајте до продукције**: Додајте мулти-регионалне и високо-расположиве карактеристике

## 🎯 Практичне вежбе

### Вежба 1: Распоредите Microsoft Foundry Models чат апликацију (30 минута)
**Циљ**: Распоредити и тестирати продукцијски спремну AI чат апликацију

```bash
# Иницијализуј шаблон
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Постави променљиве окружења
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Деплојирај
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
- [ ] Распоређивање се заврши без грешака везаних за квоту
- [ ] Могућ приступ интерфејсу за ћаскање у прегледачу
- [ ] Могу постављати питања и добијати AI-погонске одговоре
- [ ] Application Insights приказује телеметријске податке
- [ ] Ресурси су успешно очишћени

**Процењени трошак**: $5-10 за 30 минута тестирања

### Вежба 2: Конфигуришите мулти-моделско распоређивање (45 минута)
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

# Размешти и провери
azd provision
azd show
```

**Критеријуми успеха:**
- [ ] Више модела успешно распоређено
- [ ] Примењена различита подешавања капацитета
- [ ] Модели доступни преко API-ја
- [ ] Могу да позовем оба модела из апликације

### Вежба 3: Имплементирајте надгледање трошкова (20 минута)
**Циљ**: Подесити аларме буџета и праћење трошкова

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

# Размести упозорење о буџету
azd provision

# Провери тренутне трошкове
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Критеријуми успеха:**
- [ ] Буџетни аларм креиран у Azure-у
- [ ] Email обавештења конфигурисана
- [ ] Могу погледати податке о трошковима у Azure порталу
- [ ] Праг буџета подешен адекватно

## 💡 Често постављана питања

<details>
<summary><strong>Како да смањим трошкове Microsoft Foundry Models током развоја?</strong></summary>

1. **Користите бесплатни ниво**: Microsoft Foundry Models нуди 50,000 токена/месечно бесплатно
2. **Смањите капацитет**: Подесите капацитет на 10 TPM уместо 30+ за развој
3. **Користите azd down**: Ослободите ресурсе када не развијате активно
4. **Кеширајте одговоре**: Имплементирајте Redis кеш за поновљене упите
5. **Користите Prompt Engineering**: Смањите коришћење токена ефикасним упитима


```bash
# Развојна конфигурација
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Која је разлика између Microsoft Foundry Models и OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Безбедност и усаглашеност за предузећа
- Интеграција приватне мреже
- Гаранције SLA
- Аутентификација управљаним идентитетом
- Доступне веће квоте

**OpenAI API**:
- Бржи приступ новим моделима
- Једноставније подешавање
- Нижа баријера за улаз
- Само јавни интернет

За продукцијске апликације, **препоручује се Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Како да решим грешке прекорачења квоте за Microsoft Foundry Models?</strong></summary>

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
# Идите на Azure портал > Квоте > Затражите повећање
```
</details>

<details>
<summary><strong>Могу ли да користим сопствене податке са Microsoft Foundry Models?</strong></summary>

Да! Користите **Azure AI Search** за RAG (Retrieval Augmented Generation):

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
2. Омогућите Private Endpoints
3. Конфигуришите групе за мрежну безбедност
4. Успоставите ограничења учесталости захтева
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
- **AZD GitHub**: [Issues и дискусије](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Званична документација](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [вештина Microsoft Foundry на skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Инсталирајте Azure + Foundry вештине агента у ваш уређивач помоћу `npx skills add microsoft/github-copilot-for-azure`

---

**Навигација по поглављима:**
- **📚 Почетна страна курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - Развој усмерен на AI
- **⬅️ Претходно поглавље**: [Поглавље 1: Ваш први пројекат](../chapter-01-foundation/first-project.md)
- **➡️ Следеће**: [Распоређивање AI модела](ai-model-deployment.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

**Потребна помоћ?** Придружите се нашим дискусијама у заједници или отворите issue у репозиторијуму. Заједница Azure AI + AZD је ту да вам помогне да успете!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање одговорности**:
Овај документ је преведен помоћу AI услуге за превођење [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати меродавним извором. За критичне информације препоручује се професионални превод који изврши стручни преводилац. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која произилазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->