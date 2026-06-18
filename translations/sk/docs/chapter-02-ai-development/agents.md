# AI Agents with Azure Developer CLI

**Chapter Navigation:**
- **📚 Domov kurzu**: [AZD For Beginners](../../README.md)
- **📖 Aktuálna kapitola**: Chapter 2 - AI-First Development
- **⬅️ Predchádzajúce**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Ďalšie**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Pokročilé**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## Úvod

AI agenti sú autonómne programy, ktoré dokážu vnímať svoje prostredie, robiť rozhodnutia a vykonávať akcie na dosiahnutie konkrétnych cieľov. Na rozdiel od jednoduchých chatbotov, ktoré odpovedajú na výzvy, agenti môžu:

- **Používať nástroje** - Volať API, vyhľadávať v databázach, vykonávať kód
- **Plánovať a uvažovať** - Rozložiť zložité úlohy na kroky
- **Učiť sa z kontextu** - Udržiavať pamäť a prispôsobovať správanie
- **Spolupracovať** - Pracovať s inými agentmi (systémy viacerých agentov)

Tento návod ukazuje, ako nasadiť AI agentov do Azure pomocou Azure Developer CLI (azd).

> **Poznámka o overení (2026-03-25):** Tento návod bol overený voči `azd` `1.23.12` a `azure.ai.agents` `0.1.18-preview`. Skúsenosť `azd ai` je stále v preview, preto skontrolujte nápovedu rozšírenia, ak sa vaše nainštalované príznaky líšia.

## Ciele učenia

Po dokončení tohto návodu budete:
- Rozumieť, čo sú AI agenti a ako sa líšia od chatbotov
- Nasadiť predpripravené šablóny AI agentov pomocou AZD
- Nakonfigurovať Foundry Agents pre vlastné agentov
- Implementovať základné vzory agentov (používanie nástrojov, RAG, multi-agent)
- Monitorovať a ladiť nasadené agentov

## Výsledky učenia

Po dokončení budete vedieť:
- Nasadiť aplikácie AI agentov do Azure jedným príkazom
- Nakonfigurovať nástroje a schopnosti agenta
- Implementovať retrieval-augmented generation (RAG) s agentmi
- Navrhnúť multi-agentné architektúry pre zložité pracovné postupy
- Riešiť bežné problémy pri nasadzovaní agentov

---

## 🤖 Čím sa agent líši od chatbota?

| Feature | Chatbot | AI Agent |
|---------|---------|----------|
| **Behavior** | Responds to prompts | Takes autonomous actions |
| **Tools** | None | Can call APIs, search, execute code |
| **Memory** | Session-based only | Persistent memory across sessions |
| **Planning** | Single response | Multi-step reasoning |
| **Collaboration** | Single entity | Can work with other agents |

### Jednoduchá analógia

- **Chatbot** = Užitočná osoba odpovedajúca na otázky pri informačnom pulte
- **AI Agent** = Osobný asistent, ktorý môže telefonovať, rezervovať schôdzky a dokončiť úlohy za vás

---

## 🚀 Rýchly štart: Nasadte svoj prvý agenta

### Možnosť 1: Šablóna Foundry Agents (Odporúčané)

```bash
# Inicializovať šablónu AI agentov
azd init --template get-started-with-ai-agents

# Nasadiť do Azure
azd up
```

**Čo sa nasadí:**
- ✅ Foundry Agents
- ✅ Microsoft Foundry Models (gpt-4.1)
- ✅ Azure AI Search (pre RAG)
- ✅ Azure Container Apps (webové rozhranie)
- ✅ Application Insights (monitorovanie)

**Čas:** ~15-20 minút
**Náklady:** ~$100-150/mesiac (vývoj)

### Možnosť 2: OpenAI Agent s Prompty

```bash
# Inicializovať šablónu agenta založeného na Prompty
azd init --template agent-openai-python-prompty

# Nasadiť do Azure
azd up
```

**Čo sa nasadí:**
- ✅ Azure Functions (serverless vykonávanie agenta)
- ✅ Microsoft Foundry Models
- ✅ Konfiguračné súbory Prompty
- ✅ Ukážková implementácia agenta

**Čas:** ~10-15 minút
**Náklady:** ~$50-100/mesiac (vývoj)

### Možnosť 3: RAG Chat Agent

```bash
# Inicializovať šablónu RAG chatu
azd init --template azure-search-openai-demo

# Nasadiť na Azure
azd up
```

**Čo sa nasadí:**
- ✅ Microsoft Foundry Models
- ✅ Azure AI Search s ukážkovými dátami
- ✅ Pipeline na spracovanie dokumentov
- ✅ Chat rozhranie s citáciami

**Čas:** ~15-25 minút
**Náklady:** ~$80-150/mesiac (vývoj)

### Možnosť 4: AZD AI Agent Init (Manifest- alebo Template-Based Preview)

Ak máte súbor manifestu agenta, môžete použiť príkaz `azd ai` na vygenerovanie projektu Foundry Agent Service priamo. Nedávne preview verzie tiež pridali podporu inicializácie založenej na šablónach, takže presný tok výziev sa môže mierne líšiť v závislosti od verzie vášho rozšírenia.

```bash
# Nainštalovať rozšírenie AI agentov
azd extension install azure.ai.agents

# Voliteľné: overiť nainštalovanú predbežnú verziu
azd extension show azure.ai.agents

# Inicializovať z manifestu agenta
azd ai agent init -m agent-manifest.yaml

# Nasadiť do Azure
azd up

# Otestovať nasadeného agenta (zobrazuje latenciu + čas do prvého bajtu)
azd ai agent invoke
```

**Kedy použiť `azd ai agent init` vs `azd init --template`:**

| Approach | Best For | How It Works |
|----------|----------|------|
| `azd init --template` | Starting from a working sample app | Clones a full template repo with code + infra |
| `azd ai agent init -m` | Building from your own agent manifest | Scaffolds project structure from your agent definition |

> **Tip:** Použite `azd init --template`, keď sa učíte (Možnosti 1-3 vyššie). Použite `azd ai agent init`, keď vytvárate produkčné agentov s vlastnými manifestami.

Po `azd up` vám to isté rozšírenie umožní prejsť cez zvyšok životného cyklu agenta: `azd ai agent invoke` na testovanie, `azd ai agent eval generate` a `azd ai agent optimize` na meranie a zlepšenie kvality a `azd ai agent delete` na vyčistenie. Pozrite si [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pre úplnú referenciu.

---

## 🏗️ Vzory architektúry agentov

### Vzor 1: Jediný agent s nástrojmi

Najjednoduchší vzor agenta - jeden agent, ktorý môže používať viacero nástrojov.

```mermaid
graph TD
    UI[Používateľské rozhranie] --> Agent[AI agent<br/>gpt-4.1]
    Agent --> Search[Nástroj vyhľadávania]
    Agent --> Database[Databázový nástroj]
    Agent --> API[API nástroj]
```

**Najvhodnejšie pre:**
- Chatboty zákazníckej podpory
- Výskumné asistenty
- Agentov na analýzu dát

**AZD šablóna:** `azure-search-openai-demo`

### Vzor 2: RAG Agent (Retrieval-Augmented Generation)

Agent, ktorý pred generovaním odpovedí vyhľadá relevantné dokumenty.

```mermaid
graph TD
    Query[Používateľský dotaz] --> RAG[Agent RAG]
    RAG --> Vector[Vektorové vyhľadávanie]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- Dokumenty --> LLM
    LLM --> Response[Odpoveď s citáciami]
```

**Najvhodnejšie pre:**
- Firemné znalostné bázy
- Systémy otázok a odpovedí nad dokumentmi
- Súlad a právny výskum

**AZD šablóna:** `azure-search-openai-demo`

### Vzor 3: Systém viacerých agentov

Niekoľko špecializovaných agentov pracujúcich spolu na zložitých úlohách.

```mermaid
graph TD
    Orchestrator[Orchestrátor agent] --> Research[Výskumný agent<br/>gpt-4.1]
    Orchestrator --> Writer[Písací agent<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[Recenzný agent<br/>gpt-4.1]
```

**Najvhodnejšie pre:**
- Generovanie zložitého obsahu
- Viackrokové pracovné postupy
- Úlohy vyžadujúce rôzne odbornosti

**Zistiť viac:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Konfigurácia nástrojov agenta

Agentov sú silní, keď môžu používať nástroje. Tu je návod, ako nakonfigurovať bežné nástroje:

### Konfigurácia nástrojov vo Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Definovať vlastné nástroje
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

# Vytvoriť agenta s nástrojmi
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Konfigurácia prostredia

```bash
# Nastaviť premenné prostredia špecifické pre agenta
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Nasadiť s aktualizovanou konfiguráciou
azd deploy
```

---

## 📊 Monitorovanie agentov

### Integrácia Application Insights

Všetky AZD šablóny agentov zahŕňajú Application Insights na monitorovanie:

```bash
# Otvoriť monitorovací panel
azd monitor --overview

# Zobraziť živé protokoly
azd monitor --logs

# Zobraziť živé metriky
azd monitor --live
```

### Kľúčové metriky na sledovanie

| Metric | Description | Target |
|--------|-------------|--------|
| Response Latency | Time to generate response | < 5 seconds |
| Token Usage | Tokens per request | Monitor for cost |
| Tool Call Success Rate | % of successful tool executions | > 95% |
| Error Rate | Failed agent requests | < 1% |
| User Satisfaction | Feedback scores | > 4.0/5.0 |

### Vlastné logovanie pre agentov

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# Nakonfigurujte Azure Monitor s OpenTelemetry
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

> **Poznámka:** Nainštalujte potrebné balíčky: `pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 Náklady

### Odhadované mesačné náklady podľa vzoru

| Pattern | Dev Environment | Production |
|---------|-----------------|------------|
| Single Agent | $50-100 | $200-500 |
| RAG Agent | $80-150 | $300-800 |
| Multi-Agent (2-3 agents) | $150-300 | $500-1,500 |
| Enterprise Multi-Agent | $300-500 | $1,500-5,000+ |

### Tipy na optimalizáciu nákladov

1. **Použite gpt-4.1-mini pre jednoduché úlohy**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. **Implementujte cache pre opakované dotazy**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Nastavte limity tokenov na jedno spustenie**
   ```python
   # Nastavte max_completion_tokens pri spustení agenta, nie počas vytvárania
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # Obmedzte dĺžku odpovede
   )
   ```

4. **Scale to zero, keď nie sú v prevádzke**
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
- Nezhoda signatúry funkcie nástroja
- Chýbajúce potrebné povolenia
- API koncový bod nedostupný
</details>

<details>
<summary><strong>❌ Vysoká latencia pri odpovediach agenta</strong></summary>

```bash
# Skontrolujte Application Insights kvôli úzkym miestam
azd monitor --live

# Zvážte použitie rýchlejšieho modelu
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd deploy
```

**Tipy na optimalizáciu:**
- Použite streamované odpovede
- Implementujte cachovanie odpovedí
- Znížte veľkosť kontextového okna
</details>

<details>
<summary><strong>❌ Agent vracia nesprávne alebo halucinované informácie</strong></summary>

```python
# Vylepšiť pomocou lepších systémových pokynov
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Pridať vyhľadávanie na zakotvenie
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # Zakotviť odpovede v dokumentoch
)
```
</details>

<details>
<summary><strong>❌ Chyby prekročenia limitu tokenov</strong></summary>

```python
# Implementovať správu kontextového okna
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

## 🎓 Praktické cvičenia

### Cvičenie 1: Nasadiť základného agenta (20 minút)

**Cieľ:** Nasadiť svojho prvého AI agenta pomocou AZD

```bash
# Krok 1: Inicializácia šablóny
azd init --template get-started-with-ai-agents

# Krok 2: Prihlásenie do Azure
azd auth login
# Ak pracujete naprieč tenantmi, pridajte --tenant-id <tenant-id>

# Krok 3: Nasadenie
azd up

# Krok 4: Testovanie agenta
# Očakávaný výstup po nasadení:
#   Nasadenie dokončené!
#   Koncový bod: https://<app-name>.<region>.azurecontainerapps.io
# Otvorte URL zobrazenú vo výstupe a skúste položiť otázku

# Krok 5: Zobrazenie monitoringu
azd monitor --overview

# Krok 6: Vyčistenie
azd down --force --purge
```

**Kritériá úspechu:**
- [ ] Agent odpovedá na otázky
- [ ] Prístup k monitorovaciemu dashboardu cez `azd monitor`
- [ ] Zdroje úspešne vyčistené

### Cvičenie 2: Pridať vlastný nástroj (30 minút)

**Cieľ:** Rozšíriť agenta o vlastný nástroj

1. Nasadiť šablónu agenta:
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. Vytvorte novú funkciu nástroja vo vašom kóde agenta:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Volanie API na službu počasia
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Zaregistrujte nástroj u agenta:
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
4. Znovu nasadiť a testovať:
   ```bash
   azd deploy
   # Opýtaj sa: "Aké je počasie v Seattli?"
   # Očakávané: Agent zavolá get_weather("Seattle") a vráti informácie o počasí
   ```

**Kritériá úspechu:**
- [ ] Agent rozpozná otázky týkajúce sa počasia
- [ ] Nástroj je volaný správne
- [ ] Odpoveď obsahuje informácie o počasí

### Cvičenie 3: Vytvorte RAG agenta (45 minút)

**Cieľ:** Vytvoriť agenta, ktorý odpovedá na otázky z vašich dokumentov

```bash
# Krok 1: Nasadiť RAG šablónu
azd init --template azure-search-openai-demo
azd up

# Krok 2: Nahrajte svoje dokumenty
# Umiestnite súbory PDF/TXT do priečinka data/, potom spustite:
python scripts/prepdocs.py

# Krok 3: Testujte s otázkami špecifickými pre doménu
# Otvorte URL webovej aplikácie z výstupu azd up
# Pýtajte sa na nahraté dokumenty
# Odpovede by mali obsahovať citačné odkazy, napr. [doc.pdf]
```

**Kritériá úspechu:**
- [ ] Agent odpovedá na základe nahratých dokumentov
- [ ] Odpovede obsahujú citácie
- [ ] Žiadne halucinácie pri otázkach mimo rozsahu

---

## 📚 Ďalšie kroky

Teraz, keď rozumiete AI agentom, preskúmajte tieto pokročilé témy:

| Topic | Description | Link |
|-------|-------------|------|
| **Multi-Agent Systems** | Build systems with multiple collaborating agents | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Coordination Patterns** | Learn orchestration and communication patterns | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Production Deployment** | Enterprise-ready agent deployment | [Production AI Practices](../chapter-08-production/production-ai-practices.md) |
| **Agent Evaluation** | Test and evaluate agent performance | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **AI Workshop Lab** | Hands-on: Make your AI solution AZD-ready | [AI Workshop Lab](ai-workshop-lab.md) |

---

## 📖 Dodatočné zdroje

### Oficiálna dokumentácia
- [Microsoft Foundry Agent Service](https://learn.microsoft.com/azure/ai-services/agents/)
- [Microsoft Foundry Agent Service Quickstart](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel Agent Framework](https://learn.microsoft.com/semantic-kernel/)

### AZD šablóny pre agentov
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Komunitné zdroje
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### Zručnosti agenta pre váš editor
- [**Microsoft Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Nainštalujte znovu použiteľné zručnosti AI agenta pre Azure vývoj do GitHub Copilot, Cursor alebo akéhokoľvek podporovaného agenta. Obsahuje zručnosti pre [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [deployment](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy) a [diagnostics](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics):
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Navigácia**
- **Predchádzajúca lekcia**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **Ďalšia lekcia**: [AI Model Deployment](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->