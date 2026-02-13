# AI Agents with Azure Developer CLI

**Chapter Navigation:**
- **📚 Domů kurzu**: [AZD For Beginners](../../README.md)
- **📖 Aktuální kapitola**: Chapter 2 - AI-First Development
- **⬅️ Předchozí**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Další**: [Production AI Practices](production-ai-practices.md)
- **🚀 Pokročilé**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## Úvod

AI agenti jsou autonomní programy, které dokážou vnímat své prostředí, činit rozhodnutí a provádět akce k dosažení konkrétních cílů. Na rozdíl od jednoduchých chatbotů, které odpovídají na dotazy, agenti mohou:

- **Používat nástroje** - Volat rozhraní API, prohledávat databáze, spouštět kód
- **Plánovat a uvažovat** - Rozdělit složité úlohy na kroky
- **Učit se z kontextu** - Uchovávat paměť a přizpůsobovat chování
- **Spolupracovat** - Pracovat s jinými agenty (systémy s více agenty)

Tento průvodce ukazuje, jak nasadit AI agenty do Azure pomocí Azure Developer CLI (azd).

## Cíle učení

Po dokončení tohoto průvodce budete:
- Rozumět, co jsou AI agenti a jak se liší od chatbotů
- Nasadit předpřipravené šablony AI agentů pomocí AZD
- Nakonfigurovat Foundry Agents pro vlastní agenty
- Implementovat základní vzory pro agenty (použití nástrojů, RAG, multi-agent)
- Monitorovat a ladit nasazené agenty

## Výstupy učení

Po dokončení budete schopni:
- Nasadit aplikace AI agentů do Azure jedním příkazem
- Nakonfigurovat nástroje a schopnosti agenta
- Implementovat retrieval-augmented generation (RAG) s agenty
- Navrhnout víceagentní architektury pro složité pracovní postupy
- Řešit běžné problémy s nasazením agentů

---

## 🤖 Čím se agent liší od chatbota?

| Feature | Chatbot | AI Agent |
|---------|---------|----------|
| **Chování** | Reaguje na dotazy | Provádí autonomní akce |
| **Nástroje** | Žádné | Může volat rozhraní API, vyhledávat, spouštět kód |
| **Paměť** | Pouze v rámci relace | Trvalá paměť napříč relacemi |
| **Plánování** | Jedna odpověď | Vícekrokové uvažování |
| **Spolupráce** | Jednotka | Může spolupracovat s jinými agenty |

### Jednoduchá analogie

- **Chatbot** = Užitečná osoba odpovídající na dotazy u informační přepážky
- **AI Agent** = Osobní asistent, který může volat, rezervovat schůzky a dokončovat úkoly za vás

---

## 🚀 Rychlý start: Nasadíte svého prvního agenta

### Možnost 1: Šablona Foundry Agents (doporučeno)

```bash
# Inicializovat šablonu AI agentů
azd init --template get-started-with-ai-agents

# Nasadit do Azure
azd up
```

**Co se nasadí:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (pro RAG)
- ✅ Azure Container Apps (webové rozhraní)
- ✅ Application Insights (monitorování)

**Čas:** ~15-20 minut
**Náklady:** ~$100-150/měsíc (vývoj)

### Možnost 2: OpenAI Agent s Prompty

```bash
# Inicializovat šablonu agenta založenou na Prompty
azd init --template agent-openai-python-prompty

# Nasadit do Azure
azd up
```

**Co se nasadí:**
- ✅ Azure Functions (serverless spuštění agenta)
- ✅ Azure OpenAI
- ✅ Prompty konfigurační soubory
- ✅ Ukázková implementace agenta

**Čas:** ~10-15 minut
**Náklady:** ~$50-100/měsíc (vývoj)

### Možnost 3: RAG Chat Agent

```bash
# Inicializovat šablonu chatu RAG
azd init --template azure-search-openai-demo

# Nasadit do Azure
azd up
```

**Co se nasadí:**
- ✅ Azure OpenAI
- ✅ Azure AI Search s ukázkovými daty
- ✅ Potrubí pro zpracování dokumentů
- ✅ Chat rozhraní s citacemi

**Čas:** ~15-25 minut
**Náklady:** ~$80-150/měsíc (vývoj)

---

## 🏗️ Vzory architektury agentů

### Vzor 1: Jednoagent s nástroji

Nejjednodušší vzor agenta - jeden agent, který může používat více nástrojů.

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

**Nejvhodnější pro:**
- Chatboty zákaznické podpory
- Výzkumné asistenty
- Agenty pro analýzu dat

**AZD Template:** `azure-search-openai-demo`

### Vzor 2: RAG Agent (Retrieval-Augmented Generation)

Agent, který nejprve vyhledá relevantní dokumenty před generováním odpovědí.

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

**Nejvhodnější pro:**
- Podnikové znalostní báze
- Systémy pro dotazy v dokumentech
- Soulad a právní výzkum

**AZD Template:** `azure-search-openai-demo`

### Vzor 3: Víceagentní systém

Více specializovaných agentů, kteří spolupracují na složitých úkolech.

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

**Nejvhodnější pro:**
- Složitou generaci obsahu
- Vícekrokové pracovní postupy
- Úkoly vyžadující různé odbornosti

**Learn More:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Konfigurace nástrojů pro agenty

Agenti jsou silní, když mohou používat nástroje. Zde je návod, jak nakonfigurovat běžné nástroje:

### Konfigurace nástrojů ve Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Definujte vlastní nástroje
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

# Vytvořte agenta s nástroji
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Konfigurace prostředí

```bash
# Nastavte proměnné prostředí specifické pro agenta
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Nasaďte s aktualizovanou konfigurací
azd deploy
```

---

## 📊 Monitorování agentů

### Integrace Application Insights

Všechny AZD šablony agentů zahrnují Application Insights pro monitorování:

```bash
# Otevřít monitorovací panel
azd monitor --overview

# Zobrazit živé protokoly
azd monitor --logs

# Zobrazit živé metriky
azd monitor --live
```

### Klíčové metriky k sledování

| Metric | Description | Target |
|--------|-------------|--------|
| Response Latency | Čas na vygenerování odpovědi | < 5 sekund |
| Token Usage | Tokeny na požadavek | Sledujte kvůli nákladům |
| Tool Call Success Rate | % úspěšných volání nástrojů | > 95% |
| Error Rate | Neúspěšné požadavky agenta | < 1% |
| User Satisfaction | Hodnocení zpětné vazby | > 4.0/5.0 |

### Vlastní logování pro agenty

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

## 💰 Úvahy o nákladech

### Odhadované měsíční náklady podle vzoru

| Pattern | Dev Environment | Production |
|---------|-----------------|------------|
| Single Agent | $50-100 | $200-500 |
| RAG Agent | $80-150 | $300-800 |
| Multi-Agent (2-3 agents) | $150-300 | $500-1,500 |
| Enterprise Multi-Agent | $300-500 | $1,500-5,000+ |

### Tipy pro optimalizaci nákladů

1. **Používejte GPT-4o-mini pro jednoduché úlohy**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Implementujte cache pro opakované dotazy**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Nastavte limity tokenů**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Omezit délku odpovědi
   )
   ```

4. **Škálujte na nulu, když není v provozu**
   ```bash
   # Container Apps se automaticky škálují na nulu
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Řešení problémů s agenty

### Běžné problémy a řešení

<details>
<summary><strong>❌ Agent nereaguje na volání nástrojů</strong></summary>

```bash
# Zkontrolujte, zda jsou nástroje správně zaregistrovány
azd show

# Ověřte nasazení OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Zkontrolujte protokoly agenta
azd monitor --logs
```

**Běžné příčiny:**
- Nesoulad ve signatuře funkce nástroje
- Chybějící požadovaná oprávnění
- API endpoint není přístupný
</details>

<details>
<summary><strong>❌ Vysoká latence v odpovědích agenta</strong></summary>

```bash
# Zkontrolujte Application Insights kvůli úzkým místům
azd monitor --live

# Zvažte použití rychlejšího modelu
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Tipy pro optimalizaci:**
- Používejte streamované odpovědi
- Implementujte cache odpovědí
- Snižte velikost kontextového okna
</details>

<details>
<summary><strong>❌ Agent vrací nesprávné nebo halucinované informace</strong></summary>

```python
# Vylepšit pomocí lepších systémových promptů
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Přidat vyhledávání pro zakotvení
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Zakotvit odpovědi v dokumentech
)
```
</details>

<details>
<summary><strong>❌ Chyby překročení limitu tokenů</strong></summary>

```python
# Implementovat správu kontextového okna
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Hrubý odhad
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Praktické cvičení

### Cvičení 1: Nasadit základního agenta (20 minut)

**Cíl:** Nasadit svého prvního AI agenta pomocí AZD

```bash
# Krok 1: Inicializujte šablonu
azd init --template get-started-with-ai-agents

# Krok 2: Přihlaste se do Azure
azd auth login

# Krok 3: Proveďte nasazení
azd up

# Krok 4: Otestujte agenta
# Otevřete adresu URL zobrazenou ve výstupu

# Krok 5: Proveďte úklid
azd down --force --purge
```

**Kritéria úspěchu:**
- [ ] Agent odpovídá na otázky
- [ ] Máte přístup k monitorovacímu panelu
- [ ] Prostředky byly úspěšně odstraněny

### Cvičení 2: Přidat vlastní nástroj (30 minut)

**Cíl:** Rozšířit agenta o vlastní nástroj

1. Nasadte šablonu agenta
2. Vytvořte novou funkci nástroje:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Volání API na službu počasí
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Zaregistrujte nástroj u agenta
4. Otestujte, že agent používá nový nástroj

**Kritéria úspěchu:**
- [ ] Agent rozpozná dotazy týkající se počasí
- [ ] Nástroj je volán správně
- [ ] Odpověď obsahuje informace o počasí

### Cvičení 3: Vytvořit RAG agenta (45 minut)

**Cíl:** Vytvořit agenta, který odpovídá na otázky z vašich dokumentů

```bash
# Nasadit šablonu RAG
azd init --template azure-search-openai-demo
azd up

# Nahrajte své dokumenty
# (Postupujte podle průvodce šablony pro načítání dat)

# Otestujte pomocí doménově specifických otázek
```

**Kritéria úspěchu:**
- [ ] Agent odpovídá z nahraných dokumentů
- [ ] Odpovědi obsahují citace
- [ ] Žádné halucinace na otázky mimo rozsah

---

## 📚 Další kroky

Teď, když rozumíte AI agentům, prozkoumejte tyto pokročilé témata:

| Topic | Description | Link |
|-------|-------------|------|
| **Multi-Agent Systems** | Budujte systémy s více spolupracujícími agenty | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Coordination Patterns** | Naučte se orchestraci a komunikační vzory | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Production Deployment** | Nasazení agentů připravené pro podnik | [Production AI Practices](production-ai-practices.md) |
| **Agent Evaluation** | Testujte a vyhodnocujte výkon agentů | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Další zdroje

### Oficiální dokumentace
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD šablony pro agenty
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Komunitní zdroje
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigace**
- **Předchozí lekce**: [AI Model Deployment](ai-model-deployment.md)
- **Další lekce**: [Production AI Practices](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje využít profesionální lidský překlad. Nepřebíráme odpovědnost za žádná nedorozumění nebo mylné výklady vzniklé v důsledku použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->