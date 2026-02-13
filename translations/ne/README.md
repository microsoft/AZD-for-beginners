# AZD शुरुवातकर्ताहरूका लागि: एक संरचित सिकाइ यात्रा

![AZD-शुरुआतीहरूका लागि](../../translated_images/ne/azdbeginners.5527441dd9f74068.webp) 

[![GitHub हेर्नेहरू](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub फोर्कहरू](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub स्टारहरू](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure डिस्कोर्ड](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry डिस्कोर्ड](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### स्वचालित अनुवादहरू (सधैं अद्यावधिक)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[अरबी](../ar/README.md) | [बंगाली](../bn/README.md) | [बुल्गारियाली](../bg/README.md) | [बर्मी (म्यानमार)](../my/README.md) | [चिनियाँ (सरलीकृत)](../zh-CN/README.md) | [चिनियाँ (परम्परागत, हङकङ)](../zh-HK/README.md) | [चिनियाँ (परम्परागत, मकाउ)](../zh-MO/README.md) | [चिनियाँ (परम्परागत, ताइवान)](../zh-TW/README.md) | [क्रोएशियाली](../hr/README.md) | [चेक](../cs/README.md) | [डेन्सिस](../da/README.md) | [डच](../nl/README.md) | [एस्टोनियाली](../et/README.md) | [फिनिश](../fi/README.md) | [फ्रेन्च](../fr/README.md) | [जर्मन](../de/README.md) | [ग्रीक](../el/README.md) | [हिब्रू](../he/README.md) | [हिन्दी](../hi/README.md) | [हंगेरी](../hu/README.md) | [इन्डोनेशियाली](../id/README.md) | [इटालियन](../it/README.md) | [जापानी](../ja/README.md) | [कन्नड](../kn/README.md) | [कोरियाली](../ko/README.md) | [लिथुवेनियाली](../lt/README.md) | [मल्याई](../ms/README.md) | [मलयालम](../ml/README.md) | [मराठी](../mr/README.md) | [नेपाली](./README.md) | [नाइजेरियन पिजिन](../pcm/README.md) | [नर्वेजियन](../no/README.md) | [फारसी (Farsi)](../fa/README.md) | [पोलिश](../pl/README.md) | [पोर्तुगाली (ब्राजिल)](../pt-BR/README.md) | [पोर्तुगाली (पोर्चुगल)](../pt-PT/README.md) | [पंजाबी (गुरमुखी)](../pa/README.md) | [रोमानियाली](../ro/README.md) | [रुसी](../ru/README.md) | [सर्बियाली (सिरिलिक)](../sr/README.md) | [स्लोभाक](../sk/README.md) | [स्लोभेनियाली](../sl/README.md) | [स्पेनिश](../es/README.md) | [स्वाहिली](../sw/README.md) | [स्वीडिश](../sv/README.md) | [टागालोग (फिलिपिनो)](../tl/README.md) | [तमिल](../ta/README.md) | [तेलुगु](../te/README.md) | [थाई](../th/README.md) | [तुर्की](../tr/README.md) | [युक्रेनी](../uk/README.md) | [उर्दू](../ur/README.md) | [भियतनामी](../vi/README.md)

> **स्थानीय रूपमा क्लोन गर्न रुचाउनुहुन्छ?**
>
> यो रिपोजिटरीमा 50+ भाषा अनुवादहरू छन् जसले डाउनलोड साइज धेरै बढाउँछ। अनुवादहरू बिना क्लोन गर्न sparse checkout प्रयोग गर्नुहोस्:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> यसले तपाईंलाई कोर्स पूरा गर्न आवश्यक सबै कुरा छिटो डाउनलोडका साथ दिन्छ।
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd) भनेको के हो?

**Azure Developer CLI (azd)** एक विकासकर्तामैत्री कमाण्ड-लाइन उपकरण हो जसले Azure मा अनुप्रयोगहरू तैनाथ गर्न सजिलो बनाउँछ। दर्जनौँ Azure स्रोतहरू म्यानुअली सिर्जना र जडान गर्ने सट्टा, तपाईं एउटा कमाण्डले सम्पूर्ण अनुप्रयोग तैनाथ गर्न सक्नुहुन्छ।

### `azd up` को जादू

```bash
# यो एउटै आदेशले सबै कुरा गर्दछ:
# ✅ सबै Azure स्रोतहरू सिर्जना गर्दछ
# ✅ नेटवर्किङ र सुरक्षा कन्फिगर गर्दछ
# ✅ तपाईंको एप्लिकेसन कोड बनाउँछ
# ✅ Azure मा परिनियोजन गर्दछ
# ✅ तपाईंलाई चलिरहेको URL दिन्छ
azd up
```

**त्यही हो!** Azure Portal मा क्लिक गर्ने आवश्यक छैन, जटिल ARM टेम्पलेटहरू पहिले सिक्ने आवश्यक छैन, म्यानुअल कन्फिगरेसन छैन - केवल Azure मा काम गर्ने अनुप्रयोगहरू।

---

## ❓ Azure Developer CLI र Azure CLI: के फरक छ?

यो शुरुआतकर्ताहरूले सबैभन्दा धेरै सोध्ने प्रश्न हो। यहाँ सरल उत्तर छ:

| विशेषता | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **उद्देश्य** | व्यक्तिगत Azure स्रोतहरू व्यवस्थापन गर्नु | पूर्ण अनुप्रयोगहरू तैनाथ गर्नु |
| **दृष्टिकोण** | पूर्वाधार-केंद्रित | अनुप्रयोग-केंद्रित |
| **उदाहरण** | `az webapp create --name myapp...` | `azd up` |
| **सिक्ने क्रम** | Azure सेवाहरू जान्नुपर्छ | केवल आफ्नो एप थाहा हुनुपर्छ |
| **उपयुक्त** | DevOps, पूर्वाधार | विकासकर्ताहरू, प्रोटोटाइपिङ |

### सहज उपमा

- **Azure CLI** यस्तो हो जस्तै घर बनाउन सबै उपकरणहरू भएको — ह्यामर, आरा, पट्टीहरू। तपाईं जे चाहनुहुन्छ बनाउन सक्नुहुन्छ, तर निर्माणको ज्ञान आवश्यक पर्छ।
- **Azure Developer CLI** यस्तो हो जस्तै एक ठेकेदार भाडामा लिने — तपाईंले आफ्नो चाहना बताउनुहुन्छ, र उनीहरूले निर्माणको हेरचाह गर्छन्।

### कहिले कुन प्रयोग गर्ने

| परिदृश्य | यसो प्रयोग गर्नुहोस् |
|----------|----------|
| "म मेरो वेब एप छिटो तैनाथ गर्न चाहन्छु" | `azd up` |
| "मलाई केवल एउटा स्टोरेज खाता सिर्जना गर्न आवश्यक छ" | `az storage account create` |
| "म पूर्ण AI अनुप्रयोग निर्माण गरिरहेको छु" | `azd init --template azure-search-openai-demo` |
| "मलाई कुनै विशिष्ट Azure स्रोत डिबग गर्न आवश्यक छ" | `az resource show` |
| "म केही मिनेटमा उत्पादन-तैयार तैनाथ गर्न चाहन्छु" | `azd up --environment production` |

### उनीहरू सँगै काम गर्छन्!

AZD ले आवरणभित्र Azure CLI प्रयोग गर्छ। तपाईं दुबै प्रयोग गर्न सक्नुहुन्छ:
```bash
# AZD सँग आफ्नो एप्प तैनाथ गर्नुहोस्
azd up

# त्यसपछि Azure CLI सँग विशेष स्रोतहरूलाई राम्रोसँग अनुकूलन गर्नुहोस्
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD मा टेम्पलेटहरू खोज्नुहोस्

शून्यबाट सुरु नगर्नुहोस्! **Awesome AZD** तयार-तैनाथ गर्ने टेम्पलेटहरूको समुदाय संग्रह हो:

| स्रोत | विवरण |
|----------|-------------|
| 🔗 [**Awesome AZD ग्यालरी**](https://azure.github.io/awesome-azd/) | एक-क्लिक तैनाथसहित 200+ टेम्पलेट ब्राउज गर्नुहोस् |
| 🔗 [**टेम्पलेट बुझाउनुहोस्**](https://github.com/Azure/awesome-azd/issues) | समुदायमा आफ्नो टेम्पलेट योगदान गर्नुहोस् |
| 🔗 [**GitHub रिपोजिटरी**](https://github.com/Azure/awesome-azd) | स्टार गर्नुहोस् र स्रोत अन्वेषण गर्नुहोस् |

### Awesome AZD का लोकप्रिय AI टेम्पलेटहरू

```bash
# Azure OpenAI + AI खोजसहित RAG कुराकानी
azd init --template azure-search-openai-demo

# छिटो AI कुराकानी अनुप्रयोग
azd init --template openai-chat-app-quickstart

# Foundry एजेन्टहरूसहित AI एजेन्टहरू
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 चरणमा सुरु गर्ने तरिका

### चरण 1: AZD इन्स्टल गर्नुहोस् (2 मिनेट)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### चरण 2: Azure मा लगइन गर्नुहोस्

```bash
azd auth login
```

### चरण 3: तपाईंको पहिलो एप तैनाथ गर्नुहोस्

```bash
# टेम्प्लेटबाट सुरू गर्नुहोस्
azd init --template todo-nodejs-mongo

# Azure मा तैनाथ गर्नुहोस् (सबै कुरा सिर्जना गर्दछ!)
azd up
```

**🎉 त्यही हो!** तपाईंको एप अब Azure मा प्रत्यक्ष छ।

### सफा गर्नुहोस् (नभुल्नुहोस्!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 यो कोर्स कसरी प्रयोग गर्ने

यो कोर्स **प्रगतिशील सिकाइ** का लागि डिजाइन गरिएको हो - जहाँ आरामदायी महसुस गर्नुहुन्छ त्यहाँबाट सुरु गर्नुहोस् र माथि बढ्नुहोस्:

| तपाईंको अनुभव | यहाँबाट सुरु गर्नुहोस् |
|-----------------|------------|
| **Azure को लागि बिल्कुल नयाँ** | [अध्याय 1: आधार](../..) |
| **Azure थाहा छ, AZD मा नयाँ** | [अध्याय 1: आधार](../..) |
| **AI एप तैनाथ गर्न चाहनुहुन्छ** | [अध्याय 2: AI-प्रथम विकास](../..) |
| **व्यावहारिक अभ्यास चाहनुहुन्छ** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 घण्टाको मार्गदर्शित ल्याब |
| **प्रोडक्सन ढाँचाहरू चाहिन्छ** | [अध्याय 8: उत्पादन र एंटरप्राइज](../..) |

### छिटो सेटअप

1. **यो रिपोजिटरी Fork गर्नुहोस्**: [![GitHub फोर्कहरू](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **क्लोन गर्नुहोस्**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **मद्दत पाउनुहोस्**: [Azure डिस्कोर्ड समुदाय](https://discord.com/invite/ByRwuEEgH4)

> **स्थानीय रूपमा क्लोन गर्न रुचाउनुहुन्छ?**
>
> यो रिपोजिटरीमा 50+ भाषा अनुवादहरू छन् जसले डाउनलोड साइज धेरै बढाउँछ। अनुवादहरू बिना क्लोन गर्न sparse checkout प्रयोग गर्नुहोस्:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> यसले तपाईंलाई कोर्स पूरा गर्न आवश्यक सबै कुरा धेरै छिटो डाउनलोडको साथ दिन्छ।


## कोर्स अवलोकन

संरचित अध्यायहरू मार्फत Azure Developer CLI (azd) मा विशेषज्ञता हासिल गर्नुहोस्। **विशेष जोड Microsoft Foundry एकीकरणसँग AI अनुप्रयोग तैनाथिमा।**

### किन यो कोर्स आधुनिक विकासकर्ताहरूका लागि आवश्यक छ

Microsoft Foundry Discord समुदायको सुझावअनुसार, **45% विकासकर्ताहरू AZD लाई AI कार्यभारका लागि प्रयोग गर्न चाहन्छन्** तर निम्न चुनौतीहरू भोग्छन्:
- जटिल बहु-सेवा AI आर्किटेक्चरहरू
- उत्पादन AI तैनाथिको उत्कृष्ट अभ्यासहरू  
- Azure AI सेवा एकीकरण र कन्फिगरेसन
- AI कार्यभारहरूका लागि लागत अनुकूलन
- AI-विशेष तैनाथीकरण समस्याहरूको समाधान

### सिकाइ उद्देश्यहरू

यस संरचित कोर्स पूरा गरेर, तपाईं:
- **AZD आधारहरूमा माहिर हुनुहुनेछ**: मूल अवधारणा, स्थापना, र कन्फिगरेसन
- **AI अनुप्रयोग तैनाथ गर्नुहोस्**: AZD लाई Microsoft Foundry सेवाहरूसँग प्रयोग गर्नुहोस्
- **इन्फ्रास्ट्रक्चर एज़ कोड लागू गर्नुहोस्**: Bicep टेम्पलेटहरूसँग Azure स्रोतहरू व्यवस्थापन गर्नुहोस्
- **तैनाथीकरण समस्या समाधान गर्नुहोस्**: सामान्य समस्याहरू समाधान र डिबग गर्नुहोस्
- **उत्पादनका लागि अनुकूलन गर्नुहोस्**: सुरक्षा, स्केलिङ, सुझबुझ, र लागत व्यवस्थापन
- **बहु-एजेण्ट समाधान निर्माण गर्नुहोस्**: जटिल AI आर्किटेक्चर तैनाथ गर्नुहोस्

## 🗺️ कोर्स नक्सा: अध्यायअनुसार छिटो नेभिगेशन

हरेक अध्यायसँग समर्पित README छ जसमा सिकाइ उद्देश्यहरू, छिटो सुरु, र अभ्यासहरू छन्:

| अध्याय | विषय | पाठहरू | अवधि | जटिलता |
|---------|-------|---------|----------|------------|
| **[अध्याय 1: आधार](docs/chapter-01-foundation/README.md)** | Getting Started | [AZD आधारभूत](docs/chapter-01-foundation/azd-basics.md) &#124; [स्थापना](docs/chapter-01-foundation/installation.md) &#124; [पहिलो परियोजना](docs/chapter-01-foundation/first-project.md) | 30-45 मिनेट | ⭐ |
| **[अध्याय 2: AI विकास](docs/chapter-02-ai-development/README.md)** | AI-प्रथम एप्स | [Foundry एकीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI एजेन्टहरू](docs/chapter-02-ai-development/agents.md) &#124; [मोडेल तैनाथीकरण](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [वर्कशप](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 घण्टा | ⭐⭐ |
| **[अध्याय 3: कन्फिगरेसन](docs/chapter-03-configuration/README.md)** | प्रमाणीकरण र सुरक्षा | [कन्फिगरेसन](docs/chapter-03-configuration/configuration.md) &#124; [प्रमाणीकरण र सुरक्षा](docs/chapter-03-configuration/authsecurity.md) | 45-60 मिनेट | ⭐⭐ |
| **[अध्याय 4: पूर्वाधार](docs/chapter-04-infrastructure/README.md)** | IaC & परिनियोजन | [परिनियोजन मार्गदर्शक](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [प्रावधान](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 घण्टा | ⭐⭐⭐ |
| **[अध्याय 5: बहु-एजेन्ट](docs/chapter-05-multi-agent/README.md)** | एआई एजेन्ट समाधानहरू | [खुद्रा परिदृश्य](examples/retail-scenario.md) &#124; [समन्वय ढाँचाहरू](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 घण्टा | ⭐⭐⭐⭐ |
| **[अध्याय 6: पूर्व-परिनियोजन](docs/chapter-06-pre-deployment/README.md)** | योजना र मान्यकरण | [प्रीफ्लाइट जाँचहरू](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [क्षमता योजना](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU चयन](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [एप्लिकेसन इनसाइट्स](docs/chapter-06-pre-deployment/application-insights.md) | 1 घण्टा | ⭐⭐ |
| **[अध्याय 7: समस्याको समाधान](docs/chapter-07-troubleshooting/README.md)** | डिबग र मर्मत | [सामान्य समस्याहरू](docs/chapter-07-troubleshooting/common-issues.md) &#124; [डिबगिङ](docs/chapter-07-troubleshooting/debugging.md) &#124; [एआई मुद्दाहरू](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 घण्टा | ⭐⭐ |
| **[अध्याय 8: उत्पादन](docs/chapter-08-production/README.md)** | एंटरप्राइज ढाँचाहरू | [उत्पादन अभ्यासहरू](docs/chapter-08-production/production-ai-practices.md) | 2-3 घण्टा | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | व्यावहारिक ल्याब | [परिचय](workshop/docs/instructions/0-Introduction.md) &#124; [चयन](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [मान्यकरण](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [विघटन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [कन्फिगरेसन](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [अनुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [टियरडाउन](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [समापन](workshop/docs/instructions/7-Wrap-up.md) | 3-4 घण्टा | ⭐⭐ |

**कुल पाठ्यक्रम अवधि:** ~10-14 घण्टा | **सीप प्रगति:** शुरुवाती → उत्पादन-तयार

---

## 📚 सिकाइ अध्यायहरू

*तपाईंको अनुभव स्तर र लक्ष्यहरूका आधारमा सिकाइ मार्ग चयन गर्नुहोस्*

### 🚀 अध्याय 1: आधार र छिटो सुरुवात
**पूर्वापेक्षाहरू**: Azure सदस्यता, आधारभूत कमाण्ड लाइन ज्ञान  
**अवधि**: 30-45 मिनेट  
**जटिलता**: ⭐

#### तपाईंले के सिक्नुहुनेछ
- Azure Developer CLI का आधारभूत सिद्धान्तहरू बुझ्ने
- तपाईँको प्लेटफर्ममा AZD स्थापना गर्ने
- तपाईंको पहिलो सफल परिनियोजन

#### सिकाइ स्रोतहरू
- **🎯 यहाँबाट सुरु गर्नुहोस्**: [Azure Developer CLI के हो?](../..)
- **📖 सिद्धान्त**: [AZD आधारहरू](docs/chapter-01-foundation/azd-basics.md) - मूल अवधारणाहरू र शब्दावली
- **⚙️ सेटअप**: [स्थापना र सेटअप](docs/chapter-01-foundation/installation.md) - प्लेटफर्म-विशेष मार्गदर्शकहरू
- **🛠️ व्यावहारिक**: [तपाईंको पहिलो परियोजना](docs/chapter-01-foundation/first-project.md) - क्रमिक ट्यूटोरियल
- **📋 छिटो सन्दर्भ**: [कमान्ड चीट शीट](resources/cheat-sheet.md)

#### व्यावहारिक अभ्यासहरू
```bash
# छिटो स्थापना जाँच
azd version

# आफ्नो पहिलो अनुप्रयोग तैनाथ गर्नुहोस्
azd init --template todo-nodejs-mongo
azd up
```

**💡 अध्यायको नतिजा**: AZD प्रयोग गरेर Azure मा साधारण वेब अनुप्रयोग सफलतापूर्वक परिनियोजन गर्नु

**✅ सफलता मान्यकरण:**
```bash
# अध्याय 1 पूरा गरेपछि, तपाईंले निम्न गर्न सक्ने हुनुहुनेछ:
azd version              # स्थापना गरिएको संस्करण देखाउँछ
azd init --template todo-nodejs-mongo  # परियोजना आरम्भ गर्छ
azd up                  # Azure मा परिनियोजन गर्छ
azd show                # चलिरहेको अनुप्रयोगको URL देखाउँछ
# अनुप्रयोग ब्राउजरमा खुल्छ र काम गर्छ
azd down --force --purge  # संसाधनहरू सफा गर्छ
```

**📊 समय लगानी:** 30-45 मिनेट  
**📈 यसपछि प्राप्त सीप स्तर:** स्वतन्त्र रूपमा आधारभूत अनुप्रयोगहरू परिनियोजन गर्न सक्ने

**✅ सफलता मान्यकरण:**
```bash
# अध्याय 1 पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
azd version              # स्थापित संस्करण देखाउँछ
azd init --template todo-nodejs-mongo  # प्रोजेक्ट आरम्भ गर्छ
azd up                  # Azure मा परिनियोजन गर्छ
azd show                # चलिरहेको एपको URL देखाउँछ
# अनुप्रयोग ब्राउजरमा खुल्छ र काम गर्छ
azd down --force --purge  # संसाधनहरू सफा गर्छ
```

**📊 समय लगानी:** 30-45 मिनेट  
**📈 यसपछि प्राप्त सीप स्तर:** स्वतन्त्र रूपमा आधारभूत अनुप्रयोगहरू परिनियोजन गर्न सक्ने

---

### 🤖 अध्याय 2: एआई-प्रथम विकास (एआई विकासकर्ताहरूका लागि सिफारिस)
**पूर्वापेक्षाहरू**: अध्याय 1 पूरा गरिएको  
**अवधि**: 1-2 घण्टा  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- AZD सँग Microsoft Foundry को एकीकरण
- एआई-संचालित अनुप्रयोगहरू परिनियोजन गर्ने
- एआई सेवा कन्फिगरेसनहरू बुझ्ने

#### सिकाइ स्रोतहरू
- **🎯 यहाँबाट सुरु गर्नुहोस्**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 एआई एजेन्टहरू**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - AZD सँग बुद्धिमान एजेन्टहरू परिनियोजन गर्नुहोस्
- **📖 ढाँचाहरू**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - एआई मोडेलहरू परिनियोजन र व्यवस्थापन
- **🛠️ कार्यशाला**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - तपाईंको एआई समाधानहरू AZD-योग्य बनाउने
- **🎥 अन्तरक्रियात्मक मार्गदर्शक**: [Workshop Materials](workshop/README.md) - MkDocs * DevContainer वातावरणसँग ब्राउजर-आधारित सिकाइ
- **📋 टेम्प्लेटहरू**: [Microsoft Foundry Templates](../..)
- **📝 उदाहरणहरू**: [AZD Deployment Examples](examples/README.md)

#### व्यावहारिक अभ्यासहरू
```bash
# तपाईंको पहिलो एआई अनुप्रयोग तैनाथ गर्नुहोस्
azd init --template azure-search-openai-demo
azd up

# थप एआई टेम्पलेटहरू प्रयास गर्नुहोस्
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 अध्यायको नतिजा**: RAG क्षमताहरू सहित एआई-संचालित च्याट एप्लिकेसन परिनियोजन र कन्फिगर गर्नु

**✅ सफलता मान्यकरण:**
```bash
# अध्याय २ पछि, तपाईं निम्न गर्न सक्षम हुनुहुनेछ:
azd init --template azure-search-openai-demo
azd up
# एआई च्याट इन्टरफेस परीक्षण गर्नुहोस्
# प्रश्नहरू सोध्नुहोस् र स्रोतहरूसहित एआई-समर्थित जवाफहरू प्राप्त गर्नुहोस्
# खोज एकीकरणले काम गर्छ कि जाँच गर्नुहोस्
azd monitor  # Application Insights मा टेलिमेट्री देखिन्छ कि जाँच गर्नुहोस्
azd down --force --purge
```

**📊 समय लगानी:** 1-2 घण्टा  
**📈 यसपछि प्राप्त सीप स्तर:** उत्पादन-तयार एआई अनुप्रयोगहरू परिनियोजन र कन्फिगर गर्न सक्ने  
**💰 लागत चेतना:** विकास लागत $80-150/महिना, उत्पादन लागत $300-3500/महिना बुझ्नुहोस्

#### 💰 एआई परिनियोजनहरूको लागि लागत विचार

**विकास वातावरण (अनुमानित $80-150/महिना):**
- Azure OpenAI (Pay-as-you-go): $0-50/महिना (टोकन प्रयोगमा आधारित)
- AI Search (Basic स्तर): $75/महिना
- Container Apps (Consumption): $0-20/महिना
- Storage (Standard): $1-5/महिना

**उत्पादन वातावरण (अनुमानित $300-3,500+/महिना):**
- Azure OpenAI (सुसंगत प्रदर्शनका लागि PTU): $3,000+/महिना वा उच्च भोल्युमका लागि Pay-as-you-go
- AI Search (Standard स्तर): $250/महिना
- Container Apps (Dedicated): $50-100/महिना
- Application Insights: $5-50/महिना
- Storage (Premium): $10-50/महिना

**💡 लागत अनुकूलन सुझावहरू:**
- सिकाइका लागि **Free Tier** Azure OpenAI प्रयोग गर्नुहोस् (प्रति महिना 50,000 टोकन समावेश)
- सक्रिय विकास नभएको बेला स्रोतहरू डि-अलोकेट गर्न `azd down` चलाउनुस्
- सुरुमा consumption-आधारित बिलिङ प्रयोग गर्नुहोस्, उत्पादनका लागि मात्र PTU मा अपग्रेड गर्ने
- परिनियोजन अघि लागत अनुमान गर्न `azd provision --preview` चलाउनुहोस्
- अटो-स्केलिङ सक्षम गर्नुहोस्: वास्तविक प्रयोग अनुसार मात्र तिर्नुहोस्

**लागत अनुगमन:**
```bash
# अनुमानित मासिक लागतहरू जाँच गर्नुहोस्
azd provision --preview

# Azure पोर्टलमा वास्तविक लागतहरू अनुगमन गर्नुहोस्
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ अध्याय 3: कन्फिगरेसन र प्रमाणीकरण
**पूर्वापेक्षाहरू**: अध्याय 1 पूरा गरिएको  
**अवधि**: 45-60 मिनेट  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- वातावरण कन्फिगरेसन र व्यवस्थापन
- प्रमाणीकरण र सुरक्षा उत्तम अभ्यासहरू
- स्रोत नामकरण र संगठन

#### सिकाइ स्रोतहरू
- **📖 कन्फिगरेसन**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - वातावरण सेटअप
- **🔐 सुरक्षा**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - प्रमाणीकरण ढाँचाहरू
- **📝 उदाहरणहरू**: [Database App Example](examples/database-app/README.md) - AZD डेटाबेस उदाहरणहरू

#### व्यावहारिक अभ्यासहरू
- धेरै वातावरणहरू कन्फिगर गर्नुहोस् (dev, staging, prod)
- managed identity प्रमाणीकरण सेटअप गर्नुहोस्
- वातावरण-विशेष कन्फिगरेसनहरू लागू गर्नुहोस्

**💡 अध्यायको नतिजा**: उचित प्रमाणीकरण र सुरक्षा सहित धेरै वातावरण व्यवस्थापन गर्नु

---

### 🏗️ अध्याय 4: Infrastructure as Code & Deployment
**पूर्वापेक्षाहरू**: अध्यायहरू 1-3 पूरा गरिएको  
**अवधि**: 1-1.5 घण्टा  
**जटिलता**: ⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- उन्नत परिनियोजन ढाँचाहरू
- Bicep मार्फत Infrastructure as Code
- स्रोत प्रावधान रणनीतिहरू

#### सिकाइ स्रोतहरू
- **📖 परिनियोजन**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - पूर्ण वर्कफ्लोहरू
- **🏗️ प्रावधान**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure स्रोत व्यवस्थापन
- **📝 उदाहरणहरू**: [Container App Example](../../examples/container-app) - कन्टेनराइज्ड परिनियोजनहरू

#### व्यावहारिक अभ्यासहरू
- कस्टम Bicep टेम्प्लेटहरू सिर्जना गर्नुहोस्
- बहु-सेवा अनुप्रयोगहरू परिनियोजन गर्नुहोस्
- ब्लु-हरियो परिनियोजन रणनीतिहरू लागू गर्नुहोस्

**💡 अध्यायको नतिजा**: कस्टम इन्फ्रास्ट्रक्चर टेम्प्लेट प्रयोग गरेर जटिल बहु-सेवा अनुप्रयोगहरू परिनियोजन गर्नु

---

### 🎯 अध्याय 5: बहु-एजेन्ट एआई समाधानहरू (उन्नत)
**पूर्वापेक्षाहरू**: अध्यायहरू 1-2 पूरा गरिएको  
**अवधि**: 2-3 घण्टा  
**जटिलता**: ⭐⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- बहु-एजेन्ट वास्तुकला ढाँचाहरू
- एजेन्ट अर्चेस्ट्रेसन र समन्वय
- उत्पादन-तयार एआई परिनियोजनहरू

#### सिकाइ स्रोतहरू
- **🤖 विशेष परियोजना**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - पूर्ण कार्यान्वयन
- **🛠️ ARM टेम्प्लेटहरू**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - एक-क्लिक परिनियोजन
- **📖 वास्तुकला**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - समन्वय ढाँचाहरू

#### व्यावहारिक अभ्यासहरू
```bash
# पूर्ण खुद्रा बहु-एजेन्ट समाधान तैनाथ गर्नुहोस्
cd examples/retail-multiagent-arm-template
./deploy.sh

# एजेन्ट कन्फिगरेसनहरू अन्वेषण गर्नुहोस्
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 अध्यायको नतिजा**: Customer र Inventory एजेन्टहरू सहित उत्पादन-तयार बहु-एजेन्ट एआई समाधान परिनियोजन र व्यवस्थापन गर्नु

---

### 🔍 अध्याय 6: पूर्व-परिनियोजन मान्यकरण र योजना
**पूर्वापेक्षाहरू**: अध्याय 4 पूरा गरिएको  
**अवधि**: 1 घण्टा  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- क्षमता योजना र स्रोत मान्यकरण
- SKU चयन रणनीतिहरू
- प्री-फ्लाइट जाँचहरू र अटोमेसन

#### सिकाइ स्रोतहरू
- **📊 योजना**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - स्रोत मान्यकरण
- **💰 चयन**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - लागत-प्रभावी विकल्पहरू
- **✅ मान्यकरण**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - स्वचालित स्क्रिप्टहरू

#### व्यावहारिक अभ्यासहरू
- क्षमता मान्यकरण स्क्रिप्टहरू चलाउनुहोस्
- लागतका लागि SKU चयनहरू अनुकूल गर्नुहोस्
- स्वत: पूर्व-परिनियोजन जाँचहरू लागू गर्नुहोस्

**💡 अध्यायको नतिजा**: कार्यान्वयन अघि परिनियोजनहरू मान्य र अनुकूलित गर्नु

---

### 🚨 अध्याय 7: समस्याको समाधान र डिबगिङ
**पूर्वापेक्षाहरू**: कुनै पनि परिनियोजन अध्याय पूरा गरिएको  
**अवधि**: 1-1.5 घण्टा  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- प्रणालीगत डिबगिङ दृष्टिकोणहरू
- सामान्य समस्याहरू र समाधानहरू
- एआई-विशेष समस्याको समाधान

#### सिकाइ स्रोतहरू
- **🔧 सामान्य समस्याहरू**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - अक्सर सोधिने प्रश्न र समाधानहरू
- **🕵️ डिबगिङ**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - चरण-दर-चरण रणनीतिहरू
- **🤖 एआई मुद्दाहरू**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - एआई सेवा समस्याहरू

#### व्यावहारिक अभ्यासहरू
- परिनियोजन असफलताहरू निदान गर्नुहोस्
- प्रमाणीकरण समस्याहरू समाधान गर्नुहोस्
- एआई सेवा कनेक्सन डिबग गर्नुहोस्

**💡 अध्यायको नतिजा**: सामान्य परिनियोजन समस्याहरू स्वतन्त्र रूपमा निदान र समाधान गर्न सक्ने

---

### 🏢 अध्याय 8: उत्पादन र एंटरप्राइज ढाँचाहरू
**पूर्वापेक्षाहरू**: अध्यायहरू 1-4 पूरा गरिएको  
**अवधि**: 2-3 घण्टा  
**जटिलता**: ⭐⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- उत्पादन परिनियोजन रणनीतिहरू
- एंटरप्राइज सुरक्षा ढाँचाहरू
- निगरानी र लागत अनुकूलन

#### सिकाइ स्रोतहरू
- **🏭 उत्पादन**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - एंटरप्राइज ढाँचाहरू
- **📝 उदाहरणहरू**: [Microservices Example](../../examples/microservices) - जटिल वास्तुकलाहरू
- **📊 निगरानी**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - निगरानी

#### व्यावहारिक अभ्यासहरू
- एंटरप्राइज सुरक्षा ढाँचाहरू लागू गर्नुहोस्
- व्यापक निगरानी सेटअप गर्नुहोस्
- उचित प्रशासनसहित उत्पादनमा परिनियोजन गर्नुहोस्

**💡 अध्यायको नतिजा**: पूर्ण उत्पादन क्षमताहरू सहित एंटरप्राइज-तयार अनुप्रयोगहरू परिनियोजन गर्नु

---

## 🎓 Workshop अवलोकन: व्यावहारिक सिकाइ अनुभव

> **⚠️ वर्कशप स्थिति: सक्रिय विकास**
> कार्यशाला सामग्रीहरू हाल विकास तथा परिष्करणको क्रममा छन्। मुख्य मोड्युलहरू कार्यरत छन्, तर केही उन्नत खण्डहरू अपूर्ण छन्। हामी सबै सामग्री पूरा गर्न सक्रिय रूपमा काम गर्दैछौँ। [प्रगतिलाई ट्र्याक गर्नुहोस् →](workshop/README.md)

### इन्टरएक्टिभ कार्यशाला सामग्री
**ब्राउजर-आधारित उपकरणहरू र निर्देशित अभ्यासहरूसहित व्यापक व्यावहारिक सिकाइ**

हाम्रो कार्यशाला सामग्रीहरूले अध्याय-आधारित पाठ्यक्रमलाई पूरक गर्ने संरचित, इन्टरएक्टिभ सिकाइ अनुभव प्रदान गर्छ। कार्यशाला आत्म-गति सिकाइ र प्रशिक्षक-नेतृत्व भएका सत्रहरू दुबैका लागि डिजाइन गरिएको छ।

#### 🛠️ Workshop Features
- **Browser-Based Interface**: Complete MkDocs-powered workshop with search, copy, and theme features
- **GitHub Codespaces Integration**: One-click development environment setup
- **Structured Learning Path**: 8-module guided exercises (3-4 hours total)
- **Progressive Methodology**: Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
- **Interactive DevContainer Environment**: Pre-configured tools and dependencies

#### 📚 Workshop Module Structure
The workshop follows an **8-module progressive methodology** that takes you from discovery to deployment mastery:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | Understand learning objectives, prerequisites, and workshop structure | 15 min |
| **1. Selection** | Template Discovery | Explore AZD templates and select the right AI template for your scenario | 20 min |
| **2. Validation** | Deploy & Verify | Deploy the template with `azd up` and validate infrastructure works | 30 min |
| **3. Deconstruction** | Understand Structure | Use GitHub Copilot to explore template architecture, Bicep files, and code organization | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | Master `azure.yaml` configuration, lifecycle hooks, and environment variables | 30 min |
| **5. Customization** | Make It Yours | Enable AI Search, tracing, evaluation, and customize for your scenario | 45 min |
| **6. Teardown** | Clean Up | Safely deprovision resources with `azd down --purge` | 15 min |
| **7. Wrap-up** | Next Steps | Review accomplishments, key concepts, and continue your learning journey | 15 min |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Getting Started with the Workshop
```bash
# विकल्प 1: GitHub Codespaces (सिफारिश गरिएको)
# रिपोजिटरीमा "Code" → "Create codespace on main" मा क्लिक गर्नुहोस्

# विकल्प 2: स्थानीय विकास
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md मा सेटअप निर्देशनहरू अनुसरण गर्नुहोस्
```

#### 🎯 Workshop Learning Outcomes
By completing the workshop, participants will:
- **Deploy Production AI Applications**: Use AZD with Microsoft Foundry services
- **Master Multi-Agent Architectures**: Implement coordinated AI agent solutions
- **Implement Security Best Practices**: Configure authentication and access control
- **Optimize for Scale**: Design cost-effective, performant deployments
- **Troubleshoot Deployments**: Resolve common issues independently

#### 📖 Workshop Resources
- **🎥 Interactive Guide**: [कार्यशाला सामग्री](workshop/README.md) - ब्राउजर-आधारित सिकाइ वातावरण
- **📋 Module-by-Module Instructions**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - कार्यशालाको अवलोकन र उद्देश्यहरू
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - AI टेम्पलेटहरू फेला पार्ने र चयन गर्ने
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - टेम्पलेटहरू डिप्लोय र प्रमाणित गर्ने
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - टेम्पलेट आर्किटेक्चर अन्वेषण गर्ने
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - `azure.yaml` मा निपुण हुने
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - आफ्नो परिदृश्यका लागि अनुकूल गर्ने
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - स्रोतहरू सफा गर्ने
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - समीक्षा र आगामी कदमहरू
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-केंद्रित अभ्यासहरू
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - वातावरण कन्फिगरेसन

**Perfect for**: Corporate training, university courses, self-paced learning, and developer bootcamps.

---

## 📖 Deep Dive: AZD Capabilities

Beyond the basics, AZD provides powerful features for production deployments:

- **Template-based deployments** - Use pre-built templates for common application patterns
- **Infrastructure as Code** - Manage Azure resources using Bicep or Terraform  
- **Integrated workflows** - Seamlessly provision, deploy, and monitor applications
- **Developer-friendly** - Optimized for developer productivity and experience

### **AZD + Microsoft Foundry: Perfect for AI Deployments**

**Why AZD for AI Solutions?** AZD addresses the top challenges AI developers face:

- **AI-Ready Templates** - Pre-configured templates for Azure OpenAI, Cognitive Services, and ML workloads
- **Secure AI Deployments** - Built-in security patterns for AI services, API keys, and model endpoints  
- **Production AI Patterns** - Best practices for scalable, cost-effective AI application deployments
- **End-to-End AI Workflows** - From model development to production deployment with proper monitoring
- **Cost Optimization** - Smart resource allocation and scaling strategies for AI workloads
- **Microsoft Foundry Integration** - Seamless connection to Microsoft Foundry model catalog and endpoints

---

## 🎯 Templates & Examples Library

### Featured: Microsoft Foundry Templates
**Start here if you're deploying AI applications!**

> **नोट:** यी टेम्पलेटहरूले विभिन्न AI ढाँचाहरू देखाउँछन्। केही बाह्य Azure Samples हुन्, अन्य स्थानीय कार्यान्वयनहरू हुन्।

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | बाह्य |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | अध्याय 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| बाह्य |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | बाह्य |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | बाह्य |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | बाह्य |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | बाह्य |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **स्थानीय** |

### Featured: Complete Learning Scenarios
**Production-ready application templates mapped to learning chapters**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | अध्याय 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### Learning by Example Type

> **📌 स्थानीय बनाम बाह्य उदाहरणहरू:**  
> **स्थानीय उदाहरणहरू** (यस रेपोमा) = तुरुन्त प्रयोग गर्न तयार  
> **बाह्य उदाहरणहरू** (Azure Samples) = लिंक गरिएका रिपोजिटरीहरूबाट क्लोन गर्नुहोस्

#### Local Examples (Ready to Use)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM टेम्पलेटहरूसहित पूर्ण उत्पादन-तय कार्यान्वयन
  - Multi-agent architecture (Customer + Inventory agents)
  - Comprehensive monitoring and evaluation
  - One-click deployment via ARM template

#### Local Examples - Container Applications (Chapters 2-5)
**यस रेपोमा व्यापक कन्टेनर डिप्लोयमेन्ट उदाहरणहरू:**
- [**Container App Examples**](examples/container-app/README.md) - Complete guide to containerized deployments
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Basic REST API with scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Production-ready multi-service deployment
  - Quick Start, Production, and Advanced deployment patterns
  - Monitoring, security, and cost optimization guidance

#### External Examples - Simple Applications (Chapters 1-2)
**शुरु गर्न यी Azure Samples रिपोजिटरीहरू क्लोन गर्नुहोस्:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Basic deployment patterns
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Static content deployment
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API deployment

#### External Examples - Database Integration (Chapter 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Database connectivity patterns
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless data workflow

#### External Examples - Advanced Patterns (Chapters 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service architectures
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Background processing  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Production-ready ML patterns

### External Template Collections
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Curated collection of official and community templates
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn template documentation
- [**Examples Directory**](examples/README.md) - Local learning examples with detailed explanations

---

## 📚 Learning Resources & References

### Quick References
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Essential azd commands organized by chapter
- [**Glossary**](resources/glossary.md) - Azure and azd terminology  
- [**FAQ**](resources/faq.md) - Common questions organized by learning chapter
- [**Study Guide**](resources/study-guide.md) - Comprehensive practice exercises

### Hands-On Workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Make your AI solutions AZD-deployable (2-3 hours)
- [**Interactive Workshop**](workshop/README.md) - 8-module guided exercises with MkDocs and GitHub Codespaces
  - अनुसरण गर्दै: Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up

### External Learning Resources
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Quick Troubleshooting Guide

**Common issues beginners face and immediate solutions:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# पहिले AZD स्थापना गर्नुहोस्
# विन्डोज (PowerShell):
winget install microsoft.azd

# म्याकओएस:
brew tap azure/azd && brew install azd

# लिनक्स:
curl -fsSL https://aka.ms/install-azd.sh | bash

# स्थापना जाँच्नुहोस्
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# उपलब्ध सदस्यताहरू सूचीबद्ध गर्नुहोस्
az account list --output table

# पूर्वनिर्धारित सदस्यता सेट गर्नुहोस्
az account set --subscription "<subscription-id-or-name>"

# AZD वातावरणका लागि सेट गर्नुहोस्
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# सत्यापन गर्नुहोस्
az account show
```
</details>
<details>
<summary><strong>❌ "InsufficientQuota" वा "Quota exceeded"</strong></summary>

```bash
# विभिन्न Azure क्षेत्र प्रयास गर्नुहोस्
azd env set AZURE_LOCATION "westus2"
azd up

# वा विकासमा साना SKUहरू प्रयोग गर्नुहोस्
# infra/main.parameters.json सम्पादन गर्नुहोस्:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" मध्यमा असफल हुन्छ</strong></summary>

```bash
# विकल्प 1: सफा गरेर फेरि प्रयास गर्नुहोस्
azd down --force --purge
azd up

# विकल्प 2: केवल पूर्वाधार ठीक गर्नुहोस्
azd provision

# विकल्प 3: विस्तृत स्थिति जाँच गर्नुहोस्
azd show

# विकल्प 4: Azure Monitor मा लगहरू जाँच गर्नुहोस्
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" वा "Token expired"</strong></summary>

```bash
# फेरि प्रमाणीकरण गर्नुहोस्
az logout
az login

azd auth logout
azd auth login

# प्रमाणीकरण जाँच्नुहोस्
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" वा नाम सम्बन्धी टकराव</strong></summary>

```bash
# AZD अनूठा नामहरू सिर्जना गर्छ, तर यदि टकराव भएमा:
azd down --force --purge

# त्यसपछि नयाँ वातावरणसँग पुनः प्रयास गर्नुहोस्
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ टेम्प्लेटको तैनाती धेरै ढिलो भइरहेको छ</strong></summary>

**सामान्य प्रतीक्षा समय:**
- साधारण वेब एप: 5-10 minutes
- डाटाबेस भएको एप: 10-15 minutes
- एआई अनुप्रयोगहरू: 15-25 minutes (OpenAI provisioning is slow)

```bash
# प्रगति जाँच गर्नुहोस्
azd show

# यदि ३० मिनेटभन्दा बढी अड्किनुभयो भने, Azure पोर्टल जाँच गर्नुहोस्:
azd monitor
# असफल परिनियोजनहरू खोज्नुहोस्
```
</details>

<details>
<summary><strong>❌ "Permission denied" वा "Forbidden"</strong></summary>

```bash
# आफ्नो Azure भूमिका जाँच गर्नुहोस्
az role assignment list --assignee $(az account show --query user.name -o tsv)

# तपाईंलाई कम्तीमा "Contributor" भूमिका आवश्यक छ
# आफ्नो Azure प्रशासकलाई निम्न प्रदान गर्न भन्नुहोस्:
# - Contributor (संसाधनहरूको लागि)
# - User Access Administrator (भूमिका तोकाइहरूको लागि)
```
</details>

<details>
<summary><strong>❌ तैनात गरिएको एप्लिकेशनको URL फेला पार्न सकिँदैन</strong></summary>

```bash
# सबै सेवा अन्तबिन्दुहरू देखाउनुहोस्
azd show

# वा Azure पोर्टल खोल्नुहोस्
azd monitor

# विशिष्ट सेवा जाँच गर्नुहोस्
azd env get-values
# *_URL भेरिएबलहरू खोज्नुहोस्
```
</details>

### 📚 पूर्ण समस्या निवारण स्रोतहरू

- **Common Issues Guide:** [विस्तृत समाधानहरू](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-Specific Issues:** [एआई समस्या निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [चरण-दर-चरण डिबगिङ](docs/chapter-07-troubleshooting/debugging.md)
- **Get Help:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 पाठ्यक्रम पूरा गर्ने र प्रमाणपत्र

### प्रगति ट्र्याकिङ
प्रत्येक अध्यायमार्फत आफ्नो सिकाइ प्रगति ट्र्याक गर्नुहोस्:

- [ ] **अध्याय 1**: आधार र द्रुत सुरु ✅
- [ ] **अध्याय 2**: एआई-प्रथम विकास ✅  
- [ ] **अध्याय 3**: कन्फिगरेसन र प्रमाणीकरण ✅
- [ ] **अध्याय 4**: पूर्वाधारलाई कोडको रूपमा र तैनाती ✅
- [ ] **अध्याय 5**: बहु-एजेन्ट एआई समाधानहरू ✅
- [ ] **अध्याय 6**: तैनाती पूर्व मान्यकरण र योजना ✅
- [ ] **अध्याय 7**: समस्या निवारण र डिबगिङ ✅
- [ ] **अध्याय 8**: उत्पादन र उद्यम ढाँचा ✅

### सिकाइ पुष्टि
प्रत्येक अध्याय पूरा भएपछि, तपाईंको ज्ञान निम्नद्वारा पुष्टि गर्नुहोस्:
1. **व्यावहारिक अभ्यास**: अध्यायको व्यावहारिक तैनाती पूरा गर्नुहोस्
2. **ज्ञान जाँच**: आफ्नो अध्यायको FAQ खण्ड जाँच गर्नुहोस्
3. **समुदाय छलफल**: Azure Discord मा आफ्नो अनुभव साझा गर्नुहोस्
4. **अर्को अध्याय**: अर्को जटिलता स्तरतर्फ अघि बढ्नुहोस्

### पाठ्यक्रम पूरा गर्दा हुनुपर्ने फाइदा
सबै अध्यायहरू पूरा गरेपछि, तपाईंसँग हुनेछ:
- **उत्पादन अनुभव**: वास्तविक एआई अनुप्रयोगहरू Azure मा तैनात गरेको अनुभव
- **व्यावसायिक कौशल**: उद्यम-तयार तैनाती क्षमता  
- **समुदाय मान्यता**: Azure डेभलपर समुदायको सक्रिय सदस्य
- **करियर उन्नति**: मागमा रहेका AZD र एआई तैनातीमा विशेषज्ञता

---

## 🤝 समुदाय र समर्थन

### सहायता र समर्थन प्राप्त गर्नुहोस्
- **प्राविधिक समस्याहरू**: [बग रिपोर्ट गर्नुहोस् र सुविधाहरू अनुरोध गर्नुहोस्](https://github.com/microsoft/azd-for-beginners/issues)
- **शिक्षण सम्बन्धी प्रश्नहरू**: [Microsoft Azure Discord समुदाय](https://discord.gg/microsoft-azure) र [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **एआई-विशेष सहायता**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **प्रलेखन**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord बाट समुदाय अन्तर्दृष्टिहरू

**हालैको मतदान नतिजा #Azure च्यानलबाट:**
- **45%** विकासकर्ताहरूले एआई कार्यभारका लागि AZD प्रयोग गर्न चाहन्छन्
- **मुख्य चुनौतीहरू**: बहु-सेवा तैनाती, क्रेडेन्सियल व्यवस्थापन, उत्पादन तयारी  
- **सबैभन्दा बढी अनुरोध गरिएका**: एआई-विशेष टेम्प्लेटहरू, समस्या निवारण मार्गदर्शन, उत्कृष्ट अभ्यासहरू

**हाम्रो समुदायमा सामेल भएर तपाईंले:**
- आफ्नो AZD + एआई अनुभव साझा गर्नुहोस् र सहयोग प्राप्त गर्नुहोस्
- नयाँ एआई टेम्प्लेटहरूको प्रारम्भिक पूर्वावलोकन पहुँच गर्नुहोस्
- एआई तैनातीका उत्कृष्ट अभ्यासहरूमा योगदान गर्नुहोस्
- भविष्यका एआई + AZD सुविधाहरूको विकासमा प्रभाव पार्नुहोस्

### पाठ्यक्रममा योगदान गर्नुहोस्
हामी योगदानहरूलाई स्वागत गर्दछौं! विवरणका लागि कृपया हाम्रो [Contributing Guide](CONTRIBUTING.md) पढ्नुहोस्:
- **सामग्री सुधार**: विद्यमान अध्यायहरू र उदाहरणहरूलाई सुधार गर्नुहोस्
- **नयाँ उदाहरणहरू**: वास्तविक-जीवनका परिदृश्य र टेम्प्लेटहरू थप्नुहोस्  
- **अनुवाद**: बहुभाषी समर्थन राख्न मद्दत गर्नुहोस्
- **बग रिपोर्टहरू**: सटीकता र स्पष्टता सुधार गर्नुहोस्
- **समुदाय मानकहरू**: हाम्रो समावेशी समुदाय दिशानिर्देशहरू पालन गर्नुहोस्

---

## 📄 पाठ्यक्रम जानकारी

### लाइसेन्स
यो परियोजना MIT License अन्तर्गत लाइसेन्स गरिएको छ - विवरणका लागि [LICENSE](../../LICENSE) फाइल हेर्नुहोस्।

### सम्बन्धित Microsoft सिकाइ स्रोतहरू

हाम्रा टोलीले अन्य व्यापक सिकाइ पाठ्यक्रमहरू पनि उत्पादन गर्दछ:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ पाठ्यक्रम नेभिगेसन

**🚀 सिक्न सुरू गर्न तयार हुनुहुन्छ?**

**शुरुवातकर्ताहरू**: सुरु गर्नुहोस् [अध्याय 1: आधार र द्रुत सुरुवात](../..)  
**AI विकासकर्ताहरू**: सिधै जानुहोस् [अध्याय 2: AI-प्रथम विकास](../..)  
**अनुभवी विकासकर्ताहरू**: सुरु गर्नुहोस् [अध्याय 3: कन्फिगरेसन र प्रमाणीकरण](../..)

**अर्का कदमहरू**: [अध्याय 1 सुरु गर्नुहोस् - AZD आधारभूत](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताको प्रयास गर्छौं भने तापनि, कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुन सक्छ। मूल दस्तावेजलाई त्यसको मूल भाषामा आधिकारिक स्रोतको रूपमा मानिनु पर्छ। महत्त्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यो अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->