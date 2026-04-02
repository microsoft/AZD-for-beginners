# AI agenti s Azure Developer CLI

**Navigácia kapitol:**
- **📚 Úvod do kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - AI-prvé vývoj
- **⬅️ Predošlá**: [Integrácia Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Ďalšia**: [Nasadenie AI modelu](ai-model-deployment.md)
- **🚀 Pokročilé**: [Multi-agentné riešenia](../../examples/retail-scenario.md)

---

## Úvod

AI agenti sú autonómne programy, ktoré vnímajú svoje prostredie, prijímajú rozhodnutia a vykonávajú akcie na dosiahnutie konkrétnych cieľov. Na rozdiel od jednoduchých chatbotov, ktoré odpovedajú na príkazy, agenti môžu:

- **Používať nástroje** - volanie API, vyhľadávanie v databázach, vykonávanie kódu
- **Plánovať a uvažovať** - rozkladať zložité úlohy na kroky
- **Učiť sa z kontextu** - uchovávať pamäť a prispôsobovať správanie
- **Spolupracovať** - pracovať s inými agentmi (multi-agentné systémy)

Tento návod vám ukáže, ako nasadiť AI agentov na Azure pomocou Azure Developer CLI (azd).

> **Poznámka k overeniu (2026-03-25):** Tento návod bol overený s `azd` verziou `1.23.12` a `azure.ai.agents` `0.1.18-preview`. Skúsenosť s `azd ai` je stále v náhľade, preto skontrolujte pomoc k rozšíreniu, ak sa vaše nainštalované príznaky líšia.

## Ciele učenia

Splnením tohto návodu budete:
- Rozumieť, čo sú AI agenti a ako sa líšia od chatbotov
- Nasadiť predpripravené šablóny AI agentov pomocou AZD
- Konfigurovať Foundry Agentov pre vlastných agentov
- Implementovať základné vzory agentov (použitie nástrojov, RAG, multi-agent)
- Monitorovať a ladíte nasadených agentov

## Výsledky učenia

Po dokončení budete schopní:
- Nasadiť AI agentné aplikácie na Azure jedným príkazom
- Konfigurovať nástroje a schopnosti agentov
- Implementovať retrieval-augmented generation (RAG) s agentmi
- Navrhovať multi-agentné architektúry pre zložité pracovné postupy
- Riešiť bežné problémy pri nasadení agentov

---

## 🤖 Čím sa agent líši od chatbota?

| Funkcia | Chatbot | AI agent |
|---------|---------|----------|
| **Správanie** | Odpovedá na podnety | Vykonáva autonómne akcie |
| **Nástroje** | Žiadne | Môže volať API, vyhľadávať, vykonávať kód |
| **Pamäť** | Len počas relácie | Trvalá pamäť naprieč reláciami |
| **Plánovanie** | Jedna odpoveď | Viacstupňové uvažovanie |
| **Spolupráca** | Jednotlivá entita | Môže spolupracovať s inými agentmi |

### Jednoduchá analógia

- **Chatbot** = Užitočná osoba odpovedajúca na otázky na informačnej recepcii
- **AI agent** = Osobný asistent, ktorý vie telefonovať, rezervovať schôdzky a plniť úlohy za vás

---

## 🚀 Rýchly štart: Nasadte svoj prvý agenta

### Možnosť 1: Šablóna Foundry Agentov (odporúčané)

```bash
# Inicializujte šablónu AI agentov
azd init --template get-started-with-ai-agents

# Nasadiť do Azure
azd up
```

**Čo sa nasadí:**
- ✅ Foundry Agenti
- ✅ Microsoft Foundry modely (gpt-4.1)
- ✅ Azure AI Search (pre RAG)
- ✅ Azure Container Apps (webové rozhranie)
- ✅ Application Insights (monitorovanie)

**Čas:** ~15-20 minút
**Cena:** ~$100-150/mesiac (vývoj)

### Možnosť 2: OpenAI Agent s Prompty

```bash
# Inicializujte šablónu agenta založenú na Prompty
azd init --template agent-openai-python-prompty

# Nasadiť do Azure
azd up
```

**Čo sa nasadí:**
- ✅ Azure Functions (serverless vykonávanie agenta)
- ✅ Microsoft Foundry modely
- ✅ Konfiguračné súbory Prompty
- ✅ Ukážková implementácia agenta

**Čas:** ~10-15 minút
**Cena:** ~$50-100/mesiac (vývoj)

### Možnosť 3: RAG Chat Agent

```bash
# Inicializovať RAG chat šablónu
azd init --template azure-search-openai-demo

# Nasadiť do Azure
azd up
```

**Čo sa nasadí:**
- ✅ Microsoft Foundry modely
- ✅ Azure AI Search s ukážkovými dátami
- ✅ Pipeline na spracovanie dokumentov
- ✅ Chat rozhranie s citáciami

**Čas:** ~15-25 minút
**Cena:** ~$80-150/mesiac (vývoj)

### Možnosť 4: AZD AI Agent Init (Náhľad na základe manifestu alebo šablóny)

Ak máte manifest agenta, môžete použiť príkaz `azd ai` na škálovanie projektu Foundry Agent Service priamo. Nedávne preview verzie pridali aj podporu inicializácie na základe šablóny, takže presný tok výziev sa môže mierne líšiť podľa verzie vášho rozšírenia.

```bash
# Nainštalujte rozšírenie AI agentov
azd extension install azure.ai.agents

# Voliteľné: overte nainštalovanú verziu náhľadu
azd extension show azure.ai.agents

# Inicializujte z manifestu agenta
azd ai agent init -m agent-manifest.yaml

# Nasadiť na Azure
azd up
```

**Kedy použiť `azd ai agent init` vs `azd init --template`:**

| Prístup | Najlepšie pre | Ako to funguje |
|----------|----------|------|
| `azd init --template` | Začínate s funkčnou ukážkovou aplikáciou | Klonuje celú šablónu repozitára s kódom a infraštruktúrou |
| `azd ai agent init -m` | Staviate podľa vlastného manifestu agenta | Škáluje štruktúru projektu podľa vašej definície agenta |

> **Tip:** Použite `azd init --template` pri učení (Možnosti 1-3 vyššie). Použite `azd ai agent init` pri tvorbe produkčných agentov s vlastnými manifestmi. Kompletný zoznam nájdete v [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

---

## 🏗️ Vzory architektúry agentov

### Vzor 1: Jediný agent s nástrojmi

Najjednoduchší vzor agenta - jeden agent, ktorý môže používať viaceré nástroje.

```mermaid
graph TD
    UI[Používateľské rozhranie] --> Agent[AI Agent<br/>gpt-4.1]
    Agent --> Search[Nástroj na vyhľadávanie]
    Agent --> Database[Nástroj na databázu]
    Agent --> API[Nástroj API]
```
**Najlepšie pre:**
- Boty zákazníckej podpory
- Výskumných asistentov
- Agentov analýzy dát

**Šablóna AZD:** `azure-search-openai-demo`

### Vzor 2: RAG agent (Retrieval-Augmented Generation)

Agent, ktorý pred generovaním odpovede vyhľadá relevantné dokumenty.

```mermaid
graph TD
    Query[Používateľský dopyt] --> RAG[RAG agent]
    RAG --> Vector[Vyhľadávanie vektorov]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- Dokumenty --> LLM
    LLM --> Response[Odpoveď s citáciami]
```
**Najlepšie pre:**
- Podnikové znalostné databázy
- Systémy otázok a odpovedí na dokumenty
- Dodržiavanie predpisov a právny výskum

**Šablóna AZD:** `azure-search-openai-demo`

### Vzor 3: Multi-agentný systém

Niekoľko špecializovaných agentov spolupracujúcich na zložitých úlohách.

```mermaid
graph TD
    Orchestrator[Orchestrátor Agent] --> Research[Výskumný Agent<br/>gpt-4.1]
    Orchestrator --> Writer[Písací Agent<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[Recenzentský Agent<br/>gpt-4.1]
```
**Najlepšie pre:**
- Zložité generovanie obsahu
- Viacstupňové pracovné postupy
- Úlohy vyžadujúce rôzne odbornosť

**Viac:** [Vzor koordinácie multi-agentov](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Konfigurácia nástrojov agenta

Agenti sú silní, keď môžu používať nástroje. Tu je návod na konfiguráciu bežných nástrojov:

### Konfigurácia nástrojov v Foundry agentoch

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
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Konfigurácia prostredia

```bash
# Nastavte premenné prostredia špecifické pre agenta
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

Všetky AZD šablóny agentov obsahujú Application Insights pre monitorovanie:

```bash
# Otvoriť monitorovací panel
azd monitor --overview

# Zobraziť živé záznamy
azd monitor --logs

# Zobraziť živé metriky
azd monitor --live
```

### Kľúčové metriky na sledovanie

| Metrika | Popis | Cieľ |
|--------|-------------|--------|
| Latencia odpovede | Čas na vygenerovanie odpovede | < 5 sekúnd |
| Využitie tokenov | Tokeny na požiadavku | Monitorujte kvôli nákladom |
| Miera úspešnosti volaní nástrojov | % úspešne vykonaných nástrojov | > 95 % |
| Miera chýb | Nepodarené požiadavky agentovi | < 1 % |
| Spokojnosť používateľa | Hodnotenia spätnej väzby | > 4.0/5.0 |

### Vlastné logovanie agentov

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

> **Poznámka:** Nainštalujte požadované balíky: `pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 Náklady

### Odhadované mesačné náklady podľa vzoru

| Vzor | Vývojové prostredie | Produkcia |
|---------|-----------------|------------|
| Jediný agent | 50-100 $ | 200-500 $ |
| RAG agent | 80-150 $ | 300-800 $ |
| Multi-agent (2-3 agenti) | 150-300 $ | 500-1 500 $ |
| Podnikový multi-agent | 300-500 $ | 1 500-5 000+ $ |

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

3. **Nastavte limity tokenov na jeden beh**
   ```python
   # Nastavte max_completion_tokens pri spustení agenta, nie počas vytvárania
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # Obmedzte dĺžku odpovede
   )
   ```

4. **Škálujte na nulu, keď nepoužívate**
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

# Skontrolujte denníky agenta
azd monitor --logs
```

**Bežné príčiny:**
- Nesúlad v podpise funkcie nástroja
- Chýbajúce požadované oprávnenia
- API endpoint nedostupný
</details>

<details>
<summary><strong>❌ Vysoká latencia v odpovediach agenta</strong></summary>

```bash
# Skontrolujte Application Insights pre úzke miesta
azd monitor --live

# Zvážte použitie rýchlejšieho modelu
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd deploy
```

**Tipy na optimalizáciu:**
- Použite streaming odpovede
- Implementujte cache odpovedí
- Znížte veľkosť kontextového okna
</details>

<details>
<summary><strong>❌ Agent vracia nesprávne alebo vymyslené informácie</strong></summary>

```python
# Zlepšiť pomocou lepších systémových výziev
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Pridať vyhľadávanie pre zakladanie
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # Zakladať odpovede v dokumentoch
)
```
</details>

<details>
<summary><strong>❌ Chyby prekročenia limitu tokenov</strong></summary>

```python
# Implementujte správu kontextového okna
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

### Cvičenie 1: Nasadenie základného agenta (20 minút)

**Cieľ:** Nasadiť svoj prvý AI agent pomocou AZD

```bash
# Krok 1: Inicializujte šablónu
azd init --template get-started-with-ai-agents

# Krok 2: Prihláste sa do Azure
azd auth login
# Ak pracujete naprieč tenantmi, pridajte --tenant-id <tenant-id>

# Krok 3: Nasadenie
azd up

# Krok 4: Otestujte agenta
# Očakávaný výstup po nasadení:
#   Nasadenie dokončené!
#   Koncový bod: https://<app-name>.<region>.azurecontainerapps.io
# Otvorte URL zobrazenú vo výstupe a skúste položiť otázku

# Krok 5: Zobraziť monitorovanie
azd monitor --overview

# Krok 6: Vyčistenie
azd down --force --purge
```

**Kritériá úspechu:**
- [ ] Agent odpovedá na otázky
- [ ] Prístup k monitorovacej obrazovke cez `azd monitor`
- [ ] Úspešné vyčistenie zdrojov

### Cvičenie 2: Pridanie vlastného nástroja (30 minút)

**Cieľ:** Rozšíriť agenta o vlastný nástroj

1. Nasadte šablónu agenta:
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. Vytvorte novú funkciu nástroja v kóde agenta:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Volanie API na počasie služby
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Zaregistrujte nástroj v agentovi:
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
4. Opätovne nasadte a otestujte:
   ```bash
   azd deploy
   # Opýtajte sa: "Aké je počasie v Seattli?"
   # Očakávané: Agent zavolá get_weather("Seattle") a vráti informácie o počasí
   ```

**Kritériá úspechu:**
- [ ] Agent rozpoznáva otázky týkajúce sa počasia
- [ ] Nástroj je správne volaný
- [ ] Odpoveď obsahuje informácie o počasí

### Cvičenie 3: Vytvorenie RAG agenta (45 minút)

**Cieľ:** Vytvoriť agenta, ktorý odpovedá na otázky z vašich dokumentov

```bash
# Krok 1: Nasadiť RAG šablónu
azd init --template azure-search-openai-demo
azd up

# Krok 2: Nahrať vaše dokumenty
# Umiestnite PDF/TXT súbory do adresára data/, potom spustite:
python scripts/prepdocs.py

# Krok 3: Otestujte s otázkami špecifickými pre doménu
# Otvorte URL webovej aplikácie z výstupu azd up
# Pýtajte sa otázky o vašich nahraných dokumentoch
# Odpovede by mali obsahovať odkazy na citácie ako [doc.pdf]
```

**Kritériá úspechu:**
- [ ] Agent odpovedá z nahraných dokumentov
- [ ] Odpovede obsahujú citácie
- [ ] Žiadne vymýšľanie pri otázkach mimo rozsah

---

## 📚 Ďalšie kroky

Keď už rozumiete AI agentom, preskúmajte tieto pokročilé témy:

| Téma | Popis | Odkaz |
|-------|-------------|------|
| **Multi-agentné systémy** | Budujte systémy s viacerými spolupracujúcimi agentmi | [Príklad retailového multi-agentu](../../examples/retail-scenario.md) |
| **Koordinačné vzory** | Naučte sa vzory orchestrácie a komunikácie | [Koordinačné vzory](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Produkčné nasadenie** | Nasadenie agentov pripravené pre podniky | [Produkčné AI postupy](../chapter-08-production/production-ai-practices.md) |
| **Hodnotenie agentov** | Testovanie a hodnotenie výkonu agentov | [Riešenie problémov s AI](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **AI Workshop Lab** | Praktická práca: Spravte riešenie AI pripravené pre AZD | [AI Workshop Lab](ai-workshop-lab.md) |

---

## 📖 Dodatočné zdroje

### Oficiálna dokumentácia
- [Azure AI Agent Service](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure AI Foundry Agent Service Quickstart](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel Agent Framework](https://learn.microsoft.com/semantic-kernel/)

### AZD šablóny pre agentov
- [Začnite s AI agentmi](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Komunitné zdroje
- [Awesome AZD - šablóny agentov](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### Schopnosti agentov pre váš editor
- [**Microsoft Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Nainštalujte znovupoužiteľné AI schopnosti agentov pre vývoj v Azure v GitHub Copilot, Cursor alebo v iných podporovaných agentoch. Obsahuje schopnosti pre [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [nasadenie](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy) a [diagnostiku](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics):
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Navigácia**
- **Predchádzajúca lekcia**: [Integrácia Microsoft Foundry](microsoft-foundry-integration.md)
- **Ďalšia lekcia**: [Nasadenie AI modelu](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, majte prosím na pamäti, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne výklady vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->