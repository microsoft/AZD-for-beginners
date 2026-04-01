# Ваш перший проєкт - практичний посібник

**Навігація розділом:**
- **📚 Головна сторінка курсу**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 1 - Основи та швидкий старт
- **⬅️ Попередній**: [Встановлення та налаштування](installation.md)
- **➡️ Наступний**: [Конфігурація](configuration.md)
- **🚀 Наступний розділ**: [Розділ 2: Розробка з пріоритетом AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Вступ

Ласкаво просимо до вашого першого проєкту Azure Developer CLI! Цей докладний практичний посібник надає повний покроковий опис створення, розгортання та керування повнофункціональним застосунком на Azure за допомогою azd. Ви працюватимете з реальним todo-застосунком, який містить React-фронтенд, Node.js API-бекенд і базу даних MongoDB.

## Мета навчання

Після проходження цього посібника ви зможете:
- Опанувати процес ініціалізації проєкту azd за допомогою шаблонів
- Розуміти структуру проєкту Azure Developer CLI та конфігураційні файли
- Виконувати повне розгортання застосунку в Azure разом із наданням інфраструктури
- Реалізовувати стратегії оновлення та повторного розгортання застосунку
- Керувати кількома середовищами для розробки та тестування
- Застосовувати практики очищення ресурсів і управління витратами

## Результати навчання

Після завершення ви зможете:
- Самостійно ініціалізувати та конфігурувати проєкти azd з шаблонів
- Ефективно орієнтуватися та змінювати структуру проєкту azd
- Розгортати повнофункціональні застосунки в Azure за допомогою однієї команди
- Вирішувати поширені проблеми розгортання та аутентифікації
- Керувати кількома середовищами Azure для різних етапів розгортання
- Реалізовувати безперервні робочі процеси розгортання для оновлень застосунку

## Початок роботи

### Контрольний список передумов
- ✅ Встановлений Azure Developer CLI ([Інструкція з встановлення](installation.md))
- ✅ Завершена автентифікація AZD командою `azd auth login`
- ✅ Встановлений Git на вашій системі
- ✅ Node.js версії 16+ (для цього посібника)
- ✅ Visual Studio Code (рекомендовано)

Перед продовженням запустіть валідатор налаштувань із кореня репозиторію:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Перевірте своє налаштування
```bash
# Перевірте встановлення azd
azd version

# Перевірте автентифікацію AZD
azd auth login --check-status
```

### Перевірте необов’язкову автентифікацію Azure CLI

```bash
az account show
```

### Перевірте версію Node.js
```bash
node --version
```

## Крок 1: Оберіть та ініціалізуйте шаблон

Почнемо з популярного шаблону todo-застосунку, який включає React-фронтенд і Node.js API-бекенд.

```bash
# Переглянути доступні шаблони
azd template list

# Ініціалізувати шаблон додатка todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Дотримуйтесь підказок:
# - Введіть назву середовища: "dev"
# - Виберіть підписку (якщо їх кілька)
# - Виберіть регіон: "East US 2" (або ваш улюблений регіон)
```

### Що саме сталося?
- Завантажено код шаблону до вашої локальної теки
- Створено файл `azure.yaml` із визначеннями сервісів
- Налаштовано код інфраструктури в теці `infra/`
- Створено конфігурацію середовища

## Крок 2: Ознайомтеся зі структурою проєкту

Переглянемо те, що azd створив для нас:

```bash
# Переглянути структуру проекту
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

### Основні файли для розуміння

**azure.yaml** - серце вашого проєкту azd:
```bash
# Переглянути конфігурацію проекту
cat azure.yaml
```

**infra/main.bicep** - визначення інфраструктури:
```bash
# Переглянути код інфраструктури
head -30 infra/main.bicep
```

## Крок 3: Налаштуйте свій проєкт (за бажанням)

Перед розгортанням ви можете налаштувати застосунок:

### Змініть фронтенд
```bash
# Відкрийте компонент React додатку
code src/web/src/App.tsx
```

Зробіть просту зміну:
```typescript
// Знайдіть заголовок і змініть його
<h1>My Awesome Todo App</h1>
```

### Налаштуйте змінні оточення
```bash
# Встановити власні змінні середовища
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Переглянути всі змінні середовища
azd env get-values
```

## Крок 4: Розгорніть в Azure

Тепер найцікавіше — розгорнути все в Azure!

```bash
# Розгортання інфраструктури та застосунку
azd up

# Ця команда виконає:
# 1. Надання ресурсів Azure (App Service, Cosmos DB тощо)
# 2. Збірка вашого застосунку
# 3. Розгортання на наданих ресурсах
# 4. Відображення URL застосунку
```

### Що відбувається під час розгортання?

Команда `azd up` виконує такі кроки:
1. **Provision** (`azd provision`) - створює ресурси Azure
2. **Package** - збирає код застосунку
3. **Deploy** (`azd deploy`) - розгортає код у ресурси Azure

### Очікуваний результат
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Крок 5: Протестуйте свій застосунок

### Доступ до застосунку
Клацніть URL, який надається у результаті розгортання, або отримайте його будь-коли:
```bash
# Отримати кінцеві точки додатку
azd show

# Відкрийте додаток у своєму браузері
azd show --output json | jq -r '.services.web.endpoint'
```

### Тестування застосунку Todo
1. **Додайте завдання** - натисніть "Add Todo" та введіть завдання
2. **Позначте як виконане** - відмітьте виконані пункти
3. **Видаліть пункти** - видаліть непотрібні завдання

### Моніторинг застосунку
```bash
# Відкрити портал Azure для ваших ресурсів
azd monitor

# Переглянути журнали застосунків
azd monitor --logs

# Переглянути показники в реальному часі
azd monitor --live
```

## Крок 6: Внесіть зміни та повторно розгорніть

Давайте внесемо зміну і побачимо, як легко оновити застосунок:

### Змініть API
```bash
# Редагувати код API
code src/api/src/routes/lists.js
```

Додайте власний заголовок відповіді:
```javascript
// Знайдіть обробник маршруту та додайте:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Розгорніть лише зміни коду
```bash
# Розгорнути лише код додатку (пропустити інфраструктуру)
azd deploy

# Це набагато швидше за 'azd up', оскільки інфраструктура вже існує
```

## Крок 7: Керуйте кількома середовищами

Створіть тестове середовище для перевірки змін перед продакшном:

```bash
# Створити нове середовище для тестування
azd env new staging

# Розгорнути на середовищі тестування
azd up

# Повернутися до середовища розробки
azd env select dev

# Показати всі середовища
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

## Крок 8: Очистіть ресурси

Коли завершите експерименти, очистіть ресурси, щоб уникнути подальших витрат:

```bash
# Видалити всі ресурси Azure для поточного середовища
azd down

# Примусово видалити без підтвердження та очистити ресурси, що були мяко видалені
azd down --force --purge

# Видалити конкретне середовище
azd env select staging
azd down --force --purge
```

## Класичний застосунок vs. застосунок з AI: однаковий робочий процес

Ви щойно розгорнули традиційний веб-застосунок. А що як ви хочете розгорнути AI-застосунок, наприклад чат із підтримкою Microsoft Foundry Models?

Добра новина: **робочий процес ідентичний.**

| Крок | Класичний Todo-застосунок | AI чат-застосунок |
|------|-------------------------|-------------------|
| Ініціалізація | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Аутентифікація | `azd auth login` | `azd auth login` |
| Розгортання | `azd up` | `azd up` |
| Моніторинг | `azd monitor` | `azd monitor` |
| Очищення | `azd down --force --purge` | `azd down --force --purge` |

Єдина різниця — **шаблон**, з якого ви починаєте. AI-шаблон включає додаткову інфраструктуру (наприклад ресурс Microsoft Foundry Models чи індекс AI Search), але azd усе це обробляє за вас. Не потрібно вивчати нові команди, знімати інші інструменти чи змінювати підхід до розгортання.

Це основний принцип azd: **один робочий процес для будь-якого навантаження.** Навички, які ви практикували у цьому посібнику — ініціалізація, розгортання, моніторинг, повторне розгортання та очищення — однаково застосовні до AI-застосунків і агентів.

---

## Чого ви навчилися

Вітаємо! Ви успішно:
- ✅ Ініціалізували проєкт azd з шаблону
- ✅ Ознайомилися зі структурою проєкту та ключовими файлами
- ✅ Розгорнули повнофункціональний застосунок в Azure
- ✅ Внесли зміни в код і повторно розгорнули застосунок
- ✅ Керували кількома середовищами
- ✅ Очистили ресурси

## 🎯 Практичні завдання для перевірки навичок

### Завдання 1: Розгорніть інший шаблон (15 хвилин)
**Мета**: Показати навички ініціалізації azd та процесу розгортання

```bash
# Спробуйте стек Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Перевірте розгортання
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Очистити
azd down --force --purge
```

**Критерії успіху:**
- [ ] Застосунок розгортається без помилок
- [ ] Доступ до застосунку через URL у браузері
- [ ] Застосунок працює коректно (додавання/видалення todo)
- [ ] Всі ресурси успішно очищені

### Завдання 2: Налаштуйте конфігурацію (20 хвилин)
**Мета**: Практика налаштування змінних середовища

```bash
cd my-first-azd-app

# Створити власне середовище
azd env new custom-config

# Встановити власні змінні
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Перевірити змінні
azd env get-values | grep APP_TITLE

# Розгорнути з власною конфігурацією
azd up
```

**Критерії успіху:**
- [ ] Створено власне середовище
- [ ] Змінні середовища встановлені та доступні
- [ ] Застосунок розгорнуто з кастомною конфігурацією
- [ ] Можна перевірити налаштування у розгорнутому застосунку

### Завдання 3: Робочий процес з кількома середовищами (25 хвилин)
**Мета**: Опанувати керування середовищами та стратегії розгортання

```bash
# Створити середовище розробки
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Зафіксувати URL розробки
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Створити тестове середовище
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Зафіксувати URL тестового середовища
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
- [ ] Можна перемикатися між середовищами за допомогою `azd env select`
- [ ] Змінні середовища відрізняються у різних середовищах
- [ ] Обидва середовища були успішно очищені

## 📊 Ваш прогрес

**Інвестований час**: ~60-90 хвилин  
**Опановані навички**:
- ✅ Ініціалізація проєктів на базі шаблонів
- ✅ Надання ресурсів Azure
- ✅ Робочі процеси розгортання застосунків
- ✅ Керування середовищами
- ✅ Керування конфігурацією
- ✅ Очищення ресурсів і управління витратами

**Наступний рівень**: Ви готові до [Посібника з конфігурації](configuration.md) для вивчення просунутих шаблонів налаштувань!

## Вирішення поширених проблем

### Помилки аутентифікації
```bash
# Повторно автентифікуйтеся через Azure
az login

# Перевірте доступ до підписки
az account show
```

### Помилки розгортання
```bash
# Увімкнути ведення журналу відлагодження
export AZD_DEBUG=true
azd up --debug

# Переглянути журнали додатків в Azure
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
- [Інфраструктура як код](../chapter-04-infrastructure/provisioning.md)
- [Додавання баз даних, сховищ та інших сервісів](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Налаштування CI/CD
- [Посібник з розгортання](../chapter-04-infrastructure/deployment-guide.md) - повні робочі процеси CI/CD
- [Документація Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - налаштування конвеєрів

### 3. Кращі практики для продакшну
- [Посібник з розгортання](../chapter-04-infrastructure/deployment-guide.md) - безпека, продуктивність та моніторинг

### 4. Досліджуйте більше шаблонів
```bash
# Переглядайте шаблони за категоріями
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Спробуйте різні технологічні стекі
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
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
- [Шаблони від спільноти](https://github.com/Azure-Samples/azd-templates)
- [Корпоративні шаблони](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Вітаємо з завершенням вашого першого проєкту azd!** Тепер ви готові з упевненістю створювати та розгортати неймовірні застосунки в Azure.

---

**Навігація розділом:**
- **📚 Головна сторінка курсу**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 1 - Основи та швидкий старт
- **⬅️ Попередній**: [Встановлення та налаштування](installation.md)
- **➡️ Наступний**: [Конфігурація](configuration.md)
- **🚀 Наступний розділ**: [Розділ 2: Розробка з пріоритетом AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Наступний урок**: [Посібник з розгортання](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, зверніть увагу, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->