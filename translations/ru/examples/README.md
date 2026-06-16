# Примеры — Практические шаблоны и конфигурации AZD

**Обучение на примерах — Организовано по главам**
- **📚 Главная страница курса**: [AZD для начинающих](../README.md)
- **📖 Сопоставление глав**: Примеры, организованные по сложности обучения
- **🚀 Локальный пример**: [Розничное решение с мультиагентами](retail-scenario.md)
- **🤖 Внешние примеры ИИ**: Ссылки на репозитории Azure Samples

> **📍 ВАЖНО: Локальные и внешние примеры**  
> В этом репозитории содержатся **4 полноценных локальных примера** с полной реализацией:  
> - **Microsoft Foundry Models Chat** (развёртывание gpt-4.1 с интерфейсом чата)  
> - **Container Apps** (Простой Flask API + микросервисы)  
> - **Database App** (Веб + SQL база данных)  
> - **Retail Multi-Agent** (Корпоративное AI решение)  
>  
> Дополнительные примеры — это **внешние ссылки** на репозитории Azure-Samples, которые вы можете клонировать.

## Введение

Этот каталог предоставляет практические примеры и ссылки, которые помогут вам изучить Azure Developer CLI через практические упражнения. Сценарий Retail Multi-Agent — это полный, готовый к продакшену пример, включённый в этот репозиторий. Дополнительные примеры ссылаются на официальные Azure Samples, демонстрирующие различные паттерны AZD.

### Легенда сложности

- ⭐ **Начинающий** — базовые концепции, один сервис, 15-30 минут
- ⭐⭐ **Средний уровень** — несколько сервисов, интеграция базы данных, 30-60 минут
- ⭐⭐⭐ **Продвинутый** — сложная архитектура, интеграция ИИ, 1-2 часа
- ⭐⭐⭐⭐ **Эксперт** — готово к продакшену, корпоративные паттерны, 2+ часа

## 🎯 Что на самом деле в этом репозитории

### ✅ Локальная реализация (Готово к использованию)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**Полное развёртывание gpt-4.1 с интерфейсом чата включено в этот репозиторий**

- **Расположение:** `examples/azure-openai-chat/`
- **Сложность:** ⭐⭐ (Средний уровень)
- **Что включено:**
  - Полное развёртывание Microsoft Foundry Models (gpt-4.1)
  - Интерфейс чата в командной строке на Python
  - Интеграция с Key Vault для безопасного хранения ключей API
  - Шаблоны инфраструктуры на Bicep
  - Отслеживание использования токенов и стоимости
  - Ограничение скорости и обработка ошибок

**Быстрый старт:**  
```bash
# Перейти к примеру
cd examples/azure-openai-chat

# Развернуть все
azd up

# Установить зависимости и начать общение
pip install -r src/requirements.txt
python src/chat.py
```
  
**Технологии:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Примеры Container App](container-app/README.md) 🆕  
**Полные примеры развёртывания контейнеров включены в этот репозиторий**

- **Расположение:** `examples/container-app/`
- **Сложность:** ⭐-⭐⭐⭐⭐ (От начинающего до продвинутого)
- **Что включено:**
  - [Главное руководство](container-app/README.md) — полный обзор развёртывания контейнеров
  - [Простой Flask API](../../../examples/container-app/simple-flask-api) — базовый пример REST API
  - [Микросервисная архитектура](../../../examples/container-app/microservices) — продакшенное мультисервисное развёртывание
  - Быстрый старт, продакшен- и продвинутые паттерны
  - Мониторинг, безопасность и оптимизация стоимости

**Быстрый старт:**  
```bash
# Просмотреть мастер-гид
cd examples/container-app

# Развернуть простой Flask API
cd simple-flask-api
azd up

# Развернуть пример микросервисов
cd ../microservices
azd up
```
  
**Технологии:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Розничное мультиагентное решение](retail-scenario.md) 🆕  
**Полная продакшен-готовая реализация включена в этот репозиторий**

- **Расположение:** `examples/retail-multiagent-arm-template/`
- **Сложность:** ⭐⭐⭐⭐ (Продвинутый)
- **Что включено:**
  - Полный ARM шаблон для развёртывания
  - Мультиагентная архитектура (Клиент + Инвентарь)
  - Интеграция Microsoft Foundry Models
  - AI поисковый механизм с RAG
  - Комплексный мониторинг
  - Скрипт развёртывания в один клик

**Быстрый старт:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Технологии:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Внешние Azure Samples (клонируйте для использования)

Следующие примеры поддерживаются в официальных репозиториях Azure-Samples. Клонируйте их для изучения различных паттернов AZD:

### Простые приложения (главы 1-2)

| Шаблон | Репозиторий | Сложность | Сервисы |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Локально: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Микросервисы** | [Локально: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Мультисервис, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Как использовать:**  
```bash
# Клонировать любой пример
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Развернуть
azd up
```
  
### Примеры AI приложений (главы 2, 5, 8)

| Шаблон | Репозиторий | Сложность | Фокус |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Локально: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Развёртывание gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Базовый AI чат |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Фреймворк агентов |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Паттерн RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Корпоративный ИИ |

### База данных и продвинутые паттерны (главы 3-8)

| Шаблон | Репозиторий | Сложность | Фокус |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Интеграция с базой данных |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Безсерверный NoSQL |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Мультисервис |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Цели обучения

Работая с этими примерами, вы сможете:  
- Практиковаться с рабочими процессами Azure Developer CLI на реалистичных сценариях приложений  
- Понимать различные архитектуры приложений и их реализации azd  
- Освоить паттерны Infrastructure as Code для разных Azure сервисов  
- Применять управление конфигурациями и стратегии развертывания для разных сред  
- Реализовывать паттерны мониторинга, безопасности и масштабирования на практике  
- Получить опыт в отладке и устранении неполадок в реальных сценариях развёртывания

## Результаты обучения

По завершении этих примеров вы сможете:  
- Уверенно развёртывать различные типы приложений с помощью Azure Developer CLI  
- Адаптировать предоставленные шаблоны к своим требованиям приложений  
- Проектировать и реализовывать кастомные инфраструктурные паттерны с использованием Bicep  
- Настраивать сложные мультисервисные приложения с правильными зависимостями  
- Применять лучшие практики безопасности, мониторинга и производительности в реальных сценариях  
- Устранять неполадки и оптимизировать развёртывания на основе практического опыта

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
  
## Быстрые стартовые примеры

> **💡 Новый в AZD?** Начните с примера №1 (Flask API) — это займет около 20 минут и обучит основам.

### Для начинающих
1. **[Container App — Python Flask API](../../../examples/container-app/simple-flask-api)** (Локально) ⭐  
   Разверните простой REST API с масштабированием до нуля  
   **Время:** 20-25 минут | **Стоимость:** $0-5/месяц  
   **Что изучите:** Основы работы azd, контейнеризация, health probes  
   **Ожидаемый результат:** Рабочая конечная точка API, возвращающая "Hello, World!" с мониторингом

2. **[Простое веб-приложение — Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Разверните веб-приложение Node.js Express с MongoDB  
   **Время:** 25-35 минут | **Стоимость:** $10-30/месяц  
   **Что изучите:** Интеграция базы данных, переменные окружения, строки подключения  
   **Ожидаемый результат:** Приложение списка дел с функциями создания/чтения/обновления/удаления

3. **[Статический веб-сайт — React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Хостинг React статического сайта с Azure Static Web Apps  
   **Время:** 20-30 минут | **Стоимость:** $0-10/месяц  
   **Что изучите:** Статический хостинг, серверлесс функции, развёртывание CDN  
   **Ожидаемый результат:** React UI с API backend, автоматический SSL, глобальный CDN

### Для пользователей со средним уровнем
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Локально) ⭐⭐  
   Развёртывание gpt-4.1 с интерфейсом чата и безопасным управлением ключами API  
   **Время:** 35-45 минут | **Стоимость:** $50-200/месяц  
   **Что изучите:** Развёртывание Microsoft Foundry Models, интеграция Key Vault, отслеживание токенов  
   **Ожидаемый результат:** Рабочее чат-приложение с gpt-4.1 и мониторингом стоимости

5. **[Container App — Микросервисы](../../../examples/container-app/microservices)** (Локально) ⭐⭐⭐⭐  
   Архитектура с несколькими сервисами, готовая к продакшену  
   **Время:** 45-60 минут | **Стоимость:** $50-150/месяц  
   **Что изучите:** Взаимодействие сервисов, очередь сообщений, распределённый трейсинг  
   **Ожидаемый результат:** Система из 2 сервисов (API Gateway + Product Service) с мониторингом

6. **[Database App — C# с Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Веб-приложение с C# API и Azure SQL Database  
   **Время:** 30-45 минут | **Стоимость:** $20-80/месяц  
   **Что изучите:** Entity Framework, миграции базы, безопасность соединений  
   **Ожидаемый результат:** C# API с backend на Azure SQL, автоматическое развертывание схемы

7. **[Serverless Function — Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions с HTTP-триггерами и Cosmos DB  
   **Время:** 30-40 минут | **Стоимость:** $10-40/месяц  
   **Что изучите:** Событийно-ориентированная архитектура, безсерверное масштабирование, интеграция NoSQL  
   **Ожидаемый результат:** Function app, отвечающее на HTTP-запросы с хранением в Cosmos DB

8. **[Микросервисы — Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Мультисервисное Java-приложение с Container Apps и API gateway  
   **Время:** 60-90 минут | **Стоимость:** $80-200/месяц  
   **Что изучите:** Развёртывание Spring Boot, service mesh, балансировка нагрузки  
   **Ожидаемый результат:** Мультисервисная Java-система с сервис-дискавери и маршрутизацией

### Шаблоны Microsoft Foundry

1. **[Microsoft Foundry Models Chat App — Локальный пример](../../../examples/azure-openai-chat)** ⭐⭐  
   Полное развёртывание gpt-4.1 с чат-интерфейсом  
   **Время:** 35-45 минут | **Стоимость:** $50-200/месяц  
   **Ожидаемый результат:** Рабочее чат-приложение с отслеживанием токенов и мониторингом стоимости

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Интеллектуальное чат-приложение с архитектурой RAG  
   **Время:** 60-90 минут | **Стоимость:** $100-300/месяц  
   **Ожидаемый результат:** Чат-интерфейс на основе RAG с поиском документов и цитированием

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Анализ документов с использованием сервисов Azure AI  
   **Время:** 40-60 минут | **Стоимость:** $20-80/месяц  
   **Ожидаемый результат:** API извлекающее текст, таблицы и сущности из загруженных документов

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps рабочий процесс с Azure Machine Learning  
   **Время:** 2-3 часа | **Стоимость:** $150-500/месяц  
   **Ожидаемый результат:** Автоматизированный ML pipeline с обучением, развёртыванием и мониторингом

### Сценарии из реального мира

#### **Розничное мультиагентное решение** 🆕  
**[Полное руководство по реализации](./retail-scenario.md)**

Всеобъемлющее, готовое к продакшену мультиагентное решение для поддержки клиентов, демонстрирующее развёртывание корпоративного AI приложения с использованием AZD. Сценарий включает:

- **Полная архитектура**: Мультиагентная система с специализированными агентами поддержки клиентов и управления запасами
- **Производственная инфраструктура**: Развертывания Microsoft Foundry Models в нескольких регионах, AI Search, Container Apps и комплексный мониторинг  
- **Готовый к развертыванию ARM-шаблон**: Развертывание в один клик с несколькими режимами конфигурации (Минимальный/Стандартный/Премиум)  
- **Расширенные возможности**: Проверка безопасности в стиле Red Team, фреймворк оценки агентов, оптимизация затрат и руководства по устранению неполадок  
- **Реальный бизнес-контекст**: Использование для поддержки клиентов ритейлера с загрузкой файлов, интеграцией поиска и динамическим масштабированием  

**Технологии**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Сложность**: ⭐⭐⭐⭐ (Продвинутый - готовый к производству на уровне предприятия)

**Идеально подходит для**: AI-разработчиков, архитекторов решений и команд, создающих многоагентные производственные системы

**Быстрый старт**: Разверните полное решение менее чем за 30 минут с помощью прилагаемого ARM-шаблона командой `./deploy.sh -g myResourceGroup`

## 📋 Инструкции по использованию

### Предварительные требования

Перед запуском любого примера:  
- ✅ Подписка Azure с правами Владельца или Участника  
- ✅ Установлен Azure Developer CLI ([Руководство по установке](../docs/chapter-01-foundation/installation.md))  
- ✅ Запущен Docker Desktop (для примеров с контейнерами)  
- ✅ Соответствующие квоты Azure (проверьте требования к конкретному примеру)

> **💰 Внимание по стоимости:** Все примеры создают реальные ресурсы Azure, за которые взимаются платежи. Смотрите отдельные README для оценки затрат. Не забудьте выполнить `azd down` после завершения, чтобы избежать продолжающихся расходов.

### Локальный запуск примеров

1. **Клонировать или скопировать пример**  
   ```bash
   # Перейдите к нужному примеру
   cd examples/simple-web-app
   ```
  
2. **Инициализировать окружение AZD**  
   ```bash
   # Инициализация с использованием существующего шаблона
   azd init
   
   # Или создать новую среду
   azd env new my-environment
   ```
  
3. **Настроить окружение**  
   ```bash
   # Установите необходимые переменные
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **Развернуть**  
   ```bash
   # Развернуть инфраструктуру и приложение
   azd up
   ```
  
5. **Проверить развертывание**  
   ```bash
   # Получить конечные точки сервиса
   azd env get-values
   
   # Протестировать конечную точку (пример)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Ожидаемые индикаторы успешного выполнения:**  
   - ✅ `azd up` выполняется без ошибок  
   - ✅ Конечная точка сервиса возвращает HTTP 200  
   - ✅ В Azure Portal отображается статус "Running"  
   - ✅ Application Insights получает телеметрию

> **⚠️ Проблемы?** См. [Распространённые проблемы](../docs/chapter-07-troubleshooting/common-issues.md) для устранения неполадок при развертывании

### Адаптация примеров

Каждый пример включает:  
- **README.md** - Подробные инструкции по настройке и кастомизации  
- **azure.yaml** - Конфигурация AZD с комментариями  
- **infra/** - Bicep-шаблоны с объяснениями параметров  
- **src/** - Пример кода приложения  
- **scripts/** - Скрипты помощники для типовых операций

## 🎯 Цели обучения

### Категории примеров

#### **Базовые развертывания**  
- Односервисные приложения  
- Простые инфраструктурные шаблоны  
- Базовое управление конфигурацией  
- Экономичные настройки для разработки

#### **Продвинутые сценарии**  
- Микросервисные архитектуры  
- Сложные сетевые конфигурации  
- Паттерны интеграции баз данных  
- Реализация безопасности и соответствия требованиям

#### **Готовые к производству паттерны**  
- Конфигурации высокой доступности  
- Мониторинг и наблюдаемость  
- Интеграция CI/CD  
- Наборы аварийного восстановления

## 📖 Описания примеров

### Простое веб-приложение - Node.js Express  
**Технологии**: Node.js, Express, MongoDB, Container Apps  
**Сложность**: Начальный уровень  
**Концепции**: Базовое развертывание, REST API, интеграция NoSQL базы данных

### Статический сайт - React SPA  
**Технологии**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Сложность**: Начальный уровень  
**Концепции**: Статический хостинг, безсерверный бэкенд, современная веб-разработка

### Container App - Python Flask  
**Технологии**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Сложность**: Начальный уровень  
**Концепции**: Контейнеризация, REST API, масштабирование до нуля, проверки здоровья, мониторинг  
**Расположение**: [Локальный пример](../../../examples/container-app/simple-flask-api)

### Container App - Микросервисная архитектура  
**Технологии**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Сложность**: Продвинутый уровень  
**Концепции**: Многоагентная архитектура, взаимодействие сервисов, очереди сообщений, распределённое трассирование  
**Расположение**: [Локальный пример](../../../examples/container-app/microservices)

### Приложение с базой данных - C# с Azure SQL  
**Технологии**: C# ASP.NET Core, Azure SQL Database, App Service  
**Сложность**: Средний уровень  
**Концепции**: Entity Framework, подключения к базе, разработка веб-API

### Безсерверная функция - Python Azure Functions  
**Технологии**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Сложность**: Средний уровень  
**Концепции**: Событийно-ориентированная архитектура, безсерверные вычисления, full-stack разработка

### Микросервисы - Java Spring Boot  
**Технологии**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Сложность**: Средний уровень  
**Концепции**: Взаимодействие микросервисов, распределённые системы, корпоративные паттерны

### Примеры Microsoft Foundry

#### Чат-приложение Microsoft Foundry Models  
**Технологии**: Microsoft Foundry Models, Azure AI Search, App Service  
**Сложность**: Средний уровень  
**Концепции**: Архитектура RAG, векторный поиск, интеграция LLM

#### Обработка документов AI  
**Технологии**: Azure AI Document Intelligence, Storage, Functions  
**Сложность**: Средний уровень  
**Концепции**: Анализ документов, OCR, извлечение данных

#### ML Pipeline  
**Технологии**: Azure ML, MLOps, Container Registry  
**Сложность**: Продвинутый уровень  
**Концепции**: Обучение моделей, конвейеры развертывания, мониторинг

## 🛠 Примеры конфигураций

В каталоге `configurations/` содержатся повторно используемые компоненты:

### Конфигурации окружения  
- Настройки окружения разработки  
- Конфигурации staging окружения  
- Готовые к производству конфигурации  
- Многорегиональные развертывания

### Модули Bicep  
- Повторно используемые инфраструктурные компоненты  
- Общие шаблоны ресурсов  
- Усиленные шаблоны безопасности  
- Оптимизированные по затратам конфигурации

### Скрипты помощники  
- Автоматизация настройки окружения  
- Скрипты миграции баз данных  
- Инструменты проверки развертывания  
- Средства мониторинга затрат

## 🔧 Руководство по кастомизации

### Адаптация примеров под ваши задачи

1. **Проверьте предварительные требования**  
   - Ознакомьтесь с требованиями к сервисам Azure  
   - Проверьте лимиты подписки  
   - Поймите влияние на стоимость

2. **Измените конфигурацию**  
   - Обновите определения сервисов в `azure.yaml`  
   - Настройте Bicep-шаблоны  
   - Отредактируйте переменные окружения

3. **Тщательно протестируйте**  
   - Сначала разверните в среде разработки  
   - Проверьте функциональность  
   - Протестируйте масштабируемость и производительность

4. **Проведите аудит безопасности**  
   - Проверьте контроль доступа  
   - Реализуйте управление секретами  
   - Включите мониторинг и оповещения

## 📊 Матрица сравнения

| Пример | Сервисы | База данных | Аутентификация | Мониторинг | Сложность |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (локальный) | 2 | ❌ | Key Vault | Полный | ⭐⭐ |
| **Python Flask API** (локальный) | 1 | ❌ | Базовый | Полный | ⭐ |
| **Микросервисы** (локальный) | 5+ | ✅ | Предприятие | Продвинутый | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Базовый | Базовый | ⭐ |
| React SPA + Functions | 3 | ✅ | Базовый | Полный | ⭐ |
| Python Flask Container | 2 | ❌ | Базовый | Полный | ⭐ |
| C# Web API + SQL | 2 | ✅ | Полный | Полный | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Полный | Полный | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Полный | Полный | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Полный | Полный | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Базовый | Полный | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Полный | Полный | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (локальный) | **8+** | **✅** | **Предприятие** | **Продвинутый** | **⭐⭐⭐⭐** |

## 🎓 Обучающий путь

### Рекомендуемая последовательность

1. **Начните с простого веб-приложения**  
   - Изучите базовые концепции AZD  
   - Поймите процесс развертывания  
   - Практикуйтесь в управлении окружением

2. **Попробуйте статический веб-сайт**  
   - Изучите различные варианты хостинга  
   - Узнайте про интеграцию CDN  
   - Поймите настройку DNS

3. **Перейдите к Container App**  
   - Изучите основы контейнеризации  
   - Поймите концепции масштабирования  
   - Практикуйтесь с Docker

4. **Добавьте интеграцию с базой данных**  
   - Изучите провизию баз данных  
   - Поймите строки подключения  
   - Практикуйтесь в управлении секретами

5. **Изучайте безсерверные технологии**  
   - Поймите событийно-ориентированную архитектуру  
   - Узнайте про триггеры и привязки  
   - Практикуйтесь с API

6. **Создавайте микросервисы**  
   - Изучайте взаимодействие сервисов  
   - Понимайте распределённые системы  
   - Практикуйтесь в сложных развертываниях

## 🔍 Как найти подходящий пример

### По технологическому стеку  
- **Container Apps**: [Python Flask API (локальный)](../../../examples/container-app/simple-flask-api), [Микросервисы (локальный)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (локальный)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (локальный)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (локальный)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservices Order Service (локальный)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go**: [Microservices User Service (локальный)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **Контейнеры**: [Python Flask (локальный)](../../../examples/container-app/simple-flask-api), [Микросервисы (локальный)](../../../examples/container-app/microservices), Java Microservices  
- **Базы данных**: [Микросервисы (локальный)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry Models Chat (локальный)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Многоагентные системы**: **Retail Multi-Agent Solution**  
- **Интеграция OpenAI**: **[Microsoft Foundry Models Chat (локальный)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Корпоративное производство**: [Микросервисы (локальный)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### По архитектурному паттерну  
- **Простой REST API**: [Python Flask API (локальный)](../../../examples/container-app/simple-flask-api)  
- **Монолит**: Node.js Express Todo, C# Web API + SQL  
- **Статический + безсерверный**: React SPA + Functions, Python Functions + SPA  
- **Микросервисы**: [Производственные микросервисы (локальный)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **Контейнеризированные**: [Python Flask (локальный)](../../../examples/container-app/simple-flask-api), [Микросервисы (локальный)](../../../examples/container-app/microservices)  
- **AI-поддержка**: **[Microsoft Foundry Models Chat (локальный)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Многоагентная архитектура**: **Retail Multi-Agent Solution**  
- **Корпоративные мультисервисные**: [Микросервисы (локальный)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### По уровню сложности  
- **Начинающий**: [Python Flask API (локальный)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Средний уровень**: **[Microsoft Foundry Models Chat (локальный)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing  
- **Продвинутый**: ML Pipeline  
- **Готовый к промышленному производству**: [Микросервисы (локальный)](../../../examples/container-app/microservices) (многоагентный с очередями сообщений), **Retail Multi-Agent Solution** (полноценная многоагентная система с развертыванием ARM-шаблоном)

## 📚 Дополнительные ресурсы

### Ссылки на документацию  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Документация по Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Центр архитектуры Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Примеры сообщества  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)  
- [Todo App с C# и Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App с Python и MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Todo App с Node.js и PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Веб-приложение на React с C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions с Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Лучшие практики
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Внесение примеров

Есть полезный пример для публикации? Мы приветствуем вклад!

### Руководство по подаче
1. Следуйте установленной структуре каталогов
2. Включите подробный README.md
3. Добавляйте комментарии в конфигурационные файлы
4. Тщательно тестируйте перед отправкой
5. Включите оценки стоимости и предварительные требования

### Структура шаблона примера
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

**Полезный совет**: Начинайте с самого простого примера, соответствующего вашему технологическому стеку, а затем постепенно переходите к более сложным сценариям. Каждый пример строится на концепциях предыдущих!

## 🚀 Готовы начать?

### Ваш путь обучения

1. **Полный новичок?** → Начните с [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 минут)
2. **Есть базовые знания AZD?** → Попробуйте [Микросервисы](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 минут)
3. **Создаёте AI-приложения?** → Начните с [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 минут) или изучите [Розничный мультиагент](retail-scenario.md) (⭐⭐⭐⭐, более 2 часов)
4. **Нужен конкретный технологический стек?** → Используйте раздел [Поиск подходящего примера](#-finding-the-right-example) выше

### Следующие шаги

- ✅ Ознакомьтесь с [Предварительными требованиями](#предварительные-требования) выше
- ✅ Выберите пример, соответствующий вашему уровню (см. [Легенду сложности](#легенда-сложности))
- ✅ Внимательно прочитайте README примера перед развертыванием
- ✅ Установите напоминание выполнить `azd down` после тестирования
- ✅ Поделитесь опытом через GitHub Issues или Discussions

### Нужна помощь?

- 📖 [Часто задаваемые вопросы](../resources/faq.md) – ответы на распространённые вопросы
- 🐛 [Руководство по устранению неполадок](../docs/chapter-07-troubleshooting/common-issues.md) – исправление проблем с развертыванием
- 💬 [Обсуждения на GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) – помощь сообщества
- 📚 [Учебное пособие](../resources/study-guide.md) – укрепление знаний

---

**Навигация**
- **📚 Главная курса**: [AZD для начинающих](../README.md)
- **📖 Учебные материалы**: [Учебное пособие](../resources/study-guide.md) | [Шпаргалка](../resources/cheat-sheet.md) | [Глоссарий](../resources/glossary.md)
- **🔧 Ресурсы**: [FAQ](../resources/faq.md) | [Устранение неполадок](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Последнее обновление: ноябрь 2025 | [Сообщить о проблемах](https://github.com/microsoft/AZD-for-beginners/issues) | [Внести примеры](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->