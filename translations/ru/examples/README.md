<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-17T18:11:11+00:00",
  "source_file": "examples/README.md",
  "language_code": "ru"
}
-->
# Примеры - Практические шаблоны и конфигурации AZD

**Обучение на примерах - организовано по главам**
- **📚 Домашняя страница курса**: [AZD для начинающих](../README.md)
- **📖 Сопоставление глав**: Примеры, организованные по сложности обучения
- **🚀 Начните с простого**: [Примеры главы 1](../../../examples)
- **🤖 Примеры AI**: [Примеры глав 2 и 5](../../../examples)

## Введение

Этот каталог содержит практические примеры, шаблоны и реальные сценарии, которые помогут вам изучить Azure Developer CLI через практику. Каждый пример включает полный рабочий код, шаблоны инфраструктуры и подробные инструкции для различных архитектур приложений и моделей развертывания.

## Цели обучения

Работая с этими примерами, вы сможете:
- Практиковать рабочие процессы Azure Developer CLI с реалистичными сценариями приложений
- Понять различные архитектуры приложений и их реализации с помощью AZD
- Освоить шаблоны Infrastructure as Code для различных сервисов Azure
- Применять стратегии управления конфигурацией и развертывания, специфичные для окружений
- Реализовывать шаблоны мониторинга, безопасности и масштабирования в практических контекстах
- Накопить опыт в устранении неполадок и отладке реальных сценариев развертывания

## Результаты обучения

После завершения работы с этими примерами вы сможете:
- Уверенно развертывать различные типы приложений с помощью Azure Developer CLI
- Адаптировать предоставленные шаблоны под свои требования к приложениям
- Проектировать и реализовывать собственные шаблоны инфраструктуры с использованием Bicep
- Настраивать сложные многосервисные приложения с правильными зависимостями
- Применять лучшие практики безопасности, мониторинга и производительности в реальных сценариях
- Устранять неполадки и оптимизировать развертывания на основе практического опыта

## Структура каталога

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

## Примеры быстрого старта

### Для начинающих
1. **[Простое веб-приложение - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Развертывание веб-приложения Node.js Express с MongoDB
2. **[Статический сайт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Хостинг статического сайта React с Azure Static Web Apps
3. **[Контейнерное приложение - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Развертывание контейнеризированного приложения Python Flask

### Для пользователей среднего уровня
4. **[Приложение с базой данных - C# с Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Веб-приложение с API на C# и базой данных Azure SQL
5. **[Серверная функция - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions с HTTP-триггерами и Cosmos DB
6. **[Микросервисы - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Многосервисное приложение на Java с Container Apps и API Gateway

### Шаблоны Azure AI Foundry

1. **[Приложение для чата с Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Интеллектуальное приложение для чата с Azure OpenAI
2. **[Обработка документов с AI](https://github.com/Azure-Samples/azure-ai-document-processing)** - Анализ документов с использованием сервисов Azure AI
3. **[Конвейер машинного обучения](https://github.com/Azure-Samples/mlops-v2)** - Рабочий процесс MLOps с Azure Machine Learning

### Реальные сценарии

#### **Решение для розничной торговли с несколькими агентами** 🆕
**[Полное руководство по реализации](./retail-scenario.md)**

Комплексное, готовое к производству решение для поддержки клиентов с несколькими агентами, демонстрирующее развертывание AI-приложений корпоративного уровня с AZD. Этот сценарий включает:

- **Полная архитектура**: Система с несколькими агентами, включая специализированных агентов для обслуживания клиентов и управления запасами
- **Производственная инфраструктура**: Развертывания Azure OpenAI в нескольких регионах, AI Search, Container Apps и комплексный мониторинг
- **Готовый к развертыванию ARM-шаблон**: Развертывание в один клик с несколькими режимами конфигурации (Минимальный/Стандартный/Премиум)
- **Расширенные функции**: Проверка безопасности, фреймворк оценки агентов, оптимизация затрат и руководства по устранению неполадок
- **Реальный бизнес-контекст**: Сценарий поддержки клиентов для розничной торговли с загрузкой файлов, интеграцией поиска и динамическим масштабированием

**Технологии**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Сложность**: ⭐⭐⭐⭐ (Продвинутый - готов к производству)

**Идеально для**: Разработчиков AI, архитекторов решений и команд, создающих производственные системы с несколькими агентами

**Быстрый старт**: Разверните полное решение менее чем за 30 минут, используя включенный ARM-шаблон с `./deploy.sh -g myResourceGroup`

## 📋 Инструкции по использованию

### Запуск примеров локально

1. **Клонирование или копирование примера**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Инициализация окружения AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Настройка окружения**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Развертывание**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Адаптация примеров

Каждый пример включает:
- **README.md** - Подробные инструкции по настройке и кастомизации
- **azure.yaml** - Конфигурация AZD с комментариями
- **infra/** - Шаблоны Bicep с объяснением параметров
- **src/** - Пример кода приложения
- **scripts/** - Вспомогательные скрипты для выполнения общих задач

## 🎯 Цели обучения

### Категории примеров

#### **Базовые развертывания**
- Приложения с одной службой
- Простые шаблоны инфраструктуры
- Базовое управление конфигурацией
- Экономичные настройки для разработки

#### **Продвинутые сценарии**
- Архитектуры с несколькими службами
- Сложные конфигурации сетей
- Шаблоны интеграции баз данных
- Реализация безопасности и соответствия требованиям

#### **Шаблоны, готовые к производству**
- Конфигурации высокой доступности
- Мониторинг и наблюдаемость
- Интеграция CI/CD
- Настройки восстановления после сбоев

## 📖 Описание примеров

### Простое веб-приложение - Node.js Express
**Технологии**: Node.js, Express, MongoDB, Container Apps  
**Сложность**: Начальный уровень  
**Концепции**: Базовое развертывание, REST API, интеграция NoSQL базы данных

### Статический сайт - React SPA
**Технологии**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Сложность**: Начальный уровень  
**Концепции**: Статический хостинг, серверная архитектура, современная веб-разработка

### Контейнерное приложение - Python Flask
**Технологии**: Python Flask, Docker, Container Apps, Container Registry  
**Сложность**: Начальный уровень  
**Концепции**: Контейнеризация, архитектура микросервисов, разработка API

### Приложение с базой данных - C# с Azure SQL
**Технологии**: C# ASP.NET Core, Azure SQL Database, App Service  
**Сложность**: Средний уровень  
**Концепции**: Entity Framework, подключение к базе данных, разработка веб-API

### Серверная функция - Python Azure Functions
**Технологии**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Сложность**: Средний уровень  
**Концепции**: Архитектура, основанная на событиях, серверные вычисления, разработка полного стека

### Микросервисы - Java Spring Boot
**Технологии**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Сложность**: Средний уровень  
**Концепции**: Взаимодействие микросервисов, распределенные системы, корпоративные шаблоны

### Примеры Azure AI Foundry

#### Приложение для чата с Azure OpenAI
**Технологии**: Azure OpenAI, Cognitive Search, App Service  
**Сложность**: Средний уровень  
**Концепции**: Архитектура RAG, векторный поиск, интеграция LLM

#### Обработка документов с AI
**Технологии**: Azure AI Document Intelligence, Storage, Functions  
**Сложность**: Средний уровень  
**Концепции**: Анализ документов, OCR, извлечение данных

#### Конвейер машинного обучения
**Технологии**: Azure ML, MLOps, Container Registry  
**Сложность**: Продвинутый уровень  
**Концепции**: Обучение моделей, конвейеры развертывания, мониторинг

## 🛠 Примеры конфигураций

Каталог `configurations/` содержит компоненты для повторного использования:

### Конфигурации окружений
- Настройки для разработки
- Конфигурации для тестирования
- Готовые к производству конфигурации
- Развертывания в нескольких регионах

### Модули Bicep
- Компоненты инфраструктуры для повторного использования
- Общие шаблоны ресурсов
- Шаблоны с усиленной безопасностью
- Конфигурации с оптимизацией затрат

### Вспомогательные скрипты
- Автоматизация настройки окружения
- Скрипты миграции баз данных
- Инструменты проверки развертывания
- Утилиты мониторинга затрат

## 🔧 Руководство по кастомизации

### Адаптация примеров под ваши задачи

1. **Проверьте требования**
   - Убедитесь в наличии необходимых сервисов Azure
   - Проверьте ограничения подписки
   - Оцените затраты

2. **Измените конфигурацию**
   - Обновите определения служб в `azure.yaml`
   - Настройте шаблоны Bicep
   - Отредактируйте переменные окружения

3. **Тщательно протестируйте**
   - Сначала разверните в окружении разработки
   - Проверьте функциональность
   - Протестируйте масштабирование и производительность

4. **Проверьте безопасность**
   - Проверьте контроль доступа
   - Реализуйте управление секретами
   - Включите мониторинг и оповещения

## 📊 Сравнительная таблица

| Пример | Сервисы | База данных | Аутентификация | Мониторинг | Сложность |
|--------|---------|-------------|----------------|------------|-----------|
| Node.js Express Todo | 2 | ✅ | Базовая | Базовая | ⭐ |
| React SPA + Functions | 3 | ✅ | Базовая | Полная | ⭐ |
| Python Flask Container | 2 | ❌ | Базовая | Полная | ⭐ |
| C# Web API + SQL | 2 | ✅ | Полная | Полная | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Полная | Полная | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Полная | Полная | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Полная | Полная | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Базовая | Полная | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Полная | Полная | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Корпоративная** | **Продвинутая** | **⭐⭐⭐⭐** |

## 🎓 Путь обучения

### Рекомендуемая последовательность

1. **Начните с простого веб-приложения**
   - Изучите базовые концепции AZD
   - Поймите процесс развертывания
   - Практикуйте управление окружением

2. **Попробуйте статический сайт**
   - Исследуйте различные варианты хостинга
   - Узнайте о интеграции CDN
   - Поймите настройку DNS

3. **Перейдите к контейнерному приложению**
   - Изучите основы контейнеризации
   - Поймите концепции масштабирования
   - Практикуйте работу с Docker

4. **Добавьте интеграцию базы данных**
   - Изучите создание базы данных
   - Поймите строки подключения
   - Практикуйте управление секретами

5. **Исследуйте серверные функции**
   - Поймите архитектуру, основанную на событиях
   - Узнайте о триггерах и привязках
   - Практикуйте работу с API

6. **Создайте микросервисы**
   - Изучите взаимодействие служб
   - Поймите распределенные системы
   - Практикуйте сложные развертывания

## 🔍 Поиск подходящего примера

### По стеку технологий
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Контейнеры**: Python Flask Container App, Java Microservices
- **Базы данных**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Системы с несколькими агентами**: **Retail Multi-Agent Solution**
- **Корпоративное производство**: **Retail Multi-Agent Solution**

### По архитектурному шаблону
- **Монолит**: Node.js Express Todo, C# Web API + SQL
- **Статический + серверный**: React SPA + Functions, Python Functions + SPA
- **Микросервисы**: Java Spring Boot Microservices
- **Контейнеризированный**: Python Flask Container App
- **AI-ориентированный**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Архитектура с несколькими агентами**: **Retail Multi-Agent Solution**
- **Корпоративный многосервисный**: **Retail Multi-Agent Solution**

### По уровню сложности
- **Начальный**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Средний**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Продвинутый**: ML Pipeline
- **Готовый к производству**: **Retail Multi-Agent Solution** (Полная система с несколькими агентами с развертыванием через ARM-шаблон)

## 📚 Дополнительные ресурсы

### Ссылки на документацию
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Шаблоны Azure AI Foundry AZD](https://github.com/Azure/ai-foundry-templates)
- [Документация Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Центр архитектуры Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Примеры сообщества
- [Шаблоны AZD от Azure Samples](https://github.com/Azure-Samples/azd-templates)
- [Шаблоны Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Галерея Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Приложение Todo на C# и Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Приложение Todo на Python и MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Приложение Todo на Node.js и PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Веб-приложение React с API на C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Задача для Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions на Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Лучшие практики
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Примеры для внесения вклада

Есть полезный пример, которым хотите поделиться? Мы приветствуем ваши предложения!

### Руководство по отправке
1. Следуйте установленной структуре каталогов
2. Включите подробный README.md
3. Добавьте комментарии к файлам конфигурации
4. Тщательно протестируйте перед отправкой
5. Укажите оценку стоимости и предварительные требования

### Пример структуры шаблона
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

**Полезный совет**: Начните с самого простого примера, который соответствует вашему технологическому стеку, а затем постепенно переходите к более сложным сценариям. Каждый пример основывается на концепциях предыдущего!

**Следующие шаги**: 
- Выберите пример, соответствующий вашему уровню навыков
- Следуйте инструкциям по настройке в README примера
- Экспериментируйте с настройками
- Делитесь своими открытиями с сообществом

---

**Навигация**
- **Предыдущий урок**: [Руководство по обучению](../resources/study-guide.md)
- **Вернуться к**: [Основному README](../README.md)

---

**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его родном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные интерпретации, возникающие в результате использования данного перевода.