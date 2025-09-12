<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee9a026a572535444287d531dbd75d78",
  "translation_date": "2025-09-12T18:54:37+00:00",
  "source_file": "README.md",
  "language_code": "ne"
}
-->
# AZD सुरुवातका लागि

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.ne.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)

![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)

![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)

यी स्रोतहरू प्रयोग गर्न सुरु गर्न निम्न चरणहरू पालना गर्नुहोस्:
1. **रिपोजिटरीलाई Fork गर्नुहोस्**: क्लिक गर्नुहोस् [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **रिपोजिटरीलाई Clone गर्नुहोस्**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Azure Discord समुदायमा सामेल हुनुहोस् र विशेषज्ञहरू तथा अन्य विकासकर्तासँग भेट गर्नुहोस्**](https://discord.com/invite/ByRwuEEgH4)

### बहुभाषिक समर्थन

#### GitHub Action मार्फत समर्थित (स्वचालित र सधैं अद्यावधिक)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](./README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**यदि तपाईं थप भाषाहरूको अनुवाद चाहनुहुन्छ भने यहाँ सूचीबद्ध छन् [यहाँ](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## परिचय

Azure Developer CLI (azd) को विस्तृत मार्गदर्शनमा स्वागत छ। यो रिपोजिटरी विद्यार्थीदेखि पेशेवर विकासकर्तासम्मका सबै स्तरका विकासकर्ताहरूलाई Azure Developer CLI सिक्न र मास्टर गर्न मद्दत गर्न डिजाइन गरिएको छ, **Azure AI Foundry प्रयोग गरेर AI एप्लिकेसन तैनातीमा विशेष ध्यान केन्द्रित गर्दै**। यो संरचित सिकाइ स्रोतले Azure क्लाउड तैनातीहरू, सामान्य समस्याहरू समाधान गर्ने, र सफल AZD टेम्पलेट तैनातीहरूको लागि उत्कृष्ट अभ्यासहरू कार्यान्वयन गर्ने व्यावहारिक अनुभव प्रदान गर्दछ।

### **AI विकासकर्ताहरूका लागि यो मार्गदर्शन किन महत्त्वपूर्ण छ**
हाम्रो हालको Azure AI Foundry Discord समुदाय सर्वेक्षणको आधारमा, **45% विकासकर्ताहरू AI कार्यभारका लागि AZD प्रयोग गर्न इच्छुक छन्** तर निम्न चुनौतीहरूको सामना गर्छन्:
- जटिल बहु-सेवा AI आर्किटेक्चर
- उत्पादन AI तैनाती उत्कृष्ट अभ्यासहरू
- Azure AI सेवा एकीकरण र कन्फिगरेसन
- AI कार्यभारको लागि लागत अनुकूलन
- AI-विशिष्ट तैनाती समस्याहरू समाधान गर्ने

## सिकाइ लक्ष्यहरू

यो रिपोजिटरीमा काम गरेर, तपाईं:
- Azure Developer CLI को आधारभूत र मुख्य अवधारणाहरूमा महारत हासिल गर्नुहोस्
- Infrastructure as Code प्रयोग गरेर Azure स्रोतहरू तैनात र प्रावधान गर्न सिक्नुहोस्
- सामान्य AZD तैनाती समस्याहरू समाधान गर्ने सीप विकास गर्नुहोस्
- पूर्व-तैनाती मान्यता र क्षमता योजना बुझ्नुहोस्
- सुरक्षा उत्कृष्ट अभ्यासहरू र लागत अनुकूलन रणनीतिहरू कार्यान्वयन गर्नुहोस्
- Azure मा उत्पादन-तयार एप्लिकेसनहरू तैनात गर्न आत्मविश्वास निर्माण गर्नुहोस्

## सिकाइ परिणामहरू

यो पाठ्यक्रम पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- Azure Developer CLI सफलतापूर्वक स्थापना, कन्फिगर, र प्रयोग गर्नुहोस्
- AZD टेम्पलेटहरू प्रयोग गरेर एप्लिकेसनहरू सिर्जना र तैनात गर्नुहोस्
- प्रमाणीकरण, पूर्वाधार, र तैनाती समस्याहरू समाधान गर्नुहोस्
- पूर्व-तैनाती जाँचहरू प्रदर्शन गर्नुहोस् जसमा क्षमता योजना र SKU चयन समावेश छ
- निगरानी, सुरक्षा, र लागत व्यवस्थापन उत्कृष्ट अभ्यासहरू कार्यान्वयन गर्नुहोस्
- CI/CD पाइपलाइनहरूमा AZD वर्कफ्लोहरू एकीकृत गर्नुहोस्

## सामग्री तालिका

- [Azure Developer CLI के हो?](../..)
- [द्रुत सुरुवात](../..)
- [सिकाइ मार्ग](../..)
  - [AI विकासकर्ताहरूका लागि (यहाँबाट सुरु गर्नुहोस्!)](../..)
  - [विद्यार्थीहरू र सुरुवातकर्ताहरूका लागि](../..)
  - [विकासकर्ताहरूका लागि](../..)
  - [DevOps इन्जिनियरहरूका लागि](../..)
- [प्रलेखन](../..)
  - [सुरुवात](../..)
  - [तैनाती र प्रावधान](../..)
  - [पूर्व-तैनाती जाँचहरू](../..)
  - [AI र Azure AI Foundry](../..)
  - [समस्या समाधान](../..)
- [उदाहरणहरू र टेम्पलेटहरू](../..)
  - [विशेष: Azure AI Foundry टेम्पलेटहरू](../..)
  - [विशेष: Azure AI Foundry E2E परिदृश्यहरू](../..)
  - [थप AZD टेम्पलेटहरू](../..)
  - [व्यावहारिक प्रयोगशालाहरू र कार्यशालाहरू](../..)
- [स्रोतहरू](../..)
- [योगदान](../..)
- [समर्थन](../..)
- [समुदाय](../..)

## Azure Developer CLI के हो?

Azure Developer CLI (azd) एक विकासकर्ता-केंद्रित कमाण्ड-लाइन इन्टरफेस हो जसले Azure मा एप्लिकेसन निर्माण र तैनातीको प्रक्रिया तीव्र बनाउँछ। यसले प्रदान गर्दछ:

- **टेम्पलेट-आधारित तैनातीहरू** - सामान्य एप्लिकेसन ढाँचाहरूका लागि पूर्व-निर्मित टेम्पलेटहरू प्रयोग गर्नुहोस्
- **Infrastructure as Code** - Bicep वा Terraform प्रयोग गरेर Azure स्रोतहरू व्यवस्थापन गर्नुहोस्
- **एकीकृत वर्कफ्लोहरू** - एप्लिकेसनहरू प्रावधान, तैनात, र निगरानी गर्न सहज रूपमा
- **विकासकर्ता-अनुकूल** - विकासकर्ता उत्पादकता र अनुभवको लागि अनुकूलित

### **AZD + Azure AI Foundry: AI तैनातीहरूको लागि उत्तम**

**AI समाधानहरूको लागि AZD किन?** AZD ले AI विकासकर्ताहरूले सामना गर्ने शीर्ष चुनौतीहरू समाधान गर्दछ:

- **AI-तयार टेम्पलेटहरू** - Azure OpenAI, Cognitive Services, र ML कार्यभारका लागि पूर्व-कन्फिगर गरिएको टेम्पलेटहरू
- **सुरक्षित AI तैनातीहरू** - AI सेवाहरू, API कुञ्जीहरू, र मोडेल अन्त बिन्दुहरूको लागि निर्मित सुरक्षा ढाँचाहरू
- **उत्पादन AI ढाँचाहरू** - स्केलेबल, लागत-प्रभावकारी AI एप्लिकेसन तैनातीहरूको लागि उत्कृष्ट अभ्यासहरू
- **एन्ड-टु-एन्ड AI वर्कफ्लोहरू** - मोडेल विकासदेखि उत्पादन तैनातीसम्म उचित निगरानीको साथ
- **लागत अनुकूलन** - AI कार्यभारका लागि स्मार्ट स्रोत आवंटन र स्केलिङ रणनीतिहरू
- **Azure AI Foundry एकीकरण** - AI Foundry मोडेल क्याटलग र अन्त बिन्दुहरूसँग सहज कनेक्शन

## द्रुत सुरुवात

### आवश्यकताहरू
- Azure सदस्यता
- Azure CLI स्थापना गरिएको
- Git (टेम्पलेटहरू क्लोन गर्न)

### स्थापना
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### तपाईंको पहिलो तैनाती
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

### तपाईंको पहिलो AI तैनाती
```bash
# Initialize an AI-powered chat application with Azure OpenAI
azd init --template azure-search-openai-demo

# Configure AI services and deploy
azd up

# Or try other AI templates:
azd init --template openai-chat-app-quickstart
azd init --template ai-document-processing
azd init --template contoso-chat
```

## सिकाइ मार्ग

### AI विकासकर्ताहरूका लागि (यहाँबाट सुरु गर्नुहोस्!)
1. **द्रुत सुरुवात**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) टेम्पलेट प्रयास गर्नुहोस्
2. **आधारभूत सिक्नुहोस्**: [AZD Basics](docs/getting-started/azd-basics.md) + [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
3. **व्यावहारिक अभ्यास**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) पूरा गर्नुहोस्
4. **उत्पादन तयार**: [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) समीक्षा गर्नुहोस्
5. **उन्नत**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat) उद्यम टेम्पलेट तैनात गर्नुहोस्

### विद्यार्थीहरू र सुरुवातकर्ताहरूका लागि
1. [AZD Basics](docs/getting-started/azd-basics.md) बाट सुरु गर्नुहोस्
2. [स्थापन मार्गदर्शन](docs/getting-started/installation.md) पालना गर्नुहोस्
3. [तपाईंको पहिलो परियोजना](docs/getting-started/first-project.md) पूरा गर्नुहोस्
4. [साधारण वेब एप्लिकेसन उदाहरण](../../examples/simple-web-app) अभ्यास गर्नुहोस्

### विकासकर्ताहरूका लागि
1. [कन्फिगरेसन मार्गदर्शन](docs/getting-started/configuration.md) समीक्षा गर्नुहोस्
2. [तैनाती मार्गदर्शन](docs/deployment/deployment-guide.md) अध्ययन गर्नुहोस्
3. [डाटाबेस एप्लिकेसन उदाहरण](../../examples/database-app) काम गर्नुहोस्
4. [कन्टेनर एप्लिकेसन उदाहरण](../../examples/container-app) अन्वेषण गर्नुहोस्

### DevOps इन्जिनियरहरूका लागि
1. [स्रोतहरू प्रावधान गर्ने](docs/deployment/provisioning.md) मास्टर गर्नुहोस्
2. [पूर्व-उडान जाँचहरू](docs/pre-deployment/preflight-checks.md) कार्यान्वयन गर्नुहोस्
3. [क्षमता योजना](docs/pre-deployment/capacity-planning.md) अभ्यास गर्नुहोस्
4. उन्नत [माइक्रोसर्भिसेस उदाहरण](../../examples/microservices)

## प्रलेखन

### सुरुवात
- [**AZD Basics**](docs/getting-started/azd-basics.md) - मुख्य अवधारणाहरू र शब्दावली
- [**स्थापन र सेटअप**](docs/getting-started/installation.md) - प्लेटफर्म-विशिष्ट स्थापन मार्गदर्शनहरू
- [**कन्फिगरेसन**](docs/getting-started/configuration.md) - वातावरण सेटअप र प्रमाणीकरण
- [**तपाईंको पहिलो परियोजना**](docs/getting-started/first-project.md) - चरण-दर-चरण ट्यूटोरियल

### तैनाती र प्रावधान
- [**तैनाती मार्गदर्शन**](docs/deployment/deployment-guide.md) - पूर्ण तैनाती वर्कफ्लोहरू
- [**स्रोतहरू प्रावधान गर्ने**](docs/deployment/provisioning.md) - Azure स्रोत व्यवस्थापन

### पूर्व-तैनाती जाँचहरू
- [**क्षमता योजना**](docs/pre-deployment/capacity-planning.md) - Azure स्रोत क्षमता मान्यता
- [**SKU चयन**](docs/pre-deployment/sku-selection.md) - सही Azure SKUs चयन गर्ने
- [**पूर्व-उडान जाँचहरू**](docs/pre-deployment/preflight-checks.md) - स्वचालित मान्यता स्क्रिप्टहरू

### AI र Azure AI Foundry
- [**Azure AI Foundry एकीकरण**](docs/ai-foundry/azure-ai-foundry-integration.md) - AZD लाई Azure AI Foundry सेवाहरूमा जडान गर्नुहोस्
- [**AI मोडेल तैनाती ढाँचाहरू**](docs/ai-foundry/ai-model-deployment.md) - AZD प्रयोग गरेर AI मोडेलहरू तैनात र व्यवस्थापन गर्नुहोस्
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - व्यावहारिक प्रयोगशाला: AI समाधानहरू AZD-तयार बनाउँदै
- [**उत्पादन AI उत्कृष्ट अभ्यासहरू**](docs/ai-foundry/production-ai-practices.md) - AI कार्यभारहरूको लागि सुरक्षा, स्केलिङ, र निगरानी

### समस्या समाधान
- [**सामान्य समस्याहरू**](docs/troubleshooting/common-issues.md) - बारम्बार सामना गरिने समस्याहरू र समाधानहरू
- [**डिबगिङ गाइड**](docs/troubleshooting/debugging.md) - चरणबद्ध डिबगिङ रणनीतिहरू  
- [**AI-सम्बन्धित समस्या समाधान**](docs/troubleshooting/ai-troubleshooting.md) - AI सेवा र मोडेल परिनियोजन समस्याहरू  

## उदाहरणहरू र टेम्प्लेटहरू  

### [विशेष: Azure AI Foundry टेम्प्लेटहरू](https://ai.azure.com/resource/build/templates)  
**AI एप्लिकेसनहरू परिनियोजन गर्न यहाँबाट सुरु गर्नुहोस्!**  

| टेम्प्लेट | विवरण | जटिलता | सेवाहरू |  
|----------|-------------|------------|----------|  
| [**AI च्याटसँग सुरु गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Azure Container Apps प्रयोग गरेर तपाईंको डेटा र टेलिमेट्री इनसाइट्ससँग एकीकृत आधारभूत च्याट एप्लिकेसन सिर्जना र परिनियोजन गर्नुहोस् |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |  
| [**AI एजेन्टसँग सुरु गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Azure Container Apps प्रयोग गरेर कार्यहरू र टेलिमेट्री इनसाइट्ससहित आधारभूत एजेन्ट एप्लिकेसन सिर्जना र परिनियोजन गर्नुहोस्। |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|  
| [**बहु-एजेन्ट वर्कफ्लो स्वचालन**](https://github.com/Azure-Samples/get-started-with-ai-chat) | AI एजेन्टहरूको समूहलाई समन्वय र व्यवस्थापन गरेर कार्य योजना र स्वचालन सुधार गर्नुहोस्।|⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**तपाईंको डेटा बाट कागजातहरू सिर्जना गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | तपाईंको डेटा बाट सम्बन्धित जानकारी फेला पारेर र संक्षेपमा प्रस्तुत गरेर कागजातहरू जस्तै सम्झौता, इनभ्वाइस र लगानी प्रस्तावहरूको सिर्जना गति बढाउनुहोस्। |⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|  
| [**ग्राहक बैठकहरू एजेन्टहरूसँग सुधार गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | एजेन्टहरूको टोली प्रयोग गरेर पुरानो कोडलाई आधुनिक भाषामा माइग्रेट गर्नुहोस्। |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |  
| [**तपाईंको कोड एजेन्टहरूसँग आधुनिक बनाउनुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Azure Container Apps प्रयोग गरेर तपाईंको डेटा र टेलिमेट्री इनसाइट्ससँग एकीकृत आधारभूत च्याट एप्लिकेसन सिर्जना र परिनियोजन गर्नुहोस्। |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**तपाईंको संवादात्मक एजेन्ट निर्माण गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | उन्नत संवादात्मक बुझाइ प्रयोग गरेर निश्चित र मानव-नियन्त्रित वर्कफ्लोहरूसँग च्याटबोटहरू र एजेन्टहरू सिर्जना र सुधार गर्नुहोस्। |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|  
| [**संवादात्मक डेटा बाट इनसाइट्स अनलक गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | ठूला अडियो र पाठ-आधारित डेटा सेटहरूबाट उन्नत सामग्री बुझाइ क्षमताहरू प्रयोग गरेर सम्पर्क केन्द्रको दक्षता सुधार गर्नुहोस्। |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|  
| [**बहु-मोडल सामग्री प्रशोधन**](https://github.com/Azure-Samples/get-started-with-ai-chat) | असंरचित सामग्रीबाट जानकारी निकालेर र संरचित ढाँचामा म्याप गरेर दाबीहरू, इनभ्वाइसहरू, सम्झौताहरू र अन्य कागजातहरू छिटो र सही रूपमा प्रशोधन गर्नुहोस्। यो टेम्प्लेटले पाठ, छविहरू, तालिकाहरू र ग्राफहरूलाई समर्थन गर्दछ। |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|  

### विशेष: Azure AI Foundry E2E परिदृश्यहरू  
**AI एप्लिकेसनहरू परिनियोजन गर्न यहाँबाट सुरु गर्नुहोस्!**  

| टेम्प्लेट | विवरण | जटिलता | सेवाहरू |  
|----------|-------------|------------|----------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Azure OpenAI प्रयोग गरेर सरल च्याट इन्टरफेस | ⭐ | AzureOpenAI + Container Apps |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-सक्षम च्याट एप Azure OpenAI प्रयोग गरेर | ⭐⭐ | AzureOpenAI + Search + App Service |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | AI सेवाहरू प्रयोग गरेर कागजात विश्लेषण | ⭐⭐ | Azure Document Intelligence + Functions |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | कार्य कलिङसहित AI एजेन्ट फ्रेमवर्क | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | AI समन्वयसहित उद्यम च्याट | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |  

### अतिरिक्त AZD टेम्प्लेटहरू  
- [**उदाहरण निर्देशिका**](examples/README.md) - व्यावहारिक उदाहरणहरू, टेम्प्लेटहरू, र वास्तविक-विश्व परिदृश्यहरू  
- [**Azure-Samples AZD टेम्प्लेटहरू**](https://github.com/Azure-Samples/azd-templates) - आधिकारिक Microsoft नमूना टेम्प्लेटहरू  
- [**Awesome AZD ग्यालरी**](https://azure.github.io/awesome-azd/) - समुदायद्वारा योगदान गरिएको टेम्प्लेटहरू  

### प्रयोगात्मक प्रयोगशालाहरू र कार्यशालाहरू  
- [**AI कार्यशाला प्रयोगशाला**](docs/ai-foundry/ai-workshop-lab.md) - **नयाँ**: तपाईंको AI समाधानहरू AZD-परिनियोजन योग्य बनाउनुहोस्  
- [**AZD सुरुवातकर्ताहरू कार्यशाला**](workshop/README.md) - AI एजेन्ट AZD टेम्प्लेट परिनियोजनमा केन्द्रित  

## स्रोतहरू  

### छिटो सन्दर्भहरू  
- [**कमाण्ड चिट शीट**](resources/cheat-sheet.md) - आवश्यक azd कमाण्डहरू  
- [**शब्दावली**](resources/glossary.md) - Azure र azd शब्दावली  
- [**FAQ**](resources/faq.md) - बारम्बार सोधिने प्रश्नहरू  
- [**अध्ययन गाइड**](resources/study-guide.md) - व्यापक सिकाइ उद्देश्यहरू र अभ्यासहरू  

### बाह्य स्रोतहरू  
- [Azure Developer CLI दस्तावेज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure आर्किटेक्चर केन्द्र](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure मूल्य निर्धारण क्यालकुलेटर](https://azure.microsoft.com/pricing/calculator/)  
- [Azure स्थिति](https://status.azure.com/)  

## योगदान  

हामी योगदानलाई स्वागत गर्दछौं! कृपया हाम्रो [योगदान गाइड](CONTRIBUTING.md) पढ्नुहोस्:  
- समस्या र सुविधा अनुरोधहरू कसरी पेश गर्ने  
- कोड योगदान दिशानिर्देशहरू  
- दस्तावेज सुधारहरू  
- समुदाय मापदण्डहरू  

## समर्थन  

- **समस्या**: [बग रिपोर्ट गर्नुहोस् र सुविधाहरू अनुरोध गर्नुहोस्](https://github.com/microsoft/azd-for-beginners/issues)  
- **चर्चा**: [Microsoft Azure Discord समुदाय Q&A र चर्चा](https://discord.gg/microsoft-azure)  
- **AI-सम्बन्धित समर्थन**: AZD + AI Foundry चर्चाको लागि [#Azure च्यानल](https://discord.gg/microsoft-azure) मा सामेल हुनुहोस्  
- **इमेल**: निजी सोधपुछहरूको लागि  
- **Microsoft Learn**: [आधिकारिक Azure Developer CLI दस्तावेज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Azure AI Foundry Discord बाट समुदाय इनसाइट्स  

**#Azure च्यानलबाट सर्वेक्षण परिणामहरू:**  
- **४५%** विकासकर्ताहरू AZD AI वर्कलोडहरूको लागि प्रयोग गर्न चाहन्छन्  
- **मुख्य चुनौतीहरू**: बहु-सेवा परिनियोजन, प्रमाणपत्र व्यवस्थापन, उत्पादन तयारी  
- **सबैभन्दा धेरै अनुरोध गरिएको**: AI-सम्बन्धित टेम्प्लेटहरू, समस्या समाधान गाइडहरू, उत्कृष्ट अभ्यासहरू  

**हाम्रो समुदायमा सामेल हुनुहोस्:**  
- तपाईंको AZD + AI अनुभवहरू साझा गर्नुहोस् र सहयोग प्राप्त गर्नुहोस्  
- नयाँ AI टेम्प्लेटहरूको प्रारम्भिक पूर्वावलोकन पहुँच गर्नुहोस्  
- AI परिनियोजन उत्कृष्ट अभ्यासहरूमा योगदान गर्नुहोस्  
- भविष्यको AI + AZD सुविधा विकासलाई प्रभाव पार्नुहोस्  

## लाइसेन्स  

यो परियोजना MIT लाइसेन्स अन्तर्गत लाइसेन्स गरिएको छ - विवरणको लागि [LICENSE](../../LICENSE) फाइल हेर्नुहोस्।  

## अन्य पाठ्यक्रमहरू  

हाम्रो टोलीले अन्य पाठ्यक्रमहरू उत्पादन गर्दछ! जाँच गर्नुहोस्:  

- [**नयाँ** मोडेल सन्दर्भ प्रोटोकल (MCP) सुरुवातकर्ताहरूको लागि](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI एजेन्ट सुरुवातकर्ताहरूको लागि](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI सुरुवातकर्ताहरूको लागि .NET प्रयोग गर्दै](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generative AI सुरुवातकर्ताहरूको लागि](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI सुरुवातकर्ताहरूको लागि Java प्रयोग गर्दै](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML सुरुवातकर्ताहरूको लागि](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [डेटा विज्ञान सुरुवातकर्ताहरूको लागि](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI सुरुवातकर्ताहरूको लागि](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [साइबर सुरक्षा सुरुवातकर्ताहरूको लागि](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [वेब विकास सुरुवातकर्ताहरूको लागि](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [IoT सुरुवातकर्ताहरूको लागि](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [XR विकास सुरुवातकर्ताहरूको लागि](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [GitHub Copilot AI जोडी प्रोग्रामिङको लागि मास्टरिङ](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [C#/.NET विकासकर्ताहरूको लागि GitHub Copilot मास्टरिङ](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [तपाईंको आफ्नै Copilot साहसिक छनौट गर्नुहोस्](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**नेभिगेसन**  
- **अर्को पाठ**: [AZD आधारभूतहरू](docs/getting-started/azd-basics.md)  

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटि वा अशुद्धता हुन सक्छ। यसको मूल भाषामा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।