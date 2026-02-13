# Azure OpenAI ചാറ്റ് ആപ്ലിക്കേഷൻ

**പഠന പാത:** ഇടത്തരം ⭐⭐ | **സമയം:** 35-45 മിനിറ്റ് | **ചെലവ്:** $50-200/മാസം

Azure Developer CLI (azd) ഉപയോഗിച്ച് ഡിപ്ലോയ് ചെയ്ത ഒരു പൂർണ്ണ Azure OpenAI ചാറ്റ് ആപ്ലിക്കേഷൻ. ഈ ഉദാഹരണം GPT-4 ഡിപ്ലോയ്‌മെന്റ്, സുരക്ഷിത API ആക്സസ്, ഒരു ലളിതമായ ചാറ്റ് ഇന്റർഫേസ് എന്നിവ പ്രദർശിപ്പിക്കുന്നു.

## 🎯 നിങ്ങൾ പഠിക്കുന്നതെന്താണ്

- GPT-4 മോഡലുമായി Azure OpenAI സേവനം ഡിപ്ലോയ് ചെയ്യുക  
- Key Vault ഉപയോഗിച്ച് OpenAI API കീകൾ സുരക്ഷിതമാക്കുക  
- Python ഉപയോഗിച്ച് ലളിതമായ ചാറ്റ് ഇന്റർഫേസ് നിർമ്മിക്കുക  
- ടോക്കൺ ഉപയോഗവും ചെലവുകളും നിരീക്ഷിക്കുക  
- നിരക്ക് പരിധിയും പിഴവുകൾ കൈകാര്യം ചെയ്യൽ നടപ്പിലാക്കുക  

## 📦 ഉൾപ്പെടുന്നവ

✅ **Azure OpenAI Service** - GPT-4 മോഡൽ ഡിപ്ലോയ്‌മെന്റ്  
✅ **Python Chat App** - ലളിതമായ കമാൻഡ്-ലൈൻ ചാറ്റ് ഇന്റർഫേസ്  
✅ **Key Vault Integration** - API കീകൾ സുരക്ഷിതമായി സംഭരിക്കൽ  
✅ **ARM Templates** - പൂർണ്ണമായ ഇൻഫ്രാസ്ട്രക്ചർ കോഡ് ആയി  
✅ **Cost Monitoring** - ടോക്കൺ ഉപയോഗ ട്രാക്കിംഗ്  
✅ **Rate Limiting** - ക്വോട്ടാ ക്ഷയത്തെ തടയുക  

## ആർക്കിടെക്ചർ

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

## മുൻ‌വശങ്ങൾ

### ആവശ്യമായവ

- **Azure Developer CLI (azd)** - [ഇൻസ്റ്റാൾ ഗൈഡ്](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- **Azure subscription** with OpenAI access - [അനുമതി അഭ്യർത്ഥിക്കുക](https://aka.ms/oai/access)  
- **Python 3.9+** - [Python ഇൻസ്റ്റാൾ ചെയ്യുക](https://www.python.org/downloads/)  

### മുൻ‌വശങ്ങൾ പരിശോധിക്കുക

```bash
# azd പതിപ്പ് പരിശോധിക്കുക (1.5.0 അല്ലെങ്കിൽ അതിനുമുകളിൽ ആവശ്യമുണ്ട്)
azd version

# Azure ലോഗിൻ സ്ഥിരീകരിക്കുക
azd auth login

# Python പതിപ്പ് പരിശോധിക്കുക
python --version  # അല്ലെങ്കിൽ python3 --version

# OpenAI ആക്സസ് സ്ഥിരീകരിക്കുക (Azure Portal ൽ പരിശോധിക്കുക)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ പ്രധാനപ്പെട്ടത്:** Azure OpenAI സേവനത്തിന് അപേക്ഷാ അംഗീകാരം ആവശ്യമാണ്. നിങ്ങൾ അപേക്ഷിച്ചിട്ടില്ലെങ്കിൽ, [aka.ms/oai/access](https://aka.ms/oai/access) സന്ദർശിക്കുക. അംഗീകാരം സാധാരണയായി 1-2 ബിസിനസ് ദിവസങ്ങൾ എടുക്കും.

## ⏱️ ഡിപ്ലോയ്‌മെന്റ് ടൈംലൈൻ

| ഘട്ടം | ദൈർഘ്യം | എന്താണ് സംഭവിക്കുന്നത് |
|-------|----------|-----------------------|
| മുൻ‌വശങ്ങൾ പരിശോധിക്കുക | 2-3 മിനിറ്റ് | OpenAI ക്വോട്ടാ ലഭ്യത പരിശോധിക്കുക |
| ഇൻഫ്രാസ്ട്രക്ചർ ഡിപ്ലോയ് ചെയ്യുക | 8-12 മിനിറ്റ് | OpenAI, Key Vault, മോഡൽ ഡിപ്ലോയ്‌മെന്റ് സൃഷ്ടിക്കുക |
| ആപ്ലിക്കേഷൻ കോൺഫിഗർ ചെയ്യുക | 2-3 മിനിറ്റ് | പരിസ്ഥിതി, ഡിപെൻഡൻസികൾ സജ്ജമാക്കുക |
| **ആകെ** | **12-18 മിനിറ്റ്** | GPT-4 ഉപയോഗിച്ച് ചാറ്റ് ചെയ്യാൻ തയ്യാറാണ് |

**കുറിപ്പ്:** ആദ്യത്തെ OpenAI ഡിപ്ലോയ്‌മെന്റ് മോഡൽ പ്രൊവിഷനിംഗ് കാരണം കൂടുതൽ സമയം എടുക്കാം.

## Quick Start

```bash
# ഉദാഹരണത്തിലേക്ക് നാവിഗേറ്റ് ചെയ്യുക
cd examples/azure-openai-chat

# പരിസ്ഥിതി ആരംഭിക്കുക
azd env new myopenai

# എല്ലാം വിന്യസിക്കുക (അടിത്തറ + കോൺഫിഗറേഷൻ)
azd up
# നിങ്ങൾക്ക് നിർദ്ദേശങ്ങൾ ലഭിക്കും:
# 1. Azure സബ്സ്ക്രിപ്ഷൻ തിരഞ്ഞെടുക്കുക
# 2. OpenAI ലഭ്യതയുള്ള സ്ഥലം തിരഞ്ഞെടുക്കുക (ഉദാ., eastus, eastus2, westus)
# 3. വിന്യാസത്തിനായി 12-18 മിനിറ്റ് കാത്തിരിക്കുക

# Python ആശ്രിതങ്ങൾ ഇൻസ്റ്റാൾ ചെയ്യുക
pip install -r requirements.txt

# ചാറ്റ് ആരംഭിക്കുക!
python chat.py
```

**പ്രതീക്ഷിക്കുന്ന ഔട്ട്പുട്ട്:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ ഡിപ്ലോയ്‌മെന്റ് സ്ഥിരീകരിക്കുക

### ഘട്ടം 1: Azure റിസോഴ്സുകൾ പരിശോധിക്കുക

```bash
# വിന്യസിച്ച റിസോഴ്സുകൾ കാണുക
azd show

# പ്രതീക്ഷിക്കുന്ന ഔട്ട്പുട്ട് കാണിക്കുന്നു:
# - ഓപ്പൺഎഐ സർവീസ്: (റിസോഴ്സ് പേര്)
# - കീ വോൾട്ട്: (റിസോഴ്സ് പേര്)
# - വിന്യാസം: gpt-4
# - സ്ഥലം: eastus (അല്ലെങ്കിൽ നിങ്ങൾ തിരഞ്ഞെടുക്കുന്ന പ്രദേശം)
```

### ഘട്ടം 2: OpenAI API പരീക്ഷിക്കുക

```bash
# ഓപ്പൺഎഐ എൻഡ്പോയിന്റും കീയും നേടുക
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# API കോൾ പരീക്ഷിക്കുക
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**പ്രതീക്ഷിക്കുന്ന പ്രതികരണം:**
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

### ഘട്ടം 3: Key Vault ആക്സസ് സ്ഥിരീകരിക്കുക

```bash
# കീ വോൾട്ടിലെ രഹസ്യങ്ങൾ പട്ടികയാക്കുക
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**പ്രതീക്ഷിക്കുന്ന രഹസ്യങ്ങൾ:**
- `openai-api-key`  
- `openai-endpoint`  

**വിജയത്തിന്റെ മാനദണ്ഡങ്ങൾ:**
- ✅ GPT-4 ഉപയോഗിച്ച് OpenAI സേവനം ഡിപ്ലോയ് ചെയ്തു  
- ✅ API കോൾ സാധുവായ കംപ്ലീഷൻ നൽകുന്നു  
- ✅ Key Vault-ൽ രഹസ്യങ്ങൾ സംഭരിച്ചിരിക്കുന്നു  
- ✅ ടോക്കൺ ഉപയോഗ ട്രാക്കിംഗ് പ്രവർത്തിക്കുന്നു  

## പ്രോജക്റ്റ് ഘടന

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

## ആപ്ലിക്കേഷൻ സവിശേഷതകൾ

### ചാറ്റ് ഇന്റർഫേസ് (`chat.py`)

ചാറ്റ് ആപ്ലിക്കേഷൻ ഉൾപ്പെടുന്നു:

- **സംഭാഷണ ചരിത്രം** - സന്ദേശങ്ങൾക്കിടയിൽ കോൺടെക്സ്റ്റ് നിലനിർത്തുന്നു  
- **ടോക്കൺ കൗണ്ടിംഗ്** - ഉപയോഗം ട്രാക്ക് ചെയ്യുകയും ചെലവുകൾ കണക്കാക്കുകയും ചെയ്യുന്നു  
- **പിഴവുകൾ കൈകാര്യം ചെയ്യൽ** - നിരക്ക് പരിധികളും API പിഴവുകളും നയപരമായ കൈകാര്യം  
- **ചെലവ് കണക്കാക്കൽ** - ഓരോ സന്ദേശത്തിനും റിയൽ-ടൈം ചെലവ് കണക്കാക്കൽ  
- **സ്ട്രീമിംഗ് പിന്തുണ** - ഓപ്ഷണൽ സ്ട്രീമിംഗ് പ്രതികരണങ്ങൾ  

### കമാൻഡുകൾ

ചാറ്റ് ചെയ്യുമ്പോൾ, നിങ്ങൾക്ക് ഉപയോഗിക്കാം:  
- `quit` അല്ലെങ്കിൽ `exit` - സെഷൻ അവസാനിപ്പിക്കുക  
- `clear` - സംഭാഷണ ചരിത്രം മായ്ക്കുക  
- `tokens` - ആകെ ടോക്കൺ ഉപയോഗം കാണിക്കുക  
- `cost` - ആകെ ചെലവിന്റെ കണക്കുകൾ കാണിക്കുക  

### കോൺഫിഗറേഷൻ (`config.py`)

പരിസ്ഥിതി വേരിയബിളുകളിൽ നിന്ന് കോൺഫിഗറേഷൻ ലോഡ് ചെയ്യുന്നു:  
```python
AZURE_OPENAI_ENDPOINT  # കീ വോൾട്ടിൽ നിന്ന്
AZURE_OPENAI_API_KEY   # കീ വോൾട്ടിൽ നിന്ന്
AZURE_OPENAI_MODEL     # ഡിഫോൾട്ട്: gpt-4
AZURE_OPENAI_MAX_TOKENS # ഡിഫോൾട്ട്: 800
```

## ഉപയോഗ ഉദാഹരണങ്ങൾ

### അടിസ്ഥാന ചാറ്റ്

```bash
python chat.py
```

### കസ്റ്റം മോഡലുമായി ചാറ്റ്

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### സ്ട്രീമിംഗുമായി ചാറ്റ്

```bash
python chat.py --stream
```

### ഉദാഹരണ സംഭാഷണം

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

## ചെലവ് മാനേജ്മെന്റ്

### ടോക്കൺ വില (GPT-4)

| മോഡൽ | ഇൻപുട്ട് (1K ടോക്കൺ) | ഔട്ട്പുട്ട് (1K ടോക്കൺ) |
|-------|----------------------|------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### പ്രതിമാസ ചെലവുകളുടെ കണക്കുകൾ

ഉപയോഗ രീതികൾ അടിസ്ഥാനമാക്കി:

| ഉപയോഗ നില | സന്ദേശങ്ങൾ/ദിവസം | ടോക്കൺ/ദിവസം | മാസത്തിലെ ചെലവ് |
|-------------|------------------|---------------|------------------|
| **ലഘു** | 20 സന്ദേശങ്ങൾ | 3,000 ടോക്കൺ | $3-5 |
| **മിതമായ** | 100 സന്ദേശങ്ങൾ | 15,000 ടോക്കൺ | $15-25 |
| **ഭാരമുള്ള** | 500 സന്ദേശങ്ങൾ | 75,000 ടോക്കൺ | $75-125 |

**അടിസ്ഥാന ഇൻഫ്രാസ്ട്രക്ചർ ചെലവ്:** $1-2/മാസം (Key Vault + കുറഞ്ഞ കംപ്യൂട്ട്)

### ചെലവ് ഓപ്റ്റിമൈസേഷൻ ടിപ്സ്

```bash
# 1. ലളിതമായ പ്രവർത്തനങ്ങൾക്ക് GPT-3.5-Turbo ഉപയോഗിക്കുക (20x കുറഞ്ഞ ചെലവ്)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. ചുരുങ്ങിയ പ്രതികരണങ്ങൾക്ക് പരമാവധി ടോക്കണുകൾ കുറയ്ക്കുക
export AZURE_OPENAI_MAX_TOKENS=400

# 3. ടോക്കൺ ഉപയോഗം നിരീക്ഷിക്കുക
python chat.py --show-tokens

# 4. ബജറ്റ് അലർട്ടുകൾ സജ്ജമാക്കുക
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## നിരീക്ഷണം

### ടോക്കൺ ഉപയോഗം കാണുക

```bash
# ആസർ പോർട്ടലിൽ:
# ഓപ്പൺഎഐ റിസോഴ്‌സ് → മെട്രിക്സ് → "ടോക്കൺ ട്രാൻസാക്ഷൻ" തിരഞ്ഞെടുക്കുക

# അല്ലെങ്കിൽ ആസർ CLI വഴി:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### API ലോഗുകൾ കാണുക

```bash
# ഡയഗ്നോസ്റ്റിക് ലോഗുകൾ സ്ട്രീം ചെയ്യുക
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# ലോഗുകൾ ചോദിക്കുക
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## പ്രശ്ന പരിഹാരം

### പ്രശ്നം: "Access Denied" പിഴവ്

**ലക്ഷണങ്ങൾ:** API വിളിക്കുമ്പോൾ 403 Forbidden

**പരിഹാരങ്ങൾ:**
```bash
# 1. OpenAI ആക്സസ് അംഗീകരിച്ചിട്ടുണ്ടെന്ന് സ്ഥിരീകരിക്കുക
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. API കീ ശരിയാണെന്ന് പരിശോധിക്കുക
azd env get-value AZURE_OPENAI_API_KEY

# 3. എൻഡ്പോയിന്റ് URL ഫോർമാറ്റ് ശരിയാണെന്ന് സ്ഥിരീകരിക്കുക
azd env get-value AZURE_OPENAI_ENDPOINT
# ഇതായിരിക്കണം: https://[name].openai.azure.com/
```

### പ്രശ്നം: "Rate Limit Exceeded"

**ലക്ഷണങ്ങൾ:** 429 Too Many Requests

**പരിഹാരങ്ങൾ:**
```bash
# 1. നിലവിലെ ക്വോട്ട പരിശോധിക്കുക
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. ക്വോട്ട വർദ്ധനവിനായി അപേക്ഷിക്കുക (ആവശ്യമെങ്കിൽ)
# Azure Portal → OpenAI Resource → Quotas → Request Increase എന്നതിലേക്ക് പോകുക

# 3. റിട്രൈ ലജിക് നടപ്പിലാക്കുക (chat.py-ൽ ഇതിനകം ഉണ്ട്)
# ആപ്ലിക്കേഷൻ സ്വയം എക്സ്പോനൻഷ്യൽ ബാക്കോഫ് ഉപയോഗിച്ച് റിട്രൈ ചെയ്യുന്നു
```

### പ്രശ്നം: "Model Not Found"

**ലക്ഷണങ്ങൾ:** ഡിപ്ലോയ്‌മെന്റിനായി 404 പിഴവ്

**പരിഹാരങ്ങൾ:**
```bash
# 1. ലഭ്യമായ ഡിപ്ലോയ്മെന്റുകൾ പട്ടികയിടുക
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. പരിസ്ഥിതിയിൽ മോഡൽ നാമം സ്ഥിരീകരിക്കുക
echo $AZURE_OPENAI_MODEL

# 3. ശരിയായ ഡിപ്ലോയ്മെന്റ് നാമത്തിലേക്ക് അപ്ഡേറ്റ് ചെയ്യുക
export AZURE_OPENAI_MODEL=gpt-4  # അല്ലെങ്കിൽ gpt-35-turbo
```

### പ്രശ്നം: ഉയർന്ന ലാറ്റൻസി

**ലക്ഷണങ്ങൾ:** 5 സെക്കൻഡിൽ കൂടുതൽ മന്ദഗതിയുള്ള പ്രതികരണ സമയം

**പരിഹാരങ്ങൾ:**
```bash
# 1. പ്രാദേശിക ലാറ്റൻസി പരിശോധിക്കുക
# ഉപയോക്താക്കൾക്ക് ഏറ്റവും അടുത്തുള്ള പ്രദേശത്ത് വിന്യസിക്കുക

# 2. വേഗത്തിൽ പ്രതികരണങ്ങൾ ലഭിക്കാൻ max_tokens കുറയ്ക്കുക
export AZURE_OPENAI_MAX_TOKENS=400

# 3. മികച്ച ഉപയോക്തൃ അനുഭവത്തിനായി സ്ട്രീമിംഗ് ഉപയോഗിക്കുക
python chat.py --stream
```

## സുരക്ഷാ മികച്ച രീതികൾ

### 1. API കീകൾ സംരക്ഷിക്കുക

```bash
# കീകൾ സോഴ്‌സ് കൺട്രോളിലേക്ക് ഒരിക്കലും കമ്മിറ്റ് ചെയ്യരുത്
# കീ വോൾട്ട് ഉപയോഗിക്കുക (ഇതിനകം കോൺഫിഗർ ചെയ്തിരിക്കുന്നു)

# കീകൾ സ്ഥിരമായി റൊട്ടേറ്റ് ചെയ്യുക
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. ഉള്ളടക്കം ഫിൽട്ടറിംഗ് നടപ്പിലാക്കുക

```python
# Azure OpenAI ഉൾപ്പെടെ ഉൾനിറയുള്ള ഉള്ളടക്ക ഫിൽട്ടറിംഗ്
# Azure Portal-ൽ ക്രമീകരിക്കുക:
# OpenAI Resource → Content Filters → Custom Filter സൃഷ്ടിക്കുക

# വിഭാഗങ്ങൾ: വെറുപ്പ്, ലൈംഗികത, പീഡനം, സ്വയംഹാനി
# നിലങ്ങൾ: കുറഞ്ഞത്, മധ്യസ്ഥം, ഉയർന്ന ഫിൽട്ടറിംഗ്
```

### 3. Managed Identity ഉപയോഗിക്കുക (ഉത്പാദനം)

```bash
# ഉത്പാദന വിന്യാസങ്ങൾക്ക്, മാനേജുചെയ്യുന്ന ഐഡന്റിറ്റി ഉപയോഗിക്കുക
# API കീകൾക്ക് പകരം (ആപ്പ് Azure-ൽ ഹോസ്റ്റിംഗ് ആവശ്യമാണ്)

# infra/openai.bicep അപ്ഡേറ്റ് ചെയ്യുക:
# identity: { type: 'SystemAssigned' }
```

## വികസനം

### ലോക്കലായി പ്രവർത്തിക്കുക

```bash
# ആശ്രിതങ്ങൾ ഇൻസ്റ്റാൾ ചെയ്യുക
pip install -r src/requirements.txt

# പരിസ്ഥിതി ചോദ്യങ്ങൾ സജ്ജമാക്കുക
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# ആപ്ലിക്കേഷൻ പ്രവർത്തിപ്പിക്കുക
python src/chat.py
```

### ടെസ്റ്റുകൾ പ്രവർത്തിക്കുക

```bash
# ടെസ്റ്റ് ആശ്രിതങ്ങൾ ഇൻസ്റ്റാൾ ചെയ്യുക
pip install pytest pytest-cov

# ടെസ്റ്റുകൾ പ്രവർത്തിപ്പിക്കുക
pytest tests/ -v

# കവർേജോടെ
pytest tests/ --cov=src --cov-report=html
```

### മോഡൽ ഡിപ്ലോയ്‌മെന്റ് അപ്ഡേറ്റ് ചെയ്യുക

```bash
# വ്യത്യസ്ത മോഡൽ പതിപ്പ് വിന്യസിക്കുക
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

## ക്ലീൻ അപ്പ്

```bash
# എല്ലാ Azure വിഭവങ്ങളും ഇല്ലാതാക്കുക
azd down --force --purge

# ഇത് നീക്കം ചെയ്യുന്നു:
# - OpenAI സേവനം
# - കീ വോൾട്ട് (90-ദിന സോഫ്റ്റ് ഡിലീറ്റ് സഹിതം)
# - വിഭവ ഗ്രൂപ്പ്
# - എല്ലാ ഡിപ്ലോയ്മെന്റുകളും കോൺഫിഗറേഷനുകളും
```

## അടുത്ത ഘട്ടങ്ങൾ

### ഈ ഉദാഹരണം വികസിപ്പിക്കുക

1. **വെബ് ഇന്റർഫേസ് ചേർക്കുക** - React/Vue ഫ്രണ്ട്‌എൻഡ് നിർമ്മിക്കുക  
   ```bash
   # azure.yaml-ൽ ഫ്രണ്ട്‌എൻഡ് സേവനം ചേർക്കുക
   # Azure Static Web Apps-ലേക്ക് ഡെപ്ലോയ് ചെയ്യുക
   ```

2. **RAG നടപ്പിലാക്കുക** - Azure AI Search ഉപയോഗിച്ച് ഡോക്യുമെന്റ് തിരയൽ ചേർക്കുക  
   ```python
   # Azure Cognitive Search സംയോജിപ്പിക്കുക
   # പ്രമാണങ്ങൾ അപ്‌ലോഡ് ചെയ്യുക, വെക്റ്റർ ഇൻഡക്സ് സൃഷ്ടിക്കുക
   ```

3. **ഫംഗ്ഷൻ കോൾ ചെയ്യൽ ചേർക്കുക** - ടൂൾ ഉപയോഗം സജ്ജമാക്കുക  
   ```python
   # ചാറ്റ്.py ൽ ഫംഗ്ഷനുകൾ നിർവചിക്കുക
   # GPT-4 ന് ബാഹ്യ APIകൾ വിളിക്കാൻ അനുവദിക്കുക
   ```

4. **മൾട്ടി-മോഡൽ പിന്തുണ** - ഒന്നിലധികം മോഡലുകൾ ഡിപ്ലോയ് ചെയ്യുക  
   ```bash
   # gpt-35-turbo, embeddings മോഡലുകൾ ചേർക്കുക
   # മോഡൽ റൂട്ടിംഗ് ലജിക് നടപ്പിലാക്കുക
   ```

### ബന്ധപ്പെട്ട ഉദാഹരണങ്ങൾ

- **[Retail Multi-Agent](../retail-scenario.md)** - ഉയർന്ന തലത്തിലുള്ള മൾട്ടി-എജന്റ് ആർക്കിടെക്ചർ  
- **[Database App](../../../../examples/database-app)** - സ്ഥിരമായ സംഭരണ ​​ചേർക്കുക  
- **[Container Apps](../../../../examples/container-app)** - കണ്ടെയ്‌നറൈസ്ഡ് സേവനമായി ഡിപ്ലോയ് ചെയ്യുക  

### പഠന വിഭവങ്ങൾ

- 📚 [AZD For Beginners Course](../../README.md) - പ്രധാന കോഴ്സ് ഹോം  
- 📚 [Azure OpenAI Documentation](https://learn.microsoft.com/azure/ai-services/openai/) - ഔദ്യോഗിക ഡോക്സ്  
- 📚 [OpenAI API Reference](https://platform.openai.com/docs/api-reference) - API വിശദാംശങ്ങൾ  
- 📚 [Responsible AI](https://www.microsoft.com/ai/responsible-ai) - മികച്ച രീതികൾ  

## അധിക വിഭവങ്ങൾ

### ഡോക്യുമെന്റേഷൻ
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - പൂർണ്ണ ഗൈഡ്  
- **[GPT-4 Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - മോഡൽ ശേഷികൾ  
- **[Content Filtering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - സുരക്ഷാ സവിശേഷതകൾ  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd റഫറൻസ്  

### ട്യൂട്ടോറിയലുകൾ
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - ആദ്യ ഡിപ്ലോയ്‌മെന്റ്  
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - ചാറ്റ് ആപ്ലിക്കേഷനുകൾ നിർമ്മിക്കൽ  
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - ഉയർന്ന സവിശേഷതകൾ  

### ടൂളുകൾ
- **[Azure OpenAI Studio](https://oai.azure.com/)** - വെബ്-അധിഷ്ഠിത പ്ലേഗ്രൗണ്ട്  
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - മികച്ച പ്രോംപ്റ്റുകൾ എഴുതുക  
- **[Token Calculator](https://platform.openai.com/tokenizer)** - ടോക്കൺ ഉപയോഗം കണക്കാക്കുക  

### കമ്മ്യൂണിറ്റി
- **[Azure AI Discord](https://discord.gg/azure)** - കമ്മ്യൂണിറ്റിയിൽ നിന്ന് സഹായം നേടുക  
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Q&A ഫോറം  
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - ഏറ്റവും പുതിയ അപ്ഡേറ്റുകൾ  

---

**🎉 വിജയം!** നിങ്ങൾ Azure OpenAI ഡിപ്ലോയ് ചെയ്തു, പ്രവർത്തനക്ഷമമായ ഒരു ചാറ്റ് ആപ്ലിക്കേഷൻ നിർമ്മിച്ചു. GPT-4-ന്റെ ശേഷികൾ അന്വേഷിക്കാൻ, വ്യത്യസ്ത പ്രോംപ്റ്റുകളും ഉപയോഗ കേസുകളും പരീക്ഷിക്കാൻ ആരംഭിക്കുക.

**ചോദ്യങ്ങൾ?** [ഒരു പ്രശ്നം തുറക്കുക](https://github.com/microsoft/AZD-for-beginners/issues) അല്ലെങ്കിൽ [FAQ](../../resources/faq.md) പരിശോധിക്കുക.

**ചെലവ് അലർട്ട്:** സജീവ ഉപയോഗത്തിന് ~$50-100/മാസം ചെലവുകൾ ഒഴിവാക്കാൻ ടെസ്റ്റിംഗ് പൂർത്തിയാക്കിയ ശേഷം `azd down` പ്രവർത്തിപ്പിക്കുക.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:  
ഈ രേഖ AI വിവർത്തന സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, സ്വയം പ്രവർത്തിക്കുന്ന വിവർത്തനങ്ങളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള മൗലിക രേഖ പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കണം. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം ശുപാർശ ചെയ്യുന്നു. ഈ വിവർത്തനം ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->