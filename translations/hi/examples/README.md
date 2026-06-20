# उदाहरण - व्यावहारिक AZD टेम्पलेट्स और कॉन्फ़िगरेशन

**उदाहरण द्वारा सीखना - अध्याय के अनुसार व्यवस्थित**
- **📚 कोर्स होम**: [AZD शुरुआती के लिए](../README.md)
- **📖 अध्याय मानचित्रण**: उदाहरण सीखने की जटिलता के अनुसार व्यवस्थित हैं
- **🚀 स्थानीय उदाहरण**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 बाहरी AI उदाहरण**: Azure Samples रिपोजिटरी के लिंक

> **📍 महत्वपूर्ण: स्थानीय बनाम बाहरी उदाहरण**  
> इस रिपोजिटरी में **4 पूर्ण स्थानीय उदाहरण** शामिल हैं जिनमें पूर्ण कार्यान्वयन है:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 डिप्लॉयमेंट चैट इंटरफ़ेस के साथ)  
> - **Container Apps** (सिंपल Flask API + माइक्रोसेवाएँ)  
> - **Database App** (वेब + SQL डेटाबेस)  
> - **Retail Multi-Agent** (एंटरप्राइज़ AI समाधान)  
>  
> अतिरिक्त उदाहरण Azure-Samples रिपोजिटरीज़ के **बाहरी संदर्भ** हैं जिन्हें आप क्लोन कर सकते हैं।

## परिचय

यह निर्देशिका व्यावहारिक उदाहरण और संदर्भ प्रदान करती है ताकि आप Azure Developer CLI को हैंड्स-ऑन अभ्यास के माध्यम से सीख सकें। Retail Multi-Agent परिदृश्य एक पूर्ण, प्रोडक्शन-रेडी कार्यान्वयन है जो इस रिपोजिटरी में शामिल है। अतिरिक्त उदाहरण आधिकारिक Azure Samples का संदर्भ देते हैं जो विभिन्न AZD पैटर्न दिखाते हैं।

### जटिलता रेटिंग लीजेंड

- ⭐ **शुरुआती** - बुनियादी अवधारणाएँ, एकल सेवा, 15-30 मिनट
- ⭐⭐ **मध्यम** - कई सेवाएँ, डेटाबेस एकीकरण, 30-60 मिनट
- ⭐⭐⭐ **उन्नत** - जटिल आर्किटेक्चर, AI एकीकरण, 1-2 घंटे
- ⭐⭐⭐⭐ **विशेषज्ञ** - प्रोडक्शन-रेडी, एंटरप्राइज़ पैटर्न, 2+ घंटे

## 🎯 इस रिपोजिटरी में वास्तव में क्या है

### ✅ स्थानीय कार्यान्वयन (उपयोग के लिए तैयार)

#### [Microsoft Foundry Models चैट अनुप्रयोग](azure-openai-chat/README.md) 🆕
**इस रिपो में शामिल चैट इंटरफ़ेस के साथ पूरा gpt-4.1 डिप्लॉयमेंट**

- **स्थान:** `examples/azure-openai-chat/`
- **जटिलता:** ⭐⭐ (मध्यम)
- **इसमें शामिल:**
  - पूर्ण Microsoft Foundry Models डिप्लॉयमेंट (gpt-4.1)
  - Python कमांड-लाइन चैट इंटरफ़ेस
  - सुरक्षित API कुंजियों के लिए Key Vault एकीकरण
  - Bicep इंफ्रास्ट्रक्चर टेम्पलेट्स
  - टोकन उपयोग और लागत ट्रैकिंग
  - रेट लिमिटिंग और त्रुटि हैंडलिंग

**त्वरित शुरुआत:**
```bash
# उदाहरण पर जाएँ
cd examples/azure-openai-chat

# सब कुछ तैनात करें
azd up

# निर्भरता स्थापित करें और चैट शुरू करें
pip install -r src/requirements.txt
python src/chat.py
```

**प्रौद्योगिकियाँ:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App उदाहरण](container-app/README.md) 🆕
**इस रिपो में समग्र कंटेनर डिप्लॉयमेंट उदाहरण शामिल हैं**

- **स्थान:** `examples/container-app/`
- **जटिलता:** ⭐-⭐⭐⭐⭐ (शुरुआती से उन्नत)
- **इसमें शामिल:**
  - [Master Guide](container-app/README.md) - कंटेनर डिप्लॉयमेंट का पूर्ण अवलोकन
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - बुनियादी REST API उदाहरण
  - [Microservices Architecture](../../../examples/container-app/microservices) - प्रोडक्शन-रेडी मल्टि-सर्विस डिप्लॉयमेंट
  - त्वरित शुरुआत, प्रोडक्शन, और उन्नत पैटर्न
  - निगरानी, सुरक्षा, और लागत अनुकूलन

**त्वरित शुरुआत:**
```bash
# मुख्य मार्गदर्शिका देखें
cd examples/container-app

# सरल Flask API तैनात करें
cd simple-flask-api
azd up

# माइक्रोसर्विसेज़ का उदाहरण तैनात करें
cd ../microservices
azd up
```

**प्रौद्योगिकियाँ:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**इस रिपो में शामिल पूरा प्रोडक्शन-रेडी कार्यान्वयन**

- **स्थान:** `examples/retail-multiagent-arm-template/`
- **जटिलता:** ⭐⭐⭐⭐ (उन्नत)
- **इसमें शामिल:**
  - पूर्ण ARM डिप्लॉयमेंट टेम्पलेट
  - मल्टी-एजेंट आर्किटेक्चर (Customer + Inventory)
  - Microsoft Foundry Models एकीकरण
  - RAG के साथ AI Search
  - व्यापक निगरानी
  - वन-क्लिक डिप्लॉयमेंट स्क्रिप्ट

**त्वरित शुरुआत:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**प्रौद्योगिकियाँ:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 बाहरी Azure Samples (क्लोन करके उपयोग करें)

निम्नलिखित उदाहरण आधिकारिक Azure-Samples रिपोजिटरीज़ में रखे गए हैं। विभिन्न AZD पैटर्न का अन्वेषण करने के लिए उन्हें क्लोन करें:

### सरल अनुप्रयोग (अध्याय 1-2)

| टेम्पलेट | रिपोजिटरी | जटिलता | सेवाएँ |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [स्थानीय: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [स्थानीय: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | मल्टि-सर्विस, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**कैसे उपयोग करें:**
```bash
# किसी भी उदाहरण को क्लोन करें
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# तैनात करें
azd up
```

### AI एप्लिकेशन उदाहरण (अध्याय 2, 5, 8)

| टेम्पलेट | रिपोजिटरी | जटिलता | फ़ोकस |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [स्थानीय: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 डिप्लॉयमेंट |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | बुनियादी AI चैट |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | एजेंट फ्रेमवर्क |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG पैटर्न |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | एंटरप्राइज़ AI |

### डेटाबेस और उन्नत पैटर्न (अध्याय 3-8)

| टेम्पलेट | रिपोजिटरी | जटिलता | फ़ोकस |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | डेटाबेस एकीकरण |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL सर्वरलेस |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | मल्टि-सर्विस |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## सीखने के लक्ष्य

इन उदाहरणों के माध्यम से काम करके, आप:
- वास्तविक अनुप्रयोग परिदृश्यों के साथ Azure Developer CLI वर्कफ़्लो का अभ्यास करेंगे
- विभिन्न एप्लिकेशन आर्किटेक्चर और उनके azd कार्यान्वयन को समझेंगे
- विभिन्न Azure सेवाओं के लिए Infrastructure as Code पैटर्न में महारत हासिल करेंगे
- कॉन्फ़िगरेशन प्रबंधन और परिवेश-विशिष्ट डिप्लॉयमेंट रणनीतियों को लागू करेंगे
- व्यावहारिक संदर्भों में निगरानी, सुरक्षा, और स्केलिंग पैटर्न लागू करेंगे
- वास्तविक डिप्लॉयमेंट परिदृश्यों के साथ समस्या-समाधान और डिबगिंग का अनुभव प्राप्त करेंगे

## सीखने के आउटपुट

इन उदाहरणों को पूरा करने के बाद, आप सक्षम होंगे:
- Azure Developer CLI का उपयोग करके विभिन्न प्रकार के अनुप्रयोगों को आत्मविश्वास के साथ डिप्लॉय करना
- प्रदान किए गए टेम्पलेट्स को अपनी आवश्यकताओं के अनुसार अनुकूलित करना
- Bicep का उपयोग करके कस्टम इंफ्रास्ट्रक्चर पैटर्न डिज़ाइन और लागू करना
- उपयुक्त निर्भरताओं के साथ जटिल मल्टि-सर्विस अनुप्रयोगों को कॉन्फ़िगर करना
- वास्तविक परिदृश्यों में सुरक्षा, निगरानी, और प्रदर्शन के सर्वोत्तम अभ्यास लागू करना
- व्यावहारिक अनुभव के आधार पर डिप्लॉयमेंट का समस्या-समाधान और अनुकूलन करना

## निर्देशिका संरचना

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## त्वरित शुरुआत उदाहरण

> **💡 AZD में नए हैं?** उदाहरण #1 (Flask API) से शुरू करें - यह ~20 मिनट लेता है और मूल अवधारणाएँ सिखाता है।

### शुरुआती के लिए
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (स्थानीय) ⭐  
   स्केल-टू-ज़ीरो के साथ एक साधारण REST API डिप्लॉय करें  
   **समय:** 20-25 मिनट | **लागत:** $0-5/माह  
   **आप क्या सीखेंगे:** मूल azd वर्कफ़्लो, कंटेनरीकरण, हेल्थ प्रॉब्स  
   **अपेक्षित परिणाम:** निगरानी के साथ "Hello, World!" लौटाने वाला कार्यरत API endpoint

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB के साथ Node.js Express वेब एप्लिकेशन डिप्लॉय करें  
   **समय:** 25-35 मिनट | **लागत:** $10-30/माह  
   **आप क्या सीखेंगे:** डेटाबेस एकीकरण, एनवायरनमेंट वेरिएबल्स, कनेक्शन स्ट्रिंग्स  
   **अपेक्षित परिणाम:** क्रिएट/रीड/अपडेट/डिलीट फ़ंक्शनलिटी वाले Todo लिस्ट ऐप

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps के साथ React स्टैटिक वेबसाइट होस्ट करें  
   **समय:** 20-30 मिनट | **लागत:** $0-10/माह  
   **आप क्या सीखेंगे:** स्टैटिक होस्टिंग, सर्वरलेस फ़ंक्शंस, CDN डिप्लॉयमेंट  
   **अपेक्षित परिणाम:** API बैकएंड के साथ React UI, ऑटोमैटिक SSL, ग्लोबल CDN

### मध्यम उपयोगकर्ताओं के लिए
4. **[Microsoft Foundry Models चैट अनुप्रयोग](../../../examples/azure-openai-chat)** (स्थानीय) ⭐⭐  
   चैट इंटरफ़ेस और सुरक्षित API कुंजी प्रबंधन के साथ gpt-4.1 डिप्लॉय करें  
   **समय:** 35-45 मिनट | **लागत:** $50-200/माह  
   **आप क्या सीखेंगे:** Microsoft Foundry Models डिप्लॉयमेंट, Key Vault एकीकरण, टोकन ट्रैकिंग  
   **अपेक्षित परिणाम:** gpt-4.1 और लागत निगरानी के साथ कार्यरत चैट एप्लिकेशन

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (स्थानीय) ⭐⭐⭐⭐  
   प्रोडक्शन-रेडी मल्टि-सर्विस आर्किटेक्चर  
   **समय:** 45-60 मिनट | **लागत:** $50-150/माह  
   **आप क्या सीखेंगे:** सर्विस कम्युनिकेशन, संदेश कतार, वितरणीय ट्रेसिंग  
   **अपेक्षित परिणाम:** निगरानी के साथ 2-सर्विस सिस्टम (API Gateway + Product Service)

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API और Azure SQL Database के साथ वेब एप्लिकेशन  
   **समय:** 30-45 मिनट | **लागत:** $20-80/माह  
   **आप क्या सीखेंगे:** Entity Framework, डेटाबेस माइग्रेशन्स, कनेक्शन सुरक्षा  
   **अपेक्षित परिणाम:** Azure SQL बैकएंड के साथ C# API, ऑटोमैटिक स्कीमा डिप्लॉयमेंट

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ट्रिगर्स और Cosmos DB के साथ Python Azure Functions  
   **समय:** 30-40 मिनट | **लागत:** $10-40/माह  
   **आप क्या सीखेंगे:** इवेंट-ड्रिवन आर्किटेक्चर, सर्वरलेस स्केलिंग, NoSQL एकीकरण  
   **अपेक्षित परिणाम:** Cosmos DB स्टोरेज के साथ HTTP अनुरोधों का उत्तर देने वाला फ़ंक्शन ऐप

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps और API गेटवे के साथ मल्टि-सर्विस Java एप्लिकेशन  
   **समय:** 60-90 मिनट | **लागत:** $80-200/माह  
   **आप क्या सीखेंगे:** Spring Boot डिप्लॉयमेंट, सर्विस मेष, लोड बैलेंसिंग  
   **अपेक्षित परिणाम:** सर्विस डिस्कवरी और रूटिंग के साथ मल्टि-सर्विस Java सिस्टम

### Microsoft Foundry टेम्पलेट्स

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   चैट इंटरफ़ेस के साथ पूरा gpt-4.1 डिप्लॉयमेंट  
   **समय:** 35-45 मिनट | **लागत:** $50-200/माह  
   **अपेक्षित परिणाम:** टोकन ट्रैकिंग और लागत निगरानी के साथ कार्यरत चैट एप्लिकेशन

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG आर्किटेक्चर के साथ इंटेलिजेंट चैट एप्लिकेशन  
   **समय:** 60-90 मिनट | **लागत:** $100-300/माह  
   **अपेक्षित परिणाम:** दस्तावेज़ खोज और सन्दर्भ दिए गए RAG-संचालित चैट इंटरफ़ेस

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI सेवाओं का उपयोग करते हुए दस्तावेज़ विश्लेषण  
   **समय:** 40-60 मिनट | **लागत:** $20-80/माह  
   **अपेक्षित परिणाम:** अपलोड किए गए दस्तावेज़ों से टेक्स्ट, तालिकाएँ और एंटिटीज़ निकालने वाला API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning के साथ MLOps वर्कफ़्लो  
   **समय:** 2-3 घंटे | **लागत:** $150-500/माह  
   **अपेक्षित परिणाम:** प्रशिक्षण, डिप्लॉयमेंट, और निगरानी के साथ स्वचालित ML पाइपलाइन

### वास्तविक-विश्व परिदृश्य

#### **Retail Multi-Agent Solution** 🆕
**[पूर्ण कार्यान्वयन गाइड](./retail-scenario.md)**

एक व्यापक, प्रोडक्शन-रेडी मल्टी-एजेंट ग्राहक सहायता समाधान जो AZD के साथ एंटरप्राइज़-ग्रेड AI एप्लिकेशन डिप्लॉयमेंट प्रदर्शित करता है। यह परिदृश्य प्रदान करता है:

- **पूर्ण वास्तुकला**: ग्राहक सेवा और इन्वेंटरी प्रबंधन एजेंटों के साथ मल्टी-एजेंट सिस्टम
- **प्रोडक्शन इन्फ्रास्ट्रक्चर**: मल्टी-रीजन Microsoft Foundry Models तैनाती, AI Search, Container Apps, और व्यापक निगरानी
- **Ready-to-Deploy ARM Template**: एक-क्लिक तैनाती कई कॉन्फ़िगरेशन मोड्स के साथ (Minimal/Standard/Premium)
- **उन्नत विशेषताएँ**: रेड टीमिंग सुरक्षा सत्यापन, एजेंट मूल्यांकन फ्रेमवर्क, लागत अनुकूलन, और समस्या निवारण मार्गदर्शिकाएँ
- **वास्तविक व्यावसायिक संदर्भ**: रिटेलर ग्राहक समर्थन उपयोग मामला फ़ाइल अपलोड, सर्च इंटीग्रेशन, और डायनामिक स्केलिंग के साथ

**प्रौद्योगिकियाँ**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**जटिलता**: ⭐⭐⭐⭐ (उन्नत - एंटरप्राइज़ प्रोडक्शन-रेडी)

**उपयुक्त है**: AI डेवलपर्स, सॉल्यूशन आर्किटेक्ट्स, और प्रोडक्शन मल्टी-एजेंट सिस्टम बनाने वाली टीमें

**त्वरित प्रारंभ**: शामिल ARM टेम्पलेट का उपयोग करके `./deploy.sh -g myResourceGroup` के साथ 30 मिनट से कम में संपूर्ण समाधान तैनात करें

## 📋 उपयोग निर्देश

### पूर्व आवश्यकताएँ

किसी भी उदाहरण को चलाने से पहले:
- ✅ Azure सदस्यता — Owner या Contributor एक्सेस के साथ
- ✅ Azure Developer CLI इंस्टॉल किया हुआ ([इंस्टॉलेशन गाइड](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop चल रहा हो (कंटेनर उदाहरणों के लिए)
- ✅ उपयुक्त Azure कोटा (उदाहरण-विशिष्ट आवश्यकताओं की जाँच करें)

> **💰 लागत चेतावनी:** सभी उदाहरण वास्तविक Azure संसाधन बनाते हैं जिन पर शुल्क लगता है। लागत अनुमानों के लिए व्यक्तिगत README फ़ाइलें देखें। लगातार लागत से बचने के लिए समाप्त होने पर `azd down` चलाना याद रखें।

### स्थानीय रूप से उदाहरण चलाना

1. **उदाहरण क्लोन या कॉपी करें**
   ```bash
   # इच्छित उदाहरण पर जाएँ
   cd examples/simple-web-app
   ```

2. **AZD पर्यावरण प्रारंभ करें**
   ```bash
   # मौजूदा टेम्पलेट के साथ प्रारंभ करें
   azd init
   
   # या नया पर्यावरण बनाएं
   azd env new my-environment
   ```

3. **पर्यावरण कॉन्फ़िगर करें**
   ```bash
   # आवश्यक चर सेट करें
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **तैनात करें**
   ```bash
   # इन्फ्रास्ट्रक्चर और एप्लिकेशन तैनात करें
   azd up
   ```

5. **तैनाती सत्यापित करें**
   ```bash
   # सेवा एंडपॉइंट्स प्राप्त करें
   azd env get-values
   
   # एंडपॉइंट का परीक्षण करें (उदाहरण)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **अपेक्षित सफलता संकेतक:**
   - ✅ `azd up` बिना त्रुटियों के पूरा होता है
   - ✅ सर्विस एंडपॉइंट HTTP 200 लौटाता है
   - ✅ Azure पोर्टल "Running" स्थिति दिखाता है
   - ✅ Application Insights टेलीमेट्री प्राप्त कर रहा है

> **⚠️ समस्या है?** तैनाती समस्या निवारण के लिए [सामान्य समस्याएँ](../docs/chapter-07-troubleshooting/common-issues.md) देखें

### उदाहरणों को अनुकूलित करना

प्रत्येक उदाहरण में शामिल है:
- **README.md** - विस्तृत सेटअप और अनुकूलन निर्देश
- **azure.yaml** - टिप्पणियों के साथ AZD कॉन्फ़िगरेशन
- **infra/** - पैरामीटर व्याख्याओं के साथ Bicep टेम्पलेट्स
- **src/** - नमूना एप्लिकेशन कोड
- **scripts/** - सामान्य कार्यों के लिए सहायक स्क्रिप्ट्स

## 🎯 सीखने के उद्देश्य

### उदाहरण श्रेणियाँ

#### **बुनियादी तैनातियाँ**
- एकल-सेवा एप्लिकेशन
- सरल इन्फ्रास्ट्रक्चर पैटर्न
- बुनियादी कॉन्फ़िगरेशन प्रबंधन
- लागत-कुशल विकास सेटअप

#### **उन्नत परिदृश्य**
- मल्टी-सेवा आर्किटेक्चर
- जटिल नेटवर्किंग कॉन्फ़िगरेशन
- डेटाबेस एकीकरण पैटर्न
- सुरक्षा और अनुपालन कार्यान्वयन

#### **प्रोडक्शन-रेडी पैटर्न**
- उच्च उपलब्धता कॉन्फ़िगरेशन
- मॉनिटरिंग और ऑब्ज़रवेबिलिटी
- CI/CD एकीकरण
- डिजास्टर रिकवरी सेटअप

## 📖 उदाहरण विवरण

### Simple Web App - Node.js Express
**प्रौद्योगिकियाँ**: Node.js, Express, MongoDB, Container Apps  
**कठिनाई**: शुरुआती  
**कॉन्सेप्ट्स**: बुनियादी तैनाती, REST API, NoSQL डेटाबेस एकीकरण

### Static Website - React SPA
**प्रौद्योगिकियाँ**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**कठिनाई**: शुरुआती  
**कॉन्सेप्ट्स**: स्टैटिक होस्टिंग, सर्वरलेस बैकएंड, आधुनिक वेब विकास

### Container App - Python Flask
**प्रौद्योगिकियाँ**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**कठिनाई**: शुरुआती  
**कॉन्सेप्ट्स**: कंटेनरीकरण, REST API, scale-to-zero, हेल्थ प्रोब्स, मॉनिटरिंग  
**स्थान**: [स्थानीय उदाहरण](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**प्रौद्योगिकियाँ**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**कठिनाई**: उन्नत  
**कॉन्सेप्ट्स**: मल्टी-सेवा आर्किटेक्चर, सेवा संचार, मैसेज क्व्यूइंग, वितरित ट्रेसिंग  
**स्थान**: [स्थानीय उदाहरण](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**प्रौद्योगिकियाँ**: C# ASP.NET Core, Azure SQL Database, App Service  
**कठिनाई**: मध्यम  
**कॉन्सेप्ट्स**: Entity Framework, डेटाबेस कनेक्शन, वेब API विकास

### Serverless Function - Python Azure Functions
**प्रौद्योगिकियाँ**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**कठिनाई**: मध्यम  
**कॉन्सेप्ट्स**: इवेंट-ड्रिवन आर्किटेक्चर, सर्वरलेस कंप्यूटिंग, फुल-स्टैक विकास

### Microservices - Java Spring Boot
**प्रौद्योगिकियाँ**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**कठिनाई**: मध्यम  
**कॉन्सेप्ट्स**: माइक्रोसर्विसेज़ संचार, वितरित सिस्टम, एंटरप्राइज़ पैटर्न

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**प्रौद्योगिकियाँ**: Microsoft Foundry Models, Azure AI Search, App Service  
**कठिनाई**: मध्यम  
**कॉन्सेप्ट्स**: RAG आर्किटेक्चर, वेक्टर सर्च, LLM इंटीग्रेशन

#### AI Document Processing
**प्रौद्योगिकियाँ**: Azure AI Document Intelligence, Storage, Functions  
**कठिनाई**: मध्यम  
**कॉन्सेप्ट्स**: डॉक्यूमेंट विश्लेषण, OCR, डेटा एक्स्ट्रैक्शन

#### Machine Learning Pipeline
**प्रौद्योगिकियाँ**: Azure ML, MLOps, Container Registry  
**कठिनाई**: उन्नत  
**कॉन्सेप्ट्स**: मॉडल प्रशिक्षण, डिप्लॉयमेंट पाइपलाइन्स, मॉनिटरिंग

## 🛠 कॉन्फ़िगरेशन उदाहरण

The `configurations/` directory contains reusable components:

### पर्यावरण कॉन्फ़िगरेशन
- डेवलपमेंट वातावरण सेटिंग्स
- स्टेजिंग वातावरण कॉन्फ़िगरेशन
- प्रोडक्शन-रेडी कॉन्फ़िगरेशन
- मल्टी-रीजन डिप्लॉयमेंट सेटअप

### Bicep मॉड्यूल्स
- पुन:प्रयोग योग्य इन्फ्रास्ट्रक्चर कॉम्पोनेंट्स
- सामान्य संसाधन पैटर्न
- सुरक्षा-हर्डेंड टेम्पलेट्स
- लागत-अनुकूलित कॉन्फ़िगरेशन

### सहायक स्क्रिप्ट्स
- वातावरण सेटअप ऑटोमेशन
- डेटाबेस माइग्रेशन स्क्रिप्ट्स
- डिप्लॉयमेंट वैलिडेशन टूल्स
- लागत मॉनिटरिंग यूटिलिटीज

## 🔧 अनुकूलन मार्गदर्शिका

### अपने उपयोग मामले के लिए उदाहरणों को अनुकूलित करना

1. **पूर्व आवश्यकताओं की समीक्षा करें**
   - Azure सेवा आवश्यकताओं की जाँच करें
   - सब्सक्रिप्शन लिमिट सत्यापित करें
   - लागत प्रभाव समझें

2. **कॉन्फ़िगरेशन संशोधित करें**
   - `azure.yaml` सेवा परिभाषाओं को अपडेट करें
   - Bicep टेम्पलेट्स को कस्टमाइज़ करें
   - पर्यावरण चर समायोजित करें

3. **पूरी तरह परीक्षण करें**
   - पहले डेवलपमेंट वातावरण में तैनात करें
   - कार्यक्षमता सत्यापित करें
   - स्केलिंग और प्रदर्शन का परीक्षण करें

4. **सुरक्षा समीक्षा**
   - एक्सेस कंट्रोल की समीक्षा करें
   - सीक्रेट्स मैनेजमेंट लागू करें
   - मॉनिटरिंग और अलर्टिंग सक्षम करें

## 📊 तुलना मैट्रिक्स

| उदाहरण | सेवाएँ | डेटाबेस | प्रमाणीकरण | मॉनिटरिंग | जटिलता |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (लोकल) | 2 | ❌ | Key Vault | पूर्ण | ⭐⭐ |
| **Python Flask API** (लोकल) | 1 | ❌ | बेसिक | पूर्ण | ⭐ |
| **Microservices** (लोकल) | 5+ | ✅ | एंटरप्राइज़ | उन्नत | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | बेसिक | बेसिक | ⭐ |
| React SPA + Functions | 3 | ✅ | बेसिक | पूर्ण | ⭐ |
| Python Flask Container | 2 | ❌ | बेसिक | पूर्ण | ⭐ |
| C# Web API + SQL | 2 | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Java Microservices | 5+ | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | पूर्ण | पूर्ण | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | बेसिक | पूर्ण | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | पूर्ण | पूर्ण | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (लोकल) | **8+** | **✅** | **एंटरप्राइज़** | **उन्नत** | **⭐⭐⭐⭐** |

## 🎓 सीखने का मार्ग

### अनुशंसित प्रगति

1. **सरल वेब ऐप** से शुरू करें
   - बुनियादी AZD कॉन्सेप्ट्स सीखें
   - डिप्लॉयमेंट वर्कफ़्लो समझें
   - वातावरण प्रबंधन का अभ्यास करें

2. **स्टैटिक वेबसाइट** आज़माएँ
   - विभिन्न होस्टिंग विकल्पों का अन्वेषण करें
   - CDN इंटीग्रेशन के बारे में जानें
   - DNS कॉन्फ़िगरेशन समझें

3. **कंटेनर ऐप** की ओर बढ़ें
   - कंटेनरीकरण के मूल सिद्धांत सीखें
   - स्केलिंग अवधारणाएँ समझें
   - Docker के साथ अभ्यास करें

4. **डेटाबेस एकीकरण जोड़ें**
   - डेटाबेस प्रोविजनिंग सीखें
   - कनेक्शन स्ट्रिंग्स समझें
   - सीक्रेट्स मैनेजमेंट का अभ्यास करें

5. **सर्वरलेस का अन्वेषण करें**
   - इवेंट-ड्रिवन आर्किटेक्चर समझें
   - ट्रिगर्स और बाइंडिंग के बारे में जानें
   - APIs के साथ अभ्यास करें

6. **माइक्रोसर्विसेज बनाएं**
   - सेवा संचार सीखें
   - वितरित सिस्टम समझें
   - जटिल डिप्लॉयमेंट का अभ्यास करें

## 🔍 सही उदाहरण ढूँढना

### प्रौद्योगिकी स्टैक के अनुसार
- **Container Apps**: [Python Flask API (लोकल)](../../../examples/container-app/simple-flask-api), [Microservices (लोकल)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (लोकल)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (लोकल)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (लोकल)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (लोकल)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (लोकल)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (लोकल)](../../../examples/container-app/simple-flask-api), [Microservices (लोकल)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (लोकल)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (लोकल)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (लोकल)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (लोकल)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### आर्किटेक्चर पैटर्न के अनुसार
- **Simple REST API**: [Python Flask API (लोकल)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (लोकल)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (लोकल)](../../../examples/container-app/simple-flask-api), [Microservices (लोकल)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (लोकल)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (लोकल)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### जटिलता स्तर के अनुसार
- **शुरुआती**: [Python Flask API (लोकल)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **मध्यम**: **[Microsoft Foundry Models Chat (लोकल)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **उन्नत**: ML Pipeline
- **एंटरप्राइज़ प्रोडक्शन-रेडी**: [Microservices (लोकल)](../../../examples/container-app/microservices) (मैसेज क्व्यूइंग के साथ मल्टी-सेवा), **Retail Multi-Agent Solution** (ARM टेम्पलेट तैनाती के साथ पूर्ण मल्टी-एजेंट सिस्टम)

## 📚 अतिरिक्त संसाधन

### दस्तावेज़ लिंक
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### सामुदायिक उदाहरण
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API के साथ React वेब ऐप](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps जॉब](https://github.com/Azure-Samples/container-apps-jobs)
- [Java के साथ Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### सर्वोत्तम अभ्यास
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 उदाहरणों में योगदान

क्या आपके पास साझा करने के लिए कोई उपयोगी उदाहरण है? हम योगदान का स्वागत करते हैं!

### सबमिशन दिशानिर्देश
1. निर्धारित डायरेक्टरी संरचना का पालन करें
2. विस्तृत README.md शामिल करें
3. कॉन्फ़िगरेशन फ़ाइलों में टिप्पणियाँ जोड़ें
4. सबमिट करने से पहले पूरी तरह परीक्षण करें
5. लागत अनुमान और पूर्वापेक्षाएँ शामिल करें

### उदाहरण टेम्पलेट संरचना
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**प्रो टिप**: अपने टेक्नोलॉजी स्टैक से मेल खाने वाले सबसे सरल उदाहरण से शुरू करें, फिर धीरे-धीरे अधिक जटिल परिदृश्यों की ओर बढ़ें। प्रत्येक उदाहरण पिछले उदाहरणों की अवधारणाओं पर आधारित होता है!

## 🚀 शुरू करने के लिए तैयार?

### आपका सीखने का रास्ता

1. **पूर्ण शुरुआत कर रहे हैं?** → शुरू करें [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 mins)
2. **AZD की बुनियादी जानकारी है?** → कोशिश करें [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 mins)
3. **AI ऐप बना रहे हैं?** → शुरू करें [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 mins) या खोजें [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ hours)
4. **विशेष तकनीकी स्टैक चाहिए?** → ऊपर दिए गए [सही उदाहरण ढूँढ़ना](#-finding-the-right-example) अनुभाग का उपयोग करें

### अगले कदम

- ✅ ऊपर दिए गए [पूर्वापेक्षाएँ](#पूर्व-आवश्यकताएँ) की समीक्षा करें
- ✅ अपनी कौशल स्तर के अनुरूप एक उदाहरण चुनें (देखें [जटिलता लेजेंड](#जटिलता-रेटिंग-लीजेंड))
- ✅ तैनात करने से पहले उदाहरण के README को ध्यानपूर्वक पढ़ें
- ✅ परीक्षण के बाद `azd down` चलाने के लिए रिमाइंडर सेट करें
- ✅ अपना अनुभव GitHub Issues या Discussions के माध्यम से साझा करें

### मदद चाहिए?

- 📖 [FAQ](../resources/faq.md) - सामान्य प्रश्नों के उत्तर
- 🐛 [समस्या निवारण मार्गदर्शिका](../docs/chapter-07-troubleshooting/common-issues.md) - तैनाती समस्याओं को ठीक करें
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - समुदाय से पूछें
- 📚 [Study Guide](../resources/study-guide.md) - अपने सीखने को मजबूत करें

---

**नेविगेशन**
- **📚 कोर्स होम**: [AZD For Beginners](../README.md)
- **📖 अध्ययन सामग्री**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 संसाधन**: [FAQ](../resources/faq.md) | [समस्या निवारण](../docs/chapter-07-troubleshooting/common-issues.md)

---

*अंतिम अपडेट: नवंबर 2025 | [समस्याओं की रिपोर्ट करें](https://github.com/microsoft/AZD-for-beginners/issues) | [उदाहरण योगदान करें](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->