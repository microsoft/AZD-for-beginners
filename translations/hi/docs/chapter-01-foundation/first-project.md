# आपका पहला प्रोजेक्ट - हैंड्स-ऑन ट्यूटोरियल

**अध्याय नेविगेशन:**
- **📚 पाठ्यक्रम होम**: [AZD शुरुआती के लिए](../../README.md)
- **📖 वर्तमान अध्याय**: Chapter 1 - Foundation & Quick Start
- **⬅️ पिछला**: [स्थापना और सेटअप](installation.md)
- **➡️ अगला**: [कॉन्फ़िगरेशन](configuration.md)
- **🚀 अगले अध्याय**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

अपने पहले Azure Developer CLI प्रोजेक्ट में आपका स्वागत है! यह व्यापक हैंड्स-ऑन ट्यूटोरियल azd का उपयोग करके Azure पर एक फ़ुल-स्टैक एप्लिकेशन बनाने, डिप्लॉय करने, और प्रबंधित करने का पूरा मार्गदर्शन प्रदान करता है। आप एक वास्तविक todo एप्लिकेशन के साथ काम करेंगे जिसमें एक React फ्रंटएंड, Node.js API बैकएंड, और MongoDB डेटाबेस शामिल हैं।

## सीखने के लक्ष्य

इस ट्यूटोरियल को पूरा करके, आप:
- टेम्पलेट्स का उपयोग करके azd प्रोजेक्ट इनिशियलाइज़ेशन वर्कफ़्लो में महारत हासिल करेंगे
- Azure Developer CLI प्रोजेक्ट संरचना और कॉन्फ़िगरेशन फ़ाइलों को समझेंगे
- इंफ्रास्ट्रक्चर प्रोविज़निंग के साथ Azure पर पूर्ण एप्लिकेशन डिप्लॉयमेंट निष्पादित करेंगे
- एप्लिकेशन अपडेट और पुनःडिप्लॉयमेंट रणनीतियों को लागू करेंगे
- विकास और स्टेजिंग के लिए कई एनवायरनमेंट्स का प्रबंधन करेंगे
- संसाधन क्लीनअप और लागत प्रबंधन अभ्यास लागू करेंगे

## सीखने के परिणाम

पूर्णता पर, आप सक्षम होंगे:
- टेम्पलेट्स से स्वतंत्र रूप से azd प्रोजेक्ट्स इनिशियलाइज़ और कॉन्फ़िगर करना
- azd प्रोजेक्ट संरचनाओं को प्रभावी ढंग से नेविगेट और संशोधित करना
- एकल कमांड्स का उपयोग करके Azure पर फ़ुल-स्टैक एप्लिकेशन डिप्लॉय करना
- सामान्य डिप्लॉयमेंट मुद्दों और प्रमाणीकरण समस्याओं का निवारण करना
- विभिन्न डिप्लॉयमेंट स्टेजेस के लिए कई Azure एनवायरनमेंट्स का प्रबंधन करना
- एप्लिकेशन अपडेट्स के लिए सतत डिप्लॉयमेंट वर्कफ़्लो लागू करना

## शुरुआत करना

### आवश्यकताओं की चेकलिस्ट
- ✅ Azure Developer CLI इंस्टॉल किया गया है ([इंस्टॉलेशन गाइड](installation.md))
- ✅ Azure CLI इंस्टॉल और प्रमाणीकृत
- ✅ आपकी सिस्टम पर Git इंस्टॉल है
- ✅ Node.js 16+ (इस ट्यूटोरियल के लिए)
- ✅ Visual Studio Code (सिफारिश की गई)

### अपनी सेटअप सत्यापित करें
```bash
# azd की स्थापना की जाँच करें
azd version
```
### Azure प्रमाणीकरण सत्यापित करें

```bash
az account show
```

### Node.js संस्करण जाँचें
```bash
node --version
```

## चरण 1: एक टेम्पलेट चुनें और इनिशियलाइज़ करें

चलो एक लोकप्रिय todo एप्लिकेशन टेम्पलेट से शुरू करते हैं जिसमें एक React फ्रंटएंड और Node.js API बैकएंड शामिल हैं।

```bash
# उपलब्ध टेम्पलेट्स ब्राउज़ करें
azd template list

# todo ऐप टेम्पलेट आरंभ करें
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# निर्देशों का पालन करें:
# - एक एनवायरनमेंट नाम दर्ज करें: "dev"
# - एक सब्सक्रिप्शन चुनें (यदि आपके पास कई हैं)
# - एक क्षेत्र चुनें: "East US 2" (या आपका पसंदीदा क्षेत्र)
```

### अभी क्या हुआ?
- टेम्पलेट कोड आपके लोकल डायरेक्टरी में डाउनलोड किया गया
- सेवा परिभाषाओं के साथ एक `azure.yaml` फ़ाइल बनाई गई
- `infra/` डायरेक्टरी में इंफ्रास्ट्रक्चर कोड सेटअप किया गया
- एक एनवायरनमेंट कॉन्फ़िगरेशन बनाया गया

## चरण 2: प्रोजेक्ट संरचना का अन्वेषण करें

आइए देखें कि azd ने हमारे लिए क्या बनाया:

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

**azure.yaml** - आपके azd प्रोजेक्ट का केंद्र:
```bash
# परियोजना विन्यास देखें
cat azure.yaml
```

**infra/main.bicep** - इन्फ्रास्ट्रक्चर परिभाषा:
```bash
# इन्फ्रास्ट्रक्चर कोड देखें
head -30 infra/main.bicep
```

## चरण 3: अपने प्रोजेक्ट को अनुकूलित करें (वैकल्पिक)

डिप्लॉय करने से पहले, आप एप्लिकेशन को अनुकूलित कर सकते हैं:

### फ्रंटएंड संशोधित करें
```bash
# React ऐप कॉम्पोनेंट खोलें
code src/web/src/App.tsx
```

एक सरल परिवर्तन करें:
```typescript
// शीर्षक खोजें और उसे बदलें
<h1>My Awesome Todo App</h1>
```

### एनवायरनमेंट वेरिएबल्स कॉन्फ़िगर करें
```bash
# कस्टम पर्यावरण चर सेट करें
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# सभी पर्यावरण चर देखें
azd env get-values
```

## चरण 4: Azure पर डिप्लॉय करें

अब सबसे रोमांचक भाग - सब कुछ Azure पर डिप्लॉय करें!

```bash
# इन्फ्रास्ट्रक्चर और एप्लिकेशन तैनात करें
azd up

# यह कमांड करेगा:
# 1. Azure संसाधनों का प्रावधान करेगा (App Service, Cosmos DB, आदि)
# 2. आपके एप्लिकेशन का निर्माण करेगा
# 3. प्रावधान किए गए संसाधनों पर तैनात करेगा
# 4. एप्लिकेशन का URL प्रदर्शित करेगा
```

### डिप्लॉयमेंट के दौरान क्या हो रहा है?

`azd up` कमांड ये कदम करता है:
1. **Provision** (`azd provision`) - Azure संसाधन बनाता है
2. **Package** - आपके एप्लिकेशन कोड का बिल्ड करता है
3. **Deploy** (`azd deploy`) - कोड को Azure संसाधनों पर डिप्लॉय करता है

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

### अपने एप्लिकेशन को एक्सेस करें
डिप्लॉयमेंट आउटपुट में प्रदान किए गए URL पर क्लिक करें, या किसी भी समय इसे प्राप्त करें:
```bash
# एप्लिकेशन एंडपॉइंट प्राप्त करें
azd show

# अपने ब्राउज़र में एप्लिकेशन खोलें
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo ऐप का परीक्षण करें
1. **Add a todo item** - "Add Todo" पर क्लिक करें और एक कार्य दर्ज करें
2. **Mark as complete** - पूर्ण किए गए आइटम्स को चेक करें
3. **Delete items** - उन todos को हटाएँ जिनकी आपको अब आवश्यकता नहीं है

### अपने एप्लिकेशन की निगरानी करें
```bash
# अपने संसाधनों के लिए Azure पोर्टल खोलें
azd monitor

# एप्लिकेशन लॉग देखें
azd monitor --logs

# लाइव मेट्रिक्स देखें
azd monitor --live
```

## चरण 6: परिवर्तन करें और पुनःडिप्लॉय करें

आइए एक बदलाव करें और देखें कि अपडेट करना कितना आसान है:

### API को संशोधित करें
```bash
# API कोड संपादित करें
code src/api/src/routes/lists.js
```

कस्टम रिस्पॉन्स हेडर जोड़ें:
```javascript
// एक रूट हैंडलर खोजें और जोड़ें:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### सिर्फ कोड परिवर्तनों को डिप्लॉय करें
```bash
# केवल एप्लिकेशन कोड तैनात करें (इन्फ्रास्ट्रक्चर को छोड़ें)
azd deploy

# यह 'azd up' की तुलना में बहुत तेज़ है क्योंकि इन्फ्रास्ट्रक्चर पहले से मौजूद है
```

## चरण 7: कई एनवायरनमेंट्स का प्रबंधन करें

उत्पादन से पहले परिवर्तनों का परीक्षण करने के लिए एक स्टेजिंग एनवायरनमेंट बनाएं:

```bash
# एक नया स्टेजिंग वातावरण बनाएं
azd env new staging

# स्टेजिंग पर तैनात करें
azd up

# देव वातावरण पर वापस स्विच करें
azd env select dev

# सभी वातावरण सूचीबद्ध करें
azd env list
```

### एनवायरनमेंट तुलना
```bash
# डेव वातावरण देखें
azd env select dev
azd show

# स्टेजिंग वातावरण देखें
azd env select staging
azd show
```

## चरण 8: संसाधनों की सफाई करें

जब आप प्रयोग करना बंद कर दें, लगातार शुल्क से बचने के लिए क्लीनअप करें:

```bash
# वर्तमान वातावरण के लिए सभी Azure संसाधनों को हटाएँ
azd down

# पुष्टि के बिना जबरदस्ती हटाएँ और सॉफ़्ट-हटाए गए संसाधनों को स्थायी रूप से हटाएँ
azd down --force --purge

# विशिष्ट वातावरण हटाएँ
azd env select staging
azd down --force --purge
```

## आपने क्या सीखा

बधाई हो! आपने सफलतापूर्वक:
- ✅ टेम्पलेट से एक azd प्रोजект इनिशियलाइज़ किया
- ✅ प्रोजेक्ट संरचना और प्रमुख फ़ाइलों का अन्वेषण किया
- ✅ एक फ़ुल-स्टैक एप्लिकेशन Azure पर डिप्लॉय किया
- ✅ कोड परिवर्तन किए और पुनःडिप्लॉय किया
- ✅ कई एनवायरनमेंट्स का प्रबंधन किया
- ✅ संसाधनों की सफाई की

## 🎯 कौशल सत्यापन अभ्यास

### अभ्यास 1: एक अलग टेम्पलेट डिप्लॉय करें (15 मिनट)
**लक्ष्य**: azd init और डिप्लॉयमेंट वर्कफ़्लो में महारत प्रदर्शित करें

```bash
# Python + MongoDB स्टैक आजमाएं
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
- [ ] एप्लिकेशन बिना त्रुटियों के डिप्लॉय होता है
- [ ] ब्राउज़र में एप्लिकेशन URL को एक्सेस कर सकते हैं
- [ ] एप्लिकेशन सही ढंग से कार्य करता है (टोडोस जोड़ें/हटाएँ)
- [ ] सभी संसाधनों को सफलतापूर्वक क्लीनअप किया गया

### अभ्यास 2: कॉन्फ़िगरेशन अनुकूलित करें (20 मिनट)
**लक्ष्य**: एनवायरनमेंट वेरिएबल कॉन्फ़िगरेशन का अभ्यास करें

```bash
cd my-first-azd-app

# कस्टम वातावरण बनाएं
azd env new custom-config

# कस्टम वेरिएबल सेट करें
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# वेरिएबलों को सत्यापित करें
azd env get-values | grep APP_TITLE

# कस्टम कॉन्फ़िग के साथ तैनात करें
azd up
```

**सफलता मानदंड:**
- [ ] कस्टम एनवायरनमेंट सफलतापूर्वक बनाया गया
- [ ] एनवायरनमेंट वेरिएबल सेट और पुनःप्राप्त किए जा सकते हैं
- [ ] कस्टम कॉन्फ़िगरेशन के साथ एप्लिकेशन डिप्लॉय होता है
- [ ] डिप्लॉय किए गए ऐप में कस्टम सेटिंग्स सत्यापित की जा सकती हैं

### अभ्यास 3: मल्टी-एनवायरनमेंट वर्कफ़्लो (25 मिनट)
**लक्ष्य**: एनवायरनमेंट प्रबंधन और डिप्लॉयमेंट रणनीतियों में महारत हासिल करें

```bash
# डेव वातावरण बनाएं
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# डेव यूआरएल नोट करें
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# स्टेजिंग वातावरण बनाएं
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# स्टेजिंग यूआरएल नोट करें
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# वातावरणों की तुलना करें
azd env list

# दोनों वातावरणों का परीक्षण करें
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# दोनों वातावरणों को साफ़ करें
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**सफलता मानदंड:**
- [ ] दो एनवायरनमेंट्स विभिन्न कॉन्फ़िगरेशन के साथ बनाए गए
- [ ] दोनों एनवायरनमेंट्स सफलतापूर्वक डिप्लॉय हुए
- [ ] `azd env select` का उपयोग करके एनवायरनमेंट्स के बीच سوئिच किया जा सकता है
- [ ] एनवायरनमेंट वेरिएबल्स एनवायरनमेंट्स के बीच भिन्न हैं
- [ ] दोनों एनवायरनमेंट्स को सफलतापूर्वक क्लीनअप किया गया

## 📊 आपकी प्रगति

**निवेशित समय**: ~60-90 मिनट  
**प्राप्त कौशल**:
- ✅ टेम्पलेट-आधारित प्रोजेक्ट इनिशियलाइज़ेशन
- ✅ Azure संसाधन प्रोविज़निंग
- ✅ एप्लिकेशन डिप्लॉयमेंट वर्कफ़्लो
- ✅ एनवायरनमेंट प्रबंधन
- ✅ कॉन्फ़िगरेशन प्रबंधन
- ✅ संसाधन क्लीनअप और लागत प्रबंधन

**अगला स्तर**: आप [कॉन्फ़िगरेशन गाइड](configuration.md) के लिए तैयार हैं ताकि आप उन्नत कॉन्फ़िगरेशन पैटर्न सीख सकें!

## सामान्य समस्याओं के निवारण

### प्रमाणीकरण त्रुटियाँ
```bash
# Azure के साथ पुनः प्रमाणीकरण करें
az login

# सब्सक्रिप्शन पहुँच सत्यापित करें
az account show
```

### डिप्लॉयमेंट विफलताएँ
```bash
# डिबग लॉगिंग सक्षम करें
export AZD_DEBUG=true
azd up --debug

# Azure में एप्लिकेशन लॉग्स देखें
azd monitor --logs

# Container Apps के लिए Azure CLI का उपयोग करें:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### संसाधन नाम संघर्ष
```bash
# एक अद्वितीय एनवायरनमेंट नाम का उपयोग करें
azd env new dev-$(whoami)-$(date +%s)
```

### पोर्ट/नेटवर्क समस्याएँ
```bash
# जांचें कि पोर्ट उपलब्ध हैं
netstat -an | grep :3000
netstat -an | grep :3100
```

## अगले कदम

अब जब आपने अपना पहला प्रोजेक्ट पूरा कर लिया है, इन उन्नत शीर्षकों का अन्वेषण करें:

### 1. इन्फ्रास्ट्रक्चर अनुकूलित करें
- [इन्फ्रास्ट्रक्चर ऐज़ कोड](../chapter-04-infrastructure/provisioning.md)
- [डेटाबेस, स्टोरेज, और अन्य सेवाएँ जोड़ें](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD सेटअप करें
- [डिप्लॉयमेंट गाइड](../chapter-04-infrastructure/deployment-guide.md) - पूर्ण CI/CD वर्कफ़्लो
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - पाइपलाइन कॉन्फ़िगरेशन

### 3. प्रोडक्शन सर्वश्रेष्ठ प्रथाएँ
- [डिप्लॉयमेंट गाइड](../chapter-04-infrastructure/deployment-guide.md) - सुरक्षा, प्रदर्शन, और मॉनिटरिंग

### 4. और अधिक टेम्पलेट्स एक्सप्लोर करें
```bash
# श्रेणी के अनुसार टेम्पलेट ब्राउज़ करें
azd template list --filter web
azd template list --filter api
azd template list --filter database

# विभिन्न तकनीकी स्टैक्स आजमाएँ
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
- [आधिकारिक टेम्पलेट गैलरी](https://azure.github.io/awesome-azd/)
- [समुदाय टेम्पलेट्स](https://github.com/Azure-Samples/azd-templates)
- [एंटरप्राइज़ पैटर्न](https://github.com/Azure/azure-dev/tree/main/templates)

---

**आपका पहला azd प्रोजेक्ट पूरा करने के लिए बधाई!** आप अब आत्मविश्वास के साथ Azure पर शानदार एप्लिकेशन बनाने और डिप्लॉय करने के लिए तैयार हैं।

---

**अध्याय नेविगेशन:**
- **📚 पाठ्यक्रम होम**: [AZD शुरुआती के लिए](../../README.md)
- **📖 वर्तमान अध्याय**: Chapter 1 - Foundation & Quick Start
- **⬅️ पिछला**: [स्थापना और सेटअप](installation.md)
- **➡️ अगला**: [कॉन्फ़िगरेशन](configuration.md)
- **🚀 अगले अध्याय**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **अगण पाठ**: [डिप्लॉयमेंट गाइड](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यह दस्तावेज़ एआई अनुवाद सेवा Co‑op Translator (https://github.com/Azure/co-op-translator) का उपयोग करके अनूदित किया गया है। हम सटीकता के लिए प्रयास करते हैं, फिर भी कृपया ध्यान रखें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सिफारिश की जाती है। हम इस अनुवाद के उपयोग से उत्पन्न होने वाली किसी भी गलतफहमी या गलत व्याख्या के लिए उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->