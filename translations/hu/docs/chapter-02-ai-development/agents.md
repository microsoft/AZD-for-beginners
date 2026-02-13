# AI-ügynökök az Azure Developer CLI-vel

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 2. fejezet - AI-első fejlesztés
- **⬅️ Előző**: [AI modell telepítése](ai-model-deployment.md)
- **➡️ Következő**: [AI éles gyakorlatok](production-ai-practices.md)
- **🚀 Haladó**: [Többügynökös megoldások](../../examples/retail-scenario.md)

---

## Bevezetés

Az AI-ügynökök autonóm programok, amelyek képesek érzékelni a környezetüket, döntéseket hozni és műveleteket végrehajtani meghatározott célok elérése érdekében. Ellentétben az egyszerű csevegőbotokkal, amelyek válaszolnak a kérésekre, az ügynökök képesek:

- **Eszközök használata** - API-k hívása, adatbázisok keresése, kód végrehajtása
- **Tervezés és érvelés** - Bonyolult feladatok lépésekre bontása
- **Tanulás a kontextusból** - Memória fenntartása és viselkedés adaptálása
- **Együttműködés** - Munkavégzés más ügynökökkel (többügynökös rendszerek)

Ez az útmutató megmutatja, hogyan telepíts AI-ügynököket Azure-ra az Azure Developer CLI (azd) segítségével.

## Tanulási célok

A útmutató elvégzése után képes leszel:
- Megérteni, mik az AI-ügynökök és miben különböznek a chatbotoktól
- Előre elkészített AI-ügynök sablonok telepítése AZD-vel
- Foundry ügynökök konfigurálása egyedi ügynökökhöz
- Alapvető ügynökminták megvalósítása (eszközhasználat, RAG, többügynök)
- Telepített ügynökök monitorozása és hibakeresése

## Tanulási eredmények

A befejezés után képes leszel:
- Egy parancssal ügynök alkalmazásokat telepíteni Azure-ra
- Konfigurálni az ügynök eszközeit és képességeit
- Megvalósítani retrieval-augmented generation (RAG) ügynökökkel
- Többügynökös architektúrák tervezése összetett munkafolyamatokhoz
- Hétköznapi ügynök telepítési problémák elhárítása

---

## 🤖 Miben különbözik egy ügynök egy chatbottól?

| Jellemző | Chatbot | AI-ügynök |
|---------|---------|----------|
| **Viselkedés** | Válaszol a kérésekre | Autonóm műveleteket hajt végre |
| **Eszközök** | Nincs | Képes API-kat hívni, keresni és kódot futtatni |
| **Memória** | Csak munkamenet alapú | Tartós memória a munkamenetek között |
| **Tervezés** | Egy válasz | Többlépéses érvelés |
| **Együttműködés** | Egyetlen entitás | Képes együttműködni más ügynökökkel |

### Egyszerű analógia

- **Chatbot** = Egy segítőkész személy, aki az információs pultnál válaszol a kérdésekre
- **AI-ügynök** = Egy személyi asszisztens, aki felhív, időpontot foglal és elvégzi a feladatokat helyetted

---

## 🚀 Gyors kezdés: Telepítsd az első ügynöködet

### Opció 1: Foundry Agents sablon (ajánlott)

```bash
# AI-ügynökök sablonjának inicializálása
azd init --template get-started-with-ai-agents

# Telepítés az Azure-ba
azd up
```

**Mi települ:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (RAG-hez)
- ✅ Azure Container Apps (webes felület)
- ✅ Application Insights (monitorozás)

**Idő:** ~15-20 perc
**Költség:** ~$100-150/hó (fejlesztés)

### Opció 2: OpenAI-ügynök Prompty-vel

```bash
# Inicializálja a Prompty-alapú ügynök sablont
azd init --template agent-openai-python-prompty

# Telepítés Azure-ra
azd up
```

**Mi települ:**
- ✅ Azure Functions (szerver nélküli ügynök végrehajtás)
- ✅ Azure OpenAI
- ✅ Prompty konfigurációs fájlok
- ✅ Minta ügynök implementáció

**Idő:** ~10-15 perc
**Költség:** ~$50-100/hó (fejlesztés)

### Opció 3: RAG chat ügynök

```bash
# RAG csevegő sablon inicializálása
azd init --template azure-search-openai-demo

# Telepítés Azure-ra
azd up
```

**Mi települ:**
- ✅ Azure OpenAI
- ✅ Azure AI Search minta adatokkal
- ✅ Dokumentumfeldolgozó pipeline
- ✅ Chat felület hivatkozásokkal

**Idő:** ~15-25 perc
**Költség:** ~$80-150/hó (fejlesztés)

---

## 🏗️ Ügynök-architektúra minták

### Minta 1: Egyetlen ügynök eszközökkel

A legegyszerűbb ügynökminta - egy ügynök, amely több eszközt is használhat.

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

**Legalkalmasabb:**
- Ügyfélszolgálati botok
- Kutatási asszisztensek
- Adatelemző ügynökök

**AZD sablon:** `azure-search-openai-demo`

### Minta 2: RAG-ügynök (Retrieval-Augmented Generation)

Egy ügynök, amely releváns dokumentumokat keres, mielőtt választ generálna.

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

**Legalkalmasabb:**
- Vállalati tudásbázisok
- Dokumentum Kérdés-Válasz rendszerek
- Megfelelőség és jogi kutatás

**AZD sablon:** `azure-search-openai-demo`

### Minta 3: Többügynökös rendszer

Több, specializált ügynök együttműködése összetett feladatokon.

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

**Legalkalmasabb:**
- Összetett tartalomgenerálás
- Többlépcsős munkafolyamatok
- Különböző szakértelmet igénylő feladatok

**Tudj meg többet:** [Többügynökös koordinációs minták](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Ügynök eszközök konfigurálása

Az ügynökök akkor válnak erőssé, ha eszközöket tudnak használni. Íme, hogyan konfigurálhatod a gyakori eszközöket:

### Eszközkonfiguráció a Foundry ügynökökben

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Egyedi eszközök definiálása
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

# Ügynök létrehozása eszközökkel
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Környezeti konfiguráció

```bash
# Állítsa be az ügynökre jellemző környezeti változókat
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Telepítse a frissített konfigurációval
azd deploy
```

---

## 📊 Ügynökök monitorozása

### Application Insights integráció

Minden AZD ügynök sablon tartalmazza az Application Insights-ot a monitorozáshoz:

```bash
# Monitoring irányítópult megnyitása
azd monitor --overview

# Élő naplók megtekintése
azd monitor --logs

# Élő metrikák megtekintése
azd monitor --live
```

### Követendő kulcsmetrikák

| Mutató | Leírás | Cél |
|--------|-------------|--------|
| Válasz késleltetés | Válasz generálásának ideje | < 5 másodperc |
| Tokenhasználat | Tokenek kérésenként | Költség figyelése |
| Eszközhívások sikerességi aránya | % sikeres eszközvégrehajtások | > 95% |
| Hibaarány | Sikertelen ügynök kérések | < 1% |
| Felhasználói elégedettség | Visszajelzési pontszámok | > 4.0/5.0 |

### Egyedi naplózás az ügynökök számára

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

## 💰 Költségmegfontolások

### Becsült havi költségek minták szerint

| Minta | Fejlesztői környezet | Éles üzem |
|---------|-----------------|------------|
| Egy ügynök | $50-100 | $200-500 |
| RAG ügynök | $80-150 | $300-800 |
| Többügynök (2-3 ügynök) | $150-300 | $500-1,500 |
| Vállalati többügynök | $300-500 | $1,500-5,000+ |

### Költségoptimalizálási tippek

1. **Használd a GPT-4o-mini-t egyszerű feladatokhoz**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Gyorsítótárazás megvalósítása ismétlődő lekérdezésekhez**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Tokenkorlátok beállítása**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Korlátozd a válasz hosszát
   )
   ```

4. **Skálázás nullára, amikor nincs használatban**
   ```bash
   # Container Apps automatikusan nullára skálázódik
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Ügynökök hibakeresése

### Gyakori problémák és megoldások

<details>
<summary><strong>❌ Az ügynök nem válaszol az eszközhívásokra</strong></summary>

```bash
# Ellenőrizze, hogy az eszközök megfelelően vannak-e regisztrálva
azd show

# Ellenőrizze az OpenAI telepítését
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Ellenőrizze az ügynök naplóit
azd monitor --logs
```

**Gyakori okok:**
- Az eszközfüggvény aláírása nem egyezik
- Hiányzó szükséges jogosultságok
- Az API végpont nem elérhető
</details>

<details>
<summary><strong>❌ Magas késleltetés az ügynök válaszaiban</strong></summary>

```bash
# Ellenőrizze az Application Insightsban a szűk keresztmetszeteket
azd monitor --live

# Fontolja meg gyorsabb modell használatát
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Optimalizálási tippek:**
- Használj streaming válaszokat
- Alkalmazz válasz gyorsítótárazást
- Csökkentsd a kontextusablak méretét
</details>

<details>
<summary><strong>❌ Az ügynök hibás vagy kitalált információt ad vissza</strong></summary>

```python
# Javítsa jobb rendszerutasításokkal
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Adjon hozzá visszakeresést a megalapozáshoz
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Alapozza a válaszokat dokumentumokra
)
```
</details>

<details>
<summary><strong>❌ Tokenkorlát túllépése miatti hibák</strong></summary>

```python
# Kontextusablak-kezelés megvalósítása
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Durva becslés
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Gyakorlati feladatok

### Feladat 1: Alap ügynök telepítése (20 perc)

**Cél:** Telepítsd az első AI-ügynöködet AZD használatával

```bash
# 1. lépés: Inicializálja a sablont
azd init --template get-started-with-ai-agents

# 2. lépés: Jelentkezzen be az Azure-ba
azd auth login

# 3. lépés: Telepítse
azd up

# 4. lépés: Tesztelje az ügynököt
# Nyissa meg a kimenetben megjelenő URL-t

# 5. lépés: Takarítsa el a létrehozott erőforrásokat
azd down --force --purge
```

**Siker kritériumok:**
- [ ] Az ügynök válaszol a kérdésekre
- [ ] Hozzáfér a monitorozó irányítópulthoz
- [ ] Az erőforrások sikeresen megtisztítva

### Feladat 2: Egy egyedi eszköz hozzáadása (30 perc)

**Cél:** Bővítsd az ügynököt egy egyedi eszközzel

1. Telepítsd az ügynök sablont
2. Hozz létre egy új eszközfüggvényt:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # API-hívás az időjárási szolgáltatáshoz
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Regisztráld az eszközt az ügynöknél
4. Teszteld, hogy az ügynök használja az új eszközt

**Siker kritériumok:**
- [ ] Az ügynök felismeri az időjárással kapcsolatos lekérdezéseket
- [ ] Az eszköz helyesen van meghívva
- [ ] A válasz tartalmazza az időjárási információt

### Feladat 3: RAG ügynök építése (45 perc)

**Cél:** Hozz létre egy ügynököt, amely a dokumentumaidból válaszol kérdésekre

```bash
# Telepítse a RAG-sablont
azd init --template azure-search-openai-demo
azd up

# Töltse fel a dokumentumait
# (Kövesse a sablon adatbetöltési útmutatóját)

# Tesztelje szakterületspecifikus kérdésekkel
```

**Siker kritériumok:**
- [ ] Az ügynök a feltöltött dokumentumokból válaszol
- [ ] A válaszok idézeteket tartalmaznak
- [ ] Nincs kitalált válasz a hatókörön kívüli kérdésekre

---

## 📚 Következő lépések

Most, hogy érted az AI-ügynököket, fedezd fel ezeket a haladó témákat:

| Téma | Leírás | Link |
|-------|-------------|------|
| **Többügynökös rendszerek** | Építs rendszereket több, együttműködő ügynökkel | [Kiskereskedelmi többügynökös példa](../../examples/retail-scenario.md) |
| **Koordinációs minták** | Tanuld meg az orkesztrációs és kommunikációs mintákat | [Koordinációs minták](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Éles üzembe helyezés** | Vállalati szintű ügynök telepítés | [AI éles gyakorlatok](production-ai-practices.md) |
| **Ügynökértékelés** | Teszteld és értékeld az ügynök teljesítményét | [AI hibakeresés](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 További források

### Hivatalos dokumentáció
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD sablonok ügynökökhöz
- [Kezdd el AI-ügynökökkel](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI demó](https://github.com/Azure-Samples/azure-search-openai-demo)

### Közösségi források
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigáció**
- **Előző lecke**: [AI modell telepítése](ai-model-deployment.md)
- **Következő lecke**: [AI éles gyakorlatok](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Felelősségkizárás:
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) mesterséges intelligencia alapú fordítószolgáltatás segítségével készült. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti, anyanyelvi változat tekintendő a hiteles forrásnak. Fontos információk esetén szakmai, emberi fordítás igénybevételét javasoljuk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ezen fordítás használatából ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->