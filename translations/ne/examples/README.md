<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-17T20:06:42+00:00",
  "source_file": "examples/README.md",
  "language_code": "ne"
}
-->
# उदाहरणहरू - व्यावहारिक AZD टेम्प्लेटहरू र कन्फिगरेसनहरू

**उदाहरणबाट सिक्ने - अध्याय अनुसार व्यवस्थित**
- **📚 कोर्स होम**: [AZD For Beginners](../README.md)
- **📖 अध्याय म्यापिङ**: सिक्ने जटिलताका आधारमा व्यवस्थित उदाहरणहरू
- **🚀 सरलबाट सुरु गर्नुहोस्**: [अध्याय १ उदाहरणहरू](../../../examples)
- **🤖 एआई उदाहरणहरू**: [अध्याय २ र ५ एआई समाधानहरू](../../../examples)

## परिचय

यो डाइरेक्टरीले व्यावहारिक उदाहरणहरू, टेम्प्लेटहरू, र वास्तविक संसारका परिदृश्यहरू समावेश गर्दछ जसले Azure Developer CLI सिक्नका लागि व्यावहारिक अभ्यास प्रदान गर्दछ। प्रत्येक उदाहरणले पूर्ण कार्यरत कोड, इन्फ्रास्ट्रक्चर टेम्प्लेटहरू, र विभिन्न एप्लिकेसन आर्किटेक्चर र डिप्लोयमेन्ट ढाँचाहरूका लागि विस्तृत निर्देशनहरू प्रदान गर्दछ।

## सिक्ने लक्ष्यहरू

यी उदाहरणहरूमा काम गरेर, तपाईं:
- वास्तविक एप्लिकेसन परिदृश्यहरूसँग Azure Developer CLI वर्कफ्लो अभ्यास गर्नुहुनेछ
- विभिन्न एप्लिकेसन आर्किटेक्चरहरू र तिनका azd कार्यान्वयनहरू बुझ्नुहुनेछ
- विभिन्न Azure सेवाहरूका लागि Infrastructure as Code ढाँचाहरूमा निपुणता हासिल गर्नुहुनेछ
- कन्फिगरेसन व्यवस्थापन र वातावरण-विशिष्ट डिप्लोयमेन्ट रणनीतिहरू लागू गर्नुहुनेछ
- व्यावहारिक सन्दर्भहरूमा निगरानी, सुरक्षा, र स्केलिङ ढाँचाहरू कार्यान्वयन गर्नुहुनेछ
- वास्तविक डिप्लोयमेन्ट परिदृश्यहरूमा समस्या समाधान र डिबगिङ अनुभव निर्माण गर्नुहुनेछ

## सिक्ने परिणामहरू

यी उदाहरणहरू पूरा गरेपछि, तपाईं:
- Azure Developer CLI प्रयोग गरेर विभिन्न एप्लिकेसन प्रकारहरू आत्मविश्वासका साथ डिप्लोय गर्न सक्षम हुनुहुनेछ
- प्रदान गरिएका टेम्प्लेटहरूलाई आफ्नै एप्लिकेसन आवश्यकताहरूमा अनुकूलन गर्न सक्षम हुनुहुनेछ
- Bicep प्रयोग गरेर कस्टम इन्फ्रास्ट्रक्चर ढाँचाहरू डिजाइन र कार्यान्वयन गर्न सक्षम हुनुहुनेछ
- उचित निर्भरताहरूका साथ जटिल बहु-सेवा एप्लिकेसनहरू कन्फिगर गर्न सक्षम हुनुहुनेछ
- वास्तविक परिदृश्यहरूमा सुरक्षा, निगरानी, र प्रदर्शनका उत्कृष्ट अभ्यासहरू लागू गर्न सक्षम हुनुहुनेछ
- व्यावहारिक अनुभवका आधारमा डिप्लोयमेन्टहरू समस्या समाधान र अनुकूलन गर्न सक्षम हुनुहुनेछ

## डाइरेक्टरी संरचना

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

## छिटो सुरु गर्ने उदाहरणहरू

### प्रारम्भिक प्रयोगकर्ताहरूका लागि
1. **[साधारण वेब एप - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - MongoDB सहित Node.js Express वेब एप्लिकेसन डिप्लोय गर्नुहोस्  
2. **[स्टाटिक वेबसाइट - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Azure Static Web Apps सहित React स्टाटिक वेबसाइट होस्ट गर्नुहोस्  
3. **[कन्टेनर एप - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - कन्टेनराइज्ड Python Flask एप्लिकेसन डिप्लोय गर्नुहोस्  

### मध्यम स्तरका प्रयोगकर्ताहरूका लागि
4. **[डाटाबेस एप - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - C# API र Azure SQL Database सहित वेब एप्लिकेसन  
5. **[सर्भरलेस फङ्क्सन - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - HTTP ट्रिगरहरू र Cosmos DB सहित Python Azure Functions  
6. **[माइक्रोसर्भिसहरू - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Container Apps र API Gateway सहित बहु-सेवा Java एप्लिकेसन  

### Azure AI Foundry टेम्प्लेटहरू

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Azure OpenAI सहित बुद्धिमान च्याट एप्लिकेसन  
2. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** - Azure AI सेवाहरू प्रयोग गरेर डकुमेन्ट विश्लेषण  
3. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** - Azure Machine Learning सहित MLOps वर्कफ्लो  

### वास्तविक संसारका परिदृश्यहरू

#### **रिटेल मल्टि-एजेन्ट समाधान** 🆕  
**[पूर्ण कार्यान्वयन मार्गदर्शन](./retail-scenario.md)**  

उद्यम-स्तरको एआई एप्लिकेसन डिप्लोयमेन्ट प्रदर्शन गर्ने उत्पादन-तयार मल्टि-एजेन्ट ग्राहक समर्थन समाधान। यो परिदृश्यले प्रदान गर्दछ:

- **पूर्ण आर्किटेक्चर**: ग्राहक सेवा र इन्वेन्टरी व्यवस्थापन एजेन्टहरू सहित मल्टि-एजेन्ट प्रणाली  
- **उत्पादन इन्फ्रास्ट्रक्चर**: मल्टि-क्षेत्र Azure OpenAI डिप्लोयमेन्टहरू, AI Search, Container Apps, र व्यापक निगरानी  
- **तयार-डिप्लोय ARM टेम्प्लेट**: विभिन्न कन्फिगरेसन मोडहरू (Minimal/Standard/Premium) सहित एक-क्लिक डिप्लोयमेन्ट  
- **उन्नत सुविधाहरू**: सुरक्षा मान्यकरण, एजेन्ट मूल्याङ्कन फ्रेमवर्क, लागत अनुकूलन, र समस्या समाधान मार्गदर्शन  
- **वास्तविक व्यापार सन्दर्भ**: फाइल अपलोड, खोज एकीकरण, र गतिशील स्केलिङ सहित खुद्रा ग्राहक समर्थन प्रयोग केस  

**प्रविधिहरू**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**जटिलता**: ⭐⭐⭐⭐ (उन्नत - उद्यम उत्पादन तयार)  

**उपयुक्त**: एआई विकासकर्ताहरू, समाधान आर्किटेक्टहरू, र उत्पादन मल्टि-एजेन्ट प्रणालीहरू निर्माण गर्ने टोलीहरू  

**छिटो सुरु गर्नुहोस्**: `./deploy.sh -g myResourceGroup` प्रयोग गरेर समावेश गरिएको ARM टेम्प्लेटको साथ ३० मिनेटभित्र पूर्ण समाधान डिप्लोय गर्नुहोस्  

## 📋 प्रयोग निर्देशनहरू

### स्थानीय रूपमा उदाहरणहरू चलाउनुहोस्

1. **उदाहरण क्लोन वा प्रतिलिपि गर्नुहोस्**  
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```  

2. **AZD वातावरण आरम्भ गर्नुहोस्**  
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```  

3. **वातावरण कन्फिगर गर्नुहोस्**  
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```  

4. **डिप्लोय गर्नुहोस्**  
   ```bash
   # Deploy infrastructure and application
   azd up
   ```  

### उदाहरणहरू अनुकूलन गर्नुहोस्

प्रत्येक उदाहरणमा समावेश छ:
- **README.md** - विस्तृत सेटअप र अनुकूलन निर्देशनहरू  
- **azure.yaml** - टिप्पणीहरू सहित AZD कन्फिगरेसन  
- **infra/** - पैरामिटर व्याख्याहरू सहित Bicep टेम्प्लेटहरू  
- **src/** - नमूना एप्लिकेसन कोड  
- **scripts/** - सामान्य कार्यहरूको लागि सहायक स्क्रिप्टहरू  

## 🎯 सिक्ने उद्देश्यहरू

### उदाहरण कोटीहरू

#### **साधारण डिप्लोयमेन्टहरू**
- एकल-सेवा एप्लिकेसनहरू  
- सरल इन्फ्रास्ट्रक्चर ढाँचाहरू  
- आधारभूत कन्फिगरेसन व्यवस्थापन  
- लागत-प्रभावकारी विकास सेटअपहरू  

#### **उन्नत परिदृश्यहरू**
- बहु-सेवा आर्किटेक्चरहरू  
- जटिल नेटवर्किङ कन्फिगरेसनहरू  
- डाटाबेस एकीकरण ढाँचाहरू  
- सुरक्षा र अनुपालन कार्यान्वयनहरू  

#### **उत्पादन-तयार ढाँचाहरू**
- उच्च उपलब्धता कन्फिगरेसनहरू  
- निगरानी र अवलोकनीयता  
- CI/CD एकीकरण  
- आपदा पुनर्प्राप्ति सेटअपहरू  

## 📖 उदाहरण विवरणहरू

### साधारण वेब एप - Node.js Express  
**प्रविधिहरू**: Node.js, Express, MongoDB, Container Apps  
**जटिलता**: प्रारम्भिक  
**धारणाहरू**: आधारभूत डिप्लोयमेन्ट, REST API, NoSQL डाटाबेस एकीकरण  

### स्टाटिक वेबसाइट - React SPA  
**प्रविधिहरू**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**जटिलता**: प्रारम्भिक  
**धारणाहरू**: स्टाटिक होस्टिङ, सर्भरलेस ब्याकएन्ड, आधुनिक वेब विकास  

### कन्टेनर एप - Python Flask  
**प्रविधिहरू**: Python Flask, Docker, Container Apps, Container Registry  
**जटिलता**: प्रारम्भिक  
**धारणाहरू**: कन्टेनराइजेसन, माइक्रोसर्भिस आर्किटेक्चर, API विकास  

### डाटाबेस एप - C# with Azure SQL  
**प्रविधिहरू**: C# ASP.NET Core, Azure SQL Database, App Service  
**जटिलता**: मध्यम  
**धारणाहरू**: Entity Framework, डाटाबेस कनेक्शनहरू, वेब API विकास  

### सर्भरलेस फङ्क्सन - Python Azure Functions  
**प्रविधिहरू**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**जटिलता**: मध्यम  
**धारणाहरू**: इभेन्ट-ड्रिभन आर्किटेक्चर, सर्भरलेस कम्प्युटिङ, फुल-स्ट्याक विकास  

### माइक्रोसर्भिसहरू - Java Spring Boot  
**प्रविधिहरू**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**जटिलता**: मध्यम  
**धारणाहरू**: माइक्रोसर्भिस संचार, वितरित प्रणालीहरू, उद्यम ढाँचाहरू  

### Azure AI Foundry उदाहरणहरू

#### Azure OpenAI Chat App  
**प्रविधिहरू**: Azure OpenAI, Cognitive Search, App Service  
**जटिलता**: मध्यम  
**धारणाहरू**: RAG आर्किटेक्चर, भेक्टर खोज, LLM एकीकरण  

#### AI Document Processing  
**प्रविधिहरू**: Azure AI Document Intelligence, Storage, Functions  
**जटिलता**: मध्यम  
**धारणाहरू**: डकुमेन्ट विश्लेषण, OCR, डाटा निकाल्ने  

#### Machine Learning Pipeline  
**प्रविधिहरू**: Azure ML, MLOps, Container Registry  
**जटिलता**: उन्नत  
**धारणाहरू**: मोडेल प्रशिक्षण, डिप्लोयमेन्ट पाइपलाइनहरू, निगरानी  

## 🛠 कन्फिगरेसन उदाहरणहरू

`configurations/` डाइरेक्टरीले पुन: प्रयोग गर्न मिल्ने कम्पोनेन्टहरू समावेश गर्दछ:

### वातावरण कन्फिगरेसनहरू  
- विकास वातावरण सेटिङहरू  
- स्टेजिङ वातावरण कन्फिगरेसनहरू  
- उत्पादन-तयार कन्फिगरेसनहरू  
- बहु-क्षेत्र डिप्लोयमेन्ट सेटअपहरू  

### Bicep मोड्युलहरू  
- पुन: प्रयोग गर्न मिल्ने इन्फ्रास्ट्रक्चर कम्पोनेन्टहरू  
- सामान्य स्रोत ढाँचाहरू  
- सुरक्षा-सुदृढ टेम्प्लेटहरू  
- लागत-अनुकूलित कन्फिगरेसनहरू  

### सहायक स्क्रिप्टहरू  
- वातावरण सेटअप स्वचालन  
- डाटाबेस माइग्रेशन स्क्रिप्टहरू  
- डिप्लोयमेन्ट मान्यकरण उपकरणहरू  
- लागत निगरानी उपयोगिताहरू  

## 🔧 अनुकूलन मार्गदर्शन

### तपाईंको प्रयोग केसका लागि उदाहरणहरू अनुकूलन गर्नुहोस्

1. **पूर्वापेक्षाहरू समीक्षा गर्नुहोस्**  
   - Azure सेवा आवश्यकताहरू जाँच गर्नुहोस्  
   - सदस्यता सीमाहरू प्रमाणित गर्नुहोस्  
   - लागत प्रभावहरू बुझ्नुहोस्  

2. **कन्फिगरेसन परिमार्जन गर्नुहोस्**  
   - `azure.yaml` सेवा परिभाषाहरू अपडेट गर्नुहोस्  
   - Bicep टेम्प्लेटहरू अनुकूलन गर्नुहोस्  
   - वातावरण चरहरू समायोजन गर्नुहोस्  

3. **थोरै परीक्षण गर्नुहोस्**  
   - पहिले विकास वातावरणमा डिप्लोय गर्नुहोस्  
   - कार्यक्षमता प्रमाणित गर्नुहोस्  
   - स्केलिङ र प्रदर्शन परीक्षण गर्नुहोस्  

4. **सुरक्षा समीक्षा गर्नुहोस्**  
   - पहुँच नियन्त्रण समीक्षा गर्नुहोस्  
   - गोप्य व्यवस्थापन कार्यान्वयन गर्नुहोस्  
   - निगरानी र अलर्टिङ सक्षम गर्नुहोस्  

## 📊 तुलना म्याट्रिक्स

| उदाहरण | सेवाहरू | डाटाबेस | प्रमाणीकरण | निगरानी | जटिलता |
|---------|----------|----------|------------|------------|------------|
| Node.js Express Todo | 2 | ✅ | आधारभूत | आधारभूत | ⭐ |
| React SPA + Functions | 3 | ✅ | आधारभूत | पूर्ण | ⭐ |
| Python Flask Container | 2 | ❌ | आधारभूत | पूर्ण | ⭐ |
| C# Web API + SQL | 2 | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Java Microservices | 5+ | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | पूर्ण | पूर्ण | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | आधारभूत | पूर्ण | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | पूर्ण | पूर्ण | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **उद्यम** | **उन्नत** | **⭐⭐⭐⭐** |

## 🎓 सिक्ने मार्ग

### सिफारिस गरिएको प्रगति

1. **साधारण वेब एपबाट सुरु गर्नुहोस्**  
   - आधारभूत AZD अवधारणाहरू सिक्नुहोस्  
   - डिप्लोयमेन्ट वर्कफ्लो बुझ्नुहोस्  
   - वातावरण व्यवस्थापन अभ्यास गर्नुहोस्  

2. **स्टाटिक वेबसाइट प्रयास गर्नुहोस्**  
   - विभिन्न होस्टिङ विकल्पहरू अन्वेषण गर्नुहोस्  
   - CDN एकीकरण सिक्नुहोस्  
   - DNS कन्फिगरेसन बुझ्नुहोस्  

3. **कन्टेनर एपमा जानुहोस्**  
   - कन्टेनराइजेसन आधारभूत कुरा सिक्नुहोस्  
   - स्केलिङ अवधारणाहरू बुझ्नुहोस्  
   - Docker अभ्यास गर्नुहोस्  

4. **डाटाबेस एकीकरण थप्नुहोस्**  
   - डाटाबेस प्रावधान सिक्नुहोस्  
   - कनेक्शन स्ट्रिङहरू बुझ्नुहोस्  
   - गोप्य व्यवस्थापन अभ्यास गर्नुहोस्  

5. **सर्भरलेस अन्वेषण गर्नुहोस्**  
   - इभेन्ट-ड्रिभन आर्किटेक्चर बुझ्नुहोस्  
   - ट्रिगरहरू र बाइन्डिङहरू सिक्नुहोस्  
   - API अभ्यास गर्नुहोस्  

6. **माइक्रोसर्भिसहरू निर्माण गर्नुहोस्**  
   - सेवा संचार सिक्नुहोस्  
   - वितरित प्रणालीहरू बुझ्नुहोस्  
   - जटिल डिप्लोयमेन्ट अभ्यास गर्नुहोस्  

## 🔍 सही उदाहरण फेला पार्नुहोस्

### प्रविधि स्ट्याक अनुसार
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

### आर्किटेक्चर ढाँचाअनुसार
- **Monolithic**: Node.js Express Todo, C# Web API + SQL  
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Microservices**: Java Spring Boot Microservices  
- **Containerized**: Python Flask Container App  
- **AI-Powered**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**  
- **Enterprise Multi-Service**: **Retail Multi-Agent Solution**  

### जटिलता स्तर अनुसार
- **प्रारम्भिक**: Node.js Express Todo, React SPA + Functions, Python Flask Container App  
- **मध्यम**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing  
- **उन्नत**: ML Pipeline  
- **उद्यम उत्पादन-तयार**: **Retail Multi-Agent Solution** (पूर्ण मल्टि-एजेन्ट प्रणाली ARM टेम्प्लेट डिप्लोयमेन्ट सहित)  

## 📚 अतिरिक्त स्रोतहरू

### दस्तावेजीकरण लिङ्कहरू
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Azure AI Foundry AZ
- [C# र Azure SQL सँग Todo App](https://github.com/Azure-Samples/todo-csharp-sql)
- [Python र MongoDB सँग Todo App](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js र PostgreSQL सँग Todo App](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App र C# API सँग](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Java सँग Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### उत्कृष्ट अभ्यासहरू
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 उदाहरणहरू योगदान गर्नुहोस्

के तपाईंसँग उपयोगी उदाहरण छ? हामी योगदानलाई स्वागत गर्दछौं!

### पेश गर्ने निर्देशिका
1. स्थापित गरिएको डाइरेक्टरी संरचना अनुसरण गर्नुहोस्
2. विस्तृत README.md समावेश गर्नुहोस्
3. कन्फिगरेसन फाइलहरूमा टिप्पणीहरू थप्नुहोस्
4. पेश गर्नु अघि राम्रोसँग परीक्षण गर्नुहोस्
5. लागत अनुमान र पूर्व-आवश्यकताहरू समावेश गर्नुहोस्

### उदाहरण टेम्प्लेट संरचना
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

**प्रो टिप**: आफ्नो प्रविधि स्ट्याकसँग मेल खाने सबैभन्दा सरल उदाहरणबाट सुरु गर्नुहोस्, त्यसपछि क्रमिक रूपमा जटिल परिदृश्यहरूतर्फ अगाडि बढ्नुहोस्। प्रत्येक उदाहरणले अघिल्लो उदाहरणबाट अवधारणाहरू निर्माण गर्दछ!

**अगाडि के गर्ने**: 
- आफ्नो सीप स्तरसँग मेल खाने उदाहरण चयन गर्नुहोस्
- उदाहरणको README मा सेटअप निर्देशनहरू पालना गर्नुहोस्
- अनुकूलनहरूसँग प्रयोग गर्नुहोस्
- समुदायसँग आफ्नो सिकाइहरू साझा गर्नुहोस्

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [अध्ययन मार्गदर्शक](../resources/study-guide.md)
- **फर्कनुहोस्**: [मुख्य README](../README.md)

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। यसको मूल भाषा मा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।