<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d0054b58dbf5baa786403593d848de4a",
  "translation_date": "2025-09-10T13:03:08+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "mr"
}
-->
# तुमचा पहिला प्रकल्प - हाताळण्याचा ट्यूटोरियल

## परिचय

तुमच्या पहिल्या Azure Developer CLI प्रकल्पात स्वागत आहे! हा सविस्तर ट्यूटोरियल तुम्हाला azd वापरून Azure वर पूर्ण-स्टॅक अॅप्लिकेशन तयार करणे, तैनात करणे आणि व्यवस्थापित करण्याची संपूर्ण प्रक्रिया शिकवतो. तुम्ही React फ्रंटएंड, Node.js API बॅकएंड आणि MongoDB डेटाबेस असलेल्या एका वास्तविक टूडू अॅप्लिकेशनवर काम कराल.

## शिकण्याची उद्दिष्टे

हा ट्यूटोरियल पूर्ण करून तुम्ही:
- टेम्पलेट्स वापरून azd प्रकल्प प्रारंभ करण्याची प्रक्रिया आत्मसात कराल
- Azure Developer CLI प्रकल्प संरचना आणि कॉन्फिगरेशन फाइल्स समजून घ्याल
- Azure वर संपूर्ण अॅप्लिकेशन तैनात करण्याची प्रक्रिया पार पाडाल, ज्यामध्ये इन्फ्रास्ट्रक्चर तयार करणे समाविष्ट आहे
- अॅप्लिकेशन अपडेट्स आणि पुन्हा तैनात करण्याच्या रणनीती अंमलात आणाल
- विकास आणि स्टेजिंगसाठी अनेक वातावरण व्यवस्थापित कराल
- संसाधन साफसफाई आणि खर्च व्यवस्थापन पद्धती लागू कराल

## शिकण्याचे परिणाम

ट्यूटोरियल पूर्ण केल्यानंतर तुम्ही:
- टेम्पलेट्स वापरून azd प्रकल्प स्वतंत्रपणे प्रारंभ आणि कॉन्फिगर करू शकाल
- azd प्रकल्प संरचना प्रभावीपणे नेव्हिगेट आणि बदलू शकाल
- एकाच कमांडने Azure वर पूर्ण-स्टॅक अॅप्लिकेशन तैनात करू शकाल
- सामान्य तैनात समस्या आणि प्रमाणीकरण अडचणी सोडवू शकाल
- विविध तैनात टप्प्यांसाठी अनेक Azure वातावरण व्यवस्थापित करू शकाल
- अॅप्लिकेशन अपडेट्ससाठी सतत तैनात वर्कफ्लो अंमलात आणू शकाल

## सुरुवात करा

### पूर्वतयारी तपासणी
- ✅ Azure Developer CLI स्थापित ([स्थापना मार्गदर्शक](installation.md))
- ✅ Azure CLI स्थापित आणि प्रमाणीकरण केलेले
- ✅ Git तुमच्या प्रणालीवर स्थापित
- ✅ Node.js 16+ (या ट्यूटोरियलसाठी)
- ✅ Visual Studio Code (शिफारस केलेले)

### तुमची सेटअप पडताळा
```bash
# Check azd installation
azd version
```
### Azure प्रमाणीकरण पडताळा

```bash
az account show
```

### Node.js आवृत्ती तपासा
```bash
node --version
```

## चरण 1: टेम्पलेट निवडा आणि प्रारंभ करा

React फ्रंटएंड आणि Node.js API बॅकएंड असलेल्या लोकप्रिय टूडू अॅप्लिकेशन टेम्पलेटसह सुरुवात करूया.

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

### काय घडले?
- टेम्पलेट कोड तुमच्या स्थानिक डिरेक्टरीमध्ये डाउनलोड केले
- `azure.yaml` फाइल तयार केली ज्यामध्ये सेवा परिभाषा आहेत
- `infra/` डिरेक्टरीमध्ये इन्फ्रास्ट्रक्चर कोड सेट केला
- वातावरण कॉन्फिगरेशन तयार केले

## चरण 2: प्रकल्प संरचना एक्सप्लोर करा

azd ने आपल्यासाठी काय तयार केले आहे ते पाहूया:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

तुम्हाला हे दिसेल:
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

### समजून घेण्यासाठी महत्त्वाच्या फाइल्स

**azure.yaml** - तुमच्या azd प्रकल्पाचा मुख्य भाग:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - इन्फ्रास्ट्रक्चर परिभाषा:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## चरण 3: तुमचा प्रकल्प सानुकूलित करा (ऐच्छिक)

तैनात करण्यापूर्वी तुम्ही अॅप्लिकेशन सानुकूलित करू शकता:

### फ्रंटएंड बदला
```bash
# Open the React app component
code src/web/src/App.tsx
```

एक साधा बदल करा:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### वातावरण व्हेरिएबल्स कॉन्फिगर करा
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## चरण 4: Azure वर तैनात करा

आता सर्वात रोमांचक भाग - सर्वकाही Azure वर तैनात करा!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### तैनात करताना काय घडते?

`azd up` कमांड खालील चरण पार पाडते:
1. **Provision** (`azd provision`) - Azure संसाधने तयार करते
2. **Package** - तुमच्या अॅप्लिकेशन कोडचे बिल्ड करते
3. **Deploy** (`azd deploy`) - कोड Azure संसाधनांवर तैनात करते

### अपेक्षित आउटपुट
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## चरण 5: तुमचे अॅप्लिकेशन तपासा

### तुमच्या अॅप्लिकेशनला प्रवेश करा
तैनात आउटपुटमध्ये दिलेल्या URL वर क्लिक करा किंवा कधीही मिळवा:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### टूडू अॅप तपासा
1. **टूडू आयटम जोडा** - "Add Todo" वर क्लिक करा आणि एक कार्य प्रविष्ट करा
2. **पूर्ण म्हणून चिन्हांकित करा** - पूर्ण झालेली आयटम्स चेक करा
3. **आयटम्स हटवा** - तुम्हाला नको असलेले टूडू हटवा

### तुमचे अॅप्लिकेशन मॉनिटर करा
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## चरण 6: बदल करा आणि पुन्हा तैनात करा

चला एक बदल करूया आणि अपडेट करणे किती सोपे आहे ते पाहूया:

### API बदला
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

एक कस्टम प्रतिसाद हेडर जोडा:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### फक्त कोड बदल तैनात करा
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## चरण 7: अनेक वातावरण व्यवस्थापित करा

उत्पादनापूर्वी बदल तपासण्यासाठी एक स्टेजिंग वातावरण तयार करा:

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

## चरण 8: संसाधने साफ करा

प्रयोग पूर्ण झाल्यावर, चालू असलेल्या शुल्कांपासून बचाव करण्यासाठी साफ करा:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## तुम्ही काय शिकलात

अभिनंदन! तुम्ही यशस्वीरित्या:
- टेम्पलेटमधून azd प्रकल्प प्रारंभ केला
- प्रकल्प संरचना आणि महत्त्वाच्या फाइल्स एक्सप्लोर केल्या
- Azure वर पूर्ण-स्टॅक अॅप्लिकेशन तैनात केले
- कोड बदल केले आणि पुन्हा तैनात केले
- अनेक वातावरण व्यवस्थापित केली
- संसाधने साफ केली

## सामान्य समस्या सोडवणे

### प्रमाणीकरण त्रुटी
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### तैनात अपयश
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
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

## पुढील चरण

तुमचा पहिला प्रकल्प पूर्ण केल्यानंतर, या प्रगत विषयांचा अभ्यास करा:

### 1. इन्फ्रास्ट्रक्चर सानुकूलित करा
- [Infrastructure as Code](../deployment/provisioning.md)
- [डेटाबेस, स्टोरेज आणि इतर सेवा जोडा](../deployment/provisioning.md#adding-services)

### 2. CI/CD सेट करा
- [GitHub Actions Integration](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. उत्पादन सर्वोत्तम पद्धती
- [सुरक्षा कॉन्फिगरेशन](../deployment/best-practices.md#security)
- [कामगिरी ऑप्टिमायझेशन](../deployment/best-practices.md#performance)
- [मॉनिटरिंग आणि लॉगिंग](../deployment/best-practices.md#monitoring)

### 4. अधिक टेम्पलेट्स एक्सप्लोर करा
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

## अतिरिक्त संसाधने

### शिकण्याची सामग्री
- [Azure Developer CLI दस्तऐवज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर सेंटर](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### समुदाय आणि समर्थन
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### टेम्पलेट्स आणि उदाहरणे
- [अधिकृत टेम्पलेट गॅलरी](https://azure.github.io/awesome-azd/)
- [समुदाय टेम्पलेट्स](https://github.com/Azure-Samples/azd-templates)
- [एंटरप्राइझ पॅटर्न्स](https://github.com/Azure/azure-dev/tree/main/templates)

---

**तुमचा पहिला azd प्रकल्प पूर्ण केल्याबद्दल अभिनंदन!** तुम्ही आता आत्मविश्वासाने Azure वर अद्भुत अॅप्लिकेशन्स तयार आणि तैनात करण्यास तयार आहात.

---

**नेव्हिगेशन**
- **मागील धडा**: [कॉन्फिगरेशन](configuration.md)
- **पुढील धडा**: [तैनात मार्गदर्शक](../deployment/deployment-guide.md)

---

**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपया लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेचा अभाव असू शकतो. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून निर्माण होणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.