# Једноставан Flask API - Пример Container App

**Пут учења:** Почетник ⭐ | **Време:** 25-35 минута | **Цена:** $0-15/месец

Комплетан, функционалан Python Flask REST API распоређен на Azure Container Apps помоћу Azure Developer CLI (azd). Овај пример демонстрира распоређивање контејнера, аутоматско скалирање и основе надгледања.

## 🎯 Шта ћете научити

- Распоредити контейнеризовану Python апликацију на Azure
- Конфигурисати аутоматско скалирање са скалирањем до нуле
- Имплементирати провере здравља и провере спремности
- Надгледати логове и метрике апликације
- Користити Azure Developer CLI за брзо распоређивање

## 📦 Шта је укључено

✅ **Flask апликација** - Комплетан REST API са CRUD операцијама (`src/app.py`)  
✅ **Dockerfile** - Конфигурација контејнера спремна за продукцију  
✅ **Bicep инфраструктура** - Окружење Container Apps и распоређивање API-ја  
✅ **AZD конфигурација** - Подешавање за распоређивање једном командом  
✅ **Провере здравља** - Конфигурисане провере живости и спремности  
✅ **Аутоматско скалирање** - 0-10 реплика на основу HTTP оптерећења  

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

## Захтеви

### Потребно
- **Azure Developer CLI (azd)** - [Упутство за инсталацију](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure претплата** - [Бесплатан налог](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Инсталирајте Docker](https://www.docker.com/products/docker-desktop/) (за локално тестирање)

### Проверите захтеве

```bash
# Проверите верзију azd (потребна је 1.5.0 или новија)
azd version

# Проверите пријаву у Azure
azd auth login

# Проверите Докер (опционо, за локално тестирање)
docker --version
```

## ⏱️ Време распоређивања

| Phase | Duration | What Happens |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Total** | **8-12 minutes** | Complete deployment ready |

## Брзи почетак

```bash
# Идите до примера
cd examples/container-app/simple-flask-api

# Иницијализујте окружење (изаберите јединствено име)
azd env new myflaskapi

# Разместите све (инфраструктуру + апликацију)
azd up
# Бићете упитани да:
# 1. Изаберите Azure претплату
# 2. Изаберите локацију (нпр. eastus2)
# 3. Сачекајте 8-12 минута за распоређивање

# Добијте крајњу тачку вашег API-ја
azd env get-values

# Тестирајте API
curl $(azd env get-value API_ENDPOINT)/health
```

**Очекивани излаз:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Потврдите распоређивање

### Корак 1: Проверите статус распоређивања

```bash
# Погледајте распоређене услуге
azd show

# Очекивани излаз приказује:
# - Услуга: api
# - Ендпоинт: https://ca-api-[env].xxx.azurecontainerapps.io
# - Статус: Ради
```

### Корак 2: Тестирајте API крајње тачке

```bash
# Добиј API ендпоинт
API_URL=$(azd env get-value API_ENDPOINT)

# Провера здравља
curl $API_URL/health

# Провера коренског ендпоинта
curl $API_URL/

# Креирај ставку
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Добиј све ставке
curl $API_URL/api/items
```

**Критеријуми успеха:**
- ✅ /health крајња тачка враћа HTTP 200
- ✅ Коренска крајња тачка приказује информације о API-ју
- ✅ POST креира ставку и враћа HTTP 201
- ✅ GET враћа креиране ставке

### Корак 3: Погледајте логове

```bash
# Стримујте уживо логове помоћу azd monitor
azd monitor --logs

# Или користите Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Требало би да видите:
# - Поруке о покретању Gunicorn-а
# - Записи HTTP захтева
# - Информациони записи апликације
```

## Структура пројекта

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

## API крајње тачке

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | Провера здравља |
| `/api/items` | GET | Списак свих ставки |
| `/api/items` | POST | Креирање нове ставке |
| `/api/items/{id}` | GET | Добијање одређене ставке |
| `/api/items/{id}` | PUT | Ажурирање ставке |
| `/api/items/{id}` | DELETE | Брисање ставке |

## Конфигурација

### Променљиве окружења

```bash
# Подесите прилагођену конфигурацију
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Конфигурација скалирања

API се аутоматски скалира на основу HTTP саобраћаја:
- **Минималан број реплика**: 0 (скалира до нуле када је неактиван)
- **Максималан број реплика**: 10
- **Конкурентни захтеви по реплици**: 50

## Развој

### Покретање локално

```bash
# Инсталирајте зависности
cd src
pip install -r requirements.txt

# Покрените апликацију
python app.py

# Тестирајте локално
curl http://localhost:8000/health
```

### Изградња и тестирање контејнера

```bash
# Изгради Docker слику
docker build -t flask-api:local ./src

# Покрени контејнер локално
docker run -p 8000:8000 flask-api:local

# Тестирај контејнер
curl http://localhost:8000/health
```

## Распоређивање

### Потпуно распоређивање

```bash
# Разместити инфраструктуру и апликацију
azd up
```

### Распоређивање само кода

```bash
# Разместити само код апликације (инфраструктура остаје непромењена)
azd deploy api
```

### Ажурирање конфигурације

```bash
# Ажурирај променљиве окружења
azd env set API_KEY "new-api-key"

# Поново распореди са новом конфигурацијом
azd deploy api
```

## Надгледање

### Преглед логова

```bash
# Стримујте уживо логове користећи azd monitor
azd monitor --logs

# Или користите Azure CLI за Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Погледајте последњих 100 редова
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Надгледање метрика

```bash
# Отворите Azure Monitor контролну таблу
azd monitor --overview

# Прикажите одређене метрике
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Тестирање

### Провера здравља

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Очекивани одговор:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Креирање ставке

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Преузимање свих ставки

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Оптимизација трошкова

Ово распоређивање користи скалирање до нуле, па плаћате само када API обрађује захтеве:

- **Неактивни трошак**: ~ $0/месец (скалира до нуле)
- **Активни трошак**: ~ $0.000024/секунду по реплици
- **Очекивани месечни трошак** (при лаганом коришћењу): $5-15

### Како да даље смањите трошкове

```bash
# Смањити максималан број реплика за развојно окружење
azd env set MAX_REPLICAS 3

# Користити краћи тајмаут неактивности
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 минута
```

## Решавање проблема

### Контејнер се неће покренути

```bash
# Провери логове контејнера помоћу Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Провери да ли се Docker слика гради локално
docker build -t test ./src
```

### API недоступан

```bash
# Проверите да је ингрес спољашњи
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Високо време одговора

```bash
# Проверите коришћење ЦПУ и меморије
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Повећајте ресурсе ако је потребно
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Чишћење

```bash
# Избриши све ресурсе
azd down --force --purge
```

## Следећи кораци

### Проширите овај пример

1. **Додајте базу података** - Интегришите Azure Cosmos DB или SQL базу података
   ```bash
   # Додај модул Cosmos DB у infra/main.bicep
   # Ажурирај app.py да укључи повезивање са базом података
   ```

2. **Додајте аутентификацију** - Имплементирајте Azure AD или API кључеве
   ```python
   # Додајте међуслој за аутентификацију у app.py
   from functools import wraps
   ```

3. **Подесите CI/CD** - радни ток GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Додајте управљани идентитет** - Осигурајте приступ Azure сервисима
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Повезани примери

- **[Апликација са базом података](../../../../../examples/database-app)** - Потпуни пример са SQL базом података
- **[Микросервиси](../../../../../examples/container-app/microservices)** - Архитектура са више сервиса
- **[Главни водич за Container Apps](../README.md)** - Сви обрасци за контейнере

### Ресурси за учење

- 📚 [Курс AZD за почетнике](../../../README.md) - Главна страница курса
- 📚 [Обрасци Container Apps](../README.md) - Више шаблона за распоређивање
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Шаблони заједнице

## Додатни ресурси

### Документација
- **[Документација за Flask](https://flask.palletsprojects.com/)** - Водич за Flask фрејмворк
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Службена Azure документација
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Референца за azd команде

### Туторијали
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Распоредите вашу прву апликацију
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Водич за развој у Python-у
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Инфраструктура као код

### Алатке
- **[Azure Portal](https://portal.azure.com)** - Управљајте ресурсима визуелно
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Интеграција са IDE-ом

---

**🎉 Честитамо!** Распоредили сте Flask API спреман за продукцију на Azure Container Apps са аутоматским скалирањем и надгледањем.

**Питања?** [Пријавите проблем](https://github.com/microsoft/AZD-for-beginners/issues) или погледајте [ЧПП](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Изјава о одрицању одговорности:
Овај документ је преведен помоћу услуге за превођење помоћу вештачке интелигенције Co-op Translator (https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати званичним извором. За критичне информације препоручује се ангажовање професионалног преводиоца. Не сносимо одговорност за било каква неспоразумевања или погрешна тумачења која произилазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->