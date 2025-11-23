<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22ea3f5148517a6012d3e2771584ef87",
  "translation_date": "2025-11-23T19:22:40+00:00",
  "source_file": "examples/container-app/microservices/README.md",
  "language_code": "sr"
}
-->
# Микросервисна архитектура - Пример апликације у контејнеру

⏱️ **Процењено време**: 25-35 минута | 💰 **Процењени трошак**: ~$50-100/месечно | ⭐ **Комплексност**: Напредно

**Поједностављена, али функционална** микросервисна архитектура, распоређена на Azure Container Apps користећи AZD CLI. Овај пример демонстрира комуникацију између сервиса, оркестрацију контејнера и праћење са практичним подешавањем од 2 сервиса.

> **📚 Приступ учењу**: Овај пример почиње са минималном архитектуром од 2 сервиса (API Gateway + Backend Service) коју заправо можете распоредити и учити из ње. Након савладавања основе, пружамо смернице за проширење на комплетан микросервисни екосистем.

## Шта ћете научити

Завршетком овог примера, научићете:
- Како да распоредите више контејнера на Azure Container Apps
- Како да имплементирате комуникацију између сервиса са интерним мрежама
- Како да конфигуришете скалирање засновано на окружењу и провере здравља
- Како да пратите дистрибуиране апликације помоћу Application Insights
- Како да разумете обрасце распоређивања микросервиса и најбоље праксе
- Како да постепено проширите архитектуру од једноставне до сложене

## Архитектура

### Фаза 1: Шта градимо (укључено у овај пример)

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
- ✅ Учење основних образаца микросервиса без сложености
- ✅ Радни код који можете модификовати и експериментисати са њим
- ✅ Мањи трошкови за учење (~$50-100/месечно у односу на $300-1400/месечно)
- ✅ Стицање самопоуздања пре додавања база података и редова порука

**Аналогија**: Замислите ово као учење вожње. Почињете на празном паркингу (2 сервиса), савладате основе, а затим напредујете до градског саобраћаја (5+ сервиса са базама података).

### Фаза 2: Будуће проширење (референтна архитектура)

Када савладате архитектуру са 2 сервиса, можете је проширити на:

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

Погледајте одељак "Водич за проширење" на крају за корак-по-корак упутства.

## Укључене функције

✅ **Откривање сервиса**: Аутоматско DNS откривање између контејнера  
✅ **Расподела оптерећења**: Уграђена расподела оптерећења између реплика  
✅ **Ауто-скалирање**: Независно скалирање по сервису на основу HTTP захтева  
✅ **Праћење здравља**: Провере живости и спремности за оба сервиса  
✅ **Дистрибуирано логовање**: Централизовано логовање са Application Insights  
✅ **Интерно умрежавање**: Сигурна комуникација између сервиса  
✅ **Оркестрација контејнера**: Аутоматско распоређивање и скалирање  
✅ **Ажурирања без прекида рада**: Ролинг ажурирања са управљањем ревизијама  

## Предуслови

### Потребни алати

Пре почетка, проверите да ли имате инсталиране следеће алате:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (верзија 1.0.0 или новија)  
   ```bash
   azd version
   # Очекивани излаз: azd верзија 1.0.0 или новија
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (верзија 2.50.0 или новија)  
   ```bash
   az --version
   # Очекивани излаз: azure-cli 2.50.0 или новији
   ```

3. **[Docker](https://www.docker.com/get-started)** (за локални развој/тестирање - опционо)  
   ```bash
   docker --version
   # Очекивани излаз: Docker верзија 20.10 или новија
   ```

### Azure захтеви

- Активна **Azure претплата** ([креирајте бесплатан налог](https://azure.microsoft.com/free/))
- Дозволе за креирање ресурса у вашој претплати
- **Contributor** улога на претплати или ресурсној групи

### Предзнање

Ово је пример **на напредном нивоу**. Требало би да имате:
- Завршен [Пример једноставног Flask API-ја](../../../../../examples/container-app/simple-flask-api)  
- Основно разумевање микросервисне архитектуре
- Познавање REST API-ја и HTTP-а
- Разумевање концепата контејнера

**Нови сте у Container Apps?** Почните са [Примером једноставног Flask API-ја](../../../../../examples/container-app/simple-flask-api) да бисте научили основе.

## Брзи почетак (корак по корак)

### Корак 1: Клонирајте и навигирајте

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Провера успеха**: Проверите да ли видите `azure.yaml`:
```bash
ls
# Очекује се: README.md, azure.yaml, infra/, src/
```

### Корак 2: Аутентификујте се са Azure-ом

```bash
azd auth login
```

Ово отвара ваш претраживач за Azure аутентификацију. Пријавите се са вашим Azure акредитивима.

**✓ Провера успеха**: Требало би да видите:
```
Logged in to Azure.
```

### Корак 3: Иницијализујте окружење

```bash
azd init
```

**Питања која ћете видети**:
- **Име окружења**: Унесите кратко име (нпр. `microservices-dev`)
- **Azure претплата**: Изаберите вашу претплату
- **Azure локација**: Изаберите регион (нпр. `eastus`, `westeurope`)

**✓ Провера успеха**: Требало би да видите:
```
SUCCESS: New project initialized!
```

### Корак 4: Распоредите инфраструктуру и сервисе

```bash
azd up
```

**Шта се дешава** (траје 8-12 минута):
1. Креира окружење за Container Apps
2. Креира Application Insights за праћење
3. Гради API Gateway контејнер (Node.js)
4. Гради Product Service контејнер (Python)
5. Распоређује оба контејнера на Azure
6. Конфигурише умрежавање и провере здравља
7. Поставља праћење и логовање

**✓ Провера успеха**: Требало би да видите:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Време**: 8-12 минута

### Корак 5: Тестирајте распоређивање

```bash
# Преузмите крајњу тачку пролаза
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Тестирајте здравље API пролаза
curl $GATEWAY_URL/health

# Очекивани излаз:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Тестирајте сервис производа преко gateway-а**:
```bash
# Листа производа
curl $GATEWAY_URL/api/products

# Очекивани излаз:
# [
#   {"id":1,"name":"Лаптоп","price":999.99,"stock":50},
#   {"id":2,"name":"Миш","price":29.99,"stock":200},
#   {"id":3,"name":"Тастатура","price":79.99,"stock":150}
# ]
```

**✓ Провера успеха**: Оба ендпоинта враћају JSON податке без грешака.

---

**🎉 Честитамо!** Успешно сте распоредили микросервисну архитектуру на Azure!

## Структура пројекта

Сви имплементациони фајлови су укључени—ово је комплетан, функционалан пример:

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

**Шта ради свака компонента:**

**Инфраструктура (infra/)**:
- `main.bicep`: Оркестрира све Azure ресурсе и њихове зависности
- `core/container-apps-environment.bicep`: Креира окружење за Container Apps и Azure Container Registry
- `core/monitor.bicep`: Поставља Application Insights за дистрибуирано логовање
- `app/*.bicep`: Појединачне дефиниције контејнерских апликација са скалирањем и проверама здравља

**API Gateway (src/api-gateway/)**:
- Јавно доступан сервис који усмерава захтеве ка позадинским сервисима
- Имплементира логовање, обраду грешака и прослеђивање захтева
- Демонстрира HTTP комуникацију између сервиса

**Product Service (src/product-service/)**:
- Интерни сервис са каталогом производа (у меморији ради једноставности)
- REST API са проверама здравља
- Пример обрасца позадинског микросервиса

## Преглед сервиса

### API Gateway (Node.js/Express)

**Порт**: 8080  
**Приступ**: Јаван (екстерни улаз)  
**Сврха**: Усмерава долазне захтеве ка одговарајућим позадинским сервисима  

**Ендпоинти**:
- `GET /` - Информације о сервису
- `GET /health` - Ендпоинт за проверу здравља
- `GET /api/products` - Прослеђује ка сервису производа (листа свих)
- `GET /api/products/:id` - Прослеђује ка сервису производа (добијање по ID-у)

**Кључне карактеристике**:
- Усмеравање захтева са axios-ом
- Централизовано логовање
- Обрада грешака и управљање временским ограничењима
- Откривање сервиса преко променљивих окружења
- Интеграција са Application Insights

**Истакнути код** (`src/api-gateway/app.js`):
```javascript
// Унутрашња комуникација услуга
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Порт**: 8000  
**Приступ**: Само интерни (без екстерног улаза)  
**Сврха**: Управља каталогом производа са подацима у меморији  

**Ендпоинти**:
- `GET /` - Информације о сервису
- `GET /health` - Ендпоинт за проверу здравља
- `GET /products` - Листа свих производа
- `GET /products/<id>` - Добијање производа по ID-у

**Кључне карактеристике**:
- RESTful API са Flask-ом
- Продавница производа у меморији (једноставно, без базе података)
- Праћење здравља са пробама
- Структурирано логовање
- Интеграција са Application Insights

**Модел података**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Зашто само интерно?**
Сервис производа није јавно доступан. Сви захтеви морају проћи кроз API Gateway, који пружа:
- Сигурност: Контролисана тачка приступа
- Флексибилност: Могућност промене позадине без утицаја на клијенте
- Праћење: Централизовано логовање захтева

## Разумевање комуникације између сервиса

### Како сервиси комуницирају

У овом примеру, API Gateway комуницира са Product Service-ом користећи **интерне HTTP позиве**:

```javascript
// АПИ капија (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Направи интерни HTTP захтев
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Кључне тачке**:

1. **DNS-базирано откривање**: Container Apps аутоматски обезбеђује DNS за интерне сервисе
   - FQDN за Product Service: `product-service.internal.<environment>.azurecontainerapps.io`
   - Поједностављено као: `http://product-service` (Container Apps то разрешава)

2. **Нема јавне изложености**: Product Service има `external: false` у Bicep-у
   - Доступан само унутар Container Apps окружења
   - Не може се приступити са интернета

3. **Променљиве окружења**: URL-ови сервиса се убацују током распоређивања
   - Bicep прослеђује интерни FQDN ка gateway-у
   - Нема хардкодираних URL-ова у апликационом коду

**Аналогија**: Замислите ово као канцеларијске просторије. API Gateway је рецепција (јавна), а Product Service је канцеларија (само интерна). Посетиоци морају проћи кроз рецепцију да би дошли до било које канцеларије.

## Опције распоређивања

### Комплетно распоређивање (препоручено)

```bash
# Разместите инфраструктуру и оба сервиса
azd up
```

Ово распоређује:
1. Окружење за Container Apps
2. Application Insights
3. Container Registry
4. API Gateway контејнер
5. Product Service контејнер

**Време**: 8-12 минута

### Распоређивање појединачног сервиса

```bash
# Разместите само једну услугу (након почетног azd up)
azd deploy api-gateway

# Или разместите услугу производа
azd deploy product-service
```

**Случај употребе**: Када сте ажурирали код у једном сервису и желите да распоредите само тај сервис.

### Ажурирање конфигурације

```bash
# Промените параметре скалирања
azd env set GATEWAY_MAX_REPLICAS 30

# Поново примените са новом конфигурацијом
azd up
```

## Конфигурација

### Конфигурација скалирања

Оба сервиса су конфигурисана са HTTP-базираним аутоскалирањем у њиховим Bicep фајловима:

**API Gateway**:
- Минималне реплике: 2 (увек бар 2 ради доступности)
- Максималне реплике: 20
- Окидач скалирања: 50 истовремених захтева по реплици

**Product Service**:
- Минималне реплике: 1 (може се скалирати на нулу ако је потребно)
- Максималне реплике: 10
- Окидач скалирања: 100 истовремених захтева по реплици

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

### Додела ресурса

**API Gateway**:
- CPU: 1.0 vCPU
- Меморија: 2 GiB
- Разлог: Обрађује сав екстерни саобраћај

**Product Service**:
- CPU: 0.5 vCPU
- Меморија: 1 GiB
- Разлог: Лагане операције у меморији

### Провере здравља

Оба сервиса укључују провере живости и спремности:

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
- **Живост**: Ако провера здравља не успе, Container Apps поново покреће контејнер
- **Спремност**: Ако није спреман, Container Apps престаје да усмерава саобраћај ка тој реплици

## Праћење и посматрање

### Преглед логова сервиса

```bash
# Стримујте логове из API Gateway-а
azd logs api-gateway --follow

# Погледајте недавне логове услуге производа
azd logs product-service --tail 100

# Погледајте све логове из обе услуге
azd logs --follow
```

**Очекивани излаз**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Упити у Application Insights

Приступите Application Insights у Azure порталу, затим покрените ове упите:

**Пронађите споре захтеве**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Пратите позиве између сервиса**:
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

### Приступ контролној табли за праћење

```bash
# Добијте детаље о Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Отворите Azure Portal за праћење
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Жива метрика

1. Идите на Application Insights у Azure порталу
2. Кликните на "Live Metrics"
3. Погледајте захтеве у реалном времену, неуспехе и перформансе
4. Тестирајте покретањем: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Практичне вежбе

[Напомена: Погледајте комплетне вежбе у одељку "Практичне вежбе" изнад за детаљна корак-по-корак упутства, укључујући верификацију распоређивања, модификацију података, тестове аутоскалирања, обраду грешака и додавање трећег сервиса.]

## Анализа трошкова

### Процењени месечни трошкови (за овај пример са 2 сервиса)

| Ресурс | Конфигурација | Процењени трошак |
|--------|---------------|------------------|
| API Gateway | 2-20 реплика, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 реплика, 0.5 vCPU, 
Za učenje/testiranje, razmotrite:
- Koristite besplatne Azure kredite (prvih 30 dana)
- Ograničite broj replika na minimum
- Obrišite nakon testiranja (bez stalnih troškova)

---

## Čišćenje

Da biste izbegli stalne troškove, obrišite sve resurse:

```bash
azd down --force --purge
```

**Potvrda**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Unesite `y` za potvrdu.

**Šta se briše**:
- Okruženje za Container Apps
- Oba Container App-a (gateway i product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Proverite čišćenje**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Treba da vrati prazno.

---

## Vodič za proširenje: Od 2 do 5+ servisa

Kada savladate arhitekturu sa 2 servisa, evo kako da je proširite:

### Faza 1: Dodavanje baze podataka (sledeći korak)

**Dodajte Cosmos DB za Product Service**:

1. Kreirajte `infra/core/cosmos.bicep`:
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

2. Ažurirajte Product Service da koristi Cosmos DB umesto podataka u memoriji

3. Procena dodatnih troškova: ~$25 mesečno (serverless)

### Faza 2: Dodavanje trećeg servisa (upravljanje narudžbinama)

**Kreirajte Order Service**:

1. Novi folder: `src/order-service/` (Python/Node.js/C#)
2. Novi Bicep: `infra/app/order-service.bicep`
3. Ažurirajte API Gateway da rutira `/api/orders`
4. Dodajte Azure SQL Database za čuvanje narudžbina

**Arhitektura postaje**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Faza 3: Dodavanje asinhrone komunikacije (Service Bus)

**Implementirajte arhitekturu zasnovanu na događajima**:

1. Dodajte Azure Service Bus: `infra/core/servicebus.bicep`
2. Product Service objavljuje događaje "ProductCreated"
3. Order Service se pretplaćuje na događaje proizvoda
4. Dodajte Notification Service za obradu događaja

**Šablon**: Zahtev/odgovor (HTTP) + zasnovano na događajima (Service Bus)

### Faza 4: Dodavanje autentifikacije korisnika

**Implementirajte User Service**:

1. Kreirajte `src/user-service/` (Go/Node.js)
2. Dodajte Azure AD B2C ili prilagođenu JWT autentifikaciju
3. API Gateway proverava tokene
4. Servisi proveravaju dozvole korisnika

### Faza 5: Spremnost za produkciju

**Dodajte sledeće komponente**:
- Azure Front Door (globalno balansiranje opterećenja)
- Azure Key Vault (upravljanje tajnama)
- Azure Monitor Workbooks (prilagođene kontrolne table)
- CI/CD pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity za sve servise

**Trošak kompletne produkcijske arhitekture**: ~$300-1,400 mesečno

---

## Saznajte više

### Povezana dokumentacija
- [Azure Container Apps Dokumentacija](https://learn.microsoft.com/azure/container-apps/)
- [Vodič za arhitekturu mikroservisa](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights za distribuisano praćenje](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Sledeći koraci u ovom kursu
- ← Prethodno: [Jednostavan Flask API](../../../../../examples/container-app/simple-flask-api) - Primer jednostavnog kontejnera za početnike
- → Sledeće: [Vodič za AI integraciju](../../../../../examples/docs/ai-foundry) - Dodajte AI mogućnosti
- 🏠 [Početna stranica kursa](../../README.md)

### Poređenje: Kada koristiti šta

**Jedan Container App** (primer jednostavnog Flask API-ja):
- ✅ Jednostavne aplikacije
- ✅ Monolitna arhitektura
- ✅ Brzo za implementaciju
- ❌ Ograničena skalabilnost
- **Trošak**: ~$15-50 mesečno

**Mikroservisi** (ovaj primer):
- ✅ Kompleksne aplikacije
- ✅ Nezavisno skaliranje po servisu
- ✅ Autonomija timova (različiti servisi, različiti timovi)
- ❌ Složenije za upravljanje
- **Trošak**: ~$60-250 mesečno

**Kubernetes (AKS)**:
- ✅ Maksimalna kontrola i fleksibilnost
- ✅ Portabilnost između oblaka
- ✅ Napredne mreže
- ❌ Zahteva ekspertizu za Kubernetes
- **Trošak**: ~$150-500 mesečno minimum

**Preporuka**: Počnite sa Container Apps (ovaj primer), pređite na AKS samo ako su vam potrebne specifične funkcije Kubernetes-a.

---

## Često postavljana pitanja

**P: Zašto samo 2 servisa umesto 5+?**  
O: Edukativni napredak. Savladajte osnove (komunikacija servisa, praćenje, skaliranje) sa jednostavnim primerom pre dodavanja složenosti. Šabloni koje ovde naučite primenjuju se na arhitekture sa 100 servisa.

**P: Mogu li sam dodati više servisa?**  
O: Naravno! Pratite vodič za proširenje iznad. Svaki novi servis prati isti šablon: kreirajte src folder, kreirajte Bicep fajl, ažurirajte azure.yaml, implementirajte.

**P: Da li je ovo spremno za produkciju?**  
O: Ovo je solidna osnova. Za produkciju dodajte: managed identity, Key Vault, trajne baze podataka, CI/CD pipeline, monitoring upozorenja i strategiju bekapa.

**P: Zašto ne koristiti Dapr ili drugi service mesh?**  
O: Održite jednostavnost za učenje. Kada razumete nativno umrežavanje Container Apps, možete dodati Dapr za napredne scenarije.

**P: Kako da debagujem lokalno?**  
O: Pokrenite servise lokalno sa Docker-om:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**P: Mogu li koristiti različite programske jezike?**  
O: Da! Ovaj primer prikazuje Node.js (gateway) + Python (product service). Možete kombinovati bilo koje jezike koji rade u kontejnerima.

**P: Šta ako nemam Azure kredite?**  
O: Koristite besplatni Azure nivo (prvih 30 dana sa novim nalozima) ili implementirajte za kratke test periode i odmah obrišite.

---

> **🎓 Rezime puta učenja**: Naučili ste kako da implementirate arhitekturu sa više servisa sa automatskim skaliranjem, internim umrežavanjem, centralizovanim praćenjem i šablonima spremnim za produkciju. Ova osnova vas priprema za složene distribuirane sisteme i arhitekture mikroservisa za preduzeća.

**📚 Navigacija kursa**:
- ← Prethodno: [Jednostavan Flask API](../../../../../examples/container-app/simple-flask-api)
- → Sledeće: [Primer integracije baze podataka](../../../../../examples/database-app)
- 🏠 [Početna stranica kursa](../../README.md)
- 📖 [Najbolje prakse za Container Apps](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати меродавним извором. За критичне информације препоручује се професионални превод од стране људског преводиоца. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->