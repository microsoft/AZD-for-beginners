# उदाहरण - व्यावहारिक AZD टेम्पलेट और विन्यास

**उदाहरणों से सीखना - अध्याय के अनुसार संगठित**
- **📚 कोर्स होम**: [AZD For Beginners](../README.md)
- **📖 अध्याय मानचित्रण**: सीखने की जटिलता के अनुसार व्यवस्थित उदाहरण
- **🚀 स्थानीय उदाहरण**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 बाहरी AI उदाहरण**: Azure Samples रिपॉज़िटरीज़ के लिंक

> **📍 महत्वपूर्ण: स्थानीय बनाम बाहरी उदाहरण**  
> यह रिपॉज़िटरी **4 पूर्ण स्थानीय उदाहरण** शामिल करती है जिनका पूरा क्रियान्वयन उपलब्ध है:  
> - **Azure OpenAI Chat** (चैट इंटरफ़ेस के साथ GPT-4 परिनियोजन)  
> - **Container Apps** (सरल Flask API + माइक्रोसर्विसेज)  
> - **Database App** (वेब + SQL डेटाबेस)  
> - **Retail Multi-Agent** (एंटरप्राइज़ AI समाधान)  
>  
> अतिरिक्त उदाहरण उन Azure-Samples रिपॉज़िटरीज़ के **बाहरी संदर्भ** हैं जिन्हें आप क्लोन कर सकते हैं।

## परिचय

यह निर्देशिका व्यावहारिक उदाहरण और संदर्भ प्रदान करती है ताकि आप Azure Developer CLI को हाथों-हाथ अभ्यास के माध्यम से सीख सकें। Retail Multi-Agent परिदृश्य इस रिपॉज़िटरी में शामिल एक पूर्ण, प्रोडक्शन-तैयार क्रियान्वयन है। अतिरिक्त उदाहरण आधिकारिक Azure Samples को संदर्भित करते हैं जो विभिन्न AZD पैटर्न दिखाते हैं।

### जटिलता रेटिंग लीजेंड

- ⭐ **शुरुआती** - बुनियादी अवधारणाएँ, एकल सेवा, 15-30 मिनट
- ⭐⭐ **मध्यम** - कई सेवाएँ, डेटाबेस एकीकरण, 30-60 मिनट
- ⭐⭐⭐ **उन्नत** - जटिल आर्किटेक्चर, AI इंटीग्रेशन, 1-2 घंटे
- ⭐⭐⭐⭐ **विशेषज्ञ** - प्रोडक्शन-तैयार, एंटरप्राइज़ पैटर्न, 2+ घंटे

## 🎯 इस रिपॉज़िटरी में वास्तव में क्या है

### ✅ स्थानीय क्रियान्वयन (उपयोग के लिए तैयार)

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕
**इस रिपॉज़िटरी में शामिल चैट इंटरफ़ेस के साथ पूर्ण GPT-4 परिनियोजन**

- **स्थान:** `examples/azure-openai-chat/`
- **जटिलता:** ⭐⭐ (मध्यम)
- **क्या शामिल है:**
  - पूर्ण Azure OpenAI परिनियोजन (GPT-4)
  - Python कमांड-लाइन चैट इंटरफ़ेस
  - सुरक्षित API कुंजियों के लिए Key Vault इंटीग्रेशन
  - Bicep इन्फ्रास्ट्रक्चर टेम्पलेट
  - टोकन उपयोग और लागत ट्रैकिंग
  - रेट सीमांकन और त्रुटि हैंडलिंग

**त्वरित आरंभ:**
```bash
# उदाहरण पर जाएँ
cd examples/azure-openai-chat

# सब कुछ तैनात करें
azd up

# निर्भरताएँ स्थापित करें और चैट करना शुरू करें
pip install -r src/requirements.txt
python src/chat.py
```

**प्रौद्योगिकियाँ:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**इस रिपॉज़िटरी में शामिल व्यापक कंटेनर परिनियोजन उदाहरण**

- **स्थान:** `examples/container-app/`
- **जटिलता:** ⭐-⭐⭐⭐⭐ (शुरुआती से उन्नत)
- **क्या शामिल है:**
  - [मास्टर गाइड](container-app/README.md) - कंटेनर परिनियोजनों का पूर्ण अवलोकन
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - मूल REST API उदाहरण
  - [Microservices Architecture](../../../examples/container-app/microservices) - प्रोडक्शन-तैयार मल्टी-सर्विस परिनियोजन
  - क्विक स्टार्ट, प्रोडक्शन और उन्नत पैटर्न
  - मॉनिटरिंग, सुरक्षा, और लागत अनुकूलन

**त्वरित आरंभ:**
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
**इस रिपॉज़िटरी में शामिल पूर्ण प्रोडक्शन-तैयार क्रियान्वयन**

- **स्थान:** `examples/retail-multiagent-arm-template/`
- **जटिलता:** ⭐⭐⭐⭐ (उन्नत)
- **क्या शामिल है:**
  - पूर्ण ARM परिनियोजन टेम्पलेट
  - मल्टी-एजेंट आर्किटेक्चर (ग्राहक + इन्वेंटरी)
  - Azure OpenAI इंटीग्रेशन
  - RAG के साथ AI सर्च
  - व्यापक मॉनिटरिंग
  - वन-क्लिक परिनियोजन स्क्रिप्ट

**त्वरित आरंभ:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**प्रौद्योगिकियाँ:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 बाहरी Azure Samples (क्लोन करके उपयोग करें)

निम्नलिखित उदाहरण आधिकारिक Azure-Samples रिपॉज़िटरीज़ में बनाए और बनाए जाते हैं। विभिन्न AZD पैटर्न का अन्वेषण करने के लिए इन्हें क्लोन करें:

### सरल अनुप्रयोग (अध्याय 1-2)

| टेम्पलेट | रिपॉज़िटरी | जटिलता | सेवाएँ |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [स्थानीय: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [स्थानीय: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | बहु-सेवा, Service Bus, Cosmos DB, SQL |
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

### एआई एप्लिकेशन उदाहरण (अध्याय 2, 5, 8)

| टेम्पलेट | रिपॉज़िटरी | जटिलता | फोकस |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [स्थानीय: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 परिनियोजन |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | मूल AI चैट |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | एजेंट फ्रेमवर्क |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG पैटर्न |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | एंटरप्राइज़ AI |

### डेटाबेस एवं उन्नत पैटर्न (अध्याय 3-8)

| टेम्पलेट | रिपॉज़िटरी | जटिलता | फोकस |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | डेटाबेस एकीकरण |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL सर्वरलेस |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | बहु-सेवा |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## सीखने के लक्ष्य

इन उदाहरणों पर काम करके, आप:
- वास्तविक एप्लिकेशन परिदृश्यों के साथ Azure Developer CLI वर्कफ़्लो का अभ्यास करेंगे
- विभिन्न एप्लिकेशन आर्किटेक्चर और उनके azd क्रियान्वयन को समझेंगे
- विभिन्न Azure सेवाओं के लिए Infrastructure as Code पैटर्न में महारत हासिल करेंगे
- कॉन्फ़िगरेशन प्रबंधन और पर्यावरण-विशेष परिनियोजन रणनीतियों को लागू करेंगे
- व्यावहारिक संदर्भों में मॉनिटरिंग, सुरक्षा, और स्केलिंग पैटर्न लागू करेंगे
- वास्तविक परिनियोजन परिदृश्यों के लिए समस्या निवारण और डिबगिंग का अनुभव बनाएँगे

## सीखने के परिणाम

इन उदाहरणों को पूरा करने के बाद, आप सक्षम होंगे:
- Azure Developer CLI का उपयोग करके विभिन्न प्रकार के एप्लिकेशन आत्मविश्वास के साथ परिनियोजित करना
- दिए गए टेम्पलेट्स को अपनी एप्लिकेशन आवश्यकताओं के अनुसार अनुकूलित करना
- Bicep का उपयोग करके कस्टम इन्फ्रास्ट्रक्चर पैटर्न डिजाइन और लागू करना
- उचित निर्भरता के साथ जटिल मल्टी-सर्विस एप्लिकेशन कॉन्फ़िगर करना
- वास्तविक परिदृश्यों में सुरक्षा, मॉनिटरिंग और प्रदर्शन सर्वोत्तम प्रथाओं को लागू करना
- व्यावहारिक अनुभव के आधार पर परिनियोजनों का समस्या निवारण और अनुकूलन करना

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

## त्वरित आरंभ उदाहरण

> **💡 AZD में नये हैं?** उदाहरण #1 (Flask API) से शुरू करें - इसमें ~20 मिनट लगते हैं और यह मूल अवधारणाएँ सिखाता है।

### शुरुआती के लिए
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (स्थानीय) ⭐  
   स्केल-टू-ज़ीरो के साथ एक सरल REST API परिनियोजित करें  
   **समय:** 20-25 मिनट | **लागत:** $0-5/महीना  
   **आप जो सीखेंगे:** मूल azd वर्कफ़्लो, कंटेनरीकरण, हेल्थ प्रॉब्स  
   **अपेक्षित परिणाम:** कार्यशील API endpoint जो "Hello, World!" लौटाता है और मॉनिटरिंग के साथ

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB के साथ एक Node.js Express वेब एप्लिकेशन परिनियोजित करें  
   **समय:** 25-35 मिनट | **लागत:** $10-30/महीना  
   **आप जो सीखेंगे:** डेटाबेस एकीकरण, पर्यावरण वेरिएबल, कनेक्शन स्ट्रिंग्स  
   **अपेक्षित परिणाम:** CRUD कार्यक्षमता वाला Todo सूची ऐप

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps के साथ एक React स्टैटिक वेबसाइट होस्ट करें  
   **समय:** 20-30 मिनट | **लागत:** $0-10/महीना  
   **आप जो सीखेंगे:** स्टैटिक होस्टिंग, सर्वरलेस फंक्शन्स, CDN परिनियोजन  
   **अपेक्षित परिणाम:** API बैकएंड के साथ React UI, स्वचालित SSL, वैश्विक CDN

### मध्यम उपयोगकर्ताओं के लिए
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (स्थानीय) ⭐⭐  
   चैट इंटरफ़ेस और सुरक्षित API कुंजी प्रबंधन के साथ GPT-4 परिनियोजित करें  
   **समय:** 35-45 मिनट | **लागत:** $50-200/महीना  
   **आप जो सीखेंगे:** Azure OpenAI परिनियोजन, Key Vault इंटीग्रेशन, टोकन ट्रैकिंग  
   **अपेक्षित परिणाम:** GPT-4 और लागत मॉनिटरिंग के साथ कार्यशील चैट एप्लिकेशन

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (स्थानीय) ⭐⭐⭐⭐  
   प्रोडक्शन-तैयार मल्टी-सर्विस आर्किटेक्चर  
   **समय:** 45-60 मिनट | **लागत:** $50-150/महीना  
   **आप जो सीखेंगे:** सेवा संचार, संदेश कतारबद्धता, वितरित ट्रेसिंग  
   **अपेक्षित परिणाम:** 2-सर्विस सिस्टम (API Gateway + Product Service) मॉनिटरिंग के साथ

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API और Azure SQL Database के साथ वेब एप्लिकेशन  
   **समय:** 30-45 मिनट | **लागत:** $20-80/महीना  
   **आप जो सीखेंगे:** Entity Framework, डेटाबेस माइग्रेशन, कनेक्शन सुरक्षा  
   **अपेक्षित परिणाम:** Azure SQL बैकएंड के साथ C# API, स्वचालित स्कीमा परिनियोजन

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ट्रिगर्स और Cosmos DB के साथ Python Azure Functions  
   **समय:** 30-40 मिनट | **लागत:** $10-40/महीना  
   **आप जो सीखेंगे:** इवेंट-ड्रिवन आर्किटेक्चर, सर्वरलेस स्केलिंग, NoSQL एकीकरण  
   **अपेक्षित परिणाम:** HTTP अनुरोधों का उत्तर देने वाला फ़ंक्शन ऐप जो Cosmos DB में संग्रह करता है

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps और API गेटवे के साथ मल्टी-सर्विस Java एप्लिकेशन  
   **समय:** 60-90 मिनट | **लागत:** $80-200/महीना  
   **आप जो सीखेंगे:** Spring Boot परिनियोजन, सेवा मेष, लोड बैलेंसिंग  
   **अपेक्षित परिणाम:** सेवा खोज और रूटिंग के साथ मल्टी-सर्विस Java सिस्टम

### Microsoft Foundry टेम्पलेट्स

1. **[Azure OpenAI Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   चैट इंटरफ़ेस के साथ पूर्ण GPT-4 परिनियोजन  
   **समय:** 35-45 मिनट | **लागत:** $50-200/महीना  
   **अपेक्षित परिणाम:** टोकन ट्रैकिंग और लागत मॉनिटरिंग के साथ कार्यशील चैट एप्लिकेशन

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG आर्किटेक्चर के साथ बुद्धिमान चैट एप्लिकेशन  
   **समय:** 60-90 मिनट | **लागत:** $100-300/महीना  
   **अपेक्षित परिणाम:** दस्तावेज़ खोज और संदर्भ के साथ RAG-संचालित चैट इंटरफ़ेस

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI सेवाओं का उपयोग करके दस्तावेज़ विश्लेषण  
   **समय:** 40-60 मिनट | **लागत:** $20-80/महीना  
   **अपेक्षित परिणाम:** अपलोड किए गए दस्तावेज़ों से पाठ, तालिकाएँ और एंटिटी निकालने वाली API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning के साथ MLOps वर्कफ़्लो  
   **समय:** 2-3 घंटे | **लागत:** $150-500/महीना  
   **अपेक्षित परिणाम:** प्रशिक्षण, परिनियोजन, और मॉनिटरिंग के साथ स्वचालित ML पाइपलाइन

### वास्तविक-विश्व परिदृश्य

#### **Retail Multi-Agent Solution** 🆕
**[पूर्ण क्रियान्वयन गाइड](./retail-scenario.md)**

एक व्यापक, प्रोडक्शन-तैयार मल्टी-एजेंट ग्राहक सहायता समाधान जो AZD के साथ एंटरप्राइज़-ग्रेड AI एप्लिकेशन परिनियोजन दर्शाता है। यह परिदृश्य प्रदान करता है:

- **पूर्ण आर्किटेक्चर**: विशेषीकृत ग्राहक सेवा और इन्वेंटरी प्रबंधन एजेंट्स के साथ मल्टी-एजेंट सिस्टम
- **उत्पादन अवसंरचना**: बहु-क्षेत्रीय Azure OpenAI तैनाती, AI Search, Container Apps, और व्यापक मॉनिटरिंग
- **तैनाती के लिए तैयार ARM टेम्पलेट**: एक-क्लिक तैनाती कई कॉन्फ़िगरेशन मोड्स के साथ (Minimal/Standard/Premium)
- **उन्नत विशेषताएँ**: रेड टीमिंग सुरक्षा सत्यापन, एजेंट मूल्यांकन फ्रेमवर्क, लागत अनुकूलन, और समस्या निवारण मार्गदर्शक
- **वास्तविक व्यावसायिक संदर्भ**: रिटेल ग्राहक समर्थन उपयोग मामला फाइल अपलोड, खोज एकीकरण, और डायनेमिक स्केलिंग के साथ

**प्रौद्योगिकियाँ**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**जटिलता**: ⭐⭐⭐⭐ (उन्नत - एंटरप्राइज़ प्रोडक्शन-तैयार)

**उपयुक्त है**: AI डेवलपर्स, सॉल्यूशन आर्किटेक्ट्स, और प्रोडक्शन मल्टी-एजेंट सिस्टम बनाने वाली टीमें

**त्वरित आरंभ**: सम्मिलित ARM टेम्पलेट का उपयोग करके `./deploy.sh -g myResourceGroup` के साथ 30 मिनट के अंदर पूरा समाधान तैनात करें

## 📋 उपयोग निर्देश

### आवश्यकताएँ

Before running any example:
- ✅ Azure सब्सक्रिप्शन जिस पर Owner या Contributor एक्सेस हो
- ✅ Azure Developer CLI इंस्टॉल किया हुआ ([स्थापना मार्गदर्शिका](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop चल रहा हो (कंटेनर उदाहरणों के लिए)
- ✅ उपयुक्त Azure कोटा (उदाहरण-विशिष्ट आवश्यकताओं की जाँच करें)

> **💰 लागत चेतावनी:** सभी उदाहरण वास्तविक Azure संसाधन बनाते हैं जिन पर शुल्क लगता है। लागत अनुमानों के लिए व्यक्तिगत README फ़ाइलें देखें। जारी लागत से बचने के लिए कार्य समाप्त होने पर `azd down` चलाना याद रखें।

### स्थानीय रूप से उदाहरण चलाना

1. **उदाहरण क्लोन या कॉपी करें**
   ```bash
   # इच्छित उदाहरण पर जाएँ
   cd examples/simple-web-app
   ```

2. **AZD पर्यावरण प्रारंभ करें**
   ```bash
   # मौजूदा टेम्पलेट के साथ आरंभ करें
   azd init
   
   # या नया एनवायरनमेंट बनाएं
   azd env new my-environment
   ```

3. **पर्यावरण कॉन्फ़िगर करें**
   ```bash
   # आवश्यक वेरिएबल सेट करें
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **तैनात करें**
   ```bash
   # बुनियादी ढांचा और एप्लिकेशन को तैनात करें
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
   - ✅ `azd up` त्रुटियों के बिना पूरा होता है
   - ✅ सेवा endpoint HTTP 200 लौटाती है
   - ✅ Azure पोर्टल "Running" स्थिति दिखाता है
   - ✅ Application Insights टेलीमेट्री प्राप्त कर रहा है

> **⚠️ समस्याएँ?** तैनाती समस्या निवारण के लिए [सामान्य समस्याएँ](../docs/chapter-07-troubleshooting/common-issues.md) देखें

### उदाहरणों को अनुकूलित करना

प्रत्येक उदाहरण में शामिल हैं:
- **README.md** - विस्तृत सेटअप और कस्टमाइज़ेशन निर्देश
- **azure.yaml** - टिप्पणियों के साथ AZD कॉन्फ़िगरेशन
- **infra/** - पैरामीटर स्पष्टीकरण के साथ Bicep टेम्पलेट्स
- **src/** - नमूना एप्लिकेशन कोड
- **scripts/** - सामान्य कार्यों के लिए सहायक स्क्रिप्ट्स

## 🎯 सीखने के उद्देश्य

### उदाहरण श्रेणियाँ

#### **मूल तैनाती**
- एकल-सेवा अनुप्रयोग
- सरल अवसंरचना पैटर्न
- मूल कॉन्फ़िगरेशन प्रबंधन
- लागत-कुशल विकास सेटअप

#### **उन्नत परिदृश्य**
- बहु-सेवा आर्किटेक्चर
- जटिल नेटवर्किंग कॉन्फ़िगरेशन
- डेटाबेस एकीकरण पैटर्न
- सुरक्षा और अनुपालन कार्यान्वयन

#### **उत्पादन-तैयार पैटर्न**
- उच्च उपलब्धता कॉन्फ़िगरेशन
- मॉनिटरिंग और अवलोकनीयता
- CI/CD एकीकरण
- आपदा रिकवरी सेटअप

## 📖 उदाहरण विवरण

### सरल वेब ऐप - Node.js Express
**प्रौद्योगिकियाँ**: Node.js, Express, MongoDB, Container Apps  
**जटिलता**: शुरुआती  
**संकल्पनाएँ**: मूल तैनाती, REST API, NoSQL डेटाबेस एकीकरण

### स्थिर वेबसाइट - React SPA
**प्रौद्योगिकियाँ**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**जटिलता**: शुरुआती  
**संकल्पनाएँ**: स्टैटिक होस्टिंग, सर्वरलेस बैकएंड, आधुनिक वेब विकास

### कंटेनर ऐप - Python Flask
**प्रौद्योगिकियाँ**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**जटिलता**: शुरुआती  
**संकल्पनाएँ**: कंटेनरीकरण, REST API, scale-to-zero, हेल्थ प्रॉब्स, मॉनिटरिंग  
**स्थान**: [स्थानीय उदाहरण](../../../examples/container-app/simple-flask-api)

### कंटेनर ऐप - माइक्रोसर्विस आर्किटेक्चर
**प्रौद्योगिकियाँ**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**जटिलता**: उन्नत  
**संकल्पनाएँ**: मल्टी-सेवा आर्किटेक्चर, सेवा संचार, संदेश कतारबद्धता, वितरित ट्रेसिंग  
**स्थान**: [स्थानीय उदाहरण](../../../examples/container-app/microservices)

### डेटाबेस ऐप - C# with Azure SQL
**प्रौद्योगिकियाँ**: C# ASP.NET Core, Azure SQL Database, App Service  
**जटिलता**: मध्यवर्ती  
**संकल्पनाएँ**: Entity Framework, डेटाबेस कनेक्शन, वेब API विकास

### सर्वरलेस फ़ंक्शन - Python Azure Functions
**प्रौद्योगिकियाँ**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**जटिलता**: मध्यवर्ती  
**संकल्पनाएँ**: इवेंट-ड्रिवन आर्किटेक्चर, सर्वरलेस कम्प्यूटिंग, फुल-स्टैक विकास

### माइक्रोसर्विसेज - Java Spring Boot
**प्रौद्योगिकियाँ**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**जटिलता**: मध्यवर्ती  
**संकल्पनाएँ**: माइक्रोसर्विस संचार, वितरित सिस्टम, एंटरप्राइज़ पैटर्न

### Microsoft Foundry उदाहरण

#### Azure OpenAI चैट ऐप
**प्रौद्योगिकियाँ**: Azure OpenAI, Cognitive Search, App Service  
**जटिलता**: मध्यवर्ती  
**संकल्पनाएँ**: RAG आर्किटेक्चर, वेक्टर सर्च, LLM एकीकरण

#### AI दस्तावेज़ प्रसंस्करण
**प्रौद्योगिकियाँ**: Azure AI Document Intelligence, Storage, Functions  
**जटिलता**: मध्यवर्ती  
**संकल्पनाएँ**: दस्तावेज़ विश्लेषण, OCR, डेटा निष्कर्षण

#### मशीन लर्निंग पाइपलाइन
**प्रौद्योगिकियाँ**: Azure ML, MLOps, Container Registry  
**जटिलता**: उन्नत  
**संकल्पनाएँ**: मॉडल प्रशिक्षण, तैनाती पाइपलाइन्स, मॉनिटरिंग

## 🛠 कॉन्फ़िगरेशन उदाहरण

The `configurations/` directory contains reusable components:

### पर्यावरण कॉन्फ़िगरेशन
- विकास पर्यावरण सेटिंग्स
- स्टेजिंग पर्यावरण कॉन्फ़िगरेशन
- प्रोडक्शन-तैयार कॉन्फ़िगरेशन
- मल्टी-रीजन तैनाती सेटअप

### Bicep मॉड्यूल
- पुन: प्रयोज्य अवसंरचना घटक
- सामान्य रिसोर्स पैटर्न
- सुरक्षा-हार्डन्ड टेम्पलेट्स
- लागत-अप्टिमाइज़्ड कॉन्फ़िगरेशन

### सहायक स्क्रिप्ट्स
- पर्यावरण सेटअप ऑटोमेशन
- डेटाबेस माइग्रेशन स्क्रिप्ट्स
- तैनाती सत्यापन उपकरण
- लागत मॉनिटरिंग यूटिलिटीज

## 🔧 अनुकूलन मार्गदर्शिका

### अपने उपयोग मामले के लिए उदाहरणों को अनुकूलित करना

1. **आवश्यकताएँ देखें**
   - Azure सेवा आवश्यकताओं की जाँच करें
   - सब्सक्रिप्शन लिमिट्स सत्यापित करें
   - लागत प्रभाव समझें

2. **कॉन्फ़िगरेशन संशोधित करें**
   - `azure.yaml` सेवा परिभाषाओं को अपडेट करें
   - Bicep टेम्पलेट्स को कस्टमाइज़ करें
   - पर्यावरण चर समायोजित करें

3. **पूरी तरह परीक्षण करें**
   - पहले विकास पर्यावरण में तैनात करें
   - कार्यक्षमता सत्यापित करें
   - स्केलिंग और प्रदर्शन का परीक्षण करें

4. **सुरक्षा समीक्षा**
   - एक्सेस कंट्रोल की समीक्षा करें
   - सीक्रेट्स मैनेजमेंट लागू करें
   - मॉनिटरिंग और अलर्टिंग सक्षम करें

## 📊 तुलना मैट्रिक्स

| उदाहरण | सेवाएँ | डेटाबेस | प्रमाणीकरण | मॉनिटरिंग | जटिलता |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (स्थानीय) | 2 | ❌ | Key Vault | पूर्ण | ⭐⭐ |
| **Python Flask API** (स्थानीय) | 1 | ❌ | बुनियादी | पूर्ण | ⭐ |
| **Microservices** (स्थानीय) | 5+ | ✅ | एंटरप्राइज़ | उन्नत | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | बुनियादी | बुनियादी | ⭐ |
| React SPA + Functions | 3 | ✅ | बुनियादी | पूर्ण | ⭐ |
| Python Flask Container | 2 | ❌ | बुनियादी | पूर्ण | ⭐ |
| C# Web API + SQL | 2 | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Java Microservices | 5+ | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | पूर्ण | पूर्ण | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | बुनियादी | पूर्ण | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | पूर्ण | पूर्ण | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (स्थानीय) | **8+** | **✅** | **एंटरप्राइज़** | **उन्नत** | **⭐⭐⭐⭐** |

## 🎓 सीखने का मार्ग

### अनुशंसित प्रगति

1. **सरल वेब ऐप से शुरू करें**
   - मूल AZD अवधारणाएँ सीखें
   - तैनाती वर्कफ़्लो समझें
   - पर्यावरण प्रबंधन का अभ्यास करें

2. **स्थिर वेबसाइट आज़माएं**
   - विभिन्न होस्टिंग विकल्पों का अन्वेषण करें
   - CDN एकीकरण के बारे में जानें
   - DNS कॉन्फ़िगरेशन समझें

3. **कंटेनर ऐप पर जाएँ**
   - कंटेनरीकरण के मूल सिद्धांत सीखें
   - स्केलिंग अवधारणाएँ समझें
   - Docker के साथ अभ्यास करें

4. **डेटाबेस एकीकरण जोड़ें**
   - डेटाबेस प्रोविजनिंग सीखें
   - कनेक्शन स्ट्रिंग्स समझें
   - सीक्रेट्स मैनेजमेंट का अभ्यास करें

5. **सर्वरलेस का पता लगाएँ**
   - इवेंट-ड्रिवन आर्किटेक्चर समझें
   - ट्रिगर्स और बाइंडिंग के बारे में जानें
   - APIs के साथ अभ्यास करें

6. **माइक्रोसर्विसेज बनाएँ**
   - सेवा संचार सीखें
   - वितरित सिस्टम समझें
   - जटिल तैनातियों का अभ्यास करें

## 🔍 सही उदाहरण ढूँढना

### प्रौद्योगिकी स्टैक द्वारा
- **Container Apps**: [Python Flask API (स्थानीय)](../../../examples/container-app/simple-flask-api), [Microservices (स्थानीय)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (स्थानीय)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (स्थानीय)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (स्थानीय)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (स्थानीय)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (स्थानीय)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (स्थानीय)](../../../examples/container-app/simple-flask-api), [Microservices (स्थानीय)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (स्थानीय)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (स्थानीय)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Azure OpenAI Chat (स्थानीय)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (स्थानीय)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### आर्किटेक्चर पैटर्न द्वारा
- **Simple REST API**: [Python Flask API (स्थानीय)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (स्थानीय)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (स्थानीय)](../../../examples/container-app/simple-flask-api), [Microservices (स्थानीय)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (स्थानीय)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (स्थानीय)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### जटिलता स्तर द्वारा
- **शुरुआती**: [Python Flask API (स्थानीय)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **मध्यवर्ती**: **[Azure OpenAI Chat (स्थानीय)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **उन्नत**: ML Pipeline
- **एंटरप्राइज़ प्रोडक्शन-तैयार**: [Microservices (स्थानीय)](../../../examples/container-app/microservices) (मल्टी-सेवा संदेश कतार के साथ), **Retail Multi-Agent Solution** (ARM टेम्पलेट तैनाती के साथ पूरा मल्टी-एजेंट सिस्टम)

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
- [Node.js और PostgreSQL के साथ Todo ऐप](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API के साथ React वेब ऐप](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps जॉब](https://github.com/Azure-Samples/container-apps-jobs)
- [Java के साथ Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### सर्वोत्तम अभ्यास
- [Azure वेल-आर्किटेक्टेड फ़्रेमवर्क](https://learn.microsoft.com/en-us/azure/well-architected/)
- [क्लाउड एडॉप्शन फ्रेमवर्क](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 योगदान के उदाहरण

क्या आपके पास साझा करने के लिए कोई उपयोगी उदाहरण है? हम योगदान का स्वागत करते हैं!

### सबमिशन दिशानिर्देश
1. स्थापित डायरेक्टरी संरचना का पालन करें
2. व्यापक README.md शामिल करें
3. कॉन्फ़िगरेशन फ़ाइलों में टिप्पणियाँ जोड़ें
4. सबमिट करने से पहले पूरी तरह परीक्षण करें
5. लागत अनुमान और आवश्यकताएँ शामिल करें

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

**प्रो टिप**: अपने तकनीकी स्टैक से मेल खाने वाले सबसे सरल उदाहरण से शुरू करें, फिर धीरे-धीरे अधिक जटिल परिदृश्यों की ओर बढ़ें। हर उदाहरण पिछले उदाहरणों की अवधारणाओं पर निर्मित होता है!

## 🚀 शुरू करने के लिए तैयार?

### आपकी सीखने की राह

1. **पूर्ण शुरुआतकर्ता?** → [Flask API](../../../examples/container-app/simple-flask-api) से शुरू करें (⭐, 20 मिनट)
2. **क्या AZD का बुनियादी ज्ञान है?** → [Microservices](../../../examples/container-app/microservices) आज़माएँ (⭐⭐⭐⭐, 60 मिनट)
3. **AI ऐप्स बना रहे हैं?** → [Azure OpenAI Chat](../../../examples/azure-openai-chat) से शुरू करें (⭐⭐, 35 मिनट) या [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ घंटे) का पता लगाएँ
4. **क्या आपको विशिष्ट टेक स्टैक चाहिए?** → ऊपर दिए गए [सही उदाहरण ढूँढना](../../../examples) अनुभाग का उपयोग करें

### अगले कदम

- ✅ ऊपर दिए गए [आवश्यकताएँ](../../../examples) की समीक्षा करें
- ✅ अपनी कौशल स्तर के अनुरूप एक उदाहरण चुनें (देखें [जटिलता लेजेंड](../../../examples))
- ✅ तैनात करने से पहले उदाहरण के README को पूरी तरह पढ़ें
- ✅ परीक्षण के बाद `azd down` चलाने के लिए एक अनुस्मारक सेट करें
- ✅ GitHub Issues या Discussions के माध्यम से अपना अनुभव साझा करें

### मदद चाहिए?

- 📖 [FAQ](../resources/faq.md) - सामान्य प्रश्नों के उत्तर
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - तैनाती समस्याओं को ठीक करें
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - समुदाय से पूछें
- 📚 [Study Guide](../resources/study-guide.md) - अपनी पढ़ाई को मजबूत करें

---

**नेविगेशन**
- **📚 पाठ्यक्रम होम**: [AZD For Beginners](../README.md)
- **📖 अध्ययन सामग्री**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 संसाधन**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*अंतिम अपडेट: नवंबर 2025 | [समस्याएं रिपोर्ट करें](https://github.com/microsoft/AZD-for-beginners/issues) | [उदाहरणों में योगदान करें](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। हालाँकि हम सटीकता के लिए प्रयत्नशील हैं, कृपया ध्यान रखें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ और उसकी मूल भाषा को ही अधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सिफारिश की जाती है। हम इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->