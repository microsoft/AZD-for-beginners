# Лабораторія AI Workshop: Робимо Ваші AI-рішення AZD-Деплойними

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - AI-First розробка
- **⬅️ Попередній**: [Розгортання AI моделі](ai-model-deployment.md)
- **➡️ Наступний**: [Кращі практики виробничого AI](../chapter-08-production/production-ai-practices.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

## Огляд лабораторії

Ця практична лабораторія проводить розробників через процес використання наявного AI-шаблону та його розгортання за допомогою Azure Developer CLI (AZD). Ви дізнаєтеся основні шаблони для виробничих розгортань AI з використанням сервісів Microsoft Foundry.

> **Огляд релізу (2026-11-04):** Керівництво по командам AZD та приклади конфігурацій були перевірені відповідно до випуску `azd` `1.37.2` та поточної конфігурації зв'язаного прикладу. Це огляд документації, а не перевірка живого розгортання. Лабораторія RAG не вимагає розширення агента; для оцінки агента використовуйте окреме розширення `azure.ai.evaluations` та [поточний робочий процес оцінки](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), а не застарілі команди оцінки агента.

**Тривалість:** 2-3 години  
**Рівень:** Середній  
**Вимоги:** Базові знання Azure, ознайомлення з концепціями AI/ML

## 🎓 Цілі навчання

До кінця цієї лабораторії ви зможете:
- ✅ Дослідити наявний AI AZD-шаблон і спланувати конвертацію власного застосунку
- ✅ Налаштувати сервіси Microsoft Foundry за допомогою AZD
- ✅ Реалізувати безпечне управління обліковими даними для AI сервісів
- ✅ Деплоїти AI референсний додаток із моніторингом
- ✅ Виявляти та усувати поширені проблеми розгортання AI

## Вимоги

### Необхідні інструменти
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) встановлено
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) встановлено
- [Git](https://git-scm.com/) встановлено
- Редактор коду (рекомендується VS Code)

Ці блоки команд використовують синтаксис Bash (включно з продовженнями рядків і `grep`). У Windows використовуйте Git Bash/WSL або перекладіть їх на PowerShell. Також встановіть мову, менеджер пакетів і контейнери, перелічені у [локальному налаштуванні середовища зразка](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Ресурси Azure
- Підписка Azure з дозволами на створення ресурсів та призначення ролей (одного Contributor недостатньо для створення RBAC-призначень; використовуйте уповноваженого адміністратора ролей або еквівалент, задокументований у зразку)
- Доступ до служб Microsoft Foundry Models (або можливість запитати доступ)
- Права на створення груп ресурсів

### Попередні знання
- Базове розуміння сервісів Azure
- Знайомство з командним рядком
- Основні поняття в області AI/ML (API, моделі, запити)

## Налаштування лабораторії

### Крок 1: Підготовка середовища

1. **Перевірте встановлення інструментів:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

Якщо ви працюєте у кількох орендарях або ваша підписка не визначається автоматично, спробуйте знову з `azd auth login --tenant-id <tenant-id>`.

2. **Клонуйте репозиторій майстерні:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Модуль 1: Розуміння структури AZD для AI-додатків

### Анатомія AI-шаблону AZD

Ознайомтесь із ключовими файлами у AI-готовому шаблоні AZD:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

Перевірений зразок може змінюватись; `.azure/` з’являється після ініціалізації середовища, не обов’язково у свіжому клоні. Перевіряйте фактичний чек-аут, а не створюйте відсутні папки для відповідності цій схемі.

### **Лабораторне завдання 1.1: Ознайомлення з конфігурацією**

1. **Огляньте файл azure.yaml:**
```bash
cat azure.yaml
```

**На що звернути увагу:**
- Визначення сервісів для AI-компонентів
- Відповідності змінних середовища
- Конфігурації хостів

2. **Перегляньте основну інфраструктуру main.bicep:**
```bash
cat infra/main.bicep
```

**Ключові AI-шаблони для ідентифікації:**
- Провадження сервісу Microsoft Foundry Models
- Інтеграція Azure AI Search
- Безпечне керування ключами
- Конфігурації мережевої безпеки

### **Тема для обговорення:** Чому ці шаблони важливі для AI

- **Залежності сервісів**: AI-додатки часто потребують координації багатьох сервісів
- **Безпека**: API-ключі та кінцеві точки повинні керуватися безпечно
- **Масштабованість**: AI-навантаження мають унікальні вимоги до масштабування
- **Управління вартістю**: AI-сервіси можуть бути дорогими, якщо їх неправильно налаштовано

## Модуль 2: Розгортання першого AI-додатку

### Крок 2.1: Ініціалізація середовища

1. **Створіть нове середовище AZD:**
```bash
azd env new myai-workshop
```

2. **Встановіть необхідні параметри:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Крок 2.2: Розгортання інфраструктури та додатку

1. **Розгорніть за допомогою AZD:**
```bash
azd up
```

**Що відбувається під час `azd up`:**
- ✅ Проваджується сервіс Microsoft Foundry Models
- ✅ Створюється сервіс Azure AI Search
- ✅ Налаштовуються Azure Container Apps для бекенду і комплектованого фронтенду (поточний стандарт зразка)
- ✅ Конфігуруються мережа і безпека
- ✅ Розгортається код додатку
- ✅ Налагоджується моніторинг та логування

2. **Слідкуйте за ходом розгортання** і звертайте увагу на створювані ресурси.

### Крок 2.3: Перевірка розгортання

1. **Перевірте створені ресурси:**
```bash
azd show
```

2. **Відкрийте розгорнутий додаток:**
```bash
azd show
```

Відкрийте веб-адресу, показану у виводі `azd show`.

3. **Перевірте функціональність AI:**
   - Перейдіть на веб-застосунок
   - Спробуйте приклади запитів
   - Переконайтеся, що AI відповідає коректно

### **Лабораторне завдання 2.1: Практика усунення несправностей**

**Сценарій**: Розгортання пройшло успішно, але AI не відповідає.

**Поширені проблеми для перевірки:**
1. **Аутентифікація**: Перевірте керовану ідентичність і призначення ролей; API-ключі перевіряйте лише якщо спеціально увімкнули аутентифікацію на їх основі
2. **Наявність моделі**: Переконайтеся, що модель підтримується у вашому регіоні
3. **Мережева підключеність**: Переконайтеся, що сервіси можуть взаємодіяти
4. **Права RBAC**: Перевірте, чи додаток має доступ до OpenAI

**Команди для налагодження:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Модуль 3: Налаштування AI-додатків під ваші потреби

### Крок 3.1: Зміна конфігурації AI

1. **Оновіть модель OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Додайте додаткові AI-сервіси:**

Відредагуйте `infra/main.bicep` для додавання Document Intelligence:

Наступний фрагмент ілюстративний, а не повний шаблон. Зразок може вже проваджувати сервіси обробки документів: перевірте його поточну інфраструктуру перед додаванням дублікатів. Користувацькі доповнення потребують підключення виходів, ідентичностей і конфігурації додатку.

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Крок 3.2: Конфігурації, специфічні для середовища

**Краща практика**: Різні конфігурації для розробки та продакшену.

1. **Створіть продакшен-середовище:**
```bash
azd env new myai-production
```

2. **Встановіть параметри, специфічні для продакшену:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Ці імена взяті з [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) зразка. `azd env set` зберігає значення, але не робить довільну змінну ефективною: шаблон повинен її використовувати. Ознайомтесь із [керівництвом з ізоляції мережі](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) зразка перед вимкненням публічного доступу та використовуйте `azd up` для застосування змін інфраструктури. Лише SKU OpenAI `S0` не визначає пропускну здатність моделі; також важливі тип і потужність розгортання моделі.

### **Лабораторне завдання 3.1: Оптимізація вартості**

**Завдання:** Налаштуйте шаблон для економного розробництва.

**Задачі:**
1. Виберіть одноразове середовище майстерні: `azd env select myai-workshop`.
2. Зафіксуйте поточний Search SKU і ємність моделі з `infra/main.parameters.json` і вибраного середовища.
3. Використайте підтримувані вхідні дані нижче, після підтвердження квоти моделі/регіону:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Перевірте Search SKU і ємність розгортання у порталі та оцініть різницю за допомогою калькулятора цін. Не очікуйте негайного оновлення даних по білінгу.

**Критерії успіху:** Search використовує Basic, чат-розгортання має запитувану підтримувану ємність, і додаток все ще відповідає на прикладне питання. Ємність `10` – це ліміт швидкості, а не знижка на ціну за токен. Зміни рівня Search можуть бути обмеженими або вимагати повторного створення; не експериментуйте на продакшен-ресурсах. F0 є специфічним для сервісу і не є SKU моделі Azure OpenAI.

## Модуль 4: Безпека і кращі практики продакшену

### Крок 4.1: Безпечне керування обліковими даними

**Нинішня проблема:** Багато AI-додатків захардкоджують API-ключі або використовують небезпечне зберігання.

**Рішення AZD:** Керована ідентичність + інтеграція з Key Vault.

1. **Перегляньте безпекову конфігурацію у вашому шаблоні:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Переконайтеся, що керована ідентичність працює:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Крок 4.2: Мережева безпека

1. **Увімкніть приватні кінцеві точки** за допомогою підтримуваної мережевої конфігурації зразка (якщо вони ще не налаштовані).

У вашому власному шаблоні цей ілюстративний фрагмент показує підключення кінцевої точки OpenAI. Також потрібні VNet, налаштування приватного DNS і підключення додатку; не вставляйте його без змін у зразок, який уже має модулі приватних кінцевих точок:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
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

### Крок 4.3: Моніторинг і огляд

1. **Налаштуйте Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Увімкніть інтеграцію Application Insights у зразку:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Телеметрія зразка включає збір показників; довільне налаштування `OPENAI_MONITOR_ENABLED` не активує метрики AI. Перевіряйте трасування викликів моделі, затримки, збої та використання токенів, уникаючи запису конфіденційних запитів чи відповідей.

### **Лабораторне завдання 4.1: Аудит безпеки**

**Завдання:** Перевірте розгортання на відповідність кращим практикам безпеки.

**Контрольний список:**
- [ ] Відсутність захардкоджених секретів у коді чи конфігурації
- [ ] Використання керованої ідентичності для аутентифікації між сервісами
- [ ] Зберігання конфіденційної конфігурації у Key Vault
- [ ] Належне обмеження мережевого доступу
- [ ] Увімкнено моніторинг і логування

## Модуль 5: Конвертація власного AI-додатку

### Крок 5.1: Робочий лист оцінки

**Перед конвертацією вашого додатку** дайте відповіді на ці питання:

1. **Архітектура застосунку:**
   - Які AI-сервіси використовує ваш додаток?
   - Які обчислювальні ресурси потрібні?
   - Чи потрібна база даних?
   - Які залежності між сервісами?

2. **Вимоги до безпеки:**
   - Які конфіденційні дані обробляє ваш додаток?
   - Які вимоги до відповідності?
   - Чи потрібна приватна мережа?

3. **Вимоги до масштабування:**
   - Яке очікуване навантаження?
   - Чи потрібне автоматичне масштабування?
   - Чи є регіональні вимоги?

### Крок 5.2: Створення AZD-шаблону

**Дотримуйтесь цього шаблону для конвертації додатку:**

**Тільки каркас:** Цей розділ не містить вихідний код API/веб-додатку, хост-інфраструктуру, розгортання моделей, ідентичність/RBAC або готовий `main.parameters.json`. Bicep, прив’язаний до групи ресурсів, ілюструє структуру модулів; типовий вхідний файл AZD для підписки має створювати групу ресурсів і запускати його в межах цієї підписки. Не очікуйте, що `azd up` після копіювання лише цих фрагментів розгорне повний додаток. Для робочої бази продовжуйте використовувати шаблон RAG з Модуля 1.

1. **Створіть базову структуру:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
```

2. **Створіть azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Створіть шаблони інфраструктури:**

**infra/main.bicep** - Основний шаблон:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - Модуль OpenAI:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Лабораторне завдання 5.1: Виклик на створення шаблону**

**Задача:** Створіть AZD-шаблон для AI-додатку обробки документів.

**Вимоги:**
- Microsoft Foundry Models для аналізу вмісту
- Document Intelligence для OCR
- Обліковий запис зберігання для завантажень документів
- Функціональний додаток для логіки обробки
- Веб-додаток для інтерфейсу користувача

**Бонусні бали:**
- Додайте коректну обробку помилок
- Включіть оцінку вартості
- Налаштуйте панелі моніторингу

## Модуль 6: Усунення поширених проблем

### Поширені проблеми розгортання

#### Проблема 1: Перевищено квоту служби OpenAI
**Симптоми:** Розгортання не вдається через помилку квоти
**Рішення:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Проблема 2: Модель недоступна в регіоні
**Симптоми:** Відсутність відповідей AI або помилки розгортання моделі
**Рішення:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Проблема 3: Проблеми з правами доступу
**Симптоми:** Помилки 403 Forbidden при виклику AI-служб
**Рішення:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Проблеми з продуктивністю

#### Проблема 4: Повільні відповіді AI
**Кроки розслідування:**
1. Перевірте метрики продуктивності в Application Insights
2. Перегляньте метрики служби OpenAI у порталі Azure
3. Переконайтеся у мережевій підключеності та затримках

**Рішення:**
- Впровадьте кешування для поширених запитів
- Використовуйте відповідну модель OpenAI для вашого сценарію
- Масштабуйте репліки додатку лише після перевірки лімітів RPM/TPM моделі; розгортання Azure OpenAI не мають загального налаштування "read replica" як у базі даних

### **Лабораторне завдання 6.1: Виклик на налагодження**

**Сценарій:** Розгортання успішне, але додаток повертає помилки 500.

**Завдання для налагодження:**
1. Перевірте журнали додатку
2. Перевірте підключення сервісів
3. Перевірка автентифікації
4. Огляд конфігурації

**Інструменти для використання:**
- `azd show` для огляду розгортання
- Портал Azure для детальних логів сервісу
- Application Insights для телеметрії застосунку

## Модуль 7: Моніторинг і оптимізація

### Крок 7.1: Налаштування комплексного моніторингу

1. **Створення власних інформаційних панелей:**

Перейдіть у портал Azure і створіть інформаційну панель із:
- Кількістю запитів та затримкою OpenAI
- Рівнями помилок застосунку
- Використанням ресурсів
- Відстеженням вартості

2. **Налаштування сповіщень:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Перевірте, що компонент відправляє телеметрію запитів, і додайте групу дій, якщо потрібні сповіщення. Метрика — це лічильник, а не відсоток збоїв; для сповіщень про рівень потрібно відповідний запит і знаменник.

### Крок 7.2: Оптимізація вартості

1. **Аналіз поточних витрат:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Замініть плейсхолдери дати. Підтримка Consumption API залежить від типу угоди з виставлення рахунків; користуйтесь Cost Management у порталі, якщо деталі використання недоступні. Витрати мають затримку, це не орієнтир у режимі реального часу.

2. **Впровадження контролю витрат:**
- Налаштуйте сповіщення про бюджет
- Використовуйте політики авто масштабування
- Впровадьте кешування запитів
- Контролюйте використання токенів для OpenAI

### **Лабораторне завдання 7.1: Оптимізація продуктивності**

**Завдання**: Оптимізуйте ваш AI-застосунок і за продуктивністю, і за вартістю.

**Показники для покращення:**
- Зменшити середній час відповіді на 20%
- Зменшити щомісячні витрати на 15%
- Визначити SLO доступності 99,9% і часовий інтервал для вимірювань (коротка лабораторія не може продемонструвати щомісячний час роботи)

**Стратегії для спроби:**
- Впровадити кешування відповідей
- Оптимізувати підказки для ефективності токенів
- Використовувати відповідні обчислювальні SKU
- Налаштувати адекватне авто масштабування

## Заключне завдання: Повна реалізація

### Сценарій завдання

Це **опціональне архітектурне/дизайнерське завдання**, а не готове до виконання практичне завдання чи сертифікація для виробництва. Запропонуйте чат-бота для обслуговування клієнтів на базі AI та опишіть, які вимоги потребують подальшої реалізації і доказів:

**Функціональні вимоги:**
- Веб-інтерфейс для взаємодії з клієнтами
- Інтеграція з Microsoft Foundry Models для відповідей
- Можливість пошуку документів за допомогою Azure AI Search
- Інтеграція з існуючою базою клієнтів
- Підтримка кількох мов

**Нефункціональні вимоги:**
- Обробка 1000 одночасних користувачів
- SLA 99,9% часу роботи
- Відповідність SOC 2
- Вартість до $500 на місяць
- Розгортання у кількох середовищах (dev, staging, prod)

Це гіпотетичні обмеження зацікавлених сторін, а не гарантовані одночасні результати. Визначте частоту запитів, розміри підказок/виходу та тривалість сесії перед оцінкою витрат; 1000 одночасних користувачів не встановлює робоче навантаження і не доводить, що бюджет $500 реальний. SOC 2 — це результат організаційного аудиту, а не функція, що включається шаблоном AZD. Визначайте компроміси і відмовляйтесь від нереалістичних обмежень із доказами.

### Кроки реалізації

1. **Проєктування архітектури**
2. **Створення шаблону AZD**
3. **Впровадження заходів безпеки**
4. **Налаштування моніторингу та сповіщень**
5. **Створення конвеєрів розгортання**
6. **Документування рішення**

### Критерії оцінювання

- ✅ **Функціональність**: Чи продемонстровані реалізовані можливості і чи чітко визначені наявні прогалини?
- ✅ **Безпека**: Чи впроваджені кращі практики?
- ✅ **Масштабованість**: Чи може система витримувати навантаження?
- ✅ **Підтримуваність**: Чи організований код та інфраструктура?
- ✅ **Вартість**: Чи не виходить за бюджет?

## Додаткові ресурси

### Документація Microsoft
- [Документація Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Документація сервісу Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Документація Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Приклад шаблонів
- [Чат-додаток Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Швидкий старт OpenAI Chat App](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ресурси спільноти
- [Discord Microsoft Foundry](https://discord.gg/microsoft-azure)
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Кращі шаблони AZD](https://azure.github.io/awesome-azd/)

## 🎓 Контрольна точка завершення

Вітаємо! Ви завершили лабораторну роботу AI Workshop. Тепер ви маєте вміти:

- ✅ Пояснити, як адаптувати існуючий AI-застосунок до шаблону AZD
- ✅ Розгорнути та протестувати AI довідковий застосунок
- ✅ Впроваджувати кращі практики безпеки для AI-навантажень
- ✅ Моніторити і оптимізувати продуктивність AI-застосунку
- ✅ Усувати поширені проблеми розгортання

**Очищення:** Запустіть `azd env list`, виберіть кожне створене лабораторне середовище (`myai-workshop`, а якщо було розгорнуто `myai-production`/`myai-quota-test`), і виконайте `azd down` у кожному. Перегляньте план видалення; видалення лише локальної конфігурації середовища не видаляє ресурси Azure. Уникайте `--purge`, якщо не розумієте незворотне видалення ресурсів у стані soft-deleted.

### Наступні кроки
1. Застосуйте ці шаблони у власних AI-проєктах
2. Поверніть шаблони спільноті
3. Приєднуйтесь до Discord Microsoft Foundry для підтримки
4. Вивчайте просунуті теми, такі як мульти-регіональні розгортання

---

**Відгук про майстер-клас**: Допоможіть нам покращити цей майстер-клас, поділившись своїм досвідом у [каналі #Azure Discord Microsoft Foundry](https://discord.gg/microsoft-azure).

---

**Навігація по розділах:**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 – Розробка з AI в пріоритеті
- **⬅️ Попередній**: [Розгортання AI-моделі](ai-model-deployment.md)
- **➡️ Наступний**: [Кращі практики AI у виробництві](../chapter-08-production/production-ai-practices.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

**Потрібна допомога?** Приєднуйтесь до нашої спільноти для підтримки та обговорень розгортання AZD і AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->