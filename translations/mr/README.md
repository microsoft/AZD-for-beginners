# AZD प्रारंभिकांसाठी: एक संरचित शिकण्याचा प्रवास

![AZD-for-beginners](../../translated_images/mr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### स्वयंचलित अनुवाद (अहोरात्र अद्ययावत)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](./README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **स्थानिकपणे क्लोन करणे पसंत आहे?**
>
> या रिपॉझिटरीमध्ये ५०+ भाषांचे अनुवाद आहेत जे डाउनलोडचा आकार लक्षणीय वाढवतात. अनुवादांशिवाय क्लोन करण्यासाठी sparse checkout वापरा:
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
> हे तुम्हाला कोर्स पूर्ण करण्यासाठी आवश्यक असलेले सर्व काही अधिक जलद डाउनलोडसह देते.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 आज azd मध्ये काय नवीन आहे

> 📌 हा कोर्स **`azd 1.27.1`** (जुलै २०२६) वर पडताळणी केलेला आहे. तुमची आवृत्ती तपासण्यासाठी `azd version` चालवा, आणि नवीनतम मिळवण्यासाठी `azd upgrade` चालवा.

Azure Developer CLI पारंपारिक वेब अॅप्स आणि API पलीकडे वाढले आहे. आज, azd Azure वर कोणतीही ॲप्लिकेशन (AI-चालित अॅप्स आणि बुद्धिमान एजंट्ससह) तैनात करण्याचे एकमेव साधन आहे.

याचा अर्थ तुमच्यासाठी खालीलप्रमाणे:

- **AI एजंट आता प्रथम श्रेणीचे azd वर्कलोड आहेत.** तुम्ही `azd init` → `azd up` या परिचित वर्कफ्लो वापरून AI एजंट प्रोजेक्ट्स शुरू, तैनात आणि व्यवस्थापित करू शकता.
- **CLI मधून पूर्ण एजंट जीवनचक्र.** `azure.ai.agents` एक्सटेंशन आता संपूर्ण प्रवास व्यापते—`azd ai agent init` स्कॅफोल्डसाठी, `azd ai agent invoke` चाचणीसाठी (प्रतिक्रिया वेळासह), `azd ai agent eval generate` व `azd ai agent optimize` गुणवत्ता मोजण्यासाठी आणि सुधारण्यासाठी, आणि `azd ai agent delete` सफाईसाठी.
- **अधिक AI बिल्डिंग ब्लॉक्स.** नवीन प्रीव्ह्यू एक्सटेंशन्स—`azure.ai.skills` आणि `azure.ai.connections`—यांनी पुनर्वापरयोग्य एजंट कौशल्ये आणि Foundry कनेक्शन्स थेट azd सह व्यवस्थापित करता येतात.
- **Microsoft Foundry एकीकरण** मॉडेल तैनाती, एजंट होस्टिंग, आणि AI सेवा कॉन्फिगरेशन थेट azd टेम्प्लेट इकोसिस्टममध्ये आणते.
- **दररोजच्या मूलभूत गोष्टी आणखी सुलभ.** अलीकडील आवृत्त्यांनी `azd init` आयडेम्पोटेंट (पुन्हा चालवण्यासाठी सुरक्षित) केले, `azd auth login` या कारवायेमुळे जुने टोकन आपोआप साफ होतात, आणि एक स्नेही `azd tool` प्रथम चालवण्यासाठी सेटअप सूचनाही दिली.
- **मुख्य वर्कफ्लो बदललेला नाही.** तुम्ही तुडो ॲप, मायक्रोसर्व्हिस, किंवा मल्टी-एजंट AI सोल्युशन तैनात करत असाल, कमांड्स सारखेच आहेत.

> **Aspire वापरकर्त्यांसाठी नोंद:** Microsoft आता उत्पादनाला फक्त **Aspire** (पूर्वी ".NET Aspire") म्हणते. azd चे Aspire समर्थन अजूनही तसेच आहे—फक्त नाव अद्ययावत केले गेले आहे.

जर तुम्ही azd आधी वापरले असेल तर AI समर्थन नैसर्गिक वाढ आहे—एक वेगळे टूल किंवा प्रगत ट्रॅक नाही. नव्याने सुरुवात करत असाल तर, तुम्हाला एकच वर्कफ्लो शिकायला मिळेल जो सर्व गोष्टींसाठी काम करतो.

---

## 🚀 Azure Developer CLI (azd) काय आहे?

**Azure Developer CLI (azd)** हा विकसित करणाऱ्यांसाठी अनुकूल असलेला कमांड-लाइन टूल आहे जो Azure वर अॅप्लिकेशन्स तैनात करणे सोपे करते. अनेक Azure संसाधने मॅन्युअली तयार करण्याऐवजी, तुम्ही एकाच कमांडने संपूर्ण अॅप्लिकेशन्स तैनात करू शकता.

### `azd up` चं जादू

```bash
# हा एकला आदेश सर्वकाही करतो:
# ✅ सर्व Azure संसाधने तयार करतो
# ✅ नेटवर्किंग आणि सुरक्षा सेट करतो
# ✅ तुमचा अ‍ॅप्लिकेशन कोड तयार करतो
# ✅ Azure वर डिप्लॉय करतो
# ✅ तुम्हाला कार्यरत URL प्रदान करतो
azd up
```

**इतकंच!** कुठलाही Azure पोर्टल क्लिकिंग नाही, कोणतेही जटिल ARM टेम्पलेट शिकण्याची गरज नाही, कोणतीही मॅन्युअल कॉन्फिगरेशन नाही - फक्त Azure वर चालणारी अॅप्लिकेशन्स.

---

## ❓ Azure Developer CLI आणि Azure CLI मध्ये फरक काय?

हा नवशिक्यांनी सर्वात जास्त विचारलेला प्रश्न आहे. याचे सोपे उत्तर:

| वैशिष्ट्य | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **उद्दिष्ट** | वैयक्तिक Azure संसाधने व्यवस्थापित करा | संपूर्ण अॅप्लिकेशन्स तैनात करा |
| **विचारसरणी** | इन्फ्रास्ट्रक्चर-केंद्रित | अॅप्लिकेशन-केंद्रित |
| **उदाहरण** | `az webapp create --name myapp...` | `azd up` |
| **शिकण्याचा स्तर** | Azure सेवा माहित असाव्यात | फक्त तुमचा अॅप माहिती असणे पुरे |
| **सर्वोत्तम** | DevOps, इन्फ्रास्ट्रक्चर | विकसक, प्रोटोटायपिंग |

### सोपी तुलना

- **Azure CLI** म्हणजे घर बांधण्यासाठी लागणारी सर्व साधने - हातोडे, आरी, नखे. तुम्ही काहीही बांधू शकता, पण बांधकाम माहित असायला हवे.
- **Azure Developer CLI** म्हणजे कंत्राटदाराला कामावर घेणे - तुम्ही काय हवे ते सांगा, आणि ते बांधकाम करतात.

### कोणता कधी वापरायचा

| परिस्थिती | हे वापरा |
|----------|----------|
| "मला माझा वेब अॅप लवकर तैनात करायचा आहे" | `azd up` |
| "मला फक्त एक स्टोरेज खाते तयार करायचे आहे" | `az storage account create` |
| "मी पूर्ण AI अॅप्लिकेशन बनवत आहे" | `azd init --template azure-search-openai-demo` |
| "मला विशिष्ट Azure संसाधन डीबग करायचे आहे" | `az resource show` |
| "मला उत्पादनासाठी तयार तैनाती काही मिनिटांत पाहिजे" | `azd up --environment production` |

### हे एकत्र काम करतात!

AZD अंतर्गत Azure CLI वापरते. तुम्ही दोन्ही वापरू शकता:
```bash
# AZD सह आपली अॅप तैनात करा
azd up

# नंतर Azure CLI सह विशिष्ट संसाधने सूक्ष्मसात करा
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD मध्ये टेम्प्लेट शोधा

सुरुवात नव्हे करू नका! **Awesome AZD** हा समुदायाचा तयार-तैनात टेम्प्लेट संग्रह आहे:

| स्रोत | वर्णन |
|----------|-------------|
| 🔗 [**Awesome AZD गॅलरी**](https://azure.github.io/awesome-azd/) | 200+ टेम्प्लेटसह एक-क्लिक तैनात करा |
| 🔗 [**एक टेम्प्लेट सादर करा**](https://github.com/Azure/awesome-azd/issues) | तुमचा स्वतःचा टेम्प्लेट समुदायाला द्या |
| 🔗 [**GitHub रिपॉझिटरी**](https://github.com/Azure/awesome-azd) | स्टार करा आणि स्रोत शोधा |

### Awesome AZD मधील लोकप्रिय AI टेम्प्लेट्स

```bash
# Microsoft Foundry मॉडेल्स + AI शोधासह RAG चॅट
azd init --template azure-search-openai-demo

# जलद AI चॅट अॅप्लिकेशन
azd init --template openai-chat-app-quickstart

# Foundry एजंट्ससह AI एजंट्स
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 पायऱ्यांमध्ये सुरुवात करा

सुरुवात करण्यापूर्वी, तुम्ही तैनात करू इच्छित असलेल्या टेम्प्लेटसाठी तुमची यंत्रणा तयार आहे याची खात्री करा:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

आवश्यक कोणतीही तपासणी अपयशी झाल्यास, प्रथम ती दुरुस्त करा आणि नंतर जलद सुरुवात करा.

### पायरी 1: AZD स्थापित करा (2 मिनिटे)

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

### पायरी 2: AZD साठी प्रमाणीकरण करा

```bash
# जर तुम्ही या कोर्समध्ये थेट Azure CLI कमांड्स वापरण्याचा विचार करत असाल तर पर्यायी
az login

# AZD वर्कफ्लो साठी आवश्यक आहे
azd auth login
```

तुम्हाला कोणी आवश्यक आहे हे नक्की नसेल तर, [इंस्टॉलेशन व सेटअप](docs/chapter-01-foundation/installation.md#authentication-setup) मधील संपूर्ण सेटअप फ्लो फॉलो करा.

### पायरी 3: तुमचा पहिला अॅप तैनात करा

```bash
# साच्यापासून प्रारंभ करा
azd init --template todo-nodejs-mongo

# Azure वर तैनात करा (सर्व काही तयार करते!)
azd up
```

**🎉 इतकंच!** तुमचा अॅप आता Azure वर सुरू आहे.

### साफसफाई (कधीही विसरू नका!)

```bash
# प्रयोग पूर्ण झाल्यावर सर्व स्त्रोत काढून टाका
azd down --force --purge
```

---

## 📚 या कोर्सचा वापर कसा करावा

हा कोर्स **क्रमिक शिक्षणासाठी** डिझाइन केलेला आहे - जिथे आरामदायक आहात तिथून सुरुवात करा आणि पुढे जा:

| तुमचा अनुभव | येथे सुरुवात करा |
|-----------------|------------|
| **Azure मध्ये पूर्णपणे नवीन** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Azure माहित आहे, AZD नवीन आहे** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **AI अॅप्स तैनात करायचे आहेत** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **हाताळणीचा सराव करायचा आहे** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 तासांचे मार्गदर्शित लॅब |
| **उत्पादन पद्धतींची गरज आहे** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### जलद सेटअप

1. **हा रिपॉझिटरी Fork करा**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **क्लोन करा**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **मदत मिळवा**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **स्थानिकपणे क्लोन करणे पसंत आहे?**

> या रिपॉझिटरीमध्ये ५०+ भाषांचे अनुवाद आहेत जे डाउनलोडचा आकार लक्षणीय वाढवतात. अनुवादांशिवाय क्लोन करण्यासाठी sparse checkout वापरा:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> हे तुम्हाला कोर्स पूर्ण करण्यासाठी आवश्यक असलेले सर्व काही अधिक जलद डाउनलोडसह देते.


## कोर्सचा आढावा

Azure Developer CLI (azd) मध्ये मास्टरी मिळवा, क्रमिक शिकण्यासाठी डिझाइन केलेल्या संरचित प्रकरणांद्वारे. **Microsoft Foundry एकत्रीकरणासह AI अॅप्लिकेशन तैनातीवर विशेष लक्ष.**


### आधुनिक विकसकांसाठी हा कोर्स का आवश्यक आहे

Microsoft Foundry Discord समुदायाच्या अंतर्दृष्टीवर आधारित, **45% विकसक AI वर्कलोडसाठी AZD वापरू इच्छितात** पण खालील अडचणींचा सामना करतात:
- क्लिष्ट मल्टी-सेवा AI आर्किटेक्चर्स
- उत्पादन AI तैनाती सर्वोत्तम पद्धती  
- Azure AI सेवा एकत्रीकरण आणि कॉन्फिगरेशन
- AI वर्कलोडसाठी खर्च ऑप्टिमायझेशन
- AI-विशिष्ट तैनाती समस्यांचे निवारण

### शिकण्याची उद्दिष्टे

हा संरचित कोर्स पूर्ण केल्यावर, आपण:
- **AZD मूलतत्त्वे मास्टर करा**: मुख्य संकल्पना, स्थापना आणि कॉन्फिगरेशन
- **AI अॅप्लिकेशन्स तैनात करा**: Microsoft Foundry सेवांसह AZD वापरा
- **इन्फ्रास्ट्रक्चर as कोड अंमलात आणा**: Bicep टेम्पलेट्स वापरून Azure संसाधने व्यवस्थापित करा
- **तैनात करण्यातील समस्या सोडवा**: सामान्य समस्या निराकरण करा आणि डिबग करा
- **उत्पादनासाठी ऑप्टिमाइझ करा**: सुरक्षा, स्केलिंग, मॉनिटरिंग, आणि खर्च व्यवस्थापन
- **मल्टी-एजंट सोल्यूशन्स तयार करा**: क्लिष्ट AI आर्किटेक्चर्स तैनात करा

## सुरुवात करण्यापूर्वी: खाते, प्रवेश, आणि गृहीतके

अध्याय 1 सुरू करण्यापूर्वी, खालील गोष्टींची खात्री करा. या मार्गदर्शनातील स्थापना पावले आधीच हाताळली आहेत असे गृहीत धरले आहे.

- **एक Azure सदस्यता**: आपण कार्यासाठी किंवा आपल्या स्वतःच्या खात्यापासून विद्यमान सदस्यता वापरू शकता, किंवा सुरुवात करण्यासाठी [फ्री ट्रायल](https://aka.ms/azurefreetrial) तयार करा.
- **Azure संसाधने तयार करण्याची परवानगी**: बऱ्याच व्यायामांसाठी, आपल्याकडे लक्ष्य सदस्यता किंवा संसाधन गटावर किमान **Contributor** प्रवेश असावा. काही अध्यायात आपल्याला संसाधन गट, व्यवस्थापित ओळख आणि RBAC असाइनमेंट तयार करण्याची अनुमती गृहीत धरली जाते.
- [**GitHub खाते**](https://github.com): रिपॉझिटरी फोर्क करण्यासाठी, आपले बदल ट्रॅक करण्यासाठी, आणि कार्यशाळेसाठी GitHub Codespaces वापरण्यासाठी उपयुक्त.
- **टेम्पलेट रनटाइम पूर्वसूचना**: काही टेम्पलेट्ससाठी स्थानिक साधनांची गरज असते जसे Node.js, Python, Java, किंवा Docker. सुरुवात करण्यापूर्वी सेटअप व्हॅलिडेटर चालवा जेणेकरून गहाळ साधने लवकर ओळखली जातील.
- **मूलभूत टर्मिनल ओळख**: आपण तज्ञ असणे आवश्यक नाही, पण `git clone`, `azd auth login`, आणि `azd up` सारख्या कमांड्स चालवण्यास आरामदायक असावे.

> **एंटरप्राइझ सदस्यत काम करत आहात?**
> आपल्या Azure वातावरणाचे व्यवस्थापन प्रशासकाकडून केले जात असल्यास, आपण ज्या सदस्यता किंवा संसाधन गटात संसाधने तैनात करणार आहात त्याची पूर्वसूचना करून घ्या. नसेल तर सुरुवात करण्यापूर्वी सॅंडबॉक्स सदस्यता किंवा Contributor प्रवेश मागा.

> **Azure मध्ये नवीन आहात?**
> सुरुवात करण्यासाठी आपली स्वतःची Azure ट्रायल किंवा पे-ए-गो सदस्यता https://aka.ms/azurefreetrial येथे सुरू करा जेणेकरून आपण टेनंट-स्तरीय मान्यतेची प्रतीक्षा न करता व्यायाम पूर्ण करू शकाल.

## 🗺️ कोर्स नकाशा: अध्यायांनुसार जलद नेव्हिगेशन

प्रत्येक अध्यायासाठी समर्पित README आहे ज्यात शिकण्याची उद्दिष्टे, जलद सुरूवात, आणि व्यायाम आहेत:

| अध्याय | विषय | धडे | कालावधी | गुंतागुंत |
|---------|-------|---------|----------|------------|
| **[अध्याय 1: पाया](docs/chapter-01-foundation/README.md)** | सुरुवात | [AZD मूलतत्त्वे](docs/chapter-01-foundation/azd-basics.md) &#124; [इंस्टॉलेशन](docs/chapter-01-foundation/installation.md) &#124; [पहिला प्रोजेक्ट](docs/chapter-01-foundation/first-project.md) | 30-45 मिनिटे | ⭐ |
| **[अध्याय 2: AI विकास](docs/chapter-02-ai-development/README.md)** | AI-प्रथम अॅप्स | [Foundry एकत्रीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI एजंट्स](docs/chapter-02-ai-development/agents.md) &#124; [मॉडेल तैनाती](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [कार्यशाळा](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 तास | ⭐⭐ |
| **[अध्याय 3: कॉन्फिगरेशन](docs/chapter-03-configuration/README.md)** | प्रमाणीकरण आणि सुरक्षा | [कॉन्फिगरेशन](docs/chapter-03-configuration/configuration.md) &#124; [प्रमाणीकरण आणि सुरक्षा](docs/chapter-03-configuration/authsecurity.md) | 45-60 मिनिटे | ⭐⭐ |
| **[अध्याय 4: इन्फ्रास्ट्रक्चर](docs/chapter-04-infrastructure/README.md)** | IaC आणि तैनाती | [तैनाती मार्गदर्शक](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [प्रोव्हिजनिंग](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 तास | ⭐⭐⭐ |
| **[अध्याय 5: मल्टी-एजंट](docs/chapter-05-multi-agent/README.md)** | AI एजंट सोल्यूशन्स | [रिटेल सीनारीओ](examples/retail-scenario.md) &#124; [संयोजन नमुने](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 तास | ⭐⭐⭐⭐ |
| **[अध्याय 6: पूर्व-तैनाती](docs/chapter-06-pre-deployment/README.md)** | नियोजन आणि पुष्टीकरण | [पूर्व-चाचण्या](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [क्षमता नियोजन](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU निवड](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [अप्लिकेशन इनसाइट्स](docs/chapter-06-pre-deployment/application-insights.md) | 1 तास | ⭐⭐ |
| **[अध्याय 7: समस्या निराकरण](docs/chapter-07-troubleshooting/README.md)** | डिबग आणि निराकरण | [सामान्य समस्या](docs/chapter-07-troubleshooting/common-issues.md) &#124; [डिबगिंग](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI समस्या](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 तास | ⭐⭐ |
| **[अध्याय 8: उत्पादन](docs/chapter-08-production/README.md)** | एंटरप्राइझ नमुने | [उत्पादन पद्धती](docs/chapter-08-production/production-ai-practices.md) | 2-3 तास | ⭐⭐⭐⭐ |
| **[🎓 कार्यशाळा](workshop/README.md)** | प्रत्यक्ष प्रयोगशाळा | [परिचय](workshop/docs/instructions/0-Introduction.md) &#124; [निवड](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [पुष्टीकरण](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [विघटन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [कॉन्फिगरेशन](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [सानुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [टियरडाउन](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [समारोप](workshop/docs/instructions/7-Wrap-up.md) | 3-4 तास | ⭐⭐ |

**एकूण कोर्स कालावधी:** ~10-14 तास | **कौशल्य प्रगती:** सुरुवातीपासून → उत्पादन-तयार

---

## 📚 शिकण्याचे अध्याय

*अनुभव पातळी आणि उद्दिष्टांनुसार आपला शिकण्याचा मार्ग निवडा*

### 🚀 अध्याय 1: पाया आणि जलद सुरुवात
**पूर्वअटी**: Azure सदस्यता, मूलभूत कमांड लाइन ज्ञान  
**कालावधी**: 30-45 मिनिटे  
**गुंतागुंत**: ⭐

#### आपल्याला काय शिकायला मिळेल
- Azure Developer CLI मूलतत्त्वे समजून घेणे
- आपल्या प्लॅटफॉर्मवर AZD ची स्थापना
- आपले पहिले यशस्वी तैनाती

#### शिकण्याची साधने
- **🎯 येथे सुरुवात करा**: [Azure Developer CLI म्हणजे काय?](#what-is-azure-developer-cli)
- **📖 सिद्धांत**: [AZD मूलतत्त्वे](docs/chapter-01-foundation/azd-basics.md) - मुख्य संकल्पना आणि टर्मिनॉलॉजी
- **⚙️ सेटअप**: [इंस्टॉलेशन आणि सेटअप](docs/chapter-01-foundation/installation.md) - प्लॅटफॉर्म-विशिष्ट मार्गदर्शक
- **🛠️ प्रत्यक्ष करा**: [आपला पहिला प्रोजेक्ट](docs/chapter-01-foundation/first-project.md) - टप्प्याटप्प्याने ट्युटोरियल
- **📋 जलद संदर्भ**: [कमांड चीट शीट](resources/cheat-sheet.md)

#### व्यावहारिक व्यायाम
```bash
# जलद स्थापनेची तपासणी
azd version

# आपली पहिले ऍप्लिकेशन तैनात करा
azd init --template todo-nodejs-mongo
azd up
```

**💡 अध्यायाचा निकाल**: AZD वापरून Azure वर एक सोपा वेब अॅप्लिकेशन यशस्वीपणे तैनात करा

**✅ यश पुष्टीकरण:**
```bash
# अध्याय 1 पूर्ण केल्यानंतर, आपण सक्षम असावे:
azd version              # स्थापित आवृत्ती दर्शविते
azd init --template todo-nodejs-mongo  # प्रकल्प प्रारंभित करतो
azd up                  # Azure वर तैनात करतो
azd show                # चालू असलेल्या अॅपचा URL दर्शवितो
# अॅप्लिकेशन ब्राउझरमध्ये उघडते आणि कार्य करते
azd down --force --purge  # संसाधने स्वच्छ करतो
```

**📊 वेळ खर्च:** 30-45 मिनिटे  
**📈 नंतर कौशल्य स्तर:** मूलभूत अॅप्लिकेशन्स स्वतंत्रपणे तैनात करू शकतो
**📈 नंतर कौशल्य स्तर:** मूलभूत अॅप्लिकेशन्स स्वतंत्रपणे तैनात करू शकतो

---

### 🤖 अध्याय 2: AI-प्रथम विकास (AI विकसकांसाठी शिफारस)
**पूर्वअटी**: अध्याय 1 पूर्ण केला  
**कालावधी**: 1-2 तास  
**गुंतागुंत**: ⭐⭐

#### आपल्याला काय शिकायला मिळेल
- AZD सह Microsoft Foundry चे एकत्रीकरण
- AI-समर्थित अॅप्लिकेशन्स तैनात करणे
- AI सेवा कॉन्फिगरेशन समजून घेणे

#### शिकण्याची साधने
- **🎯 येथे सुरुवात करा**: [Microsoft Foundry एकत्रीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI एजंट्स**: [AI एजंट्स मार्गदर्शक](docs/chapter-02-ai-development/agents.md) - AZD सह बुद्धिमान एजंट्स तैनात करा
- **📖 नमुने**: [AI मॉडेल तैनाती](docs/chapter-02-ai-development/ai-model-deployment.md) - AI मॉडेल तैनात करा आणि व्यवस्थापित करा
- **🛠️ कार्यशाळा**: [AI कार्यशाळा लॅब](docs/chapter-02-ai-development/ai-workshop-lab.md) - आपले AI सोल्यूशन्स AZD-तयार करा
- **🎥 इंटरऍक्टिव्ह मार्गदर्शक**: [कार्यशाळा साहित्य](workshop/README.md) - MkDocs * DevContainer वातावरणासह ब्राउझर-आधारित शिक्षण
- **📋 टेम्पलेट्स**: [Microsoft Foundry टेम्पलेट्स](#कार्यशाळा-संसाधने)
- **📝 उदाहरणे**: [AZD तैनाती उदाहरणे](examples/README.md)

#### व्यावहारिक व्यायाम
```bash
# आपली पहिली AI अ‍ॅप्लिकेशन तैनात करा
azd init --template azure-search-openai-demo
azd up

# अतिरिक्त AI टेम्पलेट्स प्रयत्न करा
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 अध्यायाचा निकाल**: RAG क्षमतांसह AI-शक्तीशाली चॅट अॅप्लिकेशन तैनात आणि कॉन्फिगर करा

**✅ यश पुष्टीकरण:**
```bash
# अध्याय 2 नंतर, तुम्ही खालील गोष्टी करू शकता:
azd init --template azure-search-openai-demo
azd up
# एआय चॅट इंटरफेसची तपासणी करा
# प्रश्न विचारा आणि स्रोतांसह एआय-शक्तीने चालणारे प्रतिसाद मिळवा
# शोध एकत्रीकरण कार्यरत आहे का ते पडताळा
azd monitor  # Application Insights टेलिमेट्री दर्शवते का ते तपासा
azd down --force --purge
```

**📊 वेळ खर्च:** 1-2 तास  
**📈 नंतर कौशल्य स्तर:** उत्पादन-तयार AI अॅप्लिकेशन्स तैनात आणि कॉन्फिगर करू शकतो  
**💰 खर्च जागरूकता:** $80-150/महिना विकास खर्च, $300-3500/महिना उत्पादन खर्च समजून घ्या

#### 💰 AI तैनातीसाठी खर्च विचार

**विकास वातावरण (अंदाजे $80-150/महिना):**
- Microsoft Foundry मॉडेल्स (पे-ए-गो): $0-50/महिना (टोकन वापरावर आधारित)
- AI सर्च (मूलभूत टियर): $75/महिना
- कंटेनर अॅप्स (वापरावर आधारित): $0-20/महिना
- स्टोरेज (स्टँडर्ड): $1-5/महिना

**उत्पादन वातावरण (अंदाजे $300-3,500+/महिना):**
- Microsoft Foundry मॉडेल्स (सातत्यपूर्ण कामगिरीसाठी PTU): $3,000+/महिना किंवा मोठ्या प्रमाणावर पे-ए-गो
- AI सर्च (स्टँडर्ड टियर): $250/महिना
- कंटेनर अॅप्स (डेडिकेटेड): $50-100/महिना
- अप्लिकेशन इनसाइट्स: $5-50/महिना
- स्टोरेज (प्रीमियम): $10-50/महिना

**💡 खर्च ऑप्टिमायझेशन टिप्स:**
- शिक्षणासाठी **फ्री टियर** Microsoft Foundry मॉडेल्स वापरा (Azure OpenAI 50,000 टोकन्स/महिना समाविष्ट)
- सक्रिय विकास नाही तेव्हा `azd down` वापरून संसाधने मुक्त करा
- वापरावर आधारित बिलिंगपासून सुरू करा, उत्पादनासाठी केवळ PTU अपग्रेड करा
- तैनातीपूर्वी खर्चाचा अंदाज घेण्यासाठी `azd provision --preview` वापरा
- ऑटो-स्केलिंग सक्षम करा: केवळ खऱ्या वापरासाठी भरा

**खर्च देखरेख:**
```bash
# अंदाजे मासिक खर्च तपासा
azd provision --preview

# Azure Portal मधील प्रत्यक्ष खर्चावर नियंत्रण ठेवा
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ अध्याय 3: कॉन्फिगरेशन आणि प्रमाणीकरण
**पूर्वअटी**: अध्याय 1 पूर्ण केला  
**कालावधी**: 45-60 मिनिटे  
**गुंतागुंत**: ⭐⭐

#### आपल्याला काय शिकायला मिळेल
- वातावरण कॉन्फिगरेशन आणि व्यवस्थापन
- प्रमाणीकरण आणि सुरक्षा सर्वोत्तम पद्धती
- संसाधन नावेकरण आणि संघटना

#### शिकण्याची साधने
- **📖 कॉन्फिगरेशन**: [कॉन्फिगरेशन मार्गदर्शक](docs/chapter-03-configuration/configuration.md) - वातावरण सेटअप
- **🔐 सुरक्षा**: [प्रमाणीकरण नमुने आणि व्यवस्थापित ओळख](docs/chapter-03-configuration/authsecurity.md) - प्रमाणीकरण नमुने
- **📝 उदाहरणे**: [डेटाबेस अॅप उदाहरण](examples/database-app/README.md) - AZD डेटाबेस उदाहरणे

#### व्यावहारिक व्यायाम
- अनेक वातावरण कॉन्फिगर करा (dev, staging, prod)
- व्यवस्थापित ओळख प्रमाणीकरण सेटअप करा
- वातावरण-विशिष्ट कॉन्फिगरेशन अंमलात आणा

**💡 अध्यायाचा निकाल**: अनेक वातावरणे योग्य प्रमाणीकरण आणि सुरक्षा सह व्यवस्थापित करा

---

### 🏗️ अध्याय 4: इन्फ्रास्ट्रक्चर as कोड आणि तैनाती
**पूर्वअटी**: अध्याय 1-3 पूर्ण केले  
**कालावधी**: 1-1.5 तास  
**गुंतागुंत**: ⭐⭐⭐

#### आपल्याला काय शिकायला मिळेल
- प्रगत तैनाती नमुने
- Bicep सह इन्फ्रास्ट्रक्चर as कोड
- संसाधन प्रोव्हिजनिंग धोरणे

#### शिकण्याची साधने
- **📖 तैनाती**: [तैनाती मार्गदर्शक](docs/chapter-04-infrastructure/deployment-guide.md) - पूर्ण वर्कफ्लोज
- **🏗️ प्रोव्हिजनिंग**: [संसाधने प्रोव्हिजनिंग](docs/chapter-04-infrastructure/provisioning.md) - Azure संसाधन व्यवस्थापन
- **📝 उदाहरणे**: [कंटेनर अॅप उदाहरण](../../examples/container-app) - कंटेनराइज्ड तैनाती

#### व्यावहारिक व्यायाम
- कस्टम Bicep टेम्पलेट्स तयार करा
- मल्टी-सेवा अॅप्लिकेशन्स तैनात करा
- ब्लू-ग्रीन तैनाती धोरणे अंमलात आणा

**💡 अध्यायाचा निकाल**: कस्टम इन्फ्रास्ट्रक्चर टेम्पलेट्स वापरून क्लिष्ट मल्टी-सेवा अॅप्लिकेशन्स तैनात करा

---


### 🎯 अध्याय 5: मल्टी-एजंट AI सोल्यूशन्स (प्रगत)
**पूर्वअट**: अध्याय 1-2 पूर्ण झालेले  
**कालावधी**: 2-3 तास  
**कठीणाई**: ⭐⭐⭐⭐

#### तुम्ही काय शिकाल
- मल्टी-एजंट आर्किटेक्चर पॅटर्न्स
- एजंट ऑर्केस्ट्रेशन आणि समन्वय
- उत्पादन-तयार AI डिप्लॉयमेंट्स

#### शिक्षण संसाधने
- **🤖 वैशिष्ट्यीकृत प्रोजेक्ट**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - पूर्ण अंमलबजावणी
- **🛠️ ARM टेम्पलेट्स**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - एक-क्लिक डिप्लॉयमेंट
- **📖 आर्किटेक्चर**: [मल्टी-एजंट समन्वय पॅटर्न्स](docs/chapter-06-pre-deployment/coordination-patterns.md) - पॅटर्न्स

#### व्यावहारिक सराव
```bash
# संपूर्ण किरकोळ बहु-एजंट समाधान तैनात करा
cd examples/retail-multiagent-arm-template
./deploy.sh

# एजंट कॉन्फिगरेशन एक्सप्लोर करा
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 अध्याय निष्कर्ष**: Customer आणि Inventory एजंटसह उत्पादन-तयार मल्टी-एजंट AI सोल्यूशन डिप्लॉय करा आणि व्यवस्थापित करा

---

### 🔍 अध्याय 6: प्री-डिप्लॉयमेंट पडताळणी व नियोजन
**पूर्वअट**: अध्याय 4 पूर्ण झालेले  
**कालावधी**: 1 तास  
**कठीणाई**: ⭐⭐

#### तुम्ही काय शिकाल
- क्षमता नियोजन आणि संसाधन पडताळणी
- SKU निवड धोरणे
- प्री-फ्लाइट चेक्स आणि ऑटोमेशन

#### शिक्षण संसाधने
- **📊 नियोजन**: [क्षमता नियोजन](docs/chapter-06-pre-deployment/capacity-planning.md) - संसाधन पडताळणी
- **💰 निवड**: [SKU निवड](docs/chapter-06-pre-deployment/sku-selection.md) - खर्च-प्रभावी पर्याय
- **✅ पडताळणी**: [प्री-फ्लाइट चेक्स](docs/chapter-06-pre-deployment/preflight-checks.md) - स्वयंचलित स्क्रिप्ट्स

#### व्यावहारिक सराव
- क्षमता पडताळणी स्क्रिप्ट्स चालवा
- खर्चासाठी SKU निवडींचा ऑप्टिमायझेशन करा
- ऑटोमेटेड प्री-डिप्लॉयमेंट चेक्स अमलात आणा

**💡 अध्याय निष्कर्ष**: अंमलबजावणीपूर्वी डिप्लॉयमेंट्स पडताळा आणि ऑप्टिमाइझ करा

---

### 🚨 अध्याय 7: त्रुटी निराकरण आणि डीबगिंग
**पूर्वअट**: कोणताही डिप्लॉयमेंट अध्याय पूर्ण  
**कालावधी**: 1-1.5 तास  
**कठीणाई**: ⭐⭐

#### तुम्ही काय शिकाल
- प्रणालीगत डीबगिंग पद्धती
- सामान्य समस्या आणि त्यांचे उपाय
- AI-विशिष्ट त्रुटी निराकरण

#### शिक्षण संसाधने
- **🔧 सामान्य समस्या**: [सामान्य समस्या](docs/chapter-07-troubleshooting/common-issues.md) - FAQ व उपाय
- **🕵️ डीबगिंग**: [डीबगिंग मार्गदर्शक](docs/chapter-07-troubleshooting/debugging.md) - टप्प्याटप्प्याने धोरणे
- **🤖 AI समस्या**: [AI-विशिष्ट त्रुटी निराकरण](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI सेवा समस्या

#### व्यावहारिक सराव
- डिप्लॉयमेंट अपयशांचे निदान करा
- प्रमाणीकरण समस्या सोडवा
- AI सेवा कनेक्टिव्हिटी डीबग करा

**💡 अध्याय निष्कर्ष**: स्वातंत्र्याने सामान्य डिप्लॉयमेंट समस्या ओळखा आणि सोडवा

---

### 🏢 अध्याय 8: उत्पादन आणि एंटरप्राइज पॅटर्न्स
**पूर्वअट**: अध्याय 1-4 पूर्ण झालेले  
**कालावधी**: 2-3 तास  
**कठीणाई**: ⭐⭐⭐⭐

#### तुम्ही काय शिकाल
- उत्पादन डिप्लॉयमेंट धोरणे
- एंटरप्राइज सुरक्षा पॅटर्न्स
- मॉनिटरिंग आणि खर्च ऑप्टिमायझेशन

#### शिक्षण संसाधने
- **🏭 उत्पादन**: [उत्पादन AI सर्वोत्तम पद्धती](docs/chapter-08-production/production-ai-practices.md) - एंटरप्राइज पॅटर्न्स
- **📝 उदाहरणे**: [मायक्रोसर्व्हिसेस उदाहरण](../../examples/microservices) - जटिल आर्किटेक्चर्स
- **📊 मॉनिटरिंग**: [अॅप्लिकेशन इनसाइट्स इंटीग्रेशन](docs/chapter-06-pre-deployment/application-insights.md) - मॉनिटरिंग

#### व्यावहारिक सराव
- एंटरप्राइज सुरक्षा पॅटर्न्स अमलात आणा
- सर्वसमावेशक मॉनिटरिंग सेटअप करा
- योग्य शासनावर उत्पादनात डिप्लॉय करा

**💡 अध्याय निष्कर्ष**: पूर्ण उत्पादन क्षमतांसह एंटरप्राइज-तयार अॅप्लिकेशन्स डिप्लॉय करा

---

## 🎓 कार्यशाळा आढावा: हस्ताक्षर शिक्षण अनुभव

> **⚠️ कार्यशाळा स्थिती: सक्रिय विकास**  
> कार्यशाळा साहित्य सध्या विकसित आणि सुधारित केली जात आहे. मुख्य मॉड्यूल कार्यान्वित आहेत, पण काही प्रगत विभाग अपूर्ण आहेत. आम्ही सर्व सामग्री पूर्ण करण्यासाठी सक्रियपणे काम करत आहोत. [प्रगती ट्रॅक करा →](workshop/README.md)

### इंटरएक्टिव कार्यशाळा साहित्य
**ब्राउझर-आधारित साधने आणि मार्गदर्शित सरावांसह सर्वसमावेशक हस्ताक्षर शिकणे**

आमची कार्यशाळा साहित्य वरील अध्याय-आधारित अभ्यासक्रमास पूरक संरचित, इंटरएक्टिव शिकण्याचा अनुभव देते. ही कार्यशाळा स्व-स्पीड शिकण्यासाठी तसेच प्रशिक्षक-नेतृत्वाखालील सत्रांसाठी डिझाइन केलेली आहे.

#### 🛠️ कार्यशाळा वैशिष्ट्ये
- **ब्राउझर-आधारित इंटरफेस**: MkDocs-आधारित पूर्ण कार्यशाळा शोध, कॉपी, आणि थीम वैशिष्ट्यांसहित
- **GitHub Codespaces इंटीग्रेशन**: एक-क्लिक डेव्हलपमेंट वातावरण सेटअप
- **संरचित शिकण्याचा मार्ग**: 8-मॉड्यूल मार्गदर्शित सराव (एकूण 3-4 तास)
- **प्रगत पद्धतशास्त्र**: परिचय → निवड → पडताळणी → विघटन → कॉन्फिगरेशन → सानुकूलन → विघटन → संक्षेप
- **इंटरएक्टिव देवकंटेनर वातावरण**: पूर्व-संरचित साधने आणि अवलंबित्वे

#### 📚 कार्यशाळा मॉड्यूल रचना
कार्यशाळा **8-मॉड्यूल प्रगत पद्धतशास्त्र** अनुसरते ज्यामुळे तुम्हाला शोधाशोध पासून डिप्लॉयमेंट मास्टरीपर्यंत घेऊन जाते:

| मॉड्यूल | विषय | तुम्ही काय कराल | कालावधी |
|--------|-------|----------------|----------|
| **0. परिचय** | कार्यशाळा आढावा | शिकण्याचे उद्दिष्टे, पूर्वअट, आणि कार्यशाळा रचना समजा | 15 मिनिटे |
| **1. निवड** | टेम्पलेट शोध | AZD टेम्पलेट्सचा अभ्यास करा व तुमच्या परिस्थितीसाठी योग्य AI टेम्पलेट निवडा | 20 मिनिटे |
| **2. पडताळणी** | डिप्लॉय व पडताळा | `azd up` वापरून टेम्पलेट डिप्लॉय करा आणि इन्फ्रास्ट्रक्चर कार्यरत आहे याची पडताळणी करा | 30 मिनिटे |
| **3. विघटन** | रचना समजून घ्या | GitHub Copilot वापरून टेम्पलेट आर्किटेक्चर, Bicep फाइल्स, आणि कोड संघटन शोधा | 30 मिनिटे |
| **4. कॉन्फिगरेशन** | azure.yaml सखोल अभ्यास | `azure.yaml` कॉन्फिगरेशन, लाइफसायकल हुक्स, आणि पर्यावरणीय चल समजून घ्या | 30 मिनिटे |
| **5. सानुकूलन** | स्वतःचे करा | AI शोध सक्षम करा, ट्रेसिंग, मूल्यांकन, आणि तुमच्या परिस्थितीसाठी सानुकूल करा | 45 मिनिटे |
| **6. विघटन** | साफसफाई करा | `azd down --purge` वापरून संसाधने सुरक्षितपणे काढा | 15 मिनिटे |
| **7. संक्षेप** | पुढील पावले | साध्य केलेल्या गोष्टींचा आढावा घ्या, मुख्य संकल्पना आणि तुमचा शिकण्याचा प्रवास सुरू ठेवा | 15 मिनिटे |

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
# संग्रहात "Code" → "Create codespace on main" क्लिक करा

# पर्याय 2: स्थानिक विकास
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md मधील सेटअप सूचनांचे पालन करा
```

#### 🎯 कार्यशाळा शिकण्याचे परिणाम
कार्यशाळा पूर्ण केल्यावर, सहभागी हे करू शकतील:
- **उत्पादन AI अॅप्लिकेशन्स डिप्लॉय करा**: Microsoft Foundry सेवांसह AZD वापरा
- **मल्टी-एजंट आर्किटेक्चर्स मास्टर करा**: समन्वित AI एजंट सोल्यूशन्स लागू करा
- **सुरक्षा सर्वोत्तम पद्धती अमलात आणा**: प्रमाणीकरण आणि प्रवेश नियंत्रण कॉन्फिगर करा
- **स्केलसाठी ऑप्टिमाइझ करा**: खर्च-प्रभावी आणि कार्यक्षम डिप्लॉयमेंट्स डिझाइन करा
- **डिप्लॉयमेंट्सचे त्रुटी निराकरण करा**: सामान्य समस्या स्वतंत्रपणे सोडवा

#### 📖 कार्यशाळा संसाधने
- **🎥 इंटरएक्टिव मार्गदर्शक**: [कार्यशाळा साहित्य](workshop/README.md) - ब्राउझर-आधारित शिकण्याचे वातावरण
- **📋 मॉड्यूलनिहाय सूचना**:
  - [0. परिचय](workshop/docs/instructions/0-Introduction.md) - कार्यशाळा आढावा आणि उद्दिष्टे
  - [1. निवड](workshop/docs/instructions/1-Select-AI-Template.md) - AI टेम्पलेट्स शोधा आणि निवडा
  - [2. पडताळणी](workshop/docs/instructions/2-Validate-AI-Template.md) - टेम्पलेट्स डिप्लॉय आणि पडताळणी करा
  - [3. विघटन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - टेम्पलेट आर्किटेक्चर शोधा
  - [4. कॉन्फिगरेशन](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml मास्टरी करा
  - [5. सानुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) - तुमच्या परिस्थितीसाठी सानुकूल करा
  - [6. विघटन](workshop/docs/instructions/6-Teardown-Infrastructure.md) - संसाधने साफ करा
  - [7. संक्षेप](workshop/docs/instructions/7-Wrap-up.md) - पुनरावलोकन आणि पुढील पावले
- **🛠️ AI कार्यशाळा लॅब**: [AI कार्यशाळा लॅब](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-केंद्रित सराव
- **💡 जलद प्रारंभ**: [कार्यशाळा सेटअप मार्गदर्शक](workshop/README.md#quick-start) - पर्यावरण कॉन्फिगरेशन

**परफेक्ट साठी**: कॉर्पोरेट प्रशिक्षण, विद्यापीठ कोर्सेस, स्व-स्पीड शिक्षा, आणि डेव्हलपर बूटकॅम्प्स.

---

## 📖 सखोल अभ्यास: AZD क्षमता

मूलभूतांसाठी पुढे, AZD उत्पादन डिप्लॉयमेंटसाठी प्रभावी वैशिष्ट्ये प्रदान करते:

- **टेम्पलेट-आधारित डिप्लॉयमेंट्स** - सामान्य अॅप्लिकेशन पॅटर्न्ससाठी पूर्व-निर्मित टेम्पलेट्स वापरा
- **इन्फ्रास्ट्रक्चर एज कोड** - Bicep किंवा Terraform वापरून Azure संसाधने व्यवस्थापित करा  
- **संपूर्ण वर्कफ्लोज** - सलग रूपात प्राव्हिजन, डिप्लॉय आणि मॉनिटरिंग करा
- **डेव्हलपर-मैत्रीपूर्ण** - डेव्हलपर उत्पादकता आणि अनुभवासाठी ऑप्टिमाइझ केलेले

### **AZD + Microsoft Foundry: AI डिप्लॉयमेंटसाठी परफेक्ट**

**AI सोल्यूशन्ससाठी का AZD?** AZD हे AI डेव्हलपरना येणाऱ्या प्रमुख अडचणींना संबोधते:

- **AI-तयार टेम्पलेट्स** - Microsoft Foundry मॉडेल्स, Azure AI सेवा, आणि ML वर्कलोडसाठी पूर्व-कॉन्फिगर केलेले टेम्पलेट्स
- **सुरक्षित AI डिप्लॉयमेंट्स** - AI सेवा, API कीज, आणि मॉडेल एंडपॉइंटसाठी अंगभूत सुरक्षा पॅटर्न्स  
- **उत्पादन AI पॅटर्न्स** - स्केलेबल, खर्च-प्रभावी AI अॅप्लिकेशन डिप्लॉयमेंटसाठी सर्वोत्तम पद्धती
- **एंड-टू-एंड AI वर्कफ्लोज** - मॉडेल विकासापासून उत्पादन डिप्लॉयमेंटपर्यंत योग्य मॉनिटरिंग सह
- **खर्च ऑप्टिमायझेशन** - AI वर्कलोडसाठी स्मार्ट संसाधन वाटप आणि स्केलिंग धोरणे
- **Microsoft Foundry इंटीग्रेशन** - Microsoft Foundry मॉडेल कॅटलॉग आणि एंडपॉइंटशी सलग कनेक्शन

---

## 🎯 टेम्पलेट्स व उदाहरणे ग्रंथालय

### वैशिष्ट्यीकृत: Microsoft Foundry टेम्पलेट्स
**AI अॅप्लिकेशन्स डिप्लॉय करत असल्यास येथे सुरू करा!**

> **टीप:** हे टेम्पलेट्स विविध AI पॅटर्न्स दर्शवितात. काही बाह्य Azure नमुने आहेत, तर काही स्थानिक अंमलबजावणी.

| टेम्पलेट | अध्याय | कठीणाई | सेवा | प्रकार |
|----------|---------|------------|----------|------|
| [**AI चॅटसह प्रारंभ करा**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | बाह्य |
| [**AI एजंटसह प्रारंभ करा**](https://github.com/Azure-Samples/get-started-with-ai-agents) | अध्याय 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| बाह्य |
| [**Azure Search + OpenAI डेमो**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | बाह्य |
| [**OpenAI चॅट अॅप क्विकस्टार्ट**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | बाह्य |
| [**एजंट OpenAI पाइथन Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | बाह्य |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | बाह्य |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **स्थानिक** |

### वैशिष्ट्यीकृत: पूर्ण शिक्षण परिस्थिती
**प्रशिक्षण अध्यायांसाठी नकाशित उत्पादन-तयार अॅप्लिकेशन टेम्पलेट्स**

| टेम्पलेट | शिक्षण अध्याय | कठीणाई | मुख्य शिक्षण |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | मूलभूत AI डिप्लॉयमेंट पॅटर्न्स |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | Azure AI Searchसह RAG अंमलबजावणी |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | अध्याय 4 | ⭐⭐ | दस्तऐवज बुद्धिमत्ता समाकलन |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | एजंट फ्रेमवर्क आणि फंक्शन कॉलिंग |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐ | एंटरप्राइज AI ऑर्केस्ट्रेशन |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | Customer आणि Inventory एजंटसह मल्टी-एजंट आर्किटेक्चर |

### उदाहरण प्रकारांनुसार शिक्षण

> **📌 स्थानिक विरुद्ध बाह्य उदाहरणे:**  
> **स्थानिक उदाहरणे** (या रिपॉजिटरीतील) = तत्काळ वापरासाठी तयार  
> **बाह्य उदाहरणे** (Azure नमुने) = संबंधित रिपॉजिटरीजमधून क्लोन करा

#### स्थानिक उदाहरणे (तत्काळ वापरासाठी तयार)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM टेम्पलेट्ससह पूर्ण उत्पादन-तयार अंमलबजावणी
  - मल्टी-एजंट आर्किटेक्चर (Customer + Inventory एजंटस)
  - सर्वसमावेशक मॉनिटरिंग आणि मूल्यमापन
  - ARM टेम्पलेटद्वारे एक-क्लिक डिप्लॉयमेंट

#### स्थानिक उदाहरणे - कंटेनर अॅप्लिकेशन्स (अध्याय 2-5)
**या रिपॉजिटरीमध्ये सर्वसमावेशक कंटेनर डिप्लॉयमेंट उदाहरणे:**

- [**कंटेनर अॅप उदाहरणे**](examples/container-app/README.md) - कंटेनरायझ्ड डिप्लॉयमेंटसाठी संपूर्ण मार्गदर्शक
  - [सिंपल Flask API](../../examples/container-app/simple-flask-api) - स्केल-टू-झीरोसह मूलभूत REST API
  - [मायक्रोसर्व्हिस आर्किटेक्चर](../../examples/container-app/microservices) - उत्पादनासाठी तयार मल्टी-सर्व्हिस डिप्लॉयमेंट
  - जलद प्रारंभ, उत्पादन, आणि प्रगत डिप्लॉयमेंट पॅटर्न
  - मॉनिटरिंग, सुरक्षा, आणि खर्च ऑप्टिमायझेशन मार्गदर्शन

#### बाह्य उदाहरणे - सोपी अॅप्लिकेशन्स (अध्याय 1-2)
**सुरू करण्यासाठी या Azure सॅम्पल रिपॉझिटरीज क्लोन करा:**
- [सिंपल वेब अॅप - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - मूलभूत डिप्लॉयमेंट पॅटर्नस
- [स्टॅटिक वेबसाइट - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - स्थिर सामग्री डिप्लॉयमेंट
- [कंटेनर अॅप - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API डिप्लॉयमेंट

#### बाह्य उदाहरणे - डेटाबेस इंटिग्रेशन (अध्याय 3-4)  
- [डेटाबेस अॅप - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - डेटाबेस कनेक्टिव्हिटी पॅटर्नस
- [फंक्शन्स + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - सर्व्हरलेस डेटा वर्कफ्लो

#### बाह्य उदाहरणे - प्रगत पॅटर्न्स (अध्याय 4-8)
- [जावा मायक्रोसर्व्हिसेस](https://github.com/Azure-Samples/java-microservices-aca-lab) - मल्टी-सर्व्हिस आर्किटेक्चर्स
- [कंटेनर अॅप्स जॉब्स](https://github.com/Azure-Samples/container-apps-jobs) - पार्श्वभूमी प्रक्रिया  
- [एंटरप्राइझ ML पाइपलाइन](https://github.com/Azure-Samples/mlops-v2) - उत्पादनासाठी तयार ML पॅटर्न्स

### बाह्य टेम्पलेट संग्रह
- [**अधिकृत AZD टेम्पलेट गॅलरी**](https://azure.github.io/awesome-azd/) - अधिकृत आणि समाजातील टेम्पलेट्सचा सुव्यवस्थित संग्रह
- [**Azure डेवलपर CLI टेम्पलेट्स**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - माईक्रोसॉफ्ट लर्न टेम्पलेट दस्तऐवजीकरण
- [**उदाहरणे निर्देशिका**](examples/README.md) - तपशीलवार स्पष्टीकरणांसह स्थानिक शिक्षण उदाहरणे

---

## 📚 शिक्षण संसाधने & संदर्भ

### जलद संदर्भ
- [**कमांड चीट शीट**](resources/cheat-sheet.md) - प्रत्येक अध्यायानुसार आवश्यक azd कमांड्स
- [**शब्दसंग्रह**](resources/glossary.md) - Azure आणि azd टर्मिनोलॉजी  
- [**वारंवार विचारले जाणारे प्रश्न**](resources/faq.md) - प्रत्येक अभ्यासाने आयोजन केलेले सामान्य प्रश्न
- [**अभ्यास मार्गदर्शक**](resources/study-guide.md) - व्यापक सराव प्रश्नावली

### हँड्स-ऑन कार्यशाळा
- [**AI कार्यशाळा लॅब**](docs/chapter-02-ai-development/ai-workshop-lab.md) - तुमची AI सोडवणे AZD-डिप्लॉय करण्यायोग्य बनवा (2-3 तास)
- [**इंटरएक्टिव्ह कार्यशाळा**](workshop/README.md) - MkDocs आणि GitHub Codespaces सह 8-मॉड्यूल मार्गदर्शित सराव
  - अनुसरण करा: परिचय → निवड → प्रमाणीकरण → विश्लेषण → कॉन्फिगरेशन → सानुकूलन → समाप्ती → आढावा

### बाह्य शिक्षण संसाधने
- [Azure डेवलपर CLI दस्तऐवज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर केंद्र](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure किमती कॅल्क्युलेटर](https://azure.microsoft.com/pricing/calculator/)
- [Azure स्थिती](https://status.azure.com/)

### तुमच्या संपादकासाठी AI एजंट कौशल्ये
- [**Microsoft Azure कौशल्ये skills.sh वर**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, डिप्लॉयमेंट, डायग्नोस्टिक्स, खर्च ऑप्टिमायझेशन, आणि बरेच काहीसाठी 37 मुक्त एजंट कौशल्ये. GitHub Copilot, Cursor, Claude Code किंवा कोणत्याही समर्थित एजंटमध्ये स्थापित करा:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 जलद समस्या निवारण मार्गदर्शक

**नवशिक्यांना सामान्य होणाऱ्या समस्या आणि तत्काळ उपाय:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# प्रथम AZD स्थापित करा
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# स्थापना सत्यापित करा
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

# तपासा
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
<summary><strong>❌ "azd up" मध्ये अर्ध्या मार्गावर अयशस्वी</strong></summary>

```bash
# पर्याय 1: स्वच्छ करा आणि पुन्हा प्रयत्न करा
azd down --force --purge
azd up

# पर्याय 2: फक्त ढाचा दुरुस्त करा
azd provision

# पर्याय 3: सविस्तर स्थिती तपासा
azd show

# पर्याय 4: Azure मॉनिटरमधील लॉग तपासा
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" किंवा "Token expired"</strong></summary>

```bash
# AZD साठी पुनःप्रमाणीकरण करा
azd auth logout
azd auth login

# ऐच्छिक: आपण az कमांड्स चालवत असाल तर Azure CLI देखील रीफ्रेशन करा
az logout
az login

# प्रमाणीकरणाची पडताळणी करा
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" किंवा नामकरणातील संघर्ष</strong></summary>

```bash
# AZD अद्वितीय नावे तयार करते, पण जर संघर्ष झाला:
azd down --force --purge

# मग नवीन वातावरणासह पुन्हा प्रयत्न करा
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ टेम्पलेट डिप्लॉयमेंट फार वेळ घेत आहे</strong></summary>

**सामान्य प्रतीक्षा वेळा:**
- सोपा वेब अॅप: 5-10 मिनिटे
- डेटाबेससह अॅप: 10-15 मिनिटे
- AI अॅप्लिकेशन्स: 15-25 मिनिटे (OpenAI प्राव्हिजनिंग मंद आहे)

```bash
# प्रगती तपासा
azd show

# जर >30 मिनिटे अडकले असाल तर, Azure पोर्टल तपासा:
azd monitor --overview
# अयशस्वी वितरण पहा
```
</details>

<details>
<summary><strong>❌ "Permission denied" किंवा "Forbidden"</strong></summary>

```bash
# आपला Azure भूमिका तपासा
az role assignment list --assignee $(az account show --query user.name -o tsv)

# आपल्याला किमान "Contributor" भूमिका आवश्यक आहे
# आपला Azure प्रशासकाला विनंती करा की तो द्या:
# - Contributor (संसाधनांसाठी)
# - User Access Administrator (भूमिका नियुक्तीसाठी)
```
</details>

<details>
<summary><strong>❌ डिप्लॉय केलेल्या अॅप्लिकेशनचा URL सापडत नाही</strong></summary>

```bash
# सर्व सेवा एंडपॉइंट दाखवा
azd show

# किंवा Azure पोर्टल उघडा
azd monitor

# विशिष्ट सेवा तपासा
azd env get-values
# *_URL व्हेरिएबल्स शोधा
```
</details>

### 📚 पूर्ण समस्या निवारण संसाधने

- **सामान्य समस्या मार्गदर्शक:** [तपशीलवार उपाय](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-संबंधित समस्या:** [AI समस्या निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **डिबगिंग मार्गदर्शक:** [पायरी-दर-पायरी डिबगिंग](docs/chapter-07-troubleshooting/debugging.md)
- **मदत घ्या:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 अभ्यासक्रम पूर्ण आणि प्रमाणपत्र

### प्रगती ट्रॅकिंग
प्रत्येक अध्यायात तुमचा शिक्षणाचा प्रगती ट्रॅक करा:

- [ ] **अध्याय 1**: मूलाधार व जलद प्रारंभ ✅
- [ ] **अध्याय 2**: AI-प्रथम विकास ✅  
- [ ] **अध्याय 3**: कॉन्फिगरेशन व प्रमाणीकरण ✅
- [ ] **अध्याय 4**: इन्फ्रास्ट्रक्चर अज कोड व डिप्लॉयमेंट ✅
- [ ] **अध्याय 5**: मल्टी-एजंट AI उपाय ✅
- [ ] **अध्याय 6**: पूर्व-डिप्लॉयमेंट पडताळणी व नियोजन ✅
- [ ] **अध्याय 7**: समस्या निवारण व डिबगिंग ✅
- [ ] **अध्याय 8**: उत्पादन व एंटरप्राइझ पॅटर्न ✅

### शिकण्याची पडताळणी
प्रत्येक अध्याय पूर्ण केल्यानंतर, तुमचे ज्ञान तपासा:
1. **व्यावहारिक सराव**: अध्यायातील हँड्स-ऑन डिप्लॉयमेंट पूर्ण करा
2. **ज्ञान तपासणी**: तुमच्या अध्यायासाठी FAQ विभाग पाहा
3. **समाज चर्चा**: Azure Discord मध्ये तुमचा अनुभव शेअर करा
4. **पुढचा अध्याय**: पुढच्या जटिलतेच्या स्तरावर जा

### अभ्यासक्रम पूर्णत्वाचे फायदे
सर्व अध्याय पूर्ण केल्यानंतर, तुमच्याकडे असेल:
- **उत्पादनाचा अनुभव**: Azure वर प्रत्यक्ष AI अॅप्लिकेशन्स डिप्लॉय केलेले
- **व्यावसायिक कौशल्ये**: एंटरप्राइझ-सज्ज डिप्लॉयमेंट क्षमता  
- **समाजातील मान्यता**: Azure डेव्हलपर समुदायाचा सक्रिय सदस्य
- **करिअर प्रगती**: मागणी असलेले AZD आणि AI डिप्लॉयमेंट कौशल्ये

---

## 🤝 समुदाय व समर्थन

### मदत व समर्थन घ्या
- **तांत्रिक समस्या**: [बग अहवाल आणि फीचर विनंत्या](https://github.com/microsoft/azd-for-beginners/issues)
- **शिकण्याचे प्रश्न**: [मायक्रोसॉफ्ट Azure Discord समुदाय](https://discord.gg/microsoft-azure) आणि [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-संबंधित मदत**: सामील व्हा [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **दस्तऐवजीकरण**: [अधिकृत Azure डेवलपर CLI दस्तऐवज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord मधील समुदायाचे अंतर्दृष्टी

**#Azure चॅनेलमधील अलीकडील सर्व्हे निकाल:**
- **45%** विकासक AI वर्कलोडसाठी AZD वापरू इच्छितात
- **मुख्य आव्हाने**: मल्टी-सर्व्हिस डिप्लॉयमेंट, क्रेडेन्शियल व्यवस्थापन, उत्पादनाची तयारी  
- **सर्वाधिक विनंती केलेले**: AI-विशिष्ट टेम्पलेट्स, समस्या निवारण मार्गदर्शक, सर्वोत्तम सराव

**आमच्या समुदायात सामिल व्हा:**
- तुमचे AZD + AI अनुभव शेअर करा व मदत मिळवा
- नवीन AI टेम्पलेट्सची सुरुवातीची आवृत्ती मिळवा
- AI डिप्लॉयमेंट सर्वोत्तम सरावात योगदान द्या
- पुढील AI + AZD फीचर विकासावर प्रभाव टाका

### अभ्यासक्रमात योगदान देणे
आम्ही योगदानांचे स्वागत करतो! कृपया आमचा [योगदान मार्गदर्शक](CONTRIBUTING.md) वाचा ज्यात:
- **सामग्री सुधारणा**: विद्यमान अध्याय आणि उदाहरणे वाढवा
- **नवीन उदाहरणे**: प्रत्यक्ष जगातील परिस्थिती आणि टेम्पलेट्स जोडा  
- **अनुवाद**: बहुभाषिक समर्थन राखण्यासाठी मदत करा
- **बग अहवाल**: अचूकता आणि स्पष्टता सुधारित करा
- **समुदाय मानके**: आमच्या समावेशक समुदाय नियमांचे पालन करा

---

## 📄 अभ्यासक्रम माहिती

### परवाना
हा प्रकल्प MIT परवान्याच्या अंतर्गत परवानाधारित आहे - तपशीलासाठी [LICENSE](../../LICENSE) फाईल पहा.

### संबंधित Microsoft शिक्षण संसाधने

आमची टीम इतर सखोल शिक्षण अभ्यासक्रम तयार करते:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j फॉर बिगिनर्स](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js फॉर बिगिनर्स](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain फॉर बिगिनर्स](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD फॉर बिगिनर्स](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI फॉर बिगिनर्स](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP फॉर बिगिनर्स](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI एजंट्स फॉर बिगिनर्स](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### जनरेटिव्ह AI सिरीज
[![जनरेटिव्ह AI फॉर बिगिनर्स](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![जनरेटिव्ह AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![जनरेटिव्ह AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### मुख्य शिक्षण
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### कोपायलट मालिका
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ अभ्यासक्रम नेव्हिगेशन

**🚀 शिकायला सुरुवात करण्यासाठी तयार आहात?**

**नवशिक्या**: [अध्याय 1: पाया आणि जलद प्रारंभ](#-chapter-1-foundation--quick-start) पासून सुरू करा  
**AI विकासक**: [अध्याय 2: AI-प्रथम विकास](#-chapter-2-ai-first-development-recommended-for-ai-developers) कडे जा  
**अनुभवी विकासक**: [अध्याय 3: कॉन्फिगरेशन आणि प्रमाणीकरण](#️-chapter-3-configuration--authentication) पासून सुरु करा

**पुढील पावले**: [अध्याय 1 - AZD मूलभूत गोष्टी](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->