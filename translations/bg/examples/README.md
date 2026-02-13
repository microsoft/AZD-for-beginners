# Примери - Практически AZD шаблони и конфигурации

**Учене чрез примери - Организирано по глави**
- **📚 Начална страница на курса**: [AZD за начинаещи](../README.md)
- **📖 Съответствие по глави**: Примери, организирани по сложност на обучението
- **🚀 Локален пример**: [Многоагентно търговско решение](retail-scenario.md)
- **🤖 Външни AI примери**: Връзки към хранилищата Azure Samples

> **📍 ВАЖНО: Локални срещу външни примери**  
> Това хранилище съдържа **4 пълни локални примера** с пълни реализации:  
> - **Azure OpenAI Chat** (GPT-4 разгръщане с чат интерфейс)  
> - **Container Apps** (Просто Flask API + микросървиси)  
> - **Database App** (Уеб + SQL база данни)  
> - **Retail Multi-Agent** (Предприятелско AI решение)  
>  
> Допълнителните примери са **външни препратки** към хранилищата Azure-Samples, които можете да клонирате.

## Въведение

Тази директория предоставя практически примери и препратки, които да ви помогнат да научите Azure Developer CLI чрез практически упражнения. Сценарият Retail Multi-Agent е пълна, готова за производство реализация, включена в това хранилище. Допълнителните примери препращат към официалните Azure Samples, които демонстрират различни AZD модели.

### Легенда за оценка на сложността

- ⭐ **Начинаещ** - Основни концепции, една услуга, 15-30 минути
- ⭐⭐ **Средно** - Множество услуги, интеграция с база данни, 30-60 минути
- ⭐⭐⭐ **Напреднал** - Комплексна архитектура, AI интеграция, 1-2 часа
- ⭐⭐⭐⭐ **Експерт** - Готово за производство, корпоративни модели, 2+ часа

## 🎯 Какво всъщност има в това хранилище

### ✅ Локална реализация (готова за използване)

#### [Приложение Azure OpenAI Chat](azure-openai-chat/README.md) 🆕
**Пълно разгръщане на GPT-4 с включен чат интерфейс в това хранилище**

- **Местоположение:** `examples/azure-openai-chat/`
- **Сложност:** ⭐⭐ (Средно)
- **Какво е включено:**
  - Пълно разгръщане на Azure OpenAI (GPT-4)
  - Python команден интерфейс за чат
  - Интеграция с Key Vault за сигурно съхранение на API ключове
  - Bicep инфраструктурни шаблони
  - Проследяване на използване на токени и разходи
  - Ограничаване на честотата и обработка на грешки

**Бърз старт:**
```bash
# Навигирайте до примера
cd examples/azure-openai-chat

# Разположете всичко
azd up

# Инсталирайте зависимостите и започнете да чатите
pip install -r src/requirements.txt
python src/chat.py
```

**Технологии:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Примери за Container App](container-app/README.md) 🆕
**Изчерпателни примери за разгръщане на контейнери, включени в това хранилище**

- **Местоположение:** `examples/container-app/`
- **Сложност:** ⭐-⭐⭐⭐⭐ (От начинаещ до напреднал)
- **Какво е включено:**
  - [Master Guide](container-app/README.md) - Пълен преглед на разгръщанията на контейнери
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Пример за базово REST API
  - [Microservices Architecture](../../../examples/container-app/microservices) - Производствено готово многосервисно разгръщане
  - Бърз старт, производствени и напреднали модели
  - Мониторинг, сигурност и оптимизация на разходите

**Бърз старт:**
```bash
# Вижте главното ръководство
cd examples/container-app

# Разположете прост Flask API
cd simple-flask-api
azd up

# Разположете пример за микросървиси
cd ../microservices
azd up
```

**Технологии:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Пълна реализация, готова за производство, включена в това хранилище**

- **Местоположение:** `examples/retail-multiagent-arm-template/`
- **Сложност:** ⭐⭐⭐⭐ (Напреднал)
- **Какво е включено:**
  - Пълен ARM шаблон за разгръщане
  - Многоагентна архитектура (Клиент + Инвентар)
  - Интеграция с Azure OpenAI
  - AI Search с RAG
  - Изчерпателен мониторинг
  - Скрипт за еднократно разгръщане

**Бърз старт:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Технологии:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Външни Azure Samples (Клонирайте за използване)

Следните примери се поддържат в официалните хранилища Azure-Samples. Клонирайте ги, за да разгледате различни AZD модели:

### Прости приложения (Глави 1-2)

| Шаблон | Хранилище | Сложност | Услуги |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Локално: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Микросървиси** | [Локално: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Многосервисно, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Как да използвате:**
```bash
# Клонирайте произволен пример
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Разгърнете
azd up
```

### Примери за AI приложения (Глави 2, 5, 8)

| Шаблон | Хранилище | Сложност | Фокус |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Локално: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Разгръщане на GPT-4 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Основен AI чат |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Агентна рамка |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG модел |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Предприятелски AI |

### База данни и напреднали модели (Глави 3-8)

| Шаблон | Хранилище | Сложност | Фокус |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Интеграция с база данни |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL без сървър |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Многосервисно |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Цели за учене

Когато работите чрез тези примери, вие ще:
- Практикувате работни потоци на Azure Developer CLI с реалистични сценарии на приложения
- Разберете различни архитектури на приложения и техните azd реализации
- Овладеете модели "Infrastructure as Code" за различни Azure услуги
- Приложите управление на конфигурации и стратегии за разгръщане специфични за среди
- Изпълните модели за мониторинг, сигурност и скалиране в практичен контекст
- Натрупате опит в отстраняване на грешки и дебъгване на реални сценарии за разгръщане

## Резултати от ученето

След приключване на тези примери, ще можете да:
- Разгръщате различни типове приложения с помощта на Azure Developer CLI уверено
- Адаптирате предоставените шаблони към изискванията на вашето приложение
- Проектирате и реализирате персонализирани инфраструктурни модели с Bicep
- Конфигурирате сложни многосервисни приложения със съответните зависимости
- Приложите добри практики за сигурност, мониторинг и производителност в реални сценарии
- Отстранявате проблеми и оптимизирате разгръщания въз основа на практически опит

## Структура на директориите

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

## Примери за бърз старт

> **💡 Нови в AZD?** Започнете с пример #1 (Flask API) - отнема ~20 минути и преподава основните концепции.

### За начинаещи
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Локално) ⭐  
   Разгръщане на просто REST API с мащабиране до нула  
   **Време:** 20-25 минути | **Цена:** $0-5/месец  
   **Какво ще научите:** Основен azd работен поток, контейнеризация, health probes  
   **Очакван резултат:** Работещ API крайна точка, връща "Hello, World!" с мониторинг

2. **[Просто уеб приложение - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Разгръщане на Node.js Express уеб приложение с MongoDB  
   **Време:** 25-35 минути | **Цена:** $10-30/месец  
   **Какво ще научите:** Интеграция с база данни, променливи на средата, connection string-и  
   **Очакван резултат:** Приложение за списък със задачи с функции за създаване/четене/обновяване/изтриване

3. **[Статичен уебсайт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Хостинг на React статичен сайт с Azure Static Web Apps  
   **Време:** 20-30 минути | **Цена:** $0-10/месец  
   **Какво ще научите:** Статичен хостинг, безсървърни функции, разгръщане в CDN  
   **Очакван резултат:** React UI с API бекенд, автоматичен SSL, глобален CDN

### За средно напреднали
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (Локално) ⭐⭐  
   Разгръщане на GPT-4 с чат интерфейс и сигурно управление на API ключове  
   **Време:** 35-45 минути | **Цена:** $50-200/месец  
   **Какво ще научите:** Разгръщане на Azure OpenAI, интеграция с Key Vault, проследяване на токени  
   **Очакван резултат:** Работещо чат приложение с GPT-4 и мониторинг на разходите

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Локално) ⭐⭐⭐⭐  
   Производствено готова многосервисна архитектура  
   **Време:** 45-60 минути | **Цена:** $50-150/месец  
   **Какво ще научите:** Комуникация между услуги, опашки за съобщения, разпределено трасиране  
   **Очакван резултат:** Система от 2 услуги (API Gateway + Product Service) с мониторинг

6. **[Database App - C# с Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Уеб приложение с C# API и Azure SQL база данни  
   **Време:** 30-45 минути | **Цена:** $20-80/месец  
   **Какво ще научите:** Entity Framework, миграции на база данни, сигурност на връзките  
   **Очакван резултат:** C# API с Azure SQL бекенд, автоматично разгръщане на схема

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions с HTTP тригъри и Cosmos DB  
   **Време:** 30-40 минути | **Цена:** $10-40/месец  
   **Какво ще научите:** Събитийно ориентирана архитектура, безсървърно мащабиране, интеграция с NoSQL  
   **Очакван резултат:** Function app, отговарящ на HTTP заявки с хранилище в Cosmos DB

8. **[Микросървиси - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Многосервисно Java приложение с Container Apps и API gateway  
   **Време:** 60-90 минути | **Цена:** $80-200/месец  
   **Какво ще научите:** Разгръщане на Spring Boot, service mesh, балансиране на натоварването  
   **Очакван резултат:** Многосервисна Java система с откриване на услуги и маршрутизация

### Microsoft Foundry шаблони

1. **[Azure OpenAI Chat App - Локален пример](../../../examples/azure-openai-chat)** ⭐⭐  
   Пълно разгръщане на GPT-4 с чат интерфейс  
   **Време:** 35-45 минути | **Цена:** $50-200/месец  
   **Очакван резултат:** Работещо чат приложение с проследяване на токени и мониторинг на разходите

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Интелигентно чат приложение с RAG архитектура  
   **Време:** 60-90 минути | **Цена:** $100-300/месец  
   **Очакван резултат:** Чат интерфейс, задвижван от RAG, с търсене в документи и цитирания

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Анализ на документи с помощта на Azure AI услуги  
   **Време:** 40-60 минути | **Цена:** $20-80/месец  
   **Очакван резултат:** API, извличащ текст, таблици и ентитети от качени документи

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps работен поток с Azure Machine Learning  
   **Време:** 2-3 часа | **Цена:** $150-500/месец  
   **Очакван резултат:** Автоматизиран ML pipeline с обучение, разгръщане и мониторинг

### Реални сценарии

#### **Retail Multi-Agent Solution** 🆕
**[Пълно ръководство за реализация](./retail-scenario.md)**

Изчерпателно, готово за производство многоагентно решение за поддръжка на клиенти, което демонстрира предприятелско ниво на разгръщане на AI приложения с AZD. Този сценарий предоставя:

- **Пълна архитектура**: Многоагентна система със специализирани агенти за обслужване на клиенти и управление на инвентара
- **Production Infrastructure**: Многорегионни разгръщания на Azure OpenAI, AI Search, Container Apps и цялостно наблюдение
- **Ready-to-Deploy ARM Template**: Разгръщане с един клик с няколко режима на конфигурация (Minimal/Standard/Premium)
- **Advanced Features**: Валидиране на сигурността чрез red teaming, рамка за оценка на агенти, оптимизация на разходите и ръководства за отстраняване на проблеми
- **Real Business Context**: Сценарий за обслужване на клиенти на търговец с качване на файлове, интеграция на търсене и динамично скалиране

**Technologies**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Напреднало - Готово за корпоративно производство)

**Perfect for**: AI разработчици, архитекти на решения и екипи, изграждащи производствени мултиагентни системи

**Quick Start**: Разположете цялото решение за по-малко от 30 минути, използвайки включения ARM шаблон с `./deploy.sh -g myResourceGroup`

## 📋 Инструкции за използване

### Предварителни изисквания

Before running any example:
- ✅ Абонамент за Azure с достъп Owner или Contributor
- ✅ Инсталиран Azure Developer CLI ([Ръководство за инсталиране](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop стартиран (за примери с контейнери)
- ✅ Подходящи квоти в Azure (проверете изискванията за всеки пример)

> **💰 Предупреждение за разходи:** Всички примери създават реални ресурси в Azure, които носят такси. Вижте отделните README файлове за оценка на разходите. Не забравяйте да изпълните `azd down` след приключване, за да избегнете продължаващи разходи.

### Стартиране на примерите локално

1. **Клониране или копиране на примера**
   ```bash
   # Отидете до желания пример
   cd examples/simple-web-app
   ```

2. **Инициализиране на AZD средата**
   ```bash
   # Инициализирайте с наличен шаблон
   azd init
   
   # Или създайте нова среда
   azd env new my-environment
   ```

3. **Конфигуриране на средата**
   ```bash
   # Задайте необходимите променливи
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Разгръщане**
   ```bash
   # Разположете инфраструктурата и приложението
   azd up
   ```

5. **Проверка на разгръщането**
   ```bash
   # Вземете крайните точки на услугата
   azd env get-values
   
   # Тествайте крайната точка (пример)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Очаквани индикатори за успех:**
   - ✅ `azd up` завършва без грешки
   - ✅ Крайната точка на услугата връща HTTP 200
   - ✅ Azure Portal показва статус "Running"
   - ✅ Application Insights получава телеметрия

> **⚠️ Проблеми?** Вижте [Чести проблеми](../docs/chapter-07-troubleshooting/common-issues.md) за отстраняване на неизправности при разгръщане

### Адаптиране на примерите

Всеки пример включва:
- **README.md** - Подробни инструкции за настройка и персонализация
- **azure.yaml** - AZD конфигурация с коментари
- **infra/** - Bicep шаблони с обяснения на параметрите
- **src/** - Примерен код на приложението
- **scripts/** - Помощни скриптове за често срещани задачи

## 🎯 Цели на обучението

### Категории примери

#### **Основни разгръщания**
- Приложения с една услуга
- Прости инфраструктурни модели
- Основно управление на конфигурации
- Икономични конфигурации за разработка

#### **Разширени сценарии**
- Архитектури с множество услуги
- Сложни мрежови конфигурации
- Модели за интеграция на бази данни
- Реализации на сигурност и съответствие

#### **Модели, готови за продукция**
- Конфигурации за висока наличност
- Наблюдение и наблюдаемост
- Интеграция CI/CD
- Конфигурации за възстановяване при бедствия

## 📖 Описания на примерите

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Начално ниво  
**Concepts**: Основно разгръщане, REST API, интеграция с NoSQL база данни

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Начално ниво  
**Concepts**: Статичен хостинг, безсървъсен бекенд, съвременно уеб разработване

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Начално ниво  
**Concepts**: Контейнеризация, REST API, скалиране до нула, health probes, мониторинг  
**Location**: [Локален пример](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Напреднало ниво  
**Concepts**: Мулти-сервисна архитектура, комуникация между услуги, опашки за съобщения, разпределено трасиране  
**Location**: [Локален пример](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: Средно ниво  
**Concepts**: Entity Framework, връзки към бази данни, разработка на web API

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: Средно ниво  
**Concepts**: Събитийно-ориентирана архитектура, безсървърни изчисления, full-stack разработка

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: Средно ниво  
**Concepts**: Комуникация между микросървиси, разпределени системи, корпоративни модели

### Microsoft Foundry Examples

#### Azure OpenAI Chat App
**Technologies**: Azure OpenAI, Cognitive Search, App Service  
**Complexity**: Средно ниво  
**Concepts**: Архитектура RAG, векторно търсене, интеграция с LLM

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Средно ниво  
**Concepts**: Анализ на документи, OCR, извличане на данни

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Напреднало ниво  
**Concepts**: Обучение на модели, пайплайни за разгръщане, мониторинг

## 🛠 Примери за конфигурация

The `configurations/` directory contains reusable components:

### Environment Configurations
- Настройки за развойна среда
- Конфигурации за тестова (staging) среда
- Конфигурации, готови за продукция
- Настройки за разгръщане в множество региони

### Bicep Modules
- Повторно използваеми компоненти на инфраструктурата
- Често срещани модели на ресурси
- Шаблони с подсилена сигурност
- Конфигурации оптимизирани за разходи

### Helper Scripts
- Автоматизация на настройката на средата
- Скриптове за миграция на бази данни
- Инструменти за валидиране на разгръщането
- Инструменти за мониторинг на разходите

## 🔧 Ръководство за персонализиране

### Адаптиране на примерите за вашия случай на употреба

1. **Прегледайте предварителните изисквания**
   - Проверете изискванията за услугите в Azure
   - Потвърдете лимитите на абонамента
   - Разберете въздействието върху разходите

2. **Модифицирайте конфигурацията**
   - Актуализирайте дефинициите на услуги в `azure.yaml`
   - Персонализирайте Bicep шаблоните
   - Настройте променливите на средата

3. **Тествайте щателно**
   - Разположете първо в развойна среда
   - Потвърдете функционалността
   - Тествайте скалирането и производителността

4. **Преглед на сигурността**
   - Прегледайте контролите за достъп
   - Внедрете управление на тайни
   - Включете мониторинг и алармиране

## 📊 Матрица за сравнение

| Пример | Услуги | База данни | Удостоверяване | Мониторинг | Сложност |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Локално) | 2 | ❌ | Key Vault | Пълен | ⭐⭐ |
| **Python Flask API** (Локално) | 1 | ❌ | Основно | Пълен | ⭐ |
| **Microservices** (Локално) | 5+ | ✅ | Корпоративно | Напреднало | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Основно | Основно | ⭐ |
| React SPA + Functions | 3 | ✅ | Основно | Пълен | ⭐ |
| Python Flask Container | 2 | ❌ | Основно | Пълен | ⭐ |
| C# Web API + SQL | 2 | ✅ | Пълен | Пълен | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Пълен | Пълен | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Пълен | Пълен | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Пълен | Пълен | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Основно | Пълен | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Пълен | Пълен | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Локално) | **8+** | **✅** | **Корпоративно** | **Напреднало** | **⭐⭐⭐⭐** |

## 🎓 Път на обучение

### Препоръчителна последователност

1. **Започнете с просто уеб приложение**
   - Научете основните концепции на AZD
   - Разберете работния процес за разгръщане
   - Практикувайте управление на среди

2. **Опитайте статичен уебсайт**
   - Проучете различни опции за хостинг
   - Научете за интеграция с CDN
   - Разберете конфигурацията на DNS

3. **Преминете към Container App**
   - Научете основите на контейнеризацията
   - Разберете концепциите за скалиране
   - Практикувайте с Docker

4. **Добавете интеграция с база данни**
   - Научете как да провизирате бази данни
   - Разберете connection strings
   - Практикувайте управление на тайни

5. **Изследвайте безсървърните решения**
   - Разберете събитийно-ориентираната архитектура
   - Научете за тригъри и биндинги
   - Практикувайте с API-та

6. **Създайте микросървиси**
   - Научете комуникация между услуги
   - Разберете разпределените системи
   - Практикувайте сложни разгръщания

## 🔍 Намиране на подходящия пример

### По технологичен стек
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

### По архитектурен модел
- **Simple REST API**: [Python Flask API (Локално)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Локално)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Локално)](../../../examples/container-app/simple-flask-api), [Microservices (Локално)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Локално)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### По ниво на сложност
- **Начално ниво**: [Python Flask API (Локално)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Средно ниво**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Напреднало**: ML Pipeline
- **Готово за корпоративно производство**: [Microservices (Локално)](../../../examples/container-app/microservices) (Мултиуслуги с опашки за съобщения), **Retail Multi-Agent Solution** (Пълна мултиагентна система с ARM шаблон за разгръщане)

## 📚 Допълнителни ресурси

### Връзки към документация
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Примери от общността
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo приложение с Node.js и PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React уеб приложение с C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Задача Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions с Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Най-добри практики
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Допринасяне на примери

Имате полезен пример за споделяне? Ще се радваме на вашия принос!

### Указания за подаване
1. Спазвайте установената структура на директориите
2. Включете изчерпателен README.md
3. Добавете коментари в конфигурационните файлове
4. Тествайте внимателно преди подаване
5. Включете оценки на разходите и предварителни изисквания

### Примерна структура на шаблона
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

**Професионален съвет**: Започнете с най-простия пример, който съответства на вашия технологичен стек, след което постепенно преминавайте към по-сложни сценарии. Всеки пример надгражда концепции от предишните!

## 🚀 Готови да започнете?

### Вашият учебен път

1. **Напълно начинаещ?** → Започнете с [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 мин)
2. **Имате основни познания за AZD?** → Опитайте [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 мин)
3. **Създавате AI приложения?** → Започнете с [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 мин) или разгледайте [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ часа)
4. **Нуждаете се от конкретен технологичен стек?** → Използвайте секцията [Намиране на подходящия пример](../../../examples) по-горе

### Следващи стъпки

- ✅ Прегледайте [Предварителните изисквания](../../../examples) по-горе
- ✅ Изберете пример, който отговаря на вашето ниво на умения (вижте [Легенда за сложността](../../../examples))
- ✅ Прочетете внимателно README на примера преди разгръщането
- ✅ Задайте напомняне да стартирате `azd down` след тестване
- ✅ Споделете своя опит чрез GitHub Issues или Discussions

### Нуждаете се от помощ?

- 📖 [FAQ](../resources/faq.md) - Отговори на често задавани въпроси
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - Отстраняване на проблеми при разгръщане
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Попитайте общността
- 📚 [Study Guide](../resources/study-guide.md) - Затвърдете знанията си

---

**Навигация**
- **📚 Начало на курса**: [AZD For Beginners](../README.md)
- **📖 Учебни материали**: [Учебно ръководство](../resources/study-guide.md) | [Шпаргалка](../resources/cheat-sheet.md) | [Речник](../resources/glossary.md)
- **🔧 Ресурси**: [FAQ](../resources/faq.md) | [Отстраняване на проблеми](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Последна актуализация: November 2025 | [Докладвайте проблеми](https://github.com/microsoft/AZD-for-beginners/issues) | [Допринасяне на примери](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Отказ от отговорност:
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за никакви недоразумения или погрешни тълкувания, възникнали в резултат на използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->