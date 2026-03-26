# नवीनांसाठी AZD: एक संरचित शिकण्याचा प्रवास

![AZD-for-beginners](../../translated_images/mr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### स्वयंचलित भाषांतर (नेहमी अपडेटेड)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[अरबी](../ar/README.md) | [बंगाली](../bn/README.md) | [बल्गेरियन](../bg/README.md) | [बर्मी (म्यानमार)](../my/README.md) | [चिनी (सोपे)](../zh-CN/README.md) | [चिनी (परंपरागत, हॉंगकाँग)](../zh-HK/README.md) | [चिनी (परंपरागत, मकाऊ)](../zh-MO/README.md) | [चिनी (परंपरागत, तैवान)](../zh-TW/README.md) | [क्रोएशियन](../hr/README.md) | [चेह](../cs/README.md) | [डॅनिश](../da/README.md) | [डच](../nl/README.md) | [एस्टोनियन](../et/README.md) | [फिन्नीश](../fi/README.md) | [फ्रेंच](../fr/README.md) | [जर्मन](../de/README.md) | [ग्रीक](../el/README.md) | [हिब्रू](../he/README.md) | [हिंदी](../hi/README.md) | [हंगेरीयन](../hu/README.md) | [इंडोनेशियन](../id/README.md) | [इटालियन](../it/README.md) | [जपानी](../ja/README.md) | [कन्नड](../kn/README.md) | [कोरियन](../ko/README.md) | [लिथुआनियन](../lt/README.md) | [मलय](../ms/README.md) | [मलयाळम](../ml/README.md) | [मराठी](./README.md) | [नेपाली](../ne/README.md) | [नायजेरियन पिड्गिन](../pcm/README.md) | [नॉर्वेजियन](../no/README.md) | [फारशी (पर्शियन)](../fa/README.md) | [पोलिश](../pl/README.md) | [पोर्तुगीज (ब्राझील)](../pt-BR/README.md) | [पोर्तुगीज (पोर्तुगाल)](../pt-PT/README.md) | [पंजाबी (गुरुमुखी)](../pa/README.md) | [रोमानियन](../ro/README.md) | [रशियन](../ru/README.md) | [सर्बियन (सिरिलिक)](../sr/README.md) | [स्लोव्हाक](../sk/README.md) | [स्लोव्हेनियन](../sl/README.md) | [स्पॅनिश](../es/README.md) | [स्वाहिली](../sw/README.md) | [स्वीडिश](../sv/README.md) | [टागालॉग (फिलिपिनो)](../tl/README.md) | [तमिळ](../ta/README.md) | [तेलुगू](../te/README.md) | [थाई](../th/README.md) | [तुर्की](../tr/README.md) | [युक्रेनियन](../uk/README.md) | [उर्दू](../ur/README.md) | [व्हिएतनामी](../vi/README.md)

> **स्थानिक क्लोन करता प्राधान्य देता?**
>
> या रेपॉजिटरीमध्ये ५०+ भाषांतरांचा समावेश आहे ज्यामुळे डाउनलोडचा आकार मोठा होतो. भाषांतरे शिवाय क्लोन करण्यासाठी sparse checkout वापरा:
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
> हे तुम्हाला कोर्स पूर्ण करण्यासाठी सर्वकाही देते आणि डाउनलोड जलद होते.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 आज azd मध्ये काय नवीन

Azure Developer CLI पारंपरिक वेब अॅप्स आणि API पेक्षा पुढे वाढला आहे. आज azd हा एकमेव टूल आहे ज्याद्वारे तुम्ही Azure वर **कोणतीही** अॅप्लीकेशन तैनात करू शकता — ज्यात AI-शक्तीयुक्त अॅप्स आणि बुद्धिमान एजंट्स आहेत.

तुमच्यासाठी याचा अर्थ असा आहे:

- **AI एजंट आता प्रथम दर्जाचे azd वर्कलोड आहेत.** तुम्ही आधीच ज्ञात `azd init` → `azd up` कार्यप्रवाह वापरून AI एजंट प्रकल्प सुरू करू, तैनात करू आणि व्यवस्थापित करू शकता.
- **Microsoft Foundry एकत्रीकरण** मॉडेल तैनाती, एजंट होस्टिंग, आणि AI सेवा कॉन्फिगरेशन थेट azd टेम्पलेट इकोसिस्टममध्ये आणतो.
- **मूलभूत कार्यप्रवाह बदललेला नाही.** तुम्ही todo अॅप, मायक्रोसर्व्हिस किंवा मल्टी-एजंट AI सोल्यूशन तैनात करत असाल, कमांड्स सारखेच राहतात.

जर तुम्ही आधी azd वापरला असेल, तर AI सपोर्ट हा नैसर्गिक विस्तार आहे — वेगळं टूल किंवा प्रगत ट्रॅक नाही. जर तुम्ही नवीन सुरुवात करत असाल, तर एकच कार्यप्रवाह सर्वांसाठी शिकाल.

---

## 🚀 Azure Developer CLI (azd) म्हणजे काय?

**Azure Developer CLI (azd)** हे विकासकांसाठी अनुकूल असलेले कमांड-लाइन टूल आहे जे Azure वर अॅप्लिकेशन्स सोप्या भाषेत तैनात करण्यास मदत करते. अनेक Azure संसाधने स्वयंचलितपणे तयार करण्यापेक्षा, तुम्ही संपूर्ण अॅप्स एका कमांडने तैनात करू शकता.

### `azd up` चे जादू

```bash
# हा एकच आदेश सर्वकाही करतो:
# ✅ सर्व Azure संसाधने तयार करतो
# ✅ नेटवर्किंग आणि सुरक्षा कॉन्फिगर करतो
# ✅ तुमच्या अनुप्रयोगाचा कोड तयार करतो
# ✅ Azure वर तैनात करतो
# ✅ तुम्हाला कार्यरत URL देतो
azd up
```

**इतकंच!** Azure पोर्टल क्लिक करायची गरज नाही, कोणतीही गुंतागुंतीची ARM टेम्प्लेट शिकण्याची गरज नाही, कोणतीही मॅन्युअल कॉन्फिगरेशन नाही – फक्त Azure वर काम करणाऱ्या अॅप्स.

---

## ❓ Azure Developer CLI आणि Azure CLI यामध्ये काय फरक आहे?

हा नवीनांसाठी सर्वात सामान्य प्रश्न आहे. सोपा उत्तर खालीलप्रमाणे:

| वैशिष्ट्य | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **उद्दिष्ट** | वेगवेगळ्या Azure संसाधनांचे व्यवस्थापन | संपूर्ण अॅप्लिकेशन्सची तैनाती |
| **दृष्टीकोन** | इन्फ्रास्ट्रक्चर-केंद्रित | अॅप्लिकेशन-केंद्रित |
| **उदाहरण** | `az webapp create --name myapp...` | `azd up` |
| **शिकण्याची गरज** | Azure सेवा माहित असणे आवश्यक | तुमचा अॅप मात्र माहित असणे पुरे |
| **सर्वोत्तम वापर** | DevOps, इन्फ्रास्ट्रक्चर | विकासक, प्रोटोटायपिंग |

### सोपी समज

- **Azure CLI** म्हणजे घर बांधण्यासाठी लागणारी सर्व साधने — हातोडा, आरा, लोखंडी नखे. तुम्ही काहीही बांधू शकता, पण बांधकाम माहित असायला हवे.
- **Azure Developer CLI** म्हणजे एक ठेकेदार कामावर घेणे — तुम्ही काय हवे ते सांगा आणि ते बांधून देतील.

### कोणती कधी वापरायची

| परिस्थिती | वापरा |
|----------|----------|
| "माझा वेब अॅप लगेच तैनात करायचा आहे" | `azd up` |
| "मला फक्त एक स्टोरेज अकाउंट तयार करायचा आहे" | `az storage account create` |
| "मी पूर्ण AI अॅप तयार करत आहे" | `azd init --template azure-search-openai-demo` |
| "मला एखाद्या Azure संसाधनाची डिबगिंग करायची आहे" | `az resource show` |
| "मला काही मिनिटांत उत्पादनासाठी तयार तैनाती हवी" | `azd up --environment production` |

### ते एकत्र काम करतात!

AZD अंतर्गत Azure CLI वापरतो. तुम्ही दोन्ही वापरू शकता:
```bash
# AZD वापरून आपले अॅप तैनात करा
azd up

# नंतर Azure CLI वापरून विशिष्ट संसाधने सूक्ष्मरित्या समायोजित करा
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD मध्ये टेम्प्लेट शोधा

शून्यातून सुरुवात करू नका! **Awesome AZD** ही समुदायाकडून तयार केलेली तैनातीसाठी तयार टेम्प्लेट्सची संग्रह आहे:

| स्रोत | वर्णन |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | 200+ टेम्प्लेट्स एक क्लिकमध्ये तैनात करा |
| 🔗 [**टेम्प्लेट सबमिट करा**](https://github.com/Azure/awesome-azd/issues) | तुमचा स्वतःचा टेम्प्लेट समुदायाला द्या |
| 🔗 [**GitHub रेपॉजिटरी**](https://github.com/Azure/awesome-azd) | स्टार करा आणि स्रोत बघा |

### Awesome AZD मधील लोकप्रिय AI टेम्प्लेट्स

```bash
# RAG चॅट Microsoft Foundry मॉडेल्स आणि एआय शोधासह
azd init --template azure-search-openai-demo

# त्वरीत एआय चॅट अनुप्रयोग
azd init --template openai-chat-app-quickstart

# Foundry एजंट्ससह एआय एजंट्स
azd init --template get-started-with-ai-agents
```

---

## 🎯 ३ टप्यांत सुरू करा

### टप्पा १: AZD इन्स्टॉल करा (२ मिनिटे)

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

### टप्पा २: Azure मध्ये लॉगिन करा

```bash
azd auth login
```

### टप्पा ३: तुमचा पहिला अॅप तैनात करा

```bash
# टेम्पलेटमधून प्रारंभ करा
azd init --template todo-nodejs-mongo

# Azure वर तैनात करा (सर्व काही तयार करते!)
azd up
```

**🎉 इतकंच!** तुमचा अॅप आता Azure वर लाईव्ह आहे.

### स्वच्छता करा (कधीही विसरू नका!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 हा कोर्स कसा वापरायचा

हा कोर्स **प्रगत शिकण्यासाठी** डिझाइन केलेला आहे – जिथून आरामदायक वाटतो तिथून सुरुवात करा आणि हळूहळू पुढे जा:

| तुमचा अनुभव | येथे प्रारंभ करा |
|-----------------|------------|
| **Azure नवख्या** | [धडा १: पाया](#-chapter-1-foundation--quick-start) |
| **Azure जाणता, AZD नवीन** | [धडा १: पाया](#-chapter-1-foundation--quick-start) |
| **AI अॅप्स तैनात करायचे आहेत** | [धडा २: AI-प्रथम विकास](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **प्रत्यक्षप्रकारे सराव हवा आहे** | [🎓 इंटरॅक्टिव वर्कशॉप](workshop/README.md) - ३-४ तासांचा मार्गदर्शित लॅब |
| **उत्पादनासाठी नमुने पाहिजेत** | [धडा ८: उत्पादन आणि एंटरप्राइझ](#-chapter-8-production--enterprise-patterns) |

### जलद सेटअप

1. **हा रेपॉजिटरी फोर्क करा:** [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **क्लोन करा:** `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **मदत घ्या:** [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **स्थानिक क्लोन करणे जास्त प्राधान्य आहे?**

> या रेपॉजिटरीमध्ये ५०+ भाषांतरांचा समावेश आहे ज्यामुळे डाउनलोडचा आकार मोठा होतो. भाषांतरे शिवाय क्लोन करण्यासाठी sparse checkout वापरा:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> हे तुम्हाला कोर्स पूर्ण करण्यासाठी सर्वकाही देते आणि डाउनलोड जलद होते.


## कोर्सचे आढावा

संरचित धड्यांद्वारे Azure Developer CLI (azd) मध्ये पारंगत व्हा. **Microsoft Foundry एकत्रीकरणासह AI अनुप्रयोग तैनातीवर विशेष लक्ष.**

### आधुनिक विकासकांसाठी हा कोर्स का आवश्यक आहे

Microsoft Foundry Discord समुदायाच्या अंतर्दृष्टीनुसार, **विकसकांपैकी ४५% लोक AZD AI वर्कलोडसाठी वापरू इच्छितात** पण खालील अडचणी येतात:
- गुंतागुंतीचे बहु-सेवा AI आर्किटेक्चर
- उत्पादन AI तैनाती सर्वोत्तम सराव  
- Azure AI सेवा समाकलन आणि कॉन्फिगरेशन
- AI वर्कलोडसाठी खर्च ऑप्टिमायझेशन
- AI-विशिष्ट तैनाती समस्या निवारण

### शिकण्याच्या उद्दिष्टे

हा संरचित कोर्स पूर्ण करून, तुम्ही:
- **AZD मूलतत्त्व पारंगत व्हा**: मूलभूत संकल्पना, स्थापना आणि कॉन्फिगरेशन
- **AI अॅप्लिकेशन्स तैनात करा**: AZD सह Microsoft Foundry सेवा वापरा
- **इन्फ्रास्ट्रक्चर एज कोड अंमलात आणा**: Bicep टेम्प्लेट्स वापरून Azure संसाधने व्यवस्थापित करा
- **तैनातील्या समस्या सोडवा**: सामान्य अडचणी सोडवा आणि डिबग करा
- **उत्पादनासाठी ऑप्टिमायझेशन करा**: सुरक्षा, मापन, देखरेख आणि खर्च व्यवस्थापन
- **मल्टी-एजंट सोल्यूशन्स तयार करा**: जटिल AI आर्किटेक्चर तैनात करा

## 🗺️ कोर्स नकाशा: अध्यायानुसार जलद नेव्हिगेशन

प्रत्येक अध्यायामध्ये शिकण्याची उद्दिष्टे, जलद प्रारंभ, आणि सरावासाठी समर्पित README आहे:

| धडा | विषय | धडे | कालावधी | गुंतागुंती |
|---------|-------|---------|----------|------------|
| **[धडा १: पाया](docs/chapter-01-foundation/README.md)** | सुरूवात | [AZD मूलतत्त्वे](docs/chapter-01-foundation/azd-basics.md) &#124; [इन्स्टॉलेशन](docs/chapter-01-foundation/installation.md) &#124; [पहिला प्रोजेक्ट](docs/chapter-01-foundation/first-project.md) | ३०-४५ मिनिटे | ⭐ |
| **[अध्याय 2: AI विकास](docs/chapter-02-ai-development/README.md)** | AI-प्रथम अ‍ॅप्स | [Foundry इंटीग्रेशन](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI एजंट्स](docs/chapter-02-ai-development/agents.md) &#124; [मॉडेल तैनाती](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [कार्यशाळा](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 तास | ⭐⭐ |
| **[अध्याय 3: कॉन्फिगरेशन](docs/chapter-03-configuration/README.md)** | प्रमाणीकरण आणि सुरक्षा | [कॉन्फिगरेशन](docs/chapter-03-configuration/configuration.md) &#124; [प्रमाणीकरण आणि सुरक्षा](docs/chapter-03-configuration/authsecurity.md) | 45-60 मिनिटे | ⭐⭐ |
| **[अध्याय 4: पायाभूत सुविधा](docs/chapter-04-infrastructure/README.md)** | IaC आणि तैनाती | [तैनात मार्गदर्शक](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [प्रोव्हिजनिंग](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 तास | ⭐⭐⭐ |
| **[अध्याय 5: मल्टी-एजंट](docs/chapter-05-multi-agent/README.md)** | AI एजंट सोल्यूशन्स | [रिटेल सीनारिओ](examples/retail-scenario.md) &#124; [समन्वय नमुने](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 तास | ⭐⭐⭐⭐ |
| **[अध्याय 6: पूर्व-तैनाती](docs/chapter-06-pre-deployment/README.md)** | नियोजन आणि पडताळणी | [पूर्व-तपासणी](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [क्षमता नियोजन](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU निवड](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [अ‍ॅप इन्साइट्स](docs/chapter-06-pre-deployment/application-insights.md) | 1 तास | ⭐⭐ |
| **[अध्याय 7: समस्या निवारण](docs/chapter-07-troubleshooting/README.md)** | डीबग आणि दुरुस्ती | [सामान्य समस्या](docs/chapter-07-troubleshooting/common-issues.md) &#124; [डीबगिंग](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI समस्या](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 तास | ⭐⭐ |
| **[अध्याय 8: उत्पादन](docs/chapter-08-production/README.md)** | एंटरप्राइझ नमुने | [उत्पादन प्रथाः](docs/chapter-08-production/production-ai-practices.md) | 2-3 तास | ⭐⭐⭐⭐ |
| **[🎓 कार्यशाळा](workshop/README.md)** | हाताने प्रॅक्टिस लॅब | [परिचय](workshop/docs/instructions/0-Introduction.md) &#124; [निवड](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [पडताळणी](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [विच्छेदन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [कॉन्फिगरेशन](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [सानुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [तोडणे](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [समारोप](workshop/docs/instructions/7-Wrap-up.md) | 3-4 तास | ⭐⭐ |

**एकूण कोर्स कालावधी:** ~10-14 तास | **कौशल्य प्रगती:** सुरुवातीपासून → उत्पादन-तयार

---

## 📚 शिकण्याची अध्याय

*अनुभव स्तर आणि उद्दिष्टांनुसार आपला शिकण्याचा मार्ग निवडा*

### 🚀 अध्याय 1: पाया आणि जलद प्रारंभ
**पूर्वअटी**: Azure सदस्यता, मूलभूत कमांड लाइन ज्ञान  
**कालावधी**: 30-45 मिनिटे  
**जटिलता**: ⭐

#### तुम्ही काय शिकाल
- Azure Developer CLI च्या मूलभूत तत्त्वांची समज
- आपल्या प्लॅटफॉर्मवर AZD ची स्थापना
- आपली पहिली यशस्वी तैनाती

#### शिकण्याचे स्रोत
- **🎯 येथे सुरू करा**: [Azure Developer CLI म्हणजे काय?](#what-is-azure-developer-cli)
- **📖 सिद्धांत**: [AZD मूलतत्त्वे](docs/chapter-01-foundation/azd-basics.md) - मुख्य कल्पना आणि शब्दसेवा
- **⚙️ सेटअप**: [इंस्टॉलेशन आणि सेटअप](docs/chapter-01-foundation/installation.md) - प्लॅटफॉर्म-विशिष्ट मार्गदर्शक
- **🛠️ प्रायोगिक**: [आपला पहिला प्रोजेक्ट](docs/chapter-01-foundation/first-project.md) - टप्प्याटप्प्याने मार्गदर्शन
- **📋 त्वरीत संदर्भ**: [कमांड चीट शीट](resources/cheat-sheet.md)

#### व्यावहारिक सराव
```bash
# जलद प्रतिष्ठापन तपासणी
azd version

# आपले पहिले अनुप्रयोग तैनात करा
azd init --template todo-nodejs-mongo
azd up
```

**💡 अध्याय परिणाम**: AZD वापरून Azure वर सोपी वेब अॅप्लिकेशन यशस्वीरित्या तैनात करा

**✅ यशस्वी पडताळणी:**
```bash
# अध्याय 1 पूर्ण केल्यावर, आपण सक्षम असावे:
azd version              # स्थापित आवृत्ती दाखविते
azd init --template todo-nodejs-mongo  # प्रकल्प प्रारंभ करते
azd up                  # Azure मध्ये प्रस्थापित करते
azd show                # चालू असलेल्या अॅपचा URL दर्शवितो
# अॅप्लिकेशन ब्राउझरमध्ये उघडते आणि कार्य करते
azd down --force --purge  # संसाधने साफ करते
```

**📊 वेळ गुंतवणूक:** 30-45 मिनिटे  
**📈 नंतरची कौशल्य पातळी:** मूलभूत अॅप्लिकेशन्स स्वतंत्रपणे तैनात करू शकतो

---

### 🤖 अध्याय 2: AI-प्रथम विकास (AI विकसकांसाठी शिफारस केलेले)
**पूर्वअटी**: अध्याय 1 पूर्ण  
**कालावधी**: 1-2 तास  
**जटिलता**: ⭐⭐

#### तुम्ही काय शिकाल
- AZD सह Microsoft Foundry चा इंटीग्रेशन
- AI-शक्तीसेल अॅप्लिकेशन्सची तैनाती
- AI सेवा कॉन्फिगरेशन समजून घेणे

#### शिकण्याचे स्रोत
- **🎯 येथे सुरू करा**: [Microsoft Foundry इंटीग्रेशन](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI एजंट्स**: [AI एजंट्स मार्गदर्शक](docs/chapter-02-ai-development/agents.md) - AZD सह बुद्धिमान एजंट्स तैनात करा
- **📖 नमुने**: [AI मॉडेल तैनात](docs/chapter-02-ai-development/ai-model-deployment.md) - AI मॉडेल्सचे व्यवस्थापन करा
- **🛠️ कार्यशाळा**: [AI कार्यशाळा लॅब](docs/chapter-02-ai-development/ai-workshop-lab.md) - आपली AI सोल्यूशन्स AZD-तयार करा
- **🎥 संवादात्मक मार्गदर्शक**: [कार्यशाळा साहित्य](workshop/README.md) - ब्राउझर-आधारित शिक्षण MkDocs * DevContainer पर्यावरणासह
- **📋 टेम्प्लेट्स**: [Microsoft Foundry टेम्प्लेट्स](#कार्यशाळा-संसाधने)
- **📝 उदाहरणे**: [AZD तैनाती उदाहरणे](examples/README.md)

#### व्यावहारिक सराव
```bash
# आपले पहिले एआय अनुप्रयोग तैनात करा
azd init --template azure-search-openai-demo
azd up

# अतिरिक्त एआय टेम्पलेट्स वापरून पहा
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 अध्याय परिणाम**: RAG क्षमतांसह AI-शक्तीसेल चॅट अॅप्लिकेशन तैनात करा आणि कॉन्फिगर करा

**✅ यशस्वी पडताळणी:**
```bash
# अध्याय 2 नंतर, तुम्ही हे करू शकाल:
azd init --template azure-search-openai-demo
azd up
# AI चॅट इंटरफेसची चाचणी करा
# प्रश्न विचारा आणि स्रोतांसह AI-चालित उत्तरे मिळवा
# शोध एकत्रीकरण कार्य करतो का ते सत्यापित करा
azd monitor  # Application Insights मध्ये टेलीमेट्री दिसते याची तपासणी करा
azd down --force --purge
```

**📊 वेळ गुंतवणूक:** 1-2 तास  
**📈 नंतरची कौशल्य पातळी:** उत्पादन-तयार AI अॅप्लिकेशन्स तैनात व कॉन्फिगर करू शकतो  
**💰 खर्च जागरूकता:** $80-150/महिना विकास खर्च, $300-3500/महिना उत्पादन खर्च समजणे

#### 💰 AI तैनاتيंसाठी खर्च विचार

**विकास वातावरण (अंदाजे $80-150/महिना):**
- Microsoft Foundry मॉडेल्स (वापरानुसार पैसे): $0-50/महिना (टोकन वापरावर आधारित)
- AI शोध (मूलभूत स्तर): $75/महिना
- कंटेनर अॅप्स (खपती आधारित): $0-20/महिना
- संचयन (स्टँडर्ड): $1-5/महिना

**उत्पादन वातावरण (अंदाजे $300-3,500+/महिना):**
- Microsoft Foundry मॉडेल्स (सातत्यपूर्ण कामगिरीसाठी PTU): $3,000+/महिना किंवा उच्च खपतीसाठी पैसे वापरावर आधारित
- AI शोध (स्टँडर्ड स्तर): $250/महिना
- कंटेनर अॅप्स (समर्पित): $50-100/महिना
- अ‍ॅप्लिकेशन इन्साइट्स: $5-50/महिना
- संचयन (प्रीमियम): $10-50/महिना

**💡 खर्च ऑप्टिमायझेशन टिप्स:**
- शिकण्यासाठी मुक्त स्तराचे Microsoft Foundry मॉडेल्स वापरा (Azure OpenAI मध्ये 50,000 टोकन/महिना समाविष्ट)
- सक्रिय विकास न करता संसाधने मुक्त करण्यासाठी `azd down` चालवा
- सुरुवातीस खपतीवर आधारित बिलिंग वापरा, फक्त उत्पादनासाठी PTU वर त्यांना वाढवा
- तैनातीपूर्वी खर्च अंदाजासाठी `azd provision --preview` वापरा
- ऑटो-स्केलिंग सक्षम करा: फक्त प्रत्यक्ष वापरासाठी पैसे भरा

**खर्च निरीक्षण:**
```bash
# अंदाजित मासिक खर्च तपासा
azd provision --preview

# Azure Portal मध्ये वास्तविक खर्चांचे परीक्षण करा
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ अध्याय 3: कॉन्फिगरेशन आणि प्रमाणीकरण
**पूर्वअटी**: अध्याय 1 पूर्ण  
**कालावधी**: 45-60 मिनिटे  
**जटिलता**: ⭐⭐

#### तुम्ही काय शिकाल
- वातावरण कॉन्फिगरेशन आणि व्यवस्थापन
- प्रमाणीकरण आणि सुरक्षा सर्वोत्तम प्रथाः
- संसाधनांचे नामकरण आणि संघटना

#### शिकण्याचे स्रोत
- **📖 कॉन्फिगरेशन**: [कॉन्फिगरेशन मार्गदर्शक](docs/chapter-03-configuration/configuration.md) - वातावरणाची तयारी
- **🔐 सुरक्षा**: [प्रमाणीकरण नमुने आणि व्यवस्थापित ओळख](docs/chapter-03-configuration/authsecurity.md) - प्रमाणीकरण नमुने
- **📝 उदाहरणे**: [डेटाबेस अ‍ॅप उदाहरण](examples/database-app/README.md) - AZD डेटाबेस उदाहरणे

#### व्यावहारिक सराव
- अनेक वातावरणांचे कॉन्फिगर करणे (डेव्ह, स्टेजिंग, प्रॉड)
- व्यवस्थापित ओळख प्रमाणीकरण सेटअप करणे
- वातावरण-विशिष्ट कॉन्फिगरेशन लागू करणे

**💡 अध्याय परिणाम**: योग्य प्रमाणीकरण आणि सुरक्षेसह अनेक वातावरणे व्यवस्थापित करा

---

### 🏗️ अध्याय 4: कोड म्हणून पायाभूत सुविधा आणि तैनाती
**पूर्वअटी**: अध्याय 1-3 पूर्ण  
**कालावधी**: 1-1.5 तास  
**जटिलता**: ⭐⭐⭐

#### तुम्ही काय शिकाल
- प्रगत तैनाती नमुने
- Bicep सह पायाभूत सुविधा कोड
- संसाधन प्रोव्हिजनिंग धोरणं

#### शिकण्याचे स्रोत
- **📖 तैनाती**: [तैनात मार्गदर्शक](docs/chapter-04-infrastructure/deployment-guide.md) - पूर्ण वर्कफ्लो
- **🏗️ प्रोव्हिजनिंग**: [संसाधन प्रोव्हिजनिंग](docs/chapter-04-infrastructure/provisioning.md) - Azure संसाधन व्यवस्थापन
- **📝 उदाहरणे**: [कंटेनर अॅप उदाहरण](../../examples/container-app) - कंटेनरयुक्त तैनाती

#### व्यावहारिक सराव
- कस्टम Bicep टेम्प्लेट तयार करा
- मल्टी-सर्व्हिस अॅप्लिकेशन्स तैनात करा
- ब्लू-ग्रीन तैनाती धोरणे लागू करा

**💡 अध्याय परिणाम**: कस्टम पायाभूत साधनांच्या सहाय्याने जटिल मल्टी-सर्व्हिस अॅप्लिकेशन्स तैनात करा

---

### 🎯 अध्याय 5: मल्टी-एजंट AI सोल्यूशन्स (प्रगत)
**पूर्वअटी**: अध्याय 1-2 पूर्ण  
**कालावधी**: 2-3 तास  
**जटिलता**: ⭐⭐⭐⭐

#### तुम्ही काय शिकाल
- मल्टी-एजंट आर्किटेक्चर नमुने
- एजंट समन्वय आणि समन्वय प्रक्रिया
- उत्पादन-तयार AI तैनात

#### शिकण्याचे स्रोत
- **🤖 वैशिष्ट्यीकृत प्रकल्प**: [रिटेल मल्टी-एजंट सोल्यूशन](examples/retail-scenario.md) - पूर्ण अंमलबजावणी
- **🛠️ ARM टेम्प्लेट्स**: [ARM टेम्प्लेट पॅकेज](../../examples/retail-multiagent-arm-template) - एक-क्लिक तैनाती
- **📖 आर्किटेक्चर**: [मल्टी-एजंट समन्वय नमुने](docs/chapter-06-pre-deployment/coordination-patterns.md) - नमुने

#### व्यावहारिक सराव
```bash
# संपूर्ण किरकोळ मल्टी-एजंट सोल्युशन तैनात करा
cd examples/retail-multiagent-arm-template
./deploy.sh

# एजंट संरचना अन्विष्य करा
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 अध्याय परिणाम**: ग्राहक आणि साठा एजंटसह उत्पादन-तयार मल्टी-एजंट AI सोल्यूशन तैनात व व्यवस्थापित करा

---

### 🔍 अध्याय 6: पूर्व-तैनाती पडताळणी आणि नियोजन
**पूर्वअटी**: अध्याय 4 पूर्ण  
**कालावधी**: 1 तास  
**जटिलता**: ⭐⭐

#### तुम्ही काय शिकाल
- क्षमता नियोजन आणि संसाधन पडताळणी
- SKU निवडीचे धोरणे
- पूर्व-तपासणी आणि स्वयंचलन

#### शिकण्याचे स्रोत
- **📊 नियोजन**: [क्षमता नियोजन](docs/chapter-06-pre-deployment/capacity-planning.md) - संसाधन पडताळणी
- **💰 निवड**: [SKU निवड](docs/chapter-06-pre-deployment/sku-selection.md) - खर्च-प्रभावी विकल्प
- **✅ पडताळणी**: [पूर्व-तपासणी](docs/chapter-06-pre-deployment/preflight-checks.md) - स्वयंचलित स्क्रिप्ट्स

#### व्यावहारिक सराव
- क्षमता पडताळणी स्क्रिप्ट चालवा
- खर्चासाठी SKU निवड अनुकूल करा
- स्वयंचलित पूर्व-तैनाती तपासणी लागू करा

**💡 अध्याय परिणाम**: अंमलबजावणीपूर्वी तैनाती पडताळा आणि अनुकूल करा

---

### 🚨 अध्याय 7: समस्या निवारण आणि डीबगिंग
**पूर्वअटी**: कुठलाही तैनाती अध्याय पूर्ण  
**कालावधी**: 1-1.5 तास  
**जटिलता**: ⭐⭐

#### तुम्ही काय शिकाल
- पद्धतशीर डीबगिंग उपाय योजना
- सामान्य समस्या आणि उपाय
- AI-स्पेसिफिक समस्या निवारण

#### शिकण्याचे स्रोत
- **🔧 सामान्य समस्या**: [सामान्य समस्या](docs/chapter-07-troubleshooting/common-issues.md) - वारंवार विचारले जाणारे प्रश्न आणि उपाय
- **🕵️ डीबगिंग**: [डीबगिंग मार्गदर्शक](docs/chapter-07-troubleshooting/debugging.md) - टप्प्याटप्प्याने रणनीती
- **🤖 AI समस्या**: [AI-विशिष्ट समस्या निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI सेवा समस्या

#### व्यावहारिक सराव
- तैनात अयशस्वी होण्याचे निदान करा
- प्रमाणीकरण समस्या सोडा
- AI सेवा कनेक्टिव्हिटी डीबग करा

**💡 अध्याय परिणाम**: सामान्य तैनाती समस्या स्वतंत्रपणे निदान करा आणि सोडवा

---

### 🏢 अध्याय 8: उत्पादन आणि एंटरप्राइझ नमुने
**पूर्वअटी**: अध्याय 1-4 पूर्ण  
**कालावधी**: 2-3 तास  
**जटिलता**: ⭐⭐⭐⭐

#### तुम्ही काय शिकाल
- उत्पादन तैनाती रणनीती
- एंटरप्राइझ सुरक्षा नमुने
- देखरेख आणि खर्च ऑप्टिमायझेशन

#### शिकण्याचे स्रोत
- **🏭 उत्पादन**: [प्रॉडक्शन AI सर्वोत्तम पद्धती](docs/chapter-08-production/production-ai-practices.md) - एंटरप्राइझ पॅटर्न
- **📝 उदाहरणे**: [मायक्रोसर्व्हिसेस उदाहरण](../../examples/microservices) - क्लिष्ट आर्किटेक्चर
- **📊 निरीक्षण**: [अॅप्लिकेशन इन्साइट्स इंटिग्रेशन](docs/chapter-06-pre-deployment/application-insights.md) - निरीक्षण

#### व्यावहारिक सराव
- एंटरप्राइझ सुरक्षा पॅटर्नची अंमलबजावणी करा
- समग्र निरीक्षण सेट अप करा
- योग्य प्रशासनासह उत्पादनात तैनात करा

**💡 प्रकरण परिणाम:** संपूर्ण उत्पादन क्षमतांसह एंटरप्राइझ-तयार अॅप्लिकेशन्सची तैनाती करा

---

## 🎓 कार्यशाळा आढावा: हाताळणी शिकण्याचा अनुभव

> **⚠️ कार्यशाळेची स्थिती: सक्रिय विकास**  
> कार्यशाळेची सामग्री सध्या विकसित केली जात आहे व सुधारित केली जात आहे. मुख्य मॉड्यूल कार्यरत आहेत, परंतु काही प्रगत विभाग अपूर्ण आहेत. आम्ही सर्व सामग्री पूर्ण करण्यासाठी सक्रियपणे काम करत आहोत. [प्रगती ट्रॅक करा →](workshop/README.md)

### परस्परसंवादी कार्यशाळा सामग्री
**ब्राउझर-आधारित साधने आणि मार्गदर्शक व्यायामांसह व्यापक हाताळणी शिक्षण**

आमची कार्यशाळा सामग्री वरील प्रकरणधारित अभ्यासक्रमास पूरक अशी रचनाबद्ध, परस्परसंवादी शिकण्याचा अनुभव प्रदान करते. कार्यशाळा स्व-अभ्यास आणि प्रशिक्षक-नेतृत्वाखालील सत्रांसाठी डिझाइन केली आहे.

#### 🛠️ कार्यशाळेच्या वैशिष्ट्ये
- **ब्राउझर-आधारित इंटरफेस**: संपूर्ण MkDocs-शक्तीमान कार्यशाळा शोध, कॉपी आणि थीम वैशिष्ट्यांसह
- **GitHub Codespaces इंटिग्रेशन**: एक-क्लिक विकास पर्यावरण सेटअप
- **रचनाबद्ध शिक्षण मार्ग**: ८-मॉड्यूल मार्गदर्शित व्यायाम (एकूण ३-४ तास)
- **प्रगत पद्धतशास्त्र**: परिचय → निवड → पडताळणी → विघटन → संरचना → सानुकूलन → विघटन → समारोप
- **परस्परसंवादी DevContainer पर्यावरण**: पूर्व-संरचित साधने आणि अवलंबन

#### 📚 कार्यशाळा मॉड्यूल रचना
कार्यशाळा एका **८-मॉड्यूल प्रगत पद्धतशास्त्राचे पालन करते**, जी तुम्हाला शोधापासून तैनाती निपुणतेपर्यंत नेत आहे:

| मॉड्यूल | विषय | तुम्ही काय कराल | कालावधी |
|---------|-------|-----------------|----------|
| **0. परिचय** | कार्यशाळा आढावा | शिकण्याचे उद्दिष्ट, पूर्वअट व कार्यशाळा रचना समजून घ्या | १५ मिनीटे |
| **1. निवड** | साचा शोध | AZD साचा एक्सप्लोर करा व तुमच्या परिस्थितीसाठी योग्य AI साचा निवडा | २० मिनीटे |
| **2. पडताळणी** | तैनात आणि सत्यापन | `azd up` वापरून साचा तैनात करा व अवसंरचना कार्यरत आहे का ते सत्यापित करा | ३० मिनीटे |
| **3. विघटन** | रचना समजून घ्या | GitHub Copilot वापरून साचा आर्किटेक्चर, बाइसेप फायली आणि कोड संघटनेचा अभ्यास करा | ३० मिनीटे |
| **4. संरचना** | azure.yaml सखोल | `azure.yaml` संरचना, lifecycle hooks आणि पर्यावरण चल समजून घ्या | ३० मिनीटे |
| **5. सानुकूलन** | तुमच्यासाठी बनवा | AI शोध सक्षम करा, ट्रेसिंग, मूल्यमापन व तुमच्या परिस्थितीनुसार सानुकूल करा | ४५ मिनीटे |
| **6. विघटन** | साफसफाई | `azd down --purge` वापरून संसाधने सुरक्षितपणे हटवा | १५ मिनीटे |
| **7. समारोप** | पुढील पावले | यश व मुख्य संकल्पना पुनरावलोकन करा व तुमचा शिकण्याचा प्रवास सुरू ठेवा | १५ मिनीटे |

**कार्यशाळा प्रवाह:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 कार्यशाळा सुरू करणे
```bash
# पर्याय 1: GitHub Codespaces (शिफारस केलेले)
# रिपॉझिटरी मध्ये "Code" → "Create codespace on main" वर क्लिक करा

# पर्याय 2: स्थानिक विकास
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md मध्ये सेटअप सूचना अनुसरा
```

#### 🎯 कार्यशाळा शिकण्याचे परिणाम
कार्यशाळा पूर्ण करून सहभागी:
- **उत्पादन AI अनुप्रयोग तैनात करतील**: Microsoft Foundry सेवा वापरून AZD वापरा
- **मल्टी-एजंट आर्किटेक्चरमध्ये तज्ञ बनेल**: समन्वित AI एजंट सोल्यूशन्स अंमलात आणा
- **सुरक्षा सर्वोत्तम पद्धती अंमलात आणतील**: प्रमाणीकरण आणि प्रवेश नियंत्रण संरचना करा
- **परिमाणासाठी अनुकूल करा**: खर्च-प्रभावी, कार्यक्षम तैनती डिझाइन करा
- **तैनतीतील समस्या सोडवतील**: सामान्य समस्या स्वावलंबीपणे निराकरण करा

#### 📖 कार्यशाळा संसाधने
- **🎥 परस्परसंवादी मार्गदर्शक**: [कार्यशाळा सामग्री](workshop/README.md) - ब्राउझर-आधारित शिकण्याचे वातावरण
- **📋 मॉड्यूलनिहाय सूचना**:
  - [0. परिचय](workshop/docs/instructions/0-Introduction.md) - कार्यशाळा आढावा आणि उद्दिष्टे
  - [1. निवड](workshop/docs/instructions/1-Select-AI-Template.md) - AI साचा शोधा आणि निवडा
  - [2. पडताळणी](workshop/docs/instructions/2-Validate-AI-Template.md) - साचा तैनात करा व तपासा
  - [3. विघटन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - साचा आर्किटेक्चर अभ्यासा
  - [4. संरचना](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml मध्ये पारंगत व्हा
  - [5. सानुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) - तुमच्या परिस्थितीसाठी सानुकूल करा
  - [6. विघटन](workshop/docs/instructions/6-Teardown-Infrastructure.md) - संसाधने साफ करा
  - [7. समारोप](workshop/docs/instructions/7-Wrap-up.md) - पुनरावलोकन व पुढील पावले
- **🛠️ AI कार्यशाळा प्रयोगशाळा**: [AI कार्यशाळा प्रयोगशाळा](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-केंद्रित व्यायाम
- **💡 जलद प्रारंभ**: [कार्यशाळा सेटअप मार्गदर्शक](workshop/README.md#quick-start) - पर्यावरण संरचना

**परफेक्ट साठी**: कॉर्पोरेट प्रशिक्षण, विद्यापीठ कोर्स, स्व-अभ्यास, आणि विकसक बूटकॅम्प्स.

---

## 📖 सखोल नीटनेटका: AZD क्षमता

मूलभूत गोष्टींपलीकडे, AZD उत्पादन तैनतीसाठी शक्तिशाली वैशिष्ट्ये प्रदान करतो:

- **साचा-आधारित तैनती** - सामान्य अनुप्रयोग पॅटर्नसाठी पूर्वनिर्मित साचे वापरा
- **कोड म्हणून इन्फ्रास्ट्रक्चर** - बाइसेप किंवा टेराफॉर्म वापरून Azure संसाधने व्यवस्थापित करा  
- **एकात्मिक कार्यप्रवाह** - सहजपणे तैनात करा, तैनातीसाठी आणि निरीक्षणासाठी एकत्रित करा
- **विकासक-अनुकूल** - विकासक उत्पादकता आणि अनुभवासाठी अनुकूलित

### **AZD + Microsoft Foundry: AI तैनतीसाठी परिपूर्ण**

**AI सोल्यूशन्ससाठी AZD का?** AZD AI विकसकांना भेडसावणाऱ्या शीर्ष आव्हानांना सामोरे जाते:

- **AI-तयार साचे** - Microsoft Foundry मॉडेल्स, Cognitive Services, आणि ML वर्कलोडसाठी पूर्व-संरचित साचे
- **सुरक्षित AI तैनती** - AI सेवा, API की आणि मॉडेल एंडपॉईंटसाठी अंगभूत सुरक्षा पॅटर्न  
- **उत्पादन AI पॅटर्न** - स्केलेबल, खर्च-प्रभावी AI अनुप्रयोग तैनतीसाठी सर्वोत्तम पद्धती
- **एंड-टू-एंड AI कार्यप्रवाह** - मॉडेल विकासापासून योग्य निरीक्षणासह उत्पादन तैनातीपर्यंत
- **खर्च ऑप्टिमायझेशन** - AI वर्कलोडसाठी स्मार्ट संसाधन वाटप आणि स्केलिंग धोरणे
- **Microsoft Foundry इंटिग्रेशन** - Microsoft Foundry मॉडेल कॅटलॉग आणि एंडपॉईंटसह सलग कनेक्शन

---

## 🎯 साचे आणि उदाहरणे लायब्ररी

### वैशिष्ट्यीकृत: Microsoft Foundry साचे
**AI अनुप्रयोग तैनात करत असाल तर येथे प्रारंभ करा!**

> **नोट:** हे साचे विविध AI पॅटर्न दर्शवितात. काही Azure Samples आहेत, काही स्थानिक अंमलबजावण्या.

| साचा | प्रकरण | गुंतागुंत | सेवा | प्रकार |
|-------|---------|------------|-------|--------|
| [**AI चॅटसह प्रारंभ करा**](https://github.com/Azure-Samples/get-started-with-ai-chat) | प्रकरण २ | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | बाह्य |
| [**AI एजंट्ससह प्रारंभ करा**](https://github.com/Azure-Samples/get-started-with-ai-agents) | प्रकरण २ | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | बाह्य |
| [**Azure Search + OpenAI डेमो**](https://github.com/Azure-Samples/azure-search-openai-demo) | प्रकरण २ | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | बाह्य |
| [**OpenAI चॅट अॅप क्विकस्टार्ट**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | प्रकरण २ | ⭐ | AzureOpenAI + Container Apps + Application Insights | बाह्य |
| [**एजंट OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | प्रकरण ५ | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | बाह्य |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | प्रकरण ८ | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | बाह्य |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | प्रकरण ५ | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **स्थानिक** |

### वैशिष्ट्यीकृत: पूर्ण शिकण्याची परिस्थिती
**शिकवणी प्रकरणांसाठी उत्पादन-तयार अनुप्रयोग साचे**

| साचा | शिकण्याचे प्रकरण | गुंतागुंत | मुख्य शिकवणी |
|-------|-----------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | प्रकरण २ | ⭐ | मूलभूत AI तैनाती पॅटर्न |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | प्रकरण २ | ⭐⭐ | Azure AI Search सह RAG अंमलबजावणी |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | प्रकरण ४ | ⭐⭐ | दस्तऐवज बुद्धिमत्ता समाकलन |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | प्रकरण ५ | ⭐⭐⭐ | एजंट फ्रेमवर्क आणि फंक्शन कॉलिंग |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | प्रकरण ८ | ⭐⭐⭐ | एंटरप्राइझ AI ऑर्केस्ट्रेशन |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | प्रकरण ५ | ⭐⭐⭐⭐ | ग्राहक आणि इन्व्हेंटरी एजंटसह मल्टी-एजंट आर्किटेक्चर |

### उदाहरणाच्या प्रकारानुसार शिकणे

> **📌 स्थानिक विरुद्ध बाह्य उदाहरणे:**  
> **स्थानिक उदाहरणे** (या रेपोमध्ये) = लगेच वापरासाठी तयार  
> **बाह्य उदाहरणे** (Azure Samples) = लिंक केलेल्या रेपॉजिटरीजमधून क्लोन करा

#### स्थानिक उदाहरणे (तयार वापरासाठी)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM साच्यांसह पूर्ण उत्पादन-तयार अंमलबजावणी
  - मल्टी-एजंट आर्किटेक्चर (ग्राहक + इन्व्हेंटरी एजंट)
  - व्यापक निरीक्षण आणि मूल्यमापन
  - एक-क्लिक तैनात ARM साच्यासह

#### स्थानिक उदाहरणे - कंटेनर अनुप्रयोग (प्रकरणे २-५)
**या रेपॉमध्ये व्यापक कंटेनर तैनाती उदाहरणे:**
- [**कंटेनर अॅप उदाहरणे**](examples/container-app/README.md) - कंटेनरयुक्त तैनातीसाठी संपूर्ण मार्गदर्शक
  - [साधे Flask API](../../examples/container-app/simple-flask-api) - स्केल-टू-झीरोसह मूलभूत REST API
  - [मायक्रोसर्व्हिसेस आर्किटेक्चर](../../examples/container-app/microservices) - उत्पादन-तयार मल्टी-सर्व्हिस तैनाती
  - क्विक स्टार्ट, उत्पादन आणि प्रगत तैनाती पॅटर्न्स
  - निरीक्षण, सुरक्षा आणि खर्च ऑप्टिमायझेशन मार्गदर्शन

#### बाह्य उदाहरणे - साधे अनुप्रयोग (प्रकरणे १-२)
**या Azure Samples रेपॉजिटरीज क्लोन करा आणि प्रारंभ करा:**
- [साधे वेब अॅप - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - मूलभूत तैनाती पॅटर्न
- [स्टॅटिक वेबसाइट - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - स्थिर सामग्री तैनात
- [कंटेनर अॅप - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API तैनात

#### बाह्य उदाहरणे - डेटाबेस समाकलन (प्रकरणे ३-४)  
- [डेटाबेस अॅप - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - डेटाबेस कनेक्टिव्हिटी पॅटर्न
- [फंक्शन्स + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - सर्व्हरलेस डेटा कार्यप्रवाह

#### बाह्य उदाहरणे - प्रगत पॅटर्न (प्रकरणे ४-८)
- [Java मायक्रोसर्व्हिसेस](https://github.com/Azure-Samples/java-microservices-aca-lab) - मल्टी-सर्व्हिस आर्किटेक्चर
- [कंटेनर अॅप्स जॉब्स](https://github.com/Azure-Samples/container-apps-jobs) - बॅकग्राऊंड प्रोसेसिंग  
- [एंटरप्राइझ ML पाइपलाइन](https://github.com/Azure-Samples/mlops-v2) - उत्पादन-तयार ML पॅटर्न

### बाह्य साचा संग्रह
- [**अधिकृत AZD साचा गॅलरी**](https://azure.github.io/awesome-azd/) - अधिकृत आणि समुदाय साच्यांचे क्यूरेटेड संग्रह
- [**Azure Developer CLI साचे**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn साचा दस्तऐवजीकरण
- [**उदाहरणे निर्देशिका**](examples/README.md) - स्थानिक शिकण्याची उदाहरणे तपशीलवार समजुतींसह

---

## 📚 शिकण्याची साधने आणि संदर्भ

### जलद संदर्भ
- [**कमांड चीट शीट**](resources/cheat-sheet.md) - प्रकरणानुसार आयोजित आवश्यक azd कमांड्स
- [**परिभाषा संग्रह**](resources/glossary.md) - Azure आणि azd संज्ञाशास्त्र  
- [**वारंवार विचारले जाणारे प्रश्न**](resources/faq.md) - शिकण्याच्या प्रकरणानुसार सामान्य प्रश्न
- [**अभ्यास मार्गदर्शक**](resources/study-guide.md) - व्यापक सराव व्यायाम

### हाताळणी कार्यशाळा
- [**AI कार्यशाळा प्रयोगशाळा**](docs/chapter-02-ai-development/ai-workshop-lab.md) - तुम्हाला AI सोल्यूशन्स AZD-तैनात करण्यायोग्य बनवा (२-३ तास)
- [**परस्परसंवादी कार्यशाळा**](workshop/README.md) - ८-मॉड्यूल मार्गदर्शित व्यायाम MkDocs आणि GitHub Codespaces соबत
  - अनुकरण: परिचय → निवड → पडताळणी → विघटन → संरचना → सानुकूलन → विघटन → समारोप

### बाह्य शिकण्याची साधने
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### आपल्या संपादकासाठी AI एजंट कौशल्ये
- [**skills.sh वरील Microsoft Azure कौशल्ये**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, वितरण, निदान, खर्च ऑप्टिमायझेशन आणि बरेच काहीसाठी 37 खुले एजंट कौशल्ये. GitHub Copilot, Cursor, Claude Code किंवा कोणत्याही समर्थित एजंटमध्ये स्थापित करा:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 जलद समस्या निवारण मार्गदर्शिका

**नवशिक्यांना येणाऱ्या सामान्य समस्या आणि त्वरित उपाय:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# AZD प्रथम स्थापित करा
# विंडोज (पॉवरशेल):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# लिनक्स:
curl -fsSL https://aka.ms/install-azd.sh | bash

# प्रतिष्ठापनाची पुष्टी करा
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" किंवा "Subscription not set"</strong></summary>

```bash
# उपलब्ध सदस्यता यादी करा
az account list --output table

# डीफॉल्ट सदस्यता सेट करा
az account set --subscription "<subscription-id-or-name>"

# AZD वातावरणासाठी सेट करा
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# पडताळणी करा
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" किंवा "Quota exceeded"</strong></summary>

```bash
# वेगवेगळे Azure प्रदेश वापरून पाहा
azd env set AZURE_LOCATION "westus2"
azd up

# किंवा विकासात लहान SKUs वापरा
# infra/main.parameters.json संपादित करा:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" मधून अर्ध्यावर अयशस्वी होणे</strong></summary>

```bash
# पर्याय 1: साफ करा आणि पुनःप्रयत्न करा
azd down --force --purge
azd up

# पर्याय 2: केवळ इन्फ्रास्ट्रक्चर दुरुस्त करा
azd provision

# पर्याय 3: सविस्तर स्थिती तपासा
azd show

# पर्याय 4: Azure Monitor मधील लॉग तपासा
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" किंवा "Token expired"</strong></summary>

```bash
# पुन्हा प्रमाणीकरण करा
az logout
az login

azd auth logout
azd auth login

# प्रमाणीकरणाची पडताळणी करा
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" किंवा नावांमधील संघर्ष</strong></summary>

```bash
# AZD अद्वितीय नावे तयार करते, परंतु जर संघर्ष झाला:
azd down --force --purge

# तर नवीन पर्यावरणासह पुन्हा प्रयत्न करा
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ टेम्पलेट वितरण फार वेळ घेत आहे</strong></summary>

**सामान्य प्रतीक्षा वेळ:**
- साधे वेब अॅप: ५-१० मिनिटे
- डेटाबेससह अॅप: १०-१५ मिनिटे
- AI अनुप्रयोग: १५-२५ मिनिटे (OpenAI प्रोव्हिजनिंग हळू आहे)

```bash
# प्रगती तपासा
azd show

# 30 मिनिटांपेक्षा जास्त अडकल्यास, Azure Portal तपासा:
azd monitor
# अयशस्वी तैनाती शोधा
```
</details>

<details>
<summary><strong>❌ "Permission denied" किंवा "Forbidden"</strong></summary>

```bash
# आपल्या Azure भूमिकेची तपासणी करा
az role assignment list --assignee $(az account show --query user.name -o tsv)

# आपल्याला किमान "Contributor" भूमिका आवश्यक आहे
# आपल्या Azure प्रशासकाला विनंती करा की त्यांनी दिली पाहिजे:
# - Contributor (संसाधनांसाठी)
# - User Access Administrator (भूमिका वितरणासाठी)
```
</details>

<details>
<summary><strong>❌ तैनात केलेल्या अनुप्रयोगाचा URL शोधू शकत नाही</strong></summary>

```bash
# सर्व सेवा एंडपॉइंट दर्शवा
azd show

# किंवा Azure पोर्टल उघडा
azd monitor

# विशिष्ट सेवा तपासा
azd env get-values
# *_URL व्हेरिएबल शोधा
```
</details>

### 📚 पूर्ण समस्या निवारण संसाधने

- **सामान्य समस्या मार्गदर्शिका:** [सविस्तर उपाय](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-विशिष्ट समस्या:** [AI समस्या निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **डिबगिंग मार्गदर्शिका:** [पायरी-दर-पायरी डिबगिंग](docs/chapter-07-troubleshooting/debugging.md)
- **मदत घ्या:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 अभ्यासक्रम पूर्णता व प्रमाणपत्र

### प्रगती ट्रॅकिंग
प्रत्येक अध्यायामधील आपली शिकण्याची प्रगती ट्रॅक करा:

- [ ] **अध्याय 1**: पाया आणि जलद प्रारंभ ✅
- [ ] **अध्याय 2**: AI-प्रथम विकास ✅  
- [ ] **अध्याय 3**: कॉन्फिगरेशन आणि प्रमाणीकरण ✅
- [ ] **अध्याय 4**: कोड म्हणून पायाभूत सुविधा व वितरण ✅
- [ ] **अध्याय 5**: मल्टी-एजंट AI उपाय ✅
- [ ] **अध्याय 6**: पूर्व-वितरण पडताळणी आणि नियोजन ✅
- [ ] **अध्याय 7**: समस्या निवारण आणि डिबगिंग ✅
- [ ] **अध्याय 8**: उत्पादन आणि एंटरप्राइझ पॅटर्न्स ✅

### शिक्षणाची पुष्टी
प्रत्येक अध्याय पूर्ण केल्यानंतर, आपण आपले ज्ञान तपासा:
1. **व्यावहारिक सराव**: अध्यायातील हँड्स-ऑन वितरण पूर्ण करा
2. **ज्ञान तपासणी**: आपल्या अध्यायाच्या FAQ विभागाची समीक्षा करा
3. **समुदाय चर्चा**: Azure Discord मध्ये आपला अनुभव शेअर करा
4. **पुढील अध्याय**: पुढील जटिलता स्तरावर जा

### अभ्यासक्रम पूर्णता चे फायदे
सर्व अध्याय पूर्ण केल्यावर, आपल्याला मिळेल:
- **उत्पादनाचा अनुभव**: प्रत्यक्ष AI अनुप्रयोग Azure वर तैनात केलेले
- **व्यावसायिक कौशल्ये**: एंटरप्राइझ-तयार वितरण क्षमता  
- **समुदाय मान्यता**: Azure विकसक कुटुंबाचा सक्रिय सदस्य
- **करिअर प्रगती**: मागणी असलेली AZD आणि AI वितरण कौशल्ये

---

## 🤝 समुदाय आणि समर्थन

### मदत आणि समर्थन मिळवा
- **तांत्रिक समस्या:** [बग रिपोर्ट करा आणि वैशिष्ट्ये विनंती करा](https://github.com/microsoft/azd-for-beginners/issues)
- **शिकण्याचे प्रश्न:** [Microsoft Azure Discord समुदाय](https://discord.gg/microsoft-azure) आणि [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-विशिष्ट मदत:** [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) मध्ये सहभागी व्हा
- **दस्तऐवज:** [औपचारिक Azure Developer CLI दस्तऐवज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord कडून समुदाय अंतर्दृष्टी

**#Azure चॅनेल मधील अलीकडील मतदान निकाल:**
- **४५%** विकसक AI वर्कलोडसाठी AZD वापरू इच्छितात
- **मुख्य आव्हाने**: मल्टी-सर्व्हिस वितरण, क्रेडेन्शियल व्यवस्थापन, उत्पादन तयारपणा  
- **सर्वाधिक विनंती केलेले**: AI-विशिष्ट टेम्पलेट्स, समस्या निवारण मार्गदर्शिका, सर्वोत्तम पद्धती

**आमच्या समुदायात सहभागी व्हा:**
- आपले AZD + AI अनुभव शेअर करा आणि मदत मिळवा
- नवीन AI टेम्पलेट्सचे लवकर पाऊल पाहा
- AI वितरण सर्वोत्तम पद्धतींना मदत करा
- भविष्याचा AI + AZD फिचर विकास प्रभावित करा

### अभ्यासक्रमात योगदान देणे
आपले योगदान स्वागतार्ह आहे! कृपया आमचा [योगदान मार्गदर्शक](CONTRIBUTING.md) वाचा:
- **सामग्री सुधारणा:** विद्यमान अध्याय आणि उदाहरणे सुधारा
- **नवीन उदाहरणे:** प्रत्यक्ष विश्वातील परिदृश्ये आणि टेम्पलेट्स जोडा  
- **भाषांतर:** बहुभाषिक समर्थन राखण्यात मदत करा
- **बग रिपोर्ट:** अचूकता आणि स्पष्टता सुधारित करा
- **समुदाय मानके:** आमच्या समावेशक समुदाय मार्गदर्शकांचे पालन करा

---

## 📄 अभ्यासक्रम माहिती

### परवाना
हा प्रकल्प MIT परवाना अंतर्गत सादर केला आहे - सविस्तर माहितीसाठी [LICENSE](../../LICENSE) फाइल पहा.

### संबंधित Microsoft शिकण्याचे संसाधने

आमचा संघ इतर व्यापक शिकण्यासाठीचे अभ्यासक्रम तयार करतो:

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

## 🗺️ कोर्स नेव्हिगेशन

**🚀 शिकायला तयार आहात का?**

**नवसाक्षर**: [अध्याय 1: पाया आणि जलद प्रारंभ](#-chapter-1-foundation--quick-start) पासून सुरू करा  
**एआय विकासक**: [अध्याय 2: एआय-प्रथम विकास](#-chapter-2-ai-first-development-recommended-for-ai-developers) कडे थेट जा  
**अनुभवी विकासक**: [अध्याय 3: संरचना आणि प्रमाणीकरण](#️-chapter-3-configuration--authentication) पासून सुरू करा

**पुढील पावले**: [अध्याय 1 सुरू करा - AZD मूलभूत](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित केला आहे. आम्ही अचूकतेसाठी प्रयत्नशील आहोत, तरी कृपया ध्यानात घ्या की स्वयंचलित भाषांतरांमध्ये चुका किंवा अचूकतेच्या त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या स्थानिक भाषेत अधिकृत स्रोत समजला पाहिजे. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतर शिफारसीय आहे. या भाषांतराचा वापर केल्यामुळे उद्भवलेल्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थ लावण्याबद्दल आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->