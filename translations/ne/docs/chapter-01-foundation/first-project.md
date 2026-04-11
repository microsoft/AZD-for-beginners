# तपाईंको पहिलो प्रोजेक्ट - हातेमालो ट्युटोरियल

**अध्याय नेभिगेसन:**
- **📚 कोर्स गृहपृष्ठ**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय १ - आधार र छिटो सुरु
- **⬅️ अघिल्लो**: [इन्स्टलेशन र सेटअप](installation.md)
- **➡️ अर्को**: [कन्फिगरेसन](configuration.md)
- **🚀 अर्को अध्याय**: [अध्याय २: AI-प्रथमतः विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

तपाईंको पहिलो Azure Developer CLI प्रोजेक्टमा स्वागत छ! यो व्यापक हातेमालो ट्युटोरियलले azd प्रयोग गरेर Azure मा पूर्ण-स्ट्याक एप्लिकेशन सिर्जना, डिप्लोय र व्यवस्थापन गर्ने सम्पूर्ण प्रक्रिया प्रदान गर्दछ। तपाईंले React फ्रन्टएन्ड, Node.js API ब्याकएन्ड, र MongoDB डाटाबेस सहितको वास्तविक todo एप्लिकेशनसँग काम गर्नुहुनेछ।

## सिकाइ लक्ष्यहरू

यो ट्युटोरियल पूरा गरेर तपाईंले:
- टेम्प्लेट प्रयोग गरेर azd प्रोजेक्ट इनिसियलाइजेसन वर्कफ्लोमा दक्षता हासिल गर्नुहोस्
- Azure Developer CLI प्रोजेक्टको संरचना र कन्फिगरेसन फाइलहरू बुझ्नुहोस्
- इन्फ्रास्ट्रक्चर प्रोभिजनिङ सहित Azure मा पूर्ण एप्लिकेशन डिप्लोय गर्नुहोस्
- एप्लिकेशन अपडेट र पुन:डिप्लोय रणनीतिहरू कार्यान्वयन गर्नुहोस्
- विकास र स्टेजिङका लागि बहुविध वातावरण व्यवस्थापन गर्नुहोस्
- स्रोत सरसफाई र लागत व्यवस्थापन अभ्यासहरू लागू गर्नुहोस्

## सिकाइ परिणामहरू

पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- टेम्प्लेटबाट azd प्रोजेक्टहरू स्वतन्त्र रूपमा इनिसियलाइज र कन्फिगर गर्न
- azd प्रोजेक्ट संरचनाहरू प्रभावकारी रूपमा नेभिगेट र परिमार्जन गर्न
- एउटै कमाण्डबाट Azure मा पूर्ण-स्ट्याक एप्लिकेशन डिप्लोय गर्न
- सामान्य डिप्लोयमेन्ट समस्या र प्रमाणीकरण समस्याहरू समाधान गर्न
- विभिन्न डिप्लोयमेन्ट स्टेजका लागि बहुविध Azure वातावरणहरू व्यवस्थापन गर्न
- एप्लिकेशन अपडेटका लागि निरन्तर डिप्लोयमेन्ट वर्कफ्लोहरू लागू गर्न

## सुरु गर्नुहोस्

### पूर्वशर्त सूची
- ✅ Azure Developer CLI इन्स्टल गरिएको ([इन्स्टलेशन गाइड](installation.md))
- ✅ `azd auth login` द्वारा AZD प्रमाणीकरण सम्पन्न गरिएको
- ✅ तपाईँको प्रणालीमा Git इन्स्टल गरिएको
- ✅ Node.js १६+ (यो ट्युटोरियलको लागि)
- ✅ Visual Studio Code (सिफारिस गरिएको)

अगाडि बढ्नु अघि, रिपोजिटोरी मूलबाट सेटअप भ्यालिडेटर चलाउनुहोस्:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### तपाईँको सेटअप प्रमाणीकरण गर्नुहोस्
```bash
# azd इन्स्टलेसन जाँच गर्नुहोस्
azd version

# AZD प्रमाणीकरण जाँच गर्नुहोस्
azd auth login --check-status
```

### वैकल्पिक Azure CLI प्रमाणीकरण प्रमाणीकरण गर्नुहोस्

```bash
az account show
```

### Node.js संस्करण जाँच गर्नुहोस्
```bash
node --version
```

## चरण १: टेम्प्लेट छनौट र इनिसियलाइज गर्नुहोस्

React फ्रन्टएन्ड र Node.js API ब्याकएन्ड समावेश गर्न लोकप्रिय todo एप्लिकेशन टेम्प्लेटबाट सुरु गरौं।

```bash
# उपलब्ध टेम्प्लेटहरू ब्राउज गर्नुहोस्
azd template list

# टुडू एप टेम्प्लेट सुरु गर्नुहोस्
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# निर्देशनहरू पालना गर्नुहोस्:
# - वातावरण नाम प्रविष्ट गर्नुहोस्: "dev"
# - सदस्यता चयन गर्नुहोस् (यदि तपाईं सँग धेरै छन् भने)
# - क्षेत्र चयन गर्नुहोस्: "East US 2" (वा तपाईंको रुचाइएको क्षेत्र)
```

### के भयो?
- टेम्प्लेट कोड तपाईंको स्थानिय डाइरेक्टरीमा डाउनलोड गरियो
- सेवा परिभाषाहरू सहित `azure.yaml` फाइल सिर्जना गरियो
- `infra/` डाइरेक्टरीमा इन्फ्रास्ट्रक्चर कोड सेटअप गरियो
- वातावरण कन्फिगरेसन सिर्जना गरियो

## चरण २: प्रोजेक्ट संरचना अन्वेषण गर्नुहोस्

azd ले हामीलाई के बनायो हेर्नुहोस्:

```bash
# परियोजनाको संरचना हेर्नुहोस्
tree /f   # विन्डोज
# वा
find . -type f | head -20   # म्याकओएस/लिनक्स
```

तपाईंले देख्नु पर्नेछ:
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

### बुझ्न पर्ने मुख्य फाइलहरू

**azure.yaml** - तपाईंको azd प्रोजेक्टको मुटु:
```bash
# परियोजना कन्फिगरेसन हेर्नुहोस्
cat azure.yaml
```

**infra/main.bicep** - इन्फ्रास्ट्रक्चर परिभाषा:
```bash
# पूर्वाधार कोड हेर्नुहोस्
head -30 infra/main.bicep
```

## चरण ३: तपाईंको प्रोजेक्ट अनुकूलन गर्नुहोस् (ऐच्छिक)

डिप्लोय गर्नु अघि, एप्लिकेशन अनुकूलन गर्न सक्नुहुन्छ:

### फ्रन्टएन्ड परिमार्जन गर्नुहोस्
```bash
# React एप कम्पोनेंट खोल्नुहोस्
code src/web/src/App.tsx
```

साधारण परिवर्तन गर्नुहोस्:
```typescript
// शीर्षक फेला पार्नुहोस् र परिवर्तन गर्नुहोस्
<h1>My Awesome Todo App</h1>
```

### वातावरण चरहरू कन्फिगर गर्नुहोस्
```bash
# अनुकूलित वातावरण चर सेट गर्नुहोस्
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# सबै वातावरण चरहरू हेर्नुहोस्
azd env get-values
```

## चरण ४: Azure मा डिप्लोय गर्नुहोस्

अब रमाइलो हिस्सा - सबै कुरा Azure मा डिप्लोय गर्नुहोस्!

```bash
# पूर्वाधार र अनुप्रयोग तैनाथ गर्नुहोस्
azd up

# यस आदेशले यो गर्दछ:
# १. एजर स्रोतहरू (एप सेवा, कोसमोस DB, आदि) प्रावधान गर्नुहोस्
# २. तपाईंको अनुप्रयोग निर्माण गर्नुहोस्
# ३. प्रावधान गरिएको स्रोतहरूमा तैनाथ गर्नुहोस्
# ४. अनुप्रयोग URL देखाउनुहोस्
```

### डिप्लोयको क्रममा के हुन्छ?

`azd up` कमाण्डले ती चरणहरू पूरा गर्दछ:
1. **प्रोभिजन** (`azd provision`) - Azure स्रोतहरू सिर्जना गर्दछ
2. **प्याकेज** - तपाईंको एप्लिकेशन कोड बनाउँछ
3. **डिप्लोय** (`azd deploy`) - स्रोतहरूमा कोड डिप्लोय गर्दछ

### अपेक्षित परिणाम
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## चरण ५: तपाईंको एप्लिकेशन परीक्षण गर्नुहोस्

### तपाईंको एप्लिकेशन पहुँच गर्नुहोस्
डिप्लोयमेन्ट आउटपुटमा प्रदान गरिएको URL मा क्लिक गर्नुहोस्, वा जुनसुकै समयमा प्राप्त गर्नुहोस्:
```bash
# एप्लिकेसन अन्तबिन्दुहरू प्राप्त गर्नुहोस्
azd show

# तपाईको ब्राउजरमा एप्लिकेसन खोल्नुहोस्
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo एप परीक्षण गर्नुहोस्
1. **Todo आइटम थप्नुहोस्** - "Add Todo" मा क्लिक गरेर कार्य प्रविष्ट गर्नुहोस्
2. **पूरा भएको चिन्ह लगाउनुहोस्** - सम्पन्न आइटमहरू जाँच गर्नुहोस्
3. **आइटमहरू मेटाउनुहोस्** - अब आवश्यक नभएका todo मेट्नुहोस्

### तपाईंको एप्लिकेशन अनुगमन गर्नुहोस्
```bash
# तपाइँको स्रोतहरूको लागि Azure पोर्टल खोल्नुहोस्
azd monitor

# अनुप्रयोग लगहरू हेर्नुहोस्
azd monitor --logs

# प्रत्यक्ष मेट्रिक्स हेर्नुहोस्
azd monitor --live
```

## चरण ६: परिवर्तनहरू गर्नुहोस् र पुन:डिप्लोय गर्नुहोस्

परिवर्तन गरौं र हेर्नुहोस् कत्तिको सजिलो छ अपडेट गर्न:

### API परिमार्जन गर्नुहोस्
```bash
# API कोड सम्पादन गर्नुहोस्
code src/api/src/routes/lists.js
```

एक अनुकूलित उत्तर हेडर थप्नुहोस्:
```javascript
// एउटा रुट ह्यान्डलर फेला पार्नुहोस् र थप्नुहोस्:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### केवल कोड परिवर्तनहरू डिप्लोय गर्नुहोस्
```bash
# केवल अनुप्रयोग कोड मात्र परिनियोजन गर्नुहोस् (पूर्वाधार छोड्नुहोस्)
azd deploy

# यो 'azd up' भन्दा धेरै छिटो छ किनकि पूर्वाधार पहिले नै अवस्थित छ
```

## चरण ७: बहुविध वातावरण व्यवस्थापन गर्नुहोस्

उत्पादन अघि परिवर्तनहरू परीक्षण गर्न स्टेजिङ वातावरण सिर्जना गर्नुहोस्:

```bash
# नयाँ स्टेजिङ वातावरण सिर्जना गर्नुहोस्
azd env new staging

# स्टेजिङमा डिप्लोय गर्नुहोस्
azd up

# फेरी डेव वातावरणमा जानुहोस्
azd env select dev

# सबै वातावरणहरूको सूची बनाउनुहोस्
azd env list
```

### वातावरण तुलना
```bash
# विकास वातावरण हेर्नुहोस्
azd env select dev
azd show

# स्टेजिङ वातावरण हेर्नुहोस्
azd env select staging
azd show
```

## चरण ८: स्रोतहरू सरसफाई गर्नुहोस्

जाँच-पटक सम्पन्न भएपछि, निरन्तर शुल्कबाट बच्न सफा गर्नुहोस्:

```bash
# हालको वातावरणको लागि सबै Azure स्रोतहरू मेटाउनुहोस्
azd down

# पुष्टि बिना बलपूर्वक मेटाउन र सफ्ट-डिलिट भएका स्रोतहरू सफा गर्न
azd down --force --purge

# विशेष वातावरण मेटाउनुहोस्
azd env select staging
azd down --force --purge
```

## क्लासिक एप र AI-समर्थित एप: एउटै कार्यप्रवाह

तपाईंले एउटा पारम्परिक वेब एप्लिकेशन डिप्लोय गर्नुभयो। तर तपाईंले Microsoft Foundry Models द्वारा समर्थित चैट एप्लिकेशन जस्तो AI-समर्थित एप डिप्लोय गर्न चाहानु भयो भने के हुन्छ?

राम्रो खबर: **कार्यप्रवाह उस्तै हुन्छ।**

| चरण | क्लासिक Todo एप | AI चैट एप |
|------|-----------------|-------------|
| इनिसियलाइज गर्नुहोस् | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| प्रमाणीकरण गर्नुहोस् | `azd auth login` | `azd auth login` |
| डिप्लोय गर्नुहोस् | `azd up` | `azd up` |
| अनुगमन गर्नुहोस् | `azd monitor` | `azd monitor` |
| सरसफाई गर्नुहोस् | `azd down --force --purge` | `azd down --force --purge` |

केवल फरक हो सुरु गर्ने **टेम्प्लेट** हो। AI टेम्प्लेटमा थप इन्फ्रास्ट्रक्चर हुन्छ (जस्तै Microsoft Foundry Models स्रोत वा AI सर्च इन्डेक्स), तर azd सबै कुरा तपाईंको लागि सम्हाल्छ। तपाईंले नयाँ कमाण्डहरू सिक्न, फरक उपकरण अपनाउनु, वा डिप्लोय सोच्न तरीका परिवर्तन गर्नु पर्दैन।

यो हो azd को मूल सिद्घान्त: **एउटै कार्यप्रवाह, कुनैपनि कार्यभार।** तपाईँले यो ट्युटोरियलमा अभ्यास गरेको सीपहरू—इनिसियलाइज, डिप्लोय, अनुगमन, पुन:डिप्लोय, र सरसफाई—AI एप्लिकेशन र एजेन्टहरूमा समान रूपमा लागू हुन्छ।

---

## तपाईंले के सिक्नुभयो

बधाई छ! तपाईं सफलतापूर्वक:
- ✅ टेम्प्लेटबाट azd प्रोजेक्ट इनिसियलाइज गर्नुभयो
- ✅ प्रोजेक्ट संरचना र मुख्य फाइलहरू अन्वेषण गर्नुभयो
- ✅ Azure मा पूर्ण-स्ट्याक एप्लिकेशन डिप्लोय गर्नुभयो
- ✅ कोड परिवर्तनहरू गरेर पुन:डिप्लोय गर्नुभयो
- ✅ बहुविध वातावरणहरू व्यवस्थापन गर्नुभयो
- ✅ स्रोतहरू सफा गर्नुभयो

## 🎯 सीप प्रमाणीकरण अभ्यासहरू

### अभ्यास १: फरक टेम्प्लेट डिप्लोय गर्नुहोस् (१५ मिनेट)
**लक्ष्य**: azd init र डिप्लोयमेन्ट वर्कफ्लोमा दक्षता देखाउनुहोस्

```bash
# Python + MongoDB स्ट्याक प्रयास गर्नुहोस्
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# पदस्थापन पुष्टि गर्नुहोस्
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# सफा पार्नुहोस्
azd down --force --purge
```

**सफलताको मापदण्ड:**
- [ ] एप्लिकेशन त्रुटिबिना डिप्लोय भयो
- [ ] ब्राउजरमा एप्लिकेशन URL पहुँचयोग्य छ
- [ ] एप्लिकेशनले सही काम गर्छ (todo थप्ने/हटाउने)
- [ ] सबै स्रोतहरू सफा गरियो

### अभ्यास २: कन्फिगरेसन अनुकूलन गर्नुहोस् (२० मिनेट)
**लक्ष्य**: वातावरण चर कन्फिगरेसन अभ्यास गर्नुहोस्

```bash
cd my-first-azd-app

# अनुकूलित वातावरण सिर्जना गर्नुहोस्
azd env new custom-config

# अनुकूलित भेरिएबलहरू सेट गर्नुहोस्
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# भेरिएबलहरू प्रमाणित गर्नुहोस्
azd env get-values | grep APP_TITLE

# अनुकूलित कन्फिगसँग परिनियोजन गर्नुहोस्
azd up
```

**सफलताको मापदण्ड:**
- [ ] अनुकूलित वातावरण सफलतापूर्वक सिर्जना भयो
- [ ] वातावरण चरहरू सेट र प्राप्त गर्न सकिन्छ
- [ ] कन्फिगर गरिएको वातावरणसँग एप्लिकेशन डिप्लोय गरियो
- [ ] डिप्लोय गरिएको एपमा अनुकूलित सेटिङहरू प्रमाणित गर्न सकिन्छ

### अभ्यास ३: बहु-वातावरण वर्कफ्लो (२५ मिनेट)
**लक्ष्य**: वातावरण व्यवस्थापन र डिप्लोयमेन्ट रणनीतिमा दक्षता हासिल गर्नुहोस्

```bash
# विकास वातावरण सिर्जना गर्नुहोस्
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# विकास URL नोट गर्नुहोस्
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# स्टेजिङ वातावरण सिर्जना गर्नुहोस्
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# स्टेजिङ URL नोट गर्नुहोस्
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# वातावरणहरू तुलना गर्नुहोस्
azd env list

# दुबै वातावरणहरू परीक्षण गर्नुहोस्
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# दुबै सफा गर्नुहोस्
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**सफलताको मापदण्ड:**
- [ ] फरक कन्फिगरेसनसहित दुई वातावरणहरू सिर्जना गरियो
- [ ] दुवै वातावरण सफलतापूर्वक डिप्लोय गरियो
- [ ] `azd env select` प्रयोग गरेर वातावरणहरु बीच परिवर्तन गर्न सकिन्छ
- [ ] वातावरण चरहरू वातावरणहरूमा फरक हुन्छन्
- [ ] दुवै वातावरण सफा गरियो

## 📊 तपाईंको प्रगति

**खर्चिएको समय**: ~६०-९० मिनट  
**अर्जित सीपहरू**:
- ✅ टेम्प्लेट आधारित प्रोजेक्ट इनिसियलाइजेसन
- ✅ Azure स्रोत प्रोभिजनिङ
- ✅ एप्लिकेशन डिप्लोयमेन्ट वर्कफ्लो
- ✅ वातावरण व्यवस्थापन
- ✅ कन्फिगरेसन व्यवस्थापन
- ✅ स्रोत सफाइ र लागत व्यवस्थापन

**अगाडि बढ्ने स्तर**: तपाईं तयार हुनुहुन्छ [कन्फिगरेसन गाइड](configuration.md) मा उन्नत कन्फिगरेसन ढाँचाहरू सिक्न!

## सामान्य समस्याहरू समाधान

### प्रमाणीकरण त्रुटिहरू
```bash
# Azure सँग पुनः प्रमाणीकरण गर्नुहोस्
az login

# सदस्यता पहुँच पुष्टि गर्नुहोस्
az account show
```

### डिप्लोयमेन्ट असफलता
```bash
# डिबग लगिङ सक्षम गर्नुहोस्
export AZD_DEBUG=true
azd up --debug

# Azure मा एप्लिकेशन लगहरू हेर्नुहोस्
azd monitor --logs

# कन्टेनर एपहरूका लागि, Azure CLI प्रयोग गर्नुहोस्:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### स्रोत नाम द्वन्द्वहरू
```bash
# विशेष वातावरण नाम प्रयोग गर्नुहोस्
azd env new dev-$(whoami)-$(date +%s)
```

### पोर्ट/नेटवर्क समस्या
```bash
# पोर्टहरू उपलब्ध छन् कि छैनन् जाँच गर्नुहोस्
netstat -an | grep :3000
netstat -an | grep :3100
```

## अर्को कदमहरू

अब तपाईंले पहिलो प्रोजेक्ट पूरा गर्नुभयो, यी उन्नत विषयहरू अन्वेषण गर्नुहोस्:

### १. इन्फ्रास्ट्रक्चर अनुकूलन गर्नुहोस्
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [डेटाबेस, संग्रह र अन्य सेवाहरू थप्नुहोस्](../chapter-04-infrastructure/provisioning.md#adding-services)

### २. CI/CD सेटअप गर्नुहोस्
- [डिप्लोयमेन्ट गाइड](../chapter-04-infrastructure/deployment-guide.md) - पूर्ण CI/CD वर्कफ्लोहरू
- [Azure Developer CLI डकुमेण्टेसन](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - पाइपलाइन कन्फिगरेसन

### ३. उत्पादन उत्तम अभ्यासहरू
- [डिप्लोयमेन्ट गाइड](../chapter-04-infrastructure/deployment-guide.md) - सुरक्षा, प्रदर्शन, र अनुगमन

### ४. थप टेम्प्लेटहरू अन्वेषण गर्नुहोस्
```bash
# वर्ग अनुसार टेम्प्लेटहरू ब्राउज गर्नुहोस्
azd template list --filter web
azd template list --filter api
azd template list --filter database

# विभिन्न प्रविधि स्ट्याकहरू प्रयास गर्नुहोस्
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## अतिरिक्त स्रोतहरू

### सिकाइ सामग्रीहरू
- [Azure Developer CLI डकुमेण्टेसन](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर सेन्टर](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure राम्रो डिजाइन फ्रेमवर्क](https://learn.microsoft.com/en-us/azure/well-architected/)

### समुदाय र समर्थन
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer सामुदाय](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### टेम्प्लेट र उदाहरणहरू
- [सरकारी टेम्प्लेट ग्यालरी](https://azure.github.io/awesome-azd/)
- [समुदाय टेम्प्लेटहरू](https://github.com/Azure-Samples/azd-templates)
- [उद्यम ढाँचाहरू](https://github.com/Azure/azure-dev/tree/main/templates)

---

**तपाईंको पहिलो azd प्रोजेक्ट पूरा गरेकोमा बधाई!** अब तपाईं Azure मा विश्वासका साथ उत्कृष्ट एप्लिकेशनहरू निर्माण र डिप्लोय गर्न तयार हुनुहुन्छ।

---

**अध्याय नेभिगेसन:**
- **📚 कोर्स गृहपृष्ठ**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय १ - आधार र छिटो सुरु
- **⬅️ अघिल्लो**: [इन्स्टलेशन र सेटअप](installation.md)
- **➡️ अर्को**: [कन्फिगरेसन](configuration.md)
- **🚀 अर्को अध्याय**: [अध्याय २: AI-प्रथमतः विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **अर्को पाठ**: [डिप्लोयमेन्ट गाइड](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यो कागजात AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी सटीकता प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धता हुनसक्छ। मूल कागजात यसको मूल भाषामा अधिकारिक स्रोत मान्नुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवाद प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी जिम्मेवार हौँन।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->