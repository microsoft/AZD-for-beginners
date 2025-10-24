<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a47510110edbcc33ad1ab7e8d234f7c3",
  "translation_date": "2025-10-24T09:13:32+00:00",
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

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[अरबी](../ar/README.md) | [बंगाली](../bn/README.md) | [बुल्गेरियन](../bg/README.md) | [बर्मी (म्यांमार)](../my/README.md) | [चीनी (सरलीकृत)](../zh/README.md) | [चीनी (पारंपरिक, हांगकांग)](../hk/README.md) | [चीनी (पारंपरिक, मकाऊ)](../mo/README.md) | [चीनी (पारंपरिक, ताइवान)](../tw/README.md) | [क्रोएशियन](../hr/README.md) | [चेक](../cs/README.md) | [डेनिश](../da/README.md) | [डच](../nl/README.md) | [एस्टोनियन](../et/README.md) | [फिनिश](../fi/README.md) | [फ्रेंच](../fr/README.md) | [जर्मन](../de/README.md) | [ग्रीक](../el/README.md) | [हिब्रू](../he/README.md) | [हिंदी](./README.md) | [हंगेरियन](../hu/README.md) | [इंडोनेशियन](../id/README.md) | [इतालवी](../it/README.md) | [जापानी](../ja/README.md) | [कोरियाई](../ko/README.md) | [लिथुआनियन](../lt/README.md) | [मलय](../ms/README.md) | [मराठी](../mr/README.md) | [नेपाली](../ne/README.md) | [नॉर्वेजियन](../no/README.md) | [फारसी (फारसी)](../fa/README.md) | [पोलिश](../pl/README.md) | [पुर्तगाली (ब्राज़ील)](../br/README.md) | [पुर्तगाली (पुर्तगाल)](../pt/README.md) | [पंजाबी (गुरमुखी)](../pa/README.md) | [रोमानियन](../ro/README.md) | [रूसी](../ru/README.md) | [सर्बियन (सिरिलिक)](../sr/README.md) | [स्लोवाक](../sk/README.md) | [स्लोवेनियन](../sl/README.md) | [स्पेनिश](../es/README.md) | [स्वाहिली](../sw/README.md) | [स्वीडिश](../sv/README.md) | [टैगालोग (फिलिपिनो)](../tl/README.md) | [तमिल](../ta/README.md) | [थाई](../th/README.md) | [तुर्की](../tr/README.md) | [यूक्रेनी](../uk/README.md) | [उर्दू](../ur/README.md) | [वियतनामी](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## कोर्स का अवलोकन

Azure Developer CLI (azd) को चरणबद्ध अध्यायों के माध्यम से मास्टर करें, जो प्रगतिशील सीखने के लिए डिज़ाइन किए गए हैं। **Azure AI Foundry इंटीग्रेशन के साथ AI एप्लिकेशन डिप्लॉयमेंट पर विशेष ध्यान।**

### यह कोर्स आधुनिक डेवलपर्स के लिए क्यों आवश्यक है

Azure AI Foundry Discord समुदाय की अंतर्दृष्टि के आधार पर, **45% डेवलपर्स AZD का उपयोग AI वर्कलोड्स के लिए करना चाहते हैं**, लेकिन उन्हें निम्नलिखित चुनौतियों का सामना करना पड़ता है:
- जटिल मल्टी-सर्विस AI आर्किटेक्चर
- प्रोडक्शन AI डिप्लॉयमेंट के सर्वोत्तम अभ्यास  
- Azure AI सेवा इंटीग्रेशन और कॉन्फ़िगरेशन
- AI वर्कलोड्स के लिए लागत अनुकूलन
- AI-विशिष्ट डिप्लॉयमेंट समस्याओं का समाधान

### सीखने के उद्देश्य

इस संरचित कोर्स को पूरा करके, आप:
- **AZD की मूल बातें मास्टर करें**: मुख्य अवधारणाएं, इंस्टॉलेशन और कॉन्फ़िगरेशन
- **AI एप्लिकेशन डिप्लॉय करें**: AZD का उपयोग करके Azure AI Foundry सेवाओं के साथ
- **इंफ्रास्ट्रक्चर कोड के रूप में लागू करें**: Bicep टेम्पलेट्स के साथ Azure संसाधनों का प्रबंधन करें
- **डिप्लॉयमेंट समस्याओं का समाधान करें**: सामान्य समस्याओं को हल करें और डिबग करें
- **प्रोडक्शन के लिए अनुकूलित करें**: सुरक्षा, स्केलिंग, मॉनिटरिंग और लागत प्रबंधन
- **मल्टी-एजेंट समाधान बनाएं**: जटिल AI आर्किटेक्चर को डिप्लॉय करें

## 📚 सीखने के अध्याय

*अपने अनुभव स्तर और लक्ष्यों के आधार पर अपना सीखने का मार्ग चुनें*

### 🚀 अध्याय 1: आधारभूत और त्वरित शुरुआत
**पूर्वापेक्षाएँ**: Azure सब्सक्रिप्शन, बेसिक कमांड लाइन ज्ञान  
**अवधि**: 30-45 मिनट  
**जटिलता**: ⭐

#### आप क्या सीखेंगे
- Azure Developer CLI की मूल बातें समझना
- अपने प्लेटफ़ॉर्म पर AZD इंस्टॉल करना
- अपनी पहली सफल डिप्लॉयमेंट

#### सीखने के संसाधन
- **🎯 यहां से शुरू करें**: [Azure Developer CLI क्या है?](../..)
- **📖 सिद्धांत**: [AZD Basics](docs/getting-started/azd-basics.md) - मुख्य अवधारणाएं और शब्दावली
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

**💡 अध्याय का परिणाम**: AZD का उपयोग करके Azure पर एक साधारण वेब एप्लिकेशन को सफलतापूर्वक डिप्लॉय करें

---

### 🤖 अध्याय 2: AI-प्रथम विकास (AI डेवलपर्स के लिए अनुशंसित)
**पूर्वापेक्षाएँ**: अध्याय 1 पूरा किया गया  
**अवधि**: 1-2 घंटे  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- AZD के साथ Azure AI Foundry इंटीग्रेशन
- AI-संचालित एप्लिकेशन डिप्लॉय करना
- AI सेवा कॉन्फ़िगरेशन को समझना

#### सीखने के संसाधन
- **🎯 यहां से शुरू करें**: [Azure AI Foundry इंटीग्रेशन](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 पैटर्न**: [AI मॉडल डिप्लॉयमेंट](docs/ai-foundry/ai-model-deployment.md) - AI मॉडल्स को डिप्लॉय और प्रबंधित करें
- **🛠️ वर्कशॉप**: [AI वर्कशॉप लैब](docs/ai-foundry/ai-workshop-lab.md) - अपने AI समाधान को AZD-रेडी बनाएं
- **🎥 इंटरएक्टिव गाइड**: [वर्कशॉप सामग्री](workshop/README.md) - MkDocs * DevContainer Environment के साथ ब्राउज़र-आधारित सीखना
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

**💡 अध्याय का परिणाम**: RAG क्षमताओं के साथ एक AI-संचालित चैट एप्लिकेशन को डिप्लॉय और कॉन्फ़िगर करें

---

### ⚙️ अध्याय 3: कॉन्फ़िगरेशन और प्रमाणीकरण
**पूर्वापेक्षाएँ**: अध्याय 1 पूरा किया गया  
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

**💡 अध्याय का परिणाम**: उचित प्रमाणीकरण और सुरक्षा के साथ कई पर्यावरण प्रबंधित करें

---

### 🏗️ अध्याय 4: कोड के रूप में इंफ्रास्ट्रक्चर और डिप्लॉयमेंट
**पूर्वापेक्षाएँ**: अध्याय 1-3 पूरा किया गया  
**अवधि**: 1-1.5 घंटे  
**जटिलता**: ⭐⭐⭐

#### आप क्या सीखेंगे
- उन्नत डिप्लॉयमेंट पैटर्न
- Bicep के साथ कोड के रूप में इंफ्रास्ट्रक्चर
- संसाधन प्रावधान रणनीतियाँ

#### सीखने के संसाधन
- **📖 डिप्लॉयमेंट**: [डिप्लॉयमेंट गाइड](docs/deployment/deployment-guide.md) - पूर्ण वर्कफ़्लो
- **🏗️ प्रावधान**: [संसाधन प्रावधान](docs/deployment/provisioning.md) - Azure संसाधन प्रबंधन
- **📝 उदाहरण**: [कंटेनर ऐप उदाहरण](../../examples/container-app) - कंटेनराइज्ड डिप्लॉयमेंट

#### व्यावहारिक अभ्यास
- कस्टम Bicep टेम्पलेट्स बनाएं
- मल्टी-सर्विस एप्लिकेशन डिप्लॉय करें
- ब्लू-ग्रीन डिप्लॉयमेंट रणनीतियाँ लागू करें

**💡 अध्याय का परिणाम**: कस्टम इंफ्रास्ट्रक्चर टेम्पलेट्स का उपयोग करके जटिल मल्टी-सर्विस एप्लिकेशन डिप्लॉय करें

---

### 🎯 अध्याय 5: मल्टी-एजेंट AI समाधान (उन्नत)
**पूर्वापेक्षाएँ**: अध्याय 1-2 पूरा किया गया  
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

**💡 अध्याय का परिणाम**: ग्राहक और इन्वेंटरी एजेंट्स के साथ प्रोडक्शन-रेडी मल्टी-एजेंट AI समाधान को डिप्लॉय और प्रबंधित करें

---

### 🔍 अध्याय 6: पूर्व-डिप्लॉयमेंट सत्यापन और योजना
**पूर्वापेक्षाएँ**: अध्याय 4 पूरा किया गया  
**अवधि**: 1 घंटा  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- क्षमता योजना और संसाधन सत्यापन
- SKU चयन रणनीतियाँ
- प्री-फ्लाइट चेक और स्वचालन

#### सीखने के संसाधन
- **📊 योजना**: [क्षमता योजना](docs/pre-deployment/capacity-planning.md) - संसाधन सत्यापन
- **💰 चयन**: [SKU चयन](docs/pre-deployment/sku-selection.md) - लागत प्रभावी विकल्प
- **✅ सत्यापन**: [प्री-फ्लाइट चेक](docs/pre-deployment/preflight-checks.md) - स्वचालित स्क्रिप्ट्स

#### व्यावहारिक अभ्यास
- क्षमता सत्यापन स्क्रिप्ट चलाएं
- लागत के लिए SKU चयन अनुकूलित करें
- स्वचालित पूर्व-डिप्लॉयमेंट चेक लागू करें

**💡 अध्याय का परिणाम**: डिप्लॉयमेंट से पहले सत्यापन और अनुकूलन करें

---

### 🚨 अध्याय 7: समस्या निवारण और डिबगिंग
**पूर्वापेक्षाएँ**: कोई भी डिप्लॉयमेंट अध्याय पूरा किया गया  
**अवधि**: 1-1.5 घंटे  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- व्यवस्थित डिबगिंग दृष्टिकोण
- सामान्य समस्याएँ और समाधान
- AI-विशिष्ट समस्या निवारण

#### सीखने के संसाधन
- **🔧 सामान्य समस्याएँ**: [सामान्य समस्याएँ](docs/troubleshooting/common-issues.md) - FAQ और समाधान
- **🕵️ डिबगिंग**: [डिबगिंग गाइड](docs/troubleshooting/debugging.md) - चरण-दर-चरण रणनीतियाँ
- **🤖 AI समस्याएँ**: [AI-विशिष्ट समस्या निवारण](docs/troubleshooting/ai-troubleshooting.md) - AI सेवा समस्याएँ

#### व्यावहारिक अभ्यास
- डिप्लॉयमेंट विफलताओं का निदान करें
- प्रमाणीकरण समस्याओं को हल करें
- AI सेवा कनेक्टिविटी को डिबग करें

**💡 अध्याय का परिणाम**: सामान्य डिप्लॉयमेंट समस्याओं का स्वतंत्र रूप से निदान और समाधान करें

---

### 🏢 अध्याय 8: प्रोडक्शन और एंटरप्राइज पैटर्न
**पूर्वापेक्षाएँ**: अध्याय 1-4 पूरा किया गया  
**अवधि**: 2-3 घंटे  
**जटिलता**: ⭐⭐⭐⭐

#### आप क्या सीखेंगे
- उत्पादन परिनियोजन रणनीतियाँ
- एंटरप्राइज़ सुरक्षा पैटर्न
- निगरानी और लागत अनुकूलन

#### सीखने के संसाधन
- **🏭 उत्पादन**: [उत्पादन AI सर्वोत्तम प्रथाएँ](docs/ai-foundry/production-ai-practices.md) - एंटरप्राइज़ पैटर्न
- **📝 उदाहरण**: [माइक्रोसर्विसेज उदाहरण](../../examples/microservices) - जटिल आर्किटेक्चर
- **📊 निगरानी**: एप्लिकेशन इनसाइट्स इंटीग्रेशन

#### व्यावहारिक अभ्यास
- एंटरप्राइज़ सुरक्षा पैटर्न लागू करें
- व्यापक निगरानी सेट करें
- उचित गवर्नेंस के साथ उत्पादन में परिनियोजन करें

**💡 अध्याय का परिणाम**: पूर्ण उत्पादन क्षमताओं के साथ एंटरप्राइज़-तैयार एप्लिकेशन परिनियोजित करें

---

## 🎓 कार्यशाला अवलोकन: व्यावहारिक सीखने का अनुभव

### इंटरएक्टिव कार्यशाला सामग्री
**ब्राउज़र-आधारित उपकरणों और निर्देशित अभ्यासों के साथ व्यापक व्यावहारिक सीखने का अनुभव**

हमारी कार्यशाला सामग्री अध्याय-आधारित पाठ्यक्रम को पूरक करने के लिए एक संरचित, इंटरएक्टिव सीखने का अनुभव प्रदान करती है। कार्यशाला को स्व-गति से सीखने और प्रशिक्षक-नेतृत्व वाले सत्रों दोनों के लिए डिज़ाइन किया गया है।

#### 🛠️ कार्यशाला की विशेषताएँ
- **ब्राउज़र-आधारित इंटरफ़ेस**: MkDocs-संचालित कार्यशाला जिसमें खोज, कॉपी और थीम सुविधाएँ हैं
- **GitHub Codespaces इंटीग्रेशन**: एक-क्लिक विकास वातावरण सेटअप
- **संरचित सीखने का मार्ग**: 7-चरण निर्देशित अभ्यास (कुल 3.5 घंटे)
- **डिस्कवरी → परिनियोजन → अनुकूलन**: प्रगतिशील कार्यप्रणाली
- **इंटरएक्टिव DevContainer वातावरण**: पूर्व-कॉन्फ़िगर किए गए उपकरण और निर्भरताएँ

#### 📚 कार्यशाला संरचना
कार्यशाला **डिस्कवरी → परिनियोजन → अनुकूलन** कार्यप्रणाली का अनुसरण करती है:

1. **डिस्कवरी चरण** (45 मिनट)
   - Azure AI Foundry टेम्पलेट्स और सेवाओं का अन्वेषण करें
   - मल्टी-एजेंट आर्किटेक्चर पैटर्न को समझें
   - परिनियोजन आवश्यकताओं और पूर्वापेक्षाओं की समीक्षा करें

2. **परिनियोजन चरण** (2 घंटे)
   - AZD के साथ AI एप्लिकेशन का व्यावहारिक परिनियोजन
   - Azure AI सेवाओं और एंडपॉइंट्स को कॉन्फ़िगर करें
   - सुरक्षा और प्रमाणीकरण पैटर्न लागू करें

3. **अनुकूलन चरण** (45 मिनट)
   - विशिष्ट उपयोग मामलों के लिए एप्लिकेशन संशोधित करें
   - उत्पादन परिनियोजन के लिए अनुकूलित करें
   - निगरानी और लागत प्रबंधन लागू करें

#### 🚀 कार्यशाला शुरू करना
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 कार्यशाला सीखने के परिणाम
कार्यशाला पूरी करने पर, प्रतिभागी:
- **उत्पादन AI एप्लिकेशन परिनियोजित करें**: Azure AI Foundry सेवाओं के साथ AZD का उपयोग करें
- **मल्टी-एजेंट आर्किटेक्चर में महारत हासिल करें**: समन्वित AI एजेंट समाधान लागू करें
- **सुरक्षा सर्वोत्तम प्रथाएँ लागू करें**: प्रमाणीकरण और एक्सेस नियंत्रण कॉन्फ़िगर करें
- **स्केल के लिए अनुकूलित करें**: लागत प्रभावी, प्रदर्शनकारी परिनियोजन डिज़ाइन करें
- **परिनियोजन समस्याओं का समाधान करें**: सामान्य मुद्दों को स्वतंत्र रूप से हल करें

#### 📖 कार्यशाला संसाधन
- **🎥 इंटरएक्टिव गाइड**: [कार्यशाला सामग्री](workshop/README.md) - ब्राउज़र-आधारित सीखने का वातावरण
- **📋 चरण-दर-चरण निर्देश**: [निर्देशित अभ्यास](../../workshop/docs/instructions) - विस्तृत वॉकथ्रू
- **🛠️ AI कार्यशाला लैब**: [AI कार्यशाला लैब](docs/ai-foundry/ai-workshop-lab.md) - AI-केंद्रित अभ्यास
- **💡 त्वरित प्रारंभ**: [कार्यशाला सेटअप गाइड](workshop/README.md#quick-start) - वातावरण कॉन्फ़िगरेशन

**उपयुक्त है**: कॉर्पोरेट प्रशिक्षण, विश्वविद्यालय पाठ्यक्रम, स्व-गति से सीखने, और डेवलपर बूटकैंप्स।

---

## 📖 Azure Developer CLI क्या है?

Azure Developer CLI (azd) एक डेवलपर-केंद्रित कमांड-लाइन इंटरफ़ेस है जो Azure पर एप्लिकेशन बनाने और परिनियोजित करने की प्रक्रिया को तेज करता है। यह प्रदान करता है:

- **टेम्पलेट-आधारित परिनियोजन** - सामान्य एप्लिकेशन पैटर्न के लिए पूर्व-निर्मित टेम्पलेट्स का उपयोग करें
- **कोड के रूप में इंफ्रास्ट्रक्चर** - Bicep या Terraform का उपयोग करके Azure संसाधनों का प्रबंधन करें  
- **एकीकृत कार्यप्रवाह** - एप्लिकेशन को प्रावधान, परिनियोजित और मॉनिटर करें
- **डेवलपर-अनुकूल** - डेवलपर उत्पादकता और अनुभव के लिए अनुकूलित

### **AZD + Azure AI Foundry: AI परिनियोजन के लिए आदर्श**

**AI समाधान के लिए AZD क्यों?** AZD उन शीर्ष चुनौतियों को संबोधित करता है जिनका सामना AI डेवलपर्स करते हैं:

- **AI-तैयार टेम्पलेट्स** - Azure OpenAI, Cognitive Services, और ML वर्कलोड्स के लिए पूर्व-कॉन्फ़िगर किए गए टेम्पलेट्स
- **सुरक्षित AI परिनियोजन** - AI सेवाओं, API कुंजियों, और मॉडल एंडपॉइंट्स के लिए अंतर्निहित सुरक्षा पैटर्न  
- **उत्पादन AI पैटर्न** - स्केलेबल, लागत प्रभावी AI एप्लिकेशन परिनियोजन के लिए सर्वोत्तम प्रथाएँ
- **एंड-टू-एंड AI कार्यप्रवाह** - मॉडल विकास से लेकर उचित निगरानी के साथ उत्पादन परिनियोजन तक
- **लागत अनुकूलन** - AI वर्कलोड्स के लिए स्मार्ट संसाधन आवंटन और स्केलिंग रणनीतियाँ
- **Azure AI Foundry इंटीग्रेशन** - AI Foundry मॉडल कैटलॉग और एंडपॉइंट्स से सहज कनेक्शन

---

## 🎯 टेम्पलेट्स और उदाहरण लाइब्रेरी

### विशेष: Azure AI Foundry टेम्पलेट्स
**AI एप्लिकेशन परिनियोजित करने के लिए यहां से शुरू करें!**

| टेम्पलेट | अध्याय | जटिलता | सेवाएँ |
|----------|---------|------------|----------|
| [**AI चैट के साथ शुरुआत करें**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**AI एजेंट्स के साथ शुरुआत करें**](https://github.com/Azure-Samples/get-started-with-ai-agents) | अध्याय 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**मल्टी-एजेंट वर्कफ़्लो ऑटोमेशन**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**अपने डेटा से दस्तावेज़ उत्पन्न करें**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**एजेंट्स के साथ क्लाइंट मीटिंग्स में सुधार करें**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**अपने कोड को एजेंट्स के साथ आधुनिक बनाएं**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**अपना संवादात्मक एजेंट बनाएं**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**संवादात्मक डेटा से अंतर्दृष्टि प्राप्त करें**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**मल्टी-मोडल सामग्री प्रसंस्करण**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### विशेष: पूर्ण सीखने के परिदृश्य
**उत्पादन-तैयार एप्लिकेशन टेम्पलेट्स सीखने के अध्यायों से जुड़े हुए**

| टेम्पलेट | सीखने का अध्याय | जटिलता | प्रमुख सीखने |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | बुनियादी AI परिनियोजन पैटर्न |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | Azure AI Search के साथ RAG कार्यान्वयन |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | अध्याय 4 | ⭐⭐ | दस्तावेज़ इंटेलिजेंस इंटीग्रेशन |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | एजेंट फ्रेमवर्क और फ़ंक्शन कॉलिंग |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐ | एंटरप्राइज़ AI ऑर्केस्ट्रेशन |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | ग्राहक और इन्वेंट्री एजेंट्स के साथ मल्टी-एजेंट आर्किटेक्चर |

### उदाहरण प्रकार के अनुसार सीखना

#### सरल एप्लिकेशन (अध्याय 1-2)
- [सरल वेब ऐप](../../examples/simple-web-app) - बुनियादी परिनियोजन पैटर्न
- [स्थिर वेबसाइट](../../examples/static-site) - स्थिर सामग्री परिनियोजन
- [बुनियादी API](../../examples/basic-api) - REST API परिनियोजन

#### डेटाबेस इंटीग्रेशन (अध्याय 3-4)  
- [डेटाबेस ऐप](../../examples/database-app) - डेटाबेस कनेक्टिविटी पैटर्न
- [डेटा प्रसंस्करण](../../examples/data-processing) - ETL वर्कफ़्लो परिनियोजन

#### उन्नत पैटर्न (अध्याय 4-8)
- [कंटेनर ऐप्स](../../examples/container-app) - कंटेनरीकृत परिनियोजन
- [माइक्रोसर्विसेज](../../examples/microservices) - मल्टी-सर्विस आर्किटेक्चर  
- [एंटरप्राइज़ समाधान](../../examples/enterprise) - उत्पादन-तैयार पैटर्न

### बाहरी टेम्पलेट संग्रह
- [**आधिकारिक AZD टेम्पलेट गैलरी**](https://azure.github.io/awesome-azd/) - आधिकारिक और सामुदायिक टेम्पलेट्स का क्यूरेटेड संग्रह
- [**Azure Developer CLI टेम्पलेट्स**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn टेम्पलेट दस्तावेज़ीकरण
- [**उदाहरण निर्देशिका**](examples/README.md) - विस्तृत व्याख्याओं के साथ स्थानीय सीखने के उदाहरण

---

## 📚 सीखने के संसाधन और संदर्भ

### त्वरित संदर्भ
- [**कमांड चीट शीट**](resources/cheat-sheet.md) - अध्याय के अनुसार आवश्यक azd कमांड
- [**शब्दावली**](resources/glossary.md) - Azure और azd शब्दावली  
- [**FAQ**](resources/faq.md) - सामान्य प्रश्न, सीखने के अध्याय के अनुसार व्यवस्थित
- [**अध्ययन गाइड**](resources/study-guide.md) - व्यापक अभ्यास अभ्यास

### व्यावहारिक कार्यशालाएँ
- [**AI कार्यशाला लैब**](docs/ai-foundry/ai-workshop-lab.md) - अपने AI समाधान को AZD-परिनियोज्य बनाएं (2-3 घंटे)
- [**इंटरएक्टिव कार्यशाला गाइड**](workshop/README.md) - MkDocs और DevContainer वातावरण के साथ ब्राउज़र-आधारित कार्यशाला
- [**संरचित सीखने का मार्ग**](../../workshop/docs/instructions) - 7-चरण निर्देशित अभ्यास (डिस्कवरी → परिनियोजन → अनुकूलन)
- [**AZD शुरुआती कार्यशाला**](workshop/README.md) - GitHub Codespaces इंटीग्रेशन के साथ पूर्ण व्यावहारिक कार्यशाला सामग्री

### बाहरी सीखने के संसाधन
- [Azure Developer CLI दस्तावेज़ीकरण](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर केंद्र](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure मूल्य निर्धारण कैलकुलेटर](https://azure.microsoft.com/pricing/calculator/)
- [Azure स्थिति](https://status.azure.com/)

---

## 🎓 पाठ्यक्रम पूर्णता और प्रमाणन

### प्रगति ट्रैकिंग
प्रत्येक अध्याय के माध्यम से अपनी सीखने की प्रगति को ट्रैक करें:

- [ ] **अध्याय 1**: नींव और त्वरित प्रारंभ ✅
- [ ] **अध्याय 2**: AI-प्रथम विकास ✅  
- [ ] **अध्याय 3**: कॉन्फ़िगरेशन और प्रमाणीकरण ✅
- [ ] **अध्याय 4**: कोड के रूप में इंफ्रास्ट्रक्चर और परिनियोजन ✅
- [ ] **अध्याय 5**: मल्टी-एजेंट AI समाधान ✅
- [ ] **अध्याय 6**: पूर्व-परिनियोजन सत्यापन और योजना ✅
- [ ] **अध्याय 7**: समस्या निवारण और डिबगिंग ✅
- [ ] **अध्याय 8**: उत्पादन और एंटरप्राइज़ पैटर्न ✅

### सीखने का सत्यापन
प्रत्येक अध्याय पूरा करने के बाद, अपने ज्ञान को सत्यापित करें:
1. **व्यावहारिक अभ्यास**: अध्याय के व्यावहारिक परिनियोजन को पूरा करें
2. **ज्ञान जांच**: अपने अध्याय के FAQ अनुभाग की समीक्षा करें
3. **सामुदायिक चर्चा**: Azure Discord में अपना अनुभव साझा करें
4. **अगला अध्याय**: अगले जटिलता स्तर पर जाएं

### पाठ्यक्रम पूर्णता लाभ
सभी अध्याय पूरे करने पर, आपके पास होगा:
- **उत्पादन अनुभव**: वास्तविक AI एप्लिकेशन को Azure पर परिनियोजित किया
- **पेशेवर कौशल**: एंटरप्राइज़-तैयार परिनियोजन क्षमताएँ  
- **सामुदायिक मान्यता**: Azure डेवलपर समुदाय का सक्रिय सदस्य
- **करियर उन्नति**: मांग में AZD और AI परिनियोजन विशेषज्ञता

---

## 🤝 समुदाय और समर्थन

### सहायता प्राप्त करें और समर्थन करें
- **तकनीकी समस्याएँ**: [बग रिपोर्ट करें और फीचर अनुरोध करें](https://github.com/microsoft/azd-for-beginners/issues)
- **सीखने के प्रश्न**: [Microsoft Azure Discord समुदाय](https://discord.gg/microsoft-azure)
- **AI-विशिष्ट सहायता**: AZD + AI Foundry चर्चाओं के लिए [#Azure चैनल](https://discord.gg/microsoft-azure) में शामिल हों
- **दस्तावेज़ीकरण**: [आधिकारिक Azure Developer CLI दस्तावेज़ीकरण](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Azure AI Foundry Discord से सामुदायिक अंतर्दृष्टि

**#Azure चैनल से हाल के पोल परिणाम:**
- **45%** डेवलपर्स AZD का उपयोग AI वर्कलोड्स के लिए करना चाहते हैं
- **शीर्ष चुनौतियाँ**: मल्टी-सर्विस परिनियोजन, क्रेडेंशियल प्रबंधन, उत्पादन तत्परता  
- **सबसे अधिक अनुरोधित**: AI-विशिष्ट टेम्पलेट्स, समस्या निवारण गाइड, सर्वोत्तम प्रथाएँ

**हमारे समुदाय में शामिल हों:**
- अपना AZD + AI अनुभव साझा करें और सहायता प्राप्त करें
- नए AI टेम्पलेट्स के शुरुआती पूर्वावलोकन तक पहुँचें
- AI परिनियोजन सर्वोत्तम प्रथाओं में योगदान करें
- भविष्य के AI + AZD
- **नए उदाहरण**: वास्तविक जीवन के परिदृश्य और टेम्पलेट जोड़ें  
- **अनुवाद**: बहुभाषी समर्थन बनाए रखने में मदद करें  
- **बग रिपोर्ट**: सटीकता और स्पष्टता में सुधार करें  
- **समुदाय मानक**: हमारे समावेशी समुदाय दिशानिर्देशों का पालन करें  

---

## 📄 पाठ्यक्रम जानकारी

### लाइसेंस
यह प्रोजेक्ट MIT लाइसेंस के तहत लाइसेंस प्राप्त है - विवरण के लिए [LICENSE](../../LICENSE) फ़ाइल देखें।

### संबंधित Microsoft लर्निंग संसाधन

हमारी टीम अन्य व्यापक लर्निंग पाठ्यक्रम तैयार करती है:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### Azure / Edge / MCP / एजेंट्स
[![AZD शुरुआती के लिए](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI शुरुआती के लिए](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP शुरुआती के लिए](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI एजेंट्स शुरुआती के लिए](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### जनरेटिव AI सीरीज
[![जनरेटिव AI शुरुआती के लिए](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![जनरेटिव AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![जनरेटिव AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![जनरेटिव AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### मुख्य लर्निंग
[![शुरुआती के लिए ML](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![शुरुआती के लिए डेटा साइंस](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![शुरुआती के लिए AI](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![शुरुआती के लिए साइबर सुरक्षा](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![शुरुआती के लिए वेब डेवलपमेंट](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![शुरुआती के लिए IoT](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![शुरुआती के लिए XR डेवलपमेंट](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot सीरीज
[![AI पेयर्ड प्रोग्रामिंग के लिए Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET के लिए Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot एडवेंचर](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ पाठ्यक्रम नेविगेशन

**🚀 सीखना शुरू करने के लिए तैयार हैं?**

**शुरुआती**: [अध्याय 1: आधारभूत और त्वरित शुरुआत](../..) से शुरू करें  
**AI डेवलपर्स**: [अध्याय 2: AI-प्रथम विकास](../..) पर जाएं  
**अनुभवी डेवलपर्स**: [अध्याय 3: कॉन्फ़िगरेशन और प्रमाणीकरण](../..) से शुरू करें  

**अगले कदम**: [अध्याय 1 - AZD बेसिक्स शुरू करें](docs/getting-started/azd-basics.md) →

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में दस्तावेज़ को आधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।