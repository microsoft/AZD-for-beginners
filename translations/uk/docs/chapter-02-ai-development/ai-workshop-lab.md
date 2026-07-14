# Лабораторія AI: Як зробити ваші AI-рішення AZD-розгортуваними

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка з пріоритетом AI
- **⬅️ Попередній**: [Розгортання AI моделей](ai-model-deployment.md)
- **➡️ Наступний**: [Кращі практики виробничого AI](production-ai-practices.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

## Огляд лабораторії

Ця практична лабораторія допомагає розробникам пройти процес взяття існуючого AI-шаблону та його розгортання за допомогою Azure Developer CLI (AZD). Ви вивчите основні шаблони для розгортання виробничих AI-застосунків із використанням сервісів Microsoft Foundry.

> **Примітка щодо валідації (2026-07-13):** Ця лабораторія була протестована з `azd` `1.27.1`. Якщо у вас встановлена старіша версія, оновіть AZD перед початком, щоб процес аутентифікації, шаблонів і розгортання відповідав наведеним нижче крокам.

**Тривалість:** 2-3 години  
**Рівень:** Середній  
**Попередні знання:** Базові знання Azure, знайомство з поняттями AI/ML

## 🎓 Освітні цілі

Наприкінці цієї лабораторії ви зможете:
- ✅ Конвертувати існуючий AI-застосунок для використання шаблонів AZD
- ✅ Налаштувати сервіси Microsoft Foundry за допомогою AZD
- ✅ Реалізувати безпечне управління обліковими даними для AI-сервісів
- ✅ Розгорнути AI застосунки, готові до виробничого використання, з моніторингом
- ✅ Вирішувати типові проблеми розгортання AI

## Попередні вимоги

### Необхідні інструменти
- Встановлений [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Встановлений [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Встановлений [Git](https://git-scm.com/)
- Редактор коду (рекомендується VS Code)

### Ресурси Azure
- Підписка Azure з правами учасника (contributor)
- Доступ до сервісів Microsoft Foundry Models (або можливість запросити доступ)
- Дозволи на створення ресурсних груп

### Попередні знання
- Базове розуміння сервісів Azure
- Знайомство з командним рядком
- Основи AI/ML (API, моделі, підказки)

## Налаштування лабораторії

### Крок 1: Підготовка оточення

1. **Перевірте встановлення інструментів:**
```bash
# Перевірте встановлення AZD
azd version

# Перевірте Azure CLI
az --version

# Вхід в Azure для робочих процесів AZD
azd auth login

# Увійдіть у Azure CLI лише якщо плануєте запускати команди az під час діагностики
az login
```

Якщо ви працюєте з кількома орендарями або ваша підписка не визначається автоматично, повторіть команду з `azd auth login --tenant-id <tenant-id>`.

2. **Клонуйте репозиторій лабораторії:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Модуль 1: Розуміння структури AZD для AI-застосунків

### Анатомія AI шаблону AZD

Ознайомтеся з ключовими файлами AI-орієнтованого шаблону AZD:

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

### **Практичне завдання 1.1: Дослідження конфігурації**

1. **Огляньте файл azure.yaml:**
```bash
cat azure.yaml
```

**На що звернути увагу:**
- Визначення сервісів для AI компонентів
- Відповідність змінних середовища
- Налаштування хостів

2. **Перегляньте основний інфраструктурний main.bicep:**
```bash
cat infra/main.bicep
```

**Важливі AI шаблони для ідентифікації:**
- Забезпечення сервісу Microsoft Foundry Models
- Інтеграція Azure AI Search
- Безпечне управління ключами
- Налаштування мережевої безпеки

### **Обговорення:** Чому ці шаблони важливі для AI

- **Залежності сервісів**: AI застосунки часто потребують координації кількох сервісів
- **Безпека**: API ключі та кінцеві точки мають бути захищені
- **Масштабованість**: AI навантаження мають особливі вимоги до масштабування
- **Управління витратами**: AI сервіси можуть бути дорогими без правильного налаштування

## Модуль 2: Розгортання вашого першого AI-застосунку

### Крок 2.1: Ініціалізація оточення

1. **Створіть нове оточення AZD:**
```bash
azd env new myai-workshop
```

2. **Встановіть необхідні параметри:**
```bash
# Встановіть бажаний регіон Azure
azd env set AZURE_LOCATION eastus

# Необов’язково: Встановіть конкретну модель OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Крок 2.2: Розгортання інфраструктури та застосунку

1. **Розгорніть за допомогою AZD:**
```bash
azd up
```

**Що відбувається під час `azd up`:**
- ✅ Пропонує сервіс Microsoft Foundry Models
- ✅ Створює сервіс Azure AI Search
- ✅ Налаштовує App Service для веб-застосунку
- ✅ Налаштовує мережу та безпеку
- ✅ Розгортає код застосунку
- ✅ Налаштовує моніторинг та логування

2. **Спостерігайте за прогресом розгортання** і зверніть увагу на створювані ресурси.

### Крок 2.3: Перевірка вашого розгортання

1. **Перевірте створені ресурси:**
```bash
azd show
```

2. **Відкрийте розгорнутий застосунок:**
```bash
azd show
```

Відкрийте веб-адресу, показану в виводі `azd show`.

3. **Перевірте функціональність AI:**
   - Перейдіть до веб-застосунку
   - Спробуйте тестові запити
   - Переконайтеся, що відповіді AI працюють

### **Практичне завдання 2.1: Відпрацювання усунення несправностей**

**Сценарій**: Розгортання успішне, але AI не відповідає.

**Поширені проблеми для перевірки:**
1. **API ключі OpenAI**: Перевірте правильність налаштувань
2. **Доступність моделі**: Переконайтеся, що ваш регіон підтримує модель
3. **Мережева доступність**: Переконайтеся, що сервіси можуть взаємодіяти
4. **Права RBAC**: Переконайтеся, що застосунок має доступ до OpenAI

**Команди для налагодження:**
```bash
# Перевірити змінні середовища
azd env get-values

# Переглянути журнали розгортання
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Перевірити стан розгортання OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Модуль 3: Налаштування AI-застосунків під ваші потреби

### Крок 3.1: Зміна конфігурації AI

1. **Оновіть модель OpenAI:**
```bash
# Змініть на іншу модель (якщо доступна у вашому регіоні)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Перезапустіть з новою конфігурацією
azd deploy
```

2. **Додайте додаткові AI сервіси:**

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

### Крок 3.2: Конфігурації для конкретного оточення

**Найкраща практика**: різні конфігурації для розробки і виробництва.

1. **Створіть виробниче оточення:**
```bash
azd env new myai-production
```

2. **Встановіть параметри, специфічні для виробництва:**
```bash
# Виробництво зазвичай використовує більш високі SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Увімкнути додаткові функції безпеки
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Практичне завдання 3.1: Оптимізація витрат**

**Завдання**: Налаштуйте шаблон для економного розвитку.

**Задачі:**
1. Визначте, які SKU можна встановити на безкоштовний/базовий рівень
2. Налаштуйте змінні середовища для мінімальних витрат
3. Розгорніть і порівняйте витрати з виробничою конфігурацією

**Підказки:**
- Використовуйте рівень F0 (безкоштовний) для Azure AI Services, коли можливо
- Використовуйте базовий рівень для Search Service у розробці
- Розглянете використання плану Consumption для Functions

## Модуль 4: Безпека та виробничі кращі практики

### Крок 4.1: Безпечне управління обліковими даними

**Поточна проблема**: Багато AI-застосунків жорстко кодують API ключі або використовують небезпечне зберігання.

**Рішення AZD**: інтеграція Managed Identity + Key Vault.

1. **Перегляньте конфігурацію безпеки у вашому шаблоні:**
```bash
# Шукайте налаштування Key Vault і Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Перевірте роботу Managed Identity:**
```bash
# Перевірте, чи веб-додаток має правильну конфігурацію ідентичності
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Крок 4.2: Мережева безпека

1. **Увімкніть приватні кінцеві точки** (якщо ще не налаштовано):

Додайте до шаблону bicep:
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

### Крок 4.3: Моніторинг та видимість

1. **Налаштуйте Application Insights:**
```bash
# Application Insights має бути налаштовано автоматично
# Перевірте конфігурацію:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Встановіть AI-специфічний моніторинг:**

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

**Завдання**: Перегляньте розгортання з погляду безпеки.

**Контрольний список:**
- [ ] Відсутність жорстко зашитих секретів у коді чи конфігурації
- [ ] Використання Managed Identity для аутентифікації сервісів
- [ ] Зберігання чутливої конфігурації у Key Vault
- [ ] Мережевий доступ правильно обмежений
- [ ] Увімкнено моніторинг та логування

## Модуль 5: Конвертація власного AI-застосунку

### Крок 5.1: Оцінювальна анкета

**Перед конвертацією вашого застосунку, відповідайте на ці питання:**

1. **Архітектура застосунку:**
   - Які AI-сервіси використовує ваш застосунок?
   - Які обчислювальні ресурси потрібні?
   - Чи потрібна база даних?
   - Які є залежності між сервісами?

2. **Вимоги безпеки:**
   - Які чутливі дані обробляє ваш застосунок?
   - Які вимоги відповідності потрібно дотримуватися?
   - Чи потрібна приватна мережа?

3. **Вимоги до масштабування:**
   - Яке очікуване навантаження?
   - Чи потрібне автоматичне масштабування?
   - Чи є регіональні вимоги?

### Крок 5.2: Створення вашого AZD-шаблону

**Слідкуйте за цим шаблоном при конвертації застосунку:**

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

**Завдання:** Створіть AZD-шаблон для AI застосунку обробки документів.

**Вимоги:**
- Microsoft Foundry Models для аналізу контенту
- Document Intelligence для OCR
- Обліковий запис сховища для завантажень документів
- Function App для логіки обробки
- Веб-застосунок для інтерфейсу користувача

**Бонусні бали:**
- Додайте коректну обробку помилок
- Включіть оцінку вартості
- Встановіть панелі моніторингу

## Модуль 6: Усунення типових проблем

### Типові проблеми розгортання

#### Проблема 1: Перевищення квоти сервісу OpenAI
**Симптоми:** Розгортання не вдається через помилку квоти
**Рішення:**
```bash
# Перевірте поточні квоти
az cognitiveservices usage list --location eastus

# Запросіть збільшення квоти або спробуйте інший регіон
azd env set AZURE_LOCATION westus2
azd up
```

#### Проблема 2: Модель недоступна у регіоні
**Симптоми:** Помилки відповіді AI або розгортання моделі
**Рішення:**
```bash
# Перевірте наявність моделі за регіоном
az cognitiveservices model list --location eastus

# Оновити до доступної моделі
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Проблема 3: Проблеми з дозволами
**Симптоми:** Помилки 403 Forbidden при виклику AI-сервісів
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

#### Проблема 4: Повільна відповідь AI
**Кроки розслідування:**
1. Перевірте метрики продуктивності в Application Insights
2. Перегляньте метрики сервісу OpenAI у порталі Azure
3. Перевірте мережеву доступність і затримки

**Рішення:**
- Впровадьте кешування для частих запитів
- Використовуйте відповідну модель OpenAI для вашого сценарію
- Розгляньте використання реплік для високого навантаження

### **Практичне завдання 6.1: Виклик на налагодження**

**Сценарій:** Розгортання вдалося, але застосунок повертає помилки 500.

**Задачі для налагодження:**
1. Перевірте журнали застосунку
2. Перевірте підключення сервісів
3. Перевірте аутентифікацію
4. Перегляньте конфігурацію

**Інструменти:**
- `azd show` для огляду розгортання
- Портал Azure для детальних журналів сервісів
- Application Insights для телеметрії застосунку

## Модуль 7: Моніторинг та оптимізація

### Крок 7.1: Налаштування комплексного моніторингу

1. **Створіть кастомні панелі:**

Перейдіть у портал Azure і створіть панель з:
- Кількістю запитів і затримкою OpenAI
- Показниками помилок застосунку
- Використанням ресурсів
- Відстеженням витрат

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

2. **Запровадьте контроль за витратами:**
- Налаштуйте оповіщення по бюджету
- Використовуйте політики автоскейлінгу
- Впровадьте кешування запитів
- Моніторьте використання токенів для OpenAI

### **Практичне завдання 7.1: Оптимізація продуктивності**

**Завдання:** Оптимізуйте AI-застосунок для продуктивності та вартості.

**Показники для покращення:**
- Скоротити середній час відповіді на 20%
- Зменшити місячні витрати на 15%
- Забезпечити 99.9% часу безвідмовної роботи

**Стратегії для спроб:**
- Впровадити кешування відповідей
- Оптимізувати підказки для ефективного використання токенів
- Використовувати відповідні обчислювальні SKU
- Налаштувати коректне автоскейлінг

## Підсумковий виклик: Реалізація крок за кроком

### Сценарій виклику

Вам доручено створити виробничого чатбота для обслуговування клієнтів на основі AI з такими вимогами:

**Функціональні вимоги:**
- Веб-інтерфейс для взаємодії з клієнтами
- Інтеграція з Microsoft Foundry Models для відповідей
- Пошук документів за допомогою Azure AI Search
- Інтеграція з існуючою базою даних клієнтів
- Підтримка кількох мов

**Нефункціональні вимоги:**
- Обслуговування 1000 одночасних користувачів
- SLA 99.9% безвідмовності
- Відповідність SOC 2
- Вартість менше $500 на місяць
- Розгортання в кількох оточеннях (розробка, тестування, виробництво)

### Кроки реалізації

1. **Спроектувати архітектуру**
2. **Створити AZD-шаблон**
3. **Реалізувати заходи безпеки**
4. **Налаштувати моніторинг та оповіщення**
5. **Створити пайплайни розгортання**
6. **Задокументувати рішення**

### Критерії оцінки

- ✅ **Функціональність**: Чи відповідає всім вимогам?
- ✅ **Безпека**: Чи впроваджені кращі практики?
- ✅ **Масштабованість**: Чи витримує навантаження?
- ✅ **Підтримуваність**: Чи добре організований код та інфраструктура?
- ✅ **Вартість**: Чи укладається у бюджет?

## Додаткові ресурси

### Документація Microsoft
- [Документація Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Документація Microsoft Foundry Models Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Документація Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Приклади шаблонів
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ресурсі спільноти
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Сертифікат про завершення

Вітаємо! Ви закінчили лабораторію AI Workshop. Тепер ви маєте вміти:

- ✅ Перетворювати існуючі AI-застосунки на AZD шаблони
- ✅ Розгортати AI-застосунки, готові до продуктивної експлуатації
- ✅ Впроваджувати найкращі практики безпеки для AI-навантажень
- ✅ Моніторити та оптимізувати продуктивність AI-застосунків
- ✅ Усувати поширені проблеми розгортання

### Наступні кроки
1. Застосувати ці шаблони у своїх AI-проєктах
2. Внести свої шаблони для спільноти
3. Приєднатися до Microsoft Foundry Discord для постійної підтримки
4. Вивчати просунуті теми, як-от розгортання у кількох регіонах

---

**Відгук про лабораторію**: Допоможіть нам покращити цю лабораторію, поділившись досвідом у [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка з навантаженням на AI
- **⬅️ Попередній**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Наступний**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

**Потрібна допомога?** Приєднуйтесь до нашої спільноти для підтримки та обговорень щодо AZD та розгортань AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->