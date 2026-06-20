# उदाहरणे - व्यावहारिक AZD टेम्पलेट्स आणि संरचना

**उदाहरणांद्वारे शिकणे - प्रकरणांनुसार संघटीत**
- **📚 कोर्स होम**: [AZD For Beginners](../README.md)
- **📖 प्रकरण मॅपिंग**: शिकण्याच्या कठीणतेनुसार उदाहरणे संघटित
- **🚀 स्थानिक उदाहरण**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 बाह्य AI उदाहरणे**: Azure Samples रिपॉझिटरीसाठी दुवे

> **📍 महत्त्वाचे: स्थानिकी वापर व बाह्य उदाहरणे**  
> या रिपॉझिटरीमध्ये **4 पूर्ण स्थानिक उदाहरणे** आहेत ज्यात संपूर्ण अमलबजावणी आहे:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 डिप्लॉयमेंट सह चॅट इंटरफेस)  
> - **Container Apps** (सोपे Flask API + मायक्रोसर्व्हिसेस)  
> - **Database App** (वेब + SQL डेटाबेस)  
> - **Retail Multi-Agent** (एंटरप्राइज AI सोल्यूशन)  
>  
> अतिरिक्त उदाहरणे ही Azure-Samples रिपॉझिटरीसाठीच्या **बाह्य संदर्भां** आहेत ज्या तुम्ही क्लोन करू शकता.

## परिचय

हा डिरेक्टरी व्यावहारिक उदाहरणे आणि संदर्भ उपलब्ध करून देतो जे तुम्हाला Azure Developer CLI शिकण्यासाठी प्रत्यक्ष हाताळणी करू शकतात. Retail Multi-Agent परिदृश्य ही एक पूर्ण, उत्पादनासाठी तयार केलेली अमलबजावणी आहे जी या रिपॉझिटरीमध्ये समाविष्ट आहे. अतिरिक्त उदाहरणांमध्ये विविध AZD पॅटर्न्सचे प्रदर्शन करणारे अधिकृत Azure Samples संदर्भ आहेत.

### कठीणतेचे मूल्यांकन संकेत

- ⭐ **नवशिक्या** - मूलभूत संकल्पना, एकल सेवा, 15-30 मिनिटे
- ⭐⭐ **मध्यम** - अनेक सेवा, डेटाबेस एकत्रीकरण, 30-60 मिनिटे
- ⭐⭐⭐ **प्रगत** - जटिल आर्किटेक्चर, AI एकत्रीकरण, 1-2 तास
- ⭐⭐⭐⭐ **तज्ञ** - उत्पादनासाठी तयार, एंटरप्राइज पॅटर्न्स, 2+ तास

## 🎯 या रिपॉझिटरीमध्ये काय आहे

### ✅ स्थानिक अमलबजावणी (तयार वापरण्यासाठी)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**हे रेपॉमध्ये संपूर्ण gpt-4.1 डिप्लॉयमेंट सह चॅट इंटरफेस समाविष्ट आहे**

- **स्थान:** `examples/azure-openai-chat/`
- **कठीणाई:** ⭐⭐ (मध्यम)
- **आमच्याकडे काय आहे:**
  - संपूर्ण Microsoft Foundry Models डिप्लॉयमेंट (gpt-4.1)
  - Python कमांड-लाइन चॅट इंटरफेस
  - सुरक्षित API कीजसाठी Key Vault एकत्रीकरण
  - Bicep इन्फ्रास्ट्रक्चर टेम्पलेट्स
  - टोकन वापर आणि खर्च ट्रॅकिंग
  - दर मर्यादा आणि त्रुटी हाताळणी

**त्वरित सुरुवात:**
```bash
# उदाहरणाकडे जा
cd examples/azure-openai-chat

# सर्वकाही तैनात करा
azd up

# अवलंबित्वे इंस्टॉल करा आणि चॅटिंग सुरू करा
pip install -r src/requirements.txt
python src/chat.py
```

**तंत्रज्ञान:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**या रेपॉमध्ये सर्वसमावेशक कंटेनर डिप्लॉयमेंट उदाहरणे समाविष्ट आहेत**

- **स्थान:** `examples/container-app/`
- **कठीणाई:** ⭐-⭐⭐⭐⭐ (नवशिक्या ते प्रगत)
- **आमच्याकडे काय आहे:**
  - [मास्टर गाइड](container-app/README.md) - कंटेनर डिप्लॉयमेंटची संपूर्ण माहिती
  - [सोपे Flask API](../../../examples/container-app/simple-flask-api) - मूलभूत REST API उदाहरण
  - [मायक्रोसर्व्हिसेस आर्किटेक्चर](../../../examples/container-app/microservices) - उत्पादनासाठी तयार मल्टी-सर्व्हिस डिप्लॉयमेंट
  - त्वरित सुरुवात, उत्पादन, आणि प्रगत पॅटर्न्स
  - मॉनिटरिंग, सुरक्षा, आणि खर्च ऑप्टिमायझेशन

**त्वरित सुरुवात:**
```bash
# मास्टर मार्गदर्शक पहा
cd examples/container-app

# साधे Flask API तैनात करा
cd simple-flask-api
azd up

# मायक्रोसर्व्हिसेस उदाहरण तैनात करा
cd ../microservices
azd up
```

**तंत्रज्ञान:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**या रेपॉमध्ये संपूर्ण उत्पादनासाठी तयार अमलबजावणी समाविष्ट आहे**

- **स्थान:** `examples/retail-multiagent-arm-template/`
- **कठीणाई:** ⭐⭐⭐⭐ (प्रगत)
- **आमच्याकडे काय आहे:**
  - संपूर्ण ARM डिप्लॉयमेंट टेम्पलेट
  - मल्टी-एजंट आर्किटेक्चर (ग्राहक + इन्व्हेंटरी)
  - Microsoft Foundry Models एकत्रीकरण
  - AI Search with RAG
  - सर्वसमावेशक मॉनिटरिंग
  - एक-क्लिक डिप्लॉयमेंट स्क्रिप्ट

**त्वरित सुरुवात:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**तंत्रज्ञान:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 बाह्य Azure Samples (वापरण्यासाठी क्लोन करा)

खालील उदाहरणे अधिकृत Azure-Samples रिपॉझिटरीमध्ये राखली जातात. विविध AZD पॅटर्न्सचा अभ्यास करण्यासाठी त्यांना क्लोन करा:

### सोपी अॅप्लिकेशन्स (प्रकरणे 1-2)

| टेम्पलेट | रिपॉझिटरी | कठीणाई | सेवा |
|:---------|:-----------|:-------|:-----|
| **Python Flask API** | [स्थानिक: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **मायक्रोसर्व्हिसेस** | [स्थानिक: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | मल्टी-सर्व्हिस, सर्व्हिस बस, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**वापर कसा करावा:**
```bash
# कोणतेही उदाहरण क्लोन करा
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# तैनात करा
azd up
```

### AI अॅप्लिकेशन उदाहरणे (प्रकरणे 2, 5, 8)

| टेम्पलेट | रिपॉझिटरी | कठीणाई | लक्ष केंद्रित |
|:---------|:-----------|:-------|:--------------|
| **Microsoft Foundry Models Chat** | [स्थानिक: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 डिप्लॉयमेंट |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | मूलभूत AI चॅट |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | एजंट फ्रेमवर्क |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG पॅटर्न |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | एंटरप्राइज AI |

### डेटाबेस व प्रगत पॅटर्न्स (प्रकरणे 3-8)

| टेम्पलेट | रिपॉझिटरी | कठीणाई | लक्ष केंद्रित |
|:---------|:-----------|:-------|:--------------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | डेटाबेस एकत्रीकरण |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL सर्व्हरलेस |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | मल्टी-सर्व्हिस |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## शिकण्याच्या उद्दिष्टे

हे उदाहरणे पूर्ण करताना तुम्ही:
- प्रत्यक्ष अॅप्लिकेशन परिदृश्यांसह Azure Developer CLI कार्यप्रवाहाचा सराव कराल
- विविध अॅप्लिकेशन आर्किटेक्चर्स व त्यांचे azd अमलबजावणी समजून घ्याल
- विविध Azure सेवांसाठी Infrastructure as Code पॅटर्न शिकाल
- कॉन्फिगरेशन व्यवस्थापन आणि वातावरण-विशिष्ट डिप्लॉयमेंट रणनीती लावाल
- मॉनिटरिंग, सुरक्षा, आणि स्केलिंग पॅटर्न व्यावहारिक संदर्भात प्राज्ञेने अमलात आणाल
- खऱ्या डिप्लॉयमेंट समस्यांसाठी समस्या निराकरण व डीबगिंगचा अनुभव घ्याल

## शिकण्याचे परिणाम

हे उदाहरणे पूर्ण केल्यावर तुम्ही सक्षम असाल:
- Azure Developer CLI वापरून विविध प्रकारची अॅप्लिकेशन्स आत्मविश्वासाने डिप्लॉय करण्यासाठी
- तुमच्या स्वतःच्या अॅप्लिकेशनच्या गरजेनुसार टेम्पलेट्स सानुकूलित करणे
- Bicep वापरून सानुकूल इन्फ्रास्ट्रक्चर पॅटर्न्स डिझाइन आणि अमलात आणणे
- योग्य अवलंबित्वांसह जटिल मल्टी-सर्व्हिस अॅप्लिकेशन्स कॉन्फिगर करणे
- वास्तविक परिदृश्यांमध्ये सुरक्षा, मॉनिटरिंग, आणि कार्यक्षमता सर्वोत्तम पद्धती वापरणे
- व्यावहारिक अनुभवावर आधारित डिप्लॉयमेंट समस्या सोडवणे आणि सुधारणा करणे

## डिरेक्टरी संरचना

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

## त्वरित सुरु करण्यासाठी उदाहरणे

> **💡 AZD मध्ये नवीन आहात?** उदाहरण क्रमांक #1 (Flask API) पासून सुरुवात करा - हे सुमारे 20 मिनिटे घेते आणि मूलभूत संकल्पना शिकवते.

### नवशिक्यांसाठी
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (स्थानिक) ⭐  
   स्केल-टू-झीरोसह सोपा REST API डिप्लॉय करा  
   **वेळ:** 20-25 मिनिटे | **खर्च:** $0-5/महिना  
   **तुम्हाला शिकायला मिळेल:** मूलभूत azd कार्यप्रवाह, कंटेनरायजेशन, हेल्थ प्रोब्स  
   **अपेक्षित परिणाम:** "Hello, World!" परत करणारा कार्यरत API एंडपॉईंट मॉनिटरिंगसह

2. **[सोपे वेब अॅप - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB सह Node.js Express वेब अॅप्लिकेशन डिप्लॉय करा  
   **वेळ:** 25-35 मिनिटे | **खर्च:** $10-30/महिना  
   **तुम्हाला शिकायला मिळेल:** डेटाबेस एकत्रीकरण, पर्यावरण व्हेरिएबल्स, कनेक्शन स्ट्रिंग्ज  
   **अपेक्षित परिणाम:** तयार/वाचणे/अपडेट/काढून टाकण्याच्या कार्यक्षमतांसह Todo list अॅप

3. **[स्टॅटिक वेबसाइट - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps सह React स्टॅटिक वेबसाइट होस्ट करा  
   **वेळ:** 20-30 मिनिटे | **खर्च:** $0-10/महिना  
   **तुम्हाला शिकायला मिळेल:** स्टॅटिक होस्टिंग, सर्व्हरलेस फंक्शन्स, CDN डिप्लॉयमेंट  
   **अपेक्षित परिणाम:** React UI API बॅकएंडसह, ऑटोमॅटिक SSL, जागतिक CDN

### मध्यम वापरकर्त्यांसाठी
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (स्थानिक) ⭐⭐  
   gpt-4.1 आणि सुरक्षित API की व्यवस्थापनासह चॅट इंटरफेस डिप्लॉय करा  
   **वेळ:** 35-45 मिनिटे | **खर्च:** $50-200/महिना  
   **तुम्हाला शिकायला मिळेल:** Microsoft Foundry Models डिप्लॉयमेंट, Key Vault एकत्रीकरण, टोकन ट्रॅकिंग  
   **अपेक्षित परिणाम:** gpt-4.1 आणि खर्च मॉनिटरिंगसह कार्यरत चॅट अॅप्लिकेशन

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (स्थानिक) ⭐⭐⭐⭐  
   उत्पादनासाठी तयार मल्टी-सर्व्हिस आर्किटेक्चर  
   **वेळ:** 45-60 मिनिटे | **खर्च:** $50-150/महिना  
   **तुम्हाला शिकायला मिळेल:** सेवा संवाद, संदेश पुरवठा, वितरित ट्रेसिंग  
   **अपेक्षित परिणाम:** 2-सर्व्हिस प्रणाली (API Gateway + Product Service) मॉनिटरिंगसह

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API आणि Azure SQL डेटाबेससह वेब अॅप्लिकेशन  
   **वेळ:** 30-45 मिनिटे | **खर्च:** $20-80/महिना  
   **तुम्हाला शिकायला मिळेल:** Entity Framework, डेटाबेस स्थलांतर, कनेक्शन सुरक्षा  
   **अपेक्षित परिणाम:** Azure SQL बॅकएंडसह C# API, स्वयंचलित स्कीमा डिप्लॉयमेंट

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ट्रिगर्स आणि Cosmos DB सह Python Azure Functions  
   **वेळ:** 30-40 मिनिटे | **खर्च:** $10-40/महिना  
   **तुम्हाला शिकायला मिळेल:** इव्हेंट-चालित आर्किटेक्चर, सर्व्हरलेस स्केलिंग, NoSQL एकत्रीकरण  
   **अपेक्षित परिणाम:** Cosmos DB स्टोरेजसह HTTP विनंत्यांना प्रतिसाद देणारे फंक्शन अॅप

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps आणि API गेटवे सह मल्टी-सर्व्हिस Java अॅप्लिकेशन  
   **वेळ:** 60-90 मिनिटे | **खर्च:** $80-200/महिना  
   **तुम्हाला शिकायला मिळेल:** Spring Boot डिप्लॉयमेंट, सेवा मेष, लोड बॅलन्सिंग  
   **अपेक्षित परिणाम:** सेवा शोध आणि रूटिंगसह मल्टी-सर्व्हिस Java प्रणाली

### Microsoft Foundry टेम्पलेट्स

1. **[Microsoft Foundry Models Chat App - स्थानिक उदाहरण](../../../examples/azure-openai-chat)** ⭐⭐  
   संपूर्ण gpt-4.1 डिप्लॉयमेंट सह चॅट इंटरफेस  
   **वेळ:** 35-45 मिनिटे | **खर्च:** $50-200/महिना  
   **अपेक्षित परिणाम:** टोकन ट्रॅकिंग आणि खर्च मॉनिटरिंगसह कार्यरत चॅट अॅप्लिकेशन

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG आर्किटेक्चरसह बुद्धिमान चॅट अॅप्लिकेशन  
   **वेळ:** 60-90 मिनिटे | **खर्च:** $100-300/महिना  
   **अपेक्षित परिणाम:** दस्तऐवज शोध आणि उद्धरणांसह RAG-आधारित चॅट इंटरफेस

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI सेवांचा वापर करून दस्तऐवज विश्लेषण  
   **वेळ:** 40-60 मिनिटे | **खर्च:** $20-80/महिना  
   **अपेक्षित परिणाम:** अपलोड केलेल्या दस्तऐवजांमधून मजकूर, तक्ता, आणि घटक काढणारे API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning सह MLOps वर्कफ्लो  
   **वेळ:** 2-3 तास | **खर्च:** $150-500/महिना  
   **अपेक्षित परिणाम:** प्रशिक्षण, डिप्लॉयमेंट, आणि मॉनिटरिंगसह स्वयंचलित ML पाइपलाइन

### वास्तविक-विश्व परिदृश्ये

#### **Retail Multi-Agent Solution** 🆕  
**[संपूर्ण अमलबजावणी मार्गदर्शक](./retail-scenario.md)**

एंटरप्राइज-ग्रेड AI अॅप्लिकेशन डिप्लॉयमेंटसाठी AZD सह एक सर्वसमावेशक, उत्पादनासाठी तयार मल्टी-एजंट ग्राहक समर्थन सोल्यूशन. या परिदृश्यात समाविष्ट आहे:

- **पूर्ण आर्किटेक्चर**: ग्राहक सेवा आणि इन्व्हेंटरी व्यवस्थापन एजंटसह मल्टी-एजंट सिस्टम
- **प्रॉडक्शन इन्फ्रास्ट्रक्चर**: मल्टी-रिजन Microsoft Foundry Models डिप्लॉयमेंट, AI शोध, कंटेनर अ‍ॅप्स, आणि संपूर्ण मॉनिटरिंग  
- **रेडी-टू-डिप्लॉय ARM टेम्प्लेट**: एक-क्लिक डिप्लॉयमेंट अनेक कॉन्फिगरेशन मोडसह (मिनिमल/स्टँडर्ड/प्रीमियम)  
- **अॅडव्हान्स्ड फीचर्स**: रेड टीमिंग सुरक्षा पडताळणी, एजंट मूल्यांकन फ्रेमवर्क, खर्च सुधारणा, आणि ट्रबलशूटिंग मार्गदर्शक  
- **खऱ्या व्यवसायाचे संदर्भ**: रिटेलर ग्राहक समर्थन वापर प्रकरण फाइल अपलोड, शोध एकत्रीकरण, आणि डायनॅमिक स्केलिंगसह

**तंत्रज्ञान**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, कंटेनर अ‍ॅप्स, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**कठीणाई**: ⭐⭐⭐⭐ (उन्नत - एंटरप्राइझ प्रॉडक्शन रेडी)

**परिपूर्ण कोणासाठी**: AI विकसक, सोल्यूशन आर्किटेक्ट्स, आणि प्रॉडक्शन मल्टी-एजंट सिस्टीम्स बनवणाऱ्या संघांसाठी

**जलद प्रारंभ**: समाविष्ट ARM टेम्प्लेट वापरून `./deploy.sh -g myResourceGroup` या कमांडने ३० मिनिटांपेक्षा कमी कालावधीत पूर्ण सोल्यूशन डिप्लॉय करा

## 📋 वापर सूचना

### पूर्वअटी

कोणतीही उदाहरण सुरु करण्यापूर्वी:  
- ✅ Azure सदस्यता ज्यामध्ये ओनर किंवा कंट्रीब्यूटर प्रवेश आहे  
- ✅ Azure Developer CLI स्थापित ([इंस्टॉलेशन मार्गदर्शक](../docs/chapter-01-foundation/installation.md))  
- ✅ डॉकर डेस्कटॉप चालू आहे (कंटेनर उदाहरणांसाठी)  
- ✅ योग्य Azure कोटा (प्रत्येक उदाहरणासाठी वेगवेगळ्या आवश्यकतांसाठी तपासा)  

> **💰 खर्च सूचना:** सर्व उदाहरणे खरे Azure संसाधने तयार करतात ज्यावर शुल्क लागू होते. खर्च अंदाजासाठी स्वतंत्र README फायली पहा. समाप्त केल्यावर `azd down` चालवणे विसरू नका ज्यामुळे सततचा खर्च टाळता येईल.

### उदाहरणे लोकल चालविणे

1. **उदाहरण क्लोन किंवा कॉपी करा**  
   ```bash
   # आवश्यक उदाहरणाकडे जा
   cd examples/simple-web-app
   ```
  
2. **AZD एन्व्हायर्नमेंट प्रारंभ करा**  
   ```bash
   # अस्तित्वात असलेल्या साच्याबरोबर प्रारंभ करा
   azd init
   
   # किंवा नवीन पर्यावरण तयार करा
   azd env new my-environment
   ```
  
3. **एन्व्हायर्नमेंट कॉन्फिगर करा**  
   ```bash
   # आवश्यक चल सेट करा
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **डिप्लॉय करा**  
   ```bash
   # पायाभूत सुविधा आणि अनुप्रयोग तैनात करा
   azd up
   ```
  
5. **डिप्लॉयमेंट तपासा**  
   ```bash
   # सेवा एंडपॉइंट मिळवा
   azd env get-values
   
   # एंडपॉइंटची चाचणी करा (उदाहरण)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **अपेक्षित यशाची चिन्हे:**  
   - ✅ `azd up` त्रुटीशिवाय पूर्ण होणे  
   - ✅ सेवा एंडपॉइंट HTTP 200 परत करणे  
   - ✅ Azure पोर्टलवर "Running" स्थिती दर्शविणे  
   - ✅ Application InsightsTelemetry प्राप्त करणे  

> **⚠️ समस्या आल्यास?** डिप्लॉयमेंट ट्रबलशूटिंगसाठी [सामान्य समस्या](../docs/chapter-07-troubleshooting/common-issues.md) पाहा

### उदाहरणे सानुकूलित करणे

प्रत्येक उदाहरणामध्ये समाविष्ट आहे:  
- **README.md** - सविस्तर सेटअप आणि सानुकूलन सूचना  
- **azure.yaml** - टिप्पणीसह AZD कॉन्फिगरेशन  
- **infra/** - पॅरामीटर स्पष्टीकरणासहित Bicep टेम्प्लेट्स  
- **src/** - नमुना अनुप्रयोग कोड  
- **scripts/** - सामान्य कार्यांसाठी सहाय्यक स्क्रिप्ट्स

## 🎯 शिक्षण उद्दिष्टे

### उदाहरण वर्गीकरण

#### **मूलभूत डिप्लॉयमेंट्स**  
- एकल सेवा अनुप्रयोग  
- सोपे इन्फ्रास्ट्रक्चर पॅटर्न  
- मूलभूत कॉन्फिगरेशन व्यवस्थापन  
- खर्च-अल्प विकास सेटअप

#### **उन्नत परिस्थिती**  
- मल्टी-सेवा आर्किटेक्चर्स  
- जटील नेटवर्किंग कॉन्फिगरेशन  
- डेटाबेस एकत्रीकरण पॅटर्न  
- सुरक्षा आणि अनुरूपता अमलबजावणी

#### **प्रॉडक्शन-रेडी पॅटर्न**  
- उच्च उपलब्धता कॉन्फिगरेशन  
- मॉनिटरिंग व निरीक्षण  
- CI/CD एकत्रीकरण  
- आपत्ती पुनर्प्राप्ती सेटअप

## 📖 उदाहरण वर्णन

### सोपा वेब अ‍ॅप - Node.js Express  
**तंत्रज्ञान**: Node.js, Express, MongoDB, कंटेनर अ‍ॅप्स  
**कठीणाई**: नवशिक्या  
**गंमती**: मूलभूत डिप्लॉयमेंट, REST API, NoSQL डेटाबेस एकत्रीकरण

### स्थिर वेबसाइट - React SPA  
**तंत्रज्ञान**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**कठीणाई**: नवशिक्या  
**गंमती**: स्थिर होस्टिंग, सर्व्हरलेस बॅकएंड, आधुनिक वेब विकास

### कंटेनर अ‍ॅप - Python Flask  
**तंत्रज्ञान**: Python Flask, Docker, कंटेनर अ‍ॅप्स, कंटेनर रजिस्ट्री, Application Insights  
**कठीणाई**: नवशिक्या  
**गंमती**: कंटेनरायझेशन, REST API, scale-to-zero, हेल्थ प्रॉब्स, मॉनिटरिंग  
**स्थान**: [लोकल उदाहरण](../../../examples/container-app/simple-flask-api)

### कंटेनर अ‍ॅप - मायक्रोसर्व्हिसेस आर्किटेक्चर  
**तंत्रज्ञान**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, कंटेनर अ‍ॅप्स  
**कठीणाई**: उन्नत  
**गंमती**: मल्टी-सेवा आर्किटेक्चर, सेवा संवाद, मेसेज क्यूइंग, डिस्ट्रिब्युटेड ट्रेसिंग  
**स्थान**: [लोकल उदाहरण](../../../examples/container-app/microservices)

### डेटाबेस अ‍ॅप - C# सह Azure SQL  
**तंत्रज्ञान**: C# ASP.NET Core, Azure SQL Database, App Service  
**कठीणाई**: मध्यम  
**गंमती**: Entity Framework, डेटाबेस कनेक्शन्स, वेब API विकास

### सर्व्हरलेस फंक्शन - Python Azure Functions  
**तंत्रज्ञान**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**कठीणाई**: मध्यम  
**गंमती**: इव्हेंट-आधारित आर्किटेक्चर, सर्व्हरलेस कम्प्युटिंग, फुल-स्टॅक विकास

### मायक्रोसर्व्हिसेस - Java Spring Boot  
**तंत्रज्ञान**: Java Spring Boot, कंटेनर अ‍ॅप्स, Service Bus, API Gateway  
**कठीणाई**: मध्यम  
**गंमती**: मायक्रोसर्व्हिसेस संवाद, वितरित प्रणाली, एंटरप्राइझ पॅटर्न्स

### Microsoft Foundry उदाहरणे

#### Microsoft Foundry Models Chat अ‍ॅप  
**तंत्रज्ञान**: Microsoft Foundry Models, Azure AI Search, App Service  
**कठीणाई**: मध्यम  
**गंमती**: RAG आर्किटेक्चर, व्हेक्टर शोध, LLM एकत्रीकरण

#### AI दस्तऐवज प्रक्रिया  
**तंत्रज्ञान**: Azure AI Document Intelligence, Storage, Functions  
**कठीणाई**: मध्यम  
**गंमती**: दस्तऐवज विश्लेषण, OCR, डेटा एक्स्ट्रॅक्शन

#### मशीन लर्निंग पाइपलाइन  
**तंत्रज्ञान**: Azure ML, MLOps, कंटेनर रजिस्ट्री  
**कठीणाई**: उन्नत  
**गंमती**: मॉडेल प्रशिक्षण, डिप्लॉयमेंट पाइपलाइन्स, मॉनिटरिंग

## 🛠 कॉन्फिगरेशन उदाहरणे

`configurations/` निर्देशिकेमध्ये पुनर्वापरयोग्य घटक आहेत:

### एन्व्हायर्नमेंट कॉन्फिगरेशन  
- विकास एन्व्हायर्नमेंट सेटिंग्ज  
- स्टेजिंग एन्व्हायर्नमेंट कॉन्फिगरेशन  
- प्रॉडक्शन-रेडी कॉन्फिगरेशन  
- मल्टी-रिजन डिप्लॉयमेंट सेटअप

### Bicep मॉड्यूल  
- पुनर्वापरयोग्य इन्फ्रास्ट्रक्चर घटक  
- सामान्य रिसोर्स पॅटर्न्स  
- सुरक्षा मजबूत केलेले टेम्प्लेट्स  
- खर्च-बचत कॉन्फिगरेशन

### सहाय्यक स्क्रिप्ट्स  
- एन्व्हायर्नमेंट सेटअप ऑटोमेशन  
- डेटाबेस माइग्रेशन स्क्रिप्ट्स  
- डिप्लॉयमेंट व्हॅलिडेशन टूल्स  
- खर्च मॉनिटरिंग युटिलिटीज

## 🔧 सानुकूलन मार्गदर्शक

### आपल्या वापरासाठी उदाहरणे सानुकूलित करणे  

1. **पूर्वअटी तपासा**  
   - Azure सेवा आवश्यकतांचे परीक्षण  
   - सदस्यता मर्यादा पडताळा  
   - खर्च परिणाम समजून घ्या  

2. **कॉन्फिगरेशन बदल करा**  
   - `azure.yaml` मधील सेवा व्यवस्थापन अपडेट करा  
   - Bicep टेम्प्लेट्स सानुकूलित करा  
   - एन्व्हायर्नमेंट व्हेरिएबल्स समायोजित करा  

3. **सखोल चाचणी करा**  
   - प्रथम विकास एन्व्हायर्नमेंटमध्ये डिप्लॉय करा  
   - कार्यक्षमता तपासा  
   - स्केलिंग आणि गतीची चाचणी करा  

4. **सुरक्षा पुनरावलोकन**  
   - प्रवेश नियंत्रण पुनरावलोकित करा  
   - गुपित व्यवस्थापन अंमलात आणा  
   - मॉनिटरिंग आणि अलर्टिंग सक्षम करा

## 📊 तुलना मॅट्रिक्स

| उदाहरण | सेवा | डेटाबेस | प्रमाणितीकरण | मॉनिटरिंग | कठीणाई |
|---------|------|---------|---------------|------------|---------|
| **Microsoft Foundry Models Chat** (लोकल) | 2 | ❌ | Key Vault | पूर्ण | ⭐⭐ |
| **Python Flask API** (लोकल) | 1 | ❌ | मूलभूत | पूर्ण | ⭐ |
| **मायक्रोसर्व्हिसेस** (लोकल) | 5+ | ✅ | एंटरप्राइझ | उन्नत | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | मूलभूत | मूलभूत | ⭐ |
| React SPA + Functions | 3 | ✅ | मूलभूत | पूर्ण | ⭐ |
| Python Flask कंटेनर | 2 | ❌ | मूलभूत | पूर्ण | ⭐ |
| C# Web API + SQL | 2 | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Java मायक्रोसर्व्हिसेस | 5+ | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | पूर्ण | पूर्ण | ⭐⭐⭐ |
| AI दस्तऐवज प्रक्रिया | 2 | ❌ | मूलभूत | पूर्ण | ⭐⭐ |
| ML पाइपलाइन | 4+ | ✅ | पूर्ण | पूर्ण | ⭐⭐⭐⭐ |
| **रिटेल मल्टी-एजंट** (लोकल) | **8+** | **✅** | **एंटरप्राइझ** | **उन्नत** | **⭐⭐⭐⭐** |

## 🎓 शिक्षण मार्ग

### शिफारस केलेली प्रगती  

1. **सोप्या वेब अ‍ॅपपासून सुरू करा**  
   - मूलभूत AZD संकल्पना शिका  
   - डिप्लॉयमेंट वर्कफ्लो समजून घ्या  
   - एन्व्हायर्नमेंट व्यवस्थापनाचा सराव करा  

2. **स्थिर वेबसाइट वापरून पहा**  
   - वेगवेगळ्या होस्टिंग पर्यायाचा अनुभव घ्या  
   - CDN एकत्रीकरणाविषयी शिका  
   - DNS कॉन्फिगरेशन समजून घ्या  

3. **कंटेनर अ‍ॅपवर जा**  
   - कंटेनरायझेशन मूलतत्त्वे शिका  
   - स्केलिंग संकल्पना समजून घ्या  
   - डॉकरसह सराव करा  

4. **डेटाबेस एकत्रीकरण जोडा**  
   - डेटाबेस प्रोव्हिजनिंग शिका  
   - कनेक्शन स्ट्रींग्ज समजून घ्या  
   - गुपित व्यवस्थापन सराव करा  

5. **सर्व्हरलेस एक्सप्लोर करा**  
   - इव्हेंट-आधारित आर्किटेक्चर समजून घ्या  
   - ट्रिगर्स आणि बाइंडिंग्ज विषयी शिका  
   - API सह काम करा  

6. **मायक्रोसर्व्हिसेस तयार करा**  
   - सेवा संवाद समजून घ्या  
   - वितरित प्रणाली समजून घ्या  
   - जटील डिप्लॉयमेंटचे सराव करा

## 🔍 योग्य उदाहरण शोधणे

### तंत्रज्ञान स्टॅकमुळे  
- **कंटेनर अ‍ॅप्स**: [Python Flask API (लोकल)](../../../examples/container-app/simple-flask-api), [मायक्रोसर्व्हिसेस (लोकल)](../../../examples/container-app/microservices), Java मायक्रोसर्व्हिसेस  
- **Node.js**: Node.js Express Todo अ‍ॅप, [मायक्रोसर्व्हिसेस API गेटवे (लोकल)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (लोकल)](../../../examples/container-app/simple-flask-api), [मायक्रोसर्व्हिसेस प्रॉडक्ट सेवा (लोकल)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [मायक्रोसर्व्हिसेस ऑर्डर सेवा (लोकल)](../../../examples/container-app/microservices), C# Web API + SQL डेटाबेस, Microsoft Foundry Models Chat अ‍ॅप, ML पाइपलाइन  
- **Go**: [मायक्रोसर्व्हिसेस युजर सेवा (लोकल)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot मायक्रोसर्व्हिसेस  
- **React**: React SPA + Functions  
- **कंटेनर्स**: [Python Flask (लोकल)](../../../examples/container-app/simple-flask-api), [मायक्रोसर्व्हिसेस (लोकल)](../../../examples/container-app/microservices), Java मायक्रोसर्व्हिसेस  
- **डेटाबेस**: [मायक्रोसर्व्हिसेस (लोकल)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry Models Chat (लोकल)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat अ‍ॅप, AI दस्तऐवज प्रक्रिया, ML पाइपलाइन, **रिटेल मल्टी-एजंट सोल्यूशन**  
- **मल्टी-एजंट सिस्टीम्स**: **रिटेल मल्टी-एजंट सोल्यूशन**  
- **OpenAI एकत्रीकरण**: **[Microsoft Foundry Models Chat (लोकल)](../../../examples/azure-openai-chat)**, रिटेल मल्टी-एजंट सोल्यूशन  
- **एंटरप्राइझ प्रॉडक्शन**: [मायक्रोसर्व्हिसेस (लोकल)](../../../examples/container-app/microservices), **रिटेल मल्टी-एजंट सोल्यूशन**

### आर्किटेक्चर पॅटर्ननुसार  
- **सोप्या REST API**: [Python Flask API (लोकल)](../../../examples/container-app/simple-flask-api)  
- **मोनोलिथिक**: Node.js Express Todo, C# Web API + SQL  
- **स्थिर + सर्व्हरलेस**: React SPA + Functions, Python Functions + SPA  
- **मायक्रोसर्व्हिसेस**: [प्रॉडक्शन मायक्रोसर्व्हिसेस (लोकल)](../../../examples/container-app/microservices), Java Spring Boot मायक्रोसर्व्हिसेस  
- **कंटेनरायझ्ड**: [Python Flask (लोकल)](../../../examples/container-app/simple-flask-api), [मायक्रोसर्व्हिसेस (लोकल)](../../../examples/container-app/microservices)  
- **AI-संचालित**: **[Microsoft Foundry Models Chat (लोकल)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat अ‍ॅप, AI दस्तऐवज प्रक्रिया, ML पाइपलाइन, **रिटेल मल्टी-एजंट सोल्यूशन**  
- **मल्टी-एजंट आर्किटेक्चर**: **रिटेल मल्टी-एजंट सोल्यूशन**  
- **एंटरप्राइझ मल्टी-सेवा**: [मायक्रोसर्व्हिसेस (लोकल)](../../../examples/container-app/microservices), **रिटेल मल्टी-एजंट सोल्यूशन**

### कठीणाई पातळी नुसार  
- **नवशिक्या**: [Python Flask API (लोकल)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **मध्यम**: **[Microsoft Foundry Models Chat (लोकल)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java मायक्रोसर्व्हिसेस, Microsoft Foundry Models Chat अ‍ॅप, AI दस्तऐवज प्रक्रिया  
- **उन्नत**: ML पाइपलाइन  
- **एंटरप्राइझ प्रॉडक्शन-रेडी**: [मायक्रोसर्व्हिसेस (लोकल)](../../../examples/container-app/microservices) (मल्टी-सेवा मेसेज क्यूइंगसह), **रिटेल मल्टी-एजंट सोल्यूशन** (पूर्ण मल्टी-एजंट सिस्टीम ARM टेम्प्लेट डिप्लॉयमेंटसह)

## 📚 अतिरिक्त स्रोत

### दस्तऐवज दुवे  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD टेम्प्लेट्स](https://github.com/Azure/ai-foundry-templates)  
- [Bicep दस्तऐवज](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure आर्किटेक्चर सेंटर](https://learn.microsoft.com/en-us/azure/architecture/)

### समुदाय उदाहरणे  
- [Azure Samples AZD टेम्प्लेट्स](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry टेम्प्लेट्स](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI गॅलिरी](https://azure.github.io/awesome-azd/)  
- [C# आणि Azure SQL सह Todo अ‍ॅप](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Python आणि MongoDB सह Todo अ‍ॅप](https://github.com/Azure-Samples/todo-python-mongo)  
- [Node.js आणि PostgreSQL सह Todo अ‍ॅप](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API सह React वेब ऍप](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure कंटेनर ऍप्स जॉब](https://github.com/Azure-Samples/container-apps-jobs)
- [Java सह Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### सर्वोत्तम पद्धती
- [Azure वेल-आर्किटेक्चर्ड फ्रेमवर्क](https://learn.microsoft.com/en-us/azure/well-architected/)
- [क्लाउड अॅडॉप्शन फ्रेमवर्क](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 उदाहरणे देणे

उपयोगी उदाहरण सामायिक करायचे आहे का? आम्ही योगदानांचे स्वागत करतो!

### सादर करण्याचे मार्गदर्शक तत्त्वे
1. स्थापन केलेली निर्देशिका रचना पाळा
2. सविस्तर README.md समाविष्ट करा
3. कॉन्फिगरेशन फाइल्समध्ये टिप्पण्या जोडा
4. सादर करण्यापूर्वी संपूर्णपणे चाचणी करा
5. खर्च अंदाज आणि पूर्वपात्रता समाविष्ट करा

### उदाहरण टेम्पलेट रचना
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

**प्रो टीप**: आपल्या तंत्रज्ञान स्टॅकमध्ये जुळणारे सर्वात सोपे उदाहरण सुरू करा, नंतर हळूहळू अधिक जटिल परिस्थितीकडे जा. प्रत्येक उदाहरण मागील संकल्पनांवर बांधलेले असते!

## 🚀 सुरू करण्यास तयार?

### आपला शिकण्याचा मार्ग

1. **पूर्ण नवीन?** → [Flask API](../../../examples/container-app/simple-flask-api) पासून सुरू करा (⭐, 20 मिनिटे)
2. **मूलभूत AZD ज्ञान आहे?** → [मायक्रोसर्व्हिसेस](../../../examples/container-app/microservices) वापरून पहा (⭐⭐⭐⭐, 60 मिनिटे)
3. **AI ऍप्स तयार करत आहात?** → [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) पासून सुरू करा (⭐⭐, 35 मिनिटे) किंवा [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ तास) पहा
4. **विशिष्ट तंत्रज्ञान स्टॅक पाहिजे?** → वरच्या [योग्य उदाहरण शोधा](#-finding-the-right-example) विभागाचा वापर करा

### पुढील पावले

- ✅ वर दिलेल्या [पूर्वपात्रता](#पूर्वअटी) पुनरावलोकन करा
- ✅ आपल्या कौशल्याच्या पातळीशी जुळणारे उदाहरण निवडा (पहा [जटिलता किंवदंती](#कठीणतेचे-मूल्यांकन-संकेत))
- ✅ उदाहरणाच्या README ची सविस्तर वाचन करा तैनात करण्यापूर्वी
- ✅ चाचणी नंतर `azd down` चालवण्यास स्मरणपत्र सेट करा
- ✅ GitHub Issues किंवा Discussions द्वारे आपला अनुभव सामायिक करा

### मदतीची गरज आहे का?

- 📖 [FAQ](../resources/faq.md) - सामान्य प्रश्नांची उत्तरे
- 🐛 [समस्यानिवारण मार्गदर्शक](../docs/chapter-07-troubleshooting/common-issues.md) - तैनाती समस्या दुरुस्त करा
- 💬 [GitHub चर्चासत्र](https://github.com/microsoft/AZD-for-beginners/discussions) - समुदायाला प्रश्न विचारा
- 📚 [अभ्यास मार्गदर्शक](../resources/study-guide.md) - आपले शिक्षण मजबूत करा

---

**नेव्हिगेशन**
- **📚 कोर्स होम**: [AZD For Beginners](../README.md)
- **📖 अभ्यास साहित्य**: [अभ्यास मार्गदर्शक](../resources/study-guide.md) | [चिट शीट](../resources/cheat-sheet.md) | [शब्दसंग्रह](../resources/glossary.md)
- **🔧 संसाधने**: [FAQ](../resources/faq.md) | [समस्यानिवारण](../docs/chapter-07-troubleshooting/common-issues.md)

---

*शेवटचे अद्यतन: नोव्हेंबर 2025 | [समस्या नोंदवा](https://github.com/microsoft/AZD-for-beginners/issues) | [उदाहरणे द्या](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->