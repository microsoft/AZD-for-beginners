# उदाहरणे - वैयक्तिक AZD टेम्प्लेट्स आणि कॉन्फिगरेशन

**उदाहरणांद्वारे शिकणे - प्रकरणानुसार आयोजन**
- **📚 अभ्यासक्रम मुख्यपृष्ठ**: [AZD For Beginners](../README.md)
- **📖 प्रकरण नकाशा**: शिकण्याच्या गुंतागुंतीनुसार उदाहरणे आयोजित केली आहेत
- **🚀 स्थानिक उदाहरण**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 बाह्य AI उदाहरणे**: Azure Samples रिपॉझिटरीजकडे दुवे

> **📍 महत्त्वाचे: स्थानिक विरुद्ध बाह्य उदाहरणे**  
> या रिपॉझिटरीमध्ये **4 पूर्ण स्थानिक उदाहरणे** आहेत ज्यात संपूर्ण अंमलबजावणी आहे:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 चा चॅट इंटरफेससह डिप्लॉयमेंट)  
> - **Container Apps** (साधे Flask API + मायक्रोसर्व्हिसेस)  
> - **Database App** (वेब + SQL डेटाबेस)  
> - **Retail Multi-Agent** (एंटरप्राइझ AI सोल्यूशन)  
>  
> अतिरिक्त उदाहरणे Azure-Samples रिपॉझिटरीजचे **बाह्य संदर्भ** आहेत जे तुम्ही क्लोन करू शकता.

## परिचय

हा निर्देशिका तुम्हाला Azure Developer CLI शिकलो यासाठी व्यावहारिक उदाहरणे आणि संदर्भ पुरवते. Retail Multi-Agent сценарियो हा या रिपॉझिटरीमध्ये समाविष्ट केलेला एक पूर्ण, उत्पादन-तयार अंमलबजावणी आहे. अतिरिक्त उदाहरणे विविध AZD पॅटर्न दर्शविणाऱ्या अधिकृत Azure Samples चे संदर्भ आहेत.

### गुंतागुंतीचे मूल्यमापन

- ⭐ **प्राथमिक** - मूलभूत संकल्पना, एक सेवा, 15-30 मिनिटे  
- ⭐⭐ **मध्यम** - एकाधिक सेवा, डेटाबेस एकत्रीकरण, 30-60 मिनिटे  
- ⭐⭐⭐ **उन्नत** - गुंतागुंतीची रचना, AI समाकलन, 1-2 तास  
- ⭐⭐⭐⭐ **तज्ञ** - उत्पादन-तयार, एंटरप्राइझ पॅटर्न, 2+ तास

## 🎯 या रिपॉझिटरीमध्ये काय आहे

### ✅ स्थानिक अंमलबजावणी (उपयोगासाठी तयार)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**gpt-4.1 चा चॅट इंटरफेससह पूर्ण डिप्लॉयमेंट या रिपॉझिटरीमध्ये समाविष्ट**

- **स्थान:** `examples/azure-openai-chat/`  
- **गुंतागुंती:** ⭐⭐ (मध्यम)  
- **समाविष्ट:**  
  - Microsoft Foundry Models चा पूर्ण डिप्लॉयमेंट (gpt-4.1)  
  - पाइथन कमांड-लाइन चॅट इंटरफेस  
  - सुरक्षित API कीसाठी Key Vault समाकलन  
  - Bicep इन्फ्रास्ट्रक्चर टेम्प्लेट्स  
  - टोकन वापर व खर्च ट्रॅकिंग  
  - दर मर्यादा आणि त्रुटी हाताळणी  

**जलद सुरुवात:**  
```bash
# उदाहरणाकडे जा
cd examples/azure-openai-chat

# सर्वकाही तैनात करा
azd up

# अवलंबित्वे स्थापित करा आणि संभाषण सुरू करा
pip install -r src/requirements.txt
python src/chat.py
```
  
**तंत्रज्ञान:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**संपूर्ण कंटेनर डिप्लॉयमेंट उदाहरणे या रिपॉझिटरीमध्ये समाविष्ट**

- **स्थान:** `examples/container-app/`  
- **गुंतागुंती:** ⭐-⭐⭐⭐⭐ (प्राथमिक ते उन्नत)  
- **समाविष्ट:**  
  - [मास्टर गाइड](container-app/README.md) - कंटेनर डिप्लॉयमेंटचा पूर्ण आढावा  
  - [सिंपल Flask API](../../../examples/container-app/simple-flask-api) - मूलभूत REST API उदाहरण  
  - [मायक्रोसर्व्हिस आर्किटेक्चर](../../../examples/container-app/microservices) - उत्पादन-तयार मल्टी-सर्व्हिस डिप्लॉयमेंट  
  - जलद सुरुवात, उत्पादन, आणि उन्नत पॅटर्न्स  
  - मॉनिटरिंग, सुरक्षा आणि खर्च ऑप्टिमायझेशन  

**जलद सुरुवात:**  
```bash
# मास्टर मार्गदर्शक पहा
cd examples/container-app

# सोपी फ्लास्क API तैनात करा
cd simple-flask-api
azd up

# मायक्रोसर्व्हिसेस उदाहरण तैनात करा
cd ../microservices
azd up
```
  
**तंत्रज्ञान:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕  
**पूर्ण उत्पादन-तयार अंमलबजावणी या रिपॉझिटरीमध्ये समाविष्ट**

- **स्थान:** `examples/retail-multiagent-arm-template/`  
- **गुंतागुंती:** ⭐⭐⭐⭐ (उन्नत)  
- **समाविष्ट:**  
  - पूर्ण ARM डिप्लॉयमेंट टेम्प्लेट  
  - मल्टी-एजंट रचना (कस्टमर + इन्व्हेंटरी)  
  - Microsoft Foundry Models चे समाकलन  
  - RAG सह AI सर्च  
  - व्यापक मॉनिटरिंग  
  - एक-क्लिक डिप्लॉयमेंट स्क्रिप्ट  

**जलद सुरुवात:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**तंत्रज्ञान:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 बाह्य Azure Samples (क्लोन करून वापरा)

खालील उदाहरणे अधिकृत Azure-Samples रिपॉझिटरीजमध्ये व्यवस्थापित आहेत. विविध AZD पॅटर्न्स एक्सप्लोर करण्यासाठी त्यांना क्लोन करा:

### साधी अॅप्लिकेशन्स (प्रकरणे 1-2)

| टेम्प्लेट | रिपॉझिटरी | गुंतागुंती | सेवा |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [स्थानिक: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [स्थानिक: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | मल्टी-सर्व्हिस, सर्व्हिस बस, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**वापरण्याची पद्धत:**  
```bash
# कोणतेही उदाहरण क्लोन करा
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# तैनात करा
azd up
```
  
### AI अॅप्लिकेशन उदाहरणे (प्रकरणे 2, 5, 8)

| टेम्प्लेट | रिपॉझिटरी | गुंतागुंती | लक्ष केंद्रित |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [स्थानिक: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 डिप्लॉयमेंट |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | मूलभूत AI चॅट |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | एजेंट फ्रेमवर्क |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG पॅटर्न |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | एंटरप्राइझ AI |

### डेटाबेस आणि उन्नत पॅटर्न्स (प्रकरणे 3-8)

| टेम्प्लेट | रिपॉझिटरी | गुंतागुंती | लक्ष केंद्रित |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | डेटाबेस इंटीग्रेशन |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL सर्व्हरलेस |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | मल्टी-सर्व्हिस |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## शिकण्याचे उद्दिष्टे

या उदाहरणांवर काम करून तुम्ही:  
- वास्तविक अॅप्लिकेशन परिस्थितींमध्ये Azure Developer CLI वर्कफ्लोज प्रॅक्टिस कराल  
- वेगवेगळ्या अॅप्लिकेशन रचने आणि त्यांचे azd अंमलबजावणी समजून घ्याल  
- विविध Azure सेवांसाठी Infrastructure as Code पॅटर्न्स मास्टर कराल  
- कॉन्फिगरेशन व्यवस्थापन आणि वातावरण-विशिष्ट डिप्लॉयमेंट धोरणे लागू कराल  
- व्यावहारिक संदर्भात मॉनिटरिंग, सुरक्षा, आणि स्केलिंग पॅटर्न्स अंमलात आणाल  
- तांत्रिक अडचणी सोडवण्याचा आणि डीबगिंगचा अनुभव मिळवाल

## शिकण्याचे परिणाम

या उदाहरणांचा अभ्यास पूर्ण केल्यावर तुम्ही:  
- Azure Developer CLI वापरून विविध प्रकारची अॅप्लिकेशन्स आत्मविश्वासाने डिप्लॉय करू शकाल  
- तुमच्या स्वतःच्या अॅप्लिकेशन गरजेनुसार उपलब्ध टेम्प्लेट्स अनुकूलित करू शकाल  
- Bicep वापरून सानुकूल इन्फ्रास्ट्रक्चर पॅटर्न्स डिझाइन आणि अंमलात आणू शकाल  
- योग्य अवलंबित्वांसह कॉम्प्लेक्स मल्टी-सर्व्हिस अॅप्लिकेशन्स कॉन्फिगर करू शकाल  
- वास्तविक परिस्थितींमध्ये सुरक्षा, मॉनिटरिंग, आणि कार्यक्षमता सर्वोत्तम पद्धती लागू करू शकाल  
- व्यावहारिक अनुभवावर आधारित डिप्लॉयमेंट्सचे समस्यांचे निवारण आणि ऑप्टिमायझेशन करू शकाल

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
  
## जलद सुरुवात उदाहरणे

> **💡 AZD मध्ये नवीन आहात?** उदाहरण #1 (Flask API) पासून प्रारंभ करा - याला ~20 मिनिटे लागतात आणि मूलभूत संकल्पना शिकवतात.

### प्रारंभिकांसाठी
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (स्थानिक) ⭐  
   साधा REST API स्केल-टू-झिरो सह डिप्लॉय करा  
   **वेळ:** 20-25 मिनिटे | **खर्च:** $0-5/महिना  
   **तुम्ही शिकाल:** बेसिक azd वर्कफ्लो, कंटेनरायझेशन, हेल्थ प्रोब्स  
   **अपेक्षित परिणाम:** "Hello, World!" परत करणारा कार्यरत API एंडपॉईंट मॉनिटरिंगसह

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB सह Node.js Express वेब अॅप्लिकेशन डिप्लॉय करा  
   **वेळ:** 25-35 मिनिटे | **खर्च:** $10-30/महिना  
   **तुम्ही शिकाल:** डेटाबेस इंटीग्रेशन, पर्यावरण बदलणारे, कनेक्शन स्ट्रिंग्स  
   **अपेक्षित परिणाम:** टुडू लिस्ट अॅप क्रिएट/रीड/अपडेट/डिलीट फंक्शनैलिटीसह

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps सह React स्थिर वेबसाईट होस्ट करा  
   **वेळ:** 20-30 मिनिटे | **खर्च:** $0-10/महिना  
   **तुम्ही शिकाल:** स्थिर होस्टिंग, सर्व्हरलेस फंक्शन्स, CDN डिप्लॉयमेंट  
   **अपेक्षित परिणाम:** API बॅकएंडसह React UI, ऑटोमॅटिक SSL, ग्लोबल CDN

### मध्यम वापरकर्त्यांसाठी
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (स्थानिक) ⭐⭐  
   gpt-4.1 चॅट इंटरफेससह आणि सुरक्षित API की व्यवस्थापनासह डिप्लॉय करा  
   **वेळ:** 35-45 मिनिटे | **खर्च:** $50-200/महिना  
   **तुम्ही शिकाल:** Microsoft Foundry Models डिप्लॉयमेंट, Key Vault समाकलन, टोकन ट्रॅकिंग  
   **अपेक्षित परिणाम:** gpt-4.1 आणि खर्च मॉनिटरिंगसह कार्यरत चॅट अॅप्लिकेशन

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (स्थानिक) ⭐⭐⭐⭐  
   उत्पादन-तयार मल्टी-सर्व्हिस आर्किटेक्चर  
   **वेळ:** 45-60 मिनिटे | **खर्च:** $50-150/महिना  
   **तुम्ही शिकाल:** सेवा संवाद, मेसेज क्यूइंग, वितरित ट्रेसिंग  
   **अपेक्षित परिणाम:** 2-सर्व्हिस सिस्टीम (API Gateway + Product Service) मॉनिटरिंगसह

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API आणि Azure SQL Database सह वेब अॅप्लिकेशन  
   **वेळ:** 30-45 मिनिटे | **खर्च:** $20-80/महिना  
   **तुम्ही शिकाल:** Entity Framework, डेटाबेस माइग्रेशन्स, कनेक्शन सुरक्षा  
   **अपेक्षित परिणाम:** Azure SQL बॅकएंडसह C# API, स्वयंचलित स्कीमा डिप्लॉयमेंट

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ट्रिगर आणि Cosmos DB सह Python Azure Functions  
   **वेळ:** 30-40 मिनिटे | **खर्च:** $10-40/महिना  
   **तुम्ही शिकाल:** इव्हेंट-चालित आर्किटेक्चर, सर्व्हरलेस स्केलिंग, NoSQL इंटीग्रेशन  
   **अपेक्षित परिणाम:** Cosmos DB स्टोरेजसह HTTP विनंत्यांना प्रतिसाद देणारे फंक्शन अॅप

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   कंटेनर अॅप्स आणि API गेटवे सह मल्टी-सर्व्हिस Java अॅप्लिकेशन  
   **वेळ:** 60-90 मिनिटे | **खर्च:** $80-200/महिना  
   **तुम्ही शिकाल:** Spring Boot डिप्लॉयमेंट, सेवा जाळे, लोड संतुलन  
   **अपेक्षित परिणाम:** सेवा शोध आणि राउटिंगसह मल्टी-सर्व्हिस Java सिस्टीम

### Microsoft Foundry टेम्प्लेट्स

1. **[Microsoft Foundry Models Chat App - स्थानिक उदाहरण](../../../examples/azure-openai-chat)** ⭐⭐  
   gpt-4.1 चा चॅट इंटरफेससह पूर्ण डिप्लॉयमेंट  
   **वेळ:** 35-45 मिनिटे | **खर्च:** $50-200/महिना  
   **अपेक्षित परिणाम:** टोकन ट्रॅकिंग आणि खर्च मॉनिटरिंगसह कार्यरत चॅट अॅप्लिकेशन

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG आर्किटेक्चरसह बुद्धिमान चॅट अॅप्लिकेशन  
   **वेळ:** 60-90 मिनिटे | **खर्च:** $100-300/महिना  
   **अपेक्षित परिणाम:** दस्तऐवज शोध आणि उद्धरणांसह RAG-चालित चॅट इंटरफेस

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI सेवांचा वापर करून दस्तऐवज विश्लेषण  
   **वेळ:** 40-60 मिनिटे | **खर्च:** $20-80/महिना  
   **अपेक्षित परिणाम:** अपलोड केलेल्या दस्तऐवजांमधून मजकूर, तक्ते, आणि घटक काढणारा API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning सह MLOps वर्कफ्लो  
   **वेळ:** 2-3 तास | **खर्च:** $150-500/महिना  
   **अपेक्षित परिणाम:** प्रशिक्षण, डिप्लॉयमेंट आणि मॉनिटरिंगसह स्वयंचलित ML पाइपलाइन

### खऱ्या जगातील परिस्थिती

#### **Retail Multi-Agent Solution** 🆕  
**[पूर्ण अंमलबजावणी मार्गदर्शक](./retail-scenario.md)**

एक व्यापक, उत्पादन-तयार मल्टी-एजंट ग्राहक समर्थन सोल्यूशन जे AZD सह एंटरप्राइझ-ग्रेड AI अॅप्लिकेशन डिप्लॉयमेंट प्रदर्शित करते. या परिस्थितीत समाविष्ट आहे:
- **पूर्ण आर्किटेक्चर**: विशेष ग्राहक सेवा आणि इन्व्हेंटरी व्यवस्थापन एजंटसह मल्टी-एजंट सिस्टम  
- **उत्पादन संरचना**: मल्टी-रिजन Microsoft Foundry Models डिप्लॉयमेंट, AI Search, कंटेनर अॅप्स आणि सर्वसमावेशक मॉनिटरिंग  
- **तयार-तो-डिप्लॉय ARM टेम्प्लेट**: अनेक कॉन्फिगरेशन मोडसह एक-क्लिक डिप्लॉयमेंट (Minimal/Standard/Premium)  
- **उन्नत वैशिष्ट्ये**: रेड टीमिंग सुरक्षा पडताळणी, एजंट मूल्यांकन चौकट, खर्च अनुकूलन आणि त्रुटी निवारण मार्गदर्शक  
- **खरा व्यवसाय संदर्भ**: फाइल अपलोड, शोध समाकलन आणि डायनॅमिक स्केलिंगसह रिटेलर ग्राहक समर्थन वापर प्रकरण  

**तंत्रज्ञान**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, कंटेनर अॅप्स, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**कठीणपणा**: ⭐⭐⭐⭐ (उन्नत - एंटरप्राइज उत्पादनासाठी तयार)  

**परिपूर्ण आहे**: AI विकसकांकरिता, सोल्युशन आर्किटेक्ट्स आणि उत्पादनातील मल्टी-एजंट सिस्टम तयार करणाऱ्या संघांसाठी  

**द्रुत प्रारंभ**: समाविष्ट ARM टेम्प्लेट वापरून 30 मिनिटांत पूर्ण सोल्युशन डिप्लॉय करा `./deploy.sh -g myResourceGroup` वापरून  

## 📋 वापर सूचना  

### पूर्वअटी  

कोणताही उदाहरण चालवण्यापूर्वी:  
- ✅ ओनर किंवा कंट्रीब्यूटर प्रवेशासह Azure सदस्यता  
- ✅ Azure Developer CLI स्थापित ([स्थापना मार्गदर्शक](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop चालू आहे (कंटेनर उदाहरणांसाठी)  
- ✅ योग्य Azure कोटा (प्रत्येक उदाहरणाच्या विशिष्ट आवश्यकता तपासा)  

> **💰 खर्च सूचना:** सर्व उदाहरणे वास्तविक Azure संसाधने तयार करतात ज्यावर शुल्क आकारले जाते. खर्च अंदाजासाठी स्वतंत्र README फाइल पहा. खर्च टाळण्यासाठी काम झाल्यावर `azd down` चालवा.  

### उदाहरणे स्थानिकरित्या चालवणे  

1. **उदाहरण क्लोन करा किंवा कॉपी करा**  
   ```bash
   # इच्छित उदाहरणाकडे जा
   cd examples/simple-web-app
   ```
  
2. **AZD पर्यावरण प्रारंभ करा**  
   ```bash
   # विद्यमान टेम्पलेटसह प्रारंभ करा
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
  
4. **डिप्लॉय करा**  
   ```bash
   # पायाभूत सुविधा आणि अनुप्रयोग तैनात करा
   azd up
   ```
  
5. **डिप्लॉय पुष्टी करा**  
   ```bash
   # सेवा समाप्तिबिंदू मिळवा
   azd env get-values
   
   # समाप्तिबिंदूची चाचणी करा (उदाहरण)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **अपेक्षित यशाचे निदर्शक:**  
   - ✅ `azd up` त्रुटीशिवाय पूर्ण होतो  
   - ✅ सेवा(endpoint) HTTP 200 परत करते  
   - ✅ Azure Portal "Running" स्थिती दर्शवितो  
   - ✅ Application Insights टेलीमेट्री प्राप्त करत आहे  

> **⚠️ समस्या?** डिप्लॉयमेंट समस्यांसाठी [सामान्य समस्या](../docs/chapter-07-troubleshooting/common-issues.md) पहा  

### उदाहरणे सानुकूलित करणे  

प्रत्येक उदाहरणामध्ये समाविष्ट आहे:  
- **README.md** - सविस्तर सेटअप आणि सानुकूलन सूचना  
- **azure.yaml** - टिप्पण्यांसह AZD कॉन्फिगरेशन  
- **infra/** - पॅरामीटरसह Bicep टेम्पलेट्स  
- **src/** - नमुना अॅप्लिकेशन कोड  
- **scripts/** - सामान्य कार्यांसाठी सहाय्यक स्क्रिप्ट्स  

## 🎯 शिक्षण उद्दिष्टे  

### उदाहरणांच्या श्रेणी  

#### **मूलभूत डिप्लॉयमेंट्स**  
- एकल-सेवा अॅप्लिकेशन्स  
- सोपी संरचना नमुने  
- मूलभूत कॉन्फिगरेशन व्यवस्थापन  
- खर्च बचतीचे विकसन सेटअप  

#### **उन्नत परिस्थिती**  
- बहु-सेवा आर्किटेक्चर  
- जटिल नेटवर्किंग कॉन्फिगरेशन  
- डेटाबेस समाकलन नमुने  
- सुरक्षा आणि अनुपालन अंमलबजावणी  

#### **उत्पादनासाठी तयार नमुने**  
- उच्च उपलब्धता कॉन्फिगरेशन  
- मॉनिटरिंग आणि निरीक्षण  
- CI/CD समाकलन  
- आपत्ती पुनर्प्राप्ती सेटअप  

## 📖 उदाहरण वर्णने  

### सोपा वेब अॅप - Node.js Express  
**तंत्रज्ञान**: Node.js, Express, MongoDB, कंटेनर अॅप्स  
**कठीणपणा**: नवशिक्या  
**संकल्पना**: मूलभूत डिप्लॉयमेंट, REST API, NoSQL डेटाबेस समाकलन  

### स्थिर वेबसाइट - React SPA  
**तंत्रज्ञान**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**कठीणपणा**: नवशिक्या  
**संकल्पना**: स्थिर होस्टिंग, सर्व्हरलेस बॅकएंड, आधुनिक वेब विकास  

### कंटेनर अॅप - Python Flask  
**तंत्रज्ञान**: Python Flask, Docker, कंटेनर अॅप्स, कंटेनर रजिस्ट्री, Application Insights  
**कठीणपणा**: नवशिक्या  
**संकल्पना**: कंटेनरायझेशन, REST API, शून्यावर स्केल करणे, हेल्थ प्रॉब्स, मॉनिटरिंग  
**स्थान**: [स्थानिक उदाहरण](../../../examples/container-app/simple-flask-api)  

### कंटेनर अॅप - मायक्रोसर्व्हिस आर्किटेक्चर  
**तंत्रज्ञान**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, कंटेनर अॅप्स  
**कठीणपणा**: उन्नत  
**संकल्पना**: बहु-सेवा आर्किटेक्चर, सेवा संवाद, मेसेज क्यूइंग, वितरित ट्रेसिंग  
**स्थान**: [स्थानिक उदाहरण](../../../examples/container-app/microservices)  

### डेटाबेस अॅप - C# सह Azure SQL  
**तंत्रज्ञान**: C# ASP.NET Core, Azure SQL Database, App Service  
**कठीणपणा**: मध्यम  
**संकल्पना**: Entity Framework, डेटाबेस कनेक्शन्स, वेब API विकास  

### सर्व्हरलेस फंक्शन - Python Azure Functions  
**तंत्रज्ञान**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**कठीणपणा**: मध्यम  
**संकल्पना**: इव्हेंट-चालित आर्किटेक्चर, सर्व्हरलेस कम्प्युटिंग, फुल-स्टॅक विकास  

### मायक्रोसर्व्हिसेस - Java Spring Boot  
**तंत्रज्ञान**: Java Spring Boot, कंटेनर अॅप्स, Service Bus, API Gateway  
**कठीणपणा**: मध्यम  
**संकल्पना**: मायक्रोसर्व्हिसेस संवाद, वितरित प्रणाली, एंटरप्राइज नमुने  

### Microsoft Foundry उदाहरणे  

#### Microsoft Foundry Models चॅट अॅप  
**तंत्रज्ञान**: Microsoft Foundry Models, Cognitive Search, App Service  
**कठीणपणा**: मध्यम  
**संकल्पना**: RAG आर्किटेक्चर, व्हेक्टर शोध, LLM समाकलन  

#### AI डॉक्युमेंट प्रोसेसिंग  
**तंत्रज्ञान**: Azure AI Document Intelligence, स्टोरेज, Functions  
**कठीणपणा**: मध्यम  
**संकल्पना**: डॉक्युमेंट विश्लेषण, OCR, डेटा एक्स्ट्रॅक्शन  

#### मशीन लर्निंग पाईपलाइन  
**तंत्रज्ञान**: Azure ML, MLOps, कंटेनर रजिस्ट्री  
**कठीणपणा**: उन्नत  
**संकल्पना**: मॉडेल प्रशिक्षण, डिप्लॉयमेंट पाईपलाइन, मॉनिटरिंग  

## 🛠 कॉन्फिगरेशन उदाहरणे  

`configurations/` निर्देशिकेत पुनरावर्तनीय घटक आहेत:  

### पर्यावरण कॉन्फिगरेशन  
- विकास पर्यावरण सेटिंग्ज  
- स्टेजिंग पर्यावरण कॉन्फिगरेशन  
- उत्पादनासाठी तयार कॉन्फिगरेशन  
- मल्टी-रिजन डिप्लॉयमेंट सेटअप  

### Bicep मॉड्यूल्स  
- पुनरावर्तनीय इन्फ्रास्ट्रक्चर घटक  
- सामान्य संसाधन नमुने  
- सुरक्षा-कठोर टेम्प्लेट  
- खर्च-अनुकूल कॉन्फिगरेशन  

### सहाय्यक स्क्रिप्ट्स  
- पर्यावरण सेटअप स्वयंचलित  
- डेटाबेस माइग्रेशन स्क्रिप्ट्स  
- डिप्लॉयमेंट प्रमाणीकरण साधने  
- खर्च मॉनिटरिंग युटिलिटीज  

## 🔧 सानुकूलन मार्गदर्शक  

### तुमच्या वापरासाठी उदाहरणे सानुकूलित करणे  

1. **पूर्वअटी तपासा**  
   - Azure सेवा आवश्यकता तपासा  
   - सदस्यता मर्यादा तपासा  
   - खर्च परिणाम समजून घ्या  

2. **कॉन्फिगरेशन बदला**  
   - `azure.yaml` सेवा परिभाषा अपडेट करा  
   - Bicep टेम्प्लेट सानुकूलित करा  
   - पर्यावरण चल समायोजित करा  

3. **संपूर्ण चाचणी करा**  
   - प्रथम विकास पर्यावरणात डिप्लॉय करा  
   - कार्यक्षमता सत्यापित करा  
   - स्केलिंग आणि कार्यक्षमता तपासा  

4. **सुरक्षा पुनरावलोकन**  
   - प्रवेश नियंत्रण पुनरावलोकन करा  
   - गुपित व्यवस्थापन लागू करा  
   - मॉनिटरिंग आणि अलर्ट सक्षम करा  

## 📊 तुलना मॅट्रिक्स  

| उदाहरण | सेवा | डेटाबेस | ऑथ | मॉनिटरिंग | कठीणपणा |  
|---------|--------|--------|-----|-----------|---------|  
| **Microsoft Foundry Models Chat** (स्थानिक) | 2 | ❌ | Key Vault | पूर्ण | ⭐⭐ |  
| **Python Flask API** (स्थानिक) | 1 | ❌ | मूलभूत | पूर्ण | ⭐ |  
| **मायक्रोसर्व्हिसेस** (स्थानिक) | 5+ | ✅ | एंटरप्राइज | उन्नत | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | मूलभूत | मूलभूत | ⭐ |  
| React SPA + Functions | 3 | ✅ | मूलभूत | पूर्ण | ⭐ |  
| Python Flask कंटेनर | 2 | ❌ | मूलभूत | पूर्ण | ⭐ |  
| C# वेब API + SQL | 2 | ✅ | पूर्ण | पूर्ण | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | पूर्ण | पूर्ण | ⭐⭐ |  
| Java मायक्रोसर्व्हिसेस | 5+ | ✅ | पूर्ण | पूर्ण | ⭐⭐ |  
| Microsoft Foundry Models Chat | 3 | ✅ | पूर्ण | पूर्ण | ⭐⭐⭐ |  
| AI Document Processing | 2 | ❌ | मूलभूत | पूर्ण | ⭐⭐ |  
| ML Pipeline | 4+ | ✅ | पूर्ण | पूर्ण | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (स्थानिक) | **8+** | **✅** | **एंटरप्राइज** | **उन्नत** | **⭐⭐⭐⭐** |  

## 🎓 शिकण्याचा मार्ग  

### शिफारसीय प्रगतीक्रम  

1. **सोप्या वेब अॅपपासून प्रारंभ करा**  
   - मूलभूत AZD संकल्पना शिका  
   - डिप्लॉयमेंट वर्कफ्लो समजून घ्या  
   - पर्यावरण व्यवस्थापनाचा सराव करा  

2. **स्थिर वेबसाइट प्रयत्न करा**  
   - विविध होस्टिंग पर्याय एक्सप्लोर करा  
   - CDN समाकलन बद्दल शिका  
   - DNS कॉन्फिगरेशन समजून घ्या  

3. **कंटेनर अॅपकडे जा**  
   - कंटेनरायझेशन मूलभूतता शिका  
   - स्केलिंग संकल्पना समजून घ्या  
   - Docker सह सराव करा  

4. **डेटाबेस समाकलन जोडा**  
   - डेटाबेस प्रोव्हिजनिंग शिका  
   - कनेक्शन स्ट्रिंग्ज समजून घ्या  
   - गुपित व्यवस्थापन सराव करा  

5. **सर्व्हरलेस एक्सप्लोर करा**  
   - इव्हेंट-चालित आर्किटेक्चर समजून घ्या  
   - ट्रिगर्स आणि बाइंडिंग बद्दल शिका  
   - API सह सराव करा  

6. **मायक्रोसर्व्हिसेस तयार करा**  
   - सेवा संवाद शिका  
   - वितरित प्रणाली समजून घ्या  
   - जटिल डिप्लॉयमेंट्सचा सराव करा  

## 🔍 योग्य उदाहरण शोधणे  

### तंत्रज्ञान स्टॅक नुसार  
- **कंटेनर अॅप्स**: [Python Flask API (स्थानिक)](../../../examples/container-app/simple-flask-api), [मायक्रोसर्व्हिसेस (स्थानिक)](../../../examples/container-app/microservices), Java मायक्रोसर्व्हिसेस  
- **Node.js**: Node.js Express Todo App, [मायक्रोसर्व्हिसेस API Gateway (स्थानिक)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (स्थानिक)](../../../examples/container-app/simple-flask-api), [मायक्रोसर्व्हिसेस प्रॉडक्ट सेवा (स्थानिक)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [मायक्रोसर्व्हिसेस ऑर्डर सेवा (स्थानिक)](../../../examples/container-app/microservices), C# वेब API + SQL डेटाबेस, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go**: [मायक्रोसर्व्हिसेस युजर सेवा (स्थानिक)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot मायक्रोसर्व्हिसेस  
- **React**: React SPA + Functions  
- **कंटेनर्स**: [Python Flask (स्थानिक)](../../../examples/container-app/simple-flask-api), [मायक्रोसर्व्हिसेस (स्थानिक)](../../../examples/container-app/microservices), Java मायक्रोसर्व्हिसेस  
- **डेटाबेसेस**: [मायक्रोसर्व्हिसेस (स्थानिक)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry Models Chat (स्थानिक)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent सोल्युशन**  
- **मल्टी-एजंट सिस्टम्स**: **Retail Multi-Agent सोल्युशन**  
- **OpenAI समाकलन**: **[Microsoft Foundry Models Chat (स्थानिक)](../../../examples/azure-openai-chat)**, Retail Multi-Agent सोल्युशन  
- **एंटरप्राइज उत्पादन**: [मायक्रोसर्व्हिसेस (स्थानिक)](../../../examples/container-app/microservices), **Retail Multi-Agent सोल्युशन**  

### आर्किटेक्चर नमुन्यानुसार  
- **सोपं REST API**: [Python Flask API (स्थानिक)](../../../examples/container-app/simple-flask-api)  
- **मोनोलिथिक**: Node.js Express Todo, C# वेब API + SQL  
- **स्थिर + सर्व्हरलेस**: React SPA + Functions, Python Functions + SPA  
- **मायक्रोसर्व्हिसेस**: [उत्पादन मायक्रोसर्व्हिसेस (स्थानिक)](../../../examples/container-app/microservices), Java Spring Boot मायक्रोसर्व्हिसेस  
- **कंटेनरायझ्ड**: [Python Flask (स्थानिक)](../../../examples/container-app/simple-flask-api), [मायक्रोसर्व्हिसेस (स्थानिक)](../../../examples/container-app/microservices)  
- **AI-सक्षम**: **[Microsoft Foundry Models Chat (स्थानिक)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent सोल्युशन**  
- **मल्टी-एजंट आर्किटेक्चर**: **Retail Multi-Agent सोल्युशन**  
- **एंटरप्राइज बहु-सेवा**: [मायक्रोसर्व्हिसेस (स्थानिक)](../../../examples/container-app/microservices), **Retail Multi-Agent सोल्युशन**  

### कठीणपणाच्या स्तरानुसार  
- **नवशिक्या**: [Python Flask API (स्थानिक)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **मध्यम**: **[Microsoft Foundry Models Chat (स्थानिक)](../../../examples/azure-openai-chat)**, C# वेब API + SQL, Python Functions + SPA, Java मायक्रोसर्व्हिसेस, Microsoft Foundry Models Chat App, AI Document Processing  
- **उन्नत**: ML Pipeline  
- **एंटरप्राइज उत्पादनासाठी तयार**: [मायक्रोसर्व्हिसेस (स्थानिक)](../../../examples/container-app/microservices) (मेसेज क्यूइंगसह बहु-सेवा), **Retail Multi-Agent सोल्युशन** (पूर्ण मल्टी-एजंट सिस्टम ARM टेम्प्लेट डिप्लॉयमेंटसह)  

## 📚 अतिरिक्त संसाधने  

### दस्तऐवज दुवे  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD टेम्प्लेट्स](https://github.com/Azure/ai-foundry-templates)  
- [Bicep दस्तऐवज](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure आर्किटेक्चर केंद्र](https://learn.microsoft.com/en-us/azure/architecture/)  

### समुदाय उदाहरणे
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App with C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions with Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### सर्वोत्तम पद्धती
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 उदाहरणे योगदान द्या

तुमच्याकडे सामायिक करण्यासाठी उपयुक्त उदाहरण आहे का? आम्ही योगदान स्विकारतो!

### सबमिशन मार्गदर्शक तत्त्वे
1. स्थापन केलेले निर्देशिका रचना अनुसरा
2. सविस्तर README.md समाविष्ट करा
3. कॉन्फिगरेशन फाइल्सना टिप्पण्या जोडा
4. सबमिट करण्यापूर्वी संपूर्णपणे चाचणी करा
5. खर्च अंदाज आणि पूर्वतयारी समाविष्ट करा

### उदाहरण टेम्प्लेट रचना
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

**प्रो टिप**: तुमच्या तंत्रज्ञान स्टॅकशी जुळणारे सर्वात सोपे उदाहरण वापरून सुरुवात करा, नंतर हळूहळू अधिक जटिल परिस्थितीकडे पुढे चला. प्रत्येक उदाहरण मागील संकल्पनांवर आधारित असते!

## 🚀 सुरू करण्यास तयार आहात का?

### तुमचा शिक्षण मार्ग

1. **पूर्ण नवशिकती?** → [Flask API](../../../examples/container-app/simple-flask-api) वरून सुरुवात करा (⭐, 20 मिनिटे)
2. **मुळ AZD ज्ञान आहे?** → [Microservices](../../../examples/container-app/microservices) वापरून पहा (⭐⭐⭐⭐, 60 मिनिटे)
3. **AI अ‍ॅप तयार करत आहात?** → [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 मिनिटे) पासून सुरुवात करा किंवा [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ तास) एक्सप्लोर करा
4. **विशिष्ट तंत्रज्ञान स्टॅक हवे आहे?** → वर दिलेल्या [योग्य उदाहरण शोधा](../../../examples) विभागाचा वापर करा

### पुढील पावले

- ✅ वर दिलेले [पूर्वतयारी](../../../examples) तपासा
- ✅ तुमच्या कौशल्य पातळीशी जुळणारे उदाहरण निवडा (पहा [जटिलता मार्गदर्शक](../../../examples))
- ✅ उदाहरणाचे README नीट वाचा आणि नंतर डिप्लॉय करा
- ✅ चाचणी नंतर `azd down` चालवण्यासाठी स्मरणपत्र सेट करा
- ✅ तुमचा अनुभव GitHub इश्यूज किंवा चर्चांद्वारे शेअर करा

### मदतीची गरज आहे?

- 📖 [वारंवार विचारले जाणारे प्रश्न](../resources/faq.md) - सामान्य प्रश्नांची उत्तरे
- 🐛 [समस्या निवारण मार्गदर्शक](../docs/chapter-07-troubleshooting/common-issues.md) - डिप्लॉयमेंट समस्यांचे निराकरण
- 💬 [GitHub चर्चासत्र](https://github.com/microsoft/AZD-for-beginners/discussions) - समुदायाला विचारा
- 📚 [अभ्यास मार्गदर्शक](../resources/study-guide.md) - तुमचे शिक्षण अधिक मजबूत करा

---

**नेव्हिगेशन**
- **📚 कोर्स होम**: [AZD For Beginners](../README.md)
- **📖 अभ्यास साहित्य**: [अभ्यास मार्गदर्शक](../resources/study-guide.md) | [चिट शीट](../resources/cheat-sheet.md) | [परिभाषा](../resources/glossary.md)
- **🔧 संसाधने**: [वारंवार विचारले जाणारे प्रश्न](../resources/faq.md) | [समस्या निवारण](../docs/chapter-07-troubleshooting/common-issues.md)

---

*शेवटचे अद्यतन: नोव्हेंबर 2025 | [समस्या नोंदवा](https://github.com/microsoft/AZD-for-beginners/issues) | [उदाहरणे दान करा](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**सूचना**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अपूर्णता असू शकते. मूळ दस्तऐवज त्याच्या स्थानिक भाषेत अधिकृत स्त्रोत मानला पाहिजे. महत्त्वपूर्ण माहिती साठी व्यावसायिक मानव अनुवाद करण्याची शिफारस केली जाते. या अनुवादाचा वापर केल्यामुळे उद्भवलेल्या कोणत्याही गैरसमजुतींसाठी किंवा चुकीच्या अर्थ लावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->