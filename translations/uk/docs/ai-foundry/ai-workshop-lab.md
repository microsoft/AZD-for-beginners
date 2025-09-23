<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22e9deee2d82e70fc841c60f97627916",
  "translation_date": "2025-09-23T14:51:29+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "uk"
}
-->
# Лабораторний семінар з AI: Робимо ваші AI-рішення готовими до розгортання з AZD

**Навігація по розділах:**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка з акцентом на AI
- **⬅️ Попередній**: [Розгортання AI-моделі](ai-model-deployment.md)
- **➡️ Наступний**: [Найкращі практики для AI у продакшені](production-ai-practices.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../getting-started/configuration.md)

## Огляд семінару

Ця практична лабораторія допоможе розробникам пройти процес використання існуючого шаблону AI та його розгортання за допомогою Azure Developer CLI (AZD). Ви навчитеся основним шаблонам для розгортання AI-рішень у продакшені, використовуючи сервіси Azure AI Foundry.

**Тривалість:** 2-3 години  
**Рівень:** Середній  
**Передумови:** Базові знання Azure, знайомство з концепціями AI/ML

## 🎓 Цілі навчання

До кінця цього семінару ви зможете:
- ✅ Перетворити існуючий AI-додаток для використання шаблонів AZD
- ✅ Налаштувати сервіси Azure AI Foundry за допомогою AZD
- ✅ Реалізувати безпечне управління обліковими даними для AI-сервісів
- ✅ Розгорнути AI-додатки, готові до продакшену, з моніторингом
- ✅ Вирішувати поширені проблеми розгортання AI

## Передумови

### Необхідні інструменти
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) встановлений
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) встановлений
- [Git](https://git-scm.com/) встановлений
- Редактор коду (рекомендується VS Code)

### Ресурси Azure
- Підписка Azure з доступом Contributor
- Доступ до сервісів Azure OpenAI (або можливість запросити доступ)
- Дозвіл на створення груп ресурсів

### Знання
- Базове розуміння сервісів Azure
- Знайомство з інтерфейсами командного рядка
- Основні концепції AI/ML (API, моделі, запити)

## Налаштування лабораторії

### Крок 1: Підготовка середовища

1. **Перевірте встановлення інструментів:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Клонування репозиторію семінару:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```


## Модуль 1: Розуміння структури AZD для AI-додатків

### Анатомія шаблону AZD для AI

Ознайомтеся з ключовими файлами у шаблоні AZD, готовому до роботи з AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```


### **Практичне завдання 1.1: Дослідження конфігурації**

1. **Перегляньте файл azure.yaml:**
```bash
cat azure.yaml
```

**На що звернути увагу:**
- Визначення сервісів для AI-компонентів
- Відображення змінних середовища
- Конфігурації хосту

2. **Перегляньте основну інфраструктуру main.bicep:**
```bash
cat infra/main.bicep
```

**Ключові шаблони для AI:**
- Налаштування сервісу Azure OpenAI
- Інтеграція Cognitive Search
- Безпечне управління ключами
- Конфігурації мережевої безпеки

### **Точка обговорення:** Чому ці шаблони важливі для AI

- **Залежності сервісів**: AI-додатки часто потребують координації кількох сервісів
- **Безпека**: API-ключі та кінцеві точки потребують безпечного управління
- **Масштабованість**: AI-навантаження мають унікальні вимоги до масштабування
- **Управління витратами**: AI-сервіси можуть бути дорогими без належної конфігурації

## Модуль 2: Розгортання вашого першого AI-додатка

### Крок 2.1: Ініціалізація середовища

1. **Створіть нове середовище AZD:**
```bash
azd env new myai-workshop
```

2. **Встановіть необхідні параметри:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```


### Крок 2.2: Розгортання інфраструктури та додатка

1. **Розгорніть за допомогою AZD:**
```bash
azd up
```

**Що відбувається під час `azd up`:**
- ✅ Налаштовується сервіс Azure OpenAI
- ✅ Створюється сервіс Cognitive Search
- ✅ Налаштовується App Service для веб-додатка
- ✅ Конфігурується мережа та безпека
- ✅ Розгортається код додатка
- ✅ Налаштовується моніторинг та логування

2. **Слідкуйте за прогресом розгортання** та зверніть увагу на створювані ресурси.

### Крок 2.3: Перевірка вашого розгортання

1. **Перевірте розгорнуті ресурси:**
```bash
azd show
```

2. **Відкрийте розгорнутий додаток:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Протестуйте функціональність AI:**
   - Перейдіть до веб-додатка
   - Спробуйте зразкові запити
   - Переконайтеся, що відповіді AI працюють

### **Практичне завдання 2.1: Практика усунення несправностей**

**Сценарій**: Ваше розгортання успішне, але AI не відповідає.

**Поширені проблеми для перевірки:**
1. **API-ключі OpenAI**: Переконайтеся, що вони правильно налаштовані
2. **Доступність моделі**: Перевірте, чи підтримує ваш регіон модель
3. **Мережеве з'єднання**: Переконайтеся, що сервіси можуть взаємодіяти
4. **Дозволи RBAC**: Перевірте, чи додаток має доступ до OpenAI

**Команди для налагодження:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```


## Модуль 3: Налаштування AI-додатків під ваші потреби

### Крок 3.1: Зміна конфігурації AI

1. **Оновіть модель OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **Додайте додаткові AI-сервіси:**

Редагуйте `infra/main.bicep`, щоб додати Document Intelligence:

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


### Крок 3.2: Конфігурації для конкретного середовища

**Найкраща практика**: Різні конфігурації для розробки та продакшену.

1. **Створіть середовище для продакшену:**
```bash
azd env new myai-production
```

2. **Встановіть параметри для продакшену:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```


### **Практичне завдання 3.1: Оптимізація витрат**

**Завдання**: Налаштуйте шаблон для економічно ефективної розробки.

**Завдання:**
1. Визначте, які SKU можна встановити на безкоштовні/базові рівні
2. Налаштуйте змінні середовища для мінімальних витрат
3. Розгорніть і порівняйте витрати з конфігурацією для продакшену

**Підказки до рішення:**
- Використовуйте рівень F0 (безкоштовний) для Cognitive Services, якщо можливо
- Використовуйте базовий рівень для Search Service у розробці
- Розгляньте використання Consumption плану для Functions

## Модуль 4: Безпека та найкращі практики для продакшену

### Крок 4.1: Безпечне управління обліковими даними

**Поточна проблема**: Багато AI-додатків жорстко кодують API-ключі або використовують небезпечне зберігання.

**Рішення AZD**: Інтеграція Managed Identity + Key Vault.

1. **Перегляньте конфігурацію безпеки у вашому шаблоні:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Перевірте роботу Managed Identity:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```


### Крок 4.2: Мережева безпека

1. **Увімкніть приватні кінцеві точки** (якщо вони ще не налаштовані):

Додайте до вашого шаблону bicep:
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


### Крок 4.3: Моніторинг та спостереження

1. **Налаштуйте Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Налаштуйте моніторинг, специфічний для AI:**

Додайте власні метрики для AI-операцій:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```


### **Практичне завдання 4.1: Аудит безпеки**

**Завдання**: Перегляньте ваше розгортання на предмет найкращих практик безпеки.

**Контрольний список:**
- [ ] У коді або конфігурації немає жорстко закодованих секретів
- [ ] Використовується Managed Identity для аутентифікації між сервісами
- [ ] Key Vault зберігає конфіденційну конфігурацію
- [ ] Мережевий доступ належним чином обмежений
- [ ] Моніторинг та логування увімкнені

## Модуль 5: Перетворення вашого AI-додатка

### Крок 5.1: Оцінка перед конвертацією

**Перед перетворенням вашого додатка** дайте відповіді на ці запитання:

1. **Архітектура додатка:**
   - Які AI-сервіси використовує ваш додаток?
   - Які обчислювальні ресурси йому потрібні?
   - Чи потрібна база даних?
   - Які залежності між сервісами?

2. **Вимоги до безпеки:**
   - Які конфіденційні дані обробляє ваш додаток?
   - Які вимоги до відповідності у вас є?
   - Чи потрібна приватна мережа?

3. **Вимоги до масштабування:**
   - Яке очікуване навантаження?
   - Чи потрібне автоматичне масштабування?
   - Чи є регіональні вимоги?

### Крок 5.2: Створення шаблону AZD

**Дотримуйтесь цього шаблону для перетворення вашого додатка:**

1. **Створіть базову структуру:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
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
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```


### **Практичне завдання 5.1: Виклик створення шаблону**

**Завдання**: Створіть шаблон AZD для AI-додатка обробки документів.

**Вимоги:**
- Azure OpenAI для аналізу контенту
- Document Intelligence для OCR
- Storage Account для завантаження документів
- Function App для логіки обробки
- Веб-додаток для інтерфейсу користувача

**Бонусні бали:**
- Додайте належну обробку помилок
- Включіть оцінку витрат
- Налаштуйте моніторингові панелі

## Модуль 6: Усунення поширених проблем

### Поширені проблеми розгортання

#### Проблема 1: Перевищення квоти сервісу OpenAI
**Симптоми:** Розгортання завершується помилкою квоти  
**Рішення:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```


#### Проблема 2: Модель недоступна в регіоні
**Симптоми:** Відповіді AI не працюють або помилки розгортання моделі  
**Рішення:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```


#### Проблема 3: Проблеми з дозволами
**Симптоми:** Помилки 403 Forbidden при виклику AI-сервісів  
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


### Проблеми продуктивності

#### Проблема 4: Повільні відповіді AI
**Кроки для розслідування:**
1. Перевірте метрики продуктивності в Application Insights
2. Перегляньте метрики сервісу OpenAI в порталі Azure
3. Перевірте мережеве з'єднання та затримку

**Рішення:**
- Реалізуйте кешування для поширених запитів
- Використовуйте відповідну модель OpenAI для вашого випадку
- Розгляньте репліки для читання для сценаріїв високого навантаження

### **Практичне завдання 6.1: Виклик налагодження**

**Сценарій**: Ваше розгортання успішне, але додаток повертає помилки 500.

**Завдання для налагодження:**
1. Перевірте журнали додатка
2. Перевірте з'єднання сервісів
3. Протестуйте аутентифікацію
4. Перегляньте конфігурацію

**Інструменти для використання:**
- `azd show` для огляду розгортання
- Портал Azure для детальних журналів сервісів
- Application Insights для телеметрії додатка

## Модуль 7: Моніторинг та оптимізація

### Крок 7.1: Налаштування комплексного моніторингу

1. **Створіть власні панелі моніторингу:**

Перейдіть до порталу Azure та створіть панель з:
- Кількість запитів до OpenAI та затримка
- Рівень помилок додатка
- Використання ресурсів
- Відстеження витрат

2. **Налаштуйте сповіщення:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```


### Крок 7.2: Оптимізація витрат

1. **Аналізуйте поточні витрати:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Реалізуйте контроль витрат:**
- Налаштуйте сповіщення про бюджет
- Використовуйте політики автоматичного масштабування
- Реалізуйте кешування запитів
- Відстежуйте використання токенів для OpenAI

### **Практичне завдання 7.1: Оптимізація продуктивності**

**Завдання**: Оптимізуйте ваш AI-додаток для продуктивності та витрат.

**Метрики для покращення:**
- Зменшити середній час відповіді на 20%
- Зменшити щомісячні витрати на 15%
- Підтримувати 99.9% часу безвідмовної роботи

**Стратегії для спроби:**
- Реалізуйте кешування відповідей
- Оптимізуйте запити для ефективності токенів
- Використовуйте відповідні SKU для обчислень
- Налаштуйте правильне автоматичне масштабування

## Фінальний виклик: Реалізація від початку до кінця

### Сценарій виклику

Вам доручено створити готового до продакшену AI-чатбота для обслуговування клієнтів з такими вимогами:

**Функціональні вимоги:**
- Веб-інтерфейс для взаємодії з клієнтами
- Інтеграція з Azure OpenAI для відповідей
- Можливість пошуку документів за допомогою Cognitive Search
- Інтеграція з існуючою базою даних клієнтів
- Підтримка багатомовності

**Нефункціональні вимоги:**
- Обробка 1000 одночасних користувачів
- SLA 99.9% часу безвідмовної роботи
- Відповідність SOC 2
- Витрати до $500/місяць
- Розгортання в кількох середовищах (розробка, тестування, продакшен)

### Кроки реалізації

1. **Спроектуйте архітектуру**
2
Вітаємо! Ви завершили лабораторний курс AI Workshop. Тепер ви повинні вміти:

- ✅ Перетворювати існуючі AI-додатки на шаблони AZD
- ✅ Розгортати AI-додатки, готові до використання в продакшені
- ✅ Реалізовувати найкращі практики безпеки для AI-навантажень
- ✅ Моніторити та оптимізувати продуктивність AI-додатків
- ✅ Вирішувати поширені проблеми з розгортанням

### Наступні кроки
1. Застосуйте ці шаблони у своїх AI-проєктах
2. Внесіть шаблони назад у спільноту
3. Приєднуйтесь до Discord Azure AI Foundry для постійної підтримки
4. Досліджуйте розширені теми, такі як розгортання в кількох регіонах

---

**Зворотний зв'язок щодо воркшопу**: Допоможіть нам покращити цей воркшоп, поділившись своїм досвідом у [каналі #Azure Discord Azure AI Foundry](https://discord.gg/microsoft-azure).

---

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка з фокусом на AI
- **⬅️ Попередній**: [Розгортання AI-моделі](ai-model-deployment.md)
- **➡️ Наступний**: [Найкращі практики для AI у продакшені](production-ai-practices.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../getting-started/configuration.md)

**Потрібна допомога?** Приєднуйтесь до нашої спільноти для підтримки та обговорення AZD і розгортання AI.

---

