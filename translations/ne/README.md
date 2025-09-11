<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c0984265b7a9357388f864c19606c80d",
  "translation_date": "2025-09-11T09:56:38+00:00",
  "source_file": "README.md",
  "language_code": "ne"
}
-->
# AZD सुरुवातका लागि

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.ne.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

यी स्रोतहरू प्रयोग गर्न सुरु गर्नका लागि निम्न चरणहरू पालना गर्नुहोस्:
1. **रिपोजिटरीलाई Fork गर्नुहोस्**: क्लिक गर्नुहोस् [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **रिपोजिटरीलाई Clone गर्नुहोस्**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Azure Discord समुदायमा सामेल हुनुहोस् र विशेषज्ञहरू तथा अन्य विकासकर्तासँग भेट्नुहोस्**](https://discord.com/invite/ByRwuEEgH4)

### 🌐 बहुभाषी समर्थन

#### GitHub Action मार्फत समर्थित (स्वचालित र सधैं अद्यावधिक)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](./README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**यदि तपाईंले थप भाषाहरूको अनुवाद चाहनुहुन्छ भने यहाँ सूचीबद्ध छन् [यहाँ](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## परिचय

Azure Developer CLI (azd) को विस्तृत मार्गदर्शनमा स्वागत छ। यो रिपोजिटरी विद्यार्थीदेखि पेशेवर विकासकर्तासम्मका लागि Azure Developer CLI सिक्न र क्लाउड डिप्लोयमेन्टलाई प्रभावकारी बनाउन मद्दत गर्न डिजाइन गरिएको छ। यो संरचित सिकाइ स्रोतले Azure क्लाउड डिप्लोयमेन्ट, सामान्य समस्याहरू समाधान गर्ने, र सफल AZD टेम्प्लेट डिप्लोयमेन्टका लागि उत्कृष्ट अभ्यासहरू कार्यान्वयन गर्ने व्यावहारिक अनुभव प्रदान गर्दछ।

## सिकाइ लक्ष्यहरू

यस रिपोजिटरीमा काम गरेर, तपाईं:
- Azure Developer CLI को आधारभूत र मुख्य अवधारणाहरूमा महारत हासिल गर्नुहुनेछ
- Infrastructure as Code प्रयोग गरेर Azure स्रोतहरू डिप्लोय र प्रोभिजन गर्न सिक्नुहुनेछ
- सामान्य AZD डिप्लोयमेन्ट समस्याहरू समाधान गर्ने सीप विकास गर्नुहुनेछ
- पूर्व-डिप्लोयमेन्ट मान्यता र क्षमता योजना बुझ्नुहुनेछ
- सुरक्षा उत्कृष्ट अभ्यासहरू र लागत अनुकूलन रणनीतिहरू कार्यान्वयन गर्नुहुनेछ
- Azure मा उत्पादन-तयार एप्लिकेसनहरू डिप्लोय गर्न आत्मविश्वास निर्माण गर्नुहुनेछ

## सिकाइ परिणामहरू

यो कोर्स पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- Azure Developer CLI सफलतापूर्वक स्थापना, कन्फिगर, र प्रयोग गर्न
- AZD टेम्प्लेटहरू प्रयोग गरेर एप्लिकेसनहरू सिर्जना र डिप्लोय गर्न
- प्रमाणीकरण, पूर्वाधार, र डिप्लोयमेन्ट समस्याहरू समाधान गर्न
- पूर्व-डिप्लोयमेन्ट जाँचहरू जस्तै क्षमता योजना र SKU चयन गर्न
- निगरानी, सुरक्षा, र लागत व्यवस्थापन उत्कृष्ट अभ्यासहरू कार्यान्वयन गर्न
- AZD वर्कफ्लोहरू CI/CD पाइपलाइनहरूमा एकीकृत गर्न

## सामग्री तालिका

- [Azure Developer CLI के हो?](../..)
- [छिटो सुरु](../..)
- [डकुमेन्टेशन](../..)
- [उदाहरणहरू र टेम्प्लेटहरू](../..)
- [स्रोतहरू](../..)
- [योगदान](../..)

## Azure Developer CLI के हो?

Azure Developer CLI (azd) एक विकासकर्ता-केंद्रित कमाण्ड-लाइन इन्टरफेस हो जसले Azure मा एप्लिकेसनहरू निर्माण र डिप्लोय गर्ने प्रक्रियालाई तीव्र बनाउँछ। यसले प्रदान गर्दछ:

- **टेम्प्लेट-आधारित डिप्लोयमेन्टहरू** - सामान्य एप्लिकेसन ढाँचाहरूका लागि पूर्व-निर्मित टेम्प्लेटहरू प्रयोग गर्नुहोस्
- **Infrastructure as Code** - Bicep वा Terraform प्रयोग गरेर Azure स्रोतहरू व्यवस्थापन गर्नुहोस्
- **एकीकृत वर्कफ्लोहरू** - एप्लिकेसनहरू प्रोभिजन, डिप्लोय, र निगरानी गर्न सहजता प्रदान गर्नुहोस्
- **विकासकर्ता-अनुकूल** - विकासकर्ता उत्पादकता र अनुभवका लागि अनुकूलित

## छिटो सुरु

### आवश्यकताहरू
- Azure सदस्यता
- Azure CLI स्थापना गरिएको
- Git (टेम्प्लेटहरू क्लोन गर्न)

### स्थापना
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### तपाईंको पहिलो डिप्लोयमेन्ट
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

## डकुमेन्टेशन

### सुरु गर्दै
- [**AZD आधारभूतहरू**](docs/getting-started/azd-basics.md) - मुख्य अवधारणाहरू र शब्दावली
- [**स्थापना र सेटअप**](docs/getting-started/installation.md) - प्लेटफर्म-विशिष्ट स्थापना मार्गदर्शन
- [**कन्फिगरेसन**](docs/getting-started/configuration.md) - वातावरण सेटअप र प्रमाणीकरण
- [**तपाईंको पहिलो प्रोजेक्ट**](docs/getting-started/first-project.md) - चरण-दर-चरण ट्युटोरियल

### डिप्लोयमेन्ट र प्रोभिजनिङ
- [**डिप्लोयमेन्ट मार्गदर्शन**](docs/deployment/deployment-guide.md) - पूर्ण डिप्लोयमेन्ट वर्कफ्लोहरू
- [**स्रोतहरू प्रोभिजनिङ**](docs/deployment/provisioning.md) - Azure स्रोत व्यवस्थापन

### पूर्व-डिप्लोयमेन्ट जाँचहरू
- [**क्षमता योजना**](docs/pre-deployment/capacity-planning.md) - Azure स्रोत क्षमता मान्यता
- [**SKU चयन**](docs/pre-deployment/sku-selection.md) - सही Azure SKUs चयन गर्ने
- [**पूर्व-उडान जाँचहरू**](docs/pre-deployment/preflight-checks.md) - स्वचालित मान्यता स्क्रिप्टहरू

### समस्या समाधान
- [**सामान्य समस्याहरू**](docs/troubleshooting/common-issues.md) - बारम्बार सामना गरिएका समस्याहरू र समाधानहरू
- [**डिबगिङ मार्गदर्शन**](docs/troubleshooting/debugging.md) - चरण-दर-चरण डिबगिङ रणनीतिहरू

## उदाहरणहरू र टेम्प्लेटहरू
- [**उदाहरणहरू**]([examples/README.md) - व्यावहारिक उदाहरणहरू, टेम्प्लेटहरू, र वास्तविक संसारका परिदृश्यहरू जसले तपाईंलाई Azure Developer CLI सिक्न व्यावहारिक अभ्यास प्रदान गर्दछ। प्रत्येक उदाहरणले पूर्ण कार्यरत कोड, पूर्वाधार टेम्प्लेटहरू, र विभिन्न एप्लिकेसन आर्किटेक्चरहरू र डिप्लोयमेन्ट ढाँचाहरूका लागि विस्तृत निर्देशनहरू प्रदान गर्दछ।

### व्यावहारिक प्रयोगशाला/कार्यशाला
- [**AZD सुरुवातका लागि**](workshop/README.md) - यो कार्यशालाले AI एजेन्टहरू AZD टेम्प्लेटसँग सुरु गर्नेमा केन्द्रित हुनेछ र Azure AI सेवाहरूको डिप्लोयमेन्टका लागि उत्कृष्ट अभ्यासहरू प्रदान गर्नेछ।

## स्रोतहरू

### छिटो सन्दर्भहरू
- [**कमाण्ड चिट शीट**](resources/cheat-sheet.md) - आवश्यक azd कमाण्डहरू
- [**शब्दावली**](resources/glossary.md) - Azure र azd शब्दावली
- [**FAQ**](resources/faq.md) - बारम्बार सोधिने प्रश्नहरू
- [**अध्ययन मार्गदर्शन**](resources/study-guide.md) - व्यापक सिकाइ उद्देश्यहरू र अभ्यासहरू

### बाह्य स्रोतहरू
- [Azure Developer CLI डकुमेन्टेशन](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर केन्द्र](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure मूल्य गणक](https://azure.microsoft.com/pricing/calculator/)
- [Azure स्थिति](https://status.azure.com/)

## सिकाइ मार्ग

### विद्यार्थीहरू र सुरुवातकर्ताहरूका लागि
1. [AZD आधारभूतहरू](docs/getting-started/azd-basics.md) बाट सुरु गर्नुहोस्
2. [स्थापना मार्गदर्शन](docs/getting-started/installation.md) पालना गर्नुहोस्
3. [तपाईंको पहिलो प्रोजेक्ट](docs/getting-started/first-project.md) पूरा गर्नुहोस्
4. [साधारण वेब एप उदाहरण](../../examples/simple-web-app) अभ्यास गर्नुहोस्

### विकासकर्ताहरूका लागि
1. [कन्फिगरेसन मार्गदर्शन](docs/getting-started/configuration.md) समीक्षा गर्नुहोस्
2. [डिप्लोयमेन्ट मार्गदर्शन](docs/deployment/deployment-guide.md) अध्ययन गर्नुहोस्
3. [डाटाबेस एप उदाहरण](../../examples/database-app) कार्य गर्नुहोस्
4. [कन्टेनर एप उदाहरण](../../examples/container-app) अन्वेषण गर्नुहोस्

### DevOps इन्जिनियरहरूका लागि
1. [स्रोतहरू प्रोभिजनिङ](docs/deployment/provisioning.md) मा महारत हासिल गर्नुहोस्
2. [पूर्व-उडान जाँचहरू](docs/pre-deployment/preflight-checks.md) कार्यान्वयन गर्नुहोस्
3. [क्षमता योजना](docs/pre-deployment/capacity-planning.md) अभ्यास गर्नुहोस्
4. उन्नत [माइक्रोसर्भिसेस उदाहरण](../../examples/microservices) अन्वेषण गर्नुहोस्

## योगदान

हामी योगदानलाई स्वागत गर्दछौं! कृपया हाम्रो [योगदान मार्गदर्शन](CONTRIBUTING.md) पढ्नुहोस्:
- समस्या र सुविधा अनुरोधहरू कसरी पेश गर्ने
- कोड योगदान दिशानिर्देशहरू
- डकुमेन्टेशन सुधारहरू
- समुदाय मापदण्डहरू

## समर्थन

- **समस्या**: [बग रिपोर्ट गर्नुहोस् र सुविधाहरू अनुरोध गर्नुहोस्](https://github.com/microsoft/azd-for-beginners/issues)
- **चर्चा**: [Microsoft Azure Discord समुदाय Q&A र चर्चा](https://discord.gg/microsoft-azure)
- **इमेल**: निजी जाँचका लागि
- **Microsoft Learn**: [Azure Developer CLI को आधिकारिक डकुमेन्टेशन](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

## लाइसेन्स

यो परियोजना MIT लाइसेन्स अन्तर्गत लाइसेन्स गरिएको छ - विवरणका लागि [LICENSE](../../LICENSE) फाइल हेर्नुहोस्।

## 🎒 अन्य कोर्सहरू

हाम्रो टोलीले अन्य कोर्सहरू उत्पादन गर्दछ! हेर्नुहोस्:

- [**नयाँ** Model Context Protocol (MCP) सुरुवातका लागि](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI एजेन्टहरू सुरुवातका लागि](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI सुरुवातका लागि .NET प्रयोग गर्दै](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generative AI सुरुवातका लागि](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI सुरुवातका लागि Java प्रयोग गर्दै](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML सुरुवातका लागि](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [डाटा विज्ञान सुरुवातका लागि](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI सुरुवातका लागि](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [साइबर सुरक्षा सुरुवातका लागि](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [वेब विकास सुरुवातका लागि](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT का लागि शुरुवात](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR विकासको शुरुवात](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI जोडी प्रोग्रामिङका लागि GitHub Copilot को मास्टरी](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [C#/.NET विकासकर्ताहरूका लागि GitHub Copilot को मास्टरी](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [आफ्नै Copilot साहसिक यात्रा छान्नुहोस्](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**नेभिगेसन**
- **अर्को पाठ**: [AZD आधारभूत](docs/getting-started/azd-basics.md)

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। यसको मूल भाषा मा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।