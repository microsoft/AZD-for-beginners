# Примери - Практични AZD шаблони и конфигурације

**Учење кроз примере - организовано по поглављима**
- **📚 Почетак курса**: [AZD For Beginners](../README.md)
- **📖 Mапа поглавља**: Примери организовани по сложености учења
- **🚀 Локални пример**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 Спољни AI примери**: Линкови ка Azure Samples репозиторијумима

> **📍 ВАЖНО: локални у односу на спољне примере**  
> Овај репозиторијум садржи **4 комплетна локална примера** са пуним имплементацијама:  
> - **Microsoft Foundry Models Chat** (размештање gpt-4.1 са интерфејсом за ћаскање)  
> - **Container Apps** (једноставан Flask API + микросервиси)  
> - **Database App** (веб + SQL база података)  
> - **Retail Multi-Agent** (предузеће AI решење)  
>  
> Додатни примери су **спољне референце** на Azure-Samples репозиторијуме које можете клонити.

## Увод

Овај директоријум пружа практичне примере и референце које ће вам помоћи да научите Azure Developer CLI кроз практичан рад. Retail Multi-Agent сценарио је комплетна, спремна за производњу имплементација укључена у овај репозиторијум. Додатни примери упућују на званичне Azure Samples који демонстрирају различите AZD обрасце.

### Легенда о оцени сложености

- ⭐ **Почетник** - Основни концепти, једна услуга, 15-30 минута
- ⭐⭐ **Средњи** - Више услуга, интеграција базе података, 30-60 минута
- ⭐⭐⭐ **Напредни** - Комплексна архитектура, интеграција AI, 1-2 сата
- ⭐⭐⭐⭐ **Експерт** - Спремно за производњу, предузећни обрасци, 2+ сата

## 🎯 Шта се заправо налази у овом репозиторијуму

### ✅ Локална имплементација (спремна за употребу)

#### [Апликација за чет Microsoft Foundry Models](azure-openai-chat/README.md) 🆕
**Комплетно размештање gpt-4.1 са интерфејсом за ћаскање укључено у овај репозиторијум**

- **Локација:** `examples/azure-openai-chat/`
- **Сложеност:** ⭐⭐ (Средњи)
- **Шта је укључено:**
  - Комплетно Microsoft Foundry Models размештање (gpt-4.1)
  - Python интерфејс за ћаскање преко командне линије
  - Интеграција са Key Vault за безбедне API кључеве
  - Bicep шаблони инфраструктуре
  - Праћење употребе токена и трошкова
  - Ограничење брзине и руковање грешкама

**Брзи почетак:**
```bash
# Пређите у пример
cd examples/azure-openai-chat

# Разместите све
azd up

# Инсталирајте зависности и почните да ћаскате
pip install -r src/requirements.txt
python src/chat.py
```

**Технологије:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Примери Container Apps](container-app/README.md) 🆕
**Свеобухватни примери размештања контејнера укључени у овај репозиторијум**

- **Локација:** `examples/container-app/`
- **Сложеност:** ⭐-⭐⭐⭐⭐ (Од почетничког до напредног)
- **Шта је укључено:**
  - [Главни водич](container-app/README.md) - Комплетан преглед размештања контејнера
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Основни пример REST API-ја
  - [Microservices Architecture](../../../examples/container-app/microservices) - Производно спремно распоређивање више услуга
  - Брзи почетак, производни и напредни обрасци
  - Мониторинг, безбедност и оптимизација трошкова

**Брзи почетак:**
```bash
# Погледајте главни водич
cd examples/container-app

# Разместите једноставан Flask API
cd simple-flask-api
azd up

# Разместите пример микросервиса
cd ../microservices
azd up
```

**Технологије:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Решење за мулти-агент у малопродаји](retail-scenario.md) 🆕
**Комплетна имплементација спремна за производњу укључена у овај репозиторијум**

- **Локација:** `examples/retail-multiagent-arm-template/`
- **Сложеност:** ⭐⭐⭐⭐ (Напредни)
- **Шта је укључено:**
  - Комплетан ARM шаблон за распоређивање
  - Мулти-агент архитектура (Customer + Inventory)
  - Интеграција са Microsoft Foundry Models
  - AI претрага са RAG
  - Свеобухватан мониторинг
  - Скрипта за распоређивање једним кликом

**Брзи почетак:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Технологије:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Спољни Azure примери (клонирајте да бисте користили)

Следећи примери се одржавају у званичним Azure-Samples репозиторијумима. Клонирајте их да бисте истражили различите AZD обрасце:

### Једноставне апликације (Поглавља 1-2)

| Шаблон | Репозиторијум | Сложеност | Услуге |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Локално: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Микросервиси** | [Локално: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Како користити:**
```bash
# Клонирај било који пример
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Деплој
azd up
```

### AI примери апликација (Поглавља 2, 5, 8)

| Шаблон | Репозиторијум | Сложеност | Фокус |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Локално: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 размештање |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Основни AI чет |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG образац |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Предузећни AI |

### Базе података и напредни обрасци (Поглавља 3-8)

| Шаблон | Репозиторијум | Сложеност | Фокус |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Интеграција базе података |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Вишесервисна архитектура |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Циљеви учења

Радом кроз ове примере, ви ћете:
- Вежбати Azure Developer CLI радне токове са реалистичним апликационим сценаријима
- Разумети различите архитектуре апликација и њихове azd имплементације
- Савладати обрасце Infrastructure as Code за разне Azure услуге
- Примeњивати управљање конфигурацијом и стратегије распоређивања специфичне за окружење
- Имплементирати праћење, безбедност и обрасце скалирања у практичним контекстима
- Стечи искуство у решавању проблема и дебаговању реалних сценарија распоређивања

## Резултати учења

Након завршетка ових примера, моћи ћете да:
- Сигурно распоредите различите типове апликација користећи Azure Developer CLI
- Прилагодите обезбеђене шаблоне својим захтевима апликације
- Дизајнирате и имплементирате прилагођене инфраструктурне обрасце користећи Bicep
- Конфигуришете комплексне мулти-услужне апликације са исправним зависностима
- Примените најбоље праксе за безбедност, праћење и перформансе у реалним сценаријима
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

## Примери за брзи старт

> **💡 Нови сте у AZD?** Почните са примером #1 (Flask API) - траје ~20 минута и учи основне концепте.

### За почетнике
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Локално) ⭐  
   Распоредите једноставан REST API са scale-to-zero  
   **Време:** 20-25 минута | **Трошак:** $0-5/месечно  
   **Шта ћете научити:** Основни azd радни ток, контејнеризација, health probes  
   **Очекивани резултат:** Радни API крајњи тачка која враћа "Hello, World!" са мониторингом

2. **[Једноставна веб апликација - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Распоредите Node.js Express веб апликацију са MongoDB  
   **Време:** 25-35 минута | **Трошак:** $10-30/месечно  
   **Шта ћете научити:** Интеграција базе података, променљиве окружења, connection strings  
   **Очекивани резултат:** TODO апликација са функцијама креирања/читања/ажурирања/брисања

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Хостирајте React статички сајт помоћу Azure Static Web Apps  
   **Време:** 20-30 минута | **Трошак:** $0-10/месечно  
   **Шта ћете научити:** Статичко хостовање, serverless функције, CDN распоређивање  
   **Очекивани резултат:** React UI са API backend-ом, аутоматски SSL, глобални CDN

### За средњи ниво
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Локално) ⭐⭐  
   Распоредите gpt-4.1 са интерфејсом за ћаскање и безбедним управљањем API кључевима  
   **Време:** 35-45 минута | **Трошак:** $50-200/месечно  
   **Шта ћете научити:** Распоређивање Microsoft Foundry Models, интеграција Key Vault-а, праћење токена  
   **Очекивани резултат:** Радна чет апликација са gpt-4.1 и праћењем трошкова

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Локално) ⭐⭐⭐⭐  
   Производно спремна вишесервисна архитектура  
   **Време:** 45-60 минута | **Трошак:** $50-150/месечно  
   **Шта ћете научити:** Компатибилност услуга, редови порука, дистрибуирано трасирање  
   **Очекивани резултат:** Систем са 2 услуге (API Gateway + Product Service) са мониторингом

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Веб апликација са C# API-јем и Azure SQL базом података  
   **Време:** 30-45 минута | **Трошак:** $20-80/месечно  
   **Шта ћете научити:** Entity Framework, миграције базе, безбедност конекције  
   **Очекивани резултат:** C# API са Azure SQL backend-ом, аутоматско примењивање шеме

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions са HTTP тригерима и Cosmos DB  
   **Време:** 30-40 минута | **Трошак:** $10-40/месечно  
   **Шта ћете научити:** Догађајно вођена архитектура, serverless скалирање, NoSQL интеграција  
   **Очекивани резултат:** Function апликација која реагује на HTTP захтеве са складиштењем у Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Вишесервисна Java апликација са Container Apps и API gateway-ом  
   **Време:** 60-90 минута | **Трошак:** $80-200/месечно  
   **Шта ћете научити:** Распоређивање Spring Boot-а, service mesh, балансирање оптерећења  
   **Очекивани резултат:** Вишесервисни Java систем са откривањем услуга и рутирањем

### Microsoft Foundry шаблони

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Комплетно размештање gpt-4.1 са интерфејсом за ћаскање  
   **Време:** 35-45 минута | **Трошак:** $50-200/месечно  
   **Очекивани резултат:** Радна чет апликација са праћењем токена и трошкова

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Интелигентна чет апликација са RAG архитектуром  
   **Време:** 60-90 минута | **Трошак:** $100-300/месечно  
   **Очекивани резултат:** RAG-погонски интерфејс за чет са претрагом докумената и цитатима

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Анализа докумената користећи Azure AI услуге  
   **Време:** 40-60 минута | **Трошак:** $20-80/месечно  
   **Очекивани резултат:** API који извлачи текст, табеле и ентитете из отпремљених докумената

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps радни ток са Azure Machine Learning-ом  
   **Време:** 2-3 сата | **Трошак:** $150-500/месечно  
   **Очекивани резултат:** Аутоматизован ML pipeline са тренингом, размештањем и мониторингом

### Реални сценарији

#### **Решење за мулти-агент у малопродаји** 🆕
**[Комплетан водич за имплементацију](./retail-scenario.md)**

Свеобухватно, производно спремно мулти-агент решење за корисничку подршку које демонстрира предузећни ниво распоређивања AI апликација помоћу AZD. Овај сценарио пружа:

- **Комплетна архитектура**: Мулти-агент систем са специјализованим агентима за корисничку службу и управљање инвентаром
- **Production Infrastructure**: Мулти-регионална разврставања Microsoft Foundry Models, AI Search, Container Apps и свеобухватно надгледање
- **Ready-to-Deploy ARM Template**: Једним кликом распоређивање са више режима конфигурације (Minimal/Standard/Premium)
- **Advanced Features**: Ред тиминг безбедносна валидација, оквир за евалуацију агената, оптимизација трошкова и водичи за отклањање проблема
- **Real Business Context**: Примера употребе за корисничку подршку трговца са отпремањем датотека, интеграцијом претраге и динамичким скалирањем

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Advanced - Enterprise Production Ready)

**Perfect for**: AI програмери, решења архитекте и тимови који граде продукционе мулти-агент системе

**Quick Start**: Распоредите комплетно решење за мање од 30 минута користећи укључени ARM шаблон са `./deploy.sh -g myResourceGroup`

## 📋 Упутство за употребу

### Захтеви

Пре покретања било ког примера:
- ✅ Azure претплата са приступом Owner или Contributor
- ✅ Azure Developer CLI инсталиран ([Installation Guide](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop покренут (за примере са контејнерима)
- ✅ Одговарајући Azure квоти (проверите захтеве специфичне за пример)

> **💰 Упозорење о трошковима:** Сви примери креирају стварне Azure ресурсе који ће изазвати трошкове. Погледајте појединачне README фајлове за процене трошкова. Запамтите да покренете `azd down` када завршите да бисте избегли даљи трошкове.

### Покретање примера локално

1. **Клонирајте или копирајте пример**
   ```bash
   # Идите до жељеног примера
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
   # Поставите потребне променљиве
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Размештање**
   ```bash
   # Разместити инфраструктуру и апликацију
   azd up
   ```

5. **Проверите распоређивање**
   ```bash
   # Добијте крајње тачке услуге
   azd env get-values
   
   # Тестирајте крајњу тачку (пример)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Очекивани индикатори успешног распоређивања:**
   - ✅ `azd up` завршава се без грешака
   - ✅ Крајња тачка сервиса враћа HTTP 200
   - ✅ Azure портал показује статус "Running"
   - ✅ Application Insights прима телеметрију

> **⚠️ Проблеми?** Погледајте [Common Issues](../docs/chapter-07-troubleshooting/common-issues.md) за решавање проблема са распоређивањем

### Прилагођавање примера

Сваки пример садржи:
- **README.md** - Детаљна упутства за подешавање и прилагођавање
- **azure.yaml** - AZD конфигурација са коментарима
- **infra/** - Bicep шаблони са објашњењима параметара
- **src/** - Пример кода апликације
- **scripts/** - Помоћни скриптови за уобичајене задатке

## 🎯 Циљеви учења

### Категорије примера

#### **Основна распоређивања**
- Једносервисне апликације
- Једноставни инфраструктурни обрасци
- Основно управљање конфигурацијом
- Трошковно-ефикасна окружења за развој

#### **Напредни сценарији**
- Мулти-сервисне архитектуре
- Комплексне мрежне конфигурације
- Обрасци интеграције база података
- Имплементације безбедности и усаглашености

#### **Обрасци спремни за продукцију**
- Конфигурације високе доступности
- Надгледање и опсервабилност
- CI/CD интеграција
- Планови за опоравак од катастрофа

## 📖 Опис примера

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Почетнички  
**Concepts**: Основно распоређивање, REST API, интеграција NoSQL базе података

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Почетнички  
**Concepts**: Статичко хостовање, serverless backend, савремени веб развој

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Почетнички  
**Concepts**: Контенеризација, REST API, scale-to-zero, health probes, надгледање  
**Location**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Напредни  
**Concepts**: Мулти-сервисна архитектура, комуникација сервиса, редови порука, distribuirano трасирање  
**Location**: [Local Example](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: Средњи  
**Concepts**: Entity Framework, везе са базом података, развој веб API-ја

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: Средњи  
**Concepts**: Догађајно-вођена архитектура, serverless рачунање, full-stack развој

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: Средњи  
**Concepts**: Комуникација микросервиса, distribuirani системи, ентерпрајз образци

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologies**: Microsoft Foundry Models, Azure AI Search, App Service  
**Complexity**: Средњи  
**Concepts**: RAG архитектура, претрага вектора, интеграција LLM

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Средњи  
**Concepts**: Анализа докумената, OCR, извлачење података

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Напредни  
**Concepts**: Тренирање модела, цевоводи за распоређивање модела, надгледање

## 🛠 Примери конфигурација

Директоријум `configurations/` садржи поновно употребљиве компоненте:

### Конфигурације окружења
- Поставке развојног окружења
- Конфигурације за staging окружење
- Конфигурације спремне за продукцију
- Подешавања за мулти-регионално распоређивање

### Bicep модули
- Поновно употребљиви инфраструктурни елементи
- Уобичајени обрасци ресурса
- Шаблони ојачани за безбедност
- Конфигурације оптимизоване за трошкове

### Помоћни скриптови
- Аутоматизација подешавања окружења
- Скриптови за миграцију базе података
- Алати за валидацију распоређивања
- Утилити за праћење трошкова

## 🔧 Водич за прилагођавање

### Прилагођавање примера за ваш случај употребе

1. **Преглед предуслова**
   - Проверите захтеве Azure сервиса
   - Верификујте лимите претплате
   - Разумите импликације трошкова

2. **Измените конфигурацију**
   - Ажурирајте дефиниције сервиса у `azure.yaml`
   - Прилагодите Bicep шаблоне
   - Подесите променљиве окружења

3. **Тестирајте темељно**
   - Прво распоредите у развојно окружење
   - Валидација функционалности
   - Тестирајте скалирање и перформансе

4. **Преглед безбедности**
   - Прегледајте контроле приступа
   - Имплементирајте управљање тајнама (secrets management)
   - Омогућите надгледање и алармирање

## 📊 Матрица поређења

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Локално) | 2 | ❌ | Key Vault | Пуно | ⭐⭐ |
| **Python Flask API** (Локално) | 1 | ❌ | Основно | Пуно | ⭐ |
| **Microservices** (Локално) | 5+ | ✅ | Enterprise | Напредни | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Основно | Основно | ⭐ |
| React SPA + Functions | 3 | ✅ | Основно | Пуно | ⭐ |
| Python Flask Container | 2 | ❌ | Основно | Пуно | ⭐ |
| C# Web API + SQL | 2 | ✅ | Пуно | Пуно | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Пуно | Пуно | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Пуно | Пуно | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Пуно | Пуно | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Основно | Пуно | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Пуно | Пуно | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Локално) | **8+** | **✅** | **Enterprise** | **Напредни** | **⭐⭐⭐⭐** |

## 🎓 Пут учења

### Препоручени редослед

1. **Почните са Simple Web App**
   - Научите основне AZD концепте
   - Разумите workflow распоређивања
   - Вежбајте управљање окружењима

2. **Пробајте Static Website**
   - Истражите различите опције хостинга
   - Научите о CDN интеграцији
   - Разумите DNS конфигурацију

3. **Прелазак на Container App**
   - Научите основе контенеризације
   - Разумите концепте скалирања
   - Вежбајте са Docker-ом

4. **Додајте интеграцију базе података**
   - Научите провизионисање базе података
   - Разумите connection strings
   - Вежбајте управљање тајнама

5. **Истражите Serverless**
   - Разумите догађајно-вођену архитектуру
   - Научите о тригерима и биндинзима
   - Вежбајте са API-јима

6. **Градите Microservices**
   - Научите комуникацију сервиса
   - Разумите distribuirane системе
   - Вежбајте комплексе распоређивања

## 🔍 Како пронаћи прави пример

### По технолошком стеку
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### По архитектонском обрасцу
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### По нивоу сложености
- **Почетнички**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Средњи**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Напредни**: ML Pipeline
- **Спремно за ентерпрајз продукцију**: [Microservices (Local)](../../../examples/container-app/microservices) (Мулти-сервис са редовима порука), **Retail Multi-Agent Solution** (Комплетан мулти-агент систем са ARM шаблоном за распоређивање)

## 📚 Додатни ресурси

### Линкови за документацију
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Примери из заједнице
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React веб апликација са C# API-јем](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Задак Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions са Јавом](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Најбоље праксе
- [Azure оквир добре архитектуре](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Оквир за усвајање облака](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Примери за допринос

Имате користан пример за поделити? Радујемо се вашим доприносима!

### Упутства за подношење
1. Пратите успостављену структуру директоријума
2. Укључите обухватни README.md
3. Додајте коментаре у конфигурационе фајлове
4. Темељно тестирате пре слања
5. Укључите процене трошкова и предуслове

### Структура шаблона примера
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

**Корисни савет**: Почните са најједноставнијим примером који одговара вашем технолошком стеку, па постепено прелазите на сложеније сценарије. Сваки пример надовезује се на концепте из претходних!

## 🚀 Спремни за почетак?

### Ваш пут учења

1. **Потпуни почетник?** → Почните са [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 мин)
2. **Имате основно знање о AZD?** → Испробајте [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 мин)
3. **Правите AI апликације?** → Почните са [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 мин) или истражите [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ сата)
4. **Потребан специфичан технолошки стек?** → Користите одељак [Проналажење правог примера](#-finding-the-right-example) изнад

### Следећи кораци

- ✅ Прегледајте [Предуслове](#захтеви) изнад
- ✅ Изаберите пример који одговара вашем нивоу вештина (види [Легенда сложености](#легенда-о-оцени-сложености))
- ✅ Пажљиво прочитајте README примера пре распоређивања
- ✅ Подесите подсетник да покренете `azd down` после тестирања
- ✅ Поделите своје искуство преко GitHub Issues или Discussions

### Потребна помоћ?

- 📖 [ЧПП](../resources/faq.md) - Одговори на уобичајена питања
- 🐛 [Водич за решавање проблема](../docs/chapter-07-troubleshooting/common-issues.md) - Решите проблеме са распоређивањем
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Питајте заједницу
- 📚 [Водич за учење](../resources/study-guide.md) - Учврстите своје знање

---

**Навигација**
- **📚 Почетна страна курса**: [AZD за почетнике](../README.md)
- **📖 Материјали за учење**: [Водич за учење](../resources/study-guide.md) | [Кратки преглед](../resources/cheat-sheet.md) | [Речник](../resources/glossary.md)
- **🔧 Ресурси**: [ЧПП](../resources/faq.md) | [Решавање проблема](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Последње ажурирање: новембар 2025 | [Пријавите проблеме](https://github.com/microsoft/AZD-for-beginners/issues) | [Допринесите примерима](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->