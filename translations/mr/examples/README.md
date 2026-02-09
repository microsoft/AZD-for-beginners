# उदाहरणे - व्यावहारिक AZD टेम्पलेट्स आणि कॉन्फिगरेशन्स

**उदाहरणांद्वारे शिकणे - प्रकरणानुसार आयोजित**
- **📚 अभ्यासक्रम होम**: [AZD सुरुवातीसाठी](../README.md)
- **📖 प्रकरण नकाशा**: शिकण्याच्या गुंतागुंतीनुसार आयोजित उदाहरणे
- **🚀 स्थानिक उदाहरण**: [रिटेल मल्टी-एजंट सोल्युशन](retail-scenario.md)
- **🤖 बाह्य AI उदाहरणे**: Azure सॅम्पल्स रिपॉझिटरीजसाठी दुवे

> **📍 महत्त्वाचे: स्थानिक वि. बाह्य उदाहरणे**  
> या रिपॉझिटरीमध्ये **4 पूर्ण स्थानिक उदाहरणे** पूर्ण अंमलबजावणीसह आहेत:  
> - **Azure OpenAI Chat** (GPT-4 च्या तैनातीसह चॅट इंटरफेस)  
> - **कंटेनर अॅप्स** (साधे Flask API + मायक्रोसर्व्हिसेस)  
> - **डेटाबेस अॅप** (वेब + SQL डेटाबेस)  
> - **रिटेल मल्टी-एजंट** (एंटरप्राइझ AI सोल्युशन)  
>  
> अतिरिक्त उदाहरणे **बाह्य संदर्भ** आहेत, जी तुम्ही Azure-Samples रिपॉझिटरीजमधून क्लोन करू शकता.

## परिचय

ही निर्देशिका Azure Developer CLI शिकण्यासाठी व्यावहारिक उदाहरणे आणि संदर्भ पुरवते ज्यामुळे प्रत्यक्ष वापर करून सराव करता येईल. रिटेल मल्टी-एजंट परिदृश्य हे या रिपॉझिटरीमध्ये एक पूर्ण, उत्पादनासाठी तयार केलेले अंमलबजावणी उदाहरण आहे. अतिरिक्त उदाहरणे अधिक AZD पॅटर्न दाखवणाऱ्या अधिकृत Azure सॅम्पल्सना संदर्भ देतात.

### गुंतागुंतीची रेटिंग (Complexity Rating) विरचनáctिके

- ⭐ **सुरुवातीचा** - मूलभूत संकल्पना, एक सेवा, 15-30 मिनिटे
- ⭐⭐ **मध्यम** - एकाधिक सेवा, डेटाबेस एकत्रीकरण, 30-60 मिनिटे
- ⭐⭐⭐ **प्रगत** - क्लिष्ट आर्किटेक्चर, AI एकत्रीकरण, 1-2 तास
- ⭐⭐⭐⭐ **तज्ञ** - उत्पादनासाठी तयार, एंटरप्राइझ पॅटर्न, 2+ तास

## 🎯 या रिपॉझिटरीमध्ये काय आहे

### ✅ स्थानिक अंमलबजावणी (तयार वापरासाठी)

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕
**GPT-4 तैनातीसह पूर्ण चॅट इंटरफेस युक्त अंमलबजावणी**

- **ठिकाण:** `examples/azure-openai-chat/`
- **गुंतागूंत:** ⭐⭐ (मध्यम)
- **यामध्ये काय आहे:**
  - पूर्ण Azure OpenAI तैनाती (GPT-4)
  - Python कमांड-लाइन चॅट इंटरफेस
  - Key Vault समाकलन सुरक्षित API कीसाठी
  - Bicep इन्फ्रास्ट्रक्चर टेम्पलेट्स
  - टोकन वापर आणि खर्च ट्रॅकिंग
  - दर मर्यादा आणि त्रुटी हाताळणी

**त्वरित प्रारंभ:**
```bash
# उदाहरणावर जा
cd examples/azure-openai-chat

# सर्वकाही तैनात करा
azd up

# अवलंबित्वे इंस्टॉल करा आणि गप्पा सुरू करा
pip install -r src/requirements.txt
python src/chat.py
```

**तंत्रज्ञान:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**सर्वसमावेशक कंटेनर तैनाती उदाहरणे या रिपॉझिटरीमध्ये**

- **ठिकाण:** `examples/container-app/`
- **गुंतागूंत:** ⭐-⭐⭐⭐⭐ (सुरुवातीस ते प्रगत)
- **यामध्ये काय आहे:**
  - [मास्टर मार्गदर्शक](container-app/README.md) - कंटेनर तैनातींचा पूर्ण आढावा
  - [साधा Flask API](../../../examples/container-app/simple-flask-api) - मूल REST API उदाहरण
  - [मायक्रोसर्व्हिसेस आर्किटेक्चर](../../../examples/container-app/microservices) - उत्पादनासाठी तयार बहु-सेवा तैनाती
  - त्वरित प्रारंभ, उत्पादन, आणि प्रगत पॅटर्न
  - देखरेख, सुरक्षा, आणि खर्च सुधारणा

**त्वरित प्रारंभ:**
```bash
# मास्टर मार्गदर्शक पाहा
cd examples/container-app

# साधा Flask API तैनात करा
cd simple-flask-api
azd up

# मायक्रोसेवा उदाहरण तैनात करा
cd ../microservices
azd up
```

**तंत्रज्ञान:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**पूर्ण उत्पादनासाठी तयार केलेली अंमलबजावणी या रिपॉझिटरीमध्ये**

- **ठिकाण:** `examples/retail-multiagent-arm-template/`
- **गुंतागूंत:** ⭐⭐⭐⭐ (प्रगत)
- **यामध्ये काय आहे:**
  - पूर्ण ARM तैनाती टेम्पलेट
  - मल्टी-एजंट आर्किटेक्चर (ग्राहक + साठा)
  - Azure OpenAI समाकलन
  - AI Search सह RAG
  - सर्वसमावेशक देखरेख
  - एक-क्लिक तैनाती स्क्रिप्ट

**त्वरित प्रारंभ:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**तंत्रज्ञान:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 बाह्य Azure सॅम्पल्स (वापरासाठी क्लोन करा)

खाली दिलेली उदाहरणे अधिकृत Azure-Samples रिपॉझिटरीजमध्ये ठेवलेली आहेत. ते क्लोन करून वेगवेगळ्या AZD पॅटर्न एक्सप्लोर करा:

### साधी अनुप्रयोग (प्रकरणे 1-2)

| टेम्पलेट | रिपॉझिटरी | गुंतागूंत | सेवा |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [स्थानिक: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **मायक्रोसर्व्हिसेस** | [स्थानिक: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | बहु-सेवा, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**कसे वापरावे:**
```bash
# कोणतेही उदाहरण क्लोन करा
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# तैनात करा
azd up
```

### AI अनुप्रयोग उदाहरणे (प्रकरणे 2, 5, 8)

| टेम्पलेट | रिपॉझिटरी | गुंतागूंत | फोकस |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [स्थानिक: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 तैनाती |
| **AI Chat क्विकस्टार्ट** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | मूलभूत AI चॅट |
| **AI एजंट्स** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | एजंट फ्रेमवर्क |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG पॅटर्न |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | एंटरप्राइझ AI |

### डेटाबेस आणि प्रगत पॅटर्न्स (प्रकरणे 3-8)

| टेम्पलेट | रिपॉझिटरी | गुंतागूंत | फोकस |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | डेटाबेस एकत्रीकरण |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL सर्व्हरलेस |
| **Java मायक्रोसर्व्हिसेस** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | बहु-सेवा |
| **ML पाईपलाईन** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## शिकण्याचे उद्दिष्ट

हे उदाहरणे करून, तुम्ही:
- वास्तविक अनुप्रयोग परिदृश्यांसह Azure Developer CLI कार्यप्रवाह अभ्यासाल
- वेगवेगळ्या अनुप्रयोग आर्किटेक्चर आणि त्यांचे azd अंमलबजावणी समजाल
- विविध Azure सेवा साठी इन्फ्रास्ट्रक्चर अॅज कोड पॅटर्न्ज मास्टर कराल
- कॉन्फिगरेशन व्यवस्थापन आणि पर्यावरण-विशिष्ट तैनाती रणनीती लागू कराल
- व्यावहारिक संदर्भात देखरेख, सुरक्षा, आणि स्केलिंग पॅटर्न अंमलात आणाल
- प्रत्यक्ष तैनाती परिस्थितींमध्ये समस्या निवारण आणि डीबगिंगचे अनुभव घालवाल

## शिकण्याचे परिणाम

हे उदाहरणे पूर्ण केल्यावर, तुम्ही सक्षम असाल:
- Azure Developer CLI वापरून विविध अनुप्रयोग प्रकार तैनात करणे आत्मविश्वासाने
- तुमच्या स्वत:च्या अनुप्रयोग गरजांसाठी पुरवलेली टेम्पलेट्स सानुकूलित करणे
- Bicep वापरून सानुकूल इन्फ्रास्ट्रक्चर पॅटर्न डिझाइन व अंमलबजावणी करणे
- योग्य अवलंबित्वांसह क्लिष्ट बहु-सेवा अनुप्रयोग कॉन्फिगर करणे
- प्रत्यक्ष स्थितीत सुरक्षा, देखरेख आणि कार्यकार्यक्षमतेची सर्वोत्तम पद्धती लागू करणे
- व्यावहारिक अनुभवाच्या आधारे तैनातीतील समस्या शोधणे आणि ऑप्टिमाइझ करणे

## निर्देशिका रचना

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

## त्वरीत प्रारंभ उदाहरणे

> **💡 नवीन आहात AZD मध्ये?** उदाहरण #1 (Flask API) पासून सुरू करा - सुमारे 20 मिनिटे लागतात आणि मुख्य संकल्पना शिकवतो.

### सुरुवातीसाठी
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (स्थानिक) ⭐  
   सोपा REST API स्केल-टू-झीरो सह तैनात करा  
   **वेळ:** 20-25 मिनिटे | **खर्च:** $0-5/महिना  
   **शिकाल:** मूलभूत azd कार्यप्रवाह, कंटेनरायझेशन, हेल्थ प्रोब्स  
   **अपेक्षित परिणाम:** कार्यरत API एंडपॉइंट "Hello, World!" परत करणारा आणि देखरेखीसह

2. **[साधा वेब अॅप - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB सह Node.js Express वेब अनुप्रयोग तैनात करा  
   **वेळ:** 25-35 मिनिटे | **खर्च:** $10-30/महिना  
   **शिकाल:** डेटाबेस समाकलन, पर्यावरण चल, कनेक्शन स्ट्रिंग्ज  
   **अपेक्षित परिणाम:** Todo लिस्ट अॅप ज्यात तयार/वाचा/अपडेट/डिलीट फंक्शनॅलिटी

3. **[स्टॅटिक वेबसाइट - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps सह React स्थिर वेबसाइट होस्ट करा  
   **वेळ:** 20-30 मिनिटे | **खर्च:** $0-10/महिना  
   **शिकाल:** स्टॅटिक होस्टिंग, सर्व्हरलेस फंक्शन्स, CDN तैनाती  
   **अपेक्षित परिणाम:** React UI आणि API बॅकएंड, स्वयंचलित SSL, जागतिक CDN

### मध्यम वापरकर्त्यांसाठी
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (स्थानिक) ⭐⭐  
   GPT-4 आणि सुरक्षित API की व्यवस्थापनासह चॅट इंटरफेस तैनात करा  
   **वेळ:** 35-45 मिनिटे | **खर्च:** $50-200/महिना  
   **शिकाल:** Azure OpenAI तैनाती, Key Vault समाकलन, टोकन ट्रॅकिंग  
   **अपेक्षित परिणाम:** कार्यरत GPT-4 चॅट अॅप आणि खर्च देखरेख

5. **[Container App - मायक्रोसर्व्हिसेस](../../../examples/container-app/microservices)** (स्थानिक) ⭐⭐⭐⭐  
   उत्पादनासाठी तयार बहु-सेवा आर्किटेक्चर  
   **वेळ:** 45-60 मिनिटे | **खर्च:** $50-150/महिना  
   **शिकाल:** सेवा संप्रेषण, संदेश रांदणे, वितरीत ट्रेसिंग  
   **अपेक्षित परिणाम:** 2 सेवा प्रणाली (API गेटवे + प्रॉडक्ट सेवा) आणि देखरेख

6. **[डेटाबेस अॅप - C# सह Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API आणि Azure SQL डेटाबेस सहित वेब अनुप्रयोग  
   **वेळ:** 30-45 मिनिटे | **खर्च:** $20-80/महिना  
   **शिकाल:** Entity Framework, डेटाबेस माईग्रेशन, कनेक्शन सुरक्षा  
   **अपेक्षित परिणाम:** Azure SQL बॅकएंड सह C# API, स्वयंचलित स्कीमा तैनाती

7. **[सर्व्हरलेस फंक्शन - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions HTTP ट्रिगर्स आणि Cosmos DB सह  
   **वेळ:** 30-40 मिनिटे | **खर्च:** $10-40/महिना  
   **शिकाल:** इव्हेंट-चालित आर्किटेक्चर, सर्व्हरलेस स्केलिंग, NoSQL समाकलन  
   **अपेक्षित परिणाम:** HTTP विनंत्यांना प्रतिसाद देणारे आणि Cosmos DB संचयित फंक्शन अॅप

8. **[मायक्रोसर्व्हिसेस - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps आणि API गेटवे सह बहु-सेवा Java अनुप्रयोग  
   **वेळ:** 60-90 मिनिटे | **खर्च:** $80-200/महिना  
   **शिकाल:** Spring Boot तैनात करणे, सेवा मेष, लोड बॅलंसिंग  
   **अपेक्षित परिणाम:** सेवा शोध आणि रूटिंगसह बहु-सेवा Java प्रणाली

### Microsoft Foundry टेम्पलेट्स

1. **[Azure OpenAI Chat अॅप - स्थानिक उदाहरण](../../../examples/azure-openai-chat)** ⭐⭐  
   GPT-4 तैनातीसह पूर्ण चॅट इंटरफेस  
   **वेळ:** 35-45 मिनिटे | **खर्च:** $50-200/महिना  
   **अपेक्षित परिणाम:** टोकन ट्रॅकिंग आणि खर्च देखरेखसह कार्यरत चॅट अॅप

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG आर्किटेक्चरसह बुद्धिमान चॅट अॅप  
   **वेळ:** 60-90 मिनिटे | **खर्च:** $100-300/महिना  
   **अपेक्षित परिणाम:** दस्तऐवज शोध आणि संदर्भांसह RAG-चालित चॅट इंटरफेस

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI सेवा वापरून दस्तऐवज विश्लेषण  
   **वेळ:** 40-60 मिनिटे | **खर्च:** $20-80/महिना  
   **अपेक्षित परिणाम:** अपलोड केलेल्या दस्तऐवजांमधून मजकूर, तक्ता आणि घटक काढणारा API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning सह MLOps कार्यप्रवाह  
   **वेळ:** 2-3 तास | **खर्च:** $150-500/महिना  
   **अपेक्षित परिणाम:** प्रशिक्षण, तैनाती आणि देखरेखसह स्वयंचलित ML पाईपलाईन

### प्रत्यक्ष जगातील परिदृश्ये

#### **Retail Multi-Agent Solution** 🆕  
**[पूर्ण अंमलबजावणी मार्गदर्शक](./retail-scenario.md)**

एक व्यापक, उत्पादनासाठी तयार मल्टी-एजंट ग्राहक समर्थन सोल्युशन जे एंटरप्राइझ-ग्रेड AI अनुप्रयोग तैनाती AZD सह दर्शवते. या परिदृश्यात आहे:

- **पूर्ण आर्किटेक्चर:** ग्राहक सेवा आणि साठा व्यवस्थापन एजंटसह मल्टी-एजंट प्रणाली
- **उत्पादन इन्फ्रास्ट्रक्चर**: मल्टी-क्षेत्र Azure OpenAI तैनाती, AI Search, कंटेनर अॅप्स, आणि सर्वसमावेशक मॉनिटरिंग  
- **तैनातीस तयार ARM टेम्पलेट**: एक-क्लिक तैनाती अनेक कॉन्फिगरेशन मोडसह (Minimal/Standard/Premium)  
- **प्रगत वैशिष्ट्ये**: रेड टीमिंग सुरक्षा पडताळणी, एजंट मूल्यांकन फ्रेमवर्क, खर्च अनुकूलन, आणि समस्या निवारण मार्गदर्शिका  
- **खऱ्या व्यवसाय संदर्भात**: रिटेलर ग्राहक समर्थन वापर प्रकरण, फाइल अपलोड, शोध एकत्रीकरण, आणि डायनॅमिक स्केलिंग  

**तंत्रज्ञान**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, कंटेनर अॅप्स, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**संकुलता**: ⭐⭐⭐⭐ (प्रगत - एंटरप्राइझ उत्पादनासाठी तयार)  

**संपूर्ण**: AI विकसक, सोल्यूशन आर्किटेक्ट, आणि उत्पादन मल्टी-एजंट सिस्टम तयार करणाऱ्या टीमसाठी  

**जलद प्रारंभ**: समग्र सोल्यूशन 30 मिनिटांमध्ये तैनात करा समाविष्ट ARM टेम्पलेटसह `./deploy.sh -g myResourceGroup` वापरून  

## 📋 वापर सूचना  

### पूर्वअटी  

कोणतीही उदाहरण चालवण्यापूर्वी:  
- ✅ Azure सदस्यता ज्यामध्ये Owner किंवा Contributor अधिकार असावेत  
- ✅ Azure Developer CLI स्थापित ([स्थापना मार्गदर्शिका](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop चालू असावा (कंटेनर उदाहरणांसाठी)  
- ✅ योग्य Azure कोट्या (विशिष्ट उदाहरणाच्या गरजांसाठी तपासा)  

> **💰 खर्च सूचना:** सर्व उदाहरणे खरी Azure संसाधने तयार करतात ज्यामुळे खर्च होतो. खर्च अंदाजासाठी वैयक्तिक README फाईल पहा. पूर्ण झाल्यावर `azd down` चालवा जेणेकरून अखंड खर्च टाळता येईल.  

### उदाहरण स्थानिकरीत्या चालवणे  

1. **उदाहरण क्लोन किंवा कॉपी करा**  
   ```bash
   # इच्छित उदाहरणाकडे जा
   cd examples/simple-web-app
   ```
  
2. **AZD पर्यावरण प्रारंभ करा**  
   ```bash
   # विद्यमान टेम्प्लेट सह प्रारंभ करा
   azd init
   
   # किंवा नवीन वातावरण तयार करा
   azd env new my-environment
   ```
  
3. **पर्यावरण कॉन्फिगर करा**  
   ```bash
   # आवश्यक चल सेट करा
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **तैनात करा**  
   ```bash
   # इन्फ्रास्ट्रक्चर आणि अनुप्रयोग तैनात करा
   azd up
   ```
  
5. **तैनाती पडताळा**  
   ```bash
   # सेवा टोकांचे मिळवा
   azd env get-values
   
   # टोकाचा वापर चाचणी करा (उदाहरण)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **अपेक्षित यश निर्देशांकः**  
   - ✅ `azd up` त्रुटीशिवाय पूर्ण होणे  
   - ✅ सेवा एंडपॉइंट HTTP 200 परत करणे  
   - ✅ Azure पोर्टलवर "Running" स्थिती दर्शविणे  
   - ✅ Application Insights टेलिमेट्री प्राप्त करणे  

> **⚠️ समस्या?** तैनाती समस्या निवारणासाठी [सामान्य समस्या](../docs/chapter-07-troubleshooting/common-issues.md) पहा  

### उदाहरणांचे रुपांतर  

प्रत्येक उदाहरणात समाविष्ट आहे:  
- **README.md** - सविस्तर सेटअप आणि सानुकूलन सूचना  
- **azure.yaml** - टिप्पण्या सहित AZD कॉन्फिगरेशन  
- **infra/** - पॅरामिटर समजावणीसह बायसेप टेम्पलेट्स  
- **src/** - नमुना अनुप्रयोग कोड  
- **scripts/** - सामान्य कामांसाठी सहाय्यक स्क्रिप्ट्स  

## 🎯 शिकण्याचे उद्दिष्ट  

### उदाहरण गट  

#### **मूलभूत तैनाती**  
- एकल-सेवा अनुप्रयोग  
- सोपी इन्फ्रास्ट्रक्चर नमुने  
- मूलभूत कॉन्फिगरेशन व्यवस्थापन  
- खर्च-कमी विकास सेटअप  

#### **प्रगत प्रकरणे**  
- मल्टी-सेवा आर्किटेक्चर  
- जटिल नेटवर्किंग कॉन्फिगरेशन  
- डेटाबेस एकत्रीकरण नमुने  
- सुरक्षा आणि अनुपालन अंमलबजावणी  

#### **उत्पादनासाठी तयार नमुने**  
- उच्च उपलब्धता कॉन्फिगरेशन  
- मॉनिटरिंग आणि निरीक्षण  
- CI/CD एकत्रीकरण  
- आपत्ती पुनर्प्राप्ती सेटअप  

## 📖 उदाहरण वर्णने  

### सोपा वेब अॅप - Node.js Express  
**तंत्रज्ञान**: Node.js, Express, MongoDB, कंटेनर अॅप्स  
**संकुलता**: नवोदित  
**संकल्पना**: मूलभूत तैनाती, REST API, NoSQL डेटाबेस एकत्रीकरण  

### स्थिर वेबसाइट - React SPA  
**तंत्रज्ञान**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**संकुलता**: नवोदित  
**संकल्पना**: स्थिर होस्टिंग, सर्व्हरलेस बॅकएंड, आधुनिक वेब विकास  

### कंटेनर अॅप - Python Flask  
**तंत्रज्ञान**: Python Flask, Docker, कंटेनर अॅप्स, कंटेनर रजिस्ट्री, Application Insights  
**संकुलता**: नवोदित  
**संकल्पना**: कंटेनरीकरण, REST API, स्केल-टू-झीरो, हेल्थ प्रोब्ज, मॉनिटरिंग  
**स्थान**: [स्थानिक उदाहरण](../../../examples/container-app/simple-flask-api)  

### कंटेनर अॅप - मायक्रोसर्व्हिसेस आर्किटेक्चर  
**तंत्रज्ञान**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, कंटेनर अॅप्स  
**संकुलता**: प्रगत  
**संकल्पना**: मल्टी-सेवा आर्किटेक्चर, सेवा संवाद, मेसेज क्यूइंग, वितरित ट्रेसींग  
**स्थान**: [स्थानिक उदाहरण](../../../examples/container-app/microservices)  

### डेटाबेस अॅप - C# सह Azure SQL  
**तंत्रज्ञान**: C# ASP.NET Core, Azure SQL Database, App Service  
**संकुलता**: मध्यम  
**संकल्पना**: Entity Framework, डेटाबेस कनेक्शन, वेब API विकास  

### सर्व्हरलेस फंक्शन - Python Azure Functions  
**तंत्रज्ञान**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**संकुलता**: मध्यम  
**संकल्पना**: इव्हेंट-चालित आर्किटेक्चर, सर्व्हरलेस संगणन, फुल-स्टॅक विकास  

### मायक्रोसर्व्हिसेस - Java Spring Boot  
**तंत्रज्ञान**: Java Spring Boot, कंटेनर अॅप्स, Service Bus, API Gateway  
**संकुलता**: मध्यम  
**संकल्पना**: मायक्रोसर्व्हिसेस संवाद, वितरित प्रणाली, एंटरप्राइझ नमुने  

### Microsoft Foundry उदाहरणे  

#### Azure OpenAI चॅट अॅप  
**तंत्रज्ञान**: Azure OpenAI, Cognitive Search, App Service  
**संकुलता**: मध्यम  
**संकल्पना**: RAG आर्किटेक्चर, व्हेक्टर शोध, LLM एकत्रीकरण  

#### AI दस्तऐवज प्रक्रिया  
**तंत्रज्ञान**: Azure AI Document Intelligence, Storage, Functions  
**संकुलता**: मध्यम  
**संकल्पना**: दस्तऐवज विश्लेषण, OCR, डेटा काढणी  

#### मशीन लर्निंग पाइपलाइन  
**तंत्रज्ञान**: Azure ML, MLOps, कंटेनर रजिस्ट्री  
**संकुलता**: प्रगत  
**संकल्पना**: मॉडेल प्रशिक्षण, तैनात पाइपलाइन, मॉनिटरिंग  

## 🛠 कॉन्फिगरेशन उदाहरणे  

`configurations/` निर्देशिकेत पुनर्वापरयोग्य घटक आहेत:  

### पर्यावरण कॉन्फिगरेशन  
- विकास पर्यावरण सेटिंग्ज  
- स्टेजिंग पर्यावरण कॉन्फिगरेशन  
- उत्पादनासाठी तयार कॉन्फिगरेशन  
- मल्टी-क्षेत्र तैनाती सेटअप  

### बायसेप मॉड्यूल  
- पुनर्वापरयोग्य इन्फ्रास्ट्रक्चर घटक  
- सामान्य संसाधन नमुने  
- सुरक्षा कडक टेम्पलेट्स  
- खर्च-समर्थित कॉन्फिगरेशन  

### सहाय्यक स्क्रिप्ट्स  
- पर्यावरण सेटअप ऑटोमेशन  
- डेटाबेस स्थलांतर स्क्रिप्ट्स  
- तैनात पडताळणी साधने  
- खर्च मॉनिटरिंग युटिलिटीज  

## 🔧 सानुकूलन मार्गदर्शक  

### आपल्या वापरासाठी उदाहरणे रुपांतरित करणे  

1. **पूर्वअटी तपासा**  
   - Azure सेवा आवश्यकता तपासा  
   - सदस्यता मर्यादा तपासा  
   - खर्च परिणाम समजून घ्या  

2. **कॉन्फिगरेशन बदला**  
   - `azure.yaml` सेवा व्याख्या अपडेट करा  
   - बायसेप टेम्पलेट्स सानुकूलित करा  
   - पर्यावरण चल बदल करा  

3. **संपूर्ण चाचणी करा**  
   - प्रथम विकास पर्यावरणात तैनात करा  
   - कार्यक्षमता पडताळा  
   - स्केलिंग आणि परफॉर्मन्स टेस्ट करा  

4. **सुरक्षा पुनरावलोकन**  
   - प्रवेश नियंत्रण तपासा  
   - गुपित व्यवस्थापन राबवा  
   - मॉनिटरिंग आणि अलर्टिंग सक्षम करा  

## 📊 तुलना मॅट्रिक्स  

| उदाहरण | सेवा | डेटाबेस | प्रमाणपत्र | मॉनिटरिंग | संकुलता |  
|---------|-------|----------|------------|------------|----------|  
| **Azure OpenAI Chat** (स्थानिक) | 2 | ❌ | Key Vault | पूर्ण | ⭐⭐ |  
| **Python Flask API** (स्थानिक) | 1 | ❌ | मूलभूत | पूर्ण | ⭐ |  
| **मायक्रोसर्व्हिसेस** (स्थानिक) | 5+ | ✅ | एंटरप्राइझ | प्रगत | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | मूलभूत | मूलभूत | ⭐ |  
| React SPA + Functions | 3 | ✅ | मूलभूत | पूर्ण | ⭐ |  
| Python Flask कंटेनर | 2 | ❌ | मूलभूत | पूर्ण | ⭐ |  
| C# Web API + SQL | 2 | ✅ | पूर्ण | पूर्ण | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | पूर्ण | पूर्ण | ⭐⭐ |  
| Java मायक्रोसर्व्हिसेस | 5+ | ✅ | पूर्ण | पूर्ण | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | पूर्ण | पूर्ण | ⭐⭐⭐ |  
| AI दस्तऐवज प्रक्रिया | 2 | ❌ | मूलभूत | पूर्ण | ⭐⭐ |  
| ML पाइपलाइन | 4+ | ✅ | पूर्ण | पूर्ण | ⭐⭐⭐⭐ |  
| **रिटेल मल्टी-एजंट** (स्थानिक) | **8+** | **✅** | **एंटरप्राइझ** | **प्रगत** | **⭐⭐⭐⭐** |  

## 🎓 शिकण्याचा मार्ग  

### शिफारस केलेली प्रगती  

1. **सोप्या वेब अॅपपासून प्रारंभ करा**  
   - मूलभूत AZD संकल्पना शिका  
   - तैनाती कार्यप्रवाह समजून घ्या  
   - पर्यावरण व्यवस्थापनाचा सराव करा  

2. **स्थिर वेबसाइट आजमावा**  
   - वेगवेगळ्या होस्टिंग पर्यायांचा शोध घ्या  
   - CDN एकत्रीकरणाबद्दल शिका  
   - DNS कॉन्फिगरेशन समजून घ्या  

3. **कंटेनर अॅपकडे जा**  
   - कंटेनरीकरण मूलभूत गोष्टी शिका  
   - स्केलिंग संकल्पना समजून घ्या  
   - Docker वापरुन सराव करा  

4. **डेटाबेस एकत्रीकरण जोडा**  
   - डेटाबेस प्रोव्हिजनिंग शिका  
   - कनेक्शन स्ट्रिंग्ज समजून घ्या  
   - गुपित व्यवस्थापनाचा सराव करा  

5. **सर्व्हरलेस एक्सप्लोर करा**  
   - इव्हेंट-चालित आर्किटेक्चर समजून घ्या  
   - ट्रिगर आणि बाइंडिंगबद्दल शिका  
   - API वापरून सराव करा  

6. **मायक्रोसर्व्हिसेस बांधा**  
   - सेवा संवाद शिका  
   - वितरित प्रणाली समजून घ्या  
   - जटिल तैनातींचा सराव करा  

## 🔍 योग्य उदाहरण शोधणे  

### तंत्रज्ञान स्टॅकनुसार  
- **कंटेनर अॅप्स**: [Python Flask API (स्थानिक)](../../../examples/container-app/simple-flask-api), [मायक्रोसर्व्हिसेस (स्थानिक)](../../../examples/container-app/microservices), Java मायक्रोसर्व्हिसेस  
- **Node.js**: Node.js Express Todo अॅप, [मायक्रोसर्व्हिसेस API गेटवे (स्थानिक)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (स्थानिक)](../../../examples/container-app/simple-flask-api), [मायक्रोसर्व्हिसेस प्रॉडक्ट सेवा (स्थानिक)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [मायक्रोसर्व्हिसेस ऑर्डर सेवा (स्थानिक)](../../../examples/container-app/microservices), C# Web API + SQL डेटाबेस, Azure OpenAI Chat अॅप, ML पाइपलाइन  
- **Go**: [मायक्रोसर्व्हिसेस युझर सेवा (स्थानिक)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot मायक्रोसर्व्हिसेस  
- **React**: React SPA + Functions  
- **कंटेनर्स**: [Python Flask (स्थानिक)](../../../examples/container-app/simple-flask-api), [मायक्रोसर्व्हिसेस (स्थानिक)](../../../examples/container-app/microservices), Java मायक्रोसर्व्हिसेस  
- **डेटाबेस**: [मायक्रोसर्व्हिसेस (स्थानिक)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (स्थानिक)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat अॅप, AI दस्तऐवज प्रक्रिया, ML पाइपलाइन, **रिटेल मल्टी-एजंट सोल्यूशन**  
- **मल्टी-एजंट सिस्टम्स**: **रिटेल मल्टी-एजंट सोल्यूशन**  
- **OpenAI एकत्रीकरण**: **[Azure OpenAI Chat (स्थानिक)](../../../examples/azure-openai-chat)**, रिटेल मल्टी-एजंट सोल्यूशन  
- **एंटरप्राइझ उत्पादन**: [मायक्रोसर्व्हिसेस (स्थानिक)](../../../examples/container-app/microservices), **रिटेल मल्टी-एजंट सोल्यूशन**  

### आर्किटेक्चर नमुन्यानुसार  
- **सोप्या REST API**: [Python Flask API (स्थानिक)](../../../examples/container-app/simple-flask-api)  
- **मोनोलिथिक**: Node.js Express Todo, C# Web API + SQL  
- **स्थिर + सर्व्हरलेस**: React SPA + Functions, Python Functions + SPA  
- **मायक्रोसर्व्हिसेस**: [उत्पादन मायक्रोसर्व्हिसेस (स्थानिक)](../../../examples/container-app/microservices), Java Spring Boot मायक्रोसर्व्हिसेस  
- **कंटेनरायझ्ड**: [Python Flask (स्थानिक)](../../../examples/container-app/simple-flask-api), [मायक्रोसर्व्हिसेस (स्थानिक)](../../../examples/container-app/microservices)  
- **AI-चालित**: **[Azure OpenAI Chat (स्थानिक)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat अॅप, AI दस्तऐवज प्रक्रिया, ML पाइपलाइन, **रिटेल मल्टी-एजंट सोल्यूशन**  
- **मल्टी-एजंट आर्किटेक्चर**: **रिटेल मल्टी-एजंट सोल्यूशन**  
- **एंटरप्राइझ मल्टी-सेवा**: [मायक्रोसर्व्हिसेस (स्थानिक)](../../../examples/container-app/microservices), **रिटेल मल्टी-एजंट सोल्यूशन**  

### संकुलता स्तरानुसार  
- **नवोदित**: [Python Flask API (स्थानिक)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **मध्यम**: **[Azure OpenAI Chat (स्थानिक)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java मायक्रोसर्व्हिसेस, Azure OpenAI Chat अॅप, AI दस्तऐवज प्रक्रिया  
- **प्रगत**: ML पाइपलाइन  
- **एंटरप्राइझ उत्पादनासाठी तयार**: [मायक्रोसर्व्हिसेस (स्थानिक)](../../../examples/container-app/microservices) (मेसेज क्यूइंगसह मल्टी-सेवा), **रिटेल मल्टी-एजंट सोल्यूशन** (संपूर्ण मल्टी-एजंट सिस्टम ARM टेम्पलेट तैनातीसह)  

## 📚 अतिरिक्त स्रोत  

### दस्तऐवज लिंक  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Bicep दस्तऐवज](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure आर्किटेक्चर सेंटर](https://learn.microsoft.com/en-us/azure/architecture/)  

### समुदायाचे उदाहरणे  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI गॅलरी](https://azure.github.io/awesome-azd/)  
- [C# आणि Azure SQL सह Todo अॅप](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Python आणि MongoDB सह Todo अॅप](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js आणि PostgreSQL सह Todo अॅप](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API सह React वेब अॅप](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure कंटेनर अॅप्स जॉब](https://github.com/Azure-Samples/container-apps-jobs)
- [Java सह Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### सर्वोत्तम पद्धती
- [Azure वेल-आर्किटेक्टेड फ्रेमवर्क](https://learn.microsoft.com/en-us/azure/well-architected/)
- [क्लाउड अ‍ॅडॉप्शन फ्रेमवर्क](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 उदाहरणे देण्याबाबत

आपल्याकडे सामायिक करण्यासाठी उपयुक्त उदाहरण आहे का? आम्ही योगदानाचे स्वागत करतो!

### सबमिशन मार्गदर्शक तत्त्वे
1. स्थापन केलेली डिरेक्टरी संरचना पाळा
2. संपूर्ण README.md समाविष्ट करा
3. कॉन्फिगरेशन फाइल्समध्ये टिप्पण्या जोडा
4. सादर करण्याआधी नीट तपासा
5. खर्च अंदाज आणि आवश्यकता समाविष्ट करा

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

**प्रो टिप**: आपण ज्या तंत्रज्ञान स्टॅकमध्ये आहात त्या सोप्या उदाहरणापासून प्रारंभ करा, मग हळूहळू अधिक क्लिष्ट परिस्थितींकडे जा. प्रत्येक उदाहरण मागील संकल्पनांवर आधारित असते!

## 🚀 तयार आहात का सुरुवात करण्यासाठी?

### आपली शिकण्याची मार्गधर्शिका

1. **पूर्णपणे नवशिक्या?** → [Flask API](../../../examples/container-app/simple-flask-api) पासून सुरुवात करा (⭐, २० मिनिटे)
2. **थोडे AZD ज्ञान आहे?** → [मायक्रोसर्व्हिसेस](../../../examples/container-app/microservices) वापरून पाहा (⭐⭐⭐⭐, ६० मिनिटे)
3. **एआय अॅप्स तयार करीत आहात?** → [Azure OpenAI Chat](../../../examples/azure-openai-chat) पासून सुरुवात करा (⭐⭐, ३५ मिनिटे) किंवा [Retail Multi-Agent](retail-scenario.md) एक्सप्लोर करा (⭐⭐⭐⭐, २+ तास)
4. **विशिष्ट तंत्रज्ञान स्टॅक पाहिजे का?** → वरच्या [योग्य उदाहरण शोधा](../../../examples) विभागाचा वापर करा

### पुढील टप्पे

- ✅ वर दिलेल्या [आवश्यकता](../../../examples) पुनरावलोकन करा
- ✅ आपल्याला योग्य असलेले उदाहरण निवडा (पहा [क्लिष्टता मार्गदर्शक](../../../examples))
- ✅ उदाहरणाच्या README नीट वाचून डिप्लॉय करा
- ✅ परीक्षणानंतर `azd down` चालवण्याची आठवण ठेवा
- ✅ GitHub इश्यूज किंवा डिस्कशन्सद्वारे आपला अनुभव शेअर करा

### मदतीची गरज आहे काय?

- 📖 [FAQ](../resources/faq.md) - सामान्य प्रश्नांची उत्तरे
- 🐛 [ट्रबलशूटिंग मार्गदर्शिका](../docs/chapter-07-troubleshooting/common-issues.md) - डिप्लॉयमेंट समस्या सोडवा
- 💬 [GitHub डिस्कशन्स](https://github.com/microsoft/AZD-for-beginners/discussions) - समुदायाला प्रश्न विचारा
- 📚 [अभ्यास मार्गदर्शिका](../resources/study-guide.md) - आपले शिक्षण सुदृढ करा

---

**नॅव्हिगेशन**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../README.md)
- **📖 अभ्यास साहित्य**: [अभ्यास मार्गदर्शिका](../resources/study-guide.md) | [चिट शीट](../resources/cheat-sheet.md) | [शब्दावली](../resources/glossary.md)
- **🔧 स्रोत**: [FAQ](../resources/faq.md) | [ट्रबलशूटिंग](../docs/chapter-07-troubleshooting/common-issues.md)

---

*शेवटचे अद्यतन: नोव्हेंबर २०२५ | [समस्या नोंदवा](https://github.com/microsoft/AZD-for-beginners/issues) | [उदाहरणे दान करा](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**सूचना**:
हे दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केले गेले आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेचा अभाव असू शकतो. मूळ दस्तऐवज त्याच्या स्थानिक भाषेत प्राथमिक स्रोत मानला पाहिजे. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवाद करणे शिफारसीय आहे. या अनुवादाचा वापर केल्यामुळे झालेल्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थविक interpretations साठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->