# AZD शुरुआती के लिए: एक संरचित अध्ययन यात्रा

![AZD-शुरूआत](../../translated_images/hi/azdbeginners.5527441dd9f74068.webp) 

[![GitHub वॉचर्स](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub फोर्क्स](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub स्टार्स](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure डिस्कॉर्ड](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry डिस्कॉर्ड](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### स्वचालित अनुवाद (हमेशा अद्यतित)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[अरबी](../ar/README.md) | [बंगाली](../bn/README.md) | [बुल्गेरियाई](../bg/README.md) | [बर्मी (म्यांमार)](../my/README.md) | [चीनी (सरलीकृत)](../zh-CN/README.md) | [चीनी (पारंपरिक, हांगकांग)](../zh-HK/README.md) | [चीनी (पारंपरिक, मकाऊ)](../zh-MO/README.md) | [चीनी (पारंपरिक, ताइवान)](../zh-TW/README.md) | [क्रोएशियाई](../hr/README.md) | [चेक](../cs/README.md) | [डैनिश](../da/README.md) | [डच](../nl/README.md) | [एस्टोनियाई](../et/README.md) | [फिनिश](../fi/README.md) | [फ्रेंच](../fr/README.md) | [जर्मन](../de/README.md) | [ग्रीक](../el/README.md) | [हिब्रू](../he/README.md) | [हिंदी](./README.md) | [हंगेरियन](../hu/README.md) | [इंडोनेशियाई](../id/README.md) | [इटालियन](../it/README.md) | [जापानी](../ja/README.md) | [कन्नड़](../kn/README.md) | [कोरियाई](../ko/README.md) | [लिथुआनियाई](../lt/README.md) | [मलय](../ms/README.md) | [मलयालम](../ml/README.md) | [मराठी](../mr/README.md) | [नेपाली](../ne/README.md) | [नाइजीरियाई पिड्ज़िन](../pcm/README.md) | [नॉर्वेजियन](../no/README.md) | [फ़ारसी (Farsi)](../fa/README.md) | [पोलिश](../pl/README.md) | [पुर्तगाली (ब्राज़ील)](../pt-BR/README.md) | [पुर्तगाली (पुर्तगाल)](../pt-PT/README.md) | [पंजाबी (गुरमुखी)](../pa/README.md) | [रोमानियाई](../ro/README.md) | [रूसी](../ru/README.md) | [सर्बियाई (सिरिलिक)](../sr/README.md) | [स्लोवाक](../sk/README.md) | [स्लोवेनियाई](../sl/README.md) | [स्पेनिश](../es/README.md) | [स्वाहिली](../sw/README.md) | [स्वीडिश](../sv/README.md) | [तागालोग (फिलिपिनो)](../tl/README.md) | [तमिल](../ta/README.md) | [तेलुगु](../te/README.md) | [थाई](../th/README.md) | [तुर्की](../tr/README.md) | [यूक्रेनी](../uk/README.md) | [उर्दू](../ur/README.md) | [वियतनामी](../vi/README.md)

> **क्या आप स्थानीय रूप से क्लोन करना पसंद करते हैं?**
>
> इस रिपॉजिटरी में 50+ भाषा अनुवाद शामिल हैं जो डाउनलोड साइज को काफी बढ़ा देते हैं। अनुवाद के बिना क्लोन करने के लिए sparse checkout का उपयोग करें:
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
> यह आपको कोर्स पूरा करने के लिए आवश्यक सब कुछ देता है और डाउनलोड बहुत तेज़ होता है।
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 आज azd में क्या नया है

Azure Developer CLI पारंपरिक वेब ऐप्स और APIs से परे बढ़ गया है। आज, azd Azure पर किसी भी एप्लिकेशन को तैनात करने के लिए एकल टूल है — जिसमें AI-समर्थित एप्लिकेशन और बुद्धिमान एजेंट शामिल हैं।

यह आपके लिए क्या मायने रखता है:

- **AI एजेंट अब azd वर्कलोड्स में प्रथम श्रेणी हैं।** आप वही `azd init` → `azd up` वर्कफ़्लो उपयोग करके AI एजेंट प्रोजेक्ट्स को इनिशियलाइज़, तैनात, और प्रबंधित कर सकते हैं।
- **Microsoft Foundry एकीकरण** मॉडल तैनाती, एजेंट होस्टिंग, और AI सेवा कॉन्फ़िगरेशन को सीधे azd टेम्पलेट इकोसिस्टम में लाता है।
- **कोर वर्कफ़्लो नहीं बदला है।** चाहे आप एक todo ऐप, एक माइक्रोसर्विस, या एक मल्टी-एजेंट AI समाधान तैनात कर रहे हों, कमांड वही हैं।

यदि आपने पहले azd का उपयोग किया है, तो AI सपोर्ट एक स्वाभाविक विस्तार है — कोई अलग टूल या उन्नत ट्रैक नहीं। यदि आप नए हैं, तो आप एक ऐसा वर्कफ़्लो सीखेंगे जो हर चीज़ के लिए काम करता है।

---

## 🚀 Azure Developer CLI (azd) क्या है?

**Azure Developer CLI (azd)** एक डेवलपर-फ्रेंडली कमांड-लाइन टूल है जो Azure पर एप्लिकेशन तैनात करना सरल बनाता है। दर्जनों Azure संसाधनों को मैन्युअल रूप से बनाने और कनेक्ट करने के बजाय, आप एक ही कमांड से पूरे एप्लिकेशन तैनात कर सकते हैं।

### `azd up` का जादू

```bash
# यह एकल कमांड सब कुछ करता है:
# ✅ सभी Azure संसाधन बनाता है
# ✅ नेटवर्किंग और सुरक्षा कॉन्फ़िगर करता है
# ✅ आपके एप्लिकेशन कोड का निर्माण करता है
# ✅ Azure पर तैनात करता है
# ✅ आपको एक कार्यशील URL देता है
azd up
```

**बस इतना ही!** कोई Azure पोर्टल पर क्लिकिंग नहीं, कोई जटिल ARM टेम्पलेट पहले सीखने की जरूरत नहीं, कोई मैन्युअल कॉन्फ़िगरेशन नहीं - बस Azure पर काम करने वाले एप्लिकेशन।

---

## ❓ Azure Developer CLI बनाम Azure CLI: क्या अंतर है?

यह शुरुआती लोगों द्वारा पूछा जाने वाला सबसे सामान्य प्रश्न है। यहाँ सरल उत्तर है:

| विशेषता | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **उद्देश्य** | व्यक्तिगत Azure संसाधनों का प्रबंधन करें | पूरे एप्लिकेशन तैनात करें |
| **मानसिकता** | इन्फ्रास्ट्रक्चर-केंद्रित | एप्लीकेशन-केंद्रित |
| **उदाहरण** | `az webapp create --name myapp...` | `azd up` |
| **सीखने की अवस्था** | Azure सेवाओं को जानना जरूरी है | सिर्फ़ अपने ऐप को जानें |
| **सबसे उपयुक्त** | DevOps, इन्फ्रास्ट्रक्चर | डेवलपर्स, प्रोटोटाइपिंग |

### सरल उपमा

- **Azure CLI** ऐसे है जैसे घर बनाने के सभी औज़ार मिले हों - हथौड़े, आरी, कीलें। आप कुछ भी बना सकते हैं, लेकिन आपको निर्माण का ज्ञान होना चाहिए।
- **Azure Developer CLI** ऐसे है जैसे आप एक ठेकेदार को हायर करें - आप बताते हैं क्या चाहते हैं, और वे निर्माण संभालते हैं।

### किसे कब उपयोग करें

| परिदृश्य | इसका उपयोग करें |
|----------|------------------|
| "मुझे अपना वेब ऐप जल्दी तैनात करना है" | `azd up` |
| "मुझे सिर्फ़ एक स्टोरेज अकाउंट बनाना है" | `az storage account create` |
| "मैं एक संपूर्ण AI एप्लिकेशन बना रहा/रही हूँ" | `azd init --template azure-search-openai-demo` |
| "मुझे किसी विशिष्ट Azure संसाधन का डिबग करना है" | `az resource show` |
| "मैं मिनटों में प्रोडक्शन-रेडी तैनाती चाहता/चाहती हूँ" | `azd up --environment production` |

### वे साथ काम करते हैं!

AZD अंतर्निहित रूप से Azure CLI का उपयोग करता है। आप दोनों का उपयोग कर सकते हैं:
```bash
# अपने ऐप को AZD के साथ तैनात करें
azd up

# फिर Azure CLI के साथ विशिष्ट संसाधनों को ठीक से समायोजित करें
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD में टेम्पलेट खोजें

शून्य से शुरू न करें! **Awesome AZD** तैयार-तैनात टेम्पलेट्स का समुदाय संग्रह है:

| संसाधन | विवरण |
|----------|-------------|
| 🔗 [**Awesome AZD गैलरी**](https://azure.github.io/awesome-azd/) | एक-क्लिक तैनाती के साथ 200+ टेम्पलेट ब्राउज़ करें |
| 🔗 [**टेम्पलेट सबमिट करें**](https://github.com/Azure/awesome-azd/issues) | समुदाय में अपना टेम्पलेट योगदान दें |
| 🔗 [**GitHub रिपॉज़िटरी**](https://github.com/Azure/awesome-azd) | स्टार दें और स्रोत एक्सप्लोर करें |

### Awesome AZD से लोकप्रिय AI टेम्पलेट्स

```bash
# माइक्रोसॉफ्ट फाउंड्री मॉडल्स + एआई सर्च के साथ RAG चैट
azd init --template azure-search-openai-demo

# त्वरित एआई चैट एप्लिकेशन
azd init --template openai-chat-app-quickstart

# फाउंड्री एजेंट्स के साथ एआई एजेंट्स
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 चरणों में शुरूआत

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
# एक टेम्प्लेट से प्रारंभ करें
azd init --template todo-nodejs-mongo

# Azure पर तैनात करें (सब कुछ बनाता है!)
azd up
```

**🎉 बस इतना ही!** आपका ऐप अब Azure पर लाइव है।

### साफ़ करें (भूलें नहीं!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 इस कोर्स का उपयोग कैसे करें

यह कोर्स **प्रगतिशील सीखने** के लिए डिज़ाइन किया गया है - जहाँ आप सहज हों वहीं से शुरू करें और ऊपर की ओर काम करें:

| आपका अनुभव | यहाँ शुरू करें |
|-----------------|------------|
| **Azure के बिलकुल नए** | [अध्याय 1: आधार](#-chapter-1-foundation--quick-start) |
| **Azure जानते हैं, AZD में नए** | [अध्याय 1: आधार](#-chapter-1-foundation--quick-start) |
| **AI ऐप्स तैनात करना चाहते हैं** | [अध्याय 2: AI-फर्स्ट डेवलपमेंट](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **हाथों-हाथ अभ्यास चाहते हैं** | [🎓 इंटरैक्टिव वर्कशॉप](workshop/README.md) - 3-4 घंटे का मार्गदर्शित प्रयोगशाला |
| **प्रोडक्शन पैटर्न्स चाहिए** | [अध्याय 8: प्रोडक्शन & एंटरप्राइज़](#-chapter-8-production--enterprise-patterns) |

### त्वरित सेटअप

1. **इस रिपॉजिटरी को फ़ोर्क करें**: [![GitHub फोर्क्स](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **इसे क्लोन करें**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **मदद लें**: [Azure Discord समुदाय](https://discord.com/invite/ByRwuEEgH4)

> **क्या आप स्थानीय रूप से क्लोन करना पसंद करते हैं?**
>
> इस रिपॉजिटरी में 50+ भाषा अनुवाद शामिल हैं जो डाउनलोड साइज को काफी बढ़ा देते हैं। अनुवाद के बिना क्लोन करने के लिए sparse checkout का उपयोग करें:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> यह आपको कोर्स पूरा करने के लिए आवश्यक सब कुछ देता है और डाउनलोड बहुत तेज़ होता है।


## कोर्स अवलोकन

संरचित अध्यायों के माध्यम से Azure Developer CLI (azd) में महारत हासिल करें जो प्रगतिशील सीखने के लिए डिज़ाइन किए गए हैं। **Microsoft Foundry एकीकरण के साथ AI एप्लिकेशन तैनाती पर विशेष ध्यान।**

### आधुनिक डेवलपर्स के लिए यह कोर्स क्यों जरूरी है

Microsoft Foundry Discord समुदाय की अंतर्दृष्टियों के आधार पर, **45% डेवलपर्स AI वर्कलोड्स के लिए AZD का उपयोग करना चाहते हैं** लेकिन उन्हें निम्न चुनौतियों का सामना करना पड़ता है:
- जटिल बहु-सेवा AI आर्किटेक्चर
- प्रोडक्शन AI तैनाती के सर्वोत्तम अभ्यास  
- Azure AI सेवा एकीकरण और कॉन्फ़िगरेशन
- AI वर्कलोड्स के लिए लागत अनुकूलन
- AI-विशेष तैनाती समस्याओं का निवारण

### सीखने के उद्देश्य

इस संरचित कोर्स को पूरा करके, आप:
- **AZD के मूल सिद्धांतों में महारत हासिल करेंगे**: कोर अवधारणाएँ, इंस्टॉलेशन, और कॉन्फ़िगरेशन
- **AI अनुप्रयोग तैनात करेंगे**: Microsoft Foundry सेवाओं के साथ AZD का उपयोग करें
- **इन्फ्रास्ट्रक्चर ऐज़ कोड लागू करें**: Bicep टेम्पलेट्स के साथ Azure संसाधनों का प्रबंधन करें
- **तैनाती की समस्याओं का निवारण करें**: सामान्य समस्याओं को हल करें और डिबग करें
- **प्रोडक्शन के लिए अनुकूलित करें**: सुरक्षा, स्केलिंग, मॉनिटरिंग, और लागत प्रबंधन
- **मल्टी-एजेंट समाधान बनाएं**: जटिल AI आर्किटेक्चर तैनात करें

## 🗺️ कोर्स मानचित्र: अध्याय द्वारा त्वरित नेविगेशन

प्रत्येक अध्याय में एक समर्पित README है जिसमें सीखने के उद्देश्य, त्वरित शुरुआत, और अभ्यास होते हैं:

| अध्याय | विषय | पाठ | अवधि | जटिलता |
|---------|-------|---------|----------|------------|
| **[अध्याय 1: आधार](docs/chapter-01-foundation/README.md)** | शुरूआत | [AZD मूल बातें](docs/chapter-01-foundation/azd-basics.md) &#124; [स्थापना](docs/chapter-01-foundation/installation.md) &#124; [पहला प्रोजेक्ट](docs/chapter-01-foundation/first-project.md) | 30-45 मिनट | ⭐ |
| **[Ch 2: एआई विकास](docs/chapter-02-ai-development/README.md)** | AI-प्राथमिक ऐप्स | [Foundry एकीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [एआई एजेंट्स](docs/chapter-02-ai-development/agents.md) &#124; [मॉडल परिनियोजन](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [कार्यशाला](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 घंटे | ⭐⭐ |
| **[Ch 3: कॉन्फ़िगरेशन](docs/chapter-03-configuration/README.md)** | प्रमाणीकरण और सुरक्षा | [कॉन्फ़िगरेशन](docs/chapter-03-configuration/configuration.md) &#124; [प्रमाणीकरण और सुरक्षा](docs/chapter-03-configuration/authsecurity.md) | 45-60 मिनट | ⭐⭐ |
| **[Ch 4: इन्फ्रास्ट्रक्चर](docs/chapter-04-infrastructure/README.md)** | IaC और परिनियोजन | [परिनियोजन गाइड](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [प्राविजनिंग](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 घंटे | ⭐⭐⭐ |
| **[Ch 5: मल्टी-एजेंट](docs/chapter-05-multi-agent/README.md)** | एआई एजेंट समाधान | [रिटेल परिदृश्य](examples/retail-scenario.md) &#124; [समन्वय पैटर्न](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 घंटे | ⭐⭐⭐⭐ |
| **[Ch 6: प्री-डिप्लॉयमेंट](docs/chapter-06-pre-deployment/README.md)** | योजना और सत्यापन | [प्री-फ्लाइट चेक्स](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [क्षमता योजना](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU चयन](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [ऐप इंसाइट्स](docs/chapter-06-pre-deployment/application-insights.md) | 1 घंटा | ⭐⭐ |
| **[Ch 7: समस्या निवारण](docs/chapter-07-troubleshooting/README.md)** | डीबग और सुधार | [सामान्य समस्याएँ](docs/chapter-07-troubleshooting/common-issues.md) &#124; [डीबगिंग](docs/chapter-07-troubleshooting/debugging.md) &#124; [एआई समस्याएँ](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 घंटे | ⭐⭐ |
| **[Ch 8: उत्पादन](docs/chapter-08-production/README.md)** | एंटरप्राइज़ पैटर्न | [उत्पादन अभ्यास](docs/chapter-08-production/production-ai-practices.md) | 2-3 घंटे | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | हैंड्स-ऑन लैब | [परिचय](workshop/docs/instructions/0-Introduction.md) &#124; [चयन](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [सत्यापन](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [विघटन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [कॉन्फ़िगरेशन](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [अनुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [टियरडाउन](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [समापन](workshop/docs/instructions/7-Wrap-up.md) | 3-4 घंटे | ⭐⭐ |

**कुल पाठ्यक्रम अवधि:** ~10-14 घंटे | **कौशल उन्नति:** शुरुआत → उत्पादन-तैयार

---

## 📚 सीखने के अध्याय

*अपने अनुभव स्तर और लक्ष्यों के आधार पर अपनी सीखने की राह चुनें*

### 🚀 अध्याय 1: नींव और त्वरित शुरुआत
**पूर्व आवश्यकताएँ**: Azure सदस्यता, बुनियादी कमांड लाइन ज्ञान  
**समयावधि**: 30-45 मिनट  
**जटिलता**: ⭐

#### आप क्या सीखेंगे
- Azure Developer CLI के मूल सिद्धांतों की समझ
- अपने प्लेटफ़ॉर्म पर AZD स्थापित करना
- आपकी पहली सफल परिनियोजन

#### सीखने के संसाधन
- **🎯 शुरू करें यहाँ**: [Azure Developer CLI क्या है?](#what-is-azure-developer-cli)
- **📖 सिद्धांत**: [AZD मूल बातें](docs/chapter-01-foundation/azd-basics.md) - मुख्य अवधारणाएँ और शब्दावली
- **⚙️ सेटअप**: [स्थापना और सेटअप](docs/chapter-01-foundation/installation.md) - प्लेटफ़ॉर्म-विशिष्ट गाइड
- **🛠️ हैंड्स-ऑन**: [आपका पहला प्रोजेक्ट](docs/chapter-01-foundation/first-project.md) - कदम-दर-कदम ट्यूटोरियल
- **📋 त्वरित संदर्भ**: [कमांड चीट शीट](resources/cheat-sheet.md)

#### व्यावहारिक अभ्यास
```bash
# इंस्टॉलेशन की त्वरित जाँच
azd version

# अपना पहला एप्लिकेशन तैनात करें
azd init --template todo-nodejs-mongo
azd up
```

**💡 अध्याय परिणाम**: AZD का उपयोग करके Azure पर एक सरल वेब एप्लिकेशन सफलतापूर्वक परिनियोजित करना

**✅ सफलता सत्यापन:**
```bash
# अध्याय 1 पूरा करने के बाद, आप सक्षम होंगे:
azd version              # इंस्टॉल किया गया संस्करण दिखाता है
azd init --template todo-nodejs-mongo  # परियोजना को आरंभ करता है
azd up                  # Azure पर तैनात करता है
azd show                # चल रही एप्लिकेशन का URL दिखाता है
# एप्लिकेशन ब्राउज़र में खुलता है और काम करता है
azd down --force --purge  # संसाधनों को साफ़ करता है
```

**📊 समय निवेश:** 30-45 मिनट  
**📈 सीखने के बाद कौशल स्तर:** स्वतंत्र रूप से बुनियादी अनुप्रयोग परिनियोजित कर सकते हैं
**📈 सीखने के बाद कौशल स्तर:** स्वतंत्र रूप से बुनियादी अनुप्रयोग परिनियोजित कर सकते हैं

---

### 🤖 अध्याय 2: एआई-प्राथमिक विकास (एआई डेवलपर्स के लिए अनुशंसित)
**पूर्व आवश्यकताएँ**: अध्याय 1 पूरा होना चाहिए  
**समयावधि**: 1-2 घंटे  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- AZD के साथ Microsoft Foundry एकीकरण
- एआई-संचालित अनुप्रयोग परिनियोजित करना
- एआई सेवा कॉन्फ़िगरेशन की समझ

#### सीखने के संसाधन
- **🎯 शुरू करें यहाँ**: [Microsoft Foundry एकीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 एआई एजेंट्स**: [एआई एजेंट गाइड](docs/chapter-02-ai-development/agents.md) - AZD के साथ बुद्धिमान एजेंट्स परिनियोजित करें
- **📖 पैटर्न**: [एआई मॉडल परिनियोजन](docs/chapter-02-ai-development/ai-model-deployment.md) - एआई मॉडलों को परिनियोजित और प्रबंधित करें
- **🛠️ कार्यशाला**: [एआई कार्यशाला लैब](docs/chapter-02-ai-development/ai-workshop-lab.md) - अपने एआई सॉल्यूशन्स को AZD-रेडी बनाएं
- **🎥 इंटरेक्टिव गाइड**: [कार्यशाला सामग्री](workshop/README.md) - ब्राउज़र-आधारित सीखना MkDocs * DevContainer Environment के साथ
- **📋 टेम्पलेट्स**: [Microsoft Foundry टेम्पलेट्स](#कार्यशाला-संसाधन)
- **📝 उदाहरण**: [AZD परिनियोजन उदाहरण](examples/README.md)

#### व्यावहारिक अभ्यास
```bash
# अपना पहला एआई एप्लिकेशन तैनात करें
azd init --template azure-search-openai-demo
azd up

# अतिरिक्त एआई टेम्पलेट आज़माएँ
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 अध्याय परिणाम**: RAG क्षमताओं के साथ एक एआई-समर्थित चैट एप्लिकेशन को परिनियोजित और कॉन्फ़िगर करना

**✅ सफलता सत्यापन:**
```bash
# अध्याय 2 के बाद, आप सक्षम होंगे:
azd init --template azure-search-openai-demo
azd up
# AI चैट इंटरफ़ेस का परीक्षण करें
# प्रश्न पूछें और स्रोतों के साथ AI-समर्थित उत्तर प्राप्त करें
# सत्यापित करें कि खोज एकीकरण काम करता है
azd monitor  # जांचें कि Application Insights टेलीमेट्री दिखा रहा है
azd down --force --purge
```

**📊 समय निवेश:** 1-2 घंटे  
**📈 सीखने के बाद कौशल स्तर:** उत्पादन-तैयार एआई अनुप्रयोगों को परिनियोजित और कॉन्फ़िगर कर सकते हैं  
**💰 लागत जागरूकता:** समझें $80-150/माह विकास लागत, $300-3500/माह उत्पादन लागत

#### 💰 एआई परिनियोजनों के लिए लागत विचार

**विकास वातावरण (अनुमानित $80-150/माह):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/माह (टोकन उपयोग पर आधारित)
- AI Search (बेसिक स्तर): $75/माह
- Container Apps (उपभोग): $0-20/माह
- स्टोरेज (स्टैंडर्ड): $1-5/माह

**उत्पादन वातावरण (अनुमानित $300-3,500+/माह):**
- Microsoft Foundry Models (सतत प्रदर्शन के लिए PTU): $3,000+/माह OR Pay-as-go with high volume
- AI Search (स्टैंडर्ड स्तर): $250/माह
- Container Apps (डेडिकेटेड): $50-100/माह
- Application Insights: $5-50/माह
- स्टोरेज (प्रीमियम): $10-50/माह

**💡 लागत अनुकूलन सुझाव:**
- सीखने के लिए **Free Tier** Microsoft Foundry Models का उपयोग करें (Azure OpenAI 50,000 टोकन/माह शामिल)
- जब सक्रिय रूप से विकसित नहीं कर रहे हों तो संसाधनों को deallocate करने के लिए `azd down` चलाएं
- उपभोग-आधारित बिलिंग से शुरू करें, केवल उत्पादन के लिए PTU में अपग्रेड करें
- परिनियोजन से पहले लागत का अनुमान लगाने के लिए `azd provision --preview` का उपयोग करें
- ऑटो-स्केलिंग सक्षम करें: केवल वास्तविक उपयोग के लिए भुगतान करें

**लागत निगरानी:**
```bash
# अनुमानित मासिक लागतें जांचें
azd provision --preview

# Azure पोर्टल में वास्तविक लागतों की निगरानी करें
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ अध्याय 3: कॉन्फ़िगरेशन और प्रमाणन
**पूर्व आवश्यकताएँ**: अध्याय 1 पूरा होना चाहिए  
**समयावधि**: 45-60 मिनट  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- पर्यावरण कॉन्फ़िगरेशन और प्रबंधन
- प्रमाणीकरण और सुरक्षा सर्वोत्तम अभ्यास
- संसाधन नामकरण और संगठन

#### सीखने के संसाधन
- **📖 कॉन्फ़िगरेशन**: [कॉन्फ़िगरेशन गाइड](docs/chapter-03-configuration/configuration.md) - पर्यावरण सेटअप
- **🔐 सुरक्षा**: [प्रमाणीकरण पैटर्न और प्रबंधित पहचान](docs/chapter-03-configuration/authsecurity.md) - प्रमाणीकरण पैटर्न
- **📝 उदाहरण**: [डेटाबेस ऐप उदाहरण](examples/database-app/README.md) - AZD डेटाबेस उदाहरण

#### व्यावहारिक अभ्यास
- कई वातावरण (dev, staging, prod) कॉन्फ़िगर करें
- प्रबंधित पहचान प्रमाणीकरण सेट करें
- वातावरण-विशिष्ट कॉन्फ़िगरेशन लागू करें

**💡 अध्याय परिणाम**: उचित प्रमाणीकरण और सुरक्षा के साथ कई वातावरणों का प्रबंधन करें

---

### 🏗️ अध्याय 4: इन्फ्रास्ट्रक्चर ऐज़ कोड और परिनियोजन
**पूर्व आवश्यकताएँ**: अध्याय 1-3 पूर्ण  
**समयावधि**: 1-1.5 घंटे  
**जटिलता**: ⭐⭐⭐

#### आप क्या सीखेंगे
- उन्नत परिनियोजन पैटर्न
- Bicep के साथ Infrastructure as Code
- संसाधन प्राविजनिंग रणनीतियाँ

#### सीखने के संसाधन
- **📖 परिनियोजन**: [परिनियोजन गाइड](docs/chapter-04-infrastructure/deployment-guide.md) - पूर्ण वर्कफ़्लो
- **🏗️ प्राविजनिंग**: [संसाधन प्राविजनिंग](docs/chapter-04-infrastructure/provisioning.md) - Azure संसाधन प्रबंधन
- **📝 उदाहरण**: [कंटेनर ऐप उदाहरण](../../examples/container-app) - कंटेनराइज़्ड परिनियोजन

#### व्यावहारिक अभ्यास
- कस्टम Bicep टेम्पलेट बनाएं
- मल्टी-सर्विस अनुप्रयोग परिनियोजित करें
- ब्लू-ग्रीन परिनियोजन रणनीतियाँ लागू करें

**💡 अध्याय परिणाम**: कस्टम इन्फ्रास्ट्रक्चर टेम्पलेट्स का उपयोग करके जटिल मल्टी-सर्विस अनुप्रयोग परिनियोजित करें

---

### 🎯 अध्याय 5: मल्टी-एजेंट एआई समाधान (उन्नत)
**पूर्व आवश्यकताएँ**: अध्याय 1-2 पूर्ण  
**समयावधि**: 2-3 घंटे  
**जटिलता**: ⭐⭐⭐⭐

#### आप क्या सीखेंगे
- मल्टी-एजेंट आर्किटेक्चर पैटर्न
- एजेंट ऑर्केस्ट्रेशन और समन्वय
- उत्पादन-तैयार एआई परिनियोजन

#### सीखने के संसाधन
- **🤖 विशेष परियोजना**: [रिटेल मल्टी-एजेंट समाधान](examples/retail-scenario.md) - पूर्ण कार्यान्वयन
- **🛠️ ARM टेम्पलेट्स**: [ARM टेम्पलेट पैकेज](../../examples/retail-multiagent-arm-template) - वन-क्लिक परिनियोजन
- **📖 आर्किटेक्चर**: [मल्टी-एजेंट समन्वय पैटर्न](docs/chapter-06-pre-deployment/coordination-patterns.md) - पैटर्न

#### व्यावहारिक अभ्यास
```bash
# पूर्ण खुदरा बहु-एजेंट समाधान को तैनात करें
cd examples/retail-multiagent-arm-template
./deploy.sh

# एजेंट विन्यासों का अन्वेषण करें
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 अध्याय परिणाम**: ग्राहक और इन्वेंटरी एजेंट्स के साथ एक उत्पादन-तैयार मल्टी-एजेंट एआई समाधान परिनियोजित और प्रबंधित करें

---

### 🔍 अध्याय 6: प्री-डिप्लॉयमेंट सत्यापन और योजना
**पूर्व आवश्यकताएँ**: अध्याय 4 पूरा होना चाहिए  
**समयावधि**: 1 घंटा  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- क्षमता योजना और संसाधन सत्यापन
- SKU चयन रणनीतियाँ
- प्री-फ्लाइट चेक और स्वचालन

#### सीखने के संसाधन
- **📊 योजना**: [क्षमता योजना](docs/chapter-06-pre-deployment/capacity-planning.md) - संसाधन सत्यापन
- **💰 चयन**: [SKU चयन](docs/chapter-06-pre-deployment/sku-selection.md) - लागत-कुशल विकल्प
- **✅ सत्यापन**: [प्री-फ्लाइट चेक्स](docs/chapter-06-pre-deployment/preflight-checks.md) - स्वचालित स्क्रिप्ट्स

#### व्यावहारिक अभ्यास
- क्षमता सत्यापन स्क्रिप्ट्स चलाएँ
- लागत के लिए SKU चयन अनुकूलित करें
- स्वचालित प्री-डिप्लॉयमेंट चेक्स लागू करें

**💡 अध्याय परिणाम**: निष्पादन से पहले परिनियोजनों को सत्यापित और अनुकूलित करें

---

### 🚨 अध्याय 7: समस्या निवारण और डीबगिंग
**पूर्व आवश्यकताएँ**: कोई भी परिनियोजन अध्याय पूरा होना चाहिए  
**समयावधि**: 1-1.5 घंटे  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- संगठित डीबगिंग तरीके
- आम समस्याएँ और समाधान
- एआई-विशिष्ट समस्या निवारण

#### सीखने के संसाधन
- **🔧 सामान्य समस्याएँ**: [सामान्य समस्याएँ](docs/chapter-07-troubleshooting/common-issues.md) - FAQ और समाधान
- **🕵️ डीबगिंग**: [डीबगिंग गाइड](docs/chapter-07-troubleshooting/debugging.md) - चरण-दर-चरण रणनीतियाँ
- **🤖 एआई समस्याएँ**: [एआई-विशिष्ट समस्या निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - एआई सेवा समस्याएँ

#### व्यावहारिक अभ्यास
- परिनियोजन विफलताओं का निदान करें
- प्रमाणीकरण समस्याओं को हल करें
- एआई सेवा कनेक्टिविटी का डीबग करें

**💡 अध्याय परिणाम**: स्वतंत्र रूप से सामान्य परिनियोजन समस्याओं का निदान और समाधान करें

---

### 🏢 अध्याय 8: उत्पादन और एंटरप्राइज़ पैटर्न
**पूर्व आवश्यकताएँ**: अध्याय 1-4 पूर्ण  
**समयावधि**: 2-3 घंटे  
**जटिलता**: ⭐⭐⭐⭐

#### आप क्या सीखेंगे
- उत्पादन परिनियोजन रणनीतियाँ
- एंटरप्राइज़ सुरक्षा पैटर्न
- मॉनिटरिंग और लागत अनुकूलन

#### सीखने के संसाधन
- **🏭 Production**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - एंटरप्राइज़ पैटर्न
- **📝 Examples**: [Microservices Example](../../examples/microservices) - जटिल आर्किटेक्चर
- **📊 Monitoring**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - निगरानी

#### व्यावहारिक अभ्यास
- एंटरप्राइज़ सुरक्षा पैटर्न लागू करें
- व्यापक निगरानी स्थापित करें
- उचित शासन के साथ प्रोडक्शन में तैनात करें

**💡 Chapter Outcome**: पूरा प्रोडक्शन क्षमताओं के साथ एंटरप्राइज़-तैयार अनुप्रयोग तैनात करें

---

## 🎓 कार्यशाला अवलोकन: व्यावहारिक सीखने का अनुभव

> **⚠️ कार्यशाला स्थिति: विकासाधीन**  
> कार्यशाला सामग्री वर्तमान में विकसित और परिष्कृत की जा रही हैं। कोर मॉड्यूल कार्यशील हैं, लेकिन कुछ उन्नत अनुभाग अधूरे हैं। हम सभी सामग्री को पूरा करने के लिए सक्रिय रूप से काम कर रहे हैं। [प्रगति देखें →](workshop/README.md)

### इंटरैक्टिव कार्यशाला सामग्री
**ब्राउज़र-आधारित उपकरणों और निर्देशित अभ्यासों के साथ व्यापक व्यावहारिक सीखने का अनुभव**

हमारी कार्यशाला सामग्री अध्याय-आधारित पाठ्यक्रम की पूरक एक संरचित, इंटरैक्टिव सीखने का अनुभव प्रदान करती हैं। कार्यशाला स्व-गति सीखने और प्रशिक्षक-निर्देशित सत्र दोनों के लिए डिज़ाइन की गई है।

#### 🛠️ कार्यशाला की विशेषताएँ
- **ब्राउज़र-आधारित इंटरफ़ेस**: खोज, कॉपी, और थीम सुविधाओं के साथ पूर्ण MkDocs-समर्थित कार्यशाला
- **GitHub Codespaces एकीकरण**: एक-क्लिक विकास वातावरण सेटअप
- **संरचित सीखने का मार्ग**: 8-मॉड्यूल निर्देशित अभ्यास (कुल 3-4 घंटे)
- **प्रगतिशील कार्यप्रणाली**: परिचय → चयन → सत्यापन → विघटन → कॉन्फ़िगरेशन → अनुकूलन → संसाधन हटाना → समापन
- **इंटरैक्टिव DevContainer पर्यावरण**: प्री-कॉन्फ़िगर किए गए उपकरण और निर्भरताएँ

#### 📚 कार्यशाला मॉड्यूल संरचना
यह कार्यशाला एक **8-मॉड्यूल प्रगतिशील कार्यप्रणाली** का पालन करती है जो आपको खोज से तैनाती विशेषज्ञता तक ले जाती है:

| मॉड्यूल | विषय | आप क्या करेंगे | अवधि |
|--------|-------|----------------|----------|
| **0. परिचय** | कार्यशाला अवलोकन | सीखने के उद्देश्य, पूर्वापेक्षाएँ, और कार्यशाला संरचना को समझें | 15 मिनट |
| **1. चयन** | टेम्पलेट खोज | AZD टेम्पलेट का अन्वेषण करें और अपने परिदृश्य के लिए सही AI टेम्पलेट चुनें | 20 मिनट |
| **2. सत्यापन** | तैनात और सत्यापित करें | टेम्पलेट को `azd up` के साथ तैनात करें और अवसंरचना काम कर रही है यह सत्यापित करें | 30 मिनट |
| **3. विघटन** | संरचना को समझें | GitHub Copilot का उपयोग करके टेम्पलेट आर्किटेक्चर, Bicep फ़ाइलें, और कोड संगठन का अन्वेषण करें | 30 मिनट |
| **4. कॉन्फ़िगरेशन** | azure.yaml का गहन अध्ययन | `azure.yaml` कॉन्फ़िगरेशन, लाइफ़साइकल हुक्स, और एनवायरनमेंट वेरिएबल्स में महारत हासिल करें | 30 मिनट |
| **5. अनुकूलन** | इसे अपना बनाएं | AI Search, ट्रेसिंग, मूल्यांकन सक्षम करें, और अपने परिदृश्य के अनुसार अनुकूलित करें | 45 मिनट |
| **6. संसाधन हटाना** | संसाधनों को साफ़ करें | `azd down --purge` के साथ सुरक्षित रूप से संसाधनों का निष्कासन करें | 15 मिनट |
| **7. समापन** | अगले चरण | उपलब्धियों, मुख्य अवधारणाओं की समीक्षा करें, और अपनी सीखने की यात्रा जारी रखें | 15 मिनट |

**कार्यशाला प्रवाह:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 कार्यशाला शुरू करना
```bash
# विकल्प 1: GitHub Codespaces (अनुशंसित)
# रिपॉज़िटरी में "Code" → "Create codespace on main" पर क्लिक करें

# विकल्प 2: स्थानीय विकास
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md में दिए गए सेटअप निर्देशों का पालन करें
```

#### 🎯 कार्यशाला सीखने के परिणाम
कार्यशाला पूरी करने पर प्रतिभागी:
- **प्रोडक्शन AI अनुप्रयोग तैनात करें**: AZD का उपयोग Microsoft Foundry सेवाओं के साथ
- **मल्टी-एजेंट आर्किटेक्चर में महारत हासिल करें**: समन्वित AI एजेंट समाधान लागू करें
- **सुरक्षा सर्वोत्तम प्रथाओं को लागू करें**: प्रमाणीकरण और एक्सेस कंट्रोल कॉन्फ़िगर करें
- **स्केल के लिए अनुकूलित करें**: लागत-प्रभावी, प्रदर्शन-केंद्रित तैनाती डिज़ाइन करें
- **तैनाती समस्याओं का निवारण करें**: सामान्य समस्याओं को स्वतंत्र रूप से हल करें

#### 📖 कार्यशाला संसाधन
- **🎥 इंटरैक्टिव गाइड**: [Workshop Materials](workshop/README.md) - ब्राउज़र-आधारित सीखने का वातावरण
- **📋 मॉड्यूल-दर-मॉड्यूल निर्देश**:
  - [0. परिचय](workshop/docs/instructions/0-Introduction.md) - कार्यशाला अवलोकन और उद्देश्य
  - [1. चयन](workshop/docs/instructions/1-Select-AI-Template.md) - AI टेम्पलेट खोजें और चुनें
  - [2. सत्यापन](workshop/docs/instructions/2-Validate-AI-Template.md) - टेम्पलेट तैनात करें और सत्यापित करें
  - [3. विघटन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - टेम्पलेट आर्किटेक्चर का अन्वेषण करें
  - [4. कॉन्फ़िगरेशन](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml में महारत हासिल करें
  - [5. अनुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) - अपने परिदृश्य के लिए अनुकूलित करें
  - [6. संसाधन हटाना](workshop/docs/instructions/6-Teardown-Infrastructure.md) - संसाधनों की सफाई करें
  - [7. समापन](workshop/docs/instructions/7-Wrap-up.md) - समीक्षा और अगले चरण
- **🛠️ AI कार्यशाला लैब**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-केंद्रित अभ्यास
- **💡 त्वरित आरंभ**: [Workshop Setup Guide](workshop/README.md#quick-start) - पर्यावरण कॉन्फ़िगरेशन

**उपयुक्त है:** कॉर्पोरेट प्रशिक्षण, विश्वविद्यालय पाठ्यक्रम, स्वयं-गति पर सीखना, और डेवलपर बूटकैम्प्स।

---

## 📖 गहन अध्ययन: AZD क्षमताएँ

बुनियादी बातों से आगे, AZD उत्पादन तैनाती के लिए शक्तिशाली सुविधाएँ प्रदान करता है:

- **टेम्पलेट-आधारित तैनाती** - सामान्य एप्लिकेशन पैटर्न के लिए पूर्व-निर्मित टेम्पलेट का उपयोग करें
- **इन्फ्रास्ट्रक्चर ऐज़ कोड** - Bicep या Terraform का उपयोग करके Azure संसाधनों का प्रबंधन करें  
- **एकीकृत वर्कफ़्लो** - अनुप्रयोगों का निर्बाध रूप से प्रावधान, तैनाती, और निगरानी करें
- **डेवलपर-हितैषी** - डेवलपर उत्पादकता और अनुभव के लिए अनुकूलित

### **AZD + Microsoft Foundry: AI तैनाती के लिए उपयुक्त**

**क्यों AZD AI समाधानों के लिए?** AZD उन प्रमुख चुनौतियों को संबोधित करता है जिनका सामना AI डेवलपर्स करते हैं:

- **AI-तैयार टेम्पलेट** - Microsoft Foundry Models, Cognitive Services, और ML वर्कलोड के लिए प्री-कॉन्फ़िगर टेम्पलेट
- **सुरक्षित AI तैनाती** - AI सेवाओं, API कुंजियाँ, और मॉडल एंडपॉइंट के लिए अंतर्निर्मित सुरक्षा पैटर्न  
- **प्रोडक्शन AI पैटर्न** - स्केलेबल, लागत-प्रभावी AI एप्लिकेशन तैनाती के लिए सर्वश्रेष्ठ प्रथाएँ
- **एंड-टू-एंड AI वर्कफ़्लो** - मॉडल विकास से लेकर प्रोडक्शन तैनाती तक उपयुक्त निगरानी के साथ
- **लागत अनुकूलन** - AI वर्कलोड के लिए स्मार्ट संसाधन आवंटन और स्केलिंग रणनीतियाँ
- **Microsoft Foundry एकीकरण** - Microsoft Foundry मॉडल कैटलॉग और एंडपॉइंट से निर्बाध कनेक्शन

---

## 🎯 टेम्प्लेट और उदाहरण पुस्तकालय

### प्रमुख: Microsoft Foundry टेम्पलेट्स
**यदि आप AI एप्लिकेशन तैनात कर रहे हैं तो यहाँ से शुरू करें!**

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

### प्रमुख: पूर्ण सीखने के परिदृश्य
**सीखने के अध्यायों के अनुरूप प्रोडक्शन-तैयार एप्लिकेशन टेम्पलेट्स**

| टेम्पलेट | सीखने का अध्याय | जटिलता | मुख्य सीख |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | मूल AI तैनाती पैटर्न |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | Azure AI Search के साथ RAG कार्यान्वयन |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | अध्याय 4 | ⭐⭐ | डॉक्यूमेंट इंटेलिजेंस एकीकरण |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | एजेंट फ्रेमवर्क और फ़ंक्शन कॉलिंग |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐ | एंटरप्राइज़ AI ऑर्केस्ट्रेशन |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | कस्टमर और इन्वेंटरी एजेंट्स के साथ मल्टी-एजेंट आर्किटेक्चर |

### उदाहरण प्रकार के अनुसार सीखना

> **📌 स्थानीय बनाम बाहरी उदाहरण:**  
> **स्थानीय उदाहरण** (इस रिपो में) = तुरंत उपयोग के लिए तैयार  
> **बाहरी उदाहरण** (Azure Samples) = लिंक किए गए रिपॉज़िटरी से क्लोन करें

#### स्थानीय उदाहरण (उपयोग के लिए तैयार)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM टेम्पलेट्स के साथ पूर्ण प्रोडक्शन-तैयार कार्यान्वयन
  - मल्टी-एजेंट आर्किटेक्चर (कस्टमर + इन्वेंटरी एजेंट्स)
  - विस्तृत निगरानी और मूल्यांकन
  - ARM टेम्पलेट के माध्यम से वन-क्लिक तैनाती

#### स्थानीय उदाहरण - कंटेनर एप्लिकेशन (अध्याय 2-5)
इस रिपोसिटरी में व्यापक कंटेनर तैनाती उदाहरण:
- [**Container App Examples**](examples/container-app/README.md) - कंटेनरीकृत तैनाती के लिए पूर्ण गाइड
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - स्केल-टू-ज़ीरो के साथ मूल REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - प्रोडक्शन-तैयार बहु-सर्विस तैनाती
  - क्विक स्टार्ट, प्रोडक्शन, और उन्नत तैनाती पैटर्न
  - निगरानी, सुरक्षा, और लागत अनुकूलन मार्गदर्शन

#### बाहरी उदाहरण - सरल अनुप्रयोग (अध्याय 1-2)
इन Azure Samples रिपॉज़िटरीज़ को क्लोन करके शुरू करें:
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - बेसिक तैनाती पैटर्न
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - स्टेटिक सामग्री तैनाती
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API तैनाती

#### बाहरी उदाहरण - डेटाबेस एकीकरण (अध्याय 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - डेटाबेस कनेक्टिविटी पैटर्न
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - सर्वरलेस डेटा वर्कफ़्लो

#### बाहरी उदाहरण - उन्नत पैटर्न (अध्याय 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - बहु-सर्विस आर्किटेक्चर
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - बैकग्राउंड प्रोसेसिंग  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - प्रोडक्शन-तैयार ML पैटर्न

### बाहरी टेम्पलेट संग्रह
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - आधिकारिक और कम्युनिटी टेम्पलेट्स का क्यूरेटेड संग्रह
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn टेम्पलेट दस्तावेज़
- [**Examples Directory**](examples/README.md) - स्थानीय सीखने के उदाहरण विस्तृत व्याख्याओं के साथ

---

## 📚 सीखने के संसाधन और संदर्भ

### त्वरित संदर्भ
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - प्रत्येक अध्याय के अनुसार व्यवस्थित आवश्यक azd कमांड
- [**Glossary**](resources/glossary.md) - Azure और azd शब्दावली  
- [**FAQ**](resources/faq.md) - सामान्य प्रश्न जिन्हें अध्याय के अनुसार व्यवस्थित किया गया है
- [**Study Guide**](resources/study-guide.md) - व्यापक अभ्यास प्रश्न

### व्यावहारिक कार्यशालाएँ
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - अपने AI समाधान को AZD-तैनात करने योग्य बनाएं (2-3 घंटे)
- [**Interactive Workshop**](workshop/README.md) - MkDocs और GitHub Codespaces के साथ 8-मॉड्यूल निर्देशित अभ्यास
  - अनुक्रम: परिचय → चयन → सत्यापन → विघटन → कॉन्फ़िगरेशन → अनुकूलन → संसाधन हटाना → समापन

### बाहरी सीखने के संसाधन
- [Azure Developer CLI प्रलेखन](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर सेंटर](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure मूल्य निर्धारण कैलकुलेटर](https://azure.microsoft.com/pricing/calculator/)
- [Azure स्थिति](https://status.azure.com/)

### आपके एडिटर के लिए AI एजेंट कौशल
- [**skills.sh पर Microsoft Azure कौशल**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, डिप्लॉयमेंट, डायग्नोस्टिक्स, लागत अनुकूलन, और अधिक के लिए 37 खुले एजेंट कौशल। इन्हें GitHub Copilot, Cursor, Claude Code, या किसी भी समर्थित एजेंट में इंस्टॉल करें:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 त्वरित समस्या निवारण मार्गदर्शिका

**नवागंतुकों को सामान्य समस्याएँ और तात्कालिक समाधान:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# सबसे पहले AZD स्थापित करें
# विंडोज़ (PowerShell):
winget install microsoft.azd

# मैकओएस:
brew tap azure/azd && brew install azd

# लिनक्स:
curl -fsSL https://aka.ms/install-azd.sh | bash

# स्थापना सत्यापित करें
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# उपलब्ध सदस्यताओं की सूची
az account list --output table

# डिफ़ॉल्ट सदस्यता सेट करें
az account set --subscription "<subscription-id-or-name>"

# AZD वातावरण के लिए सेट करें
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# सत्यापित करें
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

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
<summary><strong>❌ "azd up" आधे रास्ते में विफल हो जाता है</strong></summary>

```bash
# विकल्प 1: साफ़ करें और पुनः प्रयास करें
azd down --force --purge
azd up

# विकल्प 2: केवल अवसंरचना ठीक करें
azd provision

# विकल्प 3: विस्तृत स्थिति की जांच करें
azd show

# विकल्प 4: Azure Monitor में लॉग्स की जांच करें
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# पुनः प्रमाणीकरण करें
az logout
az login

azd auth logout
azd auth login

# प्रमाणीकरण सत्यापित करें
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" या नाम टकराव</strong></summary>

```bash
# AZD अद्वितीय नाम उत्पन्न करता है, लेकिन यदि टकराव हो:
azd down --force --purge

# फिर नए पर्यावरण के साथ पुनः प्रयास करें
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ टेम्पलेट तैनाती बहुत देर हो रही है</strong></summary>

**औसत प्रतीक्षा समय:**
- साधारण वेब ऐप: 5-10 मिनट
- डेटाबेस वाला ऐप: 10-15 मिनट
- AI अनुप्रयोग: 15-25 मिनट (OpenAI प्रोविज़निंग धीमी है)

```bash
# प्रगति जाँचें
azd show

# यदि 30 मिनट से अधिक अटके हों, Azure पोर्टल देखें:
azd monitor
# असफल परिनियोजनों की तलाश करें
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# अपनी Azure भूमिका जांचें
az role assignment list --assignee $(az account show --query user.name -o tsv)

# आपको कम से कम "Contributor" भूमिका की आवश्यकता है
# अपने Azure व्यवस्थापक से निम्न प्रदान करने के लिए कहें:
# - Contributor (संसाधनों के लिए)
# - User Access Administrator (भूमिका सौंपने के लिए)
```
</details>

<details>
<summary><strong>❌ तैनात एप्लिकेशन URL नहीं मिल रहा है</strong></summary>

```bash
# सभी सेवा एंडपॉइंट दिखाएँ
azd show

# या Azure पोर्टल खोलें
azd monitor

# विशिष्ट सेवा की जाँच करें
azd env get-values
# *_URL वेरिएबल्स खोजें
```
</details>

### 📚 पूर्ण समस्या निवारण संसाधन

- **सामान्य समस्याएँ मार्गदर्शिका:** [विस्तृत समाधान](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-विशिष्ट समस्याएँ:** [AI समस्या निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **डिबगिंग गाइड:** [कदम दर कदम डिबगिंग](docs/chapter-07-troubleshooting/debugging.md)
- **मदद प्राप्त करें:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 पाठ्यक्रम पूर्णता और प्रमाणन

### प्रगति ट्रैकिंग
प्रत्येक अध्याय के माध्यम से अपनी सीखने की प्रगति ट्रैक करें:

- [ ] **अध्याय 1**: बुनियाद और त्वरित आरंभ ✅
- [ ] **अध्याय 2**: AI-प्रथम विकास ✅  
- [ ] **अध्याय 3**: कॉन्फ़िगरेशन और प्रमाणीकरण ✅
- [ ] **अध्याय 4**: इन्फ्रาส्ट्रक्चर ऐज़ कोड और तैनाती ✅
- [ ] **अध्याय 5**: मल्टी-एजेंट AI समाधान ✅
- [ ] **अध्याय 6**: प्री-डिप्लॉयमेंट सत्यापन और योजना ✅
- [ ] **अध्याय 7**: समस्या निवारण और डिबगिंग ✅
- [ ] **अध्याय 8**: प्रोडक्शन और एंटरप्राइज़ पैटर्न ✅

### सीखने की पुष्टि
प्रत्येक अध्याय पूरा करने के बाद, अपने ज्ञान की पुष्टि करें:
1. **व्यवहारिक अभ्यास**: अध्याय की हैंड्स-ऑन डिप्लॉयमेंट पूरा करें
2. **ज्ञान जाँच**: अपने अध्याय के FAQ अनुभाग की समीक्षा करें
3. **समुदाय चर्चा**: Azure Discord पर अपना अनुभव साझा करें
4. **अगला अध्याय**: अगले जटिलता स्तर पर जाएँ

### पाठ्यक्रम पूरा करने के लाभ
सभी अध्याय पूरा करने पर, आपके पास होंगे:
- **प्रोडक्शन अनुभव**: Azure पर वास्तविक AI अनुप्रयोग तैनात किए
- **पेशेवर कौशल**: एंटरप्राइज़-तैयार तैनाती क्षमताएँ  
- **समुदाय पहचान**: Azure डेवलपर समुदाय के सक्रिय सदस्य
- **करियर उन्नति**: मांग में रहने वाले AZD और AI तैनाती विशेषज्ञता

---

## 🤝 समुदाय और सहायता

### मदद और सहायता प्राप्त करें
- **तकनीकी समस्याएँ:** [बग रिपोर्ट करें और सुविधाओं का अनुरोध करें](https://github.com/microsoft/azd-for-beginners/issues)
- **सीखने के प्रश्न:** [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-विशिष्ट सहायता:** जॉइन करें [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **डॉक्यूमेंटेशन:** [आधिकारिक Azure Developer CLI प्रलेखन](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord से समुदाय की जानकारियाँ

**#Azure चैनल से हाल के सर्वे परिणाम:**
- **45%** डेवलपर्स AZD को AI वर्कलोड के लिए उपयोग करना चाहते हैं
- **मुख्य चुनौतियाँ**: मल्टी-सर्विस डिप्लॉयमेंट, क्रेडेंशियल प्रबंधन, प्रोडक्शन रेडीनेस  
- **सर्वाधिक अनुरोधित**: AI-विशिष्ट टेम्पलेट, समस्या निवारण गाइड, सर्वोत्तम प्रथाएँ

**हमारे समुदाय में शामिल होकर:**
- अपने AZD + AI अनुभव साझा करें और मदद प्राप्त करें
- नए AI टेम्पलेट्स की शुरुआती पूर्वावलोकन तक पहुँचें
- AI तैनाती सर्वोत्तम प्रथाओं में योगदान दें
- भविष्य के AI + AZD फीचर विकास पर प्रभाव डालें

### पाठ्यक्रम में योगदान
हम योगदान का स्वागत करते हैं! विवरण के लिए कृपया हमारा [Contributing Guide](CONTRIBUTING.md) पढ़ें:
- **सामग्री सुधार**: मौजूदा अध्यायों और उदाहरणों को बेहतर बनाएं
- **नए उदाहरण**: वास्तविक जीवन परिदृश्यों और टेम्पलेट जोड़ें  
- **अनुवाद**: बहुभाषी समर्थन बनाए रखने में मदद करें
- **बग रिपोर्ट**: सटीकता और स्पष्टता में सुधार करें
- **समुदाय मानक**: हमारे समावेशी समुदाय दिशानिर्देशों का पालन करें

---

## 📄 पाठ्यक्रम जानकारी

### लाइसेंस
यह परियोजना MIT लाइसेंस के अंतर्गत लाइसेंस प्राप्त है - विवरण के लिए [LICENSE](../../LICENSE) फ़ाइल देखें।

### संबंधित Microsoft लर्निंग संसाधन

हमारी टीम अन्य व्यापक लर्निंग कोर्स भी बनाती है:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j शुरुआती के लिए](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js शुरुआती के लिए](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain शुरुआती के लिए](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / एजेंट्स
[![AZD शुरुआती के लिए](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI शुरुआती के लिए](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP शुरुआती के लिए](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI एजेंट्स शुरुआती के लिए](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### जनरेटिव AI सीरीज़
[![जनरेटिव AI शुरुआती के लिए](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![जनरेटिव AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![जनरेटिव AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![जनरेटिव AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### कोर लर्निंग
[![ML शुरुआती के लिए](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![डेटा साइंस शुरुआती के लिए](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI शुरुआती के लिए](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![साइबरसिक्योरिटी शुरुआती के लिए](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![वेब डेवलप शुरुआती के लिए](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT शुरुआती के लिए](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR डेवलपमेंट शुरुआती के लिए](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot सीरीज़
[![AI सह-प्रोग्रामिंग के लिए Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET के लिए Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot एडवेंचर](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ पाठ्यक्रम नेविगेशन

**🚀 क्या आप सीखना शुरू करने के लिए तैयार हैं?**

**शुरुआती**: शुरू करें [अध्याय 1: आधार और त्वरित आरंभ](#-chapter-1-foundation--quick-start)  
**AI डेवलपर्स**: सीधे जाएँ [अध्याय 2: एआई-प्रथम विकास](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**अनुभवी डेवलपर्स**: आरंभ करें [अध्याय 3: कॉन्फ़िगरेशन और प्रमाणीकरण](#️-chapter-3-configuration--authentication)

**अगले कदम**: [अध्याय 1 शुरू करें - AZD मूल बातें](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। हालाँकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या असंगतियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में अधिकृत स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सलाह दी जाती है। हम इस अनुवाद के उपयोग से उत्पन्न होने वाली किसी भी गलतफहमी या गलत व्याख्या के लिए उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->