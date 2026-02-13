# Azure OpenAI చాట్ అప్లికేషన్

**లెర్నింగ్ పాత్:** మధ్యస్థ ⭐⭐ | **సమయం:** 35-45 నిమిషాలు | **ఖర్చు:** $50-200/నెల

Azure Developer CLI (azd) ఉపయోగించి పూర్తిగా Azure OpenAI చాట్ అప్లికేషన్‌ను డిప్లాయ్ చేయడం. ఈ ఉదాహరణ GPT-4 డిప్లాయ్‌మెంట్, సురక్షిత API యాక్సెస్, మరియు సింపుల్ చాట్ ఇంటర్‌ఫేస్‌ను చూపిస్తుంది.

## 🎯 మీరు నేర్చుకునే విషయాలు

- GPT-4 మోడల్‌తో Azure OpenAI సర్వీస్‌ను డిప్లాయ్ చేయడం  
- Key Vault ద్వారా OpenAI API కీలు సురక్షితంగా ఉంచడం  
- Pythonతో సింపుల్ చాట్ ఇంటర్‌ఫేస్ నిర్మించడం  
- టోకెన్ వినియోగం మరియు ఖర్చులను మానిటర్ చేయడం  
- రేట్ లిమిటింగ్ మరియు ఎర్రర్ హ్యాండ్లింగ్ అమలు చేయడం  

## 📦 ఇందులో ఏమి ఉంది

✅ **Azure OpenAI Service** - GPT-4 మోడల్ డిప్లాయ్‌మెంట్  
✅ **Python Chat App** - సింపుల్ కమాండ్-లైన్ చాట్ ఇంటర్‌ఫేస్  
✅ **Key Vault Integration** - API కీలు సురక్షితంగా నిల్వ చేయడం  
✅ **ARM Templates** - పూర్తి ఇన్‌ఫ్రాస్ట్రక్చర్ కోడ్‌గా  
✅ **Cost Monitoring** - టోకెన్ వినియోగం ట్రాకింగ్  
✅ **Rate Limiting** - కోటా ఎగ్జాస్షన్ నివారించడం  

## ఆర్కిటెక్చర్

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

## అవసరాలు

### అవసరమైనవి

- **Azure Developer CLI (azd)** - [ఇన్‌స్టాల్ గైడ్](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- **Azure subscription** OpenAI యాక్సెస్‌తో - [యాక్సెస్ కోసం అభ్యర్థించండి](https://aka.ms/oai/access)  
- **Python 3.9+** - [Python ఇన్‌స్టాల్ చేయండి](https://www.python.org/downloads/)  

### అవసరాలను ధృవీకరించండి

```bash
# azd వెర్షన్‌ను తనిఖీ చేయండి (1.5.0 లేదా అంతకంటే ఎక్కువ అవసరం)
azd version

# Azure లాగిన్‌ను ధృవీకరించండి
azd auth login

# Python వెర్షన్‌ను తనిఖీ చేయండి
python --version  # లేదా python3 --version

# OpenAI యాక్సెస్‌ను ధృవీకరించండి (Azure Portalలో తనిఖీ చేయండి)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ ముఖ్యమైనది:** Azure OpenAI అప్లికేషన్ ఆమోదం అవసరం. మీరు ఇంకా అప్లై చేయకపోతే, [aka.ms/oai/access](https://aka.ms/oai/access) సందర్శించండి. ఆమోదం సాధారణంగా 1-2 వ్యాపార రోజులు పడుతుంది.

## ⏱️ డిప్లాయ్‌మెంట్ టైమ్‌లైన్

| దశ | వ్యవధి | ఏమి జరుగుతుంది |
|-----|--------|----------------|
| అవసరాల తనిఖీ | 2-3 నిమిషాలు | OpenAI కోటా అందుబాటును ధృవీకరించండి |
| ఇన్‌ఫ్రాస్ట్రక్చర్ డిప్లాయ్ చేయడం | 8-12 నిమిషాలు | OpenAI, Key Vault, మోడల్ డిప్లాయ్‌మెంట్ సృష్టించండి |
| అప్లికేషన్ కాన్ఫిగర్ చేయడం | 2-3 నిమిషాలు | ఎన్విరాన్‌మెంట్ మరియు డిపెండెన్సీలను సెటప్ చేయండి |
| **మొత్తం** | **12-18 నిమిషాలు** | GPT-4తో చాట్ చేయడానికి సిద్ధంగా ఉంది |

**గమనిక:** మొదటి OpenAI డిప్లాయ్‌మెంట్ మోడల్ ప్రొవిజనింగ్ కారణంగా ఎక్కువ సమయం పడవచ్చు.

## Quick Start

```bash
# ఉదాహరణకు నావిగేట్ చేయండి
cd examples/azure-openai-chat

# వాతావరణాన్ని ప్రారంభించండి
azd env new myopenai

# ప్రతిదీ మోహరించండి (ఇన్‌ఫ్రాస్ట్రక్చర్ + కాన్ఫిగరేషన్)
azd up
# మీరు అడిగబడతారు:
# 1. Azure సబ్‌స్క్రిప్షన్‌ను ఎంచుకోండి
# 2. OpenAI అందుబాటుతో ఉన్న ప్రదేశాన్ని ఎంచుకోండి (ఉదా., eastus, eastus2, westus)
# 3. మోహరించడానికి 12-18 నిమిషాలు వేచి ఉండండి

# Python ఆధారాలను ఇన్‌స్టాల్ చేయండి
pip install -r requirements.txt

# చాట్ ప్రారంభించండి!
python chat.py
```

**అంచనా ఫలితం:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ డిప్లాయ్‌మెంట్ ధృవీకరించండి

### దశ 1: Azure వనరులను తనిఖీ చేయండి

```bash
# మోహించిన వనరులను చూడండి
azd show

# ఆశించిన అవుట్‌పుట్ చూపిస్తుంది:
# - ఓపెన్‌ఏఐ సేవ: (వనరుల పేరు)
# - కీ వాల్ట్: (వనరుల పేరు)
# - మోహింపు: gpt-4
# - స్థానం: eastus (లేదా మీ ఎంపిక చేసిన ప్రాంతం)
```

### దశ 2: OpenAI APIని పరీక్షించండి

```bash
# ఓపెన్‌ఏఐ ఎండ్‌పాయింట్ మరియు కీ పొందండి
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# API కాల్‌ను పరీక్షించండి
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**అంచనా స్పందన:**
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

### దశ 3: Key Vault యాక్సెస్ ధృవీకరించండి

```bash
# కీ వాల్ట్‌లో రహస్యాలను జాబితా చేయండి
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**అంచనా రహస్యాలు:**
- `openai-api-key`  
- `openai-endpoint`  

**విజయం ప్రమాణాలు:**
- ✅ GPT-4తో OpenAI సర్వీస్ డిప్లాయ్ చేయబడింది  
- ✅ API కాల్ చెల్లుబాటు అయ్యే కంప్లీషన్‌ను తిరిగి ఇస్తుంది  
- ✅ Key Vaultలో రహస్యాలు నిల్వ చేయబడ్డాయి  
- ✅ టోకెన్ వినియోగం ట్రాకింగ్ పనిచేస్తుంది  

## ప్రాజెక్ట్ నిర్మాణం

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

## అప్లికేషన్ ఫీచర్లు

### చాట్ ఇంటర్‌ఫేస్ (`chat.py`)

చాట్ అప్లికేషన్‌లో ఉన్నాయి:

- **కన్వర్సేషన్ హిస్టరీ** - సందేశాల మధ్య కంటెక్స్ట్‌ను నిర్వహిస్తుంది  
- **టోకెన్ కౌంటింగ్** - వినియోగాన్ని ట్రాక్ చేస్తుంది మరియు ఖర్చులను అంచనా వేస్తుంది  
- **ఎర్రర్ హ్యాండ్లింగ్** - రేట్ లిమిట్స్ మరియు API ఎర్రర్లను గ్రేస్‌ఫుల్‌గా హ్యాండిల్ చేస్తుంది  
- **ఖర్చు అంచనా** - ప్రతి సందేశానికి రియల్-టైమ్ ఖర్చు లెక్కింపు  
- **స్ట్రీమింగ్ సపోర్ట్** - ఐచ్ఛిక స్ట్రీమింగ్ స్పందనలు  

### ఆదేశాలు

చాట్ చేస్తూ, మీరు ఉపయోగించవచ్చు:
- `quit` లేదా `exit` - సెషన్ ముగించండి  
- `clear` - కన్వర్సేషన్ హిస్టరీ క్లియర్ చేయండి  
- `tokens` - మొత్తం టోకెన్ వినియోగాన్ని చూపించండి  
- `cost` - అంచనా మొత్తం ఖర్చును చూపించండి  

### కాన్ఫిగరేషన్ (`config.py`)

ఎన్విరాన్‌మెంట్ వేరియబుల్స్ నుండి కాన్ఫిగరేషన్‌ను లోడ్ చేస్తుంది:
```python
AZURE_OPENAI_ENDPOINT  # కీ వాల్ట్ నుండి
AZURE_OPENAI_API_KEY   # కీ వాల్ట్ నుండి
AZURE_OPENAI_MODEL     # డిఫాల్ట్: gpt-4
AZURE_OPENAI_MAX_TOKENS # డిఫాల్ట్: 800
```

## వినియోగ ఉదాహరణలు

### బేసిక్ చాట్

```bash
python chat.py
```

### కస్టమ్ మోడల్‌తో చాట్

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### స్ట్రీమింగ్‌తో చాట్

```bash
python chat.py --stream
```

### ఉదాహరణ సంభాషణ

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

## ఖర్చు నిర్వహణ

### టోకెన్ ధరలు (GPT-4)

| మోడల్ | ఇన్‌పుట్ (1K టోకెన్లకు) | అవుట్‌పుట్ (1K టోకెన్లకు) |
|-------|------------------------|--------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### అంచనా నెలవారీ ఖర్చులు

వినియోగ నమూనాల ఆధారంగా:

| వినియోగ స్థాయి | సందేశాలు/రోజు | టోకెన్లు/రోజు | నెలవారీ ఖర్చు |
|----------------|----------------|----------------|--------------|
| **లైట్** | 20 సందేశాలు | 3,000 టోకెన్లు | $3-5 |
| **మోడరేట్** | 100 సందేశాలు | 15,000 టోకెన్లు | $15-25 |
| **హెవీ** | 500 సందేశాలు | 75,000 టోకెన్లు | $75-125 |

**బేస్ ఇన్‌ఫ్రాస్ట్రక్చర్ ఖర్చు:** $1-2/నెల (Key Vault + కనీస కంప్యూట్)

### ఖర్చు ఆప్టిమైజేషన్ చిట్కాలు

```bash
# 1. సరళమైన పనుల కోసం GPT-3.5-Turbo ఉపయోగించండి (20x చౌకగా)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. చిన్న సమాధానాల కోసం గరిష్ట టోకెన్లను తగ్గించండి
export AZURE_OPENAI_MAX_TOKENS=400

# 3. టోకెన్ వినియోగాన్ని పర్యవేక్షించండి
python chat.py --show-tokens

# 4. బడ్జెట్ అలర్ట్‌లను సెటప్ చేయండి
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## మానిటరింగ్

### టోకెన్ వినియోగాన్ని చూడండి

```bash
# Azure పోర్టల్‌లో:
# OpenAI వనరు → మెట్రిక్స్ → "టోకెన్ ట్రాన్సాక్షన్" ఎంచుకోండి

# లేదా Azure CLI ద్వారా:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### API లాగ్‌లను చూడండి

```bash
# డయాగ్నోస్టిక్ లాగ్‌లను స్ట్రీమ్ చేయండి
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# లాగ్‌లను క్వెరీ చేయండి
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## సమస్యల పరిష్కారం

### సమస్య: "యాక్సెస్ డినైడ్" ఎర్రర్

**లక్షణాలు:** API కాల్ చేస్తే 403 ఫోర్బిడెన్

**పరిష్కారాలు:**
```bash
# 1. OpenAI యాక్సెస్ అనుమతించబడిందని ధృవీకరించండి
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. API కీ సరైనదని తనిఖీ చేయండి
azd env get-value AZURE_OPENAI_API_KEY

# 3. ఎండ్‌పాయింట్ URL ఫార్మాట్ ధృవీకరించండి
azd env get-value AZURE_OPENAI_ENDPOINT
# ఇలా ఉండాలి: https://[name].openai.azure.com/
```

### సమస్య: "రేట్ లిమిట్ ఎక్సీడెడ్"

**లక్షణాలు:** 429 టూ మెనీ రిక్వెస్ట్స్

**పరిష్కారాలు:**
```bash
# 1. ప్రస్తుత కోటాను తనిఖీ చేయండి
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. కోటా పెంపును అభ్యర్థించండి (అవసరమైతే)
# Azure Portal → OpenAI Resource → Quotas → Request Increase కు వెళ్లండి

# 3. రీట్రై లాజిక్‌ను అమలు చేయండి (ఇప్పటికే chat.py లో ఉంది)
# అప్లికేషన్ స్వయంచాలకంగా ఎక్స్‌పోనెన్షియల్ బ్యాక్ఆఫ్‌తో రీట్రై చేస్తుంది
```

### సమస్య: "మోడల్ నాట్ ఫౌండ్"

**లక్షణాలు:** డిప్లాయ్‌మెంట్ కోసం 404 ఎర్రర్

**పరిష్కారాలు:**
```bash
# 1. అందుబాటులో ఉన్న డిప్లాయ్‌మెంట్‌లను జాబితా చేయండి
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. పర్యావరణంలో మోడల్ పేరు ధృవీకరించండి
echo $AZURE_OPENAI_MODEL

# 3. సరైన డిప్లాయ్‌మెంట్ పేరుకు నవీకరించండి
export AZURE_OPENAI_MODEL=gpt-4  # లేదా gpt-35-turbo
```

### సమస్య: అధిక లేటెన్సీ

**లక్షణాలు:** స్పందన సమయం నెమ్మదిగా (>5 సెకన్లు)

**పరిష్కారాలు:**
```bash
# 1. ప్రాంతీయ లేటెన్సీని తనిఖీ చేయండి
# వినియోగదారులకు దగ్గరగా ఉన్న ప్రాంతానికి మోహరించండి

# 2. వేగవంతమైన ప్రతిస్పందనల కోసం max_tokens తగ్గించండి
export AZURE_OPENAI_MAX_TOKENS=400

# 3. మెరుగైన UX కోసం స్ట్రీమింగ్ ఉపయోగించండి
python chat.py --stream
```

## భద్రత ఉత్తమ పద్ధతులు

### 1. API కీలను రక్షించండి

```bash
# కీలులను సోర్స్ కంట్రోల్‌లో కమిట్ చేయవద్దు
# కీ వాల్ట్ ఉపయోగించండి (ఇప్పటికే కాన్ఫిగర్ చేయబడింది)

# కీలను క్రమం తప్పకుండా రొటేట్ చేయండి
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. కంటెంట్ ఫిల్టరింగ్ అమలు చేయండి

```python
# Azure OpenAI లో అంతర్నిర్మిత కంటెంట్ ఫిల్టరింగ్ ఉంటుంది
# Azure Portal లో కాన్ఫిగర్ చేయండి:
# OpenAI Resource → Content Filters → Custom Filter సృష్టించండి

# వర్గాలు: ద్వేషం, లైంగిక, హింస, స్వీయ-హానికరం
# స్థాయిలు: తక్కువ, మధ్య, అధిక ఫిల్టరింగ్
```

### 3. మేనేజ్‌డ్ ఐడెంటిటీ ఉపయోగించండి (ప్రొడక్షన్)

```bash
# ఉత్పత్తి డిప్లాయ్‌మెంట్‌ల కోసం, మేనేజ్‌డ్ ఐడెంటిటీని ఉపయోగించండి
# API కీలు బదులుగా (Azureలో యాప్ హోస్టింగ్ అవసరం)

# infra/openai.bicep ను నవీకరించండి:
# identity: { type: 'SystemAssigned' }
```

## అభివృద్ధి

### లోకల్‌గా రన్ చేయండి

```bash
# ఆధారాలను ఇన్స్టాల్ చేయండి
pip install -r src/requirements.txt

# పర్యావరణ వేరియబుల్స్ సెట్ చేయండి
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# అప్లికేషన్ నడపండి
python src/chat.py
```

### టెస్టులు రన్ చేయండి

```bash
# పరీక్ష అవసరమైన ఆధారాలను ఇన్స్టాల్ చేయండి
pip install pytest pytest-cov

# పరీక్షలను నిర్వహించండి
pytest tests/ -v

# కవరేజ్‌తో
pytest tests/ --cov=src --cov-report=html
```

### మోడల్ డిప్లాయ్‌మెంట్‌ను అప్‌డేట్ చేయండి

```bash
# వివిధ మోడల్ వెర్షన్‌ను మోహింపజేయండి
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

## క్లీన్ అప్

```bash
# అన్ని Azure వనరులను తొలగించండి
azd down --force --purge

# ఇది తొలగిస్తుంది:
# - OpenAI సేవ
# - కీ వాల్ట్ (90-రోజుల సాఫ్ట్ డిలీట్‌తో)
# - వనరుల సమూహం
# - అన్ని డిప్లాయ్‌మెంట్లు మరియు కాన్ఫిగరేషన్లు
```

## తదుపరి దశలు

### ఈ ఉదాహరణను విస్తరించండి

1. **వెబ్ ఇంటర్‌ఫేస్ జోడించండి** - React/Vue ఫ్రంట్‌ఎండ్ నిర్మించండి  
   ```bash
   # azure.yaml కు ఫ్రంట్ ఎండ్ సేవను జోడించండి
   # Azure Static Web Apps కు డిప్లాయ్ చేయండి
   ```

2. **RAG అమలు చేయండి** - Azure AI Searchతో డాక్యుమెంట్ సెర్చ్ జోడించండి  
   ```python
   # Azure Cognitive Search ను సమీకరించండి
   # పత్రాలను అప్‌లోడ్ చేసి వెక్టర్ సూచిని సృష్టించండి
   ```

3. **ఫంక్షన్ కాలింగ్ జోడించండి** - టూల్ వినియోగాన్ని ప్రారంభించండి  
   ```python
   # చాట్.py లో ఫంక్షన్లను నిర్వచించండి
   # GPT-4 బాహ్య APIs ను కాల్ చేయనివ్వండి
   ```

4. **మల్టీ-మోడల్ సపోర్ట్ జోడించండి** - బహుళ మోడళ్లను డిప్లాయ్ చేయండి  
   ```bash
   # gpt-35-turbo, ఎంబెడింగ్స్ మోడల్స్ జోడించండి
   # మోడల్ రౌటింగ్ లాజిక్ అమలు చేయండి
   ```

### సంబంధిత ఉదాహరణలు

- **[Retail Multi-Agent](../retail-scenario.md)** - అధునాతన మల్టీ-ఏజెంట్ ఆర్కిటెక్చర్  
- **[Database App](../../../../examples/database-app)** - స్థిరమైన నిల్వను జోడించండి  
- **[Container Apps](../../../../examples/container-app)** - కంటైనర్ సేవగా డిప్లాయ్ చేయండి  

### లెర్నింగ్ రిసోర్సులు

- 📚 [AZD For Beginners Course](../../README.md) - ప్రధాన కోర్సు హోమ్  
- 📚 [Azure OpenAI Documentation](https://learn.microsoft.com/azure/ai-services/openai/) - అధికారిక డాక్స్  
- 📚 [OpenAI API Reference](https://platform.openai.com/docs/api-reference) - API వివరాలు  
- 📚 [Responsible AI](https://www.microsoft.com/ai/responsible-ai) - ఉత్తమ పద్ధతులు  

## అదనపు వనరులు

### డాక్యుమెంటేషన్
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - పూర్తి గైడ్  
- **[GPT-4 Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - మోడల్ సామర్థ్యాలు  
- **[Content Filtering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - భద్రతా లక్షణాలు  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd రిఫరెన్స్  

### ట్యుటోరియల్స్
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - మొదటి డిప్లాయ్‌మెంట్  
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - చాట్ అప్లికేషన్ల నిర్మాణం  
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - అధునాతన లక్షణాలు  

### టూల్స్
- **[Azure OpenAI Studio](https://oai.azure.com/)** - వెబ్-ఆధారిత ప్లేగ్రౌండ్  
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - మెరుగైన ప్రాంప్ట్‌లు రాయడం  
- **[Token Calculator](https://platform.openai.com/tokenizer)** - టోకెన్ వినియోగాన్ని అంచనా వేయండి  

### కమ్యూనిటీ
- **[Azure AI Discord](https://discord.gg/azure)** - కమ్యూనిటీ నుండి సహాయం పొందండి  
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Q&A ఫోరం  
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - తాజా నవీకరణలు  

---

**🎉 విజయవంతం!** మీరు Azure OpenAIని డిప్లాయ్ చేసి, పని చేసే చాట్ అప్లికేషన్‌ను నిర్మించారు. GPT-4 సామర్థ్యాలను అన్వేషించడం ప్రారంభించండి మరియు వివిధ ప్రాంప్ట్‌లు మరియు వినియోగాలను ప్రయోగించండి.

**ప్రశ్నలున్నాయా?** [ఒక ఇష్యూ ఓపెన్ చేయండి](https://github.com/microsoft/AZD-for-beginners/issues) లేదా [FAQ](../../resources/faq.md) తనిఖీ చేయండి.

**ఖర్చు అలర్ట్:** పరీక్ష పూర్తయిన తర్వాత `azd down` రన్ చేయడం మర్చిపోవద్దు, తద్వారా కొనసాగుతున్న ఖర్చులను (~$50-100/నెల యాక్టివ్ వినియోగానికి) నివారించవచ్చు.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:  
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదాన్ని ఉపయోగించడం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->