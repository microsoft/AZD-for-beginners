# उदाहरण - व्यावहारिक AZD टेम्पलेट और कॉन्फ़िगरेशन

**उदाहरणों से सीखना - अध्याय अनुसार व्यवस्थित**
- **📚 कोर्स होम**: [AZD For Beginners](../README.md)
- **📖 अध्याय मानचित्रण**: उदाहरण सीखने की जटिलता के अनुसार व्यवस्थित
- **🚀 स्थानीय उदाहरण**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 बाहरी AI उदाहरण**: Azure Samples रिपॉज़िटरीज़ के लिंक

> **📍 महत्वपूर्ण: स्थानीय बनाम बाहरी उदाहरण**  
> यह रिपॉज़िटरी **4 पूर्ण स्थानीय उदाहरण** पूर्ण कार्यान्वयन के साथ शामिल करता है:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 तैनाती चैट इंटरफ़ेस के साथ)  
> - **Container Apps** (साधारण Flask API + माइक्रोसर्विसेज)  
> - **Database App** (वेब + SQL डेटाबेस)  
> - **Retail Multi-Agent** (एंटरप्राइज़ AI समाधान)  
>  
> अतिरिक्त उदाहरण **बाहरी संदर्भ** हैं जो Azure-Samples रिपॉज़िटरीज़ को संदर्भित करते हैं जिन्हें आप क्लोन कर सकते हैं।

## परिचय

यह निर्देशिका व्यावहारिक उदाहरण और संदर्भ प्रदान करती है ताकि आप hands-on अभ्यास के माध्यम से Azure Developer CLI सीख सकें। Retail Multi-Agent परिदृश्य इस रिपॉज़िटरी में शामिल एक पूर्ण, प्रोडक्शन-तैयार कार्यान्वयन है। अतिरिक्त उदाहरण आधिकारिक Azure Samples को संदर्भित करते हैं जो विभिन्न AZD पैटर्न्स को दर्शाते हैं।

### जटिलता रेटिंग लेजेंड

- ⭐ **शुरुआती** - बुनियादी अवधारणाएँ, एकल सेवा, 15-30 मिनट
- ⭐⭐ **मध्यम** - कई सेवाएँ, डेटाबेस एकीकरण, 30-60 मिनट
- ⭐⭐⭐ **उन्नत** - जटिल आर्किटेक्चर, AI एकीकरण, 1-2 घंटे
- ⭐⭐⭐⭐ **विशेषज्ञ** - प्रोडक्शन-तैयार, एंटरप्राइज़ पैटर्न, 2+ घंटे

## 🎯 इस रिपॉज़िटरी में वास्तव में क्या है

### ✅ स्थानीय कार्यान्वयन (तुरंत उपयोग के लिए तैयार)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**इस रिपॉज़िटरी में शामिल पूर्ण gpt-4.1 तैनाती चैट इंटरफ़ेस के साथ**

- **Location:** `examples/azure-openai-chat/`
- **Complexity:** ⭐⭐ (मध्यम)
- **What's Included:**
  - पूर्ण Microsoft Foundry Models तैनाती (gpt-4.1)
  - Python कमांड-लाइन चैट इंटरफ़ेस
  - सुरक्षित API कुंजियों के लिए Key Vault एकीकरण
  - Bicep इन्फ्रास्ट्रक्चर टेम्पलेट
  - टोकन उपयोग और लागत ट्रैकिंग
  - रेट लिमिटिंग और त्रुटि हैंडलिंग

**त्वरित प्रारंभ:**
```bash
# example पर जाएँ
cd examples/azure-openai-chat

# सब कुछ तैनात करें
azd up

# निर्भरता स्थापित करें और चैट शुरू करें
pip install -r src/requirements.txt
python src/chat.py
```

**प्रौद्योगिकियाँ:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**इस रिपॉज़िटरी में व्यापक कंटेनर तैनाती उदाहरण शामिल**

- **Location:** `examples/container-app/`
- **Complexity:** ⭐-⭐⭐⭐⭐ (शुरुआती से उन्नत)
- **What's Included:**
  - [Master Guide](container-app/README.md) - कंटेनर तैनातियों का पूर्ण अवलोकन
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - बुनियादी REST API उदाहरण
  - [Microservices Architecture](../../../examples/container-app/microservices) - प्रोडक्शन-तैयार मल्टी-सर्विस तैनाती
  - त्वरित प्रारंभ, प्रोडक्शन और उन्नत पैटर्न
  - मॉनिटरिंग, सुरक्षा, और लागत अनुकूलन

**त्वरित प्रारंभ:**
```bash
# मास्टर गाइड देखें
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
**इस रिपॉज़िटरी में शामिल पूर्ण प्रोडक्शन-तैयार कार्यान्वयन**

- **Location:** `examples/retail-multiagent-arm-template/`
- **Complexity:** ⭐⭐⭐⭐ (उन्नत)
- **What's Included:**
  - पूर्ण ARM तैनाती टेम्पलेट
  - मल्टी-एजेंट आर्किटेक्चर (Customer + Inventory)
  - Microsoft Foundry Models एकीकरण
  - RAG के साथ AI Search
  - व्यापक मॉनिटरिंग
  - एक-क्लिक तैनाती स्क्रिप्ट

**त्वरित प्रारंभ:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**प्रौद्योगिकियाँ:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 बाहरी Azure Samples (क्लोन करके उपयोग करें)

निम्नलिखित उदाहरण आधिकारिक Azure-Samples रिपॉज़िटरीज़ में रखे गए हैं। विभिन्न AZD पैटर्न्स का अन्वेषण करने के लिए इन्हें क्लोन करें:

### सरल अनुप्रयोग (अध्याय 1-2)

| टेम्पलेट | रिपॉज़िटरी | जटिलता | सेवाएँ |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [स्थानीय: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [स्थानीय: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | मल्टी-सर्विस, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**उपयोग कैसे करें:**
```bash
# किसी भी उदाहरण को क्लोन करें
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# डिप्लॉय करें
azd up
```

### AI अनुप्रयोग उदाहरण (अध्याय 2, 5, 8)

| टेम्पलेट | रिपॉज़िटरी | जटिलता | फोकस |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [स्थानीय: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 तैनाती |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | बुनियादी AI चैट |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | एजेंट फ्रेमवर्क |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG पैटर्न |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | एंटरप्राइज़ AI |

### डेटाबेस और उन्नत पैटर्न (अध्याय 3-8)

| टेम्पलेट | रिपॉज़िटरी | जटिलता | फोकस |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | डेटाबेस एकीकरण |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL सर्वरलेस |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | मल्टी-सर्विस |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## सीखने के लक्ष्य

इन उदाहरणों पर काम करके, आप:
- वास्तविक एप्लिकेशन परिदृश्यों के साथ Azure Developer CLI वर्कफ़्लो का अभ्यास करेंगे
- विभिन्न एप्लिकेशन आर्किटेक्चर और उनके azd कार्यान्वयन समझेंगे
- विभिन्न Azure सेवाओं के लिए Infrastructure as Code पैटर्न मास्टर करेंगे
- कॉन्फ़िगरेशन प्रबंधन और वातावरण-विशिष्ट तैनाती रणनीतियाँ लागू करेंगे
- व्यावहारिक संदर्भों में मॉनिटरिंग, सुरक्षा, और स्केलिंग पैटर्न लागू करेंगे
- वास्तविक तैनाती परिदृश्यों के साथ ट्रबलशूटिंग और डिबगिंग का अनुभव प्राप्त करेंगे

## सीखने के परिणाम

इन उदाहरणों को पूरा करने पर, आप सक्षम होंगे:
- Azure Developer CLI का उपयोग करके विभिन्न प्रकार के अनुप्रयोगों को आत्मविश्वास से तैनात करना
- दिए गए टेम्पलेट्स को अपनी आवश्यकताओं के अनुसार अनुकूलित करना
- Bicep का उपयोग करके कस्टम इन्फ्रास्ट्रक्चर पैटर्न डिजाइन और लागू करना
- उपयुक्त निर्भरताओं के साथ जटिल मल्टी-सर्विस अनुप्रयोग कॉन्फ़िगर करना
- वास्तविक परिदृश्यों में सुरक्षा, मॉनिटरिंग, और प्रदर्शन सर्वोत्तम प्रथाएँ लागू करना
- व्यावहारिक अनुभव के आधार पर तैनाती का ट्रबलशूट और अनुकूलन करना

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

## त्वरित प्रारंभ उदाहरण

> **💡 AZD में नए हैं?** उदाहरण #1 (Flask API) से शुरू करें - इसमें ~20 मिनट लगते हैं और यह मुख्य अवधारणाएँ सिखाता है।

### शुरुआत के लिए
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (स्थानीय) ⭐  
   स्केल-टू-ज़ीरो के साथ एक सरल REST API तैनात करें  
   **समय:** 20-25 मिनट | **लागत:** $0-5/महीना  
   **आप सीखेंगे:** बुनियादी azd वर्कफ़्लो, कंटेनरीकरण, हेल्थ प्रोब्स  
   **अपेक्षित परिणाम:** "Hello, World!" लौटाने वाला कार्यशील API एंडपॉइंट मॉनिटरिंग के साथ

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB के साथ Node.js Express वेब एप्लिकेशन तैनात करें  
   **समय:** 25-35 मिनट | **लागत:** $10-30/महीना  
   **आप सीखेंगे:** डेटाबेस एकीकरण, पर्यावरण चर, कनेक्शन स्ट्रिंग्स  
   **अपेक्षित परिणाम:** टूडू सूची ऐप जिसमें बनाना/पढ़ना/अपडेट/हटाना कार्यक्षमता

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps के साथ React स्टैटिक वेबसाइट होस्ट करें  
   **समय:** 20-30 मिनट | **लागत:** $0-10/महीना  
   **आप सीखेंगे:** स्टैटिक होस्टिंग, सर्वरलेस फ़ंक्शन्स, CDN तैनाती  
   **अपेक्षित परिणाम:** API बैकएंड के साथ React UI, स्वचालित SSL, वैश्विक CDN

### मध्यम स्तर के उपयोगकर्ताओं के लिए
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (स्थानीय) ⭐⭐  
   चैट इंटरफ़ेस और सुरक्षित API कुंजी प्रबंधन के साथ gpt-4.1 तैनात करें  
   **समय:** 35-45 मिनट | **लागत:** $50-200/महीना  
   **आप सीखेंगे:** Microsoft Foundry Models तैनाती, Key Vault एकीकरण, टोकन ट्रैकिंग  
   **अपेक्षित परिणाम:** gpt-4.1 और लागत मॉनिटरिंग के साथ कार्यशील चैट एप्लिकेशन

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (स्थानीय) ⭐⭐⭐⭐  
   प्रोडक्शन-तैयार मल्टी-सर्विस आर्किटेक्चर  
   **समय:** 45-60 मिनट | **लागत:** $50-150/महीना  
   **आप सीखेंगे:** सेवा संचार, संदेश कतार, वितरित ट्रेसिंग  
   **अपेक्षित परिणाम:** 2-सर्विस सिस्टम (API Gateway + Product Service) मॉनिटरिंग के साथ

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API और Azure SQL डेटाबेस के साथ वेब एप्लिकेशन  
   **समय:** 30-45 मिनट | **लागत:** $20-80/महीना  
   **आप सीखेंगे:** Entity Framework, डेटाबेस माइग्रेशन, कनेक्शन सुरक्षा  
   **अपेक्षित परिणाम:** Azure SQL बैकएंड के साथ C# API, स्वचालित स्कीमा तैनाती

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ट्रिगर्स और Cosmos DB के साथ Python Azure Functions  
   **समय:** 30-40 मिनट | **लागत:** $10-40/महीना  
   **आप सीखेंगे:** इवेंट-ड्रिवन आर्किटेक्चर, सर्वरलेस स्केलिंग, NoSQL एकीकरण  
   **अपेक्षित परिणाम:** HTTP अनुरोधों का जवाब देने वाला फंक्शन ऐप Cosmos DB स्टोरेज के साथ

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps और API गेटवे के साथ मल्टी-सर्विस Java एप्लिकेशन  
   **समय:** 60-90 मिनट | **लागत:** $80-200/महीना  
   **आप सीखेंगे:** Spring Boot तैनाती, सेवा मेष, लोड बैलेंसिंग  
   **अपेक्षित परिणाम:** सेवा खोज और रूटिंग के साथ मल्टी-सर्विस Java सिस्टम

### Microsoft Foundry टेम्पलेट्स

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   चैट इंटरफ़ेस के साथ पूर्ण gpt-4.1 तैनाती  
   **समय:** 35-45 मिनट | **लागत:** $50-200/महीना  
   **अपेक्षित परिणाम:** टोकन ट्रैकिंग और लागत मॉनिटरिंग के साथ कार्यशील चैट एप्लिकेशन

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG आर्किटेक्चर के साथ इंटेलिजेंट चैट एप्लिकेशन  
   **समय:** 60-90 मिनट | **लागत:** $100-300/महीना  
   **अपेक्षित परिणाम:** दस्तावेज़ खोज और उद्धरणों के साथ RAG-संचालित चैट इंटरफ़ेस

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI सेवाओं का उपयोग करके दस्तावेज़ विश्लेषण  
   **समय:** 40-60 मिनट | **लागत:** $20-80/महीना  
   **अपेक्षित परिणाम:** अपलोड किए गए दस्तावेज़ों से टेक्स्ट, तालिकाएँ और एंटिटीज़ निकालने वाली API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning के साथ MLOps वर्कफ़्लो  
   **समय:** 2-3 घंटे | **लागत:** $150-500/महीना  
   **अपेक्षित परिणाम:** प्रशिक्षण, तैनाती, और मॉनिटरिंग के साथ स्वचालित ML पाइपलाइन

### वास्तविक दुनिया परिदृश्य

#### **Retail Multi-Agent Solution** 🆕
**[पूर्ण कार्यान्वयन मार्गदर्शिका](./retail-scenario.md)**

एक व्यापक, प्रोडक्शन-तैयार मल्टी-एजेंट ग्राहक सहायता समाधान जो AZD के साथ एंटरप्राइज़-ग्रेड AI एप्लिकेशन तैनाती को प्रदर्शित करता है। यह परिदृश्य प्रदान करता है:
- **पूर्ण आर्किटेक्चर**: विशेषीकृत ग्राहक सेवा और इन्वेंटरी प्रबंधन एजेंटों के साथ मल्टी-एजेंट सिस्टम
- **प्रोडक्शन अवसंरचना**: कई-क्षेत्रों में Microsoft Foundry Models तैनाती, Azure AI Search, Container Apps, और व्यापक मॉनिटरिंग
- **तत्काल तैनाती योग्य ARM टेम्पलेट**: एक-क्लिक तैनाती कई कॉन्फ़िगरेशन मोड्स के साथ (Minimal/Standard/Premium)
- **उन्नत फीचर्स**: रेड टीमिंग सुरक्षा सत्यापन, एजेंट मूल्यांकन फ्रेमवर्क, लागत अनुकूलन, और समस्या निवारण गाइड
- **वास्तविक व्यावसायिक संदर्भ**: रिटेलर ग्राहक समर्थन उपयोग केस फ़ाइल अपलोड, सर्च एकीकरण, और डायनेमिक स्केलिंग के साथ

**प्रौद्योगिकियाँ**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**जटिलता**: ⭐⭐⭐⭐ (उन्नत - एंटरप्राइज़ प्रोडक्शन रेडी)

**उपयुक्त है**: AI डेवलपर्स, सॉल्यूशन आर्किटेक्ट्स, और टीम्स जो प्रोडक्शन मल्टी-एजेंट सिस्टम बना रही हैं

**क्विक स्टार्ट**: शामिल ARM टेम्पलेट का उपयोग करके पूरा सॉल्यूशन 30 मिनट से भी कम में तैनात करें `./deploy.sh -g myResourceGroup`

## 📋 उपयोग निर्देश

### पूर्वापेक्षाएँ

कोई भी उदाहरण चलाने से पहले:
- ✅ Azure सदस्यता जिनके पास Owner या Contributor एक्सेस हो
- ✅ Azure Developer CLI इंस्टॉल किया हुआ हो ([इंस्टॉलेशन गाइड](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop चल रहा हो (कंटेनर उदाहरणों के लिए)
- ✅ उपयुक्त Azure कोटा (उदाहरण-विशिष्ट आवश्यकताओं की जांच करें)

> **💰 लागत चेतावनी:** सभी उदाहरण वास्तविक Azure संसाधन बनाते हैं जो शुल्क लगाएंगे। लागत अनुमान के लिए संबंधित README फ़ाइलें देखें। पूरा होने पर चलाना न भूलें `azd down` ताकि चलती हुई लागत से बचा जा सके।

### स्थानीय रूप से उदाहरण चलाना

1. **क्लोन या उदाहरण कॉपी करें**
   ```bash
   # वांछित उदाहरण पर जाएँ
   cd examples/simple-web-app
   ```

2. **AZD पर्यावरण आरंभ करें**
   ```bash
   # मौजूदा टेम्पलेट के साथ आरंभ करें
   azd init
   
   # या नया वातावरण बनाएं
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
   # बुनियादी ढांचा और एप्लिकेशन तैनात करें
   azd up
   ```

5. **तैनाती सत्यापित करें**
   ```bash
   # सेवा के एंडपॉइंट प्राप्त करें
   azd env get-values
   
   # एंडपॉइंट का परीक्षण करें (उदाहरण)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **अपेक्षित सफलता संकेतक:**
   - ✅ `azd up` बिना त्रुटियों के पूरा हो
   - ✅ सर्विस एंडपॉइंट HTTP 200 लौटाता है
   - ✅ Azure Portal "Running" स्थिति दिखाता है
   - ✅ Application Insights टेलीमेट्री प्राप्त कर रहा है

> **⚠️ समस्याएँ?** तैनाती समस्या निवारण के लिए [सामान्य समस्याएँ](../docs/chapter-07-troubleshooting/common-issues.md) देखें

### उदाहरणों को अनुकूलित करना

प्रत्येक उदाहरण में शामिल है:
- **README.md** - विस्तृत सेटअप और अनुकूलन निर्देश
- **azure.yaml** - टिप्पणियों के साथ AZD कॉन्फ़िगरेशन
- **infra/** - पैरामीटर व्याख्याओं के साथ Bicep टेम्पलेट
- **src/** - नमूना एप्लिकेशन कोड
- **scripts/** - सामान्य कार्यों के लिए सहायक स्क्रिप्ट

## 🎯 सीखने के उद्देश्य

### उदाहरण श्रेणियाँ

#### **बुनियादी तैनाती**
- एक-सेवा अनुप्रयोग
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
**जटिलता**: शुरुआती  
**संकल्पनाएँ**: बुनियादी तैनाती, REST API, NoSQL डेटाबेस एकीकरण

### Static Website - React SPA
**प्रौद्योगिकियाँ**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**जटिलता**: शुरुआती  
**संकल्पनाएँ**: स्टैटिक होस्टिंग, सर्वरलेस बैकएंड, आधुनिक वेब डेवलपमेंट

### Container App - Python Flask
**प्रौद्योगिकियाँ**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**जटिलता**: शुरुआती  
**संकल्पनाएँ**: कंटेनरीकरण, REST API, scale-to-zero, हेल्थ प्रोब्स, मॉनिटरिंग  
**स्थान**: [स्थानीय उदाहरण](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**प्रौद्योगिकियाँ**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**जटिलता**: उन्नत  
**संकल्पनाएँ**: मल्टी-सेवा आर्किटेक्चर, सेवा संचार, मेसेज क्यूइंग, वितरित ट्रेसिंग  
**स्थान**: [स्थानीय उदाहरण](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**प्रौद्योगिकियाँ**: C# ASP.NET Core, Azure SQL Database, App Service  
**जटिलता**: मध्यवर्ती  
**संकल्पनाएँ**: Entity Framework, डेटाबेस कनेक्शंस, वेब API विकास

### Serverless Function - Python Azure Functions
**प्रौद्योगिकियाँ**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**जटिलता**: मध्यवर्ती  
**संकल्पनाएँ**: इवेंट-ड्रिवन आर्किटेक्चर, सर्वरलेस कंप्यूटिंग, फुल-स्टैक विकास

### Microservices - Java Spring Boot
**प्रौद्योगिकियाँ**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**जटिलता**: मध्यवर्ती  
**संकल्पनाएँ**: माइक्रोसर्विसेज़ संचार, वितरित सिस्टम, एंटरप्राइज़ पैटर्न

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**प्रौद्योगिकियाँ**: Microsoft Foundry Models, Cognitive Search, App Service  
**जटिलता**: मध्यवर्ती  
**संकल्पनाएँ**: RAG आर्किटेक्चर, वेक्टर सर्च, LLM एकीकरण

#### AI Document Processing
**प्रौद्योगिकियाँ**: Azure AI Document Intelligence, Storage, Functions  
**जटिलता**: मध्यवर्ती  
**संकल्पनाएँ**: दस्तावेज़ विश्लेषण, OCR, डेटा निष्कर्षण

#### Machine Learning Pipeline
**प्रौद्योगिकियाँ**: Azure ML, MLOps, Container Registry  
**जटिलता**: उन्नत  
**संकल्पनाएँ**: मॉडल ट्रेनिंग, तैनाती पाइपलाइन्स, मॉनिटरिंग

## 🛠 कॉन्फ़िगरेशन उदाहरण

The `configurations/` directory contains reusable components:

### Environment Configurations
- Development environment settings
- Staging environment configurations
- Production-ready configurations
- Multi-region deployment setups

### Bicep Modules
- Reusable infrastructure components
- Common resource patterns
- Security-hardened templates
- Cost-optimized configurations

### Helper Scripts
- Environment setup automation
- Database migration scripts
- Deployment validation tools
- Cost monitoring utilities

## 🔧 अनुकूलन मार्गदर्शिका

### आपके उपयोग मामले के लिए उदाहरणों को अनुकूलित करना

1. **पूर्वापेक्षाएँ देखें**
   - Azure सेवा आवश्यकताओं की जाँच करें
   - सदस्यता सीमाओं का सत्यापन करें
   - लागत प्रभाव को समझें

2. **कॉन्फ़िगरेशन संशोधित करें**
   - `azure.yaml` सर्विस परिभाषाएँ अपडेट करें
   - Bicep टेम्पलेट्स को कस्टमाइज़ करें
   - पर्यावरण चर समायोजित करें

3. **पूरी तरह परीक्षण करें**
   - पहले विकास पर्यावरण में तैनात करें
   - कार्यक्षमता का सत्यापन करें
   - स्केलिंग और प्रदर्शन का परीक्षण करें

4. **सुरक्षा समीक्षा**
   - एक्सेस कंट्रोल की समीक्षा करें
   - सीक्रेट्स मैनेजमेंट लागू करें
   - मॉनिटरिंग और अलर्टिंग सक्रिय करें

## 📊 तुलना मैट्रिक्स

| उदाहरण | सेवाएँ | डेटाबेस | प्रमाणिकरण | निगरानी | जटिलता |
|---------|--------|---------|------------|---------|--------|
| **Microsoft Foundry Models Chat** (स्थानीय) | 2 | ❌ | Key Vault | पूर्ण | ⭐⭐ |
| **Python Flask API** (स्थानीय) | 1 | ❌ | बुनियादी | पूर्ण | ⭐ |
| **Microservices** (स्थानीय) | 5+ | ✅ | एंटरप्राइज़ | उन्नत | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | बुनियादी | बुनियादी | ⭐ |
| React SPA + Functions | 3 | ✅ | बुनियादी | पूर्ण | ⭐ |
| Python Flask Container | 2 | ❌ | बुनियादी | पूर्ण | ⭐ |
| C# Web API + SQL | 2 | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Java Microservices | 5+ | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | पूर्ण | पूर्ण | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | बुनियादी | पूर्ण | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | पूर्ण | पूर्ण | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (स्थानीय) | **8+** | **✅** | **एंटरप्राइज़** | **उन्नत** | **⭐⭐⭐⭐** |

## 🎓 सीखने का मार्ग

### अनुशंसित प्रगति

1. **सरल वेब ऐप से शुरू करें**
   - बुनियादी AZD अवधारणाएँ सीखें
   - तैनाती वर्कफ़्लो समझें
   - पर्यावरण प्रबंधन का अभ्यास करें

2. **स्टैटिक वेबसाइट आज़माएँ**
   - अलग होस्टिंग विकल्पों का अन्वेषण करें
   - CDN एकीकरण के बारे में जानें
   - DNS कॉन्फिगरेशन समझें

3. **कंटेनर ऐप पर जाएँ**
   - कंटेनरीकरण की मूल बातें सीखें
   - स्केलिंग अवधारणाएँ समझें
   - Docker के साथ अभ्यास करें

4. **डेटाबेस एकीकरण जोड़ें**
   - डेटाबेस प्रोविज़निंग सीखें
   - कनेक्शन स्ट्रिंग्स समझें
   - सीक्रेट्स मैनेजमेंट का अभ्यास करें

5. **सर्वरलेस का अन्वेषण करें**
   - इवेंट-ड्रिवन आर्किटेक्चर समझें
   - ट्रिगर्स और बाइंडिंग्स के बारे में जानें
   - API के साथ अभ्यास करें

6. **माइक्रोसर्विसेज बनाएं**
   - सेवा संचार सीखें
   - वितरित सिस्टम समझें
   - जटिल तैनातियों का अभ्यास करें

## 🔍 सही उदाहरण ढूँढना

### प्रौद्योगिकी स्टैक के अनुसार
- **Container Apps**: [Python Flask API (स्थानीय)](../../../examples/container-app/simple-flask-api), [Microservices (स्थानीय)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (स्थानीय)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (स्थानीय)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (स्थानीय)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (स्थानीय)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (स्थानीय)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (स्थानीय)](../../../examples/container-app/simple-flask-api), [Microservices (स्थानीय)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (स्थानीय)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (स्थानीय)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (स्थानीय)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (स्थानीय)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### आर्किटेक्चर पैटर्न के अनुसार
- **Simple REST API**: [Python Flask API (स्थानीय)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (स्थानीय)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (स्थानीय)](../../../examples/container-app/simple-flask-api), [Microservices (स्थानीय)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (स्थानीय)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (स्थानीय)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### जटिलता स्तर के अनुसार
- **शुरुआती**: [Python Flask API (स्थानीय)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **मध्यवर्ती**: **[Microsoft Foundry Models Chat (स्थानीय)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **उन्नत**: ML Pipeline
- **एंटरप्राइज़ प्रोडक्शन-रेडी**: [Microservices (स्थानीय)](../../../examples/container-app/microservices) (मल्टी-सेवा मेसेज क्यूइंग के साथ), **Retail Multi-Agent Solution** (पूरी मल्टी-एजेंट सिस्टम के साथ ARM टेम्पलेट तैनाती)

## 📚 अतिरिक्त संसाधन

### दस्तावेज़ लिंक
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### समुदाय के उदाहरण
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App with C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions with Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### सर्वोत्तम प्रथाएँ
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 योगदान के उदाहरण

क्या आपके पास साझा करने के लिए उपयोगी उदाहरण है? हम योगदानों का स्वागत करते हैं!

### सबमिशन दिशानिर्देश
1. स्थापित निर्देशिका संरचना का पालन करें
2. व्यापक README.md शामिल करें
3. कॉन्फ़िगरेशन फ़ाइलों में टिप्पणियाँ जोड़ें
4. सबमिट करने से पहले अच्छे से परीक्षण करें
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

**Pro Tip**: सबसे सरल उदाहरण से शुरू करें जो आपकी टेक्नोलॉजी स्टैक से मेल खाता हो, फिर धीरे-धीरे अधिक जटिल परिदृश्यों की ओर बढ़ें। प्रत्येक उदाहरण पिछले वाले की अवधारणाओं पर आधारित होता है!

## 🚀 शुरू करने के लिए तैयार?

### आपका सीखने का मार्ग

1. **बिलकुल शुरुआती?** → से शुरू करें [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 मिनट)
2. **AZD का बुनियादी ज्ञान है?** → आज़माएँ [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 मिनट)
3. **AI ऐप बना रहे हैं?** → से शुरू करें [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 मिनट) या एक्सप्लोर करें [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ घंटे)
4. **विशिष्ट टेक स्टैक चाहिए?** → ऊपर के [Finding the Right Example](#-finding-the-right-example) सेक्शन का उपयोग करें

### अगले कदम

- ✅ ऊपर दिए गए [Prerequisites](#पूर्वापेक्षाएँ) की समीक्षा करें
- ✅ अपने कौशल स्तर के अनुरूप उदाहरण चुनें (देखें [जटिलता संकेतक](#जटिलता-रेटिंग-लेजेंड))
- ✅ तैनाती से पहले उदाहरण के README को ध्यानपूर्वक पढ़ें
- ✅ परीक्षण के बाद `azd down` चलाने की स्मरण-सूचना सेट करें
- ✅ अपना अनुभव GitHub Issues या Discussions के माध्यम से साझा करें

### मदद चाहिए?

- 📖 [FAQ](../resources/faq.md) - सामान्य प्रश्नों के उत्तर
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - तैनाती की समस्याओं को ठीक करें
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - समुदाय से पूछें
- 📚 [Study Guide](../resources/study-guide.md) - अपनी सीख को मजबूत करें

---

**Navigation**
- **📚 कोर्स होम**: [AZD For Beginners](../README.md)
- **📖 अध्ययन सामग्री**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 संसाधन**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*अंतिम अपडेट: November 2025 | [समस्याएँ रिपोर्ट करें](https://github.com/microsoft/AZD-for-beginners/issues) | [उदाहरण योगदान करें](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ उसकी मूल भाषा में अधिकृत स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। हम इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->