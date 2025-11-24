<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fc2d5d2f2f572c99876be92d82680e22",
  "translation_date": "2025-11-23T23:40:22+00:00",
  "source_file": "examples/azure-openai-chat/README.md",
  "language_code": "sl"
}
-->
# Azure OpenAI Chat Aplikacija

**Učna pot:** Srednje ⭐⭐ | **Čas:** 35-45 minut | **Strošek:** $50-200/mesec

Popolna Azure OpenAI klepetalna aplikacija, nameščena z uporabo Azure Developer CLI (azd). Ta primer prikazuje namestitev GPT-4, varno dostopanje do API-ja in preprost klepetalni vmesnik.

## 🎯 Kaj se boste naučili

- Namestitev storitve Azure OpenAI z modelom GPT-4
- Varno shranjevanje API ključev v Key Vault
- Izdelava preprostega klepetalnega vmesnika s Pythonom
- Spremljanje uporabe žetonov in stroškov
- Uvedba omejevanja hitrosti in obravnava napak

## 📦 Kaj je vključeno

✅ **Azure OpenAI Service** - Namestitev modela GPT-4  
✅ **Python Chat App** - Preprost klepetalni vmesnik v ukazni vrstici  
✅ **Integracija Key Vault** - Varno shranjevanje API ključev  
✅ **ARM Templates** - Popolna infrastruktura kot koda  
✅ **Spremljanje stroškov** - Sledenje uporabi žetonov  
✅ **Omejevanje hitrosti** - Preprečevanje izčrpanja kvote  

## Arhitektura

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

## Predpogoji

### Zahtevano

- **Azure Developer CLI (azd)** - [Navodila za namestitev](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure naročnina** z dostopom do OpenAI - [Zaprosite za dostop](https://aka.ms/oai/access)
- **Python 3.9+** - [Namestite Python](https://www.python.org/downloads/)

### Preverite predpogoje

```bash
# Preverite azd različico (potrebna je 1.5.0 ali višja)
azd version

# Preverite prijavo v Azure
azd auth login

# Preverite različico Pythona
python --version  # ali python3 --version

# Preverite dostop do OpenAI (preverite v Azure Portalu)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Pomembno:** Azure OpenAI zahteva odobritev aplikacije. Če še niste zaprosili, obiščite [aka.ms/oai/access](https://aka.ms/oai/access). Odobritev običajno traja 1-2 delovna dneva.

## ⏱️ Časovnica namestitve

| Faza | Trajanje | Kaj se zgodi |
|------|----------|-------------|
| Preverjanje predpogojev | 2-3 minute | Preverite razpoložljivost kvote OpenAI |
| Namestitev infrastrukture | 8-12 minut | Ustvarite OpenAI, Key Vault, namestitev modela |
| Konfiguracija aplikacije | 2-3 minute | Nastavite okolje in odvisnosti |
| **Skupaj** | **12-18 minut** | Pripravljeno za klepet z GPT-4 |

**Opomba:** Prva namestitev OpenAI lahko traja dlje zaradi priprave modela.

## Hitri začetek

```bash
# Pomaknite se do primera
cd examples/azure-openai-chat

# Inicializirajte okolje
azd env new myopenai

# Namestite vse (infrastrukturo + konfiguracijo)
azd up
# Pozvani boste, da:
# 1. Izberete naročnino na Azure
# 2. Izberete lokacijo z razpoložljivostjo OpenAI (npr. eastus, eastus2, westus)
# 3. Počakate 12-18 minut za namestitev

# Namestite Python odvisnosti
pip install -r requirements.txt

# Začnite klepetati!
python chat.py
```

**Pričakovani rezultat:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Preverite namestitev

### Korak 1: Preverite Azure vire

```bash
# Ogled razporejenih virov
azd show

# Pričakovani izhod prikazuje:
# - OpenAI storitev: (ime vira)
# - Key Vault: (ime vira)
# - Razporeditev: gpt-4
# - Lokacija: eastus (ali vaša izbrana regija)
```

### Korak 2: Testirajte OpenAI API

```bash
# Pridobi OpenAI končno točko in ključ
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Preizkusi API klic
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Pričakovani odgovor:**
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

### Korak 3: Preverite dostop do Key Vault

```bash
# Seznam skrivnosti v Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Pričakovane skrivnosti:**
- `openai-api-key`
- `openai-endpoint`

**Merila uspeha:**
- ✅ Storitev OpenAI nameščena z GPT-4
- ✅ API klic vrne veljaven rezultat
- ✅ Skrivnosti shranjene v Key Vault
- ✅ Sledenje uporabi žetonov deluje

## Struktura projekta

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

## Funkcije aplikacije

### Klepetalni vmesnik (`chat.py`)

Klepetalna aplikacija vključuje:

- **Zgodovina pogovorov** - Ohranja kontekst med sporočili
- **Štetje žetonov** - Sledi uporabi in ocenjuje stroške
- **Obravnava napak** - Prijazno obravnavanje omejitev hitrosti in API napak
- **Ocena stroškov** - Izračun stroškov v realnem času za vsako sporočilo
- **Podpora za pretakanje** - Možnost pretakanja odgovorov

### Ukazi

Med klepetom lahko uporabite:
- `quit` ali `exit` - Končajte sejo
- `clear` - Počistite zgodovino pogovorov
- `tokens` - Prikažite skupno uporabo žetonov
- `cost` - Prikažite oceno skupnih stroškov

### Konfiguracija (`config.py`)

Naloži konfiguracijo iz okoljskih spremenljivk:
```python
AZURE_OPENAI_ENDPOINT  # Iz trezorja ključev
AZURE_OPENAI_API_KEY   # Iz trezorja ključev
AZURE_OPENAI_MODEL     # Privzeto: gpt-4
AZURE_OPENAI_MAX_TOKENS # Privzeto: 800
```

## Primeri uporabe

### Osnovni klepet

```bash
python chat.py
```

### Klepet z lastnim modelom

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Klepet s pretakanjem

```bash
python chat.py --stream
```

### Primer pogovora

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

## Upravljanje stroškov

### Cenik žetonov (GPT-4)

| Model | Vnos (na 1K žetonov) | Izhod (na 1K žetonov) |
|-------|----------------------|-----------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Ocenjeni mesečni stroški

Na podlagi vzorcev uporabe:

| Raven uporabe | Sporočila/dan | Žetoni/dan | Mesečni strošek |
|---------------|---------------|------------|-----------------|
| **Lahka** | 20 sporočil | 3,000 žetonov | $3-5 |
| **Zmerna** | 100 sporočil | 15,000 žetonov | $15-25 |
| **Intenzivna** | 500 sporočil | 75,000 žetonov | $75-125 |

**Osnovni strošek infrastrukture:** $1-2/mesec (Key Vault + minimalna računska zmogljivost)

### Nasveti za optimizacijo stroškov

```bash
# 1. Uporabite GPT-3.5-Turbo za enostavnejše naloge (20x ceneje)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Zmanjšajte največje število tokenov za krajše odgovore
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Spremljajte uporabo tokenov
python chat.py --show-tokens

# 4. Nastavite opozorila o proračunu
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Spremljanje

### Pregled uporabe žetonov

```bash
# V Azure Portal:
# OpenAI Resource → Meritve → Izberite "Token Transaction"

# Ali prek Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Pregled API dnevnikov

```bash
# Pretok diagnostičnih dnevnikov
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Poizvedba dnevnikov
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Odpravljanje težav

### Težava: Napaka "Access Denied"

**Simptomi:** 403 Forbidden pri klicu API-ja

**Rešitve:**
```bash
# 1. Preverite, ali je dostop do OpenAI odobren
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Preverite, ali je API ključ pravilen
azd env get-value AZURE_OPENAI_API_KEY

# 3. Preverite format URL-ja končne točke
azd env get-value AZURE_OPENAI_ENDPOINT
# Moralo bi biti: https://[ime].openai.azure.com/
```

### Težava: Presežena omejitev hitrosti

**Simptomi:** 429 Too Many Requests

**Rešitve:**
```bash
# 1. Preverite trenutno kvoto
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Zahtevajte povečanje kvote (če je potrebno)
# Pojdite na Azure Portal → OpenAI Resource → Kvote → Zahtevajte povečanje

# 3. Uvedite logiko ponovnega poskusa (že v chat.py)
# Aplikacija samodejno ponavlja z eksponentnim povratnim odštevanjem
```

### Težava: Model ni najden

**Simptomi:** Napaka 404 pri namestitvi

**Rešitve:**
```bash
# 1. Naštej razpoložljive namestitve
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Preveri ime modela v okolju
echo $AZURE_OPENAI_MODEL

# 3. Posodobi na pravilno ime namestitve
export AZURE_OPENAI_MODEL=gpt-4  # ali gpt-35-turbo
```

### Težava: Visoka zakasnitev

**Simptomi:** Počasni odzivni časi (>5 sekund)

**Rešitve:**
```bash
# 1. Preveri regionalno zakasnitev
# Namesti v regijo najbližje uporabnikom

# 2. Zmanjšaj max_tokens za hitrejše odgovore
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Uporabi pretakanje za boljšo uporabniško izkušnjo
python chat.py --stream
```

## Najboljše prakse za varnost

### 1. Zaščitite API ključe

```bash
# Nikoli ne shranjujte ključev v sistem za nadzor različic
# Uporabite Key Vault (že konfiguriran)

# Redno rotirajte ključe
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Uvedite filtriranje vsebine

```python
# Azure OpenAI vključuje vgrajeno filtriranje vsebine
# Konfigurirajte v Azure Portal:
# OpenAI Resource → Filtri vsebine → Ustvari prilagojen filter

# Kategorije: Sovraštvo, Spolnost, Nasilje, Samopoškodovanje
# Stopnje: Nizko, Srednje, Visoko filtriranje
```

### 3. Uporabite upravljano identiteto (produkcija)

```bash
# Za produkcijske namestitve uporabite upravljano identiteto
# namesto API ključev (zahteva gostovanje aplikacije na Azure)

# Posodobite infra/openai.bicep, da vključuje:
# identiteta: { type: 'SystemAssigned' }
```

## Razvoj

### Zagon lokalno

```bash
# Namestite odvisnosti
pip install -r src/requirements.txt

# Nastavite okoljske spremenljivke
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Zaženite aplikacijo
python src/chat.py
```

### Zagon testov

```bash
# Namestite odvisnosti za testiranje
pip install pytest pytest-cov

# Zaženite teste
pytest tests/ -v

# Z zajemom pokritosti
pytest tests/ --cov=src --cov-report=html
```

### Posodobitev namestitve modela

```bash
# Namestite različne različice modela
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

## Čiščenje

```bash
# Izbriši vse Azure vire
azd down --force --purge

# To odstrani:
# - OpenAI storitev
# - Key Vault (z 90-dnevnim mehkim brisanjem)
# - Skupino virov
# - Vse namestitve in konfiguracije
```

## Naslednji koraki

### Razširite ta primer

1. **Dodajte spletni vmesnik** - Zgradite React/Vue frontend
   ```bash
   # Dodaj storitev frontend v azure.yaml
   # Namesti na Azure Static Web Apps
   ```

2. **Uvedite RAG** - Dodajte iskanje dokumentov z Azure AI Search
   ```python
   # Integrirajte Azure Cognitive Search
   # Naložite dokumente in ustvarite vektorski indeks
   ```

3. **Dodajte funkcijsko klicanje** - Omogočite uporabo orodij
   ```python
   # Določite funkcije v chat.py
   # Dovolite GPT-4 klicati zunanje API-je
   ```

4. **Podpora za več modelov** - Namestite več modelov
   ```bash
   # Dodaj gpt-35-turbo, modele vdelav
   # Uvedi logiko usmerjanja modelov
   ```

### Sorodni primeri

- **[Retail Multi-Agent](../retail-scenario.md)** - Napredna arhitektura z več agenti
- **[Database App](../../../../examples/database-app)** - Dodajte trajno shranjevanje
- **[Container Apps](../../../../examples/container-app)** - Namestite kot storitev v kontejnerju

### Učni viri

- 📚 [AZD Za začetnike tečaj](../../README.md) - Glavna stran tečaja
- 📚 [Azure OpenAI Dokumentacija](https://learn.microsoft.com/azure/ai-services/openai/) - Uradna dokumentacija
- 📚 [OpenAI API Referenca](https://platform.openai.com/docs/api-reference) - Podrobnosti API-ja
- 📚 [Odgovorna AI](https://www.microsoft.com/ai/responsible-ai) - Najboljše prakse

## Dodatni viri

### Dokumentacija
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Popoln vodič
- **[GPT-4 Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Zmožnosti modela
- **[Filtriranje vsebine](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Varnostne funkcije
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd referenca

### Vadnice
- **[OpenAI Hitri začetek](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Prva namestitev
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Izdelava klepetalnih aplikacij
- **[Funkcijsko klicanje](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Napredne funkcije

### Orodja
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Spletno igrišče
- **[Vodič za oblikovanje pozivov](https://platform.openai.com/docs/guides/prompt-engineering)** - Pisanje boljših pozivov
- **[Kalkulator žetonov](https://platform.openai.com/tokenizer)** - Ocena uporabe žetonov

### Skupnost
- **[Azure AI Discord](https://discord.gg/azure)** - Pomoč skupnosti
- **[GitHub Razprave](https://github.com/Azure-Samples/openai/discussions)** - Forum za vprašanja in odgovore
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Zadnje posodobitve

---

**🎉 Uspeh!** Namestili ste Azure OpenAI in zgradili delujočo klepetalno aplikacijo. Začnite raziskovati zmožnosti GPT-4 in eksperimentirajte z različnimi pozivi ter primeri uporabe.

**Vprašanja?** [Odprite težavo](https://github.com/microsoft/AZD-for-beginners/issues) ali preverite [FAQ](../../resources/faq.md)

**Opozorilo o stroških:** Ne pozabite zagnati `azd down`, ko končate testiranje, da se izognete stalnim stroškom (~$50-100/mesec za aktivno uporabo).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje AI [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku naj se šteje za avtoritativni vir. Za ključne informacije je priporočljivo profesionalno človeško prevajanje. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->