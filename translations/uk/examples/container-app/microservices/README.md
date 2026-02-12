# Архітектура мікросервісів - приклад Container App

⏱️ **Орієнтовний час**: 25-35 хвилин | 💰 **Орієнтовна вартість**: ~$50-100/місяць | ⭐ **Складність**: Високий рівень

**Спрощена, проте функціональна** архітектура мікросервісів, розгорнута в Azure Container Apps за допомогою AZD CLI. Цей приклад демонструє взаємодію сервісів, оркестрацію контейнерів та моніторинг на практичній конфігурації з 2 сервісів.

> **📚 Підхід до навчання**: Цей приклад починається з мінімальної архітектури з 2 сервісів (API Gateway + Backend Service), яку ви можете розгорнути та вивчити. Після засвоєння основ ми надамо рекомендації щодо розширення до повної екосистеми мікросервісів.

## Чого ви навчитеся

Виконавши цей приклад, ви:
- Розгорнете кілька контейнерів в Azure Container Apps
- Реалізуєте комунікацію між сервісами через внутрішню мережу
- Налаштуєте масштабування та перевірки здоров’я залежно від середовища
- Моніторитимете розподілені додатки за допомогою Application Insights
- Зрозумієте шаблони розгортання мікросервісів та кращі практики
- Навчитесь поступово розширювати просту архітектуру до складної

## Архітектура

### Фаза 1: Що ми будуємо (включено в цей приклад)

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

**Чому починаємо з простого?**  
- ✅ Швидке розгортання та розуміння (25-35 хвилин)  
- ✅ Вивчення основних патернів мікросервісів без ускладнень  
- ✅ Робочий код, який можна модифікувати та досліджувати  
- ✅ Нижча вартість навчання (~$50-100/місяць замість $300-1400/місяць)  
- ✅ Набуття впевненості, перш ніж додавати бази даних і черги повідомлень  

**Аналогія**: Це як навчитися водити. Починаєш з порожньої парковки (2 сервіси), освоюєш основи, а потім переходиш до міського руху (5+ сервісів з базами даних).

### Фаза 2: Майбутнє розширення (Референсна архітектура)

Після освоєння архітектури з 2 сервісів, ви можете розширити її до:

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

Дивіться розділ "Expansion Guide" наприкінці для покрокових інструкцій.

## Включені функції

✅ **Виявлення сервісів**: Автоматичне виявлення через DNS між контейнерами  
✅ **Балансування навантаження**: Вбудоване балансування між репліками  
✅ **Автоматичне масштабування**: Незалежне масштабування кожного сервісу на основі HTTP-запитів  
✅ **Моніторинг здоров’я**: Проби живучості та готовності для обох сервісів  
✅ **Розподілений логінг**: Централізований лог за допомогою Application Insights  
✅ **Внутрішня мережа**: Безпечна комунікація між сервісами  
✅ **Оркестрація контейнерів**: Автоматичне розгортання та масштабування  
✅ **Оновлення без простоїв**: Поступові оновлення з керуванням версіями  

## Передумови

### Необхідні інструменти

Перед початком впевніться, що у вас встановлені:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (версія 1.0.0 або вище)  
   ```bash
   azd version
   # Очікуваний вивід: версія azd 1.0.0 або вища
   ```
  
2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (версія 2.50.0 або вище)  
   ```bash
   az --version
   # Очікуваний результат: azure-cli 2.50.0 або вище
   ```
  
3. **[Docker](https://www.docker.com/get-started)** (для локальної розробки/тестування - опційно)  
   ```bash
   docker --version
   # Очікуваний результат: версія Docker 20.10 або вище
   ```
  
### Вимоги Azure

- Активна **підписка Azure** ([створити безкоштовний обліковий запис](https://azure.microsoft.com/free/))  
- Права на створення ресурсів у підписці  
- Роль **Contributor** на підписку або групу ресурсів  

### Необхідні знання

Цей приклад призначений для **професійного рівня**. Ви повинні:  
- Завершити [Simple Flask API example](../../../../../examples/container-app/simple-flask-api)  
- Мати базове розуміння архітектури мікросервісів  
- Бути знайомими з REST API та HTTP  
- Розуміти концепції контейнерів  

**Новачки у Container Apps?** Почніть з [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) для вивчення основ.

## Швидкий старт (покроково)

### Крок 1: Клонувати та перейти до каталогу

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```
  
**✓ Перевірка успіху**: Переконайтесь, що бачите `azure.yaml`:  
```bash
ls
# Очікувано: README.md, azure.yaml, infra/, src/
```
  
### Крок 2: Авторизуватися в Azure

```bash
azd auth login
```
  
Це відкриє браузер для аутентифікації Azure. Увійдіть зі своїми обліковими даними.

**✓ Перевірка успіху**: Ви маєте побачити:  
```
Logged in to Azure.
```
  
### Крок 3: Ініціалізувати середовище

```bash
azd init
```
  
**Вас буде запитано**:  
- **Назва середовища**: Введіть коротку назву (наприклад, `microservices-dev`)  
- **Підписка Azure**: Оберіть вашу підписку  
- **Регіон Azure**: Оберіть регіон (наприклад, `eastus`, `westeurope`)  

**✓ Перевірка успіху**: Ви маєте побачити:  
```
SUCCESS: New project initialized!
```
  
### Крок 4: Розгорнути інфраструктуру та сервіси

```bash
azd up
```
  
**Що відбувається** (приблизно 8-12 хвилин):  
1. Створення середовища Container Apps  
2. Створення Application Insights для моніторингу  
3. Збірка контейнеру API Gateway (Node.js)  
4. Збірка контейнеру Product Service (Python)  
5. Розгортання обох контейнерів у Azure  
6. Налаштування мережі та перевірок здоров’я  
7. Налаштування моніторингу та логування  

**✓ Перевірка успіху**: Ви маєте побачити:  
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```
  
**⏱️ Час**: 8-12 хвилин

### Крок 5: Перевірити розгортання

```bash
# Отримати кінцеву точку шлюзу
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Перевірити стан здоров'я API Gateway
curl $GATEWAY_URL/health

# Очікуваний результат:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```
  
**Перевірка Product Service через Gateway**:  
```bash
# Список продуктів
curl $GATEWAY_URL/api/products

# Очікуваний результат:
# [
#   {"id":1,"name":"Ноутбук","price":999.99,"stock":50},
#   {"id":2,"name":"Миша","price":29.99,"stock":200},
#   {"id":3,"name":"Клавіатура","price":79.99,"stock":150}
# ]
```
  
**✓ Перевірка успіху**: Обидва ендпоінти повертають JSON без помилок.

---

**🎉 Вітаємо!** Ви розгорнули архітектуру мікросервісів в Azure!

## Структура проекту

Всі файли реалізації включені – це повний робочий приклад:

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
  
**Що робить кожен компонент:**

**Інфраструктура (infra/):**  
- `main.bicep`: Оркестрація Azure ресурсів та залежностей  
- `core/container-apps-environment.bicep`: Створення середовища Container Apps та Azure Container Registry  
- `core/monitor.bicep`: Налаштування Application Insights для розподіленого логування  
- `app/*.bicep`: Окремі визначення контейнерних додатків з масштабуванням та перевірками здоров’я  

**API Gateway (src/api-gateway/):**  
- Публічний сервіс, який маршрутизує запити до бекенд-сервісів  
- Логування, обробка помилок та переадресація запитів  
- Демонстрація HTTP-комунікації між сервісами  

**Product Service (src/product-service/):**  
- Внутрішній сервіс з каталогом продуктів (для простоти зберігає дані в пам’яті)  
- REST API з перевірками здоров’я  
- Приклад патерну бекенд мікросервісу  

## Огляд сервісів

### API Gateway (Node.js/Express)

**Порт**: 8080  
**Доступ**: Публічний (зовнішній вхід)  
**Призначення**: Маршрутизація вхідних запитів до відповідних бекенд-сервісів  

**Ендпоінти**:  
- `GET /` – інформація про сервіс  
- `GET /health` – перевірка здоров’я  
- `GET /api/products` – переадресація до Product Service (отримати всі)  
- `GET /api/products/:id` – переадресація до Product Service (отримати за ID)  

**Ключові можливості**:  
- Маршрутизація запитів з axios  
- Централізоване логування  
- Обробка помилок та таймаути  
- Виявлення сервісів через змінні середовища  
- Інтеграція з Application Insights  

**Видаток коду** (`src/api-gateway/app.js`):  
```javascript
// Внутрішнє сервісне спілкування
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```
  
### Product Service (Python/Flask)

**Порт**: 8000  
**Доступ**: Лише внутрішній (без зовнішнього вхідного трафіку)  
**Призначення**: Управління каталогом продуктів з даними в пам’яті  

**Ендпоінти**:  
- `GET /` – інформація про сервіс  
- `GET /health` – перевірка здоров’я  
- `GET /products` – список усіх продуктів  
- `GET /products/<id>` – отримати продукт за ID  

**Ключові можливості**:  
- RESTful API на Flask  
- Зберігання продуктів у пам’яті (просто, без бази даних)  
- Моніторинг здоров’я з пробами  
- Структуроване логування  
- Інтеграція з Application Insights  

**Модель даних**:  
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```
  
**Чому лише внутрішній доступ?**  
Product Service не публічний. Всі запити йдуть через API Gateway, що забезпечує:  
- Безпеку: контрольована точка доступу  
- Гнучкість: можна змінювати бекенд без впливу на клієнтів  
- Моніторинг: централізоване логування запитів  

## Розуміння комунікації між сервісами

### Як сервіси спілкуються між собою

У цьому прикладі API Gateway зв’язується з Product Service через **внутрішні HTTP-запити**:

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Виконати внутрішній HTTP-запит
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```
  
**Ключові моменти**:  

1. **Виявлення за допомогою DNS**: Container Apps автоматично надає DNS для внутрішніх сервісів  
   - FQDN Product Service: `product-service.internal.<environment>.azurecontainerapps.io`  
   - Спрощено як: `http://product-service` (Container Apps резолвить)  

2. **Відсутність публічного доступу**: У Bicep для Product Service `external: false`  
   - Доступ тільки всередині середовища Container Apps  
   - Недоступний з інтернету  

3. **Змінні середовища**: URL сервісів вводяться під час розгортання  
   - Bicep передає внутрішній FQDN в gateway  
   - Відсутність жорстко закодованих URL у додатку  

**Аналогія**: Це як кімнати в офісі. API Gateway – це приймальна (публічна), Product Service – кабінет (лише внутрішній). Відвідувачі мають проходити через приймальню, щоб потрапити до кабінету.

## Варіанти розгортання

### Повне розгортання (рекомендовано)

```bash
# Розгорнути інфраструктуру та обидва сервіси
azd up
```
  
Це створить:  
1. Середовище Container Apps  
2. Application Insights  
3. Контейнерний реєстр  
4. Контейнер API Gateway  
5. Контейнер Product Service  

**Час**: 8-12 хвилин

### Розгорнути окремий сервіс

```bash
# Розгорнути лише одну службу (після початкового azd up)
azd deploy api-gateway

# Або розгорнути службу продукту
azd deploy product-service
```
  
**Використання**: Коли ви оновили код одного сервісу і хочете розгорнути лише його.

### Оновити конфігурацію

```bash
# Змінити параметри масштабування
azd env set GATEWAY_MAX_REPLICAS 30

# Пере розгорнути з новою конфігурацією
azd up
```
  
## Конфігурація

### Налаштування масштабування

Обидва сервіси мають масштабування на основі HTTP у файлах Bicep:

**API Gateway**:  
- Мінімум реплік: 2 (завжди щонайменше 2 для доступності)  
- Максимум реплік: 20  
- Тригер масштабування: 50 одночасних запитів на репліку  

**Product Service**:  
- Мінімум реплік: 1 (може масштабуватися до нуля)  
- Максимум реплік: 10  
- Тригер масштабування: 100 одночасних запитів на репліку  

**Налаштування масштабування** (в `infra/app/*.bicep`):  
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
  
### Ресурси

**API Gateway**:  
- CPU: 1.0 vCPU  
- Пам’ять: 2 ГБ  
- Причина: обробляє весь зовнішній трафік  

**Product Service**:  
- CPU: 0.5 vCPU  
- Пам’ять: 1 ГБ  
- Причина: легкі операції в пам’яті  

### Перевірки здоров’я

Обидва сервіси мають лівнес і редінес проби:

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
  
**Що це означає**:  
- **Лівнес**: у разі провалу перевірки Container Apps перезапускає контейнер  
- **Редінес**: якщо сервіс не готовий, Container Apps припиняє направляти трафік до репліки  

## Моніторинг і спостереження

### Перегляд логів сервісу

```bash
# Перегляд журналів за допомогою azd monitor
azd monitor --logs

# Або використовуйте Azure CLI для конкретних контейнерних додатків:
# Потік журналів з API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Перегляд останніх журналів служби продукту
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```
  
**Очікуваний результат**:  
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```
  
### Запити Application Insights

Зайдіть в Application Insights в порталі Azure і виконайте такі запити:

**Пошук повільних запитів**:  
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```
  
**Відстеження викликів між сервісами**:  
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```
  
**Рівень помилок по сервісах**:  
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```
  
**Обсяг запитів у часі**:  
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```
  
### Доступ до панелі моніторингу

```bash
# Отримати деталі Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Відкрити моніторинг Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```
  
### Живі метрики

1. Відкрийте Application Insights у порталі Azure  
2. Натисніть "Live Metrics"  
3. Спостерігайте за запитами, помилками та продуктивністю в реальному часі  
4. Тестуйте, виконавши: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`  

## Практичні вправи

[Примітка: див. повний розділ "Практичні вправи" вище з детальними покроковими завданнями, включно з перевіркою розгортання, модифікацією даних, тестуванням автмасштабування, обробкою помилок і додаванням третього сервісу.]

## Аналіз вартості

### Оцінка щомісячних витрат (для цього прикладу з 2 сервісів)

| Ресурс          | Конфігурація                   | Орієнтовна вартість  |
|-----------------|-------------------------------|---------------------|
| API Gateway     | 2-20 реплік, 1 vCPU, 2GB RAM  | $30-150             |
| Product Service | 1-10 реплік, 0.5 vCPU, 1GB RAM| $15-75              |
| Container Registry | Базовий рівень               | $5                  |
| Application Insights | 1-2 ГБ/місяць              | $5-10               |
| Log Analytics   | 1 ГБ/місяць                   | $3                  |
| **Всього**      |                               | **$58-243/місяць**  |

**Розподіл вартості за навантаженням**:  
- **Низький трафік** (тестування/навчання): ~$60/місяць  
- **Помірний трафік** (малий продакшн): ~$120/місяць  
- **Високий трафік** (пікові періоди): ~$240/місяць  

### Поради з оптимізації витрат

1. **Масштабування до нуля для розробки**:  
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```
  
2. **Використовуйте план споживання для Cosmos DB** (коли додасте):  
   - Плачуйте лише за споживання  
   - Без мінімальної плати  

3. **Налаштуйте вибірковість у Application Insights**:  
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Вибірка 50% запитів
   ```
  
4. **Чистити ресурси, коли вони не потрібні**:  
   ```bash
   azd down
   ```
  
### Варіанти безкоштовного шару
Для навчання/тестування розгляньте:
- Використання безкоштовних кредитів Azure (перші 30 днів)
- Мінімальна кількість реплік
- Видалення після тестування (щоб уникнути постійних витрат)

---

## Очищення

Щоб уникнути постійних витрат, видаліть усі ресурси:

```bash
azd down --force --purge
```

**Підтвердження**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Введіть `y` для підтвердження.

**Що вилучається**:
- Container Apps Environment
- Обидва Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Перевірка очищення**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Потрібно повернути порожній результат.

---

## Керівництво з розширення: від 2 до 5+ сервісів

Після того, як ви освоїте цю архітектуру з 2 сервісів, ось як розширити:

### Фаза 1: Додати збереження даних у базу (наступний крок)

**Додати Cosmos DB для Product Service**:

1. Створіть `infra/core/cosmos.bicep`:
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

2. Оновіть product service для використання Cosmos DB замість даних у пам’яті

3. Оцінена додаткова вартість: близько $25/місяць (serverless)

### Фаза 2: Додати третій сервіс (керування замовленнями)

**Створити Order Service**:

1. Нова папка: `src/order-service/` (Python/Node.js/C#)
2. Новий Bicep: `infra/app/order-service.bicep`
3. Оновити API Gateway для маршрутизації `/api/orders`
4. Додати Azure SQL Database для збереження замовлень

**Архітектура стає такою**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Фаза 3: Додати асинхронну комунікацію (Service Bus)

**Реалізувати архітектуру з подіями**:

1. Додати Azure Service Bus: `infra/core/servicebus.bicep`
2. Product Service публікує події "ProductCreated"
3. Order Service підписується на події продукту
4. Додати Notification Service для обробки подій

**Патерн**: Запит/Відповідь (HTTP) + Подійна архітектура (Service Bus)

### Фаза 4: Додати аутентифікацію користувачів

**Реалізувати User Service**:

1. Створити `src/user-service/` (Go/Node.js)
2. Додати Azure AD B2C або кастомну JWT аутентифікацію
3. API Gateway перевіряє токени
4. Сервіси перевіряють права користувачів

### Фаза 5: Готовність до виробництва

**Додати ці компоненти**:
- Azure Front Door (глобальний балансувальник навантаження)
- Azure Key Vault (керування секретами)
- Azure Monitor Workbooks (кастомні панелі)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Керована ідентичність для всіх сервісів

**Повна вартість архітектури для продакшену**: близько $300-1,400/місяць

---

## Дізнайтеся більше

### Пов’язана документація
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Наступні кроки в цьому курсі
- ← Попередній: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - початковий приклад на одному контейнері
- → Наступний: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - додати AI можливості
- 🏠 [Домашня сторінка курсу](../../README.md)

### Порівняння: коли що використовувати

**Один Container App** (приклад Simple Flask API):
- ✅ Прості додатки
- ✅ Монолітна архітектура
- ✅ Швидко розгортається
- ❌ Обмежена масштабованість
- **Вартість**: близько $15-50/місяць

**Мікросервіси** (цей приклад):
- ✅ Складні додатки
- ✅ Незалежне масштабування для кожного сервісу
- ✅ Автономія команд (різні сервіси, різні команди)
- ❌ Більша складність управління
- **Вартість**: близько $60-250/місяць

**Kubernetes (AKS)**:
- ✅ Максимальний контроль і гнучкість
- ✅ Портативність між хмарами
- ✅ Розвинуті мережеві можливості
- ❌ Потребує знань Kubernetes
- **Вартість**: від $150-500/місяць мінімум

**Рекомендація**: Починайте з Container Apps (цей приклад), переходьте на AKS лише якщо потрібні специфічні функції Kubernetes.

---

## Часті питання

**Питання: Чому лише 2 сервіси, а не 5+?**  
Відповідь: Це навчальна прогресія. Освойте основи (взаємодія сервісів, моніторинг, масштабування) на простому прикладі перед тим, як додавати складність. Патерни, які ви тут вивчите, застосовні і для архітектур з 100 сервісами.

**Питання: Чи можу я додати більше сервісів самостійно?**  
Відповідь: Абсолютно! Слідуйте керівництву з розширення вище. Кожен новий сервіс йде за тією ж схемою: створити папку src, створити Bicep файл, оновити azure.yaml, розгорнути.

**Питання: Чи готовий це до продакшену?**  
Відповідь: Це міцна база. Для продакшену додайте: керовану ідентичність, Key Vault, постійні бази даних, CI/CD, моніторинг та оповіщення, стратегію резервного копіювання.

**Питання: Чому не використовувати Dapr або інший service mesh?**  
Відповідь: Для навчання тримайте все просто. Коли зрозумієте нативні мережеві можливості Container Apps, зможете додати Dapr для складніших сценаріїв.

**Питання: Як налагоджувати локально?**  
Відповідь: Запускайте сервіси локально через Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Питання: Чи можна використовувати різні мови програмування?**  
Відповідь: Так! У цьому прикладі Node.js (gateway) + Python (product service). Можна змішувати будь-які мови, які можуть працювати в контейнерах.

**Питання: Що якщо у мене немає кредитів Azure?**  
Відповідь: Використовуйте безкоштовний рівень Azure (перші 30 днів для нових акаунтів) або розгорніть для короткого тестування і одразу видаліть.

---

> **🎓 Резюме навчального шляху**: Ви навчилися розгортати мультисервісну архітектуру з автоматичним масштабуванням, внутрішньою мережею, централізованим моніторингом і патернами для продакшену. Ця база підготує вас до складних розподілених систем і архітектур підприємницьких мікросервісів.

**📚 Навігація курсом:**
- ← Попередній: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Наступний: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Домашня сторінка курсу](../../../README.md)
- 📖 [Кращі практики Container Apps](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, зверніть увагу, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або хибні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->