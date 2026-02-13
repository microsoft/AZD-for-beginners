# Простий Flask API - Приклад Container App

**Навчальний шлях:** Початковий ⭐ | **Час:** 25-35 хвилин | **Вартість:** $0-15/місяць

Повноцінний працездатний Python Flask REST API, розгорнутий в Azure Container Apps за допомогою Azure Developer CLI (azd). Цей приклад демонструє розгортання контейнера, авто-масштабування та основи моніторингу.

## 🎯 Чого Ви Навчитеся

- Розгортати контейнеризований Python додаток в Azure
- Налаштовувати авто-масштабування зі scale-to-zero
- Впроваджувати перевірки здоров’я і готовності
- Моніторити логи додатку та метрики
- Використовувати Azure Developer CLI для швидкого розгортання

## 📦 Що Входить

✅ **Додаток Flask** - Повний REST API з CRUD операціями (`src/app.py`)  
✅ **Dockerfile** - Готова до виробництва конфігурація контейнера  
✅ **Інфраструктура Bicep** - Середовище Container Apps та розгортання API  
✅ **Конфігурація AZD** - Налаштування розгортання однією командою  
✅ **Перевірки здоров'я** - Налаштовані перевірки живучості та готовності  
✅ **Авто-масштабування** - 0-10 реплік за навантаженням HTTP  

## Архітектура

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

## Вимоги

### Необхідні
- **Azure Developer CLI (azd)** - [Інструкції з встановлення](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Підписка Azure** - [Безкоштовний акаунт](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Встановіть Docker](https://www.docker.com/products/docker-desktop/) (для локального тестування)

### Перевірка вимог

```bash
# Перевірте версію azd (потрібна 1.5.0 або вище)
azd version

# Перевірте вхід в Azure
azd auth login

# Перевірте Docker (необов’язково, для локального тестування)
docker --version
```

## ⏱️ Час розгортання

| Етап | Тривалість | Що відбувається |
|-------|----------|--------------||
| Налаштування середовища | 30 секунд | Створення середовища azd |
| Збірка контейнера | 2-3 хвилини | Docker збірка Flask додатку |
| Розгортання інфраструктури | 3-5 хвилин | Створення Container Apps, реєстру, моніторингу |
| Розгортання додатку | 2-3 хвилини | Надсилання образу та розгортання в Container Apps |
| **Усього** | **8-12 хвилин** | Готове розгортання |

## Швидкий старт

```bash
# Перейдіть до прикладу
cd examples/container-app/simple-flask-api

# Ініціалізуйте середовище (виберіть унікальне ім'я)
azd env new myflaskapi

# Розгорніть усе (інфраструктура + додаток)
azd up
# Вам буде запропоновано:
# 1. Вибрати підписку Azure
# 2. Обрати розташування (наприклад, eastus2)
# 3. Почекайте 8-12 хвилин для розгортання

# Отримайте кінцеву точку API
azd env get-values

# Перевірте API
curl $(azd env get-value API_ENDPOINT)/health
```

**Очікуваний результат:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Перевірка розгортання

### Крок 1: Перевірте статус розгортання

```bash
# Переглянути розгорнуті сервіси
azd show

# Очікуваний вивід показує:
# - Сервіс: api
# - Кінцева точка: https://ca-api-[env].xxx.azurecontainerapps.io
# - Статус: Виконується
```

### Крок 2: Тестування API

```bash
# Отримати API кінцеву точку
API_URL=$(azd env get-value API_ENDPOINT)

# Перевірити стан здоров'я
curl $API_URL/health

# Тестувати кореневу кінцеву точку
curl $API_URL/

# Створити елемент
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Отримати всі елементи
curl $API_URL/api/items
```

**Критерії успіху:**
- ✅ Ендпойнт здоров’я повертає HTTP 200
- ✅ Кореневий ендпойнт показує інформацію API
- ✅ POST створює елемент і повертає HTTP 201
- ✅ GET повертає створені елементи

### Крок 3: Перегляд логів

```bash
# Транслюйте живі журнали за допомогою azd monitor
azd monitor --logs

# Або використовуйте Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Ви повинні побачити:
# - Повідомлення про запуск Gunicorn
# - Журнали HTTP-запитів
# - Журнали інформації про додаток
```

## Структура проекту

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

## API Ендпойнти

| Ендпойнт | Метод | Опис |
|----------|--------|-------------|
| `/health` | GET | Перевірка здоров’я |
| `/api/items` | GET | Вивести всі елементи |
| `/api/items` | POST | Створити новий елемент |
| `/api/items/{id}` | GET | Отримати конкретний елемент |
| `/api/items/{id}` | PUT | Оновити елемент |
| `/api/items/{id}` | DELETE | Видалити елемент |

## Конфігурація

### Змінні середовища

```bash
# Встановити користувацькі налаштування
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Конфігурація масштабування

API автоматично масштабується залежно від HTTP навантаження:
- **Мінімальна кількість реплік**: 0 (масштабується до нуля в простій)
- **Максимальна кількість реплік**: 10
- **Конкурентні запити на репліку**: 50

## Розробка

### Запуск локально

```bash
# Встановити залежності
cd src
pip install -r requirements.txt

# Запустити додаток
python app.py

# Тестувати локально
curl http://localhost:8000/health
```

### Збірка та тест контейнера

```bash
# Побудувати Docker-зображення
docker build -t flask-api:local ./src

# Запустити контейнер локально
docker run -p 8000:8000 flask-api:local

# Тестувати контейнер
curl http://localhost:8000/health
```

## Розгортання

### Повне розгортання

```bash
# Розгорнути інфраструктуру та застосунок
azd up
```

### Розгортання лише коду

```bash
# Розгортайте лише код програми (інфраструктура без змін)
azd deploy api
```

### Оновлення конфігурації

```bash
# Оновити змінні середовища
azd env set API_KEY "new-api-key"

# Перепублікувати з новою конфігурацією
azd deploy api
```

## Моніторинг

### Перегляд логів

```bash
# Потоковий перегляд логів у реальному часі за допомогою azd monitor
azd monitor --logs

# Або використовуйте Azure CLI для Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Переглянути останні 100 рядків
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Моніторинг метрик

```bash
# Відкрити панель моніторингу Azure
azd monitor --overview

# Переглянути конкретні метрики
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Тестування

### Перевірка здоров’я

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Очікувана відповідь:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Створення елемента

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Отримання всіх елементів

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Оптимізація витрат

Це розгортання використовує масштабування до нуля, тож ви платите лише, коли API обробляє запити:

- **Вартість у простої**: ~0$/місяць (масштабування до нуля)
- **Активна вартість**: ~0.000024$/секунда за репліку
- **Очікувана місячна вартість** (легке навантаження): $5-15

### Ще більше знизити витрати

```bash
# Зменшити максимальну кількість реплік для розробки
azd env set MAX_REPLICAS 3

# Використовувати коротший час простою
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 хвилин
```

## Усунення неполадок

### Контейнер не стартує

```bash
# Перевірте журнали контейнера за допомогою Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Перевірте збірки Docker-образів локально
docker build -t test ./src
```

### API недоступний

```bash
# Перевірте, чи інгрес зовнішній
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Високі часи відповіді

```bash
# Перевірте використання ЦП/пам'яті
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Масштабуйте ресурси в разі потреби
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Прибирання

```bash
# Видалити всі ресурси
azd down --force --purge
```

## Наступні кроки

### Розширення цього прикладу

1. **Додати базу даних** - інтеграція з Azure Cosmos DB або SQL Database  
   ```bash
   # Додати модуль Cosmos DB до infra/main.bicep
   # Оновити app.py з підключенням до бази даних
   ```

2. **Додати автентифікацію** - реалізація Azure AD або API ключів  
   ```python
   # Додайте проміжне програмне забезпечення автентифікації до app.py
   from functools import wraps
   ```

3. **Налаштувати CI/CD** - GitHub Actions workflow  
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Додати керовану ідентичність** - безпечний доступ до сервісів Azure  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Пов’язані приклади

- **[Database App](../../../../../examples/database-app)** - Повний приклад з SQL Database
- **[Microservices](../../../../../examples/container-app/microservices)** - Багатосервісна архітектура
- **[Container Apps Master Guide](../README.md)** - Всі патерни для контейнерів

### Навчальні ресурси

- 📚 [Курс AZD для початківців](../../../README.md) - Основний курс
- 📚 [Патерни Container Apps](../README.md) - Інші патерни розгортання
- 📚 [Галерея шаблонів AZD](https://azure.github.io/awesome-azd/) - Шаблони спільноти

## Додаткові ресурси

### Документація
- **[Документація Flask](https://flask.palletsprojects.com/)** - Посібник по Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Офіційна документація Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Довідник команд azd

### Посібники
- **[Швидкий старт Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Розгорніть перший додаток
- **[Python на Azure](https://learn.microsoft.com/azure/developer/python/)** - Керівництво з розробки на Python
- **[Мова Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Інфраструктура як код

### Інструменти
- **[Портал Azure](https://portal.azure.com)** - Візуальне управління ресурсами
- **[Розширення VS Code для Azure](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Інтеграція IDE

---

**🎉 Вітаємо!** Ви розгорнули готовий до виробництва Flask API в Azure Container Apps з авто-масштабуванням та моніторингом.

**Питання?** [Створіть issue](https://github.com/microsoft/AZD-for-beginners/issues) або перегляньте [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, зверніть увагу, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується звертатися до професійного людського перекладу. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникають унаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->