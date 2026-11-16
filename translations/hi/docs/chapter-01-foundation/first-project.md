# आपका पहला प्रोजेक्ट - व्यावहारिक ट्यूटोरियल

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 1 - आधार और त्वरित प्रारंभ
- **⬅️ पिछला**: [इंस्टॉलेशन और सेटअप](installation.md)
- **➡️ अगला**: [अपना स्वयं का ऐप लाएं](bring-your-own-app.md)
- **🚀 अगला अध्याय**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

आपका पहला Azure Developer CLI प्रोजेक्ट में आपका स्वागत है! आप एक todo एप्लिकेशन परिनियोजित करेंगे जिसमें React फ्रंटेंड, Node.js API, और Azure Cosmos DB होगा। टेम्पलेट में ऐतिहासिक नाम `todo-nodejs-mongo` है; इसका वर्तमान इन्फ्रास्ट्रक्चर Cosmos DB का उपयोग NoSQL के लिए करता है, इसलिए डाउनलोड किए गए README और `infra/` को देखें न कि नाम से डेटाबेस API की कल्पना करें।

> नवंबर 2026 में `azd 1.37.2` और सार्वजनिक टेम्पलेट के खिलाफ समीक्षा की गई। नीचे के उदाहरण Bash का उपयोग करते हैं; JSON निकासी के लिए `jq` भी आवश्यक है। Azure परिनियोजन में शुल्क लगते हैं और इस समीक्षा के दौरान निष्पादित नहीं किए गए थे।

## सीखने के उद्देश्य

इस ट्यूटोरियल को पूरा करके, आप:
- टेम्पलेट्स का उपयोग करके azd प्रोजेक्ट इनिशियलाइज़ेशन कार्यप्रवाह में महारत हासिल करेंगे
- Azure Developer CLI प्रोजेक्ट संरचना और कॉन्फ़िगरेशन फ़ाइलों को समझेंगे
- इन्फ्रास्ट्रक्चर प्रोविजनिंग के साथ Azure पर पूर्ण एप्लिकेशन डिप्लॉयमेंट करेंगे
- एप्लिकेशन अपडेट और पुनःपरिनियोजन रणनीतियाँ लागू करेंगे
- विकास और स्टेजिंग के लिए कई पर्यावरणों का प्रबंधन करेंगे
- संसाधन क्लीनअप और लागत प्रबंधन अभ्यास लागू करेंगे

## सीखने के परिणाम

पूरा करने पर, आप सक्षम होंगे:
- स्वतंत्र रूप से टेम्पलेट्स से azd प्रोजेक्ट्स को इनिशियलाइज़ और कॉन्फ़िगर करना
- azd प्रोजेक्ट संरचनाओं को प्रभावी ढंग से नेविगेट और संशोधित करना
- एकल कमांड का उपयोग करके Azure पर पूर्ण-स्टैक एप्लिकेशन तैनात करना
- सामान्य डिप्लॉयमेंट मुद्दों और प्रमाणीकरण समस्याओं का निवारण करना
- विभिन्न डिप्लॉयमेंट चरणों के लिए कई Azure पर्यावरणों का प्रबंधन करना
- एप्लिकेशन अपडेट के लिए सतत परिनियोजन कार्यप्रवाहों को लागू करना

## शुरुआत करना

### आवश्यकताओं की जांच सूची
- ✅ Azure Developer CLI स्थापित ([इंस्टॉलेशन गाइड](installation.md))
- ✅ `azd auth login` के साथ AZD प्रमाणीकरण पूरा किया गया
- ✅ आपके सिस्टम पर Git स्थापित है
- ✅ Node.js 22 LTS (या डाउनलोड किए गए टेम्पलेट द्वारा आवश्यक समर्थित संस्करण)
- ✅ Visual Studio Code (अनुशंसित)

आगे बढ़ने से पहले, रिपोजिटरी रूट से सेटअप वैलिडेटर चलाएँ:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### अपने सेटअप को सत्यापित करें
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### वैकल्पिक Azure CLI प्रमाणीकरण सत्यापित करें

```bash
az account show
```

### Node.js संस्करण जाँचें
```bash
node --version
```

## चरण 1: एक टेम्पलेट चुनें और इनिशियलाइज़ करें

चलिए एक लोकप्रिय todo एप्लिकेशन टेम्पलेट से शुरू करते हैं जिसमें React फ्रंटेंड और Node.js API बैकेंड शामिल है।

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

### क्या हुआ अभी?
- आपके लोकल डायरेक्टरी में टेम्पलेट कोड डाउनलोड हुआ
- सेवा परिभाषाओं के साथ एक `azure.yaml` फ़ाइल बनाई गई
- `infra/` डायरेक्टरी में इन्फ्रास्ट्रक्चर कोड सेटअप किया गया
- एक पर्यावरण कॉन्फ़िगरेशन बनाई गई

## चरण 2: प्रोजेक्ट संरचना को एक्सप्लोर करें

चलिए देखते हैं कि azd ने हमारे लिए क्या बनाया है:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

आप देखेंगे:
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

### समझने के लिए प्रमुख फ़ाइलें

**azure.yaml** - आपके azd प्रोजेक्ट का दिल:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - इन्फ्रास्ट्रक्चर परिभाषा:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## चरण 3: अपने प्रोजेक्ट को अनुकूलित करें (वैकल्पिक)

परिनियोजन से पहले, आप एप्लिकेशन को कस्टमाइज़ कर सकते हैं:

### फ्रंटेंड संशोधित करें
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

एक सरल बदलाव करें:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### पर्यावरण चर कॉन्फ़िगर करें
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

ये दो कस्टम मान केवल लोकल स्टोरेज दिखाते हैं। स्टॉक टेम्पलेट `WEBSITE_TITLE` या `API_VERSION` का उपयोग नहीं करता, इसलिए वे ऐप को नहीं बदलते। ऊपर स्पष्ट सोर्स संपादन प्रदर्शित शीर्षक को बदलता है।

## चरण 4: Azure पर परिनियोजित करें

अब रोमांचक भाग - सब कुछ Azure पर तैनात करें!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### परिनियोजन के दौरान क्या हो रहा है?

कार्यप्रवाह इन्फ्रास्ट्रक्चर प्रोविजन करता है और कोड को पैकेज/परिनियोजित करता है। सटीक क्रम को `workflows.up` के माध्यम से अनुकूलित किया जा सकता है जो `azure.yaml` में है; इस टेम्पलेट में provision के बाद deploy निर्दिष्ट है। प्रत्येक टेम्पलेट के लिए एक सार्वभौमिक चरण क्रम पर भरोसा न करें।

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

### अपने एप्लिकेशन तक पहुंचें
परिनियोजन आउटपुट में दी गई URL पर क्लिक करें, या कभी भी प्राप्त करें:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Todo ऐप का परीक्षण करें
1. **todo आइटम जोड़ें** - "Add Todo" पर क्लिक करें और कोई कार्य दर्ज करें
2. **पूर्ण के रूप में चिह्नित करें** - पूर्ण किए गए आइटम्स चेक करें
3. **आइटम हटाएं** - जिन्हें आपको अब जरूरत नहीं है उन्हें हटाएं

### अपने एप्लिकेशन की निगरानी करें
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ अपने परिनियोजन को सत्यापित करें

आगे बढ़ने से पहले, इस त्वरित जांच सूची को पूरा करें ताकि सुनिश्चित हो सके कि सब कुछ सही काम करता है—केवल "deploy सफल" होने का मतलब "app काम करता है" नहीं है:

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

**परिनियोजन सत्यापित होता है जब:**
- ✅ `azd show` एक पहुंच योग्य endpoint URL सूचीबद्ध करता है
- ✅ URL आपके ब्राउज़र में बिना त्रुटि के खुलता है
- ✅ मुख्य फीचर काम करते हैं (todo जोड़ें / पूरा करें / हटाएं)
- ✅ `azd monitor --logs` अनुरोधों को बिना अप्रत्याशित त्रुटि के दिखाता है

यदि कोई भी जांच विफल होती है, तो [अध्याय 7: समस्या निवारण](../chapter-07-troubleshooting/README.md) पर जाएँ।

## चरण 6: बदलाव करें और पुनःपरिनियोजित करें

आइए एक बदलाव करें और देखें कि अपडेट करना कितना आसान है:

### API संशोधित करें
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

एक कस्टम प्रतिक्रिया हेडर जोड़ें:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### केवल कोड परिवर्तन परिनियोजित करें
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## चरण 7: कई पर्यावरणों का प्रबंधन करें

उत्पादन से पहले बदलावों का परीक्षण करने के लिए एक स्टेजिंग पर्यावरण बनाएं:

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

### पर्यावरण तुलना
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## चरण 8: संसाधनों की सफाई करें

जब आप प्रयोग करना समाप्त कर लें, तो चल रही लागत से बचने के लिए साफ करें:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## क्लासिक ऐप बनाम AI-संचालित ऐप: एक समान कार्यप्रवाह

आपने अभी एक पारंपरिक वेब एप्लिकेशन तैनात किया है। लेकिन अगर आप AI-संचालित ऐप तैनात करना चाहते थे—जैसे Microsoft Foundry Models द्वारा समर्थित चैट एप्लिकेशन?

अच्छी खबर: **वर्कफ़्लो समान है।**

| चरण | क्लासिक Todo ऐप | AI चैट ऐप |
|------|-----------------|-------------|
| इनिशियलाइज़ (खाली डायरेक्टरी) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| प्रमाणीकरण | `azd auth login` | `azd auth login` |
| तैनाती | `azd up` | `azd up` |
| निगरानी | `azd monitor` | `azd monitor` |
| सफाई | `azd down --force --purge` | `azd down --force --purge` |

जीवनचक्र कमांड समान हैं, लेकिन आवश्यकताएं भिन्न हैं। एक AI टेम्पलेट को मॉडल एक्सेस, क्षेत्रीय कोटा, डेटा इनटेक, और अतिरिक्त कॉन्फ़िगरेशन की आवश्यकता हो सकती है। परिनियोजन से पहले इसका README पढ़ें; `azd up` अनुपस्थित अनुमतियाँ या कोटा प्रदान नहीं कर सकता।

यह azd का मूल सिद्धांत है: **एक कार्यप्रवाह, कोई भी कार्यभार।** इस ट्यूटोरियल में आपने जो कौशल अभ्यास किया — इनिशियलाइज़ करना, तैनात करना, निगरानी करना, पुनःतैनात करना, और साफ़ करना — AI एप्लिकेशन और एजेंट पर समान रूप से लागू होता है।

---

## आपने क्या सीखा है

बधाई हो! आपने सफलतापूर्वक:
- ✅ टेम्पलेट से azd प्रोजेक्ट को इनिशियलाइज़ किया
- ✅ प्रोजेक्ट संरचना और प्रमुख फ़ाइलों का अन्वेषण किया
- ✅ Azure पर एक पूर्ण-स्टैक एप्लिकेशन तैनात किया
- ✅ कोड परिवर्तन किए और पुनःतैनात किया
- ✅ कई पर्यावरणों का प्रबंधन किया
- ✅ संसाधनों की सफाई की

## 🎯 कौशल सत्यापन अभ्यास

### अभ्यास 1: अलग टेम्पलेट तैनात करें (15 मिनट)
**लक्ष्य**: azd init और तैनाती कार्यप्रवाह में महारत दिखाएं

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

**सफलता मापदंड:**
- [ ] एप्लिकेशन त्रुटि के बिना तैनात होता है
- [ ] ब्राउज़र में एप्लिकेशन URL तक पहुंच सकता है
- [ ] एप्लिकेशन सही ढंग से काम करता है (todo जोड़ें/हटाएं)
- [ ] सफलतापूर्वक सभी संसाधनों को साफ़ किया गया

### अभ्यास 2: कॉन्फ़िगरेशन अनुकूलित करें (20 मिनट)
**लक्ष्य**: लोकल पर्यावरण मान भंडारण का अभ्यास करें बिना इसे रनटाइम कॉन्फ़िगरेशन समझे

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

**सफलता मापदंड:**
- [ ] कस्टम पर्यावरण सफलतापूर्वक बनाया गया
- [ ] पर्यावरण चर सेट और पुनर्प्राप्त किए गए
- [ ] `azd env get-value APP_TITLE` `My Custom Todo App` प्रिंट करता है
- [ ] समझा सकता है कि ये मान स्टॉक ऐप को तब तक नहीं बदलते जब तक कोड/इन्फ्रास्ट्रक्चर उन्हें उपभोग न करे

### अभ्यास 3: बहु-पर्यावरण कार्यप्रवाह (25 मिनट)
**लक्ष्य**: पर्यावरण प्रबंधन और तैनाती रणनीतियों में महारत प्राप्त करें

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

**सफलता मापदंड:**
- [ ] अलग-अलग कॉन्फ़िगरेशन के साथ दो पर्यावरण बनाए गए
- [ ] दोनों पर्यावरण सफलतापूर्वक तैनात किए गए
- [ ] `azd env select` का उपयोग करके पर्यावरणों के बीच स्विच किया जा सकता है
- [ ] पर्यावरण चर पर्यावरणों के बीच भिन्न होते हैं
- [ ] दोनों पर्यावरण सफलतापूर्वक साफ हुए

## 📊 आपकी प्रगति

**लगाया गया समय**: ~60-90 मिनट  
**प्राप्त कौशल**:
- ✅ टेम्पलेट-आधारित प्रोजेक्ट इनिशियलाइज़ेशन
- ✅ Azure संसाधन प्रोविजनिंग
- ✅ एप्लिकेशन परिनियोजन कार्यप्रवाह
- ✅ पर्यावरण प्रबंधन
- ✅ कॉन्फ़िगरेशन प्रबंधन
- ✅ संसाधन क्लीनअप और लागत प्रबंधन

**अगला स्तर**: आप [कॉन्फ़िगरेशन गाइड](../chapter-03-configuration/configuration.md) के लिए तैयार हैं, जहां आप उन्नत कॉन्फ़िगरेशन पैटर्न सीखेंगे!

## सामान्य समस्याओं का निवारण

### प्रमाणीकरण त्रुटियाँ
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### तैनाती विफलताएँ
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### संसाधन नाम संघर्ष
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### पोर्ट/नेटवर्क समस्याएँ
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## अगले कदम

अब जब आप अपना पहला प्रोजेक्ट पूरा कर चुके हैं, तो इन उन्नत विषयों का अन्वेषण करें:

### 1. इन्फ्रास्ट्रक्चर कस्टमाइज़ करें
- [इन्फ्रास्ट्रक्चर ऐज़ कोड](../chapter-04-infrastructure/provisioning.md)
- [डाटाबेस इन्फ्रास्ट्रक्चर जोड़ें](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. CI/CD सेटअप करें
- [तैनाती गाइड](../chapter-04-infrastructure/deployment-guide.md) - पूर्ण CI/CD वर्कफ़्लो
- [Azure Developer CLI दस्तावेज़](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - पाइपलाइन कॉन्फ़िगरेशन

### 3. उत्पादन सर्वोत्तम अभ्यास
- [तैनाती गाइड](../chapter-04-infrastructure/deployment-guide.md) - सुरक्षा, प्रदर्शन और निगरानी

### 4. और अधिक टेम्पलेट्स एक्सप्लोर करें
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

## अतिरिक्त संसाधन

### सीखने की सामग्री
- [Azure Developer CLI दस्तावेज़](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर सेंटर](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure वेल-आर्किटेक्टेड फ्रेमवर्क](https://learn.microsoft.com/en-us/azure/well-architected/)

### समुदाय और समर्थन
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### टेम्पलेट्स और उदाहरण
- [आधिकारिक टेम्पलेट गैलरी](https://azure.github.io/awesome-azd/)
- [समुदाय टेम्पलेट योगदान](https://github.com/Azure/awesome-azd)
- [Todo टेम्पलेट स्रोत](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**आपके पहले azd प्रोजेक्ट को पूरा करने के लिए बधाई!** अब आप Azure पर अद्भुत एप्लिकेशन बनाने और तैनात करने के लिए तैयार हैं।

---

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 1 - आधार और त्वरित प्रारंभ
- **⬅️ पिछला**: [इंस्टॉलेशन और सेटअप](installation.md)
- **➡️ अगला**: [अपना स्वयं का ऐप लाएं](bring-your-own-app.md)
- **🚀 अगला अध्याय**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->