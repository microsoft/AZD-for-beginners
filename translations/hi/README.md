# AZD शुरुआती के लिए: एक संरचित सीखने की यात्रा

![AZD-शुरुआती](../../translated_images/hi/azdbeginners.5527441dd9f74068.webp) 

[![GitHub वॉचर्स](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub फोर्क्स](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub स्टार्स](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure डिस्कॉर्ड](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry डिस्कॉर्ड](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### स्वचालित अनुवाद (हमेशा अद्यतन)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](./README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **क्या आप स्थानीय रूप से क्लोन करना पसंद करते हैं?**

> यह रिपॉज़िटरी 50+ भाषा के अनुवादों को शामिल करती है जो डाउनलोड आकार को काफी बढ़ा देती है। अनुवादों के बिना क्लोन करने के लिए sparse checkout का उपयोग करें:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> यह आपको कोर्स पूरा करने के लिए आवश्यक सब कुछ देता है और डाउनलोड काफी तेज़ कर देता है।
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd) क्या है?

**Azure Developer CLI (azd)** एक डेवलपर-फ्रेंडली कमांड-लाइन टूल है जो Azure पर एप्लिकेशन तैनात करना सरल बनाता है। पारंपरिक रूप से दर्जनों Azure संसाधनों को मैन्युअल रूप से बनाने और कनेक्ट करने के बजाय, आप एक ही कमांड से पूरे एप्लिकेशन तैनात कर सकते हैं।

### `azd up` का जादू

```bash
# यह एकल कमांड सब कुछ करता है:
# ✅ सभी Azure संसाधन बनाता है
# ✅ नेटवर्किंग और सुरक्षा को कॉन्फ़िगर करता है
# ✅ आपके एप्लिकेशन कोड का निर्माण करता है
# ✅ Azure पर डिप्लॉय करता है
# ✅ आपको एक कार्यशील URL देता है
azd up
```

**बस इतना ही!** Azure Portal पर क्लिक करने की ज़रूरत नहीं, पहले कोई जटिल ARM टेम्पलेट सीखने की ज़रूरत नहीं, कोई मैन्युअल कॉन्फ़िगरेशन नहीं - बस Azure पर काम करने वाले एप्लिकेशन।

---

## ❓ Azure Developer CLI बनाम Azure CLI: क्या अंतर है?

यह शुरुआती लोगों द्वारा पूछा जाने वाला सबसे सामान्य प्रश्न है। यहाँ सरल उत्तर है:

| विशेषता | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **उद्देश्य** | व्यक्तिगत Azure संसाधनों का प्रबंधन | पूर्ण एप्लिकेशन तैनात करना |
| **दृष्टिकोण** | इन्फ्रास्ट्रक्चर-केंद्रित | एप्लिकेशन-केंद्रित |
| **उदाहरण** | `az webapp create --name myapp...` | `azd up` |
| **सीखने की अवस्था** | Azure सेवाओं का ज्ञान आवश्यक | केवल अपने ऐप को जानना पर्याप्त |
| **सबसे उपयुक्त** | DevOps, इन्फ्रास्ट्रक्चर | डेवलपर्स, प्रोटोटाइपिंग |

### सरल रूपक

- **Azure CLI** ऐसे है जैसे घर बनाने के लिए आपके पास सारे उपकरण हों - हथौड़ी, आरी, कीलें। आप कुछ भी बना सकते हैं, लेकिन आपको निर्माण का ज्ञान होना चाहिए।
- **Azure Developer CLI** ऐसे है जैसे आप एक ठेकेदार को हायर करते हैं - आप बताते हैं कि आप क्या चाहते हैं, और वे निर्माण संभाल लेते हैं।

### कब किसे उपयोग करें

| परिदृश्य | उपयोग करें |
|----------|----------|
| "मैं अपनी वेब ऐप को जल्दी तैनात करना चाहता/चाहती हूँ" | `azd up` |
| "मुझे केवल एक स्टोरेज अकाउंट बनाना है" | `az storage account create` |
| "मैं एक पूरा AI एप बना रहा/रही हूँ" | `azd init --template azure-search-openai-demo` |
| "मुझे किसी विशिष्ट Azure रिसोर्स को डिबग करना है" | `az resource show` |
| "मैं कुछ ही मिनटों में प्रोडक्शन-तैयार तैनाती चाहता/चाहती हूँ" | `azd up --environment production` |

### वे साथ में काम करते हैं!

AZD अंतर्निहित रूप से Azure CLI का उपयोग करता है। आप दोनों का उपयोग कर सकते हैं:
```bash
# AZD के साथ अपना ऐप तैनात करें
azd up

# फिर Azure CLI के साथ विशिष्ट संसाधनों को ठीक से समायोजित करें
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD में टेम्पलेट खोजें

शून्य से शुरू न करें! **Awesome AZD** तैनाती के लिए तैयार टेम्पलेट्स का समुदाय-आधारित संग्रह है:

| संसाधन | विवरण |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | एक-क्लिक तैनाती के साथ 200+ टेम्पलेट ब्राउज़ करें |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | अपना टेम्पलेट समुदाय में योगदान करें |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | स्टार करें और स्रोत एक्स्प्लोर करें |

### Awesome AZD से लोकप्रिय AI टेम्पलेट्स

```bash
# Azure OpenAI + AI Search के साथ RAG चैट
azd init --template azure-search-openai-demo

# त्वरित AI चैट एप्लिकेशन
azd init --template openai-chat-app-quickstart

# Foundry एजेंट्स के साथ AI एजेंट्स
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 चरणों में प्रारंभ करना

### चरण 1: AZD इंस्टॉल करें (2 मिनट)

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

### चरण 2: Azure में लॉगिन करें

```bash
azd auth login
```

### चरण 3: अपना पहला ऐप तैनात करें

```bash
# एक टेम्पलेट से प्रारंभ करें
azd init --template todo-nodejs-mongo

# Azure पर तैनात करें (सब कुछ बनाता है!)
azd up
```

**🎉 बस हो गया!** आपका ऐप अब Azure पर लाइव है।

### साफ़-सफ़ाई (मत भूलें!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 इस पाठ्यक्रम का उपयोग कैसे करें

यह कोर्स **प्रगतिशील सीखने** के लिए डिज़ाइन किया गया है - वहाँ से शुरू करें जहाँ आप सहज हैं और धीरे-धीरे आगे बढ़ें:

| आपका अनुभव | यहाँ शुरू करें |
|-----------------|------------|
| **Azure के लिए बिलकुल नए** | [अध्याय 1: Foundation](../..) |
| **Azure जानते हैं, AZD नए हैं** | [अध्याय 1: Foundation](../..) |
| **AI ऐप तैनात करना चाहते हैं** | [अध्याय 2: AI-First Development](../..) |
| **हैंड्स-ऑन अभ्यास चाहते हैं** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 घंटे निर्देशित लैब |
| **प्रोडक्शन पैटर्न चाहिए** | [अध्याय 8: Production & Enterprise](../..) |

### त्वरित सेटअप

1. **इस रिपॉज़िटरी को Fork करें**: [![GitHub फोर्क्स](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **क्लोन करें**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **मदद प्राप्त करें**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **क्या आप स्थानीय रूप से क्लोन करना पसंद करते हैं?**

> यह रिपॉज़िटरी 50+ भाषा के अनुवादों को शामिल करती है जो डाउनलोड आकार को काफी बढ़ा देती है। अनुवादों के बिना क्लोन करने के लिए sparse checkout का उपयोग करें:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> यह आपको कोर्स पूरा करने के लिए आवश्यक सब कुछ देता है और डाउनलोड काफी तेज़ कर देता है।


## कोर्स का अवलोकन

संरचित अध्यायों के माध्यम से Azure Developer CLI (azd) में महारत हासिल करें, जो प्रगतिशील सीखने के लिए डिज़ाइन किए गए हैं। **Microsoft Foundry इंटीग्रेशन के साथ AI एप्लिकेशन तैनाती पर विशेष ध्यान।**

### आधुनिक डेवलपर्स के लिए यह कोर्स क्यों आवश्यक है

Microsoft Foundry Discord समुदाय की जानकारी के आधार पर, **45% डेवलपर्स AZD को AI वर्कलोड्स के लिए उपयोग करना चाहते हैं** लेकिन उन्हें इन चुनौतियों का सामना होता है:
- जटिल मल्टी-सर्विस AI आर्किटेक्चर
- प्रोडक्शन AI तैनाती सर्वोत्तम प्रथाएँ  
- Azure AI सेवा एकीकरण और कॉन्फ़िगरेशन
- AI वर्कलोड्स के लिए लागत का अनुकूलन
- AI-विशिष्ट तैनाती समस्याओं का समाधान

### शिक्षण उद्देश्य

यह संरचित कोर्स पूरा करने पर, आप:
- **AZD के मूल सिद्धांतों में महारत हासिल करेंगे**: कोर अवधारणाएँ, इंस्टॉलेशन और कॉन्फ़िगरेशन
- **AI एप्लिकेशन तैनात करेंगे**: AZD का उपयोग Microsoft Foundry सेवाओं के साथ
- **Infrastructure as Code लागू करेंगे**: Bicep टेम्पलेट्स के साथ Azure संसाधनों का प्रबंधन
- **तैनाती की समस्या निवारण करेंगे**: सामान्य समस्याओं का समाधान और डिबग करना
- **प्रोडक्शन के लिए अनुकूलन करेंगे**: सुरक्षा, स्केलिंग, मॉनिटरिंग और लागत प्रबंधन
- **मल्टी-एजेंट समाधान बनाएँगे**: जटिल AI आर्किटेक्चर तैनात करना

## 🗺️ कोर्स मानचित्र: अध्याय के अनुसार त्वरित नेविगेशन

प्रत्येक अध्याय के पास समर्पित README है जिसमें सीखने के उद्देश्य, त्वरित आरंभ और अभ्यास शामिल हैं:

| अध्याय | विषय | पाठ | अवधि | कठिनाई |
|---------|-------|---------|----------|------------|
| **[अध्याय 1: Foundation](docs/chapter-01-foundation/README.md)** | शुरूआत | [AZD मूल बातें](docs/chapter-01-foundation/azd-basics.md) &#124; [इंस्टॉलेशन](docs/chapter-01-foundation/installation.md) &#124; [पहला प्रोजेक्ट](docs/chapter-01-foundation/first-project.md) | 30-45 मिनट | ⭐ |
| **[अध्याय 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-प्रथम ऐप्स | [Foundry एकीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI एजेंट](docs/chapter-02-ai-development/agents.md) &#124; [मॉडल तैनाती](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [वर्कशॉप](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 घंटे | ⭐⭐ |
| **[अध्याय 3: Configuration](docs/chapter-03-configuration/README.md)** | प्रमाणीकरण और सुरक्षा | [कॉन्फ़िगरेशन](docs/chapter-03-configuration/configuration.md) &#124; [प्रमाणीकरण और सुरक्षा](docs/chapter-03-configuration/authsecurity.md) | 45-60 मिनट | ⭐⭐ |
| **[अध्याय 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC और तैनाती | [तैनाती मार्गदर्शिका](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [प्राविजनिंग](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 घंटे | ⭐⭐⭐ |
| **[Ch 5: मल्टी-एजेंट](docs/chapter-05-multi-agent/README.md)** | AI एजेंट समाधान | [रिटेल परिदृश्य](examples/retail-scenario.md) &#124; [समन्वय पैटर्न](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 घंटे | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | योजना और सत्यापन | [प्री-फ्लाइट जाँच](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [क्षमता योजना](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU चयन](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [एप्लिकेशन इंसाइट्स](docs/chapter-06-pre-deployment/application-insights.md) | 1 घंटा | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | डिबग और फिक्स | [सामान्य समस्याएँ](docs/chapter-07-troubleshooting/common-issues.md) &#124; [डिबगिंग](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI समस्यानिवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 घंटे | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | एंटरप्राइज़ पैटर्न | [प्रोडक्शन प्रैक्टिसेस](docs/chapter-08-production/production-ai-practices.md) | 2-3 घंटे | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | हैंड्स-ऑन लैब | [परिचय](workshop/docs/instructions/0-Introduction.md) &#124; [चयन](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [मान्यता](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [विखंडन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [कॉन्फ़िगरेशन](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [कस्टमाइज़ेशन](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [टियरडाउन](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [समापन](workshop/docs/instructions/7-Wrap-up.md) | 3-4 घंटे | ⭐⭐ |

**कुल कोर्स अवधि:** ~10-14 घंटे | **कौशल प्रगति:** शुरुआती → प्रोडक्शन-रेडी

---

## 📚 सीखने के अध्याय

*अपने अनुभव स्तर और लक्ष्य के आधार पर अपना शिक्षण मार्ग चुनें*

### 🚀 अध्याय 1: आधार और त्वरित प्रारम्भ
**पूर्वापेक्षाएँ**: Azure सब्सक्रिप्शन, बुनियादी कमांड लाइन ज्ञान  
**अवधि**: 30-45 मिनट  
**जटिलता**: ⭐

#### आप क्या सीखेंगे
- Azure Developer CLI के मूल सिद्धांतों की समझ
- अपने प्लेटफ़ॉर्म पर AZD स्थापित करना
- आपकी पहली सफल परिनियोजन

#### शैक्षिक संसाधन
- **🎯 यहाँ शुरू करें**: [Azure Developer CLI क्या है?](../..)
- **📖 सिद्धांत**: [AZD बेसिक्स](docs/chapter-01-foundation/azd-basics.md) - मुख्य अवधारणाएँ और शब्दावली
- **⚙️ सेटअप**: [इंस्टॉलेशन और सेटअप](docs/chapter-01-foundation/installation.md) - प्लेटफ़ॉर्म-विशिष्ट मार्गदर्शिकाएँ
- **🛠️ हैंड्स-ऑन**: [आपका पहला प्रोजेक्ट](docs/chapter-01-foundation/first-project.md) - चरण-दर-चरण ट्यूटोरियल
- **📋 त्वरित संदर्भ**: [कमांड चीट शीट](resources/cheat-sheet.md)

#### व्यावहारिक अभ्यास
```bash
# त्वरित स्थापना जांच
azd version

# अपना पहला एप्लिकेशन तैनात करें
azd init --template todo-nodejs-mongo
azd up
```

**💡 अध्याय परिणाम**: AZD का उपयोग करके Azure पर एक सरल वेब एप्लिकेशन सफलतापूर्वक परिनियोजित करना

**✅ सफलता सत्यापन:**
```bash
# अध्याय 1 पूरा करने के बाद, आप सक्षम होंगे:
azd version              # इंस्टॉल किए गए संस्करण को दिखाता है
azd init --template todo-nodejs-mongo  # परियोजना को आरंभ करता है
azd up                  # Azure पर तैनात करता है
azd show                # चल रहे ऐप का URL दिखाता है
# एप्लिकेशन ब्राउज़र में खुलता है और काम करता है
azd down --force --purge  # संसाधनों को साफ़ करता है
```

**📊 समय निवेश:** 30-45 मिनट  
**📈 बाद में कौशल स्तर:** बुनियादी एप्लिकेशन स्वतंत्र रूप से परिनियोजित कर सकते हैं

**✅ सफलता सत्यापन:**
```bash
# अध्याय 1 पूरा करने के बाद, आप सक्षम होंगे:
azd version              # स्थापित संस्करण दिखाता है
azd init --template todo-nodejs-mongo  # परियोजना आरंभ करता है
azd up                  # Azure पर तैनात करता है
azd show                # चल रहे ऐप का URL दिखाता है
# एप्लिकेशन ब्राउज़र में खुलता है और काम करता है
azd down --force --purge  # संसाधनों को साफ़ करता है
```

**📊 समय निवेश:** 30-45 मिनट  
**📈 बाद में कौशल स्तर:** बुनियादी एप्लिकेशन स्वतंत्र रूप से परिनियोजित कर सकते हैं

---

### 🤖 अध्याय 2: AI-प्रथम विकास (AI डेवलपर्स के लिए अनुशंसित)
**पूर्वापेक्षाएँ**: अध्याय 1 पूरा किया हुआ  
**अवधि**: 1-2 घंटे  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- Microsoft Foundry का AZD के साथ एकीकरण
- AI-संचालित एप्लिकेशन परिनियोजित करना
- AI सेवा कॉन्फ़िगरेशन समझना

#### शैक्षिक संसाधन
- **🎯 यहाँ शुरू करें**: [Microsoft Foundry एकीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI एजेंट्स**: [AI एजेंट गाइड](docs/chapter-02-ai-development/agents.md) - AZD के साथ बुद्धिमान एजेंट परिनियोजित करें
- **📖 पैटर्न**: [AI मॉडल परिनियोजन](docs/chapter-02-ai-development/ai-model-deployment.md) - AI मॉडल्स को परिनियोजित और प्रबंधित करें
- **🛠️ कार्यशाला**: [AI कार्यशाला लैब](docs/chapter-02-ai-development/ai-workshop-lab.md) - अपनी AI समाधान को AZD-रेडी बनाएं
- **🎥 इंटरएक्टिव गाइड**: [वर्कशॉप सामग्री](workshop/README.md) - ब्राउज़र-आधारित सीखने के लिए MkDocs * DevContainer Environment
- **📋 टेम्पलेट्स**: [Microsoft Foundry टेम्पलेट्स](../..)
- **📝 उदाहरण**: [AZD परिनियोजन उदाहरण](examples/README.md)

#### व्यावहारिक अभ्यास
```bash
# अपना पहला एआई एप्लिकेशन तैनात करें
azd init --template azure-search-openai-demo
azd up

# अतिरिक्त एआई टेम्पलेट्स आज़माएँ
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 अध्याय परिणाम**: RAG क्षमताओं के साथ एक AI-संचालित चैट एप्लिकेशन परिनियोजित और कॉन्फ़िगर करना

**✅ सफलता सत्यापन:**
```bash
# अध्याय 2 के बाद, आप सक्षम होंगे:
azd init --template azure-search-openai-demo
azd up
# AI चैट इंटरफ़ेस का परीक्षण करें
# सवाल पूछें और स्रोतों के साथ AI-समर्थित उत्तर प्राप्त करें
# सत्यापित करें कि खोज एकीकरण काम कर रहा है
azd monitor  # जांचें कि Application Insights टेलीमेट्री दिखा रहा है
azd down --force --purge
```

**📊 समय निवेश:** 1-2 घंटे  
**📈 बाद में कौशल स्तर:** उत्पादन-तैयार AI एप्लिकेशन परिनियोजित और कॉन्फ़िगर कर सकते हैं  
**💰 लागत जानकारी:** समझें $80-150/माह विकास लागत, $300-3500/माह उत्पादन लागत

#### 💰 AI परिनियोजन के लिए लागत विचार

**विकास वातावरण (अनुमानित $80-150/माह):**
- Azure OpenAI (Pay-as-you-go): $0-50/माह (टोकन उपयोग के आधार पर)
- AI Search (Basic tier): $75/माह
- Container Apps (Consumption): $0-20/माह
- Storage (Standard): $1-5/माह

**उत्पादन वातावरण (अनुमानित $300-3,500+/माह):**
- Azure OpenAI (PTU for consistent performance): $3,000+/माह OR उच्च वॉल्यूम के साथ Pay-as-go
- AI Search (Standard tier): $250/माह
- Container Apps (Dedicated): $50-100/माह
- Application Insights: $5-50/माह
- Storage (Premium): $10-50/माह

**💡 लागत अनुकूलन सुझाव:**
- सीखने के लिए Azure OpenAI के **Free Tier** का उपयोग करें (50,000 टोकन/माह शामिल)
- सक्रिय रूप से विकास न कर रहे हों तो संसाधनों को अनअलोकेट करने के लिए `azd down` चलाएँ
- उत्पादन के लिए केवल PTU पर अपग्रेड करें; शुरुआत consumption-आधारित बिलिंग से करें
- परिनियोजन से पहले लागत का अनुमान लगाने के लिए `azd provision --preview` का उपयोग करें
- ऑटो-स्केलिंग सक्षम करें: केवल वास्तविक उपयोग के लिए भुगतान करें

**लागत निगरानी:**
```bash
# अनुमानित मासिक लागत की जाँच करें
azd provision --preview

# Azure पोर्टल में वास्तविक लागतों की निगरानी करें
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ अध्याय 3: कॉन्फ़िगरेशन और प्रमाणीकरण
**पूर्वापेक्षाएँ**: अध्याय 1 पूरा किया हुआ  
**अवधि**: 45-60 मिनट  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- वातावरण कॉन्फ़िगरेशन और प्रबंधन
- प्रमाणीकरण और सुरक्षा सर्वोत्तम प्रथाएँ
- संसाधन नामकरण और संगठन

#### शैक्षिक संसाधन
- **📖 कॉन्फ़िगरेशन**: [कॉन्फ़िगरेशन गाइड](docs/chapter-03-configuration/configuration.md) - वातावरण सेटअप
- **🔐 सुरक्षा**: [प्रमाणीकरण पैटर्न और मैनेज्ड आइडेंटिटी](docs/chapter-03-configuration/authsecurity.md) - प्रमाणीकरण पैटर्न
- **📝 उदाहरण**: [डेटाबेस ऐप उदाहरण](examples/database-app/README.md) - AZD डेटाबेस उदाहरण

#### व्यावहारिक अभ्यास
- कई वातावरण (dev, staging, prod) कॉन्फ़िगर करें
- मैनेज्ड आइडेंटिटी प्रमाणीकरण सेट करें
- वातावरण-विशिष्ट कॉन्फ़िगरेशन लागू करें

**💡 अध्याय परिणाम**: उचित प्रमाणीकरण और सुरक्षा के साथ कई वातावरण प्रबंधित करें

---

### 🏗️ अध्याय 4: इन्फ़्रास्ट्रक्चर ऐज़ कोड और परिनियोजन
**पूर्वापेक्षाएँ**: अध्याय 1-3 पूरे किए हुए  
**अवधि**: 1-1.5 घंटे  
**जटिलता**: ⭐⭐⭐

#### आप क्या सीखेंगे
- उन्नत परिनियोजन पैटर्न
- Bicep के साथ इन्फ्रास्ट्रक्चर ऐज़ कोड
- संसाधन प्रोविज़निंग रणनीतियाँ

#### शैक्षिक संसाधन
- **📖 परिनियोजन**: [डिप्लॉयमेंट गाइड](docs/chapter-04-infrastructure/deployment-guide.md) - पूर्ण वर्कफ़्लो
- **🏗️ प्रोविज़निंग**: [संसाधन प्रोविज़निंग](docs/chapter-04-infrastructure/provisioning.md) - Azure संसाधन प्रबंधन
- **📝 उदाहरण**: [Container App उदाहरण](../../examples/container-app) - कंटेनरीकृत परिनियोजन

#### व्यावहारिक अभ्यास
- कस्टम Bicep टेम्पलेट बनाएँ
- मल्टी-सर्विस एप्लिकेशन परिनियोजित करें
- ब्लू-ग्रीन परिनियोजन रणनीतियाँ लागू करें

**💡 अध्याय परिणाम**: कस्टम इन्फ्रास्ट्रक्चर टेम्पलेट्स का उपयोग करके जटिल मल्टी-सर्विस एप्लिकेशन परिनियोजित करें

---

### 🎯 अध्याय 5: मल्टी-एजेंट AI समाधान (उन्नत)
**पूर्वापेक्षाएँ**: अध्याय 1-2 पूरे किए हुए  
**अवधि**: 2-3 घंटे  
**जटिलता**: ⭐⭐⭐⭐

#### आप क्या सीखेंगे
- मल्टी-एजेंट आर्किटेक्चर पैटर्न
- एजेंट ऑर्केस्ट्रेशन और समन्वय
- प्रोडक्शन-रेडी AI परिनियोजन

#### शैक्षिक संसाधन
- **🤖 प्रमुख प्रोजेक्ट**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - पूर्ण कार्यान्वयन
- **🛠️ ARM टेम्पलेट्स**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - एक-क्लिक परिनियोजन
- **📖 आर्किटेक्चर**: [मल्टी-एजेंट समन्वय पैटर्न](docs/chapter-06-pre-deployment/coordination-patterns.md) - पैटर्न

#### व्यावहारिक अभ्यास
```bash
# पूर्ण रिटेल मल्टी-एजेंट समाधान को तैनात करें
cd examples/retail-multiagent-arm-template
./deploy.sh

# एजेंट कॉन्फ़िगरेशनों का अन्वेषण करें
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 अध्याय परिणाम**: कस्टमर और इन्वेंटरी एजेंट्स के साथ एक प्रोडक्शन-रेडी मल्टी-एजेंट AI समाधान परिनियोजित और प्रबंधित करें

---

### 🔍 अध्याय 6: पूर्व-परिनियोजन सत्यापन और योजना
**पूर्वापेक्षाएँ**: अध्याय 4 पूरा किया हुआ  
**अवधि**: 1 घंटा  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- क्षमता योजना और संसाधन सत्यापन
- SKU चयन रणनीतियाँ
- प्री-फ्लाइट चेक और ऑटोमेशन

#### शैक्षिक संसाधन
- **📊 योजना**: [क्षमता योजना](docs/chapter-06-pre-deployment/capacity-planning.md) - संसाधन सत्यापन
- **💰 चयन**: [SKU चयन](docs/chapter-06-pre-deployment/sku-selection.md) - लागत-प्रभावी विकल्प
- **✅ सत्यापन**: [प्री-फ्लाइट जाँच](docs/chapter-06-pre-deployment/preflight-checks.md) - स्वचालित स्क्रिप्ट्स

#### व्यावहारिक अभ्यास
- क्षमता सत्यापन स्क्रिप्ट्स चलाएँ
- लागत के लिए SKU चयन अनुकूलित करें
- स्वचालित पूर्व-परिनियोजन जाँच लागू करें

**💡 अध्याय परिणाम**: निष्पादन से पहले परिनियोजन सत्यापित और अनुकूलित करें

---

### 🚨 अध्याय 7: Troubleshooting और डिबगिंग
**पूर्वापेक्षाएँ**: कोई भी परिनियोजन अध्याय पूरा किया हुआ  
**अवधि**: 1-1.5 घंटे  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- प्रणालीबद्ध डिबगिंग दृष्टिकोण
- सामान्य समस्याएँ और समाधान
- AI-विशिष्ट समस्यानिवारण

#### शैक्षिक संसाधन
- **🔧 सामान्य समस्याएँ**: [सामान्य समस्याएँ](docs/chapter-07-troubleshooting/common-issues.md) - FAQ और समाधान
- **🕵️ डिबगिंग**: [डिबगिंग गाइड](docs/chapter-07-troubleshooting/debugging.md) - चरण-दर-चरण रणनीतियाँ
- **🤖 AI मुद्दे**: [AI-विशिष्ट समस्यानिवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI सेवा समस्याएँ

#### व्यावहारिक अभ्यास
- परिनियोजन विफलताओं का निदान करें
- प्रमाणीकरण समस्याओं का समाधान करें
- AI सेवा कनेक्टिविटी डिबग करें

**💡 अध्याय परिणाम**: सामान्य परिनियोजन समस्याओं का स्वतंत्र रूप से निदान और समाधान करें

---

### 🏢 अध्याय 8: प्रोडक्शन और एंटरप्राइज़ पैटर्न
**पूर्वापेक्षाएँ**: अध्याय 1-4 पूरे किए हुए  
**अवधि**: 2-3 घंटे  
**जटिलता**: ⭐⭐⭐⭐

#### आप क्या सीखेंगे
- प्रोडक्शन परिनियोजन रणनीतियाँ
- एंटरप्राइज़ सुरक्षा पैटर्न
- मॉनिटरिंग और लागत अनुकूलन

#### शैक्षिक संसाधन
- **🏭 प्रोडक्शन**: [प्रोडक्शन AI सर्वोत्तम प्रथाएँ](docs/chapter-08-production/production-ai-practices.md) - एंटरप्राइज़ पैटर्न
- **📝 उदाहरण**: [माइक्रोसर्विसेज उदाहरण](../../examples/microservices) - जटिल आर्किटेक्चर
- **📊 मॉनिटरिंग**: [Application Insights एकीकरण](docs/chapter-06-pre-deployment/application-insights.md) - मॉनिटरिंग

#### व्यावहारिक अभ्यास
- एंटरप्राइज़ सुरक्षा पैटर्न लागू करें
- व्यापक मॉनिटरिंग सेट अप करें
- उचित गवर्नेंस के साथ प्रोडक्शन में परिनियोजित करें

**💡 अध्याय परिणाम**: पूर्ण प्रोडक्शन क्षमताओं के साथ एंटरप्राइज़-तैयार एप्लिकेशन परिनियोजित करें

---

## 🎓 कार्यशाला अवलोकन: हैंड्स-ऑन लर्निंग अनुभव

> **⚠️ कार्यशाला स्थिति: सक्रिय विकास**  
> कार्यशाला सामग्री वर्तमान में विकसित और परिष्कृत की जा रही है। मुख्य मॉड्यूल कार्यात्मक हैं, लेकिन कुछ उन्नत सेक्शन अपूर्ण हैं। हम सभी सामग्री को पूरा करने के लिए सक्रिय रूप से काम कर रहे हैं। [प्रगति ट्रैक करें →](workshop/README.md)

### इंटरएक्टिव कार्यशाला सामग्री
**ब्राउज़र-आधारित उपकरणों और निर्देशित अभ्यासों के साथ व्यापक हैंड्स-ऑन लर्निंग**
हमारे वर्कशॉप सामग्री अध्याय-आधारित पाठ्यक्रम के साथ पूरक एक संरचित, इंटरैक्टिव सीखने का अनुभव प्रदान करती है। यह वर्कशॉप स्व-गतित शिक्षण और प्रशिक्षक-निर्देशित सत्रों दोनों के लिए डिज़ाइन की गई है।

#### 🛠️ वर्कशॉप सुविधाएँ
- **ब्राउज़र-आधारित इंटरफ़ेस**: सर्च, कॉपी, और थीम सुविधाओं के साथ पूरा MkDocs-संचालित वर्कशॉप
- **GitHub Codespaces एकीकरण**: एक-क्लिक विकास वातावरण सेटअप
- **संगठित शिक्षण मार्ग**: 8-मॉड्यूल मार्गदर्शित अभ्यास (कुल 3-4 घंटे)
- **प्रगतिशील कार्यप्रणाली**: परिचय → चयन → सत्यापन → विघटन → कॉन्फ़िगरेशन → अनुकूलन → रद्द करना → समापन
- **इंटरैक्टिव DevContainer पर्यावरण**: पूर्व-कॉन्फ़िगर किए गए टूल और निर्भरताएँ

#### 📚 वर्कशॉप मॉड्यूल संरचना
वर्कशॉप एक **8-मॉड्यूल प्रगतिशील कार्यप्रणाली** का पालन करती है जो आपको खोज से डिप्लॉयमेंट महारत तक ले जाती है:

| मॉड्यूल | विषय | आप क्या करेंगे | अवधि |
|--------|-------|----------------|----------|
| **0. परिचय** | वर्कशॉप का अवलोकन | शिक्षण उद्देश्यों, पूर्व-आवश्यकताओं, और वर्कशॉप संरचना को समझें | 15 मिनट |
| **1. चयन** | टेम्पलेट खोज | AZD टेम्पलेट्स का अन्वेषण करें और अपने परिदृश्य के लिए सही AI टेम्पलेट चुनें | 20 मिनट |
| **2. सत्यापन** | डिप्लॉय और सत्यापित करें | टेम्पलेट को `azd up` के साथ डिप्लॉय करें और इंफ्रास्ट्रक्चर के काम करने की पुष्टि करें | 30 मिनट |
| **3. विघटन** | संरचना को समझें | GitHub Copilot का उपयोग करके टेम्पलेट आर्किटेक्चर, Bicep फ़ाइलों, और कोड संगठन का अन्वेषण करें | 30 मिनट |
| **4. कॉन्फ़िगरेशन** | azure.yaml का गहन अध्ययन | `azure.yaml` कॉन्फ़िगरेशन, लाइफसाइकल हुक, और एनवायरनमेंट वेरिएबल्स में दक्षता हासिल करें | 30 मिनट |
| **5. अनुकूलन** | इसे अपना बनाएं | AI Search, ट्रेसिंग, मूल्यांकन सक्षम करें, और अपने परिदृश्य के लिए अनुकूलित करें | 45 मिनट |
| **6. रद्द करना** | साफ़-सफाई | `azd down --purge` के साथ संसाधनों को सुरक्षित रूप से डीप्रोविज़न करें | 15 मिनट |
| **7. समापन** | अगले कदम | उपलब्धियों, प्रमुख अवधारणाओं की समीक्षा करें, और अपनी सीखने की यात्रा जारी रखें | 15 मिनट |

**वर्कशॉप प्रवाह:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 वर्कशॉप के साथ शुरुआत
```bash
# विकल्प 1: GitHub Codespaces (अनुशंसित)
# रिपॉजिटरी में "Code" → "Create codespace on main" पर क्लिक करें

# विकल्प 2: स्थानीय विकास
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md में सेटअप निर्देशों का पालन करें
```

#### 🎯 वर्कशॉप सीखने के परिणाम
वर्कशॉप पूरा करने पर, प्रतिभागी:
- **उत्पादन-स्तर AI एप्लिकेशन डिप्लॉय करें**: Microsoft Foundry सेवाओं के साथ AZD का उपयोग करें
- **मल्टी-एजेंट आर्किटेक्चर में महारत हासिल करें**: समन्वित AI एजेंट समाधान लागू करें
- **सुरक्षा सर्वोत्तम प्रथाओं को लागू करें**: प्रमाणीकरण और एक्सेस नियंत्रण कॉन्फ़िगर करें
- **स्केल के लिए अनुकूलित करें**: लागत-प्रभावी, प्रदर्शनक्षम डिप्लॉयमेंट डिजाइन करें
- **डिप्लॉयमेंट की समस्याओं का निवारण करें**: सामान्य मुद्दों को स्वतंत्र रूप से हल करें

#### 📖 वर्कशॉप संसाधन
- **🎥 इंटरैक्टिव गाइड**: [वर्कशॉप सामग्री](workshop/README.md) - ब्राउज़र-आधारित शिक्षण वातावरण
- **📋 मॉड्यूल-दर-मॉड्यूल निर्देश**:
  - [0. परिचय](workshop/docs/instructions/0-Introduction.md) - वर्कशॉप का अवलोकन और उद्देश्य
  - [1. चयन](workshop/docs/instructions/1-Select-AI-Template.md) - AI टेम्पलेट खोजें और चुनें
  - [2. सत्यापन](workshop/docs/instructions/2-Validate-AI-Template.md) - टेम्पलेट डिप्लॉय और सत्यापित करें
  - [3. विघटन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - टेम्पलेट आर्किटेक्चर का अन्वेषण करें
  - [4. कॉन्फ़िगरेशन](workshop/docs/instructions/4-Configure-AI-Template.md) - `azure.yaml` में महारत हासिल करें
  - [5. अनुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) - अपने परिदृश्य के लिए अनुकूलित करें
  - [6. रद्द करना](workshop/docs/instructions/6-Teardown-Infrastructure.md) - संसाधनों की सफाई
  - [7. समापन](workshop/docs/instructions/7-Wrap-up.md) - समीक्षा और अगले कदम
- **🛠️ AI वर्कशॉप लैब**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-केंद्रित अभ्यास
- **💡 त्वरित आरंभ**: [Workshop Setup Guide](workshop/README.md#quick-start) - वातावरण कॉन्फ़िगरेशन

**उपयुक्त है**: कॉर्पोरेट प्रशिक्षण, विश्वविद्यालय पाठ्यक्रम, स्व-गतित सीखना, और डेवलपर बूटकैंप।

---

## 📖 गहरा अध्ययन: AZD क्षमताएँ

मूल बातों से आगे, AZD उत्पादन डिप्लॉयमेंट के लिए शक्तिशाली सुविधाएँ प्रदान करता है:

- **टेम्पलेट-आधारित डिप्लॉयमेंट्स** - सामान्य एप्लिकेशन पैटर्न के लिए पूर्व-निर्मित टेम्पलेट्स का उपयोग करें
- **Infrastructure as Code** - Bicep या Terraform का उपयोग करके Azure संसाधनों का प्रबंधन करें  
- **एकीकृत वर्कफ़्लो** - एप्लिकेशन को निर्बाध रूप से प्रोविजन, डिप्लॉय, और मॉनिटर करें
- **डेवलपर-फ्रेंडली** - डेवलपर उत्पादकता और अनुभव के लिए अनुकूलित

### **AZD + Microsoft Foundry: AI डिप्लॉयमेंट के लिए उत्तम**

**AI समाधानों के लिए AZD क्यों?** AZD AI डेवलपर्स द्वारा सामना की जाने वाली शीर्ष चुनौतियों को संबोधित करता है:

- **AI-तैयार टेम्पलेट्स** - Azure OpenAI, Cognitive Services, और ML वर्कलोड के लिए पूर्व-कॉन्फ़िगर टेम्पलेट्स
- **सुरक्षित AI डिप्लॉयमेंट्स** - AI सेवाओं, API कुंजी, और मॉडल एन्डपॉइंट्स के लिए बिल्ट-इन सुरक्षा पैटर्न  
- **उत्पादन AI पैटर्न** - स्केलेबल, लागत-प्रभावी AI एप्लिकेशन डिप्लॉयमेंट के लिए सर्वोत्तम प्रथाएँ
- **एंड-टू-एंड AI वर्कफ़्लो** - मॉडल विकास से लेकर उत्पादन डिप्लॉयमेंट तक उपयुक्त मॉनिटरिंग के साथ
- **लागत अनुकूलन** - AI वर्कलोड के लिए स्मार्ट रिसोर्स अलोकेशन और स्केलिंग रणनीतियाँ
- **Microsoft Foundry एकीकरण** - Microsoft Foundry मॉडल कैटलॉग और एन्डपॉइंट्स से निर्बाध कनेक्शन

---

## 🎯 टेम्पलेट्स और उदाहरण पुस्तकालय

### प्रमुख: Microsoft Foundry टेम्पलेट्स
**यदि आप AI एप्लिकेशन डिप्लॉय कर रहे हैं तो यहाँ से शुरू करें!**

> **नोट:** ये टेम्पलेट विभिन्न AI पैटर्न दिखाते हैं। कुछ बाहरी Azure Samples हैं, अन्य स्थानीय कार्यान्वयन हैं।

| टेम्पलेट | अध्याय | जटिलता | सेवाएँ | प्रकार |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | बाहरी |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | अध्याय 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| बाहरी |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | बाहरी |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | बाहरी |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | बाहरी |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | बाहरी |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **स्थानीय** |

### प्रमुख: पूर्ण शिक्षण परिदृश्य
**उत्पादन-तैयार एप्लिकेशन टेम्पलेट्स जो शिक्षण अध्यायों से मैप किए गए हैं**

| टेम्पलेट | शिक्षण अध्याय | जटिलता | मुख्य सीख |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | बुनियादी AI डिप्लॉयमेंट पैटर्न |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | Azure AI Search के साथ RAG कार्यान्वयन |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | अध्याय 4 | ⭐⭐ | डॉक्यूमेंट इंटेलिजेंस एकीकरण |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | एजेंट फ्रेमवर्क और फ़ंक्शन कॉलिंग |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐ | एन्टरप्राइज़ AI ऑर्केस्ट्रेशन |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | कस्टमर और इन्वेंट्री एजेंट्स के साथ मल्टी-एजेंट आर्किटेक्चर |

### प्रकार के अनुसार उदाहरणों से सीखना

> **📌 स्थानीय बनाम बाहरी उदाहरण:**  
> **स्थानीय उदाहरण** (इस रिपो में) = तुरंत उपयोग के लिए तैयार  
> **बाहरी उदाहरण** (Azure Samples) = लिंक्ड रिपॉजिटरीज़ से क्लोन करें

#### स्थानीय उदाहरण (तुरंत उपयोग के लिए तैयार)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM टेम्पलेट्स के साथ पूर्ण उत्पादन-तैयार कार्यान्वयन
  - मल्टी-एजेंट आर्किटेक्चर (कस्टमर + इन्वेंट्री एजेंट्स)
  - व्यापक मॉनिटरिंग और मूल्यांकन
  - ARM टेम्पलेट द्वारा एक-क्लिक डिप्लॉयमेंट

#### स्थानीय उदाहरण - कंटेनर एप्लिकेशन (अध्याय 2-5)
**इस रिपॉज़िटरी में व्यापक कंटेनर डिप्लॉयमेंट उदाहरण:**
- [**Container App Examples**](examples/container-app/README.md) - कंटेनराइज़्ड डिप्लॉयमेंट्स के लिए पूरा गाइड
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - scale-to-zero के साथ बेसिक REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - उत्पादन-तैयार मल्टी-सर्विस डिप्लॉयमेंट
  - क्विक स्टार्ट, उत्पादन, और उन्नत डिप्लॉयमेंट पैटर्न
  - मॉनिटरिंग, सुरक्षा, और लागत अनुकूलन मार्गदर्शन

#### बाहरी उदाहरण - सरल एप्लिकेशन (अध्याय 1-2)
**शुरू करने के लिए इन Azure Samples रिपॉजिटरीज़ को क्लोन करें:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - बुनियादी डिप्लॉयमेंट पैटर्न
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - स्थैतिक सामग्री डिप्लॉयमेंट
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API डिप्लॉयमेंट

#### बाहरी उदाहरण - डेटाबेस एकीकरण (अध्याय 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - डेटाबेस कनेक्टिविटी पैटर्न
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - सर्वरलेस डेटा वर्कफ़्लो

#### बाहरी उदाहरण - उन्नत पैटर्न (अध्याय 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - मल्टी-सर्विस आर्किटेक्चर
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - बैकग्राउंड प्रोसेसिंग  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - उत्पादन-तैयार ML पैटर्न

### बाहरी टेम्पलेट संग्रह
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - आधिकारिक और समुदाय टेम्पलेट्स का क्यूरेटेड संग्रह
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn टेम्पलेट दस्तावेज़ीकरण
- [**Examples Directory**](examples/README.md) - स्थानीय लर्निंग उदाहरण विस्तृत व्याख्याओं के साथ

---

## 📚 शिक्षण संसाधन और संदर्भ

### त्वरित संदर्भ
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - अध्याय द्वारा व्यवस्थित आवश्यक azd कमांड
- [**Glossary**](resources/glossary.md) - Azure और azd शब्दावली  
- [**FAQ**](resources/faq.md) - सामान्य प्रश्न अध्यायवार व्यवस्थित
- [**Study Guide**](resources/study-guide.md) - व्यापक अभ्यास प्रश्नोत्तरी

### हैंड्स-ऑन वर्कशॉप्स
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - अपने AI समाधानों को AZD-डिप्लॉयेबल बनाएं (2-3 घंटे)
- [**Interactive Workshop**](workshop/README.md) - MkDocs और GitHub Codespaces के साथ 8-मॉड्यूल मार्गदर्शित अभ्यास
  - पालन करता है: परिचय → चयन → सत्यापन → विघटन → कॉन्फ़िगरेशन → अनुकूलन → रद्द करना → समापन

### बाहरी शिक्षण संसाधन
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 त्वरित समस्या निवारण मार्गदर्शिका

शुरुआती उपयोगकर्ताओं को होने वाली सामान्य समस्याएँ और उनके तात्कालिक समाधान:

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# पहले AZD स्थापित करें
# विंडोज़ (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# स्थापना सत्यापित करें
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" या "Subscription not set"</strong></summary>

```bash
# उपलब्ध सब्सक्रिप्शन सूचीबद्ध करें
az account list --output table

# डिफ़ॉल्ट सब्सक्रिप्शन सेट करें
az account set --subscription "<subscription-id-or-name>"

# AZD पर्यावरण के लिए सेट करें
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# सत्यापित करें
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" या "Quota exceeded"</strong></summary>

```bash
# किसी अन्य Azure क्षेत्र का प्रयास करें
azd env set AZURE_LOCATION "westus2"
azd up

# या विकास में छोटे SKUs का उपयोग करें
# infra/main.parameters.json संपादित करें:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>
```bash
# विकल्प 1: साफ़ करें और फिर से प्रयास करें
azd down --force --purge
azd up

# विकल्प 2: केवल बुनियादी ढांचे को ठीक करें
azd provision

# विकल्प 3: विस्तृत स्थिति की जांच करें
azd show

# विकल्प 4: Azure Monitor में लॉग्स की जांच करें
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "प्रमाणीकरण असफल" या "टोकन की अवधि समाप्त"</strong></summary>

```bash
# पुनः प्रमाणित करें
az logout
az login

azd auth logout
azd auth login

# प्रमाणीकरण सत्यापित करें
az account show
```
</details>

<details>
<summary><strong>❌ "संसाधन पहले से मौजूद है" या नामकरण संघर्ष</strong></summary>

```bash
# AZD अद्वितीय नाम बनाता है, लेकिन यदि टकराव हो:
azd down --force --purge

# फिर नए वातावरण के साथ पुनः प्रयास करें
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ टेम्पलेट तैनाती बहुत समय ले रही है</strong></summary>

**सामान्य प्रतीक्षा समय:**
- सरल वेब ऐप: 5-10 मिनट
- डेटाबेस वाला ऐप: 10-15 मिनट
- एआई अनुप्रयोग: 15-25 मिनट (OpenAI प्राविजनिंग धीमा है)

```bash
# प्रगति की जाँच करें
azd show

# यदि 30 मिनट से अधिक समय तक अटक गए हैं, तो Azure Portal की जाँच करें:
azd monitor
# असफल डिप्लॉयमेंट्स देखें
```
</details>

<details>
<summary><strong>❌ "अनुमति अस्वीकृत" या "निषिद्ध"</strong></summary>

```bash
# अपनी Azure भूमिका जाँच करें
az role assignment list --assignee $(az account show --query user.name -o tsv)

# आपको कम से कम "Contributor" भूमिका चाहिए
# अपने Azure व्यवस्थापक से निम्न प्रदान करने को कहें:
# - Contributor (संसाधनों के लिए)
# - User Access Administrator (भूमिका आवंटन के लिए)
```
</details>

<details>
<summary><strong>❌ तैनात किए गए एप्लिकेशन URL को नहीं ढूँढ पा रहे हैं</strong></summary>

```bash
# सभी सेवा एंडपॉइंट दिखाएँ
azd show

# या Azure पोर्टल खोलें
azd monitor

# विशिष्ट सेवा की जाँच करें
azd env get-values
# *_URL वेरिएबल्स के लिए देखें
```
</details>

### 📚 पूर्ण समस्या निवारण संसाधन

- **सामान्य समस्या मार्गदर्शिका:** [विस्तृत समाधान](docs/chapter-07-troubleshooting/common-issues.md)
- **एआई-विशेष समस्याएँ:** [एआई समस्या निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **डिबगिंग मार्गदर्शिका:** [कदम-दर-कदम डिबगिंग](docs/chapter-07-troubleshooting/debugging.md)
- **सहायता प्राप्त करें:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 पाठ्यक्रम पूरा करना और प्रमाणन

### प्रगति ट्रैकिंग
प्रत्येक अध्याय के माध्यम से अपनी सीखने की प्रगति ट्रैक करें:

- [ ] **अध्याय 1**: बुनियाद और त्वरित शुरुआत ✅
- [ ] **अध्याय 2**: एआई-प्रथम विकास ✅  
- [ ] **अध्याय 3**: कॉन्फ़िगरेशन और प्रमाणीकरण ✅
- [ ] **अध्याय 4**: कोड के रूप में इन्फ्रास्ट्रक्चर और तैनाती ✅
- [ ] **अध्याय 5**: मल्टी-एजेंट एआई समाधान ✅
- [ ] **अध्याय 6**: पहले से तैनाती सत्यापन और योजना ✅
- [ ] **अध्याय 7**: समस्या निवारण और डिबगिंग ✅
- [ ] **अध्याय 8**: उत्पादन और एंटरप्राइज़ पैटर्न ✅

### सीखने का सत्यापन
प्रत्येक अध्याय पूरा करने के बाद, अपने ज्ञान का सत्यापन करें:
1. **व्यावहारिक अभ्यास**: अध्याय की हैंड्स-ऑन तैनाती पूर्ण करें
2. **ज्ञान जांच**: अपने अध्याय के लिए FAQ अनुभाग की समीक्षा करें
3. **समुदाय चर्चा**: Azure Discord में अपना अनुभव साझा करें
4. **अगला अध्याय**: अगले जटिलता स्तर पर जाएँ

### पाठ्यक्रम पूरा करने के लाभ
सभी अध्याय पूरा करने पर, आपके पास होगा:
- **उत्पादन अनुभव**: Azure पर वास्तविक एआई अनुप्रयोग तैनात किए हुए
- **पेशेवर कौशल**: एंटरप्राइज़-तैयार तैनाती क्षमताएँ  
- **समुदाय पहचान**: Azure डेवलपर समुदाय के सक्रिय सदस्य
- **कैरियर उन्नति**: मांग में AZD और एआई तैनाती विशेषज्ञता

---

## 🤝 समुदाय और सहायता

### सहायता और समर्थन प्राप्त करें
- **तकनीकी समस्याएँ**: [बग रिपोर्ट करें और फ़ीचर अनुरोध करें](https://github.com/microsoft/azd-for-beginners/issues)
- **सीखने के प्रश्न**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **एआई-विशेष सहायता**: शामिल हों [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **डॉक्यूमेंटेशन**: [आधिकारिक Azure Developer CLI दस्तावेज़](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord से समुदाय की अंतर्दृष्टियाँ

**हालिया मतदान परिणाम #Azure चैनल से:**
- **45%** डेवलपर्स AZD का उपयोग AI वर्कलोड्स के लिए करना चाहते हैं
- **मुख्य चुनौतियाँ**: मल्टी-सर्विस तैनाती, क्रेडेंशियल प्रबंधन, उत्पादन तैयारी  
- **सबसे अधिक अनुरोध किए गए**: एआई-विशेष टेम्पलेट, समस्या निवारण मार्गदर्शिकाएँ, सर्वश्रेष्ठ प्रथाएँ

**हमारे समुदाय में शामिल हों ताकि आप:**
- अपना AZD + AI अनुभव साझा करें और मदद पाएं
- नए एआई टेम्पलेट्स के प्रारंभिक पूर्वावलोकन तक पहुँचें
- एआई तैनाती सर्वोत्तम प्रथाओं में योगदान दें
- भविष्य में AI + AZD फीचर विकास को प्रभावित करें

### पाठ्यक्रम में योगदान
हम योगदान का स्वागत करते हैं! विवरण के लिए कृपया हमारा [योगदान मार्गदर्शिका](CONTRIBUTING.md) पढ़ें:
- **सामग्री सुधार**: मौजूदा अध्यायों और उदाहरणों को बेहतर बनाएं
- **नए उदाहरण**: वास्तविक दुनिया के परिदृश्यों और टेम्पलेट जोड़ें  
- **अनुवाद**: मल्टी-लैंग्वेज समर्थन बनाए रखने में मदद करें
- **बग रिपोर्ट्स**: सटीकता और स्पष्टता में सुधार करें
- **समुदाय मानक**: हमारे समावेशी सामुदायिक दिशानिर्देशों का पालन करें

---

## 📄 पाठ्यक्रम जानकारी

### लाइसेंस
यह प्रोजेक्ट MIT लाइसेंस के अंतर्गत लाइसेंस प्राप्त है - विवरण के लिए [LICENSE](../../LICENSE) फ़ाइल देखें।

### संबंधित Microsoft लर्निंग संसाधन

हमारी टीम अन्य व्यापक लर्निंग कोर्स भी तैयार करती है:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j शुरुआती के लिए](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js शुरुआती के लिए](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain शुरुआती के लिए](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD शुरुआती के लिए](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI शुरुआती के लिए](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP शुरुआती के लिए](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents शुरुआती के लिए](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![जनरेटिव AI शुरुआती के लिए](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![एमएल शुरुआती के लिए](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![डेटा साइंस शुरुआती के लिए](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI शुरुआती के लिए](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![साइबरसिक्योरिटी शुरुआती के लिए](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![वेब डेवलप शुरुआती के लिए](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT शुरुआती के लिए](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR डेवलपमेंट शुरुआती के लिए](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot AI-पेयर प्रोग्रामिंग के लिए](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET के लिए](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot एडवेंचर](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ पाठ्यक्रम नेविगेशन

**🚀 सीखना शुरू करने के लिए तैयार हैं?**

**शुरुआती**: शुरू करें [अध्याय 1: बुनियाद और त्वरित शुरुआत](../..)
**AI Developers**: पर जाएँ [अध्याय 2: AI-प्रथम विकास](../..)  
**Experienced Developers**: आरंभ करें [अध्याय 3: विन्यास और प्रमाणीकरण](../..)

**Next Steps**: [शुरू करें अध्याय 1 - AZD मूल बातें](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यह दस्तावेज़ एआई अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या असंगतताएँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में अधिकृत स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->