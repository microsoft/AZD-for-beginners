# Интеграција Microsoft Foundry са AZD

**Навигација кроз поглавља:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - Развој који је првенствено усмерен на АИ
- **⬅️ Претходно поглавље**: [Поглавље 1: Ваш први пројекат](../chapter-01-foundation/first-project.md)
- **➡️ Следеће**: [АИ агенти](agents.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

## Преглед

Овај водич показује како интегрисати Microsoft Foundry услуге са Azure Developer CLI (AZD) за поједностављено развоја АИ апликација. Microsoft Foundry пружа свеобухватну платформу за изградњу, имплементацију и управљање АИ апликацијама, док AZD поједностављује процесе инфраструктуре и имплементације.

## Шта је Microsoft Foundry?

Microsoft Foundry је јединствена платформа компаније Microsoft за развој АИ која укључује:

- **Каталог модела**: Приступ најсавременијим АИ моделима
- **Prompt Flow**: Визуелни дизајнер за АИ радне токове
- **Microsoft Foundry портал**: Интегрисано развојно окружење за АИ апликације
- **Опције имплементације**: Различите могућности хостинга и скалабилности
- **Безбедност и заштита**: Уграђене одговорне АИ функције

## AZD + Microsoft Foundry: Боље заједно

| Карактеристика | Microsoft Foundry | Предност AZD интеграције |
|---------|-----------------|------------------------|
| **Имплементација модела** | Ручна имплементација кроз портал | Аутоматизоване, понављиве имплементације |
| **Инфраструктура** | Конфигурација пројекта и ресурса | Почетак са `azure.yaml`; извоз Bicep или Terraform када је потребно |
| **Управљање окружењима** | Фокус на једно окружење | Вишекратно окружење (развој/тест/производња) |
| **CI/CD интеграција** | Услуге имплементације и евалуације | Реупотреба конфигурације у GitHub Actions или Azure DevOps |
| **Управљање трошковима** | Основни мониторинг | Оптимизација трошкова по окружењу |

## Предуслови

- Azure претплата са одговарајућим дозволама
- Azure Developer CLI верзија 1.37.0 или новија за GA Foundry радни ток
- Приступ Microsoft Foundry Models услугама
- Основно познавање Microsoft Foundry

> **Foundry GA ажурирање (2026-11-09):** Збирка екстензија `microsoft.foundry` достигла је верзију 1.0 и генералну доступност [5. новембра 2026.](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Испод је приказан ток рада који прати ту најаву и везани Microsoft Learn брзи почетак. Ово је преглед документације, а не потврда имплементације уживо. Опционе preview функције и независно објављене екстензије задржавају свој статус издања.

**Резултати учења:** Инсталирајте GA збирку, прегледајте `azure.yaml` агента, упоредите локалне и имплементиране одговоре, и објасните евалуацију, CI/CD и границе чишћења. За корак-по-корак имплементацију агента идите на [хостовани агенти ходокруг](#hosted-agent-walkthrough-ga). Донети ресурсни фрагменти покривају друге интеграционе обрасце.

## Основни интеграциони обрасци

**Обим примера:** Следећи Bicep садржи илустративне фрагменте ресурса, а не потпуни шаблон за имплементацију. Контејнерски шаблон мора дефинисати имена, `location`, референтне ресурсе, идентитете, излазе и хостинг апликација. Користите повезани пример као почетну тачку којом се може покренути. Bash примерима је потребна посебна Azure CLI аутентификација одвојена од `azd auth login`.

### Образац 1: Интеграција Microsoft Foundry Models

**Случај употребе**: Имплементација чат апликација са Azure OpenAI моделима у Microsoft Foundry

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

Позивачу је потребна придружена управљана идентитетска улога и `Cognitive Services OpenAI User` на нивоу налога; онемогућавање кључева не даје приступ. Проверите регион/модел/SKU доступност и квоте пре имплементације.

### Образац 2: AI Search + RAG интеграција

**Случај употребе**: Имплементација апликација са retrieval-augmented generation (RAG)

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

Не постоји `Microsoft.Search/searchServices/dataConnections` ARM ресурс за ову интеграцију. Конфигуришите Search индекс, извор података, indexer/skillset или vectorizer преко подржаних Search data-plane API-ja. Ако Search позива embedding модел, омогућите му управљани идентитет, доделите релевантну улогу модела и конфигуришите embedding skill/vectorizer. Погледајте [интегрисану векторизацију](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Образац 3: Интеграција Document Intelligence

**Случај употребе**: Радни токови обраде и анализе докумената

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

Сем документованих AZD подешавања као што је `AZURE_LOCATION`, ово су **имење улаза прилагођеног шаблона**. Они немају ефекат уколико шаблон/апликација их не користи преко параметара и мапирања окружења хоста. За `azure-search-openai-demo` користите њена стварна имена као што су `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` и `AZURE_SEARCH_SERVICE_SKU`. Капацитет модела није исти као SKU налога.

**Производна конфигурација:**
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

**Развојна конфигурација:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Безбедна конфигурација са Key Vault-ом

Преферирајте Entra ID са онемогућеном локалном аутентификацијом кључа. Следеће је само **наместак за legacy аутентификацију кључем** за апликације којима су кључеви потребни: захтева налог са омогућеном аутентификацијом кључева, идентитет апликације придружен његовом хосту и радни приступ/мрежу Key Vault-а. Немојте комбиновати добијање кључева са `disableLocalAuth: true` и очекивати да позиви кључем раде.

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

## Радни токови имплементације

### AZD екстензије за Foundry

За GA радни ток инсталирајте пакет `microsoft.foundry` уместо да састављате основне екстензије појединачно:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Пакет инсталира агенте, конекције, инспектор, пројекте, рутине, вештине и алатке. Не додаје `microsoft.foundry` командну групу. Евалуације, скуп података, фино подешавање и прилагођени модели инсталирају се посебно када су потребни. Погледајте [референцу паковања екстензија](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Прелазак на хостованог агента (GA)

**Хостовани агент** покреће ваш agent код на Foundry-у управљаном компјутеру. Ова вежба користи upstream основни Python Agent Framework Responses API пример, а не класичне Agent Service SDK фрагменте из других лекција.

#### 1. Припремите и иницијализујте

Користите празан директоријум ван ове checkout локације курса. Инсталирајте Python 3.13 или новији и актуелну [uv верзију](https://docs.astral.sh/uv/getting-started/installation/). Самосталне uv инсталације могу користити `uv self update`. Проверите [дозволе хостованог агента](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), доступност модела и квоту у вашој претплати и региону пре креирања. Azure ресурси и локални позиви модела наплаћују се.

Завршите инсталацију `azd auth login` и пакета изнад. Локални пример кода користи `DefaultAzureCredential`; ако користите Azure CLI акредитиве, пријавите се помоћу `az login` са истим налогом и tenant-ом као и AZD. Сам AZD пријава није Azure CLI пријава.

Покрените ову једноредну команду у Bash или PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Одаберите нови или постојећи Foundry пројекат и жељену претплату и регион. Да бисте реупотребили имплементацију модела, додајте `--model-deployment <existing-deployment-name>` у команду иницијализације **пре него што је покренете**, и изаберите постојећи пројекат. Останите у директоријуму који садржи генерисани `azure.yaml` за остале команде.

#### 2. Преглед дефиниције имплементације

Отворите `azure.yaml` и пронађите ове поставке у [upstream примеру](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Поставка | Шта проверавати |
|---------|---------------|
| `host: azure.ai.project` и `deployments` | Најављени Foundry пројекат и име модела, верзија, имплементациони SKU и капацитет |
| `host: azure.ai.agent` и `project` | Хостовани агент и директоријум у коме се налази његов извор |
| `codeConfiguration` | Python runtime и улазна тачка; прегледани пример користи `python_3_13` и `main.py` |
| `uses` | Зависност о Foundry пројектном сервису |
| `container.resources` | Распоред CPU и меморије, иако се код гради даљински |
| `env` | Мапирање имплементације модела и `PYTHONNOUSERSITE: "1"` за онемогућавање учитавања пакета са корисничког места |
| `infra.provider` | `microsoft.foundry`, који синтетише потребну инфраструктуру |

Заједно комитујте прегледани `azure.yaml` и agent код. За почетак није неопходна ручно писана инфраструктура; када су вам потребни уређиви датотеке за провизију, следите [infrastructure ejection](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) за Bicep или Terraform и наставите да користите `azd provision`. Не комитујте акредитиве или `.azure/` стање окружења.

#### 3. Провизионисање и локално тестирање

```bash
azd provision
azd ai agent run
```

Провизионисање може креирати недостајуће имплементације модела **чак и у реупотребљеном пројекту**. Прегледајте model prompts и изаберите доступну онлајн врсту имплементације као што су Global Standard или Data Zone Standard; квоте и регионална подршка варирају.

Локално извршавање припрема зависности и отвара **Agent Inspector**, где можете прегледати захтеве, одговоре и активност алата/модела. Оставите га да ради и отворите други терминал у истом директоријуму пројекта:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Контрола:** Потврдите да добијете релевантан одговор и да можете прегледати повезану локалну активност. Локално извршавање и даље позива вашу Azure model имплементацију; ово није офлајн или бесплатан тест. Користите синтетичке промптове и избегавајте приказивање тајни или поверљивих података у излазу инспектора.

#### 4. Имплементирајте и упоредите

Прекидач локалног извршавања је Ctrl+C када завршите. Пре даљинског позива, конфигуришите или проверите пројектне [Application Insights везе и приступ читању трагова](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing).

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

У режиму код имплементације, AZD отпрема изворни код за даљинску Foundry изградњу; није потребно локално складиштење контејнера за овај пут. Излаз имплементације обезбеђује везе за playground и endpoint. Потврдите одговор од имплементираног агента и његову cloud траг; само локални инспекторски догађаји не доказују да cloud тражење функционише.

За накнадне измене прегледајте подржану хостовану агенцијску конфигурацију са `azd deploy --preview`. Стримујте логове са `azd ai agent monitor --follow`, или дијагностикујте проблеме са подешавањем и приступом са `azd ai agent doctor`. Преглед имплементације није комплетан преглед инфраструктуре или безбедности.

#### 5. Додајте понављачки квалитетни преглед

Инсталирајте самостално објављену екстензију за евалуацију, затим генеришите нацрте тест имовине:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Опишите намерно понашање агента и изаберите **Dataset and evaluator**, па **Turn**. Прегледајте и уредите генерисане случајеве и оценски рукопис, укључујући случај несупортованог питања, пре конфигурисања евалуације:

```bash
azd ai eval init --name quality
```

Изаберите прегледани скуп података и рукопис, и потврдите судијску имплементацију модела. Прегледајте `evals/azure.eval.yaml` и његову референцу у `azure.yaml`, затим региструјте имовину и извршите:

```bash
azd up
azd ai eval run start --eval quality
```

Прегледајте скореве и неуспеле или са грешкама случајеве; завршена евалуација аутоматски не значи пролаз квалитета. Генерација и оцењивање такође носе трошкове модела. Комитујте некриптовану конфигурацију, скуп података и рукописе како би тим могли упоређивати промене. `azd ai agent optimize` може поново користити компатибилну евалуацију као базу, али прегледајте кандидате пре експлицитне имплементације. Погледајте [quality gates и миграцију](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) за старије пројекте и CI.

#### 6. Реупотреба токова у CI/CD

После успешног `azd up`, покрените `azd pipeline config` и прегледајте генерисани GitHub Actions или Azure DevOps ток. Инсталирајте `microsoft.foundry` на runner, и `azure.ai.evaluations` ако покрећете евалуације. Задржите генерисана checkout, пријављивање и подешавања окружења; само инсталација не аутентификује pipeline.

Користите засебно AZD окружење по фази, доделите pipeline идентитету потребне ресурсе и Foundry дозволе, и чувајте акредитиве у pipeline секретима или користите федерални идентитет. Комитујте евалуациону имовину и проверите да ли идентитет има приступ референтним скупинама података/евалуторима. Погледајте [пример pipeline курса](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) и [Foundry CI/CD водич](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Намерно чишћење

За **нови пројекат креиран овим окружењем**, прегледајте ресурсе наведене од стране `azd down` пре потврде: ова команда брише ресурсну групу и све у њој.

За **реупотребљени пројекат**, `azd down` оставља пројекат, хостованог агента и друге ресурсе на месту. Уклони само непожељне ресурсе које поседујете користећи [брзе смернице за чишћење](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); немојте брисати заједничку ресурсну групу да бисте очистили једну вежбу.

**Провера завршетка:** Објасните која подешавања контролишу локално и cloud понашање, покажите локалне и имплементиране одговоре, прегледајте резултат евалуације и идентификујте који ресурси остају након чишћења.

### Опционо: Scaffold помоћу Microsoft Foundry Skill

Инсталирајте [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) за host агента вашег кода, затим отворите одвојени празан фолдер. Затражите да scaffold-ује основни Python Agent Framework Responses API пример у режиму код имплементације, објасните генерисани `azure.yaml` и предложите претплату, регион, пројекат и имплементацију модела. Захтевајте одобрење **пре креирања Azure ресурса**, затражите локално тестирање и зауставите пре имплементације. Прегледајте његов излаз и наставите са корацима имплементације изнад тек када будете спремни.

За постојеће пројекте, `--template`/`-t` замењује застарели `--manifest`/`-m` правопис; промена заставице не мигрира заоставште манифесте или уграђену конфигурацију агента. Погледајте [AI CLI reference](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Једнократна команда за дистрибуцију

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Дистрибуције специфичне за окружење

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

## Надгледање и посматрање

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
```

Ово обезбеђује ресурс Insights, а не инструментализацију телеметрије. Када ваша апликација емитује одлазеће опсеге позива модела, покрените овај илустративни упит у Application Insights Logs (прилагодите филтер стварним именима опсега):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Надгледање Трошкова

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

Користите стварног примаоца и проверите дозволе за обим наплате. Буџет шаље упозорења; то није лимит трошкова.

## 🔐 Најбоље праксе за безбедност

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

### Безбедност Мреже

Овом крајњом тачком такође је потребна приватна DNS зона/група, VNet линкови, повезивање апликације са VNet-ом и експлицитна политика јавног приступа. Само креирање приватне крајње тачке не онемогућава јавни приступ.

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

## Оптимизација Перформанси

### Стратегије Кеширања

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

Azure Cache for Redis Basic/Standard/Premium је на [пути ка пензији](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); за нове дистрибуције користите Azure Managed Redis и пратите његове актуелне смернице за шаблоне/аутентификацију. Обим кешираних AI одговора определите овлашћењем, моделом/упутствима и верзијом података, са истеком; никада не делите приватне одговоре само коришћењем текста упита.

### Конфигурација Аутоматског Скалисања

**Делимично средство:** спојите ове параметре скалирања/улаза у потпуну апликацију за контејнере са управљаним окружењем, контејнер сликом и ограничењима ресурса. Више реплика не повећава квоту модела.

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

## Решавање Уобичајених Проблема

### Проблем 1: Прекорачење квоте за OpenAI

**Симптоми:**
- Дистрибуција неуспешна са грешкама квоте
- 429 грешке у логовима апликације

**Решења:**
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

Променљива капацитета изнад важи само за прилагођени шаблон који је спојен да то користи. За RAG пример, користите `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Не мењајте `AZURE_LOCATION` да бисте преместили постојеће ресурсе; креирајте засебно окружење за нови регион и испланирајте миграцију/чишћење.

### Проблем 2: Неуспеси аутентификације

**Симптоми:**
- 401/403 грешке приликом позива AI услуга
- Поруке „Приступ одбијен“

**Решења:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Проблем 3: Проблеми са дистрибуцијом модела

**Симптоми:**
- Модели нису доступни у дистрибуцији
- Неке верзије модела неуспешне

**Решења:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Пример Шаблона

Ово су алтернативе, а не узастопне команде. Почните сваки у засебном празном директоријуму. Експлицитан `.` циљ задржава инициализацију у вашем тренутном директоријуму; иначе текући AZD може креирати дечји директоријум са именом шаблона без промене радног директоријума вашег терминала.

### RAG Чат Апликација (Python)

**Репозиторијум**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Услуге**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Опис**: Референтна RAG чат апликација за питања изнад ваших докумената, са Azure AI Search претрагом. Прегледајте тренутно подржане моделе узорка, опционе функције, смернице трошкова и припрему за продукцију пре коришћења; распоређивање узорка не чини апликацију спремном за продукцију.

**Брзи Почетак**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG Чат Апликација (.NET)

**Репозиторијум**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Услуге**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Опис**: .NET/C# еквивалент Python RAG чат узорка. Изграђено са ASP.NET Core Minimal API и Blazor WebAssembly фронтендом. Укључује гласовни ћаскање, подршку за GPT-4o-mini визију и пратећи .NET MAUI Blazor Hybrid десктоп/мобилни клијент.

**Брзи Почетак**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG Чат Апликација (Java)

**Репозиторијум**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Услуге**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Опис**: Јава верзија RAG чат узорка користећи Langchain4J за AI оркестрацију. Подржава микроуслужну архитектуру вођену догађајима, више стратегија претраге (текст, вектор, хибрид), отпремање докумената уз Azure Document Intelligence и дистрибуцију на Azure Container Apps или Azure Kubernetes Service.

**Брзи Почетак**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot са Microsoft Foundry

**Репозиторијум**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Услуге**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Опис**: End-to-end ретail RAG копилот користећи Microsoft Foundry и Prompty. Contoso Outdoor трговац ћаскање бот који базе одговоре на подацима каталога производа и подацима о наруџбинама клијената. Приказује цео GenAIOps ток рада — прототип са Prompty-ом, процена помоћу AI-помоћних оцењивача и дистрибуција преко AZD у Container Apps.

**Брзи Почетак**:
```bash
azd init --template contoso-chat .
azd up
```

### Апликација за Креативно Писање са Вишеструким Агентима

**Репозиторијум**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Услуге**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Опис**: Пример вишеструких агената који демонстрира оркестрацију AI агената са Prompty. Користи истраживачког агента (Bing Grounding у Azure AI Agent Service), агента за производ, агента писца и агента уредника за заједничко стварање добро истражених чланака. Укључује CI/CD са проценом у GitHub Actions.

**Брзи Почетак**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Безсерверски RAG Чат (JavaScript/TypeScript)

**Репозиторијум**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Услуге**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB за NoSQL + LangChain.js

**Опис**: Потпуно безсерверски RAG ћаскање бот који користи LangChain.js са Azure Functions за API и Azure Static Web Apps за хостирање. Користи Azure Cosmos DB као и продавницу вектора и базу података историје ћаскања. Подржава локални развој са Ollama за тестирање без трошкова.

**Брзи Почетак**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat with Your Data Solution Accelerator

**Репозиторијум**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Услуге**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search са Cosmos DB, или PostgreSQL са pgvector

**Опис**: Акцелератор ћаскања базиран на документу са цитатима. Тренутни узорак хостује React фронтенд, FastAPI бекенд и Functions ingestion радника на Container Apps; опције оркестратора су Agent Framework и LangGraph. Опције базе података/претраживања се бирају при дистрибуцији. То је почетна тачка, не потпуни систем за продукцију; немојте претпостављати да старије варијанте App Service, Semantic Kernel или Prompt Flow описују тренутни подразумевани.

**Брзи Почетак**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI Travel Agents — Вишеструка оркестрација MCP агената

**Репозиторијум**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Услуге**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Опис**: Референтна апликација за оркестрацију вишеструких AI агената користећи три оквира (LangChain.js, LlamaIndex.TS и Microsoft Agent Framework). Карактеристике MCP (Model Context Protocol) сервере на четири језика распоређене као безсерверске Azure Container Apps са OpenTelemetry надгледањем.

**Брзи Почетак**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Прегледајте још шаблона**: Посетите [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) за тренутно доступне шаблоне на различитим језицима и сценаријима. Сваки повезани пример је спољни репозиторијум, а не локални пример који обезбеђује овај курс; прегледајте његове тренутне предуслове и смернице за продукцију пре распоређивања.

## Следећи кораци

1. **Испробајте примере**: Почните са унапред направљеним шаблоном који одговара вашем случају коришћења
2. **Прилагодите по својој потреби**: Модификујте инфраструктуру и код апликације
3. **Додајте надгледање**: Имплементирајте свеобухватну посматрачност
4. **Оптимизујте трошкове**: Подесите конфигурације за ваш буџет
5. **Осигурајте своју дистрибуцију**: Имплементирајте безбедносне шаблоне за предузећа
6. **Шалишите се ка продукцији**: Додајте вишерегијске и карактеристике високог нивоа доступности

## 🎯 Практичне Вежбе

### Вежба 1: Распоредите Microsoft Foundry Models Chat App (30 минута)
**Циљ**: Распоредите и тестирате референтну AI чат апликацију

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

# Review the listed resources and confirm cleanup
azd down
```

**Критеријуми успеха:**
- [ ] Распоред се заврши без грешака квоте
- [ ] Може да приступи интерфејсу ћаскања у браузеру
- [ ] Може да поставља питања и добија AI инспирисане одговоре
- [ ] Application Insights приказује телеметријске податке
- [ ] Ресурси успешно очишћени

**Трошак:** Прегледајте тренутне смернице трошкова узорка и одабране SKU пре распоређивања. Наплата траје док се ресурси не обришу; не постоји фиксни 30-минутни прорачун који важи за све конфигурације.

### Вежба 2: Конфигуришите мултимодел дистрибуцију (45 минута)
**Циљ**: Распоредите више AI модела са различитим конфигурацијама

**Почетна тачка:** Постојећи Azure OpenAI налог и AZD модул обима ресурс групе који може да позове ову датотеку. Креирајте `infra/ai-models.bicep` са следећим садржајем користећи ваш уредник. Не распоређује се аутоматски само зато што је испод `infra/`.

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

Из модула у обиму ресурс групе који поседује налог додајте позив модула (прилагодите име симбола вашем стварном налогу):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Не декларишите исте дистрибуције у оба модула. Ако је AZD улазна тачка у обиму претплате, позовите ово из његовог модула у обиму ресурс групе и прилагодите релативну путању. Изградите тај садржајни модул са `az bicep build --file <path-to-containing-module>`, затим:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Критеријуми успеха:**
- [ ] Више модела успешно распоређено
- [ ] Примењене различите поставке капацитета
- [ ] Модели доступни преко API-ја
- [ ] Могући позиви оба модела из апликације

### Вежба 3: Имплементирање надгледања трошкова (20 минута)
**Циљ**: Подесите упозорења буџета и праћење трошкова

**Почетна тачка:** Шаблон буџета изнад и инфраструктурни модул у обиму ресурс групе. Додајте овај ресурс користећи ваш уредник; проследите `budgetStartDate` из ваше параметарске мапе (не дуплирајте параметар ако је већ декларисан). Замените примаоца и потврдите да имате приступ за упис буџета.

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

Очекује се: одговор садржи `amount: 200`, оба прага и вашег примаоца. Прегледајте Cost Management у порталу за стварне наплате; подаци о трошковима су кашњени и упозорење не мора бити активирано током кратке вежбе.

**Критеријуми успеха:**
- [ ] Упозорење буџета креирано у Azure
- [ ] Конфигурисане емаил нотификације
- [ ] Могућ приказ трошкова у Azure Порталу
- [ ] Постављени прагови буџета адекватно

## 💡 Често Постављана Питања

<details>
<summary><strong>Како да смањим трошкове Microsoft Foundry Models током развоја?</strong></summary>

1. **Проверите цене**: Не постоји универзални бесплатни месечни лимит од 50,000 токена за Azure OpenAI моделе
2. **Прилагодите капацитет**: Капацитет `10` обично представља 10,000 TPM за ове Стандард текстуалне моделе, а не 10 TPM. Смањење ове границе захтева не смањује цене по токену
3. **Користите azd down**: Обришите ресурсе који се могу уклонити када не развијате активно (ово није деалокација)
4. **Кеширајте одговоре**: Имплементирајте Redis кеш за понављане упите
5. **Користите Prompt Engineering**: Смањите употребу токена ефикасним упитима

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Која је разлика између Microsoft Foundry Models и OpenAI API-ја?</strong></summary>

**Microsoft Foundry Models**:
- Безбедност предузећа и усаглашеност
- Приватна интеграција мреже
- Гаранције нивоа услуге (SLA)
- Аутентификација управљеног идентитета
- Веће доступне квоте

**OpenAI API**: Одвојени провајдер/API са својом доступношћу модела, ценама, аутентификацијом и опцијама за повезивање у предузећу. Упоредите тренутне понуде уместо да претпостављате да је само јавни интернет или да увек прво испоручује моделе.

Изаберите на основу захтева ваше организације; примери управљеног идентитета специфични за Azure и приватног линка у овом курсу примењују се на услуге хостоване на Azure-у, а не на сваки модел/провајдер из Foundry каталога.
</details>

<details>
<summary><strong>Како да решим грешке прекорачења квоте Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Могу ли да користим своје податке са Microsoft Foundry Models?</strong></summary>

Да! Користите **Azure AI Search** за RAG (Retrieval Augmented Generation):

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

Погледајте шаблон [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Како да обезбедим крајне тачке AI модела?</strong></summary>

**Најбоље праксе**:
1. Користите Управљани идентитет (без API кључева)
2. Омогућите Приватне крајње тачке
3. Конфигуришите групе безбедности мреже
4. Имплементирајте ограничење брзине приступа
5. Користите Azure Key Vault за тајне податке

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

## Заједница и Подршка

- **Microsoft Foundry Discord**: [#Azure канал](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Проблеми и дискусије](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Званична документација](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry вештина на skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Инсталирајте Azure + Foundry вештине агента у вашем едитору помоћу `npx skills add microsoft/github-copilot-for-azure`

---

**Навигација по поглављима:**
- **📚 Почетна страница курса**: [AZD За почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - AI-први развој
- **⬅️ Претходно поглавље**: [Поглавље 1: Ваш први пројекат](../chapter-01-foundation/first-project.md)
- **➡️ Следеће**: [AI агенти](agents.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

**Треба помоћ?** Придружите се дискусијама заједнице или отворите проблем у репозиторијуму. Azure AI + AZD заједница је ту да вам помогне да успете!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->