# AZD नवशिक्यांसाठी: एक रचनेत शिक्षण प्रवास

![AZD-for-beginners](../../translated_images/mr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### स्वयंचलित भाषांतर (नेहमी अद्ययावत)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](./README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **स्थानिक क्लोन करायचा प्राधान्य दिले?**
>
> या रेपॉजिटरीमध्ये ५०+ भाषा अनुवाद आहेत ज्यामुळे डाउनलोड आकार मोठा होतो. भाषांतरांशिवाय क्लोन करण्यासाठी, sparse checkout वापरा:
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
> यामुळे तुम्हाला कोर्स पूर्ण करण्यासाठी आवश्यक सर्वे गोष्टी मिळतील आणि डाउनलोड जलद होईल.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azd मध्ये आज काय नवीन आहे

> 📌 हा कोर्स **`azd 1.25.6`** (जून २०२६) च्या विरुद्ध तपासलेला आहे. तुमची बिल्ड तपासण्यासाठी `azd version` चालवा, आणि नवीनतम मिळवण्यासाठी `azd upgrade` चालवा.

Azure Developer CLI पारंपारिक वेब अ‍ॅप्स आणि API पेक्षा पुढे वाढली आहे. आज, azd ही Azure वर **कोणत्याही** अ‍ॅप्लिकेशनसाठी एकमेव टूल आहे—यामध्ये AI-शक्तीने चालणारी अ‍ॅप्लिकेशन्स आणि बुद्धिमान एजंट्सचा समावेश आहे.

तुमच्यासाठी याचा अर्थ:

- **AI एजंट्स आता प्राथमिक azd वर्कलोड्स आहेत.** तुम्ही तेच `azd init` → `azd up` वर्कफ्लो वापरून AI एजंट प्रोजेक्ट सुरू करू, डिप्लॉय करू आणि व्यवस्थापित करू शकता.
- **CLI मधून पूर्ण एजंट जीवनचक्र.** `azure.ai.agents` विस्तार आता संपूर्ण प्रवास व्यापतो—`azd ai agent init` स्कॅफोल्ड करण्यासाठी, `azd ai agent invoke` तपासणीसाठी (प्रतिक्रिया-वेळेचे आउटपुटसह), `azd ai agent eval generate` आणि `azd ai agent optimize` गुणवत्तेचा मापन व सुधारणा करण्यासाठी, आणि `azd ai agent delete` स्वच्छतेसाठी.
- **अधिक AI बिल्डिंग ब्लॉक्स.** नवीन प्रिव्ह्यू विस्तार—`azure.ai.skills` आणि `azure.ai.connections` तुम्हाला पुन्हा वापरता येणाऱ्या एजंट कौशल्ये आणि Foundry कनेक्शन्स थेट azd सह व्यवस्थापित करतात.
- **Microsoft Foundry एकत्रीकरण** मधून मॉडेल डिप्लॉयमेंट, एजंट होस्टिंग आणि AI सेवा कॉन्फिगरेशन थेट azd टेम्प्लेट पर्यावरणात येते.
- **दैनिक मूलभूत गोष्टी अधिक सुलभ.** अलीकडील आवृत्त्यांमुळे `azd init` आयडोम्पोटेंट बनले (पुन्हा चालवण्यास सुरक्षित), `azd auth login` जुने टोकन आपोआप साफ करणारे झाले, आणि `azd tool` पहिल्या वेळी सेटअप प्रॉम्प्टसह सुस्निग्ध झाले.
- **कोर वर्कफ्लो बदलले नाही.** तुम्ही कोणताही अ‍ॅप्लिकेशन (to-do अ‍ॅप, मायक्रोसर्व्हिस, किंवा मल्टी-एजंट AI सोल्यूशन) डिप्लॉय करत असाल, कमांड्स सारखेच आहेत.

> **Aspire वापरकर्त्यांसाठी सूचना:** Microsoft आता या उत्पादनाला फक्त **Aspire** म्हणतो (पूर्वी ".NET Aspire"). azd चे Aspire समर्थन अपरिवर्तित आहे—फक्त नाव बदलेल्या आहे.

जर तुम्ही आधी azd वापरला असल्यास, AI समर्थन एक नैसर्गिक विस्तार आहे—वेगळं टूल किंवा प्रगत मार्ग नाही. जर तुम्ही नवीन सुरु करत असाल, तर तुम्हाला एक वर्कफ्लो शिकायला मिळेल जो सर्वसाठी योग्य आहे.

---

## 🚀 Azure Developer CLI (azd) काय आहे?

**Azure Developer CLI (azd)** हा एक विकासक-अनुकूल कमांड-लाइन टूल आहे ज्यामुळे Azure वर अ‍ॅप्लिकेशन्स सहजपणे डिप्लॉय करता येतात. अनेक Azure साधने मॅन्युअली बनवण्याऐवजी तुम्ही एका कमांडने संपूर्ण अ‍ॅप्लिकेशन डिप्लॉय करू शकता.

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

**इतकंच!** Azure Portal मध्ये काहीही क्लिक करण्याची गरज नाही, क्लिष्ट ARM टेम्प्लेट्स शिकण्याची गरज नाही, मॅन्युअल कॉन्फिगरेशन नाही—फक्त Azure वर चालणारे अ‍ॅप्लिकेशन.

---

## ❓ Azure Developer CLI vs Azure CLI: फरक काय?

हे नवशिक्यांकडून विचारले जाणारे सर्वात सामान्य प्रश्न आहे. सोपा उत्तर:

| वैशिष्ट्य | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **उद्दिष्ट** | स्वतंत्र Azure साधनांचे व्यवस्थापन | संपूर्ण अ‍ॅप्लिकेशन्स डिप्लॉय करणे |
| **दृष्टीकोन** | पायाभूत सुविधा-केंद्रित | अ‍ॅप्लिकेशन-केंद्रित |
| **उदाहरण** | `az webapp create --name myapp...` | `azd up` |
| **शिकण्याची गरज** | Azure सेवा माहिती असणे आवश्यक | फक्त तुमचा अ‍ॅप माहित असणे पुरे |
| **सर्वोत्कृष्ट कोणासाठी** | देवऑप्स, पायाभूत सुविधा | विकासक, प्रोटोटायपिंग |

### सोपी तुलना

- **Azure CLI** म्हणजे घर बांधण्यासाठी लागणारी सर्व उपकरणे—हॅमर, आरी, नखे. तुम्ही काहीही बांधू शकता, पण बांधकाम माहित असणे आवश्यक.
- **Azure Developer CLI** म्हणजे ठेकेदार नेमणे—तुम्ही काय हवे ते वर्णन करता, ते बांधणी हाताळतात.

### कधी कोण वापरायचा

| परिस्थिती | वापरा हे |
|----------|----------|
| "माझा वेब अ‍ॅप लवकर डिप्लॉय करायचा आहे" | `azd up` |
| "मला फक्त एक स्टोरेज अकाउंट तयार करायचा आहे" | `az storage account create` |
| "मी एक पूर्ण AI अ‍ॅप्लिकेशन तयार करतो आहे" | `azd init --template azure-search-openai-demo` |
| "मला एखाद्या Azure साधनाची डिबगिंग करायची आहे" | `az resource show` |
| "मला मिनिटांत प्रॉडक्शन-तयार डिप्लॉयमेंट हवे" | `azd up --environment production` |

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

शून्यातून सुरुवात करू नका! **Awesome AZD** हे कम्युनिटी कलेक्शन आहे जिथे त्वरित डिप्लॉय करण्यायोग्य टेम्प्लेट्स आहेत:

| स्रोत | वर्णन |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | २००+ टेम्प्लेट्स एकच क्लिकने ब्राउझ करा आणि डिप्लॉय करा |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | तुमचा स्वतःचा टेम्प्लेट कम्युनिटीला द्या |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | स्टार करा आणि स्रोत एक्सप्लोर करा |

### Awesome AZD मधील लोकप्रिय AI टेम्प्लेट्स

```bash
# Microsoft Foundry मॉडेल्स आणि एआय शोधासह RAG चॅट
azd init --template azure-search-openai-demo

# जलद एआय चॅट अनुप्रयोग
azd init --template openai-chat-app-quickstart

# Foundry एजंट्ससह एआय एजंट्स
azd init --template get-started-with-ai-agents
```

---

## 🎯 ३ टप्यात सुरुवात करा

तुम्ही सुरु करण्याआधी, तुमची मशीन त्या टेम्प्लेटसाठी तयार आहे याची खात्री करा जी तुम्ही डिप्लॉय करू इच्छिता:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

जर एखादी गरजेची तपासणी अयशस्वी झाली तर आधी ती दुरुस्त करा आणि त्यानंतर जलद सुरुवात करा.

### टप्पा 1: AZD इन्स्टॉल करा (२ मिनिटे)

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

### टप्पा 2: AZD साठी प्रमाणीकरण करा

```bash
# जर तुम्ही या कोर्समध्ये थेट Azure CLI कमांड्स वापरण्याचा विचार करत असाल तर हे ऐच्छिक आहे
az login

# AZD कार्यप्रवाहांसाठी आवश्यक
azd auth login
```

जर तुम्हाला नक्की काय हवे हे माहित नसेल, तर [इन्स्टॉलेशन & सेटअप](docs/chapter-01-foundation/installation.md#authentication-setup) मध्ये पूर्ण सेटअप फ्लो अनुसरा.

### टप्पा 3: तुमचा पहिला अ‍ॅप डिप्लॉय करा

```bash
# टेम्पलेटमधून प्रारंभ करा
azd init --template todo-nodejs-mongo

# Azure वर तैनात करा (सर्व काही तयार होते!)
azd up
```

**🎉 इतकंच!** तुमचा अ‍ॅप आता Azure वर लाइव्ह आहे.

### स्वच्छता करा (कधीही विसरू नका!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 हा कोर्स कसा वापरायचा

हा कोर्स **प्रगतीशील शिक्षणासाठी** डिझाइन केला आहे—तुम्हाला जिथे आरामदायक वाटते तेथे सुरुवात करा आणि पुढे जा:

| तुमचा अनुभव | येथे सुरुवात करा |
|-----------------|------------|
| **Azure मध्ये नवीन** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Azure जाणता पण AZD नवीन** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **AI अ‍ॅप्स डिप्लॉय करायचे आहेत** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **हातांनी प्रॅक्टिस करायची आहे** | [🎓 Interactive Workshop](workshop/README.md) - ३-४ तास मार्गदर्शित लॅब |
| **प्रॉडक्शन पॅटर्न्स हवे आहेत** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### जलद सेटअप

1. **हा रेपॉजिटरी फोर्क करा**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **क्लोन करा**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **मदत घ्या**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **स्थानिक क्लोन करायचा प्राधान्य दिले?**

> या रेपॉजिटरीमध्ये ५०+ भाषा अनुवाद आहेत ज्यामुळे डाउनलोड आकार मोठा होतो. भाषांतरांशिवाय क्लोन करण्यासाठी, sparse checkout वापरा:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> यामुळे तुम्हाला कोर्स पूर्ण करण्यासाठी आवश्यक सर्वे गोष्टी मिळतील आणि डाउनलोड जलद होईल.


## कोर्सवर एक नजर

Azure Developer CLI (azd) मध्ये पारंगत व्हा, संरचित अध्यायांमधून प्रगतीशील शिक्षणासाठी डिझाइन केलेले. **Microsoft Foundry एकत्रीकरणासह AI अ‍ॅप्लिकेशन डिप्लॉयमेंटवर विशेष भर.**
### आधुनिक विकासकांसाठी हा कोर्स का आवश्यक आहे

Microsoft Foundry Discord समुदायाच्या माहितीनुसार, **45% विकासक AI कार्यभारांसाठी AZD वापरू इच्छितात** पण खालील अडचणींचा सामना करतात:
- क्लिष्ट मल्टी-सेवा AI आर्किटेक्चर
- उत्पादन AI तैनात करण्याच्या सर्वोत्तम पद्धती
- Azure AI सेवा एकत्रीकरण आणि साजेशा सानुकूलन
- AI कार्यभारांसाठी खर्चाचे अनुकूलन
- AI-विशिष्ट तैनातीतील समस्या निवारण

### शिकण्याचे उद्दिष्टे

हा संरचित कोर्स पूर्ण करून, आपण:
- **AZD मूलभूत गोष्टी मास्टर करा**: मुख्य संकल्पना, इन्स्टॉलेशन आणि सानुकूलन
- **AI अनुप्रयोग तैनात करा**: Microsoft Foundry सेवांसह AZD वापरा
- **इन्फ्रास्ट्रक्चर as Code अमलात आणा**: Bicep टेम्प्लेट्ससह Azure संसाधने व्यवस्थापित करा
- **तैनातीतील समस्या सोडवा**: सामान्य समस्या सोडवणे आणि डिबगिंग
- **उत्पादनासाठी अनुकूलन करा**: सुरक्षा, प्रमाण, निरीक्षण आणि खर्च व्यवस्थापन
- **मल्टी-एजंट सोल्यूशन्स तयार करा**: क्लिष्ट AI आर्किटेक्चर तैनात करा

## सुरू करण्यापूर्वी: खाती, प्रवेश आणि गृहितके

प्रकरण 1 सुरू करण्यापूर्वी, खालील गोष्टींची खात्री करा. या मार्गदर्शकातील इन्स्टॉलेशन स्टेप्स या मूलभूत गोष्टी आधीच केल्या असल्याचे गृहित धरतात.

- **एक Azure सदस्यता**: आपण आपल्या कामाच्या किंवा स्वतःच्या खात्याची सदस्यता वापरू शकता, किंवा [स्वतंत्र ट्रायल](https://aka.ms/azurefreetrial) तयार करू शकता.
- **Azure संसाधने तयार करण्याची परवानगी**: बहुतेक व्यायामांसाठी, आपण लक्ष्य सदस्यता किंवा संसाधन गटावर कमीतकमी **Contributor** प्रवेश असणे आवश्यक आहे. काही प्रकरणांमध्ये आपण संसाधन गट, व्यवस्थापित ओळख (managed identities), आणि RBAC नियुक्ती तयार करू शकता असे गृहित धरले जाऊ शकते.
- [**GitHub खाते**](https://github.com): हे रेपॉझिटरी फोर्क करण्यासाठी, स्वतःच बदल ट्रॅक करण्यासाठी आणि GitHub Codespaces वर्कशॉपसाठी उपयोगी आहे.
- **टेम्प्लेट रनटाइम पूर्वअट**: काही टेम्प्लेटसाठी Node.js, Python, Java, किंवा Docker सारखे स्थानिक टूल्स आवश्यक असतात. सुरुवात करण्याआधी सेटअप व्हॅलिडेटर चालवा जेणेकरून कोणतीही गायब टूल्स लवकर समजतील.
- **मूलभूत टर्मिनल परिचय**: तुम्हाला तज्ञ असण्याची गरज नाही, पण `git clone`, `azd auth login`, आणि `azd up` सारखे कमांड चालवायला आरामदायक असणे आवश्यक आहे.

> **एंटरप्राइज सदस्यतेत कार्यरत आहात का?**  
> जर तुमचे Azure वातावरण एखाद्या प्रशासकाद्वारे व्यवस्थापित असेल, तर वापरण्यासाठी निवडलेल्या सदस्यता किंवा संसाधन गटात तुम्ही संसाधने तैनात करू शकता हे आगाऊ पुष्टी करा. नाही तर, सुरू करण्यापूर्वी सॅंडबॉक्स सदस्यता किंवा Contributor प्रवेश विचारावा.

> **Azure मध्ये नवीन आहात का?**  
> आपली स्वतःची Azure ट्रायल किंवा पे-एज-यू-गो सदस्यता https://aka.ms/azurefreetrial वर सुरू करा जेणेकरून तुम्ही व्यायाम पूर्ण करू शकता तसेच मलिक-स्तरीय मंजुरीची प्रतीक्षा न करता पुढे जाऊ शकता.

## 🗺️ कोर्स नकाशा: प्रकरणांनुसार जलद नेव्हिगेशन

प्रत्येक प्रकरणासाठी एक समर्पित README आहे ज्यात शिकण्याचे उद्दिष्ट, जलद प्रारंभ, आणि व्यायाम समाविष्ट आहेत:

| प्रकरण | विषय | धडे | कालावधी | गुंतागुंत |
|---------|-------|---------|----------|------------|
| **[प्रकरण 1: पाया](docs/chapter-01-foundation/README.md)** | सुरुवात | [AZD मूलभूत](docs/chapter-01-foundation/azd-basics.md) &#124; [इंस्टॉलेशन](docs/chapter-01-foundation/installation.md) &#124; [पहिला प्रकल्प](docs/chapter-01-foundation/first-project.md) | 30-45 मिनिटे | ⭐ |
| **[प्रकरण 2: AI विकास](docs/chapter-02-ai-development/README.md)** | AI-प्रथम अनुप्रयोग | [Foundry एकत्रीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI एजंट्स](docs/chapter-02-ai-development/agents.md) &#124; [मॉडेल तैनाती](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [वर्कशॉप](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 तास | ⭐⭐ |
| **[प्रकरण 3: सानुकूलन](docs/chapter-03-configuration/README.md)** | प्रमाणीकरण आणि सुरक्षा | [सानुकूलन](docs/chapter-03-configuration/configuration.md) &#124; [प्रमाणीकरण व सुरक्षा](docs/chapter-03-configuration/authsecurity.md) | 45-60 मिनिटे | ⭐⭐ |
| **[प्रकरण 4: इन्फ्रास्ट्रक्चर](docs/chapter-04-infrastructure/README.md)** | IaC आणि तैनात करणे | [तैनात मार्गदर्शक](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [प्राव्हिजनिंग](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 तास | ⭐⭐⭐ |
| **[प्रकरण 5: मल्टी-एजंट](docs/chapter-05-multi-agent/README.md)** | AI एजंट सोल्यूशन्स | [रिटेल परिस्थिती](examples/retail-scenario.md) &#124; [समन्वय नमुने](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 तास | ⭐⭐⭐⭐ |
| **[प्रकरण 6: पूर्व-तैनाती](docs/chapter-06-pre-deployment/README.md)** | नियोजन आणि पडताळणी | [प्रीफ्लाइट तपासणी](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [क्षमता नियोजन](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU निवड](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [अ‍ॅप इनसाइट्स](docs/chapter-06-pre-deployment/application-insights.md) | 1 तास | ⭐⭐ |
| **[प्रकरण 7: समस्या निवारण](docs/chapter-07-troubleshooting/README.md)** | डिबग आणि दुरुस्ती | [सामान्य समस्या](docs/chapter-07-troubleshooting/common-issues.md) &#124; [डिबगिंग](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI समस्या](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 तास | ⭐⭐ |
| **[प्रकरण 8: उत्पादन](docs/chapter-08-production/README.md)** | एंटरप्राइज पॅटर्न्स | [उत्पादन सराव](docs/chapter-08-production/production-ai-practices.md) | 2-3 तास | ⭐⭐⭐⭐ |
| **[🎓 वर्कशॉप](workshop/README.md)** | हाताळणी प्रयोगशाळा | [परिचय](workshop/docs/instructions/0-Introduction.md) &#124; [निवड](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [पडताळणी](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [विखंडन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [सानुकूलन](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [वैयक्तिकरण](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [अ‍ॅपग्रेड](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [समारोप](workshop/docs/instructions/7-Wrap-up.md) | 3-4 तास | ⭐⭐ |

**एकूण कोर्सचा कालावधी:** ~10-14 तास | **कौशल्य प्रगती:** प्रारंभिक → उत्पादन-तयार

---

## 📚 शिकण्याची प्रकरणे

*अनुभव पातळी आणि उद्दिष्टांनुसार आपली शिकण्याची वाटिका निवडा*

### 🚀 प्रकरण 1: पाया आणि जलद प्रारंभ  
**पूर्वशर्ती:** Azure सदस्यता, मूलभूत कमांड लाइन ज्ञान  
**कालावधी:** 30-45 मिनिटे  
**गुंतागुंत:** ⭐

#### आपण काय शिकाल  
- Azure Developer CLI मूलभूत समज  
- AZD आपल्या प्लॅटफॉर्मवर इन्स्टॉल करणे  
- आपली पहिली यशस्वी तैनात  

#### शिक्षण साधने  
- **🎯 येथे सुरु करा**: [Azure Developer CLI म्हणजे काय?](#what-is-azure-developer-cli)  
- **📖 सिद्धांत**: [AZD मूलभूत](docs/chapter-01-foundation/azd-basics.md) - मुख्य संकल्पना व शब्दावली  
- **⚙️ सेटअप**: [इंस्टॉलेशन व सेटअप](docs/chapter-01-foundation/installation.md) - प्लॅटफॉर्म-विशिष्ट मार्गदर्शक  
- **🛠️ व्यावहारिक**: [आपला पहिला प्रकल्प](docs/chapter-01-foundation/first-project.md) - टप्प्याटप्प्याने मार्गदर्शन  
- **📋 जलद संदर्भ**: [कमांड चीट शीट](resources/cheat-sheet.md)  

#### व्यावहारिक व्यायाम  
```bash
# जलद प्रतिष्ठापन तपासणी
azd version

# आपले पहिले अनुप्रयोग तैनात करा
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 प्रकरणाचा निकाल:** AZD वापरून Azure वर साध्या वेब अॅप्लिकेशनचे यशस्वी तैनात करणे  

**✅ यशाची पडताळणी:**  
```bash
# प्रकरण १ पूर्ण केल्यावर, आपण सक्षम असले पाहिजे:
azd version              # स्थापित आवृत्ती दर्शविते
azd init --template todo-nodejs-mongo  # प्रकल्प प्रारंभ करते
azd up                  # Azure वर तैनात करते
azd show                # चालू अनुप्रयोगाचा URL दर्शविते
# अनुप्रयोग ब्राउझरमध्ये उघडतो आणि कार्य करतो
azd down --force --purge  # संसाधने स्वच्छ करतो
```
  
**📊 वेळ गुंतवणूक:** 30-45 मिनिटे  
**📈 कौशल्य पातळी नंतर:** मूलभूत अनुप्रयोग स्वतंत्रपणे तैनात करू शकता  
**📈 कौशल्य पातळी नंतर:** मूलभूत अनुप्रयोग स्वतंत्रपणे तैनात करू शकता  

---

### 🤖 प्रकरण 2: AI-प्रथम विकास (AI विकासकांसाठी शिफारस)  
**पूर्वशर्ती:** प्रकरण 1 पूर्ण केलेले  
**कालावधी:** 1-2 तास  
**गुंतागुंत:** ⭐⭐

#### आपण काय शिकाल  
- Microsoft Foundry चे AZD शी एकत्रीकरण  
- AI-शक्तींचे अनुप्रयोग तैनात करणे  
- AI सेवा सानुकूलन समजून घेणे  

#### शिक्षण साधने  
- **🎯 येथे सुरु करा**: [Microsoft Foundry एकत्रीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 AI एजंट्स**: [AI एजंट्स मार्गदर्शक](docs/chapter-02-ai-development/agents.md) - AZD सह बुद्धिमान एजंट तैनात करा  
- **📖 नमुने**: [AI मॉडेल तैनाती](docs/chapter-02-ai-development/ai-model-deployment.md) - AI मॉडेल तैनात आणि व्यवस्थापित करा  
- **🛠️ वर्कशॉप**: [AI वर्कशॉप लॅब](docs/chapter-02-ai-development/ai-workshop-lab.md) - आपली AI सोल्यूशन्स AZD-तयार करा  
- **🎥 परस्पर मार्गदर्शक**: [वर्कशॉप साहित्य](workshop/README.md) - MkDocs सह ब्राउझर-आधारित शिकणे * DevContainer वातावरण  
- **📋 टेम्प्लेट्स**: [Microsoft Foundry टेम्प्लेट्स](#कार्यशाळा-संदर्भ)  
- **📝 उदाहरणे**: [AZD तैनात उदाहरणे](examples/README.md)  

#### व्यावहारिक व्यायाम  
```bash
# तुमचे पहिले AI अनुप्रयोग तैनात करा
azd init --template azure-search-openai-demo
azd up

# अतिरिक्त AI साच्यांचा प्रयत्न करा
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 प्रकरणाचा निकाल:** RAG क्षमता असलेल्या AI-शक्तीच्या चॅट अनुप्रयोगाचे तैनात आणि सानुकूलन  

**✅ यशाची पडताळणी:**  
```bash
# प्रकरण २ नंतर, तुम्ही खालील गोष्टी करू शकाल:
azd init --template azure-search-openai-demo
azd up
# AI चॅट इंटरफेसची चाचणी करा
# प्रश्न विचारा आणि स्रोतांसह AI-संचालित प्रतिसाद मिळवा
# शोध एकत्रीकरण योग्यरित्या कार्य करते का हे तपासा
azd monitor  # एप्लिकेशन इनसाइट्स टेलिमेट्री दर्शवते का ते तपासा
azd down --force --purge
```
  
**📊 वेळ गुंतवणूक:** 1-2 तास  
**📈 कौशल्य पातळी नंतर:** उत्पादनासाठी तयार AI अनुप्रयोग तैनात व सानुकूल करू शकता  
**💰 खर्च जागरूकता:** $80-150/महिना विकास खर्च, $300-3500/महिना उत्पादन खर्च समजून घ्या  

#### 💰 AI तैनातीसाठी खर्च विचारधारा

**विकास पर्यावरण (अंदाजे $80-150/महिना):**  
- Microsoft Foundry मॉडेल्स (पे-एज-यू-गो): $0-50/महिना (टोकन वापरावर आधारित)  
- AI सर्च (बेसिक स्तर): $75/महिना  
- कंटेनर अॅप्स (कंझंप्शन): $0-20/महिना  
- स्टोरेज (स्टॅंडर्ड): $1-5/महिना  

**उत्पादन पर्यावरण (अंदाजे $300-3,500+/महिना):**  
- Microsoft Foundry मॉडेल्स (PTU सतत कार्यक्षमतेसाठी): $3,000+/महिना किंवा उच्च व्हॉल्यूमसह पे-एज-यू-गो  
- AI सर्च (स्टँडर्ड स्तर): $250/महिना  
- कंटेनर अॅप्स (समर्पित): $50-100/महिना  
- अ‍ॅप्लिकेशन इनसाइट्स: $5-50/महिना  
- स्टोरेज (प्रीमियम): $10-50/महिना  

**💡 खर्च अनुकूलन टिप्स:**  
- शिकण्यासाठी **फ्री टियर** Microsoft Foundry मॉडेल्स वापरा (Azure OpenAI मध्ये 50,000 टोकन/महिना समाविष्ट)  
- सक्रिय विकास नसताना `azd down` चालवून संसाधने मुक्त करा  
- सुरुवातीला कंझंप्शन-बेस्ड बिलिंग वापरा, उत्पादनासाठी PTU मध्ये अपग्रेड करा  
- तैनातीपूर्वी खर्चाचा अंदाज घेण्यासाठी `azd provision --preview` वापरा  
- ऑटो-स्केलिंग सक्षम करा: फक्त प्रत्यक्ष वापरासाठी पैसे द्या  

**खर्च निरीक्षण:**  
```bash
# अंदाजे मासिक खर्च तपासा
azd provision --preview

# Azure पोर्टलमध्ये वास्तविक खर्चाचे निरीक्षण करा
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ प्रकरण 3: सानुकूलन आणि प्रमाणीकरण  
**पूर्वशर्ती:** प्रकरण 1 पूर्ण केलेले  
**कालावधी:** 45-60 मिनिटे  
**गुंतागुंत:** ⭐⭐

#### आपण काय शिकाल  
- पर्यावरण सानुकूलन आणि व्यवस्थापन  
- प्रमाणीकरण आणि सुरक्षा सर्वोत्तम पद्धती  
- संसाधन नावे आणि संघटना  

#### शिक्षण साधने  
- **📖 सानुकूलन**: [सानुकूलन मार्गदर्शक](docs/chapter-03-configuration/configuration.md) - पर्यावरण सेटअप  
- **🔐 सुरक्षा**: [प्रमाणीकरण पॅटर्न आणि व्यवस्थापित ओळख](docs/chapter-03-configuration/authsecurity.md) - प्रमाणीकरण पॅटर्न  
- **📝 उदाहरणे**: [डेटाबेस अॅप्लिकेशन उदाहरण](examples/database-app/README.md) - AZD डेटाबेस उदाहरणे  

#### व्यावहारिक व्यायाम  
- अनेक पर्यावरण (डिव्ह, स्टेजिंग, प्रॉडक्शन) सानुकूल करा  
- व्यवस्थापित ओळख प्रमाणीकरण सादर करा  
- पर्यावरण-विशिष्ट सानुकूलने अमलात आणा  

**💡 प्रकरणाचा निकाल:** योग्य प्रमाणीकरण आणि सुरक्षा सह अनेक पर्यावरणे व्यवस्थापित करा  

---

### 🏗️ प्रकरण 4: Infrastructure as Code आणि तैनात करणे  
**पूर्वशर्ती:** प्रकरण 1-3 पूर्ण केलेले  
**कालावधी:** 1-1.5 तास  
**गुंतागुंत:** ⭐⭐⭐

#### आपण काय शिकाल  
- प्रगत तैनाती पॅटर्न्स  
- Bicep सह Infrastructure as Code  
- संसाधन प्राव्हिजनिंग धोरणे  

#### शिक्षण साधने  
- **📖 तैनात मार्गदर्शक**: [तैनाती मार्गदर्शक](docs/chapter-04-infrastructure/deployment-guide.md) - पूर्ण वर्कफ्लो  
- **🏗️ प्राव्हिजनिंग**: [संसाधन प्राव्हिजनिंग](docs/chapter-04-infrastructure/provisioning.md) - Azure संसाधन व्यवस्थापन  
- **📝 उदाहरणे**: [कंटेनर अॅप उदाहरण](../../examples/container-app) - कंटेनरयुक्त तैनाती  

#### व्यावहारिक व्यायाम  
- कस्टम Bicep टेम्प्लेट्स तयार करा  
- मल्टी-सेवा अनुप्रयोग तैनात करा  
- ब्लू-ग्रीन तैनाती धोरणे अमलात आणा  

**💡 प्रकरणाचा निकाल:** कस्टम इन्फ्रास्ट्रक्चर टेम्प्लेट्स वापरून क्लिष्ट मल्टी-सेवा अनुप्रयोग तैनात करा  

---
### 🎯 प्रकरण ५: मल्टी-एजंट एआय सोल्यूशन्स (प्रगत)
**पूर्वआवश्यकता**: प्रकरणे १-२ पूर्ण   
**कालावधी**: २-३ तास  
**कठीणपणा**: ⭐⭐⭐⭐

#### आपण काय शिकणार आहात
- मल्टी-एजंट आर्किटेक्चर नमुने
- एजंट समन्वय आणि संघटना
- उत्पादन-तयार एआय तैनाती

#### शिकण्याचे स्रोत
- **🤖 वैशिष्ट्यीकृत प्रकल्प**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - पूर्ण अंमलबजावा
- **🛠️ ARM टेम्पलेट्स**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - एका क्लिकमध्ये तैनाती
- **📖 आर्किटेक्चर**: [मल्टी-एजंट समन्वय नमुने](docs/chapter-06-pre-deployment/coordination-patterns.md) - नमुने

#### व्यावहारिक सराव
```bash
# संपूर्ण किरकोळ बहु-एजंट सोल्यूशन वितरण करा
cd examples/retail-multiagent-arm-template
./deploy.sh

# एजंट कॉन्फिगरेशन अन्वेषण करा
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 प्रकरण परिणाम**: ग्राहक आणि इन्व्हेंटरी एजंटसह उत्पादन-तयार मल्टी-एजंट एआय सोल्यूशन तैनात करा आणि व्यवस्थापित करा

---

### 🔍 प्रकरण ६: पूर्व-तैनाती पडताळणी आणि नियोजन
**पूर्वआवश्यकता**: प्रकरण ४ पूर्ण  
**कालावधी**: १ तास  
**कठीणपणा**: ⭐⭐

#### आपण काय शिकणार आहात
- क्षमता नियोजन आणि संसाधन पडताळणी
- SKU निवड धोरणे
- पूर्व-फ्लाइट तपासणी आणि ऑटोमेशन

#### शिकण्याचे स्रोत
- **📊 नियोजन**: [क्षमता नियोजन](docs/chapter-06-pre-deployment/capacity-planning.md) - संसाधन पडताळणी
- **💰 निवड**: [SKU निवड](docs/chapter-06-pre-deployment/sku-selection.md) - खर्च-प्रभावी पर्याय
- **✅ पडताळणी**: [पूर्व-फ्लाइट तपासण्या](docs/chapter-06-pre-deployment/preflight-checks.md) - स्वयंचलित स्क्रिप्ट्स

#### व्यावहारिक सराव
- क्षमता पडताळणी स्क्रिप्ट्स चालवा
- खर्चासाठी SKU निवड ऑप्टिमाइझ करा
- स्वयंचलित पूर्व-तैनाती तपासण्या कार्यांस्पद करा

**💡 प्रकरण परिणाम**: अंमलबजावणीपूर्वी तैनातीचे सत्यापन आणि ऑप्टिमायझेशन करा

---

### 🚨 प्रकरण ७: समस्या निवारण आणि डीबगिंग
**पूर्वआवश्यकता**: कोणतेही तैनाती प्रकरण पूर्ण  
**कालावधी**: १-१.५ तास  
**कठीणपणा**: ⭐⭐

#### आपण काय शिकणार आहात
- प्रणालीगत डीबगिंग पद्धती
- सामान्य समस्या आणि उपाय
- एआय-विशिष्ट समस्या निवारण

#### शिकण्याचे स्रोत
- **🔧 सामान्य प्रश्न**: [सामान्य समस्या](docs/chapter-07-troubleshooting/common-issues.md) - FAQ आणि उपाय
- **🕵️ डीबगिंग**: [डीबगिंग मार्गदर्शक](docs/chapter-07-troubleshooting/debugging.md) - टप्प्याटप्प्याने धोरणे
- **🤖 एआय समस्या**: [एआय-विशिष्ट समस्या निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - एआय सेवा समस्या

#### व्यावहारिक सराव
- तैनाती अपयशांचे निदान करा
- प्रमाणीकरण समस्या सोडवा
- एआय सेवा कनेक्टिव्हिटी डीबग करा

**💡 प्रकरण परिणाम**: स्वतंत्रपणे सामान्य तैनाती समस्यांचे निदान आणि निराकरण करा

---

### 🏢 प्रकरण ८: उत्पादन आणि एंटरप्राइझ नमुने
**पूर्वआवश्यकता**: प्रकरणे १-४ पूर्ण  
**कालावधी**: २-३ तास  
**कठीणपणा**: ⭐⭐⭐⭐

#### आपण काय शिकणार आहात
- उत्पादन तैनाती धोरणे
- एंटरप्राइझ सुरक्षा नमुने
- मॉनिटरिंग आणि खर्च ऑप्टिमायझेशन

#### शिकण्याचे स्रोत
- **🏭 उत्पादन**: [उत्पादन एआय सर्वोत्तम सराव](docs/chapter-08-production/production-ai-practices.md) - एंटरप्राइझ नमुने
- **📝 उदाहरणे**: [मायक्रोसर्व्हिसेस उदाहरण](../../examples/microservices) - गुंतागुंतीची आर्किटेक्चर्स
- **📊 मॉनिटरिंग**: [Application Insights एकत्रीकरण](docs/chapter-06-pre-deployment/application-insights.md) - मॉनिटरिंग

#### व्यावहारिक सराव
- एंटरप्राइझ सुरक्षा नमुने कार्यान्वित करा
- व्यापक मॉनिटरिंग सेटअप करा
- योग्य राज्यपालनासह उत्पादनात तैनात करा

**💡 प्रकरण परिणाम**: पूर्ण उत्पादन क्षमतांसह एंटरप्राइझ-तयार अनुप्रयोग तैनात करा

---

## 🎓 कार्यशाळा आढावा: प्रायोगिक शिकण्याचा अनुभव

> **⚠️ कार्यशाळेची स्थिती: सक्रिय विकास**  
> कार्यशाळा साहित्य सध्या विकसित आणि सुधारित करत आहे. मुख्य मोड्यूल कार्यरत आहेत, परंतु काही प्रगत विभाग अपूर्ण आहेत. आम्ही सर्व सामग्री पूर्ण करण्यासाठी सक्रियपणे काम करत आहोत. [प्रगती पहा →](workshop/README.md)

### संवादात्मक कार्यशाळा साहित्य  
**ब्राउझर-आधारित साधने आणि मार्गदर्शित व्यायामांसह व्यापक प्रायोगिक शिकवण**

आमचे कार्यशाळा साहित्य प्रकरण-आधारित अभ्यासक्रमाला पूरक अशी रचना केलेली आहे. कार्यशाळा स्व-गतीने शिकण्यासाठी तसेच प्रशिक्षक नेतृत्वाखाली सत्रांसाठी डिझाइन केलेली आहे.

#### 🛠️ कार्यशाळेच्या वैशिष्ट्ये
- **ब्राउझर-आधारित इंटरफेस**: शोध, कॉपी व थीम वैशिष्ट्यांसह पूर्ण MkDocs-चालित कार्यशाळा
- **GitHub Codespaces एकत्रीकरण**: एका क्लिकमध्ये विकास वातावरण सेटअप
- **संरचित शिकण्याचा मार्ग**: ८-मोड्यूल अनुदेशित व्यायाम (एकूण ३-४ तास)
- **प्रगत पद्धतीशास्त्र**: परिचय → निवड → पडताळणी → विघटन → संरचना → सानुकूलन → समाप्ति → एकंदर आढावा
- **संवादात्मक DevContainer वातावरण**: पूर्व-संरचित साधने आणि अवलंबित्व

#### 📚 कार्यशाळा मोड्यूल रचना
कार्यशाळा एक **८-मोड्यूल प्रगत पद्धतीशास्त्र** अनुसरते जी शोधापासून तैनात करण्यापर्यंत घेऊन जाते:

| मोड्यूल | विषय | तुम्ही काय कराल | कालावधी |
|---------|-------|-----------------|---------|
| **0. परिचय** | कार्यशाळा आढावा | शिकण्याच्या उद्दिष्टे, पूर्वआवश्यकता आणि कार्यशाळा रचना समजून घ्या | १५ मिनिटे |
| **1. निवड** | टेम्पलेट शोध | AZD टेम्पलेट शोधा आणि तुमच्या परिस्थितीसाठी योग्य AI टेम्पलेट निवडा | २० मिनिटे |
| **2. पडताळणी** | तैनात करा आणि सत्यापित करा | `azd up` वापरून टेम्पलेट तैनात करा आणि पायाभूत सुविधा कार्य करते हे पडताळा | ३० मिनिटे |
| **3. विघटन** | रचना समजून घ्या | GitHub Copilot वापरून टेम्पलेट आर्किटेक्चर, Bicep फाइल आणि कोड संघटन एक्सप्लोर करा | ३० मिनिटे |
| **4. संरचना** | azure.yaml सखोल | `azure.yaml` कॉन्फिगरेशन, लाइफसायकल हुक्स आणि पर्यावरणीय चल गाठा | ३० मिनिटे |
| **5. सानुकूलन** | तुमच्या आवश्यकतेनुसार करा | AI शोध सक्षम करा, ट्रेसिंग, मूल्यमापन करा व तुमच्या परिस्थितीसाठी सानुकूलित करा | ४५ मिनिटे |
| **6. समाप्ति** | साफसफाई करा | `azd down --purge` वापरून सुरक्षितपणे संसाधने हटवा | १५ मिनिटे |
| **7. एकंदर आढावा** | पुढचे पाऊल | पूर्ण केलेले पुनरावलोकन करा, मुख्य संकल्पना आणि शिकण्याची पुढची वाटचाल | १५ मिनिटे |

**कार्यशाळा प्रवाह:**  
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```
  
#### 🚀 कार्यशाळा सुरू करताना  
```bash
# पर्याय 1: GitHub Codespaces (शिफारस केलेले)
# रेपॉजिटरीमध्ये "Code" → "Create codespace on main" क्लिक करा

# पर्याय 2: स्थानिक विकास
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md मधील सेटअप सूचनांचे पालन करा
```
  
#### 🎯 कार्यशाळा शिकण्याचे परिणाम  
कार्यशाळा पूर्ण करून, सहभागी:

- **उत्पादन AI अनुप्रयोग तैनात करतील**: Microsoft Foundry सेवा वापरून AZD वापरकर्ता
- **मल्टी-एजंट आर्किटेक्चर समर्थ होतील**: समन्वित AI एजंट सोल्यूशन्स अंमलात आणतील
- **सुरक्षा सर्वोत्तम सराव अंमलात आणतील**: प्रमाणीकरण आणि प्रवेश नियंत्रण कॉन्फिगर करतील
- **स्केलसाठी ऑप्टिमाइझ करतील**: खर्च-प्रभावी, कार्यक्षम तैनाती डिझाइन करतील
- **तैनाती समस्या सोडवतील**: सामान्य समस्या स्वतंत्रपणे निराकरण करतील

#### 📖 कार्यशाळा संदर्भ
- **🎥 संवादात्मक मार्गदर्शक**: [कार्यशाळा साहित्य](workshop/README.md) - ब्राउझर-आधारित शिकण्याचे वातावरण
- **📋 प्रत्येक मोड्यूलसाठी सूचना**:
  - [0. परिचय](workshop/docs/instructions/0-Introduction.md) - कार्यशाळा आढावा आणि उद्दिष्टे
  - [1. निवड](workshop/docs/instructions/1-Select-AI-Template.md) - AI टेम्पलेट शोधा आणि निवडा
  - [2. पडताळणी](workshop/docs/instructions/2-Validate-AI-Template.md) - तैनात करा आणि पडताळणी करा
  - [3. विघटन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - टेम्पलेट आर्किटेक्चर एक्सप्लोर करा
  - [4. संरचना](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml मध्ये निपुणता मिळवा
  - [5. सानुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) - तुमच्या परिस्थितीसाठी सानुकूल करा
  - [6. समाप्ति](workshop/docs/instructions/6-Teardown-Infrastructure.md) - संसाधने साफ करा
  - [7. एकंदर आढावा](workshop/docs/instructions/7-Wrap-up.md) - पुनरावलोकन करा व पुढील पावले

- **🛠️ एआय कार्यशाळा लॅब**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - एआय-केंद्रित व्यायाम
- **💡 जलद प्रारंभ**: [कार्यशाळा सेटअप मार्गदर्शक](workshop/README.md#quick-start) - वातावरण कॉन्फिगरेशन

**तयार योग्य**: कॉर्पोरेट प्रशिक्षण, विद्यापीठ कोर्स, स्व-गतीने शिक्षण, आणि विकसक बूटकॅंपसाठी.

---

## 📖 खोलवर जाऊन: AZD क्षमता

मूलभूत गोष्टींपलीकडे, AZD उत्पादन तैनातीसाठी सामर्थ्यवान वैशिष्ट्ये पुरवतो:

- **टेम्पलेट-आधारित तैनाती** - सामान्य अनुप्रयोग नमुन्यांसाठी पूर्व-निर्मित टेम्पलेट्स वापरा
- **इन्फ्रास्ट्रक्चर एज कोड** - Azure संसाधने Bicep किंवा Terraform वापरून व्यवस्थापित करा  
- **एकात्मिक कार्यप्रवाह** - अनुप्रयोग सुलभProvision, तैनात आणि मॉनिटर करा
- **विकसक-मैत्रीपूर्ण** - विकसक उत्पादकता आणि अनुभवासाठी ऑप्टिमाइझेड

### **AZD + Microsoft Foundry: AI तैनातीसाठी परिपूर्ण**

**AI सोल्यूशन्ससाठी AZD का?** AZD एआय विकासकांसमोर असलेले प्रमुख आव्हाने सोडवतो:

- **AI-तयार टेम्पलेट्स** - Microsoft Foundry मॉडेल्स, Azure AI सेवा, आणि ML वर्कलोडसाठी पूर्व-संचालित टेम्पलेट्स
- **सुरक्षित AI तैनाती** - AI सेवा, API कीस, आणि मॉडेल एन्डपॉइंटसाठी अंगभूत सुरक्षा नमुने  
- **उत्पादन AI नमुने** - प्रमाणात वाढवता येणाऱ्या, खर्च-प्रभावी AI अनुप्रयोगांसाठी सर्वोत्तम सराव
- **एंड-टू-एंड AI कार्यप्रवाह** - मॉडेल विकासापासून उत्पादन तैनातीपर्यंत योग्य मॉनिटरिंगसह
- **खर्च ऑप्टिमायझेशन** - AI वर्कलोडसाठी स्मार्ट संसाधन वाटप आणि स्केलिंग धोरणे
- **Microsoft Foundry एकत्रीकरण** - Microsoft Foundry मॉडेल कॅटलॉग आणि एन्डपॉइंटशी सुलभ कनेक्शन

---

## 🎯 टेम्पलेट्स आणि उदाहरणे लायब्ररी

### वैशिष्ट्यीकृत: Microsoft Foundry टेम्पलेट्स
**AI अनुप्रयोग तैनात करत असल्यास येथे प्रारंभ करा!**

> **टीप:** हे टेम्पलेट विविध AI नमुने दाखवतात. काही बाह्य Azure सॅम्पल्स आहेत, काही स्थानिक अंमलबजावणी आहेत.

| टेम्पलेट | प्रकरण | कठीणपणा | सेवा | प्रकार |
|----------|---------|------------|---------|-------|
| [**AI चॅटसह प्रारंभ करा**](https://github.com/Azure-Samples/get-started-with-ai-chat) | प्रकरण २ | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | बाह्य |
| [**AI एजंटसह प्रारंभ करा**](https://github.com/Azure-Samples/get-started-with-ai-agents) | प्रकरण २ | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| बाह्य |
| [**Azure Search + OpenAI डेमो**](https://github.com/Azure-Samples/azure-search-openai-demo) | प्रकरण २ | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | बाह्य |
| [**OpenAI Chat App क्विकस्टार्ट**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | प्रकरण २ | ⭐ | AzureOpenAI + Container Apps + Application Insights | बाह्य |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | प्रकरण ५ | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | बाह्य |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | प्रकरण ८ | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | बाह्य |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | प्रकरण ५ | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **स्थानिक** |

### वैशिष्ट्यीकृत: संपूर्ण शिकण्याचे परिदृश्य
**प्रकरणांशी नकाशा केलेले उत्पादन-तयार अनुप्रयोग टेम्पलेट्स**

| टेम्पलेट | शिकण्याचे प्रकरण | कठीणपणा | प्रमुख शिक्षण |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | प्रकरण २ | ⭐ | मूलभूत AI तैनाती नमुने |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | प्रकरण २ | ⭐⭐ | Azure AI Search सह RAG अंमलबजावणी |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | प्रकरण ४ | ⭐⭐ | दस्तऐवज बुद्धिमत्ता एकत्रीकरण |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | प्रकरण ५ | ⭐⭐⭐ | एजंट फ्रेमवर्क आणि फंक्शन कॉलिंग |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | प्रकरण ८ | ⭐⭐⭐ | एंटरप्राइझ AI समन्वय |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | प्रकरण ५ | ⭐⭐⭐⭐ | ग्राहक आणि इन्व्हेंटरी एजंटसह मल्टी-एजंट आर्किटेक्चर |

### उदाहरण प्रकारानुसार शिकणे

> **📌 स्थानिक विरुद्ध बाह्य उदाहरणे:**  
> **स्थानिक उदाहरणे** (या रिपोमध्ये) = लगेच वापरण्यास तयार  
> **बाह्य उदाहरणे** (Azure सॅम्पल्स) = लिंक केलेल्या रिपो मधून क्लोन करा

#### स्थानिक उदाहरणे (तेवढे वापरण्यास तयार)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM टेम्पलेटसह पूर्ण उत्पादन-तयार अंमलबजावा
  - मल्टी-एजंट आर्किटेक्चर (ग्राहक + इन्व्हेंटरी एजंट)
  - व्यापक मॉनिटरिंग आणि मूल्यमापन
  - ARM टेम्पलेटमुळे एका क्लिकची तैनाती

#### स्थानिक उदाहरणे - कंटेनर अनुप्रयोग (प्रकरणे २-५)
**या रीपोमध्ये व्यापक कंटेनर तैनातीचे उदाहरणे:**
- [**कंटेनर अॅप उदाहरणे**](examples/container-app/README.md) - कंटेनरायझ केलेल्या तैनातीसाठी संपूर्ण मार्गदर्शक
  - [साधे Flask API](../../examples/container-app/simple-flask-api) - स्केल-टू-झीरोसह मूलभूत REST API
  - [मायक्रोसर्व्हिस आर्किटेक्चर](../../examples/container-app/microservices) - उत्पादनासाठी तयार मल्टी-सर्व्हिस तैनाती
  - क्विक स्टार्ट, प्रॉडक्शन, आणि प्रगत तैनाती नमुने
  - मॉनिटरिंग, सुरक्षा, आणि खर्च ऑप्टिमायझेशन मार्गदर्शन

#### बाह्य उदाहरणे - सोप्या ॲप्लिकेशन्स (धडा 1-2)
**प्रारंभ करण्यासाठी हे Azure Samples रिपॉझिटरीज क्लोन करा:**
- [साधे वेब अॅप - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - मूलभूत तैनात नमुने
- [स्टॅटिक वेबसाईट - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - स्थिर सामग्री तैनात करणे
- [कंटेनर अॅप - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API तैनात करणे

#### बाह्य उदाहरणे - डेटाबेस एकत्रीकरण (धडा 3-4)  
- [डेटाबेस अॅप - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - डेटाबेस कनेक्टिव्हिटी नमुने
- [फंक्शन्स + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - सर्व्हरलेस डेटा वर्कफ्लो

#### बाह्य उदाहरणे - प्रगत नमुने (धडा 4-8)
- [Java मायक्रोसर्व्हिसेज](https://github.com/Azure-Samples/java-microservices-aca-lab) - मल्टी-सर्व्हिस आर्किटेक्चर
- [कंटेनर अॅप्स जॉब्स](https://github.com/Azure-Samples/container-apps-jobs) - बॅकग्राऊंड प्रक्रिया  
- [एंटरप्राइज ML पाईपलाइन](https://github.com/Azure-Samples/mlops-v2) - उत्पादनासाठी तयार ML नमुने

### बाह्य टेम्पलेट संग्रह
- [**अधिकृत AZD टेम्पलेट गॅलरी**](https://azure.github.io/awesome-azd/) - अधिकृत आणि समुदायाचे निवडक टेम्पलेट संग्रह
- [**Azure Developer CLI टेम्पलेट्स**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn टेम्पलेट दस्तऐवज
- [**उदाहरण डिरेक्टरी**](examples/README.md) - सविस्तर स्पष्टीकरणांसह स्थानिक शिक्षण उदाहरणे

---

## 📚 शिक्षण संसाधने आणि संदर्भ

### जलद संदर्भ
- [**कमांड चिट शीट**](resources/cheat-sheet.md) - प्राधान्याने अध्यायानुसार azd कमांड्स
- [**शब्दसंग्रह**](resources/glossary.md) - Azure आणि azd शब्दकोश  
- [**वारंवार विचारले जाणारे प्रश्न**](resources/faq.md) - शिकण्याच्या अध्यायानुसार सामान्य प्रश्न
- [**अभ्यास मार्गदर्शक**](resources/study-guide.md) - सर्वसमावेशक व्यावहारिक सराव

### प्रत्यक्ष वर्कशॉप्स
- [**AI वर्कशॉप लॅब**](docs/chapter-02-ai-development/ai-workshop-lab.md) - तुमची AI सोल्यूशन्स AZD-तैनात करण्यायोग्य करा (2-3 तास)
- [**इंटरॅक्टिव्ह वर्कशॉप**](workshop/README.md) - MkDocs आणि GitHub Codespaces सह 8-मॉड्यूल मार्गदर्शित व्यायाम
  - अनुसरण: परिचय → निवड → पडताळणी → विघटन → कॉन्फिगरेशन → सानुकूलन → तुटवडा → समारोप

### बाह्य शिक्षण संसाधने
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर सेंटर](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure किंमत गणक](https://azure.microsoft.com/pricing/calculator/)
- [Azure स्टेटस](https://status.azure.com/)

### तुमच्या एडिटरसाठी AI एजंट कौशल्ये
- [**Microsoft Azure कौशल्ये skills.sh वर**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, तैनाती, निदान, खर्च ऑप्टिमायझेशन, आणि अधिकासाठी 37 मुक्त एजंट कौशल्ये. GitHub Copilot, Cursor, Claude Code किंवा कुठल्याही समर्थित एजंटमध्ये स्थापित करा:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 जलद समस्या निवारण मार्गदर्शक

**सामान्य समस्या जे नवशिक्यांना भेडसावतात आणि तात्काळ उपाय:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# प्रथम AZD स्थापित करा
# विंडोज (पॉवरशेल):
winget install microsoft.azd

# मॅकओएस:
brew tap azure/azd && brew install azd

# लिनक्स:
curl -fsSL https://aka.ms/install-azd.sh | bash

# स्थापना तपासा
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

# AZD पर्यावरणासाठी सेट करा
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

# किंवा विकासात लहान SKU वापरा
# infra/main.parameters.json संपादित करा:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" अर्ध्यावर अयशस्वी होणे</strong></summary>

```bash
# पर्याय 1: साफ करा आणि पुन्हा प्रयत्न करा
azd down --force --purge
azd up

# पर्याय 2: फक्त पायाभूत सुविधा दुरुस्त करा
azd provision

# पर्याय 3: सविस्तर स्थिती तपासा
azd show

# पर्याय 4: Azure Monitor मध्ये लॉग तपासा
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" किंवा "Token expired"</strong></summary>

```bash
# AZD साठी पुन्हा प्रमाणीकरण करा
azd auth logout
azd auth login

# ऐच्छिक: जर आपण az कमांड्स चालवत असाल तर Azure CLI देखील रिफ्रेश करा
az logout
az login

# प्रमाणीकरणाची पुष्टी करा
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" किंवा नावांमध्ये संघर्ष</strong></summary>

```bash
# AZD अनन्य नावे तयार करते, परंतु जर संघर्ष झाला:
azd down --force --purge

# तर नवीन वातावरणासह पुन्हा प्रयत्न करा
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ टेम्पलेट तैनात करणे खूप वेळ घेत आहे</strong></summary>

**सामान्य प्रतीक्षा वेळा:**
- साधे वेब अॅप: 5-10 मिनिटे
- डेटाबेससह अॅप: 10-15 मिनिटे
- AI ॲप्लिकेशन्स: 15-25 मिनिटे (OpenAI पुरवणी मंद आहे)

```bash
# प्रगती तपासा
azd show

# ३० मिनिटांहून अधिक अडकले असल्यास, Azure Portal तपासा:
azd monitor --overview
# अयशस्वी तैनाती शोधा
```
</details>

<details>
<summary><strong>❌ "Permission denied" किंवा "Forbidden"</strong></summary>

```bash
# आपली Azure भूमिका तपासा
az role assignment list --assignee $(az account show --query user.name -o tsv)

# आपल्याला किमान "Contributor" भूमिका आवश्यक आहे
# आपला Azure प्रशासक याची परवानगी देण्यास विचारा:
# - Contributor (संसाधनांसाठी)
# - User Access Administrator (भूमिका नियुक्तीसाठी)
```
</details>

<details>
<summary><strong>❌ तैनात केलेले अॅप्लिकेशन URL सापडत नाही</strong></summary>

```bash
# सर्व सेवा टोकांचे प्रदर्शन करा
azd show

# किंवा Azure पोर्टल उघडा
azd monitor

# विशिष्ट सेवा तपासा
azd env get-values
# *_URL चल शोधा
```
</details>

### 📚 पूर्ण समस्या निवारण संसाधने

- **सामान्य समस्या मार्गदर्शक:** [सविस्तर उपाय](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-संबंधित समस्या:** [AI समस्या निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **अवलोकन मार्गदर्शक:** [टप्प्याटप्प्याने त्रुटी शोधणे](docs/chapter-07-troubleshooting/debugging.md)
- **मदत मिळवा:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 कोर्स पूर्ण आणि प्रमाणपत्र

### प्रगतीचा मागोवा
प्रत्येक धड्याद्वारे तुमची शिकण्याची प्रगती मागोवा:

- [ ] **धडा 1**: बेस आणि क्विक स्टार्ट ✅
- [ ] **धडा 2**: AI-प्रथम विकास ✅  
- [ ] **धडा 3**: कॉन्फिगरेशन आणि प्रमाणीकरण ✅
- [ ] **धडा 4**: इन्फ्रास्ट्रक्चर एज कोड आणि तैनाती ✅
- [ ] **धडा 5**: मल्टी-एजंट AI सोल्यूशन्स ✅
- [ ] **धडा 6**: प्री-तैनाती पडताळणी आणि नियोजन ✅
- [ ] **धडा 7**: समस्या निवारण आणि डिबगिंग ✅
- [ ] **धडा 8**: उत्पादन आणि एंटरप्राइज नमुने ✅

### शिकण्याचे पुष्टीकरण
प्रत्येक धडा पूर्ण केल्यानंतर, तुमची माहिती तपासा:
1. **व्यावहारिक सराव**: धड्याचे प्रत्यक्ष तैनाती पूर्ण करा
2. **ज्ञान तपासणी**: तुमच्या धड्यासाठी FAQ विभाग पुनरावलोकन करा
3. **समुदाय चर्चा**: Azure Discord मध्ये तुमचा अनुभव सामायिक करा
4. **पुढील धडा**: पुढच्या कठीणतेच्या स्तरावर जा

### कोर्स पूर्ण केल्यानंतर फायदे
सर्व धडे पूर्ण केल्यानंतर, तुमच्याकडे असे गुण असतील:
- **उत्पादन अनुभव**: Azure वर प्रत्यक्ष AI ॲप्लिकेशन्स तैनात केली आहेत
- **व्यावसायिक कौशल्ये**: एंटरप्राइज-तयार तैनाती क्षमता  
- **समुदाय मान्यता**: Azure डेव्हलपर समुदायाचा सक्रिय सदस्य
- **करिअर प्रगती**: मागणीतील AZD आणि AI तैनात कौशल्य

---

## 🤝 समुदाय आणि समर्थन

### मदत आणि समर्थन मिळवा
- **तांत्रिक समस्या**: [बग्स अहवाल करा आणि फिचर्स विनंती करा](https://github.com/microsoft/azd-for-beginners/issues)
- **शिकण्याचे प्रश्न**: [Microsoft Azure Discord समुदाय](https://discord.gg/microsoft-azure) आणि [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-संबंधित मदत**: [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) मध्ये सामील व्हा
- **दस्तऐवज**: [अधिकृत Azure Developer CLI दस्तऐवज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord मधून समुदाय अंतर्दृष्टी

**#Azure चॅनेलमधील अलीकडील मतदान निकाल:**
- विकासकांपैकी **45%** AI वर्कलोडसाठी AZD वापरू इच्छितात
- **मुख्य आव्हाने**: मल्टी-सर्व्हिस तैनाती, क्रेडेन्शियल व्यवस्थापन, उत्पादन तयारी  
- **सर्वाधिक मागितलेले**: AI-विशिष्ट टेम्पलेट्स, समस्या निवारण मार्गदर्शक, सर्वोत्तम पद्धती

**आमच्या समुदायात सामील व्हा:**
- तुमचे AZD + AI अनुभव शेअर करा आणि मदत मिळवा
- नवीन AI टेम्पलेट्सचे लवकर प्रकाशन मिळवा
- AI तैनाती सर्वोत्तम पद्धतींमध्ये योगदान द्या
- भविष्यातील AI + AZD वैशिष्ट्य विकासावर प्रभाव टाका

### कोर्ससाठी योगदान
आम्ही योगदानाचे स्वागत करतो! कृपया आमचा [योगदान मार्गदर्शक](CONTRIBUTING.md) वाचा ज्यात:
- **सामग्री सुधारणा**: विद्यमान धडे आणि उदाहरणे सुधारित करा
- **नवीन उदाहरणे**: प्रत्यक्ष परिस्थिती आणि टेम्पलेट जोडा  
- **भाषांतर**: बहुभाषिक समर्थन ठेवा
- **बग अहवाल**: अचूकता आणि स्पष्टता सुधारा
- **समुदाय मानके**: आमच्या सर्वसमावेशक समुदाय मार्गदर्शकांचे पालन करा

---

## 📄 कोर्स माहिती

### परवाना
हा प्रकल्प MIT परवान्याअंतर्गत परवानगी दिला आहे - तपशीलांसाठी [LICENSE](../../LICENSE) फाइल पहा.

### संबंधित Microsoft शिक्षण संसाधने

आमची टीम इतर सर्वसमावेशक शिक्षण कोर्सेस तयार करते:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / एजंट्स
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### जनरेटिव AI मालिक
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### कोर शिक्षण
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### कॉपिलॉट मालिका
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ कोर्स नेव्हिगेशन

**🚀 शिकायला तयार आहात?**

**सुरुवातीला**: [अध्याय 1: पाया आणि जलद प्रारंभ](#-chapter-1-foundation--quick-start)  
**एआय डेव्हलपर्स**: [अध्याय 2: एआय-प्रथम विकास](#-chapter-2-ai-first-development-recommended-for-ai-developers) येथे जा  
**अनुभवी डेव्हलपर्स**: [अध्याय 3: कॉन्फिगरेशन आणि प्रमाणीकरण](#️-chapter-3-configuration--authentication) पासून सुरू करा

**पुढील पावले**: [अध्याय 1 - AZD मूलतत्त्वे सुरू करा](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->