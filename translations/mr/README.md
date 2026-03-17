# AZD नवशिक्यांसाठी: एक संरचित शिक्षण प्रवास

![AZD-for-beginners](../../translated_images/mr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### स्वयंचलित भाषांतर (नेहमी अद्ययावत)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[अरेबिक](../ar/README.md) | [बंगाली](../bn/README.md) | [बल्गेरियन](../bg/README.md) | [बर्मी (म्यानमार)](../my/README.md) | [चिनी (सोपं)](../zh-CN/README.md) | [चिनी (परंपरागत, हॉंगकॉग)](../zh-HK/README.md) | [चिनी (परंपरागत, मकावु)](../zh-MO/README.md) | [चिनी (परंपरागत, तैवान)](../zh-TW/README.md) | [क्रोएशियन](../hr/README.md) | [चेक](../cs/README.md) | [डॅनिश](../da/README.md) | [डच](../nl/README.md) | [इस्टोनियन](../et/README.md) | [फिन्निश](../fi/README.md) | [फ्रेंच](../fr/README.md) | [जर्मन](../de/README.md) | [ग्रीक](../el/README.md) | [हेब्रू](../he/README.md) | [हिंदी](../hi/README.md) | [हंगेरियन](../hu/README.md) | [इंडोनेशियन](../id/README.md) | [इटालियन](../it/README.md) | [जपानी](../ja/README.md) | [कन्नड](../kn/README.md) | [कोरियन](../ko/README.md) | [लिथुआनियन](../lt/README.md) | [मलय](../ms/README.md) | [मल्याळम](../ml/README.md) | [मराठी](./README.md) | [नेपाली](../ne/README.md) | [नायजेरियन पिजिन](../pcm/README.md) | [नॉर्वेजियन](../no/README.md) | [फारसी (पर्शियन)](../fa/README.md) | [पोलिश](../pl/README.md) | [पुर्तगाळी (ब्राझील)](../pt-BR/README.md) | [पुर्तगाळी (पोर्तुगीज)](../pt-PT/README.md) | [पंजाबी (गुरमुखी)](../pa/README.md) | [रोमानीयन](../ro/README.md) | [रशियन](../ru/README.md) | [सर्बियन (सिरिलिक)](../sr/README.md) | [स्लोव्हाक](../sk/README.md) | [स्लोव्हेनियन](../sl/README.md) | [स्पॅनिश](../es/README.md) | [स्वाहिली](../sw/README.md) | [स्वीडिश](../sv/README.md) | [टगालोग (फिलिपिनो)](../tl/README.md) | [तमिळ](../ta/README.md) | [तेलुगू](../te/README.md) | [थाई](../th/README.md) | [तुर्किश](../tr/README.md) | [युक्रेनीयन](../uk/README.md) | [उर्दू](../ur/README.md) | [व्हिएतनामी](../vi/README.md)

> **स्थानिकपणे क्लोन करणे आवडते?**
>
> या रिपॉझिटरीमध्ये ५०+ भाषा अनुवाद आहेत जे डाउनलोड आकार मोठा करतात. अनुवादांशिवाय क्लोन करण्यासाठी, sparse checkout वापरा:
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
> यामुळे आपण कोर्स पूर्ण करण्यासाठी आवश्यक सर्व काही जलद डाउनलोड करू शकता.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 आज azd मध्ये काय नवीन आहे

Azure Developer CLI पारंपारिक वेब अॅप आणि API पेक्षा मोठा झाला आहे. आज, azd हे Azure वर **कुठल्याही** अॅप्लिकेशनची तैनात करण्यासाठी एकमेव टूल आहे – ज्यात AI-शक्तिमान अॅप्लिकेशन्स आणि बुद्धिमान एजंट्स यांचा समावेश आहे.

याचा तुमच्यासाठी असा अर्थ आहे:

- **AI एजंट आता प्रथम श्रेणीचे azd कार्यभार आहेत.** आपण आधीपासून परिचित असलेल्या `azd init` → `azd up` वर्कफ्लो वापरून AI एजंट प्रकल्प सुरू, तैनात आणि व्यवस्थापित करू शकता.
- **Microsoft Foundry एकत्रीकरण** मॉडेल तैनाती, एजंट होस्टिंग आणि AI सेवा कॉन्फिगरेशन थेट azd टेम्प्लेट इकोसिस्टममध्ये आणते.
- **कोर वर्कफ्लो बदलेला नाही.** तुम्ही todo अॅप, माइक्रोसर्व्हिस, किंवा बहु-एजंट AI सोल्यूशन तैनात करत असाल, कमांड्स एकसारख्या आहेत.

जर तुम्ही आधी azd वापरलात, तर AI सपोर्ट ही एक नैसर्गिक विस्तार आहे – वेगळे टूल किंवा प्रगत ट्रॅक नाही. नवीन सुरुवात करत असल्यास, तुम्ही एकच वर्कफ्लो शिकाल जो सर्व कामांसाठी उपयुक्त आहे.

---

## 🚀 Azure Developer CLI (azd) म्हणजे काय?

**Azure Developer CLI (azd)** हे एक विकसक-मैत्रीपूर्ण कमांड-लाइन टूल आहे जे Azure वर अॅप्लिकेशन्स तैनाती करणे सोपे करते. अनेक Azure संसाधने मॅन्युअली तयार करण्याऐवजी तुम्ही एका कमांडने संपूर्ण अॅप्लिकेशन्स तैनात करू शकता.

### `azd up` चा जादू

```bash
# हा एकच आदेश सर्वकाही करतो:
# ✅ सर्व Azure संसाधने तयार करतो
# ✅ नेटवर्किंग आणि सुरक्षा कॉन्फिगर करतो
# ✅ तुमच्या अनुप्रयोगाचा कोड तयार करतो
# ✅ Azure वर तैनात करतो
# ✅ तुम्हाला कार्यरत URL देतो
azd up
```

**जोपर्यंत तुमचा उपयोग आहे!** Azure पोर्टलवर क्लिक करायची गरज नाही, कॉम्प्लेक्स ARM टेम्प्लेट प्रथम शिकायची गरज नाही, मॅन्युअल कॉन्फिगरेशन नाही – फक्त Azure वर काम करणारे अॅप्लिकेशन्स.

---

## ❓ Azure Developer CLI आणि Azure CLI मध्ये फरक काय?

हे नवशिक्यांकडून सर्वात जास्त विचारले जाणारे प्रश्न आहे. याचे सोपे उत्तर असा आहे:

| वैशिष्ट्य | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **उद्दिष्ट** | वैयक्तिक Azure संसाधने व्यवस्थापित करा | संपूर्ण अॅप्लिकेशन्स तैनात करा |
| **माइंडसेट** | इन्फ्रास्ट्रक्चर-केंद्रित | अॅप्लिकेशन-केंद्रित |
| **उदाहरण** | `az webapp create --name myapp...` | `azd up` |
| **शिकण्याची अवस्था** | Azure सेवा जाणून असणे आवश्यक | फक्त तुमच्या अॅपची माहिती |
| **सर्वोत्तम कोणासाठी** | DevOps, इन्फ्रास्ट्रक्चर | विकसक, प्रोटोटायपिंग |

### सोपी तुलना

- **Azure CLI** म्हणजे घर बांधण्यासाठी आवश्यक सगळे उपकरणे – हातोड्या, आरे, मेणबत्त्या. तुम्ही काहीही बांधू शकता, पण बांधकाम माहिती असणे आवश्यक आहे.
- **Azure Developer CLI** म्हणजे ठेकेदार भाड्याने घेणे – तुम्ही काय हवे ते सांगता, ते बांधकाम सांभाळतात.

### कोणत्या वेळी कोणता वापरावा

| परिस्थिती | हे वापरा |
|----------|----------|
| "माझे वेब अॅप लवकर तैनात करायचे आहे" | `azd up` |
| "मला फक्त स्टोरेज अकाऊंट तयार करायचा आहे" | `az storage account create` |
| "मी पूर्ण AI अॅप्लिकेशन बनवत आहे" | `azd init --template azure-search-openai-demo` |
| "मला एखाद्या विशिष्ट Azure संसाधना डिबग करायची आहे" | `az resource show` |
| "मला मिनिटांत उत्पादन-तयार तैनात हवे आहे" | `azd up --environment production` |

### ते एकत्र काम करतात!

AZD अंतर्गत Azure CLI वापरते. तुम्ही दोन्ही वापरू शकता:
```bash
# AZD वापरून तुमचे अॅप तैनात करा
azd up

# नंतर Azure CLI वापरून विशिष्ट संसाधने सूक्ष्मरित्या समायोजित करा
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD मध्ये टेम्प्लेट शोधा

शून्यापासून सुरू करू नका! **Awesome AZD** हा तयार-तैनातीसाठी समुदायाचा संग्रह आहे:

| संसाधन | वर्णन |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | एका क्लिकने २००+ टेम्प्लेट ब्राउझ करा आणि तैनात करा |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | तुमचा टेम्प्लेट समुदायाला द्या |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | स्टार करा आणि स्रोत एक्सप्लोर करा |

### लोकप्रिय AI टेम्प्लेट्स Awesome AZD मधून

```bash
# Microsoft Foundry मॉडेल्स + AI Search सह RAG चॅट
azd init --template azure-search-openai-demo

# जलद AI चॅट अनुप्रयोग
azd init --template openai-chat-app-quickstart

# Foundry Agents सह AI एजंट्स
azd init --template get-started-with-ai-agents
```

---

## 🎯 ३ पावलांमध्ये सुरुवात करा

### पाऊल १: AZD स्थापित करा (२ मिनिटे)

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

### पाऊल २: Azure मध्ये लॉगिन करा

```bash
azd auth login
```

### पाऊल ३: तुमचे पहिले अॅप तैनात करा

```bash
# टेम्पलेटमधून प्रारंभ करा
azd init --template todo-nodejs-mongo

# Azure वर तैनात करा (सर्वकाही तयार करते!)
azd up
```

**🎉 इतकंच!** तुमचे अॅप आता Azure वर ऑनलाइन आहे.

### साफसफाई (काळजी घ्या!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 हा कोर्स कसा वापरायचा

हा कोर्स **प्रगतीशील शिक्षण** साठी डिझाइन केला आहे - जिथून तुम्हाला सोयीचे वाटते तिथून सुरू करा आणि पुढे जा:

| तुमचा अनुभव | येथे सुरुवात करा |
|-----------------|------------|
| **Azure मध्ये पूर्ण नवीन** | [प्रकरण 1: मूलभूत](../..) |
| **Azure माहिती आहे, AZD नवीन आहे** | [प्रकरण 1: मूलभूत](../..) |
| **AI अॅप्लिकेशन तैनात करायचे आहे** | [प्रकरण 2: AI-प्रथम विकास](../..) |
| **हाताने प्रॅक्टिस करायची आहे** | [🎓 इंटरएक्टिव वर्कशॉप](workshop/README.md) - 3-4 तासांचे मार्गदर्शित लॅब |
| **उत्पादनासाठी नमुने पाहिजेत** | [प्रकरण 8: उत्पादन आणि एंटरप्राइझ](../..) |

### जलद सेटअप

1. **हा रिपॉझिटरी फोर्क करा**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **क्लोन करा**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **मदत मिळवा**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **स्थानिकपणे क्लोन करणे आवडते?**

> या रिपॉझिटरीमध्ये ५०+ भाषा अनुवाद आहेत जे डाउनलोड आकार वाढवतात. अनुवादांशिवाय क्लोन करण्यासाठी, sparse checkout वापरा:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> यामुळे तुम्हाला कोर्स पूर्ण करण्यासाठी सर्व काही भरपूर जलद डाउनलोड मिळेल.


## कोर्स सारांश

Azure Developer CLI (azd) मध्ये प्रभुत्व मिळवा, प्रगतीशील शिक्षणासाठी संरचित प्रकरणांद्वारे डिझाइन केलेले. **Microsoft Foundry एकत्रीकरणासह AI अॅप्लिकेशन तैनातीवर विशेष लक्ष केंद्रित.**

### आधुनिक विकसकांसाठी हा कोर्स का आवश्यक आहे

Microsoft Foundry Discord समुदायाच्या अंतर्दृष्टीवर आधारित, **४५% विकसक AI कार्यभारांसाठी AZD वापरू इच्छितात** पण खालील अडचणी येतात:
- जटिल बहु-सेवा AI आर्किटेक्चर
- उत्पादन AI तैनाती सर्वोत्तम पद्धती  
- Azure AI सेवा एकत्रीकरण आणि कॉन्फिगरेशन
- AI कार्यांसाठी खर्चाचे अनुकूलन
- AI-विशिष्ट तैनातीतील समस्यांचे निराकरण

### शिक्षण उद्दिष्टे

हा संरचित कोर्स पूर्ण करून, तुम्ही:
- **AZD मूलतत्त्वांत प्रभुत्व मिळवा**: मुख्य संकल्पना, स्थापना आणि कॉन्फिगरेशन
- **AI अॅप्लिकेशन तैनात करा**: Microsoft Foundry सेवांसह AZD वापरा
- **इन्फ्रास्ट्रक्चर as कोड अमलात आणा**: Bicep टेम्प्लेटसह Azure संसाधने व्यवस्थापित करा
- **तैनातीतील समस्या सोडवा**: सामान्य समस्या सुटवा आणि डिबग करा
- **उत्पादनासाठी ऑप्टिमायझेशन करा**: सुरक्षा, स्केलिंग, मॉनिटरिंग, आणि खर्च व्यवस्थापन
- **बहु-एजंट सोल्यूशन्स तयार करा**: जटिल AI आर्किटेक्चर तैनात करा

## 🗺️ कोर्स नकाशा: प्रकरणांनुसार जलद नेव्हिगेशन

प्रत्येक प्रकरणाला विशेष README आहे ज्यात शिक्षण उद्दिष्टे, जलद सुरुवात आणि सराव आहेत:

| प्रकरण | विषय | धडे | कालावधी | क्लिष्टता |
|---------|-------|---------|----------|------------|
| **[प्रक 1: मूलभूत](docs/chapter-01-foundation/README.md)** | सुरुवात | [AZD बेसिक्स](docs/chapter-01-foundation/azd-basics.md) &#124; [इंस्टॉलेशन](docs/chapter-01-foundation/installation.md) &#124; [पहिला प्रोजेक्ट](docs/chapter-01-foundation/first-project.md) | ३०-४५ मिनिटे | ⭐ |
| **[अध्या २: एआय विकास](docs/chapter-02-ai-development/README.md)** | AI-प्रथम अनुप्रयोग | [Foundry एकत्रीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI एजंट](docs/chapter-02-ai-development/agents.md) &#124; [मॉडेल वितरण](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [कार्यशाळा](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 तास | ⭐⭐ |
| **[अध्या ३: कॉन्फिगरेशन](docs/chapter-03-configuration/README.md)** | प्रमाणिकरण व सुरक्षा | [कॉन्फिगरेशन](docs/chapter-03-configuration/configuration.md) &#124; [प्रमाणिकरण व सुरक्षा](docs/chapter-03-configuration/authsecurity.md) | 45-60 मिनिटे | ⭐⭐ |
| **[अध्या ४: पायाभूत सुविधा](docs/chapter-04-infrastructure/README.md)** | IaC व वितरण | [वितरण मार्गदर्शक](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [पुरवठा](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 तास | ⭐⭐⭐ |
| **[अध्या ५: मल्टि-एजंट](docs/chapter-05-multi-agent/README.md)** | AI एजंट उपाय | [रिटेल परिस्थिती](examples/retail-scenario.md) &#124; [संपर्क नमुने](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 तास | ⭐⭐⭐⭐ |
| **[अध्या ६: प्री-वितरण](docs/chapter-06-pre-deployment/README.md)** | नियोजन व पडताळणी | [प्रीफ्लाइट तपासण्या](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [क्षमता नियोजन](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU निवड](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [ऍप्लिकेशन इनसाइट्स](docs/chapter-06-pre-deployment/application-insights.md) | 1 तास | ⭐⭐ |
| **[अध्या ७: समस्या निवारण](docs/chapter-07-troubleshooting/README.md)** | डीबग व सुधारणा | [सामान्य समस्या](docs/chapter-07-troubleshooting/common-issues.md) &#124; [डीबगिंग](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI समस्या](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 तास | ⭐⭐ |
| **[अध्या ८: उत्पादन](docs/chapter-08-production/README.md)** | एंटरप्राइझ नमुने | [उत्पादन पद्धती](docs/chapter-08-production/production-ai-practices.md) | 2-3 तास | ⭐⭐⭐⭐ |
| **[🎓 कार्यशाळा](workshop/README.md)** | हाताळणी प्रयोगशाळा | [परिचय](workshop/docs/instructions/0-Introduction.md) &#124; [निवड](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [पडताळणी](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [विखंडन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [कॉन्फिगरेशन](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [सानुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [तोडणी](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [समारोप](workshop/docs/instructions/7-Wrap-up.md) | 3-4 तास | ⭐⭐ |

**एकूण अभ्यास कालावधी:** ~10-14 तास | **कौशल्य प्रगती:** प्रारंभिक → उत्पादन-तयार

---

## 📚 शिकण्याचे अध्या

*तुमच्या अनुभवाच्या पातळी आणि ध्येयावर आधारित शिक्षण मार्ग निवडा*

### 🚀 अध्या १: पाया व त्वरीत प्रारंभ
**पूर्वअट**: Azure सदस्यता, मूलभूत कमांड लाइन ज्ञान  
**कालावधी**: 30-45 मिनिटे  
**सोपेपणा**: ⭐

#### तुम्ही काय शिकाल
- Azure Developer CLI च्या प्राथमिक तत्त्वांची समज
- तुमच्या प्लॅटफॉर्मवर AZD इंस्टॉल करणे
- तुमची पहिली यशस्वी वितरण

#### शिक्षण संसाधने
- **🎯 इथे प्रारंभ करा**: [Azure Developer CLI म्हणजे काय?](../..)
- **📖 सिद्धांत**: [AZD मूलतत्त्वे](docs/chapter-01-foundation/azd-basics.md) - मूळ संकल्पनाआणि शब्दावली
- **⚙️ सेटअप**: [इंस्टॉलेशन व सेटअप](docs/chapter-01-foundation/installation.md) - प्लॅटफॉर्म-विशिष्ट मार्गदर्शक
- **🛠️ प्रायोगिक**: [तुमचा पहिला प्रकल्प](docs/chapter-01-foundation/first-project.md) - पायरी-दर-पायरी ट्यूटोरियल
- **📋 जलद संदर्भ**: [कमांड चीट शीट](resources/cheat-sheet.md)

#### व्यवहारिक सराव
```bash
# जलद स्थापनेची तपासणी
azd version

# तुमचे पहिले अनुप्रयोग तैनात करा
azd init --template todo-nodejs-mongo
azd up
```

**💡 अध्या निकाल**: AZD वापरून Azure वर एक सोपी वेब अॅप्लिकेशन यशस्वीपणे वितरित करा

**✅ यश पडताळणी:**
```bash
# अध्याय 1 पूर्ण केल्यावर, तुम्ही खालील गोष्टी करू शकता:
azd version              # प्रतिष्ठापित आवृत्ती दर्शविते
azd init --template todo-nodejs-mongo  # प्रकल्प सुरू करतो
azd up                  # Azure वर तैनात करतो
azd show                # चालणाऱ्या अ‍ॅपचा URL दर्शवितो
# अ‍ॅप्लिकेशन ब्राऊझरमध्ये उघडते आणि कार्य करते
azd down --force --purge  # संसाधने साफ करतो
```

**📊 वेळ गुंतवणूक:** 30-45 मिनिटे  
**📈 कौशल्य पातळी नंतर:** मूलभूत अनुप्रयोग स्वतंत्रपणे वितरित करू शकतो

---

### 🤖 अध्या २: AI-प्रथम विकास (AI विकासकांसाठी शिफारस केलेले)
**पूर्वअट**: अध्या 1 पूर्ण  
**कालावधी**: 1-2 तास  
**सोपेपणा**: ⭐⭐

#### तुम्ही काय शिकाल
- Microsoft Foundry चे AZD सह एकत्रीकरण
- AI-शक्ती असलेल्या अनुप्रयोगांचे वितरण
- AI सेवा कॉन्फिगरेशन समजून घेणे

#### शिक्षण संसाधने
- **🎯 इथे प्रारंभ करा**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI एजंट्स**: [AI एजंट मार्गदर्शक](docs/chapter-02-ai-development/agents.md) - AZD सह बुद्धिमान एजंट तैनात करा
- **📖 नमुने**: [AI मॉडेल वितरण](docs/chapter-02-ai-development/ai-model-deployment.md) - AI मॉडेल वितरित करा व व्यवस्थापित करा
- **🛠️ कार्यशाळा**: [AI कार्यशाळा प्रयोगशाळा](docs/chapter-02-ai-development/ai-workshop-lab.md) - तुमचे AI उपाय AZD-तयार करा
- **🎥 इंटरएक्टिव्ह मार्गदर्शक**: [कार्यशाळा साहित्य](workshop/README.md) - MkDocs * DevContainer पर्यावरणासह ब्राउझर-आधारित शिक्षण
- **📋 टेम्प्लेट्स**: [Microsoft Foundry टेम्प्लेट्स](../..)
- **📝 उदाहरणे**: [AZD वितरण उदाहरणे](examples/README.md)

#### व्यवहारिक सराव
```bash
# आपली पहिली AI अनुप्रयोग तैनात करा
azd init --template azure-search-openai-demo
azd up

# अतिरिक्त AI साच्यांचा प्रयत्न करा
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 अध्या निकाल**: RAG क्षमता असलेले AI-शक्ती असलेले चॅट अॅप्लिकेशन वितरित करा व कॉन्फिगर करा

**✅ यश पडताळणी:**
```bash
# प्रकरण २ नंतर, तुम्ही सक्षम असाल:
azd init --template azure-search-openai-demo
azd up
# एआय चॅट इंटरफेसची चाचणी करा
# प्रश्न विचारा आणि स्रोतांसह एआय-चालित प्रतिसाद मिळवा
# शोध एकत्रीकरण कार्य करते का ते तपासा
azd monitor  # ॲप्लिकेशन इनसाईट्स टेलीमेट्री दाखवते का ते तपासा
azd down --force --purge
```

**📊 वेळ गुंतवणूक:** 1-2 तास  
**📈 कौशल्य पातळी नंतर:** उत्पादन-तयार AI अनुप्रयोग वितरित आणि कॉन्फिगर करू शकतो  
**💰 खर्च जाणिव:** $80-150/महिना विकास खर्च, $300-3500/महिना उत्पादन खर्च समजून घ्या

#### 💰 AI वितरणासाठी खर्चाच्या बाबतीत विचार

**विकास वातावरण (सुमारे $80-150/महिना):**
- Microsoft Foundry मॉडेल्स (पे-एज-यू-गो): $0-50/महिना (टोकन वापरावर आधारित)
- AI शोध (बेसिक टियर): $75/महिना
- कंटेनर अॅप्स (कन्सम्प्शन): $0-20/महिना
- स्टोरेज (स्टँडर्ड): $1-5/महिना

**उत्पादन वातावरण (सुमारे $300-3,500+/महिना):**
- Microsoft Foundry मॉडेल्स (सतत कार्यक्षमतेसाठी PTU): $3,000+/महिना किंवा उच्च प्रमाणात पे-एज-गो
- AI शोध (स्टँडर्ड टियर): $250/महिना
- कंटेनर अॅप्स (डेडिकेटेड): $50-100/महिना
- ऍप्लिकेशन इनसाइट्स: $5-50/महिना
- स्टोरेज (प्रिमियम): $10-50/महिना

**💡 खर्च कमी करण्याच्या टिपा:**
- शिकण्यासाठी **मुफत टियर** Microsoft Foundry मॉडेल्स वापरा (Azure OpenAI 50,000 टोकन/महिना समाविष्ट)
- सक्रिय विकास होत नसल्यास `azd down` चालवा म्हणजे संसाधने मुक्त होतात
- सुरुवातीला कन्सम्प्शन-आधारित बिलिंग वापरा, उत्पादनासाठी फक्त PTU वर अपग्रेड करा
- वितरण करण्यापूर्वी खर्च अंदाजासाठी `azd provision --preview` वापरा
- ऑटो-स्केलिंग सक्षम करा: प्रत्यक्ष वापरासाठीच पैसे द्या

**खर्च मॉनिटरिंग:**
```bash
# अंदाजित मासिक खर्च तपासा
azd provision --preview

# Azure पोर्टलमध्ये प्रत्यक्ष खर्चाचे निरीक्षण करा
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ अध्या ३: कॉन्फिगरेशन & प्रमाणीकरण
**पूर्वअट**: अध्या 1 पूर्ण  
**कालावधी**: 45-60 मिनिटे  
**सोपेपणा**: ⭐⭐

#### तुम्ही काय शिकाल
- पर्यावरण कॉन्फिगरेशन व व्यवस्थापन
- प्रमाणीकरण व सुरक्षा सर्वोत्तम पद्धती
- संसाधन नावकरण व संघटन

#### शिक्षण संसाधने
- **📖 कॉन्फिगरेशन**: [कॉन्फिगरेशन मार्गदर्शक](docs/chapter-03-configuration/configuration.md) - पर्यावरण सेटअप
- **🔐 सुरक्षा**: [प्रमाणीकरण नमुने व व्यवस्थापित ओळख](docs/chapter-03-configuration/authsecurity.md) - प्रमाणीकरण नमुने
- **📝 उदाहरणे**: [डेटाबेस अॅप उदाहरण](examples/database-app/README.md) - AZD डेटाबेस उदाहरणे

#### व्यवहारिक सराव
- बहु-पर्यावरण कॉन्फिगर करा (विकास, स्टेजिंग, उत्पादन)
- व्यवस्थापित ओळख प्रमाणीकरण सेट करा
- पर्यावरण-विशिष्ट कॉन्फिगरेशन लागू करा

**💡 अध्या निकाल**: अनेक पर्यावरणे योग्य प्रमाणीकरण व सुरक्षेसह व्यवस्थापित करा

---

### 🏗️ अध्या ४: पायाभूत सुविधा कोड म्हणून व वितरण
**पूर्वअट**: अध्या 1-3 पूर्ण  
**कालावधी**: 1-1.5 तास  
**सोपेपणा**: ⭐⭐⭐

#### तुम्ही काय शिकाल
- प्रगत वितरण नमुने
- Bicep वापरून कोड म्हणून पायाभूत सुविधा
- संसाधन पुरवठा धोरणे

#### शिक्षण संसाधने
- **📖 वितरण**: [वितरण मार्गदर्शक](docs/chapter-04-infrastructure/deployment-guide.md) - संपूर्ण कार्यप्रवाह
- **🏗️ पुरवठा**: [संसाधन पुरवठा](docs/chapter-04-infrastructure/provisioning.md) - Azure संसाधन व्यवस्थापन
- **📝 उदाहरणे**: [कंटेनर अॅप उदाहरण](../../examples/container-app) - कंटेनराईज्ड वितरणे

#### व्यवहारिक सराव
- सानुकूल Bicep टेम्प्लेट तयार करा
- बहु-सेवा अनुप्रयोग वितरित करा
- ब्लू-ग्रीन वितरण धोरणांवर काम करा

**💡 अध्या निकाल**: सानुकूल पायाभूत सुविधा टेम्प्लेट वापरून गुंतागुंतीचे बहु-सेवा अनुप्रयोग वितरित करा

---

### 🎯 अध्या ५: मल्टि-एजंट AI उपाय (प्रगत)
**पूर्वअट**: अध्या 1-2 पूर्ण  
**कालावधी**: 2-3 तास  
**सोपेपणा**: ⭐⭐⭐⭐

#### तुम्ही काय शिकाल
- मल्टि-एजंट आर्किटेक्चर नमुने
- एजंट संयोजन व समन्वय
- उत्पादन-तयार AI वितरण

#### शिक्षण संसाधने
- **🤖 वैशिष्ट्यीकृत प्रकल्प**: [रिटेल मल्टि-एजंट उपाय](examples/retail-scenario.md) - संपूर्ण अंमलबजावणी
- **🛠️ ARM टेम्प्लेट्स**: [ARM टेम्प्लेट पॅकेज](../../examples/retail-multiagent-arm-template) - एक-क्लिक वितरण
- **📖 आर्किटेक्चर**: [मल्टि-एजंट समन्वय नमुने](docs/chapter-06-pre-deployment/coordination-patterns.md) - नमुने

#### व्यवहारिक सराव
```bash
# संपूर्ण किरकोळ मल्टि-एजंट सोल्यूशन तैनात करा
cd examples/retail-multiagent-arm-template
./deploy.sh

# एजंट कॉन्फिगरेशन शोधा
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 अध्या निकाल**: ग्राहक व इन्व्हेंटरी एजंटसह उत्पादन-तयार मल्टि-एजंट AI उपाय तैनात करा व व्यवस्थापित करा

---

### 🔍 अध्या ६: प्री-वितरण पडताळणी व नियोजन
**पूर्वअट**: अध्या 4 पूर्ण  
**कालावधी**: 1 तास  
**सोपेपणा**: ⭐⭐

#### तुम्ही काय शिकाल
- क्षमता नियोजन व संसाधन पडताळणी
- SKU निवड धोरणे
- प्री-फ्लाइट तपासण्या व ऑटोमेशन

#### शिक्षण संसाधने
- **📊 नियोजन**: [क्षमता नियोजन](docs/chapter-06-pre-deployment/capacity-planning.md) - संसाधन पडताळणी
- **💰 निवड**: [SKU निवड](docs/chapter-06-pre-deployment/sku-selection.md) - खर्च-प्रभावी पर्याय
- **✅ पडताळणी**: [प्री-फ्लाइट तपासण्या](docs/chapter-06-pre-deployment/preflight-checks.md) - स्वयंचलित स्क्रिप्ट्स

#### व्यवहारिक सराव
- क्षमता पडताळणी स्क्रिप्ट्स चालवा
- खर्चासाठी SKU निवड ऑप्टिमाइझ करा
- स्वयंचलित प्री-वितरण तपासण्या लागू करा

**💡 अध्या निकाल**: अंमलबजावणीपूर्वी वितरणे पडताळून सुधारित करा

---

### 🚨 अध्या ७: समस्या निवारण व डीबगिंग
**पूर्वअट**: कोणताही वितरणाचा अध्या पूर्ण  
**कालावधी**: 1-1.5 तास  
**सोपेपणा**: ⭐⭐

#### तुम्ही काय शिकाल
- प्रणालीगत डीबगिंग दृष्टीकोन
- सामान्य समस्या व उपाय
- AI-विशिष्ट समस्या निवारण

#### शिक्षण संसाधने
- **🔧 सामान्य समस्या**: [सामान्य समस्या](docs/chapter-07-troubleshooting/common-issues.md) - FAQ व उपाय
- **🕵️ डीबगिंग**: [डीबगिंग मार्गदर्शक](docs/chapter-07-troubleshooting/debugging.md) - पायरी-दर-पायरी धोरणे
- **🤖 AI समस्या**: [AI-विशिष्ट समस्या निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI सेवा समस्या

#### व्यवहारिक सराव
- वितरण अपयशांचे निदान करा
- प्रमाणीकरण समस्या सुटवा
- AI सेवा कनेक्टिव्हिटी डीबग करा

**💡 अध्या निकाल**: सामान्य वितरण समस्या स्वतंत्रपणे निदान व सोडवा

---

### 🏢 अध्या ८: उत्पादन व एंटरप्राइझ नमुने
**पूर्वअट**: अध्या 1-4 पूर्ण  
**कालावधी**: 2-3 तास  
**सोपेपणा**: ⭐⭐⭐⭐

#### तुम्ही काय शिकाल
- उत्पादन वितरण धोरणे
- एंटरप्राइझ सुरक्षा नमुने
- देखरेख व खर्च ऑप्टिमायझेशन

#### शिक्षण संसाधने
- **🏭 उत्पादन**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - एंटरप्राइझ पॅटर्न्स  
- **📝 उदाहरणे**: [Microservices Example](../../examples/microservices) - गुंतेले आर्किटेक्चर्स  
- **📊 देखरेख**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - देखरेख

#### व्यावहारिक व्यायाम  
- एंटरप्राइझ सुरक्षा पॅटर्न्स अंमलात आणा  
- व्यापक देखरेख सेट करा  
- योग्य शासकीय धोरणांसह उत्पादनात तैनात करा  

**💡 अध्यायाचा परिणाम**: पूर्ण उत्पादन क्षमतांसह एंटरप्राइझ-तयार अनुप्रयोग तैनात करा

---

## 🎓 कार्यशाळा आढावा: प्रत्यक्ष शिकण्याचा अनुभव

> **⚠️ कार्यशाळेची स्थिती: सक्रिय विकास**  
> कार्यशाळेची सामग्री सध्या विकसित व सुधारित केली जात आहे. मुख्य मॉड्युल्स कार्यरत आहेत, पण काही प्रगत विभाग अपूर्ण आहेत. आम्ही सर्व सामग्री पूर्ण करण्यासाठी सक्रियपणे कार्यरत आहोत. [प्रगती ट्रॅक करा →](workshop/README.md)

### संवादात्मक कार्यशाळा सामग्री  
**ब्राउझर-आधारित साधने आणि मार्गदर्शित व्यायामांसह व्यापक प्रत्यक्ष शिकणे**

आमच्या कार्यशाळेची सामग्री वरील अध्याय-आधारित अभ्यासक्रमाला पूरक अशी रचलेली आहे. कार्यशाळा स्व-गतीने शिकण्यासाठी आणि प्रशिक्षकाच्या मार्गदर्शनाखाली सत्रांसाठी डिझाइन केलेली आहे.

#### 🛠️ कार्यशाळेची वैशिष्ट्ये  
- **ब्राउझर-आधारित इंटरफेस**: शोध, कॉपी, आणि थीम फिचर्ससह संपूर्ण MkDocs-आधारित कार्यशाळा  
- **GitHub Codespaces समाकलन**: एक-क्लिक विकास पर्यावरणाची स्थापना  
- **सुसंरचित शिक्षण मार्ग**: ८-मॉड्युल मार्गदर्शित व्यायाम (एकूण ३-४ तास)  
- **प्रगत पद्धतशास्त्र**: परिचय → निवड → सत्यापन → विघटन → संरचना → सानुकूलन → संपवणी → सारांश  
- **संवादात्मक DevContainer वातावरण**: पूर्व-संरचित साधने आणि अवलंबित्वे  

#### 📚 कार्यशाळा मॉड्युल रचना  
कार्यशाळा ही **८-मॉड्युल प्रगत पद्धतशास्त्र** वापरते जी तुम्हाला शोधापासून तैनातीत प्रावीण्यापर्यंत घेऊन जाते:

| मॉड्युल | विषय | तुम्ही काय कराल | कालावधी |
|---------|-------|----------------|----------|
| **0. परिचय** | कार्यशाळा आढावा | शिकण्याचे उद्दिष्ट, पूर्वआवश्यकता, आणि कार्यशाळेची रचना समजून घ्या | १५ मिनिटे |
| **1. निवड** | टेम्प्लेट शोध | AZD टेम्प्लेट्स एक्सप्लोर करा आणि तुमच्या परिस्थितीसाठी योग्य AI टेम्प्लेट निवडा | २० मिनिटे |
| **2. सत्यापन** | तैनात आणि तपासणी | `azd up` वापरून टेम्प्लेट तैनात करा आणि इन्फ्रास्ट्रक्चर कार्यरत असल्याची खातरी करा | ३० मिनिटे |
| **3. विघटन** | रचना समजून घ्या | GitHub Copilot वापरून टेम्प्लेट आर्किटेक्चर, Bicep फाइल्स, आणि कोड संघटन तपासा | ३० मिनिटे |
| **4. संरचना** | azure.yaml सखोल अभ्यास | `azure.yaml` संरचना, लाइफसायकल हुक्स, आणि पर्यावरण वेरिएबल्स मास्टर करा | ३० मिनिटे |
| **5. सानुकूलन** | तुमच्यासाठी करा | AI सर्च, ट्रेसिंग, मूल्यमापन सक्षम करा आणि तुमच्या परिस्थितीसाठी सानुकूल करा | ४५ मिनिटे |
| **6. संपवणी** | साफसफाई करा | `azd down --purge` वापरून संसाधने सुरक्षितपणे काढा | १५ मिनिटे |
| **7. सारांश** | पुढील पावले | साध्य केलेले पुनरावलोकन करा, मुख्य संकल्पना समजून घ्या, आणि तुमचा शिकण्याचा प्रवास सुरू ठेवा | १५ मिनिटे |

**कार्यशाळेचा प्रवाह:**  
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
# रेपॉझिटरीमध्ये "Code" → "Create codespace on main" वर क्लिक करा

# पर्याय 2: स्थानिक विकास
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md मध्ये सेटअप सूचना पाळा
```
  
#### 🎯 कार्यशाळेतील शिकण्याचे परिणाम  
कार्यशाळा पूर्ण केल्यावर सहभागी:  
- **उत्पादन AI अनुप्रयोग तैनात करणे**: Microsoft Foundry सेवा वापरून AZD वापरा  
- **मल्टी-एजंट आर्किटेक्चर्समध्ये प्रावीण्य मिळवा**: समन्वित AI एजंट सोल्यूशन्स अंमलात आणा  
- **सुरक्षा सर्वोत्तम प्रथा लागू करा**: प्रमाणीकरण आणि प्रवेश नियंत्रण कॉन्फिगर करा  
- **स्केलसाठी ऑप्टिमाइझ करा**: खर्च-कमी आणि कार्यक्षम नियुक्त्या डिझाइन करा  
- **तैनाती समस्यांचे निराकरण करा**: सामान्य समस्या स्वतंत्रपणे सोडवा  

#### 📖 कार्यशाळा संसाधने  
- **🎥 संवादात्मक मार्गदर्शक**: [कार्यशाळा सामग्री](workshop/README.md) - ब्राउझर-आधारित शिकण्याचे वातावरण  
- **📋 मॉड्युलनिहाय सूचनाः**  
  - [0. परिचय](workshop/docs/instructions/0-Introduction.md) - कार्यशाळा आढावा आणि उद्दिष्टे  
  - [1. निवड](workshop/docs/instructions/1-Select-AI-Template.md) - AI टेम्प्लेट शोधा आणि निवडा  
  - [2. सत्यापन](workshop/docs/instructions/2-Validate-AI-Template.md) - टेम्प्लेट तैनात करा आणि सत्यापित करा  
  - [3. विघटन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - टेम्प्लेट आर्किटेक्चर तपासा  
  - [4. संरचना](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml मास्टर करा  
  - [5. सानुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) - तुमच्या परिस्थितीसाठी सानुकूल करा  
  - [6. संपवणी](workshop/docs/instructions/6-Teardown-Infrastructure.md) - संसाधने साफ करा  
  - [7. सारांश](workshop/docs/instructions/7-Wrap-up.md) - पुनरावलोकन आणि पुढील पावले  
- **🛠️ AI कार्यशाळा लॅब**: [AI कार्यशाळा लॅब](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-केंद्रित व्यायाम  
- **💡 जलद प्रारंभ**: [कार्यशाळा सेटअप मार्गदर्शक](workshop/README.md#quick-start) - वातावरण कॉन्फिगरेशन  

**परिपूर्ण:** कॉर्पोरेट प्रशिक्षण, विद्यापीठ अभ्यासक्रम, स्व-गतीने शिकणे, आणि विकसक बूटकॅम्पसाठी.

---

## 📖 सखोल अभ्यास: AZD क्षमता

मूळ गोष्टींपलीकडे, AZD उत्पादन तैनातीसाठी सामर्थ्यशाली वैशिष्ट्ये प्रदान करते:

- **टेम्प्लेट-आधारित तैनाती** - सामान्य अनुप्रयोग पॅटर्नसाठी पूर्व-निर्मित टेम्प्लेट वापरा  
- **इन्फ्रास्ट्रक्चर असे कोड** - Bicep किंवा Terraform वापरून Azure संसाधने व्यवस्थापित करा  
- **संपूर्ण कार्यप्रवाह समाकलन** - अनुप्रयोग सहजतेने प्राव्हिजन, तैनात आणि देखरेख करा  
- **विकसक-मित्रत्वपूर्ण** - विकसकांच्या उत्पादकता आणि अनुभवासाठी ऑप्टिमाइझ केलेले  

### **AZD + Microsoft Foundry: AI तैनातींसाठी परिपूर्ण**

**AI सोल्यूशन्ससाठी AZD का?** AZD ही AI विकसकांना येणाऱ्या मुख्य अडचणींना उत्तर देते:

- **AI-तयार टेम्प्लेट्स** - Microsoft Foundry मॉडेल्स, Cognitive Services, आणि ML वर्कलोडसाठी पूर्व-संरचीत टेम्प्लेट्स  
- **सुरक्षित AI तैनातीं** - AI सेवा, API की आणि मॉडेल एंडपॉइंटसाठी अंगभूत सुरक्षा पॅटर्न्स  
- **उत्पादन AI पॅटर्न्स** - स्केलेबल, खर्च-कमी AI अनुप्रयोग तैनातीसाठी सर्वोत्तम प्रथा  
- **एंड-टू-एंड AI कार्यप्रवाह** - मॉडेल विकसित करण्यापासून उत्पादन तैनातीपर्यंत योग्य देखरेखासह  
- **खर्च ऑप्टिमायझेशन** - AI वर्कलोडसाठी स्मार्ट संसाधन वाटप आणि स्केलिंग धोरणे  
- **Microsoft Foundry समाकलन** - Microsoft Foundry मॉडेल कॅटलॉग आणि एंडपॉइंट्सशी अखंड कनेक्शन  

---

## 🎯 टेम्प्लेट्स आणि उदाहरणे पुस्तकालय

### वैशिष्ट्यीकृत: Microsoft Foundry टेम्प्लेट्स  
**AI अनुप्रयोग तैनाती करत असल्यास येथे प्रारंभ करा!**

> **टीप:** हे टेम्प्लेट्स विविध AI पॅटर्न दाखवतात. काही बाह्य Azure नमुने आहेत, तर काही स्थानिक अंमलबजावणी आहेत.

| टेम्प्लेट | अध्याय | गुंतागुंत | सेवा | प्रकार |
|-----------|---------|----------|------------|---------|
| [**AI चॅटसह प्रारंभ करा**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय २ | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | बाह्य |
| [**AI एजंट्ससह प्रारंभ करा**](https://github.com/Azure-Samples/get-started-with-ai-agents) | अध्याय २ | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | बाह्य |
| [**Azure Search + OpenAI प्रदर्शन**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय २ | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | बाह्य |
| [**OpenAI चॅट अ‍ॅप क्विकस्टार्ट**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय २ | ⭐ | AzureOpenAI + Container Apps + Application Insights | बाह्य |
| [**एजंट OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय ५ | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | बाह्य |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | अध्याय ८ | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | बाह्य |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | अध्याय ५ | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **स्थानिक** |

### वैशिष्ट्यीकृत: संपूर्ण शिकण्याच्या परिस्थिती  
**उत्पादन-तयार अनुप्रयोग टेम्प्लेट्स शिकण्याच्या अध्यायांशी मॅप केलेले**

| टेम्प्लेट | शिकण्याचा अध्याय | गुंतागुंत | मुख्य शिकणं |
|-----------|------------------|----------|-------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय २ | ⭐ | प्राथमिक AI तैनाती पॅटर्न्स |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय २ | ⭐⭐ | Azure AI Search सह RAG अंमलबजावणी |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | अध्याय ४ | ⭐⭐ | दस्तऐवज बुद्धिमत्ता समाकलन |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय ५ | ⭐⭐⭐ | एजंट फॅ्रमवर्क आणि फंक्शन कॉलिंग |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | अध्याय ८ | ⭐⭐⭐ | एंटरप्राइझ AI समन्वय |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | अध्याय ५ | ⭐⭐⭐⭐ | मल्टी-एजंट आर्किटेक्चर (ग्राहक आणि इन्व्हेंटरी एजंट्स) |

### उदाहरण प्रकारानुसार शिक्षण

> **📌 स्थानिक आणि बाह्य उदाहरणे:**  
> **स्थानिक उदाहरणे** (या रेपॉमध्ये) = त्वरित वापरासाठी तयार  
> **बाह्य उदाहरणे** (Azure Samples) = लिंक केलेल्या रेपॉजिटरीजमधून क्लोन करा

#### स्थानिक उदाहरणे (तत्काळ वापरासाठी तयार)  
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM टेम्प्लेट्ससह संपूर्ण उत्पादन-तयार अंमलबजावणी  
  - मल्टी-एजंट आर्किटेक्चर (ग्राहक + इन्व्हेंटरी एजंट्स)  
  - व्यापक देखरेख आणि मूल्यमापन  
  - ARM टेम्प्लेटद्वारे एक-क्लिक तैनाती  

#### स्थानिक उदाहरणे - कंटेनर अनुप्रयोग (अध्याय २-५)  
**या रेपॉमध्ये सर्वसमावेशक कंटेनर तैनाती उदाहरणे:**  
- [**कंटेनर अ‍ॅप उदाहरणे**](examples/container-app/README.md) - कंटेनर तैनातीसाठी संपूर्ण मार्गदर्शक  
  - [सोपे Flask API](../../examples/container-app/simple-flask-api) - स्केल-टू-झीरोसह मूलभूत REST API  
  - [मायक्रोसर्व्हिस आर्किटेक्चर](../../examples/container-app/microservices) - उत्पादन-तयार बहुसेवा तैनाती  
  - क्विक स्टार्ट, उत्पादन, आणि प्रगत तैनाती पॅटर्न  
  - देखरेख, सुरक्षा, आणि खर्च ऑप्टिमायझेशन मार्गदर्शन  

#### बाह्य उदाहरणे - सोपे अनुप्रयोग (अध्याय १-२)  
**हे Azure नमुने रेपॉजिटरीज क्लोन करा आणि सुरू करा:**  
- [सोपे वेब अ‍ॅप - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - प्राथमिक तैनाती पॅटर्न्स  
- [स्थिर वेबसाइट - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - स्थिर सामग्री तैनाती  
- [कंटेनर अ‍ॅप - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API तैनाती  

#### बाह्य उदाहरणे - डेटाबेस समाकलन (अध्याय ३-४)  
- [डेटाबेस अ‍ॅप - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - डेटाबेस कनेक्टिव्हिटी पॅटर्न्स  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - सर्वरलेस डेटा कार्यप्रवाह  

#### बाह्य उदाहरणे - प्रगत पॅटर्न्स (अध्याय ४-८)  
- [Java माइक्रोसर्व्हिसेस](https://github.com/Azure-Samples/java-microservices-aca-lab) - बहुसेवा आर्किटेक्चर  
- [कंटेनर अ‍ॅप्स जॉब्स](https://github.com/Azure-Samples/container-apps-jobs) - पार्श्वभूमी प्रक्रिया  
- [एंटरप्राइझ ML पाईपलाइन](https://github.com/Azure-Samples/mlops-v2) - उत्पादन-तयार ML पॅटर्न्स  

### बाह्य टेम्प्लेट संग्रह  
- [**अधिकृत AZD टेम्प्लेट गॅलरी**](https://azure.github.io/awesome-azd/) - अधिकृत आणि समुदायाचे कुरेट केलेले टेम्प्लेट संग्रह  
- [**Azure Developer CLI टेम्प्लेट्स**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn टेम्प्लेट दस्तऐवज  
- [**उदाहरणे निर्देशिका**](examples/README.md) - तपशीलवार स्पष्टीकरणांसह स्थानिक शिकण्याची उदाहरणे  

---

## 📚 शिकण्याच्या संसाधनांचा संदर्भ

### जलद संदर्भ  
- [**कमांड चीट शीट**](resources/cheat-sheet.md) - अध्यायानुसार संघटित आवश्यक azd कमांड्स  
- [**शब्दकोश**](resources/glossary.md) - Azure आणि azd संज्ञा  
- [**वारंवार विचारले जाणारे प्रश्न**](resources/faq.md) - शिकण्याच्या अध्यायांनुसार प्रश्नांची यादी  
- [**अभ्यास मार्गदर्शक**](resources/study-guide.md) - व्यापक व्यावहारिक व्यायाम  

### प्रत्यक्ष कार्यशाळा  
- [**AI कार्यशाळा लॅब**](docs/chapter-02-ai-development/ai-workshop-lab.md) - तुमच्या AI सोल्यूशन्सना AZD तैनाती योग्य करा (२-३ तास)  
- [**संचालनीय कार्यशाळा**](workshop/README.md) - MkDocs आणि GitHub Codespaces सहित ८-मॉड्युल मार्गदर्शित व्यायाम  
  - अनुक्रमे: परिचय → निवड → सत्यापन → विघटन → संरचना → सानुकूलन → संपवणी → सारांश  

### बाह्य शिकण्याच्या संसाधनांचा संदर्भ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### AI Agent Skills for Your Editor
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, deployment, diagnostics, cost optimization, आणि अजून बरेच काही यासाठी 37 खुला एजंट कौशल्ये. हे GitHub Copilot, Cursor, Claude Code, किंवा कोणत्याही समर्थित एजंटमध्ये स्थापित करा:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 त्वरीत समस्या निवारण मार्गदर्शिका

**नवशिक्यांना येणाऱ्या सामान्य समस्या आणि त्वरित उपाय:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# प्रथम AZD स्थापित करा
# विंडोज (पॉवरशेल):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# लिनक्स:
curl -fsSL https://aka.ms/install-azd.sh | bash

# स्थापना पडताळा
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
# वेगवेगळ्या Azure प्रदेशाचा प्रयत्न करा
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
<summary><strong>❌ "azd up" अर्धवट अपयशी</strong></summary>

```bash
# पर्याय 1: स्वच्छ करा आणि पुन्हा प्रयत्न करा
azd down --force --purge
azd up

# पर्याय 2: फक्त पायाभूत सुविधा दुरुस्त करा
azd provision

# पर्याय 3: तपशीलवार स्थिती तपासा
azd show

# पर्याय 4: Azure Monitor मध्ये लॉग तपासा
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" किंवा "Token expired"</strong></summary>

```bash
# पुन्हा प्रमाणित करा
az logout
az login

azd auth logout
azd auth login

# प्रमाणीकरणाची पुष्टी करा
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" किंवा नाव टकराव</strong></summary>

```bash
# AZD अद्वितीय नावे तयार करते, परंतु जर संघर्ष झाला:
azd down --force --purge

# मग नवीन वातावरणासह पुन्हा प्रयत्न करा
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ टेम्पलेट डिप्लॉयमेंट फार वेळ घेते</strong></summary>

**सामान्य प्रतीक्षा वेळा:**
- साधी वेब अॅप: 5-10 मिनिटे
- डेटाबेससह अॅप: 10-15 मिनिटे
- AI अनुप्रयोग: 15-25 मिनिटे (OpenAI पुरवठा हळू आहे)

```bash
# प्रगती तपासा
azd show

# जर ३० मिनिटांहून अधिक अडकले तर, Azure पोर्टल तपासा:
azd monitor
# अयशस्वी तैनाती शोधा
```
</details>

<details>
<summary><strong>❌ "Permission denied" किंवा "Forbidden"</strong></summary>

```bash
# आपली Azure भूमिका तपासा
az role assignment list --assignee $(az account show --query user.name -o tsv)

# आपल्याला किमान "Contributor" भूमिका आवश्यक आहे
# आपला Azure प्रशासक याला मंजूर करण्यासाठी विचार करा:
# - Contributor (संसाधनांसाठी)
# - User Access Administrator (भूमिका नियुक्त्यांसाठी)
```
</details>

<details>
<summary><strong>❌ डिप्लॉय केलेल्या अनुप्रयोगाचा URL सापडत नाही</strong></summary>

```bash
# सर्व सेवा एंडपॉइंट दर्शवा
azd show

# किंवा Azure पोर्टल उघडा
azd monitor

# विशिष्ट सेवा तपासा
azd env get-values
# *_URL व्हेरिएबल्स पहा
```
</details>

### 📚 पूर्ण समस्या निवारण संसाधने

- **सामान्य समस्या मार्गदर्शिका:** [सविस्तर उपाय](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-विशिष्ट समस्या:** [AI समस्या निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **डिबगिंग मार्गदर्शिका:** [टप्प्याटप्प्याने डिबगिंग](docs/chapter-07-troubleshooting/debugging.md)
- **मदत मिळवा:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 कोर्स पूर्णता आणि प्रमाणपत्र

### प्रगती ट्रॅकिंग
प्रत्येक प्रकरणाद्वारे तुमची शिकण्याची प्रगती ट्रॅक करा:

- [ ] **प्रकरण 1**: पाया आणि त्वरीत प्रारंभ ✅
- [ ] **प्रकरण 2**: AI-प्रथम विकास ✅  
- [ ] **प्रकरण 3**: कॉन्फिगरेशन आणि प्रमाणीकरण ✅
- [ ] **प्रकरण 4**: कोड रूपात पायाभूत सुविधा आणि डिप्लॉयमेंट ✅
- [ ] **प्रकरण 5**: बहु-एजंट AI उपाय ✅
- [ ] **प्रकरण 6**: डिप्लॉयमेंटपूर्व सत्यापन आणि नियोजन ✅
- [ ] **प्रकरण 7**: समस्या निवारण आणि डिबगिंग ✅
- [ ] **प्रकरण 8**: उत्पादन आणि एंटरप्राइझ नमुने ✅

### शिक्षण सत्यापन
प्रत्येक प्रकरण पूर्ण केल्यावर, तुमचे ज्ञान तपासा:
1. **व्यावहारिक सराव**: प्रकरणातील हाताळणी पूर्ण करा
2. **ज्ञान तपासणी**: तुमच्या प्रकरणाचा FAQ विभाग पहा
3. **समुदाय चर्चा**: Azure Discord मध्ये अनुभव शेअर करा
4. **पुढील प्रकरण**: पुढील कौशल्य स्तरावर जा

### कोर्स पूर्णता फायदे
सर्व प्रकरणे पूर्ण केल्यावर, तुम्हाला मिळेल:
- **उत्पादन अनुभव**: Azure वर प्रत्यक्ष AI अनुप्रयोग डिप्लॉय केलेले
- **व्यावसायिक कौशल्ये**: एंटरप्राइझ-तयार डिप्लॉयमेंट क्षमता  
- **समुदाय मान्यता**: Azure विकासक समुदायाचा सक्रिय सदस्य
- **करिअर प्रगती**: मागणीत असलेली AZD आणि AI डिप्लॉयमेंट कौशल्ये

---

## 🤝 समुदाय आणि समर्थन

### मदत आणि समर्थन मिळवा
- **तांत्रिक समस्या**: [बग रिपोर्ट करा आणि फीचर विनंती करा](https://github.com/microsoft/azd-for-beginners/issues)
- **शिकण्याच्या प्रश्नांसाठी**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) आणि [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-विशिष्ट मदत**: सामील व्हा [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **दस्तऐवज**: [अधिकृत Azure Developer CLI दस्तऐवज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord मधून समुदायाचे अंतर्दृष्टी

**#Azure चॅनेलमधील अलीकडील मतदान परिणाम:**
- **45%** विकासकांना AI वर्कलोडसाठी AZD वापरायचा आहे
- **मुख्य अडचणी**: बहु-सेवा डिप्लॉयमेंट, क्रेडेन्शियल व्यवस्थापन, उत्पादन तयारी  
- **सर्वाधिक मागणी**: AI-विशिष्ट टेम्पलेट्स, समस्या निवारण मार्गदर्शक, सर्वोत्तम पद्धती

**आमच्या समुदायामध्ये सामील व्हा:**
- तुमचा AZD + AI अनुभव शेअर करा आणि मदत मिळवा
- नवीन AI टेम्पलेट्सचे प्राथमिक पूर्वावलोकन प्राप्त करा
- AI डिप्लॉयमेंट सर्वोत्तम पद्धतींमध्ये योगदान द्या
- भविष्यातील AI + AZD वैशिष्ट्य विकास प्रभावीत करा

### कोर्समध्ये योगदान द्या
आम्ही योगदान स्वीकारतो! कृपया आमचा [योगदान मार्गदर्शक](CONTRIBUTING.md) वाचा:
- **सामग्री सुधारणा**: विद्यमान प्रकरणे आणि उदाहरणे सुधारित करा
- **नवीन उदाहरणे**: प्रत्यक्ष परिस्थिती आणि टेम्पलेट्स जोडा  
- **भाषांतर**: बहुभाषिक समर्थन राखण्यात मदत करा
- **बग रिपोर्ट**: अचूकता आणि स्पष्टता सुधारित करा
- **समुदाय नियम**: आमच्या समावेशक सामुदायिक मार्गदर्शकांचे पालन करा

---

## 📄 कोर्स माहिती

### परवाना
हा प्रकल्प MIT परवान्याअंतर्गत आहे - तपशीलासाठी [LICENSE](../../LICENSE) फाइल पहा.

### संबंधित Microsoft शिकण्याचे संसाधने

आमची टीम इतर सर्वसमावेशक शिकण्याचे कोर्स तयार करते:

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
[![AI संयुक्त प्रोग्रामिंगसाठी Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET साठी Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot साहस](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ कोर्स नेव्हिगेशन

**🚀 शिकायला सुरू करण्यासाठी तयार आहात का?**

**सुरुवातीच्या लोकांसाठी**: [अध्याय 1: पाया आणि जलद प्रारंभ](../..) पासून सुरू करा  
**AI विकासकांसाठी**: [अध्याय 2: AI-प्रथम विकास](../..) येथे जा  
**अनुभवी विकासकांसाठी**: [अध्याय 3: संरचना आणि प्रमाणीकरण](../..) पासून प्रारंभ करा

**पुढील पावले**: [अध्याय 1 - AZD मूलभूत गोष्टी सुरु करा](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**सर्वसूचना**:
हा दस्तऐवज AI अनुवाद सेव्हिस [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, परंतु कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा बरोबर नसण्याची शक्यता असते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्त्रोत मानला पाहिजे. महत्त्वपूर्ण माहितीसाठी व्यावसायिक मानवी अनुवाद शिफारसीय आहे. या अनुवादाच्या वापरामुळे उद्भवलेल्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थलावांसाठी आम्ही जबाबदार नाहीत.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->