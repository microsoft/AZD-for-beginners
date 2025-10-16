<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be5fd7bf2b02d878efdb442580d98d96",
  "translation_date": "2025-10-16T15:35:59+00:00",
  "source_file": "README.md",
  "language_code": "ne"
}
-->
# AZD सुरुवातकर्ताहरूका लागि: संरचित सिकाइ यात्रा

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.ne.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## यो पाठ्यक्रम सुरु गर्ने तरिका

तपाईंको AZD सिकाइ यात्रा सुरु गर्न यी चरणहरू पालना गर्नुहोस्:

1. **रिपोजिटरी फोर्क गर्नुहोस्**: क्लिक गर्नुहोस् [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **रिपोजिटरी क्लोन गर्नुहोस्**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **समुदायमा सामेल हुनुहोस्**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) विशेषज्ञ सहयोगका लागि
4. **तपाईंको सिकाइ मार्ग चयन गर्नुहोस्**: तलको अध्यायहरूबाट आफ्नो अनुभव स्तरसँग मेल खाने अध्याय चयन गर्नुहोस्

### बहुभाषी समर्थन

#### स्वचालित अनुवाद (सधैं अद्यावधिक)

[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Marathi](../mr/README.md) | [Nepali](./README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

## पाठ्यक्रमको अवलोकन

Azure Developer CLI (azd) लाई संरचित अध्यायहरू मार्फत मास्टर गर्नुहोस्, प्रगतिशील सिकाइका लागि डिजाइन गरिएको। **Azure AI Foundry एकीकरणको साथ AI एप्लिकेसन तैनातीमा विशेष ध्यान।**

### किन यो पाठ्यक्रम आधुनिक विकासकर्ताहरूका लागि आवश्यक छ

Azure AI Foundry Discord समुदायको अन्तर्दृष्टिमा आधारित, **45% विकासकर्ताहरू AI कार्यभारका लागि AZD प्रयोग गर्न चाहन्छन्** तर निम्न चुनौतीहरूको सामना गर्छन्:
- जटिल बहु-सेवा AI आर्किटेक्चर
- उत्पादन AI तैनातीका लागि उत्तम अभ्यासहरू  
- Azure AI सेवा एकीकरण र कन्फिगरेसन
- AI कार्यभारका लागि लागत अनुकूलन
- AI-विशिष्ट तैनाती समस्याहरूको समाधान

### सिकाइ उद्देश्यहरू

यो संरचित पाठ्यक्रम पूरा गरेर, तपाईं:
- **AZD आधारभूत कुराहरू मास्टर गर्नुहोस्**: कोर अवधारणाहरू, स्थापना, र कन्फिगरेसन
- **AI एप्लिकेसनहरू तैनात गर्नुहोस्**: Azure AI Foundry सेवाहरूको साथ AZD प्रयोग गर्नुहोस्
- **Infrastructure as Code लागू गर्नुहोस्**: Bicep टेम्प्लेटहरूको साथ Azure स्रोतहरू व्यवस्थापन गर्नुहोस्
- **तैनातीहरू समस्या समाधान गर्नुहोस्**: सामान्य समस्याहरू समाधान गर्नुहोस् र डिबग समस्याहरू
- **उत्पादनका लागि अनुकूलन गर्नुहोस्**: सुरक्षा, स्केलिंग, निगरानी, र लागत व्यवस्थापन
- **बहु-एजेन्ट समाधानहरू निर्माण गर्नुहोस्**: जटिल AI आर्किटेक्चर तैनात गर्नुहोस्

## 📚 सिकाइ अध्यायहरू

*अनुभव स्तर र लक्ष्यहरूमा आधारित आफ्नो सिकाइ मार्ग चयन गर्नुहोस्*

### 🚀 अध्याय 1: आधारभूत र छिटो सुरु
**पूर्वापेक्षाहरू**: Azure सदस्यता, आधारभूत कमाण्ड लाइन ज्ञान  
**अवधि**: 30-45 मिनेट  
**जटिलता**: ⭐

#### तपाईंले के सिक्नुहुनेछ
- Azure Developer CLI को आधारभूत कुरा बुझ्दै
- आफ्नो प्लेटफर्ममा AZD स्थापना गर्दै
- आफ्नो पहिलो सफल तैनाती

#### सिकाइ स्रोतहरू
- **🎯 यहाँबाट सुरु गर्नुहोस्**: [Azure Developer CLI के हो?](../..)
- **📖 सिद्धान्त**: [AZD आधारभूत](docs/getting-started/azd-basics.md) - कोर अवधारणाहरू र शब्दावली
- **⚙️ सेटअप**: [स्थापना र सेटअप](docs/getting-started/installation.md) - प्लेटफर्म-विशिष्ट मार्गदर्शनहरू
- **🛠️ व्यावहारिक अभ्यास**: [तपाईंको पहिलो प्रोजेक्ट](docs/getting-started/first-project.md) - चरण-दर-चरण ट्यूटोरियल
- **📋 छिटो सन्दर्भ**: [कमाण्ड चिट शीट](resources/cheat-sheet.md)

#### व्यावहारिक अभ्यासहरू
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 अध्यायको परिणाम**: AZD प्रयोग गरेर Azure मा एक साधारण वेब एप्लिकेसन सफलतापूर्वक तैनात गर्नुहोस्

---

### 🤖 अध्याय 2: AI-प्रथम विकास (AI विकासकर्ताहरूका लागि सिफारिस गरिएको)
**पूर्वापेक्षाहरू**: अध्याय 1 पूरा भएको  
**अवधि**: 1-2 घण्टा  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- AZD संग Azure AI Foundry एकीकरण
- AI-संचालित एप्लिकेसनहरू तैनात गर्दै
- AI सेवा कन्फिगरेसनहरू बुझ्दै

#### सिकाइ स्रोतहरू
- **🎯 यहाँबाट सुरु गर्नुहोस्**: [Azure AI Foundry एकीकरण](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 ढाँचाहरू**: [AI मोडेल तैनाती](docs/ai-foundry/ai-model-deployment.md) - AI मोडेलहरू तैनात र व्यवस्थापन गर्नुहोस्
- **🛠️ कार्यशाला**: [AI कार्यशाला प्रयोगशाला](docs/ai-foundry/ai-workshop-lab.md) - तपाईंको AI समाधानहरू AZD-तयार बनाउनुहोस्
- **🎥 अन्तरक्रियात्मक मार्गदर्शन**: [कार्यशाला सामग्रीहरू](workshop/README.md) - ब्राउजर-आधारित सिकाइ MkDocs * DevContainer Environment
- **📋 टेम्प्लेटहरू**: [Azure AI Foundry टेम्प्लेटहरू](../..)

#### व्यावहारिक अभ्यासहरू
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 अध्यायको परिणाम**: RAG क्षमताहरूको साथ AI-संचालित च्याट एप्लिकेसन तैनात र कन्फिगर गर्नुहोस्

---

### ⚙️ अध्याय 3: कन्फिगरेसन र प्रमाणीकरण
**पूर्वापेक्षाहरू**: अध्याय 1 पूरा भएको  
**अवधि**: 45-60 मिनेट  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- वातावरण कन्फिगरेसन र व्यवस्थापन
- प्रमाणीकरण र सुरक्षा उत्तम अभ्यासहरू
- स्रोत नामकरण र संगठन

#### सिकाइ स्रोतहरू
- **📖 कन्फिगरेसन**: [कन्फिगरेसन मार्गदर्शन](docs/getting-started/configuration.md) - वातावरण सेटअप
- **🔐 सुरक्षा**: प्रमाणीकरण ढाँचाहरू र व्यवस्थापित पहिचान
- **📝 उदाहरणहरू**: [डाटाबेस एप उदाहरण](../../examples/database-app) - कन्फिगरेसन ढाँचाहरू

#### व्यावहारिक अभ्यासहरू
- बहु वातावरणहरू कन्फिगर गर्नुहोस् (डेभ, स्टेजिङ, प्रोड)
- व्यवस्थापित पहिचान प्रमाणीकरण सेटअप गर्नुहोस्
- वातावरण-विशिष्ट कन्फिगरेसनहरू लागू गर्नुहोस्

**💡 अध्यायको परिणाम**: उचित प्रमाणीकरण र सुरक्षाको साथ बहु वातावरणहरू व्यवस्थापन गर्नुहोस्

---

### 🏗️ अध्याय 4: Infrastructure as Code र तैनाती
**पूर्वापेक्षाहरू**: अध्याय 1-3 पूरा भएको  
**अवधि**: 1-1.5 घण्टा  
**जटिलता**: ⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- उन्नत तैनाती ढाँचाहरू
- Bicep को साथ Infrastructure as Code
- स्रोत प्रावधान रणनीतिहरू

#### सिकाइ स्रोतहरू
- **📖 तैनाती**: [तैनाती मार्गदर्शन](docs/deployment/deployment-guide.md) - पूर्ण कार्यप्रवाहहरू
- **🏗️ प्रावधान**: [स्रोत प्रावधान](docs/deployment/provisioning.md) - Azure स्रोत व्यवस्थापन
- **📝 उदाहरणहरू**: [कन्टेनर एप उदाहरण](../../examples/container-app) - कन्टेनराइज्ड तैनातीहरू

#### व्यावहारिक अभ्यासहरू
- अनुकूलित Bicep टेम्प्लेटहरू सिर्जना गर्नुहोस्
- बहु-सेवा एप्लिकेसनहरू तैनात गर्नुहोस्
- ब्लु-ग्रिन तैनाती रणनीतिहरू लागू गर्नुहोस्

**💡 अध्यायको परिणाम**: अनुकूलित Infrastructure टेम्प्लेटहरू प्रयोग गरेर जटिल बहु-सेवा एप्लिकेसनहरू तैनात गर्नुहोस्

---

### 🎯 अध्याय 5: बहु-एजेन्ट AI समाधानहरू (उन्नत)
**पूर्वापेक्षाहरू**: अध्याय 1-2 पूरा भएको  
**अवधि**: 2-3 घण्टा  
**जटिलता**: ⭐⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- बहु-एजेन्ट आर्किटेक्चर ढाँचाहरू
- एजेन्ट समन्वय र व्यवस्थापन
- उत्पादन-तयार AI तैनातीहरू

#### सिकाइ स्रोतहरू
- **🤖 विशेष परियोजना**: [रिटेल बहु-एजेन्ट समाधान](examples/retail-scenario.md) - पूर्ण कार्यान्वयन
- **🛠️ ARM टेम्प्लेटहरू**: [ARM टेम्प्लेट प्याकेज](../../examples/retail-multiagent-arm-template) - एक-क्लिक तैनाती
- **📖 आर्किटेक्चर**: बहु-एजेन्ट समन्वय ढाँचाहरू

#### व्यावहारिक अभ्यासहरू
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 अध्यायको परिणाम**: ग्राहक र इन्वेन्टरी एजेन्टहरूसँग उत्पादन-तयार बहु-एजेन्ट AI समाधान तैनात र व्यवस्थापन गर्नुहोस्

---

### 🔍 अध्याय 6: पूर्व-तैनाती मान्यता र योजना
**पूर्वापेक्षाहरू**: अध्याय 4 पूरा भएको  
**अवधि**: 1 घण्टा  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- क्षमता योजना र स्रोत मान्यता
- SKU चयन रणनीतिहरू
- प्रि-फ्लाइट जाँच र स्वचालन

#### सिकाइ स्रोतहरू
- **📊 योजना**: [क्षमता योजना](docs/pre-deployment/capacity-planning.md) - स्रोत मान्यता
- **💰 चयन**: [SKU चयन](docs/pre-deployment/sku-selection.md) - लागत-प्रभावकारी विकल्पहरू
- **✅ मान्यता**: [प्रि-फ्लाइट जाँच](docs/pre-deployment/preflight-checks.md) - स्वचालित स्क्रिप्टहरू

#### व्यावहारिक अभ्यासहरू
- क्षमता मान्यता स्क्रिप्टहरू चलाउनुहोस्
- लागतको लागि SKU चयनहरू अनुकूलित गर्नुहोस्
- स्वचालित पूर्व-तैनाती जाँचहरू लागू गर्नुहोस्

**💡 अध्यायको परिणाम**: कार्यान्वयन अघि तैनातीहरू मान्यता र अनुकूलित गर्नुहोस्

---

### 🚨 अध्याय 7: समस्या समाधान र डिबगिङ
**पूर्वापेक्षाहरू**: कुनै पनि तैनाती अध्याय पूरा भएको  
**अवधि**: 1-1.5 घण्टा  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- प्रणालीगत डिबगिङ दृष्टिकोणहरू
- सामान्य समस्याहरू र समाधानहरू
- AI-विशिष्ट समस्या समाधान

#### सिकाइ स्रोतहरू
- **🔧 सामान्य समस्याहरू**: [सामान्य समस्याहरू](docs/troubleshooting/common-issues.md) - FAQ र समाधानहरू
- **🕵️ डिबगिङ**: [डिबगिङ मार्गदर्शन](docs/troubleshooting/debugging.md) - चरण-दर-चरण रणनीतिहरू
- **🤖 AI समस्याहरू**: [AI-विशिष्ट समस्या समाधान](docs/troubleshooting/ai-troubleshooting.md) - AI सेवा समस्याहरू

#### व्यावहारिक अभ्यासहरू
- तैनाती असफलताहरू निदान गर्नुहोस्
- प्रमाणीकरण समस्याहरू समाधान गर्नुहोस्
- AI सेवा कनेक्टिविटी डिबग गर्नुहोस्

**💡 अध्यायको परिणाम**: सामान्य तैनाती समस्याहरू स्वतन्त्र रूपमा निदान र समाधान गर्नुहोस्

---

### 🏢 अध्याय 8: उत्पादन र उद्यम ढाँचाहरू
**पूर्वापेक्षाहरू**: अध्याय 1-4 पूरा भएको  
**अवधि**: 2-3 घण्टा  
**जटिलता**: ⭐⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- उत्पादन परिनियोजन रणनीतिहरू
- उद्यम सुरक्षा ढाँचाहरू
- निगरानी र लागत अनुकूलन

#### सिकाइ स्रोतहरू
- **🏭 उत्पादन**: [उत्पादन AI उत्तम अभ्यासहरू](docs/ai-foundry/production-ai-practices.md) - उद्यम ढाँचाहरू
- **📝 उदाहरणहरू**: [माइक्रोसर्भिस उदाहरण](../../examples/microservices) - जटिल आर्किटेक्चरहरू
- **📊 निगरानी**: एप्लिकेसन इनसाइट्स एकीकरण

#### व्यावहारिक अभ्यासहरू
- उद्यम सुरक्षा ढाँचाहरू कार्यान्वयन गर्नुहोस्
- व्यापक निगरानी सेटअप गर्नुहोस्
- उचित शासनसहित उत्पादनमा परिनियोजन गर्नुहोस्

**💡 अध्यायको नतिजा**: पूर्ण उत्पादन क्षमतासहित उद्यम-तयार एप्लिकेसनहरू परिनियोजन गर्नुहोस्

---

## 🎓 कार्यशाला अवलोकन: व्यावहारिक सिकाइ अनुभव

### अन्तरक्रियात्मक कार्यशाला सामग्रीहरू
**ब्राउजर-आधारित उपकरणहरू र निर्देशित अभ्यासहरूसहित व्यापक व्यावहारिक सिकाइ**

हाम्रो कार्यशाला सामग्रीले माथिको अध्याय-आधारित पाठ्यक्रमलाई पूरक गर्ने संरचित, अन्तरक्रियात्मक सिकाइ अनुभव प्रदान गर्दछ। कार्यशाला आत्म-गति सिकाइ र प्रशिक्षक-नेतृत्व सत्रहरूको लागि डिजाइन गरिएको छ।

#### 🛠️ कार्यशाला सुविधाहरू
- **ब्राउजर-आधारित इन्टरफेस**: खोज, प्रतिलिपि, र थिम सुविधाहरू सहित MkDocs-संचालित कार्यशाला
- **GitHub Codespaces एकीकरण**: एक-क्लिक विकास वातावरण सेटअप
- **संरचित सिकाइ पथ**: ७-चरण निर्देशित अभ्यासहरू (कुल ३.५ घण्टा)
- **खोज → परिनियोजन → अनुकूलन**: प्रगतिशील पद्धति
- **इंटरएक्टिभ DevContainer वातावरण**: पूर्व-कन्फिगर गरिएको उपकरणहरू र निर्भरता

#### 📚 कार्यशाला संरचना
कार्यशालाले **खोज → परिनियोजन → अनुकूलन** पद्धति अनुसरण गर्दछ:

1. **खोज चरण** (४५ मिनेट)
   - Azure AI Foundry टेम्प्लेटहरू र सेवाहरू अन्वेषण गर्नुहोस्
   - बहु-एजेन्ट आर्किटेक्चर ढाँचाहरू बुझ्नुहोस्
   - परिनियोजन आवश्यकताहरू र पूर्वापेक्षाहरू समीक्षा गर्नुहोस्

2. **परिनियोजन चरण** (२ घण्टा)
   - AZD सँग AI एप्लिकेसनहरूको व्यावहारिक परिनियोजन
   - Azure AI सेवाहरू र अन्त बिन्दुहरू कन्फिगर गर्नुहोस्
   - सुरक्षा र प्रमाणीकरण ढाँचाहरू कार्यान्वयन गर्नुहोस्

3. **अनुकूलन चरण** (४५ मिनेट)
   - विशिष्ट प्रयोग केसहरूको लागि एप्लिकेसनहरू परिमार्जन गर्नुहोस्
   - उत्पादन परिनियोजनको लागि अनुकूलन गर्नुहोस्
   - निगरानी र लागत व्यवस्थापन कार्यान्वयन गर्नुहोस्

#### 🚀 कार्यशालासँग सुरु गर्नुहोस्
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 कार्यशाला सिकाइ परिणामहरू
कार्यशाला पूरा गरेर, सहभागीहरूले:
- **उत्पादन AI एप्लिकेसनहरू परिनियोजन गर्नुहोस्**: AZD सँग Azure AI Foundry सेवाहरू प्रयोग गर्नुहोस्
- **बहु-एजेन्ट आर्किटेक्चरहरूमा महारत हासिल गर्नुहोस्**: समन्वित AI एजेन्ट समाधानहरू कार्यान्वयन गर्नुहोस्
- **सुरक्षा उत्तम अभ्यासहरू कार्यान्वयन गर्नुहोस्**: प्रमाणीकरण र पहुँच नियन्त्रण कन्फिगर गर्नुहोस्
- **मापनको लागि अनुकूलन गर्नुहोस्**: लागत-प्रभावकारी, प्रदर्शन परिनियोजनहरू डिजाइन गर्नुहोस्
- **परिनियोजन समस्या समाधान गर्नुहोस्**: सामान्य समस्याहरू स्वतन्त्र रूपमा समाधान गर्नुहोस्

#### 📖 कार्यशाला स्रोतहरू
- **🎥 अन्तरक्रियात्मक मार्गदर्शक**: [कार्यशाला सामग्रीहरू](workshop/README.md) - ब्राउजर-आधारित सिकाइ वातावरण
- **📋 चरण-दर-चरण निर्देशनहरू**: [निर्देशित अभ्यासहरू](../../workshop/docs/instructions) - विस्तृत वाकथ्रुहरू
- **🛠️ AI कार्यशाला प्रयोगशाला**: [AI कार्यशाला प्रयोगशाला](docs/ai-foundry/ai-workshop-lab.md) - AI-केंद्रित अभ्यासहरू
- **💡 छिटो सुरु**: [कार्यशाला सेटअप मार्गदर्शक](workshop/README.md#quick-start) - वातावरण कन्फिगरेसन

**उपयुक्त**: कर्पोरेट प्रशिक्षण, विश्वविद्यालय पाठ्यक्रमहरू, आत्म-गति सिकाइ, र विकासकर्ता बुटक्याम्पहरू।

---

## 📖 Azure Developer CLI के हो?

Azure Developer CLI (azd) एक विकासकर्ता-केंद्रित कमाण्ड-लाइन इन्टरफेस हो जसले Azure मा एप्लिकेसन निर्माण र परिनियोजन प्रक्रियालाई तीव्र बनाउँछ। यसले निम्न प्रदान गर्दछ:

- **टेम्प्लेट-आधारित परिनियोजनहरू** - सामान्य एप्लिकेसन ढाँचाहरूको लागि पूर्व-निर्मित टेम्प्लेटहरू प्रयोग गर्नुहोस्
- **कोडको रूपमा पूर्वाधार** - Bicep वा Terraform प्रयोग गरेर Azure स्रोतहरू व्यवस्थापन गर्नुहोस्  
- **एकीकृत कार्यप्रवाहहरू** - एप्लिकेसनहरू सहज रूपमा प्रावधान, परिनियोजन, र निगरानी गर्नुहोस्
- **विकासकर्ता-अनुकूल** - विकासकर्ता उत्पादकता र अनुभवको लागि अनुकूलित

### **AZD + Azure AI Foundry: AI परिनियोजनहरूको लागि उत्तम**

**AI समाधानहरूको लागि किन AZD?** AZD ले AI विकासकर्ताहरूले सामना गर्ने शीर्ष चुनौतीहरूलाई सम्बोधन गर्दछ:

- **AI-तयार टेम्प्लेटहरू** - Azure OpenAI, Cognitive Services, र ML वर्कलोडहरूको लागि पूर्व-कन्फिगर गरिएको टेम्प्लेटहरू
- **सुरक्षित AI परिनियोजनहरू** - AI सेवाहरू, API कुञ्जीहरू, र मोडेल अन्त बिन्दुहरूको लागि निर्मित सुरक्षा ढाँचाहरू  
- **उत्पादन AI ढाँचाहरू** - मापनयोग्य, लागत-प्रभावकारी AI एप्लिकेसन परिनियोजनको लागि उत्तम अभ्यासहरू
- **एन्ड-टु-एन्ड AI कार्यप्रवाहहरू** - मोडेल विकासदेखि उत्पादन परिनियोजनसम्म उचित निगरानीसहित
- **लागत अनुकूलन** - AI वर्कलोडहरूको लागि स्मार्ट स्रोत आवंटन र मापन रणनीतिहरू
- **Azure AI Foundry एकीकरण** - AI Foundry मोडेल क्याटलग र अन्त बिन्दुहरूसँग सहज कनेक्शन

---

## 🎯 टेम्प्लेटहरू र उदाहरण पुस्तकालय

### विशेष: Azure AI Foundry टेम्प्लेटहरू
**यदि तपाईं AI एप्लिकेसनहरू परिनियोजन गर्दै हुनुहुन्छ भने यहाँबाट सुरु गर्नुहोस्!**

| टेम्प्लेट | अध्याय | जटिलता | सेवाहरू |
|----------|---------|------------|----------|
| [**AI च्याटसँग सुरु गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय २ | ⭐⭐ | AzureOpenAI + Azure AI मोडेल इनफरेन्स API + Azure AI खोज + Azure कन्टेनर एप्स + एप्लिकेसन इनसाइट्स |
| [**AI एजेन्टसँग सुरु गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-agents) | अध्याय २ | ⭐⭐ | Azure AI एजेन्ट सेवा + AzureOpenAI + Azure AI खोज + Azure कन्टेनर एप्स + एप्लिकेसन इनसाइट्स|
| [**बहु-एजेन्ट कार्यप्रवाह स्वचालन**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय ५ | ⭐⭐⭐ | AzureOpenAI + Azure AI एजेन्ट सेवा + सेम्यान्टिक कर्नेल + Azure CosmosDB + Azure कन्टेनर एप्स|
| [**तपाईंको डाटाबाट कागजातहरू उत्पन्न गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय ४ | ⭐⭐⭐  | AzureOpenAI + Azure AI खोज + Azure AI सेवाहरू + Azure CosmosDB|
| [**एजेन्टहरूसँग ग्राहक बैठकहरू सुधार गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय ५ | ⭐⭐⭐| AzureOpenAI + Azure AI खोज + Azure CosmosDB + Azure SQL Database |
| [**एजेन्टहरूसँग तपाईंको कोड आधुनिक बनाउनुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय ५ | ⭐⭐⭐ | AzureOpenAI + Azure एजेन्ट सेवा + सेम्यान्टिक कर्नेल + Azure CosmosDB + Azure कन्टेनर एप्स|
| [**तपाईंको संवादात्मक एजेन्ट निर्माण गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय ४ | ⭐⭐⭐ | AI भाषा + AzureOpenAI + AI खोज + Azure स्टोरेज + Azure कन्टेनर रजिस्ट्री|
| [**संवादात्मक डाटाबाट अन्तर्दृष्टि अनलक गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय ८ | ⭐⭐⭐ | AzureOpenAI + AI खोज + सेम्यान्टिक कर्नेल + Azure एजेन्ट सेवा + AI सामग्री बुझाइ|
| [**बहु-मोडल सामग्री प्रशोधन**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय ८ | ⭐⭐⭐⭐ | AzureOpenAI + Azure सामग्री बुझाइ + Azure CosmosDB + Azure कन्टेनर एप्स|

### विशेष: पूर्ण सिकाइ परिदृश्यहरू
**उत्पादन-तयार एप्लिकेसन टेम्प्लेटहरू सिकाइ अध्यायहरूसँग मिलाइएको**

| टेम्प्लेट | सिकाइ अध्याय | जटिलता | मुख्य सिकाइ |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय २ | ⭐ | आधारभूत AI परिनियोजन ढाँचाहरू |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय २ | ⭐⭐ | Azure AI खोजको साथ RAG कार्यान्वयन |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | अध्याय ४ | ⭐⭐ | कागजात बुद्धिमत्ता एकीकरण |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय ५ | ⭐⭐⭐ | एजेन्ट फ्रेमवर्क र कार्य कलिंग |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | अध्याय ८ | ⭐⭐⭐ | उद्यम AI समन्वय |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | अध्याय ५ | ⭐⭐⭐⭐ | ग्राहक र इन्वेन्टरी एजेन्टहरूसँग बहु-एजेन्ट आर्किटेक्चर |

### उदाहरण प्रकारद्वारा सिकाइ

#### सरल एप्लिकेसनहरू (अध्याय १-२)
- [सरल वेब एप](../../examples/simple-web-app) - आधारभूत परिनियोजन ढाँचाहरू
- [स्थिर वेबसाइट](../../examples/static-site) - स्थिर सामग्री परिनियोजन
- [आधारभूत API](../../examples/basic-api) - REST API परिनियोजन

#### डाटाबेस एकीकरण (अध्याय ३-४)  
- [डाटाबेस एप](../../examples/database-app) - डाटाबेस कनेक्टिविटी ढाँचाहरू
- [डाटा प्रशोधन](../../examples/data-processing) - ETL कार्यप्रवाह परिनियोजन

#### उन्नत ढाँचाहरू (अध्याय ४-८)
- [कन्टेनर एप्स](../../examples/container-app) - कन्टेनराइज्ड परिनियोजनहरू
- [माइक्रोसर्भिसहरू](../../examples/microservices) - बहु-सेवा आर्किटेक्चरहरू  
- [उद्यम समाधानहरू](../../examples/enterprise) - उत्पादन-तयार ढाँचाहरू

### बाह्य टेम्प्लेट संग्रहहरू
- [**आधिकारिक AZD टेम्प्लेट ग्यालरी**](https://azure.github.io/awesome-azd/) - आधिकारिक र समुदाय टेम्प्लेटहरूको क्युरेटेड संग्रह
- [**Azure Developer CLI टेम्प्लेटहरू**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn टेम्प्लेट दस्तावेज
- [**उदाहरण निर्देशिका**](examples/README.md) - विस्तृत व्याख्याहरू सहित स्थानीय सिकाइ उदाहरणहरू

---

## 📚 सिकाइ स्रोतहरू र सन्दर्भहरू

### छिटो सन्दर्भहरू
- [**कमाण्ड चिट शीट**](resources/cheat-sheet.md) - अध्यायद्वारा संगठित आवश्यक azd कमाण्डहरू
- [**शब्दावली**](resources/glossary.md) - Azure र azd शब्दावली  
- [**FAQ**](resources/faq.md) - सिकाइ अध्यायद्वारा संगठित सामान्य प्रश्नहरू
- [**अध्ययन मार्गदर्शक**](resources/study-guide.md) - व्यापक अभ्यासहरू

### व्यावहारिक कार्यशालाहरू
- [**AI कार्यशाला प्रयोगशाला**](docs/ai-foundry/ai-workshop-lab.md) - तपाईंको AI समाधानहरू AZD-परिनियोज्य बनाउनुहोस् (२-३ घण्टा)
- [**अन्तरक्रियात्मक कार्यशाला मार्गदर्शक**](workshop/README.md) - MkDocs र DevContainer वातावरणसहित ब्राउजर-आधारित कार्यशाला
- [**संरचित सिकाइ पथ**](../../workshop/docs/instructions) - खोज → परिनियोजन → अनुकूलनको ७-चरण निर्देशित अभ्यासहरू
- [**AZD को लागि शुरुआती कार्यशाला**](workshop/README.md) - GitHub Codespaces एकीकरणसहित पूर्ण व्यावहारिक कार्यशाला सामग्रीहरू

### बाह्य सिकाइ स्रोतहरू
- [Azure Developer CLI दस्तावेज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर केन्द्र](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure मूल्य गणक](https://azure.microsoft.com/pricing/calculator/)
- [Azure स्थिति](https://status.azure.com/)

---

## 🎓 पाठ्यक्रम पूरा र प्रमाणपत्र

### प्रगति ट्र्याकिङ
प्रत्येक अध्याय मार्फत तपाईंको सिकाइ प्रगति ट्र्याक गर्नुहोस्:

- [ ] **अध्याय १**: आधारभूत र छिटो सुरु ✅
- [ ] **अध्याय २**: AI-प्रथम विकास ✅  
- [ ] **अध्याय ३**: कन्फिगरेसन र प्रमाणीकरण ✅
- [ ] **अध्याय ४**: कोडको रूपमा पूर्वाधार र परिनियोजन ✅
- [ ] **अध्याय ५**: बहु-एजेन्ट AI समाधानहरू ✅
- [ ] **अध्याय ६**: पूर्व-परिनियोजन मान्यता र योजना ✅
- [ ] **अध्याय ७**: समस्या समाधान र डिबगिङ ✅
- [ ] **अध्याय ८**: उत्पादन र उद्यम ढाँचाहरू ✅

### सिकाइ प्रमाणीकरण
प्रत्येक अध्याय पूरा गरेपछि, तपाईंको ज्ञान प्रमाणित गर्नुहोस्:
1. **व्यावहारिक अभ्यास**: अध्यायको व्यावहारिक परिनियोजन पूरा गर्नुहोस्
2. **ज्ञान जाँच**: तपाईंको अध्यायको लागि FAQ खण्ड समीक्षा गर्नुहोस्
3. **समुदाय छलफल**: Azure Discord मा तपाईंको अनुभव साझा गर्नुहोस्
4. **अर्को अध्याय**: अर्को जटिलता स्तरमा जानुहोस्

### पाठ्यक्रम पूरा लाभहरू
सबै अध्यायहरू पूरा गरेपछि, तपाईंले:
- **उत्पादन अनुभव**: वास्तविक AI एप्लिकेसनहरू Azure मा परिनियोजन गर्नुभयो
- **व्यावसायिक सीपहरू**: उद्यम-तयार परिनियोजन क्षमताहरू  
- **समुदाय मान्यता**: Azure विकासकर्ता समुदायको सक्रिय सदस्य
- **क्यारियर उन्नति**: मागमा AZD र AI परिनियोजन विशेषज्ञता

---

## 🤝 समुदाय र सहयोग

### सहयोग प्राप्त गर्नुहोस्
- **प्राविधिक समस्या**: [बग रिपोर्ट गर्नुहोस् र सुविधाहरू अनुरोध गर्नुहोस्](https://github.com/microsoft/azd-for-beginners/issues)
- **सिकाइ प्रश्नहरू**: [Microsoft Azure Discord समुदाय](https://discord.gg/microsoft-azure)
- **AI-विशिष्ट सहयोग**: AZD + AI Foundry छलफलहरूको लागि [#Azure च्यानल](https://discord.gg/microsoft-azure) मा सामेल हुनुहोस्
- **दस्तावेज**: [आधिकारिक Azure Developer CLI दस्तावेज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Azure AI Foundry Discord बाट समुदाय अन्तर्दृष्टि

**#Azure च्यानलबाट हालको सर्वेक्षण परिणामहरू:**
- **४५%** विकासकर्ताहरूले AI वर्कलोडहरूको लागि AZD प्रयोग गर्न चाहन्छन्
- **शीर्ष चुनौतीहरू**: बहु-सेवा परिनियोजनहरू, प्रमाणपत्र व्यवस्थापन, उत्पादन तयारी  
- **सबैभन्दा धेरै अनुरोध गरिएको**: AI-
- **नयाँ उदाहरणहरू**: वास्तविक जीवनका परिदृश्यहरू र टेम्प्लेटहरू थप्नुहोस्  
- **अनुवाद**: बहुभाषिक समर्थन कायम गर्न मद्दत गर्नुहोस्  
- **बग रिपोर्टहरू**: शुद्धता र स्पष्टता सुधार गर्नुहोस्  
- **समुदायका मापदण्डहरू**: हाम्रो समावेशी समुदाय दिशानिर्देशहरू पालना गर्नुहोस्  

---

## 📄 पाठ्यक्रम जानकारी

### लाइसेन्स
यो परियोजना MIT लाइसेन्स अन्तर्गत लाइसेन्स गरिएको छ - विवरणका लागि [LICENSE](../../LICENSE) फाइल हेर्नुहोस्।

### सम्बन्धित माइक्रोसफ्ट सिकाइ स्रोतहरू

हाम्रो टोलीले अन्य व्यापक सिकाइ पाठ्यक्रमहरू उत्पादन गर्दछ:

- [Model Context Protocol (MCP) For Beginners](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agents for Beginners](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI for Beginners using .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generative AI for Beginners](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI for Beginners using Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML for Beginners](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science for Beginners](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI for Beginners](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Cybersecurity for Beginners](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web Dev for Beginners](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT for Beginners](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR Development for Beginners](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Mastering GitHub Copilot for AI Paired Programming](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Mastering GitHub Copilot for C#/.NET Developers](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Choose Your Own Copilot Adventure](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ पाठ्यक्रम नेभिगेसन

**🚀 सिक्न सुरु गर्न तयार?**

**सुरुवातकर्ता**: [अध्याय १: आधारभूत र छिटो सुरु](../..) बाट सुरु गर्नुहोस्  
**AI विकासकर्ता**: [अध्याय २: AI-प्रथम विकास](../..) मा जानुहोस्  
**अनुभवी विकासकर्ता**: [अध्याय ३: कन्फिगरेसन र प्रमाणीकरण](../..) बाट सुरु गर्नुहोस्  

**अर्को चरणहरू**: [अध्याय १ सुरु गर्नुहोस् - AZD आधारभूत](docs/getting-started/azd-basics.md) →

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। यसको मूल भाषा मा रहेको दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।