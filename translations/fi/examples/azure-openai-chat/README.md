# Microsoft Foundry Models -chat-sovellus

**Oppimispolku:** Keskitaso ⭐⭐ | **Aika:** 35-45 minuuttia | **Kustannus:** $50-200/month

Täydellinen Microsoft Foundry Models -chat-sovellus, joka on otettu käyttöön Azure Developer CLI:llä (azd). Tämä esimerkki demonstroi gpt-4.1-mallin käyttöönoton, turvallisen API-käytön ja yksinkertaisen chat-käyttöliittymän.

## 🎯 Mitä opit

- Ota Microsoft Foundry Models -palvelu käyttöön gpt-4.1-mallilla
- Suojaa OpenAI API -avaimet Key Vaultilla
- Rakenna yksinkertainen chat-käyttöliittymä Pythonilla
- Seuraa tokenien käyttöä ja kustannuksia
- Toteuta pyyntörajoitus ja virheenkäsittely

## 📦 Mitä sisältyy

✅ **Microsoft Foundry Models -palvelu** - gpt-4.1-mallin käyttöönotto  
✅ **Python-chat-sovellus** - Yksinkertainen komentorivikeskustelukäyttöliittymä  
✅ **Key Vault -integraatio** - Turvallinen API-avainten säilytys  
✅ **ARM-mallit** - Täydellinen infrastruktuuri koodina  
✅ **Kustannusseuranta** - Token-käytön seuranta  
✅ **Käyttörajoitukset** - Estä kiintiön loppuminen  

## Arkkitehtuuri

```mermaid
graph TD
    App[Python-chat-sovellus<br/>Paikallinen/Pilvi<br/>Komentorivikäyttöliittymä<br/>Keskusteluhistoria<br/>Tokenien käytön seuranta] -- "HTTPS (API-avain)" --> Foundry[Microsoft Foundry -mallipalvelu<br/>gpt-4.1-malli<br/>20K tokenia/min kapasiteetti<br/>Monialueinen vikatilansiirto]
    Foundry --> KV[Azure Key Vault<br/>OpenAI API -avain<br/>Päätepisteen URL]
    Foundry -. Hallittu identiteetti .-> KV
```
## Ennakkovaatimukset

### Pakolliset

- **Azure Developer CLI (azd)** - [Asennusohje](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure-tilaus** with OpenAI access - [Hae käyttöoikeutta](https://aka.ms/oai/access)
- **Python 3.9+** - [Asenna Python](https://www.python.org/downloads/)

### Tarkista ennakkovaatimukset

```bash
# Tarkista azd-versio (vaaditaan vähintään 1.5.0)
azd version

# Varmista Azure-kirjautuminen
azd auth login

# Tarkista Python-versio
python --version  # tai python3 --version

# Varmista OpenAI-pääsy (tarkista Azure-portaalista)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Tärkeää:** Microsoft Foundry Models vaatii sovelluslupaa. Jos et ole hakenut, käy osoitteessa [aka.ms/oai/access](https://aka.ms/oai/access). Hyväksyntä kestää tyypillisesti 1-2 arkipäivää.

## ⏱️ Käyttöönoton aikataulu

| Phase | Duration | What Happens |
|-------|----------|--------------|
| Ennakkotarkistus | 2-3 minutes | Varmista OpenAI-kiintiön saatavuus |
| Ota infrastruktuuri käyttöön | 8-12 minutes | Ota käyttöön OpenAI, Key Vault ja malli |
| Konfiguroi sovellus | 2-3 minutes | Määritä ympäristö ja riippuvuudet |
| **Yhteensä** | **12-18 minutes** | Valmis keskustelemaan gpt-4.1:n kanssa |

**Huom:** Ensimmäinen OpenAI:n käyttöönotto saattaa kestää pidempään mallin provisioinnin vuoksi.

## Pika-aloitus

```bash
# Siirry esimerkkiin
cd examples/azure-openai-chat

# Alusta ympäristö
azd env new myopenai

# Ota kaikki käyttöön (infrastruktuuri + konfiguraatio)
azd up
# Sinulta kysytään:
# 1. Valitse Azure-tilaus
# 2. Valitse sijainti, jossa OpenAI on saatavilla (esim. eastus, eastus2, westus)
# 3. Odota 12–18 minuuttia käyttöönoton valmistumista

# Asenna Python-riippuvuudet
pip install -r requirements.txt

# Aloita keskustelu!
python chat.py
```

**Odotettu tulos:**
```
🤖 Microsoft Foundry Models Chat Application
Connected to: gpt-4.1 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Microsoft Foundry Models.
Assistant: Microsoft Foundry Models Service provides REST API access to OpenAI's powerful language models including gpt-4.1, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Varmista käyttöönotto

### Vaihe 1: Tarkista Azure-resurssit

```bash
# Näytä käyttöön otetut resurssit
azd show

# Odotettu tulostus näyttää:
# - OpenAI-palvelu: (resurssin nimi)
# - Key Vault: (resurssin nimi)
# - Käyttöönotto: gpt-4.1
# - Sijainti: eastus (tai valitsemasi alue)
```

### Vaihe 2: Testaa OpenAI-API

```bash
# Hae OpenAI:n päätepiste ja avain
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Testaa API-kutsu
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4.1/chat/completions?api-version=2024-08-01-preview" \
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

### Vaihe 3: Varmista Key Vault -käyttöoikeudet

```bash
# Luettele Key Vaultin salaisuudet
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
- ✅ OpenAI-palvelu käyttöönotettu gpt-4.1:llä
- ✅ API-kutsu palauttaa kelvollisen vastauksen
- ✅ Salaisuudet tallennettu Key Vaultiin
- ✅ Token-käytön seuranta toimii

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
- **Virheenkäsittely** - Käsittelee käyttörajoituksia ja API-virheitä sujuvasti
- **Kustannusarvio** - Reaaliaikainen kustannuslaskenta per viesti
- **Streaming-tuki** - Valinnaiset suoratoistovastaukset

### Komennot

Keskustelun aikana voit käyttää:
- `quit` tai `exit` - Lopeta istunto
- `clear` - Tyhjennä keskusteluhistoria
- `tokens` - Näytä kokonais-token-käyttö
- `cost` - Näytä arvioitu kokonaiskustannus

### Konfiguraatio (`config.py`)

Lataa asetukset ympäristömuuttujista:
```python
AZURE_OPENAI_ENDPOINT  # Key Vaultista
AZURE_OPENAI_API_KEY   # Key Vaultista
AZURE_OPENAI_MODEL     # Oletus: gpt-4.1
AZURE_OPENAI_MAX_TOKENS # Oletus: 800
```

## Käyttöesimerkit

### Peruschat

```bash
python chat.py
```

### Keskustele mukautetulla mallilla

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
You: Explain Microsoft Foundry Models Service in 3 sentences.
Assistant: Microsoft Foundry Models Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like gpt-4.1 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Microsoft Foundry Models Service offers several model families including gpt-4.1 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## Kustannusten hallinta

### Token-hinnat (gpt-4.1)

| Malli | Syöte (per 1K tokenia) | Vastaus (per 1K tokenia) |
|-------|------------------------|--------------------------|
| gpt-4.1 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Arvioidut kuukausikustannukset

Perustuen käyttökuvioihin:

| Käyttötaso | Viestejä/pv | Tokenit/pv | Kuukausikustannus |
|-------------|--------------|------------|-------------------|
| **Kevyt** | 20 messages | 3,000 tokens | $3-5 |
| **Kohtalainen** | 100 messages | 15,000 tokens | $15-25 |
| **Raskas** | 500 messages | 75,000 tokens | $75-125 |

**Perusinfrastruktuurin kustannus:** $1-2/month (Key Vault + minimal compute)

### Kustannusten optimointivinkit

```bash
# 1. Käytä GPT-3.5-Turboa yksinkertaisempiin tehtäviin (20 kertaa halvempaa)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Vähennä maksimitokenien määrää lyhyempiä vastauksia varten
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Seuraa tokenien käyttöä
python chat.py --show-tokens

# 4. Ota käyttöön budjettihälytykset
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Valvonta

### Näytä token-käyttö

```bash
# Azure-portaalissa:
# OpenAI-resurssi → Mittarit → Valitse "Token Transaction"

# Tai Azure CLI:n kautta:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Näytä API-lokit

```bash
# Suoratoista diagnostiikkalokit
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Kyselylokit
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Vianetsintä

### Ongelma: "Access Denied" -virhe

**Oireet:** 403 Forbidden when calling API

**Ratkaisut:**
```bash
# 1. Varmista, että OpenAI-käyttöoikeus on hyväksytty
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Tarkista, että API-avain on oikein
azd env get-value AZURE_OPENAI_API_KEY

# 3. Varmista, että päätepisteen URL:n muoto on oikea
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
  --deployment-name gpt-4.1

# 2. Pyydä kiintiön korotusta (tarvittaessa)
# Siirry Azure-portaaliin → OpenAI-resurssi → Kiintiöt → Pyydä korotusta

# 3. Toteuta uudelleenyritysten logiikka (jo chat.py:ssä)
# Sovellus yrittää automaattisesti uudelleen eksponentiaalisen viiveen avulla
```

### Ongelma: "Model Not Found"

**Oireet:** 404 error for deployment

**Ratkaisut:**
```bash
# 1. Listaa saatavilla olevat käyttöönotot
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Varmista mallin nimi ympäristössä
echo $AZURE_OPENAI_MODEL

# 3. Päivitä oikeaan käyttöönoton nimeen
export AZURE_OPENAI_MODEL=gpt-4.1  # tai gpt-35-turbo
```

### Ongelma: Korkea viive

**Oireet:** Slow response times (>5 seconds)

**Ratkaisut:**
```bash
# 1. Tarkista alueellinen viive
# Ota käyttöön alueelle, joka on lähimpänä käyttäjiä

# 2. Vähennä max_tokens-arvoa nopeampien vastausten saamiseksi
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Käytä suoratoistoa paremman käyttökokemuksen saavuttamiseksi
python chat.py --stream
```

## Tietoturvan parhaat käytännöt

### 1. Suojaa API-avaimet

```bash
# Älä koskaan tallenna avaimia versionhallintaan
# Käytä Key Vaultia (jo määritetty)

# Vaihda avaimia säännöllisesti
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Ota käyttöön sisällön suodatus

```python
# Microsoft Foundry Models sisältää sisäänrakennetun sisällönsuodatuksen
# Määritä Azure-portaalissa:
# OpenAI-resurssi → Sisältösuodattimet → Luo mukautettu suodatin

# Kategoriat: Vihapuhe, Seksuaalinen sisältö, Väkivalta, Itsevahingoittelu
# Tasot: Matala, Keskitaso, Korkea
```

### 3. Käytä hallittua identiteettiä (tuotannossa)

```bash
# Tuotantoympäristössä käytä hallittua identiteettiä
# API-avainten sijaan (vaatii sovelluksen isännöinnin Azuren pilvessä)

# Päivitä infra/openai.bicep sisältämään:
# identity: { type: 'SystemAssigned' }
```

## Kehitys

### Suorita paikallisesti

```bash
# Asenna riippuvuudet
pip install -r src/requirements.txt

# Aseta ympäristömuuttujat
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4.1"

# Suorita sovellus
python src/chat.py
```

### Suorita testit

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

## Siivoaminen

```bash
# Poista kaikki Azure-resurssit
azd down --force --purge

# Tämä poistaa:
# - OpenAI-palvelun
# - Key Vault (90 päivän pehmeä poisto)
# - Resurssiryhmä
# - Kaikki käyttöönotot ja määritykset
```

## Seuraavat askeleet

### Laajenna tätä esimerkkiä

1. **Lisää web-käyttöliittymä** - Rakenna React/Vue-frontti
   ```bash
   # Lisää frontend-palvelu azure.yaml-tiedostoon
   # Ota käyttöön Azure Static Web Apps -palveluun
   ```

2. **Ota RAG käyttöön** - Lisää asiakirjahaku Azure AI Searchin avulla
   ```python
   # Integroi Azure Cognitive Search
   # Lataa asiakirjat ja luo vektori-indeksi
   ```

3. **Ota funktiokutsut käyttöön** - Mahdollista työkalujen käyttö
   ```python
   # Määrittele funktiot tiedostossa chat.py
   # Salli gpt-4.1 kutsua ulkoisia API:ja
   ```

4. **Monimallituki** - Käytä useita malleja
   ```bash
   # Lisää gpt-35-turbo- ja upotusmallit
   # Toteuta mallien reitityksen logiikka
   ```

### Aiheeseen liittyvät esimerkit

- **[Vähittäiskaupan moni-agentti](../retail-scenario.md)** - Kehittynyt moni-agenttiarkkitehtuuri
- **[Tietokantasovellus](../../../../examples/database-app)** - Lisää pysyvä tallennus
- **[Konttisovellukset](../../../../examples/container-app)** - Ota käyttöön konttien avulla

### Oppimateriaalit

- 📚 [AZD Aloittelijoille -kurssi](../../README.md) - Kurssin pääsivu
- 📚 [Microsoft Foundry Models -dokumentaatio](https://learn.microsoft.com/azure/ai-services/openai/) - Viralliset ohjeet
- 📚 [OpenAI API -viite](https://platform.openai.com/docs/api-reference) - API-tiedot
- 📚 [Vastuullinen tekoäly](https://www.microsoft.com/ai/responsible-ai) - Parhaat käytännöt

## Lisäresurssit

### Dokumentaatio
- **[Microsoft Foundry Models -palvelu](https://learn.microsoft.com/azure/ai-services/openai/)** - Kattava opas
- **[gpt-4.1 -mallit](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Mallin ominaisuudet
- **[Sisällön suodatus](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Turvaominaisuudet
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd-viite

### Opastus
- **[OpenAI Pika-aloitus](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Ensimmäinen käyttöönotto
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Keskustelusovellusten rakentaminen
- **[Funktiokutsut](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Kehittyneet ominaisuudet

### Työkalut
- **[Microsoft Foundry Models Studio](https://oai.azure.com/)** - Verkkopohjainen kokeiluympäristö
- **[Kehoteinsinöörin opas](https://platform.openai.com/docs/guides/prompt-engineering)** - Parempien kehotteiden kirjoittaminen
- **[Token-laskin](https://platform.openai.com/tokenizer)** - Arvioi token-käyttö

### Yhteisö
- **[Azure AI Discord](https://discord.gg/azure)** - Hanki apua yhteisöltä
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Kysymys- ja vastausfoorumi
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Viimeisimmät päivitykset

---

**🎉 Onnistui!** Olet ottanut Microsoft Foundry Modelsin käyttöön ja rakentanut toimivan chat-sovelluksen. Ala tutkia gpt-4.1:n ominaisuuksia ja kokeilla erilaisia kehotteita ja käyttötapauksia.

**Kysyttävää?** [Avaa issue](https://github.com/microsoft/AZD-for-beginners/issues) tai katso [UKK](../../resources/faq.md)

**Kustannusvaroitus:** Muista suorittaa `azd down` testauksen jälkeen välttääksesi jatkuvia kuluja (~$50-100/month for active usage).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tämä asiakirja on käännetty käyttämällä tekoälykäännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Pyrimme tarkkuuteen, mutta otathan huomioon, että automatisoiduissa käännöksissä voi esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää auktoritatiivisena lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tästä käännöksestä aiheutuvista väärinymmärryksistä tai virhetulkinta tilanteista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->