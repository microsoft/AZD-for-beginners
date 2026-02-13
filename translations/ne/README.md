# AZD शुरुआतीहरूका लागि: एक संरचित सिकाइ यात्रा

![AZD-शुरुआतीहरूका लागि](../../translated_images/ne/azdbeginners.5527441dd9f74068.webp) 

[![GitHub अनुगमनकर्ता](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub फोर्कहरू](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub स्टारहरू](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure डिस्कोर्ड](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry डिस्कोर्ड](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### स्वचालित अनुवाद (सधैं अद्यावधिक)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](./README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **स्थानीय रूपमा क्लोन गर्न रुचाउनुहुन्छ?**

> This repository includes 50+ language translations which significantly increases the download size. To clone without translations, use sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> यसले तपाईंलाई कोर्स पूरा गर्न आवश्यक सबै कुराहरू धेरै छिटो डाउनलोडसहित दिन्छ।
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd) के हो?

**Azure Developer CLI (azd)** एक डेवलपर-अनुकूल कमाण्ड-लाइन उपकरण हो जसले Azure मा अनुप्रयोगहरू डिप्लॉय गर्न सजिलो बनाउँछ। दर्जनौं Azure स्रोतहरू म्यानुअली सिर्जना र जडान गर्ने सट्टा, तपाइँले एकै कमाण्डमा सम्पूर्ण अनुप्रयोग डिप्लॉय गर्न सक्नुहुन्छ।

### `azd up` को जादु

```bash
# यो एकल कमाण्डले सबै गर्छ:
# ✅ सबै Azure स्रोतहरू सिर्जना गर्दछ
# ✅ नेटवर्किङ र सुरक्षा कन्फिगर गर्दछ
# ✅ तपाईंको एप्लिकेसन कोड निर्माण गर्दछ
# ✅ Azure मा तैनाथ गर्दछ
# ✅ तपाईंलाई काम गर्ने URL दिन्छ
azd up
```

**यति नै हो!** Azure Portal मा क्लिक गर्न पर्दैन, सुरुमा जटिल ARM टेम्प्लेटहरू सिक्नुपर्दैन, कुनै म्यानुअल कन्फिगरेसन आवश्यक छैन - केवल Azure मा चल्ने अनुप्रयोगहरू।

---

## ❓ Azure Developer CLI बनाम Azure CLI: के फरक छ?

शुरुआतीहरूले सबैभन्दा धेरै सोध्ने प्रश्न यही हो। यहाँ सरल जवाफ छ:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Manage individual Azure resources | Deploy complete applications |
| **Mindset** | Infrastructure-focused | Application-focused |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Must know Azure services | Just know your app |
| **Best For** | DevOps, Infrastructure | Developers, Prototyping |

### सरल उपमा

- **Azure CLI** हाम्रा घर बनाउने सबै उपकरणहरू जस्तै हो - ह्याम्मर, आरी, पाइला। तपाईँले केही पनि बनाउन सक्नुहुन्छ, तर निर्माणको ज्ञान आवश्यक हुन्छ।
- **Azure Developer CLI** एउटा ठेकेदार राख्न जस्तै हो - तपाईँले चाहनु भएको कुरा वर्णन गर्नुहुन्छ, र उनीहरूले निर्माणको काम सम्हाल्छन्।

### कुन अवस्थामा कुन प्रयोग गर्ने

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### यी सँगै काम गर्छन्!

AZD भित्रAzure CLI लाई प्रयोग गर्छ। तपाइँ दुवै प्रयोग गर्न सक्नुहुन्छ:
```bash
# AZD सँग आफ्नो एपलाई डिप्लोय गर्नुहोस्
azd up

# त्यसपछि Azure CLI सँग विशिष्ट स्रोतहरूलाई राम्रोसँग समायोजन गर्नुहोस्
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD मा टेम्प्लेटहरू फेला पार्नुहोस्

शून्यबाट सुरु नगर्नुहोस्! **Awesome AZD** रेडी-टु-डिप्लॉय टेम्प्लेटहरूको समुदाय संग्रह हो:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | एक-क्लिक डिप्लॉयका साथ 200+ टेम्प्लेट ब्राउज गर्नुहोस् |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | आफ्नै टेम्प्लेट समुदायमा योगदान गर्नुहोस् |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | स्टार गर्नुहोस् र स्रोत अन्वेषण गर्नुहोस् |

### Awesome AZD का लोकप्रिय AI टेम्प्लेटहरू

```bash
# Azure OpenAI + AI खोजसँग RAG कुराकानी
azd init --template azure-search-openai-demo

# छिटो AI कुराकानी अनुप्रयोग
azd init --template openai-chat-app-quickstart

# Foundry एजेन्टसहित AI एजेन्टहरू
azd init --template get-started-with-ai-agents
```

---

## 🎯 ३ चरणमा सुरु गर्नुहोस्

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

### चरण 2: Azure मा लगइन गर्नुहोस्

```bash
azd auth login
```

### चरण 3: आफ्नो पहिलो एप डिप्लॉय गर्नुहोस्

```bash
# टेम्प्लेटबाट प्रारम्भ गर्नुहोस्
azd init --template todo-nodejs-mongo

# एजूरमा तैनाथ गर्नुहोस् (सबै कुरा सिर्जना गर्दछ!)
azd up
```

**🎉 यति नै हो!** तपाईंको एप अब Azure मा लाईभ छ।

### सफा गर्नुहोस् (नबिर्सनुहोस्!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 यस कोर्स कसरी प्रयोग गर्ने

यो कोर्स **प्रगतिशील सिकाइ** को लागि डिजाइन गरिएको हो - जहाँ तपाइँ सहज महसुस गर्नुहुन्छ त्यहीँबाट सुरु गर्नुहोस् र क्रमशः अगाडि बढ्नुहोस्:

| Your Experience | Start Here |
|-----------------|------------|
| **Brand new to Azure** | [अध्याय 1: आधार](../..) |
| **Know Azure, new to AZD** | [अध्याय 1: आधार](../..) |
| **Want to deploy AI apps** | [अध्याय 2: AI-प्रथम विकास](../..) |
| **Want hands-on practice** | [🎓 अन्तरक्रियात्मक कार्यशाला](workshop/README.md) - 3-4 hour guided lab |
| **Need production patterns** | [अध्याय 8: उत्पादन र एंटरप्राइज](../..) |

### छिटो सेटअप

1. **यो रिपोजिटरी फोर्क गर्नुहोस्**: [![GitHub फोर्कहरू](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **क्लोन गर्नुहोस्**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **सहायता पाउनुहोस्**: [Azure Discord समुदाय](https://discord.com/invite/ByRwuEEgH4)

> **स्थानीय रूपमा क्लोन गर्न रुचाउनुहुन्छ?**

> This repository includes 50+ language translations which significantly increases the download size. To clone without translations, use sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> यसले तपाईंलाई कोर्स पूरा गर्न आवश्यक सबै कुराहरू धेरै छिटो डाउनलोडसहित दिन्छ।


## कोर्स अवलोकन

संरचित अध्यायहरू मार्फत Azure Developer CLI (azd) मा दक्षता हासिल गर्नुहोस् जुन प्रगतिशील सिकाइका लागि डिजाइन गरिएका छन्। **Microsoft Foundry एकीकरणसँग AI अनुप्रयोग डिप्लॉयमेन्टमा विशेष ध्यान।**

### आधुनिक विकासकर्ताहरूका लागि यो कोर्स किन आवश्यक छ

Microsoft Foundry Discord समुदायका अन्तर्दृष्टिहरूको आधारमा, **45% विकासकर्ताहरू AZD लाई AI वर्कलोडका लागि प्रयोग गर्न चाहन्छन्** तर निम्न चुनौतीहरू सामना गर्दछन्:
- जटिल बहु-सेवा AI वास्तुकला
- उत्पादनमा AI डिप्लॉयमेन्टका उत्तम अभ्यासहरू  
- Azure AI सेवाहरूको एकीकरण र कन्फिगरेसन
- AI वर्कलोडका लागि लागत अनुकूलन
- AI-विशिष्ट डिप्लॉयमेन्ट समस्याहरूको ट्रबलशुटिङ

### सिकाइ लक्ष्यहरू

यो संरचित कोर्स पूरा गरी, तपाइँले:
- **AZD आधारहरूमा महारत हासिल गर्नुहोस्**: मुख्य अवधारणाहरू, स्थापना, र कन्फिगरेसन
- **AI अनुप्रयोगहरू डिप्लॉय गर्नुहोस्**: AZD लाई Microsoft Foundry सेवाहरूको साथ प्रयोग गर्नुहोस्
- **Infrastructure as Code लागू गर्नुहोस्**: Bicep टेम्प्लेटहरूसँग Azure स्रोतहरू व्यवस्थापन गर्नुहोस्
- **डिप्लॉयमेन्टहरू ट्रबलशुट गर्नुहोस्**: सामान्य समस्याहरू समाधान र डिबग गर्नुहोस्
- **उत्पादनका लागि अनुकूलन गर्नुहोस्**: सुरक्षा, स्केलिङ, निगरानी, र लागत व्यवस्थापन
- **मल्टि-एजेन्ट समाधानहरू निर्माण गर्नुहोस्**: जटिल AI वास्तुकलाहरू डिप्लॉय गर्नुहोस्

## 🗺️ कोर्स नक्शा: अध्याय अनुसार छिटो नेभिगेसन

प्रत्येक अध्यायसँग सिकाइ लक्ष्यहरू, छिटो सुरु मार्गदर्शन, र अभ्यासहरू समावेश गरेको समर्पित README छ:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[अध्याय 1: आधार](docs/chapter-01-foundation/README.md)** | शुरुवात | [AZD आधारभूत](docs/chapter-01-foundation/azd-basics.md) &#124; [स्थापना](docs/chapter-01-foundation/installation.md) &#124; [पहिलो परियोजना](docs/chapter-01-foundation/first-project.md) | 30-45 मिनेट | ⭐ |
| **[अध्याय 2: AI-प्रथम विकास](docs/chapter-02-ai-development/README.md)** | AI-प्रथम अनुप्रयोगहरू | [Foundry एकीकरण](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI एजेन्टहरू](docs/chapter-02-ai-development/agents.md) &#124; [मोडेल डिप्लॉयमेन्ट](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [वर्कशप](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 घण्टा | ⭐⭐ |
| **[अध्याय 3: कन्फिगरेसन](docs/chapter-03-configuration/README.md)** | प्रमाणीकरण र सुरक्षा | [कन्फिगरेसन](docs/chapter-03-configuration/configuration.md) &#124; [प्रमाणीकरण र सुरक्षा](docs/chapter-03-configuration/authsecurity.md) | 45-60 मिनेट | ⭐⭐ |
| **[अध्याय 4: पूर्वाधार](docs/chapter-04-infrastructure/README.md)** | IaC र डिप्लॉयमेन्ट | [डिप्लॉयमेन्ट मार्गदर्शक](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [प्रोभिजनिङ](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 घण्टा | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | एआई एजेन्ट समाधानहरू | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 घण्टा | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | योजना र प्रमाणीकरण | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 घण्टा | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | डिबग र समाधान | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 घण्टा | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | उद्यम ढाँचाहरू | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 घण्टा | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | व्यावहारिक प्रयोगशाला | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 घण्टा | ⭐⭐ |

**Total Course Duration:** ~10-14 घण्टा | **Skill Progression:** शुरुआती → उत्पादन-तयार

---

## 📚 Learning Chapters

*तपाईंको अनुभव स्तर र लक्ष्यहरूका आधारमा आफ्नो सिकाइ मार्ग चयन गर्नुहोस्*

### 🚀 Chapter 1: Foundation & Quick Start
**पूर्वआवश्यकताहरू**: Azure सदस्यता, आधारभूत कमाण्ड लाइन ज्ञान  
**समय**: 30-45 मिनेट  
**जटिलता**: ⭐

#### तपाईंले के सिक्नुहुनेछ
- Azure Developer CLI का आधारभूत तत्वहरू बुझ्न
- आफ्नो प्लेटफर्ममा AZD स्थापना गर्ने
- तपाइँको पहिलो सफल डिप्लोइमेन्ट

#### सिकाइ स्रोतहरू
- **🎯 यहाँबाट सुरु गर्नुहोस्**: [Azure Developer CLI के हो?](../..)
- **📖 सिद्धान्त**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - मुख्य अवधारणाहरू र पदावली
- **⚙️ सेटअप**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - प्लेटफर्म-विशिष्ट मार्गदर्शकहरू
- **🛠️ व्यावहारिक**: [Your First Project](docs/chapter-01-foundation/first-project.md) - चरण-द्वारा-चरण ट्युटोरियल
- **📋 द्रुत सन्दर्भ**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### व्यवहारिक अभ्यासहरू
```bash
# छिटो स्थापना जाँच
azd version

# आफ्नो पहिलो अनुप्रयोग तैनाथ गर्नुहोस्
azd init --template todo-nodejs-mongo
azd up
```

**💡 अध्याय परिणाम**: AZD प्रयोग गरी साधारण वेब एप्लिकेशन Azure मा सफलतापूर्वक डिप्लोय गर्नुहोस्

**✅ सफलताको मान्यता:**
```bash
# अध्याय 1 पूरा गरेपछि, तपाईंले यी गर्न सक्षम हुनुहुनेछ:
azd version              # स्थापन गरिएको संस्करण देखाउँछ
azd init --template todo-nodejs-mongo  # परियोजना आरम्भ गर्दछ
azd up                  # Azure मा परिनियोजन गर्छ
azd show                # चलिरहेको एपको URL देखाउँछ
# एप्लिकेसन ब्राउजरमा खुल्छ र काम गर्छ
azd down --force --purge  # संसाधनहरू सफा गर्छ
```

**📊 समय लगानी:** 30-45 मिनेट  
**📈 पछि कौशल स्तर:** आधारभूत अनुप्रयोगहरू स्वतन्त्र रूपमा डिप्लोय गर्न सक्ने

**✅ सफलताको मान्यता:**
```bash
# अध्याय 1 पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
azd version              # स्थापित गरिएको संस्करण देखाउँछ
azd init --template todo-nodejs-mongo  # परियोजना आरम्भ गर्दछ
azd up                  # Azure मा परिनियोजन गर्दछ
azd show                # चलिरहेको एपको URL देखाउँछ
# अनुप्रयोग ब्राउजरमा खुल्छ र ठीकसँग काम गर्छ
azd down --force --purge  # संसाधनहरू सफा गर्दछ
```

**📊 समय लगानी:** 30-45 मिनेट  
**📈 पछि कौशल स्तर:** आधारभूत अनुप्रयोगहरू स्वतन्त्र रूपमा डिप्लोय गर्न सक्ने

---

### 🤖 Chapter 2: AI-First Development (Recommended for AI Developers)
**पूर्वआवश्यकताहरू**: अध्याय १ पूरा  
**समय**: 1-2 घण्टा  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- AZD सँग Microsoft Foundry एकीकरण
- एआई-सक्षम अनुप्रयोगहरू डिप्लोय गर्ने
- एआई सेवा कन्फिगरेसनहरू बुझ्नु

#### सिकाइ स्रोतहरू
- **🎯 यहाँबाट सुरु गर्नुहोस्**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 एआई एजेन्टहरू**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - AZD सँग बुद्धिमान एजेन्टहरू डिप्लोय गर्नुहोस्
- **📖 ढाँचाहरू**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - एआई मोडेलहरू डिप्लोय र व्यवस्थापन गर्ने
- **🛠️ कार्यशाला**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - तपाईंको एआई समाधानहरू AZD-तयार बनाउने
- **🎥 अन्तरक्रियात्मक मार्गदर्शक**: [Workshop Materials](workshop/README.md) - ब्राउजर-आधारित सिकाइ MkDocs * DevContainer वातावरण
- **📋 टेम्प्लेटहरू**: [Microsoft Foundry Templates](../..)
- **📝 उदाहरणहरू**: [AZD Deployment Examples](examples/README.md)

#### व्यवहारिक अभ्यासहरू
```bash
# आफ्नो पहिलो एआई अनुप्रयोग तैनाथ गर्नुहोस्
azd init --template azure-search-openai-demo
azd up

# थप एआई टेम्प्लेटहरू प्रयास गर्नुहोस्
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 अध्याय परिणाम**: RAG क्षमताहरू सहित एआई-सक्षम च्याट अनुप्रयोग डिप्लोय र कन्फिगर गर्नुहोस्

**✅ सफलताको मान्यता:**
```bash
# अध्याय २ पछि, तपाईंले निम्न गर्न सक्षम हुनु पर्छ:
azd init --template azure-search-openai-demo
azd up
# एआई च्याट अन्तरफलक परीक्षण गर्नुहोस्
# प्रश्न सोध्नुहोस् र स्रोतहरूसहित एआई-समर्थित उत्तरहरू प्राप्त गर्नुहोस्
# खोज एकीकरणले काम गर्छ कि भनेर पुष्टि गर्नुहोस्
azd monitor  # Application Insights ले टेलिमेट्री देखाउँछ कि भनेर जाँच गर्नुहोस्
azd down --force --purge
```

**📊 समय लगानी:** 1-2 घण्टा  
**📈 पछि कौशल स्तर:** उत्पादन-तयार एआई अनुप्रयोगहरू डिप्लोय र कन्फिगर गर्न सक्ने  
**💰 लागत चेतना:** विकास लागत $80-150/महिना, उत्पादन लागत $300-3500/महिना बुझ्नुहोस्

#### 💰 एआई डिप्लोइमेन्टका लागि लागत विचारहरू

**विकास वातावरण (अनुमानित $80-150/महिना):**
- Azure OpenAI (Pay-as-you-go): $0-50/महिना (टोकन प्रयोगको आधारमा)
- AI Search (Basic तह): $75/महिना
- Container Apps (Consumption): $0-20/महिना
- Storage (Standard): $1-5/महिना

**उत्पादन वातावरण (अनुमानित $300-3,500+/महिना):**
- Azure OpenAI (PTU लगातार प्रदर्शनका लागि): $3,000+/महिना वा उच्च भोल्युममा Pay-as-you-go
- AI Search (Standard तह): $250/महिना
- Container Apps (Dedicated): $50-100/महिना
- Application Insights: $5-50/महिना
- Storage (Premium): $10-50/महिना

**💡 लागत अनुकूलन सुझावहरू:**
- सिक्नका लागि **निःशुल्क टियर** Azure OpenAI प्रयोग गर्नुहोस् (50,000 टोकन/महिना समावेश)
- सक्रिय रूपमा विकास नगर्दा स्रोतहरू डीअलोकेट गर्न `azd down` चलाउनुहोस्
- उपभोग-आधारित बिलिङबाट सुरु गर्नुहोस्, उत्पादनका लागि मात्र PTU मा अपग्रेड गर्नुहोस्
- डिप्लोयमेन्ट अघि लागत अनुमान गर्न `azd provision --preview` प्रयोग गर्नुहोस्
- आत्म-स्केलिङ सक्षम गर्नुहोस्: वास्तवमा प्रयोगको लागि मात्र तिर्नुहोस्

**लागत अनुगमन:**
```bash
# अनुमानित मासिक लागतहरू जाँच गर्नुहोस्
azd provision --preview

# Azure पोर्टलमा वास्तविक लागतहरू अनुगमन गर्नुहोस्
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapter 3: Configuration & Authentication
**पूर्वआवश्यकताहरू**: अध्याय १ पूरा  
**समय**: 45-60 मिनेट  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- वातावरण कन्फिगरेसन र व्यवस्थापन
- प्रमाणीकरण र सुरक्षा राम्रो अभ्यासहरू
- स्रोत नामकरण र संगठन

#### सिकाइ स्रोतहरू
- **📖 कन्फिगरेसन**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - वातावरण सेटअप
- **🔐 सुरक्षा**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - प्रमाणीकरण ढाँचाहरू
- **📝 उदाहरणहरू**: [Database App Example](examples/database-app/README.md) - AZD डेटाबेस उदाहरणहरू

#### व्यवहारिक अभ्यासहरू
- बहु वातावरणहरू कन्फिगर गर्नुहोस् (dev, staging, prod)
- व्यवस्थापन गरिएको आइडेन्टिटी प्रमाणीकरण सेटअप गर्नुहोस्
- वातावरण-विशिष्ट कन्फिगरेसनहरू लागू गर्नुहोस्

**💡 अध्याय परिणाम**: उपयुक्त प्रमाणीकरण र सुरक्षा सहित बहु वातावरणहरू व्यवस्थापन गर्नुहोस्

---

### 🏗️ Chapter 4: Infrastructure as Code & Deployment
**पूर्वआवश्यकताहरू**: अध्यायहरू 1-3 पूरा  
**समय**: 1-1.5 घण्टा  
**जटिलता**: ⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- उन्नत डिप्लोइमेन्ट ढाँचाहरू
- Bicep सँग Infrastructure as Code
- स्रोत प्रोभिजनिङ रणनीतिहरू

#### सिकाइ स्रोतहरू
- **📖 डिप्लोइमेन्ट**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - पूर्ण वर्कफ्लोहरू
- **🏗️ प्रोभिजनिङ**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure स्रोत व्यवस्थापन
- **📝 उदाहरणहरू**: [Container App Example](../../examples/container-app) - कन्टेनराइज्ड डिप्लोइमेन्टहरू

#### व्यवहारिक अभ्यासहरू
- कस्टम Bicep टेम्प्लेटहरू सिर्जना गर्नुहोस्
- बहु-सर्भिस अनुप्रयोगहरू डिप्लोय गर्नुहोस्
- ब्लू-ग्रीन डिप्लोइमेन्ट रणनीतिहरू लागू गर्नुहोस्

**💡 अध्याय परिणाम**: कस्टम इन्फ्रास्ट्रक्चर टेम्प्लेटहरू प्रयोग गरी जटिल बहु-सर्भिस अनुप्रयोगहरू डिप्लोय गर्नुहोस्

---

### 🎯 Chapter 5: Multi-Agent AI Solutions (Advanced)
**पूर्वआवश्यकताहरू**: अध्यायहरू 1-2 पूरा  
**समय**: 2-3 घण्टा  
**जटिलता**: ⭐⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- मल्टि-एजेन्ट आर्किटेक्चर ढाँचाहरू
- एजेन्ट अर्चेस्ट्रेशन र समन्वय
- उत्पादन-तयार एआई डिप्लोइमेन्टहरू

#### सिकाइ स्रोतहरू
- **🤖 सुविधायुक्त प्रोजेक्ट**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - पूर्ण कार्यान्वयन
- **🛠️ ARM टेम्प्लेटहरू**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - एक-क्लिक डिप्लोइयमेन्ट
- **📖 आर्किटेक्चर**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - ढाँचाहरू

#### व्यवहारिक अभ्यासहरू
```bash
# पूर्ण खुद्रा बहु-एजेन्ट समाधान तैनाथ गर्नुहोस्
cd examples/retail-multiagent-arm-template
./deploy.sh

# एजेन्ट कन्फिगरेसनहरू अन्वेषण गर्नुहोस्
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 अध्याय परिणाम**: कस्टमर र इनभेन्टरी एजेन्टहरूसहित उत्पादन-तयार मल्टि-एजेन्ट एआई समाधान डिप्लोय र व्यवस्थापन गर्नुहोस्

---

### 🔍 Chapter 6: Pre-Deployment Validation & Planning
**पूर्वआवश्यकताहरू**: अध्याय ४ पूरा  
**समय**: 1 घण्टा  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- क्षमता योजना र स्रोत प्रमाणीकरण
- SKU चयन रणनीतिहरू
- प्रि-फ्लाइट जाँचहरू र अटोमेसन

#### सिकाइ स्रोतहरू
- **📊 योजना**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - स्रोत प्रमाणीकरण
- **💰 चयन**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - लागत-कुशल विकल्पहरू
- **✅ प्रमाणीकरण**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - अटोमेटेड स्क्रिप्टहरू

#### व्यवहारिक अभ्यासहरू
- क्षमता प्रमाणीकरण स्क्रिप्टहरू चलाउनुहोस्
- लागतको लागि SKU चयनहरू अनुकूलन गर्नुहोस्
- प्रि-डिप्लोइमेन्ट स्वचालन जाँचहरू लागू गर्नुहोस्

**💡 अध्याय परिणाम**: कार्यान्वयन अघि डिप्लोइमेन्टहरू प्रमाणीकरण र अनुकूलन गर्नुहोस्

---

### 🚨 Chapter 7: Troubleshooting & Debugging
**पूर्वआवश्यकताहरू**: कुनै पनि डिप्लोइमेन्ट अध्याय पूरा  
**समय**: 1-1.5 घण्टा  
**जटिलता**: ⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- व्यवस्थित डिबगिङ उपायहरू
- सामान्य समस्याहरू र समाधानहरू
- एआई-विशिष्ट समस्या निवारण

#### सिकाइ स्रोतहरू
- **🔧 सामान्य समस्याहरू**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ र समाधानहरू
- **🕵️ डिबगिङ**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - चरण-द्वारा-चरण रणनीतिहरू
- **🤖 एआई समस्याहरू**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - एआई सेवा समस्याहरू

#### व्यवहारिक अभ्यासहरू
- डिप्लोइमेन्ट असफलताहरू विश्लेषण गर्नुहोस्
- प्रमाणीकरण समस्याहरू समाधान गर्नुहोस्
- एआई सेवा कनेक्टिविटी डिबग गर्नुहोस्

**💡 अध्याय परिणाम**: सामान्य डिप्लोइमेन्ट समस्याहरू स्वतन्त्र रूपमा विश्लेषण गरी समाधान गर्न सक्ने

---

### 🏢 Chapter 8: Production & Enterprise Patterns
**पूर्वआवश्यकताहरू**: अध्यायहरू 1-4 पूरा  
**समय**: 2-3 घण्टा  
**जटिलता**: ⭐⭐⭐⭐

#### तपाईंले के सिक्नुहुनेछ
- उत्पादन डिप्लोइमेन्ट रणनीतिहरू
- उद्यम सुरक्षा ढाँचाहरू
- अनुगमन र लागत अनुकूलन

#### सिकाइ स्रोतहरू
- **🏭 उत्पादन**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - उद्यम ढाँचाहरू
- **📝 उदाहरणहरू**: [Microservices Example](../../examples/microservices) - जटिल आर्किटेक्चरहरू
- **📊 अनुगमन**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - अनुगमन

#### व्यवहारिक अभ्यासहरू
- उद्यम सुरक्षा ढाँचाहरू लागू गर्नुहोस्
- व्यापक अनुगमन सेटअप गर्नुहोस्
- उचित शासनको साथ उत्पादनमा डिप्लोय गर्नुहोस्

**💡 अध्याय परिणाम**: पूर्ण उत्पादन क्षमतासहित उद्यम-तयार अनुप्रयोगहरू डिप्लोय गर्नुहोस्

---

## 🎓 Workshop Overview: Hands-On Learning Experience

> **⚠️ WORKSHOP STATUS: Active Development**  
> कार्यशाला सामग्रीहरू हाल विकास र परिमार्जनमा छन्। मुख्य मोड्युलहरू कार्यशील छन्, तर केही उन्नत खण्ड अधूरा छन्। हामी सबै सामग्री पूरा गर्न सक्रिय रूपमा काम गरिरहेका छौं। [प्रगति ट्र्याक गर्नुहोस् →](workshop/README.md)

### Interactive Workshop Materials
**ब्राउजर-आधारित उपकरणहरू र दिशानिर्देशयुक्त अभ्यासहरूसँग समग्र व्यावहारिक सिकाइ अनुभव**
हाम्रो कार्यशाला सामग्रीले माथि अध्याय-आधारित पाठ्यक्रमलाई पूरक गर्ने संरचित, अन्तरक्रियात्मक सिकाइ अनुभव प्रदान गर्छ। कार्यशाला आत्म-गतिको सिकाइ र प्रशिक्षक-नेतृत्वित सत्रहरू दुवैका लागि डिजाइन गरिएको हो।

#### 🛠️ कार्यशाला सुविधाहरू
- **ब्राउजर-आधारित इन्टरफेस**: खोज, प्रतिलिपि, र थिम सुविधाहरु सहित सम्पूर्ण MkDocs-संचालित कार्यशाला
- **GitHub Codespaces एकीकरण**: एक-क्लिक विकास वातावरण सेटअप
- **संरचित सिकाइ मार्ग**: 8-मोड्युल निर्देशित अभ्यासहरू (कुल 3-4 घण्टा)
- **प्रगतिशील कार्यप्रणाली**: परिचय → छनोट → प्रमाणीकरण → विघटन → कन्फिगरेसन → अनुकूलन → क्लिनअप → समेटि
- **इन्टरएक्टिभ DevContainer वातावरण**: पूर्व-कन्फिगर गरिएको उपकरण र निर्भरताहरू

#### 📚 कार्यशाला मोड्युल संरचना
कार्यशाला तपाईंलाई पत्ता लगाउने बाटिनर निकालेर परिनियोजन निपुणतामा पुर्‍याउने **8-मोड्युल प्रगतिशील कार्यप्रणाली** अनुसरण गर्छ:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | Understand learning objectives, prerequisites, and workshop structure | 15 min |
| **1. Selection** | Template Discovery | Explore AZD templates and select the right AI template for your scenario | 20 min |
| **2. Validation** | Deploy & Verify | Deploy the template with `azd up` and validate infrastructure works | 30 min |
| **3. Deconstruction** | Understand Structure | Use GitHub Copilot to explore template architecture, Bicep files, and code organization | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | Master `azure.yaml` configuration, lifecycle hooks, and environment variables | 30 min |
| **5. Customization** | Make It Yours | Enable AI Search, tracing, evaluation, and customize for your scenario | 45 min |
| **6. Teardown** | Clean Up | Safely deprovision resources with `azd down --purge` | 15 min |
| **7. Wrap-up** | Next Steps | Review accomplishments, key concepts, and continue your learning journey | 15 min |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 कार्यशालामा सुरु गर्ने तरिका
```bash
# विकल्प 1: GitHub Codespaces (सिफारिस गरिन्छ)
# रिपोजिटरीमा "Code" → "Create codespace on main" मा क्लिक गर्नुहोस्

# विकल्प 2: स्थानीय विकास
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md मा सेटअप निर्देशनहरू अनुसरण गर्नुहोस्
```

#### 🎯 कार्यशाला सिकाइ परिणामहरू
कार्यशाला पूरा गर्दा सहभागीहरूले:
- **उत्पादन-स्तरको AI अनुप्रयोग परिनियोजन गर्नु**: Microsoft Foundry सेवाहरू सहित AZD प्रयोग गर्नु
- **बहु-एजेन्ट आर्किटेक्चरमा निपुण हुनु**: समन्वित AI एजेन्ट समाधानहरू कार्यान्वयन गर्नु
- **सुरक्षा सर्वोत्तम अभ्यासहरू लागू गर्नु**: प्रमाणीकरण र पहुँच नियन्त्रण कन्फिगर गर्नु
- **स्केलका लागि अनुकूलन गर्नु**: लागत-प्रभावी, प्रदर्शनमुखी परिनियोजन डिजाइन गर्नु
- **परिनियोजन समस्याहरू समाधान गर्नु**: सामान्य समस्याहरू स्वतन्त्र रूपमा समाधान गर्नु

#### 📖 कार्यशाला स्रोतहरू
- **🎥 अन्तरक्रियात्मक मार्गदर्शक**: [कार्यशाला सामग्री](workshop/README.md) - ब्राउजर-आधारित सिकाइ वातावरण
- **📋 मोड्युल-द्वारा-मोड्युल निर्देशहरू**:
  - [0. परिचय](workshop/docs/instructions/0-Introduction.md) - कार्यशालाको अवलोकन र उद्देश्यहरू
  - [1. छनोट](workshop/docs/instructions/1-Select-AI-Template.md) - AI टेम्प्लेटहरू फेला पार्ने र छनौट गर्ने
  - [2. प्रमाणीकरण](workshop/docs/instructions/2-Validate-AI-Template.md) - टेम्प्लेट परिनियोजन र प्रमाणीकरण गर्ने
  - [3. विघटन](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - टेम्प्लेट आर्किटेक्चर अन्वेषण गर्ने
  - [4. कन्फिगरेसन](workshop/docs/instructions/4-Configure-AI-Template.md) - `azure.yaml` मा निपुण बन्ने
  - [5. अनुकूलन](workshop/docs/instructions/5-Customize-AI-Template.md) - तपाईंको परिदृश्यका लागि अनुकूलन गर्ने
  - [6. क्लिनअप](workshop/docs/instructions/6-Teardown-Infrastructure.md) - स्रोतहरू सफा गर्ने
  - [7. समेटि](workshop/docs/instructions/7-Wrap-up.md) - समीक्षा र अर्को कदमहरू
- **🛠️ AI कार्यशाला ल्याब**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-केन्द्रित अभ्यासहरू
- **💡 द्रुत सुरु गाइड**: [Workshop Setup Guide](workshop/README.md#quick-start) - वातावरण कन्फिगरेसन

**उपयुक्त लागि**: कर्पोरेट प्रशिक्षण, विश्वविद्यालय पाठ्यक्रम, आत्म-गतिको सिकाइ, र विकासकर्ता बुटक्याम्पहरू।

---

## 📖 डिप डाइभ: AZD क्षमता

आधारभूत कुराहरू भन्दा बाहिर, AZD ले उत्पादन परिनियोजनका लागि शक्तिशाली सुविधाहरू प्रदान गर्छ:

- **टेम्प्लेट-आधारित परिनियोजनहरू** - सामान्य अनुप्रयोग ढाँचाहरूका लागि पूर्व-निर्मित टेम्प्लेटहरू प्रयोग गर्नु
- **Infrastructure as Code** - Bicep वा Terraform प्रयोग गरी Azure स्रोतहरू व्यवस्थापन गर्नु  
- **एकीकृत वर्कफ्लोज़** - अनुप्रयोगहरू सहज रूपमा प्रावधान, परिनियोजन, र अनुगमन गर्नु
- **डेभलपर-मित्रवत** - विकासकर्ता उत्पादकत्व र अनुभवको लागि अनुकूलित

### **AZD + Microsoft Foundry: AI परिनियोजनहरूका लागि उत्तम**

**AI समाधानहरूका लागि AZD किन?** AZD ले AI विकासकर्ताहरूले सामना गर्ने मुख्य चुनौतीहरू समाधान गर्छ:

- **AI-तयार टेम्प्लेटहरू** - Azure OpenAI, Cognitive Services, र ML कार्यभारहरूको लागि पूर्व-कन्फिगर गरिएको टेम्प्लेटहरू
- **सुरक्षित AI परिनियोजनहरू** - AI सेवाहरू, API कुञ्जीहरू, र मोडेल अन्तबिन्दुहरूको लागि बिल्ट-इन सुरक्षा ढाँचाहरू  
- **उत्पादन AI ढाँचाहरू** - स्केलेबल, लागत-प्रभावी AI अनुप्रयोग परिनियोजनका लागि सर्वोत्तम अभ्यासहरू
- **एन्ड-टु-एन्ड AI वर्कफ्लोज़** - मोडेल विकासदेखि उत्पादन परिनियोजनसम्म उपयुक्त अनुगमन सहित
- **लागत अनुकूलन** - AI कार्यभारहरूको लागि स्मार्ट स्रोत विनियोजन र स्केलिङ रणनीतिहरू
- **Microsoft Foundry एकीकरण** - Microsoft Foundry मोडेल क्याटलग र अन्तबिन्दुहरूसँग सहज जडान

---

## 🎯 टेम्प्लेटहरू & उदाहरण पुस्तकालय

### विशेष: Microsoft Foundry टेम्प्लेटहरू
**AI अनुप्रयोगहरू परिनियोजन गर्दै हुनुहुन्छ भने यहाँबाट सुरु गर्नुहोस्!**

> **Note:** यी टेम्प्लेटहरूले विभिन्न AI ढाँचाहरू प्रदर्शन गर्छन्। केही बाह्य Azure Samples हुन्, अन्य स्थानीय कार्यान्वयनहरू हुन्।

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | अध्याय 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | बाह्य |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | अध्याय 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| बाह्य |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | बाह्य |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | बाह्य |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | बाह्य |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | बाह्य |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **स्थानीय** |

### विशेष: पूर्ण सिकाइ परिदृश्यहरू
**उत्पादन-तयार अनुप्रयोग टेम्प्लेटहरू सिकाइ अध्यायहरूमा म्याप गरिएको**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | अध्याय 2 | ⭐ | आधारभूत AI परिनियोजन ढाँचाहरू |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | अध्याय 2 | ⭐⭐ | Azure AI Search सँग RAG कार्यान्वयन |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | अध्याय 4 | ⭐⭐ | Document Intelligence एकीकरण |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | अध्याय 5 | ⭐⭐⭐ | एजेन्ट फ्रेमवर्क र फङ्क्शन कलिङ |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | अध्याय 8 | ⭐⭐⭐ | एन्तरप्राइज AI आयोजना |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | अध्याय 5 | ⭐⭐⭐⭐ | ग्राहक र इन्वेन्टरी एजेन्टहरूसँग बहु-एजेन्ट आर्किटेक्चर |

### प्रकार अनुसार सिकाइ

> **📌 स्थानीय बनाम बाह्य उदाहरणहरू:**  
> **स्थानीय उदाहरणहरू** (यस रिपोमा) = तुरुन्त प्रयोग गर्न तयार  
> **बाह्य उदाहरणहरू** (Azure Samples) = लिंक भएका रिपोजबाट क्लोन गर्नुहोस्

#### स्थानीय उदाहरणहरू (तुरुन्त प्रयोग गर्न तयार)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM टेम्प्लेटहरूसहित पूर्ण उत्पादन-तयार कार्यान्वयन
  - बहु-एजेन्ट आर्किटेक्चर (ग्राहक + इन्वेन्टरी एजेन्टहरू)
  - व्यापक अनुगमन र मूल्याङ्कन
  - ARM टेम्प्लेट मार्फत एक-क्लिक परिनियोजन

#### स्थानीय उदाहरणहरू - कन्टेनर अनुप्रयोगहरू (अध्याय 2-5)
**यस रिपोमा समग्र कन्टेनर परिनियोजन उदाहरणहरू:**
- [**Container App Examples**](examples/container-app/README.md) - कन्टेनराइज्ड परिनियोजनहरूको पूर्ण मार्गदर्शिका
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - scale-to-zero सहित आधारभूत REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - उत्पादन-तयार बहु-सेवा परिनियोजन
  - द्रुत सुरु, उत्पादन, र उन्नत परिनियोजन ढाँचाहरू
  - अनुगमन, सुरक्षा, र लागत अनुकूलन मार्गदर्शन

#### बाह्य उदाहरणहरू - सरल अनुप्रयोगहरू (अध्याय 1-2)
**सुरु गर्न यी Azure Samples रिपोज क्लोन गर्नुहोस्:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - आधारभूत परिनियोजन ढाँचाहरू
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - स्थिर सामग्री परिनियोजन
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API परिनियोजन

#### बाह्य उदाहरणहरू - डेटाबेस एकीकरण (अध्याय 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - डेटाबेस जडान ढाँचाहरू
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - सर्भरलेस डेटा वर्कफ्लो

#### बाह्य उदाहरणहरू - उन्नत ढाँचाहरू (अध्याय 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - बहु-सेवा आर्किटेक्चरहरू
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - पृष्ठभूमि प्रशोधन  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - उत्पादन-तयार ML ढाँचाहरू

### बाह्य टेम्प्लेट संग्रहहरू
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - आधिकारिक र समुदाय टेम्प्लेटहरूको क्युरेट गरिएको संग्रह
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn टेम्प्लेट दस्तावेज
- [**Examples Directory**](examples/README.md) - विस्तृत व्याख्यासहित स्थानीय सिकाइ उदाहरणहरू

---

## 📚 सिकाइ स्रोतहरू र सन्दर्भहरू

### द्रुत सन्दर्भहरू
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - अध्यायअनुसार व्यवस्थित आवश्यक azd कमाण्डहरू
- [**Glossary**](resources/glossary.md) - Azure र azd शब्दावली  
- [**FAQ**](resources/faq.md) - सिकाइ अध्यायअनुसार सामान्य प्रश्नहरू
- [**Study Guide**](resources/study-guide.md) - व्यापक अभ्यास अभ्यासहरू

### हात-मा-गर्न सकिने कार्यशाला
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - तपाईंको AI समाधानहरू AZD-परिनियोज्य बनाउन (2-3 घण्टा)
- [**इन्टरएक्टिभ कार्यशाला**](workshop/README.md) - MkDocs र GitHub Codespaces सहित 8-मोड्युल निर्देशित अभ्यासहरू
  - अनुसरण गर्छ: परिचय → छनोट → प्रमाणीकरण → विघटन → कन्फिगरेसन → अनुकूलन → क्लिनअप → समेटि

### बाह्य सिकाइ स्रोतहरू
- Azure Developer CLI Documentation: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure Architecture Center: https://learn.microsoft.com/en-us/azure/architecture/
- Azure Pricing Calculator: https://azure.microsoft.com/pricing/calculator/
- Azure Status: https://status.azure.com/

---

## 🔧 द्रुत समस्या समाधान मार्गदर्शिका

**सुरुवातीहरूलाई आउने सामान्य समस्याहरू र तत्काल समाधानहरू:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# पहिले AZD स्थापना गर्नुहोस्
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
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

# पुष्टि गर्नुहोस्
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# विभिन्न Azure क्षेत्रहरू प्रयास गर्नुहोस्
azd env set AZURE_LOCATION "westus2"
azd up

# वा विकासमा साना SKUहरू प्रयोग गर्नुहोस्
# infra/main.parameters.json सम्पादन गर्नुहोस्:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>
```bash
# विकल्प 1: सफा गरेर फेरि प्रयास गर्नुहोस्
azd down --force --purge
azd up

# विकल्प 2: केवल पूर्वाधार ठीक गर्नुहोस्
azd provision

# विकल्प 3: विस्तृत स्थिति जाँच गर्नुहोस्
azd show

# विकल्प 4: Azure Monitor मा लगहरू जाँच गर्नुहोस्
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "प्रमाणीकरण असफल" वा "टोकनको म्याद सकियो"</strong></summary>

```bash
# पुनः प्रमाणीकरण गर्नुहोस्
az logout
az login

azd auth logout
azd auth login

# प्रमाणीकरण जाँच गर्नुहोस्
az account show
```
</details>

<details>
<summary><strong>❌ "स्रोत पहिले नै अवस्थित छ" वा नामिक द्वन्द्वहरू</strong></summary>

```bash
# AZD अद्वितीय नामहरू सिर्जना गर्छ, तर यदि टकराव भएमा:
azd down --force --purge

# त्यसपछि नयाँ वातावरणमा फेरि प्रयास गर्नुहोस्
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ टेम्प्लेट तैनाथी धेरै समय लिइरहेको छ</strong></summary>

**साधारण प्रतीक्षा समयहरू:**
- सरल वेब एप: 5-10 minutes
- डेटाबेस भएको एप: 10-15 minutes
- एआई अनुप्रयोगहरू: 15-25 minutes (OpenAI प्राविजनिङ ढिलो हुन्छ)

```bash
# प्रगति जाँच गर्नुहोस्
azd show

# यदि ३० मिनेटभन्दा बढी अड्किनुभयो भने, Azure पोर्टल जाँच गर्नुहोस्:
azd monitor
# असफल परिनियोजनहरू खोज्नुहोस्
```
</details>

<details>
<summary><strong>❌ "अनुमति अस्वीकृत" वा "Forbidden"</strong></summary>

```bash
# आफ्नो Azure भूमिका जाँच गर्नुहोस्
az role assignment list --assignee $(az account show --query user.name -o tsv)

# तपाईंलाई कम्तीमा "Contributor" भूमिका चाहिन्छ
# आफ्नो Azure प्रशासकलाई अनुमति दिन अनुरोध गर्नुहोस्:
# - Contributor (स्रोतहरूको लागि)
# - User Access Administrator (भूमिका नियुक्तिहरूका लागि)
```
</details>

<details>
<summary><strong>❌ तैनाथ गरिएको अनुप्रयोगको URL फेला पार्न सकिँदैन</strong></summary>

```bash
# सबै सेवा अन्तबिन्दुहरू देखाउनुहोस्
azd show

# वा Azure पोर्टल खोल्नुहोस्
azd monitor

# निर्दिष्ट सेवा जाँच गर्नुहोस्
azd env get-values
# *_URL भेरिएबलहरू खोज्नुहोस्
```
</details>

### 📚 पूर्ण समस्या निवारण स्रोतहरू

- **सामान्य समस्याहरू मार्गदर्शक:** [विस्तृत समाधानहरू](docs/chapter-07-troubleshooting/common-issues.md)
- **एआई-विशिष्ट समस्याहरू:** [एआई समस्या निवारण](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **डिबगिङ मार्गदर्शक:** [स्टेप-बाई-स्टेप डिबगिङ](docs/chapter-07-troubleshooting/debugging.md)
- **सहायता प्राप्त गर्नुहोस्:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 पाठ्यक्रम पूरा र प्रमाणिकरण

### प्रगति अनुगमन
हेरेक अध्याय मार्फत आफ्नो सिकाइको प्रगति अनुगमन गर्नुहोस्:

- [ ] **अध्याय 1**: आधार र छिटो आरम्भ ✅
- [ ] **अध्याय 2**: एआई-प्रथम विकास ✅  
- [ ] **अध्याय 3**: कन्फिगरेसन र प्रमाणीकरण ✅
- [ ] **अध्याय 4**: इन्फ्रास्ट्रक्चर एज़ कोड र तैनाथी ✅
- [ ] **अध्याय 5**: बहु-एजेन्ट एआई समाधानहरू ✅
- [ ] **अध्याय 6**: पूर्व-तैनाथी मान्यकरण र योजना ✅
- [ ] **अध्याय 7**: समस्या निवारण र डिबगिङ ✅
- [ ] **अध्याय 8**: उत्पादन र एंटरप्राइज ढाँचाहरू ✅

### सिकाइको सत्यापन
हरेक अध्याय पूरा गरेपछि, आफ्नो ज्ञान यसरी सत्यापित गर्नुहोस्:
1. **व्यावहारिक अभ्यास**: अध्यायको व्यावहारिक तैनाथी पूरा गर्नुहोस्
2. **ज्ञान परीक्षण**: आफ्नो अध्यायको FAQ अनुभाग समीक्षा गर्नुहोस्
3. **समुदाय चर्चा**: Azure Discord मा आफ्नो अनुभव साझा गर्नुहोस्
4. **अर्को अध्याय**: अर्को अध्यायमा अघि बढ्नुहोस्

### पाठ्यक्रम पूरा गर्दा प्राप्त हुने फाइदाहरू
सबै अध्यायहरू पूरा गरेपछि, तपाईंले प्राप्त गर्नुहुनेछ:
- **उत्पादन अनुभव**: Azure मा वास्तविक एआई अनुप्रयोगहरू तैनाथ गर्ने अनुभव
- **व्यावसायिक सीपहरू**: एंटरप्राइज-तयार तैनाथी क्षमता  
- **समुदाय मान्यता**: Azure विकासकर्ता समुदायको सक्रिय सदस्य
- **क्यारियर उन्नति**: मागमा रहेको AZD र एआई तैनाथी विशेषज्ञता

---

## 🤝 समुदाय र समर्थन

### सहायता र समर्थन प्राप्त गर्नुहोस्
- **प्राविधिक समस्या**: [बग रिपोर्ट र फीचर अनुरोध गर्नुहोस्](https://github.com/microsoft/azd-for-beginners/issues)
- **सिकाइ सम्बन्धी प्रश्नहरू**: [Microsoft Azure Discord समुदाय](https://discord.gg/microsoft-azure) र [![माइक्रोसफ्ट फाउन्ड्री डिस्कर्ड](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **एआई-विशिष्ट सहायता**: जुड्नुहोस् [![माइक्रोसफ्ट फाउन्ड्री डिस्कर्ड](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **प्रलेखन**: [आधिकारिक Azure Developer CLI प्रलेखन](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### माइक्रोसफ्ट फाउन्ड्री डिस्कर्डबाट समुदायको अंतर्दृष्टि

**#Azure च्यानलबाट भर्खरैको पोल परिणाम:**
- **45%** विकासकर्ताहरूले AZD लाई AI वर्कलोडहरूका लागि प्रयोग गर्न चाहन्छन्
- **मुख्य चुनौतीहरू**: बहु-सेवा तैनाथी, प्रमाण-पत्र व्यवस्थापन, उत्पादन तयारी  
- **सबैभन्दा धेरै अनुरोध गरिएका**: एआई-विशिष्ट टेम्पलेटहरू, समस्या निवारण मार्गदर्शकहरू, उत्कृष्ट अभ्यासहरू

हाम्रो समुदायमा सामेल भएर:
- आफ्नो AZD + AI अनुभवहरू साझा गर्नुहोस् र सहायता प्राप्त गर्नुहोस्
- नयाँ एआई टेम्पलेटहरूको प्रारम्भिक प्रिभ्यू पहुँच गर्नुहोस्
- एआई तैनाथीका उत्कृष्ट अभ्यासहरूमा योगदान गर्नुहोस्
- भविष्यका AI + AZD फीचर विकासमा प्रभाव पार्नुहोस्

### पाठ्यक्रममा योगदान
हामी योगदान स्वागत गर्दछौं! विवरणका लागि कृपया हाम्रो [योगदान मार्गदर्शिका](CONTRIBUTING.md) पढ्नुहोस्:
- **सामग्री सुधारहरू**: विद्यमान अध्यायहरू र उदाहरणहरू सुधार गर्नुहोस्
- **नयाँ उदाहरणहरू**: वास्तविक-विश्व परिदृश्य र टेम्पलेटहरू थप्नुहोस्  
- **अनुवाद**: बहु-भाषामा समर्थन कायम राख्न मद्दत गर्नुहोस्
- **बग रिपोर्टहरू**: शुद्धता र स्पष्टता सुधार गर्नुहोस्
- **समुदाय मापदण्ड**: हाम्रा समावेशी समुदाय दिशानिर्देशहरू पालना गर्नुहोस्

---

## 📄 पाठ्यक्रम जानकारी

### लाइसेन्स
यो परियोजना MIT License अन्तर्गत लाइसेन्स गरिएको छ - विवरणका लागि [LICENSE](../../LICENSE) फाइल हेर्नुहोस्।

### सम्बन्धित Microsoft सिकाइ स्रोतहरू

हाम्रा टोलीले अन्य व्यापक सिकाइ पाठ्यक्रमहरू उत्पादन गर्दछ:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### जनरेटिभ एआई शृंखला
[![जनरेटिभ एआई शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![जनरेटिभ एआई (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![जनरेटिभ एआई (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![जनरेटिभ एआई (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### मुख्य सिकाइ
[![ML शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![डाटा साइन्स शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![साइबर सुरक्षा शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![वेब विकास शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR विकास शुरुवातकर्ताहरूका लागि](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot शृंखला
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ पाठ्यक्रम नेभिगेसन

**🚀 सिकाइ सुरु गर्न तयार?**

**शुरुआतीहरू**: [अध्याय 1: आधार र छिटो आरम्भ](../..)  
**एआई विकासकर्ताहरू**: मा जानुहोस् [अध्याय 2: एआई-प्रथम विकास](../..)  
**अनुभवी विकासकर्ताहरू**: बाट सुरु गर्नुहोस् [अध्याय 3: कन्फिगरेसन र प्रमाणीकरण](../..)

**अर्को कदमहरू**: [अध्याय 1 सुरु गर्नुहोस् - AZD आधारभूत](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यस कागजातलाई AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धताका लागि प्रयासरत हुँदासमेत, कृपया जान्नुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुन सक्छ। मूल भाषामा रहेको मूल कागजातलाई अधिकारिक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि पेशेवर मानवीय अनुवाद सिफारिस गरिन्छ। यो अनुवाद प्रयोग गर्दा हुने कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->