# Разгръщане на Microsoft SQL база данни и уеб приложение с AZD

⏱️ **Оценено време**: 20-30 минути | 💰 **Оценена цена**: ~$15-25/месец | ⭐ **Сложност**: Средно

Този **пълен, работещ пример** показва как да използвате [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) за разгръщане на уеб приложение на Python Flask с Microsoft SQL база данни в Azure. Включен е целият код и е тестван—не са необходими външни зависимости.

## Какво ще научите

Като завършите този пример, вие ще:
- Разположите многонишково приложение (уеб приложение + база данни) чрез инфраструктура като код
- Конфигурирате защитени връзки към базата данни без вграждане на тайни в кода
- Наблюдавате здравето на приложението с Application Insights
- Управлявате Azure ресурсите ефективно с AZD CLI
- Следвате добрите практики на Azure за сигурност, оптимизация на разходите и наблюдаемост

## Общ преглед на сценария
- **Web App**: Python Flask REST API с връзка към база данни
- **Database**: Azure SQL Database със примерни данни
- **Infrastructure**: Осигурено с Bicep (модулни, многократно използваеми шаблони)
- **Deployment**: Напълно автоматизирано с команди `azd`
- **Monitoring**: Application Insights за логове и телеметрия

## Предварителни изисквания

### Необходими инструменти

Преди да започнете, уверете се, че имате инсталирани следните инструменти:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (версия 2.50.0 или по-нова)
   ```sh
   az --version
   # Очакван изход: azure-cli 2.50.0 или по-нова версия
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (версия 1.0.0 или по-нова)
   ```sh
   azd version
   # Очакван изход: azd версия 1.0.0 или по-нова
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (за локална разработка)
   ```sh
   python --version
   # Очакван изход: Python 3.8 или по-нова версия
   ```

4. **[Docker](https://www.docker.com/get-started)** (по избор, за локална контейнеризирана разработка)
   ```sh
   docker --version
   # Очакван изход: Docker версия 20.10 или по-нова
   ```

### Изисквания за Azure

- Активен **абонамент за Azure** ([създайте безплатен акаунт](https://azure.microsoft.com/free/))
- Права за създаване на ресурси в абонамента ви
- Роля **Owner** или **Contributor** върху абонамента или групата за ресурси

### Предварителни познания

Това е пример за **средно ниво**. Трябва да сте запознати с:
- Основни операции в командния ред
- Основни облачни концепции (ресурси, групи с ресурси)
- Основни познания за уеб приложения и бази данни

**Нови в AZD?** Започнете първо с [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md).

## Архитектура

Този пример разгърща двуслойна архитектура с уеб приложение и SQL база данни:

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

**Разгръщане на ресурси:**
- **Resource Group**: Контейнер за всички ресурси
- **App Service Plan**: Linux базиран хостинг (ниво B1 за икономичност)
- **Web App**: Python 3.11 изпълнителна среда с Flask приложение
- **SQL Server**: Управляван сървър за бази данни с минимум TLS 1.2
- **SQL Database**: Базово ниво (2GB, подходящо за разработка/тестване)
- **Application Insights**: Наблюдение и логване
- **Log Analytics Workspace**: Централизирано хранилище за логове

**Аналогия**: Представете си това като ресторант (уеб приложението) с индустриален хладилник (базата данни). Клиентите поръчват от менюто (API крайни точки), а кухнята (Flask приложението) взима съставките (данните) от хладилника. Мениджърът на ресторанта (Application Insights) следи всичко, което се случва.

## Структура на папките

Всички файлове са включени в този пример—не са необходими външни зависимости:

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

**Какво прави всеки файл:**
- **azure.yaml**: Казва на AZD какво да разположи и къде
- **infra/main.bicep**: Оркестрира всички Azure ресурси
- **infra/resources/*.bicep**: Индивидуални дефиниции на ресурси (модулни за повторна употреба)
- **src/web/app.py**: Flask приложение с логика за базата данни
- **requirements.txt**: Зависимости на Python пакети
- **Dockerfile**: Инструкции за контейнеризация за разгръщане

## Бърз старт (Стъпка по стъпка)

### Стъпка 1: Клониране и навигиране

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Проверка за успех**: Уверете се, че виждате `azure.yaml` и папката `infra/`:
```sh
ls
# Очаквано: README.md, azure.yaml, infra/, src/
```

### Стъпка 2: Автентикация в Azure

```sh
azd auth login
```

Това отваря вашия браузър за автентикация в Azure. Впишете се със своите Azure данни за вход.

**✓ Проверка за успех**: Трябва да видите:
```
Logged in to Azure.
```

### Стъпка 3: Инициализиране на средата

```sh
azd init
```

**Какво се случва**: AZD създава локална конфигурация за вашето разполагане.

**Подканите, които ще видите**:
- **Име на средата**: Въведете кратко име (напр., `dev`, `myapp`)
- **Azure subscription**: Изберете вашия абонамент от списъка
- **Azure location**: Изберете регион (напр., `eastus`, `westeurope`)

**✓ Проверка за успех**: Трябва да видите:
```
SUCCESS: New project initialized!
```

### Стъпка 4: Осигуряване на Azure ресурси

```sh
azd provision
```

**Какво се случва**: AZD разгръща цялата инфраструктура (отнема 5-8 минути):
1. Създава resource group
2. Създава SQL Server и база данни
3. Създава App Service Plan
4. Създава Web App
5. Създава Application Insights
6. Конфигурира мрежа и сигурност

**Ще бъдете подканени за**:
- **SQL admin username**: Въведете потребителско име (напр., `sqladmin`)
- **SQL admin password**: Въведете силна парола (запазете я!)

**✓ Проверка за успех**: Трябва да видите:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Време**: 5-8 минути

### Стъпка 5: Разгръщане на приложението

```sh
azd deploy
```

**Какво се случва**: AZD изгражда и разгръща вашето Flask приложение:
1. Опакова Python приложението
2. Изгражда Docker контейнера
3. Пушва към Azure Web App
4. Инициализира базата данни с примерни данни
5. Стартира приложението

**✓ Проверка за успех**: Трябва да видите:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Време**: 3-5 минути

### Стъпка 6: Преглед на приложението

```sh
azd browse
```

Това отваря разположеното ви уеб приложение в браузъра на `https://app-<unique-id>.azurewebsites.net`

**✓ Проверка за успех**: Трябва да видите JSON изход:
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

### Стъпка 7: Тестване на API крайните точки

**Health Check** (проверете връзката с базата данни):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Очакван отговор**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**List Products** (примерни данни):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Очакван отговор**:
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

**Get Single Product**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Проверка за успех**: Всички крайни точки връщат JSON данни без грешки.

---

**🎉 Честито!** Успешно сте разположили уеб приложение с база данни в Azure, използвайки AZD.

## Подробна конфигурация

### Променливи на средата

Тайните се управляват сигурно чрез конфигурацията на Azure App Service—**никога не се вграждат в изходния код**.

**Конфигурирани автоматично от AZD**:
- `SQL_CONNECTION_STRING`: Връзка към базата данни с криптирани данни за достъп
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Краен пункт за телеметрия на наблюдението
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Активира автоматичната инсталация на зависимости по време на разгръщане

**Къде се съхраняват тайните**:
1. По време на `azd provision` предоставяте SQL идентификационни данни чрез защитени подканвания
2. AZD ги записва във вашия локален файл `.azure/<env-name>/.env` (игнориран от Git)
3. AZD ги инжектира в конфигурацията на Azure App Service (криптирани в покой)
4. Приложението ги чете чрез `os.getenv()` по време на изпълнение

### Локална разработка

За локално тестване, създайте `.env` файл от примера:

```sh
cp .env.sample .env
# Редактирайте .env, за да посочите връзката към локалната база данни
```

**Локален работен процес за разработка**:
```sh
# Инсталирайте зависимостите
cd src/web
pip install -r requirements.txt

# Задайте променливите на средата
export SQL_CONNECTION_STRING="your-local-connection-string"

# Стартирайте приложението
python app.py
```

**Тествайте локално**:
```sh
curl http://localhost:8000/health
# Очаквано: {"status": "healthy", "database": "connected"}
```

### Infrastructure as Code

Всички Azure ресурси са дефинирани в **Bicep шаблони** (`infra/` папка):

- **Модулен дизайн**: Всеки тип ресурс има собствен файл за повторна употреба
- **Параметризирани**: Персонализирайте SKU-та, региони, конвенции за именуване
- **Добрa практика**: Следва стандартите на Azure за именуване и подразбирани настройки за сигурност
- **Контрол на версиите**: Промените в инфраструктурата се следят в Git

**Пример за персонализиране**:
За да промените нивото на базата данни, редактирайте `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Най-добри практики за сигурност

Този пример следва най-добрите практики за сигурност в Azure:

### 1. **Никакви тайни в изходния код**
- ✅ Креденшиълите се съхраняват в конфигурацията на Azure App Service (криптирани)
- ✅ `.env` файловете са изключени от Git чрез `.gitignore`
- ✅ Тайните се предават чрез защитени параметри при осигуряване

### 2. **Криптирани връзки**
- ✅ Минимум TLS 1.2 за SQL Server
- ✅ Само HTTPS за Web App
- ✅ Връзките към базата данни използват криптирани канали

### 3. **Мрежова сигурност**
- ✅ Файъруол на SQL Server конфигуриран да позволява само Azure услуги
- ✅ Публичният мрежов достъп е ограничен (може да се заключи допълнително с Private Endpoints)
- ✅ FTPS е деактивиран на Web App

### 4. **Автентикация и авторизация**
- ⚠️ **В момента**: SQL автентикация (потребителско име/парола)
- ✅ **Препоръка за продукция**: Използвайте Azure Managed Identity за автентикация без пароли

**За надграждане до Managed Identity** (за продукция):
1. Разрешете managed identity на Web App
2. Дайте на идентичността разрешения в SQL
3. Актуализирайте connection string да използва managed identity
4. Премахнете автентикацията с парола

### 5. **Аудит и съответствие**
- ✅ Application Insights логва всички заявки и грешки
- ✅ Аудитът на SQL Database е активиран (може да се конфигурира за съответствие)
- ✅ Всички ресурси са маркирани за управление

**Контролен списък за сигурност преди продукция**:
- [ ] Активирайте Azure Defender за SQL
- [ ] Конфигурирайте Private Endpoints за SQL Database
- [ ] Активирайте Web Application Firewall (WAF)
- [ ] Внедрете Azure Key Vault за въртене на тайни
- [ ] Конфигурирайте Azure AD автентикация
- [ ] Активирайте диагностично логване за всички ресурси

## Оптимизация на разходите

**Оценени месечни разходи** (към ноември 2025):

| Ресурс | SKU/Ниво | Оценена цена |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (low traffic) |
| **Общо** | | **~$20/month** |

**💡 Съвети за спестяване на разходи**:

1. **Използвайте безплатен слой за обучение**:
   - App Service: ниво F1 (безплатно, ограничени часове)
   - SQL Database: Използвайте Azure SQL Database serverless
   - Application Insights: 5GB/месец безплатен ingestion

2. **Спирайте ресурсите, когато не се използват**:
   ```sh
   # Спри уеб приложението (базата данни все още се таксува)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Рестартирай при нужда
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Изтрийте всичко след тестване**:
   ```sh
   azd down
   ```
   Това премахва ВСИЧКИ ресурси и спира таксуването.

4. **SKU-та за разработка vs. продукция**:
   - **Разработка**: Базово ниво (използвано в този пример)
   - **Продукция**: Standard/Premium нива с излишност

**Мониторинг на разходите**:
- Преглеждайте разходите в [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Настройте предупреждения за разходи, за да избегнете изненади
- Маркирайте всички ресурси с `azd-env-name` за проследяване

**Алтернатива за безплатен слой**:
За учебни цели можете да модифицирате `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Забележка**: Безплатният план има ограничения (60 мин/ден CPU, няма постоянно включване).

## Наблюдение и наблюдаемост

### Интеграция с Application Insights

Този пример включва **Application Insights** за цялостно наблюдение:

**Какво се наблюдава**:
- ✅ HTTP заявки (латентност, статус кодове, крайни точки)
- ✅ Грешки и изключения в приложението
- ✅ Потребителски логове от Flask приложението
- ✅ Здраве на връзката към базата данни
- ✅ Метрики за производителност (CPU, памет)

**Достъп до Application Insights**:
1. Отворете [Azure Portal](https://portal.azure.com)
2. Отидете в вашата resource group (`rg-<env-name>`)
3. Кликнете върху ресурса Application Insights (`appi-<unique-id>`)

**Полезни заявки** (Application Insights → Logs):

**Преглед на всички заявки**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Намиране на грешки**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Проверка на health endpoint**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Одит на SQL базата данни

**Одитът на SQL Database е активиран** за проследяване на:
- Достъп до базата данни
- Неуспешни опити за влизане
- Промени в схемата
- Достъп до данни (за съответствие)

**Достъп до одитни логове**:
1. Azure Portal → SQL Database → Auditing
2. Прегледайте логовете в Log Analytics workspace

### Мониторинг в реално време

**Преглед на live метрики**:
1. Application Insights → Live Metrics
2. Вижте заявки, неуспехи и производителност в реално време

**Настройване на аларми**:
Създайте аларми за критични събития:
- HTTP 500 грешки > 5 за 5 минути
- Провали при свързване с базата данни
- Високо време за отговор (>2 секунди)

**Пример за създаване на аларма**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Отстраняване на неизправности

### Чести проблеми и решения

#### 1. `azd provision` не успява с "Location not available"

**Симптом**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Решение**:
Изберете различен регион на Azure или регистрирайте доставчика на ресурси:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Неуспешна SQL връзка по време на разгръщане

**Симптом**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Решение**:
- Уверете се, че защитната стена на SQL Server позволява услуги на Azure (конфигурирано автоматично)
- Проверете дали администраторската парола за SQL е въведена правилно по време на `azd provision`
- Уверете се, че SQL Server е напълно създаден (може да отнеме 2-3 минути)

**Проверете връзката**:
```sh
# В Azure Portal отидете на SQL Database → Query editor
# Опитайте да се свържете с вашите идентификационни данни
```

#### 3. Уеб приложението показва "Application Error"

**Симптом**:
Браузърът показва обща страница за грешка.

**Решение**:
Проверете логовете на приложението:
```sh
# Преглед на последните логове
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Чести причини**:
- Липсващи променливи на средата (проверете App Service → Configuration)
- Инсталирането на Python пакети е неуспешно (проверете логовете за разгръщане)
- Грешка при инициализация на базата данни (проверете SQL свързаността)

#### 4. `azd deploy` не успява с "Build Error"

**Симптом**:
```
Error: Failed to build project
```

**Решение**:
- Уверете се, че `requirements.txt` няма синтактични грешки
- Проверете, че Python 3.11 е указан в `infra/resources/web-app.bicep`
- Потвърдете, че Dockerfile използва правилния базов образ

**Отстраняване на грешки локално**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" при изпълнение на AZD команди

**Симптом**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Решение**:
Пререавтентикирайте се в Azure:
```sh
azd auth login
az login
```

Проверете дали имате правилните разрешения (роля Contributor) в абонамента.

#### 6. Високи разходи за база данни

**Симптом**:
Неочаквана сметка от Azure.

**Решение**:
- Проверете дали не сте забравили да изпълните `azd down` след тестване
- Уверете се, че SQL Database използва Basic tier (не Premium)
- Прегледайте разходите в Azure Cost Management
- Настройте аларми за разходи

### Получаване на помощ

**Прегледайте всички AZD променливи на средата**:
```sh
azd env get-values
```

**Проверете статуса на разгръщане**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Достъп до логовете на приложението**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Нуждаете се от още помощ?**
- [Ръководство за отстраняване на проблеми с AZD](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Отстраняване на неизправности в Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Отстраняване на проблеми със Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Практически упражнения

### Упражнение 1: Проверете вашето разгръщане (За начинаещи)

**Цел**: Потвърдете, че всички ресурси са разположени и приложението работи.

**Стъпки**:
1. Избройте всички ресурси в вашата resource group:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Очаквано**: 6-7 ресурса (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Тествайте всички API крайни точки:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Очаквано**: Всички връщат валиден JSON без грешки

3. Проверете Application Insights:
   - Отидете в Application Insights в Azure Portal
   - Отидете на "Live Metrics"
   - Обновете браузъра си върху уеб приложението
   **Очаквано**: Виждат се заявки в реално време

**Критерии за успех**: Всички 6-7 ресурса съществуват, всички крайни точки връщат данни, Live Metrics показва активност.

---

### Упражнение 2: Добавете нов API крайпункт (Средно ниво)

**Цел**: Разширете Flask приложението с нов крайпункт.

**Начален код**: Текущи крайните точки в `src/web/app.py`

**Стъпки**:
1. Редактирайте `src/web/app.py` и добавете нов крайпункт след функцията `get_product()`:
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

2. Разгърнете обновеното приложение:
   ```sh
   azd deploy
   ```

3. Тествайте новия крайпункт:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Очаквано**: Връща продукти, съвпадащи с "laptop"

**Критерии за успех**: Новият крайпункт работи, връща филтрирани резултати, появява се в логовете на Application Insights.

---

### Упражнение 3: Добавете мониторинг и аларми (Напреднали)

**Цел**: Настройте проактивен мониторинг с аларми.

**Стъпки**:
1. Създайте аларма за HTTP 500 грешки:
   ```sh
   # Вземете идентификатора на ресурса на Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Създайте предупреждение
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Предизвикайте алармата чрез създаване на грешки:
   ```sh
   # Искане за несъществуващ продукт
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Проверете дали алармата се е задействала:
   - Azure Portal → Alerts → Alert Rules
   - Проверете имейла си (ако е конфигуриран)

**Критерии за успех**: Правилото за аларми е създадено, задейства се при грешки, получават се известия.

---

### Упражнение 4: Промени в схемата на базата данни (Напреднали)

**Цел**: Добавете нова таблица и модифицирайте приложението да я използва.

**Стъпки**:
1. Свържете се със SQL Database чрез Query Editor в Azure Portal

2. Създайте нова таблица `categories`:
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

3. Актуализирайте `src/web/app.py`, за да включва информация за категорията в отговорите

4. Разгърнете и тествайте

**Критерии за успех**: Новата таблица съществува, продуктите показват информация за категорията, приложението продължава да работи.

---

### Упражнение 5: Имплементирайте кеширане (Експерт)

**Цел**: Добавете Azure Redis Cache за подобряване на производителността.

**Стъпки**:
1. Добавете Redis Cache в `infra/main.bicep`
2. Актуализирайте `src/web/app.py`, за да кеширате заявки за продукти
3. Измерете подобрението на производителността с Application Insights
4. Сравнете времена за отговор преди/след кеширане

**Критерии за успех**: Redis е разположен, кеширането работи, времената за отговор се подобряват с >50%.

**Подсказка**: Започнете с [Azure Cache for Redis documentation](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Почистване

За да избегнете продължаващи такси, изтрийте всички ресурси след приключване:

```sh
azd down
```

**Подканващ прозорец за потвърждение**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Въведете `y`, за да потвърдите.

**✓ Проверка за успех**: 
- Всички ресурси са изтрити от Azure Portal
- Няма продължаващи такси
- Местната папка `.azure/<env-name>` може да бъде изтрита

**Алтернатива** (запазете инфраструктурата, изтрийте данните):
```sh
# Изтрийте само ресурсната група (запазете конфигурацията на AZD)
az group delete --name rg-<env-name> --yes
```
## Научете повече

### Свързана документация
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database Documentation](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service Documentation](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Documentation](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep Language Reference](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Следващи стъпки в този курс
- **[Container Apps Example](../../../../examples/container-app)**: Разгръщане на микросървиси с Azure Container Apps
- **[AI Integration Guide](../../../../docs/ai-foundry)**: Добавяне на AI възможности към вашето приложение
- **[Deployment Best Practices](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Патерни за производство при разгръщане

### Разширени теми
- **Managed Identity**: Премахнете паролите и използвайте удостоверяване чрез Azure AD
- **Private Endpoints**: Осигурете връзки към базата данни в рамките на виртуална мрежа
- **CI/CD Integration**: Автоматизирайте разгръщания с GitHub Actions или Azure DevOps
- **Multi-Environment**: Настройте dev, staging и production среди
- **Database Migrations**: Използвайте Alembic или Entity Framework за версиониране на схема

### Сравнение с други подходи

**AZD vs. ARM Templates**:
- ✅ AZD: По-високо ниво на абстракция, по-прости команди
- ⚠️ ARM: По-обемни, по-фин контрол

**AZD vs. Terraform**:
- ✅ AZD: Azure-native, интегриран съсサービス на Azure
- ⚠️ Terraform: Поддържа мулти-облачни среди, по-голяма екосистема

**AZD vs. Azure Portal**:
- ✅ AZD: Повторяемо, управлявано с версии, автоматизируемо
- ⚠️ Portal: Ръчни действия, трудно за възпроизвеждане

**Мислете за AZD като**: Docker Compose за Azure — опростена конфигурация за сложни разгръщания.

---

## Често задавани въпроси

**В: Мога ли да използвам различен програмен език?**  
О: Да! Заменете `src/web/` с Node.js, C#, Go или който и да е език. Актуализирайте `azure.yaml` и Bicep съответно.

**В: Как да добавя повече бази данни?**  
О: Добавете друг SQL Database модул в `infra/main.bicep` или използвайте PostgreSQL/MySQL от услугите на Azure Database.

**В: Мога ли да използвам това в продукция?**  
О: Това е начална точка. За продукция добавете: managed identity, private endpoints, излишност, стратегия за бекъп, WAF и разширен мониторинг.

**В: Какво ако искам да използвам контейнери вместо разгръщане на код?**  
О: Вижте [Container Apps Example](../../../../examples/container-app), който използва Docker контейнери навсякъде.

**В: Как да се свържа към базата данни от локалната си машина?**  
О: Добавете вашия IP в защитната стена на SQL Server:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**В: Мога ли да използвам съществуваща база данни вместо да създавам нова?**  
О: Да, модифицирайте `infra/main.bicep`, за да препратите към съществуващ SQL Server и актуализирайте параметрите на connection string-а.

---

> **Забележка:** Този пример демонстрира добри практики за разгръщане на уеб приложение с база данни, използвайки AZD. Включва работещ код, подробна документация и практически упражнения за затвърждаване на обучението. За продукционни разгръщания прегледайте изискванията за сигурност, скалиране, съответствие и разходи, специфични за вашата организация.

**📚 Навигация в курса:**
- ← Предишен: [Container Apps Example](../../../../examples/container-app)
- → Следващ: [AI Integration Guide](../../../../docs/ai-foundry)
- 🏠 [Course Home](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводаческа услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на оригиналния език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Не носим отговорност за каквито и да е недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->