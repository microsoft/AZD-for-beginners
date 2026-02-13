# Примери - Практични AZD шаблони и конфигурације

**Учење кроз примере - Организовано по поглављима**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Chapter Mapping**: Примери организовани по сложености учења
- **🚀 Local Example**: [Решење за мулти-агентну малопродају](retail-scenario.md)
- **🤖 External AI Examples**: Линкови ка Azure Samples репозиторијумима

> **📍 IMPORTANT: Local vs External Examples**  
> Овај репозиторијум садржи **4 комплетна локална примера** са потпуном имплементацијом:  
> - **Azure OpenAI Chat** (GPT-4 deployment with chat interface)  
> - **Container Apps** (Simple Flask API + Microservices)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Enterprise AI Solution)  
>  
> Додатни примери су **спољне референце** на Azure-Samples репозиторијуме које можете клонирати.

## Увод

Овај директоријум пружа практичне примере и референце које ће вам помоћи да научите Azure Developer CLI кроз практичну обуку. Retail Multi-Agent сценарио је комплетна, спремна за производњу имплементација укључена у овај репозиторијум. Додатни примери упућују на званичне Azure Samples који демонстрирају различите AZD шаблоне.

### Легенда о нивоу сложености

- ⭐ **Beginner** - Основни концепти, једна услуга, 15-30 минута
- ⭐⭐ **Intermediate** - Више услуга, интеграција базе података, 30-60 минута
- ⭐⭐⭐ **Advanced** - Комплексна архитектура, интеграција AI, 1-2 сата
- ⭐⭐⭐⭐ **Expert** - Спремно за производњу, шаблони за предузећа, 2+ сата

## 🎯 Шта се заправо налази у овом репозиторијуму

### ✅ Локална имплементација (Спремно за употребу)

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕
**Комплетно распоређивање GPT-4 са интерфејсом за ћаскање укључено у овај репозиторијум**

- **Location:** `examples/azure-openai-chat/`
- **Complexity:** ⭐⭐ (Средњи ниво)
- **What's Included:**
  - Комплетно Azure OpenAI распоређивање (GPT-4)
  - Python командно-линијски интерфејс за ћаскање
  - Интеграција са Key Vault за безбедне API кључеве
  - Bicep инфраструктурни шаблони
  - Праћење употребе токена и трошкова
  - Ограничење брзине захтева и руковање грешкама

**Quick Start:**
```bash
# Пређите на пример
cd examples/azure-openai-chat

# Деплојујте све
azd up

# Инсталирајте зависности и почните да ћаскате
pip install -r src/requirements.txt
python src/chat.py
```

**Technologies:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**Свеобухватни примери распореда контејнера укључени у овај репозиторијум**

- **Location:** `examples/container-app/`
- **Complexity:** ⭐-⭐⭐⭐⭐ (Почетник до Напредни)
- **What's Included:**
  - [Главни водич](container-app/README.md) - Комплетан преглед распореда контејнера
  - [Једноставан Flask API](../../../examples/container-app/simple-flask-api) - Пример основног REST API
  - [Microservices Architecture](../../../examples/container-app/microservices) - Продукционо спреман мулти-сервисни распоред
  - Брзи почетак, продукциони и напредни обрасци
  - Мониторинг, безбедност и оптимизација трошкова

**Quick Start:**
```bash
# Погледајте главни водич
cd examples/container-app

# Разместити једноставан Flask API
cd simple-flask-api
azd up

# Разместити пример микросервиса
cd ../microservices
azd up
```

**Technologies:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Комплетна имплементација спремна за производњу укључена у овај репозиторијум**

- **Location:** `examples/retail-multiagent-arm-template/`
- **Complexity:** ⭐⭐⭐⭐ (Напредни)
- **What's Included:**
  - Комплетан ARM шаблон за распоређивање
  - Мулти-агентна архитектура (Customer + Inventory)
  - Интеграција са Azure OpenAI
  - AI Search са RAG
  - Комплетан мониторинг
  - Скрипта за једнокликово распоређивање

**Quick Start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologies:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Спољни Azure примери (Клонирајте да бисте користили)

Следећи примери се одржавају у званичним Azure-Samples репозиторијумима. Клонирајте их да бисте истражили различите AZD шаблоне:

### Једноставне апликације (Поглавља 1-2)

| Template | Repository | Complexity | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Локално: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Локално: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Више услуга, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**How to use:**
```bash
# Клонирај било који пример
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Размешти
azd up
```

### AI Application Examples (Поглавља 2, 5, 8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Локално: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Распоређивање GPT-4 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Основни AI чет |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Фрејмворк за агенте |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG образац |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI за предузећа |

### Базе података и напредни обрасци (Поглавља 3-8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Интеграција базе података |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Безсерверски NoSQL |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Више услуга |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Циљеви учења

Радом на овим примерима ћете:
- Вежбати Azure Developer CLI радне токове кроз реалистичне апликационе сценарије
- Разумети различите апликационе архитектуре и њихове azd имплементације
- Усавршити шаблоне Инфраструктура као код за разне Azure услуге
- Применити управљање конфигурацијом и стратегије распоређивања специфичне за окружења
- Имплементирати мониторинг, безбедност и обрасце скалирања у практичним контекстима
- Стећи искуство у решавању проблема и дебаговању реалних сценарија распореда

## Резултати учења

Након завршетка ових примера, моћи ћете да:
- Самоуверено распоређујете разне типове апликација користећи Azure Developer CLI
- Прилагодите обезбеђене шаблоне својим апликационим захтевима
- Дизајнирате и имплементирате прилагођене инфраструктурне шаблоне помоћу Bicep
- Конфигуришете комплексне мулти-сервисне апликације са исправним зависностима
- Примените најбоље праксе за безбедност, мониторинг и перформансе у стварним сценаријима
- Решавате проблеме и оптимизујете распореде на основу практичног искуства

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

## Брзи почетак - примери

> **💡 New to AZD?** Почните са примером бр. 1 (Flask API) - траје ~20 минута и подучава основне концепте.

### За почетнике
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Распоредите једноставан REST API са аутоматским скалирањем до нуле  
   **Time:** 20-25 minutes | **Cost:** $0-5/month  
   **You'll Learn:** Основни azd радни ток, контејнеризација, провере статуса  
   **Expected Outcome:** Радни API endpoint који враћа "Hello, World!" са мониторингом

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Распоредите Node.js Express веб апликацију са MongoDB  
   **Time:** 25-35 minutes | **Cost:** $10-30/month  
   **You'll Learn:** Интеграција базе података, environment переменљиве, connection strings  
   **Expected Outcome:** Todo листа апликација са CRUD функционалностима

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Хостујте React статички сајт помоћу Azure Static Web Apps  
   **Time:** 20-30 minutes | **Cost:** $0-10/month  
   **You'll Learn:** Статичко хостовање, безсерверске функције, CDN распоређивање  
   **Expected Outcome:** React UI са API позадином, аутоматски SSL, глобални CDN

### За средњи ниво
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Распоредите GPT-4 са интерфејсом за ћаскање и сигурно управљање API кључевима  
   **Time:** 35-45 minutes | **Cost:** $50-200/month  
   **You'll Learn:** Azure OpenAI распоређивање, интеграција Key Vault, праћење токена  
   **Expected Outcome:** Радна апликација за ћаскање са GPT-4 и праћењем трошкова

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Продукционо спремна мулти-сервисна архитектура  
   **Time:** 45-60 minutes | **Cost:** $50-150/month  
   **You'll Learn:** Комунукација између сервиса, редови порука, distribuirano трасирање  
   **Expected Outcome:** Систем од 2 сервиса (API Gateway + Product Service) са мониторингом

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Веб апликација са C# API-јем и Azure SQL базом података  
   **Time:** 30-45 minutes | **Cost:** $20-80/month  
   **You'll Learn:** Entity Framework, миграције базе, сигурност конекција  
   **Expected Outcome:** C# API са Azure SQL backend-ом и аутоматским деплојем шеме

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions са HTTP тригерима и Cosmos DB  
   **Time:** 30-40 minutes | **Cost:** $10-40/month  
   **You'll Learn:** Event-driven архитектура, безсерверско скалирање, NoSQL интеграција  
   **Expected Outcome:** Function app који одговара на HTTP захтеве са Cosmos DB складиштем

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Мулти-сервисна Java апликација са Container Apps и API gateway-ом  
   **Time:** 60-90 minutes | **Cost:** $80-200/month  
   **You'll Learn:** Распоређивање Spring Boot-а, service mesh, балансирање оптерећења  
   **Expected Outcome:** Мулти-сервисни Java систем са откривањем сервиса и рутирањем

### Microsoft Foundry шаблони

1. **[Azure OpenAI Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Комплетно распоређивање GPT-4 са интерфејсом за ћаскање  
   **Time:** 35-45 minutes | **Cost:** $50-200/month  
   **Expected Outcome:** Радна апликација за ћаскање са праћењем токена и трошкова

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Интелигентна апликација за ћаскање са RAG архитектуром  
   **Time:** 60-90 minutes | **Cost:** $100-300/month  
   **Expected Outcome:** RAG-подржани интерфејс за ћаскање са претрагом докумената и цитатима

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Обрада докумената користећи Azure AI сервисе  
   **Time:** 40-60 minutes | **Cost:** $20-80/month  
   **Expected Outcome:** API који екстрахује текст, табеле и ентитете из отпремљених докумената

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps радни ток са Azure Machine Learning  
   **Time:** 2-3 hours | **Cost:** $150-500/month  
   **Expected Outcome:** Аутоматизована ML цевоводна линија са тренирањем, распоређивањем и мониторингом

### Сценарији из стварног света

#### **Retail Multi-Agent Solution** 🆕
**[Complete Implementation Guide](./retail-scenario.md)**

Свеобухватно, спремно за производњу мулти-агентно решење за корисничку подршку које демонстрира ентерпрајз ниво распоређивања AI апликација уз помоћ AZD. Овај сценарио пружа:

- **Complete Architecture**: Мулти-агентни систем са специјализованим агентима за кориснички сервис и управљање инвентаром
- **Производна инфраструктура**: Размештања Azure OpenAI у више региона, Azure AI Search, Container Apps и свеобухватно надгледање
- **ARM шаблон спреман за распоређивање**: Једно-кликовно распоређивање са више режима конфигурације (Minimal/Standard/Premium)
- **Напредне функције**: Валидација безбедности (red teaming), оквир за процену агената, оптимизација трошкова и водичи за решавање проблема
- **Стварни бизнис контекст**: Случај употребе корисничке подршке за трговца са отпремањем датотека, интеграцијом претраге и динамичким скалирањем

**Технологије**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Комплексност**: ⭐⭐⭐⭐ (Напредно - спремно за продукцију у ентерпрајз окружењу)

**Идеално за**: AI програмере, архитекте решења и тимове који граде продукционе мулти-агентне системе

**Брзи почетак**: Расположите цело решење за мање од 30 минута користећи приложени ARM шаблон са `./deploy.sh -g myResourceGroup`

## 📋 Упутство за коришћење

### Преуслови

Пре него што покренете било који пример:
- ✅ Azure претплата са приступом Owner или Contributor
- ✅ Azure Developer CLI инсталиран ([Водич за инсталацију](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop покренут (за примере са контејнерима)
- ✅ Одговарајуће Azure квоте (проверите захтеве специфичне за пример)

> **💰 Упозорење о трошковима:** Сви примери креирају реалне Azure ресурсе који носе трошкове. Погледајте појединачна README фајлова за процене трошкова. Запамтите да покренете `azd down` када завршите како бисте избегли даљe трошкове.

### Покретање примера локално

1. **Клонирајте или копирајте пример**
   ```bash
   # Пређите на жељени пример
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
   # Поставите обавезне променљиве
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Распоредите**
   ```bash
   # Разместити инфраструктуру и апликацију
   azd up
   ```

5. **Потврдите распоређивање**
   ```bash
   # Добијте крајње тачке услуге
   azd env get-values
   
   # Тестирајте крајњу тачку (пример)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Очекивани индикатори успешности:**
   - ✅ `azd up` се завршава без грешака
   - ✅ Ендпоинт сервиса враћа HTTP 200
   - ✅ Azure Portal приказује статус „Running”
   - ✅ Application Insights прима телеметрију

> **⚠️ Проблеми?** Погледајте [Чести проблеми](../docs/chapter-07-troubleshooting/common-issues.md) за решавање проблема при распоређивању

### Прилагођавање примера

Сваки пример укључује:
- **README.md** - Детаљна упутства за подешавање и прилагођавање
- **azure.yaml** - AZD конфигурација са коментарима
- **infra/** - Bicep шаблони са објашњењима параметара
- **src/** - Примерак кода апликације
- **scripts/** - Помоћни скрипти за уобичајене задатке

## 🎯 Циљеви учења

### Категорије примера

#### **Основна распоређивања**
- Апликације са једном услугом
- Једноставни инфраструктурни шаблони
- Основно управљање конфигурацијом
- Трошковно ефикасна развојна окружења

#### **Напредни сценарији**
- Архитектуре са више услуга
- Комплексне мрежне конфигурације
- Обрасци интеграције база података
- Имплементације безбедности и усаглашености

#### **Обрасци спремни за продукцију**
- Конфигурације високе доступности
- Надгледање и видљивост
- CI/CD интеграција
- Подешавања за опоравак од катастрофа

## 📖 Описи примера

### Једноставна веб апликација - Node.js Express
**Технологије**: Node.js, Express, MongoDB, Container Apps  
**Комплексност**: Почетник  
**Концепти**: Основно распоређивање, REST API, интеграција NoSQL базе података

### Статички сајт - React SPA
**Технологије**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Комплексност**: Почетник  
**Концепти**: Статичко хостовање, безсерверски backend, модерни web развој

### Container App - Python Flask
**Технологије**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Комплексност**: Почетник  
**Концепти**: Контейнеризација, REST API, scale-to-zero, health probes, надгледање  
**Локација**: [Локални пример](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Технологије**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Комплексност**: Напредно  
**Концепти**: Архитектура са више сервиса, комуникација између сервиса, редизање порука, дистрибуирано трасирање  
**Локација**: [Локални пример](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Технологије**: C# ASP.NET Core, Azure SQL Database, App Service  
**Комплексност**: Средњи ниво  
**Концепти**: Entity Framework, везе ка бази података, развој web API

### Serverless Function - Python Azure Functions
**Технологије**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Комплексност**: Средњи ниво  
**Концепти**: Догађајно-вођена архитектура, безсерверско рачунање, full-stack развој

### Microservices - Java Spring Boot
**Технологије**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Комплексност**: Средњи ниво  
**Концепти**: Комуникација микросервиса, дистрибуирани системи, ентерпрајз обрасци

### Microsoft Foundry примери

#### Azure OpenAI Chat App
**Технологије**: Azure OpenAI, Cognitive Search, App Service  
**Комплексност**: Средњи ниво  
**Концепти**: RAG архитектура, векторска претрага, интеграција LLM

#### AI обрада докумената
**Технологије**: Azure AI Document Intelligence, Storage, Functions  
**Комплексност**: Средњи ниво  
**Концепти**: Анализа докумената, OCR, извлачење података

#### Пайплајн машинског учења
**Технологије**: Azure ML, MLOps, Container Registry  
**Комплексност**: Напредно  
**Концепти**: Тренирање модела, пайплајни за распоређивање, надгледање

## 🛠 Примери конфигурација

The `configurations/` directory contains reusable components:

### Конфигурације окружења
- Подешавања развојног окружења
- Конфигурације staging окружења
- Конфигурације спремне за продукцију
- Подешавања за распоређивање у више региона

### Bicep модули
- Поново искоришћиви инфраструктурни елементи
- Уобичајени обрасци ресурса
- Безбедносно ојачани шаблони
- Трошковно оптимизоване конфигурације

### Помоћни скрипти
- Аутоматизација подешавања окружења
- Скрипти миграције базе података
- Алати за валидацију распоређивања
- Утилити за праћење трошкова

## 🔧 Водич за прилагођавање

### Прилагођавање примера за ваш случај употребе

1. **Прегледајте преуслове**
   - Проверите захтеве Azure сервиса
   - Верификујте лимите претплате
   - Разумите последице на трошкове

2. **Измените конфигурацију**
   - Ажурирајте `azure.yaml` дефиниције сервиса
   - Прилагодите Bicep шаблоне
   - Подесите променљиве окружења

3. **Проверите темељно**
   - Прво распоредите у развојном окружењу
   - Валидацијујте функционалност
   - Тестирајте скалирање и перформансе

4. **Преглед безбедности**
   - Прегледајте контроле приступа
   - Имплементирајте управљање тајнама
   - Омогућите надгледање и алармирање

## 📊 Матрица поређења

| Пример | Услуге | База података | Аутентикација | Надгледање | Комплексност |
|--------|--------|---------------|---------------|------------|--------------|
| **Azure OpenAI Chat** (Local) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 Пут учења

### Препоручени редослед

1. **Почните са једноставном веб апликацијом**
   - Научите основне AZD концепте
   - Разумите ток распоређивања
   - Вежбајте управљање окружењем

2. **Испробајте статички сајт**
   - Истражите различите опције хостинга
   - Научите о CDN интеграцији
   - Разумите DNS конфигурацију

3. **Преселите се на Container App**
   - Научите основе контейнеризације
   - Разумите концепте скалирања
   - Вежбајте са Docker-ом

4. **Додајте интеграцију базе података**
   - Научите провизију база података
   - Разумите connection strings
   - Вежбајте управљање тајнама

5. **Истражите безсерверско**
   - Разумите догађајно-вођену архитектуру
   - Научите о тригерима и бајндовима
   - Вежбајте са API-јима

6. **Изградите микросервисе**
   - Научите комуникацију сервиса
   - Разумите дистрибуиране системе
   - Вежбајте комплексна распоређивања

## 🔍 Како пронаћи прави пример

### Према технолошком стеку
- **Container Apps**: [Python Flask API (Локално)](../../../examples/container-app/simple-flask-api), [Microservices (Локално)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Локално)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Локално)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Локално)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Локално)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Локално)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Локално)](../../../examples/container-app/simple-flask-api), [Microservices (Локално)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Локално)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Локално)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Према архитектонском обрасцу
- **Simple REST API**: [Python Flask API (Локално)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Локално)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Локално)](../../../examples/container-app/simple-flask-api), [Microservices (Локално)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Локално)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Према нивоу комплексности
- **Почетник**: [Python Flask API (Локално)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Средњи ниво**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Напредно**: ML Pipeline
- **Спремно за ентерпрајз продукцију**: [Microservices (Локално)](../../../examples/container-app/microservices) (Мулти-сервис са редизањем порука), **Retail Multi-Agent Solution** (Комплетан мулти-агентни систем са ARM шаблоном за распоређивање)

## 📚 Додатни ресурси

### Везе ка документацији
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
- [Todo апликација са Node.js и PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React веб апликација са C# API-јем](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps посао](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions са Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Најбоље праксе
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Прилога примера

Имате користан пример за поделити? С радошћу прихватамо прилоге!

### Упутства за слање
1. Пратите успостављену структуру директоријума
2. Укључите детаљан README.md
3. Додајте коментаре у конфигурационе фајлове
4. Темелно тестирајте пре слања
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

**Практичан савет**: Почните са најједноставнијим примером који одговара вашем технолошком стеку, затим постепено прелазите на сложеније сценарије. Сваки пример надовезује се на концепте из претходних!

## 🚀 Спремни да почнете?

### Ваш пут учења

1. **Апсолутни почетник?** → Почните са [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 мин)
2. **Имате основно знање о AZD?** → Испробајте [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 мин)
3. **Правите AI апликације?** → Почните са [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 мин) или истражите [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ сата)
4. **Потребан вам је специфичан технолошки стек?** → Користите одељак [Finding the Right Example](../../../examples) изнад

### Следећи кораци

- ✅ Прегледајте [Prerequisites](../../../examples) изнад
- ✅ Одаберите пример који одговара вашем нивоу вештине (погледајте [Complexity Legend](../../../examples))
- ✅ Прочитајте README примера темељно пре деплоја
- ✅ Подсетник: покрените `azd down` након тестирања
- ✅ Поделите своје искуство преко GitHub Issues или Discussions

### Потребна помоћ?

- 📖 [FAQ](../resources/faq.md) - Одговори на често постављана питања
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - Решавање проблема при деплоју
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Питајте заједницу
- 📚 [Study Guide](../resources/study-guide.md) - Утврдите своје знање

---

**Навигација**
- **📚 Почетак курса**: [AZD For Beginners](../README.md)
- **📖 Материјали за учење**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 Ресурси**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Последње ажурирање: новембар 2025 | [Пријавите проблеме](https://github.com/microsoft/AZD-for-beginners/issues) | [Пошаљите примере](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ограничење одговорности**:
Овај документ је преведен помоћу AI услуге за превођење [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати званичним извором. За критичне информације препоручује се професионални људски превод. Не сносимо одговорност за било какве неспоразуме или погрешне тумачења која произилазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->