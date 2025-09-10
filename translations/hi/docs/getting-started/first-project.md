<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d0054b58dbf5baa786403593d848de4a",
  "translation_date": "2025-09-10T13:00:25+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "hi"
}
-->
# आपका पहला प्रोजेक्ट - हैंड्स-ऑन ट्यूटोरियल

## परिचय

आपका स्वागत है आपके पहले Azure Developer CLI प्रोजेक्ट में! यह व्यापक हैंड्स-ऑन ट्यूटोरियल आपको Azure पर azd का उपयोग करके एक फुल-स्टैक एप्लिकेशन बनाने, डिप्लॉय करने और प्रबंधित करने की पूरी प्रक्रिया सिखाएगा। आप एक वास्तविक टूडू एप्लिकेशन के साथ काम करेंगे जिसमें React फ्रंटएंड, Node.js API बैकएंड और MongoDB डेटाबेस शामिल है।

## सीखने के लक्ष्य

इस ट्यूटोरियल को पूरा करके, आप:
- टेम्पलेट्स का उपयोग करके azd प्रोजेक्ट इनिशियलाइज़ेशन वर्कफ़्लो में महारत हासिल करेंगे
- Azure Developer CLI प्रोजेक्ट संरचना और कॉन्फ़िगरेशन फ़ाइलों को समझेंगे
- Azure पर एप्लिकेशन को पूरी तरह से डिप्लॉय करने के साथ इंफ्रास्ट्रक्चर प्रोविज़निंग करेंगे
- एप्लिकेशन अपडेट और पुनः डिप्लॉयमेंट रणनीतियों को लागू करेंगे
- विकास और स्टेजिंग के लिए कई वातावरण प्रबंधित करेंगे
- संसाधन सफाई और लागत प्रबंधन प्रथाओं को अपनाएंगे

## सीखने के परिणाम

ट्यूटोरियल पूरा करने के बाद, आप सक्षम होंगे:
- टेम्पलेट्स से azd प्रोजेक्ट्स को स्वतंत्र रूप से इनिशियलाइज़ और कॉन्फ़िगर करना
- azd प्रोजेक्ट संरचनाओं को प्रभावी ढंग से नेविगेट और संशोधित करना
- सिंगल कमांड्स का उपयोग करके फुल-स्टैक एप्लिकेशन को Azure पर डिप्लॉय करना
- सामान्य डिप्लॉयमेंट समस्याओं और ऑथेंटिकेशन मुद्दों का समाधान करना
- विभिन्न डिप्लॉयमेंट चरणों के लिए कई Azure वातावरण प्रबंधित करना
- एप्लिकेशन अपडेट के लिए निरंतर डिप्लॉयमेंट वर्कफ़्लो लागू करना

## शुरुआत करें

### आवश्यकताओं की चेकलिस्ट
- ✅ Azure Developer CLI इंस्टॉल किया हुआ ([इंस्टॉलेशन गाइड](installation.md))
- ✅ Azure CLI इंस्टॉल और ऑथेंटिकेटेड
- ✅ आपके सिस्टम पर Git इंस्टॉल किया हुआ
- ✅ Node.js 16+ (इस ट्यूटोरियल के लिए)
- ✅ Visual Studio Code (अनुशंसित)

### अपनी सेटअप की पुष्टि करें
```bash
# Check azd installation
azd version
```
### Azure ऑथेंटिकेशन की पुष्टि करें

```bash
az account show
```

### Node.js संस्करण की जांच करें
```bash
node --version
```

## चरण 1: टेम्पलेट चुनें और इनिशियलाइज़ करें

चलो एक लोकप्रिय टूडू एप्लिकेशन टेम्पलेट से शुरू करते हैं जिसमें React फ्रंटएंड और Node.js API बैकएंड शामिल है।

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### अभी क्या हुआ?
- टेम्पलेट कोड को आपके लोकल डायरेक्टरी में डाउनलोड किया गया
- `azure.yaml` फ़ाइल बनाई गई जिसमें सर्विस डिफिनिशन हैं
- `infra/` डायरेक्टरी में इंफ्रास्ट्रक्चर कोड सेटअप किया गया
- एक वातावरण कॉन्फ़िगरेशन बनाया गया

## चरण 2: प्रोजेक्ट संरचना का अन्वेषण करें

चलो देखें कि azd ने हमारे लिए क्या बनाया है:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

आपको यह देखना चाहिए:
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

### समझने के लिए मुख्य फाइलें

**azure.yaml** - आपके azd प्रोजेक्ट का मुख्य भाग:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - इंफ्रास्ट्रक्चर डिफिनिशन:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## चरण 3: अपने प्रोजेक्ट को कस्टमाइज़ करें (वैकल्पिक)

डिप्लॉय करने से पहले, आप एप्लिकेशन को कस्टमाइज़ कर सकते हैं:

### फ्रंटएंड को संशोधित करें
```bash
# Open the React app component
code src/web/src/App.tsx
```

एक साधारण बदलाव करें:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### वातावरण वेरिएबल्स को कॉन्फ़िगर करें
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## चरण 4: Azure पर डिप्लॉय करें

अब सबसे रोमांचक हिस्सा - सब कुछ Azure पर डिप्लॉय करें!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### डिप्लॉयमेंट के दौरान क्या हो रहा है?

`azd up` कमांड निम्नलिखित चरणों को पूरा करता है:
1. **Provision** (`azd provision`) - Azure संसाधन बनाता है
2. **Package** - आपके एप्लिकेशन कोड को बिल्ड करता है
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

### अपने एप्लिकेशन तक पहुंचें
डिप्लॉयमेंट आउटपुट में दिए गए URL पर क्लिक करें, या इसे कभी भी प्राप्त करें:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### टूडू ऐप का परीक्षण करें
1. **टूडू आइटम जोड़ें** - "Add Todo" पर क्लिक करें और एक टास्क दर्ज करें
2. **पूर्ण के रूप में चिह्नित करें** - पूर्ण किए गए आइटम्स को चेक करें
3. **आइटम्स हटाएं** - जिन टूडू की आवश्यकता नहीं है उन्हें हटा दें

### अपने एप्लिकेशन की निगरानी करें
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## चरण 6: बदलाव करें और पुनः डिप्लॉय करें

चलो एक बदलाव करें और देखें कि अपडेट करना कितना आसान है:

### API को संशोधित करें
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

एक कस्टम रिस्पॉन्स हेडर जोड़ें:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### केवल कोड बदलाव डिप्लॉय करें
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## चरण 7: कई वातावरण प्रबंधित करें

प्रोडक्शन से पहले बदलावों का परीक्षण करने के लिए एक स्टेजिंग वातावरण बनाएं:

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

## चरण 8: संसाधनों को साफ करें

जब आप प्रयोग समाप्त कर लें, तो चल रहे शुल्क से बचने के लिए सफाई करें:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## आपने क्या सीखा

बधाई हो! आपने सफलतापूर्वक:
- टेम्पलेट से एक azd प्रोजेक्ट इनिशियलाइज़ किया
- प्रोजेक्ट संरचना और मुख्य फाइलों का अन्वेषण किया
- एक फुल-स्टैक एप्लिकेशन को Azure पर डिप्लॉय किया
- कोड बदलाव किए और पुनः डिप्लॉय किया
- कई वातावरण प्रबंधित किए
- संसाधनों को साफ किया

## सामान्य समस्याओं का समाधान

### ऑथेंटिकेशन त्रुटियां
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### डिप्लॉयमेंट विफलताएं
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### संसाधन नाम संघर्ष
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### पोर्ट/नेटवर्क समस्याएं
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## अगले कदम

अब जब आपने अपना पहला प्रोजेक्ट पूरा कर लिया है, इन उन्नत विषयों का अन्वेषण करें:

### 1. इंफ्रास्ट्रक्चर को कस्टमाइज़ करें
- [Infrastructure as Code](../deployment/provisioning.md)
- [डेटाबेस, स्टोरेज और अन्य सेवाएं जोड़ें](../deployment/provisioning.md#adding-services)

### 2. CI/CD सेटअप करें
- [GitHub Actions Integration](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. प्रोडक्शन के लिए सर्वोत्तम प्रथाएं
- [सुरक्षा कॉन्फ़िगरेशन](../deployment/best-practices.md#security)
- [प्रदर्शन अनुकूलन](../deployment/best-practices.md#performance)
- [मॉनिटरिंग और लॉगिंग](../deployment/best-practices.md#monitoring)

### 4. अधिक टेम्पलेट्स का अन्वेषण करें
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## अतिरिक्त संसाधन

### सीखने की सामग्री
- [Azure Developer CLI दस्तावेज़](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर सेंटर](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### समुदाय और समर्थन
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### टेम्पलेट्स और उदाहरण
- [आधिकारिक टेम्पलेट गैलरी](https://azure.github.io/awesome-azd/)
- [समुदाय टेम्पलेट्स](https://github.com/Azure-Samples/azd-templates)
- [एंटरप्राइज पैटर्न](https://github.com/Azure/azure-dev/tree/main/templates)

---

**बधाई हो, आपने अपना पहला azd प्रोजेक्ट पूरा कर लिया है!** अब आप आत्मविश्वास के साथ Azure पर अद्भुत एप्लिकेशन बनाने और डिप्लॉय करने के लिए तैयार हैं।

---

**नेविगेशन**
- **पिछला पाठ**: [कॉन्फ़िगरेशन](configuration.md)
- **अगला पाठ**: [डिप्लॉयमेंट गाइड](../deployment/deployment-guide.md)

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।