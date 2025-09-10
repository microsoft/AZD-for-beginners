<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:29:24+00:00",
  "source_file": "examples/README.md",
  "language_code": "uk"
}
-->
# Приклади - Практичні шаблони та конфігурації AZD

## Вступ

Ця директорія містить практичні приклади, шаблони та реальні сценарії, які допоможуть вам навчитися працювати з Azure Developer CLI через практичні завдання. Кожен приклад надає повний робочий код, шаблони інфраструктури та детальні інструкції для різних архітектур додатків і шаблонів розгортання.

## Цілі навчання

Працюючи з цими прикладами, ви:
- Практикуватимете робочі процеси Azure Developer CLI на реалістичних сценаріях додатків
- Зрозумієте різні архітектури додатків та їх реалізацію через azd
- Опануєте шаблони Infrastructure as Code для різних сервісів Azure
- Застосуєте стратегії управління конфігурацією та розгортання для конкретних середовищ
- Реалізуєте шаблони моніторингу, безпеки та масштабування в практичних контекстах
- Набудете досвіду у вирішенні проблем і налагодженні реальних сценаріїв розгортання

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

## Приклади для швидкого старту

### Для початківців
1. **[Простий веб-додаток - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Розгортання веб-додатка Node.js Express з MongoDB
2. **[Статичний вебсайт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Хостинг статичного вебсайту React з Azure Static Web Apps
3. **[Контейнерний додаток - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Розгортання контейнеризованого додатка Python Flask

### Для користувачів середнього рівня
4. **[Додаток з базою даних - C# з Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Веб-додаток з API на C# та базою даних Azure SQL
5. **[Серверлес функція - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions з HTTP-тригерами та Cosmos DB
6. **[Мікросервіси - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Багатосервісний Java-додаток з Container Apps та API Gateway

### Шаблони Azure AI Foundry

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Інтелектуальний чат-додаток з Azure OpenAI
2. **[Обробка документів за допомогою AI](https://github.com/Azure-Samples/azure-ai-document-processing)** - Аналіз документів за допомогою сервісів Azure AI
3. **[Пайплайн машинного навчання](https://github.com/Azure-Samples/mlops-v2)** - Робочий процес MLOps з Azure Machine Learning

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
- **infra/** - Шаблони Bicep з поясненням параметрів
- **src/** - Зразковий код додатка
- **scripts/** - Допоміжні скрипти для поширених завдань

## 🎯 Навчальні цілі

### Категорії прикладів

#### **Базові розгортання**
- Односервісні додатки
- Прості шаблони інфраструктури
- Базове управління конфігурацією
- Економічно ефективні налаштування для розробки

#### **Складні сценарії**
- Багатосервісні архітектури
- Складні конфігурації мережі
- Шаблони інтеграції баз даних
- Реалізація безпеки та відповідності

#### **Шаблони для продакшн**
- Конфігурації високої доступності
- Моніторинг та спостереження
- Інтеграція CI/CD
- Налаштування для відновлення після аварій

## 📖 Опис прикладів

### Простий веб-додаток - Node.js Express
**Технології**: Node.js, Express, MongoDB, Container Apps  
**Складність**: Початковий рівень  
**Концепції**: Базове розгортання, REST API, інтеграція NoSQL бази даних

### Статичний вебсайт - React SPA
**Технології**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Складність**: Початковий рівень  
**Концепції**: Статичний хостинг, серверлес бекенд, сучасна веб-розробка

### Контейнерний додаток - Python Flask
**Технології**: Python Flask, Docker, Container Apps, Container Registry  
**Складність**: Початковий рівень  
**Концепції**: Контейнеризація, архітектура мікросервісів, розробка API

### Додаток з базою даних - C# з Azure SQL
**Технології**: C# ASP.NET Core, Azure SQL Database, App Service  
**Складність**: Середній рівень  
**Концепції**: Entity Framework, підключення до бази даних, розробка веб-API

### Серверлес функція - Python Azure Functions
**Технології**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Складність**: Середній рівень  
**Концепції**: Архітектура, орієнтована на події, серверлес обчислення, розробка повного стеку

### Мікросервіси - Java Spring Boot
**Технології**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Складність**: Середній рівень  
**Концепції**: Комунікація між сервісами, розподілені системи, корпоративні шаблони

### Приклади Azure AI Foundry

#### Azure OpenAI Chat App
**Технології**: Azure OpenAI, Cognitive Search, App Service  
**Складність**: Середній рівень  
**Концепції**: Архітектура RAG, векторний пошук, інтеграція LLM

#### Обробка документів за допомогою AI
**Технології**: Azure AI Document Intelligence, Storage, Functions  
**Складність**: Середній рівень  
**Концепції**: Аналіз документів, OCR, вилучення даних

#### Пайплайн машинного навчання
**Технології**: Azure ML, MLOps, Container Registry  
**Складність**: Високий рівень  
**Концепції**: Навчання моделей, пайплайни розгортання, моніторинг

## 🛠 Приклади конфігурацій

Директорія `configurations/` містить компоненти для повторного використання:

### Конфігурації середовищ
- Налаштування середовища розробки
- Конфігурації середовища тестування
- Конфігурації для продакшн
- Налаштування розгортання в кількох регіонах

### Модулі Bicep
- Компоненти інфраструктури для повторного використання
- Поширені шаблони ресурсів
- Шаблони з підвищеною безпекою
- Конфігурації з оптимізацією витрат

### Допоміжні скрипти
- Автоматизація налаштування середовища
- Скрипти для міграції баз даних
- Інструменти перевірки розгортання
- Утиліти для моніторингу витрат

## 🔧 Посібник з кастомізації

### Адаптація прикладів під ваші потреби

1. **Перевірте передумови**
   - Переконайтеся у вимогах до сервісів Azure
   - Перевірте ліміти підписки
   - Зрозумійте фінансові наслідки

2. **Модифікуйте конфігурацію**
   - Оновіть визначення сервісів у `azure.yaml`
   - Кастомізуйте шаблони Bicep
   - Налаштуйте змінні середовища

3. **Тестуйте ретельно**
   - Спочатку розгорніть у середовищі розробки
   - Перевірте функціональність
   - Тестуйте масштабування та продуктивність

4. **Перевірка безпеки**
   - Перегляньте контроль доступу
   - Реалізуйте управління секретами
   - Увімкніть моніторинг та оповіщення

## 📊 Порівняльна таблиця

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

## 🎓 Навчальний шлях

### Рекомендована послідовність

1. **Почніть з простого веб-додатка**
   - Вивчіть базові концепції AZD
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

5. **Досліджуйте серверлес**
   - Зрозумійте архітектуру, орієнтовану на події
   - Вивчіть тригери та прив’язки
   - Практикуйте роботу з API

6. **Створіть мікросервіси**
   - Вивчіть комунікацію між сервісами
   - Зрозумійте розподілені системи
   - Практикуйте складні розгортання

## 🔍 Вибір правильного прикладу

### За технологічним стеком
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Контейнери**: Python Flask Container App, Java Microservices
- **Бази даних**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### За архітектурним шаблоном
- **Монолітний**: Node.js Express Todo, C# Web API + SQL
- **Статичний + серверлес**: React SPA + Functions, Python Functions + SPA
- **Мікросервіси**: Java Spring Boot Microservices
- **Контейнеризований**: Python Flask Container App
- **AI-потужний**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### За рівнем складності
- **Початковий рівень**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Середній рівень**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Високий рівень**: ML Pipeline

## 📚 Додаткові ресурси

### Посилання на документацію
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Документація Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Центр архітектури Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Приклади від спільноти
- [Шаблони AZD від Azure Samples](https://github.com/Azure-Samples/azd-templates)
- [Шаблони Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Галерея Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Todo App з C# та Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App з Python та MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App з Node.js та PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App з API на C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions з Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Найкращі практики
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Внесення прикладів

Маєте корисний приклад для спільноти? Ми раді вашим внескам!

### Правила подання
1. Дотримуйтесь встановленої структури директорії
2. Включіть детальний README.md
3. Додайте коментарі до конфігураційних файлів
4. Ретельно протестуйте перед поданням
5. Вкажіть оцінку витрат та передумови

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

**Корисна порада**: Почніть з найпростішого прикладу, який відповідає вашому технологічному стеку, а потім поступово переходьте до складніших сценаріїв. Кожен приклад базується на концепціях попередніх!

**Наступні кроки**: 
- Виберіть приклад, який відповідає вашому рівню навичок
- Дотримуйтесь інструкцій з налаштування у README прикладу
- Експериментуйте з кастомізацією
- Поділіться своїми знаннями зі спільнотою

---

**Навігація**
- **Попередній урок**: [Посібник з навчання](../resources/study-guide.md)
- **Повернутися до**: [Головного README](../README.md)

---

**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматизовані переклади можуть містити помилки або неточності. Оригінальний документ на його рідній мові слід вважати авторитетним джерелом. Для критичної інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникають внаслідок використання цього перекладу.