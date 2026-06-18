# उदाहरणहरू - व्यावहारिक AZD टेम्पलेटहरू र कन्फिगरेसनहरू

**उदाहरण मार्फत सिकाइ - अध्याय अनुसार व्यवस्थित**
- **📚 पाठ्यक्रम गृह**: [AZD आरम्भकर्ताहरूका लागि](../README.md)
- **📖 अध्याय नक्सा**: सिकाइ जटिलता अनुसार व्यवस्थित उदाहरणहरू
- **🚀 स्थानीय उदाहरण**: [रिटेल बहु-एजेन्ट समाधान](retail-scenario.md)
- **🤖 बाह्य AI उदाहरणहरू**: Azure Samples रिपोजिटरीहरूको लिङ्कहरू

> **📍 महत्त्वपूर्ण: स्थानीय बनाम बाह्य उदाहरणहरू**  
> यो रिपोजिटरीमा पूर्ण कार्यान्वयनसहित **4 पूरा स्थानीय उदाहरणहरू** छन्:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 डेप्लोइमेन्ट च्याट इन्टरफेस सहित)  
> - **Container Apps** (सिम्पल Flask API + माइक्रोसर्भिसहरू)  
> - **Database App** (वेब + SQL डेटाबेस)  
> - **Retail Multi-Agent** (उद्योग-स्तर AI समाधान)  
>  
> थप उदाहरणहरू क्लोन गर्न मिल्ने Azure-Samples रिपोजिटरीहरूतिरका **बाह्य सन्दर्भहरू** हुन्।

## परिचय

यो निर्देशिकाले व्यावहारिक उदाहरणहरू र सन्दर्भहरू प्रदान गर्छ जसले तपाईंलाई हातेमालो अभ्यास मार्फत Azure Developer CLI सिक्न मद्दत गर्छ। रिटेल बहु-एजेन्ट परिदृश्य यस रिपोमा समावेश गरिएको पूर्ण, उत्पादन-तयार कार्यान्वयन हो। थप उदाहरणहरू आधिकारिक Azure Samples लाई सन्दर्भ गर्छन् जसले विभिन्न AZD ढाँचाहरू देखाउँछन्।

### जटिलता मूल्याङ्कन संकेतक

- ⭐ **शुरुआती** - आधारभूत अवधारणाहरू, एकल सेवा, 15-30 मिनेट
- ⭐⭐ **मध्यम** - बहु सेवाहरू, डाटाबेस एकीकरण, 30-60 मिनेट
- ⭐⭐⭐ **उन्नत** - जटिल आर्किटेक्चर, AI एकीकरण, 1-2 घण्टा
- ⭐⭐⭐⭐ **विशेषज्ञ** - उत्पादन-तयार, उद्यम स्तरका ढाँचाहरू, 2+ घण्टा

## 🎯 यो रिपोजिटरीमा साँच्चिकै के छ

### ✅ स्थानीय कार्यान्वयन (प्रयोगका लागि तयार)

#### [Microsoft Foundry Models Chat अनुप्रयोग](azure-openai-chat/README.md) 🆕
**यो रिपोमा समावेश गरिएको च्याट इन्टरफेस सहित पूर्ण gpt-4.1 डेप्लोइमेन्ट**

- **स्थान:** `examples/azure-openai-chat/`
- **जटिलता:** ⭐⭐ (मध्यम)
- **के समावेश छ:**
  - पूर्ण Microsoft Foundry Models डेप्लोइमेन्ट (gpt-4.1)
  - Python कमाण्ड-लाइन च्याट इन्टरफेस
  - सुरक्षित API कुञ्जीहरूको लागि Key Vault एकीकरण
  - Bicep इन्फ्रास्ट्रक्चर टेम्पलेटहरू
  - टोकन प्रयोग र लागत ट्र्याकिङ
  - रेट लिमिटिङ र त्रुटि ह्यान्डलिङ

**द्रुत सुरु:**
```bash
# उदाहरणमा जानुहोस्
cd examples/azure-openai-chat

# सबै तैनाथ गर्नुहोस्
azd up

# आवश्यक निर्भरता स्थापना गरी कुराकानी सुरु गर्नुहोस्
pip install -r src/requirements.txt
python src/chat.py
```

**प्रविधिहरू:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App उदाहरणहरू](container-app/README.md) 🆕
**यस रिपोमा समावेश व्यापक कन्टेनर डेप्लोइमेन्ट उदाहरणहरू**

- **स्थान:** `examples/container-app/`
- **जटिलता:** ⭐-⭐⭐⭐⭐ (शुरुआतीदेखि उन्नतसम्म)
- **के समावेश छ:**
  - [Master Guide](container-app/README.md) - कन्टेनर डेप्लोइमेन्टहरूको पूर्ण अवलोकन
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - आधारभूत REST API उदाहरण
  - [Microservices Architecture](../../../examples/container-app/microservices) - उत्पादन-तयार बहु-सेवा डेप्लोइमेन्ट
  - छिटो सुरु, उत्पादन, र उन्नत ढाँचाहरू
  - अनुगमन, सुरक्षा, र लागत अनुकूलन

**द्रुत सुरु:**
```bash
# मास्टर गाइड हेर्नुहोस्
cd examples/container-app

# सरल Flask API तैनाथ गर्नुहोस्
cd simple-flask-api
azd up

# माइक्रोसर्भिसहरूको उदाहरण तैनाथ गर्नुहोस्
cd ../microservices
azd up
```

**प्रविधिहरू:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [रिटेल बहु-एजेन्ट समाधान](retail-scenario.md) 🆕
**यस रिपोमा समावेश पूर्ण उत्पादन-तयार कार्यान्वयन**

- **स्थान:** `examples/retail-multiagent-arm-template/`
- **जटिलता:** ⭐⭐⭐⭐ (उन्नत)
- **के समावेश छ:**
  - पूरा ARM डेप्लोइमेन्ट टेम्पलेट
  - बहु-एजेन्ट आर्किटेक्चर (Customer + Inventory)
  - Microsoft Foundry Models एकीकरण
  - RAG सहित AI Search
  - व्यापक अनुगमन
  - एक-क्लिक डेप्लोइमेन्ट स्क्रिप्ट

**द्रुत सुरु:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**प्रविधिहरू:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 बाह्य Azure नमुना (क्लोन गरेर प्रयोग गर्नुहोस्)

तलका उदाहरणहरू आधिकारिक Azure-Samples रिपोजिटरीहरूमा मर्मत गरिएको छन्। विभिन्न AZD ढाँचाहरू अन्वेषण गर्न तिनीहरूलाई क्लोन गर्नुहोस्:

### सरल अनुप्रयोगहरू (अध्याय 1-2)

| टेम्पलेट | रिपोजिटरी | जटिलता | सेवाहरू |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [स्थानीय: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **माइक्रोसर्भिसहरू** | [स्थानीय: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**कसरी प्रयोग गर्ने:**
```bash
# कुनै पनि उदाहरण क्लोन गर्नुहोस्
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# परिनियोजन गर्नुहोस्
azd up
```

### AI अनुप्रयोग उदाहरणहरू (अध्याय 2, 5, 8)

| टेम्पलेट | रिपोजिटरी | जटिलता | फोकस |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [स्थानीय: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 डेप्लोइमेन्ट |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | आधारभूत AI च्याट |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | एजेन्ट फ्रेमवर्क |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG ढाँचा |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | उद्यम AI |

### डाटाबेस र उन्नत ढाँचाहरू (अध्याय 3-8)

| टेम्पलेट | रिपोजिटरी | जटिलता | फोकस |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | डाटाबेस एकीकरण |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL सर्भरलेस |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | बहु-सेवा |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## सिकाइ लक्ष्यहरू

यी उदाहरणहरू मार्फत काम गर्दा, तपाईंले:
- वास्तविक अनुप्रयोग परिदृश्यहरूसँग Azure Developer CLI कार्यप्रवाहहरू अभ्यास गर्नुहुनेछ
- विभिन्न अनुप्रयोग आर्किटेक्चर र तिनीहरूको azd कार्यान्वयनहरू बुझ्नुहुनेछ
- विभिन्न Azure सेवाहरूका लागि Infrastructure as Code ढाँचाहरूमा निपुणता हासिल गर्नुहुनेछ
- कन्फिगरेसन व्यवस्थापन र वातावरण-विशिष्ट डेप्लोइमेन्ट रणनीतिहरू लागू गर्नुहुनेछ
- व्यावहारिक सन्दर्भहरूमा अनुगमन, सुरक्षा, र स्केलिङ ढाँचाहरू कार्यान्वयन गर्नुहुनेछ
- वास्तविक डेप्लोइमेन्ट परिदृश्यहरूमा ट्रबलशुटिङ र डिबगिङको अनुभव सङ्ग्रह गर्नुहुनेछ

## सिकाइ नतिजाहरू

यी उदाहरणहरू पूरा गर्दा, तपाईं सक्षम हुनुहुनेछ:
- Azure Developer CLI प्रयोग गरेर विविध प्रकारका अनुप्रयोगहरू आत्मविश्वाससाथ डिप्लोय गर्न
- उपलब्ध टेम्पलेटहरूलाई आफ्नो अनुप्रयोग आवश्यकताहरूअनुसार अनुकूलित गर्न
- Bicep प्रयोग गरेर अनुकूलित इन्फ्रास्ट्रक्चर ढाँचाहरू डिजाइन र कार्यान्वयन गर्न
- उचित निर्भरताहरू सहित जटिल बहु-सेवा अनुप्रयोगहरू कन्फिगर गर्न
- वास्तविक परिदृश्यहरूमा सुरक्षा, अनुगमन, र प्रदर्शनका उत्तम अभ्यासहरू लागू गर्न
- व्यावहारिक अनुभवको आधारमा डिप्लोइमेन्टहरू ट्रबलशुट र अनुकूलन गर्न

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

## छिटो सुरु उदाहरणहरू

> **💡 AZD मा नयाँ?** उदाहरण #1 (Flask API) बाट सुरु गर्नुहोस् - यसले लगभग 20 मिनेट लिन्छ र मुख्य अवधारणाहरू सिकाउँछ।

### शुरुवातीहरूका लागि
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (स्थानीय) ⭐  
   स्केल-टु-जीरो सहित साधारण REST API डिप्लोय गर्नुहोस्  
   **समय:** 20-25 मिनेट | **लागत:** $0-5/महिना  
   **तपाईंले सिक्नुहुनेछ:** आधारभूत azd कार्यप्रवाह, कन्टेनराइजेशन, स्वास्थ्य प्रोबहरू  
   **अपेक्षित परिणाम:** "Hello, World!" फर्काउने र अनुगमन सहित काम गर्ने API एन्डपोइन्ट

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Node.js Express वेब अनुप्रयोग MongoDB सँग डिप्लोय गर्नुहोस्  
   **समय:** 25-35 मिनेट | **लागत:** $10-30/महिना  
   **तपाईंले सिक्नुहुनेछ:** डाटाबेस एकीकरण, वातावरण भेरिएबलहरू, कनेक्शन स्ट्रिङहरू  
   **अपेक्षित परिणाम:** Todo सूची एप जसले सिर्जना/पढ्न/अपडेट/हटाउन कार्य गर्दछ

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps सँग React स्ट्याटिक वेबसाइट होस्ट गर्नुहोस्  
   **समय:** 20-30 मिनेट | **लागत:** $0-10/महिना  
   **तपाईंले सिक्नुहुनेछ:** स्ट्याटिक होस्टिङ, सर्भरलेस फंक्शन्स, CDN डिप्लोयमेन्ट  
   **अपेक्षित परिणाम:** API ब्याकएण्ड सहित React UI, स्वचालित SSL, ग्लोबल CDN

### मध्यम स्तरका प्रयोगकर्ताहरूका लागि
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (स्थानीय) ⭐⭐  
   gpt-4.1 च्याट इन्टरफेस र सुरक्षित API कुञ्जी व्यवस्थापनसहित डिप्लोय गर्नुहोस्  
   **समय:** 35-45 मिनेट | **लागत:** $50-200/महिना  
   **तपाईंले सिक्नुहुनेछ:** Microsoft Foundry Models डेप्लोइमेन्ट, Key Vault एकीकरण, टोकन ट्र्याकिङ  
   **अपेक्षित परिणाम:** gpt-4.1 र लागत अनुगमनसहित काम गर्ने च्याट अनुप्रयोग

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (स्थानीय) ⭐⭐⭐⭐  
   उत्पादन-तयार बहु-सेवा आर्किटेक्चर  
   **समय:** 45-60 मिनेट | **लागत:** $50-150/महिना  
   **तपाईंले सिक्नुहुनेछ:** सेवा संचार, मेसेज क्युइङ, वितरित ट्रेसिङ  
   **अपेक्षित परिणाम:** 2-सेवा प्रणाली (API Gateway + Product Service) अनुगमन सहित

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API र Azure SQL डेटाबेससहित वेब अनुप्रयोग  
   **समय:** 30-45 मिनेट | **लागत:** $20-80/महिना  
   **तपाईंले सिक्नुहुनेछ:** Entity Framework, डाटाबेस माइग्रेशन, कनेक्शन सुरक्षा  
   **अपेक्षित परिणाम:** Azure SQL ब्याकएण्डसहित C# API र स्वचालित स्कीमा डिप्लोयमेन्ट

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ट्रिगर्स र Cosmos DB सहित Python Azure Functions  
   **समय:** 30-40 मिनेट | **लागत:** $10-40/महिना  
   **तपाईंले सिक्नुहुनेछ:** इभेन्ट-ड्राइभेन आर्किटेक्चर, सर्भरलेस स्केलिङ, NoSQL एकीकरण  
   **अपेक्षित परिणाम:** Cosmos DB स्टोरेजसँग HTTP अनुरोधहरूमा प्रतिक्रिया दिने Function app

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps र API गेटवे सहित बहु-सेवा Java अनुप्रयोग  
   **समय:** 60-90 मिनेट | **लागत:** $80-200/महिना  
   **तपाईंले सिक्नुहुनेछ:** Spring Boot डिप्लोइमेन्ट, सेवा मेश, लोड बलान्सिङ  
   **अपेक्षित परिणाम:** सेवा डिस्कभरी र राउटिङसहित बहु-सेवा Java प्रणाली

### Microsoft Foundry टेम्पलेटहरू

1. **[Microsoft Foundry Models Chat App - स्थानीय उदाहरण](../../../examples/azure-openai-chat)** ⭐⭐  
   gpt-4.1 च्याट इन्टरफेस सहित पूर्ण डेप्लोइमेन्ट  
   **समय:** 35-45 मिनेट | **लागत:** $50-200/महिना  
   **अपेक्षित परिणाम:** टोकन ट्र्याकिङ र लागत अनुगमनसहित काम गर्ने च्याट अनुप्रयोग

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG आर्किटेक्चरसहित बौद्धिक च्याट अनुप्रयोग  
   **समय:** 60-90 मिनेट | **लागत:** $100-300/महिना  
   **अपेक्षित परिणाम:** कागजात खोज र उद्धरणसहित RAG-संचालित च्याट इन्टरफेस

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI सेवाहरू प्रयोग गरी कागजात विश्लेषण  
   **समय:** 40-60 मिनेट | **लागत:** $20-80/महिना  
   **अपेक्षित परिणाम:** अपलोड गरिएको कागजातबाट पाठ, तालिका, र एंटिटीहरू निकाल्ने API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning सहित MLOps कार्यप्रवाह  
   **समय:** 2-3 घण्टा | **लागत:** $150-500/महिना  
   **अपेक्षित परिणाम:** प्रशिक्षण, डिप्लोइमेन्ट, र अनुगमनसहित स्वचालित ML पाइपलाइन

### वास्तविक-विश्व परिदृश्यहरू

#### **रिटेल बहु-एजेन्ट समाधान** 🆕
**[पूर्ण कार्यान्वयन मार्गदर्शक](./retail-scenario.md)**

एक व्यापक, उत्पादन-तयार बहु-एजेन्ट ग्राहक समर्थन समाधान जसले AZD सँग उद्यम-स्तरका AI अनुप्रयोग डिप्लोइमेन्ट प्रदर्शित गर्छ। यस परिदृश्यले प्रदान गर्छ:

- **पूर्ण आर्किटेक्चर**: विशेषज्ञ ग्राहक सेवा र भण्डारण व्यवस्थापन एजेन्टहरूसहितको बहु-एजेन्ट प्रणाली
- **उत्पादन इन्फ्रास्ट्रक्चर**: बहु-क्षेत्र Microsoft Foundry Models परिनियोजनहरू, AI खोज, Container Apps, र व्यापक निगरानी
- **तत्काल परिनियोजन योग्य ARM टेम्प्लेट**: एक-क्लिक परिनियोजन बहु कन्फिगरेसन मोडहरूसँग (Minimal/Standard/Premium)
- **उन्नत सुविधाहरू**: रेड टिमिङ सुरक्षा मान्यकरण, एजेन्ट मूल्याङ्कन फ्रेमवर्क, लागत अनुकूलन, र समस्या निवारण मार्गनिर्देशहरू
- **वास्तविक व्यावसायिक सन्दर्भ**: खुद्रा ग्राहक समर्थन प्रयोग केस फाइल अपलोड, खोज एकीकरण, र गतिशील स्केलिङ सहित

**प्रविधिहरू**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**जटिलता**: ⭐⭐⭐⭐ (उन्नत - उद्यम उत्पादन तयार)

**र किन उपयुक्त**: AI डेभलपर्स, समाधान आर्किटेक्टहरू, र उत्पादन बहु-एजेन्ट प्रणालीहरू बनाउने टोलीहरूका लागि

**छिटो सुरुवात**: समावेश गरिएको ARM टेम्प्लेट प्रयोग गरेर `./deploy.sh -g myResourceGroup` मार्फत 30 मिनेटभित्र पूरा समाधान परिनियोजन गर्नुहोस्

## 📋 प्रयोग निर्देशनहरू

### पूर्वआवश्यकताहरू

कुनै पनि उदाहरण चलाउनु अघि:
- ✅ Azure सदस्यता जसमा Owner वा Contributor पहुँच छ
- ✅ Azure Developer CLI स्थापना गरिएको छ ([Installation Guide](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop चलिरहेको छ (container उदाहरणहरूका लागि)
- ✅ उपयुक्त Azure कोटा (उदाहरण-विशिष्ट आवश्यकताहरू जाँच गर्नुहोस्)

> **💰 लागत चेतावनी:** सबै उदाहरणहरूले वास्तविक Azure स्रोतहरू सिर्जना गर्छन् जसले शुल्क लाग्नेछ। लागत अनुमानहरूका लागि व्यक्तिगत README फाइलहरू हेर्नुहोस्। अनावश्यक लागतबाट बच्न काम सकिएपछि `azd down` चलाउन नबिर्सनुहोस्।

### स्थानीय रूपमा उदाहरणहरू चलाउने तरिका

1. **उदाहरण क्लोन वा प्रतिलिपि गर्नुहोस्**
   ```bash
   # इच्छित उदाहरणमा जानुहोस्
   cd examples/simple-web-app
   ```

2. **AZD वातावरण आरम्भ गर्नुहोस्**
   ```bash
   # अवस्थित टेम्पलेट प्रयोग गरेर आरम्भ गर्नुहोस्
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

4. **डिप्लॉय गर्नुहोस्**
   ```bash
   # पूर्वाधार र अनुप्रयोग तैनाथ गर्नुहोस्
   azd up
   ```

5. **परिनियोजन जाँच्नुहोस्**
   ```bash
   # सेवा अन्तबिन्दुहरू प्राप्त गर्नुहोस्
   azd env get-values
   
   # अन्तबिन्दु परीक्षण गर्नुहोस् (उदाहरण)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **अपेक्षित सफलताको संकेतहरू:**
   - ✅ `azd up` त्रुटिबिनै पूरा हुन्छ
   - ✅ सेवा endpoint ले HTTP 200 फर्काउँछ
   - ✅ Azure Portal मा "Running" स्थिति देखिन्छ
   - ✅ Application Insights टेलिमेट्री प्राप्त गर्दैछ

> **⚠️ समस्या आइरहेको छ?** परिनियोजन समस्या निवारणका लागि [Common Issues](../docs/chapter-07-troubleshooting/common-issues.md) हेर्नुहोस्

### उदाहरणहरू अनुकूलन गर्ने तरिका

प्रत्येक उदाहरणमा समावेश छ:
- **README.md** - विस्तृत सेटअप र अनुकूलन निर्देशनहरू
- **azure.yaml** - टिप्पणीसहितको AZD कन्फिगरेसन
- **infra/** - प्यारामिटर व्याख्याहरू सहित Bicep टेम्प्लेटहरू
- **src/** - नमुना अनुप्रयोग कोड
- **scripts/** - सामान्य कार्यहरूको लागि सहयोगी स्क्रिप्टहरू

## 🎯 सिकाइ उद्देश्यहरू

### उदाहरण वर्गीकरण

#### **बेसिक परिनियोजनहरू**
- एकल-सेवा अनुप्रयोगहरू
- सरल इन्फ्रास्ट्रक्चर ढाँचाहरू
- आधारभूत कन्फिगरेसन व्यवस्थापन
- लागत-कुशल विकास सेटअपहरू

#### **उन्नत परिदृश्य**
- बहु-सेवा आर्किटेक्चर्स
- जटिल नेटवर्किङ कन्फिगरेसनहरू
- डाटाबेस एकीकरण ढाँचाहरू
- सुरक्षा र अनुपालन कार्यान्वयनहरू

#### **उत्पादन-तय्यर ढाँचाहरू**
- उच्च उपलब्धता कन्फिगरेसनहरू
- निगरानी र अवलोकनयोग्यता
- CI/CD एकीकरण
- प्रकोप पुनः प्राप्ति सेटअपहरू

## 📖 उदाहरण विवरणहरू

### Simple Web App - Node.js Express
**प्रविधिहरू**: Node.js, Express, MongoDB, Container Apps  
**जटिलता**: शुरुवाती  
**अवधारणाहरू**: आधारभूत परिनियोजन, REST API, NoSQL डाटाबेस एकीकरण

### Static Website - React SPA
**प्रविधिहरू**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**जटिलता**: शुरुवाती  
**अवधारणाहरू**: स्थिर होस्टिङ, serverless ब्याकएन्ड, आधुनिक वेब विकास

### Container App - Python Flask
**प्रविधिहरू**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**जटिलता**: शुरुवाती  
**अवधारणाहरू**: कन्टेनरीकरण, REST API, scale-to-zero, हेल्थ probes, निगरानी  
**स्थान**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**प्रविधिहरू**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**जटिलता**: उन्नत  
**अवधारणाहरू**: बहु-सेवा आर्किटेक्चर, सेवा सञ्चार, मेसेज queuing, वितरित ट्रेसिङ  
**स्थान**: [Local Example](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**प्रविधिहरू**: C# ASP.NET Core, Azure SQL Database, App Service  
**जटिलता**: बीचको स्तर  
**अवधारणाहरू**: Entity Framework, डाटाबेस कनेक्शनहरू, वेब API विकास

### Serverless Function - Python Azure Functions
**प्रविधिहरू**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**जटिलता**: बीचको स्तर  
**अवधारणाहरू**: इभेन्ट-चालित आर्किटेक्चर, serverless कम्प्युटिङ, फुल-स्ट्याक विकास

### Microservices - Java Spring Boot
**प्रविधिहरू**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**जटिलता**: बीचको स्तर  
**अवधारणाहरू**: माइक्रोसर्भिसेस सञ्चार, वितरित प्रणालीहरू, उद्यम ढाँचाहरू

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**प्रविधिहरू**: Microsoft Foundry Models, Azure AI Search, App Service  
**जटिलता**: बीचको स्तर  
**अवधारणाहरू**: RAG आर्किटेक्चर, भेक्टर खोज, LLM एकीकरण

#### AI Document Processing
**प्रविधिहरू**: Azure AI Document Intelligence, Storage, Functions  
**जटिलता**: बीचको स्तर  
**अवधारणाहरू**: दस्तावेज विश्लेषण, OCR, डेटा निकाल्ने

#### Machine Learning Pipeline
**प्रविधिहरू**: Azure ML, MLOps, Container Registry  
**जटिलता**: उन्नत  
**अवधारणाहरू**: मोडेल तालिम, परिनियोजन पाइपलाइनहरू, निगरानी

## 🛠 कन्फिगरेसन उदाहरणहरू

`configurations/` निर्देशिकाले पुन:प्रयोगयोग्य कम्पोनेन्टहरू समावेश गर्छ:

### वातावरण कन्फिगरेसनहरू
- विकास वातावरण सेटिङहरू
- स्टेजिङ वातावरण कन्फिगरेसनहरू
- उत्पादन-तय्यर कन्फिगरेसनहरू
- बहु-क्षेत्र परिनियोजन सेटअपहरू

### Bicep Modules
- पुन:प्रयोगयोग्य इन्फ्रास्ट्रक्चर कम्पोनेन्टहरू
- सामान्य रिसोर्स ढाँचाहरू
- सुरक्षा-हॉर्डन्ड टेम्प्लेटहरू
- लागत-अनुकूलित कन्फिगरेसनहरू

### सहायक स्क्रिप्टहरू
- वातावरण सेटअप स्वचालन
- डाटाबेस माइग्रेसन स्क्रिप्टहरू
- परिनियोजन मान्यकरण उपकरणहरू
- लागत निगरानी युटिलिटीहरू

## 🔧 अनुकूलन मार्गदर्शन

### तपाईंको प्रयोग केसका लागि उदाहरणहरू अनुकूलन गर्ने तरिका

1. **पूर्वआवश्यकताहरू समीक्षा गर्नुहोस्**
   - Azure सेवा आवश्यकताहरू जाँच गर्नुहोस्
   - सदस्यता सीमा सत्यापित गर्नुहोस्
   - लागत प्रभावहरू बुझ्नुहोस्

2. **कन्फिगरेसन परिमार्जन गर्नुहोस्**
   - `azure.yaml` सेवाका परिभाषाहरू अपडेट गर्नुहोस्
   - Bicep टेम्प्लेटहरू अनुकूलन गर्नुहोस्
   - वातावरण भेरिएबलहरू समायोजन गर्नुहोस्

3. **परीक्षण गर्नुहोस्**
   - पहिले विकास वातावरणमा परिनियोजन गर्नुहोस्
   - कार्यक्षमता मान्य गर्नुहोस्
   - स्केलिङ र प्रदर्शन परीक्षण गर्नुहोस्

4. **सुरक्षा समीक्षा**
   - पहुँच नियन्त्रणहरू समीक्षा गर्नुहोस्
   - गोपनीयता व्यवस्थापन लागू गर्नुहोस्
   - निगरानी र अलर्टिङ सक्षम गर्नुहोस्

## 📊 तुलना तालिका

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 सिकाइ मार्ग

### सिफारिस गरिएको प्रगति

1. **Simple Web App बाट सुरु गर्नुहोस्**
   - आधारभूत AZD अवधारणाहरू सिक्नुहोस्
   - परिनियोजन वर्कफ्लो बुझ्नुहोस्
   - वातावरण व्यवस्थापन अभ्यास गर्नुहोस्

2. **Static Website प्रयास गर्नुहोस्**
   - विभिन्न होस्टिङ विकल्पहरू अन्वेषण गर्नुहोस्
   - CDN एकीकरणबारे सिक्नुहोस्
   - DNS कन्फिगरेसन बुझ्नुहोस्

3. **Container App तर्फ अघि बढ्नुहोस्**
   - कन्टेनरीकरणका आधारभूत कुरा सिक्नुहोस्
   - स्केलिङ अवधारणाहरू बुझ्नुहोस्
   - Docker सँग अभ्यास गर्नुहोस्

4. **डाटाबेस एकीकरण थप्नुहोस्**
   - डाटाबेस प्रोभीजनिङ सिक्नुहोस्
   - कनेक्शन स्ट्रिङहरू बुझ्नुहोस्
   - गोपनीयता व्यवस्थापन अभ्यास गर्नुहोस्

5. **Serverless अन्वेषण गर्नुहोस्**
   - इभेन्ट-चालित आर्किटेक्चर बुझ्नुहोस्
   - ट्रिगरहरू र बाइन्डिङहरूबारे सिक्नुहोस्
   - API हरूसँग अभ्यास गर्नुहोस्

6. **Microservices निर्माण गर्नुहोस्**
   - सेवा सञ्चार सिक्नुहोस्
   - वितरित प्रणालीहरू बुझ्नुहोस्
   - जटिल परिनियोजनहरू अभ्यास गर्नुहोस्

## 🔍 उचित उदाहरण कसरी फेला पार्ने

### प्रविधि स्ट्याक अनुसार
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### आर्किटेक्चर ढाँचाका अनुसार
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### जटिलता स्तर अनुसार
- **शुरुवाती**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **मध्यम**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **उन्नत**: ML Pipeline
- **उद्यम उत्पादन-तय्यर**: [Microservices (Local)](../../../examples/container-app/microservices) (मैसेज क्यूइङसहित बहु-सेवा), **Retail Multi-Agent Solution** (ARM टेम्प्लेट परिनियोजन सहित पूरा बहु-एजेन्ट सिस्टम)

## 📚 अतिरिक्त स्रोतहरू

### प्रलेखन लिंकहरू
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### समुदायका उदाहरणहरू
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React वेब एप (C# API सहित)](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps जॉब](https://github.com/Azure-Samples/container-apps-jobs)
- [Java सहित Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### उत्तम अभ्यासहरू
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 योगदान उदाहरणहरू

के तपाईंसँग साझेदारी गर्न उपयोगी उदाहरण छ? हामी योगदानहरू स्वागत गर्छौं!

### सबमिशन दिशानिर्देशहरू
1. निर्धारित डाइरेक्टरी संरचना अनुसरण गर्नुहोस्
2. व्यापक README.md समावेश गर्नुहोस्
3. कन्फिगरेसन फाइलहरूमा टिप्पणीहरू थप्नुहोस्
4. पेश गर्नु अघि पूर्ण रूपमा परीक्षण गर्नुहोस्
5. लागत अनुमान र पूर्वशर्तहरू समावेश गर्नुहोस्

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

**Pro Tip**: तपाइँको प्राविधिक स्ट्याकसँग मेल खाने सबैभन्दा सरल उदाहरणबाट सुरु गर्नुहोस्, र त्यसपछि क्रमिक रूपमा बढी जटिल अवस्थाहरूमा जानुहोस्। प्रत्येक उदाहरणले अघिल्लो उदाहरणका अवधारणाहरूमा आधारित हुन्छ!

## 🚀 सुरु गर्न तयार?

### तपाइँको सिकाइ मार्ग

1. **पूर्ण शुरुवातकर्ता?** → [Flask API](../../../examples/container-app/simple-flask-api) बाट सुरु गर्नुहोस् (⭐, 20 मिनेट)
2. **AZD सम्बन्धी आधारभूत ज्ञान छ?** → [Microservices](../../../examples/container-app/microservices) प्रयास गर्नुहोस् (⭐⭐⭐⭐, 60 मिनेट)
3. **AI एप्स निर्माण गर्दै हुनुहुन्छ?** → [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) बाट सुरु गर्नुहोस् (⭐⭐, 35 मिनेट) वा [Retail Multi-Agent](retail-scenario.md) अन्वेषण गर्नुहोस् (⭐⭐⭐⭐, 2+ घण्टा)
4. **विशिष्ट प्राविधिक स्ट्याक चाहिन्छ?** → माथि रहेको [सही उदाहरण पत्ता लगाउने](#-finding-the-right-example) खण्ड प्रयोग गर्नुहोस्

### अर्को चरणहरू

- ✅ माथि उल्लेखित [पूर्वशर्तहरू](#पूर्वआवश्यकताहरू) जाँच गर्नुहोस्
- ✅ आफ्नो दक्षता स्तरसँग मेल खाने उदाहरण छान्नुहोस् (हेर्नुहोस् [जटिलता संकेतक](#जटिलता-मूल्याङ्कन-संकेतक))
- ✅ उदाहरणको README परिनियोजन अघि ध्यानपूर्वक पढ्नुहोस्
- ✅ परीक्षण पछि `azd down` चलाउन सम्झना सेट गर्नुहोस्
- ✅ GitHub Issues वा Discussions मार्फत आफ्नो अनुभव साझा गर्नुहोस्

### मद्दत चाहिन्छ?

- 📖 [FAQ](../resources/faq.md) - सामान्य प्रश्नहरूको उत्तर
- 🐛 [समस्या समाधान मार्गदर्शक](../docs/chapter-07-troubleshooting/common-issues.md) - परिनियोजन समस्याहरू समाधान गर्नुहोस्
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - समुदायसँग सोध्नुहोस्
- 📚 [अध्ययन मार्गदर्शक](../resources/study-guide.md) - आफ्नो सिकाइ सुदৃढ पार्नुहोस्

---

**नेभिगेशन**
- **📚 पाठ्यक्रम गृह**: [AZD For Beginners](../README.md)
- **📖 अध्ययन सामग्री**: [अध्ययन मार्गदर्शक](../resources/study-guide.md) | [छिटो सन्दर्भ](../resources/cheat-sheet.md) | [शब्दावली](../resources/glossary.md)
- **🔧 स्रोतहरू**: [FAQ](../resources/faq.md) | [समस्या समाधान](../docs/chapter-07-troubleshooting/common-issues.md)

---

*अन्तिम अपडेट: November 2025 | [समस्या रिपोर्ट गर्नुहोस्](https://github.com/microsoft/AZD-for-beginners/issues) | [उदाहरणहरू योगदान गर्नुस्](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->