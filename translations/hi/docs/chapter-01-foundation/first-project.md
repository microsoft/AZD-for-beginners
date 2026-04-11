# आपका पहला प्रोजेक्ट - हैंड्स-ऑन ट्यूटोरियल

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 1 - फाउंडेशन और क्विक स्टार्ट
- **⬅️ पिछला**: [इंस्टॉलेशन और सेटअप](installation.md)
- **➡️ अगला**: [कॉन्फ़िगरेशन](configuration.md)
- **🚀 अगला अध्याय**: [अध्याय 2: AI-फर्स्ट डेवलपमेंट](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

आपके पहले Azure Developer CLI प्रोजेक्ट में आपका स्वागत है! यह व्यापक हैंड्स-ऑन ट्यूटोरियल azd का उपयोग करके Azure पर एक फुल-स्टैक एप्लिकेशन बनाने, तैनात करने, और प्रबंधित करने का पूरा मार्गदर्शन प्रदान करता है। आप एक वास्तविक todo एप्लिकेशन के साथ काम करेंगे जिसमें React फ्रंटेंड, Node.js API बैकएंड, और MongoDB डेटाबेस शामिल हैं।

## सीखने के उद्देश्य

इस ट्यूटोरियल को पूरा करके, आप:
- टेम्प्लेट्स का उपयोग करके azd प्रोजेक्ट initialization वर्कफ़्लो में महारत हासिल करेंगे
- Azure Developer CLI प्रोजेक्ट संरचना और कॉन्फ़िगरेशन फ़ाइलें समझेंगे
- अवसंरचना प्रोविज़निंग के साथ Azure पर पूरी एप्लिकेशन की तैनाती को निष्पादित करेंगे
- एप्लिकेशन अपडेट और पुन: तैनाती रणनीतियों को लागू करेंगे
- विकास और स्टेजिंग के लिए कई परिवेशों का प्रबंधन करेंगे
- संसाधन क्लीनअप और लागत प्रबंधन प्रथाओं को लागू करेंगे

## सीखने के परिणाम

पूरा करने पर, आप सक्षम होंगे:
- स्वतंत्र रूप से टेम्प्लेट्स से azd प्रोजेक्ट्स को आरंभ और कॉन्फ़िगर करना
- प्रभावी ढंग से azd प्रोजेक्ट संरचनाओं को नेविगेट और संशोधित करना
- Azure पर केवल एक कमांड से फुल-स्टैक एप्लिकेशन तैनात करना
- सामान्य तैनाती समस्याओं और प्रमाणीकरण समस्याओं का निवारण करना
- विभिन्न तैनाती चरणों के लिए कई Azure परिवेशों का प्रबंधन करना
- एप्लिकेशन अपडेट्स के लिए सतत तैनाती वर्कफ़्लो लागू करना

## शुरुआत कैसे करें

### आवश्यकताएँ चेकलिस्ट
- ✅ Azure Developer CLI इंस्टॉल किया हुआ है ([इंस्टॉलेशन गाइड](installation.md))
- ✅ `azd auth login` के साथ AZD प्रमाणीकरण पूरा हुआ
- ✅ आपके सिस्टम पर Git इंस्टॉल है
- ✅ Node.js 16+ (इस ट्यूटोरियल के लिए)
- ✅ Visual Studio Code (अनुशंसित)

जारी रखने से पहले, रिपॉजिटरी रूट से सेटअप वैलिडेटर चलाएं:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### अपने सेटअप को सत्यापित करें
```bash
# azd स्थापना जांचें
azd version

# AZD प्रमाणीकरण जांचें
azd auth login --check-status
```

### वैकल्पिक Azure CLI प्रमाणीकरण सत्यापित करें

```bash
az account show
```

### Node.js संस्करण जांचें
```bash
node --version
```

## चरण 1: टेम्प्लेट चुनें और आरंभ करें

आइए एक लोकप्रिय todo एप्लिकेशन टेम्प्लेट से शुरू करें जिसमें React फ्रंटेंड और Node.js API बैकएंड शामिल हैं।

```bash
# उपलब्ध टेम्प्लेट ब्राउज़ करें
azd template list

# टुडू ऐप टेम्प्लेट प्रारंभ करें
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# संकेतों का पालन करें:
# - एक पर्यावरण नाम दर्ज करें: "dev"
# - एक सदस्यता चुनें (यदि आपके पास कई हैं)
# - एक क्षेत्र चुनें: "East US 2" (या आपकी पसंदीदा क्षेत्र)
```

### क्या हुआ अभी-अभी?
- टेम्प्लेट कोड आपके स्थानीय डायरेक्टरी में डाउनलोड किया गया
- सर्विस परिभाषाओं सहित `azure.yaml` फ़ाइल बनाई गई
- `infra/` डायरेक्टरी में अवसंरचना कोड सेटअप किया गया
- एक परिवेश कॉन्फ़िगरेशन बनाया गया

## चरण 2: प्रोजेक्ट संरचना का अन्वेषण करें

आइए देखें कि azd ने हमारे लिए क्या बनाया है:

```bash
# परियोजना संरचना देखें
tree /f   # विंडोज़
# या
find . -type f | head -20   # मैकओएस/लिनक्स
```

आपको दिखाई देगा:
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

### समझने के लिए मुख्य फ़ाइलें

**azure.yaml** - आपके azd प्रोजेक्ट का दिल:
```bash
# परियोजना विन्यास देखें
cat azure.yaml
```

**infra/main.bicep** - अवसंरचना परिभाषा:
```bash
# इन्फ्रास्ट्रक्चर कोड देखें
head -30 infra/main.bicep
```

## चरण 3: अपने प्रोजेक्ट को कस्टमाइज़ करें (वैकल्पिक)

डिप्लॉय करने से पहले, आप एप्लिकेशन को कस्टमाइज़ कर सकते हैं:

### फ्रंटेंड संशोधित करें
```bash
# React ऐप कॉम्पोनेन्ट खोलें
code src/web/src/App.tsx
```

एक सरल बदलाव करें:
```typescript
// शीर्षक खोजें और इसे बदलें
<h1>My Awesome Todo App</h1>
```

### परिवेश वेरिएबल कॉन्फ़िगर करें
```bash
# कस्टम पर्यावरण चर सेट करें
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# सभी पर्यावरण चर देखें
azd env get-values
```

## चरण 4: Azure पर तैनात करें

अब रोमांचक भाग - सब कुछ Azure पर तैनात करें!

```bash
# अवसंरचना और अनुप्रयोग तैनात करें
azd up

# यह कमांड निम्न करेगा:
# 1. Azure संसाधनों (App Service, Cosmos DB, आदि) का प्रावधान करें
# 2. आपका अनुप्रयोग बनाएँ
# 3. प्रावधान किए गए संसाधनों पर तैनात करें
# 4. अनुप्रयोग URL प्रदर्शित करें
```

### तैनाती के दौरान क्या हो रहा है?

`azd up` कमांड ये चरण पूरा करता है:
1. **Provision** (`azd provision`) - Azure संसाधनों का निर्माण करता है
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
तैनाती आउटपुट में दिया गया URL क्लिक करें, या कभी भी प्राप्त करें:
```bash
# एप्लिकेशन एंडपॉइंट प्राप्त करें
azd show

# अपने ब्राउज़र में एप्लिकेशन खोलें
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo ऐप का परीक्षण करें
1. **एक todo आइटम जोड़ें** - "Add Todo" पर क्लिक करें और एक टास्क दर्ज करें
2. **पूरा हुआ चिन्हित करें** - पूर्ण किए गए आइटमों को चेक करें
3. **आइटम मिटाएं** - जिन todos की ज़रूरत नहीं, उन्हें हटा दें

### अपने एप्लिकेशन की निगरानी करें
```bash
# अपने संसाधनों के लिए Azure पोर्टल खोलें
azd monitor

# एप्लिकेशन लॉग देखें
azd monitor --logs

# लाइव मैट्रिक्स देखें
azd monitor --live
```

## चरण 6: बदलाव करें और पुनः तैनात करें

चलिए एक बदलाव करते हैं और देखते हैं कि अपडेट करना कितना आसान है:

### API संशोधित करें
```bash
# API कोड संपादित करें
code src/api/src/routes/lists.js
```

एक कस्टम प्रतिक्रिया हेडर जोड़ें:
```javascript
// एक रूट हैंडलर खोजें और जोड़ें:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### केवल कोड परिवर्तन तैनात करें
```bash
# केवल एप्लिकेशन कोड तैनात करें (इन्फ्रास्ट्रक्चर छोड़ें)
azd deploy

# यह 'azd up' की तुलना में बहुत तेज़ है क्योंकि इन्फ्रास्ट्रक्चर पहले से मौजूद है
```

## चरण 7: कई परिवेशों का प्रबंधन करें

उत्पादन से पहले परिवर्तनों का परीक्षण करने के लिए एक स्टेजिंग परिवेश बनाएँ:

```bash
# एक नया स्टेजिंग वातावरण बनाएं
azd env new staging

# स्टेजिंग पर तैनात करें
azd up

# देव वातावरण पर वापस स्विच करें
azd env select dev

# सभी वातावरणों की सूची बनाएं
azd env list
```

### परिवेश तुलना
```bash
# देव वातावरण देखें
azd env select dev
azd show

# स्टेजिंग वातावरण देखें
azd env select staging
azd show
```

## चरण 8: संसाधनों की सफाई करें

जब आप प्रयोग करना बंद कर दें, तो लगातार शुल्क से बचने के लिए क्लीनअप करें:

```bash
# वर्तमान वातावरण के लिए सभी Azure संसाधन हटाएं
azd down

# पुष्टि के बिना जबरन हटाएं और सॉफ्ट-डिलीट किए गए संसाधनों को पूरी तरह मिटाएं
azd down --force --purge

# विशिष्ट वातावरण को हटाएं
azd env select staging
azd down --force --purge
```

## क्लासिक ऐप और AI-संचालित ऐप: एक ही वर्कफ़्लो

आपने अभी एक पारंपरिक वेब एप्लिकेशन तैनात किया। लेकिन अगर आप AI-संचालित ऐप तैनात करना चाहते थे — जैसे Microsoft Foundry मॉडल द्वारा समर्थित चैट एप्लिकेशन?

अच्छी खबर: **वर्कफ़्लो एक समान है।**

| चरण | क्लासिक टोडो ऐप | AI चैट ऐप |
|------|-----------------|------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

अंतर केवल उस **टेम्प्लेट** का है जिससे आप शुरू करते हैं। एक AI टेम्प्लेट अतिरिक्त अवसंरचना (जैसे Microsoft Foundry मॉडल संसाधन या AI Search इंडेक्स) शामिल करता है, लेकिन azd यह सब आपके लिए संभालता है। आपको नए कमांड सीखने, अलग टूल अपनाने या तैनाती के तरीके को बदलने की आवश्यकता नहीं है।

यह azd का मूल सिद्धांत है: **एक वर्कफ़्लो, कोई भी वर्कलोड।** आपने इस ट्यूटोरियल में जो कौशल अभ्यास किया – initialization, तैनाती, मॉनिटरिंग, पुनः तैनाती, और क्लीनअप – वे AI एप्लिकेशन और एजेंट्स के लिए समान रूप से लागू होते हैं।

---

## आपने क्या सीखा है

बधाई हो! आपने सफलतापूर्वक:
- ✅ टेम्प्लेट से एक azd प्रोजेक्ट initialized किया
- ✅ प्रोजेक्ट संरचना और मुख्य फाइलों का अन्वेषण किया
- ✅ Azure पर एक फुल-स्टैक एप्लिकेशन तैनात किया
- ✅ कोड में बदलाव किए और पुनः तैनात किया
- ✅ कई परिवेशों का प्रबंधन किया
- ✅ संसाधनों की सफाई की

## 🎯 कौशल सत्यापन अभ्यास

### अभ्यास 1: एक अलग टेम्प्लेट तैनात करें (15 मिनट)
**लक्ष्य**: azd init और तैनाती वर्कफ़्लो की महारत दिखाएं

```bash
# Python + MongoDB स्टैक आज़माएं
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# परिनियोजन सत्यापित करें
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# साफ़ करें
azd down --force --purge
```

**सफलता के मानदंड:**
- [ ] एप्लिकेशन बिना त्रुटि के तैनात हो
- [ ] ब्राउज़र में एप्लिकेशन URL तक पहुंच सके
- [ ] एप्लिकेशन ठीक से कार्य करे (todo जोड़ें/निकालें)
- [ ] सभी संसाधनों की सफलतापूर्वक सफाई की गई हो

### अभ्यास 2: कॉन्फ़िगरेशन कस्टमाइज़ करें (20 मिनट)
**लक्ष्य**: परिवेश वेरिएबल कॉन्फ़िगरेशन का अभ्यास करें

```bash
cd my-first-azd-app

# कस्टम पर्यावरण बनाएं
azd env new custom-config

# कस्टम वेरिएबल सेट करें
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# वेरिएबल सत्यापित करें
azd env get-values | grep APP_TITLE

# कस्टम कॉन्फ़िग के साथ तैनात करें
azd up
```

**सफलता के मानदंड:**
- [ ] कस्टम परिवेश सफलतापूर्वक बनाया गया
- [ ] परिवेश चर सेट और पुनः प्राप्त किए जा सकते हैं
- [ ] एप्लिकेशन कस्टम कॉन्फ़िगरेशन के साथ तैनात है
- [ ] तैनात एप्लिकेशन में कस्टम सेटिंग्स सत्यापित कर सकते हैं

### अभ्यास 3: मल्टी-परिवेश वर्कफ़्लो (25 मिनट)
**लक्ष्य**: परिवेश प्रबंधन और तैनाती रणनीतियों में महारत हासिल करें

```bash
# विकास वातावरण बनाएँ
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# विकास URL नोट करें
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

# दोनों को साफ करें
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**सफलता के मानदंड:**
- [ ] दो अलग-अलग कॉन्फ़िगरेशन के साथ दो पर्यावरण बनाए गए
- [ ] दोनों परिवेश सफलतापूर्वक तैनात किए गए
- [ ] `azd env select` का उपयोग करके परिवेशों के बीच स्विच कर सकते हैं
- [ ] परिवेश चर परिवेशों के बीच भिन्न हैं
- [ ] दोनों परिवेशों की सफलतापूर्वक सफाई की गई

## 📊 आपकी प्रगति

**समय निवेशित**: ~60-90 मिनट  
**अर्जित कौशल**:
- ✅ टेम्प्लेट आधारित प्रोजेक्ट initialization
- ✅ Azure संसाधन प्रोविज़निंग
- ✅ एप्लिकेशन तैनाती वर्कफ़्लो
- ✅ परिवेश प्रबंधन
- ✅ कॉन्फ़िगरेशन प्रबंधन
- ✅ संसाधन क्लीनअप और लागत प्रबंधन

**अगला स्तर**: आप [कॉन्फ़िगरेशन गाइड](configuration.md) के लिए तैयार हैं ताकि उन्नत कॉन्फ़िगरेशन पैटर्न सीख सकें!

## सामान्य समस्याओं का निवारण

### प्रमाणीकरण त्रुटियाँ
```bash
# Azure के साथ पुनः प्रमाणीकरण करें
az login

# सदस्यता पहुँच सत्यापित करें
az account show
```

### तैनाती असफलताएँ
```bash
# डिबग लॉगिंग सक्षम करें
export AZD_DEBUG=true
azd up --debug

# Azure में एप्लिकेशन लॉग देखें
azd monitor --logs

# कंटेनर ऐप्स के लिए, Azure CLI का उपयोग करें:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### संसाधन नाम संघर्ष
```bash
# एक अद्वितीय पर्यावरण नाम का उपयोग करें
azd env new dev-$(whoami)-$(date +%s)
```

### पोर्ट/नेटवर्क समस्याएं
```bash
# जांचें कि पोर्ट उपलब्ध हैं या नहीं
netstat -an | grep :3000
netstat -an | grep :3100
```

## अगले कदम

अब जब आपने अपना पहला प्रोजेक्ट पूरा कर लिया है, तो इन उन्नत विषयों का अन्वेषण करें:

### 1. अवसंरचना कस्टमाइज़ करें
- [इन्फ्रास्ट्रक्चर ऐज़ कोड](../chapter-04-infrastructure/provisioning.md)
- [डेटाबेस, स्टोरेज, और अन्य सेवाएँ जोड़ें](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD सेटअप करें
- [तैनाती गाइड](../chapter-04-infrastructure/deployment-guide.md) - पूर्ण CI/CD वर्कफ़्लोज़
- [Azure Developer CLI डाक्यूमेंटेशन](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - पाइपलाइन कॉन्फ़िगरेशन

### 3. उत्पादन के लिए सर्वोत्तम प्रथाएँ
- [तैनाती गाइड](../chapter-04-infrastructure/deployment-guide.md) - सुरक्षा, प्रदर्शन, और मॉनिटरिंग

### 4. और टेम्प्लेट्स अन्वेषण करें
```bash
# श्रेणी के अनुसार टेम्पलेट ब्राउज़ करें
azd template list --filter web
azd template list --filter api
azd template list --filter database

# विभिन्न टेक्नोलॉजी स्टैक्स आज़माएँ
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## अतिरिक्त संसाधन

### सीखने की सामग्री
- [Azure Developer CLI डाक्यूमेंटेशन](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर केंद्र](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure वेल-आर्किटेक्टेड फ्रेमवर्क](https://learn.microsoft.com/en-us/azure/well-architected/)

### समुदाय और समर्थन
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer समुदाय](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### टेम्प्लेट्स और उदाहरण
- [ऑफिशियल टेम्प्लेट गैलरी](https://azure.github.io/awesome-azd/)
- [समुदाय टेम्प्लेट्स](https://github.com/Azure-Samples/azd-templates)
- [एंटरप्राइज पैटर्न](https://github.com/Azure/azure-dev/tree/main/templates)

---

**आपका पहला azd प्रोजेक्ट पूरा करने पर बधाई!** अब आप Azure पर आश्चर्यजनक एप्लिकेशन बनाने और तैनात करने के लिए तैयार हैं।

---

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 1 - फाउंडेशन और क्विक स्टार्ट
- **⬅️ पिछला**: [इंस्टॉलेशन और सेटअप](installation.md)
- **➡️ अगला**: [कॉन्फ़िगरेशन](configuration.md)
- **🚀 अगला अध्याय**: [अध्याय 2: AI-फर्स्ट डेवलपमेंट](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **अगले पाठ**: [तैनाती गाइड](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या असंगतियां हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में मान्य स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सलाह दी जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->