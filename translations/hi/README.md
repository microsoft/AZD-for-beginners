# AZD शुरुआती के लिए: एक संरचित सीखने की यात्रा

![AZD-शुरुआती](../../translated_images/hi/azdbeginners.5527441dd9f74068.webp) 

[![GitHub वॉचर्स](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub फ़ोर्क्स](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub स्टार्स](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure डिस्कॉर्ड](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry डिस्कॉर्ड](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### स्वचालित अनुवाद (हमेशा अद्यतित)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[अरबी](../ar/README.md) | [बंगाली](../bn/README.md) | [बल्गेरियाई](../bg/README.md) | [बर्मी (म्यांमार)](../my/README.md) | [चीनी (सरलीकृत)](../zh-CN/README.md) | [चीनी (परंपरागत, हॉंग कॉंग)](../zh-HK/README.md) | [चीनी (परंपरागत, मकाओ)](../zh-MO/README.md) | [चीनी (परंपरागत, ताइवान)](../zh-TW/README.md) | [क्रोएशियाई](../hr/README.md) | [चेक](../cs/README.md) | [डेनिश](../da/README.md) | [डच](../nl/README.md) | [एस्टोनियाई](../et/README.md) | [फिनिश](../fi/README.md) | [फ्रेंच](../fr/README.md) | [जर्मन](../de/README.md) | [ग्रीक](../el/README.md) | [हिब्रू](../he/README.md) | [हिंदी](./README.md) | [हंगेरियन](../hu/README.md) | [इंडोनेशियाई](../id/README.md) | [इटालियन](../it/README.md) | [जापानी](../ja/README.md) | [कन्नड़](../kn/README.md) | [खमेर](../km/README.md) | [कोरियाई](../ko/README.md) | [लिथुआनियाई](../lt/README.md) | [मलय](../ms/README.md) | [मलयालम](../ml/README.md) | [मराठी](../mr/README.md) | [नेपाली](../ne/README.md) | [नाइजीरियाई पिजिन](../pcm/README.md) | [नॉर्वेजियन](../no/README.md) | [फ़ारसी (Farsi)](../fa/README.md) | [पोलिश](../pl/README.md) | [पुर्तगाली (ब्राज़ील)](../pt-BR/README.md) | [पुर्तगाली (पुर्तगाल)](../pt-PT/README.md) | [पंजाबी (गुरमुखी)](../pa/README.md) | [रोमानियाई](../ro/README.md) | [रूसी](../ru/README.md) | [सर्बियाई (सिरिलिक)](../sr/README.md) | [स्लोवाक](../sk/README.md) | [स्लोवेनियाई](../sl/README.md) | [स्पेनिश](../es/README.md) | [स्वाहिली](../sw/README.md) | [स्वीडिश](../sv/README.md) | [टागालोग (फिलिपिनो)](../tl/README.md) | [तमिल](../ta/README.md) | [तेलुगू](../te/README.md) | [थाई](../th/README.md) | [तुर्किश](../tr/README.md) | [यूक्रेनी](../uk/README.md) | [उर्दू](../ur/README.md) | [वियतनामी](../vi/README.md)

> **स्थानीय रूप से क्लोन करना पसंद है?**
>
> यह रिपॉज़िटरी 50+ भाषा के अनुवाद शामिल करती है जो डाउनलोड आकार को काफी बढ़ा देती है। अनुवादों के बिना क्लोन करने के लिए, sparse checkout का उपयोग करें:
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
> यह आपको तेज़ डाउनलोड के साथ पाठ्यक्रम पूरा करने के लिए सब कुछ देता है।
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 आज azd में क्या नया है

> 📌 यह पाठ्यक्रम **`azd 1.25.6`** (जून 2026) के साथ सत्यापित है। अपने बिल्ड की जाँच करने के लिए `azd version` चलाएँ, और नवीनतम प्राप्त करने के लिए `azd upgrade` चलाएँ।

Azure Developer CLI पारंपरिक वेब ऐप्स और APIs से आगे बढ़ गया है। आज, azd Azure पर किसी भी एप्लिकेशन को तैनात करने के लिए एकल उपकरण है — जिसमें AI-समर्थित एप्लिकेशन और इंटेलिजेंट एजेंट शामिल हैं।

इसके आपके लिए अर्थ ये हैं:

- **AI एजेंट अब azd वर्कलोड के पहले दर्जे के हैं।** आप वही `azd init` → `azd up` वर्कफ़्लो उपयोग करके AI एजेंट प्रोजेक्ट्स इनिशियलाइज़, तैनात, और प्रबंधित कर सकते हैं जिनके आप पहले से परिचित हैं।
- **CLI से एक पूर्ण एजेंट जीवनचक्र।** `azure.ai.agents` एक्सटेंशन अब पूरे सफर को कवर करता है — स्कैफोल्ड करने के लिए `azd ai agent init`, परीक्षण के लिए `azd ai agent invoke` (जिसमें response-timing आउटपुट है), गुणवत्ता को मापने और सुधारने के लिए `azd ai agent eval generate` और `azd ai agent optimize`, और साफ़ करने के लिए `azd ai agent delete`।
- **अधिक AI बिल्डिंग ब्लॉक्स।** नए प्रीव्यू एक्सटेंशन — `azure.ai.skills` और `azure.ai.connections` — आपको पुन: उपयोगयोग्य एजेंट स्किल्स और Foundry कनेक्शनों को सीधे azd के साथ प्रबंधित करने देते हैं।
- **Microsoft Foundry एकीकरण** मॉडल तैनाती, एजेंट होस्टिंग, और AI सेवा विन्यास को सीधे azd टेम्पलेट पारिस्थितिकी तंत्र में लाता है।
- **दैनिक बुनियादी कार्यों में सुगमता।** हाल की रिलीज़ ने `azd init` को idempotent (फिर से चलाने के लिए सुरक्षित) बनाया, `azd auth login` को स्वतः पुरानी टोकन साफ़ करने के योग्य बनाया, और एक मैत्रीपूर्ण `azd tool` पहली-बार-सेटअप संकेत जोड़ा।
- **कोर वर्कफ़्लो नहीं बदला है।** चाहे आप todo ऐप, एक माइक्रोसर्विस, या मल्टी-एजेंट AI समाधान तैनात कर रहे हों, कमांड्स वही हैं।

> **Aspire उपयोगकर्ताओं के लिए नोट:** Microsoft अब उत्पाद को सरल रूप में **Aspire** (पूर्व में ".NET Aspire") के रूप में संदर्भित करता है। azd का Aspire समर्थन अपरिवर्तित है — केवल नाम अपडेट किया गया था।

यदि आपने पहले azd का उपयोग किया है, तो AI सपोर्ट एक प्राकृतिक विस्तार है — एक अलग उपकरण या उन्नत ट्रैक नहीं। यदि आप नई शुरुआत कर रहे हैं, तो आप एक ऐसा वर्कफ़्लो सीखेंगे जो हर चीज़ के लिए काम करता है।

---

## 🚀 Azure Developer CLI (azd) क्या है?

**Azure Developer CLI (azd)** एक डेवलपर-अनुकूल कमांड-लाइन टूल है जो Azure पर एप्लिकेशन तैनात करना सरल बनाता है। दर्जनों Azure संसाधनों को मैन्युअल रूप से बनाने और कनेक्ट करने के बजाय, आप एक ही कमांड से पूरे एप्लिकेशन तैनात कर सकते हैं।

### `azd up` का जादू

```bash
# यह एकल कमांड सब कुछ करता है:
# ✅ सभी Azure संसाधन बनाता है
# ✅ नेटवर्किंग और सुरक्षा कॉन्फ़िगर करता है
# ✅ आपके आवेदन कोड का निर्माण करता है
# ✅ Azure पर परिनियोजित करता है
# ✅ आपको एक काम करने वाला URL देता है
azd up
```

**बस इतना ही!** कोई Azure Portal पर क्लिकिंग नहीं, कोई जटिल ARM टेम्पलेट पहले सीखने की आवश्यकता नहीं, कोई मैन्युअल कॉन्फ़िगरेशन नहीं - बस काम करने वाले एप्लिकेशन Azure पर।

---

## ❓ Azure Developer CLI बनाम Azure CLI: क्या अंतर है?

यह शुरुआती लोगों द्वारा सबसे आम पूछा जाने वाला प्रश्न है। यहाँ सरल उत्तर है:

| विशेषता | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **उद्देश्य** | व्यक्तिगत Azure संसाधनों का प्रबंधन करें | पूरा एप्लिकेशन तैनात करें |
| **मानसिकता** | इन्फ्रास्ट्रक्चर-केंद्रित | एप्लिकेशन-केंद्रित |
| **उदाहरण** | `az webapp create --name myapp...` | `azd up` |
| **सीखने की कठिनाई** | Azure सेवाओं को जानना आवश्यक | केवल अपना ऐप जानें |
| **किसके लिए बेहतर** | DevOps, इन्फ्रास्ट्रक्चर | डेवलपर्स, प्रोटोटाइपिंग |

### एक सरल उपमा

- **Azure CLI** ऐसे है जैसे आपके पास घर बनाने के सारे उपकरण हों - हथौड़े, आरी, कीलें। आप कुछ भी बना सकते हैं, लेकिन आपको निर्माण का ज्ञान होना चाहिए।
- **Azure Developer CLI** ऐसे है जैसे एक ठेकेदार को किराए पर लेना - आप बताते हैं कि आप क्या चाहते हैं, और वे निर्माण का काम संभाल लेते हैं।

### किसे कब उपयोग करें

| परिदृश्य | उपयोग करें |
|----------|----------|
| "मैं अपना वेब ऐप जल्दी तैनात करना चाहता हूँ" | `azd up` |
| "मुझे केवल एक स्टोरेज अकाउंट बनाना है" | `az storage account create` |
| "मैं एक पूरा AI एप्लिकेशन बना रहा हूँ" | `azd init --template azure-search-openai-demo` |
| "मुझे किसी विशिष्ट Azure संसाधन का डिबग करने की आवश्यकता है" | `az resource show` |
| "मैं मिनटों में प्रोडक्शन-रेडी तैनाती चाहता हूँ" | `azd up --environment production` |

### वे साथ मिलकर काम करते हैं!

AZD अंतर्निहित रूप से Azure CLI का उपयोग करता है। आप दोनों का उपयोग कर सकते हैं:
```bash
# अपने ऐप को AZD के साथ तैनात करें
azd up

# फिर Azure CLI के साथ विशिष्ट संसाधनों को सूक्ष्म समायोजित करें
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD में टेम्पलेट खोजें

शून्य से शुरुआत न करें! **Awesome AZD** तैयार-तैनात टेम्पलेट्स का समुदाय संग्रह है:

| संसाधन | विवरण |
|----------|-------------|
| 🔗 [**Awesome AZD गैलरी**](https://azure.github.io/awesome-azd/) | एक-क्लिक तैनाती के साथ 200+ टेम्पलेट ब्राउज़ करें |
| 🔗 [**एक टेम्पलेट सबमिट करें**](https://github.com/Azure/awesome-azd/issues) | समुदाय में अपना टेम्पलेट योगदान करें |
| 🔗 [**GitHub रिपॉज़िटरी**](https://github.com/Azure/awesome-azd) | स्रोत को स्टार और एक्स्प्लोर करें |

### Awesome AZD से लोकप्रिय AI टेम्पलेट्स

```bash
# माइक्रोसॉफ्ट फाउंड्री मॉडलों के साथ RAG चैट + AI खोज
azd init --template azure-search-openai-demo

# त्वरित AI चैट अनुप्रयोग
azd init --template openai-chat-app-quickstart

# फाउंड्री एजेंट्स के साथ AI एजेंट्स
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 चरणों में आरंभ करें

शुरू करने से पहले, सुनिश्चित करें कि आपकी मशीन उस टेम्पलेट के लिए तैयार है जिसे आप तैनात करना चाहते हैं:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

यदि कोई आवश्यक जाँच विफल होती है, तो पहले उसे ठीक करें और फिर क्विक स्टार्ट के साथ आगे बढ़ें।

### चरण 1: AZD स्थापित करें (2 मिनट)

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

### चरण 2: AZD के लिए प्रमाणीकरण

```bash
# वैकल्पिक यदि आप इस कोर्स में सीधे Azure CLI कमांड का उपयोग करने की योजना बना रहे हैं
az login

# AZD वर्कफ़्लोज़ के लिए आवश्यक
azd auth login
```

यदि आप निश्चित नहीं हैं कि आपको कौन सा तरीका चाहिए, तो [स्थापना और सेटअप](docs/chapter-01-foundation/installation.md#authentication-setup) में पूरा सेटअप फ़्लो देखें।

### चरण 3: अपना पहला ऐप तैनात करें

```bash
# एक टेम्पलेट से आरंभ करें
azd init --template todo-nodejs-mongo

# Azure पर तैनात करें (सब कुछ बनाता है!)
azd up
```

**🎉 बस इतना ही!** आपका ऐप अब Azure पर लाइव है।

### साफ़-सफ़ाई (मत भूलें!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 इस पाठ्यक्रम का उपयोग कैसे करें

यह पाठ्यक्रम **प्रगतिशील सीखने** के लिए डिज़ाइन किया गया है - जहाँ आप सहज हों वहां से शुरू करें और धीरे-धीरे आगे बढ़ें:

| आपका अनुभव | यहाँ से शुरू करें |
|-----------------|------------|
| **Azure में बिल्कुल नया** | [अध्याय 1: फाउंडेशन](#-chapter-1-foundation--quick-start) |
| **Azure जानते हैं, AZD में नए** | [अध्याय 1: फाउंडेशन](#-chapter-1-foundation--quick-start) |
| **AI ऐप तैनात करना चाहते हैं** | [अध्याय 2: AI-प्रथम विकास](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **व्यावहारिक अभ्यास चाहते हैं** | [🎓 इंटरएक्टिव कार्यशाला](workshop/README.md) - 3-4 घंटे का मार्गदर्शित लैब |
| **उत्पादन पैटर्न की आवश्यकता है** | [अध्याय 8: प्रोडक्शन और एंटरप्राइज़](#-chapter-8-production--enterprise-patterns) |

### त्वरित सेटअप

1. **इस रिपॉज़िटरी को फोर्क करें**: [![GitHub फ़ोर्क्स](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **इसे क्लोन करें**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **मदद पाएं**: [Azure डिस्कॉर्ड समुदाय](https://discord.com/invite/ByRwuEEgH4)

> **स्थानीय रूप से क्लोन करना पसंद है?**
>
> यह रिपॉज़िटरी 50+ भाषा के अनुवाद शामिल करती है जो डाउनलोड आकार को काफी बढ़ा देती है। अनुवादों के बिना क्लोन करने के लिए, sparse checkout का उपयोग करें:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> यह आपको तेज़ डाउनलोड के साथ पाठ्यक्रम पूरा करने के लिए सब कुछ देता है।


## पाठ्यक्रम अवलोकन

संरचित अध्यायों के माध्यम से Azure Developer CLI (azd) में महारत हासिल करें जो प्रगतिशील सीखने के लिए डिज़ाइन किए गए हैं। **Microsoft Foundry एकीकरण के साथ AI एप्लिकेशन तैनाती पर विशेष ध्यान।**
### आधुनिक डेवलपर्स के लिए यह कोर्स क्यों आवश्यक है

Microsoft Foundry Discord समुदाय की जानकारी के अनुसार, **45% डेवलपर्स AI वर्कलोड के लिए AZD का उपयोग करना चाहते हैं** लेकिन उन्हें इन समस्याओं का सामना करना पड़ता है:
- जटिल मल्टी-सर्विस AI आर्किटेक्चर
- प्रोडक्शन AI तैनाती के सर्वश्रेष्ठ अभ्यास  
- Azure AI सेवा एकीकरण और कॉन्फ़िगरेशन
- AI वर्कलोड के लिए लागत अनुकूलन
- AI-विशिष्ट तैनाती समस्याओं का निवारण

### सीखने के उद्देश्य

इस संरचित कोर्स को पूरा करके, आप:
- **AZD की बुनियादी बातों में महारत हासिल करें**: मुख्य अवधारणाएँ, इंस्टॉलेशन, और कॉन्फ़िगरेशन
- **AI एप्लिकेशन तैनात करें**: Microsoft Foundry सेवाओं के साथ AZD का उपयोग करें
- **Infrastructure as Code को लागू करें**: Bicep टेम्पलेट्स के साथ Azure संसाधनों का प्रबंधन करें
- **तैनाती समस्याओं का निवारण करें**: सामान्य समस्याओं को हल करें और बग सुलझाएँ
- **प्रोडक्शन के लिए अनुकूलित करें**: सुरक्षा, स्केलिंग, निगरानी, और लागत प्रबंधन
- **मल्टी-एजेंट समाधान बनाएं**: जटिल AI आर्किटेक्चर तैनात करें

## शुरू करने से पहले: खाते, एक्सेस, और अनुमानों

अध्याय 1 शुरू करने से पहले, सुनिश्चित करें कि आपके पास निम्नलिखित मौजूद हों। इस मार्गदर्शिका के बाद के इंस्टॉलेशन चरण इन बुनियादी चीज़ों को पहले से मौजूद मानते हैं।

- **एक Azure सब्सक्रिप्शन**: आप काम से मौजूदा सब्सक्रिप्शन या अपने खाते का उपयोग कर सकते हैं, या शुरू करने के लिए एक [फ्री ट्रायल](https://aka.ms/azurefreetrial) बना सकते हैं.
- **Azure संसाधन बनाने की अनुमति**: अधिकांश अभ्यासों के लिए, टारगेट सब्सक्रिप्शन या रिसोर्स ग्रुप पर कम से कम **Contributor** एक्सेस होना चाहिए। कुछ अध्याय यह भी मान सकते हैं कि आप रिसोर्स ग्रुप, प्रबंधित पहचानें, और RBAC असाइनमेंट बना सकते हैं।
- [**एक GitHub खाता**](https://github.com): यह रिपॉजिटरी को फोर्क करने, अपने परिवर्तनों को ट्रैक करने, और वर्कशॉप के लिए GitHub Codespaces का उपयोग करने के लिए उपयोगी है।
- **टेम्पलेट रनटाइम पूर्वापेक्षाएँ**: कुछ टेम्पलेट्स को लोकल टूल्स की आवश्यकता होती है जैसे Node.js, Python, Java, या Docker. शुरू करने से पहले setup validator चलाएँ ताकि आप कमी वाले टूल्स को जल्दी पकड़ लें।
- **बेसिक टर्मिनल परिचितता**: आपको एक्सपर्ट होने की आवश्यकता नहीं है, लेकिन आपको `git clone`, `azd auth login`, और `azd up` जैसे कमांड चलाने में सहज होना चाहिए।

> **एंटरप्राइज़ सब्सक्रिप्शन में काम कर रहे हैं?**
> यदि आपका Azure परिवेश किसी व्यवस्थापक द्वारा प्रबंधित है, तो पहले से पुष्टि करें कि आप उस सब्सक्रिप्शन या रिसोर्स ग्रुप में संसाधन तैनात कर सकते हैं जिसका आप उपयोग करने की योजना बना रहे हैं। यदि नहीं, तो शुरू करने से पहले सैंडबॉक्स सब्सक्रिप्शन या Contributor एक्सेस के लिए अनुरोध करें.

> **Azure में नए हैं?**
> https://aka.ms/azurefreetrial पर अपने Azure ट्रायल या pay-as-you-go सब्सक्रिप्शन के साथ शुरुआत करें ताकि आप टेनेन्ट-स्तर की अनुमोदन की प्रतीक्षा किए बिना अभ्यास अंत तक पूरा कर सकें।

## 🗺️ पाठ्यक्रम मानचित्र: अध्याय के अनुसार त्वरित नेविगेशन

प्रत्येक अध्याय के पास समर्पित README होता है जिसमें सीखने के उद्देश्य, त्वरित शुरुआत, और अभ्यास शामिल होते हैं:

| अध्याय | विषय | पाठ | समय | जटिलता |
|---------|-------|---------|----------|------------|
| **[अध्याय 1: फाउंडेशन](docs/chapter-01-foundation/README.md)** | शुरू करना | [AZD बुनियादी बातें](docs/chapter-01-foundation/azd-basics.md) &#124; [इंस्टालेशन](docs/chapter-01-foundation/installation.md) &#124; [पहला प्रोजेक्ट](docs/chapter-01-foundation/first-project.md) | 30-45 मिनट | ⭐ |
| **[अध्याय 2: AI डेवलपमेंट](docs/chapter-02-ai-development/README.md)** | AI-प्राथमिक ऐप्स | [Foundry एकीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI एजेंट्स](docs/chapter-02-ai-development/agents.md) &#124; [AI मॉडल तैनाती](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [वर्कशॉप](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 घंटे | ⭐⭐ |
| **[अध्याय 3: कॉन्फ़िगरेशन](docs/chapter-03-configuration/README.md)** | प्रमाणीकरण और सुरक्षा | [कॉन्फ़िगरेशन गाइड](docs/chapter-03-configuration/configuration.md) &#124; [प्रमाणीकरण पैटर्न और प्रबंधित पहचान](docs/chapter-03-configuration/authsecurity.md) | 45-60 मिनट | ⭐⭐ |
| **[अध्याय 4: बुनियादी ढाँचा](docs/chapter-04-infrastructure/README.md)** | IaC और तैनाती | [तैनाती गाइड](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [प्राविजनिंग](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 घंटे | ⭐⭐⭐ |
| **[अध्याय 5: मल्टी-एजेंट](docs/chapter-05-multi-agent/README.md)** | AI एजेंट समाधान | [रिटेल परिदृश्य](examples/retail-scenario.md) &#124; [समन्वय पैटर्न्स](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 घंटे | ⭐⭐⭐⭐ |
| **[अध्याय 6: प्री-तैनाती](docs/chapter-06-pre-deployment/README.md)** | योजना और वैलिडेशन | [प्रिफ़्लाइट चेक्स](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [क्षमता योजना](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU चयन](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 घंटा | ⭐⭐ |
| **[अध्याय 7: ट्रबलशूटिंग](docs/chapter-07-troubleshooting/README.md)** | डिबग और फिक्स | [सामान्य समस्याएँ](docs/chapter-07-troubleshooting/common-issues.md) &#124; [डिबगिंग](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI समस्याएँ](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 घंटे | ⭐⭐ |
| **[अध्याय 8: प्रोडक्शन](docs/chapter-08-production/README.md)** | एंटरप्राइज़ पैटर्न्स | [प्रोडक्शन प्रैक्टिसेज़](docs/chapter-08-production/production-ai-practices.md) | 2-3 घंटे | ⭐⭐⭐⭐ |
| **[🎓 वर्कशॉप](workshop/README.md)** | प्रायोगिक प्रयोगशाला | [परिचय](workshop/docs/instructions/0-Introduction.md) &#124; [टेम्पलेट चयन](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [टेम्पलेट वैलिडेट करें](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [AI टेम्पलेट का विघटन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [AI टेम्पलेट कॉन्फ़िगर करें](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [AI टेम्पलेट अनुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [इन्फ्रास्ट्रक्चर टियरडाउन](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [सारांश](workshop/docs/instructions/7-Wrap-up.md) | 3-4 घंटे | ⭐⭐ |

**कुल कोर्स अवधि:** ~10-14 घंटे | **कौशल प्रगति:** शुरुआती → प्रोडक्शन-तैयार

---

## 📚 सीखने के अध्याय

*अपने अनुभव स्तर और लक्ष्यों के आधार पर अपना सीखने का मार्ग चुनें*

### 🚀 अध्याय 1: फाउंडेशन और त्वरित शुरुआत
**पूर्व-आवश्यकताएँ**: Azure सब्सक्रिप्शन, बुनियादी कमांड लाइन ज्ञान  
**समय**: 30-45 मिनट  
**जटिलता**: ⭐

#### आप क्या सीखेंगे
- Azure Developer CLI की बुनियादी समझ
- अपने प्लेटफ़ॉर्म पर AZD इंस्टॉल करना
- आपकी पहली सफल तैनाती

#### सीखने के संसाधन
- **🎯 यहाँ से शुरू करें**: [Azure Developer CLI क्या है?](#what-is-azure-developer-cli)
- **📖 सिद्धांत**: [AZD बुनियादी बातें](docs/chapter-01-foundation/azd-basics.md) - मुख्य अवधारणाएँ और शब्दावली
- **⚙️ सेटअप**: [इंस्टालेशन और सेटअप](docs/chapter-01-foundation/installation.md) - प्लेटफ़ॉर्म-विशेष गाइड
- **🛠️ हैंड्स-ऑन**: [आपका पहला प्रोजेक्ट](docs/chapter-01-foundation/first-project.md) - चरण-दर-चरण ट्यूटोरियल
- **📋 त्वरित संदर्भ**: [कमान्ड चीट शीट](resources/cheat-sheet.md)

#### प्रायोगिक अभ्यास
```bash
# त्वरित स्थापना जाँच
azd version

# अपना पहला एप्लिकेशन तैनात करें
azd init --template todo-nodejs-mongo
azd up
```

**💡 अध्याय का परिणाम**: AZD का उपयोग करके Azure पर एक सरल वेब एप्लिकेशन सफलतापूर्वक तैनात करें

**✅ सफलता सत्यापन:**
```bash
# अध्याय 1 पूरा करने के बाद, आप सक्षम होंगे:
azd version              # स्थापित संस्करण दिखाता है
azd init --template todo-nodejs-mongo  # परियोजना आरंभ करता है
azd up                  # Azure पर तैनात करता है
azd show                # चल रहे ऐप का URL प्रदर्शित करता है
# एप्लिकेशन ब्राउज़र में खुलता है और काम करता है
azd down --force --purge  # संसाधनों की सफाई करता है
```

**📊 समय निवेश:** 30-45 मिनट  
**📈 अभ्यास के बाद कौशल स्तर:** साधारण एप्लिकेशन स्वतंत्र रूप से तैनात कर सकता है
**📈 अभ्यास के बाद कौशल स्तर:** साधारण एप्लिकेशन स्वतंत्र रूप से तैनात कर सकता है

---

### 🤖 अध्याय 2: AI-प्राथमिक विकास (AI डेवलपर्स के लिए अनुशंसित)
**पूर्व-आवश्यकताएँ**: अध्याय 1 पूरा किया हुआ  
**समय**: 1-2 घंटे  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- AZD के साथ Microsoft Foundry एकीकरण
- AI-संचालित एप्लिकेशन तैनात करना
- AI सेवा कॉन्फ़िगरेशन की समझ

#### सीखने के संसाधन
- **🎯 यहाँ से शुरू करें**: [Microsoft Foundry एकीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI एजेंट्स**: [AI एजेंट्स गाइड](docs/chapter-02-ai-development/agents.md) - AZD के साथ बुद्धिमान एजेंट तैनात करें
- **📖 पैटर्न्स**: [AI मॉडल तैनाती](docs/chapter-02-ai-development/ai-model-deployment.md) - AI मॉडलों को तैनात और प्रबंधित करें
- **🛠️ वर्कशॉप**: [AI वर्कशॉप लैब](docs/chapter-02-ai-development/ai-workshop-lab.md) - अपनी AI समाधान को AZD-रेडी बनाएं
- **🎥 इंटरैक्टिव गाइड**: [वर्कशॉप सामग्री](workshop/README.md) - ब्राउज़र-आधारित सीखना MkDocs * DevContainer Environment के साथ
- **📋 टेम्पलेट्स**: [Microsoft Foundry टेम्पलेट्स](#वर्कशॉप-संसाधन)
- **📝 उदाहरण**: [AZD तैनाती उदाहरण](examples/README.md)

#### प्रायोगिक अभ्यास
```bash
# अपना पहला एआई एप्लिकेशन तैनात करें
azd init --template azure-search-openai-demo
azd up

# अतिरिक्त एआई टेम्पलेट आज़माएँ
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 अध्याय का परिणाम**: RAG क्षमताओं के साथ एक AI-संचालित चैट एप्लिकेशन तैनात और कॉन्फ़िगर करें

**✅ सफलता सत्यापन:**
```bash
# अध्याय 2 के बाद, आप सक्षम होंगे:
azd init --template azure-search-openai-demo
azd up
# AI चैट इंटरफ़ेस का परीक्षण करें
# प्रश्न पूछें और स्रोतों के साथ एआई-संचालित उत्तर प्राप्त करें
# सत्यापित करें कि खोज एकीकरण काम कर रहा है
azd monitor  # जांचें कि Application Insights टेलीमेट्री दिखा रहा है
azd down --force --purge
```

**📊 समय निवेश:** 1-2 घंटे  
**📈 अभ्यास के बाद कौशल स्तर:** प्रोडक्शन-तैयार AI एप्लिकेशन तैनात और कॉन्फ़िगर कर सकता है  
**💰 लागत अवेयरनेस:** विकास लागत लगभग $80-150/माह, प्रोडक्शन लागत $300-3500/माह समझें

#### 💰 AI तैनातियों के लिए लागत विचार

**विकास पर्यावरण (अनुमानित $80-150/माह):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/माह (token उपयोग के आधार पर)
- AI Search (Basic tier): $75/माह
- Container Apps (Consumption): $0-20/माह
- Storage (Standard): $1-5/माह

**प्रोडक्शन पर्यावरण (अनुमानित $300-3,500+/माह):**
- Microsoft Foundry Models (सुसंगत प्रदर्शन के लिए PTU): $3,000+/माह OR Pay-as-go with high volume
- AI Search (Standard tier): $250/माह
- Container Apps (Dedicated): $50-100/माह
- Application Insights: $5-50/माह
- Storage (Premium): $10-50/माह

**💡 लागत अनुकूलन सुझाव:**
- शिक्षण के लिए **Free Tier** Microsoft Foundry Models का उपयोग करें (Azure OpenAI 50,000 tokens/माह शामिल)
- सक्रिय रूप से विकसित न कर रहे हों तो संसाधनों को डिअलोकेट करने के लिए `azd down` चलाएँ
- consumption-आधारित बिलिंग से शुरुआत करें, केवल प्रोडक्शन के लिए PTU पर अपग्रेड करें
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
**पूर्व-आवश्यकताएँ**: अध्याय 1 पूरा किया हुआ  
**समय**: 45-60 मिनट  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- पर्यावरण कॉन्फ़िगरेशन और प्रबंधन
- प्रमाणीकरण और सुरक्षा के सर्वश्रेष्ठ अभ्यास
- संसाधन नामकरण और संगठन

#### सीखने के संसाधन
- **📖 कॉन्फ़िगरेशन**: [कॉन्फ़िगरेशन गाइड](docs/chapter-03-configuration/configuration.md) - पर्यावरण सेटअप
- **🔐 सुरक्षा**: [प्रमाणीकरण पैटर्न और प्रबंधित पहचान](docs/chapter-03-configuration/authsecurity.md) - प्रमाणीकरण पैटर्न
- **📝 उदाहरण**: [डेटाबेस ऐप उदाहरण](examples/database-app/README.md) - AZD डेटाबेस उदाहरण

#### प्रायोगिक अभ्यास
- कई पर्यावरण कॉन्फ़िगर करें (dev, staging, prod)
- प्रबंधित पहचान प्रमाणीकरण सेटअप करें
- पर्यावरण-विशिष्ट कॉन्फ़िगरेशन लागू करें

**💡 अध्याय का परिणाम**: उचित प्रमाणीकरण और सुरक्षा के साथ कई पर्यावरणों का प्रबंधन करें

---

### 🏗️ अध्याय 4: Infrastructure as Code और तैनाती
**पूर्व-आवश्यकताएँ**: अध्याय 1-3 पूरा किया हुआ  
**समय**: 1-1.5 घंटे  
**जटिलता**: ⭐⭐⭐

#### आप क्या सीखेंगे
- उन्नत तैनाती पैटर्न
- Bicep के साथ Infrastructure as Code
- संसाधन प्राविजनिंग रणनीतियाँ

#### सीखने के संसाधन
- **📖 तैनाती**: [तैनाती गाइड](docs/chapter-04-infrastructure/deployment-guide.md) - पूर्ण वर्कफ़्लो
- **🏗️ प्राविजनिंग**: [रिसोर्स प्राविजनिंग](docs/chapter-04-infrastructure/provisioning.md) - Azure संसाधन प्रबंधन
- **📝 उदाहरण**: [कंटेनर ऐप उदाहरण](../../examples/container-app) - कंटेनराइज़्ड तैनाती

#### प्रायोगिक अभ्यास
- कस्टम Bicep टेम्पलेट बनाएं
- मल्टी-सर्विस एप्लिकेशन तैनात करें
- ब्लू-ग्रीन तैनाती रणनीतियाँ लागू करें

**💡 अध्याय का परिणाम**: कस्टम इन्फ्रास्ट्रक्चर टेम्पलेट्स का उपयोग करके जटिल मल्टी-सर्विस एप्लिकेशन तैनात करें
### 🎯 अध्याय 5: मल्टी-एजेंट AI समाधान (उन्नत)
**पूर्वापेक्षाएँ**: अध्याय 1-2 पूर्ण  
**अवधि**: 2-3 घंटे  
**जटिलता**: ⭐⭐⭐⭐

#### आप क्या सीखेंगे
- मल्टी-एजेंट आर्किटेक्चर पैटर्न
- एजेंट ऑर्केस्ट्रेशन और समन्वय
- उत्पादन-तैयार AI तैनातियाँ

#### अध्ययन संसाधन
- **🤖 विशेष परियोजना**: [रिटेल मल्टी-एजेंट समाधान](examples/retail-scenario.md) - पूरा कार्यान्वयन
- **🛠️ ARM टेम्पलेट्स**: [ARM टेम्पलेट पैकेज](../../examples/retail-multiagent-arm-template) - एक-क्लिक तैनाती
- **📖 आर्किटेक्चर**: [मल्टी-एजेंट समन्वय पैटर्न](docs/chapter-06-pre-deployment/coordination-patterns.md) - पैटर्न

#### व्यावहारिक अभ्यास
```bash
# पूर्ण खुदरा बहु-एजेंट समाधान तैनात करें
cd examples/retail-multiagent-arm-template
./deploy.sh

# एजेंट विन्यासों का अन्वेषण करें
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 अध्याय परिणाम**: ग्राहक और इन्वेंटरी एजेंट्स के साथ एक प्रोडक्शन-तैयार मल्टी-एजेंट AI समाधान तैनात और प्रबंधित करें

---

### 🔍 अध्याय 6: पूर्व-तैनाती मान्यकरण और योजना
**पूर्वापेक्षाएँ**: अध्याय 4 पूर्ण  
**अवधि**: 1 घंटा  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- क्षमता योजना और संसाधन मान्यकरण
- SKU चयन रणनीतियाँ
- प्री-फ्लाइट चेक और स्वचालन

#### अध्ययन संसाधन
- **📊 योजना**: [क्षमता योजना](docs/chapter-06-pre-deployment/capacity-planning.md) - संसाधन मान्यकरण
- **💰 चयन**: [SKU चयन](docs/chapter-06-pre-deployment/sku-selection.md) - लागत-कुशल विकल्प
- **✅ सत्यापन**: [प्री-फ्लाइट चेक](docs/chapter-06-pre-deployment/preflight-checks.md) - स्वचालित स्क्रिप्ट्स

#### व्यावहारिक अभ्यास
- क्षमता मान्यकरण स्क्रिप्ट्स चलाएँ
- लागत के लिए SKU चयन को अनुकूलित करें
- स्वचालित पूर्व-तैनाती जांच लागू करें

**💡 अध्याय परिणाम**: निष्पादन से पहले तैनाती को मान्य और अनुकूलित करें

---

### 🚨 अध्याय 7: समस्या निवारण और डिबगिंग
**पूर्वापेक्षाएँ**: कोई भी तैनाती अध्याय पूर्ण  
**अवधि**: 1-1.5 घंटे  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- व्यवस्थित डिबगिंग दृष्टिकोण
- सामान्य समस्याएँ और समाधान
- AI-विशिष्ट समस्या निवारण

#### अध्ययन संसाधन
- **🔧 सामान्य समस्याएँ**: [सामान्य समस्याएँ](docs/chapter-07-troubleshooting/common-issues.md) - FAQ और समाधान
- **🕵️ डिबगिंग**: [डिबगिंग गाइड](docs/chapter-07-troubleshooting/debugging.md) - चरण-दर-चरण रणनीतियाँ
- **🤖 AI समस्याएँ**: [AI-विशिष्ट समस्या निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI सेवा समस्याएँ

#### व्यावहारिक अभ्यास
- तैनाती विफलताओं का निदान करें
- प्रमाणीकरण समस्याओं को हल करें
- AI सेवा कनेक्टिविटी का डिबग करें

**💡 अध्याय परिणाम**: स्वतंत्र रूप से सामान्य तैनाती समस्याओं का निदान और समाधान करें

---

### 🏢 अध्याय 8: प्रोडक्शन और एंटरप्राइज़ पैटर्न
**पूर्वापेक्षाएँ**: अध्याय 1-4 पूर्ण  
**अवधि**: 2-3 घंटे  
**जटिलता**: ⭐⭐⭐⭐

#### आप क्या सीखेंगे
- प्रोडक्शन तैनाती रणनीतियाँ
- एंटरप्राइज़ सुरक्षा पैटर्न
- मॉनिटरिंग और लागत अनुकूलन

#### अध्ययन संसाधन
- **🏭 प्रोडक्शन**: [प्रोडक्शन AI सर्वोत्तम अभ्यास](docs/chapter-08-production/production-ai-practices.md) - एंटरप्राइज़ पैटर्न
- **📝 उदाहरण**: [माइक्रोसर्विसेज उदाहरण](../../examples/microservices) - जटिल आर्किटेक्चर
- **📊 मॉनिटरिंग**: [Application Insights एकीकरण](docs/chapter-06-pre-deployment/application-insights.md) - मॉनिटरिंग

#### व्यावहारिक अभ्यास
- एंटरप्राइज़ सुरक्षा पैटर्न लागू करें
- व्यापक मॉनिटरिंग सेटअप करें
- उचित शासन के साथ प्रोडक्शन में तैनात करें

**💡 अध्याय परिणाम**: पूर्ण प्रोडक्शन क्षमताओं के साथ एंटरप्राइज़-तैयार एप्लिकेशन तैनात करें

---

## 🎓 वर्कशॉप अवलोकन: हैंड्स-ऑन सीखने का अनुभव

> **⚠️ वर्कशॉप स्थिति: सक्रिय विकास**  
> वर्कशॉप सामग्री वर्तमान में विकसित और परिष्कृत की जा रही हैं। कोर मॉड्यूल कार्यात्मक हैं, लेकिन कुछ उन्नत अनुभाग अधूरे हैं। हम सभी सामग्री को पूरा करने पर सक्रिय रूप से काम कर रहे हैं। [प्रगति ट्रैक करें →](workshop/README.md)

### इंटरएक्टिव वर्कशॉप सामग्री
**ब्राउज़र-आधारित उपकरणों और मार्गदर्शित अभ्यासों के साथ व्यापक हैंड्स-ऑन सीखना**

हमारी वर्कशॉप सामग्री ऊपर दिए गए अध्याय-आधारित पाठ्यक्रम को पूरक करते हुए एक संरचित, इंटरएक्टिव सीखने का अनुभव प्रदान करती हैं। वर्कशॉप स्व-गति से सीखने और प्रशिक्षक-नेतृत्व वाले सत्रों दोनों के लिए डिज़ाइन की गई है।

#### 🛠️ वर्कशॉप सुविधाएँ
- **ब्राउज़र-आधारित इंटरफ़ेस**: खोज, कॉपी और थीम सुविधाओं के साथ पूर्ण MkDocs-संचालित वर्कशॉप
- **GitHub Codespaces एकीकरण**: एक-क्लिक विकास पर्यावरण सेटअप
- **संरचित सीखने का मार्ग**: 8-मॉड्यूल मार्गदर्शित अभ्यास (कुल 3-4 घंटे)
- **प्रगतिशील कार्यप्रणाली**: परिचय → चयन → मान्यकरण → विखंडन → कॉन्फ़िगरेशन → अनुकूलन → टियरडाउन → समापन
- **इंटरएक्टिव DevContainer वातावरण**: पूर्व-कॉन्फ़िगर किए गए उपकरण और निर्भरताएँ

#### 📚 वर्कशॉप मॉड्यूल संरचना
वर्कशॉप एक **8-मॉड्यूल प्रगतिशील कार्यप्रणाली** का पालन करती है जो आपको खोज से तैनाती में माहिर बनने तक ले जाती है:

| मॉड्यूल | विषय | आप क्या करेंगे | अवधि |
|--------|-------|----------------|----------|
| **0. परिचय** | वर्कशॉप अवलोकन | सीखने के उद्देश्य, पूर्वापेक्षाएँ, और वर्कशॉप संरचना समझें | 15 मिनट |
| **1. चयन** | टेम्पलेट खोज | AZD टेम्पलेट्स का अन्वेषण करें और अपने परिदृश्य के लिए सही AI टेम्पलेट चुनें | 20 मिनट |
| **2. सत्यापन** | तैनाती और सत्यापन | `azd up` के साथ टेम्पलेट तैनात करें और सत्यापित करें कि इन्फ्रास्ट्रक्चर काम कर रहा है | 30 मिनट |
| **3. विघटन** | संरचना समझें | टेम्पलेट आर्किटेक्चर, Bicep फ़ाइलों, और कोड संगठन का पता लगाने के लिए GitHub Copilot का उपयोग करें | 30 मिनट |
| **4. कॉन्फ़िगरेशन** | azure.yaml गहरा अध्ययन | `azure.yaml` कॉन्फ़िगरेशन, लाइफ़साइकल हुक्स, और पर्यावरण चर में निपुण हों | 30 मिनट |
| **5. अनुकूलन** | इसे अपना बनाएं | AI Search, ट्रेसिंग, मूल्यांकन सक्षम करें, और अपने परिदृश्य के लिए अनुकूलित करें | 45 मिनट |
| **6. टियरडाउन** | साफ़ करना | `azd down --purge` के साथ संसाधनों को सुरक्षित रूप से निपटाएँ | 15 मिनट |
| **7. समापन** | अगले कदम | उपलब्धियों, प्रमुख अवधारणाओं की समीक्षा करें, और अपनी सीखने की यात्रा जारी रखें | 15 मिनट |

**Workshop Flow:**
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
- **प्रोडक्शन AI एप्लिकेशन तैनात करें**: Microsoft Foundry सेवाओं के साथ AZD का उपयोग करें
- **मल्टी-एजेंट आर्किटेक्चर में निपुण हों**: समन्वित AI एजेंट समाधानों को लागू करें
- **सुरक्षा सर्वोत्तम प्रथाएँ लागू करें**: प्रमाणीकरण और एक्सेस कंट्रोल कॉन्फ़िगर करें
- **स्केल के लिए अनुकूलित करें**: लागत-कुशल, प्रदर्शन-उन्मुख तैनाती डिजाइन करें
- **तैनाती समस्या निवारण**: सामान्य समस्याओं को स्वतंत्र रूप से हल करें

#### 📖 वर्कशॉप संसाधन
- **🎥 इंटरएक्टिव गाइड**: [वर्कशॉप सामग्री](workshop/README.md) - ब्राउज़र-आधारित सीखने का वातावरण
- **📋 मॉड्यूल-दर-मॉड्यूल निर्देश**:
  - [0. परिचय](workshop/docs/instructions/0-Introduction.md) - वर्कशॉप अवलोकन और उद्देश्य
  - [1. चयन](workshop/docs/instructions/1-Select-AI-Template.md) - AI टेम्पलेट्स खोजें और चुनें
  - [2. सत्यापन](workshop/docs/instructions/2-Validate-AI-Template.md) - टेम्पलेट्स तैनात और सत्यापित करें
  - [3. विघटन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - टेम्पलेट आर्किटेक्चर का अन्वेषण करें
  - [4. कॉन्फ़िगरेशन](workshop/docs/instructions/4-Configure-AI-Template.md) - `azure.yaml` में निपुण हों
  - [5. अनुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) - अपने परिदृश्य के लिए अनुकूलित करें
  - [6. टियरडाउन](workshop/docs/instructions/6-Teardown-Infrastructure.md) - संसाधनों को साफ़ करें
  - [7. समापन](workshop/docs/instructions/7-Wrap-up.md) - समीक्षा और अगले कदम
- **🛠️ AI वर्कशॉप लैब**: [AI वर्कशॉप लैब](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-केंद्रित अभ्यास
- **💡 त्वरित शुरूआत**: [वर्कशॉप सेटअप गाइड](workshop/README.md#quick-start) - पर्यावरण कॉन्फ़िगरेशन

**उपयुक्त**: कॉर्पोरेट प्रशिक्षण, विश्वविद्यालय पाठ्यक्रम, स्व-गति सीखना, और डेवलपर बूटकैम्प्स।

---

## 📖 गहन अध्ययन: AZD क्षमताएँ

बुनियादी बातों से परे, AZD प्रोडक्शन तैनातियों के लिए शक्तिशाली सुविधाएँ प्रदान करता है:

- **टेम्पलेट-आधारित तैनाती** - सामान्य एप्लिकेशन पैटर्न के लिए पूर्व-निर्मित टेम्पलेट्स का उपयोग करें
- **इन्फ्रास्ट्रक्चर ऐज़ कोड** - Bicep या Terraform का उपयोग करके Azure संसाधनों का प्रबंधन करें  
- **एकीकृत वर्कफ़्लो** - एप्लिकेशन को सहजतापूर्वक प्रोविजन, तैनात, और मॉनिटर करें
- **डेवलपर-फ्रेंडली** - डेवलपर उत्पादकता और अनुभव के लिए अनुकूलित

### **AZD + Microsoft Foundry: AI तैनातियों के लिए उत्तम**

**AI समाधान के लिए AZD क्यों?** AZD उन शीर्ष चुनौतियों को संबोधित करता है जिनका सामना AI डेवलपर्स करते हैं:

- **AI-रेडी टेम्पलेट्स** - Microsoft Foundry Models, Azure AI Services, और ML वर्कलोड्स के लिए पूर्व-कॉन्फ़िगर किए गए टेम्पलेट्स
- **सुरक्षित AI तैनाती** - AI सेवाओं, API कुंजियों, और मॉडल एंडपॉइंट्स के लिए बिल्ट-इन सुरक्षा पैटर्न  
- **प्रोडक्शन AI पैटर्न** - स्केलेबल, लागत-कुशल AI एप्लिकेशन तैनातियों के लिए सर्वोत्तम प्रथाएँ
- **एंड-टू-एंड AI वर्कफ़्लो** - मॉडल विकास से लेकर प्रोडक्शन तैनाती तक सही मॉनिटरिंग के साथ
- **लागत अनुकूलन** - AI वर्कलोड्स के लिए स्मार्ट संसाधन आवंटन और स्केलिंग रणनीतियाँ
- **Microsoft Foundry एकीकरण** - Microsoft Foundry मॉडल कैटलॉग और एंडपॉइंट्स के साथ सहज कनेक्शन

---

## 🎯 टेम्पलेट्स और उदाहरण पुस्तकालय

### प्रमुख: Microsoft Foundry टेम्पलेट्स
**यदि आप AI एप्लिकेशन तैनात कर रहे हैं तो यहाँ शुरू करें!**

> **ध्यान दें:** ये टेम्पलेट्स विभिन्न AI पैटर्न दिखाते हैं। कुछ बाहरी Azure नमूने हैं, अन्य स्थानीय कार्यान्वयन हैं।

| टेम्पलेट | अध्याय | जटिलता | सेवाएँ | प्रकार |
|----------|---------|------------|----------|------|
| [**AI चैट के साथ शुरू करें**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | बाहरी |
| [**AI एजेंट्स के साथ शुरू करें**](https://github.com/Azure-Samples/get-started-with-ai-agents) | अध्याय 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| बाहरी |
| [**Azure Search + OpenAI डेमो**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | बाहरी |
| [**OpenAI चैट ऐप क्विकस्टार्ट**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | बाहरी |
| [**एजेंट OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | बाहरी |
| [**Contoso चैट RAG**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | बाहरी |
| [**रिटेल मल्टी-एजेंट समाधान**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **स्थानीय** |

### प्रमुख: पूर्ण सीखने के परिदृश्य
**लर्निंग अध्यायों के अनुरूप प्रोडक्शन-तैयार एप्लिकेशन टेम्पलेट्स**

| टेम्पलेट | सीखने का अध्याय | जटिलता | प्रमुख सीख |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | बुनियादी AI तैनाती पैटर्न |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | Azure AI Search के साथ RAG कार्यान्वयन |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | अध्याय 4 | ⭐⭐ | Document Intelligence एकीकरण |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | एजेंट फ्रेमवर्क और फ़ंक्शन कॉलिंग |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐ | एंटरप्राइज़ AI ऑर्केस्ट्रेशन |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | ग्राहक और इन्वेंटरी एजेंट्स के साथ मल्टी-एजेंट आर्किटेक्चर |

### उदाहरण प्रकार द्वारा सीखना

> **📌 स्थानीय बनाम बाहरी उदाहरण:**  
> **स्थानीय उदाहरण** (इस रिपो में) = तुरंत उपयोग के लिए तैयार  
> **बाहरी उदाहरण** (Azure Samples) = लिंक्ड रिपोज़िटरीज़ से क्लोन करें

#### स्थानीय उदाहरण (तुरंत उपयोग के लिए)
- [**रिटेल मल्टी-एजेंट समाधान**](examples/retail-scenario.md) - पूर्ण प्रोडक्शन-तैयार कार्यान्वयन ARM टेम्पलेट्स के साथ
  - मल्टी-एजेंट आर्किटेक्चर (ग्राहक + इन्वेंटरी एजेंट्स)
  - व्यापक मॉनिटरिंग और मूल्यांकन
  - ARM टेम्पलेट के माध्यम से एक-क्लिक तैनाती

#### स्थानीय उदाहरण - कंटेनर एप्लिकेशन (अध्याय 2-5)
**इस रिपॉजिटरी में व्यापक कंटेनर तैनाती उदाहरण:**
- [**कंटेनर ऐप उदाहरण**](examples/container-app/README.md) - कंटेनरयुक्त तैनाती के लिए पूर्ण मार्गदर्शिका
  - [सरल Flask API](../../examples/container-app/simple-flask-api) - स्केल-टू-जीरो के साथ बुनियादी REST API
  - [माइक्रोसर्विस आर्किटेक्चर](../../examples/container-app/microservices) - प्रोडक्शन-तैयार मल्टी-सर्विस तैनाती
  - त्वरित आरम्भ, प्रोडक्शन, और उन्नत तैनाती पैटर्न
  - निगरानी, सुरक्षा, और लागत अनुकूलन मार्गदर्शन

#### बाहरी उदाहरण - सरल अनुप्रयोग (अध्याय 1-2)
**शुरू करने के लिए इन Azure Samples रिपॉज़िटरीज़ को क्लोन करें:**
- [सरल वेब ऐप - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - मूल तैनाती पैटर्न
- [स्थिर वेबसाइट - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - स्थिर सामग्री तैनाती
- [कंटेनर ऐप - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API तैनाती

#### बाहरी उदाहरण - डेटाबेस एकीकरण (अध्याय 3-4)  
- [डेटाबेस ऐप - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - डेटाबेस कनेक्टिविटी पैटर्न
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - सर्वरलेस डेटा वर्कफ़्लो

#### बाहरी उदाहरण - उन्नत पैटर्न (अध्याय 4-8)
- [Java माइक्रोसर्विसेज](https://github.com/Azure-Samples/java-microservices-aca-lab) - मल्टी-सर्विस आर्किटेक्चर
- [कंटेनर ऐप्स जॉब्स](https://github.com/Azure-Samples/container-apps-jobs) - पृष्ठभूमि प्रोसेसिंग  
- [एंटरप्राइज़ ML पाइपलाइन](https://github.com/Azure-Samples/mlops-v2) - प्रोडक्शन-तैयार ML पैटर्न

### बाहरी टेम्पलेट संग्रह
- [**ऑफिशियल AZD टेम्पलेट गैलरी**](https://azure.github.io/awesome-azd/) - आधिकारिक और समुदाय टेम्पलेट्स का क्यूरेट किया गया संग्रह
- [**Azure डेवलपर CLI टेम्पलेट्स**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn टेम्पलेट दस्तावेज़ीकरण
- [**उदाहरण निर्देशिका**](examples/README.md) - स्थानीय शिक्षण उदाहरण विस्तृत व्याख्याओं के साथ

---

## 📚 सीखने के संसाधन और संदर्भ

### त्वरित संदर्भ
- [**कमांड चीट शीट**](resources/cheat-sheet.md) - प्रत्येक अध्याय के अनुसार व्यवस्थित आवश्यक azd कमांड
- [**शब्दावली**](resources/glossary.md) - Azure और azd शब्दावली  
- [**अक्सर पूछे जाने वाले प्रश्न**](resources/faq.md) - लर्निंग अध्याय के अनुसार व्यवस्थित सामान्य प्रश्न
- [**अध्ययन मार्गदर्शिका**](resources/study-guide.md) - व्यापक व्यावहारिक अभ्यास

### व्यावहारिक कार्यशालाएँ
- [**AI वर्कशॉप लैब**](docs/chapter-02-ai-development/ai-workshop-lab.md) - अपने AI समाधान को AZD-तैनात योग्य बनाएं (2-3 घंटे)
- [**इंटरएक्टिव वर्कशॉप**](workshop/README.md) - MkDocs और GitHub Codespaces के साथ 8-मॉड्यूल गाइडेड अभ्यास
  - क्रम: परिचय → चयन → सत्यापन → विघटन → कॉन्फ़िगरेशन → अनुकूलन → रिसोर्स हटाना → समापन

### बाहरी शिक्षण संसाधन
- Azure Developer CLI Documentation: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure Architecture Center: https://learn.microsoft.com/en-us/azure/architecture/
- Azure Pricing Calculator: https://azure.microsoft.com/pricing/calculator/
- Azure Status: https://status.azure.com/

### आपके संपादक के लिए AI एजेंट कौशल
- [**skills.sh पर Microsoft Azure Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, तैनाती, डायग्नोस्टिक्स, लागत अनुकूलन, और अन्य के लिए 37 खुले एजेंट स्किल्स। इन्हें GitHub Copilot, Cursor, Claude Code, या किसी भी समर्थित एजेंट में इंस्टॉल करें:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 त्वरित समस्या निवारण मार्गदर्शिका

**नए उपयोगकर्ताओं को आने वाली सामान्य समस्याएँ और तात्कालिक समाधान:**

<details>
<summary><strong>❌ "azd: कमांड नहीं मिला"</strong></summary>

```bash
# सबसे पहले AZD इंस्टॉल करें
# विंडोज़ (पावरशेल):
winget install microsoft.azd

# मैकओएस:
brew tap azure/azd && brew install azd

# लिनक्स:
curl -fsSL https://aka.ms/install-azd.sh | bash

# इंस्टॉलेशन सत्यापित करें
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# उपलब्ध सब्सक्रिप्शन सूचीबद्ध करें
az account list --output table

# डिफ़ॉल्ट सब्सक्रिप्शन सेट करें
az account set --subscription "<subscription-id-or-name>"

# AZD वातावरण के लिए सेट करें
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# सत्यापित करें
az account show
```
</details>

<details>
<summary><strong>❌ "अपर्याप्त क्वोटा" या "क्वोटा पार हो गया"</strong></summary>

```bash
# किसी अलग Azure क्षेत्र आजमाएँ
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
<summary><strong>❌ "azd up" आधे रास्ते में विफल रहता है</strong></summary>

```bash
# विकल्प 1: साफ़ करें और पुनः प्रयास करें
azd down --force --purge
azd up

# विकल्प 2: केवल बुनियादी ढांचे को ठीक करें
azd provision

# विकल्प 3: विस्तृत स्थिति की जाँच करें
azd show

# विकल्प 4: Azure Monitor में लॉग्स की जाँच करें
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "प्रमाणीकरण विफल" या "टोकन की समयसीमा समाप्त"</strong></summary>

```bash
# AZD के लिए पुनः प्रमाणीकरण करें
azd auth logout
azd auth login

# वैकल्पिक: यदि आप az कमांड चला रहे हैं तो Azure CLI को भी ताज़ा करें
az logout
az login

# प्रमाणीकरण सत्यापित करें
az account show
```
</details>

<details>
<summary><strong>❌ "संसाधन पहले से मौजूद है" या नाम संघर्ष</strong></summary>

```bash
# AZD अद्वितीय नाम बनाता है, लेकिन अगर टकराव हो:
azd down --force --purge

# फिर नए वातावरण के साथ पुनः प्रयास करें
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ टेम्पलेट तैनाती बहुत लंबी हो रही है</strong></summary>

**सामान्य प्रतीक्षा समय:**
- सरल वेब ऐप: 5-10 मिनट
- डेटाबेस वाले ऐप: 10-15 मिनट
- AI अनुप्रयोग: 15-25 मिनट (OpenAI प्रोविजनिंग धीमी है)

```bash
# प्रगति की जाँच करें
azd show

# यदि 30 मिनट से अधिक फंस गए हों तो Azure पोर्टल देखें:
azd monitor --overview
# असफल तैनातियों की जाँच करें
```
</details>

<details>
<summary><strong>❌ "अनुमति अस्वीकृत" या "प्रतिबंधित"</strong></summary>

```bash
# अपनी Azure भूमिका जांचें
az role assignment list --assignee $(az account show --query user.name -o tsv)

# आपको कम से कम "Contributor" भूमिका की आवश्यकता है
# अपने Azure व्यवस्थापक से निम्न अनुमति देने के लिए कहें:
# - Contributor (संसाधनों के लिए)
# - User Access Administrator (भूमिका आवंटन के लिए)
```
</details>

<details>
<summary><strong>❌ तैनात किए गए एप्लिकेशन का URL नहीं मिल रहा है</strong></summary>

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
- **डीबगिंग गाइड:** [चरण-दर-चरण डीबगिंग](docs/chapter-07-troubleshooting/debugging.md)
- **मदद प्राप्त करें:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 पाठ्यक्रम पूरा करना और प्रमाणन

### प्रगति ट्रैकिंग
प्रत्येक अध्याय के माध्यम से अपनी सीखने की प्रगति ट्रैक करें:

- [ ] **अध्याय 1**: आधार और त्वरित प्रारंभ ✅
- [ ] **अध्याय 2**: AI-प्रथम विकास ✅  
- [ ] **अध्याय 3**: कॉन्फ़िगरेशन और प्रमाणीकरण ✅
- [ ] **अध्याय 4**: इन्फ्रास्ट्रक्चर ऐज़ कोड और तैनाती ✅
- [ ] **अध्याय 5**: मल्टी-एजेंट AI समाधान ✅
- [ ] **अध्याय 6**: प्री-डिप्लॉयमेंट सत्यापन और योजना ✅
- [ ] **अध्याय 7**: समस्या निवारण और डीबगिंग ✅
- [ ] **अध्याय 8**: प्रोडक्शन और एंटरप्राइज़ पैटर्न ✅

### सीखने का सत्यापन
प्रत्येक अध्याय पूरा करने के बाद, अपना ज्ञान निम्न द्वारा सत्यापित करें:
1. **व्यावहारिक अभ्यास**: अध्याय का व्यावहारिक तैनाती पूरा करें
2. **ज्ञान जांच**: अपने अध्याय के FAQ अनुभाग की समीक्षा करें
3. **समुदाय चर्चा**: अपना अनुभव Azure Discord में साझा करें
4. **अगला अध्याय**: अगले जटिलता स्तर पर जाएँ

### पाठ्यक्रम पूरा करने के लाभ
सभी अध्याय पूर्ण करने पर, आपके पास होगा:
- **प्रोडक्शन अनुभव**: वास्तविक AI अनुप्रयोग Azure पर तैनात किए
- **पेशेवर कौशल**: एंटरप्राइज़-तैयार तैनाती क्षमताएँ  
- **समुदाय मान्यता**: Azure डेवलपर समुदाय के सक्रिय सदस्य
- **कैरियर उन्नति**: मांग में AZD और AI तैनाती विशेषज्ञता

---

## 🤝 समुदाय और समर्थन

### मदद और समर्थन प्राप्त करें
- **तकनीकी समस्याएँ**: [बग रिपोर्ट करें और फीचर अनुरोध करें](https://github.com/microsoft/azd-for-beginners/issues)
- **लर्निंग प्रश्न**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry डिस्कॉर्ड](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-विशिष्ट सहायता**: में शामिल हों [![Microsoft Foundry डिस्कॉर्ड](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **दस्तावेज़ीकरण**: [आधिकारिक Azure Developer CLI दस्तावेज़ीकरण](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord से समुदाय की जानकारी

**हालिया सर्वे परिणाम #Azure चैनल से:**
- डेवलपर्स के **45%** चाहते हैं कि वे AI वर्कलोड के लिए AZD का उपयोग करें
- **मुख्य चुनौतियाँ**: मल्टी-सर्विस तैनाती, क्रेडेंशियल प्रबंधन, उत्पादन-तैयारी  
- **सबसे अधिक अनुरोध**: AI-विशिष्ट टेम्पलेट्स, समस्या निवारण मार्गदर्शिकाएँ, सर्वोत्तम प्रथाएँ

**हमारे समुदाय में शामिल हों ताकि आप:**
- अपना AZD + AI अनुभव साझा करें और मदद प्राप्त करें
- नए AI टेम्पलेट्स के शुरुआती पूर्वावलोकन तक पहुँचें
- AI तैनाती सर्वोत्तम प्रथाओं में योगदान दें
- भविष्य के AI + AZD फीचर विकास को प्रभावित करें

### पाठ्यक्रम में योगदान
हम योगदान का स्वागत करते हैं! विवरण के लिए कृपया हमारा [योगदान मार्गदर्शिका](CONTRIBUTING.md) पढ़ें:
- **सामग्री सुधार**: मौजूदा अध्यायों और उदाहरणों को बेहतर बनाएं
- **नए उदाहरण**: वास्तविक दुनिया के परिदृश्य और टेम्पलेट जोड़ें  
- **अनुवाद**: बहुभाषी समर्थन बनाए रखने में मदद करें
- **बग रिपोर्ट्स**: सटीकता और स्पष्टता में सुधार करें
- **समुदाय मानक**: हमारे समावेशी समुदाय दिशानिर्देशों का पालन करें

---

## 📄 पाठ्यक्रम जानकारी

### लाइसेंस
यह प्रोजेक्ट MIT लाइसेंस के अंतर्गत लाइसेंस्ड है - विवरण के लिए [LICENSE](../../LICENSE) फ़ाइल देखें।

### संबंधित Microsoft लर्निंग संसाधन

हमारी टीम अन्य व्यापक शिक्षण पाठ्यक्रम बनाती है:

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
[![AI एजेंट्स शुरुआती के लिए](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### जनरेटिव AI सीरीज़
[![जनरेटिव AI शुरुआती के लिए](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![जनरेटिव AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![जनरेटिव AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![जनरेटिव एआई (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### मुख्य शिक्षण
[![शुरुआती लोगों के लिए ML](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![शुरुआती लोगों के लिए डेटा साइंस](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![शुरुआती लोगों के लिए एआई](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![शुरुआती लोगों के लिए साइबर सुरक्षा](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![शुरुआती लोगों के लिए वेब विकास](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![शुरुआती लोगों के लिए IoT](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![शुरुआती लोगों के लिए XR विकास](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot श्रृंखला
[![AI-पेयर प्रोग्रामिंग के लिए Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET के लिए Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot एडवेंचर](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ पाठ्यक्रम नेविगेशन

**🚀 सीखना शुरू करने के लिए तैयार?**

**शुरुआती**: शुरू करें [अध्याय 1: बुनियादी और त्वरित आरंभ](#-chapter-1-foundation--quick-start)  
**AI डेवलपर्स**: जाएँ [अध्याय 2: AI-प्रथम विकास](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**अनुभवी डेवलपर्स**: शुरू करें [अध्याय 3: कॉन्फ़िगरेशन और प्रमाणीकरण](#️-chapter-3-configuration--authentication)

**अगले कदम**: [अध्याय 1 शुरू करें - AZD मूल बातें](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->