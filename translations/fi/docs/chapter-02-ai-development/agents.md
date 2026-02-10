# AI-agentit Azure Developer CLI:llä

**Lukujen navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-ensisuuntautunut kehitys
- **⬅️ Edellinen**: [AI-mallin käyttöönotto](ai-model-deployment.md)
- **➡️ Seuraava**: [Tuotannon AI-käytännöt](production-ai-practices.md)
- **🚀 Edistynyt**: [Moni-agenttiratkaisut](../../examples/retail-scenario.md)

---

## Johdanto

AI-agentit ovat autonomisia ohjelmia, jotka voivat havaita ympäristönsä, tehdä päätöksiä ja suorittaa toimintoja tiettyjen tavoitteiden saavuttamiseksi. Toisin kuin yksinkertaiset chatbotit, jotka vastaavat kehotteisiin, agentit voivat:

- **Käyttää työkaluja** - Kutsua API-rajapintoja, hakea tietokannoista, suorittaa koodia
- **Suunnitella ja päättellä** - Jakaa monimutkaiset tehtävät vaiheisiin
- **Oppia kontekstista** - Säilyttää muistin ja mukauttaa käyttäytymistään
- **Tehdä yhteistyötä** - Työskennellä muiden agenttien kanssa (moni-agenttijärjestelmät)

Tämä opas näyttää, miten otat AI-agentit käyttöön Azureen Azure Developer CLI:llä (azd).

## Oppimistavoitteet

Tämän oppaan suorittamalla osaat:
- Ymmärtää, mitä AI-agentit ovat ja miten ne eroavat chatboteista
- Otaa käyttöön valmiita AI-agenttipohjia AZD:llä
- Konfiguroida Foundry Agents mukautettuja agenteja varten
- Toteuttaa perusagenttimallit (työkalujen käyttö, RAG, moni-agentti)
- Valvoa ja virheenkorjata käyttöönotettuja agenteja

## Oppimistulokset

Suoritettuasi tämän osaat:
- Ota AI-agenttisovellukset käyttöön Azureen yhdellä komennolla
- Konfiguroida agenttien työkalut ja ominaisuudet
- Toteuttaa retrieval-augmented generation (RAG) agenteilla
- Suunnitella moni-agenttiarkkitehtuureja monimutkaisille työnkuluille
- Ratkoa yleisiä agenttien käyttöönottoon liittyviä ongelmia

---

## 🤖 Mikä erottaa agentin chatbotista?

| Ominaisuus | Chatbot | AI-agentti |
|---------|---------|----------|
| **Käytös** | Vastaa kehotteisiin | Tekee itsenäisiä toimia |
| **Työkalut** | Ei mitään | Voi kutsua API-rajapintoja, hakea tietoja, suorittaa koodia |
| **Muisti** | Vain istuntopohjainen | Pysyvä muisti istuntojen välillä |
| **Suunnittelu** | Yksi vastaus | Monivaiheinen päättely |
| **Yhteistyö** | Yksi toimija | Voi työskennellä muiden agenttien kanssa |

### Yksinkertainen analogia

- **Chatbot** = Avulias henkilö, joka vastaa kysymyksiin infopisteessä
- **AI-agentti** = Henkilökohtainen avustaja, joka voi soittaa, varata tapaamisia ja suorittaa tehtäviä puolestasi

---

## 🚀 Nopeasti alkuun: Ota ensimmäinen agenttisi käyttöön

### Vaihtoehto 1: Foundry Agents -pohja (Suositeltu)

```bash
# Alusta tekoälyagenttien malli
azd init --template get-started-with-ai-agents

# Ota käyttöön Azureen
azd up
```

**Mitä otetaan käyttöön:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (RAG:ia varten)
- ✅ Azure Container Apps (web-käyttöliittymä)
- ✅ Application Insights (valvonta)

**Aika:** ~15–20 minuuttia
**Kustannus:** ~$100–150/kk (kehitys)

### Vaihtoehto 2: OpenAI-agentti Promptyn kanssa

```bash
# Alusta Promptyyn perustuva agenttipohja
azd init --template agent-openai-python-prompty

# Julkaise Azureen
azd up
```

**Mitä otetaan käyttöön:**
- ✅ Azure Functions (serveriton agentin suoritus)
- ✅ Azure OpenAI
- ✅ Prompty-konfiguraatiotiedostot
- ✅ Esimerkkitoteutus agentista

**Aika:** ~10–15 minuuttia
**Kustannus:** ~$50–100/kk (kehitys)

### Vaihtoehto 3: RAG-chat-agentti

```bash
# Alusta RAG-keskustelupohja
azd init --template azure-search-openai-demo

# Ota käyttöön Azureen
azd up
```

**Mitä otetaan käyttöön:**
- ✅ Azure OpenAI
- ✅ Azure AI Search näyteaineiston kanssa
- ✅ Asiakirjojen käsittelyputki
- ✅ Chat-käyttöliittymä lähdeviitteineen

**Aika:** ~15–25 minuuttia
**Kustannus:** ~$80–150/kk (kehitys)

---

## 🏗️ Agenttiarkkitehtuurin mallit

### Malli 1: Yksi agentti, jolla on työkaluja

Yksinkertaisin agenttimalli – yksi agentti, joka voi käyttää useita työkaluja.

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

**Parhaiten sopii:**
- Asiakastukibotit
- Tutkimusavustajat
- Datanalyysagentit

**AZD-pohja:** `azure-search-openai-demo`

### Malli 2: RAG-agentti (Retrieval-Augmented Generation)

Agentti, joka hakee relevantteja asiakirjoja ennen vastausten luomista.

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

**Parhaiten sopii:**
- Yrityksen tietopankit
- Asiakirjapohjaiset kysymys–vastausjärjestelmät
- Säädösten noudattaminen ja oikeudellinen tutkimus

**AZD-pohja:** `azure-search-openai-demo`

### Malli 3: Moni-agenttijärjestelmä

Useita erikoistuneita agentteja, jotka työskentelevät yhdessä monimutkaisissa tehtävissä.

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

**Parhaiten sopii:**
- Monimutkainen sisällönluonti
- Monivaiheiset työnkulut
- Tehtävät, jotka vaativat erilaista osaamista

**Lisätietoja:** [Moni-agentin koordinointimallit](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Agenttien työkalujen konfigurointi

Agentit muuttuvat tehokkaiksi, kun ne voivat käyttää työkaluja. Näin konfiguroidaan yleisiä työkaluja:

### Työkalukonfiguraatio Foundry Agentsissa

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Määrittele mukautetut työkalut
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

# Luo agentti työkalujen kanssa
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Ympäristön konfigurointi

```bash
# Määritä agenttikohtaiset ympäristömuuttujat
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Ota käyttöön päivitetty konfiguraatio
azd deploy
```

---

## 📊 Agenttien valvonta

### Application Insights -integraatio

Kaikki AZD-agenttipohjat sisältävät Application Insightsin valvontaa varten:

```bash
# Avaa valvontapaneeli
azd monitor --overview

# Näytä reaaliaikaiset lokit
azd monitor --logs

# Näytä reaaliaikaiset mittarit
azd monitor --live
```

### Tärkeimmät seurattavat mittarit

| Mittari | Kuvaus | Tavoite |
|--------|-------------|--------|
| Vastausaika | Vastauksen luomiseen kuluva aika | < 5 sekuntia |
| Tokenien käyttö | Tokeneita per pyyntö | Seuraa kustannuksia |
| Työkalukutsujen onnistumisprosentti | Onnistuneiden työkalusuoritusten % | > 95% |
| Virheprosentti | Epäonnistuneet agenttipyynnöt | < 1% |
| Käyttäjätyytyväisyys | Palautepisteet | > 4.0/5.0 |

### Mukautettu lokitus agenteille

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

## 💰 Kustannusnäkökohdat

### Arvioidut kuukausikustannukset mallin mukaan

| Malli | Kehitysympäristö | Tuotanto |
|---------|-----------------|------------|
| Yksi agentti | $50-100 | $200-500 |
| RAG-agentti | $80-150 | $300-800 |
| Moni-agentti (2-3 agenttia) | $150-300 | $500-1,500 |
| Yritystason moni-agentti | $300-500 | $1,500-5,000+ |

### Kustannusten optimointivinkit

1. **Käytä GPT-4o-mini -mallia yksinkertaisiin tehtäviin**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Ota välimuisti käyttöön toistuviin kyselyihin**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Aseta token-rajoituksia**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Rajoita vastauksen pituutta
   )
   ```

4. **Skaalaa nollaan, kun ei käytössä**
   ```bash
   # Container Apps skaalautuu automaattisesti nollaan
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Agenttien vianmääritys

### Yleiset ongelmat ja ratkaisut

<details>
<summary><strong>❌ Agentti ei vastaa työkalukutsuihin</strong></summary>

```bash
# Tarkista, että työkalut on rekisteröity oikein
azd show

# Varmista OpenAI:n käyttöönotto
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Tarkista agentin lokit
azd monitor --logs
```

**Yleiset syyt:**
- Työkalufunktion allekirjoitus ei täsmää
- Puuttuvat vaaditut oikeudet
- API-päätepiste ei ole saavutettavissa
</details>

<details>
<summary><strong>❌ Korkea viive agentin vastauksissa</strong></summary>

```bash
# Tarkista Application Insights mahdollisten pullonkaulojen varalta
azd monitor --live

# Harkitse nopeamman mallin käyttämistä
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Optimointivinkkejä:**
- Käytä striimattuja vastauksia
- Ota vastausvälimuisti käyttöön
- Pienennä kontekstin ikkunan kokoa
</details>

<details>
<summary><strong>❌ Agentti palauttaa virheellistä tai hallusinoitua tietoa</strong></summary>

```python
# Paranna paremmilla järjestelmäkehotteilla
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Lisää haku perustamista varten
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Perusta vastaukset dokumentteihin
)
```
</details>

<details>
<summary><strong>❌ Token-rajan ylitykseen liittyvät virheet</strong></summary>

```python
# Toteuta kontekstin ikkunan hallinta
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Karkea arvio
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Käytännön harjoitukset

### Harjoitus 1: Ota perusagentti käyttöön (20 minuuttia)

**Tavoite:** Ota ensimmäinen AI-agenttisi käyttöön käyttämällä AZD:tä

```bash
# Vaihe 1: Alusta mallipohja
azd init --template get-started-with-ai-agents

# Vaihe 2: Kirjaudu Azureen
azd auth login

# Vaihe 3: Ota käyttöön
azd up

# Vaihe 4: Testaa agenttia
# Avaa tulosteessa näkyvä URL-osoite

# Vaihe 5: Siivoa
azd down --force --purge
```

**Onnistumiskriteerit:**
- [ ] Agentti vastaa kysymyksiin
- [ ] Pääsee valvontapaneeliin
- [ ] Resurssit poistettu onnistuneesti

### Harjoitus 2: Lisää mukautettu työkalu (30 minuuttia)

**Tavoite:** Laajenna agenttia mukautetulla työkalulla

1. Ota agenttipohja käyttöön
2. Luo uusi työkalufunktio:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # API-kutsu sääpalveluun
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Rekisteröi työkalu agenttiin
4. Testaa, että agentti käyttää uutta työkalua

**Onnistumiskriteerit:**
- [ ] Agentti tunnistaa säähän liittyvät kyselyt
- [ ] Työkalua kutsutaan oikein
- [ ] Vastaus sisältää säätiedot

### Harjoitus 3: Rakenna RAG-agentti (45 minuuttia)

**Tavoite:** Luo agentti, joka vastaa kysymyksiin asiakirjoistasi

```bash
# Ota RAG-malli käyttöön
azd init --template azure-search-openai-demo
azd up

# Lataa dokumenttisi
# (Noudata mallin tietojen tuontiohjetta)

# Testaa toimialakohtaisilla kysymyksillä
```

**Onnistumiskriteerit:**
- [ ] Agentti vastaa ladatuista asiakirjoista
- [ ] Vastaukset sisältävät lähdeviitteitä
- [ ] Ei hallusinaatioita laajuuden ulkopuolisissa kysymyksissä

---

## 📚 Seuraavat askeleet

Nyt kun ymmärrät AI-agentit, tutustu näihin edistyneisiin aiheisiin:

| Aihe | Kuvaus | Linkki |
|-------|-------------|------|
| **Moni-agenttijärjestelmät** | Rakenna järjestelmiä, joissa useat agentit tekevät yhteistyötä | [Vähittäiskaupan moni-agenttiesimerkki](../../examples/retail-scenario.md) |
| **Koordinointimallit** | Opi orkestrointi- ja viestintämalleja | [Koordinointimallit](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Tuotantokäyttöön siirtäminen** | Yritystason agenttien käyttöönotto | [Tuotannon AI-käytännöt](production-ai-practices.md) |
| **Agenttien arviointi** | Testaa ja arvioi agentin suorituskykyä | [AI-vianmääritys](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Lisäresurssit

### Virallinen dokumentaatio
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD-pohjat agenteille
- [Aloita AI-agenttien kanssa](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI -demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Yhteisöresurssit
- [Awesome AZD - agenttipohjat](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigointi**
- **Edellinen oppitunti**: [AI-mallin käyttöönotto](ai-model-deployment.md)
- **Seuraava oppitunti**: [Tuotannon AI-käytännöt](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty tekoälypohjaisella käännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automatisoiduissa käännöksissä voi esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulee pitää ensisijaisena lähteenä. Tärkeää tietoa koskevissa tilanteissa suositellaan ammattimaisen ihmiskääntäjän käyttöä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai virheellisistä tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->