# AZD नयाँ सिक्नेहरूका लागि: संरचित सिकाइ यात्रा

![AZD-शुरुआतीहरू](../../translated_images/ne/azdbeginners.5527441dd9f74068.webp) 

[![GitHub अनुगमनकर्ता](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub फोर्कहरू](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub तारा](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure डिस्कोर्ड](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry डिस्कोर्ड](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### स्वचालित अनुवादहरू (सधैं अद्यावधिक)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[अरबी](../ar/README.md) | [बंगाली](../bn/README.md) | [बुल्गेरियाली](../bg/README.md) | [बर्मेली (म्यानमार)](../my/README.md) | [चीनी (सरलीकृत)](../zh-CN/README.md) | [चीनी (परम्परागत, हङकङ)](../zh-HK/README.md) | [चीनी (परम्परागत, मकाऊ)](../zh-MO/README.md) | [चीनी (परम्परागत, ताइवान)](../zh-TW/README.md) | [क्रोएशियन](../hr/README.md) | [चेक](../cs/README.md) | [डेनिश](../da/README.md) | [डच](../nl/README.md) | [इस्टोनियन](../et/README.md) | [फिनिश](../fi/README.md) | [फ्रेन्च](../fr/README.md) | [जर्मन](../de/README.md) | [ग्रीक](../el/README.md) | [हिब्रु](../he/README.md) | [हिन्दी](../hi/README.md) | [हंगेरीयन](../hu/README.md) | [इन्डोनेशियन](../id/README.md) | [इटालियन](../it/README.md) | [जापानी](../ja/README.md) | [कन्नड़](../kn/README.md) | [खमेर](../km/README.md) | [कोरियन](../ko/README.md) | [लिथुआनियाली](../lt/README.md) | [मले](../ms/README.md) | [मलयालम](../ml/README.md) | [मराठी](../mr/README.md) | [नेपाली](./README.md) | [नाइजेरियन पिड्गिन](../pcm/README.md) | [नर्वेजियन](../no/README.md) | [पर्शियन (फारसी)](../fa/README.md) | [पोलिश](../pl/README.md) | [पोर्तुगाली (ब्राजिल)](../pt-BR/README.md) | [पोर्तुगाली (पुर्तगाल)](../pt-PT/README.md) | [पंजाबी (गुरमुखी)](../pa/README.md) | [रोमानियन](../ro/README.md) | [रूसी](../ru/README.md) | [सर्बियन (सिरिलिक)](../sr/README.md) | [स्लोभाक](../sk/README.md) | [स्लोभेनियन](../sl/README.md) | [स्पेनिश](../es/README.md) | [स्वाहिली](../sw/README.md) | [स्वीडिश](../sv/README.md) | [टागालोग (फिलिपिनो)](../tl/README.md) | [तामिल](../ta/README.md) | [तेलुगु](../te/README.md) | [थाई](../th/README.md) | [टर्किश](../tr/README.md) | [युक्रे्नियन](../uk/README.md) | [उर्दू](../ur/README.md) | [भियतनामी](../vi/README.md)

> **स्थानीय स्तरमा क्लोन गर्न रुचाउनुहुन्छ?**
>
> यो रिपोजिटरीमा ५०+ भाषा अनुवादहरू समावेश छन् जसले डाउनलोड आकारलाई धेरै बढाउँछ। अनुवादहरू बिना क्लोन गर्न sparse checkout प्रयोग गर्नुहोस्:
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
> यसले कोर्स पूरा गर्न आवश्यक सबै कुरा दिन्छ र डाउनलोड धेरै छिटो हुन्छ।
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 आज azd मा के नयाँ छ

> 📌 यो कोर्स **`azd 1.25.6`** (जुन 2026) अनुसार मान्य गरिएको छ। आफ्नो बिल्ड जाँच गर्न `azd version` चलाउनुहोस्, र नवीनतम प्राप्त गर्न `azd upgrade` चलाउनुहोस्।

Azure Developer CLI परम्परागत वेब एप र API भन्दा पर बढेको छ। आज, azd Azure मा कुनै पनि एप्लिकेशन तैनाथ गर्न एउटा एकल उपकरण हो—यसमा AI-शक्तिशाली एपहरू र बुद्धिमान एजेन्टहरू पनि समावेश छन्।

यसको अर्थ तपाईंका लागि के हो:

- **AI एजेन्टहरू अब पहिलो श्रेणीका azd वर्कलोड हुन्।** तपाईंले परिचित `azd init` → `azd up` वर्कफ्लो प्रयोग गरेर AI एजेन्ट परियोजनाहरू इनिशियलाइज, तैनाथ, र व्यवस्थापन गर्न सक्नुहुन्छ।
- **CLI बाटै पूर्ण एजेन्ट लाइफसाइकल।** `azure.ai.agents` एक्स्टेन्सनले अब सम्पूर्ण यात्रा समेट्छ—स्काफोल्ड गर्न `azd ai agent init`, परीक्षण गर्न `azd ai agent invoke` (प्रतिक्रिया-समय आउटपुटसहित), गुणस्तर मापन र सुधार गर्न `azd ai agent eval generate` र `azd ai agent optimize`, र क्लीनअप गर्न `azd ai agent delete`।
- **थप AI निर्माण ब्लकहरू।** नयाँ प्रिभ्यु एक्स्टेन्सनहरू—`azure.ai.skills` र `azure.ai.connections`—ले azd बाटै पुन:प्रयोगयोग्य एजेन्ट स्किल र Foundry कनेक्शनहरू व्यवस्थापन गर्न दिन्छ।
- **Microsoft Foundry एकीकरण** ले मोडल तैनाथीकरण, एजेन्ट होस्टिंग, र AI सेवा कन्फिगरेसनलाई सोझै azd टेम्पलेट इकोसिस्टममा ल्याउँछ।
- **दैनिक आधारका आधारभूत कुराहरू स्मूदर।** भर्खरका रिलिजहरूले `azd init` लाई idempotent बनाएको छ (पुन: चलाउन सुरक्षित), `azd auth login` ले स्टेल टोकनहरू स्वचालित रूपमा हटाउन सक्छ, र पहिलो चलाइका लागि मित्रवत `azd tool` सेटअप संकेत थपिएको छ।
- **मुख्य वर्कफ्लो परिवर्तन भएको छैन।** चाहे तपाईं todo एप, माइक्रोसर्भिस, वा बहु-एजेन्ट AI समाधान तैनाथ गर्दै हुनुहोस्, कमान्डहरू उस्तै छन्।

> **Aspire प्रयोगकर्ताहरूका लागि नोट:** Microsoft अब उत्पादनलाई सरलतासाथ **Aspire** (पूर्वमा ".NET Aspire") भनेर सम्बोधन गर्छ। azd को Aspire समर्थन अपरिवर्तित छ—मात्र नाम अद्यावधिक गरिएको हो।

यदि तपाईंले पहिले azd प्रयोग गर्नुभएको छ भने, AI समर्थन प्राकृतिक विस्तार हो—भिन्न उपकरण वा उन्नत ट्रयाक होइन। यदि तपाईं नयाँ सुरु गर्दै हुनुहुन्छ भने, तपाईंले एउटा वर्कफ्लो सिक्नुहुनेछ जुन सबै कुराका लागि काम गर्छ।

---

## 🚀 Azure Developer CLI (azd) भनेको के हो?

**Azure Developer CLI (azd)** एक विकासकर्ता-मैत्री कमान्ड-लाइन उपकरण हो जसले Azure मा एप्लिकेशन तैनाथ गर्न सजिलो बनाउँछ। दर्जनौ Azure स्रोतहरू म्यानुअली सिर्जना र जडान गर्ने सट्टा, तपाईंले एकै कमान्डमा पूरै एप्लिकेशन तैनाथ गर्न सक्नुहुन्छ।

### `azd up` को जादु

```bash
# यो एकल आदेशले सबै कुराहरू गर्छ:
# ✅ सबै Azure स्रोतहरू सिर्जना गर्दछ
# ✅ नेटवर्किङ र सुरक्षा कन्फिगर गर्दछ
# ✅ तपाईंको अनुप्रयोग कोड बनाउँछ
# ✅ Azure मा डिप्लोय गर्दछ
# ✅ तपाईंलाई काम गर्ने URL दिन्छ
azd up
```

**यति नै!** कुनै Azure Portal मा क्लिक गर्न आवश्यक छैन, कुनै जटिल ARM टेम्प्लेट पहिले सिक्नुपर्दैन, कुनै म्यानुअल कन्फिगरेशन छैन - केवल कार्यरत एप्लिकेशनहरू Azure मा।

---

## ❓ Azure Developer CLI र Azure CLI: के फरक छ?

यो सुरुमा सोधिने सबैभन्दा सामान्य प्रश्न हो। यहाँ सरल जवाफ छ:

| विशेषता | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **उद्देश्य** | व्यक्तिगत Azure स्रोतहरू व्यवस्थापन गर्नु | पूर्ण एप्लिकेशनहरू तैनाथ गर्नु |
| **सोचाइ** | इन्फ्रास्ट्रक्चर-केन्द्रित | एप्लिकेशन-केन्द्रित |
| **उदाहरण** | `az webapp create --name myapp...` | `azd up` |
| **सिक्ने घुमाउरो** | Azure सेवाहरू जान्न जरुरी | केवल आफ्नो एप जान्नुहोस् |
| **लागि उत्तम** | DevOps, इन्फ्रास्ट्रक्चर | विकासकर्ता, प्रोटोटाइपिङ |

### सादा उपमा

- **Azure CLI** त्यस्तो हो जस्तो घर बनाउनका लागि सबै उपकरणहरू हुनु—ह्यामर, आरी, कीलहरू। तपाईं केही पनि बनाउन सक्नुहुन्छ, तर निर्माण ज्ञान चाहिन्छ।
- **Azure Developer CLI** त्यस्तो हो जसरी ठेकेदार राख्नुहुन्छ—तपाईंले के चाहनुहुन्छ भने भन्नुहोस्, र उनीहरूले बनाउने काम हेरिन्छ।

### कुन अवस्थामा कुन प्रयोग गर्ने

| स्थिति | यसलाई प्रयोग गर्नुहोस् |
|----------|----------|
| "म आफ्नो वेब एप छिटो तैनाथ गर्न चाहन्छु" | `azd up` |
| "म केवल एक स्टोरेज अकाउन्ट सिर्जना गर्न चाहन्छु" | `az storage account create` |
| "म एक पूर्ण AI एप बनाइरहेको छु" | `azd init --template azure-search-openai-demo` |
| "मलाई कुनै विशेष Azure स्रोत डिबग गर्नु छ" | `az resource show` |
| "मिनेटहरूमा उत्पादन-तयार तैनाथीकरण चाहन्छु" | `azd up --environment production` |

### तिनीहरू सँगै काम गर्छन्!

AZD भित्र Azure CLI प्रयोग हुन्छ। तपाईं दुवै प्रयोग गर्न सक्नुहुन्छ:
```bash
# AZD सँग आफ्नो एप्लिकेसन परिनियोजन गर्नुहोस्
azd up

# त्यसपछि Azure CLI सँग विशिष्ट स्रोतहरूलाई राम्रोसँग अनुकूल गर्नुहोस्
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD मा टेम्पलेटहरू खोज्नुहोस्

सुरुबाटै नबनाउनुहोस्! **Awesome AZD** समुदायको तयार-तैनाथ टेम्पलेटहरूको संग्रह हो:

| स्रोत | विवरण |
|----------|-------------|
| 🔗 [**Awesome AZD ग्यालरी**](https://azure.github.io/awesome-azd/) | एक-क्लिकमा तैनाथ गर्ने 200+ टेम्पलेट ब्राउज गर्नुहोस् |
| 🔗 [**टेम्पलेट सबमिट गर्नुहोस्**](https://github.com/Azure/awesome-azd/issues) | आफ्नो टेम्पलेट समुदायलाई योगदान गर्नुहोस् |
| 🔗 [**GitHub रिपोजिटरी**](https://github.com/Azure/awesome-azd) | स्रोतमा स्टार दिनुहोस् र अन्वेषण गर्नुहोस् |

### Awesome AZD बाट लोकप्रिय AI टेम्पलेटहरू

```bash
# Microsoft Foundry मोडेलहरू + AI खोजी सहित RAG चैट
azd init --template azure-search-openai-demo

# छिटो AI चैट अनुप्रयोग
azd init --template openai-chat-app-quickstart

# Foundry एजेन्टहरूसँग AI एजेन्टहरू
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 चरणमा सुरु गर्नुहोस्

सुरु गर्नु अघि, तपाईंले तैनाथ गर्न चाहनुभएको टेम्पलेटका लागि आफ्नो मेसिन तयार छ भनी सुनिश्चित गर्नुहोस्:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

यदि कुनै आवश्यक जाँच असफल भयो भने, पहिले त्यसलाई मिलाउनुहोस् र त्यसपछि क्विक स्टार्ट जारी राख्नुहोस्।

### चरण 1: AZD स्थापना गर्नुहोस् (२ मिनेट)

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

### चरण 2: AZD का लागि प्रमाणिकरण

```bash
# यदि तपाईं यो कोर्समा सीधा Azure CLI कमाण्डहरू प्रयोग गर्न योजना बनाउनु भएको छ भने वैकल्पिक
az login

# AZD कार्यप्रवाहहरूका लागि आवश्यक
azd auth login
```

यदि तपाईंलाई पक्का छैन कुन चाहिन्छ भने, पूर्ण सेटअप फ्लो पालना गर्नुहोस् [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup) मा।

### चरण 3: आफ्नो पहिलो एप तैनाथ गर्नुहोस्

```bash
# टेम्प्लेटबाट प्रारम्भ गर्नुहोस्
azd init --template todo-nodejs-mongo

# Azure मा तैनाथ गर्नुहोस् (सबै कुरा सिर्जना गर्दछ!)
azd up
```

**🎉 भयो!** तपाइँको एप अब Azure मा लाइभ छ।

### सफाइ गर्नुहोस् (बिर्सनु हुँदैन!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 यस कोर्स कसरी प्रयोग गर्ने

यो कोर्स **क्रमिक सिकाइ** का लागि डिजाइन गरिएको छ - जहाँ सुविधाजनक महसुस गर्नुहुन्छ त्यहाँबाट सुरु गर्नुहोस् र माथितर्फ बढ्नुहोस्:

| तपाईंको अनुभव | यहाँबाट सुरु गर्नुहोस् |
|-----------------|------------|
| **Azure मा बिल्कुल नयाँ** | [अध्याय 1: आधार](#-chapter-1-foundation--quick-start) |
| **Azure जान्दछु, AZD नयाँ** | [अध्याय 1: आधार](#-chapter-1-foundation--quick-start) |
| **AI एपहरू तैनाथ गर्न चाहनुहुन्छ** | [अध्याय 2: AI-प्रथम विकास](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **व्यावहारिक अभ्यास चाहनुहुन्छ** | [🎓 अन्तर्क्रियात्मक कार्यशाला](workshop/README.md) - 3-4 घण्टा मार्गनिर्देशित तालिम |
| **उत्पादन र एन््टरप्राइज ढाँचाहरू चाहनुहुन्छ** | [अध्याय 8: उत्पादन & एन््टरप्राइज](#-chapter-8-production--enterprise-patterns) |

### क्विक सेटअप

1. **यो रिपोजिटरी Fork गर्नुहोस्**: [![GitHub फोर्कहरू](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **क्लोन गर्नुहोस्**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **सहायता प्राप्त गर्नुहोस्**: [Azure डिस्कोर्ड समुदाय](https://discord.com/invite/ByRwuEEgH4)

> **स्थानीय स्तरमा क्लोन गर्न रुचाउनुहुन्छ?**
>
> यो रिपोजिटरीमा ५०+ भाषा अनुवादहरू समावेश छन् जसले डाउनलोड आकारलाई धेरै बढाउँछ। अनुवादहरू बिना क्लोन गर्न sparse checkout प्रयोग गर्नुहोस्:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> यसले कोर्स पूरा गर्न आवश्यक सबै कुरा दिन्छ र डाउनलोड धेरै छिटो गर्छ।

## कोर्स अवलोकन

रचना अनुसार अध्यायहरू मार्फत Azure Developer CLI (azd) मा मास्टरी हासिल गर्नुहोस्। **Microsoft Foundry एकीकरणसँग AI एप्लिकेशन तैनाथीकरणमा विशेष ध्यान।**
### किन यो पाठ्यक्रम आधुनिक विकासकर्ताहरूका लागि अत्यावश्यक छ

Microsoft Foundry Discord समुदायका अन्तरदृष्टिहरूको आधारमा, **45% डेवलपर्सहरूले AI कार्यभारहरूका लागि AZD प्रयोग गर्न चाहन्छन्** तर निम्न समस्याहरूको सामना गर्छन्:
- जटिल बहु-सेवा AI वास्तुकलाहरू
- उत्पादन AI डिप्लोयमेन्टका उत्तम अभ्यासहरू  
- Azure AI सेवा एकीकरण र विन्यास
- AI कार्यभारहरूको लागत अनुकूलन
- AI-विशिष्ट डिप्लोयमेन्ट समस्याहरूको समस्या समाधान

### सिकाइ उद्देश्यहरू

यो संरचित पाठ्यक्रम पूरा गर्दा, तपाईँले:
- **AZD आधारहरूमा दक्षता हासिल गर्नुहोस्**: मुख्य अवधारणाहरू, स्थापना, र विन्यास
- **AI अनुप्रयोगहरू डिप्लोय गर्नुहोस्**: Microsoft Foundry सेवाहरूसँग AZD प्रयोग गर्नुहोस्
- **कोडको रूपमा पूर्वाधार लागू गर्नुहोस्**: Bicep टेम्प्लेटहरूसँग Azure स्रोतहरू व्यवस्थापन गर्नुहोस्
- **डिप्लोयमेन्टहरू समस्या समाधान गर्नुहोस्**: सामान्य मुद्दाहरू समाधान र डिबग गर्नुहोस्
- **उत्पादनका लागि अनुकूल गर्नुहोस्**: सुरक्षा, स्केलिङ, निगरानी, र लागत व्यवस्थापन
- **बहु-एजेन्ट समाधानहरू बनाउनुहोस्**: जटिल AI वास्तुकलाहरू डिप्लोय गर्नुहोस्

## सुरु गर्नु अघि: खाता, पहुँच, र अनुमानहरू

अध्याय 1 सुरु गर्नु अघि, सुनिश्चित गर्नुहोस् कि तपाईंसँग तलका कुरा तयार छन्। यस मार्गदर्शकमा पछि दिइने स्थापना चरणहरूले यी आधारभूत कुराहरू पहिले नै ह्यान्डल गरिएको मान्छन्।

- **Azure सदस्यता**: तपाईंले कार्यस्थलको कुनै विद्यमान सदस्यता वा आफ्नो व्यक्तिगत खाता प्रयोग गर्न सक्नुहुन्छ, वा सुरु गर्नका लागि [निःशुल्क परीक्षण](https://aka.ms/azurefreetrial) सिर्जना गर्नुहोस्।
- **Azure स्रोतहरू सिर्जना गर्ने अनुमति**: अधिकांश अभ्यासहरूको लागि, लक्ष्य सदस्यता वा स्रोत समूहमा कम्तिमा **Contributor** पहुँच हुनुपर्छ। केही अध्यायहरूले स्रोत समूहहरू, व्यवस्थManaged identities, र RBAC असाइनमेन्टहरू सिर्जना गर्न सक्ने क्षमता पनि मान्न सक्छ।
- [**एक GitHub खाता**](https://github.com): रेपो फोर्क गर्न, आफ्ना परिवर्तनहरू ट्र्याक गर्न, र कार्यशालाको लागि GitHub Codespaces प्रयोग गर्न उपयोगी छ।
- **टेम्प्लेट रनटाइम पूर्वापेक्षाहरू**: केही टेम्प्लेटहरूले स्थानीय उपकरणहरू जस्तै Node.js, Python, Java, वा Docker आवश्यक पर्छ। सुरु गर्नु अघि सेटअप भ्यालिडेटर चलाउनुहोस् ताकि गुमाएका उपकरणहरू छिटै पत्ता लागून्।
- **आधारभूत टर्मिनल परिचितता**: तपाईंलाई विशेषज्ञ हुन आवश्यक छैन, तर `git clone`, `azd auth login`, र `azd up` जस्ता कमाण्डहरू चलाउन सहज हुनु पर्छ।

> **कम्पनी सदस्यतामा काम गर्दै हुनुहुन्छ?**
> यदि तपाईंको Azure वातावरण प्रशासकद्वारा व्यवस्थापन गरिएको छ भने, तपाईंले प्रयोग गर्ने योजना गरिएको सदस्यता वा स्रोत समूहमा स्रोतहरू डिप्लोय गर्न सक्नुहुनेछ कि भनी अग्रिममा पुष्टि गर्नुहोस्। यदि सकिंदैन भने, सुरु गर्नु अघि स्यान्डबक्स सदस्यता वा Contributor पहुँचको अनुरोध गर्नुहोस्।

> **Azure नयाँ हुनुहुन्छ?**
> अभ्यासहरू अन्त्यसम्म पूरा गर्न र टेनेन्ट-स्तरीय स्वीकृतिहरूको प्रतिक्षा नगरी गर्नका लागि आफ्नो Azure परीक्षण वा pay-as-you-go सदस्यता https://aka.ms/azurefreetrial बाट सुरु गर्नुहोस्।

## 🗺️ पाठ्यक्रम नक्सा: अध्याय अनुसार छिटो नेभिगेसन

प्रत्येक अध्यायसँग सिकाइ लक्ष्यहरू, क्विक स्टार्टहरू, र अभ्यासहरू सहित समर्पित README छ:

| अध्याय | विषय | पाठहरू | अवधि | जटिलता |
|---------|-------|---------|----------|------------|
| **[अध्याय 1: आधार](docs/chapter-01-foundation/README.md)** | सुरु गर्नुहोस् | [AZD आधारभूत](docs/chapter-01-foundation/azd-basics.md) &#124; [स्थापना](docs/chapter-01-foundation/installation.md) &#124; [पहिलो परियोजना](docs/chapter-01-foundation/first-project.md) | 30-45 मिनेट | ⭐ |
| **[अध्याय 2: AI विकास](docs/chapter-02-ai-development/README.md)** | AI-प्रथम अनुप्रयोगहरू | [Foundry एकीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI एजेन्टहरू](docs/chapter-02-ai-development/agents.md) &#124; [मोडेल डिप्लोयमेन्ट](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [वर्कशप](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 घण्टा | ⭐⭐ |
| **[अध्याय 3: विन्यास](docs/chapter-03-configuration/README.md)** | प्रमाणीकरण र सुरक्षा | [विन्यास](docs/chapter-03-configuration/configuration.md) &#124; [प्रमाणीकरण र सुरक्षा](docs/chapter-03-configuration/authsecurity.md) | 45-60 मिनेट | ⭐⭐ |
| **[अध्याय 4: पूर्वाधार](docs/chapter-04-infrastructure/README.md)** | IaC र डिप्लोयमेन्ट | [डिप्लोयमेन्ट गाइड](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [प्रोभिजनिङ](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 घण्टा | ⭐⭐⭐ |
| **[अध्याय 5: बहु-एजेन्ट](docs/chapter-05-multi-agent/README.md)** | AI एजेन्ट समाधानहरू | [खुद्रा परिदृश्य](examples/retail-scenario.md) &#124; [समन्वय ढाँचाहरू](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 घण्टा | ⭐⭐⭐⭐ |
| **[अध्याय 6: पूर्व-डिप्लोयमेन्ट](docs/chapter-06-pre-deployment/README.md)** | योजना र भ्यालिडेसन | [प्रीफ्लाइट चेक्स](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [क्षमता योजना](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU चयन](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [एप इन्साइट्स](docs/chapter-06-pre-deployment/application-insights.md) | 1 घण्टा | ⭐⭐ |
| **[अध्याय 7: समस्या समाधान](docs/chapter-07-troubleshooting/README.md)** | डिबग र सुधार | [सामान्य मुद्दाहरू](docs/chapter-07-troubleshooting/common-issues.md) &#124; [डिबगिङ](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI मुद्दाहरू](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 घण्टा | ⭐⭐ |
| **[अध्याय 8: उत्पादन](docs/chapter-08-production/README.md)** | एंटरप्राइज ढाँचाहरू | [उत्पादन अभ्यासहरू](docs/chapter-08-production/production-ai-practices.md) | 2-3 घण्टा | ⭐⭐⭐⭐ |
| **[🎓 कार्यशाला](workshop/README.md)** | व्यवहारिक ल्याब | [परिचय](workshop/docs/instructions/0-Introduction.md) &#124; [छान्ने](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [भ्यालिडेट](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [विच्छेद](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [विन्यास](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [अनुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [टियरडाउन](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [समापन](workshop/docs/instructions/7-Wrap-up.md) | 3-4 घण्टा | ⭐⭐ |

**कुल पाठ्यक्रम अवधि:** ~10-14 घण्टा | **सीप प्रगति:** शुरुवाती → उत्पादन-योग्य

---

## 📚 सिकाइ अध्यायहरू

*अनुभव स्तर र लक्ष्यहरूका आधारमा आफ्नो सिकाइ मार्ग चयन गर्नुहोस्*

### 🚀 अध्याय 1: आधार र छिटो सुरु
**पूर्वापेक्षाहरू**: Azure सदस्यता, आधारभूत कमाण्ड लाइन ज्ञान  
**अवधि**: 30-45 मिनेट  
**जटिलता**: ⭐

#### तपाईंले के सिक्नुहुनेछ
- Azure Developer CLI का आधारभूत अवधारणाहरूको समझ
- आफ्नो प्लेटफर्ममा AZD स्थापना गर्ने तरिका
- तपाईंको पहिलो सफल डिप्लोयमेन्ट

#### सिकाइ स्रोतहरू
- **🎯 सुरु यहाँ**: [Azure Developer CLI के हो?](#what-is-azure-developer-cli)
- **📖 सिद्धान्त**: [AZD आधारभूत](docs/chapter-01-foundation/azd-basics.md) - मुख्य अवधारणाहरू र पदावली
- **⚙️ सेटअप**: [स्थापना र सेटअप](docs/chapter-01-foundation/installation.md) - प्लेटफर्म-विशेष मार्गदर्शिकाहरू
- **🛠️ व्यावहारिक**: [तपाईंको पहिलो परियोजना](docs/chapter-01-foundation/first-project.md) - चरण-दर-चरण ट्युटोरियल
- **📋 छिटो सन्दर्भ**: [कमाण्ड चीट शीट](resources/cheat-sheet.md)

#### व्यावहारिक अभ्यासहरू
```bash
# छिटो स्थापना जाँच
azd version

# तपाईंको पहिलो अनुप्रयोग तैनाथ गर्नुहोस्
azd init --template todo-nodejs-mongo
azd up
```

**💡 अध्याय परिणाम**: AZD प्रयोग गरेर Azure मा सफलतापूर्वक एउटा साधारण वेब अनुप्रयोग डिप्लोय गर्नुहोस्

**✅ सफलता प्रमाणिकरण:**
```bash
# अध्याय 1 पूरा गरेपछि, तपाईंले निम्न गर्न सक्षम हुनुहुनेछ:
azd version              # स्थापित संस्करण देखाउँछ
azd init --template todo-nodejs-mongo  # परियोजना आरम्भ गर्दछ
azd up                  # Azure मा परिनियोजन गर्दछ
azd show                # चलिरहेको अनुप्रयोगको URL देखाउँछ
# अनुप्रयोग ब्राउजरमा खुल्छ र काम गर्दछ
azd down --force --purge  # संसाधनहरू सरसफाइ गर्दछ
```

**📊 समय लगानी:** 30-45 मिनेट  
**📈 पछि सीप स्तर:** साधारण अनुप्रयोगहरू स्वतन्त्र रूपमा डिप्लोय गर्न सक्ने  
**📈 पछि सीप स्तर:** साधारण अनुप्रयोगहरू स्वतन्त्र रूपमा डिप्लोय गर्न सक्ने

---

### 🤖 अध्याय 2: AI-प्रथम विकास (AI विकासकर्ताहरूका लागि सिफारिस)
**पूर्वापेक्षाहरू**: अध्याय 1 पूरा गरिएको हुनुपर्छ  
**अवधि**: 1-2 घण्टा  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- Microsoft Foundry को AZD सँग एकीकरण
- AI-संचालित अनुप्रयोगहरूको डिप्लोयमेन्ट
- AI सेवा विन्यासहरूको समझ

#### सिकाइ स्रोतहरू
- **🎯 सुरु यहाँ**: [Foundry एकीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI एजेन्टहरू**: [AI एजेन्ट मार्गदर्शक](docs/chapter-02-ai-development/agents.md) - AZD सँग बुद्धिमान एजेन्टहरू डिप्लोय गर्नुहोस्
- **📖 ढाँचाहरू**: [AI मोडेल डिप्लोयमेन्ट](docs/chapter-02-ai-development/ai-model-deployment.md) - AI मोडेलहरू डिप्लोय र व्यवस्थापन गर्नुहोस्
- **🛠️ कार्यशाला**: [AI कार्यशाला ल्याब](docs/chapter-02-ai-development/ai-workshop-lab.md) - तपाईंका AI समाधानहरू AZD-तय बनाउनुहोस्
- **🎥 अन्तरक्रियात्मक मार्गदर्शक**: [वर्कशप सामग्रीहरू](workshop/README.md) - ब्राउजर-आधारित सिकाइ MkDocs * DevContainer वातावरण
- **📋 टेम्प्लेटहरू**: [प्रमुख Microsoft Foundry टेम्प्लेटहरू](#कार्यशाला-स्रोतहरू)
- **📝 उदाहरणहरू**: [AZD डिप्लोयमेन्ट उदाहरणहरू](examples/README.md)

#### व्यावहारिक अभ्यासहरू
```bash
# तपाईंको पहिलो एआई अनुप्रयोग तैनाथ गर्नुहोस्
azd init --template azure-search-openai-demo
azd up

# थप एआई टेम्पलेटहरू प्रयास गर्नुहोस्
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 अध्याय परिणाम**: RAG क्षमताहरू भएको AI-संचालित च्याट अनुप्रयोग डिप्लोय र विन्यास गर्नुहोस्

**✅ सफलता प्रमाणिकरण:**
```bash
# अध्याय 2 पछि, तपाईंले यी गर्न सक्षम हुनुहुनेछ:
azd init --template azure-search-openai-demo
azd up
# AI च्याट इन्टरफेस परीक्षण गर्नुहोस्
# प्रश्नहरू सोध्नुहोस् र स्रोतहरू सहित AI-समर्थित उत्तरहरू प्राप्त गर्नुहोस्
# खोज एकीकरण काम गर्छ कि भनेर जाँच गर्नुहोस्
azd monitor  # Application Insights मा टेलिमेट्री देखिन्छ कि जाँच गर्नुहोस्
azd down --force --purge
```

**📊 समय लगानी:** 1-2 घण्टा  
**📈 पछि सीप स्तर:** उत्पादन-तय AI अनुप्रयोगहरू डिप्लोय र विन्यास गर्न सक्ने  
**💰 लागत सचेतना:** विकासमा $80-150/महिना, उत्पादनमा $300-3500/महिना सम्मको लागत बुझ्ने

#### 💰 AI डिप्लोयमेन्टका लागि लागत विचारहरू

**विकास वातावरण (अनुमानित $80-150/महिना):**
- Microsoft Foundry मोडेलहरू (Pay-as-you-go): $0-50/महिना (टोकन प्रयोगमा आधारित)
- AI Search (Basic tier): $75/महिना
- Container Apps (Consumption): $0-20/महिना
- Storage (Standard): $1-5/महिना

**उत्पादन वातावरण (अनुमानित $300-3,500+/महिना):**
- Microsoft Foundry मोडेलहरू (PTU लागि स्थिर प्रदर्शन): $3,000+/महिना वा उच्च मात्रामा Pay-as-you-go
- AI Search (Standard tier): $250/महिना
- Container Apps (Dedicated): $50-100/महिना
- Application Insights: $5-50/महिना
- Storage (Premium): $10-50/महिना

**💡 लागत अनुकूलन सुझावहरू:**
- सिक्नका लागि **Free Tier** Microsoft Foundry मोडेलहरू प्रयोग गर्नुहोस् (Azure OpenAI मा 50,000 टोकन/महिना समावेश)
- विकास गरिरहनु भएको छैन भने स्रोतहरू deallocate गर्न `azd down` चलाउनुहोस्
- सुरुमा consumption-आधारित बिलिङ प्रयोग गर्नुहोस्, उत्पादनका लागि मात्र PTU मा अपग्रेड गर्नुहोस्
- डिप्लोयमेन्ट अघि लागत अनुमान गर्न `azd provision --preview` प्रयोग गर्नुहोस्
- अटो-स्केलिङ सक्षम गर्नुहोस्: केवल वास्तविक प्रयोगको लागि मात्र भुक्तानी गर्नुहोस्

**लागत अनुगमन:**
```bash
# अनुमानित मासिक लागत जाँच गर्नुहोस्
azd provision --preview

# Azure पोर्टलमा वास्तविक लागत अनुगमन गर्नुहोस्
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ अध्याय 3: विन्यास र प्रमाणीकरण
**पूर्वापेक्षाहरू**: अध्याय 1 पूरा गरिएको हुनुपर्छ  
**अवधि**: 45-60 मिनेट  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- वातावरण विन्यास र व्यवस्थापन
- प्रमाणीकरण र सुरक्षा उत्तम अभ्यासहरू
- स्रोत नामकरण र संगठन

#### सिकाइ स्रोतहरू
- **📖 विन्यास**: [विन्यास गाइड](docs/chapter-03-configuration/configuration.md) - वातावरण सेटअप
- **🔐 सुरक्षा**: [प्रमाणीकरण ढाँचाहरू र व्यवस्थManaged identity](docs/chapter-03-configuration/authsecurity.md) - प्रमाणीकरण ढाँचाहरू
- **📝 उदाहरणहरू**: [डेटाबेस अनुप्रयोग उदाहरण](examples/database-app/README.md) - AZD Database उदाहरणहरू

#### व्यावहारिक अभ्यासहरू
- एकै परियोजनामा बहु वातावरणहरू (dev, staging, prod) विन्यास गर्नुहोस्
- व्यवस्थManaged identity प्रमाणीकरण सेट अप गर्नुहोस्
- वातावरण-विशिष्ट विन्यासहरू लागू गर्नुहोस्

**💡 अध्याय परिणाम**: उपयुक्त प्रमाणीकरण र सुरक्षासहित बहु वातावरणहरू व्यवस्थापन गर्नुहोस्

---

### 🏗️ अध्याय 4: कोडको रूपमा पूर्वाधार र डिप्लोयमेन्ट
**पूर्वापेक्षाहरू**: अध्याय 1-3 पूरा गरिएको हुनुपर्छ  
**अवधि**: 1-1.5 घण्टा  
**जटिलता**: ⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- उन्नत डिप्लोयमेन्ट ढाँचाहरू
- Bicep सँग Infrastructure as Code
- स्रोत प्रोभिजनिङ रणनीतिहरू

#### सिकाइ स्रोतहरू
- **📖 डिप्लोयमेन्ट**: [डिप्लोयमेन्ट गाइड](docs/chapter-04-infrastructure/deployment-guide.md) - पूरा वर्कफ्लोहरू
- **🏗️ प्रोभिजनिङ**: [स्रोतहरू प्रोभिजन गर्ने](docs/chapter-04-infrastructure/provisioning.md) - Azure स्रोत व्यवस्थापन
- **📝 उदाहरणहरू**: [Container App उदाहरण](../../examples/container-app) - कन्टेनराइज्ड डिप्लोयमेन्टहरू

#### व्यावहारिक अभ्यासहरू
- कस्टम Bicep टेम्प्लेटहरू सिर्जना गर्नुहोस्
- बहु-सेवा अनुप्रयोगहरू डिप्लोय गर्नुहोस्
- ब्लू-ग्रीन डिप्लोयमेन्ट रणनीतिहरू लागू गर्नुहोस्

**💡 अध्याय परिणाम**: कस्टम पूर्वाधार टेम्प्लेटहरू प्रयोग गरेर जटिल बहु-सेवा अनुप्रयोगहरू डिप्लोय गर्नुहोस्
### 🎯 अध्याय ५: बहु-एजेन्ट AI समाधानहरू (उन्नत)
**पूर्वआवश्यकता**: अध्यायहरू 1-2 पूरा भएको  
**अवधि**: 2-3 घण्टा  
**जटिलता**: ⭐⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- बहु-एजेन्ट वास्तुकला ढाँचाहरू
- एजेन्ट समन्वय र तालमेल
- उत्पादन-तयार AI परिनियोजनहरू

#### सिकाइ स्रोतहरू
- **🤖 विशेष परियोजना**: [रिटेल बहु-एजेन्ट समाधान](examples/retail-scenario.md) - पूर्ण कार्यान्वयन
- **🛠️ ARM टेम्पलेटहरू**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - एक-क्लिक परिनियोजन
- **📖 वास्तुकला**: [बहु-एजेन्ट समन्वय ढाँचा](docs/chapter-06-pre-deployment/coordination-patterns.md) - ढाँचाहरू

#### व्यावहारिक अभ्यासहरू
```bash
# पूर्ण खुद्रा बहु-एजेन्ट समाधान तैनाथ गर्नुहोस्
cd examples/retail-multiagent-arm-template
./deploy.sh

# एजेन्ट विन्यासहरू अन्वेषण गर्नुहोस्
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 अध्याय परिणाम**: ग्राहक र सूची एजेन्टहरूसँग उत्पादन-तयार बहु-एजेन्ट AI समाधान परिनियोजन र व्यवस्थापन गर्नुहोस्

---

### 🔍 अध्याय ६: पूर्व-परिनियोजन प्रमाणिकरण र योजना
**पूर्वआवश्यकता**: अध्याय 4 पूरा भएको  
**अवधि**: 1 घण्टा  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- क्षमता योजना र स्रोत प्रमाणिकरण
- SKU छनोट रणनीतिहरू
- प्रि-फ्लाइट जाँचहरू र स्वचालन

#### सिकाइ स्रोतहरू
- **📊 योजना**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - स्रोत प्रमाणिकरण
- **💰 छनोट**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - लागत-कुशल विकल्पहरू
- **✅ प्रमाणिकरण**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - स्वत: स्क्रिप्टहरू

#### व्यावहारिक अभ्यासहरू
- क्षमता प्रमाणिकरण स्क्रिप्टहरू चलाउनुहोस्
- लागतका लागि SKU छनोटहरू अनुकूलन गर्नुहोस्
- पूर्व-परिनियोजन स्वचालित जाँचहरू कार्यान्वयन गर्नुहोस्

**💡 अध्याय परिणाम**: कार्यान्वयन अघि परिनियोजनहरू प्रमाणित र अनुकूलन गर्नुहोस्

---

### 🚨 अध्याय ७: समस्यासम्बन्धी अनुसन्धान र डिबगिङ
**पूर्वआवश्यकता**: कुनै पनि परिनियोजन अध्याय पूरा भएको  
**अवधि**: 1-1.5 घण्टा  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- व्यवस्थित डिबगिङ विधिहरू
- सामान्य समस्याहरू र समाधानहरू
- AI-विशिष्ट समस्या निवारण

#### सिकाइ स्रोतहरू
- **🔧 सामान्य मुद्दाहरू**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ र समाधानहरू
- **🕵️ डिबगिङ**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - चरण-द्वारा-चरण रणनीतिहरू
- **🤖 AI समस्याहरू**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI सेवा समस्या

#### व्यावहारिक अभ्यासहरू
- परिनियोजन असफलताहरू पहिचान गर्नुहोस्
- प्रमाणीकरण समस्याहरू समाधान गर्नुहोस्
- AI सेवा कनेक्सन डिबग गर्नुहोस्

**💡 अध्याय परिणाम**: सामान्य परिनियोजन समस्या स्वतन्त्र रूपमा पहिचान र समाधान गर्नुहोस्

---

### 🏢 अध्याय ८: उत्पादन र उद्यम ढाँचाहरू
**पूर्वआवश्यकता**: अध्यायहरू 1-4 पूरा भएको  
**अवधि**: 2-3 घण्टा  
**जटिलता**: ⭐⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- उत्पादन परिनियोजन रणनीतिहरू
- उद्यम सुरक्षा ढाँचाहरू
- निगरानी र लागत अनुकूलन

#### सिकाइ स्रोतहरू
- **🏭 उत्पादन**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - उद्यम ढाँचाहरू
- **📝 उदाहरणहरू**: [Microservices Example](../../examples/microservices) - जटिल वास्तुकलाहरू
- **📊 निगरानी**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - निगरानी

#### व्यावहारिक अभ्यासहरू
- उद्यम सुरक्षा ढाँचाहरू कार्यान्वयन गर्नुहोस्
- व्यापक निगरानी सेटअप गर्नुहोस्
- उचित शासनसहित उत्पादनमा परिनियोजन गर्नुहोस्

**💡 अध्याय परिणाम**: पूर्ण उत्पादन क्षमताका साथ उद्यम-तयार अनुप्रयोगहरू परिनियोजन गर्नुहोस्

---

## 🎓 कार्यशाला अवलोकन: व्यावहारिक सिकाइ अनुभव

> **⚠️ WORKSHOP STATUS: Active Development**  
> कार्यशाला सामग्रीहरू हाल विकास र सुधार प्रगतिमा छन्। प्रमुख मोड्युलहरू कार्यशील छन्, तर केही उन्नत खण्डहरू अपूर्ण छन्। हामी सबै सामग्री पूरा गर्न सक्रिय रूपमा काम गरिरहेका छौं। [प्रगति ट्र्याक गर्नुहोस् →](workshop/README.md)

### अन्तरक्रियात्मक कार्यशाला सामग्रीहरू
**ब्राउजर-आधारित उपकरणहरू र मार्गनिर्देश अभ्यासहरू सहित व्यापक व्यावहारिक सिकाइ अनुभव**

हाम्रो कार्यशाला सामग्रीहरूले अध्याय-आधारित पाठ्यक्रमलाई पूरक गर्ने संरचित, अन्तरक्रियात्मक सिकाइ अनुभव प्रदान गर्दछ। कार्यशाला स्व-गति सिकाइ र प्रशिक्षक-नेतृत्व सत्रहरूका लागि डिजाइन गरिएको हो।

#### 🛠️ कार्यशाला सुविधाहरू
- **ब्राउजर-आधारित इन्टरफेस**: खोज, प्रतिलिपि र थिम सुविधाहरू सहित पूर्ण MkDocs-संचालित कार्यशाला
- **GitHub Codespaces एकीकरण**: एक-क्लिक विकास वातावरण सेटअप
- **संरचित सिकाइ मार्ग**: 8-मोड्युल मार्गनिर्देशित अभ्यासहरू (कुल 3-4 घण्टा)
- **प्रगतिशील पद्धति**: परिचय → छनोट → प्रमाणिकरण → डिकन्स्ट्रक्सन → कन्फिगरेसन → अनुकूलन → टियरडाउन → समापन
- **इन्टरएक्टिभ DevContainer वातावरण**: पूर्व-कन्फिगर गरिएको उपकरण र निर्भरताहरू

#### 📚 कार्यशाला मोड्युल संरचना
कार्यशालाले खोजबाट परिनियोजन दक्षता सम्म लैजाने **8-मोड्युल प्रगतिशील पद्धति** अनुसरण गर्दछ:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. परिचय** | Workshop Overview | सिकाइ उद्देश्यहरू, पूर्वआवश्यकताहरू, र कार्यशाला संरचना बुझ्नुहोस् | 15 मिनेट |
| **1. Selection** | Template Discovery | AZD टेम्पलेटहरू अन्वेषण गर्नुहोस् र आफ्नो परिदृश्यका लागि सही AI टेम्पलेट चयन गर्नुहोस् | 20 मिनेट |
| **2. Validation** | Deploy & Verify | `azd up` सँग टेम्पलेट परिनियोजन गर्नुहोस् र पूर्वाधार काम गर्छ कि होइन प्रमाणित गर्नुहोस् | 30 मिनेट |
| **3. Deconstruction** | Understand Structure | GitHub Copilot प्रयोग गरेर टेम्पलेट वास्तुकला, Bicep फाइलहरू, र कोड संगठन अन्वेषण गर्नुहोस् | 30 मिनेट |
| **4. Configuration** | azure.yaml को गहिरो अवलोकन | `azure.yaml` कन्फिगरेसन, लाइफसाइकल हुकहरू, र वातावरण भेरिएबलहरूमा मास्टरी हासिल गर्नुहोस् | 30 मिनेट |
| **5. Customization** | Make It Yours | AI Search, ट्रेसिङ, मूल्यांकन सक्षम गर्नुहोस् र आफ्नो परिदृश्यका लागि अनुकूलन गर्नुहोस् | 45 मिनेट |
| **6. Teardown** | Clean Up | `azd down --purge` प्रयोग गरेर स्रोतहरू सुरक्षित रूपमा डिप्रोभिजन गर्नुहोस् | 15 मिनेट |
| **7. Wrap-up** | Next Steps | उपलब्धिहरू, प्रमुख अवधारणाहरू समीक्षा गर्नुहोस् र सिकाइ यात्रालाई जारी राख्नुहोस् | 15 मिनेट |

**कार्यशाला प्रवाह:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 कार्यशाला सुरु गर्ने तरिका
```bash
# विकल्प 1: GitHub Codespaces (सिफारिस गरिएको)
# रिपोजिटरीमा "Code" → "Create codespace on main" मा क्लिक गर्नुहोस्

# विकल्प 2: स्थानीय विकास
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md मा सेटअप निर्देशहरू पालन गर्नुहोस्
```

#### 🎯 कार्यशाला सिकाइ परिणामहरू
कार्यशाला पूरा गरेर, सहभागीहरूले:
- **उत्पादन AI अनुप्रयोगहरू परिनियोजित गर्नुहोस्**: AZD प्रयोग गरी Microsoft Foundry सेवाहरूको उपयोग गर्नुहोस्
- **बहु-एजेन्ट वास्तुकलाहरूमा निपुण हुनुहोस्**: समन्वित AI एजेन्ट समाधानहरू कार्यान्वयन गर्नुहोस्
- **सुरक्षा उत्तम अभ्यासहरू लागू गर्नुहोस्**: प्रमाणीकरण र पहुँच नियन्त्रण कन्फिगर गर्नुहोस्
- **स्केलका लागि अनुकूलन गर्नुहोस्**: लागत-कुशल, प्रदर्शनशील परिनियोजनहरू डिजाइन गर्नुहोस्
- **परिनियोजन समस्याहरू निवारण गर्नुहोस्**: सामान्य समस्याहरू स्वतन्त्र रूपमा समाधान गर्नुहोस्

#### 📖 कार्यशाला स्रोतहरू
- **🎥 अन्तरक्रियात्मक गाइड**: [Workshop Materials](workshop/README.md) - ब्राउजर-आधारित सिकाइ वातावरण
- **📋 मोड्युल-द्वारा-मोड्युल निर्देशनहरू**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - कार्यशाला अवलोकन र उद्देश्यहरू
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - AI टेम्पलेटहरू खोज्नुहोस् र चयन गर्नुहोस्
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - टेम्पलेट परिनियोजन र प्रमाणिकरण गर्नुहोस्
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - टेम्पलेट वास्तुकला अन्वेषण गर्नुहोस्
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml मा मास्टरी हासिल गर्नुहोस्
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - आफ्नो परिदृश्यका लागि अनुकूलन गर्नुहोस्
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - स्रोतहरू क्लिनअप गर्नुहोस्
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - समीक्षा र आगामी कदमहरू
- **🛠️ AI कार्यशाला ल्याब**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-केन्द्रित अभ्यासहरू
- **💡 द्रुत सुरु**: [Workshop Setup Guide](workshop/README.md#quick-start) - वातावरण कन्फिगरेसन

**उपयुक्त छ**: कर्पोरेट तालिम, विश्वविद्यालय कोर्सहरू, स्व-गति सिकाइ, र विकाशक बुटक्याम्पहरूका लागि।

---

## 📖 गहिरो अवलोकन: AZD क्षमताहरू

बुनियादी कुराहरूभन्दा परे, AZD उत्पादन परिनियोजनहरूको लागि शक्तिशाली सुविधाहरू प्रदान गर्दछ:

- **टेम्पलेट-आधारित परिनियोजनहरू** - सामान्य अनुप्रयोग ढाँचाहरूका लागि पूर्व-निर्मित टेम्पलेटहरूको प्रयोग गर्नुहोस्
- **Infrastructure as Code** - Bicep वा Terraform प्रयोग गरेर Azure स्रोतहरू व्यवस्थापन गर्नुहोस्  
- **एकीकृत वर्कफ्लोहरू** - अनुप्रयोगहरू सहज रूपमा प्रोभिजन, परिनियोजन, र निगरानी गर्नुहोस्
- **डेभलपर-अनुकूल** - डेभलपर उत्पादकता र अनुभवलाई अनुकूलित

### **AZD + Microsoft Foundry: AI परिनियोजनहरूका लागि उत्तम**

**किन AZD AI समाधानहरूका लागि?** AZD ले AI डेभलपर्सले भोग्ने मुख्य चुनौतीहरूको समाधान गर्छ:

- **AI-तयार टेम्पलेटहरू** - Microsoft Foundry Models, Azure AI Services, र ML कार्यभारहरूका लागि पूर्व-कन्फिगर गरिएको टेम्पलेटहरू
- **सुरक्षित AI परिनियोजनहरू** - AI सेवाहरू, API कुञ्जीहरू, र मोडल अन्तबिन्दुहरूको लागि निर्मित सुरक्षा ढाँचाहरू  
- **उत्पादन AI ढाँचाहरू** - स्केलेबल, लागत-कुशल AI अनुप्रयोग परिनियोजनका लागि उत्तम अभ्यासहरू
- **एन्ड-टु-एन्ड AI वर्कफ्लोहरू** - मोडल विकासदेखि उत्पादन परिनियोजनसम्म उचित निगरानी सहित
- **लागत अनुकूलन** - AI कार्यभारहरूको लागि स्मार्ट स्रोत विनियोजन र स्केल रणनीतिहरू
- **Microsoft Foundry एकीकरण** - Microsoft Foundry मोडल क्याटलग र अन्तबिन्दुहरूसँग सहज जडान

---

## 🎯 टेम्पलेटहरू र उदाहरण पुस्तकालय

### विशेष: Microsoft Foundry टेम्पलेटहरू
**यदि तपाईं AI अनुप्रयोगहरू परिनियोजन गर्दै हुनुहुन्छ भने यहाँबाट सुरु गर्नुहोस्!**

> **सूचना:** यी टेम्पलेटहरूले विभिन्न AI ढाँचाहरू देखाउँछन्। केही बाह्य Azure Samples छन्, अन्य स्थानीय कार्यान्वयनहरू हुन्।

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**AI च्याटबाट सुरु गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**AI एजेन्टहरूबाट सुरु गर्नुहोस्**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI डेमो**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **स्थानीय** |

### विशेष: पूर्ण सिकाइ परिदृश्यहरू
**उत्पादन-तयार अनुप्रयोग टेम्पलेटहरू सिकाइ अध्यायहरूसँग मिलाइएको**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | आधारभूत AI परिनियोजन ढाँचाहरू |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | Azure AI Search सँग RAG कार्यान्वयन |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence एकीकरण |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | एजेन्ट फ्रेमवर्क र फंक्शन कलिंग |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | उद्यम AI समन्वय |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | ग्राहक र सूची एजेन्टहरूसँग बहु-एजेन्ट वास्तुकला |

### प्रकारद्वारा उदाहरणबाट सिकाइ

> **📌 स्थानीय बनाम बाह्य उदाहरणहरू:**  
> **स्थानीय उदाहरणहरू** (यस repo मा) = तत्काल प्रयोगका लागि तयार  
> **बाह्य उदाहरणहरू** (Azure Samples) = सम्बन्धित रिपोजिटरीहरूबाट क्लोन गर्नुहोस्

#### स्थानीय उदाहरणहरू (तुरुन्त प्रयोग गर्न तयार)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM टेम्पलेटहरूसहित पूर्ण उत्पादन-तयार कार्यान्वयन
  - बहु-एजेन्ट वास्तुकला (ग्राहक + सूची एजेन्टहरू)
  - व्यापक निगरानी र मूल्याङ्कन
  - ARM टेम्पलेट मार्फत एक-क्लिक परिनियोजन

#### स्थानीय उदाहरणहरू - कन्टेनर अनुप्रयोगहरू (अध्यायहरू 2-5)
**यस रिपोजिटरीमा व्यापक कन्टेनर परिनियोजन उदाहरणहरू:**
- [**कन्टेनर एप उदाहरणहरू**](examples/container-app/README.md) - कन्भेनरीकृत डिप्लोयमेन्टहरूको पूर्ण मार्गदर्शिका
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - स्केल-टु-जीरो सहित आधारभूत REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - उत्पादन-तयार बहु-सेवा डिप्लोयमेन्ट
  - Quick Start, Production, and Advanced deployment patterns
  - Monitoring, security, and cost optimization guidance

#### बाह्य उदाहरणहरू - सरल अनुप्रयोगहरू (अध्याय 1-2)
**सुरु गर्न यी Azure Samples रिपोजिटरीहरू क्लोन गर्नुहोस्:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - आधारभूत डिप्लोयमेन्ट ढाँचाहरू
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - स्टेटिक सामग्री डिप्लोयमेन्ट
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API डिप्लोयमेन्ट

#### बाह्य उदाहरणहरू - डाटाबेस इन्केग्रेशन (अध्याय 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - डाटाबेस कनेक्टिभिटी ढाँचाहरू
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless डेटा वर्कफ्लो

#### बाह्य उदाहरणहरू - उन्नत ढाँचाहरू (अध्याय 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - बहु-सेवा आर्किटेक्चरहरू
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - पृष्ठभूमि प्रशोधन  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - उत्पादन-तयार ML ढाँचाहरू

### बाह्य टेम्प्लेट सङ्ग्रहहरू
- [**आधिकारिक AZD टेम्प्लेट ग्यालरी**](https://azure.github.io/awesome-azd/) - आधिकारिक र सामुदायिक टेम्प्लेटहरूको चुनेको सङ्कलन
- [**Azure Developer CLI टेम्प्लेटहरू**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn टेम्प्लेट दस्तावेजीकरण
- [**उदाहरण निर्देशिका**](examples/README.md) - स्थानीय सिकाइ उदाहरणहरू विस्तृत व्याख्यासहित

---

## 📚 सिकाइ स्रोतहरू र सन्दर्भहरू

### छिटो सन्दर्भहरू
- [**कमान्ड चीट शीट**](resources/cheat-sheet.md) - अध्यायअनुसार व्यवस्थित अनिवार्य azd कमाण्डहरू
- [**शब्दावली**](resources/glossary.md) - Azure र azd शब्दावली  
- [**FAQ**](resources/faq.md) - सिकाइ अध्यायअनुसार व्यवस्थित सामान्य प्रश्नहरू
- [**अध्ययन मार्गदर्शक**](resources/study-guide.md) - व्यापक अभ्यासहरू

### व्यावहारिक कार्यशालाहरू
- [**AI कार्यशाला ल्याब**](docs/chapter-02-ai-development/ai-workshop-lab.md) - तपाईंको AI समाधानहरूलाई AZD-डिप्लोययोग्य बनाउने (2-3 घण्टा)
- [**इन्टरएक्टिभ कार्यशाला**](workshop/README.md) - MkDocs र GitHub Codespaces सहित 8-मोड्युल निर्देशित अभ्यासहरू
  - अनुसरण गर्दछ: परिचय → छनोट → मान्यता → विच्छेदन → कन्फिगरेसन → अनुकूलन → टियरडाउन → समापन

### बाह्य सिकाइ स्रोतहरू
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### तपाइँको सम्पादकका लागि AI एजेन्ट सीपहरू
- [**skills.sh मा Microsoft Azure सीपहरू**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, डिप्लोयमेन्ट, डायग्नोस्टिक्स, लागत अनुकूलन, र अन्यका लागि 37 खुला एजेन्ट सीपहरू। यी GitHub Copilot, Cursor, Claude Code, वा कुनै पनि समर्थित एजेन्टमा स्थापना गर्नुहोस्:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 छिटो समस्याहरू समाधान गर्ने मार्गदर्शिका

**सामान्य समस्याहरू जुन शुरुआतकर्ताले सामना गर्छन् र तुरुन्त समाधानहरू:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# पहिले AZD स्थापना गर्नुहोस्
# विन्डोज (PowerShell):
winget install microsoft.azd

# म्याकओएस:
brew tap azure/azd && brew install azd

# लिनक्स:
curl -fsSL https://aka.ms/install-azd.sh | bash

# स्थापना जाँच गर्नुहोस्
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# उपलब्ध सदस्यताहरू सूचीबद्ध गर्नुहोस्
az account list --output table

# पूर्वनिर्धारित सदस्यता सेट गर्नुहोस्
az account set --subscription "<subscription-id-or-name>"

# AZD वातावरणको लागि सेट गर्नुहोस्
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# सत्यापित गर्नुहोस्
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# विभिन्न Azure क्षेत्रहरू प्रयास गर्नुहोस्
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
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# विकल्प 1: सफा गरेर पुनः प्रयास गर्नुहोस्
azd down --force --purge
azd up

# विकल्प 2: केवल पूर्वाधार ठीक गर्नुहोस्
azd provision

# विकल्प 3: विस्तृत स्थिति जाँच गर्नुहोस्
azd show

# विकल्प 4: Azure Monitor मा लॉगहरू जाँच गर्नुहोस्
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# AZD का लागि फेरि प्रमाणीकरण गर्नुहोस्
azd auth logout
azd auth login

# वैकल्पिक: यदि तपाईं az कमाण्डहरू चलाइरहनु भएको छ भने Azure CLI लाई पनि ताजा गर्नुहोस्
az logout
az login

# प्रमाणीकरण जाँच गर्नुहोस्
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD ले अद्वितीय नामहरू सिर्जना गर्छ, तर द्वन्द्व भएमा:
azd down --force --purge

# त्यसपछि नयाँ वातावरणमा पुन: प्रयास गर्नुहोस्
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ टेम्पलेट डिप्लोयमेन्ट धेरै समय लिँदैछ</strong></summary>

**सामान्य प्रतीक्षाको समय:**
- साधारण वेब एप: 5-10 मिनेट
- डाटाबेस सहित एप: 10-15 मिनेट
- AI अनुप्रयोगहरू: 15-25 मिनेट (OpenAI प्रोभिजनिङ ढिलो हुन्छ)

```bash
# प्रगति जाँच गर्नुहोस्
azd show

# यदि 30 मिनेटभन्दा बढी अड्किएको छ भने, Azure Portal जाँच गर्नुहोस्:
azd monitor --overview
# असफल डिप्लोइमेन्टहरू खोज्नुहोस्
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# आफ्नो Azure भूमिका जाँच गर्नुहोस्
az role assignment list --assignee $(az account show --query user.name -o tsv)

# तपाईंलाई कम्तिमा "Contributor" भूमिका आवश्यक छ
# आफ्नो Azure प्रशासकलाई निम्नलिखित दिन अनुरोध गर्नुहोस्:
# - Contributor (संसाधनहरूको लागि)
# - User Access Administrator (भूमिका नियुक्तिहरूका लागि)
```
</details>

<details>
<summary><strong>❌ "Can't find deployed application URL"</strong></summary>

```bash
# सबै सेवा एन्डप्वाइन्टहरू देखाउनुहोस्
azd show

# वा Azure पोर्टल खोल्नुहोस्
azd monitor

# विशिष्ट सेवाको जाँच गर्नुहोस्
azd env get-values
# *_URL भेरियेबलहरू खोज्नुहोस्
```
</details>

### 📚 पूर्ण समस्यासमाधान स्रोतहरू

- **सामान्य समस्याहरू गाइड:** [विस्तृत समाधानहरू](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-विशेष समस्याहरू:** [AI समस्यासमाधान](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **डिबगिङ गाइड:** [कदम-दर-कदम डिबगिङ](docs/chapter-07-troubleshooting/debugging.md)
- **सहायता प्राप्त गर्नुहोस्:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 कोर्स पूरा गर्नु र प्रमाणन

### प्रगति ट्र्याकिङ
प्रत्येक अध्याय मार्फत तपाईंको सिकाइ प्रगतिको अनुगमन गर्नुहोस्:

- [ ] **अध्याय 1**: आधार र छिटो सुरूवात ✅
- [ ] **अध्याय 2**: AI-प्रथम विकास ✅  
- [ ] **अध्याय 3**: कन्फिगरेसन र प्रमाणीकरण ✅
- [ ] **अध्याय 4**: इन्फ्रास्ट्रक्चर एज़ कोड र डिप्लोयमेन्ट ✅
- [ ] **अध्याय 5**: बहु-एजेन्ट AI समाधानहरू ✅
- [ ] **अध्याय 6**: पूर्व-डिप्लोयमेन्ट मान्यता र योजना ✅
- [ ] **अध्याय 7**: समस्यासमाधान र डिबगिङ ✅
- [ ] **अध्याय 8**: उत्पादन र उद्यम ढाँचाहरू ✅

### सिकाइ प्रमाणिकरण
प्रत्येक अध्याय पूरा गरेपछि आफ्नो ज्ञान प्रमाणित गर्न:
1. **व्यावहारिक अभ्यास**: अध्यायको व्यावहारिक डिप्लोयमेन्ट पूरा गर्नुहोस्
2. **ज्ञान जाँच**: आफ्नो अध्यायको FAQ अनुभाग समीक्षा गर्नुहोस्
3. **समुदाय छलफल**: Azure Discord मा आफ्नो अनुभव साझा गर्नुहोस्
4. **अर्को अध्याय**: अर्को जटिलता स्तरमा सर्नुहोस्

### कोर्स पूरा गर्दा प्राप्त फाइदाहरू
सबै अध्यायहरू पूरा गरेपछि, तपाईंसँग हुनेछ:
- **उत्पादन अनुभव**: Azure मा वास्तविक AI अनुप्रयोगहरू डिप्लोय गरेको अनुभव
- **व्यावसायिक सीपहरू**: उद्यम-तयार डिप्लोयमेन्ट क्षमताहरू  
- **समुदाय मान्यता**: Azure डेवलपर समुदायको सक्रिय सदस्य
- **करियर उन्नति**: मागमा रहेका AZD र AI डिप्लोयमेन्ट विशेषज्ञता

---

## 🤝 समुदाय र समर्थन

### सहायता र समर्थन प्राप्त गर्नुहोस्
- **प्राविधिक समस्याहरू**: [बग रिपोर्ट गर्नुहोस् र सुविधाहरू अनुरोध गर्नुहोस्](https://github.com/microsoft/azd-for-beginners/issues)
- **सिकाइ सम्बन्धी प्रश्नहरू**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) र [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-विशेष सहायता**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **दस्तावेजीकरण**: [आधिकारिक Azure Developer CLI दस्तावेजीकरण](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord बाट समुदाय सम्बन्धी अन्तर्दृष्टि

**#Azure च्यानलबाट हालका मतदान नतिजाहरू:**
- **45%** विकासकर्ताहरूले AI कार्यभारहरूका लागि AZD प्रयोग गर्न चाहन्छन्
- **मुख्य चुनौतीहरू**: बहु-सेवा डिप्लोयमेन्टहरू, प्रमाणपत्र व्यवस्थापन, उत्पादन-तयारी  
- **सबैभन्दा अनुरोध गरिएका**: AI-विशेष टेम्प्लेटहरू, समस्यासमाधान गाइडहरू, उत्तम अभ्यासहरू

**हाम्रो समुदायमा सामेल भएर:**
- आफ्नो AZD + AI अनुभवहरू साझा गर्नुहोस् र सहयोग प्राप्त गर्नुहोस्
- नयाँ AI टेम्प्लेटहरूको प्रारम्भिक प्रिव्यूहरू पहुँच गर्नुहोस्
- AI डिप्लोयमेन्टका उत्तम अभ्यासहरूमा योगदान गर्नुहोस्
- भविष्यका AI + AZD सुविधाहरूको विकासमा प्रभाव पार्नुहोस्

### कोर्समा योगदान गर्ने बारे
हामी योगदानहरूको स्वागत गर्छौं! विवरणका लागि कृपया हाम्रो [Contributing Guide](CONTRIBUTING.md) पढ्नुहोस्:
- **सामग्री सुधारहरू**: अवस्थित अध्यायहरू र उदाहरणहरू सुधार गर्नुहोस्
- **नयाँ उदाहरणहरू**: वास्तविक-विश्व परिदृश्य र टेम्प्लेटहरू थप्नुहोस्  
- **अनुवाद**: बहु-भाषा समर्थन कायम राख्न सहयोग गर्नुहोस्
- **बग रिपोर्टहरू**: शुद्धता र स्पष्टता सुधार गर्नुहोस्
- **समुदाय मापदण्डहरू**: हाम्रो समावेशी समुदाय दिशानिर्देशहरू पालन गर्नुहोस्

---

## 📄 कोर्स जानकारी

### लाइसेन्स
This project is licensed under the MIT License - see the [LICENSE](../../LICENSE) file for details.

### सम्बन्धित Microsoft सिकाइ स्रोतहरू

Our team produces other comprehensive learning courses:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j शुरुवातीहरूका लागि](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js शुरुवातीहरूका लागि](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain शुरुवातीहरूका लागि](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / एजेन्टहरू
[![AZD शुरुवातीहरूका लागि](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI शुरुवातीहरूका लागि](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP शुरुवातीहरूका लागि](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents शुरुवातीहरूका लागि](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### जनरेटिभ AI सिरिज
[![Generative AI शुरुवातीहरूका लागि](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![जनरेटिव AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### मुख्य सिकाइ
[![शुरुआतीहरूको लागि ML](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![शुरुआतीहरूको लागि डाटा विज्ञान](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![शुरुआतीहरूको लागि AI](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![शुरुआतीहरूको लागि साइबर सुरक्षा](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![शुरुआतीहरूको लागि वेब विकास](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![शुरुआतीहरूको लागि IoT](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![शुरुआतीहरूको लागि XR विकास](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot शृंखला
[![AI जोडी प्रोग्रामिङका लागि Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET का लागि Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot साहसिक](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ पाठ्यक्रम नेभिगेसन

**🚀 सिक्न तयार हुनुहुन्छ?**

**शुरुआतीहरू**: यसबाट सुरु गर्नुहोस् [Chapter 1: Foundation & Quick Start](#-chapter-1-foundation--quick-start)  
**AI विकासकर्ताहरू**: सिधै जानुहोस् [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**अनुभवी विकासकर्ताहरू**: सुरु गर्नुहोस् [Chapter 3: Configuration & Authentication](#️-chapter-3-configuration--authentication)

**अर्को कदम**: [Begin Chapter 1 - AZD Basics](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->