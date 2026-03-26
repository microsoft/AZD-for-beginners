# तपाईंको पहिलो परियोजना - व्यवहारिक ट्युटोरियल

**अध्याय नेभिगेसन:**
- **📚 Course Home**: [AZD शुरुवातीहरूका लागि](../../README.md)
- **📖 Current Chapter**: अध्याय 1 - आधार र छिटो सुरूवात
- **⬅️ Previous**: [इन्स्टलेसन र सेटअप](installation.md)
- **➡️ Next**: [कन्फिगरेसन](configuration.md)
- **🚀 Next Chapter**: [अध्याय २: एआई-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

तपाईंको पहिलो Azure Developer CLI परियोजनामा स्वागत छ! यस विस्तृत व्यवहारिक ट्युटोरियलले azd प्रयोग गरेर Azure मा पूर्ण-स्ट्याक एप्लिकेसन सिर्जना, परिनियोजन, र व्यवस्थापन गर्ने सम्पूर्ण प्रक्रिया प्रदान गर्दछ। यहाँ तपाईँले React फ्रन्टएन्ड, Node.js API ब्याकएन्ड, र MongoDB डेटाबेस सहितको वास्तविक todo एपसँग काम गर्नुहुनेछ।

## शिक्षण लक्ष्यहरू

यस ट्युटोरियल पूरा गरेपछि, तपाईंले:
- टेम्प्लेटहरू प्रयोग गरेर azd परियोजना आरम्भ गर्ने कार्यप्रवाहमा निपुणता हासिल गर्नुहोस्
- Azure Developer CLI परियोजना संरचना र कन्फिगरेसन फाइलहरू बुझ्नुहोस्
- पूर्वाधार प्रावधान सहित Azure मा सम्पूर्ण अनुप्रयोग परिनियोजन कार्यान्वयन गर्नुहोस्
- अनुप्रयोग अपडेट र पुन:परिनियोजन रणनीतिहरू लागू गर्नुहोस्
- विकास र स्टेजिङका लागि बहु वातावरणहरू व्यवस्थापन गर्नुहोस्
- स्रोत सफाइ र लागत व्यवस्थापन अभ्यासहरू लागू गर्नुहोस्

## सिकाइ नतिजाहरू

समाप्ति पछि, तपाईं सक्षम हुनुहुनेछ:
- टेम्प्लेटबाट स्वतन्त्र रूपमा azd परियोजनाहरू आरम्भ र कन्फिगर गर्न
- azd परियोजना संरचनाहरू प्रभावकारी रूपमा नेभिगेट र परिमार्जन गर्न
- एकल आदेशहरूसँग Azure मा पूर्ण-स्ट्याक अनुप्रयोग परिनियोजन गर्न
- सामान्य परिनियोजन समस्याहरू र प्रमाणीकरण समस्याहरू समाधान गर्न
- विभिन्न परिनियोजन चरणहरूका लागि बहु Azure वातावरणहरू व्यवस्थापन गर्न
- अनुप्रयोग अपडेटका लागि सतत परिनियोजन (CI/CD) कार्यप्रवाहहरू लागू गर्न

## सुरु गर्नुहोस्

### पूर्वशर्तहरू चेकलिस्ट
- ✅ Azure Developer CLI installed ([Installation Guide](installation.md))
- ✅ Azure CLI स्थापना गरिएको र प्रमाणिकृत गरिएको
- ✅ Git तपाईंको सिस्टममा स्थापना गरिएको
- ✅ Node.js 16+ (यस ट्युटोरियलको लागि)
- ✅ Visual Studio Code (सिफारिश गरिएको)

### आफ्नो सेटअप प्रमाणित गर्नुहोस्
```bash
# azd स्थापना जाँच गर्नुहोस्
azd version
```
### Azure प्रमाणीकरण जाँच गर्नुहोस्

```bash
az account show
```

### Node.js संस्करण जाँच गर्नुहोस्
```bash
node --version
```

## चरण 1: टेम्प्लेट छान्नुहोस् र प्रारम्भ गर्नुहोस्

हामी React फ्रन्टएन्ड र Node.js API ब्याकएन्ड सहितको लोकप्रिय todo एप टेम्प्लेटबाट सुरु गरौं।

```bash
# उपलब्ध टेम्पलेटहरू हेर्नुहोस्
azd template list

# टु-डु एपको टेम्पलेट प्रारम्भ गर्नुहोस्
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# प्रोम्प्टहरू अनुसरण गर्नुहोस्:
# - एउटा वातावरण नाम प्रविष्ट गर्नुहोस्: "dev"
# - एउटा सदस्यता छनौट गर्नुहोस् (यदि तपाइँसँग एकभन्दा बढी छ भने)
# - एउटा क्षेत्र छनौट गर्नुहोस्: "East US 2" (वा तपाइँको मनपर्ने क्षेत्र)
```

### के भयो?
- टेम्प्लेट कोड तपाइँको स्थानीय निर्देशिकामा डाउनलोड गरियो
- सेवा परिभाषाहरू सहित `azure.yaml` फाइल सिर्जना गरियो
- `infra/` निर्देशिकामा पूर्वाधार कोड सेटअप गरियो
- वातावरण कन्फिगरेसन सिर्जना गरियो

## चरण 2: परियोजना संरचना अन्वेषण गर्नुहोस्

azd ले हामीका लागि के-के सिर्जना गर्‍यो हेर्नुहोस्:

```bash
# परियोजनाको संरचना हेर्नुहोस्
tree /f   # विन्डोज
# वा
find . -type f | head -20   # म्याकओएस/लिनक्स
```

तपाईंले देख्नुपर्छ:
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

**azure.yaml** - तपाईंको azd परियोजनाको मुख्य हिस्सा:
```bash
# परियोजनाको कन्फिगरेसन हेर्नुहोस्
cat azure.yaml
```

**infra/main.bicep** - पूर्वाधार परिभाषा:
```bash
# पूर्वाधार कोड हेर्नुहोस्
head -30 infra/main.bicep
```

## चरण 3: आफ्नो परियोजना अनुकूलित गर्नुहोस् (वैकल्पिक)

परिनियोजन अघि, तपाइँले अनुप्रयोग अनुकूलन गर्न सक्नुहुन्छ:

### फ्रन्टएन्ड संशोधन गर्नुहोस्
```bash
# React एप कम्पोनेन्ट खोल्नुहोस्
code src/web/src/App.tsx
```

सादा परिवर्तन गर्नुहोस्:
```typescript
// शीर्षक फेला पार्नुहोस् र यसलाई परिवर्तन गर्नुहोस्
<h1>My Awesome Todo App</h1>
```

### वातावरण चरहरू कन्फिगर गर्नुहोस्
```bash
# अनुकूलित वातावरण चरहरू सेट गर्नुहोस्
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# सबै वातावरण चरहरू हेर्नुहोस्
azd env get-values
```

## चरण 4: Azure मा परिनियोजन गर्नुहोस्

अब रोमाञ्चक भाग — सबै कुरा Azure मा परिनियोजन गर्नुहोस्!

```bash
# पूर्वाधार र अनुप्रयोग तैनात गर्नुहोस्
azd up

# यो आदेशले:
# 1. Azure स्रोतहरू (App Service, Cosmos DB, आदि) प्रावधान गर्नेछ
# 2. तपाईंको अनुप्रयोग निर्माण गर्नेछ
# 3. प्रावधान गरिएका स्रोतहरूमा तैनात गर्नेछ
# 4. अनुप्रयोगको URL देखाउनेछ
```

### परिनियोजनको क्रममा के भइरहेको छ?

`azd up` आदेशले यी कदमहरू पूरा गर्दछ:
1. **Provision** (`azd provision`) - Azure स्रोतहरू सिर्जना गर्छ
2. **Package** - तपाईंको अनुप्रयोग कोड बनाउँछ
3. **Deploy** (`azd deploy`) - कोडलाई Azure स्रोतहरूमा परिनियोजन गर्छ

### अपेक्षित आउटपुट
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## चरण 5: आफ्नो अनुप्रयोग परीक्षण गर्नुहोस्

### आफ्नो अनुप्रयोग पहुँच गर्नुहोस्
परिनियोजन आउटपुटमा दिएको URL मा क्लिक गर्नुहोस्, वा यो कहिले पनि प्राप्त गर्नुहोस्:
```bash
# अनुप्रयोगका अन्तबिन्दुहरू प्राप्त गर्नुहोस्
azd show

# आफ्नो ब्राउजरमा अनुप्रयोग खोल्नुहोस्
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo एप्लिकेसन परीक्षण गर्नुहोस्
1. **एउटा todo वस्तु थप्नुहोस्** - "Add Todo" मा क्लिक गरेर एउटा काम प्रविष्ट गर्नुहोस्
2. **सम्पन्नको रूपमा चिन्ह लगाउनुहोस्** - पूरा भएका वस्तुहरूमा चेक गर्नुहोस्
3. **वस्तुहरू मेटाउनुहोस्** - जसको आवश्यकता छैन ती todo हरू हटाउनुहोस्

### आफ्नो अनुप्रयोग निगरानी गर्नुहोस्
```bash
# आफ्ना स्रोतहरूको लागि Azure पोर्टल खोल्नुहोस्
azd monitor

# अनुप्रयोग लगहरू हेर्नुहोस्
azd monitor --logs

# सजीव मेट्रिक्स हेर्नुहोस्
azd monitor --live
```

## चरण 6: परिवर्तनहरू गर्नुहोस् र पुनः परिनियोजन गर्नुहोस्

एक परिवर्तन गरौं र अपडेट कति सजिलो छ हेर्नुहोस्:

### API परिमार्जन गर्नुहोस्
```bash
# API को कोड सम्पादन गर्नुहोस्
code src/api/src/routes/lists.js
```

अनुकूलित प्रतिक्रिया हेडर थप्नुहोस्:
```javascript
// राउट ह्यान्डलर फेला पार्नुहोस् र थप्नुहोस्:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### केवल कोड परिवर्तनहरू मात्र परिनियोजन गर्नुहोस्
```bash
# केवल अनुप्रयोग कोड परिनियोजित गर्नुहोस् (पूर्वाधार छोड्नुहोस्)
azd deploy

# पूर्वाधार पहिले नै भएकाले, यो 'azd up' भन्दा धेरै छिटो छ
```

## चरण 7: बहु वातावरणहरू व्यवस्थापन गर्नुहोस्

उत्पादनअघि परिवर्तनहरू परीक्षण गर्न एउटा स्टेजिङ वातावरण सिर्जना गर्नुहोस्:

```bash
# नयाँ स्टेजिङ वातावरण सिर्जना गर्नुहोस्
azd env new staging

# स्टेजिङमा परिनियोजन गर्नुहोस्
azd up

# डेभ वातावरणमा फर्किनुहोस्
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

प्रयोग समाप्त भएपछि, चलिरहेका शुल्कहरू टाल्न स्रोतहरू सफा गर्नुहोस्:

```bash
# हालको वातावरणका सबै Azure स्रोतहरू मेटाउनुहोस्
azd down

# पुष्टिकरण बिना जबर्जस्ती मेट्नुहोस् र सफ्ट-डिलिट गरिएका स्रोतहरू पूर्ण रूपमा हटाउनुहोस्
azd down --force --purge

# विशिष्ट वातावरण मेटाउनुहोस्
azd env select staging
azd down --force --purge
```

## क्लासिक एप बनाम एआई-समर्थित एप: एउटै वर्कफ्लो

तपाईंले भर्खरै परम्परागत वेब अनुप्रयोग परिनियोजन गर्नुभयो। तर यदि तपाईंले एआई-सक्षम एप—जस्तै Microsoft Foundry Models द्वारा समर्थित च्याट एप—परिनियोजन गर्न चाहनुहुन्थ्यो भने?

राम्रो समाचार: **वर्कफ्लो उस्तै हुनेछ।**

| Step | क्लासिक Todo एप | एआई च्याट एप |
|------|-----------------|-------------|
| आरम्भ | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| प्रमाणीकरण | `azd auth login` | `azd auth login` |
| परिनियोजन | `azd up` | `azd up` |
| निगरानी | `azd monitor` | `azd monitor` |
| सफा गर्नुहोस् | `azd down --force --purge` | `azd down --force --purge` |

एक मात्र फरक तपाइँले सुरु गर्ने **टेम्प्लेट** हो। एक एआई टेम्प्लेटले अतिरिक्त पूर्वाधार समावेश गर्छ (जस्तै Microsoft Foundry Models स्रोत वा एक AI Search इन्डेक्स), तर azd यी सबैको हेरचाह गर्छ। तपाईंले नयाँ आदेशहरू सिक्न, फरक उपकरण अपनाउन, वा परिनियोजनको बारेमा सोच्न परिवर्तन गर्न आवश्यक छैन।

यो azd को मूल सिद्धान्त हो: **एक कार्यप्रवाह, कुनै पनि कार्यभार।** यस ट्युटोरियलमा अभ्यास गरेका सीपहरू — आरम्भ, परिनियोजन, निगरानी, पुनःपरिनियोजन, र सफाइ — एआई अनुप्रयोगहरू र एजेन्टहरूमा समान रूपमा लागू हुन्छन्।

---

## तपाईंले के सिक्नुभयो

बधाई छ! तपाईंले सफलतापूर्वक:
- ✅ टेम्प्लेटबाट azd परियोजना आरम्भ गर्नुभयो
- ✅ परियोजना संरचना र मुख्य फाइलहरू अन्वेषण गर्नुभयो
- ✅ Azure मा पूर्ण-स्ट्याक अनुप्रयोग परिनियोजन गर्नुभयो
- ✅ कोड परिवर्तन गरि पुनःपरिनियोजन गर्नुभयो
- ✅ बहु वातावरणहरू व्यवस्थापन गर्नुभयो
- ✅ स्रोतहरू सफा गर्नुभयो

## 🎯 कौशल मान्यकरण अभ्यासहरू

### अभ्यास 1: फरक टेम्प्लेट परिनियोजन गर्नुहोस् (15 मिनेट)
**लक्ष्य**: azd init र परिनियोजन वर्कफ्लोमा दक्षता प्रदर्शन गर्नुहोस्

```bash
# Python + MongoDB स्ट्याक प्रयास गर्नुहोस्
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# परिनियोजन जाँच गर्नुहोस्
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# सफा गर्नुहोस्
azd down --force --purge
```

**सफलता मापदण्ड:**
- [ ] अनुप्रयोग त्रुटि बिना परिनियोजन हुन्छ
- [ ] ब्राउजरमा अनुप्रयोग URL पहुँच गर्न सकिन्छ
- [ ] अनुप्रयोग सही रूपमा कार्य गर्दछ (todo थप/हटाउन सकिन्छ)
- [ ] सबै स्रोतहरू सफलतापूर्वक सफा गरियो

### अभ्यास 2: कन्फिगरेसन अनुकूलन गर्नुहोस् (20 मिनेट)
**लक्ष्य**: वातावरण चर कन्फिगरेसन अभ्यास गर्नुहोस्

```bash
cd my-first-azd-app

# अनुकूलित वातावरण सिर्जना गर्नुहोस्
azd env new custom-config

# अनुकूलित चरहरू सेट गर्नुहोस्
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# चरहरू जाँच गर्नुहोस्
azd env get-values | grep APP_TITLE

# अनुकूलित कन्फिगसँग तैनाथ गर्नुहोस्
azd up
```

**सफलता मापदण्ड:**
- [ ] अनुकूलित वातावरण सफलतापूर्वक सिर्जना भयो
- [ ] वातावरण चरहरू सेट गरिएको र प्राप्त गर्न मिल्यो
- [ ] अनुप्रयोग अनुकूलित कन्फिगरेसनसँग परिनियोजन भयो
- [ ] परिनियोजित एपमा अनुकूल सेटिङहरू प्रमाणित गर्न सकिन्छ

### अभ्यास 3: बहु-वातावरण वर्कफ्लो (25 मिनेट)
**लक्ष्य**: वातावरण व्यवस्थापन र परिनियोजन रणनीतिहरूमा निपुणता हासिल गर्नुहोस्

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

# दुवै वातावरणहरू परीक्षण गर्नुहोस्
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# दुवै वातावरणहरू सफा गर्नुहोस्
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**सफलता मापदण्ड:**
- [ ] अलग कन्फिगरेसनहरू सहित दुई वातावरण सिर्जना गरियो
- [ ] दुबै वातावरण सफलतापूर्वक परिनियोजन गरियो
- [ ] `azd env select` प्रयोग गरेर वातावरणहरू बीच स्विच गर्न सकिन्छ
- [ ] वातावरणहरूबीच वातावरण चरहरू फरक छन्
- [ ] दुबै वातावरणहरू सफलतापूर्वक सफा गरियो

## 📊 तपाईंको प्रगति

**लगाइएको समय**: ~60-90 मिनेट  
**आर्जित सीपहरू**:
- ✅ टेम्प्लेट-आधारित परियोजना आरम्भ
- ✅ Azure स्रोत प्रावधान
- ✅ अनुप्रयोग परिनियोजन वर्कफ्लोहरू
- ✅ वातावरण व्यवस्थापन
- ✅ कन्फिगरेसन व्यवस्थापन
- ✅ स्रोत सफाइ र लागत व्यवस्थापन

**अर्को स्तर**: उन्नत कन्फिगरेसन ढाँचाहरू सिक्न तपाईं [कन्फिगरेसन गाइड](configuration.md) को लागि तयार हुनुहुन्छ!

## सामान्य समस्याहरूको समाधान

### प्रमाणीकरण त्रुटिहरू
```bash
# Azure सँग पुनः प्रमाणीकरण गर्नुहोस्
az login

# सब्सक्रिप्शन पहुँच सत्यापित गर्नुहोस्
az account show
```

### परिनियोजन असफलताहरू
```bash
# डिबग लगिङ सक्षम गर्नुहोस्
export AZD_DEBUG=true
azd up --debug

# Azure मा अनुप्रयोगका लॉगहरू हेर्नुहोस्
azd monitor --logs

# Container Apps का लागि Azure CLI प्रयोग गर्नुहोस्:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### स्रोत नाम द्वन्द्वहरू
```bash
# एक विशिष्ट वातावरण नाम प्रयोग गर्नुहोस्
azd env new dev-$(whoami)-$(date +%s)
```

### पोर्ट/नेटवर्क समस्याहरू
```bash
# पोर्टहरू उपलब्ध छन् कि छैनन् जाँच गर्नुहोस्
netstat -an | grep :3000
netstat -an | grep :3100
```

## अर्को चरणहरू

अब जब तपाइँले आफ्नो पहिलो परियोजना पूरा गर्नुभयो, यी उन्नत विषयहरू अन्वेषण गर्नुहोस्:

### 1. पूर्वाधार अनुकूलन गर्नुहोस्
- [कोडको रूपमा पूर्वाधार](../chapter-04-infrastructure/provisioning.md)
- [डेटाबेस, स्टोरेज, र अन्य सेवाहरू थप्नुहोस्](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD सेटअप गर्नुहोस्
- [परिनियोजन गाइड](../chapter-04-infrastructure/deployment-guide.md) - पूरा CI/CD कार्यप्रवाहहरू
- [Azure Developer CLI डक्युमेन्टेशन](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - पाइपलाइन कन्फिगरेसन

### 3. उत्पादन उत्तम अभ्यासहरू
- [परिनियोजन गाइड](../chapter-04-infrastructure/deployment-guide.md) - सुरक्षा, प्रदर्शन, र निगरानी

### 4. थप टेम्प्लेटहरू अन्वेषण गर्नुहोस्
```bash
# श्रेणीअनुसार टेम्पलेटहरू ब्राउज गर्नुहोस्
azd template list --filter web
azd template list --filter api
azd template list --filter database

# विभिन्न प्रविधि स्ट्याकहरू प्रयास गर्नुहोस्
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## अतिरिक्त स्रोतहरू

### शिक्षण सामग्रीहरू
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### समुदाय र समर्थन
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### टेम्प्लेटहरू र उदाहरणहरू
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**तपाईंको पहिलो azd परियोजना पूरा गर्नु भएकोमा बधाई!** अब तपाईं आत्मविश्वासका साथ Azure मा आश्चर्यजनक अनुप्रयोगहरू निर्माण र परिनियोजन गर्न तयार हुनुहुन्छ।

---

**अध्याय नेभिगेसन:**
- **📚 Course Home**: [AZD शुरुवातीहरूका लागि](../../README.md)
- **📖 Current Chapter**: अध्याय 1 - आधार र छिटो सुरूवात
- **⬅️ Previous**: [इन्स्टलेसन र सेटअप](installation.md)
- **➡️ Next**: [कन्फिगरेसन](configuration.md)
- **🚀 Next Chapter**: [अध्याय २: एआई-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [परिनियोजन गाइड](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धताका लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुन सक्छ। मूल दस्तावेजलाई यसको मूल भाषामा अधिकारिक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि पेशेवर मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा गलत व्याख्याका लागि हामी उत्तरदायी हुनेछैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->