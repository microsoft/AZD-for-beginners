# Ваш перший проєкт – практичний посібник

**Навігація по розділах:**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 1 - Основи та швидкий старт
- **⬅️ Попередній**: [Встановлення та налаштування](installation.md)
- **➡️ Наступний**: [Конфігурація](configuration.md)
- **🚀 Наступний розділ**: [Розділ 2: Розробка з пріоритетом штучного інтелекту](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Вступ

Ласкаво просимо до вашого першого проєкту з Azure Developer CLI! Цей комплексний практичний посібник забезпечує повний огляд створення, розгортання та керування повнотекстним застосунком на Azure за допомогою azd. Ви працюватимете з реальним застосунком todo, який включає frontend на React, backend API на Node.js та базу даних MongoDB.

## Цілі навчання

Завдяки завершенню цього посібника ви:
- Опануєте робочий процес ініціалізації проєкту azd за допомогою шаблонів
- Зрозумієте структуру проєкту Azure Developer CLI та файли конфігурації
- Виконаєте повне розгортання застосунку в Azure із створенням інфраструктури
- Реалізуєте стратегії оновлення застосунку та повторного розгортання
- Керуватимете кількома середовищами для розробки та тестування
- Застосуєте практики очистки ресурсів та управління витратами

## Результати навчання

Після завершення ви зможете:
- Самостійно ініціалізувати та налаштовувати проєкти azd із шаблонів
- Ефективно орієнтуватися та модифікувати структури проєктів azd
- Розгортати повностекові застосунки в Azure однією командою
- Усувати типові проблеми розгортання та автентифікації
- Керувати кількома середовищами Azure для різних стадій розгортання
- Впроваджувати безперервні робочі процеси розгортання для оновлення застосунків

## Початок роботи

### Перевірочний список передумов
- ✅ Встановлений Azure Developer CLI ([посібник з встановлення](installation.md))
- ✅ Встановлений та автентифікований Azure CLI
- ✅ Git встановлено на вашій системі
- ✅ Node.js 16+ (для цього посібника)
- ✅ Visual Studio Code (рекомендовано)

### Перевірте своє середовище
```bash
# Перевірте встановлення azd
azd version
```
### Перевірка автентифікації в Azure

```bash
az account show
```

### Перевірте версію Node.js
```bash
node --version
```

## Крок 1: Виберіть і ініціалізуйте шаблон

Почнемо з популярного шаблону застосунку todo, який включає frontend на React і backend API на Node.js.

```bash
# Перегляньте доступні шаблони
azd template list

# Ініціалізуйте шаблон додатку todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Дотримуйтесь підказок:
# - Введіть назву середовища: "dev"
# - Виберіть підписку (якщо у вас кілька)
# - Виберіть регіон: "East US 2" (або ваш улюблений регіон)
```

### Що щойно сталося?
- Завантажено код шаблону у вашу локальну папку
- Створено файл `azure.yaml` із визначеннями сервісів
- Налаштовано код інфраструктури у каталозі `infra/`
- Створено конфігурацію середовища

## Крок 2: Ознайомтесь зі структурою проєкту

Розглянемо, що створив azd:

```bash
# Переглянути структуру проекту
tree /f   # Windows
# або
find . -type f | head -20   # macOS/Linux
```

Ви побачите:
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

### Ключові файли для розуміння

**azure.yaml** – серце вашого проєкту azd:
```bash
# Переглянути конфігурацію проекту
cat azure.yaml
```

**infra/main.bicep** – визначення інфраструктури:
```bash
# Переглянути код інфраструктури
head -30 infra/main.bicep
```

## Крок 3: Налаштуйте свій проєкт (за бажанням)

Перед розгортанням ви можете налаштувати застосунок:

### Змініть frontend
```bash
# Відкрити компонент React застосунку
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

## Крок 4: Розгорніть у Azure

Тепер найцікавіше – розгортання всього в Azure!

```bash
# Розгорнути інфраструктуру та додаток
azd up

# Ця команда виконає:
# 1. Надання ресурсів Azure (App Service, Cosmos DB тощо)
# 2. Збірку вашого додатку
# 3. Розгортання на наданих ресурсах
# 4. Відображення URL додатку
```

### Що відбувається під час розгортання?

Команда `azd up` виконує такі кроки:
1. **Provision** (`azd provision`) – створює ресурси Azure
2. **Package** – збирає код вашого застосунку
3. **Deploy** (`azd deploy`) – розгортає код на ресурсах Azure

### Очікуваний результат
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Крок 5: Перевірте ваш застосунок

### Доступ до застосунку
Клацніть на URL, наведений у результатах розгортання, або отримайте його в будь-який час:
```bash
# Отримати кінцеві точки застосунку
azd show

# Відкрийте застосунок у вашому браузері
azd show --output json | jq -r '.services.web.endpoint'
```

### Тестуйте додаток todo
1. **Додайте завдання** – натисніть "Add Todo" і введіть завдання
2. **Позначте як виконане** – відмітьте завершені пункти
3. **Видаліть завдання** – видаліть непотрібні todos

### Моніторинг вашого застосунку
```bash
# Відкрити портал Azure для ваших ресурсів
azd monitor

# Переглянути журнали додатка
azd monitor --logs

# Переглянути живі метрики
azd monitor --live
```

## Крок 6: Внесіть зміни і повторно розгорніть

Давайте внесемо зміну і подивимось, як просто оновити:

### Змініть API
```bash
# Редагуйте код API
code src/api/src/routes/lists.js
```

Додайте власне заголовок відповіді:
```javascript
// Знайдіть обробник маршруту та додайте:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Розгорніть тільки змінений код
```bash
# Розгорнути лише код додатку (пропустити інфраструктуру)
azd deploy

# Це значно швидше за 'azd up', оскільки інфраструктура вже існує
```

## Крок 7: Керуйте кількома середовищами

Створіть staging-середовище для тестування змін перед продуктивом:

```bash
# Створити нове тестове середовище
azd env new staging

# Розгорнути у тестовому середовищі
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

Коли експерименти завершені, очистіть ресурси, щоб уникнути зайвих витрат:

```bash
# Видалити всі ресурси Azure для поточного середовища
azd down

# Примусово видалити без підтвердження та очищення ресурсів, видалених у "soft-delete"
azd down --force --purge

# Видалити конкретне середовище
azd env select staging
azd down --force --purge
```

## Класичний застосунок проти застосунку з ШІ: однаковий робочий процес

Ви щойно розгорнули традиційний веб-застосунок. А що якби ви хотіли розгорнути застосунок із ШІ — скажімо, чат-застосунок, що базується на Microsoft Foundry Models?

Добра новина: **робочий процес однаковий.**

| Крок | Класичний застосунок Todo | Застосунок AI Chat |
|------|---------------------------|--------------------|
| Ініціалізація | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Аутентифікація | `azd auth login` | `azd auth login` |
| Розгортання | `azd up` | `azd up` |
| Моніторинг | `azd monitor` | `azd monitor` |
| Очищення | `azd down --force --purge` | `azd down --force --purge` |

Єдина відмінність — **шаблон**, з якого ви стартуєте. Шаблон з ШІ включає додаткову інфраструктуру (наприклад, ресурс Microsoft Foundry Models або індекс AI Search), але azd все це обробляє за вас. Вам не потрібно вивчати нові команди, використовувати інші інструменти або змінювати спосіб розгортання.

Це основний принцип azd: **один робочий процес, будь-яке навантаження.** Навички, які ви опанували в цьому посібнику — ініціалізація, розгортання, моніторинг, повторне розгортання та очищення — однаково застосовні для застосунків і агентів зі штучним інтелектом.

---

## Чого ви навчилися

Вітаємо! Ви успішно:
- ✅ Ініціалізували проєкт azd із шаблону
- ✅ Ознайомилися зі структурою проєкту та ключовими файлами
- ✅ Розгорнули повностековий застосунок в Azure
- ✅ Внесли зміни в код і повторно розгорнули
- ✅ Керували кількома середовищами
- ✅ Очистили ресурси

## 🎯 Вправи для перевірки навичок

### Вправа 1: Розгорніть інший шаблон (15 хвилин)
**Мета**: Продемонструвати оволодіння ініціалізацією azd та робочим процесом розгортання

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
- [ ] Можна отримати доступ до URL застосунку у браузері
- [ ] Застосунок працює коректно (додавання/видалення todo)
- [ ] Успішно очищено всі ресурси

### Вправа 2: Налаштуйте конфігурацію (20 хвилин)
**Мета**: Попрактикуватися у конфігурації змінних середовища

```bash
cd my-first-azd-app

# Створити кастомне середовище
azd env new custom-config

# Встановити кастомні змінні
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Перевірити змінні
azd env get-values | grep APP_TITLE

# Розгорнути з кастомною конфігурацією
azd up
```

**Критерії успіху:**
- [ ] Створено власне середовище
- [ ] Змінні середовища встановлено та їх можна отримати
- [ ] Застосунок розгортається з власною конфігурацією
- [ ] Можна перевірити користувацькі налаштування в розгорнутому застосунку

### Вправа 3: Робочий процес із кількома середовищами (25 хвилин)
**Мета**: Оволодіти управлінням середовищами і стратегіями розгортання

```bash
# Створити середовище розробки
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Записати URL розробки
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Створити середовище проміжного тестування
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Записати URL проміжного тестування
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
- [ ] Обидва середовища успішно розгорнуто
- [ ] Можна переключатися між середовищами за допомогою `azd env select`
- [ ] Змінні середовища відрізняються між середовищами
- [ ] Успішно очищено обидва середовища

## 📊 Ваш прогрес

**Загальний час**: ~60-90 хвилин  
**Опановані навички**:
- ✅ Ініціалізація проєкту на базі шаблонів
- ✅ Створення ресурсів Azure
- ✅ Робочі процеси розгортання застосунку
- ✅ Управління середовищами
- ✅ Конфігурація
- ✅ Очищення ресурсів та управління витратами

**Наступний рівень**: Ви готові до [Посібника з конфігурації](configuration.md), щоб опанувати розширені шаблони конфігурації!

## Усунення поширених проблем

### Помилки автентифікації
```bash
# Повторно автентифікуйтеся за допомогою Azure
az login

# Перевірте доступ до підписки
az account show
```

### Неуспішні розгортання
```bash
# Увімкнути журналювання відладки
export AZD_DEBUG=true
azd up --debug

# Переглянути журнали застосунку в Azure
azd monitor --logs

# Для Container Apps використовуйте Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Конфлікти імен ресурсів
```bash
# Використовуйте унікальне ім’я середовища
azd env new dev-$(whoami)-$(date +%s)
```

### Проблеми портів/мережі
```bash
# Перевірте, чи порти доступні
netstat -an | grep :3000
netstat -an | grep :3100
```

## Наступні кроки

Після завершення першого проєкту вивчайте ці просунуті теми:

### 1. Налаштуйте інфраструктуру
- [Інфраструктура як код](../chapter-04-infrastructure/provisioning.md)
- [Додайте бази даних, сховища та інші сервіси](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Налаштуйте CI/CD
- [Посібник з розгортання](../chapter-04-infrastructure/deployment-guide.md) – повні робочі процеси CI/CD
- [Документація Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) – налаштування конвеєра

### 3. Найкращі практики для продуктиву
- [Посібник з розгортання](../chapter-04-infrastructure/deployment-guide.md) – безпека, продуктивність і моніторинг

### 4. Дослідіть більше шаблонів
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
- [Добре структурована архітектура Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### Спільнота та підтримка
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Спільнота розробників Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблони та приклади
- [Офіційна галерея шаблонів](https://azure.github.io/awesome-azd/)
- [Спільнотні шаблони](https://github.com/Azure-Samples/azd-templates)
- [Патерни для підприємств](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Вітаємо з успішним завершенням першого проєкту azd!** Тепер ви готові впевнено створювати та розгортати дивовижні застосунки в Azure.

---

**Навігація по розділах:**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 1 - Основи та швидкий старт
- **⬅️ Попередній**: [Встановлення та налаштування](installation.md)
- **➡️ Наступний**: [Конфігурація](configuration.md)
- **🚀 Наступний розділ**: [Розділ 2: Розробка з пріоритетом штучного інтелекту](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Наступний урок**: [Посібник з розгортання](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу AI-перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматизовані переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критичної інформації рекомендується звертатися до професійного людського перекладу. Ми не несемо відповідальності за будь-які непорозуміння чи неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->