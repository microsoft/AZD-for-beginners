# Лабораторний практикум AI: Як зробити ваші AI-рішення придатними для розгортання через AZD

**Навігація розділом:**
- **📚 Головна курсу**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка з фокусом на AI
- **⬅️ Попередній**: [Розгортання моделей AI](ai-model-deployment.md)
- **➡️ Наступний**: [Найкращі практики для виробничого AI](production-ai-practices.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

## Огляд воркшопу

Цей практичний лабораторний практикум проведе розробників через процес взяття наявного AI-шаблону та його розгортання за допомогою Azure Developer CLI (AZD). Ви дізнаєтесь основні підходи для виробничих розгортань AI із використанням сервісів Microsoft Foundry.

**Тривалість:** 2-3 години  
**Рівень:** Середній  
**Передумови:** Базові знання Azure, ознайомленість з концепціями AI/ML

## 🎓 Навчальні цілі

Після завершення цього воркшопу ви зможете:
- ✅ Перетворити існуючий AI-додаток для використання шаблонів AZD
- ✅ Налаштувати сервіси Microsoft Foundry за допомогою AZD
- ✅ Реалізувати безпечне керування обліковими даними для AI-сервісів
- ✅ Розгорнути готові до виробництва AI-додатки з моніторингом
- ✅ Виправляти поширені проблеми розгортання AI

## Передумови

### Необхідні інструменти
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) встановлено
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) встановлено
- [Git](https://git-scm.com/) встановлено
- Редактор коду (рекомендується VS Code)

### Ресурси Azure
- Підписка Azure з правами Contributor
- Доступ до сервісів Azure OpenAI (або можливість запросити доступ)
- Права на створення груп ресурсів

### Необхідні знання
- Базове розуміння сервісів Azure
- Знайомство з інтерфейсами командного рядка
- Базові концепції AI/ML (API, моделі, підказки)

## Налаштування лабораторії

### Крок 1: Підготовка середовища

1. **Перевірте встановлення інструментів:**
```bash
# Перевірити встановлення AZD
azd version

# Перевірити Azure CLI
az --version

# Увійти в Azure
az login
azd auth login
```

2. **Клонувати репозиторій воркшопу:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Модуль 1: Розуміння структури AZD для AI-додатків

### Анатомія AZD-шаблону для AI

Ознайомтесь з ключовими файлами в AZD-шаблоні, готовому для AI:

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

### **Лабораторна вправа 1.1: Дослідження конфігурації**

1. **Перегляньте файл azure.yaml:**
```bash
cat azure.yaml
```

**На що звернути увагу:**
- Визначення сервісів для AI-компонентів
- Відповідності змінних середовища
- Конфігурації хостів

2. **Перегляньте інфраструктуру у main.bicep:**
```bash
cat infra/main.bicep
```

**Ключові AI-патерни для визначення:**
- Провізіонування сервісу Azure OpenAI
- Інтеграція Cognitive Search
- Безпечне керування ключами
- Конфігурації мережевої безпеки

### **Тема для обговорення:** Чому ці патерни важливі для AI

- **Залежності сервісів**: AI-додатки часто потребують кількох скоординованих сервісів
- **Безпека**: API-ключі та кінцеві точки потребують безпечного керування
- **Масштабованість**: AI-робочі навантаження мають особливі вимоги до масштабування
- **Управління витратами**: AI-сервіси можуть бути дорогими, якщо їх неправильно налаштовано

## Модуль 2: Розгорніть свій перший AI-додаток

### Крок 2.1: Ініціалізація середовища

1. **Створіть нове середовище AZD:**
```bash
azd env new myai-workshop
```

2. **Встановіть необхідні параметри:**
```bash
# Вкажіть бажаний регіон Azure
azd env set AZURE_LOCATION eastus

# Необов'язково: вкажіть конкретну модель OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Крок 2.2: Розгортання інфраструктури та додатку

1. **Розгорніть за допомогою AZD:**
```bash
azd up
```

**Що відбувається під час `azd up`:**
- ✅ Провізіонування сервісу Azure OpenAI
- ✅ Створюється сервіс Cognitive Search
- ✅ Налаштовується App Service для веб-додатку
- ✅ Конфігурується мережа та безпека
- ✅ Розгортається код додатку
- ✅ Налаштовується моніторинг і логування

2. **Моніторьте процес розгортання** і зауважте створювані ресурси.

### Крок 2.3: Перевірте ваше розгортання

1. **Перевірте розгорнуті ресурси:**
```bash
azd show
```

2. **Відкрийте розгорнутий додаток:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Перевірте функціональність AI:**
   - Перейдіть до веб-додатку
   - Спробуйте приклади запитів
   - Переконайтесь, що AI-відповіді працюють

### **Лабораторна вправа 2.1: Практика усунення несправностей**

**Сценарій**: Розгортання пройшло успішно, але AI не відповідає.

**Поширені проблеми для перевірки:**
1. **API-ключі OpenAI**: Перевірте, що вони встановлені правильно
2. **Доступність моделі**: Перевірте, чи підтримує вашу модель ваш регіон
3. **Мережеве підключення**: Переконайтесь, що сервіси можуть спілкуватися
4. **Права RBAC**: Перевірте, що додаток має доступ до OpenAI

**Команди для налагодження:**
```bash
# Перевірити змінні середовища
azd env get-values

# Переглянути журнали розгортання
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Перевірити статус розгортання OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Модуль 3: Налаштування AI-додатків під ваші потреби

### Крок 3.1: Зміна конфігурації AI

1. **Оновіть модель OpenAI:**
```bash
# Переключіться на іншу модель (якщо вона доступна у вашому регіоні)
azd env set AZURE_OPENAI_MODEL gpt-4

# Повторно розгорніть із новою конфігурацією
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

### Крок 3.2: Конфігурації, специфічні для середовища

**Краща практика**: Різні конфігурації для розробки та для продакшну.

1. **Створіть середовище для продакшну:**
```bash
azd env new myai-production
```

2. **Встановіть параметри, специфічні для продакшну:**
```bash
# У виробництві зазвичай використовують SKU вищого рівня
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Увімкнути додаткові функції безпеки
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Лабораторна вправа 3.1: Оптимізація витрат**

**Завдання**: Налаштувати шаблон для економного середовища розробки.

**Завдання:**
1. Визначте, які SKU можна встановити на безкоштовні/базові рівні
2. Налаштуйте змінні середовища для мінімальних витрат
3. Розгорніть і порівняйте витрати з конфігурацією для продакшну

**Підказки до рішення:**
- Використовуйте рівень F0 (безкоштовний) для Cognitive Services, коли це можливо
- Використовуйте базовий рівень для Search Service у розробці
- Розгляньте використання плану Consumption для Functions

## Модуль 4: Безпека та кращі практики для продакшну

### Крок 4.1: Безпечне керування обліковими даними

**Поточна проблема**: Багато AI-додатків хардкодять API-ключі або використовують небезпечне зберігання.

**Рішення AZD**: Інтеграція Managed Identity + Key Vault.

1. **Перегляньте конфігурацію безпеки у вашому шаблоні:**
```bash
# Шукайте конфігурацію Key Vault і керованої ідентичності
grep -r "keyVault\|managedIdentity" infra/
```

2. **Перевірте, що Managed Identity працює:**
```bash
# Перевірте, чи вебзастосунок має правильну конфігурацію ідентичності
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Крок 4.2: Мережева безпека

1. **Увімкніть приватні кінцеві точки** (якщо ще не налаштовано):

Додайте до вашого bicep-шаблону:
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

### Крок 4.3: Моніторинг та спостережливість

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

### **Лабораторна вправа 4.1: Аудит безпеки**

**Завдання**: Перегляньте ваше розгортання на предмет кращих практик безпеки.

**Контрольний список:**
- [ ] Немає захардкоджених секретів у коді або конфігурації
- [ ] Використовується Managed Identity для автентифікації сервісів поміж собою
- [ ] Key Vault зберігає чутливу конфігурацію
- [ ] Доступ до мережі належним чином обмежений
- [ ] Моніторинг та логування увімкнені

## Модуль 5: Конвертація вашого AI-додатку

### Крок 5.1: Оцінювальний аркуш

**Перед конвертацією вашого додатку** дайте відповіді на такі питання:

1. **Архітектура додатку:**
   - Які AI-сервіси використовує ваш додаток?
   - Які обчислювальні ресурси йому потрібні?
   - Чи потрібна йому база даних?
   - Які залежності між сервісами?

2. **Вимоги до безпеки:**
   - Які чутливі дані обробляє ваш додаток?
   - Які вимоги відповідності (compliance) у вас є?
   - Чи потрібне приватне мережеве з'єднання?

3. **Вимоги до масштабування:**
   - Яке очікуване навантаження?
   - Чи потрібне автоматичне масштабування?
   - Чи є регіональні вимоги?

### Крок 5.2: Створіть ваш AZD-шаблон

**Слідуйте цьому шаблону для конвертації вашого додатку:**

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

3. **Створіть шаблони інфраструктури:**

**infra/main.bicep** - Головний шаблон:
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

### **Лабораторна вправа 5.1: Завдання зі створення шаблону**

**Завдання**: Створіть AZD-шаблон для AI-додатку обробки документів.

**Вимоги:**
- Azure OpenAI для аналізу контенту
- Document Intelligence для OCR
- Storage Account для завантаження документів
- Function App для логіки обробки
- Веб-додаток для інтерфейсу користувача

**Бонусні бали:**
- Додайте правильну обробку помилок
- Додайте оцінку вартості
- Налаштуйте панелі моніторингу

## Модуль 6: Усунення поширених проблем

### Поширені проблеми при розгортанні

#### Проблема 1: Перевищена квота сервісу OpenAI
**Симптоми:** Розгортання не вдається з помилкою квоти
**Рішення:**
```bash
# Перевірте поточні квоти
az cognitiveservices usage list --location eastus

# Подайте запит на збільшення квоти або спробуйте інший регіон
azd env set AZURE_LOCATION westus2
azd up
```

#### Проблема 2: Модель недоступна в регіоні
**Симптоми:** AI-відповіді відмовляють або помилки розгортання моделі
**Рішення:**
```bash
# Перевірити доступність моделі за регіонами
az cognitiveservices model list --location eastus

# Оновити до доступної моделі
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Проблема 3: Проблеми з правами доступу
**Симптоми:** Помилки 403 Forbidden при зверненні до AI-сервісів
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
1. Перевірте Application Insights для метрик продуктивності
2. Перегляньте метрики сервісу OpenAI в порталі Azure
3. Перевірте мережеве підключення та затримки

**Рішення:**
- Реалізуйте кешування для частих запитів
- Використовуйте відповідну модель OpenAI для вашого випадку
- Розгляньте read replicas для сценаріїв з великим навантаженням

### **Лабораторна вправа 6.1: Завдання з налагодження**

**Сценарій**: Розгортання пройшло успішно, але додаток повертає помилки 500.

**Завдання для налагодження:**
1. Перевірте логи додатку
2. Перевірте підключення сервісів
3. Протестуйте автентифікацію
4. Перегляньте конфігурацію

**Інструменти для використання:**
- `azd show` для огляду розгортання
- Портал Azure для детальних логів сервісів
- Application Insights для телеметрії додатку

## Модуль 7: Моніторинг та оптимізація

### Крок 7.1: Налаштуйте комплексний моніторинг

1. **Створіть користувацькі панелі (dashboards):**

Перейдіть у портал Azure і створіть панель з такими елементами:
- Кількість запитів до OpenAI та затримка
- Рівні помилок додатку
- Використання ресурсів
- Відстеження витрат

2. **Налаштуйте оповіщення:**
```bash
# Попередження про високу частоту помилок
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
- Налаштуйте сповіщення по бюджету
- Використовуйте політики автоскейлінгу
- Реалізуйте кешування запитів
- Моніторьте використання токенів для OpenAI

### **Лабораторна вправа 7.1: Оптимізація продуктивності**

**Завдання**: Оптимізуйте ваш AI-додаток як за продуктивністю, так і за витратами.

**Метрики для поліпшення:**
- Зменшити середній час відповіді на 20%
- Зменшити щомісячні витрати на 15%
- Підтримувати 99.9% часу роботи

**Стратегії, які можна спробувати:**
- Реалізуйте кешування відповідей
- Оптимізуйте підказки для ефективного використання токенів
- Використовуйте відповідні обчислювальні SKU
- Налаштуйте коректне автоскейлування

## Фінальне завдання: Реалізація від початку до кінця

### Умови завдання

Вам доручено створити готового до продакшну чатбота служби підтримки на базі AI з такими вимогами:

**Функціональні вимоги:**
- Веб-інтерфейс для взаємодії з клієнтами
- Інтеграція з Azure OpenAI для відповідей
- Можливість пошуку документів за допомогою Cognitive Search
- Інтеграція з наявною базою даних клієнтів
- Підтримка кількох мов

**Нефункціональні вимоги:**
- Обробляти 1000 одночасних користувачів
- SLA 99.9% часу роботи
- Відповідність стандарту SOC 2
- Витрати менше $500/місяць
- Розгортати в кількох середовищах (dev, staging, prod)

### Кроки реалізації

1. Спроєктуйте архітектуру
2. Створіть AZD-шаблон
3. Реалізуйте заходи безпеки
4. Налаштуйте моніторинг та оповіщення
5. Створіть конвеєри розгортання
6. Документуйте рішення

### Критерії оцінювання

- ✅ **Функціональність**: Чи відповідає всім вимогам?
- ✅ **Безпека**: Чи реалізовано кращі практики?
- ✅ **Масштабованість**: Чи витримає навантаження?
- ✅ **Супроводжуваність**: Чи організований код та інфраструктура?
- ✅ **Вартість**: Чи відповідає бюджету?

## Додаткові ресурси

### Документація Microsoft
- [Документація Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Документація Azure OpenAI Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Документація Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Зразки шаблонів
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ресурси спільноти
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Сертифікат про завершення
Вітаємо! Ви завершили лабораторію AI Workshop. Тепер ви маєте вміти:

- ✅ Перетворювати існуючі ШІ-додатки у шаблони AZD
- ✅ Розгортати ШІ-додатки, готові до продукційної експлуатації
- ✅ Застосовувати найкращі практики безпеки для робочих навантажень ШІ
- ✅ Моніторити та оптимізувати продуктивність ШІ-додатків
- ✅ Виявляти та усувати типові проблеми розгортання

### Наступні кроки
1. Застосуйте ці підходи у своїх ШІ-проектах
2. Поширюйте шаблони у спільноті
3. Приєднуйтеся до Microsoft Foundry Discord для постійної підтримки
4. Досліджуйте розширені теми, наприклад розгортання у кілька регіонів

---

**Відгук про майстерню**: Допоможіть нам покращити цю майстерню, поділившись своїм досвідом у [Microsoft Foundry Discord #Azure канал](https://discord.gg/microsoft-azure).

---

**Навігація по розділах:**
- **📚 Course Home**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка, орієнтована на ШІ
- **⬅️ Попередній**: [Розгортання моделі ШІ](ai-model-deployment.md)
- **➡️ Наступний**: [Кращі практики для продукційних ШІ](production-ai-practices.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

Потрібна допомога? Приєднуйтесь до нашої спільноти для підтримки та обговорень щодо AZD і розгортання ШІ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, зверніть увагу, що автоматизовані переклади можуть містити помилки або неточності. Оригінальний документ його рідною мовою слід вважати авторитетним джерелом. Для критичної інформації рекомендується скористатися послугами професійного перекладача. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->