# AI агенти с Azure Developer CLI

**Навигация в главите:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 2 - Разработка, ориентирана към AI
- **⬅️ Предишна**: [Разгръщане на AI модел](ai-model-deployment.md)
- **➡️ Следваща**: [Практики за AI в продукция](production-ai-practices.md)
- **🚀 Разширено**: [Многоагентни решения](../../examples/retail-scenario.md)

---

## Въведение

AI агентите са автономни програми, които могат да възприемат средата си, да вземат решения и да предприемат действия за постигане на конкретни цели. За разлика от простите чатботове, които отговарят на подканвания, агентите могат да:

- **Използват инструменти** - Извикват API-та, търсят в бази данни, изпълняват код
- **Планират и разсъждават** - Разбиват сложни задачи на стъпки
- **Учят от контекста** - Поддържат памет и адаптират поведението си
- **Сътрудничат** - Работят с други агенти (многоагентни системи)

Това ръководство показва как да разгръщате AI агенти в Azure, използвайки Azure Developer CLI (azd).

## Цели за учене

Като завършите това ръководство, вие ще:
- Разберете какво представляват AI агентите и как се различават от чатботовете
- Разгърнете предварително изградени шаблони за AI агенти с помощта на AZD
- Конфигурирате Foundry Agents за персонализирани агенти
- Реализирате основни модели за агенти (използване на инструменти, RAG, многоагентни)
- Наблюдавате и дебъгвате разгръщаните агенти

## Очаквани резултати

След завършване ще можете да:
- Разгръщате приложения с AI агенти в Azure с една команда
- Конфигурирате инструментите и възможностите на агента
- Реализирате retrieval-augmented generation (RAG) с агенти
- Проектирате многоагентни архитектури за сложни работни потоци
- Отстранявате често срещани проблеми при разгръщане на агенти

---

## 🤖 Какво прави агента различен от чатбота?

| Характеристика | Чатбот | AI агент |
|---------------:|--------|----------|
| **Поведение** | Отговаря на подканвания | Извършва автономни действия |
| **Инструменти** | Няма | Може да извиква API-та, да търси, да изпълнява код |
| **Памет** | Само базирана на сесията | Постоянна памет между сесиите |
| **Планиране** | Единствен отговор | Многостъпково разсъждение |
| **Сътрудничество** | Единна единица | Може да работи с други агенти |

### Проста аналогия

- **Чатбот** = Помощен човек, който отговаря на въпроси на информационно гише
- **AI агент** = Личен асистент, който може да прави обаждания, да запазва срещи и да изпълнява задачи вместо вас

---

## 🚀 Бърз старт: Деплойте първия си агент

### Опция 1: Шаблон Foundry Agents (Препоръчително)

```bash
# Инициализиране на шаблона за AI агенти
azd init --template get-started-with-ai-agents

# Разгръщане в Azure
azd up
```

**Какво се деплойва:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (за RAG)
- ✅ Azure Container Apps (уеб интерфейс)
- ✅ Application Insights (наблюдение)

**Време:** ~15-20 минути
**Цена:** ~$100-150/месец (разработка)

### Опция 2: OpenAI агент с Prompty

```bash
# Инициализирайте шаблона за агент, базиран на Prompty
azd init --template agent-openai-python-prompty

# Разположете в Azure
azd up
```

**Какво се деплойва:**
- ✅ Azure Functions (безсървисно изпълнение на агента)
- ✅ Azure OpenAI
- ✅ Конфигурационни файлове Prompty
- ✅ Примерна имплементация на агент

**Време:** ~10-15 минути
**Цена:** ~$50-100/месец (разработка)

### Опция 3: RAG чат агент

```bash
# Инициализирай шаблон за RAG чат
azd init --template azure-search-openai-demo

# Разположи в Azure
azd up
```

**Какво се деплойва:**
- ✅ Azure OpenAI
- ✅ Azure AI Search с примерни данни
- ✅ Пайплайн за обработка на документи
- ✅ Чат интерфейс с цитирания

**Време:** ~15-25 минути
**Цена:** ~$80-150/месец (разработка)

---

## 🏗️ Архитектурни модели за агенти

### Модел 1: Един агент с инструменти

Най-простият модел - един агент, който може да използва множество инструменти.

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

**Подходящ за:**
- Клиентски чатботове за поддръжка
- Исследователски асистенти
- Агенти за анализ на данни

**AZD шаблон:** `azure-search-openai-demo`

### Модел 2: RAG агент (Retrieval-Augmented Generation)

Агент, който извлича релевантни документи преди да генерира отговори.

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

**Подходящ за:**
- Корпоративни бази от знания
- Системи за въпроси и отговори върху документи
- Съответствие и юридически изследвания

**AZD шаблон:** `azure-search-openai-demo`

### Модел 3: Многоагентна система

Няколко специализирани агента работят заедно по сложни задачи.

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

**Подходящ за:**
- Сложно генериране на съдържание
- Многостъпкови работни потоци
- Задачи, изискващи различна експертиза

**Научете повече:** [Координационни модели за многоагентни системи](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Настройване на инструментите на агента

Агентите стават мощни, когато могат да използват инструменти. Ето как да конфигурирате често срещани инструменти:

### Конфигурация на инструменти във Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Дефинирайте персонализирани инструменти
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

# Създайте агент с инструменти
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Конфигурация на средата

```bash
# Настройте променливи на средата, специфични за агента
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Разположете с актуализирана конфигурация
azd deploy
```

---

## 📊 Наблюдение на агентите

### Интеграция с Application Insights

Всички AZD шаблони за агенти включват Application Insights за наблюдение:

```bash
# Отвори таблото за наблюдение
azd monitor --overview

# Виж логовете в реално време
azd monitor --logs

# Виж показателите в реално време
azd monitor --live
```

### Ключови метрики за проследяване

| Метрика | Описание | Цел |
|--------|-------------|--------|
| Закъснение при отговор | Време за генериране на отговор | < 5 секунди |
| Използване на токени | Токени на заявка | Наблюдавайте за разходи |
| Процент успешни извиквания на инструментите | % успешни изпълнения на инструменти | > 95% |
| Процент грешки | Неуспешни заявки към агента | < 1% |
| Удовлетвореност на потребителите | Оценки от обратна връзка | > 4.0/5.0 |

### Персонализирано логване за агенти

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

## 💰 Съображения за разходите

### Прогнозни месечни разходи по модел

| Модел | Среда за разработка | Продукция |
|---------|-----------------|------------|
| Един агент | $50-100 | $200-500 |
| RAG агент | $80-150 | $300-800 |
| Многоагентен (2-3 агента) | $150-300 | $500-1,500 |
| Корпоративен многоагентен | $300-500 | $1,500-5,000+ |

### Съвети за оптимизиране на разходите

1. **Използвайте GPT-4o-mini за прости задачи**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Реализирайте кеширане за повторни заявки**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Задайте лимити за токените**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Ограничи дължината на отговора
   )
   ```

4. **Мащабирайте до нула, когато не се използва**
   ```bash
   # Container Apps автоматично се мащабират до нула
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Отстраняване на проблеми с агентите

### Чести проблеми и решения

<details>
<summary><strong>❌ Агентът не отговаря на извиквания към инструменти</strong></summary>

```bash
# Проверете дали инструментите са правилно регистрирани
azd show

# Проверете внедряването на OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Проверете логовете на агента
azd monitor --logs
```

**Чести причини:**
- Несъответствие на подписа на функцията на инструмента
- Липсващи изисквани разрешения
- API крайна точка недостъпна
</details>

<details>
<summary><strong>❌ Високо закъснение в отговорите на агента</strong></summary>

```bash
# Проверете Application Insights за тесни места
azd monitor --live

# Помислете за използване на по-бърз модел
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Съвети за оптимизация:**
- Използвайте стрийминг отговори
- Реализирайте кеширане на отговорите
- Намалете размера на контекстния прозорец
</details>

<details>
<summary><strong>❌ Агентът връща некоректна или халюцинирана информация</strong></summary>

```python
# Подобрете чрез по-добри системни подсказки
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Добавете извличане за обосноваване
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Осигурете обосноваване на отговорите чрез документи
)
```
</details>

<details>
<summary><strong>❌ Грешки за превишен лимит на токени</strong></summary>

```python
# Имплементирайте управление на контекстния прозорец
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Приблизителна оценка
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Практически упражнения

### Упражнение 1: Деплойте базов агент (20 минути)

**Цел:** Деплойте първия си AI агент, използвайки AZD

```bash
# Стъпка 1: Инициализирайте шаблона
azd init --template get-started-with-ai-agents

# Стъпка 2: Влезте в Azure
azd auth login

# Стъпка 3: Извършете разгръщане
azd up

# Стъпка 4: Тествайте агента
# Отворете URL адреса, показан в изхода

# Стъпка 5: Почистете
azd down --force --purge
```

**Критерии за успех:**
- [ ] Агентът отговаря на въпроси
- [ ] Може да получи достъп до таблото за наблюдение
- [ ] Ресурсите са почистени успешно

### Упражнение 2: Добавете персонализиран инструмент (30 минути)

**Цел:** Разширете агента с персонализиран инструмент

1. Деплойте шаблона на агента
2. Създайте нова функция на инструмент:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Извикване на API към метеорологична услуга
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Регистрирайте инструмента с агента
4. Тествайте дали агентът използва новия инструмент

**Критерии за успех:**
- [ ] Агентът разпознава запитвания, свързани с времето
- [ ] Инструментът се извиква правилно
- [ ] Отговорът включва информация за времето

### Упражнение 3: Създайте RAG агент (45 минути)

**Цел:** Създайте агент, който отговаря на въпроси от вашите документи

```bash
# Разгръщане на RAG шаблон
azd init --template azure-search-openai-demo
azd up

# Качете вашите документи
# (Следвайте ръководството за внасяне на данни за шаблона)

# Тествайте с въпроси, специфични за домейна
```

**Критерии за успех:**
- [ ] Агентът отговаря въз основа на качените документи
- [ ] Отговорите включват цитати
- [ ] Няма халюцинации при въпроси извън обхвата

---

## 📚 Следващи стъпки

Сега когато разбирате AI агентите, разгледайте тези напреднали теми:

| Тема | Описание | Връзка |
|-------|-------------|------|
| **Многоагентни системи** | Изградете системи с няколко сътрудничещи агента | [Пример за многоагентна система в търговията на дребно](../../examples/retail-scenario.md) |
| **Координационни модели** | Научете оркестрация и модели за комуникация | [Координационни модели](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Деплоймент в продукция** | Деплоймент на агенти готови за предприятието | [Практики за AI в продукция](production-ai-practices.md) |
| **Оценка на агенти** | Тествайте и оценете представянето на агента | [AI Отстраняване на проблеми](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Допълнителни ресурси

### Официална документация
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD шаблони за агенти
- [Започнете с AI агенти](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Ресурси от общността
- [Awesome AZD - Шаблони за агенти](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Навигация**
- **Предишен урок**: [Разгръщане на AI модел](ai-model-deployment.md)
- **Следващ урок**: [Практики за AI в продукция](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Отказ от отговорност:
Този документ е преведен с помощта на автоматизирана услуга за превод с изкуствен интелект [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, имайте предвид, че автоматичните преводи могат да съдържат грешки или неточности. Оригиналният документ на оригиналния език трябва да се счита за авторитетен източник. За критична информация препоръчваме професионален превод, извършен от човек. Не носим отговорност за каквито и да е неразбирателства или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->