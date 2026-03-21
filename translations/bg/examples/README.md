# Examples - Practical AZD Templates and Configurations

**Learning by Example - Organized by Chapter**
- **📚 Course Home**: [AZD за начинаещи](../README.md)
- **📖 Chapter Mapping**: Примери организирани по сложност на обучението
- **🚀 Local Example**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 External AI Examples**: Връзки към Azure Samples хранилища

> **📍 IMPORTANT: Local vs External Examples**  
> Това хранилище съдържа **4 пълни локални примера** с пълни реализации:  
> - **Microsoft Foundry Models Chat** (внедряване на gpt-4.1 с чат интерфейс)  
> - **Container Apps** (Проста Flask API + Микросервизи)  
> - **Database App** (Уеб + SQL база данни)  
> - **Retail Multi-Agent** (Enterprise AI решение)  
>  
> Допълнителните примери са **външни препратки** към Azure-Samples хранилища, които можете да клонирате.

## Introduction

Тази директория предоставя практически примери и препратки, които да ви помогнат да научите Azure Developer CLI чрез практическа работа. Сценарият Retail Multi-Agent е пълна, готова за продукция реализация, включена в това хранилище. Допълнителните примери се позовават на официални Azure Samples, които демонстрират различни AZD шаблони.

### Complexity Rating Legend

- ⭐ **Начинаещ** - Основни понятия, единична услуга, 15-30 минути
- ⭐⭐ **Средно ниво** - Множество услуги, интеграция на база данни, 30-60 минути
- ⭐⭐⭐ **Напреднал** - Сложна архитектура, AI интеграция, 1-2 часа
- ⭐⭐⭐⭐ **Експерт** - Готово за продукция, корпоративни шаблони, 2+ часа

## 🎯 What's Actually in This Repository

### ✅ Local Implementation (Ready to Use)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**Пълно внедряване на gpt-4.1 с чат интерфейс, включено в това хранилище**

- **Location:** `examples/azure-openai-chat/`
- **Complexity:** ⭐⭐ (Средно ниво)
- **What's Included:**
  - Пълно внедряване на Microsoft Foundry Models (gpt-4.1)
  - Интерфейс за чат чрез командния ред на Python
  - Интеграция с Key Vault за сигурни API ключове
  - Bicep инфраструктурни шаблони
  - Проследяване на използване на токени и разходи
  - Ограничаване на честотата и обработка на грешки

**Quick Start:**
```bash
# Отидете до примера
cd examples/azure-openai-chat

# Разположете всичко
azd up

# Инсталирайте зависимостите и започнете да чатите
pip install -r src/requirements.txt
python src/chat.py
```

**Technologies:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**Цялостни примери за внедряване на контейнери, включени в това хранилище**

- **Location:** `examples/container-app/`
- **Complexity:** ⭐-⭐⭐⭐⭐ (От начинаещ до напреднал)
- **What's Included:**
  - [Master Guide](container-app/README.md) - Пълен преглед на внедряванията на контейнери
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Пример за базово REST API
  - [Microservices Architecture](../../../examples/container-app/microservices) - Готова за продукция многосервисна инсталация
  - Бърз старт, Производство и Разширени модели
  - Мониторинг, сигурност и оптимизация на разходите

**Quick Start:**
```bash
# Вижте главното ръководство
cd examples/container-app

# Разгръщане на прост Flask API
cd simple-flask-api
azd up

# Разгръщане на пример за микросървиси
cd ../microservices
azd up
```

**Technologies:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Пълна реализация, готова за продукция, включена в това хранилище**

- **Location:** `examples/retail-multiagent-arm-template/`
- **Complexity:** ⭐⭐⭐⭐ (Напреднал)
- **What's Included:**
  - Пълен ARM шаблон за внедряване
  - Мултиагентна архитектура (Клиент + Инвентар)
  - Интеграция с Microsoft Foundry Models
  - AI Search с RAG
  - Пълен мониторинг
  - Скрипт за внедряване с един клик

**Quick Start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologies:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 External Azure Samples (Clone to Use)

Следните примери се поддържат в официални Azure-Samples хранилища. Клонирайте ги, за да разгледате различни модели на AZD:

### Simple Applications (Chapters 1-2)

| Шаблон | Репозитория | Сложност | Услуги |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Локално: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Локално: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Многосервисна архитектура, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**How to use:**
```bash
# Клонирайте произволен пример
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Разгърнете
azd up
```

### AI Application Examples (Chapters 2, 5, 8)

| Шаблон | Репозитория | Сложност | Фокус |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Локално: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | внедряване на gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Базов AI чат |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG модел |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database & Advanced Patterns (Chapters 3-8)

| Шаблон | Репозитория | Сложност | Фокус |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Интеграция на база данни |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL без сървъри |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Многосервисна архитектура |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Learning Goals

Чрез работа с тези примери ще:
- Практикувате работни потоци на Azure Developer CLI с реалистични приложения
- Разберете различни архитектури на приложения и техните azd реализации
- Овладеете модели Infrastructure as Code за различни Azure услуги
- Приложите управление на конфигурации и стратегии за внедряване специфични за среди
- Имплементирате модели за мониторинг, сигурност и скалиране в практически контексти
- Натрупате опит в отстраняване на грешки и дебъгване на реални сценарии за внедряване

## Learning Outcomes

След като завършите тези примери, ще можете:
- Уверено да внедрявате различни типове приложения с Azure Developer CLI
- Да адаптирате предоставените шаблони към изискванията на вашето приложение
- Да проектирате и имплементирате персонализирани инфраструктурни шаблони с Bicep
- Да конфигурирате сложни многосервисни приложения с правилни зависимости
- Да приложите най-добри практики за сигурност, мониторинг и производителност в реални сценарии
- Да отстранявате проблеми и оптимизирате внедряванията въз основа на практически опит

## Directory Structure

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

## Quick Start Examples

> **💡 Нов в AZD?** Започнете с пример #1 (Flask API) - отнема ~20 минути и преподава основните концепции.

### For Beginners
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Локално) ⭐  
   Внедрете просто REST API с мащабиране до нула  
   **Time:** 20-25 минути | **Cost:** $0-5/month  
   **Ще научите:** Основен azd работен поток, контейнериране, health probes  
   **Очакван резултат:** Работещ API endpoint, който връща "Hello, World!" с мониторинг

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Внедрете Node.js Express уеб приложение с MongoDB  
   **Time:** 25-35 минути | **Cost:** $10-30/month  
   **Ще научите:** Интеграция на база данни, променливи на средата, connection strings  
   **Очакван резултат:** Приложение за списък със задачи с функции за създаване/четене/актуализиране/изтриване

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Хостнете React статичен сайт с Azure Static Web Apps  
   **Time:** 20-30 минути | **Cost:** $0-10/month  
   **Ще научите:** Статично хостване, безсървърни функции, внедряване в CDN  
   **Очакван резултат:** React UI с API бекенд, автоматичен SSL, глобален CDN

### For Intermediate Users
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Локално) ⭐⭐  
   Внедрете gpt-4.1 с чат интерфейс и сигурно управление на API ключове  
   **Time:** 35-45 минути | **Cost:** $50-200/month  
   **Ще научите:** Внедряване на Microsoft Foundry Models, интеграция с Key Vault, проследяване на токени  
   **Очакван резултат:** Работещо чат приложение с gpt-4.1 и мониторинг на разходите

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Локално) ⭐⭐⭐⭐  
   Готова за продукция многосервисна архитектура  
   **Time:** 45-60 минути | **Cost:** $50-150/month  
   **Ще научите:** Комуникация между услуги, опашки за съобщения, разпределено проследяване  
   **Очакван резултат:** Система от 2 услуги (API Gateway + Product Service) с мониторинг

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Уеб приложение с C# API и Azure SQL Database  
   **Time:** 30-45 минути | **Cost:** $20-80/month  
   **Ще научите:** Entity Framework, миграции на бази данни, сигурност на връзките  
   **Очакван резултат:** C# API с Azure SQL бекенд, автоматично внедряване на схема

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions с HTTP тригери и Cosmos DB  
   **Time:** 30-40 минути | **Cost:** $10-40/month  
   **Ще научите:** Събитийно ориентирана архитектура, безсървърно мащабиране, NoSQL интеграция  
   **Очакван резултат:** Функционно приложение, отговарящо на HTTP заявки с Cosmos DB хранилище

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Многосервисно Java приложение с Container Apps и API gateway  
   **Time:** 60-90 минути | **Cost:** $80-200/month  
   **Ще научите:** Внедряване на Spring Boot, service mesh, балансировка на натоварването  
   **Очакван резултат:** Многосервисна Java система с откриване на услуги и маршрутизация

### Microsoft Foundry Templates

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Пълно внедряване на gpt-4.1 с чат интерфейс  
   **Time:** 35-45 минути | **Cost:** $50-200/month  
   **Очакван резултат:** Работещо чат приложение с проследяване на токени и мониторинг на разходите

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Умен чат приложение с RAG архитектура  
   **Time:** 60-90 минути | **Cost:** $100-300/month  
   **Очакван резултат:** Чат интерфейс с RAG и търсене в документи с цитиране на източници

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Анализ на документи с помощта на Azure AI услуги  
   **Time:** 40-60 минути | **Cost:** $20-80/month  
   **Очакван резултат:** API, извличащ текст, таблици и ентитети от качени документи

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps работен поток с Azure Machine Learning  
   **Time:** 2-3 часа | **Cost:** $150-500/month  
   **Очакван резултат:** Автоматизиран ML pipeline с обучение, внедряване и мониторинг

### Real-World Scenarios

#### **Retail Multi-Agent Solution** 🆕
**[Пълен Guide за реализация](./retail-scenario.md)**

Всеобхватно, готово за продукция мултиагентно решение за поддръжка на клиенти, което демонстрира внедряване на корпоративно AI приложение с AZD. Този сценарий предоставя:
- **Complete Architecture**: Многоагентна система със специализирани агенти за обслужване на клиенти и управление на инвентара
- **Production Infrastructure**: Разгръщания на Microsoft Foundry Models в няколко региона, AI Search, Container Apps и цялостно наблюдение
- **Ready-to-Deploy ARM Template**: Разгръщане с един клик с няколко режима на конфигурация (Minimal/Standard/Premium)
- **Advanced Features**: Red teaming валидация на сигурността, рамка за оценка на агенти, оптимизация на разходите и ръководства за отстраняване на проблеми
- **Real Business Context**: Сценарий за поддръжка на клиенти на търговец на дребно с качване на файлове, интеграция на търсене и динамично мащабиране

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Разширено - Готово за производство за предприятия)

**Perfect for**: Подходящо за AI разработчици, архитекти на решения и екипи, изграждащи многоагентни системи за продукция

**Quick Start**: Разположете пълното решение за по-малко от 30 минути, използвайки включения ARM шаблон с `./deploy.sh -g myResourceGroup`

## 📋 Инструкции за използване

### Предварителни изисквания

Преди да стартирате какъвто и да е пример:
- ✅ Абонамент за Azure с права Owner или Contributor
- ✅ Azure Developer CLI инсталиран ([Ръководство за инсталиране](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop стартиран (за примери с контейнери)
- ✅ Подходящи квоти в Azure (проверете изискванията за конкретния пример)

> **💰 Внимание за разходи:** Всички примери създават реални ресурси в Azure, за които се начисляват такси. Вижте отделните README файлове за оценки на разходите. Не забравяйте да изпълните `azd down`, когато приключите, за да избегнете продължаващи разходи.

### Стартиране на примерите локално

1. **Клониране или копиране на примера**
   ```bash
   # Отидете до желания пример
   cd examples/simple-web-app
   ```

2. **Инициализиране на AZD средата**
   ```bash
   # Инициализирайте със съществуващ шаблон
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
   # Разгръщане на инфраструктурата и приложението
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
   - ✅ Крайна точка на услугата връща HTTP 200
   - ✅ Azure Portal показва статус "Running"
   - ✅ Application Insights получава телеметрия

> **⚠️ Проблеми?** Вижте [Чести проблеми](../docs/chapter-07-troubleshooting/common-issues.md) за отстраняване на проблеми при разгръщането

### Адаптиране на примерите

Всеки пример включва:
- **README.md** - Подробни инструкции за настройка и персонализация
- **azure.yaml** - AZD конфигурация с коментари
- **infra/** - Bicep шаблони с обяснения на параметрите
- **src/** - Примерен код на приложението
- **scripts/** - Помощни скриптове за често срещани задачи

## 🎯 Цели за обучение

### Категории примери

#### **Основни разгръщания**
- Приложения с единa услуга
- Прости инфраструктурни модели
- Основно управление на конфигурацията
- Икономични разработки

#### **Разширени сценарии**
- Архитектури с множество услуги
- Сложни мрежови конфигурации
- Модели за интеграция с бази данни
- Имплементации за сигурност и съответствие

#### **Шаблони, готови за продукция**
- Конфигурации за висока наличност
- Наблюдение и наблюдаемост
- Интеграция с CI/CD
- Планове за възстановяване при бедствия

## 📖 Описания на примерите

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Начинаещ  
**Concepts**: Основно разгръщане, REST API, интеграция с NoSQL база данни

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Начинаещ  
**Concepts**: Статично хостване, сървърless бекенд, модерен уеб разработка

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Начинаещ  
**Concepts**: Контейнеризация, REST API, scale-to-zero, health probes, наблюдение  
**Location**: [Локален пример](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Разширено  
**Concepts**: Архитектура с множество услуги, комуникация между услуги, опашки за съобщения, разпределено проследяване  
**Location**: [Локален пример](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: Междинно  
**Concepts**: Entity Framework, връзки към бази данни, разработка на уеб API

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: Междинно  
**Concepts**: Събитийно ориентирана архитектура, сървърless изчисления, full-stack разработка

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: Междинно  
**Concepts**: Комуникация между микросервизи, разпределени системи, корпоративни модели

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologies**: Microsoft Foundry Models, Cognitive Search, App Service  
**Complexity**: Междинно  
**Concepts**: RAG архитектура, векторно търсене, интеграция на LLM

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Междинно  
**Concepts**: Анализ на документи, OCR, извличане на данни

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Разширено  
**Concepts**: Обучение на модели, разгръщане на pipeline, наблюдение

## 🛠 Примери за конфигурации

Директорията `configurations/` съдържа многократно използваеми компоненти:

### Конфигурации на среда
- Настройки за среда за разработка
- Конфигурации за staging среда
- Конфигурации готови за продукция
- Настройки за разгръщане в няколко региона

### Bicep модули
- Многократно използваеми инфраструктурни компоненти
- Общи модели за ресурси
- Шаблони със засилена сигурност
- Конфигурации за оптимизация на разходите

### Помощни скриптове
- Автоматизация на настройката на средата
- Скриптове за миграция на бази данни
- Инструменти за валидация на разгръщане
- Инструменти за мониторинг на разходите

## 🔧 Ръководство за персонализация

### Адаптиране на примерите за вашия случай

1. **Прегледайте предварителните изисквания**
   - Проверете изискванията на услугите в Azure
   - Потвърдете лимитите на абонамента
   - Разберете въздействието върху разходите

2. **Променете конфигурацията**
   - Актуализирайте определенията на услугите в `azure.yaml`
   - Персонализирайте Bicep шаблоните
   - Регулирайте променливите на средата

3. **Тествайте обстойно**
   - Разположете първо в среда за разработка
   - Валидирайте функционалността
   - Тествайте мащабируемостта и производителността

4. **Преглед на сигурността**
   - Прегледайте контролите за достъп
   - Имплементирайте управление на тайни
   - Включете наблюдение и алармиране

## 📊 Матрица за сравнение

| Пример | Услуги | База данни | Автентикация | Мониторинг | Сложност |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Локално) | 2 | ❌ | Key Vault | Пълно | ⭐⭐ |
| **Python Flask API** (Локално) | 1 | ❌ | Основно | Пълно | ⭐ |
| **Microservices** (Локално) | 5+ | ✅ | Enterprise | Разширено | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Основно | Основно | ⭐ |
| React SPA + Functions | 3 | ✅ | Основно | Пълно | ⭐ |
| Python Flask Container | 2 | ❌ | Основно | Пълно | ⭐ |
| C# Web API + SQL | 2 | ✅ | Пълно | Пълно | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Пълно | Пълно | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Пълно | Пълно | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Пълно | Пълно | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Основно | Пълно | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Пълно | Пълно | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Локално) | **8+** | **✅** | **Enterprise** | **Разширено** | **⭐⭐⭐⭐** |

## 🎓 Път за обучение

### Препоръчана последователност

1. **Започнете с Проста уеб апликация**
   - Научете основните концепции на AZD
   - Разберете работния поток на разгръщане
   - Практикувайте управление на средите

2. **Опитайте Статичен уебсайт**
   - Изучете различни опции за хостване
   - Научете за интеграция на CDN
   - Разберете DNS конфигурацията

3. **Преминете към Container App**
   - Научете основите на контейнеризацията
   - Разберете концепциите за мащабиране
   - Практикувайте с Docker

4. **Добавете интеграция с база данни**
   - Научете за провизиране на бази данни
   - Разберете connection string-овете
   - Практикувайте управление на тайни

5. **Изследвайте Serverless**
   - Разберете събитийно ориентираната архитектура
   - Научете за тригери и биндинги
   - Практикувайте с API-та

6. **Изградете микросервизи**
   - Научете комуникация между услуги
   - Разберете разпределените системи
   - Практикувайте сложни разгръщания

## 🔍 Как да намерите подходящия пример

### По технологичен стек
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

### По архитектурен модел
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### По ниво на сложност
- **Beginner**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Local)](../../../examples/container-app/microservices) (Многосервисно с опашки за съобщения), **Retail Multi-Agent Solution** (Пълна многоагентна система с ARM шаблон за разгръщане)

## 📚 Допълнителни ресурси

### Връзки към документация
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Примери от общността
- [Azure Samples AZD шаблони](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App с C# и Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App с Python и MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App с Node.js и PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App с C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions с Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Най-добри практики
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Принос на примери

Имате полезен пример за споделяне? Приветстваме вашите приноси!

### Указания за подаване
1. Следвайте установената структура на директориите
2. Включете подробен README.md
3. Добавете коментари към конфигурационните файлове
4. Тестване щателно преди подаване
5. Включете оценки за разходите и предварителни изисквания

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

**Практичен съвет**: Започнете с най-простия пример, който съответства на вашия технологичен стек, след което постепенно преминете към по-сложни сценарии. Всеки пример се надгражда върху концепциите от предишните!

## 🚀 Готови да започнете?

### Вашият учебен път

1. **Пълен начинаещ?** → Започнете с [API с Flask](../../../examples/container-app/simple-flask-api) (⭐, 20 mins)
2. **Имате основни познания за AZD?** → Опитайте [Микросървиси](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 mins)
3. **Създавате AI приложения?** → Започнете с [Чат с Microsoft Foundry Models](../../../examples/azure-openai-chat) (⭐⭐, 35 mins) или разгледайте [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ hours)
4. **Нужен ви е конкретен технологичен стек?** → Използвайте секцията [Намиране на правилния пример](#-finding-the-right-example) по-горе

### Следващи стъпки

- ✅ Прегледайте [Предварителни изисквания](#предварителни-изисквания) по-горе
- ✅ Изберете пример, съответстващ на вашето ниво на умения (вижте [Легенда за сложност](#complexity-rating-legend))
- ✅ Прочетете README на примера внимателно преди разгръщане
- ✅ Настройте напомняне да изпълните `azd down` след тестване
- ✅ Споделете вашия опит чрез GitHub Issues или Discussions

### Имате нужда от помощ?

- 📖 [ЧЗВ](../resources/faq.md) - Отговори на често задавани въпроси
- 🐛 [Ръководство за отстраняване на неизправности](../docs/chapter-07-troubleshooting/common-issues.md) - Отстраняване на проблеми при разгръщане
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Попитайте общността
- 📚 [Учебно ръководство](../resources/study-guide.md) - Укрепете знанията си

---

**Навигация**
- **📚 Начална страница на курса**: [AZD за начинаещи](../README.md)
- **📖 Учебни материали**: [Учебно ръководство](../resources/study-guide.md) | [Шпаргалка](../resources/cheat-sheet.md) | [Речник](../resources/glossary.md)
- **🔧 Ресурси**: [ЧЗВ](../resources/faq.md) | [Отстраняване на неизправности](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Последна актуализация: ноември 2025 г. | [Докладвайте проблеми](https://github.com/microsoft/AZD-for-beginners/issues) | [Допринасяне на примери](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводаческа услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на езика, на който е написан, трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->