<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6c3d0f9ef66c2cd692a55a2811d9c3e5",
  "translation_date": "2025-09-15T15:02:01+00:00",
  "source_file": "README.md",
  "language_code": "mr"
}
-->
# AZD नवशिक्यांसाठी

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.mr.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

या संसाधनांचा वापर सुरू करण्यासाठी खालील चरणांचे अनुसरण करा:
1. **रेपॉझिटरी फॉर्क करा**: क्लिक करा [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **रेपॉझिटरी क्लोन करा**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Azure Discord समुदायामध्ये सामील व्हा आणि तज्ञ व इतर विकसकांशी संवाद साधा**](https://discord.com/invite/ByRwuEEgH4)

### बहुभाषिक समर्थन

#### GitHub Action द्वारे समर्थित (स्वयंचलित आणि नेहमी अद्ययावत)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](./README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**जर तुम्हाला अतिरिक्त भाषांमध्ये भाषांतर हवे असेल तर समर्थित भाषांची यादी [येथे](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md) उपलब्ध आहे**

## परिचय

Azure Developer CLI (azd) साठी व्यापक मार्गदर्शकात आपले स्वागत आहे. हे रेपॉझिटरी विद्यार्थ्यांपासून व्यावसायिक विकसकांपर्यंत सर्व स्तरांवरील विकसकांना Azure Developer CLI शिकण्यासाठी आणि क्लाउड डिप्लॉयमेंटसाठी कार्यक्षमतेने मास्टर करण्यासाठी डिझाइन केले आहे, **विशेषतः Azure AI Foundry वापरून AI अनुप्रयोग डिप्लॉयमेंटवर लक्ष केंद्रित करून**. हे संरचित शिक्षण संसाधन Azure क्लाउड डिप्लॉयमेंट, सामान्य समस्यांचे निराकरण, आणि यशस्वी AZD टेम्पलेट डिप्लॉयमेंटसाठी सर्वोत्तम पद्धती अंमलात आणण्यासाठी व्यावहारिक अनुभव प्रदान करते.

### **AI विकसकांसाठी हे मार्गदर्शक का महत्त्वाचे आहे**
आमच्या अलीकडील Azure AI Foundry Discord समुदाय सर्वेक्षणानुसार, **45% विकसक AZD AI वर्कलोडसाठी वापरण्यास इच्छुक आहेत** परंतु खालील आव्हानांना सामोरे जात आहेत:
- जटिल मल्टी-सर्व्हिस AI आर्किटेक्चर
- उत्पादन AI डिप्लॉयमेंटसाठी सर्वोत्तम पद्धती
- Azure AI सेवा एकत्रीकरण आणि कॉन्फिगरेशन
- AI वर्कलोडसाठी खर्चाचा ऑप्टिमायझेशन
- AI-विशिष्ट डिप्लॉयमेंट समस्यांचे निराकरण

## शिक्षण उद्दिष्टे

या रेपॉझिटरीवर काम करून, तुम्ही:
- Azure Developer CLI मूलभूत गोष्टी आणि मुख्य संकल्पना आत्मसात करा
- Infrastructure as Code वापरून Azure संसाधने डिप्लॉय आणि प्रोव्हिजन करणे शिका
- सामान्य AZD डिप्लॉयमेंट समस्यांचे निराकरण करण्याचे कौशल्य विकसित करा
- पूर्व-डिप्लॉयमेंट व्हॅलिडेशन आणि क्षमता नियोजन समजून घ्या
- सुरक्षा सर्वोत्तम पद्धती आणि खर्च ऑप्टिमायझेशन धोरणे अंमलात आणा
- उत्पादन-तयार अनुप्रयोग Azure वर डिप्लॉय करण्याचा आत्मविश्वास निर्माण करा

## शिक्षण परिणाम

हा कोर्स पूर्ण केल्यानंतर, तुम्ही:
- Azure Developer CLI यशस्वीरित्या स्थापित, कॉन्फिगर आणि वापरू शकता
- AZD टेम्पलेट्स वापरून अनुप्रयोग तयार आणि डिप्लॉय करू शकता
- प्रमाणीकरण, इन्फ्रास्ट्रक्चर आणि डिप्लॉयमेंट समस्यांचे निराकरण करू शकता
- पूर्व-डिप्लॉयमेंट तपासणीसह क्षमता नियोजन आणि SKU निवड करू शकता
- मॉनिटरिंग, सुरक्षा आणि खर्च व्यवस्थापन सर्वोत्तम पद्धती अंमलात आणू शकता
- CI/CD पाइपलाइनमध्ये AZD वर्कफ्लो एकत्र करू शकता

## विषय सूची

- [Azure Developer CLI म्हणजे काय?](../..)
- [जलद प्रारंभ](../..)
- [शिक्षण मार्ग](../..)
  - [AI विकसकांसाठी (इथून सुरुवात करा!)](../..)
  - [विद्यार्थी आणि नवशिक्यांसाठी](../..)
  - [विकसकांसाठी](../..)
  - [DevOps अभियंत्यांसाठी](../..)
- [दस्तऐवजीकरण](../..)
  - [सुरुवात](../..)
  - [डिप्लॉयमेंट आणि प्रोव्हिजनिंग](../..)
  - [पूर्व-डिप्लॉयमेंट तपासणी](../..)
  - [AI आणि Azure AI Foundry](../..)
  - [समस्यांचे निराकरण](../..)
- [उदाहरणे आणि टेम्पलेट्स](../..)
  - [वैशिष्ट्यीकृत: Azure AI Foundry टेम्पलेट्स](../..)
  - [वैशिष्ट्यीकृत: Azure AI Foundry E2E परिस्थिती](../..)
  - [अतिरिक्त AZD टेम्पलेट्स](../..)
  - [व्यावहारिक प्रयोगशाळा आणि कार्यशाळा](../..)
- [संसाधने](../..)
- [योगदान](../..)
- [समर्थन](../..)
- [समुदाय](../..)

## Azure Developer CLI म्हणजे काय?

Azure Developer CLI (azd) हे एक विकसक-केंद्रित कमांड-लाइन इंटरफेस आहे जे Azure वर अनुप्रयोग तयार आणि डिप्लॉय करण्याची प्रक्रिया वेगवान करते. हे प्रदान करते:

- **टेम्पलेट-आधारित डिप्लॉयमेंट्स** - सामान्य अनुप्रयोग पॅटर्नसाठी पूर्व-निर्मित टेम्पलेट्स वापरा
- **Infrastructure as Code** - Bicep किंवा Terraform वापरून Azure संसाधने व्यवस्थापित करा
- **एकत्रित वर्कफ्लो** - अनुप्रयोग प्रोव्हिजन, डिप्लॉय आणि मॉनिटर करण्यासाठी सहजतेने कार्य करा
- **विकसक-अनुकूल** - विकसक उत्पादकता आणि अनुभवासाठी अनुकूलित

### **AZD + Azure AI Foundry: AI डिप्लॉयमेंटसाठी उत्तम**

**AI सोल्यूशन्ससाठी AZD का?** AZD AI विकसकांना भेडसावणाऱ्या प्रमुख आव्हानांना सोडवते:

- **AI-तयार टेम्पलेट्स** - Azure OpenAI, Cognitive Services, आणि ML वर्कलोडसाठी पूर्व-कॉन्फिगर केलेले टेम्पलेट्स
- **सुरक्षित AI डिप्लॉयमेंट्स** - AI सेवा, API कीज, आणि मॉडेल एंडपॉइंट्ससाठी अंगभूत सुरक्षा पॅटर्न
- **उत्पादन AI पॅटर्न्स** - स्केलेबल, खर्च-प्रभावी AI अनुप्रयोग डिप्लॉयमेंटसाठी सर्वोत्तम पद्धती
- **एंड-टू-एंड AI वर्कफ्लो** - मॉडेल विकासापासून उत्पादन डिप्लॉयमेंटपर्यंत योग्य मॉनिटरिंगसह
- **खर्च ऑप्टिमायझेशन** - AI वर्कलोडसाठी स्मार्ट संसाधन वाटप आणि स्केलिंग धोरणे
- **Azure AI Foundry एकत्रीकरण** - AI Foundry मॉडेल कॅटलॉग आणि एंडपॉइंट्सशी सहज कनेक्शन

## जलद प्रारंभ

### पूर्व-आवश्यकता
- Azure सदस्यता
- Azure CLI स्थापित
- Git (टेम्पलेट्स क्लोन करण्यासाठी)

### स्थापना
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### तुमचा पहिला डिप्लॉयमेंट
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

### तुमचा पहिला AI डिप्लॉयमेंट
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

## शिक्षण मार्ग

### AI विकसकांसाठी (इथून सुरुवात करा!)
1. **जलद प्रारंभ**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) टेम्पलेट वापरून पहा
2. **मूलभूत गोष्टी शिका**: [AZD Basics](docs/getting-started/azd-basics.md) + [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
3. **व्यावहारिक सराव**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) पूर्ण करा
4. **उत्पादन तयार**: [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) पुनरावलोकन करा
5. **प्रगत**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat) एंटरप्राइझ टेम्पलेट डिप्लॉय करा

### विद्यार्थ्यांसाठी आणि नवशिक्यांसाठी
1. [AZD Basics](docs/getting-started/azd-basics.md) पासून सुरुवात करा
2. [स्थापना मार्गदर्शक](docs/getting-started/installation.md) अनुसरण करा
3. [तुमचा पहिला प्रकल्प](docs/getting-started/first-project.md) पूर्ण करा
4. [साध्या वेब अॅप उदाहरण](../../examples/simple-web-app) सह सराव करा

### विकसकांसाठी
1. [कॉन्फिगरेशन मार्गदर्शक](docs/getting-started/configuration.md) पुनरावलोकन करा
2. [डिप्लॉयमेंट मार्गदर्शक](docs/deployment/deployment-guide.md) अभ्यास करा
3. [डेटाबेस अॅप उदाहरण](../../examples/database-app) पूर्ण करा
4. [कंटेनर अॅप उदाहरण](../../examples/container-app) एक्सप्लोर करा

### DevOps अभियंत्यांसाठी
1. [संसाधने प्रोव्हिजन करणे](docs/deployment/provisioning.md) मास्टर करा
2. [पूर्व-उड्डाण तपासणी](docs/pre-deployment/preflight-checks.md) अंमलात आणा
3. [क्षमता नियोजन](docs/pre-deployment/capacity-planning.md) सराव करा
4. प्रगत [मायक्रोसर्व्हिसेस उदाहरण](../../examples/microservices) वापरा

## दस्तऐवजीकरण

### सुरुवात
- [**AZD Basics**](docs/getting-started/azd-basics.md) - मुख्य संकल्पना आणि शब्दावली
- [**स्थापना आणि सेटअप**](docs/getting-started/installation.md) - प्लॅटफॉर्म-विशिष्ट स्थापना मार्गदर्शक
- [**कॉन्फिगरेशन**](docs/getting-started/configuration.md) - वातावरण सेटअप आणि प्रमाणीकरण
- [**तुमचा पहिला प्रकल्प**](docs/getting-started/first-project.md) - चरण-दर-चरण ट्यूटोरियल

### डिप्लॉयमेंट आणि प्रोव्हिजनिंग
- [**डिप्लॉयमेंट मार्गदर्शक**](docs/deployment/deployment-guide.md) - संपूर्ण डिप्लॉयमेंट वर्कफ्लो
- [**संसाधने प्रोव्हिजन करणे**](docs/deployment/provisioning.md) - Azure संसाधन व्यवस्थापन

### पूर्व-डिप्लॉयमेंट तपासणी
- [**क्षमता नियोजन**](docs/pre-deployment/capacity-planning.md) - Azure संसाधन क्षमता सत्यापन
- [**SKU निवड**](docs/pre-deployment/sku-selection.md) - योग्य Azure SKUs निवडणे
- [**पूर्व-उड्डाण तपासणी**](docs/pre-deployment/preflight-checks.md) - स्वयंचलित सत्यापन स्क्रिप्ट

### AI आणि Azure AI Foundry
- [**Azure AI Foundry एकत्रीकरण**](docs/ai-foundry/azure-ai-foundry-integration.md) - AZD ला Azure AI Foundry सेवांशी कनेक्ट करा
- [**AI मॉडेल डिप्लॉयमेंट पॅटर्न्स**](docs/ai-foundry/ai-model-deployment.md) - AZD सह AI मॉडेल्स डिप्लॉय आणि व्यवस्थापित करा
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - व्यावहारिक प्रयोगशाळा: AI सोल्यूशन्स AZD-तयार बनवणे
- [**उत्पादन AI सर्वोत्तम पद्धती**](docs/ai-foundry/production-ai-practices.md) - AI वर्कलोडसाठी सुरक्षा, स्केलिंग, आणि मॉनिटरिंग

### समस्यांचे निराकरण
- [**सामान्य समस्या**](docs/troubleshooting/common-issues.md) - वारंवार येणाऱ्या समस्यांचे निराकरण आणि उपाय
- [**डिबगिंग मार्गदर्शक**](docs/troubleshooting/debugging.md) - टप्प्याटप्प्याने डिबगिंग करण्याच्या रणनीती
- [**AI-संबंधित समस्या निवारण**](docs/troubleshooting/ai-troubleshooting.md) - AI सेवा आणि मॉडेल डिप्लॉयमेंटमधील समस्या

## उदाहरणे आणि टेम्पलेट्स

### [वैशिष्ट्यीकृत: Azure AI Foundry टेम्पलेट्स](https://ai.azure.com/resource/build/templates)
**AI अ‍ॅप्लिकेशन्स डिप्लॉय करत असाल तर इथून सुरुवात करा!**

| टेम्पलेट | वर्णन | गुंतागुंत | सेवा |
|----------|-------------|------------|----------|
| [**AI चॅटसह सुरुवात करा**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Azure Container Apps वापरून तुमच्या डेटा आणि टेलीमेट्री इनसाइट्ससह एक मूलभूत चॅट अ‍ॅप्लिकेशन तयार करा आणि डिप्लॉय करा |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**AI एजंटसह सुरुवात करा**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Azure Container Apps वापरून क्रिया आणि टेलीमेट्री इनसाइट्ससह एक मूलभूत एजंट अ‍ॅप्लिकेशन तयार करा आणि डिप्लॉय करा. |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**मल्टी-एजंट वर्कफ्लो ऑटोमेशन**](https://github.com/Azure-Samples/get-started-with-ai-chat) | AI एजंट्सच्या गटाचे व्यवस्थापन आणि समन्वय करून कार्य नियोजन आणि ऑटोमेशन सुधारित करा.|⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**तुमच्या डेटामधून दस्तऐवज तयार करा**](https://github.com/Azure-Samples/get-started-with-ai-chat) | तुमच्या डेटामधून संबंधित माहिती शोधून आणि संक्षेप करून करार, इनव्हॉइस आणि गुंतवणूक प्रस्तावांसारखे दस्तऐवज तयार करण्याची प्रक्रिया वेगवान करा. |⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**क्लायंट मीटिंग्स एजंट्ससह सुधारित करा**](https://github.com/Azure-Samples/get-started-with-ai-chat) | एजंट्सच्या टीमचा उपयोग करून जुना कोड आधुनिक भाषांमध्ये स्थलांतरित करा. |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**तुमचा कोड एजंट्ससह आधुनिक करा**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Azure Container Apps वापरून तुमच्या डेटा आणि टेलीमेट्री इनसाइट्ससह एक मूलभूत चॅट अ‍ॅप्लिकेशन तयार करा आणि डिप्लॉय करा |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**तुमचा संवादात्मक एजंट तयार करा**](https://github.com/Azure-Samples/get-started-with-ai-chat) | प्रगत संवादात्मक समज वापरून निश्चित आणि मानवी-नियंत्रित वर्कफ्लो असलेल्या चॅटबॉट्स आणि एजंट्स तयार करा आणि सुधारित करा. |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**संवादात्मक डेटामधून इनसाइट्स अनलॉक करा**](https://github.com/Azure-Samples/get-started-with-ai-chat) | प्रगत सामग्री समज क्षमतांचा उपयोग करून मोठ्या ऑडिओ आणि टेक्स्ट-आधारित डेटासेट्समधून इनसाइट्स शोधून संपर्क केंद्राची कार्यक्षमता सुधारित करा. |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**मल्टी-मोडल सामग्री प्रक्रिया**](https://github.com/Azure-Samples/get-started-with-ai-chat) | असंरचित सामग्रीमधून माहिती काढून आणि ती संरचित स्वरूपात मॅप करून दावे, इनव्हॉइस, करार आणि इतर दस्तऐवज जलद आणि अचूकपणे प्रक्रिया करा. हा टेम्पलेट टेक्स्ट, प्रतिमा, टेबल्स आणि ग्राफ्सला समर्थन देतो. |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### वैशिष्ट्यीकृत: Azure AI Foundry E2E परिस्थिती
**AI अ‍ॅप्लिकेशन्स डिप्लॉय करत असाल तर इथून सुरुवात करा!**

| टेम्पलेट | वर्णन | गुंतागुंत | सेवा |
|----------|-------------|------------|----------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Azure OpenAI सह साधा चॅट इंटरफेस | ⭐ | AzureOpenAI + Container Apps |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-सक्षम चॅट अ‍ॅप Azure OpenAI सह | ⭐⭐ | AzureOpenAI + Search + App Service |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | AI सेवांसह दस्तऐवज विश्लेषण | ⭐⭐ | Azure Document Intelligence + Functions |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | फंक्शन कॉलिंगसह AI एजंट फ्रेमवर्क | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | AI ऑर्केस्ट्रेशनसह एंटरप्राइझ चॅट | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |

### अतिरिक्त AZD टेम्पलेट्स
- [**उदाहरणे डिरेक्टरी**](examples/README.md) - व्यावहारिक उदाहरणे, टेम्पलेट्स आणि वास्तविक परिस्थिती
- [**Azure-Samples AZD टेम्पलेट्स**](https://github.com/Azure-Samples/azd-templates) - Microsoft चे अधिकृत नमुना टेम्पलेट्स  
- [**Awesome AZD गॅलरी**](https://azure.github.io/awesome-azd/) - समुदायाद्वारे योगदान दिलेले टेम्पलेट्स

### हँड्स-ऑन लॅब्स आणि कार्यशाळा
- [**AI कार्यशाळा लॅब**](docs/ai-foundry/ai-workshop-lab.md) - **नवीन**: तुमचे AI सोल्यूशन्स AZD-डिप्लॉय करण्यायोग्य बनवा
- [**AZD सुरुवातीसाठी कार्यशाळा**](workshop/README.md) - AI एजंट्स AZD टेम्पलेट डिप्लॉयमेंटवर लक्ष केंद्रित करा

## संसाधने

### जलद संदर्भ
- [**कमांड चीट शीट**](resources/cheat-sheet.md) - आवश्यक azd कमांड्स
- [**शब्दकोश**](resources/glossary.md) - Azure आणि azd शब्दावली
- [**FAQ**](resources/faq.md) - वारंवार विचारले जाणारे प्रश्न
- [**अभ्यास मार्गदर्शक**](resources/study-guide.md) - सर्वसमावेशक शिक्षण उद्दिष्टे आणि सराव व्यायाम

### बाह्य संसाधने
- [Azure Developer CLI दस्तऐवज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर केंद्र](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure किंमत कॅल्क्युलेटर](https://azure.microsoft.com/pricing/calculator/)
- [Azure स्थिती](https://status.azure.com/)

## योगदान

आम्ही योगदानांचे स्वागत करतो! कृपया आमचे [योगदान मार्गदर्शक](CONTRIBUTING.md) वाचा:
- समस्या आणि वैशिष्ट्य विनंत्या कशा सादर करायच्या
- कोड योगदान मार्गदर्शक तत्त्वे
- दस्तऐवज सुधारणा
- समुदाय मानके

## समर्थन

- **समस्या**: [बग्स रिपोर्ट करा आणि वैशिष्ट्य विनंत्या करा](https://github.com/microsoft/azd-for-beginners/issues)
- **चर्चा**: [Microsoft Azure Discord समुदाय Q&A आणि चर्चा](https://discord.gg/microsoft-azure)
- **AI-संबंधित समर्थन**: AZD + AI Foundry चर्चेसाठी [#Azure चॅनेल](https://discord.gg/microsoft-azure) मध्ये सामील व्हा
- **ईमेल**: खाजगी चौकशीसाठी
- **Microsoft Learn**: [अधिकृत Azure Developer CLI दस्तऐवज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Azure AI Foundry Discord मधील समुदाय अंतर्दृष्टी

**#Azure चॅनेलमधील मतदानाचे निकाल:**
- **45%** विकसक AZD AI वर्कलोडसाठी वापरू इच्छित आहेत
- **मुख्य आव्हाने**: मल्टी-सर्व्हिस डिप्लॉयमेंट्स, क्रेडेन्शियल व्यवस्थापन, उत्पादन तयारी
- **सर्वाधिक विनंती केलेले**: AI-संबंधित टेम्पलेट्स, समस्या निवारण मार्गदर्शक, सर्वोत्तम पद्धती

**आमच्या समुदायात सामील व्हा:**
- तुमचे AZD + AI अनुभव शेअर करा आणि मदत मिळवा
- नवीन AI टेम्पलेट्सचे प्रारंभिक प्रिव्ह्यू एक्सेस करा
- AI डिप्लॉयमेंट सर्वोत्तम पद्धतींमध्ये योगदान द्या
- भविष्यातील AI + AZD वैशिष्ट्य विकासावर प्रभाव टाका

## परवाना

हा प्रकल्प MIT परवान्याखाली परवानाधारक आहे - तपशीलांसाठी [LICENSE](../../LICENSE) फाइल पहा.

## इतर अभ्यासक्रम

आमची टीम इतर अभ्यासक्रम तयार करते! तपासा:

- [**नवीन** मॉडेल कॉन्टेक्स्ट प्रोटोकॉल (MCP) सुरुवातीसाठी](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI एजंट्स सुरुवातीसाठी](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI सुरुवातीसाठी .NET वापरून](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generative AI सुरुवातीसाठी](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI सुरुवातीसाठी Java वापरून](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML सुरुवातीसाठी](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [डेटा सायन्स सुरुवातीसाठी](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI सुरुवातीसाठी](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [सायबरसुरक्षा सुरुवातीसाठी](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [वेब डेव्ह सुरुवातीसाठी](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT सुरुवातीसाठी](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR विकास सुरुवातीसाठी](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot AI सह प्रोग्रामिंगमध्ये प्रभुत्व मिळवा](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot C#/.NET विकसकांसाठी प्रभुत्व मिळवा](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [तुमचा स्वतःचा Copilot साहस निवडा](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**नेव्हिगेशन**
- **पुढील धडा**: [AZD मूलभूत गोष्टी](docs/getting-started/azd-basics.md)

---

**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी कृपया लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेचा अभाव असू शकतो. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.