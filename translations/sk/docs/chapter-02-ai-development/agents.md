# AI agenti s Azure Developer CLI

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Kapitola 2 - Vývoj orientovaný na AI
- **⬅️ Previous**: [Nasadenie AI modelu](ai-model-deployment.md)
- **➡️ Next**: [Praktiky pre produkčné AI](production-ai-practices.md)
- **🚀 Advanced**: [Riešenia s viacerými agentmi](../../examples/retail-scenario.md)

---

## Úvod

AI agenti sú autonómne programy, ktoré vnímajú svoje prostredie, robia rozhodnutia a vykonávajú akcie na dosiahnutie konkrétnych cieľov. Na rozdiel od jednoduchých chatbotov, ktoré reagujú na výzvy, agenti môžu:

- **Používať nástroje** - Volanie API, prehľadávanie databáz, vykonávanie kódu
- **Plánovať a uvažovať** - Rozložiť zložité úlohy na kroky
- **Učiť sa z kontextu** - Udržiavať pamäť a prispôsobovať správanie
- **Spolupracovať** - Spolupracovať s inými agentmi (systémy viacerých agentov)

Tento návod vám ukáže, ako nasadiť AI agentov do Azure pomocou Azure Developer CLI (azd).

## Ciele učenia

Po dokončení tohto návodu budete:
- Rozumieť, čo sú AI agenti a ako sa líšia od chatbotov
- Nasadiť predpripravené šablóny AI agentov pomocou AZD
- Konfigurovať Foundry Agents pre vlastných agentov
- Implementovať základné vzory agentov (používanie nástrojov, RAG, viac-agentov)
- Monitorovať a ladiť nasadené agenti

## Očakávané výsledky

Po dokončení budete schopní:
- Nasadiť aplikácie AI agentov do Azure jedným príkazom
- Konfigurovať nástrojové schopnosti agentov
- Implementovať retrieval-augmented generation (RAG) s agentmi
- Navrhovať viac-agentové architektúry pre zložité pracovné toky
- Riešiť bežné problémy s nasadením agentov

---

## 🤖 Čím sa agent líši od chatbota?

| Vlastnosť | Chatbot | AI agent |
|---------|---------|----------|
| **Správanie** | Reaguje na výzvy | Vykonáva autonómne akcie |
| **Nástroje** | Žiadne | Môže volať API, vyhľadávať, vykonávať kód |
| **Pamäť** | Iba na úrovni relácie | Trvalá pamäť naprieč reláciami |
| **Plánovanie** | Jednorazová odpoveď | Viackrokové uvažovanie |
| **Spolupráca** | Jednotlivý subjekt | Môže pracovať s inými agentmi |

### Jednoduchá analógia

- **Chatbot** = Užitočná osoba odpovedajúca na otázky pri informačnom pulte
- **AI agent** = Osobný asistent, ktorý môže telefonovať, rezervovať schôdzky a dokončovať úlohy za vás

---

## 🚀 Rýchly štart: Nasadte svojho prvého agenta

### Option 1: Foundry Agents Template (Recommended)

```bash
# Inicializovať šablónu AI agentov
azd init --template get-started-with-ai-agents

# Nasadiť do Azure
azd up
```

**Čo sa nasadí:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (pre RAG)
- ✅ Azure Container Apps (webové rozhranie)
- ✅ Application Insights (monitorovanie)

**Čas:** ~15-20 minút
**Náklady:** ~$100-150/mesiac (vývoj)

### Option 2: OpenAI Agent with Prompty

```bash
# Inicializovať šablónu agenta založenú na Prompty
azd init --template agent-openai-python-prompty

# Nasadiť na Azure
azd up
```

**Čo sa nasadí:**
- ✅ Azure Functions (serverless vykonávanie agenta)
- ✅ Azure OpenAI
- ✅ Súbory konfigurácie Prompty
- ✅ Ukážková implementácia agenta

**Čas:** ~10-15 minút
**Náklady:** ~$50-100/mesiac (vývoj)

### Option 3: RAG Chat Agent

```bash
# Inicializácia šablóny RAG chatu
azd init --template azure-search-openai-demo

# Nasadiť do Azure
azd up
```

**Čo sa nasadí:**
- ✅ Azure OpenAI
- ✅ Azure AI Search s ukážkovými dátami
- ✅ Pipeline spracovania dokumentov
- ✅ Chat rozhranie s citáciami

**Čas:** ~15-25 minút
**Náklady:** ~$80-150/mesiac (vývoj)

---

## 🏗️ Vzory architektúry agentov

### Vzor 1: Jeden agent s nástrojmi

Najjednoduchší vzor agenta - jeden agent, ktorý môže používať viacero nástrojov.

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

**Najvhodnejšie pre:**
- Chatboty zákazníckej podpory
- Výskumné asistenty
- Agenti pre analýzu dát

**AZD šablóna:** `azure-search-openai-demo`

### Vzor 2: RAG agent (Retrieval-Augmented Generation)

Agent, ktorý pred generovaním odpovedí vyhľadá relevantné dokumenty.

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

**Najvhodnejšie pre:**
- Firemné znalostné bázy
- Systémy Q&A s dokumentmi
- Právne a súladové výskumy

**AZD šablóna:** `azure-search-openai-demo`

### Vzor 3: Systém viacerých agentov

Viacero špecializovaných agentov, ktorí spolupracujú na zložitých úlohách.

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

**Najvhodnejšie pre:**
- Zložité generovanie obsahu
- Viackrokové pracovné toky
- Úlohy vyžadujúce rôzne expertízy

**Viac info:** [Koordinačné vzory pre viac agentov](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Konfigurácia nástrojov agenta

Agenti získavajú silu, keď môžu používať nástroje. Tu je, ako nakonfigurovať bežné nástroje:

### Konfigurácia nástrojov vo Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Definujte vlastné nástroje
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

# Vytvorte agenta s nástrojmi
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Konfigurácia prostredia

```bash
# Nastavenie premenných prostredia špecifických pre agenta
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Nasadenie s aktualizovanou konfiguráciou
azd deploy
```

---

## 📊 Monitorovanie agentov

### Integrácia Application Insights

Všetky AZD šablóny agentov zahŕňajú Application Insights pre monitorovanie:

```bash
# Otvoriť monitorovací panel
azd monitor --overview

# Zobraziť živé logy
azd monitor --logs

# Zobraziť živé metriky
azd monitor --live
```

### Kľúčové metriky na sledovanie

| Metrika | Popis | Cieľ |
|--------|-------------|--------|
| Latencia odpovede | Čas na vygenerovanie odpovede | < 5 sekúnd |
| Použitie tokenov | Tokeny na požiadavku | Sledujte kvôli nákladom |
| Miera úspešnosti volaní nástrojov | % úspešných vykonaní nástrojov | > 95% |
| Miera chýb | Neúspešné požiadavky agenta | < 1% |
| Spokojnosť používateľov | Hodnotenia spätnej väzby | > 4.0/5.0 |

### Vlastné logovanie pre agentov

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

## 💰 Náklady

### Odhadované mesačné náklady podľa vzoru

| Vzor | Vývojové prostredie | Produkcia |
|---------|-----------------|------------|
| Jeden agent | $50-100 | $200-500 |
| RAG agent | $80-150 | $300-800 |
| Viacagentový (2-3 agenti) | $150-300 | $500-1,500 |
| Enterprise viacagentový | $300-500 | $1,500-5,000+ |

### Tipy na optimalizáciu nákladov

1. **Použite GPT-4o-mini pre jednoduché úlohy**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Implementujte cache pre opakované dotazy**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Nastavte limity tokenov**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Obmedziť dĺžku odpovede
   )
   ```

4. **Škalujte na nulu, keď sa nepoužíva**
   ```bash
   # Container Apps sa automaticky škálujú na nulu
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Riešenie problémov s agentmi

### Bežné problémy a riešenia

<details>
<summary><strong>❌ Agent neodpovedá na volania nástrojov</strong></summary>

```bash
# Skontrolujte, či sú nástroje správne zaregistrované
azd show

# Overte nasadenie OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Skontrolujte protokoly agenta
azd monitor --logs
```

**Bežné príčiny:**
- Nesúlad podpisu funkcie nástroja
- Chýbajúce požadované oprávnenia
- Koncový bod API nie je prístupný
</details>

<details>
<summary><strong>❌ Vysoká latencia v odpovediach agenta</strong></summary>

```bash
# Skontrolujte Application Insights kvôli úzkym miestam
azd monitor --live

# Zvážte použitie rýchlejšieho modelu
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Tipy na optimalizáciu:**
- Použite streamované odpovede
- Implementujte cache odpovedí
- Znížte veľkosť kontextového okna
</details>

<details>
<summary><strong>❌ Agent vracia nesprávne alebo vymyslené informácie</strong></summary>

```python
# Vylepšiť pomocou lepších systémových promptov
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Pridať vyhľadávanie pre zakotvenie
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Založiť odpovede na dokumentoch
)
```
</details>

<details>
<summary><strong>❌ Chyby: prekročený limit tokenov</strong></summary>

```python
# Implementovať správu kontextového okna
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

## 🎓 Praktické cvičenia

### Cvičenie 1: Nasadiť základného agenta (20 minút)

**Cieľ:** Nasadiť svojho prvého AI agenta pomocou AZD

```bash
# Krok 1: Inicializácia šablóny
azd init --template get-started-with-ai-agents

# Krok 2: Prihlásenie do Azure
azd auth login

# Krok 3: Nasadenie
azd up

# Krok 4: Testovanie agenta
# Otvorte URL zobrazenú v výstupe

# Krok 5: Vyčistenie
azd down --force --purge
```

**Kritériá úspechu:**
- [ ] Agent odpovedá na otázky
- [ ] Má prístup k monitorovaciemu panelu
- [ ] Zdroje boli úspešne odstránené

### Cvičenie 2: Pridať vlastný nástroj (30 minút)

**Cieľ:** Rozšíriť agenta o vlastný nástroj

1. Nasadiť šablónu agenta
2. Vytvorte novú funkciu nástroja:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Volanie API na službu počasia
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Zaregistrujte nástroj u agenta
4. Otestujte, že agent používa nový nástroj

**Kritériá úspechu:**
- [ ] Agent rozpozná otázky týkajúce sa počasia
- [ ] Nástroj je volaný správne
- [ ] Odpoveď obsahuje informácie o počasí

### Cvičenie 3: Vytvorte RAG agenta (45 minút)

**Cieľ:** Vytvorte agenta, ktorý odpovedá na otázky z vašich dokumentov

```bash
# Nasadiť šablónu RAG
azd init --template azure-search-openai-demo
azd up

# Nahrajte svoje dokumenty
# (Postupujte podľa sprievodcu šablóny pre import údajov)

# Otestujte pomocou otázok špecifických pre doménu
```

**Kritériá úspechu:**
- [ ] Agent odpovedá z nahratých dokumentov
- [ ] Odpovede obsahujú citácie
- [ ] Žiadne vymyslené odpovede na otázky mimo rozsahu

---

## 📚 Ďalšie kroky

Teraz, keď rozumiete AI agentom, preskúmajte tieto pokročilé témy:

| Téma | Popis | Link |
|-------|-------------|------|
| **Systémy viacerých agentov** | Budujte systémy s viacerými spolupracujúcimi agentmi | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Koordinačné vzory** | Naučte sa orchestrace a komunikačné vzory | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Nasadenie do produkcie** | Enterprise-ready nasadenie agentov | [Production AI Practices](production-ai-practices.md) |
| **Vyhodnotenie agenta** | Testujte a vyhodnocujte výkon agenta | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Ďalšie zdroje

### Oficiálna dokumentácia
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD šablóny pre agentov
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Komunitné zdroje
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigácia**
- **Previous Lesson**: [Nasadenie AI modelu](ai-model-deployment.md)
- **Next Lesson**: [Praktiky pre produkčné AI](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vyhlásenie o vylúčení zodpovednosti:
Tento dokument bol preložený pomocou automatizovanej prekladateľskej služby využívajúcej umelú inteligenciu [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, berte prosím na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho originálnom jazyku treba považovať za záväzný. Pri kritických informáciách sa odporúča profesionálny ľudský preklad. Nezodpovedáme za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->