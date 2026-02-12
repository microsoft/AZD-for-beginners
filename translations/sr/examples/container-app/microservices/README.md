# Архитектура микросервиса - пример Container App

⏱️ **Оцeњено време**: 25-35 минута | 💰 **Оцeњени трошак**: ~$50-100/месечно | ⭐ **Сложеност**: Напредно

Пojедностављена али функционална архитектура микросервиса распоређена на Azure Container Apps користећи AZD CLI. Овај пример демонстрира комуникацију између сервиса, оркестрацију контејнера и надгледање са практичним подешавањем од 2 сервиса.

> **📚 Приступ учењу**: Овај пример почиње са минималном архитектуром од 2 сервиса (API Gateway + Backend Service) коју заправо можете распоредити и од које можете учити. Након што савладате овај темељ, дајемо смернице за проширење у пуни екосистем микросервиса.

## Шта ћете научити

Завршавањем овог примера ћете:
- Распоредити више контејнера на Azure Container Apps
- Имплементирати комуникацију сервиса са сервисом помоћу унутрашњег умрежавања
- Конфигурисати скалирање на основу окружења и health checks
- Надгледати дистрибуиране апликације помоћу Application Insights
- Разумети шаблоне и најбоље праксе распоређивања микросервиса
- Научити постепено проширење од једноставне до сложене архитектуре

## Архитектура

### Фаза 1: Шта правимо (укључено у овом примеру)

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

**Зашто почети једноставно?**
- ✅ Брзо распоређивање и разумевање (25-35 минута)
- ✅ Научите основне шаблоне микросервиса без сложености
- ✅ Радни код који можете мењати и експериментисати
- ✅ Нижи трошкови за учење (~$50-100/месечно уместо $300-1400/месечно)
- ✅ Изградите самопоуздање пре додавања база података и редова порука

**Аналогија**: Замислите ово као учење вожње. Почнете на празном паркингу (2 сервиса), савладате основе, па пређете на градски саобраћај (5+ сервиса са базама података).

### Фаза 2: Будуће проширење (референтна архитектура)

Када савладате архитектуру од 2 сервиса, можете је проширити на:

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

Погледајте одељак "Expansion Guide" на крају за упутства корак по корак.

## Укључене функције

✅ **Откривање сервиса**: Аутоматско откривање засновано на DNS између контејнера  
✅ **Расподела оптерећења**: Уграђена расподела оптерећења преко реплика  
✅ **Аутоматско скалирање**: Независно скалирање по сервису засновано на HTTP захтевима  
✅ **Провера здравља**: Liveness и readiness probes за оба сервиса  
✅ **Дистрибуирано логовање**: Централизовано логовање са Application Insights  
✅ **Унутрашње умрежавање**: Сигурна комуникација сервис-сервис  
✅ **Оркестрација контејнера**: Аутоматско распоређивање и скалирање  
✅ **Ажурирања без прекида**: Ролинг ажурирања са управљањем ревизијама  

## Претпоставке

### Потребни алати

Пре почетка, проверите да имате инсталиране ове алате:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (верзија 1.0.0 или новија)
   ```bash
   azd version
   # Очекивани излаз: azd верзија 1.0.0 или новија
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (верзија 2.50.0 или новија)
   ```bash
   az --version
   # Очекивани излаз: azure-cli 2.50.0 или новија
   ```

3. **[Docker](https://www.docker.com/get-started)** (за локални развој/тестирање - опционално)
   ```bash
   docker --version
   # Очекивани излаз: Docker верзија 20.10 или новија
   ```

### Захтеви за Azure

- Активна **Azure претплата** ([креирајте бесплатан налог](https://azure.microsoft.com/free/))
- Дозволе за креирање ресурса у вашој претплати
- Рола **Contributor** на претплати или групи ресурса

### Потребно претходно знање

Ово је пример на **напредном нивоу**. Требало би да сте:
- Завршили [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) 
- Основно разумевање архитектуре микросервиса
- Познавање REST API-ја и HTTP-а
- Разумевање концепата контејнера

**Ново у Container Apps?** Почните са [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) прво да бисте научили основе.

## Брзи почетак (корак по корак)

### Корак 1: Клонирање и навигација

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Провера успеха**: Уверите се да видите `azure.yaml`:
```bash
ls
# Очекује се: README.md, azure.yaml, infra/, src/
```

### Корак 2: Аутентикација у Azure

```bash
azd auth login
```

Ово ће отворити ваш прегледач за Azure аутентификацију. Пријавите се помоћу ваших Azure акредитива.

**✓ Провера успеха**: Требало би да видите:
```
Logged in to Azure.
```

### Корак 3: Иницијализација окружења

```bash
azd init
```

Питања која ћете видети:
- **Име окружења**: Унесите кратко име (нпр. `microservices-dev`)
- **Azure претплата**: Изаберите вашу претплату
- **Azure локација**: Изаберите регион (нпр. `eastus`, `westeurope`)

**✓ Провера успеха**: Требало би да видите:
```
SUCCESS: New project initialized!
```

### Корак 4: Деплој инфраструктуре и сервиса

```bash
azd up
```

**Шта се дешава** (траје 8-12 минута):
1. Креира Container Apps окружење
2. Креира Application Insights за надгледање
3. Гради API Gateway контејнер (Node.js)
4. Гради Product Service контејнер (Python)
5. Деплој-ује оба контејнера на Azure
6. Конфигурише мрежу и health checks
7. Подешава надгледање и логовање

**✓ Провера успеха**: Требало би да видите:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Време**: 8-12 минута

### Корак 5: Тестирање деплоја

```bash
# Добијте крајњу тачку гејтвеја
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Тестирајте здравље АПИ гејтвеја
curl $GATEWAY_URL/health

# Очекујани излаз:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Тестирајте сервис производа преко API Gateway-a**:
```bash
# Листа производа
curl $GATEWAY_URL/api/products

# Очекујани излаз:
# [
#   {"id":1,"name":"Лаптоп","price":999.99,"stock":50},
#   {"id":2,"name":"Миш","price":29.99,"stock":200},
#   {"id":3,"name":"Тастатура","price":79.99,"stock":150}
# ]
```

**✓ Провера успеха**: Оба ендпојнта враћају JSON податке без грешака.

---

**🎉 Честитамо!** Распоредили сте архитектуру микросервиса на Azure!

## Структура пројекта

Сви фајлови имплементације су укључени — ово је комплетан, радни пример:

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

**Шта свака компонента ради:**

**Инфраструктура (infra/)**:
- `main.bicep`: Оркестрира све Azure ресурсе и њихове зависности
- `core/container-apps-environment.bicep`: Креира Container Apps окружење и Azure Container Registry
- `core/monitor.bicep`: Подешава Application Insights за дистрибуирано логовање
- `app/*.bicep`: Појединачне дефиниције container app-ова са скалирањем и health checks

**API Gateway (src/api-gateway/)**:
- Јавно-усмерени сервис који прослеђује захтеве ка backend сервисима
- Имплементира логовање, обраду грешака и прослеђивање захтева
- Демонстрира HTTP комуникацију сервис-сервис

**Product Service (src/product-service/)**:
- Интерни сервис са каталогом производа (у меморији ради једноставности)
- REST API са health check-овима
- Пример шаблона backend микросервиса

## Преглед сервиса

### API Gateway (Node.js/Express)

**Порт**: 8080  
**Приступ**: Јаван (спољашњи ingress)  
**Сврха**: Прослеђује долазне захтеве одговарајућим backend сервисима  

**Ендпоинти**:
- `GET /` - Информације о сервису
- `GET /health` - Health check ендпоинт
- `GET /api/products` - Прослеђује ка product service (листa свих)
- `GET /api/products/:id` - Прослеђује ка product service (преузима по ID)

**Кључне карактеристике**:
- Рутинг захтева помоћу axios-а
- Централизовано логовање
- Обрада грешака и управљање временским ограничењем
- Откривање сервиса преко променљивих окружења
- Интеграција са Application Insights

**Истакао код** (`src/api-gateway/app.js`):
```javascript
// Интерна комуникација сервиса
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Порт**: 8000  
**Приступ**: Само унутрашњи (нема спољашњи ingress)  
**Сврха**: Управља каталогом производа са подацима у меморији  

**Ендпоинти**:
- `GET /` - Информације о сервису
- `GET /health` - Health check ендпоинт
- `GET /products` - Листа свих производа
- `GET /products/<id>` - Преузима производ по ID

**Кључне карактеристике**:
- RESTful API са Flask-ом
- Стор у меморији за производе (једноставно, није потребна база)
- Надгледање здравља помоћу probes
- Структурирано логовање
- Интеграција са Application Insights

**Податачки модел**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Зашто само за унутрашњу употребу?**
Product Service није изложен јавно. Сви захтеви морају проћи кроз API Gateway, који пружа:
- Безбедност: Контролисана тачка приступа
- Флексибилност: Може се мењати backend без утицаја на клијенте
- Надгледање: Централизовано логовање захтева

## Разумевање комуникације сервиса

### Како сервиси комуницирају међу собом

У овом примеру, API Gateway комуницира са Product Service-ом користећи **унутрашње HTTP позиве**:

```javascript
// API гејтвеј (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Направити унутрашњи HTTP захтев
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Кључне тачке**:

1. **Откривање засновано на DNS**: Container Apps аутоматски обезбеђује DNS за унутрашње сервисе
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Поједностављено као: `http://product-service` (Container Apps то разрешава)

2. **Нема јавне изложености**: Product Service има `external: false` у Bicep-у
   - Доступан само унутар Container Apps окружења
   - Не може се достизати са интернета

3. **Променљиве окружења**: URL-ови сервиса се убацују у време деплоја
   - Bicep предаје унутрашњи FQDN gateway-у
   - Нема хардкодираних URL-ова у апликационом коду

**Аналогија**: Замислите ово као канцеларије. API Gateway је ресепција (јавни), а Product Service је канцеларија (само интерна). Посетиоци морају проћи кроз ресепцију да би дошли до канцеларије.

## Опције распоређивања

### Пуно распоређивање (препоручено)

```bash
# Разместити инфраструктуру и оба сервиса
azd up
```

Ово распоређује:
1. Container Apps окружење
2. Application Insights
3. Container Registry
4. API Gateway контејнер
5. Product Service контејнер

**Време**: 8-12 минута

### Распоред појединачног сервиса

```bash
# Разместите само једну услугу (после почетног azd up)
azd deploy api-gateway

# Или разместите услугу „product”
azd deploy product-service
```

**Случај употребе**: Када сте ажурирали код у једном сервису и желите да поново распоредите само тај сервис.

### Ажурирање конфигурације

```bash
# Променити параметре скалирања
azd env set GATEWAY_MAX_REPLICAS 30

# Поново распоредити са новом конфигурацијом
azd up
```

## Конфигурација

### Конфигурација скалирања

Оба сервиса су конфигурисана са HTTP-базираним аутоскалирањем у њиховим Bicep фајловима:

**API Gateway**:
- Мин реплике: 2 (увек најмање 2 за доступност)
- Макс реплике: 20
- Тригер скалирања: 50 истовремених захтева по реплици

**Product Service**:
- Мин реплике: 1 (може да скалира на нулу ако је потребно)
- Макс реплике: 10
- Тригер скалирања: 100 истовремених захтева по реплици

**Прилагодите скалирање** (у `infra/app/*.bicep`):
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

### Расподела ресурса

**API Gateway**:
- CPU: 1.0 vCPU
- Меморија: 2 GiB
- Разлог: Обрађује сав спољашњи саобраћај

**Product Service**:
- CPU: 0.5 vCPU
- Меморија: 1 GiB
- Разлог: Лагане операције у меморији

### Проверe здравља

Оба сервиса укључују liveness и readiness probes:

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

**Шта ово значи**:
- **Liveness**: Ако health check не прође, Container Apps рестартује контејнер
- **Readiness**: Ако није спреман, Container Apps престаје да усмерава саобраћај ка тој реплици



## Надгледање и опсервабилност

### Преглед логова сервиса

```bash
# Погледајте логове помоћу azd monitor
azd monitor --logs

# Или користите Azure CLI за одређене Container Apps:
# Стримујте логове из API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Погледајте недавне логове сервиса производа
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Очекујани излаз**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights упити

Приступите Application Insights у Azure порталу, па покрените ове упите:

**Пронађите споре захтеве**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Праћење позива између сервиса**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Стопа грешака по сервису**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Обим захтева током времена**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Приступ контролној табли за надгледање

```bash
# Добијте детаље о Application Insights-у
azd env get-values | grep APPLICATIONINSIGHTS

# Отворите надзор у Azure порталу
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Метрике уживо

1. Идите у Application Insights у Azure порталу
2. Кликните "Live Metrics"
3. Видите реал-тиме захтеве, неуспехе и перформансе
4. Тестирајте покретањем: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Практичне вежбе

[Напомена: Погледајте целе вежбе горе у одељку "Practical Exercises" за детаљне корак-по-корак вежбе које укључују валидацију деплоја, мењање података, тестове аутоскалирања, обраду грешака и додавање трећег сервиса.]

## Анализа трошкова

### Процењени месечни трошкови (за овај пример са 2 сервиса)

| Ресурс | Конфигурација | Процењени трошак |
|----------|--------------|----------------|
| API Gateway | 2-20 реплика, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 реплика, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/месечно | $5-10 |
| Log Analytics | 1 GB/месечно | $3 |
| **Укупно** | | **$58-243/месечно** |

**Расподела трошкова по употреби**:
- **Низак саобраћај** (тестирање/учење): ~ $60/месечно
- **Умерен саобраћај** (мала продукција): ~ $120/месечно
- **Велики саобраћај** (заузето): ~ $240/месечно

### Савети за оптимизацију трошкова

1. **Скалирање на нулу за развој**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Користите Consumption план за Cosmos DB** (када га додате):
   - Плаћате само за оно што користите
   - Нема минималне наплате

3. **Подесите Application Insights sampling**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Узорковати 50% захтева
   ```

4. **Очистите ресурсе када нису потребни**:
   ```bash
   azd down
   ```

### Опције бесплатног нивоа
За учење/тестирање, размотрите:
- Користите бесплатне Azure кредите (првих 30 дана)
- Држите минималан број реплика
- Обришите после тестирања (без сталних трошкова)

---

## Чишћење

Да бисте избегли сталне трошкове, обришите све ресурсе:

```bash
azd down --force --purge
```

**Захтев за потврду**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Унесите `y` за потврду.

**Шта ће бити обрисано**:
- Container Apps Environment
- Both Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Потврдите чишћење**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Треба да врати празно.

---

## Водич за проширење: Од 2 до 5+ услуга

Када савладате ову архитектуру са 2 услуге, ево како да је проширите:

### Фаза 1: Додавање перзистенције базе података (следећи корак)

**Додајте Cosmos DB за услугу производа**:

1. Креирајте `infra/core/cosmos.bicep`:
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

2. Ажурирајте услугу производа да користи Cosmos DB уместо података у меморији

3. Процењени додатни трошак: ~$25/месечно (serverless)

### Фаза 2: Додајте трећу услугу (управљање наруџбинама)

**Креирајте услугу наруџбина**:

1. Нова фасцикла: `src/order-service/` (Python/Node.js/C#)
2. Нови Bicep: `infra/app/order-service.bicep`
3. Ажурирајте API Gateway да рутира `/api/orders`
4. Додајте Azure SQL Database за перзистенцију наруџбина

**Архитектура постаје**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Фаза 3: Додавање асинхроне комуникације (Service Bus)

**Имплементирајте архитектуру засновану на догађајима**:

1. Додајте Azure Service Bus: `infra/core/servicebus.bicep`
2. Услуга производа објављује догађаје "ProductCreated"
3. Услуга наруџбина се претплаћује на догађаје производа
4. Додајте Notification Service за обраду догађаја

**Образац**: Request/Response (HTTP) + Event-Driven (Service Bus)

### Фаза 4: Додавање аутентификације корисника

**Имплементирајте услугу корисника**:

1. Креирајте `src/user-service/` (Go/Node.js)
2. Додајте Azure AD B2C или прилагођену JWT аутентификацију
3. API Gateway валида токене
4. Услуге проверавају дозволе корисника

### Фаза 5: Спремност за продукцију

**Додајте ове компоненте**:
- Azure Front Door (global load balancing)
- Azure Key Vault (secret management)
- Azure Monitor Workbooks (custom dashboards)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity for all services

**Трошак целе продукционе архитектуре**: ~$300-1,400/месечно

---

## Сазнајте више

### Повезана документација
- [Документација за Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Водич за архитектуру микросервиса](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights за дистрибуирано праћење](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Документација за Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Следећи кораци у овом курсу
- ← Претходно: [Једноставан Flask API](../../../../../examples/container-app/simple-flask-api) - Почетнички пример са једним контејнером
- → Следеће: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - Додајте AI могућности
- 🏠 [Почетна страница курса](../../README.md)

### Поређење: Када шта користити

**Апликација у једном контејнеру** (пример Simple Flask API):
- ✅ Једноставне апликације
- ✅ Монолитна архитектура
- ✅ Брзо за деплој
- ❌ Ограничена скалабилност
- **Трошак**: ~$15-50/месечно

**Микросервиси** (Овај пример):
- ✅ Комплексне апликације
- ✅ Независно скалирање по услузи
- ✅ Аутономија тима (различите услуге, различити тимови)
- ❌ Сложеније за управљање
- **Трошак**: ~$60-250/месечно

**Kubernetes (AKS)**:
- ✅ Максимална контрола и флексибилност
- ✅ Портабилност између више облака
- ✅ Напредно мрежно умрежавање
- ❌ Захтева експертизу за Kubernetes
- **Трошак**: минимум ~$150-500/месечно

**Препорука**: Почните са Container Apps (овај пример), пређите на AKS само ако су вам потребне функције специфичне за Kubernetes.

---

## Често постављана питања

**П: Зашто само 2 услуге уместо 5+?**  
О: Едукативни напредак. Савладајте основе (комуникација између услуга, мониторинг, скалирање) са једноставним примером пре додавања сложености. Обрасци које овде научите важе и за архитектуре са 100 услуга.

**П: Могу ли сам додати више услуга?**  
О: Апсолутно! Пратите горе наведени водич за проширење. Свака нова услуга следи исти образац: креирајте src фасциклу, креирајте Bicep фајл, ажурирајте azure.yaml, и разместите.

**П: Да ли је ово спремно за продукцију?**  
О: Ово је добра основа. За продукцију додајте: Managed Identity, Key Vault, перзистентне базе података, CI/CD pipeline, аларме за мониторинг и стратегију резервних копија.

**П: Зашто не користити Dapr или други service mesh?**  
О: Останите једноставни за учење. Кад разумете нативно умрежавање Container Apps, можете додати Dapr за напредне сценарије.

**П: Како дебаговати локално?**  
О: Покрените сервисе локално уз Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**П: Могу ли користити различите програмске језике?**  
О: Да! Овај пример показује Node.js (gateway) + Python (услуга производа). Можете мешати било које језике који раде у контејнерима.

**П: Шта ако немам Azure кредите?**  
О: Користите бесплатни ниво Azure (првих 30 дана за нове налоге) или размештајте само за кратка тестирања и одмах обришите.

---

> **🎓 Резиме пута учења**: Наравно сте научили како да размештате архитектуру са више услуга са аутоматским скалирањем, унутрашњим умрежавањем, централизованим мониторингом и образцима спремним за продукцију. Ова основа вас припрема за сложене дистрибуиране системе и ентерпрајз микросервисне архитектуре.

**📚 Навигација курса:**
- ← Претходно: [Једноставан Flask API](../../../../../examples/container-app/simple-flask-api)
- → Следеће: [Пример интеграције базе података](../../../../../examples/database-app)
- 🏠 [Почетна страница курса](../../../README.md)
- 📖 [Најбоље праксе за Container Apps](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање одговорности**:
Овај документ је преведен помоћу сервиса за превод уз подршку вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати коначним и ауторитетним извором. За критичне информације препоручује се професионални превод који обављају људи. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која могу настати употребом овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->