# Интеграция на Microsoft Foundry с AZD

**Навигация в главата:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 2 - AI-първо разработване
- **⬅️ Предишна глава**: [Глава 1: Вашият първи проект](../chapter-01-foundation/first-project.md)
- **➡️ Следваща**: [AI агенти](agents.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

## Преглед

Това ръководство демонстрира как да се интегрират услугите Microsoft Foundry с Azure Developer CLI (AZD) за опростени разгръщания на AI приложения. Microsoft Foundry осигурява цялостна платформа за изграждане, разгръщане и управление на AI приложения, докато AZD опростява инфраструктурата и процеса на разгръщане.

## Какво е Microsoft Foundry?

Microsoft Foundry е обединена платформа на Microsoft за AI разработка, която включва:

- **Каталог модели**: Достъп до съвременни AI модели
- **Prompt Flow**: Визуален дизайнер за AI работни потоци
- **Microsoft Foundry портал**: Интегрирана среда за разработка на AI приложения
- **Опции за разгръщане**: Множество опции за хостинг и мащабиране
- **Сигурност и безопасност**: Вградени функции за отговорен AI

## AZD + Microsoft Foundry: По-добри заедно

| Функция | Microsoft Foundry | Предимство при интеграция с AZD |
|---------|-----------------|------------------------|
| **Разгръщане на модели** | Ръчно разгръщане в портала | Автоматизирани, повтарящи се разгръщания |
| **Инфраструктура** | Конфигурация на проекти и ресурси | Започнете с `azure.yaml`; извличайте Bicep или Terraform при нужда |
| **Управление на околната среда** | Фокус върху една среда | Мулти-среда (dev/staging/prod) |
| **Интеграция с CI/CD** | Услуги за разгръщане и оценка | Повторно използване на конфигурация в GitHub Actions или Azure DevOps |
| **Управление на разходите** | Основен мониторинг | Оптимизация на разходите според средата |

## Предварителни условия

- Абонамент за Azure с подходящи разрешения
- Azure Developer CLI 1.37.0 или по-нова за GA Foundry работен поток
- Достъп до услугите Microsoft Foundry Models
- Основни познания за Microsoft Foundry

> **Foundry GA ъпдейт (2026-11-09):** Пакетът разширения `microsoft.foundry` достигна версия 1.0 и обща наличност на [5 ноември 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). По-долу описаният урок следва това съобщение и свързания Microsoft Learn бърз старт. Това е преглед на документацията, а не валидация на живо разгръщане. Опционалните функции в преглед и независимо пуснатите разширения запазват собствен статус на издаване.

**Резултати от обучението:** Инсталирайте GA пакета, прегледайте `azure.yaml` на агент, сравнете локални и разположени отговори и обяснете границите на оценката, CI/CD и почистването. За стъпка по стъпка разгръщане на агент, посетете [hosted-agent tutorial](#hosted-agent-walkthrough-ga). Фрагментите на ресурсите по-долу обхващат други интеграционни шаблони.

## Основни интеграционни шаблони

**Обхват на примерите:** Bicep шаблонът по-долу съдържа илюстративни ресурси, а не пълен разгръщащ шаблон. Контейнерният шаблон трябва да дефинира имена, `location`, референтни ресурси, идентичности, изходи и хостинг на приложението. Използвайте свързан пример за стартираща точка. Примерите в Bash изискват Azure CLI аутентикация отделно от `azd auth login`.

### Шаблон 1: Интеграция с Microsoft Foundry Models

**Пример за употреба:** Разгръщане на чат приложения с Azure OpenAI модели в Microsoft Foundry

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

Позователят трябва да има прикрепена управлявана идентичност и `Cognitive Services OpenAI User` на акаунт ниво; деактивирането на ключове не предоставя достъп. Проверете наличност на регион/модел/SKU и квота преди разгръщане.

### Шаблон 2: Интеграция AI търсене + RAG

**Пример за употреба:** Разгръщане на приложения за retrieval-augmented generation (RAG)

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

Няма `Microsoft.Search/searchServices/dataConnections` ARM ресурс за тази интеграция. Конфигурирайте Search index, data source, indexer/skillset или vectorizer чрез поддържаните Search data-plane API-та. Ако Search извиква embedding модел, активирайте управляваната му идентичност, предоставете съответната роля на модела и конфигурирайте embedding skill/vectorizer. Вижте [интегрирано векторизиране](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Шаблон 3: Интеграция на документен интелект

**Пример за употреба:** Работни потоци за обработка и анализ на документи

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

## 🔧 Шаблони за конфигурация

### Настройка на променливи на средата

С изключение на документирани AZD настройки като `AZURE_LOCATION`, това са **имена на входни параметри на потребителски шаблон**. Те нямат ефект, ако шаблонът/приложението не ги използва чрез параметър и съпоставяне с хост среда. За `azure-search-openai-demo` използвайте истинските имена като `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` и `AZURE_SEARCH_SERVICE_SKU`. Капацитетът на модела не е акаунтен SKU.

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

Предпочитайте Entra ID с деактивирана локална аутентикация с ключове. Следното е само **алтернативно наследствено решение с ключове**, за приложения, които изискват ключове: изисква акаунт с активирана аутентикация с ключове, прикрепена идентичност на приложението към хоста му и включен достъп/мрежова политика за Key Vault. Не комбинирайте извличане на ключове с `disableLocalAuth: true` и очаквайте работещи повиквания с ключове.

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

## Работни потоци за разгръщане

### AZD разширения за Foundry

За GA работния поток инсталирайте пакета `microsoft.foundry` вместо да съставяте основните разширения едно по едно:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Пакетът инсталира агенти, връзки, инспектор, проекти, процедури, умения и инструменти. Не добавя група команди `microsoft.foundry`. Оценки, набори от данни, донастройване и персонализирани модели се инсталират отделно при нужда. Вижте [референция за пакетиране на разширения](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Урок за Hosted-Agent (GA)

**Hosted агент** изпълнява кода на агента ви на управлявана от Foundry изчислителна платформа. Тази задача използва основния Python Agent Framework Responses API пример от upstream, а не класическия Agent Service SDK, използван в другите уроци.

#### 1. Подготовка и инициализация

Използвайте празна директория извън този курс. Инсталирайте Python 3.13 или по-нова и актуална [uv версия](https://docs.astral.sh/uv/getting-started/installation/). Самостоятелните uv инсталации могат да използват `uv self update`. Проверете [разрешения за hosted-agent](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), наличност на модел и квота в абонамента и регионите преди създаване. Azure ресурси и локални повиквания на модел начисляват разходи.

Завършете инсталацията на `azd auth login` и пакета по-горе. Локалният пример използва `DefaultAzureCredential`; ако използвате Azure CLI креденциали, влезте с `az login` с акаунта и клиента, съвпадащи с AZD. Само влизане в AZD не е влизане в Azure CLI.

Изпълнете тази команда на един ред в Bash или PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Изберете нов или съществуващ Foundry проект и желания абонамент и регион. За повторна употреба на моделно разгръщане добавете `--model-deployment <existing-deployment-name>` към командата за инициализация **преди да я стартирате** и изберете съществуващия проект. Останете в директорията с генерирания `azure.yaml` за следващите команди.

#### 2. Прегледайте дефиницията на разгръщането

Отворете `azure.yaml` и намерете тези настройки в [upstream образеца](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Настройка | Какво да проверите |
|---------|---------------|
| `host: azure.ai.project` и `deployments` | Предназначен проект в Foundry и име на модел, версия, разгръщащ SKU и капацитет |
| `host: azure.ai.agent` и `project` | Hosted агент и директорията с изходния му код |
| `codeConfiguration` | Python runtime и входна точка; разгледаният пример използва `python_3_13` и `main.py` |
| `uses` | Зависимост от услугата на проекта в Foundry |
| `container.resources` | CPU и памет, въпреки че кодът се изпълнява отдалечено |
| `env` | Картиране на разгръщане на модел и `PYTHONNOUSERSITE: "1"` за забрана на зареждане на пакети от потребителски сайт |
| `infra.provider` | `microsoft.foundry`, който синтезира необходимата инфраструктура |

Комитнете прегледаните `azure.yaml` и агент код заедно. Не е необходим ръчно написан инфраструктурен код за стартиране; когато са нужни редактирани файлове за доставяне, следвайте [ejection на инфраструктура](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) за Bicep или Terraform и продължете да използвате `azd provision`. Не комитвайте креденциали или `.azure/` състояние на средата.

#### 3. Създаване и локално тестване

```bash
azd provision
azd ai agent run
```

Процесът на създаване може да направи липсващи разгръщания на модели **дори в повторно използван проект**. Прегледайте модела на подканите и изберете наличен разгръщащ тип онлайн като Global Standard или Data Zone Standard; квоти и регионална поддръжка варират.

Локалното изпълнение подготвя зависимости и отваря **Agent Inspector**, където можете да инспектирате заявки, отговори и активност на инструменти/модели. Оставете го да работи и отворете втори терминал в същата директория на проекта:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Контролна точка:** Потвърдете, че получавате релевантен отговор и можете да разгледате съответната локална активност. Локалното изпълнение все още извиква вашия Azure модел; не е офлайн или безплатен тест. Използвайте синтетични подканяния и избягвайте излагането на тайни или чувствителни данни в изхода на инспектора.

#### 4. Разгръщане и сравнение

Спирайте локалното изпълнение с Ctrl+C, когато сте готови. Преди отдалечено извикване конфигурирайте или проверете [връзката към Application Insights на проекта и достъп за четене на трасета](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing).

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

В режим на разгръщане на код, AZD качва изходния код за отдалечено изграждане в Foundry; не се изисква локално контейнерно изграждане за този път. Изходът от разгръщането предоставя връзки към sandbox и крайна точка. Проверете отговор от разположения агент и неговото облачно проследяване; само събития от локалния инспектор не доказват, че облачното проследяване работи.

За следващи промени прегледайте поддържаната конфигурация за hosted-agent с `azd deploy --preview`. Поток логове с `azd ai agent monitor --follow`, или диагностицирайте проблеми с настройката и достъпа с `azd ai agent doctor`. Прегледът на разгръщане не е пълен инфраструктурен или сигурностен преглед.

#### 5. Добавете повтаряща се проверка на качеството

Инсталирайте независимо издаденото разширение за оценки, след което генерирайте проект за тестови активи:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Опишете предвиденото поведение на агента и изберете **Dataset and evaluator**, след което **Turn**. Прегледайте и редактирайте генерираните случаи и оценъчна схема, включително случай с неподдържан въпрос, преди да конфигурирате оценката:

```bash
azd ai eval init --name quality
```

Изберете прегледания набор от данни и схема и потвърдете разгръщането на модела съдия. Инспектирайте `evals/azure.eval.yaml` и референцията към услугата за оценка в `azure.yaml`, след което регистрирайте активите и изпълнете:

```bash
azd up
azd ai eval run start --eval quality
```

Инспектирайте резултати и неуспешни или грешни случаи; завършената оценка не е автоматично преминаване на качеството. Генерирането и оценяването също създават разходи за модела. Комитнете некритична конфигурация, набори от данни и схеми, за да могат колегите да сравняват промени. `azd ai agent optimize` може да използва съвместима оценка като базова линия, но прегледайте кандидатите преди да разположите една изрично. Вижте [качествени етапи и миграция](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) за по-стари проекти и CI.

#### 6. Повторна употреба на работния поток в CI/CD

След успешно `azd up` изпълнете `azd pipeline config` и прегледайте генерирания GitHub Actions или Azure DevOps работен поток. Инсталирайте `microsoft.foundry` на runner-а, плюс `azure.ai.evaluations` ако изпълнявате оценки. Запазете генерираните настройки за получаване на кода, влизане и среда; само инсталацията не аутентифицира pipeline.

Използвайте отделна среда в AZD за всеки етап, дайте на pipeline-а идентичност с необходимите разрешения за ресурси и Foundry и пазете креденциали в pipeline секрети или използвайте федеративна идентичност. Комитвайте оценъчни активи и проверете дали идентичността има достъп до реферираните набори от данни/оценители. Вижте [пример за pipeline от курса](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) и [Foundry CI/CD ръководство](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Изчистете внимателно

За **нов проект, създаден от тази среда**, прегледайте ресурсите, изброени от `azd down` преди потвърждение: те изтриват ресурсната група и всичко в нея.

За **повторно използван проект**, `azd down` оставя проекта, hosted агент и други ресурси на място. Премахнете само нежелани ресурси, които притежавате, с помощта на [бързо ръководство за почистване](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); не изтривайте споделена ресурсна група, за да почистите една задача.

**Проверка на завършване:** Обяснете кои настройки контролират локалното и облачно поведение, покажете локални и разположени отговори, прегледайте резултат от оценка и идентифицирайте кои ресурси остават след почистване.

### По избор: Скеле със умението Microsoft Foundry

Инсталирайте [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) за хоста на кода на вашия агент, след което отворете отделна празна папка. Помолете го да изгради базовия Python Agent Framework Responses API пример в режим на разгръщане на код, да обясни генерирания `azure.yaml` и да предложи абонамент, регион, проект и разгръщане на модел. Изискайте одобрение **преди създаването на Azure ресурси**, поискайте локален тест и спрете преди разгръщане. Прегледайте резултата и продължете със стъпките за разгръщане по-горе само когато сте готови.

За съществуващи проекти, `--template`/`-t` заменя остарялото изписване `--manifest`/`-m`; смяната на флага не мигрира наследени манифести или вложена конфигурация на агент. Вижте [AI CLI справката](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Разгръщане с една команда

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Разгръщане специфично за среди

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

Това осигурява ресурс Insights, а не инструментариум за телеметрия. След като вашето приложение издава изходящи обхвати за повиквания на модел, изпълнете този илюстративен заявка в Application Insights Logs (адаптирайте филтъра към реалните имена на вашите обхвати):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Мониторинг на разходите

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

Използвайте реален получател и проверете разрешенията за обхвата на таксуване. Бюджетът изпраща предупреждения; той не е лимит за разходите.

## 🔐 Най-добри практики за сигурност

### Конфигуриране на управлявана самоличност

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

Този фрагмент на крайна точка се нуждае също от частна DNS зона/група, връзки с VNet, приложна връзка към VNet и изрична политика за публичен достъп. Самото създаване на частна крайна точка не деактивира публичния достъп.

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

Azure Cache за Redis Basic/Standard/Premium е на път към [пенсиониране](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); използвайте Azure Managed Redis за нови разгръщания и следвайте актуалните указания за шаблони/автентикация. Ограничете кешираните AI отговори според упълномощението, модела/инструкциите и версията на данните, с изтичане на валидност; никога не споделяйте лични отговори, използвайки само текста на заявката.

### Конфигуриране на авторазгъване

**Частичен ресурс:** обединете тези настройки за скалиране/вход в пълно приложение за контейнери с управлявана среда, контейнерно изображение и лимити за ресурси. Повече реплики не увеличават квотата на модела.

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

### Проблем 1: Превишена квота за OpenAI

**Симптоми:**
- Разгръщането се проваля с грешки за квота
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

Променливата capacity по-горе важи само за потребителски шаблон, който я обвързва за използване. За примера RAG използвайте `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Не променяйте `AZURE_LOCATION` за преместване на съществуващи ресурси на място; създайте отделна среда за нов регион и планирайте миграция/почистване.

### Проблем 2: Грешки при удостоверяване

**Симптоми:**
- 401/403 грешки при повикване на AI услуги
- Съобщения „Достъпът е отказан“

**Решения:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Проблем 3: Проблеми с разгръщането на модел

**Симптоми:**
- Моделите не са налични в разгръщането
- Някои конкретни версии на моделите не работят

**Решения:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Примерни шаблони

Това са алтернативи, а не последователни команди. Започнете всяка в отделна празна директория. Явната дестинация `.` пази инициализацията във вашата текуща директория; в противен случай текущият AZD може да създаде поддиректория със същото име като шаблона без да променя работната директория на терминала ви.

### RAG чат приложение (Python)

**Хранилище**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Услуги**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Описание**: Референтно приложение за RAG чат за въпроси върху вашите документи с извличане чрез Azure AI Search. Прегледайте поддържаните модели на настоящия пример, допълнителните функции, насоки за разходи и указания за пускане в продукция преди употреба; разгръщането на примерен код не прави приложението готово за продукция.

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG чат приложение (.NET)

**Хранилище**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Услуги**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Описание**: .NET/C# еквивалент на Python примера за RAG чат. Изграден с ASP.NET Core Minimal API и Blazor WebAssembly фронтенд. Включва гласов чат, поддръжка на GPT-4o-mini Vision и придружаващ .NET MAUI Blazor Hybrid клиент за настолен и мобилен компютър.

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG чат приложение (Java)

**Хранилище**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Услуги**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Описание**: Java версия на RAG чат пример, използваща Langchain4J за оркестрация на ИИ. Поддържа архитектура с микросервизи, задвижвана от събития, множество стратегии за търсене (текст, вектор, хибрид), качване на документи с Azure Document Intelligence и разгръщане върху Azure Container Apps или Azure Kubernetes Service.

**Бърз старт**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot с Microsoft Foundry

**Хранилище**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Услуги**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Описание**: Край до край търговски RAG копилот с Microsoft Foundry и Prompty. Чатбот на Contoso Outdoor retailer, който основава отговорите си на каталог продукти и данни за поръчки на клиенти. Демонстрира пълния GenAIOps работен процес — прототипиране с Prompty, оценка с помощта на ИИ, след което разгръщане чрез AZD към Container Apps.

**Бърз старт**:
```bash
azd init --template contoso-chat .
azd up
```

### Приложение с множество агенти за креативно писане

**Хранилище**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Услуги**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Описание**: Мултиагентен пример, демонстриращ оркестрация на AI агенти с Prompty. Използва изследователски агент (Bing Grounding в Azure AI Agent Service), продуктов агент (Azure AI Search), писател и редактор за съвместно създаване на добре проучени статии. Включва CI/CD с оценка в GitHub Actions.

**Бърз старт**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG чат (JavaScript/TypeScript)

**Хранилище**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Услуги**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB за NoSQL + LangChain.js

**Описание**: Изцяло сървърно свободен RAG чатбот, използващ LangChain.js с Azure Functions за API и Azure Static Web Apps за хостинг. Използва Azure Cosmos DB и като векторно хранилище, и като база данни за чат история. Поддържа локална разработка с Ollama за тестване без разходи.

**Бърз старт**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat with Your Data Solution Accelerator

**Хранилище**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Услуги**: Microsoft Foundry + Azure Container Apps (уеб/API/ингестия) + Azure AI Search с Cosmos DB, или PostgreSQL с pgvector

**Описание**: Акселератор за чат, основан на документи, с цитиране. Настоящият пример хоства React фронтенд, FastAPI бекенд и Functions worker за инжестия в Container Apps; опциите за оркестратор са Agent Framework и LangGraph. Опциите за база данни/извличане се избират при разгръщането. Това е отправна точка, не готова продукционна система; не приемайте, че по-старите варианти на App Service, Semantic Kernel или Prompt Flow описват текущите настройки по подразбиране.

**Бърз старт**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI агенти за пътуване — мултиагентна MCP оркестрация

**Хранилище**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Услуги**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP сървъри (.NET, Python, Java, TypeScript)

**Описание**: Референтно приложение за мултиагентна ИИ оркестрация с три рамки (LangChain.js, LlamaIndex.TS и Microsoft Agent Framework). Включва MCP (Model Context Protocol) сървъри на четири езика, разгръщани като сървърно безплатни Azure Container Apps с мониторинг OpenTelemetry.

**Бърз старт**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Разгледайте още шаблони**: Посетете [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) за наличните в момента шаблони на различни езици и сценарии. Всеки свързан пример е външно хранилище, а не локален пример, предоставен от този курс; проверете текущите му изисквания и насоки за продукция преди разгръщане.

## Следващи стъпки

1. **Опитайте примерите**: Започнете с предварително изграден шаблон, който съответства на вашия случай на употреба
2. **Персонализирайте според нуждите си**: Модифицирайте инфраструктурата и кода на приложението
3. **Добавете мониторинг**: Внедрете цялостна наблюдаемост
4. **Оптимизирайте разходите**: Настройте конфигурациите към бюджета си
5. **Осигурете разгръщането си**: Внедрете корпоративни модели за сигурност
6. **Разширете за продукция**: Добавете характеристики за мултирегионално и високо налично обслужване

## 🎯 Практически упражнения

### Упражнение 1: Разгръщане на приложение за чат с Microsoft Foundry Models (30 минути)
**Цел**: Разгръщане и тестване на референтно AI чат приложение

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

**Критерии за успех:**
- [ ] Разгръщането се завършва без грешки за квота
- [ ] Може да се достъпи чат интерфейс в браузър
- [ ] Може да се задават въпроси и получават AI-генерирани отговори
- [ ] Application Insights показва телеметрични данни
- [ ] Успешно почистване на ресурсите

**Разходи:** Прегледайте текущото ръководство за разходите и избраните SKU-та преди разгръщане. Таксуването продължава, докато ресурсите не бъдат изтрити; няма фиксирана 30-минутна оценка, валидна за всяка конфигурация.

### Упражнение 2: Конфигуриране на разгръщане с няколко модела (45 минути)
**Цел**: Разгръщане на няколко AI модела с различни конфигурации

**Начална точка:** Съществуващ акаунт Azure OpenAI и AZD модул за ресурсна група, който може да извиква този файл. Създайте `infra/ai-models.bicep` със следното съдържание, използвайки вашия редактор. Той не се разгръща автоматично само защото е под `infra/`.

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

От модула с обхват ресурсна група, притежаващ акаунта, добавете извикване на модул (адаптирайте името на символа към вашия акаунт):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Не декларирайте същите разгръщания и в двата модула. Ако входната точка на AZD е с обхват абонамент, извикайте го от неговия модул с обхват ресурсна група и коригирайте относителния път. Постройте съдържащия модул с `az bicep build --file <path-to-containing-module>`, след което:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Критерии за успех:**
- [ ] Успешно разгръщане на няколко модела
- [ ] Прилагане на различни настройки за капацитет
- [ ] Достъпност на моделите чрез API
- [ ] Могат да се извикват и двата модела от приложението

### Упражнение 3: Внедряване на мониторинг на разходите (20 минути)
**Цел**: Настройте бюджетни предупреждения и проследяване на разходите

**Начална точка:** Горепосоченият бюджетен шаблон и инфраструктурен модул с обхват ресурсна група. Добавете този ресурс чрез редактора си; преминете `budgetStartDate` от вашата параметрична карта (не дублирайте параметъра, ако вече е деклариран). Заменете получателя и се уверете, че имате писателски достъп до бюджета.

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

Очаквано: отговорът съдържа `amount: 200`, двата прагa и вашия получател. Проверете Cost Management в портала за реални такси; данните за разходите са забавени и предупреждението може да не се активира по време на кратко упражнение.

**Критерии за успех:**
- [ ] Създадено е бюджетно предупреждение в Azure
- [ ] Конфигурирани са имейл известия
- [ ] Можете да преглеждате данни за разходите в Azure портала
- [ ] Настроени са подходящо прагове за бюджета

## 💡 Често задавани въпроси

<details>
<summary><strong>Как мога да намаля разходите за Microsoft Foundry Models по време на разработка?</strong></summary>

1. **Проверете ценообразуването**: Няма универсален месечен безплатен лимит от 50 000 токена за Azure OpenAI модели
2. **Настройте капацитета подходящо**: Капацитет `10` обикновено представлява 10 000 TPM за тези Standard текстови модели, а не 10 TPM. Намаляването на лимита на скоростта не намалява цените на токените
3. **Използвайте azd down**: Изтрийте временни ресурси, когато не разработвате активно (това не е деалокация)
4. **Кеширайте отговорите**: Внедрете Redis кеш за повторни заявки
5. **Използвайте Prompt Engineering**: Намалете използването на токени с ефективни заявки

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
- Корпоративна сигурност и съвместимост
- Интеграция с частна мрежа
- Гаранции за SLA
- Автентикация чрез управлявана самоличност
- Налични по-високи квоти

**OpenAI API**: Отделен доставчик/API с различна наличност на модели, ценообразуване, автентикация и опции за корпоративна свързаност. Сравнявайте актуалните предложения, а не приемайте, че е само публично-интернет или винаги пуска модели първо.

Изберете според изискванията на вашата организация; специфичните за Azure управлявани самоличности и частните линкове, посочени в този курс, са приложими за услуги, хоствани в Azure, а не за всеки модел/доставчик във Foundry каталога.
</details>

<details>
<summary><strong>Как да се справя с грешки за превишена квота в Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Мога ли да използвам свои данни с Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Как да защитя крайни точки на AI модели?</strong></summary>

**Най-добри практики**:
1. Използвайте управлявана идентичност (без API ключове)
2. Активирайте частни крайни точки
3. Конфигурирайте мрежови групи за сигурност
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

## Общество и поддръжка

- **Microsoft Foundry Discord**: [#Azure канал](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Проблеми и дискусии](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Официална документация](https://learn.microsoft.com/azure/ai-studio/)
- **Умения за агент**: [Microsoft Foundry умение в skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Инсталирайте умения за Azure + Foundry агенти в редактора си с `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация в глава:**
- **📚 Начална страница на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 2 - AI-първо разработване
- **⬅️ Предишна глава**: [Глава 1: Вашият първи проект](../chapter-01-foundation/first-project.md)
- **➡️ Следваща**: [AI агенти](agents.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

**Нуждаете се от помощ?** Присъединете се към дискусиите в нашата общност или отворете проблем в хранилището. Общността на Azure AI + AZD е тук, за да ви помогне да успеете!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->