# उदाहरणहरू - व्यावहारिक AZD टेम्प्लेट र कन्फिगरेशन्स

**उदाहरणबाट सिक्ने - अध्यायअनुसार व्यवस्थित**
- **📚 कोर्स गृहपृष्ठ**: [AZD For Beginners](../README.md)
- **📖 अध्याय नक्शा**: सिकाइ जटिलता अनुसार उदाहरणहरू व्यवस्थित
- **🚀 स्थानीय उदाहरण**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 बाह्य AI उदाहरणहरू**: Azure Samples रिपोजिटरीहरूका लिङ्कहरू

> **📍 महत्वपूर्ण: स्थानीय बनाम बाह्य उदाहरणहरू**  
> यस रिपोजिटरीमा पूर्ण कार्यान्वयन सहित **4 वटा पूर्ण स्थानीय उदाहरणहरू** समावेश छन्:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 परिनियोजन च्याट इन्टरफेस सहित)  
> - **Container Apps** (साधारण Flask API + माइक्रोसर्भिसहरू)  
> - **Database App** (वेब + SQL डेटाबेस)  
> - **Retail Multi-Agent** (उद्यम स्तरको AI समाधान)  
>  
> अतिरिक्त उदाहरणहरू **बाह्य सन्दर्भहरू** हुन् जुन Azure-Samples रिपोजिटरीहरूमा छन् जुन तपाईं क्लोन गर्न सक्नुहुन्छ।

## परिचय

यो निर्देशिका प्रयोगात्मक उदहारणहरू र सन्दर्भहरू प्रदान गर्छ जसले तपाईंलाई व्यावहारिक अभ्यास मार्फत Azure Developer CLI सिक्न मद्दत गर्छ। Retail Multi-Agent परिदृश्य यो रिपोजिटरीमा समावेश गरिएको एक पूर्ण, उत्पादन-तयार कार्यान्वयन हो। अतिरिक्त उदाहरणहरूले विभिन्न AZD ढाँचाहरू प्रदर्शन गर्न आधिकारिक Azure Samples लाई सन्दर्भ गर्छन्।

### जटिलता रेटिंग लीजेन्ड

- ⭐ **सुरुवाती** - आधारभूत अवधारणाहरू, एकल सेवा, 15-30 मिनेट
- ⭐⭐ **मध्यम** - बहु सेवाहरू, डेटाबेस समाकरण, 30-60 मिनेट
- ⭐⭐⭐ **उन्नत** - जटिल आर्किटेक्चर, AI समावेशी, 1-2 घण्टा
- ⭐⭐⭐⭐ **विशेषज्ञ** - उत्पादन-तयार, उद्यम ढाँचाहरू, 2+ घण्टा

## 🎯 यस रिपोजिटरीमा के छ

### ✅ स्थानीय कार्यान्वयन (प्रयोग गर्न तयार)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**यस रिपोमा समावेश गरिएको च्याट इन्टरफेस सहितको पूर्ण gpt-4.1 परिनियोजन**

- **स्थान:** `examples/azure-openai-chat/`
- **जटिलता:** ⭐⭐ (मध्यम)
- **के समावेश छ:**
  - पूर्ण Microsoft Foundry Models परिनियोजन (gpt-4.1)
  - Python कमाण्ड-लाइन च्याट इन्टरफेस
  - सुरक्षित API कुञ्जीका लागि Key Vault समाकरण
  - Bicep पूर्वाधार टेम्प्लेटहरू
  - टोकन प्रयोग र लागत ट्र्याकिङ
  - दर सीमांकन र त्रुटि ह्यान्डलिङ

**छिटो सुरुवात:**
```bash
# उदाहरणमा जानुहोस्
cd examples/azure-openai-chat

# सबै तैनाथ गर्नुहोस्
azd up

# निर्भरता स्थापना गर्नुहोस् र कुराकानी सुरु गर्नुहोस्
pip install -r src/requirements.txt
python src/chat.py
```

**प्रविधिहरू:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**यस रिपोमा समावेश गरिएको व्यापक कन्टेनर परिनियोजन उदाहरणहरू**

- **स्थान:** `examples/container-app/`
- **जटिलता:** ⭐-⭐⭐⭐⭐ (सुरुवाती देखि उन्नतसम्म)
- **के समावेश छ:**
  - [Master Guide](container-app/README.md) - कन्टेनर परिनियोजनहरूको पूर्ण अवलोकन
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - आधारभूत REST API उदाहरण
  - [Microservices Architecture](../../../examples/container-app/microservices) - उत्पादन-तयार बहु-सेवा परिनियोजन
  - छिटो सुरुवात, उत्पादन, र उन्नत ढाँचाहरू
  - निगरानी, सुरक्षा, र लागत अप्टिमाइजेशन

**छिटो सुरुवात:**
```bash
# मास्टर मार्गदर्शिका हेर्नुहोस्
cd examples/container-app

# सरल Flask API तैनाथ गर्नुहोस्
cd simple-flask-api
azd up

# माइक्रोसर्भिस उदाहरण तैनाथ गर्नुहोस्
cd ../microservices
azd up
```

**प्रविधिहरू:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**यस रिपोमा समावेश गरिएको पूर्ण उत्पादन-तयार कार्यान्वयन**

- **स्थान:** `examples/retail-multiagent-arm-template/`
- **जटिलता:** ⭐⭐⭐⭐ (उन्नत)
- **के समावेश छ:**
  - पूर्ण ARM परिनियोजन टेम्प्लेट
  - बहु-एजेन्ट आर्किटेक्चर (ग्राहक + स्टक)
  - Microsoft Foundry Models समाकरण
  - RAG सहित AI Search
  - व्यापक निगरानी
  - एक-क्लिक परिनियोजन स्क्रिप्ट

**छिटो सुरुवात:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**प्रविधिहरू:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 बाह्य Azure Samples (क्लोन गरेर प्रयोग गर्नुहोस्)

तलका उदाहरणहरू आधिकारिक Azure-Samples रिपोजिटरीहरूमा सञ्चालित छन्। विभिन्न AZD ढाँचाहरू अन्वेषण गर्न तिनीहरूलाई क्लोन गर्नुहोस्:

### साधारण अनुप्रयोगहरू (अध्याय 1-2)

| टेम्पलेट | रिपोजिटरी | जटिलता | सेवाहरू |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [स्थानीय: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [स्थानीय: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | बहु-सेवा, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**कसरी प्रयोग गर्ने:**
```bash
# कुनै पनि उदाहरण क्लोन गर्नुहोस्
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# डिप्लोय गर्नुहोस्
azd up
```

### AI अनुप्रयोग उदाहरणहरू (अध्याय 2, 5, 8)

| टेम्पलेट | रिपोजिटरी | जटिलता | फोकस |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [स्थानीय: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 परिनियोजन |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | आधारभूत AI च्याट |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | एजेन्ट फ्रेमवर्क |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG ढाँचा |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | उद्यम AI |

### डेटाबेस र उन्नत ढाँचाहरू (अध्याय 3-8)

| टेम्पलेट | रिपोजिटरी | जटिलता | फोकस |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | डेटाबेस समाकरण |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL सर्भरलेस |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | बहु-सेवा |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## सिकाइ लक्ष्यहरू

यी उदाहरणहरू मार्फत काम गर्दा, तपाईं:
- वास्तविक अनुप्रयोग परिदृश्यहरूसँग Azure Developer CLI कार्यफ्लो अभ्यास गर्नुहुनेछ
- फरक अनुप्रयोग आर्किटेक्चरहरू र तिनका azd कार्यान्वयनहरू बुझ्नुहुनेछ
- विभिन्न Azure सेवाहरूका लागि Infrastructure as Code ढाँचाहरूमा मास्टरी हासिल गर्नु हुनेछ
- कन्फिगरेसन व्यवस्थापन र पर्यावरण-विशेष परिनियोजन रणनीतिहरू लागू गर्नु हुनेछ
- व्यावहारिक सन्दर्भहरूमा निगरानी, सुरक्षा, र स्केलिङ ढाँचाहरू लागू गर्नु हुनेछ
- वास्तविक परिनियोजन परिदृश्यहरूका लागि ट्रबलशुटिङ र डिबगिङमा अनुभव निर्माण गर्नु हुनेछ

## सिकाइ परिणामहरू

यी उदाहरणहरू पूरा गरेपछि, तपाईं सक्षम हुनुपर्नेछ:
- Azure Developer CLI प्रयोग गरेर विभिन्न अनुप्रयोग प्रकारहरू विश्वसनीय रूपमा परिनियोजन गर्न
- उपलब्ध टेम्प्लेटहरूलाई आफ्ना अनुप्रयोग आवश्यकताहरूमा अनुकूलन गर्न
- Bicep प्रयोग गरी कस्टम पूर्वाधार ढाँचाहरू डिजाइन र कार्यान्वयन गर्न
- ठ्याक्कै निर्भरता सहित जटिल बहु-सेवा अनुप्रयोगहरू कन्फिगर गर्न
- वास्तविक परिदृश्यहरूमा सुरक्षा, निगरानी, र प्रदर्शनका उत्तम अभ्यासहरू लागू गर्न
- व्यावहारिक अनुभवको आधारमा परिनियोजनहरू ट्रबलशुट र अनुकूलन गर्न

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

## छिटो सुरुवात उदाहरणहरू

> **💡 AZD मा नयाँ हुनुहुन्छ?** उदाहरण #1 (Flask API) बाट सुरु गर्नुहोस् - यो ~20 मिनेट लिन्छ र मुख्य अवधारणाहरू सिकाउँछ।

### सुरुवातीहरूको लागि
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (स्थानीय) ⭐  
   Scale-to-zero सहित साधारण REST API परिनियोजन गर्नुहोस्  
   **समय:** 20-25 मिनेट | **लागत:** $0-5/महिना  
   **तपाईंले सिक्नुहुनेछ:** आधारभूत azd कार्यफ्लो, कन्टेनरीकरण, स्वास्थ्य प्रोबहरू  
   **अपेक्षित नतिजा:** "Hello, World!" फर्काउने कार्यरत API एन्डपोइन्ट निरीक्षणसहित

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB सहित Node.js Express वेब अनुप्रयोग परिनियोजन गर्नुहोस्  
   **समय:** 25-35 मिनेट | **लागत:** $10-30/महिना  
   **तपाईंले सिक्नुहुनेछ:** डेटाबेस समाकरण, वातावरण चरहरू, कनेक्सन स्ट्रिङहरू  
   **अपेक्षित नतिजा:** सिर्जना/पढ्ने/अपडेट/मेटाउने कार्यक्षमता भएको Todo सूची एप

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps सँग React स्ट्याटिक वेबसाइट होस्ट गर्नुहोस्  
   **समय:** 20-30 मिनेट | **लागत:** $0-10/महिना  
   **तपाईंले सिक्नुहुनेछ:** स्ट्याटिक होस्टिंग, सर्भरलेस फंक्शन्स, CDN परिनियोजन  
   **अपेक्षित नतिजा:** API ब्याकएण्ड सहित React UI, स्वतः SSL, ग्लोबल CDN

### मध्यम स्तरका प्रयोगकर्ताहरूका लागि
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (स्थानीय) ⭐⭐  
   च्याट इन्टरफेस र सुरक्षित API कुञ्जी व्यवस्थापन सहित gpt-4.1 परिनियोजन गर्नुहोस्  
   **समय:** 35-45 मिनेट | **लागत:** $50-200/महिना  
   **तपाईंले सिक्नुहुनेछ:** Microsoft Foundry Models परिनियोजन, Key Vault समाकरण, टोकन ट्र्याकिङ  
   **अपेक्षित नतिजा:** gpt-4.1 र लागत निगरानी सहित कार्यरत च्याट अनुप्रयोग

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (स्थानीय) ⭐⭐⭐⭐  
   उत्पादन-तयार बहु-सेवा आर्किटेक्चर  
   **समय:** 45-60 मिनेट | **लागत:** $50-150/महिना  
   **तपाईंले सिक्नुहुनेछ:** सेवा संवाद, मेसेज क्युइङ, वितरित ट्रेसिङ  
   **अपेक्षित नतिजा:** मोनिटरिङ सहित 2-सेवा प्रणाली (API Gateway + Product Service)

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API र Azure SQL Database सहित वेब अनुप्रयोग  
   **समय:** 30-45 मिनेट | **लागत:** $20-80/महिना  
   **तपाईंले सिक्नुहुनेछ:** Entity Framework, डेटाबेस माइग्रेशन, कनेक्शन सुरक्षा  
   **अपेक्षित नतिजा:** Azure SQL ब्याकएण्डसहित C# API, स्वतः स्कीमा परिनियोजन

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ट्रिगर र Cosmos DB सहित Python Azure Functions  
   **समय:** 30-40 मिनेट | **लागत:** $10-40/महिना  
   **तपाईंले सिक्नुहुनेछ:** इभेन्ट-ड्रिभेन आर्किटेक्चर, सर्भरलेस स्केलिङ, NoSQL समाकरण  
   **अपेक्षित नतिजा:** HTTP अनुरोधहरूमा प्रतिक्रिया दिने र Cosmos DB मा भण्डारण गर्ने फंक्शन एप

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps र API गेटवे सहित बहु-सेवा Java अनुप्रयोग  
   **समय:** 60-90 मिनेट | **लागत:** $80-200/महिना  
   **तपाईंले सिक्नुहुनेछ:** Spring Boot परिनियोजन, सेवा मेश, लोड बैलेन्सिङ  
   **अपेक्षित नतिजा:** सेवा डिस्कभरी र राउटिङ सहित बहु-सेवा Java प्रणाली

### Microsoft Foundry टेम्प्लेटहरू

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   च्याट इन्टरफेस सहित पूर्ण gpt-4.1 परिनियोजन  
   **समय:** 35-45 मिनेट | **लागत:** $50-200/महिना  
   **अपेक्षित नतिजा:** टोकन ट्र्याकिङ र लागत निगरानी सहित कार्यरत च्याट अनुप्रयोग

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG आर्किटेक्चर सहित बौद्धिक च्याट अनुप्रयोग  
   **समय:** 60-90 मिनेट | **लागत:** $100-300/महिना  
   **अपेक्षित नतिजा:** कागजात खोज र उद्धरणहरू सहित RAG-शक्ति च्याट इन्टरफेस

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI सेवाहरू प्रयोग गरी कागजात विश्लेषण  
   **समय:** 40-60 मिनेट | **लागत:** $20-80/महिना  
   **अपेक्षित नतिजा:** अपलोड गरिएका कागजातबाट टेक्स्ट, तालिका, र एण्टिटीहरू निकाल्ने API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning सहित MLOps कार्यप्रवाह  
   **समय:** 2-3 घण्टा | **लागत:** $150-500/महिना  
   **अपेक्षित नतिजा:** प्रशिक्षण, परिनियोजन, र निगरानी सहित स्वचालित ML पाइपलाइन

### वास्तविक-विश्व परिदृश्यहरू

#### **Retail Multi-Agent Solution** 🆕
**[पूर्ण कार्यान्वयन गाइड](./retail-scenario.md)**

एक व्यापक, उत्पादन-तयार बहु-एजेन्ट ग्राहक समर्थन समाधान जसले AZD सँग उद्यम-स्तरको AI अनुप्रयोग परिनियोजन प्रदर्शन गर्छ। यो परिदृश्यले प्रदान गर्छ:
- **पूर्ण वास्तुकला**: विशेषीकृत ग्राहक सेवा र सूची व्यवस्थापन एजेन्टहरूसँग बहु-एजेन्ट प्रणाली
- **उत्पादन पूर्वाधार**: बहु-क्षेत्र Microsoft Foundry Models तैनातीहरू, AI Search, Container Apps, र व्यापक निगरानी
- **तैनाथ गर्न तयार ARM टेम्पलेट**: एक-क्लिक तैनाती धेरै कन्फिगरेसन मोडहरूसहित (Minimal/Standard/Premium)
- **उन्नत सुविधाहरू**: रेड-टीमिङ सुरक्षा प्रमाणीकरण, एजेन्ट मूल्याङ्कन फ्रेमवर्क, लागत अनुकूलन, र समस्या निवारण मार्गनिर्देशहरू
- **वास्तविक व्यापार सन्दर्भ**: फाइल अपलोड, खोज एकीकरण, र गतिशील स्केलिङ्ग सहित खुद्रा विक्रेता ग्राहक समर्थन प्रयोग मामला

**प्रविधिहरू**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**जटिलता**: ⭐⭐⭐⭐ (उन्नत - एंटरप्राइज उत्पादनका लागि तयार)

**उपयुक्त**: AI विकासकर्ता, सोलुसन आर्किटेक्टहरू, र उत्पादन बहु-एजेन्ट प्रणालीहरू बनाउने टोलीहरू

**छिटो सुरु**: सहितको ARM टेम्पलेट प्रयोग गरेर `./deploy.sh -g myResourceGroup` मार्फत पूर्ण समाधान 30 मिनेट भन्दा कममा तैनाथ गर्नुहोस्

## 📋 प्रयोग निर्देशनहरू

### पूर्वशर्तहरू

Before running any example:
- ✅ Azure सदस्यता जसमा Owner वा Contributor पहुँच छ
- ✅ Azure Developer CLI स्थापना गरिएको ([इन्स्टलेशन गाइड](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop चलिरहेको (कन्टेनर उदाहरणहरूका लागि)
- ✅ उपयुक्त Azure क्वोटाहरू (उदाहरण-विशिष्ट आवश्यकता जाँच गर्नुहोस्)

> **💰 लागत चेतावनी:** सबै उदाहरणहरूले वास्तविक Azure स्रोतहरू सिर्जना गर्दछन् जसले शुल्क लाग्छ। लागत अनुमानहरूका लागि व्यक्तिगत README फाइलहरू हेर्नुहोस्। जारी खर्चबाट बच्न सकेपछि `azd down` चलाउन नबिर्सनुहोस्।

### उदाहरणहरू स्थानीय रूपमा चलाउने

1. **उदाहरण क्लोन वा प्रतिलिपि गर्नुहोस्**
   ```bash
   # इच्छित उदाहरणमा जानुहोस्
   cd examples/simple-web-app
   ```

2. **AZD वातावरण आरम्भ गर्नुहोस्**
   ```bash
   # अस्तित्वमा रहेको टेम्पलेटसँग प्रारम्भ गर्नुहोस्
   azd init
   
   # वा नयाँ वातावरण सिर्जना गर्नुहोस्
   azd env new my-environment
   ```

3. **वातावरण कन्फिगर गर्नुहोस्**
   ```bash
   # आवश्यक भेरिएबलहरू सेट गर्नुहोस्
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **तैनाथ गर्नुहोस्**
   ```bash
   # पूर्वाधार र अनुप्रयोग तैनाथ गर्नुहोस्
   azd up
   ```

5. **तैनाती प्रमाणित गर्नुहोस्**
   ```bash
   # सेवा अन्त्यबिन्दुहरू प्राप्त गर्नुहोस्
   azd env get-values
   
   # अन्त्यबिन्दु परीक्षण गर्नुहोस् (उदाहरण)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **अपेक्षित सफल संकेतकहरू:**
   - ✅ `azd up` त्रुटिहरू बिना पूरा हुन्छ
   - ✅ सेवा एन्डप्वाइन्टले HTTP 200 फिर्ता गर्दछ
   - ✅ Azure Portal ले "Running" स्थिति देखाउँछ
   - ✅ Application Insights टेलिमेट्री प्राप्त गर्दैछ

> **⚠️ समस्याहरू?** तैनाती समस्या निवारणका लागि [सामान्य समस्याहरू](../docs/chapter-07-troubleshooting/common-issues.md) हेर्नुहोस्

### उदाहरणहरू अनुकूलन

Each example includes:
- **README.md** - विस्तृत सेटअप र अनुकूलन निर्देशनहरू
- **azure.yaml** - टिप्पणीसहितको AZD कन्फिगरेसन
- **infra/** - प्यारामिटर व्याख्याका साथ Bicep टेम्पलेटहरू
- **src/** - नमूना एप्लिकेशन कोड
- **scripts/** - सामान्य कार्यहरूको लागि सहायक स्क्रिप्टहरू

## 🎯 सिक्ने लक्ष्यहरू

### उदाहरण श्रेणीहरू

#### **Basic Deployments**
- एकल-सेवा अनुप्रयोगहरू
- साधारण पूर्वाधार ढाँचा
- मूल कन्फिगरेसन व्यवस्थापन
- लागत-प्रभावी विकास सेटअपहरू

#### **Advanced Scenarios**
- बहु-सेवा वास्तुकलाहरू
- जटिल नेटवर्किङ कन्फिगरेसनहरू
- डेटाबेस एकीकरण ढाँचाहरू
- सुरक्षा र अनुपालन कार्यान्वयनहरू

#### **Production-Ready Patterns**
- उच्च उपलब्धता कन्फिगरेसनहरू
- निगरानी र अवलोकनशीलता
- CI/CD एकीकरण
- बिपद् पुनरुद्धार सेटअपहरू

## 📖 उदाहरण विवरणहरू

### Simple Web App - Node.js Express
**प्रविधिहरू**: Node.js, Express, MongoDB, Container Apps  
**जटिलता**: आरम्भिक  
**अवधारणाहरू**: मूल तैनाती, REST API, NoSQL डेटाबेस एकीकरण

### Static Website - React SPA
**प्रविधिहरू**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**जटिलता**: आरम्भिक  
**अवधारणाहरू**: स्टेटिक होस्टिङ, सर्वरलेस ब्याकएन्ड, आधुनिक वेब विकास

### Container App - Python Flask
**प्रविधिहरू**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**जटिलता**: आरम्भिक  
**अवधारणाहरू**: कन्टेनराइजेशन, REST API, scale-to-zero, स्वास्थ्य जाँचहरू, निगरानी  
**स्थान**: [स्थानीय उदाहरण](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**प्रविधिहरू**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**जटिलता**: उन्नत  
**अवधारणाहरू**: बहु-सेवा वास्तुकला, सेवा संचार, संदेश कतार, वितरित ट्रेसिङ  
**स्थान**: [स्थानीय उदाहरण](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**प्रविधिहरू**: C# ASP.NET Core, Azure SQL Database, App Service  
**जटिलता**: मध्यम  
**अवधारणाहरू**: Entity Framework, डेटाबेस कनेक्सनहरू, वेब API विकास

### Serverless Function - Python Azure Functions
**प्रविधिहरू**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**जटिलता**: मध्यम  
**अवधारणाहरू**: इभेन्ट-ड्राइभन वास्तुकला, सर्वरलेस कम्प्युटिङ, फुल-स्ट्याक विकास

### Microservices - Java Spring Boot
**प्रविधिहरू**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**जटिलता**: मध्यम  
**अवधारणाहरू**: माइक्रोसर्भिसेस संचार, वितरित प्रणालीहरू, एंटरप्राइज ढाँचाहरू

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**प्रविधिहरू**: Microsoft Foundry Models, Cognitive Search, App Service  
**जटिलता**: मध्यम  
**अवधारणाहरू**: RAG वास्तुकला, भेक्टर खोज, LLM एकीकरण

#### AI Document Processing
**प्रविधिहरू**: Azure AI Document Intelligence, Storage, Functions  
**जटिलता**: मध्यम  
**अवधारणाहरू**: कागजात विश्लेषण, OCR, डाटा निकासी

#### Machine Learning Pipeline
**प्रविधिहरू**: Azure ML, MLOps, Container Registry  
**जटिलता**: उन्नत  
**अवधारणाहरू**: मोडेल तालिम, तैनाती पाइपलाइनहरू, निगरानी

## 🛠 कन्फिगरेसन उदाहरणहरू

The `configurations/` directory contains reusable components:

### वातावरण कन्फिगरेसनहरू
- Development environment settings
- Staging environment configurations
- Production-ready configurations
- Multi-region deployment setups

### Bicep मोड्युलहरू
- पुन:प्रयोगयोग्य पूर्वाधार कम्पोनेन्टहरू
- सामान्य स्रोत ढाँचाहरू
- सुरक्षा-कठोर टेम्पलेटहरू
- लागत-अनुकूलित कन्फिगरेसनहरू

### सहायक स्क्रिप्टहरू
- वातावरण सेटअप अटोमेशन
- डेटाबेस माइग्रेशन स्क्रिप्टहरू
- तैनाती प्रमाणिकरण उपकरणहरू
- लागत निगरानी युटिलिटीज

## 🔧 अनुकूलन मार्गदर्शन

### तपाईंको प्रयोग मामला लागि उदाहरणहरू अनुकूलन गर्ने

1. **पूर्वशर्तहरू समीक्षा गर्नुहोस्**
   - Azure सेवा आवश्यकताहरू जाँच गर्नुहोस्
   - सदस्यता सीमाहरू पुष्टि गर्नुहोस्
   - लागत प्रभाव बुझ्नुहोस्

2. **कन्फिगरेसन परिमार्जन गर्नुहोस्**
   - `azure.yaml` सेवा परिभाषाहरू अद्यावधिक गर्नुहोस्
   - Bicep टेम्पलेटहरू अनुकूलन गर्नुहोस्
   - वातावरण चरहरू समायोजन गर्नुहोस्

3. **पूर्ण रूपमा परीक्षण गर्नुहोस्**
   - पहिले विकास वातावरणमा तैनाथ गर्नुहोस्
   - कार्यक्षमता प्रमाणीकरण गर्नुहोस्
   - स्केलिंग र प्रदर्शन परीक्षण गर्नुहोस्

4. **सुरक्षा समीक्षा गर्नुहोस्**
   - पहुँच नियन्त्रण समीक्षा गर्नुहोस्
   - रहस्य व्यवस्थापन कार्यान्वयन गर्नुहोस्
   - निगरानी र अलर्टिङ सक्षम गर्नुहोस्

## 📊 तुलना म्याट्रिक्स

| उदाहरण | सेवाहरू | डाटाबेस | प्रमाणीकरण | निगरानी | जटिलता |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (स्थानीय) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (स्थानीय) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (स्थानीय) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (स्थानीय) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 सिक्ने मार्ग

### सिफारिस गरिएको प्रगति

1. **सरल वेब एपबाट सुरु गर्नुहोस्**
   - आधारभूत AZD अवधारणाहरू जान्नुहोस्
   - तैनाती कार्यप्रवाह बुझ्नुहोस्
   - वातावरण व्यवस्थापन अभ्यास गर्नुहोस्

2. **स्टेटिक वेबसाइट प्रयास गर्नुहोस्**
   - विभिन्न होस्टिङ विकल्पहरू अन्वेषण गर्नुहोस्
   - CDN एकीकरणको बारेमा जान्नुस्
   - DNS कन्फिगरेसन बुझ्नुहोस्

3. **कन्टेनर एपमा सर्नुहोस्**
   - कन्टेनराइजेशनका आधारहरू जान्नुस्
   - स्केलिङ अवधारणाहरू बुझ्नुहोस्
   - Docker सँग अभ्यास गर्नुहोस्

4. **डेटाबेस एकीकरण थप्नुहोस्**
   - डेटाबेस provisioning सिक्नुहोस्
   - कनेक्सन स्ट्रिङहरू बुझ्नुहोस्
   - रहस्य व्यवस्थापन अभ्यास गर्नुहोस्

5. **सर्भरलेस अन्वेषण गर्नुहोस्**
   - इभेन्ट-ड्राइभन वास्तुकला बुझ्नुहोस्
   - ट्रिगरहरू र बाइन्डिङको बारेमा जान्नुस्
   - API हरूसँग अभ्यास गर्नुहोस्

6. **माइक्रोसर्भिसेस निर्माण गर्नुहोस्**
   - सेवा संचार सिक्नुहोस्
   - वितरित प्रणालीहरू बुझ्नुहोस्
   - जटिल तैनातीहरू अभ्यास गर्नुहोस्

## 🔍 उपयुक्त उदाहरण फेला पार्ने

### प्रविधि स्ट्याक अनुसार
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

### आर्किटेक्चर ढाँचा अनुसार
- **Simple REST API**: [Python Flask API (स्थानीय)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (स्थानीय)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (स्थानीय)](../../../examples/container-app/simple-flask-api), [Microservices (स्थानीय)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (स्थानीय)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (स्थानीय)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### जटिलता स्तर अनुसार
- **आरम्भिक**: [Python Flask API (स्थानीय)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **मध्यम**: **[Microsoft Foundry Models Chat (स्थानीय)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **उन्नत**: ML Pipeline
- **एंटरप्राइज उत्पादन-तयार**: [Microservices (स्थानीय)](../../../examples/container-app/microservices) (Multi-service with message queuing), **Retail Multi-Agent Solution** (पूर्ण बहु-एजेन्ट प्रणाली ARM टेम्पलेट तैनातीसँग)

## 📚 अतिरिक्त स्रोतहरू

### Documentation Links
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community Examples
- [Azure Samples AZD टेम्पलेटहरू](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry टेम्पलेटहरू](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI ग्यालरी](https://azure.github.io/awesome-azd/)
- [C# र Azure SQL सहित Todo एप](https://github.com/Azure-Samples/todo-csharp-sql)
- [Python र MongoDB सहित Todo एप](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js र PostgreSQL सहित Todo एप](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API सहित React वेब एप](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps कार्य](https://github.com/Azure-Samples/container-apps-jobs)
- [Java सहित Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### सर्वोत्तम अभ्यासहरू
- [Azure Well-Architected फ्रेमवर्क](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption फ्रेमवर्क](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 उदाहरणहरूमा योगदान

कुनै उपयोगी उदाहरण साझा गर्न चाहनुहुन्छ? हामी योगदानहरू स्वागत गर्दछौं!

### पेश गर्ने दिशानिर्देशहरू
1. स्थापना गरिएको निर्देशिका संरचनालाई पालन गर्नुहोस्
2. व्यापक README.md समावेश गर्नुहोस्
3. कन्फिगरेसन फाइलहरूमा टिप्पणीहरू थप्नुहोस्
4. पेश गर्नु अघि राम्रोसँग परीक्षण गर्नुहोस्
5. लागत अनुमान र पूर्वापेक्षाहरू समावेश गर्नुहोस्

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

**प्रो टिप**: आफ्नो प्रविधि स्ट्याकसँग मेल खाने सबैभन्दा साधा उदाहरणबाट सुरु गर्नुहोस्, त्यसपछि क्रमिक रूपमा बढी जटिल परिदृश्यहरूतर्फ अघि बढ्नुहोस्। प्रत्येक उदाहरणले अघिल्ला उदाहरणहरूका अवधारणाहरूमा आधारित हुन्छ!

## 🚀 सुरु गर्न तयार?

### तपाईंको सिकाइ मार्ग

1. **पूर्ण शुरुवाती?** → सुरु गर्नुहोस् [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 मिनेट)
2. **के तपाईंसँग आधारभूत AZD ज्ञान छ?** → प्रयास गर्नुहोस् [माइक्रोसर्भिसहरू](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 मिनेट)
3. **एआई एपहरू बनाउँदै हुनुहुन्छ?** → सुरु गर्नुहोस् [Microsoft Foundry मोडेल च्याट](../../../examples/azure-openai-chat) (⭐⭐, 35 मिनेट) वा अन्वेषण गर्नुहोस् [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ घण्टा)
4. **विशिष्ट प्रविधि स्ट्याक चाहिन्छ?** → प्रयोग गर्नुहोस् [सही उदाहरण खोज्ने](../../../examples) सेक्सन माथि

### अर्को कदमहरू

- ✅ माथिको [पूर्वापेक्षाहरू](../../../examples) समीक्षा गर्नुहोस्
- ✅ आफ्नो कौशल स्तरसँग मेल खाने उदाहरण छान्नुहोस् (हेर्नुहोस् [जटिलता लेजेन्ड](../../../examples))
- ✅ डिप्लोय गर्नु अघि उदाहरणको README राम्ररी पढ्नुहोस्
- ✅ परीक्षण पछि `azd down` चलाउन सम्झना सेट गर्नुहोस्
- ✅ आफ्नो अनुभव GitHub Issues वा Discussions मार्फत साझा गर्नुहोस्

### मद्दत चाहिन्छ?

- 📖 [FAQ](../resources/faq.md) - साधारण प्रश्नहरूको जवाफ दिइएको छ
- 🐛 [समस्या समाधान मार्गदर्शक](../docs/chapter-07-troubleshooting/common-issues.md) - डिप्लोयमेन्ट समस्या समाधान गर्न
- 💬 [GitHub चर्चाहरू](https://github.com/microsoft/AZD-for-beginners/discussions) - समुदायसँग प्रश्न गर्नुहोस्
- 📚 [अध्ययन मार्गदर्शिका](../resources/study-guide.md) - आफ्नो सिकाइ सुदृढ गर्नुहोस्

---

**नेभिगेसन**
- **📚 कोर्स गृहपृष्ठ**: [AZD For Beginners](../README.md)
- **📖 अध्ययन सामग्रीहरू**: [अध्ययन मार्गदर्शिका](../resources/study-guide.md) | [छिटो सन्दर्भ](../resources/cheat-sheet.md) | [शब्दावली](../resources/glossary.md)
- **🔧 स्रोतहरू**: [FAQ](../resources/faq.md) | [समस्या समाधान मार्गदर्शक](../docs/chapter-07-troubleshooting/common-issues.md)

---

*अन्तिम अद्यावधिक: नोभेम्बर 2025 | [समस्या रिपोर्ट गर्नुहोस्](https://github.com/microsoft/AZD-for-beginners/issues) | [उदाहरणहरू योगदान गर्नुहोस्](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज एआई अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयासरत भए तापनि कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुन सक्छ। मूल भाषामा रहेको दस्तावेजलाई नै अधिकारिक स्रोत मानिनु पर्छ। महत्वपूर्ण सूचनाका लागि पेशेवर मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->