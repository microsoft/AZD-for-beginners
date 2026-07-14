# AZD सुरु गर्नेहरूका लागि: एक संरचित सिकाइ यात्रा

![AZD-for-beginners](../../translated_images/ne/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### स्वचालित अनुवादहरू (सधैं अद्यावधिक)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](./README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **स्थानीय रूपमा क्लोन गर्न मन छ?**
>
> यो रिपोजिटरीमा ५०+ भाषा अनुवादहरू छन् जसले डाउनलोड साइजलाई धेरै बढाउँछ। अनुवादबिना क्लोन गर्न sparse checkout प्रयोग गर्नुहोस्:
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
> यसले तपाईंलाई सबै कुरा दिन्छ जुन तपाईंले कोर्स पूरा गर्न आवश्यक छ धेरै छिटो डाउनलोडको साथ।
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 आज azd मा के नयाँ छ

> 📌 यो कोर्स **`azd 1.27.1`** (जुलाई २०२६) विरुद्ध प्रमाणित छ। आफ्नो संस्करण जाँच गर्न `azd version` चलाउनुहोस्, र नयाँ संस्करण लिन `azd upgrade` गर्नुहोस्।

Azure Developer CLI ले पारम्परिक वेब एपहरू र APIs भन्दा अगाडि वृद्धि गरिसकेको छ। आज, azd Azure मा **कुनै पनि** एप्लिकेशन तैनाथ गर्ने एकल उपकरण हो—जसमा AI-संचालित एप्लिकेसनहरू र बुद्धिमान एजेन्टहरू छन्।

तपाईंका लागि यसको अर्थ:

- **AI एजेन्टहरू अब प्रथम श्रेणी azd workloads हुन्।** तपाईं पहिलेबाट परिचित `azd init` → `azd up` कार्यप्रवाह प्रयोग गरेर AI एजेन्ट प्रोजेक्टहरू सुरु, तैनाथ, र व्यवस्थापन गर्न सक्नुहुन्छ।
- **CLI बाट पूरा एजेन्ट जीवनचक्र।** `azure.ai.agents` एक्सटेन्सनले अब सम्पूर्ण यात्रा समेट्छ—`azd ai agent init` स्केफोल्ड गर्न, `azd ai agent invoke` परीक्षण गर्न (प्रतिक्रिया-समय आउटपुट सहित), `azd ai agent eval generate` र `azd ai agent optimize` गुणस्तर मापन र सुधार गर्न, र `azd ai agent delete` सफा गर्न।
- **थप AI निर्माण ब्लकहरू।** नयाँ पूर्वावलोकन एक्सटेन्सनहरू—`azure.ai.skills` र `azure.ai.connections`—ले पुन: प्रयोगयोग्य एजेन्ट सीपहरू र Foundry कनेक्शनहरू प्रत्यक्ष azd बाट व्यवस्थापन गर्न दिन्छ।
- **Microsoft Foundry एकीकरण** ले मोडेल तैनाथीकरण, एजेन्ट होस्टिङ, र AI सेवा कन्फिगरेसनलाई azd टेम्प्लेट इकोसिस्टममा सिधा ल्याउँछ।
- **दैनिक आधारभूत कार्यहरू सहज।** भर्खरका रिलिजहरूले `azd init` लाई पुन: चलाउन मिल्ने (idempotent) बनायो, `azd auth login` ले पुराना टोकनहरू स्वचालित रूपमा हटाउँछ, र `azd tool` को पहिलो चलाउने सेटअप पम्प थप्यो।
- **मूल कार्यप्रवाह बदलेन।** तपाईंले टुडो एप, माइक्रोसर्भिस, वा बहु-एजेन्ट AI समाधान तैनाथ गरिरहनु भएको भए पनि कमाण्डहरू उस्तै छन्।

> **Aspire प्रयोगकर्ताहरूका लागि नोट:** माईक्रोसफ्टले अब उत्पादनलाई केवल **Aspire** (पहिले ".NET Aspire") भनी सम्बोधन गर्छ। azd को Aspire समर्थन अपरिवर्तित छ—नाम मात्र अपडेट गरिएको हो।

यदि तपाईंले पहिले azd प्रयोग गर्नुभएको छ भने, AI समर्थन स्वाभाविक विस्तार हो—not पृथक उपकरण वा उन्नत ट्र्याक। नयाँ सुरुवात गर्नेले एउटै कार्यप्रवाह सिक्नेछन् जुन सबैमा काम गर्छ।

---

## 🚀 Azure Developer CLI (azd) के हो?

**Azure Developer CLI (azd)** एक विकासकर्तामैत्री कमाण्ड-लाइन उपकरण हो जसले Azure मा एप्लिकेसनहरू तैनाथ गर्न सजिलो बनाउँछ। धेरै Azure स्रोतहरू म्यानुअली सिर्जना र जडान नगरीकन, तपाईं एकै कमाण्डमा पूरा एप्लिकेसन तैनाथ गर्न सक्नुहुन्छ।

### `azd up` को जादु

```bash
# यो एकल आदेशले सबै कुरा गर्छ:
# ✅ सबै Azure स्रोतहरू सिर्जना गर्दछ
# ✅ नेटवर्किङ र सुरक्षा कन्फिगर गर्दछ
# ✅ तपाईंको आवेदन कोड निर्माण गर्दछ
# ✅ Azure मा तैनाथ गर्दछ
# ✅ तपाईंलाई काम गर्ने URL दिन्छ
azd up
```

**त्यो हो!** Azure पोर्टलमा क्लिक नगर्नुहोस्, जटिल ARM टेम्प्लेटहरू पहिला जान्न आवश्यक छैन, म्यानुअल कन्फिगरेसन छैन—केवल Azure मा काम गर्ने एपहरू।

---

## ❓ Azure Developer CLI र Azure CLI मा के फरक छ?

यो सुरुमा सबैभन्दा सामान्य प्रश्न हो। सरल उत्तर यस्तो छ:

| सुविधा | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **उद्देश्य** | व्यक्तिगत Azure स्रोतहरू व्यवस्थापन गर्ने | पूरा एप्लिकेसन तैनाथ गर्ने |
| **मनोवृत्ति** | पूर्वाधार-केंद्रित | एप्लिकेसन-केंद्रित |
| **उदाहरण** | `az webapp create --name myapp...` | `azd up` |
| **सिक्ने अवस्था** | Azure सेवाहरू जान्न आवश्यक | केवल आफ्नो एप जान्नुहोस् |
| **सर्वोत्तम उपयोग** | DevOps, पूर्वाधार | विकासकर्ताहरू, प्रोटोटाइपिङ |

### सरल उपमा

- **Azure CLI** घर बनाउने सबै औजारहरू जस्तै हो—ह्यामर, आरी, नङ। तपाईं केही पनि बनाउन सक्नुहुन्छ, तर निर्माणको ज्ञान चाहिन्छ।
- **Azure Developer CLI** ठेकेदार भाडामा राख्न जस्तै हो—तपाईं आफ्नो चाहना बताउनुहुन्छ, र उनीहरूले निर्माण ब्यवस्था गर्छन्।

### कहिले कुन प्रयोग गर्ने

| अवस्था | यो प्रयोग गर्नुहोस् |
|----------|----------|
| "म मेरो वेब एप छिटो तैनाथ गर्न चाहन्छु" | `azd up` |
| "म केवल स्टोरेज अकाउन्ट सिर्जना गर्न चाहन्छु" | `az storage account create` |
| "म पूर्ण AI एप्लिकेसन निर्माण गर्दै छु" | `azd init --template azure-search-openai-demo` |
| "म कुनै विशेष Azure स्रोत डिबग गर्न चाहन्छु" | `az resource show` |
| "म.minutikai उत्पादन-तयार तैनाथि गर्न चाहन्छु" | `azd up --environment production` |

### दुवै सँगै काम गर्छन्!

AZD ले Azure CLI लाई भित्री रूपमा प्रयोग गर्छ। तपाईं दुवै प्रयोग गर्न सक्नुहुन्छ:
```bash
# AZD सँग तपाईंको अनुप्रयोग तैनाथ गर्नुहोस्
azd up

# त्यसपछि Azure CLI सँग विशिष्ट स्रोतहरू परिमार्जन गर्नुहोस्
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD मा टेम्प्लेटहरू फेला पार्नुहोस्

सुरुबाटै नथाल्नुहोस्! **Awesome AZD** तैनाथ गर्न तयार टेम्प्लेटहरूको समुदाय संग्रह हो:

| स्रोत | वर्णन |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | एक क्लिकमा २००+ टेम्प्लेटहरू ब्राउज गर्नुहोस् |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | समुदायमा आफ्नो टेम्प्लेट योगदान गर्नुहोस् |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | तारा दिनुहोस् र स्रोत अन्वेषण गर्नुहोस् |

### Awesome AZD बाट लोकप्रिय AI टेम्प्लेटहरू

```bash
# Microsoft Foundry मोडेलहरू + AI खोजी संग RAG च्याट
azd init --template azure-search-openai-demo

# छिटो AI च्याट एप्लिकेशन
azd init --template openai-chat-app-quickstart

# Foundry एजेन्टहरूसँग AI एजेन्टहरू
azd init --template get-started-with-ai-agents
```

---

## 🎯 ३ चरणमा सुरु गर्नुहोस्

सुरु गर्नु अघि, तपाईंले तैनाथ गर्न चाहेको टेम्प्लेटका लागि आफ्नो मेसिन तयार छ भनी सुनिश्चित गर्नुहोस्:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

यदि कुनै आवश्यक जाँच असफल भयो भने, पहिले त्यसलाई सुधार्नुहोस् र त्यसपछि द्रुत सुरु जारी राख्नुहोस्।

### चरण १: AZD इन्स्टल गर्नुहोस् (२ मिनेट)

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

### चरण २: AZD का लागि प्रमाणित गर्नुहोस्

```bash
# वैकल्पिक यदि तपाईंले यो कोर्समा सिधै Azure CLI कमाण्डहरू प्रयोग गर्ने योजना बनाउनु भएको छ भने
az login

# AZD कार्यप्रवाहहरूको लागि आवश्यक
azd auth login
```

कुन विकल्प चाहिन्छ थाहा नपाइएको खण्डमा, [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup) मा पूर्ण सेटअप प्रक्रिया पालना गर्नुहोस्।

### चरण ३: आफ्नो पहिलो एप तैनाथ गर्नुहोस्

```bash
# ढाँचाबाट सुरुवात गर्नुहोस्
azd init --template todo-nodejs-mongo

# Azure मा परिनियोजन गर्नुहोस् (सबै कुरा सिर्जना गर्दछ!)
azd up
```

**🎉 भयो!** तपाईंको एप अब Azure मा प्रत्यक्ष छ।

### सफाइ (भुल्नु हुन्न!)

```bash
# परीक्षण सकेपछि सबै स्रोतहरू हटाउनुहोस्
azd down --force --purge
```

---

## 📚 यो कोर्स कसरी प्रयोग गर्ने

यो कोर्स **क्रमिक सिकाइ** को लागि डिजाइन गरिएको छ—जहाँ तपाईं सहज हुनुहुन्छ त्यहाँबाट सुरु गर्नुहोस् र क्रमशः अघि बढ्नुहोस्:

| तपाईंको अनुभव | यहाँबाट सुरु गर्नुहोस् |
|-----------------|------------|
| **Azure मा नयाँ** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Azure जान्नुहुन्छ, AZD मा नयाँ** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **AI एपहरू तैनाथ गर्न चाहनुहुन्छ** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **हात-हात अभ्यास गर्न चाहनुहुन्छ** | [🎓 Interactive Workshop](workshop/README.md) - ३-४ घण्टा निर्देशित प्रयोगशाला |
| **उत्पादन ढाँचा चाहिन्छ** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### छिटो सेटअप

१. **यो रिपोजिटरी Fork गर्नुहोस्**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
२. **क्लोन गर्नुहोस्**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
३. **सहायता लिनुहोस्**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **स्थानीय रूपमा क्लोन गर्न मन छ?**

> यो रिपोजिटरीमा ५०+ भाषा अनुवादहरू छन् जसले डाउनलोड साइजलाई धेरै बढाउँछ। अनुवादबिना क्लोन गर्न sparse checkout प्रयोग गर्नुहोस्:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> यसले तपाईंलाई सबै कुरा दिन्छ जुन तपाईंले कोर्स पूरा गर्न आवश्यक छ धेरै छिटो डाउनलोडको साथ।


## कोर्स अवलोकन

Azure Developer CLI (azd) लाई संरचित अध्यायहरू मार्फत मास्टर गर्नुहोस् जुन क्रमिक सिकाइका लागि डिजाइन गरिएका छन्। **Microsoft Foundry एकीकरणसँगै AI एप्लिकेसन तैनाथिमा विशेष ध्यान।**


### किन यो कोर्स आधुनिक विकासकर्ताहरूका लागि आवश्यक छ

Microsoft Foundry Discord समुदायका अन्तर्दृष्टिहरूको आधारमा, **45% विकासकर्ताहरूले AI कार्यभारका लागि AZD प्रयोग गर्न चाहन्छन्** तर सामना गर्ने चुनौतिहरू:
- जटिल बहु-सेवा AI वास्तुकला
- उत्पादन AI परिनियोजनका उत्तम अभ्यासहरू  
- Azure AI सेवा एकीकरण र कन्फिगरेसन
- AI कार्यभारको लागत अनुकूलन
- AI-विशिष्ट परिनियोजन समस्याहरू समाधान गर्ने प्रक्रिया

### सिकाइका लक्ष्यहरू

यस संरचित कोर्स पूरा गरेपछि, तपाईं:
- **AZD आधारभूत कुरा मास्टर गर्नुहोस्**: मुख्य अवधारणाहरू, स्थापना, र कन्फिगरेसन
- **AI अनुप्रयोगहरू परिनियोजन गर्नुहोस्**: Microsoft Foundry सेवासँग AZD प्रयोग गर्नुहोस्
- **अवधारणा रूपमा पूर्वाधार कार्यान्वयन गर्नुहोस्**: Bicep टेम्प्लेटहरूसँग Azure स्रोतहरू व्यवस्थापन गर्नुहोस्
- **परिनियोजन समस्याहरू समाधान गर्नुहोस्**: सामान्य समस्याहरू समाधान र डिबग गर्नुहोस्
- **उत्पादनका लागि अनुकूलन गर्नुहोस्**: सुरक्षा, स्केलिङ, मोनिटरिङ, र लागत व्यवस्थापन
- **बहु-एजेन्ट समाधानहरू बनाउनुहोस्**: जटिल AI वास्तुकला परिनियोजन गर्नुहोस्

## सुरु गर्नु अघि: खाताहरू, पहुँच, र पूर्वधारणा

अध्याय 1 सुरू गर्नु अघि, तपाईंसँग तलका सामग्रीहरू तयार हुनुपर्छ। यो गाइडका पछि आउने स्थापना चरणहरूले यी आधारभूत कुरा पहिले नै पूरा भएका मान्छन्।

- **Azure सदस्यता**: तपाईंले आफ्नो कामको सदस्यता वा आफ्नै खाता प्रयोग गर्न सक्नुहुन्छ, वा सुरु गर्न [निशुल्क परीक्षण](https://aka.ms/azurefreetrial) सिर्जना गर्न सक्नुहुन्छ।
- **Azure स्रोतहरू सिर्जना गर्ने अनुमति**: धेरै अभ्यासहरूका लागि तपाईंसँग लक्षित सदस्यता वा स्रोत समूहमा न्यूनतम **सहयोगी (Contributor)** पहुँच हुनु आवश्यक छ। केही अध्यायहरूले स्रोत समूहहरू, व्यवस्थापित पहिचानहरू, र RBAC असाइनमेन्टहरू सिर्जना गर्न सक्ने अनुमान पनि गर्न सक्छन्।
- [**GitHub खाता**](https://github.com): यो रिपोजिटरी फोर्क गर्न, आफ्नै परिवर्तनहरू ट्र्याक गर्न, र कार्यशालाका लागि GitHub Codespaces प्रयोग गर्न उपयोगी हुन्छ।
- **टेम्प्लेट रनटाइम पूर्वशर्तहरू**: केही टेम्प्लेटहरूले स्थानीय उपकरणहरू जस्तै Node.js, Python, Java, वा Docker आवश्यक पर्छ। सुरु गर्नु अघि सेटअप भ्यालिडेटर चलाउनुहोस् ताकि आवश्यक उपकरणहरू छिटो पत्ता लागोस।
- **मूल टर्मिनल परिचितता**: तपाईं विशेषज्ञ हुन आवश्यक छैन, तर `git clone`, `azd auth login`, र `azd up` जस्ता आदेशहरू सजिलै चलाउन सक्नुपर्नेछ।

> **संगठन सदस्यतामा काम गर्दै हुनुहुन्छ?**
> यदि तपाईंको Azure वातावरण व्यवस्थापकद्वारा व्यवस्थापन हुन्छ भने, प्रयोग गर्न योजना बनाएको सदस्यता वा स्रोत समूहमा स्रोतहरू परिनियोजन गर्न सक्ने कुरामा पहिले निश्चित हुनुहोस्। यदि सकिंदैन भने, सुरु गर्नु अघि स्यान्डबक्स सदस्यता वा सहयोगी पहुँचको लागि अनुरोध गर्नुहोस्।

> **Azure नयाँ हो?**
> तपाईंको आफ्नै Azure परीक्षण वा Pay-as-you-go सदस्यता https://aka.ms/azurefreetrial बाट सुरु गर्नुहोस् ताकि तपाईंले अभ्यासहरू पूर्ण रूपमा प्रमाणित बिना टेनेन्ट-स्तरीय अनुमोदहरूको प्रतीक्षा नगरी सक्नुहोस्।

## 🗺️ कोर्स नक्शा: अध्याय अनुसार छिटो नेभिगेशन

प्रत्येक अध्यायसँग समर्पित README हुन्छ जसमा सिकाइका लक्ष्यहरू, छिटो सुरुवात, र अभ्यासहरू समावेश छन्:

| अध्याय | विषय | पाठहरू | अवधि | जटिलता |
|---------|-------|---------|----------|------------|
| **[अध्याय १: आधारशिला](docs/chapter-01-foundation/README.md)** | सुरु गर्ने | [AZD आधारभूत](docs/chapter-01-foundation/azd-basics.md) &#124; [स्थापना](docs/chapter-01-foundation/installation.md) &#124; [पहिलो परियोजना](docs/chapter-01-foundation/first-project.md) | ३०-४५ मिनेट | ⭐ |
| **[अध्याय २: AI विकास](docs/chapter-02-ai-development/README.md)** | AI-प्रथम अनुप्रयोगहरू | [Foundry एकीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI एजेन्टहरू](docs/chapter-02-ai-development/agents.md) &#124; [मोडेल परिनियोजन](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [कार्यशाला](docs/chapter-02-ai-development/ai-workshop-lab.md) | १-२ घण्टा | ⭐⭐ |
| **[अध्याय ३: कन्फिगरेसन](docs/chapter-03-configuration/README.md)** | प्रमाणीकरण र सुरक्षा | [कन्फिगरेसन](docs/chapter-03-configuration/configuration.md) &#124; [प्रमाणीकरण र सुरक्षा](docs/chapter-03-configuration/authsecurity.md) | ४५-६० मिनेट | ⭐⭐ |
| **[अध्याय ४: पूर्वाधार](docs/chapter-04-infrastructure/README.md)** | IaC र परिनियोजन | [परिनियोजन गाइड](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [प्रोभिजनिङ](docs/chapter-04-infrastructure/provisioning.md) | १-१.५ घण्टा | ⭐⭐⭐ |
| **[अध्याय ५: बहु-एजेन्ट](docs/chapter-05-multi-agent/README.md)** | AI एजेन्ट समाधानहरू | [रिटेल परिदृश्य](examples/retail-scenario.md) &#124; [समन्वय ढाँचा](docs/chapter-06-pre-deployment/coordination-patterns.md) | २-३ घण्टा | ⭐⭐⭐⭐ |
| **[अध्याय ६: पूर्व-परिनियोजन](docs/chapter-06-pre-deployment/README.md)** | योजना र मान्यता | [पूर्व-उडान जाँच](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [क्षमता योजना](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU चयन](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [एप्लिकेशन इन्साइट्स](docs/chapter-06-pre-deployment/application-insights.md) | १ घण्टा | ⭐⭐ |
| **[अध्याय ७: समस्या समाधान](docs/chapter-07-troubleshooting/README.md)** | डिबग र सुधार | [सामान्य समस्या](docs/chapter-07-troubleshooting/common-issues.md) &#124; [डिबगिङ](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI समस्या](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | १-१.५ घण्टा | ⭐⭐ |
| **[अध्याय ८: उत्पादन](docs/chapter-08-production/README.md)** | संगठनात्मक ढाँचा | [उत्पादन अभ्यासहरू](docs/chapter-08-production/production-ai-practices.md) | २-३ घण्टा | ⭐⭐⭐⭐ |
| **[🎓 कार्यशाला](workshop/README.md)** | व्यावहारिक प्रयोगशाला | [परिचय](workshop/docs/instructions/0-Introduction.md) &#124; [चयन](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [मान्यता](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [विच्छेदन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [कन्फिगरेसन](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [अनुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [टियरडाउन](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [समाप्ति](workshop/docs/instructions/7-Wrap-up.md) | ३-४ घण्टा | ⭐⭐ |

**कुल कोर्स अवधि:** ~१०-१४ घण्टा | **कौशल प्रगति:** शुरुवातकर्ता → उत्पादन-तयार

---

## 📚 सिकाइ अध्यायहरू

*तपाईंको अनुभव स्तर र लक्ष्यहरूको आधारमा सिकाइ मार्ग चयन गर्नुहोस्*

### 🚀 अध्याय १: आधारशिला र छिटो सुरु
**पूर्वशर्तहरू**: Azure सदस्यता, आधारभूत कमाण्ड लाइन ज्ञान  
**अवधि**: ३०-४५ मिनट  
**जटिलता**: ⭐

#### तपाइँले के सिक्नुहुनेछ
- Azure Developer CLI का आधारभूत कुरा बुझ्ने
- तपाईंको प्लेटफर्ममा AZD स्थापना गर्ने
- तपाईंको पहिलो सफल परिनियोजन

#### सिकाइ स्रोतहरू
- **🎯 यहाँबाट सुरु गर्नुहोस्**: [Azure Developer CLI के हो?](#what-is-azure-developer-cli)
- **📖 सिद्धान्त**: [AZD आधारभूत](docs/chapter-01-foundation/azd-basics.md) - मुख्य अवधारणाहरू र शब्दावली
- **⚙️ सेटअप**: [स्थापना र सेटअप](docs/chapter-01-foundation/installation.md) - प्लेटफर्म-विशेष गाइडहरू
- **🛠️ अनलाइन अभ्यास**: [तपाईंको पहिलो परियोजना](docs/chapter-01-foundation/first-project.md) - चरण-दर-चरण टुटोरियल
- **📋 छिटो सन्दर्भ**: [कमाण्ड धावा पाना](resources/cheat-sheet.md)

#### व्यावहारिक अभ्यासहरू
```bash
# छिटो स्थापना जाँच
azd version

# तपाईंको पहिलो अनुप्रयोग तैनाथ गर्नुहोस्
azd init --template todo-nodejs-mongo
azd up
```

**💡 अध्याय नतिजा**: AZD प्रयोग गरेर Azure मा सरल वेब अनुप्रयोग सफलतापूर्वक परिनियोजन गर्नुहोस्

**✅ सफलता मान्यता:**
```bash
# अध्याय १ पूरा गरेपछि, तपाईं निम्न गर्न सक्षम हुनुपर्छ:
azd version              # स्थापना गरिएको संस्करण देखाउँछ
azd init --template todo-nodejs-mongo  # परियोजना शुरू गर्छ
azd up                  # Azure मा तैनाथ गर्छ
azd show                # चलिरहेको एप्लिकेसन URL देखाउँछ
# एप्लिकेसन ब्राउजरमा खुल्छ र काम गर्छ
azd down --force --purge  # स्रोतहरू सफा गर्छ
```

**📊 समय लगानी:** ३०-४५ मिनेट  
**📈 सिकाइ स्तर पछि:** आधारभूत अनुप्रयोगहरू स्वतन्त्र रूपमा परिनियोजन गर्न सक्नुहुन्छ
**📈 सिकाइ स्तर पछि:** आधारभूत अनुप्रयोगहरू स्वतन्त्र रूपमा परिनियोजन गर्न सक्नुहुन्छ

---

### 🤖 अध्याय २: AI-प्रथम विकास (AI विकासकर्ताहरूका लागि सिफारिस गरिएको)
**पूर्वशर्तहरू**: अध्याय १ पूरा  
**अवधि**: १-२ घण्टा  
**जटिलता**: ⭐⭐

#### तपाइँले के सिक्नुहुनेछ
- Microsoft Foundry सँग AZD एकीकरण
- AI-शक्ति प्राप्त अनुप्रयोगहरू परिनियोजन गर्ने
- AI सेवा कन्फिगरेसनहरू बुझ्ने

#### सिकाइ स्रोतहरू
- **🎯 यहाँबाट सुरु गर्नुहोस्**: [Microsoft Foundry एकीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI एजेन्टहरू**: [AI एजेन्ट मार्गदर्शन](docs/chapter-02-ai-development/agents.md) - AZD सँग बुद्धिमान एजेन्टहरू परिनियोजन गर्नुहोस्
- **📖 ढाँचा**: [AI मोडेल परिनियोजन](docs/chapter-02-ai-development/ai-model-deployment.md) - AI मोडेलहरू परिनियोजन र व्यवस्थापन गर्नुहोस्
- **🛠️ कार्यशाला**: [AI कार्यशाला ल्याब](docs/chapter-02-ai-development/ai-workshop-lab.md) - तपाईंका AI समाधानहरू AZD-तयार बनाउनुहोस्
- **🎥 अन्तरक्रियात्मक मार्गदर्शन**: [कार्यशाला सामग्रीहरू](workshop/README.md) - MkDocs * DevContainer वातावरणसँग ब्राउजरमा सिकाइ
- **📋 टेम्प्लेटहरू**: [विशेष Microsoft Foundry टेम्प्लेटहरू](#कार्यशाला-स्रोतहरू)
- **📝 उदाहरणहरू**: [AZD परिनियोजन उदाहरणहरू](examples/README.md)

#### व्यावहारिक अभ्यासहरू
```bash
# तपाईंको पहिलो कृत्रिम बुद्धिमत्ता अनुप्रयोग डिप्लॉय गर्नुहोस्
azd init --template azure-search-openai-demo
azd up

# थप कृत्रिम बुद्धिमत्ता टेम्प्लेटहरू प्रयास गर्नुहोस्
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 अध्याय नतिजा**: RAG क्षमतासहित AI-शक्ति प्राप्त च्याट अनुप्रयोग परिनियोजन र कन्फिगरेसन गर्नुहोस्

**✅ सफलता मान्यता:**
```bash
# अध्याय २ पछि, तपाईं सक्षम हुनुहुनेछ:
azd init --template azure-search-openai-demo
azd up
# एआई च्याट इन्टरफेस परीक्षण गर्नुहोस्
# प्रश्नहरू सोध्नुहोस् र स्रोतहरू सहित एआई-प्रेरित प्रतिक्रियाहरू प्राप्त गर्नुहोस्
# खोज एकीकरण काम गर्छ भनी प्रमाणित गर्नुहोस्
azd monitor  # अनुप्रयोग इनसाइट्सले टेलिमेट्री देखाउँछ भनी जाँच गर्नुहोस्
azd down --force --purge
```

**📊 समय लगानी:** १-२ घण्टा  
**📈 सिकाइ स्तर पछि:** उत्पादन-तयार AI अनुप्रयोगहरू परिनियोजन र कन्फिगर गर्न सक्नुहुन्छ  
**💰 लागत सचेतना:** $८०-१५०/महिना विकास लागत, $३००-३५००/महिना उत्पादन लागत बुझ्नुहोस्

#### 💰 AI परिनियोजनहरूको लागत विचारहरू

**विकास वातावरण (अनुमानित $८०-१५०/महिना):**
- Microsoft Foundry मोडेलहरू (Pay-as-you-go): $०-५०/महिना (टोकन प्रयोगमा आधारित)
- AI खोज (आधारभूत तह): $७५/महिना
- कन्टेनर अनुप्रयोगहरू (खपत): $०-२०/महिना
- भण्डारण (मानक): $१-५/महिना

**उत्पादन वातावरण (अनुमानित $३००-३,५००+/महिना):**
- Microsoft Foundry मोडेलहरू (PTU नियमित प्रदर्शनका लागि): $३,०००+/महिना वा उच्च भोल्युमका लागि Pay-as-you-go
- AI खोज (मानक तह): $२५०/महिना
- कन्टेनर अनुप्रयोगहरू (समर्पित): $५०-१००/महिना
- एप्लिकेशन इन्साइट्स: $५-५०/महिना
- भण्डारण (प्रीमियम): $१०-५०/महिना

**💡 लागत अनुकूलन सुझावहरू:**
- सिकाइको लागि **निशुल्क तह** Microsoft Foundry मोडेलहरू प्रयोग गर्नुहोस् (Azure OpenAI ५०,००० टोकन/महिना समावेश)
- सक्रिय रूपमा विकास नगरिरहेको बेला स्रोतहरू छुट्याउन `azd down` चलाउनुहोस्
- खपत-आधारित बिलिङबाट सुरु गर्नुहोस्, उत्पादनका लागि मात्र PTU मा अपग्रेड गर्नुहोस्
- परिनियोजन अघि लागत अनुमान गर्न `azd provision --preview` प्रयोग गर्नुहोस्
- स्वत: स्केलिङ सक्षम गर्नुहोस्: वास्तविक प्रयोगको लागि मात्र तिर्नुहोस्

**लागत अनुगमन:**
```bash
# अनुमानित मासिक लागतहरू जाँच गर्नुहोस्
azd provision --preview

# Azure पोर्टलमा वास्तविक लागतहरू मनिटर गर्नुहोस्
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ अध्याय ३: कन्फिगरेसन र प्रमाणीकरण
**पूर्वशर्तहरू**: अध्याय १ पूरा  
**अवधि**: ४५-६० मिनेट  
**जटिलता**: ⭐⭐

#### तपाइँले के सिक्नुहुनेछ
- वातावरण कन्फिगरेसन र व्यवस्थापन
- प्रमाणीकरण र सुरक्षा उत्तम अभ्यासहरू
- स्रोत नामाकरण र संगठन

#### सिकाइ स्रोतहरू
- **📖 कन्फिगरेसन**: [कन्फिगरेसन गाइड](docs/chapter-03-configuration/configuration.md) - वातावरण स्थापना
- **🔐 सुरक्षा**: [प्रमाणीकरण ढाँचा र व्यवस्थापित पहिचान](docs/chapter-03-configuration/authsecurity.md) - प्रमाणीकरण ढाँचा
- **📝 उदाहरणहरू**: [डेटाबेस एप्लिकेशन उदाहरण](examples/database-app/README.md) - AZD डेटाबेस उदाहरणहरू

#### व्यावहारिक अभ्यासहरू
- बहु वातावरणहरू (डेभ, स्टेजिङ, उत्पादन) कन्फिगर गर्नुहोस्
- व्यवस्थापित पहिचान प्रमाणीकरण सेटअप गर्नुहोस्
- वातावरण-विशेष कन्फिगरेसनहरू कार्यान्वयन गर्नुहोस्

**💡 अध्याय नतिजा**: उचित प्रमाणीकरण र सुरक्षाका साथ बहु वातावरणहरू व्यवस्थापन गर्नुहोस्

---

### 🏗️ अध्याय ४: पूर्वाधार अवधारणा रूपमा कोड र परिनियोजन
**पूर्वशर्तहरू**: अध्याय १-३ पूरा  
**अवधि**: १-१.५ घण्टा  
**जटिलता**: ⭐⭐⭐

#### तपाइँले के सिक्नुहुनेछ
- उन्नत परिनियोजन ढाँचाहरू
- Bicep संग पूर्वाधार अवधारणा रूपमा कोड
- स्रोत प्रोभिजनिङ रणनीतिहरू

#### सिकाइ स्रोतहरू
- **📖 परिनियोजन**: [परिनियोजन गाइड](docs/chapter-04-infrastructure/deployment-guide.md) - पूरै कार्यप्रवाहहरू
- **🏗️ प्रोभिजनिङ**: [स्रोतहरू प्रोभिजनिङ](docs/chapter-04-infrastructure/provisioning.md) - Azure स्रोत व्यवस्थापन
- **📝 उदाहरणहरू**: [कन्टेनर एप्लिकेशन उदाहरण](../../examples/container-app) - कन्टेनराइज्ड परिनियोजनहरू

#### व्यावहारिक अभ्यासहरू
- कस्टम Bicep टेम्प्लेटहरू सिर्जना गर्नुहोस्
- बहु-सेवा अनुप्रयोगहरू परिनियोजन गर्नुहोस्
- निलो-हरियो परिनियोजन रणनीतिहरू कार्यान्वयन गर्नुहोस्

**💡 अध्याय नतिजा**: कस्टम पूर्वाधार टेम्प्लेट प्रयोग गरेर जटिल बहु-सेवा अनुप्रयोगहरू परिनियोजन गर्नुहोस्

---


### 🎯 अध्याय ५: बहु-एजेन्ट एआई समाधानहरू (उन्नत)
**पूर्वापेक्षाहरू**: अध्याय १-२ पूरा भयो  
**अवधि**: २-३ घण्टा  
**जटिलता**: ⭐⭐⭐⭐

#### के सिक्नेछौं
- बहु-एजेन्ट आर्किटेक्चर ढाँचाहरू
- एजेन्ट समन्वय र व्यवस्थापन
- उत्पादन-तयार एआई परिनियोजनहरू

#### सिकाइ स्रोतहरू
- **🤖 विशेष परियोजना**: [रिटेल बहु-एजेन्ट समाधान](examples/retail-scenario.md) - पूर्ण कार्यान्वयन
- **🛠️ ARM टेम्प्लेटहरू**: [ARM टेम्प्लेट प्याकेज](../../examples/retail-multiagent-arm-template) - एक-क्लिक परिनियोजन
- **📖 आर्किटेक्चर**: [बहु-एजेन्ट समन्वय ढाँचाहरू](docs/chapter-06-pre-deployment/coordination-patterns.md) - ढाँचाहरू

#### व्यवहारिक अभ्यासहरू
```bash
# पूर्ण खुद्रा बहु-एजेन्ट समाधान तैनात गर्नुहोस्
cd examples/retail-multiagent-arm-template
./deploy.sh

# एजेन्ट कन्फिगरेसनहरू अन्वेषण गर्नुहोस्
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 अध्याय परिणाम**: ग्राहक र सूची एजेन्टहरूसँग उत्पादन-तयार बहु-एजेन्ट एआई समाधान परिनियोजित र व्यवस्थापन गर्नुहोस्

---

### 🔍 अध्याय ६: पूर्व-परिनियोजन प्रमाणीकरण र योजना
**पूर्वापेक्षाहरू**: अध्याय ४ पूरा भयो  
**अवधि**: १ घण्टा  
**जटिलता**: ⭐⭐

#### के सिक्नेछौं
- क्षमता योजना र स्रोत प्रमाणीकरण
- SKU छनोट रणनीतिहरू
- पूर्व-उडान जाँचहरू र स्वचालन

#### सिकाइ स्रोतहरू
- **📊 योजना**: [क्षमता योजना](docs/chapter-06-pre-deployment/capacity-planning.md) - स्रोत प्रमाणीकरण
- **💰 छनोट**: [SKU छनोट](docs/chapter-06-pre-deployment/sku-selection.md) - लागत-प्रभावी विकल्पहरू
- **✅ प्रमाणीकरण**: [पूर्व-उडान जाँचहरू](docs/chapter-06-pre-deployment/preflight-checks.md) - स्वचालित स्क्रिप्टहरू

#### व्यवहारिक अभ्यासहरू
- क्षमता प्रमाणीकरण स्क्रिप्टहरू चलाउनुहोस्
- लागतका लागि SKU छनोटहरू अनुकूलित गर्नुहोस्
- स्वचालित पूर्व-परिनियोजन जाँचहरू लागू गर्नुहोस्

**💡 अध्याय परिणाम**: कार्यान्वयन अघि प्रमाणीकरण र अनुकूलन गर्नुहोस्

---

### 🚨 अध्याय ७: समस्या समाधान र डीबगिंग
**पूर्वापेक्षाहरू**: कुनै पनि परिनियोजन अध्याय पूरा भयो  
**अवधि**: १-१.५ घण्टा  
**जटिलता**: ⭐⭐

#### के सिक्नेछौं
- व्यवस्थित डीबगिंग विधिहरू
- सामान्य समस्या र समाधानहरू
- एआई-विशिष्ट समस्या समाधान

#### सिकाइ स्रोतहरू
- **🔧 सामान्य समस्या**: [सामान्य समस्या](docs/chapter-07-troubleshooting/common-issues.md) - FAQ र समाधानहरू
- **🕵️ डीबगिंग**: [डीबगिंग गाइड](docs/chapter-07-troubleshooting/debugging.md) - चरण-द्वारा-चरण रणनीतिहरू
- **🤖 एआई समस्या**: [एआई-विशिष्ट समस्या समाधान](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - एआई सेवा समस्या

#### व्यवहारिक अभ्यासहरू
- परिनियोजन असफलताहरू निदान गर्नुहोस्
- प्रमाणीकरण समस्याहरू समाधान गर्नुहोस्
- एआई सेवा कनेक्टिभिटी डीबग गर्नुहोस्

**💡 अध्याय परिणाम**: स्वतन्त्र रूपमा सामान्य परिनियोजन समस्याहरू निदान र समाधान गर्नुहोस्

---

### 🏢 अध्याय ८: उत्पादन र उद्यम ढाँचाहरू
**पूर्वापेक्षाहरू**: अध्याय १-४ पूरा भयो  
**अवधि**: २-३ घण्टा  
**जटिलता**: ⭐⭐⭐⭐

#### के सिक्नेछौं
- उत्पादन परिनियोजन रणनीतिहरू
- उद्यम सुरक्षा ढाँचाहरू
- अनुगमन र लागत अनुकूलन

#### सिकाइ स्रोतहरू
- **🏭 उत्पादन**: [उत्पादन एआई उत्तम अभ्यासहरू](docs/chapter-08-production/production-ai-practices.md) - उद्यम ढाँचाहरू
- **📝 उदाहरणहरू**: [माइक्रोसर्भिसेस उदाहरण](../../examples/microservices) - जटिल आर्किटेक्चरहरू
- **📊 अनुगमन**: [एप्लिकेसन इनसाइट्स एकीकरण](docs/chapter-06-pre-deployment/application-insights.md) - अनुगमन

#### व्यवहारिक अभ्यासहरू
- उद्यम सुरक्षा ढाँचाहरू लागू गर्नुहोस्
- व्यापक अनुगमन सेट गर्नुहोस्
- उचित शासनसहित उत्पादनमा परिनियोजन गर्नुहोस्

**💡 अध्याय परिणाम**: पूर्ण उत्पादन क्षमता सहित उद्यम-तयार अनुप्रयोगहरू परिनियोजित गर्नुहोस्

---

## 🎓 कार्यशाला अवलोकन: हात-हातको सिकाइ अनुभव

> **⚠️ कार्यशाला स्थिति: सक्रिय विकास**  
> कार्यशाला सामग्रीहरू हाल विकास र परिमार्जनमा छन्। मुख्य मोड्युलहरू काम गरिरहेका छन्, तर केही उन्नत भागहरू अपूर्ण छन्। हामी सबै सामग्री पूरा गर्न सक्रिय रूपमा काम गर्दैछौं। [प्रगति ट्र्याक गर्नुहोस् →](workshop/README.md)

### अन्तरक्रियात्मक कार्यशाला सामग्रीहरू
**ब्राउजर-आधारित उपकरणहरू र निर्देशनसहितको व्यावहारिक सिकाइ**

हाम्रो कार्यशाला सामग्रीहरूले उपर्युक्त अध्याय-आधारित पाठ्यक्रमलाई पूरक गर्ने संरचित, अन्तरक्रियात्मक सिकाइ अनुभव प्रदान गर्दछ। कार्यशाला स्व-गति सिकाइ र प्रशिक्षक-नेतृत्व सत्रहरूका लागि डिजाइन गरिएको हो।

#### 🛠️ कार्यशाला सुविधाहरू
- **ब्राउजर-आधारित अन्तरफलक**: खोज, प्रतिलिपि, र थीम सुविधाहरूसहित पूर्ण MkDocs कार्यशाला
- **GitHub Codespaces एकीकरण**: एक-क्लिक विकास वातावरण सेटअप
- **संरचित सिकाइ मार्ग**: ८-मोड्युल निर्देशित अभ्यासहरू (जम्मा ३-४ घण्टा)
- **प्रगतिशील पद्धति**: परिचय → छनोट → प्रमाणीकरण → विघटन → कन्फिगरेसन → अनुकूलन → समाप्त → समापन
- **अन्तरक्रियात्मक DevContainer वातावरण**: पूर्व-कन्फिगर गरिएका उपकरणहरू र निर्भरताहरू

#### 📚 कार्यशाला मोड्युल संरचना
कार्यशालाले एक **८-मोड्युल प्रगतिशील पद्धति** अनुसरण गर्दछ जुन तपाईंलाई खोजबाट परिनियोजन मास्टरीसम्म पुर्याउँछ:

| मोड्युल | विषय | के गर्नुहुनेछ | अवधि |
|--------|-------|----------------|----------|
| **०. परिचय** | कार्यशाला अवलोकन | सिकाइ लक्ष्यहरू, पूर्वापेक्षाहरू, र कार्यशाला संरचना बुझ्नुहोस् | १५ मिनेट |
| **१. छनोट** | टेम्प्लेट अन्वेषण | AZD टेम्प्लेटहरू पत्ता लगाउनुहोस् र तपाईंको परिदृश्यको लागि सही एआई टेम्प्लेट चयन गर्नुहोस् | २० मिनेट |
| **२. प्रमाणीकरण** | परिनियोजन र प्रमाणीकरण | `azd up` सँग टेम्प्लेट परिनियोजन गर्नुहोस् र पूर्वाधार काम गर्छ कि छैन जाँच्नुहोस् | ३० मिनेट |
| **३. विघटन** | संरचना बुझ्नुहोस् | GitHub Copilot प्रयोग गरेर टेम्प्लेट आर्किटेक्चर, बाइसप फाइलहरू, र कोड संगठन अन्वेषण गर्नुहोस् | ३० मिनेट |
| **४. कन्फिगरेसन** | azure.yaml गहिरो अध्ययन | `azure.yaml` कन्फिगरेसन, लाइफसाइकल हुकहरू, र वातावरण भेरिएबलहरूमा महारत हासिल गर्नुहोस् | ३० मिनेट |
| **५. अनुकूलन** | यसलाई तपाईंको बनाउनुस् | एआई खोज सक्षम गर्नुहोस्, ट्रेसिंग, मूल्याङ्कन, र तपाईंको परिदृश्यको लागि अनुकूलन गर्नुहोस् | ४५ मिनेट |
| **६. समाप्त** | सफा गर्नुहोस् | `azd down --purge` को साथ स्रोतहरू सुरक्षित रूपमा हटाउनुहोस् | १५ मिनेट |
| **७. समापन** | अर्को कदमहरू | उपलब्धिहरू, प्रमुख अवधारणाहरू पुनरावलोकन गर्नुहोस् र आफ्नो सिकाइ यात्रा जारी राख्नुहोस् | १५ मिनेट |

**कार्यशाला प्रक्रिया:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 कार्यशालासँग शुरुवात
```bash
# विकल्प 1: GitHub Codespaces (सिफारिस गरिएको)
# रिपोजिटरीमा "Code" → "Create codespace on main" मा क्लिक गर्नुहोस्

# विकल्प 2: स्थानीय विकास
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md मा सेटअप निर्देशनहरू पालना गर्नुहोस्
```

#### 🎯 कार्यशाला सिकाइ परिणामहरू
कार्यशाला पूरा गरेर सहभागीहरूले:
- **उत्पादन एआई अनुप्रयोगहरू परिनियोजन गर्नुहोस्**: Microsoft Foundry सेवाहरूसँग AZD प्रयोग गर्नुहोस्
- **बहु-एजेन्ट आर्किटेक्चरसँग महारत हासिल गर्नुहोस्**: समन्वित एआई एजेन्ट समाधानहरू लागू गर्नुहोस्
- **सुरक्षा उत्तम अभ्यासहरू लागू गर्नुहोस्**: प्रमाणीकरण र पहुँच नियन्त्रण कन्फिगर गर्नुहोस्
- **स्केलका लागि अनुकूलन गर्नुहोस्**: लागत-कुशल, प्रदर्शनयुक्त परिनियोजन डिजाइन गर्नुहोस्
- **परिनियोजन समस्या समाधान गर्नुहोस्**: सामान्य समस्याहरू स्वतन्त्र रूपमा समाधान गर्नुहोस्

#### 📖 कार्यशाला स्रोतहरू
- **🎥 अन्तरक्रियात्मक गाइड**: [कार्यशाला सामग्रीहरू](workshop/README.md) - ब्राउजर-आधारित सिकाइ वातावरण
- **📋 मोड्युल-द्वारा-मोड्युल निर्देशनहरू**:
  - [०. परिचय](workshop/docs/instructions/0-Introduction.md) - कार्यशाला अवलोकन र उद्देश्यहरू
  - [१. छनोट](workshop/docs/instructions/1-Select-AI-Template.md) - एआई टेम्प्लेटहरू फेला पार्नुहोस् र छनोट गर्नुहोस्
  - [२. प्रमाणीकरण](workshop/docs/instructions/2-Validate-AI-Template.md) - टेम्प्लेटहरू परिनियोजन र प्रमाणीकरण गर्नुहोस्
  - [३. विघटन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - टेम्प्लेट आर्किटेक्चर अन्वेषण गर्नुहोस्
  - [४. कन्फिगरेसन](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml मा महारत हासिल गर्नुहोस्
  - [५. अनुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) - तपाईंको परिदृश्यको लागि अनुकूलन गर्नुहोस्
  - [६. समाप्त](workshop/docs/instructions/6-Teardown-Infrastructure.md) - स्रोतहरू सफा गर्नुहोस्
  - [७. समापन](workshop/docs/instructions/7-Wrap-up.md) - समीक्षा र अर्को कदमहरू
- **🛠️ एआई कार्यशाला ल्याब**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - एआई केन्द्रित अभ्यासहरू
- **💡 छिटो शुरुवात**: [कार्यशाला सेटअप गाइड](workshop/README.md#quick-start) - वातावरण कन्फिगरेसन

**उत्तम**: कम्पनी प्रशिक्षण, विश्वविद्यालय पाठ्यक्रम, स्व-गति सिकाइ, र विकासकर्ता बुटक्याम्पहरूका लागि।

---

## 📖 गहिरो अध्ययन: AZD क्षमताहरू

आधारभूत भन्दा पर, AZD ले उत्पादन परिनियोजनका लागि शक्तिशाली सुविधाहरू प्रदान गर्दछ:

- **टेम्प्लेट-आधारित परिनियोजनहरू** - सामान्य अनुप्रयोग ढाँचाहरूका लागि पूर्व-निर्मित टेम्प्लेटहरू प्रयोग गर्नुहोस्
- **पूर्वाधार कोडको रूपमा** - Bicep वा Terraform प्रयोग गरी Azure स्रोतहरू व्यवस्थापन गर्नुहोस्  
- **एकीकृत कार्यप्रवाहहरू** - अनुप्रयोगहरू सहजै provision, deploy र monitor गर्नुहोस्
- **विकासकर्ता-अनुकूल** - विकासकर्ता उत्पादकत्व र अनुभवका लागि अनुकूलित

### **AZD + Microsoft Foundry: एआई परिनियोजनको लागि उत्तम**

**किन AZD एआई समाधानका लागि?** AZD ले एआई विकासकर्ताहरूले सामना गर्ने मुख्य चुनौतीहरू सम्बोधन गर्छ:

- **एआई-तयार टेम्प्लेटहरू** - Microsoft Foundry मोडेलहरू, Azure AI सेवाहरू, र ML कार्यभारहरूको लागि पूर्व-कन्फिगर गरिएको टेम्प्लेटहरू
- **सुरक्षित एआई परिनियोजनहरू** - एआई सेवाहरू, API कुञ्जीहरू, र मोडेल अन्तबिन्दुहरूको लागि बिल्ट-इन सुरक्षा ढाँचाहरू  
- **उत्पादन एआई ढाँचाहरू** - स्केलेबल, लागत-कुशल एआई अनुप्रयोग परिनियोजनका लागि उत्तम अभ्यासहरू
- **सम्पूर्ण एआई कार्यप्रवाहहरू** - मोडेल विकासदेखि उत्पादन परिनियोजनसम्म उचित अनुगमन सहित
- **लागत अनुकूलन** - एआई कार्यभारहरूका लागि स्मार्ट स्रोत आवंटन र स्केलिंग रणनीतिहरू
- **Microsoft Foundry एकीकरण** - Microsoft Foundry मोडेल क्याटलग र अन्तबिन्दुहरूसँग सहज जडान

---

## 🎯 टेम्प्लेटहरू र उदाहरण पुस्तकालय

### विशेष गरी: Microsoft Foundry टेम्प्लेटहरू
**यहाँबाट सुरु गर्नुहोस् यदि तपाईं एआई अनुप्रयोगहरू परिनियोजन गर्दै हुनुहुन्छ!**

> **नोट:** यी टेम्प्लेटहरूले विभिन्न एआई ढाँचाहरू देखाउँछन्। कतिपय बाह्य Azure नमुनाहरू हुन्, अन्य स्थानीय कार्यान्वयनहरू हुन्।

| टेम्प्लेट | अध्याय | जटिलता | सेवाहरू | प्रकार |
|----------|---------|------------|----------|------|
| [**एआई च्याटसँग सुरु गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय २ | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | बाह्य |
| [**एआई एजेन्टहरूसँग सुरु गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-agents) | अध्याय २ | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| बाह्य |
| [**Azure Search + OpenAI डेमो**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय २ | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | बाह्य |
| [**OpenAI च्याट एप छिटो शुरुवात**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय २ | ⭐ | AzureOpenAI + Container Apps + Application Insights | बाह्य |
| [**एजेन्ट OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय ५ | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | बाह्य |
| [**Contoso च्याट RAG**](https://github.com/Azure-Samples/contoso-chat) | अध्याय ८ | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | बाह्य |
| [**रिटेल बहु-एजेन्ट समाधान**](examples/retail-scenario.md) | अध्याय ५ | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **स्थानिय** |

### विशेष गरी: पूर्ण सिकाइ परिदृश्यहरू
**उत्पादन-तयार अनुप्रयोग टेम्प्लेटहरू सिकाइ अध्यायहरूसँग नक्साङ्कन गरिएको**

| टेम्प्लेट | सिकाइ अध्याय | जटिलता | प्रमुख सिकाइ |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय २ | ⭐ | आधारभूत एआई परिनियोजन ढाँचाहरू |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय २ | ⭐⭐ | Azure AI Search सँग RAG कार्यान्वयन |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | अध्याय ४ | ⭐⭐ | कागजात बुद्धिमत्ता एकीकरण |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय ५ | ⭐⭐⭐ | एजेन्ट फ्रेमवर्क र फंक्शन कलिङ |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | अध्याय ८ | ⭐⭐⭐ | उद्यम एआई समन्वय |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | अध्याय ५ | ⭐⭐⭐⭐ | ग्राहक र सूची एजेन्टहरूसँग बहु-एजेन्ट आर्किटेक्चर |

### उदाहरण प्रकार अनुसार सिकाइ

> **📌 स्थानिय विरुद्ध बाह्य उदाहरणहरू:**  
> **स्थानिय उदाहरणहरू** (यस रिपोजिटोरीमा) = तुरुन्त प्रयोग गर्न तयार  
> **बाह्य उदाहरणहरू** (Azure नमुनाहरू) = लिंक गरिएको रिपोजिटोरीहरूबाट क्लोन गर्नुहोस्

#### स्थानिय उदाहरणहरू (तत्काल प्रयोगका लागि)
- [**रिटेल बहु-एजेन्ट समाधान**](examples/retail-scenario.md) - ARM टेम्प्लेटहरूसहित पूर्ण उत्पादन-तयार कार्यान्वयन
  - बहु-एजेन्ट आर्किटेक्चर (ग्राहक + सूची एजेन्टहरू)
  - व्यापक अनुगमन र मूल्याङ्कन
  - ARM टेम्प्लेट मार्फत एक-क्लिक परिनियोजन

#### स्थानिय उदाहरणहरू - कन्टेनर अनुप्रयोगहरू (अध्याय २-५)
**यस रिपोजिटोरीमा व्यापक कन्टेनर परिनियोजन उदाहरणहरू:**

- [**कन्टेनर एप्लिकेशन उदाहरणहरू**](examples/container-app/README.md) - कन्टेनराइज्ड डिप्लोयमेन्टहरूको पूर्ण मार्गदर्शन
  - [साधारण फ्लास्क API](../../examples/container-app/simple-flask-api) - स्केल-टु-ज़िरो सहित आधारभूत REST API
  - [माइक्रोसर्भिस आर्किटेक्चर](../../examples/container-app/microservices) - उत्पादन-तयार बहु-सेवा डिप्लोयमेन्ट
  - छिटो सुरु गर्ने, उत्पादन, र उन्नत डिप्लोयमेन्ट नमूनाहरू
  - अनुगमन, सुरक्षा, र लागत अनुकूलन मार्गदर्शन

#### बाह्य उदाहरणहरू - साधारण अनुप्रयोगहरू (अध्याय १-२)
**थप सुरु गर्न यी Azure Samples रिपोजिटोरीहरू क्लोन गर्नुहोस्:**
- [साधारण वेब एप - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - आधारभूत डिप्लोयमेन्ट नमूनाहरू
- [स्टाटिक वेबसाइट - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - स्थिर सामग्री डिप्लोयमेन्ट
- [कन्टेनर एप - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API डिप्लोयमेन्ट

#### बाह्य उदाहरणहरू - डाटाबेस एकीकरण (अध्याय ३-४)  
- [डाटाबेस एप - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - डाटाबेस कनेक्तिविटी नमूनाहरू
- [फंक्शन्स + कोसमोस DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - सर्भरलेस डाटा वर्कफ्लो

#### बाह्य उदाहरणहरू - उन्नत नमूनाहरू (अध्याय ४-८)
- [जाभा माइक्रोसर्भिसेस](https://github.com/Azure-Samples/java-microservices-aca-lab) - बहु-सेवा आर्किटेक्चरहरू
- [कन्टेनर एप जॉब्स](https://github.com/Azure-Samples/container-apps-jobs) - पृष्ठभूमि प्रशोधन  
- [उद्यम ML पाइपलाइन](https://github.com/Azure-Samples/mlops-v2) - उत्पादन-तयार ML नमूनाहरू

### बाह्य टेम्प्लेट सङ्ग्रहहरू
- [**आधिकारिक AZD टेम्प्लेट ग्यालेरी**](https://azure.github.io/awesome-azd/) - आधिकारिक र समुदाय टेम्प्लेटहरूको चयनित सङ्ग्रह
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn टेम्प्लेट दस्तावेजीकरण
- [**उदाहरण निर्देशनिका**](examples/README.md) - विस्तृत व्याख्या सहित स्थानीय सिकाइ उदाहरणहरू

---

## 📚 सिकाइ स्रोतहरू र सन्दर्भहरू

### छिटो सन्दर्भहरू
- [**कमाण्ड चिट शीट**](resources/cheat-sheet.md) - अध्याय अनुसार व्यवस्थित आवश्यक azd कमाण्डहरू
- [**शब्दावली**](resources/glossary.md) - Azure र azd शब्दावली  
- [**सामान्य प्रश्नहरू**](resources/faq.md) - सिकाइ अध्याय अनुसार सामान्य प्रश्नहरू
- [**अध्ययन गाइड**](resources/study-guide.md) - व्यापक अभ्यासहरू

### व्यवहारिक कार्यशालाहरू
- [**AI कार्यशाला प्रयोगशाला**](docs/chapter-02-ai-development/ai-workshop-lab.md) - तपाईंका AI समाधानहरू AZD-डिप्लोय योग्य बनाउनुहोस् (२-३ घण्टा)
- [**इन्टरएक्टिभ कार्यशाला**](workshop/README.md) - MkDocs र GitHub Codespaces सहित ८-मोड्युल मार्गदर्शित अभ्यासहरू
  - पालना गर्नुहोस्: परिचय → छनौट → प्रमाणिकरण → विगटन → कन्फिगरेसन → अनुकूलन → अन्त्य → समापन

### बाह्य सिकाइ स्रोतहरू
- [Azure Developer CLI दस्तावेजीकरण](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर केन्द्र](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure मूल्य निर्धारण गणना गर्ने उपकरण](https://azure.microsoft.com/pricing/calculator/)
- [Azure स्थिति](https://status.azure.com/)

### तपाईँको सम्पादकका लागि AI एजेन्ट कौशलहरू
- [**skills.sh मा Microsoft Azure कौशलहरू**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, डिप्लोयमेन्ट, निदान, लागत अनुकूलन, र थपका लागि ३७ खुला एजेन्ट कौशलहरू। तिनीहरूलाई GitHub Copilot, Cursor, Claude Code, वा कुनै समर्थित एजेन्टमा स्थापना गर्नुहोस्:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 छिटो समस्या समाधान गाइड

**शिक्षार्थीहरूले सामना गर्ने सामान्य समस्याहरू र तत्काल समाधानहरू:**

<details>
<summary><strong>❌ "azd: कमाण्ड फेला परेन"</strong></summary>

```bash
# AZD पहिले स्थापना गर्नुहोस्
# विन्डोज (पावरशेल):
winget install microsoft.azd

# म्याकओएस:
brew tap azure/azd && brew install azd

# लिनक्स:
curl -fsSL https://aka.ms/install-azd.sh | bash

# स्थापना प्रमाणित गर्नुहोस्
azd version
```
</details>

<details>
<summary><strong>❌ "सब्स्क्रिप्सन फेला परेन" वा "सब्स्क्रिप्सन सेट गरिएको छैन"</strong></summary>

```bash
# उपलब्ध सदस्यताहरू सूचीबद्ध गर्नुहोस्
az account list --output table

# पूर्वनिर्धारित सदस्यता सेट गर्नुहोस्
az account set --subscription "<subscription-id-or-name>"

# AZD वातावरणको लागि सेट गर्नुहोस्
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# प्रमाणित गर्नुहोस्
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" वा "Quota exceeded"</strong></summary>

```bash
# फरक Azure क्षेत्र प्रयास गर्नुहोस्
azd env set AZURE_LOCATION "westus2"
azd up

# वा विकासमा साना SKU हरु प्रयोग गर्नुहोस्
# infra/main.parameters.json सम्पादन गर्नुहोस्:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" आधा बाटै असफल हुन्छ</strong></summary>

```bash
# विकल्प १: सफा गर्नुहोस् र पुन: प्रयास गर्नुहोस्
azd down --force --purge
azd up

# विकल्प २: केवल पूर्वाधार मर्मत गर्नुहोस्
azd provision

# विकल्प ३: विस्तृत स्थिति जाँच गर्नुहोस्
azd show

# विकल्प ४: Azure Monitor मा लगहरू जाँच गर्नुहोस्
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "प्रमाणीकरण असफल" वा "टोकन समाप्त"</strong></summary>

```bash
# AZD का लागि पुनः प्रमाणीकरण गर्नुहोस्
azd auth logout
azd auth login

# वैकल्पिक: यदि तपाईं az कमाण्डहरू चलाइरहनुभएको छ भने Azure CLI पनि रिफ्रेस गर्नुहोस्
az logout
az login

# प्रमाणीकरण पुष्टि गर्नुहोस्
az account show
```
</details>

<details>
<summary><strong>❌ "स्रोत पहिले नै अस्तित्वमा छ" वा नामकरण विवादहरू</strong></summary>

```bash
# AZD अद्वितीय नामहरू उत्पन्न गर्छ, तर यदि द्वन्द्व हुन्छ भने:
azd down --force --purge

# त्यसपछि नयाँ वातावरणका साथ पुनः प्रयास गर्नुहोस्
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ टेम्प्लेट डिप्लोयमेन्ट धेरै समय लिइरहेको छ</strong></summary>

**सामान्य प्रतीक्षा समयहरू:**
- साधारण वेब एप: ५-१० मिनेट
- डाटाबेस सहित एप: १०-१५ मिनेट
- AI अनुप्रयोगहरू: १५-२५ मिनेट (OpenAI प्रोभिजनिङ ढिलो हुन्छ)

```bash
# प्रगति जाँच गर्नुहोस्
azd show

# यदि ३० मिनेटभन्दा बढी अड्किएको छ भने, Azure Portal जाँच गर्नुहोस्:
azd monitor --overview
# असफल परिनियोजनहरू खोज्नुहोस्
```
</details>

<details>
<summary><strong>❌ "अनुमति अस्वीकृत" वा "प्रतिबन्धित"</strong></summary>

```bash
# आफ्नो Azure रोल जाँच गर्नुहोस्
az role assignment list --assignee $(az account show --query user.name -o tsv)

# तपाईलाई कम्तीमा "Contributor" रोल आवश्यक छ
# आफ्नो Azure प्रशासकलाई सोध्नुहोस्:
# - Contributor (स्रोतहरूको लागि)
# - User Access Administrator (रोल असाइनमेन्टहरूको लागि)
```
</details>

<details>
<summary><strong>❌ डिप्लोय गरिएको एप्लिकेशन URL फेला पार्न सकिएन</strong></summary>

```bash
# सबै सेवा अन्त बिन्दुहरू देखाउनुहोस्
azd show

# वा Azure पोर्टल खोल्नुहोस्
azd monitor

# विशेष सेवा जाँच गर्नुहोस्
azd env get-values
# *_URL भेरिएबलहरू खोज्नुहोस्
```
</details>

### 📚 पूर्ण समस्या समाधान स्रोतहरू

- **सामान्य समस्या गाइड:** [बिस्तृत समाधानहरू](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-विशेष समस्या:** [AI समस्या समाधान](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **डिबगिंग गाइड:** [चरण-द्वारा-चरण डिबगिंग](docs/chapter-07-troubleshooting/debugging.md)
- **मद्दत लिनुहोस्:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 पाठ्यक्रम पूरा गर्नुहोस् र प्रमाणपत्र प्राप्त गर्नुहोस्

### प्रगति ट्र्याकिङ
प्रत्येक अध्याय मार्फत आफ्नो सिकाइ प्रगति ट्र्याक गर्नुहोस्:

- [ ] **अध्याय १**: आधार र छिटो सुरु ✅
- [ ] **अध्याय २**: AI-प्रथम विकास ✅  
- [ ] **अध्याय ३**: कन्फिगरेसन र प्रमाणिकरण ✅
- [ ] **अध्याय ४**: इन्फ्रास्ट्रक्चर ऐज कोड र डिप्लोयमेन्ट ✅
- [ ] **अध्याय ५**: बहु-एजेन्ट AI समाधानहरू ✅
- [ ] **अध्याय ६**: पूर्व-डिप्लोयमेन्ट प्रमाणीकरण र योजना ✅
- [ ] **अध्याय ७**: समस्या समाधान र डिबगिंग ✅
- [ ] **अध्याय ८**: उत्पादन र उद्यम नमूनाहरू ✅

### सिकाइ प्रमाणीकरण
प्रत्येक अध्याय पूर्ण गरेपछि, आफ्नो ज्ञान प्रमाणीकरण गर्नुहोस्:
१. **व्यावहारिक अभ्यास**: अध्यायको व्यवहारिक डिप्लोयमेन्ट पूरा गर्नुहोस्
२. **ज्ञान परीक्षण**: आफ्नो अध्यायको FAQ खण्ड समीक्षा गर्नुहोस्
३. **समुदाय छलफल**: Azure Discord मा आफ्नो अनुभव साझा गर्नुहोस्
४. **अर्को अध्याय**: अर्को जटिलता स्तरमा जानुहोस्

### पाठ्यक्रम पूरा गर्दा प्राप्त लाभहरू
सबै अध्यायहरु पूरा गरेपछि तपाईंहरूसँग हुनेछ:
- **उत्पादन अनुभव**: Azure मा वास्तविक AI अनुप्रयोगहरू डिप्लोय गरिएको
- **व्यावसायिक कौशलहरू**: उद्यम-तयार डिप्लोयमेन्ट क्षमता  
- **समुदाय मान्यता**: Azure विकासकर्ता समुदायका सक्रिय सदस्य
- **क्यारियर प्रगति**: मागको AZD र AI डिप्लोयमेन्ट विशेषज्ञता

---

## 🤝 समुदाय र सहायता

### मद्दत र समर्थन प्राप्त गर्नुहोस्
- **प्राविधिक समस्या**: [बग रिपोर्ट गर्नुहोस् र सुविधाहरू अनुरोध गर्नुहोस्](https://github.com/microsoft/azd-for-beginners/issues)
- **सिकाइ प्रश्नहरू**: [Microsoft Azure Discord समुदाय](https://discord.gg/microsoft-azure) र [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-विशेष सहायता**: [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) मा सामेल सिर्नुहोस्
- **दस्तावेजीकरण**: [आधिकारिक Azure Developer CLI दस्तावेज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord बाट समुदाय अन्तर्दृष्टिहरू

**#Azure च्यानलबाट हालैको सर्वेक्षण नतिजा:**
- **४५%** विकासकर्ताहरू AZD लाई AI कार्यभारहरूका लागि प्रयोग गर्न चाहन्छन्
- **शीर्ष चुनौतीहरू**: बहु-सेवा डिप्लोयमेन्टहरू, प्रमाणपत्र व्यवस्थापन, उत्पादन तयारी  
- **सबभन्दा धेरै अनुरोध गरिएको**: AI-विशेष टेम्प्लेटहरू, समस्या समाधान गाइडहरू, उत्कृष्ट अभ्यासहरू

**हाम्रो समुदायमा सामेल भएर:**
- आफ्नो AZD + AI अनुभवहरू साझा गर्नुहोस् र मद्दत पाउनुहोस्
- नयाँ AI टेम्प्लेटहरूको प्रारम्भिक पूर्वावलोकनहरूमा पहुँच पाउनुहोस्
- AI डिप्लोयमेन्ट उत्कृष्ट अभ्यासहरूमा योगदान गर्नुहोस्
- भविष्यका AI + AZD सुविधाहरू विकासमा प्रभाव पार्नुहोस्

### पाठ्यक्रममा योगदान गर्नुहोस्
हामी योगदानहरू स्वागत गर्छौं! कृपया हाम्रो [योगदान गर्ने गाइड](CONTRIBUTING.md) पढ्नुहोस् जहाँ विवरण छन्:
- **सामग्री सुधारहरू**: विद्यमान अध्याय र उदाहरणहरू सुधार गर्नुहोस्
- **नयाँ उदाहरणहरू**: वास्तविक-विश्व परिदृश्यहरू र टेम्प्लेटहरू थप्नुहोस्  
- **अनुवाद**: बहुभाषी समर्थनमा सहयोग गर्नुहोस्
- **बग रिपोर्टहरू**: शुद्धता र स्पष्टता सुधार गर्नुहोस्
- **समुदाय मानकहरू**: हाम्रो समावेशी समुदाय दिशानिर्देशहरू पालना गर्नुहोस्

---

## 📄 पाठ्यक्रम जानकारी

### अनुमति पत्र
यो परियोजना MIT License अन्तर्गत अनुमत छ - विवरणका लागि [LICENSE](../../LICENSE) फाइल हेर्नुहोस्।

### सम्बन्धित Microsoft सिकाइ स्रोतहरू

हाम्रो टोलीले अन्य समग्र सिकाइ पाठ्यक्रमहरू उत्पादन गर्दछ:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / एजेन्टहरू
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
 
### कोर सिकाइ
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### कापाइलट सिरिज
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ कोर्स नेभिगेसन

**🚀 सिक्न तयार हुनुहुन्छ?**

**शुरुआतीहरू**: [अध्याय १: आधारशिला र छिटो सुरुवात](#-chapter-1-foundation--quick-start) बाट सुरु गर्नुहोस्  
**एआई विकासकर्ता**: [अध्याय २: एआई-प्रथम विकास](#-chapter-2-ai-first-development-recommended-for-ai-developers) मा जानुहोस्  
**अनुभवी विकासकर्ता**: [अध्याय ३: कन्फिगरेसन र प्रमाणीकरण](#️-chapter-3-configuration--authentication) बाट शुरू गर्नुहोस्

**अर्को चरणहरू**: [अध्याय १ - AZD आधारहरू सुरु गर्नुहोस्](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->