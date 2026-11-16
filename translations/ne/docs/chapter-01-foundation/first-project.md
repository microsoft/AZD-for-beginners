# तपाईंको पहिलो परियोजना - व्यावहारिक ट्युटोरियल

**अध्याय नेभिगेशन:**
- **📚 कोर्स होम**: [AZD नयाँ सुरु गर्नेका लागि](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 1 - आधार र छिटो सुरु
- **⬅️ अघिल्लो**: [इन्स्टलेशन र सेटअप](installation.md)
- **➡️ अर्को**: [आफ्नो एप ल्याउनुहोस्](bring-your-own-app.md)
- **🚀 अर्को अध्याय**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

तपाईंको पहिलो Azure Developer CLI परियोजनामा स्वागत छ! तपाईंले React फ्रन्टएन्ड, Node.js API, र Azure Cosmos DB सहितको todo अनुप्रयोग तैनाथ गर्नुहुनेछ। टेम्प्लेटले ऐतिहासिक नाम `todo-nodejs-mongo` राखेको छ; यसको वर्तमान पूर्वाधार Cosmos DB नोSQL का लागि प्रयोग गर्छ, त्यसैले नामबाट डेटाबेस API अनुमान गर्नु भन्दा डाउनलोड गरिएको README र `infra/` हेर्नुहोस्।

> नोभेम्बर 2026 मा `azd 1.37.2` र सार्वजनिक टेम्प्लेट विरुद्ध समीक्षा गरियो। तलको उदाहरणहरू Bash प्रयोग गर्छन्; JSON निकासका लागि पनि `jq` आवश्यक छ। Azure तैनाथीकरण शुल्क लाग्छ र यस समीक्षा समयमा कार्यान्वयन गरिएन।

## सिकाइ लक्ष्यहरू

यस ट्युटोरियल सम्पन्न गर्दा, तपाईंले:
- टेम्प्लेटहरू प्रयोग गरेर azd परियोजना आरम्भ गर्ने कार्यप्रवाहमा मास्टरी हासिल गर्नुहोस्
- Azure Developer CLI परियोजना संरचना र कन्फिगरेसन फाइलहरू बुझ्नुहोस्
- पूर्वाधार प्रावधान सहित Azure मा सम्पूर्ण अनुप्रयोग तैनाथ गर्नुहोस्
- अनुप्रयोग अद्यावधिक र पुन: तैनाथीकरण रणनीतिहरू कार्यान्वयन गर्नुहोस्
- विकास र स्टेजिङका लागि बहु वातावरण व्यवस्थापन गर्नुहोस्
- स्रोत सफाई र लागत व्यवस्थापन अभ्यासहरूको प्रयोग गर्नुहोस्

## सिकाइ उपलब्धिहरू

समाप्त भएपछि, तपाईंले सक्षम हुनुहुनेछ:
- स्वतन्त्र रूपमा टेम्प्लेटबाट azd परियोजना आरम्भ र कन्फिगर गर्न
- azd परियोजना संरचनाहरू प्रभावकारी रूपमा नेभिगेट र परिमार्जन गर्न
- एकल आदेश प्रयोग गरी Azure मा पूर्ण स्ट्याक अनुप्रयोग तैनाथ गर्न
- सामान्य तैनाथीकरण समस्याहरू र प्रमाणीकरण समस्याहरू समाधान गर्न
- विभिन्न तैनाथ चरणहरूको लागि बहु Azure वातावरणहरू व्यवस्थापन गर्न
- अनुप्रयोग अद्यावधिकहरूको लागि निरन्तर तैनाथीकरण कार्यप्रवाहहरू कार्यान्वयन गर्न

## सुरु गर्दै

### आवश्यकताहरू जाँच सूची
- ✅ Azure Developer CLI इन्स्टल भएको ([इन्स्टलेशन गाइड](installation.md))
- ✅ AZD प्रमाणीकरण `azd auth login` प्रयोग गरेर सम्पन्न गरिएको
- ✅ तपाईँको प्रणालीमा Git इन्स्टल भएको
- ✅ Node.js 22 LTS (वा डाउनलोड गरिएको टेम्प्लेटले आवश्यक पर्ने समर्थित संस्करण)
- ✅ Visual Studio Code (सिफारिस गरिएको)

अघि बढ्नु अघि, रिपोजिटरी रुटबाट सेटअप भ्यालिडेटर चलाउनुहोस्:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### तपाईंको सेटअप जाँच गर्नुहोस्
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### वैकल्पिक Azure CLI प्रमाणीकरण जाँच गर्नुहोस्

```bash
az account show
```

### Node.js संस्करण जाँच गर्नुहोस्
```bash
node --version
```

## चरण 1: टेम्प्लेट छान्नुहोस् र आरम्भ गर्नुहोस्

आउनुहोस् लोकप्रिय todo अनुप्रयोग टेम्प्लेटबाट सुरु गरौँ जसमा React फ्रन्टएन्ड र Node.js API ब्याकएन्ड छ।

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### के भयो?
- टेम्प्लेट कोड स्थानीय डाइरेक्टरीमा डाउनलोड गरियो
- सेवा परिभाषासहित `azure.yaml` फाइल बनाएँ
- पूर्वाधार कोड `infra/` डाइरेक्टरीमा सेट अप गरियो
- वातावरण कन्फिगरेसन सिर्जना गरियो

## चरण 2: परियोजना संरचना अन्वेषण गर्नुहोस्

आउनुहोस् हेर्ने के azd ले हामीलाई बनाएको छ:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

तपाईँले देख्नु पर्नेछ:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### बुझ्न महत्वपूर्ण फाइलहरू

**azure.yaml** - तपाईंको azd परियोजनाको मुटु:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - पूर्वाधार परिभाषा:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## चरण 3: तपाईंको परियोजना अनुकूलन गर्नुहोस् (वैकल्पिक)

तैनाथीकरण अघि, तपाईं अनुप्रयोग अनुकूलन गर्न सक्नुहुन्छ:

### फ्रन्टएन्ड परिमार्जन गर्नुहोस्
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

एउटा साधारण परिवर्तन गर्नुहोस्:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### वातावरण चरहरू कन्फिगर गर्नुहोस्
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

यी दुई अनुकूलन मानहरूले स्थानीय भण्डारण मात्र देखाउँछन्। स्टक टेम्प्लेटले `WEBSITE_TITLE` वा `API_VERSION` प्रयोग गर्दैन, त्योैले एप परिवर्तन हुँदैन। माथिको स्पष्ट स्रोत सम्पादनले प्रदर्शन गरिएको शीर्षक परिवर्तन गर्छ।

## चरण 4: Azure मा तैनाथ गर्नुहोस्

अब रोचक भाग - सबै कुरा Azure मा तैनाथ गर्नुहोस्!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### तैनाथीकरणको क्रममा के भइरहेको छ?

कार्यप्रवाहले पूर्वाधार प्रावधान गर्दछ र प्याकेज/कोड तैनाथ गर्दछ। ठ्याक्कै अर्डरिङ्ग `workflows.up` मा `azure.yaml` मार्फत अनुकूल गर्न सकिन्छ; यस टेम्प्लेटले provision पछि deploy निर्दिष्ट गरेको छ। हरेक टेम्प्लेटका लागि एक सार्वभौम चरण अर्डरमा निर्भर नगर्नुहोस्।

### अपेक्षित परिणाम
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## चरण 5: तपाईंको अनुप्रयोग परीक्षण गर्नुहोस्

### तपाईंको अनुप्रयोग पहुँच गर्नुहोस्
तैनाथीकरण आउटपुटमा दिइएको URL मा क्लिक गर्नुहोस्, वा कहिले पनि प्राप्त गर्नुहोस्:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Todo अनुप्रयोग परीक्षण गर्नुहोस्
1. **Todo आइटम थप्नुहोस्** - "Add Todo" क्लिक गरी काम प्रविष्ट गर्नुहोस्
2. **सम्पन्न मार्क गर्नुहोस्** - पूरा भएका आइटमहरू चेक गर्नुहोस्
3. **आइटमहरू मेटाउनुहोस्** - आवश्यक नपरेका todo हटाउनुहोस्

### तपाईंको अनुप्रयोग अनुगमन गर्नुहोस्
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ तपाईंको तैनाथीकरण जाँच्नुहोस्

अघि बढ्नु अघि, छिटो जाँच सूचीबाट सबै वास्तविक रूपमा काम गर्छ भनी पुष्टि गर्नुहोस् — "deploy succeeded" को अर्थ "app works" होइन:

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**तैनाथीकरण जाँच भएको छ जब:**
- ✅ `azd show` ले पहुँचयोग्य अन्तबिन्दु URL देखाउँछ
- ✅ URL तपाईंको ब्राउजरमा त्रुटि बिना खुल्छ
- ✅ मुख्य सुविधाहरू काम गर्छन् (todo थप्नुहोस्/पूरा गर्नुहोस्/मेटाउनुहोस्)
- ✅ `azd monitor --logs` ले अनुरोधहरू बिना अप्रत्याशित त्रुटिहरू देखाउँछ

कुनै पनि जाँच असफल भएमा, [अध्याय 7: समस्या समाधान](../chapter-07-troubleshooting/README.md) मा जानुहोस्।

## चरण 6: परिवर्तनहरू गर्नुहोस् र पुन: तैनाथ गर्नुहोस्

आउनुहोस् एउटा परिवर्तन गरौं र अद्यावधिक गर्न कति सजिलो छ हेर्नुहोस्:

### API परिमार्जन गर्नुहोस्
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

एउटा कस्टम प्रतिक्रिया हेडर थप्नुहोस्:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### केवल कोड परिवर्तनहरू तैनाथ गर्नुहोस्
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## चरण 7: बहु वातावरण व्यवस्थापन गर्नुहोस्

उत्पादन पहिले परिवर्तनहरू परीक्षण गर्न एक स्टेजिङ वातावरण बनाएँ:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### वातावरण तुलना
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## चरण 8: स्रोतहरू सफा गर्नुहोस्

परीक्षण समाप्त भएपछि, लागत बचत गर्न सफा गर्नुहोस्:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## क्लासिक एप विरुद्ध AI-संचालित एप: एउटै कार्यप्रवाह

तपाईंले एउटा पारम्परिक वेब अनुप्रयोग तैनाथ गर्नुभयो। तर तपाईं AI-सञ्चालित एप जस्तै Microsoft Foundry Models द्वारा समर्थित च्याट अनुप्रयोग तैनाथ गर्न चाहनुहुन्छ भने?

राम्रो खबर: **कार्यप्रवाह उस्तै छ।**

| चरण | क्लासिक Todo एप | AI च्याट एप |
|------|-----------------|-------------|
| आरम्भ (रिक्त डाइरेक्टरी) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| प्रमाणीकरण | `azd auth login` | `azd auth login` |
| तैनाथ | `azd up` | `azd up` |
| अनुगमन | `azd monitor` | `azd monitor` |
| सफा गर्नुहोस् | `azd down --force --purge` | `azd down --force --purge` |

जीवनचक्र आदेश उस्तै हुन्छन्, तर आवश्यकताहरू फरक पर्न सक्छन्। AI टेम्प्लेटले मोडेल पहुँच, क्षेत्रीय कोटा, डेटा सेवन, र थप कन्फिगरेसन आवश्यक पर्न सक्छ। यसको README पढ्नुहोस्; `azd up` ले हराइरहेका अनुमति वा कोटा दिन सक्दैन।

यो azd को मुख्य सिद्धान्त हो: **एउटा कार्यप्रवाह, कुनै पनि भार।** तपाईंले यो ट्युटोरियलमा अभ्यास गरेका सीपहरू — आरम्भ, तैनाथ, अनुगमन, पुनः तैनाथ, र सफा गर्ने — AI अनुप्रयोग र एजेन्टहरूमा समान रूपमा प्रयोग हुन्छन्।

---

## तपाईंले के सिक्नुभयो

बधाई छ! तपाईं सफलतापूर्वक:
- ✅ टेम्प्लेटबाट azd परियोजना आरम्भ गर्नुभयो
- ✅ परियोजना संरचना र मुख्य फाइलहरू अन्वेषण गर्नुभयो
- ✅ azure मा पूर्ण-स्ट्याक अनुप्रयोग तैनाथ गर्नुभयो
- ✅ कोड परिवर्तन गरी पुनः तैनाथ गर्नुभयो
- ✅ बहु वातावरणहरू व्यवस्थापन गर्नुभयो
- ✅ स्रोतहरू सफा गर्नुभयो

## 🎯 कौशल सुनिश्चित अभ्यासहरू

### अभ्यास 1: फरक टेम्प्लेट तैनाथ गर्नुहोस् (१५ मिनेट)
**लक्ष्य**: azd init र तैनाथीकरण कार्यप्रवाहको मास्टरी देखाउनुहोस्

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**सफलता मापदण्डहरू:**
- [ ] अनुप्रयोग त्रुटिबिना तैनाथ हुन्छ
- [ ] अनुप्रयोग URL ब्राउजरमा पहुँचयोग्य हुन्छ
- [ ] अनुप्रयोग ठीकसँग काम गर्छ (todos थप/मेटाउन)
- [ ] सफलतापूर्वक सबै स्रोतहरू सफा गरियो

### अभ्यास 2: कन्फिगरेसन अनुकूलन गर्नुहोस् (२० मिनेट)
**लक्ष्य**: रनटाइम कन्फिगरेसन होइन, स्थानीय वातावरण मान भण्डारण अभ्यास गर्नुहोस्

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**सफलता मापदण्डहरू:**
- [ ] अनुकूलित वातावरण सफलतापूर्वक सिर्जना गरियो
- [ ] वातावरण चरहरू सेट गरी प्राप्त गर्न सकिन्छ
- [ ] `azd env get-value APP_TITLE` ले `My Custom Todo App` छाप्छ
- [ ] स्पष्ट पार्न सक्नुहुन्छ यी मानहरूले स्टक एप परिवर्तन गर्दैन जबसम्म कोड/पूर्वाधारले प्रयोग गर्दैन

### अभ्यास 3: बहु-परिवेश कार्यप्रवाह (२५ मिनेट)
**लक्ष्य**: वातावरण व्यवस्थापन र तैनाथीकरण रणनीतिमा मास्टरी पाउनुहोस्

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**सफलता मापदण्डहरू:**
- [ ] दुई वातावरण फरक कन्फिगरेसनसहित सिर्जना गरियो
- [ ] दुवै वातावरण सफलतापूर्वक तैनाथ गरियो
- [ ] `azd env select` प्रयोग गरी वातावरणहरू बीच स्विच गर्न सकिन्छ
- [ ] वातावरण चरहरू वातावरणहरूबीच फरक छन्
- [ ] दुवै वातावरण सफा गर्न सफल भयो

## 📊 तपाईंको प्रगति

**लाग्न गएको समय**: ~६०-९० मिनेट  
**अर्जित कौशलहरू**:
- ✅ टेम्प्लेट आधारित परियोजना आरम्भ
- ✅ Azure स्रोत प्रावधान
- ✅ अनुप्रयोग तैनाथ कार्यप्रवाहहरू
- ✅ वातावरण व्यवस्थापन
- ✅ कन्फिगरेसन व्यवस्थापन
- ✅ स्रोत सफाई र लागत व्यवस्थापन

**अर्को स्तर**: तपाईं तयार हुनुहुन्छ [कन्फिगरेसन गाइड](../chapter-03-configuration/configuration.md) अन्तर्गत उन्नत कन्फिगरेसन ढाँचाहरू सिक्न!

## सामान्य समस्या समाधान

### प्रमाणीकरण त्रुटिहरू
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### तैनाथीकरण असफलताहरू
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### स्रोत नाम द्वन्द्वहरू
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### पोर्ट/नेटवर्क समस्याहरू
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## अर्को कदमहरू

अब तपाईंले पहिलो परियोजना सम्पूर्ण गर्नुभएकोले, यी उन्नत विषयहरू अन्वेषण गर्नुहोस्:

### 1. पूर्वाधार अनुकूलन गर्नुहोस्
- [पूर्वाधार कोडको रूपमा](../chapter-04-infrastructure/provisioning.md)
- [डाटाबेस पूर्वाधार थप्नुहोस्](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. CI/CD सेटअप गर्नुहोस्
- [तैनाथीकरण मार्गदर्शिका](../chapter-04-infrastructure/deployment-guide.md) - पूर्ण CI/CD कार्यप्रवाहहरू
- [Azure Developer CLI दस्तावेज](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - पाइपलाइन कन्फिगरेसन

### 3. उत्पादन उत्तम अभ्यासहरू
- [तैनाथीकरण मार्गदर्शिका](../chapter-04-infrastructure/deployment-guide.md) - सुरक्षा, प्रदर्शन, र अनुगमन

### 4. थप टेम्प्लेटहरू अन्वेषण गर्नुहोस्
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## थप स्रोतहरू

### सिक्ने सामग्री
- [Azure Developer CLI दस्तावेज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर सेन्टर](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure अत्यन्त संरचित फ्रेमवर्क](https://learn.microsoft.com/en-us/azure/well-architected/)

### समुदाय र समर्थन
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer समुदाय](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### टेम्प्लेटहरू र उदाहरणहरू
- [सरकारी टेम्प्लेट ग्यालरी](https://azure.github.io/awesome-azd/)
- [समुदाय टेम्प्लेट योगदानहरू](https://github.com/Azure/awesome-azd)
- [Todo टेम्प्लेट स्रोत](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**तपाईंको पहिलो azd परियोजना पूरा गर्नुभएकोमा बधाई छ!** अब तपाईं Azure मा आत्मविश्वासका साथ अद्भुत अनुप्रयोगहरू निर्माण र तैनाथ गर्न तयार हुनुहुन्छ।

---

**अध्याय नेभिगेशन:**
- **📚 कोर्स होम**: [AZD नयाँ सुरु गर्नेका लागि](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 1 - आधार र छिटो सुरु
- **⬅️ अघिल्लो**: [इन्स्टलेशन र सेटअप](installation.md)
- **➡️ अर्को**: [आफ्नो एप ल्याउनुहोस्](bring-your-own-app.md)
- **🚀 अर्को अध्याय**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->