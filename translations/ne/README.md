# AZD नयाँ सिक्नेहरूका लागि: एक संरचित सिकाइ यात्रा

![AZD-नयाँ सिक्नेहरूका लागि](../../translated_images/ne/azdbeginners.5527441dd9f74068.webp) 

[![GitHub अनुगमनकर्ताहरू](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub फोर्कहरू](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub स्टारहरू](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure डिस्कोर्ड](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry डिस्कोर्ड](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### स्वचालित अनुवादहरू (सधैं अद्यावधिक)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[अरबी](../ar/README.md) | [बंगाली](../bn/README.md) | [बुल्गेरियाली](../bg/README.md) | [बर्मी (म्यान्मार)](../my/README.md) | [चिनी (सरलीकृत)](../zh-CN/README.md) | [चिनी (परम्परागत, हङकङ)](../zh-HK/README.md) | [चिनी (परम्परागत, मकाउ)](../zh-MO/README.md) | [चिनी (परम्परागत, ताइवान)](../zh-TW/README.md) | [क्रोएशियाली](../hr/README.md) | [चेक](../cs/README.md) | [डेनिश](../da/README.md) | [डच](../nl/README.md) | [एस्टोनियाली](../et/README.md) | [फिनिश](../fi/README.md) | [फ्रेन्च](../fr/README.md) | [जर्मन](../de/README.md) | [यूनानी](../el/README.md) | [हिब्रू](../he/README.md) | [हिन्दी](../hi/README.md) | [हंगेरीय](../hu/README.md) | [इन्डोनेशियाली](../id/README.md) | [इटालियन](../it/README.md) | [जापानी](../ja/README.md) | [कन्नड](../kn/README.md) | [कोरियन](../ko/README.md) | [लिथुआनियाली](../lt/README.md) | [मलय](../ms/README.md) | [मलयालम](../ml/README.md) | [मराठी](../mr/README.md) | [नेपाली](./README.md) | [नाइजेरियन पिजिन](../pcm/README.md) | [नोर्वेजियन](../no/README.md) | [फारसी (फ़ारसी)](../fa/README.md) | [पोलिश](../pl/README.md) | [पोर्तुगाली (ब्राजिल)](../pt-BR/README.md) | [पोर्तुगाली (पोर्चुगल)](../pt-PT/README.md) | [पञ्जाबी (गुरमुखी)](../pa/README.md) | [रोमानियन](../ro/README.md) | [रूसी](../ru/README.md) | [सर्बियाली (सिरिलिक)](../sr/README.md) | [स्लोवाक](../sk/README.md) | [स्लोभेनियाली](../sl/README.md) | [स्पेनिश](../es/README.md) | [स्वाहिली](../sw/README.md) | [स्वीडिश](../sv/README.md) | [ट्यागालोग (फिलिपिनो)](../tl/README.md) | [तमिल](../ta/README.md) | [तेलुगु](../te/README.md) | [थाई](../th/README.md) | [तुर्की](../tr/README.md) | [युक्रेनी](../uk/README.md) | [उर्दु](../ur/README.md) | [भियतनामी](../vi/README.md)

> **स्थानिय रूपमा क्लोन गर्न रुचाउनुहुन्छ?**
>
> यस रिपोजिटरीमा 50+ भाषाका अनुवादहरू समावेश छन् जसले डाउनलोड साइज महत्वपूर्ण रूपमा बढाउँछ। अनुवादबिना क्लोन गर्न sparse checkout प्रयोग गर्नुहोस्:
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
> यसले तपाइँलाई पाठ्यक्रम पूरा गर्न आवश्यक सबै कुरा छिटो डाउनलोडका साथ दिन्छ।
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 आज azd मा के नयाँ छ

Azure Developer CLI पारम्परिक वेब एपहरू र API हरूबाट परि बढेको छ। आज, azd Azure मा कुनै पनि आवेदन तैनाथ गर्न — जसमा AI-सञ्चालित अनुप्रयोग र बुद्धिमान एजेन्टहरू समेत — प्रयोग गर्न मिल्ने एकल उपकरण हो।

यसले तपाइँका लागि के अर्थ राख्छ:

- **AI एजेन्टहरू अब azd मा प्राथमिक कार्यभार हुन्।** तपाइँले एउटै `azd init` → `azd up` वर्कफ्लो प्रयोग गरेर AI एजेन्ट परियोजनाहरूलाई आरम्भ, तैनाथ, र व्यवस्थापन गर्न सक्नुहुन्छ जुन तपाइँले पहिले नै चिन्नुहुन्छ।
- **Microsoft Foundry एकीकरणले** मोडेल तैनाथीकरण, एजेन्ट होस्टिङ, र AI सेवा कन्फिगरेसन सिधै azd टेम्पलेट ईकोसिस्टममा ल्याउँछ।
- **मुख्य वर्कफ्लो परिवर्तन भएको छैन।** चाहे तपाइँ टुडु एप, माइक्रोसर्भिस, वा बहु-एजेन्ट AI समाधान तैनाथ गर्दै हुनुहोस्, कमाण्डहरू उस्तै हुन्छन्।

यदि तपाइँले पहिले azd प्रयोग गर्नुभएको छ भने, AI समर्थन एक स्वाभाविक विस्तार हो — अलग उपकरण वा विशेष उन्नत मार्ग होइन। नयाँ सुरु गर्दै हुनुहुन्छ भने, तपाइँले एउटै वर्कफ्लो सिक्नुहुनेछ जुन सबैका लागि काम गर्छ।

---

## 🚀 Azure Developer CLI (azd) के हो?

**Azure Developer CLI (azd)** विकासकर्तामैत्री कमाण्ड-लाइन उपकरण हो जसले Azure मा अनुप्रयोगहरू तैनाथ गर्न सरल बनाउँछ। दर्जनौं Azure स्रोतहरू म्यानुअली सिर्जना र जडान गर्नुभन्दा, तपाइँ एकल कमाण्डले पूरै अनुप्रयोगहरू तैनाथ गर्न सक्नुहुन्छ।

### `azd up` को जादु

```bash
# यो एकल कमाण्डले सबै कुरा गर्छ:
# ✅ सबै Azure स्रोतहरू सिर्जना गर्छ
# ✅ नेटवर्किङ र सुरक्षा कन्फिगर गर्छ
# ✅ तपाईंको अनुप्रयोग कोड बनाउँछ
# ✅ Azure मा परिनियोजन गर्छ
# ✅ तपाईंलाई काम गर्ने URL दिन्छ
azd up
```

**यत्ति नै हो!** Azure Portal मा क्लिक गर्ने झन्झट छैन, पहिले जटिल ARM टेम्पलेटहरू सिक्ने जरुरी छैन, म्यानुअल कन्फिगरेसन छैन - मात्र Azure मा काम गर्ने अनुप्रयोगहरू।

---

## ❓ Azure Developer CLI र Azure CLI: फरक के हो?

यो नयाँहरूले सबैभन्दा धेरै सोध्ने प्रश्न हो। यहाँ सरल उत्तर छ:

| विशेषता | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **उद्देश्य** | व्यक्तिगत Azure स्रोतहरू व्यवस्थापन गर्नु | पूरा अनुप्रयोगहरू तैनाथ गर्नु |
| **मानसिकता** | पूर्वाधार-केंद्रित | अनुप्रयोग-केंद्रित |
| **उदाहरण** | `az webapp create --name myapp...` | `azd up` |
| **सीख्ने वक्र** | Azure सेवाहरू जान्न अनिवार्य | केवल आफ्नो एप जान्नुहोस् |
| **उपयुक्त** | DevOps, पूर्वाधार | विकासकर्ता, प्रोटोटाइपिङ |

### सरल उपमा

- **Azure CLI** घर बनाउन सबै उपकरणहरू भएको जस्तै हो - ह्यामर, आरी, नङ। तपाइँ केहि पनि बनाउन सक्नुहुन्छ, तर निर्माण जान्न आवश्यक छ।
- **Azure Developer CLI** ठेकदार राख्नु जस्तै हो - तपाइँले चाहेको वर्णन गर्नुहुन्छ र उनीहरूले निर्माण सम्हाल्छन्।

### कुन प्रयोग गर्ने

| परिदृश्य | यो प्रयोग गर्नुहोस् |
|----------|--------------------|
| "म मेरो वेब एप छिटो तैनाथ गर्न चाहन्छु" | `azd up` |
| "मलाई केवल एउटा स्टोरेज एकाउन्ट सिर्जना गर्न आवश्यक छ" | `az storage account create` |
| "म एक पूरा AI अनुप्रयोग बनाउँदैछु" | `azd init --template azure-search-openai-demo` |
| "मलाई कुनै विशेष Azure स्रोत डिबग गर्न आवश्यक छ" | `az resource show` |
| "म केही मिनेटमा उत्पादन-तय्यार तैनाथीकरण चाहन्छु" | `azd up --environment production` |

### यी सँगै काम गर्दछन्!

AZD ले भित्र Azure CLI प्रयोग गर्दछ। तपाइँ दुवै प्रयोग गर्न सक्नुहुन्छ:
```bash
# AZD सँग आफ्नो एप्लिकेशन तैनाथ गर्नुहोस्
azd up

# त्यसपछि Azure CLI सँग विशेष स्रोतहरू सुक्ष्म समायोजन गर्नुहोस्
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD मा टेम्पलेटहरू फेला पार्नुहोस्

कच्चाबाट सुरु नगर्नुहोस्! **Awesome AZD** तैनाथ गर्न तयार टेम्पलेटहरूको समुदाय संग्रह हो:

| स्रोत | विवरण |
|----------|-------------|
| 🔗 [**Awesome AZD ग्यालेरी**](https://azure.github.io/awesome-azd/) | एक-क्लिक तैनाथीकरणसहित 200+ टेम्पलेट ब्राउज गर्नुहोस् |
| 🔗 [**टेम्पलेट पठाउनुहोस्**](https://github.com/Azure/awesome-azd/issues) | आफ्नो टेम्पलेट समुदायमा योगदान गर्नुहोस् |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | स्टार गर्नुहोस् र स्रोत अन्वेषण गर्नुहोस् |

### Awesome AZD का लोकप्रिय AI टेम्पलेटहरू

```bash
# माइक्रोसफ्ट फाउन्ड्री मोडेलहरू र AI खोजीसँग RAG चर्चा
azd init --template azure-search-openai-demo

# छिटो AI कुराकानी अनुप्रयोग
azd init --template openai-chat-app-quickstart

# फाउन्ड्री एजेन्ससँग AI एजेन्सहरू
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 चरणमा सुरु गर्ने

### चरण 1: AZD इन्स्टल गर्नुहोस् (2 minutes)

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

### चरण 3: आफ्नो पहिलो एप तैनाथ गर्नुहोस्

```bash
# टेम्प्लेटबाट आरम्भ गर्नुहोस्
azd init --template todo-nodejs-mongo

# Azure मा तैनाथ गर्नुहोस् (सबै कुरा सिर्जना गर्दछ!)
azd up
```

**🎉 यत्ति नै हो!** तपाइँको एप अब Azure मा प्रत्यक्ष छ।

### सफाइ (बिर्सनु हुँदैन!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 यो पाठ्यक्रम कसरी प्रयोग गर्ने

यो पाठ्यक्रम **प्रगतिशील सिकाइ** का लागि डिजाइन गरिएको हो - जहाँ तपाइँ सहज महसुस गर्नुहुन्छ त्यहाँबाट सुरु गर्नुहोस् र क्रमिक रूपमा अगाडि बढ्नुहोस्:

| तपाईंको अनुभव | यहाँबाट सुरु गर्नुहोस् |
|-----------------|------------|
| **Azure मा बिल्कुल नयाँ** | [अध्याय 1: आधार](../..) |
| **Azure थाहा छ, AZD मा नयाँ** | [अध्याय 1: आधार](../..) |
| **AI एप तैनाथ गर्न चाहनुहुन्छ** | [अध्याय 2: AI-प्रथम विकास](../..) |
| **व्यावहारिक अभ्यास चाहनुहुन्छ** | [🎓 अन्तरक्रियात्मक कार्यशाला](workshop/README.md) - 3-4 घण्टे मार्गदर्शित प्रयोगशाला |
| **उत्पादन नमूनाहरू चाहिन्छ** | [अध्याय 8: उत्पादन & एन्त्रप्राइज](../..) |

### द्रुत सेटअप

1. **यो रिपोजिटरी फोर्क गर्नुहोस्**: [![GitHub फोर्कहरू](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **क्लोन गर्नुहोस्**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **मदत प्राप्त गर्नुहोस्**: [Azure Discord समुदाय](https://discord.com/invite/ByRwuEEgH4)

> **स्थानिय रूपमा क्लोन गर्न रुचाउनुहुन्छ?**
>
> यस रिपोजिटरीमा 50+ भाषाका अनुवादहरू समावेश छन् जसले डाउनलोड साइज महत्वपूर्ण रूपमा बढाउँछ। अनुवादबिना क्लोन गर्न sparse checkout प्रयोग गर्नुहोस्:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> यसले तपाइँलाई पाठ्यक्रम पूरा गर्न आवश्यक सबै कुरा छिटो डाउनलोडसहित दिन्छ।


## पाठ्यक्रम अवलोकन

प्रगतिशील सिकाइका लागि डिजाइन गरिएका संरचित अध्यायहरू मार्फत Azure Developer CLI (azd) मा दक्षता हासिल गर्नुहोस्। **Microsoft Foundry एकीकरणसहित AI अनुप्रयोग तैनाथीकरणमा विशेष ध्यान।**

### आधुनिक विकासकर्ताहरूका लागि यो पाठ्यक्रम किन आवश्यक छ

Microsoft Foundry Discord समुदायका दृष्टिकोणहरूमा आधारित, **45% विकासकर्ताहरू AZD लाई AI वर्कलोडका लागि प्रयोग गर्न चाहन्छन्** तर निम्न चुनौतीहरू भोग्नुहुन्छ:
- जटिल बहु-सेवा AI आर्किटेक्चरहरू
- उत्पादन AI तैनाथीकरणका उत्तम अभ्यासहरू  
- Azure AI सेवा एकीकरण र कन्फिगरेसन
- AI वर्कलोडहरूको लागत अनुकूलन
- AI-विशिष्ट तैनाथीकरण समस्याहरूको समस्या निवारण

### सिकाइ उद्देश्यहरू

यो संरचित पाठ्यक्रम पूरा गरेपछि, तपाईंले:
- **AZD आधारभूत कुराहरूमा दक्षता हासिल गर्नुहोस्**: प्रमुख अवधारणाहरू, स्थापना, र कन्फिगरेसन
- **AI अनुप्रयोग तैनाथ गर्नुहोस्**: Microsoft Foundry सेवाहरू सँग AZD प्रयोग गर्नुहोस्
- **Infrastructure as Code लागू गर्नुहोस्**: Bicep टेम्पलेटहरू मार्फत Azure स्रोतहरू व्यवस्थापन गर्नुहोस्
- **तैनाथीकरण समस्याहरू समाधान गर्नुहोस्**: सामान्य समस्याहरू समाधान र डिबग गर्नुहोस्
- **उत्पादनका लागि अनुकूलन गर्नुहोस्**: सुरक्षा, स्केलिङ, निगरानी, र लागत व्यवस्थापन
- **बहु-एजेन्ट समाधान निर्माण गर्नुहोस्**: जटिल AI आर्किटेक्चरहरू तैनाथ गर्नुहोस्

## 🗺️ पाठ्यक्रम नक्सा: अध्याय अनुसार द्रुत नेभिगेसन

हरेक अध्यायसँग सिकाइ उद्देश्यहरू, द्रुत सुरु, र अभ्यासहरू सहित समर्पित README छ:

| अध्याय | विषय | पाठहरू | अवधि | जटिलता |
|---------|-------|---------|----------|------------|
| **[अध्याय 1: आधार](docs/chapter-01-foundation/README.md)** | सुरु गर्नुहोस् | [AZD आधारभूत](docs/chapter-01-foundation/azd-basics.md) &#124; [स्थापना](docs/chapter-01-foundation/installation.md) &#124; [पहिलो परियोजना](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | एआई-प्रथम अनुप्रयोगहरू | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 घण्टा | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | प्राधिकरण र सुरक्षा | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 मिनेट | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & परिनियोजन | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 घण्टा | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | एआई एजेन्ट समाधानहरू | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 घण्टा | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | योजना र मान्यकरण | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 घण्टा | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | डिबग र समाधान | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 घण्टा | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | एंटरप्राइज ढाँचाहरू | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 घण्टा | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | व्यावहारिक प्रयोगशाला | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 घण्टा | ⭐⭐ |

**Total Course Duration:** ~10-14 घण्टा | **Skill Progression:** Beginner → Production-Ready

---

## 📚 Learning Chapters

*तपाईंको अनुभव स्तर र लक्ष्यहरूका आधारमा आफ्नो सिकाइ मार्ग छनोट गर्नुहोस्*

### 🚀 Chapter 1: Foundation & Quick Start
**पूर्वशर्तहरू**: Azure सदस्यता, आधारभूत कमाण्ड लाइन ज्ञान  
**अवधि**: 30-45 मिनेट  
**जटिलता**: ⭐

#### तपाईंले के सिक्नुहुनेछ
- Azure Developer CLI का आधारभूत सिद्धान्तहरू बुझ्ने
- तपाईंको प्लेटफर्ममा AZD इन्स्टल गर्ने
- तपाईंको पहिलो सफल परिनियोजन

#### सिकाइ स्रोतहरू
- **🎯 यहाँबाट सुरु गर्नुहोस्**: [What is Azure Developer CLI?](../..)
- **📖 सिद्धान्त**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - मुख्य अवधारणाहरू र शब्दावली
- **⚙️ सेटअप**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - प्लेटफर्म-विशिष्ट मार्गदर्शकहरू
- **🛠️ व्यावहारिक**: [Your First Project](docs/chapter-01-foundation/first-project.md) - स्टेप-बाइ-स्टेप ट्युटोरियल
- **📋 छिटो संदर्भ**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### व्यावहारिक अभ्यासहरू
```bash
# छिटो स्थापना जाँच
azd version

# आफ्नो पहिलो अनुप्रयोग तैनाथ गर्नुहोस्
azd init --template todo-nodejs-mongo
azd up
```

**💡 अध्यायको परिणाम**: AZD प्रयोग गरी Azure मा एउटा साधारण वेब अनुप्रयोग सफलतापूर्वक परिनियोजन गर्नुहोस्

**✅ सफलता मान्यता:**
```bash
# अध्याय 1 पूरा गरेपछि तपाईंले निम्न कामहरू गर्न सक्नुहुनेछ:
azd version              # स्थापित संस्करण देखाउँछ
azd init --template todo-nodejs-mongo  # परियोजना आरम्भ गर्छ
azd up                  # Azure मा परिनियोजन गर्छ
azd show                # चलिरहेको एपको URL देखाउँछ
# अनुप्रयोग ब्राउजरमा खुल्छ र काम गर्छ
azd down --force --purge  # संसाधनहरू सफा गर्छ
```

**📊 समय लगानी:** 30-45 मिनेट  
**📈 सिप स्तरपछि:** आधारभूत अनुप्रयोगहरू स्वतन्त्र रूपमा परिनियोजन गर्न सक्षम  
**📈 सिप स्तरपछि:** आधारभूत अनुप्रयोगहरू स्वतन्त्र रूपमा परिनियोजन गर्न सक्षम

---

### 🤖 Chapter 2: AI-First Development (Recommended for AI Developers)
**पूर्वशर्तहरू**: अध्याय 1 सम्पन्न  
**अवधि**: 1-2 घण्टा  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- AZD सँग Microsoft Foundry एकीकरण
- एआई-संचालित अनुप्रयोगहरू परिनियोजन गर्ने
- एआई सेवा कन्फिगरेसनहरू बुझ्ने

#### सिकाइ स्रोतहरू
- **🎯 यहाँबाट सुरु गर्नुहोस्**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 एआई एजेन्टहरू**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - AZD सँग बुद्धिमान एजेन्टहरू परिनियोजन गर्नुहोस्
- **📖 ढाँचाहरू**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - एआई मोडेलहरू परिनियोजन र व्यवस्थापन गर्नुहोस्
- **🛠️ कार्यशाला**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - तपाईंका एआई समाधानहरूलाई AZD-तैयार बनाउनुहोस्
- **🎥 अन्तरक्रियात्मक मार्गदर्शक**: [Workshop Materials](workshop/README.md) - MkDocs * DevContainer Environment सहित ब्राउजर-आधारित प्रशिक्षण
- **📋 टेम्प्लेटहरू**: [Microsoft Foundry Templates](../..)
- **📝 उदाहरणहरू**: [AZD Deployment Examples](examples/README.md)

#### व्यावहारिक अभ्यासहरू
```bash
# आफ्नो पहिलो एआई अनुप्रयोग तैनाथ गर्नुहोस्
azd init --template azure-search-openai-demo
azd up

# थप एआई टेम्पलेटहरू प्रयास गर्नुहोस्
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 अध्यायको परिणाम**: RAG क्षमतासहितको एआई-संचालित च्याट अनुप्रयोग परिनियोजन र कन्फिगर गर्नुहोस्

**✅ सफलता मान्यता:**
```bash
# अध्याय २ पछि, तपाईं सक्षम हुनुहुनेछ:
azd init --template azure-search-openai-demo
azd up
# एआई च्याट इन्टरफेस परीक्षण गर्नुहोस्
# प्रश्नहरू सोध्नुहोस् र स्रोतहरूसँग एआई-समर्थित प्रतिक्रियाहरू प्राप्त गर्नुहोस्
# खोज एकीकरण काम गर्छ कि भनेर जाँच गर्नुहोस्
azd monitor  # Application Insights ले टेलिमेट्री देखाउँछ कि जाँच गर्नुहोस्
azd down --force --purge
```

**📊 समय लगानी:** 1-2 घण्टा  
**📈 सिप स्तरपछि:** उत्पादन-तैयार एआई अनुप्रयोगहरू परिनियोजन र कन्फिगर गर्न सक्षम  
**💰 लागत सचेतता:** विकास लागत $80-150/महिना, उत्पादन लागत $300-3500/महिना बुझ्नुहोस्

#### 💰 एआई परिनियोजनहरूका लागि लागत विचारहरू

**विकास वातावरण (अनुमानित $80-150/महिना):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/महिना (टोकन प्रयोगमा आधारित)
- AI Search (Basic tier): $75/महिना
- Container Apps (Consumption): $0-20/महिना
- Storage (Standard): $1-5/महिना

**उत्पादन वातावरण (अनुमानित $300-3,500+/महिना):**
- Microsoft Foundry Models (PTU for consistent performance): $3,000+/महिना OR Pay-as-go with high volume
- AI Search (Standard tier): $250/महिना
- Container Apps (Dedicated): $50-100/महिना
- Application Insights: $5-50/महिना
- Storage (Premium): $10-50/महिना

**💡 लागत कम गर्ने सुझावहरू:**
- सिकाइका लागि **निःशुल्क स्तर** Microsoft Foundry Models प्रयोग गर्नुहोस् (Azure OpenAI 50,000 टोकन/महिना समावेश)
- सक्रिय रूपमा विकास नगर्दा स्रोतहरू डिसअलोकेट गर्न `azd down` चलाउनुहोस्
- सुरुवातमा consumption-based बिलिङ प्रयोग गर्नुहोस्, उत्पादनका लागि मात्रै PTU मा अपग्रेड गर्नुहोस्
- परिनियोजन अघि लागत अनुमान गर्न `azd provision --preview` प्रयोग गर्नुहोस्
- आटो-स्केलिङ सक्षम गर्नुहोस्: वास्तविक प्रयोग अनुसार मात्र तिर्नुहोस्

**लागत अनुगमन:**
```bash
# अनुमानित मासिक लागतहरू जाँच गर्नुहोस्
azd provision --preview

# Azure पोर्टलमा वास्तविक लागतहरू अनुगमन गर्नुहोस्
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapter 3: Configuration & Authentication
**पूर्वशर्तहरू**: अध्याय 1 सम्पन्न  
**अवधि**: 45-60 मिनेट  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- वातावरण कन्फिगरेसन र व्यवस्थापन
- प्रमाणीकरण र सुरक्षा सर्वोत्तम अभ्यासहरू
- स्रोत नामकरण र संगठन

#### सिकाइ स्रोतहरू
- **📖 कन्फिगरेसन**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - वातावरण सेटअप
- **🔐 सुरक्षा**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - प्रमाणीकरण ढाँचाहरू
- **📝 उदाहरणहरू**: [Database App Example](examples/database-app/README.md) - AZD डेटाबेस उदाहरणहरू

#### व्यावहारिक अभ्यासहरू
- बहु वातावरणहरू (dev, staging, prod) कन्फिगर गर्नुहोस्
- प्रबन्धित पहिचान प्रमाणीकरण सेटअप गर्नुहोस्
- वातावरण-विशिष्ट कन्फिगरेसनहरू लागू गर्नुहोस्

**💡 अध्यायको परिणाम**: उचित प्रमाणीकरण र सुरक्षासहित बहु वातावरणहरू व्यवस्थापन गर्नुहोस्

---

### 🏗️ Chapter 4: Infrastructure as Code & Deployment
**पूर्वशर्तहरू**: अध्यायहरू 1-3 सम्पन्न  
**अवधि**: 1-1.5 घण्टा  
**जटिलता**: ⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- उन्नत परिनियोजन ढाँचाहरू
- Bicep सँग Infrastructure as Code
- स्रोत प्राविजनिङ रणनीतिहरू

#### सिकाइ स्रोतहरू
- **📖 परिनियोजन**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - पूर्ण वर्कफ्लोहरू
- **🏗️ प्राविजनिङ**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure स्रोत व्यवस्थापन
- **📝 उदाहरणहरू**: [Container App Example](../../examples/container-app) - कन्टेनराइज्ड परिनियोजनहरू

#### व्यावहारिक अभ्यासहरू
- कस्टम Bicep टेम्प्लेटहरू बनाउनुहोस्
- बहु-सेवा अनुप्रयोगहरू परिनियोजन गर्नुहोस्
- ब्लु-ग्रीन परिनियोजन रणनीतिहरू कार्यान्वयन गर्नुहोस्

**💡 अध्यायको परिणाम**: कस्टम इन्फ्रास्ट्रक्चर टेम्प्लेटहरू प्रयोग गरी जटिल बहु-सेवा अनुप्रयोगहरू परिनियोजन गर्नुहोस्

---

### 🎯 Chapter 5: Multi-Agent AI Solutions (Advanced)
**पूर्वशर्तहरू**: अध्यायहरू 1-2 सम्पन्न  
**अवधि**: 2-3 घण्टा  
**जटिलता**: ⭐⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- बहु-एजेन्ट आर्किटेक्चर ढाँचाहरू
- एजेन्ट अर्केस्ट्रेसन र समन्वय
- उत्पादन-तैयार एआई परिनियोजनहरू

#### सिकाइ स्रोतहरू
- **🤖 विशेष परियोजना**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - पूर्ण कार्यान्वयन
- **🛠️ ARM टेम्प्लेटहरू**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - एक-क्लिक परिनियोजन
- **📖 आर्किटेक्चर**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - ढाँचाहरू

#### व्यावहारिक अभ्यासहरू
```bash
# पूर्ण खुद्रा बहु-एजेन्ट समाधान तैनाथ गर्नुहोस्
cd examples/retail-multiagent-arm-template
./deploy.sh

# एजेन्टको विन्यास अन्वेषण गर्नुहोस्
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 अध्यायको परिणाम**: ग्राहक र इन्भेन्टरी एजेन्टहरूसहित उत्पादन-तैयार बहु-एजेन्ट एआई समाधान परिनियोजन र व्यवस्थापन गर्नुहोस्

---

### 🔍 Chapter 6: Pre-Deployment Validation & Planning
**पूर्वशर्तहरू**: अध्याय 4 सम्पन्न  
**अवधि**: 1 घण्टा  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- क्षमता योजना र स्रोत मान्यकरण
- SKU छनोट रणनीतिहरू
- प्री-फ्लाइट जाँचहरू र स्वत:सञ्चालन

#### सिकाइ स्रोतहरू
- **📊 योजना**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - स्रोत मान्यकरण
- **💰 छनोट**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - लागत-प्रभावकारी चुनावहरू
- **✅ मान्यता**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - स्वत: स्क्रिप्टहरू

#### व्यावहारिक अभ्यासहरू
- क्षमता मान्यकरण स्क्रिप्टहरू चलाउनुहोस्
- लागतका लागि SKU छनोटहरू अनुकूलन गर्नुहोस्
- स्वत: पूर्व-परिनियोजन जाँचहरू लागू गर्नुहोस्

**💡 अध्यायको परिणाम**: कार्यान्वयन अघि परिनियोजनहरू मान्य र अनुकूलन गर्नुहोस्

---

### 🚨 Chapter 7: Troubleshooting & Debugging
**पूर्वशर्तहरू**: कुनै पनि परिनियोजन अध्याय सम्पन्न  
**अवधि**: 1-1.5 घण्टा  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- प्रणालीगत डिबगिङ प्रविधिहरू
- सामान्य समस्याहरू र समाधानहरू
- एआई-विशिष्ट त्रुटि निवारण

#### सिकाइ स्रोतहरू
- **🔧 सामान्य समस्याहरू**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ र समाधानहरू
- **🕵️ डिबगिङ**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - चरण-दर-चरण रणनीतिहरू
- **🤖 एआई समस्याहरू**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - एआई सेवा समस्याहरू

#### व्यावहारिक अभ्यासहरू
- परिनियोजन विफलताहरू निदान गर्नुहोस्
- प्रमाणीकरण समस्याहरू समाधान गर्नुहोस्
- एआई सेवा कनेक्टिविटी डिबग गर्नुहोस्

**💡 अध्यायको परिणाम**: सामान्य परिनियोजन समस्याहरू स्वतन्त्र रूपमा निदान र समाधान गर्न सक्षम हुनुहोस्

---

### 🏢 Chapter 8: Production & Enterprise Patterns
**पूर्वशर्तहरू**: अध्यायहरू 1-4 सम्पन्न  
**अवधि**: 2-3 घण्टा  
**जटिलता**: ⭐⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- उत्पादन परिनियोजन रणनीतिहरू
- एंटरप्राइज सुरक्षा ढाँचाहरू
- अनुगमन र लागत अनुकूलन

#### सिकाइ स्रोतहरू
- **🏭 उत्पादन**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - एंटरप्राइज ढाँचाहरू
- **📝 उदाहरणहरू**: [Microservices Example](../../examples/microservices) - जटिल वास्तुकलाहरू
- **📊 निगरानी**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - निगरानी

#### व्यावहारिक अभ्यासहरू
- उद्यम सुरक्षा ढाँचाहरू कार्यान्वयन गर्नुहोस्
- व्यापक निगरानी सेटअप गर्नुहोस्
- उचित शासनसहित उत्पादनमा परिनियोजन गर्नुहोस्

**💡 अध्यायको परिणाम**: पूर्ण उत्पादन क्षमताहरू सहित उद्यम-तयार अनुप्रयोगहरू परिनियोजन गर्नुहोस्

---

## 🎓 कार्यशाला अवलोकन: व्यावहारिक सिकाइ अनुभव

> **⚠️ कार्यशाला स्थिति: सक्रिय विकास**  
> कार्यशालाका सामग्रीहरू हाल विकास तथा समृद्धि प्रक्रियामा छन्। मुख्य मोड्युलहरू कार्यशील छन्, तर केही उन्नत खण्डहरू अपूर्ण छन्। हामी सम्पूर्ण सामग्री पूरा गर्न सक्रिय रूपमा काम गरिरहेका छौं। [प्रगति ट्र्याक गर्नुहोस् →](workshop/README.md)

### इन्टरएक्टिभ कार्यशाला सामग्री
**ब्राउजर-आधारित उपकरणहरू र मार्गनिर्देशित अभ्यासहरूसँग समग्र व्यावहारिक सिकाइ**

हाम्रो कार्यशाला सामग्रीले अध्याय-आधारित पाठ्यक्रमलाई पूरक गर्ने संरचित, इन्टरएक्टिभ सिकाइ अनुभव प्रदान गर्दछ। कार्यशाला आत्म-खुराक सिकाइ र प्रशिक्षक-नेतृत्व सत्र दुबैका लागि डिजाइन गरिएको छ।

#### 🛠️ कार्यशाला सुविधाहरू
- **ब्राउजर-आधारित इन्टरफेस**: खोज, प्रतिलिपि, र थिम सुविधाहरूको साथ पूर्ण MkDocs-शक्तित कार्यशाला
- **GitHub Codespaces एकीकरण**: एक-क्लिक विकास वातावरण सेटअप
- **संरचित सिकाइ मार्ग**: 8-मोड्युल मार्गनिर्देशित अभ्यासहरू (कुल 3-4 घण्टा)
- **प्रगतिशील विधि**: परिचय → चयन → सत्यापन → विच्छेदन → कन्फिगरेसन → अनुकूलन → सफाइ → समापन
- **इंटरएक्टिभ DevContainer वातावरण**: पूर्व-कन्फिगर गरिएका उपकरणहरू र निर्भरताहरू

#### 📚 कार्यशाला मोड्युल संरचना
कार्यशालाले तपाईंलाई पत्ता लगाउनबाट परिनियोजन विशेषज्ञता सम्म पुर्‍याउने **8-मोड्युल प्रगतिशील विधि** अनुसरण गर्दछ:

| मोड्युल | विषय | तपाईंले के गर्नुहुनेछ | अवधि |
|--------|-------|----------------|----------|
| **0. परिचय** | कार्यशाला अवलोकन | सिकाइ उद्देश्यहरू, पूर्वआवश्यकताहरू, र कार्यशाला संरचना बुझ्नुहोस् | 15 min |
| **1. चयन** | टेम्पलेट खोज | AZD टेम्पलेटहरू अन्वेषण गर्नुहोस् र तपाईंको परिदृश्यका लागि उपयुक्त AI टेम्पलेट चयन गर्नुहोस् | 20 min |
| **2. सत्यापन** | परिनियोजन र जाँच | `azd up` द्वारा टेम्पलेट परिनियोजन गर्नुहोस् र पूर्वाधारले काम गरिरहेको छ भनी प्रमाणित गर्नुहोस् | 30 min |
| **3. विच्छेदन** | संरचना बुझ्नुहोस् | GitHub Copilot प्रयोग गरेर टेम्पलेट वास्तुकला, Bicep फाइलहरू, र कोड संगठन अन्वेषण गर्नुहोस् | 30 min |
| **4. कन्फिगरेसन** | azure.yaml गहिराइमा | `azure.yaml` कन्फिगरेसन, लाइफसाइकल हुकहरू, र वातावरण भेरियेबलहरूको मास्टरी गर्नुहोस् | 30 min |
| **5. अनुकूलन** | तपाईंको बनाउनुहोस् | AI सर्च, ट्रेसिङ, मूल्याङ्कन सक्षम गर्नुहोस् र तपाईंको परिदृश्यअनुसार अनुकूलन गर्नुहोस् | 45 min |
| **6. सफाइ** | स्रोतहरूको सफाइ | `azd down --purge` द्वारा स्रोतहरू सुरक्षित रूपमा निकाल्नुहोस् | 15 min |
| **7. समापन** | अर्को कदमहरू | उपलब्धिहरू, मुख्य अवधारणाहरू समीक्षा गर्नुहोस् र सिकाइ यात्रा जारी राख्नुहोस् | 15 min |

**कार्यशाला प्रवाह:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 कार्यशालासँग कसरी सुरु गर्ने
```bash
# विकल्प 1: GitHub Codespaces (सिफारिस गरिएको)
# रिपोजिटरीमा "Code" → "Create codespace on main" मा क्लिक गर्नुहोस्

# विकल्प 2: स्थानीय विकास
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md मा सेटअप निर्देशनहरू अनुसरण गर्नुहोस्
```

#### 🎯 कार्यशाला सिकाइ नतिजाहरू
कार्यशाला पूरा गरेपछि सहभागीहरूले:
- **उत्पादन AI अनुप्रयोगहरू परिनियोजन गर्नुहोस्**: AZD लाई Microsoft Foundry सेवाहरूको साथ प्रयोग गर्नुहोस्
- **बहु-एजेन्ट वास्तुकलाहरूमा निपुणता हासिल गर्नुहोस्**: समन्वित AI एजेन्ट समाधानहरू कार्यान्वयन गर्नुहोस्
- **सुरक्षा उत्तम अभ्यासहरू लागू गर्नुहोस्**: प्रमाणीकरण र पहुँच नियन्त्रण कन्फिगर गर्नुहोस्
- **स्केलका लागि अनुकूलन गर्नुहोस्**: लागत-प्रभावी, उच्च-प्रदर्शन परिनियोजनहरू डिजाइन गर्नुहोस्
- **परिनियोजन समस्याहरू समाधान गर्नुहोस्**: सामान्य समस्याहरू स्वतन्त्र रूपमा समाधान गर्नुहोस्

#### 📖 कार्यशाला संसाधनहरू
- **🎥 इन्टरएक्टिभ मार्गदर्शक**: [कार्यशाला सामग्री](workshop/README.md) - ब्राउजर-आधारित सिकाइ वातावरण
- **📋 मोड्युल-द्वारा-मोड्युल निर्देशनहरू**:
  - [0. परिचय](workshop/docs/instructions/0-Introduction.md) - कार्यशाला अवलोकन र उद्देश्यहरू
  - [1. चयन](workshop/docs/instructions/1-Select-AI-Template.md) - AI टेम्पलेटहरू खोज्ने र चयन गर्ने तरिका
  - [2. सत्यापन](workshop/docs/instructions/2-Validate-AI-Template.md) - टेम्पलेट परिनियोजन र जाँच
  - [3. विच्छेदन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - टेम्पलेट वास्तुकला अन्वेषण
  - [4. कन्फिगरेसन](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml मा मास्टरी
  - [5. अनुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) - तपाईंको परिदृश्यका लागि अनुकूलन
  - [6. सफाइ](workshop/docs/instructions/6-Teardown-Infrastructure.md) - स्रोतहरू सफा गर्ने तरिका
  - [7. समापन](workshop/docs/instructions/7-Wrap-up.md) - समीक्षा र अर्को कदमहरू
- **🛠️ AI कार्यशाला ल्याब**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-केंद्रित अभ्यासहरू
- **💡 द्रुत सुरुवात**: [Workshop Setup Guide](workshop/README.md#quick-start) - वातावरण कन्फिगरेसन

**उपयुक्त लागि**: कर्पोरेट प्रशिक्षण, विश्वविद्यालय पाठ्यक्रमहरू, आत्म-गतिमान सिकाइ, र विकासकर्ता बूटक्याम्पहरू।

---

## 📖 गहिरो अध्ययन: AZD क्षमताहरू

मूल कुराहरू भन्दा पर, AZD ले उत्पादन परिनियोजनहरूको लागि शक्तिशाली सुविधाहरू प्रदान गर्दछ:

- **टेम्पलेट-आधारित परिनियोजनहरू** - सामान्य अनुप्रयोग ढाँचाहरूका लागि पूर्व-निर्मित टेम्पलेटहरू प्रयोग गर्नुहोस्
- **Infrastructure as Code** - Bicep वा Terraform प्रयोग गरी Azure स्रोतहरू व्यवस्थापन गर्नुहोस्  
- **एकीकृत वर्कफ्लोहरू** - निर्बाध रूपमा आवेदनहरूको प्रावधान, परिनियोजन, र निगरानी गर्नुहोस्
- **डेभलपर-अनुकूल** - विकासकर्ता उत्पादकत्व र अनुभवका लागि अनुकूलित

### **AZD + Microsoft Foundry: AI परिनियोजनका लागि उत्तम**

**किन AZD AI समाधानहरूका लागि?** AZD ले AI विकासकर्ताहरूले सामना गर्ने मुख्य चुनौतीहरूलाई सम्बोधन गर्छ:

- **AI-तयार टेम्पलेटहरू** - Microsoft Foundry मोडेलहरू, Cognitive Services, र ML कार्यभारहरूको लागि पूर्व-कन्फिगर टेम्पलेटहरू
- **सुरक्षित AI परिनियोजनहरू** - AI सेवाहरू, API कुञ्जीहरू, र मोडेल इन्डपोइन्टहरूको लागि निर्मित सुरक्षा ढाँचाहरू  
- **उत्पादन AI ढाँचाहरू** - स्केलेबल, लागत-प्रभावी AI अनुप्रयोग परिनियोजनका लागि उत्तम अभ्यासहरू
- **समग्र AI वर्कफ्लोहरू** - मोडेल विकासदेखि उत्पादन परिनियोजनसम्म उपयुक्त निगरानी सहित
- **लागत अनुकूलन** - AI कार्यभारहरूको लागि स्मार्ट स्रोत विनियोजन र स्केलिङ रणनीतिहरू
- **Microsoft Foundry एकीकरण** - Microsoft Foundry मोडेल क्याटलग र इन्डपोइन्टहरूसँग निर्बाध कनेक्शन

---

## 🎯 टेम्पलेटहरू र उदाहरण पुस्तकालय

### फिचर्ड: Microsoft Foundry टेम्पलेटहरू
**यदि तपाईं AI अनुप्रयोगहरू परिनियोजन गर्दै हुनुहुन्छ भने यहाँबाट सुरु गर्नुहोस्!**

> **नोट:** यी टेम्पलेटहरूले विविध AI ढाँचाहरू प्रदर्शन गर्छन्। केही बाह्य Azure Samples हुन्, अरू स्थानीय कार्यान्वयनहरू हुन्।

| टेम्पलेट | अध्याय | जटिलता | सेवाहरू | प्रकार |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | बाह्य |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | अध्याय 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| बाह्य |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | बाह्य |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | बाह्य |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | बाह्य |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | बाह्य |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **स्थानीय** |

### फिचर्ड: पूर्ण सिकाइ परिदृश्यहरू
**उत्पादन-तयार अनुप्रयोग टेम्पलेटहरू सिकाइ अध्यायहरूमा म्याप गरिएका**

| टेम्पलेट | सिकाइ अध्याय | जटिलता | मुख्य सिकाइ |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | आधारभूत AI परिनियोजन ढाँचाहरू |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | Azure AI Search सँग RAG कार्यान्वयन |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | अध्याय 4 | ⭐⭐ | Document Intelligence एकीकरण |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | एजेन्ट फ्रेमवर्क र फंक्शन कलिङ |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐ | एंटरप्राइज AI अरोकेस्ट्रेशन |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | ग्राहक र इनभेण्टरी एजेन्टहरू सहित बहु-एजेन्ट वास्तुकला |

### उदाहरण प्रकारद्वारा सिकाइ

> **📌 स्थानीय बनाम बाह्य उदाहरणहरू:**  
> **स्थानीय उदाहरणहरू** (यो रिपोजिटरीमा) = तुरुन्त प्रयोग गर्न तयार  
> **बाह्य उदाहरणहरू** (Azure Samples) = लिंक गरिएको रिपोजिटरीहरूबाट क्लोन गर्नुहोस्

#### स्थानीय उदाहरणहरू (तुरुन्त प्रयोग गर्न तयार)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM टेम्पलेटहरूसहित पूर्ण उत्पादन-तयार कार्यान्वयन
  - बहु-एजेन्ट वास्तुकला (ग्राहक + इनभेण्टरी एजेन्टहरू)
  - व्यापक निगरानी र मूल्याङ्कन
  - ARM टेम्पलेट मार्फत एक-क्लिक परिनियोजन

#### स्थानीय उदाहरणहरू - कन्टेनर अनुप्रयोगहरू (अध्यायहरू 2-5)
**यस रिपोजिटरीमा समग्र कन्टेनर परिनियोजन उदाहरणहरू:**
- [**Container App Examples**](examples/container-app/README.md) - कन्टेनराइज्ड परिनियोजनहरूको पूर्ण मार्गदर्शक
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - स्केल-टु-शून्य सहित आधारभूत REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - उत्पादन-तयार बहु-सेवा परिनियोजन
  - द्रुत सुरुवात, उत्पादन, र उन्नत परिनियोजन ढाँचाहरू
  - निगरानी, सुरक्षा, र लागत अनुकूलन मार्गदर्शन

#### बाह्य उदाहरणहरू - साधारण अनुप्रयोगहरू (अध्यायहरू 1-2)
**सुरु गर्न यी Azure Samples रिपोजिटरीहरू क्लोन गर्नुहोस्:**
- [साधारण वेब अनुप्रयोग - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - आधारभूत परिनियोजन ढाँचाहरू
- [स्थिर वेबसाइट - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - स्थिर सामग्री परिनियोजन
- [कन्टेनर एप - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API परिनियोजन

#### बाह्य उदाहरणहरू - डेटाबेस एकीकरण (अध्याय 3-4)  
- [डेटाबेस अनुप्रयोग - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - डेटाबेस कनेक्टिभिटी ढाँचाहरू
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - सर्भरलेस डाटा वर्कफ्लो

#### बाह्य उदाहरणहरू - उन्नत ढाँचाहरू (अध्यायहरू 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - बहु-सेवा वास्तुकलाहरू
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - पृष्ठभूमि प्रशोधन  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - उत्पादन-तयार ML ढाँचाहरू

### बाह्य टेम्पलेट संग्रह
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - आधिकारिक र समुदाय टेम्पलेटहरूको क्युरेटेड संग्रह
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn टेम्पलेट दस्तावेजीकरण
- [**Examples Directory**](examples/README.md) - विस्तृत व्याख्याहरू सहित स्थानीय सिकाइ उदाहरणहरू

---

## 📚 सिकाइ संसाधनहरू र सन्दर्भहरू

### द्रुत सन्दर्भहरू
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - अध्यायअनुसार व्यवस्थित आवश्यक azd कमाण्डहरू
- [**Glossary**](resources/glossary.md) - Azure र azd सम्बन्धी शब्दावली  
- [**FAQ**](resources/faq.md) - सिकाइ अध्यायअनुसार आयोजित सामान्य प्रश्नहरू
- [**Study Guide**](resources/study-guide.md) - समग्र अभ्यास अभ्यासहरू

### व्यावहारिक कार्यशालाहरू
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - तपाईंको AI समाधानहरू AZD-परिनियोज्य बनाउन (2-3 घण्टा)
- [**Interactive Workshop**](workshop/README.md) - MkDocs र GitHub Codespaces सहित 8-मोड्युल मार्गनिर्देशित अभ्यासहरू
  - अनुसरण गर्छ: परिचय → चयन → सत्यापन → विच्छेदन → कन्फिगरेसन → अनुकूलन → सफाइ → समापन

### बाह्य सिकाइ संसाधनहरू
- [Azure Developer CLI दस्तावेज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर केन्द्र](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure मूल्य गणक](https://azure.microsoft.com/pricing/calculator/)
- [Azure स्थिति](https://status.azure.com/)

### AI एजेन्ट सीपहरू तपाईंको सम्पादकका लागि
- [**skills.sh मा Microsoft Azure सीपहरू**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, डिप्लोयमेन्ट, डायग्नोस्टिक्स, लागत अनुकूलन, र अन्यका लागि 37 खुला एजेन्ट सीपहरू। तिनीहरूलाई GitHub Copilot, Cursor, Claude Code, वा कुनै पनि समर्थित एजेन्टमा स्थापना गर्नुहोस्:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 छिटो समस्या समाधान मार्गदर्शिका

**सामान्य समस्याहरू जुन शुरुवातकर्ताले सामना गर्छन् र तुरुन्त समाधानहरू:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# पहिले AZD स्थापना गर्नुहोस्
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
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

# AZD वातावरणको लागि सेट गर्नुहोस्
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# सत्यापित गर्नुहोस्
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# विभिन्न Azure क्षेत्र प्रयोग गरी हेर्नुहोस्
azd env set AZURE_LOCATION "westus2"
azd up

# वा विकासमा साना SKUs प्रयोग गर्नुहोस्
# infra/main.parameters.json सम्पादन गर्नुहोस्:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# विकल्प 1: सफा गरेर फेरि प्रयास गर्नुहोस्
azd down --force --purge
azd up

# विकल्प 2: केवल पूर्वाधार मात्र ठीक गर्नुहोस्
azd provision

# विकल्प 3: विस्तृत स्थिति जाँच गर्नुहोस्
azd show

# विकल्प 4: Azure Monitor मा लगहरू जाँच गर्नुहोस्
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# पुनः प्रमाणीकरण गर्नुहोस्
az logout
az login

azd auth logout
azd auth login

# प्रमाणीकरण जाँच्नुहोस्
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD ले अद्वितीय नामहरू उत्पन्न गर्छ, तर टकराव भएमा:
azd down --force --purge

# त्यसपछि नयाँ वातावरणमा पुनः प्रयास गर्नुहोस्
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ टेम्पलेट तैनाती धेरै लामो भइरहेको छ</strong></summary>

**सामान्य प्रतीक्षा समयहरू:**
- सरल वेब एप: 5-10 मिनेट
- डेटाबेस भएको एप: 10-15 मिनेट
- AI अनुप्रयोगहरू: 15-25 मिनेट (OpenAI प्रोभिजनिङ सुस्त हुन्छ)

```bash
# प्रगति जाँच गर्नुहोस्
azd show

# यदि 30 मिनेटभन्दा बढी अड्किएको छ भने, Azure पोर्टल जाँच गर्नुहोस्:
azd monitor
# विफल परिनियोजनहरू खोज्नुहोस्
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# तपाईंको Azure भूमिका जाँच गर्नुहोस्
az role assignment list --assignee $(az account show --query user.name -o tsv)

# तपाईंलाई कम्तीमा "Contributor" भूमिका चाहिन्छ
# तपाईंको Azure प्रशासकलाई निम्न दिन अनुरोध गर्नुहोस्:
# - Contributor (संसाधनहरूको लागि)
# - User Access Administrator (भूमिका नियुक्तिहरूका लागि)
```
</details>

<details>
<summary><strong>❌ तैनाथ गरिएको अनुप्रयोगको URL फेला परेन</strong></summary>

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

### 📚 पूर्ण समस्या समाधान स्रोतहरू

- **सामान्य समस्याहरू मार्गदर्शिका:** [विस्तृत समाधानहरू](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-विशिष्ट समस्याहरू:** [AI समस्या समाधान](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **डिबगिङ गाइड:** [चरण-दर-चरण डिबगिङ](docs/chapter-07-troubleshooting/debugging.md)
- **सहायता प्राप्त गर्नुहोस्:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 कोर्स पूरा गरिसकेपछि र प्रमाणपत्र

### प्रगति अनुगमन
प्रत्येक अध्यायमा आफ्नो सिकाइको प्रगति अनुगमन गर्नुहोस्:

- [ ] **Chapter 1**: आधार र द्रुत प्रारम्भ ✅
- [ ] **Chapter 2**: AI-प्राथमिक विकास ✅  
- [ ] **Chapter 3**: कॉन्फिगरेसन र प्रमाणीकरण ✅
- [ ] **Chapter 4**: कोडको रूपमा पूर्वाधार र तैनाती ✅
- [ ] **Chapter 5**: बहु-एजेन्ट AI समाधानहरू ✅
- [ ] **Chapter 6**: पूर्व-तैनाती मान्यकरण र योजना ✅
- [ ] **Chapter 7**: समस्या सुल्झाउने र डिबगिङ ✅
- [ ] **Chapter 8**: उत्पादन र एन्त्रप्राइज ढाँचाहरू ✅

### अध्ययन प्रमाणिकरण
प्रत्येक अध्याय पूरा गरेपछि, आफ्नो ज्ञान निम्न तरिकाले प्रमाणित गर्नुहोस्:
1. **व्यावहारिक अभ्यास**: अध्यायको हातेमालो तैनाती पूरा गर्नुहोस्
2. **ज्ञान जाँच**: आफ्नो अध्यायको FAQ सेक्सन समीक्षा गर्नुहोस्
3. **समुदाय बहस**: Azure Discord मा आफ्नो अनुभव साझा गर्नुहोस्
4. **अर्को अध्याय**: अर्को जटिलता स्तरमा बढ्नुहोस्

### कोर्स पूरा गर्दा प्राप्त फाइदाहरू
सवै अध्याय पूरा गरेपछि, तपाइँसँग हुनेछ:
- **उत्पादन अनुभव**: Azure मा वास्तविक AI अनुप्रयोगहरू तैनाथ गरेका
- **व्यावसायिक सीपहरू**: एन्त्रप्राइज-तयार तैनाती क्षमता  
- **समुदाय मान्यता**: Azure डेभलपर समुदायका सक्रिय सदस्य
- **क्यारियर उन्नति**: माग भएको AZD र AI तैनाती विशेषज्ञता

---

## 🤝 समुदाय र समर्थन

### सहायता र समर्थन प्राप्त गर्नुहोस्
- **प्राविधिक समस्या:** [बग रिपोर्ट गर्नुहोस् र सुविधाहरू अनुरोध गर्नुहोस्](https://github.com/microsoft/azd-for-beginners/issues)
- **सिकाइ सम्बन्धी प्रश्नहरू:** [Microsoft Azure Discord समुदाय](https://discord.gg/microsoft-azure) र [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-विशिष्ट सहायता:** Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **प्रलेखन:** [अधिकृत Azure Developer CLI दस्तावेज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord बाट समुदाय अन्तर्दृष्टि

**हालैको मतदान परिणामहरू #Azure च्यानलबाट:**
- डेभलपरहरूको **45%** ले AI वर्कलोडहरूको लागि AZD प्रयोग गर्न चाहन्छन्
- **मुख्य चुनौतीहरू**: बहु-सेवा तैनातीहरू, प्रमाणीकरण व्यवस्थापन, उत्पादन तयारी  
- **सबैभन्दा अनुरोध गरिएका**: AI-विशिष्ट टेम्पलेटहरू, समस्या समधान गाइडहरू, सर्वोत्तम अभ्यासहरू

**हामीसँग जोडिनुहोस् र:**
- आफ्नो AZD + AI अनुभवहरू साझा गर्नुहोस् र सहायता प्राप्त गर्नुहोस्
- नयाँ AI टेम्पलेटहरूको प्रारम्भिक पूर्वावलोकन पहुँच गर्नुहोस्
- AI तैनातीका सर्वोत्तम अभ्यासहरूमा योगदान दिनुहोस्
- भविष्यका AI + AZD सुविधाहरू विकासमा प्रभाव पार्नुहोस्

### कोर्समा योगदान
हामी योगदानलाई स्वागत गर्छौं! कृपया विवरणका लागि हाम्रो [Contributing Guide](CONTRIBUTING.md) पढ्नुहोस्:
- **सामग्री सुधारहरू:** अवस्थित अध्याय र उदाहरणहरू सुधार्नुहोस्
- **नयाँ उदाहरणहरू:** वास्तविक-विश्व परिदृश्य र टेम्पलेटहरू थप्नुहोस्  
- **अनुवाद:** बहुभाषी समर्थन कायम गर्न मद्दत गर्नुहोस्
- **बग रिपोर्टहरू:** शुद्धता र स्पष्टता सुधार्नुहोस्
- **समुदाय मापदण्ड:** हाम्रो समावेशी समुदाय निर्देशिकाहरू अनुसरण गर्नुहोस्

---

## 📄 कोर्स जानकारी

### लाइसेन्स
यो परियोजना MIT लाइसेन्स अन्तर्गत अनुज्ञापत्रित छ - विवरणका लागि [LICENSE](../../LICENSE) फाइल हेर्नुहोस्।

### सम्बन्धित Microsoft सिकाइ स्रोतहरू

हाम्रो टोलीले अन्य व्यापक सिकाइ कोर्सहरू उत्पादन गर्दछ:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / एजेन्टहरू
[![AZD शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![जनरेटिभ AI शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![जनरेटिभ AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![जनरेटिभ AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![जनरेटिभ AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### मुख्य सिकाइ
[![ML शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![साइबरसुरक्षा शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR विकास शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot श्रृंखला
[![एआई जोडी प्रोग्रामिङका लागि Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET का लागि Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot साहसिक](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ पाठ्यक्रम नेभिगेसन

**🚀 सिक्न सुरु गर्न तयार हुनुहुन्छ?**

**शुरुवातीहरू**: Start with [अध्याय 1: आधार र छिटो सुरू](../..)  
**एआई विकासकर्ता**: Jump to [अध्याय 2: एआई-प्रथम विकास](../..)  
**अनुभवी विकासकर्ता**: Begin with [अध्याय 3: कन्फिगरेसन र प्रमाणीकरण](../..)

**अर्को कदम**: [अध्याय 1 सुरु गर्नुहोस् - AZD आधारभूत](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धताको प्रयास गर्छौँ, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा असम्पूर्णता हुन सक्छ। मूल दस्तावेजलाई यसका मूल भाषामै अधिकारिक स्रोत मानिनु पर्छ। महत्त्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलत बुझाइ वा गलत व्याख्याका लागि हामी उत्तरदायी छैनौँ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->