# Your First Project - Hands-On Tutorial

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

आपल्या पहिल्या Azure Developer CLI प्रकल्पात आपले स्वागत आहे! हा समग्र हँड्स-ऑन ट्यूटोरियल azd वापरून Azure वर पूर्ण-स्टॅक अनुप्रयोग तयार करणे, तैनात करणे आणि व्यवस्थापित करण्याची संपूर्ण मार्गदर्शिका देते. आपण एक वास्तविक todo अनुप्रयोगावर काम कराल ज्यामध्ये React फ्रंटएंड, Node.js API बॅकएंड आणि MongoDB डेटाबेस समाविष्ट आहे.

## Learning Goals

या ट्यूटोरियलची पूर्णता केल्यानंतर आपण:
- टेम्पलेट्स वापरून azd प्रकल्प इनिशियलायझेशन वर्कफ्लोमध्ये पारंगत व्हाल
- Azure Developer CLI प्रकल्प रचना आणि कॉन्फिगरेशन फाइल्स समजून घ्याल
- इन्फ्रास्ट्रक्चर प्राव्हिजनिंगसह अनुप्रयोगाचे Azure वर पूर्ण तैनात करणे चालवू शकता
- अनुप्रयोग अपडेट्स आणि पुन्हा तैनाती धोरणे अमलात आणू शकता
- विकास आणि स्टेजिंगसाठी एकाधिक वातावरण व्यवस्थापित करू शकता
- संसाधन क्लीनअप आणि खर्च व्यवस्थापनाच्या पद्धती लागू करू शकता

## Learning Outcomes

पूर्ण केल्यावर, आपण सक्षम असाल:
- स्वावलंबीपणे टेम्पलेट्समधून azd प्रकल्प इनिशियलाइझ आणि कॉन्फिगर करणे
- azd प्रकल्प संरचना प्रभावीपणे नेव्हिगेट व बदलणे
- एकाच कमांडने Azure वर पूर्ण-स्टॅक अनुप्रयोग तैनात करणे
- सामान्य तैनाती समस्या आणि प्रमाणीकरण समस्यांचे निराकरण करणे
- वेगवेगळ्या तैनाती टप्प्यांसाठी अनेक Azure वातावरणे व्यवस्थापित करणे
- अनुप्रयोग अद्यतनांसाठी सतत तैनाती वर्कफ्लोज लागू करणे

## Getting Started

### Prerequisites Checklist
- ✅ Azure Developer CLI installed ([Installation Guide](installation.md))
- ✅ AZD authentication completed with `azd auth login`
- ✅ Git installed on your system
- ✅ Node.js 16+ (for this tutorial)
- ✅ Visual Studio Code (recommended)

सुरू करण्यापूर्वी, रिपॉझिटरी रूटमधून सेटअप व्हॅलिडेटर चालवा:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verify Your Setup
```bash
# azd ची स्थापना तपासा
azd version

# AZD चे प्रमाणीकरण तपासा
azd auth login --check-status
```

### Verify optional Azure CLI authentication

```bash
az account show
```

### Check Node.js version
```bash
node --version
```

## Step 1: Choose and Initialize a Template

चला एक लोकप्रिय todo अनुप्रयोग टेम्पलेट पासून सुरुवात करूया ज्यात React फ्रंटएंड आणि Node.js API बॅकएंड समाविष्ट आहे.

```bash
# उपलब्ध टेम्पलेट्स ब्राउझ करा
azd template list

# टूडू अॅप टेम्पलेट प्रारंभ करा
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# सूचनांचे पालन करा:
# - एक वातावरण नाव प्रविष्ट करा: "dev"
# - एक सदस्यता निवडा (जर तुमच्याकडे एकापेक्षा जास्त असतील)
# - एक प्रदेश निवडा: "East US 2" (किंवा तुमच्या पसंतीचा प्रदेश)
```

### What Just Happened?
- टेम्पलेट कोड आपल्या स्थानिक डिरेक्टरीमध्ये डाउनलोड केला गेला
- `azure.yaml` फाइल सेवा परिभाषांसह तयार केली गेली
- `infra/` डिरेक्टरीमध्ये इन्फ्रास्ट्रक्चर कोड सेट केला गेला
- एक वातावरण कॉन्फिगरेशन तयार केले गेले

## Step 2: Explore the Project Structure

चला पाहू काय azd ने आमच्यासाठी तयार केले आहे:

```bash
# प्रकल्पाची संरचना पहा
tree /f   # विंडोज
# किंवा
find . -type f | head -20   # मॅकओएस/लिनक्स
```

You should see:
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

### Key Files to Understand

**azure.yaml** - आपल्या azd प्रकल्पाचे हृदय:
```bash
# प्रकल्प विन्यास पहा
cat azure.yaml
```

**infra/main.bicep** - Infrastructure definition:
```bash
# इन्फ्रास्ट्रक्चरचा कोड पहा
head -30 infra/main.bicep
```

## Step 3: Customize Your Project (Optional)

तैनात करण्यापूर्वी, आपण अनुप्रयोग सानुकूलित करू शकता:

### Modify the Frontend
```bash
# React अॅप घटक उघडा
code src/web/src/App.tsx
```

एक साधा बदल करा:
```typescript
// शीर्षक शोधा आणि ते बदला
<h1>My Awesome Todo App</h1>
```

### Configure Environment Variables
```bash
# कस्टम पर्यावरणीय चळ सेट करा
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# सर्व पर्यावरणीय चळ पहा
azd env get-values
```

## Step 4: Deploy to Azure

आता रोमांचक भाग - सर्व काही Azure वर तैनात करा!

```bash
# पायाभूत संरचना आणि अनुप्रयोग तैनात करा
azd up

# हा आदेश हे करेल:
# 1. Azure संसाधने (App Service, Cosmos DB, इत्यादी) प्रदान करेल
# 2. तुमचा अनुप्रयोग तयार करेल
# 3. प्राव्हिजन केलेल्या संसाधनांवर तैनात करेल
# 4. अनुप्रयोगाचा URL दाखवेल
```

### What's Happening During Deployment?

`azd up` आदेश हे टप्पे पार पाडतो:
1. **Provision** (`azd provision`) - Azure संसाधने तयार करतो
2. **Package** - आपला अनुप्रयोग कोड बिल्ड करतो
3. **Deploy** (`azd deploy`) - कोड Azure संसाधनांवर तैनात करतो

### Expected Output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Step 5: Test Your Application

### Access Your Application
तैनाती आउटपुटमध्ये दिलेल्या URL वर क्लिक करा, किंवा कोणत्याही वेळी ते मिळवा:
```bash
# अॅप्लिकेशनचे एंडपॉइंट मिळवा
azd show

# आपल्या ब्राउझरमध्ये अॅप्लिकेशन उघडा
azd show --output json | jq -r '.services.web.endpoint'
```

### Test the Todo App
1. **Add a todo item** - "Add Todo" क्लिक करा आणि एक टास्क टाका
2. **Mark as complete** - पूर्ण झालेले आयटम चेक करा
3. **Delete items** - जे todo आपल्याला नको आहेत ते काढा

### Monitor Your Application
```bash
# आपल्या संसाधनांसाठी Azure पोर्टल उघडा
azd monitor

# अनुप्रयोग लॉग पहा
azd monitor --logs

# थेट मेट्रिक्स पहा
azd monitor --live
```

## Step 6: Make Changes and Redeploy

चला एक बदल करू आणि पहा किती सोपे आहे अद्यतन करणे:

### Modify the API
```bash
# API कोड संपादित करा
code src/api/src/routes/lists.js
```

एक सानुकूल प्रतिसाद हेडर जोडा:
```javascript
// रूट हँडलर शोधा आणि जोडा:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Deploy Just the Code Changes
```bash
# फक्त अनुप्रयोग कोड तैनात करा (इन्फ्रास्ट्रक्चर वगळा)
azd deploy

# इन्फ्रास्ट्रक्चर आधीच अस्तित्वात असल्यामुळे हे 'azd up' पेक्षा खूप जलद आहे
```

## Step 7: Manage Multiple Environments

उत्पादनापूर्वी बदल तपासण्यासाठी एक स्टेजिंग वातावरण तयार करा:

```bash
# नवीन स्टेजिंग वातावरण तयार करा
azd env new staging

# स्टेजिंगवर तैनात करा
azd up

# विकास वातावरणाकडे परत स्विच करा
azd env select dev

# सर्व वातावरणांची यादी करा
azd env list
```

### Environment Comparison
```bash
# विकास पर्यावरण पहा
azd env select dev
azd show

# स्टेजिंग पर्यावरण पहा
azd env select staging
azd show
```

## Step 8: Clean Up Resources

जेव्हा आपण प्रयोग करण्यास पूर्ण केला आहे, तर चालू शुल्क टाळण्यासाठी संसाधने साफ करा:

```bash
# सध्याच्या वातावरणासाठी सर्व Azure संसाधने हटवा
azd down

# पुष्टीशिवाय जबरदस्तीने हटवा आणि सॉफ्ट-डिलिट केलेली संसाधने कायम नष्ट करा
azd down --force --purge

# विशिष्ट वातावरण हटवा
azd env select staging
azd down --force --purge
```

## Classic App vs. AI-Powered App: Same Workflow

आपण नुकतेच पारंपारिक वेब अनुप्रयोग तैनात केला. परंतु जर आपण त्याऐवजी AI-समर्थित अ‍ॅप जसे की Microsoft Foundry Models ने समर्थित चॅट अनुप्रयोग तैनात करायचा विचार करत असाल तर काय?

चांगली बातमी: **वर्कफ्लो एकसारखा आहे.**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

एकमेव फरक म्हणजे आपण सुरू करणार त्या **टेम्पलेट** मध्ये आहे. AI टेम्पलेटमध्ये अतिरिक्त इन्फ्रास्ट्रक्चर समाविष्ट असू शकतो (उदा. Microsoft Foundry Models संसाधन किंवा AI Search निर्देशिका), परंतु azd हे सर्व आपल्यासाठी हाताळते. आपल्याला नवीन कमांड शिकण्याची किंवा वेगळे टूल स्वीकारण्याची गरज नाही, किंवा तैनातीबाबत आपला दृष्टिकोन बदलण्याची गरज नाही.

हेच azd चे मुख्य तत्त्व आहे: **एक वर्कफ्लो, कोणतेही वर्कलोड.** या ट्यूटोरियलमध्ये आपण सराव केलेल्या कौशल्यांना—इनिशियलाइझ करणे, तैनात करणे, मॉनिटर करणे, पुन्हा तैनात करणे आणि क्लीनअप—AI अनुप्रयोग आणि एजंट्ससाठी समानप्रकारे लागू केले जाऊ शकते.

---

## What You've Learned

अभिनंदन! आपण यशस्वीरित्या:
- ✅ टेम्पलेटमधून azd प्रकल्प इनिशियलाइझ केला
- ✅ प्रकल्प रचना आणि मुख्य फाइल्स एक्सप्लोर केल्या
- ✅ Azure वर पूर्ण-स्टॅक अनुप्रयोग तैनात केला
- ✅ कोड बदल केले आणि पुन्हा तैनात केले
- ✅ एकाधिक वातावरणे व्यवस्थापित केली
- ✅ संसाधने साफ केली

## 🎯 Skill Validation Exercises

### Exercise 1: Deploy a Different Template (15 minutes)
**Goal**: Demonstrate mastery of azd init and deployment workflow

```bash
# Python + MongoDB स्टॅक वापरून पहा
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# डिप्लॉयमेंटची पडताळणी करा
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# साफ करा
azd down --force --purge
```

**Success Criteria:**
- [ ] Application deploys without errors
- [ ] Can access application URL in browser
- [ ] Application functions correctly (add/remove todos)
- [ ] Successfully cleaned up all resources

### Exercise 2: Customize Configuration (20 minutes)
**Goal**: Practice environment variable configuration

```bash
cd my-first-azd-app

# सानुकूल पर्यावरण तयार करा
azd env new custom-config

# सानुकूल चल सेट करा
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# चल तपासा
azd env get-values | grep APP_TITLE

# सानुकूल कॉन्फिगसह तैनात करा
azd up
```

**Success Criteria:**
- [ ] Custom environment created successfully
- [ ] Environment variables set and retrievable
- [ ] Application deploys with custom configuration
- [ ] Can verify custom settings in deployed app

### Exercise 3: Multi-Environment Workflow (25 minutes)
**Goal**: Master environment management and deployment strategies

```bash
# डेव्हलपमेंट वातावरण तयार करा
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# डेव्हलपमेंट URL नोंद करा
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# स्टेजिंग वातावरण तयार करा
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# स्टेजिंग URL नोंद करा
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# वातावरणांची तुलना करा
azd env list

# दोन्ही वातावरणांची चाचणी करा
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# दोन्ही साफ करा
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Success Criteria:**
- [ ] Two environments created with different configurations
- [ ] Both environments deployed successfully
- [ ] Can switch between environments using `azd env select`
- [ ] Environment variables differ between environments
- [ ] Successfully cleaned up both environments

## 📊 Your Progress

**Time Invested**: ~60-90 minutes  
**Skills Acquired**:
- ✅ Template-based project initialization
- ✅ Azure resource provisioning
- ✅ Application deployment workflows
- ✅ Environment management
- ✅ Configuration management
- ✅ Resource cleanup and cost management

**Next Level**: You're ready for [Configuration Guide](configuration.md) to learn advanced configuration patterns!

## Troubleshooting Common Issues

### Authentication Errors
```bash
# Azure सह पुन्हा प्रमाणीकरण करा
az login

# सब्सक्रिप्शन प्रवेश पडताळा
az account show
```

### Deployment Failures
```bash
# डीबग लॉगिंग सक्षम करा
export AZD_DEBUG=true
azd up --debug

# Azure मध्ये अनुप्रयोगाचे लॉग पहा
azd monitor --logs

# Container Apps साठी Azure CLI वापरा:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Resource Name Conflicts
```bash
# एक अद्वितीय पर्यावरण नाव वापरा
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Network Issues
```bash
# पोर्ट्स उपलब्ध आहेत का ते तपासा
netstat -an | grep :3000
netstat -an | grep :3100
```

## Next Steps

आता जेव्हा आपण आपला पहिला प्रकल्प पूर्ण केला आहे, तर हे प्रगत विषय एक्सप्लोर करा:

### 1. Customize Infrastructure
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Set Up CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Complete CI/CD workflows
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline configuration

### 3. Production Best Practices
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Security, performance, and monitoring

### 4. Explore More Templates
```bash
# श्रेणी नुसार टेम्पलेट्स ब्राउझ करा
azd template list --filter web
azd template list --filter api
azd template list --filter database

# विविध तंत्रज्ञान स्टॅक्स वापरून पहा
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Additional Resources

### Learning Materials
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates & Examples
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Congratulations on completing your first azd project!** आता आपण आत्मविश्वासाने Azure वर आश्चर्यकारक अनुप्रयोग तयार आणि तैनात करण्यासाठी तयार आहात.

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला गेला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, तरीही कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अपूर्णता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला जावा. महत्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजांबद्दल किंवा चुकीच्या अर्थलावांबद्दल आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->