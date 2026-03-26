# आपकी पहली परियोजना - व्यावहारिक ट्यूटोरियल

**Chapter Navigation:**
- **📚 Course Home**: [AZD शुरुआती के लिए](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

आपकी पहली Azure Developer CLI परियोजना में आपका स्वागत है! यह व्यापक व्यावहारिक ट्यूटोरियल azd का उपयोग करके Azure पर एक फुल-स्टैक एप्लिकेशन बनाने, तैनात करने और प्रबंधित करने का पूरा मार्गदर्शन प्रदान करता है। आप एक वास्तविक todo ऐप के साथ काम करेंगे जिसमें एक React फ्रंटेंड, Node.js API बैकएंड और MongoDB डेटाबेस शामिल है।

## सीखने के लक्ष्य

इस ट्यूटोरियल को पूरा करने पर, आप:
- टेम्पलेट का उपयोग करके azd प्रोजेक्ट इनिशियलाइज़ेशन वर्कफ़्लो में महारत हासिल करेंगे
- Azure Developer CLI प्रोजेक्ट संरचना और कॉन्फ़िगरेशन फ़ाइलों को समझेंगे
- इन्फ्रास्ट्रक्चर प्रोविजनिंग के साथ Azure पर पूर्ण एप्लिकेशन तैनाती कर पाएंगे
- एप्लिकेशन अपडेट और पुनः तैनाती रणनीतियाँ लागू करेंगे
- विकास और स्टेजिंग के लिए कई एनवायरनमेंट्स का प्रबंधन करेंगे
- संसाधन क्लीनअप और लागत प्रबंधन प्रथाएँ लागू करेंगे

## सीखने के परिणाम

पूरा करने पर, आप सक्षम होंगे:
- टेम्पलेट से स्वतंत्र रूप से azd प्रोजेक्ट इनिशियलाइज़ और कॉन्फ़िगर करना
- azd प्रोजेक्ट संरचनाओं को प्रभावी ढंग से नेविगेट और संशोधित करना
- एक ही कमांड से Azure पर फुल-स्टैक एप्लिकेशन तैनात करना
- सामान्य तैनाती मुद्दों और प्रमाणीकरण समस्याओं का निवारण करना
- विभिन्न तैनाती चरणों के लिए कई Azure एनवायरनमेंट्स का प्रबंधन करना
- एप्लिकेशन अपडेट्स के लिए सतत तैनाती वर्कफ़्लो लागू करना

## शुरू करें

### पूर्वापेक्षाएँ चे‌कलिस्ट
- ✅ Azure Developer CLI इंस्टॉल किया हुआ है ([Installation Guide](installation.md))
- ✅ Azure CLI इंस्टॉल और प्रमाणीकृत
- ✅ आपके सिस्टम पर Git इंस्टॉल है
- ✅ Node.js 16+ (इस ट्यूटोरियल के लिए)
- ✅ Visual Studio Code (अनुशंसित)

### अपना सेटअप सत्यापित करें
```bash
# azd की स्थापना की जाँच करें
azd version
```
### Verify Azure authentication

```bash
az account show
```

### Node.js संस्करण जाँचें
```bash
node --version
```

## चरण 1: एक टेम्पलेट चुनें और आरंभ करें

चलिये एक लोकप्रिय todo एप्लिकेशन टेम्पलेट से शुरू करते हैं जिसमें एक React फ्रंटएंड और Node.js API बैकएंड शामिल है।

```bash
# उपलब्ध टेम्पलेट ब्राउज़ करें
azd template list

# टू-डू ऐप टेम्पलेट आरंभ करें
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# प्रॉम्प्ट्स का पालन करें:
# - एक एनवायरनमेंट नाम दर्ज करें: "dev"
# - एक सब्सक्रिप्शन चुनें (यदि आपके पास कई हैं)
# - एक क्षेत्र चुनें: "East US 2" (या अपना पसंदीदा क्षेत्र)
```

### क्या अभी हुआ?
- टेम्पलेट कोड आपके लोकल डायरेक्टरी में डाउनलोड किया गया
- एक `azure.yaml` फ़ाइल बनाई गई जिसमें सेवा परिभाषाएँ हैं
- `infra/` डायरेक्टरी में इन्फ्रास्ट्रक्चर कोड सेटअप किया गया
- एक एनवायरनमेंट कॉन्फ़िगरेशन बनाया गया

## चरण 2: परियोजना संरचना का अन्वेषण करें

आइए देखें azd ने हमारे लिए क्या बनाया:

```bash
# प्रोजेक्ट संरचना देखें
tree /f   # विंडोज़
# या
find . -type f | head -20   # मैकओएस/लिनक्स
```

आपको यह दिखाई देना चाहिए:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### समझने के लिए प्रमुख फ़ाइलें

**azure.yaml** - आपकी azd परियोजना का मूल:
```bash
# परियोजना का विन्यास देखें
cat azure.yaml
```

**infra/main.bicep** - Infrastructure definition:
```bash
# इन्फ्रास्ट्रक्चर कोड देखें
head -30 infra/main.bicep
```

## चरण 3: अपनी परियोजना अनुकूलित करें (वैकल्पिक)

तैनाती से पहले, आप एप्लिकेशन को अनुकूलित कर सकते हैं:

### फ्रंटएंड संशोधित करें
```bash
# React ऐप कंपोनेंट खोलें
code src/web/src/App.tsx
```

एक सरल परिवर्तन करें:
```typescript
// शीर्षक ढूंढें और उसे बदलें
<h1>My Awesome Todo App</h1>
```

### पर्‍यावरण वेरिएबल्स कॉन्फ़िगर करें
```bash
# कस्टम पर्यावरण चर सेट करें
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# सभी पर्यावरण चर देखें
azd env get-values
```

## चरण 4: Azure पर डिप्लॉय करें

अब रोमांचक भाग — सब कुछ Azure पर तैनात करें!

```bash
# इन्फ्रास्ट्रक्चर और अनुप्रयोग तैनात करें
azd up

# यह कमांड करेगा:
# 1. Azure संसाधनों का प्रावधान करेगा (App Service, Cosmos DB, आदि)
# 2. आपके अनुप्रयोग का निर्माण करेगा
# 3. प्रावधान किए गए संसाधनों पर तैनात करेगा
# 4. अनुप्रयोग का URL प्रदर्शित करेगा
```

### डिप्लॉयमेंट के दौरान क्या हो रहा है?

`azd up` कमांड ये चरण करता है:
1. **Provision** (`azd provision`) - Azure संसाधन बनाता है
2. **Package** - आपके एप्लिकेशन कोड का निर्माण करता है
3. **Deploy** (`azd deploy`) - कोड को Azure संसाधनों पर तैनात करता है

### अपेक्षित आउटपुट
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## चरण 5: अपने एप्लिकेशन का परीक्षण करें

### अपने एप्लिकेशन तक पहुँचें
डिप्लॉयमेंट आउटपुट में दिया गया URL क्लिक करें, या कभी भी प्राप्त करें:
```bash
# एप्लिकेशन के एंडपॉइंट प्राप्त करें
azd show

# अपने ब्राउज़र में एप्लिकेशन खोलें
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo ऐप का परीक्षण करें
1. **एक todo आइटम जोड़ें** - "Add Todo" पर क्लिक करें और एक कार्य दर्ज करें
2. **पूर्ण के रूप में चिह्नित करें** - पूरा किए गए आइटम पर टिक करें
3. **आइटम हटाएँ** - उन todos को हटा दें जिनकी आपको अब आवश्यकता नहीं है

### अपने एप्लिकेशन की निगरानी करें
```bash
# अपने संसाधनों के लिए Azure पोर्टल खोलें
azd monitor

# एप्लिकेशन लॉग देखें
azd monitor --logs

# लाइव मेट्रिक्स देखें
azd monitor --live
```

## चरण 6: परिवर्तन करें और पुनः तैनात करें

चलिये एक बदलाव करते हैं और देखें कि अपडेट करना कितना आसान है:

### API संशोधित करें
```bash
# API कोड संपादित करें
code src/api/src/routes/lists.js
```

एक कस्टम उत्तर हेडर जोड़ें:
```javascript
// एक रूट हैंडलर खोजें और जोड़ें:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### सिर्फ़ कोड परिवर्तन तैनात करें
```bash
# केवल एप्लिकेशन कोड तैनात करें (इन्फ्रास्ट्रक्चर छोड़ें)
azd deploy

# यह 'azd up' की तुलना में बहुत तेज़ है क्योंकि इन्फ्रास्ट्रक्चर पहले से मौजूद है
```

## चरण 7: कई एनवायरनमेंट्स प्रबंधित करें

प्रोडक्शन से पहले परिवर्तनों का परीक्षण करने के लिए एक स्टेजिंग एनवायरनमेंट बनाएं:

```bash
# एक नया स्टेजिंग पर्यावरण बनाएं
azd env new staging

# स्टेजिंग में तैनात करें
azd up

# डेव पर्यावरण में वापस स्विच करें
azd env select dev

# सभी पर्यावरणों को सूचीबद्ध करें
azd env list
```

### पर्‍यावरण की तुलना
```bash
# विकास वातावरण देखें
azd env select dev
azd show

# स्टेजिंग वातावरण देखें
azd env select staging
azd show
```

## चरण 8: संसाधनों की सफाई

जब आप प्रयोग करना समाप्त कर लें, तो चलती लागतों से बचने के लिए सफाई करें:

```bash
# वर्तमान वातावरण के लिए सभी Azure संसाधनों को हटाएँ
azd down

# पुष्टि के बिना जबरन हटाएँ और सॉफ्ट-डिलीट किए गए संसाधनों को स्थायी रूप से हटाएँ
azd down --force --purge

# विशिष्ट वातावरण को हटाएँ
azd env select staging
azd down --force --purge
```

## क्लासिक ऐप बनाम AI-समर्थित ऐप: समान वर्कफ़्लो

आपने अभी एक पारम्परिक वेब एप्लिकेशन तैनात किया। लेकिन अगर आप इसके बजाय एक AI-समर्थित ऐप तैनात करना चाहते—मान लीजिए, Microsoft Foundry Models द्वारा समर्थित एक चैट ऐप?

अच्छी खबर: **वर्कफ़्लो समान है।**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

एकमात्र अंतर वह **टेम्पलेट** है जिससे आप शुरू करते हैं। एक AI टेम्पलेट अतिरिक्त इन्फ्रास्ट्रक्चर शामिल कर सकता है (जैसे Microsoft Foundry Models रिसोर्स या एक AI Search इंडेक्स), लेकिन azd आपके लिए उन सबको संभाल लेता है। आपको नए कमांड सीखने, किसी अलग टूल को अपनाने, या तैनाती के तरीके को बदलने की आवश्यकता नहीं है।

यह azd का मूल सिद्धांत है: **एक कार्यप्रवाह, कोई भी कार्यभार।** आपने इस ट्यूटोरियल में जो कौशल अभ्यास किए—इनिशियलाइज़ करना, तैनात करना, निगरानी करना, पुनः तैनात करना, और क्लीनअप—वे AI एप्लिकेशंस और एजेंट्स पर समान रूप से लागू होते हैं।

---

## आपने क्या सीखा

बधाई हो! आपने सफलतापूर्वक:
- ✅ टेम्पलेट से azd प्रोजेक्ट आरंभ किया
- ✅ परियोजना संरचना और प्रमुख फ़ाइलों का अन्वेषण किया
- ✅ Azure पर एक फुल-स्टैक एप्लिकेशन तैनात किया
- ✅ कोड परिवर्तन किए और पुनः तैनात किया
- ✅ कई एनवायरनमेंट्स का प्रबंधन किया
- ✅ संसाधनों की सफाई की

## 🎯 कौशल सत्यापन अभ्यास

### अभ्यास 1: अलग टेम्पलेट तैनात करें (15 मिनट)
**लक्ष्य**: azd init और तैनाती वर्कफ़्लो में महारत प्रदर्शित करें

```bash
# Python + MongoDB स्टैक आज़माएँ
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# तैनाती सत्यापित करें
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# साफ़ करें
azd down --force --purge
```

**सफलता मानदंड:**
- [ ] एप्लिकेशन बिना त्रुटियों के तैनात होता है
- [ ] ब्राउज़र में एप्लिकेशन URL तक पहुँच संभव है
- [ ] एप्लिकेशन सही ढंग से कार्य करता है (todo जोड़ें/हटाएँ)
- [ ] सभी संसाधनों की सफाई सफलतापूर्वक की गई

### अभ्यास 2: कॉन्फ़िगरेशन अनुकूलित करें (20 मिनट)
**लक्ष्य**: एनवायरनमेंट वेरिएबल कॉन्फ़िगरेशन का अभ्यास करें

```bash
cd my-first-azd-app

# कस्टम पर्यावरण बनाएँ
azd env new custom-config

# कस्टम चर सेट करें
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# चर सत्यापित करें
azd env get-values | grep APP_TITLE

# कस्टम कॉन्फ़िगरेशन के साथ तैनात करें
azd up
```

**सफलता मानदंड:**
- [ ] कस्टम एनवायरनमेंट सफलतापूर्वक बनाया गया
- [ ] एनवायरनमेंट वेरिएबल्स सेट और पुनःप्राप्त किए जा सकते हैं
- [ ] एप्लिकेशन कस्टम कॉन्फ़िगरेशन के साथ तैनात होता है
- [ ] तैनात एप में कस्टम सेटिंग्स सत्यापित की जा सकती हैं

### अभ्यास 3: मल्टी-एनवायरनमेंट वर्कफ़्लो (25 मिनट)
**लक्ष्य**: एनवायरनमेंट प्रबंधन और तैनाती रणनीतियों में महारत हासिल करें

```bash
# डेव वातावरण बनाएँ
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# डेव URL नोट करें
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# स्टेजिंग वातावरण बनाएँ
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# स्टेजिंग URL नोट करें
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# वातावरणों की तुलना करें
azd env list

# दोनों वातावरणों का परीक्षण करें
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# दोनों की सफाई करें
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**सफलता मानदंड:**
- [ ] दो एनवायरनमेंट्स विभिन्न कॉन्फ़िगरेशन के साथ बनाए गए
- [ ] दोनों एनवायरनमेंट्स सफलतापूर्वक तैनात हुए
- [ ] `azd env select` का उपयोग करके एनवायरनमेंट्स के बीच स्विच कर सकते हैं
- [ ] एनवायरनमेंट वेरिएबल्स एनवायरनमेंट्स के बीच अलग हैं
- [ ] दोनों एनवायरनमेंट्स की सफाई सफलतापूर्वक की गई

## 📊 आपकी प्रगति

**समय निवेशित**: ~60-90 मिनट  
**प्राप्त कौशल**:
- ✅ टेम्पलेट-आधारित प्रोजेक्ट इनिशियलाइज़ेशन
- ✅ Azure संसाधन प्रोविज़निंग
- ✅ एप्लिकेशन तैनाती वर्कफ़्लो
- ✅ एनवायरनमेंट प्रबंधन
- ✅ कॉन्फ़िगरेशन प्रबंधन
- ✅ संसाधन क्लीनअप और लागत प्रबंधन

**अगला स्तर**: आप उन्नत कॉन्फ़िगरेशन पैटर्न सीखने के लिए [Configuration Guide](configuration.md) के लिए तैयार हैं!

## सामान्य समस्याओं का निवारण

### प्रमाणीकरण त्रुटियाँ
```bash
# Azure के साथ पुनः प्रमाणीकरण करें
az login

# सब्सक्रिप्शन एक्सेस सत्यापित करें
az account show
```

### डिप्लॉयमेंट विफलताएँ
```bash
# डिबग लॉगिंग सक्षम करें
export AZD_DEBUG=true
azd up --debug

# Azure में एप्लिकेशन लॉग देखें
azd monitor --logs

# Container Apps के लिए Azure CLI का उपयोग करें:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### संसाधन नाम संघर्ष
```bash
# एक अद्वितीय परिवेश नाम का उपयोग करें
azd env new dev-$(whoami)-$(date +%s)
```

### पोर्ट/नेटवर्क समस्याएँ
```bash
# जाँचें कि पोर्ट उपलब्ध हैं या नहीं
netstat -an | grep :3000
netstat -an | grep :3100
```

## अगले कदम

अब जब आप अपनी पहली परियोजना पूरा कर चुके हैं, तो इन उन्नत विषयों का अन्वेषण करें:

### 1. इन्फ्रास्ट्रक्चर अनुकूलित करें
- [कोड के रूप में इन्फ्रास्ट्रक्चर](../chapter-04-infrastructure/provisioning.md)
- [डेटाबेस, स्टोरेज, और अन्य सेवाएँ जोड़ें](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD सेटअप करें
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - पूर्ण CI/CD वर्कफ़्लोज़
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - पाइपलाइन कॉन्फ़िगरेशन

### 3. प्रोडक्शन सर्वोत्तम प्रथाएँ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - सुरक्षा, प्रदर्शन, और निगरानी

### 4. और टेम्पलेट्स खोजें
```bash
# श्रेणी के अनुसार टेम्पलेट ब्राउज़ करें
azd template list --filter web
azd template list --filter api
azd template list --filter database

# विभिन्न तकनीकी स्टैक्स आज़माएँ
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## अतिरिक्त संसाधन

### अध्ययन सामग्री
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### समुदाय और समर्थन
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### टेम्पलेट्स और उदाहरण
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**बधाई हो! आपने अपनी पहली azd परियोजना पूरी कर ली है।** अब आप आत्मविश्वास के साथ Azure पर शानदार एप्लिकेशन बनाने और तैनात करने के लिए तैयार हैं।

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD शुरुआती के लिए](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। हम सटीकता के लिए प्रयास करते हैं, फिर भी कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ को उसकी मूल भाषा में प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। हम इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->