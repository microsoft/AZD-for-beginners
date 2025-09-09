<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3bd0e0644b110276e4364eb753ddcef8",
  "translation_date": "2025-09-09T16:29:42+00:00",
  "source_file": "README.md",
  "language_code": "hi"
}
-->
# AZD शुरुआती लोगों के लिए

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.hi.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)  
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)  

इन संसाधनों का उपयोग शुरू करने के लिए निम्नलिखित चरणों का पालन करें:  
1. **रेपॉजिटरी को फोर्क करें**: क्लिक करें [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **रेपॉजिटरी को क्लोन करें**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**Azure Discord समुदायों में शामिल हों और विशेषज्ञों व अन्य डेवलपर्स से मिलें**](https://discord.com/invite/ByRwuEEgH4)  

### 🌐 बहुभाषी समर्थन

#### GitHub Action के माध्यम से समर्थित (स्वचालित और हमेशा अद्यतन)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](./README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)  

**यदि आप अतिरिक्त भाषाओं में अनुवाद चाहते हैं, तो समर्थित भाषाओं की सूची [यहां](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md) उपलब्ध है।**

## परिचय

Azure Developer CLI (azd) के लिए व्यापक गाइड में आपका स्वागत है। यह रेपॉजिटरी छात्रों से लेकर पेशेवर डेवलपर्स तक सभी स्तरों के डेवलपर्स को Azure Developer CLI सीखने और मास्टर करने में मदद करने के लिए डिज़ाइन की गई है। यह संरचित शिक्षण संसाधन Azure क्लाउड डिप्लॉयमेंट, सामान्य समस्याओं का समाधान, और सफल AZD टेम्पलेट डिप्लॉयमेंट के लिए सर्वोत्तम प्रथाओं को लागू करने का व्यावहारिक अनुभव प्रदान करता है।

## सीखने के लक्ष्य

इस रेपॉजिटरी पर काम करके, आप:  
- Azure Developer CLI की मूलभूत बातें और मुख्य अवधारणाओं में महारत हासिल करेंगे  
- Infrastructure as Code का उपयोग करके Azure संसाधनों को डिप्लॉय और प्रोविजन करना सीखेंगे  
- सामान्य AZD डिप्लॉयमेंट समस्याओं के लिए समस्या निवारण कौशल विकसित करेंगे  
- प्री-डिप्लॉयमेंट सत्यापन और क्षमता योजना को समझेंगे  
- सुरक्षा सर्वोत्तम प्रथाओं और लागत अनुकूलन रणनीतियों को लागू करेंगे  
- Azure पर प्रोडक्शन-रेडी एप्लिकेशन डिप्लॉय करने में आत्मविश्वास बनाएंगे  

## सीखने के परिणाम

इस कोर्स को पूरा करने के बाद, आप:  
- Azure Developer CLI को सफलतापूर्वक इंस्टॉल, कॉन्फ़िगर और उपयोग कर पाएंगे  
- AZD टेम्पलेट्स का उपयोग करके एप्लिकेशन बना और डिप्लॉय कर पाएंगे  
- ऑथेंटिकेशन, इंफ्रास्ट्रक्चर, और डिप्लॉयमेंट समस्याओं का समाधान कर पाएंगे  
- क्षमता योजना और SKU चयन सहित प्री-डिप्लॉयमेंट चेक्स कर पाएंगे  
- मॉनिटरिंग, सुरक्षा, और लागत प्रबंधन सर्वोत्तम प्रथाओं को लागू कर पाएंगे  
- AZD वर्कफ़्लो को CI/CD पाइपलाइनों में एकीकृत कर पाएंगे  

## सामग्री की तालिका

- [Azure Developer CLI क्या है?](../..)  
- [त्वरित शुरुआत](../..)  
- [डॉक्यूमेंटेशन](../..)  
- [उदाहरण और टेम्पलेट्स](../..)  
- [संसाधन](../..)  
- [योगदान](../..)  

## Azure Developer CLI क्या है?

Azure Developer CLI (azd) एक डेवलपर-केंद्रित कमांड-लाइन इंटरफ़ेस है जो Azure पर एप्लिकेशन बनाने और डिप्लॉय करने की प्रक्रिया को तेज़ करता है। यह प्रदान करता है:  

- **टेम्पलेट-आधारित डिप्लॉयमेंट्स** - सामान्य एप्लिकेशन पैटर्न के लिए प्री-बिल्ट टेम्पलेट्स का उपयोग करें  
- **Infrastructure as Code** - Bicep या Terraform का उपयोग करके Azure संसाधनों का प्रबंधन करें  
- **इंटीग्रेटेड वर्कफ़्लो** - एप्लिकेशन को प्रोविजन, डिप्लॉय और मॉनिटर करें  
- **डेवलपर-फ्रेंडली** - डेवलपर उत्पादकता और अनुभव के लिए अनुकूलित  

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

## डॉक्यूमेंटेशन

### शुरुआत करना  
- [**AZD बेसिक्स**](docs/getting-started/azd-basics.md) - मुख्य अवधारणाएँ और शब्दावली  
- [**इंस्टॉलेशन और सेटअप**](docs/getting-started/installation.md) - प्लेटफ़ॉर्म-विशिष्ट इंस्टॉलेशन गाइड  
- [**कॉन्फ़िगरेशन**](docs/getting-started/configuration.md) - वातावरण सेटअप और ऑथेंटिकेशन  
- [**आपका पहला प्रोजेक्ट**](docs/getting-started/first-project.md) - चरण-दर-चरण ट्यूटोरियल  

### डिप्लॉयमेंट और प्रोविजनिंग  
- [**डिप्लॉयमेंट गाइड**](docs/deployment/deployment-guide.md) - पूर्ण डिप्लॉयमेंट वर्कफ़्लो  
- [**संसाधनों का प्रोविजनिंग**](docs/deployment/provisioning.md) - Azure संसाधन प्रबंधन  

### प्री-डिप्लॉयमेंट चेक्स  
- [**क्षमता योजना**](docs/pre-deployment/capacity-planning.md) - Azure संसाधन क्षमता सत्यापन  
- [**SKU चयन**](docs/pre-deployment/sku-selection.md) - सही Azure SKUs का चयन  
- [**प्री-फ्लाइट चेक्स**](docs/pre-deployment/preflight-checks.md) - स्वचालित सत्यापन स्क्रिप्ट  

### समस्या निवारण  
- [**सामान्य समस्याएँ**](docs/troubleshooting/common-issues.md) - अक्सर आने वाली समस्याएँ और समाधान  
- [**डिबगिंग गाइड**](docs/troubleshooting/debugging.md) - चरण-दर-चरण डिबगिंग रणनीतियाँ  

## उदाहरण और टेम्पलेट्स

### स्टार्टर टेम्पलेट्स  
- [**सिंपल वेब एप्लिकेशन**](../../examples/simple-web-app) - बेसिक Node.js वेब एप्लिकेशन डिप्लॉयमेंट  
- [**स्टैटिक वेबसाइट**](../../examples/static-website) - Azure Storage पर स्टैटिक वेबसाइट होस्टिंग  
- [**कंटेनर एप्लिकेशन**](../../examples/container-app) - कंटेनराइज्ड एप्लिकेशन डिप्लॉयमेंट  
- [**डेटाबेस एप्लिकेशन**](../../examples/database-app) - डेटाबेस इंटीग्रेशन के साथ वेब एप्लिकेशन  

### उन्नत परिदृश्य  
- [**माइक्रोसर्विसेज**](../../examples/microservices) - मल्टी-सर्विस एप्लिकेशन आर्किटेक्चर  
- [**सर्वरलेस फंक्शन्स**](../../examples/serverless-function) - Azure Functions डिप्लॉयमेंट  
- [**कॉन्फ़िगरेशन उदाहरण**](../../examples/configurations) - पुन: उपयोग योग्य कॉन्फ़िगरेशन पैटर्न  

## संसाधन

### त्वरित संदर्भ  
- [**कमांड चीट शीट**](resources/cheat-sheet.md) - आवश्यक azd कमांड  
- [**ग्लॉसरी**](resources/glossary.md) - Azure और azd शब्दावली  
- [**FAQ**](resources/faq.md) - अक्सर पूछे जाने वाले प्रश्न  
- [**स्टडी गाइड**](resources/study-guide.md) - व्यापक शिक्षण उद्देश्य और अभ्यास  

### बाहरी संसाधन  
- [Azure Developer CLI डॉक्यूमेंटेशन](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure आर्किटेक्चर सेंटर](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure प्राइसिंग कैलकुलेटर](https://azure.microsoft.com/pricing/calculator/)  
- [Azure स्टेटस](https://status.azure.com/)  

## शिक्षण पथ

### छात्रों और शुरुआती लोगों के लिए  
1. [AZD बेसिक्स](docs/getting-started/azd-basics.md) से शुरू करें  
2. [इंस्टॉलेशन गाइड](docs/getting-started/installation.md) का पालन करें  
3. [आपका पहला प्रोजेक्ट](docs/getting-started/first-project.md) पूरा करें  
4. [सिंपल वेब ऐप उदाहरण](../../examples/simple-web-app) के साथ अभ्यास करें  

### डेवलपर्स के लिए  
1. [कॉन्फ़िगरेशन गाइड](docs/getting-started/configuration.md) की समीक्षा करें  
2. [डिप्लॉयमेंट गाइड](docs/deployment/deployment-guide.md) का अध्ययन करें  
3. [डेटाबेस ऐप उदाहरण](../../examples/database-app) पर काम करें  
4. [कंटेनर ऐप उदाहरण](../../examples/container-app) का अन्वेषण करें  

### DevOps इंजीनियरों के लिए  
1. [संसाधनों का प्रोविजनिंग](docs/deployment/provisioning.md) में महारत हासिल करें  
2. [प्री-फ्लाइट चेक्स](docs/pre-deployment/preflight-checks.md) लागू करें  
3. [क्षमता योजना](docs/pre-deployment/capacity-planning.md) का अभ्यास करें  
4. उन्नत [माइक्रोसर्विसेज उदाहरण](../../examples/microservices) पर काम करें  

## योगदान

हम योगदान का स्वागत करते हैं! कृपया हमारे [योगदान गाइड](CONTRIBUTING.md) को पढ़ें, जिसमें शामिल हैं:  
- समस्याएँ और फीचर अनुरोध कैसे सबमिट करें  
- कोड योगदान दिशानिर्देश  
- डॉक्यूमेंटेशन सुधार  
- सामुदायिक मानक  

## समर्थन

- **समस्याएँ**: [बग रिपोर्ट करें और फीचर अनुरोध सबमिट करें](https://github.com/microsoft/azd-for-beginners/issues)  
- **चर्चाएँ**: [Microsoft Azure Discord समुदाय Q&A और चर्चाएँ](https://discord.gg/microsoft-azure)  
- **ईमेल**: निजी पूछताछ के लिए  
- **Microsoft Learn**: [आधिकारिक Azure Developer CLI डॉक्यूमेंटेशन](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

## लाइसेंस

यह प्रोजेक्ट MIT लाइसेंस के तहत लाइसेंस प्राप्त है - विवरण के लिए [LICENSE](../../LICENSE) फ़ाइल देखें।  

## 🎒 अन्य पाठ्यक्रम

हमारी टीम अन्य पाठ्यक्रम भी प्रदान करती है! देखें:  

- [**नया** Model Context Protocol (MCP) शुरुआती लोगों के लिए](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Agents शुरुआती लोगों के लिए](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI शुरुआती लोगों के लिए .NET का उपयोग करके](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generative AI शुरुआती लोगों के लिए](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI शुरुआती लोगों के लिए Java का उपयोग करके](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML शुरुआती लोगों के लिए](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [डेटा साइंस शुरुआती लोगों के लिए](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI शुरुआती लोगों के लिए](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [साइबर सुरक्षा शुरुआती लोगों के लिए](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [शुरुआती लोगों के लिए वेब डेव](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [शुरुआती लोगों के लिए IoT](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [शुरुआती लोगों के लिए XR विकास](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI पेयर्ड प्रोग्रामिंग के लिए GitHub Copilot में महारत हासिल करें](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [C#/.NET डेवलपर्स के लिए GitHub Copilot में महारत हासिल करें](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [अपना खुद का Copilot एडवेंचर चुनें](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**नेविगेशन**  
- **अगला पाठ**: [AZD की मूल बातें](docs/getting-started/azd-basics.md)  

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।