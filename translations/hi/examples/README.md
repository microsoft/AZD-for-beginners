<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-17T17:03:49+00:00",
  "source_file": "examples/README.md",
  "language_code": "hi"
}
-->
# उदाहरण - व्यावहारिक AZD टेम्पलेट्स और कॉन्फ़िगरेशन

**उदाहरणों से सीखना - अध्याय के अनुसार व्यवस्थित**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../README.md)
- **📖 अध्याय मैपिंग**: सीखने की जटिलता के अनुसार व्यवस्थित उदाहरण
- **🚀 सरल शुरुआत**: [अध्याय 1 के उदाहरण](../../../examples)
- **🤖 AI उदाहरण**: [अध्याय 2 और 5 AI समाधान](../../../examples)

## परिचय

यह डायरेक्टरी व्यावहारिक उदाहरण, टेम्पलेट्स और वास्तविक जीवन के परिदृश्य प्रदान करती है ताकि आप Azure Developer CLI को हाथों-हाथ अभ्यास के माध्यम से सीख सकें। प्रत्येक उदाहरण में पूर्ण कार्यशील कोड, इंफ्रास्ट्रक्चर टेम्पलेट्स और विभिन्न एप्लिकेशन आर्किटेक्चर और डिप्लॉयमेंट पैटर्न के लिए विस्तृत निर्देश शामिल हैं।

## सीखने के लक्ष्य

इन उदाहरणों पर काम करके, आप:
- वास्तविक एप्लिकेशन परिदृश्यों के साथ Azure Developer CLI वर्कफ़्लो का अभ्यास करेंगे
- विभिन्न एप्लिकेशन आर्किटेक्चर और उनके AZD कार्यान्वयन को समझेंगे
- विभिन्न Azure सेवाओं के लिए इंफ्रास्ट्रक्चर ऐज़ कोड पैटर्न में महारत हासिल करेंगे
- कॉन्फ़िगरेशन प्रबंधन और पर्यावरण-विशिष्ट डिप्लॉयमेंट रणनीतियों को लागू करेंगे
- निगरानी, सुरक्षा और स्केलिंग पैटर्न को व्यावहारिक संदर्भों में लागू करेंगे
- वास्तविक डिप्लॉयमेंट परिदृश्यों के साथ समस्या निवारण और डिबगिंग का अनुभव प्राप्त करेंगे

## सीखने के परिणाम

इन उदाहरणों को पूरा करने के बाद, आप:
- Azure Developer CLI का उपयोग करके विभिन्न प्रकार के एप्लिकेशन को आत्मविश्वास से डिप्लॉय कर सकेंगे
- प्रदान किए गए टेम्पलेट्स को अपनी एप्लिकेशन आवश्यकताओं के अनुसार अनुकूलित कर सकेंगे
- Bicep का उपयोग करके कस्टम इंफ्रास्ट्रक्चर पैटर्न डिज़ाइन और कार्यान्वित कर सकेंगे
- उचित निर्भरताओं के साथ जटिल मल्टी-सर्विस एप्लिकेशन को कॉन्फ़िगर कर सकेंगे
- वास्तविक परिदृश्यों में सुरक्षा, निगरानी और प्रदर्शन सर्वोत्तम प्रथाओं को लागू कर सकेंगे
- व्यावहारिक अनुभव के आधार पर डिप्लॉयमेंट का समस्या निवारण और अनुकूलन कर सकेंगे

## डायरेक्टरी संरचना

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

### शुरुआती लोगों के लिए
1. **[सरल वेब ऐप - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Node.js Express वेब एप्लिकेशन को MongoDB के साथ डिप्लॉय करें
2. **[स्टेटिक वेबसाइट - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Azure Static Web Apps के साथ React स्टेटिक वेबसाइट होस्ट करें
3. **[कंटेनर ऐप - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - कंटेनरयुक्त Python Flask एप्लिकेशन को डिप्लॉय करें

### मध्यम स्तर के उपयोगकर्ताओं के लिए
4. **[डेटाबेस ऐप - C# और Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - C# API और Azure SQL डेटाबेस के साथ वेब एप्लिकेशन
5. **[सर्वरलेस फंक्शन - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - HTTP ट्रिगर्स और Cosmos DB के साथ Python Azure Functions
6. **[माइक्रोसर्विसेज - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - कंटेनर ऐप्स और API गेटवे के साथ मल्टी-सर्विस Java एप्लिकेशन

### Azure AI Foundry टेम्पलेट्स

1. **[Azure OpenAI चैट ऐप](https://github.com/Azure-Samples/azure-search-openai-demo)** - Azure OpenAI के साथ इंटेलिजेंट चैट एप्लिकेशन
2. **[AI डॉक्यूमेंट प्रोसेसिंग](https://github.com/Azure-Samples/azure-ai-document-processing)** - Azure AI सेवाओं का उपयोग करके डॉक्यूमेंट विश्लेषण
3. **[मशीन लर्निंग पाइपलाइन](https://github.com/Azure-Samples/mlops-v2)** - Azure Machine Learning के साथ MLOps वर्कफ़्लो

### वास्तविक जीवन के परिदृश्य

#### **रिटेल मल्टी-एजेंट समाधान** 🆕
**[पूर्ण कार्यान्वयन गाइड](./retail-scenario.md)**

एक व्यापक, उत्पादन-तैयार मल्टी-एजेंट ग्राहक सहायता समाधान जो AZD के साथ एंटरप्राइज़-ग्रेड AI एप्लिकेशन डिप्लॉयमेंट को प्रदर्शित करता है। इस परिदृश्य में शामिल हैं:

- **पूर्ण आर्किटेक्चर**: ग्राहक सेवा और इन्वेंटरी प्रबंधन एजेंटों के साथ मल्टी-एजेंट सिस्टम
- **उत्पादन इंफ्रास्ट्रक्चर**: मल्टी-रीजन Azure OpenAI डिप्लॉयमेंट्स, AI सर्च, कंटेनर ऐप्स, और व्यापक निगरानी
- **रेडी-टू-डिप्लॉय ARM टेम्पलेट**: एक-क्लिक डिप्लॉयमेंट के साथ कई कॉन्फ़िगरेशन मोड (मिनिमल/स्टैंडर्ड/प्रीमियम)
- **उन्नत सुविधाएँ**: रेड टीमिंग सुरक्षा सत्यापन, एजेंट मूल्यांकन फ्रेमवर्क, लागत अनुकूलन, और समस्या निवारण गाइड
- **वास्तविक व्यावसायिक संदर्भ**: रिटेलर ग्राहक सहायता उपयोग केस जिसमें फ़ाइल अपलोड, सर्च इंटीग्रेशन, और डायनामिक स्केलिंग शामिल है

**तकनीकें**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**जटिलता**: ⭐⭐⭐⭐ (उन्नत - एंटरप्राइज़ उत्पादन तैयार)

**उपयुक्त**: AI डेवलपर्स, समाधान आर्किटेक्ट्स, और उत्पादन मल्टी-एजेंट सिस्टम बनाने वाली टीमें

**त्वरित शुरुआत**: `./deploy.sh -g myResourceGroup` का उपयोग करके शामिल ARM टेम्पलेट के साथ पूरे समाधान को 30 मिनट से कम समय में डिप्लॉय करें

## 📋 उपयोग निर्देश

### स्थानीय रूप से उदाहरण चलाना

1. **उदाहरण क्लोन या कॉपी करें**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **AZD पर्यावरण प्रारंभ करें**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **पर्यावरण कॉन्फ़िगर करें**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **डिप्लॉय करें**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### उदाहरणों को अनुकूलित करना

प्रत्येक उदाहरण में शामिल हैं:
- **README.md** - विस्तृत सेटअप और अनुकूलन निर्देश
- **azure.yaml** - टिप्पणियों के साथ AZD कॉन्फ़िगरेशन
- **infra/** - पैरामीटर स्पष्टीकरण के साथ Bicep टेम्पलेट्स
- **src/** - नमूना एप्लिकेशन कोड
- **scripts/** - सामान्य कार्यों के लिए सहायक स्क्रिप्ट्स

## 🎯 सीखने के उद्देश्य

### उदाहरण श्रेणियाँ

#### **मूलभूत डिप्लॉयमेंट्स**
- सिंगल-सर्विस एप्लिकेशन
- सरल इंफ्रास्ट्रक्चर पैटर्न
- बुनियादी कॉन्फ़िगरेशन प्रबंधन
- लागत प्रभावी विकास सेटअप

#### **उन्नत परिदृश्य**
- मल्टी-सर्विस आर्किटेक्चर
- जटिल नेटवर्किंग कॉन्फ़िगरेशन
- डेटाबेस इंटीग्रेशन पैटर्न
- सुरक्षा और अनुपालन कार्यान्वयन

#### **उत्पादन-तैयार पैटर्न**
- उच्च उपलब्धता कॉन्फ़िगरेशन
- निगरानी और अवलोकन
- CI/CD इंटीग्रेशन
- आपदा पुनर्प्राप्ति सेटअप

## 📖 उदाहरण विवरण

### सरल वेब ऐप - Node.js Express
**तकनीकें**: Node.js, Express, MongoDB, Container Apps  
**जटिलता**: शुरुआती  
**अवधारणाएँ**: बुनियादी डिप्लॉयमेंट, REST API, NoSQL डेटाबेस इंटीग्रेशन

### स्टेटिक वेबसाइट - React SPA
**तकनीकें**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**जटिलता**: शुरुआती  
**अवधारणाएँ**: स्टेटिक होस्टिंग, सर्वरलेस बैकएंड, आधुनिक वेब विकास

### कंटेनर ऐप - Python Flask
**तकनीकें**: Python Flask, Docker, Container Apps, Container Registry  
**जटिलता**: शुरुआती  
**अवधारणाएँ**: कंटेनरीकरण, माइक्रोसर्विसेज आर्किटेक्चर, API विकास

### डेटाबेस ऐप - C# और Azure SQL
**तकनीकें**: C# ASP.NET Core, Azure SQL Database, App Service  
**जटिलता**: मध्यम  
**अवधारणाएँ**: Entity Framework, डेटाबेस कनेक्शन, वेब API विकास

### सर्वरलेस फंक्शन - Python Azure Functions
**तकनीकें**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**जटिलता**: मध्यम  
**अवधारणाएँ**: इवेंट-ड्रिवन आर्किटेक्चर, सर्वरलेस कंप्यूटिंग, फुल-स्टैक विकास

### माइक्रोसर्विसेज - Java Spring Boot
**तकनीकें**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**जटिलता**: मध्यम  
**अवधारणाएँ**: माइक्रोसर्विसेज संचार, वितरित सिस्टम, एंटरप्राइज़ पैटर्न

### Azure AI Foundry उदाहरण

#### Azure OpenAI चैट ऐप
**तकनीकें**: Azure OpenAI, Cognitive Search, App Service  
**जटिलता**: मध्यम  
**अवधारणाएँ**: RAG आर्किटेक्चर, वेक्टर सर्च, LLM इंटीग्रेशन

#### AI डॉक्यूमेंट प्रोसेसिंग
**तकनीकें**: Azure AI Document Intelligence, Storage, Functions  
**जटिलता**: मध्यम  
**अवधारणाएँ**: डॉक्यूमेंट विश्लेषण, OCR, डेटा निष्कर्षण

#### मशीन लर्निंग पाइपलाइन
**तकनीकें**: Azure ML, MLOps, Container Registry  
**जटिलता**: उन्नत  
**अवधारणाएँ**: मॉडल प्रशिक्षण, डिप्लॉयमेंट पाइपलाइन्स, निगरानी

## 🛠 कॉन्फ़िगरेशन उदाहरण

`configurations/` डायरेक्टरी में पुन: उपयोग योग्य घटक शामिल हैं:

### पर्यावरण कॉन्फ़िगरेशन
- विकास पर्यावरण सेटिंग्स
- स्टेजिंग पर्यावरण कॉन्फ़िगरेशन
- उत्पादन-तैयार कॉन्फ़िगरेशन
- मल्टी-रीजन डिप्लॉयमेंट सेटअप

### Bicep मॉड्यूल्स
- पुन: उपयोग योग्य इंफ्रास्ट्रक्चर घटक
- सामान्य संसाधन पैटर्न
- सुरक्षा-संवर्धित टेम्पलेट्स
- लागत-अनुकूलित कॉन्फ़िगरेशन

### सहायक स्क्रिप्ट्स
- पर्यावरण सेटअप स्वचालन
- डेटाबेस माइग्रेशन स्क्रिप्ट्स
- डिप्लॉयमेंट सत्यापन उपकरण
- लागत निगरानी उपयोगिताएँ

## 🔧 अनुकूलन गाइड

### अपने उपयोग केस के लिए उदाहरणों को अनुकूलित करना

1. **पूर्वापेक्षाएँ समीक्षा करें**
   - Azure सेवा आवश्यकताओं की जांच करें
   - सब्सक्रिप्शन सीमाओं को सत्यापित करें
   - लागत प्रभावों को समझें

2. **कॉन्फ़िगरेशन संशोधित करें**
   - `azure.yaml` सेवा परिभाषाओं को अपडेट करें
   - Bicep टेम्पलेट्स को अनुकूलित करें
   - पर्यावरण चर समायोजित करें

3. **पूरी तरह से परीक्षण करें**
   - पहले विकास पर्यावरण में डिप्लॉय करें
   - कार्यक्षमता सत्यापित करें
   - स्केलिंग और प्रदर्शन का परीक्षण करें

4. **सुरक्षा समीक्षा करें**
   - एक्सेस नियंत्रण की समीक्षा करें
   - सीक्रेट्स प्रबंधन लागू करें
   - निगरानी और अलर्टिंग सक्षम करें

## 📊 तुलना मैट्रिक्स

| उदाहरण | सेवाएँ | डेटाबेस | ऑथ | निगरानी | जटिलता |
|---------|----------|----------|------|------------|------------|
| Node.js Express Todo | 2 | ✅ | बुनियादी | बुनियादी | ⭐ |
| React SPA + Functions | 3 | ✅ | बुनियादी | पूर्ण | ⭐ |
| Python Flask Container | 2 | ❌ | बुनियादी | पूर्ण | ⭐ |
| C# Web API + SQL | 2 | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Java Microservices | 5+ | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | पूर्ण | पूर्ण | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | बुनियादी | पूर्ण | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | पूर्ण | पूर्ण | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **एंटरप्राइज़** | **उन्नत** | **⭐⭐⭐⭐** |

## 🎓 सीखने का मार्ग

### अनुशंसित प्रगति

1. **सरल वेब ऐप से शुरुआत करें**
   - बुनियादी AZD अवधारणाएँ सीखें
   - डिप्लॉयमेंट वर्कफ़्लो समझें
   - पर्यावरण प्रबंधन का अभ्यास करें

2. **स्टेटिक वेबसाइट आज़माएँ**
   - विभिन्न होस्टिंग विकल्पों का अन्वेषण करें
   - CDN इंटीग्रेशन सीखें
   - DNS कॉन्फ़िगरेशन समझें

3. **कंटेनर ऐप पर जाएँ**
   - कंटेनरीकरण की मूल बातें सीखें
   - स्केलिंग अवधारणाएँ समझें
   - Docker के साथ अभ्यास करें

4. **डेटाबेस इंटीग्रेशन जोड़ें**
   - डेटाबेस प्रावधान सीखें
   - कनेक्शन स्ट्रिंग्स समझें
   - सीक्रेट्स प्रबंधन का अभ्यास करें

5. **सर्वरलेस का अन्वेषण करें**
   - इवेंट-ड्रिवन आर्किटेक्चर समझें
   - ट्रिगर्स और बाइंडिंग्स सीखें
   - APIs के साथ अभ्यास करें

6. **माइक्रोसर्विसेज बनाएं**
   - सेवा संचार सीखें
   - वितरित सिस्टम समझें
   - जटिल डिप्लॉयमेंट का अभ्यास करें

## 🔍 सही उदाहरण ढूँढना

### तकनीकी स्टैक के अनुसार
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: Python Flask Container App, Java Microservices
- **Databases**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **Enterprise Production**: **Retail Multi-Agent Solution**

### आर्किटेक्चर पैटर्न के अनुसार
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: Java Spring Boot Microservices
- **Containerized**: Python Flask Container App
- **AI-Powered**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: **Retail Multi-Agent Solution**

### जटिलता स्तर के अनुसार
- **शुरुआती**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **मध्यम**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **उन्नत**: ML Pipeline
- **एंटरप्राइज़ उत्पादन-तैयार**: **Retail Multi-Agent Solution** (पूर्ण मल्टी-एजेंट सिस्टम के साथ ARM टेम्पलेट डिप्लॉयमेंट)

## 📚 अतिरिक्त संसाधन

### दस्तावेज़ीकरण लिंक
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### सामुदायिक उदाहरण
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-az
- [C# और Azure SQL के साथ Todo ऐप](https://github.com/Azure-Samples/todo-csharp-sql)
- [Python और MongoDB के साथ Todo ऐप](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js और PostgreSQL के साथ Todo ऐप](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React वेब ऐप C# API के साथ](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps जॉब](https://github.com/Azure-Samples/container-apps-jobs)
- [Java के साथ Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### सर्वोत्तम प्रथाएं
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 उदाहरणों में योगदान करें

क्या आपके पास साझा करने के लिए कोई उपयोगी उदाहरण है? हम योगदान का स्वागत करते हैं!

### सबमिशन दिशानिर्देश
1. स्थापित निर्देशिका संरचना का पालन करें
2. विस्तृत README.md शामिल करें
3. कॉन्फ़िगरेशन फ़ाइलों में टिप्पणियां जोड़ें
4. सबमिट करने से पहले पूरी तरह से परीक्षण करें
5. लागत अनुमान और आवश्यकताओं को शामिल करें

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

**प्रो टिप**: अपनी तकनीकी स्टैक से मेल खाने वाले सबसे सरल उदाहरण से शुरू करें, फिर धीरे-धीरे अधिक जटिल परिदृश्यों की ओर बढ़ें। प्रत्येक उदाहरण पिछले वाले से अवधारणाओं को आगे बढ़ाता है!

**अगले कदम**: 
- ऐसा उदाहरण चुनें जो आपके कौशल स्तर से मेल खाता हो
- उदाहरण के README में दिए गए सेटअप निर्देशों का पालन करें
- कस्टमाइज़ेशन के साथ प्रयोग करें
- अपने अनुभव समुदाय के साथ साझा करें

---

**नेविगेशन**
- **पिछला पाठ**: [अध्ययन गाइड](../resources/study-guide.md)
- **वापस जाएं**: [मुख्य README](../README.md)

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।