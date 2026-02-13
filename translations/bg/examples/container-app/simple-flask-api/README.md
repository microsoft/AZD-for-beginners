# Simple Flask API - Пример за Container App

**Учебна пътека:** Начинаещ ⭐ | **Време:** 25-35 минути | **Цена:** $0-15/month

Пълен, работещ Python Flask REST API, разположен в Azure Container Apps с помощта на Azure Developer CLI (azd). Този пример демонстрира разполагане на контейнер, автоматично мащабиране и основи на мониторинга.

## 🎯 Какво ще научите

- Разполагане на контейнеризирано Python приложение в Azure
- Конфигуриране на автоматично мащабиране със скалиране до нула
- Имплементиране на проверки за живост и готовност
- Наблюдение на логове и метрики на приложението
- Използване на Azure Developer CLI за бързо разполагане

## 📦 Какво е включено

✅ **Flask приложение** - Пълен REST API с CRUD операции (`src/app.py`)  
✅ **Dockerfile** - Конфигурация на контейнер, готова за продукция  
✅ **Bicep инфраструктура** - Среда за Container Apps и разполагане на API  
✅ **AZD конфигурация** - Настройка за разполагане с една команда  
✅ **Проверки на здравето** - Конфигурирани проверки за живост и готовност  
✅ **Автоматично мащабиране** - 0-10 реплики в зависимост от HTTP натоварването  

## Архитектура

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## Изисквания

### Необходими
- **Azure Developer CLI (azd)** - [Ръководство за инсталиране](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Абонамент за Azure** - [Безплатен акаунт](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Install Docker](https://www.docker.com/products/docker-desktop/) (за локално тестване)

### Проверка на изискванията

```bash
# Проверете версията на azd (трябва да е 1.5.0 или по-нова)
azd version

# Проверете влизането в Azure
azd auth login

# Проверете Docker (по избор, за локално тестване)
docker --version
```

## ⏱️ Времева линия за разполагане

| Етап | Продължителност | Какво се случва |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Общо** | **8-12 минути** | Готово пълно разполагане |

## Бърз старт

```bash
# Навигирайте до примера
cd examples/container-app/simple-flask-api

# Инициализирайте средата (изберете уникално име)
azd env new myflaskapi

# Разгърнете всичко (инфраструктура + приложение)
azd up
# Ще бъдете подканени да:
# 1. Изберете абонамент за Azure
# 2. Изберете местоположение (напр., eastus2)
# 3. Изчакайте 8–12 минути за разгръщането

# Получете своя API крайна точка
azd env get-values

# Тествайте API-то
curl $(azd env get-value API_ENDPOINT)/health
```

**Очакван резултат:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Потвърдете разполагането

### Стъпка 1: Проверете състоянието на разполагането

```bash
# Преглед на разположените услуги
azd show

# Очакваният изход показва:
# - Услуга: api
# - Крайна точка: https://ca-api-[env].xxx.azurecontainerapps.io
# - Статус: Работи
```

### Стъпка 2: Тествайте API крайните точки

```bash
# Получаване на API крайна точка
API_URL=$(azd env get-value API_ENDPOINT)

# Проверка на здравето
curl $API_URL/health

# Проверка на коренната крайна точка
curl $API_URL/

# Създаване на елемент
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Получаване на всички елементи
curl $API_URL/api/items
```

**Критерии за успех:**
- ✅ Health endpoint връща HTTP 200
- ✅ Root endpoint показва информация за API
- ✅ POST създава елемент и връща HTTP 201
- ✅ GET връща създадените елементи

### Стъпка 3: Преглед на логовете

```bash
# Проследявайте логовете в реално време с azd monitor
azd monitor --logs

# Или използвайте Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Трябва да видите:
# - Съобщения при стартиране на Gunicorn
# - Логове на HTTP заявки
# - Информационни логове на приложението
```

## Структура на проекта

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## API крайни точки

| Крайна точка | Метод | Описание |
|----------|--------|-------------|
| `/health` | GET | Проверка на здравето |
| `/api/items` | GET | Списък с всички елементи |
| `/api/items` | POST | Създаване на нов елемент |
| `/api/items/{id}` | GET | Вземане на конкретен елемент |
| `/api/items/{id}` | PUT | Актуализиране на елемент |
| `/api/items/{id}` | DELETE | Изтриване на елемент |

## Конфигурация

### Променливи на средата

```bash
# Задайте персонализирана конфигурация
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Конфигурация на мащабирането

API-то автоматично се мащабира въз основа на HTTP трафика:
- **Мин. реплики**: 0 (намалява до нула при бездействие)
- **Макс. реплики**: 10
- **Паралелни заявки на реплика**: 50

## Разработка

### Стартиране локално

```bash
# Инсталиране на зависимости
cd src
pip install -r requirements.txt

# Стартиране на приложението
python app.py

# Локално тестване
curl http://localhost:8000/health
```

### Изграждане и тестване на контейнера

```bash
# Създаване на Docker изображение
docker build -t flask-api:local ./src

# Стартиране на контейнер локално
docker run -p 8000:8000 flask-api:local

# Тестване на контейнера
curl http://localhost:8000/health
```

## Разполагане

### Пълно разполагане

```bash
# Разгръщане на инфраструктурата и приложението
azd up
```

### Разполагане само на кода

```bash
# Разгръщайте само кода на приложението (инфраструктурата остава непроменена)
azd deploy api
```

### Актуализиране на конфигурацията

```bash
# Актуализиране на променливите на средата
azd env set API_KEY "new-api-key"

# Повторно внедряване с новата конфигурация
azd deploy api
```

## Мониторинг

### Преглед на логовете

```bash
# Предавайте живи логове с azd monitor
azd monitor --logs

# Или използвайте Azure CLI за Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Вижте последните 100 реда
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Наблюдение на метриките

```bash
# Отвори таблото за управление на Azure Monitor
azd monitor --overview

# Прегледай конкретни показатели
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Тестване

### Проверка на здравето

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Очакван отговор:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Създаване на елемент

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Получаване на всички елементи

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Оптимизиране на разходи

Това разполагане използва мащабиране до нула, така че плащате само когато API-то обработва заявки:

- **Разходи при бездействие**: ~$0/месец (мащабирано до нула)
- **Активни разходи**: ~$0.000024/секунда на реплика
- **Очаквани месечни разходи** (леко използване): $5-15

### Допълнително намаляване на разходите

```bash
# Намалете максималния брой реплики за среда за разработка
azd env set MAX_REPLICAS 3

# Използвайте по-кратък таймаут за неактивност
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 минути
```

## Отстраняване на проблеми

### Контейнерът не стартира

```bash
# Проверете логовете на контейнера чрез Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Проверете дали Docker изображението се изгражда локално
docker build -t test ./src
```

### API недостъпен

```bash
# Проверете дали ingress е външен
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Високи времена за отговор

```bash
# Проверете използването на процесора/паметта
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Увеличете ресурсите, ако е необходимо
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Почистване

```bash
# Изтрийте всички ресурси
azd down --force --purge
```

## Следващи стъпки

### Разширяване на този пример

1. **Добавете база данни** - Интегрирайте Azure Cosmos DB или SQL Database
   ```bash
   # Добавете модул Cosmos DB към infra/main.bicep
   # Актуализирайте app.py с връзка към базата данни
   ```

2. **Добавете удостоверяване** - Имплементирайте Azure AD или API ключове
   ```python
   # Добавете междинен софтуер за удостоверяване в app.py
   from functools import wraps
   ```

3. **Настройте CI/CD** - GitHub Actions workflow
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Добавете управлявана идентичност** - Осигурете достъп до Azure услуги
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Свързани примери

- **[Приложение с база данни](../../../../../examples/database-app)** - Пълен пример с SQL база данни
- **[Микросървиси](../../../../../examples/container-app/microservices)** - Микросървисна архитектура
- **[Ръководство за Container Apps](../README.md)** - Всички шаблони за контейнери

### Ресурси за обучение

- 📚 [Курс за AZD за начинаещи](../../../README.md) - Главна страница на курса
- 📚 [Шаблони за Container Apps](../README.md) - Още шаблони за разполагане
- 📚 [Галерия с AZD шаблони](https://azure.github.io/awesome-azd/) - Общностни шаблони

## Допълнителни ресурси

### Документация
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Ръководство за Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Официална документация на Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Справочник за командите azd

### Уроци
- **[Бърз старт за Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Разположете първото си приложение
- **[Python в Azure](https://learn.microsoft.com/azure/developer/python/)** - Ръководство за разработка на Python
- **[Езикът Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Инфраструктура като код

### Инструменти
- **[Azure Portal](https://portal.azure.com)** - Управлявайте ресурсите визуално
- **[Разширение Azure за VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Интеграция с IDE

---

**🎉 Поздравления!** Вие разположихте production-ready Flask API в Azure Container Apps с автоматично мащабиране и мониторинг.

**Въпроси?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) или проверете [Често задавани въпроси](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Отказ от отговорност:
Този документ е преведен с помощта на AI-преводаческата услуга Co‑op Translator (https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на първоначалния език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален превод, извършен от квалифициран преводач. Не носим отговорност за каквито и да е недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->