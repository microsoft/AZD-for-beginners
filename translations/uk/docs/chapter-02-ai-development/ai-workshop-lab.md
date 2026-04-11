# Лабораторія AI Workshop: Робота з розгортанням AI-рішень за допомогою AZD

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - AI-first розробка
- **⬅️ Попередній**: [Розгортання AI моделей](ai-model-deployment.md)
- **➡️ Наступний**: [Кращі практики для продуктивного AI](production-ai-practices.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

## Огляд лабораторії

Ця практична лабораторія проведе розробників через процес взяття існуючого AI шаблону та розгортання його за допомогою Azure Developer CLI (AZD). Ви навчитеся основним шаблонам для розгортання AI у виробництві з використанням сервісів Microsoft Foundry.

> **Примітка валідації (2026-03-25):** Ця лабораторія була протестована на `azd` версії `1.23.12`. Якщо у вас встановлена старіша версія, оновіть AZD перед початком, щоб автентифікація, шаблони та процес розгортання відповідали нижчеприведеним крокам.

**Тривалість:** 2-3 години  
**Рівень:** Середній  
**Попередні знання:** Базове знання Azure, знайомство з основами AI/ML

## 🎓 Навчальні цілі

Після завершення цієї лабораторії ви зможете:
- ✅ Конвертувати існуючий AI застосунок для використання шаблонів AZD
- ✅ Налаштовувати сервіси Microsoft Foundry за допомогою AZD
- ✅ Впроваджувати безпечне керування обліковими даними для AI сервісів
- ✅ Розгортати AI застосунки, готові до виробництва, з моніторингом
- ✅ Виправляти типові проблеми при розгортанні AI

## Попередні умови

### Необхідні інструменти
- Встановлений [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Встановлений [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Встановлений [Git](https://git-scm.com/)
- Редактор коду (рекомендується VS Code)

### Ресурси Azure
- Підписка Azure з правами учасника (contributor)
- Доступ до сервісів Microsoft Foundry Models (або можливість запитати доступ)
- Права на створення груп ресурсів

### Необхідні знання
- Базове розуміння сервісів Azure
- Вміння працювати з командним рядком
- Базові поняття AI/ML (API, моделі, підказки)

## Налаштування лабораторії

### Крок 1: Підготовка оточення

1. **Перевірка встановлених інструментів:**
```bash
# Перевірити встановлення AZD
azd version

# Перевірити Azure CLI
az --version

# Увійти в Azure для робочих процесів AZD
azd auth login

# Увійти в Azure CLI лише якщо плануєте виконувати команди az під час діагностики
az login
```

Якщо ви працюєте з кількома орендарями або підписку не виявлено автоматично, повторіть команду з `azd auth login --tenant-id <tenant-id>`.

2. **Клонування репозиторію лабораторії:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Модуль 1: Розуміння структури AZD для AI-застосунків

### Анатомія AI AZD шаблону

Ознайомтеся з основними файлами AI-ready AZD шаблону:

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

### **Лабораторне завдання 1.1: Дослідження конфігурації**

1. **Перегляд файлу azure.yaml:**
```bash
cat azure.yaml
```

**На що звернути увагу:**
- Визначення сервісів для AI компонентів
- Відповідність змінних оточення (environment variables)
- Налаштування хосту

2. **Огляд main.bicep інфраструктури:**
```bash
cat infra/main.bicep
```

**Ключові AI шаблони для ідентифікації:**
- Влаштування сервісу Microsoft Foundry Models
- Інтеграція Cognitive Search
- Безпечне керування ключами
- Налаштування безпеки мережі

### **Дискусійна тема:** Чому ці шаблони важливі для AI

- **Залежності сервісів:** AI застосунки часто потребують координації кількох сервісів
- **Безпека:** API ключі та кінцеві точки потрібно надійно зберігати
- **Масштабованість:** AI навантаження мають унікальні вимоги до масштабу
- **Управління витратами:** AI сервіси можуть бути дорогими, якщо неправильно налаштовані

## Модуль 2: Розгортання вашого першого AI застосунку

### Крок 2.1: Ініціалізація оточення

1. **Створіть нове AZD оточення:**
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

### Крок 2.2: Розгортання інфраструктури та застосунку

1. **Розгорніть за допомогою AZD:**
```bash
azd up
```

**Що відбувається під час `azd up`:**
- ✅ Проводиться розгортання сервісу Microsoft Foundry Models
- ✅ Створюється сервіс Cognitive Search
- ✅ Налаштовується App Service для веб-застосунку
- ✅ Конфігуруються мережеві та безпекові налаштування
- ✅ Розгортається код застосунку
- ✅ Налаштовується моніторинг та логування

2. **Слідкуйте за процесом розгортання** та звертайте увагу на створювані ресурси.

### Крок 2.3: Перевірка розгортання

1. **Перевірте створені ресурси:**
```bash
azd show
```

2. **Відкрийте розгорнутий застосунок:**
```bash
azd show
```

Відкрийте веб-мітку (endpoint), показану у виводі `azd show`.

3. **Перевірте AI функціональність:**
   - Перейдіть на веб-застосунок
   - Спробуйте тестові запити
   - Підтвердіть роботу AI відповідей

### **Лабораторне завдання 2.1: Практика усунення неполадок**

**Сценарій**: Розгортання пройшло успішно, але AI не відповідає.

**Типові проблеми для перевірки:**
1. **API ключі OpenAI:** Переконайтеся, що вони задані правильно
2. **Доступність моделей:** Перевірте, чи підтримує ваш регіон потрібну модель
3. **Мережеве з’єднання:** Переконайтеся, що сервіси можуть зв’язуватись між собою
4. **Права RBAC:** Переконайтеся, що застосунок має доступ до OpenAI

**Команди для налагодження:**
```bash
# Перевірити змінні оточення
azd env get-values

# Переглянути журнали розгортання
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Перевірити стан розгортання OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Модуль 3: Налаштування AI-застосунків під ваші потреби

### Крок 3.1: Зміна AI конфігурації

1. **Оновіть модель OpenAI:**
```bash
# Змінити на іншу модель (якщо доступно у вашому регіоні)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Заново розгорнути з новою конфігурацією
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

### Крок 3.2: Конфігурації, специфічні для оточення

**Краща практика:** Різні конфігурації для розробки та продакшену.

1. **Створіть продакшен оточення:**
```bash
azd env new myai-production
```

2. **Встановіть параметри для продакшену:**
```bash
# У виробництві зазвичай використовуються більш високі SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Увімкнути додаткові функції безпеки
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Лабораторне завдання 3.1: Оптимізація витрат**

**Завдання:** Налаштуйте шаблон для економічного розвитку.

**Завдання:**
1. Визначте, які SKU можна встановити в безкоштовний/базовий рівень
2. Налаштуйте змінні оточення для мінімальних витрат
3. Розгорніть та порівняйте витрати з продакшен конфігурацією

**Підказки:**
- Використовуйте рівень F0 (безкоштовний) для Cognitive Services, якщо можливо
- Використовуйте базовий рівень для Search Service у розробці
- Розгляньте використання плану Consumption для Functions

## Модуль 4: Безпека та кращі практики продакшену

### Крок 4.1: Безпечне керування обліковими даними

**Поточна проблема:** Багато AI додатків хардкодять API ключі або зберігають їх ненадійно.

**Рішення AZD:** Managed Identity + інтеграція з Key Vault.

1. **Огляньте конфігурацію безпеки вашого шаблону:**
```bash
# Шукайте конфігурацію Key Vault та Керованої Ідентичності
grep -r "keyVault\|managedIdentity" infra/
```

2. **Перевірте, чи працює Managed Identity:**
```bash
# Перевірте, чи веб-додаток має правильну конфігурацію ідентичності
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Крок 4.2: Мережева безпека

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

### Крок 4.3: Моніторинг та спостережуваність

1. **Налаштуйте Application Insights:**
```bash
# Application Insights має бути налаштований автоматично
# Перевірте конфігурацію:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Налаштування моніторингу AI:**

Додайте кастомні метрики для AI операцій:
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

**Завдання:** Проведіть аудит свого розгортання на предмет кращих практик безпеки.

**Чеклист:**
- [ ] В коді або конфігурації немає хардкоджених секретів
- [ ] Використовується Managed Identity для автентифікації між сервісами
- [ ] Key Vault використовується для зберігання чутливої конфігурації
- [ ] Мережевий доступ належним чином обмежений
- [ ] Увімкнені моніторинг та логування

## Модуль 5: Конвертація вашого AI застосунку

### Крок 5.1: Робочий лист оцінки

**Перед конвертацією вашого застосунку**, дайте відповіді на такі питання:

1. **Архітектура застосунку:**
   - Які AI сервіси використовує ваш застосунок?
   - Які обчислювальні ресурси потрібні?
   - Чи потрібна база даних?
   - Які залежності між сервісами?

2. **Вимоги до безпеки:**
   - Які чутливі дані обробляє ваш застосунок?
   - Які вимоги до відповідності стандартам є?
   - Чи потрібна приватна мережа?

3. **Вимоги до масштабування:**
   - Яке очікуване навантаження?
   - Чи потрібне автмасштабування?
   - Чи є регіональні обмеження?

### Крок 5.2: Створення вашого AZD шаблону

**Дотримуйтесь цього шаблону для конвертації вашого застосунку:**

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

**infra/main.bicep** - основний шаблон:
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

**infra/modules/openai.bicep** - модуль OpenAI:
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

**Завдання:** Створіть AZD шаблон для AI застосунку обробки документів.

**Вимоги:**
- Microsoft Foundry Models для аналізу контенту
- Document Intelligence для OCR
- Обліковий запис зберігання для завантаження документів
- Функція App для обробки логіки
- Веб-застосунок для інтерфейсу користувача

**Бонусні бали:**
- Додайте правильне оброблення помилок
- Включіть оцінку вартості
- Налаштуйте інформаційні панелі моніторингу

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

#### Проблема 2: Модель недоступна в регіоні  
**Симптоми:** Відповіді AI не надходять або помилки розгортання моделей  
**Рішення:**  
```bash
# Перевірити доступність моделі за регіоном
az cognitiveservices model list --location eastus

# Оновити до доступної моделі
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Проблема 3: Проблеми з правами доступу  
**Симптоми:** Помилки 403 Forbidden при викликах AI сервісів  
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
**Кроки розслідування:**
1. Перевірте Application Insights на метрики продуктивності
2. Перегляньте метрики сервісу OpenAI у порталі Azure
3. Перевірте мережеве з’єднання та затримки

**Рішення:**
- Впровадьте кешування для типових запитів
- Використовуйте відповідну модель OpenAI для вашого кейсу
- Розгляньте використання read replicas при великому навантаженні

### **Лабораторне завдання 6.1: Виклик на налагодження**

**Сценарій:** Розгортання пройшло успішно, але застосунок повертає помилки 500.

**Задачі налагодження:**
1. Перевірити логи застосунку
2. Перевірити з’єднання з сервісом
3. Протестувати автентифікацію
4. Оглянути конфігурацію

**Інструменти:**
- `azd show` для огляду стану розгортання
- Портал Azure для детальних логів сервісів
- Application Insights для телеметрії застосунку

## Модуль 7: Моніторинг та оптимізація

### Крок 7.1: Встановлення комплексного моніторингу

1. **Створіть кастомні інформаційні панелі:**

Перейдіть у портал Azure та створіть панель з:
- Кількість запитів та затримка OpenAI
- Рівень помилок застосунку
- Використання ресурсів
- Відстеження вартості

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

### Крок 7.2: Оптимізація вартості

1. **Аналізуйте поточні витрати:**
```bash
# Використовуйте Azure CLI для отримання даних про вартість
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Впроваджуйте контроль витрат:**
- Налаштуйте попередження бюджету
- Використовуйте політику автмасштабування
- Впровадьте кешування запитів
- Моніторте використання токенів OpenAI

### **Лабораторне завдання 7.1: Оптимізація продуктивності**

**Завдання:** Оптимізуйте AI застосунок з урахуванням продуктивності та вартості.

**Метрики для покращення:**
- Скоротити середній час відповіді на 20%
- Зменшити місячні витрати на 15%
- Підтримувати 99.9% часу безвідмовної роботи

**Стратегії для спроби:**
- Впровадити кешування відповідей
- Оптимізувати підказки для економії токенів
- Використовувати відповідні SKU обчислювальних ресурсів
- Налаштувати правильне автмасштабування

## Фінальне завдання: Повноцінна реалізація

### Сценарій завдання

Вам доручено створити готового до виробництва чат-бота підтримки клієнтів на основі AI з наступними вимогами:

**Функціональні вимоги:**
- Веб-інтерфейс для взаємодії з клієнтами
- Інтеграція з Microsoft Foundry Models для відповідей
- Можливість пошуку документів через Cognitive Search
- Інтеграція з існуючою базою клієнтів
- Підтримка багатьох мов

**Нефункціональні вимоги:**
- Обробка 1000 одночасних користувачів
- SLA 99.9% часу роботи
- Відповідність SOC 2
- Витрати до $500 на місяць
- Розгортання у кілька середовищ (розробка, тестування, продакшен)

### Кроки реалізації

1. **Проектування архітектури**
2. **Створення AZD шаблону**
3. **Впровадження заходів безпеки**
4. **Налаштування моніторингу та оповіщень**
5. **Створення pipeline розгортання**
6. **Документування рішення**

### Критерії оцінки

- ✅ **Функціональність:** Чи виконує всі вимоги?
- ✅ **Безпека:** Чи впроваджено кращі практики?
- ✅ **Масштабованість:** Чи витримує навантаження?
- ✅ **Підтримуваність:** Чи структуровані код і інфраструктура?
- ✅ **Витрати:** Чи дотримано бюджету?

## Додаткові ресурси

### Документація Microsoft
- [Документація Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Документація Microsoft Foundry Models Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Документація Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Зразки шаблонів
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ресурси спільноти
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Сертифікат про завершення

Вітаємо! Ви завершили AI Workshop Lab. Тепер ви повинні вміти:

- ✅ Конвертувати існуючі AI-додатки в шаблони AZD
- ✅ Розгортати AI-додатки, готові до продакшену
- ✅ Впроваджувати кращі практики безпеки для AI-навантажень
- ✅ Моніторити та оптимізувати продуктивність AI-додатків
- ✅ Усувати поширені проблеми розгортання

### Наступні кроки
1. Застосуйте ці шаблони у власних AI-проєктах
2. Поверніть шаблони у спільноту
3. Приєднуйтесь до Microsoft Foundry Discord для постійної підтримки
4. Вивчайте просунуті теми, такі як мульти-регіональні розгортання

---

**Відгук про воркшоп**: допоможіть нам покращити цей воркшоп, поділившись своїм досвідом у каналі [Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - AI-перший розвиток
- **⬅️ Попередній**: [Розгортання AI-моделі](ai-model-deployment.md)
- **➡️ Наступний**: [Кращі практики для продакшен AI](production-ai-practices.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

**Потрібна допомога?** Приєднуйтесь до нашої спільноти для підтримки та обговорень щодо AZD та розгортання AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ було перекладено за допомогою AI-сервісу перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->