# Примеры - Практические шаблоны и конфигурации AZD

**Обучение на примерах - Организовано по главам**  
- **📚 Домашняя страница курса**: [AZD для начинающих](../README.md)  
- **📖 Картирование глав**: Примеры, организованные по сложности обучения  
- **🚀 Локальный пример**: [Розничное многоагентное решение](retail-scenario.md)  
- **🤖 Внешние AI-примеры**: Ссылки на репозитории Azure Samples  

> **📍 ВАЖНО: Локальные и внешние примеры**  
> В этом репозитории содержатся **4 полноценных локальных примера** с полным кодом:  
> - **Чат Microsoft Foundry Models** (развертывание gpt-4.1 с интерфейсом чата)  
> - **Container Apps** (Простой Flask API + микросервисы)  
> - **Приложение с базой данных** (Веб + SQL база данных)  
> - **Розничное многоагентное решение** (Корпоративное AI-решение)  
>  
> Дополнительные примеры являются **ссылками на внешние** репозитории Azure-Samples, которые вы можете клонировать.

## Введение

Этот каталог предоставляет практические примеры и ссылки, чтобы помочь вам изучить Azure Developer CLI через практическое освоение. Сценарий Retail Multi-Agent — это полное, готовое к продакшену решение, включённое в этот репозиторий. Дополнительные примеры ссылаются на официальные Azure Samples, демонстрирующие различные паттерны AZD.

### Легенда по уровню сложности

- ⭐ **Начинающий** - базовые понятия, один сервис, 15-30 минут  
- ⭐⭐ **Средний** - несколько сервисов, интеграция с базой данных, 30-60 минут  
- ⭐⭐⭐ **Продвинутый** - сложная архитектура, интеграция AI, 1-2 часа  
- ⭐⭐⭐⭐ **Эксперт** - готовый к продакшену, корпоративные паттерны, 2+ часа  

## 🎯 Что именно в этом репозитории

### ✅ Локальная реализация (Готова к использованию)

#### [Чат-приложение Microsoft Foundry Models](azure-openai-chat/README.md) 🆕  
**Полное развертывание gpt-4.1 с чат-интерфейсом включено в этот репозиторий**

- **Расположение:** `examples/azure-openai-chat/`  
- **Сложность:** ⭐⭐ (Средний)  
- **Включено:**
  - Полное развертывание Microsoft Foundry Models (gpt-4.1)  
  - Командный чат-интерфейс на Python  
  - Интеграция с Key Vault для безопасного хранения ключей API  
  - Bicep шаблоны инфраструктуры  
  - Отслеживание использования токенов и затрат  
  - Ограничение частоты запросов и обработка ошибок  

**Быстрый старт:**  
```bash
# Перейти к примеру
cd examples/azure-openai-chat

# Развернуть все
azd up

# Установить зависимости и начать чат
pip install -r src/requirements.txt
python src/chat.py
```
  
**Технологии:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep  

#### [Примеры Container App](container-app/README.md) 🆕  
**Всесторонние примеры развертывания контейнеров включены в этот репозиторий**

- **Расположение:** `examples/container-app/`  
- **Сложность:** ⭐-⭐⭐⭐⭐ (От начинающего до продвинутого)  
- **Включено:**
  - [Основное руководство](container-app/README.md) — полный обзор развертываний контейнеров  
  - [Простой Flask API](../../../examples/container-app/simple-flask-api) — базовый пример REST API  
  - [Микросервисная архитектура](../../../examples/container-app/microservices) — готовое к продакшену развертывание нескольких сервисов  
  - Быстрый старт, продакшен и продвинутые паттерны  
  - Мониторинг, безопасность и оптимизация затрат  

**Быстрый старт:**  
```bash
# Просмотреть мастер-гайд
cd examples/container-app

# Развернуть простой Flask API
cd simple-flask-api
azd up

# Развернуть пример микросервисов
cd ../microservices
azd up
```
  
**Технологии:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights  

#### [Розничное многоагентное решение](retail-scenario.md) 🆕  
**Полное готовое к продакшену решение включено в этот репозиторий**

- **Расположение:** `examples/retail-multiagent-arm-template/`  
- **Сложность:** ⭐⭐⭐⭐ (Продвинутый)  
- **Включено:**
  - Полный ARM шаблон развертывания  
  - Многоагентная архитектура (Клиент + Инвентарь)  
  - Интеграция Microsoft Foundry Models  
  - Поиск с AI и RAG  
  - Полный мониторинг  
  - Скрипт развертывания одним кликом  

**Быстрый старт:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Технологии:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights  

---

## 🔗 Внешние примеры Azure Samples (клонируйте для использования)

Следующие примеры поддерживаются в официальных репозиториях Azure-Samples. Клонируйте их для изучения различных паттернов AZD:

### Простые приложения (главы 1-2)

| Шаблон | Репозиторий | Сложность | Сервисы |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Локальный: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Микросервисы** | [Локальный: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Многосервисный, Service Bus, Cosmos DB, SQL |
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
| **Microsoft Foundry Models Chat** | [Локальный: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Развертывание gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Базовый AI чат |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Фреймворк агентов |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Паттерн RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Корпоративный AI |

### Базы данных и продвинутые паттерны (главы 3-8)

| Шаблон | Репозиторий | Сложность | Фокус |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Интеграция базы данных |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL серверлесс |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Многосервисный |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Цели обучения

Работая с этими примерами, вы сможете:  
- Практиковаться с Azure Developer CLI на реальных сценариях приложений  
- Понять разные архитектуры приложений и их реализации через azd  
- Освоить паттерны Infrastructure as Code для различных сервисов Azure  
- Применять управление конфигурацией и стратегии развертывания для разных сред  
- Реализовать мониторинг, безопасность и паттерны масштабирования в практических задачах  
- Получить опыт диагностики и отладки реальных сценариев развертывания  

## Результаты обучения

По окончании работы с примерами вы сможете:  
- Уверенно разворачивать различные типы приложений с помощью Azure Developer CLI  
- Адаптировать предоставленные шаблоны под собственные требования приложений  
- Проектировать и реализовывать собственные инфраструктурные паттерны с помощью Bicep  
- Конфигурировать сложные многосервисные приложения с правильными зависимостями  
- Применять лучшие практики безопасности, мониторинга и производительности в реальных условиях  
- Диагностировать и оптимизировать развертывания на основе практического опыта  

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

> **💡 Новичок в AZD?** Начните с примера #1 (Flask API) — занимает ~20 минут и объясняет основные концепции.

### Для начинающих  
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Локальный) ⭐  
   Развёртывание простого REST API с масштабированием до нуля  
   **Время:** 20-25 минут | **Стоимость:** $0-5/месяц  
   **Вы изучите:** базовый рабочий процесс azd, контейнеризацию, health probes  
   **Ожидаемый результат:** Рабочая конечная точка API, возвращающая "Hello, World!" с мониторингом  

2. **[Простое веб-приложение - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Развёртывание веб-приложения Node.js Express с MongoDB  
   **Время:** 25-35 минут | **Стоимость:** $10-30/месяц  
   **Вы изучите:** интеграцию базы данных, переменные окружения, строки подключения  
   **Ожидаемый результат:** приложение списка задач с созданием/чтением/обновлением/удалением  

3. **[Статический сайт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Размещение статического сайта React с помощью Azure Static Web Apps  
   **Время:** 20-30 минут | **Стоимость:** $0-10/месяц  
   **Вы изучите:** статический хостинг, серверлесс функции, CDN развертывание  
   **Ожидаемый результат:** React UI с бэкендом API, автоматический SSL, глобальный CDN  

### Для пользователей среднего уровня  
4. **[Чат-приложение Microsoft Foundry Models](../../../examples/azure-openai-chat)** (Локальный) ⭐⭐  
   Развёртывание gpt-4.1 с чат-интерфейсом и безопасным управлением ключами API  
   **Время:** 35-45 минут | **Стоимость:** $50-200/месяц  
   **Вы изучите:** развертывание Microsoft Foundry Models, интеграция Key Vault, отслеживание токенов  
   **Ожидаемый результат:** Рабочее чат-приложение с gpt-4.1 и мониторингом затрат  

5. **[Container App - Микросервисы](../../../examples/container-app/microservices)** (Локальный) ⭐⭐⭐⭐  
   Готовая к продакшену многосервисная архитектура  
   **Время:** 45-60 минут | **Стоимость:** $50-150/месяц  
   **Вы изучите:** коммуникацию сервисов, очереди сообщений, распределённый трассинг  
   **Ожидаемый результат:** система из 2 сервисов (API Gateway + Product Service) с мониторингом  

6. **[Приложение с базой данных - C# с Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Веб-приложение с C# API и Azure SQL Database  
   **Время:** 30-45 минут | **Стоимость:** $20-80/месяц  
   **Вы изучите:** Entity Framework, миграции базы данных, безопасность подключения  
   **Ожидаемый результат:** C# API с Azure SQL бэкендом и автоматическим развертыванием схемы  

7. **[Серверлесс функция - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions с HTTP триггерами и Cosmos DB  
   **Время:** 30-40 минут | **Стоимость:** $10-40/месяц  
   **Вы изучите:** событийно-ориентированную архитектуру, серверлесс масштабирование, интеграцию NoSQL  
   **Ожидаемый результат:** функция, отвечающая на HTTP-запросы с хранением данных в Cosmos DB  

8. **[Микросервисы - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Многосервисное Java-приложение с Container Apps и API шлюзом  
   **Время:** 60-90 минут | **Стоимость:** $80-200/месяц  
   **Вы изучите:** развертывание Spring Boot, сервисную сетку, балансировку нагрузки  
   **Ожидаемый результат:** многосервисная Java-система с обнаружением сервисов и маршрутизацией  

### Шаблоны Microsoft Foundry

1. **[Чат-приложение Microsoft Foundry Models - Локальный пример](../../../examples/azure-openai-chat)** ⭐⭐  
   Полное развертывание gpt-4.1 с чат-интерфейсом  
   **Время:** 35-45 минут | **Стоимость:** $50-200/месяц  
   **Ожидаемый результат:** Рабочий чат с отслеживанием токенов и мониторингом затрат  

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Интеллектуальное чат-приложение с архитектурой RAG  
   **Время:** 60-90 минут | **Стоимость:** $100-300/месяц  
   **Ожидаемый результат:** чат с RAG, поддерживающий поиск по документам и цитаты  

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Анализ документов с использованием Azure AI сервисов  
   **Время:** 40-60 минут | **Стоимость:** $20-80/месяц  
   **Ожидаемый результат:** API для извлечения текста, таблиц и сущностей из загруженных документов  

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps workflow с Azure Machine Learning  
   **Время:** 2-3 часа | **Стоимость:** $150-500/месяц  
   **Ожидаемый результат:** автоматизированный ML pipeline с обучением, развертыванием и мониторингом  

### Реальные сценарии

#### **Розничное многоагентное решение** 🆕  
**[Полное руководство по реализации](./retail-scenario.md)**

Комплексное, готовое к продакшену многоагентное решение для поддержки клиентов, демонстрирующее использование корпоративных AI-приложений с AZD. Этот сценарий предоставляет:
- **Полная архитектура**: Мультиагентная система с специализированными агентами обслуживания клиентов и управления запасами
- **Производственная инфраструктура**: Развертывания моделей Microsoft Foundry в нескольких регионах, AI Search, Container Apps и комплексный мониторинг
- **Готовый к развертыванию ARM шаблон**: Развертывание в один клик с несколькими режимами конфигурации (Минимальный/Стандарт/Премиум)
- **Продвинутые возможности**: Валидация безопасности Red teaming, фреймворк оценки агентов, оптимизация затрат и руководства по устранению неполадок
- **Реальный бизнес-контекст**: Пример поддержки клиентов розничного продавца с загрузкой файлов, интеграцией поиска и динамическим масштабированием

**Технологии**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Сложность**: ⭐⭐⭐⭐ (Продвинутый - готов к корпоративному производству)

**Идеально для**: AI-разработчиков, архитекторов решений и команд, создающих производственные мультиагентные системы

**Быстрый старт**: Разверните полное решение менее чем за 30 минут с помощью включённого ARM шаблона командой `./deploy.sh -g myResourceGroup`

## 📋 Инструкции по использованию

### Требования

Перед запуском любого примера:
- ✅ Подписка Azure с правами Владельца или Участника
- ✅ Установленный Azure Developer CLI ([Руководство по установке](../docs/chapter-01-foundation/installation.md))
- ✅ Запущенный Docker Desktop (для примеров с контейнерами)
- ✅ Соответствующие квоты Azure (проверьте требования конкретного примера)

> **💰 Предупреждение о затратах:** Все примеры создают реальные ресурсы Azure, за использование которых взимаются платы. См. файлы README отдельных примеров для оценки стоимости. Не забудьте выполнить `azd down` по завершении, чтобы избежать дальнейших затрат.

### Локальный запуск примеров

1. **Клонировать или скопировать пример**
   ```bash
   # Перейдите к нужному примеру
   cd examples/simple-web-app
   ```

2. **Инициализировать окружение AZD**
   ```bash
   # Инициализация с существующим шаблоном
   azd init
   
   # Или создать новую среду
   azd env new my-environment
   ```

3. **Настроить окружение**
   ```bash
   # Установить необходимые переменные
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
   
   # Проверить конечную точку (пример)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Ожидаемые признаки успешного выполнения:**
   - ✅ `azd up` завершается без ошибок
   - ✅ Конечная точка сервиса возвращает HTTP 200
   - ✅ В Azure Portal отображается статус "Running"
   - ✅ Application Insights получает телеметрию

> **⚠️ Возникли проблемы?** См. [Типичные проблемы](../docs/chapter-07-troubleshooting/common-issues.md) для устранения неполадок развертывания

### Адаптация примеров

Каждый пример включает:
- **README.md** - подробные инструкции по установке и настройке
- **azure.yaml** - конфигурация AZD с комментариями
- **infra/** - Bicep-шаблоны с пояснениями параметров
- **src/** - пример кода приложения
- **scripts/** - вспомогательные скрипты для общих задач

## 🎯 Учебные цели

### Категории примеров

#### **Базовые развертывания**
- Односервисные приложения
- Простые инфраструктурные шаблоны
- Базовое управление конфигурацией
- Экономичные среды разработки

#### **Продвинутые сценарии**
- Мультисервисные архитектуры
- Сложные конфигурации сетей
- Шаблоны интеграции баз данных
- Реализация безопасности и соответствия

#### **Шаблоны, готовые к производству**
- Конфигурации высокой доступности
- Мониторинг и наблюдаемость
- Интеграция CI/CD
- Сценарии восстановления после сбоев

## 📖 Описания примеров

### Простое веб-приложение - Node.js Express
**Технологии**: Node.js, Express, MongoDB, Container Apps  
**Сложность**: Начальный уровень  
**Концепции**: Простейшее развертывание, REST API, интеграция NoSQL базы данных

### Статический сайт - React SPA
**Технологии**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Сложность**: Начальный уровень  
**Концепции**: Статический хостинг, бессерверный бэкенд, современная веб-разработка

### Container App - Python Flask
**Технологии**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Сложность**: Начальный уровень  
**Концепции**: Контейнеризация, REST API, масштабирование до нуля, проверки состояния, мониторинг  
**Расположение**: [Локальный пример](../../../examples/container-app/simple-flask-api)

### Container App - Микросервисная архитектура
**Технологии**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Сложность**: Продвинутый уровень  
**Концепции**: Мультисервисная архитектура, взаимодействие сервисов, очереди сообщений, распределённое трассирование  
**Расположение**: [Локальный пример](../../../examples/container-app/microservices)

### База данных - C# с Azure SQL
**Технологии**: C# ASP.NET Core, Azure SQL Database, App Service  
**Сложность**: Средний уровень  
**Концепции**: Entity Framework, подключения к базе данных, разработка веб-API

### Бессерверная функция - Python Azure Functions
**Технологии**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Сложность**: Средний уровень  
**Концепции**: Событийно-ориентированная архитектура, бессерверные вычисления, full-stack разработка

### Микросервисы - Java Spring Boot
**Технологии**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Сложность**: Средний уровень  
**Концепции**: Взаимодействие микросервисов, распределённые системы, корпоративные шаблоны

### Примеры Microsoft Foundry

#### Чат-приложение Microsoft Foundry Models
**Технологии**: Microsoft Foundry Models, Cognitive Search, App Service  
**Сложность**: Средний уровень  
**Концепции**: Архитектура RAG, векторный поиск, интеграция больших языковых моделей

#### AI Обработка документов
**Технологии**: Azure AI Document Intelligence, Storage, Functions  
**Сложность**: Средний уровень  
**Концепции**: Анализ документов, OCR, извлечение данных

#### Пайплайн машинного обучения
**Технологии**: Azure ML, MLOps, Container Registry  
**Сложность**: Продвинутый уровень  
**Концепции**: Обучение моделей, пайплайны развертывания, мониторинг

## 🛠 Примеры конфигураций

Каталог `configurations/` содержит переиспользуемые компоненты:

### Конфигурации окружения
- Настройки для среды разработки
- Конфигурации для staging
- Готовые к производству конфигурации
- Развёртывания в нескольких регионах

### Модули Bicep
- Переиспользуемые компоненты инфраструктуры
- Распространённые шаблоны ресурсов
- Шаблоны с усиленной безопасностью
- Оптимизированные по затратам конфигурации

### Вспомогательные скрипты
- Автоматизация настройки окружения
- Скрипты миграции баз данных
- Инструменты проверки развертывания
- Утилиты мониторинга затрат

## 🔧 Руководство по настройке

### Адаптация примеров под ваш кейс

1. **Изучите требования**
   - Проверьте требования служб Azure
   - Уточните лимиты подписки
   - Оцените влияние на затраты

2. **Измените конфигурацию**
   - Обновите определения служб в `azure.yaml`
   - Настройте Bicep-шаблоны
   - Отрегулируйте переменные окружения

3. **Тщательно протестируйте**
   - Сначала разверните в среде разработки
   - Проверьте работоспособность
   - Проверьте масштабируемость и производительность

4. **Проведите аудит безопасности**
   - Проверьте управление доступом
   - Реализуйте управление секретами
   - Включите мониторинг и оповещения

## 📊 Сравнительная матрица

| Пример | Сервисы | База данных | Аутентификация | Мониторинг | Сложность |
|---------|----------|-------------|----------------|------------|-----------|
| **Чат Microsoft Foundry Models** (Локально) | 2 | ❌ | Key Vault | Полный | ⭐⭐ |
| **Python Flask API** (Локально) | 1 | ❌ | Базовая | Полный | ⭐ |
| **Микросервисы** (Локально) | 5+ | ✅ | Корпоративная | Продвинутая | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Базовая | Базовый | ⭐ |
| React SPA + Functions | 3 | ✅ | Базовая | Полный | ⭐ |
| Python Flask Container | 2 | ❌ | Базовая | Полный | ⭐ |
| C# Web API + SQL | 2 | ✅ | Полный | Полный | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Полный | Полный | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Полный | Полный | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Полный | Полный | ⭐⭐⭐ |
| AI Обработка документов | 2 | ❌ | Базовая | Полный | ⭐⭐ |
| ML Пайплайн | 4+ | ✅ | Полный | Полный | ⭐⭐⭐⭐ |
| **Розничная мультиагентная система** (Локально) | **8+** | **✅** | **Корпоративная** | **Продвинутая** | **⭐⭐⭐⭐** |

## 🎓 Учебный путь

### Рекомендуемая последовательность

1. **Начать с простого веб-приложения**
   - Изучить базовые концепции AZD
   - Понять процесс развертывания
   - Практиковаться в управлении окружением

2. **Попробовать статический сайт**
   - Изучить разные варианты хостинга
   - Понять интеграцию CDN
   - Освоить настройку DNS

3. **Перейти к Container App**
   - Изучить основы контейнеризации
   - Понять концепции масштабирования
   - Практиковаться с Docker

4. **Добавить интеграцию с базой данных**
   - Изучить provisioning баз данных
   - Ознакомиться со строками подключения
   - Освоить управление секретами

5. **Изучить бессерверные технологии**
   - Понять событийно-ориентированную архитектуру
   - Изучить триггеры и привязки
   - Практиковаться с API

6. **Построить микросервисы**
   - Изучить взаимодействие сервисов
   - Понять распределённые системы
   - Практиковаться в сложных развертываниях

## 🔍 Поиск подходящего примера

### По стеку технологий
- **Container Apps**: [Python Flask API (Локально)](../../../examples/container-app/simple-flask-api), [Микросервисы (Локально)](../../../examples/container-app/microservices), Java Микросервисы
- **Node.js**: Node.js Express Todo, [API Gateway микросервисов (Локально)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Локально)](../../../examples/container-app/simple-flask-api), [Микросервис Product (Локально)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Микросервис Order (Локально)](../../../examples/container-app/microservices), C# Web API + SQL, Microsoft Foundry Models Chat, ML Пайплайн
- **Go**: [Микросервис User (Локально)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Микросервисы
- **React**: React SPA + Functions
- **Контейнеры**: [Python Flask (Локально)](../../../examples/container-app/simple-flask-api), [Микросервисы (Локально)](../../../examples/container-app/microservices), Java Микросервисы
- **Базы данных**: [Микросервисы (Локально)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Локально)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat, AI Обработка документов, ML Пайплайн, **Розничная мультиагентная система**
- **Мультиагентные системы**: **Розничная мультиагентная система**
- **Интеграция OpenAI**: **[Microsoft Foundry Models Chat (Локально)](../../../examples/azure-openai-chat)**, Розничная мультиагентная система
- **Предприятие и продакшен**: [Микросервисы (Локально)](../../../examples/container-app/microservices), **Розничная мультиагентная система**

### По архитектурному паттерну
- **Простой REST API**: [Python Flask API (Локально)](../../../examples/container-app/simple-flask-api)
- **Монолит**: Node.js Express Todo, C# Web API + SQL
- **Статический + бессерверный**: React SPA + Functions, Python Functions + SPA
- **Микросервисы**: [Микросервисы для продакшена (Локально)](../../../examples/container-app/microservices), Java Spring Boot Микросервисы
- **Контейнеризированные**: [Python Flask (Локально)](../../../examples/container-app/simple-flask-api), [Микросервисы (Локально)](../../../examples/container-app/microservices)
- **На базе ИИ**: **[Microsoft Foundry Models Chat (Локально)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat, AI Обработка документов, ML Пайплайн, **Розничная мультиагентная система**
- **Мультиагентная архитектура**: **Розничная мультиагентная система**
- **Корпоративные мультисервисные решения**: [Микросервисы (Локально)](../../../examples/container-app/microservices), **Розничная мультиагентная система**

### По уровню сложности
- **Начинающий**: [Python Flask API (Локально)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Средний**: **[Microsoft Foundry Models Chat (Локально)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Микросервисы, Microsoft Foundry Models Chat, AI Обработка документов
- **Продвинутый**: ML Пайплайн
- **Готовое к производству корпоративное решение**: [Микросервисы (Локально)](../../../examples/container-app/microservices) (Мультисервис с очередями сообщений), **Розничная мультиагентная система** (Полная мультиагентная система с развертыванием ARM шаблона)

## 📚 Дополнительные ресурсы

### Ссылки на документацию
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Документация Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Примеры от сообщества
- [Шаблоны Azure Samples AZD](https://github.com/Azure-Samples/azd-templates)
- [Шаблоны Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)
- [Галерея Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Todo приложение на C# и Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo приложение на Python и MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo приложение на Node.js и PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React веб-приложение с C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Задачи Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions на Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Лучшие практики
- [Фреймворк Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Фреймворк адаптации в облаке](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Вклад в примеры

Есть полезный пример, которым хотите поделиться? Мы приветствуем вклад!

### Руководство по подаче
1. Следуйте установленной структуре каталогов
2. Включите подробный README.md
3. Добавьте комментарии в конфигурационные файлы
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

**Профессиональный совет**: Начните с самого простого примера, соответствующего вашему технологическому стеку, затем постепенно переходите к более сложным сценариям. Каждый пример строится на концепциях предыдущих!

## 🚀 Готовы начать?

### Ваш путь обучения

1. **Полный новичок?** → Начните с [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 мин)
2. **Имеете базовые знания AZD?** → Попробуйте [Микросервисы](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 мин)
3. **Строите AI-приложения?** → Начните с [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 мин) или исследуйте [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ часа)
4. **Нужен конкретный стек технологий?** → Используйте раздел [Поиск подходящего примера](../../../examples) выше

### Следующие шаги

- ✅ Ознакомьтесь с [Предварительными требованиями](../../../examples) выше
- ✅ Выберите пример, соответствующий вашему уровню (см. [Легенду сложности](../../../examples))
- ✅ Внимательно прочитайте README выбранного примера перед развертыванием
- ✅ Установите напоминание выполнить `azd down` после тестирования
- ✅ Поделитесь своим опытом через GitHub Issues или Discussions

### Нужна помощь?

- 📖 [FAQ](../resources/faq.md) - Ответы на частые вопросы
- 🐛 [Руководство по устранению неполадок](../docs/chapter-07-troubleshooting/common-issues.md) - Исправление проблем с развертыванием
- 💬 [Обсуждения GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Спросите у сообщества
- 📚 [Учебное пособие](../resources/study-guide.md) - Закрепление знаний

---

**Навигация**
- **📚 Главная страница курса**: [AZD для начинающих](../README.md)
- **📖 Учебные материалы**: [Учебное пособие](../resources/study-guide.md) | [Шпаргалка](../resources/cheat-sheet.md) | [Глоссарий](../resources/glossary.md)
- **🔧 Ресурсы**: [FAQ](../resources/faq.md) | [Устранение неполадок](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Последнее обновление: ноябрь 2025 | [Сообщить о проблемах](https://github.com/microsoft/AZD-for-beginners/issues) | [Внести примеры](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия обеспечить точность, имейте в виду, что автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для критически важной информации рекомендуется обратиться к профессиональному переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->