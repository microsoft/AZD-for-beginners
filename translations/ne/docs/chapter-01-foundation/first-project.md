# तपाईंको पहिलो परियोजना - अभ्यासात्मक ट्यूटोरियल

**Chapter Navigation:**
- **📚 पाठ्यक्रम गृह**: [AZD शुरुआतीहरूको लागि](../../README.md)
- **📖 Current Chapter**: अध्याय 1 - आधार र छिटो सुरु
- **⬅️ Previous**: [इन्स्टलेसन र सेटअप](installation.md)
- **➡️ Next**: [कन्फिगरेसन](configuration.md)
- **🚀 Next Chapter**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

तपाईंको पहिलो Azure Developer CLI परियोजनामा स्वागत छ! यो व्यापक अभ्यासात्मक ट्यूटोरियलले azd प्रयोग गरेर Azure मा पूर्ण-स्ट्याक अनुप्रयोग सिर्जना, डिप्लोय र व्यवस्थापन गर्ने पूर्ण मार्गदर्शन प्रदान गर्दछ। तपाईंले एक वास्तविक todo अनुप्रयोगसँग काम गर्नुहुनेछ जसले React फ्रन्टएन्ड, Node.js API ब्याकएन्ड, र MongoDB डाटाबेस समावेश गर्छ।

## सिकाइ लक्ष्यहरू

यस ट्यूटोरियल पूरा गरेपछि, तपाईं:
- टेम्प्लेटहरू प्रयोग गरेर azd परियोजना प्रारम्भ गर्ने कार्यप्रवाहमा निपुण हुनुहुनेछ
- Azure Developer CLI परियोजना संरचना र कन्फिगरेसन फाइलहरू बुझ्नुहुनेछ
- पूर्वाधार प्रावधानसहित Azure मा सम्पूर्ण अनुप्रयोग डिप्लोय गर्न सक्नुहुनेछ
- अनुप्रयोग अपडेट र पुन:डिप्लोय रणनीतिहरू कार्यान्वयन गर्न सक्नुहुनेछ
- विकास र स्टेजिङका लागि बहु वातावरणहरू व्यवस्थापन गर्न सक्नुहुनेछ
- स्रोतहरू सफा गर्ने र लागत व्यवस्थापन अभ्यासहरू लागू गर्न सक्नुहुनेछ

## सिकाइ नतिजाहरू

पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- टेम्प्लेटहरूबाट स्वतन्त्र रूपमा azd परियोजनाहरू प्रारम्भ र कन्फिगर गर्न
- azd परियोजना संरचनाहरू प्रभावकारी रूपमा नेभिगेट र परिमार्जन गर्न
- एकै कमाण्डबाट Azure मा पूर्ण-स्ट्याक अनुप्रयोगहरू डिप्लोय गर्न
- सामान्य डिप्लोय समस्या र प्रमाणीकरण समस्याहरू ट्रबलशुट गर्न
- विभिन्न डिप्लोय चरणहरूका लागि बहु Azure वातावरणहरू व्यवस्थापन गर्न
- अनुप्रयोग अपडेटका लागि निरन्तर डिप्लोयमेन्ट कार्यप्रवाहहरू कार्यान्वयन गर्न

## सुरु गर्ने

### पूर्व आवश्यकताहरू चेकलिस्ट
- ✅ Azure Developer CLI इन्स्टल गरिएको ([इन्स्टलेसन मार्गदर्शक](installation.md))
- ✅ AZD प्रमाणीकरण पूर्ण गरिएको `azd auth login`
- ✅ Git तपाइँको सिस्टममा इन्स्टल गरिएको
- ✅ Node.js 16+ (यस ट्यूटोरियलका लागि)
- ✅ Visual Studio Code (सिफारिस गरिएको)

अगाडि बढ्नु अघि, रिपोजिटरी रुटबाट सेटअप भ्यालिडेटर चलाउनुहोस्:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### आफ्नो सेटअप जाँच गर्नुहोस्
```bash
# azd स्थापना जाँच गर्नुहोस्
azd version

# AZD प्रमाणीकरण जाँच गर्नुहोस्
azd auth login --check-status
```

### वैकल्पिक Azure CLI प्रमाणीकरण जाँच्नुहोस्

```bash
az account show
```

### Node.js संस्करण जाँच्नुहोस्
```bash
node --version
```

## चरण 1: टेम्पलेट चयन र प्रारम्भ गर्नुहोस्

हामी React फ्रन्टएन्ड र Node.js API ब्याकएन्ड समावेश गर्ने लोकप्रिय todo अनुप्रयोग टेम्पलेटबाट सुरु गरौं।

```bash
# उपलब्ध टेम्पलेटहरू ब्राउज़ गर्नुहोस्
azd template list

# todo एप टेम्पलेट आरम्भ गर्नुहोस्
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# प्रम्प्टहरू पालना गर्नुहोस्:
# - वातावरणको नाम प्रविष्ट गर्नुहोस्: "dev"
# - एक सदस्यता छान्नुहोस् (यदि तपाइँसँग धेरै छन् भने)
# - क्षेत्र छान्नुहोस्: "East US 2" (वा आफ्नो रोजेको क्षेत्र)
```

### के भयो?
- टेम्पलेट कोड तपाइँको स्थानीय डिरेक्टरीमा डाउनलोड गरियो
- `azure.yaml` फाइल सिर्जना गरियो
- `infra/` डाइरेक्टरीमा पूर्वाधार कोड सेटअप गरियो
- एउटा वातावरण कन्फिगरेसन सिर्जना गरियो

## चरण 2: परियोजना संरचना अन्वेषण गर्नुहोस्

azd ले हामीका लागि के बनायो भन्ने जाँच गरौं:

```bash
# परियोजना संरचना हेर्नुहोस्
tree /f   # विन्डोज
# वा
find . -type f | head -20   # म्याकओएस/लिनक्स
```

तपाईंले हेर्नुहुनेछ:
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

### बुझ्नुपर्ने मुख्य फाइलहरू

**azure.yaml** - तपाईंको azd परियोजनाको मुटु:
```bash
# परियोजनाको कन्फिगरेसन हेर्नुहोस्
cat azure.yaml
```

**infra/main.bicep** - पूर्वाधार परिभाषा:
```bash
# पूर्वाधारको कोड हेर्नुहोस्
head -30 infra/main.bicep
```

## चरण 3: तपाईंको परियोजना अनुकूलित गर्नुहोस् (वैकल्पिक)

डिप्लोय गर्नु अघि, तपाईं अनुप्रयोग अनुकूलन गर्न सक्नुहुन्छ:

### फ्रन्टेन्ड परिमार्जन गर्नुहोस्
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
# कस्टम वातावरण चरहरू सेट गर्नुहोस्
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# सबै वातावरण चरहरू हेर्नुहोस्
azd env get-values
```

## चरण 4: Azure मा डिप्लोय गर्नुहोस्

अब उत्साहजनक हिस्सा - सबै कुरा Azure मा डिप्लोय गर्नुहोस्!

```bash
# पूर्वाधार र अनुप्रयोग तैनाथ गर्नुहोस्
azd up

# यो आदेशले:
# 1. Azure स्रोतहरू प्रावधान गर्नुहोस् (App Service, Cosmos DB, आदि)
# 2. तपाईंको अनुप्रयोग निर्माण गर्नुहोस्
# 3. प्रावधान गरिएका स्रोतहरूमा तैनाथ गर्नुहोस्
# 4. अनुप्रयोगको URL देखाउनुहोस्
```

### डिप्लोय गर्दा के हुँदैछ?

`azd up` कमाण्डले यी चरणहरू प्रदर्शन गर्छ:
1. **Provision** (`azd provision`) - Azure स्रोतहरू सिर्जना गर्छ
2. **Package** - तपाईंको अनुप्रयोग कोड बनाउँछ
3. **Deploy** (`azd deploy`) - कोडलाई Azure स्रोतहरूमा डिप्लोय गर्छ

### अपेक्षित आउटपुट
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## चरण 5: तपाईंको एप्लिकेशन परीक्षण गर्नुहोस्

### आफ्नो एप्लिकेशन पहुँच गर्नुहोस्
डिप्लोय आउटपुटमा दिइएको URL मा क्लिक गर्नुहोस्, वा यो जुनसुकै समयमा प्राप्त गर्नुहोस्:
```bash
# अनुप्रयोगका अन्तबिन्दुहरू प्राप्त गर्नुहोस्
azd show

# तपाईंको ब्राउजरमा अनुप्रयोग खोल्नुहोस्
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo एप्लिकेशन परीक्षण गर्नुहोस्
1. **Todo वस्तु थप्नुहोस्** - "Add Todo" क्लिक गरी कार्य प्रविष्ट गर्नुहोस्
2. **पूरा भएको रूपमा मार्क गर्नुहोस्** - सम्पन्न आइटमहरूमा चिन्ह लगाउनुहोस्
3. **आइटमहरू मेटाउनुहोस्** - अब आवश्यक नहुने todo हरू हटाउनुहोस्

### आफ्नो एप्लिकेशन अनुगमन गर्नुहोस्
```bash
# आफ्ना स्रोतहरूका लागि Azure पोर्टल खोल्नुहोस्
azd monitor

# अनुप्रयोगको लगहरू हेर्नुहोस्
azd monitor --logs

# प्रत्यक्ष मेट्रिक्स हेर्नुहोस्
azd monitor --live
```

### ✅ तपाइँको डिप्लोयमेन्ट पुष्टि गर्नुहोस्

अगाडि बढ्नु अघि, सबै कुरा साँच्चिकै काम गरिरहेको छ भनी सुनिश्चित गर्न यो छोटो चेकलिस्ट चलाउनुहोस्—"डिप्लोय सफल भयो" भनेको "एप काम गर्छ" भन्ने नलिनुहोस्:

```bash
# 1. एन्डपोइन्ट अस्तित्वमा छ र पहुँचयोग्य छ भन्ने पुष्टि गर्नुहोस्
azd show

# 2. एन्डपोइन्टमा स्मोक-टेस्ट गर्नुहोस् (HTTP 200 अपेक्षित)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. यदि तपाईंको एपले स्वास्थ्य एन्डपोइन्ट उपलब्ध गराउँछ भने त्यसलाई जाँच गर्नुहोस्
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**डिप्लोय पुष्टि हुन्छ जब:**
- ✅ `azd show` ले पहुँचयोग्य एन्डपोइन्ट URL सूचीबद्ध गर्छ
- ✅ URL तपाईंको ब्राउजरमा त्रुटि बिना खुल्छ
- ✅ मुख्य सुविधाहरू काम गर्छन् (todo थप्न/सम्पन्न/हटाउन)
- ✅ `azd monitor --logs` ले अनपेक्षित त्रुटि बिना अनुरोधहरू आइरहेको देखाउँछ

यदि कुनै पनि जाँच असफल भएमा, जानुहोस् [अध्याय 7: समस्या समाधान](../chapter-07-troubleshooting/README.md) मा।

## चरण 6: परिवर्तनहरू गर्नुहोस् र पुन:डिप्लोय गर्नुहोस्

एक परिवर्तन गरौं र अपडेट कति सजिलो छ जाँचौं:

### API परिमार्जन गर्नुहोस्
```bash
# API कोड सम्पादन गर्नुहोस्
code src/api/src/routes/lists.js
```

कस्टम रिस्पोन्स हेडर थप्नुहोस्:
```javascript
// रूट ह्यान्डलर खोज्नुहोस् र थप्नुहोस्:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### केवल कोड परिवर्तनहरू डिप्लोय गर्नुहोस्
```bash
# केवल एप्लिकेशन कोड तैनाथ गर्नुहोस् (पूर्वाधार छोड्नुहोस्)
azd deploy

# पूर्वाधार पहिले नै रहेको हुँदा यो 'azd up' भन्दा धेरै छिटो हुन्छ
```

## चरण 7: बहु वातावरणहरू व्यवस्थापन गर्नुहोस्

उत्पादन अगाडि परिवर्तनहरू परीक्षण गर्न स्टेजिङ वातावरण सिर्जना गर्नुहोस्:

```bash
# नयाँ स्टेजिङ वातावरण सिर्जना गर्नुहोस्
azd env new staging

# स्टेजिङमा तैनाथ गर्नुहोस्
azd up

# डेभ वातावरणमा फर्कनुहोस्
azd env select dev

# सबै वातावरणहरू सूचीबद्ध गर्नुहोस्
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

## चरण 8: स्रोतहरू सफा गर्नुहोस्

अनुभव गर्दा सकेपछि, चलिरहेको चार्जबाट बच्न स्रोतहरू सफा गर्नुहोस्:

```bash
# वर्तमान वातावरणका लागि सबै Azure स्रोतहरू मेटाउनुहोस्
azd down

# पुष्टिकरण बिना बलपूर्वक मेटाउनुहोस् र सफ्ट-डिलिट गरिएका स्रोतहरूलाई स्थायी रूपमा हटाउनुहोस्
azd down --force --purge

# विशिष्ट वातावरण मेटाउनुहोस्
azd env select staging
azd down --force --purge
```

## क्लासिक एप बनाम AI-संचालित एप: एउटै कार्यप्रवाह

तपाईंले भर्खरै परम्परागत वेब अनुप्रयोग डिप्लोय गर्नुभयो। तर यदि तपाईंले AI-संचालित एप—जस्तो कि Microsoft Foundry Models द्वारा समर्थित च्याट एप—डिप्लोय गर्न चाहनुहुन्छ भने के हुन्छ?

राम्रो खबर: **कार्यप्रवाह एउटै हो।**

| Step | क्लासिक Todo एप | AI च्याट एप |
|------|-----------------|-------------|
| प्रारम्भ गर्नुहोस् | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| प्रमाणीकरण | `azd auth login` | `azd auth login` |
| डिप्लोय | `azd up` | `azd up` |
| अनुगमन | `azd monitor` | `azd monitor` |
| सफा गर्नुहोस् | `azd down --force --purge` | `azd down --force --purge` |

एकमात्र फरक तपाईँले सुरु गर्ने **टेम्पलेट** हो। AI टेम्पलेटमा अतिरिक्त पूर्वाधार समावेश हुन सक्छ (जस्तै Microsoft Foundry Models स्रोत वा AI Search इन्डेक्स), तर azd ले यी सबै तपाईंका लागि व्यवस्थापन गर्छ। तपाईंले नयाँ कमाण्ड सिक्न, फरक उपकरण अपनाउन, वा डिप्लोयबारे आफ्नो सोच परिवर्तन गर्न आवश्यक पर्दैन।

यो azd को मूल सिद्घान्त हो: **एकै कार्यप्रवाह, कुनै पनि कार्यभार।** यस ट्यूटोरियलमा तपाईंले अभ्यास गरेका सीपहरू — प्रारम्भ गर्ने, डिप्लोय गर्ने, अनुगमन गर्ने, पुन:डिप्लोय गर्ने, र सफा गर्ने — AI अनुप्रयोगहरू र एजेण्टहरूमा पनि समान रूपले लागू हुन्छन्।

---

## तपाईंले के सिक्नुभयो

बधाई! तपाईंले सफलतापूर्वक:
- ✅ टेम्पलेटबाट azd परियोजना प्रारम्भ गर्नुभयो
- ✅ परियोजना संरचना र मुख्य फाइलहरू अन्वेषण गर्नुभयो
- ✅ Azure मा पूर्ण-स्ट्याक अनुप्रयोग डिप्लोय गर्नुभयो
- ✅ कोड परिवर्तनहरू गरी पुन:डिप्लोय गर्नुभयो
- ✅ बहु वातावरणहरू व्यवस्थापन गर्नुभयो
- ✅ स्रोतहरू सफा गर्नुभयो

## 🎯 सीप प्रमाणीकरण अभ्यासहरू

### अभ्यास 1: फरक टेम्पलेट डिप्लोय गर्नुहोस् (15 मिनेट)
**लक्ष्य**: azd init र डिप्लोयमेन्ट कार्यप्रवाहमा निपुणता प्रदर्शन गर्नुहोस्

```bash
# Python + MongoDB स्ट्याक प्रयास गर्नुहोस्
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# परिनियोजन सत्यापित गर्नुहोस्
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# सफा गर्नुहोस्
azd down --force --purge
```

**सफलता मापदण्ड:**
- [ ] अनुप्रयोग बिना त्रुटि डिप्लोय हुन्छ
- [ ] ब्राउजरमा अनुप्रयोग URL पहुँच गर्न सकिन्छ
- [ ] अनुप्रयोग ठीकसँग काम गर्छ (थप/हटाउने todo हरू)
- [ ] सबै स्रोतहरू सफलतापूर्वक सफा गरियो

### अभ्यास 2: कन्फिगरेसन अनुकूलन गर्नुहोस् (20 मिनेट)
**लक्ष्य**: वातावरण चर कन्फिगरेसन अभ्यास गर्नुहोस्

```bash
cd my-first-azd-app

# अनुकूलित वातावरण सिर्जना गर्नुहोस्
azd env new custom-config

# अनुकूलित भेरिएबलहरू सेट गर्नुहोस्
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# भेरिएबलहरू जाँच गर्नुहोस्
azd env get-values | grep APP_TITLE

# अनुकूलित कन्फिगसँग तैनाथ गर्नुहोस्
azd up
```

**सफलता मापदण्ड:**
- [ ] कस्टम वातावरण सफलतापूर्वक सिर्जना भयो
- [ ] वातावरण चरहरू सेट गरिए र प्राप्त गर्न सकिन्छ
- [ ] अनुप्रयोग कस्टम कन्फिगरेसनसहित डिप्लोय हुन्छ
- [ ] डिप्लोय गरिएको एपमा कस्टम सेटिङहरू सत्यापित गर्न सकिन्छ

### अभ्यास 3: बहु-वातावरण कार्यप्रवाह (25 मिनेट)
**लक्ष्य**: वातावरण व्यवस्थापन र डिप्लोय रणनीतिहरूमा निपुण हुनुहोस्

```bash
# डेभ वातावरण सिर्जना गर्नुहोस्
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# डेभ URL नोट गर्नुहोस्
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

**सफलता मापदण्ड:**
- [ ] फरक कन्फिगरेसन सहित दुई वातावरण सिर्जना गरिएको छ
- [ ] दुबै वातावरण सफलतापूर्वक डिप्लोय भएका छन्
- [ ] `azd env select` प्रयोग गरी वातावरणहरू बीच स्विच गर्न सकिन्छ
- [ ] वातावरणहरू बीच वातावरण चरहरू फरक छन्
- [ ] दुबै वातावरण सफलतापूर्वक सफा गरियो

## 📊 तपाईंको प्रगति

**खर्च गरिएको समय**: ~60-90 मिनेट  
**आर्जित सीपहरू**:
- ✅ टेम्पलेट-आधारित परियोजना प्रारम्भ
- ✅ Azure स्रोत प्रावधान
- ✅ अनुप्रयोग डिप्लोयमेन्ट कार्यप्रवाहहरू
- ✅ वातावरण व्यवस्थापन
- ✅ कन्फिगरेसन व्यवस्थापन
- ✅ स्रोत सफा र लागत व्यवस्थापन

**अर्को स्तर**: तपाईं अब उन्नत कन्फिगरेसन ढाँचाहरू सिक्न [कन्फिगरेसन मार्गदर्शक](configuration.md) का लागि तयार हुनुहुन्छ!

## सामान्य समस्याहरू समाधान

### प्रमाणीकरण त्रुटि
```bash
# Azure सँग पुनः प्रमाणीकरण गर्नुहोस्
az login

# सदस्यता पहुँच जाँच गर्नुहोस्
az account show
```

### डिप्लोय विफलताहरू
```bash
# डिबग लॉगिङ सक्षम गर्नुहोस्
export AZD_DEBUG=true
azd up --debug

# Azure मा अनुप्रयोग लॉगहरू हेर्नुहोस्
azd monitor --logs

# Container Apps का लागि, Azure CLI प्रयोग गर्नुहोस्:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### स्रोत नाम द्वन्द्वहरू
```bash
# अद्वितीय वातावरण नाम प्रयोग गर्नुहोस्
azd env new dev-$(whoami)-$(date +%s)
```

### पोर्ट/नेटवर्क समस्या
```bash
# पोर्टहरू उपलब्ध छन् कि छैनन् जाँच गर्नुहोस्
netstat -an | grep :3000
netstat -an | grep :3100
```

## अर्को कदमहरू

अब जब तपाईंले आफ्नो पहिलो परियोजना पूरा गर्नुभयो, यी उन्नत विषयहरू अन्वेषण गर्नुहोस्:

### 1. पूर्वाधार अनुकूलन गर्नुहोस्
- [पूर्वाधारलाई कोडको रूपमा](../chapter-04-infrastructure/provisioning.md)
- [डाटाबेस, स्टोरेज, र अन्य सेवाहरू थप्नुहोस्](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD सेट अप गर्नुहोस्
- [डिप्लोयमेन्ट मार्गदर्शक](../chapter-04-infrastructure/deployment-guide.md) - पूर्ण CI/CD कार्यप्रवाहहरू
- [Azure Developer CLI डक्युमेन्टेशन](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - पाइपलाइन कन्फिगरेसन

### 3. उत्पादन उत्तम अभ्यासहरू
- [डिप्लोयमेन्ट मार्गदर्शक](../chapter-04-infrastructure/deployment-guide.md) - सुरक्षा, प्रदर्शन, र अनुगमन

### 4. थप टेम्प्लेटहरू अन्वेषण गर्नुहोस्
```bash
# श्रेणीअनुसार टेम्पलेटहरू ब्राउज़ गर्नुहोस्
azd template list --filter web
azd template list --filter api
azd template list --filter database

# विभिन्न प्रविधि स्ट्याकहरू प्रयास गर्नुहोस्
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## थप स्रोतहरू

### सिकाइ सामग्रीहरू
- [Azure Developer CLI डक्युमेन्टेशन](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### समुदाय र समर्थन
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### टेम्प्लेट र उदाहरणहरू
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**तपाईंको पहिलो azd परियोजना पूरा गरेकोमा बधाई!** अब तपाईं विश्वस्ततासाथ Azure मा शानदार अनुप्रयोगहरू निर्माण र डिप्लोय गर्न तयार हुनुहुन्छ।

---

**Chapter Navigation:**
- **📚 पाठ्यक्रम गृह**: [AZD शुरुआतीहरूको लागि](../../README.md)
- **📖 Current Chapter**: अध्याय 1 - आधार र छिटो सुरु
- **⬅️ Previous**: [इन्स्टलेसन र सेटअप](installation.md)
- **➡️ Next**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Next Chapter**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->