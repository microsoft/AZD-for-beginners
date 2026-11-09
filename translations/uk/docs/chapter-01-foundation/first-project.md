# Ваш перший проєкт — практичний посібник

**Навігація по розділах:**
- **📚 Головна курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 1 — Основи та швидкий старт
- **⬅️ Попередній**: [Встановлення та налаштування](installation.md)
- **➡️ Наступний**: [Власний додаток](bring-your-own-app.md)
- **🚀 Наступний розділ**: [Розділ 2: Розробка з акцентом на AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Вступ

Ласкаво просимо до вашого першого проєкту Azure Developer CLI! Ви розгорнете додаток todo з фронтендом на React, API на Node.js і Azure Cosmos DB. Шаблон зберігає історичну назву `todo-nodejs-mongo`; його сучасна інфраструктура використовує Cosmos DB для NoSQL, тому передбачайте API бази даних, розглядаючи скачаний README та `infra/`, а не лише за назвою.

> Перевірено у листопаді 2026 року з урахуванням `azd 1.37.2` та публічного шаблону. Наведені нижче приклади використовують Bash; для вилучення JSON також потрібен `jq`. Розгортання в Azure призводить до нарахування плати і під час перевірки не виконувалося.

## Цілі навчання

Виконавши цей посібник, ви:
- Опануєте робочий процес ініціалізації проєкту azd за допомогою шаблонів
- Зрозумієте структуру проєкту Azure Developer CLI та конфігураційні файли
- Виконаєте повне розгортання додатку в Azure з налаштуванням інфраструктури
- Застосуєте стратегії оновлення та повторного розгортання додатків
- Керуватимете кількома середовищами для розробки та тестування
- Виконаєте очищення ресурсів та практики управління витратами

## Досягнення навчання

Після завершення ви зможете:
- Самостійно ініціалізувати та налаштовувати проєкти azd за шаблонами
- Ефективно орієнтуватися та змінювати структуру проєкту azd
- Розгортати повноцінні додатки у Azure однією командою
- Усувати типові проблеми розгортання та аутентифікації
- Керувати кількома середовищами Azure для різних етапів розгортання
- Впроваджувати безперервні процеси розгортання оновлень додатка

## Початок роботи

### Перевірка передумов
- ✅ Встановлено Azure Developer CLI ([Посібник зі встановлення](installation.md))
- ✅ Завершено автентифікацію в AZD за допомогою `azd auth login`
- ✅ Встановлено Git у вашій системі
- ✅ Встановлено Node.js 22 LTS (або підтримувана версія, необхідна шаблоном)
- ✅ Visual Studio Code (рекомендується)

Перед продовженням виконайте валідатор налаштувань із кореневого каталогу репозиторію:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Перевірте ваше налаштування
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Перевірте додаткову автентифікацію Azure CLI

```bash
az account show
```

### Перевірте версію Node.js
```bash
node --version
```

## Крок 1: Вибір та ініціалізація шаблону

Почнемо з популярного шаблону додатку todo, який включає фронтенд на React і бекенд API на Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Що сталося?
- Завантажено код шаблону у вашу локальну директорію
- Створено файл `azure.yaml` із визначеннями сервісів
- Налаштовано код інфраструктури у директорії `infra/`
- Створено конфігурацію середовища

## Крок 2: Ознайомлення зі структурою проєкту

Оглянемо, що створив azd:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Ви побачите:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Основні файли для розуміння

**azure.yaml** - Серце вашого проєкту azd:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Визначення інфраструктури:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Крок 3: Налаштування проєкту (необов’язково)

Перед розгортанням можна налаштувати додаток:

### Зміна фронтенду
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Зробіть просту зміну:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Конфігурація змінних середовища
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Ці два користувацькі значення демонструють тільки локальне збереження. Стандартний шаблон не використовує `WEBSITE_TITLE` або `API_VERSION`, тому вони не змінюють додаток. Явна зміна джерела вище змінює тільки відображуваний заголовок.

## Крок 4: Розгортання в Azure

Тепер найцікавіше — розгорнемо все в Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Що відбувається під час розгортання?

Робочий процес забезпечує налаштування інфраструктури та упаковку/розгортання коду. Точний порядок можна настроїти через `workflows.up` у `azure.yaml`; у цьому шаблоні спочатку провізія, потім розгортання. Не покладайтеся на універсальний порядок фаз для всіх шаблонів.

### Очікуваний результат
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Крок 5: Тестування додатку

### Отримайте доступ до вашого додатку
Клікніть по URL, що наведено у виводі розгортання, або отримайте його будь-коли:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Тест додатку Todo
1. **Додайте завдання** — натисніть "Add Todo" та введіть завдання
2. **Позначте як виконане** — відмічайте виконані завдання
3. **Видаляйте завдання** — видаляйте непотрібні todo

### Моніторинг додатку
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Перевірка розгортання

Перед переходом далі пройдіть цей швидкий чеклист, щоб упевнитися, що все справді працює — не думайте, що "розгортання успішне" означає "додаток працює":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Розгортання вважається успішним, коли:**
- ✅ `azd show` містить URL робочої кінцевої точки
- ✅ URL відкривається у браузері без помилок
- ✅ Основні функції працюють (додавання/завершення/видалення завдань)
- ✅ `azd monitor --logs` показує запити без несподіваних помилок

Якщо будь-яка перевірка не проходить, переходьте до [Розділ 7: Вирішення проблем](../chapter-07-troubleshooting/README.md).

## Крок 6: Внесіть зміни та повторно розгорніть

Зробимо зміну й переконаємося, наскільки це просто:

### Змініть API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Додайте користувацький заголовок відповіді:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Розгортання лише змін коду
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Крок 7: Керування кількома середовищами

Створіть середовище тестування, щоб перевіряти зміни перед виробництвом:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Порівняння середовищ
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Крок 8: Очищення ресурсів

Коли закінчите експериментувати, почистіть ресурси, щоб уникнути додаткових витрат:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Класичний додаток проти AI-додатку: той самий робочий процес

Ви щойно розгорнули традиційний вебдодаток. А що, якщо хочете розгорнути AI-додаток — наприклад, чат на основі Microsoft Foundry Models?

Хороша новина: **робочий процес ідентичний.**

| Крок | Класичний Todo додаток | AI чат-додаток |
|------|-----------------|-------------|
| Ініціалізація (порожня директорія) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Аутентифікація | `azd auth login` | `azd auth login` |
| Розгортання | `azd up` | `azd up` |
| Моніторинг | `azd monitor` | `azd monitor` |
| Очищення | `azd down --force --purge` | `azd down --force --purge` |

Команди життєвого циклу однакові, але передумови відрізняються. AI-шаблон може вимагати доступу до моделей, регіонального квотування, завантаження даних і додаткових налаштувань. Перед розгортанням прочитайте його README; `azd up` не може додати потрібні дозволи чи квоти.

Це основний принцип azd: **один робочий процес — будь-яке навантаження.** Навички, які ви практикували в цьому посібнику — ініціалізація, розгортання, моніторинг, повторне розгортання та очищення — однаково застосовуються до AI-додатків та агентів.

---

## Що ви дізналися

Вітаємо! Ви успішно:
- ✅ Ініціалізували проєкт azd з шаблону
- ✅ Вивчили структуру проєкту та основні файли
- ✅ Розгорнули повноцінний додаток у Azure
- ✅ Зробили зміни в коді та повторно розгорнули
- ✅ Керували кількома середовищами
- ✅ Очистили ресурси

## 🎯 Вправи для підтвердження навичок

### Вправа 1: Розгорніть інший шаблон (15 хвилин)
**Мета**: Продемонструвати володіння azd init та робочим процесом розгортання

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Критерії успіху:**
- [ ] Додаток розгортається без помилок
- [ ] Можна отримати доступ до URL додатку у браузері
- [ ] Додаток функціонує правильно (додавання/видалення завдань)
- [ ] Успішно очищені всі ресурси

### Вправа 2: Налаштуйте конфігурацію (20 хвилин)
**Мета**: Практикувати локальне зберігання значень середовища без плутанини з конфігурацією під час виконання

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Критерії успіху:**
- [ ] Користувацьке середовище створено успішно
- [ ] Змінні середовища встановлено та можна отримати
- [ ] `azd env get-value APP_TITLE` виводить `My Custom Todo App`
- [ ] Можна пояснити, чому ці значення не змінюють стандартний додаток, якщо код/інфраструктура їх не використовує

### Вправа 3: Робочий процес із кількома середовищами (25 хвилин)
**Мета**: Опанувати управління середовищами та стратегії розгортання

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Критерії успіху:**
- [ ] Створено два середовища з різними конфігураціями
- [ ] Обидва середовища розгорнуто успішно
- [ ] Можна перемикатися між середовищами за допомогою `azd env select`
- [ ] Змінні середовища відрізняються між середовищами
- [ ] Успішно очищено обидва середовища

## 📊 Ваш прогрес

**Витрачений час**: ~60-90 хвилин  
**Опановані навички**:
- ✅ Ініціалізація проєкту за шаблоном
- ✅ Створення ресурсів Azure
- ✅ Робочі процеси розгортання додатків
- ✅ Управління середовищами
- ✅ Керування конфігурацією
- ✅ Очищення ресурсів та контроль витрат

**Наступний рівень**: Ви готові до [Посібника з конфігурації](../chapter-03-configuration/configuration.md) для вивчення розширених шаблонів налаштувань!

## Вирішення поширених проблем

### Помилки автентифікації
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Помилки розгортання
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Конфлікти імен ресурсів
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Проблеми портів/мережі
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Подальші кроки

Тепер, коли ви завершили перший проєкт, вивчайте поглиблені теми:

### 1. Налаштування інфраструктури
- [Інфраструктура як код](../chapter-04-infrastructure/provisioning.md)
- [Додайте інфраструктуру бази даних](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Налаштування CI/CD
- [Посібник із розгортання](../chapter-04-infrastructure/deployment-guide.md) — Повні робочі процеси CI/CD
- [Документація Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) — Конфігурація pipeline

### 3. Кращі практики для виробництва
- [Посібник із розгортання](../chapter-04-infrastructure/deployment-guide.md) — Безпека, продуктивність і моніторинг

### 4. Вивчайте інші шаблони
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Додаткові ресурси

### Навчальні матеріали
- [Документація Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Центр архітектури Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Спільнота та підтримка
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Спільнота розробників Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблони та приклади
- [Офіційна галерея шаблонів](https://azure.github.io/awesome-azd/)
- [Внесок спільноти в шаблони](https://github.com/Azure/awesome-azd)
- [Вихідний код шаблону Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Вітаємо з завершенням вашого першого проєкту azd!** Тепер ви готові впевнено створювати та розгортати дивовижні додатки в Azure.

---

**Навігація по розділах:**
- **📚 Головна курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 1 — Основи та швидкий старт
- **⬅️ Попередній**: [Встановлення та налаштування](installation.md)
- **➡️ Наступний**: [Власний додаток](bring-your-own-app.md)
- **🚀 Наступний розділ**: [Розділ 2: Розробка з акцентом на AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->