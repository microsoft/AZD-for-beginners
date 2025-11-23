<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fc2d5d2f2f572c99876be92d82680e22",
  "translation_date": "2025-11-23T12:40:33+00:00",
  "source_file": "examples/azure-openai-chat/README.md",
  "language_code": "sw"
}
-->
# Azure OpenAI Chat Application

**Njia ya Kujifunza:** Kati ⭐⭐ | **Muda:** Dakika 35-45 | **Gharama:** $50-200/mwezi

Programu kamili ya mazungumzo ya Azure OpenAI iliyowekwa kwa kutumia Azure Developer CLI (azd). Mfano huu unaonyesha usambazaji wa GPT-4, ufikiaji salama wa API, na kiolesura rahisi cha mazungumzo.

## 🎯 Utajifunza Nini

- Kusambaza Huduma ya Azure OpenAI na modeli ya GPT-4
- Kulinda funguo za API za OpenAI kwa kutumia Key Vault
- Kujenga kiolesura rahisi cha mazungumzo kwa Python
- Kufuatilia matumizi ya tokeni na gharama
- Kutekeleza mipaka ya kiwango na kushughulikia makosa

## 📦 Kinachojumuishwa

✅ **Huduma ya Azure OpenAI** - Usambazaji wa modeli ya GPT-4  
✅ **Programu ya Mazungumzo ya Python** - Kiolesura rahisi cha mazungumzo cha mstari wa amri  
✅ **Muunganisho wa Key Vault** - Hifadhi salama ya funguo za API  
✅ **Templates za ARM** - Miundombinu kamili kama msimbo  
✅ **Ufuatiliaji wa Gharama** - Kufuatilia matumizi ya tokeni  
✅ **Mipaka ya Kiwango** - Kuzuia matumizi kupita kiasi  

## Muundo wa Mfumo

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

## Mahitaji

### Yanayohitajika

- **Azure Developer CLI (azd)** - [Mwongozo wa usakinishaji](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Usajili wa Azure** na ufikiaji wa OpenAI - [Omba ufikiaji](https://aka.ms/oai/access)
- **Python 3.9+** - [Sakinisha Python](https://www.python.org/downloads/)

### Thibitisha Mahitaji

```bash
# Angalia toleo la azd (inahitaji 1.5.0 au zaidi)
azd version

# Thibitisha kuingia kwa Azure
azd auth login

# Angalia toleo la Python
python --version  # au python3 --version

# Thibitisha ufikiaji wa OpenAI (angalia katika Azure Portal)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Muhimu:** Azure OpenAI inahitaji idhini ya maombi. Ikiwa hujaomba, tembelea [aka.ms/oai/access](https://aka.ms/oai/access). Idhini kawaida huchukua siku 1-2 za kazi.

## ⏱️ Muda wa Usambazaji

| Awamu | Muda | Kinachotokea |
|-------|------|--------------|
| Ukaguzi wa mahitaji | Dakika 2-3 | Thibitisha upatikanaji wa kiwango cha OpenAI |
| Kusambaza miundombinu | Dakika 8-12 | Unda OpenAI, Key Vault, usambazaji wa modeli |
| Kusawazisha programu | Dakika 2-3 | Sanidi mazingira na utegemezi |
| **Jumla** | **Dakika 12-18** | Tayari kuzungumza na GPT-4 |

**Kumbuka:** Usambazaji wa kwanza wa OpenAI unaweza kuchukua muda mrefu zaidi kutokana na utoaji wa modeli.

## Mwanzo wa Haraka

```bash
# Elekea kwenye mfano
cd examples/azure-openai-chat

# Anzisha mazingira
azd env new myopenai

# Peleka kila kitu (miundombinu + usanidi)
azd up
# Utaulizwa:
# 1. Chagua usajili wa Azure
# 2. Chagua eneo lenye upatikanaji wa OpenAI (mfano, eastus, eastus2, westus)
# 3. Subiri dakika 12-18 kwa ajili ya upelekaji

# Sakinisha utegemezi wa Python
pip install -r requirements.txt

# Anza kuzungumza!
python chat.py
```

**Matokeo Yanayotarajiwa:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Thibitisha Usambazaji

### Hatua ya 1: Angalia Rasilimali za Azure

```bash
# Tazama rasilimali zilizowekwa
azd show

# Matokeo yanayotarajiwa yanaonyesha:
# - Huduma ya OpenAI: (jina la rasilimali)
# - Key Vault: (jina la rasilimali)
# - Uwekaji: gpt-4
# - Eneo: eastus (au eneo ulilochagua)
```

### Hatua ya 2: Jaribu API ya OpenAI

```bash
# Pata mwisho wa OpenAI na ufunguo
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Jaribu simu ya API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Jibu Linalotarajiwa:**
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

### Hatua ya 3: Thibitisha Ufikiaji wa Key Vault

```bash
# Orodhesha siri katika Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Siri Zinazotarajiwa:**
- `openai-api-key`
- `openai-endpoint`

**Vigezo vya Mafanikio:**
- ✅ Huduma ya OpenAI imesambazwa na GPT-4
- ✅ Simu ya API inarudisha jibu sahihi
- ✅ Siri zimehifadhiwa kwenye Key Vault
- ✅ Kufuatilia matumizi ya tokeni kunafanya kazi

## Muundo wa Mradi

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

## Vipengele vya Programu

### Kiolesura cha Mazungumzo (`chat.py`)

Programu ya mazungumzo inajumuisha:

- **Historia ya Mazungumzo** - Inahifadhi muktadha kati ya ujumbe
- **Kuhesabu Tokeni** - Kufuatilia matumizi na kukadiria gharama
- **Kushughulikia Makosa** - Kushughulikia kwa upole mipaka ya kiwango na makosa ya API
- **Makadirio ya Gharama** - Kukadiria gharama kwa ujumbe kwa muda halisi
- **Msaada wa Kutiririsha** - Majibu ya kutiririsha kwa hiari

### Amri

Wakati wa kuzungumza, unaweza kutumia:
- `quit` au `exit` - Maliza kikao
- `clear` - Futa historia ya mazungumzo
- `tokens` - Onyesha matumizi ya tokeni jumla
- `cost` - Onyesha gharama ya jumla inayokadiriwa

### Usanidi (`config.py`)

Hupakia usanidi kutoka kwa vigezo vya mazingira:
```python
AZURE_OPENAI_ENDPOINT  # Kutoka kwa Key Vault
AZURE_OPENAI_API_KEY   # Kutoka kwa Key Vault
AZURE_OPENAI_MODEL     # Chaguo-msingi: gpt-4
AZURE_OPENAI_MAX_TOKENS # Chaguo-msingi: 800
```

## Mifano ya Matumizi

### Mazungumzo ya Msingi

```bash
python chat.py
```

### Mazungumzo na Modeli Maalum

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Mazungumzo na Kutiririsha

```bash
python chat.py --stream
```

### Mfano wa Mazungumzo

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

## Usimamizi wa Gharama

### Bei ya Tokeni (GPT-4)

| Modeli | Ingizo (kwa tokeni 1K) | Matokeo (kwa tokeni 1K) |
|--------|------------------------|-------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Gharama za Kila Mwezi Zinazokadiriwa

Kulingana na mifumo ya matumizi:

| Kiwango cha Matumizi | Ujumbe/Kila Siku | Tokeni/Kila Siku | Gharama ya Kila Mwezi |
|-----------------------|-----------------|------------------|-----------------------|
| **Kidogo** | Ujumbe 20 | Tokeni 3,000 | $3-5 |
| **Kati** | Ujumbe 100 | Tokeni 15,000 | $15-25 |
| **Kubwa** | Ujumbe 500 | Tokeni 75,000 | $75-125 |

**Gharama ya Miundombinu ya Msingi:** $1-2/mwezi (Key Vault + kompyuta ndogo)

### Vidokezo vya Kupunguza Gharama

```bash
# 1. Tumia GPT-3.5-Turbo kwa kazi rahisi (gharama nafuu mara 20)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Punguza idadi ya tokeni kwa majibu mafupi
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Fuata matumizi ya tokeni
python chat.py --show-tokens

# 4. Weka arifa za bajeti
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Ufuatiliaji

### Angalia Matumizi ya Tokeni

```bash
# Katika Azure Portal:
# Rasilimali ya OpenAI → Vipimo → Chagua "Token Transaction"

# Au kupitia Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Angalia Magogo ya API

```bash
# Mito ya kumbukumbu za uchunguzi
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Uliza kumbukumbu
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Utatuzi wa Shida

### Tatizo: "Access Denied" Error

**Dalili:** 403 Forbidden wakati wa kupiga simu ya API

**Suluhisho:**
```bash
# 1. Thibitisha upatikanaji wa OpenAI umekubaliwa
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Hakikisha ufunguo wa API ni sahihi
azd env get-value AZURE_OPENAI_API_KEY

# 3. Thibitisha muundo wa URL ya endpoint
azd env get-value AZURE_OPENAI_ENDPOINT
# Inapaswa kuwa: https://[name].openai.azure.com/
```

### Tatizo: "Rate Limit Exceeded"

**Dalili:** 429 Too Many Requests

**Suluhisho:**
```bash
# 1. Angalia kiwango cha sasa
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Omba ongezeko la kiwango (ikiwa inahitajika)
# Nenda kwenye Azure Portal → Rasilimali ya OpenAI → Viwango → Omba Ongezeko

# 3. Tekeleza mantiki ya kurudia (tayari katika chat.py)
# Programu inarudia kiotomatiki kwa kutumia kurudi nyuma kwa kasi ya kielektroniki
```

### Tatizo: "Model Not Found"

**Dalili:** Kosa la 404 kwa usambazaji

**Suluhisho:**
```bash
# 1. Orodhesha utekelezaji unaopatikana
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Thibitisha jina la mfano katika mazingira
echo $AZURE_OPENAI_MODEL

# 3. Sasisha kwa jina sahihi la utekelezaji
export AZURE_OPENAI_MODEL=gpt-4  # au gpt-35-turbo
```

### Tatizo: High Latency

**Dalili:** Nyakati za majibu polepole (> sekunde 5)

**Suluhisho:**
```bash
# 1. Angalia ucheleweshaji wa kikanda
# Peleka kwenye eneo lililo karibu zaidi na watumiaji

# 2. Punguza max_tokens kwa majibu ya haraka
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Tumia utiririshaji kwa UX bora
python chat.py --stream
```

## Mazoea Bora ya Usalama

### 1. Linda Funguo za API

```bash
# Usikubali funguo kwenye udhibiti wa chanzo
# Tumia Key Vault (tayari imewekwa)

# Zungusha funguo mara kwa mara
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Tekeleza Uchujaji wa Maudhui

```python
# Azure OpenAI inajumuisha uchujaji wa maudhui uliojengwa ndani
# Sanidi katika Azure Portal:
# Rasilimali ya OpenAI → Vichujio vya Maudhui → Unda Kichujio Maalum

# Jamii: Chuki, Ngono, Vurugu, Kujidhuru
# Viwango: Uchujaji wa Chini, Kati, Juu
```

### 3. Tumia Utambulisho Ulioendeshwa (Uzalishaji)

```bash
# Kwa matumizi ya uzalishaji, tumia kitambulisho kilichosimamiwa
# badala ya funguo za API (inahitaji kuhifadhi programu kwenye Azure)

# Sasisha infra/openai.bicep ili kujumuisha:
# kitambulisho: { aina: 'SystemAssigned' }
```

## Maendeleo

### Endesha Likiwa Lokali

```bash
# Sakinisha utegemezi
pip install -r src/requirements.txt

# Weka vigezo vya mazingira
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Endesha programu
python src/chat.py
```

### Endesha Majaribio

```bash
# Sakinisha utegemezi wa majaribio
pip install pytest pytest-cov

# Endesha majaribio
pytest tests/ -v

# Na chanjo
pytest tests/ --cov=src --cov-report=html
```

### Sasisha Usambazaji wa Modeli

```bash
# Tumia toleo tofauti la modeli
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

## Kusafisha

```bash
# Futa rasilimali zote za Azure
azd down --force --purge

# Hii inaondoa:
# - Huduma ya OpenAI
# - Key Vault (na kufutwa kwa muda wa siku 90)
# - Kikundi cha Rasilimali
# - Utekelezaji na usanidi wote
```

## Hatua Zifuatazo

### Panua Mfano Huu

1. **Ongeza Kiolesura cha Wavuti** - Jenga sehemu ya mbele ya React/Vue
   ```bash
   # Ongeza huduma ya mbele kwenye azure.yaml
   # Peleka kwenye Azure Static Web Apps
   ```

2. **Tekeleza RAG** - Ongeza utafutaji wa hati na Azure AI Search
   ```python
   # Unganisha Azure Cognitive Search
   # Pakia nyaraka na unda faharasa ya vekta
   ```

3. **Ongeza Kuita Kazi** - Wezesha matumizi ya zana
   ```python
   # Fafanua kazi katika chat.py
   # Ruhusu GPT-4 kupiga API za nje
   ```

4. **Msaada wa Modeli Nyingi** - Sambaza modeli nyingi
   ```bash
   # Ongeza gpt-35-turbo, mifano ya embeddings
   # Tekeleza mantiki ya uelekezaji wa modeli
   ```

### Mifano Inayohusiana

- **[Retail Multi-Agent](../retail-scenario.md)** - Muundo wa hali ya juu wa mawakala wengi
- **[Database App](../../../../examples/database-app)** - Ongeza hifadhi ya kudumu
- **[Container Apps](../../../../examples/container-app)** - Sambaza kama huduma iliyowekwa kwenye kontena

### Rasilimali za Kujifunza

- 📚 [Kozi ya AZD Kwa Wanaoanza](../../README.md) - Nyumbani kwa kozi kuu
- 📚 [Nyaraka za Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/) - Nyaraka rasmi
- 📚 [Marejeleo ya API ya OpenAI](https://platform.openai.com/docs/api-reference) - Maelezo ya API
- 📚 [AI Inayowajibika](https://www.microsoft.com/ai/responsible-ai) - Mazoea bora

## Rasilimali za Ziada

### Nyaraka
- **[Huduma ya Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/)** - Mwongozo kamili
- **[Modeli za GPT-4](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Uwezo wa modeli
- **[Uchujaji wa Maudhui](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Vipengele vya usalama
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Marejeleo ya azd

### Mafunzo
- **[Mwongozo wa Haraka wa OpenAI](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Usambazaji wa kwanza
- **[Mazungumzo ya Kukamilisha](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Kujenga programu za mazungumzo
- **[Kuita Kazi](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Vipengele vya hali ya juu

### Zana
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Uwanja wa kucheza wa wavuti
- **[Mwongozo wa Uhandisi wa Maoni](https://platform.openai.com/docs/guides/prompt-engineering)** - Kuandika maoni bora
- **[Kikokotoo cha Tokeni](https://platform.openai.com/tokenizer)** - Kukadiria matumizi ya tokeni

### Jamii
- **[Azure AI Discord](https://discord.gg/azure)** - Pata msaada kutoka kwa jamii
- **[Majadiliano ya GitHub](https://github.com/Azure-Samples/openai/discussions)** - Jukwaa la maswali na majibu
- **[Blogu ya Azure](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Sasisho za hivi karibuni

---

**🎉 Mafanikio!** Umesambaza Azure OpenAI na kujenga programu ya mazungumzo inayofanya kazi. Anza kuchunguza uwezo wa GPT-4 na jaribu maoni na matumizi tofauti.

**Maswali?** [Fungua suala](https://github.com/microsoft/AZD-for-beginners/issues) au angalia [Maswali Yanayoulizwa Mara kwa Mara](../../resources/faq.md)

**Tahadhari ya Gharama:** Kumbuka kuendesha `azd down` ukimaliza kujaribu ili kuepuka gharama zinazoendelea (~$50-100/mwezi kwa matumizi ya kazi).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya asili inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->