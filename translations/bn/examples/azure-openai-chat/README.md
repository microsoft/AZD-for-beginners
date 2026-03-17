# Microsoft Foundry Models চ্যাট অ্যাপ্লিকেশন

**শিখন পথ:** মধ্যবর্তী ⭐⭐ | **সময়:** 35-45 মিনিট | **খরচ:** $50-200/month

Azure Developer CLI (azd) ব্যবহার করে ডিপ্লয় করা একটি সম্পূর্ণ Microsoft Foundry Models চ্যাট অ্যাপ্লিকেশন। এই উদাহরণটি gpt-4.1 ডিপ্লয়মেন্ট, সুরক্ষিত API অ্যাক্সেস, এবং একটি সাধারণ চ্যাট ইন্টারফেস প্রদর্শন করে।

## 🎯 আপনি যা শিখবেন

- gpt-4.1 মডেল দিয়ে Microsoft Foundry Models Service ডিপ্লয় করা
- Key Vault দিয়ে OpenAI API কী সুরক্ষিত রাখা
- Python দিয়ে একটি সহজ চ্যাট ইন্টারফেস তৈরি করা
- টোকেন ব্যবহার এবং খরচ মনিটর করা
- রেট লিমিটিং এবং ত্রুটি হ্যান্ডলিং বাস্তবায়ন করা

## 📦 কী অন্তর্ভুক্ত রয়েছে

✅ **Microsoft Foundry Models Service** - gpt-4.1 মডেলের ডিপ্লয়মেন্ট  
✅ **Python Chat App** - সহজ কমান্ড-লাইন চ্যাট ইন্টারফেস  
✅ **Key Vault Integration** - API কী নিরাপদে সংরক্ষণ  
✅ **ARM Templates** - সম্পূর্ণ ইনফ্রাস্ট্রাকচার অ্যাজ কোড  
✅ **Cost Monitoring** - টোকেন ব্যবহারের ট্র্যাকিং  
✅ **Rate Limiting** - কোটার অপচয় রোধ করা  

## আর্কিটেকচার

```mermaid
graph TD
    App[পাইথন চ্যাট অ্যাপ্লিকেশন<br/>লোকাল/ক্লাউড<br/>কমান্ড-লাইন ইন্টারফেস<br/>কথোপকথনের ইতিহাস<br/>টোকেন ব্যবহারের ট্র্যাকিং] -- "HTTPS (API কী)" --> Foundry[মাইক্রোসফট ফাউন্ড্রি মডেল সার্ভিস<br/>gpt-4.1 মডেল<br/>20K টোকেন/মিন ক্ষমতা<br/>মাল্টি-রিজিয়ন ফেইলওভার]
    Foundry --> KV[অ্যাজুর কী ভল্ট<br/>OpenAI API কী<br/>এন্ডপয়েন্ট URL]
    Foundry -. ম্যানেজড আইডেন্টিটি .-> KV
```
## প্রয়োজনীয়তা

### আবশ্যক

- **Azure Developer CLI (azd)** - [ইনস্টল গাইড](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** with OpenAI access - [Request access](https://aka.ms/oai/access)
- **Python 3.9+** - [Install Python](https://www.python.org/downloads/)

### প্রয়োজনীয়তা যাচাই করুন

```bash
# azd সংস্করণ যাচাই করুন (প্রয়োজন 1.5.0 বা তার উপরে)
azd version

# Azure লগইন যাচাই করুন
azd auth login

# Python সংস্করণ যাচাই করুন
python --version  # অথবা python3 --version

# OpenAI অ্যাক্সেস যাচাই করুন (Azure পোর্টালে পরীক্ষা করুন)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ গুরুত্বপুর্ণ:** Microsoft Foundry Models-এ আবেদন অনুমোদন প্রয়োজন। আপনি যদি এখনও আবেদন না করে থাকেন, দেখুন [aka.ms/oai/access](https://aka.ms/oai/access)। অনুমোদন সাধারণত 1-2 কার্যদিবস সময় নেয়।

## ⏱️ ডিপ্লয়মেন্ট সময়রেখা

| Phase | Duration | What Happens |
|-------|----------|--------------|
| Prerequisites check | 2-3 minutes | Verify OpenAI quota availability |
| Deploy infrastructure | 8-12 minutes | Create OpenAI, Key Vault, model deployment |
| Configure application | 2-3 minutes | Set up environment and dependencies |
| **Total** | **12-18 minutes** | Ready to chat with gpt-4.1 |

**নোট:** প্রথমবার OpenAI ডিপ্লয়মেন্ট মডেল প্রোভিশনিংয়ের কারণে বেশি সময় নিতে পারে।

## দ্রুত শুরু

```bash
# উদাহরণে যান
cd examples/azure-openai-chat

# পরিবেশ আরম্ভ করুন
azd env new myopenai

# সবকিছু স্থাপন করুন (অবকাঠামো + কনফিগারেশন)
azd up
# আপনাকে অনুরোধ করা হবে:
# 1. Azure সাবস্ক্রিপশন নির্বাচন করুন
# 2. OpenAI উপলব্ধ এমন অবস্থান নির্বাচন করুন (যেমন: eastus, eastus2, westus)
# 3. ডিপ্লয়ের জন্য 12-18 মিনিট অপেক্ষা করুন

# Python নির্ভরশীলতা ইনস্টল করুন
pip install -r requirements.txt

# চ্যাট শুরু করুন!
python chat.py
```

**প্রত্যাশিত আউটপুট:**
```
🤖 Microsoft Foundry Models Chat Application
Connected to: gpt-4.1 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Microsoft Foundry Models.
Assistant: Microsoft Foundry Models Service provides REST API access to OpenAI's powerful language models including gpt-4.1, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ ডিপ্লয়মেন্ট যাচাই করুন

### ধাপ 1: Azure রিসোর্স পরীক্ষা করুন

```bash
# ডিপ্লয় করা সম্পদ দেখুন
azd show

# প্রত্যাশিত আউটপুট দেখায়:
# - OpenAI সেবা: (রিসোর্সের নাম)
# - কী ভল্ট: (রিসোর্সের নাম)
# - ডিপ্লয়মেন্ট: gpt-4.1
# - অবস্থান: eastus (অথবা আপনার নির্বাচিত অঞ্চল)
```

### ধাপ 2: OpenAI API পরীক্ষা করুন

```bash
# OpenAI এন্ডপয়েন্ট এবং কী প্রাপ্ত করুন
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# API কল পরীক্ষা করুন
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4.1/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**প্রত্যাশিত রেসপন্স:**
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

### ধাপ 3: Key Vault অ্যাক্সেস যাচাই করুন

```bash
# Key Vault-এ সিক্রেটগুলো তালিকা করুন
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**প্রত্যাশিত সিক্রেটস:**
- `openai-api-key`
- `openai-endpoint`

**সফলতার মানদণ্ড:**
- ✅ gpt-4.1 সহ OpenAI সার্ভিস ডিপ্লয় হয়েছে
- ✅ API কল বৈধ কমপ্লিশন ফিরিয়ে দেয়
- ✅ সিক্রেটস Key Vault-এ সংরক্ষিত
- ✅ টোকেন ব্যবহারের ট্র্যাকিং কাজ করছে

## প্রকল্প কাঠামো

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

## অ্যাপ্লিকেশনের বৈশিষ্ট্য

### চ্যাট ইন্টারফেস (`chat.py`)

চ্যাট অ্যাপ্লিকেশনটি অন্তর্ভুক্ত করে:

- **Conversation History** - বার্তাগুলোর মধ্যে প্রসঙ্গ বজায় রাখে
- **Token Counting** - ব্যবহার ট্র্যাক করে এবং খরচ অনুমান করে
- **Error Handling** - রেট লিমিট এবং API ত্রুটিগুলো সুন্দরভাবে পরিচালনা করে
- **Cost Estimation** - প্রতি বার্তায় রিয়েল-টাইম খরচ হিসাব করে
- **Streaming Support** - ঐচ্ছিক স্ট্রিমিং রেসপন্স সমর্থন

### কমান্ডসমূহ

চ্যাট করার সময়, আপনি ব্যবহার করতে পারেন:
- `quit` or `exit` - সেশন শেষ করুন
- `clear` - কথোপকথনের ইতিহাস মুছুন
- `tokens` - মোট টোকেন ব্যবহার দেখান
- `cost` - মোট আনুমানিক খরচ দেখান

### কনফিগারেশন (`config.py`)

কনফিগারেশন পরিবেশ ভেরিয়েবল থেকে লোড করে:
```python
AZURE_OPENAI_ENDPOINT  # কী ভল্ট থেকে
AZURE_OPENAI_API_KEY   # কী ভল্ট থেকে
AZURE_OPENAI_MODEL     # ডিফল্ট: gpt-4.1
AZURE_OPENAI_MAX_TOKENS # ডিফল্ট: 800
```

## ব্যবহারের উদাহরণ

### বেসিক চ্যাট

```bash
python chat.py
```

### কাস্টম মডেল দিয়ে চ্যাট

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### স্ট্রিমিং সহ চ্যাট

```bash
python chat.py --stream
```

### উদাহরণ কথোপকথন

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

## খরচ ব্যবস্থাপনা

### টোকেন মূল্যনির্ধারণ (gpt-4.1)

| Model | Input (per 1K tokens) | Output (per 1K tokens) |
|-------|----------------------|------------------------|
| gpt-4.1 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### আনুমানিক মাসিক খরচ

ব্যবহার প্যাটার্নের উপর ভিত্তি করে:

| Usage Level | Messages/Day | Tokens/Day | Monthly Cost |
|-------------|--------------|------------|--------------|
| **হালকা** | 20 messages | 3,000 tokens | $3-5 |
| **মধ্যমান** | 100 messages | 15,000 tokens | $15-25 |
| **ভারী** | 500 messages | 75,000 tokens | $75-125 |

**বেস ইনফ্রাস্ট্রাকচার খরচ:** $1-2/month (Key Vault + minimal compute)

### খরচ অপ্টিমাইজেশন টিপস

```bash
# 1. সহজ কাজের জন্য GPT-3.5-Turbo ব্যবহার করুন (২০ গুণ সস্তা)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. সংক্ষিপ্ত উত্তরগুলির জন্য সর্বোচ্চ টোকেন কমান
export AZURE_OPENAI_MAX_TOKENS=400

# 3. টোকেন ব্যবহারের উপর নজর রাখুন
python chat.py --show-tokens

# 4. বাজেট সতর্কতা সেট করুন
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## পর্যবেক্ষণ

### টোকেন ব্যবহার দেখুন

```bash
# Azure পোর্টালে:
# OpenAI রিসোর্স → মেট্রিক্স → "Token Transaction" নির্বাচন করুন

# অথবা Azure CLI-এর মাধ্যমে:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### API লগ দেখুন

```bash
# ডায়াগনস্টিক লগগুলি স্ট্রিম করুন
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# কোয়েরি লগগুলি
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## ট্রাবলশুটিং

### সমস্যা: "Access Denied" ত্রুটি

**লক্ষণ:** API কল করার সময় 403 Forbidden

**সমাধানসমূহ:**
```bash
# 1. নিশ্চিত করুন যে OpenAI অ্যাক্সেস অনুমোদিত
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. যাচাই করুন যে API কী সঠিক
azd env get-value AZURE_OPENAI_API_KEY

# 3. এন্ডপয়েন্ট URL ফর্ম্যাট যাচাই করুন
azd env get-value AZURE_OPENAI_ENDPOINT
# হতে হবে: https://[name].openai.azure.com/
```

### সমস্যা: "Rate Limit Exceeded"

**লক্ষণ:** 429 Too Many Requests

**সমাধানসমূহ:**
```bash
# 1. বর্তমান কোটা পরীক্ষা করুন
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4.1

# 2. প্রয়োজন হলে কোটা বৃদ্ধি অনুরোধ করুন
# Azure পোর্টালে যান → OpenAI রিসোর্স → কোটা → বৃদ্ধি অনুরোধ করুন

# 3. রিট্রাই লজিক বাস্তবায়ন করুন (ইতিমধ্যে chat.py-এ আছে)
# অ্যাপ্লিকেশনটি স্বয়ংক্রিয়ভাবে এক্সপোনেনশিয়াল ব্যাকঅফ ব্যবহার করে পুনরায় চেষ্টা করে
```

### সমস্যা: "Model Not Found"

**লক্ষণ:** ডিপ্লয়মেন্টের জন্য 404 ত্রুটি

**সমাধানসমূহ:**
```bash
# 1. উপলব্ধ ডিপ্লয়মেন্টগুলো তালিকাভুক্ত করুন
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. পরিবেশে মডেলের নাম যাচাই করুন
echo $AZURE_OPENAI_MODEL

# 3. সঠিক ডিপ্লয়মেন্ট নাম দিয়ে আপডেট করুন
export AZURE_OPENAI_MODEL=gpt-4.1  # অথবা gpt-35-turbo
```

### সমস্যা: উচ্চ লেটেন্সি

**লক্ষণ:** ধীর রেসপন্স সময় (>5 সেকেন্ড)

**সমাধানসমূহ:**
```bash
# 1. আঞ্চলিক বিলম্ব পরীক্ষা করুন
# ব্যবহারকারীদের সবচেয়ে কাছের অঞ্চলে ডিপ্লয় করুন

# 2. দ্রুত প্রতিক্রিয়ার জন্য max_tokens কমান
export AZURE_OPENAI_MAX_TOKENS=400

# 3. উন্নত ব্যবহারকারী অভিজ্ঞতার জন্য স্ট্রিমিং ব্যবহার করুন
python chat.py --stream
```

## সুরক্ষা সেরা অনুশীলন

### 1. API কী সুরক্ষিত রাখুন

```bash
# কখনও কীগুলো সোর্স কন্ট্রোলে কমিট করবেন না
# Key Vault ব্যবহার করুন (ইতিমধ্যেই কনফিগার করা আছে)

# কীগুলো নিয়মিত পরিবর্তন করুন
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. কনটেন্ট ফিল্টারিং বাস্তবায়ন করুন

```python
# Microsoft Foundry মডেলগুলোতে অন্তর্নির্মিত কনটেন্ট ফিল্টারিং রয়েছে
# Azure পোর্টালে কনফিগার করুন:
# OpenAI রিসোর্স → কনটেন্ট ফিল্টারস → কাস্টম ফিল্টার তৈরি করুন

# বিভাগসমূহ: ঘৃণা, যৌন, হিংসা, আত্মহানি
# স্তর: কম, মাঝারি, উচ্চ ফিল্টারিং
```

### 3. ম্যানেজড আইডেন্টিটি ব্যবহার করুন (প্রোডাকশন)

```bash
# প্রোডাকশন ডিপ্লয়মেন্টগুলির জন্য ম্যানেজড আইডেন্টিটি ব্যবহার করুন
# API কীগুলোর পরিবর্তে (অ্যাপটি Azure-এ হোস্ট করা প্রয়োজন)

# infra/openai.bicep আপডেট করে এতে অন্তর্ভুক্ত করুন:
# identity: { type: 'SystemAssigned' }
```

## ডেভেলপমেন্ট

### লোকালভাবে চালান

```bash
# নির্ভরশীলতাগুলি ইনস্টল করুন
pip install -r src/requirements.txt

# পরিবেশ ভেরিয়েবল সেট করুন
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4.1"

# অ্যাপ্লিকেশন চালান
python src/chat.py
```

### টেস্ট চালান

```bash
# টেস্ট নির্ভরতা ইনস্টল করুন
pip install pytest pytest-cov

# টেস্ট চালান
pytest tests/ -v

# কভারেজ সহ
pytest tests/ --cov=src --cov-report=html
```

### মডেল ডিপ্লয়মেন্ট আপডেট করুন

```bash
# বিভিন্ন মডেল সংস্করণ ডিপ্লয় করুন
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

## পরিষ্কার করুন

```bash
# সমস্ত Azure রিসোর্স মুছে ফেলুন
azd down --force --purge

# এটি মুছে ফেলবে:
# - OpenAI সার্ভিস
# - Key Vault (৯০ দিনের সফট ডিলিটসহ)
# - রিসোর্স গ্রুপ
# - সমস্ত ডিপ্লয়মেন্ট এবং কনফিগারেশন
```

## পরবর্তী ধাপ

### এই উদাহরণটি প্রসারিত করুন

1. **Add Web Interface** - React/Vue ফ্রন্টএন্ড তৈরি করুন
   ```bash
   # azure.yaml-এ ফ্রন্টএন্ড সার্ভিস যোগ করুন
   # Azure Static Web Apps-এ ডিপ্লয় করুন
   ```

2. **Implement RAG** - Azure AI Search দিয়ে ডকুমেন্ট সার্চ যোগ করুন
   ```python
   # Azure Cognitive Search একীভূত করুন
   # ডকুমেন্ট আপলোড করুন এবং ভেক্টর ইনডেক্স তৈরি করুন
   ```

3. **Add Function Calling** - টুল ব্যবহার সক্ষম করুন
   ```python
   # chat.py-এ ফাংশনগুলো সংজ্ঞায়িত করুন
   # gpt-4.1-কে বাহ্যিক API কল করতে দিন
   ```

4. **Multi-Model Support** - একাধিক মডেল ডিপ্লয় করুন
   ```bash
   # gpt-35-turbo এবং এমবেডিংস মডেল যোগ করুন
   # মডেল রাউটিং লজিক বাস্তবায়ন করুন
   ```

### সম্পর্কিত উদাহরণ

- **[Retail Multi-Agent](../retail-scenario.md)** - উন্নত মাল্টি-এজেন্ট আর্কিটেকচার
- **[Database App](../../../../examples/database-app)** - স্থায়ী স্টোরেজ যোগ করুন
- **[Container Apps](../../../../examples/container-app)** - কন্টেইনারাইজড সার্ভিস হিসেবে ডিপ্লয় করুন

### শেখার সম্পদ

- 📚 [AZD For Beginners Course](../../README.md) - মূল কোর্স হোম
- 📚 [Microsoft Foundry Models Documentation](https://learn.microsoft.com/azure/ai-services/openai/) - অফিসিয়াল ডকুমেন্টেশন
- 📚 [OpenAI API Reference](https://platform.openai.com/docs/api-reference) - API বিবরণ
- 📚 [Responsible AI](https://www.microsoft.com/ai/responsible-ai) - সেরা অনুশীলন

## অতিরিক্ত সম্পদ

### ডকুমেন্টেশন
- **[Microsoft Foundry Models Service](https://learn.microsoft.com/azure/ai-services/openai/)** - সম্পূর্ণ গাইড
- **[gpt-4.1 Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - মডেলের ক্ষমতা
- **[Content Filtering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - সেফটি ফিচার্স
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd রেফারেন্স

### টিউটোরিয়াল
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - প্রথম ডিপ্লয়মেন্ট
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - চ্যাট অ্যাপ তৈরি করা
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - উন্নত ফিচার্স

### টুলস
- **[Microsoft Foundry Models Studio](https://oai.azure.com/)** - ওয়েব-ভিত্তিক প্লেগ্রাউন্ড
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - ভাল প্রম্পট লেখার নির্দেশিকা
- **[Token Calculator](https://platform.openai.com/tokenizer)** - টোকেন ব্যবহার অনুমান করুন

### কমিউনিটি
- **[Azure AI Discord](https://discord.gg/azure)** - কমিউনিটি থেকে সাহায্য নিন
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - প্রশ্নোত্তর ফোরাম
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - সর্বশেষ আপডেট

---

**🎉 সফলতা!** আপনি Microsoft Foundry Models ডিপ্লয় করেছেন এবং একটি কার্যকরী চ্যাট অ্যাপ্লিকেশন তৈরি করেছেন। gpt-4.1-এর ক্ষমতা অন্বেষণ করা শুরু করুন এবং বিভিন্ন প্রম্পট এবং ব্যবহার কেস নিয়ে পরীক্ষা করুন।

**প্রশ্ন আছে?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) অথবা [FAQ](../../resources/faq.md) দেখুন

**খরচ সতর্কতা:** টেস্টিং শেষ হলে চলমান চার্জ এড়াতে `azd down` চালাতে ভুলবেন না (~$50-100/month সক্রিয় ব্যবহারের জন্য)।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকারোক্তি:
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। আমরা যতটা সম্ভব নির্ভুলতার চেষ্টা করি, কিন্তু দয়া করে লক্ষ্য করুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসামঞ্জস্য থাকতে পারে। মূল নথিটি তার মূল ভাষাতেই প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারের ফলে হওয়া যেকোনো ভুল বোঝাবুঝি বা ভ্রান্ত ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->