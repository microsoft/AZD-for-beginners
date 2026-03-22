# Microsoft Foundry Models चॅट अनुप्रयोग

**शिकण्याचा मार्ग:** मध्यवर्ती ⭐⭐ | **वेळ:** 35-45 मिनिटे | **खर्च:** $50-200/महिना

एक संपूर्ण Microsoft Foundry Models चॅट अनुप्रयोग जो Azure Developer CLI (azd) वापरून तयार केला आहे. हा उदाहरण gpt-4.1 चा तैनात करणे, सुरक्षित API प्रवेश, आणि सोपी चॅट इंटरफेस दाखवतो.

## 🎯 आपण काय शिकाल

- Microsoft Foundry Models Service सह gpt-4.1 मॉडेल तैनात करा
- Key Vault सह OpenAI API की सुरक्षित करा
- Python सह सोपी चॅट इंटरफेस तयार करा
- टोकन वापर आणि खर्च याचे निरीक्षण करा
- दर मर्यादा आणि त्रुटी हाताळणी लागू करा

## 📦 काय समाविष्ट आहे

✅ **Microsoft Foundry Models Service** - gpt-4.1 मॉडेल तैनाती  
✅ **Python Chat App** - सोपा कमांड-लाइन चॅट इंटरफेस  
✅ **Key Vault Integration** - सुरक्षित API की संग्रहण  
✅ **ARM Templates** - संपूर्ण इन्फ्रास्ट्रक्चर कोड म्हणून  
✅ **Cost Monitoring** - टोकन वापर ट्रॅकिंग  
✅ **Rate Limiting** - कोटा संपण्यापासून प्रतिबंध  

## आर्किटेक्चर

```mermaid
graph TD
    App[पायथन चॅट अॅप्लिकेशन<br/>स्थानिक/क्लाऊड<br/>कमांड-लाइन इंटरफेस<br/>संवाद इतिहास<br/>टोकन वापर ट्रॅकिंग] -- "HTTPS (API Key)" --> Foundry[मायक्रोसॉफ्ट फौंड्री मॉडेल सेवा<br/>gpt-4.1 मॉडेल<br/>20K टोकन्स/मिन क्षमता<br/>मल्टी-रीजन फेलओव्हर]
    Foundry --> KV[अॅझ्युअर की वॉल्ट<br/>OpenAI API की<br/>एन्डपॉइंट URL]
    Foundry -. Managed Identity .-> KV
```
## पूर्वअट

### आवश्यक

- **Azure Developer CLI (azd)** - [इंस्टॉलेशन मार्गदर्शक](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure सदस्यता** OpenAI प्रवेशासह - [प्रवेश विनंती करा](https://aka.ms/oai/access)
- **Python 3.9+** - [Python इंस्टॉल करा](https://www.python.org/downloads/)

### पूर्वअट तपासा

```bash
# azd आवृत्ती तपासा (1.5.0 किंवा त्याहून उच्च आवश्यक आहे)
azd version

# Azure लॉगिन पडताळा
azd auth login

# Python आवृत्ती तपासा
python --version  # किंवा python3 --version

# OpenAI प्रवेश तपासा (Azure पोर्टलमध्ये तपासा)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ महत्त्वाचे:** Microsoft Foundry Models साठी अनुप्रयोग मंजूरी आवश्यक आहे. जर तुम्ही अर्ज केला नसेल तर भेट द्या [aka.ms/oai/access](https://aka.ms/oai/access). मंजूरीसाठी सामान्यतः 1-2 व्यावसायिक दिवस लागतात.

## ⏱️ तैनाती वेळापत्रक

| टप्पा | कालावधी | काय होते |
|-------|----------|----------|
| पूर्वअट तपासणी | 2-3 मिनिटे | OpenAI कोटा उपलब्धता तपासा |
| इन्फ्रास्ट्रक्चर तैनात करा | 8-12 मिनिटे | OpenAI, Key Vault, मॉडेल तैनात करा |
| अनुप्रयोग सेट करा | 2-3 मिनिटे | पर्यावरण आणि निर्भरताएँ सेट करा |
| **एकूण** | **12-18 मिनिटे** | gpt-4.1 सह चॅट करण्यासाठी तयार |

**टीप:** प्रथम OpenAI तैनात करताना मॉडेल प्रदान केल्यामुळे अधिक वेळ लागू शकतो.

## जलद प्रारंभ

```bash
# उदाहरणाकडे जा
cd examples/azure-openai-chat

# वातावरण प्रारंभ करा
azd env new myopenai

# सर्व काही तैनात करा (पायाभूत सुविधा + संरचना)
azd up
# आपल्याला विचारले जाणार आहे:
# 1. Azure सदस्यता निवडा
# 2. OpenAI उपलब्धतेसह स्थान निवडा (उदा., eastus, eastus2, westus)
# 3. तैनातीसाठी 12-18 मिनिटे प्रतीक्षा करा

# Python अवलंबन स्थापित करा
pip install -r requirements.txt

# चॅट सुरू करा!
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

## ✅ तैनाती तपासा

### टप्पा 1: Azure संसाधने तपासा

```bash
# तैनात केलेले संसाधने पहा
azd show

# अपेक्षित आउटपुट दर्शविते:
# - OpenAI सेवा: (संसाधन नाव)
# - की वॉल्ट: (संसाधन नाव)
# - तैनाती: gpt-4.1
# - स्थान: eastus (किंवा आपण निवडलेला प्रदेश)
```

### टप्पा 2: OpenAI API चाचणी करा

```bash
# OpenAI एंडपॉइंट आणि की मिळवा
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# API कॉल चाचणी करा
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4.1/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**अपेक्षित प्रतिसाद:**  
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

### टप्पा 3: Key Vault प्रवेश तपासा

```bash
# की वॉल्टमधील रहस्ये सूचीबद्ध करा
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**अपेक्षित रहस्ये:**  
- `openai-api-key`  
- `openai-endpoint`  

**यशस्वी निकष:**  
- ✅ gpt-4.1 सह OpenAI सेवा तैनात  
- ✅ API कॉल वैध पूर्णता परत करते  
- ✅ Key Vault मध्ये रहस्ये संग्रहित  
- ✅ टोकन वापर ट्रॅकिंग कार्यान्वित

## प्रोजेक्ट रचना

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

## अनुप्रयोग वैशिष्ट्ये

### चॅट इंटरफेस (`chat.py`)

चॅट अनुप्रयोगामध्ये समाविष्ट आहे:

- **संवादी इतिहास** - संदेशांदरम्यान संदर्भ राखतो  
- **टोकन गणना** - वापर ट्रॅक करते आणि खर्चाचा अंदाज लावतो  
- **त्रुटी हाताळणी** - दर मर्यादा आणि API त्रुटींचे सौम्य हाताळणी  
- **खर्च अंदाज** - प्रत्येकी संदेशासाठी वास्तविक वेळेतील खर्च गणना  
- **स्ट्रीमिंग समर्थन** - पर्यायी स्ट्रीमिंग प्रतिसाद  

### आदेश

चॅट करताना, तुम्ही वापरू शकता:  
- `quit` किंवा `exit` - सत्र समाप्त करा  
- `clear` - संभाषण इतिहास साफ करा  
- `tokens` - एकूण टोकन वापर दाखवा  
- `cost` - अंदाजित एकूण खर्च दाखवा  

### कॉन्फिगरेशन (`config.py`)

पर्यावरण चलांमधून कॉन्फिगरेशन लोड करते:  
```python
AZURE_OPENAI_ENDPOINT  # की वॉल्टमधून
AZURE_OPENAI_API_KEY   # की वॉल्टमधून
AZURE_OPENAI_MODEL     # डीफॉल्ट: gpt-4.1
AZURE_OPENAI_MAX_TOKENS # डीफॉल्ट: 800
```

## वापर उदाहरणे

### मूलभूत चॅट

```bash
python chat.py
```

### सानुकूल मॉडेलसह चॅट

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### स्ट्रीमिंग सह चॅट

```bash
python chat.py --stream
```

### उदाहरण संभाषण

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

## खर्च व्यवस्थापन

### टोकन किंमत (gpt-4.1)

| मॉडेल | इनपुट (प्रति 1K टोकन) | आउटपुट (प्रति 1K टोकन) |
|-------|------------------------|--------------------------|
| gpt-4.1 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### अंदाजित मासिक खर्च

वापराच्या पद्धतींवर आधारित:

| वापर पातळी | संदेश/दिवस | टोकन/दिवस | मासिक खर्च |
|-----------|--------------|------------|-------------|
| **हलका** | 20 संदेश | 3,000 टोकन | $3-5 |
| **मध्यम** | 100 संदेश | 15,000 टोकन | $15-25 |
| **जास्त** | 500 संदेश | 75,000 टोकन | $75-125 |

**मूळ इन्फ्रास्ट्रक्चर खर्च:** $1-2/महिना (Key Vault + कमी संगणकीय)

### खर्च कमी करण्याच्या टिपा

```bash
# 1. सोप्या कामांसाठी GPT-3.5-Turbo वापरा (20 पट स्वस्त)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. लहान उत्तरांसाठी जास्तीत जास्त टोकन्स कमी करा
export AZURE_OPENAI_MAX_TOKENS=400

# 3. टोकन वापरावर लक्ष ठेवा
python chat.py --show-tokens

# 4. बजेट इशारे सेट करा
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## निरीक्षण

### टोकन वापर पहा

```bash
# Azure Portal मध्ये:
# OpenAI Resource → Metrics → "Token Transaction" निवडा

# किंवा Azure CLI वापरून:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### API लॉग पहा

```bash
# डायग्नोस्टिक लॉग्स प्रवाहित करा
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

### समस्या: "Access Denied" त्रुटी

**लक्षणे:** API कॉल करताना 403 Forbidden

**उपाय:**  
```bash
# 1. OpenAI प्रवेश मंजूर आहे का ते तपासा
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. API की बरोबर आहे का ते तपासा
azd env get-value AZURE_OPENAI_API_KEY

# 3. endpoint URL फॉरमॅट तपासा
azd env get-value AZURE_OPENAI_ENDPOINT
# असावे: https://[name].openai.azure.com/
```

### समस्या: "Rate Limit Exceeded"

**लक्षणे:** 429 Too Many Requests

**उपाय:**  
```bash
# 1. वर्तमान कोटा तपासा
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4.1

# 2. कोटा वाढविण्याचा विनंती करा (जर आवश्यक असेल तर)
# Azure Portal → OpenAI Resource → Quotas → वाढीची विनंती या ठिकाणी जा

# 3. पुनःप्रयास लॉजिक अंमलात आणा (आधीच chat.py मध्ये आहे)
# अनुप्रयोग स्वयंचलितपणे घातांकीय बॅकऑफसह पुन्हा प्रयत्न करतो
```

### समस्या: "Model Not Found"

**लक्षणे:** तैनातीसाठी 404 त्रुटी

**उपाय:**  
```bash
# 1. उपलब्ध डिप्लॉयमेंट्सची यादी करा
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. पर्यावरणातील मॉडेल नाव तपासा
echo $AZURE_OPENAI_MODEL

# 3. बरोबर डिप्लॉयमेंट नावावर अद्यतनित करा
export AZURE_OPENAI_MODEL=gpt-4.1  # किंवा gpt-35-turbo
```

### समस्या: उच्च विलंब

**लक्षणे:** प्रतिसाद वेळ मंद (>5 सेकंद)

**उपाय:**  
```bash
# 1. प्रादेशिक विलंब तपासा
# वापरकर्त्यांवर सर्वात जवळच्या प्रादेशिक भागात तैनात करा

# 2. जलद प्रतिसादांसाठी max_tokens कमी करा
export AZURE_OPENAI_MAX_TOKENS=400

# 3. चांगल्या वापरकर्ता अनुभवासाठी स्ट्रीमिंग वापरा
python chat.py --stream
```

## सुरक्षा सर्वोत्तम पद्धती

### 1. API की संरक्षित करा

```bash
# कंगवा नियंत्रणात कधीही की जमा करू नका
# की वॉल्ट वापरा (आधीच संरचीत केलेले)

# की नियमितपणे फिरवा
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. सामग्री फिल्टरिंग लागू करा

```python
# Microsoft Foundry मॉडेल्समध्ये अंगभूत सामग्री फिल्टरिंगचा समावेश आहे
# Azure पोर्टलमध्ये कॉन्फिगर करा:
# OpenAI संसाधन → सामग्री फिल्टर्स → सानुकूल फिल्टर तयार करा

# श्रेण्या: द्वेष, लैंगिक, हिंसा, आत्महानी
# पातळ्या: कमी, मध्यम, उच्च फिल्टरिंग
```

### 3. व्यवस्थापित ओळख वापरा (उत्पादन)

```bash
# उत्पादन तैनातीसाठी, व्यवस्थापित ओळख वापरा
# API कीजऐवजी (अॅझ्युअरवर अ‍ॅप होस्टिंग आवश्यक आहे)

# infra/openai.bicep मध्ये अपडेट करा:
# identity: { type: 'SystemAssigned' }
```

## विकास

### स्थानिकपणे चालवा

```bash
# अवलंबित्व स्थापित करा
pip install -r src/requirements.txt

# पर्यावरण चल सेट करा
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4.1"

# अनुप्रयोग चालवा
python src/chat.py
```

### चाचण्या चालवा

```bash
# चाचणी अवलंबन स्थापित करा
pip install pytest pytest-cov

# चाचण्या चालवा
pytest tests/ -v

# कव्हरेजसह
pytest tests/ --cov=src --cov-report=html
```

### मॉडेल तैनात अपडेट करा

```bash
# वेगवेगळ्या मॉडेल आवृत्तीचे प्रक्षेपण करा
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

## साफसफाई

```bash
# सर्व Azure स्रोत काढून टाका
azd down --force --purge

# हे हटवते:
# - OpenAI सेवा
# - की वॉल्ट (90 दिवसांच्या सॉफ्ट डिलीटसह)
# - स्रोत गट
# - सर्व तैनाती आणि संरचना
```

## पुढील पावले

### हे उदाहरण विस्तृत करा

1. **वेब इंटरफेस जोडा** - React/Vue फ्रंटेंड तयार करा  
   ```bash
   # azure.yaml मध्ये फ्रंटएंड सेवा जोडा
   # Azure Static Web Apps मध्ये तैनात करा
   ```

2. **RAG लागू करा** - Azure AI Search सह दस्तऐवज शोध जोडा  
   ```python
   # Azure Cognitive Search एकत्रित करा
   # दस्तऐवज अपलोड करा आणि व्हेक्टर निर्देशांक तयार करा
   ```

3. **फंक्शन कॉलिंग जोडा** - टूल वापर सक्षम करा  
   ```python
   # chat.py मध्ये फंक्शन्स परिभाषित करा
   # gpt-4.1 ला बाह्य API वर कॉल करण्याची परवानगी द्या
   ```

4. **मल्टी-मॉडेल समर्थन** - अनेक मॉडेल तैनात करा  
   ```bash
   # gpt-35-turbo, एम्बेडिंग मॉडेल्स जोडा
   # मॉडेल राऊटिंग लॉजिक अंमलात आणा
   ```

### संबंधित उदाहरणे

- **[Retail Multi-Agent](../retail-scenario.md)** - प्रगत मल्टी-एजंट आर्किटेक्चर  
- **[Database App](../../../../examples/database-app)** - कायमस्वरूपी संग्रह जोडा  
- **[Container Apps](../../../../examples/container-app)** - कंटेनर-आधारित सेवा म्हणून तैनात करा  

### शिकण्याचे स्रोत

- 📚 [AZD For Beginners Course](../../README.md) - मुख्य कोर्स होम  
- 📚 [Microsoft Foundry Models Documentation](https://learn.microsoft.com/azure/ai-services/openai/) - अधिकृत दस्तऐवज  
- 📚 [OpenAI API Reference](https://platform.openai.com/docs/api-reference) - API तपशील  
- 📚 [Responsible AI](https://www.microsoft.com/ai/responsible-ai) - सर्वोत्तम पद्धती  

## अतिरिक्त संसाधने

### दस्तऐवज  
- **[Microsoft Foundry Models Service](https://learn.microsoft.com/azure/ai-services/openai/)** - संपूर्ण मार्गदर्शक  
- **[gpt-4.1 Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - मॉडेल क्षमता  
- **[Content Filtering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - सुरक्षा वैशिष्ट्ये  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd संदर्भ  

### ट्युटोरियल्स  
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - पहिली तैनाती  
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - चॅट अनुप्रयोग तयार करणे  
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - प्रगत वैशिष्ट्ये  

### साधने  
- **[Microsoft Foundry Models Studio](https://oai.azure.com/)** - वेब-आधारित प्लेग्राउंड  
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - चांगले प्रॉम्प्ट लिहिणे  
- **[Token Calculator](https://platform.openai.com/tokenizer)** - टोकन वापराचा अंदाज  

### समुदाय  
- **[Azure AI Discord](https://discord.gg/azure)** - समुदायाकडून मदत मिळवा  
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - प्रश्नोत्तरे मंच  
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - नवीनतम अपडेट्  

---

**🎉 यशस्वी!** तुम्ही Microsoft Foundry Models तैनात केले आहे आणि कार्यरत चॅट अनुप्रयोग तयार केला आहे. gpt-4.1 ची क्षमता एक्सप्लोर करा आणि विविध प्रॉम्प्ट् आणि वापर प्रकरणांवर प्रयोग करा.

**प्रश्न?** [एक समस्या उघडा](https://github.com/microsoft/AZD-for-beginners/issues) किंवा [FAQ](../../resources/faq.md) तपासा

**खर्च सूचना:** चाचणी पूर्ण झाल्यावर `azd down` चालवा जेणेकरून चालू चार्जेस टाळता येतील (~सक्रिय वापरासाठी $50-100/महिना).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) च्या मदतीने अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपया ध्यानात घ्या की स्वयंचालित अनुवादांमध्ये चुका किंवा अचूकतेच्या त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या स्थानिक भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वपूर्ण माहितीसाठी व्यावसायिक मानवी अनुवाद करण्याची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवलेल्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थलागी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->