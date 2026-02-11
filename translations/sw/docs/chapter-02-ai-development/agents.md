# Wakala wa AI na Azure Developer CLI

**Urambazaji wa Sura:**
- **📚 Nyumbani wa Kozi**: [AZD For Beginners](../../README.md)
- **📖 Sura ya Sasa**: Sura 2 - Maendeleo ya AI Kwanza
- **⬅️ Iliyotangulia**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Ifuatayo**: [Production AI Practices](production-ai-practices.md)
- **🚀 Kwa Wanaoendelea**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## Utangulizi

Wakala wa AI ni programu za kujitegemea ambazo zinaweza kuona mazingira yao, kufanya maamuzi, na kuchukua hatua ili kufikia malengo maalum. Tofauti na chatbots rahisi zinazojibu maagizo, wakala wanaweza:

- **Tumia zana** - Kuita API, kutafuta kwenye hifadhidata, kutekeleza msimbo
- **Panga na kufikiria** - Gawanya kazi ngumu katika hatua
- **Jifunze kutoka kwa muktadha** - Hifadhi kumbukumbu na kubadilisha tabia
- **Shirikiana** - Fanya kazi na wakala wengine (mifumo ya mawakala wengi)

Mwongozo huu unaonyesha jinsi ya kupeleka mawakala wa AI kwenye Azure kwa kutumia Azure Developer CLI (azd).

## Malengo ya Kujifunza

Kwa kumaliza mwongozo huu, utakuwa na uwezo wa:
- Kuelewa ni wakala wa AI ni nini na jinsi wanavyojitofautisha na chatbots
- Kuweka kiolezo za wakala zilizotengenezwa tayari kwa kutumia AZD
- Kusanidi Foundry Agents kwa mawakala maalum
- Kutekeleza mifumo ya msingi ya wakala (matumizi ya zana, RAG, mawakala wengi)
- Kufuatilia na kutatua matatizo ya mawakala yaliyowekwa

## Matokeo ya Kujifunza

Baada ya kumaliza, utakuwa na uwezo wa:
- Kuweka programu za wakala wa AI kwenye Azure kwa amri moja
- Kusanidi zana na uwezo wa wakala
- Kutekeleza retrieval-augmented generation (RAG) pamoja na mawakala
- Kubuni miundo ya mawakala wengi kwa shughuli ngumu
- Kutatua matatizo ya kawaida ya uenezaji wa wakala

---

## 🤖 Nini Kifanya Wakala Atofautiane na Chatbot?

| Sifa | Chatbot | Wakala wa AI |
|---------|---------|----------|
| **Tabia** | Hujibu maagizo | Huchukua vitendo kwa uhuru |
| **Zana** | Hakuna | Inaweza kuita APIs, kutafuta, kutekeleza msimbo |
| **Kumbukumbu** | Inategemea vikao pekee | Kumbukumbu endelevu kati ya vikao |
| **Mipango** | Jibu moja | Kufikiri kwa hatua nyingi |
| **Ushirikiano** | Kitu kimoja | Inaweza kufanya kazi na wakala wengine |

### Mfano Rahisi

- **Chatbot** = Mtu msaidizi anayesaidia kujibu maswali kwenye dawati la taarifa
- **Wakala wa AI** = Msaidizi wa kibinafsi anayeeza kupiga simu, kuweka miadi, na kukamilisha kazi kwa niaba yako

---

## 🚀 Anza Haraka: Weka Wakala Wako wa Kwanza

### Chaguo 1: Kiolezo cha Wakala Foundry (Kinachopendekezwa)

```bash
# Anzisha kiolezo cha mawakala wa AI
azd init --template get-started-with-ai-agents

# Sambaza kwenye Azure
azd up
```

**Vinavyowekwa:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (kwa RAG)
- ✅ Azure Container Apps (kiolesura cha wavuti)
- ✅ Application Insights (ufuatiliaji)

**Muda:** ~15-20 dakika
**Gharama:** ~$100-150/mwezi (maendeleo)

### Chaguo 2: Wakala wa OpenAI kwa Prompty

```bash
# Anzisha kiolezo cha wakala kinategemea Prompty
azd init --template agent-openai-python-prompty

# Sambaza kwenye Azure
azd up
```

**Vinavyowekwa:**
- ✅ Azure Functions (utekelezaji wa wakala usio na seva)
- ✅ Azure OpenAI
- ✅ Faili za usanidi za Prompty
- ✅ Utekelezaji wa wakala wa sampuli

**Muda:** ~10-15 dakika
**Gharama:** ~$50-100/mwezi (maendeleo)

### Chaguo 3: Wakala wa Chat wa RAG

```bash
# Anzisha kiolezo cha mazungumzo cha RAG
azd init --template azure-search-openai-demo

# Sambaza kwenye Azure
azd up
```

**Vinavyowekwa:**
- ✅ Azure OpenAI
- ✅ Azure AI Search na data ya sampuli
- ✅ Mtiririko wa usindikaji wa hati
- ✅ Kiolesura cha chat chenye rejea

**Muda:** ~15-25 dakika
**Gharama:** ~$80-150/mwezi (maendeleo)

---

## 🏗️ Mifumo ya Muundo wa Wakala

### Mfano 1: Wakala Mmoja Anayetumia Zana

Mfano rahisi kabisa - wakala mmoja anayeeza kutumia zana nyingi.

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

**Bora kwa:**
- Bot za msaada wa wateja
- Wasaidizi wa utafiti
- Mawakala wa uchambuzi wa data

**AZD Template:** `azure-search-openai-demo`

### Mfano 2: Wakala wa RAG (Uundaji ulioboreshwa kwa urejeaji)

Wakala anayerejesha nyaraka zinazofaa kabla ya kuzalisha majibu.

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

**Bora kwa:**
- Hifadhidata za maarifa za kampuni
- Mifumo ya Q&A ya nyaraka
- Utafiti wa mwenendo wa uzingatiaji na sheria

**AZD Template:** `azure-search-openai-demo`

### Mfano 3: Mfumo wa Wakala Wengi

Mawakala maalum kadhaa wakishirikiana kwenye kazi ngumu.

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

**Bora kwa:**
- Uundaji wa maudhui ngumu
- Mitiririko ya kazi ya hatua nyingi
- Kazi zinazohitaji utaalamu tofauti

**Jifunze Zaidi:** [Mifumo ya Uratibu ya Wakala Wengi](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Kusanidi Zana za Wakala

Wakala wanakuwa wenye nguvu wanapoweza kutumia zana. Hapa ni jinsi ya kusanidi zana za kawaida:

### Usanidi wa Zana katika Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Fafanua zana maalum
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

# Unda wakala na zana
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Usanidi wa Mazingira

```bash
# Sanidi vigezo vya mazingira maalum kwa wakala
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Sambaza kwa usanidi uliosasishwa
azd deploy
```

---

## 📊 Kufuatilia Wakala

### Uunganisho wa Application Insights

Kiolezo zote za wakala za AZD zinajumuisha Application Insights kwa ajili ya ufuatiliaji:

```bash
# Fungua dashibodi ya ufuatiliaji
azd monitor --overview

# Tazama kumbukumbu za moja kwa moja
azd monitor --logs

# Tazama vipimo vya moja kwa moja
azd monitor --live
```

### Vipimo Muhimu vya Kufuatilia

| Kipimo | Maelezo | Lengo |
|--------|-------------|--------|
| Ucheleweshaji wa Majibu | Muda wa kuzalisha jibu | < 5 sekunde |
| Matumizi ya Tokeni | Tokeni kwa kila ombi | Fuatilia kwa gharama |
| Kiwango cha Mafanikio ya miito ya zana | % ya utekelezaji wa zana uliofanikiwa | > 95% |
| Kiwango cha Makosa | Maombi ya wakala yaliyoshindwa | < 1% |
| Kuridhika kwa Mtumiaji | Alama za mrejesho | > 4.0/5.0 |

### Uandikishaji Maalum kwa Wakala

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

## 💰 Mambo ya Kuzingatia Gharama

### Makadirio ya Gharama za Kila Mwezi kwa Kifano

| Mfano | Mazingira ya Maendeleo | Uzalishaji |
|---------|-----------------|------------|
| Wakala Mmoja | $50-100 | $200-500 |
| Wakala wa RAG | $80-150 | $300-800 |
| Wakala Wengi (mawakala 2-3) | $150-300 | $500-1,500 |
| Wakala Wengi wa Shirika | $300-500 | $1,500-5,000+ |

### Vidokezo vya Kupunguza Gharama

1. **Tumia GPT-4o-mini kwa kazi rahisi**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Tekeleza caching kwa maswali yanayojirudia**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Weka mipaka ya tokeni**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Punguza urefu wa majibu
   )
   ```

4. **Punguza hadi sifuri wakati haitumiki**
   ```bash
   # Container Apps zinaweza kupungua hadi sifuri kiotomatiki
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Utatuzi wa Matatizo ya Wakala

### Masuala ya Kawaida na Suluhisho

<details>
<summary><strong>❌ Wakala haiajibu miito ya zana</strong></summary>

```bash
# Angalia ikiwa zana zimesajiliwa kwa usahihi
azd show

# Thibitisha uanzishaji wa OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Angalia kumbukumbu za wakala
azd monitor --logs
```

**Sababu za kawaida:**
- Muafaka wa saini ya kazi ya zana haiko sawa
- Ruhusa zinazohitajika hazipo
- API endpoint hakipatikani
</details>

<details>
<summary><strong>❌ Ucheleweshaji mkubwa katika majibu ya wakala</strong></summary>

```bash
# Kagua Application Insights kwa vikwazo vya utendaji
azd monitor --live

# Fikiria kutumia modeli ya haraka zaidi
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Vidokezo vya uboreshaji:**
- Tumia majibu ya mtiririko
- Tekeleza caching ya majibu
- Punguza ukubwa wa dirisha la muktadha
</details>

<details>
<summary><strong>❌ Wakala arudisha taarifa zisizo sahihi au za kutobuni</strong></summary>

```python
# Boresha kwa maagizo bora ya mfumo
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Ongeza utafutaji kwa ajili ya kuweka msingi
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Tegemeza majibu kwa nyaraka
)
```
</details>

<details>
<summary><strong>❌ Makosa ya mipaka ya tokeni kuzidiwa</strong></summary>

```python
# Tekeleza usimamizi wa dirisha la muktadha
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Makadirio ya karibu
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Mazoezi ya Vitendo

### Mazoezi 1: Weka Wakala Msingi (dakika 20)

**Lengo:** Weka wakala wako wa kwanza wa AI kwa kutumia AZD

```bash
# Hatua 1: Anzisha kiolezo
azd init --template get-started-with-ai-agents

# Hatua 2: Ingia kwenye Azure
azd auth login

# Hatua 3: Sambaza
azd up

# Hatua 4: Jaribu wakala
# Fungua URL iliyonyeshwa kwenye matokeo

# Hatua 5: Safisha
azd down --force --purge
```

**Vigezo vya Mafanikio:**
- [ ] Wakala anajibu maswali
- [ ] Anaweza kufikia dashibodi ya ufuatiliaji
- [ ] Rasilimali zilisafishwa kwa mafanikio

### Mazoezi 2: Ongeza Zana Maalum (dakika 30)

**Lengo:** Panua wakala kwa zana maalum

1. Weka kiolezo cha wakala
2. Tengeneza kazi mpya ya zana:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Mwito wa API kwa huduma ya hali ya hewa
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Sajili zana na wakala
4. Thibitisha kwamba wakala anatumia zana mpya

**Vigezo vya Mafanikio:**
- [ ] Wakala anatambua maswali yanayohusiana na hali ya hewa
- [ ] Zana inaitwa kwa usahihi
- [ ] Jibu linajumuisha taarifa za hali ya hewa

### Mazoezi 3: Tengeneza Wakala wa RAG (dakika 45)

**Lengo:** Unda wakala anayejibu maswali kutoka kwa nyaraka zako

```bash
# Weka kiolezo cha RAG
azd init --template azure-search-openai-demo
azd up

# Pakia nyaraka zako
# (Fuata mwongozo wa kiolezo wa kuingiza data)

# Jaribu kwa maswali maalumu ya eneo husika
```

**Vigezo vya Mafanikio:**
- [ ] Wakala anajibu kutoka kwa nyaraka zilizo_upload
- [ ] Majibu yanajumuisha rejea
- [ ] Hakuna kutobuni kwa maswali yasiyo ndani ya wigo

---

## 📚 Hatua Zifuatazo

Sasa kwani umeelewa wakala wa AI, chunguza mada hizi za juu:

| Mada | Maelezo | Kiungo |
|-------|-------------|------|
| **Mifumo ya Wakala Wengi** | Jenga mifumo yenye mawakala wengi wanaoshirikiana | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Mifumo ya Uratibu** | Jifunze uratibu na mifumo ya mawasiliano | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Utoaji wa Uzalishaji** | Uenezaji wa wakala kwa uzalishaji | [Production AI Practices](production-ai-practices.md) |
| **Tathmini ya Wakala** | Jaribu na tathmini utendaji wa wakala | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Rasilimali Zingine

### Nyaraka Rasmi
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### Violezo vya AZD kwa Wakala
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Rasilimali za Jamii
- [AZD Bora - Violezo vya Wakala](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Discord ya Azure AI](https://discord.gg/microsoft-azure)
- [Discord ya Microsoft Foundry](https://discord.gg/nTYy5BXMWG)

---

**Urambazaji**
- **Somo Lililotangulia**: [AI Model Deployment](ai-model-deployment.md)
- **Somo Lifuatao**: [Production AI Practices](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Taarifa ya kutokuwajibika:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri zilizofanywa kwa mashine zinaweza kuwa na makosa au ukosefu wa usahihi. Nakala ya awali katika lugha yake ya asili inapaswa kutambuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inashauriwa kutumia tafsiri ya mtaalamu wa binadamu. Hatujawajibiki kwa kutoelewana au tafsiri mbaya zitokanazo na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->