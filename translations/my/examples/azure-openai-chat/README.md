# Azure OpenAI Chat Application

**သင်ကြားမှုလမ်းကြောင်း:** အလယ်အလတ် ⭐⭐ | **အချိန်:** ၃၅-၄၅ မိနစ် | **ကုန်ကျစရိတ်:** $50-200/လ

Azure Developer CLI (azd) ကို အသုံးပြု၍ Azure OpenAI chat application တစ်ခုကို အပြည့်အစုံ deploy လုပ်ထားသည်။ ဤဥပမာသည် GPT-4 deployment, API access အတွက်လုံခြုံမှုနှင့် ရိုးရှင်းသော chat interface ကို ပြသသည်။

## 🎯 သင်လေ့လာနိုင်မည့်အရာများ

- GPT-4 model ဖြင့် Azure OpenAI Service ကို deploy လုပ်ခြင်း
- Key Vault ဖြင့် OpenAI API key များကို လုံခြုံစွာ သိမ်းဆည်းခြင်း
- Python ဖြင့် ရိုးရှင်းသော chat interface တစ်ခု တည်ဆောက်ခြင်း
- Token အသုံးပြုမှုနှင့် ကုန်ကျစရိတ်ကို စောင့်ကြည့်ခြင်း
- Rate limiting နှင့် error handling ကို အကောင်အထည်ဖော်ခြင်း

## 📦 ပါဝင်သောအရာများ

✅ **Azure OpenAI Service** - GPT-4 model deployment  
✅ **Python Chat App** - ရိုးရှင်းသော command-line chat interface  
✅ **Key Vault Integration** - API key ကို လုံခြုံစွာ သိမ်းဆည်းခြင်း  
✅ **ARM Templates** - Infrastructure အပြည့်အစုံကို code ဖြင့်  
✅ **Cost Monitoring** - Token အသုံးပြုမှုကို စောင့်ကြည့်ခြင်း  
✅ **Rate Limiting** - Quota မကုန်ဆုံးစေရန် ကန့်သတ်ခြင်း  

## Architecture

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

## လိုအပ်ချက်များ

### လိုအပ်သောအရာများ

- **Azure Developer CLI (azd)** - [Install guide](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** with OpenAI access - [Request access](https://aka.ms/oai/access)
- **Python 3.9+** - [Install Python](https://www.python.org/downloads/)

### လိုအပ်ချက်များကို စစ်ဆေးခြင်း

```bash
# azd ဗားရှင်းကိုစစ်ဆေးပါ (1.5.0 သို့မဟုတ်အထက်လိုအပ်သည်)
azd version

# Azure login ကိုအတည်ပြုပါ
azd auth login

# Python ဗားရှင်းကိုစစ်ဆေးပါ
python --version  # သို့မဟုတ် python3 --version

# OpenAI access ကိုအတည်ပြုပါ (Azure Portal မှာစစ်ဆေးပါ)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ အရေးကြီး:** Azure OpenAI သည် application အတည်ပြုမှုကို လိုအပ်သည်။ သင်မတင်ထားသေးပါက [aka.ms/oai/access](https://aka.ms/oai/access) သို့ သွားပါ။ အတည်ပြုမှုသည် ၁-၂ ရုံးလုပ်ငန်းနေ့အတွင်း ကြာနိုင်သည်။

## ⏱️ Deployment အချိန်ဇယား

| အဆင့် | ကြာချိန် | ဖြစ်ပျက်မည့်အရာ |
|-------|----------|--------------|
| လိုအပ်ချက်များ စစ်ဆေးခြင်း | ၂-၃ မိနစ် | OpenAI quota ရရှိနိုင်မှုကို စစ်ဆေးခြင်း |
| Infrastructure ကို deploy လုပ်ခြင်း | ၈-၁၂ မိနစ် | OpenAI, Key Vault, model deployment ကို ဖန်တီးခြင်း |
| Application ကို configure လုပ်ခြင်း | ၂-၃ မိနစ် | Environment နှင့် dependencies ကို စနစ်တကျ ပြင်ဆင်ခြင်း |
| **စုစုပေါင်း** | **၁၂-၁၈ မိနစ်** | GPT-4 နှင့် chat ပြုလုပ်ရန် အသင့်ဖြစ်ခြင်း |

**မှတ်ချက်:** ပထမဆုံး OpenAI deployment သည် model provisioning ကြောင့် ပိုကြာနိုင်သည်။

## Quick Start

```bash
# ဥပမာကိုသွားပါ
cd examples/azure-openai-chat

# ပတ်ဝန်းကျင်ကိုစတင်ပါ
azd env new myopenai

# အားလုံးကိုဖြန့်ဝေပါ (အခြေခံအဆောက်အအုံ + ဖွဲ့စည်းမှု)
azd up
# သင်ကိုမေးမြန်းမည်မှာ:
# 1. Azure subscription ကိုရွေးပါ
# 2. OpenAI ရရှိနိုင်မှုရှိသောတည်နေရာကိုရွေးပါ (ဥပမာ- eastus, eastus2, westus)
# 3. ဖြန့်ဝေမှုအတွက် 12-18 မိနစ်စောင့်ပါ

# Python အခန်းကဏ္ဍများကိုတပ်ဆင်ပါ
pip install -r requirements.txt

# စကားပြောစတင်ပါ!
python chat.py
```

**မျှော်မှန်းထားသော output:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Deployment ကို စစ်ဆေးခြင်း

### အဆင့် ၁: Azure Resources ကို စစ်ဆေးပါ

```bash
# တင်ထားသောရင်းမြစ်များကိုကြည့်ရှုပါ
azd show

# မျှော်မှန်းထားသော output တွင်ပြသည်-
# - OpenAI Service: (ရင်းမြစ်အမည်)
# - Key Vault: (ရင်းမြစ်အမည်)
# - Deployment: gpt-4
# - Location: eastus (သို့မဟုတ် သင်ရွေးချယ်ထားသောဒေသ)
```

### အဆင့် ၂: OpenAI API ကို စမ်းသပ်ပါ

```bash
# OpenAI endpoint နှင့် key ကိုရယူပါ
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# API call ကိုစမ်းသပ်ပါ
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**မျှော်မှန်းထားသော တုံ့ပြန်မှု:**
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

### အဆင့် ၃: Key Vault Access ကို စစ်ဆေးပါ

```bash
# Key Vault တွင်လျှို့ဝှက်ချက်များစာရင်းပြုလုပ်ပါ
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**မျှော်မှန်းထားသော Secrets:**
- `openai-api-key`
- `openai-endpoint`

**အောင်မြင်မှုအချက်များ:**
- ✅ GPT-4 ဖြင့် OpenAI service ကို deploy လုပ်ပြီး
- ✅ API call သည် တုံ့ပြန်မှုကို အောင်မြင်စွာ ပြန်ပေးသည်
- ✅ Secrets များကို Key Vault တွင် သိမ်းဆည်းထားသည်
- ✅ Token အသုံးပြုမှု tracking အလုပ်လုပ်သည်

## Project Structure

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

## Application Features

### Chat Interface (`chat.py`)

Chat application တွင် ပါဝင်သောအရာများ:

- **Conversation History** - Messages များအကြား context ကို သိမ်းဆည်းထားသည်
- **Token Counting** - အသုံးပြုမှုကို စောင့်ကြည့်ပြီး ကုန်ကျစရိတ်ကို ခန့်မှန်းသည်
- **Error Handling** - Rate limits နှင့် API errors များကို သက်သာစွာ ကိုင်တွယ်သည်
- **Cost Estimation** - Message တစ်ခုစီအတွက် ကုန်ကျစရိတ်ကို အချိန်နှင့်တပြေးညီ ခန့်မှန်းသည်
- **Streaming Support** - Streaming responses ကို ရွေးချယ်နိုင်သည်

### Commands

Chat ပြုလုပ်စဉ်တွင် သင်အသုံးပြုနိုင်သောအရာများ:
- `quit` or `exit` - session ကို အဆုံးသတ်ရန်
- `clear` - Conversation history ကို ရှင်းရန်
- `tokens` - Token အသုံးပြုမှု စုစုပေါင်းကို ပြရန်
- `cost` - ကုန်ကျစရိတ် စုစုပေါင်းကို ပြရန်

### Configuration (`config.py`)

Environment variables မှ configuration ကို load လုပ်သည်:
```python
AZURE_OPENAI_ENDPOINT  # Key Vault မှ
AZURE_OPENAI_API_KEY   # Key Vault မှ
AZURE_OPENAI_MODEL     # ပုံမှန်: gpt-4
AZURE_OPENAI_MAX_TOKENS # ပုံမှန်: 800
```

## Usage Examples

### ရိုးရှင်းသော Chat

```bash
python chat.py
```

### Custom Model ဖြင့် Chat

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Streaming ဖြင့် Chat

```bash
python chat.py --stream
```

### ဥပမာ Conversation

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

## Cost Management

### Token Pricing (GPT-4)

| Model | Input (per 1K tokens) | Output (per 1K tokens) |
|-------|----------------------|------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### ခန့်မှန်းထားသော လစဉ်ကုန်ကျစရိတ်

အသုံးပြုမှုပုံစံအပေါ်မူတည်၍:

| အသုံးပြုမှုအဆင့် | Messages/Day | Tokens/Day | Monthly Cost |
|-------------|--------------|------------|--------------|
| **Light** | 20 messages | 3,000 tokens | $3-5 |
| **Moderate** | 100 messages | 15,000 tokens | $15-25 |
| **Heavy** | 500 messages | 75,000 tokens | $75-125 |

**Base Infrastructure Cost:** $1-2/လ (Key Vault + အနည်းဆုံး compute)

### Cost Optimization Tips

```bash
# 1. ပိုမိုလွယ်ကူသောအလုပ်များအတွက် GPT-3.5-Turbo ကိုအသုံးပြုပါ (20 ဆ ပိုသက်သာသည်)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. ပိုမိုတိုတောင်းသောအဖြေများအတွက် max tokens ကိုလျှော့ချပါ
export AZURE_OPENAI_MAX_TOKENS=400

# 3. token အသုံးပြုမှုကိုကြည့်ရှုပါ
python chat.py --show-tokens

# 4. ဘတ်ဂျက်သတိပေးချက်များကိုစီစဉ်ပါ
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Monitoring

### Token အသုံးပြုမှုကို ကြည့်ရန်

```bash
# Azure Portal တွင်:
# OpenAI Resource → Metrics → "Token Transaction" ကို ရွေးပါ

# သို့မဟုတ် Azure CLI မှတဆင့်:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### API Logs ကို ကြည့်ရန်

```bash
# စမ်းသပ်မှုမှတ်တမ်းများကို စီးဆင်းပါ
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# မေးမြန်းမှုမှတ်တမ်းများ
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Troubleshooting

### ပြဿနာ: "Access Denied" Error

**Symptoms:** API ကို ခေါ်သည့်အခါ 403 Forbidden

**Solutions:**
```bash
# 1. OpenAI ဝင်ရောက်ခွင့်အတည်ပြုပါ
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. API key မှန်ကန်မှုကိုစစ်ဆေးပါ
azd env get-value AZURE_OPENAI_API_KEY

# 3. Endpoint URL ပုံစံကိုအတည်ပြုပါ
azd env get-value AZURE_OPENAI_ENDPOINT
# https://[name].openai.azure.com/ ဖြစ်ရမည်
```

### ပြဿနာ: "Rate Limit Exceeded"

**Symptoms:** 429 Too Many Requests

**Solutions:**
```bash
# 1. လက်ရှိကိုတာကို စစ်ဆေးပါ
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. ကိုတာတိုးချဲ့မှုတောင်းဆိုပါ (လိုအပ်ပါက)
# Azure Portal → OpenAI Resource → Quotas → Request Increase သို့ သွားပါ

# 3. ပြန်လည်ကြိုးစားမှု logic ကို အကောင်အထည်ဖော်ပါ (chat.py တွင် ရှိပြီးသား)
# အပလီကေးရှင်းသည် အလိုအလျောက် exponential backoff ဖြင့် ပြန်လည်ကြိုးစားသည်
```

### ပြဿနာ: "Model Not Found"

**Symptoms:** Deployment အတွက် 404 error

**Solutions:**
```bash
# 1. ရရှိနိုင်သော deployment များကို စာရင်းပြုစုပါ
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. ပတ်ဝန်းကျင်အတွင်း model အမည်ကို အတည်ပြုပါ
echo $AZURE_OPENAI_MODEL

# 3. မှန်ကန်သော deployment အမည်သို့ အပ်ဒိတ်လုပ်ပါ
export AZURE_OPENAI_MODEL=gpt-4  # သို့မဟုတ် gpt-35-turbo
```

### ပြဿနာ: High Latency

**Symptoms:** တုံ့ပြန်မှုအချိန် >5 စက္ကန့်

**Solutions:**
```bash
# 1. ဒေသဆိုင်ရာ latency ကို စစ်ဆေးပါ
# အသုံးပြုသူများနှင့် အနီးဆုံးဒေသသို့ တင်သွင်းပါ

# 2. အမြန်ဆုံးတုံ့ပြန်မှုအတွက် max_tokens ကို လျှော့ချပါ
export AZURE_OPENAI_MAX_TOKENS=400

# 3. ပိုမိုကောင်းမွန်သော UX အတွက် streaming ကို အသုံးပြုပါ
python chat.py --stream
```

## လုံခြုံရေးအတွက် အကောင်းဆုံးအကဲဖြတ်ချက်များ

### 1. API Keys ကို ကာကွယ်ပါ

```bash
# အရေးကြီးသော Key များကို source control တွင် commit မလုပ်ပါနှင့်
# Key Vault ကို အသုံးပြုပါ (ပြီးသား configuration ဖြစ်သည်)

# Key များကို အကြိမ်ကြိမ် ပြောင်းလဲပါ
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Content Filtering ကို အကောင်အထည်ဖော်ပါ

```python
# Azure OpenAI တွင် built-in အကြောင်းအရာစစ်ထုတ်မှုပါဝင်သည်
# Azure Portal တွင် Configure လုပ်ပါ:
# OpenAI Resource → Content Filters → Custom Filter တစ်ခု Create လုပ်ပါ

# အမျိုးအစားများ: မုန်းတီးမှု, လိင်ပိုင်းဆိုင်ရာ, အကြမ်းဖက်မှု, ကိုယ်ကိုယ်ကို ထိခိုက်စေမှု
# အဆင့်များ: အနည်းငယ်, အလယ်အလတ်, အမြင့် စစ်ထုတ်မှု
```

### 3. Managed Identity ကို အသုံးပြုပါ (Production)

```bash
# ထုတ်လုပ်မှုဖြန့်ဝေမှုများအတွက် managed identity ကို အသုံးပြုပါ
# API key များအစား (Azure ပေါ်တွင် app hosting လိုအပ်သည်)

# infra/openai.bicep ကို အောက်ပါအတိုင်း update လုပ်ပါ:
# identity: { type: 'SystemAssigned' }
```

## Development

### Local မှာ Run လုပ်ရန်

```bash
# အခြေခံလိုအပ်ချက်များကို ထည့်သွင်းပါ
pip install -r src/requirements.txt

# ပတ်ဝန်းကျင်အပြောင်းအလဲများကို သတ်မှတ်ပါ
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# အက်ပလီကေးရှင်းကို အလုပ်လုပ်ပါ
python src/chat.py
```

### Tests ကို Run လုပ်ရန်

```bash
# စမ်းသပ်မှုအတွက်လိုအပ်သောအရာများကိုထည့်သွင်းပါ
pip install pytest pytest-cov

# စမ်းသပ်မှုများကိုပြုလုပ်ပါ
pytest tests/ -v

# ဖုံးလွှမ်းမှုနှင့်အတူ
pytest tests/ --cov=src --cov-report=html
```

### Model Deployment ကို Update လုပ်ရန်

```bash
# မော်ဒယ်ဗားရှင်းအမျိုးမျိုးကိုဖြန့်ချိပါ
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

## Clean Up

```bash
# Azure resources အားလုံးကို ဖျက်ပါ
azd down --force --purge

# ဤသည် ဖျက်သိမ်းသည် -
# - OpenAI Service
# - Key Vault (90 ရက် soft delete ဖြင့်)
# - Resource Group
# - အားလုံးသော deployments နှင့် configurations
```

## Next Steps

### ဤဥပမာကို တိုးချဲ့ရန်

1. **Web Interface ထည့်သွင်းပါ** - React/Vue frontend တည်ဆောက်ပါ
   ```bash
   # frontend service ကို azure.yaml ထဲထည့်ပါ
   # Azure Static Web Apps သို့ Deploy လုပ်ပါ
   ```

2. **RAG ကို အကောင်အထည်ဖော်ပါ** - Azure AI Search ဖြင့် စာရွက်ရှာဖွေရန် ထည့်သွင်းပါ
   ```python
   # Azure Cognitive Search ကိုပေါင်းစည်းပါ
   # စာရွက်များကို upload လုပ်ပြီး vector index တစ်ခုဖန်တီးပါ
   ```

3. **Function Calling ထည့်သွင်းပါ** - Tool အသုံးပြုမှုကို ဖွင့်ပါ
   ```python
   # chat.py တွင် function များကို သတ်မှတ်ပါ။
   # GPT-4 ကို အပြင် API များကို ခေါ်နိုင်စေပါ။
   ```

4. **Multi-Model Support ထည့်သွင်းပါ** - Models များစွာကို deploy လုပ်ပါ
   ```bash
   # gpt-35-turbo၊ embeddings မော်ဒယ်များထည့်ပါ
   # မော်ဒယ်လမ်းကြောင်းသတ်မှတ်မှု logic ကို အကောင်အထည်ဖော်ပါ
   ```

### ဆက်စပ်ဥပမာများ

- **[Retail Multi-Agent](../retail-scenario.md)** - အဆင့်မြင့် multi-agent architecture  
- **[Database App](../../../../examples/database-app)** - အဆင့်မြင့် storage ထည့်သွင်းပါ  
- **[Container Apps](../../../../examples/container-app)** - Containerized service အဖြစ် deploy လုပ်ပါ  

### သင်ကြားမှုအရင်းအမြစ်များ

- 📚 [AZD For Beginners Course](../../README.md) - အဓိကသင်တန်း
- 📚 [Azure OpenAI Documentation](https://learn.microsoft.com/azure/ai-services/openai/) - တရားဝင်စာရွက်စာတမ်းများ
- 📚 [OpenAI API Reference](https://platform.openai.com/docs/api-reference) - API အသေးစိတ်
- 📚 [Responsible AI](https://www.microsoft.com/ai/responsible-ai) - အကောင်းဆုံးအလေ့အကျင့်များ

## အပိုအရင်းအမြစ်များ

### Documentation
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - လမ်းညွှန်အပြည့်အစုံ
- **[GPT-4 Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Model စွမ်းရည်များ
- **[Content Filtering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - လုံခြုံရေး features
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd reference

### Tutorials
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - ပထမဆုံး deployment
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Chat apps တည်ဆောက်ခြင်း
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - အဆင့်မြင့် features

### Tools
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Web-based playground
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - Prompt များကို ပိုမိုကောင်းမွန်စွာ ရေးသားခြင်း
- **[Token Calculator](https://platform.openai.com/tokenizer)** - Token အသုံးပြုမှု ခန့်မှန်းခြင်း

### Community
- **[Azure AI Discord](https://discord.gg/azure)** - Community မှ အကူအညီရယူပါ
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Q&A forum
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - နောက်ဆုံး update များ

---

**🎉 အောင်မြင်မှု!** သင်သည် Azure OpenAI ကို deploy လုပ်ပြီး အလုပ်လုပ်နေသော chat application တစ်ခုကို တည်ဆောက်ပြီးဖြစ်သည်။ GPT-4 ၏ စွမ်းရည်များကို စတင်လေ့လာပြီး အမျိုးမျိုးသော prompts နှင့် အသုံးပြုမှုများကို စမ်းသပ်ပါ။

**မေးခွန်းများရှိပါသလား?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) သို့မဟုတ် [FAQ](../../resources/faq.md) ကို ကြည့်ပါ

**Cost Alert:** စမ်းသပ်မှုပြီးဆုံးပါက `azd down` ကို run လုပ်ပါ။ အဆက်မပြတ်အသုံးပြုမှုကြောင့် (~$50-100/လ) ကုန်ကျစရိတ် မရှိစေရန်။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->