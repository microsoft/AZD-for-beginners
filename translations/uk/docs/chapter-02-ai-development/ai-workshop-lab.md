# Майстерня ШІ: Робимо Ваші AI-рішення deployable за допомогою AZD

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка з пріоритетом на ШІ
- **⬅️ Попередній**: [Розгортання моделі ШІ](ai-model-deployment.md)
- **➡️ Наступний**: [Кращі практики використання ШІ в продакшені](production-ai-practices.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

## Огляд майстерні

Ця практична лабораторія проведе розробників через процес взяття існуючого шаблону ШІ та його розгортання за допомогою Azure Developer CLI (AZD). Ви дізнаєтеся основні шаблони для розгортань ШІ в продакшен за допомогою сервісів Microsoft Foundry.

**Тривалість:** 2-3 години  
**Рівень:** Середній  
**Вимоги:** Базові знання Azure, знайомство з концепціями ШІ/МЛ

## 🎓 Цілі навчання

До кінця цієї майстерні ви зможете:
- ✅ Перевести існуючий AI-додаток на використання AZD шаблонів
- ✅ Налаштувати сервіси Microsoft Foundry за допомогою AZD
- ✅ Реалізувати безпечне керування обліковими даними для AI-сервісів
- ✅ Розгорнути готові до продакшен AI-додатки з моніторингом
- ✅ Виявляти та усувати типові проблеми розгортання AI

## Вимоги

### Необхідні інструменти
- Встановлено [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Встановлено [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Встановлено [Git](https://git-scm.com/)
- Редактор коду (рекомендується VS Code)

### Ресурси Azure
- Підписка Azure з правами учасника (contributor)
- Доступ до сервісів Microsoft Foundry Models (або можливість запросити доступ)
- Права на створення групи ресурсів

### Необхідні знання
- Базове розуміння сервісів Azure
- Знайомство з інтерфейсами командного рядка
- Основи ШІ/МЛ (API, моделі, промпти)

## Налаштування лабораторії

### Крок 1: Підготовка оточення

1. **Перевірте встановлення інструментів:**
```bash
# Перевірте встановлення AZD
azd version

# Перевірте Azure CLI
az --version

# Увійдіть в Azure
az login
azd auth login
```

2. **Клонуйте репозиторій майстерні:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Модуль 1: Розуміння структури AZD для AI-додатків

### Анатомія AZD шаблону для ШІ

Ознайомтесь з ключовими файлами в AZD шаблоні, готовому до AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Практичне завдання 1.1: Ознайомлення з конфігурацією**

1. **Проаналізуйте файл azure.yaml:**
```bash
cat azure.yaml
```

**На що звернути увагу:**
- Визначення сервісів для компонентів ШІ
- Відображення змінних середовища
- Налаштування хостів

2. **Розгляньте основний інфраструктурний файл main.bicep:**
```bash
cat infra/main.bicep
```

**Ключові шаблони ШІ для виявлення:**
- Provisioning сервісу Microsoft Foundry Models
- Інтеграція з Cognitive Search
- Безпечне керування ключами
- Налаштування безпеки мережі

### **Обговорення:** Чому ці шаблони важливі для ШІ

- **Залежності сервісів**: AI-додатки часто потребують кілька координованих сервісів
- **Безпека**: API ключі та кінцеві точки потрібно захищати
- **Масштабованість**: AI-навантаження мають унікальні вимоги до масштабування
- **Управління витратами**: AI-сервіси можуть бути дорогими без правильного налаштування

## Модуль 2: Розгортання Вашого першого AI-додатка

### Крок 2.1: Ініціалізація оточення

1. **Створіть нове середовище AZD:**
```bash
azd env new myai-workshop
```

2. **Встановіть необхідні параметри:**
```bash
# Встановіть ваш бажаний регіон Azure
azd env set AZURE_LOCATION eastus

# Необов’язково: Встановіть конкретну модель OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Крок 2.2: Розгортання інфраструктури та додатка

1. **Розгорніть за допомогою AZD:**
```bash
azd up
```

**Що відбувається під час `azd up`:**
- ✅ Provision Microsoft Foundry Models сервіс
- ✅ Створення Cognitive Search сервісу
- ✅ Налаштування App Service для веб-додатка
- ✅ Конфігурація мережевих та безпекових налаштувань
- ✅ Розгортання коду додатка
- ✅ Налаштування моніторингу та логування

2. **Слідкуйте за ходом розгортання** та зверніть увагу на створювані ресурси.

### Крок 2.3: Перевірка розгортання

1. **Перевірте створені ресурси:**
```bash
azd show
```

2. **Відкрийте розгорнутий додаток:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Перевірте функціональність AI:**
   - Перейдіть до веб-додатка
   - Спробуйте зразкові запити
   - Перевірте, чи працюють AI-відповіді

### **Практичне завдання 2.1: Практика усунення неполадок**

**Сценарій**: Розгортання пройшло успішно, але AI не відповідає.

**Типові проблеми для перевірки:**
1. **OpenAI API ключі**: Переконайтеся, що вони встановлені правильно
2. **Доступність моделі**: Перевірте підтримку моделі у вашому регіоні
3. **Підключення мережі**: Переконайтеся, що сервіси можуть взаємодіяти
4. **Права RBAC**: Перевірте доступ додатка до OpenAI

**Команди для налагодження:**
```bash
# Перевірте змінні оточення
azd env get-values

# Перегляньте журнали розгортання
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Перевірте статус розгортання OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Модуль 3: Налаштування AI-додатків під Ваші потреби

### Крок 3.1: Зміна конфігурації AI

1. **Оновіть модель OpenAI:**
```bash
# Змініть на іншу модель (якщо доступна у вашому регіоні)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Розгорніть повторно з новою конфігурацією
azd deploy
```

2. **Додайте додаткові AI-сервіси:**

Відредагуйте `infra/main.bicep`, щоб додати Document Intelligence:

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

### Крок 3.2: Конфігурації залежно від оточення

**Краща практика**: Різні конфігурації для розробки та продакшену.

1. **Створіть продакшен оточення:**
```bash
azd env new myai-production
```

2. **Встановіть параметри, специфічні для продакшену:**
```bash
# У виробництві зазвичай використовують більше артикулів
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Увімкніть додаткові функції безпеки
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Практичне завдання 3.1: Оптимізація витрат**

**Задача**: Налаштуйте шаблон для економного розробки.

**Завдання:**
1. Визначте, які SKU можна встановити на безкоштовні/базові рівні
2. Налаштуйте змінні оточення для мінімальних витрат
3. Розгорніть та порівняйте витрати з продакшен-конфігурацією

**Підказки:**
- Використовуйте рівень F0 (безкоштовний) для Cognitive Services, коли можливо
- Використовуйте базовий рівень для Search Service у розробці
- Розгляньте використання плану споживання для Functions

## Модуль 4: Безпека та кращі практики продакшену

### Крок 4.1: Безпечне керування обліковими даними

**Поточна проблема**: Багато AI-додатків жорстко кодують API ключі або використовують небезпечне сховище.

**Рішення AZD**: Managed Identity + інтеграція з Key Vault.

1. **Перегляньте конфігурацію безпеки у вашому шаблоні:**
```bash
# Шукайте конфігурацію Key Vault та Керованої Ідентичності
grep -r "keyVault\|managedIdentity" infra/
```

2. **Перевірте працездатність Managed Identity:**
```bash
# Перевірте, чи веб-додаток має правильну конфігурацію ідентичності
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Крок 4.2: Безпека мережі

1. **Увімкніть приватні кінцеві точки** (якщо ще не налаштовані):

Додайте у ваш bicep шаблон:
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
# Application Insights має бути налаштовано автоматично
# Перевірте конфігурацію:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Налаштуйте моніторинг, специфічний для AI:**

Додайте користувацькі метрики для AI-операцій:
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

**Завдання**: Перевірте розгортання на дотримання кращих практик безпеки.

**Чеклист:**
- [ ] Відсутність жорстко вбудованих секретів у коді або конфігурації
- [ ] Використання Managed Identity для автентифікації між сервісами
- [ ] Зберігання конфіденційних налаштувань у Key Vault
- [ ] Належне обмеження доступу до мережі
- [ ] Увімкнено моніторинг та логування

## Модуль 5: Перетворення власного AI-додатка

### Крок 5.1: Оцінювальний лист

**Перед перетворенням вашого додатка** дайте відповіді на такі запитання:

1. **Архітектура додатка:**
   - Які AI-сервіси використовує ваш додаток?
   - Які обчислювальні ресурси потрібні?
   - Чи потрібна база даних?
   - Які залежності між сервісами?

2. **Вимоги безпеки:**
   - Які конфіденційні дані обробляє додаток?
   - Які вимоги відповідності потрібно дотримуватися?
   - Чи потрібна приватна мережа?

3. **Вимоги до масштабування:**
   - Яке очікуване навантаження?
   - Чи потрібне автоматичне масштабування?
   - Чи є регіональні вимоги?

### Крок 5.2: Створення вашого AZD шаблону

**Дотримуйтеся цього патерну для конвертації вашого додатка:**

1. **Створіть базову структуру:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Ініціалізувати шаблон AZD
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

3. **Створіть інфраструктурні шаблони:**

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

### **Практичне завдання 5.1: Виклик на створення шаблону**

**Задача**: Створіть AZD шаблон для AI-додатка з обробки документів.

**Вимоги:**
- Microsoft Foundry Models для аналізу контенту
- Document Intelligence для OCR
- Обліковий запис зберігання для завантаження документів
- Функція обробки (Function App) для логіки
- Веб-додаток для інтерфейсу користувача

**Бонусні бали:**
- Додайте коректну обробку помилок
- Включіть оцінку вартості
- Налаштуйте інформаційні панелі моніторингу

## Модуль 6: Усунення типових проблем

### Типові проблеми розгортання

#### Проблема 1: Перевищення квоти сервісу OpenAI
**Симптоми:** Помилка квоти під час розгортання  
**Рішення:**
```bash
# Перевірте поточні квоти
az cognitiveservices usage list --location eastus

# Запитайте про збільшення квоти або спробуйте інший регіон
azd env set AZURE_LOCATION westus2
azd up
```

#### Проблема 2: Модель недоступна в регіоні
**Симптоми:** Помилки відповіді AI або розгортання моделей  
**Рішення:**
```bash
# Перевірте доступність моделі за регіоном
az cognitiveservices model list --location eastus

# Оновити до доступної моделі
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Проблема 3: Проблеми з дозволами
**Симптоми:** Помилки 403 Forbidden під час викликів AI-сервісів  
**Рішення:**
```bash
# Перевірте призначення ролей
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Додати відсутні ролі
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Проблеми з продуктивністю

#### Проблема 4: Повільні відповіді AI
**Кроки для розслідування:**
1. Перевірте метрики продуктивності в Application Insights
2. Перегляньте метрики сервісу OpenAI в Azure порталі
3. Переконайтеся в наявності мережевого з’єднання та відсутності латентності

**Рішення:**
- Реалізуйте кешування популярних запитів
- Використовуйте відповідну модель OpenAI для вашого випадку
- Розгляньте використання реплік для великих навантажень

### **Практичне завдання 6.1: Виклик на налагодження**

**Сценарій**: Розгортання пройшло, але додаток повертає помилки 500.

**Завдання:**
1. Перевірте логи додатка
2. Перевірте підключення до сервісів
3. Тестуйте автентифікацію
4. Перегляньте конфігурацію

**Інструменти:**
- `azd show` — огляд розгортання
- Azure портал — детальні логи сервісів
- Application Insights — телеметрія додатка

## Модуль 7: Моніторинг та оптимізація

### Крок 7.1: Налаштування комплексного моніторингу

1. **Створіть власні інформаційні панелі:**

Перейдіть в Azure портал і створіть панель із:
- Кількість та затримка запитів OpenAI
- Рівні помилок додатку
- Використання ресурсів
- Відслідковування витрат

2. **Налаштуйте оповіщення:**
```bash
# Попередження про високий рівень помилок
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
# Використовуйте Azure CLI для отримання даних про витрати
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Реалізуйте контроль витрат:**
- Налаштуйте бюджетні алерти
- Використовуйте політики автоскейлінгу
- Реалізуйте кешування запитів
- Слідкуйте за використанням токенів OpenAI

### **Практичне завдання 7.1: Оптимізація продуктивності**

**Завдання:** Оптимізуйте AI-додаток за показниками продуктивності та вартості.

**Ціль:**
- Скоротити середній час відповіді на 20%
- Зменшити щомісячні витрати на 15%
- Підтримувати 99.9% часу безвідмовної роботи

**Стратегії для спроби:**
- Реалізуйте кешування відповідей
- Оптимізуйте промпти для зменшення токенів
- Використовуйте відповідні SKUs обчислювальних ресурсів
- Налаштуйте правильне автоскейлінг

## Фінальне завдання: Повне впровадження

### Сценарій завдання

Вам доручено створити продакшен чатбота на основі ШІ для служби підтримки клієнтів з такими вимогами:

**Функціональні вимоги:**
- Веб-інтерфейс для взаємодії користувачів
- Інтеграція з Microsoft Foundry Models для відповідей
- Пошук документів за допомогою Cognitive Search
- Інтеграція з існуючою базою даних клієнтів
- Підтримка мульти-мовності

**Нефункціональні вимоги:**
- Обробка 1000 одночасних користувачів
- 99.9% SLA часу роботи
- Відповідність SOC 2
- Вартість менше $500 на місяць
- Розгортання в кілька середовищ (dev, staging, prod)

### Кроки впровадження

1. **Спроєктувати архітектуру**
2. **Створити AZD шаблон**
3. **Впровадити заходи безпеки**
4. **Налаштувати моніторинг та оповіщення**
5. **Створити конвеєри розгортання**
6. **Задокументувати рішення**

### Критерії оцінки

- ✅ **Функціональність**: Чи відповідає усім вимогам?
- ✅ **Безпека**: Чи застосовані кращі практики?
- ✅ **Масштабованість**: Чи витримає навантаження?
- ✅ **Підтримка**: Чи структуровані код і інфраструктура?
- ✅ **Вартість**: Чи укладається у бюджет?

## Додаткові ресурси

### Документація Microsoft
- [Документація Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Документація сервісу Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Документація Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Приклади шаблонів
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ресурси спільноти
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Сертифікат про завершення

Вітаємо! Ви успішно виконали майстерню ШІ. Тепер ви можете:
- ✅ Конвертувати існуючі AI-застосунки у шаблони AZD
- ✅ Розгортати AI-застосунки, готові до використання в продукції
- ✅ Впроваджувати найкращі практики безпеки для AI-навантажень
- ✅ Моніторити та оптимізувати продуктивність AI-застосунків
- ✅ Вирішувати поширені проблеми розгортання

### Наступні кроки
1. Застосуйте ці шаблони у своїх власних AI-проєктах
2. Передавайте шаблони назад до спільноти
3. Приєднуйтесь до Microsoft Foundry Discord для постійної підтримки
4. Досліджуйте просунуті теми, такі як багаторегіональні розгортання

---

**Відгук про воркшоп**: Допоможіть нам покращити цей воркшоп, поділившись своїм досвідом у [Microsoft Foundry Discord каналі #Azure](https://discord.gg/microsoft-azure).

---

**Навігація розділу:**
- **📚 Головна сторінка курсу**: [AZD Для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка AI-перш за все
- **⬅️ Попередній**: [Розгортання AI-моделі](ai-model-deployment.md)
- **➡️ Наступний**: [Найкращі практики для AI в продукції](production-ai-practices.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

**Потрібна допомога?** Приєднуйтесь до нашої спільноти для підтримки та обговорень щодо AZD і розгортань AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоч ми і прагнемо до точності, просимо враховувати, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для важливої інформації рекомендується звертатися до професійного людського перекладу. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли у результаті використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->