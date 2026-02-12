# AI agentai su Azure Developer CLI

**Skyriaus naršymas:**
- **📚 Kursų pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius - AI pirmumo vystymas
- **⬅️ Ankstesnis**: [AI modelių diegimas](ai-model-deployment.md)
- **➡️ Kitas**: [Produktinės AI praktikos](production-ai-practices.md)
- **🚀 Pažengusiems**: [Daugiagentės sprendimai](../../examples/retail-scenario.md)

---

## Įvadas

AI agentai yra autonominės programos, kurios gali suvokti savo aplinką, priimti sprendimus ir imtis veiksmų siekiant konkrečių tikslų. Skirtingai nei paprasti pokalbių robotai, kurie atsako į užklausas, agentai gali:

- **Naudoti įrankius** - kviesti API, ieškoti duomenų bazėse, vykdyti kodą
- **Planuoti ir samprotauti** - suskaidyti sudėtingas užduotis į žingsnius
- **Mokytis iš konteksto** - išlaikyti atmintį ir adaptuoti elgesį
- **Bendradarbiauti** - dirbti su kitais agentais (daugiagentės sistemos)

Šis vadovas parodo, kaip diegti AI agentus į Azure naudojant Azure Developer CLI (azd).

## Mokymosi tikslai

Baigę šį vadovą, jūs:
- Suprasite, kas yra AI agentai ir kuo jie skiriasi nuo pokalbių robotų
- Išmoksite diegti iš anksto paruoštus AI agentų šablonus naudojant AZD
- Konfigūruosite Foundry agentus pasirinktiniams agentams
- Įgyvendinsite pagrindinius agentų modelius (įrankų naudojimas, RAG, daugiagentė)
- Stebėsite ir derinsite diegtus agentus

## Mokymosi rezultatai

Baigę kursą, sugebėsite:
- Vienu komandos paleisti AI agentų programas į Azure
- Konfigūruoti agentų įrankius ir gebėjimus
- Įgyvendinti retrieval-augmented generation (RAG) su agentais
- Kurti daugiagentes architektūras sudėtingiems darbo srautams
- Spręsti dažniausias agentų diegimo problemas

---

## 🤖 Kuo agentas skiriasi nuo pokalbių roboto?

| Savybė | Pokalbių robotas | AI agentas |
|---------|---------|----------|
| **Elgsena** | Atsako į užklausas | Atlieka autonomiškus veiksmus |
| **Įrankiai** | Nėra | Gali kviesti API, ieškoti, vykdyti kodą |
| **Atmintis** | Tik sesijos pagrindu | Nuolatinė atmintis tarp sesijų |
| **Planavimas** | Vienkartinis atsakymas | Daugiapakopis samprotavimas |
| **Bendradarbiavimas** | Vienetas | Gali dirbti su kitais agentais |

### Paprastas palyginimas

- **Pokalbių robotas** = Naudingas asmuo, atsakinėjantis klausimus informacijos punkte
- **AI agentas** = Asmeninis asistentas, kuris gali skambinti, užsakyti susitikimus ir atlikti užduotis už jus

---

## 🚀 Greitas pradėjimas: Įdiekite savo pirmą agentą

### 1 variantas: Foundry agentų šablonas (rekomenduojama)

```bash
# Inicializuoti AI agentų šabloną
azd init --template get-started-with-ai-agents

# Diegti į Azure
azd up
```

**Kas diegiama:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (for RAG)
- ✅ Azure Container Apps (web interface)
- ✅ Application Insights (monitoring)

**Laikas:** ~15-20 minučių
**Kaina:** ~$100-150/month (development)

### 2 variantas: OpenAI agentas su Prompty

```bash
# Inicializuoti Prompty pagrįstą agento šabloną
azd init --template agent-openai-python-prompty

# Diegti į Azure
azd up
```

**Kas diegiama:**
- ✅ Azure Functions (serverless agent execution)
- ✅ Azure OpenAI
- ✅ Prompty configuration files
- ✅ Sample agent implementation

**Laikas:** ~10-15 minučių
**Kaina:** ~$50-100/month (development)

### 3 variantas: RAG pokalbių agentas

```bash
# Inicializuoti RAG pokalbio šabloną
azd init --template azure-search-openai-demo

# Diegti į Azure
azd up
```

**Kas diegiama:**
- ✅ Azure OpenAI
- ✅ Azure AI Search with sample data
- ✅ Document processing pipeline
- ✅ Chat interface with citations

**Laikas:** ~15-25 minučių
**Kaina:** ~$80-150/month (development)

---

## 🏗️ Agentų architektūros modeliai

### Modelis 1: Vienas agentas su įrankiais

Paprščiausias agento modelis – vienas agentas, galintis naudoti kelis įrankius.

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

**Tinka:**
- Klientų aptarnavimo botai
- Tyrimų asistentai
- Duomenų analizės agentai

**AZD šablonas:** `azure-search-openai-demo`

### Modelis 2: RAG agentas (Retrieval-Augmented Generation)

Agentas, kuris prieš generuodamas atsakymus ištraukia susijusius dokumentus.

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

**Tinka:**
- Įmonių žinių bazėms
- Dokumentų Q&A sistemoms
- Atitikties ir teisiniams tyrimams

**AZD šablonas:** `azure-search-openai-demo`

### Modelis 3: Daugiagentė sistema

Keli specializuoti agentai, dirbantys kartu sprendžiant sudėtingas užduotis.

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

**Tinka:**
- Sudėtingam turinio generavimui
- Daugiapakopiams darbo srautams
- Užduotims, reikalaujančioms skirtingos ekspertizės

**Sužinokite daugiau:** [Daugiagentės koordinavimo modeliai](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Agentų įrankių konfigūravimas

Agentai tampa galingi, kai gali naudoti įrankius. Štai kaip konfigūruoti dažniausius įrankius:

### Įrankių konfigūracija Foundry agentuose

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Apibrėžti pasirinktines priemones
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

# Sukurti agentą su priemonėmis
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Aplinkos konfigūracija

```bash
# Nustatyti agentui specifinius aplinkos kintamuosius
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Diegti su atnaujinta konfigūracija
azd deploy
```

---

## 📊 Agentų stebėjimas

### Application Insights integracija

Visi AZD agentų šablonai apima Application Insights stebėjimui:

```bash
# Atidaryti stebėjimo prietaisų skydelį
azd monitor --overview

# Peržiūrėti tiesioginius žurnalus
azd monitor --logs

# Peržiūrėti tiesiogines metrikas
azd monitor --live
```

### Svarbūs rodikliai stebėti

| Rodiklis | Aprašymas | Tikslas |
|--------|-------------|--------|
| Atsako uždelsimas | Laikas atsakymui sugeneruoti | < 5 sekundžių |
| Žetonų naudojimas | Žetonai per užklausą | Stebėti dėl kaštų |
| Įrankio kvietimų sėkmės rodiklis | % sėkmingų įrankio vykdymų | > 95% |
| Klaidų rodiklis | Nepavykusios agento užklausos | < 1% |
| Vartotojų pasitenkinimas | Atsiliepimų balai | > 4.0/5.0 |

### Tinkintas žurnalas agentams

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

## 💰 Išlaidų apsvarstymas

### Apytikslės mėnesinės išlaidos pagal modelį

| Modelis | Kūrimo aplinka | Produkcija |
|---------|-----------------|------------|
| Vienas agentas | $50-100 | $200-500 |
| RAG agentas | $80-150 | $300-800 |
| Daugiagentė (2-3 agentai) | $150-300 | $500-1,500 |
| Verslo daugiagentė | $300-500 | $1,500-5,000+ |

### Išlaidų optimizavimo patarimai

1. **Naudokite GPT-4o-mini paprastiems užduotims**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Įgyvendinkite talpinimą (caching) kartojamoms užklausoms**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Nustatykite žetonų limitus**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Apriboti atsakymo ilgį
   )
   ```

4. **Sumažinkite mastelį iki nulio, kai nenaudojama**
   ```bash
   # Container Apps automatiškai sumažina instancijų skaičių iki nulio
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Agentų trikčių šalinimas

### Dažnos problemos ir sprendimai

<details>
<summary><strong>❌ Agentas neatsako į įrankių kvietimus</strong></summary>

```bash
# Patikrinkite, ar įrankiai tinkamai užregistruoti
azd show

# Patikrinkite OpenAI diegimą
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Patikrinkite agento žurnalus
azd monitor --logs
```

**Dažniausios priežastys:**
- Įrankio funkcijos parašo neatitikimas
- Trūksta reikiamų leidimų
- API galinis taškas neprieinamas
</details>

<details>
<summary><strong>❌ Didelis vėlavimas agento atsakymuose</strong></summary>

```bash
# Patikrinkite Application Insights dėl našumo kliūčių
azd monitor --live

# Apsvarstykite galimybę naudoti greitesnį modelį
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Optimizavimo patarimai:**
- Naudokite srautinį atsakymų perdavimą
- Įgyvendinkite atsakymų talpinimą (cache)
- Sumažinkite konteksto lango dydį
</details>

<details>
<summary><strong>❌ Agentas pateikia neteisingą arba "halucinacinę" informaciją</strong></summary>

```python
# Pagerinti geresnėmis sistemos užuominomis
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Pridėti paieškos mechanizmą pagrindymui
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Pagrįsti atsakymus dokumentais
)
```
</details>

<details>
<summary><strong>❌ Klaidų dėl viršyto žetonų limito</strong></summary>

```python
# Įgyvendinti konteksto lango valdymą
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Apytikslis įvertinimas
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Praktinės užduotys

### Uždavinys 1: Įdiekite bazinį agentą (20 minučių)

**Tikslas:** Įdiegti savo pirmą AI agentą naudojant AZD

```bash
# Žingsnis 1: Inicializuokite šabloną
azd init --template get-started-with-ai-agents

# Žingsnis 2: Prisijunkite prie Azure
azd auth login

# Žingsnis 3: Įdiekite
azd up

# Žingsnis 4: Išbandykite agentą
# Atidarykite išvestyje parodytą URL adresą

# Žingsnis 5: Išvalykite
azd down --force --purge
```

**Sėkmės kriterijai:**
- [ ] Agentas atsako į klausimus
- [ ] Gali pasiekti stebėjimo skydelį
- [ ] Ištekliai sėkmingai išvalyti

### Uždavinys 2: Pridėti pasirinktą įrankį (30 minučių)

**Tikslas:** Išplėsti agentą pasirinktiniu įrankiu

1. Įdiekite agento šabloną
2. Sukurkite naują įrankio funkciją:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # API užklausa orų tarnybai
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Užregistruokite įrankį agentui
4. Išbandykite, ar agentas naudoja naują įrankį

**Sėkmės kriterijai:**
- [ ] Agentas atpažįsta su oru susijusius užklausimus
- [ ] Įrankis kviečiamas tinkamai
- [ ] Atsakyme yra oro informacija

### Uždavinys 3: Sukurkite RAG agentą (45 minutės)

**Tikslas:** Sukurti agentą, kuris atsako į klausimus iš jūsų dokumentų

```bash
# Diegti RAG šabloną
azd init --template azure-search-openai-demo
azd up

# Įkelkite savo dokumentus
# (Laikykitės šablono duomenų įkėlimo gairių)

# Išbandykite su konkrečios srities klausimais
```

**Sėkmės kriterijai:**
- [ ] Agentas atsako remdamasis įkeltomis bylos
- [ ] Atsakymai turi citatas
- [ ] Nėra halucinacijų atsakant į užklausas už aprėpties ribų

---

## 📚 Tolimesni žingsniai

Dabar, kai suprantate AI agentus, tyrinėkite šias pažengusias temas:

| Tema | Aprašymas | Nuoroda |
|-------|-------------|------|
| **Daugiagentės sistemos** | Kurkite sistemas su keliais bendradarbiaujančiais agentais | [Mažmeninės prekybos daugiagentės pavyzdys](../../examples/retail-scenario.md) |
| **Koordinavimo modeliai** | Sužinokite apie orkestravimo ir komunikacijos modelius | [Koordinavimo modeliai](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Diegimas produkcijoje** | Agentų diegimas verslo aplinkoje | [Produktinės AI praktikos](production-ai-practices.md) |
| **Agentų vertinimas** | Testuoti ir įvertinti agento našumą | [AI trikčių šalinimas](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Papildomi ištekliai

### Oficialioji dokumentacija
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD šablonai agentams
- [Pradėkite dirbti su AI agentais](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Bendruomenės ištekliai
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigacija**
- **Ankstesnė pamoka**: [AI modelių diegimas](ai-model-deployment.md)
- **Kita pamoka**: [Produktinės AI praktikos](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės atsisakymas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojamas profesionalus žmogaus atliktas vertimas. Mes neatsakome už bet kokius nesusipratimus ar neteisingus aiškinimus, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->