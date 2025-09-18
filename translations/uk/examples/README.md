<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-18T13:51:19+00:00",
  "source_file": "examples/README.md",
  "language_code": "uk"
}
-->
# Приклади - Практичні шаблони та конфігурації AZD

**Навчання на прикладах - організовано за розділами**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../README.md)
- **📖 Відповідність розділів**: Приклади, організовані за складністю навчання
- **🚀 Почніть з простого**: [Приклади розділу 1](../../../examples)
- **🤖 Приклади AI**: [Розділи 2 та 5 - AI-рішення](../../../examples)

## Вступ

Ця директорія містить практичні приклади, шаблони та реальні сценарії, які допоможуть вам навчитися працювати з Azure Developer CLI через практичні завдання. Кожен приклад надає повний робочий код, шаблони інфраструктури та детальні інструкції для різних архітектур додатків і шаблонів розгортання.

## Цілі навчання

Працюючи з цими прикладами, ви зможете:
- Практикувати робочі процеси Azure Developer CLI з реалістичними сценаріями додатків
- Зрозуміти різні архітектури додатків та їх реалізацію через AZD
- Опанувати шаблони Infrastructure as Code для різних сервісів Azure
- Застосовувати стратегії управління конфігурацією та розгортання для конкретних середовищ
- Реалізовувати шаблони моніторингу, безпеки та масштабування в практичних контекстах
- Набути досвіду у вирішенні проблем і налагодженні реальних сценаріїв розгортання

## Результати навчання

Після завершення роботи з цими прикладами ви зможете:
- Упевнено розгортати різні типи додатків за допомогою Azure Developer CLI
- Адаптувати надані шаблони до ваших власних вимог додатків
- Проєктувати та реалізовувати власні шаблони інфраструктури за допомогою Bicep
- Налаштовувати складні багатосервісні додатки з правильними залежностями
- Застосовувати найкращі практики безпеки, моніторингу та продуктивності в реальних сценаріях
- Вирішувати проблеми та оптимізувати розгортання на основі практичного досвіду

## Структура директорії

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

### Для початківців
1. **[Простий веб-додаток - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Розгортання веб-додатка Node.js Express з MongoDB
2. **[Статичний вебсайт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Хостинг статичного вебсайту React з Azure Static Web Apps
3. **[Контейнерний додаток - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Розгортання контейнеризованого додатка Python Flask

### Для користувачів середнього рівня
4. **[Додаток з базою даних - C# з Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Веб-додаток з API на C# та базою даних Azure SQL
5. **[Функція без сервера - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions з HTTP-тригерами та Cosmos DB
6. **[Мікросервіси - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Багатосервісний Java-додаток з Container Apps та API Gateway

### Шаблони Azure AI Foundry

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Інтелектуальний чат-додаток з Azure OpenAI
2. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** - Аналіз документів за допомогою сервісів Azure AI
3. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** - Робочий процес MLOps з Azure Machine Learning

### Реальні сценарії

#### **Рішення для роздрібної торгівлі з багатьма агентами** 🆕
**[Повний посібник з реалізації](./retail-scenario.md)**

Комплексне, готове до виробництва рішення для підтримки клієнтів з багатьма агентами, яке демонструє розгортання AI-додатків корпоративного рівня з AZD. Цей сценарій включає:

- **Повна архітектура**: Система з багатьма агентами для спеціалізованої підтримки клієнтів та управління запасами
- **Інфраструктура для виробництва**: Розгортання Azure OpenAI у кількох регіонах, AI Search, Container Apps та комплексний моніторинг
- **Готовий до розгортання ARM-шаблон**: Одноклікове розгортання з кількома режимами конфігурації (Мінімальний/Стандартний/Преміум)
- **Розширені функції**: Перевірка безпеки, фреймворк оцінки агентів, оптимізація витрат та посібники з вирішення проблем
- **Реальний бізнес-контекст**: Сценарій підтримки клієнтів для роздрібної торгівлі з завантаженням файлів, інтеграцією пошуку та динамічним масштабуванням

**Технології**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Складність**: ⭐⭐⭐⭐ (Розширений - готовий до виробництва)

**Ідеально для**: AI-розробників, архітекторів рішень та команд, які створюють системи з багатьма агентами для виробництва

**Швидкий старт**: Розгорніть повне рішення менш ніж за 30 хвилин за допомогою включеного ARM-шаблону з `./deploy.sh -g myResourceGroup`

## 📋 Інструкції з використання

### Запуск прикладів локально

1. **Клонування або копіювання прикладу**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Ініціалізація середовища AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Налаштування середовища**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Розгортання**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Адаптація прикладів

Кожен приклад включає:
- **README.md** - Детальні інструкції з налаштування та кастомізації
- **azure.yaml** - Конфігурація AZD з коментарями
- **infra/** - Шаблони Bicep з поясненнями параметрів
- **src/** - Зразковий код додатка
- **scripts/** - Допоміжні скрипти для поширених завдань

## 🎯 Навчальні цілі

### Категорії прикладів

#### **Основні розгортання**
- Додатки з одним сервісом
- Простий шаблон інфраструктури
- Базове управління конфігурацією
- Економічно ефективні налаштування для розробки

#### **Розширені сценарії**
- Архітектури з багатьма сервісами
- Складні конфігурації мережі
- Шаблони інтеграції баз даних
- Реалізація безпеки та відповідності

#### **Шаблони готові до виробництва**
- Конфігурації високої доступності
- Моніторинг та спостереження
- Інтеграція CI/CD
- Налаштування відновлення після аварій

## 📖 Опис прикладів

### Простий веб-додаток - Node.js Express
**Технології**: Node.js, Express, MongoDB, Container Apps  
**Складність**: Початковий рівень  
**Концепції**: Базове розгортання, REST API, інтеграція NoSQL бази даних

### Статичний вебсайт - React SPA
**Технології**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Складність**: Початковий рівень  
**Концепції**: Статичний хостинг, серверний бекенд, сучасна веб-розробка

### Контейнерний додаток - Python Flask
**Технології**: Python Flask, Docker, Container Apps, Container Registry  
**Складність**: Початковий рівень  
**Концепції**: Контейнеризація, архітектура мікросервісів, розробка API

### Додаток з базою даних - C# з Azure SQL
**Технології**: C# ASP.NET Core, Azure SQL Database, App Service  
**Складність**: Середній рівень  
**Концепції**: Entity Framework, підключення до бази даних, розробка веб-API

### Функція без сервера - Python Azure Functions
**Технології**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Складність**: Середній рівень  
**Концепції**: Архітектура, керована подіями, обчислення без сервера, повноцінна розробка

### Мікросервіси - Java Spring Boot
**Технології**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Складність**: Середній рівень  
**Концепції**: Комунікація між сервісами, розподілені системи, корпоративні шаблони

### Приклади Azure AI Foundry

#### Azure OpenAI Chat App
**Технології**: Azure OpenAI, Cognitive Search, App Service  
**Складність**: Середній рівень  
**Концепції**: Архітектура RAG, векторний пошук, інтеграція LLM

#### AI Document Processing
**Технології**: Azure AI Document Intelligence, Storage, Functions  
**Складність**: Середній рівень  
**Концепції**: Аналіз документів, OCR, вилучення даних

#### Machine Learning Pipeline
**Технології**: Azure ML, MLOps, Container Registry  
**Складність**: Розширений рівень  
**Концепції**: Навчання моделей, конвеєри розгортання, моніторинг

## 🛠 Приклади конфігурацій

Директорія `configurations/` містить компоненти для повторного використання:

### Конфігурації середовища
- Налаштування середовища для розробки
- Конфігурації середовища для тестування
- Конфігурації, готові до виробництва
- Налаштування розгортання в кількох регіонах

### Модулі Bicep
- Компоненти інфраструктури для повторного використання
- Поширені шаблони ресурсів
- Шаблони з підвищеною безпекою
- Конфігурації з оптимізацією витрат

### Допоміжні скрипти
- Автоматизація налаштування середовища
- Скрипти міграції баз даних
- Інструменти перевірки розгортання
- Утиліти моніторингу витрат

## 🔧 Посібник з кастомізації

### Адаптація прикладів до ваших потреб

1. **Перевірте вимоги**
   - Переконайтеся у відповідності сервісів Azure
   - Перевірте обмеження підписки
   - Зрозумійте витрати

2. **Модифікуйте конфігурацію**
   - Оновіть визначення сервісів у `azure.yaml`
   - Кастомізуйте шаблони Bicep
   - Налаштуйте змінні середовища

3. **Тестуйте ретельно**
   - Спочатку розгорніть у середовищі для розробки
   - Перевірте функціональність
   - Тестуйте масштабування та продуктивність

4. **Перевірка безпеки**
   - Перегляньте контроль доступу
   - Реалізуйте управління секретами
   - Увімкніть моніторинг та сповіщення

## 📊 Матриця порівняння

| Приклад | Сервіси | База даних | Аутентифікація | Моніторинг | Складність |
|---------|----------|----------|------|------------|------------|
| Node.js Express Todo | 2 | ✅ | Базова | Базова | ⭐ |
| React SPA + Functions | 3 | ✅ | Базова | Повна | ⭐ |
| Python Flask Container | 2 | ❌ | Базова | Повна | ⭐ |
| C# Web API + SQL | 2 | ✅ | Повна | Повна | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Повна | Повна | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Повна | Повна | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Повна | Повна | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Базова | Повна | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Повна | Повна | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Корпоративна** | **Розширена** | **⭐⭐⭐⭐** |

## 🎓 Навчальний шлях

### Рекомендована послідовність

1. **Почніть з простого веб-додатка**
   - Вивчіть основні концепції AZD
   - Зрозумійте робочий процес розгортання
   - Практикуйте управління середовищем

2. **Спробуйте статичний вебсайт**
   - Досліджуйте різні варіанти хостингу
   - Вивчіть інтеграцію CDN
   - Зрозумійте конфігурацію DNS

3. **Перейдіть до контейнерного додатка**
   - Вивчіть основи контейнеризації
   - Зрозумійте концепції масштабування
   - Практикуйте роботу з Docker

4. **Додайте інтеграцію бази даних**
   - Вивчіть створення баз даних
   - Зрозумійте рядки підключення
   - Практикуйте управління секретами

5. **Досліджуйте серверні функції**
   - Зрозумійте архітектуру, керовану подіями
   - Вивчіть тригери та прив'язки
   - Практикуйте роботу з API

6. **Створіть мікросервіси**
   - Вивчіть комунікацію між сервісами
   - Зрозумійте розподілені системи
   - Практикуйте складні розгортання

## 🔍 Пошук потрібного прикладу

### За технологічним стеком
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Контейнери**: Python Flask Container App, Java Microservices
- **Бази даних**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Системи з багатьма агентами**: **Retail Multi-Agent Solution**
- **Корпоративне виробництво**: **Retail Multi-Agent Solution**

### За архітектурним шаблоном
- **Монолітний**: Node.js Express Todo, C# Web API + SQL
- **Статичний + серверний**: React SPA + Functions, Python Functions + SPA
- **Мікросервіси**: Java Spring Boot Microservices
- **Контейнеризований**: Python Flask Container App
- **AI-підсилений**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Архітектура з багатьма агентами**: **Retail Multi-Agent Solution**
- **Багатосервісний корпоративний**: **Retail Multi-Agent Solution**

### За рівнем складності
- **Початковий рівень**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Середній рівень**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Розширений рівень**: ML Pipeline
- **Готовий до виробництва**: **Retail Multi-Agent Solution** (Повна система з багатьма агентами з розгортанням через ARM-шаблон)

##
- [Додаток "Список справ" з C# та Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Додаток "Список справ" з Python та MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Додаток "Список справ" з Node.js та PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Веб-додаток React з API на C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Завдання для Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions з Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Найкращі практики
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Приклади для внеску

Маєте корисний приклад, яким хочете поділитися? Ми раді вашим внескам!

### Правила подання
1. Дотримуйтесь встановленої структури директорій
2. Додайте детальний README.md
3. Додавайте коментарі до конфігураційних файлів
4. Ретельно протестуйте перед поданням
5. Включіть оцінку вартості та передумови

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

**Корисна порада**: Почніть із найпростішого прикладу, який відповідає вашій технологічній базі, а потім поступово переходьте до складніших сценаріїв. Кожен приклад базується на концепціях попереднього!

**Наступні кроки**: 
- Оберіть приклад, який відповідає вашому рівню навичок
- Дотримуйтесь інструкцій налаштування у README прикладу
- Експериментуйте з налаштуваннями
- Поділіться своїми знаннями з спільнотою

---

**Навігація**
- **Попередній урок**: [Посібник для навчання](../resources/study-guide.md)
- **Повернутися до**: [Основного README](../README.md)

---

**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ на його рідній мові слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникають внаслідок використання цього перекладу.