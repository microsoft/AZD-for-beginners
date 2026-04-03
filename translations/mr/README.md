# AZD नवशिक्यांसाठी: एक संरचित शिकण्याचा प्रवास

![AZD-नवशिक्यांसाठी](../../translated_images/mr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub वॉचर्स](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub फोर्क्स](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub स्टार्स](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure डिस्कॉर्ड](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry डिस्कॉर्ड](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### स्वयंचलित भाषांतरे (नेहमी अद्ययावत)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[अरबी](../ar/README.md) | [बांग्ला](../bn/README.md) | [बुल्गेरियन](../bg/README.md) | [बर्मी (म्यानमार)](../my/README.md) | [चिनी (सरलीकृत)](../zh-CN/README.md) | [चिनी (परंपरागत, हाँगकाँग)](../zh-HK/README.md) | [चिनी (परंपरागत, मकाऊ)](../zh-MO/README.md) | [चिनी (परंपरगत, तैवान)](../zh-TW/README.md) | [क्रोएशियन](../hr/README.md) | [चेक](../cs/README.md) | [डॅनिश](../da/README.md) | [डच](../nl/README.md) | [इस्टोनियन](../et/README.md) | [फिन्निश](../fi/README.md) | [फ्रेंच](../fr/README.md) | [जर्मन](../de/README.md) | [ग्रीक](../el/README.md) | [हिब्रू](../he/README.md) | [हिंदी](../hi/README.md) | [हंगेरियन](../hu/README.md) | [इंडोनेशियन](../id/README.md) | [इटालियन](../it/README.md) | [जपानी](../ja/README.md) | [कन्नड](../kn/README.md) | [खमेर](../km/README.md) | [कोरियन](../ko/README.md) | [लिथुआनियन](../lt/README.md) | [मलय](../ms/README.md) | [मलयाळम](../ml/README.md) | [मराठी](./README.md) | [नेपाली](../ne/README.md) | [नायजेरियन पिजिन](../pcm/README.md) | [नॉर्वेजियन](../no/README.md) | [फारसी (पर्शियन)](../fa/README.md) | [पोलिश](../pl/README.md) | [पोर्तुगीज (ब्राझील)](../pt-BR/README.md) | [पोर्तुगीज (पोर्तुगाल)](../pt-PT/README.md) | [पंजाबी (गुरमुखी)](../pa/README.md) | [रोमानियन](../ro/README.md) | [रशियन](../ru/README.md) | [सर्बियन (सिरीलिक)](../sr/README.md) | [स्लोव्हाक](../sk/README.md) | [स्लोव्हेनियन](../sl/README.md) | [स्पॅनिश](../es/README.md) | [स्वाहिली](../sw/README.md) | [स्वीडिश](../sv/README.md) | [तागालॉग (फिलिपिनो)](../tl/README.md) | [तमिळ](../ta/README.md) | [तेलुगू](../te/README.md) | [थाई](../th/README.md) | [टर्किश](../tr/README.md) | [युक्रेनियन](../uk/README.md) | [उर्दू](../ur/README.md) | [व्हिएतनामी](../vi/README.md)

> **लोकलरी क्लोन करणे पसंत आहे का?**
>
> हा रेपॉझिटरी 50+ भाषांतर समाविष्ट करतो ज्यामुळे डाउनलोडचा आकार मोठा होतो. भाषांतरांशिवाय क्लोन करण्यासाठी sparse checkout वापरा:
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
> हे आपल्याला कोर्स पूर्ण करण्यासाठी आवश्यक सर्वकाही देतो आणि डाउनलोड खूप जलद करते.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 आज azd मध्ये काय नवीन आहे

Azure Developer CLI पारंपरिक वेब अॅप्स आणि API पेक्षा मोठे बनले आहे. आज, azd हा Azure वर कोणतेही अर्ज तैनात करण्यासाठी एकमेव टूल आहे — ज्यात AI-शक्ती असलेली अॅप्स आणि बुद्धिमान एजंटसुद्धा समाविष्ट आहेत.

याचा अर्थ तुमच्यासाठी काय आहे:

- **AI एजंट आता azd चे प्रथम दर्जाचे वर्कलोड आहेत.** तुम्ही ज्या `azd init` → `azd up` वर्कफ्लोची ओळख ठेवता त्याच्याद्वारे AI एजंट प्रकल्प प्रारंभ, तैनात आणि व्यवस्थापित करू शकता.
- **Microsoft Foundry एकत्रीकरण** मॉडेल तैनाती, एजंट होस्टिंग आणि AI सेवा संरचना थेट azd टेम्पलेट इकोसिस्टममध्ये आणते.
- **मूल वर्कफ्लो बदललेले नाही.** तुम्ही todo अॅप, मायक्रोसर्व्हिस किंवा मल्टी-एजंट AI सोल्यूशन तैनात करणार असाल, कमांड्स एकाच रितीचे आहेत.

जर तुम्ही आधीच azd वापरले असेल, तर AI समर्थन हा नैसर्गिक विस्तार आहे — वेगळे टूल किंवा प्रगत ट्रॅक नाही. जर तुम्ही नवीन आहात, तर तुम्ही एकच वर्कफ्लो शिकाल जो सर्वकाहीसाठी काम करतो.

---

## 🚀 Azure Developer CLI (azd) म्हणजे काय?

**Azure Developer CLI (azd)** हा डेव्हलपर-मैत्रीपूर्ण कमांड-लाइन टूल आहे जो Azure वर अॅप्लिकेशन्स तैनात करणे सुलभ करते. अनेक Azure संसाधने हाताने तयार करण्याऐवजी आणि त्यांना जोडण्याऐवजी, तुम्ही एकाच कमांडने संपूर्ण अॅप्लिकेशन्स तैनात करू शकता.

### `azd up` ची जादू

```bash
# हा एकच आदेश सर्व काही करतो:
# ✅ सर्व Azure संसाधने तयार करतो
# ✅ नेटवर्किंग आणि सुरक्षा कॉन्फिगर करतो
# ✅ आपला अनुप्रयोग कोड तयार करतो
# ✅ Azure वर तैनात करतो
# ✅ आपल्याला कार्यरत URL देतो
azd up
```

**इतकंच!** Azure पोर्टलवर क्लिक करायची गरज नाही, क्लिष्ट ARM टेम्पलेट पहिल्यांदा शिकण्याची गरज नाही, कोणतीही मॅन्युअल कॉन्फिगरेशन नाही — फक्त Azure वर कार्यरत अॅप्लिकेशन्स.

---

## ❓ Azure Developer CLI व Azure CLI: काय फरक आहे?

ही नवशिक्यांकडून सर्वात सामान्य विचारली जाणारी प्रश्न आहे. येथे सोपा उत्तर दिले आहे:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | वेगवेगळ्या Azure संसाधनांचे व्यवस्थापन | संपूर्ण अनुप्रयोग तैनात करणे |
| **Mindset** | इन्फ्रास्ट्रक्चर-केंद्रित | अॅप्लिकेशन-केंद्रित |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Azure सेवा माहित असणे आवश्यक | फक्त तुमचे अॅप माहित असणे पुरे |
| **Best For** | DevOps, इन्फ्रास्ट्रक्चर | विकसक, प्रोटोटायपिंग |

### सोपी उपमा

- **Azure CLI** हे घर बांधण्यासाठी सर्व साधने असलेल्या सारखे आहे - हथोड़ा, आरा, पण. तुम्ही काहीही बनवू शकता, परंतु बांधकाम जाणून असणे आवश्यक आहे.
- **Azure Developer CLI** हे एक कंत्राटदार घेण्यासारखे आहे - तुम्ही काय हवे ते सांगा, आणि ते बांधण्याचे काम करतात.

### कोणते कधी वापरावे

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### ते एकत्र काम करतात!

AZD अंतर्गत Azure CLI वापरते. तुम्ही दोन्ही वापरू शकता:
```bash
# AZD सह आपले अॅप तैनात करा
azd up

# नंतर Azure CLI सह विशिष्ट संसाधने काळजीपूर्वक समायोजित करा
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD मध्ये टेम्पलेट्स शोधा

शून्यातून सुरुवात करू नका! **Awesome AZD** हा समुदायाचा साचा-टेम्पलेट्स संग्रह आहे:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD गॅलरी**](https://azure.github.io/awesome-azd/) | एक-क्लिक तैनातीसह 200+ टेम्पलेट ब्राउझ करा |
| 🔗 [**टेम्पलेट सादर करा**](https://github.com/Azure/awesome-azd/issues) | आपल्या टेम्पलेटचा समुदायाला सहभाग द्या |
| 🔗 [**GitHub रेपॉझिटरी**](https://github.com/Azure/awesome-azd) | स्रोत पाहा आणि स्टार द्या |

### Awesome AZD येथील लोकप्रिय AI टेम्पलेट्स

```bash
# Microsoft Foundry मॉडेल्ससह RAG चॅट + AI शोध
azd init --template azure-search-openai-demo

# जलद AI चॅट अनुप्रयोग
azd init --template openai-chat-app-quickstart

# Foundry एजंट्ससह AI एजंट्स
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 सोप्या टप्प्यात सुरुवात

सुरू करण्यापूर्वी, तुम्ही ज्या टेम्पलेटला तैनात करणार आहात त्यासाठी तुमची मशीन तयार आहे याची खात्री करा:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

जर कोणतीही आवश्यक तपासणी अयशस्वी झाली तर, ते प्रथम दुरुस्त करा आणि नंतर क्विक स्टार्ट सुरू करा.

### पाऊल 1: AZD स्थापित करा (2 मिनिटे)

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

### पाऊल 2: AZD साठी प्रमाणीकरण करा

```bash
# जर आपल्याला या कोर्समध्ये थेट Azure CLI कमांड्स वापरण्याची योजना असेल तर पर्यायी
az login

# AZD कार्यप्रवाहांसाठी आवश्यक
azd auth login
```

जर तुम्हाला खात्री नसेल की तुम्हाला कोणते पाहिजे, तर [स्थापना आणि सेटअप](docs/chapter-01-foundation/installation.md#authentication-setup) मधील पूर्ण सेटअप प्रवाह अनुसरा.

### पाऊल 3: तुमचे पहिले अॅप तैनात करा

```bash
# साच्यातून प्रारंभ करा
azd init --template todo-nodejs-mongo

# Azure वर तैनात करा (सगळे तयार करते!)
azd up
```

**🎉 इतकंच!** तुमचे अॅप आता Azure वर सक्रिय आहे.

### साफसफाई (विसरू नका!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 हा अभ्यासक्रम कसा वापरायचा

हा अभ्यासक्रम **क्रमिक शिक्षणासाठी** डिझाइन केला गेला आहे - जिथे तुम्हाला सोयीचे आहे तिथून सुरू करा आणि हळू हळू पुढे जा:

| तुमचा अनुभव | इथे सुरू करा |
|-----------------|------------|
| **Azure मध्ये पूर्णपणे नविन** | [अध्याय 1: पायाभूत](#-chapter-1-foundation--quick-start) |
| **Azure माहिती आहे, AZD नवीन** | [अध्याय 1: पायाभूत](#-chapter-1-foundation--quick-start) |
| **AI अॅप्स तैनात करू इच्छिता** | [अध्याय 2: AI-प्रथम विकास (AI विकासकांसाठी शिफारस)](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **हातावर सराव हवा आहे** | [🎓 परस्पर कार्यशाळा](workshop/README.md) - 3-4 तासांची मार्गदर्शित प्रयोगशाळा |
| **प्रॉडक्शन पॅटर्न्स पाहिजेत** | [अध्याय 8: उत्पादन व एंटरप्राइझ पॅटर्न्स](#-chapter-8-production--enterprise-patterns) |

### त्वरीत सेटअप

1. **या रेपॉझिटरीची Fork करा**: [![GitHub फोर्क्स](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **क्लोन करा**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **मदत मिळवा**: [Azure Discord समुदाय](https://discord.com/invite/ByRwuEEgH4)

> **लोकलरी क्लोन करणे पसंत आहे का?**
>
> हा रेपॉझिटरी 50+ भाषांतर समाविष्ट करतो ज्यामुळे डाउनलोडचा आकार मोठा होतो. भाषांतरांशिवाय क्लोन करण्यासाठी sparse checkout वापरा:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> हे आपल्याला कोर्स पूर्ण करण्यासाठी आवश्यक सर्वकाही पुरवते आणि डाउनलोड अधिक वेगवान करते.


## कोर्सचे आढावा

रचनेनुसार अध्यायांद्वारे Azure Developer CLI (azd) मध्ये पारंगत व्हा. **Microsoft Foundry एकत्रीकरणासह AI अनुप्रयोग तैनातीवर विशेष भर.**

### आधुनिक विकासकांसाठी हा कोर्स का आवश्यक आहे

Microsoft Foundry डिस्कॉर्ड समुदायाच्या अंतर्ज्ञानावर आधारित, **45% विकसक AZD वापरून AI वर्कलोड वापरू इच्छितात** परंतु त्यांना खालील अडचणी येतात:
- क्लिष्ट बहु-सेवा AI आर्किटेक्चर्स
- प्रॉडक्शन AI तैनातीच्या सर्वोत्तम पद्धती
- Azure AI सेवा एकत्रीकरण आणि कॉन्फिगरेशन
- AI वर्कलोडसाठी खर्चाची ऑप्टिमायझेशन
- AI-विशिष्ट तैनाती समस्या निराकरण

### शिकण्याची उद्दिष्टे

हा संरचित कोर्स पूर्ण केल्यावर, तुम्ही:
- **AZD मूलभूत गोष्टी आत्मसात करा**: मुख्य संकल्पना, इन्स्टॉलेशन आणि कॉन्फिगरेशन
- **AI अनुप्रयोग तैनात करा**: AZD आणि Microsoft Foundry सेवा वापरणे
- **Infrastructure as Code अंमलात आणा**: Bicep टेम्पलेट्सने Azure संसाधने व्यवस्थापित करा
- **तैनाती समस्या निवारण करा**: सामान्य त्रुटी सोडवा आणि डिबग करा
- **प्रॉडक्शनसाठी ऑप्टिमाइज़ करा**: सुरक्षा, स्केलिंग, मॉनिटरिंग आणि खर्च व्यवस्थापन
- **मल्टी-एजंट सोल्यूशन्स तयार करा**: क्लिष्ट AI आर्किटेक्चर्स तैनात करा

## सुरू करण्यापूर्वी: खाते, प्रवेश आणि गृहितके

धडा 1 सुरू करण्यापूर्वी, खालील गोष्टी तुमच्याकडे असाव्यात याची खात्री करा. या मार्गदर्शकातील इंस्टॉलेशन पावले पुढे या मूलभूत गोष्टी गृहित धरून लिहिलेली आहेत.
- **एक Azure सदस्यत्व**: तुम्ही कामातून किंवा तुमच्या स्वतःच्या खात्यातील विद्यमान सदस्यत्व वापरू शकता, किंवा प्रारंभ करण्यासाठी [free trial](https://aka.ms/azurefreetrial) तयार करू शकता.
- **Azure संसाधने तयार करण्याची परवानगी**: बहुतेक व्यायामांसाठी, तुम्हाला लक्ष्य सदस्यत्व किंवा रिसोर्स ग्रुपवर किमान **Contributor** प्रवेश असला पाहिजे. काही अध्याय हे देखील गृहीत धरतील की तुम्ही रिसोर्स ग्रुप्स, व्यवस्थापित ओळखी (managed identities), आणि RBAC नेमणुका तयार करू शकता.
- [**GitHub खाते**](https://github.com): रेपॉझिटरी फोर्क करण्यासाठी, तुमच्या स्वतःच्या बदलांचे ट्रॅक करण्यासाठी, आणि वर्कशॉपसाठी GitHub Codespaces वापरण्यासाठी हे उपयुक्त आहे.
- **टेम्पलेट रनटाइम पूर्वअट**: काही टेम्पलेट्ससाठी Node.js, Python, Java, किंवा Docker सारखी स्थानिक साधने आवश्यक असतात. सुरू करण्यापूर्वी सेटअप व्हॅलिडेटर चालवा जेणेकरून गहाळ साधने लवकर सापडतील.
- **मूलभूत टर्मिनल ओळख**: तुम्हाला तज्ञ असण्याची आवश्यकता नाही, परंतु `git clone`, `azd auth login`, आणि `azd up` सारख्या आदेश चालवताना तुम्हाला सहज वाटणे आवश्यक आहे.

> **एंटरप्राइझ सदस्यत्वात काम करत आहात का?**
> जर तुमचे Azure वातावरण प्रशासकाद्वारे व्यवस्थापित केले जात असेल, तर तुम्ही वापरण्याचा विचार करत असलेल्या सदस्यत्व किंवा रिसोर्स ग्रुपमध्ये संसाधने तैनात करू शकाल का हे आधीच खात्री करा. नसेल तर, सुरू करण्याआधी सॅंडबॉक्स सदस्यत्व किंवा Contributor प्रवेशासाठी विनंती करा.

> **Azure मध्ये नवीन आहात?**
> AZURE परीक्षणासाठी किंवा पे-एज़-यू-गो सदस्यत्वासह सुरू करा https://aka.ms/azurefreetrial जेणेकरून तुम्ही व्यायाम पूर्ण करू शकाल पूर्णपणे कोणत्याही टेनंट-स्तरीय मंजुरीची प्रतीक्षा न करता.

## 🗺️ कोर्स नकाशा: अध्यायानुसार जलद नेव्हिगेशन

प्रत्येक अध्यायाला समर्पित README आहे ज्यात शिकण्याची उद्दिष्टे, जलद प्रारंभ, आणि व्यायाम आहेत:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[अध्याय 1: पायाभूत](docs/chapter-01-foundation/README.md)** | प्रारंभ | [AZD मूलभूत](docs/chapter-01-foundation/azd-basics.md) &#124; [स्थापना](docs/chapter-01-foundation/installation.md) &#124; [पहिला प्रकल्प](docs/chapter-01-foundation/first-project.md) | 30-45 मिनिटे | ⭐ |
| **[अध्याय 2: AI विकास](docs/chapter-02-ai-development/README.md)** | AI-प्रथम अॅप्स | [Foundry एकत्रीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI एजंट्स](docs/chapter-02-ai-development/agents.md) &#124; [मॉडेल तैनात करणे](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [वर्कशॉप](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 तास | ⭐⭐ |
| **[अध्याय 3: कॉन्फिगरेशन](docs/chapter-03-configuration/README.md)** | प्रमाणीकरण व सुरक्षा | [कॉन्फिगरेशन](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 मिनिटे | ⭐⭐ |
| **[अध्याय 4: इन्फ्रास्ट्रक्चर](docs/chapter-04-infrastructure/README.md)** | IaC & तैनाती | [तैनाती मार्गदर्शक](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [प्रोव्हिजनिंग](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 तास | ⭐⭐⭐ |
| **[अध्याय 5: मल्टी-एजंट](docs/chapter-05-multi-agent/README.md)** | AI एजंट सोल्यूशन्स | [रिटेल परिस्थिती](examples/retail-scenario.md) &#124; [समन्वय पॅटर्न](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 तास | ⭐⭐⭐⭐ |
| **[अध्याय 6: पूर्व-तैनाती](docs/chapter-06-pre-deployment/README.md)** | नियोजन व सत्यापन | [प्रीफ्लाइट चेक्स](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [क्षमता नियोजन](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU निवड](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 तास | ⭐⭐ |
| **[अध्याय 7: समस्या निवारण](docs/chapter-07-troubleshooting/README.md)** | डीबग व दुरुस्ती | [सामान्य समस्या](docs/chapter-07-troubleshooting/common-issues.md) &#124; [डिबगिंग](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI समस्या निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 तास | ⭐⭐ |
| **[अध्याय 8: उत्पादन](docs/chapter-08-production/README.md)** | एंटरप्राइझ पॅटर्न | [उत्पादन सराव](docs/chapter-08-production/production-ai-practices.md) | 2-3 तास | ⭐⭐⭐⭐ |
| **[🎓 वर्कशॉप](workshop/README.md)** | हाताळणी प्रयोगशाळा | [परिचय](workshop/docs/instructions/0-Introduction.md) &#124; [निवड](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [सत्यापन](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [विभाजन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [कॉन्फिगरेशन](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [सानुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [टियरडाउन](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [समारोप](workshop/docs/instructions/7-Wrap-up.md) | 3-4 तास | ⭐⭐ |

**एकूण कोर्स कालावधी:** ~10-14 तास | **कौशल्य प्रगती:** नवशिक्या → उत्पादन-तयार

---

## 📚 शिकण्याचे अध्याय

*अनुभव पातळी आणि उद्दिष्टांनुसार तुमचा शिकण्याचा मार्ग निवडा*

### 🚀 अध्याय 1: पायाभूत व जलद प्रारंभ
**पूर्वअटी**: Azure सदस्यत्व, कमांड लाइनची प्राथमिक ओळख  
**कालावधी**: 30-45 मिनिटे  
**कठीणपणा**: ⭐

#### तुम्ही काय शिकाल
- Azure Developer CLI च्या मूलभूत संकल्पना समजून घेणे
- तुमच्या प्लॅटफॉर्मवर AZD स्थापित करणे
- तुमची पहिली यशस्वी तैनाती

#### शिकण्यासाठी स्रोत
- **🎯 येथे सुरू करा**: [Azure Developer CLI काय आहे?](#what-is-azure-developer-cli)
- **📖 सिद्धांत**: [AZD मूलभूत](docs/chapter-01-foundation/azd-basics.md) - मुख्य संकल्पना आणि शब्दावली
- **⚙️ सेटअप**: [स्थापना व सेटअप](docs/chapter-01-foundation/installation.md) - प्लॅटफॉर्म-विशिष्ट मार्गदर्शक
- **🛠️ हस्तगत**: [तुमचा पहिला प्रकल्प](docs/chapter-01-foundation/first-project.md) - पायरी-दर-पायरी मार्गदर्शन
- **📋 जलद संदर्भ**: [कमान्ड चीट शीट](resources/cheat-sheet.md)

#### व्यावहारिक सराव
```bash
# स्थापनेची जलद तपासणी
azd version

# आपला पहिला अनुप्रयोग तैनात करा
azd init --template todo-nodejs-mongo
azd up
```

**💡 अध्यायाचा निकाल**: AZD वापरून Azure वर एक साधी वेब अनुप्रयोग यशस्वीपणे तैनात करणे

**✅ यश प्रमाणेकरण:**
```bash
# अध्याय 1 पूर्ण केल्यानंतर, तुम्ही हे करू शकता:
azd version              # स्थापित आवृत्ती दाखवते
azd init --template todo-nodejs-mongo  # प्रकल्प प्रारंभ करते
azd up                  # Azure वर तैनात करते
azd show                # चालत असलेल्या अॅपचा URL दाखवते
# अॅप ब्राउझरमध्ये उघडते आणि कार्य करते
azd down --force --purge  # संसाधने साफ करते
```

**📊 वेळ गुंतवणूक:** 30-45 मिनिटे  
**📈 यानंतरचे कौशल्य पातळी:** मूलभूत अनुप्रयोग स्वतंत्रपणे तैनात करू शकतो
**📈 यानंतरचे कौशल्य पातळी:** मूलभूत अनुप्रयोग स्वतंत्रपणे तैनात करू शकतो

---

### 🤖 अध्याय 2: AI-प्रथम विकास (AI विकासकांसाठी शिफारसीय)
**पूर्वअटी**: अध्याय 1 पूर्ण  
**कालावधी**: 1-2 तास  
**कठीणपणा**: ⭐⭐

#### तुम्ही काय शिकाल
- AZD सह Microsoft Foundry चे एकत्रीकरण
- AI-समर्थित अनुप्रयोग तैनात करणे
- AI सेवा कॉन्फिगरेशन समजून घेणे

#### शिकण्यासाठी स्रोत
- **🎯 येथे सुरू करा**: [Microsoft Foundry एकत्रीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI एजंट्स**: [AI एजंट्स मार्गदर्शक](docs/chapter-02-ai-development/agents.md) - AZD सह बुद्धिमान एजंट तैनात करा
- **📖 पॅटर्न**: [AI मॉडेल तैनाती](docs/chapter-02-ai-development/ai-model-deployment.md) - AI मॉडेल तैनात आणि व्यवस्थापित करा
- **🛠️ वर्कशॉप**: [AI वर्कशॉप लॅब](docs/chapter-02-ai-development/ai-workshop-lab.md) - तुमच्या AI सोल्यूशन्सना AZD-तयार करा
- **🎥 इंटरऐक्टिव मार्गदर्शक**: [वर्कशॉप सामग्री](workshop/README.md) - MkDocs * DevContainer वातावरणासह ब्राउझर-आधारित शिकणे
- **📋 टेम्पलेट्स**: [Microsoft Foundry टेम्पलेट्स](#वर्कशॉप-संसाधने)
- **📝 उदाहरणे**: [AZD तैनाती उदाहरणे](examples/README.md)

#### व्यावहारिक सराव
```bash
# आपले पहिले एआय अनुप्रयोग तैनात करा
azd init --template azure-search-openai-demo
azd up

# अतिरिक्त एआय टेम्पलेट्स वापरून पाहा
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 अध्यायाचा निकाल**: RAG क्षमता असलेले AI-समर्थित चॅट अनुप्रयोग तैनात आणि कॉन्फिगर करणे

**✅ यश प्रमाणेकरण:**
```bash
# अध्याय 2 नंतर, आपण खालील गोष्टी करण्यास सक्षम असाल:
azd init --template azure-search-openai-demo
azd up
# एआय चॅट इंटरफेसची चाचणी करा
# प्रश्न विचारा आणि स्रोतांसह एआय-आधारित उत्तरे मिळवा
# शोध समाकलन योग्यरित्या काम करते याची पडताळणी करा
azd monitor  # Application Insights मध्ये टेलिमेट्री दिसते आहे का ते तपासा
azd down --force --purge
```

**📊 वेळ गुंतवणूक:** 1-2 तास  
**📈 यानंतरचे कौशल्य पातळी:** उत्पादन-तयार AI अनुप्रयोग तैनात व कॉन्फिगर करू शकतो  
**💰 खर्चाची जाणीव:** विकासासाठी $80-150/महिना अंदाज, उत्पादनासाठी $300-3500/महिना अंदाज

#### 💰 AI तैनातीसाठी खर्च विचार

**विकास वातावरण (अनुमानित $80-150/महिना):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/महिना (टोकन वापरावर आधारित)
- AI Search (Basic tier): $75/महिना
- Container Apps (Consumption): $0-20/महिना
- Storage (Standard): $1-5/महिना

**उत्पादन वातावरण (अनुमानित $300-3,500+/महिना):**
- Microsoft Foundry Models (PTU for consistent performance): $3,000+/महिना किंवा उच्च वॉल्यूमसाठी Pay-as-you-go
- AI Search (Standard tier): $250/महिना
- Container Apps (Dedicated): $50-100/महिना
- Application Insights: $5-50/महिना
- Storage (Premium): $10-50/महिना

**💡 खर्च कमी करण्याचे टिप्स:**
- शिक्षणासाठी **Free Tier** Microsoft Foundry Models वापरा (Azure OpenAI मध्ये 50,000 टोकन्स/महिना समाविष्ट)
- सक्रियपणे विकसित करत नसल्यास संसाधने डीअलोकेट करण्यासाठी `azd down` चालवा
- सुरुवातीला consumption-आधारित बिलिंग वापरा, केवळ उत्पादनासाठी PTU मध्ये अपग्रेड करा
- तैनातीपूर्वी खर्चाचे अंदाज घेण्यासाठी `azd provision --preview` वापरा
- ऑटो-स्केलिंग सक्षम करा: प्रत्यक्ष वापरावरच पैसे द्या

**खर्च निरीक्षण:**
```bash
# अंदाजे मासिक खर्च तपासा
azd provision --preview

# Azure पोर्टलमध्ये प्रत्यक्ष खर्चाचे निरीक्षण करा
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ अध्याय 3: कॉन्फिगरेशन व प्रमाणीकरण
**पूर्वअटी**: अध्याय 1 पूर्ण  
**कालावधी**: 45-60 मिनिटे  
**कठीणपणा**: ⭐⭐

#### तुम्ही काय शिकाल
- वातावरण कॉन्फिगरेशन आणि व्यवस्थापन
- प्रमाणीकरण आणि सुरक्षा सर्वोत्तम सराव
- रिसोर्स नावे आणि संघटन

#### शिकण्यासाठी स्रोत
- **📖 कॉन्फिगरेशन**: [कॉन्फिगरेशन मार्गदर्शक](docs/chapter-03-configuration/configuration.md) - वातावरण सेटअप
- **🔐 सुरक्षा**: [प्रमाणीकरण पॅटर्न आणि व्यवस्थापित ओळख](docs/chapter-03-configuration/authsecurity.md) - प्रमाणीकरण पॅटर्न
- **📝 उदाहरणे**: [डेटाबेस अॅप उदाहरण](examples/database-app/README.md) - AZD डेटाबेस उदाहरणे

#### व्यावहारिक सराव
- अनेक वातावरणे (dev, staging, prod) कॉन्फिगर करा
- व्यवस्थापित ओळख प्रमाणीकरण सेट करा
- वातावरण-विशिष्ट कॉन्फिगरेशन अंमलात आणा

**💡 अध्यायाचा निकाल**: योग्य प्रमाणीकरण आणि सुरक्षा सह अनेक वातावरणे व्यवस्थापित करा

---

### 🏗️ अध्याय 4: इन्फ्रास्ट्रक्चर अ‍ॅज कोड व तैनाती
**पूर्वअटी**: अध्याय 1-3 पूर्ण  
**कालावधी**: 1-1.5 तास  
**कठीणपणा**: ⭐⭐⭐

#### तुम्ही काय शिकाल
- प्रगत तैनाती पॅटर्न
- Bicep सह Infrastructure as Code
- स्रोत विनियोजन धोरणे

#### शिकण्यासाठी स्रोत
- **📖 तैनाती**: [तैनाती मार्गदर्शक](docs/chapter-04-infrastructure/deployment-guide.md) - संपूर्ण वर्कफ्लोज
- **🏗️ प्रोव्हिजनिंग**: [संसाधन प्रोव्हिजनिंग](docs/chapter-04-infrastructure/provisioning.md) - Azure रिसोर्स व्यवस्थापन
- **📝 उदाहरणे**: [Container App उदाहरण](../../examples/container-app) - कंटेनराइज्ड तैनाती

#### व्यावहारिक सराव
- कस्टम Bicep टेम्पलेट तयार करा
- मल्टी-सर्व्हिस अनुप्रयोग तैनात करा
- ब्ल्यू-ग्रीन तैनाती धोरणे अंमलात आणा

**💡 अध्यायाचा निकाल**: कस्टम इन्फ्रास्ट्रक्चर टेम्पलेट्स वापरून क्लिष्ट मल्टी-सर्व्हिस अनुप्रयोग तैनात करा

---

### 🎯 अध्याय 5: मल्टी-एजंट AI सोल्यूशन्स (उन्नत)
**पूर्वअटी**: अध्याय 1-2 पूर्ण  
**कालावधी**: 2-3 तास  
**कठीणपणा**: ⭐⭐⭐⭐

#### तुम्ही काय शिकाल
- मल्टी-एजंट आर्किटेक्चर पॅटर्न
- एजंट ऑर्केस्ट्रेशन आणि समन्वय
- उत्पादन-तयार AI तैनाती

#### शिकण्यासाठी स्रोत
- **🤖 वैशिष्ट्यीकृत प्रकल्प**: [खुदरा मल्टी-एजंट सोल्यूशन](examples/retail-scenario.md) - संपूर्ण अंमलबजावणी
- **🛠️ ARM टेम्पलेट्स**: [ARM टेम्पलेट पॅकेज](../../examples/retail-multiagent-arm-template) - एक-क्लिक तैनाती
- **📖 आर्किटेक्चर**: [मल्टी-एजंट समन्वय पॅटर्न](docs/chapter-06-pre-deployment/coordination-patterns.md) - पॅटर्न

#### व्यावहारिक सराव
```bash
# पूर्ण किरकोळ बहु-एजंट उपाय तैनात करा
cd examples/retail-multiagent-arm-template
./deploy.sh

# एजंट कॉन्फिगरेशन अन्वेषण करा
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 अध्यायाचा निकाल**: ग्राहक आणि इन्व्हेंटरी एजंट्ससह उत्पादन-तयार मल्टी-एजंट AI सोल्यूशन तैनात आणि व्यवस्थापित करा

---

### 🔍 अध्याय 6: पूर्व-तैनाती सत्यापन व नियोजन
**पूर्वअटी**: अध्याय 4 पूर्ण  
**कालावधी**: 1 तास  
**कठीणपणा**: ⭐⭐
#### तुम्ही काय शिकाल
- क्षमता नियोजन आणि संसाधन पडताळणी
- SKU निवड धोरणे
- पूर्व-तपासणी आणि स्वयंचलन

#### अभ्यास साधने
- **📊 नियोजन**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - संसाधन पडताळणी
- **💰 निवड**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - खर्च-प्रभावी पर्याय
- **✅ पडताळणी**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - स्वयंचलित स्क्रिप्ट्स

#### व्यावहारिक सराव
- क्षमता पडताळणी स्क्रिप्ट चालवा
- खर्चासाठी SKU निवडी ऑप्टिमाइझ करा
- तैनातीपूर्वी स्वयंचलित तपासण्या अमलात आणा

**💡 अध्यायाचे परिणाम**: अंमलबजावणीपूर्वी तैनातींची पडताळणी आणि ऑप्टिमाइझ करा

---

### 🚨 अध्याय 7: समस्यानिवारण आणि डीबगिंग
**पूर्वअटी**: कोणताही तैनातीचा अध्याय पूर्ण केलेला असणे  
**कालावधी**: 1-1.5 तास  
**कठीणपणा**: ⭐⭐

#### तुम्ही काय शिकाल
- व्यवस्थित डीबगिंग पद्धती
- सामान्य समस्या आणि उपाय
- AI-विशिष्ट समस्यानिवारण

#### अभ्यास साधने
- **🔧 सामान्य समस्या**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ आणि उपाय
- **🕵️ डीबगिंग**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - पायरी-दर-पायरी रणनीती
- **🤖 AI समस्या**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI सेवा समस्या

#### व्यावहारिक सराव
- तैनाती अपयशांचे निदान करा
- प्रमाणीकरण समस्या सोडवा
- AI सेवा कनेक्टिव्हिटी डीबग करा

**💡 अध्यायाचे परिणाम**: स्वतंत्रपणे सामान्य तैनातीच्या समस्या निदान आणि निराकरण करा

---

### 🏢 अध्याय 8: उत्पादन आणि एंटरप्राइझ पॅटर्न
**पूर्वअटी**: अध्याय 1-4 पूर्ण केलेले असणे  
**कालावधी**: 2-3 तास  
**कठीणपणा**: ⭐⭐⭐⭐

#### तुम्ही काय शिकाल
- उत्पादन तैनातरण धोरणे
- एंटरप्राइझ सुरक्षा पॅटर्न
- मॉनिटरिंग आणि खर्चाचे ऑप्टिमायझेशन

#### अभ्यास साधने
- **🏭 उत्पादन**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - एंटरप्राइझ पॅटर्न
- **📝 उदाहरणे**: [Microservices Example](../../examples/microservices) - क्लिष्ट आर्किटेक्चर
- **📊 मॉनिटरिंग**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - मॉनिटरिंग

#### व्यावहारिक सराव
- एंटरप्राइझ सुरक्षा पॅटर्न अमलात आणा
- व्यापक मॉनिटरिंग सेट करा
- योग्य गव्हर्नन्ससह उत्पादनात तैनात करा

**💡 अध्यायाचे परिणाम**: पूर्ण उत्पादन क्षमतांसह एंटरप्राइझ-तयार अनुप्रयोग तैनात करा

---

## 🎓 वर्कशॉप आढावा: प्रत्यक्ष-आधारित शिक्षण अनुभव

> **⚠️ वर्कशॉप स्थिती: सक्रिय विकास**  
> वर्कशॉप साहित्य सध्या विकसित आणि परिष्कृत केले जात आहे. मुख्य मॉड्यूल कार्यरत आहेत, परंतु काही प्रगत विभाग अपूर्ण आहेत. आम्ही सर्व सामग्री पूर्ण करण्यासाठी सक्रियपणे काम करत आहोत. [प्रगती पहा →](workshop/README.md)

### इंटरऐक्टिव्ह वर्कशॉप सामग्री
**ब्राउझर-आधारित साधने आणि मार्गदर्शित सरावांसह सर्वसमावेशक प्रत्यक्ष शिक्षण अनुभव**

आमची वर्कशॉप सामग्री अध्याय-आधारित शिक्षणक्रमाचे पूरक असलेला संरचित, इंटरऐक्टिव्ह शिकण्याचा अनुभव प्रदान करते. वर्कशॉप स्व-गतीने शिकण्यासाठी आणि प्रशिक्षक-नेतृत्वाखालील सत्रांसाठी दोन्ही उपयुक्त असे बनवले आहे.

#### 🛠️ वर्कशॉप वैशिष्ट्ये
- **ब्राउझर-आधारित इंटरफेस**: शोध, कॉपी, आणि थीम वैशिष्ट्यांसह पूर्ण MkDocs-समर्थित वर्कशॉप
- **GitHub Codespaces एकत्रीकरण**: एक-क्लिक विकास वातावरण सेटअप
- **रचनेत शिक्षण मार्ग**: 8-मॉड्यूल मार्गदर्शित सराव (एकूण 3-4 तास)
- **प्रगत पद्धतशास्त्र**: परिचय → निवड → पडताळणी → विखंडन → कॉन्फिगरेशन → सानुकूलन → निराकरण → सारांश
- **इंटरऐक्टिव्ह DevContainer वातावरण**: पूर्व-संरचित साधने आणि अवलंबन

#### 📚 वर्कशॉप मॉड्यूल संरचना
वर्कशॉप एक **8-मॉड्यूल प्रगत पद्धतशास्त्र** अनुसरत आहे जे तुम्हाला शोधापासून तैनाती कौशल्यापर्यंत घेऊन जाते:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | वर्कशॉप आढावा | शिकण्याचे उद्दिष्टे, पूर्वअटी, आणि वर्कशॉप संरचना समजून घ्या | 15 मिनिटे |
| **1. Selection** | टेम्पलेट शोध | AZD टेम्पलेट्सचा शोध घ्या आणि आपल्या परिदृश्यासाठी योग्य AI टेम्पलेट निवडा | 20 मिनिटे |
| **2. Validation** | तैनात करा आणि पडताळा | `azd up` ने टेम्पलेट तैनात करा आणि इन्फ्रास्ट्रक्चर कार्यरत आहे का ते पडताळा | 30 मिनिटे |
| **3. Deconstruction** | रचना समजून घ्या | GitHub Copilot वापरून टेम्पलेट आर्किटेक्चर, Bicep फाइल्स, आणि कोड संघटन अन्वेषण करा | 30 मिनिटे |
| **4. Configuration** | azure.yaml सखोल अभ्यास | `azure.yaml` कॉन्फिगरेशन, लाइफसायकल हुक्स, आणि पर्यावरण बदल समजून घ्या | 30 मिनिटे |
| **5. Customization** | आपले बनवा | AI Search, tracing, मूल्यांकन सक्षम करा आणि आपल्या परिदृश्यासाठी सानुकूल करा | 45 मिनिटे |
| **6. Teardown** | साफसफाई | `azd down --purge` वापरून सुरक्षितपणे संसाधने हटवा | 15 मिनिटे |
| **7. Wrap-up** | पुढील पावले | साध्य केलेल्या गोष्टींचा आढावा घ्या, मुख्य संकल्पना, आणि आपले शिक्षण प्रवास पुढे सुरू ठेवा | 15 मिनिटे |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 वर्कशॉप सुरू करण्यासाठी
```bash
# पर्याय 1: GitHub Codespaces (शिफारस केलेले)
# रिपॉझिटरीमध्ये "Code" → "Create codespace on main" वर क्लिक करा

# पर्याय 2: स्थानिक विकास
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md मधील सेटअप सूचना अनुसरा
```

#### 🎯 वर्कशॉप शिकण्याचे उद्दिष्टे
वर्कशॉप पूर्ण केल्यावर, सहभागी हे शिकतील:
- **उत्पादन AI अनुप्रयोग तैनात करा**: Microsoft Foundry सर्व्हिसेससोबत AZD वापरा
- **मल्टी-एजंट आर्किटेक्चरमध्ये पारंगत व्हा**: समन्वयित AI एजंट सोल्यूशन्स प्रत्यक्षात आणा
- **सुरक्षा सर्वोत्तम पद्धती अमलात आणा**: प्रमाणीकरण आणि प्रवेश नियंत्रण कॉन्फिगर करा
- **स्केलसाठी ऑप्टिमाइझ करा**: खर्च-प्रभावी, कार्यक्षम तैनाती डिझाइन करा
- **तैनाती समस्या सोडवा**: सामान्य समस्या स्वतंत्रपणे निराकरण करा

#### 📖 वर्कशॉप संसाधने
- **🎥 इंटरऐक्टिव्ह मार्गदर्शक**: [Workshop Materials](workshop/README.md) - ब्राउझर-आधारित शिक्षण वातावरण
- **📋 मॉड्यूल-दर-मॉड्यूल सूचना**:
  - [0. परिचय](workshop/docs/instructions/0-Introduction.md) - वर्कशॉप आढावा आणि उद्दिष्टे
  - [1. निवड](workshop/docs/instructions/1-Select-AI-Template.md) - AI टेम्पलेट शोधा आणि निवडा
  - [2. पडताळणी](workshop/docs/instructions/2-Validate-AI-Template.md) - टेम्पलेट तैनात करा आणि पडताळा
  - [3. विखंडन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - टेम्पलेट आर्किटेक्चर अन्वेषण करा
  - [4. कॉन्फिगरेशन](workshop/docs/instructions/4-Configure-AI-Template.md) - `azure.yaml` मास्टरी करा
  - [5. सानुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) - आपल्या परिदृश्यासाठी सानुकूल करा
  - [6. निराकरण](workshop/docs/instructions/6-Teardown-Infrastructure.md) - संसाधने साफ करा
  - [7. सारांश](workshop/docs/instructions/7-Wrap-up.md) - आढावा आणि पुढील पावले
- **🛠️ AI वर्कशॉप लॅब**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-केंद्रित सराव
- **💡 जलद प्रारंभ**: [Workshop Setup Guide](workshop/README.md#quick-start) - वातावरण कॉन्फिगरेशन

**योग्य आहे**: कॉर्पोरेट प्रशिक्षण, विद्यापीठ अभ्यासक्रम, स्व-गतीने शिक्षण, आणि डेव्हलपर बूटकॅम्पसाठी.

---

## 📖 सखोल आढावा: AZD क्षमता

मूलभूत गोष्टींपेक्षा पुढे, AZD उत्पादन तैनातरणासाठी शक्तिशाली वैशिष्ट्ये प्रदान करते:

- **टेम्पलेट-आधारित तैनाती** - सामान्य अनुप्रयोग पॅटर्नसाठी पूर्व-निर्मित टेम्पलेट वापरा
- **इन्फ्रास्ट्रक्चर अ‍ॅज कोड** - Bicep किंवा Terraform वापरून Azure संसाधने व्यवस्थापित करा  
- **एकत्रित वर्कफ्लो** - अनुप्रयोगांना निर्बाधपणे provision, deploy, आणि monitor करा
- **डेव्हलपर-फ्रेंडली** - विकासक उत्पादकता आणि अनुभवासाठी ऑप्टिमाइझ केलेले

### **AZD + Microsoft Foundry: AI तैनातीसाठी उत्तम**

**AI सोल्यूशन्ससाठी AZD का?** AZD AI विकसकांना येणाऱ्या प्रमुख आव्हानांना हाताळते:

- **AI-तयार टेम्पलेट्स** - Microsoft Foundry Models, Cognitive Services, आणि ML कार्यभारांसाठी पूर्व-संरचित टेम्पलेट्स
- **सुरक्षित AI तैनाती** - AI सेवा, API कीज, आणि मॉडेल एंडपॉइंट्ससाठी अंगभूत सुरक्षा पॅटर्न  
- **उत्पादन AI पॅटर्न** - स्केलेबल, खर्च-प्रभावी AI अनुप्रयोग तैनातीसाठी सर्वोत्तम पद्धती
- **एंड-टू-एंड AI वर्कफ्लो** - मॉडेल विकासापासून उत्पादन तैनातरणापर्यंत योग्य मॉनिटरिंगसह
- **खर्च ऑप्टिमायझेशन** - AI कार्यभारांसाठी स्मार्ट संसाधन वाटप आणि स्केलिंग धोरणे
- **Microsoft Foundry एकत्रीकरण** - Microsoft Foundry मॉडेल कॅटलॉग आणि एंडपॉइंट्सशी निर्बाध कनेक्शन

---

## 🎯 टेम्पलेट्स व उदाहरणे लायब्ररी

### वैशिष्ट्यीकृत: Microsoft Foundry टेम्पलेट्स
**जर आपण AI अनुप्रयोग तैनात करत असाल तर येथे प्रारंभ करा!**

> **टीप:** ही टेम्पलेट विविध AI पॅटर्न दर्शवितात. काही बाह्य Azure Samples आहेत, इतर स्थानिक अंमलबजावण्या आहेत.

| टेम्पलेट | अध्याय | कठीणपणा | सेवा | प्रकार |
|----------|---------|------------|----------|------|
| [**AI चॅटसह प्रारंभ करा**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | बाह्य |
| [**AI एजंटसह प्रारंभ करा**](https://github.com/Azure-Samples/get-started-with-ai-agents) | अध्याय 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| बाह्य |
| [**Azure Search + OpenAI डेमो**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | बाह्य |
| [**OpenAI चॅट अॅप क्विकस्टार्ट**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | बाह्य |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | बाह्य |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | बाह्य |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **स्थानिक** |

### वैशिष्ट्यीकृत: पूर्ण शिक्षण प्रकरणे
**उत्पादन-तयार अनुप्रयोग टेम्पलेट्स शिकण्याच्या अध्यायांशी नकाशित**

| टेम्पलेट | शिक्षण अध्याय | कठीणपणा | मुख्य शिकणे |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | मूलभूत AI तैनाती पॅटर्न |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | Azure AI Search सह RAG अंमलबजावणी |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | अध्याय 4 | ⭐⭐ | दस्तऐवज इंटेलिजन्स एकत्रीकरण |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | एजंट फ्रेमवर्क आणि फंक्शन कॉलिंग |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐ | एंटरप्राइझ AI ऑर्केस्ट्रेशन |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | ग्राहक आणि इन्व्हेंटरी एजंटसह मल्टी-एजंट आर्किटेक्चर |

### उदाहरण प्रकारानुसार शिक्षण

> **📌 स्थानिक विरुद्ध बाह्य उदाहरणे:**  
> **स्थानिक उदाहरणे** (या रेपोमध्ये) = त्वरित वापरासाठी तयार  
> **बाह्य उदाहरणे** (Azure Samples) = लिंक केलेल्या रेपॉजिटरींचा क्लोन करा

#### स्थानिक उदाहरणे (त्वरित वापरासाठी तयार)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM टेम्पलेट्ससह पूर्ण उत्पादन-तयार अंमलबजावणी
  - मल्टी-एजंट आर्किटेक्चर (Customer + Inventory एजंट्स)
  - व्यापक मॉनिटरिंग आणि मूल्यांकन
  - ARM टेम्पलेटद्वारे एक-क्लिक तैनाती

#### स्थानिक उदाहरणे - कंटेनर अनुप्रयोग (अध्याय 2-5)
**या रेपोमधील कंटेनर तैनातींची संपूर्ण उदाहरणे:**
- [**Container App Examples**](examples/container-app/README.md) - कंटेनराइज्ड तैनातींसाठी पूर्ण मार्गदर्शक
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - scale-to-zero सह मूलभूत REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - उत्पादन-तयार बहु-सेवा तैनाती
  - जलद प्रारंभ, उत्पादन, आणि प्रगत तैनाती पॅटर्न
  - मॉनिटरिंग, सुरक्षा, आणि खर्च ऑप्टिमायझेशन मार्गदर्शन

#### बाह्य उदाहरणे - सोपे अनुप्रयोग (अध्याय 1-2)
**प्रारंभ करण्यासाठी या Azure Samples रेपॉजिटरी क्लोन करा:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - मूलभूत तैनाती पॅटर्न
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - स्टॅटिक सामग्री तैनाती
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API तैनाती

#### बाह्य उदाहरणे - डेटाबेस एकत्रीकरण (अध्याय 3-4)
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - डेटाबेस कनेक्टिविटी पॅटर्न
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - सर्व्हरलेस डेटा वर्कफ्लो

#### बाहेरील उदाहरणे - प्रगत पॅटर्न (प्रकरणे 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - बहु-सेवा आर्किटेक्चर
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - पार्श्वभूमी प्रक्रिया  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - उत्पादन-तयार ML पॅटर्न

### बाहेरील टेम्पलेट संग्रह
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - अधिकृत आणि समुदायाच्या टेम्पलेट्सचा क्यूरेट केलेला संग्रह
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn टेम्पलेट दस्तऐवजीकरण
- [**Examples Directory**](examples/README.md) - सविस्तर स्पष्टीकरणांसह स्थानिक शिकण्याची उदाहरणे

---

## 📚 Learning Resources & References

### जलद संदर्भ
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - प्रकरणानुसार आयोजित आवश्यक azd आदेश
- [**Glossary**](resources/glossary.md) - Azure आणि azd शब्दावली  
- [**FAQ**](resources/faq.md) - शिकण्याच्या प्रकरणानुसार आयोजित सामान्य प्रश्न
- [**Study Guide**](resources/study-guide.md) - सर्वसमावेशक सराव व्यायाम

### प्रत्यक्ष कार्यशाळा
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - आपल्या AI सोल्यूशन्सना AZD-वर तैनात करण्यायोग्य बनवा (2-3 तास)
- [**Interactive Workshop**](workshop/README.md) - MkDocs आणि GitHub Codespaces सह 8-मॉड्यूल मार्गदर्शित व्यायाम
  - अनुक्रम: परिचय → निवड → पडताळणी → विघटन → कॉन्फिगरेशन → सानुकूलन → विघटन → समारोप

### बाह्य शैक्षणिक साधने
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### आपल्या संपादकासाठी AI एजंट कौशल्ये
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, तैनाती, निदान, खर्च ऑप्टिमायझेशन आणि इतरांसाठी 37 खुले एजंट कौशल्ये. GitHub Copilot, Cursor, Claude Code, किंवा कोणत्याही समर्थित एजंटमध्ये त्यांना इंस्टॉल करा:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 जलद त्रुटी निवारण मार्गदर्शिका

**सुरुवात करणाऱ्यांना येणाऱ्या सामान्य समस्या आणि त्वरित उपाय:** 

<details>
<summary><strong>❌ "azd: आदेश सापडला नाही"</strong></summary>

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
<summary><strong>❌ "सबसक्रिप्शन सापडले नाही" किंवा "सबसक्रिप्शन सेट केलेले नाही"</strong></summary>

```bash
# उपलब्ध सदस्यता यादी करा
az account list --output table

# डिफॉल्ट सदस्यता सेट करा
az account set --subscription "<subscription-id-or-name>"

# AZD वातावरणासाठी सेट करा
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# पुष्टी करा
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" किंवा "कोटा ओलांडला"</strong></summary>

```bash
# वेगळ्या Azure प्रदेशाचा प्रयत्न करा
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
<summary><strong>❌ "azd up" अर्ध्या मार्गात अयशस्वी होते</strong></summary>

```bash
# पर्याय 1: स्वच्छ करा आणि पुन्हा प्रयत्न करा
azd down --force --purge
azd up

# पर्याय 2: केवळ पायाभूत सुविधा दुरुस्त करा
azd provision

# पर्याय 3: सविस्तर स्थिती तपासा
azd show

# पर्याय 4: Azure Monitor मधील लॉग तपासा
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "प्रमाणीकरण अयशस्वी" किंवा "टोकन कालबाह्य झाले"</strong></summary>

```bash
# AZD साठी पुनःप्रमाणीकरण करा
azd auth logout
azd auth login

# ऐच्छिक: जर आपण az कमांड्स चालवत असाल तर Azure CLI देखील रीफ्रेश करा
az logout
az login

# प्रमाणीकरणाची पडताळणी करा
az account show
```
</details>

<details>
<summary><strong>❌ "संसाधन आधीपासून अस्तित्वात आहे" किंवा नाव संघर्ष</strong></summary>

```bash
# AZD अद्वितीय नावे तयार करते, परंतु संघर्ष झाल्यास:
azd down --force --purge

# मग ताज्या वातावरणासह पुन्हा प्रयत्न करा
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template तैनाती जास्त वेळ घेत आहे</strong></summary>

**सामान्य प्रतीक्षा वेळा:**
- साधी वेब अॅप: 5-10 मिनिटे
- डेटाबेस असलेले अॅप: 10-15 मिनिटे
- AI अनुप्रयोग: 15-25 मिनिटे (OpenAI प्रोव्हिजनिंग हळू असते)

```bash
# प्रगती तपासा
azd show

# जर >30 मिनिटे अडकले असतील तर, Azure पोर्टल तपासा:
azd monitor --overview
# विफल झालेल्या तैनाती शोधा
```
</details>

<details>
<summary><strong>❌ "परवानगी नाकारण्यात आली" किंवा "प्रतिबंधित"</strong></summary>

```bash
# आपली Azure भूमिका तपासा
az role assignment list --assignee $(az account show --query user.name -o tsv)

# आपल्याला किमान "Contributor" भूमिका आवश्यक आहे
# आपल्या Azure प्रशासकाला देण्यासाठी विनंती करा:
# - Contributor (संसाधनांसाठी)
# - User Access Administrator (भूमिका नेमणुकीसाठी)
```
</details>

<details>
<summary><strong>❌ तैनात केलेल्या अनुप्रयोगाचा URL सापडत नाही</strong></summary>

```bash
# सर्व सेवा एंडपॉइंट्स दाखवा
azd show

# किंवा Azure पोर्टल उघडा
azd monitor

# विशिष्ट सेवा तपासा
azd env get-values
# *_URL व्हेरिएबल्स शोधा
```
</details>

### 📚 पूर्ण त्रुटी निवारण साधने

- **सामान्य समस्या मार्गदर्शिका:** [सविस्तर उपाय](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-विशिष्ट समस्या:** [AI त्रुटी निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **डीबगिंग मार्गदर्शिका:** [पायरी-दर-पायरी डीबगिंग](docs/chapter-07-troubleshooting/debugging.md)
- **मदत मिळवा:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 कोर्स पूर्णता व प्रमाणपत्र

### प्रगती ट्रॅकिंग
प्रत्येक प्रकरणाद्वारे आपल्या शिकण्याची प्रगती ट्रॅक करा:

- [ ] **प्रकरण 1**: मूलभूत आणि जलद प्रारंभ ✅
- [ ] **प्रकरण 2**: AI-प्रथम विकास ✅  
- [ ] **प्रकरण 3**: कॉन्फिगरेशन व प्रमाणीकरण ✅
- [ ] **प्रकरण 4**: कोड म्हणून इन्फ्रास्ट्रक्चर व तैनाती ✅
- [ ] **प्रकरण 5**: अनेक-एजंट AI सोल्यूशन्स ✅
- [ ] **प्रकरण 6**: पूर्व-तैनाती पडताळणी व नियोजन ✅
- [ ] **प्रकरण 7**: त्रुटी निवारण व डीबगिंग ✅
- [ ] **प्रकरण 8**: उत्पादन व एंटरप्राइझ पॅटर्न ✅

### शिकण्याची पडताळणी
प्रत्येक प्रकरण पूर्ण केल्यानंतर, आपले ज्ञान खालीलप्रमाणे सत्यापित करा:
1. **व्यावहारिक सराव**: प्रकरणाचे प्रत्यक्ष तैनातीचे सराव पूर्ण करा
2. **ज्ञान तपासणी**: आपल्या प्रकरणासाठी FAQ विभाग पुनरावलोकन करा
3. **समुदाय चर्चा**: Azure Discord मध्ये आपला अनुभव सामायिक करा
4. **पुढील प्रकरण**: पुढील अवघडपणाच्या स्तरावर जा

### कोर्स पूर्णता फायदे
सर्व प्रकरणे पूर्ण केल्यावर, आपल्याकडे असे असतील:
- **उत्पादनाचा अनुभव**: वास्तविक AI अनुप्रयोग Azure वर तैनात केलेले
- **व्यावसायिक कौशल्ये**: एंटरप्राइझ-तयार तैनाती क्षमता  
- **समुदायातील ओळख**: Azure डेव्हलपर समुदायाचा सक्रिय सदस्य
- **करिअर प्रगती**: मागणी असलेली AZD आणि AI तैनाती तज्ञता

---

## 🤝 समुदाय व समर्थन

### मदत व समर्थन मिळवा
- **तांत्रिक समस्या**: [बग नोंदवा आणि फीचर विनंत्या करा](https://github.com/microsoft/azd-for-beginners/issues)
- **शिकण्याचे प्रश्न**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) आणि [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-विशिष्ट मदत**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **दस्तऐवजीकरण**: [अधिकृत Azure Developer CLI दस्तऐवजीकरण](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord मधील समुदाय अंतर्दृष्टी

**#Azure चॅनेलमधील अलीकडील मतदान निकाल:**
- विकसकांपैकी **45%** लोक AI वर्कलोडसाठी AZD वापरू इच्छितात
- **मुख्य आव्हाने**: बहु-सेवा तैनाती, क्रेडेन्शियल व्यवस्थापन, उत्पादन तत्परता  
- **सर्वाधिक विनंत्या**: AI-विशिष्ट टेम्पलेट्स, त्रुटी निवारण मार्गदर्शिका, सर्वोत्तम पद्धती

**आमच्या समुदायात सामील व्हा आणि:**
- आपले AZD + AI अनुभव सामायिक करा आणि मदत मिळवा
- नवीन AI टेम्पलेट्सच्या प्रारंभिक प्रिव्ह्यूजमध्ये प्रवेश मिळवा
- AI तैनातीसाठी सर्वोत्तम पद्धतींना योगदान द्या
- भविष्यातील AI + AZD वैशिष्ट्य विकासावर प्रभाव टाका

### कोर्समध्ये योगदान देणे
आम्ही योगदानांचे स्वागत करतो! तपशीलांसाठी कृपया आमची [योगदान मार्गदर्शिका](CONTRIBUTING.md) वाचा:
- **सामग्री सुधारणा**: विद्यमान प्रकरणे आणि उदाहरणे सुधारित करा
- **नवीन उदाहरणे**: वास्तविक जगातील परिस्थिती आणि टेम्पलेट जोडा  
- **अनुवाद**: बहुभाषिक समर्थन राखण्यात मदत करा
- **बग अहवाल**: अचूकता आणि स्पष्टता सुधारा
- **समुदाय मानके**: आमच्या समावेशक समुदाय मार्गदर्शक तत्त्वांचे पालन करा

---

## 📄 कोर्स माहिती

### लायसन्स
हा प्रकल्प MIT लायसन्स अंतर्गत परवाना आहे - तपशीलांसाठी [LICENSE](../../LICENSE) फाइल पहा.

### संबंधित Microsoft शैक्षणिक साधने

आमची टीम इतर सर्वसमावेशक शैक्षणिक कोर्सेस तयार करते:

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
[![नवशिक्यांसाठी डेटा सायन्स](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![नवशिक्यांसाठी एआय](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![नवशिक्यांसाठी सायबरसुरक्षा](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![नवशिक्यांसाठी वेब विकास](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![नवशिक्यांसाठी IoT](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![नवशिक्यांसाठी XR विकास](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot मालिका
[![एआय-पेअर प्रोग्रामिंगसाठी Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET साठी Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot साहस](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ कोर्स नेव्हिगेशन

**🚀 शिकायला सुरू करण्यास तयार आहात?**

**नवशिक्यांसाठी**: सुरू करा [प्रकरण 1: पाया आणि जलद प्रारंभ](#-chapter-1-foundation--quick-start)  
**एआय विकसकांसाठी**: थेट जा [प्रकरण 2: एआय-प्रथम विकास](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**अनुभवी विकसकांसाठी**: सुरू करा [प्रकरण 3: कॉन्फिगरेशन आणि प्रमाणीकरण](#️-chapter-3-configuration--authentication)

**पुढील पावले**: [प्रकरण 1 - AZD मूलभूत गोष्टी](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज [Co-op Translator](https://github.com/Azure/co-op-translator) या AI अनुवाद सेवेचा वापर करून अनुवादित केला गेला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेशी संबंधीत त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत म्हणून गणला जावा. महत्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजुतीं किंवा चुकीच्या अर्थ लावण्याबद्दल आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->