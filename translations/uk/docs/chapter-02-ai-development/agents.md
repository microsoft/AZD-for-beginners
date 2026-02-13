# Агенти ШІ з Azure Developer CLI

**Навігація по розділу:**
- **📚 Головна курсу**: [AZD Для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка, орієнтована на ШІ
- **⬅️ Попередній**: [Розгортання моделей ШІ](ai-model-deployment.md)
- **➡️ Наступний**: [Практики ШІ для виробництва](production-ai-practices.md)
- **🚀 Просунутий**: [Багатоагентні рішення](../../examples/retail-scenario.md)

---

## Вступ

Агенти ШІ — це автономні програми, які можуть сприймати своє середовище, приймати рішення та виконувати дії для досягнення певних цілей. На відміну від простих чатботів, які відповідають на підказки, агенти можуть:

- **Використовувати інструменти** - Викликати API, шукати в базах даних, виконувати код
- **Планувати та міркувати** - Розбивати складні завдання на кроки
- **Вчитися з контексту** - Підтримувати пам’ять і адаптувати поведінку
- **Співпрацювати** - Працювати з іншими агентами (багатоагентні системи)

Цей посібник показує, як розгорнути агентів ШІ в Azure за допомогою Azure Developer CLI (azd).

## Навчальні цілі

Виконавши цей посібник, ви:
- Зрозумієте, що таке агенти ШІ і чим вони відрізняються від чатботів
- Розгорнете готові шаблони агентів за допомогою AZD
- Налаштуєте Foundry Agents для кастомних агентів
- Реалізуєте базові патерни агента (використання інструментів, RAG, багатоагентність)
- Моніторитимете та налагоджуватимете розгорнуті агенти

## Результати навчання

Після завершення ви зможете:
- Розгорнути додатки агентів ШІ в Azure однією командою
- Налаштувати інструменти та можливості агента
- Реалізувати retrieval-augmented generation (RAG) з агентами
- Проєктувати багатоагентні архітектури для складних робочих процесів
- Усувати поширені проблеми з розгортанням агентів

---

## 🤖 Чим агент відрізняється від чатбота?

| Feature | Chatbot | AI Agent |
|---------|---------|----------|
| **Поведінка** | Відповідає на підказки | Виконує автономні дії |
| **Інструменти** | Немає | Може викликати API, шукати, виконувати код |
| **Пам'ять** | Лише сесійна | Постійна пам’ять між сесіями |
| **Планування** | Одна відповідь | Багатокрокове міркування |
| **Співпраця** | Один об’єкт | Може працювати з іншими агентами |

### Проста аналогія

- **Чатбот** = Допоміжна людина, яка відповідає на питання на інформаційній стійці
- **Агент ШІ** = Персональний асистент, який може телефонувати, записувати зустрічі та виконувати завдання за вас

---

## 🚀 Швидкий старт: Розгорніть свого першого агента

### Варіант 1: Шаблон Foundry Agents (Рекомендовано)

```bash
# Ініціалізувати шаблон агентів ШІ
azd init --template get-started-with-ai-agents

# Розгорнути в Azure
azd up
```

**Що розгортається:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (для RAG)
- ✅ Azure Container Apps (веб-інтерфейс)
- ✅ Application Insights (моніторинг)

**Час:** ~15-20 хвилин
**Вартість:** ~$100-150/місяць (розробка)

### Варіант 2: OpenAI Agent з Prompty

```bash
# Ініціалізувати шаблон агента на основі Prompty
azd init --template agent-openai-python-prompty

# Розгорнути в Azure
azd up
```

**Що розгортається:**
- ✅ Azure Functions (безсерверне виконання агента)
- ✅ Azure OpenAI
- ✅ Конфігураційні файли Prompty
- ✅ Зразкова реалізація агента

**Час:** ~10-15 хвилин
**Вартість:** ~$50-100/місяць (розробка)

### Варіант 3: RAG чат-агент

```bash
# Ініціалізувати шаблон чату RAG
azd init --template azure-search-openai-demo

# Розгорнути в Azure
azd up
```

**Що розгортається:**
- ✅ Azure OpenAI
- ✅ Azure AI Search з зразковими даними
- ✅ Канал обробки документів
- ✅ Чат-інтерфейс із цитуваннями

**Час:** ~15-25 хвилин
**Вартість:** ~$80-150/місяць (розробка)

---

## 🏗️ Шаблони архітектури агентів

### Схема 1: Одиночний агент з інструментами

Найпростіший патерн агента — один агент, який може використовувати кілька інструментів.

```
┌─────────────────────────────────────┐
│           User Interface            │
└─────────────────┬───────────────────┘
                  │
          ┌───────▼───────┐
          │  AI Agent     │
          │  (GPT-4o)     │
          └───────┬───────┘
                  │
    ┌─────────────┼─────────────┐
    │             │             │
┌───▼───┐   ┌────▼────┐   ┌───▼───┐
│Search │   │Database │   │ API   │
│ Tool  │   │  Tool   │   │ Tool  │
└───────┘   └─────────┘   └───────┘
```

**Найкраще для:**
- Чатботи підтримки клієнтів
- Асистенти для досліджень
- Агенти аналізу даних

**AZD Шаблон:** `azure-search-openai-demo`

### Схема 2: RAG агент (Retrieval-Augmented Generation)

Агент, який витягує релевантні документи перед генерацією відповідей.

```
┌──────────────────────────────────────────────┐
│                User Query                     │
└─────────────────────┬────────────────────────┘
                      │
              ┌───────▼───────┐
              │  RAG Agent    │
              └───────┬───────┘
                      │
         ┌────────────┴────────────┐
         │                         │
    ┌────▼────┐              ┌────▼────┐
    │ Vector  │              │  LLM    │
    │ Search  │──Documents──►│ (GPT-4) │
    └─────────┘              └────┬────┘
                                  │
                          ┌───────▼───────┐
                          │ Response with │
                          │  Citations    │
                          └───────────────┘
```

**Найкраще для:**
- Корпоративних баз знань
- Систем запитань-відповідей по документах
- Досліджень з дотримання норм і правових питань

**AZD Шаблон:** `azure-search-openai-demo`

### Схема 3: Багатоагентна система

Кілька спеціалізованих агентів, що працюють разом над складними завданнями.

```
                ┌─────────────────┐
                │  Orchestrator   │
                │    Agent        │
                └────────┬────────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
┌───────▼───────┐ ┌─────▼──────┐ ┌───────▼───────┐
│   Research    │ │   Writer   │ │   Reviewer    │
│    Agent      │ │   Agent    │ │    Agent      │
│  (GPT-4o)     │ │(GPT-4o-mini│ │   (GPT-4o)    │
└───────────────┘ └────────────┘ └───────────────┘
```

**Найкраще для:**
- Генерації складного контенту
- Багатокрокових робочих процесів
- Завдань, що вимагають різної експертизи

**Детальніше:** [Патерни координації для багатоагентних систем](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Налаштування інструментів агента

Агенти стають потужними, коли можуть використовувати інструменти. Ось як налаштувати поширені інструменти:

### Налаштування інструментів у Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Визначити власні інструменти
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

# Створити агента з інструментами
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Налаштування середовища

```bash
# Налаштуйте змінні середовища, специфічні для агента
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Розгорніть з оновленою конфігурацією
azd deploy
```

---

## 📊 Моніторинг агентів

### Інтеграція з Application Insights

Всі шаблони агентів AZD включають Application Insights для моніторингу:

```bash
# Відкрити панель моніторингу
azd monitor --overview

# Переглянути журнали в реальному часі
azd monitor --logs

# Переглянути метрики в реальному часі
azd monitor --live
```

### Ключові показники для відстеження

| Metric | Description | Target |
|--------|-------------|--------|
| Response Latency | Час на генерацію відповіді | < 5 секунд |
| Token Usage | Токени на запит | Слідкувати за витратами |
| Tool Call Success Rate | % успішних викликів інструментів | > 95% |
| Error Rate | Невдалі запити агента | < 1% |
| User Satisfaction | Оцінки зворотного зв’язку | > 4.0/5.0 |

### Користувацьке логування для агентів

```python
import logging
from opencensus.ext.azure.log_exporter import AzureLogHandler

logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
))

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    logger.info("agent_interaction", extra={
        "custom_dimensions": {
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        }
    })
```

---

## 💰 Питання щодо вартості

### Орієнтовні щомісячні витрати за шаблоном

| Pattern | Dev Environment | Production |
|---------|-----------------|------------|
| Single Agent | $50-100 | $200-500 |
| RAG Agent | $80-150 | $300-800 |
| Multi-Agent (2-3 agents) | $150-300 | $500-1,500 |
| Enterprise Multi-Agent | $300-500 | $1,500-5,000+ |

### Поради щодо оптимізації витрат

1. **Використовуйте GPT-4o-mini для простих завдань**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Реалізуйте кешування для повторних запитів**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Встановлюйте ліміти на токени**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Обмежити довжину відповіді
   )
   ```

4. **Масштабуйте до нуля, коли не використовується**
   ```bash
   # Контейнерні додатки автоматично масштабуються до нуля
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Усунення неполадок агентів

### Поширені проблеми та рішення

<details>
<summary><strong>❌ Агент не відповідає на виклики інструментів</strong></summary>

```bash
# Перевірте, чи інструменти належним чином зареєстровані
azd show

# Перевірте розгортання OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Перевірте журнали агента
azd monitor --logs
```

**Поширені причини:**
- Несумісність сигнатури функції інструмента
- Відсутні необхідні дозволи
- Точку доступу API недоступна
</details>

<details>
<summary><strong>❌ Висока затримка у відповідях агента</strong></summary>

```bash
# Перевірте Application Insights на наявність вузьких місць
azd monitor --live

# Розгляньте можливість використання швидшої моделі
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Поради з оптимізації:**
- Використовуйте потокові відповіді
- Реалізуйте кешування відповідей
- Зменшіть розмір вікна контексту
</details>

<details>
<summary><strong>❌ Агент повертає некоректну або вигадану інформацію</strong></summary>

```python
# Покращити за допомогою кращих системних підказок
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Додати механізм пошуку для підкріплення
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Базувати відповіді на документах
)
```
</details>

<details>
<summary><strong>❌ Помилки перевищення ліміту токенів</strong></summary>

```python
# Реалізувати керування контекстним вікном
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Приблизна оцінка
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Практичні завдання

### Завдання 1: Розгорніть базового агента (20 хвилин)

**Мета:** Розгорнути вашого першого агента ШІ за допомогою AZD

```bash
# Крок 1: Ініціалізуйте шаблон
azd init --template get-started-with-ai-agents

# Крок 2: Увійдіть у Azure
azd auth login

# Крок 3: Розгорніть
azd up

# Крок 4: Перевірте агента
# Відкрийте URL, показаний у виводі

# Крок 5: Очистіть
azd down --force --purge
```

**Критерії успіху:**
- [ ] Агент відповідає на запитання
- [ ] Можливість доступу до панелі моніторингу
- [ ] Ресурси успішно очищені

### Завдання 2: Додайте власний інструмент (30 хвилин)

**Мета:** Розширити агента власним інструментом

1. Розгорніть шаблон агента
2. Створіть нову функцію інструмента:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Запит API до сервісу погоди
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Зареєструйте інструмент у агента
4. Перевірте, що агент використовує новий інструмент

**Критерії успіху:**
- [ ] Агент розпізнає запити, пов’язані з погодою
- [ ] Інструмент викликається коректно
- [ ] У відповіді присутня інформація про погоду

### Завдання 3: Побудуйте RAG агента (45 хвилин)

**Мета:** Створити агента, який відповідає на питання на основі ваших документів

```bash
# Розгорнути шаблон RAG
azd init --template azure-search-openai-demo
azd up

# Завантажте свої документи
# (Дотримуйтеся інструкції шаблону щодо завантаження даних)

# Перевірте за допомогою запитань, специфічних для домену
```

**Критерії успіху:**
- [ ] Агент відповідає на основі завантажених документів
- [ ] Відповіді містять цитування
- [ ] Відсутні вигадки на запитання за межами області застосування

---

## 📚 Наступні кроки

Тепер, коли ви зрозуміли агентів ШІ, вивчіть ці просунуті теми:

| Topic | Description | Link |
|-------|-------------|------|
| **Багатоагентні системи** | Побудуйте системи з кількома співпрацюючими агентами | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Патерни координації** | Вивчіть патерни оркестрації та комунікації | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Виробниче розгортання** | Розгортання агентів, готових для підприємств | [Production AI Practices](production-ai-practices.md) |
| **Оцінка агентів** | Тестування та оцінка продуктивності агентів | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Додаткові ресурси

### Офіційна документація
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### Шаблони AZD для агентів
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Ресурси спільноти
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Навігація**
- **Попередній урок**: [Розгортання моделей ШІ](ai-model-deployment.md)
- **Наступний урок**: [Практики ШІ для виробництва](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу перекладу на основі ШІ [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ мовою оригіналу слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується скористатися послугами професійного перекладача. Ми не несемо відповідальності за будь-які непорозуміння або хибні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->