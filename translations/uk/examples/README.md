# Приклади - Практичні шаблони та конфігурації AZD

**Вивчення на прикладах - організовано за розділами**  
- **📚 Домашня сторінка курсу**: [AZD для початківців](../README.md)  
- **📖 Картографування розділів**: Приклади, організовані за складністю навчання  
- **🚀 Локальний приклад**: [Роздрібне багатокористувацьке рішення](retail-scenario.md)  
- **🤖 Зовнішні приклади ШІ**: Посилання на репозиторії Azure Samples  

> **📍 ВАЖЛИВО: Локальні та зовнішні приклади**  
> У цьому репозиторії міститься **4 повні локальні приклади** з повною реалізацією:  
> - **Microsoft Foundry Models Chat** (розгортання gpt-4.1 з чат-інтерфейсом)  
> - **Container Apps** (проста Flask API + мікросервіси)  
> - **Database App** (Веб + SQL база даних)  
> - **Retail Multi-Agent** (корпоративне рішення ШІ)  
>  
> Додаткові приклади є **зовнішніми посиланнями** на репозиторії Azure-Samples, які можна клонувати.  

## Вступ

Цей каталог надає практичні приклади та посилання, які допоможуть вам вивчити Azure Developer CLI через практичні заняття. Сценарій Retail Multi-Agent є повною, готовою до продакшену реалізацією, включеною в цей репозиторій. Додаткові приклади посилаються на офіційні зразки Azure, які демонструють різні патерни AZD.

### Легенда складності

- ⭐ **Початківець** — базові концепції, один сервіс, 15-30 хвилин  
- ⭐⭐ **Середній рівень** — кілька сервісів, інтеграція бази даних, 30-60 хвилин  
- ⭐⭐⭐ **Просунутий** — складна архітектура, інтеграція ШІ, 1-2 години  
- ⭐⭐⭐⭐ **Експерт** — готове до продакшену, корпоративні патерни, 2+ години  

## 🎯 Що насправді міститься в цьому репозиторії

### ✅ Локальна реалізація (готова до використання)

#### [Додаток чату Microsoft Foundry Models](azure-openai-chat/README.md) 🆕  
**Повне розгортання gpt-4.1 з чат-інтерфейсом, включеним у цей репозиторій**

- **Розташування:** `examples/azure-openai-chat/`  
- **Складність:** ⭐⭐ (Середній рівень)  
- **Що включено:**  
  - Повне розгортання Microsoft Foundry Models (gpt-4.1)  
  - Командний чат-інтерфейс Python  
  - Інтеграція Key Vault для безпечних API ключів  
  - Інфраструктурні шаблони Bicep  
  - Відстеження використання токенів та вартості  
  - Лімітування запитів та обробка помилок  

**Швидкий старт:**  
```bash
# Перейдіть до прикладу
cd examples/azure-openai-chat

# Розгорнути все
azd up

# Встановіть залежності та почніть спілкування
pip install -r src/requirements.txt
python src/chat.py
```
  
**Технології:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep  

#### [Приклади Container App](container-app/README.md) 🆕  
**Вичерпні приклади розгортання контейнерів включені у цей репозиторій**

- **Розташування:** `examples/container-app/`  
- **Складність:** ⭐-⭐⭐⭐⭐ (від початківця до експерта)  
- **Що включено:**  
  - [Головний гайд](container-app/README.md) - повний огляд розгортання контейнерів  
  - [Проста Flask API](../../../examples/container-app/simple-flask-api) – базовий приклад REST API  
  - [Архітектура мікросервісів](../../../examples/container-app/microservices) – готове до продакшену багатосервісне розгортання  
  - Швидкий старт, продакшен, розширені патерни  
  - Моніторинг, безпека та оптимізація вартості  

**Швидкий старт:**  
```bash
# Переглянути головний посібник
cd examples/container-app

# Розгорнути простий Flask API
cd simple-flask-api
azd up

# Розгорнути приклад мікросервісів
cd ../microservices
azd up
```
  
**Технології:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights  

#### [Рішення Retail Multi-Agent](retail-scenario.md) 🆕  
**Повна готова до продакшену реалізація, включена в цей репозиторій**

- **Розташування:** `examples/retail-multiagent-arm-template/`  
- **Складність:** ⭐⭐⭐⭐ (просунутий рівень)  
- **Що включено:**  
  - Повний ARM шаблон розгортання  
  - Архітектура багатьох агентів (Клієнт + Запаси)  
  - Інтеграція Microsoft Foundry Models  
  - AI Пошук з RAG  
  - Комплексний моніторинг  
  - Скрипт розгортання одним кліком  

**Швидкий старт:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Технології:** Microsoft Foundry Models, AI Пошук, Container Apps, Cosmos DB, Application Insights  

---

## 🔗 Зовнішні приклади Azure (клонувати для використання)

Наступні приклади підтримуються в офіційних репозиторіях Azure-Samples. Клонуйте їх для ознайомлення з різними патернами AZD:

### Простi додатки (розділи 1-2)

| Шаблон | Репозиторій | Складність | Сервіси |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Локально: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Мікросервіси** | [Локально: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Багатосервісний, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Функції, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Як користуватися:**  
```bash
# Клонувати будь-який приклад
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Розгорнути
azd up
```
  
### Приклади застосувань ШІ (розділи 2, 5, 8)

| Шаблон | Репозиторій | Складність | Фокус |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Локально: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | розгортання gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | базовий чат ШІ |
| **AI Агенти** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | фреймворк агентів |
| **Пошук + OpenAI демонстрація** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | патерн RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Корпоративний ШІ |

### Бази даних та просунуті патерни (розділи 3-8)

| Шаблон | Репозиторій | Складність | Фокус |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | інтеграція баз даних |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | безсерверний NoSQL |
| **Java Мікросервіси** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | багатосервісні |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Цілі навчання

Допрацьовуючи ці приклади, ви зможете:  
- Практикувати робочі процеси Azure Developer CLI з реалістичними сценаріями застосунків  
- Розуміти різні архітектури застосунків та їхні azd-реалізації  
- Оволодіти патернами Infrastructure as Code для різних сервісів Azure  
- Застосовувати конфігураційне управління та середовищеві локальні стратегії розгортання  
- Реалізувати патерни моніторингу, безпеки та масштабування на практичних прикладах  
- Отримати досвід з налагодження та усунення проблем у реальних сценаріях розгортання

## Очікувані результати

Після опрацювання цих прикладів ви зможете:  
- Впевнено розгортати різні типи застосунків за допомогою Azure Developer CLI  
- Адаптувати надані шаблони до власних вимог застосунків  
- Проєктувати та впроваджувати власні патерни інфраструктури з використанням Bicep  
- Налаштовувати складні багатосервісні застосунки з коректними залежностями  
- Застосовувати в реальних сценаріях кращі практики безпеки, моніторингу та продуктивності  
- Усувати неполадки та оптимізувати розгортання на основі практичного досвіду

## Структура каталогу

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
  
## Приклади швидкого старту

> **💡 Новачок в AZD?** Почніть з прикладу №1 (Flask API) — це займе близько 20 хвилин і навчає основам.

### Для початківців  
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (локально) ⭐  
   Розгорніть простий REST API з масштабуванням до нуля  
   **Час:** 20-25 хвилин | **Вартість:** $0-5/місяць  
   **Що вивчите:** базовий робочий процес azd, контейнеризація, health-проби  
   **Очікуваний результат:** робоча API точка, що повертає «Hello, World!» з моніторингом  

2. **[Простий веб-додаток - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Розгорнути веб-застосунок Node.js Express з MongoDB  
   **Час:** 25-35 хвилин | **Вартість:** $10-30/місяць  
   **Що вивчите:** інтеграція бази даних, змінні середовища, рядки підключення  
   **Очікуваний результат:** додаток списку завдань із функціями створення/читання/оновлення/видалення  

3. **[Статичний вебсайт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Хостинг React статичного сайту на Azure Static Web Apps  
   **Час:** 20-30 хвилин | **Вартість:** $0-10/місяць  
   **Що вивчите:** статичний хостинг, безсерверні функції, розгортання CDN  
   **Очікуваний результат:** React UI з API бекендом, автоматичний SSL, глобальний CDN  

### Для користувачів середнього рівня  
4. **[Додаток чату Microsoft Foundry Models](../../../examples/azure-openai-chat)** (локально) ⭐⭐  
   Розгортання gpt-4.1 з чат-інтерфейсом та керуванням API ключами  
   **Час:** 35-45 хвилин | **Вартість:** $50-200/місяць  
   **Що вивчите:** розгортання Microsoft Foundry Models, інтеграція Key Vault, відстеження токенів  
   **Очікуваний результат:** робочий чат додаток з gpt-4.1 та моніторингом витрат  

5. **[Container App - Мікросервіси](../../../examples/container-app/microservices)** (локально) ⭐⭐⭐⭐  
   Готова до продакшену багатосервісна архітектура  
   **Час:** 45-60 хвилин | **Вартість:** $50-150/місяць  
   **Що вивчите:** комунікація між сервісами, черги повідомлень, розподілене трасування  
   **Очікуваний результат:** 2-сервісна система (API Gateway + Product Service) з моніторингом  

6. **[Database App - C# з Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Веб-додаток з C# API та Azure SQL Database  
   **Час:** 30-45 хвилин | **Вартість:** $20-80/місяць  
   **Що вивчите:** Entity Framework, міграції бази даних, безпека підключень  
   **Очікуваний результат:** C# API з Azure SQL бекендом, автоматичне розгортання схеми  

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions з HTTP тригерами та Cosmos DB  
   **Час:** 30-40 хвилин | **Вартість:** $10-40/місяць  
   **Що вивчите:** архітектура на подіях, безсерверне масштабування, інтеграція NoSQL  
   **Очікуваний результат:** функціональний додаток, що відповідає на HTTP-запити з збереженням у Cosmos DB  

8. **[Мікросервіси - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Багатосервісний Java додаток з Container Apps та API gateway  
   **Час:** 60-90 хвилин | **Вартість:** $80-200/місяць  
   **Що вивчите:** розгортання Spring Boot, service mesh, балансування навантаження  
   **Очікуваний результат:** багатосервісна Java система з об Discovery сервісів та маршрутизацією  

### Шаблони Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - Локальний приклад](../../../examples/azure-openai-chat)** ⭐⭐  
   Повне розгортання gpt-4.1 з чат-інтерфейсом  
   **Час:** 35-45 хвилин | **Вартість:** $50-200/місяць  
   **Очікуваний результат:** робочий чат додаток з відстеженням токенів та моніторингом витрат  

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Інтелектуальний чат-додаток з архітектурою RAG  
   **Час:** 60-90 хвилин | **Вартість:** $100-300/місяць  
   **Очікуваний результат:** чат-інтерфейс із пошуком документів та посиланнями на джерела  

3. **[AI Обробка документів](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Аналіз документів із використанням сервісів Azure AI  
   **Час:** 40-60 хвилин | **Вартість:** $20-80/місяць  
   **Очікуваний результат:** API, що витягує текст, таблиці та сутності з завантажених документів  

4. **[Конвеєр машинного навчання](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Робочий процес MLOps з Azure Machine Learning  
   **Час:** 2-3 години | **Вартість:** $150-500/місяць  
   **Очікуваний результат:** автоматизований ML конвеєр з навчанням, розгортанням та моніторингом  

### Реальні сценарії

#### **Рішення Retail Multi-Agent** 🆕  
**[Повний гайд з реалізації](./retail-scenario.md)**

Комплексне готове до продакшену багатокористувацьке рішення підтримки клієнтів, яке демонструє розгортання корпоративних рішень ШІ з AZD. Сценарій містить:

- **Повну архітектуру:** багатокористувацька система з спеціалізованими агентами підтримки клієнтів та управління запасами
- **Виробнича інфраструктура**: Розгортання моделей Microsoft Foundry у кількох регіонах, AI Search, Container Apps та комплексний моніторинг  
- **Готовий до розгортання ARM-шаблон**: Розгортання в один клік з різними режимами конфігурації (Minimal/Standard/Premium)  
- **Розширені функції**: Перевірка безпеки red teaming, фреймворк оцінки агентів, оптимізація витрат та керівництва з усунення неполадок  
- **Реальний бізнес-контекст**: Використання у підтримці клієнтів роздрібної торгівлі з завантаженням файлів, інтеграцією пошуку та динамічним масштабуванням  

**Технології**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Складність**: ⭐⭐⭐⭐ (Просунутий рівень — готове до виробництва корпоративне рішення)  

**Ідеально підходить для**: AI-розробників, архітекторів рішень і команд, що створюють виробничі мультиагентські системи  

**Швидкий старт**: Розгорніть повне рішення за менше ніж 30 хвилин, використовуючи включений ARM-шаблон із командою `./deploy.sh -g myResourceGroup`  

## 📋 Інструкції з використання  

### Вимоги  

Перед запуском будь-якого прикладу:  
- ✅ Підписка Azure з правами Власника або Учасника  
- ✅ Встановлений Azure Developer CLI ([Керівництво з інсталяції](../docs/chapter-01-foundation/installation.md))  
- ✅ Запущений Docker Desktop (для прикладів із контейнерами)  
- ✅ Відповідні квоти Azure (перевірте вимоги для конкретного прикладу)  

> **💰 Попередження щодо витрат:** Всі приклади створюють реальні ресурси Azure, які спричиняють витрати. Перегляньте окремі README-файли для оцінки вартості. Не забудьте виконати `azd down` після завершення, щоб уникнути подальших витрат.  

### Локальне запускання прикладів  

1. **Клонувати або скопіювати приклад**  
   ```bash
   # Перейдіть до потрібного прикладу
   cd examples/simple-web-app
   ```
  
2. **Ініціалізувати середовище AZD**  
   ```bash
   # Ініціалізувати з існуючого шаблону
   azd init
   
   # Або створити нове середовище
   azd env new my-environment
   ```
  
3. **Налаштувати середовище**  
   ```bash
   # Встановіть необхідні змінні
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **Розгорнути**  
   ```bash
   # Розгорнути інфраструктуру та додаток
   azd up
   ```
  
5. **Перевірити розгортання**  
   ```bash
   # Отримати кінцеві точки сервісу
   azd env get-values
   
   # Перевірити кінцеву точку (приклад)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Очікувані індикатори успіху:**  
   - ✅ `azd up` завершується без помилок  
   - ✅ Точка кінця сервісу повертає HTTP 200  
   - ✅ В порталі Azure статус "Running"  
   - ✅ Application Insights отримує телеметрію  

> **⚠️ Проблеми?** Дивіться [Поширені проблеми](../docs/chapter-07-troubleshooting/common-issues.md) для усунення неполадок при розгортанні  

### Адаптація прикладів  

Кожен приклад містить:  
- **README.md** — Детальні інструкції з налаштування та кастомізації  
- **azure.yaml** — Конфігурація AZD з коментарями  
- **infra/** — Bicep шаблони з поясненнями параметрів  
- **src/** — Код демонстраційного застосунку  
- **scripts/** — Допоміжні скрипти для поширених завдань  

## 🎯 Цілі навчання  

### Категорії прикладів  

#### **Прості розгортання**  
- Односервісні застосунки  
- Прості інфраструктурні шаблони  
- Базове управління конфігурацією  
- Економічні варіанти для розробки  

#### **Просунуті сценарії**  
- Архітектура з багатьма сервісами  
- Складні мережеві конфігурації  
- Патерни інтеграції баз даних  
- Реалізація безпеки та відповідності  

#### **Готові до виробництва патерни**  
- Конфігурації високої доступності  
- Моніторинг та спостереження  
- Інтеграція CI/CD  
- Налаштування аварійного відновлення  

## 📖 Опис прикладів  

### Простий веб-застосунок — Node.js Express  
**Технології**: Node.js, Express, MongoDB, Container Apps  
**Складність**: Початковий рівень  
**Концепції**: Базове розгортання, REST API, інтеграція NoSQL бази даних  

### Статичний сайт — React SPA  
**Технології**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Складність**: Початковий рівень  
**Концепції**: Статичний хостинг, безсерверний бекенд, сучасна веб-розробка  

### Container App — Python Flask  
**Технології**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Складність**: Початковий рівень  
**Концепції**: Контейнеризація, REST API, масштабування до нуля, health probes, моніторинг  
**Розташування**: [Локальний приклад](../../../examples/container-app/simple-flask-api)  

### Container App — Мікросервісна архітектура  
**Технології**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Складність**: Просунутий рівень  
**Концепції**: Архітектура з багатьма сервісами, взаємодія сервісів, чергування повідомлень, розподілене трасування  
**Розташування**: [Локальний приклад](../../../examples/container-app/microservices)  

### Застосунок із базою даних — C# з Azure SQL  
**Технології**: C# ASP.NET Core, Azure SQL Database, App Service  
**Складність**: Середній рівень  
**Концепції**: Entity Framework, підключення до бази даних, розробка веб API  

### Функція Serverless — Python Azure Functions  
**Технології**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Складність**: Середній рівень  
**Концепції**: Подієво-орієнтована архітектура, безсерверні обчислення, full-stack розробка  

### Мікросервіси — Java Spring Boot  
**Технології**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Складність**: Середній рівень  
**Концепції**: Взаємодія мікросервісів, розподілені системи, корпоративні патерни  

### Приклади Microsoft Foundry  

#### Чат-застосунок Microsoft Foundry Models  
**Технології**: Microsoft Foundry Models, Azure AI Search, App Service  
**Складність**: Середній рівень  
**Концепції**: Архітектура RAG, векторний пошук, інтеграція LLM  

#### Обробка документів за допомогою AI  
**Технології**: Azure AI Document Intelligence, Storage, Functions  
**Складність**: Середній рівень  
**Концепції**: Аналіз документів, OCR, вилучення даних  

#### Конвеєр машинного навчання  
**Технології**: Azure ML, MLOps, Container Registry  
**Складність**: Просунутий рівень  
**Концепції**: Навчання моделей, конвеєри розгортання, моніторинг  

## 🛠 Приклади конфігурацій  

Каталог `configurations/` містить повторно використовувані компоненти:  

### Конфігурації середовищ  
- Налаштування середовища розробки  
- Конфігурації тестового середовища  
- Параметри готовності до виробництва  
- Налаштування з розгортанням у декількох регіонах  

### Модулі Bicep  
- Повторно використовувані компоненти інфраструктури  
- Загальні шаблони ресурсів  
- Шаблони з підвищеною безпекою  
- Оптимізовані з точки зору вартості конфігурації  

### Допоміжні скрипти  
- Автоматизація налаштування середовища  
- Скрипти міграції баз даних  
- Інструменти перевірки розгортання  
- Утиліти моніторингу витрат  

## 🔧 Посібник з кастомізації  

### Адаптація прикладів для вашого випадку  

1. **Перевірте вимоги**  
   - Переконайтесь у відповідності сервісів Azure  
   - Перевірте ліміти підписки  
   - Усвідомте вплив на витрати  

2. **Змініть конфігурацію**  
   - Оновіть визначення сервісів у `azure.yaml`  
   - Налаштуйте Bicep шаблони  
   - Відкоригуйте змінні середовища  

3. **Ретельно протестуйте**  
   - Спершу розгорніть у середовищі розробки  
   - Перевірте функціональність  
   - Тестуйте масштабування та продуктивність  

4. **Перегляньте безпеку**  
   - Перевірте контролі доступу  
   - Застосуйте управління секретами  
   - Увімкніть моніторинг та сповіщення  

## 📊 Матриця порівняння  

| Приклад                             | Сервіси | БД  | Аутентифікація | Моніторинг | Складність           |  
|-----------------------------------|---------|-----|----------------|------------|----------------------|  
| **Microsoft Foundry Models Chat** (Локальний) | 2       | ❌  | Key Vault      | Повний     | ⭐⭐                   |  
| **Python Flask API** (Локальний)  | 1       | ❌  | Базова         | Повний     | ⭐                    |  
| **Мікросервіси** (Локальний)      | 5+      | ✅  | Корпоративна   | Просунутий | ⭐⭐⭐⭐                 |  
| Node.js Express Todo              | 2       | ✅  | Базова         | Базова     | ⭐                    |  
| React SPA + Functions             | 3       | ✅  | Базова         | Повний     | ⭐                    |  
| Python Flask Container            | 2       | ❌  | Базова         | Повний     | ⭐                    |  
| C# Web API + SQL                 | 2       | ✅  | Повна          | Повний     | ⭐⭐                   |  
| Python Functions + SPA           | 3       | ✅  | Повна          | Повний     | ⭐⭐                   |  
| Java Microservices               | 5+      | ✅  | Повна          | Повний     | ⭐⭐                   |  
| Microsoft Foundry Models Chat    | 3       | ✅  | Повна          | Повний     | ⭐⭐⭐                  |  
| AI Document Processing           | 2       | ❌  | Базова         | Повний     | ⭐⭐                   |  
| ML Pipeline                     | 4+      | ✅  | Повна          | Повний     | ⭐⭐⭐⭐                 |  
| **Retail Multi-Agent** (Локальний) | **8+**  | **✅** | **Корпоративна** | **Просунутий** | **⭐⭐⭐⭐**               |  

## 🎓 Навчальний шлях  

### Рекомендований порядок  

1. **Почніть із простого веб-застосунку**  
   - Вивчіть базові концепції AZD  
   - Зрозумійте робочий процес розгортання  
   - Навчіться управлінню середовищем  

2. **Спробуйте статичний сайт**  
   - Ознайомтеся з різними варіантами хостингу  
   - Вивчіть інтеграцію CDN  
   - Зрозумійте налаштування DNS  

3. **Перейдіть до Container App**  
   - Вивчіть основи контейнеризації  
   - Зрозумійте концепції масштабування  
   - Практикуйтесь із Docker  

4. **Додайте інтеграцію з базою даних**  
   - Вивчіть провізію баз даних  
   - Зрозумійте рядки підключення  
   - Опановуйте управління секретами  

5. **Вивчайте безсерверні технології**  
   - Ознайомтеся з подієво-орієнтованою архітектурою  
   - Вивчіть тригери та прив’язки  
   - Практикуйтесь з API  

6. **Створюйте мікросервіси**  
   - Вивчайте взаємодію сервісів  
   - Зрозумійте розподілені системи  
   - Практикуйтесь у складних розгортаннях  

## 🔍 Як обрати правильний приклад  

### За технологічним стеком  
- **Container Apps**: [Python Flask API (Локальний)](../../../examples/container-app/simple-flask-api), [Мікросервіси (Локальні)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [API-шлюз мікросервісів (Локальний)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Локальний)](../../../examples/container-app/simple-flask-api), [Сервіс товарів мікросервісів (Локальний)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Сервіс замовлень мікросервісів (Локальний)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go**: [Сервіс користувачів мікросервісів (Локальний)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **Контейнери**: [Python Flask (Локальний)](../../../examples/container-app/simple-flask-api), [Мікросервіси (Локальні)](../../../examples/container-app/microservices), Java Microservices  
- **Бази даних**: [Мікросервіси (Локальні)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry Models Chat (Локальний)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Мультиагентні системи**: **Retail Multi-Agent Solution**  
- **Інтеграція OpenAI**: **[Microsoft Foundry Models Chat (Локальний)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Корпоративне виробництво**: [Мікросервіси (Локальні)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### За архітектурним патерном  
- **Простий REST API**: [Python Flask API (Локальний)](../../../examples/container-app/simple-flask-api)  
- **Моноліт**: Node.js Express Todo, C# Web API + SQL  
- **Статичний + безсерверний**: React SPA + Functions, Python Functions + SPA  
- **Мікросервіси**: [Виробничі мікросервіси (Локальні)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **Контейнеризовані**: [Python Flask (Локальний)](../../../examples/container-app/simple-flask-api), [Мікросервіси (Локальні)](../../../examples/container-app/microservices)  
- **З AI**: **[Microsoft Foundry Models Chat (Локальний)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Мультиагентна архітектура**: **Retail Multi-Agent Solution**  
- **Корпоративні мультисервісні**: [Мікросервіси (Локальні)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### За рівнем складності  
- **Початковий**: [Python Flask API (Локальний)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Середній**: **[Microsoft Foundry Models Chat (Локальний)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing  
- **Просунутий**: ML Pipeline  
- **Готовий до виробництва корпоративний**: [Мікросервіси (Локальні)](../../../examples/container-app/microservices) (багатосервісна система з чергуванням повідомлень), **Retail Multi-Agent Solution** (повна мультиагентська система з розгортанням через ARM-шаблон)  

## 📚 Додаткові ресурси  

### Посилання на документацію  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Документація Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Приклади з спільноти  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)  
- [Todo App з C# та Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App з Python та MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Todo App з Node.js та PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App з API на C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions з Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Кращі практики
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Внесок прикладів

Маєте корисний приклад, яким хочете поділитися? Запрошуємо до внеску!

### Керівництво з подачі
1. Дотримуйтесь встановленої структури каталогів
2. Включайте докладний README.md
3. Додавайте коментарі до файлів конфігурації
4. Ретельно тестуйте перед подачею
5. Вказуйте оцінку вартості та передумови

### Структура шаблону прикладу
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

**Порада від профі**: Починайте з найпростішого прикладу, який відповідає вашому стеку технологій, а потім поступово переходьте до більш складних сценаріїв. Кожен приклад будується на концепціях попередніх!

## 🚀 Готові почати?

### Ваш шлях до навчання

1. **Повний початківець?** → Почніть з [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 хв)
2. **Маєте базові знання AZD?** → Спробуйте [Мікросервіси](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 хв)
3. **Створюєте AI-додатки?** → Почніть з [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 хв) або досліджуйте [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, понад 2 години)
4. **Потрібен конкретний стек технологій?** → Скористайтеся розділом [Пошук правильного прикладу](#-finding-the-right-example) вище

### Наступні кроки

- ✅ Перегляньте [Передумови](#вимоги) вище
- ✅ Оберіть приклад відповідно до вашого рівня (див. [Легенду складності](#легенда-складності))
- ✅ Ретельно прочитайте README прикладу перед розгортанням
- ✅ Встановіть нагадування виконати `azd down` після тестування
- ✅ Поділіться своїм досвідом через GitHub Issues або Discussions

### Потрібна допомога?

- 📖 [FAQ](../resources/faq.md) - Відповіді на поширені запитання
- 🐛 [Посібник з усунення несправностей](../docs/chapter-07-troubleshooting/common-issues.md) - Виправлення проблем з розгортанням
- 💬 [Обговорення на GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Поставте запитання спільноті
- 📚 [Навчальний посібник](../resources/study-guide.md) - Закріпіть навчання

---

**Навігація**
- **📚 Головна сторінка курсу**: [AZD For Beginners](../README.md)
- **📖 Матеріали для навчання**: [Навчальний посібник](../resources/study-guide.md) | [Шпаргалка](../resources/cheat-sheet.md) | [Глосарій](../resources/glossary.md)
- **🔧 Ресурси**: [FAQ](../resources/faq.md) | [Усунення несправностей](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Останнє оновлення: листопад 2025 | [Повідомити про проблеми](https://github.com/microsoft/AZD-for-beginners/issues) | [Внести приклади](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->