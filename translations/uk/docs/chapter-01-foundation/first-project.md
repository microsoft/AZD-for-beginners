# Ваш перший проєкт - практичний посібник

**Навігація по розділах:**
- **📚 Головна курсу**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 1 - Основи та швидкий старт
- **⬅️ Попередній**: [Installation & Setup](installation.md)
- **➡️ Наступний**: [Configuration](configuration.md)
- **🚀 Наступний розділ**: [Розділ 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Вступ

Вітаємо у вашому першому проєкті з Azure Developer CLI! Цей вичерпний практичний посібник надає покрокові інструкції зі створення, розгортання та керування повноцінним стековим додатком в Azure за допомогою azd. Ви працюватимете з реальним додатком todo, який містить фронтенд на React, бекенд API на Node.js і базу даних MongoDB.

## Навчальні цілі

Виконавши цей посібник, ви:
- Оволодієте робочим процесом ініціалізації проєкту azd за допомогою шаблонів
- Зрозумієте структуру проєкту Azure Developer CLI та файли конфігурації
- Виконаєте повне розгортання додатка в Azure з підготовкою інфраструктури
- Реалізуєте стратегії оновлення додатка та повторного розгортання
- Керуватимете кількома середовищами для розробки та стендування
- Застосуєте практики очищення ресурсів та управління витратами

## Результати навчання

Після завершення ви зможете:
- Ініціалізувати та налаштовувати проєкти azd зі шаблонів самостійно
- Навігувати та змінювати структури проєктів azd ефективно
- Розгортати повноцінні додатки в Azure однією командою
- Усувавати типові проблеми розгортання та автентифікації
- Керувати кількома середовищами Azure для різних етапів розгортання
- Реалізувати безперервні робочі процеси розгортання для оновлень додатків

## Початок роботи

### Перелік передумов
- ✅ Azure Developer CLI встановлено ([Installation Guide](installation.md))
- ✅ Azure CLI встановлено та автентифіковано
- ✅ Git встановлено на вашій системі
- ✅ Node.js 16+ (для цього підручника)
- ✅ Visual Studio Code (рекомендується)

### Перевірте ваше середовище
```bash
# Перевірте встановлення azd
azd version
```
### Перевірте автентифікацію Azure

```bash
az account show
```

### Перевірте версію Node.js
```bash
node --version
```

## Крок 1: Виберіть і ініціалізуйте шаблон

Розпочнемо з популярного шаблону додатка todo, який містить фронтенд на React і бекенд API на Node.js.

```bash
# Переглянути доступні шаблони
azd template list

# Ініціалізувати шаблон додатка todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Дотримуйтесь підказок:
# - Введіть назву середовища: "dev"
# - Виберіть підписку (якщо у вас їх кілька)
# - Виберіть регіон: "East US 2" (або ваш бажаний регіон)
```

### Що щойно сталося?
- Завантажено код шаблону до вашого локального каталогу
- Створено файл `azure.yaml` з визначеннями сервісів
- Налаштовано код інфраструктури в каталозі `infra/`
- Створено конфігурацію середовища

## Крок 2: Ознайомтеся зі структурою проєкту

Розглянемо, що azd створив для нас:

```bash
# Переглянути структуру проєкту
tree /f   # Windows
# або
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

### Важливі файли для ознайомлення

**azure.yaml** - Серце вашого проєкту azd:
```bash
# Переглянути конфігурацію проєкту
cat azure.yaml
```

**infra/main.bicep** - Визначення інфраструктури:
```bash
# Переглянути код інфраструктури
head -30 infra/main.bicep
```

## Крок 3: Налаштуйте проєкт (необов’язково)

Перш ніж розгортати, ви можете налаштувати додаток:

### Змініть фронтенд
```bash
# Відкрийте компонент React-додатка
code src/web/src/App.tsx
```

Зробіть просту зміну:
```typescript
// Знайдіть заголовок і змініть його
<h1>My Awesome Todo App</h1>
```

### Налаштування змінних середовища
```bash
# Встановити користувацькі змінні середовища
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Переглянути всі змінні середовища
azd env get-values
```

## Крок 4: Розгорніть в Azure

А тепер найцікавіше — розгорніть усе в Azure!

```bash
# Розгорнути інфраструктуру та застосунок
azd up

# Ця команда виконає:
# 1. Забезпечить ресурси Azure (App Service, Cosmos DB тощо)
# 2. Збудує ваш застосунок
# 3. Розгорне на виділених ресурсах
# 4. Відобразить URL застосунку
```

### Що відбувається під час розгортання?

Команда `azd up` виконує ці кроки:
1. **Provision** (`azd provision`) - Створює ресурси Azure
2. **Package** - Будує код вашого додатка
3. **Deploy** (`azd deploy`) - Розгортає код на ресурсах Azure

### Очікуваний вивід
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Крок 5: Перевірте ваш додаток

### Доступ до вашого додатка
Натисніть на URL, вказаний у виводі розгортання, або отримайте його будь-коли:
```bash
# Отримати кінцеві точки додатка
azd show

# Відкрийте додаток у браузері
azd show --output json | jq -r '.services.web.endpoint'
```

### Перевірте додаток Todo
1. **Add a todo item** - Натисніть "Add Todo" і введіть завдання
2. **Mark as complete** - Позначте виконані елементи
3. **Delete items** - Видаліть задачі, які вам більше не потрібні

### Моніторинг вашого додатка
```bash
# Відкрити портал Azure для ваших ресурсів
azd monitor

# Переглянути журнали програми
azd monitor --logs

# Переглянути метрики в реальному часі
azd monitor --live
```

## Крок 6: Внесіть зміни та повторно розгорніть

Давайте внесемо зміну і побачимо, як просто оновити:

### Змініть API
```bash
# Відредагуйте код API
code src/api/src/routes/lists.js
```

Додайте власний заголовок відповіді:
```javascript
// Знайдіть обробник маршруту та додайте:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Розгорніть лише зміни коду
```bash
# Розгорнути лише код застосунку (пропустити інфраструктуру)
azd deploy

# Це значно швидше, ніж 'azd up', оскільки інфраструктура вже існує
```

## Крок 7: Керування кількома середовищами

Створіть середовище стендування, щоб протестувати зміни перед продакшеном:

```bash
# Створити нове тестове середовище
azd env new staging

# Розгорнути на тестовому середовищі
azd up

# Переключитися назад на середовище розробки
azd env select dev

# Перелічити всі середовища
azd env list
```

### Порівняння середовищ
```bash
# Переглянути середовище розробки
azd env select dev
azd show

# Переглянути тестове середовище
azd env select staging
azd show
```

## Крок 8: Очищення ресурсів

Коли ви закінчите експерименти, очистіть ресурси, щоб уникнути постійних витрат:

```bash
# Видалити всі ресурси Azure для поточного середовища
azd down

# Примусово видалити без підтвердження та остаточно очистити тимчасово видалені ресурси
azd down --force --purge

# Видалити конкретне середовище
azd env select staging
azd down --force --purge
```

## Чого ви навчилися

Вітаємо! Ви успішно:
- ✅ Ініціалізували проєкт azd зі шаблону
- ✅ Ознайомилися зі структурою проєкту та ключовими файлами
- ✅ Розгорнули повноцінний стековий додаток в Azure
- ✅ Внесли зміни в код і повторно розгорнули
- ✅ Керували кількома середовищами
- ✅ Очистили ресурси

## 🎯 Завдання для перевірки навичок

### Вправа 1: Розгорніть інший шаблон (15 хвилин)
**Мета**: Продемонструвати володіння azd init і робочим процесом розгортання

```bash
# Спробувати стек Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Перевірити розгортання
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Очистити
azd down --force --purge
```

**Критерії успіху:**
- [ ] Додаток розгортається без помилок
- [ ] Можна отримати доступ до URL додатка в браузері
- [ ] Додаток функціонує правильно (додавання/видалення todo)
- [ ] Всі ресурси успішно очищені

### Вправа 2: Налаштуйте конфігурацію (20 хвилин)
**Мета**: Практика налаштування змінних середовища

```bash
cd my-first-azd-app

# Створити користувацьке середовище
azd env new custom-config

# Встановити користувацькі змінні
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Перевірити змінні
azd env get-values | grep APP_TITLE

# Розгорнути з користувацькою конфігурацією
azd up
```

**Критерії успіху:**
- [ ] Створено кастомне середовище успішно
- [ ] Змінні середовища встановлені та доступні
- [ ] Додаток розгорнуто з кастомною конфігурацією
- [ ] Можна перевірити кастомні налаштування у розгорнутому додатку

### Вправа 3: Робота з кількома середовищами (25 хвилин)
**Мета**: Оволодіти управлінням середовищами та стратегіями розгортання

```bash
# Створити середовище розробки
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Занотувати URL середовища розробки
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Створити передрелізне (staging) середовище
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Занотувати URL передрелізного середовища
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Порівняти середовища
azd env list

# Протестувати обидва середовища
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Очистити обидва середовища
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Критерії успіху:**
- [ ] Створено два середовища з різними конфігураціями
- [ ] Обидва середовища успішно розгорнуті
- [ ] Можна переключатися між середовищами за допомогою `azd env select`
- [ ] Змінні середовища відрізняються між середовищами
- [ ] Обидва середовища успішно очищені

## 📊 Ваш прогрес

**Час, витрачений**: ~60-90 хвилин  
**Набуті навички**:
- ✅ Ініціалізація проєкту на основі шаблону
- ✅ Підготовка ресурсів Azure
- ✅ Робочі процеси розгортання додатків
- ✅ Управління середовищами
- ✅ Управління конфігурацією
- ✅ Очищення ресурсів та управління витратами

**Наступний рівень**: Ви готові до [Керівництва з конфігурації](configuration.md), щоб вивчити розширені шаблони конфігурації!

## Вирішення поширених проблем

### Помилки автентифікації
```bash
# Повторно автентифікуватися в Azure
az login

# Перевірити доступ до підписки
az account show
```

### Збої розгортання
```bash
# Увімкнути налагоджувальне логування
export AZD_DEBUG=true
azd up --debug

# Переглянути журнали додатка в Azure
azd monitor --logs

# Для Container Apps використовуйте Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Конфлікти імен ресурсів
```bash
# Використовуйте унікальну назву середовища
azd env new dev-$(whoami)-$(date +%s)
```

### Проблеми з портами/мережею
```bash
# Перевірте, чи порти доступні
netstat -an | grep :3000
netstat -an | grep :3100
```

## Наступні кроки

Тепер, коли ви завершили свій перший проєкт, досліджуйте ці розширені теми:

### 1. Налаштування інфраструктури
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Налаштування CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Повні робочі процеси CI/CD
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Налаштування пайплайнів

### 3. Найкращі практики для продакшену
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Безпека, продуктивність та моніторинг

### 4. Дослідіть більше шаблонів
```bash
# Переглядайте шаблони за категоріями
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Спробуйте різні стеки технологій
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Додаткові ресурси

### Навчальні матеріали
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Спільнота та підтримка
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблони та приклади
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Вітаємо з завершенням вашого першого проєкту azd!** Тепер ви готові впевнено створювати та розгортати чудові додатки в Azure.

---

**Навігація по розділах:**
- **📚 Головна курсу**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 1 - Основи та швидкий старт
- **⬅️ Попередній**: [Installation & Setup](installation.md)
- **➡️ Наступний**: [Configuration](configuration.md)
- **🚀 Наступний розділ**: [Розділ 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Наступний урок**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Відмова від відповідальності:
Цей документ перекладено із використанням сервісу перекладу на базі штучного інтелекту Co-op Translator (https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, зверніть увагу, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ мовою оригіналу слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується скористатися послугами професійного перекладача. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->