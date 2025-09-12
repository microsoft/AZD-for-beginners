<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee9a026a572535444287d531dbd75d78",
  "translation_date": "2025-09-12T17:16:33+00:00",
  "source_file": "README.md",
  "language_code": "hi"
}
-->
# AZD शुरुआती लोगों के लिए

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.hi.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)

![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)

![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)

इन संसाधनों का उपयोग शुरू करने के लिए निम्नलिखित चरणों का पालन करें:
1. **रेपॉजिटरी को फोर्क करें**: क्लिक करें [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **रेपॉजिटरी को क्लोन करें**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Azure Discord समुदायों में शामिल हों और विशेषज्ञों व अन्य डेवलपर्स से मिलें**](https://discord.com/invite/ByRwuEEgH4)

### बहु-भाषा समर्थन

#### GitHub Action के माध्यम से समर्थित (स्वचालित और हमेशा अद्यतन)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](./README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**यदि आप अतिरिक्त भाषाओं में अनुवाद चाहते हैं, तो समर्थित भाषाओं की सूची [यहां](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md) उपलब्ध है।**

## परिचय

Azure Developer CLI (azd) के लिए व्यापक गाइड में आपका स्वागत है। यह रेपॉजिटरी छात्रों से लेकर पेशेवर डेवलपर्स तक सभी स्तरों के डेवलपर्स को Azure Developer CLI सीखने और मास्टर करने में मदद करने के लिए डिज़ाइन की गई है, **विशेष रूप से Azure AI Foundry का उपयोग करके AI एप्लिकेशन डिप्लॉयमेंट पर ध्यान केंद्रित करते हुए।** यह संरचित लर्निंग संसाधन Azure क्लाउड डिप्लॉयमेंट, सामान्य समस्याओं का समाधान, और सफल AZD टेम्पलेट डिप्लॉयमेंट के लिए सर्वोत्तम प्रथाओं को लागू करने का व्यावहारिक अनुभव प्रदान करता है।

### **AI डेवलपर्स के लिए यह गाइड क्यों महत्वपूर्ण है**
हमारे हालिया Azure AI Foundry Discord समुदाय पोल के अनुसार, **45% डेवलपर्स AZD का उपयोग AI वर्कलोड्स के लिए करना चाहते हैं**, लेकिन उन्हें निम्नलिखित चुनौतियों का सामना करना पड़ता है:
- जटिल मल्टी-सर्विस AI आर्किटेक्चर
- प्रोडक्शन AI डिप्लॉयमेंट की सर्वोत्तम प्रथाएं
- Azure AI सेवा एकीकरण और कॉन्फ़िगरेशन
- AI वर्कलोड्स के लिए लागत अनुकूलन
- AI-विशिष्ट डिप्लॉयमेंट समस्याओं का समाधान

## सीखने के लक्ष्य

इस रेपॉजिटरी पर काम करके, आप:
- Azure Developer CLI की मूल बातें और मुख्य अवधारणाओं में महारत हासिल करेंगे
- Infrastructure as Code का उपयोग करके Azure संसाधनों को डिप्लॉय और प्रोविजन करना सीखेंगे
- सामान्य AZD डिप्लॉयमेंट समस्याओं के लिए समाधान कौशल विकसित करेंगे
- प्री-डिप्लॉयमेंट वैलिडेशन और क्षमता योजना को समझेंगे
- सुरक्षा सर्वोत्तम प्रथाओं और लागत अनुकूलन रणनीतियों को लागू करेंगे
- Azure पर प्रोडक्शन-रेडी एप्लिकेशन डिप्लॉय करने में आत्मविश्वास हासिल करेंगे

## सीखने के परिणाम

इस कोर्स को पूरा करने के बाद, आप:
- Azure Developer CLI को सफलतापूर्वक इंस्टॉल, कॉन्फ़िगर और उपयोग कर पाएंगे
- AZD टेम्पलेट्स का उपयोग करके एप्लिकेशन बना और डिप्लॉय कर पाएंगे
- ऑथेंटिकेशन, इंफ्रास्ट्रक्चर, और डिप्लॉयमेंट समस्याओं का समाधान कर पाएंगे
- प्री-डिप्लॉयमेंट चेक्स जैसे क्षमता योजना और SKU चयन कर पाएंगे
- मॉनिटरिंग, सुरक्षा, और लागत प्रबंधन की सर्वोत्तम प्रथाओं को लागू कर पाएंगे
- AZD वर्कफ़्लो को CI/CD पाइपलाइनों में एकीकृत कर पाएंगे

## सामग्री की तालिका

- [Azure Developer CLI क्या है?](../..)
- [त्वरित शुरुआत](../..)
- [लर्निंग पाथ](../..)
  - [AI डेवलपर्स के लिए (यहां से शुरू करें!)](../..)
  - [छात्रों और शुरुआती लोगों के लिए](../..)
  - [डेवलपर्स के लिए](../..)
  - [DevOps इंजीनियरों के लिए](../..)
- [डॉक्यूमेंटेशन](../..)
  - [शुरुआत करना](../..)
  - [डिप्लॉयमेंट और प्रोविजनिंग](../..)
  - [प्री-डिप्लॉयमेंट चेक्स](../..)
  - [AI और Azure AI Foundry](../..)
  - [समस्या समाधान](../..)
- [उदाहरण और टेम्पलेट्स](../..)
  - [विशेष: Azure AI Foundry टेम्पलेट्स](../..)
  - [विशेष: Azure AI Foundry E2E परिदृश्य](../..)
  - [अतिरिक्त AZD टेम्पलेट्स](../..)
  - [हैंड्स-ऑन लैब्स और वर्कशॉप्स](../..)
- [संसाधन](../..)
- [योगदान](../..)
- [सहायता](../..)
- [समुदाय](../..)

## Azure Developer CLI क्या है?

Azure Developer CLI (azd) एक डेवलपर-केंद्रित कमांड-लाइन इंटरफ़ेस है जो Azure पर एप्लिकेशन बनाने और डिप्लॉय करने की प्रक्रिया को तेज करता है। यह प्रदान करता है:

- **टेम्पलेट-आधारित डिप्लॉयमेंट्स** - सामान्य एप्लिकेशन पैटर्न के लिए प्री-बिल्ट टेम्पलेट्स का उपयोग करें
- **Infrastructure as Code** - Bicep या Terraform का उपयोग करके Azure संसाधनों का प्रबंधन करें
- **इंटीग्रेटेड वर्कफ़्लो** - एप्लिकेशन को प्रोविजन, डिप्लॉय और मॉनिटर करें
- **डेवलपर-फ्रेंडली** - डेवलपर उत्पादकता और अनुभव के लिए अनुकूलित

### **AZD + Azure AI Foundry: AI डिप्लॉयमेंट्स के लिए आदर्श**

**AI समाधानों के लिए AZD क्यों?** AZD AI डेवलपर्स की शीर्ष चुनौतियों का समाधान करता है:

- **AI-रेडी टेम्पलेट्स** - Azure OpenAI, Cognitive Services, और ML वर्कलोड्स के लिए प्री-कॉन्फ़िगर्ड टेम्पलेट्स
- **सुरक्षित AI डिप्लॉयमेंट्स** - AI सेवाओं, API कुंजियों, और मॉडल एंडपॉइंट्स के लिए बिल्ट-इन सुरक्षा पैटर्न
- **प्रोडक्शन AI पैटर्न्स** - स्केलेबल, लागत-प्रभावी AI एप्लिकेशन डिप्लॉयमेंट्स के लिए सर्वोत्तम प्रथाएं
- **एंड-टू-एंड AI वर्कफ़्लो** - मॉडल डेवलपमेंट से लेकर प्रोडक्शन डिप्लॉयमेंट तक उचित मॉनिटरिंग के साथ
- **लागत अनुकूलन** - AI वर्कलोड्स के लिए स्मार्ट संसाधन आवंटन और स्केलिंग रणनीतियां
- **Azure AI Foundry एकीकरण** - AI Foundry मॉडल कैटलॉग और एंडपॉइंट्स से सहज कनेक्शन

## त्वरित शुरुआत

### आवश्यकताएँ
- Azure सब्सक्रिप्शन
- Azure CLI इंस्टॉल किया हुआ
- Git (टेम्पलेट्स को क्लोन करने के लिए)

### इंस्टॉलेशन
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### आपका पहला डिप्लॉयमेंट
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

### आपका पहला AI डिप्लॉयमेंट
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

## लर्निंग पाथ

### AI डेवलपर्स के लिए (यहां से शुरू करें!)
1. **त्वरित शुरुआत**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) टेम्पलेट आज़माएं
2. **मूल बातें सीखें**: [AZD Basics](docs/getting-started/azd-basics.md) + [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
3. **हैंड्स-ऑन प्रैक्टिस**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) पूरा करें
4. **प्रोडक्शन रेडी**: [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) की समीक्षा करें
5. **उन्नत**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat) एंटरप्राइज़ टेम्पलेट डिप्लॉय करें

### छात्रों और शुरुआती लोगों के लिए
1. [AZD Basics](docs/getting-started/azd-basics.md) से शुरू करें
2. [इंस्टॉलेशन गाइड](docs/getting-started/installation.md) का पालन करें
3. [आपका पहला प्रोजेक्ट](docs/getting-started/first-project.md) पूरा करें
4. [सिंपल वेब ऐप उदाहरण](../../examples/simple-web-app) के साथ अभ्यास करें

### डेवलपर्स के लिए
1. [कॉन्फ़िगरेशन गाइड](docs/getting-started/configuration.md) की समीक्षा करें
2. [डिप्लॉयमेंट गाइड](docs/deployment/deployment-guide.md) का अध्ययन करें
3. [डाटाबेस ऐप उदाहरण](../../examples/database-app) पर काम करें
4. [कंटेनर ऐप उदाहरण](../../examples/container-app) का अन्वेषण करें

### DevOps इंजीनियरों के लिए
1. [संसाधनों को प्रोविजन करना](docs/deployment/provisioning.md) में महारत हासिल करें
2. [प्री-फ्लाइट चेक्स](docs/pre-deployment/preflight-checks.md) लागू करें
3. [क्षमता योजना](docs/pre-deployment/capacity-planning.md) का अभ्यास करें
4. उन्नत [माइक्रोसर्विसेज उदाहरण](../../examples/microservices) पर काम करें

## डॉक्यूमेंटेशन

### शुरुआत करना
- [**AZD Basics**](docs/getting-started/azd-basics.md) - मुख्य अवधारणाएँ और शब्दावली
- [**इंस्टॉलेशन और सेटअप**](docs/getting-started/installation.md) - प्लेटफ़ॉर्म-विशिष्ट इंस्टॉलेशन गाइड्स
- [**कॉन्फ़िगरेशन**](docs/getting-started/configuration.md) - वातावरण सेटअप और ऑथेंटिकेशन
- [**आपका पहला प्रोजेक्ट**](docs/getting-started/first-project.md) - चरण-दर-चरण ट्यूटोरियल

### डिप्लॉयमेंट और प्रोविजनिंग
- [**डिप्लॉयमेंट गाइड**](docs/deployment/deployment-guide.md) - पूर्ण डिप्लॉयमेंट वर्कफ़्लो
- [**संसाधनों को प्रोविजन करना**](docs/deployment/provisioning.md) - Azure संसाधन प्रबंधन

### प्री-डिप्लॉयमेंट चेक्स
- [**क्षमता योजना**](docs/pre-deployment/capacity-planning.md) - Azure संसाधन क्षमता मान्यता
- [**SKU चयन**](docs/pre-deployment/sku-selection.md) - सही Azure SKUs का चयन
- [**प्री-फ्लाइट चेक्स**](docs/pre-deployment/preflight-checks.md) - स्वचालित मान्यता स्क्रिप्ट्स

### AI और Azure AI Foundry
- [**Azure AI Foundry एकीकरण**](docs/ai-foundry/azure-ai-foundry-integration.md) - AZD को Azure AI Foundry सेवाओं से कनेक्ट करें
- [**AI मॉडल डिप्लॉयमेंट पैटर्न्स**](docs/ai-foundry/ai-model-deployment.md) - AZD के साथ AI मॉडल्स को डिप्लॉय और प्रबंधित करें
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - हैंड्स-ऑन लैब: AI समाधानों को AZD-रेडी बनाना
- [**प्रोडक्शन AI सर्वोत्तम प्रथाएं**](docs/ai-foundry/production-ai-practices.md) - AI वर्कलोड्स के लिए सुरक्षा, स्केलिंग, और मॉनिटरिंग

### समस्या समाधान
- [**सामान्य समस्याएँ**](docs/troubleshooting/common-issues.md) - अक्सर आने वाली समस्याएँ और उनके समाधान
- [**डिबगिंग गाइड**](docs/troubleshooting/debugging.md) - चरण-दर-चरण डिबगिंग रणनीतियाँ  
- [**AI-विशिष्ट समस्या निवारण**](docs/troubleshooting/ai-troubleshooting.md) - AI सेवा और मॉडल परिनियोजन समस्याएँ  

## उदाहरण और टेम्पलेट्स  

### [विशेष: Azure AI Foundry टेम्पलेट्स](https://ai.azure.com/resource/build/templates)  
**AI एप्लिकेशन परिनियोजन शुरू करने के लिए यहाँ से शुरू करें!**  

| टेम्पलेट | विवरण | जटिलता | सेवाएँ |  
|----------|-------------|------------|----------|  
| [**AI चैट के साथ शुरुआत करें**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Azure Container Apps का उपयोग करके आपके डेटा और टेलीमेट्री इनसाइट्स के साथ एक बेसिक चैट एप्लिकेशन बनाएं और परिनियोजित करें |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |  
| [**AI एजेंट्स के साथ शुरुआत करें**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Azure Container Apps का उपयोग करके एक बेसिक एजेंट एप्लिकेशन बनाएं और परिनियोजित करें जिसमें क्रियाएँ और टेलीमेट्री इनसाइट्स शामिल हों। |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|  
| [**मल्टी-एजेंट वर्कफ़्लो ऑटोमेशन**](https://github.com/Azure-Samples/get-started-with-ai-chat) | AI एजेंट्स के समूह को व्यवस्थित और प्रबंधित करके कार्य योजना और ऑटोमेशन को बढ़ाएं।|⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**अपने डेटा से दस्तावेज़ बनाएं**](https://github.com/Azure-Samples/get-started-with-ai-chat) | आपके डेटा से प्रासंगिक जानकारी खोजने और सारांशित करके अनुबंध, चालान और निवेश प्रस्ताव जैसे दस्तावेज़ों को तेजी से उत्पन्न करें। |⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|  
| [**क्लाइंट मीटिंग्स को एजेंट्स के साथ बेहतर बनाएं**](https://github.com/Azure-Samples/get-started-with-ai-chat) | एजेंट्स की टीम का उपयोग करके पुराने कोड को आधुनिक भाषाओं में स्थानांतरित करें। |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |  
| [**अपने कोड को एजेंट्स के साथ आधुनिक बनाएं**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Azure Container Apps का उपयोग करके आपके डेटा और टेलीमेट्री इनसाइट्स के साथ एक बेसिक चैट एप्लिकेशन बनाएं और परिनियोजित करें। |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**अपना संवादात्मक एजेंट बनाएं**](https://github.com/Azure-Samples/get-started-with-ai-chat) | उन्नत संवादात्मक समझ का उपयोग करके चैटबॉट्स और एजेंट्स को निर्धारित और मानव-नियंत्रित वर्कफ़्लो के साथ बनाएं और बढ़ाएं। |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|  
| [**संवादात्मक डेटा से इनसाइट्स अनलॉक करें**](https://github.com/Azure-Samples/get-started-with-ai-chat) | बड़े ऑडियो और टेक्स्ट-आधारित डेटा सेट्स से इनसाइट्स प्राप्त करके संपर्क केंद्र की दक्षता में सुधार करें। |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|  
| [**मल्टी-मोडल सामग्री प्रसंस्करण**](https://github.com/Azure-Samples/get-started-with-ai-chat) | असंरचित सामग्री से जानकारी निकालकर और इसे संरचित प्रारूप में मैप करके दावों, चालानों, अनुबंधों और अन्य दस्तावेज़ों को तेजी और सटीकता से संसाधित करें। यह टेम्पलेट टेक्स्ट, छवियों, तालिकाओं और ग्राफ़ का समर्थन करता है। |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|  

### विशेष: Azure AI Foundry E2E परिदृश्य  
**AI एप्लिकेशन परिनियोजित करने के लिए यहाँ से शुरू करें!**  

| टेम्पलेट | विवरण | जटिलता | सेवाएँ |  
|----------|-------------|------------|----------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Azure OpenAI के साथ सरल चैट इंटरफ़ेस | ⭐ | AzureOpenAI + Container Apps |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-सक्षम चैट ऐप Azure OpenAI के साथ | ⭐⭐ | AzureOpenAI + Search + App Service |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | AI सेवाओं के साथ दस्तावेज़ विश्लेषण | ⭐⭐ | Azure Document Intelligence + Functions |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | फ़ंक्शन कॉलिंग के साथ AI एजेंट फ्रेमवर्क | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | AI ऑर्केस्ट्रेशन के साथ एंटरप्राइज़ चैट | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |  

### अतिरिक्त AZD टेम्पलेट्स  
- [**उदाहरण निर्देशिका**](examples/README.md) - व्यावहारिक उदाहरण, टेम्पलेट्स, और वास्तविक दुनिया के परिदृश्य  
- [**Azure-Samples AZD टेम्पलेट्स**](https://github.com/Azure-Samples/azd-templates) - आधिकारिक Microsoft नमूना टेम्पलेट्स  
- [**Awesome AZD गैलरी**](https://azure.github.io/awesome-azd/) - समुदाय द्वारा योगदान किए गए टेम्पलेट्स  

### हैंड्स-ऑन लैब्स और वर्कशॉप्स  
- [**AI वर्कशॉप लैब**](docs/ai-foundry/ai-workshop-lab.md) - **नया**: अपने AI समाधान AZD-परिनियोज्य बनाएं  
- [**AZD फॉर बिगिनर्स वर्कशॉप**](workshop/README.md) - AI एजेंट्स AZD टेम्पलेट परिनियोजन पर ध्यान केंद्रित करें  

## संसाधन  

### त्वरित संदर्भ  
- [**कमांड चीट शीट**](resources/cheat-sheet.md) - आवश्यक azd कमांड्स  
- [**शब्दावली**](resources/glossary.md) - Azure और azd शब्दावली  
- [**FAQ**](resources/faq.md) - अक्सर पूछे जाने वाले प्रश्न  
- [**अध्ययन गाइड**](resources/study-guide.md) - व्यापक सीखने के उद्देश्य और अभ्यास अभ्यास  

### बाहरी संसाधन  
- [Azure Developer CLI दस्तावेज़ीकरण](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure आर्किटेक्चर केंद्र](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure मूल्य निर्धारण कैलकुलेटर](https://azure.microsoft.com/pricing/calculator/)  
- [Azure स्थिति](https://status.azure.com/)  

## योगदान  

हम योगदान का स्वागत करते हैं! कृपया हमारे [योगदान गाइड](CONTRIBUTING.md) को पढ़ें:  
- मुद्दे और फीचर अनुरोध कैसे सबमिट करें  
- कोड योगदान दिशानिर्देश  
- दस्तावेज़ सुधार  
- सामुदायिक मानक  

## समर्थन  

- **मुद्दे**: [बग रिपोर्ट करें और फीचर अनुरोध करें](https://github.com/microsoft/azd-for-beginners/issues)  
- **चर्चाएँ**: [Microsoft Azure Discord समुदाय Q&A और चर्चाएँ](https://discord.gg/microsoft-azure)  
- **AI-विशिष्ट समर्थन**: AZD + AI Foundry चर्चाओं के लिए [#Azure चैनल](https://discord.gg/microsoft-azure) में शामिल हों  
- **ईमेल**: निजी पूछताछ के लिए  
- **Microsoft Learn**: [आधिकारिक Azure Developer CLI दस्तावेज़ीकरण](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Azure AI Foundry Discord से सामुदायिक इनसाइट्स  

**#Azure चैनल से पोल परिणाम:**  
- **45%** डेवलपर्स AZD का उपयोग AI वर्कलोड्स के लिए करना चाहते हैं  
- **शीर्ष चुनौतियाँ**: मल्टी-सेवा परिनियोजन, क्रेडेंशियल प्रबंधन, उत्पादन तैयारी  
- **सबसे अधिक अनुरोधित**: AI-विशिष्ट टेम्पलेट्स, समस्या निवारण गाइड्स, सर्वोत्तम प्रथाएँ  

**हमारे समुदाय में शामिल हों:**  
- अपने AZD + AI अनुभव साझा करें और मदद प्राप्त करें  
- नए AI टेम्पलेट्स के शुरुआती पूर्वावलोकन तक पहुँचें  
- AI परिनियोजन सर्वोत्तम प्रथाओं में योगदान करें  
- भविष्य के AI + AZD फीचर विकास को प्रभावित करें  

## लाइसेंस  

यह प्रोजेक्ट MIT लाइसेंस के तहत लाइसेंस प्राप्त है - विवरण के लिए [LICENSE](../../LICENSE) फ़ाइल देखें।  

## अन्य पाठ्यक्रम  

हमारी टीम अन्य पाठ्यक्रम भी बनाती है! देखें:  

- [**नया** मॉडल संदर्भ प्रोटोकॉल (MCP) फॉर बिगिनर्स](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI एजेंट्स फॉर बिगिनर्स](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI फॉर बिगिनर्स using .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generative AI फॉर बिगिनर्स](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI फॉर बिगिनर्स using Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML फॉर बिगिनर्स](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [डेटा साइंस फॉर बिगिनर्स](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI फॉर बिगिनर्स](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [साइबर सुरक्षा फॉर बिगिनर्स](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [वेब डेवलपमेंट फॉर बिगिनर्स](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [IoT फॉर बिगिनर्स](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [XR डेवलपमेंट फॉर बिगिनर्स](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [GitHub Copilot के साथ AI पेयर्ड प्रोग्रामिंग में महारत हासिल करें](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [GitHub Copilot के साथ C#/.NET डेवलपर्स के लिए महारत हासिल करें](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [अपना खुद का Copilot एडवेंचर चुनें](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**नेविगेशन**  
- **अगला पाठ**: [AZD बेसिक्स](docs/getting-started/azd-basics.md)  

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।