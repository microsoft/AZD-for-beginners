# Интеграција Microsoft Foundry са AZD

**Навигација поглавља:**
- **📚 Почетна страница курса**: [AZD For Beginners](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - Развој усмерен на AI
- **⬅️ Претходно поглавље**: [Поглавље 1: Ваш први пројекат](../chapter-01-foundation/first-project.md)
- **➡️ Следеће**: [Распоређивање AI модела](ai-model-deployment.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

## Преглед

Овај водич показује како интегрисати Microsoft Foundry услуге са Azure Developer CLI (AZD) за поједностављено распоређивање AI апликација. Microsoft Foundry пружа свеобухватну платформу за израду, распоређивање и управљање AI апликацијама, док AZD поједностављује инфраструктуру и процес распоређивања.

## Шта је Microsoft Foundry?

Microsoft Foundry је унификована Microsoft платформа за развој AI која укључује:

- **Каталог модела**: Приступ најсавременијим AI моделима
- **Prompt Flow**: Визуелни дизајнер AI радних токова
- **AI Foundry Portal**: Интегрисано развојно окружење за AI апликације
- **Опције распоређивања**: Различите опције хостовања и скалирања
- **Безбедност и сигурност**: Уграђене функције одговорног AI

## AZD + Microsoft Foundry: Боље заједно

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Распоређивање модела** | Ручно распоређивање преко портала | Аутоматизована, понављива распоређивања |
| **Инфраструктура** | Провизионисање кликом | Инфраструктура као код (Bicep) |
| **Управљање окружењем** | Фокус на једном окружењу | Више окружења (dev/staging/prod) |
| **Интеграција CI/CD** | Ограничено | Нативна подршка за GitHub Actions |
| **Управљање трошковима** | Основно праћење | Оптимизација трошкова по окружењима |

## Претпоставке

- Azure претплата са одговарајућим дозволама
- Azure Developer CLI инсталиран
- Приступ Azure OpenAI услугама
- Основно познавање Microsoft Foundry

## Основни обрасци интеграције

### Образац 1: Интеграција Azure OpenAI

**Случај употребе**: Распоређивање чат апликација са Azure OpenAI моделима

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

**Случај употребе**: Распоређивање апликација за генерацију обогаћену преузимањем (RAG)

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

### Образац 3: Интеграција Document Intelligence

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

**Продукциона конфигурација:**
```bash
# Основне услуге вештачке интелигенције
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Конфигурације модела
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Подешавања перформанси
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Развојна конфигурација:**
```bash
# Подешавања оптимизована за смањење трошкова за развој
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

## Радни токови распоређивања

### Распоређивање једном командом

```bash
# Деплојујте све једном командом
azd up

# Или деплојујте постепено
azd provision  # Само инфраструктура
azd deploy     # Само апликација
```

### Распоређивања специфична за окружење

```bash
# Развојно окружење
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Продукционо окружење
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Надгледање и видљивост

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

## 🔐 Најбоље праксе безбедности

### Конфигурација Managed Identity

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

## Решавање честих проблема

### Проблем 1: Прекорачење квоте OpenAI

**Симптоми:**
- Распоређивање не успева због грешака везаних за квоту
- 429 грешке у логовима апликације

**Решења:**
```bash
# Проверите тренутну употребу квоте
az cognitiveservices usage list --location eastus

# Пробајте други регион
azd env set AZURE_LOCATION westus2
azd up

# Привремено смањите капацитет
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Проблем 2: Неуспеси аутентификације

**Симптоми:**
- 401/403 грешке при позивању AI услуга
- Поруке „Приступ одбијен”

**Решења:**
```bash
# Проверите доделе улога
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Проверите конфигурацију управљаног идентитета
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Потврдите приступ Key Vault-у
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Проблем 3: Проблеми са распоређивањем модела

**Симптоми:**
- Модели нису доступни у распоређивању
- Појединачне верзије модела не функционишу

**Решења:**
```bash
# Прикажи доступне моделе по регионима
az cognitiveservices model list --location eastus

# Ажурирај верзију модела у bicep шаблону
# Провери захтеве за капацитет модела
```

## Пример шаблона

### Основна чат апликација

**Репозиторијум**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Услуге**: Azure OpenAI + Cognitive Search + App Service

**Брзи почетак**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Пайплајн за обраду докумената

**Репозиторијум**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Услуге**: Document Intelligence + Storage + Functions

**Брзи почетак**:
```bash
azd init --template ai-document-processing
azd up
```

### Предузећки чат са RAG

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
3. **Додајте надгледање**: Имплементирајте свеобухватну видљивост
4. **Оптимизујте трошкове**: Подесите конфигурације у складу са буџетом
5. **Осигурајте своје распоређивање**: Имплементирајте безбедносне шаблоне за предузећа
6. **Скалирајте у продукцију**: Додајте мултирегионалне и високо доступне функције

## 🎯 Практични задаци

### Вежба 1: Распоредите Azure OpenAI чат апликацију (30 минута)
**Циљ**: Распоредити и тестирати AI чат апликацију спремну за продукцију

```bash
# Иницијализуј шаблон
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Постави променљиве окружења
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Размешти
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
- [ ] Могуће је приступити интерфејсу чата у прегледачу
- [ ] Могу постављати питања и добијати одговоре покретане AI-ом
- [ ] Application Insights приказује телеметријске податке
- [ ] Ресурси су успешно очишћени

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

# Размешти и провери
azd provision
azd show
```

**Критеријуми успеха:**
- [ ] Више модела успешно распоређено
- [ ] Примењена различита подешавања капацитета
- [ ] Модели доступни преко API-ја
- [ ] Могу позвати оба модела из апликације

### Вежба 3: Имплементирајте праћење трошкова (20 минута)
**Циљ**: Подесити алерте буџета и праћење трошкова

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

# Распореди упозорење о буџету
azd provision

# Провери тренутне трошкове
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Критеријуми успеха:**
- [ ] Алерт буџета креиран у Azure
- [ ] Е-поштa нотификације конфигурисане
- [ ] Могу прегледати податке о трошковима у Azure порталу
- [ ] Праг буџета адекватно подешен

## 💡 Често постављана питања

<details>
<summary><strong>Како да смањим трошкове Azure OpenAI током развоја?</strong></summary>

1. **Користите бесплатни ниво**: Azure OpenAI нуди 50,000 токена/месечно бесплатно
2. **Смањите капацитет**: Поставите капацитет на 10 TPM уместо 30+ за развој
3. **Користите azd down**: Деаллоцирајте ресурсе када не развијате активно
4. **Кеширајте одговоре**: Имплементирајте Redis кеш за понављане упите
5. **Користите Prompt Engineering**: Смањите коришћење токена уз ефикасне промптове

```bash
# Конфигурација за развој
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Која је разлика између Azure OpenAI и OpenAI API?</strong></summary>

**Azure OpenAI**:
- Безбедност и усаглашеност за предузећа
- Интеграција приватне мреже
- Гаранције SLA
- Аутентификација помоћу Managed Identity
- Доступне веће квоте

**OpenAI API**:
- Бржи приступ новим моделима
- Једноставније подешавање
- Нижа баријера за улазак
- Само јавни интернет

За продукционе апликације, **препоручује се Azure OpenAI**.
</details>

<details>
<summary><strong>Како да решим грешке превишене квоте Azure OpenAI?</strong></summary>

```bash
# Провери тренутну квоту
az cognitiveservices usage list --location eastus2

# Пробај другу регију
azd env set AZURE_LOCATION westus2
azd up

# Привремено смањи капацитет
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Захтевај повећање квоте
# Иди на Azure портал > Квоте > Затражи повећање
```
</details>

<details>
<summary><strong>Могу ли користити своје податке са Azure OpenAI?</strong></summary>

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
<summary><strong>Како да обезбедим AI endpoint-ове модела?</strong></summary>

**Најбоље праксе**:
1. Користите Managed Identity (без API кључева)
2. Омогућите Private Endpoints
3. Конфигуришите мрежне безбедносне групе
4. Имплементирајте ограничење брзине (rate limiting)
5. Користите Azure Key Vault за тајне

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

---

**Навигација поглавља:**
- **📚 Почетна страница курса**: [AZD For Beginners](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - Развој усмерен на AI
- **⬅️ Претходно поглавље**: [Поглавље 1: Ваш први пројекат](../chapter-01-foundation/first-project.md)
- **➡️ Следеће**: [Распоређивање AI модела](ai-model-deployment.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

**Потребна помоћ?** Придружите се дискусијама заједнице или отворите issue у репозиторијуму. Заједница Azure AI + AZD је овде да вам помогне да успете!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Одрицање одговорности:
Овај документ је преведен помоћу AI сервиса за превођење [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику сматра се ауторитетним извором. За критичне информације препоручује се професионални људски превод. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која могу проистећи из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->