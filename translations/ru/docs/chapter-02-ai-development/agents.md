# Агентства ИИ с использованием Azure Developer CLI

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD Для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 2 - Разработка с приоритетом на ИИ
- **⬅️ Предыдущая**: [Интеграция Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Следующая**: [Развёртывание модели ИИ](ai-model-deployment.md)
- **🚀 Продвинутый уровень**: [Решения с несколькими агентами](../../examples/retail-scenario.md)

---

## Введение

Агенты ИИ — это автономные программы, которые могут воспринимать своё окружение, принимать решения и предпринимать действия для достижения конкретных целей. В отличие от простых чат-ботов, которые отвечают на запросы, агенты могут:

- **Использовать инструменты** — вызывать API, искать в базах данных, выполнять код
- **Планировать и рассуждать** — разбивать сложные задачи на шаги
- **Обучаться на контексте** — сохранять память и адаптировать поведение
- **Сотрудничать** — работать с другими агентами (мультиагентные системы)

Это руководство показывает, как развернуть агентов ИИ в Azure с использованием Azure Developer CLI (azd).

> **Примечание по проверке (2026-03-25):** Это руководство проверено с `azd` версии `1.23.12` и `azure.ai.agents` `0.1.18-preview`. Опыт использования `azd ai` пока в стадии предварительного просмотра, поэтому смотрите справку по расширению, если установленные у вас флаги отличаются.

## Учебные цели

После выполнения этого руководства вы:
- Поймёте, что такое агенты ИИ и чем они отличаются от чат-ботов
- Развернёте готовые шаблоны агентов ИИ с помощью AZD
- Настроите Foundry Agents для создания кастомных агентов
- Реализуете базовые паттерны агентов (использование инструментов, RAG, мультиагенты)
- Научитесь отслеживать и отлаживать развернутых агентов

## Результаты обучения

После завершения вы сможете:
- Развёртывать приложения агентов ИИ в Azure одной командой
- Настраивать инструменты и возможности агентов
- Реализовывать генерацию с использованием поиска (RAG) с агентами
- Проектировать мультиагентные архитектуры для сложных рабочих процессов
- Устранять распространённые проблемы при развертывании агентов

---

## 🤖 Чем агент отличается от чатбота?

| Особенность | Чатбот | Агент ИИ |
|-------------|---------|-----------|
| **Поведение** | Отвечает на запросы | Принимает автономные действия |
| **Инструменты** | Нет | Может вызывать API, искать, выполнять код |
| **Память** | Только сессия | Постоянная память между сессиями |
| **Планирование** | Один ответ | Многошаговое рассуждение |
| **Сотрудничество** | Одиночный субъект | Может работать с другими агентами |

### Простая аналогия

- **Чатбот** = Помощник, отвечающий на вопросы у информационной стойки
- **Агент ИИ** = Личный ассистент, который может звонить, записывать на приём и выполнять задачи за вас

---

## 🚀 Быстрый старт: разверните своего первого агента

### Вариант 1: Шаблон Foundry Agents (рекомендуется)

```bash
# Инициализировать шаблон AI агентов
azd init --template get-started-with-ai-agents

# Развернуть в Azure
azd up
```

**Что разворачивается:**
- ✅ Foundry Agents
- ✅ Модели Microsoft Foundry (gpt-4.1)
- ✅ Azure AI Search (для RAG)
- ✅ Azure Container Apps (веб-интерфейс)
- ✅ Application Insights (мониторинг)

**Время:** ~15-20 минут  
**Стоимость:** ~$100-150/месяц (разработка)

### Вариант 2: Агент OpenAI с Prompty

```bash
# Инициализировать шаблон агента на основе Prompty
azd init --template agent-openai-python-prompty

# Развернуть в Azure
azd up
```

**Что разворачивается:**
- ✅ Azure Functions (безсерверное выполнение агента)
- ✅ Модели Microsoft Foundry
- ✅ Файлы конфигурации Prompty
- ✅ Пример реализации агента

**Время:** ~10-15 минут  
**Стоимость:** ~$50-100/месяц (разработка)

### Вариант 3: RAG чат-агент

```bash
# Инициализация шаблона чата RAG
azd init --template azure-search-openai-demo

# Развернуть на Azure
azd up
```

**Что разворачивается:**
- ✅ Модели Microsoft Foundry
- ✅ Azure AI Search с примерными данными
- ✅ Конвейер обработки документов
- ✅ Чат-интерфейс с цитатами

**Время:** ~15-25 минут  
**Стоимость:** ~$80-150/месяц (разработка)

### Вариант 4: Инициализация агента AZD AI (на основе манифеста или шаблона, предварительный просмотр)

Если у вас есть файл манифеста агента, вы можете использовать команду `azd ai` для создания проекта Foundry Agent Service напрямую. Последние предварительные выпуски также добавили поддержку инициализации на основе шаблонов, поэтому последовательность запросов может незначительно отличаться в зависимости от версии установленного расширения.

```bash
# Установите расширение AI agents
azd extension install azure.ai.agents

# Необязательно: проверьте установленную предварительную версию
azd extension show azure.ai.agents

# Инициализация из манифеста агента
azd ai agent init -m agent-manifest.yaml

# Развертывание в Azure
azd up

# Тестирование развернутого агента (показывает задержку и время до первого байта)
azd ai agent invoke
```

**Когда использовать `azd ai agent init` против `azd init --template`:**

| Способ | Для чего подходит | Как работает |
|---------|-------------------|--------------|
| `azd init --template` | Начать с рабочего примера приложения | Клонирует полный репозиторий шаблона с кодом и инфраструктурой |
| `azd ai agent init -m` | Строить на основе собственного манифеста агента | Создаёт структуру проекта из вашего описания агента |

> **Совет:** Используйте `azd init --template`, когда учитесь (варианты 1-3 выше). Используйте `azd ai agent init` при создании продакшн-агентов со своими манифестами.

После `azd up` то же расширение сопровождает вас на всех этапах жизненного цикла агента: `azd ai agent invoke` для тестирования, `azd ai agent eval generate` и `azd ai agent optimize` для измерения и улучшения качества, а также `azd ai agent delete` для очистки. Полный список команд смотрите в [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

---

## 🏗️ Паттерны архитектуры агентов

### Паттерн 1: Один агент с инструментами

Самый простой паттерн — один агент, использующий несколько инструментов.

```mermaid
graph TD
    UI[Пользовательский интерфейс] --> Agent[AI Агент<br/>gpt-4.1]
    Agent --> Search[Инструмент поиска]
    Agent --> Database[Инструмент базы данных]
    Agent --> API[Инструмент API]
```

**Подходит для:**
- Ботов поддержки клиентов
- Помощников в исследованиях
- Агентов по анализу данных

**Шаблон AZD:** `azure-search-openai-demo`

### Паттерн 2: Агент RAG (генерация с использованием поиска)

Агент, который сначала ищет релевантные документы, а затем генерирует ответы.

```mermaid
graph TD
    Query[Запрос пользователя] --> RAG[RAG агент]
    RAG --> Vector[Векторный поиск]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- Документы --> LLM
    LLM --> Response[Ответ с цитатами]
```

**Подходит для:**
- Корпоративных баз знаний
- Систем вопросов и ответов по документам
- Исследований на соответствие и юридических исследований

**Шаблон AZD:** `azure-search-openai-demo`

### Паттерн 3: Мультиагентная система

Несколько специализированных агентов, работающих вместе над сложными задачами.

```mermaid
graph TD
    Orchestrator[Агент Оркестрации] --> Research[Агент Исследования<br/>gpt-4.1]
    Orchestrator --> Writer[Агент Писатель<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[Агент Рецензент<br/>gpt-4.1]
```

**Подходит для:**
- Сложной генерации контента
- Многошаговых рабочих процессов
- Задач, требующих разной экспертизы

**Подробнее:** [Мультиагентные паттерны координации](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Настройка инструментов агента

Агенты становятся мощными, когда могут использовать инструменты. Вот как настроить распространённые инструменты:

### Настройка инструментов в Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Определить пользовательские инструменты
search_tool = FunctionTool(
    name="search_knowledge_base",
    description="Search the company knowledge base for relevant documents",
    parameters={
        "type": "object",
        "properties": {
            "query": {
                "type": "string",
                "description": "The search query"
            }
        },
        "required": ["query"]
    }
)

# Создать агента с инструментами
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Конфигурация окружения

```bash
# Установить переменные окружения, специфичные для агента
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Развернуть с обновленной конфигурацией
azd deploy
```

---

## 📊 Мониторинг агентов

### Интеграция с Application Insights

Все шаблоны агентов AZD включают Application Insights для мониторинга:

```bash
# Открыть панель мониторинга
azd monitor --overview

# Просмотр живых логов
azd monitor --logs

# Просмотр живых метрик
azd monitor --live
```

### Ключевые метрики для отслеживания

| Метрика | Описание | Цель |
|---------|----------|------|
| Задержка ответа | Время генерации ответа | < 5 секунд |
| Использование токенов | Токены на запрос | Контроль стоимости |
| Успешность вызовов инструментов | % успешных вызовов инструментов | > 95% |
| Уровень ошибок | Неудачные запросы агента | < 1% |
| Удовлетворенность пользователей | Оценки отзывов | > 4.0/5.0 |

### Кастомное логирование для агентов

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# Настройте Azure Monitor с помощью OpenTelemetry
configure_azure_monitor(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
)

tracer = trace.get_tracer(__name__)

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    with tracer.start_as_current_span("agent_interaction") as span:
        span.set_attributes({
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        })
```

> **Примечание:** Установите необходимые пакеты: `pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 Финансовые соображения

### Примерные ежемесячные затраты по паттернам

| Паттерн | Среда разработки | Продакшн |
|---------|------------------|----------|
| Один агент | $50-100 | $200-500 |
| Агент RAG | $80-150 | $300-800 |
| Мультиагенты (2-3 агента) | $150-300 | $500-1,500 |
| Корпоративные мультиагенты | $300-500 | $1,500-5,000+ |

### Советы по оптимизации затрат

1. **Используйте gpt-4.1-mini для простых задач**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. **Внедрите кэширование для повторяющихся запросов**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Устанавливайте лимиты токенов на запуск**
   ```python
   # Устанавливайте max_completion_tokens при запуске агента, а не во время создания
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # Ограничьте длину ответа
   )
   ```

4. **Масштабируйте до нуля, когда не используется**
   ```bash
   # Контейнерные приложения автоматически масштабируются до нуля
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Устранение неполадок агентов

### Распространённые проблемы и решения

<details>
<summary><strong>❌ Агент не отвечает на вызовы инструментов</strong></summary>

```bash
# Проверьте, правильно ли зарегистрированы инструменты
azd show

# Проверьте развертывание OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Проверьте журналы агента
azd monitor --logs
```

**Основные причины:**
- Несовпадение сигнатур функций инструментов
- Отсутствие необходимых разрешений
- Недоступность API-эндпоинта
</details>

<details>
<summary><strong>❌ Высокая задержка ответов агента</strong></summary>

```bash
# Проверьте Application Insights на узкие места
azd monitor --live

# Рассмотрите возможность использования более быстрой модели
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd deploy
```

**Советы по оптимизации:**
- Используйте потоковую выдачу ответов
- Внедрите кэширование ответов
- Уменьшите размер контекстного окна
</details>

<details>
<summary><strong>❌ Агент возвращает некорректную или вымышленную информацию</strong></summary>

```python
# Улучшить с помощью лучших системных подсказок
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Добавить поиск для обоснования
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # Основывать ответы на документах
)
```
</details>

<details>
<summary><strong>❌ Ошибки превышения лимита токенов</strong></summary>

```python
# Реализовать управление оконным контекстом
def truncate_context(messages, max_tokens=8000, model="gpt-4.1"):
    """Keep only recent messages within token limit."""
    import tiktoken
    encoding = tiktoken.encoding_for_model(model)
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(encoding.encode(msg.content))
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Практические упражнения

### Упражнение 1: Разверните базового агента (20 минут)

**Цель:** Развернуть вашего первого агента ИИ с помощью AZD

```bash
# Шаг 1: Инициализация шаблона
azd init --template get-started-with-ai-agents

# Шаг 2: Вход в Azure
azd auth login
# Если вы работаете с несколькими арендаторами, добавьте --tenant-id <tenant-id>

# Шаг 3: Развертывание
azd up

# Шаг 4: Тестирование агента
# Ожидаемый результат после развертывания:
#   Развертывание завершено!
#   Конечная точка: https://<app-name>.<region>.azurecontainerapps.io
# Откройте URL, показанный в выводе, и попробуйте задать вопрос

# Шаг 5: Просмотр мониторинга
azd monitor --overview

# Шаг 6: Очистка
azd down --force --purge
```

**Критерии успеха:**
- [ ] Агент отвечает на вопросы
- [ ] Доступ к панели мониторинга через `azd monitor`
- [ ] Ресурсы успешно очищены

### Упражнение 2: Добавьте кастомный инструмент (30 минут)

**Цель:** Расширить агента кастомным инструментом

1. Разверните шаблон агента:  
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. Создайте новую функцию инструмента в коде агента:  
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Вызов API к сервису погоды
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Зарегистрируйте инструмент у агента:  
   ```python
   from azure.ai.projects.models import FunctionTool

   weather_tool = FunctionTool(
       name="get_weather",
       description="Get current weather for a location",
       parameters={
           "type": "object",
           "properties": {
               "location": {"type": "string", "description": "City name"}
           },
           "required": ["location"]
       }
   )

   agent = project_client.agents.create_agent(
       model="gpt-4.1",
       name="Weather Agent",
       tools=[weather_tool]
   )
   ```
4. Переразверните и протестируйте:  
   ```bash
   azd deploy
   # Спросить: «Какая погода в Сиэтле?»
   # Ожидается: Агент вызывает get_weather("Seattle") и возвращает информацию о погоде
   ```

**Критерии успеха:**
- [ ] Агент распознаёт запросы, связанные с погодой
- [ ] Инструмент вызывается корректно
- [ ] Ответ включает информацию о погоде

### Упражнение 3: Создайте агента RAG (45 минут)

**Цель:** Сделать агента, который отвечает на вопросы на основе ваших документов

```bash
# Шаг 1: Разверните шаблон RAG
azd init --template azure-search-openai-demo
azd up

# Шаг 2: Загрузите ваши документы
# Поместите PDF/TXT файлы в папку data/, затем выполните:
python scripts/prepdocs.py

# Шаг 3: Проверьте с вопросами по конкретной области
# Откройте URL веб-приложения из вывода azd up
# Задавайте вопросы о загруженных документах
# Ответы должны содержать ссылки на источники, например [doc.pdf]
```

**Критерии успеха:**
- [ ] Агент отвечает на основе загруженных документов
- [ ] Ответы содержат ссылки на источники
- [ ] Нет галлюцинаций по вопросам вне области знаний

---

## 📚 Следующие шаги

Теперь, когда вы понимаете агентов ИИ, изучите эти продвинутые темы:

| Тема | Описание | Ссылка |
|-------|----------|--------|
| **Мультиагентные системы** | Создавайте системы с несколькими сотрудничающими агентами | [Пример мультиагентов для ритейла](../../examples/retail-scenario.md) |
| **Паттерны координации** | Изучите паттерны оркестрации и коммуникации | [Паттерны координации](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Продакшн-развёртывание** | Развёртывание агентов для предприятия | [Практики ИИ в продакшне](../chapter-08-production/production-ai-practices.md) |
| **Оценка агента** | Тестирование и оценка производительности агентов | [Отладка ИИ](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **Лаборатория AI Workshop** | Практика: подготовьте ваше ИИ-решение к AZD | [Лаборатория AI Workshop](ai-workshop-lab.md) |

---

## 📖 Дополнительные ресурсы

### Официальная документация
- [Служба Microsoft Foundry Agent](https://learn.microsoft.com/azure/ai-services/agents/)
- [Быстрый старт Microsoft Foundry Agent Service](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Фреймворк Semantic Kernel Agent](https://learn.microsoft.com/semantic-kernel/)

### Шаблоны AZD для агентов
- [Начало работы с агентами ИИ](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Демонстрация Azure Search OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)

### Сообщество и ресурсы
- [Awesome AZD - Шаблоны агентов](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### Навыки агента для вашего редактора
- [**Навыки агента Microsoft Azure**](https://skills.sh/microsoft/github-copilot-for-azure) — Устанавливайте переиспользуемые навыки агентов ИИ для разработки Azure в GitHub Copilot, Cursor или любом поддерживаемом агенте. Включает навыки для [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [развёртывания](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy) и [диагностики](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics):  
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Навигация**
- **Предыдущий урок**: [Интеграция Microsoft Foundry](microsoft-foundry-integration.md)
- **Следующий урок**: [Развёртывание модели ИИ](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->