<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-18T11:25:50+00:00",
  "source_file": "examples/README.md",
  "language_code": "bg"
}
-->
# Примери - Практически AZD шаблони и конфигурации

**Учене чрез примери - организирано по глави**
- **📚 Начало на курса**: [AZD за начинаещи](../README.md)
- **📖 Карта на главите**: Примери, организирани по сложност на обучението
- **🚀 Започнете лесно**: [Примери от Глава 1](../../../examples)
- **🤖 AI Примери**: [Решения от Глави 2 и 5](../../../examples)

## Въведение

Тази директория съдържа практически примери, шаблони и реални сценарии, които ще ви помогнат да научите Azure Developer CLI чрез практическа работа. Всеки пример предоставя пълен работещ код, инфраструктурни шаблони и подробни инструкции за различни архитектури на приложения и модели за внедряване.

## Цели на обучението

Работейки с тези примери, ще можете:
- Да практикувате работни потоци на Azure Developer CLI с реалистични сценарии на приложения
- Да разберете различни архитектури на приложения и техните реализации с azd
- Да овладеете модели за Infrastructure as Code за различни Azure услуги
- Да приложите стратегии за управление на конфигурации и внедряване, специфични за средата
- Да внедрите модели за мониторинг, сигурност и мащабиране в практически контексти
- Да натрупате опит в отстраняване на проблеми и дебъгване на реални сценарии за внедряване

## Резултати от обучението

След завършване на тези примери ще можете:
- Уверено да внедрявате различни типове приложения с Azure Developer CLI
- Да адаптирате предоставените шаблони към вашите собствени изисквания за приложения
- Да проектирате и реализирате персонализирани инфраструктурни модели с Bicep
- Да конфигурирате сложни приложения с множество услуги и правилни зависимости
- Да прилагате най-добрите практики за сигурност, мониторинг и производителност в реални сценарии
- Да отстранявате проблеми и оптимизирате внедряванията въз основа на практически опит

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

### За начинаещи
1. **[Просто уеб приложение - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Внедряване на уеб приложение с Node.js Express и MongoDB
2. **[Статичен уебсайт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Хостване на статичен уебсайт с React и Azure Static Web Apps
3. **[Контейнерно приложение - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Внедряване на контейнеризирано приложение с Python Flask

### За средно напреднали
4. **[Приложение с база данни - C# и Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Уеб приложение с C# API и Azure SQL Database
5. **[Сървърлес функция - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions с HTTP тригери и Cosmos DB
6. **[Микроуслуги - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Многоуслугово Java приложение с Container Apps и API Gateway

### Шаблони за Azure AI Foundry

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Интелигентно чат приложение с Azure OpenAI
2. **[AI Обработка на документи](https://github.com/Azure-Samples/azure-ai-document-processing)** - Анализ на документи с Azure AI услуги
3. **[Машинно обучение - Pipeline](https://github.com/Azure-Samples/mlops-v2)** - MLOps работен поток с Azure Machine Learning

### Реални сценарии

#### **Решение за търговия на дребно с множество агенти** 🆕
**[Пълно ръководство за внедряване](./retail-scenario.md)**

Цялостно, готово за производство решение за клиентска поддръжка с множество агенти, което демонстрира внедряване на AI приложения от корпоративен клас с AZD. Този сценарий включва:

- **Пълна архитектура**: Система с множество агенти за специализирана клиентска поддръжка и управление на инвентара
- **Производствена инфраструктура**: Многорайонни Azure OpenAI внедрявания, AI търсене, Container Apps и цялостен мониторинг
- **Готов ARM шаблон**: Внедряване с едно кликване и множество режими на конфигурация (Минимален/Стандартен/Премиум)
- **Разширени функции**: Проверка на сигурността, рамка за оценка на агентите, оптимизация на разходите и ръководства за отстраняване на проблеми
- **Реален бизнес контекст**: Сценарий за клиентска поддръжка с качване на файлове, интеграция на търсене и динамично мащабиране

**Технологии**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Сложност**: ⭐⭐⭐⭐ (Напреднало - Готово за производство)

**Идеално за**: AI разработчици, архитектурни решения и екипи, изграждащи производствени системи с множество агенти

**Бърз старт**: Внедрете цялото решение за по-малко от 30 минути, използвайки включения ARM шаблон с `./deploy.sh -g myResourceGroup`

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

3. **Конфигуриране на средата**
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

## 🎯 Обучителни цели

### Категории примери

#### **Основни внедрявания**
- Приложения с една услуга
- Прости инфраструктурни модели
- Основно управление на конфигурации
- Икономични разработки

#### **Напреднали сценарии**
- Архитектури с множество услуги
- Сложни мрежови конфигурации
- Модели за интеграция на бази данни
- Реализации за сигурност и съответствие

#### **Модели, готови за производство**
- Конфигурации с висока наличност
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
**Концепции**: Статично хостване, сървърлес бекенд, модерна уеб разработка

### Контейнерно приложение - Python Flask
**Технологии**: Python Flask, Docker, Container Apps, Container Registry  
**Сложност**: Начинаещ  
**Концепции**: Контейнеризация, архитектура на микроуслуги, разработка на API

### Приложение с база данни - C# с Azure SQL
**Технологии**: C# ASP.NET Core, Azure SQL Database, App Service  
**Сложност**: Средно напреднал  
**Концепции**: Entity Framework, връзки с база данни, разработка на уеб API

### Сървърлес функция - Python Azure Functions
**Технологии**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Сложност**: Средно напреднал  
**Концепции**: Архитектура, базирана на събития, сървърлес изчисления, пълноценна разработка

### Микроуслуги - Java Spring Boot
**Технологии**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Сложност**: Средно напреднал  
**Концепции**: Комуникация между услуги, разпределени системи, корпоративни модели

### Azure AI Foundry Примери

#### Azure OpenAI Chat App
**Технологии**: Azure OpenAI, Cognitive Search, App Service  
**Сложност**: Средно напреднал  
**Концепции**: RAG архитектура, векторно търсене, интеграция на LLM

#### AI Обработка на документи
**Технологии**: Azure AI Document Intelligence, Storage, Functions  
**Сложност**: Средно напреднал  
**Концепции**: Анализ на документи, OCR, извличане на данни

#### Машинно обучение - Pipeline
**Технологии**: Azure ML, MLOps, Container Registry  
**Сложност**: Напреднал  
**Концепции**: Обучение на модели, внедряване на pipeline, мониторинг

## 🛠 Примери за конфигурация

Директорията `configurations/` съдържа многократно използваеми компоненти:

### Конфигурации на средата
- Настройки за разработка
- Конфигурации за тестване
- Готови за производство конфигурации
- Настройки за внедряване в множество региони

### Bicep модули
- Многократно използваеми инфраструктурни компоненти
- Общи модели за ресурси
- Шаблони с подсилена сигурност
- Конфигурации за оптимизация на разходите

### Помощни скриптове
- Автоматизация на настройките на средата
- Скриптове за миграция на бази данни
- Инструменти за валидиране на внедряванията
- Утилити за мониторинг на разходите

## 🔧 Ръководство за персонализация

### Адаптиране на примери за вашия случай

1. **Преглед на изискванията**
   - Проверете изискванията за Azure услуги
   - Уверете се, че лимитите на абонамента са достатъчни
   - Разберете разходите

2. **Модифициране на конфигурацията**
   - Актуализирайте дефинициите на услугите в `azure.yaml`
   - Персонализирайте Bicep шаблоните
   - Настройте променливите на средата

3. **Тестване**
   - Внедрете първо в среда за разработка
   - Валидирайте функционалността
   - Тествайте мащабируемостта и производителността

4. **Преглед на сигурността**
   - Прегледайте контрола на достъпа
   - Реализирайте управление на тайни
   - Активирайте мониторинг и известия

## 📊 Сравнителна таблица

| Пример | Услуги | База данни | Аутентикация | Мониторинг | Сложност |
|---------|----------|----------|------|------------|------------|
| Node.js Express Todo | 2 | ✅ | Основна | Основна | ⭐ |
| React SPA + Functions | 3 | ✅ | Основна | Пълна | ⭐ |
| Python Flask Container | 2 | ❌ | Основна | Пълна | ⭐ |
| C# Web API + SQL | 2 | ✅ | Пълна | Пълна | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Пълна | Пълна | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Пълна | Пълна | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Пълна | Пълна | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Основна | Пълна | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Пълна | Пълна | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Корпоративна** | **Разширена** | **⭐⭐⭐⭐** |

## 🎓 Път за обучение

### Препоръчителна последователност

1. **Започнете с просто уеб приложение**
   - Научете основни концепции на AZD
   - Разберете работния процес на внедряване
   - Практикувайте управление на средата

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

5. **Изследвайте сървърлес**
   - Разберете архитектурата, базирана на събития
   - Научете за тригери и свързвания
   - Практикувайте с API-та

6. **Създайте микроуслуги**
   - Научете комуникацията между услуги
   - Разберете разпределените системи
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
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Системи с множество агенти**: **Retail Multi-Agent Solution**
- **Корпоративно производство**: **Retail Multi-Agent Solution**

### По архитектурен модел
- **Монолитни**: Node.js Express Todo, C# Web API + SQL
- **Статични + Сървърлес**: React SPA + Functions, Python Functions + SPA
- **Микроуслуги**: Java Spring Boot Microservices
- **Контейнеризирани**: Python Flask Container App
- **AI-задвижвани**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Архитектура с множество агенти**: **Retail Multi-Agent Solution**
- **Корпоративни многосервизни**: **Retail Multi-Agent Solution**

### По ниво на сложност
- **Начинаещи**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Средно напреднали**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Напреднали**: ML Pipeline
- **Готови за производство**: **Retail Multi-Agent Solution** (Цялостна система с множество агенти с ARM шаблон за внедряване)

## 📚 Допълнителни ресурси

### Линкове към документация
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Документация](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Примери от общността
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Приложение за задачи с C# и Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Приложение за задачи с Python и MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Приложение за задачи с Node.js и PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Уеб приложение с React и API на C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Работа с Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions с Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Най-добри практики
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Примери за принос

Имате полезен пример, който искате да споделите? Ще се радваме на вашия принос!

### Насоки за подаване
1. Следвайте установената структура на директориите
2. Включете изчерпателен README.md
3. Добавете коментари към конфигурационните файлове
4. Тествайте внимателно преди подаване
5. Включете оценки на разходите и предварителни изисквания

### Примерна структура на шаблон
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

**Полезен съвет**: Започнете с най-простия пример, който съответства на вашата технологична среда, след това постепенно преминавайте към по-сложни сценарии. Всеки пример надгражда концепциите от предишните!

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