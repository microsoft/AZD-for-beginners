# AI agenti s Azure Developer CLI

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - AI-First Development
- **⬅️ Predchádzajúca**: [Integrácia Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Ďalšia**: [Nasadenie AI modelu](ai-model-deployment.md)
- **🚀 Pokročilé**: [Multi-agentné riešenia](../../examples/retail-scenario.md)

---

## Úvod

AI agenti sú autonómne programy, ktoré dokážu vnímať svoje prostredie, robiť rozhodnutia a vykonávať akcie na dosiahnutie konkrétnych cieľov. Na rozdiel od jednoduchých chatbotov, ktoré odpovedajú na podnety, agenti môžu:

- **Používať nástroje** - volať API, vyhľadávať v databázach, vykonávať kód
- **Plánovať a uvažovať** - rozkladať komplexné úlohy na kroky
- **Učiť sa z kontextu** - udržiavať pamäť a prispôsobovať správanie
- **Spolupracovať** - pracovať s inými agentmi (multi-agentné systémy)

Tento sprievodca vám ukáže, ako nasadiť AI agentov do Azure pomocou Azure Developer CLI (azd).

> **Poznámka k validácii (2026-07-13):** Tento sprievodca bol overený s `azd` `1.27.1` a `azure.ai.agents` `1.0.0-beta.5`. Skúsenosť s `azd ai` je stále v náhľadovej fáze, preto si skontrolujte pomoc rozšírenia, ak máte iné inštalované verzie.

## Ciele učenia

Po dokončení tohto sprievodcu budete vedieť:
- Pochopiť, čo sú AI agenti a ako sa líšia od chatbotov
- Nasadiť predpripravené šablóny AI agentov pomocou AZD
- Konfigurovať Foundry agentov pre vlastných agentov
- Implementovať základné vzory agenteov (použitie nástrojov, RAG, multi-agent)
- Monitorovať a ladenie nasadených agentov

## Výsledky učenia

Po dokončení budete schopní:
- Nasadiť AI agentné aplikácie do Azure jediným príkazom
- Konfigurovať nástroje a schopnosti agentov
- Implementovať retrieval-augmented generation (RAG) s agentmi
- Navrhnúť multi-agentnú architektúru pre zložité pracovné postupy
- Riešiť bežné problémy pri nasadení agentov

---

## 🤖 Čím sa agent líši od chatbota?

| Vlastnosť | Chatbot | AI agent |
|---------|---------|----------|
| **Správanie** | Reaguje na podnety | Vykonáva autonómne akcie |
| **Nástroje** | Žiadne | Môže volať API, vyhľadávať, vykonávať kód |
| **Pamäť** | Len počas relácie | Trvalá pamäť naprieč reláciami |
| **Plánovanie** | Jedna odpoveď | Viackrokové uvažovanie |
| **Spolupráca** | Jednotlivý entita | Môže spolupracovať s inými agentmi |

### Jednoduchá analógia

- **Chatbot** = Užitočná osoba odpovedajúca na otázky na informačnej recepcii
- **AI agent** = Osobný asistent, ktorý vie telefonovať, objednávať schôdzky a dokončovať úlohy za vás

---

## 🚀 Rýchly štart: Nasadte svoj prvý agenta

### Možnosť 1: Šablóna Foundry Agents (odporúčaná)

```bash
# Inicializovať šablónu AI agentov
azd init --template get-started-with-ai-agents

# Nasadiť do Azure
azd up
```

**Čo sa nasadí:**
- ✅ Foundry Agents
- ✅ Microsoft Foundry Modely (gpt-4.1)
- ✅ Azure AI Search (pre RAG)
- ✅ Azure Container Apps (webové rozhranie)
- ✅ Application Insights (monitorovanie)

**Čas:** ~15-20 minút
**Náklady:** ~$100-150/mesiac (vývoj)

### Možnosť 2: OpenAI Agent s Prompty

```bash
# Inicializovať šablónu agenta založenú na Prompty
azd init --template agent-openai-python-prompty

# Nasadiť na Azure
azd up
```

**Čo sa nasadí:**
- ✅ Azure Functions (serverless vykonávanie agenta)
- ✅ Microsoft Foundry Modely
- ✅ Konfiguračné súbory Prompty
- ✅ Ukážková implementácia agenta

**Čas:** ~10-15 minút
**Náklady:** ~$50-100/mesiac (vývoj)

### Možnosť 3: RAG Chat Agent

```bash
# Inicializovať šablónu RAG chatu
azd init --template azure-search-openai-demo

# Nasadiť do Azure
azd up
```

**Čo sa nasadí:**
- ✅ Microsoft Foundry Modely
- ✅ Azure AI Search s ukážkovými dátami
- ✅ Pipeline spracovania dokumentov
- ✅ Chat rozhranie s citáciami

**Čas:** ~15-25 minút
**Náklady:** ~$80-150/mesiac (vývoj)

### Možnosť 4: AZD AI Agent Init (náhľadová podpora Manifesta alebo Šablóny)

Ak máte manifest agenta, môžete pomocou príkazu `azd ai` priamo vytvoriť projekt Foundry Agent Service. Nedávne náhľadové verzie tiež pridali podporu inicializácie na základe šablóny, takže presný tok podnetov sa môže mierne líšiť v závislosti od vašej verzie rozšírenia.

```bash
# Nainštalujte rozšírenie AI agentov
azd extension install azure.ai.agents

# Voliteľné: overte nainštalovanú ukážkovú verziu
azd extension show azure.ai.agents

# Inicializujte z manifestu agenta
azd ai agent init -m agent-manifest.yaml

# Nasadiť do Azure
azd up

# Otestujte nasadeného agenta (ukazuje latenciu + čas do prvého bajtu)
azd ai agent invoke
```

**Kedy použiť `azd ai agent init` vs `azd init --template`:**

| Prístup | Najlepšie pre | Ako to funguje |
|----------|----------|------|
| `azd init --template` | Začínate s funkčnou ukážkou aplikácie | Klonuje kompletné repozitórium šablóny s kódom + infraštruktúrou |
| `azd ai agent init -m` | Staviate z vlastného manifestu agenta | Vytvára projektovú štruktúru z vašej definície agenta |

> **Tip:** Používajte `azd init --template` pri učení (možnosti 1-3 vyššie). Používajte `azd ai agent init`, keď vytvárate produkčných agentov s vlastnými manifestmi.

Po spustení `azd up` vás toto rozšírenie prevedie zvyškom životného cyklu agenta: `azd ai agent invoke` na testovanie, `azd ai agent eval generate` a `azd ai agent optimize` na meranie a zlepšenie kvality a `azd ai agent delete` na vyčistenie. Pozrite [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pre úplnú referenciu.

---

## 🏗️ Vzory architektúry agentov

### Vzor 1: Jeden agent s nástrojmi

Najjednoduchší vzor agenta - jeden agent, ktorý môže používať viacero nástrojov.

```mermaid
graph TD
    UI[Používateľské rozhranie] --> Agent[AI Agent<br/>gpt-4.1]
    Agent --> Search[Vyhľadávací nástroj]
    Agent --> Database[Nástroj databázy]
    Agent --> API[API nástroj]
```

**Najvhodnejšie pre:**
- Chatboty zákazníckej podpory
- Výskumné asistenty
- Agentov na analýzu dát

**AZD šablóna:** `azure-search-openai-demo`

### Vzor 2: RAG agent (Retrieval-Augmented Generation)

Agent, ktorý najprv vyhľadá relevantné dokumenty, a potom generuje odpovede.

```mermaid
graph TD
    Query[Užívateľský dopyt] --> RAG[RAG Agent]
    RAG --> Vector[Vektorové vyhľadávanie]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- Documents --> LLM
    LLM --> Response[Odpoveď s citáciami]
```

**Najvhodnejšie pre:**
- Firemné znalostné bázy
- Systémy otázok a odpovedí na dokumenty
- Právny a súladový výskum

**AZD šablóna:** `azure-search-openai-demo`

### Vzor 3: Multi-agentný systém

Viac špecializovaných agentov pracujúcich spoločne na zložitých úlohách.

```mermaid
graph TD
    Orchestrator[Orchestrátor Agent] --> Research[Výskumný Agent<br/>gpt-4.1]
    Orchestrator --> Writer[Spisovateľ Agent<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[Recenzent Agent<br/>gpt-4.1]
```

**Najvhodnejšie pre:**
- Generovanie komplexného obsahu
- Viackrokové pracovné postupy
- Úlohy vyžadujúce rôzne odbornosti

**Viac informácií:** [Vzory koordinácie multi-agentov](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Konfigurácia nástrojov agentov

Agenti sú silní, keď môžu používať nástroje. Tu je návod, ako konfigurovať bežné nástroje:

### Konfigurácia nástrojov v Foundry Agents

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

Všetky šablóny agentov AZD obsahujú Application Insights na monitorovanie:

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
| Použitie tokenov | Tokeny na požiadavku | Monitorovať kvôli nákladom |
| Miera úspešnosti volaní nástrojov | % úspešných vykonaní nástrojov | > 95% |
| Miera chýb | Neúspešné požiadavky agenta | < 1% |
| Spokojnosť používateľa | Hodnotenia spätnej väzby | > 4.0/5.0 |

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

## 💰 Úvahy o nákladoch

### Odhadované mesačné náklady podľa vzoru

| Vzor | Vývojové prostredie | Produkcia |
|---------|-----------------|------------|
| Jeden agent | $50-100 | $200-500 |
| RAG agent | $80-150 | $300-800 |
| Multi-agent (2-3 agenti) | $150-300 | $500-1,500 |
| Enterprise multi-agent | $300-500 | $1,500-5,000+ |

### Tipy na optimalizáciu nákladov

1. **Používajte gpt-4.1-mini pre jednoduché úlohy**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. **Implementujte cache pre opakované dopyty**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Nastavte limity tokenov na jeden beh**
   ```python
   # Nastavte max_completion_tokens pri spúšťaní agenta, nie počas vytvorenia
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # Obmedzte dĺžku odpovede
   )
   ```

4. **Škálujte na nulu, keď nie sú agenti používaní**
   ```bash
   # Kontajnerové aplikácie sa automaticky škálujú na nulu
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Riešenie problémov agentov

### Bežné problémy a riešenia

<details>
<summary><strong>❌ Agent nereaguje na volania nástrojov</strong></summary>

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
- Nesúlad v podpisoch funkcií nástrojov
- Chýbajúce potrebné povolenia
- API endpoint nie je dostupný
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
- Používajte streamovacie odpovede
- Implementujte cache odpovedí
- Zmenšite veľkosť kontextového okna
</details>

<details>
<summary><strong>❌ Agent vracia nesprávne alebo halucinované informácie</strong></summary>

```python
# Vylepšiť pomocou lepších systémových podnetov
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Pridať získavanie pre ukotvenie
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # Ukotviť odpovede v dokumentoch
)
```
</details>

<details>
<summary><strong>❌ Chyby z prekročenia limitu tokenov</strong></summary>

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
# Krok 1: Inicializovať šablónu
azd init --template get-started-with-ai-agents

# Krok 2: Prihlásiť sa do Azure
azd auth login
# Ak pracujete naprieč tenantmi, pridajte --tenant-id <tenant-id>

# Krok 3: Deploy
azd up

# Krok 4: Otestovať agenta
# Očakávaný výstup po nasadení:
#   Nasadenie dokončené!
#   Koncový bod: https://<app-name>.<region>.azurecontainerapps.io
# Otvorte URL zobrazenú vo výstupe a skúste položiť otázku

# Krok 5: Zobraziť monitorovanie
azd monitor --overview

# Krok 6: Upratať
azd down --force --purge
```

**Kritériá úspechu:**
- [ ] Agent odpovedá na otázky
- [ ] Má prístup k monitorovaciemu panelu cez `azd monitor`
- [ ] Zdroje sú úspešne vyčistené

### Cvičenie 2: Pridanie vlastného nástroja (30 minút)

**Cieľ:** Rozšíriť agenta o vlastný nástroj

1. Nasadte šablónu agenta:
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. Vytvorte novú funkciu nástroja vo vašom agentnom kóde:
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
4. Znovu nasadte a otestujte:
   ```bash
   azd deploy
   # Spýtajte sa: "Aké je počasie v Seattle?"
   # Očakávané: Agent zavolá get_weather("Seattle") a vráti informácie o počasí
   ```

**Kritériá úspechu:**
- [ ] Agent rozpoznáva otázky týkajúce sa počasia
- [ ] Nástroj je správne volaný
- [ ] Odpoveď obsahuje informácie o počasí

### Cvičenie 3: Vytvorenie RAG agenta (45 minút)

**Cieľ:** Vytvoriť agenta, ktorý odpovedá na otázky zo svojich dokumentov

```bash
# Krok 1: Nasadiť RAG šablónu
azd init --template azure-search-openai-demo
azd up

# Krok 2: Nahrať vaše dokumenty
# Umiestnite PDF/TXT súbory do adresára data/, potom spustite:
python scripts/prepdocs.py

# Krok 3: Otestujte s otázkami špecifickými pre doménu
# Otvorte URL webovej aplikácie z výstupu azd up
# Pýtajte sa otázky týkajúce sa vašich nahraných dokumentov
# Odpovede by mali obsahovať odkazy na citácie ako [doc.pdf]
```

**Kritériá úspechu:**
- [ ] Agent odpovedá na základe nahratých dokumentov
- [ ] Odpovede obsahujú citácie
- [ ] Žiadne halucinácie na otázky mimo dosahu

---

## 📚 Ďalšie kroky

Teraz, keď rozumiete AI agentom, preskúmajte tieto pokročilé témy:

| Téma | Popis | Odkaz |
|-------|-------------|------|
| **Multi-agentné systémy** | Vytvárajte systémy s viacerými spolupracujúcimi agentmi | [Príklad multi-agentného maloobchodu](../../examples/retail-scenario.md) |
| **Koordinačné vzory** | Naučte sa orchestru a komunikačné vzory | [Koordinačné vzory](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Produkčné nasadenie** | Nasadenie agentov pripravené pre podniky | [Produkčné AI praktiky](../chapter-08-production/production-ai-practices.md) |
| **Hodnotenie agentov** | Testujte a vyhodnocujte výkon agentov | [Riešenie problémov AI](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **AI Workshop Lab** | Prakticky: Pripravte svoje AI riešenie na AZD | [AI Workshop Lab](ai-workshop-lab.md) |

---

## 📖 Ďalšie zdroje

### Oficiálna dokumentácia
- [Microsoft Foundry Agent Service](https://learn.microsoft.com/azure/ai-services/agents/)
- [Microsoft Foundry Agent Service Rýchly štart](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel Agent Framework](https://learn.microsoft.com/semantic-kernel/)

### AZD šablóny pre agentov
- [Začnite s AI agentmi](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Komunitné zdroje
- [Awesome AZD - Šablóny agentov](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### Agentné schopnosti pre váš editor
- [**Microsoft Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Inštalujte znovu použiteľné AI schopnosti agentov pre vývoj v Azure v GitHub Copilot, Cursor alebo akomkoľvek podporovanom agente. Obsahuje schopnosti pre [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [nasadenie](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy) a [diagnostiku](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics):
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Navigácia**
- **Predchádzajúca lekcia**: [Integrácia Microsoft Foundry](microsoft-foundry-integration.md)
- **Ďalšia lekcia**: [Nasadenie AI modelu](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->