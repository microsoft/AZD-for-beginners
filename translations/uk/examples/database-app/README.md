# Розгортання бази даних Microsoft SQL та веб-додатку за допомогою AZD

⏱️ **Оцінений час**: 20-30 хвилин | 💰 **Оцінена вартість**: ~$15-25/місяць | ⭐ **Складність**: Середній рівень

Цей **повний, робочий приклад** демонструє, як використовувати [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) для розгортання веб-додатку Python Flask з базою даних Microsoft SQL в Azure. Весь код включений і протестований — зовнішні залежності не потрібні.

## Чого ви навчитесь

Виконавши цей приклад, ви:
- Розгорнете багаторівневий додаток (веб-додаток + база даних) за допомогою інфраструктури як коду
- Налаштуєте безпечне з'єднання з базою даних без жорсткого кодування секретів
- Моніторитимете стан додатку за допомогою Application Insights
- Ефективно керуватимете ресурсами Azure за допомогою AZD CLI
- Дотримуватиметесь найкращих практик Azure з безпеки, оптимізації вартості та спостережуваності

## Огляд сценарію
- **Веб-додаток**: REST API на Python Flask з підключенням до бази даних
- **База даних**: Azure SQL Database з прикладами даних
- **Інфраструктура**: Забезпечена за допомогою Bicep (модульні, багаторазові шаблони)
- **Розгортання**: Повністю автоматизоване з командами `azd`
- **Моніторинг**: Application Insights для логів та телеметрії

## Передумови

### Необхідні інструменти

Перед початком переконайтесь, що ви маєте встановлені ці інструменти:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (версія 2.50.0 або вище)
   ```sh
   az --version
   # Очікуваний результат: azure-cli 2.50.0 або новіша версія
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (версія 1.0.0 або вище)
   ```sh
   azd version
   # Очікуваний вивід: azd версія 1.0.0 або вище
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (для локальної розробки)
   ```sh
   python --version
   # Очікуваний результат: Python 3.8 або вище
   ```

4. **[Docker](https://www.docker.com/get-started)** (опційно, для локальної контейнеризованої розробки)
   ```sh
   docker --version
   # Очікуваний результат: версія Docker 20.10 або новіша
   ```

### Вимоги Azure

- Активна **підписка Azure** ([створити безкоштовний акаунт](https://azure.microsoft.com/free/))
- Права на створення ресурсів у вашій підписці
- Роль **Owner** або **Contributor** у підписці чи групі ресурсів

### Необхідні знання

Це приклад **середнього рівня**. Ви повинні знати:
- Основні операції з командним рядком
- Базові концепції хмари (ресурси, групи ресурсів)
- Загальне уявлення про веб-додатки та бази даних

**Новачок у AZD?** Почніть з посібника [Початок роботи](../../docs/chapter-01-foundation/azd-basics.md).

## Архітектура

Цей приклад розгортає двошарову архітектуру з веб-додатком і базою даних SQL:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**Розгортання ресурсів:**
- **Група ресурсів**: контейнер для всіх ресурсів
- **План App Service**: хостинг на Linux (рівень B1 для економії)
- **Веб-додаток**: середовище виконання Python 3.11 з додатком Flask
- **SQL сервер**: кероване серверне середовище з TLS 1.2 мінімум
- **SQL база даних**: базовий рівень (2ГБ, підходить для розробки/тестування)
- **Application Insights**: моніторинг та логування
- **Log Analytics Workspace**: централізоване зберігання логів

**Аналогія**: Уявіть ресторан (веб-додаток) з холодильником (база даних). Клієнти роблять замовлення в меню (інтерфейси API), кухня (додаток Flask) бере інгредієнти (дані) з холодильника. Менеджер ресторану (Application Insights) слідкує за всім, що відбувається.

## Структура папок

Всі файли включені — без зовнішніх залежностей:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**Призначення файлів:**
- **azure.yaml**: визначає, що та де розгортати через AZD
- **infra/main.bicep**: керує всіма ресурсами Azure
- **infra/resources/*.bicep**: визначення окремих ресурсів (модульно для багаторазового використання)
- **src/web/app.py**: додаток Flask з логікою для бази даних
- **requirements.txt**: залежності Python пакетів
- **Dockerfile**: інструкції для контейнеризації та розгортання

## Швидкий старт (покроково)

### Крок 1: Клонувати та перейти в каталог

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Перевірка успіху**: Переконайтеся, що бачите файл `azure.yaml` та папку `infra/`:
```sh
ls
# Очікувано: README.md, azure.yaml, infra/, src/
```

### Крок 2: Аутентифікація в Azure

```sh
azd auth login
```

Відкриється браузер для автентифікації в Azure. Увійдіть за допомогою облікових даних Azure.

**✓ Перевірка успіху**: Ви повинні побачити:
```
Logged in to Azure.
```

### Крок 3: Ініціалізація оточення

```sh
azd init
```

**Що відбувається**: AZD створює локальні налаштування для вашого розгортання.

**Запити, які побачите**:
- **Назва оточення**: введіть коротку назву (наприклад, `dev`, `myapp`)
- **Підписка Azure**: оберіть із списку підписку
- **Регіон Azure**: виберіть регіон (наприклад, `eastus`, `westeurope`)

**✓ Перевірка успіху**: Ви повинні побачити:
```
SUCCESS: New project initialized!
```

### Крок 4: Забезпечення ресурсів у Azure

```sh
azd provision
```

**Що відбувається**: AZD розгортає всю інфраструктуру (5-8 хвилин):
1. Створює групу ресурсів
2. Створює SQL сервер та базу даних
3. Створює план App Service
4. Створює веб-додаток
5. Створює Application Insights
6. Налаштовує мережу та безпеку

**Вас запитають**:
- **Ім’я адміністратора SQL**: введіть ім’я користувача (наприклад, `sqladmin`)
- **Пароль адміністратора SQL**: введіть надійний пароль (збережіть!)

**✓ Перевірка успіху**: Ви повинні побачити:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Час**: 5-8 хвилин

### Крок 5: Розгортання додатку

```sh
azd deploy
```

**Що відбувається**: AZD збирає та розгортає додаток Flask:
1. Пакує Python-додаток
2. Створює Docker контейнер
3. Пушить у Azure Web App
4. Ініціалізує базу даних з прикладами даних
5. Запускає додаток

**✓ Перевірка успіху**: Ви повинні побачити:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Час**: 3-5 хвилин

### Крок 6: Відкрити додаток у браузері

```sh
azd browse
```

Веб-додаток відкриється у браузері за адресою `https://app-<unique-id>.azurewebsites.net`

**✓ Перевірка успіху**: Ви побачите JSON-вивід:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### Крок 7: Перевірка API

**Перевірка здоров'я** (перевірка з'єднання з базою даних):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Очікувана відповідь**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Список продуктів** (приклад даних):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Очікувана відповідь**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**Інформація про один продукт**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Перевірка успіху**: Всі виклики повертають JSON без помилок.

---

**🎉 Вітаємо!** Ви успішно розгорнули веб-додаток з базою даних у Azure за допомогою AZD.

## Поглиблене налаштування

### Змінні оточення

Секрети безпечно керуються через конфігурацію Azure App Service — **ніколи не зберігайте їх у коді**.

**Автоматично налаштовується AZD**:
- `SQL_CONNECTION_STRING`: рядок підключення з зашифрованими обліковими даними
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: кінцева точка телеметрії
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: дозволяє автоматичне встановлення залежностей

**Де зберігаються секрети**:
1. Під час `azd provision` ви вводите облікові дані SQL через безпечні підказки
2. AZD зберігає їх у локальному файлі `.azure/<назва-середовища>/.env` (ігнорується Git)
3. AZD виштовхує ці дані у конфігурацію Azure App Service (шифрується у спокої)
4. Додаток зчитує їх через `os.getenv()` під час виконання

### Локальна розробка

Для локального тестування створіть файл `.env` із шаблону:

```sh
cp .env.sample .env
# Відредагуйте .env з підключенням до вашої локальної бази даних
```

**Робочий процес локальної розробки**:
```sh
# Встановити залежності
cd src/web
pip install -r requirements.txt

# Встановити змінні середовища
export SQL_CONNECTION_STRING="your-local-connection-string"

# Запустити застосунок
python app.py
```

**Тестування локально**:
```sh
curl http://localhost:8000/health
# Очікувано: {"status": "healthy", "database": "connected"}
```

### Інфраструктура як код

Всі ресурси Azure визначено у **Bicep-шаблонах** (папка `infra/`):

- **Модульний дизайн**: кожен ресурс у своєму файлі для повторного використання
- **Параметризовані**: можна налаштувати SKU, регіони, іменування
- **Найкращі практики**: дотримання стандартів безпеки та іменування Azure
- **Контроль версій**: зміни відслідковуються в Git

**Приклад налаштування**:
Щоб змінити рівень бази даних, редагуйте `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Найкращі практики безпеки

Цей приклад дотримується найкращих практик безпеки Azure:

### 1. **Без секретів у коді**
- ✅ Облікові дані зберігаються в конфігурації Azure App Service (шифруються)
- ✅ `.env` файли виключені з Git через `.gitignore`
- ✅ Секрети передаються через безпечні параметри під час розгортання

### 2. **Шифровані з’єднання**
- ✅ Мінімум TLS 1.2 для SQL сервера
- ✅ Веб-додаток працює лише по HTTPS
- ✅ З’єднання з базою даних через зашифровані канали

### 3. **Мережева безпека**
- ✅ Брандмауер SQL сервера обмежує доступ тільки для служб Azure
- ✅ Обмежено публічний доступ (можна додатково замкнути через Private Endpoints)
- ✅ FTPS вимкнено для Web App

### 4. **Автентифікація та авторизація**
- ⚠️ **Поточний стан**: автентифікація SQL (користувач/пароль)
- ✅ **Рекомендація для продакшену**: використовувати керовану ідентичність Azure для безпарольної автентифікації

**Щоб перейти до Managed Identity** (для продакшену):
1. Увімкніть керовану ідентичність на Web App
2. Надати SQL права для цієї ідентичності
3. Оновіть рядок підключення для використання керованої ідентичності
4. Відключіть автентифікацію з паролем

### 5. **Аудит і відповідність**
- ✅ Application Insights зберігає всі запити та помилки
- ✅ Аудит SQL бази даних увімкнено (можна підлаштувати для відповідності)
- ✅ Всі ресурси помічені тегами для керування

**Чеклист безпеки перед запуском у продакшен**:
- [ ] Увімкнути Azure Defender для SQL
- [ ] Налаштувати Private Endpoints для SQL Database
- [ ] Увімкнути Web Application Firewall (WAF)
- [ ] Реалізувати Azure Key Vault для обертання секретів
- [ ] Налаштувати автентифікацію Azure AD
- [ ] Увімкнути діагностичне логування для всіх ресурсів

## Оптимізація вартості

**Орієнтовна щомісячна вартість** (станом на листопад 2025):

| Ресурс | SKU/Рівень | Орієнтовна вартість |
|--------|------------|--------------------|
| App Service Plan | B1 (Basic) | ~$13/місяць |
| SQL Database | Basic (2GB) | ~$5/місяць |
| Application Insights | Плата за використання | ~$2/місяць (низький трафік) |
| **Всього** | | **~$20/місяць** |

**💡 Поради для економії**:

1. **Використовуйте безкоштовний рівень для навчання**:
   - App Service: рівень F1 (безкоштовно, обмежена кількість годин)
   - SQL Database: використання серверлес Azure SQL
   - Application Insights: 5ГБ/місяць безкоштовного збору даних

2. **Зупиняйте ресурси, коли не використовуєте**
   ```sh
   # Зупиніть веб-додаток (база даних все ще працює)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Перезапустіть при необхідності
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Видаляйте всі ресурси після тестування**
   ```sh
   azd down
   ```
   Це видалить ВСІ ресурси і припинить нарахування коштів.

4. **Для розробки vs продакшену використовувати різні SKU**:
   - **Розробка**: базовий рівень (в цьому прикладі)
   - **Продакшен**: стандартний/преміум з відмовостійкістю

**Моніторинг вартості**:
- Переглядайте витрати в [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Встановлюйте сповіщення про вартість, щоб уникнути несподіванок
- Маркуйте всі ресурси тегом `azd-env-name` для відстеження

**Альтернатива безкоштовного рівня**:
Для навчальних цілей можна змінити `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Примітка**: Безкоштовний рівень має обмеження (60 хв/день CPU, відсутність функції always-on).

## Моніторинг і спостережуваність

### Інтеграція Application Insights

Цей приклад включає **Application Insights** для повного моніторингу:

**Що моніториться**:
- ✅ HTTP запити (затримка, коди стану, маршрути)
- ✅ Помилки та виключення додатку
- ✅ Користувацьке логування з Flask
- ✅ Стан з’єднання з базою даних
- ✅ Метрики продуктивності (CPU, пам’ять)

**Доступ до Application Insights**:
1. Відкрийте [Azure портал](https://portal.azure.com)
2. Перейдіть у вашу групу ресурсів (`rg-<env-name>`)
3. Клацніть на ресурс Application Insights (`appi-<unique-id>`)

**Корисні запити** (Application Insights → Журнали):

**Перегляд усіх запитів**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Пошук помилок**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Перевірка ендпойнта здоров'я**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Аудит SQL бази даних

**Аудит SQL бази даних увімкнено** для відслідковування:
- Патерни доступу до бази
- Невдалі спроби входу
- Зміни схеми
- Доступ до даних (для відповідності)

**Доступ до журналів аудиту**:
1. Azure портал → SQL Database → Auditing
2. Переглядайте логи у Log Analytics workspace

### Моніторинг у реальному часі

**Перегляд живих метрик**:
1. Application Insights → Live Metrics
2. Спостерігайте запити, збої та продуктивність у реальному часі

**Налаштування сповіщень**:
Створюйте сповіщення про критичні події:
- HTTP 500 помилки > 5 за 5 хвилин
- Відмови з’єднання з базою даних
- Високий час відгуку (>2 секунди)

**Приклад створення оповіщення**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Вирішення проблем

### Поширені проблеми та рішення

#### 1. `azd provision` не працює з повідомленням "Location not available"

**Симптом**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Рішення**:
Виберіть інший регіон Azure або зареєструйте провайдера ресурсів:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Помилка підключення до SQL під час розгортання

**Симптом**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Рішення**:
- Переконайтесь, що брандмауер SQL Server дозволяє послуги Azure (налаштовується автоматично)
- Перевірте, чи правильно введено пароль адміністратора SQL під час `azd provision`
- Переконайтесь, що SQL Server повністю підготовлений (займає 2-3 хвилини)

**Перевірка підключення**:
```sh
# У порталі Azure перейдіть до SQL Database → Редактор запитів
# Спробуйте підключитися з вашими обліковими даними
```

#### 3. Web App показує "Application Error"

**Симптом**:
Браузер показує загальну сторінку помилки.

**Рішення**:
Перевірте логи додатку:
```sh
# Переглянути останні журнали
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Поширені причини**:
- Відсутні змінні середовища (перевірте App Service → Configuration)
- Не вдалося встановити пакети Python (перевірте логи розгортання)
- Помилка ініціалізації бази даних (перевірте підключення до SQL)

#### 4. `azd deploy` не працює з "Build Error"

**Симптом**:
```
Error: Failed to build project
```

**Рішення**:
- Переконайтесь, що у `requirements.txt` немає синтаксичних помилок
- Перевірте, що Python 3.11 вказано у `infra/resources/web-app.bicep`
- Переконайтесь, що Dockerfile має правильний базовий образ

**Налагодження локально**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" під час виконання команд AZD

**Симптом**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Рішення**:
Повторно увійдіть в Azure:
```sh
azd auth login
az login
```

Перевірте наявність правильних дозволів (роль Contributor) у підписці.

#### 6. Високі витрати на базу даних

**Симптом**:
Несподіваний рахунок Azure.

**Рішення**:
- Перевірте, чи не забули виконати `azd down` після тестування
- Переконайтесь, що SQL Database використовує базовий тариф (Basic), а не Premium
- Перегляньте витрати в Azure Cost Management
- Налаштуйте оповіщення про витрати

### Отримання допомоги

**Переглянути всі змінні середовища AZD**:
```sh
azd env get-values
```

**Перевірити статус розгортання**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Доступ до логів додатку**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Потрібна додаткова допомога?**
- [Керівництво з усунення несправностей AZD](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Вирішення проблем Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Вирішення проблем Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Практичні вправи

### Вправа 1: Перевірте Ваше розгортання (Початковий рівень)

**Мета**: Підтвердити, що всі ресурси розгорнуті і додаток працює.

**Кроки**:
1. Перелічіть усі ресурси у вашій групі ресурсів:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Очікується**: 6-7 ресурсів (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Протестуйте всі API кінцеві точки:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Очікується**: Всі повертають дійсний JSON без помилок

3. Перевірте Application Insights:
   - Перейдіть у Application Insights у Azure Portal
   - Відкрийте "Live Metrics"
   - Оновіть сторінку вашого веб-застосунку в браузері
   **Очікується**: Побачити запити в реальному часі

**Критерії успіху**: Всі 6-7 ресурсів існують, всі кінцеві точки повертають дані, у Live Metrics видно активність.

---

### Вправа 2: Додайте нову API кінцеву точку (Середній рівень)

**Мета**: Розширити Flask додаток новою кінцевою точкою.

**Початковий код**: Поточні кінцеві точки у `src/web/app.py`

**Кроки**:
1. Відредагуйте `src/web/app.py` і додайте нову кінцеву точку після функції `get_product()`:
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```

2. Розгорніть оновлений додаток:
   ```sh
   azd deploy
   ```

3. Протестуйте нову кінцеву точку:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Очікується**: Повертає продукти, що містять "laptop"

**Критерії успіху**: Нова кінцева точка працює, повертає відфільтровані результати, з’являється у логах Application Insights.

---

### Вправа 3: Додайте моніторинг та оповіщення (Просунутий рівень)

**Мета**: Налаштувати проактивний моніторинг з оповіщеннями.

**Кроки**:
1. Створіть оповіщення для помилок HTTP 500:
   ```sh
   # Отримати ідентифікатор ресурсу Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Створити сповіщення
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Викличте оповіщення, спричиняючи помилки:
   ```sh
   # Запит неіснуючого продукту
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Перевірте, чи спрацювало оповіщення:
   - Azure Portal → Alerts → Alert Rules
   - Перевірте пошту (якщо налаштовано)

**Критерії успіху**: Правило оповіщення створене, спрацьовує на помилках, приходять повідомлення.

---

### Вправа 4: Зміни у схемі бази даних (Просунутий рівень)

**Мета**: Додати нову таблицю та оновити додаток для її використання.

**Кроки**:
1. Підключіться до SQL Database через Query Editor у Azure Portal

2. Створіть нову таблицю `categories`:
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```

3. Оновіть `src/web/app.py`, щоб додати інформацію про категорії у відповіді

4. Розгорніть та протестуйте

**Критерії успіху**: Нова таблиця існує, продукти показують інформацію про категорії, додаток працює.

---

### Вправа 5: Реалізація кешування (Експертний рівень)

**Мета**: Додати Azure Redis Cache для покращення продуктивності.

**Кроки**:
1. Додайте Redis Cache у `infra/main.bicep`
2. Оновіть `src/web/app.py` для кешування запитів продуктів
3. Виміряйте покращення продуктивності за допомогою Application Insights
4. Порівняйте час відгуку до і після кешування

**Критерії успіху**: Redis розгорнуто, кешування працює, час відгуку покращився більш ніж на 50%.

**Підказка**: Почніть з [документації Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Прибирання

Щоб уникнути постійних нарахувань, видаліть усі ресурси після завершення:

```sh
azd down
```

**Запит підтвердження**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Введіть `y` для підтвердження.

**✓ Перевірка успіху**: 
- Всі ресурси видалені з Azure Portal
- Відсутні постійні нарахування
- Можна видалити локальну папку `.azure/<env-name>`

**Альтернатива** (зберегти інфраструктуру, видалити дані):
```sh
# Видалити лише групу ресурсів (зберегти конфігурацію AZD)
az group delete --name rg-<env-name> --yes
```
## Дізнатись більше

### Пов’язана документація
- [Документація Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Документація Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)
- [Документація Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Документація Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Довідник мови Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Наступні кроки в курсі
- **[Приклад Azure Container Apps](../../../../examples/container-app)**: Розгортання мікросервісів за допомогою Azure Container Apps
- **[Довідник інтеграції ШІ](../../../../docs/ai-foundry)**: Додавання AI можливостей до вашого додатку
- **[Кращі практики розгортання](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Шаблони розгортання у продакшн

### Поглиблені теми
- **Керована ідентичність**: Позбутися паролів, використовуючи автентифікацію Azure AD
- **Приватні кінцеві точки**: Захист підключень до бази даних у віртуальній мережі
- **Інтеграція CI/CD**: Автоматизація розгортання з GitHub Actions або Azure DevOps
- **Багато середовищ**: Налаштування dev, staging та production середовищ
- **Міграції бази даних**: Використання Alembic або Entity Framework для керування версіями схеми

### Порівняння з іншими підходами

**AZD проти ARM шаблонів**:
- ✅ AZD: Абстракція вищого рівня, простіші команди
- ⚠️ ARM: Більш докладний, гнучкий контроль

**AZD проти Terraform**:
- ✅ AZD: Рішення, нативне для Azure, інтегроване з сервісами Azure
- ⚠️ Terraform: Підтримка мультихмари, ширша екосистема

**AZD проти Azure Portal**:
- ✅ AZD: Повторюване, версіоноване, автоматизоване
- ⚠️ Портал: Ручні кліки, важко відтворювати

**Думайте про AZD як**: Docker Compose для Azure — спрощене налаштування для складних розгортань.

---

## Часті питання

**П: Чи можу я використовувати іншу мову програмування?**  
В: Так! Замініть `src/web/` на Node.js, C#, Go чи будь-яку іншу мову. Оновіть `azure.yaml` та Bicep відповідно.

**П: Як додати більше баз даних?**  
В: Додайте ще один модуль SQL Database у `infra/main.bicep` або використайте PostgreSQL/MySQL із сервісів Azure Database.

**П: Чи можна це використовувати у продакшені?**  
В: Це стартова точка. Для продакшена додайте: керовану ідентичність, приватні кінцеві точки, резервування, стратегію бекапів, WAF і розширений моніторинг.

**П: Що робити, якщо я хочу використовувати контейнери замість розгортання коду?**  
В: Ознайомтеся з [Прикладом Container Apps](../../../../examples/container-app), який повністю використовує Docker контейнери.

**П: Як підключитися до бази даних з локального комп’ютера?**  
В: Додайте вашу IP-адресу до брандмауера SQL Server:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**П: Чи можу я використовувати існуючу базу даних замість нової?**  
В: Так, змініть `infra/main.bicep`, щоб посилатися на існуючий SQL Server і оновіть параметри рядка підключення.

---

> **Примітка:** Цей приклад демонструє найкращі практики розгортання веб-додатку з базою даних за допомогою AZD. Включає робочий код, детальну документацію та практичні вправи для закріплення знань. Для продакшн-розгортань розгляньте питання безпеки, масштабування, відповідності та витрат, специфічні для вашої організації.

**📚 Навігація по курсу:**
- ← Попередній: [Приклад Container Apps](../../../../examples/container-app)
- → Наступний: [Довідник інтеграції ШІ](../../../../docs/ai-foundry)
- 🏠 [Головна сторінка курсу](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, просимо враховувати, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критичної інформації рекомендується звертатися до професійного людського перекладу. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->