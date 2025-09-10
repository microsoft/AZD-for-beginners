<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "483bc6a036553e531b9af4d1d9dec31e",
  "translation_date": "2025-09-10T06:01:15+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "uk"
}
-->
# Ваш перший проєкт - Практичний посібник

## Вступ

Ласкаво просимо до вашого першого проєкту з Azure Developer CLI! Цей детальний практичний посібник проведе вас через процес створення, розгортання та управління повноцінним додатком на Azure за допомогою azd. Ви працюватимете з реальним додатком для управління завданнями, який включає React-фронтенд, бекенд на Node.js та базу даних MongoDB.

## Цілі навчання

Після завершення цього посібника ви:
- Опануєте процес ініціалізації проєкту azd за допомогою шаблонів
- Зрозумієте структуру проєкту Azure Developer CLI та конфігураційні файли
- Виконаєте повне розгортання додатка на Azure з налаштуванням інфраструктури
- Реалізуєте стратегії оновлення додатків та повторного розгортання
- Управлятимете кількома середовищами для розробки та тестування
- Застосуєте практики очищення ресурсів та управління витратами

## Результати навчання

Після завершення ви зможете:
- Самостійно ініціалізувати та налаштовувати проєкти azd за допомогою шаблонів
- Ефективно орієнтуватися в структурі проєктів azd та вносити зміни
- Розгортати повноцінні додатки на Azure за допомогою однієї команди
- Вирішувати поширені проблеми з розгортанням та автентифікацією
- Управляти кількома середовищами Azure для різних етапів розгортання
- Реалізовувати безперервні процеси розгортання для оновлення додатків

## Початок роботи

### Перевірка передумов
- ✅ Встановлено Azure Developer CLI ([Посібник з встановлення](installation.md))
- ✅ Встановлено та автентифіковано Azure CLI
- ✅ Встановлено Git на вашій системі
- ✅ Node.js 16+ (для цього посібника)
- ✅ Visual Studio Code (рекомендовано)

### Перевірте налаштування
```bash
# Check azd installation
azd version

# Verify Azure authentication
az account show

# Check Node.js version
node --version
```

## Крок 1: Вибір та ініціалізація шаблону

Почнемо з популярного шаблону додатка для управління завданнями, який включає React-фронтенд та бекенд на Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Що щойно сталося?
- Завантажено код шаблону до вашої локальної директорії
- Створено файл `azure.yaml` із визначеннями сервісів
- Налаштовано код інфраструктури в директорії `infra/`
- Створено конфігурацію середовища

## Крок 2: Дослідження структури проєкту

Давайте розглянемо, що створив для нас azd:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Ви повинні побачити:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
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

## Крок 3: Налаштування проєкту (опціонально)

Перед розгортанням ви можете налаштувати додаток:

### Зміна фронтенду
```bash
# Open the React app component
code src/web/src/App.tsx
```

Зробіть просту зміну:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Налаштування змінних середовища
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.0.0"

# View all environment variables
azd env get-values
```

## Крок 4: Розгортання на Azure

Тепер найцікавіше - розгорнемо все на Azure!

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

Команда `azd up` виконує наступні кроки:
1. **Provision** (`azd provision`) - Створює ресурси Azure
2. **Package** - Збирає код вашого додатка
3. **Deploy** (`azd deploy`) - Розгортає код на ресурсах Azure

### Очікуваний результат
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Крок 5: Тестування вашого додатка

### Доступ до вашого додатка
Натисніть на URL, наданий у результатах розгортання, або отримайте його будь-коли:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Тестування додатка для управління завданнями
1. **Додайте завдання** - Натисніть "Add Todo" і введіть задачу
2. **Позначте як виконане** - Відмітьте виконані завдання
3. **Видаліть завдання** - Видаліть ті, які більше не потрібні

### Моніторинг вашого додатка
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Крок 6: Внесення змін та повторне розгортання

Давайте внесемо зміни та побачимо, як легко оновити додаток:

### Зміна API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Додайте заголовок відповіді:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Розгортання лише змін у коді
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Крок 7: Управління кількома середовищами

Створіть тестове середовище для перевірки змін перед продакшном:

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

Коли ви закінчите експериментувати, очистіть ресурси, щоб уникнути постійних витрат:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Що ви дізналися

Вітаємо! Ви успішно:
- Ініціалізували проєкт azd за допомогою шаблону
- Дослідили структуру проєкту та основні файли
- Розгорнули повноцінний додаток на Azure
- Внесли зміни до коду та повторно розгорнули додаток
- Управляли кількома середовищами
- Очистили ресурси

## Вирішення поширених проблем

### Помилки автентифікації
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Збої розгортання
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Конфлікти імен ресурсів
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Проблеми з портами/мережею
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Наступні кроки

Тепер, коли ви завершили свій перший проєкт, досліджуйте ці розширені теми:

### 1. Налаштування інфраструктури
- [Інфраструктура як код](../deployment/provisioning.md)
- [Додавання баз даних, сховищ та інших сервісів](../deployment/provisioning.md#adding-services)

### 2. Налаштування CI/CD
- [Інтеграція з GitHub Actions](../deployment/cicd-integration.md)
- [Конвеєри Azure DevOps](../deployment/cicd-integration.md#azure-devops)

### 3. Найкращі практики для продакшну
- [Налаштування безпеки](../deployment/best-practices.md#security)
- [Оптимізація продуктивності](../deployment/best-practices.md#performance)
- [Моніторинг та логування](../deployment/best-practices.md#monitoring)

### 4. Дослідження інших шаблонів
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Додаткові ресурси

### Навчальні матеріали
- [Документація Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Центр архітектури Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Рамка добре спроєктованої архітектури Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### Спільнота та підтримка
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Спільнота розробників Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблони та приклади
- [Офіційна галерея шаблонів](https://azure.github.io/awesome-azd/)
- [Шаблони від спільноти](https://github.com/Azure-Samples/azd-templates)
- [Шаблони для підприємств](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Вітаємо з завершенням вашого першого проєкту azd!** Тепер ви готові впевнено створювати та розгортати чудові додатки на Azure.

---

**Навігація**
- **Попередній урок**: [Конфігурація](configuration.md)
- **Наступний урок**: [Посібник з розгортання](../deployment/deployment-guide.md)

---

**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, звертаємо вашу увагу, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ на його рідній мові слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.