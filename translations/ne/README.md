# सुरुवातीहरूका लागि AZD: एक संरचित सिकाइ यात्रा

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

> **स्थानीय रूपमा क्लोन गर्न मन पराउने?**
>
> यो रिपोजिटरीमा ५०+ भाषाका अनुवादहरू छन् जसले डाउनलोड साइज धेरै बढाउँछ। अनुवादविना क्लोन गर्न, sparse checkout प्रयोग गर्नुहोस्:
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
> यसले तपाईंलाई कोर्स पूरा गर्न आवश्यक सबै कुरा छिटो डाउनलोडसहित दिन्छ।
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 आजको azd मा के नयाँ छ

Azure Developer CLI परम्परागत वेब एप र API बाहिर फैलिएको छ। आज, azd सबै प्रकारका एप्लिकेसनहरू Azure मा तैनाथ गर्न एउटै उपकरण हो—जसमा AI-संचालित एप र बौद्धिक एजेन्टहरू समेत छन्।

यसको अर्थ तपाईंका लागि:

- **AI एजेन्टहरू अब पहिलो श्रेणीका azd कार्यभार हुन्।** तपाईंले पहिले नै परिचित `azd init` → `azd up` कार्यप्रवाह प्रयोग गरेर AI एजेन्ट परियोजनाहरू आरम्भ, तैनाथ र व्यवस्थापन गर्न सक्नुहुन्छ।
- **Microsoft Foundry समाकलन** मोडल तैनाथीकरण, एजेन्ट होस्टिंग, र AI सेवा कन्फिगरेसन सिधै azd टेम्प्लेट इकोसिस्टममा लैजान्छ।
- **मूल कार्यप्रवाहमा कुनै परिवर्तन भएको छैन।** तपाईंले एउटा todo एप, माइक्रोसर्भिस, वा बहु-एजेन्ट AI समाधान तैनाथ गर्दा आदेशहरू त्यही हुन्छन्।

यदि तपाईंले पहिले azd प्रयोग गर्नुभएको छ भने, AI समर्थन स्वाभाविक विस्तार हो—अतिरिक्त उपकरण वा उन्नत ट्रयाक होइन। यदि नयाँ हुनुहुन्छ भने, तपाईंले एउटै कार्यप्रवाह सिक्नुहुनेछ जुन सबैका लागि काम गर्छ।

---

## 🚀 Azure Developer CLI (azd) के हो?

**Azure Developer CLI (azd)** एक विकासकर्तामैत्री कमाण्ड-लाइन उपकरण हो जसले Azure मा एप्लिकेसन तैनाथ गर्न सजिलो बनाउँछ। धेरै Azure स्रोतहरूलाई म्यानुअली सिर्जना र जडान गर्ने सट्टा, तपाईंले एउटा आदेशले सम्पूर्ण एप्लिकेसन तैनाथ गर्न सक्नुहुन्छ।

### `azd up` को जादू

```bash
# यो एकल आदेशले सबै कुरा गर्छ:
# ✅ सबै Azure स्रोतहरू सिर्जना गर्छ
# ✅ नेटवर्किङ र सुरक्षा कन्फिगर गर्छ
# ✅ तपाईंको एप्लिकेसन कोड बनाउँछ
# ✅ Azure मा तैनाथ गर्छ
# ✅ तपाईंलाई काम गर्ने URL दिन्छ
azd up
```

**त्यहाँ समाप्त!** Azure Portal मा क्लिक गर्नुपर्दैन, जटिल ARM टेम्प्लेटहरू पहिले सिक्न पर्दैन, म्यानुअल कन्फिगरेसन छैन—सिधै Azure मा काम गर्ने एपहरू।

---

## ❓ Azure Developer CLI र Azure CLI: के फरक छ?

यो सुरूवातकर्ताहरूले अक्सर सोध्ने सबैभन्दा सामान्य प्रश्न हो। यहाँ सरल जवाफ छ:

| सुविधा | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **उद्देश्य** | व्यक्तिगत Azure स्रोतहरू व्यवस्थापन गर्न | सम्पूर्ण एप्लिकेसन तैनाथ गर्न |
| **सोचाइ** | पूर्वाधार-केन्द्रित | एप्लिकेसन-केन्द्रित |
| **उदाहरण** | `az webapp create --name myapp...` | `azd up` |
| **सिकाइको अवस्था** | Azure सेवाहरू जान्न आवश्यक | तपाईंको एप मात्र जान्नुपर्छ |
| **उत्तम प्रयोगकर्ता** | DevOps, पूर्वाधार | विकासकर्ता, प्रोटोटाइपिङ्ग |

### सरल तुलना

- **Azure CLI** त राम्रोसंग घर बनाउन सबै उपकरणहरू जस्तै हो - हातौडा, आरी, पाँच। तपाईं केही पनि बनाउन सक्नुहुन्छ, तर निर्माण जान्नुपर्छ।
- **Azure Developer CLI** भने कसैलाई भाडामा लिए जस्तो हो - तपाईंले के चाहनुहुन्छ भन्नुहुन्छ, र उनीहरूले बनाइदिन्छन्।

### कहिले कुन प्रयोग गर्ने

| परिदृश्य | यसलाई प्रयोग गर्नुहोस् |
|----------|------------------|
| "म मेरो वेब एप छिटो तैनाथ गर्न चाहन्छु" | `azd up` |
| "म केवल स्टोरेज अकाउन्ट बनाउन चाहन्छु" | `az storage account create` |
| "म पूर्ण AI एप निर्माण गर्दैछु" | `azd init --template azure-search-openai-demo` |
| "म कुनै विशिष्ट Azure स्रोत डिबग गर्न चाहन्छु" | `az resource show` |
| "मिनेटमा उत्पादन-तयार तैनाथीकरण चाहन्छु" | `azd up --environment production` |

### तिनीहरू सँगै काम गर्छन्!

AZD ले Azure CLI लाई भित्रै प्रयोग गर्छ। तपाईं दुबै प्रयोग गर्न सक्नुहुन्छ:
```bash
# AZD प्रयोग गरेर आफ्नो एप तैनाथ गर्नुहोस्
azd up

# त्यसपछि Azure CLI प्रयोग गरेर विशेष स्रोतहरूलाई सुक्ष्म रूपमा अनुकूलन गर्नुहोस्
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD मा टेम्प्लेटहरू खोज्नुहोस्

सुरुबाट बनाउनु पर्दैन! **Awesome AZD** तयार-तैनाथ टेम्प्लेटहरूको समुदाय संग्रह हो:

| स्रोत | विवरण |
|----------|-------------|
| 🔗 [**Awesome AZD ग्यालेरी**](https://azure.github.io/awesome-azd/) | २००+ टेम्प्लेटहरू ब्राउज र एक क्लिक तैनाथीकरण |
| 🔗 [**टेम्प्लेट पेश गर्नुहोस्**](https://github.com/Azure/awesome-azd/issues) | आफ्नो टेम्प्लेट समुदायलाई योगदान गर्नुहोस् |
| 🔗 [**GitHub रिपोजिटरी**](https://github.com/Azure/awesome-azd) | स्टार गर्नुहोस् र स्रोत खोज्नुहोस् |

### Awesome AZD बाट लोकप्रिय AI टेम्प्लेटहरू

```bash
# RAG च्याट Microsoft Foundry मोडेलहरू र AI सर्चसँग
azd init --template azure-search-openai-demo

# छिटो AI च्याट अनुप्रयोग
azd init --template openai-chat-app-quickstart

# AI एजेन्टहरू Foundry एजेन्टहरूसँग
azd init --template get-started-with-ai-agents
```

---

## 🎯 ३ चरणमा सुरु गर्ने तरिका

सुरु गर्नु अघि, तपाईंले तैनाथ गर्न चाहनुभएको टेम्प्लेटका लागि आफ्नो मेसिन तयार छ भनी सुनिश्चित गर्नुहोस्:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

यदि कुनै आवश्यक जाँच असफल भयो भने, पहिले त्यसलाई ठीक गर्नुहोस् र छिटो सुरु जारी राख्नुहोस्।

### चरण १: AZD स्थापना गर्नुहोस् (२ मिनेट)

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

### चरण २: AZD को लागि प्रमाणीकरण गर्नुहोस्

```bash
# यदि तपाईं यस पाठ्यक्रममा Azure CLI कमाण्डहरू सिधै प्रयोग गर्ने योजना बनाउनु भएको छ भने वैकल्पिक
az login

# AZD कार्यप्रवाहहरूको लागि आवश्यक
azd auth login
```

तपाईंलाई कुन चाहिन्छ थाहा छैन भने, [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup) बाट पूरै सेटअप फ्लो अनुसरण गर्नुहोस्।

### चरण ३: आफ्नो पहिलो एप तैनाथ गर्नुहोस्

```bash
# टेम्पलेटबाट आरम्भ गर्नुहोस्
azd init --template todo-nodejs-mongo

# Azure मा परिनियोजन गर्नुहोस् (सबै कुरा सिर्जना गर्दछ!)
azd up
```

**🎉 समाप्त!** तपाईंको एप अब Azure मा लाइभ छ।

### सफाई गर्नुहोस् (बिर्सनु हुन्न!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 यो कोर्स कसरी प्रयोग गर्ने

यो कोर्स **क्रमिक सिकाइ** का लागि डिजाइन गरिएको हो—जहाँ तपाईं सहज महसुस गर्नुहुन्छ त्यहाँबाट सुरु गर्नुहोस् र क्रमशः अगाडि बढ्नुहोस्:

| तपाईंको अनुभव | यहाँबाट सुरु गर्नुहोस् |
|-----------------|------------|
| **Azure मा नयाँ** | [अध्याय १: आधारभूत](#-chapter-1-foundation--quick-start) |
| **Azure जान्नुहुन्छ, AZD नयाँ हो** | [अध्याय १: आधारभूत](#-chapter-1-foundation--quick-start) |
| **AI एप तैनाथ गर्न चाहनुहुन्छ** | [अध्याय २: AI-प्रथम विकास](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **हात-भएन अभ्यास चाहिन्छ** | [🎓 अन्तरक्रियात्मक कार्यशाला](workshop/README.md) - ३-४ घण्टे अनुदेशा पूर्ण प्रयोगशाला |
| **उत्पादन नमुना चाहिन्छ** | [अध्याय ८: उत्पादन र उद्यम नमुनाहरू](#-chapter-8-production--enterprise-patterns) |

### छिटो सेटअप

1. **यो रिपोजिटरी फोर्क गर्नुहोस्**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **क्लोन गर्नुहोस्**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **मद्दत पाउनुहोस्**: [Azure Discord समुदाय](https://discord.com/invite/ByRwuEEgH4)

> **स्थानीय रूपमा क्लोन गर्न मन पराउने?**

> यो रिपोजिटरीमा ५०+ भाषाका अनुवादहरू छन् जसले डाउनलोड साइज धेरै बढाउँछ। अनुवादविना क्लोन गर्न, sparse checkout प्रयोग गर्नुहोस्:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> यसले तपाईंलाई कोर्स पूरा गर्न आवश्यक सबै कुरा छिटो डाउनलोडसहित दिन्छ।

## कोर्स अवलोकन

क्रमिक सिकाइका लागि डिजाइन गरिएका अध्यायहरू मार्फत Azure Developer CLI (azd) मा पारंगत बन्नुहोस्। **Microsoft Foundry समाकलनसहित AI एप तैनाथीकरणमा विशेष जोड।**

### किन यो कोर्स आधुनिक विकासकर्ताहरूका लागि आवश्यक छ

Microsoft Foundry Discord समुदायका अन्तर्दृष्टिहरूमा आधारित, **४५% विकासकर्ताहरूले AI कार्यभारहरूको लागि AZD प्रयोग गर्न चाहन्छन्** तर सामना गर्छन्:
- जटिल बहु-सेवा AI आर्किटेक्चरहरू
- उत्पादन AI तैनाथीकरणका उत्कृष्ट अभ्यासहरू
- Azure AI सेवा समाकलन र कन्फिगरेसन
- AI कार्यभारहरूको लागत अनुकूलन
- AI-विशिष्ट तैनाथीकरण समस्याहरू समाधान

### सिकाइ लक्षितहरू

यो संरचित कोर्स पूरा गरेर, तपाईंले:
- **AZD को आधारहरूमा पारंगत बन्नुहोस्**: मुख्य अवधारणा, स्थापना र कन्फिगरेसन
- **AI एप्लिकेसन तैनाथ गर्नुहोस्**: Microsoft Foundry सेवासँग AZD प्रयोग गर्नुहोस्
- **पूर्वाधारलाई कोडको रूपमा कार्यान्वयन गर्नुहोस्**: Bicep टेम्प्लेट मार्फत Azure स्रोतहरू व्यवस्थापन गर्नुहोस्
- **तैनाथीकरण समस्या समाधान गर्नुहोस्**: सामान्य समस्याहरू समाधान र डिबग गर्नुहोस्
- **उत्पादनका लागि अनुकूलन गर्नुहोस्**: सुरक्षा, स्केलिङ, अनुगमन, र लागत व्यवस्थापन
- **बहु-एजेन्ट समाधान निर्माण गर्नुहोस्**: जटिल AI आर्किटेक्चर तैनाथ गर्नुहोस्

## सुरु गर्नु अघि: खाताहरू, पहुँचहरू, र मान्यताहरू

अध्याय १ सुरु गर्नु अघि, सुनिश्चित गर्नुहोस् कि यी आधारभूत कुराहरू तयार छन्। यस मार्गदर्शकको पछि आउने स्थापना चरणहरूले यी आधारहरू पहिले नै व्यवस्थापन गरिएको मान्छ।
- **एउटा Azure सदस्यता**: तपाईंले आफ्नो काम वा आफ्नो खाता बाट पहिले देखि रहेको सदस्यता प्रयोग गर्न सक्नुहुन्छ, वा सुरु गर्नका लागि [निःशुल्क परीक्षण](https://aka.ms/azurefreetrial) सिर्जना गर्न सक्नुहुन्छ।
- **Azure स्रोतहरू सिर्जना गर्ने अनुमति**: अधिकांश अभ्यासहरूको लागि, तपाईंले लक्षित सदस्यता वा स्रोत समूहमा कम्तिमा **सहयोगी** पहुँच हुनु पर्छ। केही अध्यायहरूले स्रोत समूहहरू, व्यवस्थापन गरिएको पहिचानहरू, र RBAC असाइनमेन्टहरू सिर्जना गर्न सक्ने सोच राख्न सक्छन्।
- [**GitHub खाता**](https://github.com): यो रेपोजिटरी फोर्क गर्न, आफ्नै परिवर्तनहरू ट्र्याक गर्न, र कार्यशालाका लागि GitHub Codespaces प्रयोग गर्न उपयोगी हुन्छ।
- **ढाँचा रनटाइम पूर्वआवश्यकताहरू**: केही ढाँचाहरूलाई Node.js, Python, Java, वा Docker जस्ता स्थानीय उपकरणहरू चाहिन्छ। सुरु गर्नु अघि सेटअप मान्यकर्ता चलाउनुहोस् ताकि छुटेका उपकरणहरू चाँडै थाहा होस्।
- **आधारभूत टर्मिनल परिचितता**: तपाईं विशेषज्ञ हुन आवश्यक छैन, तर `git clone`, `azd auth login`, र `azd up` जस्ता आदेशहरू चलाउन सहज हुनु पर्छ।

> **एउटा उद्यम सदस्यतामा काम गर्दै हुनुहुन्छ?**
> यदि तपाईंको Azure वातावरण प्रशासक द्वारा व्यवस्थापन गरिएको छ भने, तपाईंले योजना बनाउनुभएको सदस्यता वा स्रोत समूहमा स्रोतहरू तैनाथ गर्न सक्नुहुन्छ भनी समय अगाडि पुष्टि गर्नुहोस्। नसक्दा, सुरु गर्नु अघि स्यान्डबक्स सदस्यता वा सहयोगी पहुँचको अनुरोध गर्नुहोस्।

> **Azure मा नयाँ हुनुहुन्छ?**
> आफ्नै Azure परीक्षण वा pay-as-you-go सदस्यता https://aka.ms/azurefreetrial बाट सुरु गर्नुहोस् ताकि अभ्यासहरू अन्त्यसम्म पूरा गर्न सक्नुहुन्छ र टेनन्ट-स्तर अनुमति पर्खनुपर्दैन।

## 🗺️ कोर्स नक्सा: अध्याय अनुसार छिटो नेभिगेसन

प्रत्येक अध्यायसँग अध्ययन उद्देश्य, छिटो सुरु, र अभ्यासहरूको समर्पित README छ:

| अध्याय | विषय | पाठहरू | अवधि | जटिलता |
|---------|-------|---------|----------|------------|
| **[अध्याय १: आधारशिला](docs/chapter-01-foundation/README.md)** | शुरुवात | [AZD आधारभूत](docs/chapter-01-foundation/azd-basics.md) &#124; [स्थापना](docs/chapter-01-foundation/installation.md) &#124; [पहिलो परियोजना](docs/chapter-01-foundation/first-project.md) | ३०-४५ मिनेट | ⭐ |
| **[अध्याय २: AI विकास](docs/chapter-02-ai-development/README.md)** | AI-प्रथम अनुप्रयोगहरू | [Foundry एकीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI एजेन्टहरू](docs/chapter-02-ai-development/agents.md) &#124; [मोडेल तैनाथी](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [कार्यशाला](docs/chapter-02-ai-development/ai-workshop-lab.md) | १-२ घण्टा | ⭐⭐ |
| **[अध्याय ३: कन्फिगरेसन](docs/chapter-03-configuration/README.md)** | प्रमाणीकरण र सुरक्षा | [कन्फिगरेसन](docs/chapter-03-configuration/configuration.md) &#124; [प्रमाणीकरण र सुरक्षा](docs/chapter-03-configuration/authsecurity.md) | ४५-६० मिनेट | ⭐⭐ |
| **[अध्याय ४: पूर्वाधार](docs/chapter-04-infrastructure/README.md)** | IaC र तैनाथी | [तैनाथी मार्गदर्शक](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [प्रावधान](docs/chapter-04-infrastructure/provisioning.md) | १-१.५ घण्टा | ⭐⭐⭐ |
| **[अध्याय ५: बहु-एजेन्ट](docs/chapter-05-multi-agent/README.md)** | AI एजेन्ट समाधानहरू | [खुद्रा परिदृश्य](examples/retail-scenario.md) &#124; [समन्वय ढाँचाहरू](docs/chapter-06-pre-deployment/coordination-patterns.md) | २-३ घण्टा | ⭐⭐⭐⭐ |
| **[अध्याय ६: पूर्व-तैनाथी](docs/chapter-06-pre-deployment/README.md)** | योजना र मान्यता | [पूर्वउडान जाँचहरू](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [क्षमता योजना](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU छनोट](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [एप्लिकेशन अन्तर्दृष्टि](docs/chapter-06-pre-deployment/application-insights.md) | १ घण्टा | ⭐⭐ |
| **[अध्याय ७: समस्या समाधान](docs/chapter-07-troubleshooting/README.md)** | डिबग र सुधार | [सामान्य समस्या](docs/chapter-07-troubleshooting/common-issues.md) &#124; [डिबगिंग](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI समस्या](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | १-१.५ घण्टा | ⭐⭐ |
| **[अध्याय ८: उत्पादन](docs/chapter-08-production/README.md)** | उद्यम ढाँचाहरू | [उत्पादन अभ्यासहरू](docs/chapter-08-production/production-ai-practices.md) | २-३ घण्टा | ⭐⭐⭐⭐ |
| **[🎓 कार्यशाला](workshop/README.md)** | व्यावहारिक प्रयोगशाला | [परिचय](workshop/docs/instructions/0-Introduction.md) &#124; [छान्नुहोस्](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [मान्यता गर्नुहोस्](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [टुक्र्याउनुहोस्](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [कन्फिगर गर्नुहोस्](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [अनुकूलन गर्नुहोस्](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [पुनःतह गर्नुहोस्](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [समापन](workshop/docs/instructions/7-Wrap-up.md) | ३-४ घण्टा | ⭐⭐ |

**कुल कोर्स अवधि:** ~१०-१४ घण्टा | **कौशल प्रगति:** प्रारम्भिक → उत्पादन-तैयार

---

## 📚 अध्ययन अध्यायहरू

*अनुभव स्तर र लक्ष्य अनुसार आफ्नो अध्ययन मार्ग छनौट गर्नुहोस्*

### 🚀 अध्याय १: आधारशिला र छिटो सुरु
**पूर्वआवश्यकताहरू**: Azure सदस्यता, आधारभूत कमाण्ड लाइन ज्ञान  
**अवधि**: ३०-४५ मिनेट  
**जटिलता**: ⭐

#### तपाईंले के सिक्नुहुनेछ
- Azure Developer CLI को आधारभूत ज्ञान
- तपाईको प्लेटफर्ममा AZD स्थापना
- तपाईंको पहिलो सफल तैनाथी

#### अध्ययन स्रोतहरू
- **🎯 यहाँबाट सुरु गर्नुहोस्**: [Azure Developer CLI के हो?](#what-is-azure-developer-cli)
- **📖 सिद्धान्त**: [AZD आधारभूत](docs/chapter-01-foundation/azd-basics.md) - मुख्य अवधारणाहरू र शब्दावली
- **⚙️ सेटअप**: [स्थापना र सेटअप](docs/chapter-01-foundation/installation.md) - प्लेटफर्म-विशेष मार्गदर्शकहरू
- **🛠️ व्यावहारिक**: [तपाईंको पहिलो परियोजना](docs/chapter-01-foundation/first-project.md) - चरण-दर-चरण ट्युटोरियल
- **📋 चाँडो संदर्भ**: [कमान्ड चिट शीट](resources/cheat-sheet.md)

#### व्यावहारिक अभ्यासहरू
```bash
# छिटो स्थापना जाँच
azd version

# तपाईंको पहिलो अनुप्रयोग परिनियोजन गर्नुहोस्
azd init --template todo-nodejs-mongo
azd up
```

**💡 अध्याय नतिजा**: AZD प्रयोग गरेर Azure मा सरल वेब अनुप्रयोग सफलतापूर्वक तैनाथ गर्नुहोस्

**✅ सफलता पुष्टि:**
```bash
# अध्याय १ पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
azd version              # इन्स्टल गरिएको संस्करण देखाउँछ
azd init --template todo-nodejs-mongo  # परियोजना प्रारम्भ गर्दछ
azd up                  # अज्योरमा तैनाथ गर्दछ
azd show                # चलिरहेको एपको URL प्रदर्शन गर्दछ
# अनुप्रयोग ब्राउजरमा खुल्छ र काम गर्छ
azd down --force --purge  # स्रोतहरू सफा गर्दछ
```

**📊 समय लगानी:** ३०-४५ मिनेट  
**📈 योग्यता स्तर पछि:** आधारभूत अनुप्रयोगहरू स्वतन्त्र रूपमा तैनाथ गर्न सक्षम

---

### 🤖 अध्याय २: AI-प्रथम विकास (AI विकासकर्ताहरूका लागि सिफारिस गरिएको)
**पूर्वआवश्यकताहरू**: अध्याय १ पूरा भएको  
**अवधि**: १-२ घण्टा  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- AZD सँग Microsoft Foundry एकीकरण
- AI-संचालित अनुप्रयोगहरू तैनाथी
- AI सेवा कन्फिगरेसनहरू बुझ्न

#### अध्ययन स्रोतहरू
- **🎯 यहाँबाट सुरु गर्नुहोस्**: [Microsoft Foundry एकीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI एजेन्टहरू**: [AI एजेन्ट मार्गदर्शक](docs/chapter-02-ai-development/agents.md) - AZD सँग बौद्धिक एजेन्टहरू तैनाथ गर्नुहोस्
- **📖 ढाँचाहरू**: [AI मोडेल तैनाथी](docs/chapter-02-ai-development/ai-model-deployment.md) - AI मोडेलहरू तैनाथ र व्यवस्थापन गर्नुहोस्
- **🛠️ कार्यशाला**: [AI कार्यशाला प्रयोगशाला](docs/chapter-02-ai-development/ai-workshop-lab.md) - तपाईंको AI समाधान AZD-तैयार बनाउनुहोस्
- **🎥 अन्तरक्रियात्मक मार्गदर्शक**: [कार्यशाला सामग्रीहरू](workshop/README.md) - MkDocs * DevContainer वातावरणसहित ब्राउजरमा अध्ययन
- **📋 टेम्प्लेटहरू**: [Microsoft Foundry टेम्प्लेटहरू](#कार्यशाला-स्रोतहरू)
- **📝 उदाहरणहरू**: [AZD तैनाथी उदाहरणहरू](examples/README.md)

#### व्यावहारिक अभ्यासहरू
```bash
# आफ्नो पहिलो एआई अनुप्रयोग तैनाथ गर्नुहोस्
azd init --template azure-search-openai-demo
azd up

# थप एआई टेम्प्लेटहरू प्रयास गर्नुहोस्
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 अध्याय नतिजा**: RAG क्षमतासहित AI-संचालित च्याट अनुप्रयोग तैनाथ र कन्फिगर गर्नुहोस्

**✅ सफलता पुष्टि:**
```bash
# अध्याय 2 पछि, तपाईले सक्षम हुनु पर्छ:
azd init --template azure-search-openai-demo
azd up
# एआई च्याट इन्टरफेस परीक्षण गर्नुहोस्
# प्रश्नहरू सोध्नुहोस् र स्रोतहरू सहित एआई-शक्तिशाली उत्तरहरू प्राप्त गर्नुहोस्
# खोजी समाकलन कार्यरत छ कि छैन पुष्टि गर्नुहोस्
azd monitor  # एप्लिकेशन इन्साइट्सले टेलिमेट्री देखाउँछ कि छैन जाँच्नुहोस्
azd down --force --purge
```

**📊 समय लगानी:** १-२ घण्टा  
**📈 योग्यता स्तर पछि:** उत्पादन-तैयार AI अनुप्रयोगहरू तैनाथ र कन्फिगर गर्न सक्षम  
**💰 लागत जानकारी:** $८०-१५०/महिना विकास लागत, $३००-३५००/महिना उत्पादन लागत बुझ्नुहोस्

#### 💰 AI तैनाथीका लागि लागत विचारहरू

**विकास वातावरण (अनुमानित $८०-१५०/महिना):**
- Microsoft Foundry मोडेलहरू (Pay-as-you-go): $०-५०/महिना (टोकन उपयोग अनुसार)
- AI खोज (बेसिक तह): $७५/महिना
- कन्टेनर अनुप्रयोगहरू (खपत): $०-२०/महिना
- संग्रहण (मानक): $१-५/महिना

**उत्पादन वातावरण (अनुमानित $३००-३,५००+/महिना):**
- Microsoft Foundry मोडेलहरू (PTU स्थिर प्रदर्शनका लागि): $३,०००+/महिना अथवा उच्च मात्रा pay-as-you-go
- AI खोज (मानक तह): $२५०/महिना
- कन्टेनर अनुप्रयोगहरू (समर्पित): $५०-१००/महिना
- एप्लिकेशन अन्तर्दृष्टि: $५-५०/महिना
- संग्रहण (प्रीमियम): $१०-५०/महिना

**💡 लागत अनुकूलन सुझावहरू:**
- सिकाइका लागि **नि:शुल्क तह** Microsoft Foundry मोडेलहरू प्रयोग गर्नुहोस् (Azure OpenAI ५०,००० टोकन/महिना समावेश)
- सक्रिय विकास हुँदैन भने `azd down` चलाएर स्रोतहरू डीलोकेट गर्नुहोस्
- सुरुमा खपत-आधारित बिलिङ प्रयोग गर्नुहोस्, उत्पादनका लागि मात्र PTU मा उन्नत गर्नुहोस्
- तैनाथी अघि लागत अनुमान गर्न `azd provision --preview` प्रयोग गर्नुहोस्
- अटो-स्केलिंग सक्षम गर्नुहोस्: वास्तविक उपयोगको मात्र भुक्तानी गर्नुहोस्

**लागत निगरानी:**
```bash
# अनुमानित मासिक लागतहरू जाँच गर्नुहोस्
azd provision --preview

# Azure पोर्टलमा वास्तविक लागतहरू अनुगमन गर्नुहोस्
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ अध्याय ३: कन्फिगरेसन र प्रमाणीकरण
**पूर्वआवश्यकताहरू**: अध्याय १ पूरा भएको  
**अवधि**: ४५-६० मिनेट  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- वातावरण कन्फिगरेसन र व्यवस्थापन
- प्रमाणीकरण र सुरक्षा उत्तम अभ्यासहरू
- स्रोत नामांकन र संगठन

#### अध्ययन स्रोतहरू
- **📖 कन्फिगरेसन**: [कन्फिगरेसन गाइड](docs/chapter-03-configuration/configuration.md) - वातावरण सेटअप
- **🔐 सुरक्षा**: [प्रमाणीकरण ढाँचाहरू र व्यवस्थापन गरिएको पहिचान](docs/chapter-03-configuration/authsecurity.md) - प्रमाणीकरण ढाँचाहरू
- **📝 उदाहरणहरू**: [डेटाबेस एप उदाहरण](examples/database-app/README.md) - AZD डेटाबेस उदाहरणहरू

#### व्यावहारिक अभ्यासहरू
- विभिन्न वातावरणहरू (dev, staging, prod) कन्फिगर गर्नुहोस्
- व्यवस्थापन गरिएको पहिचान प्रमाणीकरण सेटअप गर्नुहोस्
- वातावरण-विशिष्ट कन्फिगरेसनहरू कार्यान्वयन गर्नुहोस्

**💡 अध्याय नतिजा**: उचित प्रमाणीकरण र सुरक्षासहित बहु वातावरण व्यवस्थापन गर्नुहोस्

---

### 🏗️ अध्याय ४: कोडको रूपमा पूर्वाधार र तैनाथी
**पूर्वआवश्यकताहरू**: अध्याय १-३ पूरा भएका  
**अवधि**: १-१.५ घण्टा  
**जटिलता**: ⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- उन्नत तैनाथी ढाँचाहरू
- Bicep सँग पूर्वाधार कोडको रूपमा
- स्रोत प्रावधान रणनीतिहरू

#### अध्ययन स्रोतहरू
- **📖 तैनाथी**: [तैनाथी मार्गदर्शक](docs/chapter-04-infrastructure/deployment-guide.md) - पूर्ण कार्यप्रवाहहरू
- **🏗️ प्रावधान**: [स्रोत प्रावधान](docs/chapter-04-infrastructure/provisioning.md) - Azure स्रोत व्यवस्थापन
- **📝 उदाहरणहरू**: [कन्टेनर एप्लिकेशन उदाहरण](../../examples/container-app) - कन्टेनरयुक्त तैनाथीहरू

#### व्यावहारिक अभ्यासहरू
- निजीकृत Bicep टेम्प्लेटहरू सिर्जना गर्नुहोस्
- बहु-सेवा अनुप्रयोगहरू तैनाथ गर्नुहोस्
- निलो-हरियो तैनाथी रणनीतिहरू कार्यान्वयन गर्नुहोस्

**💡 अध्याय नतिजा**: निजीकृत पूर्वाधार टेम्प्लेट प्रयोग गरी जटिल बहु-सेवा अनुप्रयोगहरू तैनाथ गर्नुहोस्

---

### 🎯 अध्याय ५: बहु-एजेन्ट AI समाधानहरू (उन्नत)
**पूर्वआवश्यकताहरू**: अध्याय १-२ पूरा भएका  
**अवधि**: २-३ घण्टा  
**जटिलता**: ⭐⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- बहु-एजेन्ट वास्तुकला ढाँचाहरू
- एजेन्ट समन्वय र तालमेल
- उत्पादन-तैयार AI तैनाथीहरू

#### अध्ययन स्रोतहरू
- **🤖 विशेष परियोजना**: [खुद्रा बहु-एजेन्ट समाधान](examples/retail-scenario.md) - पूर्ण कार्यान्वयन
- **🛠️ ARM टेम्प्लेटहरू**: [ARM टेम्प्लेट प्याकेज](../../examples/retail-multiagent-arm-template) - एक-क्लिक तैनाथी
- **📖 वास्तुकला**: [बहु-एजेन्ट समन्वय ढाँचाहरू](docs/chapter-06-pre-deployment/coordination-patterns.md) - ढाँचाहरू

#### व्यावहारिक अभ्यासहरू
```bash
# पूर्ण खुद्रा बहु-एजेन्ट समाधान तैनाथ गर्नुहोस्
cd examples/retail-multiagent-arm-template
./deploy.sh

# एजेण्ट कन्फिगरेसनहरू अन्वेषण गर्नुहोस्
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 अध्याय नतिजा**: ग्राहक र सूची एजेन्टहरूसहित उत्पादन-तैयार बहु-एजेन्ट AI समाधान तैनाथ र व्यवस्थापन गर्नुहोस्

---

### 🔍 अध्याय ६: पूर्व-तैनाथी मान्यता र योजना
**पूर्वआवश्यकताहरू**: अध्याय ४ पूरा भएको  
**अवधि**: १ घण्टा  
**जटिलता**: ⭐⭐
#### के सिक्नुहुनेछ
- क्षमता योजना र स्रोत प्रमाणीकरण
- SKU चयन रणनीतिहरू
- पूर्व-उडान जाँच र स्वचालन

#### सिकाइ स्रोतहरू
- **📊 योजना**: [क्षमता योजना](docs/chapter-06-pre-deployment/capacity-planning.md) - स्रोत प्रमाणीकरण
- **💰 चयन**: [SKU चयन](docs/chapter-06-pre-deployment/sku-selection.md) - लागत-प्रभावकारी विकल्पहरू
- **✅ प्रमाणीकरण**: [पूर्व-उडान जाँचहरू](docs/chapter-06-pre-deployment/preflight-checks.md) - स्वचालित स्क्रिप्टहरू

#### व्यावहारिक अभ्यासहरू
- क्षमता प्रमाणीकरण स्क्रिप्टहरू चलाउनुहोस्
- लागतको लागि SKU चयनहरू अनुकूलन गर्नुहोस्
- स्वचालित पूर्व-वितरण जाँचहरू कार्यान्वयन गर्नुहोस्

**💡 अध्याय परिणाम**: कार्यान्वयन अघि प्रमाणीकरण र अनुकूलन गर्नुहोस्

---

### 🚨 अध्याय ७: समस्या समाधान र डिबगिङ
**पूर्वआवश्यकता**: कुनै पनि वितरण अध्याय पूरा भइसकेको  
**समयावधि**: १-१.५ घण्टा  
**जटिलता**: ⭐⭐

#### के सिक्नुहुनेछ
- प्रणालीगत डिबगिङ विधिहरू
- सामान्य समस्याहरू र समाधानहरू
- AI-विशेष समस्या समाधान

#### सिकाइ स्रोतहरू
- **🔧 सामान्य समस्या**: [सामान्य समस्या](docs/chapter-07-troubleshooting/common-issues.md) - FAQ र समाधानहरू
- **🕵️ डिबगिङ**: [डिबगिङ गाइड](docs/chapter-07-troubleshooting/debugging.md) - चरण-द्वारा-चरण रणनीतिहरू
- **🤖 AI समस्या**: [AI-विशेष समस्या समाधान](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI सेवा समस्या

#### व्यावहारिक अभ्यासहरू
- वितरण असफलता विश्लेषण गर्नुहोस्
- प्रमाणीकरण समस्याहरू समाधान गर्नुहोस्
- AI सेवा कनेक्टिभिटी डिबग गर्नुहोस्

**💡 अध्याय परिणाम**: स्वतन्त्र रूपमा सामान्य वितरण समस्याहरू विश्लेषण र समाधान गर्न सक्ने हुनुहोस्

---

### 🏢 अध्याय ८: उत्पादन र एंटरप्राइज ढाँचाहरू
**पूर्वआवश्यकता**: अध्याय १-४ पूरा भइसकेको  
**समयावधि**: २-३ घण्टा  
**जटिलता**: ⭐⭐⭐⭐

#### के सिक्नुहुनेछ
- उत्पादन वितरण रणनीतिहरू
- एंटरप्राइज सुरक्षा ढाँचाहरू
- अनुगमन र लागत अनुकूलन

#### सिकाइ स्रोतहरू
- **🏭 उत्पादन**: [उत्पादन AI सर्वोत्कृष्ट अभ्यासहरू](docs/chapter-08-production/production-ai-practices.md) - एंटरप्राइज ढाँचाहरू
- **📝 उदाहरणहरू**: [माइक्रोसर्भिसेज उदाहरण](../../examples/microservices) - जटिल वास्तुकला
- **📊 अनुगमन**: [एप्लिकेशन इन्साइट्स एकीकरण](docs/chapter-06-pre-deployment/application-insights.md) - अनुगमन

#### व्यावहारिक अभ्यासहरू
- एंटरप्राइज सुरक्षा ढाँचाहरू लागू गर्नुहोस्
- व्यापक अनुगमन सेटअप गर्नुहोस्
- सही प्रशासनका साथ उत्पादनमा वितरण गर्नुहोस्

**💡 अध्याय परिणाम**: पूर्ण उत्पादन क्षमता सहित एंटरप्राइज-तयार अनुप्रयोगहरू वितरण गर्नुहोस्

---

## 🎓 कार्यशाला अवलोकन: क्रियात्मक सिकाइ अनुभव

> **⚠️ कार्यशाला स्थिति: सक्रिय विकासमा**  
> कार्यशाला सामग्रीहरू अहिले विकास र परिमार्जन भइरहेका छन्। मुख्य मोड्युलहरू काम गरिरहेका छन्, तर केहि उन्नत भागहरू अधुरा रहेका छन्। हामी सबै सामग्री पूर्ण गर्न सक्रिय रूपमा काम गरिरहेका छौं। [प्रगतिको ट्र्याक गर्नुहोस् →](workshop/README.md)

### अन्तरक्रियात्मक कार्यशाला सामग्रीहरू
**ब्राउजर-आधारित उपकरण र निर्देशित अभ्यासहरूसँग समग्र क्रियात्मक सिकाइ**

हाम्रो कार्यशाला सामग्रीले माथि रहेको अध्याय-आधारित पाठ्यक्रमलाई पूरक गर्दै संरचित, अन्तरक्रियात्मक सिकाइ अनुभव प्रदान गर्दछ। यो कार्यशाला स्व-पठित र शिक्षक-नेतृत्व सत्रहरू दुवैका लागि डिजाइन गरिएको छ।

#### 🛠️ कार्यशालाको विशेषताहरू
- **ब्राउजर-आधारित इन्टरफेस**: खोजी, प्रतिलिपि, र थीम सुविधाहरू सहित पूर्ण MkDocs-सञ्चालित कार्यशाला
- **GitHub Codespaces एकीकरण**: एक क्लिकमा विकास वातावरण सेटअप
- **संरचित सिकाइ मार्ग**: ८-मॉड्युल निर्देशित अभ्यासहरू (कुल ३-४ घण्टा)
- **प्रगतिशील पद्धति**: परिचय → चयन → प्रमाणीकरण → विखण्डन → कन्फिगरेसन → अनुकूलन → बन्द → समापन
- **अन्तरक्रियात्मक DevContainer वातावरण**: पूर्व-कन्फिगर गरिएको उपकरण र निर्भरता

#### 📚 कार्यशाला मोड्युल संरचना
कार्यशाला एक **८-मॉड्युल प्रगतिशील पद्धति** अनुसरण गर्दछ जसले तपाईंलाई खोजदेखि वितरण दक्षतासम्म लैजान्छ:

| मोड्युल | शीर्षक | के गर्नेछ | समयावधि |
|--------|-------|-------------|---------|
| **०. परिचय** | कार्यशाला अवलोकन | सिकाइ उद्देश्यहरू, पूर्वआवश्यकता, र कार्यशालाको संरचना बुझ्नुहोस् | १५ मिनेट |
| **१. चयन** | टेम्पलेट पत्ता लगाउने | AZD टेम्पलेटहरू अन्वेषण गर्न र तपाईंको स्थिति अनुसार सही AI टेम्पलेट चयन गर्नुहोस् | २० मिनेट |
| **२. प्रमाणीकरण** | तैनाथ र प्रमाणित गर्नुहोस् | `azd up` सँग टेम्पलेट तैनाथ गर्नुहोस् र पूर्वाधार काम गर्दछ हेर्नुहोस् | ३० मिनेट |
| **३. विखण्डन** | संरचना बुझ्नुहोस् | GitHub Copilot प्रयोग गरी टेम्पलेट वास्तुकला, Bicep फाइलहरू, र कोड संगठन अन्वेषण गर्नुहोस् | ३० मिनेट |
| **४. कन्फिगरेसन** | azure.yaml गहिराइमा | `azure.yaml` कन्फिगरेसन, जीवनचक्र हुकहरू, र वातावरण चरहरू मास्टर गर्नुहोस् | ३० मिनेट |
| **५. अनुकूलन** | आफ्नो बनाउनुस् | AI खोज, ट्रेसिङ, मूल्याङ्कन सक्षम गर्नुहोस् र आफ्नो परिदृश्य अनुसार अनुकूलन गर्नुहोस् | ४५ मिनेट |
| **६. बन्द** | सफा गर्नुहोस् | `azd down --purge` सँग सुरक्षित रूपमा स्रोतहरू हटाउनुहोस् | १५ मिनेट |
| **७. समापन** | अर्को चरणहरू | उपलब्धिहरू, मुख्य अवधारणाहरू समीक्षा गर्नुहोस् र तपाईंको सिकाइ यात्रा जारी राख्नुहोस् | १५ मिनेट |

**कार्यशाला प्रवाह:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 कार्यशालामा कसरी शुरू गर्ने
```bash
# विकल्प १: GitHub Codespaces (सिफारिस गरिएको)
# रिपोजिटरीमा "Code" → "Create codespace on main" क्लिक गर्नुहोस्

# विकल्प २: स्थानीय विकास
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md मा सेटअप निर्देशनहरू पालना गर्नुहोस्
```

#### 🎯 कार्यशाला सिकाइ परिणामहरू
कार्यशाला पूरा गरेर सहभागीहरूले:
- **उत्पादन AI अनुप्रयोगहरू तैनाथ गर्नुहोस्**: Microsoft Foundry सेवाहरूसँग AZD प्रयोग गर्नुहोस्
- **बहु-एजेन्ट वास्तुकला मास्टर गर्नुहोस्**: समन्वित AI एजेन्ट समाधान लागू गर्नुहोस्
- **सुरक्षा सर्वोत्तम अभ्यासहरू लागू गर्नुहोस्**: प्रमाणीकरण र पहुँच नियन्त्रण कन्फिगर गर्नुहोस्
- **मापनको लागि अनुकूलन गर्नुहोस्**: लागत-प्रभावकारी, प्रदर्शनशील वितरणहरू डिजाइन गर्नुहोस्
- **वितरण समस्याहरू समाधान गर्नुहोस्**: सामान्य समस्याहरू स्वतन्त्र रूपमा समाधान गर्न सक्ने हुनुस्

#### 📖 कार्यशाला स्रोतहरू
- **🎥 अन्तरक्रियात्मक गाइड**: [कार्यशाला सामग्रीहरू](workshop/README.md) - ब्राउजर-आधारित सिकाइ वातावरण
- **📋 मोड्युल-द्वारा- मोड्युल निर्देशनहरू**:
  - [०. परिचय](workshop/docs/instructions/0-Introduction.md) - कार्यशालाको अवलोकन र उद्देश्यहरू
  - [१. चयन](workshop/docs/instructions/1-Select-AI-Template.md) - AI टेम्पलेटहरू खोज्नुहोस् र चयन गर्नुहोस्
  - [२. प्रमाणीकरण](workshop/docs/instructions/2-Validate-AI-Template.md) - टेम्पलेट तैनाथ गर्नुहोस् र प्रमाणित गर्नुहोस्
  - [३. विखण्डन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - टेम्पलेट वास्तुकला अन्वेषण गर्नुहोस्
  - [४. कन्फिगरेसन](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml मास्टर गर्नुहोस्
  - [५. अनुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) - आफ्नो परिदृश्य अनुसार अनुकूलन गर्नुहोस्
  - [६. बन्द](workshop/docs/instructions/6-Teardown-Infrastructure.md) - स्रोतहरू सफा गर्नुहोस्
  - [७. समापन](workshop/docs/instructions/7-Wrap-up.md) - समीक्षा र अर्को चरणहरू
- **🛠️ AI कार्यशाला प्रयोगशाला**: [AI कार्यशाला प्रयोगशाला](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-केंद्रित अभ्यासहरू
- **💡 छिटो शुरू**: [कार्यशाला सेटअप गाइड](workshop/README.md#quick-start) - वातावरण कन्फिगरेसन

**उपयुक्त: कम्पनी तालिम, विश्वविद्यालय कोर्सहरू, स्व-पठित सिकाइ, र विकासकर्ता बूटक्याम्पहरूका लागि।**

---

## 📖 गहिरो विश्लेषण: AZD क्षमताहरू

मूलभूत कुराहरूदेखि बाहिर, AZD उत्पादन वितरणहरूका लागि शक्तिशाली सुविधाहरू प्रदान गर्दछ:

- **टेम्पलेट-आधारित वितरणहरू** - सामान्य अनुप्रयोग ढाँचाहरूका लागि पूर्व-निर्मित टेम्पलेटहरू प्रयोग गर्नुहोस्
- **पूर्वाधारलाई कोडको रूपमा व्यवस्थापन** - Bicep वा Terraform प्रयोग गरेर Azure स्रोतहरू व्यवस्थापन गर्नुहोस्  
- **समेकित कार्यप्रवाहहरू** - अनुप्रयोगहरू सहज रूपमा प्रावधान, तैनाथ, र अनुगमन गर्नुहोस्
- **विकासकर्ता-मित्रवत्** - विकासकर्ता उत्पादकत्व र अनुभवका लागि अनुकूलित

### **AZD + Microsoft Foundry: AI वितरणहरूको लागि उत्तम**

**किन AZD AI समाधानहरूको लागि?** AZD AI विकासकर्ताहरूले सामना गर्ने मुख्य चुनौतीहरू समाधान गर्दछ:

- **AI-तयार टेम्पलेटहरू** - Microsoft Foundry मोडेलहरू, संज्ञानात्मक सेवाहरू, र ML कार्यभारका लागि पूर्व-निर्धारित टेम्पलेटहरू
- **सुरक्षित AI वितरणहरू** - AI सेवाहरू, API कुञ्जीहरू, र मोडेल अन्तबिन्दुहरूका लागि निर्मित सुरक्षा ढाँचाहरू  
- **उत्पादन AI ढाँचाहरू** - विस्तारयोग्य, लागत-प्रभावकारी AI अनुप्रयोग वितरणका लागि सर्वोत्तम अभ्यासहरू
- **अन्तदेखि-अन्त AI कार्यप्रवाहहरू** - मोडेल विकासदेखि उत्पादन वितरणसम्म समुचित अनुगमन सहित
- **लागत अनुकूलन** - AI कार्यभारको लागि स्मार्ट स्रोत आवंटन र मापन रणनीतिहरू
- **Microsoft Foundry एकीकरण** - Microsoft Foundry मोडेल सूची र अन्तबिन्दुहरूसँग सहज सम्पर्क

---

## 🎯 टेम्पलेट र उदाहरण पुस्तकालय

### विशेष: Microsoft Foundry टेम्पलेटहरू
**यहाँबाट सुरु गर्नुहोस् यदि तपाईं AI अनुप्रयोगहरू वितरण गर्दै हुनुहुन्छ!**

> **टिप्पणी:** यी टेम्पलेटहरू विभिन्न AI ढाँचाहरू प्रदर्शन गर्छन्। केही बाह्य Azure नमूनाहरू हुन्, अरू स्थानीय कार्यान्वयनहरू।

| टेम्पलेट | अध्याय | जटिलता | सेवाहरू | प्रकार |
|----------|---------|---------|---------|---------|
| [**AI च्याटसँग शुरू गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय २ | ⭐⭐ | AzureOpenAI + Azure AI मोडेल इन्फेरेन्स API + Azure AI सर्च + Azure कन्टेनर एप्स + एप्लिकेशन इन्साइट्स | बाह्य |
| [**AI एजेन्टहरूसँग शुरू गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-agents) | अध्याय २ | ⭐⭐ | Foundry एजेन्टहरू + AzureOpenAI + Azure AI सर्च + Azure कन्टेनर एप्स + एप्लिकेशन इन्साइट्स | बाह्य |
| [**Azure सर्च + OpenAI डेमो**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय २ | ⭐⭐ | AzureOpenAI + Azure AI सर्च + अप-सर्भिस + स्टोरेज | बाह्य |
| [**OpenAI च्याट एप छिटो शुरू**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय २ | ⭐ | AzureOpenAI + कन्टेनर एप्स + एप्लिकेशन इन्साइट्स | बाह्य |
| [**एजेन्ट OpenAI पायथन Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय ५ | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | बाह्य |
| [**Contoso च्याट RAG**](https://github.com/Azure-Samples/contoso-chat) | अध्याय ८ | ⭐⭐⭐⭐ | AzureOpenAI + AI सर्च + Cosmos DB + कन्टेनर एप्स | बाह्य |
| [**रिटेल बहु-एजेन्ट समाधान**](examples/retail-scenario.md) | अध्याय ५ | ⭐⭐⭐⭐ | AzureOpenAI + AI सर्च + स्टोरेज + कन्टेनर एप्स + Cosmos DB | **स्थानीय** |

### विशेष: पूर्ण सिकाइ परिदृश्यहरू
**उत्पादन-तयार अनुप्रयोग टेम्पलेटहरू सिकाइ अध्यायहरूमा म्याप गरिएका**

| टेम्पलेट | सिकाइ अध्याय | जटिलता | मुख्य सिकाइ |
|----------|----------------|---------|-------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय २ | ⭐ | आधारभूत AI वितरण ढाँचाहरू |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय २ | ⭐⭐ | RAG कार्यान्वयन Azure AI सर्चसँग |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | अध्याय ४ | ⭐⭐ | कागजात बुद्धिमत्ता एकीकरण |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय ५ | ⭐⭐⭐ | एजेन्ट फ्रेमवर्क र फंक्शन कलिङ |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | अध्याय ८ | ⭐⭐⭐ | एंटरप्राइज AI संयोजन |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | अध्याय ५ | ⭐⭐⭐⭐ | ग्राहक र स्टक एजेन्टहरूसँग बहु-एजेन्ट वास्तुकला |

### उदाहरण प्रकार अनुसार सिकाइ

> **📌 स्थानीय र बाह्य उदाहरणहरू:**  
> **स्थानीय उदाहरणहरू** (यस रिपोजिटोरीमा) = तुरुन्त प्रयोग गर्न तयार  
> **बाह्य उदाहरणहरू** (Azure नमूना) = लिंक गरिएको रिपोजिटोरीबाट क्लोन गर्नुहोस्

#### स्थानीय उदाहरणहरू (तुरुन्त प्रयोग गर्न तयार)
- [**रिटेल बहु-एजेन्ट समाधान**](examples/retail-scenario.md) - ARM टेम्पलेटहरूसँग पूर्ण उत्पादन-तयार कार्यान्वयन
  - बहु-एजेन्ट वास्तुकला (ग्राहक + स्टक एजेन्टहरू)
  - समग्र अनुगमन र मूल्याङ्कन
  - एक क्लिक ARM टेम्पलेटमार्फत वितरण

#### स्थानीय उदाहरणहरू - कन्टेनर अनुप्रयोगहरू (अध्याय २-५)
**यस रिपोजिटोरीमा समग्र कन्टेनर वितरण उदाहरणहरू:**
- [**कन्टेनर एप उदाहरणहरू**](examples/container-app/README.md) - कन्टेनराइज्ड वितरणहरूको पूर्ण मार्गदर्शन
  - [साधारण फ्लास्क API](../../examples/container-app/simple-flask-api) - स्केल-टु-शून्य सहित आधारभूत REST API
  - [माइक्रोसर्भिस वास्तुकला](../../examples/container-app/microservices) - उत्पादन-तयार बहु-सेवा वितरण
  - छिटो शुरू, उत्पादन, र उन्नत वितरण ढाँचाहरू
  - अनुगमन, सुरक्षा, र लागत अनुकूलन निर्देशन

#### बाह्य उदाहरणहरू - साधारण अनुप्रयोगहरू (अध्याय १-२)
**यी Azure नमूना रिपोजिटोरीहरू क्लोन गरी सुरु गर्नुहोस्:**
- [साधारण वेब एप - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - आधारभूत वितरण ढाँचाहरू
- [स्थिर वेबसाइट - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - स्थिर सामग्री वितरण
- [कन्टेनर एप - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API वितरण

#### बाह्य उदाहरणहरू - डाटाबेस एकीकरण (अध्याय ३-४)  

- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - डाटाबेस कनेक्टिविटी ढाँचाहरू
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - सर्भरलेस डाटा कार्यप्रवाह

#### बाह्य उदाहरणहरू - उन्नत ढाँचाहरू (अध्याय ४-८)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - बहु-सेवा वास्तुकला
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - पृष्ठभूमि प्रशोधन  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - उत्पादन-तयार ML ढाँचाहरू

### बाह्य टेम्प्लेट संग्रहहरू
- [**अधिकारिक AZD टेम्प्लेट ग्यालरी**](https://azure.github.io/awesome-azd/) - आधिकारिक र समुदाय टेम्प्लेटहरूको क्यूरेटेड संग्रह
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - माइक्रोसफ्ट लर्न टेम्प्लेट कागजात
- [**Examples Directory**](examples/README.md) - विस्तृत व्याख्याका साथ स्थानीय सिकाइका उदाहरणहरू

---

## 📚 सिकाइ स्रोतहरू र सन्दर्भहरू

### छिटो सन्दर्भहरू
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - अध्याय अनुसार व्यवस्थित आवश्यक azd आदेशहरू
- [**Glossary**](resources/glossary.md) - Azure र azd शब्दावली  
- [**FAQ**](resources/faq.md) - सिकाइ अध्याय अनुसार सामान्य प्रश्नहरू
- [**Study Guide**](resources/study-guide.md) - व्यापक अभ्यास अभ्यासहरू

### व्यावहारिक कार्यशाला
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - आफ्नो AI समाधानहरू AZD-डिप्लोय योग्य बनाउनुहोस् (२-३ घण्टा)
- [**Interactive Workshop**](workshop/README.md) - MkDocs र GitHub Codespaces सँग ८-मोड्युल मार्गनिर्देशित अभ्यास
  - पालन गर्दछ: परिचय → चयन → प्रमाणीकरण → विखण्डन → कन्फिगरेसन → अनुकूलन → टियरडाउन → समापन

### बाह्य सिकाइ स्रोतहरू
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### तपाइँको सम्पादकको लागि AI एजेन्ट सीपहरू
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, डिप्लोयमेन्ट, डायग्नोस्टिक्स, लागत अनुकूलन, र थपका लागि ३७ खुला एजेन्ट सीपहरू। तिनीहरूलाई GitHub Copilot, Cursor, Claude Code, वा कुनै समर्थित एजेन्टमा स्थापना गर्नुहोस्:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 छिटो समस्या समाधान मार्गदर्शन

**सामान्य समस्याहरू जुन शुरुआतीहरूले सामना गर्छन् र तत्काल समाधानहरू:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# पहिले AZD स्थापना गर्नुहोस्
# विन्डोज (पावरशेल):
winget install microsoft.azd

# म्याकओएस:
brew tap azure/azd && brew install azd

# लिनक्स:
curl -fsSL https://aka.ms/install-azd.sh | bash

# स्थापना पुष्टि गर्नुहोस्
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" वा "Subscription not set"</strong></summary>

```bash
# उपलब्ध सदस्यताहरू सूचीबद्ध गर्नुहोस्
az account list --output table

# पूर्वनिर्धारित सदस्यता सेट गर्नुहोस्
az account set --subscription "<subscription-id-or-name>"

# AZD वातावरणका लागि सेट गर्नुहोस्
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# प्रमाणीकरण गर्नुहोस्
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" वा "Quota exceeded"</strong></summary>

```bash
# फरक Azure क्षेत्र प्रयास गर्नुहोस्
azd env set AZURE_LOCATION "westus2"
azd up

# वा विकासमा साना SKU हरू प्रयोग गर्नुहोस्
# infra/main.parameters.json सम्पादन गर्नुहोस्:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" आधा बाट असफल भयो</strong></summary>

```bash
# विकल्प १: सफा गरेर पुनः प्रयास गर्नुहोस्
azd down --force --purge
azd up

# विकल्प २: मात्र पूर्वाधार सुधार गर्नुहोस्
azd provision

# विकल्प ३: विस्तृत स्थिति जाँच गर्नुहोस्
azd show

# विकल्प ४: Azure Monitor मा लगहरू जाँच गर्नुहोस्
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" वा "Token expired"</strong></summary>

```bash
# AZD का लागि पुनः प्रमाणीकरण गर्नुहोस्
azd auth logout
azd auth login

# वैकल्पिक: यदि तपाईं az कमाण्डहरू चलाइरहनुभएको छ भने Azure CLI पनि रिफ्रेश गर्नुहोस्
az logout
az login

# प्रमाणीकरण पुष्टि गर्नुहोस्
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" वा नामकरण द्वन्द्वहरू</strong></summary>

```bash
# AZD ले अद्वितीय नामहरू सिर्जना गर्दछ, तर द्वन्द्व भएमा:
azd down --force --purge

# त्यसपछि नयाँ वातावरणसहित पुनः प्रयास गर्नुहोस्
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ टेम्प्लेट डिप्लोयमेन्ट धेरै लामो समय लिइरहेको छ</strong></summary>

**सामान्य प्रतिक्षा समयहरू:**
- सरल वेब एप: ५-१० मिनेट
- डाटाबेस सहितको एप: १०-१५ मिनेट
- AI एप्लिकेसनहरू: १५-२५ मिनेट (OpenAI प्रोभिजनिङ सुस्त छ)

```bash
# प्रगति जाँच गर्नुहोस्
azd show

# यदि ३० मिनेटभन्दा बढी समयसम्म अड्किएको छ भने, Azure पोर्टल जाँच गर्नुहोस्:
azd monitor --overview
# असफल परिनियोजनहरू खोज्नुहोस्
```
</details>

<details>
<summary><strong>❌ "Permission denied" वा "Forbidden"</strong></summary>

```bash
# तपाईंको Azure भूमिका जाँच्नुहोस्
az role assignment list --assignee $(az account show --query user.name -o tsv)

# तपाईंलाई कम्तिमा "Contributor" भूमिका आवश्यक छ
# तपाईँका Azure प्रशासकलाई अनुमति माग्नुहोस्:
# - Contributor (स्रोतहरूको लागि)
# - User Access Administrator (भूमिका असाइनमेन्टहरूको लागि)
```
</details>

<details>
<summary><strong>❌ डिप्लोय गरिएको एप्लिकेसन URL फेला पार्न सकिएन</strong></summary>

```bash
# सबै सेवा अन्तबिन्दुहरू देखाउनुहोस्
azd show

# वा Azure पोर्टल खोल्नुहोस्
azd monitor

# विशेष सेवा जाँच गर्नुहोस्
azd env get-values
# *_URL चलहरू खोज्नुहोस्
```
</details>

### 📚 पूर्ण समस्या समाधान स्रोतहरू

- **सामान्य समस्याहरू मार्गदर्शन:** [विस्तृत समाधानहरू](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-विशिष्ट समस्याहरू:** [AI समस्या समाधान](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **डिबगिङ मार्गदर्शन:** [चरण-द्वारा-चरण डिबगिङ](docs/chapter-07-troubleshooting/debugging.md)
- **मद्दत प्राप्त गर्नुहोस्:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 कोर्स पूरा गर्नुहोस् र प्रमाणपत्र प्राप्त गर्नुहोस्

### प्रगति ट्र्याकिङ
प्रत्येक अध्यायमार्फत आफूले सिकेको प्रगति ट्र्याक गर्नुहोस्:

- [ ] **अध्याय १**: आधारभूत र छिटो सुरुवात ✅
- [ ] **अध्याय २**: AI-प्रथम विकास ✅  
- [ ] **अध्याय ३**: कन्फिगरेसन र प्रमाणीकरण ✅
- [ ] **अध्याय ४**: इन्फ्रास्ट्रक्चर एज़ कोड र डिप्लोयमेन्ट ✅
- [ ] **अध्याय ५**: बहु-एजेन्ट AI समाधानहरू ✅
- [ ] **अध्याय ६**: पूर्व-डिप्लोयमेन्ट प्रमाणीकरण र योजना ✅
- [ ] **अध्याय ७**: समस्या समाधान र डिबगिङ ✅
- [ ] **अध्याय ८**: उत्पादन र एण्टरप्राइज ढाँचाहरू ✅

### सिकाइ प्रमाणीकरण
प्रत्येक अध्याय पूरा गरेपछि, आफ्नो ज्ञान पुष्टि गर्नुहोस्:
1. **व्यावहारिक अभ्यास**: अध्यायको व्यावहारिक डिप्लोयमेन्ट पूरा गर्नुहोस्
2. **ज्ञान जाँच**: आफ्नो अध्यायको FAQ खण्ड समीक्षा गर्नुहोस्
3. **समुदाय छलफल**: Azure Discord मा आफ्नो अनुभव साझा गर्नुहोस्
4. **अर्को अध्याय**: अर्को जटिलता स्तरमा जानुहोस्

### कोर्स पूरा गरेपछि फाइदा
सबै अध्यायहरु पूरा गरेपछि, तपाईंसँग हुनेछ:
- **उत्पादन अनुभव**: Azure मा वास्तविक AI एप्लिकेसनहरू डिप्लोय गरेको
- **व्यावसायिक सीपहरू**: एण्टरप्राइज-तयार डिप्लोयमेन्ट क्षमता  
- **समुदाय मान्यता**: Azure विकासकर्ता समुदायको सक्रिय सदस्य
- **क्यारियर अगाडि बढाउनुहोस्**: AZD र AI डिप्लोयमेन्ट विशेषज्ञता

---

## 🤝 समुदाय र समर्थन

### मद्दत र समर्थन प्राप्त गर्नुहोस्
- **प्राविधिक समस्याहरू**: [त्रुटिहरू रिपोर्ट गर्नुहोस् र सुविधाहरू अनुरोध गर्नुहोस्](https://github.com/microsoft/azd-for-beginners/issues)
- **सिकाइ सम्बन्धित प्रश्नहरू**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) र [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-विशिष्ट मद्दत**: [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) मा सहभागी हुनुहोस्
- **कागजात**: [अधिकारिक Azure Developer CLI कागजात](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### माइक्रोसफ्ट फाउन्ड्री Discord बाट समुदाय अन्तर्दृष्टि

**#Azure च्यानलबाट भर्खरका पोल नतिजाहरू:**
- विकासकर्ताहरूको **४५%** ले AI वर्कलोडका लागि AZD प्रयोग गर्न चाहन्छन्
- **टप चुनौतीहरू**: बहु-सेवा डिप्लोयमेन्ट, प्रमाणपत्र व्यवस्थापन, उत्पादन तयारी  
- **सबैभन्दा धेरै मागिएको**: AI-विशिष्ट टेम्प्लेट, समस्या समाधान मार्गदर्शन, सर्वोत्तम अभ्यासहरू

**हाम्रो समुदायमा सहभागी भएर:**
- आफ्नो AZD + AI अनुभवहरू साझा गर्नुहोस् र मद्दत पाउनुहोस्
- नयाँ AI टेम्प्लेटहरूको प्रारम्भिक पूर्वावलोकनहरू पहुँच गर्नुहोस्
- AI डिप्लोयमेन्टका सर्वोत्तम अभ्यासहरूमा योगदान गर्नुहोस्
- भविष्यका AI + AZD सुविधाहरूको विकासमा प्रभाव पार्नुहोस्

### कोर्समा योगदान
हामी योगदानहरू स्वागत गर्छौं! कृपया हाम्रो [योगदान गाइड](CONTRIBUTING.md) पढ्नुहोस्:
- **समग्री सुधारहरू**: अस्तित्वमा रहेका अध्यायहरू र उदाहरणहरू सुधार गर्नुहोस्
- **नयाँ उदाहरणहरू**: वास्तविक-विश्व परिदृश्य र टेम्प्लेटहरू थप्नुहोस्  
- **अनुवाद**: बहुभाषिक समर्थन कायम राख्न मद्दत गर्नुहोस्
- **बग रिपोर्टहरू**: शुद्धता र स्पष्टता सुधार गर्नुहोस्
- **समुदाय मापदण्डहरू**: हाम्रो समावेशी सामुदायिक दिशानिर्देशहरू पालना गर्नुहोस्

---

## 📄 कोर्स जानकारी

### लाइसेन्स
यस परियोजनालाई MIT लाइसेन्स अन्तर्गत लाइसेन्स गरिएको छ - विवरणका लागि [LICENSE](../../LICENSE) फाइल हेर्नुहोस्।

### सम्बन्धित माइक्रोसफ्ट सिकाइ स्रोतहरू

हाम्रो टिमले अन्य व्यापक सिकाइ कोर्सहरू उत्पादन गर्दछ:

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
 
### कोर सिकाइ
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot शृंखला
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ कोर्स नेभिगेसन

**🚀 सिक्न सुरु गर्न तयार?**

**शुरुआतीहरू**: [अध्याय १: आधार र छिटो सुरु](#-chapter-1-foundation--quick-start) बाट सुरु गर्नुहोस्  
**एआई विकासकर्ताहरू**: [अध्याय २: AI-First विकास](#-chapter-2-ai-first-development-recommended-for-ai-developers) मा जानुहोस्  
**अनुभवी विकासकर्ताहरू**: [अध्याय ३: कन्फिगरेसन र प्रमाणीकरण](#️-chapter-3-configuration--authentication) बाट सुरु गर्नुहोस्

**अर्का कदमहरू**: [अध्याय १ सुरु गर्नुहोस् - AZD आधारभूत जानकारी](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी सही अनुवादका लागि प्रयासरत छौं, तर कृपया जानकार हुनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धि हुनसक्छ। मूल भाषामा रहेको मूल दस्तावेजलाई आधिकारिक स्रोतको रूपमा मान्नुपर्छ। महत्वपूर्ण जानकारीका लागि पेशेवर मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी जिम्मेवार हुनुहुँदैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->