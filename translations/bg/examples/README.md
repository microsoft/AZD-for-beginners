# Примери - Практически AZD шаблони и конфигурации

**Учете чрез примери - Организирано по глава**
- **📚 Начало на курса**: [AZD за начинаещи](../README.md)
- **📖 Карта на главите**: Примери, организирани по сложност на изучаване
- **🚀 Локален пример**: [Решение за търговия с много агенти](retail-scenario.md)
- **🤖 Външни AI примери**: Връзки към хранилища с примери на Azure

> **📍 ВАЖНО: Локални спрямо външни примери**  
> Това хранилище съдържа **4 пълни локални примера** с пълни имплементации:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 внедряване с чат интерфейс)  
> - **Container Apps** (Прост Flask API + Микросървиси)  
> - **Database App** (Уеб + SQL база данни)  
> - **Retail Multi-Agent** (Корпоративно AI решение)  
>  
> Допълнителните примери са **външни препратки** към репозитории в Azure-Samples, които можете да клонирате.

## Въведение

Тази директория предоставя практически примери и препратки, които да ви помогнат да научите Azure Developer CLI чрез практически упражнения. Сценарият Retail Multi-Agent е пълна, готова за продукция имплементация, включена в това хранилище. Допълнителните примери посочват официални Azure Samples, които демонстрират различни AZD шаблони.

### Легенда за оценка на сложността

- ⭐ **Начинаещ** - Основни концепции, една услуга, 15-30 минути
- ⭐⭐ **Средно ниво** - Няколко услуги, интеграция на база данни, 30-60 минути
- ⭐⭐⭐ **Напреднало** - Сложна архитектура, интеграция на AI, 1-2 часа
- ⭐⭐⭐⭐ **Експерт** - Готово за производство, корпоративни модели, 2+ часа

## 🎯 Какво всъщност има в това хранилище

### ✅ Локална имплементация (Готова за използване)

#### [Приложение Microsoft Foundry Models Chat](azure-openai-chat/README.md) 🆕
**Пълно внедряване на gpt-4.1 с включен чат интерфейс в това хранилище**

- **Местоположение:** `examples/azure-openai-chat/`
- **Сложност:** ⭐⭐ (Средно ниво)
- **Какво е включено:**
  - Пълно внедряване на Microsoft Foundry Models (gpt-4.1)
  - Python чат интерфейс през командния ред
  - Интеграция с Key Vault за защитени API ключове
  - Bicep шаблони за инфраструктура
  - Проследяване на използване на токени и разходи
  - Ограничаване на честота и обработка на грешки

**Бърз старт:**
```bash
# Навигирайте до example
cd examples/azure-openai-chat

# Разположете всичко
azd up

# Инсталирайте зависимостите и започнете да чатите
pip install -r src/requirements.txt
python src/chat.py
```

**Технологии:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Примери за Container App](container-app/README.md) 🆕
**Изчерпателни примери за разгръщане на контейнери, включени в това хранилище**

- **Местоположение:** `examples/container-app/`
- **Сложност:** ⭐-⭐⭐⭐⭐ (От начинаещ до напреднал)
- **Какво е включено:**
  - [Ръководство](container-app/README.md) - Пълен преглед на контейнерните внедрявания
  - [Прост Flask API](../../../examples/container-app/simple-flask-api) - Основен REST API пример
  - [Архитектура с микросървиси](../../../examples/container-app/microservices) - Готово за продукция мулти-сървис внедряване
  - Бърз старт, производствени и напреднали шаблони
  - Наблюдение, сигурност и оптимизация на разходите

**Бърз старт:**
```bash
# Прегледайте основното ръководство
cd examples/container-app

# Разгърнете прост API на Flask
cd simple-flask-api
azd up

# Разгърнете пример с микросървиси
cd ../microservices
azd up
```

**Технологии:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent решение](retail-scenario.md) 🆕
**Пълна, готова за продукция имплементация, включена в това хранилище**

- **Местоположение:** `examples/retail-multiagent-arm-template/`
- **Сложност:** ⭐⭐⭐⭐ (Напреднало)
- **Какво е включено:**
  - Пълен ARM шаблон за внедряване
  - Многоагентна архитектура (Клиент + Инвентар)
  - Интеграция с Microsoft Foundry Models
  - AI търсене с RAG
  - Изчерпателно наблюдение
  - Скрипт за внедряване с един клик

**Бърз старт:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Технологии:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Външни примери на Azure (клонирайте за използване)

Следните примери се поддържат в официалните репозитории Azure-Samples. Клонирайте ги, за да разгледате различни AZD шаблони:

### Прости приложения (Глави 1-2)

| Шаблон | Репозитория | Сложност | Услуги |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Локално: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Локално: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Многосервизно, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Как да използвате:**
```bash
# Клонирай произволен пример
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Разположи
azd up
```

### AI примерни приложения (Глави 2, 5, 8)

| Шаблон | Репозитория | Сложност | Фокус |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Локално: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | внедряване на gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Основен AI чат |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Агентна рамка |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG шаблон |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Корпоративен AI |

### Бази данни и напреднали шаблони (Глави 3-8)

| Шаблон | Репозитория | Сложност | Фокус |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Интеграция с бази данни |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Мулти-сървис |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Цели за обучение

Като работите през тези примери, ще:
- Практикувате работни потоци на Azure Developer CLI с реалистични приложения
- Разберете различни архитектури на приложения и техните azd имплементации
- Усвоите шаблони Infrastructure as Code за различни Azure услуги
- Приложите управление на конфигурации и стратегии за внедряване специфични за средата
- Имплементирате наблюдение, сигурност и модели за мащабиране в практически контексти
- Натрупате опит в отстраняване на грешки и дебъгване в реални сценарии на внедряване

## Резултати от обучението

След завършване на тези примери ще можете да:
- Внедрявате различни типове приложения с Azure Developer CLI уверено
- Адаптирате предоставените шаблони към вашите собствени изисквания за приложение
- Проектирате и имплементирате персонализирани инфраструктурни шаблони с Bicep
- Конфигурирате сложни мулти-сървис приложения със съответните зависимости
- Прилагате най-добри практики за сигурност, наблюдение и производителност в реални сценарии
- Отстранявате и оптимизирате внедрявания въз основа на практичен опит

## Структура на директорията

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

> **💡 Нов в AZD?** Започнете с пример #1 (Flask API) - отнема ~20 минути и обяснява основните концепции.

### За начинаещи
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Локално) ⭐  
   Разположете прост REST API с мащабиране до нула  
   **Време:** 20-25 минути | **Цена:** $0-5/месец  
   **Какво ще научите:** Основен azd работен поток, контейнеризация, health probes  
   **Очакван резултат:** Работещ API краен точка, връщаща "Hello, World!" с наблюдение

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Разположете Node.js Express уеб приложение с MongoDB  
   **Време:** 25-35 минути | **Цена:** $10-30/месец  
   **Какво ще научите:** Интеграция с база данни, променливи на средата, connection strings  
   **Очакван резултат:** Приложение за списък със задачи с функции за създаване/четене/актуализиране/изтриване

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Хоствайте React статичен уебсайт с Azure Static Web Apps  
   **Време:** 20-30 минути | **Цена:** $0-10/месец  
   **Какво ще научите:** Статично хостване, serverless функции, разгръщане в CDN  
   **Очакван резултат:** React UI с API бекенд, автоматичен SSL, глобален CDN

### За средно напреднали
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Локално) ⭐⭐  
   Разположете gpt-4.1 с чат интерфейс и сигурно управление на API ключове  
   **Време:** 35-45 минути | **Цена:** $50-200/месец  
   **Какво ще научите:** Внедряване на Microsoft Foundry Models, интеграция с Key Vault, проследяване на токени  
   **Очакван резултат:** Работещо чат приложение с gpt-4.1 и мониторинг на разходите

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Локално) ⭐⭐⭐⭐  
   Производствено готова мулти-сървис архитектура  
   **Време:** 45-60 минути | **Цена:** $50-150/месец  
   **Какво ще научите:** Комуникация между услуги, опашки за съобщения, разпределено проследяване  
   **Очакван резултат:** Система с 2 услуги (API Gateway + Product Service) с наблюдение

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Уеб приложение с C# API и Azure SQL база данни  
   **Време:** 30-45 минути | **Цена:** $20-80/месец  
   **Какво ще научите:** Entity Framework, миграции на база данни, сигурност на връзките  
   **Очакван резултат:** C# API с Azure SQL бекенд, автоматично разгръщане на схема

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions с HTTP тригери и Cosmos DB  
   **Време:** 30-40 минути | **Цена:** $10-40/месец  
   **Какво ще научите:** Събитийно-известна архитектура, serverless мащабиране, NoSQL интеграция  
   **Очакван резултат:** Function app, отговарящ на HTTP заявки с Cosmos DB съхранение

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Мулти-сървис Java приложение с Container Apps и API gateway  
   **Време:** 60-90 минути | **Цена:** $80-200/месец  
   **Какво ще научите:** Разгръщане на Spring Boot, service mesh, балансиране на натоварването  
   **Очакван резултат:** Мулти-сървис Java система с откриване на услуги и маршрутизация

### Шаблони на Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Пълно внедряване на gpt-4.1 с чат интерфейс  
   **Време:** 35-45 минути | **Цена:** $50-200/месец  
   **Очакван резултат:** Работещо чат приложение с проследяване на токени и мониторинг на разходите

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Интелигентно чат приложение с RAG архитектура  
   **Време:** 60-90 минути | **Цена:** $100-300/месец  
   **Очакван резултат:** Чат интерфейс с поддръжка на RAG, търсене в документи и цитиране

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Анализ на документи с помощта на Azure AI услуги  
   **Време:** 40-60 минути | **Цена:** $20-80/месец  
   **Очакван резултат:** API, извличащо текст, таблици и ентитети от качени документи

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps работен поток с Azure Machine Learning  
   **Време:** 2-3 часа | **Цена:** $150-500/месец  
   **Очакван резултат:** Автоматизиран ML pipeline с трениране, внедряване и мониторинг

### Реални сценарии

#### **Retail Multi-Agent Solution** 🆕
**[Пълен наръчник за имплементация](./retail-scenario.md)**

Всеобхватно, готово за продукция многоагентно решение за обслужване на клиенти, което демонстрира внедряване на корпоративни AI приложения с AZD. Този сценарий предоставя:

- **Пълна архитектура**: Многоагентна система със специализирани агенти за обслужване на клиенти и управление на инвентара
- **Производствена инфраструктура**: Разгръщания на Microsoft Foundry Models в множество региони, AI Search, Container Apps и цялостно наблюдение
- **ARM шаблон готов за разгръщане**: Разгръщане с едно кликване с няколко режима на конфигурация (Minimal/Standard/Premium)
- **Разширени функции**: Валидиране на сигурността чрез red teaming, рамка за оценка на агенти, оптимизация на разходите и ръководства за отстраняване на проблеми
- **Реален бизнес контекст**: Сценарий за поддръжка на клиенти на търговец на дребно с качване на файлове, интеграция на търсене и динамично мащабиране

**Технологии**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Сложност**: ⭐⭐⭐⭐ (Разширено - Готово за корпоративна продукция)

**Идеално за**: AI разработчици, архитекти на решения и екипи, изграждащи производствени мултиагентни системи

**Бърз старт**: Разположете пълното решение за по-малко от 30 минути, използвайки включения ARM шаблон с `./deploy.sh -g myResourceGroup`

## 📋 Инструкции за използване

### Предпоставки

Преди да стартирате който и да е пример:
- ✅ Абонамент за Azure с роля Owner или Contributor
- ✅ Инсталиран Azure Developer CLI ([Инсталационно ръководство](../docs/chapter-01-foundation/installation.md))
- ✅ Стартиран Docker Desktop (за примери с контейнери)
- ✅ Подходящи квоти в Azure (проверете изискванията за конкретния пример)

> **💰 Предупреждение за разходи:** Всички примери създават реални ресурси в Azure, които носят разходи. Вижте отделните README файлове за оценки на разходите. Не забравяйте да изпълните `azd down` след като приключите, за да избегнете продължаващи разходи.

### Стартиране на примерите локално

1. **Клонирайте или копирайте примера**
   ```bash
   # Отидете до желания пример
   cd examples/simple-web-app
   ```

2. **Инициализирайте AZD среда**
   ```bash
   # Инициализирайте със съществуващ шаблон
   azd init
   
   # Или създайте нова среда
   azd env new my-environment
   ```

3. **Конфигурирайте средата**
   ```bash
   # Задайте необходимите променливи
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Разгърнете**
   ```bash
   # Разгръщане на инфраструктурата и приложението
   azd up
   ```

5. **Проверете разгръщането**
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

> **⚠️ Проблеми?** Вижте [Чести проблеми](../docs/chapter-07-troubleshooting/common-issues.md) за отстраняване на проблеми при разгръщане

### Адаптиране на примерите

Всеки пример включва:
- **README.md** - Подробни инструкции за настройка и персонализиране
- **azure.yaml** - AZD конфигурация с коментари
- **infra/** - Bicep шаблони с обяснения за параметрите
- **src/** - Примерен код на приложението
- **scripts/** - Помощни скриптове за често срещани задачи

## 🎯 Учебни цели

### Категории примери

#### **Основни разгръщания**
- Приложения с една услуга
- Прости инфраструктурни шаблони
- Основно управление на конфигурации
- Икономични среди за разработка

#### **Разширени сценарии**
- Архитектури с множество услуги
- Сложни мрежови конфигурации
- Шаблони за интеграция с бази данни
- Реализации на сигурност и съответствие

#### **Шаблони готови за продукция**
- Конфигурации за висока наличност
- Наблюдение и наблюдаемост
- Интеграция CI/CD
- Конфигурации за възстановяване при бедствия

## 📖 Описания на примерите

### Simple Web App - Node.js Express
**Технологии**: Node.js, Express, MongoDB, Container Apps  
**Сложност**: Начинаещ  
**Концепции**: Основно разгръщане, REST API, интеграция с NoSQL база данни

### Static Website - React SPA
**Технологии**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Сложност**: Начинаещ  
**Концепции**: Статично хостване, безсървърен бекенд, модерна уеб разработка

### Контейнерно приложение - Python Flask
**Технологии**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Сложност**: Начинаещ  
**Концепции**: Контейнеризация, REST API, мащабиране до нула, проверки за здраве, наблюдение  
**Местоположение**: [Локален пример](../../../examples/container-app/simple-flask-api)

### Контейнерно приложение - Микросервизна архитектура
**Технологии**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Сложност**: Разширено  
**Концепции**: Архитектура с множество услуги, комуникация между услуги, опашки за съобщения, разпределено проследяване  
**Местоположение**: [Локален пример](../../../examples/container-app/microservices)

### Приложение с база данни - C# с Azure SQL
**Технологии**: C# ASP.NET Core, Azure SQL Database, App Service  
**Сложност**: Средно ниво  
**Концепции**: Entity Framework, връзки към база данни, разработка на уеб API

### Функция без сървър - Python Azure Functions
**Технологии**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Сложност**: Средно ниво  
**Концепции**: Събитийно-ориентирана архитектура, безсървърни изчисления, full-stack разработка

### Микросервизи - Java Spring Boot
**Технологии**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Сложност**: Средно ниво  
**Концепции**: Комуникация между микросервизи, разпределени системи, корпоративни шаблони

### Примери Microsoft Foundry

#### Чат приложение с Microsoft Foundry Models
**Технологии**: Microsoft Foundry Models, Azure AI Search, App Service  
**Сложност**: Средно ниво  
**Концепции**: RAG архитектура, векторно търсене, интеграция на LLM

#### Обработка на документи с AI
**Технологии**: Azure AI Document Intelligence, Storage, Functions  
**Сложност**: Средно ниво  
**Концепции**: Анализ на документи, OCR, извличане на данни

#### Машинен обучителен конвейер
**Технологии**: Azure ML, MLOps, Container Registry  
**Сложност**: Разширено  
**Концепции**: Обучение на модели, конвейри за разгръщане, наблюдение

## 🛠 Примери за конфигурации

Директорията `configurations/` съдържа преизползваеми компоненти:

### Конфигурации на средата
- Настройки за среда за разработка
- Конфигурации за среди за предварително разполагане (staging)
- Конфигурации готови за продукция
- Настройки за разгръщане в множество региони

### Bicep модули
- Преизползваеми инфраструктурни компоненти
- Чести модели на ресурси
- Шаблони със засилена сигурност
- Конфигурации оптимизирани за разходи

### Помощни скриптове
- Автоматизация на настройката на средата
- Скриптове за миграция на бази данни
- Инструменти за валидация на разгръщането
- Инструменти за наблюдение на разходите

## 🔧 Ръководство за персонализиране

### Адаптиране на примерите за вашия случай

1. **Прегледайте предпоставките**
   - Проверете изискванията на Azure услугите
   - Проверете лимитите на абонамента
   - Разберете последствията за разходите

2. **Променете конфигурацията**
   - Актуализирайте дефинициите на услуги в `azure.yaml`
   - Персонализирайте Bicep шаблоните
   - Коригирайте променливите на средата

3. **Тествайте старателно**
   - Разположете първо в среда за разработка
   - Проверете функционалността
   - Тествайте мащабиране и производителност

4. **Преглед на сигурността**
   - Прегледайте контролите за достъп
   - Внедрете управление на тайни
   - Активирайте наблюдение и алармиране

## 📊 Матрица за сравнение

| Пример | Услуги | База данни | Автентикация | Наблюдение | Сложност |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Локално) | 2 | ❌ | Key Vault | Пълно | ⭐⭐ |
| **Python Flask API** (Локално) | 1 | ❌ | Основно | Пълно | ⭐ |
| **Microservices** (Локално) | 5+ | ✅ | Корпоративна | Разширено | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Основно | Основно | ⭐ |
| React SPA + Functions | 3 | ✅ | Основно | Пълно | ⭐ |
| Python Flask Container | 2 | ❌ | Основно | Пълно | ⭐ |
| C# Web API + SQL | 2 | ✅ | Пълно | Пълно | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Пълно | Пълно | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Пълно | Пълно | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Пълно | Пълно | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Основно | Пълно | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Пълно | Пълно | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Локално) | **8+** | **✅** | **Корпоративна** | **Разширено** | **⭐⭐⭐⭐** |

## 🎓 Път за обучение

### Препоръчана последователност

1. **Започнете с просто уеб приложение**
   - Научете основните концепции на AZD
   - Разберете работния процес за разгръщане
   - Практикувайте управление на средата

2. **Опитайте статичен уебсайт**
   - Изследвайте различни опции за хостинг
   - Научете за интеграция с CDN
   - Разберете конфигурацията на DNS

3. **Преминете към контейнерно приложение**
   - Научете основите на контейнеризацията
   - Разберете концепциите за мащабиране
   - Практикувайте с Docker

4. **Добавете интеграция с база данни**
   - Научете как се предоставя база данни
   - Разберете низове за връзка
   - Практикувайте управление на тайни

5. **Изследвайте безсървърни решения**
   - Разберете събитийно-ориентираната архитектура
   - Научете за тригъри и биндинги
   - Практикувайте с API-та

6. **Изградете микросервизи**
   - Научете комуникация между услуги
   - Разберете разпределени системи
   - Практикувайте сложни разгръщания

## 🔍 Намиране на правилния пример

### По технологичен стек
- **Container Apps**: [Python Flask API (Локално)](../../../examples/container-app/simple-flask-api), [Microservices (Локално)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Локално)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Локално)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Локално)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Локално)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Локално)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Локално)](../../../examples/container-app/simple-flask-api), [Microservices (Локално)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Локално)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Локално)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Локално)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Локално)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### По архитектурен модел
- **Simple REST API**: [Python Flask API (Локално)](../../../examples/container-app/simple-flask-api)
- **Монолитен**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Локално)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Локално)](../../../examples/container-app/simple-flask-api), [Microservices (Локално)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Локално)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Архитектура с много агенти**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Локално)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### По ниво на сложност
- **Начинаещ**: [Python Flask API (Локално)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Средно ниво**: **[Microsoft Foundry Models Chat (Локално)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Разширено**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Локално)](../../../examples/container-app/microservices) (Мултиуслуга с опашки за съобщения), **Retail Multi-Agent Solution** (Пълна мултиагентна система с ARM шаблон за разгръщане)

## 📚 Допълнителни ресурси

### Връзки към документация
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Общностни примери
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App with C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions with Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Добри практики
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Допринасяне на примери

Имате полезен пример за споделяне? Ще се радваме на вашите приноси!

### Насоки за подаване
1. Спазвайте установената структура на директориите
2. Включете изчерпателен README.md
3. Добавете коментари към конфигурационните файлове
4. Тествайте обстойно преди подаване
5. Включете оценки на разходите и предварителните изисквания

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

**Полезен съвет**: Започнете с най-простия пример, който съответства на вашия технологичен стек, след което постепенно преминете към по-сложни сценарии. Всеки пример надгражда концепции от предишните!

## 🚀 Готови да започнете?

### Вашият път на обучение

1. **Напълно начинаещ?** → Започнете с [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 мин)
2. **Имате основни познания за AZD?** → Опитайте [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 мин)
3. **Създавате AI приложения?** → Започнете с [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 мин) или разгледайте [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ часа)
4. **Имате нужда от конкретен технологичен стек?** → Използвайте секцията [Намиране на правилния пример](#-finding-the-right-example) по-горе

### Следващи стъпки

- ✅ Прегледайте [Предварителни изисквания](#предпоставки) по-горе
- ✅ Изберете пример, съответстващ на вашето ниво на умения (вижте [Легенда за сложността](#легенда-за-оценка-на-сложността))
- ✅ Прочетете внимателно README на примера преди разгръщане
- ✅ Настройте напомняне да стартирате `azd down` след тестване
- ✅ Споделете вашия опит чрез GitHub Issues или Discussions

### Нужда от помощ?

- 📖 [FAQ](../resources/faq.md) - Отговори на често задавани въпроси
- 🐛 [Ръководство за отстраняване на проблеми](../docs/chapter-07-troubleshooting/common-issues.md) - Отстраняване на проблеми при разгръщане
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Попитайте общността
- 📚 [Учебно ръководство](../resources/study-guide.md) - Укрепете знанията си

---

**Навигация**
- **📚 Начало на курса**: [AZD For Beginners](../README.md)
- **📖 Учебни материали**: [Учебно ръководство](../resources/study-guide.md) | [Бърз справочник](../resources/cheat-sheet.md) | [Глосар](../resources/glossary.md)
- **🔧 Ресурси**: [FAQ](../resources/faq.md) | [Отстраняване на неизправности](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Последна актуализация: ноември 2025 | [Докладвайте проблеми](https://github.com/microsoft/AZD-for-beginners/issues) | [Допринасяне на примери](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->