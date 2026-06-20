# Microsoft Foundry Models Chat Application

**သင်ယူရေးလမ်းကြောင်း:** အလယ်တန်း ⭐⭐ | **အချိန်:** 35-45 မိနစ် | **ကုန်ကျစရိတ်:** $50-200/month

Azure Developer CLI (azd) ကို အသုံးပြုပြီး တပ်ဆင်ထားသည့် Microsoft Foundry Models အပြည့်အစုံ ပါဝင်သော စကားပြော အက်ပလီကေးရှင်း တစ်ခု။ ဤနမူနာတွင် gpt-4.1 မော်ဒယ် တပ်ဆင်မှု၊ API လုံခြုံစေရေးနှင့် ရိုးရှင်းသော စကားပြော မျက်နှာပြင်ကို ဖော်ပြထားသည်။

## 🎯 သင်ဘာတွေကို သင်ယူမလဲ

- gpt-4.1 မော်ဒယ်ဖြင့် Microsoft Foundry Models Service ကို တပ်ဆင်နည်း  
- Key Vault ဖြင့် OpenAI API ကီးများကို လုံခြုံစေခြင်း  
- Python ဖြင့် ရိုးရှင်းသော စကားပြော အင်တာဖေ့စ် ဖန်တီးခြင်း  
- တိုကင် အသုံးပြုမှုနှင့် ကုန်ကျစရိတ် များကို ထိန်းသိမ်းစောင့်ကြည့်ခြင်း  
- အမြန်နှုန်း ကန့်သတ်ခြင်းနှင့် အမှား ကိုင်တွယ်ခြင်း အကောင်အထည်ဖော်ခြင်း

## 📦 ပါဝင်သည့်အရာများ

✅ **Microsoft Foundry Models Service** - gpt-4.1 မော်ဒယ် တပ်ဆင်မှု  
✅ **Python Chat App** - ရိုးရှင်းသော command-line စကားပြော မျက်နှာပြင်  
✅ **Key Vault Integration** - API key များ လုံခြုံစွာ သိမ်းဆည်းခြင်း  
✅ **ARM Templates** - Infrastructure as Code အပြည့်အစုံ  
✅ **Cost Monitoring** - တိုကင် အသုံးပြုမှု ခြေရာခံမှု  
✅ **Rate Limiting** - ကိုတာ ကုန်ပျက်ခြင်း ကာကွယ်မှု  

## Architecture

```mermaid
graph TD
    App[Python စကားပြော အက်ပလီကေးရှင်း<br/>ဒေသတွင်း/တိမ် (Cloud)<br/>ကွန်မန့္လိုင်း အင်တာဖေ့စ်<br/>စကားပြော မှတ်တမ်း<br/>တိုကင် အသုံးပြုမှု စောင့်ကြည့်ခြင်း] -- "HTTPS (API သော့)" --> Foundry[Microsoft Foundry မော်ဒယ် ဝန်ဆောင်မှု<br/>gpt-4.1 မော်ဒယ်<br/>မိနစ်လျှင် 20K တိုကင် စွမ်းရည်<br/>ဒေသပေါင်းများစွာတွင် ဖေလ်အော့ဗာ]
    Foundry --> KV[Azure Key Vault<br/>OpenAI API သော့<br/>Endpoint URL]
    Foundry -. Managed Identity .-> KV
```

## Prerequisites

### လိုအပ်ချက်များ

- **Azure Developer CLI (azd)** - [တပ်ဆင်ခြင်း လမ်းညွှန်](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** နှင့် OpenAI ဝင်ခွင့် - [ခွင့်ပြုချက် တောင်းခံရန်](https://aka.ms/oai/access)
- **Python 3.9+** - [Python ထည့်သွင်းရန်](https://www.python.org/downloads/)

### လိုအပ်ချက်များကို စစ်ဆေးရန်

```bash
# azd ဗားရှင်းကို စစ်ဆေးပါ (1.5.0 သို့မဟုတ် အထက်လိုအပ်ပါသည်)
azd version

# Azure လော့ဂ်အင်ကို အတည်ပြုပါ
azd auth login

# Python ဗားရှင်းကို စစ်ဆေးပါ
python --version  # သို့မဟုတ် python3 --version

# OpenAI ဝင်ရောက်ခွင့်ကို အတည်ပြုပါ (Azure Portal ထဲတွင် စစ်ဆေးပါ)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ အရေးကြီး:** Microsoft Foundry Models သည် လျှောက်လွှာ အတည်ပြုချက် လိုအပ်ပါသည်။ သင် မကြာသေးကာ လျှောက်ထားထားခြင်း မရှိပါက [aka.ms/oai/access](https://aka.ms/oai/access) သို့ သွားပါ။ အတည်ပြုချက်သည် ပုံမှန်အားဖြင့် 1-2 လုပ်ငန်းနေ့ လက်ခံရပါသည်။

## ⏱️ တပ်ဆင်မှု အချိန်ဇယား

| အဆင့် | ကြာမြင့်ချိန် | ဖြစ်ပျက်သော အရာ |
|-------|----------|--------------|
| လိုအပ်ချက် စစ်ဆေးခြင်း | 2-3 minutes | OpenAI ခွင့်ပြုချက် ရရှိမှုကို စစ်ဆေးသည် |
| အခြေခံ အဆောက်အအုံ တပ်ဆင်ခြင်း | 8-12 minutes | OpenAI, Key Vault, မော်ဒယ် တပ်ဆင်မှုများ ဖန်တီးသည် |
| အက်ပလီကေးရှင်း ပြင်ဆင်ခြင်း | 2-3 minutes | ပတ်ဝန်းကျင်နှင့် သက်ဆိုင်ရာ အခြေနေများ သတ်မှတ်သည် |
| **စုစုပေါင်း** | **12-18 minutes** | gpt-4.1 နှင့် စကားပြောရန် အသင့်ရှိသည် |

**မှတ်ချက်:** OpenAI ကို ပထမဆုံး တပ်ဆင်သောအခါ မော်ဒယ် ပုံသဏ္ဍာန်ပြုလုပ်ခြင်းကြောင့် ပိုပြီး ကြာနိုင်သည်။

## လျင်မြန်စတင်ခြင်း

```bash
# ဥပမာကို သွားပါ
cd examples/azure-openai-chat

# ပတ်ဝန်းကျင်ကို စတင်စီမံပါ
azd env new myopenai

# အားလုံးကို တပ်ဆင်ပါ (အခြေခံအဆောက်အအုံနှင့် ဖွဲ့စည်းမှုပြင်ဆင်မှုများ)
azd up
# သင့်အား အောက်ပါအချက်များကို မေးမည်:
# 1. Azure subscription ကို ရွေးပါ
# 2. OpenAI ရရှိနိုင်သော တည်နေရာကို ရွေးပါ (ဥပမာ၊ eastus, eastus2, westus)
# 3. တပ်ဆင်မှုအတွက် 12-18 မိနစ် စောင့်ပါ

# Python အတွက် လိုအပ်သော library များကို ထည့်သွင်းပါ
pip install -r requirements.txt

# စကားပြောစတင်ပါ!
python chat.py
```

**မျှော်လင့်ထားသော ထွက်လာမည့် အချက်အလက်:**
```
🤖 Microsoft Foundry Models Chat Application
Connected to: gpt-4.1 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Microsoft Foundry Models.
Assistant: Microsoft Foundry Models Service provides REST API access to OpenAI's powerful language models including gpt-4.1, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ တပ်ဆင်မှု စစ်ဆေးရန်

### အဆင့် 1: Azure အရင်းအမြစ်များ စစ်ဆေးရန်

```bash
# တပ်ဆင်ပြီးသော အရင်းအမြစ်များကို ကြည့်ရှုပါ
azd show

# မျှော်လင့်ထားသော ထွက်ရှိမှုမှာ ပြသသည်:
# - OpenAI ဝန်ဆောင်မှု: (အရင်းအမြစ်အမည်)
# - Key Vault: (အရင်းအမြစ်အမည်)
# - တပ်ဆင်မှု: gpt-4.1
# - တည်နေရာ: eastus (သို့မဟုတ် သင့်ရွေးချယ်ထားသော ဒေသ)
```

### အဆင့် 2: OpenAI API စမ်းသပ်ခြင်း

```bash
# OpenAI endpoint နှင့် key ကို ရယူပါ
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# API ခေါ်ဆိုမှုကို စမ်းသပ်ပါ
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4.1/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**မျှော်လင့်ထားသော တုံ့ပြန်ချက်:**
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

### အဆင့် 3: Key Vault သို့ ဝင်ရောက်ခွင့် စစ်ဆေးမှု

```bash
# Key Vault ထဲရှိ လျှို့ဝှက်ချက်များကို စာရင်းပြရန်
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**မျှော်လင့်ထားသော လျှို့ဝှက်ချက်များ:**
- `openai-api-key`
- `openai-endpoint`

**အောင်မြင်မှု ချက်များ:**
- ✅ OpenAI service ကို gpt-4.1 နှင့် တပ်ဆင်ထားသည်  
- ✅ API ခေါ်ဆိုမှုက မှန်ကန်သော completion ကို 반환သည်  
- ✅ တွေ့ရှိသော လျှို့ဝှက်ချက်များကို Key Vault တွင် သိုလှောင်ထားသည်  
- ✅ တိုကင် အသုံးပြုမှု ခန့်မှန်းခြေ ချိန်ဆမှတ် ထားရှိသည်

## ပရောဂျက် ဖွဲ့စည်းမှု

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

## အက်ပလီကေးရှင်း အင်္ဂါရပ်များ

### စကားပြော မျက်နှာပြင် (`chat.py`)

ဒီ စကားပြော အက်ပလီကေးရှင်းတွင် ပါဝင်သည့် အချက်များ:

- **စကားပြော မှတ်တမ်း** - အကြောင်းအရာ ဆက်လက်ထားရှိသည်  
- **တိုကင် အရေအတွက် သတ်မှတ်ခြင်း** - အသုံးပြုမှုနှုန်းကို ချိန်ချက်ပါတယ်  
- **အမှား ကိုင်တွယ်ခြင်း** - rate limit နှင့် API အမှားများကို ပျက်ကွက်မဖြစ်စေစွာ ကိုင်တွယ်သည်  
- **ကုန်ကျစရိတ် ခန့်မှန်းခြင်း** - မက်ဆေ့ခ်် တစ်စုံချင်းအလိုက် တိုက်ရိုက် ကုန်ကျစရိတ် တွက်ချက်ခြင်း  
- **တစီးတစုံ စီးဆင်းတုံ့ပြန်မှု ထောက်ပံ့မှု** - ရွေးချယ်၍ စီးဆင်းဖလှယ်နိုင်သည်

### အမိန့်များ

စကားပြောစဉ် အောက်ပါအရာများ ကို အသုံးပြုနိုင်သည် -
- `quit` or `exit` - အစည်းအဝေး အပြီးသတ်ရန်  
- `clear` - စကားပြော မှတ်တမ်းများ ဖယ်ရှားရန်  
- `tokens` - စုစုပေါင်း တိုကင်အသုံးပြုမှု ပြရန်  
- `cost` - ခန့်မှန်းထားသော စုစုပေါင်း ကုန်ကျစရိတ် ပြရန်

### ဖွဲ့စည်းမှု (`config.py`)

ပတ်ဝန်းကျင် ဗေလျာများ (environment variables) မှ ဖွဲ့စည်းမှုများကို โหลดသည်။
```python
AZURE_OPENAI_ENDPOINT  # Key Vault မှ
AZURE_OPENAI_API_KEY   # Key Vault မှ
AZURE_OPENAI_MODEL     # ပုံမှန်: gpt-4.1
AZURE_OPENAI_MAX_TOKENS # ပုံမှန်: 800
```

## အသုံးပြု နမူနာများ

### ပင်မ စကားပြော

```bash
python chat.py
```

### အသုံးပြုသူ သတ်မှတ် မော်ဒယ်ဖြင့် စကားပြော

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### စီးဆင်းမှုဖြင့် စကားပြော

```bash
python chat.py --stream
```

### နမူနာ စကားလုံးလက်မှတ်

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

## ကုန်ကျစရိတ် ကိုင်တွယ်မှု

### တိုကင် စျေးနှုန်း (gpt-4.1)

| မော်ဒယ် | အင်ပွတ် (1K တိုကင်နှုန်းဖြင့်) | ထွက် (1K တိုကင်နှုန်းဖြင့်) |
|-------|----------------------|------------------------|
| gpt-4.1 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### ခန့်မှန်းထားသော လစဉ် ကုန်ကျစရိတ်

အသုံးပြုမူ အခြေအ နေများအပေါ် မူတည်၍ -

| အသုံးပြုမှု အဆင့် | မက်ဆေ့ခ််များ/နေ့ | တိုကင်များ/နေ့ | လစဉ် ကုန်ကျစရိတ် |
|-------------|--------------|------------|--------------|
| **Light** | 20 messages | 3,000 tokens | $3-5 |
| **Moderate** | 100 messages | 15,000 tokens | $15-25 |
| **Heavy** | 500 messages | 75,000 tokens | $75-125 |

**အခြေခံ အင်ဖရာစထရပ် ကုန်ကျစရိတ်:** $1-2/month (Key Vault + minimal compute)

### ကုန်ကျစရိတ် ထိရောက်စေမည့် အကြံပြုချက်များ

```bash
# 1. ပိုမိုရိုးရှင်းသော အလုပ်များအတွက် GPT-3.5-Turbo ကို အသုံးပြုပါ (20 ဆ ပိုသက်သာသည်)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. ပိုတိုသော တုံ့ပြန်ချက်များအတွက် အမြင့် token အရေအတွက်ကို လျော့ချပါ
export AZURE_OPENAI_MAX_TOKENS=400

# 3. token အသုံးပြုမှုကို စောင့်ကြည့်ပါ
python chat.py --show-tokens

# 4. ဘတ်ဂျက် အသိပေးချက်များကို သတ်မှတ်ပါ
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## စောင့်ကြည့်ခြင်း

### တိုကင် အသုံးပြုမှု ကြည့်ရန်

```bash
# Azure Portal တွင်:
# OpenAI အရင်းအမြစ် → မက်ထရစ်များ → "Token Transaction" ကိုရွေးပါ

# သို့မဟုတ် Azure CLI ဖြင့်:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### API မှတ်တမ်းများ ကြည့်ရန်

```bash
# အမှားရှာဖွေမှု လော့ဂ်များ စီးဆင်းခြင်း
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# မေးမြန်းမှု လော့ဂ်များ
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## ပြဿနာဖြေရှင်းခြင်း

### ပြဿနာ: "Access Denied" အမှား

**လက္ခဏာများ:** API ခေါ်ဆိုမှု အတွင်း 403 Forbidden ပြန်လာသည်

**ဖြေရှင်းချက်များ:**
```bash
# 1. OpenAI အသုံးခွင့် အတည်ပြုထားသည်ကို စစ်ဆေးပါ
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. API key သည် မှန်ကန်ကြောင်း စစ်ဆေးပါ
azd env get-value AZURE_OPENAI_API_KEY

# 3. endpoint URL ပုံစံကို အတည်ပြုပါ
azd env get-value AZURE_OPENAI_ENDPOINT
# အောက်ပါပုံစံဖြစ်ရမည်: https://[name].openai.azure.com/
```

### ပြဿနာ: "Rate Limit Exceeded"

**လက္ခဏာများ:** 429 Too Many Requests ပြန်လာသည်

**ဖြေရှင်းချက်များ:**
```bash
# ၁။ လက်ရှိ သတ်မှတ်ပမာဏ (quota) ကို စစ်ဆေးပါ
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4.1

# ၂။ (လိုအပ်ပါက) သတ်မှတ်ပမာဏ (quota) တိုးမြှင့်ရန် တောင်းဆိုပါ
# Azure Portal → OpenAI အရင်းအမြစ် → ပမာဏများ (Quotas) → တိုးမြှင့်ရန် တောင်းဆိုပါ

# ၃။ retry logic ကို အကောင်အထည်ဖော်ပါ (chat.py တွင် ရှိပြီး)
# အပလီကေးရှင်းသည် အလိုအလျောက် exponential backoff ဖြင့် ထပ်မံကြိုးစားလျက်ရှိသည်
```

### ပြဿနာ: "Model Not Found"

**လက္ခဏာများ:** deployment အတွက် 404 error ဖြစ်ပေါ်သည်

**ဖြေရှင်းချက်များ:**
```bash
# 1. ရနိုင်သော တပ်ဆင်ထားမှုများကို စာရင်းပြပါ
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. ပတ်ဝန်းကျင်တွင် မော်ဒယ်နာမည်ကို အတည်ပြုပါ
echo $AZURE_OPENAI_MODEL

# 3. မှန်ကန်သော တပ်ဆင်မှုအမည်သို့ အပ်ဒိတ်လုပ်ပါ
export AZURE_OPENAI_MODEL=gpt-4.1  # သို့မဟုတ် gpt-35-turbo
```

### ပြဿနာ: Latency အမြင့်

**လက္ခဏာများ:** တုံ့ပြန်ချိန် နည်းနည်း နှိုး (>5 seconds)

**ဖြေရှင်းချက်များ:**
```bash
# ၁။ ဒေသဆိုင်ရာ တုံ့ပြန်ချိန်ကို စစ်ဆေးပါ
# အသုံးပြုသူများနီးဆုံးရှိသော ဒေသသို့ ဖြန့်ချိပါ

# ၂။ တုံ့ပြန်ချက်များကို ပိုမိုမြန်စေရန် max_tokens ကို လျှော့ချပါ
export AZURE_OPENAI_MAX_TOKENS=400

# ၃။ ပိုကောင်းသော အသုံးပြုသူ အတွေ့အကြုံအတွက် streaming ကို အသုံးပြုပါ
python chat.py --stream
```

## လုံခြုံရေး အကောင်းဆုံး လက်တွေ့များ

### 1. API Key များကို ကာကွယ်ပါ

```bash
# သော့များကို source control ထဲသို့ မတင်ပါနှင့်
# Key Vault ကို အသုံးပြုပါ (အရင်က ဖွဲ့စည်းထားပြီး ဖြစ်သည်)

# သော့များကို ပုံမှန်အားဖြင့် လှည့်ပြောင်းပါ
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. အကြောင်းအရာ စစ်ထုတ်ခြင်း ထည့်ပါ

```python
# Microsoft Foundry Models တွင် ထည့်သွင်းထားသော အကြောင်းအရာ စစ်ထုတ်ခြင်း ပါဝင်သည်
# Azure Portal တွင် ပြင်ဆင်ရန်:
# OpenAI အရင်းအမြစ် → အကြောင်းအရာ စစ်ထုတ်များ → စိတ်ကြိုက် စစ်ထုတ်ကိရိယာ ဖန်တီးရန်

# အမျိုးအစားများ: မုန်းတီးမှု, လိင်ဆိုင်ရာ, အကြမ်းဖက်မှု, ကိုယ်ကို ထိခိုက်စေခြင်း
# အဆင့်များ: နိမ့်, အလတ်, မြင့် စစ်ထုတ်မှု
```

### 3. Managed Identity အသုံးပြုပါ (ထုတ်လုပ်မှုတွင်)

```bash
# ထုတ်လုပ်ရေး တင်သွင်းမှုများတွင် managed identity ကို အသုံးပြုပါ
# API keys များကို မသုံးဘဲ (app ကို Azure ပေါ်တွင် host လုပ်ထားရမည်)

# infra/openai.bicep ကို အောက်ပါအတိုင်း ပြင်ဆင်ပါ:
# identity: { type: 'SystemAssigned' }
```

## ဖွံ့ဖြိုးရေး

### ကိုယ်ပိုင်စက်တွင် ပြေးရန်

```bash
# လိုအပ်သော မူတည်မှုများကို တပ်ဆင်ပါ
pip install -r src/requirements.txt

# ပတ်ဝန်းကျင် အလျော့ပြောင်းတန်ဖိုးများကို သတ်မှတ်ပါ
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4.1"

# အပလီကေးရှင်းကို လည်ပတ်ပါ
python src/chat.py
```

### စမ်းသပ်ချက်များ ပြေးရန်

```bash
# စမ်းသပ်ရာတွင် လိုအပ်သော dependency များကို တပ်ဆင်ပါ
pip install pytest pytest-cov

# စမ်းသပ်မှုများကို ဆောင်ရွက်ပါ
pytest tests/ -v

# ကုဒ်ဖုံးလွှမ်းမှုဖြင့်
pytest tests/ --cov=src --cov-report=html
```

### မော်ဒယ် တပ်ဆင်မှု ကို အပ်ဒိတ်လုပ်ရန်

```bash
# မတူသော မော်ဒယ်ဗားရှင်းကို တပ်ဆင်ပါ
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

## ရှင်းလင်းခြင်း

```bash
# Azure အရင်းအမြစ်အားလုံးကို ဖျက်ပါ
azd down --force --purge

# အောက်ပါ အရာများကို ဖယ်ရှားမည်:
# - OpenAI ဝန်ဆောင်မှု
# - Key Vault (90-ရက် နူးညံ့စွာ ဖျက်ခြင်းဖြင့်)
# - အရင်းအမြစ်အုပ်စု
# - အားလုံးသော တပ်ဆင်မှုများနှင့် ဖွဲ့စည်းချက်များ
```

## နောက်ထပ် အဆင့်များ

### ဒီ နမူနာကို တိုးချဲ့ရန်

1. **ဝက်ဘ် အင်တာဖေ့စ် ထည့်သွင်းရန်** - React/Vue frontend တည်ဆောက်ပါ  
   ```bash
   # azure.yaml ဖိုင်ထဲသို့ frontend ဝန်ဆောင်မှုကို ထည့်ပါ
   # Azure Static Web Apps သို့ တင်ပါ
   ```

2. **RAG ကို အကောင်အထည်ဖော်ရန်** - Azure AI Search ဖြင့် စာရွက်စာတမ်း ရှာဖွေရေး ထည့်သွင်းပါ  
   ```python
   # Azure AI Search ကို ပေါင်းစည်းပါ
   # စာရွက်စာတမ်းများကို တင်ပြီး ဗက်တာ အင်ဒက်စ် ဖန်တီးပါ
   ```

3. **Function Calling ထည့်သွင်းရန်** - ကိရိယာ အသုံးပြုမှု ဖွင့်ပါ  
   ```python
   # chat.py ဖိုင်အတွင်း function များကို သတ်မှတ်ပါ
   # gpt-4.1 ကို ပြင်ပ API များခေါ်ခိုင်းပါ
   ```

4. **မော်ဒယ် မျိုးစုံ ထောက်ပံ့မှု** - မော်ဒယ် မျိုးစုံ တပ်ဆင်ပါ  
   ```bash
   # gpt-35-turbo နှင့် embeddings မော်ဒယ်များ ထည့်ပါ
   # မော်ဒယ် routing လိုဂစ်ကို အကောင်အထည်ဖော်ပါ
   ```

### ဆက်စပ် နမူနာများ

- **[Retail Multi-Agent](../retail-scenario.md)** - တိုးတက်သော multi-agent ဖွဲ့စည်းပုံ  
- **[Database App](../../../../examples/database-app)** - အမြဲတမ်း သိမ်းဆည်းမှု ထည့်သွင်းရန်  
- **[Container Apps](../../../../examples/container-app)** - ကွန်တိန်နာ အဖြစ် စေဝန်တင်ရန်

### သင်ယူရေး အရင်းအမြစ်များ

- 📚 [AZD For Beginners Course](../../README.md) - သင်တန်း မူလစာမျက်နှာ  
- 📚 [Microsoft Foundry Models Documentation](https://learn.microsoft.com/azure/ai-services/openai/) - တရားဝင် လမ်းပြစာတမ်းများ  
- 📚 [OpenAI API Reference](https://platform.openai.com/docs/api-reference) - API အသေးစိတ် ရှင်းလင်းချက်  
- 📚 [Responsible AI](https://www.microsoft.com/ai/responsible-ai) - ကျင့်ဝတ်နှင့် လုံခြုံရေး လမ်းညွှန်ချက်များ

## အပိုဆောင်း အရင်းအမြစ်များ

### စာတမ်းများ
- **[Microsoft Foundry Models Service](https://learn.microsoft.com/azure/ai-services/openai/)** - လမ်းညွှန် အပြည့်အစုံ  
- **[gpt-4.1 Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - မော်ဒယ် အင်္ဂါရပ်များ  
- **[Content Filtering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - စာ contenidos လုံခြုံရေး လုပ်ဆောင်ချက်များ  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd ကိုးကားစာမျက်နှာ

### သင်ခန်းစာများ
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - ပထမဆုံး တပ်ဆင်ခြင်း  
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - စကားပြော အက်ပလီကေးရှင်း ဖန်တီးခြင်း  
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - မြင့်မားသော လက္ခဏာများ

### ကိရိယာများ
- **[Microsoft Foundry Models Studio](https://oai.azure.com/)** - ဝက်ဘ် အခြေခံ ကြမ်းပြင်  
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - မေးခွန်းရေးခြင်း အကောင်းမြင်နည်းများ  
- **[Token Calculator](https://platform.openai.com/tokenizer)** - တိုကင် အသုံးပြုမှု ခန့်မှန်းရန်

### အသိုင်းအဝိုင်း
- **[Azure AI Discord](https://discord.gg/azure)** - အသိုင်းအဝိုင်း မှ အကူအညီရယူရန်  
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - မေးမြန်းရန် နှင့် ဆွေးနွေးရန်  
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - နောက်ဆုံး အချက်အလက်များ

---

**🎉 အောင်မြင်ပါပြီ!** သင် Microsoft Foundry Models ကို တပ်ဆင်ပြီး လည်ပတ်နိုင်သော စကားပြော အက်ပလီကေးရှင်း တည်ဆောက်နိုင်ခဲ့ပါပြီ။ gpt-4.1 ၏ စွမ်းရည်များကို သွားလေ့လာပြီး မတူညီသော prompt များနှင့် အသုံးအနှုန်းများကို စမ်းသပ်ကြည့်ပါ။

**မေးခွန်းများရှိပါသလား?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) သို့ မေးမြန်းရန် သို့မဟုတ် [FAQ](../../resources/faq.md) ကို စစ်ဆေးပါ။

**ကုန်ကျစရိတ် သတိပေးချက်:** စမ်းသပ်မှု ပြီးပါက `azd down` ကို အလုပ်လုပ်စေရန် မမေ့ပါနဲ ့ ဆက်လက် ကြေးပေးမှု မဖြစ်အောင်(ရေတွက်ချက် ~ $50-100/month အတွက် အလှည့်အပြောင်း အသုံးပြုမှု)။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->