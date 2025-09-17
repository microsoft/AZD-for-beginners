<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-17T16:51:48+00:00",
  "source_file": "README.md",
  "language_code": "hi"
}
-->
# AZD शुरुआती लोगों के लिए: एक संरचित सीखने की यात्रा

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.hi.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## इस कोर्स की शुरुआत कैसे करें

AZD सीखने की यात्रा शुरू करने के लिए इन चरणों का पालन करें:

1. **रिपॉजिटरी को फोर्क करें**: क्लिक करें [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **रिपॉजिटरी को क्लोन करें**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **समुदाय से जुड़ें**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) विशेषज्ञ सहायता के लिए
4. **अपना सीखने का मार्ग चुनें**: नीचे दिए गए अध्यायों में से अपने अनुभव स्तर के अनुसार चुनें

### बहु-भाषा समर्थन

#### स्वचालित अनुवाद (हमेशा अद्यतन)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](./README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

## कोर्स का अवलोकन

Azure Developer CLI (azd) को चरणबद्ध अध्यायों के माध्यम से सीखें, जो प्रगतिशील शिक्षा के लिए डिज़ाइन किए गए हैं। **Azure AI Foundry एकीकरण के साथ AI एप्लिकेशन डिप्लॉयमेंट पर विशेष ध्यान।**

### यह कोर्स आधुनिक डेवलपर्स के लिए क्यों आवश्यक है

Azure AI Foundry Discord समुदाय की अंतर्दृष्टि के आधार पर, **45% डेवलपर्स AZD का उपयोग AI वर्कलोड के लिए करना चाहते हैं**, लेकिन उन्हें निम्नलिखित चुनौतियों का सामना करना पड़ता है:
- जटिल मल्टी-सर्विस AI आर्किटेक्चर
- प्रोडक्शन AI डिप्लॉयमेंट के सर्वोत्तम अभ्यास  
- Azure AI सेवा एकीकरण और कॉन्फ़िगरेशन
- AI वर्कलोड के लिए लागत अनुकूलन
- AI-विशिष्ट डिप्लॉयमेंट समस्याओं का समाधान

### सीखने के उद्देश्य

इस संरचित कोर्स को पूरा करके, आप:
- **AZD की मूल बातें सीखें**: मुख्य अवधारणाएं, इंस्टॉलेशन और कॉन्फ़िगरेशन
- **AI एप्लिकेशन डिप्लॉय करें**: AZD का उपयोग करके Azure AI Foundry सेवाओं के साथ
- **इन्फ्रास्ट्रक्चर कोड के रूप में लागू करें**: Bicep टेम्पलेट्स के साथ Azure संसाधनों का प्रबंधन
- **डिप्लॉयमेंट समस्याओं का समाधान करें**: सामान्य मुद्दों को हल करें और समस्याओं को डिबग करें
- **प्रोडक्शन के लिए अनुकूलित करें**: सुरक्षा, स्केलिंग, मॉनिटरिंग और लागत प्रबंधन
- **मल्टी-एजेंट समाधान बनाएं**: जटिल AI आर्किटेक्चर को डिप्लॉय करें

## 📚 सीखने के अध्याय

*अपने अनुभव स्तर और लक्ष्यों के आधार पर अपना सीखने का मार्ग चुनें*

### 🚀 अध्याय 1: नींव और त्वरित शुरुआत
**पूर्व आवश्यकताएँ**: Azure सब्सक्रिप्शन, बुनियादी कमांड लाइन ज्ञान  
**अवधि**: 30-45 मिनट  
**जटिलता**: ⭐

#### आप क्या सीखेंगे
- Azure Developer CLI की मूल बातें समझना
- अपने प्लेटफ़ॉर्म पर AZD इंस्टॉल करना
- अपनी पहली सफल डिप्लॉयमेंट

#### सीखने के संसाधन
- **🎯 यहां से शुरू करें**: [Azure Developer CLI क्या है?](../..)
- **📖 सिद्धांत**: [AZD की मूल बातें](docs/getting-started/azd-basics.md) - मुख्य अवधारणाएं और शब्दावली
- **⚙️ सेटअप**: [इंस्टॉलेशन और सेटअप](docs/getting-started/installation.md) - प्लेटफ़ॉर्म-विशिष्ट गाइड
- **🛠️ प्रैक्टिकल**: [आपका पहला प्रोजेक्ट](docs/getting-started/first-project.md) - चरण-दर-चरण ट्यूटोरियल
- **📋 त्वरित संदर्भ**: [कमांड चीट शीट](resources/cheat-sheet.md)

#### व्यावहारिक अभ्यास
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 अध्याय परिणाम**: AZD का उपयोग करके Azure पर एक साधारण वेब एप्लिकेशन को सफलतापूर्वक डिप्लॉय करें

---

### 🤖 अध्याय 2: AI-प्रथम विकास (AI डेवलपर्स के लिए अनुशंसित)
**पूर्व आवश्यकताएँ**: अध्याय 1 पूरा किया गया  
**अवधि**: 1-2 घंटे  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- AZD के साथ Azure AI Foundry का एकीकरण
- AI-संचालित एप्लिकेशन डिप्लॉय करना
- AI सेवा कॉन्फ़िगरेशन को समझना

#### सीखने के संसाधन
- **🎯 यहां से शुरू करें**: [Azure AI Foundry एकीकरण](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 पैटर्न**: [AI मॉडल डिप्लॉयमेंट](docs/ai-foundry/ai-model-deployment.md) - AI मॉडल को डिप्लॉय और प्रबंधित करें
- **🛠️ कार्यशाला**: [AI कार्यशाला लैब](docs/ai-foundry/ai-workshop-lab.md) - अपने AI समाधान को AZD-रेडी बनाएं
- **📋 टेम्पलेट्स**: [Azure AI Foundry टेम्पलेट्स](../..)

#### व्यावहारिक अभ्यास
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 अध्याय परिणाम**: RAG क्षमताओं के साथ एक AI-संचालित चैट एप्लिकेशन को डिप्लॉय और कॉन्फ़िगर करें

---

### ⚙️ अध्याय 3: कॉन्फ़िगरेशन और प्रमाणीकरण
**पूर्व आवश्यकताएँ**: अध्याय 1 पूरा किया गया  
**अवधि**: 45-60 मिनट  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- पर्यावरण कॉन्फ़िगरेशन और प्रबंधन
- प्रमाणीकरण और सुरक्षा सर्वोत्तम अभ्यास
- संसाधन नामकरण और संगठन

#### सीखने के संसाधन
- **📖 कॉन्फ़िगरेशन**: [कॉन्फ़िगरेशन गाइड](docs/getting-started/configuration.md) - पर्यावरण सेटअप
- **🔐 सुरक्षा**: प्रमाणीकरण पैटर्न और प्रबंधित पहचान
- **📝 उदाहरण**: [डेटाबेस ऐप उदाहरण](../../examples/database-app) - कॉन्फ़िगरेशन पैटर्न

#### व्यावहारिक अभ्यास
- कई पर्यावरण (डेव, स्टेजिंग, प्रोड) कॉन्फ़िगर करें
- प्रबंधित पहचान प्रमाणीकरण सेट करें
- पर्यावरण-विशिष्ट कॉन्फ़िगरेशन लागू करें

**💡 अध्याय परिणाम**: उचित प्रमाणीकरण और सुरक्षा के साथ कई पर्यावरण प्रबंधित करें

---

### 🏗️ अध्याय 4: इन्फ्रास्ट्रक्चर कोड के रूप में और डिप्लॉयमेंट
**पूर्व आवश्यकताएँ**: अध्याय 1-3 पूरा किया गया  
**अवधि**: 1-1.5 घंटे  
**जटिलता**: ⭐⭐⭐

#### आप क्या सीखेंगे
- उन्नत डिप्लॉयमेंट पैटर्न
- Bicep के साथ इन्फ्रास्ट्रक्चर कोड के रूप में
- संसाधन प्रावधान रणनीतियाँ

#### सीखने के संसाधन
- **📖 डिप्लॉयमेंट**: [डिप्लॉयमेंट गाइड](docs/deployment/deployment-guide.md) - पूर्ण वर्कफ़्लो
- **🏗️ प्रावधान**: [संसाधन प्रावधान](docs/deployment/provisioning.md) - Azure संसाधन प्रबंधन
- **📝 उदाहरण**: [कंटेनर ऐप उदाहरण](../../examples/container-app) - कंटेनराइज्ड डिप्लॉयमेंट

#### व्यावहारिक अभ्यास
- कस्टम Bicep टेम्पलेट्स बनाएं
- मल्टी-सर्विस एप्लिकेशन डिप्लॉय करें
- ब्लू-ग्रीन डिप्लॉयमेंट रणनीतियाँ लागू करें

**💡 अध्याय परिणाम**: कस्टम इन्फ्रास्ट्रक्चर टेम्पलेट्स का उपयोग करके जटिल मल्टी-सर्विस एप्लिकेशन डिप्लॉय करें

---

### 🎯 अध्याय 5: मल्टी-एजेंट AI समाधान (उन्नत)
**पूर्व आवश्यकताएँ**: अध्याय 1-2 पूरा किया गया  
**अवधि**: 2-3 घंटे  
**जटिलता**: ⭐⭐⭐⭐

#### आप क्या सीखेंगे
- मल्टी-एजेंट आर्किटेक्चर पैटर्न
- एजेंट ऑर्केस्ट्रेशन और समन्वय
- प्रोडक्शन-रेडी AI डिप्लॉयमेंट

#### सीखने के संसाधन
- **🤖 विशेष प्रोजेक्ट**: [रिटेल मल्टी-एजेंट समाधान](examples/retail-scenario.md) - पूर्ण कार्यान्वयन
- **🛠️ ARM टेम्पलेट्स**: [ARM टेम्पलेट पैकेज](../../examples/retail-multiagent-arm-template) - वन-क्लिक डिप्लॉयमेंट
- **📖 आर्किटेक्चर**: मल्टी-एजेंट समन्वय पैटर्न

#### व्यावहारिक अभ्यास
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 अध्याय परिणाम**: ग्राहक और इन्वेंटरी एजेंटों के साथ प्रोडक्शन-रेडी मल्टी-एजेंट AI समाधान को डिप्लॉय और प्रबंधित करें

---

### 🔍 अध्याय 6: पूर्व-डिप्लॉयमेंट सत्यापन और योजना
**पूर्व आवश्यकताएँ**: अध्याय 4 पूरा किया गया  
**अवधि**: 1 घंटा  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- क्षमता योजना और संसाधन सत्यापन
- SKU चयन रणनीतियाँ
- प्री-फ्लाइट चेक और स्वचालन

#### सीखने के संसाधन
- **📊 योजना**: [क्षमता योजना](docs/pre-deployment/capacity-planning.md) - संसाधन सत्यापन
- **💰 चयन**: [SKU चयन](docs/pre-deployment/sku-selection.md) - लागत प्रभावी विकल्प
- **✅ सत्यापन**: [प्री-फ्लाइट चेक](docs/pre-deployment/preflight-checks.md) - स्वचालित स्क्रिप्ट

#### व्यावहारिक अभ्यास
- क्षमता सत्यापन स्क्रिप्ट चलाएं
- लागत के लिए SKU चयन अनुकूलित करें
- स्वचालित पूर्व-डिप्लॉयमेंट चेक लागू करें

**💡 अध्याय परिणाम**: निष्पादन से पहले डिप्लॉयमेंट को सत्यापित और अनुकूलित करें

---

### 🚨 अध्याय 7: समस्या निवारण और डिबगिंग
**पूर्व आवश्यकताएँ**: कोई भी डिप्लॉयमेंट अध्याय पूरा किया गया  
**अवधि**: 1-1.5 घंटे  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- व्यवस्थित डिबगिंग दृष्टिकोण
- सामान्य मुद्दे और समाधान
- AI-विशिष्ट समस्या निवारण

#### सीखने के संसाधन
- **🔧 सामान्य मुद्दे**: [सामान्य मुद्दे](docs/troubleshooting/common-issues.md) - FAQ और समाधान
- **🕵️ डिबगिंग**: [डिबगिंग गाइड](docs/troubleshooting/debugging.md) - चरण-दर-चरण रणनीतियाँ
- **🤖 AI मुद्दे**: [AI-विशिष्ट समस्या निवारण](docs/troubleshooting/ai-troubleshooting.md) - AI सेवा समस्याएँ

#### व्यावहारिक अभ्यास
- डिप्लॉयमेंट विफलताओं का निदान करें
- प्रमाणीकरण समस्याओं को हल करें
- AI सेवा कनेक्टिविटी को डिबग करें

**💡 अध्याय परिणाम**: सामान्य डिप्लॉयमेंट समस्याओं का स्वतंत्र रूप से निदान और समाधान करें

---

### 🏢 अध्याय 8: प्रोडक्शन और एंटरप्राइज़ पैटर्न
**पूर्व आवश्यकताएँ**: अध्याय 1-4 पूरा किया गया  
**अवधि**: 2-3 घंटे  
**जटिलता**: ⭐⭐⭐⭐

#### आप क्या सीखेंगे
- प्रोडक्शन डिप्लॉयमेंट रणनीतियाँ
- एंटरप्राइज़ सुरक्षा पैटर्न
- मॉनिटरिंग और लागत अनुकूलन

#### सीखने के संसाधन
- **🏭 प्रोडक्शन**: [प्रोडक्शन AI सर्वोत्तम अभ्यास](docs/ai-foundry/production-ai-practices.md) - एंटरप्राइज़ पैटर्न
- **📝 उदाहरण**: [माइक्रोसर्विसेज उदाहरण](../../examples/microservices) - जट
- **📊 निगरानी**: एप्लिकेशन इनसाइट्स इंटीग्रेशन

#### व्यावहारिक अभ्यास
- एंटरप्राइज़ सुरक्षा पैटर्न लागू करें  
- व्यापक निगरानी सेटअप करें  
- उचित गवर्नेंस के साथ प्रोडक्शन में तैनात करें  

**💡 अध्याय का परिणाम**: पूर्ण प्रोडक्शन क्षमताओं के साथ एंटरप्राइज़-रेडी एप्लिकेशन तैनात करें  

---

## 📖 Azure Developer CLI क्या है?

Azure Developer CLI (azd) एक डेवलपर-केंद्रित कमांड-लाइन इंटरफ़ेस है जो Azure पर एप्लिकेशन बनाने और तैनात करने की प्रक्रिया को तेज़ करता है। यह प्रदान करता है:

- **टेम्पलेट-आधारित तैनाती** - सामान्य एप्लिकेशन पैटर्न के लिए प्री-बिल्ट टेम्पलेट्स का उपयोग करें  
- **इन्फ्रास्ट्रक्चर कोड के रूप में** - Bicep या Terraform का उपयोग करके Azure संसाधनों का प्रबंधन करें  
- **इंटीग्रेटेड वर्कफ़्लो** - एप्लिकेशन को सहजता से प्रोविजन, तैनात और मॉनिटर करें  
- **डेवलपर-फ्रेंडली** - डेवलपर उत्पादकता और अनुभव के लिए अनुकूलित  

### **AZD + Azure AI Foundry: AI तैनाती के लिए आदर्श**

**AI समाधान के लिए AZD क्यों?** AZD AI डेवलपर्स द्वारा सामना की जाने वाली प्रमुख चुनौतियों का समाधान करता है:

- **AI-रेडी टेम्पलेट्स** - Azure OpenAI, Cognitive Services, और ML वर्कलोड्स के लिए प्री-कॉन्फ़िगर्ड टेम्पलेट्स  
- **सुरक्षित AI तैनाती** - AI सेवाओं, API कुंजियों, और मॉडल एंडपॉइंट्स के लिए बिल्ट-इन सुरक्षा पैटर्न  
- **प्रोडक्शन AI पैटर्न** - स्केलेबल, लागत-प्रभावी AI एप्लिकेशन तैनाती के लिए सर्वोत्तम प्रथाएं  
- **एंड-टू-एंड AI वर्कफ़्लो** - मॉडल विकास से लेकर प्रोडक्शन तैनाती तक उचित निगरानी के साथ  
- **लागत अनुकूलन** - AI वर्कलोड्स के लिए स्मार्ट संसाधन आवंटन और स्केलिंग रणनीतियाँ  
- **Azure AI Foundry इंटीग्रेशन** - AI Foundry मॉडल कैटलॉग और एंडपॉइंट्स से सहज कनेक्शन  

---

## 🎯 टेम्पलेट्स और उदाहरण लाइब्रेरी

### विशेष: Azure AI Foundry टेम्पलेट्स  
**AI एप्लिकेशन तैनात कर रहे हैं? यहां से शुरू करें!**

| टेम्पलेट | अध्याय | जटिलता | सेवाएं |
|----------|---------|------------|----------|
| [**AI चैट के साथ शुरुआत करें**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**AI एजेंट्स के साथ शुरुआत करें**](https://github.com/Azure-Samples/get-started-with-ai-agents) | अध्याय 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**मल्टी-एजेंट वर्कफ़्लो ऑटोमेशन**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**अपने डेटा से दस्तावेज़ उत्पन्न करें**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**क्लाइंट मीटिंग्स को एजेंट्स के साथ बेहतर बनाएं**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**अपने कोड को एजेंट्स के साथ आधुनिक बनाएं**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**अपना संवादात्मक एजेंट बनाएं**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**संवादात्मक डेटा से अंतर्दृष्टि अनलॉक करें**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**मल्टी-मोडल सामग्री प्रसंस्करण**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### विशेष: पूर्ण शिक्षण परिदृश्य  
**प्रोडक्शन-रेडी एप्लिकेशन टेम्पलेट्स शिक्षण अध्यायों से जुड़े हुए**

| टेम्पलेट | शिक्षण अध्याय | जटिलता | प्रमुख शिक्षण |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | बुनियादी AI तैनाती पैटर्न |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | Azure AI Search के साथ RAG कार्यान्वयन |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | अध्याय 4 | ⭐⭐ | दस्तावेज़ इंटेलिजेंस इंटीग्रेशन |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | एजेंट फ्रेमवर्क और फ़ंक्शन कॉलिंग |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐ | एंटरप्राइज़ AI ऑर्केस्ट्रेशन |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | ग्राहक और इन्वेंटरी एजेंट्स के साथ मल्टी-एजेंट आर्किटेक्चर |

### उदाहरण प्रकार के अनुसार सीखना

#### सरल एप्लिकेशन (अध्याय 1-2)
- [सरल वेब ऐप](../../examples/simple-web-app) - बुनियादी तैनाती पैटर्न  
- [स्थिर वेबसाइट](../../examples/static-site) - स्थिर सामग्री तैनाती  
- [बुनियादी API](../../examples/basic-api) - REST API तैनाती  

#### डेटाबेस इंटीग्रेशन (अध्याय 3-4)  
- [डेटाबेस ऐप](../../examples/database-app) - डेटाबेस कनेक्टिविटी पैटर्न  
- [डेटा प्रसंस्करण](../../examples/data-processing) - ETL वर्कफ़्लो तैनाती  

#### उन्नत पैटर्न (अध्याय 4-8)
- [कंटेनर ऐप्स](../../examples/container-app) - कंटेनरीकृत तैनाती  
- [माइक्रोसर्विसेज़](../../examples/microservices) - मल्टी-सर्विस आर्किटेक्चर  
- [एंटरप्राइज़ समाधान](../../examples/enterprise) - प्रोडक्शन-रेडी पैटर्न  

### बाहरी टेम्पलेट संग्रह
- [**Azure-Samples AZD टेम्पलेट्स**](https://github.com/Azure-Samples/azd-templates) - आधिकारिक Microsoft नमूने  
- [**Awesome AZD गैलरी**](https://azure.github.io/awesome-azd/) - समुदाय द्वारा योगदान किए गए टेम्पलेट्स  
- [**उदाहरण निर्देशिका**](examples/README.md) - विस्तृत व्याख्याओं के साथ स्थानीय शिक्षण उदाहरण  

---

## 📚 शिक्षण संसाधन और संदर्भ

### त्वरित संदर्भ
- [**कमांड चीट शीट**](resources/cheat-sheet.md) - अध्याय के अनुसार आवश्यक azd कमांड  
- [**शब्दावली**](resources/glossary.md) - Azure और azd शब्दावली  
- [**FAQ**](resources/faq.md) - सामान्य प्रश्न अध्याय के अनुसार  
- [**अध्ययन गाइड**](resources/study-guide.md) - व्यापक अभ्यास अभ्यास  

### हैंड्स-ऑन वर्कशॉप्स
- [**AI वर्कशॉप लैब**](docs/ai-foundry/ai-workshop-lab.md) - अपने AI समाधान AZD-तैनात करने योग्य बनाएं  
- [**AZD शुरुआती वर्कशॉप**](workshop/README.md) - पूर्ण हैंड्स-ऑन वर्कशॉप सामग्री  

### बाहरी शिक्षण संसाधन
- [Azure Developer CLI दस्तावेज़](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure आर्किटेक्चर केंद्र](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure मूल्य निर्धारण कैलकुलेटर](https://azure.microsoft.com/pricing/calculator/)  
- [Azure स्थिति](https://status.azure.com/)  

---

## 🎓 पाठ्यक्रम पूर्णता और प्रमाणन

### प्रगति ट्रैकिंग
प्रत्येक अध्याय के माध्यम से अपनी शिक्षण प्रगति को ट्रैक करें:

- [ ] **अध्याय 1**: नींव और त्वरित शुरुआत ✅  
- [ ] **अध्याय 2**: AI-प्रथम विकास ✅  
- [ ] **अध्याय 3**: कॉन्फ़िगरेशन और प्रमाणीकरण ✅  
- [ ] **अध्याय 4**: इन्फ्रास्ट्रक्चर कोड और तैनाती ✅  
- [ ] **अध्याय 5**: मल्टी-एजेंट AI समाधान ✅  
- [ ] **अध्याय 6**: प्री-तैनाती सत्यापन और योजना ✅  
- [ ] **अध्याय 7**: समस्या निवारण और डिबगिंग ✅  
- [ ] **अध्याय 8**: प्रोडक्शन और एंटरप्राइज़ पैटर्न ✅  

### शिक्षण सत्यापन
प्रत्येक अध्याय पूरा करने के बाद, अपने ज्ञान को सत्यापित करें:  
1. **व्यावहारिक अभ्यास**: अध्याय का हैंड्स-ऑन तैनाती पूरा करें  
2. **ज्ञान जांच**: अपने अध्याय के FAQ अनुभाग की समीक्षा करें  
3. **समुदाय चर्चा**: Azure Discord में अपना अनुभव साझा करें  
4. **अगला अध्याय**: अगले जटिलता स्तर पर जाएं  

### पाठ्यक्रम पूर्णता लाभ
सभी अध्याय पूरे करने पर, आपके पास होगा:  
- **प्रोडक्शन अनुभव**: Azure पर वास्तविक AI एप्लिकेशन तैनात किए  
- **पेशेवर कौशल**: एंटरप्राइज़-रेडी तैनाती क्षमताएं  
- **समुदाय मान्यता**: Azure डेवलपर समुदाय का सक्रिय सदस्य  
- **करियर उन्नति**: मांग में AZD और AI तैनाती विशेषज्ञता  

---

## 🤝 समुदाय और समर्थन

### सहायता प्राप्त करें
- **तकनीकी समस्याएं**: [बग रिपोर्ट करें और फीचर अनुरोध करें](https://github.com/microsoft/azd-for-beginners/issues)  
- **शिक्षण प्रश्न**: [Microsoft Azure Discord समुदाय](https://discord.gg/microsoft-azure)  
- **AI-विशिष्ट सहायता**: AZD + AI Foundry चर्चाओं के लिए [#Azure चैनल](https://discord.gg/microsoft-azure) में शामिल हों  
- **दस्तावेज़ीकरण**: [आधिकारिक Azure Developer CLI दस्तावेज़](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Azure AI Foundry Discord से सामुदायिक अंतर्दृष्टि

**#Azure चैनल से हालिया पोल परिणाम:**  
- **45%** डेवलपर्स AZD का उपयोग AI वर्कलोड्स के लिए करना चाहते हैं  
- **शीर्ष चुनौतियां**: मल्टी-सर्विस तैनाती, क्रेडेंशियल प्रबंधन, प्रोडक्शन रेडीनेस  
- **सबसे अधिक अनुरोधित**: AI-विशिष्ट टेम्पलेट्स, समस्या निवारण गाइड, सर्वोत्तम प्रथाएं  

**हमारे समुदाय में शामिल हों:**  
- अपने AZD + AI अनुभव साझा करें और सहायता प्राप्त करें  
- नए AI टेम्पलेट्स के शुरुआती पूर्वावलोकन तक पहुंचें  
- AI तैनाती सर्वोत्तम प्रथाओं में योगदान करें  
- भविष्य के AI + AZD फीचर विकास को प्रभावित करें  

### पाठ्यक्रम में योगदान
हम योगदान का स्वागत करते हैं! कृपया हमारे [योगदान गाइड](CONTRIBUTING.md) को पढ़ें:  
- **सामग्री सुधार**: मौजूदा अध्यायों और उदाहरणों को बेहतर बनाएं  
- **नए उदाहरण**: वास्तविक परिदृश्य और टेम्पलेट्स जोड़ें  
- **अनुवाद**: बहु-भाषा समर्थन बनाए रखने में मदद करें  
- **बग रिपोर्ट**: सटीकता और स्पष्टता में सुधार करें  
- **समुदाय मानक**: हमारे समावेशी समुदाय दिशानिर्देशों का पालन करें  

---

## 📄 पाठ्यक्रम जानकारी

### लाइसेंस
यह प्रोजेक्ट MIT लाइसेंस के तहत लाइसेंस प्राप्त है - विवरण के लिए [LICENSE](../../LICENSE) फ़ाइल देखें।  

### संबंधित Microsoft शिक्षण संसाधन

हमारी टीम अन्य व्यापक शिक्षण पाठ्यक्रम तैयार करती है:

- [**नया** मॉडल संदर्भ प्रोटोकॉल (MCP) शुरुआती के लिए](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [शुरुआती के लिए AI एजेंट्स](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI शुरुआती के लिए .NET का उपयोग करके](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generative AI शुरुआती के लिए](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI शुरुआती के लिए Java का उपयोग करके](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [शुरुआती के लिए ML](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [शुरुआती के लिए डेटा साइंस](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [शुरुआती के लिए AI](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [शुरुआती के लिए साइबर सुरक्षा](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [शुरुआती के लिए वेब विकास](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [शुरुआती के लिए IoT](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [शुरुआती के लिए XR विकास](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI पेयर प्रोग्रामिंग के लिए GitHub Copilot मास्टरिंग](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [C#/.NET डेवलपर्स के लिए GitHub Copilot मास्टरिंग](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [अपना खुद का Copilot एडवेंचर चुनें](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

## 🗺️ पाठ्यक्रम नेविगेशन

**🚀 सीखना शुरू करने के लिए तैयार?**

**शुरुआती**: [अध्याय 1: नींव और त्वरित शुरुआत](../..) से शुरू करें  
**AI डेवलपर्स**: [अध्याय 2: AI-प्रथम विकास](../..) पर जाएं  
**अनुभवी डेवलपर्स**: [अध्याय 3: कॉन्फ़िगरेशन और प्रमाणीकरण](../..) से शुरू करें

**अगले कदम**: [अध्याय 1 - AZD बेसिक्स शुरू करें](docs/getting-started/azd-basics.md) →

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।