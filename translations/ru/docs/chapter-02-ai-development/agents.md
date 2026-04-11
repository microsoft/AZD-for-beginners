# AI агенты с Azure Developer CLI

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 2 - Разработка с приоритетом ИИ
- **⬅️ Предыдущая**: [Интеграция с Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Следующая**: [Развёртывание модели ИИ](ai-model-deployment.md)
- **🚀 Продвинутая**: [Решения с несколькими агентами](../../examples/retail-scenario.md)

---

## Введение

ИИ агенты — автономные программы, которые могут воспринимать своё окружение, принимать решения и предпринимать действия для достижения конкретных целей. В отличие от простых чат-ботов, отвечающих на запросы, агенты могут:

- **Использовать инструменты** — вызывать API, искать в базах данных, выполнять код
- **Планировать и рассуждать** — разбивать сложные задачи на шаги
- **Учиться на контексте** — сохранять память и адаптировать поведение
- **Сотрудничать** — работать с другими агентами (многоагентные системы)

В этом руководстве показано, как развернуть ИИ агентов в Azure с помощью Azure Developer CLI (azd).

> **Примечание по валидации (2026-03-25):** Руководство проверено с `azd` версии `1.23.12` и `azure.ai.agents` версии `0.1.18-preview`. Опыт использования `azd ai` всё ещё находится в предварительном просмотре, поэтому проверьте справку по расширению, если у вас другие версии.

## Цели обучения

Пройдя это руководство, вы:
- Поймёте, что такое ИИ агенты и чем они отличаются от чат-ботов
- Научитесь развёртывать готовые шаблоны ИИ агентов с помощью AZD
- Настроите Foundry Agents для создания кастомных агентов
- Реализуете базовые шаблоны агентов (использование инструментов, RAG, многоагентность)
- Научитесь мониторить и отлаживать развернутых агентов

## Ожидаемые результаты

После завершения вы сможете:
- Развёртывать приложения ИИ агентов в Azure одной командой
- Настраивать инструменты и возможности агента
- Реализовывать генерацию с расширенным поиском (RAG) с агентами
- Проектировать архитектуры многоагентных систем для сложных рабочих процессов
- Устранять распространённые проблемы при развертывании агентов

---

## 🤖 Чем агент отличается от чат-бота?

| Особенность | Чат-бот | ИИ Агент |
|-------------|---------|----------|
| **Поведение** | Отвечает на запросы | Совершает автономные действия |
| **Инструменты** | Нет | Может вызывать API, искать, выполнять код |
| **Память** | Только в рамках сессии | Постоянная память между сессиями |
| **Планирование** | Один ответ | Многоступенчатое рассуждение |
| **Сотрудничество** | Одно лицо | Может работать с другими агентами |

### Простая аналогия

- **Чат-бот** = Помощник, отвечающий на вопросы у информационной стойки
- **ИИ Агент** = Персональный ассистент, который может звонить, бронировать встречи и выполнять задачи за вас

---

## 🚀 Быстрый старт: Разверните своего первого агента

### Вариант 1: Шаблон Foundry Agents (рекомендуется)

```bash
# Инициализация шаблона агентов ИИ
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

**Время:** около 15-20 минут
**Стоимость:** примерно $100-150/месяц (разработка)

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
- ✅ Конфигурационные файлы Prompty
- ✅ Пример реализации агента

**Время:** около 10-15 минут
**Стоимость:** примерно $50-100/месяц (разработка)

### Вариант 3: RAG чат-агент

```bash
# Инициализация шаблона RAG чата
azd init --template azure-search-openai-demo

# Развернуть в Azure
azd up
```

**Что разворачивается:**
- ✅ Модели Microsoft Foundry
- ✅ Azure AI Search с примерными данными
- ✅ Конвейер обработки документов
- ✅ Чат-интерфейс с ссылками на источники

**Время:** около 15-25 минут
**Стоимость:** примерно $80-150/месяц (разработка)

### Вариант 4: Инициализация AZD AI агента (основа на манифесте или шаблоне, превью)

Если у вас есть файл манифеста агента, вы можете использовать команду `azd ai`, чтобы создать проект Foundry Agent Service напрямую. В последних превью добавлена поддержка инициализации на базе шаблонов, поэтому точный сценарий подсказок может немного отличаться в зависимости от версии установленного расширения.

```bash
# Установите расширение AI агентов
azd extension install azure.ai.agents

# Необязательно: проверьте установленную предварительную версию
azd extension show azure.ai.agents

# Инициализируйте из манифеста агента
azd ai agent init -m agent-manifest.yaml

# Разверните в Azure
azd up
```

**Когда использовать `azd ai agent init` вместо `azd init --template`:**

| Подход | Для кого лучше | Как работает |
|--------|----------------|--------------|
| `azd init --template` | От правящего приложения-шаблона | Клонирует полный репозиторий с кодом + инфраструктурой |
| `azd ai agent init -m` | От собственного манифеста агента | Создаёт структуру проекта из описания агента |

> **Совет:** Используйте `azd init --template` при обучении (варианты 1-3 выше). Используйте `azd ai agent init` для продакшн-агентов с собственными манифестами. См. [AZD AI CLI команды](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) для полного справочника.

---

## 🏗️ Шаблоны архитектуры агентов

### Шаблон 1: Один агент с инструментами

Самый простой шаблон — один агент, который может использовать несколько инструментов.

```mermaid
graph TD
    UI[Пользовательский интерфейс] --> Agent[AI Agent<br/>gpt-4.1]
    Agent --> Search[Поисковый инструмент]
    Agent --> Database[Инструмент базы данных]
    Agent --> API[Инструмент API]
```
**Лучше всего подходит для:**
- Ботов поддержки клиентов
- Помощников по исследованиям
- Агентов анализа данных

**Шаблон AZD:** `azure-search-openai-demo`

### Шаблон 2: RAG агент (генерация с дополнением извлечением)

Агент, который сначала находит релевантные документы, а затем генерирует ответ.

```mermaid
graph TD
    Query[Запрос пользователя] --> RAG[RAG Агент]
    RAG --> Vector[Векторный поиск]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- Документы --> LLM
    LLM --> Response[Ответ с цитатами]
```
**Лучше всего подходит для:**
- Корпоративных баз знаний
- Систем вопросов и ответов по документам
- Исследований в области комплаенса и права

**Шаблон AZD:** `azure-search-openai-demo`

### Шаблон 3: Многоагентная система

Несколько специализированных агентов, работающих вместе над сложными задачами.

```mermaid
graph TD
    Orchestrator[Агент Оркестратор] --> Research[Агент Исследователь<br/>gpt-4.1]
    Orchestrator --> Writer[Агент Писатель<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[Агент Рецензент<br/>gpt-4.1]
```
**Лучше всего подходит для:**
- Сложного создания контента
- Многоступенчатых рабочих процессов
- Задач, требующих разной экспертизы

**Подробнее:** [Шаблоны координации многоагентных систем](../chapter-06-pre-deployment/coordination-patterns.md)

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

### Настройка окружения

```bash
# Установить специфичные для агента переменные окружения
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

### Основные метрики для отслеживания

| Метрика | Описание | Цель |
|---------|----------|------|
| Задержка ответа | Время генерации ответа | < 5 секунд |
| Использование токенов | Токенов на запрос | Следить за затратами |
| Успешность вызова инструментов | % успешных выполнений | > 95% |
| Уровень ошибок | Неудачные запросы агента | < 1% |
| Удовлетворённость пользователей | Оценки обратной связи | > 4.0 из 5.0 |

### Пользовательское логирование для агентов

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# Настройка Azure Monitor с OpenTelemetry
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

## 💰 Вопросы стоимости

### Примерные ежемесячные расходы по шаблонам

| Шаблон | Среда разработки | Продакшн |
|---------|-----------------|-----------|
| Один агент | $50-100 | $200-500 |
| RAG агент | $80-150 | $300-800 |
| Многоагентный (2-3 агента) | $150-300 | $500-1,500 |
| Корпоративный многоагент | $300-500 | $1,500-5,000+ |

### Советы по оптимизации затрат

1. **Используйте gpt-4.1-mini для простых задач**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. **Реализуйте кэширование для повторяющихся запросов**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Устанавливайте лимиты на количество токенов за запуск**
   ```python
   # Установите max_completion_tokens при запуске агента, а не во время создания
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # Ограничить длину ответа
   )
   ```

4. **Масштабируйтесь до нуля при отсутствии активности**
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

# Проверьте логи агента
azd monitor --logs
```

**Распространённые причины:**
- Несовпадение сигнатуры функции инструмента
- Отсутствие нужных разрешений
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
- Используйте стриминг ответов
- Реализуйте кэширование ответов
- Уменьшите размер окна контекста
</details>

<details>
<summary><strong>❌ Агент возвращает неверную или искажённую информацию</strong></summary>

```python
# Улучшить с помощью более подходящих системных подсказок
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
# Реализовать управление окном контекста
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

**Цель:** Развернуть первого ИИ агента с помощью AZD

```bash
# Шаг 1: Инициализировать шаблон
azd init --template get-started-with-ai-agents

# Шаг 2: Войти в Azure
azd auth login
# Если вы работаете с несколькими арендаторами, добавьте --tenant-id <tenant-id>

# Шаг 3: Развернуть
azd up

# Шаг 4: Протестировать агент
# Ожидаемый результат после развертывания:
#   Развертывание завершено!
#   Конечная точка: https://<app-name>.<region>.azurecontainerapps.io
# Откройте URL, указанный в выводе, и попробуйте задать вопрос

# Шаг 5: Просмотреть мониторинг
azd monitor --overview

# Шаг 6: Очистить данные
azd down --force --purge
```

**Критерии успешности:**
- [ ] Агент отвечает на вопросы
- [ ] Можно получить доступ к панели мониторинга через `azd monitor`
- [ ] Ресурсы успешно очищены

### Упражнение 2: Добавьте пользовательский инструмент (30 минут)

**Цель:** Расширить агента собственным инструментом

1. Разверните шаблон агента:
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. Создайте новую функцию инструмента в коде агента:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Вызов API к погодному сервису
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Зарегистрируйте инструмент в агенте:
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
4. Перезапустите и протестируйте:
   ```bash
   azd deploy
   # Спросите: "Какая погода в Сиэтле?"
   # Ожидается: Агент вызывает get_weather("Seattle") и возвращает информацию о погоде
   ```

**Критерии успешности:**
- [ ] Агент распознаёт запросы о погоде
- [ ] Инструмент вызывается корректно
- [ ] Ответ содержит информацию о погоде

### Упражнение 3: Постройте RAG агента (45 минут)

**Цель:** Создать агента, который отвечает на вопросы по вашим документам

```bash
# Шаг 1: Разверните шаблон RAG
azd init --template azure-search-openai-demo
azd up

# Шаг 2: Загрузите ваши документы
# Поместите PDF/TXT файлы в каталог data/, затем запустите:
python scripts/prepdocs.py

# Шаг 3: Протестируйте с вопросами по конкретной теме
# Откройте URL веб-приложения из вывода azd up
# Задавайте вопросы о ваших загруженных документах
# Ответы должны включать ссылки на цитаты, например [doc.pdf]
```

**Критерии успешности:**
- [ ] Агент отвечает, используя загруженные документы
- [ ] Ответы содержат ссылки на источники
- [ ] Нет искажений по вопросам вне области знаний

---

## 📚 Следующие шаги

Теперь, когда вы понимаете ИИ агентов, изучите эти продвинутые темы:

| Тема | Описание | Ссылка |
|------|----------|---------|
| **Многоагентные системы** | Создавайте системы с несколькими взаимодействующими агентами | [Пример многоагентной розницы](../../examples/retail-scenario.md) |
| **Шаблоны координации** | Изучите паттерны оркестрации и коммуникации | [Координационные паттерны](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Продакшн-развёртывание** | Развёртывание агентов, готовых к корпоративному использованию | [Практики продакшн ИИ](../chapter-08-production/production-ai-practices.md) |
| **Оценка агентов** | Тестирование и оценка работы агентов | [Отладка ИИ](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **Лабораторная работа по ИИ** | Практика: подготовка решения ИИ к AZD | [Лабораторная работа по ИИ](ai-workshop-lab.md) |

---

## 📖 Дополнительные ресурсы

### Официальная документация
- [Сервис Azure AI Agent](https://learn.microsoft.com/azure/ai-services/agents/)
- [Быстрый старт Azure AI Foundry Agent Service](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Фреймворк Semantic Kernel Agent](https://learn.microsoft.com/semantic-kernel/)

### Шаблоны AZD для агентов
- [Начало работы с ИИ агентами](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Демонстрация Azure Search OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)

### Ресурсы сообщества
- [Awesome AZD — шаблоны агентов](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### Навыки агентов для вашего редактора
- [**Навыки Microsoft Azure Agent**](https://skills.sh/microsoft/github-copilot-for-azure) — устанавливайте переиспользуемые навыки ИИ агентов для разработки Azure в GitHub Copilot, Cursor или других поддерживаемых агентах. Содержит навыки для [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [развёртывания](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy) и [диагностики](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics):
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
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на исходном языке следует считать авторитетным источником. Для важной информации рекомендуется обращаться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->