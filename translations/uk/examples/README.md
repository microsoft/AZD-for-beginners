# Приклади - Практичні шаблони та конфігурації AZD

**Навчання на прикладі - організовано за розділами**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../README.md)
- **📖 Відображення розділів**: Приклади організовані за складністю вивчення
- **🚀 Локальний приклад**: [Рішення для роздрібної торгівлі з кількома агентами](retail-scenario.md)
- **🤖 Зовнішні приклади з ШІ**: Посилання на репозиторії Azure Samples

> **📍 ВАЖЛИВО: Локальні та зовнішні приклади**  
> Цей репозиторій містить **4 повні локальні приклади** з повною реалізацією:  
> - **Azure OpenAI Chat** (розгортання GPT-4 з інтерфейсом чату)  
> - **Container Apps** (проста REST API на Flask + мікросервіси)  
> - **Додаток з Базою Даних** (веб + SQL база даних)  
> - **Роздрібні багатокористувацькі агенти** (корпоративне ШІ-рішення)  
>  
> Додаткові приклади — це **зовнішні посилання** на репозиторії Azure-Samples, які ви можете клонувати.

## Вступ

Цей каталог надає практичні приклади та посилання, щоб допомогти вам вивчити Azure Developer CLI через практичні вправи. Сценарій роздрібної торгівлі з кількома агентами — це повна, готова до виробництва реалізація, включена в цей репозиторій. Додаткові приклади посилаються на офіційні Azure Samples, які демонструють різні шаблони AZD.

### Легенда складності

- ⭐ **Початківець** - базові концепції, одна служба, 15-30 хвилин
- ⭐⭐ **Середній рівень** - кілька служб, інтеграція з базою даних, 30-60 хвилин
- ⭐⭐⭐ **Просунутий** - складна архітектура, інтеграція ШІ, 1-2 години
- ⭐⭐⭐⭐ **Експерт** - готове до виробництва, корпоративні шаблони, 2+ години

## 🎯 Що насправді є в цьому репозиторії

### ✅ Локальна реалізація (готова до використання)

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕  
**Повне розгортання GPT-4 з інтерфейсом чату, включено в цей репозиторій**

- **Розташування:** `examples/azure-openai-chat/`
- **Складність:** ⭐⭐ (Середній рівень)
- **Що включено:**
  - Повне розгортання Azure OpenAI (GPT-4)
  - Інтерфейс чату на Python через командний рядок
  - Інтеграція з Key Vault для безпечного зберігання API ключів
  - Bicep шаблони для інфраструктури
  - Відстеження використання токенів і вартості
  - Обмеження швидкості та обробка помилок

**Швидкий старт:**  
```bash
# Перейдіть до прикладу
cd examples/azure-openai-chat

# Розгорніть усе
azd up

# Встановіть залежності та почніть спілкуватися
pip install -r src/requirements.txt
python src/chat.py
```
  
**Технології:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Приклади Container App](container-app/README.md) 🆕  
**Комплексні приклади розгортання контейнерів, включені в цей репозиторій**

- **Розташування:** `examples/container-app/`
- **Складність:** ⭐-⭐⭐⭐⭐ (Від початківця до просунутого)
- **Що включено:**
  - [Основне керівництво](container-app/README.md) - повний огляд розгортання контейнерів
  - [Проста Flask API](../../../examples/container-app/simple-flask-api) - базовий приклад REST API
  - [Архітектура мікросервісів](../../../examples/container-app/microservices) - готове до виробництва мультисервісне розгортання
  - Швидкий старт, виробничі та просунуті шаблони
  - Моніторинг, безпека та оптимізація вартості

**Швидкий старт:**  
```bash
# Переглянути головного посібника
cd examples/container-app

# Розгорнути простий Flask API
cd simple-flask-api
azd up

# Розгорнути приклад мікросервісів
cd ../microservices
azd up
```
  
**Технології:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Рішення роздрібної торгівлі з кількома агентами](retail-scenario.md) 🆕  
**Повна готова до виробництва реалізація, включена в цей репозиторій**

- **Розташування:** `examples/retail-multiagent-arm-template/`
- **Складність:** ⭐⭐⭐⭐ (Просунутий)
- **Що включено:**
  - Повний шаблон розгортання ARM
  - Архітектура з кількома агентами (Клієнт + Інвентар)
  - Інтеграція Azure OpenAI
  - AI-пошук із RAG
  - Комплексний моніторинг
  - Скрипт розгортання в один клік

**Швидкий старт:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Технології:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Зовнішні приклади Azure Samples (клонуйте для використання)

Наступні приклади підтримуються в офіційних репозиторіях Azure-Samples. Клонуйте їх, щоб дослідити різні шаблони AZD:

### Прості додатки (розділи 1-2)

| Шаблон | Репозиторій | Складність | Служби |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Локально: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Мікросервіси** | [Локально: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Мультисервіс, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask контейнер** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Як використовувати:**  
```bash
# Клонувати будь-який приклад
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Розгорнути
azd up
```
  
### Приклади додатків ШІ (розділи 2, 5, 8)

| Шаблон | Репозиторій | Складність | Фокус |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Локально: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Розгортання GPT-4 |
| **Швидкий старт AI Chat** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Базовий AI чат |
| **AI Агенти** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Фреймворк агентів |
| **Демонстрація Search + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Паттерн RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Корпоративний ШІ |

### Бази даних та розширені шаблони (розділи 3-8)

| Шаблон | Репозиторій | Складність | Фокус |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Інтеграція бази даних |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL безсерверний |
| **Java мікросервіси** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Мультисервіс |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Цілі навчання

Виконуючи ці приклади, ви:
- Практикуєте робочі процеси Azure Developer CLI на реалістичних сценаріях додатків
- Розумієте різні архітектури додатків і їх реалізації через azd
- Опануєте шаблони Інфраструктури як Коду для різних сервісів Azure
- Застосовуєте управління конфігурацією та стратегії розгортання для різних середовищ
- Реалізуєте шаблони моніторингу, безпеки та масштабування у практичних контекстах
- Отримаєте досвід налагодження та відлагодження реальних сценаріїв розгортання

## Результати навчання

Після завершення цих прикладів ви зможете:
- Впевнено розгортати різні типи додатків за допомогою Azure Developer CLI
- Адаптувати надані шаблони до вимог власних додатків
- Проєктувати та впроваджувати інфраструктурні патерни з використанням Bicep
- Налаштовувати складні мультисервісні додатки з правильними залежностями
- Застосовувати кращі практики безпеки, моніторингу та продуктивності в реальних сценаріях
- Вирішувати проблеми та оптимізувати розгортання на основі практичного досвіду

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

> **💡 Ви новачок у AZD?** Почніть з прикладу #1 (Flask API) — це займе близько 20 хвилин і навчить основам.

### Для початківців
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Локально) ⭐  
   Розгорніть простий REST API зі скейлінгом до нуля  
   **Час:** 20-25 хвилин | **Вартість:** $0-5/місяць  
   **Що вивчите:** базовий робочий процес azd, контейнеризація, health probes  
   **Очікуваний результат:** робочий API з відповіддю "Hello, World!" та моніторингом

2. **[Простий вебдодаток - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Розгорніть вебдодаток на Node.js Express з MongoDB  
   **Час:** 25-35 хвилин | **Вартість:** $10-30/місяць  
   **Що вивчите:** інтеграція бази даних, змінні середовища, рядки підключення  
   **Очікуваний результат:** додаток списку справ із функціями створення/читання/оновлення/видалення

3. **[Сайт на React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Хостинг статичного сайту React з Azure Static Web Apps  
   **Час:** 20-30 хвилин | **Вартість:** $0-10/місяць  
   **Що вивчите:** статичний хостинг, серверлес функції, розгортання CDN  
   **Очікуваний результат:** React UI з бекендом API, автоматичний SSL, глобальний CDN

### Для користувачів середнього рівня
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (Локально) ⭐⭐  
   Розгортання GPT-4 з інтерфейсом чату та безпечним управлінням API ключами  
   **Час:** 35-45 хвилин | **Вартість:** $50-200/місяць  
   **Що вивчите:** розгортання Azure OpenAI, інтеграція Key Vault, відстеження токенів  
   **Очікуваний результат:** робочий чат з GPT-4 та моніторингом вартості

5. **[Container App - Мікросервіси](../../../examples/container-app/microservices)** (Локально) ⭐⭐⭐⭐  
   Готова до виробництва мультисервісна архітектура  
   **Час:** 45-60 хвилин | **Вартість:** $50-150/місяць  
   **Що вивчите:** взаємодія служб, черги повідомлень, розподілене трасування  
   **Очікуваний результат:** система з 2 служб (API Gateway + Product Service) з моніторингом

6. **[Додаток з базою даних - C# з Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Вебдодаток з API на C# та Azure SQL Database  
   **Час:** 30-45 хвилин | **Вартість:** $20-80/місяць  
   **Що вивчите:** Entity Framework, міграції бази даних, безпека з’єднань  
   **Очікуваний результат:** C# API з Azure SQL бекендом, автоматичне розгортання схеми

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions з HTTP тригерами та Cosmos DB  
   **Час:** 30-40 хвилин | **Вартість:** $10-40/місяць  
   **Що вивчите:** подійна архітектура, серверлес масштабування, інтеграція NoSQL  
   **Очікуваний результат:** функція, що відповідає на HTTP запити і працює з Cosmos DB

8. **[Мікросервіси - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Мультисервісний Java додаток з Container Apps і API gateway  
   **Час:** 60-90 хвилин | **Вартість:** $80-200/місяць  
   **Що вивчите:** розгортання Spring Boot, service mesh, балансування навантаження  
   **Очікуваний результат:** мультисервісна Java система з виявленням служб і маршрутизацією

### Microsoft Foundry Templates

1. **[Azure OpenAI Chat App - локальний приклад](../../../examples/azure-openai-chat)** ⭐⭐  
   Повне розгортання GPT-4 з інтерфейсом чату  
   **Час:** 35-45 хвилин | **Вартість:** $50-200/місяць  
   **Очікуваний результат:** робочий чат із відстеженням токенів і моніторингом вартості

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Інтелектуальний чат з архітектурою RAG  
   **Час:** 60-90 хвилин | **Вартість:** $100-300/місяць  
   **Очікуваний результат:** чат із RAG, пошуком документів і цитуванням

3. **[Обробка документів ШІ](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Аналіз документів за допомогою сервісів Azure AI  
   **Час:** 40-60 хвилин | **Вартість:** $20-80/місяць  
   **Очікуваний результат:** API для вилучення тексту, таблиць і сутностей з документів

4. **[ML Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps робочий процес з Azure Machine Learning  
   **Час:** 2-3 години | **Вартість:** $150-500/місяць  
   **Очікуваний результат:** автоматизований пайплайн ML з тренуванням, розгортанням і моніторингом

### Реальні сценарії

#### **Рішення роздрібної торгівлі з кількома агентами** 🆕  
**[Повний посібник з реалізації](./retail-scenario.md)**

Комплексне, готове для виробництва рішення для багатокористувацької підтримки клієнтів, яке демонструє корпоративне розгортання AI-застосунків за допомогою AZD. Цей сценарій надає:

- **Повна архітектура**: мультиагентна система зі спеціалізованими агентами з обслуговування клієнтів та управління запасами
- **Інфраструктура для виробництва**: Розгортання Azure OpenAI у кількох регіонах, AI Search, Container Apps та комплексний моніторинг  
- **Готовий до розгортання ARM шаблон**: Розгортання в один клік із кількома режимами конфігурації (Мінімальний/Стандартний/Преміум)  
- **Розширені функції**: Перевірка безпеки Red Teaming, каркас оцінки агентів, оптимізація витрат та посібники з усунення несправностей  
- **Реальний бізнес-контекст**: Випадок використання підтримки клієнтів у роздрібній торгівлі з завантаженням файлів, інтеграцією пошуку та динамічним масштабуванням

**Технології**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Складність**: ⭐⭐⭐⭐ (Просунутий – готовий до виробництва на рівні підприємства)

**Ідеально підходить для**: Розробників AI, архітекторів рішень та команд, що створюють виробничі системи з кількома агентами

**Швидкий старт**: Розгорніть повне рішення менш ніж за 30 хвилин, використовуючи включений ARM шаблон із `./deploy.sh -g myResourceGroup`

## 📋 Інструкції з використання

### Необхідні умови

Перед запуском будь-якого прикладу:  
- ✅ Підписка Azure з роллю Власника або Учасника  
- ✅ Встановлений Azure Developer CLI ([Посібник з інсталяції](../docs/chapter-01-foundation/installation.md))  
- ✅ Запущений Docker Desktop (для прикладів із контейнерами)  
- ✅ Відповідні квоти Azure (перевірте вимоги для конкретних прикладів)

> **💰 Попередження про витрати:** Всі приклади створюють реальні ресурси Azure, що призводить до нарахування плати. Див. окремі файли README для оцінки вартості. Не забудьте запустити `azd down` після завершення роботи, щоб уникнути подальших витрат.

### Запуск прикладів локально

1. **Клонувати або Скопіювати приклад**  
   ```bash
   # Перейдіть до потрібного прикладу
   cd examples/simple-web-app
   ```
  
2. **Ініціалізувати оточення AZD**  
   ```bash
   # Ініціалізувати з існуючого шаблону
   azd init
   
   # Або створити нове середовище
   azd env new my-environment
   ```
  
3. **Налаштувати оточення**  
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
   
   # Протестувати кінцеву точку (приклад)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Очікувані індикатори успіху:**  
   - ✅ `azd up` завершується без помилок  
   - ✅ Точка доступу сервісу повертає HTTP 200  
   - ✅ В Azure Portal статус “Running”  
   - ✅ Application Insights отримує телеметрію

> **⚠️ Проблеми?** Дивіться [Типові проблеми](../docs/chapter-07-troubleshooting/common-issues.md) для усунення несправностей розгортання

### Адаптація прикладів

Кожен приклад містить:  
- **README.md** - Детальні інструкції з налаштування та кастомізації  
- **azure.yaml** - Конфігурація AZD з коментарями  
- **infra/** - Bicep шаблони з поясненнями параметрів  
- **src/** - Приклад коду додатку  
- **scripts/** - Допоміжні скрипти для поширених завдань

## 🎯 Навчальні цілі

### Категорії прикладів

#### **Базові розгортання**
- Односервісні додатки  
- Прості інфраструктурні патерни  
- Базове управління конфігурацією  
- Економічні розробницькі конфігурації

#### **Просунуті сценарії**
- Багатосервісні архітектури  
- Складні мережеві конфігурації  
- Патерни інтеграції баз даних  
- Реалізації безпеки та відповідності

#### **Патерни готовності до виробництва**
- Конфігурації з високою доступністю  
- Моніторинг та спостережливість  
- Інтеграція CI/CD  
- Налаштування аварійного відновлення

## 📖 Опис прикладів

### Проста веб-програма – Node.js Express  
**Технології**: Node.js, Express, MongoDB, Container Apps  
**Складність**: Початковий рівень  
**Концепції**: Базове розгортання, REST API, інтеграція NoSQL бази даних

### Статичний вебсайт – React SPA  
**Технології**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Складність**: Початковий рівень  
**Концепції**: Статичний хостинг, безсерверний бекенд, сучасна веб-розробка

### Container App – Python Flask  
**Технології**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Складність**: Початковий рівень  
**Концепції**: Контейнеризація, REST API, масштабування до нуля, health probes, моніторинг  
**Місцезнаходження**: [Локальний приклад](../../../examples/container-app/simple-flask-api)

### Container App – Архітектура мікросервісів  
**Технології**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Складність**: Просунутий рівень  
**Концепції**: Багатосервісна архітектура, комунікація між сервісами, черги повідомлень, розподілене трасування  
**Місцезнаходження**: [Локальний приклад](../../../examples/container-app/microservices)

### Програма з базою даних – C# з Azure SQL  
**Технології**: C# ASP.NET Core, Azure SQL Database, App Service  
**Складність**: Середній рівень  
**Концепції**: Entity Framework, підключення до баз даних, розробка веб-API

### Serverless Function – Python Azure Functions  
**Технології**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Складність**: Середній рівень  
**Концепції**: Подієво-орієнтована архітектура, безсерверні обчислення, повний стек розробки

### Мікросервіси – Java Spring Boot  
**Технології**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Складність**: Середній рівень  
**Концепції**: Комунікація мікросервісів, розподілені системи, корпоративні патерни

### Приклади Microsoft Foundry

#### Azure OpenAI Chat App  
**Технології**: Azure OpenAI, Cognitive Search, App Service  
**Складність**: Середній рівень  
**Концепції**: Архітектура RAG, векторний пошук, інтеграція великих мовних моделей (LLM)

#### AI Document Processing  
**Технології**: Azure AI Document Intelligence, Storage, Functions  
**Складність**: Середній рівень  
**Концепції**: Аналіз документів, OCR, вилучення даних

#### Machine Learning Pipeline  
**Технології**: Azure ML, MLOps, Container Registry  
**Складність**: Просунутий рівень  
**Концепції**: Навчання моделей, конвеєри розгортання, моніторинг

## 🛠 Приклади конфігурацій

Папка `configurations/` містить багаторазові компоненти:

### Конфігурації оточення
- Налаштування для розробки  
- Конфігурації середовища тестування (staging)  
- Конфігурації готові до виробництва  
- Розгортання у кількох регіонах

### Модулі Bicep
- Багаторазові компоненти інфраструктури  
- Загальні патерни ресурсів  
- Шаблони з підвищеним рівнем безпеки  
- Оптимізовані за вартістю конфігурації

### Допоміжні скрипти
- Автоматизація налаштування оточення  
- Скрипти для міграції бази даних  
- Інструменти для валідації розгортання  
- Утиліти моніторингу витрат

## 🔧 Посібник з налаштування

### Адаптація прикладів під ваш випадок

1. **Перевірте вимоги**  
   - Оцініть вимоги до сервісів Azure  
   - Перевірте ліміти підписки  
   - Зрозумійте вплив на витрати

2. **Змініть конфігурацію**  
   - Оновіть визначення сервісів у `azure.yaml`  
   - Налаштуйте Bicep шаблони  
   - Змініть змінні оточення

3. **Ретельно протестуйте**  
   - Спершу розгорніть у середовищі розробки  
   - Перевірте функціональність  
   - Протестуйте масштабованість і продуктивність

4. **Перевірка безпеки**  
   - Оцініть контрольно-доступові механізми  
   - Реалізуйте управління секретами  
   - Увімкніть моніторинг та оповіщення

## 📊 Таблиця порівняння

| Приклад | Сервіси | База даних | Аутентифікація | Моніторинг | Складність |
|---------|----------|------------|----------------|------------|------------|
| **Azure OpenAI Chat** (Локальний) | 2 | ❌ | Key Vault | Повний | ⭐⭐ |
| **Python Flask API** (Локальний) | 1 | ❌ | Базова | Повний | ⭐ |
| **Мікросервіси** (Локальний) | 5+ | ✅ | Корпоративна | Просунутий | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Базова | Базова | ⭐ |
| React SPA + Functions | 3 | ✅ | Базова | Повний | ⭐ |
| Python Flask Container | 2 | ❌ | Базова | Повний | ⭐ |
| C# Web API + SQL | 2 | ✅ | Повна | Повний | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Повна | Повний | ⭐⭐ |
| Java Мікросервіси | 5+ | ✅ | Повна | Повний | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Повна | Повний | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Базова | Повний | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Повна | Повний | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Локальний) | **8+** | **✅** | **Корпоративна** | **Просунутий** | **⭐⭐⭐⭐** |

## 🎓 Навчальний шлях

### Рекомендований порядок

1. **Почніть з простої веб-програми**  
   - Вивчіть базові концепції AZD  
   - Зрозумійте робочий процес розгортання  
   - Попрактикуйтесь у керуванні оточенням

2. **Спробуйте статичний сайт**  
   - Дослідіть різні варіанти хостингу  
   - Вивчіть інтеграцію CDN  
   - Зрозумійте конфігурацію DNS

3. **Перейдіть до Container App**  
   - Вивчіть основи контейнеризації  
   - Зрозумійте концепції масштабування  
   - Попрактикуйтесь із Docker

4. **Додайте інтеграцію бази даних**  
   - Вивчіть провізування бази даних  
   - Зрозумійте рядки підключення  
   - Опануйте управління секретами

5. **Ознайомтесь з безсерверними обчисленнями**  
   - Зрозумійте подієву архітектуру  
   - Вивчіть тригери та биндинги  
   - Попрактикуйтесь з API

6. **Створіть мікросервіси**  
   - Вивчіть комунікацію сервісів  
   - Зрозумійте розподілені системи  
   - Попрактикуйтесь у складних розгортаннях

## 🔍 Як знайти потрібний приклад

### За технологічним стеком  
- **Container Apps**: [Python Flask API (Локальний)](../../../examples/container-app/simple-flask-api), [Мікросервіси (Локальний)](../../../examples/container-app/microservices), Java Мікросервіси  
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Локальний)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Локальний)](../../../examples/container-app/simple-flask-api), [Мікросервіс Product (Локальний)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Мікросервіс Order (Локальний)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline  
- **Go**: [Мікросервіс User (Локальний)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Мікросервіси  
- **React**: React SPA + Functions  
- **Контейнери**: [Python Flask (Локальний)](../../../examples/container-app/simple-flask-api), [Мікросервіси (Локальний)](../../../examples/container-app/microservices), Java Мікросервіси  
- **Бази даних**: [Мікросервіси (Локальний)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Локальний)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Системи з кількома агентами**: **Retail Multi-Agent Solution**  
- **Інтеграція OpenAI**: **[Azure OpenAI Chat (Локальний)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Промислове виробництво для підприємств**: [Мікросервіси (Локальний)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### За архітектурним патерном  
- **Простий REST API**: [Python Flask API (Локальний)](../../../examples/container-app/simple-flask-api)  
- **Моноліт**: Node.js Express Todo, C# Web API + SQL  
- **Статичний + безсерверний**: React SPA + Functions, Python Functions + SPA  
- **Мікросервіси**: [Production Microservices (Локальний)](../../../examples/container-app/microservices), Java Spring Boot Мікросервіси  
- **Контейнеризований**: [Python Flask (Локальний)](../../../examples/container-app/simple-flask-api), [Мікросервіси (Локальний)](../../../examples/container-app/microservices)  
- **З AI**: **[Azure OpenAI Chat (Локальний)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Архітектура з кількома агентами**: **Retail Multi-Agent Solution**  
- **Корпоративний мультисервіс**: [Мікросервіси (Локальний)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### За рівнем складності  
- **Початковий рівень**: [Python Flask API (Локальний)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Середній рівень**: **[Azure OpenAI Chat (Локальний)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Мікросервіси, Azure OpenAI Chat App, AI Document Processing  
- **Просунутий**: ML Pipeline  
- **Готовий до виробництва на рівні підприємства**: [Мікросервіси (Локальний)](../../../examples/container-app/microservices) (Багатосервісна система з чергами повідомлень), **Retail Multi-Agent Solution** (Повна система з кількома агентами з ARM шаблоном розгортання)

## 📚 Додаткові ресурси

### Посилання на документацію  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Документація Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Приклади спільноти  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)  
- [Todo App з C# та Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App з Python та MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Додаток Todo з Node.js та PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Веб-додаток React з API на C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions з Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Best Practices
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Внесок прикладів

Є корисний приклад для спільного користування? Ми вітаємо внески!

### Керівництво з подачі
1. Дотримуйтесь встановленої структури директорій
2. Включайте докладний README.md
3. Додавайте коментарі до конфігураційних файлів
4. Ретельно тестуйте перед поданням
5. Включайте оцінки вартості та передумови

### Шаблон структури прикладу
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

**Професійна порада**: Починайте з найпростішого прикладу, що відповідає вашому технологічному стеку, потім поступово переходьте до більш складних сценаріїв. Кожен приклад базується на концепціях з попередніх!

## 🚀 Готові почати?

### Ваш навчальний шлях

1. **Повний початківець?** → Почніть з [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 хв)
2. **Маєте базові знання AZD?** → Спробуйте [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 хв)
3. **Створюєте AI-додатки?** → Почніть з [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 хв) або дослідіть [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, понад 2 години)
4. **Потрібен конкретний технологічний стек?** → Використовуйте розділ [Finding the Right Example](../../../examples) вище

### Наступні кроки

- ✅ Перегляньте розділ [Prerequisites](../../../examples) вище
- ✅ Оберіть приклад, що відповідає вашому рівню навичок (див. [Complexity Legend](../../../examples))
- ✅ Уважно прочитайте README прикладу перед розгортанням
- ✅ Встановіть нагадування виконати `azd down` після тестування
- ✅ Поділіться досвідом через Issues або Discussions на GitHub

### Потрібна допомога?

- 📖 [FAQ](../resources/faq.md) – Відповіді на поширені питання
- 🐛 [Посібник з усунення несправностей](../docs/chapter-07-troubleshooting/common-issues.md) – Вирішення проблем із розгортанням
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) – Запитайте спільноту
- 📚 [Навчальний посібник](../resources/study-guide.md) – Закріплення знань

---

**Навігація**
- **📚 Головна курсів**: [AZD For Beginners](../README.md)
- **📖 Навчальні матеріали**: [Навчальний посібник](../resources/study-guide.md) | [Шпаргалка](../resources/cheat-sheet.md) | [Глосарій](../resources/glossary.md)
- **🔧 Ресурси**: [FAQ](../resources/faq.md) | [Усунення несправностей](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Останнє оновлення: листопад 2025 | [Повідомити про проблеми](https://github.com/microsoft/AZD-for-beginners/issues) | [Внести приклади](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, просимо враховувати, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується звертатися до професійного людського перекладу. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->