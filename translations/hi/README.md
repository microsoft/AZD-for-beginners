# शरुआती लोगों के लिए AZD: एक संरचित सीखने की यात्रा

![AZD-for-beginners](../../translated_images/hi/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### स्वचालित अनुवाद (हमेशा अपडेटेड)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](./README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **स्थानीय रूप से क्लोन करना पसंद करते हैं?**
>
> इस रिपोजिटरी में 50+ भाषा अनुवाद शामिल हैं जो डाउनलोड साइज़ को काफी बढ़ा देते हैं। अनुवादों के बिना क्लोन करने के लिए, sparse checkout का उपयोग करें:
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
> इससे आपको कोर्स पूरा करने के लिए सब कुछ मिलेगा, वह भी बहुत तेज़ डाउनलोड के साथ।
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 आज azd में नया क्या है

Azure Developer CLI पारंपरिक वेब ऐप्स और एपीआई से आगे बढ़ चुका है। आज, azd Azure पर **किसी भी** एप्लिकेशन को तैनात करने का एकमात्र उपकरण है — जिसमें AI-संचालित एप्लिकेशन और बुद्धिमान एजेंट भी शामिल हैं।

इसका मतलब आपके लिए यह है:

- **AI एजेंट अब पहली श्रेणी के azd वर्कलोड हैं।** आप AI एजेंट प्रोजेक्ट्स को वही `azd init` → `azd up` वर्कफ़्लो इस्तेमाल करके शुरू, तैनात और प्रबंधित कर सकते हैं, जिसे आप पहले से जानते हैं।
- **Microsoft Foundry एकीकरण** मॉडल तैनाती, एजेंट होस्टिंग, और AI सेवा कॉन्फ़िगरेशन को सीधे azd टेम्पलेट पारिस्थितिकी तंत्र में लाता है।
- **कोर वर्कफ़्लो में कोई बदलाव नहीं हुआ है।** चाहे आप एक todo ऐप, एक माइक्रोसर्विस, या एक मल्टी-एजेंट AI समाधान तैनात कर रहे हों, कमांड समान हैं।

यदि आपने पहले azd का उपयोग किया है, तो AI समर्थन एक प्राकृतिक विस्तार है — कोई अलग उपकरण या उन्नत ट्रैक नहीं। यदि आप ताजा शुरुआत कर रहे हैं, तो आप एक ऐसा वर्कफ़्लो सीखेंगे जो सब के लिए काम करता है।

---

## 🚀 Azure Developer CLI (azd) क्या है?

**Azure Developer CLI (azd)** एक डेवलपर-अनुकूल कमांड-लाइन टूल है जो Azure पर एप्लिकेशन तैनात करना सरल बनाता है। Azure संसाधनों के दर्जनों को मैन्युअली बनाने और जोड़ने की बजाय, आप एक ही कमांड से पूरे एप्लिकेशन तैनात कर सकते हैं।

### `azd up` का जादू

```bash
# यह एकल कमांड सब कुछ कर देता है:
# ✅ सभी Azure संसाधन बनाता है
# ✅ नेटवर्किंग और सुरक्षा कॉन्फ़िगर करता है
# ✅ आपके एप्लिकेशन के कोड का निर्माण करता है
# ✅ Azure पर तैनात करता है
# ✅ आपको एक कार्यशील URL देता है
azd up
```

**बस इतना ही!** कोई Azure Portal पर क्लिकिंग नहीं, कोई जटिल ARM टेम्पलेट पहले सीखने की जरूरत नहीं, कोई मैन्युअल कॉन्फ़िगरेशन नहीं — बस Azure पर काम करने वाले एप्लिकेशन।

---

## ❓ Azure Developer CLI बनाम Azure CLI: क्या अंतर है?

यह सबसे आम सवाल है जो शुरुआती लोग पूछते हैं। यहाँ सरल जवाब है:

| फीचर | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **उद्देश्य** | व्यक्तिगत Azure संसाधनों का प्रबंधन | पूरे एप्लिकेशन तैनात करना |
| **माइंडसेट** | इन्फ्रास्ट्रक्चर-केंद्रित | एप्लिकेशन-केंद्रित |
| **उदाहरण** | `az webapp create --name myapp...` | `azd up` |
| **सीखने का स्तर** | Azure सेवाओं को जानना आवश्यक | बस अपनी ऐप को जानना आवश्यक |
| **सर्वोत्तम उपयोग** | DevOps, इन्फ्रास्ट्रक्चर | डेवलपर्स, प्रोटोटाइपिंग |

### सरल उपमा

- **Azure CLI** ऐसा है जैसे आपके पास घर बनाने के सारे उपकरण हों — हथौड़े, आरी, कील। आप कुछ भी बना सकते हैं, लेकिन निर्माण को जानना जरूरी है।
- **Azure Developer CLI** ऐसा है जैसे आपने एक ठेकेदार को रखा हो — आप बताते हैं कि क्या चाहिए, और वे निर्माण संभाल लेते हैं।

### कब किसका उपयोग करें

| परिदृश्य | इसका उपयोग करें |
|----------|----------|
| "मैं अपनी वेब ऐप जल्दी तैनात करना चाहता हूँ" | `azd up` |
| "मुझे केवल एक स्टोरेज अकाउंट बनाना है" | `az storage account create` |
| "मैं एक पूरा AI एप्लिकेशन बना रहा हूँ" | `azd init --template azure-search-openai-demo` |
| "मुझे किसी विशेष Azure संसाधन को डिबग करना है" | `az resource show` |
| "मैं मिनटों में उत्पादन-तैयार तैनाती चाहता हूँ" | `azd up --environment production` |

### वे साथ काम करते हैं!

AZD अंदर से Azure CLI का उपयोग करता है। आप दोनों का उपयोग कर सकते हैं:
```bash
# AZD के साथ अपने ऐप को तैनात करें
azd up

# फिर Azure CLI का उपयोग करके विशिष्ट संसाधनों को अनुकूलित करें
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD में टेम्पलेट खोजें

शून्य से शुरू न करें! **Awesome AZD** समुदाय का संग्रह है, तैयार-तैनाती के लिए टेम्पलेट्स का:

| रिसोर्स | विवरण |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | 200+ टेम्पलेट्स ब्राउज़ करें और एक क्लिक में तैनाती करें |
| 🔗 [**टेम्पलेट सबमिट करें**](https://github.com/Azure/awesome-azd/issues) | अपना टेम्पलेट समुदाय को दें |
| 🔗 [**GitHub रिपोजिटरी**](https://github.com/Azure/awesome-azd) | स्टार करें और स्रोत जांचें |

### Awesome AZD से लोकप्रिय AI टेम्पलेट्स

```bash
# RAG चैट Microsoft Foundry मॉडल्स + एआई खोज के साथ
azd init --template azure-search-openai-demo

# त्वरित एआई चैट एप्लिकेशन
azd init --template openai-chat-app-quickstart

# Foundry एजेंट्स के साथ एआई एजेंट्स
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 चरणों में शुरुआत

शुरू करने से पहले, सुनिश्चित करें कि आपकी मशीन उस टेम्पलेट के अनुसार तैयार है जिसे आप तैनात करना चाहते हैं:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

यदि कोई जरूरी चेक फेल होता है, तो सबसे पहले उसे ठीक करें फिर जल्दी शुरुआत जारी रखें।

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

### चरण 2: AZD के लिए प्रामाणिकरण करें

```bash
# यदि आप इस पाठ्यक्रम में Azure CLI कमांड सीधे उपयोग करने की योजना बनाते हैं तो यह वैकल्पिक है
az login

# AZD वर्कफ़्लोज़ के लिए आवश्यक
azd auth login
```

यदि आप निश्चित नहीं हैं कि किन्हें चाहिए, तो [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup) में पूरी सेटअप प्रक्रिया का पालन करें।

### चरण 3: अपनी पहली ऐप तैनात करें

```bash
# टेम्पलेट से प्रारंभ करें
azd init --template todo-nodejs-mongo

# Azure पर तैनात करें (सब कुछ बनाता है!)
azd up
```

**🎉 बस हो गया!** आपकी ऐप अब Azure पर लाइव है।

### साफ-सफाई (मत भूलें!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 इस कोर्स का उपयोग कैसे करें

यह कोर्स **प्रगतिशील सीखने** के लिए डिजाइन किया गया है - जहां आप सहज हों वहीं से शुरू करें और ऊपर की ओर बढ़ें:

| आपका अनुभव | यहां से शुरू करें |
|-----------------|------------|
| **Azure में बिल्कुल नए** | [अध्याय 1: आधार](#-chapter-1-foundation--quick-start) |
| **Azure जानते हैं, AZD नए हैं** | [अध्याय 1: आधार](#-chapter-1-foundation--quick-start) |
| **AI ऐप्स तैनात करना चाहते हैं** | [अध्याय 2: AI-प्रथम विकास](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **हैंड्स-ऑन प्रैक्टिस चाहते हैं** | [🎓 इंटरैक्टिव कार्यशाला](workshop/README.md) - 3-4 घंटे का निर्देशित लैब |
| **उत्पादन पैटर्न चाहिए** | [अध्याय 8: उत्पादन और उद्यम](#-chapter-8-production--enterprise-patterns) |

### त्वरित सेटअप

1. **इस रिपोजिटरी को फोर्क करें**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **इसे क्लोन करें**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **मदद लें**: [Azure Discord समुदाय](https://discord.com/invite/ByRwuEEgH4)

> **स्थानीय रूप से क्लोन करना पसंद करते हैं?**

> इस रिपोजिटरी में 50+ भाषा अनुवाद शामिल हैं जो डाउनलोड साइज़ को काफी बढ़ा देते हैं। अनुवादों के बिना क्लोन करने के लिए sparse checkout का उपयोग करें:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> इससे आपको कोर्स पूरा करने के लिए सब कुछ मिलेगा, वह भी बहुत तेज़ डाउनलोड के साथ।

## कोर्स अवलोकन

संरचित अध्यायों के माध्यम से Azure Developer CLI (azd) में महारत हासिल करें, जो प्रगतिशील सीखने के लिए डिजाइन किए गए हैं। **माइक्रोसॉफ्ट फाउंड्री एकीकरण के साथ AI एप्लिकेशन तैनाती पर विशेष ध्यान।**

### आधुनिक डेवलपर्स के लिए यह कोर्स क्यों आवश्यक है

Microsoft Foundry Discord समुदाय की अंतर्दृष्टि के आधार पर, **45% डेवलपर्स AI वर्कलोड के लिए AZD का उपयोग करना चाहते हैं** लेकिन उन्हें निम्नलिखित चुनौतियों का सामना करना पड़ता है:
- जटिल मल्टी-सर्विस AI आर्किटेक्चर
- उत्पादन AI तैनाती सर्वश्रेष्ठ अभ्यास  
- Azure AI सेवा एकीकरण और कॉन्फ़िगरेशन
- AI वर्कलोड के लिए लागत अनुकूलन
- AI-विशिष्ट तैनाती समस्याओं का निवारण

### सीखने के उद्देश्य

इस संरचित कोर्स को पूरा करके, आप:
- **AZD के मूल बातें सीखेंगे**: कोर अवधारणाएँ, इंस्टॉलेशन, और कॉन्फ़िगरेशन
- **AI एप्लिकेशन तैनात करेंगे**: Microsoft Foundry सेवाओं के साथ AZD का उपयोग
- **Infrastructure as Code लागू करेंगे**: Bicep टेम्पलेट्स के साथ Azure संसाधन प्रबंधन
- **तैनाती समस्याओं का निवारण करेंगे**: सामान्य समस्याओं का समाधान और डिबगिंग
- **उत्पादन के लिए अनुकूलन करेंगे**: सुरक्षा, स्केलिंग, मॉनिटरिंग, और लागत प्रबंधन
- **मल्टी-एजेंट समाधान बनाएंगे**: जटिल AI वास्तुकला तैनात करना

## शुरू करने से पहले: खाते, पहुंच, और पूर्वधारणाएँ

अध्याय 1 शुरू करने से पहले, सुनिश्चित करें कि आपके पास निम्नलिखित मौजूद हैं। इस गाइड में बाद के इंस्टॉलेशन चरण इन बुनियादी बातों के पूर्ण होने की धारणा करते हैं।
- **एक Azure सब्सक्रिप्शन**: आप कार्यस्थल से मौजूदा सब्सक्रिप्शन या अपने खुद के खाते का उपयोग कर सकते हैं, या शुरुआत के लिए [फ्री ट्रायल](https://aka.ms/azurefreetrial) बना सकते हैं।
- **Azure संसाधन बनाने की अनुमति**: अधिकांश अभ्यासों के लिए, आपके पास लक्षित सब्सक्रिप्शन या संसाधन समूह पर कम से कम **Contributor** एक्सेस होना चाहिए। कुछ अध्याय यह भी मान सकते हैं कि आप संसाधन समूह, प्रबंधित पहचानें, और RBAC असाइनमेंट बना सकते हैं।
- [**एक GitHub खाता**](https://github.com): रेपो को फोर्क करने, अपनी खुद की परिवर्तनों को ट्रैक करने, और कार्यशाला के लिए GitHub Codespaces का उपयोग करने के लिए यह उपयोगी है।
- **टेम्प्लेट रनटाइम आवश्यकताएँ**: कुछ टेम्प्लेट को स्थानीय टूल्स जैसे Node.js, Python, Java, या Docker की आवश्यकता होती है। शुरुआत करने से पहले सेटअप वैलिडेटर चलाएं ताकि आप जल्दी से मिसिंग टूल पकड़ सकें।
- **मूल टर्मिनल परिचय**: आपको विशेषज्ञ होने की जरूरत नहीं है, लेकिन आप `git clone`, `azd auth login`, और `azd up` जैसे कमांड चलाने में सहज होना चाहिए।

> **एंटरप्राइज़ सब्सक्रिप्शन में काम कर रहे हैं?**  
> यदि आपका Azure वातावरण किसी व्यवस्थापक द्वारा प्रबंधित है, तो पहले से सुनिश्चित करें कि आप उस सब्सक्रिप्शन या संसाधन समूह में संसाधन तैनात कर सकते हैं जिसका आप उपयोग करने की योजना बना रहे हैं। यदि नहीं, तो शुरू करने से पहले सैंडबॉक्स सब्सक्रिप्शन या Contributor एक्सेस के लिए पूछें।

> **Azure में नए हैं?**  
> अपनी खुद की Azure ट्रायल या पे-एज़-यू-गो सब्सक्रिप्शन से https://aka.ms/azurefreetrial पर शुरुआत करें ताकि आप अभ्यासों को बिना टेनेंट-स्तर की स्वीकृति का इंतजार किए बिना शुरू से अंत तक पूरा कर सकें।

## 🗺️ कोर्स मैप: अध्याय के अनुसार त्वरित नेविगेशन

प्रत्येक अध्याय के पास सीखने के उद्देश्य, त्वरित शुरुआत, और अभ्यासों के साथ एक समर्पित README है:

| अध्याय | विषय | पाठ | अवधि | जटिलता |
|---------|-------|---------|----------|------------|
| **[अध्याय 1: नींव](docs/chapter-01-foundation/README.md)** | शुरुआत करना | [AZD बेसिक्स](docs/chapter-01-foundation/azd-basics.md) &#124; [इंस्टॉलेशन](docs/chapter-01-foundation/installation.md) &#124; [पहला प्रोजेक्ट](docs/chapter-01-foundation/first-project.md) | 30-45 मिनट | ⭐ |
| **[अध्याय 2: AI विकास](docs/chapter-02-ai-development/README.md)** | AI-प्रथम ऐप्स | [Foundry इंटीग्रेशन](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI एजेंट्स](docs/chapter-02-ai-development/agents.md) &#124; [मॉडल डिप्लॉयमेंट](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [वर्कशॉप](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 घंटे | ⭐⭐ |
| **[अध्याय 3: कॉन्फ़िगरेशन](docs/chapter-03-configuration/README.md)** | ऑथ और सुरक्षा | [कॉन्फ़िगरेशन](docs/chapter-03-configuration/configuration.md) &#124; [ऑथ और सुरक्षा](docs/chapter-03-configuration/authsecurity.md) | 45-60 मिनट | ⭐⭐ |
| **[अध्याय 4: इन्फ्रास्ट्रक्चर](docs/chapter-04-infrastructure/README.md)** | IaC और डिप्लॉयमेंट | [डिप्लॉयमेंट गाइड](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [प्रोविजनिंग](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 घंटे | ⭐⭐⭐ |
| **[अध्याय 5: मल्टी-एजेंट](docs/chapter-05-multi-agent/README.md)** | AI एजेंट समाधान | [रिटेल परिदृश्य](examples/retail-scenario.md) &#124; [समन्वय पैटर्न](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 घंटे | ⭐⭐⭐⭐ |
| **[अध्याय 6: पूर्व-परिनियोजन](docs/chapter-06-pre-deployment/README.md)** | योजना और सत्यापन | [प्रीफ्लाइट जांच](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [क्षमता योजना](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU चयन](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [एप्लिकेशन इनसाइट्स](docs/chapter-06-pre-deployment/application-insights.md) | 1 घंटा | ⭐⭐ |
| **[अध्याय 7: समस्या निवारण](docs/chapter-07-troubleshooting/README.md)** | डिबग और फिक्स | [आम समस्याएँ](docs/chapter-07-troubleshooting/common-issues.md) &#124; [डिबगिंग](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI समस्याएँ](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 घंटे | ⭐⭐ |
| **[अध्याय 8: प्रोडक्शन](docs/chapter-08-production/README.md)** | एंटरप्राइज़ पैटर्न | [प्रोडक्शन अभ्यास](docs/chapter-08-production/production-ai-practices.md) | 2-3 घंटे | ⭐⭐⭐⭐ |
| **[🎓 वर्कशॉप](workshop/README.md)** | हैंड्स-ऑन लैब | [परिचय](workshop/docs/instructions/0-Introduction.md) &#124; [चयन](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [सत्यापन](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [विखंडन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [कॉन्फ़िगरेशन](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [कस्टमाइजेशन](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [टियरडाउन](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [समापन](workshop/docs/instructions/7-Wrap-up.md) | 3-4 घंटे | ⭐⭐ |

**कुल कोर्स अवधि:** ~10-14 घंटे | **कौशल प्रगति:** शुरुआती → प्रोडक्शन-तैयार  

---

## 📚 सीखने के अध्याय

*अपने अनुभव स्तर और लक्ष्यों के आधार पर अपनी सीखने की राह चुनें*

### 🚀 अध्याय 1: नींव और त्वरित प्रारंभ
**पूर्वापेक्षाएँ**: Azure सब्सक्रिप्शन, बुनियादी कमांड लाइन ज्ञान  
**अवधि**: 30-45 मिनट  
**जटिलता**: ⭐

#### आप क्या सीखेंगे
- Azure Developer CLI की मूल बातें समझना
- अपने प्लेटफ़ॉर्म पर AZD इंस्टॉल करना
- अपनी पहली सफल डिप्लॉयमेंट

#### सीखने के संसाधन
- **🎯 यहाँ से शुरू करें**: [Azure Developer CLI क्या है?](#what-is-azure-developer-cli)
- **📖 सिद्धांत**: [AZD बेसिक्स](docs/chapter-01-foundation/azd-basics.md) - मुख्य अवधारणाएँ और शब्दावली
- **⚙️ सेटअप**: [इंस्टॉलेशन और सेटअप](docs/chapter-01-foundation/installation.md) - प्लेटफ़ॉर्म-विशिष्ट गाइड
- **🛠️ प्रायोगिक**: [आपका पहला प्रोजेक्ट](docs/chapter-01-foundation/first-project.md) - चरण-दर-चरण ट्यूटोरियल
- **📋 त्वरित संदर्भ**: [कमांड चीट शीट](resources/cheat-sheet.md)

#### व्यावहारिक अभ्यास
```bash
# त्वरित स्थापना जांच
azd version

# अपना पहला अनुप्रयोग तैनात करें
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 अध्याय परिणाम**: AZD का उपयोग करते हुए Azure पर एक सरल वेब एप्लिकेशन सफलतापूर्वक डिप्लॉय करें

**✅ सफल सत्यापन:**  
```bash
# चाप्टर 1 पूरा करने के बाद, आप सक्षम होंगे:
azd version              # इंस्टॉल की गई संस्करण दिखाए
azd init --template todo-nodejs-mongo  # परियोजना शुरू करता है
azd up                  # Azure पर तैनात करता है
azd show                # चल रही ऐप का URL प्रदर्शित करता है
# एप्लिकेशन ब्राउज़र में खुलता है और काम करता है
azd down --force --purge  # संसाधनों को साफ करता है
```
  
**📊 समय निवेश:** 30-45 मिनट  
**📈 कौशल स्तर बाद में:** बुनियादी एप्लिकेशन स्वतंत्र रूप से तैनात कर सकता है

---

### 🤖 अध्याय 2: AI-प्रथम विकास (AI डेवलपर्स के लिए अनुशंसित)
**पूर्वापेक्षाएँ**: अध्याय 1 पूरा किया हुआ  
**अवधि**: 1-2 घंटे  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- AZD के साथ Microsoft Foundry एकीकरण
- AI-सक्षम ऐप्लिकेशन डिप्लॉय करना
- AI सेवा कॉन्फ़िगरेशन समझना

#### सीखने के संसाधन
- **🎯 यहाँ से शुरू करें**: [Microsoft Foundry इंटीग्रेशन](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI एजेंट्स**: [AI एजेंट्स गाइड](docs/chapter-02-ai-development/agents.md) - AZD के साथ बुद्धिमान एजेंट तैनात करें
- **📖 पैटर्न्स**: [AI मॉडल डिप्लॉयमेंट](docs/chapter-02-ai-development/ai-model-deployment.md) - AI मॉडलों को डिप्लॉय और प्रबंधित करें
- **🛠️ वर्कशॉप**: [AI वर्कशॉप लैब](docs/chapter-02-ai-development/ai-workshop-lab.md) - अपनी AI समाधान को AZD-तैयार बनाएं
- **🎥 इंटरैक्टिव गाइड**: [वर्कशॉप सामग्री](workshop/README.md) - MkDocs के साथ ब्राउज़र-आधारित सीखना * DevContainer वातावरण
- **📋 टेम्प्लेट्स**: [Microsoft Foundry टेम्प्लेट्स](#कार्यशाला-संसाधन)
- **📝 उदाहरण**: [AZD डिप्लॉयमेंट उदाहरण](examples/README.md)

#### व्यावहारिक अभ्यास
```bash
# अपना पहला एआई एप्लिकेशन तैनात करें
azd init --template azure-search-openai-demo
azd up

# अतिरिक्त एआई टेम्प्लेट आज़माएँ
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 अध्याय परिणाम**: RAG क्षमताओं के साथ AI-सक्षम चैट एप्लिकेशन डिप्लॉय और कॉन्फ़िगर करें

**✅ सफल सत्यापन:**  
```bash
# अध्याय 2 के बाद, आपको सक्षम होना चाहिए:
azd init --template azure-search-openai-demo
azd up
# AI चैट इंटरफ़ेस का परीक्षण करें
# प्रश्न पूछें और स्रोतों के साथ AI-समर्थित उत्तर प्राप्त करें
# सत्यापित करें कि खोज एकीकरण काम करता है
azd monitor  # जांचें कि एप्लिकेशन इंसाइट्स टेलीमेट्री दिखाता है
azd down --force --purge
```
  
**📊 समय निवेश:** 1-2 घंटे  
**📈 कौशल स्तर बाद में:** उत्पादन-तैयार AI एप्लिकेशन तैनात और कॉन्फ़िगर कर सकते हैं  
**💰 लागत जागरूकता:** $80-150/महीना विकास लागत, $300-3500/महीना उत्पादन लागत समझें

#### 💰 AI डिप्लॉयमेंट के लिए लागत विचार

**विकास पर्यावरण (अनुमानित $80-150/महीना):**  
- Microsoft Foundry मॉडल (Pay-as-you-go): $0-50/महीना (टोकन उपयोग पर आधारित)  
- AI Search (बेसिक टियर): $75/महीना  
- कंटेनर ऐप्स (खपत): $0-20/महीना  
- स्टोरेज (स्टैंडर्ड): $1-5/महीना  

**उत्पादन पर्यावरण (अनुमानित $300-3,500+/महीना):**  
- Microsoft Foundry मॉडल (PTU लगातार प्रदर्शन के लिए): $3,000+/महीना या उच्च मात्रा के साथ Pay-as-you-go  
- AI Search (स्टैंडर्ड टियर): $250/महीना  
- कंटेनर ऐप्स (डेडिकेटेड): $50-100/महीना  
- एप्लिकेशन इनसाइट्स: $5-50/महीना  
- स्टोरेज (प्रीमियम): $10-50/महीना  

**💡 लागत अनुकूलन सुझाव:**  
- सीखने के लिए **फ्री टियर** Microsoft Foundry मॉडल का उपयोग करें (Azure OpenAI 50,000 टोकन/महीना शामिल)  
- सक्रिय विकास न करते समय संसाधनों को मुक्त करने के लिए `azd down` चलाएं  
- खपत-आधारित बिलिंग से शुरू करें, केवल उत्पादन के लिए PTU में अपग्रेड करें  
- डिप्लॉयमेंट से पहले लागत का अनुमान लगाने के लिए `azd provision --preview` का उपयोग करें  
- ऑटो-स्केलिंग सक्षम करें: केवल उपयोग के लिए भुगतान करें  

**लागत निगरानी:**  
```bash
# अनुमानित मासिक लागतों की जांच करें
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
- पर्यावरण कॉन्फ़िगरेशन और प्रबंधन  
- प्रमाणीकरण और सुरक्षा सर्वोत्तम अभ्यास  
- संसाधन नामकरण और संगठन  

#### सीखने के संसाधन
- **📖 कॉन्फ़िगरेशन**: [कॉन्फ़िगरेशन गाइड](docs/chapter-03-configuration/configuration.md) - पर्यावरण सेटअप  
- **🔐 सुरक्षा**: [प्रमाणीकरण पैटर्न और प्रबंधित पहचान](docs/chapter-03-configuration/authsecurity.md) - प्रमाणीकरण पैटर्न  
- **📝 उदाहरण**: [डेटाबेस ऐप्लिकेशन उदाहरण](examples/database-app/README.md) - AZD डेटाबेस उदाहरण  

#### व्यावहारिक अभ्यास
- कई पर्यावरण (dev, staging, prod) को कॉन्फ़िगर करें  
- प्रबंधित पहचान प्रमाणीकरण सेटअप करें  
- पर्यावरण-विशिष्ट कॉन्फ़िगरेशन लागू करें  

**💡 अध्याय परिणाम**: उचित प्रमाणीकरण और सुरक्षा के साथ कई पर्यावरणों का प्रबंधन करें

---

### 🏗️ अध्याय 4: इन्फ्रास्ट्रक्चर ऐज़ कोड और डिप्लॉयमेंट
**पूर्वापेक्षाएँ**: अध्याय 1-3 पूरे किए हुए  
**अवधि**: 1-1.5 घंटे  
**जटिलता**: ⭐⭐⭐

#### आप क्या सीखेंगे
- उन्नत डिप्लॉयमेंट पैटर्न  
- Bicep के साथ इन्फ्रास्ट्रक्चर ऐज़ कोड  
- संसाधन प्रोविजनिंग रणनीतियाँ  

#### सीखने के संसाधन
- **📖 डिप्लॉयमेंट**: [डिप्लॉयमेंट गाइड](docs/chapter-04-infrastructure/deployment-guide.md) - पूर्ण वर्कफ़्लो  
- **🏗️ प्रोविजनिंग**: [संसाधनों का प्रोविजनिंग](docs/chapter-04-infrastructure/provisioning.md) - Azure संसाधन प्रबंधन  
- **📝 उदाहरण**: [कंटेनर ऐप उदाहरण](../../examples/container-app) - कंटेनराइज्ड डिप्लॉयमेंट  

#### व्यावहारिक अभ्यास
- कस्टम Bicep टेम्प्लेट बनाएं  
- बहु-सेवा एप्लिकेशन डिप्लॉय करें  
- ब्लू-ग्रीन डिप्लॉयमेंट रणनीतियाँ लागू करें  

**💡 अध्याय परिणाम**: कस्टम इन्फ्रास्ट्रक्चर टेम्प्लेट का उपयोग करके जटिल बहु-सेवा एप्लिकेशन तैनात करें

---

### 🎯 अध्याय 5: मल्टी-एजेंट AI समाधान (उन्नत)
**पूर्वापेक्षाएँ**: अध्याय 1-2 पूरे किए हुए  
**अवधि**: 2-3 घंटे  
**जटिलता**: ⭐⭐⭐⭐

#### आप क्या सीखेंगे
- मल्टी-एजेंट आर्किटेक्चर पैटर्न  
- एजेंट ऑर्केस्ट्रेशन और समन्वय  
- उत्पादन-तैयार AI डिप्लॉयमेंट  

#### सीखने के संसाधन
- **🤖 प्रमुख प्रोजेक्ट**: [रिटेल मल्टी-एजेंट समाधान](examples/retail-scenario.md) - पूर्ण कार्यान्वयन  
- **🛠️ ARM टेम्प्लेट्स**: [ARM टेम्प्लेट पैकेज](../../examples/retail-multiagent-arm-template) - एक-क्लिक डिप्लॉयमेंट  
- **📖 आर्किटेक्चर**: [मल्टी-एजेंट समन्वय पैटर्न](docs/chapter-06-pre-deployment/coordination-patterns.md) - पैटर्न्स  

#### व्यावहारिक अभ्यास  
```bash
# पूरी रिटेल मल्टी-एजेंट समाधान को तैनात करें
cd examples/retail-multiagent-arm-template
./deploy.sh

# एजेंट कॉन्फ़िगरेशन का अन्वेषण करें
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 अध्याय परिणाम**: ग्राहक और इन्वेंटरी एजेंट के साथ एक उत्पादन-तैयार मल्टी-एजेंट AI समाधान तैनात और प्रबंधित करें

---

### 🔍 अध्याय 6: पूर्व-डिप्लॉयमेंट सत्यापन और योजना
**पूर्वापेक्षाएँ**: अध्याय 4 पूरा किया हुआ  
**अवधि**: 1 घंटा  
**जटिलता**: ⭐⭐
#### आप क्या सीखेंगे
- क्षमता योजना और संसाधन मान्यता
- SKU चयन रणनीतियाँ
- प्री-फ्लाइट चेक और स्वचालन

#### शिक्षण संसाधन
- **📊 योजना**: [क्षमता योजना](docs/chapter-06-pre-deployment/capacity-planning.md) - संसाधन मान्यता
- **💰 चयन**: [SKU चयन](docs/chapter-06-pre-deployment/sku-selection.md) - लागत-प्रभावी विकल्प
- **✅ मान्यता**: [प्री-फ्लाइट चेक](docs/chapter-06-pre-deployment/preflight-checks.md) - स्वचालित स्क्रिप्ट्स

#### व्यावहारिक अभ्यास
- क्षमता मान्यता स्क्रिप्ट चलाएं
- लागत के लिए SKU चयन अनुकूलित करें
- स्वचालित प्री-डिप्लॉयमेंट चेक लागू करें

**💡 अध्याय परिणाम**: निष्पादन से पहले डिप्लॉयमेंट को मान्य और अनुकूलित करें

---

### 🚨 अध्याय 7: समस्या निवारण और डिबगिंग
**पूर्वापेक्षाएँ**: कोई भी डिप्लॉयमेंट अध्याय पूरा किया हुआ हो  
**समयावधि**: 1-1.5 घंटे  
**जटिलता**: ⭐⭐

#### आप क्या सीखेंगे
- संगठित डिबगिंग दृष्टिकोण
- सामान्य समस्याएं और समाधान
- एआई-विशिष्ट समस्या निवारण

#### शिक्षण संसाधन
- **🔧 सामान्य समस्याएं**: [सामान्य समस्याएं](docs/chapter-07-troubleshooting/common-issues.md) - FAQ और समाधान
- **🕵️ डिबगिंग**: [डिबगिंग गाइड](docs/chapter-07-troubleshooting/debugging.md) - चरण-दर-चरण रणनीतियाँ
- **🤖 एआई समस्याएं**: [एआई-विशिष्ट समस्या निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - एआई सेवा समस्याएं

#### व्यावहारिक अभ्यास
- डिप्लॉयमेंट विफलताओं का निदान करें
- प्रमाणीकरण समस्याओं को सुलझाएं
- एआई सेवा कनेक्टिविटी डिबग करें

**💡 अध्याय परिणाम**: स्वतंत्र रूप से सामान्य डिप्लॉयमेंट समस्याओं का निदान और समाधान करें

---

### 🏢 अध्याय 8: प्रोडक्शन एवं एंटरप्राइज पैटर्न
**पूर्वापेक्षाएँ**: अध्याय 1-4 पूरे किए हुए  
**समयावधि**: 2-3 घंटे  
**जटिलता**: ⭐⭐⭐⭐

#### आप क्या सीखेंगे
- प्रोडक्शन डिप्लॉयमेंट रणनीतियाँ
- एंटरप्राइज सुरक्षा पैटर्न
- निगरानी और लागत अनुकूलन

#### शिक्षण संसाधन
- **🏭 प्रोडक्शन**: [प्रोडक्शन AI सर्वोत्तम प्रथाएं](docs/chapter-08-production/production-ai-practices.md) - एंटरप्राइज पैटर्न
- **📝 उदाहरण**: [माइक्रोसर्विसेज़ उदाहरण](../../examples/microservices) - जटिल वास्तुकला
- **📊 निगरानी**: [एप्लिकेशन इनसाइट्स एकीकरण](docs/chapter-06-pre-deployment/application-insights.md) - निगरानी

#### व्यावहारिक अभ्यास
- एंटरप्राइज सुरक्षा पैटर्न लागू करें
- व्यापक निगरानी सेटअप करें
- उचित प्रशासन के साथ प्रोडक्शन में डिप्लॉय करें

**💡 अध्याय परिणाम**: पूर्ण प्रोडक्शन क्षमता के साथ एंटरप्राइज-तैयार एप्लिकेशन डिप्लॉय करें

---

## 🎓 कार्यशाला अवलोकन: व्यावहारिक अधिगम अनुभव

> **⚠️ कार्यशाला स्थिति: सक्रिय विकास**  
> कार्यशाला सामग्री वर्तमान में विकसित और परिष्कृत की जा रही है। मुख्य मॉड्यूल कार्यशील हैं, लेकिन कुछ उन्नत अनुभाग अधूरे हैं। हम सभी सामग्री पूरी करने के लिए सक्रिय रूप से काम कर रहे हैं। [प्रगति देखें →](workshop/README.md)

### इंटरैक्टिव कार्यशाला सामग्री
**ब्राउज़र-आधारित उपकरणों और मार्गदर्शित व्यायामों के साथ व्यापक व्यावहारिक अधिगम**

हमारी कार्यशाला सामग्री ऊपर दिए गए अध्याय आधारित पाठ्यक्रम के पूरक के रूप में एक संरचित, इंटरैक्टिव अधिगम अनुभव प्रदान करती है। यह कार्यशाला आत्म-गति से सीखने और प्रशिक्षक के नेतृत्व वाली सत्र दोनों के लिए डिज़ाइन की गई है।

#### 🛠️ कार्यशाला विशेषताएँ
- **ब्राउज़र-आधारित इंटरफ़ेस**: खोज, कॉपी और थीम सुविधाओं के साथ पूर्ण MkDocs-संचालित कार्यशाला
- **GitHub Codespaces एकीकरण**: एक-क्लिक विकास परिवेश सेटअप
- **संरचित अधिगम पथ**: 8-मॉड्यूल मार्गदर्शित व्यायाम (कुल 3-4 घंटे)
- **प्रगतिशील कार्यप्रणाली**: परिचय → चयन → मान्यता → विखंडन → कॉन्फ़िगरेशन → अनुकूलन → टियरडाउन → समापन
- **इंटरैक्टिव DevContainer पर्यावरण**: पूर्व-संरचित उपकरण और निर्भरताएँ

#### 📚 कार्यशाला मॉड्यूल संरचना
कार्यशाला एक **8-मॉड्यूल प्रगतिशील कार्यप्रणाली** का पालन करती है जो आपको खोज से डिप्लॉयमेंट कौशल तक ले जाती है:

| मॉड्यूल | विषय | आप क्या करेंगे | समयावधि |
|--------|-------|----------------|----------|
| **0. परिचय** | कार्यशाला अवलोकन | अधिगम उद्देश्यों, पूर्वापेक्षाओं, और कार्यशाला संरचना को समझें | 15 मिनट |
| **1. चयन** | टेम्पलेट खोज | AZD टेम्पलेट्स का अन्वेषण करें और अपनी स्थिति के लिए सही AI टेम्पलेट चुनें | 20 मिनट |
| **2. मान्यता** | डिप्लॉय और सत्यापित करें | `azd up` के साथ टेम्पलेट डिप्लॉय करें और अवसंरचना का सत्यापन करें | 30 मिनट |
| **3. विखंडन** | संरचना को समझें | GitHub Copilot का उपयोग करके टेम्पलेट वास्तुकला, Bicep फाइलें, और कोड संगठन देखें | 30 मिनट |
| **4. कॉन्फ़िगरेशन** | azure.yaml गहराई | `azure.yaml` कॉन्फ़िगरेशन, लाइफसायकल हुक्स, और पर्यावरण चर में महारत हासिल करें | 30 मिनट |
| **5. अनुकूलन** | इसे अपना बनाएं | AI Search, ट्रेसिंग, मूल्यांकन सक्षम करें और अपनी स्थिति के लिए अनुकूलित करें | 45 मिनट |
| **6. टियरडाउन** | साफ-सफाई करें | `azd down --purge` के साथ सुरक्षित रूप से संसाधन हटाएं | 15 मिनट |
| **7. समापन** | अगले कदम | उपलब्धियों, प्रमुख अवधारणाओं की समीक्षा करें और अपनी अधिगम यात्रा जारी रखें | 15 मिनट |

**कार्यशाला प्रवाह:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 कार्यशाला के साथ शुरुआत करें
```bash
# विकल्प 1: GitHub Codespaces (सिफारिश की गई)
# रिपॉजिटरी में "कोड" → "मेन पर कोडस्पेस बनाएं" पर क्लिक करें

# विकल्प 2: स्थानीय विकास
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md में सेटअप निर्देशों का पालन करें
```

#### 🎯 कार्यशाला अधिगम परिणाम
कार्यशाला पूरी करने पर, प्रतिभागी:
- **प्रोडक्शन AI एप्लिकेशन डिप्लॉय करें**: AZD का उपयोग कर Microsoft Foundry सेवाओं के साथ
- **मल्टी-एजेंट वास्तुकला में महारत हासिल करें**: समन्वित AI एजेंट समाधान लागू करें
- **सुरक्षा सर्वोत्तम प्रथाएं लागू करें**: प्रमाणीकरण और एक्सेस नियंत्रण कॉन्फ़िगर करें
- **स्केल के लिए अनुकूलित करें**: लागत-प्रभावी, प्रदर्शनक्षम डिप्लॉयमेंट डिजाइन करें
- **डिप्लॉयमेंट समस्या निवारण करें**: सामान्य समस्याओं को स्वतंत्र रूप से हल करें

#### 📖 कार्यशाला संसाधन
- **🎥 इंटरैक्टिव गाइड**: [कार्यशाला सामग्री](workshop/README.md) - ब्राउज़र-आधारित अधिगम पर्यावरण
- **📋 मॉड्यूल-दर-मॉड्यूल निर्देश**:
  - [0. परिचय](workshop/docs/instructions/0-Introduction.md) - कार्यशाला अवलोकन और उद्देश्य
  - [1. चयन](workshop/docs/instructions/1-Select-AI-Template.md) - AI टेम्पलेट खोजें और चुनें
  - [2. मान्यता](workshop/docs/instructions/2-Validate-AI-Template.md) - टेम्पलेट डिप्लॉय और सत्यापित करें
  - [3. विखंडन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - टेम्पलेट वास्तुकला का अन्वेषण करें
  - [4. कॉन्फ़िगरेशन](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml में महारत हासिल करें
  - [5. अनुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) - अपनी स्थिति हेतु अनुकूलित करें
  - [6. टियरडाउन](workshop/docs/instructions/6-Teardown-Infrastructure.md) - संसाधन साफ़ करें
  - [7. समापन](workshop/docs/instructions/7-Wrap-up.md) - समीक्षा और अगले कदम
- **🛠️ एआई कार्यशाला लैब**: [AI कार्यशाला लैब](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-केंद्रित अभ्यास
- **💡 त्वरित प्रारंभ**: [कार्यशाला सेटअप गाइड](workshop/README.md#quick-start) - पर्यावरण कॉन्फ़िगरेशन

**उपयुक्त है**: कॉर्पोरेट प्रशिक्षण, विश्वविद्यालय पाठ्यक्रम, स्व-गति अधिगम, और डेवलपर बूटकैम्प्स के लिए।

---

## 📖 गहराई से देखें: AZD क्षमताएँ

मूल बातों से परे, AZD प्रोडक्शन डिप्लॉयमेंट के लिए शक्तिशाली विशेषताएँ प्रदान करता है:

- **टेम्पलेट-आधारित डिप्लॉयमेंट्स** - सामान्य एप्लिकेशन पैटर्न के लिए पूर्व-निर्मित टेम्पलेट्स का उपयोग करें
- **इन्फ्रास्ट्रक्चर एज कोड** - Bicep या Terraform का उपयोग कर Azure संसाधनों का प्रबंधन
- **एकीकृत वर्कफ़्लोज़** - एप्लिकेशन की निर्बाध रूप से प्रोविज़निंग, डिप्लॉयमेंट, और निगरानी
- **डेवलपर-फ्रेंडली** - डेवलपर उत्पादकता और अनुभव के लिए अनुकूलित

### **AZD + Microsoft Foundry: AI डिप्लॉयमेंट के लिए परफेक्ट**

**एआई समाधान के लिए AZD क्यों?** AZD AI डेवलपर्स के सामने आने वाली प्रमुख चुनौतियों को संबोधित करता है:

- **AI-रेडी टेम्पलेट्स** - Microsoft Foundry मॉडल, Cognitive Services, और ML वर्कलोड्स के लिए पूर्व-कॉन्फ़िगर टेम्पलेट्स
- **सुरक्षित AI डिप्लॉयमेंट्स** - AI सेवाओं, API कुंजियाँ, और मॉडल एंडपॉइंट्स के लिए अंतर्निर्मित सुरक्षा पैटर्न
- **प्रोडक्शन AI पैटर्न** - स्केलेबल, लागत प्रभावी AI एप्लिकेशन डिप्लॉयमेंट के लिए सर्वोत्तम प्रथाएं
- **एंड-टू-एंड AI वर्कफ़्लोज़** - मॉडल विकास से लेकर प्रोडक्शन डिप्लॉयमेंट और उचित निगरानी तक
- **लागत अनुकूलन** - AI वर्कलोड्स के लिए स्मार्ट संसाधन आवंटन और स्केलिंग रणनीतियाँ
- **Microsoft Foundry एकीकरण** - Microsoft Foundry मॉडल कैटलॉग और एंडपॉइंट्स से निर्बाध कनेक्शन

---

## 🎯 टेम्पलेट्स और उदाहरण पुस्तकालय

### विशेष रूप से: Microsoft Foundry टेम्पलेट्स
**यदि आप AI एप्लिकेशन डिप्लॉय कर रहे हैं तो यहां से शुरू करें!**

> **नोट:** ये टेम्पलेट विभिन्न AI पैटर्न प्रदर्शित करते हैं। कुछ बाहरी Azure Samples हैं, कुछ स्थानीय कार्यान्वयन।

| टेम्पलेट | अध्याय | जटिलता | सेवाएँ | प्रकार |
|----------|---------|----------|---------|--------|
| [**AI चैट के साथ शुरुआत करें**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | बाहरी |
| [**AI एजेंटों के साथ शुरुआत करें**](https://github.com/Azure-Samples/get-started-with-ai-agents) | अध्याय 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | बाहरी |
| [**Azure Search + OpenAI डेमो**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | बाहरी |
| [**OpenAI चैट ऐप क्विकस्टार्ट**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | बाहरी |
| [**एजेंट OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | बाहरी |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | बाहरी |
| [**Retail मल्टी-एजेंट समाधान**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **स्थानीय** |

### विशेष रूप से: पूर्ण अधिगम परिदृश्य
**प्रोडक्शन-तैयार एप्लिकेशन टेम्पलेट जिन्हें पाठ्यक्रम अध्यायों से मैप किया गया है**

| टेम्पलेट | अधिगम अध्याय | जटिलता | मुख्य अधिगम |
|----------|---------------|----------|-------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | मूल AI डिप्लॉयमेंट पैटर्न |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | Azure AI Search के साथ RAG कार्यान्वयन |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | अध्याय 4 | ⭐⭐ | दस्तावेज़ इंटेलिजेंस एकीकरण |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | एजेंट फ्रेमवर्क और फंक्शन कॉलिंग |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐ | एंटरप्राइज AI आर्केस्ट्रेशन |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | कस्टमर और इन्वेंटरी एजेंट्स के साथ मल्टी-एजेंट आर्किटेक्चर |

### उदाहरण प्रकार से सीखना

> **📌 स्थानीय बनाम बाहरी उदाहरण:**  
> **स्थानीय उदाहरण** (इस रिपॉजिटरी में) = तुरंत उपयोग के लिए तैयार  
> **बाहरी उदाहरण** (Azure Samples) = लिंक किए गए रिपॉजिटरी से क्लोन करें

#### स्थानीय उदाहरण (तुरंत उपयोग के लिए)
- [**रिटेल मल्टी-एजेंट समाधान**](examples/retail-scenario.md) - आरएम टेम्पलेट्स के साथ पूर्ण प्रोडक्शन-तैयार कार्यान्वयन
  - मल्टी-एजेंट आर्किटेक्चर (कस्टमर + इन्वेंटरी एजेंट्स)
  - व्यापक निगरानी और मूल्यांकन
  - आरएम टेम्पलेट के द्वारा वन-क्लिक डिप्लॉयमेंट

#### स्थानीय उदाहरण - कंटेनर एप्लिकेशन (अध्याय 2-5)
**इस रिपॉजिटरी में व्यापक कंटेनर डिप्लॉयमेंट उदाहरण:**
- [**कंटेनर ऐप उदाहरण**](examples/container-app/README.md) - कंटेनरीकृत डिप्लॉयमेंट के लिए पूर्ण मार्गदर्शिका
  - [सरल Flask API](../../examples/container-app/simple-flask-api) - स्केल-टू-ज़ीरो के साथ मूल REST API
  - [माइक्रोसर्विसेज़ आर्किटेक्चर](../../examples/container-app/microservices) - प्रोडक्शन-तैयार मल्टी-सर्विस डिप्लॉयमेंट
  - क्विक स्टार्ट, प्रोडक्शन, और एडवांस्ड डिप्लॉयमेंट पैटर्न
  - निगरानी, सुरक्षा, और लागत अनुकूलन मार्गदर्शन

#### बाहरी उदाहरण - सरल एप्लिकेशन (अध्याय 1-2)
**शुरू करने के लिए इन Azure Samples रिपॉजिटरी को क्लोन करें:**
- [सरल वेब ऐप - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - मूल डिप्लॉयमेंट पैटर्न
- [स्टैटिक वेबसाइट - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - स्थैतिक सामग्री डिप्लॉयमेंट
- [कंटेनर ऐप - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API डिप्लॉयमेंट

#### बाहरी उदाहरण - डेटाबेस एकीकरण (अध्याय 3-4)  
- [डेटाबेस ऐप - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - डेटाबेस कनेक्टिविटी पैटर्न
- [फंक्शंस + कोस्मोस DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - सर्वरलेस डेटा वर्कफ़्लो

#### बाहरी उदाहरण - उन्नत पैटर्न (चैप्टर 4-8)
- [जावा माइक्रोसर्विसेस](https://github.com/Azure-Samples/java-microservices-aca-lab) - मल्टी-सर्विस आर्किटेक्चर्स
- [कंटेनर ऐप्स जॉब्स](https://github.com/Azure-Samples/container-apps-jobs) - पृष्ठभूमि प्रसंस्करण  
- [एंटरप्राइज़ ML पाइपलाइन](https://github.com/Azure-Samples/mlops-v2) - प्रोडक्शन-रेडी ML पैटर्न

### बाहरी टेम्प्लेट संग्रह
- [**आधिकारिक AZD टेम्प्लेट गैलरी**](https://azure.github.io/awesome-azd/) - आधिकारिक और कम्युनिटी टेम्प्लेट का क्यूरेटेड संग्रह
- [**एज़ुअर डेवलपर CLI टेम्प्लेट्स**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - माइक्रोसॉफ्ट लर्न टेम्प्लेट दस्तावेज़ीकरण
- [**उदाहरण निर्देशिका**](examples/README.md) - विस्तृत व्याख्याओं के साथ स्थानीय शिक्षण उदाहरण

---

## 📚 अधिगम संसाधन & संदर्भ

### त्वरित संदर्भ
- [**कमांड चीट शीट**](resources/cheat-sheet.md) - अध्याय द्वारा व्यवस्थित आवश्यक azd कमांड
- [**शब्दावली**](resources/glossary.md) - Azure और azd शब्दावली  
- [**सामान्य प्रश्न**](resources/faq.md) - अध्ययन अध्याय द्वारा व्यवस्थित सामान्य प्रश्न
- [**अध्ययन मार्गदर्शिका**](resources/study-guide.md) - व्यापक अभ्यास व्यायाम

### व्यावहारिक कार्यशालाएं
- [**AI कार्यशाला लैब**](docs/chapter-02-ai-development/ai-workshop-lab.md) - अपने AI समाधानों को AZD-परिनियोज्य बनाएं (2-3 घंटे)
- [**इंटरैक्टिव कार्यशाला**](workshop/README.md) - MkDocs और GitHub Codespaces के साथ 8-मॉड्यूल मार्गदर्शित अभ्यास
  - अनुसरण करता है: परिचय → चयन → सत्यापन → डी-कंस्ट्रक्शन → विन्यास → अनुकूलन → टियरडाउन → समापन

### बाहरी सीखने के संसाधन
- [एज़ुअर डेवलपर CLI दस्तावेज़](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [एज़ुअर आर्किटेक्चर सेंटर](https://learn.microsoft.com/en-us/azure/architecture/)
- [एज़ुअर प्राइसिंग कैलकुलेटर](https://azure.microsoft.com/pricing/calculator/)
- [एज़ुअर स्थिति](https://status.azure.com/)

### अपने संपादक के लिए AI एजेंट स्किल्स
- [**Microsoft Azure स्किल्स ऑन skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, परिनियोजन, डायग्नोस्टिक्स, लागत अनुकूलन आदि के लिए 37 खुले एजेंट स्किल्स। इन्हें GitHub Copilot, Cursor, Claude Code, या किसी समर्थित एजेंट में स्थापित करें:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 त्वरित समस्या निवारण मार्गदर्शिका

**सामान्य समस्याएं जो शुरुआती लोगों को आती हैं और त्वरित समाधान:**

<details>
<summary><strong>❌ "azd: कमांड नहीं मिला"</strong></summary>

```bash
# पहले AZD इंस्टॉल करें
# विंडोज़ (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# लिनक्स:
curl -fsSL https://aka.ms/install-azd.sh | bash

# इंस्टॉलेशन सत्यापित करें
azd version
```
</details>

<details>
<summary><strong>❌ "कोई सदस्यता नहीं मिली" या "सदस्यता सेट नहीं की गई"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" या "कोटा पारित"</strong></summary>

```bash
# अलग-अलग Azure क्षेत्र आज़माएं
azd env set AZURE_LOCATION "westus2"
azd up

# या विकास में छोटे SKU का उपयोग करें
# infra/main.parameters.json संपादित करें:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" बीच में विफल हो गया</strong></summary>

```bash
# विकल्प 1: साफ करें और पुनः प्रयास करें
azd down --force --purge
azd up

# विकल्प 2: सिर्फ़ इन्फ्रास्ट्रक्चर ठीक करें
azd provision

# विकल्प 3: विस्तृत स्थिति जांचें
azd show

# विकल्प 4: Azure Monitor में लॉग्स देखें
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "पुष्टिकरण विफल" या "टोकन समाप्त"</strong></summary>

```bash
# AZD के लिए पुन: प्रमाणीकरण करें
azd auth logout
azd auth login

# वैकल्पिक: यदि आप az कमांड चला रहे हैं तो Azure CLI को भी रीफ़्रेश करें
az logout
az login

# प्रमाणीकरण सत्यापित करें
az account show
```
</details>

<details>
<summary><strong>❌ "संसाधन पहले ही मौजूद है" या नामकरण संघर्ष</strong></summary>

```bash
# AZD अद्वितीय नाम उत्पन्न करता है, लेकिन यदि संघर्ष हो:
azd down --force --purge

# तो ताजा पर्यावरण के साथ पुनः प्रयास करें
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ टेम्प्लेट तैनाती में बहुत समय लग रहा है</strong></summary>

**सामान्य प्रतीक्षा समय:**
- सरल वेब ऐप: 5-10 मिनट
- डेटाबेस के साथ ऐप: 10-15 मिनट
- AI अनुप्रयोग: 15-25 मिनट (OpenAI प्रोविजनिंग धीमी है)

```bash
# प्रगति की जाँच करें
azd show

# यदि 30 मिनट से अधिक फंसे हैं, तो Azure पोर्टल जांचें:
azd monitor --overview
# विफल तैनाती की तलाश करें
```
</details>

<details>
<summary><strong>❌ "अनुमति अस्वीकृत" या "प्रतिबंधित"</strong></summary>

```bash
# अपना Azure रोल जांचें
az role assignment list --assignee $(az account show --query user.name -o tsv)

# आपको कम से कम "Contributor" रोल की आवश्यकता है
# अपने Azure एडमिन से अनुमति मांगें:
# - Contributor (संसाधनों के लिए)
# - User Access Administrator (रोल असाइनमेंट के लिए)
```
</details>

<details>
<summary><strong>❌ तैनात एप्लिकेशन URL नहीं मिल पा रहा है</strong></summary>

```bash
# सभी सेवा एंडपॉइंट दिखाएं
azd show

# या Azure पोर्टल खोलें
azd monitor

# विशिष्ट सेवा जाँचें
azd env get-values
# *_URL वेरिएबल देखें
```
</details>

### 📚 पूरी समस्या निवारण संसाधन

- **सामान्य समस्याएं मार्गदर्शिका:** [विस्तृत समाधान](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-विशिष्ट समस्याएं:** [AI समस्या निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **डिबगिंग मार्गदर्शिका:** [चरण-दर-चरण डिबगिंग](docs/chapter-07-troubleshooting/debugging.md)
- **मदद पाएं:** [Azure डिस्कॉर्ड](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 कोर्स पूर्णता और प्रमाणन

### प्रगति ट्रैकिंग
अपने अध्ययन प्रगति को प्रत्येक अध्याय के माध्यम से ट्रैक करें:

- [ ] **अध्याय 1**: आधार और त्वरित प्रारंभ ✅
- [ ] **अध्याय 2**: AI-प्रथम विकास ✅  
- [ ] **अध्याय 3**: विन्यास और प्रमाणीकरण ✅
- [ ] **अध्याय 4**: इन्फ्रास्ट्रक्चर ऐज़ कोड और तैनाती ✅
- [ ] **अध्याय 5**: मल्टी-एजेंट AI समाधान ✅
- [ ] **अध्याय 6**: पूर्व-तैनाती सत्यापन और योजना ✅
- [ ] **अध्याय 7**: समस्या निवारण और डिबगिंग ✅
- [ ] **अध्याय 8**: प्रोडक्शन और एंटरप्राइज़ पैटर्न ✅

### अध्ययन सत्यापन
प्रत्येक अध्याय पूर्ण करने के बाद अपना ज्ञान सत्यापित करें:
1. **व्यावहारिक अभ्यास**: अध्याय की व्यावहारिक तैनाती पूरी करें
2. **ज्ञान जांच**: अपने अध्याय के FAQ अनुभाग की समीक्षा करें
3. **समुदाय चर्चा**: Azure डिस्कॉर्ड में अपना अनुभव साझा करें
4. **अगला अध्याय**: अगली जटिलता स्तर पर जाएं

### कोर्स पूर्णता लाभ
सभी अध्याय पूर्ण करने पर आपको मिलेगा:
- **प्रोडक्शन अनुभव**: असली AI ऐप्लिकेशन Azure पर तैनात करना
- **पेशेवर कौशल**: एंटरप्राइज़-रेडी तैनाती कौशल  
- **समुदाय मान्यता**: सक्रिय Azure डेवलपर समुदाय सदस्य
- **करियर उन्नति**: मांग में AZD और AI तैनाती विशेषज्ञता

---

## 🤝 समुदाय और समर्थन

### मदद और समर्थन प्राप्त करें
- **तकनीकी मुद्दे**: [बग रिपोर्ट करें और फीचर अनुरोध](https://github.com/microsoft/azd-for-beginners/issues)
- **अधिगम प्रश्न**: [Microsoft Azure डिस्कॉर्ड समुदाय](https://discord.gg/microsoft-azure) और [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-विशिष्ट सहायता**: [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) में जुड़ें
- **दस्तावेज़ीकरण**: [आधिकारिक Azure Developer CLI दस्तावेज़](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord से समुदाय के अंतर्दृष्टि

**#Azure चैनल से हाल ही के पोल परिणाम:**
- **45%** डेवलपर्स AI कार्यभार के लिए AZD का उपयोग करना चाहते हैं
- **शीर्ष चुनौतियां**: मल्टी-सर्विस तैनाती, क्रेडेंशियल प्रबंधन, प्रोडक्शन रेडीनस  
- **सबसे अनुरोध किए गए**: AI-विशिष्ट टेम्प्लेट्स, समस्या निवारण मार्गदर्शिका, सर्वोत्तम प्रथाएं

**हमारे समुदाय में शामिल हों ताकि आप:**
- अपने AZD + AI अनुभव साझा कर सकें और मदद प्राप्त करें
- नए AI टेम्प्लेट्स के शुरुआती प्रीव्यू तक पहुँच प्राप्त करें
- AI तैनाती सर्वोत्तम प्रथाओं में योगदान दें
- भविष्य के AI + AZD फीचर विकास को प्रभावित करें

### कोर्स में योगदान देना
हम योगदानों का स्वागत करते हैं! कृपया हमारे [योगदान मार्गदर्शिका](CONTRIBUTING.md) को पढ़ें जिसमें विवरण शामिल हैं:
- **सामग्री सुधार**: मौजूदा अध्याय और उदाहरण बेहतर बनाएं
- **नए उदाहरण**: वास्तविक-विश्व परिदृश्य और टेम्प्लेट जोड़ें  
- **अनुवाद**: बहुभाषी समर्थन बनाए रखने में सहायता करें
- **बग रिपोर्ट**: सटीकता और स्पष्टता सुधारें
- **समुदाय मानक**: हमारे समावेशी सामुदायिक दिशानिर्देशों का पालन करें

---

## 📄 कोर्स जानकारी

### लाइसेंस
यह परियोजना MIT लाइसेंस के अंतर्गत लाइसेंसित है - विवरण के लिए [LICENSE](../../LICENSE) फ़ाइल देखें।

### संबंधित Microsoft लर्निंग संसाधन

हमारी टीम अन्य व्यापक लर्निंग कोर्स का उत्पादन करती है:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### लांगचेन
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / एजेंट्स
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### जनरेटिव AI श्रृंखला
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### मुख्य अधिगम
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
---
 
### कोपाइलट श्रृंखला

---

## 🗺️ कोर्स नेविगेशन

**🚀 सीखना शुरू करने के लिए तैयार?**

**शुरुआती**: शुरुआत करें [अध्याय 1: आधार और त्वरित शुरुआत](#-chapter-1-foundation--quick-start)  
**एआई डेवलपर्स**: कूदें [अध्याय 2: एआई-प्रथम विकास](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**अनुभवी डेवलपर्स**: शुरू करें [अध्याय 3: कॉन्फ़िगरेशन और प्रमाणीकरण](#️-chapter-3-configuration--authentication)

**अगले कदम**: [अध्याय 1 शुरू करें - AZD मूल बातें](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यह दस्तावेज़ एआई अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान रखें कि स्वचालित अनुवादों में त्रुटियाँ या गलतियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में आधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->