# Лабораторія AI Workshop: Створення AI-рішень, готових до розгортання через AZD

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка з орієнтацією на AI
- **⬅️ Попередній**: [Розгортання AI-моделі](ai-model-deployment.md)
- **➡️ Наступний**: [Кращі практики для продуктивного AI](production-ai-practices.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

## Огляд майстер-класу

Ця практична лабораторія проводить розробників через процес взяття існуючого шаблону AI і розгортання його за допомогою Azure Developer CLI (AZD). Ви дізнаєтеся основні шаблони для продуктивних AI-розгортань із використанням сервісів Microsoft Foundry.

> **Примітка про валідацію (2026-03-25):** Цей майстер-клас перевірений з версією `azd` `1.23.12`. Якщо ваша локальна інсталяція старіша, оновіть AZD перед початком, щоб процес автентифікації, шаблону та розгортання відповідав наведеним нижче крокам.

**Тривалість:** 2-3 години  
**Рівень:** Середній  
**Передумови:** Базові знання Azure, знайомство з концепціями AI/ML

## 🎓 Навчальні цілі

Після завершення цієї лабораторії ви зможете:
- ✅ Перетворити існуючий AI-додаток на AZD шаблони
- ✅ Налаштувати сервіси Microsoft Foundry за допомогою AZD
- ✅ Впровадити безпечне управління обліковими даними для AI-сервісів
- ✅ Розгорнути готовий до виробництва AI-додаток з моніторингом
- ✅ Усувати поширені проблеми з розгортанням AI

## Передумови

### Необхідні інструменти
- Встановлений [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Встановлений [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Встановлений [Git](https://git-scm.com/)
- Редактор коду (рекомендовано VS Code)

### Ресурси Azure
- Підписка Azure з правами співавтора
- Доступ до сервісів Microsoft Foundry Models (або можливість запросити доступ)
- Права на створення груп ресурсів

### Необхідні знання
- Базове розуміння сервісів Azure
- Знайомство з інтерфейсом командного рядка
- Базові концепції AI/ML (API, моделі, запити)

## Налаштування лабораторії

### Крок 1: Підготовка середовища

1. **Перевірте встановлення інструментів:**
```bash
# Перевірте встановлення AZD
azd version

# Перевірте Azure CLI
az --version

# Увійдіть в Azure для робочих процесів AZD
azd auth login

# Увійдіть в Azure CLI лише якщо плануєте запускати команди az під час діагностики
az login
```

Якщо ви працюєте в кількох орендарях або ваша підписка не визначена автоматично, повторіть команду з `azd auth login --tenant-id <tenant-id>`.

2. **Клонуйте репозиторій майстер-класу:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Модуль 1: Розуміння структури AZD для AI-додатків

### Анатомія AI-шаблону AZD

Ознайомтесь з ключовими файлами шаблону AZD, готового до AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Лабораторне завдання 1.1: Ознайомлення з конфігурацією**

1. **Перегляньте файл azure.yaml:**
```bash
cat azure.yaml
```

**На що звернути увагу:**
- Визначення сервісів для AI-компонентів
- Відображення змінних оточення
- Налаштування хостів

2. **Перегляньте основний інфраструктурний файл main.bicep:**
```bash
cat infra/main.bicep
```

**Ключові AI-шаблони для ідентифікації:**
- Підключення сервісу Microsoft Foundry Models
- Інтеграція Azure AI Search
- Безпечне управління ключами
- Налаштування мережевої безпеки

### **Пункт для обговорення:** Чому ці шаблони важливі для AI

- **Залежності сервісів:** AI-додатки часто потребують кількох скоординованих сервісів
- **Безпека:** Ключі API та кінцеві точки потребують захищеного управління
- **Масштабованість:** AI-навантаження мають унікальні вимоги до масштабування
- **Керування витратами:** AI-сервіси можуть бути дорогими без належної конфігурації

## Модуль 2: Розгортання першого AI-додатка

### Крок 2.1: Ініціалізація середовища

1. **Створіть нове середовище AZD:**
```bash
azd env new myai-workshop
```

2. **Встановіть необхідні параметри:**
```bash
# Встановіть ваш бажаний регіон Azure
azd env set AZURE_LOCATION eastus

# Необов’язково: Встановіть конкретну модель OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Крок 2.2: Розгортання інфраструктури та додатка

1. **Розгорніть за допомогою AZD:**
```bash
azd up
```

**Що відбувається під час `azd up`:**
- ✅ Провадиться сервіс Microsoft Foundry Models
- ✅ Створюється сервіс Azure AI Search
- ✅ Налаштовується App Service для веб-додатка
- ✅ Конфігуруються мережа та безпека
- ✅ Розгортається код додатка
- ✅ Налаштовується моніторинг і логування

2. **Слідкуйте за ходом розгортання** і звертайте увагу на створювані ресурси.

### Крок 2.3: Перевірка розгортання

1. **Перевірте розгорнуті ресурси:**
```bash
azd show
```

2. **Відкрийте розгорнутий додаток:**
```bash
azd show
```

Відкрийте веб-ендпоінт, показаний у виводі `azd show`.

3. **Перевірте AI-функціональність:**
   - Перейдіть до веб-додатка
   - Спробуйте демонстраційні запити
   - Переконайтеся, що AI відповідає правильно

### **Лабораторне завдання 2.1: Практика усунення несправностей**

**Сценарій:** Ваше розгортання вдалося, але AI не відповідає.

**Поширені проблеми для перевірки:**
1. **API-ключі OpenAI:** Перевірте, що вони правильно налаштовані
2. **Доступність моделі:** Переконайтеся, що регіон підтримує модель
3. **Мережева доступність:** Перевірте зв’язок між сервісами
4. **Права RBAC:** Переконайтеся, що додаток має доступ до OpenAI

**Команди для відладки:**
```bash
# Перевірте змінні середовища
azd env get-values

# Переглянути журнали розгортання
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Перевірити стан розгортання OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Модуль 3: Налаштування AI-додатків під ваші потреби

### Крок 3.1: Зміна AI-конфігурації

1. **Оновіть модель OpenAI:**
```bash
# Змініть на іншу модель (якщо вона доступна у вашому регіоні)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Розгорніть з новою конфігурацією
azd deploy
```

2. **Додайте додаткові AI-сервіси:**

Відредагуйте `infra/main.bicep` для додавання Document Intelligence:

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

### Крок 3.2: Конфігурації для різних середовищ

**Краща практика:** Окремі конфігурації для розробки і продуктиву.

1. **Створіть продуктивне середовище:**
```bash
azd env new myai-production
```

2. **Встановіть параметри для продуктивного середовища:**
```bash
# У виробництві зазвичай використовуються вищі SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Увімкнути додаткові функції безпеки
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Лабораторне завдання 3.1: Оптимізація витрат**

**Завдання:** Налаштувати шаблон для економічної розробки.

**Завдання:**
1. Визначити, які SKU можна встановити у безкоштовні/базові рівні
2. Налаштувати змінні оточення для мінімальних витрат
3. Розгорнути і порівняти витрати з продуктивною конфігурацією

**Підказки щодо рішень:**
- Використовуйте рівень F0 (безкоштовний) для Azure AI Services, де можливо
- Використовуйте базовий рівень для Search Service під час розробки
- Розгляньте використання плану споживання для функцій

## Модуль 4: Безпека та кращі практики для продуктиву

### Крок 4.1: Безпечне управління обліковими даними

**Поточна проблема:** Багато AI-додатків використовують захардкоджені API-ключі або небезпечне сховище.

**Рішення AZD:** Managed Identity + інтеграція з Key Vault.

1. **Перегляньте налаштування безпеки у вашому шаблоні:**
```bash
# Шукайте конфігурацію Key Vault і керованої ідентичності
grep -r "keyVault\|managedIdentity" infra/
```

2. **Перевірте роботу Managed Identity:**
```bash
# Перевірте, чи веб-додаток має правильну конфігурацію ідентичності
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Крок 4.2: Мережева безпека

1. **Увімкніть приватні кінцеві точки** (якщо ще не налаштовано):

Додайте до свого біпс-шаблону:
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

### Крок 4.3: Моніторинг і спостереження

1. **Налаштуйте Application Insights:**
```bash
# Application Insights має бути налаштований автоматично
# Перевірте конфігурацію:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Додайте AI-специфічний моніторинг:**

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

### **Лабораторне завдання 4.1: Аудит безпеки**

**Завдання:** Перегляньте своє розгортання щодо кращих практик безпеки.

**Контрольний список:**
- [ ] В коді чи конфігурації немає захардкоджених секретів
- [ ] Використовується Managed Identity для аутентифікації між сервісами
- [ ] Key Vault зберігає чутливу конфігурацію
- [ ] Мережевий доступ налаштовано правильно
- [ ] Увімкнено моніторинг та логування

## Модуль 5: Перетворення власного AI-додатка

### Крок 5.1: Анкета оцінки

**Перед перетворенням вашого додатка** дайте відповіді на ці питання:

1. **Архітектура додатка:**
   - Які AI-сервіси використовує ваш додаток?
   - Які обчислювальні ресурси потрібні?
   - Чи потрібна база даних?
   - Які залежності між сервісами?

2. **Вимоги до безпеки:**
   - Які чутливі дані обробляє додаток?
   - Які вимоги щодо відповідності?
   - Чи потрібна приватна мережа?

3. **Вимоги до масштабування:**
   - Яке очікуване навантаження?
   - Чи потрібне автоскейлинг?
   - Чи є регіональні вимоги?

### Крок 5.2: Створення AZD-шаблону

**Слідуйте цій схемі для перетворення додатка:**

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

### **Лабораторне завдання 5.1: Виклик на створення шаблону**

**Завдання:** Створіть AZD-шаблон для AI-додатка з обробки документів.

**Вимоги:**
- Microsoft Foundry Models для аналізу контенту
- Document Intelligence для OCR
- Аккаунт зберігання для завантаження документів
- Function App для обробки логіки
- Веб-додаток для інтерфейсу користувача

**Бонусні бали:**
- Додайте належне оброблення помилок
- Включіть оцінку вартості
- Налаштуйте інформаційні панелі моніторингу

## Модуль 6: Усунення поширених проблем

### Поширені проблеми розгортання

#### Проблема 1: Перевищено квоту сервісу OpenAI
**Прояви:** Розгортання завершується помилкою квоти  
**Рішення:**
```bash
# Перевірте поточні квоти
az cognitiveservices usage list --location eastus

# Запросіть збільшення квоти або спробуйте інший регіон
azd env set AZURE_LOCATION westus2
azd up
```

#### Проблема 2: Модель недоступна в регіоні
**Прояви:** Помилки AI або розгортання моделі  
**Рішення:**
```bash
# Перевірити наявність моделі за регіоном
az cognitiveservices model list --location eastus

# Оновити до доступної моделі
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Проблема 3: Проблеми з правами доступу
**Прояви:** Помилки 403 Forbidden при зверненні до AI-сервісів  
**Рішення:**
```bash
# Перевірити призначення ролей
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Додати відсутні ролі
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Проблеми з продуктивністю

#### Проблема 4: Повільні відповіді AI
**Кроки для дослідження:**
1. Перевірте показники продуктивності у Application Insights
2. Перегляньте метрики OpenAI у порталі Azure
3. Переконайтеся в стабільності мережевого з’єднання та затримках

**Рішення:**
- Впровадити кешування для частих запитів
- Використовувати відповідну модель OpenAI для вашого випадку
- Розглянути використання реплік для високого навантаження

### **Лабораторне завдання 6.1: Виклик на налагодження**

**Сценарій:** Ваше розгортання пройшло успішно, але додаток повертає помилки 500.

**Завдання з налагодження:**
1. Перевірити журнали додатка
2. Переконатися у зв’язку сервісів
3. Перевірити автентифікацію
4. Переглянути конфігурацію

**Інструменти для використання:**
- `azd show` для огляду розгортання
- Портал Azure для детальних журналів сервісів
- Application Insights для телеметрії додатка

## Модуль 7: Моніторинг і оптимізація

### Крок 7.1: Налаштування комплексного моніторингу

1. **Створіть користувацькі інформаційні панелі:**

Перейдіть у портал Azure і створіть панель із:
- Кількість запитів і затримка OpenAI
- Рівень помилок додатка
- Використання ресурсів
- Відстеження витрат

2. **Налаштуйте сповіщення:**
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

1. **Проаналізуйте поточні витрати:**
```bash
# Використовуйте Azure CLI для отримання даних про витрати
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Впровадьте механізми контролю витрат:**
- Встановіть оповіщення бюджету
- Використовуйте політики автоскейлінгу
- Впровадьте кешування запитів
- Моніторьте використання токенів OpenAI

### **Лабораторне завдання 7.1: Оптимізація продуктивності**

**Завдання:** Оптимізуйте AI-додаток за продуктивністю і витратами.

**Метрики для покращення:**
- Скоротити середній час відповіді на 20%
- Зменшити щомісячні витрати на 15%
- Підтримувати 99.9% часу безвідмовної роботи

**Стратегії для спроб:**
- Впровадити кешування відповідей
- Оптимізувати запити для економії токенів
- Використовувати відповідні SKU обчислень
- Налаштувати правильний автоскейлінг

## Фінальний виклик: Повномасштабна реалізація

### Сценарій виклику

Вам доручено створити готового до виробництва чатбота для обслуговування клієнтів на базі AI з такими вимогами:

**Функціональні вимоги:**
- Веб-інтерфейс для взаємодії з клієнтами
- Інтеграція з Microsoft Foundry Models для відповідей
- Можливість пошуку документів за допомогою Azure AI Search
- Інтеграція з існуючою базою клієнтів
- Підтримка кількох мов

**Нефункціональні вимоги:**
- Обробка 1000 одночасних користувачів
- SLA 99.9% часу роботи
- Відповідність стандарту SOC 2
- Вартість менше $500 на місяць
- Розгортання у кількох середовищах (dev, staging, prod)

### Кроки реалізації

1. **Спроектувати архітектуру**
2. **Створити AZD-шаблон**
3. **Впровадити заходи безпеки**
4. **Налаштувати моніторинг та оповіщення**
5. **Створити конвеєри деплойменту**
6. **Задокументувати рішення**

### Критерії оцінки

- ✅ **Функціональність:** Чи відповідає усім вимогам?
- ✅ **Безпека:** Чи застосовані кращі практики?
- ✅ **Масштабованість:** Чи витримує навантаження?
- ✅ **Підтримуваність:** Чи добре організований код і інфраструктура?
- ✅ **Вартість:** Чи не перевищує бюджет?

## Додаткові ресурси

### Документація Microsoft
- [Документація Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Документація сервісу Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Документація Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Приклади шаблонів
- [Чат-додаток Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Швидкий старт OpenAI Chat App](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ресурси спільноти
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Сертифікат про завершення

Вітаємо! Ви завершили лабораторію AI Workshop. Тепер ви повинні вміти:

- ✅ Конвертувати існуючі AI-застосунки у шаблони AZD
- ✅ Розгортати AI-застосунки, готові до продуктивного використання
- ✅ Реалізовувати найкращі практики безпеки для AI-навантажень
- ✅ Моніторити та оптимізувати продуктивність AI-застосунків
- ✅ Вирішувати поширені проблеми під час розгортання

### Наступні кроки
1. Застосуйте ці патерни у власних AI-проєктах
2. Внесіть свої шаблони до спільноти
3. Приєднуйтесь до Microsoft Foundry Discord для постійної підтримки
4. Вивчайте розширені теми, такі як розгортання в кількох регіонах

---

**Відгук про Workshop**: Допоможіть нам покращити цей воркшоп, поділившись своїм досвідом у [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Навігація розділами:**
- **📚 Домашня сторінка курсу**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - AI-First Development
- **⬅️ Попередній**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Наступний**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Наступний розділ**: [Розділ 3: Configuration](../chapter-03-configuration/configuration.md)

**Потрібна допомога?** Приєднуйтесь до нашої спільноти для підтримки та обговорень про AZD та AI-розгортання.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->