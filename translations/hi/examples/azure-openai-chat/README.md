# Microsoft Foundry Models चैट एप्लिकेशन

**सीखने का मार्ग:** Intermediate ⭐⭐ | **समय:** 35-45 minutes | **लागत:** $50-200/month

A complete Microsoft Foundry Models chat application deployed using Azure Developer CLI (azd). This example demonstrates gpt-4.1 deployment, secure API access, and a simple chat interface.

## 🎯 आप क्या सीखेंगे

- Microsoft Foundry Models Service को gpt-4.1 मॉडल के साथ तैनात करना
- Key Vault के साथ OpenAI API कुंजियों को सुरक्षित करना
- Python के साथ एक सरल चैट इंटरफ़ेस बनाना
- टोकन उपयोग और लागत की निगरानी करना
- दर-सीमा और त्रुटि हैंडलिंग लागू करना

## 📦 इसमें क्या शामिल है

✅ **Microsoft Foundry Models Service** - gpt-4.1 model deployment  
✅ **Python Chat App** - Simple command-line chat interface  
✅ **Key Vault Integration** - Secure API key storage  
✅ **ARM Templates** - Complete infrastructure as code  
✅ **Cost Monitoring** - Token usage tracking  
✅ **Rate Limiting** - Prevent quota exhaustion  

## Architecture

```mermaid
graph TD
    App[Python चैट एप्लिकेशन<br/>लोकल/क्लाउड<br/>कमांड-लाइन इंटरफ़ेस<br/>वार्तालाप इतिहास<br/>टोकन उपयोग ट्रैकिंग] -- "HTTPS (API कुंजी)" --> Foundry[Microsoft Foundry मॉडल सेवा<br/>gpt-4.1 मॉडल<br/>20K टोकन/मिन क्षमता<br/>मल्टी-रीजन फेलओवर]
    Foundry --> KV[Azure कुंजी वॉल्ट<br/>OpenAI API कुंजी<br/>एंडपॉइंट URL]
    Foundry -. प्रबंधित पहचान .-> KV
```
## पूर्वापेक्षाएँ

### आवश्यक

- **Azure Developer CLI (azd)** - [इंस्टॉलेशन गाइड](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** with OpenAI access - [एक्सेस के लिए अनुरोध](https://aka.ms/oai/access)
- **Python 3.9+** - [Python स्थापित करें](https://www.python.org/downloads/)

### आवश्यकताओं की जाँच करें

```bash
# azd संस्करण जांचें (आवश्यक 1.5.0 या उच्चतर)
azd version

# Azure लॉगिन सत्यापित करें
azd auth login

# Python संस्करण जांचें
python --version  # या python3 --version

# OpenAI एक्सेस सत्यापित करें (Azure पोर्टल में जांचें)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ महत्वपूर्ण:** Microsoft Foundry Models के लिए आवेदन स्वीकृति आवश्यक है। यदि आपने आवेदन नहीं किया है, तो जाएँ [aka.ms/oai/access](https://aka.ms/oai/access). स्वीकृति आमतौर पर 1-2 कार्य दिवस लेती है।

## ⏱️ परिनियोजन समयरेखा

| चरण | अवधि | क्या होता है |
|-------|----------|--------------|
| पूर्वापेक्षाओं की जाँच | 2-3 minutes | OpenAI कोटा उपलब्धता की जाँच करें |
| इन्फ्रास्ट्रक्चर तैनात करें | 8-12 minutes | OpenAI, Key Vault, मॉडल तैनाती बनाएँ |
| एप्लिकेशन कॉन्फ़िगर करें | 2-3 minutes | पर्यावरण और निर्भरता सेट करें |
| **कुल** | **12-18 minutes** | gpt-4.1 के साथ चैट करने के लिए तैयार |

**नोट:** पहली बार OpenAI तैनाती मॉडल प्राविजनिंग के कारण अधिक समय ले सकती है।

## त्वरित आरंभ

```bash
# उदाहरण पर जाएँ
cd examples/azure-openai-chat

# पर्यावरण आरंभ करें
azd env new myopenai

# सब कुछ तैनात करें (बुनियादी ढाँचा + कॉन्फ़िगरेशन)
azd up
# आपसे निम्न करने को कहा जाएगा:
# 1. Azure सदस्यता चुनें
# 2. OpenAI उपलब्धता वाला स्थान चुनें (उदा., eastus, eastus2, westus)
# 3. तैनाती के लिए 12-18 मिनट प्रतीक्षा करें

# Python निर्भरताएँ स्थापित करें
pip install -r requirements.txt

# चैट शुरू करें!
python chat.py
```

**अपेक्षित आउटपुट:**
```
🤖 Microsoft Foundry Models Chat Application
Connected to: gpt-4.1 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Microsoft Foundry Models.
Assistant: Microsoft Foundry Models Service provides REST API access to OpenAI's powerful language models including gpt-4.1, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ परिनियोजन सत्यापित करें

### चरण 1: Azure संसाधनों की जाँच करें

```bash
# डिप्लॉय किए गए संसाधनों को देखें
azd show

# अपेक्षित आउटपुट दिखाता है:
# - OpenAI सेवा: (संसाधन का नाम)
# - की वॉल्ट: (संसाधन का नाम)
# - डिप्लॉयमेंट: gpt-4.1
# - स्थान: eastus (या आपके चयनित क्षेत्र)
```

### चरण 2: OpenAI API का परीक्षण करें

```bash
# OpenAI एंडपॉइंट और कुंजी प्राप्त करें
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# API कॉल का परीक्षण करें
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4.1/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**अपेक्षित उत्तर:**
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

### चरण 3: Key Vault एक्सेस सत्यापित करें

```bash
# Key Vault में सीक्रेट्स की सूची बनाएं
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**अपेक्षित सीक्रेट्स:**
- `openai-api-key`
- `openai-endpoint`

**सफलता मानदंड:**
- ✅ OpenAI सेवा gpt-4.1 के साथ तैनात
- ✅ API कॉल मान्य उत्तर लौटाती है
- ✅ सीक्रेट्स Key Vault में संग्रहीत हैं
- ✅ टोकन उपयोग ट्रैकिंग काम करती है

## परियोजना की संरचना

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

## एप्लिकेशन सुविधाएँ

### चैट इंटरफ़ेस (`chat.py`)

चैट एप्लिकेशन में शामिल हैं:

- **वार्तालाप इतिहास** - संदेशों के बीच संदर्भ बनाए रखता है
- **टोकन गिनती** - उपयोग को ट्रैक करता है और लागत का अनुमान लगाता है
- **त्रुटि हैंडलिंग** - रेट लिमिट्स और API त्रुटियों को सुचारू रूप से संभालता है
- **लागत अनुमान** - प्रत्येक संदेश के लिए वास्तविक समय लागत गणना
- **स्ट्रीमिंग समर्थन** - वैकल्पिक स्ट्रीमिंग प्रतिक्रियाएँ

### कमांड

चैट करते समय, आप उपयोग कर सकते हैं:
- `quit` or `exit` - सत्र समाप्त करें
- `clear` - वार्तालाप इतिहास साफ़ करें
- `tokens` - कुल टोकन उपयोग दिखाएँ
- `cost` - अनुमानित कुल लागत दिखाएँ

### विन्यास (`config.py`)

पर्यावरण चर से कॉन्फ़िगरेशन लोड करता है:
```python
AZURE_OPENAI_ENDPOINT  # Key Vault से
AZURE_OPENAI_API_KEY   # Key Vault से
AZURE_OPENAI_MODEL     # डिफ़ॉल्ट: gpt-4.1
AZURE_OPENAI_MAX_TOKENS # डिफ़ॉल्ट: 800
```

## उपयोग के उदाहरण

### बुनियादी चैट

```bash
python chat.py
```

### कस्टम मॉडल के साथ चैट

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### स्ट्रीमिंग के साथ चैट

```bash
python chat.py --stream
```

### उदाहरण वार्तालाप

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

## लागत प्रबंधन

### टोकन मूल्य निर्धारण (gpt-4.1)

| मॉडल | इनपुट (प्रति 1K टोकन) | आउटपुट (प्रति 1K टोकन) |
|-------|----------------------|------------------------|
| gpt-4.1 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### अनुमानित मासिक लागत

उपयोग पैटर्न के आधार पर:

| उपयोग स्तर | संदेश/दिन | टोकन/दिन | मासिक लागत |
|-------------|--------------|------------|--------------|
| **हल्का** | 20 messages | 3,000 tokens | $3-5 |
| **मध्यम** | 100 messages | 15,000 tokens | $15-25 |
| **भारी** | 500 messages | 75,000 tokens | $75-125 |

**बेस इन्फ्रास्ट्रक्चर लागत:** $1-2/month (Key Vault + minimal compute)

### लागत अनुकूलन सुझाव

```bash
# 1. सरल कार्यों के लिए GPT-3.5-Turbo का उपयोग करें (20x सस्ता)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. छोटे उत्तरों के लिए अधिकतम टोकन कम करें
export AZURE_OPENAI_MAX_TOKENS=400

# 3. टोकन उपयोग की निगरानी करें
python chat.py --show-tokens

# 4. बजट अलर्ट सेट करें
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## निगरानी

### टोकन उपयोग देखें

```bash
# Azure पोर्टल में:
# OpenAI संसाधन → मेट्रिक्स → "टोकन लेन-देन" चुनें

# या Azure CLI के माध्यम से:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### API लॉग देखें

```bash
# स्ट्रीम डायग्नोस्टिक लॉग्स
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# क्वेरी लॉग्स
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## समस्या निवारण

### समस्या: "Access Denied" त्रुटि

**लक्षण:** API कॉल करते समय 403 Forbidden

**समाधान:**
```bash
# 1. सत्यापित करें कि OpenAI पहुँच अनुमोदित है
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. जाँचें कि API कुंजी सही है
azd env get-value AZURE_OPENAI_API_KEY

# 3. एंडपॉइंट URL के प्रारूप को सत्यापित करें
azd env get-value AZURE_OPENAI_ENDPOINT
# होना चाहिए: https://[name].openai.azure.com/
```

### समस्या: "Rate Limit Exceeded"

**लक्षण:** 429 Too Many Requests

**समाधान:**
```bash
# 1. वर्तमान कोटा की जाँच करें
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4.1

# 2. कोटा वृद्धि का अनुरोध करें (यदि आवश्यक हो)
# Azure पोर्टल पर जाएँ → OpenAI संसाधन → कोटे → वृद्धि का अनुरोध

# 3. पुनः प्रयास लॉजिक लागू करें (पहले से chat.py में है)
# एप्लिकेशन स्वचालित रूप से घातीय बैकऑफ के साथ पुनः प्रयास करता है
```

### समस्या: "Model Not Found"

**लक्षण:** तैनाती के लिए 404 त्रुटि

**समाधान:**
```bash
# 1. उपलब्ध डिप्लॉयमेंट सूचीबद्ध करें
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. पर्यावरण में मॉडल नाम सत्यापित करें
echo $AZURE_OPENAI_MODEL

# 3. सही डिप्लॉयमेंट नाम में अपडेट करें
export AZURE_OPENAI_MODEL=gpt-4.1  # या gpt-35-turbo
```

### समस्या: उच्च विलंबता

**लक्षण:** धीमे प्रतिक्रिया समय (>5 seconds)

**समाधान:**
```bash
# 1. क्षेत्रीय लेटेंसी की जाँच करें
# उपयोगकर्ताओं के सबसे निकट क्षेत्र में तैनात करें

# 2. तेज़ प्रतिक्रियाओं के लिए max_tokens कम करें
export AZURE_OPENAI_MAX_TOKENS=400

# 3. बेहतर उपयोगकर्ता अनुभव के लिए स्ट्रीमिंग का उपयोग करें
python chat.py --stream
```

## सुरक्षा सर्वोत्तम प्रथाएँ

### 1. API कुंजियों की सुरक्षा करें

```bash
# कभी भी कुंजियाँ स्रोत नियंत्रण में कमिट न करें
# Key Vault का उपयोग करें (पहले से कॉन्फ़िगर है)

# कुंजियों को नियमित रूप से बदलें
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. सामग्री फ़िल्टरिंग लागू करें

```python
# Microsoft Foundry Models में अंतर्निर्मित सामग्री फ़िल्टरिंग शामिल है
# Azure Portal में कॉन्फ़िगर करें:
# OpenAI संसाधन → सामग्री फ़िल्टर → कस्टम फ़िल्टर बनाएं

# श्रेणियाँ: घृणा, यौन, हिंसा, आत्म-हानि
# स्तर: कम, मध्यम, उच्च फ़िल्टरिंग
```

### 3. Managed Identity का उपयोग करें (प्रोडक्शन)

```bash
# उत्पादन तैनाती के लिए, प्रबंधित पहचान का उपयोग करें
# API कुंजियों के बजाय (Azure पर ऐप होस्टिंग आवश्यक है)

# infra/openai.bicep में निम्न शामिल करें:
# identity: { type: 'SystemAssigned' }
```

## विकास

### स्थानीय रूप से चलाएँ

```bash
# निर्भरताएँ स्थापित करें
pip install -r src/requirements.txt

# पर्यावरण चर सेट करें
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4.1"

# एप्लिकेशन चलाएँ
python src/chat.py
```

### परीक्षण चलाएँ

```bash
# टेस्ट की निर्भरताएँ स्थापित करें
pip install pytest pytest-cov

# टेस्ट चलाएँ
pytest tests/ -v

# कवरेज के साथ
pytest tests/ --cov=src --cov-report=html
```

### मॉडल तैनाती अपडेट करें

```bash
# किसी अलग मॉडल संस्करण को तैनात करें
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

## क्लीन अप

```bash
# सभी Azure संसाधनों को हटाएं
azd down --force --purge

# यह हटाता है:
# - OpenAI सेवा
# - Key Vault (90 दिनों की सॉफ्ट-डिलीट के साथ)
# - रिसोर्स ग्रुप
# - सभी डिप्लॉयमेंट और कॉन्फ़िगरेशन
```

## अगले कदम

### इस उदाहरण का विस्तार करें

1. **वेब इंटरफ़ेस जोड़ें** - React/Vue फ्रंटएंड बनाएं
   ```bash
   # azure.yaml में फ्रंटएंड सेवा जोड़ें
   # Azure Static Web Apps पर तैनात करें
   ```

2. **RAG लागू करें** - Azure AI Search के साथ दस्तावेज़ खोज जोड़ें
   ```python
   # Azure Cognitive Search को एकीकृत करें
   # दस्तावेज़ अपलोड करें और वेक्टर इंडेक्स बनाएं
   ```

3. **फंक्शन कॉलिंग जोड़ें** - टूल उपयोग सक्षम करें
   ```python
   # chat.py में फ़ंक्शन परिभाषित करें
   # gpt-4.1 को बाहरी API कॉल करने दें
   ```

4. **मल्टी-मॉडल समर्थन** - कई मॉडल तैनात करें
   ```bash
   # gpt-35-turbo, एम्बेडिंग मॉडल जोड़ें
   # मॉडल रूटिंग लॉजिक लागू करें
   ```

### संबंधित उदाहरण

- **[रिटेल मल्टी-एजेंट](../retail-scenario.md)** - उन्नत मल्टी-एजेंट आर्किटेक्चर
- **[डेटाबेस ऐप](../../../../examples/database-app)** - स्थायी स्टोरेज जोड़ें
- **[कंटेनर ऐप्स](../../../../examples/container-app)** - कंटेनरीकृत सेवा के रूप में तैनात करें

### सीखने के संसाधन

- 📚 [AZD शुरुआती के लिए पाठ्यक्रम](../../README.md) - मुख्य पाठ्यक्रम पृष्ठ
- 📚 [Microsoft Foundry Models Documentation](https://learn.microsoft.com/azure/ai-services/openai/) - आधिकारिक दस्तावेज़
- 📚 [OpenAI API Reference](https://platform.openai.com/docs/api-reference) - API विवरण
- 📚 [Responsible AI](https://www.microsoft.com/ai/responsible-ai) - सर्वोत्तम प्रथाएँ

## अतिरिक्त संसाधन

### दस्तावेज़
- **[Microsoft Foundry Models Service](https://learn.microsoft.com/azure/ai-services/openai/)** - पूर्ण मार्गदर्शिका
- **[gpt-4.1 Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - मॉडल क्षमताएँ
- **[Content Filtering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - सुरक्षा विशेषताएँ
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd संदर्भ

### ट्यूटोरियल
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - पहली तैनाती
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - चैट ऐप बनाना
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - उन्नत विशेषताएँ

### उपकरण
- **[Microsoft Foundry Models Studio](https://oai.azure.com/)** - वेब-आधारित प्लेग्राउंड
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - बेहतर प्रॉम्प्ट लिखना
- **[Token Calculator](https://platform.openai.com/tokenizer)** - टोकन उपयोग का अनुमान

### समुदाय
- **[Azure AI Discord](https://discord.gg/azure)** - समुदाय से मदद प्राप्त करें
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - प्रश्नोत्तर मंच
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - नवीनतम अपडेट

---

**🎉 सफलता!** आपने Microsoft Foundry Models तैनात कर लिया है और एक कार्यशील चैट एप्लिकेशन बनाया है। gpt-4.1 की क्षमताओं का अन्वेषण शुरू करें और विभिन्न प्रॉम्प्ट और उपयोग मामलों के साथ प्रयोग करें।

**प्रश्न?** [एक इश्यू खोलें](https://github.com/microsoft/AZD-for-beginners/issues) या [अक्सर पूछे जाने वाले प्रश्न (FAQ)](../../resources/faq.md) देखें

**लागत अलर्ट:** परीक्षण पूरा होने पर `azd down` चलाना न भूलें ताकि सतत् शुल्क से बचा जा सके (~$50-100/month for active usage).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान रखें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ को उसकी मूल भाषा में अधिकृत स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सलाह दी जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->