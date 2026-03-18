# Примери - Практични AZD шаблони и конфигурације

**Учите кроз примере - Организовано по поглављима**
- **📚 Почетна страница курса**: [AZD за почетнике](../README.md)
- **📖 Мапирање поглавља**: Примери организовани по сложености учења
- **🚀 Локални пример**: [Решење за малопродају са више агената](retail-scenario.md)
- **🤖 Спољни AI примери**: Везе ка Azure Samples репозиторијумима

> **📍 ВАЖНО: Локални у односу на спољне примере**  
> Овај репозиторијум садржи **4 потпуна локална примера** са потпуним имплементацијама:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 постављање са чат интерфејсом)  
> - **Container Apps** (једноставан Flask API + микросервиси)  
> - **Database App** (веб + SQL база података)  
> - **Retail Multi-Agent** (ентерпрајз AI решење)  
>  
> Додатни примери су **спољне референце** на Azure-Samples репозиторијуме које можете клоновати.

## Увод

Овај директоријум пружа практичне примере и референце које ће вам помоћи да научите Azure Developer CLI кроз практичан рад. Сценарио Retail Multi-Agent је потпуна, продукционо-спремна имплементација укључена у овај репозиторијум. Додатни примери упућују на званичне Azure Samples који демонстрирају различите AZD обрасце.

### Легенда о оцени сложености

- ⭐ **Почетник** - Основни концепти, једна услуга, 15-30 минута
- ⭐⭐ **Средњи ниво** - Више услуга, интеграција базе података, 30-60 минута
- ⭐⭐⭐ **Напредни** - Комплексна архитектура, интеграција AI, 1-2 сата
- ⭐⭐⭐⭐ **Експерт** - Спремно за продукцију, обрасци за предузећа, 2+ сата

## 🎯 Шта се заправо налази у овом репозиторијуму

### ✅ Локална имплементација (спремна за употребу)

#### [Апликација за ћаскање Microsoft Foundry Models](azure-openai-chat/README.md) 🆕
**Потпуно gpt-4.1 постављање са чат интерфејсом укључено у овај репозиторијум**

- **Локација:** `examples/azure-openai-chat/`
- **Сложеност:** ⭐⭐ (Средњи ниво)
- **Шта је укључено:**
  - Потпуно Microsoft Foundry Models постављање (gpt-4.1)
  - Python интерфејс за ћаскање у командној линији
  - Интеграција Key Vault-а за безбедне API кључеве
  - Bicep шаблони инфраструктуре
  - Праћење коришћења токена и трошкова
  - Ограничење брзине и руковање грешкама

**Брз почетак:**
```bash
# Пређите на пример
cd examples/azure-openai-chat

# Размештите све
azd up

# Инсталирајте зависности и почните да ћаскате
pip install -r src/requirements.txt
python src/chat.py
```

**Технологије:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Примери за Container App](container-app/README.md) 🆕
**Свеобухватни примери постављања контејнера укључени у овај репозиторијум**

- **Локација:** `examples/container-app/`
- **Сложеност:** ⭐-⭐⭐⭐⭐ (Од почетника до напредног)
- **Шта је укључено:**
  - [Главни водич](container-app/README.md) - Потпуни преглед постављања контејнера
  - [Једноставан Flask API](../../../examples/container-app/simple-flask-api) - Основни REST API пример
  - [Архитектура микросервиса](../../../examples/container-app/microservices) - Производно спремно вишесервисно постављање
  - Брз почетак, сценарији за продукцију и напредни обрасци
  - Надгледање, безбедност и оптимизација трошкова

**Брз почетак:**
```bash
# Погледајте главни водич
cd examples/container-app

# Поставите једноставан Flask API
cd simple-flask-api
azd up

# Поставите пример микросервиса
cd ../microservices
azd up
```

**Технологије:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Решење за малопродају са више агената](retail-scenario.md) 🆕
**Потпуно, продукционо-спремно решење укључено у овај репозиторијум**

- **Локација:** `examples/retail-multiagent-arm-template/`
- **Сложеност:** ⭐⭐⭐⭐ (Напредни)
- **Шта је укључено:**
  - Потпуни ARM шаблон за распоређивање
  - Мулти-агентна архитектура (Корисник + Инвентар)
  - Интеграција Microsoft Foundry Models
  - AI претрага са RAG
  - Свеобухватно надгледање
  - Скрипта за распоређивање једним кликом

**Брз почетак:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Технологије:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Спољни Azure примерци (клонирајте да бисте користили)

Следећи примери се одржавају у званичним Azure-Samples репозиторијумима. Клонирајте их да бисте истражили различите AZD обрасце:

### Једноставне апликације (Поглавља 1-2)

| Шаблон | Репозиторијум | Сложеност | Услуге |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Локално: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Локално: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Вишесервисно, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Како користити:**
```bash
# Клонирај било који пример
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Размешти
azd up
```

### AI примери апликација (Поглавља 2, 5, 8)

| Шаблон | Репозиторијум | Сложеност | Фокус |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Локално: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 постављање |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Основни AI ћаскање |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Фрејмворк агената |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG образац |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Ентерпрајз AI |

### Базе података и напредни обрасци (Поглавља 3-8)

| Шаблон | Репозиторијум | Сложеност | Фокус |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Интеграција базе података |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL серверлес |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Вишесервисно |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Циљеви учења

Радом на овим примерима, научићете:
- Вежбати радне токове Azure Developer CLI са реалистичним сценаријима апликација
- Разумети различите архитектуре апликација и њихове azd имплементације
- Освојити обрасце Infrastructure as Code за различите Azure услуге
- Применити управљање конфигурацијом и стратегије распоређивања специфичне за окружење
- Имплементирати обрасце надгледања, безбедности и скалирања у практичним контекстима
- Стекнути искуство у решавању проблема и дебаговању реалних сценарија распоређивања

## Резултати учења

Након завршетка ових примера, моћи ћете да:
- Распоређујете различите типове апликација користећи Azure Developer CLI са самопоуздањем
- Прилагодите обезбеђене шаблоне захтевима своје апликације
- Дизајнирате и имплементирате прилагођене инфраструктурне обрасце користећи Bicep
- Конфигуришете сложене вишесервисне апликације са правилним зависностима
- Примените најбоље праксе за безбедност, надгледање и перформансе у реалним сценаријама
- Решавате проблеме и оптимизујете распоређивања на основу практичног искуства

## Структура директоријума

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Брзи примери за почетак

> **💡 Нисте упознати са AZD?** Почните са примером бр. 1 (Flask API) - траје ~20 минута и учи основне концепте.

### За почетнике
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Локално) ⭐  
   Распоредити једноставан REST API са скалирањем до нуле  
   **Време:** 20-25 минута | **Трошак:** $0-5/месечно  
   **Шта ћете научити:** Основни azd радни ток, контеинеризација, health probes  
   **Очекивани резултат:** Ради API крајња тачка која враћа "Hello, World!" са надгледањем

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Распоредити Node.js Express веб апликацију са MongoDB  
   **Време:** 25-35 минута | **Трошак:** $10-30/месечно  
   **Шта ћете научити:** Интеграција базе података, променљиве окружења, конекциони стрингови  
   **Очекивани резултат:** Тодо апликација са CRUD функционалношћу

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Хостовати React статички веб са Azure Static Web Apps  
   **Време:** 20-30 минута | **Трошак:** $0-10/месечно  
   **Шта ћете научити:** Статичко хостовање, serverless функције, CDN распоређивање  
   **Очекивани резултат:** React UI са API беком, аутоматски SSL, глобални CDN

### За кориснике средњег нивоа
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Локално) ⭐⭐  
   Распоредити gpt-4.1 са чат интерфејсом и безбедним управљањем API кључевима  
   **Време:** 35-45 минута | **Трошак:** $50-200/месечно  
   **Шта ћете научити:** Постављање Microsoft Foundry Models, интеграција Key Vault-а, праћење токена  
   **Очекивани резултат:** Ради ћаскања апликација са gpt-4.1 и праћењем трошкова

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Локално) ⭐⭐⭐⭐  
   Производно-спремна вишесервисна архитектура  
   **Време:** 45-60 минута | **Трошак:** $50-150/месечно  
   **Шта ћете научити:** Комуникација између сервиса, редовање порука, дистрибуирано трасирање  
   **Очекивани резултат:** Систем од 2 сервиса (API Gateway + Product Service) са надгледањем

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Веб апликација са C# API-јем и Azure SQL базом података  
   **Време:** 30-45 минута | **Трошак:** $20-80/месечно  
   **Шта ћете научити:** Entity Framework, миграције базе, сигурност конекција  
   **Очекивани резултат:** C# API са Azure SQL бекендом, аутоматско примењивање шеме

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions са HTTP тригерима и Cosmos DB  
   **Време:** 30-40 минута | **Трошак:** $10-40/месечно  
   **Шта ћете научити:** Догађајно вођена архитектура, серверлес скалирање, NoSQL интеграција  
   **Очекивани резултат:** Function апликација која одговара на HTTP захтеве и чува податке у Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Вишесервисна Java апликација са Container Apps и API gateway-ем  
   **Време:** 60-90 минута | **Трошак:** $80-200/месечно  
   **Шта ћете научити:** Деплој Spring Boot апликација, service mesh, баланс оптерећења  
   **Очекивани резултат:** Вишесервисни Java систем са сервис-дискавери и рутирањем

### Microsoft Foundry шаблони

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Потпуно gpt-4.1 постављање са чат интерфејсом  
   **Време:** 35-45 минута | **Трошак:** $50-200/месечно  
   **Очекивани резултат:** Ради ћаскања апликација са праћењем токена и трошкова

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Интелигентна ћаскања апликација са RAG архитектуром  
   **Време:** 60-90 минута | **Трошак:** $100-300/месечно  
   **Очекивани резултат:** RAG-подржани интерфејс за ћаскање са претрагом докумената и цитатима

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Анализа докумената коришћењем Azure AI услуга  
   **Време:** 40-60 минута | **Трошак:** $20-80/месечно  
   **Очекивани резултат:** API који извлачи текст, табеле и ентитете из отпремљених докумената

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps радни ток са Azure Machine Learning  
   **Време:** 2-3 сата | **Трошак:** $150-500/месечно  
   **Очекивани резултат:** Аутоматизован ML пайплајн са тренингом, деплојем и надгледањем

### Сценарији из стварног света

#### **Решење за малопродају са више агената** 🆕  
**[Комплетан водич за имплементацију](./retail-scenario.md)**

Свеобухватно, продукционо-спремно решење за подршку корисницима са више агената које демонстрира ентерпрајз ниво распоређивања AI апликација уз AZD. Овај сценарио пружа:
- **Комплетна архитектура**: Вишеагентски систем са специјализованим агентима за корисничку подршку и управљање залихама
- **Инфраструктура за продукцију**: Распоређивања Microsoft Foundry Models у више региона, AI Search, Container Apps и свеобухватно праћење
- **Шаблон ARM спреман за распоређивање**: Распоређивање једним кликом са више режима конфигурације (Минимални/Стандардни/Премиум)
- **Напредне функције**: Валидација безбедности методом red teaming, оквир за евалуацију агената, оптимизација трошкова и водичи за решавање проблема
- **Реалан пословни контекст**: Случај употребе корисничке подршке трговца са отпремањем фајлова, интеграцијом претраге и динамичким скалирањем

**Технологије**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Сложеност**: ⭐⭐⭐⭐ (Напредно - Спремно за производњу у предузећу)

**Идеално за**: AI програмере, архитекте решења и тимове који граде продукцијске вишеагентске системе

**Брзи почетак**: Распоредите цело решење за мање од 30 минута користећи приложени ARM шаблон са `./deploy.sh -g myResourceGroup`

## 📋 Упутство за коришћење

### Преуслови

Пре покретања било ког примера:
- ✅ Azure претплата са приступом Owner или Contributor
- ✅ Инсталиран Azure Developer CLI ([Водич за инсталацију](../docs/chapter-01-foundation/installation.md))
- ✅ Покренут Docker Desktop (за примере са контејнерима)
- ✅ Одговарајуће Azure квоте (проверите захтеве специфичне за пример)

> **💰 Упозорење о трошковима:** Сви примери креирају стварне Azure ресурсе који генеришу трошкове. Погледајте појединачне README датотеке за процене трошкова. Након завршетка покрените `azd down` да бисте избегли даљње трошкове.

### Покретање примера локално

1. **Клонирајте или копирајте пример**
   ```bash
   # Навигирајте до жељеног примера
   cd examples/simple-web-app
   ```

2. **Иницијализујте AZD окружење**
   ```bash
   # Иницијализујте помоћу постојећег шаблона
   azd init
   
   # Или креирајте ново окружење
   azd env new my-environment
   ```

3. **Конфигуришите окружење**
   ```bash
   # Подесите потребне променљиве
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Распоредите**
   ```bash
   # Разместити инфраструктуру и апликацију
   azd up
   ```

5. **Верификујте распоређивање**
   ```bash
   # Добијте крајње тачке сервиса
   azd env get-values
   
   # Тестирајте крајњу тачку (пример)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Очекујeни индикатори успеха:**
   - ✅ `azd up` се извршава без грешака
   - ✅ Ендпоинт сервиса враћа HTTP 200
   - ✅ Azure портал показује статус "Running"
   - ✅ Application Insights прима телеметрију

> **⚠️ Проблеми?** Погледајте [Уобичајени проблеми](../docs/chapter-07-troubleshooting/common-issues.md) за решавање проблема приликом распоређивања

### Прилагођавање примера

Сваки пример укључује:
- **README.md** - Детаљна упутства за подешавање и прилагођавање
- **azure.yaml** - AZD конфигурација са коментарима
- **infra/** - Bicep шаблони са објашњењима параметара
- **src/** - Примери кода апликације
- **scripts/** - Помоћне скрипте за уобичајене задатке

## 🎯 Циљеви учења

### Категорије примера

#### **Основна распоређивања**
- Једносервисне апликације
- Једноставни инфраструктурни обрасци
- Основно управљање конфигурацијом
- Економична развојна окружења

#### **Напредни сценарији**
- Вишесервисне архитектуре
- Комплексне мрежне конфигурације
- Обрасци интеграције базе података
- Имплементације безбедности и усаглашености

#### **Обрасци спремни за продукцију**
- Конфигурације високе доступности
- Мониторинг и опсервабилност
- Интеграција CI/CD
- Решења за опоравак од катастрофа

## 📖 Опис примера

### Једноставна веб апликација - Node.js Express
**Технологије**: Node.js, Express, MongoDB, Container Apps  
**Сложеност**: Почетник  
**Концепти**: Основно распоређивање, REST API, интеграција NoSQL базе података

### Статички сајт - React SPA
**Технологије**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Сложеност**: Почетник  
**Концепти**: Статичко хостовање, безсерверски бекенд, модеран веб развој

### Контенер апликација - Python Flask
**Технологије**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Сложеност**: Почетник  
**Концепти**: Контейнеризација, REST API, scale-to-zero, health probes, мониторинг  
**Локација**: [Локални пример](../../../examples/container-app/simple-flask-api)

### Контенер апликација - Микросервисна архитектура
**Технологије**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Сложеност**: Напредно  
**Концепти**: Вишесервисна архитектура, комуникација сервиса, message queuing, дистрибуирано праћење  
**Локација**: [Локални пример](../../../examples/container-app/microservices)

### Апликација са базом података - C# са Azure SQL
**Технологије**: C# ASP.NET Core, Azure SQL Database, App Service  
**Сложеност**: Средњи  
**Концепти**: Entity Framework, везе ка бази података, развој веб API-ја

### Безсерверска функција - Python Azure Functions
**Технологије**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Сложеност**: Средњи  
**Концепти**: Догађајно-вођена архитектура, безсерверско рачунарство, full-stack развој

### Микросервиси - Java Spring Boot
**Технологије**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Сложеност**: Средњи  
**Концепти**: Комуникација микросервиса, дистрибуирани системи, ентерпрајз патерни

### Microsoft Foundry примери

#### Чат апликација Microsoft Foundry Models
**Технологије**: Microsoft Foundry Models, Cognitive Search, App Service  
**Сложеност**: Средњи  
**Концепти**: RAG архитектура, векторско претраживање, интеграција LLM

#### AI обрада докумената
**Технологије**: Azure AI Document Intelligence, Storage, Functions  
**Сложеност**: Средњи  
**Концепти**: Анализа докумената, OCR, екстракција података

#### Паметни ML пипелайн
**Технологије**: Azure ML, MLOps, Container Registry  
**Сложеност**: Напредно  
**Концепти**: Тренирање модела, pipeline-ови за распоређивање, мониторинг

## 🛠 Примери конфигурација

Директоријум `configurations/` садржи поново употребљиве компоненте:

### Конфигурације окружења
- Подешавања развојног окружења
- Конфигурације за staging окружење
- Конфигурације спремне за продукцију
- Подешавања за распореде у више региона

### Bicep модули
- Поновно употребљиве инфраструктурне компоненте
- Општи обрасци ресурса
- Шаблони ојачани за безбедност
- Конфигурације оптимизоване за трошкове

### Помоћне скрипте
- Аутоматизација подешавања окружења
- Скрипте за миграцију базе података
- Алати за валидацију распоређивања
- Алатке за праћење трошкова

## 🔧 Водич за прилагођавање

### Прилагођавање примера вашем случају употребе

1. **Прегледајте предуслове**
   - Проверите захтеве Azure сервиса
   - Потврдите лимите претплате
   - Разумите последице на трошкове

2. **Измените конфигурацију**
   - Ажурирајте дефиниције сервиса у `azure.yaml`
   - Прилагодите Bicep шаблоне
   - Подесите променљиве окружења

3. **Тестирајте темељно**
   - Прво распоредите у развојно окружење
   - Потврдите функционалност
   - Тестирајте скалирање и перформансе

4. **Преглед безбедности**
   - Прегледајте контроле приступа
   - Имплементирајте управљање тајнама
   - Омогућите мониторинг и алармирање

## 📊 Матрица поређења

| Пример | Услуге | База података | Аутентикација | Мониторинг | Сложеност |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Чат** (Локално) | 2 | ❌ | Key Vault | Пуно | ⭐⭐ |
| **Python Flask API** (Локално) | 1 | ❌ | Основно | Пуно | ⭐ |
| **Микросервиси** (Локално) | 5+ | ✅ | Предузеће | Напредно | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Основно | Основно | ⭐ |
| React SPA + Functions | 3 | ✅ | Основно | Пуно | ⭐ |
| Python Flask Container | 2 | ❌ | Основно | Пуно | ⭐ |
| C# Web API + SQL | 2 | ✅ | Пуно | Пуно | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Пуно | Пуно | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Пуно | Пуно | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Пуно | Пуно | ⭐⭐⭐ |
| AI обрада докумената | 2 | ❌ | Основно | Пуно | ⭐⭐ |
| ML пипелайн | 4+ | ✅ | Пуно | Пуно | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Локално) | **8+** | **✅** | **Предузеће** | **Напредно** | **⭐⭐⭐⭐** |

## 🎓 Пут учења

### Препоручени напредак

1. **Почните са једноставном веб апликацијом**
   - Научите основне AZD концепте
   - Разумите ток распоређивања
   - Вежбајте управљање окружењем

2. **Пробајте статички сајт**
   - Истражите различите опције хостинга
   - Научите о интеграцији CDN-а
   - Разумите DNS конфигурацију

3. **Пређите на контейнер апликацију**
   - Научите основе контејнеризације
   - Разумите концепте скалирања
   - Вежбајте са Docker-ом

4. **Додајте интеграцију базе података**
   - Научите провизионисање база података
   - Разумите connection string-ове
   - Вежбајте управљање тајнама

5. **Истражите безсерверско**
   - Разумите догађајно-вођену архитектуру
   - Научите о тригерима и везивањима
   - Вежбајте са API-јима

6. **Направите микросервисе**
   - Научите комуникацију сервиса
   - Разумите дистрибуиране системе
   - Вежбајте сложена распоређивања

## 🔍 Проналажење правог примера

### Према технолошком стеку
- **Container Apps**: [Python Flask API (Локално)](../../../examples/container-app/simple-flask-api), [Микросервиси (Локално)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Локално)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Локално)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Локално)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Локално)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Локално)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Локално)](../../../examples/container-app/simple-flask-api), [Микросервиси (Локално)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Микросервиси (Локално)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Локално)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI обрада докумената, ML пипелайн, **Retail Multi-Agent решење**
- **Multi-Agent Systems**: **Retail Multi-Agent решење**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Локално)](../../../examples/azure-openai-chat)**, Retail Multi-Agent решење
- **Enterprise Production**: [Микросервиси (Локално)](../../../examples/container-app/microservices), **Retail Multi-Agent решење**

### Према архитектонском шаблону
- **Simple REST API**: [Python Flask API (Локално)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Локално)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Локално)](../../../examples/container-app/simple-flask-api), [Микросервиси (Локално)](../../../examples/container-app/microservices), Java Microservices
- **AI-Powered**: **[Microsoft Foundry Models Chat (Локално)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI обрада докумената, ML пипелайн, **Retail Multi-Agent решење**
- **Multi-Agent Architecture**: **Retail Multi-Agent решење**
- **Enterprise Multi-Service**: [Микросервиси (Локално)](../../../examples/container-app/microservices), **Retail Multi-Agent решење**

### Према нивоу сложености
- **Почетник**: [Python Flask API (Локално)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Средњи**: **[Microsoft Foundry Models Chat (Локално)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI обрада докумената
- **Напредно**: ML пипелайн
- **Спремно за производњу у предузећу**: [Микросервиси (Локално)](../../../examples/container-app/microservices) (Вишесервисно са message queuing), **Retail Multi-Agent решење** (Комплетан вишеагентски систем са ARM шаблоном за распоређивање)

## 📚 Додатни ресурси

### Линкови до документације
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Примери из заједнице
- [Azure примерци AZD шаблони](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry шаблони](https://github.com/Azure/ai-foundry-templates)
- [Галерија Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Todo апликација са C# и Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo апликација са Python и MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo апликација са Node.js и PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React веб апликација са C# API-јем](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions са Java-ом](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Најбоље праксе
- [Azure Well-Architected оквир](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Оквир за усвајање облака](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Доприношење примера

Имате користан пример за дељење? Добродошли су доприноси!

### Упутства за слање
1. Пратите утврђену структуру директоријума
2. Укључите свеобухватни README.md
3. Додајте коментаре у конфигурационе датотеке
4. Тестирајте темељно пре слања
5. Укључите процене трошкова и предуслове

### Структура примера шаблона
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Користан савет**: Почните са најједноставнијим примером који одговара вашем технолошком стеку, а затим постепено пређите на сложеније сценарије. Сваки пример заснива се на концептима из претходних!

## 🚀 Спремни да почнете?

### Ваш пут учења

1. **Потпуни почетник?** → Почните са [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 мин)
2. **Имате основно знање о AZD?** → Испробајте [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 мин)
3. **Правите AI апликације?** → Почните са [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 мин) или истражите [Retail мулти-агент](retail-scenario.md) (⭐⭐⭐⭐, 2+ сата)
4. **Треба вам специфичан технолошки стек?** → Користите [Пронађите прави пример](#-finding-the-right-example) одељак горе

### Следећи кораци

- ✅ Прегледајте [Претпоставке](#преуслови) изнад
- ✅ Изаберите пример који одговара вашем нивоу вештина (види [Легенда сложености](#легенда-о-оцени-сложености))
- ✅ Пажљиво прочитајте README примера пре распоређивања
- ✅ Подесите подсетник да покренете `azd down` након тестирања
- ✅ Поделите своје искуство преко GitHub Issues или Discussions

### Треба помоћ?

- 📖 [Често постављана питања (FAQ)](../resources/faq.md) - Одговори на уобичајена питања
- 🐛 [Водич за решавање проблема](../docs/chapter-07-troubleshooting/common-issues.md) - Поправите проблеме са распоређивањем
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Питајте заједницу
- 📚 [Водич за учење](../resources/study-guide.md) - Укрепите своје знање

---

**Навигација**
- **📚 Почетна страница курса**: [AZD за почетнике](../README.md)
- **📖 Материјали за учење**: [Водич за учење](../resources/study-guide.md) | [Кратки преглед](../resources/cheat-sheet.md) | [Глосар](../resources/glossary.md)
- **🔧 Ресурси**: [Често постављана питања (FAQ)](../resources/faq.md) | [Водич за решавање проблема](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Последње ажурирано: новембар 2025. | [Пријавите проблеме](https://github.com/microsoft/AZD-for-beginners/issues) | [Додајте примере](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање одговорности**:
Овај документ је преведен помоћу AI сервиса за превођење [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални људски превод. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења проистекла из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->