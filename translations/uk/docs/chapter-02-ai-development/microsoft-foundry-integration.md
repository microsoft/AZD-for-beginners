# Інтеграція Microsoft Foundry з AZD

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка AI-First
- **⬅️ Попередній розділ**: [Розділ 1: Ваш перший проект](../chapter-01-foundation/first-project.md)
- **➡️ Наступний**: [AI агенти](agents.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

## Огляд

У цьому посібнику показано, як інтегрувати сервіси Microsoft Foundry з Azure Developer CLI (AZD) для оптимізованого розгортання AI-додатків. Microsoft Foundry надає комплексну платформу для створення, розгортання та управління AI-додатками, у той час як AZD спрощує процес інфраструктури та розгортання.

## Що таке Microsoft Foundry?

Microsoft Foundry — це уніфікована платформа Microsoft для розробки AI, яка включає:

- **Каталог моделей**: Доступ до передових AI-моделей
- **Prompt Flow**: Візуальний конструктор AI-робочих процесів
- **Портал Microsoft Foundry**: Інтегроване середовище розробки AI-додатків
- **Опції розгортання**: Різноманітні варіанти хостингу та масштабування
- **Безпека**: Вбудовані функції відповідального AI

## AZD + Microsoft Foundry: Краще разом

| Функція | Microsoft Foundry | Переваги інтеграції AZD |
|---------|-----------------|------------------------|
| **Розгортання моделей** | Ручне розгортання через портал | Автоматизовані, повторювані розгортання |
| **Інфраструктура** | Конфігурація проєкту та ресурсів | Початок з `azure.yaml`; вивантаження Bicep або Terraform за потребою |
| **Управління середовищами** | Фокус на одному середовищі | Багатосередовищний (розробка/тестування/продакшн) |
| **Інтеграція CI/CD** | Сервіси розгортання та оцінки | Повторне використання конфігурацій у GitHub Actions або Azure DevOps |
| **Управління витратами** | Базовий моніторинг | Оптимізація витрат за середовищами |

## Попередні вимоги

- Підписка Azure з відповідними дозволами
- Azure Developer CLI 1.37.0 або новіший для GA Foundry workflow
- Доступ до сервісів Microsoft Foundry Models
- Базове знайомство з Microsoft Foundry

> **Оновлення Foundry GA (2026-11-09):** Пакет розширень `microsoft.foundry` досяг версії 1.0 і загальної доступності [5 листопада 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Далі наведений посібник йде відповідно до цього оголошення та пов’язаного швидкого старту Microsoft Learn. Це огляд документації, а не перевірка розгортання в реальному часі. Опціональні попередні функції та незалежно випущені розширення зберігають свій власний статус релізу.

**Очікувані результати навчання:** Встановити пакет GA, переглянути `azure.yaml` агента, порівняти локальні та розгорнуті відповіді, пояснити межі оцінки, CI/CD та очистки. Для покрокового розгортання агента дивіться [hosted-agent walkthrough](#hosted-agent-walkthrough-ga). Фрагменти ресурсів нижче охоплюють інші шаблони інтеграції.

## Основні шаблони інтеграції

**Сфера прикладів:** Bicep нижче містить ілюстративні фрагменти ресурсів, а не повний шаблон для розгортання. Контейнерний шаблон має визначати імена, `location`, посилання на ресурси, ідентичності, вихідні дані та хостинг додатку. Використовуйте пов’язаний приклад як стартову точку для запуску. Bash-приклади вимагають окремої автентифікації Azure CLI, відмінної від `azd auth login`.

### Шаблон 1: Інтеграція Microsoft Foundry Models

**Випадок використання**: Розгортання чат-додатків з моделями Azure OpenAI у Microsoft Foundry

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

**Інфраструктура (main.bicep):**
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

Користувачеві потрібна підключена керована ідентичність та `Cognitive Services OpenAI User` на рівні облікового запису; відключення ключів не надає доступу. Перевірте регіон/модель/SKU та квоту перед розгортанням.

### Шаблон 2: Інтеграція AI Search + RAG

**Випадок використання**: Розгортання додатків з генерацією, підсиленою пошуком (RAG)

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

Інтеграції без `Microsoft.Search/searchServices/dataConnections` ARM ресурсу не існує. Налаштуйте індекс пошуку, джерело даних, індексатор/набір навичок або векторизатор через підтримувані API даних Search. Якщо Search викликає модель для вбудовування, увімкніть її керовану ідентичність, надайте відповідну роль моделі та налаштуйте її навичку/векторизатор. Дивіться [інтегровану векторизацію](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Шаблон 3: Інтеграція Document Intelligence

**Випадок використання**: Робочі процеси обробки та аналізу документів

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

## 🔧 Шаблони конфігурації

### Налаштування змінних середовища

Окрім задокументованих налаштувань AZD, таких як `AZURE_LOCATION`, це **імена вхідних параметрів користувацького шаблону**. Вони не мають ефекту, якщо шаблон/додаток не використовують їх через параметри та відображення хост-середовища. Для `azure-search-openai-demo` використовуйте його фактичні імена, наприклад, `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` та `AZURE_SEARCH_SERVICE_SKU`. Ємність моделі не відповідає SKU облікового запису.

**Конфігурація для Production:**
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

**Конфігурація для Development:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Безпечна конфігурація з Key Vault

Віддавайте перевагу Entra ID з вимкненою локальною автентифікацією ключів. Наступне — це лише **альтернативний спадковий метод автентифікації за допомогою ключів** для додатків, які вимагають ключі: він вимагає облікового запису з увімкненою автентифікацією ключів, підключеної ідентичності додатку до хоста та налаштованого доступу/мережі Key Vault. Не комбінуйте отримання ключа з `disableLocalAuth: true` і не очікуйте, що виклики за ключем працюватимуть.

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

## Робочі процеси розгортання

### Розширення AZD для Foundry

Для GA workflow встановіть пакет `microsoft.foundry` замість складання основних розширень по одному:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Пакет встановлює агентів, підключення, інспектор, проєкти, рутини, навички та інструментальні бокси. Він не додає групу команд `microsoft.foundry`. Оцінки, набори даних, уточнення та користувацькі моделі встановлюються окремо, коли це потрібно. Дивіться [довідкову документацію по упаковці розширень](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Покроковий посібник для Hosted-Agent (GA)

**Hosted agent** запускає ваш код агента на обчислювальних ресурсах, керованих Foundry. Це вправа використовує приклад API Responses базового фреймворку Python Agent Framework, а не класичні фрагменти Agent Service SDK з інших уроків.

#### 1. Підготуйте і ініціалізуйте

Використовуйте порожню директорію поза цим репозиторієм курсу. Встановіть Python 3.13 або новіший та актуальний [реліз uv](https://docs.astral.sh/uv/getting-started/installation/). Окремі установки uv можуть використовувати `uv self update`. Перед створенням перевірте [права hosted-agent](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), доступність моделей та квоти у вашій підписці та регіоні. Виклики ресурсів Azure та локальні виклики моделей тарифікуються.

Завершіть встановлення `azd auth login` і пакету вище. Локальний приклад коду використовує `DefaultAzureCredential`; якщо ви застосовуєте облікові дані Azure CLI, увійдіть через `az login` під тим самим обліковим записом і орендодавцем, що і AZD. Вхід через AZD сам по собі не означає вхід у Azure CLI.

Запустіть цю однорядкову команду в Bash або PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Оберіть новий або існуючий проект Foundry та потрібну підписку і регіон. Для повторного використання розгортання моделі додайте `--model-deployment <existing-deployment-name>` у команду ініціалізації **перед її запуском** і виберіть існуючий проєкт. Залишайтеся в директорії з генерованим `azure.yaml` для подальших команд.

#### 2. Перегляньте визначення розгортання

Відкрийте `azure.yaml` та знайдіть ці налаштування в [прикладі upstream](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Налаштування | Що перевірити |
|---------|---------------|
| `host: azure.ai.project` та `deployments` | Запланований проєкт Foundry, ім’я моделі, версія, SKU розгортання і потужність |
| `host: azure.ai.agent` та `project` | Hosted agent і директорія з його вихідним кодом |
| `codeConfiguration` | Python середовище виконання та точка входу; проаналізований приклад використовує `python_3_13` і `main.py` |
| `uses` | Залежність від сервісу проєкту Foundry |
| `container.resources` | Виділення ЦП і пам’яті, хоч код виконується віддалено |
| `env` | Відображення розгортання моделі і `PYTHONNOUSERSITE: "1"` для відключення завантаження пакетів користувацького сайту |
| `infra.provider` | `microsoft.foundry`, який синтезує потрібну інфраструктуру |

Зафіксуйте разом перевірений `azure.yaml` і код агента. Для початку рукописна інфраструктура не потрібна; коли потрібні редаговані файли постачання, слідуйте за [вивантаженням інфраструктури](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) для Bicep або Terraform і продовжуйте користуватись `azd provision`. Не фіксуйте облікові дані або стан середовища `.azure/`.

#### 3. Створіть і протестуйте локально

```bash
azd provision
azd ai agent run
```

Процес створення може створити відсутні розгортання моделей **навіть у повторно використаному проєкті**. Перегляньте підказки моделі і оберіть доступний тип розгортання онлайн, наприклад Global Standard або Data Zone Standard; квоти та регіональна підтримка варіюються.

Локальний запуск готує залежності і відкриває **Agent Inspector**, де можна переглядати запити, відповіді та активність інструментів/моделей. Тримайте вікно відкритим і відкрийте другий термінал у тій же директорії проєкту:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Перевірка:** Переконайтеся, що отримуєте релевантну відповідь і можете переглядати відповідні локальні події. Локальне виконання досі викликає ваше Azure модельне розгортання; це не офлайн чи безкоштовний тест. Використовуйте синтетичні підказки і уникайте розкриття секретів чи чутливих даних у виводі інспектора.

#### 4. Розгорніть і порівняйте

Завершіть локальний запуск Ctrl+C. Перед віддаленим викликом налаштуйте або перевірте [підключення Application Insights та доступ для читання трас](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing).

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

У режимі розгортання коду AZD завантажує вихідний код для віддаленого складання Foundry; локальна збірка контейнера для цього шляху не потрібна. Вивід розгортання надає посилання на середовище і кінцеву точку. Перевірте відповідь від розгорнутого агента та його хмарний трейс; лише локальні події інспектора не доводять роботу хмарного трасування.

Для подальших змін ознайомтеся з підтримуваною конфігурацією hosted-agent через `azd deploy --preview`. Стрімуйте логи за допомогою `azd ai agent monitor --follow` або діагностуйте налаштування та проблеми доступу з `azd ai agent doctor`. Перегляд розгортання не є повним оглядом інфраструктури чи безпеки.

#### 5. Додайте повторювану перевірку якості

Встановіть окремо випущене розширення оцінок, потім створіть проєкти тестування:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Опишіть намір поведінки агента і виберіть **Dataset and evaluator**, потім **Turn**. Перегляньте і відредагуйте згенеровані кейси і шкалу оцінювання, включно з кейсом для непідтримуваних питань, перш ніж налаштувати оцінювання:

```bash
azd ai eval init --name quality
```

Виберіть переглянуті набір даних і шкалу, підтвердіть розгортання моделі судді. Перегляньте `evals/azure.eval.yaml` і посилання на сервіс оцінки у `azure.yaml`, потім зареєструйте ресурси і виконайте:

```bash
azd up
azd ai eval run start --eval quality
```

Перегляньте бали і кейси з помилками чи з непроходженням; завершене оцінювання не означає автоматично проходження якості. Генерація та оцінка також викликають витрати на моделі. Зафіксуйте неконфіденційні конфігурації, набори даних і шкали, щоб колеги могли порівнювати зміни. `azd ai agent optimize` може повторно використовувати сумісне оцінювання як базу, але перевірте кандидатів перед явним розгортанням. Дивіться [якісні ворота та міграцію](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) для старіших проєктів і CI.

#### 6. Повторно використовуйте робочий процес у CI/CD

Після успішного `azd up` запустіть `azd pipeline config` і перегляньте згенерований GitHub Actions або Azure DevOps workflow. Встановіть `microsoft.foundry` на runner, а також `azure.ai.evaluations`, якщо виконуєте оцінки. Зберігайте згенеровані налаштування checkout, вхід в систему та середовища; встановлення саме по собі не автентифікує конвеєр.

Використовуйте окреме середовище AZD для кожного етапу, надайте ідентичності конвеєра потрібні дозволи на ресурси та Foundry, зберігайте облікові дані у секретах конвеєра або застосовуйте федеративну ідентичність. Зафіксуйте ресурси оцінювання і перевірте, що ідентичність має доступ до зв’язаних наборів даних/оцінювачів. Дивіться [приклад pipeline курсу](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) та [посібник Foundry CI/CD](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Уважно очистіть

Для **нового проєкту, створеного цим середовищем**, перегляньте ресурси, перелічені `azd down` перед підтвердженням: це видаляє групу ресурсів і все, що в ній є.

Для **перевикористовуваного проекту**, `azd down` залишає проект, розміщеного агента та інші ресурси на місці. Видаляйте лише небажані ресурси, які вам належать, використовуючи [інструкції швидкого очищення](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); не видаляйте спільну групу ресурсів для очищення одного завдання.

**Перевірка завершення:** Поясніть, які налаштування керують локальною і хмарною поведінкою, покажіть локальні та розгорнуті відповіді, перегляньте результат оцінки та визначте, які ресурси залишилися після очищення.

### Необов’язково: Створення каркасу за допомогою Microsoft Foundry Skill

Встановіть [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) для вашого хоста кодувального агента, потім відкрийте окрему пусту папку. Попросіть його згенерувати базовий приклад Python Agent Framework Responses API у режимі розгортання коду, пояснити створений `azure.yaml` та запропонувати підписку, регіон, проект і розгортання моделі. Вимагайте схвалення **перед створенням ресурсів Azure**, запросіть локальне тестування та зупиніться перед розгортанням. Перегляньте його результат і продовжуйте кроки розгортання вище лише коли будете готові.

Для існуючих проєктів `--template`/`-t` замінює застаріле написання `--manifest`/`-m`; зміна прапорця не переносить застарілі маніфести або вкладену конфігурацію агента. Див. [довідку AI CLI](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Розгортання однією командою

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Розгортання за конкретним середовищем

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

## Моніторинг та спостережуваність

### Інтеграція Application Insights

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

Це створює ресурс Insights, а не інструментування телеметрії. Коли ваш додаток почне генерувати зовнішні інтервали виклику моделей, запустіть цей приклад запиту в журналах Application Insights (адаптуйте фільтр до ваших фактичних імен інтервалів):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Моніторинг витрат

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

Використовуйте реального отримувача та перевірте права доступу до області виставлення рахунків. Бюджет надсилає сповіщення; це не ліміт витрат.

## 🔐 Кращі практики безпеки

### Конфігурація керованої ідентичності

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

### Мережева безпека

Цей фрагмент кінцевої точки також потребує приватної зони/групи DNS, посилань VNet, підключення додатків до VNet і явної політики публічного доступу. Створення лише приватної кінцевої точки не вимикає публічний доступ.

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

## Оптимізація продуктивності

### Стратегії кешування

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

Azure Cache for Redis Basic/Standard/Premium знаходиться на [шляху виведення з експлуатації](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); використовуйтесь Azure Managed Redis для нових розгортань і дотримуйтесь його поточних рекомендацій по шаблонах/автентифікації. Кешуйте відповіді AI, враховуючи авторизацію, модель/інструкції та версію даних з терміном дії; ніколи не діліться приватними відповідями, використовуючи лише текст запиту.

### Конфігурація автозмасштабування

**Частковий ресурс:** об’єднайте ці параметри масштабування/вхідного трафіку у повний Container App з керованим середовищем, образом контейнера та обмеженнями ресурсів. Більше реплік не збільшує квоту моделі.

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

## Усунення поширених проблем

### Проблема 1: Перевищено квоту OpenAI

**Симптоми:**
- Розгортання не вдається через помилки квоти
- Помилки 429 у журналах додатка

**Рішення:**
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

Змінна capacity вище застосовується лише до користувацького шаблону, налаштованого на її використання. Для зразка RAG використовуйте `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Не змінюйте `AZURE_LOCATION` для переміщення існуючих ресурсів; створіть окреме середовище для нового регіону та плануйте міграцію/очищення.

### Проблема 2: Помилки автентифікації

**Симптоми:**
- Помилки 401/403 при виклику AI-сервісів
- Повідомлення "Доступ заборонено"

**Рішення:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Проблема 3: Проблеми з розгортанням моделі

**Симптоми:**
- Моделі недоступні в розгортанні
- Помилки із конкретними версіями моделей

**Рішення:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Приклади шаблонів

Це альтернативи, а не послідовні команди. Починайте кожну в окремій порожній теці. Явний варіант `.` залишає ініціалізацію у вашій поточній теці; в іншому випадку поточний AZD може створити дочірню теку з назвою шаблону без зміни робочої теки вашої оболонки.

### Додаток RAG Chat (Python)

**Репозиторій**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Сервіси**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Опис**: Еталонний додаток для RAG-чату з питаннями по ваших документах, із пошуком Azure AI Search. Ознайомтеся з підтримуваними моделями зразка, додатковими функціями, рекомендаціями щодо вартості та підготовкою до виробництва; розгортання зразка не робить додаток готовим до виробничого використання.

**Швидкий старт**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Додаток RAG Chat (.NET)

**Репозиторій**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Сервіси**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Опис**: Еквівалент Python-зразка RAG Chat на .NET/C#. Побудований на ASP.NET Core Minimal API та фронтенді Blazor WebAssembly. Включає голосовий чат, підтримку GPT-4o-mini vision і клієнт .NET MAUI Blazor Hybrid для настільних і мобільних пристроїв.

**Швидкий старт**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Додаток RAG Chat (Java)

**Репозиторій**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Сервіси**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Опис**: Версія RAG Chat на Java з використанням Langchain4J для оркестрації AI. Підтримує подієво-орієнтовану архітектуру мікросервісів, кілька стратегій пошуку (текст, вектор, гібрид), завантаження документів з Azure Document Intelligence, і розгортання на Azure Container Apps або Azure Kubernetes Service.

**Швидкий старт**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Корпоративний рітейл Копілайт з Microsoft Foundry

**Репозиторій**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Сервіси**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Опис**: Кінцевий RAG-копілайт для рітейлу з Microsoft Foundry та Prompty. Чатбот контексту Contoso Outdoor, який базує відповіді на каталозі продуктів і даних замовлень клієнтів. Демонструє повний робочий процес GenAIOps — прототипування з Prompty, оцінка за допомогою AI-помічників, розгортання через AZD у Container Apps.

**Швидкий старт**:
```bash
azd init --template contoso-chat .
azd up
```

### Мультиагентський додаток для творчого письма

**Репозиторій**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Сервіси**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Опис**: Мультиагентський зразок, який демонструє оркестрацію AI агентів з Prompty. Використовує агента-дослідника (Bing Grounding в Azure AI Agent Service), агента продукту (Azure AI Search), агента письменника та агента редактора для спільного створення добре досліджених статей. Включає CI/CD з оцінкою в GitHub Actions.

**Швидкий старт**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Безсерверний RAG Chat (JavaScript/TypeScript)

**Репозиторій**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Сервіси**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB для NoSQL + LangChain.js

**Опис**: Повністю безсерверний RAG чатбот з використанням LangChain.js, Azure Functions для API та Azure Static Web Apps для хостингу. Використовує Azure Cosmos DB як векторне сховище та базу даних історії чатів. Підтримує локальну розробку з Ollama для безкоштовного тестування.

**Швидкий старт**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Розв’язок Chat with Your Data Solution Accelerator

**Репозиторій**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Сервіси**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search з Cosmos DB, або PostgreSQL з pgvector

**Опис**: Акселератор чатів з опорою на документи з посиланнями. Поточний зразок розміщує фронтенд на React, бекенд FastAPI і робітника ingestion на Functions у Container Apps; варіанти оркестрації — Agent Framework і LangGraph. Варіанти бази даних/пошуку обираються під час розгортання. Це вихідна точка, а не готова до виробництва система; не припускайте, що старі варіанти App Service, Semantic Kernel або Prompt Flow описують актуальні налаштування за замовчуванням.

**Швидкий старт**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI Travel Agents — Мультиагентна MCP оркестрація

**Репозиторій**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Сервіси**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Опис**: Еталонний додаток для мультиагентної AI оркестрації із трьома фреймворками (LangChain.js, LlamaIndex.TS, Microsoft Agent Framework). Має MCP (Model Context Protocol) сервери на чотирьох мовах, розгорнуті як безсерверні Azure Container Apps з моніторингом OpenTelemetry.

**Швидкий старт**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Перегляньте більше шаблонів**: Відвідайте [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) для актуальних шаблонів різними мовами та для різних сценаріїв. Кожен наведенний приклад є зовнішнім репозиторієм, а не локальним прикладом цього курсу; перед розгортанням перевіряйте поточні вимоги та рекомендації для виробництва.

## Наступні кроки

1. **Спробуйте приклади**: Почніть із готового шаблона, що відповідає вашій задачі
2. **Налаштуйте під свої потреби**: Модифікуйте інфраструктуру і код додатка
3. **Додайте моніторинг**: Реалізуйте повну спостережуваність
4. **Оптимізуйте витрати**: Налаштуйте параметри під бюджет
5. **Забезпечте безпеку розгортання**: Використайте корпоративні патерни безпеки
6. **Масштабуйте до виробництва**: Додайте багаторегіональні та високодоступні функції

## 🎯 Практичні вправи

### Вправа 1: Розгорнути чат-додаток Microsoft Foundry Models (30 хвилин)
**Мета**: Розгорнути та протестувати еталонний AI чат-додаток

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

**Критерії успіху:**
- [ ] Розгортання завершене без помилок квоти
- [ ] Доступ до інтерфейсу чату в браузері
- [ ] Можливість ставити питання та отримувати відповіді з AI
- [ ] Application Insights показує дані телеметрії
- [ ] Успішне очищення ресурсів

**Вартість:** Ознайомтеся з поточним гідом за вартістю зразка та обраними SKU перед розгортанням. Оплата триває, поки ресурси існують; фіксованої 30-хвилинної оцінки для кожної конфігурації немає.

### Вправа 2: Налаштування розгортання кількох моделей (45 хвилин)
**Мета**: Розгорнути кілька AI моделей з різними конфігураціями

**Початковий пункт:** Існуючий обліковий запис Azure OpenAI і модуль ресурсу групи AZD, що може викликати цей файл. Створіть `infra/ai-models.bicep` з таким вмістом у вашому редакторі. Він не розгортається автоматично тільки тому, що знаходиться під `infra/`.

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

З модуля, який керує групою ресурсів облікового запису, додайте виклик модуля (адаптуйте назву символу до вашого облікового запису):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Не оголошуйте одні й ті ж розгортання в обох модулях. Якщо точка входу AZD має область підписки, викликайте цей модуль з дочірнього модуля в області групи ресурсів і налаштовуйте відносний шлях. Побудуйте цей модуль із `az bicep build --file <path-to-containing-module>`, потім:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Критерії успіху:**
- [ ] Кілька моделей успішно розгорнуті
- [ ] Застосовані різні налаштування capacity
- [ ] Моделі доступні через API
- [ ] Можна викликати обидві моделі з додатка

### Вправа 3: Реалізація моніторингу витрат (20 хвилин)
**Мета**: Налаштувати сповіщення за бюджетом і відстеження витрат

**Початковий пункт:** Шаблон бюджету вище і модуль інфраструктури для групи ресурсів. Додайте цей ресурс у вашому редакторі; передайте `budgetStartDate` з вашої мапи параметрів (не дублюйте параметр, якщо він вже оголошений). Замініть отримувача та підтвердіть, що маєте права на запис бюджету.

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

Очікується: у відповіді є `amount: 200`, обидва пороги та ваш отримувач. Перевірте розділ управління витратами в порталі для реальних нарахувань; дані про витрати затримуються, і під час короткої вправи сповіщення може не спрацювати.

**Критерії успіху:**
- [ ] Сповіщення бюджету створене в Azure
- [ ] Налаштовані email-сповіщення
- [ ] Дані про витрати видно в Azure Portal
- [ ] Пороги бюджету встановлені коректно

## 💡 Часті питання

<details>
<summary><strong>Як знизити витрати Microsoft Foundry Models під час розробки?</strong></summary>

1. **Перевірте ціни**: Універсального безкоштовного ліміту 50 000 токенів на місяць для моделей Azure OpenAI немає
2. **Обирайте відповідну ємність**: Параметр capacity `10` зазвичай відповідає 10 000 TPM для цих моделей Standard text, а не 10 TPM. Зменшення ліміту не знижує ціну за токен
3. **Використовуйте azd down**: Видаляйте тимчасові ресурси, коли активно не розробляєте (це не деалокація)
4. **Кешуйте відповіді**: Реалізуйте кеш Redis для повторних запитів
5. **Використовуйте Prompt Engineering**: Зменшуйте використання токенів за допомогою ефективних підказок

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>У чому різниця між Microsoft Foundry Models та OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Корпоративна безпека та відповідність
- Інтеграція з приватною мережею
- Гарантії SLA
- Аутентифікація за керованою ідентичністю
- Доступні більші квоти

**OpenAI API**: Окремий постачальник/API з власною доступністю моделей, цінами, автентифікацією та варіантами підключення для підприємств. Порівнюйте поточні пропозиції, а не припускайте, що це виключно публічний інтернет або що моделі завжди перші з’являються тут.

Вибирайте залежно від вимог вашої організації; приклади керованої ідентичності і приватного посилання в Azure з цього курсу застосовні до Azure-хостингованих сервісів, а не до кожної моделі/провайдера каталогу Foundry.
</details>

<details>
<summary><strong>Як обробляти помилки перевищення квоти Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Чи можу я використовувати власні дані з Microsoft Foundry Models?</strong></summary>

Так! Використовуйте **Azure AI Search** для RAG (Retrieval Augmented Generation):

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

Див. шаблон [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Як захистити кінцеві точки моделі ШІ?</strong></summary>

**Кращі практики**:
1. Використовуйте керовану ідентичність (без API ключів)
2. Увімкніть приватні кінцеві точки
3. Налаштуйте групи мережевої безпеки
4. Впровадьте обмеження швидкості
5. Використовуйте Azure Key Vault для секретів

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

## Спільнота та підтримка

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Проблеми та обговорення](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Офіційна документація](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Навички Microsoft Foundry на skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Встановіть навички агентів Azure + Foundry у вашому редакторі за допомогою `npx skills add microsoft/github-copilot-for-azure`

---

**Навігація по розділах:**
- **📚 Головна курсів**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка з пріоритетом на ШІ
- **⬅️ Попередній розділ**: [Розділ 1: Ваш перший проект](../chapter-01-foundation/first-project.md)
- **➡️ Наступний**: [Агенти ШІ](agents.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

**Потрібна допомога?** Приєднуйтесь до обговорень у спільноті або відкрийте проблему у репозиторії. Спільнота Azure AI + AZD тут, щоб допомогти вам досягти успіху!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->