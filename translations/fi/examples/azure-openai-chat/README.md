<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fc2d5d2f2f572c99876be92d82680e22",
  "translation_date": "2025-11-21T18:41:21+00:00",
  "source_file": "examples/azure-openai-chat/README.md",
  "language_code": "fi"
}
-->
# Azure OpenAI Chat -sovellus

**Oppimistaso:** Keskitaso ⭐⭐ | **Aika:** 35-45 minuuttia | **Kustannukset:** $50-200/kuukausi

Täydellinen Azure OpenAI -chat-sovellus, joka otetaan käyttöön Azure Developer CLI:n (azd) avulla. Tämä esimerkki esittelee GPT-4:n käyttöönoton, turvallisen API-pääsyn ja yksinkertaisen chat-käyttöliittymän.

## 🎯 Mitä opit

- Ota käyttöön Azure OpenAI Service GPT-4-mallilla
- Suojaa OpenAI API -avaimet Key Vaultilla
- Rakenna yksinkertainen chat-käyttöliittymä Pythonilla
- Seuraa tokenien käyttöä ja kustannuksia
- Toteuta nopeusrajoitukset ja virheenkäsittely

## 📦 Mitä sisältyy

✅ **Azure OpenAI Service** - GPT-4-mallin käyttöönotto  
✅ **Python Chat App** - Yksinkertainen komentorivipohjainen chat-käyttöliittymä  
✅ **Key Vault -integraatio** - API-avainten turvallinen tallennus  
✅ **ARM-mallit** - Täydellinen infrastruktuuri koodina  
✅ **Kustannusseuranta** - Tokenien käytön seuranta  
✅ **Nopeusrajoitukset** - Estä kiintiön ylitys  

## Arkkitehtuuri

```
┌─────────────────────────────────────────────┐
│   Python Chat Application (Local/Cloud)    │
│   - Command-line interface                 │
│   - Conversation history                   │
│   - Token usage tracking                   │
└──────────────────┬──────────────────────────┘
                   │ HTTPS (API Key)
                   ▼
┌─────────────────────────────────────────────┐
│   Azure OpenAI Service                      │
│   ┌───────────────────────────────────────┐ │
│   │   GPT-4 Model                         │ │
│   │   - 20K tokens/min capacity           │ │
│   │   - Multi-region failover (optional)  │ │
│   └───────────────────────────────────────┘ │
│                                             │
│   Managed Identity ───────────────────────┐ │
└────────────────────────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│   Azure Key Vault                           │
│   - OpenAI API Key (secret)                 │
│   - Endpoint URL (secret)                   │
└─────────────────────────────────────────────┘
```

## Esivaatimukset

### Tarvittavat

- **Azure Developer CLI (azd)** - [Asennusohje](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure-tilaus**, jossa on OpenAI-käyttöoikeus - [Hae käyttöoikeutta](https://aka.ms/oai/access)
- **Python 3.9+** - [Asenna Python](https://www.python.org/downloads/)

### Tarkista esivaatimukset

```bash
# Tarkista azd-versio (tarvitaan 1.5.0 tai uudempi)
azd version

# Varmista Azure-kirjautuminen
azd auth login

# Tarkista Python-versio
python --version  # tai python3 --version

# Varmista OpenAI-yhteys (tarkista Azure-portaalista)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Tärkeää:** Azure OpenAI vaatii käyttöoikeushakemuksen. Jos et ole vielä hakenut, käy osoitteessa [aka.ms/oai/access](https://aka.ms/oai/access). Hyväksyntä kestää yleensä 1-2 arkipäivää.

## ⏱️ Käyttöönoton aikajana

| Vaihe | Kesto | Mitä tapahtuu |
|-------|-------|---------------|
| Esivaatimusten tarkistus | 2-3 minuuttia | Varmista OpenAI-kiintiön saatavuus |
| Infrastruktuurin käyttöönotto | 8-12 minuuttia | Luo OpenAI, Key Vault, mallin käyttöönotto |
| Sovelluksen konfigurointi | 2-3 minuuttia | Ympäristön ja riippuvuuksien asennus |
| **Yhteensä** | **12-18 minuuttia** | Valmis keskustelemaan GPT-4:n kanssa |

**Huom:** Ensimmäinen OpenAI:n käyttöönotto voi kestää kauemmin mallin provisioinnin vuoksi.

## Pika-aloitus

```bash
# Siirry esimerkkiin
cd examples/azure-openai-chat

# Alusta ympäristö
azd env new myopenai

# Ota kaikki käyttöön (infrastruktuuri + konfiguraatio)
azd up
# Sinua kehotetaan:
# 1. Valitse Azure-tilaus
# 2. Valitse sijainti, jossa OpenAI on saatavilla (esim. eastus, eastus2, westus)
# 3. Odota 12-18 minuuttia käyttöönottoa

# Asenna Python-riippuvuudet
pip install -r requirements.txt

# Aloita keskustelu!
python chat.py
```

**Odotettu tulos:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Varmista käyttöönotto

### Vaihe 1: Tarkista Azure-resurssit

```bash
# Näytä käyttöönotetut resurssit
azd show

# Odotettu tulos näyttää:
# - OpenAI-palvelu: (resurssin nimi)
# - Key Vault: (resurssin nimi)
# - Käyttöönotto: gpt-4
# - Sijainti: eastus (tai valitsemasi alue)
```

### Vaihe 2: Testaa OpenAI API

```bash
# Hanki OpenAI-päätepiste ja avain
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Testaa API-kutsua
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Odotettu vastaus:**
```json
{
  "choices": [
    {
      "message": {
        "role": "assistant",
        "content": "Hello! How can I assist you today?"
      }
    }
  ],
  "usage": {
    "prompt_tokens": 8,
    "completion_tokens": 9,
    "total_tokens": 17
  }
}
```

### Vaihe 3: Varmista Key Vault -pääsy

```bash
# Luettele salaisuudet Key Vaultissa
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Odotetut salaisuudet:**
- `openai-api-key`
- `openai-endpoint`

**Onnistumiskriteerit:**
- ✅ OpenAI-palvelu otettu käyttöön GPT-4:llä
- ✅ API-kutsu palauttaa kelvollisen vastauksen
- ✅ Salaisuudet tallennettu Key Vaultiin
- ✅ Tokenien käytön seuranta toimii

## Projektin rakenne

```
azure-openai-chat/
├── README.md                   ✅ This guide
├── azure.yaml                  ✅ AZD configuration
├── infra/                      ✅ Infrastructure as Code
│   ├── main.bicep             ✅ Main Bicep template
│   ├── main.parameters.json   ✅ Parameters
│   └── openai.bicep           ✅ OpenAI resource definition
├── src/                        ✅ Application code
│   ├── chat.py                ✅ Chat interface
│   ├── config.py              ✅ Configuration loader
│   └── requirements.txt       ✅ Python dependencies
└── .gitignore                  ✅ Git ignore rules
```

## Sovelluksen ominaisuudet

### Chat-käyttöliittymä (`chat.py`)

Chat-sovellus sisältää:

- **Keskusteluhistoria** - Säilyttää kontekstin viestien välillä
- **Tokenien laskenta** - Seuraa käyttöä ja arvioi kustannuksia
- **Virheenkäsittely** - Sulava käsittely nopeusrajoituksille ja API-virheille
- **Kustannusarviointi** - Reaaliaikainen kustannuslaskenta per viesti
- **Streaming-tuki** - Valinnainen suoratoistovastaus

### Komennot

Keskustelun aikana voit käyttää:
- `quit` tai `exit` - Lopeta istunto
- `clear` - Tyhjennä keskusteluhistoria
- `tokens` - Näytä tokenien kokonaiskäyttö
- `cost` - Näytä arvioitu kokonaiskustannus

### Konfigurointi (`config.py`)

Lataa konfiguraation ympäristömuuttujista:
```python
AZURE_OPENAI_ENDPOINT  # Key Vaultista
AZURE_OPENAI_API_KEY   # Key Vaultista
AZURE_OPENAI_MODEL     # Oletus: gpt-4
AZURE_OPENAI_MAX_TOKENS # Oletus: 800
```

## Käyttöesimerkit

### Peruskeskustelu

```bash
python chat.py
```

### Keskustelu mukautetulla mallilla

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Keskustelu suoratoistolla

```bash
python chat.py --stream
```

### Esimerkkikeskustelu

```
You: Explain Azure OpenAI Service in 3 sentences.
Assistant: Azure OpenAI Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like GPT-4 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Azure OpenAI Service offers several model families including GPT-4 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## Kustannusten hallinta

### Token-hinnoittelu (GPT-4)

| Malli | Syöte (per 1K tokenia) | Vastaus (per 1K tokenia) |
|-------|------------------------|--------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Arvioidut kuukausikustannukset

Käyttömallien perusteella:

| Käyttötaso | Viestejä/päivä | Tokeneita/päivä | Kuukausikustannus |
|------------|----------------|-----------------|-------------------|
| **Kevyt** | 20 viestiä | 3,000 tokenia | $3-5 |
| **Kohtalainen** | 100 viestiä | 15,000 tokenia | $15-25 |
| **Raskas** | 500 viestiä | 75,000 tokenia | $75-125 |

**Perusinfrastruktuurin kustannus:** $1-2/kuukausi (Key Vault + vähimmäislaskenta)

### Kustannusten optimointivinkit

```bash
# 1. Käytä GPT-3.5-Turboa yksinkertaisiin tehtäviin (20x halvempi)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Vähennä maksimimerkkien määrää lyhyempiin vastauksiin
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Seuraa merkkien käyttöä
python chat.py --show-tokens

# 4. Aseta budjettihälytykset
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Seuranta

### Näytä tokenien käyttö

```bash
# Azure-portaalissa:
# OpenAI-resurssi → Metriset → Valitse "Token Transaction"

# Tai Azure CLI:n kautta:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Näytä API-lokit

```bash
# Suoratoista diagnostiikkalokeja
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Kyselylokeja
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Vianmääritys

### Ongelma: "Access Denied" -virhe

**Oireet:** 403 Forbidden API-kutsussa

**Ratkaisut:**
```bash
# 1. Varmista, että OpenAI-pääsy on hyväksytty
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Tarkista, että API-avain on oikein
azd env get-value AZURE_OPENAI_API_KEY

# 3. Varmista, että päätepisteen URL-muoto on oikea
azd env get-value AZURE_OPENAI_ENDPOINT
# Pitäisi olla: https://[name].openai.azure.com/
```

### Ongelma: "Rate Limit Exceeded"

**Oireet:** 429 Too Many Requests

**Ratkaisut:**
```bash
# 1. Tarkista nykyinen kiintiö
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Pyydä kiintiön korotusta (tarvittaessa)
# Siirry Azure-portaaliin → OpenAI-resurssi → Kiintiöt → Pyydä korotusta

# 3. Toteuta uudelleenyrittojen logiikka (jo chat.py-tiedostossa)
# Sovellus yrittää automaattisesti uudelleen eksponentiaalisella viiveellä
```

### Ongelma: "Model Not Found"

**Oireet:** 404-virhe käyttöönotossa

**Ratkaisut:**
```bash
# 1. Luettele saatavilla olevat käyttöönotot
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Vahvista mallin nimi ympäristössä
echo $AZURE_OPENAI_MODEL

# 3. Päivitä oikeaan käyttöönoton nimeen
export AZURE_OPENAI_MODEL=gpt-4  # tai gpt-35-turbo
```

### Ongelma: Korkea viive

**Oireet:** Hitaat vasteajat (>5 sekuntia)

**Ratkaisut:**
```bash
# 1. Tarkista alueellinen viive
# Ota käyttöön käyttäjiä lähimpänä oleva alue

# 2. Vähennä max_tokens nopeampia vastauksia varten
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Käytä suoratoistoa paremman käyttökokemuksen saavuttamiseksi
python chat.py --stream
```

## Tietoturvan parhaat käytännöt

### 1. Suojaa API-avaimet

```bash
# Älä koskaan tallenna avaimia versionhallintaan
# Käytä Key Vaultia (jo konfiguroitu)

# Vaihda avaimet säännöllisesti
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Toteuta sisällönsuodatus

```python
# Azure OpenAI sisältää sisäänrakennetun sisällön suodatuksen
# Määritä Azure-portaalissa:
# OpenAI-resurssi → Sisällön suodattimet → Luo mukautettu suodatin

# Luokat: Viha, Seksuaalinen, Väkivalta, Itsevahingoittaminen
# Tasot: Matala, Keskitaso, Korkea suodatus
```

### 3. Käytä hallittua identiteettiä (tuotannossa)

```bash
# Käytä tuotantokäyttöönotossa hallittua identiteettiä
# API-avainten sijaan (vaatii sovelluksen isännöinnin Azuren kautta)

# Päivitä infra/openai.bicep sisältämään:
# identity: { type: 'SystemAssigned' }
```

## Kehitys

### Aja paikallisesti

```bash
# Asenna riippuvuudet
pip install -r src/requirements.txt

# Aseta ympäristömuuttujat
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Käynnistä sovellus
python src/chat.py
```

### Aja testit

```bash
# Asenna testiriippuvuudet
pip install pytest pytest-cov

# Suorita testit
pytest tests/ -v

# Kattavuuden kanssa
pytest tests/ --cov=src --cov-report=html
```

### Päivitä mallin käyttöönotto

```bash
# Ota käyttöön eri malliversio
az cognitiveservices account deployment create \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-35-turbo \
  --model-name gpt-35-turbo \
  --model-version "0613" \
  --model-format OpenAI \
  --sku-capacity 20 \
  --sku-name "Standard"
```

## Siivous

```bash
# Poista kaikki Azure-resurssit
azd down --force --purge

# Tämä poistaa:
# - OpenAI-palvelu
# - Key Vault (90 päivän pehmeä poisto)
# - Resurssiryhmä
# - Kaikki käyttöönotot ja kokoonpanot
```

## Seuraavat askeleet

### Laajenna tätä esimerkkiä

1. **Lisää verkkokäyttöliittymä** - Rakenna React/Vue-frontend
   ```bash
   # Lisää frontend-palvelu azure.yaml-tiedostoon
   # Ota käyttöön Azure Static Web Apps
   ```

2. **Toteuta RAG** - Lisää dokumenttihaku Azure AI Searchilla
   ```python
   # Integroi Azure Cognitive Search
   # Lataa asiakirjat ja luo vektori-indeksi
   ```

3. **Lisää toimintokutsut** - Ota työkalujen käyttö käyttöön
   ```python
   # Määritä funktiot chat.py-tiedostossa
   # Anna GPT-4:n kutsua ulkoisia API:ita
   ```

4. **Monimallin tuki** - Ota käyttöön useita malleja
   ```bash
   # Lisää gpt-35-turbo, upotusmallit
   # Toteuta mallin reitityksen logiikka
   ```

### Liittyvät esimerkit

- **[Retail Multi-Agent](../retail-scenario.md)** - Kehittynyt monitoimija-arkkitehtuuri
- **[Tietokantasovellus](../../../../examples/database-app)** - Lisää pysyvä tallennus
- **[Container Apps](../../../../examples/container-app)** - Ota käyttöön konttipalveluna

### Oppimateriaalit

- 📚 [AZD For Beginners Course](../../README.md) - Pääkurssin kotisivu
- 📚 [Azure OpenAI Documentation](https://learn.microsoft.com/azure/ai-services/openai/) - Viralliset dokumentit
- 📚 [OpenAI API Reference](https://platform.openai.com/docs/api-reference) - API-yksityiskohdat
- 📚 [Vastuullinen tekoäly](https://www.microsoft.com/ai/responsible-ai) - Parhaat käytännöt

## Lisäresurssit

### Dokumentaatio
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Täydellinen opas
- **[GPT-4-mallit](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Mallien ominaisuudet
- **[Sisällönsuodatus](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Turvaominaisuudet
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd-viite

### Opetusohjelmat
- **[OpenAI Pika-aloitus](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Ensimmäinen käyttöönotto
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Chat-sovellusten rakentaminen
- **[Toimintokutsut](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Kehittyneet ominaisuudet

### Työkalut
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Verkkopohjainen käyttöympäristö
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - Parempien kehotteiden kirjoittaminen
- **[Token-laskuri](https://platform.openai.com/tokenizer)** - Arvioi tokenien käyttö

### Yhteisö
- **[Azure AI Discord](https://discord.gg/azure)** - Hanki apua yhteisöltä
- **[GitHub-keskustelut](https://github.com/Azure-Samples/openai/discussions)** - Kysymys-vastaus-foorumi
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Viimeisimmät päivitykset

---

**🎉 Onnistui!** Olet ottanut käyttöön Azure OpenAI:n ja rakentanut toimivan chat-sovelluksen. Aloita GPT-4:n ominaisuuksien tutkiminen ja kokeile erilaisia kehotteita ja käyttötapauksia.

**Kysymyksiä?** [Avaa ongelma](https://github.com/microsoft/AZD-for-beginners/issues) tai tarkista [FAQ](../../resources/faq.md)

**Kustannusvaroitus:** Muista ajaa `azd down`, kun olet valmis testaamaan, jotta vältät jatkuvat kulut (~$50-100/kuukausi aktiivisessa käytössä).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->