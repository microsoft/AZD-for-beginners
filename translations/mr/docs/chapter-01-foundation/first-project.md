# तुमचा पहिला प्रकल्प - हाताने शिकण्याचे धडे

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स मुख्यपृष्ठ**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 1 - पाया आणि जलद प्रारंभ
- **⬅️ मागील**: [इंस्टॉलेशन आणि सेटअप](installation.md)
- **➡️ पुढील**: [आपले स्वतःचे ऍप आणा](bring-your-own-app.md)
- **🚀 पुढील अध्याय**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

तुमच्या पहिल्या Azure Developer CLI प्रकल्पात आपले स्वागत आहे! तुम्ही React फ्रंटएंड, Node.js API आणि Azure Cosmos DB सह एक todo ॲप्लिकेशन डिप्लॉय कराल. टेम्प्लेटने ऐतिहासिक नाव `todo-nodejs-mongo` जतन केले आहे; त्याचा सध्याचा पायाभूत सुविधा Cosmos DB साठी आहे जो NoSQL आहे, त्यामुळे डाउनलोड केलेल्या README आणि `infra/` नी तपासा आणि डेटाबेस API नावावरून विचार करू नका.

> नोव्हेंबर 2026 मध्ये `azd 1.37.2` आणि सार्वजनिक टेम्प्लेटच्या विरुध्द पुनरावलोकन केलेले. खालील उदाहरणे Bash वापरतात; JSON काढण्यासाठी `jq` देखील आवश्यक आहे. Azure डिप्लॉयमेंट्ससाठी शुल्क आकारले जाते आणि या पुनरावलोकनादरम्यान अंमलात आणले गेले नाहीत.

## शिकण्याचे उद्दिष्टे

या ट्युटोरियल पूर्ण करून, आपण:
- टेम्प्लेट वापरून azd प्रोजेक्ट इनिशियलायझेशन प्रक्रियेत प्राविण्य मिळवाल
- Azure Developer CLI प्रोजेक्ट रचना आणि संरचना फाइल्स समजून घ्याल
- पायाभूत सुविधा तयार करत Azure वर संपूर्ण ॲप्लिकेशन डिप्लॉयमेंट करा
- ॲप्लिकेशन अपडेट्स आणि पुन्हा डिप्लॉयमेंट धोरणांची अंमलबजावणी करा
- विकास आणि स्टेजिंगसाठी एकाधिक वातावरण व्यवस्थापित करा
- संसाधन स्वच्छता आणि खर्च व्यवस्थापनाच्या पद्धती लागू करा

## शिकण्याचे परिणाम

पूर्ण केल्यानंतर, आपण सक्षम असाल:
- स्वतंत्रपणे टेम्प्लेट्सवरून azd प्रोजेक्ट्स इनिशियलायझ आणि कन्फिगर करण्यासाठी
- प्रभावीपणे azd प्रोजेक्ट रचना नेव्हिगेट आणि सुधारणा करण्यासाठी
- पूर्ण स्टॅक ॲप्लिकेशन्स Azure वर एकाच आज्ञा वापरून डिप्लॉय करण्यासाठी
- सामान्य डिप्लॉयमेंट समस्या आणि प्रमाणीकृत समस्या निराकरण करण्यासाठी
- वेगवेगळ्या डिप्लॉयमेंट टप्प्यांसाठी एकाधिक Azure वातावरण व्यवस्थापित करण्यासाठी
- ॲप्लिकेशन अपडेट्ससाठी सतत डिप्लॉयमेंट वर्कफ्लोज अमलात आणण्यासाठी

## सुरूवात कशी कराल

### पूर्व अटी तपासणी यादी
- ✅ Azure Developer CLI स्थापित ([इंस्टॉलेशन गाइड](installation.md))
- ✅ AZD प्रमाणीकृत झालेले आहे `azd auth login` सह
- ✅ तुमच्या सिस्टमवर Git स्थापित आहे
- ✅ Node.js 22 LTS (किंवा डाउनलोड केलेल्या टेम्प्लेटसाठी आवश्यक असलेले समर्थित संस्करण)
- ✅ Visual Studio Code (शिफारसीय)

पुढे जाण्यापूर्वी, रेपॉजिटरीच्या मूळ पासून सेटअप व्हॅलिडेटर चालवा:

**विंडोज:** `./validate-setup.ps1`

**मॅकोएस / लिनक्स:** `bash ./validate-setup.sh`

### तुमचा सेटअप तपासा
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### ऐच्छिक Azure CLI प्रमाणीकृत तपासा

```bash
az account show
```

### Node.js आवृत्ती तपासा
```bash
node --version
```

## टप्पा 1: टेम्प्लेट निवडा आणि प्रारंभ करा

आपण React फ्रंटएंड आणि Node.js API बॅकएंड असलेला एक लोकप्रिय todo ॲप्लिकेशन टेम्प्लेटसह सुरुवात करूया.

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

### काय घडले?
- टेम्प्लेट कोड तुमच्या स्थानिक डिरेक्टरीमध्ये डाउनलोड झाले
- सेवा व्याख्या सहित `azure.yaml` फाइल तयार केली
- `infra/` डिरेक्टरीमध्ये पायाभूत सुविधा कोड सेट अप केला
- एक वातावरण संरचना तयार केली

## टप्पा 2: प्रोजेक्ट रचना तपासा

आपण azd ने काय तयार केले ते पाहूया:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

तुम्हाला खालील दिसेल:
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

### समजून घेण्यासाठी मुख्य फाइल्स

**azure.yaml** - तुमच्या azd प्रोजेक्टचे हृदय:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - पायाभूत सुविधा व्याख्या:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## टप्पा 3: तुमचा प्रोजेक्ट सानुकूलित करा (ऐच्छिक)

डिप्लॉय करण्यापूर्वी, तुम्ही ॲप्लिकेशन सानुकूलित करू शकता:

### फ्रंटएंड बदल करा
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

एक सोपा बदल करा:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### वातावरणातील चल कन्फिगर करा
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

या दोन सानुकूल मूल्यांनी स्थानिक संग्रहण दाखवले आहे. स्टॉक टेम्प्लेट `WEBSITE_TITLE` किंवा `API_VERSION` वापरत नाही, त्यामुळे ते ॲप बदलेत नाहीत. वरील स्पष्ट स्रोत संपादनाने प्रदर्शित शीर्षक बदलले आहे.

## टप्पा 4: Azure वर डिप्लॉय करा

आता रोमांचक भाग - सर्व काही Azure वर डिप्लॉय करा!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### डिप्लॉयमेंट दरम्यान काय होते?

वर्कफ्लो पायाभूत सुविधा तयार करतो आणि कोड संकुचित/डिप्लॉय करतो. नेमके आदेश `workflows.up` ने `azure.yaml` मध्ये सानुकूल केला जाऊ शकतो; या टेम्प्लेटमध्ये provision नंतर deploy निश्चित केले आहे. प्रत्येक टेम्प्लेटसाठी सार्वत्रिक फेज आदेशावर अवलंबून राहू नका.

### अपेक्षित आउटपुट
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## टप्पा 5: तुमचे ॲप्लिकेशन तपासा

### तुमच्या ॲप्लिकेशनमध्ये प्रवेश करा
डिप्लॉयमेंट आउटपुटमध्ये दिलेल्या URL वर क्लिक करा किंवा कधीही मिळवा:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Todo ॲप तपासा
1. **एक todo आयटम जोडा** - "Add Todo" वर क्लिक करा आणि कार्य प्रविष्ट करा
2. **पूर्ण झाले असे मार्क करा** - पूर्ण केलेल्या आयटम्सवर टिक करा
3. **आयटम हटवा** - ज्या todo ची गरज नाही ती काढा

### तुमचे ॲप्लिकेशन मॉनिटर करा
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ तुमचे डिप्लॉयमेंट तपासा

पुढे जाण्याआधी, ही जलद तपासणी यादी पूर्ण करा जेणेकरून तुम्हाला खात्री होईल की सर्व काही योग्यरित्या कार्य करते — "deploy succeeded" म्हणजे "app works" अशी गृहित धरू नका:

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

**जर डिप्लॉयमेंट तपासणी केली गेली तर:**
- ✅ `azd show` पोहोचता येणारा एंडपॉइंट URL सूचीबद्ध आहे
- ✅ URL तुमच्या ब्राउझरमध्ये त्रुटीशिवाय उघडतो
- ✅ मुख्य वैशिष्ट्ये काम करतात (todo जोडा/पूर्ण करा/हटवा)
- ✅ `azd monitor --logs` विनंत्या येत असल्याचे दाखवते आणि अपवादात्मक त्रुटी नाहीत

कोणतीही तपासणी अयशस्वी झाल्यास, [अध्याय 7: समस्या सोडवणे](../chapter-07-troubleshooting/README.md) येथे जा.

## टप्पा 6: बदल करा आणि पुन्हा डिप्लॉय करा

आम्ही एक बदल करू आणि किती सोपे आहे ते पाहूया:

### API मध्ये बदल करा
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

एक सानुकूल प्रतिसाद हेडर जोडा:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### फक्त कोड बदल डिप्लॉय करा
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## टप्पा 7: एकाधिक वातावरण व्यवस्थापित करा

उत्पादनापूर्वी बदल तपासण्यासाठी स्टेजिंग वातावरण तयार करा:

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

## टप्पा 8: संसाधने स्वच्छ करा

प्रयोग पूर्ण झाल्यानंतर, चालू शुल्क टाळण्यासाठी साफसफाई करा:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## पारंपरिक ॲप विरुद्ध AI-संचालित ॲप: समान वर्कफ्लो

तुम्ही नुकताच पारंपरिक वेब ॲप्लिकेशन डिप्लॉय केले. पण जर तुम्हाला AI-संचालित ॲप डिप्लॉय करायचा असेल—उदाहरणार्थ, Microsoft Foundry मॉडेल्सवर आधारित चॅट ॲप्लिकेशन?

चांगली बातमी: **वर्कफ्लो समान आहे.**

| टप्पा | पारंपरिक Todo ॲप | AI चॅट ॲप |
|------|-----------------|-------------|
| प्रारंभ करा (रिक्त डायरेक्टरी) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| प्रमाणीकृत करा | `azd auth login` | `azd auth login` |
| डिप्लॉय करा | `azd up` | `azd up` |
| मॉनिटर करा | `azd monitor` | `azd monitor` |
| स्वच्छ करा | `azd down --force --purge` | `azd down --force --purge` |

जीवनचक्र आदेश समान आहेत, पण पूर्व अटी वेगळ्या आहेत. AI टेम्प्लेटला मॉडेल प्रवेश, प्रादेशिक कोटा, डेटा इनजेशन आणि अतिरिक्त कन्फिगरेशन आवश्यक असू शकते. डिप्लॉयमेंटपूर्वी त्याचा README वाचा; `azd up` हरवलेले परवानग्या किंवा कोटा पुरवू शकत नाही.

हे azd चे मुख्य तत्त्व आहे: **एक वर्कफ्लो, कोणतेही वर्कलोड.** या ट्युटोरियलमध्ये तुम्ही सरावलेले कौशल्ये — प्रारंभ करणे, डिप्लॉय करणे, मॉनिटर करणे, पुन्हा डिप्लॉय करणे, आणि साफसफाई करणे — ते AI ॲप्लिकेशन्स आणि एजंट्सवरही समानपणे लागू होतात.

---

## तुम्ही काय शिकलात

अभिनंदन! तुम्ही यशस्वीपणे:
- ✅ टेम्प्लेटवरून azd प्रोजेक्ट प्रारंभ केला
- ✅ प्रोजेक्ट रचना आणि मुख्य फाइल्स तपासल्या
- ✅ Azure वर पूर्ण स्टॅक ॲप्लिकेशन डिप्लॉय केले
- ✅ कोड बदल केले आणि पुन्हा डिप्लॉय केले
- ✅ एकाधिक वातावरण व्यवस्थापित केली
- ✅ संसाधने साफ केली

## 🎯 कौशल्ये पुष्टीकरणाचे व्यायाम

### व्यायाम 1: वेगळा टेम्प्लेट डिप्लॉय करा (15 मिनिटे)
**उद्दिष्ट**: azd init आणि डिप्लॉयमेंट वर्कफ्लोमध्ये प्रावीण्य दर्शवणे

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

**यशस्वी निकष:**
- [ ] ॲप्लिकेशन त्रुटीशिवाय डिप्लॉय होते
- [ ] ब्राउझरमध्ये ॲप्लिकेशन URL उपलब्ध
- [ ] ॲप्लिकेशन योग्य कार्य करते (todo जोडा/हटवा)
- [ ] सर्व संसाधने यशस्वीपणे साफ केली

### व्यायाम 2: कॉन्फिगरेशन सानुकूलित करा (20 मिनिटे)
**उद्दिष्ट**: स्थानिक वातावरण मूल्य संचयनाचा सराव करा, त्याला runtime कॉन्फिगरेशन समजून घेऊ नका

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

**यशस्वी निकष:**
- [ ] सानुकूल वातावरण यशस्वीरित्या तयार केले
- [ ] वातावरण चल सेट केले आणि पुनर्प्राप्त केले
- [ ] `azd env get-value APP_TITLE` छापतो `My Custom Todo App`
- [ ] तुम्ही स्पष्ट करू शकता की हे मूल्ये स्टॉक ॲप बदलेत नाहीत जोपर्यंत कोड/पायाभूत सुविधा त्यांचा वापर करत नाहीत

### व्यायाम 3: एकाधिक वातावरण वर्कफ्लो (25 मिनिटे)
**उद्दिष्ट**: वातावरण व्यवस्थापन आणि डिप्लॉयमेंट धोरणात प्रावीण्य प्राप्त करा

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

**यशस्वी निकष:**
- [ ] भिन्न संरचना असलेली दोन वातावरणे तयार केली
- [ ] दोन्ही वातावरण यशस्वीपणे डिप्लॉय केले
- [ ] `azd env select` वापरून वातावरणांमध्ये स्विच करू शकता
- [ ] वातावरण चल वेगवेगळे आहेत
- [ ] दोन्ही वातावरण साफ करण्यास यशस्वी

## 📊 तुमची प्रगती

**वेडा भर:** ~60-90 मिनिटे  
**शिकलेली कौशल्ये:**
- ✅ टेम्प्लेट-आधारित प्रोजेक्ट इनिशियलायझेशन
- ✅ Azure संसाधन पायाभूत सुविधा
- ✅ ॲप्लिकेशन डिप्लॉयमेंट वर्कफ्लोज
- ✅ वातावरण व्यवस्थापन
- ✅ कॉन्फिगरेशन व्यवस्थापन
- ✅ संसाधन साफसफाई आणि खर्च व्यवस्थापन

**पुढील टप्पा**: तुम्ही प्रगत कॉन्फिगरेशन नमुन्यासाठी [कॉन्फिगरेशन मार्गदर्शक](../chapter-03-configuration/configuration.md) साठी तयार आहात!

## सामान्य समस्या निवारण

### प्रमाणीकृत त्रुटी
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### डिप्लॉयमेंट अपयश
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### संसाधन नाव संघर्ष
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### पोर्ट/नेटवर्क समस्या
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## पुढील पावले

तुम्ही तुमचा पहिला प्रकल्प पूर्ण केलादा, आता या प्रगत विषयांचा अभ्यास करा:

### 1. पायाभूत सुविधा सानुकूलित करा
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [डेटाबेस पायाभूत सुविधा जोडा](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. CI/CD सेटअप करा
- [डिप्लॉयमेंट मार्गदर्शक](../chapter-04-infrastructure/deployment-guide.md) - पूर्ण CI/CD वर्कफ्लोज
- [Azure Developer CLI दस्तऐवज](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - पाईपलाइन कन्फिगरेशन

### 3. उत्पादनातील सर्वोत्तम पद्धती
- [डिप्लॉयमेंट मार्गदर्शक](../chapter-04-infrastructure/deployment-guide.md) - सुरक्षा, कार्यक्षमता आणि मॉनिटरिंग

### 4. अजून टेम्प्लेट्स पहा
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

## अतिरिक्त संसाधने

### शिकण्याचे साहित्य
- [Azure Developer CLI दस्तऐवज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर केंद्र](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure वेल-आर्किटेक्टेड फ्रेमवर्क](https://learn.microsoft.com/en-us/azure/well-architected/)

### समुदाय आणि समर्थन
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer समुदाय](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### टेम्प्लेट्स आणि उदाहरणे
- [अधिकृत टेम्प्लेट गॅलरी](https://azure.github.io/awesome-azd/)
- [समुदाय टेम्प्लेट योगदान](https://github.com/Azure/awesome-azd)
- [Todo टेम्प्लेट स्रोत](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**तुमचा पहिला azd प्रोजेक्ट पूर्ण केल्याबद्दल अभिनंदन!** तुम्ही आता आत्मविश्वासाने Azure वर अद्भुत ॲप्लिकेशन्स तयार करण्यासाठी आणि डिप्लॉय करण्यासाठी तयार आहात.

---

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स मुख्यपृष्ठ**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 1 - पाया आणि जलद प्रारंभ
- **⬅️ मागील**: [इंस्टॉलेशन आणि सेटअप](installation.md)
- **➡️ पुढील**: [आपले स्वतःचे ऍप आणा](bring-your-own-app.md)
- **🚀 पुढील अध्याय**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->