# Azure OpenAI vestlusrakendus

**Õppetasand:** Kesktase ⭐⭐ | **Aeg:** 35-45 minutit | **Kulu:** $50-200/kuus

Täielik Azure OpenAI vestlusrakendus, mis on juurutatud Azure Developer CLI (azd) abil. See näide demonstreerib GPT-4 juurutamist, turvalist API ligipääsu ja lihtsat vestlusliidest.

## 🎯 Mida õpid

- Juurutada Azure OpenAI teenus koos GPT-4 mudeliga
- Turvata OpenAI API võtmeid Key Vault abil
- Luua lihtne vestlusliides Pythonis
- Jälgida tokenite kasutust ja kulusid
- Rakendada kiirusepiiranguid ja vigade käsitlemist

## 📦 Mis on kaasas

✅ **Azure OpenAI teenus** - GPT-4 mudeli juurutamine  
✅ **Python vestlusrakendus** - Lihtne käsurea vestlusliides  
✅ **Key Vault integratsioon** - Turvaline API võtmete salvestus  
✅ **ARM mallid** - Täielik infrastruktuur koodina  
✅ **Kulukontroll** - Tokenite kasutuse jälgimine  
✅ **Kiirusepiirangud** - Kvoodi ammendumise vältimine  

## Arhitektuur

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

## Eeltingimused

### Vajalik

- **Azure Developer CLI (azd)** - [Paigaldusjuhend](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure tellimus** koos OpenAI ligipääsuga - [Taotle ligipääsu](https://aka.ms/oai/access)
- **Python 3.9+** - [Laadi alla Python](https://www.python.org/downloads/)

### Eeltingimuste kontrollimine

```bash
# Kontrolli azd versiooni (vaja 1.5.0 või uuemat)
azd version

# Kinnita Azure'i sisselogimine
azd auth login

# Kontrolli Python'i versiooni
python --version  # või python3 --version

# Kinnita OpenAI ligipääs (kontrolli Azure'i portaalis)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Tähtis:** Azure OpenAI vajab rakenduse heakskiitu. Kui sa pole veel taotlenud, külasta [aka.ms/oai/access](https://aka.ms/oai/access). Heakskiit võtab tavaliselt 1-2 tööpäeva.

## ⏱️ Juurutamise ajakava

| Faas | Kestus | Mis toimub |
|------|--------|------------|
| Eeltingimuste kontroll | 2-3 minutit | Kontrolli OpenAI kvoodi saadavust |
| Infrastruktuuri juurutamine | 8-12 minutit | Loo OpenAI, Key Vault, mudeli juurutamine |
| Rakenduse seadistamine | 2-3 minutit | Keskkonna ja sõltuvuste seadistamine |
| **Kokku** | **12-18 minutit** | Valmis vestlema GPT-4-ga |

**Märkus:** Esmakordne OpenAI juurutamine võib võtta kauem aega mudeli ettevalmistamise tõttu.

## Kiirstart

```bash
# Liigu näite juurde
cd examples/azure-openai-chat

# Algata keskkond
azd env new myopenai

# Paigalda kõik (infrastruktuur + konfiguratsioon)
azd up
# Teile kuvatakse järgmised juhised:
# 1. Valige Azure'i tellimus
# 2. Valige asukoht, kus OpenAI on saadaval (nt eastus, eastus2, westus)
# 3. Oodake 12-18 minutit paigaldamiseks

# Paigalda Python'i sõltuvused
pip install -r requirements.txt

# Alusta vestlust!
python chat.py
```

**Oodatav väljund:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Juurutamise kontrollimine

### Samm 1: Kontrolli Azure ressursse

```bash
# Vaata juurutatud ressursse
azd show

# Oodatav väljund näitab:
# - OpenAI teenus: (ressursi nimi)
# - Key Vault: (ressursi nimi)
# - Juurutus: gpt-4
# - Asukoht: eastus (või teie valitud piirkond)
```

### Samm 2: Testi OpenAI API-d

```bash
# Hangi OpenAI lõpp-punkt ja võti
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Testi API kõnet
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Oodatav vastus:**
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

### Samm 3: Kontrolli Key Vault ligipääsu

```bash
# Loetle saladused Key Vaultis
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Oodatavad saladused:**
- `openai-api-key`
- `openai-endpoint`

**Edu kriteeriumid:**
- ✅ OpenAI teenus juurutatud koos GPT-4-ga
- ✅ API kõne tagastab kehtiva vastuse
- ✅ Saladused salvestatud Key Vaulti
- ✅ Tokenite kasutuse jälgimine töötab

## Projekti struktuur

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

## Rakenduse funktsioonid

### Vestlusliides (`chat.py`)

Vestlusrakendus sisaldab:

- **Vestluse ajalugu** - Säilitab konteksti sõnumite vahel
- **Tokenite loendamine** - Jälgib kasutust ja hindab kulusid
- **Vigade käsitlemine** - Sujuv käsitlemine kiirusepiirangute ja API vigade korral
- **Kulukalkulatsioon** - Reaalajas kuluarvutus sõnumi kohta
- **Voogesituse tugi** - Valikuline voogesituse vastus

### Käsklused

Vestluse ajal saad kasutada:
- `quit` või `exit` - Lõpeta sessioon
- `clear` - Kustuta vestluse ajalugu
- `tokens` - Näita tokenite kogukasutust
- `cost` - Näita hinnangulist kogukulu

### Konfiguratsioon (`config.py`)

Laeb konfiguratsiooni keskkonnamuutujatest:
```python
AZURE_OPENAI_ENDPOINT  # Võtmehoidlast
AZURE_OPENAI_API_KEY   # Võtmehoidlast
AZURE_OPENAI_MODEL     # Vaikimisi: gpt-4
AZURE_OPENAI_MAX_TOKENS # Vaikimisi: 800
```

## Kasutusnäited

### Põhivestlus

```bash
python chat.py
```

### Vestlus kohandatud mudeliga

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Vestlus voogesitusega

```bash
python chat.py --stream
```

### Näidisvestlus

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

## Kulude haldamine

### Tokenite hinnakujundus (GPT-4)

| Mudel | Sisend (1K tokeni kohta) | Väljund (1K tokeni kohta) |
|-------|--------------------------|--------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Hinnangulised kuukulud

Põhinedes kasutusmustritel:

| Kasutustase | Sõnumid/päev | Tokenid/päev | Kuukulu |
|-------------|--------------|--------------|---------|
| **Kerge** | 20 sõnumit | 3,000 tokenit | $3-5 |
| **Mõõdukas** | 100 sõnumit | 15,000 tokenit | $15-25 |
| **Raske** | 500 sõnumit | 75,000 tokenit | $75-125 |

**Põhiinfrastruktuuri kulu:** $1-2/kuus (Key Vault + minimaalne arvutusvõimsus)

### Kulude optimeerimise näpunäited

```bash
# 1. Kasuta GPT-3.5-Turbo lihtsamate ülesannete jaoks (20x odavam)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Vähenda maksimaalsete tokenite arvu lühemate vastuste jaoks
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Jälgi tokenite kasutust
python chat.py --show-tokens

# 4. Sea eelarvehoiatused
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Jälgimine

### Vaata tokenite kasutust

```bash
# Azure portaalis:
# OpenAI ressurss → Mõõdikud → Vali "Tokenite tehing"

# Või Azure CLI kaudu:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Vaata API logisid

```bash
# Edasta diagnostikapäevikud
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Päringupäevikud
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Tõrkeotsing

### Probleem: "Ligipääs keelatud" viga

**Sümptomid:** 403 Forbidden API kõne ajal

**Lahendused:**
```bash
# 1. Kontrolli, kas OpenAI juurdepääs on heaks kiidetud
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Kontrolli, kas API võti on õige
azd env get-value AZURE_OPENAI_API_KEY

# 3. Kontrolli lõpp-punkti URL-i vormingut
azd env get-value AZURE_OPENAI_ENDPOINT
# Peaks olema: https://[name].openai.azure.com/
```

### Probleem: "Kiirusepiirang ületatud"

**Sümptomid:** 429 Liiga palju päringuid

**Lahendused:**
```bash
# 1. Kontrolli praegust kvooti
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Taotle kvoodi suurendamist (kui vaja)
# Mine Azure Portaal → OpenAI Ressurss → Kvoodid → Taotle suurendamist

# 3. Rakenda uuesti proovimise loogika (juba chat.py-s)
# Rakendus proovib automaatselt uuesti eksponentsiaalse viivitusega
```

### Probleem: "Mudel puudub"

**Sümptomid:** 404 viga juurutamisel

**Lahendused:**
```bash
# 1. Loetle saadaval olevad juurutused
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Kontrolli mudeli nime keskkonnas
echo $AZURE_OPENAI_MODEL

# 3. Uuenda õige juurutuse nimega
export AZURE_OPENAI_MODEL=gpt-4  # või gpt-35-turbo
```

### Probleem: Kõrge latentsus

**Sümptomid:** Aeglased vastused (>5 sekundit)

**Lahendused:**
```bash
# 1. Kontrolli piirkondlikku latentsust
# Paigalda kasutajatele lähimasse piirkonda

# 2. Vähenda max_tokens kiiremaks vastamiseks
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Kasuta voogesitust parema kasutajakogemuse jaoks
python chat.py --stream
```

## Turvalisuse parimad tavad

### 1. Kaitse API võtmeid

```bash
# Ära kunagi salvesta võtmeid versioonihaldusesse
# Kasuta Key Vault'i (juba seadistatud)

# Pööra võtmeid regulaarselt
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Rakenda sisufiltreerimine

```python
# Azure OpenAI sisaldab sisseehitatud sisufiltreerimist
# Konfigureeri Azure Portaalis:
# OpenAI Ressurss → Sisufiltrid → Loo Kohandatud Filter

# Kategooriad: Vihkamine, Seksuaalne, Vägivald, Enesevigastus
# Tasemed: Madal, Keskmine, Kõrge filtreerimine
```

### 3. Kasuta hallatud identiteeti (tootmises)

```bash
# Tootmises kasutamiseks kasuta hallatud identiteeti
# API võtmete asemel (nõuab rakenduse majutamist Azure'is)

# Uuenda infra/openai.bicep, et lisada:
# identiteet: { tüüp: 'SystemAssigned' }
```

## Arendus

### Käivita lokaalselt

```bash
# Paigalda sõltuvused
pip install -r src/requirements.txt

# Määra keskkonnamuutujad
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Käivita rakendus
python src/chat.py
```

### Käivita testid

```bash
# Paigalda testisõltuvused
pip install pytest pytest-cov

# Käivita testid
pytest tests/ -v

# Katvusega
pytest tests/ --cov=src --cov-report=html
```

### Uuenda mudeli juurutust

```bash
# Paigalda erinev mudeli versioon
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

## Puhastamine

```bash
# Kustuta kõik Azure'i ressursid
azd down --force --purge

# See eemaldab:
# - OpenAI teenus
# - Key Vault (90-päevane pehme kustutamine)
# - Ressursigrupp
# - Kõik juurutused ja konfiguratsioonid
```

## Järgmised sammud

### Laienda seda näidet

1. **Lisa veebiliides** - Loo React/Vue frontend
   ```bash
   # Lisa frontend-teenus azure.yaml-i
   # Paigalda Azure Static Web Apps-i
   ```

2. **Rakenda RAG** - Lisa dokumendiotsing Azure AI Search abil
   ```python
   # Integreeri Azure Cognitive Search
   # Laadi dokumendid üles ja loo vektoriindeks
   ```

3. **Lisa funktsioonikutsed** - Luba tööriistade kasutamine
   ```python
   # Määra funktsioonid failis chat.py
   # Luba GPT-4-l väliseid API-sid kutsuda
   ```

4. **Mitme mudeli tugi** - Juuruta mitu mudelit
   ```bash
   # Lisa gpt-35-turbo, sisumudelite mudeleid
   # Rakenda mudeli suunamisloogika
   ```

### Seotud näited

- **[Jaemüügi multi-agent](../retail-scenario.md)** - Täiustatud multi-agent arhitektuur
- **[Andmebaasi rakendus](../../../../examples/database-app)** - Lisa püsiv salvestus
- **[Konteinerirakendused](../../../../examples/container-app)** - Juuruta konteineriseeritud teenusena

### Õppematerjalid

- 📚 [AZD algajatele kursus](../../README.md) - Põhikursuse koduleht
- 📚 [Azure OpenAI dokumentatsioon](https://learn.microsoft.com/azure/ai-services/openai/) - Ametlikud dokumendid
- 📚 [OpenAI API viide](https://platform.openai.com/docs/api-reference) - API üksikasjad
- 📚 [Vastutustundlik AI](https://www.microsoft.com/ai/responsible-ai) - Parimad tavad

## Täiendavad ressursid

### Dokumentatsioon
- **[Azure OpenAI teenus](https://learn.microsoft.com/azure/ai-services/openai/)** - Täielik juhend
- **[GPT-4 mudelid](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Mudeli võimalused
- **[Sisufiltreerimine](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Turvafunktsioonid
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd viide

### Õpetused
- **[OpenAI kiirstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Esimene juurutus
- **[Vestluse lõpetused](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Vestlusrakenduste loomine
- **[Funktsioonikutsed](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Täiustatud funktsioonid

### Tööriistad
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Veebipõhine mänguväljak
- **[Prompt Engineering juhend](https://platform.openai.com/docs/guides/prompt-engineering)** - Parema sisendi kirjutamine
- **[Tokenite kalkulaator](https://platform.openai.com/tokenizer)** - Tokenite kasutuse hindamine

### Kogukond
- **[Azure AI Discord](https://discord.gg/azure)** - Abi kogukonnalt
- **[GitHub arutelud](https://github.com/Azure-Samples/openai/discussions)** - Küsimuste ja vastuste foorum
- **[Azure blogi](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Viimased uuendused

---

**🎉 Edu!** Oled juurutanud Azure OpenAI ja loonud töötava vestlusrakenduse. Alusta GPT-4 võimaluste uurimist ja katseta erinevaid sisendeid ja kasutusjuhtumeid.

**Küsimusi?** [Ava probleem](https://github.com/microsoft/AZD-for-beginners/issues) või vaata [KKK-d](../../resources/faq.md)

**Kulude hoiatus:** Pea meeles käivitada `azd down`, kui testimine on lõpetatud, et vältida jätkuvaid kulusid (~$50-100/kuus aktiivse kasutuse korral).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->