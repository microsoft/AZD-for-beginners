<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:06:24+00:00",
  "source_file": "examples/README.md",
  "language_code": "ne"
}
-->
# उदाहरणहरू - व्यावहारिक AZD टेम्प्लेटहरू र कन्फिगरेसनहरू

## परिचय

यो डाइरेक्टरीले व्यावहारिक उदाहरणहरू, टेम्प्लेटहरू, र वास्तविक संसारका परिदृश्यहरू समावेश गर्दछ जसले Azure Developer CLI सिक्न तपाईंलाई व्यावहारिक अभ्यासको माध्यमबाट मद्दत गर्दछ। प्रत्येक उदाहरणले पूर्ण कार्यरत कोड, पूर्वाधार टेम्प्लेटहरू, र विभिन्न एप्लिकेसन आर्किटेक्चरहरू र डिप्लोयमेन्ट ढाँचाहरूको विस्तृत निर्देशन प्रदान गर्दछ।

## सिक्ने लक्ष्यहरू

यी उदाहरणहरूमा काम गर्दा, तपाईं:
- यथार्थपरक एप्लिकेसन परिदृश्यहरूसँग Azure Developer CLI वर्कफ्लो अभ्यास गर्नुहुनेछ
- विभिन्न एप्लिकेसन आर्किटेक्चरहरू र तिनका azd कार्यान्वयनहरू बुझ्नुहुनेछ
- विभिन्न Azure सेवाहरूका लागि Infrastructure as Code ढाँचाहरूमा निपुणता हासिल गर्नुहुनेछ
- कन्फिगरेसन व्यवस्थापन र वातावरण-विशिष्ट डिप्लोयमेन्ट रणनीतिहरू लागू गर्नुहुनेछ
- व्यावहारिक सन्दर्भहरूमा निगरानी, सुरक्षा, र स्केलिङ ढाँचाहरू कार्यान्वयन गर्नुहुनेछ
- वास्तविक डिप्लोयमेन्ट परिदृश्यहरूको समस्या समाधान र डिबगिङ अनुभव निर्माण गर्नुहुनेछ

## सिक्ने परिणामहरू

यी उदाहरणहरू पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- Azure Developer CLI प्रयोग गरेर विभिन्न एप्लिकेसन प्रकारहरू आत्मविश्वासका साथ डिप्लोय गर्न
- प्रदान गरिएका टेम्प्लेटहरूलाई आफ्नै एप्लिकेसन आवश्यकताहरूमा अनुकूलन गर्न
- Bicep प्रयोग गरेर अनुकूलित पूर्वाधार ढाँचाहरू डिजाइन र कार्यान्वयन गर्न
- उचित निर्भरताहरूका साथ जटिल बहु-सेवा एप्लिकेसनहरू कन्फिगर गर्न
- वास्तविक परिदृश्यहरूमा सुरक्षा, निगरानी, र प्रदर्शनका उत्कृष्ट अभ्यासहरू लागू गर्न
- व्यावहारिक अनुभवको आधारमा डिप्लोयमेन्टहरू समस्या समाधान र अनुकूलन गर्न

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

### शुरुवातकर्ताहरूका लागि
1. **[साधारण वेब एप - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Node.js Express वेब एप्लिकेसन MongoDB सहित डिप्लोय गर्नुहोस्
2. **[स्टाटिक वेबसाइट - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Azure Static Web Apps प्रयोग गरेर React स्टाटिक वेबसाइट होस्ट गर्नुहोस्
3. **[कन्टेनर एप - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - कन्टेनराइज गरिएको Python Flask एप्लिकेसन डिप्लोय गर्नुहोस्

### मध्यम स्तरका प्रयोगकर्ताहरूका लागि
4. **[डाटाबेस एप - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - C# API र Azure SQL Database सहित वेब एप्लिकेसन
5. **[सर्भरलेस फङ्क्सन - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - HTTP ट्रिगरहरू र Cosmos DB सहित Python Azure Functions
6. **[माइक्रोसर्भिसहरू - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Container Apps र API Gateway सहित बहु-सेवा Java एप्लिकेसन

### Azure AI Foundry टेम्प्लेटहरू

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Azure OpenAI सहित बौद्धिक च्याट एप्लिकेसन
2. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** - Azure AI सेवाहरू प्रयोग गरेर दस्तावेज विश्लेषण
3. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** - Azure Machine Learning सहित MLOps वर्कफ्लो

## 📋 प्रयोग निर्देशिका

### स्थानीय रूपमा उदाहरणहरू चलाउने

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

### उदाहरणहरू अनुकूलन गर्दै

प्रत्येक उदाहरणमा समावेश छ:
- **README.md** - विस्तृत सेटअप र अनुकूलन निर्देशनहरू
- **azure.yaml** - टिप्पणीहरू सहित AZD कन्फिगरेसन
- **infra/** - Bicep टेम्प्लेटहरू र प्यारामिटर व्याख्याहरू
- **src/** - नमूना एप्लिकेसन कोड
- **scripts/** - सामान्य कार्यहरूको लागि सहायक स्क्रिप्टहरू

## 🎯 सिक्ने उद्देश्यहरू

### उदाहरण श्रेणीहरू

#### **साधारण डिप्लोयमेन्टहरू**
- एकल-सेवा एप्लिकेसनहरू
- साधारण पूर्वाधार ढाँचाहरू
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
- आपतकालीन पुनर्प्राप्ति सेटअपहरू

## 📖 उदाहरण विवरणहरू

### साधारण वेब एप - Node.js Express
**प्रविधिहरू**: Node.js, Express, MongoDB, Container Apps  
**जटिलता**: शुरुवातकर्ता  
**धारणाहरू**: आधारभूत डिप्लोयमेन्ट, REST API, NoSQL डाटाबेस एकीकरण

### स्टाटिक वेबसाइट - React SPA
**प्रविधिहरू**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**जटिलता**: शुरुवातकर्ता  
**धारणाहरू**: स्टाटिक होस्टिङ, सर्भरलेस ब्याकएन्ड, आधुनिक वेब विकास

### कन्टेनर एप - Python Flask
**प्रविधिहरू**: Python Flask, Docker, Container Apps, Container Registry  
**जटिलता**: शुरुवातकर्ता  
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
**धारणाहरू**: दस्तावेज विश्लेषण, OCR, डाटा निकासी

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
- पुन: प्रयोग गर्न मिल्ने पूर्वाधार कम्पोनेन्टहरू
- सामान्य स्रोत ढाँचाहरू
- सुरक्षा-प्रबलित टेम्प्लेटहरू
- लागत-अनुकूलित कन्फिगरेसनहरू

### सहायक स्क्रिप्टहरू
- वातावरण सेटअप स्वचालन
- डाटाबेस माइग्रेशन स्क्रिप्टहरू
- डिप्लोयमेन्ट मान्यकरण उपकरणहरू
- लागत निगरानी उपयोगिताहरू

## 🔧 अनुकूलन मार्गदर्शिका

### तपाईंको प्रयोग केसका लागि उदाहरणहरू अनुकूलन गर्दै

1. **पूर्वापेक्षाहरू समीक्षा गर्नुहोस्**
   - Azure सेवा आवश्यकताहरू जाँच गर्नुहोस्
   - सदस्यता सीमाहरू प्रमाणित गर्नुहोस्
   - लागत प्रभावहरू बुझ्नुहोस्

2. **कन्फिगरेसन परिमार्जन गर्नुहोस्**
   - `azure.yaml` सेवा परिभाषाहरू अद्यावधिक गर्नुहोस्
   - Bicep टेम्प्लेटहरू अनुकूलन गर्नुहोस्
   - वातावरण चरहरू समायोजन गर्नुहोस्

3. **थोरै परीक्षण गर्नुहोस्**
   - पहिले विकास वातावरणमा डिप्लोय गर्नुहोस्
   - कार्यक्षमता प्रमाणित गर्नुहोस्
   - स्केलिङ र प्रदर्शन परीक्षण गर्नुहोस्

4. **सुरक्षा समीक्षा गर्नुहोस्**
   - पहुँच नियन्त्रणहरू समीक्षा गर्नुहोस्
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

## 🎓 सिक्ने मार्ग

### सिफारिस गरिएको प्रगति

1. **साधारण वेब एपबाट सुरु गर्नुहोस्**
   - आधारभूत AZD अवधारणाहरू सिक्नुहोस्
   - डिप्लोयमेन्ट वर्कफ्लो बुझ्नुहोस्
   - वातावरण व्यवस्थापन अभ्यास गर्नुहोस्

2. **स्टाटिक वेबसाइट प्रयास गर्नुहोस्**
   - विभिन्न होस्टिङ विकल्पहरू अन्वेषण गर्नुहोस्
   - CDN एकीकरणको बारेमा सिक्नुहोस्
   - DNS कन्फिगरेसन बुझ्नुहोस्

3. **कन्टेनर एपमा जानुहोस्**
   - कन्टेनराइजेसनको आधारभूत कुरा सिक्नुहोस्
   - स्केलिङ अवधारणाहरू बुझ्नुहोस्
   - Docker प्रयोग गरेर अभ्यास गर्नुहोस्

4. **डाटाबेस एकीकरण थप्नुहोस्**
   - डाटाबेस प्रावधान सिक्नुहोस्
   - कनेक्शन स्ट्रिङहरू बुझ्नुहोस्
   - गोप्य व्यवस्थापन अभ्यास गर्नुहोस्

5. **सर्भरलेस अन्वेषण गर्नुहोस्**
   - इभेन्ट-ड्रिभन आर्किटेक्चर बुझ्नुहोस्
   - ट्रिगरहरू र बाइन्डिङहरूको बारेमा सिक्नुहोस्
   - API हरूसँग अभ्यास गर्नुहोस्

6. **माइक्रोसर्भिसहरू निर्माण गर्नुहोस्**
   - सेवा संचार सिक्नुहोस्
   - वितरित प्रणालीहरू बुझ्नुहोस्
   - जटिल डिप्लोयमेन्ट अभ्यास गर्नुहोस्

## 🔍 सही उदाहरण खोज्दै

### प्रविधि स्ट्याकद्वारा
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **कन्टेनरहरू**: Python Flask Container App, Java Microservices
- **डाटाबेसहरू**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### आर्किटेक्चर ढाँचाद्वारा
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: Java Spring Boot Microservices
- **Containerized**: Python Flask Container App
- **AI-Powered**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### जटिलता स्तरद्वारा
- **शुरुवातकर्ता**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **मध्यम**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **उन्नत**: ML Pipeline

## 📚 थप स्रोतहरू

### दस्तावेजीकरण लिङ्कहरू
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### समुदाय उदाहरणहरू
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App with C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions with Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### उत्कृष्ट अभ्यासहरू
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 उदाहरणहरू योगदान गर्दै

के तपाईंसँग उपयोगी उदाहरण छ? हामी योगदानलाई स्वागत गर्दछौं!

### सबमिशन दिशानिर्देशहरू
1. स्थापित डाइरेक्टरी संरचनालाई पालना गर्नुहोस्
2. व्यापक README.md समावेश गर्नुहोस्
3. कन्फिगरेसन फाइलहरूमा टिप्पणीहरू थप्नुहोस्
4. सबमिट गर्नु अघि राम्रोसँग परीक्षण गर्नुहोस्
5. लागत अनुमान र पूर्वापेक्षाहरू समावेश गर्नुहोस्

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

**प्रो टिप**: तपाईंको प्रविधि स्ट्याकसँग मेल खाने सबैभन्दा साधारण उदाहरणबाट सुरु गर्नुहोस्, त्यसपछि क्रमशः थप जटिल परिदृश्यहरूमा जानुहोस्। प्रत्येक उदाहरणले अघिल्लो उदाहरणका अवधारणाहरूमा निर्माण गर्दछ!

**अर्को कदमहरू**: 
- तपाईंको सीप स्तरसँग मेल खाने उदाहरण चयन गर्नुहोस्
- उदाहरणको README मा सेटअप निर्देशनहरू पालना गर्नुहोस्
- अनुकूलनहरूसँग प्रयोग गर्नुहोस्
- समुदायसँग तपाईंको सिकाइहरू साझा गर्नुहोस्

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [अध्ययन मार्गदर्शिका](../resources/study-guide.md)
- **फिर्ता जानुहोस्**: [मुख्य README](../README.md)

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटि वा अशुद्धता हुन सक्छ। यसको मूल भाषामा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।