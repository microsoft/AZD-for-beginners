<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e131a5271d4c8eb0d44ae82302f8fd1a",
  "translation_date": "2025-09-12T18:57:33+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "ne"
}
-->
# तपाईंको पहिलो प्रोजेक्ट - व्यावहारिक ट्यूटोरियल

**अघिल्लो:** [कन्फिगरेसन](configuration.md) | **अर्को:** [Azure AI Foundry एकीकरण](../ai-foundry/azure-ai-foundry-integration.md)

## परिचय

Azure Developer CLI प्रोजेक्टमा तपाईंलाई स्वागत छ! यो विस्तृत व्यावहारिक ट्यूटोरियलले azd प्रयोग गरेर Azure मा पूर्ण-स्ट्याक एप्लिकेसन सिर्जना, डिप्लोय, र व्यवस्थापन गर्ने सम्पूर्ण प्रक्रिया देखाउँछ। तपाईं एक वास्तविक टु-डु एप्लिकेसनमा काम गर्नुहुनेछ जसमा React फ्रन्टएन्ड, Node.js API ब्याकएन्ड, र MongoDB डाटाबेस समावेश छ।

## सिक्ने लक्ष्यहरू

यो ट्यूटोरियल पूरा गरेर, तपाईं:
- टेम्प्लेटहरू प्रयोग गरेर azd प्रोजेक्ट इनिसियलाइजेसन वर्कफ्लोमा निपुण हुनुहुनेछ
- Azure Developer CLI प्रोजेक्ट संरचना र कन्फिगरेसन फाइलहरू बुझ्नुहुनेछ
- Azure मा एप्लिकेसन डिप्लोय गर्न र इन्फ्रास्ट्रक्चर प्रोभिजनिङ गर्न सक्षम हुनुहुनेछ
- एप्लिकेसन अपडेटहरू लागू गर्न र पुनःडिप्लोय रणनीतिहरू प्रयोग गर्न सिक्नुहुनेछ
- विकास र स्टेजिङका लागि बहु वातावरणहरू व्यवस्थापन गर्न सक्षम हुनुहुनेछ
- स्रोत सफाइ र लागत व्यवस्थापन अभ्यासहरू लागू गर्न जान्नुहुनेछ

## सिक्ने परिणामहरू

ट्यूटोरियल पूरा गरेपछि, तपाईं:
- स्वतन्त्र रूपमा टेम्प्लेटहरूबाट azd प्रोजेक्टहरू इनिसियलाइज र कन्फिगर गर्न सक्षम हुनुहुनेछ
- azd प्रोजेक्ट संरचनाहरू प्रभावकारी रूपमा नेभिगेट र परिमार्जन गर्न सक्नुहुनेछ
- एकल कमाण्डहरू प्रयोग गरेर Azure मा पूर्ण-स्ट्याक एप्लिकेसनहरू डिप्लोय गर्न सक्षम हुनुहुनेछ
- सामान्य डिप्लोयमेन्ट समस्याहरू र प्रमाणीकरण समस्याहरू समाधान गर्न जान्नुहुनेछ
- विभिन्न डिप्लोयमेन्ट चरणहरूको लागि बहु Azure वातावरणहरू व्यवस्थापन गर्न सक्षम हुनुहुनेछ
- एप्लिकेसन अपडेटहरूको लागि निरन्तर डिप्लोयमेन्ट वर्कफ्लोहरू लागू गर्न जान्नुहुनेछ

## सुरु गर्दै

### आवश्यकताहरूको चेकलिस्ट
- ✅ Azure Developer CLI स्थापना गरिएको ([स्थापनाको मार्गदर्शन](installation.md))
- ✅ Azure CLI स्थापना गरिएको र प्रमाणित गरिएको
- ✅ Git तपाईंको प्रणालीमा स्थापना गरिएको
- ✅ Node.js 16+ (यो ट्यूटोरियलका लागि)
- ✅ Visual Studio Code (सिफारिस गरिएको)

### तपाईंको सेटअप प्रमाणित गर्नुहोस्
```bash
# Check azd installation
azd version
```
### Azure प्रमाणीकरण प्रमाणित गर्नुहोस्

```bash
az account show
```

### Node.js संस्करण जाँच गर्नुहोस्
```bash
node --version
```

## चरण १: टेम्प्लेट चयन गर्नुहोस् र इनिसियलाइज गर्नुहोस्

React फ्रन्टएन्ड र Node.js API ब्याकएन्ड समावेश गर्ने लोकप्रिय टु-डु एप्लिकेसन टेम्प्लेटबाट सुरु गरौं।

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

### के भयो?
- टेम्प्लेट कोड तपाईंको स्थानीय डाइरेक्टरीमा डाउनलोड गरियो
- `azure.yaml` फाइल सिर्जना गरियो जसमा सेवा परिभाषाहरू छन्
- `infra/` डाइरेक्टरीमा इन्फ्रास्ट्रक्चर कोड सेटअप गरियो
- वातावरण कन्फिगरेसन सिर्जना गरियो

## चरण २: प्रोजेक्ट संरचना अन्वेषण गर्नुहोस्

azd ले हामीलाई के सिर्जना गर्‍यो भनेर जाँच गरौं:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

तपाईंले देख्नु पर्ने:
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

**azure.yaml** - तपाईंको azd प्रोजेक्टको मुख्य भाग:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - इन्फ्रास्ट्रक्चर परिभाषा:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## चरण ३: तपाईंको प्रोजेक्ट अनुकूलन गर्नुहोस् (वैकल्पिक)

डिप्लोय गर्नु अघि, तपाईं एप्लिकेसन अनुकूलन गर्न सक्नुहुन्छ:

### फ्रन्टएन्ड परिमार्जन गर्नुहोस्
```bash
# Open the React app component
code src/web/src/App.tsx
```

साधारण परिवर्तन गर्नुहोस्:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### वातावरण चरहरू कन्फिगर गर्नुहोस्
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## चरण ४: Azure मा डिप्लोय गर्नुहोस्

अब रोमाञ्चक भाग - सबै कुरा Azure मा डिप्लोय गर्नुहोस्!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### डिप्लोयमेन्टको क्रममा के भइरहेको छ?

`azd up` कमाण्डले यी चरणहरू पूरा गर्दछ:
1. **Provision** (`azd provision`) - Azure स्रोतहरू सिर्जना गर्दछ
2. **Package** - तपाईंको एप्लिकेसन कोड निर्माण गर्दछ
3. **Deploy** (`azd deploy`) - कोडलाई Azure स्रोतहरूमा डिप्लोय गर्दछ

### अपेक्षित आउटपुट
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## चरण ५: तपाईंको एप्लिकेसन परीक्षण गर्नुहोस्

### तपाईंको एप्लिकेसन पहुँच गर्नुहोस्
डिप्लोयमेन्ट आउटपुटमा प्रदान गरिएको URL मा क्लिक गर्नुहोस्, वा कुनै पनि समयमा प्राप्त गर्नुहोस्:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### टु-डु एप परीक्षण गर्नुहोस्
1. **टु-डु आइटम थप्नुहोस्** - "Add Todo" मा क्लिक गर्नुहोस् र कार्य प्रविष्ट गर्नुहोस्
2. **सम्पन्नको रूपमा चिन्ह लगाउनुहोस्** - पूरा भएका आइटमहरू टिक गर्नुहोस्
3. **आइटमहरू मेटाउनुहोस्** - अब आवश्यक नभएका टु-डुहरू हटाउनुहोस्

### तपाईंको एप्लिकेसन अनुगमन गर्नुहोस्
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## चरण ६: परिवर्तन गर्नुहोस् र पुनःडिप्लोय गर्नुहोस्

परिवर्तन गरौं र अपडेट गर्न कत्तिको सजिलो छ हेर्नुहोस्:

### API परिमार्जन गर्नुहोस्
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

कस्टम प्रतिक्रिया हेडर थप्नुहोस्:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### केवल कोड परिवर्तनहरू डिप्लोय गर्नुहोस्
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## चरण ७: बहु वातावरणहरू व्यवस्थापन गर्नुहोस्

उत्पादन अघि परिवर्तनहरू परीक्षण गर्न स्टेजिङ वातावरण सिर्जना गर्नुहोस्:

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

## चरण ८: स्रोतहरू सफा गर्नुहोस्

परीक्षण समाप्त भएपछि, निरन्तर शुल्कबाट बच्न स्रोतहरू सफा गर्नुहोस्:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## तपाईंले के सिक्नुभयो

बधाई छ! तपाईंले सफलतापूर्वक:
- टेम्प्लेटबाट azd प्रोजेक्ट इनिसियलाइज गर्नुभयो
- प्रोजेक्ट संरचना र मुख्य फाइलहरू अन्वेषण गर्नुभयो
- Azure मा पूर्ण-स्ट्याक एप्लिकेसन डिप्लोय गर्नुभयो
- कोड परिवर्तन गर्नुभयो र पुनःडिप्लोय गर्नुभयो
- बहु वातावरणहरू व्यवस्थापन गर्नुभयो
- स्रोतहरू सफा गर्नुभयो

## सामान्य समस्याहरू समाधान गर्ने

### प्रमाणीकरण त्रुटिहरू
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### डिप्लोयमेन्ट असफलता
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### स्रोत नाम द्वन्द्व
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

## अगाडि के गर्ने

अब तपाईंले आफ्नो पहिलो प्रोजेक्ट पूरा गर्नुभएको छ, यी उन्नत विषयहरू अन्वेषण गर्नुहोस्:

### १. इन्फ्रास्ट्रक्चर अनुकूलन गर्नुहोस्
- [कोडको रूपमा इन्फ्रास्ट्रक्चर](../deployment/provisioning.md)
- [डाटाबेसहरू, स्टोरेज, र अन्य सेवाहरू थप्नुहोस्](../deployment/provisioning.md#adding-services)

### २. CI/CD सेटअप गर्नुहोस्
- [GitHub Actions एकीकरण](../deployment/cicd-integration.md)
- [Azure DevOps पाइपलाइनहरू](../deployment/cicd-integration.md#azure-devops)

### ३. उत्पादनका लागि उत्तम अभ्यासहरू
- [सुरक्षा कन्फिगरेसनहरू](../deployment/best-practices.md#security)
- [प्रदर्शन अनुकूलन](../deployment/best-practices.md#performance)
- [अनुगमन र लगिङ](../deployment/best-practices.md#monitoring)

### ४. थप टेम्प्लेटहरू अन्वेषण गर्नुहोस्
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

## अतिरिक्त स्रोतहरू

### सिक्ने सामग्रीहरू
- [Azure Developer CLI डकुमेन्टेसन](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर केन्द्र](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure राम्रो-आर्किटेक्टेड फ्रेमवर्क](https://learn.microsoft.com/en-us/azure/well-architected/)

### समुदाय र समर्थन
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer समुदाय](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### टेम्प्लेटहरू र उदाहरणहरू
- [अधिकृत टेम्प्लेट ग्यालरी](https://azure.github.io/awesome-azd/)
- [समुदाय टेम्प्लेटहरू](https://github.com/Azure-Samples/azd-templates)
- [उद्यम ढाँचाहरू](https://github.com/Azure/azure-dev/tree/main/templates)

---

**तपाईंको पहिलो azd प्रोजेक्ट पूरा गर्नुभएकोमा बधाई छ!** अब तपाईं Azure मा उत्कृष्ट एप्लिकेसनहरू निर्माण र डिप्लोय गर्न आत्मविश्वासका साथ तयार हुनुहुन्छ।

---

**अघिल्लो:** [कन्फिगरेसन](configuration.md) | **अर्को:** [Azure AI Foundry एकीकरण](../ai-foundry/azure-ai-foundry-integration.md)
- **अर्को पाठ:** [डिप्लोयमेन्ट मार्गदर्शन](../deployment/deployment-guide.md)

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटि वा अशुद्धता हुन सक्छ। यसको मूल भाषा मा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।