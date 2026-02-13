# Azure Developer CLI உடன் AI முகவர்கள்

**அத்தியாயம் வழிசெலுத்தல்:**
- **📚 Course Home**: [ஆரம்பநிலையோருக்கான AZD](../../README.md)
- **📖 Current Chapter**: அத்தியாயம் 2 - AI-முதன்மை மேம்பாடு
- **⬅️ Previous**: [AI மாதிரி நிலைநாட்டல்](ai-model-deployment.md)
- **➡️ Next**: [தயாரிப்பு AI நடைமுறைகள்](production-ai-practices.md)
- **🚀 Advanced**: [பல-முகவர் தீர்வுகள்](../../examples/retail-scenario.md)

---

## அறிமுகம்

AI முகவர்கள் தன்னாட்சி இயக்கங்களாகும்; தங்களை சுற்றிய சூழலை உணர்ந்து, முடிவுகள் எடுத்து, குறிப்பிட்ட இலக்குகளை அடைவதற்காக செயல்களை மேற்கொள்கின்றனர். எளிமையான கேள்வி-பதில் ரோபோக்களை விட, முகவர்கள்:

- **கருவிகளை பயன்படுத்தும் திறன்** - APIs-ஐ அழைக்க, தரவுத்தளங்களை தேட, குறியீடுகளை இயக்க
- **திட்டமிடுதல் மற்றும் காரணமாய் சிந்தித்தல்** - சிக்கலான பணிகளை படிநிலைகளாகப் பிரிக்க
- **சூழ்நிலையிலிருந்து கற்றல்** - நினைவைக் கொண்டிருக்கவும் நடத்தை அடையாளம் காணவும்
- **ஒத்துழைப்பு** - பிற முகவர்களுடன் வேலைசெய்தல் (பல-முகவர் முறைமைகள்)

இந்த வழிகாட்டி Azure Developer CLI (azd) மூலம் AI முகவர்களை Azure-ல் நிறுவுவதைக் காட்டுகிறது.

## கற்றல் இலக்குகள்

இந்த வழிகாட்டியை முடித்தவுடன், நீங்கள்:
- AI முகவர்கள் என்ன என்றும் அவை சாட்பாட்டிலிருந்து எவ்வாறு வேறுபடுகின்றன என்பதைக் கேள்வி கேட்கலாம்
- AZD பயன்படுத்தி முன்பே உருவாக்கப்பட்ட AI முகவர் வார்ப்புருக்களை நிறுவலாம்
- Foundry Agents-ஐ தனிப்பயன் முகவர்களுக்காக கட்டமைக்கலாம்
- அடிப்படை முகவர் வடிவங்கள் (கருவி பயன்பாடு, RAG, பல-முகவர்) செயல்படுத்தலாம்
- நிறுவப்பட்ட முகவர்களை கண்காணித்து பிழைகளை தீர்க்கலாம்

## கற்றல் முடிவுகள்

முடிந்ததும், நீங்கள் இதைச் செய்ய முடியும்:
- ஒரே கட்டளையால் AI முகவர் பயன்பாடுகளை Azure-இல் நிறுவ முடியும்
- முகவர் கருவிகள் மற்றும் திறன்களை கட்டமைக்க முடியும்
- முகவர்களுடன் retrieval-augmented generation (RAG) ஐ செயல்படுத்த முடியும்
- சிக்கலான வேலைப்பாடுகளுக்காக பல-முகவர் வடிவமைப்புகளை வடிவமைக்க முடியும்
- பொதுவான முகவர் நிறுவல் சிக்கல்களை தீர்க்க முடியும்

---

## 🤖 சாட்பாட்டிலிருந்து முகவர் எப்படி வேறுப்படுகிறது?

| அம்சம் | சாட்பாட் | AI முகவர் |
|---------|---------|----------|
| **நடத்தை** | கேள்விகளுக்கு பதிலளிக்கும் | தன்னாட்சி செயல்களை மேற்கொள்கிறது |
| **கருவிகள்** | இல்லை | APIs-ஐ அழைக்கலாம், தேடலாம், குறியீடுகளை இயக்கலாம் |
| **நினைவு** | அமர்வு அடிப்படையிலேயே மட்டுமே | அமர்வுகளுக்கு மத்தியில் நிலையான நினைவு |
| **திட்டமிடல்** | ஒரு பதில் | பல படிகளான யூகச்சிந்தனை |
| **ஒத்துழைப்பு** | தனிப்பணியாளர் | பிற முகவர்களுடன் வேலை செய்யக்கூடும் |

### எளிய ஒப்பமுறை

- **சாட்பாட்** = தகவல் மேசையில் கேள்விகளுக்கு பதில் அளிக்கும் ஒரு உதவியாளர்
- **AI முகவர்** = அழைப்புகளை ஏற்பாடு செய்யவும், சந்திப்புகளை பதிவு செய்யவும், அல்லது பணிகளை முடிக்கவும் கூடிய ஒரு தனிப்பட்ட உதவியாளர்

---

## 🚀 விரைவு தொடக்கம்: உங்கள் முதல் முகவரை நிறுவுதல்

### தேர்வு 1: Foundry Agents வார்ப்புரு (பரிந்துரைக்கப்படுகிறது)

```bash
# AI முகவர்கள் வார்ப்புருவை துவக்கவும்
azd init --template get-started-with-ai-agents

# Azure-க்கு வெளியிடவும்
azd up
```

**என்ன நிறுவப்படுகிறது:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (for RAG)
- ✅ Azure Container Apps (web interface)
- ✅ Application Insights (monitoring)

**காலம்:** ~15-20 நிமிடங்கள்
**செலவு:** ~ $100-150/மாதம் (வளர்ச்சி)

### தேர்வு 2: Prompty உடன் OpenAI முகவர்

```bash
# Prompty அடிப்படையிலான முகவர் வார்ப்புருவை துவக்கவும்
azd init --template agent-openai-python-prompty

# Azure-க்கு வெளியிடவும்
azd up
```

**என்ன நிறுவப்படுகிறது:**
- ✅ Azure Functions (serverless agent execution)
- ✅ Azure OpenAI
- ✅ Prompty configuration files
- ✅ Sample agent implementation

**காலம்:** ~10-15 நிமிடங்கள்
**செலவு:** ~ $50-100/மாதம் (வளர்ச்சி)

### தேர்வு 3: RAG உரையாடல் முகவர்

```bash
# RAG உரையாடல் வார்ப்புருவை ஆரம்பிக்கவும்
azd init --template azure-search-openai-demo

# Azure-க்கு வெளியிடவும்
azd up
```

**என்ன நிறுவப்படுகிறது:**
- ✅ Azure OpenAI
- ✅ Azure AI Search with sample data
- ✅ Document processing pipeline
- ✅ Chat interface with citations

**காலம்:** ~15-25 நிமிடங்கள்
**செலவு:** ~ $80-150/மாதம் (வளர்ச்சி)

---

## 🏗️ முகவர் கட்டமைப்பு வடிவுகள்

### வடிவம் 1: கருவிகளுடன் ஒரே முகவர்

The simplest agent pattern - one agent that can use multiple tools.

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

**சிறந்தது:**
- Customer support bots
- Research assistants
- Data analysis agents

**AZD வார்ப்புரு:** `azure-search-openai-demo`

### வடிவம் 2: RAG முகவர் (Retrieval-Augmented Generation)

An agent that retrieves relevant documents before generating responses.

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

**சிறந்தது:**
- நற்பண்ண நிறுவன அறிவுத்தளம்
- ஆவணம் கேள்வி-பதில் அமைப்புகள்
- ஒழுங்குமுறை மற்றும் சட்ட ஆராய்ச்சி

**AZD வார்ப்புரு:** `azure-search-openai-demo`

### வடிவம் 3: பல-முகவர் முறைமை

Multiple specialized agents working together on complex tasks.

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

**சிறந்தது:**
- சிக்கலான உள்ளடக்கம் உருவாக்குதல்
- பல படி வேலைப்பாடுகள்
- வெவ்வேறு நிபுணத்துவத்தைத் தேடுகிற பணிகள்

**மேலும் அறிய:** [பல-முகவர் ஒருங்கிணைப்பு வடிவங்கள்](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ முகவர் கருவிகளை கட்டமைத்தல்

Agents become powerful when they can use tools. Here's how to configure common tools:

### Tool Configuration in Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# தனிப்பயன் கருவிகளை வரையறுக்கவும்
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

# கருவிகளுடன் ஏஜெண்டை உருவாக்கவும்
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Environment Configuration

```bash
# ஏஜென்ட்-சார்ந்த சுற்றுச்சூழல் மாறிகளை அமைக்கவும்
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# புதுப்பிக்கப்பட்ட கட்டமைப்புடன் நிறுவவும்
azd deploy
```

---

## 📊 முகவர்களை கண்காணித்தல்

### Application Insights ஒருங்கிணைப்பு

All AZD agent templates include Application Insights for monitoring:

```bash
# கண்காணிப்பு டாஷ்போர்டை திறக்கவும்
azd monitor --overview

# நிகழ்நிலை பதிவுகளைப் பார்க்கவும்
azd monitor --logs

# நிகழ்நிலை அளவுகோல்களைப் பார்க்கவும்
azd monitor --live
```

### கண்காணிக்க வேண்டிய முக்கிய அளவுகோல்கள்

| அளவுகோல் | விளக்கம் | இலக்கு |
|--------|-------------|--------|
| பதில் தாமதம் | பதில் உருவாக்கும் நேரம் | < 5 விநாடிகள் |
| டோக்கன் பயன்பாடு | கோரிக்கைக்கு டோக்கன்கள் | செலவுக்காக கண்காணிக்கவும் |
| கருவி அழைப்பின் வெற்றி விகிதம் | வெற்றிகரமான கருவி செயலாக்கங்களின் சதவீதம் | > 95% |
| பிழை விகிதம் | தோல்வியடைந்த முகவர் கோரிக்கைகள் | < 1% |
| பயனர் திருப்தி | பின்னூட்ட மதிப்பெண்கள் | > 4.0/5.0 |

### முகவர்களுக்கான தனிப்பயன் பதிவு

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

## 💰 செலவு பற்றிய கருதுகோள்கள்

### வடிவம் படி மாதாந்திர மதிப்பீடு செய்யப்பட்ட செலவுகள்

| வடிவம் | வளர்ச்சி சூழல் | உற்பத்தி |
|---------|-----------------|------------|
| ஒற்றை முகவர் | $50-100 | $200-500 |
| RAG முகவர் | $80-150 | $300-800 |
| பல-முகவர் (2-3 முகவர்கள்) | $150-300 | $500-1,500 |
| நிறுவன பல-முகவர் | $300-500 | $1,500-5,000+ |

### செலவு குறைப்புத் குறிப்புகள்

1. **சரளமான பணிகளுக்கு GPT-4o-mini-ஐ பயன்படுத்தவும்**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **மீண்டும் வரும் கேள்விகளுக்காக கேஷ் செயல்படுத்தவும்**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **டோக்கன் வரம்புகளை அமைக்கவும்**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # பதில் நீளத்தை வரம்பிடவும்
   )
   ```

4. **பயன்பாட்டில் இல்லாத சில நேரங்களில் சேவையை பூஜ்யத்துக்கு தாழ்த்தவும் (scale to zero)**
   ```bash
   # Container Apps தானாகவே அளவைக் குறைத்து பூஜ்ஜியமாகும்
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 முகவர் பிழைகள் சரிசெய்தல்

### பொதுவான சிக்கல்கள் மற்றும் தீர்வுகள்

<details>
<summary><strong>❌ கருவி அழைப்புகளுக்கு முகவர் பதிலளிப்பதில்லை</strong></summary>

```bash
# கருவிகள் சரியாக பதிவு செய்யப்பட்டுள்ளதா என்பதைச் சரிபார்க்கவும்
azd show

# OpenAI நிறுவலைச் சரிபார்க்கவும்
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# ஏஜென்ட் பதிவுகளைச் சரிபார்க்கவும்
azd monitor --logs
```

**பொதுவான காரணங்கள்:**
- கருவி செயல்பாட்டு கையெழுத்து பொருந்தாமை
- தேவையான அனுமதிகள் இல்லை
- API endpoint அணுகமுடியவில்லை
</details>

<details>
<summary><strong>❌ முகவர் பதில்களில் உயர் தாமதம்</strong></summary>

```bash
# Application Insights-ஐ பிணக்குகளுக்காக சரிபார்க்கவும்
azd monitor --live

# வேகமான மாடலைப் பயன்படுத்த பரிசீலிக்கவும்
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**முன்னேற்ற ஆலோசனைகள்:**
- ஸ்ட்ரீமிங் பதில்களைப் பயன்படுத்தவும்
- பதில்களை கேஷ் செய்யவும்
- சூழ்நிலைக் ஜன்னல் அளவை குறைக்கவும்
</details>

<details>
<summary><strong>❌ முகவர் தவறான அல்லது கற்பனையான தகவலைத் திருப்பி வழங்குகிறது</strong></summary>

```python
# சிறந்த சிஸ்டம் ப்ராம்ப்ட்களால் மேம்படுத்தவும்
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# நிலைப்படுத்தலுக்காக மீட்டெடுப்பைச் சேர்க்கவும்
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # பதில்களை ஆவணங்களில் ஆதாரப்படுத்தவும்
)
```
</details>

<details>
<summary><strong>❌ டோக்கன் வரம்பு மீறப்பட்ட பிழைகள்</strong></summary>

```python
# சூழ்நிலை சாளர மேலாண்மையை செயல்படுத்தவும்
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # தற்காலிக மதிப்பீடு
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 கையால் செய்யும் பயிற்சிகள்

### பயிற்சி 1: ஒரு அடிப்படை முகவரை நிறுவுதல் (20 நிமிடங்கள்)

**நோக்கம்:** AZD பயன்படுத்தி உங்கள் முதலாவது AI முகவரை நிறுவுதல்

```bash
# படி 1: வார்ப்புருவை துவக்கவும்
azd init --template get-started-with-ai-agents

# படி 2: Azure-க்கு உள்நுழையவும்
azd auth login

# படி 3: நிறுவவும்
azd up

# படி 4: ஏஜெண்டை சோதிக்கவும்
# வெளியீட்டில் காட்டப்பட்ட URL-ஐ திறக்கவும்

# படி 5: சுத்தம் செய்யவும்
azd down --force --purge
```

**வெற்றி அளவுகோல்கள்:**
- [ ] முகவர் கேள்விகளுக்கு பதிலளிக்கிறது
- [ ] கண்காணிப்பு டாஷ்போர்டை அணுக முடியும்
- [ ] வளங்கள் வெற்றிகரமாக சுத்தம் செய்யப்பட்டன

### பயிற்சி 2: ஒரு தனிப்பயன் கருவியைச் சேர்க்க (30 நிமிடங்கள்)

**நோக்கம்:** முகவருக்கு தனிப்பயன் கருவி சேர்க்க

1. முகவர் வார்ப்புருவை நிறுவவும்
2. புதிய கருவி செயல்பாட்டை உருவாக்கவும்:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # வானிலை சேவைக்கு API அழைப்பு
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. முகவருடன் கருவியை பதிவு செய்யவும்
4. முகவர் புதிய கருவியைப் பயன்படுத்துகிறதா என சோதனை செய்யவும்

**வெற்றி அளவுகோல்கள்:**
- [ ] முகவர் வானிலை தொடர்பான கேள்விகளை அடையாளம் காண்கிறது
- [ ] கருவி சரியாக அழைக்கப்படுகிறது
- [ ] பதில் வானிலை தகவலை கொண்டுள்ளது

### பயிற்சி 3: ஒரு RAG முகவரை உருவாக்குதல் (45 நிமிடங்கள்)

**நோக்கம்:** உங்கள் ஆவணங்களிலிருந்தே கேள்விகளுக்கு பதிலளிக்கும் ஒரு முகவரை உருவாக்கவும்

```bash
# RAG வார்ப்புருவை அமல்படுத்தவும்
azd init --template azure-search-openai-demo
azd up

# உங்கள் ஆவணங்களைப் பதிவேற்றவும்
# (வார்ப்புருவின் தரவு இறக்குமதி வழிகாட்டியைப் பின்பற்றவும்)

# குறிப்பிட்ட துறை சார்ந்த கேள்விகளுடன் சோதிக்கவும்
```

**வெற்றி அளவுகோல்கள்:**
- [ ] முகவர் பதிவேற்றப்பட்ட ஆவணங்களில் இருந்து பதிலளிக்கிறது
- [ ] பதில்களில் மேற்கோள்கள் இடம்பெற வேண்டும்
- [ ] வரம்புக்கு வெளியான கேள்விகளில் கற்பனைபோன்ற தவறுகள் இல்லாமல் இருக்க வேண்டும்

---

## 📚 அடுத்த படிகள்

இனி நீங்கள் AI முகவர்களைப் புரிந்திருக்கிறீர்கள்; இந்த மேம்பட்ட தலைப்புகளை ஆராயவும்:

| தலைப்பு | விளக்கம் | இணைப்பு |
|-------|-------------|------|
| **பல-முகவர் முறைமைகள்** | பல இணைந்து பணியாற்றும் முகவர்கள் கொண்ட முறைமைகளை உருவாக்கவும் | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **ஒத்துழைப்பு வடிவங்கள்** | ஒழுங்குபடுத்தல் மற்றும் தொடர்பாடல் வடிவங்களை கற்றுக்கொள்ளவும் | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **உற்பத்தி நிறுவல்** | நிறுவனத் தயாரிப்பிற்கு தயாரான முகவர் நிறுவல் | [Production AI Practices](production-ai-practices.md) |
| **முகவர் மதிப்பீடு** | முகவர் செயல்திறனை சோதிக்கவும் மற்றும் மதிப்பீடு செய்யவும் | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 கூடுதல் வளங்கள்

### அதிகாரப்பூர்வ ஆவணங்கள்
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD முகவர் வார்ப்புருக்கள்
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### சமுதாய வளங்கள்
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**வழிசெலுத்தல்**
- **முந்தைய பாடம்**: [AI மாதிரி நிலைநாட்டல்](ai-model-deployment.md)
- **அடுத்தப் பாடம்**: [தயாரிப்பு AI நடைமுறைகள்](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
அறிவிப்பு:
இந்த ஆவணம் செயற்கை நுண்ணறிவு (AI) மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டது. நாங்கள் துல்லியத்திற்காக முயலினாலும், தானியக்க மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான பொருள் இருக்கும் احتمال உள்ளது என்பதை தயவுசெய்து கவனத்தில் கொள்ளுங்கள். மூல ஆவணம் அதன் சொந்த மொழியில் அதிகாரபூர்வ மூலமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பைப் பயன்படுத்த பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்தியதனால் ஏற்படும் எந்தப் புரிதலிழப்பு அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->