<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:25:35+00:00",
  "source_file": "examples/README.md",
  "language_code": "bg"
}
-->
# Примери - Практически шаблони и конфигурации за AZD

## Въведение

Тази директория съдържа практически примери, шаблони и реални сценарии, които ще ви помогнат да научите Azure Developer CLI чрез практическа работа. Всеки пример предоставя напълно функциониращ код, инфраструктурни шаблони и подробни инструкции за различни архитектури на приложения и модели за внедряване.

## Цели на обучението

Работейки с тези примери, ще можете:
- Да практикувате работни процеси с Azure Developer CLI в реалистични сценарии за приложения
- Да разберете различни архитектури на приложения и техните реализации с azd
- Да овладеете модели за Infrastructure as Code за различни Azure услуги
- Да приложите стратегии за управление на конфигурации и внедряване, специфични за средата
- Да внедрите модели за мониторинг, сигурност и мащабиране в практически контексти
- Да натрупате опит с отстраняване на проблеми и дебъгване на реални сценарии за внедряване

## Резултати от обучението

След завършване на тези примери, ще можете:
- Уверено да внедрявате различни типове приложения с Azure Developer CLI
- Да адаптирате предоставените шаблони към вашите собствени изисквания за приложения
- Да проектирате и реализирате персонализирани инфраструктурни модели с Bicep
- Да конфигурирате сложни приложения с множество услуги и правилни зависимости
- Да приложите най-добрите практики за сигурност, мониторинг и производителност в реални сценарии
- Да отстранявате проблеми и оптимизирате внедрявания въз основа на практически опит

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

## Бързи примери за стартиране

### За начинаещи
1. **[Просто уеб приложение - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Внедряване на Node.js Express уеб приложение с MongoDB
2. **[Статичен уебсайт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Хостване на статичен уебсайт с React чрез Azure Static Web Apps
3. **[Контейнерно приложение - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Внедряване на контейнеризирано Python Flask приложение

### За средно напреднали
4. **[Приложение с база данни - C# с Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Уеб приложение с C# API и база данни Azure SQL
5. **[Сървърна функция - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions с HTTP тригери и Cosmos DB
6. **[Микроуслуги - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Многоуслугово Java приложение с Container Apps и API gateway

### Шаблони за Azure AI Foundry

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Интелигентно чат приложение с Azure OpenAI
2. **[AI обработка на документи](https://github.com/Azure-Samples/azure-ai-document-processing)** - Анализ на документи с Azure AI услуги
3. **[Машинно обучение - Pipeline](https://github.com/Azure-Samples/mlops-v2)** - MLOps работен процес с Azure Machine Learning

## 📋 Инструкции за употреба

### Стартиране на примери локално

1. **Клониране или копиране на пример**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Инициализиране на AZD среда**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Конфигуриране на среда**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Внедряване**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Адаптиране на примери

Всеки пример включва:
- **README.md** - Подробни инструкции за настройка и персонализация
- **azure.yaml** - AZD конфигурация с коментари
- **infra/** - Bicep шаблони с обяснения на параметрите
- **src/** - Примерен код на приложението
- **scripts/** - Помощни скриптове за често срещани задачи

## 🎯 Цели на обучението

### Категории примери

#### **Основни внедрявания**
- Приложения с една услуга
- Прости инфраструктурни модели
- Основно управление на конфигурации
- Икономични настройки за разработка

#### **Сложни сценарии**
- Архитектури с множество услуги
- Сложни мрежови конфигурации
- Модели за интеграция на бази данни
- Реализации за сигурност и съответствие

#### **Модели, готови за продукция**
- Конфигурации за висока наличност
- Мониторинг и наблюдаемост
- Интеграция на CI/CD
- Настройки за възстановяване при бедствия

## 📖 Описания на примери

### Просто уеб приложение - Node.js Express
**Технологии**: Node.js, Express, MongoDB, Container Apps  
**Сложност**: Начинаещ  
**Концепции**: Основно внедряване, REST API, интеграция с NoSQL база данни

### Статичен уебсайт - React SPA
**Технологии**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Сложност**: Начинаещ  
**Концепции**: Статично хостване, сървърна архитектура, модерна уеб разработка

### Контейнерно приложение - Python Flask
**Технологии**: Python Flask, Docker, Container Apps, Container Registry  
**Сложност**: Начинаещ  
**Концепции**: Контейнеризация, архитектура на микроуслуги, разработка на API

### Приложение с база данни - C# с Azure SQL
**Технологии**: C# ASP.NET Core, Azure SQL Database, App Service  
**Сложност**: Средно напреднал  
**Концепции**: Entity Framework, връзки с база данни, разработка на уеб API

### Сървърна функция - Python Azure Functions
**Технологии**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Сложност**: Средно напреднал  
**Концепции**: Архитектура, базирана на събития, сървърна изчислителна мощност, разработка на full-stack приложения

### Микроуслуги - Java Spring Boot
**Технологии**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Сложност**: Средно напреднал  
**Концепции**: Комуникация между услуги, разпределени системи, корпоративни модели

### Примери за Azure AI Foundry

#### Azure OpenAI Chat App
**Технологии**: Azure OpenAI, Cognitive Search, App Service  
**Сложност**: Средно напреднал  
**Концепции**: RAG архитектура, векторно търсене, интеграция на LLM

#### AI обработка на документи
**Технологии**: Azure AI Document Intelligence, Storage, Functions  
**Сложност**: Средно напреднал  
**Концепции**: Анализ на документи, OCR, извличане на данни

#### Машинно обучение - Pipeline
**Технологии**: Azure ML, MLOps, Container Registry  
**Сложност**: Напреднал  
**Концепции**: Обучение на модели, внедряване на pipeline, мониторинг

## 🛠 Примери за конфигурация

Директорията `configurations/` съдържа компоненти за многократна употреба:

### Конфигурации на среда
- Настройки за среда за разработка
- Конфигурации за staging среда
- Конфигурации, готови за продукция
- Настройки за внедряване в множество региони

### Bicep модули
- Компоненти за многократна употреба за инфраструктура
- Общи модели за ресурси
- Шаблони с подсилена сигурност
- Конфигурации, оптимизирани за разходи

### Помощни скриптове
- Автоматизация на настройките на средата
- Скриптове за миграция на бази данни
- Инструменти за валидиране на внедрявания
- Утилити за мониторинг на разходите

## 🔧 Ръководство за персонализация

### Адаптиране на примери към вашия случай

1. **Преглед на предпоставките**
   - Проверете изискванията за Azure услуги
   - Уверете се в ограниченията на абонамента
   - Разберете разходите

2. **Модифициране на конфигурацията**
   - Актуализирайте дефинициите на услуги в `azure.yaml`
   - Персонализирайте Bicep шаблоните
   - Настройте променливите на средата

3. **Тестване**
   - Първо внедрете в среда за разработка
   - Валидирайте функционалността
   - Тествайте мащабируемостта и производителността

4. **Преглед на сигурността**
   - Прегледайте контролите за достъп
   - Реализирайте управление на тайни
   - Активирайте мониторинг и известия

## 📊 Матрица за сравнение

| Пример | Услуги | База данни | Автентикация | Мониторинг | Сложност |
|--------|--------|------------|--------------|------------|----------|
| Node.js Express Todo | 2 | ✅ | Основна | Основна | ⭐ |
| React SPA + Functions | 3 | ✅ | Основна | Пълна | ⭐ |
| Python Flask Container | 2 | ❌ | Основна | Пълна | ⭐ |
| C# Web API + SQL | 2 | ✅ | Пълна | Пълна | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Пълна | Пълна | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Пълна | Пълна | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Пълна | Пълна | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Основна | Пълна | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Пълна | Пълна | ⭐⭐⭐⭐ |

## 🎓 Път за обучение

### Препоръчителна прогресия

1. **Започнете с просто уеб приложение**
   - Научете основни концепции на AZD
   - Разберете работния процес за внедряване
   - Практикувайте управление на среда

2. **Опитайте статичен уебсайт**
   - Изследвайте различни опции за хостване
   - Научете за интеграция на CDN
   - Разберете конфигурацията на DNS

3. **Преминете към контейнерно приложение**
   - Научете основите на контейнеризацията
   - Разберете концепциите за мащабиране
   - Практикувайте с Docker

4. **Добавете интеграция с база данни**
   - Научете как се създават бази данни
   - Разберете връзките с бази данни
   - Практикувайте управление на тайни

5. **Изследвайте сървърни функции**
   - Разберете архитектурата, базирана на събития
   - Научете за тригери и връзки
   - Практикувайте с API

6. **Създайте микроуслуги**
   - Научете комуникация между услуги
   - Разберете разпределени системи
   - Практикувайте сложни внедрявания

## 🔍 Намиране на подходящ пример

### По технологичен стек
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Контейнери**: Python Flask Container App, Java Microservices
- **Бази данни**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### По архитектурен модел
- **Монолитни**: Node.js Express Todo, C# Web API + SQL
- **Статични + Сървърни**: React SPA + Functions, Python Functions + SPA
- **Микроуслуги**: Java Spring Boot Microservices
- **Контейнеризирани**: Python Flask Container App
- **AI-задвижвани**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### По ниво на сложност
- **Начинаещи**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Средно напреднали**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Напреднали**: ML Pipeline

## 📚 Допълнителни ресурси

### Линкове към документация
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Документация за Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Примери от общността
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
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

## 🤝 Принос към примери

Имате полезен пример, който искате да споделите? Приветстваме вашите приноси!

### Насоки за подаване
1. Следвайте установената структура на директорията
2. Включете изчерпателен README.md
3. Добавете коментари към конфигурационните файлове
4. Тествайте внимателно преди подаване
5. Включете оценки на разходите и предпоставки

### Структура на шаблона за пример
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

**Съвет**: Започнете с най-простия пример, който съответства на вашия технологичен стек, след това постепенно преминавайте към по-сложни сценарии. Всеки пример надгражда концепциите от предишните!

**Следващи стъпки**: 
- Изберете пример, който съответства на вашето ниво на умения
- Следвайте инструкциите за настройка в README на примера
- Експериментирайте с персонализации
- Споделете наученото с общността

---

**Навигация**
- **Предишен урок**: [Ръководство за обучение](../resources/study-guide.md)
- **Връщане към**: [Основен README](../README.md)

---

**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за недоразумения или погрешни интерпретации, произтичащи от използването на този превод.