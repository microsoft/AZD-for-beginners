# AZD शुरुआती के लिए: एक संरचित सीखने की यात्रा

![AZD-शुरुआती के लिए](../../translated_images/hi/azdbeginners.5527441dd9f74068.webp) 

[![GitHub वॉचर्स](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub फोर्क्स](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub स्टार्स](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure डिस्कॉर्ड](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry डिस्कॉर्ड](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### स्वचालित अनुवाद (हमेशा अद्यतित)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[अरबी](../ar/README.md) | [बांग्ला](../bn/README.md) | [बुल्गेरियाई](../bg/README.md) | [बर्मी (म्यांमार)](../my/README.md) | [चीनी (सरलीकृत)](../zh-CN/README.md) | [चीनी (पारंपरिक, हांगकांग)](../zh-HK/README.md) | [चीनी (पारंपरिक, मकाऊ)](../zh-MO/README.md) | [चीनी (पारंपरिक, ताइवान)](../zh-TW/README.md) | [क्रोएशियाई](../hr/README.md) | [चेक](../cs/README.md) | [डैनिश](../da/README.md) | [डच](../nl/README.md) | [एस्टोनियाई](../et/README.md) | [फिनिश](../fi/README.md) | [फ्रेंच](../fr/README.md) | [जर्मन](../de/README.md) | [ग्रीक](../el/README.md) | [हिब्रू](../he/README.md) | [हिंदी](./README.md) | [हंगेरियन](../hu/README.md) | [इंडोनेशियाई](../id/README.md) | [इटैलियन](../it/README.md) | [जापानी](../ja/README.md) | [कन्नड़](../kn/README.md) | [कोरियाई](../ko/README.md) | [लिथुआनियाई](../lt/README.md) | [मलय](../ms/README.md) | [मलयालम](../ml/README.md) | [मराठी](../mr/README.md) | [नेपाली](../ne/README.md) | [नाइजीरियाई पिजिन](../pcm/README.md) | [नॉर्वेजियन](../no/README.md) | [फ़ारसी (फ़ारसी)](../fa/README.md) | [पोलिश](../pl/README.md) | [पुर्तगाली (ब्राजील)](../pt-BR/README.md) | [पुर्तगाली (पुर्तगाल)](../pt-PT/README.md) | [पंजाबी (गुरमुखी)](../pa/README.md) | [रोमानियाई](../ro/README.md) | [रूसी](../ru/README.md) | [सर्बियाई (सिरिलिक)](../sr/README.md) | [स्लोवाक](../sk/README.md) | [स्लोवेनियाई](../sl/README.md) | [स्पेनिश](../es/README.md) | [स्वाहिली](../sw/README.md) | [स्वीडिश](../sv/README.md) | [टैगलॉग (फिलिपिनो)](../tl/README.md) | [तमिल](../ta/README.md) | [तेलुगु](../te/README.md) | [थाई](../th/README.md) | [तुर्की](../tr/README.md) | [यूक्रेनी](../uk/README.md) | [उर्दू](../ur/README.md) | [वियतनामी](../vi/README.md)

> **स्थानीय रूप से क्लोन करना पसंद करते हैं?**
>
> यह रिपॉज़िटरी 50+ भाषा अनुवाद शामिल करती है, जो डाउनलोड आकार को काफी बढ़ा देती है। अनुवाद के बिना क्लोन करने के लिए sparse checkout का उपयोग करें:
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
> यह आपको तेज़ डाउनलोड के साथ कोर्स पूरा करने के लिए सभी आवश्यक चीजें देता है।
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd) क्या है?

**Azure Developer CLI (azd)** एक डेवलपर-मित्र कमांड-लाइन टूल है जो Azure पर एप्लिकेशन तैनात करना सरल बनाता है। दर्जनों Azure संसाधनों को मैन्युअली बनाने और कनेक्ट करने के बजाय, आप एक ही कमांड से पूरे एप्लिकेशन तैनात कर सकते हैं।

### `azd up` का जादू

```bash
# यह एकल कमांड सब कुछ करता है:
# ✅ सभी Azure संसाधन बनाता है
# ✅ नेटवर्किंग और सुरक्षा कॉन्फ़िगर करता है
# ✅ आपका एप्लिकेशन कोड बनाता है
# ✅ Azure पर तैनात करता है
# ✅ आपको एक कार्यशील URL देता है
azd up
```

**बस इतना ही!** कोई Azure पोर्टल पर क्लिकिंग नहीं, सीखने के लिए कोई जटिल ARM टेम्पलेट्स नहीं, कोई मैन्युअल कॉन्फ़िगरेशन नहीं - बस Azure पर काम करने वाले एप्लिकेशन।

---

## ❓ Azure Developer CLI बनाम Azure CLI: क्या अंतर है?

यह शुरुआती लोगों द्वारा पूछा जाने वाला सबसे आम प्रश्न है। यहाँ सरल उत्तर है:

| विशेषता | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **उद्देश्य** | व्यक्तिगत Azure संसाधनों का प्रबंधन | पूर्ण एप्लिकेशन तैनात करें |
| **मानसिकता** | इन्फ्रास्ट्रक्चर-केंद्रित | एप्लिकेशन-केंद्रित |
| **उदाहरण** | `az webapp create --name myapp...` | `azd up` |
| **सीखने की कठिनाई** | Azure सेवाओं का ज्ञान आवश्यक | केवल अपने ऐप को जानें |
| **किसके लिए बेहतर** | DevOps, इन्फ्रास्ट्रक्चर | डेवलपर्स, प्रोटोटाइपिंग |

### सरल रूपक

- **Azure CLI** ऐसे है जैसे आपके पास एक घर बनाने के सभी उपकरण हैं - हैमर, आरा, कीलें। आप कुछ भी बना सकते हैं, लेकिन आपको निर्माण जानना होगा।
- **Azure Developer CLI** ऐसे है जैसे एक ठेकेदार नियुक्त करना - आप यह बताइए कि आप क्या चाहते हैं, और वे निर्माण का प्रबंधन करते हैं।

### कब किसका उपयोग करें

| परिदृश्य | उपयोग करें |
|----------|----------|
| "मैं अपना वेब ऐप जल्दी तैनात करना चाहता हूँ" | `azd up` |
| "मुझे केवल एक स्टोरेज अकाउंट बनाना है" | `az storage account create` |
| "मैं एक पूरा AI एप्लिकेशन बना रहा हूँ" | `azd init --template azure-search-openai-demo` |
| "मुझे किसी विशिष्ट Azure संसाधन को डिबग करने की आवश्यकता है" | `az resource show` |
| "मुझे मिनटों में प्रोडक्शन-तैयार तैनाती चाहिए" | `azd up --environment production` |

### वे साथ में काम करते हैं!

AZD आंतरिक रूप से Azure CLI का उपयोग करता है। आप दोनों का उपयोग कर सकते हैं:
```bash
# AZD के साथ अपना ऐप तैनात करें
azd up

# फिर Azure CLI के साथ विशिष्ट संसाधनों को संशोधित करें
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD में टेम्पलेट्स खोजें

शुरू से शुरू न करें! **Awesome AZD** तैनाती के लिए तैयार टेम्पलेट्स का एक सामुदायिक संग्रह है:

| संसाधन | विवरण |
|----------|-------------|
| 🔗 [**Awesome AZD गैलरी**](https://azure.github.io/awesome-azd/) | एक-क्लिक तैनाती के साथ 200+ टेम्पलेट ब्राउज़ करें |
| 🔗 [**टेम्पलेट सबमिट करें**](https://github.com/Azure/awesome-azd/issues) | अपने टेम्पलेट को समुदाय में योगदान करें |
| 🔗 [**GitHub रिपॉज़िटरी**](https://github.com/Azure/awesome-azd) | स्टार करें और सोर्स एक्सप्लोर करें |

### Awesome AZD से लोकप्रिय AI टेम्पलेट्स

```bash
# Azure OpenAI + AI खोज के साथ RAG चैट
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

### साफ़-सफाई (न भूलें!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 इस पाठ्यक्रम का उपयोग कैसे करें

यह कोर्स **क्रमिक सीखने** के लिए डिज़ाइन किया गया है - जहाँ आप सहज महसूस करते हैं वहां से शुरू करें और आगे बढ़ें:

| आपका अनुभव | यहाँ शुरू करें |
|-----------------|------------|
| **Azure के बिल्कुल नए** | [अध्याय 1: फ़ाउंडेशन](../..) |
| **Azure जानते हैं, AZD के लिए नए** | [अध्याय 1: फ़ाउंडेशन](../..) |
| **AI ऐप तैनात करना चाहते हैं** | [अध्याय 2: AI विकास](../..) |
| **व्यवहारिक अभ्यास चाहते हैं** | [🎓 इंटरेक्टिव वर्कशॉप](workshop/README.md) - 3-4 घंटे मार्गदर्शित लैब |
| **प्रोडक्शन पैटर्न चाहिए** | [अध्याय 8: प्रोडक्शन और एंटरप्राइज़](../..) |

### त्वरित सेटअप

1. **इस रिपॉज़िटरी को फ़ोर्क करें**: [![GitHub फोर्क्स](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **इसे क्लोन करें**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **मदद प्राप्त करें**: [Azure Discord समुदाय](https://discord.com/invite/ByRwuEEgH4)

> **स्थानीय रूप से क्लोन करना पसंद करते हैं?**
>
> यह रिपॉज़िटरी 50+ भाषा अनुवाद शामिल करती है, जो डाउनलोड आकार को काफी बढ़ा देती है। अनुवाद के बिना क्लोन करने के लिए sparse checkout का उपयोग करें:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> यह आपको तेज़ डाउनलोड के साथ कोर्स पूरा करने के लिए सभी आवश्यक चीजें देता है।


## पाठ्यक्रम का अवलोकन

क्रमिक सीखने के लिए डिज़ाइन किए गए संरचित अध्यायों के माध्यम से Azure Developer CLI (azd) में महारत हासिल करें। **Microsoft Foundry एकीकरण के साथ AI एप्लिकेशन तैनाती पर विशेष फोकस।**

### आधुनिक डेवलपर्स के लिए यह पाठ्यक्रम क्यों आवश्यक है

Microsoft Foundry Discord समुदाय की जानकारियों के आधार पर, **45% डेवलपर्स AI वर्कलोड के लिए AZD उपयोग करना चाहते हैं** लेकिन उन्हें निम्न चुनौतियों का सामना करना पड़ता है:
- जटिल बहु-सेवा AI आर्किटेक्चर
- प्रोडक्शन AI तैनाती सर्वोत्तम प्रथाएँ  
- Azure AI सेवा एकीकरण और कॉन्फ़िगरेशन
- AI वर्कलोड के लिए लागत अनुकूलन
- AI-विशिष्ट तैनाती समस्याओं का निवारण

### सीखने के उद्देश्य

इस संरचित पाठ्यक्रम को पूरा करके, आप:
- **AZD के मूल सिद्धांत में महारत हासिल करें**: मुख्य अवधारणाएँ, स्थापना, और कॉन्फ़िगरेशन
- **AI एप्लिकेशन तैनात करें**: Microsoft Foundry सेवाओं के साथ AZD का उपयोग
- **Infrastructure as Code लागू करें**: Bicep टेम्पलेट्स के साथ Azure संसाधनों का प्रबंधन करें
- **तैनाती में समस्या निवारण करें**: सामान्य मुद्दों का समाधान और डिबगिंग
- **प्रोडक्शन के लिए अनुकूलित करें**: सुरक्षा, स्केलिंग, निगरानी, और लागत प्रबंधन
- **मल्टी-एजेंट समाधान बनाएं**: जटिल AI आर्किटेक्चर तैनात करें

## 🗺️ पाठ्यक्रम का मानचित्र: अध्याय द्वारा त्वरित नेविगेशन

प्रत्येक अध्याय में समर्पित README है जिसमें सीखने के उद्देश्य, त्वरित प्रारंभ, और अभ्यास शामिल हैं:

| अध्याय | विषय | पाठ | अवधि | जटिलता |
|---------|-------|---------|----------|------------|
| **[अध्याय 1: फ़ाउंडेशन](docs/chapter-01-foundation/README.md)** | शुरुआत | [AZD मूल बातें](docs/chapter-01-foundation/azd-basics.md) &#124; [स्थापना](docs/chapter-01-foundation/installation.md) &#124; [पहला प्रोजेक्ट](docs/chapter-01-foundation/first-project.md) | 30-45 मिनट | ⭐ |
| **[अध्याय 2: AI विकास](docs/chapter-02-ai-development/README.md)** | AI-प्रथम एप्लिकेशन | [Foundry एकीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI एजेंट्स](docs/chapter-02-ai-development/agents.md) &#124; [मॉडल तैनाती](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [वर्कशॉप](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 घंटे | ⭐⭐ |
| **[अध्याय 3: कॉन्फ़िगरेशन](docs/chapter-03-configuration/README.md)** | प्रमाणीकरण और सुरक्षा | [कॉन्फ़िगरेशन](docs/chapter-03-configuration/configuration.md) &#124; [प्रमाणीकरण और सुरक्षा](docs/chapter-03-configuration/authsecurity.md) | 45-60 मिनट | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 घंटे | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Solutions | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 घंटे | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planning & Validation | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 घंटा | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 घंटे | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | Enterprise Patterns | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 घंटे | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On Lab | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 घंटे | ⭐⭐ |

**कुल पाठ्यक्रम अवधि:** ~10-14 घंटे | **कौशल प्रगति:** शुरुआती → प्रोडक्शन-तैयार

---

## 📚 सीखने के अध्याय

*अपने अनुभव स्तर और लक्ष्यों के आधार पर अपना सीखने का पथ चुनें*

### 🚀 अध्याय 1: बुनियादी और त्वरित शुरुआत
**पूर्व आवश्यकता**: Azure सदस्यता, बुनियादी कमांड लाइन ज्ञान  
**अवधि**: 30-45 मिनट  
**जटिलता**: ⭐

#### आप क्या सीखेंगे
- Azure Developer CLI के मूल सिद्धांतों को समझना
- अपने प्लेटफ़ॉर्म पर AZD इंस्टॉल करना
- आपकी पहली सफल तैनाती

#### सीखने के संसाधन
- **🎯 यहाँ से शुरू करें**: [What is Azure Developer CLI?](../..)
- **📖 सिद्धांत**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - मुख्य अवधारणाएँ और शब्दावली
- **⚙️ सेटअप**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - प्लेटफ़ॉर्म-विशिष्ट मार्गदर्शिकाएँ
- **🛠️ व्यावहारिक**: [Your First Project](docs/chapter-01-foundation/first-project.md) - कदम-दर-कदम ट्यूटोरियल
- **📋 त्वरित संदर्भ**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### व्यावहारिक अभ्यास
```bash
# त्वरित स्थापना की जाँच
azd version

# अपनी पहली एप्लिकेशन तैनात करें
azd init --template todo-nodejs-mongo
azd up
```

**💡 अध्याय परिणाम**: AZD का उपयोग करके Azure पर एक सरल वेब अनुप्रयोग सफलतापूर्वक तैनात करना

**✅ सफलता सत्यापन:**
```bash
# अध्याय 1 पूरा करने के बाद, आप सक्षम होंगे:
azd version              # इंस्टॉल किए गए संस्करण को दिखाता है
azd init --template todo-nodejs-mongo  # प्रोजेक्ट को आरंभ करता है
azd up                  # Azure पर परिनियोजित करता है
azd show                # चल रहे ऐप का URL दिखाता है
# एप्लिकेशन ब्राउज़र में खुलता है और काम करता है
azd down --force --purge  # संसाधनों को साफ़ करता है
```

**📊 समय निवेश:** 30-45 मिनट  
**📈 उसके बाद का कौशल स्तर:** स्वतंत्र रूप से बुनियादी अनुप्रयोग तैनात कर सकता है

**✅ सफलता सत्यापन:**
```bash
# अध्याय 1 पूरा करने के बाद आप सक्षम होंगे:
azd version              # स्थापित संस्करण दिखाता है
azd init --template todo-nodejs-mongo  # प्रोजेक्ट को प्रारंभ करता है
azd up                  # Azure पर तैनात करता है
azd show                # चल रहे ऐप का URL दिखाता है
# एप्लिकेशन ब्राउज़र में खुलता है और काम करता है
azd down --force --purge  # संसाधनों को साफ़ करता है
```

**📊 समय निवेश:** 30-45 मिनट  
**📈 उसके बाद का कौशल स्तर:** स्वतंत्र रूप से बुनियादी अनुप्रयोग तैनात कर सकता है

---

### 🤖 अध्याय 2: एआई-प्रथम विकास (एआई डेवलपर्स के लिए अनुशंसित)
**पूर्व आवश्यकता**: अध्याय 1 पूरा किया हुआ  
**अवधि**: 1-2 घंटे  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- AZD के साथ Microsoft Foundry का इंटीग्रेशन
- एआई-समर्थित अनुप्रयोग तैनात करना
- एआई सेवा कॉन्फ़िगरेशन को समझना

#### सीखने के संसाधन
- **🎯 यहाँ से शुरू करें**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 एआई एजेंट्स**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - AZD के साथ बुद्धिमान एजेंट तैनात करें
- **📖 पैटर्न्स**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - एआई मॉडलों को तैनात और प्रबंधित करना
- **🛠️ वर्कशॉप**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - अपने एआई समाधान को AZD-तैयार बनाएं
- **🎥 इंटरैक्टिव गाइड**: [Workshop Materials](workshop/README.md) - MkDocs के साथ ब्राउज़र-आधारित सीखना * DevContainer वातावरण
- **📋 टेम्पलेट्स**: [Microsoft Foundry Templates](../..)
- **📝 उदाहरण**: [AZD Deployment Examples](examples/README.md)

#### व्यावहारिक अभ्यास
```bash
# अपना पहला एआई एप्लिकेशन तैनात करें
azd init --template azure-search-openai-demo
azd up

# अतिरिक्त एआई टेम्पलेट्स आजमाएँ
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 अध्याय परिणाम**: RAG क्षमताओं के साथ एक एआई-समर्थित चैट एप्लिकेशन तैनात और कॉन्फ़िगर करना

**✅ सफलता सत्यापन:**
```bash
# अध्याय 2 के बाद, आप ये कर पाएंगे:
azd init --template azure-search-openai-demo
azd up
# AI चैट इंटरफ़ेस का परीक्षण करें
# प्रश्न पूछें और स्रोतों के साथ AI-संचालित उत्तर प्राप्त करें
# जांचें कि खोज एकीकरण काम कर रहा है
azd monitor  # जांचें कि Application Insights टेलीमेट्री दिखा रहा है
azd down --force --purge
```

**📊 समय निवेश:** 1-2 घंटे  
**📈 उसके बाद का कौशल स्तर:** प्रोडक्शन-तैयार एआई अनुप्रयोग तैनात और कॉन्फ़िगर कर सकता है  
**💰 लागत जागरूकता:** विकास लागत ~$80-150/महीना, प्रोडक्शन लागत ~$300-3500/महीना

#### 💰 एआई तैनातियों के लिए लागत विचार

**विकास परिवेश (अनुमानित $80-150/महीना):**
- Azure OpenAI (Pay-as-you-go): $0-50/महीना (टोकन उपयोग पर आधारित)
- AI Search (बेसिक टियर): $75/महीना
- Container Apps (कंजम्प्शन): $0-20/महीना
- स्टोरेज (स्टैंडर्ड): $1-5/महीना

**प्रोडक्शन परिवेश (अनुमानित $300-3,500+/महीना):**
- Azure OpenAI (सुसंगत प्रदर्शन के लिए PTU): $3,000+/महीना OR उच्च मात्रा के साथ Pay-as-you-go
- AI Search (स्टैंडर्ड टियर): $250/महीना
- Container Apps (डेडिकेटेड): $50-100/महीना
- Application Insights: $5-50/महीना
- स्टोरेज (प्रेमियम): $10-50/महीना

**💡 लागत अनुकूलन सुझाव:**
- सीखने के लिए **Free Tier** Azure OpenAI का उपयोग करें (50,000 टोकन/महीना शामिल)
- विकास के दौरान सक्रिय न होने पर संसाधनों को डी-एलोकेट करने के लिए `azd down` चलाएँ
- कंजम्प्शन-आधारित बिलिंग के साथ शुरू करें, केवल प्रोडक्शन के लिए PTU में अपग्रेड करें
- तैनाती से पहले लागत का अनुमान लगाने के लिए `azd provision --preview` का उपयोग करें
- ऑटो-स्केलिंग सक्षम करें: केवल वास्तविक उपयोग के लिए भुगतान करें

**लागत निगरानी:**
```bash
# अनुमानित मासिक लागतों की जाँच करें
azd provision --preview

# Azure पोर्टल में वास्तविक लागतों की निगरानी करें
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ अध्याय 3: कॉन्फ़िगरेशन और प्रमाणीकरण
**पूर्व आवश्यकता**: अध्याय 1 पूरा किया हुआ  
**अवधि**: 45-60 मिनट  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- परिवेश कॉन्फ़िगरेशन और प्रबंधन
- प्रमाणीकरण और सुरक्षा सर्वोत्तम प्रथाएँ
- संसाधन नामकरण और संगठन

#### सीखने के संसाधन
- **📖 कॉन्फ़िगरेशन**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - परिवेश सेटअप
- **🔐 सुरक्षा**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - प्रमाणीकरण पैटर्न
- **📝 उदाहरण**: [Database App Example](examples/database-app/README.md) - AZD डाटाबेस उदाहरण

#### व्यावहारिक अभ्यास
- कई परिवेशों (dev, staging, prod) को कॉन्फ़िगर करें
- प्रबंधित पहचान प्रमाणीकरण सेटअप करें
- परिवेश-विशिष्ट कॉन्फ़िगरेशन लागू करें

**💡 अध्याय परिणाम**: उचित प्रमाणीकरण और सुरक्षा के साथ कई परिवेशों का प्रबंधन करें

---

### 🏗️ अध्याय 4: इन्फ्रास्ट्रक्चर ऐज़ कोड और तैनाती
**पूर्व आवश्यकता**: अध्याय 1-3 पूरा किए हुए  
**अवधि**: 1-1.5 घंटे  
**जटिलता**: ⭐⭐⭐

#### आप क्या सीखेंगे
- उन्नत तैनाती पैटर्न
- Bicep के साथ Infrastructure as Code
- संसाधन प्राविजनिंग रणनीतियाँ

#### सीखने के संसाधन
- **📖 तैनाती**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - पूरा वर्कफ़्लो
- **🏗️ प्राविजनिंग**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure संसाधन प्रबंधन
- **📝 उदाहरण**: [Container App Example](../../examples/container-app) - कंटेनरीकृत तैनातियाँ

#### व्यावहारिक अभ्यास
- कस्टम Bicep टेम्पलेट बनाएं
- मल्टी-सर्विस अनुप्रयोग तैनात करें
- ब्लू-ग्रीन तैनाती रणनीतियाँ लागू करें

**💡 अध्याय परिणाम**: कस्टम इन्फ्रास्ट्रक्चर टेम्पलेट का उपयोग करके जटिल मल्टी-सर्विस अनुप्रयोग तैनात करें

---

### 🎯 अध्याय 5: मल्टी-एजेंट एआई समाधान (उन्नत)
**पूर्व आवश्यकता**: अध्याय 1-2 पूरा किए हुए  
**अवधि**: 2-3 घंटे  
**जटिलता**: ⭐⭐⭐⭐

#### आप क्या सीखेंगे
- मल्टी-एजेंट आर्किटेक्चर पैटर्न
- एजेंट ऑर्केस्ट्रेशन और समन्वय
- प्रोडक्शन-तैयार एआई तैनातियाँ

#### सीखने के संसाधन
- **🤖 फ़ीचर्ड प्रोजेक्ट**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - पूरा इम्प्लीमेंटेशन
- **🛠️ ARM टेम्पलेट्स**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - वन-क्लिक तैनाती
- **📖 आर्किटेक्चर**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - समन्वय पैटर्न

#### व्यावहारिक अभ्यास
```bash
# पूर्ण रिटेल बहु-एजेंट समाधान तैनात करें
cd examples/retail-multiagent-arm-template
./deploy.sh

# एजेंट विन्यासों का अन्वेषण करें
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 अध्याय परिणाम**: कस्टमर और इन्वेंटरी एजेंट्स के साथ एक प्रोडक्शन-तैयार मल्टी-एजेंट एआई समाधान तैनात और प्रबंधित करें

---

### 🔍 अध्याय 6: पूर्व-तैनाती सत्यापन और योजना
**पूर्व आवश्यकता**: अध्याय 4 पूरा किया हुआ  
**अवधि**: 1 घंटा  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- क्षमता नियोजन और संसाधन सत्यापन
- SKU चयन रणनीतियाँ
- प्री-फ्लाइट चेक्स और ऑटोमेशन

#### सीखने के संसाधन
- **📊 योजना**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - संसाधन सत्यापन
- **💰 चयन**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - लागत-प्रभावी विकल्प
- **✅ सत्यापन**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - स्वचालित स्क्रिप्ट्स

#### व्यावहारिक अभ्यास
- क्षमता सत्यापन स्क्रिप्ट चलाएँ
- लागत के लिए SKU चयन अनुकूलित करें
- स्वचालित पूर्व-तैनाती चेक्स लागू करें

**💡 अध्याय परिणाम**: तैनाती से पहले तैनाती को सत्यापित और अनुकूलित करें

---

### 🚨 अध्याय 7: समस्या निवारण और डिबगिंग
**पूर्व आवश्यकता**: कोई भी तैनाती अध्याय पूरा किया हुआ  
**अवधि**: 1-1.5 घंटे  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- संगठित डिबगिंग विधियाँ
- सामान्य समस्याएँ और समाधान
- एआई-विशिष्ट समस्या निवारण

#### सीखने के संसाधन
- **🔧 सामान्य समस्याएँ**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ और समाधान
- **🕵️ डिबगिंग**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - कदम-दर-कदम रणनीतियाँ
- **🤖 एआई समस्याएँ**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - एआई सेवा समस्याएँ

#### व्यावहारिक अभ्यास
- तैनाती विफलताओं का निदान करें
- प्रमाणीकरण समस्याओं का समाधान करें
- एआई सेवा कनेक्टिविटी को डिबग करें

**💡 अध्याय परिणाम**: सामान्य तैनाती समस्याओं का स्वतंत्र रूप से निदान और समाधान करें

---

### 🏢 अध्याय 8: प्रोडक्शन और एंटरप्राइज़ पैटर्न्स
**पूर्व आवश्यकता**: अध्याय 1-4 पूरा किए हुए  
**अवधि**: 2-3 घंटे  
**जटिलता**: ⭐⭐⭐⭐

#### आप क्या सीखेंगे
- प्रोडक्शन तैनाती रणनीतियाँ
- एंटरप्राइज़ सुरक्षा पैटर्न
- मॉनिटरिंग और लागत अनुकूलन

#### सीखने के संसाधन
- **🏭 प्रोडक्शन**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - एंटरप्राइज़ पैटर्न्स
- **📝 उदाहरण**: [Microservices Example](../../examples/microservices) - जटिल आर्किटेक्चर
- **📊 मॉनिटरिंग**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - मॉनिटरिंग

#### व्यावहारिक अभ्यास
- एंटरप्राइज़ सुरक्षा पैटर्न लागू करें
- व्यापक मॉनिटरिंग सेटअप करें
- उचित गवर्नेंस के साथ प्रोडक्शन में तैनात करें

**💡 अध्याय परिणाम**: पूर्ण प्रोडक्शन क्षमताओं के साथ एंटरप्राइज़-तैयार अनुप्रयोग तैनात करें

---

## 🎓 कार्यशाला का अवलोकन: व्यावहारिक सीखने का अनुभव

> **⚠️ कार्यशाला स्थिति: सक्रिय विकास**
> वर्कशॉप सामग्री वर्तमान में विकसित और परिष्कृत की जा रही हैं। मुख्य मॉड्यूल कार्यात्मक हैं, लेकिन कुछ उन्नत अनुभाग अधूरे हैं। हम सभी सामग्री को पूरा करने के लिए सक्रिय रूप से काम कर रहे हैं। [प्रगति ट्रैक करें →](workshop/README.md)

### इंटरैक्टिव वर्कशॉप सामग्री
**ब्राउज़र-आधारित टूल और मार्गदर्शित अभ्यास के साथ व्यापक व्यावहारिक सीखना**

हमारी वर्कशॉप सामग्री अध्याय-आधारित पाठ्यक्रम का पूरक एक संरचित, इंटरैक्टिव सीखने का अनुभव प्रदान करती है। वर्कशॉप स्व-गति अधिगम और प्रशिक्षक-प्रधान सत्रों दोनों के लिए डिज़ाइन की गई है।

#### 🛠️ वर्कशॉप सुविधाएँ
- **ब्राउज़र-आधारित इंटरफ़ेस**: खोज, कॉपी और थीम सुविधाओं के साथ पूर्ण MkDocs- संचालित वर्कशॉप
- **GitHub Codespaces एकीकरण**: एक-क्लिक विकास वातावरण सेटअप
- **संरचित लर्निंग पाथ**: 8-मॉड्यूल मार्गदर्शित अभ्यास (कुल 3-4 घंटे)
- **प्रगतिशील कार्यप्रणाली**: परिचय → चयन → सत्यापन → विखंडन → विन्यास → अनुकूलन → हटाना → समापन
- **इंटरएक्टिव DevContainer वातावरण**: पूर्व-कॉन्फ़िगर किए गए टूल और निर्भरताएँ

#### 📚 वर्कशॉप मॉड्यूल संरचना
वर्कशॉप एक **8-मॉड्यूल प्रगतिशील कार्यप्रणाली** का पालन करता है जो आपको खोज से तैनाती की महारत तक ले जाता है:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. परिचय** | वर्कशॉप ओवरव्यू | सीखने के उद्देश्यों, पूर्वापेक्षाओं, और वर्कशॉप संरचना को समझें | 15 मिनट |
| **1. चयन** | टेम्पलेट खोज | AZD टेम्पलेट्स का अन्वेषण करें और अपने परिदृश्य के लिए सही AI टेम्पलेट चुनें | 20 मिनट |
| **2. सत्यापन** | तैनात और सत्यापित करें | `azd up` से टेम्पलेट तैनात करें और आधारभूत संरचना सही होने का सत्यापन करें | 30 मिनट |
| **3. विखंडन** | संरचना को समझें | टेम्पलेट आर्किटेक्चर, Bicep फ़ाइलों, और कोड संगठन का अन्वेषण करने के लिए GitHub Copilot का उपयोग करें | 30 मिनट |
| **4. विन्यास** | azure.yaml डीप डाइव | `azure.yaml` कॉन्फ़िगरेशन, लाइफसाइकल हुक्स, और पर्यावरण चर में महारत हासिल करें | 30 मिनट |
| **5. अनुकूलन** | इसे अपना बनाएं | AI Search, ट्रेसिंग, मूल्यांकन सक्षम करें, और अपने परिदृश्य के लिए अनुकूलित करें | 45 मिनट |
| **6. हटाना** | संसाधनों को साफ़ करें | `azd down --purge` के साथ संसाधनों को सुरक्षित रूप से निष्कासित करें | 15 मिनट |
| **7. समापन** | अगले कदम | उपलब्धियों, प्रमुख अवधारणाओं की समीक्षा करें, और अपनी सीखने की यात्रा जारी रखें | 15 मिनट |

**वर्कशॉप प्रवाह:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 वर्कशॉप शुरू करें
```bash
# विकल्प 1: GitHub Codespaces (अनुशंसित)
# रिपॉज़िटरी में "Code" → "Create codespace on main" पर क्लिक करें

# विकल्प 2: स्थानीय विकास
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md में सेटअप निर्देशों का पालन करें
```

#### 🎯 वर्कशॉप सीखने के परिणाम
वर्कशॉप पूरा करने पर, प्रतिभागी:
- **उत्पादन AI अनुप्रयोग तैनात करें**: AZD का उपयोग Microsoft Foundry सेवाओं के साथ करना सीखें
- **मल्टी-एजेंट आर्किटेक्चर में महारत हासिल करें**: समन्वित AI एजेंट समाधान लागू करें
- **सुरक्षा सर्वोत्तम प्रथाओं को लागू करें**: प्रमाणीकरण और एक्सेस नियंत्रण कॉन्फ़िगर करें
- **स्केल के लिए अनुकूलित करें**: लागत-प्रभावी, उच्च प्रदर्शन तैनाती डिज़ाइन करें
- **तैनतियों का ट्रबलशूट करें**: सामान्य समस्याओं को स्वतंत्र रूप से सुलझाएँ

#### 📖 वर्कशॉप संसाधन
- **🎥 इंटरैक्टिव गाइड**: [वर्कशॉप सामग्री](workshop/README.md) - ब्राउज़र-आधारित सीखने का वातावरण
- **📋 मॉड्यूल-दर-मॉड्यूल निर्देश**:
  - [0. परिचय](workshop/docs/instructions/0-Introduction.md) - वर्कशॉप का अवलोकन और उद्देश्य
  - [1. चयन](workshop/docs/instructions/1-Select-AI-Template.md) - AI टेम्पलेट्स खोजें और चुनें
  - [2. सत्यापन](workshop/docs/instructions/2-Validate-AI-Template.md) - टेम्पलेट तैनात करें और सत्यापित करें
  - [3. विखंडन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - टेम्पलेट आर्किटेक्चर का अन्वेषण करें
  - [4. विन्यास](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml में महारत हासिल करें
  - [5. अनुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) - अपने परिदृश्य के लिए अनुकूलित करें
  - [6. हटाना](workshop/docs/instructions/6-Teardown-Infrastructure.md) - संसाधनों को साफ़ करें
  - [7. समापन](workshop/docs/instructions/7-Wrap-up.md) - समीक्षा और अगले कदम
- **🛠️ AI वर्कशॉप लैब**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-केंद्रित अभ्यास
- **💡 क्विक स्टार्ट**: [वर्कशॉप सेटअप गाइड](workshop/README.md#quick-start) - वातावरण कॉन्फ़िगरेशन

**उपयुक्त है**: कॉर्पोरेट प्रशिक्षण, विश्वविद्यालय पाठ्यक्रम, स्व-गति अधिगम, और डेवलपर बूटकैम्प के लिए।

---

## 📖 गहराई से देखें: AZD क्षमताएँ

बुनियादी बातों से परे, AZD उत्पादन तैनाती के लिए शक्तिशाली सुविधाएँ प्रदान करता है:

- **टेम्पलेट-आधारित तैनाती** - सामान्य एप्लिकेशन पैटर्न के लिए पूर्व-निर्मित टेम्पलेट्स का उपयोग करें
- **कोड के रूप में इन्फ्रास्ट्रक्चर** - Bicep या Terraform का उपयोग करके Azure संसाधनों का प्रबंधन करें  
- **समेकित वर्कफ़्लो** - एप्लिकेशन को सहजता से प्रोविजन, तैनात और मॉनिटर करें
- **डेवलपर-अनुकूल** - डेवलपर उत्पादकता और अनुभव के लिए अनुकूलित

### **AZD + Microsoft Foundry: AI तैनातियों के लिए परफेक्ट**

**AI समाधानों के लिए AZD क्यों?** AZD उन शीर्ष चुनौतियों का समाधान करता है जिनका सामना AI डेवलपर्स करते हैं:

- **AI-तैयार टेम्पलेट्स** - Azure OpenAI, Cognitive Services, और ML वर्कलोड्स के लिए पूर्व-कॉन्फ़िगर किए गए टेम्पलेट्स
- **सुरक्षित AI तैनातियाँ** - AI सेवाओं, API कुंजियों, और मॉडल एंडपॉइंट्स के लिए अंतर्निर्मित सुरक्षा पैटर्न  
- **उत्पादन AI पैटर्न** - स्केलेबल, लागत-प्रभावी AI एप्लिकेशन तैनातियों के लिए सर्वोत्तम प्रथाएँ
- **एंड-टू-एंड AI वर्कफ़्लो** - मॉडल विकास से उत्पादन तैनाती तक उचित मॉनिटरिंग के साथ
- **लागत अनुकूलन** - AI वर्कलोड्स के लिए स्मार्ट संसाधन आवंटन और स्केलिंग रणनीतियाँ
- **Microsoft Foundry एकीकरण** - Microsoft Foundry मॉडल कैटलॉग और एंडपॉइंट्स से सहज कनेक्शन

---

## 🎯 टेम्पलेट्स और उदाहरण पुस्तकालय

### विशेष: Microsoft Foundry टेम्पलेट
**यदि आप AI एप्लिकेशन तैनात कर रहे हैं तो यहीं से शुरू करें!**

> **नोट:** ये टेम्पलेट विभिन्न AI पैटर्न दर्शाते हैं। कुछ बाहरी Azure Samples हैं, जबकि अन्य स्थानीय कार्यान्वयन हैं।

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**AI चैट के साथ शुरुआत करें**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | बाहरी |
| [**AI एजेंटों के साथ शुरुआत करें**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| बाहरी |
| [**Azure Search + OpenAI डेमो**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | बाहरी |
| [**OpenAI चैट ऐप क्विकस्टार्ट**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | बाहरी |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | बाहरी |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | बाहरी |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **स्थानीय** |

### विशेष: संपूर्ण शिक्षण परिदृश्य
**उत्पादन-तैयार एप्लिकेशन टेम्पलेट्स को सीखने के अध्यायों से मैप किया गया**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | मूल AI तैनाती पैटर्न |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | Azure AI Search के साथ RAG लागू करना |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | डॉक्यूमेंट इंटेलिजेंस एकीकरण |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | एजेंट फ्रेमवर्क और फ़ंक्शन कॉलिंग |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | एंटरप्राइज़ AI ऑर्केस्ट्रेशन |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | ग्राहक और इन्वेंटरी एजेंट्स के साथ मल्टी-एजेंट आर्किटेक्चर |

### उदाहरण प्रकार द्वारा सीखना

> **📌 स्थानीय बनाम बाहरी उदाहरण:**  
> **स्थानीय उदाहरण** (इस रिपॉज़िटरी में) = तुरंत उपयोग के लिए तैयार  
> **बाहरी उदाहरण** (Azure Samples) = लिंक्ड रिपॉज़िटरी से क्लोन करें

#### स्थानीय उदाहरण (तत्काल उपयोग के लिए तैयार)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM टेम्पलेट्स के साथ पूर्ण उत्पादन-तैयार कार्यान्वयन
  - मल्टी-एजेंट आर्किटेक्चर (कस्टमर + इन्वेंटरी एजेंट्स)
  - व्यापक निगरानी और मूल्यांकन
  - ARM टेम्पलेट के माध्यम से एक-क्लिक तैनाती

#### स्थानीय उदाहरण - कंटेनर एप्लिकेशन (अध्याय 2-5)
**इस रिपॉज़िटरी में व्यापक कंटेनर तैनाती उदाहरण:**
- [**Container App Examples**](examples/container-app/README.md) - कंटेनराइज़्ड तैनाती के लिए पूर्ण मार्गदर्शिका
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - scale-to-zero के साथ बुनियादी REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - उत्पादन-तैयार बहु-सर्विस तैनाती
  - क्विक स्टार्ट, उत्पादन, और उन्नत तैनाती पैटर्न
  - निगरानी, सुरक्षा, और लागत अनुकूलन मार्गदर्शन

#### बाहरी उदाहरण - साधारण एप्लिकेशन (अध्याय 1-2)
**शुरू करने के लिए इन Azure Samples रिपॉज़िटरीज़ को क्लोन करें:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - बुनियादी तैनाती पैटर्न
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - स्टैटिक कंटेंट तैनाती
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API तैनाती

#### बाहरी उदाहरण - डेटाबेस एकीकरण (अध्याय 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - डेटाबेस कनेक्टिविटी पैटर्न
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - सर्वरलेस डेटा वर्कफ़्लो

#### बाहरी उदाहरण - उन्नत पैटर्न (अध्याय 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - बहु-सर्विस आर्किटेक्चर
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - बैकग्राउंड प्रोसेसिंग  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - उत्पादन-तैयार ML पैटर्न

### बाहरी टेम्पलेट संग्रह
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - आधिकारिक और समुदाय टेम्पलेट्स का क्यूरेटेड संग्रह
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn टेम्पलेट दस्तावेज़ीकरण
- [**Examples Directory**](examples/README.md) - विस्तृत व्याख्याओं के साथ स्थानीय लर्निंग उदाहरण

---

## 📚 लर्निंग संसाधन और संदर्भ

### त्वरित संदर्भ
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - अध्याय के अनुसार व्यवस्थित आवश्यक azd कमांड
- [**Glossary**](resources/glossary.md) - Azure और azd शब्दावली  
- [**FAQ**](resources/faq.md) - अध्याय के अनुसार व्यवस्थित सामान्य प्रश्न
- [**Study Guide**](resources/study-guide.md) - व्यापक अभ्यास अभ्यास

### व्यावहारिक वर्कशॉप
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - अपने AI समाधानों को AZD-तैनात करने योग्य बनाएं (2-3 घंटे)
- [**Interactive Workshop**](workshop/README.md) - MkDocs और GitHub Codespaces के साथ 8-मॉड्यूल मार्गदर्शित अभ्यास
  - पालन करता है: परिचय → चयन → सत्यापन → विखंडन → विन्यास → अनुकूलन → हटाना → समापन

### बाहरी लर्निंग संसाधन
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 त्वरित समस्या निवारण मार्गदर्शिका

**नवसिखियों को आम समस्याएँ और तुरंत समाधान:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# पहले AZD इंस्टॉल करें
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# इंस्टॉलेशन सत्यापित करें
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" या "Subscription not set"</strong></summary>

```bash
# उपलब्ध सदस्यताएँ सूचीबद्ध करें
az account list --output table

# डिफ़ॉल्ट सदस्यता सेट करें
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
# किसी अलग Azure क्षेत्र आज़माएँ
azd env set AZURE_LOCATION "westus2"
azd up

# या विकास में छोटे SKUs का उपयोग करें
# infra/main.parameters.json को संपादित करें:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" आधे रास्ते में असफल हो जाता है</strong></summary>

```bash
# विकल्प 1: साफ़ करें और पुनः प्रयास करें
azd down --force --purge
azd up

# विकल्प 2: केवल बुनियादी ढांचे को ठीक करें
azd provision

# विकल्प 3: विस्तृत स्थिति जांचें
azd show

# विकल्प 4: Azure Monitor में लॉग्स जांचें
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" या "Token expired"</strong></summary>

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
# AZD अद्वितीय नाम बनाता है, लेकिन यदि टकराव हो:
azd down --force --purge

# तब ताज़ा वातावरण के साथ पुनः प्रयास करें
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ टेम्पलेट तैनाती बहुत समय ले रही है</strong></summary>

**सामान्य प्रतीक्षा समय:**
- सरल वेब ऐप: 5-10 मिनट
- डेटाबेस वाला ऐप: 10-15 मिनट
- AI अनुप्रयोग: 15-25 मिनट (OpenAI provisioning धीमा है)

```bash
# प्रगति की जाँच करें
azd show

# यदि 30 मिनट से अधिक अटके हैं, तो Azure पोर्टल जाँचें:
azd monitor
# असफल डिप्लॉयमेंट्स देखें
```
</details>

<details>
<summary><strong>❌ "Permission denied" या "Forbidden"</strong></summary>

```bash
# अपनी Azure भूमिका जांचें
az role assignment list --assignee $(az account show --query user.name -o tsv)

# आपको कम से कम "Contributor" भूमिका की आवश्यकता है
# अपने Azure व्यवस्थापक से अनुरोध करें कि वे प्रदान करें:
# - Contributor (संसाधनों के लिए)
# - User Access Administrator (भूमिका असाइनमेंट्स के लिए)
```
</details>

<details>
<summary><strong>❌ तैनात किए गए एप्लिकेशन का URL नहीं मिल रहा</strong></summary>

```bash
# सभी सेवा एंडपॉइंट दिखाएँ
azd show

# या Azure पोर्टल खोलें
azd monitor

# विशिष्ट सेवा जांचें
azd env get-values
# *_URL वेरिएबल्स खोजें
```
</details>

### 📚 पूर्ण समस्या निवारण संसाधन

- **सामान्य समस्याएँ गाइड:** [विस्तृत समाधान](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-विशिष्ट समस्याएँ:** [AI समस्या निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **डिबगिंग गाइड:** [कदम-दर-कदम डिबगिंग](docs/chapter-07-troubleshooting/debugging.md)
- **मदद प्राप्त करें:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 पाठ्यक्रम पूर्णता और प्रमाणन

### प्रगति ट्रैकिंग
प्रत्येक अध्याय के माध्यम से अपनी सीखने की प्रगति ट्रैक करें:

- [ ] **अध्याय 1**: आधार और त्वरित आरंभ ✅
- [ ] **अध्याय 2**: AI-प्रथम विकास ✅  
- [ ] **अध्याय 3**: कॉन्फ़िगरेशन और प्रमाणीकरण ✅
- [ ] **अध्याय 4**: इन्फ्रास्ट्रक्चर एज़ कोड और तैनाती ✅
- [ ] **अध्याय 5**: मल्टी-एजेंट AI समाधान ✅
- [ ] **अध्याय 6**: पूर्व-तैनाती सत्यापन और योजना ✅
- [ ] **अध्याय 7**: समस्या निवारण और डिबगिंग ✅
- [ ] **अध्याय 8**: प्रोडक्शन और एंटरप्राइज़ पैटर्न ✅

### सीख सत्यापन
प्रत्येक अध्याय पूरा करने के बाद, अपने ज्ञान का सत्यापन करें:
1. **व्यावहारिक अभ्यास**: अध्याय की हैंड्स-ऑन तैनाती पूरी करें
2. **ज्ञान जांच**: अपने अध्याय के FAQ अनुभाग की समीक्षा करें
3. **समुदाय चर्चा**: Azure Discord में अपना अनुभव साझा करें
4. **अगला अध्याय**: अगले जटिलता स्तर पर जाएं

### कोर्स पूरा करने के लाभ
सारे अध्याय पूरे करने पर, आपके पास होंगे:
- **प्रोडक्शन अनुभव**: Azure पर वास्तविक AI अनुप्रयोग तैनात किए
- **पेशेवर कौशल**: एंटरप्राइज़-रेडी तैनाती क्षमताएँ  
- **समुदाय मान्यता**: Azure डेवलपर समुदाय का सक्रिय सदस्य
- **कैरियर उन्नति**: मांग में रहने वाला AZD और AI तैनाती विशेषज्ञता

---

## 🤝 समुदाय और समर्थन

### सहायता और समर्थन
- **तकनीकी समस्याएँ**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **सीखने के प्रश्न**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) और [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-विशिष्ट सहायता**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **डॉक्यूमेंटेशन**: [आधिकारिक Azure Developer CLI प्रलेखन](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord से समुदाय अंतर्दृष्टियाँ

**#Azure चैनल से हाल के सर्वे परिणाम:**
- **45%** डेवलपर्स AZD को AI वर्कलोड के लिए उपयोग करना चाहते हैं
- **मुख्य चुनौतियाँ**: मल्टी-सर्विस तैनाती, क्रेडेंशियल प्रबंधन, उत्पादन तैयारियाँ  
- **सबसे अनुरोधित**: AI-विशिष्ट टेम्पलेट, समस्या निवारण गाइड, सर्वोत्तम प्रथाएँ

**हमारे समुदाय में शामिल होकर:**
- अपना AZD + AI अनुभव साझा करें और सहायता प्राप्त करें
- नए AI टेम्पलेट्स के शुरुआती प्रीव्यू एक्सेस करें
- AI तैनाती के सर्वोत्तम प्रथाओं में योगदान करें
- भविष्य के AI + AZD फीचर विकास को प्रभावित करें

### पाठ्यक्रम में योगदान
हम योगदान का स्वागत करते हैं! विवरण के लिए हमारे [योगदान मार्गदर्शिका](CONTRIBUTING.md) को पढ़ें:
- **सामग्री सुधार**: मौजूदा अध्यायों और उदाहरणों को बढ़ाएँ
- **नए उदाहरण**: वास्तविक दुनिया के परिदृश्यों और टेम्पलेट्स जोड़ें  
- **अनुवाद**: बहुभाषी समर्थन बनाए रखने में मदद करें
- **बग रिपोर्ट्स**: सटीकता और स्पष्टता में सुधार करें
- **समुदाय मानक**: हमारे समावेशी समुदाय दिशानिर्देशों का पालन करें

---

## 📄 पाठ्यक्रम जानकारी

### लाइसेंस
यह प्रोजेक्ट MIT लाइसेंस के अंतर्गत लाइसेंस प्राप्त है - विवरण के लिए [LICENSE](../../LICENSE) फ़ाइल देखें।

### संबंधित Microsoft लर्निंग संसाधन

Our team produces other comprehensive learning courses:

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

## 🗺️ पाठ्यक्रम नेविगेशन

**🚀 क्या आप सीखना शुरू करने के लिए तैयार हैं?**

**शुरुआती**: शुरुआत करें [अध्याय 1: आधार और त्वरित आरंभ](../..)  
**AI डेवलपर्स**: पर जाएँ [अध्याय 2: AI-प्रथम विकास](../..)  
**अनुभवी डेवलपर्स**: शुरू करें [अध्याय 3: कॉन्फ़िगरेशन और प्रमाणीकरण](../..)

**अगले कदम**: [अध्याय 1 शुरू करें - AZD मूल बातें](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। हालांकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान रखें कि स्वचालित अनुवादों में त्रुटियाँ या गलतियाँ हो सकती हैं। मूल भाषा में उपलब्ध दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->