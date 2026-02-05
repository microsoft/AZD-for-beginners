# Интеграција Microsoft Foundry са AZD

**Навигација кроз поглавља:**
- **📚 Почетна страна курса**: [AZD за почетнике](../../README.md)
- **📖 Текуће поглавље**: Поглавље 2 - Развој са фокусом на вештачку интелигенцију
- **⬅️ Претходно поглавље**: [Поглавље 1: Ваш први пројекат](../getting-started/first-project.md)
- **➡️ Следеће**: [Деплојмент AI модела](ai-model-deployment.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../getting-started/configuration.md)

## Преглед

Овај водич показује како да интегришете Microsoft Foundry услуге са Azure Developer CLI (AZD) ради поједностављеног деплојмента AI апликација. Microsoft Foundry пружа свеобухватну платформу за изградњу, деплојмент и управљање AI апликацијама, док AZD поједностављује процес инфраструктуре и деплојмента.

## Шта је Microsoft Foundry?

Microsoft Foundry је јединствена платформа за развој вештачке интелигенције која укључује:

- **Каталог модела**: Приступ најсавременијим AI моделима
- **Prompt Flow**: Визуелни дизајнер за AI токове рада
- **AI Foundry портал**: Интегрисано развојно окружење за AI апликације
- **Опције деплојмента**: Више опција за хостинг и скалирање
- **Безбедност и сигурност**: Уграђене функције за одговорну употребу AI

## AZD + Microsoft Foundry: Бољи заједно

| Карактеристика | Microsoft Foundry | Предност интеграције са AZD |
|----------------|-------------------|-----------------------------|
| **Деплојмент модела** | Ручни деплојмент преко портала | Аутоматизовани, поновљиви деплојменти |
| **Инфраструктура** | Провизионисање кликом | Инфраструктура као код (Bicep) |
| **Управљање окружењем** | Фокус на једно окружење | Више окружења (развој/тест/продукција) |
| **CI/CD интеграција** | Ограничена | Нативна подршка за GitHub Actions |
| **Управљање трошковима** | Основни мониторинг | Оптимизација трошкова по окружењу |

## Предуслови

- Azure претплата са одговарајућим дозволама
- Инсталиран Azure Developer CLI
- Приступ Azure OpenAI услугама
- Основно познавање Microsoft Foundry платформе

## Основни обрасци интеграције

### Образац 1: Интеграција са Azure OpenAI

**Случај употребе**: Деплојмент чет апликација са Azure OpenAI моделима

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

### Образац 2: Интеграција AI претраге + RAG

**Случај употребе**: Деплојмент апликација за претрагу уз обогаћену генерацију (RAG)

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

**Конфигурација за развој:**
```bash
# Подешавања оптимизована за трошкове за развој
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Бесплатни ниво
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

## Радни токови деплојмента

### Деплојмент једном командом

```bash
# Разместите све једним командом
azd up

# Или разместите постепено
azd provision  # Само инфраструктура
azd deploy     # Само апликација
```

### Деплојменти специфични за окружење

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

### Проблем 1: Прекорачен Azure OpenAI квотни лимит

**Симптоми:**
- Деплојмент не успева због грешака у квоти
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

### Проблем 2: Грешке у аутентификацији

**Симптоми:**
- 401/403 грешке при позивању AI услуга
- Поруке "Приступ одбијен"

**Решења:**
```bash
# Потврдите доделу улога
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Проверите конфигурацију управљаног идентитета
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Потврдите приступ Key Vault-u
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Проблем 3: Проблеми са деплојментом модела

**Симптоми:**
- Модели нису доступни у деплојменту
- Одређене верзије модела не успевају

**Решења:**
```bash
# Списак доступних модела по регионима
az cognitiveservices model list --location eastus

# Ажурирај верзију модела у бицеп шаблону
# Провери захтеве капацитета модела
```

## Пример шаблона

### Основна чет апликација

**Репозиторијум**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Услуге**: Azure OpenAI + Cognitive Search + App Service

**Брзи почетак**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Платформа за обраду докумената

**Репозиторијум**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Услуге**: Document Intelligence + Storage + Functions

**Брзи почетак**:
```bash
azd init --template ai-document-processing
azd up
```

### Ентерпрајз чет са RAG

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
4. **Оптимизујте трошкове**: Подесите конфигурације у складу са вашим буџетом
5. **Обезбедите свој деплојмент**: Примените безбедносне обрасце за предузећа
6. **Скалирајте за продукцију**: Додајте мултирегионалне и функције високе доступности

## 🎯 Практичне вежбе

### Вежба 1: Деплојмент Azure OpenAI чет апликације (30 минута)
**Циљ**: Деплојмент и тестирање продукцијски спремне AI чет апликације

```bash
# Иницијализуј шаблон
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Постави променљиве окружења
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Деплој
azd up

# Тестирај апликацију
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Надгледај AI операције
azd monitor

# Очисти
azd down --force --purge
```

**Критеријуми успеха:**
- [ ] Деплојмент завршен без грешака у квоти
- [ ] Приступ чет интерфејсу у прегледачу
- [ ] Постављање питања и добијање одговора уз AI
- [ ] Application Insights приказује телеметријске податке
- [ ] Успешно очишћени ресурси

**Процењени трошак**: $5-10 за 30 минута тестирања

### Вежба 2: Конфигурација мулти-модел деплојмента (45 минута)
**Циљ**: Деплојмент више AI модела са различитим конфигурацијама

```bash
# Направите прилагођену Bicep конфигурацију
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

# Разместите и проверите
azd provision
azd show
```

**Критеријуми успеха:**
- [ ] Више модела успешно деплојовано
- [ ] Примењена различита подешавања капацитета
- [ ] Модели доступни преко API-ја
- [ ] Позивање оба модела из апликације

### Вежба 3: Имплементација мониторинга трошкова (20 минута)
**Циљ**: Подешавање упозорења о буџету и праћење трошкова

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

# Деплојуј упозорење о буџету
azd provision

# Провери тренутне трошкове
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Критеријуми успеха:**
- [ ] Креирано упозорење о буџету у Azure-у
- [ ] Конфигурисане нотификације путем е-поште
- [ ] Преглед трошкова у Azure порталу
- [ ] Постављени одговарајући прагови буџета

## 💡 Често постављана питања

<details>
<summary><strong>Како да смањим трошкове Azure OpenAI током развоја?</strong></summary>

1. **Користите бесплатни ниво**: Azure OpenAI нуди 50.000 токена месечно бесплатно
2. **Смањите капацитет**: Поставите капацитет на 10 TPM уместо 30+ за развој
3. **Користите azd down**: Деактивирајте ресурсе када их активно не користите
4. **Кеширајте одговоре**: Имплементирајте Redis кеш за поновљене упите
5. **Користите Prompt Engineering**: Смањите употребу токена ефикасним упитима

```bash
# Конфигурација за развој
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Која је разлика између Azure OpenAI и OpenAI API-ја?</strong></summary>

**Azure OpenAI**:
- Безбедност и усклађеност за предузећа
- Интеграција са приватним мрежама
- Гаранције SLA
- Аутентификација управљаним идентитетом
- Већи доступни квотни лимити

**OpenAI API**:
- Бржи приступ новим моделима
- Једноставније подешавање
- Мања баријера за улазак
- Само јавни интернет

За продукцијске апликације, **Azure OpenAI се препоручује**.
</details>

<details>
<summary><strong>Како да решим грешке прекорачења Azure OpenAI квоте?</strong></summary>

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
# Идите на Azure Portal > Квоте > Затражите повећање
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

Погледајте [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) шаблон.
</details>

<details>
<summary><strong>Како да обезбедим AI моделе?</strong></summary>

**Најбоље праксе**:
1. Користите управљани идентитет (без API кључева)
2. Омогућите приватне крајње тачке
3. Конфигуришите групе за безбедност мреже
4. Имплементирајте ограничење брзине
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

**Навигација кроз поглавља:**
- **📚 Почетна страна курса**: [AZD за почетнике](../../README.md)
- **📖 Текуће поглавље**: Поглавље 2 - Развој са фокусом на вештачку интелигенцију
- **⬅️ Претходно поглавље**: [Поглавље 1: Ваш први пројекат](../getting-started/first-project.md)
- **➡️ Следеће**: [Деплојмент AI модела](ai-model-deployment.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../getting-started/configuration.md)

**Потребна вам је помоћ?** Придружите се дискусијама у заједници или отворите проблем у репозиторијуму. Azure AI + AZD заједница је ту да вам помогне да успете!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање од одговорности**:  
Овај документ је преведен помоћу услуге за превођење вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако настојимо да обезбедимо тачност, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->