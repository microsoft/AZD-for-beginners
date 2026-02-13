# AI агенти са Azure Developer CLI

**Навигација поглавља:**
- **📚 Course Home**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - Развој усмерен на AI
- **⬅️ Претходно**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Следеће**: [Production AI Practices](production-ai-practices.md)
- **🚀 Напредно**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## Увод

AI агенти су аутономни програми који могу да перципирају своје окружење, доносе одлуке и предузимају радње да би постигли одређене циљеве. За разлику од једноставних четботова који одговарају на упите, агенти могу:

- **Користити алатке** - Позивати API-је, претраживати базе података, извршавати код
- **Планирати и размишљати** - Разбити сложене задатке на кораке
- **Учити из контекста** - Одржавати меморију и прилагодити понашање
- **Сарадњивати** - Радити са другим агентима (системи са више агената)

Овaј водич показује како да разместите AI агенте на Azure користећи Azure Developer CLI (azd).

## Циљеви учења

Након завршетка овог водича, ви ћете:
- Разумети шта су AI агенти и како се разликују од четботова
- Разместити унапред припремљене шаблоне AI агената користећи AZD
- Конфигурисати Foundry Agents за прилагођене агенте
- Имплементирати основне обрасце агената (коришћење алатки, RAG, мулти-агент)
- Праћење и отклањање грешака размештених агената

## Резултати учења

По завршетку, моћи ћете да:
- Разместите AI агент апликације на Azure једном наредбом
- Конфигуришете алатке и могућности агената
- Имплементирате retrieval-augmented generation (RAG) са агентима
- Дизајнирате мулти-агентне архитектуре за сложене токове посла
- Решавате уобичајене проблеме при размештању агената

---

## 🤖 Шта агента разликује од четбота?

| Особина | Чатбот | AI агент |
|---------|---------|----------|
| **Понашање** | Одговара на упите | Предузима аутономне акције |
| **Алатке** | Нема | Може да позива API-је, претражује, извршава код |
| **Меморија** | Само засновано на сесији | Перзистентна меморија између сесија |
| **Планирање** | Један одговор | Размишљање у више корака |
| **Сарадња** | Један ентитет | Може да ради са другим агентима |

### Једноставна аналогија

- **Чатбот** = Корисна особа која одговара на питања на информативном шалтеру
- **AI агент** = Лични асистент који може да обавља позиве, заказује састанке и завршава задатке у ваше име

---

## 🚀 Брзо покретање: Разместите свог првог агента

### Опција 1: Foundry Agents шаблон (Препоручено)

```bash
# Иницијализујте шаблон AI агената
azd init --template get-started-with-ai-agents

# Деплојирајте на Azure
azd up
```

**Шта се распоређује:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (за RAG)
- ✅ Azure Container Apps (веб интерфејс)
- ✅ Application Insights (надгледање)

**Време:** ~15-20 минута
**Трошак:** ~$100-150/месечно (развој)

### Опција 2: OpenAI агент са Prompty

```bash
# Иницијализујте шаблон агента заснованог на Prompty
azd init --template agent-openai-python-prompty

# Распоредите на Azure
azd up
```

**Шта се распоређује:**
- ✅ Azure Functions (serverless извршење агента)
- ✅ Azure OpenAI
- ✅ Prompty конфигурациони фајлови
- ✅ Узорна имплементација агента

**Време:** ~10-15 минута
**Трошак:** ~$50-100/месечно (развој)

### Опција 3: RAG чет агент

```bash
# Иницијализуј RAG шаблон за ћаскање
azd init --template azure-search-openai-demo

# Разместити на Azure
azd up
```

**Шта се распоређује:**
- ✅ Azure OpenAI
- ✅ Azure AI Search са пример подацима
- ✅ Пайплајн за обраду докумената
- ✅ Чет интерфејс са цитатима

**Време:** ~15-25 минута
**Трошак:** ~$80-150/месечно (развој)

---

## 🏗️ Обрасци архитектуре агента

### Образац 1: Један агент са алаткама

Најједноставнији образац агента - један агент који може да користи више алатки.

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

**Најбоље за:**
- Чатботове за корисничку подршку
- Помоћнике за истраживање
- Агенти за анализу података

**AZD шаблон:** `azure-search-openai-demo`

### Образац 2: RAG агент (Retrieval-Augmented Generation)

Агент који пре генерисања одговора преузима релевантне документе.

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

**Најбоље за:**
- Ентерпрајз базе знања
- Системе за питања и одговоре над документима
- Истраживања у складу и правне претраге

**AZD шаблон:** `azure-search-openai-demo`

### Образац 3: Систем више агената

Више специјализованих агената који заједно раде на сложеним задацима.

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

**Најбоље за:**
- Сложено генерисање садржаја
- Токове посла у више корака
- Задатке који захтевају различите експертизе

**Сазнајте више:** [Обрасци координације више агената](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Конфигурисање алатки агената

Агенти постају моћни када могу да користе алатке. Ево како да конфигуришете уобичајене алатке:

### Конфигурација алатки у Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Дефинишите прилагођене алате
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

# Креирајте агента са алаткама
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Конфигурација окружења

```bash
# Подесити променљиве окружења специфичне за агента
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Разместити са ажурираном конфигурацијом
azd deploy
```

---

## 📊 Праћење агената

### Интеграција Application Insights

Сви AZD шаблони агената укључују Application Insights за праћење:

```bash
# Отворите контролну таблу за праћење
azd monitor --overview

# Погледајте логове уживо
azd monitor --logs

# Погледајте метрике уживо
azd monitor --live
```

### Кључне метрике за праћење

| Метрика | Опис | Циљ |
|--------|-------------|--------|
| Латенција одговора | Време за генерисање одговора | < 5 секунди |
| Потрошња токена | Токени по захтеву | Пратите због трошкова |
| Проценат успешних позива алатки | % успешног извршавања алатки | > 95% |
| Стопа грешака | Неуспели захтеви агента | < 1% |
| Задовољство корисника | Оцена повратних информација | > 4.0/5.0 |

### Прилагођено логовање за агенте

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

## 💰 Разматрања трошкова

### Процењени месечни трошкови по обрасцу

| Образац | Развојно окружење | Продукција |
|---------|-----------------|------------|
| Један агент | $50-100 | $200-500 |
| RAG агент | $80-150 | $300-800 |
| Мулти-агент (2-3 агента) | $150-300 | $500-1,500 |
| Ентерпрајз мулти-агент | $300-500 | $1,500-5,000+ |

### Савети за оптимизацију трошкова

1. **Користите GPT-4o-mini за једноставне задатке**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Имплементирајте кеширање за поновљене упите**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Поставите лимите токена**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Ограничи дужину одговора
   )
   ```

4. **Смањите на нулу када се не користи**
   ```bash
   # Container Apps се аутоматски скалирају на нулу
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Решавање проблема агената

### Уобичајени проблеми и решења

<details>
<summary><strong>❌ Агент не одговара на позиве алатки</strong></summary>

```bash
# Проверите да ли су алати исправно регистровани
azd show

# Проверите размѐштање OpenAI-а
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Проверите логове агента
azd monitor --logs
```

**Уобичајени узроци:**
- Неслагање потписа функције алатке
- Недостају потребне дозволе
- API крајња тачка није доступна
</details>

<details>
<summary><strong>❌ Висока латенција у одговорима агента</strong></summary>

```bash
# Проверите Application Insights за уска грла
azd monitor --live

# Размотрите коришћење бржег модела
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Савети за оптимизацију:**
- Користите стриминг одговоре
- Имплементирајте кеширање одговора
- Смањите величину контекстног прозора
</details>

<details>
<summary><strong>❌ Агент враћа нетачне или измишљене информације</strong></summary>

```python
# Побољшајте помоћу бољих системских упутстава
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Додајте претраживање за утемељење
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Утемелите одговоре у документима
)
```
</details>

<details>
<summary><strong>❌ Грешке: премашен лимит токена</strong></summary>

```python
# Имплементирати управљање прозором контекста
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Груба процена
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Практичне вежбе

### Вежба 1: Разместите основног агента (20 минута)

**Циљ:** Разместите свог првог AI агента користећи AZD

```bash
# Корак 1: Иницијализујте предлошак
azd init --template get-started-with-ai-agents

# Корак 2: Пријавите се у Azure
azd auth login

# Корак 3: Обавите распоређивање
azd up

# Корак 4: Тестирајте агента
# Отворите URL који је приказан у излазу

# Корак 5: Очистите
azd down --force --purge
```

**Критеријуми успеха:**
- [ ] Агент одговара на питања
- [ ] Може да приступи контролној табли за праћење
- [ ] Ресурси су успешно уклоњени

### Вежба 2: Додајте прилагођену алатку (30 минута)

**Циљ:** Проширите агента прилагођеном алатком

1. Deploy the agent template
2. Create a new tool function:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # API позив сервису за временску прогнозу
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Register the tool with the agent
4. Test that the agent uses the new tool

**Критеријуми успеха:**
- [ ] Агент препознаје упите везане за време
- [ ] Алатка се правилно позива
- [ ] Одговор садржи информације о времену

### Вежба 3: Направите RAG агента (45 минута)

**Циљ:** Креирајте агента који одговара на питања из ваших докумената

```bash
# Поставите RAG шаблон
azd init --template azure-search-openai-demo
azd up

# Отпремите своје документе
# (Пратите водич за унос података из шаблона)

# Тестирајте са питањима специфичним за домен
```

**Критеријуми успеха:**
- [ ] Агент одговара на основу отпремљених докумената
- [ ] Одговори укључују цитате
- [ ] Без измишљања за питања ван опсега

---

## 📚 Следећи кораци

Сада када разумете AI агенте, истражите ове напредне теме:

| Тема | Опис | Линк |
|-------|-------------|------|
| **Multi-Agent Systems** | Build systems with multiple collaborating agents | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Coordination Patterns** | Learn orchestration and communication patterns | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Production Deployment** | Enterprise-ready agent deployment | [Production AI Practices](production-ai-practices.md) |
| **Agent Evaluation** | Test and evaluate agent performance | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Додатни ресурси

### Званична документација
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD шаблони за агенте
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Ресурси за заједницу
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Навигација**
- **Претходна лекција**: [AI Model Deployment](ai-model-deployment.md)
- **Следећа лекција**: [Production AI Practices](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Изјава о одрицању одговорности:
Овај документ је преведен помоћу услуге за превођење засноване на вештачкој интелигенцији [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, имајте у виду да аутоматски преводи могу да садрже грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати званичним извором. За критичне информације препоручује се професионални људски превод. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која проистекну из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->