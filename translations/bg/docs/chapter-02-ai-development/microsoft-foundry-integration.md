# Интеграция на Microsoft Foundry с AZD

**Навигация в главите:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 2 - AI-първо разработване
- **⬅️ Предишна глава**: [Глава 1: Вашият първи проект](../chapter-01-foundation/first-project.md)
- **➡️ Следваща**: [Разгръщане на AI модели](ai-model-deployment.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

## Преглед

Това ръководство показва как да интегрирате услугите на Microsoft Foundry с Azure Developer CLI (AZD) за опростено разгръщане на AI приложения. Microsoft Foundry предоставя цялостна платформа за изграждане, разгръщане и управление на AI приложения, докато AZD улеснява инфраструктурата и процеса на разгръщане.

## Какво е Microsoft Foundry?

Microsoft Foundry е обединената платформа на Microsoft за разработка на AI, която включва:

- **Каталог на модели**: Достъп до съвременни AI модели
- **Prompt Flow**: Визуален дизайнер за AI работни потоци
- **AI Foundry Portal**: Интегрирана среда за разработка на AI приложения
- **Опции за разгръщане**: Множество опции за хостинг и скалиране
- **Сигурност и безопасност**: Вградени функции за отговорен AI

## AZD + Microsoft Foundry: По-добре заедно

| Функция | Microsoft Foundry | Предимство при интеграция с AZD |
|---------|-----------------|------------------------|
| **Разгръщане на модели** | Ръчно разгръщане през портала | Автоматизирани, повторяеми разгръщания |
| **Инфраструктура** | Предоставяне с кликове | Инфраструктура като код (Bicep) |
| **Управление на среди** | Фокус върху една среда | Многосредово (dev/staging/prod) |
| **CI/CD интеграция** | Ограничена | Нативна поддръжка на GitHub Actions |
| **Управление на разходи** | Основен мониторинг | Оптимизация на разходите по среди |

## Предпоставки

- Абонамент за Azure с подходящи разрешения
- Инсталиран Azure Developer CLI
- Достъп до Azure OpenAI услуги
- Основно познаване на Microsoft Foundry

## Основни модели на интеграция

### Модел 1: Интеграция с Azure OpenAI

**Сценарий**: Разгръщане на чат приложения с модели Azure OpenAI

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

### Модел 2: Интеграция AI Search + RAG

**Сценарий**: Разгръщане на приложения за генерация с подсилено извличане (RAG)

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

### Модел 3: Интеграция с Document Intelligence

**Сценарий**: Работни потоци за обработка и анализ на документи

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

## 🔧 Конфигурационни модели

### Настройка на променливи на средата

**Конфигурация за продукция:**
```bash
# Основни услуги за ИИ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Конфигурации на модели
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Настройки за производителност
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Конфигурация за разработка:**
```bash
# Настройки, оптимизирани за минимални разходи при разработка
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Безплатен план
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

### Разгръщане с еднокомендова команда

```bash
# Разгърнете всичко с една команда
azd up

# Или разгърнете поетапно
azd provision  # Само инфраструктура
azd deploy     # Само приложението
```

### Разгръщания спрямо средата

```bash
# Среда за разработка
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Продуктивна среда
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

### Кеширащи стратегии

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

### Конфигурация на автоскалиране

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
# Проверете текущото използване на квотата
az cognitiveservices usage list --location eastus

# Опитайте различен регион
azd env set AZURE_LOCATION westus2
azd up

# Временно намалете капацитета
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Проблем 2: Неуспешни удостоверявания

**Симптоми:**
- 401/403 грешки при извикване на AI услуги
- Съобщения "Достъп отказан"

**Решения:**
```bash
# Проверете присвояванията на роли
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Проверете конфигурацията на управляваната идентичност
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Проверете достъпа до Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Проблем 3: Проблеми при разгръщане на модели

**Симптоми:**
- Модели не са налични в разгръщането
- Някои версии на модели се провалят

**Решения:**
```bash
# Изброяване на наличните модели по региони
az cognitiveservices model list --location eastus

# Актуализиране на версията на модела в шаблона на Bicep
# Проверка на изискванията за капацитета на модела
```

## Примерни шаблони

### Основно чат приложение

**Репозитория**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Услуги**: Azure OpenAI + Cognitive Search + App Service

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Пайплайн за обработка на документи

**Репозитория**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Услуги**: Document Intelligence + Storage + Functions

**Бърз старт**:
```bash
azd init --template ai-document-processing
azd up
```

### Корпоративен чат с RAG

**Репозитория**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Услуги**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Бърз старт**:
```bash
azd init --template contoso-chat
azd up
```

## Следващи стъпки

1. **Опитайте примерите**: Започнете с предварително изграден шаблон, който отговаря на вашия сценарий
2. **Персонализирайте според нуждите си**: Модифицирайте инфраструктурата и кода на приложението
3. **Добавете мониторинг**: Внедрете цялостна наблюдаемост
4. **Оптимизирайте разходите**: Настройте конфигурациите според бюджета си
5. **Осигурете вашето разгръщане**: Внедрете корпоративни модели за сигурност
6. **Мащабирайте до продукция**: Добавете мултирегионална и висока достъпност

## 🎯 Практически упражнения

### Упражнение 1: Разгръщане на чат приложение Azure OpenAI (30 минути)
**Цел**: Разгърнете и тествате продукционно готово AI чат приложение

```bash
# Инициализиране на шаблона
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Задаване на променливите на средата
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Разгръщане
azd up

# Тестване на приложението
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Наблюдение на операциите на ИИ
azd monitor

# Почистване
azd down --force --purge
```

**Критерии за успех:**
- [ ] Разгръщането завършва без грешки за квота
- [ ] Можете да достъпите чат интерфейса в браузър
- [ ] Можете да задавате въпроси и да получавате отговори с AI
- [ ] Application Insights показва телеметрични данни
- [ ] Ресурсите са успешно почистени

**Оценена цена**: $5-10 за 30 минути тестове

### Упражнение 2: Конфигуриране на разгръщане с много модели (45 минути)
**Цел**: Разгърнете множество AI модели с различни конфигурации

```bash
# Създайте персонализирана конфигурация за Bicep
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

# Разгрънете и проверете
azd provision
azd show
```

**Критерии за успех:**
- [ ] Няколко модела са разположени успешно
- [ ] Приложени са различни настройки за капацитет
- [ ] Моделите са достъпни чрез API
- [ ] Можете да извиквате и двата модела от приложението

### Упражнение 3: Внедряване на мониторинг на разходите (20 минути)
**Цел**: Настройте бюджетни аларми и проследяване на разходите

```bash
# Добавете бюджетно предупреждение в Bicep
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

# Разгърнете бюджетно предупреждение
azd provision

# Проверете текущите разходи
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Критерии за успех:**
- [ ] Създаден бюджетен аларм в Azure
- [ ] Конфигурирани са имейл известия
- [ ] Можете да преглеждате данни за разходите в Azure портала
- [ ] Пороговете на бюджета са зададени подходящо

## 💡 Често задавани въпроси

<details>
<summary><strong>Как да намаля разходите за Azure OpenAI по време на разработка?</strong></summary>

1. **Използвайте безплатния слой**: Azure OpenAI предлага 50,000 токена/месец безплатно
2. **Намалете капацитета**: Задайте капацитет на 10 TPM вместо 30+ за разработка
3. **Използвайте azd down**: Деактивирайте ресурсите, когато не разработвате активно
4. **Кеширайте отговорите**: Внедрете Redis кеш за повтарящи се заявки
5. **Използвайте prompt engineering**: Намалете използването на токени с ефективни подсказки

```bash
# Конфигурация за разработка
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Каква е разликата между Azure OpenAI и OpenAI API?</strong></summary>

**Azure OpenAI**:
- Корпоративна сигурност и съответствие
- Интеграция с частни мрежи
- SLA гаранции
- Удостоверяване чрез управлявана идентичност
- Предлага по-високи квоти

**OpenAI API**:
- По-бърз достъп до нови модели
- По-проста настройка
- По-нисък праг за влизане
- Само публичен интернет

За приложения в продукция, **препоръчва се Azure OpenAI**.
</details>

<details>
<summary><strong>Как да се справя с грешки за превишена квота на Azure OpenAI?</strong></summary>

```bash
# Проверете текущата квота
az cognitiveservices usage list --location eastus2

# Опитайте друг регион
azd env set AZURE_LOCATION westus2
azd up

# Временно намалете капацитета
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Поискайте увеличение на квотата
# Отидете в Azure портал > Квоти > Поискайте увеличение
```
</details>

<details>
<summary><strong>Мога ли да използвам собствените си данни с Azure OpenAI?</strong></summary>

Да! Използвайте **Azure AI Search** за RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Вижте шаблона [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Как да защитя крайните точки на AI моделите?</strong></summary>

**Най-добри практики**:
1. Използвайте управлявана идентичност (без API ключове)
2. Активирайте Private Endpoints
3. Конфигурирайте мрежови защитни групи
4. Внедрете ограничение на скоростта (rate limiting)
5. Използвайте Azure Key Vault за секрети

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

## Общност и поддръжка

- **Discord на Microsoft Foundry**: [#Azure канал](https://discord.gg/microsoft-azure)
- **AZD в GitHub**: [Проблеми и дискусии](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Официална документация](https://learn.microsoft.com/azure/ai-studio/)

---

**Навигация в главите:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 2 - AI-първо разработване
- **⬅️ Предишна глава**: [Глава 1: Вашият първи проект](../chapter-01-foundation/first-project.md)
- **➡️ Следваща**: [Разгръщане на AI модели](ai-model-deployment.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

**Нуждаете се от помощ?** Присъединете се към нашите общностни дискусии или отворете issue в репозиторията. Общността Azure AI + AZD е тук, за да ви помогне да успеете!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Отказ от отговорност:
Този документ е преведен с помощта на услуга за превод с изкуствен интелект [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален превод, извършен от човек. Не носим отговорност за каквито и да е недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->