# तपाईंको पहिलो परियोजना - व्यावहारिक ट्यूटोरियल

**अध्याय नेभिगेसन:**
- **📚 Course Home**: [AZD आरम्भिकहरूका लागि](../../README.md)
- **📖 Current Chapter**: अध्याय 1 - आधार र छिटो सुरु
- **⬅️ Previous**: [स्थापना र सेटअप](installation.md)
- **➡️ Next**: [कन्फिगरेसन](configuration.md)
- **🚀 Next Chapter**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

तपाईंको पहिलो Azure Developer CLI परियोजनामा स्वागत छ! यो व्यापक व्यावहारिक ट्यूटोरियलले azd प्रयोग गरी Azure मा पूर्ण-स्ट्याक अनुप्रयोग सिर्जना, तैनाथ, र व्यवस्थापन गर्ने पूर्ण मार्गदर्शन प्रदान गर्दछ। तपाईंले React फ्रन्टएन्ड, Node.js API ब्याकएन्ड, र MongoDB डाटाबेस सहित वास्तविक todo अनुप्रयोगमा काम गर्नुहुनेछ।

## सिक्ने लक्ष्यहरू

यस ट्यूटोरियल पूरा गरेपछि, तपाईं:
- टेम्पलेटहरू प्रयोग गरेर azd परियोजना आरम्भ कार्यप्रवाहमा दक्ष हुनुहुनेछ
- Azure Developer CLI परियोजना संरचना र कन्फिगरेसन फाइलहरू बुझ्नुहुनेछ
- इन्फ्रास्ट्रक्चर प्राविजनिङसहित अनुप्रयोगलाई Azure मा पूर्ण रूपमा तैनाथ गर्न सक्नुहुनेछ
- अनुप्रयोग अपडेटहरू र पुन:तैनाथ रणनीतिहरू लागू गर्न सक्नुहुनेछ
- विकास र स्टेजिङका लागि बहु वातावरणहरू व्यवस्थापन गर्न सक्नुहुनेछ
- स्रोत क्लिनअप र लागत व्यवस्थापन अभ्यासहरू लागू गर्न सक्नुहुनेछ

## सिकाइ नतिजाहरू

पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- स्वतन्त्र रूपमा टेम्पलेटबाट azd परियोजनाहरू आरम्भ र कन्फिगर गर्न
- azd परियोजना संरचनाहरू प्रभावकारी रूपमा नेभिगेट र परिमार्जन गर्न
- एकल आदेशहरू प्रयोग गरेर Azure मा पूर्ण-स्ट्याक अनुप्रयोगहरू तैनाथ गर्न
- सामान्य तैनाथ समस्याहरू र प्रमाणीकरण समस्याहरू समाधान गर्न
- विभिन्न तैनाथ चरणहरूको लागि बहु Azure वातावरणहरू व्यवस्थापन गर्न
- अनुप्रयोग अपडेटका लागि निरन्तर तैनाथ कार्यप्रवाहहरू लागू गर्न

## सुरु गर्ने तरिका

### आवश्यकताहरू जाँचसूची
- ✅ Azure Developer CLI इन्स्टल गरिएको ([इन्स्टलेशन गाइड](installation.md))
- ✅ Azure CLI इन्स्टल गरिएको र प्रमाणीकृत
- ✅ तपाईंको सिस्टममा Git इन्स्टल गरिएको
- ✅ Node.js 16+ (यस ट्यूटोरियलको लागि)
- ✅ Visual Studio Code (सिफारिश गरिएको)

### आफ्नो सेटअप जाँच्नुहोस्
```bash
# azd स्थापना जाँच गर्नुहोस्
azd version
```
### Azure प्रमाणीकरण जाँच्नुहोस्

```bash
az account show
```

### Node.js संस्करण जाँच्नुहोस्
```bash
node --version
```

## चरण 1: टेम्पलेट छान्नुहोस् र आरम्भ गर्नुहोस्

हामी React फ्रन्टएन्ड र Node.js API ब्याकएन्ड समावेश गर्ने लोकप्रिय todo अनुप्रयोग टेम्पलेटबाट सुरु गरौं।

```bash
# उपलब्ध टेम्पलेटहरू ब्राउज़ गर्नुहोस्
azd template list

# TODO एप टेम्पलेट आरम्भ गर्नुहोस्
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# प्रॉम्प्टहरू अनुसरण गर्नुहोस्:
# - वातावरणको नाम प्रविष्ट गर्नुहोस्: "dev"
# - एउटा सदस्यता छान्नुहोस् (यदि तपाईंसँग धेरै छन् भने)
# - एउटा क्षेत्र छान्नुहोस्: "East US 2" (वा तपाईंको मनपर्ने क्षेत्र)
```

### के भयो?
- टेम्पलेट कोड तपाईंको स्थानीय निर्देशिकामा डाउनलोड गरियो
- सेवा परिभाषाहरू सहित `azure.yaml` फाइल बनाइयो
- `infra/` निर्देशिकामा इन्फ्रास्ट्रक्चर कोड सेटअप गरियो
- एक वातावरण कन्फिगरेसन बनाइयो

## चरण 2: परियोजना संरचना अन्वेषण गर्नुहोस्

हेरौं azd ले हाम्रो लागि के बनायो:

```bash
# परियोजना संरचना हेर्नुहोस्
tree /f   # विन्डोज
# वा
find . -type f | head -20   # म्याकओएस/लिनक्स
```

तपाईंले यी देख्नुपर्नेछ:
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
# परियोजना कन्फिगरेसन हेर्नुहोस्
cat azure.yaml
```

**infra/main.bicep** - इन्फ्रास्ट्रक्चर परिभाषा:
```bash
# पूर्वाधार कोड हेर्नुहोस्
head -30 infra/main.bicep
```

## चरण 3: आफ्नो परियोजना अनुकूलन गर्नुहोस् (वैकल्पिक)

तैनाथ गर्नु अघि, तपाईं अनुप्रयोग अनुकूलन गर्न सक्नुहुन्छ:

### फ्रन्टएन्ड परिमार्जन गर्नुहोस्
```bash
# React एप कम्पोनेंट खोल्नुहोस्
code src/web/src/App.tsx
```

एक साधारण परिवर्तन गर्नुहोस्:
```typescript
// शीर्षक फेला पार्नुहोस् र परिवर्तन गर्नुहोस्
<h1>My Awesome Todo App</h1>
```

### वातावरण भेरिएबलहरू कन्फिगर गर्नुहोस्
```bash
# अनुकूलित वातावरण चरहरू सेट गर्नुहोस्
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# सबै वातावरण चरहरू हेर्नुहोस्
azd env get-values
```

## चरण 4: Azure मा तैनाथ गर्नुहोस्

अब रोमाञ्चक भाग - सबै कुरा Azure मा तैनाथ गर्नुहोस्!

```bash
# पूर्वाधार र अनुप्रयोग तैनाथ गर्नुहोस्
azd up

# यो आदेशले निम्न कार्यहरू गर्नेछ:
# 1. Azure स्रोतहरू (App Service, Cosmos DB, आदि) प्रावधान गर्ने
# 2. तपाईंको अनुप्रयोग निर्माण गर्ने
# 3. प्रावधान गरिएका स्रोतहरूमा तैनाथ गर्ने
# 4. अनुप्रयोगको URL देखाउने
```

### तैनाथको क्रममा के भइरहेको छ?

तलका कदमहरू `azd up` कमाण्डले गर्छ:
1. **प्रोभिजन** (`azd provision`) - Azure स्रोतहरू बनाउँछ
2. **प्याकेज** - तपाईंको अनुप्रयोग कोड बिल्ड गर्छ
3. **डिप्लोय** (`azd deploy`) - कोडलाई Azure स्रोतहरूमा तैनाथ गर्छ

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
तैनाथ आउटपुटमा दिइएको URL मा क्लिक गर्नुहोस्, वा कुनै पनि समय प्राप्त गर्नुहोस्:
```bash
# अनुप्रयोगका अन्तबिन्दुहरू प्राप्त गर्नुहोस्
azd show

# आफ्नो ब्राउजरमा अनुप्रयोग खोल्नुहोस्
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo अनुप्रयोग परीक्षण गर्नुहोस्
1. **Add a todo item** - "Add Todo" मा क्लिक गर्नुहोस् र कार्य प्रविष्ट गर्नुहोस्
2. **Mark as complete** - पूरा भएका वस्तुहरू जाँच गर्नुहोस्
3. **Delete items** - तपाईँले अब आवश्यक नपर्ने todo हरू हटाउनुहोस्

### आफ्नो अनुप्रयोग अनुगमन गर्नुहोस्
```bash
# आफ्ना स्रोतहरूको लागि Azure पोर्टल खोल्नुहोस्
azd monitor

# अनुप्रयोग लगहरू हेर्नुहोस्
azd monitor --logs

# लाइभ मेट्रिक्स हेर्नुहोस्
azd monitor --live
```

## चरण 6: परिवर्तनहरू गर्नुहोस् र पुन:तैनाथ गर्नुहोस्

केहि परिवर्तन गरौं र अपडेट कति सजिलो छ हेर्नुहोस्:

### API परिमार्जन गर्नुहोस्
```bash
# API को कोड सम्पादन गर्नुहोस्
code src/api/src/routes/lists.js
```

एक कस्टम रिस्पोन्स हेडर थप्नुहोस्:
```javascript
// रुट ह्यान्डलर फेला पार्नुहोस् र थप्नुहोस्:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### केवल कोड परिवर्तनहरू तैनाथ गर्नुहोस्
```bash
# अनुप्रयोगको कोड मात्र परिनियोजन गर्नुहोस् (पूर्वाधार छोड्नुहोस्)
azd deploy

# पूर्वाधार पहिले नै अवस्थित भएकाले यो 'azd up' भन्दा धेरै छिटो छ।
```

## चरण 7: बहु वातावरणहरू व्यवस्थापन गर्नुहोस्

उत्पादनअघि परिवर्तनहरू परीक्षण गर्न स्टेजिङ वातावरण सिर्जना गर्नुहोस्:

```bash
# नयाँ स्टेजिङ वातावरण सिर्जना गर्नुहोस्
azd env new staging

# स्टेजिङमा परिनियोजन गर्नुहोस्
azd up

# डेभ वातावरणमा फिर्ता स्विच गर्नुहोस्
azd env select dev

# सबै वातावरणहरू सूचीबद्ध गर्नुहोस्
azd env list
```

### वातावरण तुलना
```bash
# डेभ वातावरण हेर्नुहोस्
azd env select dev
azd show

# स्टेजिङ वातावरण हेर्नुहोस्
azd env select staging
azd show
```

## चरण 8: स्रोतहरू सफा गर्नुहोस्

परीक्षण समाप्त भएपछि, लगातार शुल्कहरूबाट जोगिन सफा गर्नुहोस्:

```bash
# वर्तमान वातावरणका लागि सबै Azure स्रोतहरू मेटाउनुहोस्
azd down

# पुष्टिकरण बिना जबर्जस्ती मेटाउनुहोस् र सफ्ट-डिलिट गरिएका स्रोतहरू पूर्ण रूपमा हटाउनुहोस्
azd down --force --purge

# विशिष्ट वातावरण मेटाउनुहोस्
azd env select staging
azd down --force --purge
```

## तपाईंले के सिक्नुभयो

बधाई छ! तपाईंले सफलतापूर्वक:
- ✅ टेम्पलेटबाट azd परियोजना आरम्भ गर्नुभयो
- ✅ परियोजना संरचना र प्रमुख फाइलहरू अन्वेषण गर्नुभयो
- ✅ Azure मा पूर्ण-स्ट्याक अनुप्रयोग तैनाथ गर्नुभयो
- ✅ कोड परिवर्तनहरू गर्नुभयो र पुन:तैनाथ गर्नुभयो
- ✅ बहु वातावरणहरू व्यवस्थापन गर्नुभयो
- ✅ स्रोतहरू सफा गर्नुभयो

## 🎯 सीप प्रमाणीकरण अभ्यासहरू

### अभ्यास 1: फरक टेम्पलेट तैनाथ गर्नुहोस् (15 मिनेट)
**लक्ष्य**: azd init र तैनाथ कार्यप्रवाहमा दक्षता देखाउनु

```bash
# Python + MongoDB स्ट्याक प्रयास गर्नुहोस्
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# परिनियोजन प्रमाणित गर्नुहोस्
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# सफाइ गर्नुहोस्
azd down --force --purge
```

**सफलता मापदण्ड:**
- [ ] एप्लिकेशन त्रुटिहरू बिना तैनाथ हुन्छ
- [ ] ब्राउजरमा एप्लिकेशन URL पहुँच गर्न सकिन्छ
- [ ] एप्लिकेशन ठीकसँग काम गर्छ (todo थप/हट)
- [ ] स्रोतहरू सबै सफलतापूर्वक सफा गरियो

### अभ्यास 2: कन्फिगरेसन अनुकूलन गर्नुहोस् (20 मिनेट)
**लक्ष्य**: वातावरण भेरिएबल कन्फिगरेसन अभ्यास गर्नु

```bash
cd my-first-azd-app

# अनुकूलित वातावरण सिर्जना गर्नुहोस्
azd env new custom-config

# अनुकूलित चरहरू सेट गर्नुहोस्
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# चरहरू प्रमाणित गर्नुहोस्
azd env get-values | grep APP_TITLE

# अनुकूलित कन्फिगसँग तैनाथ गर्नुहोस्
azd up
```

**सफलता मापदण्ड:**
- [ ] कस्टम वातावरण सफलतापूर्वक सिर्जना भयो
- [ ] वातावरण भेरिएबलहरू सेट र पुन:प्राप्त गर्न मिल्ने
- [ ] एप्लिकेशन कस्टम कन्फिगरेसनसँग तैनाथ हुन्छ
- [ ] तैनाथ एपमा कस्टम सेटिङहरू जाँच गर्न मिल्छ

### अभ्यास 3: बहु-वातावरण कार्यप्रवाह (25 मिनेट)
**लक्ष्य**: वातावरण व्यवस्थापन र तैनाथ रणनीतिहरूमा दक्ष हुनु

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

# दुवै वातावरणहरू परीक्षण गर्नुहोस्
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# दुवै सफा गर्नुहोस्
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**सफलता मापदण्ड:**
- [ ] विभिन्न कन्फिगरेसनहरूसँग दुई वातावरणहरू सिर्जना भए
- [ ] दुवै वातावरणहरू सफलतापूर्वक तैनाथ भए
- [ ] `azd env select` प्रयोग गरेर वातावरणहरू बीच स्विच गर्न सकिन्छ
- [ ] वातावरण भेरिएबलहरू वातावरणहरू बीच फरक छन्
- [ ] दुबै वातावरणहरू सफलतापूर्वक सफा गरियो

## 📊 तपाईंको प्रगति

**लगाएको समय**: ~60-90 मिनेट  
**अर्जित सीपहरू**:
- ✅ टेम्पलेट-आधारित परियोजना आरम्भ
- ✅ Azure स्रोत प्राविजनिङ
- ✅ अनुप्रयोग तैनाथ कार्यप्रवाहहरू
- ✅ वातावरण व्यवस्थापन
- ✅ कन्फिगरेसन व्यवस्थापन
- ✅ स्रोत सफाइ र लागत व्यवस्थापन

**अर्को स्तर**: उन्नत कन्फिगरेसन ढाँचाहरू सिक्न [कन्फिगरेसन गाइड](configuration.md) को लागि तपाईं तयार हुनुहुन्छ!

## सामान्य समस्या समाधान

### प्रमाणीकरण त्रुटिहरू
```bash
# Azure सँग पुनः प्रमाणीकरण गर्नुहोस्
az login

# सदस्यता पहुँच जाँच गर्नुहोस्
az account show
```

### तैनाथ विफलताहरू
```bash
# डिबग लगिङ सक्षम गर्नुहोस्
export AZD_DEBUG=true
azd up --debug

# Azure मा अनुप्रयोगका लगहरू हेर्नुहोस्
azd monitor --logs

# Container Apps का लागि Azure CLI प्रयोग गर्नुहोस्:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### स्रोत नाम द्वन्द्वहरू
```bash
# अद्वितीय वातावरण नाम प्रयोग गर्नुहोस्
azd env new dev-$(whoami)-$(date +%s)
```

### पोर्ट/नेटवर्क समस्या
```bash
# पोर्टहरू उपलब्ध छन् कि छैनन् भनेर जाँच गर्नुहोस्
netstat -an | grep :3000
netstat -an | grep :3100
```

## आगामी कदमहरू

अब जब तपाईंले आफ्नो पहिलो परियोजना पूरा गर्नुभयो, यी उन्नत विषयहरू अन्वेषण गर्नुहोस्:

### 1. इन्फ्रास्ट्रक्चर अनुकूलन गर्नुहोस्
- [कोडको रूपमा इन्फ्रास्ट्रक्चर](../chapter-04-infrastructure/provisioning.md)
- [डेटाबेस, स्टोरेज र अन्य सेवाहरू थप्नुहोस्](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD सेटअप गर्नुहोस्
- [तैनाथ गाइड](../chapter-04-infrastructure/deployment-guide.md) - पूर्ण CI/CD कार्यप्रवाहहरू
- [Azure Developer CLI डकुमेन्टेसन](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - पाइपलाइन कन्फिगरेसन

### 3. उत्पादनका उत्तम अभ्यासहरू
- [तैनाथ गाइड](../chapter-04-infrastructure/deployment-guide.md) - सुरक्षा, प्रदर्शन, र अनुगमन

### 4. थप टेम्पलेटहरू अन्वेषण गर्नुहोस्
```bash
# श्रेणीअनुसार टेम्प्लेटहरू ब्राउज गर्नुहोस्
azd template list --filter web
azd template list --filter api
azd template list --filter database

# विभिन्न प्रविधि स्ट्याकहरू प्रयोग गरेर हेर्नुहोस्
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## थप स्रोतहरू

### सिकाइ सामग्रीहरू
- [Azure Developer CLI डकुमेन्टेसन](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर सेन्टर](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### समुदाय र समर्थन
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer समुदाय](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### टेम्पलेटहरू र उदाहरणहरू
- [अधिकारिक टेम्पलेट ग्यालरी](https://azure.github.io/awesome-azd/)
- [समुदाय टेम्पलेटहरू](https://github.com/Azure-Samples/azd-templates)
- [एंटरप्राइज प्याटर्नहरू](https://github.com/Azure/azure-dev/tree/main/templates)

---

**तपाईंको पहिलो azd परियोजना पूरा गरेकोमा बधाई!** अब तपाईं विश्वस्तताका साथ Azure मा अद्भुत अनुप्रयोगहरू निर्माण र तैनाथ गर्न तयार हुनुहुन्छ। 

---

**अध्याय नेभिगेसन:**
- **📚 Course Home**: [AZD आरम्भिकहरूका लागि](../../README.md)
- **📖 Current Chapter**: अध्याय 1 - आधार र छिटो सुरु
- **⬅️ Previous**: [स्थापना र सेटअप](installation.md)
- **➡️ Next**: [कन्फिगरेसन](configuration.md)
- **🚀 Next Chapter**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [तैनाथ गाइड](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो कागजात AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शুদ্ধताका लागि प्रयास गर्दछौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुनसक्छ। मूल दस्तावेजलाई त्यसको मूल भाषामा नै आधिकारिक स्रोत मान्नुहोस्। महत्वपूर्ण जानकारीका लागि पेशेवर मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट हुने कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी उत्तरदायी हुने छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->