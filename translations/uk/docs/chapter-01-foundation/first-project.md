# Ваш перший проєкт — практичний посібник

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 1 — Основи та швидкий старт
- **⬅️ Попередній**: [Встановлення та налаштування](installation.md)
- **➡️ Наступний**: [Конфігурація](configuration.md)
- **🚀 Наступний розділ**: [Розділ 2: Розробка з AI-першим підходом](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Вступ

Ласкаво просимо до вашого першого проєкту Azure Developer CLI! Цей комплексний практичний посібник проводить вас крок за кроком через створення, розгортання та керування повноцінним стековим застосунком на Azure за допомогою azd. Ви працюватимете з реальним застосунком todo, який включає React-фронтенд, Node.js API бекенд та базу даних MongoDB.

## Цілі навчання

Виконавши цей посібник, ви:
- Опануєте процес ініціалізації проєктів azd за допомогою шаблонів
- Зрозумієте структуру проєкту Azure Developer CLI та файли конфігурації
- Виконаєте повне розгортання застосунку в Azure з розгортанням інфраструктури
- Реалізуєте оновлення застосунку та стратегії повторного розгортання
- Керуєте кількома середовищами для розробки та тестування
- Застосуєте практики очищення ресурсів і керування витратами

## Результати навчання

Після завершення ви зможете:
- Ініціалізувати та налаштовувати проєкти azd з шаблонів самостійно
- Орієнтуватися та змінювати структуру проєкту azd ефективно
- Розгортати повноцінні стекові застосунки в Azure однією командою
- Вирішувати типові проблеми розгортання та автентифікації
- Керувати кількома Azure-середовищами для різних етапів розгортання
- Впроваджувати безперервні робочі процеси розгортання оновлень застосунку

## Початок роботи

### Перевірка передумов
- ✅ Встановлено Azure Developer CLI ([Посібник з встановлення](installation.md))
- ✅ Завершена автентифікація AZD за допомогою `azd auth login`
- ✅ Git встановлено на вашій системі
- ✅ Node.js 16+ (для цього посібника)
- ✅ Visual Studio Code (рекомендується)

Перш ніж продовжити, запустіть валідатор налаштувань із кореневого каталогу репозиторію:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Перевірте своє середовище
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

## Крок 1: Виберіть і ініціалізуйте шаблон

Почнемо з популярного шаблону застосунку todo, який включає React-фронтенд та Node.js API бекенд.

```bash
# Переглянути доступні шаблони
azd template list

# Ініціалізувати шаблон додатку завдань
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Дотримуйтесь підказок:
# - Введіть ім'я середовища: "dev"
# - Виберіть підписку (якщо у вас їх кілька)
# - Виберіть регіон: "East US 2" (або ваш бажаний регіон)
```

### Що щойно сталося?
- Завантажено код шаблону у вашу локальну директорію
- Створено файл `azure.yaml` із визначеннями сервісів
- Налаштовано код інфраструктури у директорії `infra/`
- Створено конфігурацію середовища

## Крок 2: Ознайомтеся зі структурою проєкту

Переглянемо, що azd створив для нас:

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

**azure.yaml** — серце вашого проєкту azd:
```bash
# Переглянути конфігурацію проєкту
cat azure.yaml
```

**infra/main.bicep** — визначення інфраструктури:
```bash
# Переглянути код інфраструктури
head -30 infra/main.bicep
```

## Крок 3: Налаштуйте проєкт (опційно)

Перед розгортанням ви можете налаштувати застосунок:

### Змініть фронтенд
```bash
# Відкрити компонент React-додатку
code src/web/src/App.tsx
```

Зробіть просту зміну:
```typescript
// Знайдіть заголовок і змініть його
<h1>My Awesome Todo App</h1>
```

### Налаштуйте змінні середовища
```bash
# Встановити користувацькі змінні оточення
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Переглянути всі змінні оточення
azd env get-values
```

## Крок 4: Розгорніть в Azure

Настав час цікавого — розгорнути все в Azure!

```bash
# Розгорнути інфраструктуру та додаток
azd up

# Ця команда виконає:
# 1. Надання ресурсів Azure (App Service, Cosmos DB тощо)
# 2. Побудову вашого додатка
# 3. Розгортання на наданих ресурсах
# 4. Відображення URL додатка
```

### Що відбувається під час розгортання?

Команда `azd up` виконує такі кроки:
1. **Provision** (`azd provision`) — створює ресурси Azure
2. **Package** — збирає ваш код застосунку
3. **Deploy** (`azd deploy`) — розгортає код у ресурси Azure

### Очікуваний результат
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Крок 5: Перевірте застосунок

### Доступ до застосунку
Клацніть на URL, який наданий в результаті розгортання, або отримайте його будь-коли:
```bash
# Отримати кінцеві точки застосунку
azd show

# Відкрийте застосунок у вашому браузері
azd show --output json | jq -r '.services.web.endpoint'
```

### Перевірте застосунок Todo
1. **Додайте завдання** — натисніть "Add Todo" та введіть завдання
2. **Позначте як виконане** — відмітьте виконані завдання
3. **Видаліть завдання** — видаліть непотрібні todo  

### Моніторинг вашого застосунку
```bash
# Відкрити портал Azure для ваших ресурсів
azd monitor

# Переглянути журнали додатка
azd monitor --logs

# Переглянути живі метрики
azd monitor --live
```

### ✅ Перевірка розгортання

Перед тим, як рухатися далі, виконайте цей швидкий чеклист, щоб упевнитися, що все дійсно працює — не припускайте, що “розгортання вдалося” означає “застосунок працює”:

```bash
# 1. Підтвердьте, що кінцева точка існує і досяжна
azd show

# 2. Проведіть начальний тест кінцевої точки (очікується HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Перевірте кінцеву точку здоров'я, якщо ваш додаток її надає
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Розгортання вважається перевіреним, якщо:**
- ✅ `azd show` показує доступний URL кінцевої точки
- ✅ URL відкривається у браузері без помилок
- ✅ Основні функції працюють (додавання/виконання/видалення todo)
- ✅ `azd monitor --logs` показує запити без несподіваних помилок

Якщо якась перевірка не пройшла, перейдіть до [Розділ 7: Вирішення проблем](../chapter-07-troubleshooting/README.md).

## Крок 6: Внесіть зміни та повторно розгорніть

Давайте внесемо зміни і подивимося, як просто оновити застосунок:

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
# Розгортайте лише код застосунку (пропустіть інфраструктуру)
azd deploy

# Це набагато швидше, ніж 'azd up', оскільки інфраструктура вже існує
```

## Крок 7: Керування кількома середовищами

Створіть тестове середовище (staging) для перевірки змін перед продуктивом:

```bash
# Створити нове проміжне середовище
azd env new staging

# Розгорнути на проміжному середовищі
azd up

# Повернутися до середовища розробки
azd env select dev

# Перелічити всі середовища
azd env list
```

### Порівняння середовищ
```bash
# Переглянути середовище розробки
azd env select dev
azd show

# Переглянути середовище тестування
azd env select staging
azd show
```

## Крок 8: Очистіть ресурси

Коли закінчите експериментувати, приберіть ресурси, щоб уникнути подальших витрат:

```bash
# Видалити всі ресурси Azure для поточного середовища
azd down

# Примусово видалити без підтвердження та очистити м’яко видалені ресурси
azd down --force --purge

# Видалити конкретне середовище
azd env select staging
azd down --force --purge
```

## Класичний застосунок vs. застосунок з AI: однаковий робочий процес

Ви щойно розгорнули традиційний веб-застосунок. А що, як би ви хотіли розгорнути застосунок з AI — наприклад, чат з підтримкою Microsoft Foundry Models?

Добрі новини: **робочий процес ідентичний.**

| Крок | Класичний Todo-застосунок | AI Chat-застосунок |
|------|----------------------------|--------------------|
| Ініціалізація | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Автентифікація | `azd auth login` | `azd auth login` |
| Розгортання | `azd up` | `azd up` |
| Моніторинг | `azd monitor` | `azd monitor` |
| Очищення | `azd down --force --purge` | `azd down --force --purge` |

Єдина різниця — це **шаблон**, з якого ви починаєте. AI-шаблон включає додаткову інфраструктуру (наприклад, ресурс Microsoft Foundry Models або індекс AI Search), але azd усе це обробляє за вас. Вам не потрібно вивчати нові команди, освоювати інструменти або міняти підхід до розгортання.

Це основний принцип azd: **один робочий процес для будь-якого навантаження.** Навички, які ви практикували в цьому посібнику — ініціалізація, розгортання, моніторинг, повторне розгортання та очищення — однаково застосовні для AI-застосунків та агентів.

---

## Чого ви навчилися

Вітаємо! Ви успішно:
- ✅ Ініціалізували проєкт azd з шаблону
- ✅ Ознайомились зі структурою проєкту та ключовими файлами
- ✅ Розгорнули повноцінний стековий застосунок в Azure
- ✅ Зробили зміни в коді та повторно розгорнули
- ✅ Керували кількома середовищами
- ✅ Очистили ресурси

## 🎯 Вправи для перевірки навичок

### Вправа 1: Розгорніть інший шаблон (15 хвилин)
**Мета**: Показати володіння командами azd init і розгортання

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
- [ ] URL застосунку доступний у браузері
- [ ] Застосунок функціонує коректно (додавання/видалення todo)
- [ ] Успішне очищення всіх ресурсів

### Вправа 2: Налаштуйте конфігурацію (20 хвилин)
**Мета**: Практика конфігурації змінних середовища

```bash
cd my-first-azd-app

# Створити власне оточення
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
- [ ] Вдале створення налаштованого середовища
- [ ] Змінні середовища встановлені та доступні
- [ ] Застосунок розгорнуто з кастомною конфігурацією
- [ ] Можна перевірити налаштування у розгорнутому застосунку

### Вправа 3: Робочий процес для кількох середовищ (25 хвилин)
**Мета**: Опанувати керування середовищами та стратегії розгортання

```bash
# Створіть середовище розробки
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Запишіть URL середовища розробки
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Створіть тестове середовище
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Запишіть URL тестового середовища
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Порівняйте середовища
azd env list

# Протестуйте обидва середовища
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Очистіть обидва середовища
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Критерії успіху:**
- [ ] Створено два середовища з різними конфігураціями
- [ ] Обидва середовища розгорнуто успішно
- [ ] Можна перемикатися між середовищами за допомогою `azd env select`
- [ ] Змінні середовища відрізняються між середовищами
- [ ] Успішне очищення обох середовищ

## 📊 Ваш прогрес

**Час, витрачений:** ~60-90 хвилин  
**Опановані навички:**
- ✅ Ініціалізація проєктів на основі шаблонів
- ✅ Забезпечення ресурсів Azure
- ✅ Робочі процеси розгортання застосунків
- ✅ Керування середовищами
- ✅ Керування конфігурацією
- ✅ Очищення ресурсів та контроль витрат

**Наступний рівень:** Ви готові до [Посібника з конфігурації](configuration.md), щоб вивчити розширені шаблони конфігурації!

## Вирішення типових проблем

### Помилки автентифікації
```bash
# Повторно аутентифікуйтеся за допомогою Azure
az login

# Перевірте доступ до підписки
az account show
```

### Помилки розгортання
```bash
# Увімкнути налагоджувальне логування
export AZD_DEBUG=true
azd up --debug

# Переглядати логи додатка в Azure
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

Тепер, коли ви завершили перший проєкт, дослідіть ці просунуті теми:

### 1. Налаштуйте інфраструктуру
- [Інфраструктура як код](../chapter-04-infrastructure/provisioning.md)
- [Додайте бази даних, сховища та інші сервіси](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Налаштуйте CI/CD
- [Посібник з розгортання](../chapter-04-infrastructure/deployment-guide.md) — повні робочі процеси CI/CD
- [Документація Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) — налаштування pipeline

### 3. Кращі практики для продакшену
- [Посібник з розгортання](../chapter-04-infrastructure/deployment-guide.md) — безпека, продуктивність та моніторинг

### 4. Дослідіть більше шаблонів
```bash
# Переглядайте шаблони за категоріями
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Спробуйте різні технологічні стеки
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Додаткові ресурси

### Навчальні матеріали
- [Документація Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Центр архітекторів Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Спільнота і підтримка
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Спільнота розробників Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow — azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблони та приклади
- [Офіційна галерея шаблонів](https://azure.github.io/awesome-azd/)
- [Шаблони спільноти](https://github.com/Azure-Samples/azd-templates)
- [Корпоративні шаблони](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Вітаємо з успішним завершенням першого проєкту azd!** Тепер ви готові створювати та розгортати дивовижні застосунки на Azure з упевненістю.

---

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 1 — Основи та швидкий старт
- **⬅️ Попередній**: [Встановлення та налаштування](installation.md)
- **➡️ Наступний**: [Додайте власний застосунок](bring-your-own-app.md)
- **🚀 Наступний розділ**: [Розділ 2: Розробка з AI-першим підходом](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->