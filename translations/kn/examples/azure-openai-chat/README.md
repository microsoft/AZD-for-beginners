# Azure OpenAI ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್

**ಕಲಿಕೆಯ ಹಾದಿ:** ಮಧ್ಯಮ ⭐⭐ | **ಸಮಯ:** 35-45 ನಿಮಿಷಗಳು | **ವೆಚ್ಚ:** $50-200/ತಿಂಗಳು

Azure Developer CLI (azd) ಬಳಸಿ ಡಿಪ್ಲಾಯ್ ಮಾಡಲಾದ ಸಂಪೂರ್ಣ Azure OpenAI ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್. ಈ ಉದಾಹರಣೆ GPT-4 ಡಿಪ್ಲಾಯ್ಮೆಂಟ್, ಸುರಕ್ಷಿತ API ಪ್ರವೇಶ, ಮತ್ತು ಸರಳ ಚಾಟ್ ಇಂಟರ್ಫೇಸ್ ಅನ್ನು ತೋರಿಸುತ್ತದೆ.

## 🎯 ನೀವು ಕಲಿಯುವದು

- GPT-4 ಮಾದರಿಯೊಂದಿಗೆ Azure OpenAI ಸೇವೆಯನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡುವುದು  
- Key Vault ಬಳಸಿ OpenAI API ಕೀಗಳನ್ನು ಸುರಕ್ಷಿತಗೊಳಿಸುವುದು  
- Python ಬಳಸಿ ಸರಳ ಚಾಟ್ ಇಂಟರ್ಫೇಸ್ ನಿರ್ಮಿಸುವುದು  
- ಟೋಕನ್ ಬಳಕೆ ಮತ್ತು ವೆಚ್ಚಗಳನ್ನು ನಿಗಾ ಮಾಡುವುದು  
- ದರ ಮಿತಿಯನ್ನು ಮತ್ತು ದೋಷ ನಿರ್ವಹಣೆಯನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುವುದು  

## 📦 ಒಳಗೊಂಡಿರುವದು

✅ **Azure OpenAI ಸೇವೆ** - GPT-4 ಮಾದರಿಯ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್  
✅ **Python ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್** - ಸರಳ ಕಮಾಂಡ್-ಲೈನ್ ಚಾಟ್ ಇಂಟರ್ಫೇಸ್  
✅ **Key Vault ಇಂಟಿಗ್ರೇಶನ್** - API ಕೀ ಸಂಗ್ರಹಣೆ  
✅ **ARM ಟೆಂಪ್ಲೇಟ್ಸ್** - ಸಂಪೂರ್ಣ ಮೂಲಸೌಕರ್ಯ ಕೋಡ್  
✅ **ವೆಚ್ಚ ನಿಗಾ** - ಟೋಕನ್ ಬಳಕೆ ಟ್ರ್ಯಾಕಿಂಗ್  
✅ **ದರ ಮಿತಿ** - ಕೋಟಾ ಮುಗಿಯುವುದನ್ನು ತಡೆಯುವುದು  

## ಆರ್ಕಿಟೆಕ್ಚರ್

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

## ಪೂರ್ವಾಪೇಕ್ಷಿತಗಳು

### ಅಗತ್ಯವಿರುವವು

- **Azure Developer CLI (azd)** - [ಸ್ಥಾಪನೆ ಮಾರ್ಗದರ್ಶಿ](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- **Azure ಚಂದಾದಾರಿಕೆ** OpenAI ಪ್ರವೇಶದೊಂದಿಗೆ - [ಪ್ರವೇಶಕ್ಕಾಗಿ ವಿನಂತಿ](https://aka.ms/oai/access)  
- **Python 3.9+** - [Python ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ](https://www.python.org/downloads/)  

### ಪೂರ್ವಾಪೇಕ್ಷಿತಗಳನ್ನು ಪರಿಶೀಲಿಸಿ

```bash
# azd ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ (1.5.0 ಅಥವಾ ಹೆಚ್ಚಿನದನ್ನು ಅಗತ್ಯವಿದೆ)
azd version

# Azure ಲಾಗಿನ್ ಪರಿಶೀಲಿಸಿ
azd auth login

# Python ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
python --version  # ಅಥವಾ python3 --version

# OpenAI ಪ್ರವೇಶವನ್ನು ಪರಿಶೀಲಿಸಿ (Azure ಪೋರ್ಟಲ್‌ನಲ್ಲಿ ಪರಿಶೀಲಿಸಿ)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ ಮುಖ್ಯ:** Azure OpenAI ಸೇವೆಗೆ ಅಪ್ಲಿಕೇಶನ್ ಅನುಮೋದನೆ ಅಗತ್ಯವಿದೆ. ನೀವು ಇನ್ನೂ ಅನ್ವಯಿಸದಿದ್ದರೆ, [aka.ms/oai/access](https://aka.ms/oai/access) ಗೆ ಭೇಟಿ ನೀಡಿ. ಅನುಮೋದನೆಗೆ ಸಾಮಾನ್ಯವಾಗಿ 1-2 ವ್ಯವಹಾರ ದಿನಗಳು ಬೇಕಾಗುತ್ತದೆ.

## ⏱️ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಟೈಮ್‌ಲೈನ್

| ಹಂತ | ಅವಧಿ | ಏನಾಗುತ್ತದೆ |
|-------|----------|--------------|
| ಪೂರ್ವಾಪೇಕ್ಷಿತ ಪರಿಶೀಲನೆ | 2-3 ನಿಮಿಷಗಳು | OpenAI ಕೋಟಾ ಲಭ್ಯತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ |
| ಮೂಲಸೌಕರ್ಯ ಡಿಪ್ಲಾಯ್ | 8-12 ನಿಮಿಷಗಳು | OpenAI, Key Vault, ಮಾದರಿಯ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ರಚನೆ |
| ಅಪ್ಲಿಕೇಶನ್ ಕಾನ್ಫಿಗರ್ | 2-3 ನಿಮಿಷಗಳು | ಪರಿಸರ ಮತ್ತು ಅವಲಂಬನೆಗಳನ್ನು ಸೆಟ್ ಅಪ್ ಮಾಡಿ |
| **ಒಟ್ಟು** | **12-18 ನಿಮಿಷಗಳು** | GPT-4 ನೊಂದಿಗೆ ಚಾಟ್ ಮಾಡಲು ಸಿದ್ಧ |

**ಗಮನಿಸಿ:** ಮೊದಲ ಬಾರಿಗೆ OpenAI ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಮಾಡುವುದು ಮಾದರಿಯ ಪ್ರೊವಿಷನಿಂಗ್ ಕಾರಣದಿಂದ ಹೆಚ್ಚು ಸಮಯ ತೆಗೆದುಕೊಳ್ಳಬಹುದು.

## ತ್ವರಿತ ಪ್ರಾರಂಭ

```bash
# ಉದಾಹರಣೆಗೆ ನಾವಿಗೇಟ್ ಮಾಡಿ
cd examples/azure-openai-chat

# ಪರಿಸರವನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd env new myopenai

# ಎಲ್ಲವನ್ನೂ ನಿಯೋಜಿಸಿ (ಅಡಿಸ್ಥಾಪನೆ + ಸಂರಚನೆ)
azd up
# ನಿಮಗೆ ಕೇಳಲಾಗುವುದು:
# 1. Azure ಚಂದಾದಾರಿಕೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ
# 2. OpenAI ಲಭ್ಯತೆ ಇರುವ ಸ್ಥಳವನ್ನು ಆಯ್ಕೆಮಾಡಿ (ಉದಾ., eastus, eastus2, westus)
# 3. ನಿಯೋಜನೆಗಾಗಿ 12-18 ನಿಮಿಷಗಳ ಕಾಲ ಕಾಯಿರಿ

# Python ಅವಲಂಬನೆಗಳನ್ನು ಸ್ಥಾಪಿಸಿ
pip install -r requirements.txt

# ಚಾಟ್ ಪ್ರಾರಂಭಿಸಿ!
python chat.py
```

**ನಿರೀಕ್ಷಿತ ಔಟ್‌ಪುಟ್:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಪರಿಶೀಲನೆ

### ಹಂತ 1: Azure ಸಂಪತ್ತನ್ನು ಪರಿಶೀಲಿಸಿ

```bash
# ನಿಯೋಜಿತ ಸಂಪತ್ತನ್ನು ವೀಕ್ಷಿಸಿ
azd show

# ನಿರೀಕ್ಷಿತ ಔಟ್‌ಪುಟ್ ತೋರಿಸುತ್ತದೆ:
# - OpenAI ಸೇವೆ: (ಸಂಪತ್ತಿನ ಹೆಸರು)
# - ಕೀ ವಾಲ್ಟ್: (ಸಂಪತ್ತಿನ ಹೆಸರು)
# - ನಿಯೋಜನೆ: gpt-4
# - ಸ್ಥಳ: eastus (ಅಥವಾ ನಿಮ್ಮ ಆಯ್ದ ಪ್ರದೇಶ)
```

### ಹಂತ 2: OpenAI API ಪರೀಕ್ಷಿಸಿ

```bash
# ಓಪನ್‌ಎಐ ಎಂಡ್ಪಾಯಿಂಟ್ ಮತ್ತು ಕೀ ಪಡೆಯಿರಿ
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# API ಕರೆ ಪರೀಕ್ಷಿಸಿ
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**ನಿರೀಕ್ಷಿತ ಪ್ರತಿಕ್ರಿಯೆ:**
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

### ಹಂತ 3: Key Vault ಪ್ರವೇಶವನ್ನು ಪರಿಶೀಲಿಸಿ

```bash
# ಕೀ ವಾಲ್ಟ್‌ನಲ್ಲಿ ರಹಸ್ಯಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**ನಿರೀಕ್ಷಿತ ರಹಸ್ಯಗಳು:**
- `openai-api-key`
- `openai-endpoint`

**ಯಶಸ್ವಿ ಮಾನದಂಡಗಳು:**
- ✅ GPT-4 ನೊಂದಿಗೆ OpenAI ಸೇವೆ ಡಿಪ್ಲಾಯ್ ಮಾಡಲಾಗಿದೆ  
- ✅ API ಕರೆ ಮಾನ್ಯವಾದ ಪೂರ್ಣಗೊಳಿಸುವಿಕೆಯನ್ನು ನೀಡುತ್ತದೆ  
- ✅ Key Vault ನಲ್ಲಿ ರಹಸ್ಯಗಳು ಸಂಗ್ರಹಿಸಲಾಗಿದೆ  
- ✅ ಟೋಕನ್ ಬಳಕೆ ಟ್ರ್ಯಾಕಿಂಗ್ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ  

## ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆ

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

## ಅಪ್ಲಿಕೇಶನ್ ವೈಶಿಷ್ಟ್ಯಗಳು

### ಚಾಟ್ ಇಂಟರ್ಫೇಸ್ (`chat.py`)

ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ ಒಳಗೊಂಡಿದೆ:

- **ಸಂವಾದ ಇತಿಹಾಸ** - ಸಂದೇಶಗಳ ನಡುವೆ ಸಂದರ್ಭವನ್ನು ಕಾಪಾಡುತ್ತದೆ  
- **ಟೋಕನ್ ಎಣಿಕೆ** - ಬಳಕೆಯನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡುತ್ತದೆ ಮತ್ತು ವೆಚ್ಚವನ್ನು ಅಂದಾಜಿಸುತ್ತದೆ  
- **ದೋಷ ನಿರ್ವಹಣೆ** - ದರ ಮಿತಿಗಳು ಮತ್ತು API ದೋಷಗಳನ್ನು ಸುಗಮವಾಗಿ ನಿರ್ವಹಿಸುತ್ತದೆ  
- **ವೆಚ್ಚ ಅಂದಾಜನೆ** - ಪ್ರತಿ ಸಂದೇಶಕ್ಕೆ ರಿಯಲ್-ಟೈಮ್ ವೆಚ್ಚ ಲೆಕ್ಕಾಚಾರ  
- **ಸ್ಟ್ರೀಮಿಂಗ್ ಬೆಂಬಲ** - ಐಚ್ಛಿಕ ಸ್ಟ್ರೀಮಿಂಗ್ ಪ್ರತಿಕ್ರಿಯೆಗಳು  

### ಕಮಾಂಡ್‌ಗಳು

ಚಾಟ್ ಮಾಡುವಾಗ, ನೀವು ಬಳಸಬಹುದು:
- `quit` ಅಥವಾ `exit` - ಸೆಷನ್ ಮುಗಿಸಲು  
- `clear` - ಸಂವಾದ ಇತಿಹಾಸವನ್ನು ತೆರವುಗೊಳಿಸಲು  
- `tokens` - ಒಟ್ಟು ಟೋಕನ್ ಬಳಕೆಯನ್ನು ತೋರಿಸಲು  
- `cost` - ಅಂದಾಜಿತ ಒಟ್ಟು ವೆಚ್ಚವನ್ನು ತೋರಿಸಲು  

### ಕಾನ್ಫಿಗರೇಶನ್ (`config.py`)

ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳಿಂದ ಕಾನ್ಫಿಗರೇಶನ್ ಲೋಡ್ ಮಾಡುತ್ತದೆ:
```python
AZURE_OPENAI_ENDPOINT  # ಕೀ ವಾಲ್ಟ್‌ನಿಂದ
AZURE_OPENAI_API_KEY   # ಕೀ ವಾಲ್ಟ್‌ನಿಂದ
AZURE_OPENAI_MODEL     # ಡೀಫಾಲ್ಟ್: gpt-4
AZURE_OPENAI_MAX_TOKENS # ಡೀಫಾಲ್ಟ್: 800
```

## ಬಳಕೆ ಉದಾಹರಣೆಗಳು

### ಮೂಲ ಚಾಟ್

```bash
python chat.py
```

### ಕಸ್ಟಮ್ ಮಾದರಿಯೊಂದಿಗೆ ಚಾಟ್

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### ಸ್ಟ್ರೀಮಿಂಗ್ ಚಾಟ್

```bash
python chat.py --stream
```

### ಉದಾಹರಣೆ ಸಂವಾದ

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

## ವೆಚ್ಚ ನಿರ್ವಹಣೆ

### ಟೋಕನ್ ಬೆಲೆ (GPT-4)

| ಮಾದರಿ | ಇನ್‌ಪುಟ್ (ಪ್ರತಿ 1K ಟೋಕನ್‌ಗಳಿಗೆ) | ಔಟ್‌ಪುಟ್ (ಪ್ರತಿ 1K ಟೋಕನ್‌ಗಳಿಗೆ) |
|-------|----------------------|------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### ಅಂದಾಜಿತ ತಿಂಗಳ ವೆಚ್ಚಗಳು

ಬಳಕೆ ಮಾದರಿಗಳ ಆಧಾರದ ಮೇಲೆ:

| ಬಳಕೆ ಮಟ್ಟ | ಸಂದೇಶಗಳು/ದಿನ | ಟೋಕನ್‌ಗಳು/ದಿನ | ತಿಂಗಳ ವೆಚ್ಚ |
|-------------|--------------|------------|--------------|
| **ಲಘು** | 20 ಸಂದೇಶಗಳು | 3,000 ಟೋಕನ್‌ಗಳು | $3-5 |
| **ಮಧ್ಯಮ** | 100 ಸಂದೇಶಗಳು | 15,000 ಟೋಕನ್‌ಗಳು | $15-25 |
| **ಭಾರಿ** | 500 ಸಂದೇಶಗಳು | 75,000 ಟೋಕನ್‌ಗಳು | $75-125 |

**ಮೂಲಸೌಕರ್ಯ ಮೂಲ ವೆಚ್ಚ:** $1-2/ತಿಂಗಳು (Key Vault + ಕನಿಷ್ಠ ಕಂಪ್ಯೂಟ್)

### ವೆಚ್ಚ ಆಪ್ಟಿಮೈಸೇಶನ್ ಸಲಹೆಗಳು

```bash
# 1. ಸರಳ ಕಾರ್ಯಗಳಿಗೆ GPT-3.5-Turbo ಅನ್ನು ಬಳಸಿರಿ (20x ಕಡಿಮೆ ವೆಚ್ಚ)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. ಚಿಕ್ಕ ಉತ್ತರಗಳಿಗೆ ಗರಿಷ್ಠ ಟೋಕನ್‌ಗಳನ್ನು ಕಡಿಮೆ ಮಾಡಿ
export AZURE_OPENAI_MAX_TOKENS=400

# 3. ಟೋಕನ್ ಬಳಕೆಯನ್ನು ನಿಗಾ ಮಾಡಿ
python chat.py --show-tokens

# 4. ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಗಳನ್ನು ಹೊಂದಿಸಿ
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## ನಿಗಾ

### ಟೋಕನ್ ಬಳಕೆಯನ್ನು ವೀಕ್ಷಿಸಿ

```bash
# ಆಜೂರ್ ಪೋರ್ಟಲ್‌ನಲ್ಲಿ:
# ಓಪನ್‌ಎಐ ಸಂಪತ್ತು → ಮೆಟ್ರಿಕ್ಸ್ → "ಟೋಕನ್ ಟ್ರಾನ್ಸಾಕ್ಷನ್" ಆಯ್ಕೆಮಾಡಿ

# ಅಥವಾ ಆಜೂರ್ CLI ಮೂಲಕ:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### API ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ

```bash
# ಸ್ಟ್ರೀಮ್ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ ಲಾಗ್‌ಗಳು
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# ಕ್ವೆರಿ ಲಾಗ್‌ಗಳು
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## ತೊಂದರೆ ಪರಿಹಾರ

### ಸಮಸ್ಯೆ: "ಪ್ರವೇಶ ನಿರಾಕರಿಸಲಾಗಿದೆ" ದೋಷ

**ಲಕ್ಷಣಗಳು:** API ಅನ್ನು ಕರೆ ಮಾಡುವಾಗ 403 ನಿಷೇಧಿತ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. OpenAI ಪ್ರವೇಶವನ್ನು ಅನುಮೋದಿಸಲಾಗಿದೆ ಎಂದು ಪರಿಶೀಲಿಸಿ
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. API ಕೀ ಸರಿಯಾಗಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
azd env get-value AZURE_OPENAI_API_KEY

# 3. ಎಂಡ್ಪಾಯಿಂಟ್ URL ಸ್ವರೂಪವನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get-value AZURE_OPENAI_ENDPOINT
# ಇದಿರಬೇಕು: https://[name].openai.azure.com/
```

### ಸಮಸ್ಯೆ: "ದರ ಮಿತಿ ಮೀರಿಸಲಾಗಿದೆ"

**ಲಕ್ಷಣಗಳು:** 429 ಹೆಚ್ಚು ವಿನಂತಿಗಳು

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಪ್ರಸ್ತುತ ಕೋಟಾವನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. ಕೋಟಾ ಹೆಚ್ಚಳವನ್ನು ವಿನಂತಿಸಿ (ಅಗತ್ಯವಿದ್ದರೆ)
# Azure ಪೋರ್ಟಲ್‌ಗೆ ಹೋಗಿ → OpenAI ಸಂಪತ್ತು → ಕೋಟಾಗಳು → ಹೆಚ್ಚಳವನ್ನು ವಿನಂತಿಸಿ

# 3. ಪುನಃ ಪ್ರಯತ್ನಿಸುವ ತರ್ಕವನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ (ಈಗಾಗಲೇ chat.py ನಲ್ಲಿ ಇದೆ)
# ಅಪ್ಲಿಕೇಶನ್ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಘಾತಾಂಕ ಹಿಂಜರಿತದೊಂದಿಗೆ ಪುನಃ ಪ್ರಯತ್ನಿಸುತ್ತದೆ
```

### ಸಮಸ್ಯೆ: "ಮಾದರಿ ಕಂಡುಬಂದಿಲ್ಲ"

**ಲಕ್ಷಣಗಳು:** ಡಿಪ್ಲಾಯ್ಮೆಂಟ್‌ಗೆ 404 ದೋಷ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಲಭ್ಯವಿರುವ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್‌ಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. ಪರಿಸರದಲ್ಲಿ ಮಾದರಿಯ ಹೆಸರನ್ನು ಪರಿಶೀಲಿಸಿ
echo $AZURE_OPENAI_MODEL

# 3. ಸರಿಯಾದ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಹೆಸರಿಗೆ ನವೀಕರಿಸಿ
export AZURE_OPENAI_MODEL=gpt-4  # ಅಥವಾ gpt-35-turbo
```

### ಸಮಸ್ಯೆ: ಹೆಚ್ಚಿನ ವಿಳಂಬ

**ಲಕ್ಷಣಗಳು:** ಪ್ರತಿಕ್ರಿಯೆ ಸಮಯ (>5 ಸೆಕೆಂಡುಗಳು) ನಿಧಾನವಾಗಿದೆ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಪ್ರಾದೇಶಿಕ ವಿಳಂಬವನ್ನು ಪರಿಶೀಲಿಸಿ
# ಬಳಕೆದಾರರಿಗೆ ಹತ್ತಿರದ ಪ್ರದೇಶಕ್ಕೆ ನಿಯೋಜಿಸಿ

# 2. ವೇಗವಾದ ಪ್ರತಿಕ್ರಿಯೆಗಳಿಗೆ ಗರಿಷ್ಠ ಟೋಕನ್‌ಗಳನ್ನು ಕಡಿಮೆ ಮಾಡಿ
export AZURE_OPENAI_MAX_TOKENS=400

# 3. ಉತ್ತಮ ಬಳಕೆದಾರ ಅನುಭವಕ್ಕಾಗಿ ಸ್ಟ್ರೀಮಿಂಗ್ ಬಳಸಿ
python chat.py --stream
```

## ಸುರಕ್ಷತಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

### 1. API ಕೀಗಳನ್ನು ರಕ್ಷಿಸಿ

```bash
# ಕೀಗಳನ್ನು ಮೂಲ ನಿಯಂತ್ರಣಕ್ಕೆ ಕಳುಹಿಸಬೇಡಿ
# ಕೀ ವಾಲ್ಟ್ ಬಳಸಿ (ಈಗಾಗಲೇ ಸಂರಚಿಸಲಾಗಿದೆ)

# ಕೀಗಳನ್ನು ನಿಯಮಿತವಾಗಿ ತಿರುಗಿಸಿ
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. ವಿಷಯ ಶೋಧನೆ ಅನುಷ್ಠಾನಗೊಳಿಸಿ

```python
# Azure OpenAI ಒಳಗೊಂಡಿದೆ ಅಂತರ್ನಿರ್ಮಿತ ವಿಷಯ ಶೋಧನೆ
# Azure ಪೋರ್ಟಲ್‌ನಲ್ಲಿ ಸಂರಚಿಸಿ:
# OpenAI ಸಂಪತ್ತು → ವಿಷಯ ಶೋಧಕಗಳು → ಕಸ್ಟಮ್ ಶೋಧಕವನ್ನು ರಚಿಸಿ

# ವರ್ಗಗಳು: ದ್ವೇಷ, ಲೈಂಗಿಕ, ಹಿಂಸಾಚಾರ, ಸ್ವಯಂ-ಹಾನಿ
# ಮಟ್ಟಗಳು: ಕಡಿಮೆ, ಮಧ್ಯಮ, ಹೆಚ್ಚಿನ ಶೋಧನೆ
```

### 3. ನಿರ್ವಹಿತ ಗುರುತನ್ನು ಬಳಸಿ (ಉತ್ಪಾದನೆ)

```bash
# ಉತ್ಪಾದನಾ ನಿಯೋಜನೆಗಳಿಗೆ, ನಿರ್ವಹಿತ ಗುರುತನ್ನು ಬಳಸಿ
# API ಕೀಗಳ ಬದಲು (Azure ನಲ್ಲಿ ಅಪ್ಲಿಕೇಶನ್ ಹೋಸ್ಟಿಂಗ್ ಅಗತ್ಯವಿದೆ)

# infra/openai.bicep ಅನ್ನು ನವೀಕರಿಸಿ:
# identity: { type: 'SystemAssigned' }
```

## ಅಭಿವೃದ್ಧಿ

### ಸ್ಥಳೀಯವಾಗಿ ಚಲಾಯಿಸಿ

```bash
# ಅವಶ್ಯಕತೆಗಳನ್ನು ಸ್ಥಾಪಿಸಿ
pip install -r src/requirements.txt

# ಪರಿಸರ ಚರಗಳು ಹೊಂದಿಸಿ
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# ಅಪ್ಲಿಕೇಶನ್ ಚಲಾಯಿಸಿ
python src/chat.py
```

### ಪರೀಕ್ಷೆಗಳನ್ನು ಚಲಾಯಿಸಿ

```bash
# ಪರೀಕ್ಷಾ ಅವಲಂಬಿತತೆಗಳನ್ನು ಸ್ಥಾಪಿಸಿ
pip install pytest pytest-cov

# ಪರೀಕ್ಷೆಗಳನ್ನು ನಡೆಸಿ
pytest tests/ -v

# ಕವರ್‌ೇಜ್‌ನೊಂದಿಗೆ
pytest tests/ --cov=src --cov-report=html
```

### ಮಾದರಿಯ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಅನ್ನು ನವೀಕರಿಸಿ

```bash
# ವಿಭಿನ್ನ ಮಾದರಿ ಆವೃತ್ತಿಯನ್ನು ನಿಯೋಜಿಸಿ
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

## ಶುದ್ಧೀಕರಿಸಿ

```bash
# ಎಲ್ಲಾ ಆಜೂರ್ ಸಂಪತ್ತನ್ನು ಅಳಿಸಿ
azd down --force --purge

# ಇದು ಅಳಿಸುತ್ತದೆ:
# - ಓಪನ್‌ಎಐ ಸೇವೆ
# - ಕೀ ವಾಲ್ಟ್ (90 ದಿನಗಳ ಸಾಫ್ಟ್ ಅಳಿಸುವಿಕೆಯೊಂದಿಗೆ)
# - ಸಂಪತ್ತು ಗುಂಪು
# - ಎಲ್ಲಾ ನಿಯೋಜನೆಗಳು ಮತ್ತು ಸಂರಚನೆಗಳು
```

## ಮುಂದಿನ ಹಂತಗಳು

### ಈ ಉದಾಹರಣೆಯನ್ನು ವಿಸ್ತರಿಸಿ

1. **ವೆಬ್ ಇಂಟರ್ಫೇಸ್ ಸೇರಿಸಿ** - React/Vue ಫ್ರಂಟ್‌ಎಂಡ್ ನಿರ್ಮಿಸಿ  
   ```bash
   # azure.yaml ಗೆ ಫ್ರಂಟ್ ಎಂಡ್ ಸೇವೆಯನ್ನು ಸೇರಿಸಿ
   # Azure Static Web Apps ಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
   ```

2. **RAG ಅನುಷ್ಠಾನಗೊಳಿಸಿ** - Azure AI Search ನೊಂದಿಗೆ ಡಾಕ್ಯುಮೆಂಟ್ ಶೋಧನೆ ಸೇರಿಸಿ  
   ```python
   # ಆಜೂರ್ ಕಾಗ್ನಿಟಿವ್ ಸರ್ಚ್ ಅನ್ನು ಸಂಯೋಜಿಸಿ
   # ಡಾಕ್ಯುಮೆಂಟ್‌ಗಳನ್ನು ಅಪ್ಲೋಡ್ ಮಾಡಿ ಮತ್ತು ವೆಕ್ಟರ್ ಸೂಚಿಯನ್ನು ರಚಿಸಿ
   ```

3. **ಫಂಕ್ಷನ್ ಕಾಲಿಂಗ್ ಸೇರಿಸಿ** - ಸಾಧನ ಬಳಕೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ  
   ```python
   # ಚಾಟ್.py ನಲ್ಲಿ ಕಾರ್ಯಗಳನ್ನು ವ್ಯಾಖ್ಯಾನಿಸಿ
   # GPT-4 ಅನ್ನು ಬಾಹ್ಯ APIಗಳನ್ನು ಕರೆ ಮಾಡಲು ಅನುಮತಿಸಿ
   ```

4. **ಬಹು-ಮಾದರಿ ಬೆಂಬಲ** - ಅನೇಕ ಮಾದರಿಗಳನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಿ  
   ```bash
   # gpt-35-turbo, ಎಂಬೆಡಿಂಗ್ಸ್ ಮಾದರಿಗಳನ್ನು ಸೇರಿಸಿ
   # ಮಾದರಿ ಮಾರ್ಗಸೂಚಿ ತರ್ಕವನ್ನು ಜಾರಿಗೆ ತರುವುದಾಗಿ
   ```

### ಸಂಬಂಧಿತ ಉದಾಹರಣೆಗಳು

- **[ರಿಟೇಲ್ ಮಲ್ಟಿ-ಏಜೆಂಟ್](../retail-scenario.md)** - ಉನ್ನತ ಮಲ್ಟಿ-ಏಜೆಂಟ್ ಆರ್ಕಿಟೆಕ್ಚರ್  
- **[ಡೇಟಾಬೇಸ್ ಅಪ್ಲಿಕೇಶನ್](../../../../examples/database-app)** - ಶಾಶ್ವತ ಸಂಗ್ರಹಣೆ ಸೇರಿಸಿ  
- **[ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು](../../../../examples/container-app)** - ಕಂಟೈನರ್ ಸೇವೆಯಾಗಿ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ  

### ಕಲಿಕೆಯ ಸಂಪತ್ತುಗಳು

- 📚 [AZD ಪ್ರಾರಂಭಿಕ ಕೋರ್ಸ್](../../README.md) - ಮುಖ್ಯ ಕೋರ್ಸ್ ಹೋಮ್  
- 📚 [Azure OpenAI ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/ai-services/openai/) - ಅಧಿಕೃತ ಡಾಕ್ಯುಮೆಂಟ್  
- 📚 [OpenAI API ರೆಫರೆನ್ಸ್](https://platform.openai.com/docs/api-reference) - API ವಿವರಗಳು  
- 📚 [ಜವಾಬ್ದಾರಿಯುತ AI](https://www.microsoft.com/ai/responsible-ai) - ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು  

## ಹೆಚ್ಚುವರಿ ಸಂಪತ್ತುಗಳು

### ಡಾಕ್ಯುಮೆಂಟೇಶನ್
- **[Azure OpenAI ಸೇವೆ](https://learn.microsoft.com/azure/ai-services/openai/)** - ಸಂಪೂರ್ಣ ಮಾರ್ಗದರ್ಶಿ  
- **[GPT-4 ಮಾದರಿಗಳು](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - ಮಾದರಿಯ ಸಾಮರ್ಥ್ಯಗಳು  
- **[ವಿಷಯ ಶೋಧನೆ](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - ಸುರಕ್ಷತಾ ವೈಶಿಷ್ಟ್ಯಗಳು  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd ರೆಫರೆನ್ಸ್  

### ಟ್ಯುಟೋರಿಯಲ್‌ಗಳು
- **[OpenAI ತ್ವರಿತ ಪ್ರಾರಂಭ](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - ಮೊದಲ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್  
- **[ಚಾಟ್ ಪೂರ್ಣಗೊಳಿಸುವಿಕೆ](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿರ್ಮಿಸುವುದು  
- **[ಫಂಕ್ಷನ್ ಕಾಲಿಂಗ್](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - ಉನ್ನತ ವೈಶಿಷ್ಟ್ಯಗಳು  

### ಸಾಧನಗಳು
- **[Azure OpenAI ಸ್ಟುಡಿಯೋ](https://oai.azure.com/)** - ವೆಬ್ ಆಧಾರಿತ ಪ್ಲೇಗ್ರೌಂಡ್  
- **[ಪ್ರಾಂಪ್ಟ್ ಎಂಜಿನಿಯರಿಂಗ್ ಮಾರ್ಗದರ್ಶಿ](https://platform.openai.com/docs/guides/prompt-engineering)** - ಉತ್ತಮ ಪ್ರಾಂಪ್ಟ್‌ಗಳನ್ನು ಬರೆಯುವುದು  
- **[ಟೋಕನ್ ಕ್ಯಾಲ್ಕುಲೇಟರ್](https://platform.openai.com/tokenizer)** - ಟೋಕನ್ ಬಳಕೆಯನ್ನು ಅಂದಾಜಿಸಲು  

### ಸಮುದಾಯ
- **[Azure AI ಡಿಸ್ಕಾರ್ಡ್](https://discord.gg/azure)** - ಸಮುದಾಯದಿಂದ ಸಹಾಯ ಪಡೆಯಿರಿ  
- **[GitHub ಚರ್ಚೆಗಳು](https://github.com/Azure-Samples/openai/discussions)** - ಪ್ರಶ್ನೋತ್ತರ ವೇದಿಕೆ  
- **[Azure ಬ್ಲಾಗ್](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - ಇತ್ತೀಚಿನ ನವೀಕರಣಗಳು  

---

**🎉 ಯಶಸ್ಸು!** ನೀವು Azure OpenAI ಅನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಿ ಕಾರ್ಯನಿರ್ವಹಿಸುವ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿರ್ಮಿಸಿದ್ದೀರಿ. GPT-4 ನ ಸಾಮರ್ಥ್ಯಗಳನ್ನು ಅನ್ವೇಷಿಸಲು ಪ್ರಾರಂಭಿಸಿ ಮತ್ತು ವಿಭಿನ್ನ ಪ್ರಾಂಪ್ಟ್‌ಗಳು ಮತ್ತು ಬಳಕೆ ಪ್ರಕರಣಗಳನ್ನು ಪ್ರಯೋಗಿಸಿ.

**ಪ್ರಶ್ನೆಗಳಿದೆಯೆ?** [ಒಂದು ಸಮಸ್ಯೆಯನ್ನು ತೆರೆಯಿರಿ](https://github.com/microsoft/AZD-for-beginners/issues) ಅಥವಾ [FAQ](../../resources/faq.md) ಅನ್ನು ಪರಿಶೀಲಿಸಿ.

**ವೆಚ್ಚ ಎಚ್ಚರಿಕೆ:** ಪರೀಕ್ಷೆ ಮುಗಿದ ನಂತರ `azd down` ಅನ್ನು ಚಲಾಯಿಸಲು ಮರೆತಬೇಡಿ, ನಿರಂತರ ಶುಲ್ಕಗಳನ್ನು ($50-100/ತಿಂಗಳು ಸಕ್ರಿಯ ಬಳಕೆಗೆ) ತಪ್ಪಿಸಲು.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸಮಾಕ್ಷ್ಯತೆ**:  
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಮಾಕ್ಷ್ಯತೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಮಹತ್ವದ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->