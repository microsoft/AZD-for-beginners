<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-17T19:54:54+00:00",
  "source_file": "README.md",
  "language_code": "ne"
}
-->
# AZD सुरुवातकर्ताहरूका लागि: संरचित सिकाइ यात्रा

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.ne.png) 

## यो पाठ्यक्रम सुरु गर्ने तरिका

तपाईंको AZD सिकाइ यात्रा सुरु गर्न यी चरणहरू पालना गर्नुहोस्:

1. **रिपोजिटरी फोर्क गर्नुहोस्**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork) मा क्लिक गर्नुहोस्।
2. **रिपोजिटरी क्लोन गर्नुहोस्**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **समुदायमा सामेल हुनुहोस्**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) मा विशेषज्ञ समर्थनको लागि सामेल हुनुहोस्।
4. **तपाईंको सिकाइ मार्ग चयन गर्नुहोस्**: तलको अध्यायहरूबाट आफ्नो अनुभव स्तरसँग मेल खाने अध्याय चयन गर्नुहोस्।

### बहुभाषी समर्थन

#### स्वचालित अनुवाद (सधैं अद्यावधिक)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](./README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

## पाठ्यक्रमको अवलोकन

Azure Developer CLI (azd) लाई संरचित अध्यायहरू मार्फत मास्टर गर्नुहोस्, जसले क्रमिक सिकाइ सुनिश्चित गर्दछ। **Azure AI Foundry एकीकरणको साथ AI अनुप्रयोग परिनियोजनमा विशेष ध्यान।**

### किन यो पाठ्यक्रम आधुनिक विकासकर्ताहरूका लागि आवश्यक छ

Azure AI Foundry Discord समुदायको अन्तर्दृष्टिमा आधारित, **45% विकासकर्ताहरूले AI कार्यभारका लागि AZD प्रयोग गर्न चाहन्छन्**, तर निम्न चुनौतीहरूको सामना गर्छन्:
- जटिल बहु-सेवा AI आर्किटेक्चर
- उत्पादन AI परिनियोजनका उत्कृष्ट अभ्यासहरू  
- Azure AI सेवा एकीकरण र कन्फिगरेसन
- AI कार्यभारको लागत अनुकूलन
- AI-विशिष्ट परिनियोजन समस्याहरूको समाधान

### सिकाइ उद्देश्यहरू

यो संरचित पाठ्यक्रम पूरा गरेर, तपाईं:
- **AZD को आधारभूत ज्ञान प्राप्त गर्नुहोस्**: कोर अवधारणाहरू, स्थापना, र कन्फिगरेसन
- **AI अनुप्रयोगहरू परिनियोजन गर्नुहोस्**: AZD लाई Azure AI Foundry सेवाहरूको साथ प्रयोग गर्नुहोस्
- **Infrastructure as Code लागू गर्नुहोस्**: Bicep टेम्प्लेटहरूको साथ Azure स्रोतहरू व्यवस्थापन गर्नुहोस्
- **परिनियोजन समस्याहरू समाधान गर्नुहोस्**: सामान्य समस्याहरू समाधान गर्नुहोस् र डिबग गर्नुहोस्
- **उत्पादनको लागि अनुकूलन गर्नुहोस्**: सुरक्षा, स्केलिङ, निगरानी, र लागत व्यवस्थापन
- **बहु-एजेन्ट समाधानहरू निर्माण गर्नुहोस्**: जटिल AI आर्किटेक्चर परिनियोजन गर्नुहोस्

## 📚 सिकाइ अध्यायहरू

*तपाईंको अनुभव स्तर र लक्ष्यहरूमा आधारित सिकाइ मार्ग चयन गर्नुहोस्*

### 🚀 अध्याय 1: आधारभूत र छिटो सुरु
**पूर्वापेक्षाहरू**: Azure सदस्यता, आधारभूत कमाण्ड लाइन ज्ञान  
**अवधि**: 30-45 मिनेट  
**जटिलता**: ⭐

#### तपाईंले के सिक्नुहुनेछ
- Azure Developer CLI को आधारभूत ज्ञान
- तपाईंको प्लेटफर्ममा AZD स्थापना
- पहिलो सफल परिनियोजन

#### सिकाइ स्रोतहरू
- **🎯 यहाँ सुरु गर्नुहोस्**: [Azure Developer CLI के हो?](../..)
- **📖 सिद्धान्त**: [AZD आधारभूत](docs/getting-started/azd-basics.md) - कोर अवधारणाहरू र शब्दावली
- **⚙️ सेटअप**: [स्थापना र सेटअप](docs/getting-started/installation.md) - प्लेटफर्म-विशिष्ट मार्गदर्शन
- **🛠️ व्यावहारिक कार्य**: [तपाईंको पहिलो परियोजना](docs/getting-started/first-project.md) - चरण-दर-चरण ट्यूटोरियल
- **📋 छिटो सन्दर्भ**: [कमाण्ड चिट शीट](resources/cheat-sheet.md)

#### व्यावहारिक अभ्यासहरू
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 अध्यायको नतिजा**: AZD प्रयोग गरेर Azure मा एक साधारण वेब अनुप्रयोग सफलतापूर्वक परिनियोजन गर्नुहोस्

---

### 🤖 अध्याय 2: AI-प्रथम विकास (AI विकासकर्ताहरूका लागि सिफारिस गरिएको)
**पूर्वापेक्षाहरू**: अध्याय 1 पूरा  
**अवधि**: 1-2 घण्टा  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- AZD संग Azure AI Foundry एकीकरण
- AI-संचालित अनुप्रयोगहरू परिनियोजन
- AI सेवा कन्फिगरेसनको समझ

#### सिकाइ स्रोतहरू
- **🎯 यहाँ सुरु गर्नुहोस्**: [Azure AI Foundry एकीकरण](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 ढाँचाहरू**: [AI मोडेल परिनियोजन](docs/ai-foundry/ai-model-deployment.md) - AI मोडेल व्यवस्थापन
- **🛠️ कार्यशाला**: [AI कार्यशाला प्रयोगशाला](docs/ai-foundry/ai-workshop-lab.md) - तपाईंको AI समाधानहरू AZD-तयार बनाउनुहोस्
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

**💡 अध्यायको नतिजा**: RAG क्षमता भएको AI-संचालित च्याट अनुप्रयोग परिनियोजन र कन्फिगर गर्नुहोस्

---

### ⚙️ अध्याय 3: कन्फिगरेसन र प्रमाणीकरण
**पूर्वापेक्षाहरू**: अध्याय 1 पूरा  
**अवधि**: 45-60 मिनेट  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- वातावरण कन्फिगरेसन र व्यवस्थापन
- प्रमाणीकरण र सुरक्षा उत्कृष्ट अभ्यासहरू
- स्रोत नामकरण र संगठन

#### सिकाइ स्रोतहरू
- **📖 कन्फिगरेसन**: [कन्फिगरेसन मार्गदर्शन](docs/getting-started/configuration.md) - वातावरण सेटअप
- **🔐 सुरक्षा**: प्रमाणीकरण ढाँचाहरू र व्यवस्थापित पहिचान
- **📝 उदाहरणहरू**: [डाटाबेस अनुप्रयोग उदाहरण](../../examples/database-app) - कन्फिगरेसन ढाँचाहरू

#### व्यावहारिक अभ्यासहरू
- बहु वातावरणहरू (डेभ, स्टेजिङ, प्रोड) कन्फिगर गर्नुहोस्
- व्यवस्थापित पहिचान प्रमाणीकरण सेटअप गर्नुहोस्
- वातावरण-विशिष्ट कन्फिगरेसनहरू लागू गर्नुहोस्

**💡 अध्यायको नतिजा**: उचित प्रमाणीकरण र सुरक्षासहित बहु वातावरणहरू व्यवस्थापन गर्नुहोस्

---

### 🏗️ अध्याय 4: Infrastructure as Code र परिनियोजन
**पूर्वापेक्षाहरू**: अध्याय 1-3 पूरा  
**अवधि**: 1-1.5 घण्टा  
**जटिलता**: ⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- उन्नत परिनियोजन ढाँचाहरू
- Bicep को साथ Infrastructure as Code
- स्रोत प्रावधान रणनीतिहरू

#### सिकाइ स्रोतहरू
- **📖 परिनियोजन**: [परिनियोजन मार्गदर्शन](docs/deployment/deployment-guide.md) - पूर्ण कार्यप्रवाहहरू
- **🏗️ प्रावधान**: [स्रोत प्रावधान](docs/deployment/provisioning.md) - Azure स्रोत व्यवस्थापन
- **📝 उदाहरणहरू**: [कन्टेनर अनुप्रयोग उदाहरण](../../examples/container-app) - कन्टेनराइज्ड परिनियोजन

#### व्यावहारिक अभ्यासहरू
- अनुकूलित Bicep टेम्प्लेटहरू सिर्जना गर्नुहोस्
- बहु-सेवा अनुप्रयोगहरू परिनियोजन गर्नुहोस्
- ब्लू-ग्रीन परिनियोजन रणनीतिहरू लागू गर्नुहोस्

**💡 अध्यायको नतिजा**: अनुकूलित Infrastructure टेम्प्लेटहरू प्रयोग गरेर जटिल बहु-सेवा अनुप्रयोगहरू परिनियोजन गर्नुहोस्

---

### 🎯 अध्याय 5: बहु-एजेन्ट AI समाधानहरू (उन्नत)
**पूर्वापेक्षाहरू**: अध्याय 1-2 पूरा  
**अवधि**: 2-3 घण्टा  
**जटिलता**: ⭐⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- बहु-एजेन्ट आर्किटेक्चर ढाँचाहरू
- एजेन्ट समन्वय र व्यवस्थापन
- उत्पादन-तयार AI परिनियोजन

#### सिकाइ स्रोतहरू
- **🤖 विशेष परियोजना**: [खुद्रा बहु-एजेन्ट समाधान](examples/retail-scenario.md) - पूर्ण कार्यान्वयन
- **🛠️ ARM टेम्प्लेटहरू**: [ARM टेम्प्लेट प्याकेज](../../examples/retail-multiagent-arm-template) - एक-क्लिक परिनियोजन
- **📖 आर्किटेक्चर**: बहु-एजेन्ट समन्वय ढाँचाहरू

#### व्यावहारिक अभ्यासहरू
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 अध्यायको नतिजा**: ग्राहक र इन्वेन्टरी एजेन्टहरूसहित उत्पादन-तयार बहु-एजेन्ट AI समाधान परिनियोजन र व्यवस्थापन गर्नुहोस्

---

### 🔍 अध्याय 6: पूर्व-परिनियोजन मान्यता र योजना
**पूर्वापेक्षाहरू**: अध्याय 4 पूरा  
**अवधि**: 1 घण्टा  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- क्षमता योजना र स्रोत मान्यता
- SKU चयन रणनीतिहरू
- पूर्व-उडान जाँच र स्वचालन

#### सिकाइ स्रोतहरू
- **📊 योजना**: [क्षमता योजना](docs/pre-deployment/capacity-planning.md) - स्रोत मान्यता
- **💰 चयन**: [SKU चयन](docs/pre-deployment/sku-selection.md) - लागत-प्रभावी विकल्पहरू
- **✅ मान्यता**: [पूर्व-उडान जाँच](docs/pre-deployment/preflight-checks.md) - स्वचालित स्क्रिप्टहरू

#### व्यावहारिक अभ्यासहरू
- क्षमता मान्यता स्क्रिप्टहरू चलाउनुहोस्
- लागतको लागि SKU चयनहरू अनुकूलित गर्नुहोस्
- स्वचालित पूर्व-परिनियोजन जाँचहरू लागू गर्नुहोस्

**💡 अध्यायको नतिजा**: परिनियोजन अघि मान्यता र अनुकूलन गर्नुहोस्

---

### 🚨 अध्याय 7: समस्या समाधान र डिबगिङ
**पूर्वापेक्षाहरू**: कुनै पनि परिनियोजन अध्याय पूरा  
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
- परिनियोजन असफलताहरू निदान गर्नुहोस्
- प्रमाणीकरण समस्याहरू समाधान गर्नुहोस्
- AI सेवा कनेक्टिविटी डिबग गर्नुहोस्

**💡 अध्यायको नतिजा**: सामान्य परिनियोजन समस्याहरू स्वतन्त्र रूपमा निदान र समाधान गर्नुहोस्

---

### 🏢 अध्याय 8: उत्पादन र उद्यम ढाँचाहरू
**पूर्वापेक्षाहरू**: अध्याय 1-4 पूरा  
**अवधि**: 2-3 घण्टा  
**जटिलता**: ⭐⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- उत्पादन परिनियोजन रणनीतिहरू
- उद्यम सुरक्षा ढाँचाहरू
- निगरानी र लागत अनुकूलन

#### सिकाइ स्रोतहरू
- **🏭 उत्पादन**: [उत्पादन AI उत्कृष्ट अभ्यासहरू](docs/ai-foundry/production-ai-practices.md) - उद्यम ढाँचाहरू
- **📝 उदाहरणहरू**: [माइक्रोसर्भिस उदाहरण](../../examples/microservices) - जटिल आर्किटेक्चर
- **📊 अनुगमन**: एप्लिकेसन इनसाइट्स एकीकरण

#### व्यावहारिक अभ्यासहरू
- उद्यम सुरक्षा ढाँचाहरू कार्यान्वयन गर्नुहोस्
- व्यापक अनुगमन सेटअप गर्नुहोस्
- उचित शासनसहित उत्पादनमा तैनात गर्नुहोस्

**💡 अध्यायको परिणाम**: पूर्ण उत्पादन क्षमतासहित उद्यम-तयार एप्लिकेसनहरू तैनात गर्नुहोस्

---

## 📖 Azure Developer CLI के हो?

Azure Developer CLI (azd) एक विकासकर्ता-केंद्रित कमाण्ड-लाइन इन्टरफेस हो जसले Azure मा एप्लिकेसन निर्माण र तैनात गर्ने प्रक्रियालाई तीव्र बनाउँछ। यसले निम्न सुविधा प्रदान गर्दछ:

- **टेम्प्लेट-आधारित तैनातीहरू** - सामान्य एप्लिकेसन ढाँचाहरूका लागि पूर्व-निर्मित टेम्प्लेटहरू प्रयोग गर्नुहोस्
- **कोडको रूपमा पूर्वाधार** - Bicep वा Terraform प्रयोग गरेर Azure स्रोतहरू व्यवस्थापन गर्नुहोस्  
- **एकीकृत कार्यप्रवाहहरू** - एप्लिकेसनहरू सहज रूपमा प्रावधान, तैनात, र अनुगमन गर्नुहोस्
- **विकासकर्ता-अनुकूल** - विकासकर्ता उत्पादकता र अनुभवका लागि अनुकूलित

### **AZD + Azure AI Foundry: AI तैनातीका लागि उत्तम**

**AI समाधानहरूको लागि AZD किन?** AZD ले AI विकासकर्ताहरूले सामना गर्ने प्रमुख चुनौतीहरू समाधान गर्दछ:

- **AI-तयार टेम्प्लेटहरू** - Azure OpenAI, Cognitive Services, र ML कार्यभारहरूको लागि पूर्व-कन्फिगर गरिएको टेम्प्लेटहरू
- **सुरक्षित AI तैनातीहरू** - AI सेवाहरू, API कुञ्जीहरू, र मोडेल अन्त बिन्दुहरूको लागि निर्मित सुरक्षा ढाँचाहरू  
- **उत्पादन AI ढाँचाहरू** - मापनयोग्य, लागत-प्रभावकारी AI एप्लिकेसन तैनातीका लागि उत्कृष्ट अभ्यासहरू
- **सम्पूर्ण AI कार्यप्रवाहहरू** - मोडेल विकासदेखि उत्पादन तैनातीसम्म उचित अनुगमनका साथ
- **लागत अनुकूलन** - AI कार्यभारहरूको लागि स्मार्ट स्रोत आवंटन र मापन रणनीतिहरू
- **Azure AI Foundry एकीकरण** - AI Foundry मोडेल क्याटलग र अन्त बिन्दुहरूसँग सहज कनेक्शन

---

## 🎯 टेम्प्लेटहरू र उदाहरण पुस्तकालय

### विशेष: Azure AI Foundry टेम्प्लेटहरू
**यदि तपाईं AI एप्लिकेसनहरू तैनात गर्दै हुनुहुन्छ भने यहाँबाट सुरु गर्नुहोस्!**

| टेम्प्लेट | अध्याय | जटिलता | सेवाहरू |
|----------|---------|------------|----------|
| [**AI च्याटसँग सुरु गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**AI एजेन्टसँग सुरु गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-agents) | अध्याय 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**मल्टि-एजेन्ट कार्यप्रवाह स्वचालन**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**तपाईंको डाटाबाट कागजातहरू उत्पन्न गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**क्लाइन्ट बैठकहरू एजेन्टहरूसँग सुधार गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**तपाईंको कोड एजेन्टहरूसँग आधुनिक बनाउनुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**तपाईंको संवादात्मक एजेन्ट निर्माण गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**संवादात्मक डाटाबाट अन्तर्दृष्टि अनलक गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**मल्टि-मोडल सामग्री प्रशोधन**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### विशेष: पूर्ण सिकाइ परिदृश्यहरू
**उत्पादन-तयार एप्लिकेसन टेम्प्लेटहरू सिकाइ अध्यायहरूसँग मिलाइएको**

| टेम्प्लेट | सिकाइ अध्याय | जटिलता | प्रमुख सिकाइ |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | आधारभूत AI तैनाती ढाँचाहरू |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | Azure AI Search सँग RAG कार्यान्वयन |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | अध्याय 4 | ⭐⭐ | कागजात बुद्धिमत्ता एकीकरण |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | एजेन्ट फ्रेमवर्क र कार्य कलिंग |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐ | उद्यम AI समन्वय |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | ग्राहक र सूची एजेन्टहरूसँग मल्टि-एजेन्ट आर्किटेक्चर |

### उदाहरण प्रकारद्वारा सिकाइ

#### सरल एप्लिकेसनहरू (अध्याय 1-2)
- [Simple Web App](../../examples/simple-web-app) - आधारभूत तैनाती ढाँचाहरू
- [Static Website](../../examples/static-site) - स्थिर सामग्री तैनाती
- [Basic API](../../examples/basic-api) - REST API तैनाती

#### डाटाबेस एकीकरण (अध्याय 3-4)  
- [Database App](../../examples/database-app) - डाटाबेस कनेक्टिविटी ढाँचाहरू
- [Data Processing](../../examples/data-processing) - ETL कार्यप्रवाह तैनाती

#### उन्नत ढाँचाहरू (अध्याय 4-8)
- [Container Apps](../../examples/container-app) - कन्टेनराइज्ड तैनातीहरू
- [Microservices](../../examples/microservices) - बहु-सेवा आर्किटेक्चरहरू  
- [Enterprise Solutions](../../examples/enterprise) - उत्पादन-तयार ढाँचाहरू

### बाह्य टेम्प्लेट संग्रहहरू
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - आधिकारिक Microsoft नमूनाहरू
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - समुदायद्वारा योगदान गरिएको टेम्प्लेटहरू
- [**Examples Directory**](examples/README.md) - विस्तृत व्याख्याहरूका साथ स्थानीय सिकाइ उदाहरणहरू

---

## 📚 सिकाइ स्रोतहरू र सन्दर्भहरू

### छिटो सन्दर्भहरू
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - अध्यायद्वारा व्यवस्थित आवश्यक azd कमाण्डहरू
- [**Glossary**](resources/glossary.md) - Azure र azd शब्दावली  
- [**FAQ**](resources/faq.md) - सामान्य प्रश्नहरू सिकाइ अध्यायद्वारा व्यवस्थित
- [**Study Guide**](resources/study-guide.md) - व्यापक अभ्यास अभ्यासहरू

### व्यावहारिक कार्यशालाहरू
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - तपाईंको AI समाधानहरू AZD-तैनातीयोग्य बनाउनुहोस्
- [**AZD For Beginners Workshop**](workshop/README.md) - पूर्ण व्यावहारिक कार्यशाला सामग्रीहरू

### बाह्य सिकाइ स्रोतहरू
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🎓 पाठ्यक्रम पूरा र प्रमाणपत्र

### प्रगति ट्र्याकिङ
प्रत्येक अध्याय मार्फत तपाईंको सिकाइ प्रगति ट्र्याक गर्नुहोस्:

- [ ] **अध्याय 1**: आधारभूत र छिटो सुरु ✅
- [ ] **अध्याय 2**: AI-प्रथम विकास ✅  
- [ ] **अध्याय 3**: कन्फिगरेसन र प्रमाणीकरण ✅
- [ ] **अध्याय 4**: कोडको रूपमा पूर्वाधार र तैनाती ✅
- [ ] **अध्याय 5**: मल्टि-एजेन्ट AI समाधानहरू ✅
- [ ] **अध्याय 6**: पूर्व-तैनाती मान्यता र योजना ✅
- [ ] **अध्याय 7**: समस्या समाधान र डिबगिङ ✅
- [ ] **अध्याय 8**: उत्पादन र उद्यम ढाँचाहरू ✅

### सिकाइ प्रमाणीकरण
प्रत्येक अध्याय पूरा गरेपछि, तपाईंको ज्ञान प्रमाणित गर्नुहोस्:
1. **व्यावहारिक अभ्यास**: अध्यायको व्यावहारिक तैनाती पूरा गर्नुहोस्
2. **ज्ञान जाँच**: तपाईंको अध्यायको FAQ खण्ड समीक्षा गर्नुहोस्
3. **समुदाय छलफल**: Azure Discord मा तपाईंको अनुभव साझा गर्नुहोस्
4. **अर्को अध्याय**: अर्को जटिलता स्तरमा जानुहोस्

### पाठ्यक्रम पूरा गर्ने लाभहरू
सबै अध्यायहरू पूरा गरेपछि, तपाईंले:
- **उत्पादन अनुभव**: वास्तविक AI एप्लिकेसनहरू Azure मा तैनात गर्नुभएको छ
- **व्यावसायिक सीपहरू**: उद्यम-तयार तैनाती क्षमताहरू  
- **समुदाय मान्यता**: Azure विकासकर्ता समुदायको सक्रिय सदस्य
- **क्यारियर उन्नति**: मागमा रहेको AZD र AI तैनाती विशेषज्ञता

---

## 🤝 समुदाय र समर्थन

### सहयोग र समर्थन प्राप्त गर्नुहोस्
- **प्राविधिक समस्या**: [बग रिपोर्ट गर्नुहोस् र सुविधाहरू अनुरोध गर्नुहोस्](https://github.com/microsoft/azd-for-beginners/issues)
- **सिकाइ प्रश्नहरू**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure)
- **AI-विशिष्ट सहयोग**: AZD + AI Foundry छलफलहरूको लागि [#Azure च्यानल](https://discord.gg/microsoft-azure) मा सामेल हुनुहोस्
- **प्रलेखन**: [आधिकारिक Azure Developer CLI प्रलेखन](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Azure AI Foundry Discord बाट समुदाय अन्तर्दृष्टि

**#Azure च्यानलबाट हालको सर्वेक्षण परिणामहरू:**
- **45%** विकासकर्ताहरूले AI कार्यभारहरूको लागि AZD प्रयोग गर्न चाहन्छन्
- **शीर्ष चुनौतीहरू**: बहु-सेवा तैनातीहरू, प्रमाणपत्र व्यवस्थापन, उत्पादन तयारी  
- **सबैभन्दा धेरै अनुरोध गरिएको**: AI-विशिष्ट टेम्प्लेटहरू, समस्या समाधान मार्गदर्शिकाहरू, उत्कृष्ट अभ्यासहरू

**हाम्रो समुदायमा सामेल हुनुहोस्:**
- तपाईंको AZD + AI अनुभवहरू साझा गर्नुहोस् र सहयोग प्राप्त गर्नुहोस्
- नयाँ AI टेम्प्लेटहरूको प्रारम्भिक पूर्वावलोकन पहुँच गर्नुहोस्
- AI तैनाती उत्कृष्ट अभ्यासहरूमा योगदान गर्नुहोस्
- भविष्यको AI + AZD सुविधा विकासलाई प्रभाव पार्नुहोस्

### पाठ्यक्रममा योगदान गर्नुहोस्
हामी योगदानहरूलाई स्वागत गर्दछौं! कृपया हाम्रो [Contributing Guide](CONTRIBUTING.md) पढ्नुहोस्:
- **सामग्री सुधारहरू**: विद्यमान अध्यायहरू र उदाहरणहरू सुधार गर्नुहोस्
- **नयाँ उदाहरणहरू**: वास्तविक परिदृश्यहरू र टेम्प्लेटहरू थप्नुहोस्  
- **अनुवाद**: बहु-भाषा समर्थन कायम राख्न सहयोग गर्नुहोस्
- **बग रिपोर्टहरू**: सटीकता र स्पष्टता सुधार गर्नुहोस्
- **समुदाय मापदण्डहरू**: हाम्रो समावेशी समुदाय दिशानिर्देशहरू पालना गर्नुहोस्

---

## 📄 पाठ्यक्रम जानकारी

### लाइसेन्स
यो परियोजना MIT लाइसेन्स अन्तर्गत लाइसेन्स गरिएको छ - विवरणको लागि [LICENSE](../../LICENSE) फाइल हेर्नुहोस्।

### सम्बन्धित Microsoft सिकाइ स्रोतहरू

हाम्रो टोलीले अन्य व्यापक सिकाइ पाठ्यक्रमहरू उत्पादन गर्दछ:

- [**NEW** Model Context Protocol (MCP) For Beginners](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
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

**सुरुवातकर्ता**: [अध्याय 1: आधारभूत र छिटो सुरु](../..) बाट सुरु गर्नुहोस्  
**AI विकासकर्ताहरू**: [अध्याय 2: AI-प्रथम विकास](../..) मा जानुहोस्
**अनुभवी विकासकर्ता**: [अध्याय ३: कन्फिगरेसन र प्रमाणीकरण](../..) बाट सुरु गर्नुहोस्

**अगाडि बढ्ने कदमहरू**: [अध्याय १ सुरु गर्नुहोस् - AZD आधारभूत](docs/getting-started/azd-basics.md) →

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी यथार्थताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। यसको मूल भाषा मा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।