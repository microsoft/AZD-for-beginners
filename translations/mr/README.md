# AZD नवशिक्यांसाठी: एक रचित शिक्षण प्रवास

![AZD-for-beginners](../../translated_images/mr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### स्वयंचलित भाषांतर (नेहमी अद्यावत)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](./README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **स्थानिक क्लोन करणे प्राधान्य देते?**

> या संग्रहामध्ये ५०+ भाषा भाषांतरांचा समावेश आहे ज्यामुळे डाउनलोड आकार लक्षणीय वाढतो. भाषांतरांशिवाय क्लोन करण्यासाठी sparse checkout वापरा:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> यामुळे तुम्हाला कोर्स पूर्ण करण्यासाठी सर्व काही मिळते आणि डाउनलोड खूप जलद होते.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd) म्हणजे काय?

**Azure Developer CLI (azd)** ही एक विकसक-अनुकूल कमांड-लाइन साधन आहे जी अॅझ्युरवर अनुप्रयोग तैनात करणे सोपे करते. अनेक अॅझ्युर संसाधने मॅन्युअली तयार करण्याऐवजी, तुम्ही एका कमांडने संपूर्ण अनुप्रयोग तैनात करू शकता.

### `azd up` चा जादू

```bash
# हा एकच कमांड सर्व काही करतो:
# ✅ सर्व Azure संसाधने तयार करतो
# ✅ नेटवर्किंग आणि सुरक्षा कॉन्फिगर करतो
# ✅ तुमच्या अनुप्रयोगाचा कोड तयार करतो
# ✅ Azure वर तैनात करतो
# ✅ तुम्हाला कार्यरत URL देतो
azd up
```

**बस एवढेच!** कोणतेही Azure पोर्टलवर क्लिक करणे नाही, कोणतीही जटिल ARM टेम्प्लेट शिकणे नाही, कोणतीही मॅन्युअल कॉन्फिगरेशन नाही - फक्त Azure वर चालणारे अनुप्रयोग.

---

## ❓ Azure Developer CLI आणि Azure CLI मधील फरक काय?

नवशिक्यांनी सर्वाधिक विचारलेला प्रश्न. सोपा उत्तर खालीलप्रमाणे:

| वैशिष्ट्य | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **उद्देश** | स्वतंत्र Azure संसाधने व्यवस्थापित करणे | संपूर्ण अनुप्रयोग तैनात करणे |
| **दृष्टीकोन** | इन्फ्रास्ट्रक्चर-केंद्रित | अनुप्रयोग-केंद्रित |
| **उदाहरण** | `az webapp create --name myapp...` | `azd up` |
| **शिकण्याचा मार्ग** | Azure सेवांचा ज्ञान आवश्यक | फक्त तुमचा अनुप्रयोग माहित असावा |
| **उत्तम उपयोगकर्ता** | DevOps, इन्फ्रास्ट्रक्चर | विकसक, प्रोटोटायपिंग |

### सोपी उपमा

- **Azure CLI** ही घर बांधण्यासाठी सर्व साधने जसे की हातोडे, आरा, खिळे असलेले माल असण्यासारखी आहे. तुम्ही काहीही बांधू शकता, पण तुम्हाला बांधकाम माहित असले पाहिजे.
- **Azure Developer CLI** ही कंत्राटदार भाड्याने घेण्यासारखी आहे - तुम्ही काय हवंय ते सांगा, आणि ते बांधणी सांभाळतील.

### केव्हा कोणते वापरावे

| परिस्थिती | वापरा |
|----------|----------|
| "माझे वेब अॅप पटकन तैनात करायचे आहे" | `azd up` |
| "मला फक्त स्टोरेज खाते तयार करायचं आहे" | `az storage account create` |
| "मी संपूर्ण AI अनुप्रयोग तयार करत आहे" | `azd init --template azure-search-openai-demo` |
| "मला एखाद्या विशिष्ट Azure संसाधनाचे डीबग करायचे आहे" | `az resource show` |
| "मला उत्पादनासाठी तयार तैनाती काही मिनिटांत हवी आहे" | `azd up --environment production` |

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

शून्यातून सुरू करू नका! **Awesome AZD** ही रेडी-टू-डिप्लॉय टेम्प्लेट्सची समुदाय संकलन आहे:

| संसाधन | वर्णन |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | 200+ टेम्प्लेटसह एक क्लिक तैनाती पाहा |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | तुमचा स्वतःचा टेम्प्लेट समुदायास योगदान द्या |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | स्टार द्या आणि स्रोत एक्सप्लोर करा |

### Awesome AZD कडून लोकप्रिय AI टेम्प्लेट्स

```bash
# Azure OpenAI + AI Search सह RAG चॅट
azd init --template azure-search-openai-demo

# त्वरीत एआय चॅट अनुप्रयोग
azd init --template openai-chat-app-quickstart

# Foundry Agents सह एआय एजंट्स
azd init --template get-started-with-ai-agents
```

---

## 🎯 सुरुवात ३ सोप्या टप्प्यांत

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

# Azure वर तैनात करा (सर्वकाही तयार करते!)
azd up
```

**🎉 बस एवढे!** तुमचा अॅप आता Azure वर चालू आहे.

### साफसफाई (काळजी घ्या!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 हा कोर्स कसा वापरायचा

हा कोर्स **प्रगत शिक्षणासाठी** डिझाइन केला आहे - जिथून सोयीस्कर वाटेल तिथून सुरु करा आणि हळूहळू पुढे जा:

| तुमचा अनुभव | येथे सुरुवात करा |
|-----------------|------------|
| **Azure साठी नवीन** | [Chapter 1: Foundation](../..) |
| **Azure माहित आहे, AZD नवीन आहे** | [Chapter 1: Foundation](../..) |
| **AI अॅप तैनात करायचे आहेत** | [Chapter 2: AI-First Development](../..) |
| **प्रत्यक्ष अभ्यास करायचा आहे** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 तासांचे मार्गदर्शित प्रयोगशाळा |
| **उत्पादन नमुन्यांची गरज आहे** | [Chapter 8: Production & Enterprise](../..) |

### जलद सेटअप

1. **हा रेपॉजिटरी Fork करा**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **क्लोन करा**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **मदत मिळवा**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **स्थानिक क्लोन करणे प्राधान्य देते?**

> या संग्रहामध्ये ५०+ भाषा भाषांतरांचा समावेश आहे ज्यामुळे डाउनलोड आकार लक्षणीय वाढतो. भाषांतरांशिवाय क्लोन करण्यासाठी sparse checkout वापरा:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> यामुळे तुम्हाला कोर्स पूर्ण करण्यासाठी सर्व काही मिळते आणि डाउनलोड खूप जलद होते.


## कोर्स अवलोकन

संरचित अध्यायांद्वारे Azure Developer CLI (azd) मध्ये पारंगत व्हा जे प्रगत शिक्षणासाठी डिझाइन केलेले आहेत. **Microsoft Foundry समाकलनासह AI अनुप्रयोग तैनातीवर विशेष लक्ष.**

### आधुनिक विकसकांसाठी हा कोर्स का आवश्यक आहे

Microsoft Foundry Discord समुदायाच्या निरीक्षणांनुसार, **४५% विकसक AZD AI वर्कलोडसाठी वापरू इच्छितात** पण त्यांना अनेक अडचणी येतात:
- जटिल बहु-सेवा AI बनावट
- उत्पादन AI तैनाती सर्वोत्तम प्रथा  
- Azure AI सेवा समाकलन आणि कॉन्फिगरेशन
- AI वर्कलोडसाठी खर्चाचा अनुकूलन
- AI-विशिष्ट तैनाती समस्या समस्यानिवारण

### शिकण्याचे उद्दिष्टे

हा संरचित कोर्स पूर्ण करून तुम्ही:
- **AZD मूलभूत गोष्टी मास्टर करा**: मूलभूत संकल्पना, इन्स्टॉलेशन, आणि कॉन्फिगरेशन
- **AI अनुप्रयोग तैनात करा**: Microsoft Foundry सेवा वापरून AZD वापरा
- **Infrastructure as Code लागू करा**: Bicep टेम्प्लेट्सद्वारे Azure संसाधने व्यवस्थापित करा
- **तैनाती समस्यांचे निवारण करा**: सामान्य समस्या सोडवा आणि डीबग करा
- **उत्पादनासाठी ऑप्टिमाइझ करा**: सुरक्षा, विस्तार, निरीक्षण, आणि खर्च व्यवस्थापन
- **बहु-एजंट सोल्यूशन्स तयार करा**: जटिल AI आर्किटेक्चर्स तैनात करा

## 🗺️ कोर्स नकाशा: अध्यायानुसार जलद नेव्हिगेशन

प्रत्येक अध्यायात एका समर्पित README मध्ये शिकण्याची उद्दिष्टे, जलद सुरुवात, आणि सराव दिलेले आहेत:

| अध्याय | विषय | धडे | कालावधी | जटिलता |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | सुरुवात | [AZD मूलतत्त्वे](docs/chapter-01-foundation/azd-basics.md) &#124; [इन्स्टॉलेशन](docs/chapter-01-foundation/installation.md) &#124; [पहिला प्रकल्प](docs/chapter-01-foundation/first-project.md) | ३०-४५ मिनिटे | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-प्रथम अप्स | [Foundry समाकलन](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI एजंट्स](docs/chapter-02-ai-development/agents.md) &#124; [मॉडेल तैनाती](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [वर्कशॉप](docs/chapter-02-ai-development/ai-workshop-lab.md) | १-२ तास | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | प्रमाणीकरण आणि सुरक्षा | [कॉन्फिगरेशन](docs/chapter-03-configuration/configuration.md) &#124; [प्रमाणीकरण व सुरक्षा](docs/chapter-03-configuration/authsecurity.md) | ४५-६० मिनिटे | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC आणि तैनाती | [तैनाती मार्गदर्शिका](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [प्रोव्हिजनिंग](docs/chapter-04-infrastructure/provisioning.md) | १-१.५ तास | ⭐⭐⭐ |
| **[अध्या 5: मल्टी-एजेंट](docs/chapter-05-multi-agent/README.md)** | एआय एजंट सोल्यूशन्स | [रिटेल परिस्थिती](examples/retail-scenario.md) &#124; [समन्वय पॅटर्न्स](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 तास | ⭐⭐⭐⭐ |
| **[अध्या 6: पूर्व-विनियोजन](docs/chapter-06-pre-deployment/README.md)** | नियोजन व पडताळणी | [पूर्व-उड्डाण तपासण्या](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [क्षमता नियोजन](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU निवड](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [अॅप इन्साइट्स](docs/chapter-06-pre-deployment/application-insights.md) | 1 तास | ⭐⭐ |
| **[अध्या 7: समस्या निवारण](docs/chapter-07-troubleshooting/README.md)** | डीबग व दुरुस्ती | [सामान्य समस्या](docs/chapter-07-troubleshooting/common-issues.md) &#124; [डीबगिंग](docs/chapter-07-troubleshooting/debugging.md) &#124; [एआय समस्या](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 तास | ⭐⭐ |
| **[अध्या 8: उत्पादन](docs/chapter-08-production/README.md)** | एंटरप्राइज पॅटर्न्स | [उत्पादन सराव](docs/chapter-08-production/production-ai-practices.md) | 2-3 तास | ⭐⭐⭐⭐ |
| **[🎓 कार्यशाळा](workshop/README.md)** | हँड्स-ऑन लॅब | [परिचय](workshop/docs/instructions/0-Introduction.md) &#124; [निवड](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [पडताळणी](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [उपसंहार](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [सांधणी](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [सानुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [संपादन](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [समारोप](workshop/docs/instructions/7-Wrap-up.md) | 3-4 तास | ⭐⭐ |

**एकूण कोर्स कालावधी:** ~१०-१४ तास | **कौशल्य प्रगती:** प्रारंभिक → उत्पादन-तयार

---

## 📚 शिकण्यायोग्य अध्याय

*आपल्या अनुभव पातळी आणि उद्दिष्टांनुसार आपल्या शिकण्याचा मार्ग निवडा*

### 🚀 अध्याय 1: पाया व जलद प्रारंभ
**पूर्वअट**: Azure सदस्यत्व, मूलभूत कमांड लाइन ज्ञान  
**कालावधी**: ३०-४५ मिनिटे  
**सोपेपणा**: ⭐

#### तुमचं शिकणं काय असेल
- Azure Developer CLI मूलभूत समज
- AZD तुमच्या प्लॅटफॉर्मवर स्थापित करणे
- तुमचं पहिले यशस्वी विनियोजन

#### शिकण्याच्या साधनांचा आढावा
- **🎯 इथून सुरुवात करा**: [Azure Developer CLI म्हणजे काय?](../..)
- **📖 सिद्धांत**: [AZD मुलभूत](docs/chapter-01-foundation/azd-basics.md) - मुख्य संकल्पना व शब्दावली
- **⚙️ सेटअप**: [इंस्टॉलेशन व सेटअप](docs/chapter-01-foundation/installation.md) - प्लॅटफॉर्म विशिष्ट मार्गदर्शक
- **🛠️ हँड्स-ऑन**: [तुमचा पहिला प्रोजेक्ट](docs/chapter-01-foundation/first-project.md) - क्रमाने ट्युटोरियल
- **📋 जलद संदर्भ**: [कमांड चीट शीट](resources/cheat-sheet.md)

#### व्यावहारिक सराव
```bash
# जलद स्थापना तपासणी
azd version

# आपली पहिली अर्ज तैनात करा
azd init --template todo-nodejs-mongo
azd up
```

**💡 अध्याय परिणाम:** AZD वापरून Azure वर एक सोपा वेब अॅप यशस्वीपणे तैनात करा

**✅ यश पडताळणी:**
```bash
# अध्याय 1 पूर्ण केल्यावर, तुम्हाला खालील गोष्टी करता येतील:
azd version              # स्थापित केलेली आवृत्ती दर्शविते
azd init --template todo-nodejs-mongo  # प्रकल्प प्रारंभ करतो
azd up                  # Azure वर वितरण करतो
azd show                # चालू असलेल्या अॅपचा URL दर्शवितो
# अनुप्रयोग ब्राउझरमध्ये उघडतो आणि कार्य करतो
azd down --force --purge  # संसाधने स्वच्छ करतो
```

**📊 वेळ गुंतवणूक:** ३०-४५ मिनिटे  
**📈 कौशल्य पातळी नंतर:** स्वयंपूर्णपणे मूलभूत अॅप्लिकेशन्स तैनात करू शकतो

**✅ यश पडताळणी:**
```bash
# अध्याय 1 पूर्ण केल्यावर, आपण सक्षम असावे:
azd version              # स्थापित केलेली आवृत्ती दर्शविते
azd init --template todo-nodejs-mongo  # प्रकल्प सुरू करते
azd up                  # Azure वर तैनात करते
azd show                # चालू असलेल्या अॅपचा URL दर्शविते
# अर्ज ब्राउझरमध्ये उघडतो आणि कार्य करतो
azd down --force --purge  # संसाधने साफ करतो
```

**📊 वेळ गुंतवणूक:** ३०-४५ मिनिटे  
**📈 कौशल्य पातळी नंतर:** स्वयंपूर्णपणे मूलभूत अॅप्लिकेशन्स तैनात करू शकतो

---

### 🤖 अध्याय 2: एआय-प्रथम विकास (एआय विकसकांसाठी शिफारस)
**पूर्वअट**: अध्याय 1 पूर्ण  
**कालावधी**: 1-2 तास  
**सोपेपणा**: ⭐⭐

#### तुमचं शिकणं काय असेल
- Microsoft Foundry ची AZD सह एकत्रणी
- एआय-चालित अॅप्लिकेशन्स तैनात करणे
- एआय सेवा संरचनांचा समज

#### शिकण्याच्या साधनांचा आढावा
- **🎯 इथून सुरुवात करा**: [Microsoft Foundry एकत्रणी](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 एआय एजंट्स**: [एआय एजंट मार्गदर्शक](docs/chapter-02-ai-development/agents.md) - AZD सह बुद्धिमान एजंट्स तैनात करा
- **📖 पॅटर्न्स**: [एआय मॉडेल तैनाती](docs/chapter-02-ai-development/ai-model-deployment.md) - एआय मॉडेल्स तैनात व व्यवस्थापित करा
- **🛠️ कार्यशाळा**: [एआय कार्यशाळा लॅब](docs/chapter-02-ai-development/ai-workshop-lab.md) - तुमच्या एआय सोल्यूशन्सना AZD-तयार बनवा
- **🎥 संवादात्मक मार्गदर्शक**: [कार्यशाळा सामग्री](workshop/README.md) - ब्राउझर-आधारित शिक्षण MkDocs * DevContainer वातावरणासह
- **📋 टेम्प्लेट्स**: [Microsoft Foundry टेम्प्लेट्स](../..)
- **📝 उदाहरणे**: [AZD तैनाती उदाहरणे](examples/README.md)

#### व्यावहारिक सराव
```bash
# आपल्या पहिल्या एआय अॅप्लिकेशनची तैनात करा
azd init --template azure-search-openai-demo
azd up

# अतिरिक्त एआय टेम्पलेट्स वापरून पहा
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 अध्याय परिणाम:** RAG क्षमता असलेले एआय-चालित चॅट अॅप तैनात करा व संरचीत करा

**✅ यश पडताळणी:**
```bash
# अध्याय 2 नंतर, तुम्ही सक्षम असाल:
azd init --template azure-search-openai-demo
azd up
# AI चॅट इंटरफेसची चाचणी करा
# प्रश्न विचारा आणि स्रोतांसह AI-चालित उत्तरे मिळवा
# शोध एकत्रीकरण कार्यशील आहे की नाही तपासा
azd monitor  # Application Insights मध्ये टेलिमेट्री दर्शविली जाते की नाही तपासा
azd down --force --purge
```

**📊 वेळ गुंतवणूक:** 1-2 तास  
**📈 कौशल्य पातळी नंतर:** उत्पादन-तयार एआय अॅप्लिकेशन्स तैनात व संरचीत करू शकतो  
**💰 खर्च जाणीव:** $८०-१५०/महिना विकास खर्च, $३००-३५००/महिना उत्पादन खर्च समजून घ्या

#### 💰 एआय तैनातीसाठी खर्च विचार

**विकास वातावरण (अंदाजे $८०-१५०/महिना):**
- Azure OpenAI (वापरानुसार पेमेंट): $०-५०/महिना (टोकन वापरावर आधारित)
- एआय सर्च (मूलभूत स्तर): $७५/महिना
- कंटेनर अॅप्स (कंजम्प्शन): $०-२०/महिना
- स्टोरेज (स्टँडर्ड): $१-५/महिना

**उत्पादन वातावरण (अंदाजे $३००-३५००+/महिना):**
- Azure OpenAI (स्थिरतेसाठी PTU): $३०००+/महिना किंवा उच्च वापरासह पे-ऐज-गो
- एआय सर्च (स्टँडर्ड स्तर): $२५०/महिना
- कंटेनर अॅप्स (समर्पित): $५०-१००/महिना
- अॅप्लिकेशन इन्साइट्स: $५-५०/महिना
- स्टोरेज (प्रीमियम): $१०-५०/महिना

**💡 खर्च बचत टिप्स:**
- शिकण्यासाठी **मुक्त स्तर** Azure OpenAI वापरा (५०,००० टोकन्स/महिना समाविष्ट)
- सक्रिय विकास न करताना `azd down` चालवा, संसाधने मुक्त करा
- सुरुवातीला वापरानुसार बिलिंग करा, उत्पादनासाठी PTU मध्ये सुधारा
- तैनातीपूर्वी खर्च अंदाजण्यासाठी `azd provision --preview` वापरा
- ऑटो-स्केलिंग सक्षम करा: केवळ प्रत्यक्ष वापरासाठी पैसे द्या

**खर्च नियंत्रण:**
```bash
# अंदाजित मासिक खर्च तपासा
azd provision --preview

# Azure पोर्टलमध्ये वास्तविक खर्चांचे निरीक्षण करा
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ अध्याय 3: संरचना व प्रमाणीकरण
**पूर्वअट**: अध्याय 1 पूर्ण  
**कालावधी**: ४५-६० मिनिटे  
**सोपेपणा**: ⭐⭐

#### तुमचं शिकणं काय असेल
- वातावरण संरचना व व्यवस्थापन
- प्रमाणीकरण व सुरक्षा सर्वोत्तम पद्धती
- संसाधन नावं व संघटना

#### शिकण्याच्या साधनांचा आढावा
- **📖 संरचना**: [संरचना मार्गदर्शक](docs/chapter-03-configuration/configuration.md) - वातावरण सेटअप
- **🔐 सुरक्षा**: [प्रमाणीकरण पॅटर्न्स व व्यवस्थापित ओळख](docs/chapter-03-configuration/authsecurity.md) - प्रमाणीकरण पॅटर्न्स
- **📝 उदाहरणे**: [डेटाबेस अॅप्लिकेशन उदाहरण](examples/database-app/README.md) - AZD डेटाबेस उदाहरणे

#### व्यावहारिक सराव
- अनेक वातावरण (डेव्ह, स्टेजिंग, प्रॉडक्शन) संरचित करा
- व्यवस्थापित ओळख प्रमाणीकरण सेट करा
- वातावरण-विशिष्ट संरचना अंमलात आणा

**💡 अध्याय परिणाम:** योग्य प्रमाणीकरण व सुरक्षेसह अनेक वातावरणे व्यवस्थापित करा

---

### 🏗️ अध्याय 4: इन्फ्रास्ट्रक्चर कोड म्हणून व तैनाती
**पूर्वअट**: अध्याय 1-3 पूर्ण  
**कालावधी**: १-१.५ तास  
**सोपेपणा**: ⭐⭐⭐

#### तुमचं शिकणं काय असेल
- प्रगत तैनाती पॅटर्न्स
- Bicep सह इन्फ्रास्ट्रक्चर कोड
- संसाधन पुरवठा धोरणे

#### शिकण्याच्या साधनांचा आढावा
- **📖 तैनात मार्गदर्शक**: [तैनात मार्गदर्शक](docs/chapter-04-infrastructure/deployment-guide.md) - संपूर्ण वर्कफ्लोज
- **🏗️ संसाधन पुरवठा**: [संसाधने पुरवठा](docs/chapter-04-infrastructure/provisioning.md) - Azure संसाधन व्यवस्थापन
- **📝 उदाहरणे**: [कंटेनर अॅप उदाहरण](../../examples/container-app) - कंटेनराइज्ड तैनाती

#### व्यावहारिक सराव
- सानुकूल Bicep टेम्प्लेट तयार करा
- बहु-सेवा अॅप्लिकेशन्स तैनात करा
- ब्लू-ग्रीन तैनाती धोरणे अंमलात आणा

**💡 अध्याय परिणाम:** सानुकूल इन्फ्रास्ट्रक्चर टेम्प्लेट्स वापरून जटिल बहु-सेवा अॅप्लिकेशन्स तैनात करा

---

### 🎯 अध्याय 5: मल्टी-एजेंट एआय सोल्यूशन्स (प्रगत)
**पूर्वअट**: अध्याय 1-2 पूर्ण  
**कालावधी**: 2-3 तास  
**सोपेपणा**: ⭐⭐⭐⭐

#### तुमचं शिकणं काय असेल
- मल्टी-एजेंट आर्किटेक्चर पॅटर्न्स
- एजंट संघटन व समन्वय
- उत्पादन-तयार एआय तैनाती

#### शिकण्याच्या साधनांचा आढावा
- **🤖 वैशिष्ट्यीकृत प्रोजेक्ट**: [रिटेल मल्टी-एजेंट सोल्यूशन](examples/retail-scenario.md) - संपूर्ण अंमलबजावणी
- **🛠️ ARM टेम्प्लेट्स**: [ARM टेम्प्लेट पॅकेज](../../examples/retail-multiagent-arm-template) - एका क्लिकमध्ये तैनाती
- **📖 आर्किटेक्चर**: [मल्टी-एजेंट समन्वय पॅटर्न्स](docs/chapter-06-pre-deployment/coordination-patterns.md) - पॅटर्न्स

#### व्यावहारिक सराव
```bash
# संपूर्ण रिटेल मल्टी-एजंट सोल्यूशन तैनात करा
cd examples/retail-multiagent-arm-template
./deploy.sh

# एजंट कॉन्फिगरेशन शोधा
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 अध्याय परिणाम:** ग्राहक व स्टॉक एजंटसह उत्पादन-तयार मल्टी-एजेंट एआय सोल्यूशन तैनात व व्यवस्थापित करा

---

### 🔍 अध्याय 6: पूर्व-विनियोजन पडताळणी व नियोजन
**पूर्वअट**: अध्याय 4 पूर्ण  
**कालावधी**: 1 तास  
**सोपेपणा**: ⭐⭐

#### तुमचं शिकणं काय असेल
- क्षमता नियोजन व संसाधन पडताळणी
- SKU निवडीचे धोरणे
- पूर्व-उड्डाण तपासण्या व स्वयंचलन

#### शिकण्याच्या साधनांचा आढावा
- **📊 नियोजन**: [क्षमता नियोजन](docs/chapter-06-pre-deployment/capacity-planning.md) - संसाधन पडताळणी
- **💰 निवड**: [SKU निवड](docs/chapter-06-pre-deployment/sku-selection.md) - खर्च-प्रभावी निवडी
- **✅ पडताळणी**: [पूर्व-उड्डाण तपासण्या](docs/chapter-06-pre-deployment/preflight-checks.md) - स्वयंचलित स्क्रिप्ट्स

#### व्यावहारिक सराव
- क्षमता पडताळणी स्क्रिप्ट्स चालवा
- खर्चासाठी SKU निवडींची अनुकूलता करा
- स्वयंचलित पूर्व-विनियोजन तपासण्या लागू करा

**💡 अध्याय परिणाम:** विनियोजनापूर्वी पडताळणी व अनुकूलन करा

---

### 🚨 अध्याय 7: समस्या निवारण व डीबगिंग
**पूर्वअट**: कोणताही विनियोजन अध्याय पूर्ण  
**कालावधी**: 1-1.5 तास  
**सोपेपणा**: ⭐⭐

#### तुमचं शिकणं काय असेल
- प्रणालीगत डीबगिंग पद्धती
- सामान्य समस्या व उपाय
- एआय-विशिष्ट समस्या निवारण

#### शिकण्याच्या साधनांचा आढावा
- **🔧 सामान्य समस्या**: [सामान्य समस्या](docs/chapter-07-troubleshooting/common-issues.md) - FAQ व समाधान
- **🕵️ डीबगिंग**: [डीबगिंग मार्गदर्शक](docs/chapter-07-troubleshooting/debugging.md) - पायरी-पायरीने धोरणे
- **🤖 एआय समस्या**: [एआय-विशिष्ट समस्या निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - एआय सेवा समस्या

#### व्यावहारिक सराव
- विनियोजन अयशस्वीता निदान करा
- प्रमाणीकरण समस्या सोडवा
- एआय सेवा कनेक्टिव्हिटी डीबग करा

**💡 अध्याय परिणाम:** सामान्य विनियोजन समस्या स्वतंत्रपणे निदान व निराकरण करा

---

### 🏢 अध्याय 8: उत्पादन व एंटरप्राइज पॅटर्न्स
**पूर्वअट**: अध्याय 1-4 पूर्ण  
**कालावधी**: 2-3 तास  
**सोपेपणा**: ⭐⭐⭐⭐

#### तुमचं शिकणं काय असेल
- उत्पादन तैनाती धोरणे
- एंटरप्राइज सुरक्षा पॅटर्न्स
- मॉनिटरिंग व खर्च अनुकूलन

#### शिकण्याच्या साधनांचा आढावा
- **🏭 उत्पादन**: [उत्पादन एआय सर्वोत्तम सराव](docs/chapter-08-production/production-ai-practices.md) - एंटरप्राइज पॅटर्न्स
- **📝 उदाहरणे**: [मायक्रोसर्व्हिसेस उदाहरण](../../examples/microservices) - जटिल आर्किटेक्चर्स
- **📊 मॉनिटरिंग**: [अॅप्लिकेशन इन्साइट्स एकत्रणी](docs/chapter-06-pre-deployment/application-insights.md) - मॉनिटरिंग

#### व्यावहारिक सराव
- एंटरप्राइज सुरक्षा पॅटर्न्स अंमलात आणा
- व्यापक मॉनिटरिंग सेट करा
- योग्य शासन सह उत्पादनात तैनात करा

**💡 अध्याय परिणाम:** पूर्ण उत्पादन क्षमतांसह एंटरप्राइज-तयार अॅप्लिकेशन्स तैनात करा

---

## 🎓 कार्यशाळा सारांश: हँड्स-ऑन शिकण्याचा अनुभव

> **⚠️ कार्यशाळा स्थिती: सक्रिय विकास**  
> कार्यशाळेच्या सामग्रीवर सध्या विकास व सुधारणा केली जात आहे. मूलभूत मॉड्युल्स कार्यरत आहेत, परंतु काही प्रगत विभाग अपूर्ण आहेत. आम्ही सर्व सामग्री पूर्ण करण्यासाठी सक्रियपणे काम करत आहोत. [प्रगती पाहा →](workshop/README.md)

### संवादात्मक कार्यशाळा सामग्री  
**ब्राउझर-आधारित साधने व मार्गदर्शित व्यायामांसह व्यापक हँड्स-ऑन शिक्षण**
आमची कार्यशाळेची सामग्री वरील अध्याय-आधारित अभ्यासक्रमास पूरक असलेली संरचित, संवादात्मक शिक्षण अनुभव प्रदान करते. कार्यशाळा स्व-गतीने शिकण्यासाठी आणि प्रशिक्षक-नेतृत्वाखालील सत्रांसाठी डिझाइन केली गेली आहे.

#### 🛠️ कार्यशाळेची वैशिष्ट्ये
- **ब्राउझर-आधारित इंटरफेस**: शोध, कॉपी आणि थीम वैशिष्ट्यांसह संपूर्ण MkDocs-शक्तिप्रद कार्यशाळा
- **GitHub Codespaces एकत्रीकरण**: एक-क्लिक विकास वातावरण सेटअप
- **संरचित शिक्षण मार्ग**: ८-मॉड्यूल मार्गदर्शित सराव (एकूण ३-४ तास)
- **प्रगत पद्धतशास्त्र**: परिचय → निवड → प्रमाणीकरण → विघटन → संरचना → सानुकूलन → समाप्ती → समारोप
- **संवादात्मक DevContainer वातावरण**: पूर्व-संचालित साधने आणि अवलंबित्वे

#### 📚 कार्यशाळा मॉड्यूल संरचना
कार्यशाळा एक **८-मॉड्यूल प्रगत पद्धतशास्त्र** अनुसरते जे आपल्याला शोधापासून तैनातीपर्यंत घेऊन जाते:

| मॉड्यूल | विषय | आपण काय कराल | कालावधी |
|--------|-------|---------------|----------|
| **0. परिचय** | कार्यशाळा आढावा | शिक्षण उद्दिष्टे, पूर्व-आवश्यकता, आणि कार्यशाळेची संरचना समजून घ्या | १५ मिनिटे |
| **1. निवड** | टेम्पलेट शोध | AZD टेम्पलेट्सचा शोध घ्या आणि आपल्या परिस्थितीकरिता योग्य AI टेम्पलेट निवडा | २० मिनिटे |
| **2. प्रमाणीकरण** | तैनात आणि सत्यापना | `azd up` सह टेम्पलेट तैनात करा आणि इन्फ्रास्ट्रक्चर काम करते याची खात्री करा | ३० मिनिटे |
| **3. विघटन** | संरचना समजून घ्या | GitHub Copilot वापरून टेम्पलेट आर्किटेक्चर, Bicep फाइल्स, आणि कोड संघटनेचा शोध घ्या | ३० मिनिटे |
| **4. संरचना** | azure.yaml सखोल अभ्यास | `azure.yaml` संरचना, लाइफसायकल हुक्स, आणि पर्यावरणीय चल समजून घ्या | ३० मिनिटे |
| **5. सानुकूलन** | आपले बनवा | AI शोध, ट्रेसिंग, मूल्यमापन सक्षम करा आणि आपल्या परिस्थितीकरिता सानुकूलित करा | ४५ मिनिटे |
| **6. समाप्ती** | साफसफाई | `azd down --purge` वापरून संसाधने सुरक्षितपणे डीप्रोव्हिजन करा | १५ मिनिटे |
| **7. समारोप** | पुढील पावले | कामगिरी, मुख्य संकल्पना पुनरावलोकन करा आणि आपल्या शिक्षण प्रवासाला पुढे चालू ठेवा | १५ मिनिटे |

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
# रेपॉझिटरीमध्ये "Code" → "Create codespace on main" क्लिक करा

# पर्याय 2: स्थानिक विकास
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md मधील सेटअप सूचनांचे पालन करा
```


#### 🎯 कार्यशाळेचे शिक्षण परिणाम  
कार्यशाळा पूर्ण केल्यावर, सहभागी:  
- **उत्पादन AI अनुप्रयोग तैनात करू शकतील**: Microsoft Foundry सेवा वापरून AZD वापरा  
- **मल्टी-एजंट आर्किटेक्चर्समध्ये प्रभुत्व मिळवा**: समन्वयित AI एजंट सोल्यूशन्स अंमलात आणा  
- **सुरक्षा सर्वोत्तम पद्धती अंमलात आणा**: प्रमाणीकरण आणि प्रवेश नियंत्रण संरचित करा  
- **स्केलसाठी ऑप्टिमाइझ करा**: खर्च-प्रभावी आणि कार्यक्षम तैनाती डिझाइन करा  
- **तैनातीतील अडचणी सोडवा**: सामान्य समस्या स्वतंत्रपणे निराकरण करा  

#### 📖 कार्यशाळा संसाधने  
- **🎥 संवादात्मक मार्गदर्शक**: [कार्यशाळा सामग्री](workshop/README.md) - ब्राउझर-आधारित शिक्षण वातावरण  
- **📋 मॉड्यूल-द्वारे-निर्देश**:  
  - [0. परिचय](workshop/docs/instructions/0-Introduction.md) - कार्यशाळा आढावा आणि उद्दिष्टे  
  - [1. निवड](workshop/docs/instructions/1-Select-AI-Template.md) - AI टेम्पलेट्स शोधा आणि निवडा  
  - [2. प्रमाणीकरण](workshop/docs/instructions/2-Validate-AI-Template.md) - टेम्पलेट तैनात करा आणि सत्यापित करा  
  - [3. विघटन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - टेम्पलेट आर्किटेक्चरचा अभ्यास करा  
  - [4. संरचना](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml चे प्रभुत्व मिळवा  
  - [5. सानुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) - आपल्या परिस्थितीसाठी सानुकूल करा  
  - [6. समाप्ती](workshop/docs/instructions/6-Teardown-Infrastructure.md) - संसाधने साफ करा  
  - [7. समारोप](workshop/docs/instructions/7-Wrap-up.md) - पुनरावलोकन आणि पुढच्या टप्प्यांबाबत  
- **🛠️ AI कार्यशाळा प्रयोगशाळा**: [AI कार्यशाळा प्रयोगशाळा](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-केंद्रित सराव  
- **💡 जलद प्रारंभ**: [कार्यशाळा सेटअप मार्गदर्शक](workshop/README.md#quick-start) - वातावरण संरचना  

**परिपूर्ण:** कॉर्पोरेट प्रशिक्षण, विद्यापीठ कोर्सेस, स्व-गतीने शिक्षण, आणि विकसक बूटकॅम्पसाठी.

---

## 📖 सखोल अभ्यास: AZD क्षमता

मूलतत्त्वांपुढे, AZD उत्पादन तैनातीसाठी सामर्थ्यशाली वैशिष्ट्ये प्रदान करते:

- **टेम्पलेट-आधारित तैनाती** - सामान्य अनुप्रयोग नमुन्यांसाठी पूर्व-निर्मित टेम्पलेट वापरा  
- **आधारभूत संरचना कोड म्हणून** - Bicep किंवा Terraform वापरून Azure संसाधने व्यवस्थापित करा  
- **एकत्रित वर्कफ्लोज** - अनुप्रयोगांची सहज तैनाती, व्यवस्थापन आणि निरीक्षण  
- **विकसक-मैत्रीपूर्ण** - विकासक उत्पादकता आणि अनुभवासाठी ऑप्टिमाइझ केलेले

### **AZD + Microsoft Foundry: AI तैनातीसाठी परिपूर्ण**

**AI सोल्यूशन्ससाठी AZD का?** AZD AI विकासकांना भेडसावणाऱ्या प्रमुख अडचणी सोडवते:

- **AI-तयार टेम्पलेट्स** - Azure OpenAI, Cognitive Services, आणि ML वर्कलोडसाठी पूर्व-संचालित टेम्पलेट्स  
- **सुरक्षित AI तैनाती** - AI सेवा, API कीज, आणि मॉडेल एंडपॉइंटसाठी अंगभूत सुरक्षा नमुने  
- **उत्पादन AI नमुने** - स्केलेबल, खर्च-कमी AI अनुप्रयोग तैनातीसाठी सर्वोत्तम पद्धती  
- **एंड-टू-एंड AI वर्कफ्लोज** - मॉडेल विकासापासून उत्पादन तैनातीपर्यंत योग्य निरीक्षणासह  
- **खर्च ऑप्टिमायझेशन** - AI वर्कलोडसाठी स्मार्ट संसाधन वाटप आणि स्केलिंग धोरणे  
- **Microsoft Foundry एकत्रीकरण** - Microsoft Foundry मॉडेल कॅटलॉग आणि एंडपॉइंटसह सलग कनेक्शन  

---

## 🎯 टेम्पलेट्स & उदाहरणे लायब्ररी

### वैशिष्ट्यीकृत: Microsoft Foundry टेम्पलेट्स  
**जर तुम्ही AI अनुप्रयोग तैनात करत असाल तर येथे प्रारंभ करा!**

> **टीप:** हे टेम्पलेट्स वेगवेगळ्या AI नमुना दाखवतात. काही बाह्य Azure सॅंपल्स आहेत, काही स्थानिक अंमलबजावणी आहेत.

| टेम्पलेट | अध्याय | गुंतागुंत | सेवा | प्रकार |
|----------|--------|-----------|-------|--------|
| [**AI चॅटसह प्रारंभ करा**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय २ | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | बाह्य |
| [**AI एजंट्ससह प्रारंभ करा**](https://github.com/Azure-Samples/get-started-with-ai-agents) | अध्याय २ | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| बाह्य |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय २ | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | बाह्य |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय २ | ⭐ | AzureOpenAI + Container Apps + Application Insights | बाह्य |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय ५ | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | बाह्य |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | अध्याय ८ | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | बाह्य |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | अध्याय ५ | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **स्थानिक** |

### वैशिष्ट्यीकृत: संपूर्ण शिक्षण संदर्भ  
**शिकण्याच्या अध्यायामध्ये नकाशित उत्पादन-तैयार अनुप्रयोग टेम्पलेट्स**

| टेम्पलेट | शिक्षण अध्याय | गुंतागुंत | प्रमुख शिक्षण |
|----------|----------------|-----------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय २ | ⭐ | मूलभूत AI तैनाती नमुने |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय २ | ⭐⭐ | Azure AI Search सह RAG अंमलबजावणी |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | अध्याय ४ | ⭐⭐ | दस्तऐवज बुद्धिमत्ता एकत्रीकरण |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय ५ | ⭐⭐⭐ | एजंट फ्रेमवर्क आणि फंक्शन कॉलिंग |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | अध्याय ८ | ⭐⭐⭐ | एंटरप्राइझ AI ऑर्केस्ट्रेशन |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | अध्याय ५ | ⭐⭐⭐⭐ | ग्राहक आणि इन्व्हेंटरी एजंटसह मल्टी-एजंट आर्किटेक्चर |

### उदाहरण प्रकारानुसार शिक्षण

> **📌 स्थानिक vs बाह्य उदाहरणे:**  
> **स्थानिक उदाहरणे** (या रिपॉझिटरीतील) = त्वरित वापरासाठी तयार  
> **बाह्य उदाहरणे** (Azure सॅंपल्स) = लिंक केलेल्या रिपॉझिटरीमधून क्लोन करा

#### स्थानिक उदाहरणे (तत्काळ वापरासाठी तयार)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM टेम्पलेटसह संपूर्ण उत्पादन-तयार अंमलबजावणी  
  - मल्टी-एजंट आर्किटेक्चर (ग्राहक + इन्व्हेंटरी एजंट)  
  - व्यापक निरीक्षण आणि मूल्यमापन  
  - ARM टेम्पलेटद्वारे एक-क्लिक तैनाती  

#### स्थानिक उदाहरणे - कंटेनर अनुप्रयोग (अध्याय २-५)
**या रिपॉझिटरीतील संपूर्ण कंटेनर तैनाती उदाहरणे:**  
- [**Container App Examples**](examples/container-app/README.md) - कंटेनरायझ्ड तैनात करण्यासाठी संपूर्ण मार्गदर्शक  
  - [सोपे Flask API](../../examples/container-app/simple-flask-api) - स्केल-टू-झीरोसह मूलभूत REST API  
  - [मायक्रोसर्व्हिस आर्किटेक्चर](../../examples/container-app/microservices) - उत्पादन-तयार बहुसेवा तैनाती  
  - जलद प्रारंभ, उत्पादन, आणि प्रगत तैनाती नमुने  
  - निरीक्षण, सुरक्षा, आणि खर्च ऑप्टिमायझेशन मार्गदर्शन  

#### बाह्य उदाहरणे - सोपी अनुप्रयोग (अध्याय १-२)
**सुरू करण्यासाठी हे Azure सॅंपल्स रिपॉझिटरी क्लोन करा:**  
- [सोपे वेब अॅप - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - मूलभूत तैनाती नमुने  
- [स्थिर वेबसाइट - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - स्थिर सामग्री तैनाती  
- [कंटेनर अॅप - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API तैनाती  

#### बाह्य उदाहरणे - डेटाबेस एकत्रीकरण (अध्याय ३-४)  
- [डेटाबेस अॅप - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - डेटाबेस कनेक्टिव्हिटी नमुने  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - सर्व्हरलेस डेटा वर्कफ्लो  

#### बाह्य उदाहरणे - प्रगत नमुने (अध्याय ४-८)
- [Java मायक्रोसर्व्हिसेस](https://github.com/Azure-Samples/java-microservices-aca-lab) - बहुसेवा आर्किटेक्चर्स  
- [कंटेनर अॅप्स जॉब्स](https://github.com/Azure-Samples/container-apps-jobs) - बॅकग्राउंड प्रक्रिया  
- [एंटरप्राइझ ML पाईपलाईन](https://github.com/Azure-Samples/mlops-v2) - उत्पादन-तयार ML नमुने  

### बाह्य टेम्पलेट संग्रह  
- [**अधिकृत AZD टेम्पलेट गॅलरी**](https://azure.github.io/awesome-azd/) - अधिकृत आणि समुदाय टेम्पलेट्सचा क्युरेटेड संग्रह  
- [**Azure Developer CLI टेम्पलेट्स**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn टेम्पलेट दस्तऐवज  
- [**उदाहरणे निर्देशिका**](examples/README.md) - स्थानिक शिक्षण उदाहरणे सविस्तर स्पष्टीकरणासह  

---

## 📚 शिक्षण संसाधने आणि संदर्भ

### जलद संदर्भ  
- [**कमांड चीट शीट**](resources/cheat-sheet.md) - अध्यायानुसार संघटित आवश्यक azd कमांड्स  
- [**शब्दावली**](resources/glossary.md) - Azure आणि azd टर्मिनॉलॉजी  
- [**FAQ**](resources/faq.md) - शिकण्याच्या अध्यायानुसार सामान्य प्रश्न  
- [**अभ्यास मार्गदर्शक**](resources/study-guide.md) - सर्वसमावेशक सराव 

### प्रत्यक्ष कार्यशाळा  
- [**AI कार्यशाळा प्रयोगशाळा**](docs/chapter-02-ai-development/ai-workshop-lab.md) - आपल्या AI सोल्यूशन्सना AZD तैनात करण्यायोग्य बनवा (२-३ तास)  
- [**संवादात्मक कार्यशाळा**](workshop/README.md) - MkDocs आणि GitHub Codespaces सह ८-मॉड्यूल मार्गदर्शित सराव  
  - अनुसरतं: परिचय → निवड → प्रमाणीकरण → विघटन → संरचना → सानुकूलन → समाप्ती → समारोप  

### बाह्य शिक्षण संसाधने  
- [Azure Developer CLI दस्तऐवज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure आर्किटेक्चर केंद्र](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure किंमत कॅल्क्युलेटर](https://azure.microsoft.com/pricing/calculator/)  
- [Azure स्थिती](https://status.azure.com/)  

---

## 🔧 जलद समस्या निवारण मार्गदर्शक

**नवशिक्यांना येणार्‍या सामान्य समस्या आणि त्वरित उपाय:**

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

# स्थापना तपासा
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" किंवा "Subscription not set"</strong></summary>

```bash
# उपलब्ध सदस्यता सूचीबद्ध करा
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
<summary><strong>❌ "azd up" मधोमध अयशस्वी</strong></summary>
```bash
# पर्याय 1: साफ करा आणि पुन्हा प्रयत्न करा
azd down --force --purge
azd up

# पर्याय 2: फक्त इन्फ्रास्ट्रक्चर दुरुस्त करा
azd provision

# पर्याय 3: तपशीलवार स्थिती तपासा
azd show

# पर्याय 4: Azure Monitor मध्ये लॉग्स तपासा
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "प्रमाणीकरण अयशस्वी" किंवा "टोकन कालबाह्य झाले"</strong></summary>

```bash
# पुन्हा प्रमाणीकरण करा
az logout
az login

azd auth logout
azd auth login

# प्रमाणीकरण सत्यापित करा
az account show
```
</details>

<details>
<summary><strong>❌ "संसाधन आधीच अस्तित्वात आहे" किंवा नावांतील संघर्ष</strong></summary>

```bash
# AZD अद्वितीय नावे तयार करतो, परंतु जर संघर्ष झाला:
azd down --force --purge

# मग नवीन वातावरणासह पुन्हा प्रयत्न करा
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ टेम्पलेट डिप्लॉयमेंट खूप वेळ घेत आहे</strong></summary>

**सामान्य थांबण्याच्या वेळा:**
- साधे वेब अ‍ॅप: ५-१० मिनिटे
- डेटाबेससह अ‍ॅप: १०-१५ मिनिटे
- AI अनुप्रयोग: १५-२५ मिनिटे (OpenAI प्रोव्हिजनिंग हळू आहे)

```bash
# प्रगती तपासा
azd show

# जर ३० मिनिटांहून जास्त अडकल्यास, Azure Portal तपासा:
azd monitor
# अयशस्वी तैनाती शोधा
```
</details>

<details>
<summary><strong>❌ "परवानगी नाकारली" किंवा "मनाई"</strong></summary>

```bash
# आपला Azure भूमिका तपासा
az role assignment list --assignee $(az account show --query user.name -o tsv)

# आपल्याला किमान "Contributor" भूमिका आवश्यक आहे
# आपला Azure प्रशासनाकडून मागणी करा:
# - Contributor (संसाधनांसाठी)
# - User Access Administrator (भूमिका नियुक्त्यांसाठी)
```
</details>

<details>
<summary><strong>❌ डिप्लॉय केलेल्या अनुप्रयोगाचा URL सापडत नाही</strong></summary>

```bash
# सर्व सेवा एंडपॉइंट दर्शवा
azd show

# किंवा Azure Portal उघडा
azd monitor

# विशिष्ट सेवा तपासा
azd env get-values
# *_URL व्हेरिएबल शोधा
```
</details>

### 📚 संपूर्ण समस्या निवारण संसाधने

- **सामान्य समस्या मार्गदर्शिका:** [तपशीलवार सोडवणूक](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-विशिष्ट समस्या:** [AI समस्या निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **डिबगिंग मार्गदर्शिका:** [टप्प्याटप्प्याने डिबगिंग](docs/chapter-07-troubleshooting/debugging.md)
- **मदत घ्या:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 कोर्स पूर्णता व प्रमाणपत्र

### प्रगती ट्रॅकिंग
प्रत्येक अध्यायाप्रमाणे तुमची शिकण्याची प्रगती ट्रॅक करा:

- [ ] **अध्याय १**: पाया आणि जलद प्रारंभ ✅
- [ ] **अध्याय २**: AI-प्रथम विकास ✅  
- [ ] **अध्याय ३**: कॉन्फिगरेशन आणि प्रमाणीकरण ✅
- [ ] **अध्याय ४**: इन्फ्रास्ट्रक्चर अ‍ॅज कोड आणि डिप्लॉयमेंट ✅
- [ ] **अध्याय ५**: बहु-एजंट AI सोल्यूशन्स ✅
- [ ] **अध्याय ६**: पूर्व-डिप्लॉयमेंट पडताळणी आणि नियोजन ✅
- [ ] **अध्याय ७**: समस्या निवारण व डिबगिंग ✅
- [ ] **अध्याय ८**: उत्पादन आणि एंटरप्राइज पॅटर्न्स ✅

### शिकण्याची पडताळणी
प्रत्येक अध्याय पूर्ण केल्यानंतर, तुमचे ज्ञान पडताळा:
1. **प्रॅक्टिकल व्यायाम**: त्या अध्यायाचा प्रत्यक्ष डिप्लॉयमेंट करा
2. **ज्ञान चाचणी**: तुमच्या अध्यायातील FAQ विभाग पाहा
3. **समुदाय चर्चा**: Azure Discord मध्ये तुमचा अनुभव शेअर करा
4. **पुढील अध्याय**: पुढील गुंतागुंतीच्या पातळीवर जा

### कोर्स पूर्णतेचे फायदे
सर्व अध्याय पूर्ण केल्यानंतर, तुम्हाला मिळेल:
- **उत्पादन अनुभव**: Azure वर वास्तविक AI अनुप्रयोग डिप्लॉय केलेले
- **व्यावसायिक कौशल्ये**: एंटरप्राइज-तयार डिप्लॉयमेंट क्षमता  
- **समुदाय मान्यता**: Azure डेव्हलपर समुदायाचा सक्रिय सदस्य
- **करिअर प्रगती**: मागणी असलेले AZD आणि AI डिप्लॉयमेंट तज्ञ

---

## 🤝 समुदाय आणि समर्थन

### मदत व समर्थन मिळवा
- **तांत्रिक समस्या**: [बग रिपोर्ट करा आणि वैशिष्ट्ये मागवा](https://github.com/microsoft/azd-for-beginners/issues)
- **शिकण्याचे प्रश्न**: [Microsoft Azure Discord समुदाय](https://discord.gg/microsoft-azure) आणि [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-विशिष्ट मदत**: या [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) मध्ये सहभागी व्हा
- **दस्तऐवज**: [अधिकृत Azure Developer CLI दस्तऐवज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord मधील समुदायाचे निरीक्षण

**#Azure चॅनेलमधील अलीकडील मतदान परिणाम:**
- **४५%** विकसकांना AI वर्कलोडसाठी AZD वापरायचे आहे
- **टॉप अडचणी**: बहु-सेवा डिप्लॉयमेंट, क्रेडेन्शियल व्यवस्थापन, उत्पादनासाठी तयारी  
- **सर्वाधिक मागणी**: AI-विशिष्ट टेम्पलेट्स, समस्या निवारण मार्गदर्शिका, सर्वोत्तम पद्धती

**आमच्या समुदायात सामील व्हा आणि:**
- तुमचा AZD + AI अनुभव शेअर करा आणि मदत मिळवा
- नवीन AI टेम्पलेट्सचे लवकर प्रिव्ह्यू पाहा
- AI डिप्लॉयमेंट सर्वोत्तम पद्धतींना योगदान द्या
- भविष्यातील AI + AZD वैशिष्ट्य विकासावर प्रभाव टाका

### कोर्समध्ये योगदान देणे
आम्ही योगदानांचे स्वागत करतो! कृपया आमचा [योगदान मार्गदर्शक](CONTRIBUTING.md) वाचा:
- **सामग्री सुधारणा**: विद्यमान अध्याय आणि उदाहरणे सुधारित करा
- **नवीन उदाहरणे**: वास्तविक विश्वातील परिस्थिती व टेम्पलेट जोडा  
- **भाषांतर**: बहुभाषिक समर्थन जपण्यासाठी मदत करा
- **बग अहवाल**: अचूकता आणि स्पष्टता सुधारित करा
- **समुदाय निकष**: आमच्या सर्वसमावेशक समुदाय मार्गदर्शकांचे पालन करा

---

## 📄 कोर्स माहिती

### परवाना
हा प्रकल्प MIT परवान्याअंतर्गत परवानाधारित आहे - अधिक माहिती साठी [LICENSE](../../LICENSE) फाइल पाहा.

### संबंधित Microsoft शिकण्याची संसाधने

आमची टीम अन्य सखोल शिकण्याचे कोर्स तयार करते:

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

## 🗺️ कोर्स मार्गदर्शक

**🚀 शिकायला तयार आहात?**

**सुरुवातीपासून शिकणारे**: सुरू करा [अध्याय १: पाया आणि जलद प्रारंभ](../..)  

**AI विकसक**: [अध्याय 2: AI-प्रथम विकास](../..) येथे थेट जा  
**अनुभवी विकसक**: [अध्याय 3: कॉन्फिगरेशन आणि प्रमाणीकरण](../..) पासून प्रारंभ करा

**पुढील पावले**: [अध्याय 1 सुरू करा - AZD बेसिक्स](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**सूचना**:
हे दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केलेले आहे. आम्ही अचूकतेसाठी प्रयत्नशील आहोत, तरी कृपया लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये चुका किंवा अचूकतेच्या त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीकरिता व्यावसायिक मानवी भाषांतर करण्याचा सल्ला दिला जातो. या भाषांतराच्या वापरामुळे झालेल्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थलागी आम्ही जबाबदार नाही आहोत.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->