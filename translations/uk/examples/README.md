# Приклади - Практичні шаблони та конфігурації AZD

**Вивчення на прикладі - організовано за розділами**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../README.md)
- **📖 Відповідність розділів**: Приклади організовано за рівнем складності навчання
- **🚀 Локальний приклад**: [Роздрібне багатокористувацьке рішення](retail-scenario.md)
- **🤖 Зовнішні AI приклади**: Посилання на репозиторії Azure Samples

> **📍 ВАЖЛИВО: Локальні проти зовнішніх прикладів**  
> У цьому репозиторії містяться **4 повні локальні приклади** з повними реалізаціями:  
> - **Microsoft Foundry Models Chat** (розгортання gpt-4.1 із чат-інтерфейсом)  
> - **Container Apps** (проста Flask API + мікросервіси)  
> - **Database App** (веб + база даних SQL)  
> - **Retail Multi-Agent** (підприємницьке AI-рішення)  
>  
> Додаткові приклади є **зовнішніми посиланнями** на репозиторії Azure-Samples, які можна клонувати.

## Вступ

Цей каталог містить практичні приклади та посилання, які допоможуть вам вивчити Azure Developer CLI через практичні вправи. Сценарій Retail Multi-Agent — це повноцінна, готова до виробництва реалізація, включена в цей репозиторій. Додаткові приклади посилаються на офіційні Azure Samples, які демонструють різноманітні AZD шаблони.

### Легенда оцінки складності

- ⭐ **Початковий рівень** – базові поняття, один сервіс, 15-30 хвилин
- ⭐⭐ **Середній рівень** – кілька сервісів, інтеграція бази даних, 30-60 хвилин
- ⭐⭐⭐ **Високий рівень** – складна архітектура, інтеграція AI, 1-2 години
- ⭐⭐⭐⭐ **Експертний рівень** – готове для виробництва, підприємницькі шаблони, понад 2 години

## 🎯 Що фактично міститься в цьому репозиторії

### ✅ Локальна реалізація (готова до використання)

#### [Додаток Microsoft Foundry Models Chat](azure-openai-chat/README.md) 🆕  
**Повне розгортання gpt-4.1 із чат-інтерфейсом, включене в цей репозиторій**

- **Розташування:** `examples/azure-openai-chat/`
- **Складність:** ⭐⭐ (Середній рівень)
- **Що включено:**
  - Повне розгортання Microsoft Foundry Models (gpt-4.1)
  - Інтерфейс чату командного рядка на Python
  - Інтеграція з Key Vault для безпечних API-ключів
  - Шаблони інфраструктури Bicep
  - Відстеження використання токенів та витрат
  - Обмеження частоти запитів та обробка помилок

**Швидкий старт:**  
```bash
# Перейти до прикладу
cd examples/azure-openai-chat

# Розгорнути все
azd up

# Встановити залежності та почати чатитися
pip install -r src/requirements.txt
python src/chat.py
```
  
**Технології:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Приклади Container App](container-app/README.md) 🆕  
**Комплексні приклади розгортання контейнерів, включені у репозиторій**

- **Розташування:** `examples/container-app/`
- **Складність:** ⭐-⭐⭐⭐⭐ (від початкового до експертного рівня)
- **Що включено:**
  - [Посібник майстра](container-app/README.md) – повний огляд розгортання контейнерів
  - [Проста Flask API](../../../examples/container-app/simple-flask-api) – базовий приклад REST API
  - [Архітектура мікросервісів](../../../examples/container-app/microservices) – готове до виробництва розгортання багатосервісної системи
  - Швидкий старт, виробничі та просунуті шаблони
  - Моніторинг, безпека та оптимізація витрат

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
**Повна реалізація, готова до виробництва, включена у цей репозиторій**

- **Розташування:** `examples/retail-multiagent-arm-template/`
- **Складність:** ⭐⭐⭐⭐ (Високий рівень)
- **Що включено:**
  - Повний ARM-шаблон розгортання
  - Архітектура багатьох агентів (Клієнт + Інвентар)
  - Інтеграція Microsoft Foundry Models
  - AI-пошук із RAG
  - Комплексний моніторинг
  - Скрипт розгортання в один клік

**Швидкий старт:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Технології:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Зовнішні Azure Samples (клонуйте для використання)

Наступні приклади підтримуються в офіційних репозиторіях Azure-Samples. Клонуйте їх, щоб вивчити різні шаблони AZD:

### Простi додатки (розділи 1-2)

| Шаблон | Репозиторій | Складність | Сервіси |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Локально: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Мікросервіси** | [Локально: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Багатосервісний, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Як користуватись:**  
```bash
# Клонуйте будь-який приклад
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Розгорнути
azd up
```
  
### Приклади AI-додатків (розділи 2, 5, 8)

| Шаблон | Репозиторій | Складність | Фокус |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Локально: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Розгортання gpt-4.1 |
| **Швидкий старт AI чату** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Базовий AI чат |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Агентська структура |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Шаблон RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Підприємницький AI |

### Бази даних та просунуті шаблони (розділи 3-8)

| Шаблон | Репозиторій | Складність | Фокус |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Інтеграція бази даних |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Безсерверний NoSQL |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Багатосервісний |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Навчальні цілі

Працюючи з цими прикладами, ви:  
- Практикуватимете робочі процеси Azure Developer CLI із реалістичними сценаріями додатків  
- Зрозумієте різні архітектури додатків та їх azd реалізації  
- Освоїте шаблони інфраструктури як коду для різних сервісів Azure  
- Застосуєте стратегії управління конфігурацією та середовищем у розгортанні  
- Реалізуєте моніторинг, безпеку та шаблони масштабування на практиці  
- Отримаєте досвід усунення несправностей і відлагодження реальних сценаріїв розгортання  

## Результати навчання

Після виконання цих прикладів ви зможете:  
- Впевнено розгортати різні типи додатків за допомогою Azure Developer CLI  
- Адаптувати надані шаблони до власних вимог додатку  
- Проєктувати та впроваджувати власні інфраструктурні шаблони за допомогою Bicep  
- Налагоджувати складні багатосервісні додатки з правильним управлінням залежностями  
- Застосовувати найкращі практики безпеки, моніторингу та продуктивності в реальних проєктах  
- Усувати неполадки та оптимізувати розгортання, спираючись на практичний досвід  

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
  
## Швидкі приклади старту

> **💡 Новачок в AZD?** Почніть із прикладу №1 (Flask API) — це займе ~20 хвилин та навчить основам.

### Для початківців
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Локальний) ⭐  
   Розгорніть просте REST API зі масштабуванням до нуля  
   **Час:** 20-25 хвилин | **Вартість:** $0-5/місяць  
   **Вивчите:** базовий робочий процес azd, контейнеризацію, перевірки стану  
   **Очікуваний результат:** робоча точка доступу API з відправленням "Hello, World!" та моніторингом

2. **[Простий веб-додаток - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Розгорніть веб-додаток Node.js Express з MongoDB  
   **Час:** 25-35 хвилин | **Вартість:** $10-30/місяць  
   **Вивчите:** інтеграцію бази даних, змінні середовища, рядки підключення  
   **Очікуваний результат:** додаток списку справ з функціями CRUD

3. **[Статичний вебсайт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Розміщення статичного вебсайту React через Azure Static Web Apps  
   **Час:** 20-30 хвилин | **Вартість:** $0-10/місяць  
   **Вивчите:** статичний хостинг, безсерверні функції, розгортання CDN  
   **Очікуваний результат:** інтерфейс React з API бекендом, автоматичний SSL, глобальний CDN

### Для користувачів середнього рівня
4. **[Додаток Microsoft Foundry Models Chat](../../../examples/azure-openai-chat)** (Локальний) ⭐⭐  
   Розгортання gpt-4.1 з чат-інтерфейсом і безпечним управлінням API ключами  
   **Час:** 35-45 хвилин | **Вартість:** $50-200/місяць  
   **Вивчите:** розгортання Microsoft Foundry Models, інтеграцію Key Vault, відстеження токенів  
   **Очікуваний результат:** робочий чат-додаток із gpt-4.1 та моніторингом витрат

5. **[Container App - Мікросервіси](../../../examples/container-app/microservices)** (Локальний) ⭐⭐⭐⭐  
   Готова до виробництва багатосервісна архітектура  
   **Час:** 45-60 хвилин | **Вартість:** $50-150/місяць  
   **Вивчите:** комунікація сервісів, черги повідомлень, розподілене трасування  
   **Очікуваний результат:** система з 2 сервісів (API Gateway + Product Service) із моніторингом

6. **[Database App - C# з Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Веб-додаток із C# API та базою даних Azure SQL  
   **Час:** 30-45 хвилин | **Вартість:** $20-80/місяць  
   **Вивчите:** Entity Framework, міграції бази даних, безпеку підключень  
   **Очікуваний результат:** C# API з backend Azure SQL, автоматичне розгортання схеми

7. **[Безсерверна функція - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions з HTTP-тригерами та Cosmos DB  
   **Час:** 30-40 хвилин | **Вартість:** $10-40/місяць  
   **Вивчите:** подійно-орієнтовану архітектуру, безсерверне масштабування, інтеграцію NoSQL  
   **Очікуваний результат:** функція, що відповідає на HTTP-запити з використанням Cosmos DB

8. **[Мікросервіси - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Багатосервісний Java додаток із Container Apps і API Gateway  
   **Час:** 60-90 хвилин | **Вартість:** $80-200/місяць  
   **Вивчите:** розгортання Spring Boot, сервісна сітка, балансування навантаження  
   **Очікуваний результат:** багатосервісна Java система з пошуком сервісів і маршрутизацією

### Шаблони Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - локальний приклад](../../../examples/azure-openai-chat)** ⭐⭐  
   Повне розгортання gpt-4.1 із чат-інтерфейсом  
   **Час:** 35-45 хвилин | **Вартість:** $50-200/місяць  
   **Очікуваний результат:** робочий чат-додаток із відстеженням токенів і моніторингом витрат

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Інтелектуальний чат-додаток із архітектурою RAG  
   **Час:** 60-90 хвилин | **Вартість:** $100-300/місяць  
   **Очікуваний результат:** чат з RAG-прив’язкою до документів і цитуванням

3. **[Обробка документів AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Аналіз документів за допомогою сервісів Azure AI  
   **Час:** 40-60 хвилин | **Вартість:** $20-80/місяць  
   **Очікуваний результат:** API витягує текст, таблиці та сутності з завантажених документів

4. **[Конвеєр машинного навчання](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps робочий процес із Azure Machine Learning  
   **Час:** 2-3 години | **Вартість:** $150-500/місяць  
   **Очікуваний результат:** автоматизований ML конвеєр із навчанням, розгортанням та моніторингом

### Реальні сценарії

#### **Рішення Retail Multi-Agent** 🆕  
**[Повний посібник з реалізації](./retail-scenario.md)**

Всебічне багатокористувацьке рішення підтримки клієнтів, готове до виробництва, яке демонструє розгортання AI-додатку підприємницького рівня з AZD. Цей сценарій включає:
- **Повна архітектура**: Мультиагентна система зі спеціалізованими агентами для обслуговування клієнтів та управління запасами  
- **Інфраструктура для продакшену**: Розгортання моделей Microsoft Foundry у кількох регіонах, AI Search, Container Apps та комплексний моніторинг  
- **Готовий до розгортання ARM шаблон**: Розгортання одним кліком з кількома режимами конфігурації (Minimal/Standard/Premium)  
- **Розширені функції**: Перевірка безпеки red teaming, фреймворк для оцінки агентів, оптимізація витрат та керівництва з усунення неполадок  
- **Реальний бізнес-контекст**: Використання у підтримці клієнтів роздрібного продавця з завантаженням файлів, інтеграцією пошуку та динамічним масштабуванням  

**Технології**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Складність**: ⭐⭐⭐⭐ (Поглиблений – готовий до підприємницького використання у продакшені)  

**Ідеально підходить для**: розробників ШІ, архітекторів рішень та команд, що створюють мультиагентні системи для продакшену  

**Швидкий старт**: Розгорніть повне рішення менш ніж за 30 хвилин, використовуючи включений ARM шаблон з `./deploy.sh -g myResourceGroup`  

## 📋 Інструкції з використання  

### Вимоги  

Перед запуском будь-якого прикладу:  
- ✅ Передплата Azure з доступом Owner або Contributor  
- ✅ Встановлений Azure Developer CLI ([Посібник з встановлення](../docs/chapter-01-foundation/installation.md))  
- ✅ Працюючий Docker Desktop (для прикладів із контейнерами)  
- ✅ Відповідні квоти Azure (перевірте вимоги для конкретного прикладу)  

> **💰 Попередження про вартість:** Всі приклади створюють реальні ресурси Azure, що спричиняють витрати. Перегляньте окремі README файли для оцінки вартості. Не забудьте виконати `azd down` після завершення, щоб уникнути постійних витрат.  

### Запуск прикладів локально  

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
  
   **Очікувані ознаки успіху:**  
   - ✅ `azd up` завершується без помилок  
   - ✅ Кінцева точка сервісу повертає HTTP 200  
   - ✅ Портал Azure показує статус "Running"  
   - ✅ Application Insights отримує телеметрію  

> **⚠️ Проблеми?** Перегляньте [Типові проблеми](../docs/chapter-07-troubleshooting/common-issues.md) для вирішення проблем при розгортанні  

### Адаптація прикладів  

Кожен приклад містить:  
- **README.md** – детальні інструкції зі встановлення та адаптації  
- **azure.yaml** – конфігурація AZD з коментарями  
- **infra/** – Bicep шаблони з поясненнями параметрів  
- **src/** – приклад коду додатку  
- **scripts/** – допоміжні скрипти для типових завдань  

## 🎯 Навчальні цілі  

### Категорії прикладів  

#### **Базові розгортання**  
- Додатки з одним сервісом  
- Прості шаблони інфраструктури  
- Базове управління конфігурацією  
- Економні налаштування для розробки  

#### **Просунуті сценарії**  
- Архітектури з кількома сервісами  
- Складні мережеві конфігурації  
- Шаблони інтеграції з базами даних  
- Реалізація безпеки та відповідності  

#### **Шаблони, готові до продакшену**  
- Конфігурації з високою доступністю  
- Моніторинг і спостережність  
- Інтеграція з CI/CD  
- Налаштування аварійного відновлення  

## 📖 Опис прикладів  

### Простий веб-додаток - Node.js Express  
**Технології**: Node.js, Express, MongoDB, Container Apps  
**Складність**: Для початківців  
**Концепції**: Базове розгортання, REST API, інтеграція з NoSQL базою  

### Статичний вебсайт - React SPA  
**Технології**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Складність**: Для початківців  
**Концепції**: Статичний хостинг, безсерверний бекенд, сучасна веб-розробка  

### Container App - Python Flask  
**Технології**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Складність**: Для початківців  
**Концепції**: Контейнеризація, REST API, масштабування до нуля, health probes, моніторинг  
**Місцезнаходження**: [Локальний приклад](../../../examples/container-app/simple-flask-api)  

### Container App - Архітектура мікросервісів  
**Технології**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Складність**: Поглиблений  
**Концепції**: Мультисервісна архітектура, комунікація між сервісами, черги повідомлень, розподілене трасування  
**Місцезнаходження**: [Локальний приклад](../../../examples/container-app/microservices)  

### Додаток з базою даних - C# з Azure SQL  
**Технології**: C# ASP.NET Core, Azure SQL Database, App Service  
**Складність**: Середній  
**Концепції**: Entity Framework, підключення до БД, розробка web API  

### Безсерверна функція - Python Azure Functions  
**Технології**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Складність**: Середній  
**Концепції**: Подієво-орієнтована архітектура, безсерверна обробка, розробка full-stack  

### Мікросервіси - Java Spring Boot  
**Технології**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Складність**: Середній  
**Концепції**: Комунікація мікросервісів, розподілені системи, підприємницькі шаблони  

### Приклади Microsoft Foundry  

#### Чат-додаток Microsoft Foundry Models  
**Технології**: Microsoft Foundry Models, Cognitive Search, App Service  
**Складність**: Середній  
**Концепції**: RAG архітектура, векторний пошук, інтеграція LLM  

#### Обробка документів за допомогою ШІ  
**Технології**: Azure AI Document Intelligence, Storage, Functions  
**Складність**: Середній  
**Концепції**: Аналіз документів, OCR, вилучення даних  

#### Pipeline машинного навчання  
**Технології**: Azure ML, MLOps, Container Registry  
**Складність**: Поглиблений  
**Концепції**: Навчання моделей, конвеєри розгортання, моніторинг  

## 🛠 Приклади конфігурації  

Директорія `configurations/` містить багаторазові компоненти:  

### Конфігурації середовища  
- Налаштування для середовища розробки  
- Конфігурації для стейджингу  
- Готові до продакшену конфігурації  
- Розгортання у кількох регіонах  

### Bicep модулі  
- Багаторазові компоненти інфраструктури  
- Загальні шаблони ресурсів  
- Шаблони з підвищеною безпекою  
- Оптимізовані за вартістю конфігурації  

### Допоміжні скрипти  
- Автоматизація налаштування середовища  
- Скрипти міграції баз даних  
- Засоби перевірки розгортання  
- Утиліти моніторингу витрат  

## 🔧 Керівництво з налаштування  

### Адаптація прикладів для вашого випадку  

1. **Перевірте вимоги**  
   - Перевірте вимоги до служб Azure  
   - Переконайтеся в обмеженнях передплати  
   - Оцініть вплив на вартість  

2. **Змініть конфігурацію**  
   - Оновіть визначення служб у `azure.yaml`  
   - Налаштуйте Bicep шаблони  
   - Відкоригуйте змінні середовища  

3. **Ретельно протестуйте**  
   - Спершу розгорніть у середовищі розробки  
   - Перевірте функціональність  
   - Тестуйте масштабування та продуктивність  

4. **Перевірка безпеки**  
   - Перегляньте контроль доступу  
   - Впровадьте управління секретами  
   - Увімкніть моніторинг та оповіщення  

## 📊 Порівняльна матриця  

| Приклад | Сервіси | База даних | Аутентифікація | Моніторинг | Складність |  
|---------|----------|------------|----------------|------------|------------|  
| **Microsoft Foundry Models Chat** (Локальний) | 2 | ❌ | Key Vault | Повний | ⭐⭐ |  
| **Python Flask API** (Локальний) | 1 | ❌ | Базовий | Повний | ⭐ |  
| **Мікросервіси** (Локальний) | 5+ | ✅ | Enterprise | Поглиблений | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Базовий | Базовий | ⭐ |  
| React SPA + Functions | 3 | ✅ | Базовий | Повний | ⭐ |  
| Python Flask Container | 2 | ❌ | Базовий | Повний | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Повний | Повний | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Повний | Повний | ⭐⭐ |  
| Java Microservices | 5+ | ✅ | Повний | Повний | ⭐⭐ |  
| Microsoft Foundry Models Chat | 3 | ✅ | Повний | Повний | ⭐⭐⭐ |  
| AI Document Processing | 2 | ❌ | Базовий | Повний | ⭐⭐ |  
| ML Pipeline | 4+ | ✅ | Повний | Повний | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (Локальний) | **8+** | **✅** | **Enterprise** | **Поглиблений** | **⭐⭐⭐⭐** |  

## 🎓 Навчальна траєкторія  

### Рекомендований порядок  

1. **Почніть з простого веб-додатку**  
   - Вивчіть базові концепції AZD  
   - Зрозумійте робочий процес розгортання  
   - Попрактикуйтеся в управлінні середовищем  

2. **Спробуйте статичний вебсайт**  
   - Дослідіть різні варіанти хостингу  
   - Вивчіть інтеграцію CDN  
   - Зрозумійте налаштування DNS  

3. **Перейдіть до Container App**  
   - Навчіться основ контейнеризації  
   - Зрозумійте концепції масштабування  
   - Порадуйтеся Docker  

4. **Додайте інтеграцію бази даних**  
   - Вивчіть розгортання бази даних  
   - Зрозумійте рядки підключення  
   - Практикуйте управління секретами  

5. **Вивчайте безсерверні технології**  
   - Зрозумійте подієво-орієнтовану архітектуру  
   - Навчіться про тригери та прив’язки  
   - Попрактикуйтеся з API  

6. **Створюйте мікросервіси**  
   - Вивчіть комунікацію між сервісами  
   - Зрозумійте розподілені системи  
   - Працюйте з комплексними розгортаннями  

## 🔍 Пошук підходящого прикладу  

### За технологічним стеком  
- **Container Apps**: [Python Flask API (Локальний)](../../../examples/container-app/simple-flask-api), [Мікросервіси (Локальний)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Локальний)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Локальний)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Локальний)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservices Order Service (Локальний)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go**: [Microservices User Service (Локальний)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **Контейнери**: [Python Flask (Локальний)](../../../examples/container-app/simple-flask-api), [Мікросервіси (Локальний)](../../../examples/container-app/microservices), Java Microservices  
- **Бази даних**: [Мікросервіси (Локальний)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **ШІ/МЛ**: **[Microsoft Foundry Models Chat (Локальний)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Мультиагентні системи**: **Retail Multi-Agent Solution**  
- **Інтеграція OpenAI**: **[Microsoft Foundry Models Chat (Локальний)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Підприємницький продакшен**: [Мікросервіси (Локальний)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### За архітектурним шаблоном  
- **Простий REST API**: [Python Flask API (Локальний)](../../../examples/container-app/simple-flask-api)  
- **Монотонний**: Node.js Express Todo, C# Web API + SQL  
- **Статичний + безсерверний**: React SPA + Functions, Python Functions + SPA  
- **Мікросервіси**: [Production Microservices (Локальний)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **Контейнеризовані**: [Python Flask (Локальний)](../../../examples/container-app/simple-flask-api), [Мікросервіси (Локальний)](../../../examples/container-app/microservices)  
- **З підтримкою ШІ**: **[Microsoft Foundry Models Chat (Локальний)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Мультиагентна архітектура**: **Retail Multi-Agent Solution**  
- **Підприємницькі мультисервісні системи**: [Мікросервіси (Локальний)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### За рівнем складності  
- **Початковий**: [Python Flask API (Локальний)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Середній**: **[Microsoft Foundry Models Chat (Локальний)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing  
- **Поглиблений**: ML Pipeline  
- **Підприємницький, готовий до продакшену**: [Мікросервіси (Локальний)](../../../examples/container-app/microservices) (Мультисервісна система з чергами повідомлень), **Retail Multi-Agent Solution** (Повна мультиагентна система з розгортанням ARM шаблоном)  

## 📚 Додаткові ресурси  

### Посилання на документацію  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Документація Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Приклади від спільноти  
- [Приклади Azure AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Шаблони Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)
- [Галерея Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Додаток Todo з C# і Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Додаток Todo з Python і MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Додаток Todo з Node.js і PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Веб-додаток React з C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Задача Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions з Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Кращі практики
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Внесок прикладів

Є корисний приклад, яким хочете поділитися? Ми вітаємо внески!

### Керівництво з подачі
1. Дотримуйтесь встановленої структури каталогів
2. Включіть вичерпний README.md
3. Додавайте коментарі до конфігураційних файлів
4. Ретельно тестуйте перед подачею
5. Включайте оцінки вартості та передумови

### Структура прикладу шаблону
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

**Порада від професіонала**: Починайте з найпростіших прикладів, які відповідають вашому технологічному стеку, а потім поступово переходьте до більш складних сценаріїв. Кожен приклад будується на концепціях попередніх!

## 🚀 Готові почати?

### Ваш навчальний шлях

1. **Повний початківець?** → Почніть з [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 хв)
2. **Основи AZD вже знаєте?** → Спробуйте [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 хв)
3. **Створюєте AI додатки?** → Почніть з [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 хв) або дослідіть [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, понад 2 години)
4. **Потрібен конкретний технологічний стек?** → Використовуйте розділ [Пошук відповідного прикладу](#-finding-the-right-example) вище

### Наступні кроки

- ✅ Перегляньте [Передумови](#вимоги) вище
- ✅ Виберіть приклад, що відповідає вашому рівню (див. [Легенду складності](#легенда-оцінки-складності))
- ✅ Ретельно прочитайте README прикладу перед розгортанням
- ✅ Встановіть нагадування про запуск `azd down` після тестування
- ✅ Поділіться своїм досвідом через GitHub Issues або Discussions

### Потрібна допомога?

- 📖 [FAQ](../resources/faq.md) - Відповіді на поширені запитання
- 🐛 [Посібник з усунення несправностей](../docs/chapter-07-troubleshooting/common-issues.md) - Виправлення проблем з розгортанням
- 💬 [Обговорення GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Питайте у спільноти
- 📚 [Посібник для навчання](../resources/study-guide.md) - Закріпіть свої знання

---

**Навігація**
- **📚 Головна курсу**: [AZD For Beginners](../README.md)
- **📖 Навчальні матеріали**: [Посібник](../resources/study-guide.md) | [Довідник](../resources/cheat-sheet.md) | [Глосарій](../resources/glossary.md)
- **🔧 Ресурси**: [FAQ](../resources/faq.md) | [Усунення несправностей](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Останнє оновлення: листопад 2025 | [Повідомити про проблеми](https://github.com/microsoft/AZD-for-beginners/issues) | [Внести приклади](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, просимо враховувати, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується звертатися до професійного людського перекладу. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->