# Размештање Microsoft SQL базе података и веб апликације помоћу AZD

⏱️ **Процењено време**: 20-30 минута | 💰 **Процењени трошак**: ~$15-25/месечно | ⭐ **Сложеност**: Средњи

Овај **потпуни, радни пример** показује како да користите [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) за размештање Python Flask веб апликације са Microsoft SQL базом података на Azure. Сав код је укључен и тестилан—без спољних зависности.

## Шта ћете научити

Попуњавањем овог примера, научићете да:
- Размештате вишеслојну апликацију (веб апликација + база) користећи инфраструктуру као код
- Конфигуришете безбедне везе са базом без уграђених тајни
- Пратите здравље апликације помоћу Application Insights
- Ефикасно управљате ресурсима у Azure-у помоћу AZD CLI
- Пратите најбоље праксе Azure-а за безбедност, оптимизацију трошкова и опсервабилност

## Преглед сценарија
- **Веб апликација**: Python Flask REST API са повезивањем на базу
- **База података**: Azure SQL Database са примером података
- **Инфраструктура**: Прописана помоћу Bicep-а (модуларни, поновно употребљиви шаблони)
- **Размештање**: Потпуно аутоматизовано помоћу `azd` команди
- **Мониторинг**: Application Insights за логове и телеметрију

## Предуслови

### Потребни алати

Пре почетка, проверите да ли имате инсталиране ове алате:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (верзија 2.50.0 или новија)
   ```sh
   az --version
   # Очекивани излаз: azure-cli 2.50.0 или новија верзија
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (верзија 1.0.0 или новија)
   ```sh
   azd version
   # Очекујани излаз: azd верзија 1.0.0 или новија
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (за локални развој)
   ```sh
   python --version
   # Очекујани излаз: Python 3.8 или новији
   ```

4. **[Docker](https://www.docker.com/get-started)** (опционо, за локални контејнеризовани развој)
   ```sh
   docker --version
   # Очекивани излаз: Docker верзија 20.10 или новија
   ```

### Захтеви за Azure

- Активна **Azure претплата** ([create a free account](https://azure.microsoft.com/free/))
- Дозволе за креирање ресурса у вашој претплати
- **Owner** или **Contributor** улога на претплати или групи ресурса

### Потребно знање

Ово је пример **средњег нивоа**. Требало би да будете упознати са:
- Основним операцијама у командној линији
- Основним концептима облака (ресурси, групе ресурса)
- Основним разумевањем веб апликација и база података

**Нови у AZD?** Почните са [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md) прво.

## Архитектура

Овај пример размешта двослојну архитектуру са веб апликацијом и SQL базом података:

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

**Размештање ресурса:**
- **Resource Group**: Контејнер за све ресурсе
- **App Service Plan**: Линукс хостинг (B1 tier ради економичности)
- **Web App**: Python 3.11 runtime са Flask апликацијом
- **SQL Server**: Управљани сервер базе података са TLS 1.2 минимумом
- **SQL Database**: Basic tier (2GB, погодан за развој/тестирање)
- **Application Insights**: Мониторинг и логовање
- **Log Analytics Workspace**: Централизовано складиште логова

**Аналогија**: Замислите ово као ресторан (веб апликација) са ходником за замрзавање (база података). Купци наручују са менија (API крајње тачке), а кухиња (Flask апликација) преузима састојке (пodatke) из замрзивача. Менадџер ресторана (Application Insights) прати све што се дешава.

## Структура фасцикле

Све датотеке су укључене у овом примеру—без спољних зависности:

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

**Шта која датотека ради:**
- **azure.yaml**: Казање AZD-у шта да размешта и где
- **infra/main.bicep**: Оркестрација свих Azure ресурса
- **infra/resources/*.bicep**: Појединачне дефиниције ресурса (модуларно за поновну употребу)
- **src/web/app.py**: Flask апликација са логиком за базу података
- **requirements.txt**: Зависности Python пакета
- **Dockerfile**: Упутства за контеинеризацију за размештање

## Брзи почетак (Корак по корак)

### Корак 1: Клонирање и навигација

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Провера успеха**: Проверите да видите `azure.yaml` и фасциклу `infra/`:
```sh
ls
# Очекује се: README.md, azure.yaml, infra/, src/
```

### Корак 2: Аутентификација са Azure-ом

```sh
azd auth login
```

Ово отвора ваш прегледач за Azure аутентификацију. Пријавите се са својим Azure акредитивима.

**✓ Провера успеха**: Требало би да видите:
```
Logged in to Azure.
```

### Корак 3: Иницијализација окружења

```sh
azd init
```

**Шта се дешава**: AZD креира локалну конфигурацију за ваше размењивање.

**Упити које ћете видети**:
- **Име окружења**: Унесите кратко име (нпр. `dev`, `myapp`)
- **Azure претплата**: Изаберите вашу претплату са листе
- **Azure локација**: Изаберите регион (нпр. `eastus`, `westeurope`)

**✓ Провера успеха**: Требало би да видите:
```
SUCCESS: New project initialized!
```

### Корак 4: Пружање Azure ресурса

```sh
azd provision
```

**Шта се дешава**: AZD распоређује сву инфраструктуру (треба 5-8 минута):
1. Креира групу ресурса
2. Креира SQL Server и базу података
3. Креира App Service Plan
4. Креира Web App
5. Креира Application Insights
6. Конфигурише мрежу и безбедност

**Бићете упитани за**:
- **SQL admin username**: Унесите корисничко име (нпр. `sqladmin`)
- **SQL admin password**: Унесите јаку лозинку (сачувајте је!)

**✓ Провера успеха**: Требало би да видите:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Време**: 5-8 минута

### Корак 5: Размештање апликације

```sh
azd deploy
```

**Шта се дешава**: AZD гради и размешта вашу Flask апликацију:
1. Пакује Python апликацију
2. Гради Docker контејнер
3. Пушује на Azure Web App
4. Иницијализује базу података са пример података
5. Покреће апликацију

**✓ Провера успеха**: Требало би да видите:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Време**: 3-5 минута

### Корак 6: Прегледајте апликацију

```sh
azd browse
```

Ово отвара вашу размењену веб апликацију у прегледачу на адреси `https://app-<unique-id>.azurewebsites.net`

**✓ Провера успеха**: Требало би да видите JSON излаз:
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

### Корак 7: Тестирање API крајњих тачака

**Провера здравља** (проверите везу са базом података):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Очекивани одговор**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Листа производа** (пример података):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Очекивани одговор**:
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

**Детаљи једног производа**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Провера успеха**: Све крајње тачке враћају JSON податке без грешака.

---

**🎉 Честитамо!** Успешно сте разместили веб апликацију са базом података на Azure користећи AZD.

## Детаљна конфигурација

### Променљиве окружења

Тајне се управљају сигурно преко конфигурације Azure App Service—**никада не убацујте тајне у изворни код**.

**Аутоматски конфигурише AZD**:
- `SQL_CONNECTION_STRING`: Веза са базом података са шифрованим акредитивима
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Тачка за телеметрију монитора
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Омогућава аутоматску инсталацију зависности

**Где се тајне чувају**:
1. Током `azd provision`, дајете SQL акредитиве преко безбедних упита
2. AZD их чува у вашој локалној `.azure/<env-name>/.env` датотеци (игнорисано у гиту)
3. AZD их убацује у конфигурацију Azure App Service-а (шифровано у миру)
4. Апликација их чита преко `os.getenv()` у време извршавања

### Локални развој

За локално тестирање, креирајте `.env` датотеку из узорка:

```sh
cp .env.sample .env
# Уредите .env и подесите конекцију на вашу локалну базу података
```

**Локални развојни ток рада**:
```sh
# Инсталирајте зависности
cd src/web
pip install -r requirements.txt

# Поставите променљиве окружења
export SQL_CONNECTION_STRING="your-local-connection-string"

# Покрените апликацију
python app.py
```

**Тест локално**:
```sh
curl http://localhost:8000/health
# Очекује се: {"статус": "исправан", "база података": "повезана"}
```

### Инфраструктура као код

Сви Azure ресурси су дефинисани у **Bicep шаблонима** (`infra/` фасцикла):

- **Модуларни дизајн**: Сваки тип ресурса има своју датотеку за поновну употребу
- **Параметризовано**: Прилагодите SKU-ове, регионе, конвенције именовања
- **Најбоље праксе**: Прати Azure стандарде именовања и безбедносне подразумеване вредности
- **Верзионисано**: Промене инфраструктуре праћене су у Gitu

**Пример прилагођавања**:
За промену степена базе података, уредите `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Најбоље праксе безбедности

Овај пример прати најбоље праксе Azure безбедности:

### 1. **Нема тајни у исходном коду**
- ✅ Акредитиви су сачувани у конфигурацији Azure App Service-а (шифровани)
- ✅ `.env` датотеке искључене из Gita преко `.gitignore`
- ✅ Тајне пренете преко безбедних параметара током провизије

### 2. **Шифроване везе**
- ✅ TLS 1.2 минимум за SQL Server
- ✅ Само HTTPS дозвољено за Web App
- ✅ Везе ка бази користе шифроване канале

### 3. **Мрежна безбедност**
- ✅ Firewall SQL Server-а конфигурисан да дозвољава само Azure сервисе
- ✅ Јавни приступ мрежи ограничен (може се додатно затворити приватним крајњим тачкама)
- ✅ FTPS онемогућен на Web App-у

### 4. **Аутентификација и ауторизација**
- ⚠️ **Тренутно**: SQL аутентикација (корисничко име/лозинка)
- ✅ **Препорука за продукцију**: Користите Azure Managed Identity за аутентификацију без лозинки

**Да бисте надоградили на Managed Identity** (за продукцију):
1. Омогућите managed identity на Web App-у
2. Доделите идентитету дозволе за SQL
3. Ажурирајте connection string да користи managed identity
4. Уклоните аутентикацију засновану на лозинки

### 5. **Ревизија и усаглашеност**
- ✅ Application Insights бележи све захтеве и грешке
- ✅ SQL Database ревизија је омогућена (може се конфигурисати ради усаглашености)
- ✅ Сви ресурси означени за управљање (tag-овани)

**Контролна листа безбедности пре продукције**:
- [ ] Омогућите Azure Defender за SQL
- [ ] Конфигуришите Private Endpoints за SQL Database
- [ ] Омогућите Web Application Firewall (WAF)
- [ ] Упроведите Azure Key Vault за ротацију тајни
- [ ] Конфигуришите Azure AD аутентификацију
- [ ] Омогућите дијагностичко логовање за све ресурсе

## Оптимизација трошкова

**Процењени месечни трошкови** (новембар 2025):

| Resource | SKU/Tier | Estimated Cost |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (low traffic) |
| **Total** | | **~$20/month** |

**💡 Савети за уштеду трошкова**:

1. **Користите бесплатни ниво за учење**:
   - App Service: F1 tier (free, limited hours)
   - SQL Database: Use Azure SQL Database serverless
   - Application Insights: 5GB/month free ingestion

2. **Зауставите ресурсе када се не користе**:
   ```sh
   # Заустави веб апликацију (трошкови за базу података се и даље наплаћују)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Поново покрени кад је потребно
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Обришите све након тестирања**:
   ```sh
   azd down
   ```
   Ово уклања СВЕ ресурсе и зауставља наплату.

4. **Развојни у односу на продукцијске SKU-ове**:
   - **Развој**: Basic tier (коришћено у овом примеру)
   - **Продукција**: Standard/Premium tier са редунданцијом

**Праћење трошкова**:
- Погледајте трошкове у [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Подесите упозорења о трошковима да бисте избегли изненадјења
- Означите све ресурсе са `azd-env-name` ради праћења

**Алтернатива бесплатном нивоу**:
За учење, можете изменити `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Напомена**: Бесплатни ниво има ограничења (60 мин/дан CPU, нема увек-укључено).

## Мониторинг и опсервабилност

### Интеграција Application Insights

Овај пример укључује **Application Insights** за свеобухватан мониторинг:

**Шта се прати**:
- ✅ HTTP захтеви (латенција, статус кодови, крајње тачке)
- ✅ Грешке и изузеци апликације
- ✅ Прилагођено логовање из Flask апликације
- ✅ Здравље везе са базом података
- ✅ Перформансе (CPU, меморија)

**Приступите Application Insights**:
1. Отворите [Azure Portal](https://portal.azure.com)
2. Идите у вашу групу ресурса (`rg-<env-name>`)
3. Кликните на Application Insights ресурс (`appi-<unique-id>`)

**Корисни упити** (Application Insights → Logs):

**Погледајте све захтеве**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Пронађите грешке**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Проверите health крајњу тачку**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Ревизија SQL базе података

**Ревизија SQL базе је омогућена** да прати:
- Обрасце приступа бази података
- Неуспеле покушаје пријављивања
- Промене шеме
- Приступ подацима (ради усаглашености)

**Приступ ревизијским логовима**:
1. Azure Portal → SQL Database → Auditing
2. Погледајте логове у Log Analytics workspace

### Мониторинг у реалном времену

**Погледајте живе мере**:
1. Application Insights → Live Metrics
2. Пратите захтеве, неуспехе и перформансе у реалном времену

**Подесите аларме**:
Креирајте аларме за критичне догађаје:
- HTTP 500 грешке > 5 у 5 минута
- Неуспеси везе са базом података
- Високо време одзива (>2 секунде)

**Пример креирања упозорења**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Решавање проблема

### Уобичајени проблеми и решења

#### 1. `azd provision` не успева са "Локација није доступна"

**Симптом**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Решење**:
Изаберите другу Azure регију или региструјте провајдера ресурса:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Повезивање са SQL базом не успева током распоређивања

**Симптом**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Решење**:
- Проверите да firewall SQL Server-а дозвољава Azure услуге (конфигурисано аутоматски)
- Проверите да је SQL админ лозинка унесена исправно током `azd provision`
- Уверите се да је SQL Server у потпуности провизионисан (може потрајати 2-3 минуте)

**Проверите везу**:
```sh
# Из Azure портала идите на SQL базу података → Уређивач упита
# Покушајте да се повежете помоћу ваших података за пријављивање
```

#### 3. Веб апликација приказује "Грешка апликације"

**Симптом**:
Прегледач приказује општу страницу са грешком.

**Решење**:
Проверите логове апликације:
```sh
# Прикажи недавне логове
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Уобичајени узроци**:
- Недостајуће променљиве окружења (проверите App Service → Конфигурација)
- Инсталација Python пакета није успела (проверите логове распоређивања)
- Грешка при иницијализацији базе података (проверите SQL повезивање)

#### 4. `azd deploy` не успева са "Грешка при изградњи"

**Симптом**:
```
Error: Failed to build project
```

**Решење**:
- Уверите се да `requirements.txt` нема синтаксичке грешке
- Проверите да је Python 3.11 назначен у `infra/resources/web-app.bicep`
- Потврдите да Dockerfile има исправну базну слику

**Дебаговање локално**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Неовлашћено" приликом извођења AZD команди

**Симптом**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Решење**:
Поново се аутентификујте на Azure:
```sh
azd auth login
az login
```

Проверите да имате исправне дозволе (улога Contributor) на претплати.

#### 6. Високи трошкови базе података

**Симптом**:
Неочекивани Azure рачун.

**Решење**:
- Проверите да ли сте заборавили да покренете `azd down` након тестирања
- Потврдите да SQL база користи Basic ниво (не Premium)
- Прегледајте трошкове у Azure Cost Management
- Подесите упозорења за трошкове

### Како добити помоћ

**Погледајте све AZD променљиве окружења**:
```sh
azd env get-values
```

**Проверите статус распоређивања**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Приступите логовима апликације**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Потребно је више помоћи?**
- [AZD водич за решавање проблема](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Решавање проблема Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Решавање проблема Azure SQL-а](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Практичне вежбе

### Вежба 1: Проверите своје распоређивање (почетник)

**Циљ**: Потврдити да су сви ресурси распоређени и да апликација ради.

**Кораци**:
1. Набројите све ресурсе у вашој групи ресурса:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Очекује се**: 6-7 ресурса (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Тестирајте све API ентпоинте:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Очекује се**: Сви враћају валидан JSON без грешака

3. Проверите Application Insights:
   - Идите до Application Insights у Azure порталу
   - Идите на "Live Metrics"
   - Освежите страницу веб апликације у прегледачу
   **Очекује се**: Види се појављивање захтева у реалном времену

**Критеријуми успеха**: Сви 6-7 ресурса постоје, сви ентпоинти враћају податке, Live Metrics показује активност.

---

### Вежба 2: Додајте нови API ентпоинт (средњи ниво)

**Циљ**: Проширите Flask апликацију новим ентпоинтом.

**Почетни код**: Тренутни ентпоинти у `src/web/app.py`

**Кораци**:
1. Уредите `src/web/app.py` и додајте нови ентпоинт после функције `get_product()`:
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

2. Деплојујте ажурирану апликацију:
   ```sh
   azd deploy
   ```

3. Тестирајте нови ентпоинт:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Очекује се**: Враћа производе који одговарају "laptop"

**Критеријуми успеха**: Нови ентпоинт ради, враћа филтриране резултате, појављује се у логовима Application Insights.

---

### Вежба 3: Додајте мониторинг и упозорења (напредно)

**Циљ**: Подесите проактивни мониторинг са упозорењима.

**Кораци**:
1. Креирајте упозорење за HTTP 500 грешке:
   ```sh
   # Добијте ИД ресурса Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Креирајте упозорење
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Покрените упозорење изазивајући грешке:
   ```sh
   # Захтев за непостојећи производ
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Проверите да ли је упозорење активирано:
   - Azure портал → Упозорења → Правила упозорења
   - Проверите вашу е-пошту (ако је конфигурисано)

**Критеријуми успеха**: Правило упозорења је креирано, активира се при грешкама, примају се нотификације.

---

### Вежба 4: Промене шеме базе података (напредно)

**Циљ**: Додајте нову табелу и модификујте апликацију да је користи.

**Кораци**:
1. Повежите се на SQL базу преко Query Editor-а у Azure порталу

2. Креирајте нову табелу `categories`:
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

3. Ажурирајте `src/web/app.py` да укључи информацију о категоријама у одговорима

4. Деплојујте и тестирате

**Критеријуми успеха**: Нова табела постоји, производи приказују информацију о категоријама, апликација и даље ради.

---

### Вежба 5: Имплементирање кеширања (експерт)

**Циљ**: Додајте Azure Redis Cache ради побољшања перформанси.

**Кораци**:
1. Додајте Redis Cache у `infra/main.bicep`
2. Ажурирајте `src/web/app.py` да кешира упите за производе
3. Измерите побољшање перформанси помоћу Application Insights
4. Упоредите време одзива пре/после кеширања

**Критеријуми успеха**: Redis је развоређен, кеширање функционише, време одзива се побољшава за >50%.

**Савет**: Почните са [документацијом за Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Чишћење

Да бисте избегли текуће трошкове, обришите све ресурсе када завршите:

```sh
azd down
```

**Промпт за потврду**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Откуцајте `y` за потврду.

**✓ Провера успеха**: 
- Сви ресурси су избрисани из Azure портала
- Нема текућих трошкова
- Локална фасцикла `.azure/<env-name>` може бити избрисана

**Алтернатива** (чувајте инфраструктуру, обришите податке):
```sh
# Избриши само групу ресурса (сачувај AZD конфигурацију)
az group delete --name rg-<env-name> --yes
```
## Сазнајте више

### Повезана документација
- [Документација за Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Документација за Azure SQL базу података](https://learn.microsoft.com/azure/azure-sql/database/)
- [Документација за Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Документација за Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Референца за Bicep језик](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Следећи кораци у овом курсу
- **[Пример Container Apps](../../../../examples/container-app)**: Распоредите микросервисе уз Azure Container Apps
- **[Водич за AI интеграцију](../../../../docs/ai-foundry)**: Додајте AI могућности вашој апликацији
- **[Најбоље праксе за распоређивање](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Обрасци за продукционо распоређивање

### Напредне теме
- **Managed Identity**: Уклоните лозинке и користите Azure AD аутентикацију
- **Private Endpoints**: Осигурајте везе са базом података унутар виртуелне мреже
- **CI/CD интеграција**: Аутоматизујте распоређивања помоћу GitHub Actions или Azure DevOps
- **Multi-Environment**: Подесите dev, staging и production окружења
- **Database Migrations**: Користите Alembic или Entity Framework за верзионисање шеме

### Поређење са другим приступима

**AZD vs. ARM шаблони**:
- ✅ AZD: Виши ниво апстракције, једноставније команде
- ⚠️ ARM: Опширнији, финија контрола

**AZD vs. Terraform**:
- ✅ AZD: Azure-нативан, интегрисан са Azure сервисима
- ⚠️ Terraform: Подршка за више cloud-ова, веће екосистем

**AZD vs. Azure Portal**:
- ✅ AZD: Поновљиво, контролисано верзионисањем, аутоматизовано
- ⚠️ Портал: Ручни кликови, тешко за поновно креирање

**Размислите о AZD-у као**: Docker Compose за Azure—поједностављена конфигурација за сложена распоређивања.

---

## Често постављана питања

**П: Могу ли да користим други програмски језик?**  
О: Да! Замените `src/web/` са Node.js, C#, Go или било којим другим језиком. Ажурирајте `azure.yaml` и Bicep у складу с тим.

**П: Како да додам више база података?**  
О: Додајте још један SQL Database модул у `infra/main.bicep` или користите PostgreSQL/MySQL из Azure Database услуга.

**П: Могу ли то да користим у продукцији?**  
О: Ово је почетна тачка. За продукцију додајте: managed identity, private endpoints, редунданцију, стратегију резервних копија, WAF, и појачан мониторинг.

**П: Шта ако желим да користим контейнере уместо деплоја кода?**  
О: Погледајте [Пример Container Apps](../../../../examples/container-app) који користи Docker контейнере широм.

**П: Како да се повежем на базу података са свог локалног рачунара?**  
О: Додајте ваш IP у firewall SQL Server-а:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**П: Могу ли да користим постојећу базу података уместо креирања нове?**  
О: Да, измените `infra/main.bicep` да реферише постојећи SQL Server и ажурирајте параметре connection string-а.

---

> **Напомена:** Овај пример демонстрира најбоље праксе за распоређивање веб апликације са базом података користећи AZD. Укључује радни код, опсежну документацију и практичне вежбе за јачање учења. За продукциона распоређивања, прегледајте безбедност, скалирање, усаглашеност и захтеве за трошкове специфичне за вашу организацију.

**📚 Навигација курса:**
- ← Претходно: [Пример Container Apps](../../../../examples/container-app)
- → Следеће: [Водич за AI интеграцију](../../../../docs/ai-foundry)
- 🏠 [Почетна страница курса](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање одговорности**:
Овај документ је преведен помоћу АИ сервиса за превођење [Co-op Translator](https://github.com/Azure/co-op-translator). Иако настојимо да обезбедимо тачност, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на свом изворном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални превод који обављају стручни преводиоци. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која проистичу из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->