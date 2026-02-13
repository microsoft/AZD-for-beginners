# Архитектура на микросервизи - Пример за Container App

⏱️ **Оценено време**: 25-35 минути | 💰 **Оценена цена**: ~$50-100/месец | ⭐ **Сложност**: Напреднала

Една **опростена, но функционална** архитектура на микросервизи, деплойната в Azure Container Apps с помощта на AZD CLI. Този пример демонстрира комуникация между услуги, оркестрация на контейнери и наблюдение с практическа настройка от 2 услуги.

> **📚 Подход за учене**: Този пример започва с минимална архитектура от 2 услуги (API Gateway + Backend Service), която можете действително да деплойнете и да научите. След като усвоите тази основа, даваме указания за разширяване до пълна екосистема от микросервизи.

## Какво ще научите

Като завършите този пример, вие ще:
- Деплойнете множество контейнери в Azure Container Apps
- Реализирате комуникация между услуги чрез вътрешна мрежа
- Конфигурирате мащабиране на базата на среда и проверки за здравословност
- Наблюдавате разпределени приложения с Application Insights
- Разберете модели за деплойване на микросервизи и добри практики
- Научите как прогресивно да разширявате от проста към по-сложна архитектура

## Архитектура

### Фаза 1: Това, което изграждаме (включено в този пример)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**Защо да започнем просто?**
- ✅ Деплой и разбиране бързо (25-35 минути)
- ✅ Научете основните модели на микросервизи без сложност
- ✅ Работещ код, който можете да модифицирате и експериментирате
- ✅ По-ниска цена за обучение (~$50-100/месец срещу $300-1400/месец)
- ✅ Изградете увереност преди да добавите бази данни и опашки за съобщения

**Аналогия**: Мислете за това като за учене да шофирате. Започвате с празен паркинг (2 услуги), усвоявате основите, след това преминавате към градски трафик (5+ услуги с бази данни).

### Фаза 2: Бъдещо разширяване (референтна архитектура)

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

Вижте секцията "Expansion Guide" в края за инструкции стъпка по стъпка.

## Включени функции

✅ **Откриване на услуги**: Автоматично откриване чрез DNS между контейнерите  
✅ **Баланс на натоварването**: Вграден баланс на натоварване между репликите  
✅ **Автоматично мащабиране**: Независимо мащабиране за всяка услуга на базата на HTTP заявки  
✅ **Наблюдение на здравето**: Liveness и readiness проверки за двете услуги  
✅ **Разпределено логване**: Централизирано логване с Application Insights  
✅ **Вътрешна мрежа**: Сигурна комуникация услуга-към-услуга  
✅ **Оркестрация на контейнери**: Автоматично деплойване и мащабиране  
✅ **Актуализации без престой**: Rolling актуализации с управление на ревизии  

## Предпоставки

### Необходими инструменти

Преди да започнете, проверете дали имате инсталирани тези инструменти:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (версия 1.0.0 или по-нова)
   ```bash
   azd version
   # Очакван изход: azd версия 1.0.0 или по-нова
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (версия 2.50.0 или по-нова)
   ```bash
   az --version
   # Очакван изход: azure-cli 2.50.0 или по-нова версия
   ```

3. **[Docker](https://www.docker.com/get-started)** (за локална разработка/тестване - по избор)
   ```bash
   docker --version
   # Очакван изход: Docker версия 20.10 или по-нова
   ```

### Изисквания за Azure

- Активен **абонамент в Azure** ([създайте безплатен акаунт](https://azure.microsoft.com/free/))
- Права за създаване на ресурси в абонамента ви
- Роля **Contributor** върху абонамента или групата ресурси

### Необходими знания

Това е пример за **ниво напреднали**. Трябва да имате:
- Завършили [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) 
- Основно разбиране за архитектурата на микросервизи
- Познания за REST API и HTTP
- Разбиране на концепциите за контейнери

**Ново в Container Apps?** Започнете първо с [Simple Flask API example](../../../../../examples/container-app/simple-flask-api), за да научите основите.

## Бърз старт (Стъпка по стъпка)

### Стъпка 1: Клонирайте и навигирайте

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Проверка за успех**: Уверете се, че виждате `azure.yaml`:
```bash
ls
# Очаква се: README.md, azure.yaml, infra/, src/
```

### Стъпка 2: Удостоверяване в Azure

```bash
azd auth login
```

Това отваря браузъра ви за удостоверяване в Azure. Влезте с вашите Azure данни за удостоверяване.

**✓ Проверка за успех**: Трябва да видите:
```
Logged in to Azure.
```

### Стъпка 3: Инициализиране на средата

```bash
azd init
```

**Подканите, които ще видите**:
- **Име на средата**: Въведете кратко име (например `microservices-dev`)
- **Azure абонамент**: Изберете вашия абонамент
- **Azure локация**: Изберете регион (например `eastus`, `westeurope`)

**✓ Проверка за успех**: Трябва да видите:
```
SUCCESS: New project initialized!
```

### Стъпка 4: Деплой на инфраструктура и услуги

```bash
azd up
```

**Какво се случва** (отнема 8-12 минути):
1. Създава Container Apps среда
2. Създава Application Insights за наблюдение
3. Изгражда контейнера за API Gateway (Node.js)
4. Изгражда контейнера за Product Service (Python)
5. Деплойва и двата контейнера в Azure
6. Конфигурира мрежата и проверките за здравословност
7. Настройва наблюдение и логване

**✓ Проверка за успех**: Трябва да видите:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Време**: 8-12 минути

### Стъпка 5: Тествайте деплоймента

```bash
# Вземете крайна точка на шлюза
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Тествайте здравето на API шлюза
curl $GATEWAY_URL/health

# Очакван изход:
# {"status":"здрав","service":"api-шлюз","timestamp":"2025-11-19T10:30:00Z"}
```

**Тествайте product service през gateway**:
```bash
# Изброяване на продукти
curl $GATEWAY_URL/api/products

# Очакван изход:
# [
#   {"id":1,"name":"Лаптоп","price":999.99,"stock":50},
#   {"id":2,"name":"Мишка","price":29.99,"stock":200},
#   {"id":3,"name":"Клавиатура","price":79.99,"stock":150}
# ]
```

**✓ Проверка за успех**: И двата endpoint-а връщат JSON данни без грешки.

---

**🎉 Поздравления!** Вие деплойнахте архитектура на микросервизи в Azure!

## Структура на проекта

Всички файлове за реализация са включени — това е пълен, работещ пример:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**Какво прави всеки компонент:**

**Инфраструктура (infra/)**:
- `main.bicep`: Оркестрация на всички Azure ресурси и техните зависимости
- `core/container-apps-environment.bicep`: Създава Container Apps средата и Azure Container Registry
- `core/monitor.bicep`: Настройва Application Insights за разпределено логване
- `app/*.bicep`: Индивидуални дефиниции на container app с настройки за скалиране и здравословни проверки

**API Gateway (src/api-gateway/)**:
- Публична услуга, която маршрутизира заявки към бекенд услуги
- Реализира логване, обработка на грешки и препращане на заявки
- Демонстрира HTTP комуникация услуга-към-услуга

**Product Service (src/product-service/)**:
- Вътрешна услуга с каталог от продукти (в паметта за опростяване)
- REST API с проверки за здравословност
- Пример за бекенд микросервисен модел

## Преглед на услугите

### API Gateway (Node.js/Express)

**Порт**: 8080  
**Достъп**: Публичен (външен ingress)  
**Цел**: Пренасочва входящите заявки към подходящите бекенд услуги  

**Ендпойнти**:
- `GET /` - Информация за услугата
- `GET /health` - Ендпойнт за проверка на здравето
- `GET /api/products` - Препраща към product service (изброяване)
- `GET /api/products/:id` - Препраща към product service (взимане по ID)

**Ключови функции**:
- Маршрутизиране на заявки с axios
- Централизирано логване
- Обработка на грешки и управление на таймаути
- Откриване на услуги чрез променливи на средата
- Интеграция с Application Insights

**Извадка от кода** (`src/api-gateway/app.js`):
```javascript
// Вътрешна комуникация между услуги
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Порт**: 8000  
**Достъп**: Само вътрешен (без външен ingress)  
**Цел**: Управлява каталог на продукти с данни в паметта  

**Ендпойнти**:
- `GET /` - Информация за услугата
- `GET /health` - Ендпойнт за проверка на здравето
- `GET /products` - Изброй всички продукти
- `GET /products/<id>` - Вземи продукт по ID

**Ключови функции**:
- RESTful API с Flask
- Магазин за продукти в паметта (опростен, без нужда от база данни)
- Наблюдение на здравето с probes
- Структурирано логване
- Интеграция с Application Insights

**Модел на данните**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Защо само вътрешен достъп?**
Product service не е изложен публично. Всички заявки трябва да преминат през API Gateway, който осигурява:
- Сигурност: Контролиран вход
- Гъвкавост: Може да променяте бекенда без да засягате клиентите
- Наблюдение: Централизирано логване на заявки

## Разбиране на комуникацията между услугите

### Как услугите комуникират помежду си

В този пример API Gateway комуникира с Product Service чрез **вътрешни HTTP извиквания**:

```javascript
// API шлюз (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Направи вътрешна HTTP заявка
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Ключови точки**:

1. **Откриване базирано на DNS**: Container Apps автоматично осигурява DNS за вътрешни услуги
   - FQDN на Product Service: `product-service.internal.<environment>.azurecontainerapps.io`
   - Упрощено като: `http://product-service` (Container Apps го резолвира)

2. **Без публично излагане**: Product Service има `external: false` в Bicep
   - Достъпна само в рамките на Container Apps средата
   - Недостъпна от интернет

3. **Променливи на средата**: URL-ите на услугите се инжектират при деплой
   - Bicep подава вътрешния FQDN към gateway
   - Няма хардкоднати URL-и в кода на приложенията

**Аналогия**: Мислете за това като за офисни стаи. API Gateway е рецепцията (публична), а Product Service е офисна стая (само вътрешна). Посетителите трябва да минат през рецепцията, за да достигнат до офисите.

## Опции за деплоймент

### Пълен деплоймент (Препоръчително)

```bash
# Разположете инфраструктурата и двете услуги
azd up
```

Това деплойва:
1. Container Apps среда
2. Application Insights
3. Container Registry
4. Контейнер за API Gateway
5. Контейнер за Product Service

**Време**: 8-12 минути

### Деплой на отделна услуга

```bash
# Разгръщайте само една услуга (след първоначалното azd up)
azd deploy api-gateway

# Или разгръщайте продуктовата услуга
azd deploy product-service
```

**Сценарий на употреба**: Когато сте актуализирали кода в една услуга и искате да деплойнете само тази услуга.

### Актуализиране на конфигурацията

```bash
# Променете параметрите за мащабиране
azd env set GATEWAY_MAX_REPLICAS 30

# Разгърнете отново с новата конфигурация
azd up
```

## Конфигурация

### Конфигурация на скалирането

И двете услуги са конфигурирани с автоматично скалиране базирано на HTTP в техните Bicep файлове:

**API Gateway**:
- Мин. брой реплики: 2 (винаги поне 2 за наличност)
- Макс. брой реплики: 20
- Тригър за скалиране: 50 едновременни заявки на реплика

**Product Service**:
- Мин. брой реплики: 1 (може да скалира до нула, ако е нужно)
- Макс. брой реплики: 10
- Тригър за скалиране: 100 едновременни заявки на реплика

**Персонализиране на скалирането** (в `infra/app/*.bicep`):
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### Разпределение на ресурси

**API Gateway**:
- CPU: 1.0 vCPU
- Памет: 2 GiB
- Причина: Обработва целия външен трафик

**Product Service**:
- CPU: 0.5 vCPU
- Памет: 1 GiB
- Причина: Лек операции в паметта

### Проверки за здравословност

И двете услуги включват liveness и readiness probes:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**Какво означава това**:
- **Проверка за живост (Liveness)**: Ако здравната проверка се провали, Container Apps рестартира контейнера
- **Проверка за готовност (Readiness)**: Ако не е готова, Container Apps прекратява маршрутизирането на трафик към тази реплика



## Мониторинг и наблюдаемост

### Преглед на логовете на услугите

```bash
# Прегледайте логовете с azd monitor
azd monitor --logs

# Или използвайте Azure CLI за конкретни Container Apps:
# Поточно предавайте логове от API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Прегледайте скорошните логове на продуктовата услуга
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Очакван изход**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Запитвания в Application Insights

Достъпете Application Insights в Azure портала, след това изпълнете тези заявки:

**Намерете бавни заявки**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Проследяване на извиквания услуга-към-услуга**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Процент на грешки по услуга**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Обем заявки във времето**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Достъп до таблото за мониторинг

```bash
# Получете подробности за Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Отворете мониторинга в портала на Azure
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Метрики в реално време

1. Навигирайте до Application Insights в Azure портала
2. Кликнете на "Live Metrics"
3. Вижте заявки в реално време, грешки и производителност
4. Тествайте като стартирате: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Практически упражнения

[Бележка: Вижте пълните упражнения по-горе в секцията "Практически упражнения" за подробни стъпки включително проверка на деплоймента, модификация на данни, тестове за авто-скалиране, обработка на грешки и добавяне на трета услуга.]

## Анализ на разходите

### Оценени месечни разходи (За този пример с 2 услуги)

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Total** | | **$58-243/month** |

**Разпределение на разходите по използване**:
- **Лек трафик** (тест/обучение): ~$60/месец
- **Умерен трафик** (малък продукшън): ~$120/месец
- **Висок трафик** (натоварени периоди): ~$240/месец

### Съвети за оптимизация на разходите

1. **Мащабиране до нула за разработка**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Използвайте Consumption Plan за Cosmos DB** (когато го добавите):
   - Плащате само за това, което използвате
   - Няма минимална такса

3. **Настройте Sampling в Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Изберете 50% от заявките
   ```

4. **Почистване когато не е необходимо**:
   ```bash
   azd down
   ```

### Опции за безплатен слой
За учебни/тестови цели, обмислете:
- Използвайте безплатните кредити на Azure (първите 30 дни)
- Поддържайте минимален брой реплики
- Изтрийте след тестове (без текущи такси)

---

## Cleanup

За да избегнете текущи такси, изтрийте всички ресурси:

```bash
azd down --force --purge
```

**Подканващо потвърждение**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Въведете `y`, за да потвърдите.

**Какво се изтрива**:
- Среда на Container Apps
- И двете Container Apps (шлюз и услуга за продукти)
- Container Registry
- Application Insights
- Работно пространство на Log Analytics
- Resource Group

**✓ Проверка на почистването**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Трябва да върне празно.

---

## Expansion Guide: From 2 to 5+ Services

След като усвоите тази 2-сервисна архитектура, ето как да разширите:

### Phase 1: Add Database Persistence (Next Step)

**Добавяне на Cosmos DB за Product Service**:

1. Създайте `infra/core/cosmos.bicep`:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. Актуализирайте product service да използва Cosmos DB вместо данни в паметта

3. Оценена допълнителна цена: ~$25/month (serverless)

### Phase 2: Add Third Service (Order Management)

**Създаване на Order Service**:

1. Нова папка: `src/order-service/` (Python/Node.js/C#)
2. Нов Bicep: `infra/app/order-service.bicep`
3. Актуализирайте API Gateway да маршрутизира `/api/orders`
4. Добавете Azure SQL Database за съхранение на поръчките

**Архитектурата става**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Phase 3: Add Async Communication (Service Bus)

**Имплементиране на архитектура, базирана на събития**:

1. Добавете Azure Service Bus: `infra/core/servicebus.bicep`
2. Product Service публикува събития "ProductCreated"
3. Order Service се абонира за събитията за продукти
4. Добавете Notification Service за обработка на събития

**Модел**: Заявка/Отговор (HTTP) + Събитийно задвижван (Service Bus)

### Phase 4: Add User Authentication

**Имплементиране на User Service**:

1. Създайте `src/user-service/` (Go/Node.js)
2. Добавете Azure AD B2C или персонализирана JWT автентикация
3. API Gateway валидира токените
4. Услугите проверяват потребителските разрешения

### Phase 5: Production Readiness

**Добавете тези компоненти**:
- Azure Front Door (глобално балансиране на натоварването)
- Azure Key Vault (управление на тайни)
- Azure Monitor Workbooks (потребителски табла)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green деплойменти
- Managed Identity за всички услуги

**Пълна производствена архитектура — цена**: ~$300-1,400/month

---

## Learn More

### Related Documentation
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Next Steps in This Course
- ← Предишна: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Пример за начинаещи с един контейнер
- → Следваща: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - Добавяне на AI възможности
- 🏠 [Course Home](../../README.md)

### Сравнение: Кога какво да използвате

**Single Container App** (Примерът Simple Flask API):
- ✅ Подходящо за прости приложения
- ✅ Монолитна архитектура
- ✅ Бързо за разгръщане
- ❌ Ограничена мащабируемост
- **Цена**: ~$15-50/month

**Microservices** (Този пример):
- ✅ Подходящо за сложни приложения
- ✅ Независимо мащабиране за всяка услуга
- ✅ Автономия на екипите (различни услуги, различни екипи)
- ❌ По-сложно за управление
- **Цена**: ~$60-250/month

**Kubernetes (AKS)**:
- ✅ Максимален контрол и гъвкавост
- ✅ Портируемост между облаци
- ✅ Разширени мрежови възможности
- ❌ Изисква експертиза в Kubernetes
- **Цена**: ~$150-500/month минимум

**Препоръка**: Започнете с Container Apps (този пример), преминете към AKS само ако имате нужда от Kubernetes-специфични функции.

---

## Frequently Asked Questions

**Q: Защо само 2 услуги вместо 5+?**  
A: Образователна прогресия. Усвоете основите (комуникация между услуги, мониторинг, мащабиране) с прост пример преди да добавите сложност. Моделите, които учите тук, се прилагат и за архитектури с 100 услуги.

**Q: Мога ли да добавя още услуги сам?**  
A: Абсолютно! Следвайте горната инструкция за разширение. Всяка нова услуга следва същия модел: създайте src папка, създайте Bicep файл, актуализирайте azure.yaml, деплойвайте.

**Q: Готово ли е това за продукция?**  
A: Това е солидна основа. За продукция добавете: managed identity, Key Vault, постоянни бази данни, CI/CD pipeline, аларми за мониторинг и стратегия за бекъп.

**Q: Защо да не използвам Dapr или друг service mesh?**  
A: Поддържайте го просто за обучение. След като разберете нативната мрежова логика на Container Apps, можете да добавите Dapr за по-напреднали сценарии.

**Q: Как да дебъгна локално?**  
A: Стартирайте услугите локално с Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Мога ли да използвам различни програмни езици?**  
A: Да! Този пример показва Node.js (gateway) + Python (product service). Можете да смесвате езици, които работят в контейнери.

**Q: Какво ако нямам кредити за Azure?**  
A: Използвайте безплатния слой на Azure (първите 30 дни за нови акаунти) или правете кратки тестове и изтривайте веднага.

---

> **🎓 Резюме на учебния път**: Научихте как да разгърнете многосервисна архитектура с автоматично мащабиране, вътрешна мрежа, централен мониторинг и модели, подходящи за продукция. Тази основа ви подготвя за сложни разпределени системи и корпоративни микросервизни архитектури.

**📚 Навигация в курса:**
- ← Предишна: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Следваща: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Course Home](../../../README.md)
- 📖 [Container Apps Best Practices](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Отказ от отговорност:
Този документ е преведен с помощта на услуга за превод с изкуствен интелект Co‑op Translator (https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на оригиналния език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален превод, извършен от човек. Не носим отговорност за каквито и да е недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->